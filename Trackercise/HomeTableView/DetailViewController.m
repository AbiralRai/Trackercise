//
//  DetailViewController.m
//  Trackercise
//
//  Created by Abiral Rai on 14/5/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = self.detailModal[0];
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [self.scrollView setContentSize:CGSizeMake(0, 2000)];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didClick:(id)sender {
    [self.view endEditing:YES];
}

@end
