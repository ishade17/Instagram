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
    
//     self.collectionView.dataSource = self;
//     self.collectionView.delegate = self;
         
//    [self.currentUser setObject:imageFile forKey:@"profilePicture"];
//    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            
//        } else {
//            
//        }
//    }];
//    
//    if (self.profilePicture == nil) {
//        [self.profilePicture.layer setBorderColor: [[UIColor blackColor] CGColor]];
//        [self.profilePicture.layer setBorderWidth: 0.5];
//        self.profilePicture.image = nil;
//    }
}

/*
 - (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
     
     
     return cell;
 }


 - (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
     return self.profilePostsArray.count;
 }
 
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
