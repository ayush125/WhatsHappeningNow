//
//  AddEventsViewController.h
//  WhatsHappeningNow
//
//  Created by Arun Raut on 10/14/14.
//  Copyright (c) 2014 Sunbi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventsViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *eventName;
@property (weak, nonatomic) IBOutlet UITextField *eventsName;
@property (weak, nonatomic) IBOutlet UITextView *addDescription;
- (IBAction)addImage:(id)sender;
- (IBAction)addActivities:(id)sender;
- (IBAction)addEvents:(id)sender;
- (IBAction)startonDate:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *startondateOutlet;
@property (weak, nonatomic) IBOutlet UITextField *endonDateOutlet;
@property (nonatomic,strong) IBOutlet UIDatePicker *datePicker;
- (IBAction)endonDate:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addimage;

@end
