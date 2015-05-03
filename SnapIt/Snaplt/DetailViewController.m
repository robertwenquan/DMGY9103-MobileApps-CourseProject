//
//  DetailViewController.m
//  Snaplt
//
//  Created by apple on 15/4/18.
//  Copyright (c) 2015 apple. All rights reserved.
//

#import "DetailViewController.h"
#import "TakeViewController.h"
#import <ImageIO/ImageIO.h>

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
    
    photoScrollView.delegate =self;
    
    [photoScrollView addSubview:photo6];
    
    [self.view addSubview:photoScrollView];
    
    photoScrollView.contentSize = CGSizeMake(320 * 6, 320);
    NSLog(@"width: %f, height: %f", self.view.frame.size.width, self.view.frame.size.height);
    
    photoScrollView.tag = 0x001000;
    photoScrollView.showsHorizontalScrollIndicator = NO;
    photoScrollView.showsVerticalScrollIndicator = NO;
    photoScrollView.pagingEnabled = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
 
    /* page controll */
    UIPageControl *photoPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 382, 120, 20)];
    photoPageControl.currentPage = 1;
    photoPageControl.numberOfPages = 6;
    photoPageControl.hidesForSinglePage = YES;
    photoPageControl.tag = 0x001100;
    
    [self.view addSubview:photoPageControl];
    
    // camera picture (static)
    UIImageView *cameraIcon = [[UIImageView alloc] initWithFrame:CGRectMake(15, 388, 90, 90)];
    NSString *str1 = [NSString stringWithFormat:@"camera-icon.png"];
    cameraIcon.image = [UIImage imageNamed:str1];
    [self.view addSubview:cameraIcon];
    
    // camera info
    UILabel *cameraLabel = [[UILabel alloc]initWithFrame:CGRectMake(134, 395, 200, 30)];
    cameraLabel.text = @"CAMERA AND LENS";
    cameraLabel.textColor = [UIColor whiteColor];
    cameraLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    cameraLabel.numberOfLines = 1;
    [self.view addSubview:cameraLabel];
    
    UILabel *cameraTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(134, 408, 200, 30)];
    cameraTextLabel.text = @"CANON EOS 6D";
    cameraTextLabel.textColor = [UIColor whiteColor];
    cameraTextLabel.font = [UIFont fontWithName:@"Arial" size:10];
    cameraTextLabel.numberOfLines = 1;
    cameraTextLabel.tag = 0x10010001;
    [self.view addSubview:cameraTextLabel];
    
    // lens info
    
    UILabel *lensTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(134, 421, 200, 30)];
    lensTextLabel.text = @"EF 24-70 F/2.8L II USM";
    lensTextLabel.textColor = [UIColor whiteColor];
    lensTextLabel.font = [UIFont fontWithName:@"Arial" size:10];
    lensTextLabel.numberOfLines = 1;
    lensTextLabel.tag = 0x10010002;
    [self.view addSubview:lensTextLabel];
    
    // shoot date info
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(134, 436, 100, 30)];
    dateLabel.text = @"DATE";
    dateLabel.textColor = [UIColor whiteColor];
    dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    dateLabel.numberOfLines = 1;
    [self.view addSubview:dateLabel];
    
    UILabel *dateTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(134, 449, 200, 30)];
    dateTextLabel.text = @"2015/03/28 16:33:25";
    dateTextLabel.textColor = [UIColor whiteColor];
    dateTextLabel.font = [UIFont fontWithName:@"Arial" size:10];
    dateTextLabel.numberOfLines = 1;
    dateTextLabel.tag = 0x10010003;
    [self.view addSubview:dateTextLabel];
    
    
    // Add a dividing line
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 474, 300, 1)];
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
    apertureLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    apertureLabel.numberOfLines = 1;
    [self.view addSubview:apertureLabel];
    
    UILabel *apertureTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 483, 100, 30)];
    apertureTextLabel.text = @"F11";
    apertureTextLabel.textColor = [UIColor whiteColor];
    apertureTextLabel.font = [UIFont fontWithName:@"Arial" size:10];
    apertureTextLabel.numberOfLines = 1;
    apertureTextLabel.tag = 0x10010004;
    [self.view addSubview:apertureTextLabel];
    
    // shutter speed
    
    UIImageView *shutterIcon = [[UIImageView alloc] initWithFrame:CGRectMake(107, 478, 25, 25)];
    shutterIcon.image = [UIImage imageNamed:@"shutter-speed-50px.png"];
    [self.view addSubview:shutterIcon];
    
    UILabel *shutterLabel = [[UILabel alloc]initWithFrame:CGRectMake(134, 470, 100, 30)];
    shutterLabel.text = @"SHUTTER";
    shutterLabel.textColor = [UIColor whiteColor];
    shutterLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    shutterLabel.numberOfLines = 1;
    [self.view addSubview:shutterLabel];
    
    UILabel *shutterTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(133, 483, 100, 30)];
    shutterTextLabel.text = @"1/200";
    shutterTextLabel.textColor = [UIColor whiteColor];
    shutterTextLabel.font = [UIFont fontWithName:@"Arial" size:10];
    shutterTextLabel.numberOfLines = 1;
    shutterTextLabel.tag = 0x10010005;
    [self.view addSubview:shutterTextLabel];
    
    // ISO speed
    
    UIImageView *isoIcon = [[UIImageView alloc] initWithFrame:CGRectMake(208, 478, 27, 27)];
    isoIcon.image = [UIImage imageNamed:@"iso-speed-50px.png"];
    [self.view addSubview:isoIcon];
    
    UILabel *iosLabel = [[UILabel alloc]initWithFrame:CGRectMake(236, 470, 100, 30)];
    iosLabel.text = @"ISO";
    iosLabel.textColor = [UIColor whiteColor];
    iosLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    iosLabel.numberOfLines = 1;
    [self.view addSubview:iosLabel];
    
    UILabel *iosTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(236, 483, 100, 30)];
    iosTextLabel.text = @"100";
    iosTextLabel.textColor = [UIColor whiteColor];
    iosTextLabel.font = [UIFont fontWithName:@"Arial" size:10];
    iosTextLabel.numberOfLines = 1;
    iosTextLabel.tag = 0x10010006;
    [self.view addSubview:iosTextLabel];
    
    // focal length
    
    UIImageView *focalIcon = [[UIImageView alloc] initWithFrame:CGRectMake(4, 504, 23, 23)];
    focalIcon.image = [UIImage imageNamed:@"focal-lens.png"];
    [self.view addSubview:focalIcon];
    
    UILabel *focalLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 497, 100, 30)];
    focalLabel.text = @"FOCAL LENGTH";
    focalLabel.textColor = [UIColor whiteColor];
    focalLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    focalLabel.numberOfLines = 1;
    [self.view addSubview:focalLabel];
    
    UILabel *focalTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 510, 100, 30)];
    focalTextLabel.text = @"70mm";
    focalTextLabel.textColor = [UIColor whiteColor];
    focalTextLabel.font = [UIFont fontWithName:@"Arial" size:10];
    focalTextLabel.numberOfLines = 1;
    focalTextLabel.tag = 0x10010007;
    [self.view addSubview:focalTextLabel];
    
    // exposure compensation
    
    UIImageView *exposureIcon = [[UIImageView alloc] initWithFrame:CGRectMake(110, 507, 20, 20)];
    exposureIcon.image = [UIImage imageNamed:@"exposure-bias-50px.png"];
    [self.view addSubview:exposureIcon];
    
    UILabel *exposureLabel = [[UILabel alloc]initWithFrame:CGRectMake(133, 497, 100, 30)];
    exposureLabel.text = @"EXPOSURE +/-";
    exposureLabel.textColor = [UIColor whiteColor];
    exposureLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    exposureLabel.numberOfLines = 1;
    [self.view addSubview:exposureLabel];
    
    UILabel *exposureTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(133, 510, 100, 30)];
    exposureTextLabel.text = @"-1/3 EV";
    exposureTextLabel.textColor = [UIColor whiteColor];
    exposureTextLabel.font = [UIFont fontWithName:@"Arial" size:10];
    exposureTextLabel.numberOfLines = 1;
    exposureTextLabel.tag = 0x10010008;
    [self.view addSubview:exposureTextLabel];
    
    // white balance
    
    UIImageView *wbIcon = [[UIImageView alloc] initWithFrame:CGRectMake(209, 505, 25, 25)];
    wbIcon.image = [UIImage imageNamed:@"white-balance.png"];
    [self.view addSubview:wbIcon];
    
    UILabel *wbLabel = [[UILabel alloc]initWithFrame:CGRectMake(236, 497, 100, 30)];
    wbLabel.text = @"WHITE BALANCE";
    wbLabel.textColor = [UIColor whiteColor];
    wbLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
    wbLabel.numberOfLines = 1;
    [self.view addSubview:wbLabel];
    
    UILabel *wbTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(236, 510, 100, 30)];
    wbTextLabel.text = @"Auto";
    wbTextLabel.textColor = [UIColor whiteColor];
    wbTextLabel.font = [UIFont fontWithName:@"Arial" size:10];
    wbTextLabel.numberOfLines = 1;
    wbTextLabel.tag = 0x10010009;
    [self.view addSubview:wbTextLabel];

    // This is the snap a photo button

    UILabel *photoLab = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-35, 320, 35)];
    photoLab.text = @"           Re-take with above shooting parameters";
    photoLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    photoLab.textColor = [UIColor whiteColor];
    photoLab.textAlignment = NSTextAlignmentCenter;
    photoLab.backgroundColor = [UIColor blackColor];
    [self.view addSubview:photoLab];
    
    UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    photoBtn.frame = CGRectMake(15, self.view.frame.size.height-35, 35, 35);
    [photoBtn setBackgroundImage:[UIImage imageNamed:@"camera-snap"] forState:UIControlStateNormal];
    [photoBtn addTarget:self action:@selector(nextVC) forControlEvents:UIControlEventTouchUpInside];
    photoBtn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:photoBtn];
    
    // Update the photo info for the first picture
    [self updatePhotoInfo:0];
}

/*
 convertExposureBias
 
 INPUT: exposureBias in float number
 OUTPUT: exposureBias in string format
 
 INPUT numbers are in 0.3 step, like -1.33333333, -1, -0.6666666667, 0, 
       0.3333333333, 2.333333333333, 1.66666666667, 2, etc
       range is normally between -5 and 5.
 OUTPUT format is desired to be like -1 1/3 EV, -1 EV, +1/3 EV, + 2 2/3 EV, etc.
       when this is no bias, 0 is the output, with the trailing EV.
 
 */
- (NSString *)convertExposureBias:(float)exposureBias
{
    int sign = 0;
    float exp = exposureBias;
    NSString *exposureString = [[NSString alloc] init];
    
    if (exposureBias < 0) {
        sign = -1;
    }
    else {
        sign = 1;
    }
    
    exp *= sign;
    
    int intpart = (int)floor(exp);
    float fltpart = exp - intpart;
    
    if (intpart == 0 && fltpart == 0) {
        exposureString = @"0";
    }
    else if (sign == 1) {
        exposureString = @"+";
    } else {
        exposureString = @"-";
    }
    
    if (intpart != 0) {
        exposureString = [NSString stringWithFormat:@"%@%d ", exposureString, intpart];
    }
    
    if (fltpart > 0.6) {
        exposureString = [NSString stringWithFormat:@"%@%@", exposureString, @"2/3 EV"];
    } else if (fltpart > 0.3) {
        exposureString = [NSString stringWithFormat:@"%@%@", exposureString, @"1/3 EV"];
    } else {
        exposureString = [NSString stringWithFormat:@"%@%@", exposureString, @" EV"];
    }
    
    return exposureString;
}

/*
 
 def floatToString(n):
 if n < 0:
 sign = -1
 else:
 sign = 1
 
 n *= sign
 
 intpart = int(floor(n))
 fltpart = n - intpart
 
 if intpart == 0 and fltpart == 0:
 return '0'
 else:
 if sign == 1:
 ret = '+'
 else:
 ret = '-'
 
 if intpart != 0:
 ret += str(intpart) + ' '
 
 if fltpart > 0.6:
 ret += '2/3'
 elif fltpart > 0.3:
 ret += '1/3'
 
 return ret
 
 */

- (void)updatePhotoInfo:(int)num
{
    num = num + 1;
    NSLog(@"Print EXIF %d", num);
 
    /* The following is a section of sample code of reading
     EXIF data from a JPEG image file
     */
    
    NSString *strFromInt = [NSString stringWithFormat:@"%02d", num];
    
    NSURL *imageFileURL = [[NSBundle mainBundle]
                           URLForResource: strFromInt withExtension:@"jpg"];
    
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)imageFileURL, NULL);
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:NO], (NSString *)kCGImageSourceShouldCache,
                             nil];
    
    CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, (CFDictionaryRef)options);
    if (imageProperties) {
        NSNumber *width = (NSNumber *)CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
        NSNumber *height = (NSNumber *)CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
        NSLog(@"Image dimensions: %@ x %@ px", width, height);
    }
    
    CFDictionaryRef exif = CFDictionaryGetValue(imageProperties, kCGImagePropertyExifDictionary);
    if (exif) {
        
        NSLog(@"--------------------------------");
        NSLog(@"Printing more EXIF meta info for this picture");
        
        NSString *CameraModel = (NSString *)CFDictionaryGetValue(exif, kCGImagePropertyExifImageUniqueID);
        NSLog(@"Camera Model: %@", CameraModel);
        UILabel *cameraTextLabel = (UILabel*)[self.view viewWithTag:0x10010001];
        cameraTextLabel.text = CameraModel;
        
        NSString *LensModel = (NSString *)CFDictionaryGetValue(exif, kCGImagePropertyExifLensModel);
        NSLog(@"Lens Model: %@", LensModel);
        UILabel *lensTextLabel = (UILabel*)[self.view viewWithTag:0x10010002];
        lensTextLabel.text = LensModel;
        
        NSString *dateTakenString = (NSString *)CFDictionaryGetValue(exif, kCGImagePropertyExifDateTimeOriginal);
        NSLog(@"Date Taken: %@", dateTakenString);
        UILabel *dateTextLabel = (UILabel*)[self.view viewWithTag:0x10010003];
        dateTextLabel.text = dateTakenString;
        
        NSNumber *Aperture = (NSNumber *)CFDictionaryGetValue(exif, kCGImagePropertyExifFNumber);
        NSLog(@"Aperture: F%@", Aperture);
        UILabel *apertureTextLabel = (UILabel*)[self.view viewWithTag:0x10010004];
        apertureTextLabel.text = [NSString stringWithFormat:@"F%@", Aperture];
        
        NSNumber *Exposure = (NSNumber *)CFDictionaryGetValue(exif, kCGImagePropertyExifExposureTime);
        NSLog(@"Exposure Time: 1/%.0fs", round(1.0 / [Exposure floatValue]));
        UILabel *exposureTextLabel = (UILabel*)[self.view viewWithTag:0x10010005];
        exposureTextLabel.text = [NSString stringWithFormat:@"1/%.0fs", round(1.0 / [Exposure floatValue])];
        
        NSNumber *IsoSpeed = (NSNumber *)CFDictionaryGetValue(exif, kCGImagePropertyExifISOSpeedRatings);
        NSLog(@"ISO Speed: %@", IsoSpeed);
        UILabel *isoTextLabel = (UILabel*)[self.view viewWithTag:0x10010006];
        
        NSString *abc = [NSString stringWithFormat:@"%@", IsoSpeed];
        NSArray *lines = [abc componentsSeparatedByString:@"\n"];
        NSString *secondline = [lines objectAtIndex:1];
        NSString *trimmedString = [secondline stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        isoTextLabel.text = trimmedString;
        
        NSString *FocalLength = (NSString *)CFDictionaryGetValue(exif, kCGImagePropertyExifFocalLength);
        NSLog(@"Focal Length: %@mm", FocalLength);
        UILabel *focalTextLabel = (UILabel*)[self.view viewWithTag:0x10010007];
        focalTextLabel.text = [NSString stringWithFormat:@"%@mm", FocalLength];
        
        NSNumber *ExposureBias = (NSNumber *)CFDictionaryGetValue(exif, kCGImagePropertyExifExposureBiasValue);
        NSString *ExposureBiasString = [self convertExposureBias:[ExposureBias floatValue]];
        NSLog(@"Exposure Bias: %@", ExposureBiasString);
        UILabel *exposurebiasTextLabel = (UILabel*)[self.view viewWithTag:0x10010008];
        exposurebiasTextLabel.text = ExposureBiasString;
        
        //NSString *WhiteBalance = (NSString *)CFDictionaryGetValue(exif, kCGImagePropertyExifWhiteBalance);
        //NSLog(@"White Balance: %@", WhiteBalance);
        //UILabel *wbTextLabel = (UILabel*)[self.view viewWithTag:0x10010009];
        //wbTextLabel.text = WhiteBalance;

        NSLog(@"--------------------------------");
    }
    
    CFRelease(imageProperties);
    CFRelease(imageSource);
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

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 0x001000)
    {
        CGFloat pageWidth = scrollView.frame.size.width;
        int index = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
        NSLog(@"The current index is：%d", index);
        
        // change UIPageControl
        UIPageControl *pageControl = (UIPageControl*)[self.view viewWithTag:0x001100];
        if (pageControl)
        {
            pageControl.currentPage = index;
            [pageControl updateCurrentPageDisplay];
        }
        
        // update photo exif info
        [self updatePhotoInfo:index];
    }
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
