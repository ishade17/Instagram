//
//  MainFeedViewController.m
//  Instagram
//
//  Created by Isaac Schaider on 7/6/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import "MainFeedViewController.h"
#import "SceneDelegate.h"
#import <Parse/Parse.h>
#import "SignInViewController.h"
#import <UIKit/UIKit.h>
#import "PostCell.h"

@interface MainFeedViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MainFeedViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainFeedTableView.dataSource = self;
    self.mainFeedTableView.delegate = self;
    self.mainFeedTableView.rowHeight = 800;
    [self fetchFeed];
}

- (IBAction)didTapLogout:(id)sender {
    SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignInViewController *signInViewController = [storyboard instantiateViewControllerWithIdentifier:@"SignInViewController"];
    sceneDelegate.window.rootViewController = signInViewController;
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
    }];
}

- (void)fetchFeed {
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query includeKey:@"author"];
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.postsArray = (NSMutableArray *)posts;
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        [self.mainFeedTableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.postsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    
    Post *postInfo = self.postsArray[indexPath.row];
    cell.post = postInfo;
    NSLog(@"hello!");
    cell.nameLabel.text = postInfo.author.username;
    cell.postImage.file = postInfo[@"image"]; 
    [cell.postImage loadInBackground];
    cell.captionLabel.text = postInfo.caption;
    cell.likesCountLabel.text = [NSString stringWithFormat:@"%@", postInfo.likeCount];
    
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
