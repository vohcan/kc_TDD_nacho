//
//  Wallet.m
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 21/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import "Wallet.h"
@import UIKit;
@interface Wallet()
@property (nonatomic, strong) NSMutableArray * moneys;
@end

@implementation Wallet
-(NSUInteger) count{
    return [self.moneys count];
}

-(id) initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if (self = [super init]) {
        Money *money = [[Money alloc]initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
        
    }
    return self;
}

-(id<Money>)plus: (Money *)money{
    
    [self.moneys addObject:money];
    return self;
}
-(id<Money>) times:(NSInteger) multiply{
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    for (Money *each in self.moneys) {
        Money *newMoney = [each times:multiply];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

-(id<Money>) reduceToCurrency: (NSString *) currency
                   withBroker: (Broker *) broker{
    
    Money * result= [[Money alloc]initWithAmount:0 currency:currency];
    for (Money *each in self.moneys) {
        result = [result plus: [each reduceToCurrency:currency withBroker:broker]];
    }
    return result;
}


#pragma mark - Notifications

-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc{
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
     //no reconoce UIApplicationDidReceiveMemoryWarningNotification
               name: UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
}

-(void) dumpToDisk: (NSNotification *)notification{
    //guarda las cosas en disco cuando la cosa se ponga fea
}

@end


