//
//  QTGifCell.m
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import "QTGifCell.h"
#import "QTGif.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FLAnimatedImage.h"
#import <AFNetworking/AFNetworking.h>

@interface QTGifCell ()

@property (weak, nonatomic) IBOutlet FLAnimatedImageView *imgGif;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contrGifHeight;
@property (nonatomic, copy) NSString *gifUrlString;
@property (nonatomic, copy) NSString *imgUrlString;



@end

@implementation QTGifCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)prepareForReuse {
    self.imgGif.image = nil;
    [self.imgGif sd_cancelCurrentImageLoad];
}

- (void)setGif:(QTGif *)gif {
    
    self.gifUrlString = gif.gifUrlString;
    self.imgUrlString = gif.imgUrlString;
    
    [self.imgGif sd_setImageWithURL:[NSURL URLWithString:self.imgUrlString]
                    placeholderImage:nil
                             options:SDWebImageHighPriority|SDWebImageContinueInBackground];

}

- (void)playGif {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.gifUrlString]]];
        self.imgGif.animatedImage = image;
    });

}

@end
