//
//  DetailsViewController.m
//  Instagram
//
//  Created by Isaac Schaider on 7/8/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import "DetailsViewController.h"
#import "Post.h"
#import "NSDate+DateTools.h"
#import "CommentsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.postImageDetails.file = self.post.image;
    [self.postImageDetails loadInBackground];
    self.likeCountLabelDetails.text = [NSString stringWithFormat:@"%@ Likes", self.post.likeCount];
    self.captionLabelDetails.text = self.post.caption;
    self.nameLabelDetails.text = self.post.author.username;
    self.commentsCountLabelDetails.text = [NSString stringWithFormat:@"View all %@ comments", self.post.commentCount];
    self.timeAgoLabelDetails.text = [NSString stringWithFormat:@"%@ ago", self.post.createdAt.shortTimeAgoSinceNow];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"toCommentSegue"]) {
        CommentsViewController *commentsViewController = [segue destinationViewController];
        commentsViewController.post = self.post;
    }
}


@end
