//
//  DetailViewController.m
//  Snaplt
//
//  Created by apple on 15/4/18.
//  Copyright (c) 2015 apple. All rights reserved.
//

#import "DetailViewController.h"
#import "TakeViewController.h"

#define colorwithrgb(x,y,z,alp) [UIColor colorWithRed:(x)/255.0 green:(y)/255.0 blue:(z)/255.0 alpha:(alp)]

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = colorwithrgb(0, 0, 0, 1.0);
    self.title =@"Statistics";
    
    // Create a paged scroll view controller here to show four pictures
    

    
    /* CAMERA and LENS INFO */
    
    // camera picture (static)
    
    // camera info
    
    // lens info
    
    // shoot date info
    
    
    /* SHOOTING PARAMETERS */
    
    NSLog(@"Come on, show the meta data of the photo");
    
    // aperture
    UILabel *apertureLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 430, 100, 30)];
    apertureLabel.text = @"APERTURE";
    apertureLabel.textColor = [UIColor whiteColor];
    apertureLabel.font = [UIFont fontWithName:@"Arial" size:12];
    apertureLabel.numberOfLines = 1;
    [self.view addSubview:apertureLabel];
    
    // shutter speed
    UILabel *shutterLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 430, 100, 30)];
    shutterLabel.text = @"Shutter";
    shutterLabel.textColor = [UIColor whiteColor];
    shutterLabel.font = [UIFont fontWithName:@"Arial" size:12];
    shutterLabel.numberOfLines = 1;
    [self.view addSubview:shutterLabel];
    
    // ISO speed
    UILabel *iosLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 430, 100, 30)];
    iosLabel.text = @"ISO";
    iosLabel.textColor = [UIColor whiteColor];
    iosLabel.font = [UIFont fontWithName:@"Arial" size:12];
    iosLabel.numberOfLines = 1;
    [self.view addSubview:iosLabel];
    
    // focal length
    UILabel *focalLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 480, 100, 30)];
    focalLabel.text = @"Focal Length";
    focalLabel.textColor = [UIColor whiteColor];
    focalLabel.font = [UIFont fontWithName:@"Arial" size:12];
    focalLabel.numberOfLines = 1;
    [self.view addSubview:focalLabel];
    
    // exposure compensation
    UILabel *exposureLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 480, 100, 30)];
    exposureLabel.text = @"Exposure +/-";
    exposureLabel.textColor = [UIColor whiteColor];
    exposureLabel.font = [UIFont fontWithName:@"Arial" size:12];
    exposureLabel.numberOfLines = 1;
    [self.view addSubview:exposureLabel];
    
    // white balance
    UILabel *wbLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 480, 100, 30)];
    wbLabel.text = @"White Balance";
    wbLabel.textColor = [UIColor whiteColor];
    wbLabel.font = [UIFont fontWithName:@"Arial" size:12];
    wbLabel.numberOfLines = 1;
    [self.view addSubview:wbLabel];

    // This is the snap a photo button
    UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    photoBtn.frame = CGRectMake(20, self.view.frame.size.height-35, 30, 30);
    [photoBtn setBackgroundImage:[UIImage imageNamed:@"camera-snap"] forState:UIControlStateNormal];
    [photoBtn addTarget:self action:@selector(nextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:photoBtn];
    
    UILabel *photoLab = [[UILabel alloc]initWithFrame:CGRectMake(photoBtn.frame.origin.x+photoBtn.frame.size.width+5, self.view.frame.size.height-35, 300, 30)];
    photoLab.text = @"Take picture by these parameters";
    photoLab.textColor = [UIColor whiteColor];
    [self.view addSubview:photoLab];
    
    
}

- (void)nextVC
{
    NSLog(@"Enter nextVC");
    
    TakeViewController * takeVC = [[TakeViewController alloc]init];
    [self.navigationController pushViewController:takeVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
