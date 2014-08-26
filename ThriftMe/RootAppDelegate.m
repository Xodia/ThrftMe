//
//  RootAppDelegate.m
//  ThriftMe
//
//  Created by Morgan Collino on 02/11/2013.
//  Copyright (c) 2013 Morgan Collino. All rights reserved.
//

#import "RootAppDelegate.h"
#import "AFJSONRequestOperation.h"
#import "ThriftDetail.h"

@implementation RootAppDelegate
@synthesize listProducts = _listProducts;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    NSMutableArray *a = [[NSMutableArray alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: @"http://37.187.4.140:3000/products.json"]];
    NSLog(@"Test");
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest: request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
       // NSLog(@"SUCCESS:  JSON : %@", JSON);
        
        if ([JSON isKindOfClass: [NSArray class]])
        {
            for (NSDictionary *d in JSON)
            {
                ThriftDetail *detail = [[ThriftDetail alloc] initWithDictionary: d];
                [a addObject: detail];
            }
        }
        _listProducts = a;
        
        
        NSLog(@"ListProducts: %@", _listProducts);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"FAILURE:  JSON : %@", JSON);

    }];
    
    [operation start];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
