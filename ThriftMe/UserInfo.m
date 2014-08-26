//
//  UserInfo.m
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "UserInfo.h"
#import "XTTry.h"

@implementation UserInfo
@synthesize  email = _email;
@synthesize  username = _username;
@synthesize  avatarUrl = _avatarUrl;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        _email = [XTTry tryGettingString: dictionary forKey: @"email"];
        _username = [XTTry tryGettingString: dictionary forKey: @"username"];
        _avatarUrl = [NSString stringWithFormat: @"%@%@", @"http://37.187.4.140:3000/assets/", [XTTry tryGettingString: dictionary forKey: @"avatar"]];

    }
    return  self;
}

@end
