//
//  QTTrendingGifsViewController.h
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import "QTBaseViewController.h"

@class QTTrendingGifsPresenter;

@interface QTTrendingGifsViewController : QTBaseViewController

- (instancetype)initWithPresenter:(QTTrendingGifsPresenter *)presenter;

@end
