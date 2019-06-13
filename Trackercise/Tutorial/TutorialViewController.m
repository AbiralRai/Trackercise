//
//  TutorialViewController.m
//  Trackercise
//
//  Created by Abiral Rai on 16/5/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [spinner setCenter:CGPointMake(160,124)];
    [self.view addSubview:spinner];
    spinner.tag = 100;
    [spinner startAnimating];
    
    self.productURL = @"https://www.youtube.com/playlist?list=PL_UAXxDwtUkEexoG8TO-WXjJlfD8ScnwW";
    
    NSURL *url = [NSURL URLWithString:self.productURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    _webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [_webView loadRequest:request];
    _webView.frame = CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    
    
    _webView.userInteractionEnabled = true;
    _webView.allowsBackForwardNavigationGestures = true;
    
    [self.view addSubview:_webView];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    [spinner stopAnimating];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
