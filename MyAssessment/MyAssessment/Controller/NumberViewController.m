//
//  NumberViewController.m
//  MyAssessment
//
//  Created by jiakai lian on 27/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "NumberViewController.h"

NSString *const NOTIFICATION_BUTTON_GO_PRESSED = @"ButtonGoPressed";

@interface NumberViewController ()
@property(weak, nonatomic) IBOutlet UILabel *labelNumber;

@end

@implementation NumberViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self configureViews];
}

#pragma mark - configureViews
- (void)configureViews
{
    self.labelNumber.text = self.strNumber;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction
- (IBAction)tapOnButtonGo:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_BUTTON_GO_PRESSED object:self.strNumber userInfo:nil];
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
