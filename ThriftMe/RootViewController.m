//
//  RootViewController.m
//  ThriftMe
//
//  Created by Morgan Collino on 02/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "RootViewController.h"
#import "CategoriesThriftViewController.h"
#import "CreateThriftViewController.h"
#import "MyItemsThriftViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

@synthesize imageView = _imageView, sellItem = _sellItem,categories = _categories, myItems = _myItems;

- (void) viewWillAppear: (BOOL) animated
{
    [super viewWillAppear: animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Thrft";
    
    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.hidden = YES;

    /*if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        [_button setHidden: YES];
    }*/
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma IBActions methods

- (IBAction) sellItem:(id)sender
{
    // send to CategoriesThriftViewController
    CreateThriftViewController *c = [self.storyboard instantiateViewControllerWithIdentifier: @"CreateThriftViewController"];
    
    [self.navigationController pushViewController: c animated: YES];
}

- (IBAction) pushCategories:(id)sender
{
    CategoriesThriftViewController *c = [self.storyboard instantiateViewControllerWithIdentifier: @"CategoriesThriftViewController"];
    NSArray *array = [[NSArray alloc] initWithObjects:  @"Blouse", @"Coat", @"Costume", @"Dress", @"Jacket", @"Jeans", @"Necklace", @"Pants", @"Pullover", @"Shoes",  @"Shirt", @"Shorts", @"Skirt", @"Suit", @"Underwear", @"Watch", nil];
    
    c.category = array;
    [self.navigationController pushViewController: c animated: YES];

}

- (IBAction) pushMyItems:(id)sender
{
    // send to MyItemsThriftViewController
    CreateThriftViewController *c = [self.storyboard instantiateViewControllerWithIdentifier: @"CreateThriftViewController"];
    
    [self.navigationController pushViewController: c animated: YES];
}


@end
