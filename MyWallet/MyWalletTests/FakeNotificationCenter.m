//
//  FakeNotificationCenter.m
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 22/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import "FakeNotificationCenter.h"

@implementation FakeNotificationCenter

-(id)init{
    if (self = [super init]) {
        _observers = [NSMutableDictionary dictionary];
    }
    return self;
}
-(void) addObserver:(id)observer
           selector:(SEL)aSelector
               name: (NSString *)aName
             object: (id)anObject{
    [self.observers setObject:observer
                       forKey:aName];
}

@end
