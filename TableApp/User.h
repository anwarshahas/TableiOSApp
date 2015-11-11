//
//  User.h
//  TableApp
//
//  Created by Shahas on 11/11/15.
//  Copyright © 2015 Shahas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "BfErrorCode.h"
#import "Routes.h"
#import "NSString+BfStringHelpers.h"
#import "StatusCodes.h"

@interface User : NSObject
@property NSString *userName;
@property NSString *place;
@property NSString *profilePicURL;


+(void) fetchUsersListWithcompletionHandler:(void (^)(BOOL, NSArray*, BfErrorCode, NSString*))handler;
+(User *) parseUsersListDictionary:(NSDictionary*)usersDictionary;
@end
