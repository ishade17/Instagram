//
//  EditProfileViewController.h
//  Instagram
//
//  Created by Isaac Schaider on 7/10/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol EditProfileViewControllerDelegate

- (void)didEdit:(PFUser *)currentUser;

@end

@interface EditProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet PFImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *uploadProfilePicLabel;
@property (weak, nonatomic) IBOutlet UITextField *profileBioTextField;

@property (nonatomic, weak) id<EditProfileViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
