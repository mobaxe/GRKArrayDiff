//
//  GRKArrayDiff+UITableView.m
//
//  Created by Levi Brown on July 12, 2015.
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

#import "GRKArrayDiff+UITableView.h"

@implementation GRKArrayDiff (UITableView)

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

@end
