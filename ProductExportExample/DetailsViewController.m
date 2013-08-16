//
//  AppDelegate.h
//  Product Export Example
//
//  Copyright (c) 2013 Buy Me a Pie!. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAmount;
@end

@implementation DetailsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.textFieldName.text = self.product.name;
    self.textFieldAmount.text = self.product.amount;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.product.name = self.textFieldName.text;
    self.product.amount = self.textFieldAmount.text;
}

@end
