//
//  LocationPriceFormViewController.h
//  ThriftMe
//
//  Created by Morgan Collino on 02/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationPriceFormViewController : UIViewController <UITextFieldDelegate>
{
    UITextField *city, *zipCode, *price;
    
    UIButton *next;
}
@property (nonatomic, retain) IBOutlet UITextField *city;
@property (nonatomic, retain) IBOutlet UITextField *zipCode;
@property (nonatomic, retain) IBOutlet UITextField *price;
@property (nonatomic, retain) IBOutlet UIButton *next;


@end
