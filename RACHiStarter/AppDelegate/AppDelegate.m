//
//  AppDelegate.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 15/11/17.
//  Copyright © 2015年 刘彬彬. All rights reserved.
//

#import "AppDelegate.h"
#import "HiLoginVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    HiLoginVC *vc = [[HiLoginVC alloc] init];
    self.window.rootViewController = vc;
    
    [NSThread sleepForTimeInterval:2.0];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
