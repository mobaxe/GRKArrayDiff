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

#import "GRKArrayDiff+UICollectionView.h"

@implementation GRKArrayDiff (UICollectionView)

#if TARGET_OS_IPHONE

#pragma mark - UICollectionView

- (void)updateCollectionView:(UICollectionView *)collectionView section:(NSInteger)section completion:(void(^)(void))completion {
    [collectionView performBatchUpdates:^{
        //Deletes
        NSArray *deletions = [self indexPathsForDiffType:GRKArrayDiffTypeDeletions withSection:section];
        if (deletions.count > 0) {
            [collectionView deleteItemsAtIndexPaths:deletions];
        }
        
        //Insertions
        NSArray *insertions = [self indexPathsForDiffType:GRKArrayDiffTypeInsertions withSection:section];
        if (insertions.count > 0) {
            [collectionView insertItemsAtIndexPaths:insertions];
        }

        for (GRKArrayDiffInfo *diffInfo in self.moves) {
            NSIndexPath *previousIndexPath = [diffInfo indexPathForIndexType:GRKArrayDiffInfoIndexTypePrevious withSection:section];
            NSIndexPath *currentIndexPath = [diffInfo indexPathForIndexType:GRKArrayDiffInfoIndexTypeCurrent withSection:section];
            
            [collectionView moveItemAtIndexPath:previousIndexPath toIndexPath:currentIndexPath];
        }

        NSArray *modifications = [self indexPathsForDiffType:GRKArrayDiffTypeModifications withSection:section];
        if (modifications.count > 0) {
            [collectionView reloadItemsAtIndexPaths:modifications];
        }
        
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

#endif //TARGET_OS_IPHONE

@end
