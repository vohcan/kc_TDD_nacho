//
//  MoneyTest.m
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 20/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"


@interface MoneyTest : XCTestCase

@end

@implementation MoneyTest

//-(void) testThatTimesRaisesException{
//    Money *money = [[Money alloc]initWithAmount: 1];
//    XCTAssertThrows([money times:2], @"Should raise an exception");
//}

-(void) testCurrencies{
    XCTAssertEqualObjects(@"EUR", [[Money euroWithAmount:1] currency], @"the currency of euros should be EUR");
    XCTAssertEqualObjects(@"USD", [[Money dollarWithAmount:1] currency], @"the currency of dollars should be USD");
}
-(void)testSimpleMultiplication{
    Money *euro = [Money euroWithAmount: 5];
    //[euro times :2];
    //añado instancia de euro
    Money * ten = [Money euroWithAmount:10];
    Money * total = [euro times:2];
    // XCTAssertEqual(total.amount, 10, @"5*2 should be 10" );
    XCTAssertEqualObjects(total, ten);
}
//implementamos test de igualdad
-(void)testEquality{
    Money * five = [Money euroWithAmount:5];
    Money * ten = [Money euroWithAmount:10];
    Money * total = [five times:2];
    XCTAssertEqualObjects(ten, total);
    XCTAssertEqualObjects([Money dollarWithAmount:4], [[Money dollarWithAmount:2] times:2]);
}

//comparar divisas 1 dollar distinto de 1 euro
-(void) testDifferentCurrencies{
    Money * euro = [Money euroWithAmount:1];
    Money * dollar = [Money dollarWithAmount:1];
    XCTAssertNotEqualObjects(euro, dollar, @"different currencies should not be equal");
    
}

-(void) testHash{
    Money * a = [Money euroWithAmount:2];
    Money * b = [Money euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
    XCTAssertEqual([[Money dollarWithAmount:1]hash], [[Money dollarWithAmount:1]hash], @"Equal object must have same hash");
}

-(void) testAmountStorage{
    Money * euro = [Money euroWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"the value retrieved should be the same as stored");
    XCTAssertEqual(2, [[[Money dollarWithAmount:2]performSelector:@selector(amount)]integerValue], @"the value retrieved should be the same as stored");
#pragma clang diagnostic pop
}


//pasamos a la suma de divisas
-(void) testSimpleAddition{
    XCTAssertEqualObjects([[Money dollarWithAmount:5] plus:[Money dollarWithAmount:5]], [Money dollarWithAmount:10], @"$5 + $5 = $10");
}

-(void) testThatHashIsAmount{
    Money *one = [Money dollarWithAmount:1];
    XCTAssertEqual([one hash], 1, @"The hash must be the same as amount");
}

-(void)testDescription{
    Money * one = [Money dollarWithAmount:1];
    NSString * desc = @"<Money: USD 1>";
    XCTAssertEqualObjects(desc, [one description], @"Description must match template");
}
@end
