//
//  SignUpViewController.m
//  DigiCity
//
//  Created by Naveen on 24/08/16.
//  Copyright © 2016 Varun. All rights reserved.
//

#import "SignUpViewController.h"
#import "AppDelegate.h"
#import "Constants.h"
@interface SignUpViewController()<UITextFieldDelegate>{
    
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UIView *contentView;
    
    __weak IBOutlet UIView *containerView_textFields;
    __weak IBOutlet UITextField *textField_userName;
    __weak IBOutlet UITextField *textField_mobileNo;
    __weak IBOutlet UITextField *textField_password;
    __weak IBOutlet UITextField *textField_email;
    float keyboardHeight;

    
    //Constraints
    __weak IBOutlet NSLayoutConstraint *constraints_scrollView_top;
    
}


@end

@implementation SignUpViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setKeyBoardObserver];
}

#pragma mark - Keyboard notification Center
-(void)setKeyBoardObserver{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardWillShow:(NSNotification *)notification{
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
    keyboardHeight = keyboardFrameBeginRect.size.height;
    constraints_scrollView_top.constant = -keyboardHeight;
    NSLog(@"%f",keyboardFrameBeginRect.size.height);

}

-(void)keyboardWillHide:(NSNotification *)notification{
    constraints_scrollView_top.constant = 0;
}

#pragma mark - UIButton Action
- (IBAction)btnActionRegister:(id)sender {
    [AppDelegateCons() setMainTabbarControllerAsWindowRoot];
}

#pragma mark - UITextField Delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{

}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
@end
