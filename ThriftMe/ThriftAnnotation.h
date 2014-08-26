//
//  ThriftAnnotation.h
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <MapKit/MapKit.h>

@class ThriftDetail;

@interface ThriftAnnotation : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    UIImage *image;
    UILabel *title, *subtitle;
}

@property (nonatomic, retain) ThriftDetail *detailz;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id) initWithCoordinate: (CLLocationCoordinate2D)coord URLImage: (NSString *) url title: (NSString *) ttitle subtitle: (NSString *) ssubtitle thriftInfo: (ThriftDetail*) detail;

@end
