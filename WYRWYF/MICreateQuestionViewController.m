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
}

- (IBAction)cancelQuestion:(id)sender {
    // Figure this shit out later
    [self.firstPart resignFirstResponder];
    [self.secondPart resignFirstResponder];
}

- (IBAction)confirmQuestion:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:[self.firstPart.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"firstPart"];
    [[NSUserDefaults standardUserDefaults] setObject:[self.secondPart.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:@"secondPart"];
}

@end
