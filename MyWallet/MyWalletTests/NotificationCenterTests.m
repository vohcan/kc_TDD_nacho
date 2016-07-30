//
//  NotificationCenterTests.m
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 22/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FakeNotificationCenter.h"
#import "Wallet.h"

@interface NotificationCenterTests : XCTestCase

@end

@implementation NotificationCenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testThatSubscribesToMemoryWarning{
    
    
    FakeNotificationCenter *fake = [FakeNotificationCenter new];
    Wallet * w = [Wallet new];
    
    [w subscribeToMemoryWarning: (NSNotificationCenter*)fake];
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer,w, @"fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotification ");
}



@end
