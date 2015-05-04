//
//  TakeViewController.m
//  Snaplt
//
//  Created by apple on 4/18/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

#import "TakeViewController.h"

#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface TakeViewController ()

@end

@implementation TakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"PHOTO";

    //ImageView displaying photos
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _imageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_imageView];
    
    [self takePhoto];
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

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
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
