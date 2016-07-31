//
//  QTTrendingGifsViewController.m
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import "QTTrendingGifsViewController.h"
#import "QTTrendingGifsPresenter.h"
#import "QTTrendingGifsVisualizer.h"
#import "QTGifCell.h"
#import "QTGiphyApiClient.h"
#import "QTSearchedGifsViewController.h"

@interface QTTrendingGifsViewController ()<UITableViewDelegate, UITableViewDataSource, QTTrendingGifsVisualizer, UISearchBarDelegate>

@property (nonatomic, strong) QTTrendingGifsPresenter *presenter;
//UI properties
@property (weak, nonatomic) IBOutlet UITableView *tbvTrendingGifs;
@property (weak, nonatomic) IBOutlet UISearchBar *sbSearch;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constrGifsTableBottom;

@end

@implementation QTTrendingGifsViewController

- (instancetype)initWithPresenter:(QTTrendingGifsPresenter *)presenter
{
    if (self = [super init]) {
        self.presenter = presenter;
        self.presenter.delegate = self;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.sbSearch.delegate = self;
    [self setupTableView];
    
    self.navigationItem.title = @"Trending gifs";
    [self.presenter loadTrendingGifs];
}

- (void)setupTableView {
    self.tbvTrendingGifs.delegate = self;
    self.tbvTrendingGifs.dataSource = self;

    NSString *cellId = NSStringFromClass([QTGifCell class]);
    [self.tbvTrendingGifs registerNib:[UINib nibWithNibName:cellId bundle:nil] forCellReuseIdentifier:cellId];
    self.tbvTrendingGifs.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    QTGifCell *cell = (QTGifCell *)[self.tbvTrendingGifs cellForRowAtIndexPath:indexPath];
    [cell playGif];
}

- (void)showGifs {
    [self.tbvTrendingGifs reloadData];
}

#pragma mark - keyboard 

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    
    QTGiphyApiClient *apiClient = [QTGiphyApiClient new];
    QTTrendingGifsPresenter *presenter = [[QTTrendingGifsPresenter alloc] initWithGiphyApiClient:apiClient];
    QTSearchedGifsViewController *trendingViewController = [[QTSearchedGifsViewController alloc] initWithSearchPhrase:searchBar.text Presenter:presenter];
    [self.navigationController pushViewController:trendingViewController animated:YES];
    
}
- (void)dismissKeyboard {
    [self.sbSearch resignFirstResponder];
}

- (void)updateTableViewOffsetForKeyboardHeight:(CGFloat)height {
    self.constrGifsTableBottom.constant = height;

    [UIView animateWithDuration:0.3 animations:^{
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    [super keyboardWillShow:notification];
    
    [self updateTableViewOffsetForKeyboardHeight:self.keyboardSize.height];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    [super keyboardWillHide:notification];
    
    [self updateTableViewOffsetForKeyboardHeight:self.keyboardSize.height];
}





@end
