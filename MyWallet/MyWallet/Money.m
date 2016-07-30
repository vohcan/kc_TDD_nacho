//
//  Money.m
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 20/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"
#import "Broker.h"
//#import "Money-Private.h"
//#import "Euro.h"
//#import "Dollar.h"

//@interface Money()
//
//@property (nonatomic) NSInteger amount;
//@end
@interface Money ()
@property (nonatomic, strong) NSNumber *amount;
@end

@implementation Money


+(id) euroWithAmount: (NSInteger) amount{
    return [[Money alloc]initWithAmount:amount currency:@"EUR"];
    
}
+(id) dollarWithAmount: (NSInteger) amount{
    return [[Money alloc]initWithAmount:amount currency:@"USD"];
}

-(instancetype)initWithAmount: (NSInteger) amount currency:(NSString *)currency{
    if(self = [super init]){
        _amount = @(amount);
        _currency = currency;
        
    }
    return self;
}

//-(Money *) times: (NSInteger) multiply{
//    //no se deberia llamar deberia usar la de la subclase
//    //return self;
//    return [self subclassResponsibility:_cmd];
//}

-(id<Money>) times: (NSInteger) multiply{
    
    Money *newMoney = [[Money  alloc]initWithAmount:[self.amount integerValue]* multiply currency:self.currency];
    
    return newMoney;

}

-(id<Money>) plus: (Money *) other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    Money * total = [[Money alloc] initWithAmount:totalAmount currency:self.currency];
    
    return total;
}

-(id<Money>) reduceToCurrency: (NSString *) currency
                   withBroker: (Broker *) broker{
    
    Money * result;
    double rate = [[broker.rates
                    objectForKey:[broker keyFromCurrency:self.currency
                                            toCurrency:currency]]doubleValue];
    //comprobamos que divisa de origen y destino son las mismas
    if ([self.currency isEqual:currency]) {
        result = self;
    }else if (rate == 0){
        //No hay tasa de conversion- excepcion
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@", self.currency, currency];
    }else{
        //tenemos conversion
//        double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency
//                                                           toCurrency:currency]]doubleValue];
        
        NSInteger newAmount = [self.amount integerValue] * rate;
        result = [[Money alloc]
                  initWithAmount:newAmount
                  currency:currency];
    }
    
    
    return result;
}


#pragma mark - OverWritten




-(NSString *) description{
    //return [NSString stringWithFormat:@"<%@ %ld>", [self class], (long)[self amount]];
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], self.currency , self.amount];
}

-(BOOL) isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency]]) {
        return [self amount] == [object amount];
    }else{
        return NO;
    }

    
}

-(NSUInteger) hash{
    //return (NSUInteger) self.amount;
    return [self.amount integerValue];
}
@end
