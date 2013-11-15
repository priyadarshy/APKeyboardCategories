//
//  NSLayoutConstraint+MoveWithKeyboard.m
//  APKeyboardCategories
//
//  Created by Ashutosh Priyadarshy on 11/15/13.
//  Copyright (c) 2013 EEMe labs. All rights reserved.
//

#import "NSLayoutConstraint+MoveWithKeyboard.h"

@implementation NSLayoutConstraint (MoveWithKeyboard)

-(void)enableAdjustToKeyboard
{
    // Register for keyboard notifications so that we can act accordingly.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

// Perform the movement up and the movement down as needed.
- (void)keyboardWasShown:(NSNotification*)notification
{
    NSNumber *animationDuration = [[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    [self adjustConstantBy:[NSNumber numberWithInt:-100] tracksKeyboardAnimation:YES withDuration:animationDuration portraitAllowed:YES landscapeAllowed:NO];
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)notification
{
    NSNumber *animationDuration = [[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    [self adjustConstantBy:[NSNumber numberWithInt:100] tracksKeyboardAnimation:YES withDuration:animationDuration portraitAllowed:YES landscapeAllowed:NO];
}

-(void)adjustConstantBy:(NSNumber *)amount
tracksKeyboardAnimation:(BOOL)tracksKeyboardAnimation
           withDuration:(NSNumber *)animationDuration
        portraitAllowed:(BOOL)portraitAllowed
       landscapeAllowed:(BOOL)landscapeAllowed
{
    // Create a list of acceptable orientations.
    NSMutableArray *allowedOrientations = [[NSMutableArray alloc] init];
    if (portraitAllowed) {
        [allowedOrientations addObject:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait]];
        [allowedOrientations addObject:[NSNumber numberWithInteger:UIInterfaceOrientationPortraitUpsideDown]];
    }
    if (landscapeAllowed) {
        [allowedOrientations addObject:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeLeft]];
        [allowedOrientations addObject:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight]];
    }
    
    // Only animate in those acceptable modes.
    NSNumber *orientation = [NSNumber numberWithInteger:[[UIApplication sharedApplication] statusBarOrientation]];
    if ([allowedOrientations containsObject:orientation]) {
        
        // Determine keyboard animation duration and track the keyboard.
        NSNumber *animationDuration;
        if (!tracksKeyboardAnimation) {
            animationDuration = [NSNumber numberWithFloat:0.0];
        }
        
        // Perform the animation. 
        [UIView animateWithDuration:[animationDuration floatValue] animations:^{
            // Adjust the constraint's value.
            self.constant += [amount floatValue];
        }];
    }
}


@end
