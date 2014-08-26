//
//  LocationPriceFormViewController.m
//  ThriftMe
//
//  Created by Morgan Collino on 02/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "LocationPriceFormViewController.h"

@interface LocationPriceFormViewController ()
{
    BOOL isUp;
}
@end

@implementation LocationPriceFormViewController

@synthesize price = _price, zipCode = _zipCode, city = _city, next = _next;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Thrft";

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) downView
{
    if (isUp)
    {
        [UIView animateWithDuration:0.5
                         animations:^{
                             CGRect bounds = [self.view frame];
                             bounds.size.height += 86;
                             [self.view setFrame: bounds];
                         }];
        
        isUp = NO;
    }
}

- (void) upView
{
    if (!isUp)
    {
        [UIView animateWithDuration:0.5
                         animations:^{
                             CGRect bounds = [self.view frame];
                             float b = [self.view frame].size.height - 86;
                             bounds.size.height= b;
                             [self.view setFrame: bounds];
                         }];
        isUp = YES;
        return;
    }
}

#pragma UITextfieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (isUp)
    {
        [self downView];
    }
    return YES;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    if (![textField isEqual: _city])
    {
        UIBarButtonItem *b = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target: self action: @selector(doneWriting:)];
        
        self.navigationItem.rightBarButtonItem = b;
    }
    else
        self.navigationItem.rightBarButtonItem = nil;
    if (!isUp && 230 < (textField.frame.origin.y + textField.frame.size.height))
        [self upView];
    if (isUp && 230 > (textField.frame.origin.y + textField.frame.size.height))
        [self downView];
}


- (IBAction) pushNext:(id)sender
{
    // form v2;
    
    if (1)
    {
       // request;
        [self.navigationController popToRootViewControllerAnimated: YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message: @"You need to fill all the fields." delegate: self cancelButtonTitle: @"Cancel" otherButtonTitles: @"OK", nil];
        [alertView show];
    }
}

- (void) doneWriting: (id)sender
{
    if (isUp)
    {
        [self downView];
    }
    self.navigationItem.rightBarButtonItem = nil;
    [_city resignFirstResponder];
    [_price resignFirstResponder];
    [_zipCode resignFirstResponder];
}

@end
