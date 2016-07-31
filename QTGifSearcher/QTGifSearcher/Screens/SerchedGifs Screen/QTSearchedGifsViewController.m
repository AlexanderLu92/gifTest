//
//  QTSearchedGifsViewController.m
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import "QTSearchedGifsViewController.h"
#import "QTTrendingGifsPresenter.h"
#import "QTTrendingGifsVisualizer.h"
#import "QTGifCell.h"

@interface QTSearchedGifsViewController ()<UITableViewDelegate, UITableViewDataSource, QTTrendingGifsVisualizer>

@property (nonatomic, strong) QTTrendingGifsPresenter *presenter;
@property (nonatomic, copy) NSString *searchPhrase;

//UI properties
@property (weak, nonatomic) IBOutlet UITableView *tbvSearchedGifs;


@end

@implementation QTSearchedGifsViewController

- (instancetype)initWithSearchPhrase:(NSString *)phrase Presenter:(QTTrendingGifsPresenter *)presenter
{
    if (self = [super init]) {
        self.presenter = presenter;
        self.presenter.delegate = self;
        self.searchPhrase = phrase;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupTableView];
    self.navigationItem.title = [self.searchPhrase uppercaseString];

    [self.presenter load:self.searchPhrase];
}

- (void)setupTableView {
    self.tbvSearchedGifs.delegate = self;
    self.tbvSearchedGifs.dataSource = self;
    
    NSString *cellId = NSStringFromClass([QTGifCell class]);
    [self.tbvSearchedGifs registerNib:[UINib nibWithNibName:cellId bundle:nil] forCellReuseIdentifier:cellId];
    self.tbvSearchedGifs.separatorStyle = UITableViewCellSeparatorStyleNone;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QTGifCell *cell = (QTGifCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QTGifCell class])];
    [cell setGif:self.presenter.gifs[indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.presenter.gifs.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super hideKeyboard];
    QTGifCell *cell = (QTGifCell *)[self.tbvSearchedGifs cellForRowAtIndexPath:indexPath];
    [cell playGif];
}

- (void)showGifs {
    [self.tbvSearchedGifs reloadData];
}
@end
