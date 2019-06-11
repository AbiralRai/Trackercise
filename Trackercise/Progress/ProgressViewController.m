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
