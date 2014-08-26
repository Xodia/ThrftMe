//
//  TitleDescriptionFormViewController.h
//  ThriftMe
//
//  Created by Morgan Collino on 02/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  CommunicateProtocol <NSObject>
- (void) setCategory: (NSString *) name;

@end

@interface TitleDescriptionFormViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate, UITextViewDelegate, CommunicateProtocol>
{
    UITextField *titleThrift;
    UIButton *categories;
    UITextView *description;
    UISegmentedControl *gender;
    
    UIButton *next;
}

- (void) setCategory:(NSString *)name;

@property (nonatomic, retain) IBOutlet UITextField *titleThrift;
@property (nonatomic, retain) IBOutlet UISegmentedControl *gender;
@property (nonatomic, retain) IBOutlet UIButton *categories;
@property (nonatomic, retain) IBOutlet UITextView *description;

@end
