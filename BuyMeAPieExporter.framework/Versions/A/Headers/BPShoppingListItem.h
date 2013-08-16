//
//  BPShoppingListItem.h
//  BuyMeAPie
//
//  Copyright (c) 2013 Buy Me a Pie!. All rights reserved.
//

/* Create a class that implements the protocol or add it to your existing model. */
@protocol BPShoppingListItem <NSObject>

@required
/* 'Name' is something like "Buns", "Bread", "Coffee", etc. You are required to impelement this property. */
@property (nonatomic, strong, readonly) NSString *name;

@optional
/* 'Amount' is something like "3", "500 g", "1 liter". The property is optional. */
@property (nonatomic, strong, readonly) NSString *amount;

@end
