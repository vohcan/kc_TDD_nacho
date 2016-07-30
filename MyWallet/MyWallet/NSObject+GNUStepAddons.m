//
//  NSObject+GNUStepAddons.m
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 20/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import "NSObject+GNUStepAddons.h"
#import <objc/runtime.h>



@implementation NSObject (GNUStepAddons)

-(id) subclassResponsibility: (SEL)aSel{
    char prefix = class_isMetaClass(object_getClass(self)) ? '+':'-';
    [NSException raise: NSInvalidArgumentException
                format:@"%@%c%@ should be overrriden by its subclass",
     NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    return self;  //not reached
}

@end
