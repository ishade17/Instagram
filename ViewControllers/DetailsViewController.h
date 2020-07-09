//
//  DetailsViewController.h
//  Instagram
//
//  Created by Isaac Schaider on 7/8/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Post.h"
#import "PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) Post *post;
@property (weak, nonatomic) IBOutlet UILabel *nameLabelDetails;
@property (weak, nonatomic) IBOutlet PFImageView *postImageDetails;
@property (weak, nonatomic) IBOutlet UILabel *captionLabelDetails;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabelDetails;
@property (weak, nonatomic) IBOutlet UIButton *likeButtonDetails;
@property (weak, nonatomic) IBOutlet UILabel *timeAgoLabelDetails;
@property (weak, nonatomic) IBOutlet UILabel *commentsCountLabelDetails;
@property (weak, nonatomic) IBOutlet UIButton *commentsCountButtonDetails;

@end

NS_ASSUME_NONNULL_END
