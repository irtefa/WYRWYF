//
//  MILoginViewController.h
//  WYRWYF
//
//  Created by Mohd Irtefa on 1/15/14.
//  Copyright (c) 2014 Irtefa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MILoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)login:(id)sender;

@end
