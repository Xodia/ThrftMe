//
//  ThriftDetailViewController.h
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ThriftDetail;

@interface ThriftDetailViewController : UIViewController
{
    UIImageView *imageView, *avatar;
    UILabel *titleThrift, *phone, *email, *price, *location, *zip;
    UITextView *description;
    UIButton *info;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIImageView *avatard;;
@property (nonatomic, retain) IBOutlet UILabel *titleThrift;
@property (nonatomic, retain) IBOutlet UITextView *description;
@property (nonatomic, retain) IBOutlet UILabel *phone;
@property (nonatomic, retain) IBOutlet UILabel *mail;
@property (nonatomic, retain) IBOutlet UILabel *price;
@property (nonatomic, retain) IBOutlet UILabel *location;
@property (nonatomic, retain) IBOutlet UILabel *zip;
@property (nonatomic, retain) IBOutlet UIButton *info;


@property (nonatomic, retain) ThriftDetail *detail;

@end
