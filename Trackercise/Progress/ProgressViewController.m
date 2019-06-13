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


NSString *progressImgURL;

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

- (IBAction)add:(id)sender {
    
    NSLog(@"CLickeD! ");
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = true;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
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
    
    
    // Points to "progressImg/uuid"
    // Note that you can use variables to create child values
//    NSString *imgFileName = uuid;
//    fileName = [@"progressImg/" stringByAppendingString:fileName];
    NSString *imageID = [[NSUUID UUID] UUIDString];
    NSString *imageName = [NSString stringWithFormat:@"progressImg/%@.jpg", imageID];
    
    FIRStorageReference *imageRef = [storageRef child: imageName];
    
    [imageRef putData:imageData metadata:metadata completion:^(FIRStorageMetadata *metadata, NSError *error)
     {
         if (!error)
         {
             NSLog(@"Success log to db");
             self.imageView.image = image;
             
         }
         else if (error)
         {
             NSLog(@"Failed to Register User with profile image");
         }
     }];
    
    
    
    // Upload file and metadata to the object 'images/mountains.jpg'
//    FIRStorageUploadTask *uploadTask = [imageRef putData:imageData metadata:metadata];
//
//    // Listen for state changes, errors, and completion of the upload.
//    [uploadTask observeStatus:FIRStorageTaskStatusResume handler:^(FIRStorageTaskSnapshot *snapshot) {
//        // Upload resumed, also fires when the upload starts
//    }];
//
//    // Errors only occur in the "Failure" case
//    [uploadTask observeStatus:FIRStorageTaskStatusFailure handler:^(FIRStorageTaskSnapshot *snapshot) {
//        if (snapshot.error != nil) {
//            switch (snapshot.error.code) {
//
//                case FIRStorageErrorCodeUnauthorized:
//                    // User doesn't have permission to access file
//
//                    NSLog(@"Unsucces 1: %@", snapshot.error );
//                    break;
//
//                case FIRStorageErrorCodeObjectNotFound:
//                    // File doesn't exist
//                    NSLog(@"Unsucces 2: %@", snapshot.error );
//                    break;
//
//                case FIRStorageErrorCodeCancelled:
//                    // User canceled the upload
//                    NSLog(@"Unsucces 3: %@", snapshot.error );
//                    break;
//
//                    /* ... */
//
//                case FIRStorageErrorCodeUnknown:
//                    // Unknown error occurred, inspect the server response
//                    NSLog(@"Unsucces 4: %@", snapshot.error );
//                    break;
//            }
//        }
//    }];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)next:(id)sender {
    
    imageInt += 1;
    
    [self imageGallery];
    
}


- (IBAction)back:(id)sender {
    
    imageInt -= 1;
    
    [self imageGallery];
    
}

-(void)imageGallery {
    
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image%i.jpg", imageInt]];
    self.label.text = [NSString stringWithFormat:@"%i/6", imageInt];
    
//    NSMutableArray *imageArray = [[NSMutableArray alloc]init];
    
    // Points to the root reference
//    FIRStorageReference *storageRef = [[FIRStorage storage] reference];
//    
//    FIRStorageReference *pathRef = [storageRef child: @"progressImg"];
    
//    [storageRef dataWithMaxSize:1 * 1024 * 1024 completion:^(NSData *data, NSError *error) {
//        // This runs second
//        UIImage *image = [UIImage imageWithData:data];
//        [imageArray addObject:image];
//        // This runs third, and now [self.imagesArray count] == 1
//        // so this doesn't crash the program
//        self->_imageView.image = imageArray.firstObject;
//    }];
    
//    NSString * stringRefPath = [NSString stringWithFormat:@"%@", [pathRef fullPath]];
//
//    NSString *url =[ @"gs://objc-trackerise.appspot.com/" stringByAppendingString:stringRefPath];
//
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url]
//                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]];


//    [pathRef dataWithMaxSize:1 * 1020 * 1024 completion:^(NSData *data, NSError *error){
//        UIImage *image = [UIImage imageWithData:data];
//        [imageArray addObject:image];
//
//        self.imageView.image = imageArray.firstObject;
//    }];
    
    // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
//    [pathRef dataWithMaxSize:1 * 1024 * 1024 completion:^(NSData *data, NSError *error){
//        if (error != nil) {
//            // Uh-oh, an error occurred!
//            NSLog(@"Error :%@",error);
//        } else {
//            // Data for "images/island.jpg" is returned
//            UIImage *image = [UIImage imageWithData:data];
//            [imageArray addObject:image];
//        }
//    }];
    
    
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
@end
