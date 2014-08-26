//
//  RootAppDelegate.h
//  ThriftMe
//
//  Created by Morgan Collino on 02/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSArray *listProducts;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSArray *listProducts;
@end
