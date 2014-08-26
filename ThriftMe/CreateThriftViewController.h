//
//  CreateThriftViewController.h
//  ThriftMe
//
//  Created by Morgan Collino on 02/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateThriftViewController : UIViewController <UIScrollViewDelegate, UIAlertViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    
    UIButton *addImage;
    UIStepper *control;
    
    UIButton *next;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) IBOutlet UIButton *addImage;
@property (nonatomic, retain) IBOutlet UIButton *next;

@end
