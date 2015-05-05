//
//  ClarifaiApi.m
//  Snaplt
//
//  Created by Robert Wen on 5/4/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

#import "ClarifaiApi.h"
#import "AFNetworking.h"

@implementation ClarifaiApi

- (void)tryAFNetworking
{
    NSLog(@"Try AFNetworking library...");
    static NSString * const BaseURLString = @"http://www.raywenderlich.com/demos/weather_sample/";
    
    NSString *string = [NSString stringWithFormat:@"%@weather.php?format=json", BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 3
        NSDictionary * abc = (NSDictionary *)responseObject;
        
        NSLog(@"%@", abc);
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];
}

@end
