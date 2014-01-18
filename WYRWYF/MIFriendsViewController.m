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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFQuery *query = [PFUser query];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error occured fetching users");
        } else {
            self.allUsers = objects;
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
    
    return [self.allUsers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];


    if (tableView == self.searchDisplayController.searchResultsTableView) {
        PFUser *user = [searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = user.username;
    } else {
        PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
        cell.textLabel.text = user.username;
    }
    
    return cell;
}

// Helper methods

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scop {
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF.username LIKE[cd] %@",
                                    searchText];
    searchResults = [self.allUsers filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)
controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles]objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}
@end