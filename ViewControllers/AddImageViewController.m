//
//  AddImageViewController.m
//  Instagram
//
//  Created by Isaac Schaider on 7/7/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import "AddImageViewController.h"
#import "Post.h"

@interface AddImageViewController () <UITextViewDelegate>

@end

@implementation AddImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.selectedImage.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [self.selectedImage.layer setBorderWidth: 0.5];
    self.selectedImage.image = nil;
    self.uploadImageLabel.alpha = 1;
    
    self.captionTextView.delegate = self;
    self.captionTextView.text = @"Add a caption...";
    self.captionTextView.textColor = UIColor.lightGrayColor;
    
    self.captionTextView.layer.borderWidth = 0.5f;
    self.captionTextView.layer.borderColor = [[UIColor grayColor] CGColor];
}

- (void)viewWillAppear:(BOOL)animated {
    // Re enable text view
}

- (IBAction)tappedSelectImage:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (IBAction)tappedCaptureImage:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePickerVC animated:YES completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Camera not available"
               message:@"Use photo library instead"
        preferredStyle:(UIAlertControllerStyleAlert)];

        // create an OK action
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                                 // handle response here.
                                                         }];
        // add the OK action to the alert controller
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    // UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Do something with the images (based on your use case)
    self.selectedImage.image = [self resizeImage:editedImage withSize:CGSizeMake(150, 150)];
    self.uploadImageLabel.alpha = 0;
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (IBAction)tappedPost:(id)sender {
    if (self.selectedImage.image != nil && [self.captionTextView hasText]) {
    [Post postUserImage:self.selectedImage.image withCaption:self.captionTextView.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"Successful post!");
            self.tabBarController.selectedIndex = 0;
            self.captionTextView.text = @"";
            self.selectedImage.image = nil;
            self.uploadImageLabel.alpha = 1;
        } else {
            NSLog(@"Error while posting");
        }
        }];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error with post"
               message:@"Please select a photo and caption"
        preferredStyle:(UIAlertControllerStyleAlert)];

        // create an OK action
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                                 // handle response here.
                                                         }];
        // add the OK action to the alert controller
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:^{
        }];
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"Add a caption..."]) {
        textView.text = @"";
        self.captionTextView.textColor = UIColor.blackColor;
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Add a caption...";
        self.captionTextView.textColor = UIColor.lightGrayColor;
    }
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
