////
////  EuroTests.m
////  MyWallet
////
////  Created by Nacho Villaverde Montalvo on 18/7/16.
////  Copyright © 2016 vohcan. All rights reserved.
////
//
//#import <XCTest/XCTest.h>
////#import "Euro.h"
//#import "Money.h"
//
//@interface EuroTests : XCTestCase
//
//@end
//
//@implementation EuroTests
//
//- (void)setUp {
//    [super setUp];
//    // Put setup code here. This method is called before the invocation of each test method in the class.
//}
//
//- (void)tearDown {
//    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    [super tearDown];
//}
//
//-(void)testSimpleMultiplication{
//    Euro *euro = [Money euroWithAmount: 5];
//    //[euro times :2];
//    //añado instancia de euro
//    Euro * ten = [Money euroWithAmount:10];
//    Euro * total = [euro times:2];
//   // XCTAssertEqual(total.amount, 10, @"5*2 should be 10" );
//    XCTAssertEqualObjects(total, ten);
//}
////implementamos test de igualdad
//-(void)testEquality{
//    Euro * five = [Money euroWithAmount:5];
//    Euro * ten = [Money euroWithAmount:10];
//    Euro * total = [five times:2];
//    XCTAssertEqualObjects(ten, total);
//}
//
//
//
//-(void) testHash{
//    Euro * a = [Money euroWithAmount:2];
//    Euro * b = [Money euroWithAmount:2];
//    
//    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
//    
//}
//
//-(void) testAmountStorage{
//    Euro * euro = [Money euroWithAmount:2];
//
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wundeclared-selector"
//    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"the value retrieved should be the same as stored");
//#pragma clang diagnostic pop
//}
//@end
