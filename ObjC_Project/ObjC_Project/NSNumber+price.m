//
//  NSNumber+price.m
//  ObjC_Project
//
//  Created by Asher   Efrati  on 19/12/2016.
//  Copyright © 2016 Asher   Efrati . All rights reserved.
//

#import "NSNumber+price.h"

@implementation NSNumber (price)

- (NSString *) price{

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    formatter.currencyCode = @"ILS";
    //formatter.locale = [NSLocale localeWithLocaleIdentifier:@"he"];
    return [formatter stringFromNumber:self];
    
}

@end

















