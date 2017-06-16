//
//  M2AppDelegate.h
//  m2048
//
//  Created by Danqing on 3/16/14.
//  Copyright (c) 2014 Danqing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^NotificationCompleteCallback)();

@interface M2AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) bool screenshottingAllowed;

- (void)sendNotification:(NSString*)notification callback:(NotificationCompleteCallback)callback;

@end
