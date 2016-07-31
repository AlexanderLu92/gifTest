//
//  QTBaseApiClient.m
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import "QTBaseApiClient.h"

@implementation QTBaseApiClient

- (instancetype)init {
    if (self = [super init]) {
        [self prepareClient];
    }
    
    return self;
}

- (void)prepareClient {
    
}

- (NSString *)apiPath
{
    NSAssert(NO, @"Override me");
    return nil;
}

- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure {
    NSLog(@"Request GET URL: %@\nParameters: %@\n", path, parameters);
    
    NSError* error = nil;
    NSURLRequest * request = [self.requestSerializer requestWithMethod:@"GET"
                                                             URLString:path
                                                            parameters:parameters
                                                                 error:&error];
    if (error != nil) {
        if (failure != nil) {
            failure(error);
        }
    } else {
        NSURLSessionTask* task = [self dataTaskWithRequest:request
                                         completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                                             if (error == nil) {
                                                 NSLog(@"success!");
                                                 success(responseObject);
                                                 
                                             } else {
                                                 NSLog(@"failed!");
                                                 failure(error);
                                             }
                                         }];
        [task resume];
    }
}

- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(id responseObject))success
         failure:(void (^)(NSError *error))failure {
    NSLog(@"Request POST URL: %@\nParameters: %@\n", path, parameters);
    
    NSError* error = nil;
    NSURLRequest * request = [self.requestSerializer requestWithMethod:@"POST"
                                                             URLString:path
                                                            parameters:parameters
                                                                 error:&error];
    
    if (error != nil) {
        if (failure != nil) {
            failure(error);
        }
    } else {
        NSURLSessionTask* task = [self dataTaskWithRequest:request
                                         completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                                             if (error == nil) {
                                                 NSLog(@"success!");
                                             } else {
                                                 NSLog(@"failed!");
                                                 
                                             }
                                         }];
        [task resume];
    }
}

@end
