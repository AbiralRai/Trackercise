//
//  ProgressViewController.h
//  Trackercise
//
//  Created by Abiral Rai on 16/5/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@import Firebase;
@import FirebaseStorage;

@interface ProgressViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    
    int imageInt;
    Boolean add;
    
    
}


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

- (IBAction)next:(id)sender;
- (IBAction)back:(id)sender;
- (IBAction)add:(id)sender;


@end

NS_ASSUME_NONNULL_END
