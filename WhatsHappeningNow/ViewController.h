//
//  ViewController.h
//  WhatsHappeningNow
//
//  Created by Arun Raut on 10/13/14.
//  Copyright (c) 2014 Sunbi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TPKeyboardAvoidingScrollView;

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIView *whathappeningnowlogo;
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scroll;
- (IBAction)userLogin:(id)sender;
- (IBAction)userSignup:(id)sender;

@end
