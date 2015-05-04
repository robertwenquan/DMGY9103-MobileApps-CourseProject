//
//  TakeViewController.h
//  Snaplt
//
//  Created by apple on 4/18/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TakeViewController : UIViewController <UIImagePickerControllerDelegate>
{
    UIImagePickerController *_pickerVC;
    UIImageView *_imageView;

}


@end
