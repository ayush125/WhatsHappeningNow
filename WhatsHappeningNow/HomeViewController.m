//
//  HomeViewController.m
//  WhatsHappeningNow
//
//  Created by Arun Raut on 10/13/14.
//  Copyright (c) 2014 Sunbi. All rights reserved.
//

#import "HomeViewController.h"
#import "EventsViewController.h"
#import "AddEventsViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;

    self.userImage.layer.cornerRadius=self.userImage.frame.size.height/2;
    self.userImage.layer.borderWidth=3.0f;
    self.userImage.layer.borderColor=[[UIColor whiteColor]CGColor];
   
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
	
}


- (IBAction)eventButtonClicked:(id)sender {
    
    EventsViewController *destinationViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"eventsViewController"];
    [self.navigationController pushViewController:destinationViewController animated:YES];
    self.navigationItem.title=@"EVENTS";
    
}

- (IBAction)invitationButtonClicked:(id)sender {
}

- (IBAction)addeventButtonClicked:(id)sender {
    
    AddEventsViewController *destinationViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"addeventsViewController"];
    [self.navigationController pushViewController:destinationViewController animated:YES];
    self.navigationItem.title=@"ADD EVENT";
}

- (IBAction)prfileButtonClicked:(id)sender {
}

- (IBAction)promotionButtonClicked:(id)sender {
}

- (IBAction)helpButtonClicked:(id)sender {
}
@end
