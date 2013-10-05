//
//  BWTransitionOne.m
//  transitioning
//
//  Created by Benjamin Wu on 10/5/13.
//  Copyright (c) 2013 Benuuu. All rights reserved.
//

#import "BWTransitionOne.h"

@implementation BWTransitionOne


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect sourceRect = [transitionContext initialFrameForViewController:fromViewController];
    
    CGAffineTransform rotation = CGAffineTransformMakeRotation(- M_PI / 2);
    
    UIView *container = [transitionContext containerView];
    
    if (self.mode == BWTransitionOneModePresent) {
        [container addSubview:toViewController.view];

        toViewController.view.layer.anchorPoint = CGPointZero;
        toViewController.view.frame = sourceRect;
        toViewController.view.transform = rotation;

        [UIView animateWithDuration:1.0
                              delay:0.0
             usingSpringWithDamping:.3
              initialSpringVelocity:3
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             toViewController.view.transform = CGAffineTransformIdentity;
                         }
                         completion:^(BOOL finished){
                             [transitionContext completeTransition:YES];
                         }];
    } else if (self.mode == BWTransitionOneModeDismiss) {
        [UIView animateWithDuration:.25
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             fromViewController.view.transform = rotation;
                         } completion:^(BOOL finished) {
                             [fromViewController.view removeFromSuperview];
                             [transitionContext completeTransition:YES];
                         }];
    }
}

@end
