//
//  MainFeedViewController.h
//  Instagram
//
//  Created by Isaac Schaider on 7/6/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainFeedViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *postsArray;
@property (weak, nonatomic) IBOutlet UITableView *mainFeedTableView;


@end

NS_ASSUME_NONNULL_END
