//
//  ProfileViewController.h
//  Instagram
//
//  Created by Isaac Schaider on 7/9/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController

//@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) NSMutableArray *profilePostsArray;
@property (weak, nonatomic) IBOutlet UILabel *profileName;
@property (weak, nonatomic) IBOutlet UILabel *profileBio;
@property (weak, nonatomic) IBOutlet PFImageView *profilePicture;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

NS_ASSUME_NONNULL_END
