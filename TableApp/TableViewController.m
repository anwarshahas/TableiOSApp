//
//  TableViewController.m
//  TableApp
//
//  Created by Shahas on 11/11/15.
//  Copyright © 2015 Shahas. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchCollectionList];
    [self initUIComponents];
    [self initUIConstraints];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)initUIComponents {
    
}

- (void)initUIConstraints {
    
}

- (void) fetchCollectionList {
    // Fetch Product Category List from Server ...
    
    [SVProgressHUD show];
    [self.tableView setHidden:YES];
    [User fetchUsersListWithcompletionHandler:^(BOOL status, NSArray *usersArray, BfErrorCode errorCode, NSString *message) {
        [SVProgressHUD dismiss];
        if (status == YES) {
            [self.tableView setHidden:NO];
            self.usersArray = usersArray;
            [self.tableView reloadData];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.usersArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TableCell";
    TableCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    User *user = [self.usersArray objectAtIndex:indexPath.row];
    [cell setUsers:user];
    [cell layoutIfNeeded];
    return cell;
}

@end
