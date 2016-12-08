//
//  AddActivityViewController.h
//  WhatsHappeningNow
//
//  Created by Arun Raut on 10/15/14.
//  Copyright (c) 2014 Sunbi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddActivityViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *addActivityName;
@property (weak, nonatomic) IBOutlet UITextField *addStartonActivity;
@property (weak, nonatomic) IBOutlet UITextField *addEndonActivity;
@property (weak, nonatomic) IBOutlet UITextField *addAddressActivity;
@property (weak, nonatomic) IBOutlet UITextField *addContactActivity;
@property (weak, nonatomic) IBOutlet UITextField *addDescriptionActivity;
@property (weak, nonatomic) IBOutlet UITextField *addDesriptionsecond;
@property (weak, nonatomic) IBOutlet UITextField *addDescriptionThird;
@property (weak, nonatomic) IBOutlet UITextField *addCostActivity;

- (IBAction)addActivity:(id)sender;


@end
