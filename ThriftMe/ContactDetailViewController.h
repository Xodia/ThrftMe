//
//  ContactDetailViewController.h
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ThriftDetail;
@interface ContactDetailViewController : UIViewController
{
    UIButton *email;
    UIImageView *imageView;
    UILabel *username;
}

@property (nonatomic, retain) IBOutlet UIButton *email;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UILabel *username;
@property (nonatomic, retain) ThriftDetail *detail;

@end
