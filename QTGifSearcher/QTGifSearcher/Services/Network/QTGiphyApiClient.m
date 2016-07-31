//
//  QTGiphyApiClient.m
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import "QTGiphyApiClient.h"

static const NSString *kGiphyApiKey = @"dc6zaTOxFJmzC";

static const NSString *kParamApiKey = @"api_key";
static const NSString *kParamQueryPrase = @"q";



@implementation QTGiphyApiClient

- (void)prepareClient {
    [super prepareClient];
    
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    [self.requestSerializer setTimeoutInterval:4];
    //    self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
}


- (NSURL *)apiPath {
    return [NSURL URLWithString:@"http://api.giphy.com/"];
}

- (NSString *)apiPath:(NSString *)relativePath {
    return [NSString stringWithFormat:@"%@%@", [self apiPath], relativePath];
}

- (NSDictionary *)parameters {
    NSDictionary *params = @{kParamApiKey : kGiphyApiKey};
    
    return params;
}

- (NSDictionary *)parametersForSearch:(NSString *)phrase {
    NSDictionary *params = @{kParamApiKey : kGiphyApiKey,
                             kParamQueryPrase : phrase};
    
    return params;
}


- (void)trendedGifsWihtSuccess:(void (^)(id ))success
                       failure:(void (^)(NSError *))failure {
    
    [self getPath:[self apiPath:@"/v1/gifs/trending"]
       parameters:[self parameters]
          success:success
          failure:failure];
}

- (void)searchGifsWihtTag:(NSString *)searchTag uccess:(void (^)(id ))success
                       failure:(void (^)(NSError *))failure {
    
    [self getPath:[self apiPath:@"/v1/gifs/search"]
       parameters:[self parametersForSearch:searchTag]
          success:success
          failure:failure];
}



@end
