//
//  MIProfileViewController.h
//  WYRWYF
//
//  Created by Mohd Irtefa on 2/7/14.
//  Copyright (c) 2014 Irtefa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MIProfileViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) NSArray * friends;
@property (weak, nonatomic) IBOutlet UIButton *addFriendButton;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
- (IBAction)follow:(id)sender;

@end
