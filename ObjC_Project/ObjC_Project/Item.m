//
//  Item.m
//  ObjC_Project
//
//  Created by Asher   Efrati  on 19/12/2016.
//  Copyright © 2016 Asher   Efrati . All rights reserved.
//

#import "Item.h"

@implementation Item

- (instancetype) initWithTitle:(NSString *)title price:(NSNumber *)price date:(NSDate *)date{
    
    if (self = [self init]) {
        self.title = title;
        self.price = price;
        self.date = date;
    }
    
    return self;
    
}

- (void) doSomething{
//    char *str = "c string";
//    str = strcat(str, "hello");
    NSLog(@"doing something");
}
- (void) doSomethingWithNum:(NSNumber *)num{
    NSLog(@"doing something with %@",num);
}
- (void) doSomethingWithNum:(NSNumber *)num str:(NSString *)str{
    NSLog(@"doing something with %@ and %@",num,str);
}

@end





