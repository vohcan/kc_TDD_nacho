//
//  ControllerTest.m
//  MyWallet
//
//  Created by Nacho Villaverde Montalvo on 22/7/16.
//  Copyright © 2016 vohcan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleViewController.h"
#import "WalletTableViewController.h"
#import "Wallet.h"

@interface ControllerTest : XCTestCase
@property (nonatomic, strong)SimpleViewController * simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) WalletTableViewController *walletVC;
@property (nonatomic, strong) Wallet *wallet;
@end

@implementation ControllerTest

- (void)setUp {
    [super setUp];
    // creamos el entorno
    self.simpleVC = [[SimpleViewController alloc]initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    self.wallet = [[Wallet alloc]initWithAmount:1 currency:@"USD"];
    [self.wallet plus: [Money euroWithAmount:1]];
    self.walletVC= [[WalletTableViewController alloc]initWithModel:self.wallet];
    
}

- (void)tearDown {
    // Lo destruimos
    [super tearDown];
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}


-(void)testThatTextOnLabelIsEqualToTextOnButton{
    
    //mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    
    //comprobamos etiqueta y boton tienen mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same tex" );
    
    
}

-(void) testThatTablehasOneSection{
    
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, 1, @"there can only be one");
}
-(void) testThatNumberOfCellsIsNumberOfMoneysPlusOne{
    XCTAssertEqual(self.wallet.count +1,[self.walletVC tableView: nil numberOfRowsInSection:0],@"Number of cells is the nomber of moneys plus 1" );
}

@end
