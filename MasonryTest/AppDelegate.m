//
//  AppDelegate.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/28.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "AppDelegate.h"
#import "RootNavigationViewController.h"
#import "RootTabBarController.h"
#import "DynamicVC.h"
#import "ChatVC.h"
#import "RecruitVC.h"
#import "SquarVC.h"
#import "MyVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
    dispatch_queue_t queue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"1");
        NSLog(@"2");
        NSLog(@"3");
        NSLog(@"4");
        NSLog(@"5");
        NSLog(@"6");
        NSLog(@"7");
    });*/
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory=[paths objectAtIndex:0];
    
    NSLog(@"documentsDirectory = %@",documentsDirectory);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    RootTabBarController *tab = [[RootTabBarController alloc] init];
    
    DynamicVC *dynamic = [[DynamicVC alloc] init];
    RootNavigationViewController *nav1 = [[RootNavigationViewController alloc] initWithRootViewController:dynamic];
    nav1.tabBarItem = [[MTUtil shareInstance] returnTabBarItem:@"动态" andImageName:nil];
    
    ChatVC *chat = [[ChatVC alloc] init];
    RootNavigationViewController *nav2 = [[RootNavigationViewController alloc] initWithRootViewController:chat];
    nav2.tabBarItem = [[MTUtil shareInstance] returnTabBarItem:@"聊天" andImageName:nil];
    
    RecruitVC *recruit = [[RecruitVC alloc] init];
    RootNavigationViewController *nav3 = [[RootNavigationViewController alloc] initWithRootViewController:recruit];
    nav3.tabBarItem = [[MTUtil shareInstance] returnTabBarItem:@"招聘" andImageName:nil];
    
    SquarVC *squar = [[SquarVC alloc] init];
    RootNavigationViewController *nav4 = [[RootNavigationViewController alloc] initWithRootViewController:squar];
    nav4.tabBarItem = [[MTUtil shareInstance] returnTabBarItem:@"广场" andImageName:nil];
    
    MyVC *my = [[MyVC alloc] init];
    RootNavigationViewController *nav5 = [[RootNavigationViewController alloc] initWithRootViewController:my];
    nav5.tabBarItem = [[MTUtil shareInstance] returnTabBarItem:@"我的" andImageName:nil];
    
    tab.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
    self.window.rootViewController = tab;
    
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
