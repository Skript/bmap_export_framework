//
//  AppDelegate.h
//  Product Export Example
//
//  Copyright (c) 2013 Buy Me a Pie!. All rights reserved.
//

#import "TableViewController.h"
#import "DetailsViewController.h"
#import "Product.h"

#import <BuyMeAPieExporter/BuyMeAPieExporter.h>

@interface TableViewController ()
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSIndexPath *editingIndexPath;
@end

@implementation TableViewController
@synthesize items = _items;
@synthesize editingIndexPath = _editingIndexPath;

#pragma mark - Actions

- (IBAction)actionExportToBuyMeAPie:(id)sender
{
    BuyMeAPieExporter *exporter = [[BuyMeAPieExporter alloc] init];
    [exporter exportItems:self.items listName:@"Products"];
}

- (IBAction)actionAddButton:(UIBarButtonItem *)sender
{
    Product *item = [[Product alloc] init];
    item.name = @"Product";
    
    [self.items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.items.count-1 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark -

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [[NSMutableArray alloc] init];
        
        // Adding default items
        Product *item1 = [[Product alloc] init];
        item1.name = @"Toast";
        Product *item2 = [[Product alloc] init];
        item2.name = @"Milk";
        item2.amount = @"2l";
        
        [_items addObjectsFromArray:@[item1, item2]];
    }
    
    return _items;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // update product at editing index path after coming back from detail view
    if (self.editingIndexPath) {
        [self.tableView reloadRowsAtIndexPaths:@[self.editingIndexPath] withRowAnimation:UITableViewRowAnimationNone];
        self.editingIndexPath = nil;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    Product *item = self.items[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.amount;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.items removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {

        Product *item = [[Product alloc] init];
        item.name = @"Product";
        
        [self.items insertObject:item atIndex:indexPath.row];
        
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"open"]) {
        if ([segue.destinationViewController isKindOfClass:[DetailsViewController class]]) {
            DetailsViewController *detailsVC = segue.destinationViewController;
            
            self.editingIndexPath = [self.tableView indexPathForCell:sender];
            detailsVC.product = self.items[self.editingIndexPath.row];
        }
    }
}

@end
