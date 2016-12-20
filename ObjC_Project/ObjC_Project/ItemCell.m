//
//  ItemCell.m
//  ObjC_Project
//
//  Created by Asher   Efrati  on 19/12/2016.
//  Copyright © 2016 Asher   Efrati . All rights reserved.
//

#import "ItemCell.h"
#import "Item.h"
#import "NSDate+niceFormat.h"
#import "NSNumber+price.h"

@implementation ItemCell

+ (NSString *) reuseIdentifier{
    return @"cell";
}

- (void) configureWithItem:(Item *)item{
    _nameLabel.text = item.title;
    _dateLabel.text = [item.date niceFormat];
    _priceLabel.text = [item.price price];
//    _dateLabel.text = [item.date description];
//    _priceLabel.text = [item.price stringValue];
}



@end





