//
//  UILibraryDemoTests.m
//  UILibraryDemoTests
//
//  Created by Gong Chen on 21/01/2018.
//  Copyright © 2018 Gong Chen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DefaultLayoutViewController.h"
#import "PlaybackViewController.h"

@interface UILibraryDemoTests : XCTestCase

@property DefaultLayoutViewController *defaultVC;
@property PlaybackViewController *pbVC;
@end

@implementation UILibraryDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _pbVC = [ [PlaybackViewController alloc]init];
    //_defaultVC = [ [DefaultLayoutViewController alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDisplayConfirmAlert {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString* expectedString0 = @"Confirm this object?";
    NSString* resultString0 = _pbVC.stringAlertTitleConfirm0;
    XCTAssertEqual(expectedString0, resultString0, @"Testing update string");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
