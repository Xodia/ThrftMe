//
//  ThriftMapViewController.m
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "ThriftMapViewController.h"
#import "UserInfo.h"
#import "ThriftDetail.h"
#import "ThriftAnnotation.h"
#import "UIImageView+AFNetworking.h"
#import "ThriftDetailViewController.h"

@interface ThriftMapViewController ()

@end

@implementation ThriftMapViewController

@synthesize array = _array, mapView = _mapView;

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
    self.navigationController.navigationBar.opaque = YES;
    [super viewDidLoad];
    self.title = @"Thrft";

	// Do any additional setup after loading the view.
    
    for (ThriftDetail *i in _array)
    {
        ThriftAnnotation *a = [[ThriftAnnotation alloc] initWithCoordinate: CLLocationCoordinate2DMake(i.lat, i.lon) URLImage: i.image title: i.title subtitle: [NSString stringWithFormat: @"%@ $", i.price] thriftInfo: i];
        [_mapView addAnnotation: a];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (MKAnnotationView *)mapView:(MKMapView *)mmapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    if ([annotation isKindOfClass:[ThriftAnnotation class]])
    {
        MKPinAnnotationView*   pinView = (MKPinAnnotationView*)[mmapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
            
        {
            // If an existing pin view was not available, create one.
            
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                       reuseIdentifier:@"CustomPinAnnotationView"];
            
            
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            
            ThriftAnnotation *a = (ThriftAnnotation*)annotation;
            
            UIImageView *v = [[UIImageView alloc] init];
            
            [v setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: a.detailz.image]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
             {
                 UIImageView *b = [[UIImageView alloc] init];
                 b.image = image;
                 pinView.leftCalloutAccessoryView = b;
                 NSLog(@"Your image request succeeded!");
             } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                 
                 NSLog(@"Your image request failed...: %@", error);
             }];

            
            // Add a detail disclosure button to the callout.
            
            UIButton* rightButton = [UIButton buttonWithType:                                     UIButtonTypeDetailDisclosure];
            
            pinView.rightCalloutAccessoryView = rightButton;
        }
        else
            pinView.annotation = annotation;
        return pinView;
    }

    return nil;
    
}

- (void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    ThriftDetailViewController *d = [self.storyboard instantiateViewControllerWithIdentifier: @"ThriftDetailViewController"];
    
    ThriftAnnotation *a = (ThriftAnnotation*)[view annotation];
    [d setDetail: a.detailz];
    
    [self.navigationController pushViewController: d animated: YES];
}


@end
