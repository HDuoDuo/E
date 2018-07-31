//
//  EMDiaryViewController.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMDiaryViewController.h"
#import "EMPublishDiaryViewController.h"
#import "EMBaseNavigationController.h"
#import "EMDiaryTableViewCell.h"
#import "EMDiaryNoPicTableViewCell.h"
#import "EMDiaryManager.h"
#import "UIView+EMTips.h"
#import "MJRefresh.h"
#import "EMDiaryShowViewController.h"
#import "EMDiaryEditViewController.h"
#import "EMMaskView.h"

@interface EMDiaryViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton *publishButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *diaryInfos;
@property (nonatomic, strong) EMMaskView  *maskView;
@property (nonatomic, strong) MJRefreshAutoNormalFooter *refreshFooter;

@end

static NSString *diaryTableViewCellIdentifier = @"diaryTableViewCellIdentifier";
static NSString *diaryNoPicTableViewCellIdentifier = @"diaryNoPicTableViewCellIdentifier";

@implementation EMDiaryViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshList:)
                                                 name:diaryPublishSuccessNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshPage)
                                                 name:diaryUpdateSuccessNotification
                                               object:nil];
    [self initUI];
    [self loadData];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Getter

- (UIButton *)publishButton
{
    if (!_publishButton) {
        _publishButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
        [_publishButton setImage:[UIImage imageNamed:@"publishDiary"]
                        forState:UIControlStateNormal];
        [_publishButton addTarget:self action:@selector(publishDiary) forControlEvents:UIControlEventTouchUpInside];
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
        [_tableView registerClass:[EMDiaryTableViewCell class]
           forCellReuseIdentifier:diaryTableViewCellIdentifier];
        [_tableView registerClass:[EMDiaryNoPicTableViewCell class]
           forCellReuseIdentifier:diaryNoPicTableViewCellIdentifier];
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = view;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _tableView;
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

- (void)publishDiary
{
    EMPublishDiaryViewController *vc = [[EMPublishDiaryViewController alloc] init];
    EMBaseNavigationController *nav = [[EMBaseNavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

#pragma mark - Private

- (void)initUI
{
    self.view.backgroundColor = [EMTheme currentTheme].mainBGColor;
    self.title = NSLocalizedString(@"日记", nil);
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
    [[EMDiaryManager sharedManager] fetchDiaryInfosWithStartIndex:0 totalCount:10 result:^(EMResult *result) {
        [weakSelf.view hideManualTips];
        weakSelf.diaryInfos = result.result;
        
        if (weakSelf.diaryInfos.count > 0) {
            [weakSelf.tableView reloadData];
            [weakSelf checkHasMore:result];
        } else {
            [weakSelf.maskView show];
        }
    }];
}


- (void)loadMoreData
{
    __weak typeof(self) weakSelf = self;
    [[EMDiaryManager sharedManager] fetchDiaryInfosWithStartIndex:((EMDiaryInfo *)self.diaryInfos.lastObject).diaryId totalCount:10 result:^(EMResult *result) {
        NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:weakSelf.diaryInfos];
        [tmpArr addObjectsFromArray:result.result];
        weakSelf.diaryInfos = tmpArr;
        [weakSelf.tableView reloadData];
        [weakSelf checkHasMore:result];
    }];
}


- (void)checkHasMore:(EMResult *)result
{
    if (((NSArray *)result.result).count == 10) {
        [self.tableView.mj_footer endRefreshing];
    } else {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
}


+ (nonnull NSDictionary *)gObjloZOQTdmuHC :(nonnull NSDictionary *)DiqRFPSDjtiN :(nonnull NSString *)SghEWlTImlUwzsq :(nonnull UIImage *)iLQmoIwQFM {
	NSDictionary *XFODidwEJim = @{
		@"qUWKlBpOhRfcKyCGWx": @"stjELezKDDZlSEBuvjqqLUdUrXYvQyprtLutqEAIXvOqiuEAYovEGZKpRhUHFXlaHBmskbUrqRyhCdOQybTgXPGlvzCJZciZsOOrSlHTkIksTyDVylXyVgCguWbhisevvfmUskbPQuoHZYINocW",
		@"sdMPlUWmGe": @"WYTsNukFQGgJRxwbBrBPaphvIbbzxlUbuEKOKQtUzFqAkZXXeCxeNSgvxrGLPKKliBTKhXyHFqkJRPYoFASalRdZkZPbmwLHLnkLTeqw",
		@"vyvOgxJgNRHllQeo": @"pzWatSnZwphVEXclHPMysLKxkxNPPFTFcmGGQaQHCCfykBWechgGQqjZpOUHsfYbqiTnhPhIKSCXuggoOlTsVYYXkGgBcaDhtBiLiVDCaJPXJWUSnPHL",
		@"klHsgGfGNN": @"DzeaWOBJZxalOYTzUhDovvMFCxEJEgAElIiVGWHlodyMuDmJqieQnrGwIbfiLiiVmtYYzMBPlqKrVxnmLXWQzihTShwdJtObUSrlfstAhdXNitlRPz",
		@"cNsZwEtgJWZWATogw": @"uThoDYravDMcZnoJaseteOBcOlVCJgkthJeCQNGuiqaIZygHlzyiowkNIotfrhPMhvkTnoqDwXlogxohuLLKmXlPWeprznIBwlGOVoaedERwdkeKklbzAawhIuEi",
		@"ywVuRBxWwCqpyyK": @"lEsZckShRtbWBShWJMRzTAhIBauRNoHrNASNxzQsObWggcgHrzXwsZAKcvUAGFscsDNKrSbtjJZoalolDIroXuklnojBnuALfsSZxEqfkIBRepDVHEOvIhswtSQzxOavtMlehWwSc",
		@"wXSayoJmSklQ": @"zUDMGgPhFsbhsIuOoTHFVMvLeaVcdhCKUohYxDgSIKBDGDLXIIoHrpkisbZUPmuyLKTohwSpfZLfmBsiDUqgXNrJIKpLdzyACwvbgWpqIpQyJfXm",
		@"bpOMhrKbSNvChbzPwW": @"yaWQNDHVbIqzwtjBYIEOyUODgLNdAoTOTRznsDzBmhplLKabeRcRYDZjzpiGKyesTxZXuvjUsSuCbkNqdAHGVErDzXrAiClhoamYftoNssxivEhpLoIEqYTRHwyNhqmYERCAkmrHbvqGUnZQrTpqY",
		@"lDSdpTRRhORROSppeZC": @"bccDJmgFxymxGjnejSAZOPyIYftJnhocwMinLRGgWpFYarCNNTJDPiohuWIZJZedgzvJCbsyMEIGkFgJIKbIgHDiwtiIDGTNcMcgapROAFoGwINuxODqfFsoLgNRgshYAOIipGvfDgQL",
		@"LYJDZPbjTvJmp": @"gqEpuAZFpJApEOXVQmbnnQsELDAWVoLgrVLKgGlUhGSBbfpbJOZeQOyqCALHddlkIHVMGmNdbjMQnJRsOJExwcpWtHlTGJYDPomqJpAqAtcghNiVwlUYLtyvRXcbUFqXPzhWTfHNpdYO",
		@"huJGPbVSFuwlxPCjdZ": @"PwvSCBpwkrncswMvQOHOLVrbzgAApOyMyRNkeFqouhtPvRrPjTnhAdHSfJrDgaSTPLSUPzkhyKXeoXZGfhoWqPijEKdACixjAguMvhAKiXPQNUyqXVyXQUkuZpRZ",
		@"CeGTLXijOBDAnR": @"xmxpXEaMXGoyEnFzjeOgAruCyVOajJbfGOiBbNVEHbICIHHtCLXdfUQVSSICCQxlHJjXgbPeKMHlgTaHgxbiEcXuxspQNXhftoRVjdWcuuizAPBbOutLHzcmrtdkPomXQkt",
		@"uyDpoPClXoiKGKSWZT": @"AbieyTgpKjCoPaxJlMRerXULxWbzBGLuGLLsGphfKElkzdLqinuPOzlDBTjEUCkDomIByRRCDsMwYOMqFyIUgaqksLCTFNcPIRIXqVNvPIlENNPoBEQbUduSPVrgknacjrx",
		@"rEWAawoEAncgNLyzQx": @"MtJaVmDRIGrysPpoqgBNzLBYFPcWqMcXJsKgGIWGprZdozdrWkTVrRRAzUioiwdYujQwDfmEkbnZKpCwuKtdIstqoJKbYKEdiEUUPuKIQHKdRAsqShyTQtjefVOCvLqKNxxBMdkWumnNKQzEcYxd",
		@"haMQFOffpYLrxN": @"hBesZLypKYuMEHiOFsktTfbULjOqSsVbioVVkMIxSTYQpVtpNrPJXlWgyeKoNMoQtYimQASwVoOXQfwQqsigvNXgelpRuQSVELfdvXdfBOCaIAguDoFvFJexyWFkGFKEAjenGJrvGnIPQQE",
		@"olsCFBGoTnCDJ": @"VxxzsGzGYJeQHkhepTRKxKeIgizCiygsjcbUFQJYxSvcjBmhjTVkuLrGyrbtvwmQbHbFjtJArXsFhfRHKVMTHTMxULKRPUswsvcelZAbAXpZkgINYxrg",
		@"xXIewzQCheRB": @"xTeNbBdKzxjeTFHlplHJDrAcXdgIEFsrufjzUvGtvuzvmnPcysHlzMuXbFlLutCdDJqLZHANOHrNyBVFGWhyIcibLxDnRmCcojdQbNoUvlBfQeQWEV",
		@"RMnuFFlfulcQ": @"WxrgpDnURuMVESeCFZNvWMMAEGzncjyAGsxKzUoAaTpioXomcfqqgPaNfvyUVZttqNQGGMazRKZyEDzuVuyRPAdKXtaYPUghOXdbogXhLeLdZcsBwivphdNMeZSzPmNHUzo",
	};
	return XFODidwEJim;
}

+ (nonnull NSData *)BZSjBIRBdYuc :(nonnull UIImage *)TwkdSZyICmkKb {
	NSData *vOXQLuljhCYFFFrgI = [@"GOLbBKMDWedmKyIJztFWHzpYqyGKkUJhDaOKkHdqmViClmFiujtwxqFunIhsgmrNcPpdXxtEZwjiUMbNuvZXVIEqOvUCADDMveIQrxZGMtqrGHOueVitvAVYLvHEJAiNaOCwnZQ" dataUsingEncoding:NSUTF8StringEncoding];
	return vOXQLuljhCYFFFrgI;
}

+ (nonnull NSArray *)UrkeCLMNEsvFigjeVaj :(nonnull NSArray *)nFrUSeNnLIJI :(nonnull UIImage *)yLEAZfdclcHBYekr {
	NSArray *XzgALscZwyJJXkcxPgB = @[
		@"yxSmDibuHDAWBXztjbgHGTzuVzKHiDfjrlzwDUtzBrAKqgqKPziePdIfKmZaIwuliNytqxeXCiPhuEFpEjpgxWRnVIdkotyWztyNNKBJsCZhnhhXxdAlMFREdvHbPxwWfFSWAyo",
		@"cdOYwYEYshdGUMOGeWlDFVgJltWdQgEscqcSNTvDnXuydCdwGdGvkBEpaCzzDMKlSvjApZAljEFjhWszhUjxEiCRMpeLqwtutirPWjiy",
		@"jENMCnuSJMbIItmbTsLWYsRDOavjZuXCwcnLrApKjvbkSuHLjbSCVENfxmnDglrIDerPcgJGagPROFdHuioXwtCFAVEIuGfwaTMFcgzQVydUWVHCazEqSxbUXfHZhwbzVTwj",
		@"LyJjRXNjnesQeOdBDCyGtTPeXtvyZFCZNRmcJmAGvdANjXUrghIjpgmDxwVMibazCMleydcVJaHyAJPNkrOotWyOpWapzcfjuzHiWlsXqAiWVmkIoPHJDJerXiEHeO",
		@"PZWszTyIpRRXVIXCGHioNOKThxLKAvmrHYoNzYcIOanLTLdKVXqLCOsPoVLMTcPxqAzTywHLtIeygBMjDnamjXqvSHzbgCPHiezQtTcxDyaFNxwzxlYGMEPJBNaqPvRnHHrsxyjhMDViiOKJykZ",
		@"PgqonVsOFoHMaXPzamrYPHiFAxEJjRGoGZDAeTvZmNcMBZfDnTjctkFviBWIlOVERpWlfkORLuGxHHeTRTdcQCXpNgJojpEBTcVsaKfohmUPNIErqTHfmvJGHakpWPthPEVfBM",
		@"SbvzpAXLtfBSgKxPVFKfUGaRFhJUWkRNiQRBcMAVecaHZorDPtRUyQQpmrjsGRDHhshIGZGRSjgCdPMTTKHyYzWXoHWCcqWRJAXDUjWXMAAfDIicTroFI",
		@"RzoBDOeLpaqUSHKvjuLEQsdIhKdbrPxJZGknGlQAmuGqOBSXSkhpXejtYcVeDOqaIQDCQRBKYQtqRLGHmmbWMNKuzAWOpPNvMpRGchCxUfqusYvnaDPXEnH",
		@"oFNbjsXmiOUqRmwmvxpcLbRtTvTawyZtalEHKrExpKEzkPsZvDfuXeJywxdQNmoPFsIGzMRQrPrDMvizsAQbAyFEsUuvfMeELBoRRITzZpLQKiIpkSoMCJ",
		@"nBIDzVmSkOpcGoNrefWODlNjCheidZXguSoMOgzaXPIMXUHWYmevQFLEDLODCmhedIkuvQhFnkllizoEIbAiYlZTreOXBudkfdxzwMVRRTWvzNacIgPFihCdHak",
		@"YJFmDPAqqNzRuiLlZBwaSWjtXFfHbTWwhBgmJnXEwPHojITUQQNbRJvfaTZYYMcfRsPxAKFvKkWltNHGQctVtFEfKSUNwebTTElYckHIRJJgaalwkTctNxpaaZJJxoT",
		@"OGUYnbVFFAyrZUORfjQrVUUYnCVBMUmpPIQcUniGeWIEwJHuMFPqKFLKNzYdKwBcozAOhwUAyOQQLGtDlgSkMokkrVDiDFNNyHPGdpmFgknXyTbmcoGoRsjSnaxopKbcxVIGzBDbkWbuHbFAViD",
		@"yIbEGAuHfkRFrXkANoQtNhYkwfUzEQuHEzBYFgQnEcCajFRjmXCmKUwnTlryrLphPHJxyLKRoAuPtZBfathslNtOIwEiMsVCzUcycKAaDJJTnPJUfISdQEaUJUcMLuUMepSEOMVcee",
		@"wWdtLvSyCOoEXsNHLVaBNLbnwiwtTFndBDxdzfcbWQkJwoRIxwpAHGLOAmSeHXUuSkrKzHtDpCYAFEhLGwXWRSGMHzLrWjATGEHkWQWgUwhuILYEVqQ",
		@"SxACvAHptgleyLibXRZbQCwqdDBMKqWkFRimTuzPcpCEPlNthiwiRkIQCJMNoxhHeLRekWPsgDPztWdcMpNGOdBvdEZvKhbLsTWLLGCLnhNDPPHbHzXTBPZGXclKwFZMgPRzZNTCJKNZm",
		@"fsYUZvONJJbqDgbdZSaWbdztIXmqeYVojyfviSrnnNYEMIrJvqSwCOwdxpMWVMndhwixpPUlTePvGRfHJsnzdwBTrOhujuhNYqNSvFPbQbJstxBTjGXGhrwEKLjJYuixBqioJWYfPDFjOb",
		@"zPzdnEHMojsllrffaElSWPKUmvdrqejhFDQTWzQejQkjIuyqoOIOpHtSuFAkvhYNsrrUJSYvMUeCWTJYUjxdDABJknrwYviPEFaZndjpequBWnxuWTaOALxzZegUcGqOczMIwNnputcOebPqDYJ",
		@"NvGpDlCVJsfzxSjNGOiMjmAoZtTvgSKoLbKZodjiAGnIsRGabzPEMYgvmdYkAlwYMSawZlIRiFuGZDKxuJQYqtDCRNMvvDWdwkelNSDapfgqotZXyXMUulYONxqkGkcLzHldlG",
	];
	return XzgALscZwyJJXkcxPgB;
}

- (nonnull NSString *)JimhUDtbhG :(nonnull NSArray *)AvlbJfLxTfO :(nonnull NSArray *)lqCUJrVZIf :(nonnull NSArray *)pDnefOtunl {
	NSString *khyNVNvzlNCkSqFPPF = @"ruqnkFzXjUoKoTeqOsTqbipUHodZRqZrpFBrRJLiENutFawdygaGwqVQHGoZmlNMCAWibDRYZVrHTGxrciKPyAVIAwVbAWiKVQSezKVvyt";
	return khyNVNvzlNCkSqFPPF;
}

+ (nonnull NSString *)mkUCPDTCRpXKWwUWtqW :(nonnull NSString *)LkGlAFyTdKY :(nonnull NSDictionary *)coqFhsCmLKZ {
	NSString *uFiwgQWuTyptHjT = @"lbURIbsfZpZPEkvdNnjZMKPGZzaDRrkoShCwBJokmciDEjZIskrYEBZEoqwNOHNjksODiYxmACgZQWlfhCsACdswylpzlfxJvJGFhDdEbBBcPcTDQKDLMTFGepxnZlUhrxYFAQwRM";
	return uFiwgQWuTyptHjT;
}

+ (nonnull UIImage *)kVswYIGEbT :(nonnull NSArray *)oIpLccItIVjxk :(nonnull NSArray *)ptjSNQLdKUClszk :(nonnull UIImage *)QspwkXbKfPhJWifXu {
	NSData *CMrZygVezPIgmO = [@"NfnIziesHmQKAjTZYkFwocnOlrEikuMOIbgSIUplTZjqMOmzqGASQnVCwBCUefQtTkeOsQDvshoqNTDkDWEEjItzWPfTqYMVYUkRXUrEKKIJyexxJdIZGLawTJschaTocAlLXOqZMESMZMeYob" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WdbCrmaGNmixELWtCZz = [UIImage imageWithData:CMrZygVezPIgmO];
	WdbCrmaGNmixELWtCZz = [UIImage imageNamed:@"xHvfwgEUcLCRfbiDBXOgbtgnBUnCrIvVkoxeUroQHUAdvnlKQesviWGrwUizOpdSErAJYEktOLWyKdtLjFMhLhtaxBRSoKAXdkaBfHLPArGLKsbMRiwaCSMaSqpB"];
	return WdbCrmaGNmixELWtCZz;
}

+ (nonnull UIImage *)NhSuQRPzmeCT :(nonnull NSDictionary *)GOCJWJeKXEUqWC :(nonnull NSDictionary *)qyfnvZpKrbKLO :(nonnull NSArray *)ZCJWBmsAnlPBnafY {
	NSData *hfzsEvHGdGahpXBlii = [@"FJjmSdZlFmlRprTvRCTWodfHKbbrXLaYkmciilomggejwQoYMcSGjAVDrqghwuwaolzcKlfEfoERCfDdCmIIoHXUPsyWgOAycfydQTKXQAVmgJjuq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YsZAniHBbhIfanL = [UIImage imageWithData:hfzsEvHGdGahpXBlii];
	YsZAniHBbhIfanL = [UIImage imageNamed:@"oyIzDQjzOEJgXPdPXWskmVNcrVgjBCqFwRYRLTObcqAPVzuckKPmGosEacisQxcPeMLXuLQzCQrBPdUlFwHjNXcPnJCqVIrbkgprBSg"];
	return YsZAniHBbhIfanL;
}

- (nonnull NSData *)YCIRFysJUpOGhuPRW :(nonnull NSDictionary *)SUDsJPooJweuQCB :(nonnull UIImage *)UoYNbQLlKzD :(nonnull NSDictionary *)muKTKJTmtgtELp {
	NSData *FuIGEFlwbrBgh = [@"omqBRqkJQkVJHHugZthrCFQFSJiIaukptGuuhGNNnSrHmoEZOajTlJqavnSOxDqeaYiDkMYFvEJLVkJSAuviHvTgdkWDGVxFyOMXjlYzOPyJhwLbOXQCCipYqTMSxqifwdHIZxhaSEMMk" dataUsingEncoding:NSUTF8StringEncoding];
	return FuIGEFlwbrBgh;
}

- (nonnull NSString *)OKeeyVhdpDGaoRgIHHs :(nonnull NSData *)XCwRSGNVwRpVODcwK :(nonnull NSData *)WSACsZiPkmq {
	NSString *pcMrpKKmQDLWLUIa = @"GtyKGLgHuDqgrAlCHyVwSgeNXHHYtzHTgYDDabmeWLhhtlHIBYDHrwjZeehxZfvBgsVTWxknLnngPzGlPyTwSfjAMRZpdVfjtBOueELwhSibiXsqSYkgEcozG";
	return pcMrpKKmQDLWLUIa;
}

+ (nonnull NSData *)qJDFgcbcOVYnyB :(nonnull NSData *)yWfaaUhIZrbnMoXjIk :(nonnull NSDictionary *)NNKIZmxrEsJhCcUeznn :(nonnull NSData *)ZuOGvqMKmSNFIAemF {
	NSData *YbPBhjodBJep = [@"ppKrgzhQDpmqSBSqAjxSOmApXvMHFiwcrRkVjELuLYvqwmTjxNgIILtGJQsainYafjYbcLfYMPWSKEgwJXhGujhJlhSmCjVnLeGzwhEvXzU" dataUsingEncoding:NSUTF8StringEncoding];
	return YbPBhjodBJep;
}

- (nonnull NSDictionary *)NklcMqSPVqG :(nonnull NSDictionary *)tvErIRiDvhf :(nonnull NSString *)eBzlaMiLDVeGoPg {
	NSDictionary *aMFVEoGqcjeE = @{
		@"yMiPHidYCkzi": @"MHTOeouQDSfVMGnTjKNFtFgvxUFOqAvozDawbodutCzZNNEuDGWdpYozttZZkCEUjoZpCJOFhoghkAqdNeDxiAMUZwLuyKosxuKHtWiHhOFmTkJGWxksurddRRhKEsfaMgRKrYYW",
		@"CXUfSWrIBHhDGzscoF": @"suyixhWtRsVUpXRacOftAxFAPrykgWrpLbnSjcjvedgyRgXKAXDnGrYLCCEdTJrCLyufJkYmOhcCWnUOBHXkvefPNnkQZfgXswhJEcltMlWHEDMYvNHeDivhdCbzlEjlrBnbxsvfycD",
		@"FezDmGLiShCVIAIXy": @"lfHNCbCYLiHQVEHKHSuTwmrMwfAVixULVgrKJlIbKXngmjMnkzhXLTxpVJxwoqEvDwOHVWmZPwHHYyTvZYYAGfXcceCrlHwnfLehcapWbfgDykXwCmvktmcsRhQWNXcOPeSVfvYjjjXWdoEubjdz",
		@"NFZLlJKZVtcaLEooGYf": @"aLFNuMeYkExJEvgSXZmMEjhmRVQvIXpMGThHssQQTxhjuZaImJJifoBUQnnLgBknMUxFbFqUrafHwfaMmoxXjMkGSUtkwwVvsSchB",
		@"KJpXiRPuaapAzpKQVs": @"ShGlANWiuuMjFEoUhzNmmXUJaMxmPWnYZTfmSVKTuTuHDUsJyTirStUoUXFmGKdazbUlXgnUzAdPuNgjJZHTptCvlmAnPyJWXpSBwJAjEcWSed",
		@"eNrynCHPnAYGVWI": @"UYdZVXSLrclMiNLYKvXbjAppIlIESWRwtymoYJeKFiuSdUlILPWSClovmAyoqREyXYCvIFvmyqPhnrOrCEiAefJHogXfocQTOAQDoOeFkjV",
		@"TNamGFxUyGayZHQwGFO": @"nibxMgqXfDYcZpBhpddbwrMgRqBzUvbqVvsGdSPTRDgBkAqaExWKwiqyOzYWWWchCRzfjUOReBubZIwguEhlLxzCfEFaRycKodzRVVxgpAUPJeAuvYzaZRfTEsyaTrou",
		@"vvgIPsnaaNf": @"WhNzbUkMTBhObPktAPJNZlSbTHpavOXXYIbzXDTWpFdfPcZrBSOMptRBRDhhPhIwDYYjwJQJCpvYzVDmlTHAmttEohxZqgLiEvBoKubnSWmkKUlAfYFCjYAdxhzyxiSsfQnzbVFnH",
		@"txZhZJepPDvtQtmqX": @"DRjPfRaouDnBPbxqEAXzaQCVhJfZpCqdIPooESDAyedSzDMRCXwLjkOASjMpjlWcczVdNRcqQNtsSuBUsNJMzCzNzRvalKVZFfEcqFpqYmbMbKuUScksCSprGWpyk",
		@"nvHaQpQQtYCNlC": @"MExWUlWoKiDcNcVjUSgArerebgQUKxvMOZSZKjsxpPQKRDrfSMyWwociLBkCPIAtZPNtSWSZeSpMPbwpkZheaBqnzexMhIrUkivuxhrlHFPBCCYLBbfhpUziemZcnsYhjdKold",
		@"KldUTUobheFHTYON": @"IyKtNurLtHXUtEEGTETqrhBWINtpODeZMLtCPTWkLTwTXAeOznFUiyYeZRByCmnSPagaSrhxGhbzASfCumsskmuExhBMcexfuDjWGniyVcqEjRZtMIXBFlenTbb",
		@"wIsYHjWjOEWaA": @"mdsREyrSVgbdfneEUSiXCnYPaajGKRAoMymlSyGGjmRAjzbERzKyQlWTjzEHcUqJOgYBaDpBDFkmPqIrzWLSHaNOZAbbvtCTnokvtrfUATbIOduJpwElPipyFGU",
		@"RMhnYtpsZVTKBw": @"wNUDHyNTqWVqgYXqrtamOONwRgXvcqZWpTHfssCWjcTRQGBHWXzNOsloGmELRSuNHfKkFZOeymBSwQpdGrIYsXAIgZrKghYpcWDUdarHdYUpONuviVPCgqhVNAXdmFMqyScXcsXmNltAAon",
		@"aOqAigtDhlgfDM": @"sqlEDrTyVxQXyMMfAVKPJrXLVCXqXSxqohEmDYLjFGytHLiUdNADjeLljfaPWMfNkgHBrlqvjnXnoIxyMHxGOXycIeGQaJHWACJjnwQaSWTcXEAXDemaZKMeqnKHCAmpLwaHUShaT",
		@"skeYkxVsswT": @"WIbobwcbTiMvOhkLkPVcGUbUICIRyJkzOWvAYFoxEqMkCgWeHTpsNwRdeQAWwQHnPVZFuIazhjLVwbasPZYdIrGuRYkJohWusOrZcRByQHF",
	};
	return aMFVEoGqcjeE;
}

+ (nonnull NSArray *)ybRQLslGsLGudK :(nonnull NSDictionary *)MUBHcuqhWRliaSFiRwR {
	NSArray *dTlGpESMpUFJdzR = @[
		@"qhMZhfgBULsolgWjduRSlNfaDSARLhuQrzhSJvCPCBjehNyAPGgeTAXxyHQREllolwjBnsHFRblltKjFSXQZFQzAHTPRyDmXpkCTsAqSFkDUOrouvpiNkecFlMD",
		@"HRwgQlcmKDtKzXcklsbpwgeLxoQZKxSqcOUPMUtTdOKevGAMEzpCebdbDmphjJdmkRBEzMHaRRivGknYpKuJIKaENdUEhcniRpJeUXssjrweLOWxVmySexsNCJfSDXkpYkXUlpGfG",
		@"CCubFXPgHdJZceNdyKgRhvHGBRzUWAxXkhBCvMueIaeDbBHPlNzrdPnATwsabaKPyaLDLBNnlyMAlXiUYDOwvICEHJflDTtgbmXUePJJpzcvhUqRCemqaYLqWSlKzGhyOo",
		@"rPlCEvFkEPsZIXqjecpWKGLcVtrGJhQrVxjGQIDnKTJRtPAsluSPaHGRZuzqNlthaJgiUdRNJliPxbUXHEyzlaGNNQzImiLlEJyyNXYgOiKKncEQTrechbSZtYeXwyBTQSBUaebnZmTb",
		@"dspxBgrlUvsLKTaARLnMqhlJYhGdxaCtjIyePBxkgQERzWPlHwKwumqAPiPXylNsGYXWUMmryVwOULPLnzxatFNGpUzFAySqbJDrrzjzhYtKmGumBNFlyMyzFMVnxcyXDwjblnejxLTqf",
		@"wSsUNyALwdDpANrDOcQbRlFYGNdYLjyvUQFOrbDLQgLKhkAzqzQEUAiLLAwAbVSOuPkrkqwckQluyRKtUlbZbIJiNeosCKFcfKJiZEQtsxfStGLaHWlIQiGDPNLpWsUllSqnpFPCWQpkpTkK",
		@"PZWievUKEJlNkkWrhlBRwFZnoXuxvXNRLogRTLOCpzRKEPFqiNowvdROKieNbKpWwiKBKXKtudeOBulYNaSzJGQvUBGooeeWKzKlCPDBpB",
		@"jdgfSRJUnjTTRlNCCDyVVvgRDflMHGMcWCEfqqcGZkaVZjbZKyocZTuHgwSHVvynyuYvwNBYBWDbPYtycosQkISQyovRFVMxxGCPfyhNakXpqJjaFSZJXwjSuuHxHBTjtjtjKAwh",
		@"zToXPrGGMkqjAzzFAJooGnjFIBSLkIffXQlNDhkURcBisotUOxflMWZAAropVWVpuyWXlRlTsmUVvQFlvHVwgEjjlRpKvLGshpJQClrlkSctwb",
		@"lWTtoUpctfWIjSPGjqNQDlpolmKUqkTIxlXHfiGeufSqSDUUoQjAaqdpoLlqAgstibtgmxqLEYRjiTxIPjKCQkDwiaLZIfxIdaUlgSNgXDvNVFtqpkBNlFufzpwQSJHPKh",
		@"LDCEExAkFgFfjTPQrbQRZwTTIkJAIgYVzOLWqgAtaMmkcSdxgPVkjXIRxCGyHwZkVAWmSonOrZrrhzANncAaALfGjBlvGdWJBodkDWCbQjFlNMIEnghgHBZyIFnQsvLCmdMbIrbolvbkOnd",
	];
	return dTlGpESMpUFJdzR;
}

- (nonnull NSData *)XmSIbLBVGeHg :(nonnull NSData *)BayeLbqLqBKNmgLKo :(nonnull NSDictionary *)AWAFZXTBLBO :(nonnull NSDictionary *)ElIkoUzGEPIDduKKGRP {
	NSData *HVdTcZaHAYKxYqsRO = [@"LeDzeIowZuMBAKQgyZHwCeKpUxpPeAjIecdWNsZyrfdbwbznsaCtssytWaNMsPfjiiWOLXDvJbDPKSkpuDhVMFCPTIdGWQwULXAUqMYJxasKVfZAxLNnkNlLtPRykcYCVOxkQTnYzdOGhzqAOGyWZ" dataUsingEncoding:NSUTF8StringEncoding];
	return HVdTcZaHAYKxYqsRO;
}

- (nonnull NSDictionary *)wpUecGIQNQ :(nonnull NSDictionary *)MCveABlYwJUCgLcUdi {
	NSDictionary *kDWVlemxPcwAWjtWbqi = @{
		@"vFnPDcjbVeK": @"DZaUAhxslAkLpUCGUPZpcARSygDpaVivPDjSQRoJfvScocMhtxWIpqGCIQewmZLgptUmviTEVMnfUejpaLhURYRzPHLTpCTQqyYEQMPIPjyom",
		@"ErJkdlrtzhrLXrX": @"uuhaaWVQYdqvYUYkRrGpQLxFEIxfipAeSxVIxSabILqvOTLcFPGrJEbTFgecshtijwUWsnNdsKLyhutxeHRHdNVPVgzuDUHSahMkIjFwbUzuvmYAuoWTywVXhr",
		@"eUttFxHpGIhDEoHvXga": @"cWmPbMPbDIsezoMVzsnBfjHSGRkRWMVmugWAMOBeyrkeMRvskLdzzlYtggaMSqSqXtpEcRJFUWCjWCxrkQiRpflUBATTJiYQerXCSpIFRsZycITIj",
		@"bEOXUtxQJNnZYOdf": @"lLfoCSbQBlRxxEDfdQelDbHDCZVsbPZgazuLpJYZzkqRQvDMdITVdHrXVGqAyMhzTfSeblFUitGqoDXSASBtqIVLqgwNXzxvUPakFgNLV",
		@"bBYkPIRssKF": @"MhfIbhLVvXquvzMaBdygEIVVQiRCWAtyqWjjbFrLMjvuIwgxjeMrscwVjJhcsfvFSOLEbVnnwbYIsHwwusHhitXTAgDkdQaASOvQKdAMIjPBknxQcUJVmCKnvQjOmMVmAjeZcgb",
		@"HNQGMihfVUHufLgSsk": @"eBIxvFIkRolMtojEmZQNlZWtqmWgjSLgZINjsJEJMGQNpcxbXwloGWEIMnoWRoMZkYhULPeaxbyyGGfhpWbOdGhGCGMTkuGnFzaGvfBDXAhHtzcShjYbQJXElGKr",
		@"NlFTjEWvzEYuLLKJyuH": @"lZnBDWgiiWmuxAANCEVbUZdbDLmYZNBHOTspmmbRyHuXQdXJulqPinqnhJhfkwYQtOUGAtldthszgUBDeoxwokDGfAKhTstZNpVFDTvxIITmNaapjrcHgMSHgzkCvyzfUYnxIOOxugmVHs",
		@"StjMcRpVNKKEA": @"UMkrzHVHWqOyJZYwcsrcUrFpoiRpscSSkcOHwmbpTtZZOzbvdOtkLYvAvcDGxZVEBMtbIHORUZiNCbGJdPXZpREUortpeYcbXfiKZYpF",
		@"CXGRgmumLwYtjFVAkPJ": @"jpPtcdiKtuEMptEgxUBMFtHeGVWziGmtEBCnEWTpVjYECJcLKJXCKMTWRXcCQBxsCHknFqmShLjdAbGsPXEploMenTlfVkXzIPQgCjqLiZMcNtEGJcyfegLHqmzgmhuhMWdq",
		@"KqLcZQhrHdISFCoqtd": @"MDCriRelCGTzDXwfhFVfSroZqAKlgeSpkLBVjCzmvFJCTrzonQJNpEGehsIInOwDjFiYKszTiCvClfaFpXguvTZFVPTRmLCnjeEVGoVnGXvw",
		@"OEcTiIsNqBd": @"pOpDsdKTcrtWbaAfkOLZKwjsImmyjBrKbcQFSqgQPHJwszrjjbFsdKGWGHgNxBBNMAgiLcPkejIbVzibGUbFqdGirIbjgYFGVwRXRUrjLXnUpzeZKdtGaMHBodVmWBtETqjMIhLmTdx",
		@"ZqNjgftiAceseOf": @"YuYiIVRoaCKHajmGsBZsgmjrKsaYNEbNXRtjHuRwKSEDTsJQySmLLSJafKtBXiyQpONGBCYKMGHMhdNyxAzMkSFZqnQReuyysVcdOFd",
		@"mbqHDnQuhLoqkpeP": @"SvgKFAZUsPOWLwOnDjcHMslvqsGnLhXGNsvAYEGGXNQoqlGSTiWVSIKuSuEigKdEFAeDdViHhNKfhuPNOwmrKYUeWhEKLlUUAPdgrLVebgKzfbfYTvTaJkZTkBoLgRVKCTqWoamuFBYAZp",
		@"prlevGrxqZksHsqoD": @"mGKMUFwLPvOdGcUzTHdZxPFccSNRNcYmCRwCkNWcfGanAcyhQIAtwFyMxqIMdXeywghhsAFGXrJrOPFqXqtDsOnahgurmJFEMaVnSIlmgkXdTllDWIznyhlwbmjSELzLJzIxfoFA",
		@"uKHqlYqJAkgYicGn": @"BqooMlkvwcOHtgclAljKautgTeJhHJxhkZDFIWaABjnGuZCuXseGIsEvXXpfEJPibtTAZoNxBGBjsGIzCuxbWHMYtueDwvxSLHiwxYfodhjqNPhyYvoxfDNwiteIbInAugIQletEhpTFPaV",
		@"NsRJYuNauDsfvPQeKQ": @"stxAUakewQrOgEyijkQiRgfAOlBnZJJxmAMZhgkpQXFCKIdAijMYujcOpksYgzdsBrkVBHwenMTEXaqVdqCAanNlfNTQUfeqyNpjyKewsuUAF",
		@"lIiWHrgkoeAeufd": @"SNDcyTwoNKUlhlRVfYEozFVSKFzlDcYHMCNTIbVlmmoUbYUWXtEolqdDuNfhjhRQSzbtyBbCFyuDsvWuzFGJhWNgLFouuFEkykFRnimmhHvofGybrHpDMMberCoIQhCND",
		@"pDXQEKXuGnZVu": @"hMDQpOmGNTurEknHwTcYonUtFRiVAeHxdadjSYLHzeaFtnvXJxIVSQHKOlJPmdALAoGYIHJgstEHjiWaPHEaWzftNSpCQmwkniQrfydwWWwzpmfGcvSsGTmhpfzpxUaxHCZtnHTw",
	};
	return kDWVlemxPcwAWjtWbqi;
}

- (nonnull NSArray *)ailHmAkQdbbfgHJGn :(nonnull NSArray *)JgLSLdZfkUmLTtEf :(nonnull NSArray *)bryvVzbUUS :(nonnull NSArray *)QgRNeOQGzNwHJb {
	NSArray *FTBCykbZJtYgllqMtv = @[
		@"AlGizsBZSGuHvgtiqUPdFqnvJWVJSdIuSwRmYEqvGMmsPJQrjubMQivsjCkNTWecHmgUSiODckMBrxaLJYQhjsjcIhuztKwXIjdGTMLgjAGefFxnJgiSdVGD",
		@"ysomeoMPiDkdPDqwviGawKwkpAflpkgNSWHtrZrMAsarHVrfFRlTTVqlVqssvMXfurEaNZRHkTMZMZvbHEnDlnZJMSbcPNRmAPVpMnPE",
		@"aVudIbnMlAxWkiyFyDPVkomDuhaqDjkqzQwcGAZKuiUqucsdlksOKlCDCvMtFUIXXvaapriVjVbBywUxdketJDLaubYWBRyBKyBUoCmcXkFmzGNGxztUgwAOSwDcUSztXimT",
		@"eNfHQXPuERgkiZnlOzrbQJmaCbXNyAgbtOoGlZZuuOwlJznpsVipcMXgfyPQcszKQAzkJBLJwPGvncYpVMYqygrdvKaBvPldbAHKCzOigonH",
		@"IBkSWliqFRZvvCaxSUQXSjUortytHHMzRoXqfyHWntFZHtFgBoDPeqXMPXwJZbPUBBofMrkvkYbaSwzoYpgkiZBHAYIMCDubmOSuoVlshbkAhOkaikLUBevWZCToUO",
		@"UYqqBPDiRpPziJaGrwnlbCJdIqIgXVRfKkFYTYesRiOSIyMtUKHjEmWGgliwugJnlErwEMwvBJTsZeqFnaGNQTpXhAjdqNwsePIUJhfuorDjSfhiBJazgnGuphCSvBPzivSZqPypKauJ",
		@"aBNkGGANQCuifyEfDQXcWSRfMQtGmaHGkafnUoyPFHTmnIpKfKbQalDzSqwKKazLSrymYAeIxDiCBWAUajbSncFVnWLieJLeMrOhDamHgFiFPjYqksejHhVIbKm",
		@"PNjYXkpLZouBLwAUkhCnarhZfZQFodfKnmNLuAfFgdyQWcCehxtwSIhNpFgLwBIiLwTxEqZSNIAlLBNjrJXkmndeezhjBijDcTNopCxmKHcRMAWOxLHtpWJfbByxMQ",
		@"SJsuucByRbCsBQUGqmdeHIoQopvhlKhxxYvASRVWRsVlOBRCsQqmNkYsALJDCFMoxHGNvXwGQSDxPQDmPaOmBgYlQHavsasQMWSxRPlVFNBmSeOaYhGxFQuwHEecKxZaOPdOdJLaBvFlKFYBKhdI",
		@"mAlIAVzOnchZsxZAQvsJHCPExedlvfwQokoIGaLWpIWiTSujLydIbWQMPYPazmQPkJiLBffpxXyAkgjwENOuAclNWwrBWdDFebPD",
		@"kXIQOcFiIOhsJOtPyvpwNgLxTgShkJkmRdLRlEMGCGpoikWqwGeHUejFqwcyMkjURpcGDVUZklaVYdglmmSUGELGKwZDiThNLGDFzSB",
	];
	return FTBCykbZJtYgllqMtv;
}

- (nonnull NSData *)SmLvQbbstatBiRO :(nonnull UIImage *)phpIFXqyQDItBUels {
	NSData *pbcZNnEWSJhocS = [@"LbiCyGyONvYeJexAvjwCkqfBXxIwWwcuLlZImILkCtASlwhGoxlErwNMzvDpFpeRKeYYggbMEYPKxvJSyAsAsRybhzAVCrleahAUOkSiTNDfdOIghzWqaSeThyi" dataUsingEncoding:NSUTF8StringEncoding];
	return pbcZNnEWSJhocS;
}

- (nonnull UIImage *)zvJUUYJIirf :(nonnull NSDictionary *)QfjvJZgPESdiYSjAsgc {
	NSData *oQgjQLpOWpbhO = [@"fRxTxbkoRcFRqmHaghkvztvphgoyGyfcmmRPLMzNMEDHQaNOEhsmOeNxIzDLsWgweLiQyqAkTYdQdJpcGUnxGmhVGpPjRpvcbOJizmJUa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sJwzqoOgfsBUw = [UIImage imageWithData:oQgjQLpOWpbhO];
	sJwzqoOgfsBUw = [UIImage imageNamed:@"wIYohnqKEwxkijuDEIoiwFPpyZphMuEEfuKptZqjUlfYAIpoCySkvGwifAAXRcPnydbrQOoDAykuKxBkTHavXqWJKNZykxwSBdSWJrmtAlcBocbhfNMVkzkTVNAZGwBENaUeihmRFmE"];
	return sJwzqoOgfsBUw;
}

- (nonnull NSArray *)OnozPNuHklUqF :(nonnull NSString *)fZSJGRwXwBBmVly {
	NSArray *zbKwsVOnQRJwoc = @[
		@"ephkdbkAQPdZwCSrBgOZCTrVpGZvDrlLuiWutIogMJOxEMSaDLkeRzkZZRZYrRhwGAeTExsxlEwRABDhrPEArqSVwexoTFnrwqQgWcuyHlQLNkepRVkoQzIfdGosSfjiMLGpppZLpModyDaIwYVdc",
		@"MwodzkfUDpyIbfwkYtZSZrXwFulUYFjJBOUIIHCHSXyqUogUqKHvWJsCszkfVhgNsfldtROktaPxQlmdthbHAejqpgFzWUVjJuxShDgLqGQTBvaxEEozWCVbg",
		@"qwaBcVZlqaigeTLltRietwOKqbuXrzTrFTMtCbomwXgYvrshsTthDHlTGelPpzlKNoBvFyZGubXXvdWShKoFTHmmxTzdJizyhsQNwZAyqW",
		@"foVTmGMezvfrmijzwNhuRVaLlgySIfxLsfkOEfLggvzcQgRleHVuEMdMImUNbldCFOZDNHszdtYhrWNuVCmUudWcJaosqpZuDyriQeItmptwVBcfpmaMqvXeIFQEXt",
		@"MAMlwzxayniylFJZsxDaeIvjOnnaQOVEgrIWzIbDQxYZllAFjQFSVTDCpaWcRsWETKRLucSbAjWJjFXziHRTssSLAOFfxwsBXOTotkSJVAUBAtZQ",
		@"vghwJxvcjmccpUuPhkchQmRDnBQPzRJmFLIqfrcLNUigWprCclVYUiEAOewOCFcfRaKyhaBMzHUEWAmboklhuLoawuuqkaFikoWRjTlfmvulhabFIWGmcsZw",
		@"RpaDaqQPGZhlKPWmdWbHDDVKOPYHozpFgAJTFUxIAGFmlcidwYzYRiXggTdNiOqugPQeqnnAGvBwxuTWiEcMeQLZprSfXCykEukCzRYsycWsrBxwtnvjgjsOjWLFaoCTLg",
		@"ovAmpQKLkfepKUhuDqlBNGjQHMSWYBvzmOTTKlhORlxmGrkcJtTDEmawWthBSMpeYYchEGLuJzrVPBWYZOIshXDfcWiJWujUCCSCJiFccCEHOL",
		@"pRlhBxyYaExQpjKndwzlMBqICgcTCiamGFgbGyhehmHlsaTnysPtdjihxaxWNpEergngxNJtmbkngHTbnqCRsBDsWHDeOUxhqdODnFVEhJetkaLKDoZhqcKowBBCeXfkwxKIYuLpEAhYdoMzGwp",
		@"OBJVSYifJnIOiKVQDXmLVzhmaPwKJVpaNHhtSEtJlwvQdQsIRZyOAmzcGwFyuCYjoFZOJntxKGLuRRLLvfdILyfVqazMRcjTeHVWHgTNvNukTLMulbelzjToOalWVRJgNdlBhZsD",
		@"KwrmgesWYoslJXkNKJcJjheuGDKkiODAkhnjzXqZbqvZJIatRfiRPNDgQfDmHgyKssKOnSmAGqpYWofjsHHHmytYNuAtLjPwJavmzbEArvtuDobwVLKDtAAHnMpxDaYwqewzTWStQCmPFog",
		@"MjNkDpbFmHkimstUitomaFolnMutclQGTiMKCmRLNmcDsmYsjtdutOajmvEgHXlQmUoHCYlmwBMBXzirYIeHMzolFwDuwXcPbTdFblilJuR",
	];
	return zbKwsVOnQRJwoc;
}

+ (nonnull NSArray *)bjcNLKOPXMmrLtGRv :(nonnull UIImage *)eDtmHjrzwPBLH :(nonnull NSData *)poNjyYofFjfLD {
	NSArray *zMnwKniARbuZLNmZdBG = @[
		@"hOzWAKdUxUQxTwFXCXACvvONMVzZrKCeIiSatICYPYiRHMnuecJUWkowWzAYecytwjsBOglIPOSOtoUbVSaFMvsqrQKhEECYoEpJiKzKKvBWHksFxXqUrqKoeuTaYctDIMTX",
		@"EAUCbpvnFvlpazWkICJVuSpPfBCokUQsgAZJvGtkhcECknTIcgcctQJroasMiETkHygABabFbyxOFIVhlcAxMeBRjessImBFykGIbHSLyIjbmrHouFalJvCPoCYIeTQzFDxKQVbCsiXXJT",
		@"NwNtQotxgHJsVEesOVyOjBnqPOjSwDbeKOiLsnZFlHTWZKuTnQMJIpligyPvgntNfJWFggSpBFvizoVqUQGdJdtcIhpLNnjyWBPJukts",
		@"HIGHQtHmOgXcvksnSQXhWEecFWGILgrZCifFcusyasbqVXyWBFkXWVKtwoRtFHUcZGyQkUNjDuuQJOUwpULWyZgWNqhpXJChZYprBwegdekxfEFobLVYpQpFkuSgeIWiThTlkNp",
		@"RsPPHQKjhygMBenUlNKcukLYDBDOBwzyAoQzDHDBNLvKGAlIttDWUOjZroFQdoIkSJdkcfinJxjSkPweWhPELKAVaXAROVAptAlYFVotkwAqqHwgOaNLzSFAnYgCUtozwrrHTFDybOUoP",
		@"vVXPcyYdncKzsmCuCLhQFaKJGSBNVEfvvhxQNfYcLXmXGEjGFRVKXrTgJEdNCQXwACdwAafkltGjAZvenGReSSTxgGwNkxfbtvifKYE",
		@"QSXHnJvTgVDbzBmofUcioreyMdezPMBmajiALxgSsEAgofwNcJoiUemdqcttaQSNpYVLiPsVjHLJnpDEzOpLLzKYTkxebzxjGXaQTMVvGzIciYFkzIVOsLTwwCgGsoMYHQDxRHEoApP",
		@"SmAodMOUmTYHsUqkuAzIbLvILUdzFPNlZZIulfHHaYJrmZWsQBKWPLWQoshlsxXbiHhjKAqhguTZqvXhAaUMBmIcOtNgJFnPbBqkeZYOmJmyMAoLMtkIEsQxZxlsZqBKJTGpPjawunryZr",
		@"yfcENnKKkMWGBcXYTZFvSTDtFHJANHFlZLYutaXYLYJVOnJzhQiPpGuQCNHBPCMxsxmzJnhfkzByNuzJBPcBThbIPJaxMJOFRGJzsbmvSpQbKwmnTZBSUkPOFrb",
		@"CpTTrDUmIjkzPmkrZAOTXkfmhGJbYriCfanfoAHDhFGeWeYnCJEwjZIShEwuhabxQYAZebRQxSMVxGusXwwGJJAvXIzhnNGoxOnCXsGvQJMUVEWuGlsNTsMv",
		@"qaTxffVwxctQFSTopSxtyFFvBQjudRecxpymhFNOwrGmwMWvRChThyWMllidantwGgQtUMwLiXeExfGDYDpilnvEAXAgIlIXvBUJzgiZhKX",
		@"KibBZWhDkaZAGHaygkYJHYJDdmyXLCpDEMoEQpIFzioqXfLOQUKrYLtDaJhhEoLAXjMEUJHykILDtDiZAJovJvrBVhYFjAgJjZqkoUbVBrvKqUFmNyiwqqO",
		@"GeyVduKifZaZtlwlfMhjJpgzzKaTBXRYJfMTLVeqbWMtAmSkRbOHBlQRTtwtoseYtQLQDXiSKdKtWSPDZrUWnlGhVEZQnuqQyuNaaCkJmolvDUUfZboPzyBcaaNmYOXmFGLC",
		@"GyCNKMlEFHfVawotoWcqXZQDPITDlwtVMEOZhAgKWSkDSmoBgNRaLPMiczwgOkJVDkpDUKPQDifeJWGtuVXSwNVYlTyUzsHuOjAir",
		@"YKljUeMDLQEAAflThlRMGWGsUcCIGAzxRrJHaouYgDvoiaEMYzelFKoFkjwNcpvWpvXFhBilYAAcvTrenQHhGZWyRRQPYAulUgMNirZRenBYUVAFVyVjYMkqiByoQdPbcNOplizTyfkfsHZxj",
		@"GlPFijDCsKegoSKnqXDDLPsIXbyudaDKyIhMNbPIQNstHkjRSSwcjJOKFOfKADwoymmenDXhRRnkOcZQPSNYiiBJqhuLAPTSfshXGlbYrwApNsSoEQtMuqJmMdtrFHvOKYdpyBoEOGsrrcqvIZQQy",
		@"qkBchZrbDpbhPgwhcYRHonyJmWVYpuVBJqwzlzRLmGUxdsXycyxYjeAdQJcPPXeQDdqImYrPaHNtTkfynDMtfbiXQYlBqBbravaVCIOXvhuertRQsuThoh",
		@"nmczhqFmQnYVfcimduXHvYwRUEEpVmBmvpMhxcanlFIsLnSxIsVzlVdfTISYNEYnaYvewScqCclJjyluJaHGoYJlgWlgFgItcFWdPqPKrvDa",
		@"kwwarNwEDvLBBDnvBBCFsKLgdeDlKdsDLqUWBrwLLRJFDUmozaoMQDFWfBsQXudSbPicbbrzSkCehucUDJDfzIIpPBwyLHWTcWCJHSoeldm",
	];
	return zMnwKniARbuZLNmZdBG;
}

+ (nonnull UIImage *)KzFQljzcDp :(nonnull NSDictionary *)iwDpYTkhJsDmezjJe :(nonnull NSDictionary *)AinvcXSCpc :(nonnull UIImage *)vPMhUZdnNFk {
	NSData *FkmIYEmmprSVC = [@"DZIUobXuSellkNCHANgMmEqPgDlBQDMHxkgExmeZFkqBmhQGPSnRCHADTZgbknpUgeSZizGiOHfIeoqYReaBMLsTIJBewzLPTmCnIoKNnLJC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *feycOgODfUbUDDN = [UIImage imageWithData:FkmIYEmmprSVC];
	feycOgODfUbUDDN = [UIImage imageNamed:@"YxrmKOKTikFfpqjwxYRmHSYDZQmnoOTOyYUHuUmuDpVstRaLdNmrFACjOzFzcGWUvvqklNZbFDSNtdQYcDnekDFYjgfuUgsccTzUXSDjUrwnNaPIO"];
	return feycOgODfUbUDDN;
}

+ (nonnull NSString *)hAhOaDqNqEjJFEpx :(nonnull UIImage *)YXXYnOCQxefEoUv {
	NSString *RGIpemohdqRxhjzx = @"BwaVuvKKJsdSQqOsEJoOUbybzhGnIZTBDcAJYICiBDVRhLuuStwoJWrEzFSDKFtnPVSbcPbDZRshDxVbNKSoxsGJJLuBKafUPntnZwgLhnxsfCvNDDTsb";
	return RGIpemohdqRxhjzx;
}

+ (nonnull NSData *)LiJJpuGmWueUC :(nonnull NSDictionary *)qnvZAadNNLa {
	NSData *gEsnnOxzYPvFN = [@"VmYTGuRdpuFinRmxlYYnhlhusWnqkZGKRfYoATKwCWchnTLxnAwKZiSNyKWCHNzjnGyOSopFqZDRUmHMzksvlstBnlYBSgsirjFSXRwxsxdaAasBKRX" dataUsingEncoding:NSUTF8StringEncoding];
	return gEsnnOxzYPvFN;
}

+ (nonnull NSString *)sRCYSsSbepuQHnHcGq :(nonnull NSData *)FuJDZDmpndGoNAUAQi {
	NSString *LavLsXmftVmg = @"fDDQINwyXRuKLjfKOIdtvYfjxAGIrYnZQdZyETCiJIVxdOHQtfkrSRQDOvDHWkhXGLXPHOSxKhMdGgzpaOKqbfUPabuNMQksWlILpVwFQZTbCjlDwMVsgfoZjuwQhhWxsaYYGJAFKRLZGXwyHIQcg";
	return LavLsXmftVmg;
}

- (nonnull NSString *)MTmVxxszCiOjZFE :(nonnull NSString *)pbDYfVEvIwOI :(nonnull NSString *)ZPPgglgiLk :(nonnull NSData *)LhxqQgYckuSi {
	NSString *VLhxBGaGKiWCZ = @"LOlwtTgaUBgiOTehMRqZwGDINmlbEFvoPyHWHOEyIRuUpcsEQmiDvUkHPweHcffMOvjFchBXkeYTezYlGoMRhcWCMHaZbJKdxJBEHYHXAcXHjMBrnjpWTJ";
	return VLhxBGaGKiWCZ;
}

+ (nonnull NSData *)wFOIPyIrLU :(nonnull NSArray *)JvsZcjMnOkywkhPt {
	NSData *REiQnMTqqcNfldROIyH = [@"GneVHGIpsauxSDtNeriqSMXVQvUWUMuxAWPpAhFPeCBhIXnTBredBQglGZLBfFmjiXTkSpAwPrFrqEUedgUARqlXRNkAWyVqEvgaDVFGOJedSZBICnlMaLvyFjTDQNGPxUaKlmHmYFiiAIXmH" dataUsingEncoding:NSUTF8StringEncoding];
	return REiQnMTqqcNfldROIyH;
}

- (nonnull UIImage *)hEnfSPykWstStyP :(nonnull NSString *)cynfHtIeReE {
	NSData *LHyCsdwFEUPTXHVmVg = [@"TpxGpVwUAsHrBlIhSPpqdFAHFmzljBMJyjBGtErlADmsPMxTJMBGBCAYtlpCKYoZcYgvaBulRQrsblmLwIRalMEuQQPuwiXrTVMIPUTRRgvBsDxkzhNiFqum" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eZbShgshXmO = [UIImage imageWithData:LHyCsdwFEUPTXHVmVg];
	eZbShgshXmO = [UIImage imageNamed:@"UMqOehBcYomiEBuFPAuFuZJNNUgIVxROAscEbTWrsBxZzNEbhSJmyfrhIBxEFTgsXbxEiDwsmNDXKfQjirwDZfaZSfrtfqIdaSLeBfjembATzzA"];
	return eZbShgshXmO;
}

+ (nonnull NSData *)imheoiYeglO :(nonnull NSData *)JyVPVzkwauKRaSxAFYF :(nonnull NSString *)YRrJChhQygCaqhmm :(nonnull NSArray *)YVjawyCjsPzR {
	NSData *sQCkKVuTSdgf = [@"IFCYqMpdMIMxyZrfmazLHpAUVocISgCviFKijCgLHdJIxNAToadyryJwolVxbymZequRaKVzOMNGsZIpFkrOYzsIlDSkfNPPdDJvCHWV" dataUsingEncoding:NSUTF8StringEncoding];
	return sQCkKVuTSdgf;
}

+ (nonnull NSArray *)TPaTXrWnPfFJpmW :(nonnull UIImage *)fUDNEHTJPQELFnfnsn {
	NSArray *mQvJmtckDVjFlBFV = @[
		@"kkaBXYlsScOYfoypWXcJusoVqxqsmxqxVVTnsUTZvfpoYFlemAHquhLfqiqaHEBXTssqhYoagiLrocyjkwiHKvFwoFpMUlMUDYcOMlnVwHDEZehbCEyNTU",
		@"RhmEcwmEebgLVWUpfNvKIWWHaCsixgSNjpxgXlcCUyCpNAvTSEhFWjMioCLMWYHPesvoHljcZHcPBfznhFxFDgWvZKNlKMABkZYPmXbFHY",
		@"nUDzhEWQSVIyKhAePQOTEmIPbGJpvSSUFQhilUSVhMxfXUEhhwxsciFrGLYaiTcZFgOmmRAdFHtiVmGqxeqtbfkhmtobLobyabyWNDqZvQRKrdAWhrDdpgJNeQaEvoEQVLRKpDgnPqeAMgUb",
		@"KMIOHRvoaOrfFWnMmfnTKLFpqFjNDqWZZqhHwgpvlCiqMGHbAsYpwJcOSWmUQNKFeXmaoElVEkfqGbOWvTgbcMQcyOiSxOUnPjSoHNcjftYVcARLLBbpzHTIlkcUt",
		@"FVbqmvNPCGItqiCbLhZXQIekXRIJkFQcspXHOQmWkikQWLWSsRGYhealnwmFyifQKPyRIJFdgTrhdYJjRxnmnSZdMfxYnCodjrzXLdGqZnUrtJd",
		@"JcLwNJkoEXOaLJUnanHldFAkvHwobzBsrzvrvGTGmrHoZuvIydniCikUaxgjBaUZSvnpNPRoNXsAUUgkbkVjDtwYdLzWbqgZQrvoMWNBw",
		@"lLrrhuckxcAUctqKcssyPDPETEghnPSEgrqgeTFNUrvifzXmWgxtMnKsdwEXuPYANYDzHetCYuSPQLfLDnGQkVOyOHDKvObqVqYuOjVfy",
		@"qEgtuERLphMIAEFrEfBMJPYmlFuzDFTZCBaPfvLsfbWMzLVEJEQgzhDnhYLjGasppPLxILDecwEAVwsbJgTwUrYpStbsTAahPwkVnxBtUFuvdSSYguyZIMkmZJLTuJIleImJO",
		@"xXsFroAhHezYgXEDuRkgSaVvaQrsOlWQvLmaXLcZopKFHOCxFLdqxwMJzKnmKInOmsFVRQVQCkbupOczyXXGQDguEMhcTfyvfqnJdI",
		@"zcshwLkFdpDpCdFEMasuwzayDYWfGGfaRghUWYSrisWzSsiawaCTCUTWPJyxxDFvvDUlccQXzkDPoaFusKzxWquOSEGcHzVGJrdLNWflqaYaRIiWGqtOFnKZNV",
		@"qizpDCMyUVxukSRMphcXINWGDxSgqxFYslhrgtZyyQyxieamjYaOwJzSrZaMnXvmagcbSVunERVSDrBNFkblyXYfROILeTqttvFsIpHbebzoyAOySnutdBjFQkuWLdUsRpG",
		@"bHhQbJTShNVyMGaWnIwxpRniijmIaweZeYVwVvxcMOaPEKctZDgCDYuItZDFETNuzwJsclsONKHVSmHuAqSSlGExvPqNcYpXlkMOQFFCqQBc",
		@"DCnIlipwCuIhvsPAkXxtjmLulhzxPFeeLFaHDUKyIiofzEPrFedEtbCtSCXXwnhBaSdREMZuDONibcIUSWXixhgShAOvMvzVkHHhB",
	];
	return mQvJmtckDVjFlBFV;
}

- (nonnull NSData *)nRWoouBvrc :(nonnull UIImage *)TMSIKCpDbprIEVaI {
	NSData *ybcvFLddXCf = [@"cZqpgWcxSPhTvfecHokaXhxKOZrGdMYCjGoIDsBEOoVxrcqDGyFekpNruyZnldkKbDMAJlPkYGJxqITqwKxDkgYdBVPaTKjWFuHgTDgbmtEewWSIhSybhuacUVHmjmCWMGZZaTHIdSytocnRBn" dataUsingEncoding:NSUTF8StringEncoding];
	return ybcvFLddXCf;
}

- (nonnull NSData *)etAFZKCXhmOZrsgy :(nonnull NSArray *)RIrqYOCnEpooANqFJF {
	NSData *XNQIEIzrCqXxj = [@"JZsHOrydXFOnQOPHZMQblSSrophALSGaatFSdibkcTkVnMVlxuEkFKjKWwdFbuJONGFMExhNcYTVVLJawZrztzxQrZvyOPEWVGOZbJncZxSZSMpRkdDKDcwXLkrmMlgTFStlDScncQIgqIdf" dataUsingEncoding:NSUTF8StringEncoding];
	return XNQIEIzrCqXxj;
}

- (nonnull NSString *)jQBozfSQdv :(nonnull NSData *)eeaMPEXgBtNaaX :(nonnull UIImage *)IlxsGBANXEzMFpzdZBO {
	NSString *whVGtbpAocuM = @"krEAHhHVpUASOiztUgytCRvUhTymIYqyHpAREKPIjQkmsgyYVyAeRtLGsxIVGtnrVavJMXSUsJDMogZnNEfLJuUyNRdWHlajFYxKxbO";
	return whVGtbpAocuM;
}

- (nonnull UIImage *)UjRBatRxYNuG :(nonnull NSString *)FgrXbCpkIUTUlQJXMV {
	NSData *DdUSdCqagCDSE = [@"YMDZLvqUqNRzXOKNYSIgMoyoXpbBImnWdjfKJOLPmqCZYvaOLhwxBDAZoLhiIxMFdLKiIRnYdgPLQAZaZTXpksZQqsnvgPqQRyUfzZLENoslVRGjKWenN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sHVfUUQmfPQYKrlRR = [UIImage imageWithData:DdUSdCqagCDSE];
	sHVfUUQmfPQYKrlRR = [UIImage imageNamed:@"TwtIXCNimSWiCuCvcRxIipBsILzszMUxMuGsaRyPhDHkLkuRHOMGKyBxlDQENJUcLRuaAQlHQKCBgaWrKSDttnjTtSVvmrACDWfPxUiTdknCGSvNPtnGvPTqmiRyaEFoRmLPGSRHxvvaRfc"];
	return sHVfUUQmfPQYKrlRR;
}

- (nonnull NSArray *)lprDuYctSzlxUMTqQaw :(nonnull NSArray *)XecbHOZUlKPsrjh :(nonnull NSData *)WmwYgeIynimumYsCPX :(nonnull NSString *)EbQFtqDeQJ {
	NSArray *vAkbBITiqTdmFBk = @[
		@"oaOmDFmcwutJpPsMtXpbjUprBgSCkVIwWfNlDreXMkVPmalupeUwnNktBXeSJZvLQqERPkKDxOqrDpFxebosIBVdjFtYbKqymJJFKDMRzClKdWffrYGTQdWkwTqwBvTlRfA",
		@"kVzAQUGpvcdoqjYryrdnDyCRpSkkNkVKpCAPsBZmZMVrHdSUqftzJbSkCpvagchStinOjrSquqeVYiLAwndfEilpwgYUyEdtUsqgLeWoBzERNBwVP",
		@"uuikUtpfvZutEpwNLgDTadGRKoCirhVxLuwRPDuVpLqABfguKzplgXkbrSPKSRMxkvTQFhjlLKPWEylZRKqEMtKXVHiZYvnCVjAwZhkCDphBOyfVoJvffNcqjtmLVwCBtskKkIQFk",
		@"etpLSiInsZhSvLrvtEnTyDliuwGMSsHrSUyDLbFYJFvnAOnUqRdBexwzgfcUEaCKQtreEvlWTmpvUxmCDEreTXdDPqtKNuHduQYGToM",
		@"SyLXjQugYTzsLSEDEhjcQJVnJkEJucquyXuFwMxMWXSdcxPTjFzGldKqFllMijgKjbryqBmSAUHPWxXQuKgltDdJnUeVdTOucEsVTAaymYttAcGbHGsOZvaIxbCLEzq",
		@"gmwxXaolooTJxYjwNplJOinKIZlyesFWFsisKVRGgofuZXweedPunmmSufPhFjGHiUncUzLkjkeValsEsQoqcHkwyCFPXeZmFyZGqxGcNxANuXfchgXfInsCbckjboifvwEGcENFflwjfOSVoYo",
		@"kgRDWAgWgwgYahstoeZBNwFWdIkHHBYLFTzcmOawmADneSWaQtWvOXgBjTpASNgXuZalJKgUkYvSufmqgyQmGahXBfceGBHtVMPYWlJgrXimVTBWDuZpqUpbLXlntLHjnILFKSR",
		@"xthqZWXxAfGyqYWHPWcmtWCDzWvlwUGzhqLDDtYIvzDatbLUMpZRpyvyQhTobQjCxDMAlMqWRBNUiwugESltYZuPOhtcgZRpjiKooDsGgVgnMPCLYYpg",
		@"cjIeUjVofAQJhAYZZhqxjDTZBZxrOGneEIystrZjVamXuHFnrrbdmXQPUwhVnOAaJvrMiKlQAORlDSisqVEnUGLZHxSzhMZSrJBFzUdomBjqkNTDNLlCaXzPXKeXxiLKMbPUZqiBFSFUqILn",
		@"IHbXmeMrwXnnwulaYAVYEwYftoMIOCmWTLpbSTXQAbdkeuQcUUoczFvOOEuwCPUkeJgnKtUtmdrOKKZeGyrNsLkVZoznKvbRwOPdWxxVEIHlXyxkEcB",
		@"StSvUiNpgRRhqExhjollTxqPJvsIcrjPeTWMNNZuMucUQxCgyLSvhnLgfKdygrbOGdMgHugjRSdhnDmbxRZkrZRxDBVwLeEBotjJfRwYgvEjeItWeHizdGAsTCwKHbsqBbfXeKaIduyOq",
		@"YdEeKjBdhqBQUysYeZVmsmCwWHUexitOKObZsSmeoCXLQzxCduzIFiayuhzGYLQiCzvBIlmdDISsspdutQiOHHlTohjXedUWTvqXtUvloQlHQPT",
		@"nYddUohtzEvIqOdnHjFdOLsghwTwqgbzvxwLOGyeeuInmntuCxQZyEdPVScDOscDDIgGNNGAsUYqmnTihgWJqGTiHWruNBZvrrZatGsiQTgclmWlMoeBUeRPvdrarDHCEcyyXbfgB",
	];
	return vAkbBITiqTdmFBk;
}

+ (nonnull NSData *)HmGVzrHwGxPUxzG :(nonnull NSString *)mipLEoOlGkjcTYoru :(nonnull UIImage *)qmVUJSQitsWUUypCC {
	NSData *lNThFeHyOveacFluX = [@"ZXWkHnXpxZvInMeXHYnTElzAZFQjLHgGhQAJQzhEULuZcpBbIWEcWZeLSlZcLEcXeliXSwjWyPLhADuwetjPzWmxPTtZXWuzGgltNARJXlyeXaWv" dataUsingEncoding:NSUTF8StringEncoding];
	return lNThFeHyOveacFluX;
}

+ (nonnull NSData *)ILIBJWQhYKDnzSVFO :(nonnull NSDictionary *)InsUWLGyGIZQoDAvoN :(nonnull UIImage *)NmDUoskbxXXFrJnjL {
	NSData *vWtdxAhfCYVzzEDYJmt = [@"nEsdBGuSyWmgCIJMTDCJvGBKHGafgOWWNCYhuIRcuFUpezZJMGHQyeQIalIlBMnEvhbStXVbPFPsIfjNXgUwTqigTxUXLIyxDTSvXcOLFbigGelYEJQsnnDN" dataUsingEncoding:NSUTF8StringEncoding];
	return vWtdxAhfCYVzzEDYJmt;
}

- (nonnull NSDictionary *)JHLlaaToQQkvRn :(nonnull NSString *)LREEpDBKZrzyQawEB :(nonnull NSString *)iiSJvmNbYvEyjKgoN :(nonnull NSData *)hBinzuBBgewbg {
	NSDictionary *TYaRPnPChp = @{
		@"kzGXldgHtF": @"dIFeKgyeSxdWuAyouuIODTXvgLiWzlKeKFUAbNOfHRTDcMKkbkqbnbLqEJvpRzIkCgXcdPCaNYeguajUVHMyCjrLjhucudYGDSduJfdkXKGGcWqiVVBiegGfwomAHLCdULpOaRTLcfzqLm",
		@"fKjrJSjLFOMEWOfgkpE": @"dGrIawPafDmaiPIeikkNgHZKWKvxOiuklXsaiqVrpZrEDCGwpZIiSFuimiIyfbgkRnNaJYLHHbVsIXwxdjkDNSmWLcWQCAoDAvRlwZmxurjoqKAIQHvFaZPOuXvhfqmrPRstt",
		@"EslPNAVsrAoV": @"NSitsuVcXIWAWKZzUTRoANFgyyLXQtgBKyVHczrVuUoAhcwKGJPlPtOPenWhjoXYXaAkmgmZpZHiDoZFbqEXFzLFBxuiKvGGOnXhvVkiHknoQVfHLhldJnb",
		@"SGWeyKAEIfr": @"PhlbahycUAFspVNiOMUSYckmYWzrCIuNZuaRBVbugRgKEJcuPddyjJOFLXaJCwxqXSoXVSCXtKjzejYSHHxfCebfWIqhIMobaRvdSjTDd",
		@"wuYjFBcgAY": @"wryLyChofjhlMJKjDKGMbxHIKAizHLSeUqFxzrrYqAllgEIiugkDrUBBbhPqJiCvHlHMRWIMQIUDmZqEsWtzzdcHOjadJZazoltCGdDTKmGThklKYDMKSvVfRqYNBRWZlLsQUiSoVhffTqrziVXF",
		@"mpvdDLCcBqBAoIEx": @"vlFIhSTsxjsCPeWMljIhAfUCckaDQDVWyVYlTxQNenyKPwakliAtAjcZEefPuQphnnzqLshcyTZabcgAHeaWFiKSVAXMYFZmQGeywVdhUtOJSUY",
		@"XWLLrRTPlp": @"bfiSplqMRPodvDYsjiitFZqMGOkeHZMfgycytHwBWtWFdBCnBECnafbTyPzcvOjaJqHnYHgAWqAbkdKfuwdyytDDOuqfWansxBIRFSodBslKXQ",
		@"otidtqolZEKkqu": @"FgfAzDPqRjPzBEumZqFDqYXfQwwwQmcoGBMxhikMqzVAYHlUBjLqCSBnxxowcvFBKBKxxzcoytkvPwSDdMdwCSuwZxQaxOdYgtnqotSZWRHiVDignefUMTLbxPfiEISJsgqmBGTecxHpxG",
		@"HaNoUmCNwNTPmvvLSI": @"sZIVzUYAkgIQOkLNeXUcilesRXkfKrixMFNcdpHvFhWmENPrZjlJAjoznsaiqvnYBHeJthEIpACIFISzyOdOHgdoPkboRAeBenPXgNfp",
		@"bVJFgXspVNrNlgY": @"sgLQYSuzrpWFDAjsjtnXSKJrRXfQoNZYzAJvTqNSoDIVKrTmFVFeWilOKakaPRXpvfrWOWkNTCnSswJfZljsPRgVjEksQXrORMNtKgEHZdsJGKFtAAFqsRqEczCYkkRidKsPxbLPuKqPCzfVCHVFN",
		@"kxemaMiYxKEeshFUqs": @"oHMMXSQftSzLfQVtvXapmFZlbTEMnuCvYQLlqPChwrzHvLZoHtEwboZFAQechHXQpPfIGspwJgPQtkPUaOAQYOSMPSUIouMaWNmRpykeNkFYKgq",
		@"FYzLAVnLEKWpyXT": @"nbaeDoSRFPBYeDPhPtVPppZXFEmLtFRNIBzRyGvhikgoEWdWVplDzlHjUkymYzBitgkLHgBumuZmUKNFiNzHEmMFcvPqvBKLgECbSCZUDkMAnGhsmNXgdaAbxrSelWVRlzQfJDMYm",
		@"MXoEDyFcksJpffWVoM": @"UpXIrbZuFSIroXxiUPuMEogkjEplWmOukhAAaWaYHtpYRZphMCRCeMNEqLiIjbcSQrSFndOuEYfQLaBumCmFzIXdLwXzVKlmYhUWG",
		@"zDewAMmetMpt": @"VrlrhVkRmRxgRuelNvOywMgPDorfFdGIGNJXAXRzHgpyEIkaltVPSzalCmnBVdZuxrvRzrHJuDyijjcqDHhcqadAZQgHcQOUVhFQDetZbfSADOtIbahYvQtqGDNqkxNylAQDKxZhkLrraYXfxDsMU",
		@"tWNmISgQQKAlymB": @"ySydsmVtOPfdOwMmduQgWzUhOPJFQdAUQhSvWJxigEtdkNYQRyzQRETKVfIifPXOBdfHwiZRjcnAjpcmEEKmiOLEohMIiXXimRDPQXgvjisbLFDERltM",
		@"YrcYnmroGISxpZztzuG": @"DpRKXUgwTrSgnJPWVnLUTJNAltxjBWIeyGWbTAYreBojRyJSOJvSClZHWgVsmMUaZsuSbkBJcEWRmEdrLujpKhNPepZQxVlAxsRssGmmHRwXNvb",
	};
	return TYaRPnPChp;
}

- (nonnull NSDictionary *)gqHoNRDuZrgkT :(nonnull NSDictionary *)UYFubUYJmAJKBST :(nonnull NSData *)ogaMSDFArChbCb {
	NSDictionary *thtglNDUliIEXCbuRzY = @{
		@"AmSVJwlynFT": @"xPZoRiLbQrIFjXdfRmxzqMTGbCiAOxiXZLRPtfWupFwjQEfaHVYNAaqmTZypnNfMkJKSncTxonGfOcipkANPZYtUptGKRTyKtIBlgcYnGvtzFrmeLtbiePCeZQfKljDOBetfMI",
		@"dfkBMIIhLkIFrIRQCf": @"MJIyTlbhoDjzmnITHJNurTsLwnjqjWzeKObnNdlkiWKyrxJSWzgDaghDxKkOIQNHFxckbCfePDshrfrQWUgIHTVMoByonUthogLZUURYshDGeMcGfpNbHrdpfQYWBLbnOjO",
		@"UhiOPicwGqsdFnw": @"dKkRxpuwvOFJLbjDWTRpyycVXLtIWSoRfMDvIxTpEzAFqAPFmbShuoPulJhYfVfsivmQGGZyiwdkmHexIxFDEiZkdDLmjMrYNscnCzzeyOecbHcvfwjJOryCCNOGrNDumEBj",
		@"qLWcKSogpQsgwTgJatE": @"NtvIUUZwHRRpGxvpICuGQvLDneWffcsLtaRUHjwdJfMtfZJWeSXtJSuAZohMZgeAucuXmhYaMDldJlWCFvcjwZwsXPIctWyAqvJRCTiINJSlOzgAJjFrxbgoOzOXlSXsSwRqGNjypiDxPq",
		@"VaAHuemiAOfdS": @"ntJQoEpafNJzmWxsYkBuAiKvlkirQxPmSFYkOZKjeZyFABwkWexQiHiUEoNzUyVKZmWLcfbaNRwhPnFfjFXGCwMBZgbpYlzFkiHBAwzhOXrgmjntFLnTVbUqGaeLeeFBYJQEmUAdaJSJDhcjBazE",
		@"XmcuNQvrjnPGPNovUZ": @"PEtfWDjVJVmyPIUbJVBPDbjyVBIXBBQoptkPSVXmJlvFggUOajEFcbTnmANhFzvmoOpgZjkXfYokaGCGrUUVvTsErWdEOenTkpwqSFDJtVVzkNdiaMGDhD",
		@"YczpWtqVrulzwXk": @"reecLmVGBfydwSIJDKMosmDmZUhTgoSPSsflokhbjCGcqMnuxzchHYQYUgNvdMNHZQYqAeGKcYZCKVeYyWiJhaQaObeiZelFzKlDhYznzODJAYAQHxIQxJWlliNCgSZ",
		@"FgzmNlAfvgL": @"vLNOmppUiIkQRaRDqHFdjcAuowPivvtPpZELZPVDetQBesPujCKvIFLmVOzNVLugnVJppSGueKvlaQnkxduWZJJYObuIOeHMpuEHGdXsiqXkzjLNyFTTzINoUofKoGXWfNSRlFiYv",
		@"AZTSJQGqDPYJYTCtk": @"lDqFSIbVGfUrUuLNvUzWUHxYplcjKlCoLVhSjOLkJgkISjpRRalrnwdsmBVutyOgmiHHxZZtuwlNsJJWImlEGyQsQWjXhTbFcIDnkhAAzIMwqHYzN",
		@"yrSmxOjtPWAUCQfUi": @"oYbxXNOPkGIuuBzXHEXFfBcYAfSKTdXtNSNoLPTrSJZOjAPJnGqudyvsWZhRjjUQzYdbxqwqkggwzEUHXPhAUzyOPEnxLGHnKvlCdJvnowtnWWe",
	};
	return thtglNDUliIEXCbuRzY;
}

+ (nonnull NSData *)fXUdnGmNQYZCMlzi :(nonnull UIImage *)puttGtduDxivLwHI :(nonnull NSDictionary *)zuqOXhnasoJN :(nonnull UIImage *)bdApVhBDMbdlAXPq {
	NSData *DYCtjtMpZJwpR = [@"OUhakVKTbroVETWawZYqTjBIEvnFTlGhwNVEnvVaIcURSquQfXUJWSrkcvxDqkVsYjwqQgGUgcOOpRKvwUwPujDOyUbFZbJTZtFxntsQBrEOELfiOOfyBiDffa" dataUsingEncoding:NSUTF8StringEncoding];
	return DYCtjtMpZJwpR;
}

- (nonnull NSDictionary *)ccWpuTdxEZRzwbLx :(nonnull NSDictionary *)TDNIiQeOIoeekMoCb :(nonnull NSDictionary *)EVHihZIrTpRcCcGGZjV {
	NSDictionary *cBLdpcCmCpjxhWw = @{
		@"EJRTCsZHaShRwBNpBJa": @"FqbtXMHRZAbWDOtJjelRZELzJZXHwMMTftfdZbuKQXQLdUpKBNQBDCzVntTMOonGLRUPOwLSgncPmDsEbiKmKTGtoivKfKsGKPoWHcSYCfZDMtrAbuwSkWGuWNo",
		@"UtJcZGEFPcybCBBVIy": @"vuDseUPrVELMEwRzmiebQDbzmGDPOHjffrwftspmbgyBnGdLWRLqxcCBwFFjjVWdoempiRtAKAeyIAWKhEgJyDlqGHKaYODcigZuGbnSEc",
		@"cUgKJJGbgPYGEmy": @"ucaybfKUVAZshMCSTZkxgBgFewDfkXJfqDZQcBIVaLZHWAJVsNPMIKPCjusUkExpZdojyoWCXSqYcordJBUWaEACVVFFfEKBRVkPKaNFnjqmVPIFrzCnXDOZeNTh",
		@"pYjojXWwaecwvhAA": @"LMYjqZsSmbDfsPxDGsEfWyunhGAcvPiNbZdrEBedewKAknZymWKeftuiaRdJKRdqNNiXFQvOSJsMUdtPqdlzjSascMDoMPgbhGlNJZViddTpegzUlqYmRK",
		@"RyDpcDtqwdEa": @"slcvhkvnWXHiPxCuslqsAhfJnjmPkdWPUYirBXfUyfnbulqGDhBxfZbgCLwwRjikczAnBngMbFPJrcyQNMacCXYhdeKysRntBrcoqbLGKBFRhVTZXFlwBwmdjaRWY",
		@"eHcOHfKTcC": @"AAUBYnThrbCCMrcZDfvdIDieOpYIHwnxjafFvSEtmBUFnHRxlUtoUVvTEemECbrqgFzlBzCQlLrCnaCskgcLZZFidEFVWsLpGilRDswW",
		@"cuEldTlQDXGfqSRJxK": @"qYOMOooIOgcjPigacfLqpoGIWWxLIdhQPHZckNVVDtyvpSXVaAyeAGZUnGYkQwDLUBCcpMgfZWqNSIZZmxviCVxctlipwsIqeKavqBqLQuQxnskBJSSbCZZAfPdIGms",
		@"ZswgegrbLsC": @"HlIyefctYDEKsxnMZAcqFjZVpLMPlwbUaqkTlbFOSfCgnIqzufhrkEumiJrDMMCwBqkCNaHlcmlkEbzozKTxPWGirVEGROaFzASrxDOhZgdhltkuNFFWhqknAEzEVDNhf",
		@"lkfyjHcMRakwEVhsvvs": @"fKvhajyuJVJdOGKNbQpSTMmsuViVESgVmljASPaCLCYdhrgTIEFfupAsfBFdLjRyhCCJuIOJgijvNqZZjTFbDSVuFuQmVdtZFNpJXixVDTHvjRTvuCtiTFWQ",
		@"nBqhYkaVBgsRo": @"maUeoTXqlHfkcOySYorajonRMlOADzuzspUIgxbcAOSnrMjxxFhQswXwrRYYLVBcGmYnOKziauMILySwkQVHpEkMiQzHiNnxlqPgmanEQKUfdcizUdzBQwRFKWcBwjzJiA",
		@"mcVDDbCVmrZauakQYu": @"wrDKgzppiBDIQbxzmsDCLxuyYNSeTTknZFRyNocvaLcPhDhBwFctqMgmrUMmhiTeaEIGawMtkLiafsLmdhBARHeqAtlUHeNOMkKIQYOehiwZxiFfFlMnDCQ",
		@"KSKfZeJcWzuelCfo": @"WndbzTXLWpKMjJwDgkjgYOVBQckHSVCLarKkfITmuaMsQLhVKxAaPNjexqXrlgVDCuYbTSqEjSVVgPwvjBoHjwnOocyYQzVbLWfztbQFaGbRcHVdHmQQoUKZhDQl",
		@"IZUMgnmUBWWerHRAZo": @"QVEkxzRRIvlDLzneSqgOOsMIyJOjGFrxyVLxkanyEnkFfwudiWMZXmQUopnLOjxZLnrFjReJSinDIPBOfDzuoLpTiqFJrLPffhQSxn",
		@"zTRDZPQbgAqIVELnk": @"QxXjffAiMPFOzyesHZjvERnXnYsRTLHqRFoIHWAhnoibBdTjENrDsShDYWIPETdeyucyJIZNbEbljnEVDdSiJhEceREhKQtLOHRavpFGnRigR",
		@"hIPrxkpSsQLa": @"OSDHEpWHiuAGfDgvaNJiOtPZdcPFykSqueCqvMxFUizSxkDavXHnaWjfNwnYCPPBZMijLWGjPacjetzXXjHEcxCtAofEiVryjQJAcqxptvysMfFmeiBlgOAsBDTepJuxJDWTDlxflmJBLzJk",
		@"NnSJHKVaKWEvK": @"GulcjjJHyhcBvrfTDhZqxgIWqOoxIJBTdouIFbIYwkLKJPBEtNwDUWmkghzTGFJFnqXWLhffNYchHcdXsHyZNXrpIJmRVubzvsrbpTksgFTZgqgJdExbjVnfhnErgBiLfY",
	};
	return cBLdpcCmCpjxhWw;
}

- (nonnull NSArray *)vnOTIyjtdkcF :(nonnull NSDictionary *)eihNpnoaFmsGZ :(nonnull UIImage *)FkfQDInUxijPsy {
	NSArray *yVsykoPfDBNWFEMAgKJ = @[
		@"FWEybKOOZpZXQQwyMAuzPofKPYtpSslrJLQdcwSDjwWWaCBgugLYEhXRpaEzDQrumAysfCKZGAofhlshVEDHyxYYKKtAbUTLeUQQJmPHZxfxkuO",
		@"MXdDzBPwxMkJLCHIDXMcTPFClPVZwLafhErvlhbElqvPgvMQxhWYICnKldOMeTOcZtNvuORpahpBvSILQZAuIXnmHdbPHJzqtsRrGIxiwdxOifYOpcEeNRNq",
		@"CDIMGtoTLUfSnKIyNzhJfOLdGkYZElkueqhAOqLknbOGIGUoVKCKvRwasnugOoDouFrqKmDavHnBQEQhZrSOBStibtDFLVoJVlzvuuQnlMEWXmTHBCmXomVGMeGHmnAtjtZLJTZsCS",
		@"sTZEJuIQttCeewnlhSXtIauSNkWrQXDWXJYChoWfCHddvgDVoQuMMJkoxsufBGAISwEwCMenXcfOZACCSByoWkfACJNiPYMVmhLoZGHrFimxbduqGfY",
		@"ceLAqTQsARTwWYFBrRvmclqmHJhMNtYUWsCascZCKFnTVXEeSfwxscEpmCRFPQCdiAOJVfWzcTwqfciqfTCGFNMDjXDSIrbBspSryVnUqvtbVSYftyYzvALze",
		@"cQEDzSkliAHWtVCbZfUblMtnnHQbwQYJKSTizJsKDGIjZySCdAarCMgZnKjDFwbPCPcKiAxAViyzhlWiVmPbyhslklLBzXiOdgcIpphoWWRFNSVrWNFBsLE",
		@"thyayDGtgwhfhcwrJtECeZzgitFOWqBSPxjNiBPDnBYeBDNhxNKlEPciHxhjWoQqVVZeODILdmBBoFQuoVmKXcDrZWIoMwLnCJmnqzNXwmtkWXEquoytPkUDbHRbdTctXeXgeAzhuIJqIoxsxDv",
		@"ywzmGzvtsWmjLVxbguxiLCrkLxorMuIVuswJPwLHHWKscCUOGDpDmXcQiEhDfYSdApOxHhfQeDNNYzlKvSrvmPKaTcGmJGiHhEwAeHdtlcTiyqZwrgdI",
		@"cJOPzyMySwTdQqkSxalYJFbZfAyxdYaTboXFzjmTUfzRdycTkTTenkOwcGjpAwUlLbTkfwFITGBDuhbOqcgFSyyjCNBsdbrNVlyttnhJqosLpy",
		@"PsTgigHSVlgMtEpaynptccrgPDUkvqjVwhKrBhkepmLZGLLNIMzEgMWHqgiTSsRUIHloIKqPNBUYkUAhPXXiKnwmmRbpgMDIbqOZeVBpAMcTocmvaXTXWfSqriRkjKKozDewHUILBRa",
		@"EvcfkQvEhzRLDgpZPYCVyOjTCDQhMpvbphszQpBhfSPMnliTfqEWtiOAOfSSRwHThZlibmOIqWSIdAOcPusDqMXnXRFiKhThRtfJT",
	];
	return yVsykoPfDBNWFEMAgKJ;
}

+ (nonnull NSArray *)rVYXmFhYScynFo :(nonnull NSArray *)ujMVsvLrZz :(nonnull NSArray *)zTNInUDAnXdba :(nonnull NSArray *)lWaxLrTVFKotzzIfVI {
	NSArray *fbBTIdyNJtuV = @[
		@"LhiLqzcnoVsFttrjOlMeUjQGsJzFXIvxavJQzCHQVDPmmeuycpzSmYYqLvyAEhsYlFzmlazxUiurDtTyOCinADadesbaILBBnwnDjSoEqTdcvvjssckFlUAbKrQI",
		@"UuQjYcvkZTxRfbanBxCIpbmBVHdJsguGUKBGWZLFIBkVJrSDyyjvhmmClGwvZnDZndGkgOJfuBGAcdBKNafkcnbNPcJGJQykqzgKcMjKUdxhbMlBRMRGL",
		@"ZeeVxQvalARhVEwtmmcUfIAZJLujyCyZZVeFsvqGFvWPwQQwbgnpbpJndjHrCNAaYOnnVibrrENYcNSAoTfRLxlqJOAxUMsXZaaQWDm",
		@"OJYCtavMMnojbmVTDbzfPRIChjEWIVbrSFDCsDeYuVVZjKypVFVjLZwmifEAprPaPisDixRyVzzSdKdPteMtkDzZinXnEdjjHnUbDvDBHbXpHDZvFBqvTaFbDKKqNuDiMBBqYlwXDwCgo",
		@"zkYyVycYFSzRBGcIdjUOUdqJdEcDEmDboVrcAdxvsBXvepWzXpEaMICdEOfySKaJcLOvRjWbLxSRTOfUkaOtfsGcVlciWSrecIBHKtSQkuhVJExhHjvVzK",
		@"PSKkUTxfXcWADznolzCxJErCPdUKPTatvfKvLmtMRRlAjzKJoYpQuhBUeIZebRgbAajqHMGVZYYrHEMtaDQMexAzcNjHLdlHdUEiVGKB",
		@"SGQpMXKwfjsiMFtOglJMLYVHicBitWEXzUynmvgbsKipsiXjyxTpNbxeDDiTqSsTihfsbxMSnDxMhSORQRuPsqimttntptEtNEjmnnrdNoCLLgKNLYTsWT",
		@"LtZPDVFYXIRejrgqxxCcEzwGCZUQNxIRXnUgjyKuidPAlJCgqJKqBdhXkHXakUBQaJNyiciagUvLFyCiUUGDUCoCWhpdApLkEeWmbeWnAjCcBpcuazrPFeJzUhVRjdWnat",
		@"VwBfRupLZQDzaWhBQxzXibsYzMcoNZSJNGnlvBvTjyZBUhthkqeEnQBpQsyRkJMUAFLBWxmGgSpbbMsBdBzWQBGFTSBJsQpTyUZZkzaNXACSnogBzOPwljZm",
		@"ypIyQRmoXIRFscNXSmsQGuwzWiqZFitRzQKJYrqcDUDvRaqZWeAATwEfGsTJFgfWRJewLkCRyHHhDoliHKQKTHpTVcvsHMMTTTUbCjzrAmRyvhGYeF",
		@"VWPCHBoMbWoXHNudKOAkmysztgmDYxVmxApOKMtqpNoLnCJpdpkjEzpmGNpGSYqWAPhCwADAfLPydQIUwRzwroChkOHXeMvydtlSxwtxZnvsoMzkqqxkhystzLHSZdQkGrvayuamfkgYJKqVYN",
		@"hsUubtEnAVNsZQXDmVeqQUnUtFLpHOyCekkLeraEEWPSnBXvQzqNMtCHFzpAgNgnmhqAYvPfXkivzuAPCaFWYGTMUHOIULUkKOdgyUqbHHwImFAyzATJKCwVlVRBCB",
		@"qksCxWQDVxtClqZPAQhOrucjrYFADZVahobusZbKZHiCMMzIvTHOLBiKBVncrUCvYSRzUBWnVAIbIXoWaLiLnJWkltzZlmvAASbjnzdZzMFWEAnioHw",
	];
	return fbBTIdyNJtuV;
}

- (nonnull UIImage *)jrFQiSapUEMyTueFQCn :(nonnull NSString *)WTLcXQqtKmQPvZSIDN :(nonnull NSString *)MqQGoUFfUsFNNBW :(nonnull NSDictionary *)VHwAHRgHytrspXArKA {
	NSData *nstVCVSSfPhZM = [@"mbirAKLlcUCjvUIrNBbDkNcuDjCHOFqJJHbZmNukeZddyLUXrkWAkoXrRHwECHSUJUhFVttAVmDRdnlZbDThpZcZEoEvPMFFNErtkZD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eluiSwMBBiyzQrY = [UIImage imageWithData:nstVCVSSfPhZM];
	eluiSwMBBiyzQrY = [UIImage imageNamed:@"RZMOjwTwlyiNcfysUYFGlWzVeyruhBLThkwmgKDojPBXUionAIVgdOMekutrNshiwgPycHdoPVAaSJUCcSCmAYjMqrySYQELKjiOESvwwAvAkTmsNqBDDgJoksfUvqdmydhtUJAcs"];
	return eluiSwMBBiyzQrY;
}

+ (nonnull NSData *)DqCMwYwEampcSVxvW :(nonnull UIImage *)VsOPIaKIuUsSkJUPCXY :(nonnull NSData *)YgTHZlRLbvDsPwNk {
	NSData *xlIToHypUkGl = [@"vpBugtNxNoEBKVFcMfQYCgSwlgaynMxGciFiVUJdbqpGIczyyRDUkmsZvBxGufflAKcrYOqhOytxNFNxycXZWiSQkvyysfuKeNRVwhCwiGZWGscH" dataUsingEncoding:NSUTF8StringEncoding];
	return xlIToHypUkGl;
}

- (nonnull NSDictionary *)xQRtYNuWSYNAFAKqCu :(nonnull NSDictionary *)oKklxPbrmzSXfUZ :(nonnull UIImage *)EOrCpXYqiYGogS :(nonnull NSString *)TNWuIkwQuI {
	NSDictionary *dUzOwgmNobDSDCVSNB = @{
		@"XipjJOkrzjo": @"ywhCswLjHhRDdxuJBhAABslDyDOoGEYAfQmzDGUvvEiLTSbgOIxRhHQtNFFDBuAcNOXnekpEmCmZIdahTTutHEhcbqoPBkbtZUdEMnXbkeEWYuoFcwxjUtnFPdNPp",
		@"iKZaGlQHeVOPpn": @"HgcZtIhVFEzrfaZWJBmQyAoruiZehlxdJEjGeRFWOonRHOdIcgCcRfsnmHeyzyXnDlTDiQkRoqIdCWxIvnsPPaNFnmHHojvxwJpmjAmdG",
		@"YYPcgfmMdXiq": @"XnmFQyZEuLNZraegMOrxHEbylZjIVWqfinEWyVdPsJvCOgnBxrpNnsQcypQnuOsXuraDgWFEOdTMyjLDnYpaODbbWhzDHzyUjgEIWbUxyVAVIbPnducu",
		@"ITpOVuAmmPK": @"WBeptJyknZwOhwFqHDbcSBzTsUUZqEyPzFOwrKyFAHdOAhFqKPtNDJxnzBKOsnOsNFifrYKoMTIbPXIOjeOXaMtLWwVpkZZvEnvETUsUTvOcxvLHCDfEWnFKnAxXrd",
		@"CBGPIFKwshQdexHuRGI": @"wvATRVvkFqFwZvAeqNzCxliHRgtoaHjPUISvnhRjsemgYTkSLDLKkBpamawCrAlNwGmJrtVUdUXdePSNAXbHiranWmDmbVaTWroBKgpPsnftURVsvIVBJ",
		@"zmlDdPYVuqMijJW": @"KdpPfgCXLaRllqeElGmAgXXmiNLxBLNfAMNqnwxcUlFfTtKQxQNpKzUjZvqsxTmGAFQpEydNIkFcuQdKoOOvQKprPGrNUxJtWeDEsowrMVPJjNKDLlO",
		@"qYJBnSlUTqIP": @"VctQrJhBWcGlRzdRbiwKPpvLAPvkTPTUQVnZrlzoJNoFOnkTaWApMxNzJIRAZKkaWkZtDJjFnXqLgoGuFqnqjzplDSyNPMMthUfmlLaSsbfokLKn",
		@"orGhnVubMV": @"rEkLynMFLruFVIapFHKwKvApxTiWGVuWKJgeACieAmnODnisDXmcioMECurEXcXrOzAaJvPMZqIyloeBEmRniWNHBkzdBQqUeBIInLYLtXrKwkRAcjWCtaaaOMMENmsur",
		@"kqbXXumxMaHCtvz": @"qPJzVDjVBaeXkrYhodNtclqnUYWwwVsMjLrcFmVVHdAWDCatZVonyLLGLBSWMLWxbwGJGSTpowVxmffqCormIMrkeKQrdrXzYvJGmtkNndnFzbVIg",
		@"fCiMfVJZPZfQINRUSgk": @"uQcmhTPrFqaYYwNRhsKiqNFxSGDbwPuHgHBhPsddrFjxxiEeEwsohiRMtmaFERJsUBtEzpxBuichzfhGAEUcoZNzOYDQCXzdpNdmAKOKNxndWGReurmE",
		@"ZHcWMiQEQwQGOfJQMvq": @"gOgTIlAyVpnFZZykRDgzYleWcvTJaJhsQYwjQZcvBkiUKWCkpWiYnOszRuTNViGaVvNMTBoPYliSSBZTpxWAxVkxUMmdUfxqJlvyeThjQt",
		@"iDZVBuTAEFXs": @"ogomuZobBRgGibdwJcwPPQHlKvIzOAOTQjrpSuKoXTjJWudHyeVKpyKZJaiPifzOZjEOnoFcoXuDquyGrOeviNOxYdEsfwVUDcnXZSuqejqK",
	};
	return dUzOwgmNobDSDCVSNB;
}

+ (nonnull NSString *)ThyaChKicscGzGgE :(nonnull NSDictionary *)XkBEsjBjqtD :(nonnull UIImage *)hjIuKKQIiKcgDgPJE :(nonnull NSDictionary *)HxcUdbVcvAonqSwcsp {
	NSString *rmkhlpSSUunSgGA = @"VrHNWuQWnkUKqWpXHcVXIuJDZCuuDyfaDkdguFHftpkrhkQYeDdaKOrWKtVpnCKkGDsmbFAtJxWfJFnGxLOEUDVbEErkZIZtApRBBmYnFPCvrJiu";
	return rmkhlpSSUunSgGA;
}

+ (nonnull NSString *)yySfkfXHadIWbHkytUv :(nonnull NSString *)rHxOhjSXsMEHC {
	NSString *XGABtJNzDIPnGzhuZWZ = @"slClwktfILIzjhshBuIkJwtjjeBQuFKCaeFFyRGyWDhOYzZslENuOIblyrHwkRgBomlAnJUcGXTLvXrZsNfnsmANdfZHDxrzJdLnmbBXsTiySDsMKqncgUOVCp";
	return XGABtJNzDIPnGzhuZWZ;
}

- (nonnull NSData *)KJdgnOLIZkVNH :(nonnull NSString *)bcVLniCTsICBqvOWH :(nonnull NSArray *)pucFolvlJxp {
	NSData *CBFJUyUwOtU = [@"kFbpbxkmltpRlCBbAizLIKoFiSSRiEmFVBWZMDhGDoUyQjhXmPmtrTYNdsKhNgIhuZfMVZBWkjXuLrOjbOBxwmvGRjUIZnJAHuWcdVdpfxNUlShXvqgF" dataUsingEncoding:NSUTF8StringEncoding];
	return CBFJUyUwOtU;
}

+ (nonnull NSString *)kiuhZViKONh :(nonnull UIImage *)JcuvEwJPgcLmCLSeXx {
	NSString *TIrzahMjMixildEUC = @"XbzbotXaBhDbSIzztyArVlSRUwmIGcdWgXySBYMGiriEJLoYqbFtilsiWcyMGTjCaLIWxMxiyTbrCCbfjCbzDBMSCBaMJlpytKhcmQT";
	return TIrzahMjMixildEUC;
}

- (nonnull NSData *)VdsRYsICBRahiy :(nonnull NSData *)ltpyEGaqrhWhrbcj {
	NSData *ecBrzrWLmjfHXQa = [@"lpzevhNNsohkJXdeAtXzXpEVSTWGiTnYCHTWAWLHqwtPHtjjrCANEzksTzbHxqosQOqirqUBIvGBtofveLZbeShPoabbPxnGfncpIUoEaIgArnNqtAKEaoyTjMvbgTuUElxnvvbHZGEiSWvrehu" dataUsingEncoding:NSUTF8StringEncoding];
	return ecBrzrWLmjfHXQa;
}

+ (nonnull NSArray *)JwAtSxOpxxqQADtGLm :(nonnull NSDictionary *)oeTRFMGWjzcMVKZ :(nonnull NSDictionary *)gILZuUOSjxUrPxMXEVe {
	NSArray *uXRJeNTxiDdKJ = @[
		@"rpgxhxKmNbTqywkKblPFXyDcAlcWVvwkQKmfahrPoaZqWdqOuCsUfEDPNrhOVgkHzOYAxAZCeKBWwTGNximwDSkqbBntyTbNZIMbhzaeHAClCxRiv",
		@"HIHtChxByWhhnPERCgccdDrAMQyCfpaMOsPPMtCcqzhTKcxrNTofBtlBIxryqQrgJfywpwQtPxLqIgEJXVWqQTySNijuTXutqAoiRkNbC",
		@"XuGxXUmFTIqHPJYpeYRylGpWYavKiuBCOgOTpctozmBlkxKaTXRNTBSgtarkTWfdEapAsXTCDfsMnBBpjMQZXTywMudwzTuzHRLfLggqeqh",
		@"OpIWgqhMOKtBgVhnVrgMhIAxdIcyQezSFPrxCvOIlqivjQEvAlbWnetwOpPyfzsupkADxFzUJnFQfRDLdxQYHXzjdmgTlQcXdCcWmZTaSWgdYUVIxiiREB",
		@"IpACVNbeRbMHjesOKJLuTbRbUaMFOuFBCFSlfGApbrdNgYYbydfouPBrxLUYUnXFPaiPUXQmUoUXLareUTMbVFRuFurcGjOdDDXSyFWmIovefQpYQeMGlCNYKYMvoqqKMhVd",
		@"SXsrBopVtcdjKfrDOXACdyWogfXRliPbHIXCcrbzCElHPMRSMvuBbQkDeeHrfncJLcwTtjBpqyqCJMzxBkHHHhbfHmzErYZYHHAdaWkFAkYEhjty",
		@"cKIWZTKLIAvLXMluQyXmxFXOHSUQEoRZwuwSZLhpdikvawTxnfdFlLIwkOyBubNPOssNDbMtIlgLrKuFOnDPtLGmsaJEgBSFeYHxXsUJGiTVrxNeqDEFCNQHQxQmgYdPh",
		@"bCWQoAyqLVNcLgKYcUHcuHmnBTSPSaAhuZizXWzGRYycfeSRKtkOtutsLkPHTExhrAoejeIzMVkRNfonjrWETfIzHQUVaVAmzSnSIuTDOmtiq",
		@"rMvJXSVfreYeJaUFCjrwXcPbALNEoyYxQybBbHZhRItJRNuEkPVzYumxFPpXUMcpMMJUqhxCzHQdBcyHdVZWLhcBLfaVHBoqzzgjbSSsCXSRGbyvRXrEHkNPHrQlidNZxWNMDfpifrVBE",
		@"LSFsIxmdIMvTudQbuYoOKwrETlZiJhKNYZSFizVaaUOvyfKlhmTiZSUgaGDJSLrqabcMlvotNNUSoVtWRosMpZkxkjTBWEBFYoYPccI",
		@"sRhQPQaQfNTqrcGvbKdNAFBwYyfQJiwgNlrWXmuHlToTOmuDCRwwlbKLjvokTyvNakkuaTDcqtHoohjszPGXnQWZaODAHMOamCGjeTJGUylStdivIhWoB",
		@"ZCzgJiCUsFqwVADbpmKRFIVPvpQfHBfkGgpPIzgmHNzafWXvzWgqKMquYWGpOAjYnjVjYnQcLaHGceLYeqclBaLUDIEWfhACCQSAYiBGhkglIKsHORBbRyUfjcNPGzPXNXcrALYJNkVsfifSEahZ",
	];
	return uXRJeNTxiDdKJ;
}

- (void)refreshList:(NSNotification *)notification
{
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:self.diaryInfos];
    [tmpArr insertObject:(EMDiaryInfo *)notification.object atIndex:0];
    self.diaryInfos = tmpArr;
    [self.tableView reloadData];
    [self.tableView setContentOffset:CGPointMake(0,0) animated:NO];//回到顶部
}


- (void)refreshPage
{
    [self.tableView reloadData];
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.diaryInfos.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMDiaryInfo *info = self.diaryInfos[indexPath.row];
    if (info.diaryMiddleImage) {
        return 105;
    } else {
        return 75;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMDiaryInfo *info = self.diaryInfos[indexPath.row];
    if (info.diaryMiddleImage) {
        EMDiaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:diaryTableViewCellIdentifier
                                                                     forIndexPath:indexPath];
        [cell updateCellWithDiaryInfo:info];
        return cell;
    } else {
        EMDiaryNoPicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:diaryNoPicTableViewCellIdentifier
                                               forIndexPath:indexPath];
        [cell updateCellWithDiaryInfo:info];
        return cell;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EMDiaryShowViewController *vc = [[EMDiaryShowViewController alloc] init];
    vc.diaryInfo = self.diaryInfos[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:NSLocalizedString(@"确定要删除这条记录吗?", nil) preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [tableView setEditing:NO];
    }];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"确定", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[EMDiaryManager sharedManager] deleteDiaryInfo:(EMDiaryInfo *)weakSelf.diaryInfos[indexPath.row] result:^{
            NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:weakSelf.diaryInfos];
            [tmpArr removeObjectAtIndex:indexPath.row];
            weakSelf.diaryInfos = tmpArr;
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

@end
