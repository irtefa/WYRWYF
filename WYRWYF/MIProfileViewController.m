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

    PFUser *user = self.detailItem;
    self.usernameLabel.text = user.username;
    NSLog(@"%@", user.username);
    // Check if profile a friend
    for (PFUser *object in self.friends) {
        if ([object.username isEqualToString:user.username]) {
            [self.addFriendButton setTitle:@"Unfollow" forState:UIControlStateNormal];
        }
    }
}

- (IBAction)follow:(id)sender {
    PFUser *currentUser = [PFUser currentUser];
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:self.usernameLabel.text];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d users.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                PFRelation *relation = [currentUser relationforKey:@"Friendship"];
                [relation addObject:object];
                [currentUser saveInBackground];
                
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"Yay!" message:@"You have successfully added the user as a friend!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                [self.addFriendButton setTitle:@"Unfollow" forState:UIControlStateNormal];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
@end
