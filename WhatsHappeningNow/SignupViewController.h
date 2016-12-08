//
//  SignupViewController.h
//  WhatsHappeningNow
//
//  Created by Arun Raut on 10/14/14.
//  Copyright (c) 2014 Sunbi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TPKeyboardAvoidingScrollView;
@interface SignupViewController : UIViewController<UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UISplitViewControllerDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIButton *addUserImage;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
- (IBAction)addUserImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *termandconditionbox;
@property (nonatomic, retain) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
- (IBAction)signupFinal:(id)sender;
- (IBAction)checkCheckBoxClicked:(id)sender;
- (IBAction)howItWorks:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *FirstNameText;
@property (weak, nonatomic) IBOutlet UITextField *LastNameText;
@property (weak, nonatomic) IBOutlet UITextField *PasswordText;
@property (weak, nonatomic) IBOutlet UITextField *ConfirmPasswordText;
@property (weak, nonatomic) IBOutlet UITextField *EmailText;
@property (weak, nonatomic) IBOutlet UITextField *ContactNumberText;

@end
