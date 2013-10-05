//
//  BWViewController.m
//  transitioning
//
//  Created by Benjamin Wu on 10/5/13.
//  Copyright (c) 2013 Benuuu. All rights reserved.
//

#import "BWViewController.h"

#import "BWSecondViewController.h"
#import "BWTransitionOne.h"
#import "BWTransitionTwo.h"

@interface BWViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation BWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTouched:(id)sender {
    BWSecondViewController *secondViewController = [[BWSecondViewController alloc] init];
    secondViewController.transitioningDelegate = self;
    
    [self presentViewController:secondViewController animated:YES completion:nil];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
//    BWTransitionOne *transition = [[BWTransitionOne alloc] init];
//    transition.mode = BWTransitionOneModePresent;
    BWTransitionTwo *transition = [[BWTransitionTwo alloc] init];
    transition.mode = BWTransitionTwoModePresent;
    return transition;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
//    BWTransitionOne *transition = [[BWTransitionOne alloc] init];
//    transition.mode = BWTransitionOneModeDismiss;
    BWTransitionTwo *transition = [[BWTransitionTwo alloc] init];
    transition.mode = BWTransitionTwoModeDismiss;

    return transition;
}

@end
