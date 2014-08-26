//
//  TitleDescriptionFormViewController.m
//  ThriftMe
//
//  Created by Morgan Collino on 02/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "TitleDescriptionFormViewController.h"
#import "LocationPriceFormViewController.h"
#import "CategoriesViewController.h"

@interface TitleDescriptionFormViewController ()
{
    BOOL isUp;
}
@end

@implementation TitleDescriptionFormViewController

@synthesize titleThrift = _titleThrift, description = _description, gender = _gender, categories = _categories;

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

    isUp = NO;
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
                             bounds.size.height += 216;
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
                             float b = [self.view frame].size.height - 216;
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
    if (!isUp && 200 < (textField.frame.origin.y + textField.frame.size.height))
        [self upView];
    if (isUp && 200 > (textField.frame.origin.y + textField.frame.size.height))
        [self downView];
}

- (void) doneWriting: (id)sender
{
    self.navigationItem.rightBarButtonItem = nil;
    [_description resignFirstResponder];
}

- (void) textViewDidBeginEditing:(UITextView *)textView
{
    UIBarButtonItem *b = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target: self action: @selector(doneWriting:)];
    
    self.navigationItem.rightBarButtonItem = b;
  //  if (!isUp && 200 < (textView.frame.origin.y + textView.frame.size.height))
     //   [self upView];

}

- (void) textViewDidEndEditing:(UITextView *)textView
{
    if (isUp)
        [self downView];
    [textView resignFirstResponder];
}

- (BOOL) textViewShouldEndEditing:(UITextView *)textView
{
    if (isUp)
        [self downView];
    [textView resignFirstResponder];
    return YES;
}

- (IBAction) showCategories:(id)sender
{
    NSArray *array = [[NSArray alloc] initWithObjects:  @"Blouse", @"Coat", @"Costume", @"Dress", @"Jacket", @"Jeans", @"Necklace", @"Pants", @"Pullover", @"Shoes",  @"Shirt", @"Shorts", @"Skirt", @"Suit", @"Underwear", @"Watch", nil];
    
    CategoriesViewController *c = [self.storyboard instantiateViewControllerWithIdentifier: @"CategoriesViewController"];
    c.category = array;
    c.vc = self;
    [self presentViewController:c animated: YES completion:^{
        
    }];
}

- (IBAction) pushNext:(id)sender
{
    // form v2;
    
    if (_titleThrift.text.length > 0)
    {
        LocationPriceFormViewController *c = [self.storyboard instantiateViewControllerWithIdentifier: @"LocationPriceFormViewController"];
        
        [self.navigationController pushViewController: c animated: YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message: @"You need to fill all the fields and have at least 6 characters for the title and the description." delegate: self cancelButtonTitle: @"Cancel" otherButtonTitles: @"OK", nil];
        [alertView show];
    }
}


- (void) setCategory:(NSString *)name
{
    NSLog(@"SetCat: %@", name);
    _categories.titleLabel.text = name;
}


@end
