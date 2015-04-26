//
//  LinkedStoryboardSegue.m
//  MyAssessment
//
//  Created by jiakai lian on 26/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "LinkedStoryboardSegue.h"

@implementation LinkedStoryboardSegue

// the id should be like "SceneName@StoryboardName" which will load the target scene at the target storyboard
// or @"@StoryboardName" which will load the initial view controller at the target storyboard
+ (UIViewController *)sceneNamed:(NSString *)identifier
{
    NSArray *info = [identifier componentsSeparatedByString:@"@"];
    NSString *storyboard_name = info[1];
    NSString *scene_name = info[0];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboard_name
                                                         bundle:nil];
    UIViewController *scene = nil;

    if (scene_name.length == 0)
    {
        scene = [storyboard instantiateInitialViewController];
    }
    else
    {
        scene = [storyboard instantiateViewControllerWithIdentifier:scene_name];
    }

    return scene;
}

- (id)initWithIdentifier:(NSString *)identifier
                  source:(UIViewController *)source
             destination:(UIViewController *)destination
{
    return [super initWithIdentifier:identifier
                              source:source
                         destination:[LinkedStoryboardSegue sceneNamed:identifier]];
}

- (void)perform
{
    UIViewController *source = (UIViewController *) self.sourceViewController;
    [source.navigationController pushViewController:self.destinationViewController
                                           animated:YES];
}


@end
