//
//  GRKArrayDiffInfo.h
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

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GRKArrayDiffInfoIndexType) {
    GRKArrayDiffInfoIndexTypePrevious,
    GRKArrayDiffInfoIndexTypeCurrent
};

@interface GRKArrayDiffInfo : NSObject

@property (nonatomic,copy,readonly) NSString *identity;
@property (nonatomic,strong,readonly) NSNumber *previousIndex;
@property (nonatomic,strong,readonly) NSNumber *currentIndex;

- (instancetype)initWithIdentity:(NSString *)identity previousIndex:(NSNumber *)previousIndex currentIndex:(NSNumber *)currentIndex;

/**
 * A convenience method for obtaining the property value by enumerated type.
 *
 * @param type The `GRKArrayDiffInfoIndexType` specifying the desired return value.
 *
 * @return The `NSNumber` value associated with the given type.
 */
- (NSNumber *)valueForIndexType:(GRKArrayDiffInfoIndexType)type;

/**
 * A convenience method for creating an `NSIndexPath` object representing the value of the indicated index, in the specified section.
 *
 * @param type    The `GRKArrayDiffInfoIndexType` specifying the desired index.
 * @param section The "section" to use for the index set (in UITableView parlance).
 *
 * @return An `NSIndexPath` representing the indicated index, in the specified section (in UITableView parlance).
 */
- (NSIndexPath *)indexPathForIndexType:(GRKArrayDiffInfoIndexType)type withSection:(NSInteger)section;

- (BOOL)isEqualToArrayDiffInfo:(GRKArrayDiffInfo *)diffInfo;

@end
