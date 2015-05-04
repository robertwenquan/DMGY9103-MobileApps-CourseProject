//
//  HomeViewController.h
//  Snaplt
//
//  Created by apple on 4/16/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIScrollViewDelegate>
{
    UIImagePickerController *_pickerVC;
    UIImageView *_imageView;
    UIScrollView *_scrollView;
    int _num;
}

@property (nonatomic,strong)UIScrollView *scrollView;

@end
