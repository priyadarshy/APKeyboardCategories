//
//  APViewController.m
//  APKeyboardCategories
//
//  Created by Ashutosh Priyadarshy on 11/15/13.
//  Copyright (c) Ashutosh Priyadarshy. All rights reserved.
//

#import "APViewController.h"
#import "UIViewController+BackgroundTapDismissal.h"
#import "NSLayoutConstraint+MoveWithKeyboard.h"

@interface APViewController ()

@end

@implementation APViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Make the text fields responsive to the keyboard.
    [self.bottomFieldConstraint enableAdjustToKeyboard];
    [self.topFieldConstraint enableAdjustToKeyboard];
    
    // Make the background area dismiss the keyboard.
    [self dismissKeyboardsWhenSubviewsOfViewTapped];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
