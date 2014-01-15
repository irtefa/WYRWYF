//
//  MISignupViewController.h
//  WYRWYF
//
//  Created by Mohd Irtefa on 1/13/14.
//  Copyright (c) 2014 Irtefa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MISignupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phonenumberField;
- (IBAction)signup:(id)sender;
@end
