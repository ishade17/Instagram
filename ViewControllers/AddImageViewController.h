//
//  AddImageViewController.h
//  Instagram
//
//  Created by Isaac Schaider on 7/7/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainFeedViewController.h"
#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddImageViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *selectedImage;
@property (weak, nonatomic) IBOutlet UILabel *uploadImageLabel;
@property (weak, nonatomic) IBOutlet UITextView *captionTextView;

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size;
- (void)textViewDidBeginEditing:(UITextView *)textView;
- (void)textViewDidEndEditing:(UITextView *)textView;

@end

NS_ASSUME_NONNULL_END
