//
//  AppDelegate.m
//  QMUITest
//
//  Created by yangyuting on 2020/9/18.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <QMUINavigationController.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.rootViewController = [[QMUINavigationController alloc] initWithRootViewController:[ViewController new]];
    return YES;
}



- (UIWindow *)window{
    if (!_window ) {
        _window = [[UIWindow alloc] init];
        [_window makeKeyAndVisible];
    }
    return _window;
}

@end
