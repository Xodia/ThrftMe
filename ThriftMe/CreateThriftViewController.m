//
//  CreateThriftViewController.m
//  ThriftMe
//
//  Created by Morgan Collino on 02/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "CreateThriftViewController.h"
#import "TitleDescriptionFormViewController.h"

@interface CreateThriftViewController ()
{
    NSMutableArray *images;
    BOOL isUp;
}

@end

@implementation CreateThriftViewController

@synthesize scrollView = _scrollView, pageControl = _pageControl, addImage = _addControl, next = _next;

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
    self.navigationController.navigationBar.hidden = NO;

    [super viewDidLoad];
    self.title = @"Thrft";

    self.navigationController.navigationBar.opaque = YES;

    images = [[NSMutableArray alloc] init];
	// Do any additional setup after loading the view.
}

- (void) removeImageFromIndex: (id) button
{
    UIButton *b = (UIButton *) button;
    
    if ([images count] > b.tag)
    {
        [images removeObjectAtIndex: b.tag];
        [self reloadScrollView];
    }
}

- (void) reloadScrollView
{
    NSArray *viewsToRemove = [scrollView subviews];
    for (UIView *v in viewsToRemove) [v removeFromSuperview];
    
    _scrollView.contentSize = CGSizeMake(320 * images.count, _scrollView.frame.size.height);
    
    for (int i = 0; i < images.count; i++)
    {
        CGRect frame;
        frame.origin.x = (_scrollView.frame.size.width * i) + 15;
        frame.origin.y = 3;
        frame.size.width = 290;
        frame.size.height = 306;
        
        UIButton *button = [[UIButton alloc] initWithFrame: CGRectMake((_scrollView.frame.size.width * i)+ 270, 26, 45, 45)];
        [[button titleLabel] setTintColor: [UIColor redColor]];
        [[button titleLabel] setText: @"X"];
        [button addTarget: self action: @selector(removeImageFromIndex:) forControlEvents: UIControlEventTouchUpInside];
        button.tag = i;
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = [images objectAtIndex:i];
        imgView.frame = frame;
        [_scrollView addSubview:imgView];
    }
    
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = images.count;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollView Delegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = _scrollView.frame.size.width;
    int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = page;
}

#pragma IBActions method

- (IBAction)pushAddImage:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Take a picture" message: @"" delegate: self cancelButtonTitle: @"Cancel" otherButtonTitles: @"Take picture from Camera", @"Take picture from the albums", nil];
    [alert show];
}

- (IBAction) pushNext:(id)sender
{
    // form v2;
    
    if (images.count > 0)
    {
        TitleDescriptionFormViewController *c = [self.storyboard instantiateViewControllerWithIdentifier: @"TitleDescriptionFormViewController"];
        
        [self.navigationController pushViewController: c animated: YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message: @"You need to select at least one picture to create a Thrift !" delegate: self cancelButtonTitle: @"Cancel" otherButtonTitles: @"OK", nil];
        [alertView show];
    }
}

#pragma Picture

- (void) takePicture
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        [myAlertView show];
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void) takePictureFromFolders
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


#pragma UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 1:
            
            [self takePicture];
            
            break;
        case 2:
            
            [self takePictureFromFolders];

            break;
        default:
            break;
    }
    
}

#pragma UIPhotoViewController

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    [images addObject: chosenImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    [self reloadScrollView];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
