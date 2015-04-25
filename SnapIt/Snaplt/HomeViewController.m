//
//  HomeViewController.m
//  Snaplt
//
//  Created by apple on 15/4/16.
//  Copyright (c) 2015 apple. All rights reserved.
//

#import "HomeViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "DetailViewController.h"


@interface HomeViewController ()

@end



@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"PHOTO";
    
    // Do any additional setup after loading the view.
    
    

    //navigationbar right button
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"NEXT"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(rightItemClicked:)];
    rightItem.tag = 0x00110;
    [self.navigationItem setRightBarButtonItem:rightItem animated:YES];
    
    //ImageView displaying photos
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x-140, 50, 280, 280)];
    _imageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_imageView];
    
    [self takePhoto];
    
}

- (void)likeBtnClicked{
    if (_num == 1) {
        UIImage *tempImg = [UIImage imageNamed:@"01.jpg"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapToPush:(UITapGestureRecognizer*)gesture
{
    CGFloat gestX=[gesture locationInView:gesture.view].x;
    NSInteger width=self.scrollView.frame.size.width/3;
    if (gestX<width)
    {
        _imageView.image = [UIImage imageNamed:@"01.jpg"];
        _num = 1;
    }
    else if (gestX>width && gestX<width*2)
    {
        _imageView.image = [UIImage imageNamed:@"02.jpg"];
        _num = 2;
    }
    else if(gestX>width*2 && gestX<width*3)
    {
        _imageView.image = [UIImage imageNamed:@"03.jpg"];
        _num = 3;
    }
    else if(gestX>width*3 && gestX<width*4)
    {
        _imageView.image = [UIImage imageNamed:@"04.jpg"];
        _num = 4;
    }
    else if(gestX>width*4 && gestX<width*5)
    {
        _imageView.image = [UIImage imageNamed:@"05.jpg"];
        _num = 5;
    }
    else if(gestX>width*5 && gestX<width*6)
    {
        _imageView.image = [UIImage imageNamed:@"06.jpg"];
        _num = 6;
    }
    else if(gestX>width*6 && gestX<width*7)
    {
        _imageView.image = [UIImage imageNamed:@"07.jpg"];
        _num = 7;
    }
    else
    {
        _imageView.image = [UIImage imageNamed:@"08.jpg"];
        _num = 8;
    }
}

- (void)takePhoto
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"Device dose not support camera!");
        return;
    }
    
    _pickerVC = [[UIImagePickerController alloc]init];
    _pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    _pickerVC.mediaTypes = [NSArray arrayWithObject:(NSString*)kUTTypeImage];
    _pickerVC.delegate = self;
    _pickerVC.allowsEditing = NO;
    
    [self presentViewController:_pickerVC animated:YES completion:^{}];
    
}

- (void)rightItemClicked:(UIBarButtonItem*)item
{
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
    //Like Button
    UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    likeBtn.frame = CGRectMake(self.view.center.x-30, _imageView.frame.origin.y+_imageView.frame.size.height+5, 60, 20);
    [likeBtn setTitle:@"LIKE!" forState:UIControlStateNormal];
    [likeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [likeBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [likeBtn addTarget:self action:@selector(likeBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:likeBtn];
    
    
    //UIScrollView
    self.scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, _imageView.frame.origin.y+_imageView.frame.size.height+35, self.view.bounds.size.width, 110)];
    self.scrollView.tag=0x001000;
    self.scrollView.backgroundColor=[UIColor whiteColor];
    self.scrollView.scrollEnabled=YES;
    self.scrollView.bounces=YES;
    self.scrollView.pagingEnabled=YES;
    self.scrollView.showsHorizontalScrollIndicator=YES;
    self.scrollView.showsVerticalScrollIndicator=YES;
    self.scrollView.directionalLockEnabled=YES;
    self.scrollView.delegate=self;
    self.scrollView.contentSize=CGSizeMake(self.view.bounds.size.width*4, self.scrollView.frame.size.height);
    
    CGFloat width = self.scrollView.frame.size.width/3;
    CGFloat height = self.scrollView.frame.size.height;
    for (int i = 0; i < 8; i++)
    {
        UIImageView *aView = [[UIImageView alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
        NSString *str = [NSString stringWithFormat:@"0%d.jpg", (i+1)];
        aView.image = [UIImage imageNamed:str];
        [self.scrollView addSubview:aView];
        
        UITapGestureRecognizer *tapToPush=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapToPush:)];
        [self.scrollView addGestureRecognizer:tapToPush];
    }
    
    [self.view addSubview:self.scrollView];
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        NSString* mediaType = [info objectForKey:UIImagePickerControllerMediaType];
        
        
        if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
        {
            UIImage *originImage = [info objectForKey:UIImagePickerControllerOriginalImage];
            _imageView.image = originImage;
            
            if (picker.cameraDevice == UIImagePickerControllerCameraDeviceFront)
            {
                _imageView.transform = CGAffineTransformIdentity;
                _imageView.transform = CGAffineTransformScale(picker.cameraViewTransform, -1, 1);
            }
            
        
            UIImageWriteToSavedPhotosAlbum(originImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        }

    }
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
}

- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
    if (!error)
    {
        NSLog(@"Photo is saved");
    }
    else
    {
        NSLog(@"Error:%@", [error localizedDescription]);
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
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
