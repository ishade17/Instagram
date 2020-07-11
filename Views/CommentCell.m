//
//  CommentCell.m
//  Instagram
//
//  Created by Isaac Schaider on 7/8/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import "CommentCell.h"
#import "Comment.h"
#import <Parse/Parse.h>

@implementation CommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*+ (void)updateWithComment: (Comment *)comment {
    self.commentUserLabel = comment.author;
    self.commentLabel = comment.caption;
    
}
 */

@end
