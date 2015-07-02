//
//  GRKArrayDiff.m
//
//  Created by Levi Brown on June 23, 2015.
//  Copyright (c) 2015 Levi Brown <mailto:levigroker@gmail.com>
//  This work is licensed under the Creative Commons Attribution 3.0
//  Unported License. To view a copy of this license, visit
//  http://creativecommons.org/licenses/by/3.0/ or send a letter to Creative
//  Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041,
//  USA.
//
//  The above attribution and the included license must accompany any version
//  of the source code. Visible attribution in any binary distributable
//  including this work (or derivatives) is not required, but would be
//  appreciated.
//

#import "GRKArrayDiff.h"

@interface GRKArrayDiff ()

@property (nonatomic,strong,readwrite) NSSet *deletions;
@property (nonatomic,strong,readwrite) NSSet *insertions;
@property (nonatomic,strong,readwrite) NSSet *moves;
@property (nonatomic,strong,readwrite) NSSet *modifications;

@end

@implementation GRKArrayDiff

#pragma mark - Lifecycle

- (instancetype)initWithPreviousArray:(NSArray *)previousArray currentArray:(NSArray *)currentArray identityBlock:(NSString *(^)(id obj))identityBlock modifiedBlock:(BOOL(^)(id obj))modifiedBlock
{
    if ((self = [super init]))
    {
        __autoreleasing NSMutableDictionary *previousIdentityIndexes = nil;
        __autoreleasing NSMutableOrderedSet *previousIdentities = nil;
        [self populateIdentityIndex:&previousIdentityIndexes identitySet:&previousIdentities forArray:previousArray withIdentityBlock:identityBlock];
        
        __autoreleasing NSMutableDictionary *currentIdentityIndexes = nil;
        __autoreleasing NSMutableOrderedSet *currentIdentities = nil;
        [self populateIdentityIndex:&currentIdentityIndexes identitySet:&currentIdentities forArray:currentArray withIdentityBlock:identityBlock];

        NSMutableDictionary *offsets = [NSMutableDictionary dictionary];
    
        //Deletions are those which were in the previous set but are not in the current set
        NSMutableSet *deletions = [NSMutableSet set];
        NSMutableOrderedSet *deletedIdentities = [NSMutableOrderedSet orderedSetWithOrderedSet:previousIdentities];
        [deletedIdentities minusOrderedSet:currentIdentities];
        for (NSString *identity in deletedIdentities)
        {
            NSNumber *previousIndex = previousIdentityIndexes[identity];
            
            GRKArrayDiffInfo *diffInfo = [[GRKArrayDiffInfo alloc] initWithIdentity:identity previousIndex:previousIndex currentIndex:nil];
            [deletions addObject:diffInfo];
            
            //Deletion of an element moved all elements with a larger index down.
            [self increment:NO offsets:offsets forOrderedSet:previousIdentities fromIndex:previousIndex.integerValue + 1];
        }
        self.deletions = [NSSet setWithSet:deletions];
        
        //Insertions are those which are in the current set but were not in the previous set
        NSMutableSet *insertions = [NSMutableSet set];
        NSMutableOrderedSet *insertedIdentities = [NSMutableOrderedSet orderedSetWithOrderedSet:currentIdentities];
        [insertedIdentities minusOrderedSet:previousIdentities];
        for (NSString *identity in insertedIdentities)
        {
            NSNumber *currentIndex = currentIdentityIndexes[identity];
            
            GRKArrayDiffInfo *diffInfo = [[GRKArrayDiffInfo alloc] initWithIdentity:identity previousIndex:nil currentIndex:currentIndex];
            [insertions addObject:diffInfo];

            //Insertion of an element moved all elements with a larger index up.
            [self increment:YES offsets:offsets forOrderedSet:currentIdentities fromIndex:currentIndex.integerValue + 1];
        }
        self.insertions = [NSSet setWithSet:insertions];
        
        //Moves are those which exist in the previous set, still exist in the current set,
        //and have a changed index not as a result of deletion(s) or insertion(s).
        //Modifications are those preexisting which didn't move, and are considered modified.
        NSMutableOrderedSet *preexisting = [NSMutableOrderedSet orderedSetWithOrderedSet:currentIdentities];
        [preexisting minusOrderedSet:insertedIdentities];
        
        NSMutableSet *moves = [NSMutableSet set];
        NSMutableSet *modifications = [NSMutableSet set];
        for (NSString *identity in preexisting)
        {
            NSNumber *previousIndex = previousIdentityIndexes[identity];
            NSNumber *currentIndex = currentIdentityIndexes[identity];
            //`delta` is the raw indicie vector between the previous index and the current index.
            NSInteger delta = [currentIndex integerValue] - [previousIndex integerValue];
            //`offset` is the indicie vector for this element caused by deletions and insertions
            NSInteger offset = [offsets[identity] integerValue];

            //If the element is considered to have moved, its `offset` will be different from its `delta`
            BOOL moved = offset != delta;
            
            if (moved)
            {
                GRKArrayDiffInfo *diffInfo = [[GRKArrayDiffInfo alloc] initWithIdentity:identity previousIndex:previousIndex currentIndex:currentIndex];
                [moves addObject:diffInfo];
            }
            else
            {
                //It didn't move, so let's see if it is modified
                id obj = [currentArray objectAtIndex:[currentIndex unsignedIntegerValue]];
                BOOL modified = modifiedBlock == nil ? NO : modifiedBlock(obj);
                if (modified)
                {
                    GRKArrayDiffInfo *diffInfo = [[GRKArrayDiffInfo alloc] initWithIdentity:identity previousIndex:previousIndex currentIndex:currentIndex];
                    [modifications addObject:diffInfo];
                }
            }
        }
        self.moves = [NSSet setWithSet:moves];
        self.modifications = [NSSet setWithSet:modifications];
    }
    
    return self;
}

#pragma mark - Implementation

- (NSSet *)diffInfoSetForType:(GRKArrayDiffType)type
{
    NSSet *retVal = nil;
    
    switch (type) {
        case GRKArrayDiffTypeDeletions:
            retVal = self.deletions;
            break;
        case GRKArrayDiffTypeInsertions:
            retVal = self.insertions;
            break;
        case GRKArrayDiffTypeMoves:
            retVal = self.moves;
            break;
        case GRKArrayDiffTypeModifications:
            retVal = self.modifications;
            break;
        default:
            NSLog(@"[ERROR] GRKArrayDiff: Unhandled case (%d) for `diffInfoSetForType:`", (int)type);
            break;
    }
    
    return retVal;
}

- (NSArray *)indexPathsForDiffType:(GRKArrayDiffType)diffType withSection:(NSInteger)section
{
    NSMutableArray *retVal = nil;
    
    NSSet *diffInfoSet = [self diffInfoSetForType:diffType];
    if (diffInfoSet)
    {
        GRKArrayDiffInfoIndexType indexType;
        BOOL proceed = YES;
        switch (diffType) {
            case GRKArrayDiffTypeDeletions:
                indexType = GRKArrayDiffInfoIndexTypePrevious;
                break;
            case GRKArrayDiffTypeInsertions:
                indexType = GRKArrayDiffInfoIndexTypeCurrent;
                break;
            case GRKArrayDiffTypeMoves:
                indexType = GRKArrayDiffInfoIndexTypeCurrent;
                break;
            case GRKArrayDiffTypeModifications:
                indexType = GRKArrayDiffInfoIndexTypeCurrent;
                break;
            default:
                proceed = NO;
                NSLog(@"[ERROR] GRKArrayDiff: Unhandled case (%d) for `indexPathsForDiffType:withSection:`", (int)diffType);
                break;
        }

        if (proceed)
        {
            NSMutableArray *indexPaths = [NSMutableArray array];
            for (GRKArrayDiffInfo *diffInfo in diffInfoSet)
            {
                NSIndexPath *indexPath = [diffInfo indexPathForIndexType:indexType withSection:section];
                if (indexPath)
                {
                    [indexPaths addObject:indexPath];
                }
            }
            
            if (indexPaths.count > 0)
            {
                retVal = indexPaths;
            }
        }
    }
    
    return retVal;
}

#if TARGET_OS_IPHONE

#pragma mark - UITableView

- (void)updateTableView:(UITableView *)tableView section:(NSInteger)section animation:(UITableViewRowAnimation)animation completion:(void(^)(void))completion
{
    [CATransaction begin];
    
    [tableView beginUpdates];
    
    //Deletes
    NSArray *deletions = [self indexPathsForDiffType:GRKArrayDiffTypeDeletions withSection:section];
    if (deletions.count > 0)
    {
        [tableView deleteRowsAtIndexPaths:deletions withRowAnimation:animation];
    }
    
    //Insertions
    NSArray *insertions = [self indexPathsForDiffType:GRKArrayDiffTypeInsertions withSection:section];
    if (insertions.count > 0)
    {
        [tableView insertRowsAtIndexPaths:insertions withRowAnimation:animation];
    }
    
    //Moves
    if (self.moves.count > 0)
    {
        for (GRKArrayDiffInfo *diffInfo in self.moves)
        {
            NSIndexPath *previousIndexPath = [diffInfo indexPathForIndexType:GRKArrayDiffInfoIndexTypePrevious withSection:section];
            NSIndexPath *currentIndexPath = [diffInfo indexPathForIndexType:GRKArrayDiffInfoIndexTypeCurrent withSection:section];
            
            [tableView moveRowAtIndexPath:previousIndexPath toIndexPath:currentIndexPath];
        }
    }
    
    [tableView endUpdates];
    
    //Modifications
    [CATransaction setCompletionBlock: ^{
        
        //Reload modified items after all other batch updates so the table view will
        //not throw an exception about duplicate animations being applied to cells.
        
        [CATransaction begin];
        
        NSArray *modifications = [self indexPathsForDiffType:GRKArrayDiffTypeModifications withSection:section];
        if (modifications.count > 0)
        {
            [tableView reloadRowsAtIndexPaths:modifications withRowAnimation:animation];
        }
        
        if (completion)
        {
            [CATransaction setCompletionBlock: ^{
                completion();
            }];
        }

        [CATransaction commit];
    }];
    
    [CATransaction commit];
}

#endif //TARGET_OS_IPHONE

#pragma mark - Helpers

- (void)populateIdentityIndex:(NSMutableDictionary **)identityIndex identitySet:(NSMutableOrderedSet **)identitySet forArray:(NSArray *)array withIdentityBlock:(NSString *(^)(id obj))identityBlock
{
    *identityIndex = [NSMutableDictionary dictionary];
    *identitySet = [NSMutableOrderedSet orderedSetWithCapacity:array.count];
    
    if (identityBlock)
    {
        for (NSUInteger index = 0; index < array.count; ++index)
        {
            NSString *identity = identityBlock(array[index]);
            if (identity)
            {
                NSNumber *indexObj = @(index);
                [*identityIndex setObject:indexObj forKey:identity];
                [*identitySet addObject:identity];
            }
        }
    }
}

- (void)increment:(BOOL)increment offsets:(NSMutableDictionary *)offsets forOrderedSet:(NSOrderedSet *)orderedSet fromIndex:(NSUInteger)index
{
    NSInteger delta = increment ? 1 : -1;
    
    for (NSUInteger i = index; i < orderedSet.count; ++i)
    {
        NSString *identity = [orderedSet objectAtIndex:i];
        NSInteger value = [offsets[identity] integerValue];
        offsets[identity] = @(value + delta);
    }
}

@end
