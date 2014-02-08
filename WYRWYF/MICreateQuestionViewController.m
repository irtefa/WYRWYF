//
//  MICreateQuestionViewController.m
//  WYRWYF
//
//  Created by Mohd Irtefa on 2/7/14.
//  Copyright (c) 2014 Irtefa. All rights reserved.
//

#import "MICreateQuestionViewController.h"

@interface MICreateQuestionViewController ()

@end

@implementation MICreateQuestionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)confirmQuestion:(id)sender {
}

- (IBAction)cancelQuestion:(id)sender {
    // Figure this shit out later
    [self.firstPart resignFirstResponder];
    [self.secondPart resignFirstResponder];
}
@end
