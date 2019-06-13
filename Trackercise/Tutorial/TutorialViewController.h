//
//  TutorialViewController.h
//  Trackercise
//
//  Created by Abiral Rai on 16/5/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TutorialViewController : UIViewController <UISearchBarDelegate> {
    
    NSTimer *timer;
    UIActivityIndicatorView *spinner;
    
}

@property(strong,nonatomic) WKWebView *webView;
@property (strong, nonatomic) NSString *productURL;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actInd;

@end

NS_ASSUME_NONNULL_END
