//
//  ThriftDetail.h
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfo;

@interface ThriftDetail : NSObject
{
    NSString *description;
    NSString *price;
    NSString *title;
    NSString *category;
    NSString *image;
    NSString *city;
    NSString *zip;
    UserInfo *contact;
    double lat, lon;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary;

@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *zip;
@property (nonatomic, copy) NSString *image;
@property (nonatomic) double lat;
@property (nonatomic) double lon;
@property (nonatomic, copy) UserInfo *contact;

@end
