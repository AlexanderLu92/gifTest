//
//  QTSearchedGifsViewController.h
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import "QTBaseViewController.h"
@class QTTrendingGifsPresenter;

@interface QTSearchedGifsViewController : QTBaseViewController

- (instancetype)initWithSearchPhrase:(NSString *)phrase Presenter:(QTTrendingGifsPresenter *)presenter;


@end
