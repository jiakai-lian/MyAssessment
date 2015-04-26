//
//  View1ViewController.m
//  MyAssessment
//
//  Created by jiakai lian on 26/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "View1ViewController.h"
#import "View2ViewController.h"
#import "ColorButton.h"
#import "NumberViewController.h"

//type
typedef NS_ENUM(NSUInteger, SettingType){
    BUTTON_BLUE_Ind = 0,
    BUTTON_RED_TAG = 1,
    BUTTON_GREEN_TAG = 2,
};

static NSString *const NONE = @"none";
static NSString *const SEGUE_ID = @"@View2";

@interface View1ViewController ()
@property(weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation View1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[NSNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(didReceivedButtonGoPressedNotification:)
                   name:NOTIFICATION_BUTTON_GO_PRESSED
                 object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction
- (IBAction)tapOnButton:(id)sender
{

    if ([sender isKindOfClass:[ColorButton class]])
    {
        ColorButton *btn = (ColorButton *) sender;

        self.label.text = NONE;
        if (btn.color)
        {
            [self performSegueWithIdentifier:SEGUE_ID sender:btn];
        }
        else
        {
            assert(@"the color property has to be set");
        }
    }
    else
    {
        assert(@"the sender should be a customized color button obejct ");
    }
}

#pragma mark - notification
- (void)didReceivedButtonGoPressedNotification:(NSNotification *)notification
{
    NSLog(@"notification: %@", notification);

    if ([notification.object isKindOfClass:[NSString class]])
    {
        self.label.text = [notification object];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    if ([segue.identifier isEqualToString:SEGUE_ID])
    {
        ColorButton *btn = (ColorButton *) sender;
        View2ViewController *destination = (View2ViewController *) [segue destinationViewController];
        destination.btnPressed = btn.tag;
        destination.view.backgroundColor = btn.color;
    }


}


@end
