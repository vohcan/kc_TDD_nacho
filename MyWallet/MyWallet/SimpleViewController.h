//
//  SimpleViewController.h
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 22/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)displayText:(id)sender;

@end
