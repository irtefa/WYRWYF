//
//  MISignupViewController.m
//  WYRWYF
//
//  Created by Mohd Irtefa on 1/13/14.
//  Copyright (c) 2014 Irtefa. All rights reserved.
//

#import "MISignupViewController.h"

@interface MISignupViewController ()

@end

@implementation MISignupViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (IBAction)signup:(id)sender {
    // Extract fields
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *phonenumber = [self.phonenumberField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    // Check if fields are empty
    if (([username length] == 0) || ([password length] == 0) || ([email length] == 0) || ([phonenumber length] == 0)) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"ERROR" message:@"Please give a username, password, email and a phonenumber to sign up" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else {
    
        PFUser *user = [PFUser user];
        user.username = username;
        user.password = password;
        user.email = email;
        [user setObject:phonenumber forKey:@"phonenumber"];
    
    
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                UIAlertView * alert = [[UIAlertView alloc]
                                   initWithTitle:@"ERROR!"
                                   message:[error.userInfo objectForKey:@"error"]
                                   delegate:nil cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil];
                [alert show];
            } else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }
}

@end
