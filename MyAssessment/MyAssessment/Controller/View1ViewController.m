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

static NSString *const STRING_BUTTON_PRESSED_FORMAT = @"button pressed is %@";

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

        //reset label text to none
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
        self.label.text = [NSString stringWithFormat:STRING_BUTTON_PRESSED_FORMAT, [notification object]];
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
        //set which button is pressed by button tag
        destination.btnPressed = btn.tag;
        //set background color
        destination.view.backgroundColor = btn.color;
    }


}


@end
