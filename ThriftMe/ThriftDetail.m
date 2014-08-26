//
//  ThriftDetail.m
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "ThriftDetail.h"
#import "XTTry.h"
#import "UserInfo.h"

@implementation ThriftDetail
@synthesize description = _description;
@synthesize price = _price;
@synthesize title = _title;
@synthesize city = _city;
@synthesize zip = _zip;
@synthesize image = _image;
@synthesize contact = _contact;
@synthesize lat = _lat;
@synthesize lon = _lon;
@synthesize category = _category;

- (instancetype) initWithDictionary: (NSDictionary *) dictionary
{
    if (self = [super init])
    {
        _description = [XTTry tryGettingString: dictionary forKey: @"description"];
        _price = [NSString stringWithFormat: @"%@", [XTTry tryGettingNumber: dictionary forKey: @"price"]];
        _title = [XTTry tryGettingString: dictionary forKey: @"title"];
        _city = [XTTry tryGettingString: dictionary forKey: @"city"];
        _category = [XTTry tryGettingString: dictionary forKey: @"category"];
        _zip = [XTTry tryGettingString: dictionary forKey: @"zip"];
        _image = [NSString stringWithFormat: @"%@%@", @"http://37.187.4.140:3000/assets/", [XTTry tryGettingString: dictionary forKey: @"image"]];
        _lat = [XTTry tryGettingDouble: dictionary forKey: @"lat" defaultValue: 33.804472];
        _lon = [XTTry tryGettingDouble: dictionary forKey: @"lon" defaultValue:-118.158914];
        
        UserInfo *info = [[UserInfo alloc] initWithDictionary: [XTTry tryGettingDictionary:dictionary forKey: @"user"]];
        _contact = info;
        
        
        NSLog(@"Image: %@ & Price: %@", _image, _price);
    }
    return self;
}

@end
