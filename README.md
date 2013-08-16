
# Buy Me a Pie! Exporter Framework

## Description

You can use this library if you want to share your products or shopping list items using the Buy Me a Pie! application.
For example, in a recipe application you can add a button to send ingredients into a Buy Me a Pie! shopping list.

## Usage

There are only 4 simple steps:

* Add `BuyMeAPieExporter.framework` to your project and target.

* Create a new class that implements `BPShoppingListItem` protocol or add the implementation to one of your existing classes.

```objective-c
@interface RecipeItem : NSObject <BPShoppingListItem>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *amount;
@end
```

* Prepare the array of items.

```objective-c
NSMutableArray *items = [[NSMutableArray alloc] init];
[items addObject:recipeItem];
```

* Launch Buy Me a Pie! with the newly passed items into a shopping list.

```objective-c
BuyMeAPieExporter *exporter = [[BuyMeAPieExporter alloc] init];
[exporter exportItems:items listName:@"Recipe"];
```

## Advanced usage

If you want more control over the process, you can check if Buy Me a Pie! is installed.

```objective-c
if (exporter.buyMeAPieInstalled) {
    [exporter exportItems:items listName:nil];
} else {
    // Show a message to the user offering to install Buy Me a Pie!.
}
```

If the user accepts the offer to install Buy Me a Pie!, you can call:
```objective-c
// The next line will open Buy Me a Pie! in App Store if it is not installed yet. 
[exporter exportItems:@[] listName:nil];
```
