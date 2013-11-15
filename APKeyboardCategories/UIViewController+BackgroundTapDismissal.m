//
//  UIViewController+KeyboardUtilities.m
//  APKeyboardCategories
//
//  Created by Ashutosh Priyadarshy on 11/15/13.
//  Copyright (c) Ashutosh Priyadarshy. All rights reserved.
//

#import "UIViewController+BackgroundTapDismissal.h"

@implementation UIViewController (BackgroundTapDismissal)

-(UIView *)dismissKeyboardsWhenSubviewsOfViewTapped
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    // Let caller know what view we are applying this to.
    return self.view;
}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}


@end
