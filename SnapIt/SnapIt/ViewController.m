//
//  ViewController.m
//  SnapIt
//
//  Created by Robert Wen on 4/13/15.
//  Copyright (c) 2015 New York University. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property EXFJpeg *imageData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"view Did Load");
    
    UIImage *anImage = [UIImage imageNamed:@"IMG_6670.jpg"];
    
//    NSData * uiJpeg =  UIImageJPEGRepresentation (anImage, 1.0 );
//    EXFJpeg* jpegScanner = [[EXFJpeg alloc] init];
//    [jpegScanner scanImageData: anImage];
//    //self.imageData = jpegScanner;
//    //[jpegScanner release];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
