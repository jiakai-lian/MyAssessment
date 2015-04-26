//
//  View2ViewController.m
//  MyAssessment
//
//  Created by jiakai lian on 27/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "View2ViewController.h"
#import "NumberViewController.h"

static NSString *const STRING_BUTTON_PRESSED_FORMAT = @"button pressed is %ld";

@interface View2ViewController ()

@property(weak, nonatomic) IBOutlet UILabel *labelButtonPressed;

@end

@implementation View2ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self configureViews];

    //register to receive notification
    [[NSNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(didReceivedButtonGoPressedNotification:)
                   name:NOTIFICATION_BUTTON_GO_PRESSED
                 object:nil];
}

- (void) dealloc
{
    //remove from observer list
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_BUTTON_GO_PRESSED object:nil];
}


#pragma mark - configureViews
- (void)configureViews
{
    //update label text
    self.labelButtonPressed.text = [NSString stringWithFormat:STRING_BUTTON_PRESSED_FORMAT, (long) self.btnPressed];
}

#pragma mark - notification
- (void)didReceivedButtonGoPressedNotification:(NSNotification *)notification
{
    NSLog(@"notification: %@", notification);
    
    //back to previous screen
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UIViewController *controller = segue.destinationViewController;
    if ([controller isKindOfClass:[NumberViewController class]])
    {
        //set the number label text by segue identifier
        NumberViewController *destination = (NumberViewController *) controller;
        destination.strNumber = segue.identifier;
    }
}

@end
