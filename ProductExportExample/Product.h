//
//  AppDelegate.h
//  Product Export Example
//
//  Copyright (c) 2013 Buy Me a Pie!. All rights reserved.
//

#import <BuyMeAPieExporter/BuyMeAPieExporter.h>

@interface Product : NSObject <BPShoppingListItem>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *amount;
@end
