//
//  BuyMeAPieExporter.h
//  BuyMeAPie
//
//  Copyright (c) 2013 Buy Me a Pie!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPShoppingListItem.h"

#pragma mark -

@interface BuyMeAPieExporter : NSObject

#pragma mark - Properties

/*
 Returns YES if either Buy Me a Pie! or Grocery List Free app is installed.
*/
@property (nonatomic, readonly, getter = isBuyMeAPieInstalled) BOOL buyMeAPieInstalled;

#pragma mark - Methods

/*
 The method checks if Buy Me a Pie! is installed and if so, opens it. The passed items are included in 
 a separate shopping list or in an existing one for the free app version.
 If Buy Me a Pie! is not installed, then the method opens App Store, so the user can download it.
 The array items must conform to the 'BPShoppingListItem' protocol, otherwise the 'Unrecognized selector'
 exception is raised.
 'listName' is optional and can be nil.
*/
- (void)exportItems:(NSArray *)items listName:(NSString *)listName;

@end
