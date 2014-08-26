//
//  ThriftAnnotation.m
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "ThriftAnnotation.h"
#import "AFHTTPClient.h"
#import "UIImageView+AFNetworking.h"

@implementation ThriftAnnotation

@synthesize coordinate = _coordinate, title = _title, subtitle = _subtitle, image = _image, detailz = _detailz;

- (id)init
{
    if (self = [super init])
    {
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (id) initWithCoordinate: (CLLocationCoordinate2D)coord URLImage: (NSString *) url title: (NSString *) ttitle subtitle: (NSString *) ssubtitle thriftInfo:(ThriftDetail *)detail
{
    if (self = [super init])
    {
        _coordinate = coord;
    
        @try
        {
            UIImageView *img = [[UIImageView alloc] init];
            [img setImageWithURL: [[NSURL alloc] initWithString: url]];
            _image = img.image;
        }
        @catch (NSException *exception)
        {
            
        }
        
        // load -> _image
        _title = ttitle;
        _subtitle = ssubtitle;
        _detailz = detail;
        
    }
    return self;
}

@end
