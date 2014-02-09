//
//  MIPickRecipientsViewController.m
//  WYRWYF
//
//  Created by Mohd Irtefa on 2/8/14.
//  Copyright (c) 2014 Irtefa. All rights reserved.
//

#import "MIPickRecipientsViewController.h"

@interface MIPickRecipientsViewController ()
@end

@implementation MIPickRecipientsViewController {
    PFUser * currentUser;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    currentUser = [PFUser currentUser];
    NSString* firstPart = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstPart"];
    NSString* secondPart = [[NSUserDefaults standardUserDefaults] objectForKey:@"secondPart"];
    
    NSLog(@"%@", firstPart);
    NSLog(@"%@", secondPart);

    PFRelation *relation = [currentUser relationforKey:@"Friendship"];
    [[relation query] findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error occured fetching users");
        } else {
            self.friends = objects;
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    PFUser *user = [self.friends objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    return cell;
}

@end
