//
//  BWTransitionOne.h
//  transitioning
//
//  Created by Benjamin Wu on 10/5/13.
//  Copyright (c) 2013 Benuuu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BWTransitionOneMode) {
    BWTransitionOneModePresent = 0,
    BWTransitionOneModeDismiss
};

@interface BWTransitionOne : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BWTransitionOneMode mode;

@end
