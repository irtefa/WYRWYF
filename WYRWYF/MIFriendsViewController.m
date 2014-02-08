//
//  MIFriendsViewController.m
//  WYRWYF
//
//  Created by Mohd Irtefa on 1/15/14.
//  Copyright (c) 2014 Irtefa. All rights reserved.
//

#import "MIFriendsViewController.h"

@interface MIFriendsViewController ()

@end

@implementation MIFriendsViewController {
    NSArray *searchResults;
    PFUser *currentUser;
    NSArray *friends;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    currentUser = [PFUser currentUser];
    
    PFQuery *query = [PFUser query];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error occured fetching users");
        } else {
            self.allUsers = objects;
            [self.tableView reloadData];
        }
    }];
    
    PFRelation *relation = [currentUser relationforKey:@"Friendship"];
    [[relation query] findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error occured fetching users");
        } else {
            friends = objects;
            NSLog(@"%d", friends.count);
            [self.tableView reloadData];
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    }
    
    return friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];


    if (tableView == self.searchDisplayController.searchResultsTableView) {
        PFUser *user = [searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = user.username;
    } else {
        PFUser *user = [friends objectAtIndex:indexPath.row];
        cell.textLabel.text = user.username;
    }

    return cell;
}

#pragma mark - Helper methods

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scop {
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF.username CONTAINS[cd] %@ AND NOT (%@ IN %@)" ,
                                    searchText, searchText, currentUser.username];
    searchResults = [self.allUsers filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)
controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles]objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   if ([[segue identifier] isEqualToString:@"showProfile"]) {
       MIProfileViewController *viewController = segue.destinationViewController;
       
       UIButton *btn = (UIButton *) sender;
       CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:self.tableView];
       NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonFrameInTableView.origin];
              
       NSString  *object = searchResults[indexPath.row];
       viewController.detailItem = object;
   }
}

@end
