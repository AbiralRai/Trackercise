//
//  DetailViewController.h
//  Trackercise
//
//  Created by Abiral Rai on 14/5/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *detailModal;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;


- (IBAction)didClick:(id)sender;


@end

NS_ASSUME_NONNULL_END
