//
//  Item.h
//  ObjC_Project
//
//  Created by Asher   Efrati  on 19/12/2016.
//  Copyright © 2016 Asher   Efrati . All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Item : NSObject
//{
//    NSString *title;
//}
//
//- (void) setTitle:(NSString *)title;
//- (NSString *) title;

//var title : String?
@property (nonatomic, strong)  NSString * /*_Nullable*/ title;
@property (nonatomic, strong) NSNumber *price;
//@property (nonatomic, assign) double price; //primitive

@property (nonatomic, strong) NSDate *date;

- (instancetype) initWithTitle:(NSString *)title price:(NSNumber *)price date:(NSDate *)date;

- (void) doSomething;
- (void) doSomethingWithNum:(NSNumber *)num;
- (void) doSomethingWithNum:(NSNumber *)num str:(NSString *)str;

@end














