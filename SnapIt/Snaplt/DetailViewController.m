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
    self.title =@"Photo Info";
    
    // Create a paged scroll view controller here to show four pictures

    // the scroll view pictures
    UIImageView *cameraPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(0, 63, 320, 320)];
    NSString *str = [NSString stringWithFormat:@"01.jpg"];
    cameraPhoto.image = [UIImage imageNamed:str];
    [self.view addSubview:cameraPhoto];
    
    // camera picture (static)
    UIImageView *cameraIcon = [[UIImageView alloc] initWithFrame:CGRectMake(30, 400, 70, 70)];
    NSString *str1 = [NSString stringWithFormat:@"camera-icon.png"];
    cameraIcon.image = [UIImage imageNamed:str1];
    [self.view addSubview:cameraIcon];
    
    // camera info
    UILabel *cameraLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 385, 100, 30)];
    cameraLabel.text = @"CAMERA";
    cameraLabel.textColor = [UIColor whiteColor];
    cameraLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    cameraLabel.numberOfLines = 1;
    [self.view addSubview:cameraLabel];
    
    UILabel *cameraTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 398, 200, 30)];
    cameraTextLabel.text = @"CANON EOS 6D";
    cameraTextLabel.textColor = [UIColor whiteColor];
    cameraTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    cameraTextLabel.numberOfLines = 1;
    [self.view addSubview:cameraTextLabel];
    
    // lens info
    UILabel *lensLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 415, 100, 30)];
    lensLabel.text = @"LENS";
    lensLabel.textColor = [UIColor whiteColor];
    lensLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    lensLabel.numberOfLines = 1;
    [self.view addSubview:lensLabel];
    
    UILabel *lensTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 428, 200, 30)];
    lensTextLabel.text = @"EF 24-70 F/2.8L II USM";
    lensTextLabel.textColor = [UIColor whiteColor];
    lensTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    lensTextLabel.numberOfLines = 1;
    [self.view addSubview:lensTextLabel];
    
    // shoot date info
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 445, 100, 30)];
    dateLabel.text = @"DATE";
    dateLabel.textColor = [UIColor whiteColor];
    dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    dateLabel.numberOfLines = 1;
    [self.view addSubview:dateLabel];
    
    UILabel *dateTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 458, 200, 30)];
    dateTextLabel.text = @"2014/12/20 16:33:25";
    dateTextLabel.textColor = [UIColor whiteColor];
    dateTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    dateTextLabel.numberOfLines = 1;
    [self.view addSubview:dateTextLabel];
    
    /* SHOOTING PARAMETERS */
    
    NSLog(@"Come on, show the meta data of the photo");
    
    // aperture
    UILabel *apertureLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 480, 100, 30)];
    apertureLabel.text = @"APERTURE";
    apertureLabel.textColor = [UIColor whiteColor];
    apertureLabel.font = [UIFont fontWithName:@"Arial" size:12];
    apertureLabel.numberOfLines = 1;
    [self.view addSubview:apertureLabel];
    
    UILabel *apertureTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 500, 100, 30)];
    apertureTextLabel.text = @"F11";
    apertureTextLabel.textColor = [UIColor whiteColor];
    apertureTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    apertureTextLabel.numberOfLines = 1;
    [self.view addSubview:apertureTextLabel];
    
    // shutter speed
    UILabel *shutterLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 480, 100, 30)];
    shutterLabel.text = @"Shutter";
    shutterLabel.textColor = [UIColor whiteColor];
    shutterLabel.font = [UIFont fontWithName:@"Arial" size:12];
    shutterLabel.numberOfLines = 1;
    [self.view addSubview:shutterLabel];
    
    UILabel *shutterTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 500, 100, 30)];
    shutterTextLabel.text = @"1/200";
    shutterTextLabel.textColor = [UIColor whiteColor];
    shutterTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    shutterTextLabel.numberOfLines = 1;
    [self.view addSubview:shutterTextLabel];
    
    // ISO speed
    UILabel *iosLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 480, 100, 30)];
    iosLabel.text = @"ISO";
    iosLabel.textColor = [UIColor whiteColor];
    iosLabel.font = [UIFont fontWithName:@"Arial" size:12];
    iosLabel.numberOfLines = 1;
    [self.view addSubview:iosLabel];
    
    UILabel *iosTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 500, 100, 30)];
    iosTextLabel.text = @"100";
    iosTextLabel.textColor = [UIColor whiteColor];
    iosTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    iosTextLabel.numberOfLines = 1;
    [self.view addSubview:iosTextLabel];
    
    // focal length
    UILabel *focalLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 520, 100, 30)];
    focalLabel.text = @"Focal Length";
    focalLabel.textColor = [UIColor whiteColor];
    focalLabel.font = [UIFont fontWithName:@"Arial" size:12];
    focalLabel.numberOfLines = 1;
    [self.view addSubview:focalLabel];
    
    UILabel *focalTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 540, 100, 30)];
    focalTextLabel.text = @"70mm";
    focalTextLabel.textColor = [UIColor whiteColor];
    focalTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    focalTextLabel.numberOfLines = 1;
    [self.view addSubview:focalTextLabel];
    
    // exposure compensation
    UILabel *exposureLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 520, 100, 30)];
    exposureLabel.text = @"Exposure +/-";
    exposureLabel.textColor = [UIColor whiteColor];
    exposureLabel.font = [UIFont fontWithName:@"Arial" size:12];
    exposureLabel.numberOfLines = 1;
    [self.view addSubview:exposureLabel];
    
    UILabel *exposureTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 540, 100, 30)];
    exposureTextLabel.text = @"-1/3 EV";
    exposureTextLabel.textColor = [UIColor whiteColor];
    exposureTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    exposureTextLabel.numberOfLines = 1;
    [self.view addSubview:exposureTextLabel];
    
    // white balance
    UILabel *wbLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 520, 100, 30)];
    wbLabel.text = @"White Balance";
    wbLabel.textColor = [UIColor whiteColor];
    wbLabel.font = [UIFont fontWithName:@"Arial" size:12];
    wbLabel.numberOfLines = 1;
    [self.view addSubview:wbLabel];
    
    UILabel *wbTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 540, 100, 30)];
    wbTextLabel.text = @"Auto";
    wbTextLabel.textColor = [UIColor whiteColor];
    wbTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    wbTextLabel.numberOfLines = 1;
    [self.view addSubview:wbTextLabel];

    
    
    
    
    
    
    
    
    // This is the snap a photo button
    
    /*
    UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    photoBtn.frame = CGRectMake(20, self.view.frame.size.height-35, 30, 30);
    [photoBtn setBackgroundImage:[UIImage imageNamed:@"camera-snap"] forState:UIControlStateNormal];
    [photoBtn addTarget:self action:@selector(nextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:photoBtn];
    
    UILabel *photoLab = [[UILabel alloc]initWithFrame:CGRectMake(photoBtn.frame.origin.x+photoBtn.frame.size.width+5, self.view.frame.size.height-35, 300, 30)];
    photoLab.text = @"Take picture by these parameters";
    photoLab.textColor = [UIColor whiteColor];
    [self.view addSubview:photoLab];
     */
    
    
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
