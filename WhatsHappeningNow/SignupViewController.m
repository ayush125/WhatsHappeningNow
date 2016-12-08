//
//  SignupViewController.m
//  WhatsHappeningNow
//
//  Created by Arun Raut on 10/14/14.
//  Copyright (c) 2014 Sunbi. All rights reserved.
//

#import "SignupViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFNetworking.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "Reachability.h"
BOOL isClicked=NO;
BOOL isCamera;
BOOL isPhotoChoosen=NO;
@interface SignupViewController ()
@property(nonatomic,retain)Reachability *internetReachableFoo;
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property NSString* encodedString;
@end

@implementation SignupViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self.scrollView contentSizeToFit];
    self.userImage.layer.cornerRadius=self.userImage.frame.size.height/2;
    self.userImage.layer.borderWidth=3.0f;
    self.userImage.layer.borderColor=[[UIColor whiteColor]CGColor];
    [self.termandconditionbox setImage:[UIImage imageNamed:@"checkbox-off"]];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.FirstNameText resignFirstResponder];
    [self.LastNameText resignFirstResponder];
    [self.PasswordText resignFirstResponder];
    [self.ConfirmPasswordText resignFirstResponder];
    [self.EmailText resignFirstResponder];
    [self.ContactNumberText resignFirstResponder];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    self.FirstNameText.returnKeyType = UIReturnKeyNext;
    self.LastNameText.returnKeyType=UIReturnKeyNext;
    self.PasswordText.returnKeyType = UIReturnKeyNext;
    self.ConfirmPasswordText.returnKeyType = UIReturnKeyNext;
    self.EmailText.returnKeyType = UIReturnKeyNext;
    
    
    if (textField==self.FirstNameText) {
        [textField resignFirstResponder];
        [self.LastNameText becomeFirstResponder];
    }
    if (textField==self.LastNameText) {
        [textField resignFirstResponder];
        [self.ContactNumberText becomeFirstResponder];
    }
    if (textField==self.ContactNumberText) {
        [textField resignFirstResponder];
        [self.EmailText becomeFirstResponder];
    }
    if (textField==self.EmailText) {
        [textField resignFirstResponder];
        
        [self.PasswordText becomeFirstResponder];
    }
    if (textField==self.PasswordText) {
        [textField resignFirstResponder];
        
        [self.ConfirmPasswordText becomeFirstResponder];
    }
    if (textField==self.ConfirmPasswordText) {
        
        [textField resignFirstResponder];
    }
    
    return YES;
    
    
}


- (IBAction)signupFinal:(id)sender {
    
    
    if(isClicked==YES||isPhotoChoosen==YES){
//        Reachability *reachability = [Reachability reachabilityForInternetConnection];
//        
//        NetworkStatus internetStatus = [reachability currentReachabilityStatus];
//        
//        if (internetStatus != NotReachable)
//            
        
                
                AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                NSDictionary *params = @{@"name":self.FirstNameText.text,
                                         @"last_name": self.LastNameText.text,
                                         @"phone": self.ContactNumberText.text,
                                          @"email": self.EmailText.text,
                                         @"password": self.PasswordText.text,
                                         @"image": self.encodedString,
                                         };
                [manager POST:@"http://thesunbi.com/demo/whn/mobileBridge/signUp" parameters:params
                 
                      success:^(AFHTTPRequestOperation *operation, id responseObject) {
                          
                          if ([self.ConfirmPasswordText.text isEqualToString:self.PasswordText.text]) {
                              
                              
                              dispatch_async(dispatch_get_main_queue(), ^{

                                  
                                  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                      
                                      UIAlertView *signupAlert=[[UIAlertView alloc]initWithTitle:@"Signup Success" message:@"You Signedup Successfully" delegate:self cancelButtonTitle:@"SignUp" otherButtonTitles:nil, nil];
                                      [signupAlert show];                              });
                                  
                              });
                              
                          }
                          else{
                              
                              UIAlertView *passAlert=[[UIAlertView alloc]initWithTitle:@"!Password" message:@"ConfirmPassword Text missmatch!!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                              [passAlert show];
                          }
                          
                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                          NSLog(@"Error: %@", error);
                      }];
            }
    else
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please Accept the terms and conditions to Signup!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
}


-(void) takePhoto
{
    isPhotoChoosen=YES;
    if ([UIImagePickerController
         isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO)
    {
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Camera Unavailable"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:NULL];
    
}

-(void) pickPhoto
{
    isPhotoChoosen=YES;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    if(isCamera==YES){
        UIImageWriteToSavedPhotosAlbum (chosenImage, nil, nil , nil);
    }
    
    if (chosenImage) {
        self.userImage.image = chosenImage;
        
    } else {
        self.userImage.image = [UIImage imageNamed:@"nil"];
    }
    self.userImage.contentMode = UIViewContentModeScaleAspectFit;
    
    
    NSData *imageData = UIImageJPEGRepresentation(chosenImage, 1.0);
    self.encodedString = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}



- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex)
        return;
    switch (buttonIndex) {
        case 0:
            [self takePhoto];
            break;
        case 1:
            [self pickPhoto];
        break; }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Server Response" message:@"Your Image Uploaded Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}



-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

-(UIImagePickerController *) imagePicker
{
    if (_imagePicker == nil) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
    }
    return _imagePicker;
}


- (IBAction)checkCheckBoxClicked:(id)sender {
    
    if(isClicked==NO){
        [self.termandconditionbox setImage:[UIImage imageNamed:@"checkbox-on"]];
        isClicked=YES;
        
    
    }else{
          [self.termandconditionbox setImage:[UIImage imageNamed:@"checkbox-off"]];
         isClicked=NO;
    }
}

- (IBAction)howItWorks:(id)sender {
}
- (IBAction)addUserImage:(id)sender {
    
    isCamera=YES;
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Camera Unavailable"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:nil, nil];
        [alert show];
        [self pickPhoto];
        
        return;
    }
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil                                                                                   delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Use Camera", @"Access Gallery", nil];
    
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
    
}
@end
