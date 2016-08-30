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
    
    __weak IBOutlet UIImageView *profileImageView;
    
    __weak IBOutlet UIButton *btnRegister;
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

- (IBAction)btnActionAddImage:(id)sender {
    [self pickImageFromGallery];
}

#pragma mark - UITextField Delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{

}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

-(void)pickImageFromGallery{
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    profileImageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    //UIImage *newImage = image;
}

#pragma mark - UITextField Delegate
- (IBAction)textFieldEditingChanged:(id)sender {
    if (textField_userName.text.length>0 && textField_email.text.length>0 && textField_mobileNo.text.length>0 && textField_password.text.length>0) {
        btnRegister.alpha = 1.0;
        [btnRegister setEnabled:YES];
    }else{
        btnRegister.alpha = 0.5;
        [btnRegister setEnabled:NO];
    }
}

@end
