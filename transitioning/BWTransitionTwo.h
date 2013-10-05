//
//  BWTransitionTwo.h
//  transitioning
//
//  Created by Benjamin Wu on 10/5/13.
//  Copyright (c) 2013 Benuuu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BWTransitionTwoMode) {
    BWTransitionTwoModePresent = 0,
    BWTransitionTwoModeDismiss
};

@interface BWTransitionTwo : NSObject <UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic) BWTransitionTwoMode mode;

@end
