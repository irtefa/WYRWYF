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
//    NSLog(@"%@", self.detailItem);
    PFUser *user = self.detailItem;
    self.usernameLabel.text = user.username;
}

- (IBAction)follow:(id)sender {
    PFUser *currentUser = [PFUser currentUser];
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:self.usernameLabel.text]; // find all the women
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d users.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                PFRelation *relation = [currentUser relationforKey:@"Friendship"];
                [relation addObject:object];
                [currentUser saveInBackground];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
@end
