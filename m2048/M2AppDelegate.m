//
//  M2AppDelegate.m
//  m2048
//
//  Created by Danqing on 3/16/14.
//  Copyright (c) 2014 Danqing. All rights reserved.
//

#import "M2AppDelegate.h"
#import <BuddyBuildSDK/BuddyBuildSDK.h>
#import "buddybuild Demo/BuddyBuildDemoAppHasCrashedViewController.h"

@implementation M2AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    NSLog(@"didFinishLaunchingWithOptions - setting up BuddyBuildSDK");
    [BuddyBuildSDK setup];

    application.statusBarHidden = YES;

    [BuddyBuildSDK setScreenshotAllowedCallback:^BOOL{
        return self.screenshottingAllowed;
    }];


    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];

    [BuddyBuildSDK setScreenshotFeedbackSentCallback:^{
        [userDefaults setBool:YES forKey:@"has_sent_feedback"];
        [userDefaults synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BUDDYBUILD_FEEDBACK_SENT" object:nil];
    }];


    typedef void (^ScreenshotCallback)(NSNotification* note);
    ScreenshotCallback callback = ^(NSNotification* note) {
        if (!self.screenshottingAllowed) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Hold your horses..." message:@"Tap OK before taking the screenshot" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Got it", nil];
            [alert show];
        }
    };

    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationUserDidTakeScreenshotNotification
                                                      object:nil
                                                       queue:mainQueue
                                                  usingBlock:callback];
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"applicationWillResignActive");
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"applicationDidEnterBackground");
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"applicationWillEnterForeground");
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"applicationDidBecomeActive");
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"applicationWillTerminate");
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)sendNotification:(NSString*)notification callback:(NotificationCompleteCallback)callback {
    NSLog(@"Sending notification %@", notification);
    NSString* endpoint = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"BUDDYBUILD_ENDPOINT"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString* appID = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"BUDDYBUILD_APP_ID"];
    NSString* url = [NSString stringWithFormat:@"%@/api/demo/%@?appID=%@", endpoint, notification, appID];
    NSLog(@"url = %@", url);
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [NSURLConnection connectionWithRequest:request delegate:nil];

    NSLog(@"Sending notification with NSURLSession");
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Sending notification with NSURLSession - back");
        if (callback) {
            NSLog(@"Sending notification with NSURLSession - back & firing callback");
            callback();
        }
    }] resume];
}

@end
