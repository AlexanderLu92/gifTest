//
//  QTGiphyApiClient.h
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import "QTBaseApiClient.h"

@interface QTGiphyApiClient : QTBaseApiClient

- (void)trendedGifsWihtSuccess:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

- (void)searchGifsWihtTag:(NSString *)searchTag uccess:(void (^)(id ))success
                  failure:(void (^)(NSError *))failure;
@end
