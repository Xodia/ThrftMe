//
//  ContactDetailViewController.m
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "ContactDetailViewController.h"
#import "ThriftDetail.h"
#import "UserInfo.h"
#import "UIImageView+AFNetworking.h"

@interface ContactDetailViewController ()

@end

@implementation ContactDetailViewController

@synthesize username = _username, imageView = _imageView, email = _email, detail = _detail;

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

    @try {
        
        _username.text = _detail.contact.username;
        [_email setTitle: [NSString stringWithFormat: @"Email: %@", _detail.contact.email]  forState: UIControlStateNormal];
        
        [_imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: _detail.contact.avatarUrl]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
         {
             _imageView.image = image;
             NSLog(@"Your image request succeeded!");
         } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
             
             NSLog(@"Your image request failed...: %@", error);
         }];
    
    }
    @catch (NSException *exception) {
        
    }

    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) pushEmail:(id)sender
{
    // launch email -> Mail
    NSString *subject = [NSString stringWithFormat: @"[Thrft][%@]", _detail.title];
    NSString *address =  _detail.contact.email;
    NSString *path = [NSString stringWithFormat:@"mailto:%@?subject=%@", address, subject];
    NSURL *url = [NSURL URLWithString:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:url];

}
@end
