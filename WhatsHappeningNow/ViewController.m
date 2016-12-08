//
//  ViewController.m
//  WhatsHappeningNow
//
//  Created by Arun Raut on 10/13/14.
//  Copyright (c) 2014 Sunbi. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
#import "SignupViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFNetworking.h"
#import "TPKeyboardAvoidingScrollView.h"
NSString* authentication=@"true";
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scroll contentSizeToFit];
    self.navigationController.navigationBarHidden=YES;
	self.userNameText.delegate=self;
    self.passwordText.delegate=self;
    self.userNameText.returnKeyType=UIReturnKeyNext;
        
    
}


- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
	
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(textField == self.userNameText) {
        [textField resignFirstResponder];
        [self.passwordText becomeFirstResponder];
        self.passwordText.returnKeyType=UIReturnKeyDone;
    }
    if (textField==self.passwordText) {
        [self userLogin:nil];
        [textField resignFirstResponder];
        
    }
    return  YES;
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.userNameText resignFirstResponder];
    [self.passwordText resignFirstResponder];
    
}


- (IBAction)userLogin:(id)sender {
    
    if ((self.userNameText.text != nil && ![self.passwordText.text isEqualToString:@""])||(self.passwordText.text != nil && ![self.userNameText.text isEqualToString:@""])){
       
       
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
       
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSDictionary *params = @{@"device": @"iOS",@"app_id": @"",@"email": self.userNameText.text,@"password": self.passwordText.text};
        
        [manager POST:@"http://thesunbi.com/demo/whn/mobileBridge/logIn" parameters:params
         
              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                  
                  
                  NSArray *jsonArray=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                  
                  NSString* message=[jsonArray valueForKey:@"message"];
                  NSString* status=[jsonArray valueForKey:@"status"];
                 
                  if([authentication isEqualToString: status]){
                     HomeViewController *destinationViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"homepage"];
                      
                      //destinationViewController.app_id=[responseObject objectForKey:@"app_id"];
                      
                    [self.navigationController pushViewController:destinationViewController animated:YES];
                  }
                  
                  
                  else{
                      UIAlertView *signupAlert=[[UIAlertView alloc]initWithTitle:@"Authentication Failed!" message:message delegate:self cancelButtonTitle:@"Retry" otherButtonTitles:nil, nil];
                      [signupAlert show];
                      [self.userNameText becomeFirstResponder];
                      
                  }
                  
                  
              } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  
                  
                  [self altertStatus:nil :@"Authentication Failed!"];
                  
              }];
    }else{
        
        
        [self altertStatus:@"Please Enter Username and Password":@"Login Failed!"];
        
    }

    
}

-(void)altertStatus:(NSString*)msg :(NSString*)title{
    
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (IBAction)userSignup:(id)sender {
    
    SignupViewController *destinationViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"signup"];
    [self.navigationController pushViewController:destinationViewController animated:YES];

    
}
@end
