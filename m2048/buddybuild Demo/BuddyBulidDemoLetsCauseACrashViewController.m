//
//  BuddyBulidDemoLetsCauseACrashViewController.m
//  m2048
//
//  Created by Chris on 2015-12-25.
//  Copyright © 2015 Danqing. All rights reserved.
//

#import "BuddyBulidDemoLetsCauseACrashViewController.h"

@interface BuddyBulidDemoLetsCauseACrashViewController ()

@end

@implementation BuddyBulidDemoLetsCauseACrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleOk {
    NSLog(@"handleOk");
}

- (IBAction)ok {
    [self.view removeFromSuperview];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
