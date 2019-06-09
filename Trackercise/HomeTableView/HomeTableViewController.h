//
//  TableViewController.h
//  Trackercise
//
//  Created by Abiral Rai on 13/5/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCell.h"
@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewController : UITableViewController{
    
    
    NSMutableArray *getTitle;
    NSMutableArray *getDuration;
    
    NSMutableArray *title;
    NSMutableArray *duration;
    
    __block NSArray *programTitle;
    __block NSArray *programDuration;
    
    
    
}

@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

NS_ASSUME_NONNULL_END
