//
//  ItemsTableViewController.m
//  ObjC_Project
//
//  Created by Asher   Efrati  on 19/12/2016.
//  Copyright © 2016 Asher   Efrati . All rights reserved.
//

#import "ItemsTableViewController.h"
#import "CreateItemViewController.h"
#import "Item.h"
#import "ItemCell.h"

@interface ItemsTableViewController () <CreateItemViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray <Item*> *tableArray;

@end

@implementation ItemsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.tableArray = [@[] mutableCopy];
        //self.tableArray = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_tableArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = [ItemCell reuseIdentifier];
    ItemCell *cell = /*(ItemCell *)*/[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    // Configure the cell...
    //Item *item = [_tableArray objectAtIndex:indexPath.row];
    Item *item = _tableArray[indexPath.row];
    [cell configureWithItem:item];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@""]) {
        
    }
    
    if ([segue.destinationViewController isKindOfClass:[CreateItemViewController class]]) {
        
        CreateItemViewController *nextVC = segue.destinationViewController;
        nextVC.delegate = self;
        
    }
    
}

#pragma mark - CreateItemViewController Delegate -

- (void) createItemViewController:(CreateItemViewController *)controller didAddItem:(Item *)item{
    
    //[_tableArray addObject:item];
    [_tableArray insertObject:item atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
 
}


@end








