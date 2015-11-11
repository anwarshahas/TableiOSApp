//
//  TableCell.h
//  TableApp
//
//  Created by Shahas on 11/11/15.
//  Copyright © 2015 Shahas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "UIImage+BfImageHelpers.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIView+BfViewHelpers.h"
@interface TableCell : UITableViewCell

@property NSArray *usersArray;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *place;

-(void) setUsers:(User *)user;

@end
