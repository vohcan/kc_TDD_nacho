//
//  WalletTableViewController.h
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 22/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wallet;

@interface WalletTableViewController : UITableViewController
-(id) initWithModel :(Wallet *)model;

@end
