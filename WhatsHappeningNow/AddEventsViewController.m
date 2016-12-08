//
//  AddEventsViewController.m
//  WhatsHappeningNow
//
//  Created by Arun Raut on 10/14/14.
//  Copyright (c) 2014 Sunbi. All rights reserved.
//

#import "AddEventsViewController.h"
#import "AddActivityViewController.h"
@interface AddEventsViewController ()

@end

@implementation AddEventsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
   self.eventName.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
}
- (void)viewWillAppear
{
    
    self.navigationController.navigationBarHidden=NO;
	
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.eventsName resignFirstResponder];
    [self.eventName resignFirstResponder];
    [self.addDescription resignFirstResponder];
    [self.startondateOutlet resignFirstResponder];
    [self.endonDateOutlet resignFirstResponder];
    [self.addimage resignFirstResponder];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    return YES;
    
    
}



- (IBAction)addImage:(id)sender {
    
    
    
}

- (IBAction)addActivities:(id)sender {
    
    
    AddActivityViewController *destinationViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"addactivityviewcontroller"];
    [self.navigationController pushViewController:destinationViewController animated:YES];
    

    
    
}

- (IBAction)addEvents:(id)sender {
}

- (IBAction)startonDate:(id)sender {
    
    self.datePicker = [[UIDatePicker alloc]init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.datePicker addTarget:self action:@selector(startDateChanged) forControlEvents:UIControlEventValueChanged];
    self.startondateOutlet.inputView = self.datePicker;
    
    
    
}

- (void)startDateChanged
{
    NSDate *date = self.datePicker.date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateStyle:NSDateFormatterMediumStyle];
    self.startondateOutlet.text = [dateFormat stringFromDate:date];
    
}
- (void)endDateChanged
{
    NSDate *date = self.datePicker.date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateStyle:NSDateFormatterMediumStyle];
   
    self.endonDateOutlet.text = [dateFormat stringFromDate:date];
}

- (IBAction)endonDate:(id)sender {
    
    self.datePicker = [[UIDatePicker alloc]init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.datePicker addTarget:self action:@selector(endDateChanged) forControlEvents:UIControlEventValueChanged];
    
    self.endonDateOutlet.inputView = self.datePicker;
}
@end
