//
//  TableViewController.h
//  Trackercise
//
//  Created by Abiral Rai on 13/5/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewController : UITableViewController{
    
    
    NSMutableArray *getTitle;
    NSMutableArray *getDuration;
    
    NSMutableArray *title;
    NSMutableArray *duration;
    
    
}

@end

NS_ASSUME_NONNULL_END
