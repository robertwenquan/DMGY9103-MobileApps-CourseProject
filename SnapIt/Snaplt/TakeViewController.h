//
//  TakeViewController.h
//  Snaplt
//
//  Created by apple on 15/4/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TakeViewController : UIViewController<UIImagePickerControllerDelegate>
{
    UIImagePickerController *_pickerVC;
    UIImageView *_imageView;

}


@end
