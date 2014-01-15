//
//  MILoginViewController.m
//  WYRWYF
//
//  Created by Mohd Irtefa on 1/15/14.
//  Copyright (c) 2014 Irtefa. All rights reserved.
//

#import "MILoginViewController.h"

@interface MILoginViewController ()

@end

@implementation MILoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES];
}

- (IBAction)login:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (([username length] == 0) || ([password length] == 0)) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"You need to login with your username and password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    } else {
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if (user) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            } else {
                // Login failed
                UIAlertView * alert = [[UIAlertView alloc]
                                       initWithTitle:@"ERROR!"
                                       message:[error.userInfo objectForKey:@"error"]
                                       delegate:nil cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
                [alert show];
            }
        }];
    }
}
@end
