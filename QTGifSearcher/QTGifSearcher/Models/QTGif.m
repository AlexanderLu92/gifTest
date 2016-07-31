//
//  QTGif.m
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 30.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import "QTGif.h"

@interface QTGif()

@property (nonatomic, copy)  NSString *gifUrlString;
@property (nonatomic, copy)  NSString *imgUrlString;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;

@end

@implementation QTGif

- (instancetype)initWithGifUrl:(NSString *)gifUrlString
                           img:(NSString *)imgUrlString
                        height:(CGFloat)height
                         width:(CGFloat)width
{
    if (self = [super init]) {
        self.gifUrlString = gifUrlString;
        self.imgUrlString = imgUrlString;
        self.height = height;
        self.width = width;
    }
    
    return self;
}

@end
