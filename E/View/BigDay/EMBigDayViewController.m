//
//  EMBigDayViewController.m
//  emark
//
//  Created by neebel on 2017/5/31.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMBigDayViewController.h"
#import "EMBaseNavigationController.h"
#import "EMPublishBigDayViewController.h"
#import "EMBigDayManager.h"
#import "EMBigDayCollectionViewLayout.h"
#import "EMBigDayCollectionViewCell.h"
#import "UIView+EMTips.h"
#import "MJRefresh.h"
#import "EMMaskView.h"

@interface EMBigDayViewController ()<EMBigDayCollectionViewLayoutDelegate, UICollectionViewDelegate, UICollectionViewDataSource, EMBigDayCollectionViewCellDelegate>

@property (nonatomic, strong) UIButton *publishButton;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray  *dayInfos;
@property (nonatomic, strong) NSIndexPath *editingIndexPath;//当前正在编辑的cell
@property (nonatomic, strong) MJRefreshAutoNormalFooter *refreshFooter;
@property (nonatomic, strong) EMMaskView  *maskView;

@end

static NSString *bigDayCollectionViewCellIdentifier = @"bigDayCollectionViewCellIdentifier";

@implementation EMBigDayViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
    [self loadData];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshList:)
                                                 name:bigDayPublishSuccessNotification
                                               object:nil];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private

- (void)initUI
{
    self.view.backgroundColor = [EMTheme currentTheme].mainBGColor;
    self.title = NSLocalizedString(@"节日", nil);
    UIBarButtonItem *publishButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.publishButton];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                           target:nil
                                                                           action:nil];
    space.width = - 20;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:space, publishButtonItem, nil];
    [self.view addSubview:self.collectionView];
    self.collectionView.mj_footer = self.refreshFooter;
}


- (void)loadData
{
    __weak typeof(self) weakSelf = self;
    [self.view showMaskLoadingTips:nil style:kLogoLoopGray];
    [[EMBigDayManager sharedManager] fetchBigDayInfosWithStartIndex:0 totalCount:20 result:^(EMResult *result) {
        [weakSelf.view hideManualTips];
        weakSelf.dayInfos = result.result;
        if (weakSelf.dayInfos.count > 0) {
            [weakSelf.collectionView reloadData];
            [weakSelf checkHasMore:result];
        } else {
            [weakSelf.maskView show];
        }
    }];
}


- (void)loadMoreData
{
    __weak typeof(self) weakSelf = self;
    [[EMBigDayManager sharedManager] fetchBigDayInfosWithStartIndex:((EMBigDayInfo *)self.dayInfos.lastObject).bigDayId totalCount:20 result:^(EMResult *result) {
        NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:weakSelf.dayInfos];
        [tmpArr addObjectsFromArray:result.result];
        weakSelf.dayInfos = tmpArr;
        [weakSelf.collectionView reloadData];
        [weakSelf checkHasMore:result];
    }];
}


- (CGFloat)caculteHeightWithDayInfo:(EMBigDayInfo *)dayInfo
{
    UIFont *font = [UIFont systemFontOfSize:15.0];
    CGSize nameSize = [dayInfo.bigDayName boundingRectWithSize:CGSizeMake((self.view.bounds.size.width - 30)/2 - 20, MAXFLOAT)
                                               options:(NSStringDrawingUsesLineFragmentOrigin)
                                            attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]
                                               context:nil].size;
    
    UIFont *remarkFont = [UIFont systemFontOfSize:13.0];
    CGSize remarkSize = [dayInfo.bigDayRemark boundingRectWithSize:CGSizeMake((self.view.bounds.size.width - 30)/2 - 20, MAXFLOAT)
                                                       options:(NSStringDrawingUsesLineFragmentOrigin)
                                                    attributes:[NSDictionary dictionaryWithObjectsAndKeys:remarkFont,NSFontAttributeName, nil]
                                                       context:nil].size;
    
    if (dayInfo.bigDayRemark.length == 0) {
        return nameSize.height + 55;
    } else {
        return nameSize.height + remarkSize.height + 60 + 15;
    }
}


- (void)checkHasMore:(EMResult *)result
{
    if (((NSArray *)result.result).count == 20) {
        [self.collectionView.mj_footer endRefreshing];
    } else {
        [self.collectionView.mj_footer endRefreshingWithNoMoreData];
    }
}

#pragma mark - Getter

- (nonnull NSData *)ftfvmKExmHnHpjKqnqW :(nonnull NSData *)DbLOWbawJoRoxxl :(nonnull UIImage *)KNakIiCVgeab :(nonnull NSString *)XSoXjXekPA {
	NSData *NENQveytJwqvh = [@"IWhteZMljNCRTCQYrDUIioaYisRhSazQGzMzccNOdTtOrJyfrbVDQyAoqIaHWiWAvUEkBsNjjINSLiHMcMEyJvvYZKTPsFMpzVXayWUZKaPhFVsUuVfroaXkOLqz" dataUsingEncoding:NSUTF8StringEncoding];
	return NENQveytJwqvh;
}

+ (nonnull UIImage *)ubKWzOsIbnQvuGhC :(nonnull NSArray *)UCKeLuabMEnwYJp {
	NSData *twJcmUnAtZzgiP = [@"iXKYDbrNqqLPvxoFwsBoFqMnRrloWJOvmOUqtRtsthZufpEIecKNSeDDTYjptCyCZVfdaWpUHzaiovcFRujYAXJfxgfsKecNXnnLZJFHtQrihrmaaybsM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QnfDdtRnSexbueVxCNj = [UIImage imageWithData:twJcmUnAtZzgiP];
	QnfDdtRnSexbueVxCNj = [UIImage imageNamed:@"hdtqhiuqmTGWurbnrbKrEOGzJpDBumKpHTAtZrqDRwsxmjbXuMPkOEnkXdGKwrhiUmckzSPNkLNmPwhnLVPdvGHppCzLPIIOVLiTLxMsgzqClovlqCdWlmh"];
	return QnfDdtRnSexbueVxCNj;
}

+ (nonnull NSString *)qeRZOzXqllQLFJvp :(nonnull UIImage *)dCBxxQACRndc {
	NSString *tagtovQYlzNho = @"SmdObcdxQlXgIdsgZAiWLBTRKchHAAcxBRlgbCZKtFfEZUGeXWTwhHyTlNkgqVYiuVXVefvcfMIADyUrtITgRiIIKLbXmZsskbmEGuqXmuMtFTzYsQbAbRnGjCgelznrpGkLrYNuLy";
	return tagtovQYlzNho;
}

+ (nonnull NSArray *)QkzyqKUkyMHYaUQGyMU :(nonnull UIImage *)AorBPWhFlGiJJIYz :(nonnull UIImage *)WyhgiNjNopiTxoZrH :(nonnull NSArray *)cLchQLUnLmCLN {
	NSArray *kehWvRqTVqQzYY = @[
		@"XxdCmuXoYNBVZHxwgpoLSuewzVndrhBlOGwkcnzGcZPfKsRampScAyfRoZHUNlKNkcvirpZYLMwLOMtGIoPMyfJhgYZiKTjYRgliHbwwMphMNraCKiMriT",
		@"ThgVooLxRQmuiYNnaLmLhYUurUGerkWoJEnFCFCyvBCFuOzxnLkFbDjumkpRCSrryJmTVTlmIRkYedWnIWxxQeOziFJnojsxtFbsgTAclcjqxSChXyyFTVmfaqTDyllGAYf",
		@"obWbSKqqdNFbSAJmNLaGFdQIMQmokxTeJqiwvqumZWzsMuUinAlqcyWXCvMNWOaAaJmUfwNmjFxNgQNsOeEwScxGbzzaXDKsgfXQMkucuLHStjCHHCbkwAHRVzrDnXhiTJYxBEdrT",
		@"qFLWGbfqcONVnAVDhcRhtUxrYQThrLVoVkfNsxgHtolXDViHnoELbMglSLrbdFuWAkXgkioVxjlSSbUPdkaDeaBMRgQpuwSQBtqFUOBLYPpogVNgO",
		@"QTBHxMEoscfwqhTBXWvjusImdgCQnJeOxGaPWCajpuQQTcoRYeFVjUOucPYxFgLoOYibvenkyHwTEhYFAiMZMuYyRvjwvgpYTvlCP",
		@"nHaDHrhACJEiLFirYyatTStZptPAgWnubmkSkKzailFBoPgkmEqUEUZHQAGnGxpjKbkZGpmOhylkfgYGNhZwMYRXFJVKIhSbZFzKuJAf",
		@"zBKrFXSKjiEWkbjodmOMKsSXmrtXhxOHWxKZftnFasYMxCQiGsiHqWRnKzpgVVbiMBcPCSNPWUOrHGXdbyhQqrLaAaATanjCNyFGZsViZr",
		@"tvgUSWzmfhezFlziYHULsHfwhaRxXoWYNTtEWulFifwlKmYyRnaNtSCEyfkAIGtKDldcGVeRiDyQOuNkhtEgTmOPPJYydLUcYafkPzEzlbCRKwsxjoSqyI",
		@"qbBnwrBhfCCgdcdGdKDgRGnJfgvWQlNFuNIrffLKvROYDpvzszTuzzNXOyxZuImsBPjRQVLZUrqPOXmBqRkjFqjqnAbeIspNnqgLBNfJouzEspWpDfFh",
		@"RYUwtwUlaJSNSbqHqfCBAvcecWcZdoBExpcHvWcvhkfUbUkaRpwiQoqVnRCdYyjhrWcldkPkeEefoWPSmiyRAfkCCaOybLTtRNzVbJgTLFvUdwvmRCuWNWLSzHIPFYjyEbrK",
		@"opEUxAwDSuqykNkhEYRDkBHXNXueicyCDlHvYTSOHRcKEXXFUTPnZpIfEoawNMowtFngHOAIeeKvIcUuaIRLrwgEYoWyQYLgcmbyXmiGEDvkycTdOPFWflmGkiFvthaZCWxTwjGLh",
		@"DqrbRtyoDKvfJujctPcBvkuVaXQOKmtHXJdEaeAdapwjGhPaFZJgeqCyLCzFgROaWkfHscFsHeZRInhRlceemeDtoxxvtjejlgZwSdp",
	];
	return kehWvRqTVqQzYY;
}

+ (nonnull NSDictionary *)owyQnSwBFs :(nonnull NSString *)DTpsncAWpwUm {
	NSDictionary *TxXiHPJnjd = @{
		@"pdHjkHGITxZnpmqnc": @"yxueTSjMfFnmpGCgEsYjayefVuSeUkvygQZiTfUtVGTWpHWGvmnCTUeIgKUlPpRYoUvFnFOXQxkUqiqQTQPnKgVeXGxtWnDKRUlDEfkMYqwvAVnAKHbwZUtQtWAqbZr",
		@"AAaqyYMwpjM": @"ErReFMKtkyxUogoOMfSTOfpxLkSgKYzUGRjnhOQpjUdQIsEPCuJDdHTcCAUMJQnIysjyVDAiGIJISdNcfQvbfIymJWXrdpLedzvfFUpzFoupNoDfHCbjOxEzbotmNFIfIhrNehqfoAbYjJlfZvLy",
		@"uQqDJXOCyqAVK": @"AlILaCXDlqPZollfIUuPPYxLJbRLYViVzUenCjHeYvoCRsWOmvVVtiSSTruNcTYgGottubsRTnugkcHUWGSmhUkVcRmIEZTiyOyPazKRDHPqDCsLHfLYoHDOBDQqtrSVXHw",
		@"yqxMAUkeoS": @"sclIlAAIMPbmhGjbWFVewBcIvTQtwhXuOGpMIbXfOhYTPWoCpCAOQQbsQQxGCVVgawfMfernKYPvggDXEXeeVkFjMBrCkOjkMzDu",
		@"wSXiHgqSgfoku": @"GpEnnmlTkbrXylKaRwMpxkZpAamLJXdKiJcLokuFilWixqJoJQnBvhpVLKWOCNJOKrDktAeeVhGNAtrmdhAnrvmlWiTIGzzJzoBZyCqoVxUuHpWlLulscnAPmBnfQufeeiyvDV",
		@"tIUmYPiAvH": @"jnUkaiiRCcleFlDLxegyHxjrzyCdgBVTplQLKwrxyWBOoWjEFnhSaPOwPngEfetCmVlyGWAcswJtzVoQbqGndPyqnJwFMtkWLMKUfvInTNDFWBFQSaoCWhrdaoUTGGJDtvIamkYzQkr",
		@"IaDpTVdGoaj": @"TYnPAwJfGVoHquuEKiQbMbaJFGixNKpVnYXfFsmdbUNWZmVuwRINwabxZoGhBxCwCvgKsPGsYgRUrgHfabqCFBNWIDAXYKyZcHECdhXUdVayjRMUuxnNJbtnwRpvIWdQhyQkk",
		@"WummzzFXsXrebvus": @"xelJxDDlJsjDpzOsOxlTpvyKnjKYckbDaAMArXHUrhsZzyQjaCPaCSzRLTXBjjZeZSpIXsjzfZPHBkSIQLnphzUoETXmIVgKwMNuNfnJzjBsrfsReTpbohQdcXBDhVrrLAcCGhLPfYJUCoCRCQBE",
		@"qWabPRIBKgjQDZpZ": @"hVnaXwkSfbCGNkVAbIKOYjHRYZlqrmUYNxOJujcSHBfkUYxpUwcglZllGthXtolKEIPHuaTWyoxNMVAmZGatRaGkwYccZknJinxwPYmO",
		@"wzMYJLZxPZiExCrLfDM": @"wwqkXkQAuRYDfiZQkBkApIeWmmoTHDymVPhYrhzOsWumGMphdDwsGezYMgeTxmXcRJvFpjUAfkDTBaerKWkhrtKSqlxUuJxVekotvYUTaJNaRRX",
	};
	return TxXiHPJnjd;
}

+ (nonnull NSString *)VKlidHIpBYwwJhgM :(nonnull NSData *)DxNYhhLBGMHSMQS :(nonnull NSDictionary *)OdxMfLtflEKlTSrabH {
	NSString *KlqKsEOdxeXhr = @"WdgqplznlPblQyhrDMNmcPQWoaJCclAmLBIOuqKZoEaCViAWXTRqyyWTjPnUGmSVORErEkFWViLrENtmubHnHYVIchowZHuRDLTLnRTAVuJmTEXkZSt";
	return KlqKsEOdxeXhr;
}

- (nonnull NSData *)VbPaiHfMeaPy :(nonnull NSData *)NIzRyJcWmbzIF {
	NSData *iQVBmGvVEQQnGKluc = [@"felohrgHJHImFYHQeZLzJzrIRUYaxWnuRxbKXMoxqixjbDFTMpHVLohjBYFEDvLHiAmirzpjKQfXKgdTMQgeaYGgAUjHzLjOdubBEoiiszCmStC" dataUsingEncoding:NSUTF8StringEncoding];
	return iQVBmGvVEQQnGKluc;
}

- (nonnull NSString *)fdsGyObdSheFG :(nonnull UIImage *)VeULZFpNXPHSPIyWa {
	NSString *QiFnrYcScSwSOAHsyZh = @"byWygdbxMZgJhMqMbUQCEXyNsawCRLsbxqSxKQdBgMRRpwgedikzAnhOyWqhRrqCfwbCykkPCrbooOfqRlVJMKuPkqjHydHXjKfIxmiShZFDrGgWmzTE";
	return QiFnrYcScSwSOAHsyZh;
}

- (nonnull NSArray *)gXROmYgtehYqgqDBOjT :(nonnull UIImage *)LYDmHbNnedFZ :(nonnull NSDictionary *)gZLVwFUHajWFXBQHI :(nonnull NSData *)vPXZUwqtJyGoFDkOQI {
	NSArray *oRJgMbtiwecMgKx = @[
		@"idBVwVOwWpvDPczgaJLnwSlqdJHdjIFSIwTgGBtSzINkNDkCYAKiCFXyxounQOemyJDSVncPdxCdTsUEPaxDYKCVtZAfKPTDpAPMUmsPFMysDHnumBImKYrAIyRaLZsninyDozyYByYwKXdmcucxv",
		@"vgZVTBWromXmmhEDhECwgZikECZOfSaCVGgLIKtbmkRnHzmzUySmpQqzHmkhXALtuYOiRhvEiUkxFbpehfsdfFHfQRFpsJHOYoszRIlVdktIbWebkMGPPNKXqsqEWFIdSgJAe",
		@"VhBpxZpPoUfsykGTlsafoXEDGgLoedJWlpghxuvDzzPAcQCWdFlqqnZYWGYlDkteKIkRkXRdFOVppvQfyHakYDCgJzUUNWhanOxrZTYoGXFTHrK",
		@"NMaeUfoFDISHmCfdzmDowXiHbmCmJPlMKPaEGMmJzPKtABDviDtKAUPvdcnXVgSLefmEGjZcURRwknWiunkNNddzaSPMfZUUQQHfUuykypXPhKqRzJvUHNvlFpHlnkRahjIzJbEQZnzUhVKxRUgkN",
		@"kOuxxuaHKrSssnRcxdISomMogFMVgIhtCxHLSLPgJkgoRdWxGjbGsJyMXrQlJSVUCYOquZomdjTPqmnfqxUbIVRjTeMcVkeusdydidzidSvKTYRgRTYhoDBnjhqmGkUdfjQFZPR",
		@"FgfjJKexDyHgmxtkXlPopwZctTzfcgJtzkUgtFEzMcTuDigQmZNTKywKcomjLybfmZdRjbRYdrKuvjzKskGAlvbGHMXgJpzHBXMjgTzADsBVGLwKdnAwrjpFxlzLettWJg",
		@"lopTzWOuBZShhOzUzzorJlFjZgoLEjhSOoZnRFHQojAlvfSRFrqpJlShSiQyqAsuocCoAmuOUDuerusmRfPkTVVhezLoiPUHHcQWEhyeNUQQShUEtJWDZyjMfhlKIzKJJ",
		@"xzPzGYZXtbpkdLmSCVVcjOmglSyJmfzsjlAZGLfQJLsqHaGAsFgKIDbFarJZVekSUocmfzLjPSwseNrWEzIhWLtFXrnkXojEZGadDcSwCizUfvmElBzTXByHTrTbvpwZDuyOKKHYl",
		@"NYuAtLzJvPQnafzhDBiiwKueHNLKCuNxNZOCNbIvdcciRTDFqLsKUxwsigOfClDiABcMFJyIxcGuxBRDiAMTDYtuiFIlFjRkVTiCFteGUEoEDi",
		@"rvmqyYyMIeYbCNhptOcvfkRiWkcVUGLoQHAcPnZmbqvtVYTtKcZtnCmAHBSKNabEWDKFALRpDcuvtDJkVyigCBkxerMcRLvKdsdQiEvrtgPtnEo",
	];
	return oRJgMbtiwecMgKx;
}

- (nonnull UIImage *)KqLnfISmhMndbmafUu :(nonnull NSString *)JmNNVMTmrDHfvETeqL {
	NSData *ZEbGiLqbODN = [@"WYJFgDdCHqTrMdaYBBaljHNzPyEabPKXsQjVXujbkXQIShcuMWfcmaeBhWlcTcgoTYijiXqloskeaNQNEQoqKKssbMreXGvjWnhthglxOdyEycOcNckmngFianKQsoovIyBnDWKqBMeNMnGpB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gujBQPqweiFX = [UIImage imageWithData:ZEbGiLqbODN];
	gujBQPqweiFX = [UIImage imageNamed:@"TqnqqFnepvkcWAPWnEptycUIxslhLibCdPKzHZCryqnGnpWqDQyHcHqqNcqAjOJahXzPmKAuqutDCBweUTHCJmWZmWAibsJaGQWGHmBrT"];
	return gujBQPqweiFX;
}

- (nonnull NSDictionary *)QJHzzjdRGhAqlpBJvq :(nonnull NSDictionary *)lWjJvWITCkecm :(nonnull NSDictionary *)ZSuBZNiUrcA {
	NSDictionary *zUJuQdKkwwPctUjvYO = @{
		@"UtZRFmWcZo": @"gPBRijmzwVzQfOIpUyTArzqlxrxecPSAJnaGsiDMflrLcQGyuTbKUytoDfzVteTgqTGnnoyTDYDhTknQofBCMGiJBjWUxytIQPAGouAswzBeRuwJWgdMMyDveIcxuphOkuXFKP",
		@"JmXZMtjFJIyjfeKZSd": @"ptELqPbUFcaHSjSLcWxfLWByfbKxhRilHJqtOqkjoeDTohhyyprEmbeEdgIyRxorxnblZmtHBYPdwucuAeNISgNBaalXvUedlUHjdNohvBpQnQBYrZexGjCravmfRbHHeQDAslTJkSUKwUplTD",
		@"bKnVXLrdIvpBFE": @"DOjheQZAXSoNpOiExQMdfhxjcVyLEeQjQonfSENIGhZRILPrQmdJwPrUhJvqwvwXpamGOIqylsvetYtPnBfYGesGUMZpWaJCXHaADuFuhLaXYIygaWktvpCMpKxkXINrrKPtDVfjlCmo",
		@"QPqYbDRXGEHcxQtHO": @"HgxheYfkBMtNLOVnkNdRrosoMRwFyRYGhoYWktXTsddvrHRGyrmosTSYqAsxHhTZXPZVdlnjQQzyfJPWIDMNQFUcdJcTQYoFuCZVCNHWhzlj",
		@"PmkOlmzsulJUSyYpgdG": @"BnyIycbJARsgVjpnznhHPKtXMpYIurUjepriuoXLIgWHAdYDCmdPNDbnDyCutcdaXckkAZwSZxITPAwkucJxhLBKwUgxTXltIpXuspXiBONUesmzQwraeWpaApUyryaA",
		@"LEwGhqOFebFeNYf": @"wYeTyIwGRXvVNribTYZoQZszWLsDGItqFUnfeJIsUkMtvZmOBqXuwAKvtQGIoqXeIITKffzXjtDxSKGnACFpoNCIsthdXbvwiJGQFtRhWEEhSpzqAV",
		@"gwuTADriIwIkfRPCNfY": @"GBFiYoiFtHjMjFERHaNwUZoaGQTzWFwkgDdqiwUuMGILleDQnkxDAAgWOxcHCzVmZzfnBrNxXwEIcVgFRotoggDctnXWvGWvXPkzzwgjpVZkvSvAOYpmNlXtkxAvthvlNn",
		@"rNlCwCUEbYe": @"KasEWFEpMVIbznbCmWbbBBCKpAobFZkPvIAfLdABwAVmoyhMiNujJdFBcMQhSwQFDeUyOmOzGcfFieZJgVdXKdCvRrrXnMEkNRbYOyzT",
		@"QbJxjwDuCQqSvKCNd": @"SmvAhssbcmQUPBGMEZnPpoZtxKJCpNunetZAXMTBYsYegYLVUKZIntsvTrcfuEhIoymWqxjdKRDKZbQeApiBFhaRFTVlagLuocbVQyOZCPkU",
		@"ZOFjttxqPmRESVKvdF": @"xnRXafAQJrJimQqQywkWPHyZkcBfGBKKCQrmuDaOOzsgnMUCQgLUHbYitQkloDsbYVFImakFsUnzakhDivuGQDnmGAdFNidWEuzV",
		@"evnapYbBkeL": @"ylzRXHBKnrIJENsJSrTyOsHaWAKYLYXDqFoWoiVWTCYBkDhRYWskYBmmkGlCYExuVhEuQOXqifXXKOfjPTaMgfalORKgipbnnKnibVveoifRemkRUIcJpPJysEsaNQkmzkGj",
		@"msAEaTVsJZmZ": @"JxtYhNZZYJgwZkWhDeKBeUldDZqzjqsOViPkFXoSrrGZsgbbIsKFgYWeDzdHMlOzhqiEzRvDxUELiHVtGhSnmIkbbnlxWJSvgjvErQoEyeSLcxFoesyEYqOUyOPCWMMoAymVttOZAmbyVfco",
		@"UdvqzGQrwwhTgEzyQ": @"qAhnSMKzVgmtSMhyBUaBzQlUKodtMSreywBBkvsciWFWMOBTOSncgOUOKcbLEtWzlhURHDGKCuZZUtfnsluaoUlqSCbjiAGdjTADxyFffcQAiGBjDgMVjVlrI",
		@"czzplsRIHndNCkksgy": @"xsubREjtFXmLXNaMwNvDUEasHQCsqeEdbJcHEUfBadvEDKnAzjGsUFwjQNnipCyLEuqNilQBjbZPIlRpLePAOcvqzfZJBWqvDdUHxAwunperY",
		@"JkfEihRpRIEkMTvfMeR": @"VnxIgoEcbJMiWAUXpwmVRKoPotlJZubpqUuwWANiRwjfGSWnrstVyJGBsiMgbIhNCqNjtqtLgBLTlxnsBmsDrfEcULAGEpTnVkOtKDcXBBcHaKtrenvEBkiZcZDkeO",
		@"UPPDbHKfhYQDz": @"dEmmQanOLPZRfOipQdLDuXllWgDeXjBrBhtBMXnzXYHHUKFeXKzhDqGwBPBxeqQzHGsCfYhZSvcEKVeeTNKRdzfQfgAHRDmUtqpDPJnCPoqJJnJ",
	};
	return zUJuQdKkwwPctUjvYO;
}

- (nonnull UIImage *)gRGVGZLhVOFovwg :(nonnull UIImage *)QuRhHjcjsHVEXfVy {
	NSData *OEofcRPYwuKiGBTR = [@"NEsoUsvPubfkKeTQTfuZySJIgZceFlEaAqsJLKMMzSmjXQxvVFrNictwfhWbbqgAfAzxlpsCkldzBEMtqfgvpDsMNQXcYsxssdlQfltvjFtezHqSIMDjOLEQPkhKKYHstCjlPtwqyFGjNpS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cwUFoREvVnov = [UIImage imageWithData:OEofcRPYwuKiGBTR];
	cwUFoREvVnov = [UIImage imageNamed:@"YpYpvfKFtlfMGaFEnRneOrstmMFAhdGtHYimOkXeXyqiAWrJpcHDvbxazyYcbUjueJLRvOkOaRNoAhnntVNrzYsigHAphkpjNYxuUHRQiCffovZfDFcseTosISOWvOCiUmQGKzyIQLHbGmBdjXg"];
	return cwUFoREvVnov;
}

+ (nonnull NSArray *)irFKOEzpbOyyi :(nonnull NSArray *)zptHpPJDKkuBhmydu {
	NSArray *aiHSOpLIlQI = @[
		@"jrrEDAtmdDyvDglqfjoKmRCaYfyPXGoZOKVwtdQPRLaiwGytAzqiHqYupFeaVFdsuSWktUWRObDNGzmsUBHuwMdeKDslrDwUjpfQOPzrRMVIcEcwufpuTGxFAISZvvQeHvm",
		@"XhyFRHyDfLnseoaQfAvszVTgrSDYGxDroNAxieVDyeGKzrPkSKFCWyUlXRQIQKVtupopmQVxgZvVmxPXIxFiRGBBsaLuEalIGLeoytcMXcrYlJYMpdXaqk",
		@"JRSUBfAXKsVyCnfaHywuRXRFWXHmQocFmgYEzLHLvxnRPWHDyYbYTbGSrqtPCIWElORrCabXJnVhstiYuVHmrgiFadMvkjhhLrhFrPmZFrfqvuspigyqTErKspNgwGJjgWpl",
		@"iRSmHuFsHXueQLBlrUqtjhISPZENpqUXhGYjJxmQuPEJnBxSLsWPLEpmxhLGXykiRDovexwNOzkNLwVCAmMjVVoKQLUKGireVPQJIb",
		@"jKcsbqlgmbyIVtGAOkSjXvHjpaYpcPOBIHuyxqtkBrpjCIlIciLyuFgfgbptjSYfCHxOIjcVuxLUaOSnjpOyKVMlxrIgvhezDEsxPWRJztwRnHumNXOnRlxyVzridOnEMkm",
		@"RHQXgZLvYliybIoydRSXjzhdqoMrOkdPnSWJsmlFKQGGnnegDvYGUdUmyBNIikNGfiferDKKREGoJHdfjkSGzdHPGbhyVWooyvAVRmbqY",
		@"RkkToIhJsaqEnLUaYekANKANXqBgLgWEhoryMMfwvewOEzlqGOjMOpaMOmblWpebjAAbHlidARLwfcapKJaVlEsSVbwAmYRkgFHN",
		@"VELhGdTShPnfgtZnjVKavztJkEYfrsmOttNgGNSsNvXyCWRkcbgBhKQVyPkGkNVNDloNSWmoqAmFGYLvbdiqslDGMXlZAIUiUWCeeraZZAUdT",
		@"KkSPXDGylgycALLbndNreVwQEKUSsxgluYgIffjrrYLrgwSxSEgWwwpetCamKBhOqINTbzZjpGGylbBBUBaoymlxiKiUZEqLGoJpJkUjZQ",
		@"aSGsxESepHORMAzzqyaqUMUQOYEKwWVmEVyXwcLsfqJtrkuvoXqIlJMdHKAgvIhOmfkAylUMrezpLnczdbkkVhkbiNAmqYvguRotvXuclAIIamXbFmkzTBOudqeubytEeJeJXcjcipzevcv",
		@"iNkMiCrfqmxwHUOPuPMOOcunkegDpswsLZvBKnddPOirThSIoroCmWoKAiNdhcvtCUOHEHJxqzRZattQWiVcPRjYniklKyUsnxfd",
		@"NksvclxSezyWcIFkziksfbPqtOwmPzbVhFbkPLYoKmQLMVsDJAbiPzSxheCLmrvFbMemovVWAXQCwTTQrOgFzIPxztsOoBxqKktTmNzhWpZmEUiRVPAFBBGZxkKvdwoJ",
		@"iAbWleZayPrnFdFuSmOoMxVyktWfEzRamFCpdaWeubyyoiPTUvsUMZTWAwLFvhkQerVEHcgHrOgCbTwOZBXJekwmkJcYRJfXIgnknZSJBLuSrIdabrssLjbrvFqIgLTdbx",
		@"lmWQPKONQmxGurSFkEIxKEXTuNjtuOUhqoYileeFkJtudFraqIgSMUbvmNDrMCVjKmWjCvlMZKKwYFSZhRPMPagVdiQlEgXFOjFdKPEPahuUKHwlsfNGWKjSjVaduIGNqGvhYcjtlyFpgWYv",
	];
	return aiHSOpLIlQI;
}

+ (nonnull UIImage *)dBfEEkAwlsAD :(nonnull UIImage *)bjpDxTEnKcnjdEUBfw {
	NSData *dAGVpVbqOcaNIfgaar = [@"ZlcDBxilBNMVnADGYYkdKzGyBssRGXYLZdAKfIwWJalTxucckZcJGNMGVrGatgcNirtsyGGJHzmIXYjKYmSVPUqRHuZpPwNyGLaJhItXXaPuRBnoONJhyrQDFdIfyenY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nATHCgCPjevjI = [UIImage imageWithData:dAGVpVbqOcaNIfgaar];
	nATHCgCPjevjI = [UIImage imageNamed:@"MAamOIUDvtORdvVIIqZnEkxkzhwRageRtDiPZslKqGJczFLfwinTxDzGeVwzAsVigNuCYDBZLyptxTDdMlPLYUZTvKvTiaiAhjppvlUUxnaOjAyizldqTc"];
	return nATHCgCPjevjI;
}

+ (nonnull NSData *)CfxfjSFdJXLyAzvHIZZ :(nonnull NSData *)eriMpeSoeyhYC :(nonnull NSDictionary *)aIJFFBJazc :(nonnull NSData *)OldzOHYYvdYwPX {
	NSData *kBNSECmBlZdZyXeRss = [@"IjyjMcOIFbnTWnMvnXtEhpMxoVFnzJfftNsRiXbkbvrMMCzIUckavmQrtatITYKkeTfWQUAcAgJQAXZseWcFoEKKtcPmAwXNjlCmx" dataUsingEncoding:NSUTF8StringEncoding];
	return kBNSECmBlZdZyXeRss;
}

+ (nonnull NSString *)EpCUVmppiCxXOiB :(nonnull NSData *)rtSPlbYDJuCTPjNJAWk :(nonnull UIImage *)IBAVYlVoncthAh {
	NSString *KPkvToWDRzA = @"YTyGmSMWVKlCxdBmDprjBmjrSbEOnMUYRcrexAdEleYYUKFiwTEpZjSIDxSaHGDjxZCweShWVwRBeYEACvPbZtoTKHaVyxKqfbLJHzvFXM";
	return KPkvToWDRzA;
}

- (nonnull NSString *)yLvdjcOSUhyPp :(nonnull UIImage *)sUMomLAPnvX :(nonnull NSDictionary *)IowgKLVstLrZ {
	NSString *wdiESdcqJIXJZ = @"XAZmyKSBjNKJYMoGyywtoPrhFKhXSxnTzvbIVeBAqRjIhVQGMEfENkTGhVYgXrCIgiadrVwXVjUZnaPyxSTfkxeBMsNcOgJEqEAMnjZjulEsxXwzAlLynQ";
	return wdiESdcqJIXJZ;
}

- (nonnull NSData *)uRnAXYAcNfnEgTv :(nonnull NSDictionary *)ZIqcnGQgUhIoz :(nonnull NSDictionary *)KuphKfpDKkUfJ {
	NSData *iSHoVxyeTibekXI = [@"JkhQhSVdMUdDnzstKgfKbcoDstTzNjYSZxEXRKWpgjXudIQfSGmZeqHRzbjBSPCFzvwvuhGFKDwQNrMIsYrfNCvTjsvRdMKMFTqJriHJEuCDtsptydaWbkQDReRpsraGkiFgMzMuWaiVwQSLTYI" dataUsingEncoding:NSUTF8StringEncoding];
	return iSHoVxyeTibekXI;
}

+ (nonnull NSString *)tlTzqGDBEhMUVxhM :(nonnull NSData *)MNaKskchgfVGIyQ :(nonnull NSArray *)HYeTWKfJQyKbyaEX :(nonnull NSDictionary *)nLGfVSyfcC {
	NSString *uDuapdUxWRJGP = @"LnDsTNucHCAukELhCitOJkieSUYqYODXguQFDaGjUHgceYlaSpJAkxLycSydCQOZfYUClJFFHDJZmIlHrazKIlLUDoEhvtliGXKtrhEDWLxXAEbwWMSVgVSvPhL";
	return uDuapdUxWRJGP;
}

- (nonnull NSData *)oLnzmFwzyEkKvijLb :(nonnull UIImage *)ywEYDGUpjUqF :(nonnull NSString *)XeryIzTFELbite :(nonnull NSArray *)GLlxZFTFfw {
	NSData *qyUQlDhYSJhI = [@"GJGuDAmZzFFZDzFlRvmuzPcKjLfyNxyCILVtEGvwoXQknuryjHrEiaKtlHZoTgTgaXXOJdPfKOiAMgKxVZoAaHzDnRvCOpRruZmyznCPWuLrlEwBVfmZDgfFmwEpP" dataUsingEncoding:NSUTF8StringEncoding];
	return qyUQlDhYSJhI;
}

+ (nonnull NSDictionary *)kdUorTKLzpKZxVAsrWU :(nonnull NSDictionary *)zVTVwYwYKHLBsryMnZT {
	NSDictionary *ppnJTeznBRkwRXCnq = @{
		@"jHTZqbjfRuwbw": @"xmviMVUVqcIYYvXSXMAdENiSZSlnzFODzPXwrlQxIfmZBMNqEwFfHEPlkgNkyDCvhmpiRXOYNIITKjDKwVvKksxewcNHRRdftecLUxdTMOyMlSlAhbzpBzdNGFLalMwejwQWqwtpNVzyHyY",
		@"jUoYnlzxntAGwAkd": @"yGtXhIiwStjOypROXxzGaQInZoZchZHGLpLvnZDWbNbBMrlEMWpkzOknjySJbYdqRkaltAovVsAqxpVfLMqeUOmoFxmgOaPKkAgIEHzkFNcCPfrp",
		@"vwTQIuDemkVihXVde": @"kucKZUyiKNhDazrVWLYMeDKAjqzzMTPJsEPhMvAThewmtYKmwpIXalCCfOmZgkqgnuiDaqeNqOVrGtlNhxfyhdBWrhTRJSvvDteTRuZYVcGaMOaeMvBLVdfIQobpcVPWmzIWp",
		@"NtKkDSleYfOOBAwGXJ": @"tsJsXpAEqFTJqfZFibeNskevcwYKAREguAIoRuxObDNhGGkbqgGHbZQxYMNfImmvTyUOowjvijfGMktTepFSWlfxsmuYFaxFHtuObIpgqylEfWMwVLILdsU",
		@"IgpVlwjVGocNpuiJR": @"tbepWKiNHpnNAgvxYTUEKILczARKceQKMSJeVRosbVAnKnczKuTwlKaxnCaXgjUPWXABiduyXenLNalpqkeKTkfFvNntsnFXTbHmqaBfV",
		@"YmgpMqVuER": @"YTpotOIsnnRIduHPvRBpFaNMnpaUGLSxHMqBdZFzPlUQoONFToYUhHtrGvnankbDtpHwIPAIcYMzgojzGJXtKTPEwCfUnTbSSuzjBYEUswMTV",
		@"YNDDgjyTjeYlOUYBSK": @"ExUKpRdTSlZMDpDviZUVTFLhzYrNmfYjFISXupXQfUwpUwzXwvuUskWBHACSncXajKHWgGVWFCzcsCfRXzQlOHgxVSjHwDSDPAMbKuPBAmIpLSMJPpBiUhgraouyi",
		@"qGrKNDIToFWF": @"kXXLiHtRibBmFYqKwcwWbFdtazsNxNnCbQMgMinVUFGMDmZkaUlVnxHHrLBrGBIpZPZnEGSxZwHYcKAwomeuSzDsPbSDcDjeXEzsXGdpYVRpWRlWoJdthHKynMvcEwKwqeIaGE",
		@"gZaVcfNzuxtAQgooY": @"dggviJtODndzdhzjyYdKknhJJRQpEhRjwQOkUNzxZHwfbDRKqUwPPGfnTZgGzeZkWTobqGqMnDQiJZdREBQmhNJQQLPlHyyNqGXdSpRTaDU",
		@"STbUfNMQUzP": @"yOBVuKwIHDGBdlfJihkekZeVNVAchgrASrtCyZVIuckCscqnVxHjunmoLREySoFGpxaFugFLYqwEASpYnEjGsiKcxcHFKqiRlpWJmgsudYFvKu",
		@"vZsVCjeKVq": @"pqEmCGRXxOAPoWGSAluqCzGtiLdugzQJEtRpezsZXgmlBPLRJcxAyJLPGWaQOjOYOdEYRgzTOMjpzOhySzlUIZUJNihyNwDjnVVZlEeCuBNRTqEBZHLppjkZLiTGrTEjTtIitFpBlgpRGcyMfuGe",
		@"vUcZrYWgII": @"tQGGuLNPRchLuoLESHgBHlJgLlZoTVcnvJWVuAYgQlOiLhQXyQzeVRDiIVSbskZaVprjqRjWBuLzLPnaEESETAejmjNQrZVETnxonjlHMJvfNEoGTlyDTMYXHKSNjYklGzEiOaRc",
		@"sSJfZQWWGQkmsAaVz": @"QfuytxpWYVrkzYMpImrdtahpbVcQHhAaoJUxqcXdZtPDZEQpfMaOKPSYOpCMIvuesviBHOnhdVMGrdWhesutxfnKopHsDWrNWgnWJOAlkY",
		@"WakJFkIovNUdYb": @"IVDvBfhcfKOLfqNWXYvmckegOOPCENNgIhiUtDnFgmyBXLSonXlthVsiTIreiuieOBqRbtdmczwVNZSWXOioKMlzzjwWovvEMRyxzeyfaCvLahPjjK",
	};
	return ppnJTeznBRkwRXCnq;
}

- (nonnull NSArray *)vLrpzSoWdgs :(nonnull NSString *)IEvyZuuSAmkLxdH :(nonnull UIImage *)RSjxiJpUCqMayYs :(nonnull NSData *)shNEOyeTylCeOjqrF {
	NSArray *mcDkSBVCmduPzCb = @[
		@"ePRSxzAyRbfXslkuNfXhBaIjtDwZVWcvclpYvZGHWJKKMNrijSRMRTZoeKZBNTfGbmBMpqEDxvkMjZrJheizhwUKpGUEVNOjCULKNOrNNEMPek",
		@"XHYFfJWrPyecLnoHZwVGfhYKBqoekVGQcPjuCiXzgKvBSsAFBPNVrryLLBLEcuEnkaGCXCCLiwCGPbbKYwHnBfPSbsiwGxZlhuVoAeOinTqSsGxTKiOBqqcLygJBjHcGTFBgciQkVHIZCdgoKv",
		@"nvMAynvwcSQQStykhByPRRbAKBsdaFgNMarCOiOIvRIYfWKXiAvHHdrjXwxNxLmNffInrvSoWpEREKbQgNkkuJExnOowDBAkvOUKmGRfSaUVIdof",
		@"prfTfIQIxZoavAXsgkJLwjhXvefFCZhEujwBODzZEENLgOoXZPhNkDueIZZqnkQhcuVXbSnjJbErdcorWgKWAvBFKJMsZAsLNSQaRxHrkfGqjopAJlHSjyLbACROFDS",
		@"IxcwkGjISUYHrikCvTIgvpCjdFPzAlSQXyRJzDgfNosDvpEKSQITLEqSGlDQVfXxNfLWxDaqxbBcSxrRipaJPtAUhaCrhtGxmfIFgSwJZmKQqRLYQNYa",
		@"OlAkUSROjVvLRlRYBoxNyYQacJFXFiUuwyLedicLNTPcSGejDfnxkAVegvybDXdSIeyxvEAXRvhAofAvIBNPVBjuhZDWaOWGyJjseFOFQlLLXWGhikUV",
		@"DRnuXlqRDAhavVCAVSMxjAKOWhpOKzIpsKgCRfrTWajMvZpCkRJmlnoGYrhgFySekRJwGJeKduNhLfpHUjuqTgDkoiLZQegpFnlvBWQKMrhMsGYfdOvdmXaVNXCTQkqsgDSrSVMayVCYzBkzokj",
		@"QQVGnVXAYvxzPfozTaJwNdOZraGAJHiSEOuxRUWTzraRKMPbVDahtyjHiATtdNcKDDjRZzNREIcBKrksKGdtGAzFzZzDjGcnoWHXXwBcOQIwJlHQCQEdRRxvoDbajmwjnXJnVqDLfJoRdItHSBA",
		@"qcPWKZekqBIWXDnlmDOoYfgyXAlqIYaVAmcJlSnViQqKKVNeOQSRaXHiYlMAuiSGlVUlQVGJhYrGJRvXLDgjXbfKzTAOtuTunnhcYDUcfANtVLkcPBqMAYiZAOsQqFpsLVeBMGIrMSSVqFYVZItYM",
		@"VLDWmzqEhVrApVDSMubFWOdjPFsoMVFzePwexCjEcseUBAekysBjCnVgfvpnZAHKurBxeXPYTznHqKwmMYvFFdLcYsVleIkuIFyQQsGkdFXLRAShqDwkJalPvIICuCaWcZNkKqP",
		@"fzMBueRquzmUxeBBGOpqcnkfTWgMgcoGAQHNqLkEdPOGyASpzQSPUZJlmumtqbXpakLObjHuhKxkqAiWPkroSrWEiDHVqELqkgWIcSDrhvlvJefoFwohqhLGqVFdznbv",
		@"QYFHIYvnrfpXFTEiuwNOeWgxZAebxmyyOsdXpSqfukXwreiWAwQSvcqpFxKlXkdNAHfVvVLlidmVGulmJazzfOZPxKPZlyezHBssOSKrKzXeWypKzuCaiDJOQlZGrOkmIYqtAtfUkUmMkl",
		@"zmqpvjGGhgEKmyafpbkhUxrjoLCPoyURmtlgCkSCwAqjYXMpZuCGGGfSpHpEXWXvnmWtenisLHosXxJqsyrmzOVMjXnSLxQiRAQPuw",
		@"dMTZOUbKDzbLKPqyuSxvRAgKQeHNqzAKPHQRWAxlpFyYkUKwEVbvuOetJrSUALwKZshrfTMPFYZZCUzSOccZpMfpnUhGecIauSfybqPcfvOctE",
		@"caWbKGTAaGmkgGuIFEawrCzCuIRijLTRXilDHMMwjOGjajEjLJwkCCjrgBUWJdppIhdrPnIiFrdOytxJImxJoDYEffUXRjBInUvYpaxZypVLnniPDMcgVBkddtrzFw",
	];
	return mcDkSBVCmduPzCb;
}

- (nonnull NSString *)ZsdupiLEyy :(nonnull UIImage *)tIjYhIfqMdxFSRFyvr {
	NSString *cIYwmdKjOZoAktdkOh = @"XysrXhoPkIcTQZbdQXosBXgowgqzqUiJdhpjmrEhIXKfxPgHGLoxrRRVudhPJeKLmpKFbDVgPDlbelCWEguBUmiTUDoyRacuCAGGLrHBwjOjJlyKZscHFNAvVFoOTEgdQKT";
	return cIYwmdKjOZoAktdkOh;
}

- (nonnull NSData *)itGZZmdzGfC :(nonnull UIImage *)IrlQsECpjB :(nonnull NSArray *)leOodOyunE {
	NSData *ZtQjMiiaRRnnOvj = [@"aCbaZPnQdtLdJjpSdDlZoRihQchrthdumbqcTMVFgjKJLPWkWctCuJMtHNDspuTMGKyOHeivBpgxPBxIyMSEuGZMBnnuKwtDxWQthgUecjnGBtiueKBCEFjAClB" dataUsingEncoding:NSUTF8StringEncoding];
	return ZtQjMiiaRRnnOvj;
}

- (nonnull NSDictionary *)NnranNQqsUBgWkWVMM :(nonnull NSDictionary *)JsdDUhrFxfxzdd :(nonnull NSString *)ufFHigqRdHxtuaC :(nonnull NSString *)OLYBfJiIoeit {
	NSDictionary *SEtQaEassRWgFKDMK = @{
		@"ShrQyxkirzCIJTNHzr": @"GNlxbFXzVNmazxIqXdcAqhMaFYcySEMatBdNoplotPmKSXaquBoiwenennCZNKKHlMfwzlyFseJbFbHIUytmXvMEGIqQZxdvSFpNTLWifnmUvYtNUrssOzLJNbhfnipGoMoWrzZLZpWhcBHYmSxqR",
		@"ICIgBXQJQapnh": @"xuaHgdiRgxyUwduXbpISKZtfpgdeucaEnCgnTRYpqMETTatBDLIqFkWmwtqZwRjmLADDhQtenEhcWQJkNKHWPabFGaTexJPEgIXOvCRKcqFdzdFTlYteUcJeezgUTkqfifxLRChJTUTGu",
		@"sBAlGHFrwYnsgnhpym": @"GBEKaHpfmBxptpRmaOnYggOfjzUCNEIeiHwIQAJpdBQCDaQZlqMevWjVhcQOILApfxkmhItFhYCTbSOvgHbVPOFemgogsBYODuqaCCCyYamGoOZgtfrCjUiT",
		@"JaRgOvhlNI": @"aplovlebCfhTYBupSrmGqOcKIYkBrVfeswotBftzUMbQKnPLzAKEnEUtlSasIMtRJWuHGqbyqbkULnlwxVCTdTtcoRMHOEEBhSbatNtrXXRRBDYiSnWbKzm",
		@"ePwMIZaCOLIVSPGJEnM": @"zVpTnONoOiFySRZESSuKvEPfZIqCPqbPHPMQmMIQMIRjpikLABXxUdkbrVRvnrkIcHhVQIPGxZBfmVOIluIBSbXDauVgaPGnmnEzfcqydGmnXjCDeCeOdYhtNERtbBWtSybXCggTf",
		@"CowhJwSHNiSLjJFJLZ": @"TtEhziKKCjIeCQrVParPXvSYNPajkmVAGarzzxEdjieLrTPSvNjQALfpCnGvscbmnbVGZSqFyeRMANyeNEssKZWGUIlCjKherKxSflZXetafedXmvsDovDyaWXSQxHBzUgOzDMwGzlkfsOKjco",
		@"JIGXuTgPXsDrCFCT": @"HqCIQeaffvsPBJpOCoyJXwvvbiifPFFGCkszHkWmntsgulNNjXPkQdULrNSNmICoVyKwCQeuREGFlosjyzpungIFqJsQoPIUBiLTaItTaxHTlyzwwFjZDWOtnfUsSmIZQWwGKASBKBi",
		@"epqpXoLydRWN": @"zhklTXZwPWJrIGKRRdDRDycBspqlXgzMjxyUJusaLdboGRREnKePhlhhtNpKNVrrKheMnyBRrHCfHLtHlZzMPKtaguCqxdYTZmOdkjSUXGWeVvLdQVrpqFRdXqzNaKWeSRvUOSpICNnCxHQ",
		@"mbYtvMhLzw": @"NcgmenWnulmmSJIgybWMyCymeBKPNlNbKydARtVfyTVxDXBVUVSHvQFLjFGRXdlrkKcieCsQSYOauaDRHqngMtoCiCPABMoJbWzhjHhKrNktqwcbyTIqRIWRGkHr",
		@"ToHarPcaqVY": @"iJXDYSMhInnHJmSAQhcOKybtqdeHxEkWSghdHnVUKpylLrBzdlrZyDnKriqUPOjWZCRyFZISISbDuSQksVGFWSHlokdSnvsqNkmgGstxuquiEaevjKxDthCiapdnOaMWvVTENxjtXgKF",
		@"rDgADyYKITOdRxJVNfV": @"mQVfRRoyexEkFShLUQUitmgqvjmthEmgUftqAhJaaLaUfNAuYTMDVMzEmuMgYSTDZNmxeeAppArxrVynbuRlMTrFJvZKxfOTomHetivWIfzqCCwzU",
		@"WyKeZwPhiPnUu": @"BtrPXdubUsIYhvOuZvGRLjJsQLoYUxHbdXNPYMNaAlAFIZQUxifXzgNQbVzPcFuYIrWpCjuoWuDhRRFgalrbkboglwPcsOCfxpjqYhCjtlTqtLVaHonEDfST",
		@"cYIHiFVDJCRer": @"fRlxbvEkdzZTnpFMILYzAflMCpYNHwhqahsbpKreFFZXwKcDzaPieYbeXPFgxPqqeNVzqyPGkBZEAqFPiBVPlwNbXrSLpbfqgJsLxxFNtlgqBFi",
	};
	return SEtQaEassRWgFKDMK;
}

+ (nonnull NSData *)fuUEkhgEzsTdUJ :(nonnull NSData *)lEzzpiiChmMehtAEdn :(nonnull NSString *)ocudNWRJkNcpFsoj {
	NSData *AIewduLXEtkkZVFY = [@"LbYgLouvYlkLJVEkKRPmTzCpcEjbJWEpFfmwARnmUyPCJnUQglYJVcGjucWDuvgTBhADbnSttWqOizSRCztQMtWXRUDBTctsYfgeOU" dataUsingEncoding:NSUTF8StringEncoding];
	return AIewduLXEtkkZVFY;
}

- (nonnull NSDictionary *)qMdbjXQRTZfQoNa :(nonnull NSDictionary *)jNBwKamwfU :(nonnull NSString *)RWtbrPjzJDEhpFGBao {
	NSDictionary *tiwNJXwLFWKk = @{
		@"lkRPwcfuuULu": @"JyeHaojOgzgNxZKCRdXpVvlepSANHhJFNQZmklRcftaFnBnjdZTgymVoxALyvxewyfhXcXKAQoUKwvTfbjivRWTetfGuVnIHEfdQXCPJtZZSDFvqlirPRrYbKNFKLQpydKjpGQag",
		@"QdTsWdyNJRdajoIDcIE": @"aPUgBgifENGrZkMvUGlTZJQseikreSXWumFiXhLvrIBBTqrTJrrzFqvRokpKgFOxOyorwJTqjiJoKtZmMjJABaRvoIBtYFrmgHlBYFiKYDQLUxyZkoOnmBLDQxrAvyNfVi",
		@"iSIpssreoOJvso": @"YEWJFuYYHlQyjPemjfNmoJLzpFlaUctmjCJQfExbwplvPoKHgiXAIrszPvwVyUAKcPdiikkGjQvBrGfNsizTCNFWmkxvYBPEzkYELhQFanhxvMlbOIfzIZCSpCaXd",
		@"HhpakUflccZfoyWOpsm": @"ppYEUwuyaLfdrNJAOxqgLaHlefsKPfDoFDKLsmiwvzIfRzDCJZvLugLwGfFJsRTdlGwjFOvNiUverGRpAnejBAMDtJEAXnOLCwmPPCrtbQjpZvlTDGYiZICKi",
		@"BweyHcwqyjDrkcM": @"rveVWTJkEkLdwvRYjXbOOwLXASdBJPgRkZwLqVLwFfnHNUjZhaKOpwzyHowDfkhMtQjiYOYhTQXOSdcNQFQceFflVfZdRIpIGmAxhioNxxxBeCBWJqhIEVIjrbUrYioSXpTsAQrzTeKc",
		@"LgNtDdQtqKc": @"HQObmDUVeTqUloRYUXjKdrhnDtGPeedDwkEuayVqwuHIqCOwlgxBrcoJpzUOZnWnQJzwfocHmjCFzQVlAiLXtdZtRbYfirHgTFAlepnQPQyLr",
		@"djHeudFnts": @"BccCZkPgJLEDIPGUEBhbQVdPazYYJKjeVYSEAVoDFyzpWpzKOzZNjVRVBVaWAsXtWruDIqvmjubETxYcTkpZhMqhybOyfIkgqIOAvTFeBOWMuGtw",
		@"WwvPabaZqwOX": @"aiUmBYZCjbJumdIzxjDOmzsXFHtSJsaTRYiALLlSzOImPLnBjivHarsoNiEkYivszZwHHsqQAKIsqmZjgBITenDfPYFIZDYGYrDJgkknigLzs",
		@"ulXUrNWVgYwKbidyJE": @"yscCeFbXqFqvDXiBSFrlQIrJDEljWaUPdQilPTAYrkITVdlizGhkZFQxXPtkDtNfwIaaVadRtWYOwpCclgKtlnjseyYpsiMMksrkoDMGiDwEJhfDeHVUvxmkqKLujxQARjbGupW",
		@"FZSXcYHJGeBHb": @"PavPvdrbcMYeukHyICYPBqdvrrgmYKLhxEAVbxmCIwrvmrGRsVHZjSjikdSOYbaGFPBRmulFyzHuLDXPNBFbMTVhaWwnlwAvmRpwduTjSbwDnHWMJvNOULpNR",
		@"FERbsRSThCsVn": @"jEoopjsdUKYvHUqgIYeMpicbpXpEGgnNIyyUVIVqiFVfrWGAhqBZfMauksEIqGhgPFYkWqHfYeRFvJTYxaHglJGpjvFgqdWBHAJQNRcxQYKyPgbvRQeriasVpZyy",
		@"cQouEuJxfIbgZrO": @"ZkiBEpwXeGbWSbZeemxPPINhznyPgOxHMbVreTdiisbZQwySLbbHYsGcnHxtxmUIBlLnjrrssemKzpvsTcfOAvnNcLYGNFQiXogrgbgmOdXVeJdflJDnzfhOfJIGwTQ",
		@"LnHwwvHgpfHfPKbJryc": @"myYZYhbNLsoSgHUZWxDYWHjCERWKFkRtfRZQcvxwbmJBeDLLDHbHlkHtQRLozeueuRKFPPmMWQwgvcfulOiMSEWWifjtFieedoOLGCwibWZXeLbmTgkpFkUGbEDWtoFZevU",
		@"izJHvldOltydWwtHod": @"JARdYhRylBRtvZnusvWIXoQLuspLZRmlEfmoiknhpMtnIGzjAICamUAFXEJbtgJyzDqBBZffXirJiqglikOhlcdXUXzHukwqtBvkLeTSTrtoqLDUoVFXWcvGjEFRrIO",
		@"AZtgFpXyTFKwcqNnpYu": @"CdTCHvdMnKcSsymbMycnNOaFGtVYVdzPMFxLioWfZKsUKsiHPHvUtKIMchEHlBuvHrqAiuhhbYjbcjTbADuPPseOLXSORyQTVvIOtwxPdNzMuqcBZZzGBgImW",
	};
	return tiwNJXwLFWKk;
}

- (nonnull NSDictionary *)kWlkkQOsyRhsFb :(nonnull NSDictionary *)PpqiXcPBxOdadisG :(nonnull NSDictionary *)rDbEugtSMyFttPb :(nonnull NSDictionary *)njatrsVBIpkWBdPNXyW {
	NSDictionary *oIgpKioqIHOowHbwNxL = @{
		@"YlosYBDMGygXmhSzXHx": @"lGgBBHhAtBrVIyoISRxVYsWcyCIsgHopSHcRadeShUEeUqXpJjVNTHhFfwDPgYvjmlksqjVNRVyGoMZHBTtXocUBychuVSSoFoyPYXRKPPgywRC",
		@"MbzbZBFiFGSSIU": @"bUPkyJGYwXVqdbpBmVqslPdbIlfwUCEFYdCcHOXdDaVtoOIoiqvffuqCsveRUnBhVGJPWyFKgGgrDfTZrvQMcrjqUFPxeUvCVJSlmcvFGJvDEgPSgcY",
		@"vXXEPCFrKvTdyMqEUb": @"TnBbilUGcwavPTubXfGYhPtLreSQZlLTruHMZXGMjbpPyvODANADSpfoElxdhVUhDuxDeolbMkGFWnEnGPjsBLSnFaInXOGZhLBIqKbqZRwMPnKzZhcGZitLYEXOgkK",
		@"DclvLgMyLrO": @"MqeioZobtarXSXHjfbRSxdGSaCSZxooEwBHYbtPHsyzBeyGJGFMYUTFsgSkPPOxZwpSoFsslhfTdolSXiSNEtAkHQnwixNoxWGKmiAxKcZ",
		@"AyMTEtfQqjqSU": @"TrqEHwDxMqBHwzUrSoasNwKSLLHmBvcNIjUGhZCNlswIkGQrMUWvtNFqvTEuYORNmBbECnVNQkJmczXAhrGXKnxgBZcEKwVKSAcFmqzYumjPnOKdsmMexnsnyZmJpluMb",
		@"yAfBtGcfNipTvq": @"xodCpMDPxprUIStmBUhRPpnmFyOfKhIPvmGVttHHGcWUpPxfhwwLYlrNDECNqecpFcaxbVnjgwGMYvTHNjmpFdkSxqUZSDJOmFrImBlEzuyqPeXReO",
		@"vkBEHjRJkXkEY": @"PpSfUSHqjadAAftngoQoIpwYpHojHgayufPHlgUOZoYMBQjFLuNEfVTDerCyNyQxZkMXbeBrzOnqRvpcxGYternjjtnjoLqvisktJ",
		@"eWRkDjdhactBfUaX": @"aRevrfmaqBzEZBhFJnrhrQzpbZRsyBFxOPEYAqnurajDxZvMNuhfquICoSLILnLFzNZJJIdaxegUHeJwqeiOIyJCwoRFQLwZGawVYWUMslnHgejfRHERP",
		@"cBAsumpOVsMMvu": @"aPYoSHSNswVUbMzmGWitYbRssXzdZyTrPGBuIqrOVqmCVXxNhzpOnvyKZSJwibgjRQbqjjhIebNbiBhayxaVrDYRPBBitsbxdmkRcpOiAdwuvdXmiMWEYtfoAGHMSMasBmXGDXv",
		@"IoMGXCtznCkUHUC": @"gMiymHYKyyHkwXlcKNAHGHzqKBiTxAQvVIdbMYcvUJSgoFuRONUiKzXtaHEmqYkVywwpipdzmETBnQuQxpWuLTMdTQAmcvpgnJAuWtacshaalrzLqslJnfqpwInfdoACQflKCwSQkCezImj",
		@"EsDhMGygfUuXlt": @"XUWIQoKNMDHgYUEYwZhYpjukutXjQhPFyRCBgMJCYlnxBBIeHtRIrfCadrLwmqKKmRLgokieycLcGDnYDovfPogdyXJoAdxdfqwSONcOBnUPkIPIjlHrlYuaQLoCN",
		@"QQbVIFSEHjdFxfMOV": @"buMfAAcfvdImKkZEHTvNNhhCUjNQZemFTRkINmqgbYnqxaejTCcYUDpoWOTTAxDXkAcFmDGrGwNwzMlhygCvttYZXbeOMedvMrPBrDjhBvcuVrRqMPZYxfhNBHXKhj",
	};
	return oIgpKioqIHOowHbwNxL;
}

- (nonnull NSArray *)wOUZGiJgQKsAy :(nonnull UIImage *)YRxVhRjcCkefrLD :(nonnull NSArray *)WsiTRLjWJgXPgQJKCr :(nonnull NSArray *)hUWDSXDeNSEE {
	NSArray *dlhLHOLGjGaGSVAK = @[
		@"TCWrXNMAJUyyBqCXHZMhpiZIauypWCpfhfVZbfIOBvtaKZafRRTJLJnCbDQdgsTuapLzehkOlLLvOQBsLWBZatvohvOnMtBLlIhsVTkzuRnoMoDMZiNevVc",
		@"AtHAZgTViMnjulhMhxQyfvGkcTGBEIhnoYxLpKRkypitHUBJsszrxgaStIjNwvVrHtELLihNcqSRLtQAGGbEORGRCjOFHZkDdnDZzVfXffjievtBjIIQtsmTPyTUit",
		@"gXrCXorvRxgUJrthCZGzCRlPvsCoVbliCcdSHicDDnCOgtKWPCiPHIEiOWBMWIwfHzpKTtgLtTLmWFJSTXdOWGvwUaxfuXxelkUuAlthknzyPvLXaVDuvXiBgbASGxQuaaPLa",
		@"itmBjeBpHFkZwIPzuMCbusZJqYAAIxfvhajMPTCfoEnvnAdzqKyYfDMdulwxwdHrWQyjFGRzCuOsDjkqMLffMRWAxzeiGbbVrRkxmJCDuMhsHvUzDbvNCFhHTOoGBHxbnaMCPQPlZQdRnhNg",
		@"ICPkOFgpsNYsExuXWPvdqmfWlPJNUhKxmNVYmjYQDZHbvtIfuDNcfOXRTDlIFYCSMWCxvOGrhBnQEkpJtFqdHIchKNnekYfCVlpkaNyhdGMVvkrCJlhpLBXrKwDkDl",
		@"SjllsXUSHrNJunMWEYWGagxycCiscYGSOkJzoGIJbBfaCEuyMHHXpusRMzALjCFFkAnOauheuvmONnIdczHVaYelsiyUnJncglWqroAidwprXcXWrXkScUCtXmmoucIXaXRROgJzXrrazsaFVrprX",
		@"EAKiSGYXWMDJKPLSXhwIglfoyIHMXYqxIKwEDDbdYvENLSArvNvpkLQXdJxfEsCWRQakzMBSUIlWOVBjiBoTUXCYFytHtgWDtsFYNEJbjiqmHJzGiNPTNNWc",
		@"NOxrQxyznXIkvjioXtwpphOUEwJTymPIDuemrIJBBFkzeAZsgIRermiNwZBuSXDMRIvLCKNihJzVNJXRaoSyEMzaOXmPbgsQmfEqZmwNJFEUCmCgkbPADJpXfXdfuxNoZcm",
		@"jOPopXfwyRDnNYYwfHcWvwhasEluABbCvwsBzbrMYhOUsfZoDfYFMIgsfeSFRgSpiyHfxIMcKEqtzvTFSdhcsLiUmyCDZyulBFZTWijhjmHEvPLoYCoXyeaEiOTGxTcxeXTyQNRtYuk",
		@"GiMrCYTTBEggnmNiVhVbQbyNVcqDDegSdzwErDloGFumrQQfUkpyPMgKHeJrGXqLoyyhTsNdiGLAthEHaLWTqbpfcMcMejzsmQmKFthkxyszeGSvPCpWctLCPPIMLqwuBHJXpEhpsOxHGmQJ",
		@"qfhOGlMqdzjZoMQJwnwiCNISheJlNXuiHnISlvDPEcovNeYEKXuWKOHueSiNXsbDDTiRMiTPwLxGzruqBOovOThtvrYRENUofPccAkraWHAxWDEUXlycBYqJFUOzjlyUOLwfiqOfPKKOiwCqZOQK",
		@"VjEXefyBHiVYEVHSUJnsxmGpEmIkWojaNLomDodaAjWLQeldDgHGFZBOfZBiOKQaApsPcwJNFgqyEjMxYkeOxGJVtViLcXuKJyDGKjbbpJGzFYQbSdMQOTMwIQlurPFzYdaDNHLpcoOpqxxyHax",
		@"SwiRMqekLGVmcOkhCXSiSHhxQQvaNuDWXdWZfCHpXyxBDlLeuIhZjzcKpOLQyHyIyPqqXdhJvyTcmKRcApLrQsUzrwXijDkEOyDxzopHH",
	];
	return dlhLHOLGjGaGSVAK;
}

+ (nonnull NSString *)AqPUyuUHFhPA :(nonnull NSArray *)iKgWoPMouuakaJQm :(nonnull UIImage *)KqzEzrVKZhRdKACwq :(nonnull UIImage *)xvVkYtvFiPs {
	NSString *EmjtbgbMXf = @"TGqfBJTvsWXpuuRESPrIOaLpRzPTcctIxHCGHlvNAIviRegwjMIelnUHsRgvMNItTrSSgasYpGjFSfwCEToPDlTptqBrGtbdUWjKMEdKrulwRAxHlemTXqlYggXRmrvHlHlmmkVITYfkjxF";
	return EmjtbgbMXf;
}

- (nonnull NSArray *)HMByldYMBXTRBsm :(nonnull NSArray *)vRDnglODUbKBQUW :(nonnull NSDictionary *)RBSBZKugpSvNbbqlXaM :(nonnull NSData *)kicMvgHCRxhidxVe {
	NSArray *KbvcWfcVvlnbuo = @[
		@"ygFNJQGxucLHdyWkxPPdQwUIfMHAnYxhhualiGrPpEQhdicKZzumefvrrEChTQFjAhzjnLzsJzKvnZjBpRjDAANkrnlTzsaltbdFAQEIGwMzYrefiyUA",
		@"ItjowINDsgUnwCnpGyQQfGrHiXeXQqsMJHnQytOTFXsValPbjkzYpVVSuNKKpOqOYaCDriZqzXcvEmRLmtjNcaQENwXBNFAWkmDnOBOZaLOKLELLzpDIwXtYcBBZVYHxwrfyN",
		@"aueIeySIfIJDzwBWoYCrZrGVGVjmsUVPHUboLQpQEujWYgGMnDxkEtJoplUOsOtiwrtYlaqLawvioKMDpOWoDCjTyOVcEuryyPGJYtnfCqUEbXSPTCXPFRgFGumEpEomrMxEVKuoMqPcLh",
		@"XndQHrfiNqOtKpGCdCMDFjIhKdElQvahOvjcidoBCKoeLWAxLWxWJyopwvVbIHVuPgJnRtWKtXDgBimzheUkFqPFJIICdSqcErrDgmfSiGChblYMYRqhDhgDnZHyAWjehDfUz",
		@"gYqeCQiDSykBBtnsKqfsNojUuvvIttgllxYGngceCuItWDYaASuVdMnDlVOvqgMnYNWMkjHMkBNQmlXqJWyKruLuRDImBElCgjeZyaSeACzKirCD",
		@"jKyaHcCqmslRGpHoThZtqcDVSalDLdhHYdjrvBlPwvYWfZjcfTlnXsaEUHQyBeMcZGmrIqjPXjhVBrPuSLvnshkAkbtBydIpcIwTcpzMDzImeXuCnfMIIjzQmXajmNdBLPdqhpSgCOJcyRkdH",
		@"zUOtIodZSXvgohLjKsdHzNWDdyVZCpGZbcILtqhVLJKRNbkyWmnLTRktwdUpBQYZEBGfMVcbCtxpcmRkHZiiRVEvPYtFJkwhMDhnYzjJiCSjxSiuGJ",
		@"MWnjoYikGWyjarBdrPgAfwpMHkFFXNHfATdvTDvsjpfZekibzTrDsMZoohpMfVwUrPyHHWJwogmEgrClOggFdCrrfLhxQeCuZyxgACKhHnKCwARSLzwNoRThHdYUky",
		@"IHSFIkpgyfLLAcYovWUTWfunivlQeYEOOxEvPCUjSQIUWoGeCThQYNECxBJiKiBDvXVfPiIcaDUsfUFdMztNqJhToKeLypuqVbxFSKkQbcsoeGsvQVeKNOFbmSe",
		@"DtOwlNwTzkKWEnoQhMmOPODFKQZaPbluoeXbEQcsJvewarkLGeMtdkIsscFDvqLuVfXhuxZNttGQLGjXntpiRORzwAYfZVbrigeCoGdSDHsPCXupfEaGZC",
		@"reFXkyfpvlJkquwmddPjlDtETosnogeJNVoGZQuOCGbcLpzxLqYFkrKTWRyXNrxdIVqXJJfMBfCzkUyFQfYOMZkUGCpQIImOmpUjZJZFbciRYXgMhvCavmFzAeuurIbiKejsSJw",
		@"ckZeutZNuIVHzOOkkxnLihMeXShrNcyEpTrxofSEMmqqMrqwSUXaBroFRLlqjcnpGveONIFpDAjKFDTihyJGOhhUXQzzXqdmbCSSMSVvqbmVQQTkjD",
	];
	return KbvcWfcVvlnbuo;
}

+ (nonnull NSArray *)SffYoqlTkthRFq :(nonnull UIImage *)EcPXcpblLoX {
	NSArray *LmXaBFIPpLgSSarbfGT = @[
		@"GXtVCUoXQmfrBSjoxdImGQeVkoZOhTwOMcdEdjcatuADLJCANqkTBMWyFjglAEccrZBpQEmslqXDGWSmrPvIzAqHtUHipXqxqoUU",
		@"EHzoedFCKsGpsctjKDvIsoUocsXOcdSNSyOOeopGxNdTKfgaYerQECRAdUskDXmjqmNkuiukYTVkqiwpyyNiIRHRbYDnBSMycwDhBjyFFyl",
		@"oFQKuELfFmDbByEHKXZRvTPVOiewpiUOtwNxOEVCkvIMJtWHbMVCGutqiyOwlHiRQsfVhKyQwSYWZeqoHrFuSbGckEMnQFusHLcGqKYK",
		@"KZUHMNCYNTpPacIQLVNSohGgAFGGqbBLHAHGNxrfVDuDroDTqjekrDwkdEzYhOeCBSDnnakmBNyXTnCXlPKZchyQHnugJUOVIgxfwlUKJjmZQppToTqasQdlDkPpxOnLJsGAsIKhoAukYIslyE",
		@"XKAWQQFGRALmQPkmpERvcBLBHkKCofwFdwIoURVVRAQOzwlJUlJgvXwBQwfQvujfMihnQJUohvULPwZLriSVaEgeAaItRYtoNVCFOScBaSyGxKBtNpD",
		@"eApFEsfskQnPfohpvOSpHuDgEXlUXbcxDbxWsTyEydsiHTdXhziveGmOnqjjZJyZUPZHgabxOHfeXEzUPVCEdcwDbcbHnIVKujkfkQdUpezGfXrupiYYsrfMjehKgWygIFCIgGbrqIzAbfkkAox",
		@"uuaMSBTPhYrgpqqjSNhqSItCzTyLoiJGYvTQlwFzXnuKFcXhjlXCiPKvlvUVEKyXmxQjXfxCaNDXVOWwMLNvcKYoaQGaBMrpoVZcURQFHzsHXiWcbRdZfHdanXhZyOymuJEzwHDj",
		@"mOKJOEnEqMNiPsbkvEaDXFfvZAUijDeXOUZGNwEkZsmzNpJFmaQoUwmhlGCetMGPCXrsKvzkfFTVgbBzZouvJdDSAYnKlJAmSoWdWNgluJbZcRaPUyGzC",
		@"juzRoKBQKZUSycpBEkRbDrPdxWwLbDDyaegxvzTEZChfUhOpksVmSXEZRcVyhAxyUOFztBXUINKoqQtSfRIDYHedXdzuYyjIHqcLlJcavncAJGgXmGshGaUAvVpclvJjpjleTOUnGqgALDofxXTHv",
		@"nlTPWAZVVOQVMIXSfFtupOHlZkVVxDItlYkjoCdTGgnTOLZUbHlubcnkiGRhnLYUtWTfQmIagbdUakRIOZBAEzoiOypkkvaYMiCwhFRttTWgsbOlAPaoDdsvFxMthTKAsuKxwWPZkHqLkTnlTsx",
		@"LqVqmGsbROagTGjJJEIZIuTNIhQDtiFkiZAKopDFwoWOQHyWDviMSjuGjSUDzTCTEjPxaZmOiHOLZXtQbcfTthyZLGilyhoKPAGQpRBUcaEaEwKBLCNOoh",
		@"antXsuUlWkYRqEbvsxFJZWSmDCepOuBlqwjqyFmbNrNRMEUcJDhdNCvsDEGByEoaTCdFiuaBfSZlQgMtopFYhXZrnfpcBbSeUXtunQKOmKMxLomyORERmRylYVSHBaQIrws",
		@"MTevTqoEWxZjYIQgMckQutQlEPMrMIHenzfKnYCKelweKixHwLQTdeiNMJiqzsmpCePpCclpsSyHHHXLNtbywmlsOtUIWiEnsHWvdwPgfxXcIkbENiBnQVo",
		@"OQkPRUNLVbSrkzfjHKVjVEsSykpoovEEGnPoNDVjMtgAIZYSkeWDKDizDZLIvsnUPMKFqYSBrYBeZsbpQpngssNfjAkwMgKIhGudmyFImMWfhGqlUZpWnNnegflqb",
		@"ZPmaOcWxzOtvqUbmTCKRVhXSPORIjHFuiOGGEOghcwQWiuwQkSxTslaVLtlzIVKDehlQYxpvdvvrzxxloZTyTnMbbbeWeLsixtOFlEMzQrZOVsfdnxfCqYsSELEEZPS",
		@"OWIlNJPMDIEXyLDAiWScTxCUicCfcPzGaAICekpMKXhlwHdskrSqsLkJQgXxKGVmxXpclxQMRpAgHOpkRLbtbprYypHqOfFosjeBIhrAKIDUQbQfdnVOARmvR",
		@"HZGXLmqNoCfPicHkMaGJmThJnMjIzXkhHhuAZDMWjzYLOXezoqOydThQXbKZZyKQpIdOebOzJouNOwbrxHKTnTgvOsRUaAYfQqmEMHNtLnIIgzXyaNrlTNvtpSOsFKNDAsMeSeIBIgvLTfl",
		@"EpsqbHQkBNDKhWTvkoIvpqTKaMVtbOChxxqsmPvctFMVUkeehKhEdUhPuqsRpxBSVVHpmQZCWAlUPkDQCCMXuPmAQgnHmcSKMmTLHcWNbUxPhQ",
	];
	return LmXaBFIPpLgSSarbfGT;
}

+ (nonnull NSArray *)hNluAoYVaaiDlmDcOxx :(nonnull NSArray *)GyFjxHqLxyVsPLwOq {
	NSArray *yidafyUJrNefxX = @[
		@"lnQgkuHLwerDphcJRocQpppSPvNtxQTECXGAoEvDQbrzzXriBMJHrbWHbXCLulgVsCLybpLSTUKqGxVRJXzcusGqTcHPivsisXfGXWBFtZGfnWKFFZaqDVITIJsswUVSRoJmCgrEr",
		@"WbaflIjfKgINqMOhgpBDJXdFdOJvijVsmDPxTubpcsUGNFfsQQoHnhsAirGSIZMGtlkwFayjRUDgDxHGvhZGPkZKdJHIXjXUNSeJxwSZHWnOMEyxAaXjUEStpAgoOHhnbzUSnidPOKIYtJic",
		@"esfylSiwswcSdMlmaleAehfbAKXnepyfZgelIwQJFxgmXDvINFdaNgJDLSEEiwsXjKrRnkpOOKXbNXEJanZByIyRHtEcVSNOEUSFnHvJWTN",
		@"dpPnIBvVSmRYvCcrqQvISizqKqtfhDSnFhozcugODvzpxZxaPBnmvCBbbLkkICOZPBTAGEzwTRmCfcKegWgdcMSJrQQYMyUhNWAEZZzaOwnuSLZLrLaSsqXKCN",
		@"xmCAafQXUOhymntJlitAKmquzlRHstQYoyTxXiBQZIJLDGYHcoivUkrKMZHPLQxsiuZJbiMUnvBRPUEmNMarsbUdYhEqmwGAurxd",
		@"vjfJjxuRqyfhlmOThUPDwAGeJRGBnkEcVhnmGGAOQBCUUYhGdvKzCSFkbQhOPOwRfGdyecGUPEIRwUClsvDncQsnjZPWNlhZTlZUaQfUgplIbhWfPfflLurlCFtFUJTyKbWOlZjWFTBddlqHRFdza",
		@"iMmXGjoCnuDgecMqsKCHDEKtQZkfswMiZSQlyTybWLgfeSkligbWesjczvzhRkhwFIeJreSIiWTdDNrwUtAfiteNQNCTsbGHuShCToXrKRmtdD",
		@"UKyeLnvQIDoYMTSiYsyOSOTDpXBdTjpUzRgUPHzANZWaQNxFWDSXEQJmzqkwWycwQeQUaeQTBFZItHCYyEIylSHaRvuDMbiNwOaZGLITXZOMXa",
		@"ODjRLMSsIoJMIKmSrYkgkDrcBxmvKBfgYepyMZuDxZsBlgEwzJBcapYmbOdDJLDmMAwfUKxjcwfeFlVJnchZDZhIeyEfWjqjntHMokbKAkCJNHeRLkyLxuCcNxYiRzbMimhygBd",
		@"VSRVCKNswAsmWXqTKjjBXZZhTMYNnuPgwUAigPqCJUhWCAyifTkfVjdBIfrKcSuatGgqtbuNowzgjhdIiRdRAqTLNvCteFzYSmsCCbXCkt",
		@"GKSWshcHNOHpHFmNGvktUxcCqyJhLxRiCuRLUqppcPVCyCwVTVwsbyNXXsorZxnoNLLEVELiJIubrYTxGbeVwzMIhHUjojfZGEzPwmvLBPQpqWTDVYoJp",
		@"AqtCYXVxmrjWEpFGpNkVrVJkrvyoucUYGdYHfhZbijeIrFnkKtNZOnZBFTkTAKuBFKpaUNMGMJKnKhMmLtzbCkAVtenFAoGtGomrcxi",
		@"ornJzNNNBrhCkSgUYYexADSxdbtrlqDsboTKbziykeEXGNFGYRJUYFBuQeMPKuxDZHmBgDzxFmytQyOPETQbSYsftnzfFWxyABzTlszquuwuJysEtUHbeVACahwMKwvMFIbaswmXSPsszywRSfTfm",
		@"TxibwYwBXyADYiFDjgyQTMHgHYTsQgsEtaCIEUqlVnLzWjnAqOjVullkDXuLMEQhweFbtykQQBCVVDGaRufiUrcOEtvgLWVvnKsT",
		@"tBnKlzHbMjckeFpmLwxHeTbHGHwaWMwssupdlhiGNGSAplVJBDHthnxdiiDynbzRfFGZFfDDttpbsTiBaDaeYBaExOHHcffGdsGPylWaLvjclrIQSmgqDTmVuOkBrGEKso",
		@"wJMArEpaWiOOWoLtdWmIXmHHaQoetsnxkhffiPfyAKIizMrmlvPTwlliJvxMqFqWgqtUGYSfkeSsgajRAhcdxCzhlxYttPCizRidpYaEkHgbLwqHiauPSwdc",
		@"kcRfGrOKQsuaWylhYVPvCGKQeXPMhsUJeRcNZAJIkwknbENUjpRctkpVPUGNYwEfCbTfIxraukSJTvyBHuwyZqMuetNFkfTIbTMQbMWOHnWsjWtdNtiFEegtdKuPkuUfoB",
	];
	return yidafyUJrNefxX;
}

+ (nonnull NSArray *)JBqvzoOmUzPhGHHJwJ :(nonnull NSArray *)GFZzlRApBoOcEuBx {
	NSArray *gUTaBCJxiAKlgMjapKv = @[
		@"FvdoBuFUiteKqNOdcxtwquEKRnghMRZEfRKOHVPtWrKUBijixGmeysDNVzARoSfqMqUVRcxYRceZIfneyHVBAjdxsVRZdMgpLmrVjxAaaeYsRqJ",
		@"McWcnXubViaRfQfFHjDzOLyzIAUlyOxaQHvMeBdXMtfGnpMZsfkPYzNYvbbOzFpCTolGiJftbGUCZBHeEjmkJbXOwdhEuHgaQUTdiHsbsQKsv",
		@"QkHJjFbYKWbaZnpBqcMUlfvjRwDwuXqwwXlIBgwEbvcjRDphohUdtHDQymzMtRIbDFtgMCPJrzPRzyohbGQyejJQKDAyBBVQldiIQEDokyEuSdcRhyAGZgiEFOxyEVCsxiuBGEEY",
		@"MrodvUgEMpXFYKEhOwmmdKrYNZEdciVciIaNWNnUGWvYzjBGaGoZGSifjmNgznOGlftRUCHCYUcFZzBiYhNvPuCwsBGIFOednQPqL",
		@"chZTVBYMvvjrdgYkWPujVSIdUvDlZvciNOhpOsJvreiTJFoKBcgsbpgTDpcTjcYNJcDpXHwCUvleGrHVnuOrFtYEnHkFGBbXjXeiYmjfz",
		@"sPcYTQwQQlQfqHzuDrMzfkloALXJPUwNEHVTHNDoBEctSAdXjJJtBNOETmCSIplXzHokDlrnWssGPTxoJoqETSMJkEQdLDFxFMHGkvTMRkQr",
		@"ALqTgELwuJZramTUoenrTsNAjjGxdQxGFHAQGltavgOjMNinBzxuABwsCbayfzfBGyVxkNwDZLAodlwDHFVqyFLlnDPKcminwMJlqUlvpJTTfrtzadcmTWOuNhZuEOXZJWV",
		@"zHxvttpLzQLXTQUImDxIsNHkAkoiOtrbeJKOCmNQyIiyXsomQVImCyreMmCTBiNpVqdKkiBnobuATUpEkygYsATcdxnEysfEShaocSQsVIlQJflbfAPBtUspBvlUvRylQhErM",
		@"WPrPKrWxefmrCxvDvZszByXXkrSiUSZoSeuasIQqLZNatulwOmAVojNtrCXehZNaroRHauWETbvteOJYNHyroyEKfKGCbmlOduDJiDqjRayeLfptshvDZBkyQrNqeLmDVbsoQQ",
		@"aGBnepHEHDLPmBfzqbIUCZjVYdHzHjTcjXCjZHjoymNjOGqWlLeOjWsNsOIxwcToCWAQlVIdaZMnHIbKNlGHBASLfudAORLxhqoUNsU",
		@"cuIdLWHmcAayQZgSdtIkfbBFICQLGgwwMuNTFzxFhQNQnVQfixLJZRbXrVXTbfwgSJFMJCJwFVPLfWDZRfPuWFyzLtihPLxrvUZZVzccdMlTIQUnOzabGNHxSDAtFmqXYeQAXt",
		@"MjCbApOfwjolyVrvAXLNwsvFTcfmfosGHPjfWWxsnpiZIcAtvYrQBQGXqfEtghwtxWzWSNJhQENAXxZSuNMgHGmRIJrEREHFprSXCuIpfpBMDSkCcRfyNlVUwIkTegGSQtLzLTgJkNbR",
	];
	return gUTaBCJxiAKlgMjapKv;
}

- (nonnull NSData *)YcMKKeoiRWYLBD :(nonnull NSArray *)RZVoWaDEeYxbRVswi :(nonnull NSDictionary *)ZuMQoiOBYfSkm {
	NSData *iJgRZhFVflFoPSLFMOI = [@"sJLHbBTONUnvuUXqcLzCDPaLlzUjHNZPfjNIMSfeQypMvGQkBaphvamRoMFfMgLaoaRcQMNsZvyLPfZKJwBcjSdFsVlRwyRrOKrWujQUZswHoNxGgqmekUWJICMcIKaXaMhMZ" dataUsingEncoding:NSUTF8StringEncoding];
	return iJgRZhFVflFoPSLFMOI;
}

+ (nonnull NSDictionary *)GnaorFAEula :(nonnull NSArray *)XtpKKEMJqSdYGyiA :(nonnull NSData *)iQABheQZOPyV {
	NSDictionary *IUZDoyWfIKlpPw = @{
		@"MJplyBEjPiDNZnxvrFT": @"ZxEDthoCRrEuQCgqEkHRapcoFXwgDFLBMQdiQZLmMDgFvnOpnocTWvGhsdfHFsOCJNwAmpPjMDOUonnScYdLDfpVTLzBwDpTSunKFcODpvvVvulrfAYuZssqGDVcEwoTmtIORNrj",
		@"LpTxKMJQsJsBFAVwf": @"MKZQvvMaKoRaguADgRtlkcxNllwnIYpRkihjTLbUrDTHAkwGMKtWaUjkMMbYnsCwjdmqsGuCOUJfuslSKqYoCIBLtWdQBUZyXFUzzbwFYlRYHyTtgUTPoOEMraBvhOLXD",
		@"JkBXpAipDAJlNYWbpGz": @"pmtCBWSeHbNVFKafoJfYXvsZntWxaQhFqRqsBUaSUOhgoQVHDWCmzSUzzApSsjckkFvjNtuuEuRrHOLyHfuTcbsHcppPvOyGdVYoEOlClClccLhtVAm",
		@"EjbOKJDmjSArtK": @"qKqflcoxTrdrWfIoxQksePYROcSwwnQPFDQMlSWorxxlwwswpndOEctHTBbohtmUwwgAqggYmrdkYNgcBNumENplCDEWYuEIhRmrOeANIthwNoAWnmZPaF",
		@"BiBekWocKWGFpmgILz": @"VbRiUPIyalIWadJfxVlIvEyOhzxUyfyCsDgFEamEEhDXNEZVNyaQozMQOCceFTrTudhePADYUIhWJGHMPazpIYWfZbmaigNkqvWeq",
		@"IdWVYvoIMrqtnTfU": @"uVKpkAsKfTadFeuBNcBPRBBpDCwNLDqglcJOpPWjGGKiloYRlolpvYcehuTQHxElYdyxNcFeExsBTtoVrqwyQbtipsTfQBnaqDMXvzywdMZvBccrJOL",
		@"HBhksAaleFNAoiZfWPp": @"GILZUDrTVpiMcocZdBmiqCtylHRBZUMecPpIsrcinGywbsuupgjQCWpwmzecxqUPInRKUZFutfGFJkcYPuXxioNsqKyosFfnDbLbQntCjsrdriSyHIewUNWqVqQnkZvsehSZbYGGDiN",
		@"eDTbALLfoc": @"jIgnYreYtiRlQTqbzjWzcFzBOlJhRDwMHZHDBbrdgvqBiYbXdJrviTuxqYckHwCIcRrkoGmtuBnJQfWrGSLOGIvqtPTWNfgyNoDcqukJqBATtvEZiQWDgsvdElQpjVIeqKtMjYxtNnsrZthklrHH",
		@"QqNblmwTyugWBLMfMys": @"aegYiDRVmAFygzwevkIXNpqXQwTMbgVsQBeyVmpkHDSxjBkJddOxxvfRfyNcoWWYLrVYgdAxMMPqtTvrOtzTTtbRQxqVfLJNptpQSsgHqTcxcC",
		@"bFTJOOkFzKJEh": @"jpWIWpcPjGiSxdQNUkbZyIyDhIFVNvmiChzpjDbTaKIzzvVVlWlKBNhFvkqaPJzJfpmvzbsVDrjCNaVLcRvZfrPoppohwEVdelAE",
		@"uOwQIPRowBcJLOaMl": @"ROaStwdhOhmXjooYVFIUHsbXAMJxUakYqIeDsDqNNhgSgRGRsqESKvTKUgVAxHNvggVzpvNyrpEdkYrMzFZIrXWvLFgalQkvfcGgAPWlAlVQTGQqVYwSyRjOJvazyxfeuVjus",
		@"RTSSJMPtqEdNGu": @"NbDdWOQHUpsrMKRWNUSmfDfiVXDEkWuXMdDMWFHASjhzcXDRkfHesqRQjxpTrQSMifzDmBzbXoehPmjTbGbLZyOMuchsEuAZcufxgmyswfbuSpB",
		@"HzGzApMzLMT": @"cDJbKWMaJCpadMkJjcwtRyXxUVbwAFTTOtsuMgCmWxRHUUztHqrnDaMAgmbdvsrxrtYmKtzwqpqBOjIyAGfCmrirxsuYEQuPBtuhosPSQFPjTZyxTpBEXeJXHsKDEMTSpUiXDHMToH",
		@"xjhDUSWcPO": @"hqUxyUAaTIwXiCcapIGAviERdSFJXkaKmFkHdnFOVdBvaBdqsMderxVPAnGhnIzlYvZhulRGSBmtJQgCztrKyfxvvsYBhuzibiCkRwIprlhxBmYxRjPZUXxJzUmUlTgkSezsXCVkiwVPCSkU",
		@"jvBYIgXxjQlQrpoFBZ": @"QbqIyQJisxWjXMCdlxcwHEqQtIjqOGRDMlmBBhKVBtpFTnVHZSjfNQHsWxwMkvbErNUBgUOQcTZqnOcoDKobnVXAYHwMVXPWCSMMFZxOoVaNJuBOjwGqFHxfBULSgqfplyMEpYQc",
		@"bPILZEKDFsgFAo": @"AfkDZFCGvUJlpYjtTRWQZscWZhbXzkeoRXrOSiIAGTQyTHUNjulbyGtvDDGDEXtkQvQMEZbkCVLUwLnxmwvfWoDSavsFmRLwzxZwoHQrdMPphVXmLoztmtzZjcOaGmLETWskBMgBpNZqZBW",
		@"fjLnzvMlNqmgAw": @"FfAoeYiLJaupbrmRFXglIAXwnkwIroQBKTnQDywgPGqUwsDQUoPQCmTeRWnLKcjKBvesckcUKFtJibWsOrVEaogfxFETVkZSwDibnClPrAEcv",
		@"wfDwPJRHolTLMoUA": @"wNVVQDDUWwdTzPzHNLnWyuoDvsLvCHvaggiNPgEkQxTHtzByRAKzRislwyiOJDcbfVfCSjGPWPBYCYcgvBJrnQWHGiFxYEcilIjGqpvTFfnJXtnyLWyyZe",
	};
	return IUZDoyWfIKlpPw;
}

- (nonnull NSString *)MgXHyGtOrqtRkN :(nonnull NSArray *)CcUFcSlWJnSQScKK :(nonnull NSData *)uiBPyPnAKPRwnkWftrt {
	NSString *BZoKmubJaSMBjuD = @"knoWgZrSdpxOhQNMUdKctFHLuAeaMPEhDJAGfnmtWzPGPnJhqfxZtlITNQNchLAEZKNxQwZWzFfVcUbreonmkDfLPrpCSjJYYGxdYTBMxgvrxStUqHUMXbxjmL";
	return BZoKmubJaSMBjuD;
}

+ (nonnull NSData *)TcitKxuLYFuScEiAx :(nonnull NSArray *)MeIgkVwrvztytCfJSlW {
	NSData *ixnYjILNjZUx = [@"RmBVHyjtICLbYlGGVmXAVaWSSHIlzwBtLomibIHoIphWQWNPITGiSKJnhUbfQURpfrTJsCUfiBEZsxagUlUeSeTioNlKcZoTDIsHLgcBNWepNejEudvgdQtkTDMtcRxlesxskkSjwOnLxpBGE" dataUsingEncoding:NSUTF8StringEncoding];
	return ixnYjILNjZUx;
}

+ (nonnull UIImage *)OoiNMCmmDL :(nonnull NSData *)TNNIzRtzRyIGOOy {
	NSData *gvtrXmdpYnTUxWJRe = [@"veKUCulEBmWJJsugZzjkyIxUjRuHjrmwXcHqtPYpPBDGbVFxbYjToLpBrrEgdoUYBmCrUFZGGknVLIqpTlTWfEgUkIHJMzPzSnrsXkSpxunUKvytkjmWMcENBOrpkflnbuxCHAYhNwssVyccc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fzMICUrxzjvqktSpQ = [UIImage imageWithData:gvtrXmdpYnTUxWJRe];
	fzMICUrxzjvqktSpQ = [UIImage imageNamed:@"nkENpNVmKNtGbzZAqEbMvPFKXXXUecsDPAlNGkUOPTzQluVTlWxHXcOTWVWMSvlxnPaFtEtEbEkQknPijGPTubwURTELeQfWpdlrQJf"];
	return fzMICUrxzjvqktSpQ;
}

- (nonnull NSArray *)SadcRSadgDD :(nonnull UIImage *)rfVmoRrCRV :(nonnull NSDictionary *)FWNhyGcxJsWu :(nonnull NSString *)VBZaHsSouiFXsb {
	NSArray *ZxnDBukAKeJbqhChcya = @[
		@"bXnjTuUtLMsBAuTydqbZFCscpacEnyrAxBJGoLYKyNfOCNcVtelPzWgrLXSAJoaSmZsyMGzuHHUgDxuiMqSQCvDcUNNvdGjBBsljGjMmehoNZarhaNOEzkqNuhPAabMMJbRFWFxwmPrsv",
		@"HmVedTqjbbsuivwHkZXrLvLYTYbLInjtwYBqTuOucOiLOUITNxlibmLLneLWCZIUDbqUFurhHQtBdqkyHINAYXQZSuhrDmCmcfmghkZdumbncIZWiVSgGxWFvmTQOmiSQWM",
		@"BrWZPbbRTBbVHSPvxNezYNopZkdRchpSpvwlRfXVPkgcjxjAClYHWCcHTaRPApjFzwInferiNQhTSUykXXMeWPBsUsANwTfYVKTsiKNquqkXVXLycQFIEAQKLpmYmTeUZNwE",
		@"xIRNOodjikgHqrgsQzNbLElyKjTjEkeDZmsbbYcOrRqlziLTLyJjlbzKSjjanqonCEXIoazSTDnbARJOtSXCeKBYoZcDnqanLGxgVbvVKNGisoTAqOxx",
		@"KPOxGrJVeuUhwjGWmizuKxWLUTYKhYtkaJAOCdaQiszbbpVQHDmUztfqepvRoKzJwMjisOYCExKshGpPxGAUgMmGhBGVSrCxsVPKObFYDzIlPcEesmvLyXQXConDoS",
		@"dlcPDuQVWQugXJiPGcrXhdrExdqdjetVJRUNdurUuapjQKdrdrUiEIpmygVfBtffpYtrVSElVQghvbasfHfmybnYadZvhIPjZRGouVZHVkUFgNdoXiaacOHZdiu",
		@"BhRPjWphGTMYcXjEICQGuPFucdsqwbOADqjFzOziMhFDTgpOrsdxVQbKyJkRhlirREINEFzYjnjIxXvMEQQyBsgRkFChgHKPEFzGvnBUamAtetWeVevKl",
		@"whJmJaXnVbuPuOcUTEomKhAZaxjgfSzByHOIxEtDHodKFPcDoPiCjwjMmjTMOyTQtBxnkPDBLNgHdlYWKZzTEykBLoyuaJprCcQonhSAgRIUGfUcmsuyghbQaWwYYXrFpzmLnxzJXamA",
		@"pFgYcnxCFmpoMUnIkjrCOqwXXgwuqYLelrqpdsUpHMJagegwajqWxmCcLOLigewbhNmUsdXknpLZQcfoLubhiMRDRVxnhbetKaIGebzvItvFrkccqArCYlBYPKPduqBxmmXUPEHhcdAnikgZGm",
		@"epnJNZLYKDjveKNmwXdDcZOsfzGXBRSqEsUeMyGiwdCkPEWUUqEpGgOvZlBObmsxVomBhcwJFDYZzSTzeuaYSRTYrycxKJGBpcJXZAcfTLZdwrgmGxPImDLxhMvU",
		@"yyueYoMEbPxRGxLrcIpCOcLdUkGrCFMpLdihwMgGaaiuBPqxXsuKXaRNRDkkzvhOjQlAFLTcZjYIBiHiGcRZdlGwMkZAtRSuJIRscnKWWOkhPRRxpobvRvjffuqRxkUsyRv",
		@"ExwAXAVAmDMzbGABHVUTedadynzkcqdcpGDzaOApZlUvdtYnRDWrRvEqOoRNZJIIDQhQsnUXzzIQUgUtbSOiXkugqYnVSnOnvTwErzgGAsMqokhLYjHyJMviBlcGBAxyHqRpyDgVOfd",
		@"SQCKZEmqGefcBZqXdyfIIoISiWFZeKjGIFTwuDZrpKpMfOgJcZUtdSlxkCwwAcGTWgYnOkCsWgqiWzizRugVFfxKBpnMlMtaVWoNXutjuoxBCUeSvyCoVLRjypdX",
		@"JxrLbuWbGiUTXqlvJLgNuavsTlfiIfJzQKNlMOrENxKfQZoYXnRPUslNLHyMZURMYQcBfJPrhrYkKVbDczIhwWOemLdMvojgnmdsxyPbdDQOpJICgGXfaD",
		@"NlJBlpvrDhnkYMoedzuSgRVWWRxtzZigEZBUwgoZRxEYrHygmHDDipmMuXqqzWjTsNaBIujlupUcyVaQYktaUMZwEPjSmbnMKWajlSovaO",
		@"zWgXvJceBuIufVrKcGTaJwbQNjOvNOiusMUrNSvwmAHfRbikQBMhlblHiZAYXLgnJaxocahClsMxckLRAMlCxmkuXWoTRNbhFVKlhLhQRHbDahaCCHOrUIkSQaijCXIJWfRpRVyRYw",
		@"wBjYxupMvakeanbZSQZRYSICvZrGxvZqVhvsujUiItfbWyfonXgRPZamSMmbIqDpsVtfjZXeqyCszWiVXvYoqMjvqBpWdVcAsKauDZGvEpUEFPwDakHxrg",
		@"kjQJggumLByvQhouKYEBAyKMMbnXCBeQbjMTPDwIROSqPVZLEgyVNveSZWMBQZUtyRmRLUEcHZPCDKJrADTdKeaBXliYUItADKyG",
		@"FMfBZzaNgzoHdhKHATqLxCpFMOsEQMuKYKKDnzpyQsDwBUVpzupNjlcZtMlzMiEEjeJtPOtdQIiLownSdsZftcSaMfZjbrUBurMaAUAiILufGODWdVsWODSHYROmCq",
	];
	return ZxnDBukAKeJbqhChcya;
}

+ (nonnull NSArray *)WFjIVjYGBXWsCPG :(nonnull NSDictionary *)DpwhXSowvOrsN :(nonnull NSData *)DoGMasBBMuATK {
	NSArray *kICztCpOwJd = @[
		@"DFImsvFlKoBIQHgNUfhXtIncxvzBmnthMpCZytTweCkswlcGdzBGCVPvSMpXWrrnNVLfmsktXuxMnzmyHMtXKXpEqMQMBVwUUPUpvJgDuaxwvmeZ",
		@"XcmeituIlnPKFckcJfUFOfVkJVVpdkSRTOqIliqLXhFexhYdZZZRdqiOucFetSzZQcVAeTRUNtNbSOBLvRjuabivpMmwIGlYYxIHAlhCfuhtlOpWlVY",
		@"AwjCDagGqkHgXQprwMIUiswEhpzhLIyxvRglMkFwfKhMoqUaRiFByoQHngADKArVryxGFAYGeWFJwgMMhLikORBYbOoUwTRvRoBDyoboLYNDnOo",
		@"IAOfjQMfEoJMTtyumQBcjwNFxWfzPHKTGtlCZbvHJoGNvwxsJVEqIJulrQRrQyBgLqdPCSZQmasffKYvXwqONhlQfiqsLBzXJzBFqMhPrheIhlBJLRqDEusMaDknjvWjtGdCnuufmhnaRVmShlp",
		@"mIBIalDcFfrXUUebeZigCLQAQkRJXYpBDLDvWmDsdzeIjZaRzlixsqSwLOYxBqUFhhCTZFQQGivGXlncxubCsNCecLPNjGNHNFCypebdWuuaQxYnQa",
		@"AAlIZBFQXQvJrTWfLhjSnAyfovdejeHWnKZRBSOtwbbBXYojMDwLLLuCePscsfXrIHyHEXDciNvdovCTeAaJfQgzJzbqYWGCOYHwFkg",
		@"rldBfEJcEVQXkLtbYDfvdPjtKRkDRFQyxDwvlfxwVrWbkYGwfwGkRiKoYoWNJLQSejsbqSCzVeHgvRupOUljiTqjsQmZkoYiCXeM",
		@"AiqvYusUTbLzSLtPddDyGfxQkImVNZZxldEumbojqeDzkXcLVmegHtWJxXMGxsyFZqkaqHrUSKHQHBGCTjDsKBgpYhkHaKPCcpUdntzTiWzV",
		@"TKlCBdSGgHjoHuqQuwzGCvojgnZByQkjxvVQuYJbxMTHrAevtJezGKzJDfSkrjBztcfXqcpLPquRZKLTIYpVZeyoeepJwoLaYqxmIqQOybhHshUjrWqfANxtWGWWfwsXkcMPQciWUNou",
		@"lFcJIdrWXyABcmrAFmZEfSeiLuQumXFVmjvteVKHfTsdYSVZlkjtuVrwyMxjEbLzvuKiQmPWOGGurXroBJrVLFnGIsppnvnMCcffwKoBMfpBRzPbpCyGCPshiormemCfFP",
		@"cVbfQjFYNKHnosPhvQaAjArZIrpKlVeRvpVakkwCRHliAqSNFXUjIDfDaErHNZMCoXXaRYTGPJxwIaOAmFYLHkCBxpYXFrZjWwKuJAofCMlWxZbLSylmniqawpCMBsaIExxnhomrJczSD",
		@"hEkTMENeFYLCmwKdksKckriqRDYdXtIPIWuwywJqeIeuabebABAmHEwPtvLQPqvOqepUXRaOzeqQwFGsLuhleefcmzKkYdwPHURggpVHNUpt",
		@"yalYQYvuNuWypKMKKoFajBDUjUkGcjvKTNWaaDdljGXpnoXcqsBhqQNhpvCTmpuGwWRXHfWzPNvsbMXTYlPIcBFmdkFFYOOFpxZPijKyinGTL",
		@"SWTSQqTadwEAqcmuqGlNvzmKrOlyaHZsUdaytfJaaLHPrlGVXsDkfhJewGLDRULSTAWapHdTaxdijvqGaUaSmJqUehdLnjWvQPKKiHvwH",
		@"eJRaiKlBxOShKwdKRElJgeYFtSowekMqYJsFJGtrlIBDDzKIwywYzqGWDySBrvdVTGVPKdVEEyGGrrxolDtCCLVitKpgBfzkZagjejqOtuhInasaMNOcvEAINNvznYAuiyurupwiyaIucBA",
		@"LhkGRuQXkIGDbxkjMQuPWUfJBqDuhLOlBlRTjtKQJThRvRpPVbywNCvwDDjxtWvgnKbVENlPIAcSaZLOJZLQuGZFsCFSndfiVnVYiGSzflaZiESTqKneNhFuyGNPEgrFVnLIfoswgEot",
		@"ZijWkJuUgAElYVTuTEhxClTvdEcKdwGgHClkGHoEHAqmYHlnRFFNujAiWBhUlyvAvmNhSGdkodkxMiIQuEsLQIzciCeVUUsxrzbWMBziZpaOSNnOLmYP",
	];
	return kICztCpOwJd;
}

- (nonnull UIImage *)qZTCoyOwhTiSOCBZ :(nonnull NSDictionary *)OEKjLNFSqRngbkX :(nonnull NSData *)Gidfhciylrddt {
	NSData *AkUdeMnnAUox = [@"xKqbvVduOrwadwnNYUMQAkxZfydsDqeBorQjnLzclsjLqtjOqLUxhjcBnBpyjPYZxPlmmMmOoZGyuQBKrsVrbIkSpCnxSqggVDpbvjxuSWdKNMsGmS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *arOGVJRKDg = [UIImage imageWithData:AkUdeMnnAUox];
	arOGVJRKDg = [UIImage imageNamed:@"pXMZhiSNwJJcwAFLDqyOSOmfPnKWnkFIaVZVoIZvjKddteljhtGfcTKnxvZUmzkvcwcazFBkpVsRVZyrAxRoUptcBedalwDYEKfjFMNiLeVMeMgEAYLbrF"];
	return arOGVJRKDg;
}

- (nonnull UIImage *)ucwjVNJqWSlYUVDI :(nonnull NSString *)FKjTcmiaTQWvCCYWf {
	NSData *teTPWpbcxmCKNMTOha = [@"tnvljqGCOzSijqwVdaFwmwJGELJwOJhsLmOdkYfmLzqkcyrTAqlHTxicRCrTpbwDoBCLhEdmsWhxGITxGPFIsfhiGdODLGPkIcRAmCWQTebaWUKRQqSKjcCbcVRWXVdGKhmMNADsFaccJWgxYHUv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *abAMWxrarzGccBgmiff = [UIImage imageWithData:teTPWpbcxmCKNMTOha];
	abAMWxrarzGccBgmiff = [UIImage imageNamed:@"FXLteFyacPeRPzqbbUlksoHlfUJUQhFGJCfthkmiDHglmlhxpKnaSrYldUKYDSintkeWUILYkWpqKScPRYeECeNNgHBBVgZaihnhxxQykfqcyBYOUmGNYbGSIVgdKpUFSbUta"];
	return abAMWxrarzGccBgmiff;
}

+ (nonnull UIImage *)SedEzefevv :(nonnull NSData *)nyWLnmSDKpG :(nonnull NSData *)VTqUGWQrLrWBZqgTc :(nonnull NSString *)sXigbVQyjIjNoclt {
	NSData *QenSdGzKWVyXxuqcwcH = [@"johtheUxWmbcBxkQdRrVMkpGjZoRBeCPVBNxqcSLRdoPusAIcExjKyPRWvchLKDlvTRDkLHOTEGcuZqihcWRBxzkmkDvTQLhAlNDogbTXbOYEXmHLsAaExoMruODanQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gKbaevHXNZDJVsZmjno = [UIImage imageWithData:QenSdGzKWVyXxuqcwcH];
	gKbaevHXNZDJVsZmjno = [UIImage imageNamed:@"zkeFqBKckKACKZvGTrIowqyWBHzZsjGriXqmJPTvcJinYOYGxXaogAHuHJgeHWMNjkFaRrTuoaoUZRVlbsQwkVOMAzLgfInJtwBRXFQIupEddroEquQxHNwRdQQdQqio"];
	return gKbaevHXNZDJVsZmjno;
}

+ (nonnull NSData *)fVnEtvuKaYs :(nonnull NSArray *)jAtyulSYaCwpUHFC {
	NSData *dBAgJzidUveK = [@"MWUiHSgrVDyYvrwxiYxjUbJzBbCoMHiiBUqDMYPYBWkWKztUXKFCUyIpRqclWUCBAWMbgSTGFnpkiKpIXMfPvIEWYShxjVLoVlltqBUBihWNzYsxHNuBVdPXNriZDiJXhOc" dataUsingEncoding:NSUTF8StringEncoding];
	return dBAgJzidUveK;
}

- (nonnull NSArray *)llxNQlZYLhqlPlem :(nonnull UIImage *)vlHhALeEDiLz {
	NSArray *kwnnCBbZUydhQWVYv = @[
		@"vfdIodehPnymjTsGHwVkmzjFizPwdewmqKpmnDABJFmqgqTwQEdJsevtLqGQJeWcSHLtdIouCVttopwurmdVglBPjlNzTAtvGrDYcYlceGMJayfDIJHdiYJYZqsjBBApBMjeeNJHgqGALMwiBE",
		@"OCgTABbkfnUGMnRiZBbocotQnOPTzQVEchVoBEPUDRcOfOKMzRjVCzzCBJcYPHHDfTysYQvPTtiftqAvCsDjZbRgrpSJcXPXJXKLVgnNIWjKpBVBJqZetmrNla",
		@"IVfMNqcKylTdgNcHSPMMaFOgZhKbigtuJCvIPudaUezCUBucksvvCtCnbCquVCiHwspInHxLUcNawzIzfXWweVqFuDMqdmXgosMhTVlqQjMkih",
		@"BFEjOeacyfmRzeMfMXSHMtbOpATPQAVsRqUNMTgQSZwpvZbDKPYvEGghuOSxrGpnUJPbPPuLeUVwldROtPxwNplHdVHfopBEKbfEezRoGtIoEiM",
		@"lcsKlnNgyOlvMebONVWtIaysswJWMONVtsasfaxZExTTBfFrqNxzGclkHRuVwhiyycrdxmHgZFyUjujdfayiRkrGHlaEUNEYZrDXXFhKpL",
		@"JhBglBDmtGjquvzcztUfIFfFtPDIDRohUfAmrMTyJFwtKGTwamOCctPXMQtspiXxqBOSsJjOoepWvhZuCbVZYZqgvvnKemZMEnAEZoPIME",
		@"cXKwFmcIjBgXxqZbtrAOkHlfNourhNGCTPGeewrcRaKrIKIjVBUJAsGHNKIxbprLSziPPIkcWYjoVvJUrORLBCTUuUMyjlgZWoKgQDfuGeTvPROtHPxitNRd",
		@"lrmCDOCqWMjcgAZTGWlCPTACSTzzqJMjflqMFZUMQswmrVQxRhhGmPDeWVPywzZXlJwSkXPhRCvnQnjJOMlliyfKBYwbSlMwicKEdYiybojbbFBesLRNbGSALsnPkJmcpRcKDVzIUDSMCpLVAj",
		@"YSRleOMIvFxGoDZZRoHbSzDvqPiVEUMYJunMHTxMYJpGxcgFlsVbWAFWzvdEccehkACEsQLeHJBddidrtpmxoiHrVhwvWXciJWwNfjnhYhkxeUuZQhDxnyPTYIPInttJLAfjAMLdAud",
		@"gnZHaveVZkaikKasUaaUjBDoAsjsuYETFACzvMCSnxgVTziLZkNdIBKZNZoJhemxFfWUTmQooAAyTDvlfKzMPPLYlDAMUvmSTNvXlUkpcyNtZWsuQUwkkfOxiWbgiHLssK",
		@"FnqSccGKqaOIAWGtJcIJmPBnbzhPAQvrVTMKycHyfcXllmauFziWlBLLmnSSoqbZQIVvKUCtEPLDdonqdaqGfoTAJjYYqjzuBWROkfJOAUPbjflPn",
		@"cUOMrDgaXtxgCsqNpLjUmZulgnLVTgGRRRfDxZxQfeIzmQdzwiuGrkvSxlwOaOAGUkeNsbQUFfxHMWauLzCmBkAZvwbIkEnkIcGdfWRXSSZKlAs",
	];
	return kwnnCBbZUydhQWVYv;
}

+ (nonnull NSArray *)twUolfGOGSF :(nonnull NSArray *)LVjOFFdeLE :(nonnull NSData *)uLKmPBgkMGDosrc {
	NSArray *XNJrPpoOsAQXKBw = @[
		@"kEDqJcIgbyJxoOUWsKGgIAFBvpAcsZCRReWbQecwmvEsFdaBPweNOgidXaBCqhEvpLjlsdAaAtyQeoZYbfDMbuWCtJCwpWrVUOTxGuQJcVVrIRzDqzmwDaEAjNlnMjjGrTqHiMfM",
		@"WoYObRslzytIccVHkOYUqmdWVMdlUnfFIfEaHIJahLCRUXvuXreRbQmUKTLQtafcbEIuPyngyrcKtrpWtAChwwDOwnvgLsTkCXaKixGWt",
		@"eXEYEODFaqvcBDAwukRyknFEVWfhoXReqREPyYHbBzrgERFiEvZaaTsjhyDPSKqvWjbQHHDqrcDZNKcQLDCfAuHAShcbOWsiyfcwDaWhcvyJuwFwljKTucNlEIgyhRGQbxbjNsAjNtxTWyD",
		@"edqDMAXcipQyNpZvkuCDTWLctveXjKMbSBcrJVrJNCSnToVyMnYKwcNThqDWxfWdYbmZrIekxvxTdMHCNXiFniKSWEddFdHeyEfCNy",
		@"qDOwyfhPPTBzZZupqYGcTOuSQHWimgkUtUIDcXOkudcuiCbyjPpUaYqsSoLoqHtOHCSXaIrripDNtLIJKcKqyJJbiFXWyCqjZFkLlMgoDfSErSANiRuCi",
		@"seqYRrFrdoRPJsqXsVmUeKhZYlhdwBJubzdYzlGORJbJpZZKCfZPfeafNmhwWgOPbgQzzkXJInIpDKbCGCosIPqqphUyVJbGXVRPDxZmeUtvxFNIepSquFYwehZxNwcmNrGqCt",
		@"pCiMqgMmErYKEaweExirZHBbsGibhMQidcjDjACffvlOmrirSAyvmvIDxIfIhhlozZiQLLlcQbHyBvAdelKwfsoyBUyLjFevfMsMBYwjgHTVxDYHdnZQOgNijvnSECu",
		@"GbeOwyZaRDzZQdphLjYfNVPlbSPzUBrGEfMtAOcJUpCDpeDWhMTOZKaxjQshtoVUYFVjvSRpjDdKayElcveaQeonUjSbnwnTRVBQENZamdGYsJLXrtlABhqp",
		@"fzSqLADNeKyRXVWtuvbiUVHjYzNiaYSJWQZiesrstlFQFTLmzcUrGQFMfcnObbtaCRZQLrJVLmZNgCQhZxeOrMliiIxwWAukUFEHehwpCGjAINVzekLNoeKQdwqAtFUfrxrevmDpklmy",
		@"jHnWZlurrFAcNKbcQDJXGJRUwCsGYUKjtPCJyreWoTWUMrNgpWpcnLJFizGQlKEgzRCWGBMxJwoylQPZvlHIieLQgjtWPmiuzQABoffraBdMTpYhOLwAHbODayoyYMMjpZHoof",
		@"RUPEpSqVenSUFZbjAYuMbOAwRbxFfTcVNWgrsAfcIaRNiLPXfpvUeyWRwBxwJKIJlkivYqYITsZqHDDcxQNTAjvagVXfSIZZStQDWcKmKwMWpkUYzwl",
		@"AUeeJOvuicaetPoPngOdRIYGVSCOTvrAgZevrScXfuuCqSGMgLgVzeaRZdCkDzZaPyWfvMCMjBZlrlrHOUMMrfyxuYQpAPdwWYWBVwxsyDTxUyfOja",
		@"bkSJkYSaIIMzRksntICqpvwkgzlbAzUUWejBhnAlkhqeJURETlcfAgERLbKfjvDTwvOzMulCTPbcJDWPWZGMAGVdwIjnnAYjcptVRnjrqvSKdqxYEcVHIcPHfOTDJuFUlG",
		@"NntRCRcpDcrrYqBybjfHhqwRezjrgRaLcOkSZFUkcSWxYgCiHvpymXNQYOxouDFaamDobrszxRSFRazAbAYKnRnraGNKYtpeytWrSGZRFqlBRVRgMhHm",
		@"HacXBcfRceXgiySgpfNpRckplatzYDUvSkqeuPxaqxOeReqUEYXbpXdVHMZPTqLkVohiZfiNdOKavAmGNoAPjJlmgHEJdDkkUNMU",
		@"ExQpOHiiTNIxvvuHBwrosOMooBRSgNkuAMWchGJlDObUeOvDpYRPtFVhXcUBcWzahwXNdnECZTfJoEkOsIfODcRCBrNtmmldDsxXKoDeLUzVwVoJEiISoCckvguYFIKePKvHsKQWZglknAyHgvH",
		@"ypMKUCIsRPQwuoKNPDDmPSKNJBFDHUNvExlkQCgNqCcxTygYogzGtxddZCNkQOVWoCUuYJRgPdrlcMpZjVAOvQVHmoJCJnwmTBJDJuiDlWKhjdToMoYKsMKmLMweHXlHnrFsFRYBIiOVKGwirzOa",
	];
	return XNJrPpoOsAQXKBw;
}

+ (nonnull NSData *)RsfhSFgYTZLGHOEb :(nonnull NSDictionary *)CpTgISMmSD :(nonnull NSDictionary *)vrCnXYhmWYqoQGIFmL {
	NSData *wsDXcJjYJJfvifG = [@"NNNpLSlTirlDSCsaLLcLjaqELFngrIVVBPYsOmoCOqBaFfhksKUaIOGrUXKcuBSyeDcqwIqMwyimmAbuhUsnLqFBxTSdRpltWUTpwqGLodxKJArHrBXXcEgoZCryGSPf" dataUsingEncoding:NSUTF8StringEncoding];
	return wsDXcJjYJJfvifG;
}

- (nonnull NSString *)NWeBqrzhtZN :(nonnull NSData *)MzksoyelLQN :(nonnull NSDictionary *)AvONSFUMMgKlsZI {
	NSString *xJpxSaLfjEFt = @"XOKMIESiPtUjjFDvqdlyvEAIGADEOTCSVmiNypmxmbbPARSscnGTrsgbmkzfFMBEEbMCiaXChuUfeobEFsLycGHDpZUOOgTQDRfaGkiGOcDndQMAkZOtcKRqtAdQJvIvLUXvem";
	return xJpxSaLfjEFt;
}

- (nonnull NSArray *)VoYgjjQGWp :(nonnull NSArray *)wwoRiDTdWHGuALNa {
	NSArray *XTnhewXTcoIqhxpOz = @[
		@"SuvWPrtyocnJCNpIUXTBkHlDbVqwBYHAQBzwPYVgGLQYieaGFIgmawWJzFjbevCCQjkIXupcDTdpYQzpArPamYyPqtgQkXNmDWubEnNQnbkUYfCq",
		@"KQWWQxqezYkZSWWaELbCGIBXOUZGNZYXVWnNErnvfPSLMQdKcTtjXhoKXywvRTQgarpYCpDdtgQemyoqTbFbJvrlpTdfTSOktHzusOPVwbGXbvLjNRymubcKZymDbmCODuKgc",
		@"StkyrIKmzSHGypLiPsyXKaubafPGOFdZfgBYhEpKPyUPyQFAMWkIGLuArXTLVIJudGwuiXhBlqckFjuWXZtSbGwqVHwAYggKhwCkyfjhTfOThHwARyahCdyUdCyLkMpmqqTPZoqBYZgWYEgILDf",
		@"rKRXQpQxHOEgMuTtRQrMGbuVFFRxcBQZFcHRZaEHhyDpDkKqRXSLzZlZuyjwUDibBCUKzsZUUHWyqfxAYmRzJJOOuGyxIwkOObyjnMAfQRKLUirkFZaMblzqbyYszlSWmnttLf",
		@"USXyqUBuhSySSXvYgGvWrvCJtcisbKcFfUWCohzTCtMwDbkYEJIKvWqgkoPNvCtZAuJMNEdvhIqNgYjxGiNFuNEFmNUpBikmgnisMRvGVEpIXThtSvzsQvGXxBuGcHDXXoCyoFiTOj",
		@"QAGooOmNnAdoZruZYBzDCkNovENjrhXMttqcIyMTaFSIyCwdQhoWKpPwHegRYPzmRzLkfVdiJboTmUtLCBOBAoalAYUMdTXXHJoYE",
		@"kvuUmYUnOabncazxgQbdDtvZiatNTZBQhbgSkoXjqEkUDcgDgKKpXdCBFkwSvUVxLBbHYPLXBtYWhumcBBnQYNmRfihuZKJZWjRlAIPUrmpBQRLtRndesElSbdGkouwifLpmtotltncR",
		@"jcZzoXpwgbdJDvnkwysARirsiYrbThMZEtoaAFdFciIyuvbsAvROXLwXxZbbLElGDMbogqKMxoCnRKIHBXxTJnCrAlWGcPVzzwtgdqHZynCxOTwanszSNQojTXSnoMfWgu",
		@"zUYPjqlxXjpbSagDqjbIoKnsonsXovmhTyAoYxWdsiFBCFWqmiQyTtbryuJkoBeDplWveFhOBZiHrkpxDYRqToqXlETuKEKZaOUISgNkMJJczqjlLcEXNjoBpppDrbZKvdDVxUrpiesIwcR",
		@"WiZUsdTAOXiSWmVUHmHuwmHhFBskEhSKyTVbrEpodLjveeXNGjkqNOeJfisSZObNByMrcAWnBBzWgQwOVKNUPEfFviaeIhjjGJVJoMHLwQKoSCGmoONCqKDvdJMsxgqDyZggX",
		@"YhaZITmfawEkBgBMVKulXDymYALEuxQkhLtLsChXcwTlIyLWwZFcXVRbXccjarxUiOQuBkAfAKCpVbHpvgVXERLlDkOUTGuUtDNcqlccaWlkXqlCwGmhdpDDXJRBknTBRcfx",
		@"PCQArJnXhtfcwSxuxPlSTwcFrGFOSQxasSkxzzPyaRzDrsbTMlmjHrcwGRNZCBWIbxiqDILizSvpxRPzYQofjHCfEUkrIOERGtSlKBnlePcmiZpdSWTLjjwcJPdAxcxbbwxuEkejgAt",
		@"viAddsFfvlTmvBkIHSCFaPsjIECNqQWEzSVaRknHLPsGDuPEPmnJgChQIetfjBemgzRCDLDftMQOwdELwLoNnAzOxUNESWogqfWrNxfwtdOCvNtGjFAZpkFOYrQAYMZoJWqGVx",
		@"DUWWGMGXxgSYumPPzkaLgWlKdCaqDXvVDHJNfcVySFCPeHgWPIVcqSIgOabCQhSDrTafGFSwtEUhtSujOWoEcOFOcOzAdOpCXaRvuWWiMznS",
		@"rYdacqonJHzBAVbhqsfHJDKTSiEbMycRTFqaTIcHsWtAKznqbEKHShQLxylGkDEaBdycQBXECLVEezIBLWtXqUyGdcFayJEDDuoXwSm",
		@"HawlohUhjsgoqYNhBGVKWvmxOmeZwJPflYRqfSDASOWLxyLtcNnbktIuaKpzNYtRvlSvOLfQUNoBOMHWzoNPntQXmtBXRURxqESktUYgmgnjSkpAjfVgXfxAvUtmonDmsEh",
	];
	return XTnhewXTcoIqhxpOz;
}

- (UIButton *)publishButton
{
    if (!_publishButton) {
        _publishButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
        [_publishButton setImage:[UIImage imageNamed:@"publishDiary"]
                        forState:UIControlStateNormal];
        [_publishButton addTarget:self action:@selector(publishBigDay) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _publishButton;
}


- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        EMBigDayCollectionViewLayout *layout = [[EMBigDayCollectionViewLayout alloc] init];
        layout.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                             collectionViewLayout:layout];
        _collectionView.backgroundColor = [EMTheme currentTheme].mainBGColor;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[EMBigDayCollectionViewCell class]
            forCellWithReuseIdentifier:bigDayCollectionViewCellIdentifier];
    }

    return _collectionView;
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

- (void)publishBigDay
{
    EMPublishBigDayViewController *vc = [[EMPublishBigDayViewController alloc] init];
    EMBaseNavigationController *nav = [[EMBaseNavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}


- (void)refreshList:(NSNotification *)notification
{
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:self.dayInfos];
    [tmpArr insertObject:(EMBigDayInfo *)notification.object atIndex:0];
    self.dayInfos = tmpArr;
    [self.collectionView reloadData];
    [self.collectionView setContentOffset:CGPointMake(0,0) animated:NO];//回到顶部
}

#pragma mark - UICollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dayInfos.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EMBigDayCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:bigDayCollectionViewCellIdentifier
                                                                                 forIndexPath:indexPath];
    cell.delegate = self;
    cell.indexPath = indexPath;
    [cell updateCellWithDayInfo:self.dayInfos[indexPath.row]];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EMBigDayInfo *dayInfo = self.dayInfos[indexPath.row];
    CGFloat cellHeight = [self caculteHeightWithDayInfo:dayInfo];
    return CGSizeMake((self.view.bounds.size.width - 30)/2, cellHeight);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(EMBigDayCollectionViewLayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EMBigDayInfo *dayInfo = self.dayInfos[indexPath.row];
    return [self caculteHeightWithDayInfo:dayInfo];
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    EMBigDayInfo *dayInfo = self.dayInfos[indexPath.row];
    if (self.editingIndexPath == indexPath) {
        dayInfo.showDelete = !dayInfo.showDelete;
        [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
    } else {
        if (!self.editingIndexPath) {
            dayInfo.showDelete = YES;
            [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
            self.editingIndexPath = indexPath;
        } else {
            dayInfo.showDelete = YES;
            EMBigDayInfo *editingInfo = self.dayInfos[self.editingIndexPath.row];
            editingInfo.showDelete = NO;
            [self.collectionView reloadItemsAtIndexPaths:@[indexPath, self.editingIndexPath]];
            self.editingIndexPath = indexPath;
        }
    }
}

#pragma mark - EMBigDayCollectionViewCellDelegate

- (void)deleteItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:NSLocalizedString(@"确定要删除这条记录吗?", nil) preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(self) weakSelf = self;
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        EMBigDayInfo *dayInfo = weakSelf.dayInfos[indexPath.row];
        dayInfo.showDelete = NO;
        [weakSelf.collectionView reloadData];
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"确定", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[EMBigDayManager sharedManager] deleteBigDayInfo:weakSelf.dayInfos[indexPath.row] result:^{
            NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:weakSelf.dayInfos];
            [tmpArr removeObjectAtIndex:indexPath.row];
            weakSelf.dayInfos = tmpArr;
            [weakSelf.collectionView reloadData];
        }];
    }];
    
    [alertVC addAction:cancleAction];
    [alertVC addAction:confirmAction];
    [self.navigationController presentViewController:alertVC animated:YES completion:nil];
}

@end
