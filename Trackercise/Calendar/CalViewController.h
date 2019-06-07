//
//  CalViewController.h
//  Trackercise
//
//  Created by Abiral Rai on 16/5/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"

NS_ASSUME_NONNULL_BEGIN


@interface CalViewController : UIViewController 
@property (weak , nonatomic) FSCalendar *calendar;
//@property (readonly, nonatomic) NSCalendar *calendar;

//@property (strong, nonatomic) IBInspectable UIColor *todayColor;
@property (weak, nonatomic) IBOutlet UIView *calView;

@end

NS_ASSUME_NONNULL_END
