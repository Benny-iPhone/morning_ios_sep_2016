//
//  CreateItemViewController.h
//  ObjC_Project
//
//  Created by Asher   Efrati  on 19/12/2016.
//  Copyright © 2016 Asher   Efrati . All rights reserved.
//

#import <UIKit/UIKit.h>

@class CreateItemViewController;
@class Item;

@protocol CreateItemViewControllerDelegate <NSObject>

@optional
- (void) createItemViewController:(CreateItemViewController *)controller didAddItem:(Item *)item;

@end

@interface CreateItemViewController : UIViewController

@property (nonatomic, weak) id<CreateItemViewControllerDelegate> delegate;

- (IBAction)tapAction:(id)sender;



@end








