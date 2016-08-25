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
@interface SignUpViewController(){
    
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UIView *contentView;
    
    __weak IBOutlet UIView *containerView_textFields;
    __weak IBOutlet UITextField *textField_userName;
    __weak IBOutlet UITextField *textField_mobileNo;
    __weak IBOutlet UITextField *textField_password;
    __weak IBOutlet UITextField *textField_email;
    float keyboardHeight;

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
    NSLog(@"%f",keyboardFrameBeginRect.size.height);

}

-(void)keyboardWillHide:(NSNotification *)notification{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    [scrollView setContentOffset:CGPointMake(0, 0)];
}

#pragma mark - UIButton Action
- (IBAction)btnActionRegister:(id)sender {
    [AppDelegateCons() setMainTabbarControllerAsWindowRoot];
}
@end
