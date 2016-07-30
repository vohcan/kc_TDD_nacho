//
//  Broker.h
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 21/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  "Money.h"
@interface Broker : NSObject
@property (nonatomic, strong) NSMutableDictionary *rates;

-(Money *) reduce: (id<Money>) money toCurrency: (NSString *) currency;

-(void) addRate: (NSInteger) rate
   fromCurrency: (NSString *) fromCurrency
     toCurrency: (NSString *)toCurrency;
-(NSString *)keyFromCurrency: (NSString *) fromCurrency
                  toCurrency: (NSString *) toCurrency;

-(void) parseJSONRates: (NSData *)json;
@end
