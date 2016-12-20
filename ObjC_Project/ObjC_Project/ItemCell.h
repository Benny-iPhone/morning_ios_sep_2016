//
//  ItemCell.h
//  ObjC_Project
//
//  Created by Asher   Efrati  on 19/12/2016.
//  Copyright © 2016 Asher   Efrati . All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;
@interface ItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

//+ means its a class method
+ (NSString *) reuseIdentifier;

- (void) configureWithItem:(Item *)item;

@end









