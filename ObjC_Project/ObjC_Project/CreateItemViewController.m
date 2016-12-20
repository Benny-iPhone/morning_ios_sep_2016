//
//  CreateItemViewController.m
//  ObjC_Project
//
//  Created by Asher   Efrati  on 19/12/2016.
//  Copyright © 2016 Asher   Efrati . All rights reserved.
//

#import "CreateItemViewController.h"
#import "Item.h"

@interface CreateItemViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@end

@implementation CreateItemViewController
@synthesize priceTextField = priceTF;//define setting & getter

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.priceTextField.keyboardType = UIKeyboardTypeNumberPad;
    //_priceTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    //[[self priceTextField] setKeyboardType:UIKeyboardTypeNumberPad];
    
    //priceTF.keyboardType = UIKeyboardTypeNumberPad;
}

- (IBAction)createAction:(id)sender {
    Item *item = [[Item alloc] init];
    item.title = _titleTextField.text;
    item.price = @([[priceTF text] integerValue]);
    item.date = self.datePicker.date;
    
    //makes sure that delegate is not nil, and delegate implemented the method
    if ([_delegate respondsToSelector:@selector(createItemViewController:didAddItem:)]) {
        
        [_delegate createItemViewController:self didAddItem:item];
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)tapAction:(id)sender {
    [_titleTextField resignFirstResponder];
    [priceTF resignFirstResponder];
    
}
@end











