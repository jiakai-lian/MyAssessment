//
//  LinkedStoryboardSegue.h
//  MyAssessment
//
//  Created by jiakai lian on 26/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinkedStoryboardSegue : UIStoryboardSegue

+ (UIViewController *)sceneNamed:(NSString *)identifier;

@end
