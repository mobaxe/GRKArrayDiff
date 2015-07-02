//
//  GRKArrayDiffInfoTest.m
//  GRKArrayDiffLib
//
//  Created by Levi Brown on 7/2/15.
//  Copyright (c) 2015 Levi Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GRKArrayDiffInfo.h"

@interface GRKArrayDiffInfoTest : XCTestCase

@end

@implementation GRKArrayDiffInfoTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//Equal

- (void)test100 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:nil previousIndex:nil currentIndex:nil];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:nil previousIndex:nil currentIndex:nil];
    
    XCTAssert([diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly not euqal (%@ != %@)", diff1, diff2);
}

- (void)test200 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:nil currentIndex:nil];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:nil currentIndex:nil];
    
    XCTAssert([diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly not euqal (%@ != %@)", diff1, diff2);
}

- (void)test300 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:nil previousIndex:@(3) currentIndex:nil];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:nil previousIndex:@(3) currentIndex:nil];
    
    XCTAssert([diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly not euqal (%@ != %@)", diff1, diff2);
}

- (void)test400 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:nil previousIndex:nil currentIndex:@(1)];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:nil previousIndex:nil currentIndex:@(1)];
    
    XCTAssert([diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly not euqal (%@ != %@)", diff1, diff2);
}

- (void)test500 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:@(2)];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:@(2)];
    
    XCTAssert([diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly not euqal (%@ != %@)", diff1, diff2);
}

//Not equal

- (void)test600 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:nil previousIndex:nil currentIndex:nil];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:@(2)];
    
    XCTAssert(![diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly euqal (%@ == %@)", diff1, diff2);
}

- (void)test700 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:nil currentIndex:nil];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:@(2)];
    
    XCTAssert(![diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly euqal (%@ == %@)", diff1, diff2);
}

- (void)test800 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:nil];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:@(2)];
    
    XCTAssert(![diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly euqal (%@ == %@)", diff1, diff2);
}

- (void)test900 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"seven" previousIndex:@(3) currentIndex:@(2)];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:@(2)];
    
    XCTAssert(![diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly euqal (%@ == %@)", diff1, diff2);
}

- (void)test1000 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(2) currentIndex:@(2)];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:@(2)];
    
    XCTAssert(![diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly euqal (%@ == %@)", diff1, diff2);
}

- (void)test1100 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:@(3)];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:@(2)];
    
    XCTAssert(![diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly euqal (%@ == %@)", diff1, diff2);
}

- (void)test1200 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"seven" previousIndex:@(2) currentIndex:@(2)];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:@(2)];
    
    XCTAssert(![diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly euqal (%@ == %@)", diff1, diff2);
}

- (void)test1300 {
    
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"seven" previousIndex:@(2) currentIndex:@(3)];
    GRKArrayDiffInfo *diff2 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:@(2)];
    
    XCTAssert(![diff1 isEqualToArrayDiffInfo:diff2], @"Diffs unexpectedly euqal (%@ == %@)", diff1, diff2);
}

//Index Path

- (void)test2000 {
    
    NSUInteger secton = 0;
    NSUInteger previousIndex = 3;
    NSUInteger currentIndex = 2;
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"seven" previousIndex:@(previousIndex) currentIndex:@(currentIndex)];
    NSUInteger indicies[] = {secton, currentIndex};
    NSIndexPath *expected = [NSIndexPath indexPathWithIndexes:indicies length:2];
    NSIndexPath *received = [diff1 indexPathForIndexType:GRKArrayDiffInfoIndexTypeCurrent withSection:secton];
    
    XCTAssert(received != nil, @"Unexpectedly received `nil`");
    XCTAssert([expected isEqual:received], @"Expected '%@' not equal to received '%@'.", expected, received);
}

- (void)test2100 {
    
    NSUInteger secton = 0;
    NSUInteger previousIndex = 3;
    NSUInteger currentIndex = 2;
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"seven" previousIndex:@(previousIndex) currentIndex:@(currentIndex)];
    NSUInteger indicies[] = {secton, previousIndex};
    NSIndexPath *expected = [NSIndexPath indexPathWithIndexes:indicies length:2];
    NSIndexPath *received = [diff1 indexPathForIndexType:GRKArrayDiffInfoIndexTypePrevious withSection:secton];
    
    XCTAssert(received != nil, @"Unexpectedly received `nil`");
    XCTAssert([expected isEqual:received], @"Expected '%@' not equal to received '%@'.", expected, received);
}

- (void)test3000 {
    
    NSUInteger secton = 0;
    NSUInteger previousIndex = 3;
    NSUInteger currentIndex = 2;
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"seven" previousIndex:@(previousIndex) currentIndex:@(currentIndex)];
    NSIndexPath *expected = [NSIndexPath indexPathForRow:currentIndex inSection:secton];
    NSIndexPath *received = [diff1 indexPathForIndexType:GRKArrayDiffInfoIndexTypeCurrent withSection:secton];
    
    XCTAssert(received != nil, @"Unexpectedly received `nil`");
    XCTAssert([expected isEqual:received], @"Expected '%@' not equal to received '%@'.", expected, received);
}

- (void)test3100 {
    
    NSUInteger secton = 0;
    NSUInteger previousIndex = 3;
    NSUInteger currentIndex = 2;
    GRKArrayDiffInfo *diff1 = [[GRKArrayDiffInfo alloc] initWithIdentity:@"seven" previousIndex:@(previousIndex) currentIndex:@(currentIndex)];
    NSIndexPath *expected = [NSIndexPath indexPathForRow:previousIndex inSection:secton];
    NSIndexPath *received = [diff1 indexPathForIndexType:GRKArrayDiffInfoIndexTypePrevious withSection:secton];
    
    XCTAssert(received != nil, @"Unexpectedly received `nil`");
    XCTAssert([expected isEqual:received], @"Expected '%@' not equal to received '%@'.", expected, received);
}

@end
