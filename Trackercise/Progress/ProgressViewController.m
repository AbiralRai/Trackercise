//
//  ProgressViewController.m
//  Trackercise
//
//  Created by Abiral Rai on 16/5/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import "ProgressViewController.h"


@interface ProgressViewController ()

@end

@implementation ProgressViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    imageInt = 1;
    
    [self imageGallery];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)next:(id)sender {
    
    imageInt += 1;
    
    [self imageGallery];
    
}


- (IBAction)back:(id)sender {
    
    imageInt -= 1;
    
    [self imageGallery];
    
}

- (IBAction)add:(id)sender {
    
    NSLog(@"CLickeD! ");
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = true;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    //You can retrieve the actual UIImage
    UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // Generate a data from the image selected
    NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
    
    // Create the file metadata
    FIRStorageMetadata *metadata = [[FIRStorageMetadata alloc] init];
    metadata.contentType = @"image/jpeg";
    
    // Points to the root reference
    FIRStorageReference *storageRef = [[FIRStorage storage] reference];
    
    // Points to "images"
    FIRStorageReference *imagesRef = [storageRef child:@"progressImg"];
    
    // Points to "progressImg/uuid"
    // Note that you can use variables to create child values
    NSString *fileName = uuid;
    FIRStorageReference *uuidRef = [imagesRef child:fileName];
    
    // Upload file and metadata to the object 'images/mountains.jpg'
    FIRStorageUploadTask *uploadTask = [uuidRef putData:imageData metadata:metadata];
    
    // Listen for state changes, errors, and completion of the upload.
    [uploadTask observeStatus:FIRStorageTaskStatusResume handler:^(FIRStorageTaskSnapshot *snapshot) {
        // Upload resumed, also fires when the upload starts
    }];
    
    // Errors only occur in the "Failure" case
    [uploadTask observeStatus:FIRStorageTaskStatusFailure handler:^(FIRStorageTaskSnapshot *snapshot) {
        if (snapshot.error != nil) {
            switch (snapshot.error.code) {
                    
                case FIRStorageErrorCodeUnauthorized:
                    // User doesn't have permission to access file
                    
                    NSLog(@"Unsucces 1: %@", snapshot.error );
                    break;
                    
                case FIRStorageErrorCodeObjectNotFound:
                    // File doesn't exist
                    NSLog(@"Unsucces 2: %@", snapshot.error );
                    break;
                    
                case FIRStorageErrorCodeCancelled:
                    // User canceled the upload
                    NSLog(@"Unsucces 3: %@", snapshot.error );
                    break;
                    
                    /* ... */
                    
                case FIRStorageErrorCodeUnknown:
                    // Unknown error occurred, inspect the server response
                    NSLog(@"Unsucces 4: %@", snapshot.error );
                    break;
            }
        }
    }];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)imageGallery {
    
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image%i.jpg", imageInt]];
    self.label.text = [NSString stringWithFormat:@"%i/6", imageInt];
    
    
    if (imageInt == 1) {
        
        self.backButton.enabled = NO;
        self.backButton.alpha = 0.5;
        
    } else if (imageInt == 6) {
        
        self.nextButton.enabled = NO;
        self.nextButton.alpha = 0.5;
        
    } else {
        
        self.nextButton.enabled = YES;
        self.nextButton.alpha = 1.0;
        self.backButton.enabled = YES;
        self.backButton.alpha = 1.0;
        
    }
    
}

//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//
//
//    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
//    self.imagePicked.image = chosenImage;
//    [[NSUserDefaults standardUserDefaults] setObject:UIImagePNGRepresentation(chosenImage) forKey:@"userImage"]
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//
//}
//
////Retrieving the image
//
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"userImage"];
//    UIImage* userImage = [UIImage imageWithData:imageData];
//    self.imagePicked.image = userImage;
//}

@end
