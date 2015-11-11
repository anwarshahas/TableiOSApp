//
//  TableCell.m
//  TableApp
//
//  Created by Shahas on 11/11/15.
//  Copyright © 2015 Shahas. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setUsers:(User *)user {
    UIImage *placeholderImage = [UIImage createTiledImage];
    self.userName.text = user.userName;
    self.place.text = user.place;
    [self.profilePic sd_setImageWithURL:[NSURL URLWithString:user.profilePicURL] placeholderImage:placeholderImage];
}

@end
