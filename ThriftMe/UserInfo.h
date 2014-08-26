//
//  UserInfo.h
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
{
    NSString *email, *avatarUrl, *username;
}

@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *avatarUrl;

- (instancetype) initWithDictionary: (NSDictionary *) dictionary;
@end
