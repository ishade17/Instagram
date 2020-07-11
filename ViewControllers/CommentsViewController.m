//
//  CommentsViewController.m
//  Instagram
//
//  Created by Isaac Schaider on 7/10/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import "CommentsViewController.h"
#import <Parse/Parse.h>
#import "CommentCell.h"
#import "Post.h"
#import "Comment.h"

@interface CommentsViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.commentsTableView.delegate = self;
    self.commentsTableView.dataSource = self;
    
    [self fetchComments];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchComments) forControlEvents:UIControlEventValueChanged];
    [self.commentsTableView insertSubview:self.refreshControl atIndex:0];

}

- (void)fetchComments {
    PFQuery *postQuery = [PFQuery queryWithClassName:@"Comment"];
    [postQuery includeKey:@"author"];
    [postQuery includeKey:@"post"];
    [postQuery whereKey:@"post" equalTo:self.post];
    
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable comments, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        } else {
            self.commentsArray = comments;
            [self.refreshControl endRefreshing];
            [self.commentsTableView reloadData];
        }
    }];
}

- (IBAction)tappedPostComment:(id)sender {
    
    [Comment postComments:self.commentMessageField.text onPost:self.post withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
    if (succeeded) {
        NSLog(@"Successful comment!");
        self.commentMessageField.text = @"";
        [self fetchComments];
    } else {
        NSLog(@"%@", error.localizedDescription);
    }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.commentsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    Comment *comment = self.commentsArray[indexPath.row];
    cell.commentLabel.text = comment.caption;
    cell.commentUserLabel.text = comment.author.username;
        
    return cell;
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
