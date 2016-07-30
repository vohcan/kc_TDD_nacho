//
//  Wallet.h
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 21/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Wallet : NSObject<Money>
@property (nonatomic,readonly) NSUInteger  count;

-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc;
@end
