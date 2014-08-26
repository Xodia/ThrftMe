//
//  ThriftDetailViewController.m
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "ThriftDetailViewController.h"
#import "UIImageView+AFNetworking.h"   
#import "ThriftDetail.h"
#import "ContactDetailViewController.h"

@interface ThriftDetailViewController ()

@end

@implementation ThriftDetailViewController

@synthesize detail = _detail, imageView = _imageView, price = _price, description = _description, phone = _phone, avatard = _avatard, mail = _mail, location = _location, zip = _zip, info = _info, titleThrift = _titleThrift;

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

    _price.text = [NSString stringWithFormat: @"%@$", _detail.price];
    _description.text = _detail.description;
    _titleThrift.text = _detail.title;
    
    [_imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: _detail.image]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         _imageView.image = image;
         NSLog(@"Your image request succeeded!");
     } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
         
         NSLog(@"Your image request failed...: %@", error);
     }];
    //_imageView
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) showInfo:(id)sender
{
    ContactDetailViewController *rootView = [[self storyboard] instantiateViewControllerWithIdentifier:@"ContactDetailViewController"];
    
    rootView.detail = _detail;
    [[self navigationController] pushViewController: rootView animated: YES];
}
@end
