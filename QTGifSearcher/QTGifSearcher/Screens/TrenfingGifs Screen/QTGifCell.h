//
//  QTGifCell.h
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QTGif;

@interface QTGifCell : UITableViewCell

- (void)setGif:(QTGif *)gif;
- (void)playGif;

@end
