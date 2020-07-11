//
//  EditProfileViewController.m
//  Instagram
//
//  Created by Isaac Schaider on 7/10/20.
//  Copyright © 2020 codepath. All rights reserved.
//

#import "EditProfileViewController.h"
#import <Parse/Parse.h>
#import "ProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.

    [self.profilePicture.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [self.profilePicture.layer setBorderWidth: 0.5];
    self.profilePicture.alpha = 1;
    
}

- (IBAction)tappedChooseImage:(id)sender {
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
    self.profilePicture.image = [self resizeImage:editedImage withSize:CGSizeMake(150, 150)];
    self.uploadProfilePicLabel.alpha = 0;
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

- (IBAction)tappedUpdateProfile:(id)sender {
    if (self.profilePicture.image != nil) {
        NSData *imageData = UIImagePNGRepresentation(self.profilePicture.image);
        PFUser.currentUser[@"profilePic"] = [PFFileObject fileObjectWithName:@"image.png" data:imageData];
    }

    PFUser.currentUser[@"profileBio"] = self.profileBioTextField.text;
    [PFUser.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"User profile updated with pic and bio");
            [self refreshData];
            [self dismissViewControllerAnimated:true completion:nil];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (void)refreshData {
    ProfileViewController *profile = [[ProfileViewController alloc] init];
    profile.profilePicture.file = PFUser.currentUser[@"profilePic"];
    [profile.profilePicture loadInBackground];
    profile.profileBio.text = PFUser.currentUser[@"profileBio"];
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
