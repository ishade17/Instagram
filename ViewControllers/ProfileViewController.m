//
//  ProfileViewController.m
//  Instagram
//
//  Created by Isaac Schaider on 7/9/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>

@interface ProfileViewController ()
///<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.profilePicture.file = PFUser.currentUser[@"profilePic"];
    [self.profilePicture loadInBackground];
    self.profileBio.text = PFUser.currentUser[@"profileBio"];
    self.profileName.text = PFUser.currentUser[@"username"];
    
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
