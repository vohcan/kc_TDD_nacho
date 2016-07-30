//
//  Broker.m
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 21/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import "Broker.h"
#import "Money.h"

@interface Broker()



@end

@implementation Broker
-(id) init{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    return self;
}


-(id<Money>) reduce: (id<Money>) money
       toCurrency: (NSString *) currency{
  //Double Dispatch
    
    
    return [money reduceToCurrency:currency withBroker:self];
}


-(void) addRate: (NSInteger) rate
   fromCurrency: (NSString *) fromCurrency
     toCurrency: (NSString *)toCurrency{
    
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    
    NSNumber *invRate = @(1.0/rate);
    [self.rates setObject:invRate
                   forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}

#pragma mark - utils

-(NSString *)keyFromCurrency: (NSString *) fromCurrency
                  toCurrency: (NSString *) toCurrency{
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

#pragma mark - Rates
-(void) parseJSONRates: (NSData *)json{
    
    NSError *err = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:json
                                             options:NSJSONReadingAllowFragments
                                               error:&err];
    if (obj != nil) {
        //pillamos los rates y los vamos añadiendo al broker
    }else{
        //no hemos recibido nada: la cagamos
        [NSException raise: @"NoRatesInJSINException"
                    format: @"JSON must carry some data"];
    }
}

@end
