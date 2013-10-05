//
//  BWTransitionTwo.m
//  transitioning
//
//  Created by Benjamin Wu on 10/5/13.
//  Copyright (c) 2013 Benuuu. All rights reserved.
//

#import "BWTransitionTwo.h"
#import "BWBackgroundViewController.h"

static NSTimeInterval const kTransitionTime = 1.0;

@implementation BWTransitionTwo

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext;
{
    return kTransitionTime;
}


// Assumes a background view of full size.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext;
{
    BWBackgroundViewController *fromViewController = (BWBackgroundViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    BWBackgroundViewController *toViewController = (BWBackgroundViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toViewController.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    fromViewController.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    UIView *container = [transitionContext containerView];
    CGRect initialBackgroundFrame = fromViewController.backgroundView.frame;

    if (self.mode == BWTransitionTwoModePresent) {
        [container addSubview:toViewController.view];
        
        toViewController.view.frame = CGRectMake(320, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
        toViewController.backgroundView.hidden = YES;
        fromViewController.backgroundView.hidden = NO;
        
        [UIView animateWithDuration:kTransitionTime animations:^{
            toViewController.view.frame = CGRectMake(0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
            fromViewController.view.frame = CGRectMake(-320, 0, fromViewController.view.frame.size.width, fromViewController.view.frame.size.height);
            fromViewController.backgroundView.frame = CGRectMake(320, 0, fromViewController.backgroundView.frame.size.width, fromViewController.backgroundView.frame.size.height);
        } completion:^(BOOL finished) {
            fromViewController.backgroundView.frame = initialBackgroundFrame;
            toViewController.backgroundView.hidden = NO;
            [transitionContext completeTransition:YES];
        }];
    } else if (self.mode == BWTransitionTwoModeDismiss) {
        toViewController.view.frame = CGRectMake(-320, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
        toViewController.backgroundView.hidden = NO;
        fromViewController.backgroundView.hidden = YES;
        
        toViewController.backgroundView.frame = CGRectMake(320, 0, toViewController.backgroundView.frame.size.width, toViewController.backgroundView.frame.size.height);
        
        [UIView animateWithDuration:kTransitionTime animations:^{
            toViewController.view.frame = CGRectMake(0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
            toViewController.backgroundView.frame = CGRectMake(0, 0, toViewController.backgroundView.frame.size.width, toViewController.backgroundView.frame.size.height);
            fromViewController.view.frame = CGRectMake(320, 0, fromViewController.view.frame.size.width, fromViewController.view.frame.size.height);
        } completion:^(BOOL finished) {
            fromViewController.backgroundView.frame = initialBackgroundFrame;
            toViewController.backgroundView.hidden = NO;
            [fromViewController.view removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
        
        
    }
    
    
}

@end
