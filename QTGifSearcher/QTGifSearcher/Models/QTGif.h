//
//  QTGif.h
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 30.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QTGif : NSObject

@property (nonatomic, copy, readonly)  NSString *gifUrlString;
@property (nonatomic, copy, readonly)  NSString *imgUrlString;
@property (nonatomic, assign, readonly) CGFloat height;
@property (nonatomic, assign, readonly) CGFloat width;

- (instancetype)initWithGifUrl:(NSString *)gifUrlString
                           img:(NSString *)imgUrlString
                        height:(CGFloat)height
                         width:(CGFloat)width;

@end
