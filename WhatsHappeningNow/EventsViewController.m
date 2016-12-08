//
//  EventsViewController.m
//  WhatsHappeningNow
//
//  Created by Arun Raut on 10/14/14.
//  Copyright (c) 2014 Sunbi. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    self.userImage.layer.cornerRadius=self.userImage.frame.size.height/2;
    self.userImage.layer.borderWidth=3.0f;
    self.userImage.layer.borderColor=[[UIColor yellowColor]CGColor];
}
- (void)viewWillAppear
{
    
    self.navigationController.navigationBarHidden=NO;
	
}

@end
