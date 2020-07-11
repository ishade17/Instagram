//
//  Comment.h
//  Instagram
//
//  Created by Isaac Schaider on 7/10/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import <Parse/Parse.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface Comment : PFObject<PFSubclassing>

@property (nonatomic, strong) PFUser *author;
@property (nonatomic, strong) Post *post;
@property (nonatomic, strong) NSString *caption;

+ (void) postComments: (NSString * _Nullable)caption onPost: (Post *)post withCompletion: (PFBooleanResultBlock _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
