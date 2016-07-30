//
//  FakeNotificationCenter.h
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 22/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FakeNotificationCenter : NSObject
@property (nonatomic,strong) NSMutableDictionary *observers;
-(void) addObserver:(id)observer
           selector:(SEL)aSelector
               name: (NSString *)aName
             object: (id)anObject;
@end
