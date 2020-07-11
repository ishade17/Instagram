//
//  CommentsViewController.h
//  Instagram
//
//  Created by Isaac Schaider on 7/10/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentsViewController : UIViewController

@property (nonatomic, strong) Post *post;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) NSMutableArray *commentsArray;
@property (weak, nonatomic) IBOutlet UITextField *commentMessageField;
@property (weak, nonatomic) IBOutlet UITableView *commentsTableView;

@end

NS_ASSUME_NONNULL_END
