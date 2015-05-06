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

- (void)tryClarifai
{
    static NSString * const client_id = @"dXLMALL9BbbbtXOtoMuIjHePimOEhYa_LxNsDOKI";
    static NSString * const client_secret = @"inTXs1RJjhQ-ESqwlko3ve4mfNacGq3SfnTmnb5I";
    
    NSString * clarifai_auth_url = [NSString stringWithFormat:@"https://%@:%@@api.clarifai.com/v1/token/", client_id, client_secret];
    NSString * clarifai_auth_post = @"grant_type=client_credentials";
    
    NSLog(@"AUTH: %@", clarifai_auth_url);
    NSLog(@"POST: %@", clarifai_auth_post);
    
    // AUTH
    // curl -X POST -d "grant_type=client_credentials" https://<client_id>:<client_secret>@api.clarifai.com/v1/token/
    
    /* response 
     {
     'access_token': 'U5j3rECLLZ86pWRjK35g489QJ4zrQI',
     'expires_in': 36000,
     'scope': 'api_access',
     'token_type': 'Bearer'
     }
     */
    
}

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
    
    [self tryClarifai];
}

@end
