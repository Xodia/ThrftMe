//
//  CategoryCollectionView.h
//  ThriftMe
//
//  Created by Morgan Collino on 03/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryCollectionView : UICollectionViewCell
{
    UIImageView *imageView;
    UILabel *price;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UILabel *price;

@end
