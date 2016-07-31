//
//  QTTrendingGifsPresenter.h
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QTGiphyApiClient;
@protocol QTTrendingGifsVisualizer;

@interface QTTrendingGifsPresenter : NSObject

@property (nonatomic, weak) id <QTTrendingGifsVisualizer> delegate;
@property (nonatomic, strong, readonly) NSArray *gifs;


- (instancetype)initWithGiphyApiClient:(QTGiphyApiClient *)giphyClient;

- (void)loadTrendingGifs;
- (void)load:(NSString *)tag;

@end
