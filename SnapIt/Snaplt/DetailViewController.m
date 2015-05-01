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
    
    self.view.backgroundColor = colorwithrgb(0, 0, 87, 1.0);
    self.title =@"Photo Info";
    
    // Create a paged scroll view controller here to show four pictures
    
    // the scroll view pictures
    UIScrollView *photoScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 63, 320, 320)];
    
    UIImageView *photo1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    photo1.image = [UIImage imageNamed:@"01.jpg"];
    [photoScrollView addSubview:photo1];
    
    UIImageView *photo2 = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0, 320, 320)];
    photo2.image = [UIImage imageNamed:@"02.jpg"];
    [photoScrollView addSubview:photo2];
    
    UIImageView *photo3 = [[UIImageView alloc] initWithFrame:CGRectMake(640, 0, 320, 320)];
    photo3.image = [UIImage imageNamed:@"03.jpg"];
    [photoScrollView addSubview:photo3];
    
    UIImageView *photo4 = [[UIImageView alloc] initWithFrame:CGRectMake(960, 0, 320, 320)];
    photo4.image = [UIImage imageNamed:@"04.jpg"];
    [photoScrollView addSubview:photo4];
    
    UIImageView *photo5 = [[UIImageView alloc] initWithFrame:CGRectMake(1280, 0, 320, 320)];
    photo5.image = [UIImage imageNamed:@"05.jpg"];
    [photoScrollView addSubview:photo5];
    
    UIImageView *photo6 = [[UIImageView alloc] initWithFrame:CGRectMake(1600, 0, 320, 320)];
    photo6.image = [UIImage imageNamed:@"06.jpg"];
    [photoScrollView addSubview:photo6];

    
    [self.view addSubview:photoScrollView];
    
    photoScrollView.contentSize = CGSizeMake(320 * 6, 320);
    NSLog(@"width: %f, height: %f", self.view.frame.size.width, self.view.frame.size.height);
    
    photoScrollView.showsHorizontalScrollIndicator = YES;
    photoScrollView.showsVerticalScrollIndicator = NO;
    photoScrollView.pagingEnabled = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
 
    // camera picture (static)
    UIImageView *cameraIcon = [[UIImageView alloc] initWithFrame:CGRectMake(15, 390, 80, 80)];
    NSString *str1 = [NSString stringWithFormat:@"camera-icon.png"];
    cameraIcon.image = [UIImage imageNamed:str1];
    [self.view addSubview:cameraIcon];
    
    // camera info
    UILabel *cameraLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 385, 200, 30)];
    cameraLabel.text = @"CAMERA AND LENS";
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
    
    UILabel *lensTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 411, 200, 30)];
    lensTextLabel.text = @"EF 24-70 F/2.8L II USM";
    lensTextLabel.textColor = [UIColor whiteColor];
    lensTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    lensTextLabel.numberOfLines = 1;
    [self.view addSubview:lensTextLabel];
    
    // shoot date info
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 428, 100, 30)];
    dateLabel.text = @"DATE";
    dateLabel.textColor = [UIColor whiteColor];
    dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    dateLabel.numberOfLines = 1;
    [self.view addSubview:dateLabel];
    
    UILabel *dateTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 441, 200, 30)];
    dateTextLabel.text = @"2015/03/28 16:33:25";
    dateTextLabel.textColor = [UIColor whiteColor];
    dateTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    dateTextLabel.numberOfLines = 1;
    [self.view addSubview:dateTextLabel];
    
    
    // Add a dividing line
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 470, 300, 1)];
    lineView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lineView];
    
    /* SHOOTING PARAMETERS */
    
    NSLog(@"Come on, show the meta data of the photo");
    
    // aperture
    
    UIImageView *apertureIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 475, 30, 30)];
    apertureIcon.image = [UIImage imageNamed:@"aperture-50px.png"];
    [self.view addSubview:apertureIcon];
    
    UILabel *apertureLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 470, 100, 30)];
    apertureLabel.text = @"APERTURE";
    apertureLabel.textColor = [UIColor whiteColor];
    apertureLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    apertureLabel.numberOfLines = 1;
    [self.view addSubview:apertureLabel];
    
    UILabel *apertureTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 483, 100, 30)];
    apertureTextLabel.text = @"F11";
    apertureTextLabel.textColor = [UIColor whiteColor];
    apertureTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    apertureTextLabel.numberOfLines = 1;
    [self.view addSubview:apertureTextLabel];
    
    // shutter speed
    
    UIImageView *shutterIcon = [[UIImageView alloc] initWithFrame:CGRectMake(107, 478, 25, 25)];
    shutterIcon.image = [UIImage imageNamed:@"shutter-speed-50px.png"];
    [self.view addSubview:shutterIcon];
    
    UILabel *shutterLabel = [[UILabel alloc]initWithFrame:CGRectMake(134, 470, 100, 30)];
    shutterLabel.text = @"Shutter";
    shutterLabel.textColor = [UIColor whiteColor];
    shutterLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    shutterLabel.numberOfLines = 1;
    [self.view addSubview:shutterLabel];
    
    UILabel *shutterTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(133, 483, 100, 30)];
    shutterTextLabel.text = @"1/200";
    shutterTextLabel.textColor = [UIColor whiteColor];
    shutterTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    shutterTextLabel.numberOfLines = 1;
    [self.view addSubview:shutterTextLabel];
    
    // ISO speed
    
    UIImageView *isoIcon = [[UIImageView alloc] initWithFrame:CGRectMake(208, 478, 27, 27)];
    isoIcon.image = [UIImage imageNamed:@"iso-speed-50px.png"];
    [self.view addSubview:isoIcon];
    
    UILabel *iosLabel = [[UILabel alloc]initWithFrame:CGRectMake(236, 470, 100, 30)];
    iosLabel.text = @"ISO";
    iosLabel.textColor = [UIColor whiteColor];
    iosLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    iosLabel.numberOfLines = 1;
    [self.view addSubview:iosLabel];
    
    UILabel *iosTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(236, 483, 100, 30)];
    iosTextLabel.text = @"100";
    iosTextLabel.textColor = [UIColor whiteColor];
    iosTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    iosTextLabel.numberOfLines = 1;
    [self.view addSubview:iosTextLabel];
    
    // focal length
    
    UIImageView *focalIcon = [[UIImageView alloc] initWithFrame:CGRectMake(4, 507, 23, 23)];
    focalIcon.image = [UIImage imageNamed:@"focal-lens.png"];
    [self.view addSubview:focalIcon];
    
    UILabel *focalLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 500, 100, 30)];
    focalLabel.text = @"Focal Length";
    focalLabel.textColor = [UIColor whiteColor];
    focalLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    focalLabel.numberOfLines = 1;
    [self.view addSubview:focalLabel];
    
    UILabel *focalTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 513, 100, 30)];
    focalTextLabel.text = @"70mm";
    focalTextLabel.textColor = [UIColor whiteColor];
    focalTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    focalTextLabel.numberOfLines = 1;
    [self.view addSubview:focalTextLabel];
    
    // exposure compensation
    
    UIImageView *exposureIcon = [[UIImageView alloc] initWithFrame:CGRectMake(110, 510, 20, 20)];
    exposureIcon.image = [UIImage imageNamed:@"exposure-bias-50px.png"];
    [self.view addSubview:exposureIcon];
    
    UILabel *exposureLabel = [[UILabel alloc]initWithFrame:CGRectMake(133, 500, 100, 30)];
    exposureLabel.text = @"Exposure +/-";
    exposureLabel.textColor = [UIColor whiteColor];
    exposureLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    exposureLabel.numberOfLines = 1;
    [self.view addSubview:exposureLabel];
    
    UILabel *exposureTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(133, 513, 100, 30)];
    exposureTextLabel.text = @"-1/3 EV";
    exposureTextLabel.textColor = [UIColor whiteColor];
    exposureTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    exposureTextLabel.numberOfLines = 1;
    [self.view addSubview:exposureTextLabel];
    
    // white balance
    
    UIImageView *wbIcon = [[UIImageView alloc] initWithFrame:CGRectMake(209, 508, 25, 25)];
    wbIcon.image = [UIImage imageNamed:@"white-balance.png"];
    [self.view addSubview:wbIcon];
    
    UILabel *wbLabel = [[UILabel alloc]initWithFrame:CGRectMake(236, 500, 100, 30)];
    wbLabel.text = @"White Balance";
    wbLabel.textColor = [UIColor whiteColor];
    wbLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    wbLabel.numberOfLines = 1;
    [self.view addSubview:wbLabel];
    
    UILabel *wbTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(236, 513, 100, 30)];
    wbTextLabel.text = @"Auto";
    wbTextLabel.textColor = [UIColor whiteColor];
    wbTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
    wbTextLabel.numberOfLines = 1;
    [self.view addSubview:wbTextLabel];

    // This is the snap a photo button

    UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    photoBtn.frame = CGRectMake(20, self.view.frame.size.height-35, 30, 30);
    [photoBtn setBackgroundImage:[UIImage imageNamed:@"camera-snap"] forState:UIControlStateNormal];
    [photoBtn addTarget:self action:@selector(nextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:photoBtn];
    
    UILabel *photoLab = [[UILabel alloc]initWithFrame:CGRectMake(photoBtn.frame.origin.x+photoBtn.frame.size.width+5, self.view.frame.size.height-35, 300, 30)];
    photoLab.text = @"Re-take with above shooting parameters";
    photoLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
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
