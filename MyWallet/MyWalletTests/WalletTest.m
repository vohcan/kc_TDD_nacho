//
//  WalletTest.m
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 21/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"
#import "Broker.h"
#import "Wallet.h"


@interface WalletTest : XCTestCase

@end

@implementation WalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
//40€ +20$ = $100 2:1


-(void) testAdditionWithReduction{
    
    
    Broker *broker = [Broker new];
    [broker addRate: 2 fromCurrency: @"EUR" toCurrency: @"USD"];
    
    Wallet *wallet = [[Wallet alloc]initWithAmount: 40 currency: @"EUR"];
    [wallet plus: [Money dollarWithAmount: 20]];
    
    Money *reduced = [broker reduce: wallet toCurrency: @"USD"];
    XCTAssertEqualObjects(reduced, [Money dollarWithAmount:100], @"40€ +20$ = $100 2:1");
}

@end
