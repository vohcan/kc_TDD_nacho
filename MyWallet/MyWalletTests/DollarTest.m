////
////  DollarTest.m
////  MyWallet
////
////  Created by Nacho Villaverde Montalvo on 20/7/16.
////  Copyright © 2016 vohcan. All rights reserved.
////
//
//#import <XCTest/XCTest.h>
////#import "Dollar.h"
//#import "Money.h"
//
//@interface DollarTest : XCTestCase
//
//@end
//
//@implementation DollarTest
//
//-(void)testMultiplication{
//    Dollar * five = [Money dollarWithAmount: 5];
//    Dollar * total = [five times: 2];
//    Dollar * ten =[Money dollarWithAmount: 10];
//    XCTAssertEqualObjects(ten, total);
//}
//
//
//
//-(void) testEquality{
//    Dollar * five = [Money dollarWithAmount:5];
//    Dollar * total = [five times:2];
//    Dollar * ten = [Money dollarWithAmount:10];
//    XCTAssertEqualObjects(total, ten);
//    XCTAssertFalse([total isEqual: five]);
//}
//
//
//-(void) testHash{
//    Dollar * a = [Money dollarWithAmount:2];
//    Dollar * b = [Money dollarWithAmount:2];
//    
//    XCTAssertEqual([a hash], [b hash], @"Egual object must have same hash");
//    
//}
//
//-(void) testAmountStorage{
//    Dollar * dollar = [Money dollarWithAmount:2];
//
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wundeclared-selector"
//    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)]integerValue], @"the value retrieved should be the same as stored");
//#pragma clang diagnostic pop
//}
//@end
