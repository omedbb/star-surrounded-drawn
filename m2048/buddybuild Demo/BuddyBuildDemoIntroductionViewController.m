//
//  BuddyBuildDemoIntroductionViewController.m
//  m2048
//
//  Created by Chris on 2015-12-25.
//  Copyright © 2015 Danqing. All rights reserved.
//

#import "BuddyBuildDemoIntroductionViewController.h"
#import "M2AppDelegate.h"

@interface BuddyBuildDemoIntroductionViewController ()
@property (nonatomic, strong) IBOutlet UIButton* okButton;
@end

@implementation BuddyBuildDemoIntroductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ok {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    M2AppDelegate* appDelegate = (M2AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.screenshottingAllowed = true;
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
