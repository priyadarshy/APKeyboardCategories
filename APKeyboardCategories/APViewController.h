//
//  APViewController.h
//  APKeyboardCategories
//
//  Created by Ashutosh Priyadarshy on 11/15/13.
//  Copyright (c) Ashutosh Priyadarshy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *textFieldTop;
@property (nonatomic, weak) IBOutlet UITextField *textFieldBottom;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *topFieldConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *bottomFieldConstraint;


@end
