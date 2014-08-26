//
//  RootViewController.h
//  ThriftMe
//
//  Created by Morgan Collino on 02/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIButton *sellItem, *categories, *myItems;
    UIImageView *imageView;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIButton *sellItem;
@property (nonatomic, retain) IBOutlet UIButton *categories;
@property (nonatomic, retain) IBOutlet UIButton *myItems;


@end
