//
//  BWSecondViewController.m
//  transitioning
//
//  Created by Benjamin Wu on 10/5/13.
//  Copyright (c) 2013 Benuuu. All rights reserved.
//

#import "BWSecondViewController.h"

@interface BWSecondViewController ()

@end

@implementation BWSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)buttonTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
