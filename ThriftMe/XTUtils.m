//
//  XTUtils.m
//  Fideal
//
//  Created by Morgan Collino on 27/09/13.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "XTUtils.h"

@implementation XTUtils

+ (void)showAlertWithMessage:(NSString *)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Erreur"
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    });
}

@end
