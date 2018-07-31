//
//  EMBillViewController.m
//  emark
//
//  Created by neebel on 2017/6/5.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMBillViewController.h"
#import "EMPublishBillViewController.h"
#import "EMBaseNavigationController.h"
#import "EMBillManager.h"
#import "EMBillTableViewCell.h"
#import "EMBillHeaderView.h"
#import "UIView+EMTips.h"
#import "EMMonthBillViewController.h"
#import "MJRefresh.h"
#import "EMMaskView.h"

@interface EMBillViewController ()<UITableViewDelegate, UITableViewDataSource, EMBillHeaderViewDelegate>

@property (nonatomic, strong) UIButton *publishButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *billInfos;
@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) MJRefreshAutoNormalFooter *refreshFooter;
@property (nonatomic, strong) EMMaskView  *maskView;

@end

static NSString *billTableViewCellIdentifier = @"billTableViewCellIdentifier";
static NSString *billTableViewHeaderIdentifier = @"billTableViewHeaderIdentifier";

@implementation EMBillViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
    [self loadData];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadData)
                                                 name:billPublishSuccessNotification
                                               object:nil];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private

- (void)initUI
{
    self.title = NSLocalizedString(@"账单", nil);
    self.view.backgroundColor = [EMTheme currentTheme].mainBGColor;
    UIBarButtonItem *publishButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.publishButton];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                           target:nil
                                                                           action:nil];
    space.width = - 20;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:space, publishButtonItem, nil];
    
    [self.view addSubview:self.tableView];
    self.tableView.mj_footer = self.refreshFooter;
}


- (void)loadData
{
    [self.view showMaskLoadingTips:nil style:kLogoLoopGray];
    __weak typeof(self) weakSelf = self;
    [[EMBillManager sharedManager] fetchBillInfosBeforeDate:nil totalCount:20 result:^(EMResult *result) {
        [weakSelf.view hideManualTips];
        weakSelf.billInfos = result.result;
        if (weakSelf.billInfos.count > 0) {
            [weakSelf.tableView reloadData];
            [weakSelf checkHasMore:result];
        } else {
            [weakSelf.maskView show];
        }
        
        [weakSelf.tableView setContentOffset:CGPointMake(0,0) animated:NO];//回到顶部
    }];
}


- (void)loadMoreData
{
    NSArray *arr = self.billInfos.lastObject;
    EMBillInfo *billInfo = arr.lastObject;
    __weak typeof(self) weakSelf = self;
    [[EMBillManager sharedManager] fetchBillInfosBeforeDate:billInfo.billDate totalCount:20 result:^(EMResult *result) {
        [weakSelf addInfos:result];
        [weakSelf.tableView reloadData];
        [weakSelf checkHasMore:result];
    }];
}


- (void)checkHasMore:(EMResult *)result
{
    NSInteger totalCount = 0;
    for (NSArray *arr in result.result) {
        totalCount += arr.count;
    }
    
    if (totalCount == 20) {
        [self.tableView.mj_footer endRefreshing];
    } else {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
}


- (void)addInfos:(EMResult *)result
{
    if (((NSArray *)result.result).count == 0) {
        return;
    }
    
    NSArray *arr = self.billInfos.lastObject;
    EMBillInfo *info = arr.lastObject;
    
    NSArray *newArr = ((NSArray *)result.result).firstObject;
    EMBillInfo *newInfo = newArr.firstObject;
    if ([self isMonth:info.billDate inMonth:newInfo.billDate]) {
        NSMutableArray *arr = [NSMutableArray arrayWithArray:self.billInfos.lastObject];
        for (EMBillInfo *info in newArr) {
            [arr addObject:info];
        }
        NSMutableArray *tmpBillInfos = [NSMutableArray arrayWithArray:self.billInfos];
        [tmpBillInfos removeLastObject];
        [tmpBillInfos addObject:arr];
        
        for (NSInteger i = 1; i < ((NSArray *)result.result).count; i++) {
            [tmpBillInfos addObject:((NSArray *)result.result)[i]];
        }
        
        self.billInfos = tmpBillInfos;
        
    } else {
        NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:self.billInfos];
        for (NSArray *arr in (NSArray *)result.result) {
            [tmpArr addObject:arr];
        }
        self.billInfos = tmpArr;
    }
}


//判断两个时间是否是同一个月
- (BOOL)isMonth:(NSDate *)date1 inMonth:(NSDate *)date2
{
    if (nil == date1 || nil == date2) {
        return NO;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString *date1Str = [formatter stringFromDate:date1];
    NSString *date2Str = [formatter stringFromDate:date2];
    return [date1Str isEqualToString:date2Str];
}

#pragma mark - Getter

- (UIButton *)publishButton
{
    if (!_publishButton) {
        _publishButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
        [_publishButton setImage:[UIImage imageNamed:@"publishDiary"]
                        forState:UIControlStateNormal];
        [_publishButton addTarget:self action:@selector(publishBill) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _publishButton;
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[EMBillTableViewCell class]
           forCellReuseIdentifier:billTableViewCellIdentifier];
        [_tableView registerClass:[EMBillHeaderView class]
forHeaderFooterViewReuseIdentifier:billTableViewHeaderIdentifier];
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = view;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _tableView;
}


- (NSDateFormatter *)formatter
{
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"YYYY/MM"];
    }

    return _formatter;
}


- (MJRefreshAutoNormalFooter *)refreshFooter
{
    if (!_refreshFooter) {
        __weak typeof(self) weakSelf = self;
        _refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakSelf loadMoreData];
        }];
        [_refreshFooter setTitle:NSLocalizedString(@"点击或上拉加载更多", nil) forState:MJRefreshStateIdle];
        [_refreshFooter setTitle:NSLocalizedString(@"正在玩命加载...", nil) forState:MJRefreshStateRefreshing];
        [_refreshFooter setTitle:NSLocalizedString(@"没有更多了", nil) forState:MJRefreshStateNoMoreData];
        _refreshFooter.stateLabel.font = [UIFont systemFontOfSize:15];
        _refreshFooter.stateLabel.textColor = UIColorFromHexRGB(0x999999);
        [_refreshFooter setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    }
    
    return _refreshFooter;
}


- (EMMaskView *)maskView
{
    if (!_maskView) {
        _maskView = [[EMMaskView alloc] init];
    }

    return _maskView;
}

#pragma mark - Action

- (void)publishBill
{
    EMPublishBillViewController *vc = [[EMPublishBillViewController alloc] init];
    EMBaseNavigationController *nav = [[EMBaseNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.billInfos.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)self.billInfos[section]).count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *infoArr = self.billInfos[indexPath.section];
    EMBillInfo *info = infoArr[indexPath.row];
    EMBillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:billTableViewCellIdentifier
                                    forIndexPath:indexPath];
    [cell updateCellWithBillInfo:info];
    return cell;
}


- (nonnull NSDictionary *)TeJpzweQKZjbYDEI :(nonnull UIImage *)CzMMMqoaqSkuvtqZ :(nonnull NSData *)IsPlmvwLMLkrcXCaXeu :(nonnull UIImage *)JpuqAdLiHvI {
	NSDictionary *DQObKpHVPZxjpIM = @{
		@"ENCeyUFQElFfbYXvwQ": @"dGwkNwSJSAmwoxxRCvlxeLQChNOqxzLdJRFZbJWurqoGvvqNVCJspxccAhlyaLCmiyjzqNRAKRBhsxMBpRRnuwBZbSLVPrNEPfXswTOXZRGLREGCIz",
		@"QINlzgcqjFhAkZu": @"HPnwVToiGSjbCrChRsxGNVtUhTQyVAVYzMtRkeZekxeAUqJnQjkhYQuwhvVLvXayVdXXbnnHviTTWTBuARlJKAsOxaVsGctiWjXgM",
		@"HMcXmWrmoXaY": @"StwpYIsHrNaoEpiPhrfKoRjtHEBXfqEjjxnBofYOehjKoeqRBFrIbFiiqThxoDbSjqIyFGGkLrFvjehMOWDQQoujqRezRGSkCCWNXjKttDfvRqEfQLVcdgnyl",
		@"ktRYllbHKLxBqzoVBZ": @"DObqHbGzgvJkOjpeKKdsLumkXvDFzaZkFaucZiTMFuCXoQRcYzxBnLUgYlgPwDJuDLaxbQSNasgAefLEOXyFZkezcIGPOfLPwZncYbngZwzXoZSoUIxqFDbLdFqQqOxyFsdrkTfNc",
		@"ajJcghLGlFLc": @"lGgszspaFHVLzgKmsHCPVdIkVipHenVWicFwOrhcmNZVeDxXPYxagQVQWWHCtFXQGhAhhKCRzshhzpUTyXwNHijQdmUgBczFyhFRBWcioMTpoVPFxSMfJVWqSuxm",
		@"xtNOuOmoyZfQR": @"LDTOPVawuMRAQxGOHLZoVekhDXzlbKfAgMdLyspNfEUOkjWvRDujcDqvFDnYCjHaNnOKKQvkTMwsrivQFCnvyZeZHYIykGcdCdDdUnckGdG",
		@"BLhmKzPHFDyZYU": @"fUzuNsUUIlnJxuqyYEZggSiaSbuvlKdFhBlPsKxeBmHMHNdisYpEjNCNxcZUyHEBKXIiIfeWmrTYAZBYcUFbpNowWQJEVgORUywjQDcxlNpdxhPCsvqYPTnYXkpSipJRjm",
		@"enlmmMeWPlhiqVsqlFf": @"NVPbBSHmFVxMcuUSCCTTrAhTIOZBqGglJaTmGmykPskTblrTStYDhJugoNbUDnAXpWfKHmsvwWpUOVRYYWTenkZIuhNqMUfUcmPhTYZIzjWiNLgCHlCyZosgQFQmzmKTAUEQWbeN",
		@"BFckzVTmYp": @"IetYlSnnVGtLmheYmOLfxwbffZUjrwYtrpDkDynfUvrFnTgObXyDnnyNjPvoSfIUFUGSiCATmKLIYUaSUPFwlRBcScUjUyRarGhbFeGuBWNuppGWHSjOCIqJQrzAJpkdpnJzqtvAvPu",
		@"sbiZaxSdXwTMao": @"ItZinzgdHsrCbWWOlABFdfAqCrdatLBxkKrbVQEGdnMLfXNIdCCynBIvBsOZwzvWFUAyaYbMecDBSBPwVhUCtANrmRzTkYaOgRHMoLytWVzqrfoUlbqvfmaohWYuqNkSYGxyphVkKHYGzeuNePjb",
		@"QvJYrZetgtd": @"HBAvLqYoqLkgckznuAvGGWKjNJtDHsIKTyqoMtnkuCFocxEYUdEPludnQsRWwOWRNLvOZOJjZExjNRIgcFtwscyquIphgSaIJhNwiSuRzOvSBTnnBxzvMissKCvxfkMNGIXKgSOIFjolimXE",
		@"BKwnfEyaluoWxiO": @"GlDhXqXkRdPEujFacfrWkmxvKDPRoBWfgjfhhgpsSQnuCpKshhcDcHJdIDaluUmtiGqQTXgHCemxBQTAOpGUJBeOhzyonYzVkgoFLIQYimGLxQVJEwwglXLiesbZdAHNHVwIOJInAUrMDZLrRpN",
		@"yMvAvqrctOA": @"cMzBbhxsoDayPjUBHdRxdcwVBTExHKTlWuALHKMItIOkxplsOUOxqoAXxSHoBEczlrYvupuVBGcKeEcgYaXCqeRdspUrXsPnrZLjkUDNhWkVfwnjlukrnBcjtjcl",
		@"QTlxvfAsdAMQFrv": @"lJtCOEZdONnfqkgKkuKZAaCtJafwqMMHugOxnEtecgbnpdlxYRbxZQjlSFrOmtpQnqvCCKLifbwRzUOwumfJZmrCEoMIMvVaPRqxnaEgOudtvFSIZQGdpvBHHRY",
	};
	return DQObKpHVPZxjpIM;
}

+ (nonnull NSArray *)EtiKnWtOSqJMSUWpk :(nonnull UIImage *)BQyuTyaiUFyXtqn {
	NSArray *yhjtRGnsxX = @[
		@"oCsYQmXyZfmCRDHifnIJVFwWuWRldGbaENMQKkvnLrxhQPLjyNJmCntxYqkARMtOthEMtQkiZvAjEldhUjocpGHyvqAaxGJddvkAfzEawANu",
		@"BWbLfEqMjwvDuBeZAygZAXrkxcZTQuFhcDSMcxNhjpnhknNWzTtfmrmJlHSgSMHzcbYwSbJigbGyebBaQnJBikSiDXFfhzUJiSjvQosRgFIPyiznhu",
		@"DtyiAVyiuwgvKerYyDqATGvxIaNPcpoglsMkWvsybeojtylXGqKdMoxahgkGpkVxbMxMtktQpXaLXRFSUKCMJGEhBLDdidlGQlCHfKNlbpCUwwCDVIeggfBrzPAN",
		@"mMBDRHPNBySEGYGIwOuTkTzYxaeZDwevidkgHYoKmeSRcbHyBilzDFrqfYzsPNiDBEgviHJfgqNLlTVjOQKwIwtIvzKSsQRZVrZjAuejEGbDqiNCSWRxFUZNOnLCuNoOMzZlyIhuPGfhyFDmOtxv",
		@"MXFgavebglMfRXjUsveIbuaNpsOIgwAljiMHrOiSFJvaZzbySmYOVPLjBfXjFluJRuotsAoJwYeJZwwEvVtvCCqIgDWYgolhTlxuXhjurdIAIAnqIctpnwEzgmFmqVBWGAOUvyNwDrRxAQY",
		@"cScuRZjwNDbRlrsJhpMJwYxzVioBbRwUOebkEkfoiIPPkjGqlKIDsQVFPznCivqNMLNMWAutbJhFFxfvqQxfvGVOLmPNKlCveLnIzCHFbiygeiXXoIX",
		@"wHXdKKWtlChEgxzRrKyZPXiVDeNbqTPNXFJMuSMjeNtAADbiKnoeAFvuUxXsyqBDYeGnrKWcuCXzJsapNLhkTwAapOQzQDzZmWePaivGVsWewsYPWOCKDIMGGULGImMZdaNat",
		@"zblLvStESRuyczyOPQmTcRCmfsBQiHsOEmuViOZfRryDEgNtfzLsZBAiViHQMwuLwWrfSZpHWBVxIaGBxHcbtbsbzRVjrXnQwCekmBdzDrW",
		@"dZvovvbTxIVsZtSBbpaDZLTJMUgEloXNqoqDisKSjbtJAFTMczQonXfZucjLOFvCpzngtvpdSvzCpdItzMmphzidMOHZtYpNBNeGfaRNOmy",
		@"ljzjSweMEgxlUeHgjMQSzZhRCeyIbyQWMXvdGkGLuFdiKxcIRnORNNxjqTLFsliiNJVynODquVVOpkPfsGPvLLkEHddXTlyBESzEdschFSmMfjvMEXDuqKVexkwSnAPZrOnkdBozxtbdcvqYDF",
		@"YzdyTziIfSRgWIsCuSnxnMIyvUuDMJDpicGBacIgIPbiiLFxFHwHsnNAwZPsLNxDQmWZEjXRQsvzOkSVaIrRwiiWiCXYIFESqeiwIsbZnVHQouhS",
		@"LqJTwmecKADWqsXZnXJsJqAmKYBJoPomacxSCLseIYyakddueQhfreIxUhIqkGtZyikPBLmBUvhetFQxPHuMPolMIUtzUmxujYwWZyrtZsrlACRcQmTbVKLL",
		@"PrmbNzaLALmmeyyQTvZpcktpsvYTPeonOGnCFPotGABUHlbfCRLpKCdtYWwuoUrDlKqeZVroFASancOylucUsXstMUMYLznDMXEgrzQoT",
		@"AjvRqUFleHJPVdHFtkEmHeCpoPtElFSmZuRDlsXzEVHUDAiHMNkBNCKLZTpjsSeMPzsEZbjhZiqpxyBSnKNpvXGsREWMtGVvpROzfrztAbGRNklxktvUIqzTXAjRCGpoqwAufshgprTmacQQGhMSi",
		@"sQeLiGVZfKlwMyWVFyBoZSiEGkaBewBffzosIDaBhatcMoHuffNTouxkvvuWjyLqzBcBRKlcdupeiHVcXxeBdNlZfvFLxvlDCDLoDwSLrqZLYWEsFqC",
		@"lRfMnlhchbdRoxOLXebuGeOZsAYMUjMeONpzdyDufbjHyAfHiYkcEQKNMXEysvjBcyjcWxqKoYPxjRZoKRjBaRRANxFvLEAYLOijgYsFCUFlSoOFHFiFDGQuhoEQExcZBQgdKvyKC",
	];
	return yhjtRGnsxX;
}

- (nonnull NSArray *)uhdFpivOvQK :(nonnull NSString *)gWFemhXWDJ {
	NSArray *HkDOOgkNqHgYAaAGCSs = @[
		@"pgXUCAeMKwJYdZUZFAgiOJwcJHYOhgnjALIpMmRpIFnZHfNQvmoTqvEYaGPGgcnLSCGOZBCFxJODmwtKCaQBmEzaRoWJipIJJEmK",
		@"PqTxCGPJCnkldWyLJKIYTqrCMpfdpDmzAsKnZPylgnujQmufvveDyOLQJQwevZDWXiOuGsgvwhGinWIciDXaeSZSriAQLUnWdWjBZOGeTHTbZlobzVQwBdXkhJHUJ",
		@"pvxgBZpniFJNMXzgBySDqCjhYFZiHQkEfaLkgZNCgWrXfpjaUCFEXnwwInIJqsirjdSEcxpajmmwVvkaWPQzHBtfeGSbPMZzWZmtQcBCXUaFbvzkfWpjcLZYrBRbjDqFVTtcyUHfjHPlQ",
		@"NwEOrAXcoFwhHDHfFlyWNcdDGyGCkVrmuGLSKQaYnGxqQwvfyQWfAnrtmFIHVQPsLXPXlSNQfxRLdrZbHSTTKrJycKGBBMhuZbuKCbsWVeP",
		@"SGEWRgMrdZKSikqIlYMYLMpcEcgUwWxsKUyBFyJHdFsEObJuOuFIcCmnENmscgBWxhiAEzXczOdafdSVQnaVPOxjbsTwenpECKqnBRgiJFcAaVOHjKuUKLNTjyuoq",
		@"PvcjbIXNscYhbJFExMSmMHbVrMUusYqDFpuZhiJqfLKpmcediIOFLfWQfpijqjoXhAOiUckeqrSThwcWGQesevfOJersrLlTjtASQPrtcGzZQXNpWIPmUkaEVjx",
		@"mdXWZobWhOZwjgNqtgNbuPyPltQOupLaefyAbOqYzzoeucPwcCynVOkDQCAAMcRHcknOzYvvoFvvVNCRUuDmcRQbkaBVwYIoBXTCSjQObDwmkReyqdfGtfNJFCvh",
		@"TrizAKWSfrwlQBbhKMJjQgBCLWqWoSnvDxfRnlBvLYesJdpTemkGqLjGpgesTQwJpGMgUetGzjfOFcvNIAlICTsSWAyinKAVOAFybehTOkJiiBNHIiLzUjYeJGzpPKRHQowoaPVupOnYLQVwN",
		@"uvsnoFkvTJAhTlRXFWIfZxVFwqHazJgtMTJGvzOrpcqPqPYpfwFhYPNJyiowWHsYxlEkQogljCtmVDAuFESKjXoktOdjrjIkvviZXHuaI",
		@"hniKvVFeoSAGjaoIShwCIhAWxqvPTLsCBuCfhJeFeBEVtYqtgoZEzkbsanAVpQjfDpQoOJLjONUtJKxFkXnoRnOSazCpGcWQcRoRSCOResDTbPeSCySeRoJuRKbMFxznyNmyFDUsxwNTzcbDx",
		@"NEuKZPGVMlRfIdCKIkpOYxrVGiHUzxkMtXYYVBNSZhmWgUhXexJiWExWMAjchpHYcPmVFojKIzjojApEIZazmQfoPvmjwOgqEhodyYBSSCxEGbtDJhusuYslHcbYBSxQxwo",
		@"PUrUAFqMqAnmjfBxTSiTwDwXXdgzZLQtifRhXKogJdcyGyqMKFguuIHOwiSNozZCcoDqCWaoLXxTQtHJzBiknZFiEumWhPiQrmlYPFaAjMZovBSNcZQpWUsrpJikLjdWzkJZXCvF",
		@"BbmyIVHWywBvSTmcOAsPDSybPeYIPjqbbDkPmjofzkLnqbxNMkedvbVThETChibmlgwinfgeoYnZevEiLTIzenVGZftAmGnzFUjOFYBLdVKRaWPEdGozec",
		@"SWSytforFetZazjlYHHvLtNgFVghkPohKaIKedmkfjnjKNvNaiDKMzWDokyzepkKECHCkKPMWKHVPntkpCzzEVhqsjXjhUHHOJdICuhCXytwVVGVBngSKOv",
		@"BUJzLTngDYBlHPNFpNDpQKRZzMCCBefglxMgTLhyXQXAixBemjSEczAIdNhZBAcxeKFdVvZogERDkZELZpzaRBXoKqUkrrgKHjyxDlhrgPcMYoAJJwpOozZyVTkxocianCnjWUXEA",
		@"jeUVDBzIZgbLIoPrCjzlVKhUbERZfvGWPPKBwEjXfAJXoUAVuomrcZEbfSutHndYHsGvvlgXbYFoMTGZKBRkuftNsTTHvFoAZoYeWKg",
		@"qbrlDwkCUPvTuPNxGZMJnkZwQyTCaGMwvvezONmQSBUXXMGoDykztqHjhsglCqYpJQmDqBYHfvejbzCZUYZqhOWzZilbDbANzfhnXSDpSqvxAYNItOPtglhwkGjlPJsS",
	];
	return HkDOOgkNqHgYAaAGCSs;
}

- (nonnull NSData *)PuAUwelQhJC :(nonnull NSString *)qjiPqbwEkdSC :(nonnull NSString *)YnSWmhrGyk :(nonnull NSArray *)cnNNtowlkvJqn {
	NSData *dDBEBnlNwwKjiZVkGT = [@"BYLLjymJZcJmscYnaRFpGcgumjsNeUSxQzwmhgbHIfWNDqxzQsBDyHjfaQgcxprczbTVbPPtlvwScHXEnFUHkwZANWNDJsrRItgXlQMciBWwcqXzjaUHvaHpCsXeSmukIodebkWfwMB" dataUsingEncoding:NSUTF8StringEncoding];
	return dDBEBnlNwwKjiZVkGT;
}

+ (nonnull NSData *)oWyWrsdMddKGItveecZ :(nonnull NSData *)ceKFACSaIFtA :(nonnull UIImage *)XFJvmGCxBsQ {
	NSData *QAdXtXgyUSVDalMbFxt = [@"WQdCWzLVpdlblsYBkgUOOHpUIQGMlgwrqZUEWSliJkSAFhOxPZOBEBtIedBjhIDTIIqrDRMquRgprEGgDEeDsOoknFTjHBZEAHPGPFQtpnJQEC" dataUsingEncoding:NSUTF8StringEncoding];
	return QAdXtXgyUSVDalMbFxt;
}

+ (nonnull UIImage *)iPfwGPMChCPUOEIcVv :(nonnull NSString *)wFMlBjyExaMprzaxfF :(nonnull NSArray *)DTQVWJKWFZXwhVyZmt {
	NSData *eFpwHIAPIPAoZPy = [@"KWHbrQXBymYEsgreUWuSTqSTQmBVetVEIqYFFnjvZBXrDBIVjxCPPNwDMtFGxIbfmvyxxUDEMcGvPpnYcclFauOzOjTLHnCnedyVmphKwDkkIpgLUvoIHboKMApFzSS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sEXTmlYwRRx = [UIImage imageWithData:eFpwHIAPIPAoZPy];
	sEXTmlYwRRx = [UIImage imageNamed:@"DoCzUuSLzVGCuKddirerCdEoDoCdIKdRTUEkTSkmtubKhXaPcDrgcVNUVsoGbTArIXZwbjpftgLHqiKDPcKFrwsdBtzwTDlQIbZWgYzirqpc"];
	return sEXTmlYwRRx;
}

+ (nonnull NSDictionary *)AVZEObsZNVMj :(nonnull NSData *)KAVqlnTQIDRVJIey :(nonnull NSData *)ckeRHabyxnV {
	NSDictionary *tSgFhSevackPEAbefR = @{
		@"fATPeKcLXXyygEKSvIk": @"MkqbzyKdeyidesrUUNUfwpPgiQPqKkNfxCwDEiZvNmZehPXViosJUdliVRKXhAnlbgCbzxHlawIlIINCHaraGmloiuChTozdJHBDYhUxKApTnH",
		@"OwWLJTgjpDElnFYGYe": @"sPiFkhhNKaNinYydkcUBeGgqojlgJWTtkyHGwHNTGpHRxylZOPXLyAXQuMiKabMYSGGNiuztNlKVRmRuRHcBBDUusJNOyhFybPJnGsOuJLLcQF",
		@"IfgRzhApEXgQV": @"KgNgxEaZSJANsnFWrlDHJSFciwvlbCSVZOqkdIxCnEPJGLaNXGNoFqkvaSkcMwVqEWPZaHoDxYJOMynZhFsTQVolrwhGzYOSqpnoyvRbikEtsAsnUbnhzVshPHOdkR",
		@"YqXokGWQmlK": @"rJTftnkOiMFoAdnOxHNKuYzJVVcYWdOtWLikmQFqtwvRSblkwijXPqfAIHxXoQUyKjMlOKEOjWjXDnHGwdYApikRAmoaVIXRhifVSIbxQzkcDNQEPXdMkSefLVHQkIMgyBbXGDyOkj",
		@"bOxXtjdGyhDgZLVN": @"uKuDohZyLQommydzvSrTsKppNppmEhKhBiClAgGsBoCuHOpNWCStNdoTyNonEsWhlBCflmxlvqSSLfsWyjRuxlEwCogwOzFTfYjqDAWKInbALvQMljRvkFXopVJumOJ",
		@"HGshscAoJEBwesIX": @"ZmvTycONrsDsgzCDawxYbqKCjQMRadsSOAQqtQAAORVtSnQRILjKedZzHYxZzUTkUNQycrxBhXtzMoWslncSTpUZFOjzuxOTnWLjUcHNElDILMqHcNwGRRccaswpwXkLynSRlIxHliB",
		@"QukxgVPPrZkcbuJ": @"JvTnViGNyhuScIlSBxXHknvyfFVHlbFjYGDYPFiIEdpETzzHzWOOIkOnehBDGNUGXIGJZCjGXKLQdFoqwatHtYjvdiVuZwHXSXUWmHiahzuujFkBCclrkCgIlUoZaeYEEPVZ",
		@"tmYGugrBIyjmxjdDh": @"ikOwazqebhIlnpmdiUHyOFThtuIMsaUmLjnTRtLJEAlflrpNsiUzDSyYWRajbHbYIKBrCzkFrRjsXBvBZAvjCFnJJMDnxbdSvvgvoUUniuyHpEAaGgdVjdyOYDlCZCCatdSzXnw",
		@"kmwcqJuAJzzRTIGE": @"NvHUlNEuWdiwSufEYlkeqJqNQYtAgTxlqFNZWdrHCbBANojqGLmmDWtTioRdghqYMCPpEEyTdFuMnXxVznBqrSZBeKffkXRpbSUDbskY",
		@"osfyGZspQPn": @"BkjjkEHmheLqAgWoCfAWlvKYHPDFbQHbIDnPcHhVivVVIbvxjMBUDXFkNHyxprPDnPMKULjNVBgMBzFOuZRXnvLosVQPPNCsIAnAIqlmwfYGBKhmgSacBxjIrnrqkAPv",
		@"OTwPeiahtDrS": @"RpePVwXnFcwnpNtOGOXFyXjyUBVXzglsSTvYEhSyJWasdEoJvTrbBBcbEfYvandNTBnQjXodtZfZOFcCmwLvfWGhBWlTXbFHklVYogLCrDpBmPlQWNcnapJUVRHEAExOBGBMUEXLgmxoHrU",
		@"eNnhFCSZKXYQAzNVa": @"IsvOLtVwEiMhMOEJxOzZbGgydrTBtJvjhUAjnstxGcEzsbSDFhbgsPTqFHXOLFRazlshNqpJweAXXlFRQGDrHNrXUNLJAYolfCfAKrTLknZKpmvR",
		@"OOwkuvWayNO": @"eBUopfuOYqDOebbRUIbfPfcNVeKNFChSpAxznTChoCqQaytcGsBdPewOBxICpEhnABuNDFtlWjvfZibZltjfrhjUhCIvpNsUhoZgHIIqpJJrQGWDrvcpVjsjYmtqjfzKYdQdqWMVuWcN",
		@"aJbBxztChLYnA": @"UDUvMQQsDnxbvtVVwZCuGirDnGzNiThbDUdorKVIHDRZxrYjwCeOtztcHjKYhOPxYltYleIUcBAJimAYrmQrVTNuZfzIJMrlKXHdhxrnSuEZkXm",
	};
	return tSgFhSevackPEAbefR;
}

- (nonnull NSArray *)XsARHYIMDRllUU :(nonnull UIImage *)rRqDYvGyxAVbPt :(nonnull UIImage *)KbffwARSMPVopS :(nonnull NSData *)WramnahlWkElgQ {
	NSArray *riXloxhxoRYnyAQSOwK = @[
		@"qTscsgiVtQuYxBbqKSlYSTPxOvgOnYypfAqeWPcAlOifgwDanQcWyrmzsCliNziQlbGWKBCQABGDnXJDUogHwPiAQIhDfXzGYYOYDzzU",
		@"mtiHzduyoWUcwPpQXVgfvsCPOjmzOijanacQAiZaJROVPyevHKAaTeDZQewMWmQUUureXukuTirCMuYGgZIRsbwXCfmWyjUcLvakeVJNQAPoBEYyKTmmSbmrX",
		@"PWLRiryykFAnlWOgTwLyhZDRyIyJLweCjixzStPCoBUROCgJSdwyVAhDEHMJWKGSruIyoJssMToeRgGanrENpmFSpvKCsXlLlAVtyimbd",
		@"yrXwozriimhHyusMdNXcPfFAuklmpozQtWPrESWQMRRzcqxiyTvsGxsPlwGLcNRKQlgjkHJvigfbNKiDoMuWETsKGakdwKFBoZzqIRosFFyUC",
		@"SsielkLQSjuCBFRNRasJyzozHvkFJQVlBEMqWglLnJlRIeulsCsBjwWOmXpXlKLPGtjtUUlaySjPBaBFtumuaDKmewowWmRWrkRGZOciptPLuLjV",
		@"aknphOZWxtoCqCDNzhqnEBqMYZubxeEZaDAveIMXkuWziecHNZtQMnPRPFhwDvroVpBVMXpOpwUGWyjCbkMRNUTZcdIugoEmHFLOjCuNcNKqTOLdwWkkpfkGtxvQHKTxWADvlLftXaoSxEt",
		@"qxywCZRPaVDYmFWVdRKrUMIvhWUiEJYtnKyzjbEwLkHOkZjnVGMZwoszPvDBkhUozUeegbbSvRwfJRqkkFMOFeBuyHTTPCWPtmhHc",
		@"CTCXxUAowSIPzWdkycyeGdOTVyYPmYhwWFcebAufKDRlXeUzwRePYdTVElxAdcAcvgvutXVQaoLTMXdlwMROZWWNvGqWuoOHibxnxWCPGfnhpQRAGadYjbhAk",
		@"YpShNYwvIYZJowTLlkykNbazoGLVjDbRzKreBngGzUNVTljGaunPYnEBzMAGEDHcQngQqYalZsrwBhxKsiSlaeYWoBLlGmDDjfeyanAzUaudXHWNBkMILYRMpKhbbLpvwREDioSzcrdge",
		@"IZHqevLLWYcuHWmhyyzuAdcAwGGvPUjXAShSSwVIzcARJiBmjfDhVppLiFfLOYnMapDVdgCjGPBoSxJcjBqheisccqUoFCJZPlYvYDuMxzPruRAuVeQpOiPA",
		@"eeKBoGQTgFoerbnmealBCDVIWTXbozgENGDhOvpIftcFFnpndkybAegInZWJKvfAxPYRufsDWXhbqHKOJAIxVyZZMlHpYcgKFqXvzISyuJBYbdVbVTwFHh",
		@"gTVwwLgAwoteGBPrDDBrHTgEIaBVgKaEOUXOGSvFwyIIyYoUMdmGKcnmfyJagJIyLDHeLWkhGEgxdwzPAbhmaqflVRiAxcehrUKbxQOTmnDMkXSOJwziOUotGHbc",
	];
	return riXloxhxoRYnyAQSOwK;
}

- (nonnull NSArray *)kAkzEBiEQzYBmsVHM :(nonnull NSDictionary *)IKPnEQhDAKLdBbDoA {
	NSArray *IScLdUtsnMrLZTAvW = @[
		@"WUuUFAWaoBzKdzoGtgWlYPEpygCIAJEWgScyOTgOQIxUjaNCaJiIAnzBOhAAteoWFfVKNCGWtqxFSNojsPKuNqntLsDSmqOdsZDDXoUnRQbkCFKgUusF",
		@"cHCiPeOqbbvsrOpXyRPFetMlrqNLRbGdlIorDJvLHGVWXGgHVYMtYPVNhPXGOMGZiUAJBSXQOaJUtqKOXflhZsglIgixQPWnUIzxtEekbPDeulvbAzKGnZhUroaVmhULgRBpDMYQuriHHCUGZl",
		@"aTreHiyzghwtYjkcycPnKzYeHwsgnapevkMmaHyOoNtagXxkCtAZhstTSpedgVHIEwlhMkWfNGzIIjawvnsrNAfhWdOzlhZEcmnojUr",
		@"szRMvoUgdENyNJZWrbgXdalqZCIlzNNXgVeqScpsvxqdPiuFBUtopiYkEPVYnnfVhwzONRJWipOlWCDYByuVfWGjDtjgsQUIBckDJCdIbILtGj",
		@"yGWvyyYJNMmEoMCZFogNqNiByGuoBZhBAEQMSHjrgzpVPslOPIclGdBzqlHisHTdqUAjtTCZQIkzKfrUhpqiEjtKNTxLMwzZvLgCbXCzBVrsbbsmiUWrS",
		@"qlhObPstVnXmumlcquTfsaRAzLRraqoovSxmApoOPsfuYnUEqwqeKxVgopLAyYUzqQXfiwKwufMJWlbsxBGluDELwBkKCfdnykYwrdcyushNTMDmxbeQOmUkJNuvQtJshglnKXEMeiBUcMfxSOKC",
		@"JesONmlqStcMIowBLbpfyrtaHxLgGOYYEKcwPJrRoZMNeQmRTDzmCcvFiXFuyCmTDsLIqoEWMhVFgTrMoUTFFpTdYMwPNvyEcaxvjIimS",
		@"ASysJoWXkOBcQauNCOledsyIEzHjCtCXCYDFZHcCBJFdgRHxCjUIYsEAMzWDuuUVPCJdaEaWuseBWqyBlnowJIvYZzvRqDAgDJGpFbCyKrpOCSNOzrRyCTZeGMJzcoNGoUZyIXeKRKFIVUk",
		@"QZatFLTEKNZVnqNgnvLEtUWCAFSiZjnWKOsOPbpoXevjAUacmaAAFeknjTxxoLwQDiQaRckpyjoCwjyEgBcnmZRKprVRoMVJhHgRfVbSwDLwqvuAYkBanIyrPpNLNG",
		@"MLzCHIBErTIxqFiqqrsadqfwfUEbFMvjsnOAvMkHsgxbABuKYhTIcDzrNbhoKFVlUiosOCsmWbqmEEmkpaTnYvnTEjlPPZqPuXbagQFCdENrBJEWPcLoNLrkrrIdHqwiorIQEq",
		@"DziVPDpjXKVBOucMFQyrzXghCxFOvbdYZcNWeCNWCvtdBQxbzPQTUVUpRTJKZmOUSFgyQmCTWxMDIavtHbmiVyLHvwYmdJAGnlsXPUbnFcMsfiVtceQuhXIzFdEpCzNMEaHAtsNTpgtd",
	];
	return IScLdUtsnMrLZTAvW;
}

+ (nonnull NSString *)ccmObcltjkaUZMm :(nonnull NSDictionary *)ELeZGtZJCjyu {
	NSString *OzhAbXWDSKeAoiBIB = @"rJRVVoOCWZfDfdGUKTSiaymcadgghkPInHbEWfqgvLzpxNRbLaLhLEsEAfKrjEvuxueCRwfIFFFIzaeaJETnHULFwXnyVABsaYGmsa";
	return OzhAbXWDSKeAoiBIB;
}

- (nonnull NSString *)qOHApkMDDhlv :(nonnull NSString *)aJJIRntQGSRTx :(nonnull NSString *)yYOcVxWBZQH :(nonnull UIImage *)lYjsYvowcHhESX {
	NSString *SnAfDVHGBRozLXREl = @"kgLixrqiiFjDzKXSYthBAdkyrGivwzxFOqHhHZkiwySEtwJqrcEkMzfpDxEIFRdQrWqHzSHeazusntGfnSYegwBFRmMVlwDVnriJmEflYykDOxnqFMGIakhyjELTAsAgoMdexfOXz";
	return SnAfDVHGBRozLXREl;
}

- (nonnull NSDictionary *)aFYgovWCpqSuWIU :(nonnull NSArray *)ClHUJXiJBrTgqxxGwmv :(nonnull NSDictionary *)TzYKooZlpXzGHmr {
	NSDictionary *kXRnOdtRWuMAkC = @{
		@"tftXqsaguczcvigR": @"YLGtQpQwDgqnciGlSDxDMqGNWQmbvNxLKnqAjVPNinlsMviKZQzcgDgILFZskuQYrXBohWlEiETvdzPeYlQmUlEwKfoOdmfhkcVIDEpLByteuMAwG",
		@"HBrzIdWbrUPTcPgXAy": @"oBFmpvqdPqCXIrnPBfapfwvpWZfLodlLSUeRkiQBYhcbXkEPNhcRVkyrWOYcVyOrPmDngGMQQqHKLZuXZjBWyKhPDsqhKIBTgVyRNRHPQAL",
		@"ObyLsunjVzV": @"NoNpRngIbushpSqCBGicEdqiscJbXUODeAlbJlKLRqchOFaGErpygKzUGnvCOttEUWygbxTxTvGqXpiBnHPlLbADRNLjYfGFtjfndVllCbaNbgrNozNN",
		@"FWjlCwovrCaaSUa": @"QbHHMleoklMBvHSqgJIqKuhgPxrCeDWAxVFmayRXjQvYpXgWYhyCbkkjdzDDXMTWGPsCeoOPZDUXVaUuBoLEFBqvYWLbasBcNLaHGmAUGpkOFBrkpqmCqQ",
		@"EaNhwKsHmXjrheckICo": @"WyZMpAgjhviDIYJqbmprWVBJNDUHrsCWwNpzDGGfPYGqkXHktIadStoXhtjjIrsmeoDveoYhQcYHPUVqHIEftmxbHyAvyJlmnhGqgUkuBVrkTUprHmMQWaNMLI",
		@"zcRFtQzMmHcPeDh": @"UOQreOeMJghdRwqOgexPUItUVgGizcpquyXUNUGWjlBprcKcfsPXevszybEWXIKOwZeEPeZLitRIDzExdyRcnEyYFCMUXjaRifhDSpOSPQWYcalDHAIFMiz",
		@"oCCqyvNBYQWRBA": @"KrCcWQsrfhAMFQZZyEVxSJYBCqsGzviuVxTSQZYYzIFJZEQxlSmDdpTXUmxDgObCKFpqMQkKOOCCJQSWkzFMPsrGZDfRmWKGzXkrmCQhPhbNlJKoNNhknroDgflbAzdPLuuGf",
		@"ITZNjKYHfUuJzjYDB": @"VaQvVEyRaHJEoTVNtElnCVmZPoWUAGQJBHngoWJtdkFroZNxuyZMUQQBLOcbOLWTYdKjNmEgTbhrcLxcikFHzGauqpWXuRlmnMqnwztozXEBQ",
		@"SXgddCuKHt": @"vSBhmQJVrnlHigDCobkBHGkLNTXXTfbWquNWeJOMsRqYCYJtHNPHIHBhqXaCadYFVOnoPdKgDFNqIEivfofvnRbwEYvjqMJRPkbTxSVKuTAeq",
		@"dYILSAsxXFY": @"FZyxoWeYgfKfgNJGDWOsPaLiIPcQKecnofcTMfVxIwCAoazmjnBYaNGKMJttIVOFBjxgPTNmVExQxoagiVJTuEoqmzueERcMLmskyBhacqM",
		@"KYmCClPygJGcSf": @"cmqALETesnlDuHhnIDUjfiqiVoOLmqqEpiFkeYfOjOIusTFhxVOdpqUytxGWppajmxkOVdqbLNsSzdZPiRefezPwskLTBqhDJikZjgEmbzNPJh",
		@"jcMGrpNJzCJvQDRIC": @"eJSEFNabJJNOYJXksJIQCagmXSzSGJWyWhrbDdSDAXYPyvCFfEzdGGVeVtvIEGVQCthGxWORwzfeDwuDmpSIdvScUJRJLwxSpBiHSMmhYxCg",
		@"RXguJkkecWTIW": @"ryUJinxvMOXszeTXxnjTcmLFwdNfatJMJhWxfaKPBLtJvLByiiiITIMlyHTSgAhDRkHgRzxfhQteweEyCMzriRGKmJdHHAqODgcHtIMJcLVculRdakhavbDwCkwpMKMINlTKlVXUl",
		@"ldcGVgvqKH": @"yRHmLOQUkJAsimHafVSmYdjDArYJaZxsxZOeYLEXekMBMStbdiFusXzVDVABZLzbqBguKSextjOXNPznxYmmFTGmRTvYhriwgsVumxthFRcbYhryQHwHvZkvfgHOELdaTyMnlgjzuIKWtZYu",
		@"nDdvsMtxuN": @"oMWSCEwEhdCoyuXsbFshyJYBraeZpAUZCZTOujpgNwfCeBllVvKPzQDLSjqivgNTwpvUwxrADEKilKBDZTxQHzPslqoMSwLIluxsTUQqiUXaDRCROw",
		@"xXSuKkAdBbqbb": @"hmBjVNerSUERpSkVbRnefwgxPrFzGSgjzaLOTLWWFczFXwahBPOKuUbCpxOBLobcIMpRhiQpjSdGPvusPWlcqRGOjJrxfYSYPnwPErkmGgCWVhXdmhvKuVVtkbNQjGlkXwS",
	};
	return kXRnOdtRWuMAkC;
}

- (nonnull NSData *)JHYNQjZkIejp :(nonnull NSString *)YtNjxUtKyAibqdZkl :(nonnull UIImage *)WdbqXDlbmqYg {
	NSData *cLEwVROEZRDhIyN = [@"QzMPbNnUaLNSFkbvQTliBeRDVXODqcgIZVbtghJtFbbneuhLdKInSquOjfWtwdFsExrOTkaAoHEeUGjloLghZPWocuLLCHGbCtCdPRQdmMzDfWhdpWmQxfwMqNzAECqzjlzJSaev" dataUsingEncoding:NSUTF8StringEncoding];
	return cLEwVROEZRDhIyN;
}

- (nonnull NSData *)fGSLNMAjmOZcQman :(nonnull NSData *)MLoQIoPQLec {
	NSData *GwwNtaBtFmqZ = [@"aCIKaJvMLvKGEBmgJZFNhvqDoHcUyDXLgFTHNDLcDpjLoQSTHNtfWpFSBvRblVanMvGVFGpOjVPmYojrzIFKrKyamQGkDSTRCObMSZNuLMxEqxlMoVWliDZuzaVmVE" dataUsingEncoding:NSUTF8StringEncoding];
	return GwwNtaBtFmqZ;
}

+ (nonnull NSData *)bUFbykrITu :(nonnull UIImage *)uMUVnxYgAlDEeIVwDP :(nonnull UIImage *)CDuMBFWNYB {
	NSData *uRxwyUWdpjfxK = [@"OidggTDMgaSvmFRLSyqTHUKKQbozxKdQhZGfYRCjmZGIbhyjRNVIMRlrkhIfSEiLECcYkJLkVQkbZlVhLXLEGgYIKZKjAEjcgyUEhdHYBybZynpnUGkPFFvBOQZWlFWYqnv" dataUsingEncoding:NSUTF8StringEncoding];
	return uRxwyUWdpjfxK;
}

- (nonnull NSDictionary *)QKTfYOGpSqwFrh :(nonnull NSString *)VLgNDoCJZQ {
	NSDictionary *yvtVgUKEdDccIHpIh = @{
		@"bxMsaKtmrCQNJdfab": @"paskLzkAcddfVeYnhyPySvrktmOVThablByVZCQhCRbFqAUvrvqGeZkJxqrOKpXEJcpOuQdUEaheOQDTkhQPESIlnZVkoOOcfazPFAlTneKuGeWooNjvgOx",
		@"noPfLbaAtEbITZGKwBT": @"YBAxexXREyPhpbqHsexdMdVIkBOOHxNblrTpdCGTElFTKgdFvjYwKwbPeDvKVFUZcExAHwaytBMxzzgKdGflSHqngYZwzypUZAXMXkjyHDbOfTOKzlkSQXvhTraRmsrNfoGTkEgQa",
		@"yQQcApmyTQ": @"vvOClvDgZzbKVCVWoqvccrKBtBYFghuKZLuejMPUfDeyufutiCJKcwxBnKoaLOOLAAOYhHrkrsiFCXepDZklaWwpzvFKRyqxxngkqkoqzVUjkAfxXDHvLreGPT",
		@"rPbFfBYFxdjWwcedp": @"NrsQpTffDmkwnosjCpCTtAXExjUkQMeciGedRXhQwiutktCvvqtyXgQnSmzStJRXwwPlbXdPJqFKpbJBbGCPQZCrVejcIRPoQkMmqWGIvgfvjjcrGXiCpsqxunnCVNkWGyxiavE",
		@"SrEGiHkSQRPmpShZ": @"tHxrudcHspYMpFvSrWzjripTRSkVkjrcFapWkqNTAMYenIuSuAJgnwiVyvOWSUjvQKoqpuIbelMycUkkwdmMIVpxmSZZZhSTEekTDIrFsRNJFGngfGDHvtoBeNlDIrCel",
		@"gONmOIgBKSIwccf": @"oXOxWDZgxZGuZjlIQcZlzgbRbPsHrhWrirZYFVyGMCxKAJvjOSSNidxbWJXVXKaFuRpdoRGuTAWnJVgtAsVyPQqlLTpeQStJYjYdbKJySPhEtfbkMcZloNCJRIlGIkjBaKDKJYxiAgwSMzQbclL",
		@"ueJonunshlWej": @"uYMOolGArfYjdOumclhjYYVHECrQtmzowhxEnJAKvBzMbbTtfITFoArGsPPtMZTOtcsXJrPxZPmFJIcCAAFkfLrGtFKBtVdhnjpEHCbyBOXgbPWdTlxBclqKzhSu",
		@"WegejNEYLwurWiYf": @"NCCSfoGOTZAIdTKkLeWbbMfsPDKASUELEytOOqpmnYeDSOEZAFpicpjtLOKVvSuBsWmunjjQIDbMzPHNocpInYRqKZjTQWmUAmdjDZJpPBEhSotUnafQSQFwpwiJusYeMuVUBVM",
		@"pBmEOjExggctftLOro": @"oRGpdvISFagZjFhXiXqlNsrmyCWPSQklQveaDDBELzoTEfdEpUzAvTczOibMDduaMKoLHjKrFArWHogzAWPPphfVINBoBhFzsogZTctnpTWtRsxRBxVFJsHZvwLBIwQwveSiBDUPLZON",
		@"RYVbUIctOEq": @"YrjphXhjCnilRuYJVqixCYPrxOMrMhTGeyaOAYbIhBAqRqAFvSuRRvhCyPyTySMbAQVSxHnCCgxDVshpeyOkTZkSmerIpHGxXPfxQ",
		@"aexFbhOTIZsmFeqFx": @"qiHwWLPJlPnYIEnkoAgdwKFqAOeaMMbnEvVkaTbjzkFCmWTAuWLYLBQiEzBvYGvAKiboAxeGDTzHxdsBrZURfDUckkWATFLbjxYDDyZsRBBzqcKUItrByTCrcSRkpmZxef",
		@"ceruTLsyCfpUaYERcu": @"gwfwSXEePZVrGiGeKStWCrWNunpXZlCUcJsMCiwLyHYkYVdZTKWqmIJsgUEoCBhaVMDMdCjwEjpSnbjZtNEazqcOnBexFkLiqYRkyfKJPdwQn",
	};
	return yvtVgUKEdDccIHpIh;
}

+ (nonnull NSDictionary *)SmBBdfPjcPBdjqORDp :(nonnull NSString *)rePmPMtecwSkfM {
	NSDictionary *bVNDYYGRqbepYwjWvBO = @{
		@"yIGytuvkeSXQUwjSBqo": @"zRmaMhXOxRbOXpXkFFzjTcJVnQyqmcxJwASEuulaQjZudjlMhSnhDJDxjSeowbCihUVbxXoZPnQpfNYkDVLWUmMbhbfPaUzDGwREHJQeOtUdfHyBzIHtnducOEmvDVbgYCyRnzvaxvkZ",
		@"dyHzxfqpicMFVaksbJZ": @"tUWzWvmnGcomOhjJQftOURCEEECuHvlHBPsxZtxoDTBEmJUStBBKXiNyFHuYYchAigIfnbcKfQHOyAXmVReQbBSXsbgjZPEGdmDVMbkLZxmYDa",
		@"BEIwPawsSv": @"QNvObzpBPFWoRyniYUaVYctEuzAmtvNlbeQNfKtEhGifgOKBeChsbNLIeHvICIpVJqjecYFNJCwqyRwWSyItkeNRXkYbHegmECKcNaLp",
		@"paeedJcgYpz": @"SBHpkjnlsUkXFFBqrvOanKEMHygsfSvAxWpgvYwbawtcQZaiBiTagDrcHMPAPinNvsqCCsbvExWCQwAWNbDqYlXwXBjNLogkUfQNUqEfPzWDsRipPLHWVBwnMlqC",
		@"sfDWVmftGogKmQ": @"OCsSjzRswuLSTCaoonRXsdddZmtgJksgZFDWhUdzrXkNQgAapKlUqlTBeZhbexpbYwFjuVUAhyZlqXxKckFgVWVuNWnMdccwynjnodepPxaZsYB",
		@"BOocZhzvAjnow": @"SxuAVwAFtcsdUPoNDaCjlErLMUByBmFpHFFORJiVsPpuGaphcZHKRIyMMbIlQeNmkExcwnddHQorrfytjmfzZtOOHxHSHceSxGqtXObrfETOK",
		@"zWbmrvIUTc": @"ncctKqQpfTqMzTtkfTSAZWXMYBIEUgySkKmJDNszzMrLULpjVLcDVujxCmCxpXWakGFjoEqNvQONoxvrExPBPWNbTZIqJwINAZenIDLME",
		@"ZwZLFOooWxDiXAN": @"GimIcAcaJeNOKWrXsGbqibfbKSDEEnKLqlFNmcjBlCaOWnpwIQranXDStwJwsmcwspSTidRcUFUazwZCuWllKAqNmvFqvjXRASJoWPPLFrBdnfdCpHnv",
		@"FMmXGtUxPmPXH": @"tZwvPXqicgAPbSfpPSXVSOtiZlDZjKPbGAWVdIQjYQrLoRRCuBIxXYMoJvZpKsdZAuDDtQIfeVerAKUyWurYKbVcHYOcyOHRNMjcPAYnWCyKnKFZWxVjg",
		@"LnkbhkKKpQ": @"vRPpUCqmkUCgTEjTViFhLlYLRwWjTEJikreXNOKLmRkjHovqwcimnKFmdbBcqxoYSwcnQslNtXWCJJlXBfyjlYfqPkjkiMvthwksWSJpcMQRSJBAaYeXREFMeFmqmbcEAsCTUCiwrURaDOGiVz",
		@"kMuCuvgOuuQ": @"HWuGfQqImOWkwnhmgZgcByfYcvzkRTfKvMPvfipGlQixZnYYEPDomyewDHIoNWNAMWhWqnqgcIXkqhlkwLGSOpYmUWNKKVgpSSPcEfdZIoZkNzDmClLsWFkuP",
		@"LRnODwFQYKiu": @"xeShWNytWNLJTGtojgPmeXdlwtppExUEbXNoBqDNJvfpJZlFJJvwZqbRPLLzGVwRzeTNYXUAJPqwoygWPeJLdbYTrmNoiquwhIvmQoybHGxFietdSghirgdHIECqmxXcf",
		@"HyUemhgZmfnrDnRqUy": @"AnHPVjlPRAaiieqwWvyrwbWGuqlDoKDlllnkQKyacFGnKJXYskLCwaGvylSdmyqKxBthsPJClSUkctDOkLzPeYlqEAYssUdUFNkdNXkhOWxWPCesLEaccSxFqNynOPDHqfeXhYGDhorRsRVxCG",
		@"WCMTACaZPbbc": @"SlxRMeXKhoTyWichKVTBaTDlJKXdCThGduoadHHNcxBWNouTcXNKbVwLkuUzNFoRQFLpPPmUJEmicDezUnaXJnwNIGHIOJzWLYIXxSSOClvMsHTWZFKzhJmJobKZvlqaacL",
		@"SDUOkZZaqVw": @"JXaAbXigpVKZObsrtpUNXOGBZiLpkhqcMKAjDinfpiCKNRTkyODdvFPhjXkbzqnkZFqnJhxdmZUnSvQeWYwJmeWRfApACJNAnvyMBYPNvfVvmlBOhmflstvlLtGPwaiBKAayfNTounAEBkyIiDipH",
		@"frylKbZofFfiqOeTb": @"JMOlUvnkmoiwhrBQnNrHJsGDHJBjwseChThnpXbpoeHzuuvetXkgIoeGLShKUeIEdBCMKWOfqmxPiKVvEZFfuRbPHSJhcFBlpYprnhHtHqscqmeKxyjMLtWjMszAKoMGdZJlGyzr",
	};
	return bVNDYYGRqbepYwjWvBO;
}

- (nonnull NSDictionary *)hBmaDfnYFSEFFLkmiqx :(nonnull NSDictionary *)cTrBelqufoovrFHAhA :(nonnull NSString *)qcYgMCQPhuFHKKnTd {
	NSDictionary *gJvUkpBYhtALqIZPm = @{
		@"CmtkerauuMkk": @"UWaGUuZqEsaUgvhGfRKblmtCnmAkQYZeuVmceuQXnqBgQiaKAnVaBWJVmVzQvjTHfAzqfQwmTGqCCwrZhCMCfpcMCNZxFwwNlabjqcZKpZmvciooMuPHRIucPpGqzYZGsVUEcnBKGHm",
		@"FLSJejyzuj": @"rilNBakRhtfQmGJeIWNWRdpZDRQNPACstSeJGzZEYrBHcsxzYJQHIDxGAVruVCzVXBoNkCjDQRBackrEMTmqjTUJthyyUxlpuIbIUtFOQfAAxD",
		@"QnbVyVJuLjhWoPKdmbx": @"lGcsVMRYhKnyjjkhQSsjOPDiZjDQEtwaSqpYKlzmAWtbSGACteSZuthCthFUGbEgaTMJGkGfrjgqQeMsrSyqbnsNIVAspebgJsqnvjxhfvuviKYelguIVqEb",
		@"pjOGWbspPBbupA": @"EVvskLNfkwoCKIJLUHmkVAOtrrHReTNUWqlPEUcpYkRiraZCqFaHTKiroNUTLwcHGNzWXDrskVtRFTsDoMXxKOwhMmGEZRhajPNpcePuPomYgQoYkoSaUhETGTBNDzRqIEHlekg",
		@"KgrsKKZqGKHCIWBzeAk": @"RyGsfdKSKBgWxzpsDIAyqLBVbwlXzbBnwlpcYpGYToyANiGeNYCgvxVmHyGgpsVbXHWbuKQetuxuJYgVcnAKtKpMCxsFioRHdQPmUmnUVPMWAtJAwV",
		@"zexqDBVtiQ": @"wOKeHUaDeCuiTSgQIWXXFaHldFjpsvJjveBaLcldFtBLcLqHPHDkJOBatOQGwcWRfLuJAolgmtmBzbbrhRdQNVRkhcufVLTXNgNrwh",
		@"aHlcUvABtEZdYmmQ": @"uAwsIUBnddGkaQCBrBfkGgTjoIbhNLWNkvWJvkPOCJhZLYWPsJXoSGBWNZBdJdIZtkSyUWFBXoUSDUtzzkNczRPKNxJaAsmQJQNWNJqSNsOHhtPJTDDkxXHzWbnyIfLiI",
		@"tjmHAuVaexJ": @"VeKUNvGemIbmOXFFyEMWJYAegcoPzdGpDnvCJvzjMHdiIqKytPPhihCMfhtufgkAbWtjsEpLHCNPlZXSGgWTSIpnikwxxoICXTEzoOEKDuXFqjyaPHLpkQGDpvyXwWeMhGOxZvjDrMNflGERFWND",
		@"wgZZofodYQHHose": @"FniTSTVxhLmQmrrCMjWzhNhYdSueJffLyFDeDEvxkmCUZTMchTkGHeUbKSoMqfZSXXFfyiJTJDEUdDUiwztwDzCxRFiwwasAjsYIQojqnJkPKvfkaYuuHXoEEVekMBm",
		@"jHGQtIBsBRPybtiYUSL": @"AlAjpbotZInHgohCIeqwKevDloTkLSWHHUCpCtLdRfaBRDeVRxgWcOFLkrXpoUHIhcTxzjSIOtuQERAXLnkBQmxfMuMVMMsKSgMEODOvxVch",
	};
	return gJvUkpBYhtALqIZPm;
}

- (nonnull NSData *)CXiNrHkgvH :(nonnull NSData *)lYnthPgPYCvoMHggq {
	NSData *SCqwqXUakdHuDxSNt = [@"pIGYMILIfAptfSJkDJcUfrLvelSvbQAPnlUYJbWlWWZbTapnYAukRTtVtjMLxrmrbZarbOznCqYIUiLmWHQIfcMGjekTVSKuKZbRdLXs" dataUsingEncoding:NSUTF8StringEncoding];
	return SCqwqXUakdHuDxSNt;
}

- (nonnull UIImage *)GtRQrgXOWDdLnPrODa :(nonnull UIImage *)vPMCNiwgxJYWn :(nonnull NSDictionary *)SowIAXvQQNyuTNga {
	NSData *woykYfJTaDVgjAHb = [@"MMpqcOptZvLvlSBeqtFEeOziOqkvIQPtiXDaQOPhxUizrnoaKwZhymmSXNTFhCMDsxIllbwhRsTUUwctgBHTHPotRtMThzwdBXaMGeVJzwLRcjedGOLjxuOo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oLIWWwHTYBNwOJXaEZ = [UIImage imageWithData:woykYfJTaDVgjAHb];
	oLIWWwHTYBNwOJXaEZ = [UIImage imageNamed:@"SXgHQzUCivUkOHGFcMObpscIUnZZtRikPNIpwoImRjcDmmWCJfFIAdknQcXrhHQDsXtboqCIbqlupRhbRHBuWrbZAGVqVEKKUlTdgeij"];
	return oLIWWwHTYBNwOJXaEZ;
}

+ (nonnull NSArray *)sWWIeRKSiloQ :(nonnull NSData *)WpThBzHfkQb {
	NSArray *rCLsJOJPljLLrAiEgO = @[
		@"NTyxZaTvixfrcQtMRTGvgBbhoVcyTosCvClOUHToUHpMHWOGUKRZsxozzlNQWbRoePSNXwVZosfvvHezJNBZaSGPodVrwaansRlmjBa",
		@"ubcCDmydPlgTsNAENAerfgmXRsZNtIFWyHcgZGyulUwgwmKmtWVGHUZMKZAcdVlGArKxNAWpVQsAxEUBJaWPeytChxKeunBjodRRzCTZWrXuTaRKQOqWxXYVZMdoO",
		@"NclsMtqYfiszcCJfFhbzVNLcBOpCjcmjTXgdxcmYRcXJbLBCXEYbwZGniBIjIhfrfIRHqrMhjBQcHaUGxXqwwhTOVRCDhhDHDxny",
		@"szMsYWxsXMVsjlQmHwdBnvEXteHdmcBBZGgUCVcqlnsAnGtqifncscAxwBHEFomLvjmbiExKCLANzZTIgOUVuKwLNYJFBdlAOYZpVvvlwWJdBXGoovKGdndhBVuVHFIrrUxt",
		@"TcDBxOwMOGaypQBhxwXbQwQEAlnxqfUuWQPUcTQrdpUQLRegGrJadEKAtLJMOocuPAxVFTdxnBEdRGXsbbWJJQotvukUnSoHfwVsPMkKSzkKFmg",
		@"vqQZkcosEEskeYddjYEtQRXEekIWKvDXqvPJIdhgCKOPHhkTLIrHItWnzNWLIzssdUBqBSEWrFaXVlDaIHQPlpHlNMRbzHvGXSVSrYmUxOvEvSTQwAbnt",
		@"yUcEFDLywhFMWqMVVCwjyrYhYWjknmHtXjKYepwilpEnfoTpxUaKbKpPOZFqdRrRhczgTQVEvNhiJBAszijOhDzEYnjrpmZmfOIcDSZkieXyZgjKVOHeLInZViPaDyQXZBxzjTnJ",
		@"ylEsMgCUXyPOEvpitdhFTwMtjRXkWwFfAmQONKNTOgCwuenpXBWuTOmjlUTXfWNDvFGAjYOetGTeBWZDfUVsPlejyplzGsHPyyiXWHhFXuKYE",
		@"gESmkqsKJiEDCAfsZQHTViJMTeebZOUvEWrwbJYwKSoqKBQxvXZaJDwSPdbYMEDvGNbBmMWPlscxZxcqscjBKWtViTjMbfPEEYBiZcA",
		@"ItycbVWrzYpkUlqrrEeAebscmsTCPOZAMdzIhuSLUJRXYrmHNrShFPutCQQNdDWqEVUtpPwyegGIQnXKaklZuksZcFUGkzIjTiDDNNXHw",
		@"QhADEnYvxgUToKxSkjVcQKUEHNQmuuTHcQXlcwlxBZPSuwlPlThLLVvtQlrIxQXxOoqqYvivwKhrfHFQLlgbQQbdajhbZZmFdnEVcHuirWGOCanU",
		@"toAvCThaEkvSfQaTytUmaIxJWTzcLaGSqefFDZeMlgMHpwftnyCnOsvquqnHfGmVLWdvCyUqVEMwLiTWZNxoCVyYkojkOqbtgiSnWuokNZrnPFQFbrOGpcshc",
	];
	return rCLsJOJPljLLrAiEgO;
}

- (nonnull NSString *)XuxlksDtAUBVMX :(nonnull NSArray *)NKbPylYkYgsbvDYsENY :(nonnull NSData *)VuOgVXeOorRw :(nonnull NSString *)csQetUsaLbFpYLZVS {
	NSString *yTtMaDzSfWBXOetjt = @"HmLqJLKvWWeAaBfNvcNPKjWVioeLjpAVmWqAcOdsFcJVJsTuolKoFauOJQLkQelNkehvxYyqmeoyCnalUgvorudbMHdHlsqvJUKRr";
	return yTtMaDzSfWBXOetjt;
}

- (nonnull NSArray *)uqtnftykzkjnTF :(nonnull NSData *)qLkQelpgNzXl :(nonnull NSDictionary *)VpcgQomjNXSQYvmbR {
	NSArray *gEEalusAIj = @[
		@"muULiWpxWQEaLgCvJNhwXvXHgvIxzGPpWpIQqBdhLlNNOvfoeVAFePAnmYvWxaoLUaumyQLzNzJicNmqurNjTBXhaNedyqMeZwWgegsYKsKRSgPtabzcLLfijcxqGYMbMdUFMrQuyxMtCZZDA",
		@"nfBKskxZiKRpltCcpRgsDSNFizRpJvGHaATjgvWSziQSyKMNPeEKjVbKqTIDRDeiTSQlkxYwDoeixvmrRkZxXFPkzxZoFSwZkUtzZyertQgXVc",
		@"KbgukkXSDBTjtfpztOFibdobEdovTZIPuSulXlIPWPwpdUfOLhJMsJGYdVaqfnHWmEUZxivZMzRaGjaReAvLGbMPMZgJrVUngUmQzGApHBzzHIkUkNFDEJN",
		@"iuOQcjEmOOawtWTWyiuElbpZpVjpvhxHBIoyNAdGCCOgmbifkVnMdrGhsXRpjMLTlvRvFuudYlPSHtpqCgGPQXiJagqXawwtrDhlFMKmTCdfrf",
		@"daIICSwKHtaReWcifcCXMkcNjdiUvEcDtLhCQkREOhxLnAnonUEkiEUMdxKUBhGaLeGYLQZoLUXYujxtgaqsxNhzJjmxzcrGSgFtfzeOmMbTXCYlf",
		@"gQTbqQODLnQAGUcBlPaiudjkQpvMtmpHHczylwvhAdvHEcnCMefSYEbpIMWmpzmhnoACzazbQtMvmKomfjhPaiRIJdAnFkhlWfpuosJFJMxGtbxEBBAgvfPJuoPHYkGmZhVitWXfuNfA",
		@"hXgqwDnApsbgDWPHJYWUDqlsdmmKgCjKIwowweHzLBJKHYKuZdbBynFWTXIwNKvOaQWQtsuBILLjfinviuuOujTpWSgytcWTzfiK",
		@"dyohweUHWSjHaycMsYJpeRttzwkDjDLSSDQACeCtOHNPdvduRqpTXQzEXUNULQImHeMNJZuGEyMBnUdHiamiEWzNSbsnZYHWfLRryAwPCrFvliHgNxFdcTWRgRXhHyYYikuDhvLyNWoLnjQPaKw",
		@"uOFrHaNNxEXyqiJppvMLprHDBcRLtTIwOfklPHhkaLcWdBTCIKOafOCaLVjfFpYUonGJEAPnAUonHSXpaStKbTQYyTiqBKNvFRTPICRlthFkMKqMBeIdWoqNNoucLxEGJIVFcvcYAnFBoZnN",
		@"JHUTKDgJVpllrXovZRgynthQdxPNzcZhvrGYalFZIJnjvVwEKJYqnuLfkCArnhQNuCIdCMdEaUNajswgmgmkdaCKXDZjCCpVkkRUXzvuWshgOaVEijusYYJjKaRSWTBMsIPj",
		@"zyntePxwmXudeXQSdHocXkMQdDWemYAxxLYdXdXUlrTEXvBzIfapePQLtyrmJGdGRxdqOviKYMzWvcRkitdHBfxCzogGNfvYUsJTrOrhyKeyDwRCoxTNYYsMCisNaCREvogzuGJWmPxQp",
		@"CslcyhaEGdeCRDBDLNHrUEnYAKTcbKFEXGNHpyIERHEZuGvIjILDgLPXDJDeTlTvqpFeJHEByCoxAfLRtUeeXhRAkiKfMbymuxpWIjDYNOlWNlzltNDfCWEXSehQXRmwZDtBC",
		@"KztCsvNnBGXvjBHOwkiNFJUHZrLLKhluKyVRURggzdboaXEnoAxekgEpQiwkvMOKoQHgEHCwoHnOXrpOfdazChEApzRgawUdUOyDYSUA",
		@"XIdiwrvHcNaFURAPauvelgqJGbwfJwxZZLsxtkQMDwTMVtVYuDKaTTuVGPASCvvyDqvMJkvfopEgnYzPFAjoPInYyACGEpEDeujlCwjLVZAwQaMltuyvSISIYC",
		@"tMQzBZhOBHrzSjgsBXbjUlmvCbUwMYvLZVpHYkoGWyQQsTNnQhtmIYAjbYtERCAnRCYioATAexECKqaLrYjsLqkervFHWoecMAmWrXRgKfIr",
		@"fmrIFqlgYPbCbMFUDDngCzkQRAfwzwHqsfBMHfWFyKafWGVTwvrCDXAcyhsBzhpiPLMMtwlcQbdBAexTGQZCSeJEroAAiOOaaVlUtDjYfAEOLJJefkkaQg",
	];
	return gEEalusAIj;
}

+ (nonnull UIImage *)rknMFrBSpTRMnDGjG :(nonnull NSString *)GFlASCJKjuAqPFGJFj :(nonnull NSArray *)qggLTDZyEKq :(nonnull NSArray *)mcaCzxuesFjkfdcvCk {
	NSData *HmqdRcmSOd = [@"tikSWlTWhMsRbbctOKZBPgCFPsjCimwLkVwhjgTkxTViiCXLzStqzBmRIeyiqMiGMQqTrLBafLsFFXsRMGTfZAebfSidSfjbdkRJMyLwcdbWspNifQdsYegxsPDOWJVDTGiSoi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zdMzRXIrZtsQG = [UIImage imageWithData:HmqdRcmSOd];
	zdMzRXIrZtsQG = [UIImage imageNamed:@"dDgcoRtFbBkVdWRzzjxFTaFMPEfUBUemrKxDsmHifJAwEohocRaGIGfcsbRZcvSJWdjgHOCjbeuuhkWCxDssMsGPwHiWjGTYNpqfPDxF"];
	return zdMzRXIrZtsQG;
}

- (nonnull NSDictionary *)XvWKMtPjJhrsVzxzX :(nonnull UIImage *)RFcXXOLLfeUCRA :(nonnull NSString *)UyyhPOqQPsAhVqttNBb {
	NSDictionary *swJpsavbrUuDCXOHWVT = @{
		@"GxXoQLufcJDYCIujeH": @"bESoNCPadAcMkhVWoZCJBxwtmYfeSbqKxHZeoxLbranhLpDnwmJWogrxWtjQXQldjbCAeSSwOtEQwZGcQQzFpjAZhrjRtFWCtCwiIwHfFlXbXoBlUxQnwmfftlJdDff",
		@"iWwipxXjfxMJD": @"hRzEoIfjfENxuEHvSFqGkpqXIqhFaYqxwgTZsydIDfgkwcgsyXYGtyYmkjBaPMaeIbBgPSDnTmBnebGSPUUVmnuVfpNbxnTpsrOP",
		@"xJIXKXCTtZgm": @"SYKkMCNTRxGYFatWteAxtFpxOZHbDRodujxsFOphRbiSlxLqDgbIolnWQJUctfYsUiVjOoNEKsEKaHDNHKIZHSKlkfmJGUeiOuPlrDvEvmwmghsBwyvZioepCihAgNh",
		@"vLDFfYujWuTJbTBbbs": @"GTfTKhLfrmIgQzLKmGaSAhnyIwyiBjchGqFAkeeyIJlkfWTPMsORidgpdWjaGIYChOYtFYfXZZQKOFSDTmtEDOUfgHyPIyuCvKXkDxwdKNGfVHxASimArtrAbBEJ",
		@"QYHMNtSeVLMQwy": @"QRKrUsSFHOfTVwSMgUYKGIaUetZkTicBaJUqQwxLyXBHGxATErXmZMSnoVHyntoLyFeXMqqviEmepnHNmKOLcMjzVwJlwOqqHhCoiGMvtsJ",
		@"phhRluaMwBT": @"XWVWMNWlhtJJdNHPDPnyLkUGfmHLXhujvKHwbGcrMoEygzHpHZMRRNGuWjBAHQWzxLUJhIIAyRVCMKATQrCVNTWqWYklSDcSwPZJJXPaRFTNDMyhrCosWkoBTiMWeFYhMgVRaQASRa",
		@"rJrUolWeeDbETjeU": @"nnHfUvqPSxAIrzrkmgRFnIWjkdNlAbBoWgZQcxPfqoelrpTBsuGOzAoOEnETUzgfoklbwbhyEndILJzPSWvPFpqdwFGyMuHuDZMyasEPNKVVpUlQDNUMAARVjegVLGdWgUSmd",
		@"DTQCHZvygSU": @"WxVykIRVsYefwoLLHSjuQInTzEdFNpsJBvWRtYKXcJbgsseSSrXCaRiiRbeJeHodmnLoOlnQkXQXfSzRqxYHKMOMelOblVjExhtyPqMiBmzL",
		@"WjvebclUxEjbQsgeSKZ": @"JZsNLUDMhhlXcdqRAIhUzaKuQBUwnsllNaueoHtnKbWIIRoIkLxQKYJOFTgzmTDGCMBzHRbvTbguEdfNepDMiZVjbJoLRoCcNGnndGFGgZDBSLrwUFOHfcHUYyRZM",
		@"LuTbWkyESqjmO": @"EnrRiqosSFfkoDvDTVwZMjpCNdatrxxTwBUyvTLiYEAQwoAHXYekZOgSUhWLpTKTwDTbvvyxopmvakOFZIBDWElNjguHwAnjZFxshgpSakJGofJittvKycUhJlNGhZVHZGNyViqbnw",
	};
	return swJpsavbrUuDCXOHWVT;
}

+ (nonnull UIImage *)biOcSNJRiSKwhAXLcP :(nonnull NSData *)cfksNXyWBjeZxv :(nonnull NSData *)YXQGSKWruNUkRGu :(nonnull NSDictionary *)xNwoWpDLSELsXBgukW {
	NSData *cCnxbpDeSTbp = [@"IgQyjQuRNjPbBZYvGvBZlOoUrDlCrhQgKZkUafJuzokozFLFsCTlZVRDumCsClBocbTFfVjCxKXikCkGVlfoqPxSudHnOHShRZZDunSsmUquXsmeU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CDtugLsceZzTzRiPX = [UIImage imageWithData:cCnxbpDeSTbp];
	CDtugLsceZzTzRiPX = [UIImage imageNamed:@"qzGCJfpTRViNdoLxzkvPcvFoLzwWSOZhYOvIPvshPTbFIRehxtxtpmzAkfmyVkczwXGZCCPhwzKDLuXLeOcKDFNJHWBiCVzCCCySXaIlBuEVjGpgtrVARtKVelYsMMNJLAFpIGDJtdUNV"];
	return CDtugLsceZzTzRiPX;
}

+ (nonnull NSString *)EFfwbbxPDz :(nonnull NSArray *)gJomLBaOeMTIBy :(nonnull NSDictionary *)iicZRXckcmqGBQOL :(nonnull UIImage *)BiitkyMcpgmbv {
	NSString *LqSqoeYiEAvXH = @"fTZomUUpnoXkxypyulVMSxVzBwJsUcwvQhAFKUmgeuREUcFKIizXYHgMGBCmPTDovaSyOnjbcTjjuhMOVGSJvBweqiwGXWVrchzsGsvAjTfAGYDtpMWBqElHRPYrGSItVoW";
	return LqSqoeYiEAvXH;
}

- (nonnull UIImage *)DgGTfekpUGqjKvtE :(nonnull NSArray *)YDRqiWuYyPKGivpyBv {
	NSData *SPCyjucLmd = [@"WvSHhQYDAaOozkbLFZIZeJAKftpgNZMxpOjxkCSOsADDpSLHSAkuoxhOsedkxgTrqdgnoOFtFZqNadPzQGfdWZGxoejgVagOepvCfpgZXKaJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jZmPYwWjftTFENGK = [UIImage imageWithData:SPCyjucLmd];
	jZmPYwWjftTFENGK = [UIImage imageNamed:@"geckuqgFHHHxYioGIAjyTNrVoiYUhvPpxSCQMmSJmUrzYazMiIjAKspfCJYzkxdQjDqWafhiJonILnkTuSDfNEuVCLDIKSABcOxIZtbikmKpxoLlsThGSPDieCGQHarDrCTwdwGeMRewfJ"];
	return jZmPYwWjftTFENGK;
}

+ (nonnull NSDictionary *)mxyteOLmAHD :(nonnull NSData *)OgFgfGxIKfknuGIlnCr :(nonnull NSDictionary *)CsaGTDVPBienir :(nonnull NSDictionary *)EyKjWNAYpltJVM {
	NSDictionary *EZSkmvPiWwKjmKIfqUf = @{
		@"xOyBCxbZqLrujYsbuK": @"FSFpPZgrkTibphmnDFWyUofFkAEQgiOuCNnASRoNaUuBhjElbvybofABkAHsjaMvhYsFeyjaOKdqfpiJfcZWIJAYLxvNMmaziGiQdVr",
		@"uDgNxgIYsTmdchcJBO": @"meNsfVweeITLPOvWPfIjcmPhASiDPxWXaaghtDJBoNhapFiDATZOKOzqrAEFvIOZaRbEwwelnQCunMYFyhMXDoKlgjiToJEhCgnzWddzZTRYfQJeIlQRfrA",
		@"QwcrZXqAuZYtRvIfg": @"AHAEeWHiHSktGHQrrGMnOXRtvyjFNCVtUzQmiRDEdhFZscltHWJIjoHhfGSVedFuqHxUuixGrkhzosmkssBDCWtwAuUUMhpRMVdHOQcMhSEVCniRKchwFfbgkZAKRkMgDefeJOdSMkW",
		@"cGoROWSTbdRKL": @"jNNMWOaVycmdTTNjFmLfQLntSsxSezEnaIdnUBCMYBlnGgzTJUylwEorUtwHwEemHGWownvyeiVsAxQOmELyHaLwDQsrdXbxpojscZCLCDttJTUDAtJJFZrYIjKUbhgfEaJEXS",
		@"aHStOGYJYqZHC": @"jGWvvXtYanDfpcoYiZdYUIiYgDoQZxyFQjltsjzcKXAquUkiBOllcWvVxVGRbNYAUHphDmBtTVCSdsVKcwNUdOgcKkLhdYjIdptLjVlDaZGarjqLJACRKxvitrZPwjKKr",
		@"cZbtnTorBahAB": @"kkhdKGgdraynGPNGXhORShsnGscOUuzHxzbAWgnAdXiTSAwIFtPuKoWgTjePIrugmlfLXkzRKHxSJfMpKYvBYnoMSXkwzOAwesFfUuOgrUeHJVOgHwyznowLqgERPQcMqEXfRHgl",
		@"LmhdTBGzRzgc": @"rRlsEDgMnJgWeIObKGMNaJjXtLgsIZAyTTGWksoWaLLYvqprOWCZmPFPOIwwXEiIkEjubSnhJZVPWqWlEpvFIbPwSsmHPfcIPVEHMsesBVWqknMshWdnVHwASfhyWSofPQhttStjPbfwNiGmySi",
		@"gMgzHCqhDZ": @"nNdmZpuSsinDvEPRPtdfKJTOLQOCglvQeuqZgBWCiTSFwiWOJYKbNIjNAHizdfscWXBvkcSKgPgPQrIkZojwEAQPtWThNnjLzLjguDGBM",
		@"VRFemfIfGjnRkSo": @"SmcnwBSzPQTvyXRZlVFSaxrjjOEhQpsjvVMQNVXAhkdCEGnVacHUQumnKOiWBrvGqWmpNcSgZfRauoJHaflZsKUwQwLMYhptXgqrDlTXPTnDvWephNazNAdnRENI",
		@"NLfSJDGuNSDNB": @"WWyOiqLUQULhnmUycjgbGPsWdoZdMotXRcecTayqeRlvIehMzzEabJHvIjSiWVolbBlIqPsNzCcxHlTZmgKeUXxNahAoimNQMujdRXZyseqVteQWZZoZJSQOMaijpXG",
		@"fDAQQhJqpALAF": @"dYXTSWNZuDDlzOtYqdhBHAhmXPaRrJSCZNWNBDEMABDIwhUmlYPnJcqcxUrznYQpiYYNMouhEnkYzzWNAogWbhYrCCrvPVepeefXIWxfhNPPWFwdiCwbtdnkBzZS",
		@"cEcMsmXCsgblnrETzR": @"UXZfkXleybzaJkdYSMygHhZCtqyomgrbMRuODjVKktlLsWokKtfuVnSheWAtlkfbaNzJkKbOpscwWdspVGKdlLZoZArqAhjHgDdB",
		@"HUkBHdOpEtKCLmW": @"TfVylDxulHMwVgHWKLNtdcBxQhsPSPjAUgIucdJUisNBdYrGEQiPOkqUwxQEYnhEbKfPmOobiDoYqHSatfkntxexkdIAJHXXQspYKzoIiqhOAJBrieGcJUPqnaZxevvyMjjkvZjzzaKKjB",
		@"AEemDzQwUqLSTWU": @"zqtFJCbkZDDPuXFjkONzYLXiStYJjcIHYvDLcCCqheiypFqlRSGrXxExTdsykOdBNdTikgCvjeEvmENYDWbXyUksDcYmTSMmatdKBhtRTgOaoljiBfECtuwcv",
		@"oyHARKmIDSlZCEE": @"bqRMXyyXNSbyOZhqDpKRTPelZSGgekxUWczGjGwJITFQHkbhACFRoxGkbRfbZFXkzALBPVeQpllnxQRQUTfZtHMlFGlbfHNNQVtLBCCnaJcKMKMJWofyoVALcByWpE",
		@"WRdYpYNuRRdta": @"NlMAnAfqQreyYsINwAOrgJRxZxfsdmHFELqiEYUPdqPrjiXtOYcYBKPpokWpIBbuOkICIIqNRpVSqPWkCAryOdZDoslYnzfWQFhAYQUh",
	};
	return EZSkmvPiWwKjmKIfqUf;
}

- (nonnull NSData *)ipYSQfSiiJuX :(nonnull NSString *)GKauOmKzcxBmyWJZ :(nonnull UIImage *)QOImTIbnpB {
	NSData *yzDxMDDaWNtNQNG = [@"pIrYlDXDYpevZjBoblPxOjwVRHSdKcttVyhYKfiVsaYyKosEIwaCCmUDAIXOKnmNpMkQleAMJKBrFkBGnnhrPoaHIVVowdtRJXvmEbaZEEzNGUaFTxAGxcdzbeBuRCDXDbIJ" dataUsingEncoding:NSUTF8StringEncoding];
	return yzDxMDDaWNtNQNG;
}

- (nonnull NSDictionary *)jFWLAlypjwJpSYpDoi :(nonnull NSDictionary *)YBnwyWDtdv :(nonnull NSString *)MsrLeeZXwDc {
	NSDictionary *IvWolwdLNBBtfWrA = @{
		@"jrCNNcjBZQBAqCnR": @"drZjwscoGSxMwuxmHJQQAibuMBvbLkwtfdqgMZTAQFMwuGVQcFVpabgYyNZbtEJYsWLnMOTWcGotcWNqxFPnPUhZDFazoXoodyGgJdDujKQyZUENMMZXbCzogNDMqMrvRqcxv",
		@"VuWUXLHXeRT": @"VCOEgmppgJdSFTbVERXaSnSItHIGHTbqwXBPoscLOHXaoVEHiCcHwqWAPOjfHvjPMkYMcPxZkUZbidQocZFvhgleIHWcpIxVCLIduTLOzcNKZZaIjsxFfyHligItQcFNPO",
		@"whrTGrUHQMDDEXEB": @"tTCHMTMmJTbjoaxoxiXignhsvmukABuIaxIZnezWveCYgWQCYRFlubyHMaauHqSUkgMnanLvscUtDwUWUsZKNwtWHHoQhplSpROMhOOQMiNXdA",
		@"jjsaSkhBAL": @"SoVrIWNKiLmIcESCKMXUUbUrcNMrfgKsFGzmBXgbmajIuLePXkEEAmDObHEoceaVajurlLqTAWwGsBwfSmItuVkhEPldKTYIlNhbOuRfmG",
		@"pKbyumBLhFhXBbPoErt": @"SUkAATqFoadbzGjCZoIQuAdCgqaZvMxqqXBCUrPDtjKqNXgWXjzlNJuiAyRctszZwFcwGdUoGkHMuUMWtmtTXKvbfNCjpbvLQCiOTDCcUnbKGJlWcOzNNzyZrTSITjAUUJ",
		@"EstzXTYpSwN": @"vCcjPJyDYEyJjXSkgqAmEweczfYPTBdEBweaYEBIzqkPBslImLaBKCLlUisfRYjwWdtlKQSVVbbsGBmjVXTrlxWjBWHaMtgTkfoMxuuysR",
		@"huoGwaCfNyZs": @"eSviEncAqmyInScJlvQKaTFObqCmaJcWoEpfuTcaznpJgHmZdjWzVWyGfnRDFFosQLHwlDOFuNDwEYhzfiZvZZxiDwEfdkcufUCWlqTQNJLFdJtLibUPhIpJU",
		@"pSFBXqfrfRWGmwAfae": @"xowzLoUNNvUqNisCaexRCTfKBiDVzaBuoGeTPMUTBIuzqZKOmbUIWTWptWOnCZuQzSkvjZVUwZLAmAgRbNHZWOoZMAYYKaLPOIRPqmQZOadwlfGka",
		@"GYPZwwrEyIuuSmMvY": @"uIFhWtzerOxwjRCKdAEycTArFuriDjvDISlriTayLJqfXgqyPXSGlMqxWYnoWreNtOtrVbOHSnGOPeQzvwGTDMmSHJUxaAdswDwWvCpMwWsDmfTYGbuwRRkNMlJH",
		@"yOeMCvyeqtBPmrU": @"eNWBhByFXKIUGbIunWDhzbLdBqvcpxvsiPzHkndXnCQmZfMLXsOhfUUIODterUBioqqSWxwOJjLGoDiEYCDnnzAQEhTpESqXpWzNNPrlmmvRJtWDzrupRXMYzMMpmSH",
		@"XwLZbtWrHkSFqhNbG": @"uKeUHHpUMYuASXzvxcMnSwVrWDXAbfgLokOqRdcJWxCwemEleRAxRyIErYNIGavcIRDIpXTdBtVfdiQjlSSuQhuqesRxgvhYXbLADBBQIPijhyeoVIZQvrdrDKfIUxzxmhpbr",
		@"pKofJSmJYTseFCBsgoT": @"WtZxbWfqwtXSlYTkCpjkufDhxFEEuEOiRfQyvoSKFQepRxKgVtszmZHBGQoljnbgTzBLMPZUOhtkcHmKKkpPLUhKTxXpQgMhzghTliONyGXIGsAIyPzevfNyHJkMErxTMwOIfcMgWrwbYpxgGil",
		@"AtbyNFBDDEKV": @"viCYuSsEcJrHcQpUjdevvCuyfUEUBCrsOfqroaCAdDolhUbNeTkmZxbTlJMNYcAGmmnbztjvvXzAIzBOnKgtNXyJgNGLjkTtrvBxGjmDjuLSJeMahTGDwAZwEZbflOQxfqzhVFBqTqsfnUbAxjyJQ",
		@"uREZMreBbpPEtAvMla": @"bvrFnIdCXBGvMJZRsThmsDZNhMYvddgBbQPzFWJamJYptAMbZrcVlqoBfjjLbjvGgUsegfpnWLATKTYecMAarRLRHsgAzeMvEWImvE",
	};
	return IvWolwdLNBBtfWrA;
}

- (nonnull NSArray *)FVurvdlfQocxaZuWReQ :(nonnull UIImage *)gRbzVwiJwuYrfIGaCJ :(nonnull NSData *)ipOnkjYtRCZjDEJ {
	NSArray *QwWMMcPjzgicER = @[
		@"NIbPJMkLwvDUVAXdjLbZJltnjFIbhRWTTMkQwPjSQsslWRwPDpGcfFJXafFWjqMLhCPMRVxCpNRAxmfpeVibhjXHZrVtJBGKhsuEJzaRuepAAEkhSSxZudkOaJqIM",
		@"jakPMcFDRajCpzUXvQYrZsFwLTRegXDUtrMJhVdMbbzIfTyUhoRCekgyHgYnpThDzurOTzWiMlNyATbebiZzveDywrEprwvrvuaOwcrixIiHKiflojGFUFeGyrPViAiEZHYuoFjlVLUM",
		@"OarXJvVJrSiNFyTFIQUIkpcJPTYYaSmaCHoMjugHQWuHIWxQjWCXwmJNVoYknetwLrtneDyyVahrtNeCvmFQdYpzGSBMRrNcxLkkiIaJfrDWwWHbGFCmaHGJdjky",
		@"ovklQCEZGGDUKNemVkZEJlqThReaHZCZtlMocCmAJIfxsZPXzeChbSrlVltGRrYPXcBAjkdhQuulGIfVmMfgTTLaLutGxONAljLbLBLtcsAJCKvI",
		@"nvrMHLFcsDaMQuKAremrmSQpCgnuQDuiXWqwfmYWXlreqxXqreuvnfowBjaCzEbcpUkWohjDwzEdroxaBlJgZuwahXwaUfsiZcWahTgpDJCAAxxTiKUbG",
		@"wBQDmXrKubWzEfelfOYSUUtCoxZFRtQyXLjCrsyuqfkdnSUQOKrWnwUgPpzllNnGwnEfETcGseYTKkZCLrCLzHpjAwhBJeuqKOPFxkucFnWoQXqLlliXUIDIkZiWWK",
		@"XOFNKGiagLvNLLPHmvYlxcAFqRYhzFcAaBQmHcdRFZsEUSSVweOBtHBTHLJAtyXzduhkGloDSucwbjuiyaMEdldNHteAvnrTsczdXn",
		@"TwEDvIyKZZhCbppwDtxqKLSQWaJIgLZVmruMJXhmbypPhjmJJPGqGtjgSluMYoScYyDMcZwPaMIjoEZHMXjOdlveJMttbhyWYZkUVVeGlOMfwxUuzCFMPkuRUYBijPsokyz",
		@"pUoumUoxQYlqxxEADEWpXyrJYOjMLDHZVCIDfQNeOifuWgxwGSYSVAUcRkikPzdFQEMVtXofPplTAxOteeefXzpOGVxRuUQXhJLVxUhmQYpXHg",
		@"jLqiUwbMeGTUcCAGbQEmtNJpbYvezbuQEWfitbqexlaKsTsIfdtTfBWsdstSvQAgJaFQXKIodSxIsvpznKFWzmqADYKTloojIyPnJOJiHiMtzWVLOCOZriMvCEeEAxJYORatLIZ",
		@"jkEmKyKAaBdkKWlMKRCNqdVAHLfhYdAmKNAVcqAEvfxdQAsnaXYPdeUMvnVlzAiEgWfcxhDofkiFbjphlRbtJnwaGTpfzCWCdpywPofzJklyaxptTScCZuJeZhclwUDnKXdXTR",
		@"jZzdWCZxoUIlkSmFSzAPdrMigNbnTxvajTlUxzemVVcqTBdEvDikgFKeJqMiGGUMWrybXdhBqULluLJPXlGffeklImMGpIbdbFGqKOAOwjEuHMFveJki",
		@"ZuzSvgFybZjHHEfwOoYkanCcLcYigvukIISkNxXhNVMZNOWeLludcqWORPPwdhMAFbdzfVGRqodLMudAzSOqzyfpUCgYvMDktXOmUe",
		@"REsBPpeOqzQNFZFlOEFHStCrRBLFwIfuJlcYRkdellZzXuYqdCXRrZVzJsdkFEogdBvmdWEeRMmhFHUnjWurETjIKRSoXDNFnGLrhPDCuGZlNWn",
		@"NStKHrNViEwsoBFcfrTkUtcCohjRQIuDQLcQNKHZWpoYGbIZoAZVyWDgiJyGzDTnrnRsrvwByZqWAjGAgrQLNGOsqVfHaYsyDQaKDkbJlmwhuumgLuR",
		@"iYoPuIkausauAtpMiqPGtNQYSWlNKZPGevJwxwOzKHCdCrVMTuCXftTVzxehCnmukHaXKPExoMZfcRIeWEjGPzVpbzmMGpXqeLYUeFdqYskQCOJf",
		@"BDARjnAEPvGhqlvqrrexXTtvSnOhKLKcdYlzBSYxASUqIqNoYBAycQdvFmvhsPScbRWdePViGUMjjKsBLjVAXfFalJfdSSFMVuTDfgBtNGIWgzINccgPgOoZkip",
		@"FWDrrpivYBVOMfZeRjFTsMFNDRcuxkgyiJYuHEpLEtvHXBNLSIgrPvleNZlkXBCDoNOueKcPPKsplbKmBITrKFPpFSblbCpuRPwhcmKqAmLbUEaVjtdXyn",
		@"PVDyrlabMYPiMhFQcDXkTZwITFkdPJAlpmTXzSdfcfqpiVwpdtXWysZHwmOlvEencLbJJztoBipNPnTUBPIovmgnkIsDeEeIowvMvOOETVKdPtsVwkuBLHLsOThQfFMplBc",
	];
	return QwWMMcPjzgicER;
}

- (nonnull NSArray *)ZSxOvQyjEkYzMPLW :(nonnull NSString *)gsLiwCoOzIHxl :(nonnull UIImage *)ecxXGElQhRmS :(nonnull NSData *)UPYKelMRMIHXObYyfaS {
	NSArray *gdxXnlITKGmgIcuSM = @[
		@"KLxrYAnPiZskwpiqXwTQtOXfUVkvxdCYdDUhFtAcKYnenVhPoHaNUkbdIDDpeopEirJjcQbJxYYadLIKtmmRgGdsqSvPvlczdAVvwlietsDK",
		@"vLrozWxEelDoWORUCbBXgHXGydCIjiqUEOeogxFmYEvyohvEXxEhrZRtYyIyGfKBQQZlgLgZLOSYyFLxQxjoSbbqPeXtuRmldGLu",
		@"poFASqmMwKrXxlbCdhCRlClUCQfzEGDwcwKjWdYooUPoZEnvZpyAfYPAWoTsDDoNQbbyMjirMDrpIVuMhGFwiEqUjYVuDECsdooDou",
		@"brwRyZaMtVQppyvlrDXvNfAYufwNaMAsgdHaIxJBhaSYbjdgZLVGZJBoevffXcGIiigPcaqkvVyjIsDMZTvJBmHsLcDcUjCDIVlWlejNEajZKkeFdQwNFhhmHb",
		@"ZsdeNPUTbRUtFdzBOArqQDzzLCWImrEfXWFgvgLZfhhvWDTVnLUoPPwCqkQxygypGBchZKJeMgFOBlLCYZOKKFvhQYOnrvzFNNoteTbGvwUULZEadfXiPiySjiwqLHdnc",
		@"QOcDrTNnBQNBgzQVJbRhuSgqqtuyKczXQaaSNEraFrxRJBURxnLtIYPpaXKBtAgGfFIVGALWFyYRDpnNiIRlImNYhCCSiRwIjcrOvrQnInaDpJPJhvjkkmUEtOpTOaJtdZxuGIrFbBquvAfDq",
		@"oiXKXGlIyzdAOFuvDwYfkfkjMylyFNOrYtfIcmuXebcedWvMfvUIWwnlMApiglNLLANUjoQFtrKvsXCEmGuyaqzKNokWBuVgJrQgyZYGfNgTflvNyhBschsUTDfVWkp",
		@"LQuPRbPxdSPKUdBfcyEDImevMsWOjZMFnvuatnrStbYAFhlDFoKQkNTAbCuOKnQUHnuaNNIsfubKQueoATHIDIWtIJKZugnieWAYQeuAgerXZPhXENHfMFOxPaZrncNKrwTqQKO",
		@"lZGgUwaAdSAihJWVkGKUEhUQdFYDGmckBAQgSiWgFgwSBUCczHWaPWfGqTcuIpXhIarnDfSElCyVgHrbeIOWRbKUfKUBtSRhWqFSLcJoJBZZVtmLpXxDBqHOiQYsNBBkaHBBxDMt",
		@"cpsTZZJiIVnZFqJaBxNGNHHTKTJUdpLZOfGKQkZtaVHIszDgsZkEUJhgCDCNMFhoRASPdquOeEAcuxfPagQJNzSfqwtJUISaIWfSOteaoiMIB",
		@"WSvMpamaONpsKBboPTDuwDTXpiBxfQtbsKlyeRBjTZPRNvwFFLGGWgnTkBiSghdGamkjcwJOlVwtkrXbQkUXVcHRoScfDaMHHaAXnUnWYwicbvZqjTMXSsYNpRHYsbMNkgSmrlefprfBZIRVYZkI",
	];
	return gdxXnlITKGmgIcuSM;
}

- (nonnull NSArray *)AoNEOUURDI :(nonnull NSArray *)OCdnZMqoehIO :(nonnull NSData *)kVszVuCqyvp {
	NSArray *cfGFvYMmAvMtyfB = @[
		@"oUjBBiqJZfygJGVfMUcnRXcmxheQwMThTZhmGkrVcfZOgnRFSSwRVccxXGYMgOLyeFufhYjLWcICLYDUBGvRUtapYBkxLkWfdRDBZBIyskeZInbKlbWtufSNItQNXaOKameRKDSqhc",
		@"gVHzQhCvYDHRGtRNoIiTWMakPSoZkiUfGlSStfciopuLHdnNXaGNlLIROKpwLPNsEOwvuNcKkqJYRdooWpfQSyLtaMYKSOVUoFDDoogZCcDzDBclAvNloFkLRAuCFaejLpnElcRFZqwGYTs",
		@"cfjRCzMCsEpRXaawKccUmIDguBEXHXhFuZjmwUoftfeGBfnyfvkutjVEdRscDrjHyzdAekHqpbgJdhEPSFmuaELyZWjOUcNIDFGBLnmEDUNGLhGutFDjnLMtIYyAANiHbUEfMVou",
		@"asOCCzaGCVHBtWcbQCYhUoWApotPAnjTfcKsFNKdLQRjrhdhriczhpTlRfPHIPsmrFFQEadhvZxwaztKpeRqRcLJFMAnZWIczMPqFGyWnjxYfRVABIlmgkblShOqNxKEPqStisooKhTRpO",
		@"AWwfMxOZPiELwmwzPRGlGhVDaJwAJKDsKNSzqZoKkvDLAGsAjkOdHWsTVDWXgxpPPSGOSHDCsQovXXVBVxnnGPmRFuiFzNfsPgBzGCfmOQqYKKUVMEfPw",
		@"PJCgKSmQpSJQuPiTUtsZdyuYLlvxqNYyvtTfIKdLuAUdPUpobwhqRpuQuZbvLvkifOJrTHsJToDXgFnIUXpRwKqkhnKOrRhKwaCbhYCYdRfXMGi",
		@"AcAsaLQUvoXdpyvBqmwRquvBwughQlHJtIuFrfNQpDgxgBAgKDdmNdNIJdEScMaCFNFmAxwmubWUVxYTrFqQfTjBzsHxKBBmykgvPqQ",
		@"rYyZjWWiCKJxOgrqktrGXOUHXtZYhCcmshAKhqqiCSIHOGboDucYXkuHJLfYPyEGsJpfPZQvvArCmesbrujvlRJOupnouIkjaASeKbfjUcgbnjDnqCbo",
		@"YDUYniYXVuTDDLeADIuyqbLNxmhzifeNLBWjUQMmhwWQQlGyBgFXZZcqGrbrWJMFisCUhhotWVMwXqNIzbakwsvhFnijOVTsLqiZQhMKtWpwaJywXfNmBgMzHCAEiEKEcTuTAWwYeY",
		@"PteuagbPAAKcQqmoIIAVnBpvDaOBmLESHmoMnSSiWlKyGchVIpZiBinrMkEMgmfrwaPAGNBiZBBjsGCSYRtTtGHNuykXvcUTKiqOvKFDCmjnpJyQMpPqJUHICZruLbMWfFydZHyo",
		@"ianwNwtDoOkCLuhOSWYVXqaAaLXySxpUxwQDhZazLPsxLtFJRTRzZhOLYTQQJHeOhjXkwBmOSZZlwulgTCJZIfXFcyQzeXcgrqvJQa",
		@"OdvKkeXMyGOSeMmgtZVJNdHlpifNtjHXcUUjslccvwsPyXVSloSOimyzfCrQMtEvWyeqOyBoCefOYwlpJcccwqbfxyjcTeYuYrQpsFIhxgyOJS",
		@"hYWyfSSISNAHPPnQNhhPscwvgvGYJHNUKkXsbiyukXadofnIfewleEnEIRXIZxhoKebkVVMhuPQTjoIMyFTfmCZjluPMibFHqYXqhFYtRxuHWQAk",
		@"GKnrSCBpJMprlApOzihurCjTJOQKWOiImQJIEgQSZaXwKyPiuNZEYUugMFzKKMPpJhQKoTGgfUYWiOGRZTIxSnySlVwUKjJCgHIEwoaeIVyoxMbzYMIxIqmu",
		@"SvfpAecIOgpyrzNJfKSbBxTOxhidAACjShUWYEnsXCFYOuwxnIhNYsvvKKEdkRMDgryVtgQtAHfKNUHtOYaPRLswPakLTQfQtHCpChSEhcCPIIPqxDyweLkxIfLuUNlZJOT",
		@"pvjtBuLjKvZDoPyFyPMKQzjUthcrZSauYrwwLySxmBTsnKRtSOSoiBMfUWpHqATqwZTkyCGmkzBMCiBodTipafETPzMQGlSZgyswjnRvdGhhoRNq",
		@"WKuGhZfbxCOXHCUrqSIiOiAjsfhQpSFwXtNlXYIrESMAIulVnilmDpXuCTuRfRAmzZVVkHgoMTXSAPXVCEIoUphFnUyxLopGFFcVkDzMB",
		@"NBfnNzWNNbFEDyKLXBjEjCNVwwSPQvruEjDoLBcRTmLGwNrfunDTooZEaKkQUfOKzPgTwQvaNnTjohhFCXSDrPYJKIMVGaVYWqwBIaqeOZ",
		@"oOjiUXwHliYtinFMalTBeEwyEXFepfnGXMsRrRjNstSeXNHHRXoJZlWJZQXSJDXBYLUTOuhkfBoaCNwDSsDTmCSrejvagNGMwJbdLKPjjZufuILfygoYZjeGZniJfIzSZ",
	];
	return cfGFvYMmAvMtyfB;
}

- (nonnull NSString *)pfJhNwPsxdsegSl :(nonnull NSData *)LdSDqzUNrKIcs :(nonnull NSArray *)uVYWfXfRmxGPm {
	NSString *bIecXWAzGrlvb = @"UtNHRKPJQEdyhGYfcsixAUsVCJDAuYWJmcizGfMMpiqrSkGgnTKSJYayNegnCizpXyfURutLHiZgFkVHOPexxtvswuKHwTceWKYZHCxCvvBBVRnFsoKddsrXrVaRtlj";
	return bIecXWAzGrlvb;
}

- (nonnull NSString *)dqHWXhPsqDthkqmAaEb :(nonnull NSString *)dRJvupcZwcrkOXki :(nonnull NSData *)nfnHGVbbWis :(nonnull NSDictionary *)QUomvzdPKDgdUpburE {
	NSString *gOoQIyfxNtEOnG = @"gcoXKTxjVKlUlSmvXUhwwxhvgHAABenfBusbHBuiuiEEAiwqrpbOELzgTWRhjrOqrHbJjpjTqDWCjjYwwYppeAACzyZNbTAWgyiPEkJEQtrV";
	return gOoQIyfxNtEOnG;
}

+ (nonnull NSString *)jBMukJnEuZHWWQ :(nonnull NSString *)yKzgfAqEPzjyVtgksiP :(nonnull NSString *)ROWzbyzhXVlu {
	NSString *awYSwzlzpAb = @"QpCQKKwCLNCrlKdGdUmBXXBFSpnduBeDYIyBqqyqSlfpNzoEWNdxQiSWuTyknTxIQXZMlkMZnfNsmRnHvyuFpfiLiPAcUbLPYtEIAAFGqGmreoSoqbSyXnVrWzSeReCGcADHAS";
	return awYSwzlzpAb;
}

+ (nonnull NSArray *)MIURbhpaLgaX :(nonnull NSDictionary *)pDcwNWXTzqBHpeUc {
	NSArray *ZNNQAflVuEpOote = @[
		@"XMdnXgxQehqDFFsbbQkpitzCcxcNIdzfwwePAqypxBjQDXZnGmugWoukIQZUbhLOWylZlRkJMTdllVLNqHOaRugSLqdMheuyuiWykt",
		@"qfjmlFcxcxrBZqbeQOZaRBGnyWAZoqEQHAxCOEtSvXlxjHsAIDJufHslLnRaqSimxSNYrckMwmEAobgUJaspgiENFHfZyxIWICPvTFsjcoqfQGJ",
		@"epZPWbJkVlrSZhJRxrQZkLIzWVDcSjfSXroLzsSHlZpJNcOrjWJsjEXKFnoufWqYEucehTjtnBIyZrcOHCOjTruMrTHBgkTWaUCjNcaZMFiDtYBfQaRxTh",
		@"LREiEmfkGhhJDjNSbgFciEhBLnkEbYKJjQsSkpHhAPNmmojKGlvuKkNtAzzxAeGDAKLeVJYlSOhVuUgqGoMFLbZebNkYZBhCVPADNFDAMZRNDDPLRlRoHn",
		@"gDRGKNfzDzQhxVbacyhWodhTrzMjwGUEZuDVigVcgSjexeuoZpIIamESepkAeywtTSBSHXoXVczCdbRWJcxAPPoPePrAMIksIlsltjWlRktgnKCkyChjHRDmPEGaeBLAMRyVlbgnMVbKGHDtE",
		@"GuxcupggFTYWLvnuOebePhKBuXcfCNLnpxoXRcbmGxcjdSZaEebwxNOxfgyCNrvRghkzmqapHBSvJQbVYinHOUlVyZZNDRKIwulZAuqExlNLVIRfhVeZuhjABAXLdWIAlhiAkc",
		@"uCqMntzUqmfRHxCCTWZxPYZkJCZwheOlqQXYLmWqFaxjLgVsVqQHkemKRYKjWNlHlchDZfdsJhakjUTwkgSOTtzBkQkilqyRZRcDhCmIuvZpFZOFCEEaECFJjnXjTNhBJThnIZK",
		@"AXVmOfBAZHllGfaFhHNhoDyHKlJgvFLBHaepTHuxFtpzvBWbiDvGPSzkJefoxxWeJKCGIyGzWYGPTltqrpBTVpoZQsceeVirEPFdcnRwLiFiwapqnwAWxybGuXlqcLeIBHbhnQuylfdAn",
		@"fGmxjHdapSSkiGmtPqmhojqOHEWRkNzHwQGuSHNrzAQPXOTBBKmzhvNIxhKVWBcQJegHPQpJVeddBYmaOIZWlWUVwFZnvDNLMbUMHLWSQsqbsRFGoKCUiISn",
		@"vuINhmMXmgnTZAXgclzwpmWQIjfTpGLwmZePspMbVtYnZpQSRBfnwRYOsEcLmbNSWHpvWtwjUyHPXfFdovXNfgZgTZKPVWWuDiSAkwqxuJxBZNnylMLHTVBOpyDtzNISz",
		@"HEuhHsGesWeEqLPpchJwbUqfGQQHhWEEIZqEEkQfaUfmrLPnJfPbngSygrMZItEJFMYOGoMKAoifRHWUOxTboRZvmytdqshgxvtFcQvjqTDOsUYh",
		@"QujZiFDUwmZLISPkkHVWwygalzNZypInacklXjqvWvMJdgsHcroSfIzcOEvJPDfMUbyHJOOZgfIEEZsuevchYbCzUYsdaDUDfJPGpZTSgfXMHLmJOAXRHjbhMcDBgyZlRmJ",
		@"fnzAFcQlPZrxVnggxoXSCRqcPOfJSwKPDSQjJxOHgLGwthkcTkMCFxdCxVuyvrVerkWNSEuuYQZkRtBNwQfWqmVgrqRbotQTTJUzQ",
	];
	return ZNNQAflVuEpOote;
}

+ (nonnull NSData *)TtgOmlqgKARDecKatzh :(nonnull UIImage *)DFLvbvIxDvY :(nonnull UIImage *)vNUpaKlXHWYUclY :(nonnull NSString *)stXrnDaMjtCMEV {
	NSData *RgfvOJHRaYT = [@"nPYwrIogGwpeSKMdxpEjSXCkcDrIKxbXBTILfIABfijABYmWjKxkamrpAhzCTFSVnBHMagIIhzShkWvggPkRsDBpRmHNbsrEdpYrP" dataUsingEncoding:NSUTF8StringEncoding];
	return RgfvOJHRaYT;
}

+ (nonnull NSData *)AUaGnmvbCJm :(nonnull NSData *)ZhQZnFGtpHz :(nonnull NSDictionary *)IJsLImiQtZXGxmfNOF :(nonnull NSArray *)tNgwKDEaCV {
	NSData *oOXvwdgkhtGLZXYLtA = [@"JNKblzZnCBytMSpsWujJeYDLowkVXhUAtuedPcvAWWBGnhipMwIZYShjufAqBCtmtVGKJkGVvjpBxmifIELokCayRJbYoIKLlmRrWoJGFpRwLdPzUthaaBhxwglVdrGWrBxLqBAzjfUaCA" dataUsingEncoding:NSUTF8StringEncoding];
	return oOXvwdgkhtGLZXYLtA;
}

+ (nonnull NSString *)dtHznTCDnnuFI :(nonnull UIImage *)mFPlcsVPISDEcWOaIX :(nonnull UIImage *)AJkTdudsbNnr {
	NSString *DsuYOTZrMwmi = @"yzLAkEWoALURVMMUgcbeUOCrhtKjwWURIPXkgxoOaRXBbJzFMdWRYTHwycNxNspHwSPepGlfQwIKUDpWDUIuVBbtgXBOinmOFAKibpJWWbcJmvvKiTCBa";
	return DsuYOTZrMwmi;
}

+ (nonnull NSArray *)YVzSxKeMXnPjaAmJ :(nonnull NSString *)WXaTzOMygP {
	NSArray *vrFMJRlOcc = @[
		@"hkuwpwosutiFEyNkVyNOLFLzrYSNVfxmuyuHGnhZfHbNzgZTeocRGFPFirxudvjgPreFGkpPtkpficOPEQHluqcvnqqPPUBLYYwyRCZUrUWSMVVAAgFRVlgKrBodWHMsRfps",
		@"KzfjIfdYrKDkRwLdIPyYOZktECaPfhhuYniTdFCrnqWbTtXlSAWNXaSwxbGLIipOqRUlmLXTueXbzJcvViHCcyyXIaSuOcCpXRBEhuWainLOhgHYRaiAsmrCupJQTkVr",
		@"LqFhHVIaOGmBTXjRFkUPTdRVWrKdTIFyUPlQLhGrfsSKeyyiBLjVScmbRwkPKLopfReWRlModFauKzyQCTqBMwcNvGtbLfClwKwfpfrGn",
		@"JtuUPkyTVhBWkGoVxMaJtdDiKemhMxvcKdZDuktiCToObyPbDLCLqoNRONOOacapJJCkeiLnMkBiliWNJiTWUxLtlfzKrfKpRIhZAWIxKLEkixNrPMKikM",
		@"qLyMgAltDyPmJzhGzYNnTcKJPtYYkGmRqJivSUEaNgoDtozgzRXkHUhCtSPJVnIsKXfuCEyOikONdKbOQojHXYBgPNSbIGmSTXRFllbHICglRyGXFYJNxkzwDPZitPbNejFHkLMnoyTNIuCA",
		@"NrhamMKvkbcKkPeWKIcdtiaZOhJhlQdIHpNXrJOVBpCnXcddvKtsKHwtyusUiLRmnMqMEHQBXlcnpmzxAelcisNpmMQBVsokuHjWEhY",
		@"YrbHIImuaeTFIXyHdpWxeGMfjERfEtxuqbopVXXEEjvzuavwooThcgBqNzNzSxmjrPgNXHjPQClTnPAvLrNQavkeDbYOaUVHYNutzdpmGzgzfYweeIEHeSQOBUdwzkqJGcScoE",
		@"jVlmKdKxPQLsIjqGUQHFNUZwuPKkjeGVObBVlvlyOZRDMEJzjcEoJfSHhmrvOqFRDqojHxmYpHTdGvXKNbfzMDaRLfqPjrheiBGMYXuTcaLMYnzniYXUlFzOI",
		@"bCsePUCElLzTSfSfQsbZHcsAvJMkoCeusHdANNinxAMUokTDmryZZaZreEnWaSTgxaBsrYvglBMyoQfCvPhkgUdYcJnElKKwAjGMgYNaJyWdrArAoKNLCUR",
		@"xwVzFXRfKeoJiuubPYVRvajNmJRDLVEHFIFeoULulYJZQLfJKVTjYHUCYGKyqiVOlyNOsnzjbrHOdmDPYCGCmSGFtCtaWOkwbCobQKRRpVpbTRXcrFoiFxgSpdgyxUGizMRF",
		@"raDJdnTaaTfEoKXbBOLWBPnvmTvcLYUuStorPcEPBKpSmYhhlqrnmjkTuiSlZuBcdCcFJGflKHfVbjpnuRyLdJQEidVWqQdGJIokSttXq",
	];
	return vrFMJRlOcc;
}

+ (nonnull UIImage *)vRUjpDiFaci :(nonnull NSDictionary *)TvkcIDzYWyurMubppmR {
	NSData *TJZGwGNMPkknf = [@"mdRZrRzUDtzCCsPnctyecwziffOSeEqiDmaWWeoRAHeTvAgaCxvNbjCljDvZpEfBarLMxZpnzdPqtIXJppVnNIBnnxUHGcodMIZelHbLlKIjgcDhWGdOTewfTfHXAzpZPfGZwOLc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FLLrGdhxNZsaYMOZ = [UIImage imageWithData:TJZGwGNMPkknf];
	FLLrGdhxNZsaYMOZ = [UIImage imageNamed:@"RceQskTtbOGyrIVPrUnaYIcYcOcbJvyPZTgfMnRaciXVVTcFYcamMIzRvAaiDCQjSIkxfbbMQwJAPKAZiRFxlekRpxRdRPQciouXXrATBIkoglUTrUQxfqnBRItsZXZZYuEXQfnH"];
	return FLLrGdhxNZsaYMOZ;
}

+ (nonnull NSArray *)SPuhiuTDFebm :(nonnull NSData *)DEzrnWqPEjfRDGK :(nonnull NSArray *)jBPAYshYrOwY {
	NSArray *oeuIZTRhwCkmuCGa = @[
		@"NbeWCIqNOCxQOWWaDlzcwiPiWlctgUWOatlEEozkFiwagwjQPhHzxxOkYMPASFqwCpVTMhBKEXwkruzuSJVduDsakiMeUwsuqomndJlkzEauLMvUFHgVtGdBkfYJvNbifzo",
		@"uWBRNpyWZpYCTUcEfBoiTEHUTJZbyXjaGqnTWEImJsCIgFJyZtuVyWBObULuaQixloSJEGCeGLCinKcdKjGnWRLwLmdWdjVSaFvOsKuBEjA",
		@"PXoEYpnetbxzpTXnaTSGZmgVvCARbXLGVJldhjnVkAvXGJWOdItOLkTccbTAINcLnOrJxlbpzfptOhwVbPjGpDxxlKoEfcvhBOMFkpXjJiBuodKKzHIfojqNb",
		@"fxnmIQQabxryteyOajLbIfZpBFOmtxMwxoiEQvvEaMEmHAbdeEgzHkZJKBvcZENBueIVjtAEsWWABcnbhTgKjtvKKSyfphYeagKQvIWnUtLOdheDxoahjJNmyqFZ",
		@"PBYzqKJAtBNnZPYkURfyjWKBMBPmLWdrjyDcwOiTbYCzpLnCFqdrvBgUnjmJcBgrhICHXVigPZZXoEyOJAFTNuNavEZBdvNgNtSgomScqfFSZNzJJQUIPJ",
		@"jBNKuHTrLAzSjtVDIpnPdFtFTSqqRayexDpyaWpxPAYcufLhtatSSryFpoHeqiPkUNYHHocxXBmJjhCRglejMmnaCGoZCoDhARRjngGHJzBMskURGOQiGOjvLVO",
		@"vYAlhTxefczxOJXYiSJBckiKIllCmCLMsLsPNAsZfuVJhgyUlCeUuviCzuoqKuTlaXjvMcUuDGjquEUcLzspkesIboLcfjqMMUdO",
		@"FCKhVIUUwRRJxbIBrXOFccwoKGNwkeUYxWItVwSgQWeWMQyhrTLAdQFVYKnFHoEQlJxxSgcBRIDPSeoxvieyGWOxUOBQUlHrPvuEnjdtDGYHaPwWlRbqffuFiPBUWGvatmVezIlXPd",
		@"zAkDRwjTJvcHNatQJhSiRCALyQyUkCITGjsEBolsLzrYjLkDQPuZyHpVFvbyJFCeOEPbXocKYrrNfYQNzjwOpNhgvyDMvfRbaZVYlzDynHuUsqJycmpcUIUyJxfjfFyiqzTICjfGWAvn",
		@"FCnTVUpRAIYWGbhlcBIDNMzVBpBSAiAsOEJIWGInjBGZJqbrLOUAPIGTeajdCotKxCzACNqQTTditAaLbBViGSddtOtsCtsDFAnhMhLlAbERiLKCqGJBkWfIbXnmyyaOlRuodojXucj",
		@"ceNnIbCJtVvQDYVdJLYpLrOLYNShUlsxEwudueFuMMOFpRTFileUyExcbopirpjjehJEDweDXlpSVwYlaSCCKQMpcLdNeaMFjerHbMfyqGpgNvtaYKJZfKKUScqvpg",
		@"LIZycSOXSsFMsBKVYdpPwInjNIKrLYFSeFrekvrhDSElNUplqDnyjhgjpDvHFZVUrlnblPtLPRzrFANCxrIBmjpTrlhLUREVyZrVNgKf",
		@"MpgisMIKnyYygBqZWRpUrgxPXQWZOLtLSzDnLqirMkSjNBtWxgkrTrSmyTlEGlsvFUyrwVUdiwiMrEWDwiLCXGkPqBEQmZnXhmAMpPrtpNMYqKeX",
		@"vAImhqoylYlzsNepRixVldhBeVTIwHxYdfuWQXwXulCIQSjOavgTUluIpKrlWNYSsfkuMrOnFTlNTVdgsYNKmvqHaLWdMQPaeRUviEzgRinBwzSTri",
		@"FSFnTtqrHOfvGDZlRZmWRPJdqKHBgIPQLgUpXJUHuzVipBNiObeVPKphpReaMGHicEcgmVPOtidSJpfNaQxeFEaTVkQzOubUqqnghJsXjuFGjzNLakaAdJSHzClNSrVtqjPqEwh",
	];
	return oeuIZTRhwCkmuCGa;
}

- (nonnull NSString *)PCgpGQRGsR :(nonnull UIImage *)CWHpnLiRYSMjHM :(nonnull NSArray *)CYWgZSWEUrYJWcFns {
	NSString *bTzwafQTtqzUG = @"YoQacxRTHWKWlWZussUaVzMvacRjdOtMrqtDgQwOrwYLNUAlrKSldujRzKFbCRUheJjVcojQyrdgPJqFsmvJcctOLxaNgYXmilHiqwFNKxwegUsDvqcVldmLrlDVCPbmbk";
	return bTzwafQTtqzUG;
}

- (nonnull NSDictionary *)iIDEfWsUzcIhsl :(nonnull NSArray *)YDsHIAvRhDSVKldU :(nonnull NSArray *)GGfSYIGGwfiogUr {
	NSDictionary *qautgnXySlT = @{
		@"BoFaKTsDzonYhb": @"heUSQCEuaOFjlcaladTlChyoPmAifcasJpHEhEtmmmpcpJIxLOZqBtPwUYcFwLDWFIyfPVhiOlVTkZpcGlHXYhCafXEQFkRQhNoHEPgela",
		@"NalrfweOwScfuHWA": @"OZpQFHHyrOJUpiMCgUalRGkcUSfjIWlbhXWUDXqOLCXwWoHNIyzPfuOcSfUhvowcKfXhwvdVZNeoUIXybPIUjypfJaTvulRzJcLVrojHVKDypqSwFMnITuWZjNChpCYPcjPEGCSVejOcqoQTRqi",
		@"OHhVwwMbeJL": @"djQRYLtVnvmkEabuyPhobncQCqMrMKqiJzCzxXUAaPqvnfEvhybRBnmqATSqOMJrFqnBeALVtpxsosGrOkvcQGGCJrwEgtBQDcvtMgtYdSROs",
		@"uCeGfCfsFmmNwJQU": @"zvqPZHzAJXTNeLosmNVvEhXXwzbgXfWDuLjLGBBCjTDLiOrKFhaqpeCigJAwJeBMMuBJiSSJyGOLtRMGPqVBClXgYPEeAhynZKSAReNXRyoMvpKohzaKVcceBXgV",
		@"YnLyWBSGBTQfKU": @"YOVHASbWOHIaoRVgNGRVzGtbHOVYZaNyiHjyLpNdCVQKhJXTzXztfLQROzQGCBIYiqCAdxtFxABlwyJeHdcnecjUPQEiNzxYYqkoXmzGdBwwdnfZBloBICE",
		@"ejnHAEwkwZdugOqlze": @"qEnsDlPiePLlFKQzpCvfWyKAVEPfErgYxOiYXMbWLctvkcjWkuabEvUAJZdtjWZiQMcRshPtjyjnNxmBXYyNCmWpBMVjtJpGtIkNIMoYkaWArfmRSe",
		@"cEnIcwgRCTD": @"cQQhnNwmYRJYuzJivYKNvlTlwTFjcEyEeaHrdNUwtUTCCwFpqWcmuBeNGiKdctghImEBAcsImqNQrkbzAWzgPfBQaGNjSLiOtSZnndoVFzRhtOiJbNxemSncaX",
		@"CNexwoPifXow": @"uuMrvjPpQibZvaEONreNunvDVhuDZTSvXwCbfmqujSgmlclESuMsXVLLCqDDeWDzZXyfGnQREEfTjzyCBiCGdSGHDBVwrMfjnpvonRGcAOWxLnTmYapuDQcpkkp",
		@"aQYiWOwRLnhUlWFATF": @"TWHQfKvwVYSAefVefqgcPZfDboQOMLdodOoaQAazQZtZaVtjswJFwwscZddzREnFOlBHFaJIIRyavPQLyHgeLFznOyIHBRiiVhYUJZanijbrDvNAFrlOcJmErkOlyhVruwivInJzx",
		@"ynvZVrUzJTEKnCJV": @"bUjAIvxjdDOQDYhegCxOyLhscXdeXDhHBKvpHEVnbRxveVFfFmTnTepThtezdhAYTZTsfxhjdPbOzKfSqoiVHvoHSKTZQIAdjDaaqTynRqyVmFFTQaWkJnKsMweJ",
	};
	return qautgnXySlT;
}

+ (nonnull UIImage *)yzKEsofZfhSBaAePna :(nonnull NSDictionary *)dflfRFauag {
	NSData *KMcoEFBfJfOyTyJTpi = [@"oKdvzEdmdRIpogGwkFksgdZLUUzZJKwjEoDRpwlhpDkqugGIpLwBvDWtuPZSadniOpontZYyjgyMBUFuEgQOCeUIsOPCfwNTblAvLVkWxMaRkRWgbNMqvLdab" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uDIhKqWOgiqaJuiCX = [UIImage imageWithData:KMcoEFBfJfOyTyJTpi];
	uDIhKqWOgiqaJuiCX = [UIImage imageNamed:@"BgyCDVnsasXLRmeQjpsvuoodDnOSPmOavKlhkOplGudGmbPBHEnyrZKNKSWzbhhCEolIqVKzKkvfEpmJzKpiFIRqNouQassciVfUEliUJdTvmgkFrCyCVZEqUAcCjGcCIDGRoeSNGmzo"];
	return uDIhKqWOgiqaJuiCX;
}

+ (nonnull NSArray *)WppQiBXuGRewiduDE :(nonnull UIImage *)bcFmdfwaFndZYknvNhy {
	NSArray *LwSAAvuwwUQSVkyf = @[
		@"mDyRcsAeiBSQCFHCLoloTTBnmFnPuZFmIxASTTuYWZtzsMfZZyFzYwqZOxMtSbtjNrXRZXTSrulvYqnLgcCjsbPalhzdBwBtFKAcFsBNCWMngZygijxHO",
		@"MhmHcppWYBpNczrtMPTYEolMCGhKkcieATudembAwWUHuRhmRZSYfjoVYSnlXrCMAOalkDOabqWvkWPFYTPDOMUzUavoyrpMRJtxcVcuTNidTqcnEPJUjkpbWYuQCEDGnA",
		@"BSZYlbWPLKBHCQZqoLNDyriHmqvVOQTXXjphraIcQwFwGNkYFJXcCitLmhHJQYMLSpXtoNePureCnPyPxyxLUIVqoPiLDlLOOXqVmovrXbvmaSItEAIlswXpoebrxLJIZ",
		@"bJhgcxndgUOhcthfyjMjZnJZlVuZwLJwvufEzLfsQSOWBmfzsYWPjaTvPTntCEugvtWlyXEjeLwplcnrCXTqMsyTOkIVgWRIdlkyvNYcDmklAKVytot",
		@"dfokmmfhegAkjePEiyLdhcimSiOTnNOPWDWFWgJOdsykjVSwUKiewKjRwZRldCtgGSMWCYfkGrcjoRhNZhhNRwQbIbnOYCltneJwGQxaHrjuvoDWEvBnMweTSufwfMZQxmxkQlxFEQLjyXitNEhvC",
		@"ZcuAZJcDXwRgoZDarcNHkikDauAxfDHDPumVHVHBXRJfoNKaQoeJTPMyBVzopFtcibOKXHKaGkWWRTiaqEtCWMempMuYWzHkYpRbLLyALTvieOAJdteatNpgwPjNlzpjQsUYLiOPXtndUlG",
		@"YITNJPNzdTlbboePHHKDzvtiOnMLoFVSkwXLcyvDCSCwuHVlEylHaviNYxfIAFCmuNcqKTSJReGlSgNESYyphjDIHOrmeugVxwKtaSSODNSyZddwuzmoK",
		@"UcQBWfdgOQoLLStyaQWOvfYMPVYBRhKZziuLJyiPXCEjlrtfaSiwKcUtZIJjzLXOrHAiirJRwhEcsnMUDqecQmFFKolZwIYdDujWfAIwKDrksYrKeTCVBpsRRSLiWhqTfAwOCyseGkGHK",
		@"tWxIuxABPvojFMbVDtcMOPWVRmskHAOBqMnNglFusPwrwYofgytzQAjsEuOcGtSHuWpTeMKkteXvPgEIeBCDiBJNxqJPjPnCKwid",
		@"bBSsbdzfJZQJBYrrJlTCzUmVETtGsPqenXzQGcLvuBcOgXPPNBrlWQDYEkPxmTpThuKVaernCEjwuDsLzemfRbOzDVYHwjkcyXERsqYmsLKRzKIBoviyQMDUKqdBJ",
		@"fjnWeMJWATUGMliaaPyaNOjTycQyTKkkBKeVxlDcnZGscdYdOMUDSDixsuPLpudKeXaEfoGZpwwruuSXxcOSDBmHaeIIikMBDcAexmCsZUNtuJcFIFVJuwRzKBVaKBYKcAaMyFqqvENoZdFNAaU",
		@"NJymyWmKqMheJFVEAFxmyiIzTgXLXZHXkhBPetcIPQaHOMifMXRuCgakILERGqGRmWlIhupNNPrKKtAUwKUUVseRnNlgufGpvAbGAhtkkpcxUsycAlvMzsoiaFsevksswSD",
		@"HHwJSZdXnYAHTprGBGfLpYOpCApxVKtcMCGGVWefKaLbGzRVpGyXHDeEMvvSbAbVvMQcTVtjXoDyBSiIHKPeUhkqNZRnKjvcgsrCMEIeiV",
	];
	return LwSAAvuwwUQSVkyf;
}

+ (nonnull NSArray *)MApQNzFgKj :(nonnull NSString *)NwwonTRLsLbPlRXCTH {
	NSArray *jmdIbmPfUVBN = @[
		@"ZKhhQNZOpSwdrwgdBacSRLWWPgugiAkXNpNFxhoQaqLCoSslTdBLMVEtawSWJgKjmmcdXdWJnDZmTdgPZpLgIxPHvgXtGVlqNMTxkbCiO",
		@"qOxEEaPgiSynxuyeEQUjeywklRGmlzRVqvONuADqVYKjEBMcptsnMTJvGbpfJEilgutZaukaPhrAsCntxURpNQeOsqdLYLtTREgjtqvmBpaBlLhyybmfm",
		@"iYrLXDUfJufJlDfWnynSPJzKtxXbMoOKLokVFevRskqHfpnPQGogkLmkhvmYdogARJQOsOajZGDvSpuadgXvOJIWxLkvdXylREorFoCTQgBzkjFnAsOzrvXkhXu",
		@"uWBRRsvyxqwYdPvKHEWazbKHjkIAmOgJcMpDqsCKPcTtjsbpoPCgcvWWraeGWJIOGymJunkPMCaQcPIXhDbmwnsZcveZWjFdJKLNdlxLRXcsmIrGrOAPJYuRwHAjKhSSEmLZffNVfXGOGG",
		@"ZiBtyBMCgHetchzsPPYKKXJNkpQsJiPsNCqlTUdrDAEqjWISspaquUfGJOmspKwylAtaBuTdVlXeuvETCeHVIQgpNTpZonfMQdBOS",
		@"WkmGYKuLzBCSQWiwhlSSCiJbkBUdbMWAasVYUFrKbMATtPyVLBNfBjPSivoHvrXEyyrgONIWShgOmKzctajIleXYDmNZLsQXrppHHINZsuUMApizV",
		@"hcIorLWpVWWFcPTReeYxqHyGNcwznFHJCFprpCEqcPLPzwKsYqsZyALqWWGAPRqjkSotEFHZCoaDCSKZZSTULUesdMveEdxOBJtLyFLVaUwcNcVxZLrj",
		@"pZltJSZNkWnryGkGNForLNxsLDbqjruFRZFEhwelLHBPQrGAKbfvfuTgvMSasVUjohyUetWGHpCyKgLEiADTWAVQgTlMsZtPvomSNuArPMkFcqLEsgdgCNpZ",
		@"vxoElqxFVcuzHnZkRSBceQamJbYtzxYSLtFZTqXUwObDrIexNmQJeIvzhAWdJwuoEPevXfkOsPGERJxgEwnMbuKuHQZUSboPxlxdBqvxtPHDUVxarxnLmIBrMeWmNFjHGgByCvbcLhBhBOMFabpDy",
		@"tdVWHllobRajbOxvRWTGyegSLetxdGEaRXqpFzSdcTMfAWzcwdZVLXFcwOvfTryoQyVFAaDYDWFEUKqVnspVaFhdEYKPilEWjfYxmkUQSomlfhkVGAaiPFOFfZRhGtcFFEODYaXbmRNAzF",
		@"SXgJNIJCLOYCuznqibFexkdfmwBGlNrvkRJIFHnztZyEMgTSgWZItzKCEppYjiyNlDwTjFpfAfLelLSkhTgCmKDNGgrctsvdgrBvZrneqLeUUQLSDPmSRh",
		@"dZzzopxoCwZRcOjhulGaqQrJagsxcjlIsppDXVhiCsXuVYiFHqKMHsQLgrtVJElvunyniJHxMAPvfeWtpicvTbrcFORwxyeSAwdUtTseYQbpayBKdRFtRvLYXBifuAStbPPOOvRcDLLsOls",
		@"YdHrJDdopATSzMFzUjGQAbNWWlXGJQqTObSGSTeKCbDSdVyPgYwpwPhalIMuujHECRHXBnTubUhRsdmZtZmJeyGWCGBFfHUsFpBZExjktOFJFOmDkNhAG",
		@"uRruYyIABbPUJHdnAAGwjqPcpeGtoFClkuYyFNqpUSPbxOEXMeKvYxadRaifSKNpmVtvTQUUNwRFtbMAPmlkyWXczEoIpygJYZfeRYXahLaLAzKBJTYlT",
		@"NfMaxqdGVjmSRcyygtwxdsroLDoiynZtwkTEIHcrIGVxMDatuJeYbWDsgJccFuCWQvGpMTnqcqeJfTqhYXbZETTWgwAgmStUxVHAjKpXZcPQpPCclTqVJKNRsCNCQYQLajWlQqVKnnhLnSXeUaIN",
	];
	return jmdIbmPfUVBN;
}

- (nonnull UIImage *)MuJlwTsSQeyMbSERLG :(nonnull NSData *)NYCBxORnit {
	NSData *qxraUUOMZjNraTfiAB = [@"XALDAFgTdwFALdxsolXuwYPbJwXMoLQSJLmOfTmvCBkClGmtMQZgMDiliWjdbuCAqbLaBDnoGkuYdixrXdPEZioBjRAgZcPooGGdBzJUANRjBVMbadPmOsTzlunGDGsDyBRhfiv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AGkEoaUIQpi = [UIImage imageWithData:qxraUUOMZjNraTfiAB];
	AGkEoaUIQpi = [UIImage imageNamed:@"YIUGDmwSpdknLSSosrJfxUkzzFaNWLvmwIDLEretHGGSrmMTxIBFqiiVsAnBYTeTRCQGYuGrqYJYNGHZaizQGuXaGMIRkqumYpujzZY"];
	return AGkEoaUIQpi;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    EMBillHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:billTableViewHeaderIdentifier];
    NSArray *infoArr = self.billInfos[section];
    EMBillInfo *info = infoArr.firstObject;
    NSString *month = [self.formatter stringFromDate:info.billDate];
    [view updateViewWithTitle:month];
    view.delegate = self;
    return view;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:NSLocalizedString(@"确定要删除这条记录吗?", nil) preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [tableView setEditing:NO];
    }];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"确定", nil)  style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSArray *infos = weakSelf.billInfos[indexPath.section];
        EMBillInfo *billInfo = infos[indexPath.row];
        [[EMBillManager sharedManager] deleteBillInfo:billInfo result:^{
            NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:weakSelf.billInfos[indexPath.section]];
            [tmpArr removeObjectAtIndex:indexPath.row];
            NSMutableArray *billInfosTmp = [NSMutableArray arrayWithArray:weakSelf.billInfos];
            [billInfosTmp replaceObjectAtIndex:indexPath.section withObject:tmpArr];
            weakSelf.billInfos = billInfosTmp;
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }];
    }];
    [alertVC addAction:cancleAction];
    [alertVC addAction:confirmAction];
    [self.navigationController presentViewController:alertVC animated:YES completion:nil];
}


- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NSLocalizedString(@"删除", nil);
}


#pragma mark - EMBillHeaderViewDelegate

- (void)enterMonthBillWithMonth:(NSString *)month
{
    EMMonthBillViewController *vc = [[EMMonthBillViewController alloc] init];
    vc.monthStr = month;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
