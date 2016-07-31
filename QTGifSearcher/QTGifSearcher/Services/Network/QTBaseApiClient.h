//
//  QTBaseApiClient.h
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface QTBaseApiClient : AFHTTPSessionManager

- (void)prepareClient;

- (NSString *)apiPath;

- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure;

- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(id responseObject))success
         failure:(void (^)(NSError *error))failure;

@end
