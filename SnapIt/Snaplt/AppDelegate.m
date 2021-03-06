//
//  AppDelegate.m
//  Snaplt
//
//  Created by apple on 4/16/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Setup the launch picture
    UIImageView *backImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height)];
    backImg.image = [UIImage imageNamed:@"screen-welcome.jpg"];
    backImg.alpha = 0.0;
    [self.window addSubview:backImg];
    
    [UIView animateWithDuration:3.0 animations:^{
        backImg.alpha = 1.0;
    }completion:^(BOOL finished) {
        [backImg removeFromSuperview];
        HomeViewController *home = [[HomeViewController alloc]initWithNibName:nil bundle:nil];
        UINavigationController *rootCtr = [[UINavigationController alloc]initWithRootViewController:home];
        
        // set navigation bar color to black
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f]];
        // NavigationBar title white
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
        // Back button color white
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        // make the status bar with light color on the dark background color
        [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackTranslucent];
        
        self.window.rootViewController = rootCtr;
    }];
    
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
