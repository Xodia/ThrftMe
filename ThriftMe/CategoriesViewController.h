//
//  CategoriesViewController.h
//  ThriftMe
//
//  Created by Morgan Collino on 02/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  CommunicateProtocol <NSObject>
- (void) setCategory: (NSString *) name;

@end

@interface CategoriesViewController : UITableViewController
{
    NSArray *category;
}

@property (nonatomic, retain) NSArray *category;
@property (nonatomic, retain) UIViewController<CommunicateProtocol> *vc;

@end
