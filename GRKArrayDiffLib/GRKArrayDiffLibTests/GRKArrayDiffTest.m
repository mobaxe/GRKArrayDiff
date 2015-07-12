//
//  GRKArrayDiffTestAppTests.m
//  GRKArrayDiffTestAppTests
//
//  Created by Levi Brown on 6/23/15.
//  Copyright (c) 2015 Levi Brown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "GRKArrayDiff.h"

@interface GRKArrayDiffTest : XCTestCase

@end

@implementation GRKArrayDiffTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test100 {

    NSArray *previousArray = nil;
    NSArray *currentArray = nil;
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];

    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");

    XCTAssert(diff.deletions.count == 0, @"deletions unexpectedly not empty");
    XCTAssert(diff.insertions.count == 0, @"insertions unexpectedly not empty");
    XCTAssert(diff.moves.count == 0, @"moves unexpectedly not empty");
    XCTAssert(diff.modifications.count == 0, @"modifications unexpectedly not empty");
}

- (void)test200 {
    
    NSArray *previousArray = @[];
    NSArray *currentArray = nil;
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    XCTAssert(diff.deletions.count == 0, @"deletions unexpectedly not empty");
    XCTAssert(diff.insertions.count == 0, @"insertions unexpectedly not empty");
    XCTAssert(diff.moves.count == 0, @"moves unexpectedly not empty");
    XCTAssert(diff.modifications.count == 0, @"modifications unexpectedly not empty");
}

- (void)test300 {
    
    NSArray *previousArray = nil;
    NSArray *currentArray = @[];
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    XCTAssert(diff.deletions.count == 0, @"deletions unexpectedly not empty");
    XCTAssert(diff.insertions.count == 0, @"insertions unexpectedly not empty");
    XCTAssert(diff.moves.count == 0, @"moves unexpectedly not empty");
    XCTAssert(diff.modifications.count == 0, @"modifications unexpectedly not empty");
}

- (void)test400 {
    
    NSArray *previousArray = @[];
    NSArray *currentArray = @[];
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    XCTAssert(diff.deletions.count == 0, @"deletions unexpectedly not empty");
    XCTAssert(diff.insertions.count == 0, @"insertions unexpectedly not empty");
    XCTAssert(diff.moves.count == 0, @"moves unexpectedly not empty");
    XCTAssert(diff.modifications.count == 0, @"modifications unexpectedly not empty");
}

- (void)test500 {
    
    NSArray *previousArray = @[@"one"];
    NSArray *currentArray = @[@"one"];
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    XCTAssert(diff.deletions.count == 0, @"deletions unexpectedly not empty");
    XCTAssert(diff.insertions.count == 0, @"insertions unexpectedly not empty");
    XCTAssert(diff.moves.count == 0, @"moves unexpectedly not empty");
    XCTAssert(diff.modifications.count == 0, @"modifications unexpectedly not empty");
}

- (void)test600 {
    
    NSArray *previousArray = @[@"one"];
    NSArray *currentArray = nil;
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    XCTAssert(diff.deletions.count == 1, @"deletions unexpectedly not 1");
    XCTAssert(diff.insertions.count == 0, @"insertions unexpectedly not empty");
    XCTAssert(diff.moves.count == 0, @"moves unexpectedly not empty");
    XCTAssert(diff.modifications.count == 0, @"modifications unexpectedly not empty");
}

- (void)test700 {
    
    NSArray *previousArray = @[@"one"];
    NSArray *currentArray = @[@"one", @"two"];
    NSArray *expectedDeletions = nil;
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"two" previousIndex:nil currentIndex:@(1)] ];
    NSArray *expectedMoves = nil;
    NSArray *expectedModifications = nil;
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test800 {
    
    NSArray *previousArray = @[@"one", @"two"];
    NSArray *currentArray = @[@"one"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"two" previousIndex:@(1) currentIndex:nil] ];
    NSArray *expectedInsertions = nil;
    NSArray *expectedMoves = nil;
    NSArray *expectedModifications = nil;
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test900 {
    
    NSArray *previousArray = @[@"one", @"two"];
    NSArray *currentArray = @[@"one", @"three"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"two" previousIndex:@(1) currentIndex:nil] ];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"three" previousIndex:nil currentIndex:@(1)] ];
    NSArray *expectedMoves = nil;
    NSArray *expectedModifications = nil;
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test1000 {
    
    NSArray *previousArray = @[@"one", @"two", @"five"];
    NSArray *currentArray = @[@"one", @"three", @"two"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"five" previousIndex:@(2) currentIndex:nil] ];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"three" previousIndex:nil currentIndex:@(1)] ];
    NSArray *expectedMoves = nil;
    NSArray *expectedModifications = nil;
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test1100 {
    
    NSArray *previousArray = @[@"one", @"two", @"five"];
    NSArray *currentArray = @[@"one", @"three", @"two"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"five" previousIndex:@(2) currentIndex:nil] ];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"three" previousIndex:nil currentIndex:@(1)] ];
    NSArray *expectedMoves = nil;
    NSArray *expectedModifications = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"one" previousIndex:@(0) currentIndex:@(0)] ];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return [[obj description] isEqualToString:@"one"];
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test1200 {
    
    NSArray *previousArray = @[@"one", @"two", @"three", @"four", @"five", @"seven"];
    NSArray *currentArray = @[@"one", @"three", @"two", @"five", @"six"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(3) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:@"seven" previousIndex:@(5) currentIndex:nil] ];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"six" previousIndex:nil currentIndex:@(4)] ];
    NSArray *expectedMoves = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"two" previousIndex:@(1) currentIndex:@(2)],
                                [[GRKArrayDiffInfo alloc] initWithIdentity:@"three" previousIndex:@(2) currentIndex:@(1)] ];
    NSArray *expectedModifications = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"one" previousIndex:@(0) currentIndex:@(0)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:@"five" previousIndex:@(4) currentIndex:@(3)]];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return [[obj description] isEqualToString:@"one"] ||
        [[obj description] isEqualToString:@"five"] ||
        //"three" should not be considered as modified since it moved.
        [[obj description] isEqualToString:@"three"];
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test1300 {
    
    NSArray *previousArray = @[@"nine", @"eight", @"two", @"three", @"four", @"five", @"seven", @"one", @"ten"];
    NSArray *currentArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"nine" previousIndex:@(0) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:@"ten" previousIndex:@(8) currentIndex:nil] ];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"zero" previousIndex:nil currentIndex:@(0)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:@"six" previousIndex:nil currentIndex:@(6)]];
    NSArray *expectedMoves = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"one" previousIndex:@(7) currentIndex:@(1)],
                                [[GRKArrayDiffInfo alloc] initWithIdentity:@"eight" previousIndex:@(1) currentIndex:@(8)] ];
    NSArray *expectedModifications = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"five" previousIndex:@(5) currentIndex:@(5)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:@"three" previousIndex:@(3) currentIndex:@(3)]];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return [[obj description] isEqualToString:@"five"] ||
        [[obj description] isEqualToString:@"three"] ||
        //"zero" should not be considered as modified since it was inserted.
        [[obj description] isEqualToString:@"zero"] ||
        //"one" should not be considered as modified since it moved.
        [[obj description] isEqualToString:@"one"];
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test1400 {
    
    NSArray *previousArray = @[];
    NSArray *currentArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *expectedDeletions = @[];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"zero" previousIndex:nil currentIndex:@(0)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:@"one" previousIndex:nil currentIndex:@(1)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:@"two" previousIndex:nil currentIndex:@(2)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:@"three" previousIndex:nil currentIndex:@(3)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:nil currentIndex:@(4)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:@"five" previousIndex:nil currentIndex:@(5)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:@"six" previousIndex:nil currentIndex:@(6)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:@"seven" previousIndex:nil currentIndex:@(7)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:@"eight" previousIndex:nil currentIndex:@(8)] ];
    NSArray *expectedMoves = @[];
    NSArray *expectedModifications = @[];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        //Consider everything modified, but we should not receive any modifications since all elements were inserted.
        return YES;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test1500 {
    
    NSArray *previousArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *currentArray = @[];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"zero" previousIndex:@(0) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:@"one" previousIndex:@(1) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:@"two" previousIndex:@(2) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:@"three" previousIndex:@(3) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(4) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:@"five" previousIndex:@(5) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:@"six" previousIndex:@(6) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:@"seven" previousIndex:@(7) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:@"eight" previousIndex:@(8) currentIndex:nil] ];
    NSArray *expectedInsertions = @[];
    NSArray *expectedMoves = @[];
    NSArray *expectedModifications = @[];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        //Consider everything modified, but we should not receive any modifications since all elements were deleted.
        return YES;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test1600 {
    
    NSArray *previousArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *currentArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *expectedDeletions = @[];
    NSArray *expectedInsertions = @[];
    NSArray *expectedMoves = @[];
    NSArray *expectedModifications = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:@"zero" previousIndex:@(0) currentIndex:@(0)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:@"one" previousIndex:@(1) currentIndex:@(1)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:@"two" previousIndex:@(2) currentIndex:@(2)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:@"three" previousIndex:@(3) currentIndex:@(3)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:@"four" previousIndex:@(4) currentIndex:@(4)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:@"five" previousIndex:@(5) currentIndex:@(5)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:@"six" previousIndex:@(6) currentIndex:@(6)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:@"seven" previousIndex:@(7) currentIndex:@(7)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:@"eight" previousIndex:@(8) currentIndex:@(8)] ];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return YES;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test1700 {
    
    NSArray *previousArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *currentArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *expectedDeletions = @[];
    NSArray *expectedInsertions = @[];
    NSArray *expectedMoves = @[];
    NSArray *expectedModifications = @[];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return [obj description];
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test3000 {
    
    NSArray *previousArray = @[@"one"];
    NSArray *currentArray = @[@"one", @"two"];
    NSArray *expectedDeletions = nil;
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"two"] previousIndex:nil currentIndex:@(1)] ];
    NSArray *expectedMoves = nil;
    NSArray *expectedModifications = nil;
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:nil modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test3100 {
    
    NSArray *previousArray = @[@"one", @"two"];
    NSArray *currentArray = @[@"one"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"two"] previousIndex:@(1) currentIndex:nil] ];
    NSArray *expectedInsertions = nil;
    NSArray *expectedMoves = nil;
    NSArray *expectedModifications = nil;
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return nil;
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test3200 {
    
    NSArray *previousArray = @[@"one", @"two"];
    NSArray *currentArray = @[@"one", @"three"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"two"] previousIndex:@(1) currentIndex:nil] ];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"three"] previousIndex:nil currentIndex:@(1)] ];
    NSArray *expectedMoves = nil;
    NSArray *expectedModifications = nil;
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:nil modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test3300 {
    
    NSArray *previousArray = @[@"one", @"two", @"five"];
    NSArray *currentArray = @[@"one", @"three", @"two"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"five"] previousIndex:@(2) currentIndex:nil] ];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"three"] previousIndex:nil currentIndex:@(1)] ];
    NSArray *expectedMoves = nil;
    NSArray *expectedModifications = nil;
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return nil;
    } modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test3400 {
    
    NSArray *previousArray = @[@"one", @"two", @"five"];
    NSArray *currentArray = @[@"one", @"three", @"two"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"five"] previousIndex:@(2) currentIndex:nil] ];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"three"] previousIndex:nil currentIndex:@(1)] ];
    NSArray *expectedMoves = nil;
    NSArray *expectedModifications = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"one"] previousIndex:@(0) currentIndex:@(0)] ];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:nil modifiedBlock:^BOOL(id obj) {
        return [[obj description] isEqualToString:@"one"];
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test3500 {
    
    NSArray *previousArray = @[@"one", @"two", @"three", @"four", @"five", @"seven"];
    NSArray *currentArray = @[@"one", @"three", @"two", @"five", @"six"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"four"] previousIndex:@(3) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"seven"] previousIndex:@(5) currentIndex:nil] ];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"six"] previousIndex:nil currentIndex:@(4)] ];
    NSArray *expectedMoves = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"two"] previousIndex:@(1) currentIndex:@(2)],
                                [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"three"] previousIndex:@(2) currentIndex:@(1)] ];
    NSArray *expectedModifications = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"one"] previousIndex:@(0) currentIndex:@(0)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"five"] previousIndex:@(4) currentIndex:@(3)]];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:nil modifiedBlock:^BOOL(id obj) {
        return [[obj description] isEqualToString:@"one"] ||
        [[obj description] isEqualToString:@"five"] ||
        //"three" should not be considered as modified since it moved.
        [[obj description] isEqualToString:@"three"];
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test3600 {
    
    NSArray *previousArray = @[@"nine", @"eight", @"two", @"three", @"four", @"five", @"seven", @"one", @"ten"];
    NSArray *currentArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"nine"] previousIndex:@(0) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"ten"] previousIndex:@(8) currentIndex:nil] ];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"zero"] previousIndex:nil currentIndex:@(0)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"six"] previousIndex:nil currentIndex:@(6)]];
    NSArray *expectedMoves = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"one"] previousIndex:@(7) currentIndex:@(1)],
                                [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"eight"] previousIndex:@(1) currentIndex:@(8)] ];
    NSArray *expectedModifications = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"five"] previousIndex:@(5) currentIndex:@(5)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"three"] previousIndex:@(3) currentIndex:@(3)]];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:nil modifiedBlock:^BOOL(id obj) {
        return [[obj description] isEqualToString:@"five"] ||
        [[obj description] isEqualToString:@"three"] ||
        //"zero" should not be considered as modified since it was inserted.
        [[obj description] isEqualToString:@"zero"] ||
        //"one" should not be considered as modified since it moved.
        [[obj description] isEqualToString:@"one"];
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test3700 {
    
    NSArray *previousArray = @[];
    NSArray *currentArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *expectedDeletions = @[];
    NSArray *expectedInsertions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"zero"] previousIndex:nil currentIndex:@(0)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"one"] previousIndex:nil currentIndex:@(1)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"two"] previousIndex:nil currentIndex:@(2)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"three"] previousIndex:nil currentIndex:@(3)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"four"] previousIndex:nil currentIndex:@(4)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"five"] previousIndex:nil currentIndex:@(5)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"six"] previousIndex:nil currentIndex:@(6)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"seven"] previousIndex:nil currentIndex:@(7)],
                                     [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"eight"] previousIndex:nil currentIndex:@(8)] ];
    NSArray *expectedMoves = @[];
    NSArray *expectedModifications = @[];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return nil;
    } modifiedBlock:^BOOL(id obj) {
        //Consider everything modified, but we should not receive any modifications since all elements were inserted.
        return YES;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test3800 {
    
    NSArray *previousArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *currentArray = @[];
    NSArray *expectedDeletions = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"zero"] previousIndex:@(0) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"one"] previousIndex:@(1) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"two"] previousIndex:@(2) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"three"] previousIndex:@(3) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"four"] previousIndex:@(4) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"five"] previousIndex:@(5) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"six"] previousIndex:@(6) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"seven"] previousIndex:@(7) currentIndex:nil],
                                    [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"eight"] previousIndex:@(8) currentIndex:nil] ];
    NSArray *expectedInsertions = @[];
    NSArray *expectedMoves = @[];
    NSArray *expectedModifications = @[];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:nil modifiedBlock:^BOOL(id obj) {
        //Consider everything modified, but we should not receive any modifications since all elements were deleted.
        return YES;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test3900 {
    
    NSArray *previousArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *currentArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *expectedDeletions = @[];
    NSArray *expectedInsertions = @[];
    NSArray *expectedMoves = @[];
    NSArray *expectedModifications = @[ [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"zero"] previousIndex:@(0) currentIndex:@(0)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"one"] previousIndex:@(1) currentIndex:@(1)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"two"] previousIndex:@(2) currentIndex:@(2)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"three"] previousIndex:@(3) currentIndex:@(3)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"four"] previousIndex:@(4) currentIndex:@(4)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"five"] previousIndex:@(5) currentIndex:@(5)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"six"] previousIndex:@(6) currentIndex:@(6)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"seven"] previousIndex:@(7) currentIndex:@(7)],
                                        [[GRKArrayDiffInfo alloc] initWithIdentity:[self hashAsString:@"eight"] previousIndex:@(8) currentIndex:@(8)] ];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:^NSString *(id obj) {
        return nil;
    } modifiedBlock:^BOOL(id obj) {
        return YES;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)test4000 {
    
    NSArray *previousArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *currentArray = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight"];
    NSArray *expectedDeletions = @[];
    NSArray *expectedInsertions = @[];
    NSArray *expectedMoves = @[];
    NSArray *expectedModifications = @[];
    
    GRKArrayDiff *diff = [[GRKArrayDiff alloc] initWithPreviousArray:previousArray currentArray:currentArray identityBlock:nil modifiedBlock:^BOOL(id obj) {
        return NO;
    }];
    
    
    XCTAssert(diff.deletions != nil, @"deletions unexpectedly `nil`");
    XCTAssert(diff.insertions != nil, @"insertions unexpectedly `nil`");
    XCTAssert(diff.moves != nil, @"moves unexpectedly `nil`");
    XCTAssert(diff.modifications != nil, @"modifications unexpectedly `nil`");
    
    [self compareReceivedDiffs:diff.deletions withExpectedDiffs:expectedDeletions label:@"deletions"];
    [self compareReceivedDiffs:diff.insertions withExpectedDiffs:expectedInsertions label:@"insertions"];
    [self compareReceivedDiffs:diff.moves withExpectedDiffs:expectedMoves label:@"moves"];
    [self compareReceivedDiffs:diff.modifications withExpectedDiffs:expectedModifications label:@"modifications"];
}

- (void)compareReceivedDiffs:(NSSet *)received withExpectedDiffs:(NSArray *)expected label:(NSString *)label
{
    XCTAssert(received.count == expected.count, @"[%@] Received diff count does not match expected diff count ('%@' != '%@')", label, received, expected);
    for (GRKArrayDiffInfo *expectedDiff in expected)
    {
        BOOL found = NO;
        for (GRKArrayDiffInfo *receivedDiff in received)
        {
            if ([expectedDiff isEqualToArrayDiffInfo:receivedDiff])
            {
                found = YES;
                break;
            }
        }
        XCTAssert(found, @"[%@] Expected diff '%@' not found in received: %@", label, expectedDiff, received);
    }
}

- (NSString *)hashAsString:(id)obj
{
    return [@([obj hash]) stringValue];
}
@end
