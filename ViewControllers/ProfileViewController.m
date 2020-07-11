//
//  ProfileViewController.m
//  Instagram
//
//  Created by Isaac Schaider on 7/9/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import "EditProfileViewController.h"

@interface ProfileViewController () <EditProfileViewControllerDelegate>

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    [self loadProfile];
    NSLog(@"yup");
}

- (void)loadProfile {
    self.profilePicture.file = PFUser.currentUser[@"profilePic"];
    [self.profilePicture loadInBackground];
    self.profileBio.text = PFUser.currentUser[@"profileBio"];
    self.profileName.text = PFUser.currentUser[@"username"];
    NSLog(@"hello");
}

- (void)didEdit:(nonnull PFUser *)currentUser {
    [self loadProfile];
}

- (IBAction)tappedEditProfile:(id)sender {
    [self performSegueWithIdentifier:@"toEditProfile" sender:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier  isEqual: @"toEditProfile"]){
        EditProfileViewController *editProfileViewController = [segue destinationViewController];
//        EditProfileViewController *editProfileViewController = (EditProfileViewController *)navigationController.topViewController;
        editProfileViewController.delegate = self;
    }
}


@end
