//
//  ThriftMapViewController.h
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ThriftMapViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView *mapView;
    NSArray *array;
}

@property (nonatomic, retain) NSArray *array;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
