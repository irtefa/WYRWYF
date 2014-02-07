//
//  MICreateQuestionViewController.h
//  WYRWYF
//
//  Created by Mohd Irtefa on 2/7/14.
//  Copyright (c) 2014 Irtefa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MICreateQuestionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstPart;
@property (weak, nonatomic) IBOutlet UITextField *secondPart;
- (IBAction)confirmQuestion:(id)sender;
- (IBAction)cancelQuestion:(id)sender;

@end
