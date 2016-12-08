//
//  HomeViewController.h
//  WhatsHappeningNow
//
//  Created by Arun Raut on 10/13/14.
//  Copyright (c) 2014 Sunbi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *userImage;
- (IBAction)eventButtonClicked:(id)sender;
- (IBAction)invitationButtonClicked:(id)sender;
- (IBAction)addeventButtonClicked:(id)sender;
- (IBAction)prfileButtonClicked:(id)sender;
- (IBAction)promotionButtonClicked:(id)sender;
- (IBAction)helpButtonClicked:(id)sender;
@property NSArray* app_id;
@end
