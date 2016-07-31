//
//  QTTrendingGifsPresenter.m
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import "QTTrendingGifsPresenter.h"
#import "QTTrendingGifsVisualizer.h"
#import "QTGiphyApiClient.h"
#import "QTGif.h"

@interface QTTrendingGifsPresenter ()

@property (nonatomic, strong) QTGiphyApiClient *giphyClient;

@property (nonatomic, strong) NSArray *gifs;


@end

@implementation QTTrendingGifsPresenter

- (instancetype)initWithGiphyApiClient:(QTGiphyApiClient *)giphyClient {
    
    if (self = [super init]) {
        self.giphyClient = giphyClient;
    }
    
    return self;
}

- (NSArray *)gifs {
    if (_gifs == nil) {
        _gifs = [NSArray new];
    }
    
    return _gifs;
}

- (void)loadTrendingGifs{
    
    [self.giphyClient trendedGifsWihtSuccess:^(id responseObject) {
        
        self.gifs = [self proccedGifs:responseObject[@"data"]];
        [self.delegate showGifs];
        NSLog(@"do something");
    } failure:^(NSError *error) {
        NSLog(@" Failed do something");
    }];
    
}

-(void)load:(NSString *)tag {
    [self.giphyClient searchGifsWihtTag:tag uccess:^(id responseObject) {
        
        self.gifs = [self proccedGifs:responseObject[@"data"]];
        [self.delegate showGifs];
        NSLog(@"do something");
    } failure:^(NSError *error) {
        NSLog(@" Failed do something");
    }];
}

-(NSArray *)proccedGifs:(NSArray *)data {
    NSMutableArray *gifsArray = @[].mutableCopy;
    for (NSDictionary *gifData in data) {
        NSDictionary *images = gifData[@"images"][@"downsized_large"];
        QTGif *gif = [self gifFromData:images withImgUrl:gifData[@"images"][@"downsized_still"][@"url"]];
        [gifsArray addObject:gif];
    }
    
    return gifsArray;
}

- (QTGif *)gifFromData:(NSDictionary *)gifData withImgUrl:(NSString *)imgUrl{
    QTGif *gif = [[QTGif alloc] initWithGifUrl:gifData[@"url"]
                                           img:imgUrl
                                        height:[gifData[@"height"] floatValue]
                                         width:[gifData[@"width"]floatValue]];

    return gif;
}


@end
