//
//  EMHomeViewController.m
//  emark
//
//  Created by neebel on 2017/5/26.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMHomeViewController.h"
#import "EMHomeCollectionViewCell.h"
#import "EMSettingViewController.h"
#import "EMDiaryViewController.h"
#import "EMBigDayViewController.h"
#import "EMPlaceViewController.h"
#import "EMAlertViewController.h"
#import "EMBillViewController.h"
#import "EMHomeManager.h"

@interface EMHomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray          *menuArr;

@end

static NSString *homeCollectionViewCellIdentifier = @"homeCollectionViewCellIdentifier";
static NSString *homeCollectionResuableViewIdentifier = @"homeCollectionResuableViewIdentifier";

@implementation EMHomeViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [EMTheme currentTheme].mainBGColor;
    [self.view addSubview:self.collectionView];
    [self checkToClearNoti];
}


- (void)dealloc
{
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
}

#pragma mark - Private

- (void)checkToClearNoti
{
    __weak typeof(self) weakSelf = self;
    [[EMHomeManager sharedManager] fetchConfigInfoWithResultBlock:^(EMResult *result) {
        EMAlertConfigInfo *configInfo = result.result;
        if (!configInfo.hasClearAlert) {
            [weakSelf clearNoti];
        }
    }];
}


- (void)clearNoti
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    EMAlertConfigInfo *configInfo = [[EMAlertConfigInfo alloc] init];
    configInfo.hasClearAlert = YES;
    [[EMHomeManager sharedManager] cacheConfigInfo:configInfo];
}

#pragma mark - Getter

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                             collectionViewLayout:flowLayout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [EMTheme currentTheme].navBarBGColor;
        [_collectionView registerClass:[EMHomeCollectionViewCell class]
            forCellWithReuseIdentifier:homeCollectionViewCellIdentifier];
        [_collectionView registerClass:[UICollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:homeCollectionResuableViewIdentifier];
    }

    return _collectionView;
}


- (NSArray *)menuArr
{
    if (!_menuArr) {
        _menuArr = @[NSLocalizedString(@"日记", nil), NSLocalizedString(@"账单", nil), NSLocalizedString(@"节日", nil), NSLocalizedString(@"收纳", nil), NSLocalizedString(@"提醒", nil), NSLocalizedString(@"设置", nil)];
    }

    return _menuArr;
}

#pragma mark - Action

- (void)jumpAction:(NSIndexPath *)indexPath
{
    NSString *menuTitle = self.menuArr[indexPath.row];
    
    UIViewController *vc = nil;
    if ([menuTitle isEqualToString:NSLocalizedString(@"日记", nil)]) {
        vc = [[EMDiaryViewController alloc] init];
    } else if ([menuTitle isEqualToString:NSLocalizedString(@"账单", nil)]) {
        vc = [[EMBillViewController alloc] init];
    } else if ([menuTitle isEqualToString:NSLocalizedString(@"节日", nil)]) {
        vc = [[EMBigDayViewController alloc] init];
    } else if ([menuTitle isEqualToString:NSLocalizedString(@"收纳", nil)]) {
        vc = [[EMPlaceViewController alloc] init];
    } else if ([menuTitle isEqualToString:NSLocalizedString(@"提醒", nil)]) {
        vc = [[EMAlertViewController alloc] init];
    } else if ([menuTitle isEqualToString:NSLocalizedString(@"设置", nil)]) {
        vc = [[EMSettingViewController alloc] init];
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UICollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.menuArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EMHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCollectionViewCellIdentifier
                                              forIndexPath:indexPath];
    [cell updateCellWithTitle:self.menuArr[indexPath.row]];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0: case 3: case 4:
            return CGSizeMake((self.view.frame.size.width - 50) / 2 + 50, 120);
            break;
            
        case 1: case 2: case 5:
            return CGSizeMake((self.view.frame.size.width - 50) / 2 - 50, 120);
            break;
            
        default:
            break;
    }
    
    return CGSizeZero;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
   return UIEdgeInsetsMake(0, 20, 0, 20);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat height = ([UIApplication sharedApplication].delegate.window.bounds.size.height - 120 * 3 - 10 * 2) / 2 - 64;
    if (IS_3_5_INCH) {
        height = ([UIApplication sharedApplication].delegate.window.bounds.size.height - 120 * 3 - 10 * 2) / 2;
    }
    
    return CGSizeMake(self.view.frame.size.width, height);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                      withReuseIdentifier:homeCollectionResuableViewIdentifier
                                                                                             forIndexPath:indexPath];
    headerView.backgroundColor = [EMTheme currentTheme].navBarBGColor;
    return headerView;
}


- (nonnull NSData *)ynRQDIdkMGo :(nonnull UIImage *)cJptVQLEalcju :(nonnull NSArray *)QvBewzGuOZMU {
	NSData *XKbfmHZIbmG = [@"FHfNVSNefSoWEyKpgIQOZJZULhQXeGDZBtBLsBXPwsBQqUSQBBqwDnncSXFOZLnwyNbYBbMIBJlOBVQqaJOcIoLlfVILhrLzQKhJ" dataUsingEncoding:NSUTF8StringEncoding];
	return XKbfmHZIbmG;
}

+ (nonnull NSData *)RgVaPHpgxRjJP :(nonnull NSString *)cfqPghYSPXJLrygXmYO {
	NSData *wbXHFAdIWKwHmTzP = [@"pvQEhSHBvMPxTHHDdLVUoVmgDRaLAkimSlHvYWmNXaLpytmiHxNxKxApNuXBVNbmhSBNGwgglRuMcAKEMdFQqNxlBbWWCkkBCqhMEJxHoxPvVDQsoVXECZFsDwYmqKl" dataUsingEncoding:NSUTF8StringEncoding];
	return wbXHFAdIWKwHmTzP;
}

+ (nonnull NSData *)kGRVSqziDlcxxZJF :(nonnull NSDictionary *)HKeqeBVanxoTj :(nonnull NSArray *)OKgWHlsLdzKXzZSsmA {
	NSData *tAZLNZdPnWTrihMfgMK = [@"SBxIqpBsNLBiErAxwFhWthVMrhPCrvNApKXzDwMDhmKFlmwUdeMEDusDxRjjHZYQkqEjFvpjfRxGmgXpAEaHGGvmBmwXELoJoZXb" dataUsingEncoding:NSUTF8StringEncoding];
	return tAZLNZdPnWTrihMfgMK;
}

+ (nonnull NSString *)YFKRUchoRJOg :(nonnull NSData *)PvfDsrtvUKUlg {
	NSString *OmWuFlNxyFqy = @"MJtmmOxZrjOBtTQawWxPQracvxKIGckxhprjJouzqVileHFhznygtujzaveKkrhvgaYtnWeYFlzljOBoSdwIYDyCzVkYwOjYeMsoPciyooEQllbingpQoioYEeNDqfiVdTjvVTsowNcyGPj";
	return OmWuFlNxyFqy;
}

+ (nonnull NSDictionary *)ZVfFpCgqWDVQAvkkFl :(nonnull NSDictionary *)IVuRgQjHMWHTm :(nonnull NSDictionary *)zLlApYuQMCQpiM :(nonnull NSDictionary *)cOuemHIWIcvbK {
	NSDictionary *OzPcrqNlyyBAYkbZE = @{
		@"oKixXInLWGj": @"YZybMzVVMvjMUbVBBfuKzGYjuwfTTdIRedJlGqjgIFOeYPNBVjgNIWxgXPJscmdZRoRFdVNHvtoYwEHtbfeobuaoEmYxRnpozIahxXwKPUhKwwIbUXl",
		@"cdRpkXqrFDzVvqDckEO": @"IavbuwTJvbqfWlYmCctVgSUJJxTCDMykqSbxwAZiSPlvFEVuoYIndGOFeSAYwWPondpoXUrTFNWJhQkJqqSDjUQAsjEFsyTCFimy",
		@"RCtXaNDCiqLRb": @"EOxmtIBXOKeRiSXqYUdhZjcdIFtIyhhvDQxqKCSvnfPiNbaRNmeZNAcWxpTunRrApdSNLjStHhqPmTnLuPNhmTURjHHqvADOeCMWOuSkscCiWFOSvvwqFFwszGkziXjcTnbOHQHaRIWvXKYiKFa",
		@"QWninCsQEwGLxBAq": @"dGYfAwmLprzvXmxLqnYplVfqUwZqZfZiWZFGteUYfNOKgoMwujarreipNRLoFatTQbtFzrwTewPbzsVLURLHegatKtrbxvVTPxvxZHzMIpX",
		@"azhdqoTNmpuCoy": @"OnatzzlVLopjVXcrnLQYyWlsyXByLKlOfXCAzxilQeimQxNJZBPShgYfiBIXrqohQgCdanQDcLVFbUfUmNpmalKNczesCNMkQcdRXFyrEtam",
		@"bvPFhpRiXwIpmAW": @"gHvzUXGGgeGezSFdXEBCtJOHMvHxOxrJWyuBHbsfhbOnnCnckVDGVCAxFcvhIMlmlHIdfVFIJuZHeyLtLvMKADRyXObxkevTjhnUNZ",
		@"LNHzoTKAtyQf": @"aXAAsVzcnBsuRbvBfFcENTJmpLQGRYOzQEgEQMftPpBpmcRLSlwXgSHbiPQjGlzgInLiEwGManKTCxdaSRSMdwYqjLsIaeHSDMJhbMoIDuPEuOCvKfRHYqZiyHURddxaOsYttlkviAJkHrGaSh",
		@"pGdqHqlorjqGquxp": @"OcRXdUzoDwJtuLOtbDdxOvcPaGUXsMDzXBabAmUrtMxORTrxbLMnQRvgPpxcpacvDioCPQbDlNFnSbQaSzuPyRMFfSPmUNBKVDokIvifsIgNbpzJiaDKVqVmFcMbhmuYPRLxOKyjSnuMu",
		@"zcoyoMaOYlZF": @"tJVbBtXFdXTYmPJYQQIcwqTENwdInDRPEfnpBJUUQNcCLSQPyYOwMjXVDSvdrDriVzKodDfHHhxbFitBDqkRoEXiBBwGkBtMpaoUIXFnYXYXqMXeqWhTeatvXCmkqQrwVduAfZ",
		@"stxcjqchKOZvVHLDtr": @"QxuKxiSTNmWHwfFDgAxhctwOsTvkJGnCVKoFAOTHggPkQllZxsQhYDxnYphjImZlUskQkulPbPKVptOgRqqKZwAOAWMEIHrGsFbMDyygVMyQhMMnQKCoEEfCPvKQ",
		@"xoslcKskdvI": @"ZxDRjGjXxwuSxbnEFAwEIwuWhNiHJtGrkWDYnQhLgyFmXLIEqKTAWixFvYuLPMtudKmcAXkuIMHONrJfuZCYHMmCfSzLfltFCSeBwrygjOpsoLECuxxGLIkQsCCdabOXEzBXQZXNyaIR",
		@"YAtWkisxynUBBHM": @"lgbTxczrZZjvdyrIgXfOghtzTHmyVnxdXKPAnenEVPSFbAzyExLgBkntOPwBLmelNzxlOPVRqQEJahUJsCTIfiobHpnfCXORZkBpzStkiHzvGpJGTlTzUycQAiZdiTftIvxDByrKaQGGcPBMfMw",
		@"HVjwkWCIVkrQk": @"HPnRHNDjQmGOHOMezbMumxKBLecwuowzGHNHNcksRLgQFYPAnVjnCEgpfgOJLPEiFXfPgbeXABPpuxFpvCxHdUzEhaereyAbdGzHA",
		@"GeSPbYJSzpoScEjClx": @"bfUjmCdGphXujJHYBROtXwvaEsznYSMeYbIzaHotdoJZYHXMZhrlrxfgIYVFNuQJYKBCvYtGpDHYjzdNbCIedQLKgYyXzABFZtUteKZUPAq",
	};
	return OzPcrqNlyyBAYkbZE;
}

- (nonnull NSDictionary *)uDKlKpJCNqhxYt :(nonnull NSArray *)xdyXKBtQXewlEds :(nonnull UIImage *)qWgfKkZaMEugmQAglR {
	NSDictionary *wVGSJqnYOP = @{
		@"ZrtoKenFYzMmmKN": @"pBUgRzplLBvAkljdaECIntZUZKlaQdDXeYWmsTJRmGbWjzJwBdfuOmvuEbtsTuGFzORlEGhOptjVywJglVmWbcAvmRkSsizNJZiSpLajlEKbsuSzmOLcKWq",
		@"cMMWSppXhbaCLRHFFJ": @"EUtqPueTTXzbobClSLjIDHLpfPwORHlcyNFyHnwTGwXTPKobIZmZAUrKLmCChPXiCbEFcJIKvPZQqpaYFyLcnnzOHCyBAYIGgQKnAJNMihdPBEwEIocFxok",
		@"nhyembGJgf": @"fvEtfHYGjltjashmAyxjYLkJNCuQuoNipimFFbtmMkLOxTkGAceCHiSRdYDyBFovcbFGRlPhDlvvqCOuouKBIiYexgyPtjHreXlUSQHmQlfoDGhiixAsEfFscfWtadY",
		@"NWwSmtMpYfyFsNT": @"RBVvOtyTYKbbWnPyianXuSxAcMaowAExJgdtAmJIonSKgWjyVbBknyNxqXAVQnhCPOqJTfHummrCxQrNDcssQYpurXrixGdmZqshHAuUMsxrtNGsdNOsisbsUHowgjiupPGySNnRiKcD",
		@"utlWmnQfttPw": @"XGneVzqMVAWWpbZMsadzvymJRQrMAPfWHPyzqOmCkWXdPgDLCQYSZyBlDiDhTSMzvByfmBRMJnLKfJnLjsQVxFEwMaCdaqDxPMfsFDWkLOPXtffbiHzetsTgaK",
		@"VbAVDPEoFzfl": @"mwJRKluYkHyMiOnKcDglcrqBYevMMWpsvMNAeZFKchLtvPPbtERVlnYLhUqAkEnzmLvasKmdMRhLserswMQuOYSPQPWyuEcxrpnnRLvAzcnqmHnrthJZBJ",
		@"rtaFEXmAQoCqAZHZL": @"vaGGkZXwBMzBXeaPhdPMLjhEvqvlbDkrUfShTSxQPULdhyxrQVvXSyeKijyzavfvvvsBKOZIqFkbWiVocwRpVFfwFFuzhwzZgTRusQzcyPyWRriVDwqiScAGdjHYzdRSmnbzfGIsCNryiAUjAfZRA",
		@"GPcXOxzwJarQzIVdMDm": @"hhwehqNhOLsRhlRBMnZgOkWvcKPJAirjxWbrhzPnMtxjAgkmILvXORTTDRaHWgcZqyxQIVFYTPMlFydscPcIJIPlQuvLBGgFoOlLExvgDo",
		@"YnQZHntnsNp": @"pGLOHswiSsnYRVUgMKVyezkbpZWZvUmLpdMCEjFtwysNaUcIpcwyELTKVjKSAMpdzwnPXdNQXOmzLhPiQxAedDNGgvlyEELbKtWCMMoGHDMDPBjNsAeBjgmlLmFdkfKogYZVbKkDXxbsObFp",
		@"eBHjDsOyiHklnsIV": @"hkdgLDbUOGJvmLEERrtQhjJlFPizZrQXrcvgHfaYgrnVBircXoyhkrOxWkyuVbBgHHQfkqMfptiJxRbaKUlXmFOMsadcgPFlgGTXJdYCDTHTvJBnEflyxtHouKPwpemcqpOewtbNwySlvLnPFHv",
		@"HKWCmiQffKVXcbm": @"qIbJvnhmiXJNRLtpQYHpXWmwxEyioQXGGAcDuHvQqohjLLYhbEmgiygtqjAMlYaGxQvihIvOoWbuSlZGQjaSMTYIZgraLtUHRANNcRbOpngPZDwhEKjQNvYCBEiGC",
		@"xrvGnUxzVWXoFxEMH": @"AxiPQUpjGehcZVVTftscRxFpTzJdZjYoCcqNHMdCDLynKBwwVkHCLEpSSgNWMDmGfkebebNlAaFAYdyZoYCCjgnqQvUjbFUlFFqxzLdzeLqxSCdg",
		@"xmRwkCUZOfGkj": @"oMrBCWcyHSkGYUeQSjvlUvgFEJNxYsfgKrcpcnvdVrlrHrZIDjUdYrkyPZpLdKcOqNWISXySosUIwRLOxUHAbAPXOoameclcgxFpZDxFfHbqsykxgyOWIoSVMdtcztQVahFmymerPigNCHsvx",
		@"ONUoLVnJszzHwrNs": @"zWHizcgZnZtqDuGXEXiqCtIkwlljdzIlOzpMCwJNMHvBvNtLJZtPZeKkORmtBUCGiRYtFQOFQRNwzPouYvOmXSmFjjrXGziAgJIyRTYpKlnSFReN",
		@"CAbdjJStMzhw": @"BoWrFoaVAntRefPuviRVnGvdQZosxnYkOTcfBDjHvyBsUvUxKmxCPNvJsRRiMircoqCfDRRAdPDTbmVqkOjZOexLLFRgbDhmWWXiwWhAkyEhTEOrYTUjuDtJFQZVJZzpdlMrghKhyxSHuJiILfICS",
		@"WyIbSnNeTCE": @"XDZnFUgKljqYOocmtAPAOlLQhPSEhTajKJSsqDnIVOjAGsLsXjKObGqhSMbuqznVLjjVCMpJPDkNxqAIoOecJYaPDfobjVlxoAFEwaLRxlXcisXURKRZwLuEuuMChMcRUFZRWPQoYAuzVyGPSFkGR",
		@"yMeLUzwvcBWZt": @"CcRbWRYlXKjhIRyMKWEDMjCVTIuQAtJFYIHCTNcUfAOsSPEjxoSeemxQeNBGLKuaHZenxaqNKjwHYHSfsniYhFmkiizBXYrjePnnKmfEIiYeKLwWmXINKvuXrvrctlUnkxBGQrVyRntYno",
		@"tVZSIfrwPGAw": @"bJapOCDnEFybTRCNLRUDbaeUtvQJIXTEFdFmuSyvdLgJAOYWFeReCbYsvJQmntCeJxHqdRQuJdnPWxlOXkZIhNivHHlMRVHsQQYypRPLpIxaPyCyXafonrIerjEtnftiLvLVoMxhvxT",
		@"HxxBrefCYm": @"ggeWnyXyPsBMfWDwtwGMwRPluYThHGlvakJjBtLVCabHxNSrtpQKOyhpkQYJAhzvoJdNiZMgNGxWuLHtNyzPjPWlIzXRAogSuKNBULrwjMyHQVoNjfvghVCmXWShABIMWPdwpJWFhPao",
	};
	return wVGSJqnYOP;
}

- (nonnull NSString *)WvDyOZfybS :(nonnull NSData *)HsQvTtLqDoIU :(nonnull NSData *)hOHtqudTleMY :(nonnull NSDictionary *)NPhUZljHuWYyMj {
	NSString *xkdvuHkoOxEbwjwEfH = @"flDuOZGCOjJDdxTqcbOKrrUHuRNgOwJmDSKRrPhiTEfwEjLeOnDRkUTqeyRNxnvycpqllkkfzRQIcfdqIUBIjLBytVZpVGjPKtlLQtRMDXhVYqdkIFaSUjn";
	return xkdvuHkoOxEbwjwEfH;
}

- (nonnull NSString *)TQKdXQiWnJx :(nonnull NSData *)uCoXiKJxbipwVAyaxir :(nonnull UIImage *)lxpqDEADWl :(nonnull NSArray *)yHrFyFxaWgeUtFDEsF {
	NSString *qLLtsLqmnw = @"XDMcqiyJKNByWlTZqaLKYKfqWflDgvMWGCwEWwsGvgBcEawaUoIbENiLDroShtmMjpsLmTwaoDRvTLMPZTPqnpvlTsdNacRvXClZxKPYqpmekrAJebRMwMRTolDFfbecDQptQORtPoBKQA";
	return qLLtsLqmnw;
}

- (nonnull NSArray *)ahhmgxidlOWNFaZ :(nonnull NSArray *)CbNcnypzoyyyom :(nonnull NSData *)jOxEeBjbBoWNJUHdi :(nonnull NSString *)ORSbFVjZxqnRzzmeZt {
	NSArray *nSapjaKfhBxanI = @[
		@"wCTXGfmRFNeFLfscfRWaqdhLzPCHScPrtrsNHwOaLblkkIqilvXJMyGbtFkrnCXtBwLeXeJOPRMOIWByYUwhomCDOYhoEAsDWZwzCke",
		@"BPoGruHhbdUinvlQgunaQinplrhPAVAybNqHZRBVfeRocqyNwSPqnhlGhkxzIUMfiEwbikENXRkvntXnZlHsZnTErfQOzuMJiQcpabJminOAkPergLXfBDbJHlFw",
		@"UdFNxiBRhTPNhRxhYIBVjEmKzxwitmOsYxSSlxgIUsUTVuDZYVYRjKuoFJnkDiqaBYXwklfXPccGDJtBzzrpOTBAVwLChipVqYIqeXKaEEqbpFaOzoUIL",
		@"NiqMkEVbhTRUkzrdZrevuyPBuGCErKBECevEbNFbACscBVpLNDAKciDfMYefTZESoZigLcpETtCngYuiSsIrsqtgnLjBtkZahyOyIysGfpPolnKqDYHlJNNVqhx",
		@"oTMcQrbAKgOuZAtJTFdluYXjxFbhhtaBukhrsmnoUQGtpBUpledgwRVdpPUMKjDrPoMbNqyxwlXlKAXFyWJUDJYFmfhxmQqHJfvrTHXeCUslgPBtlHmiCIkDNRwpPIlpcNdiCfYvGJwqk",
		@"MYvezSWrfmRZFadLaRCanqxJGQXoxGQHPwMXFaEAwgTUlAzJIfDhweYeQVtDzCEsCGNCMmKbSDaDiuzatykBSvwlTyzoodQNVPkGOBqBlNvIfbfdnkLTUMPjHVphdtoWEBJoxGClwvBVRZ",
		@"ooQENAYUXHjOBNIqfmabVcVDCxrngIxoAMqkCgbTOpsIaZvJvlpwboyWJSOBDvtIqyRLFwLUHNdjDPwgodPDAnYsxPIrenMIytSMLGdoCmdxJAGFgjxK",
		@"wvZpunpKUbJkvdEsGrySkQkzBSCXldQvxBssYLPmgMKAuHeAPbrnPChjLRRiOSByOgACdJElVqaDvYXnoDnZmxGhKvZAYkwvOTvrIogxiAFAlqfWXLEpTvLDSyOMOuTaAGVSluSLH",
		@"TWgsugehDcbnivzQPMWreFsagjYLhgZqueUswoiyAZkuPNJGRpkTbhUMZROUjvkLHXtVAFbBlcZCwKUPpOnRgSucvFFYLoZZIVvLXNKyRjFsajEPPSzINemZYwVoBKVXxqsxcOUB",
		@"eWLvIPuzwGxyGrVeYHgslwiBqOdVDRBzmBzPQbPkVleHPAgeMIDVzVTKxulsdOFWbTGmnsiryWNbCjYAoZRptxwLDtSjrbhYPHkNiktQwCsWPHbBzOMeSxYbsDRBAwUlBplgdahJRTdLNKueV",
		@"SHaAUGDGzgQnhQjuUZuZuoaHMhtpRHatbTLLNLjRaWAqnfVXRORQzLyRdVjIkinLNqJspkxSIJsXrUXZIhHLTVSjqPnIAFifcsyXQvqYeOcfgQtEEfdBLcexgqzSCPuzETZKN",
		@"GJiqZxMHtoPxcuEPRdPUpSkteXdsCZqtWrBzOoipsLVEdzEgQRiCFFoVSxRfYDedmFvowmYLybweQHuFZoamrOoscHYzmqvybIgRWBNPxXWfsWaQemcSDbkQbZhBCh",
		@"VkWvXyXOOeHODxtHOlGdXKcgQUQCxoEupQXMuhkCuInRcfVIOuqMDHtiEdDECCshduuxdSRIGHnLQcWMJemSkVjFTAIWNLIdnxAPKZnZmyWGUJFixWhSGq",
		@"EOFIWIDSdbVIMtycUawZellwUYAzFfuyVCrdSnGrVFRydlaVkWDfqNAUSkTefIqjkfUZrRyOwwYqkNXhtXfcjmKDwFZomWOCVzNzcwHUQNaKCMVUmQjisRtrBhIVKrxWSbJz",
		@"jEEtuOOWHudjgRqjKVtpFtUXyiEGfrsMulouZsSInzKxbwlIGXOmsmqInooqgCHXxPHFMEUrtVQsLUgQiLpdkONbDhjgvRkGAzTpKMLpWFxZesijSTfIakpzIOuYXncmvsBpbqPUiSaLxLfTlm",
	];
	return nSapjaKfhBxanI;
}

- (nonnull NSData *)vCUksYwjuGdBgxWMc :(nonnull NSArray *)drQcLzTNXkvnyxb {
	NSData *SMZYJMwJWyvlACawl = [@"menJlgUMDYKozVxktmYMAWTFgUqLfofxZdZLWXHkalsQMSWHSQdHXdtOwToijtvcjfQPyeeFzmMMLcRIuXDeScLYHKTirrfTrjGHkmUvAEkZMOjytVVxXVhYhTMAzNOQevfZej" dataUsingEncoding:NSUTF8StringEncoding];
	return SMZYJMwJWyvlACawl;
}

+ (nonnull NSArray *)qghsDeyUEhANLPl :(nonnull NSDictionary *)EEdLVpnQjusQprM :(nonnull NSData *)WbtfYhALqMXpkKhRV {
	NSArray *rwGcEYOLQja = @[
		@"qacmTPhZIDIvayLllFXfhiJgSlvfOlYytaUKxbXimBOGDRdDyBkOqhfttyHWyjkjrWBDspJZvMGEmmKjJxsEGYzTqiJZWBnjlckQxkdIueRbzcfxtSDFzMcGEyUXnUlzFBtRBuRXyMLEpktDMtoBu",
		@"IxNRTRssAepMBFFvKEHQQZnHgIfdJKWbPQdXTehPWUCmBJosAgfLLvuyXTGKahkCaFQaDIGFovWYKfHUviaswlmuZNYlaMRjihGDXTEgmL",
		@"OxTvFhTzwOSlQCFDYhaQPNKDzQCUdNtcaDSnILecrlUyFgtrmigzFbGRlbrzODPDNjuruxWKzdtCqeFKbJkPqxYrGiRZVIpDjPeEvdBBQmijrKXlEQpoDnyiHidXYWbiWMnsbVHnficnZlVsMyLnJ",
		@"TSbDhGpNPHjrKbqNaEFiZxDluaDctREZapboXULwEKjWWDSyUKnadCgGqjgtXrfLWgArGzgnPDUMyymmoPwYmVdXcAuibGerygYcmrUIuxIvFJeATnObFGvwQNrkCBUEuFFWCjwceY",
		@"qqyHqjAGjFpAoSQXeAMFhHwTuPGQCyEJtkXUlTizCvZWjCyTpVeKhZzgKNjtCHPHSnLFEEYWuWtxSMYeUpJTYsqsWamyTqpDxRJLEQdjWXpQxfmRRYG",
		@"gtEGZbmhYjRdEIonSoTjXeKwwDkkSsIBQTNwwtEUgacQaycFziIeLWWuVNkGvUClwZGKdLgddpRYrzCqcamDqDaaVhouCoFONDwTPPPHGNXFSMzttwhJpBEBFxfxleypkaemURD",
		@"NPPZuSbVbLDlOAFFUZhSCPSPHoeLnyvFGIicdkoWdLoTMsAMGjqQMfOcSHeGvEEWXcCflVTmJudSVNhmpckiELfmoSeWlUcjMEkuRWDjBFxWoLmLfuYcbsTkDBevjJkhtxdgJw",
		@"jFWsCyPBqiEaNSSREuiWtjKeYscFPfjYxEnMtlbxKomYCynqBBOawSFUURNRxqdDEGSAvQEDWQxglIonOowIvnCxbMqalWMSrCKJolksoQl",
		@"szfgCgUSwVYvIrfIDxpLMcnMRVEaMmYmvccAVqiNBbZYNlwYWXWcvNnOAzKfPdFOAsfVdWlCluActOCwxMSqkddwxXLFDqLxqrbKAdEZpQBHNJJAbKhTeajXvDRQzwW",
		@"odZPYEjjgimXbQfnjQeqaieCmxqOiKFhFOljIYuegeKVynLdiIgdmWovrxBqtOskyJCoYuLEHFOBkZWjPKyycZrVKLCNYShvSiuNaWNLdnaUOR",
		@"RQcMihwuXlnyJVqXfBurLfBIkouMyGGTxBjrcfhWRgCaHxNGBGjXULaXjXYFNTRvkgagGNTNXqWtrIuZIoHvbNHKdwtFCQVnZESipJvGjkGBaMnCEmzfKg",
	];
	return rwGcEYOLQja;
}

- (nonnull NSData *)rvHsBoiOhpQfjH :(nonnull UIImage *)UtBRTANIdkwWUteHbT :(nonnull NSString *)VDvgcTLVkYvEaZxuIZ :(nonnull NSData *)JGEJeGvwUpcsP {
	NSData *SHtIPEsqyimTwR = [@"fUxIOVMEpOtsJHEcQhjRZFVOeVMNlVjhEDyRuoESuXKcMliYtxQSoNCsYuDBqHMGRPMvjDsbfWSRDXnfyYPfjkeCwxqRLQypDiFJAuHyD" dataUsingEncoding:NSUTF8StringEncoding];
	return SHtIPEsqyimTwR;
}

- (nonnull NSArray *)HkjnLYHJwret :(nonnull NSArray *)njbgauGJSSLEMZjpGJx :(nonnull NSString *)qcqpDuidoIRLLm :(nonnull NSArray *)EBBEhNErOePahZb {
	NSArray *DKtWvWCJRAuzZcWIaSM = @[
		@"QWBkOrBMXZNJfgkDNmjPZolNWUXqAJzQeOPTLOEBGaDDefCeMgjSWZFNgTKSMltSLtbywjUTwbafPZZGVUODLEIcJXdxXpSUPZxhXaWmNAwEgcgyDwLcVahuD",
		@"NFWLdEeEhIWTRHKqpQZGTFKPCJmucdiThsFowZXvibvfCKeqeylGFWRKGRwRZvHisWNdXMVmghzfRqujWwyteXxvQGSAxkWyXRjYxRjgnHjmzscYpRqgVRPNeDCVCAXXyEVThBF",
		@"aMpGdfLDDixOJzWZcEpmlaOdfUgmaDgPAbUJiddJrPupGgvYuOFSJVuMqacsdrFbARlLJrDxiyWbzKfMCpVARpGHHZSJRRTmNyjAGeEmZaouKHxeCBYfPzyKRtSAXtuhpaOYLBfh",
		@"BGmGihoLCMSbgHOSExlxKNiIBdbqjiCjHlfJKXxyFySUJJQqBDTAwXBBSSzxfWFFxVKxbORvjEQszAIZvzwksUFcftnYiueXeeZiYpQTtmxWOFMhkJZAokUCEhmLPbJKZ",
		@"XGEZjxZXqQtbYDHCJVtwTaIcRPwkwFcprmhAfKCdrrtkBLwACpHoRCBAGdHBqamVjanQxLgtIKbVPKtADcdoSfqLNuiuxhtSpUCRjVzoFlJEiPqIEQDaIcWvAsaHrINvZqjxbewnzql",
		@"XrEfdUAcIHCgnszTiwxnLnbpXtuiwQKGKtdlDwBXilSDULsObiDHtcCupuzISrdFelrNghprLQYqEXFBzLeeddRQSruxspXaCVLEWNJ",
		@"tkTiXHLsbMyqyOwnWacikCULiCuTDkqbwmZQcRUQytNMLvVPcGHwpTdYWaeEYrjSDuSWrYeQXFJtJZysKpgCIeKAAygsrtlzHstqIIAgMdcngzyvrHEbodJxsSvgUYWaVhANFbpTxrNbFqLEZKg",
		@"UAIUUkPdDOJVjmOElMDYpzDlEQDoHQPVaQwggYjCQDvSISyFZKnDyOrQUufdUSqSpYlhuNvtsCxCjyJbgvoLAFYVhzqFiJNIDalaFDztIYTJARcekbAwvKqasoQfLLDmvUqNXR",
		@"RSPnNZEJfgvFBKklPWBYRaIwXVOPLEeMAInkscmrWEjWwsBdcmCKmdHbHsQkGtGbTzNPmOjnFDEAUFAytzNSwiZRzKILNCqcmgzymQIqZFMBhULAAoRnsPFdyOBqlGv",
		@"WUJkvDofttKKkLXHdnbcAmEyyGBiaGrrmaZsrJysZooemdWIaidWgcVtmjhrICoAyWsXIVhgBhCxTOdpVmjZjBwskUJemJKrDGMlryZbImRJtzPn",
		@"tlhVIDLVYoIkYlEGBCcyACTCtrZNaSBBYEYARQiepIHzYahnSbJZRcQBVjOzJiFPvpmFMjPIpuOTsBpfaDAhlKPfOkasGqNBKZKZeQlpeMPtlkhBECaCcxTMfjNkSkahO",
		@"gHRDjBqQnfMCVwPVCZmmYphIGqxycviuGjebroFOPFlEccFrhHYzufgmEDFrNsoYrvOTGsgFSXqmdDwRvIoOatpAkWJmFkLlWpDQzLqlhCGqXseatVysHeOapfEmKLNiPcnxlPoSRVw",
		@"MZzGYQdcbaoJyUNmiejsjidtfksSWNzQGxyaBZTgskuSrdrJKBGUcZKOfXunPFAVYTyxhgoElHdWhvXBFxdVehDqKYrTstgFMdOUKYml",
		@"XrDCfXPvKgslWPyAAWwTEganKIwAkbrofIMRrHEYAKMIOAvvYYbUeSDsmBikDGLCReIEVArunBplDpfaxQzKtasWDlTuidWexNGMu",
		@"eVaHugpAqUSPIvFAVAStnHyyvwAMZYzjyEPYuLJaZQMqMwAsoFLiqDhEQvaFAAtNppanHoYRqbWzjXlCyNfecDgbLlhfCQSEVosTYJvLpPbXHuYFaISKgWfFaqVEvHXxqxULv",
	];
	return DKtWvWCJRAuzZcWIaSM;
}

- (nonnull NSDictionary *)yAedPlWCSEcJPuT :(nonnull NSString *)MqxchRJwmjyuf :(nonnull NSString *)OINCjpyIQOgktE {
	NSDictionary *OpoWRshhHgYW = @{
		@"izOkvbundd": @"LjYFmnPCqSuYYabHdPHTQUMUWkwmElMdEeyQiEPxwvucSURGSoVOfDDYwuQiVlRPzQXDFwGVYZDdvYiJYdNlWiRErvSHivakbTLFXYBvULPWtOGiHPgAMpoPGfiahNX",
		@"xOIbEKYjLfoD": @"GCLJdAjIjxSKptiFihzoucGjUlfljyMuhvVCYmgcPYGRVntdhXUsItLCcSzLHctTIxxXJYbaXMtTlCwhtbKQqVqvWElYxuAKgxskOvJDParraRbHwRaROaJTfRpFKfPGQrEWPr",
		@"csMdyrdYToE": @"YFoYrRxryyRZdeqZjREIEhELXROpebWHvsfgWAUbYnwdonWfyCkZurbKoHiMerxfjEkhgiFbThaCqmvipzwdPmLrAYiQWFernqXABWUuzHipnmCRPIaLcWMYgxEaCJ",
		@"CbZPzuqDVsbJEsVJ": @"OWBlPlFbtPiuAekuIVTLRTBNDlxFQaxUDDxUlqmLfIMqtRKsEhYqBxIwmWEvPZwEsVnJPGbUnqxRijuOqobNeaoeTZUnqaxuorrthYXxQrGeVliWNgo",
		@"LiegtNQMFEYzqnQ": @"DjPQRgeCzKDDkWWvaNqWCqgKrKWjppVVFijBdtcedzMwROawbppNvCMCqBxdmpFwSaulYGFhPjXTlaomGrwXkalPeUMSmHkQfNtURhTLonpdTvnNUpPdafWhHcOEqFbizH",
		@"bkBKLQdBGPIVFsfx": @"bCOZRbXPXvnUBdaMiuKXmNrHpGoLNTgalHhlGoEBcroYmzwmPwLKDTVYOrWVrDWMgOcxFYkXTNVClPanxFnNsXZEWRhjitRIbOHxEryeFztnXx",
		@"cessYHaUfIMCtoMSR": @"wUgwCSMoiBMlbvqxiaCMQWgCWVxVEqidmgbByDMvjwFKTQEuErIJjnuqLPMXrrOaNQJcRdhBtrNXYiPPovsbSuvTcOIfrxfQBHpuckdRPaJVFMYEEX",
		@"qLuFCSEffNM": @"vGMTSorjUSVTYHWBjKZuFCHHKWaiHnDJVamLFprTbxzbjmBWDIgrWuoKpRHStgZYywSCrCatkzbGFcYoqneiZUFplegURpuPiCNetPZjSXcfxN",
		@"diVZcKjteM": @"tamYYscYuFKaxkXzrnfiTgiYrTvCkbTrUQasMrpQEykIFtzMcanobsyBFCJQvmtJmtKLqiSjpLmazDRUqzywdfFyvzuyoLDbOpRQZCjBhhySgCasLBzgOvdNOoEgQmxFeBlBluGCmnd",
		@"wCmPbYxUMuaQJ": @"GRzicELUYdILHauYDTeqJWbuHgDtnKTLlrafrWAvalSHyzyxcrpsFUCKwwGBmqFtQYEurnndRAAJRXJMFuyMKwqztMmyDDjKmxxteRUojOfLJjojBXLWBgHrAwiuDJFJLJssFc",
		@"QziLsXAptOG": @"tvajabTOJgcbHQMDhTtfaIDdGNgwPEPXiSSQlbvOuHewDcWQOesgDRNcunvsXpSfuSYhFOLLMpkkDyfjpncUhsFVdIqzRvANHWJIdeZeYT",
		@"qvbPuFovmbL": @"XPqVPOYgDxhwJXWVoqHHvecDrIPDFbmYSBEeqeoykaOGNjrlDLxncWVPSzLGqrJnnwGrQFeoQhFZahPNrTQHJKEcLvSQEJAnoQfIZNHanqhRXDfrtmxfrXeXd",
		@"iBNPwQPYzHpG": @"NbPAZomYRxwRnTPJDOPtWjYOGqhcpuYjvBsMMJiiTOwDHVvyxBetWOXEPieSXFZhKmgwLEWzGtRScWCcAcuNNLOpsbcDNEpPklHLmjXsROaDC",
		@"iKGHRZkAWp": @"kIjQlHyyjOmwaQPgjkvjlpJBMncVFSFhzEAOXhuigWqeNZYytaemZNWWrwURFEkghcUTTMqLajHumOjtSTKPcUZCoRzglAoMAqcUxVTyKU",
		@"obcQTQArYeA": @"FVszUqSsKfjtdzjcvDvvzPrhQmSwbWfkOTJsdGaqMlzDXdKtbjdTxcjofXLChtVuRVoaReXHpJaWqGUksILdBBDmdlUuKaKiDQcZZZsxheWmAzyacwUhHLEdCpOhJEHNQnxAZ",
		@"jcudIaehZxpcI": @"lKZtTpXEgHkhgIgnWSPRbQDdfMgZXbHRkpYJXmUwXkBkOPNrLEDhRHpmTlaIMJFhMzpqBDsiesSSySJKKMjuxKJvABObhqoccLqwdwrNLCUfEAbLyTjTQFIFPHZqcpeJzRJTiJh",
	};
	return OpoWRshhHgYW;
}

- (nonnull UIImage *)ApOuFyJVnBKaBFvUajW :(nonnull NSString *)dhLViLJkTPGBXxEMzun :(nonnull NSString *)dUkGYvEeXSHs {
	NSData *OyixvfOvQtJTOl = [@"aIwZRaYdMPAywTdVsgyQjrperxcyqbcxVpxuSGeiWWlnYqJiPvYplqMnBaNUlcbKcvEPqfORKiBRyVikEMMZfezJNOYVyNvFBKiAMFEDDyYNWNDYYEJoLXchbvHrABabbRu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wqAnemopOVCmhR = [UIImage imageWithData:OyixvfOvQtJTOl];
	wqAnemopOVCmhR = [UIImage imageNamed:@"ziPicTmXKslWEZlQBaguvgtNyPMhUWTkKwCVOebImwrdMFUKSFqdZacOwlCiNcIuutamWTZqNRGAZPvWHaxwoBPgRVKaDrIBfjycdydsasopRlhrUhhGRnoxzQZsnbdseXMsdotUxKRydQolIxL"];
	return wqAnemopOVCmhR;
}

+ (nonnull NSData *)bHorLQImkd :(nonnull NSDictionary *)JNAtirrcIzBbHd :(nonnull NSString *)unioCbevrPYt :(nonnull NSDictionary *)EadGkFfXpJHuzVqvSZT {
	NSData *IHmChljmzkhFrDarhx = [@"PIAxMEXOjjCorMjGKqILDAOUFKtkLerjZTRQDopkeThUTOVKtBLBFOASuMhqlkSZNjEDSCsVBEbyERyhdczpjlvyhcoQfUskZrhgchMralstDcyybxjZNBqBqnCjKlXSGRYKBDLGDsadYEe" dataUsingEncoding:NSUTF8StringEncoding];
	return IHmChljmzkhFrDarhx;
}

- (nonnull NSString *)eKJIuSbceKL :(nonnull NSData *)kNXFyqNyLCzins :(nonnull UIImage *)KooEdvRWmBYvdrkejVL {
	NSString *SxCXnRccEowkREPx = @"aRcqLJlYTzGJCwLoOCyyTONlWNSPcgnAlReMAexrGWxPCfwfjvgkvJqQMqWToDBzcTgRiVyfzLEGSLTavmdVrLcgqhhiCZcNjPSBHPeOqNErIRpNGHaTvNT";
	return SxCXnRccEowkREPx;
}

+ (nonnull UIImage *)SklfOkhjPLPCf :(nonnull NSArray *)VsjtWgLows :(nonnull NSDictionary *)RaVwFECByIyM {
	NSData *IwGPReSRJCQVQWka = [@"KGJvCgDUKadmvGEBnWkNdOUQoadkEYXxPerhEHYkQvDvRNHFcRLLSrIjrDJHvlzhursLvICNJSZpKXasyyStoXogbuIFInkiAccOVEvOqzdTHBjVEFhXXDgDPJJoTheajNEYTMNvFfnkLqlaXOZa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GqYwZWtXRPAiAYhAj = [UIImage imageWithData:IwGPReSRJCQVQWka];
	GqYwZWtXRPAiAYhAj = [UIImage imageNamed:@"oWIarefXMRvybBlZqcDJmfALbRhCvLzhuKBHCuRyhpRMveyHnnGowLaIAYdZpRrgWIRerCOrvGIVdFpIEphtDZHMTDssDdFgKzmmSSZULnfwkDXXmTRjoFeJxpKpcXtXZJUJAslzoP"];
	return GqYwZWtXRPAiAYhAj;
}

- (nonnull UIImage *)mIzoxcnZIbMntxm :(nonnull NSString *)rMUvSmJLIAe :(nonnull NSDictionary *)TulRsXFUOcqgKovvsc {
	NSData *gVImeKxtHc = [@"lwvjxYYKeuHsZzVqhBOpJZexEgUQpCsAKwITKViWVdnzAIQeTboLSqRyYWobsjunclOFmqnLYTpVWQDMzclrcyqEZwiqwiviDLtHVWYBxPgNIjXDWhJdYiPxmwcEaQiaevXiFJEMl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BwwvdatEMemSfASMQA = [UIImage imageWithData:gVImeKxtHc];
	BwwvdatEMemSfASMQA = [UIImage imageNamed:@"sHsbgzasrUbbiaogclNqKLHKkHLVSNQpNcBnOqjXxjNQmgIKOXQQbSwvILSIWqpnLsvqcgOGLTcjfrqYCkWVjnhFbXGrYPKqQeymWJkmWcRxpQgnyESWdJYMsF"];
	return BwwvdatEMemSfASMQA;
}

- (nonnull UIImage *)xQdRfjvXlUdcs :(nonnull NSString *)dwUDXdPHsOVD :(nonnull NSDictionary *)PzVXkMzSFKsIrHSMQ {
	NSData *wZjqsFXBDGP = [@"SrxoCDnYXJoyIGcFIPwJZTZlfOfDVUbyofhQJYXjrBRMCsHHSjaYBGOvwJUISvCHxoydFrTZAPaWuEUxzamAxoYiEpEfmJljiJpVrJNQJSYMqHosPozSjcle" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YccFqaCVByW = [UIImage imageWithData:wZjqsFXBDGP];
	YccFqaCVByW = [UIImage imageNamed:@"DuxVnrXalIPUXohJSjNkPKmZpAWlpsnkkDFOrNMFhpKqEvwMWbbxuIWiKeTHaDejhjVzfYPLMBbdSFjrSQeweMvWWqHfXfDXDXWURWnKjdnceaHMkAODhROocukYFvdX"];
	return YccFqaCVByW;
}

- (nonnull UIImage *)AmtLzChQWm :(nonnull UIImage *)naanKVyEcECwVbqfjuc :(nonnull NSData *)ZLkXqXrpeCRYkFX {
	NSData *eIPgvHyggUjElOyv = [@"JZpFuLbgFeQWYAlZOUzyJFULEkCxZgnWXuJfRxgkQgtvIyiasxBzKNWzFaaiTwHBHvTnQvwSdqbHRBOgCvtZFUxqxTdEClnuUmrkoKzsrdjpXRXWTYbuwlb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JoivTHLcGJdJMKy = [UIImage imageWithData:eIPgvHyggUjElOyv];
	JoivTHLcGJdJMKy = [UIImage imageNamed:@"EFUJlDlaMmDkSjRGHEzWaLpNfckmVftUtSAtGjzTKliXkchJLPtVWNLdvtYqMwUZbvZedZGuUCibDGkRwsuAcfqDfmlhLbTIOjhRAJJNbOEfjXYyiJwUiZhitUmABKyRU"];
	return JoivTHLcGJdJMKy;
}

+ (nonnull UIImage *)mQAwzGIXsNaFdqHe :(nonnull NSData *)myxOrUKJkfOojHpK {
	NSData *ihiWQkEiBnoXHj = [@"JxSsYDxsGpyltLpRwJUfsaoDCVfNPKQVRxDuqxtagiDjTCISpzmzYxcQbGufqhvwNrdQxzPwqqbhqBlFrZoULDqEZshpDZlAhUByVLTUYzUdCHuBFBSAPJHqpdJfVExF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nsywmknESpzgSVMwGZx = [UIImage imageWithData:ihiWQkEiBnoXHj];
	nsywmknESpzgSVMwGZx = [UIImage imageNamed:@"VGCftSetoVgkvynlpUlWATXuwInWmDvkKORYovokskEtzOxLNthgatcETLNjuYJaYcrCeVgOqTrQFNEnssRZyurqQvqlXmnBGXcTiKJYRxsaMphgMQzFuZRkLyUBFjrYdTWnckSdm"];
	return nsywmknESpzgSVMwGZx;
}

- (nonnull NSData *)cslpTDClDnymXV :(nonnull NSString *)claWidRkhgA :(nonnull NSArray *)qphLrcvItcRJYrg :(nonnull NSString *)xWOnLwTjAPNTkZXuHGW {
	NSData *bYXVXVgYOlbViAjCFU = [@"TVXaxxGWxalcAIwpKgWiTfupGXxzlQtOJbnBXfROdTFwHrJEaTkPSLSvxbQlBFwzTbeCMlNJKTPebJZKvlIXFpxNgnaAxFXIEJWlbqgFOgWUpsEaoQ" dataUsingEncoding:NSUTF8StringEncoding];
	return bYXVXVgYOlbViAjCFU;
}

- (nonnull NSString *)DokCKKECmuqPlxQD :(nonnull NSData *)vZTkxycXEKkvTV :(nonnull UIImage *)pbNToYLcqCHWcHD :(nonnull NSData *)XrLTmRFcXQiDArmN {
	NSString *zKWRekuHdkEic = @"TlqhqQDCRXgPDWjWqbiICBrUGHWMcTkdvYfapTEQxVFQKglJSFvbkGWuUtOZNSXDoGYbscFYhuXyCuCOMrFpcwgPLmLpeuzApKLAFLxmUwanlQKhCuVBFmTKvsIPezoJAWSJHv";
	return zKWRekuHdkEic;
}

+ (nonnull NSData *)UjLKfpfiknPEnBhL :(nonnull UIImage *)hdOfiISjVjUXxbb :(nonnull UIImage *)ZSZtFUOCrIBI {
	NSData *frXIZullMxTI = [@"KnTxMSQVQUNtDiasxikXwZWnEpjJKhqKYFzSdCnPpIgBMYVOgQIDiTxEfyYTtQZeAKypcxVduNyenTWdicoIivnZrhRbTDXPIzUlEQgDKmlrUkbyqhbdpXPvitmsHxxFanhtbGRxBcf" dataUsingEncoding:NSUTF8StringEncoding];
	return frXIZullMxTI;
}

+ (nonnull NSData *)xwxeoBZLTA :(nonnull NSData *)uoSNBDTUtSmTCB :(nonnull UIImage *)YAUmLtJSdAapVyV {
	NSData *wjcgBpUVxmUtYpdkiYm = [@"lvOwwuNGooqAZGZImzjLZuNmwhqImoNcYQGUuJMkPnZYpkauvYFmgTTvIOlVdwNSzmtEHZaQVidaMencXVzjoHrWlFrkIWPtDxzLSBTLkWubiWbZqIJyqumZvUrb" dataUsingEncoding:NSUTF8StringEncoding];
	return wjcgBpUVxmUtYpdkiYm;
}

- (nonnull UIImage *)xVwPIrDMnJqlJwOtxih :(nonnull NSDictionary *)wKACVUQwQIcwjDjWZyN :(nonnull NSString *)CEARVIZXWrkUyOp {
	NSData *gqdDdufrMJ = [@"LLaVRoAOztBisAAjFoHJHsBwlSUnDxHtIpIoVGJCMvDOScLbBTCzVRACGEdFIpETKTbVFZEPawrlnwHfWhJvDECiTdosSATlUmIikXvkzfyyhXNhWNhBhMjIqpdVQbWKFSekshYnxK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GqOApxscei = [UIImage imageWithData:gqdDdufrMJ];
	GqOApxscei = [UIImage imageNamed:@"AgMChdQEQacCRThhTqNYWrLTAfwiEWxVpghwCRPLtMhpkZQCsAEyoZZnxOnRffQLBuBzQwgmBllJrOeCCwEDZdVouWDRVvIxkignecVJJNOJyZtvSsy"];
	return GqOApxscei;
}

+ (nonnull UIImage *)TtbNxYirSMEGm :(nonnull NSDictionary *)dlZLqEOYDCYdC :(nonnull NSData *)QXgrnHqJEcqxCP {
	NSData *cgYfynjobvFh = [@"GPcJrsQXxhtBiolpGvDlJPShKMJeHUSWQLNsUXfRPGQGcJhHZFPaRpByuEEgICBhnFMhHhRtJtitKNXCIKcQzRTJOEwWAjWktIBTHvTuwvWOF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dOOVicWMQtEsHC = [UIImage imageWithData:cgYfynjobvFh];
	dOOVicWMQtEsHC = [UIImage imageNamed:@"KihsxfVPrRnzxgfXCRJMyCaDxxQcAWrTeTvaiFXufSDLhKUQNgTYfxPspEPSScwKcgSfitvbAlXvsPVgYGVutkyGNZOjCbIkljyyQfMcVHWRzjNNqlSkLIIYKVqLlPIIxwt"];
	return dOOVicWMQtEsHC;
}

+ (nonnull UIImage *)AekKNbzzEUopa :(nonnull NSData *)PsvNCsJAHJO {
	NSData *PAtqljAYsRwfgL = [@"quqiwapJexKzVctYTPtPDkQWEwUvIaLCcjTnoJKXssyeUlwRlHHMVFZTTwTwKiZbAmQXOjLFfKhjjRaRIIwjLQJEpboPFtsbykEfSZB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PsREAGNbDJ = [UIImage imageWithData:PAtqljAYsRwfgL];
	PsREAGNbDJ = [UIImage imageNamed:@"xpbzIXoHoATHOpuALdBlsgVnhIysgzPtBBDQVtGeMPqZNgQIdObpfNtRQUtFsVuiAZGgtQgKepkahDdpligSPBHJjtTJNulEgYJYxOFJdrxZbJfzYPcRnQdHAxrxuQNxSqyrorogOWeO"];
	return PsREAGNbDJ;
}

+ (nonnull NSData *)LCrxktLnjZq :(nonnull NSDictionary *)tCDYhTkeTGyvzvycw :(nonnull NSString *)MhSqWXeNALijD :(nonnull NSArray *)wXyFwrYEPwFTMNg {
	NSData *BXBRRUtJLhd = [@"dLQwRWIzjxZlRdplhIaTiFHNcdEbgxaOzTITonRkZhxnBXulaCeuklULaqtevsrVksSrLeqrvqosqPoARhRWLFabejePQlQaclEkSGZoRjGvAsZjXJUkKbri" dataUsingEncoding:NSUTF8StringEncoding];
	return BXBRRUtJLhd;
}

+ (nonnull NSString *)gHvuCJFCStcmw :(nonnull UIImage *)WXpfeqkbAg :(nonnull NSArray *)eooFpxqJKXmMksBBSHf :(nonnull NSData *)xKBNupxCZN {
	NSString *hUipCDymEgaXZeqc = @"OTrtRAsdOOfuxWgSdZwNUgHacdTWAxSVemnqHzhyEbdHXrMqeTdbcKLBqEMuJhwHQGJILhTfYLANwhJboMBnghebzJOIdnolyAMwKxNzzWdBMmUzdFrHBQRdccVeid";
	return hUipCDymEgaXZeqc;
}

+ (nonnull NSDictionary *)WJHBclEjQXoZuvN :(nonnull NSString *)GpYxezrlTDJzVNfD :(nonnull NSDictionary *)WGhbtzCKyVWKawGsm {
	NSDictionary *EcZPahTHOGpSNJpK = @{
		@"CbiQlxFXWQcm": @"zPePyzPzVooVsDxUglJNuODuxtubufxoSfiRryoaFAHOLSthkTlnVajRCbsfaRiSCIZDwVxfqxHEtanMFpmgLiNFtPgrNcTBubiDWnDpQyTYmeEaxKlXF",
		@"KSAaDGpzAMmKyNymVOy": @"nfeWcnXKwsfGKsbFkxMOBtxrQPxEQAPUIywRHKNlXCcKIiyqQGoLiqCvsEaTtIHVuqlMBImfRHpyxlImMRBAGJEpVDTRapjURVgjUEaEppvKPSOldNN",
		@"cKUZSISsugwaPNQY": @"nAaNXiSBKDLrXEwdmabdZQRiWccwQHlOdZxtsEtAheuPYZiebrReddFQBiLNyouThENadcqUjJmIHXBnWELGTJbQeXmXjOTORkpeQZGcrhWcTCHXUbcCbQObLvjv",
		@"IKSyyXZDkIadOIkR": @"awRpFGZHlPDqXkVUzEnzHWdoLHKYMIABAZImrHdsKVyBKePValKwmeZSfzCYKWziBfPxgoRIkqgHsgdKCqnjSHqTZRLDAPYLGZSSJFhXdB",
		@"GkMVybQrdCH": @"OIanlhewWheJMmiFMuDxwezTMgVYlfzzdfJznnIUMpcTAgjzmkJFvaBuIezlRqbETHtSyXtBlvHDbiopfgdxuhrRyjwuemScOdDeSzJOUBMXqgoMpbp",
		@"wKopyURcUm": @"LORUfQWnYEFbyVSVLzTsyoLtxrglJBbhNCSIPbWgvJKGrjRyqcPNOSeqGrVEFOwWLxRAjbksLbFgTFJtPiObprpmrUsLwaaRXMQuIlTWmhevd",
		@"lQmzfAIdurWtUzHuiX": @"sgCFIobXasndmUiVoJCQSrxTCYcfIguzgNofmUiXRKdukVraceBsXYabCOKyytfMKzpBpsIFOFYnfiBxsAAHwoFcVIJUYQAPwVIndyqYLFOoavwIFxkktTsz",
		@"HTlDGsXzuxIlPrwBJtO": @"HdNNuUIXcBVTHrCYXBPQTbjYqQodzTzcMfAdtJSEtACmlrRrxYXyVkmzwZusJcKYYwqaGNHpiqOZtThMDzskLWGTfIXMzKtkABsQZZWAxTSHAMjEObkQZaUB",
		@"upHowDDxpwKkEsmJ": @"qEornfRHXbYuTXBtIlBNyayolDMHaBXeqjfZBqlHHfWXkkwLFTrGAHruUvLMoAvksREVtbgtUNIdFOpNuVguuDcUVRJKsFYmGrkdnVZfysfxZVQbmwbkB",
		@"SSyuBLfSYtaAMTr": @"AHtvEraSEPJcrhLmKPVrCtzzngOdkPLgHpwAMssblDYAUGsBcouzykfwDlJXQnWWPaFEuclaiaIRqKBiyhklswxWjdpImGhqXXKqyZQDLsuybtYADrTeZaWsRCHRYvbIsuBQtCxSUwzarbZDQgA",
		@"lGluoJLDbltCiwfKrl": @"EQyonNHhTdAEnLXphetrvqUPLUvCVTrYNGeENAJJHykYCigsrCdxPKByjMxKkKKRImJGipGhbGQKTDwViImKxhgQBPzujOKUiiIzBwjdLTthqiArkkzKtnWcQOvLnlMdQcDjlGjHMDQDvyMvOL",
		@"MefaeUUuOItQiBQC": @"gDvAuxwkQCnMdjOOCIlZXuUYKsBguwmBuYZjbMeNCQJogWkJMDHGIaFMnBbRTbxjZFexuRLjihxIJyvATLwizxloQweQdEjaZalamJYptCHXx",
		@"owhDQjjkDDDTbT": @"tmyOSlmjkgGnJiJlftBeALVEtJhirMIthWKbWsuXtwtoSKkbwXDCnrYvYdVfkxFTkBpieFHryzvOImBWVOMbbjchTqzDBSYIsuOYCaiIiRalOntlnFRGzKhiBmKgZLQsBjeWdugrKUoDrKZDkqdp",
		@"ZtEklCIdgQsPrsK": @"uuOcEomniSPJqCaIqMOgveHbaTVVwPVpWVGIKvcdePNwWalWuHqlVEpWldIzkgkiBGilVMkJgSVMfElRWGfnCDkYJvEptkydKAWgk",
		@"CpdXGYrLpC": @"QUUMqhsQzmsUuQDeViOrrOXtuGLxQpGSnuQsZxMcdkKyKMWkzGYwtnpWoaXRHYhzqXAYYeBuZHgmJaRTZZDvwbYuHckjPQSZAPSsjMIYwkhoMYGYacyrwfXNCBJuOZg",
		@"pwipKxKllBRrvIKvCti": @"oFaRJUAWWEXnXCjVjnzlAgtPuobHVhFqVFwBbrbSJLmrKejMrWfBKXiKCpQSuckEvWgPeRTuPqxOzZoIfqDygMsKVSJhVSsGrYkngMLBo",
		@"sLtOXqNlfmpOV": @"XTuqiJduIlVDJlJMXnrrZxGqdWSwipAKuoECvIJAWgJAJhgbiclkhHOooNLkLOgqivkfszOikuIzcYMOMhnqramaLXDbsuRbenHoktFqgh",
		@"EKMOsJPAyYiXlQgU": @"rXGZcwDPKOrdccYJXvwfGXcHfjiYMrwlOrqsVxjhUuvYKPLPKuCLFXyLsCYnHyXRQnFGqgDFoDuFRFkkJanSOIZdePcMACCJQCeWpVXrefnuTflUGVYIf",
		@"YQZPMSDyxRsqFrW": @"zynlNpTfrGeCpzzRxQsyfOBJfhifOWDGolavGZsIhgRVTexlBlVfdzLLgQESyoqGCoWDCksCfGTbxaXaPJSqlagrZYLndpSFerRJFBNsTzCkXZ",
	};
	return EcZPahTHOGpSNJpK;
}

+ (nonnull UIImage *)BbefJvpizVMmrQiX :(nonnull NSDictionary *)wuGEndqPPMw {
	NSData *NiIdjWLLWFoTqGZ = [@"QTYgXRvACLduICyEEbcZqMgovwYryWaxEzaRgYmAMHvyuLcIjPooJQLtVbJakpKEOWkHGurAAYuDEYooJhCYlGPryfSIAUUCnTNthqRByhISFuNmuQWSMNWcOXRNU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hEuZFTfPIAWatLQn = [UIImage imageWithData:NiIdjWLLWFoTqGZ];
	hEuZFTfPIAWatLQn = [UIImage imageNamed:@"mpYHxxpiSSNVnZoOgnVUnoXExgjdIImgfPDrriRDGzOGUaBMMKrJwgLorMguzoUGvrURZSIiFvpdGzfRQideCRDtSVPajmJdJSGrNqyupKzcPTH"];
	return hEuZFTfPIAWatLQn;
}

- (nonnull NSArray *)vsdSSrKkti :(nonnull NSDictionary *)dslgbkesVBmP {
	NSArray *mxLvIofvASqbtdlQkop = @[
		@"DCwbSMAGAZQQkuEzTFrEuconFwGhnWyCShsXOqcGaMLQIutAlDwbRbvDAZaBHWiDdfbmdgnVpiIgDIhUOMqPXKGNGRJaxcxmwdGApGGWWKWKjtrsAwckdsHvsEhlAsPHxGSPRG",
		@"srebSuLvFyhWacxMKnBtTELZAfzqcJSydUWYfMaqiEjSJUQOjzsEKAANIFCgKNbthZpacTQsbxgukwwvPxdFPJPSSchAJggsPLRadVMaeHJpfKFKMJMEbyaXZDYIuKHKncuhFUUeWQUusdYDb",
		@"xQVFPRWtkgTcyXmbVKPnLiDcwIBRujmvwfaYxaapkUYLuLkxMjXLEPNcDhDXlRZDhqnsfZYPluDRDNAIPQjLFnMTnONEDHHPVSbgNJKVaEZGq",
		@"xWCPYtCrkiLAVerhNfKUrsewvKobPiwoMMNMwYUnDANyUKxEMrASQSFjUwHzEzOksPXlgOyATtwbsBuybXjsCJJuySOpwesQkAMDAEtADuPqwfJFBEerYobcDyzdVTLlfSNSQB",
		@"lRMmxjivlXtCDvgWGSwNWbZZmrewkUtxYSeZZoSubfazrZmeEJEgkaxHYNzkEZyRDytPFPuTzuJEtXsqoATsVJovXzMDUUqxnoCTvFqyWGIOfsX",
		@"hScQvbuLQAfcIoPtRLYcoMBYIgwArGKWydgrIihFvoKnBeQHqisDuuVoGmZcsXQwIxgbKzSicBwPPXPdbCyeCrZFhVvQIAAZznhPhDBjMhhxpJJqsqHBfjzWtAYR",
		@"CyFcucrvcdcUHWoqDExpJcehWtPDGrAFmksnKqoNARkJVkmurBrGmKdZjFWUnYGNCckqgrSNVVUodxaUJbaFOqToTemCCLWFuqgaVlmFFWAwHfsO",
		@"atiPypuyeDUbAEeGuyZjmpcwdaVgGLQSrtMfrdnTZMGikNfSMPxAlHLgiRAFSpLmVStNksEzmrlfWxdQYHiJgnWjKkqcaYDQSoyPNwWRChjPvHITurtTKLxM",
		@"OLOylLNppaeelxRcKuAZCFcpKOnqvBDAhbVAOOWJUEEYbGUMzDoaFKCWrJMXaaFLBUbovYqQgzMETbScdnLXzxCOVeshnAFFckkQQYOcogzsVdBNeScjQXPsRNOjSBmxVt",
		@"JKAIwlXPUupHIJUKSbiAfWDiWehyYdRMHPUQhBzPWAtSCgSjtSAJIMAWZWPBPXgereytsNIIUCWJBMZZyNnHkgUZRmpkVDrZRZKecreUsPHhrrQzhUElIchsqHMGi",
		@"iXYNfXIPjcSlmeTUslcwnZwUKMSVNHHyEkbXEMcAAFrDXQvzuApIxUFxSePBvaJzMqdiioNeYnHRPPQkkajpLtmWcGtlTteLdzHiAwhNQNOkhalFtRoDQRedaivdDCswexNNoSucunCgovqiua",
		@"KOiqVZCmoTFUZvTkKbxpQrarIYCoGEjjPhlohucFFtcMWqTkgRnZcDRpediPQcjuTWdAgvahZMSTwpfXfhEYSxenvMDBOlUTLYEOgWFoDQokQfvxWblcgELTnmjJpfGvBciPcSJLERkJQbqSO",
		@"kfyfCBziTKWqJHREohFHWtNUVEfXURTsWkDFywIHwEEDOHFvQRPaRUYmFAylaMKepTgFsbyjpCWJZeGjqsFQIiFydnmBXuUncBZXylquICgFQFYuUmwQkRWfkSlZEDShbugIPTRzIzthexKMzdK",
	];
	return mxLvIofvASqbtdlQkop;
}

- (nonnull NSString *)xhhMEuZuBOunz :(nonnull NSData *)nWwJQlhPreRO :(nonnull NSString *)cCvozEfuHvpN {
	NSString *YkGiQfivUoZAOp = @"YjQBknJBVqsOqyXfeVKoYzcHoKzVMMDWhKjMNOosOKQeItWrMrsmavlOPpUVBRqeWWuSfrOdhYYhmGeEXxXdOxSBVRxEhfkxTalV";
	return YkGiQfivUoZAOp;
}

- (nonnull NSArray *)BdsbVFphTjZTvPp :(nonnull NSDictionary *)SYfNxjlHgOwGZ :(nonnull NSArray *)FvMFoLOyjBQMZZ {
	NSArray *vBGfBDIXWXtZQzso = @[
		@"SLdZIoQqrVHHYrAXseeDaNUilIwaYOYRpKLHuFKwvwmbvIxKLoVmaFhwOekBJUNDBPTYNPmgyMVbAPWIeyDLbDQkSFttUabHFhEj",
		@"BsKvaHOWEIUqBwIviGknXFfHXcYAbXNnfKJowqtWAqvZwGOhHNmfJFQZvyhHOFphWIhVbreUxfTCQlZznQtVvuwgBgQwTJGExtdRhbORhbqOQmMSazvtUKccDRvDZBzsqyPfDGQmltX",
		@"VWSUbmDocKYLjiZPwjDXKPsKwCYWBLgwBdcITDXaCVLihCVnJTVqejTCkMnzzDstGjBKykActUCvOCAXYhmyWPMaulqEVSDDtYnbofvUGVJhPaIHScfQCFjQzMwvPGUcDcXo",
		@"wWtIhdktwqDeKYYEorJAvrfwhufnNyJkuReONvifRsSbnLuXcCoWTGnSzibjoZDKefTIfnYJXUoileDnpanfIGRPzOfUTQWDkimPKiabRfOGE",
		@"hrnbBaGfwnUDFHlYMupkYHBGTFMhHGQMFWrOUdNdYrMOpONkoOcGceRIDkjZvGNgrCftjIGYzWahyJBHusbtGmpqotzzcnwAFMCabOmi",
		@"ecBpguuoPRpSwyDHttQPRVRQNEoxwcREOElUHbsSrfGIytEOQchpivxBRADeSaMbpkpttTlzVSTlgTjxqmywECuekrrpsjDKJMXTyYDehbZkgPOy",
		@"ftpOnJoyxTNbyLZVJggQiwHQVIKqlcDiTSvFRkOfRvhqqgcGzTrSpzJqSGLLHgCWVzrWVSmJQxEAYxpLytOcxcdKXcoIfDfDaDbrOsX",
		@"fzPlULfRsEIhChNVfuGjoVOiORcJizCtJRdIajCiDNOiHodiBNroGWyMjojQcxkJqYuCLBpUdByDxIJIRDSBJgofaELfwCvHJZVUgbcxjciBDHXhf",
		@"rHehFvsCCqlsJpQJPZdhvWFcvamqfTBAbvaleQMKDMrrfJgJoYgFHbqkzZKYOjZEYhYigJXdYOvFikTNtHupawHaKRAuoMNvfvDMeTjFrJSAJIDGjOULR",
		@"YSEUOsqhMYBcMfHnzVoxitZwoAhRRoNAGHeVywvPSPFMvCYjrTPCDGjDYIIWKjoIyzoVEKnlOnIGJgqyqYugSEIDMBnNZFYYrPQRRFeNyllZAPkqZCFfVmWgpJWo",
		@"NEKJxvvQOnUVqzBQLpbxxVTkCrIsoElhAUDZfDCFlXUzEywXskpYMgDnPsfQcTpABQXEIDYVIoeQUKJpTLUdbDZuucBEdEENYTOZcculQdBeqcYxWeIKKX",
	];
	return vBGfBDIXWXtZQzso;
}

- (nonnull UIImage *)AwhPWULbzy :(nonnull NSData *)fuWRtOBgJcwMHwlJy {
	NSData *SggvOKtgDqTl = [@"zbrlgmkmEqlXctKkBSBywlLgfDOfzXOUBYNHwBuVbYHcbdlaaFBLIfmNGhHXuGkoPsJdjdZmmxgfKiCXmSDkRvVItQrjHVlGRkHyrDcMWWOjcmyrZIJK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oPsowQQnuZ = [UIImage imageWithData:SggvOKtgDqTl];
	oPsowQQnuZ = [UIImage imageNamed:@"rwOBaQHrSCYCuNRtHfSqfkrXOPDsiwTOxMGEvlGmCyZXKCMnreKhxcWcHEzfIvqNfGrpoTBPFqnGaiCxBwDApLSOymZnKCMbqfrwwBsclGeHVhRjstIbjWDUogKmuqfmFYoVTlfIcGwCIrFLhyu"];
	return oPsowQQnuZ;
}

+ (nonnull NSString *)vXmTBrwHJHDVPMg :(nonnull NSArray *)aXkrssRoKrHL :(nonnull NSString *)RnKCwPjhYQdiLt :(nonnull NSDictionary *)FuOIrLMgVz {
	NSString *itaVxbUdIGH = @"QenrKbxgFToGwkDIaBOdiHuVbtkgQUMmlguWfgQSzftNlAeTmTIPjKZNroZsaRCXfxIYJjmkAXHvjXgCyHkyqvjYTSTaawgwtIanYzVRETpytTENEqlQKVfvqEQqTRDIKeadcWXCVgIeikvpD";
	return itaVxbUdIGH;
}

+ (nonnull NSData *)cfqItGQUWxW :(nonnull NSString *)QtsiefqdMGzDnhw {
	NSData *QxINSuezffYz = [@"QBHGkmJOsJIkeTbPlvByhSsbaiCkMYQprwdpXQcaSXSbVgRapgzZreXsZfOgoZSuDpRdSlBeOBJpfbFezPHMplanJXKcLLtKTzsNdfaYwrkqidjSlUpBjNZcCknWffaXmqLARQmObFCwpt" dataUsingEncoding:NSUTF8StringEncoding];
	return QxINSuezffYz;
}

- (nonnull NSString *)RCtuDlZicJPm :(nonnull UIImage *)lkXhPbOnVvkPrbKIbz :(nonnull NSDictionary *)ULJkYGBoaSyKPVXqCcr :(nonnull UIImage *)UkFwssbeixkwI {
	NSString *RZpQUtDcNNI = @"XMoBxJvonHqpgeEmYCXueEVVQvZeKlmHtepmDWLqActxkvRInyrmkeZzzVrEvFgsYhpZKJtqEfYWzNuKrhdTDKLQAqXDRWJPTheSaMrfGvT";
	return RZpQUtDcNNI;
}

+ (nonnull NSArray *)vcQHnOSUOcCyP :(nonnull NSArray *)enuBnMKTlndiBpYRPf :(nonnull NSString *)vTtTBoKGjtUndQANlm :(nonnull NSData *)yhEjIRyscZPIqJHJTO {
	NSArray *sgyLkskOTCTpxlX = @[
		@"NYztvEtzUyANcNBhFbioSSTYoVqWwuaAGVubZSMpLcEhPeNsDFPQyfutJiMFRFfsGiRGgfDnFCXKQivVykyLeDyEJBzdDeThnUdlKaSzDARtMUyTz",
		@"CpgelOcqHAZTZDzMAbzGdHLyrUIAuBDLMljNKjvwOkWywteZXMJMECYBbMHnKXQxxtdsAbYEpsUXACHteLcBasLYRbatbboBedRkiKKdgoOvDqbGvYDYazSzgoliTxlPVaUaAYDKBTZHtxLSlvhmM",
		@"HMoGYrSMYpIQOnaZcVsRmqMiwymwBKunylsMzDfhQbbtlywtkuzwfeTVxALxDNXbyHWHixcsJYxgYLHTvpaoeYqudhVtiYFUOzwZNaA",
		@"INBfXdRdCAhcwNiNVTWXsUyRVhPYvGOLZkhtJJSYwZFXEjyPhHpILCdwqJGMsAxSjwWByMiMiKGfNwYkALZYKgMgGtvTnxQRTkHanPhAxwMdTozyxsSJNm",
		@"GRIeXegKTRmaqWYgWcBbZlJPKBeqzHOdJpdDRUldfzFiApxXFCrmZJrJkbNZGLNgTvViKCXKIknDTcKjYdQKTDevayvdXyBhoBHZzKgvltCpjsdMLdCehWBKxrdhIIrHBvSfWErEMEq",
		@"iJuLNgcfwSkCmrUPIhpRpkLxpnoHLFumzXiiCWUHOAFUZXiqISgtEevLZuSHySxaerZGynECuOGnCBTjqWyKZFHpvSzqvMyRzrlNAKpCxBjkhnKnaaFCrxzafkLmvZVIweJO",
		@"bRknXyNDtenbzxGGbikqgzuldKdfUkRbaRrdTVypARocbxBNPlLmyAiOoKKBSPvwSnxfodmTuwKpXlnsGzzfuJreIPKwSyffOTIIFyUmhGKtwNDBahTNgUbkmDETMnlAXGfUaw",
		@"gsEHLfMQSpFuOXWEGJaairVxegrrYWSISXwXWmocVESJtdWqZDpjavNfbpTxlRblhqCzNNqHuNtvgzGlgOBDaPNgbVqcxFHrfjHJcKmweLw",
		@"vJXDFPMsEGtnzzXshCVdoWdQmlaEEddrWMcFACFqhaTaqtigWbmiZiVOSKDuDLioaAGpNWIziiSYYNPvzEQtDKtoItKsmVbhICXaCACqlHmLJiwFQzvIEmqzneHwS",
		@"YdZzbSbPJpczWkskZeplQFWwOXEOgvbXbnsLcreeDCGhydHNFisORTxUkiAnlKZwACuYgamNCSIdupmKYzhTXbHYTBDKcsrmAjpscAcoZBapELpnVNHEa",
		@"BlvNSKFKeByudkTFzGmafZsmHdjweWuDodCHgSBlrRQRWnlxdErrksXJblmMrJXRQzVFRkvzytgofaeyrGmFjMgpcrasqatscLIjSizGLGTsAmRgpZJqQz",
		@"bDtjCPtvbRLttnNKAySXrUmEDmOpDjcGKzYtDuOxXFusqdsKVirhjhDGXvxfVclLCgfWagwXRhzkqpMaJLLfTnwVLxIobEyUECriIlKHBUgOSRZWzqUdgyPEm",
		@"VGcNAjvjAIgNHjxbyDSIpAvOSOxznjfQbAuDedIpImukLvLsAOwcRyecWpmrVknahVAlBmAioeLWCZNsIPGqllNsuWcKCDdOjiuFcmPTFCKjKqBPIFOCjHeBfgEPnIOatrzyuhcNzDgAcvE",
	];
	return sgyLkskOTCTpxlX;
}

- (nonnull NSData *)lXQbhJqodHXjVFGm :(nonnull UIImage *)yxgDrSURfVLxV :(nonnull NSData *)kToWrAbcsJ {
	NSData *EPyIAtJJOK = [@"ndMgQZGQsODMPBmXjPGLHWbYiSyTfxzDAcFQpIesylfzhRaQasBMojsSibbwwAIGGfcoonxsMPVRKJpzGZTKRpHvEFTnQDgCjEkTgrtaJdXUYWAirzHLNUWLpaLMbMijaWOqdJtJ" dataUsingEncoding:NSUTF8StringEncoding];
	return EPyIAtJJOK;
}

+ (nonnull NSDictionary *)IOQfinnjBDeKCrUpc :(nonnull UIImage *)pYxODywwRmERCilo :(nonnull UIImage *)XwihuChMbisMjf {
	NSDictionary *HzCzPRSYOqZ = @{
		@"irDCDnKbQLYcXHa": @"CfxDzBZFxdnDjsbbePhwMVNNXcyjjSUtTFeKaelNugeuwaoerECLRuqftgVdjpXOcqcQxhLUxbRwaxchazqQiOfJhHpWrtkhPNiCWCkQXUKGjJFHidojgadlHWjBCWLczYkdEJGDGVytmPzq",
		@"AGtbeGzIxTzKHMtzAe": @"NXiEjHeiRiFXCykIJnYMtlNujqGDrmEKWkTyRsjxlJfQbPzFKQjkMuzNekffKBuTGCmTOapgdnCzJjHXYEvGDmAvhjhOWwuvQxguXIucr",
		@"VHmmmXoXhsazgWsk": @"tZPsRrtqhAwjyNJeKnowYrAvNMWsdqIsVnUpYhLCqoyJYKUxwmBjrCVqqbHaueBWKyHSJiwIXzSTnfOzUmUgCRDjBsnxQUiDtoLAiFWBZtSIfCRlEfgEAYjmtXYxmw",
		@"DZXFlmlBpoocDHnNZ": @"rZlsjbciuajAPgmepDbmHePxaVqtJbMXnytXnITjfsUlbaYXagZzNYTpgveHupjkPdBWiMftVspEcxAZNeLJXHSVtUOZZIvciSNhRgkcCPAHsckkOFeilKXtNvJadhlkuwy",
		@"KrDkCpheDYa": @"FKVkwKeBKajEMHQIREdNlZRYVrdZXsynZFkdwSMQyUkiYXGtihsDmAlbiWAQXOuQTNAuTUEqvOnxVQpXcxswBCVmIjlcvdSuAhqZVMrUcfsaYwXQehfGxlvqFXHXYDCicZki",
		@"nfSJIWntafJuIiDCzID": @"GergPBFagzEZaJQZhcpyDvqsimclxCpkyksKBItlvJwnajldtFIelHgMEutdRKfoOSdnqaZaoaBJafotETorZSKKYRDUsJBGwCTyCMWHWBibvcKbAFHBSUGcBrGWhOzVSV",
		@"mInBiINILi": @"mlvuuJjtlgwSdaHMuovFjiMTWOTfuRuHyIWHucnsyPrMTmqKtDwMNVTIbCjjBBqwVBIMgLhdjLEZxBrHnTPlYJdeIYYpXqjlKfyZmXyOvrBxFGcTwiGLSyMPKPNZaQGUmiByIqMrZyU",
		@"QyelBrtxqKeWLWKJU": @"KEAqnWvocDsQgMgFkQXFcosFzQeEnfYpdBVQLAIlJKIPoEjsmPDPbgUTosLkkJIdmXHcurPwWbjcdEelfLmdvMtPbIcIKuJqRSkoIhYvxMgbeNsTblYnCKyQWdzuoSlJPAZhEit",
		@"qKjmzjTyPcM": @"rIVDPshZMHatBzwLyFfesAKRjvlxDguQDikejFhBnzlgNuGQPXrAvyBuSSUyqYdoqEtWwxytZWlQzqskwFkebZtKPqtCmOLfDxEaTYQALFtGwDmXyvxNKBFUCBvOZwmIErzAcSlOvXGlA",
		@"lCmUmLnZvQM": @"uMlWfLAVlPVlEMljqkKhXrBqKOYUYOYjAkfScDFYMDPijqnTttpZZExZAhFikEZHhwsMZyJlGJBEdUeXUDDcdOKRwoetziWhwgqXSaEVAydaSDqwUSpjJJKfhCzszgnuzQSoKBOURNOi",
		@"ztYRgLfxQUqhfomyvo": @"icNtRPzkgIYAdZxmsjvhreuGQIPJEiKnCaehTaeEJfgMGhikAoIdwyFlmBDKBfFuqHOCHYblRchQhluZjMQlWDVixrFkxTFuIkmQiqvDBgAWMUlLjbmJVGLEARdVTXScudiqakYVOYlnvxlq",
		@"SieENtbdmdnc": @"foiHdEkcdgtgpYVesCdGCKZDmkyAMrWqoqAOOPRHVIBsvAUlRhXCvcCVQywtpkvxVrwgUtGkTWyjZoAvGSJDXPhIlnVUrTgcbwDADPgWgyAGmsFaKDWNjJJKMcdWZ",
		@"lFOeVGUjQeLuzlSVT": @"oJWyikJNLFGJBNWrRKizlRwDZZBYsoehyXLeJPbGHcRJjQrtCeAhEXjuPMFoYDkltsbXRGjrFCLXgzAxPQmGTFxCMEZqhditgUCntQtqn",
		@"cpOlOIjWWWVqgw": @"FXhHMcDlVeGArtPCCkGlGrlAtQFwKkuWtSGTJiAmIDqRuKBJgVclSRCxFplClhnbCsyrQqPbEYEZmqwahfHoNRHdnldlUaXeNIypoCLvAJrjrkdbnJTEXqjJTOwIu",
		@"fJOJFhazxvYdpNGo": @"UKnVmqNcNNhMmZZrwquVqHIiJyQUKubgSVzJlJQaJXgQQdSyIeVrrXWnFnlumurFwrglTFnvrsRYOQiTNTdriheAFAySZffgJbAQXEAydIxzJPCTSCHBDcjyBkBoYIEKMDZVqQcjwHA",
	};
	return HzCzPRSYOqZ;
}

- (nonnull NSDictionary *)OgQpiHUFsOEesHYSCr :(nonnull NSString *)eVcVJmRHAyR :(nonnull NSArray *)OkwAsEfMfGhlrytXhZI :(nonnull NSString *)ZenmmQgJSyqqbAqw {
	NSDictionary *yPJOmEyDFwft = @{
		@"LhjDaWRNrEMYzB": @"KwivSgTBrTibUfffjvUxGKGzXDlFKdTNfRqKyufqtPZBFULwsFNedpNMoZEVwUBDZpKDqLtcQdIZdiORsbKIhwPfHFWVHqWYqLoFBCcCagDfExzUlffeFYtXDFRHPZMB",
		@"ogaunJhGpjO": @"MDURSbukbFTCDAZgflKuHxPJICIHftHuywcOcQBhwZKixXBIBuyKZPEQfFmTHxDYcYRULImPoHDuCPPwfxasZusQcmwgsXvUQpnmvVdxNmqOytjd",
		@"rPHBfAzkJKYwpLSG": @"wNWbavxFmaaSravbuWShKSldwzsUNCGiEfAPUwpRqWftAlnrjPWPNnoHhUAcsVeOQYIYcuBYhLoBCpkBhUhfMvZXLOSPJWvcygDCzMhYpeXZzBJcazmgUpcrYr",
		@"YyQrcuySVfVqha": @"mcNLyGWhtfOnynEdhrbTEfMLihGmxBBGfuqjJSmwQLZlzjZSUCJkRYTcKabFcdvRSlfcIQTdHclZjLjDerkGpxHBGaNvmMkihWGuLIkRcEDDoDzjuUnImBPGyNjMIBGgIfeWBbczgVZpdC",
		@"zIbvWiMAHaRHDjyMRz": @"orvqMPVptQVipwzmZepVnIuDmKiOywFTCAwkJIEMyrLKEJXkWRKxLvNQRveWvQifRrHUknUotWQrtmbGqCozrVYyxAzUaoptPQaAfJtkAhZlMzDpEOjelcXxWQHSDzpZy",
		@"OnNfvtBQJdfYtXTF": @"fzxkzoIpaxOCAFHmRnsoINxeohvHLwCUVdUkothTCtFTIcumrZzIPTBtIqrUCFDuaOsxonardrKAqhrMNkiKmHkbZspfKTHKQwJapqnwZRggZEaajZiVJksOq",
		@"RBTIUKmaMEexvCLzZkE": @"yYCcKZmqGKgUtAgxnlrNYTZkzKhAYSAeIanZJJGdmDkyUgVpzOJzlrZAJtMLyHoUDbsUIhbuafdphMUkZrddJtFassGqFBDhqxhGMUZlHTmivdtdNTGwpfNqdrbyhoBZjaCBtiZPx",
		@"wiNGdHXizYXgmaOPiC": @"qKqcjWSTbNimFizFfUudDSpJFGNJyKChRoKWuoqEKQTtyvcIXtdIOuIjfXPlBRQqBaplkKdQThyXSMBmUqIzRSrvcjqMuRenjqbzGWAZWNPEWxlSQdGaiwfBZJhBPhsUOItagjCMTnGxmzeaqojy",
		@"iQWByaMMkRlXWblzlm": @"MCBqUCKMRiuddHdgyIAqzOnJdcQGGkvmxiGQuVNHefjbFkHdfCOvvOwDRqFgQbcATOWkdyIkNxhuqEiEobYUKjIoTscyXiykcAalVfqhvcOhIdCfqXaopSLWkHQQCkxawm",
		@"ZWAZllKZOzz": @"lAdekWlVawLuQJCvwpbLWdoiofVYjFABnADIxZZasoMQGuwlOeHSoYUOQOGTNYxjnrMHJopKBzjTzxszjvCmVYKPiHWBlRqhqCidJjPXEDFdyhjDvFiuoeqM",
		@"kzSADwWjQFwn": @"orxOhlDfaGTcWXAlqPNGmOqzWOhJmytKOIVrVnTkyqbtPSBQpncgkQsvIUcVjOSJyTiAyixIAFzqNaXGgxjrNrQUqJTRbSWhpFZBauBLNzMziwbNnbnWkuEqXyhWlgWecJ",
		@"NIKfVbzFOpBxGlVNTq": @"vRvnXLVxDWeDSnxcwRMgeSkrILyhHUMuHUKarhADAIvVomfQxYgdpXoFoNGCzzxwQTVJHOHOigjXjBIIlXofLQVNdzOLOlNTIjDDyGGTojlhI",
		@"fYoDzjyKQfjxKiGZyej": @"qZteJiMxuzAoHDHUtMLEcsvssknzxziGXltSJbeihoTFjTuCyNgZBIjMOkZIQXJgFwzeZruxBQkDdNTxnLQMaQtjqKttopdLfgIlTKwXYdJqYzZSQodVsrPEAyoyydyCwEaftrwPFC",
		@"bkbrfwPxUYVc": @"uMnIfunrxxUatFCeUTeZJkVUgzkXKUZUfIdFJXutTCdUBsOfiaJjWSJVekdjhKKPqYqddKoiAaoUusGCHSWdOUOdnwOBlnFzmTRVeN",
		@"eTcrLNFtho": @"kuWUPzmFGRoJUnFHKsDGGUjOQSlfgoJkvRcvwEGHQsdyarZyqHMDIUYLQMdFjJSfmgJNGOBSjahsdiwlnmDfOpLQDjNJSyTNlhWfOhkarOGvmgnDgdHXzQiXMipNcGuKYzDtlpLkKfblepxFpNdZ",
		@"lrwWUlHMymyBE": @"ZvIHRqdTNQCjGPQIxYeVpSFwmMCJwUIZXHgiLgYLakcAdQyHyJBhBNRGargXYygNEtcirojgvYXYdKadjBTEvJYlKcKaUQJITpSkgAZDfqDMnNNjSddCNvscP",
		@"bDEcUpAIjPUVD": @"zHyeYrINKcxuYBVPzyPqKhfeXNoLcSYXCeMxbVtRUxyXOCFcYBQQuTPYAgBbzCtWCWoxVazVXDcrMOmFkeyRsDfzUaWSnyEXopFHQXJKbYAWqHqaAZbVKgxPKmScUkwiyEFMg",
		@"qYQXdWezBwCFVIFsv": @"aElFBgNEfzqPbkLvLgywfLFMmQtfOhgnjDJeguuLEvmwCsGiLoihBDyNgehvcYShcVvseUfuNrtKbvjkVFSCcZiBbkTZkPDHiDWQLqqKhfGOZldXzsdWITxT",
	};
	return yPJOmEyDFwft;
}

+ (nonnull NSDictionary *)SJWvEndTLB :(nonnull NSData *)DNXDayQhXDjNZM :(nonnull NSArray *)saTqmkZGkL {
	NSDictionary *CnNFStWRnPFmNH = @{
		@"sWTEWTHJZo": @"UtpwVbCtWRCnewVRaXvkUyDpiEDmcqXPXEgmXmTJHXRftQPEszSlAmaqyJVQbnwLrqnxKZxcsdNGlPCxdCkbyfUnkkugDNyJjyghO",
		@"AHpOfygIsoM": @"ItoNnuVzuuVUMaeuglGUKXRZChgraBuYZXqZnolTavbZZcvaxfSGpoqtbLheUClZtNWUjrcQQuFmwzCeAWrkvkekzTwsynpbqKtVKZbfXbsvJKoPYRARUliqjPRlodmB",
		@"GmpOxmQHPaNpnNIilb": @"TGLtNgLtWLasDtmPcHjxUXkaDrHFxKhuVjAEfFynNCDuKeDtEDqpXFuiyzyeIEDMwBAnFwIAFTJSpJSgsdSpCkSQfgVgTcvqWZNslqsYiQySZRisKTLsMjfMJZtWQGRDxrDFihBPK",
		@"vaqhYUbANMTzvpclOVb": @"HVnCwolntxlIfslEloFMlvZMCJLwqsdxHxVrhsCoYnqLVmSZzJfXeMMZXbmWCqwrfZxuanKjuZwaXfyqNxZQqHPsLZqkDPEvprHWsWyqdNWHXgNkssmtOcu",
		@"VSsteBkRRkLVKJyFh": @"gGwuySKzHphsuMCCNXaFThMGgbgKTKzmscghyQYcDNpukTUdvUpLBEFYUucLDgFyzXeZECSIHLrPxXqTJIHhONQHetvnjRsEfqGyCLRGnWWMNVSYiCqwkMqzTAKMhFOHzgYpqzzEMDhOyCTCMfxTA",
		@"TivfpYudlzjOIYfkL": @"lrSNfDdCpuuCriAWxkLpHlSLAeUyZkFcBQssWWoatpkGtdSmQGKlnQRIilCzAoIcEnmzXCkpuxJysorkQznOknykKxkCGEtlkvMaSUUMWKGB",
		@"YebWissJSQTmu": @"USrsIxjBSKMDhjpGhWibkwFFvmzCZoYFHzexEElkGSJpOPpVksrisfdabYayjHgglvRbreRNenjouUksJpKAjtkLJlNlhprIOGOiDAlGZSbyrXrQDZpqBeYDlIpxzsNO",
		@"VQQTgKcUnij": @"UVQeqVMTrmhqlHWMOwhFFwOMezEKqYQgWQzumNHkbDIouWhWyGGPbscHCVqkRofiWzqxSrCUUqMXtonXFGdlAsTeoBOQtazQqVXXsNEEsqAmJOpTthRiAjWdJjwBfbxZbvX",
		@"MLIXchUHRD": @"MhIilJMPSMAfQUzFcKyxDGPpnJIdfBeAmzuUceqcNlzWxHslhUMXCcWqNeEqCsNoJCDeVhumNIzQBvgKwilnAlrAeJAxMRZQVIjUDFhdDmBrXNZl",
		@"hWYWyoWdSjIkFyYrPi": @"PyBxOVcppuCQYTaFECXquSLpWOaWwrTequpCeIyHtJitbBTRRqowAQvuUggnyNlUQlidxdywtxjtbAvoMNGAosECxpCLBakRAppCcweEosjKFyviSlEtBZmQRYiACEaGvYZ",
		@"kFUtzcuvMMH": @"jtiwZcPQDxXmqEtXzqEhIMvhSMKpyfokMRCvRnqDjhEWseqbIVTBkxGftcjVSZDwsTawTGuWfWBPGzTJrhtkzseZVPEAvOypHNtvWykInovqLcQFhtoSITJHzgOdyGIzRMGvNHb",
		@"knsozGEjcOtmt": @"rrAzemrnbymZEodUPkYFEQkKPzwfycyWpdllUmivzQbalNxpkpXjHmZWHfFhKhUELLbPZvEEmyDinahdWeftNPvIjVHCyhhdhQaTPHfvZPhJqXBMfYlrgWpOgpipCrDBmqCTfCE",
		@"zjoGLWjVeQB": @"nisDAJbnzBxRVYhzPwqwtDQjOOfpaseuKDiMcdbHNuYtOPLOYXLZuqVLcYygQgwrKLuizmLguIKrGbuvJpGlGxgWpIBGgJMDULURhNBYLoBgKaIEDsvyAVqkIDXQIcq",
		@"PgyUcflpMmaZ": @"HxNjNCcIgkijuWPfcfXJcvWgvwrJGArxhHBrKbjWhOuxnHKVBbQtIBNQEJkLIIdtZDLmLQNrFTGdMEALwOTdXEPYBdnUSAlhESYhKhnzqZsnUFOIHjKXkUwvJbpkMPRgfmGKVbZdxwUBSMDUscHV",
		@"CUJRXsgTCnex": @"HISIldpAMtsjWIwWkYhBQjxGldbniayjOywqyGZGjLnyQwPxOFBNwPsSiZRDuwkZjtzmFqpNgRHMbuasHubBciGHJEJPOJoivivqLtHaiMOvwKDjrWROAMAveXvaLRHCUqfbpgVhiyWxiKjjPB",
		@"dwpuYcDfprvNbVPj": @"BDTdytRGEYTjLBkFJBMQpzYrwblBUBfaAWlTMkWilJuKtPlLgEnsmzgtbSyWHkdnYUxwYjbCXttqsZPQePuMWkPlSxOTxqmbhdvXcpqEurjGjkBUVgywbHcvXHoozdXaDYlxKxlLu",
		@"cimNCZFbxEiSr": @"VTZLCpqLEMUEzrsHfNLVtWNlWgsIIwXhLgYmGRfyJnbhlHREmuoMtPSeKvIDdGmhPFOnUElarallVeAVxzyueZOOTPdlyAdmzQujwbotYeYwgQrBkyWfaLSEiWaIhsWwwOhMahUdwdiqakRq",
		@"UCTxWCnMaolvJUxPRj": @"wHLgkGfHWhOoVTHTQMXzLpDDEnIrpshqYBgBRpHdMzGfAUviJLRNFiSJAjjXarJBXwrZmwqVsdOLXuGJeMyJxEIeQMbTdWzZQigXsFLKIGQjrHNxdpAJFxtlOCUXGKzFqZncvbrrknlrB",
	};
	return CnNFStWRnPFmNH;
}

- (nonnull NSData *)NzFQkDLKuQQJw :(nonnull NSDictionary *)AbkCzgWwTabvMd {
	NSData *IpQNJtLkvgMRDjiUHG = [@"zFsCBSmjLQsQWYgKFwFHvgvzljybImgCRaraycgJXZAINNmMKkfFIFWRqsCAoWwJAaTnrtWVjmMhIsKsylFNQKmEXojbuJXgnyXhgLmqhmhWeQIRqdPcs" dataUsingEncoding:NSUTF8StringEncoding];
	return IpQNJtLkvgMRDjiUHG;
}

- (nonnull NSData *)RMPhjmjOIukORQoh :(nonnull UIImage *)tLbVlRyDDNONk :(nonnull NSArray *)XmgQFreVpOkK {
	NSData *JOVqwZKYYiStAkiPg = [@"eNUdWnoQRanqcwNztnEtviRiWuTLYowUbeFvsFjUmozYsIvUzuMrvjVUFeeNUswhOPEABoXOOxEgYjSrsZBHBBLDLzzaSwxPrNoTpxTyYxOjpjNQoZCemljiVMsxXwUyZRlJrYxIGuROIsL" dataUsingEncoding:NSUTF8StringEncoding];
	return JOVqwZKYYiStAkiPg;
}

+ (nonnull NSString *)PGISLVwHuOchdAQqv :(nonnull NSData *)XQrjdGfsOlw {
	NSString *EPaeDnLyuXIWwx = @"zpxuvsyUtUWEdBMETBTdulJOCGjthAxDSEdggfVxjvKiSVBDfYNOuhIuRgFhknmdMLBRziaOkwVzqHHPyFoyxzDLLxzENxJWgGUaYtMAvtwOuSLLS";
	return EPaeDnLyuXIWwx;
}

+ (nonnull NSDictionary *)OKdMkrcgXfNf :(nonnull NSDictionary *)kyyxdGORgKmAYbS :(nonnull NSDictionary *)qRmOyEGeaovmeKrIfj :(nonnull NSString *)WyMCzTnMnPRKuEJdiMS {
	NSDictionary *QUmtZZvXXM = @{
		@"chHDzuEYTPPbZd": @"wMZBvXQOYvgYvLLPMjVLNbWHrIAmHhUtTJGdjjhbQJacLNdxhMMmCCnSTMzPIMeWQfZgDTocnthjPlDcHtBsZfhOWWZksQelcvLBao",
		@"VpkdmdpFhkquGmlyW": @"oZcOnituAiCgXbLcPFSTVYNASkQhKueuHQgDliSFKdZSppqdVmRkwTaGRtVTSgsJgIUgKFlGvEDSmFmjYAfxRigmydCXoWBAupydBsNKHlVYvqlUCOzlWdfgrOoYkHYEajLGoteFxpzFENaQEV",
		@"vCdQfGOQXsdxagHud": @"FKuZaVepHXCSIsjaNnOyWXDiGctqaVXIzzFeHPUaDXsIzFitHSDAfMOpcIHMrcrgyFuZzocqLUrNymiCPGrvUxFhZHgsIAjSHyQhloHgVQNCOoyTUjfxExXHYRxgxEWFCwtbjulBSD",
		@"kNKFduNsKC": @"XEcHdghOqnqWqovYthoKbXdytrNXLDWkczXWSSieAgiwIAhagyvtuFKIcClTNTpENsAvcFZAFHPPIsdHxnLQReTnQmhEpBzOGMhPaZGYFtzcd",
		@"OorozohDCFym": @"dxrUqRWtwwIeAXKIrpkJYRgTxGvkrbUHMLqdzfBPsBuJogJFLLZPEiptKVthinwBaLSHgedfcxMErQizFNeDGIAZiyYAAuCLNbcXiECPLGoPWaJHOzLhUQzIHJbafTQu",
		@"ubkJBSTlUtgSi": @"nasuNjWmqUraGMJIxKwhGggJiDlJDgiVYHJGPFwyWdBSQQTGjtrYKCEkRsfDpPVTKqBHQdhxTLaIwOmkzymtJMLwUTABDcMKPgDjCQfSupKendnRfRsyfzydNOpgwTJfEHY",
		@"LRcNKnmROZ": @"TtrHcQWjDoMeEOhtSChKuBJCguBgElXBrLySnzxGIyMJDuaoPfRfclKDrdBTORhvyNJorxMBhBrdfXojxIgkGkGJXLsvUfRgOWhNCgzdqnQhRQNwUpbIvPyzY",
		@"eGjwWarpPsBbZApA": @"OPtOPOlujPMuEjjXXSkKpUzpPgvVaFXELeoynquRiUrgUbdVHuBFsGEZhWvWrtxcsqSYsMazrqFgoiigzjbIlVsoAcXEVNhCsjZOjQDVLgvYFZQ",
		@"qTyVHYeaJAExArY": @"HeTyCdDeSQFiUWklDlYrYJxxwmRJtyVaFvuDPhyPCtLExDPhUcNrVWVYXKslCvGMqMluWWDjPOjIYdyWsdbDTayIwfGGVgdBTDnvsCAiuoHkyMxr",
		@"wKXpTyufvZuSZYwuXx": @"hIEIWfYiFFaupcxFLIDyTtZwmndhwCwnOIsTcTiyBfnnMXMVqRxnKHfPSGSwTPFzqyPNTQnMUIRHCjMyeMUGMnURfmZSvxkRzsWIfADSLJlICdHShkcfbhyDOdtm",
		@"ZPpPSfeZKoH": @"lHrlencoOdVOJBTgKCvQMnIxEWrbdOvSPbDlCTfAWcDqbmlkkycjTSbjYZzUeZetUSSqMFHLUCCjQVgQxKcIvEnLwaxJSUUXhnKaxZCgD",
		@"QdFrrUZVvvlyYoWBd": @"DdhpQRgoPgiObZGJZiqxftOSRWgGyDpXhYrsTAfDsQBGIswfptNAjpkuCTbsCiVNWGEhCmJjaOyuLalsjuNfjPruJUaOusOTGzbLocDGMP",
		@"IozrAxpHDxTSSrmXMK": @"zNpwfvOJDwBQHwMOEJRosSfJBFqTQmqrvyDAaYtqZuwxUyPhxdvaOGcYddjGtXIQaaLzSCrBtEiIjIgVAUXoSUkWmDWlhROKPVQiDirZlgvFhrznwnZOjMqiUjdthEqBCS",
		@"AOtJcwpzwXHwee": @"PloAeTUbNmJnUnsxAmjDPQxsXMvxBDncePSMcVlKgoDamgSycgYAJaomwhazHBLnLHbTlTAspGcmsFcAPVTLnCDvhEayRGyvXrrgQlpwSvuStGARNwqlTFvrN",
	};
	return QUmtZZvXXM;
}

- (nonnull NSArray *)aBQmPXTObotMq :(nonnull NSString *)JNVXXsgUDVvhlDIJWm :(nonnull NSString *)cwgswpNiSWRxDJpTvlY {
	NSArray *NYHMYZjWitjfMSsTs = @[
		@"GSkzuNPOcINZwqjiVohXwCINecgOfDQFTKWDZzVIwqeFXJSilqvnAYmMWzlnlcntmJiaslkMqNBsTWtTszwQKPUkQDAiLZJmVuzsRLKczzGpVkOdSltwqBSdkFzkCqntGFZUreJvibpHjwiqDtuSM",
		@"NzuhrofQLfLtUgBNIIKaSnNTawkXPPsfvjDRbubrgMDVOOoyUNbneeyuSHTWHcKZFwvlSxXXSHjgMIvfheDLKDlKePkqzjVBuTSzOyaYbYVdcTFtoivorSHQOEIKLWgAzvFtUPedpqMWCn",
		@"pwkkxjhtrDKPMssnjUTdObQrFMuiVTwObCZjaKLgogntBANekmFYKpKgAjicsLLpvWBOcvlrAfHeqHhEUMKYRiBMfZZnbNlarFUfLZYTo",
		@"xDzOYTuhCHBCmTIUExCcwiknCnipRXNufMZYXHoUhziVwYuSSyAFIgLDuXPjrKBUCqVIwxzeGuBMjMLYddhOjSWPtGqnBETodcRnriqQyfagiBUzrmQluazlUeIUfGbamlcWtWimOqBkqECfkvy",
		@"eIgfzwNLmGWvVbTNDgulvBPrDyJYKwXZzWbsUSKdXBNKkzcsOGtotIhCethjOHZKJOwsufQbgEkgIdgudcVNYXIgWCjwkhAdQgyynvbemdCBHqZQHBLWWHvWezbzeoDdqwlGZTEYpEWjmkMcAZPZk",
		@"qtRgJShaaNeiOXdkaKEUoftTOiGHUFWKzIkslnpvwInqRkKcJekaGBpCjoEXwyLfjgWQBqWWvNFSXDTfpypwgCdEBqqRVzOGPdhasEBYEZsPNXqyeXNrXhucQWyQlUusiCgZZegJ",
		@"eFFzjHsupkKOuSTQIRxKIjRGEfkFaaUBLtQorjmUyYepKGOgLQzRuWEkZcgKSBZNEOVVqmgdsfrnSNmTGnzbNHgJfIGjXTtopelyedpgMcFHNfIixguXGKSYwgSHbwgeduQrXMnkavHFqEOr",
		@"CWrtTXHTJxaLLQILSugANBSkhLnukDqvtslIpmujxihPHgPDmEVzUDlSvWRPDGwSOHByuoxibetfZwPIxyRlHiXcVeHiGAgQtvsH",
		@"hDHqxhCFaKpNEICJnqANWwxkhzdZmmdrQDmQHQkCQEDUrnxsRxtvgbtunGdDeArlZtroelxJqQxqxiwwmyhjyneptRblxtroQbiTJnLocpYdozaULCZKqrMqgLGKAquhVGDUtSZtq",
		@"HOurMtmaofUNpNPfgkLhxqQqBCNcIvhKgNqANKnYNoQaIkyjMMiXQljAYcmRHklkdrgeUIBHqLxDBWkluluhlhjbRkjvlqbrjJnmckbSjZdbVThBdASAPHioPrIKxVmc",
		@"YPHQGfnonnDmZrSNNmHHYhVmPNVwdljaSMVHCpfpKyiqxhHtmOxPcplRjsfQlnQGNGdwyFaBSRiLOcKaWePQyYdtRWTUSsEdGMcaTAfNeS",
		@"IjPSbkXRRReNqVnAqmFYhOILtUtZPdqvAqRZvXTropvblyGJxqejLLWQvuNUUQxKYvlOWQsqlfWHeqsUPitiZqrUPeVKRrjLpffxgdwSdNWDKUuROfMHqGVhslrExpIzLdTLEZfngmmG",
		@"tOHYFKChWrYtknzwDvcmEBgYvPEBUArCXpHiXIvVYqwprzAWWcbKseGpwGXkkxTtgeLaSpkjRshjaxXhoeAepRvyCxofGwGorPBSAjtayDEjvKOaRccyfRhzHwZIcvsKwXKfHLiEPoUiNZJnAGLwZ",
	];
	return NYHMYZjWitjfMSsTs;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self jumpAction:indexPath];
}

@end
