//
//  User.m
//  TableApp
//
//  Created by Shahas on 11/11/15.
//  Copyright © 2015 Shahas. All rights reserved.
//

#import "User.h"

@implementation User

+ (void)fetchUsersListWithcompletionHandler:(void (^)(BOOL, NSArray *, BfErrorCode, NSString *))handler {
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseURL, kRouteUsersList];
    
    AFHTTPRequestOperationManager *operationManager = [AFHTTPRequestOperationManager manager];
    operationManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *params = @{
                             };
    [operationManager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *usersListDictionaryArray = responseObject;
        NSMutableArray *usersListMutableArray = [NSMutableArray array];
        BOOL status = NO;
        if (operation.response.statusCode == kStatusCodeSuccessfullResponse) {
            status = YES;
            for (NSDictionary *userDictonary in usersListDictionaryArray) {
                [usersListMutableArray addObject:[User parseUsersListDictionary:userDictonary]];
            }
        }
        handler(status, usersListMutableArray, BfErrorCodeUnknownError, @"Unknown Error");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSInteger statusCode = operation.response.statusCode;
        BfErrorCode errorCode = BfErrorCodeUnknownError;
        if (statusCode == kStatusCodeNoInternetConnection) {
            errorCode = BfErrorCodeNetworkError;
        }
        
        NSString *errorMessage = [NSString stringWithBfErrorCode:errorCode];
        handler(NO, NULL, errorCode, errorMessage);
    }];
}

+ (User *)parseUsersListDictionary:(NSDictionary *) userDictionary {
    User *user = [[User alloc] init];
    
    user.userName = [NSString replaceNullString:[userDictionary objectForKey:@"designer_name"]];
    user.place = [NSString replaceNullString:[userDictionary objectForKey:@"designer_id"]];
    user.profilePicURL = [NSString replaceNullString:[userDictionary objectForKey:@"designer_image"]];
    
    return user;
}


@end
