APKeyboardCategories
====================

Categories on UIViewController and NSLayoutConstraint to make text fields responsive to keyboard position.

Below is an example view controller that uses the categories. We have
two text fields each with an NSLayoutConstraint that is between the text
field and the super view. They are called `self.bottomFieldConstraints` and
`self.topFieldConstraint`. To make the NSLayoutConstraints respond we
just call `[myLayoutConstraint enableAdjustToKeyboard];`.

The second category here is `UIViewController+BackgroundTapDismissal.h`.
It works in a very naive way that seems to be plenty good for most of
my uses. It looks at the view controller's `self.view` and performs the
selector `endEditing` on it. If you want to do something fancy this
might not work. Perhaps a better choice would be making adding a
category on UIView but then you can't be sure where the keyboard is.
There's an assumption that some subview of your `self.view` is the
`firstResponder`.

Here is the example file. 

```objc

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

```
