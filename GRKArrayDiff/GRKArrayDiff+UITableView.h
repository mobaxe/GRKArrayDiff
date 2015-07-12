//
//  GRKArrayDiff+UITableView.h
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

#import <Foundation/Foundation.h>
#import "GRKArrayDiff.h"
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

@interface GRKArrayDiff (UITableView)

#if TARGET_OS_IPHONE

/**
 * Updates a given table view based on information contained in this GRKArrayDiff.
 *
 * @param tableView  The target table view to update.
 * @param section    The target section of the table view.
 * @param animation  The animation style to perform when updating the table.
 * @param completion A completion block which will be called once the table has been updated (and animations, if any, have completed). This can be `nil`.
 */
- (void)updateTableView:(nullable UITableView *)tableView section:(NSInteger)section animation:(UITableViewRowAnimation)animation completion:(nullable void(^)(void))completion;

#endif

@end
