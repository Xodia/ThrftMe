//
//  CategoriesCollectionViewController.m
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "CategoriesCollectionViewController.h"
#import "CategoryCollectionView.h"
#import "ThriftDetailViewController.h"
#import "ThriftMapViewController.h"
#import "UIImageView+AFNetworking.h"
#import "ThriftDetail.h"

@interface CategoriesCollectionViewController ()

@end

@implementation CategoriesCollectionViewController

@synthesize array = _array;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) showMap: (id) sender
{
    ThriftMapViewController *c = [self.storyboard instantiateViewControllerWithIdentifier: @"ThriftMapViewController"];
    c.array = _array;
    [self.navigationController pushViewController: c animated: YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *map = [[UIBarButtonItem alloc] initWithTitle:@"Map" style:UIBarButtonItemStyleBordered target:self action: @selector(showMap:)];
    self.navigationItem.rightBarButtonItem = map;
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma UICollectionViewController


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    int i = 0;
    
    i = [_array count] % 2;
    
    return (([_array count] / 2) + (i ? 1 : 0));
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([_array count] < ((section + 1) * 2))
        return ([_array count] % 2);
    else
        return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)_collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryCollectionView *cell = [_collectionView dequeueReusableCellWithReuseIdentifier: @"Cell" forIndexPath: indexPath];
    
    ThriftDetail *d = [_array objectAtIndex: indexPath.row + (indexPath.section * 2)];
    
    @try
    {
       // [cell.imageView setImageWithURL: [NSURL URLWithString: [d image]];
        
        NSLog(@"Image: %@", d.image);
        
        [cell.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: d.image]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
        {
            cell.imageView.image = image;
            NSLog(@"Your image request succeeded!");
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            
            NSLog(@"Your image request failed...: %@", error);
        }];
    }
    @catch (NSException *exception)
    {
        
    }
    
    
    cell.price.text = [NSString stringWithFormat: @"%@$", d.price];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThriftDetailViewController *rootView = [[self storyboard] instantiateViewControllerWithIdentifier:@"ThriftDetailViewController"];
    
    rootView.detail = [_array objectAtIndex: indexPath.row + (indexPath.section * 2)];
    [[self navigationController] pushViewController: rootView animated: YES];
}



@end
