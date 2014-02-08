//
//  MIProfileViewController.m
//  WYRWYF
//
//  Created by Mohd Irtefa on 2/7/14.
//  Copyright (c) 2014 Irtefa. All rights reserved.
//

#import "MIProfileViewController.h"

@interface MIProfileViewController ()

@end

@implementation MIProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"%@", self.detailItem);
    PFUser *user = self.detailItem;
    self.usernameLabel.text = user.username;
}

- (IBAction)follow:(id)sender {
}
@end
