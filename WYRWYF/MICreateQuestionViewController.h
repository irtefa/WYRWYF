//
//  MICreateQuestionViewController.h
//  WYRWYF
//
//  Created by Mohd Irtefa on 2/7/14.
//  Copyright (c) 2014 Irtefa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MIPickRecipientsViewController.h"

@interface MICreateQuestionViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *firstPart;
@property (strong, nonatomic) IBOutlet UITextField *secondPart;
- (IBAction)cancelQuestion:(id)sender;
- (IBAction)confirmQuestion:(id)sender;

@end
