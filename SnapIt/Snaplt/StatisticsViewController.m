//
//  StatisticsViewController.m
//  Snaplt
//
//  Created by Robert Wen on 5/3/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

#import "StatisticsViewController.h"

#define colorwithrgb(x,y,z,alp) [UIColor colorWithRed:(x)/255.0 green:(y)/255.0 blue:(z)/255.0 alpha:(alp)]

@interface StatisticsViewController ()

@end

@implementation StatisticsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSLog(@"initializing statistial view controller!!!");
    
    UIImageView *photo1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 28, 320, 560)];
    photo1.image = [UIImage imageNamed:@"screen-stats.jpg"];
    [self.view addSubview:photo1];
}

@end
