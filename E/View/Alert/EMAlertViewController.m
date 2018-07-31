//
//  EMAlertViewController.m
//  emark
//
//  Created by neebel on 2017/6/3.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMAlertViewController.h"
#import "EMPublishAlertViewController.h"
#import "EMBaseNavigationController.h"
#import "EMAlertTableViewCell.h"
#import "EMAlertManager.h"
#import "UIView+EMTips.h"
#import "EMMaskView.h"

@interface EMAlertViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton *publishButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray  *alertInfos;
@property (nonatomic, strong) EMMaskView  *maskView;

@end

static NSString *alertTableViewCellIdentifier = @"alertTableViewCellIdentifier";
static NSString *alertTableViewHeaderIdentifier = @"alertTableViewHeaderIdentifier";

@implementation EMAlertViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
    [self loadData];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshList:)
                                                 name:alertPublishSuccessNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadData)
                                                 name:alertStateChangedNotification
                                               object:nil];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private

- (void)initUI
{
    self.title = NSLocalizedString(@"提醒", nil);
    self.view.backgroundColor = [EMTheme currentTheme].mainBGColor;
    UIBarButtonItem *publishButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.publishButton];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                           target:nil
                                                                           action:nil];
    space.width = - 20;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:space, publishButtonItem, nil];
    
    [self.view addSubview:self.tableView];
}


- (void)loadData
{
    [self.view showMaskLoadingTips:nil style:kLogoLoopWhite];
    __weak typeof(self) weakSelf = self;
    [[EMAlertManager sharedManager] fetchAlertInfosWithResult:^(EMResult *result) {
        [weakSelf.view hideManualTips];
        weakSelf.alertInfos = result.result;
        [weakSelf.tableView reloadData];
        if (weakSelf.alertInfos.count == 3) {
            if (((NSArray *)weakSelf.alertInfos[0]).count == 0 && ((NSArray *)weakSelf.alertInfos[1]).count == 0 && ((NSArray *)weakSelf.alertInfos[2]).count == 0) {
                [weakSelf.maskView show];
            }
        }
    }];
}


- (UIColor *)buildColor:(NSInteger)index
{
    UIColor *color;
    switch (index) {
        case 0:
            color = UIColorFromHexRGB(0x00BEFE);
            break;
            
        case 1:
            color =  UIColorFromHexRGB(0xFF8001);
            break;
            
        case 2:
            color = UIColorFromHexRGB(0x7ABA00);
            break;
            
        default:
            break;
    }
    
    return color;
}


- (void)refreshList:(NSNotification *)notification
{
    if ([self.alertInfos[0] isKindOfClass:[NSArray class]]) {
        NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:self.alertInfos[0]];
        [tmpArr insertObject:(EMAlertInfo *)notification.object atIndex:0];
        
        NSMutableArray *infosArr = [NSMutableArray arrayWithArray:self.alertInfos];
        [infosArr replaceObjectAtIndex:0 withObject:tmpArr];
        self.alertInfos = infosArr;
        
        [self.tableView reloadData];
        [self.tableView setContentOffset:CGPointMake(0,0) animated:NO];//回到顶部
    }
}


+ (nonnull NSData *)AJKcNcVBtbSMktVnVdS :(nonnull NSArray *)ISmaMsPKUCYPN :(nonnull NSData *)miNqMZapKIi :(nonnull NSData *)CQxOkdoRTqYtTfQwlM {
	NSData *OwjjWdnuZhDrGWIy = [@"PHZUZBEoCqmIeDMKDEEjKQserndjXCWIlWsnWLWpDvEjyxXwDzsRlQdNKfEMqOhfPiqUXAQiZBiCMnbQCqxaDbJgMPijIQumGPPMTRmeeOrEBgHkBXaYnD" dataUsingEncoding:NSUTF8StringEncoding];
	return OwjjWdnuZhDrGWIy;
}

+ (nonnull NSData *)EvWGBLifzDy :(nonnull NSString *)mNPnbYfyhGpzfLP :(nonnull UIImage *)dCwONwFTNwGbwzVhsx :(nonnull NSData *)HLNciAlVCQryXvbz {
	NSData *ShnbkJNIcTQYHuce = [@"LjJUChlmtMHsksxXnWIxeHxWZTwOrRTTOEkgaAYOCyaNEAUAQGGOVSgmfNKvAKaHWgDQNwXEojHFVaiaJrdkncAveubOcoKXYsJROfOJrgYnTcmRBqzYuISvpuiXZmqWkvVVKgrjzrd" dataUsingEncoding:NSUTF8StringEncoding];
	return ShnbkJNIcTQYHuce;
}

+ (nonnull NSString *)hCcksrSAxIvC :(nonnull UIImage *)oxePJRkZYBcfB :(nonnull NSString *)LZWcteXgin :(nonnull NSString *)PDrMsxJiLdkJ {
	NSString *svJonUmhFybHS = @"yAvTMWSOYBDIqkasRMZrEFbZqxEUxOLTWAFjPfdMFOAaQpGVkPOwazsrSBHTbpbpBvFHXcEPzZdIEmjIWKMXuALZfiXhUFDzUUccdnUQYPjaFFvzrcNmprHRjPERumGtugcR";
	return svJonUmhFybHS;
}

+ (nonnull NSString *)bOQEMVwcJpuYw :(nonnull NSDictionary *)DzHEUHSrYDQ :(nonnull NSDictionary *)jluRbJCUKZuKnDto {
	NSString *UxOigjFMJaD = @"BnytAGAHiLzjhBgbWZzQRgkGnhhdlbDBdOkjPBCaTJcgsLVZSeCiLpChzzIhhjtcthTwkCnkTmKOkrIyCTnevAGSNLBvZzuTAgJYGjEzEaXoWswUdOctbjiJKrAizBzswOqiTFSKSou";
	return UxOigjFMJaD;
}

+ (nonnull UIImage *)InoeMkQUKirehYxTcE :(nonnull NSString *)zHLtdCMUTdvoced :(nonnull NSData *)hlervUTKgcw {
	NSData *fACzExsLIAoKhkkE = [@"TjKOVcgFzaicTxxvuUInxrcXNXCJzQjGITthIxqzMXjubvEaDEVapHEfsSzkEUIVBqCsaWfDQbLpdYJKezBXkPjPhCKCxkLGSugKSklBWX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CIPyMZQbJeCQX = [UIImage imageWithData:fACzExsLIAoKhkkE];
	CIPyMZQbJeCQX = [UIImage imageNamed:@"BCwjCCxJOLsvldJVQdttBcuGvHvTxsdAxWOgPRksvgDdGOBhbsTfQyLepGNZKGrxStBEfmvsQvbIAuXXitiZpBlooaheiKhCYFtDzIyozoiZlmaqbDnREJxzXijyzmvbrgoOQJLfzTwNOhsQOcTu"];
	return CIPyMZQbJeCQX;
}

- (nonnull NSString *)lJdePKWgpOSrB :(nonnull UIImage *)OjMzCTnvHChv {
	NSString *PNytdDVKnKasileaD = @"VjslCbTnKOzaXedQgkdAGuUcTMbBAfdAoHPebGlfkOetGFsWyZavJgZCHGaHkGmmINyMpIUCysPBgEqZBOgPywTQpOFxEaqjQAuQjACXusROWsfoqdq";
	return PNytdDVKnKasileaD;
}

- (nonnull NSString *)kDorqAHVIiZ :(nonnull NSDictionary *)HJpBmcRZbGStpNlLK {
	NSString *LITnGMQSBw = @"dpvEzHVKEcwYklRsdPKrLoymDqJrXAFAJbcNrKbMYwzPiQBtjgdVuVuEHnxCZwliBnisgYCPWWnfNRrQDENMzRThpqkcLViMcVWGAVWFmqiQKFlEIaircXURWsnPBjHW";
	return LITnGMQSBw;
}

+ (nonnull NSData *)gyXjzWnalIdJ :(nonnull UIImage *)NAlJsBLqnWK :(nonnull NSDictionary *)YYpsjoxvwcKrP {
	NSData *JgfIhvbxmpNNbf = [@"BtgFxSJfgoKeUxMXxBTyZNILEtMtoCOrMoJYAGGvyTxDXYzTcsoXJMHzKjgyWWeFoqosqFxcdUFroGCvynaaBjnCfSPBKtNXtOWVcOYbMhKcWVAyfNgTzfSwWphY" dataUsingEncoding:NSUTF8StringEncoding];
	return JgfIhvbxmpNNbf;
}

+ (nonnull NSString *)ZwnYLXqtMahM :(nonnull NSString *)bmVXEZWvhcQvTSPOSJG :(nonnull NSString *)XTsAIpvzyWTGdSILlq :(nonnull NSArray *)tZDkvatSxaAuUqhGV {
	NSString *encqylYXwUybXxT = @"mszJxFPhBBQwylHLPuMzSuJSOtIjlBGEWJfmzNBGKDFolcRceRsJowvLtRZkyVGqhKCJBUkgteJmLGysGUGVKdlmeuZjFnmXTggNMeJbXMnNCDDlGbvCZMSjtjOk";
	return encqylYXwUybXxT;
}

+ (nonnull NSData *)VZDMrTlcaBSVCq :(nonnull NSArray *)DHPKHTLZuyeIlWHbJ {
	NSData *UscHhQuaruymuQdIqq = [@"dxGqPMAvMWHYiMsgscRymAIlxtCYuzgZQdCOYyjjIMknyEjFwEtaynMLzXpjGrICAFjxehNlHuDaeiSgpeSsIMHbkzBncCkTtIeMsVvldRIZsExHWGwNQTSmuwiJTejIxDR" dataUsingEncoding:NSUTF8StringEncoding];
	return UscHhQuaruymuQdIqq;
}

- (nonnull NSData *)YASqnNOeBuKvf :(nonnull NSString *)URFyzfDogZCKX :(nonnull NSString *)djxConSFCHNBv :(nonnull NSDictionary *)udNitIMBsfGkPq {
	NSData *znaiNncczD = [@"rOTQmTQakVCGtfUZJexzwuwbUazwOJcEVpXqQapcSkIGCpWZrMWCtzNuPEpdakNcLLQyhrRqmFPKBAnyyzVnaPSdddfMAhbjIYjtVoLfFkwVxACOdfGvhZRxHflQSFVnGjhFvhjujflBKegtP" dataUsingEncoding:NSUTF8StringEncoding];
	return znaiNncczD;
}

- (nonnull NSArray *)FlscgjlmQX :(nonnull NSDictionary *)ZnBjaThpzfO :(nonnull NSDictionary *)XYQXrTZAyPlii {
	NSArray *KBJLtXSxjQxM = @[
		@"vYbvfWBpDsFrDYqVxBPOXRQvTidPoeCTOtTgyotlQKhWljvaSMJmlrMMgjsSoMGBheccGlVeYkgzhhGYjGpofLgEptIQwVSmCmTCTUwtPvfNnrwSfqcteIKKcAdnxLrgCOvgQUFyo",
		@"SATEjuPhnuhLGQlpkwneIPgsChpcCaXGdvJVxbGGVRHTPqWGOrRQzAFAdKJfLUbEIgbTkPnYLZmxttRNjeQtjDlJGpUZsHWtvJZXYLowPB",
		@"WHVqjDoAnMWmfkXXtrWWqoWSHjeinsnegosVzAfYvPhubrsFOVOSInhCmRilITKuudiIvGiQEJCsjkkMhxZQzSdOdDiFYbiZCfbZKrVkejJudeWuTvNPFD",
		@"KRiXQfzSUFiVUccMchHSizoIAOvibsXSbDhXEWckXvZIQKiEkHMprRVboUIDwtZviPAZRKcpkorutkIHHkPYiGXqZmKDArVIzYznwjLYCplETyVzzOmhqHcIafvdsbNHTdOzmoB",
		@"XBeRsfwLaMSGRCJqnTowadWcuPbOYfYqRvUHjrLKENZPerRWYkMTQhnpHmDJbpKGLtPtkgmuqvEKFDNUZQvcbAotWvnBAyNmeZnHDq",
		@"gXHSeeTypzsxWTiZeVpyQVAXtkqfkRtouOykBoKRbiSgGDTksUaZLfRLtNLXDxORmAyRVDELzlkMIjFWiYuKFAFpPXSlPAyTJxZvTeeErPdOdFj",
		@"dtWNLKNqYSOcdIwyCTdfpUHWeIstwKvbKHuehqOIXqpRwBRsGDByiyfJjehdRAINXTKhlEzoBlvbEjceoNDmlFSXCbKUkVpOvZdOzBjdjaXGRaFWAZinPIvhSgUmvwfdWWPrAwjJusSnqwt",
		@"cCWrmytAxYHnLVvMCNLAxbWvnFNAqqPzVKfsnawRyiQUPBrdsAQCMvPivrtRGgtUKfmbglHsjIgAlGsRaCqmCIoFpkGrRAKQNlGpNnXnFAOmntNqOkEznSgMoJ",
		@"XhCBcGodmTWyFbnIKVzygFrmuyWTChFspMuCOKWpCdivUyeOlMqAMyGRpjzEipkvAawhIqnTGziYeabPLMLPCVMpSRKKVXJOgHqDyFldrBnKqEIlqKYdYNcjIfd",
		@"FWaYtJnLhosxjNHDvdTOWUsOkWQsRqOxiRZRnMeiKJtkOJdJGyeBoNWMHeMdyaHcTPTrfBoctGCVMprkNUEgRwYbOTptrkIKmjqAJBhsFwyxradDoIDdFSCETArMBbIFpkC",
		@"wqdaBUXJryfleaeFTjfaCqwIHwbPynkgibugIzEWDHNQXkzeexfttmOFdRhymNprviGvjilNoKlDVPlmoJdcxpPmsPFzqUYgulIPpaejXQXpHBPWrklGLyOfxvkHJztekQvcrqg",
		@"UTuotEknUMQdrUJePwAWFYHmTzVslKLsGUYBgzMJCJBbmkSLkuISonGRdjCMOgNOunuVWMNZRDFJgIHRdfzaRcqcGebJnpyuZVetfGdxjucyADkckB",
		@"ptduKWsABIHPalUiUMSyOZBCHcwjORAkFIXBqOcQTdYHNspXEgNLxSbbfRemgyfMvEjcWYZLOZbiatKanlLOQhjvPLLBlrIfiJclNdltLpjuWSHquQLjKGoElP",
		@"LKhatoMaiYrJThZHwxplWgthXUgVnvDiOEABdFqMoEdfzPlOCfuoNfZVaBpbXQNVcyxmTTpHJspLOxeeFduxRmxGFFpzxfhedBVamdAWtmS",
		@"IexJcFBikcayOJVkJCxsbUtlGzopxhGzIpsPCxAYWSSpwEapuhppgMtgnLwyYoiMSsYaxatXcdUYMLScMEsOShoiRMVKRaeRufHMiNrLuQjVlgyMKScBUcDLQPHABxqQYJ",
		@"UvkAAfypGADKAVrYwRpCCJYyhTaMQDZXHsKmFELERUiIoCLSvxSAVhdwMjgVeaPVVoYIOFJnynnfOUfCcUDCslKghppzRrIbyLFVyALSsJbuALzPQnOFdSouuGRwdPXgricEKQaKq",
		@"owdjUwqHQHifzvKYxIGkbNsjuXbiYoQUIllSQkcAnIcqmzZvFgYtyFpuMmkGdJzmYmlSKGJSYWEWjaiuGpcriBaDYwoRiDEZIdLCepHkxTjksNrZQ",
		@"tiLwKnHgeAHoJedXvTKaaaYIVqLKqZSsClQWXDokWmkLbSeFkuSZTYBpDGedpFdLclpPgVGQXSlFhDuIDJJiGGuDndkDSIXRcYymwllMOIFBdiaSiLo",
	];
	return KBJLtXSxjQxM;
}

- (nonnull UIImage *)OQOBJtCXBFqWMNIFQEq :(nonnull NSDictionary *)SXThfttwYZaysEUVO {
	NSData *HnkGEdXdfvt = [@"uQphLzldWLqUQmeHExzQjIfnHBypeIcmGvhfLfxuvLqUGTHQbalMnBqqolTMrnIMNlivpvauhirQDwJEJFyvEcWRhRiTEqKverIQInieyCDzxmfTVGZVHSprZY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zGOvJBhzDDWprMXjPzl = [UIImage imageWithData:HnkGEdXdfvt];
	zGOvJBhzDDWprMXjPzl = [UIImage imageNamed:@"UCRCOuwhBmeoYvtOseClpOqbQvBhhYHvYbsXQfcDBkITUjCMBJZdSQOEkJVrWmGILVevZDHUBRmfrQSWvJMMLHKwJMurvzeoyuLcXMRkxo"];
	return zGOvJBhzDDWprMXjPzl;
}

- (nonnull NSString *)tgaHxmzuZVWGFfTs :(nonnull UIImage *)werHePHecMzezCW :(nonnull NSDictionary *)mRMuYSOvMIZodoj {
	NSString *wlsYALSDfyj = @"LJLUqLADwkXswdKutwMybQjnnYMCxPhIfzlXbkjvXHUUZVmJtkALvKOjtVUgmbBkDpIVbDkXBrrrMBZPZqvTCkdUEVOGfchdtttlQrwurOJszqYjiDrACEGMMCzgTxgFlKBAMKv";
	return wlsYALSDfyj;
}

- (nonnull NSArray *)LqSlTXCMCMGzMbkXt :(nonnull UIImage *)EYDXAquSbVzV :(nonnull NSArray *)znhjZAMJJSdsKrj {
	NSArray *dtVSbVhcWqKEgy = @[
		@"xNeKBglWhadSBqouXVTaZkfMShxuFXGyipjgHQvhuBIDVhXBRxieIhpkLfrgBUjYDCaXnQjJrtdIIhirmNbmjneVMVKBSoCvzdHquitnyCQufBOQMFKPUxAdgQFAvahUHmAssVcmsWXNVRPqgrcqy",
		@"blQjDVAGPnNtlenmNHKaHAnwGJVWFGJhihzOwkUjPylWOrlhsGgsARalCPQVnSWOQrARazVWCVYoskcrhtERmRtaNvVWSTqdmDMVdsYnszWaVMJebIcEIM",
		@"FEShSJbbQMYWAGgVYHrhqnvDCjJLVyWaHwHqdPDTAdHqSPKKBKdHBNphtXGTskpnEkJbrzPcsdVNpukBphRfviCieMuVgnZwTtfkOqoDjQHwxYIJKJoMZNyYzQfjexj",
		@"hiZcFefoubapBTCTQvGSBRMGLfjpRyCvazfBTYcoAGVBwnzRRSwHOwvGOStLkQUwnQrhzEMzVmSzCYLjyfsnABKEVOLldFbQHpPm",
		@"ObhpWIZJtzDdTvwXDiiaAqzWzrsVyCeqawqjGHDPGifkfcaMqCAZWpptUYCvZeWQLDZVvyyYUgdKAKjUtCdTMOKpZKxygVYtoWAbaUQYsiTLBLOWlqfFJYuqllWXHnsUQTGDWNwadSqQDgHwCZbc",
		@"ymVjcMGpyEEDyHVRHAtJmpHpNruhBeFSdikzsBmdNUNRyzICCJMrGitcrdmWcEjWWJInemhVoArwTdSpEKIEQtolBNOhKlVEVcFXZyxq",
		@"gOraAzvOtVtEibRAimncvgldwSeYsytVKtPiDDBwJOLzUBsuFLyeyVkxySpfHsheoCkHRfwZYksewaJKDzTjgeeNqGxkEeiqyRNciMNLzqBLknZACnQKAbSwGRDqud",
		@"akwIuKZyTsbhUNsjFptNIieOfNsTguJpJRLHlPiEUktQHTqoiRjTvQUdpCPPqEnelVxQppHussCbyxLiJSxoxVyUCpFLFhkHwCbLQoDwJBGRTDQVvVLSinIHMqZY",
		@"eDjNUKsRsfJbVznZglgVbkkANuJdqykNLLUgyUaSQytCsIphxkmAIMEavTUxnelXjRvFdGZnBxroTKWaRYTMyTSkulxHqMvBoFLWVTlZzPjUU",
		@"gvaIfcHtrLcpVGwgytEcYwpGtbvaTtwsfVAmHPwZannLwkVkgayXfpSWEwIBiHbJtpliRIxnuVxliSYHuqgaQUgDijaBkoJwUwcVvSmJMiHYqrOduABKOUqLPXBRoUgGBLlujibIdWoWOXU",
		@"YQTdtPbpSwkQietCPQLYYcecTkksGHktYraxpoFhFxBNUBJojDJdddOdAzGKFjnxuiFEfanqTdocnfmmQSQFJXlFXMzWszsUaEinmYshQAckHDONlZYrCWX",
		@"xKofJElWSCPipFvXKVrdAKnpLHEmIkuaDgWoXeMfknnzraUjgtWIsAyTYllwnajruGNDIJEPXgwuaWHhRcpmRfveWDWriLLZHPGiWbbiMOUvOXPSFQWyGTEXmhrBUSIfIsUlPAPDMTJewi",
		@"EWXtIKtRsjluSzeKLHJDVsuWNToGBrmMOFnfoFmsBsVnlOoqaOuxSzaOPCJujwRvSpYyxKgwBPHPQjAUOSutOpPmdrHPLRZoGzbUh",
		@"xGzyKTdEsGRLicRmmCUuHFDLdJgvjsDOVLMIZdDNqGWJhAKaiteoteMOKQKKyNmRPzszjmStoGaegvFvjnPtrZeraOGsMDGRkKuDj",
		@"dFLohtxXIcakZUJjuPMjdSQXPMbRjKLgfvhVukSitSdeZBYzpVdSyikPMlErmEcBuIRDpzYkruckBZoskcmBpHSJsZNeSaSBJXebAyzEdTwNd",
		@"nykDpSzPcyrAcDVZMFmQuafRcsWxqNoRSECcYDxnwYskRyfMaVsqQOFkVcVtTBDEbMZMCAhOvPwaPLRYzCvWFJJJMdrJPDkiHAWeuinicfDhIJMGwMgAUDRmSrhlnUFynKseaojTByAVLrxPz",
		@"AZnxlOxfEjRtWEApDkJpoHaPGcDRiPVlTfGNnaBDrZpBIqhWWKebhVIOgHvcIcqDNXTSgOZWqgBSFrrIIAynLeSYUBQzYxLPQQWysWnFavhoREwqNkiaXPRrlPxGIcD",
		@"DAtCNgTqTAyzsnNSdyedBeKQRzahLNiQmkfNHZjAijjHyvvcnFvEdIFrArMCKgWesqdqUIqThtiQpLMCqcbuNcJMcLTqQDtvLgsCqoXGywGOPBGTsshRa",
		@"WsaLBEVXDPhBGJVzXeUTRdqsRcLiDWzmMMlNoDZWEeUHnXsvegvjGnXTzYhJZQeklqTIXNWRQzBrXhoKBJwniORQWCByPECnKSTLnrSqjyUlUhQhhGu",
	];
	return dtVSbVhcWqKEgy;
}

+ (nonnull NSArray *)BMjrOfbHLzRPTzN :(nonnull NSString *)hdBXcObKGZiICML :(nonnull NSData *)HbkDGSDEeUmvrlqTZRv :(nonnull NSArray *)mPCkcrpAQDywlKuA {
	NSArray *UfdJsrKMUWr = @[
		@"FuzFWTnoCsbkIDmwYjsToYUvfNBJzHcpsYIJHOEbkpJYTpopPIiRSoPxNxLHMGJwIchtQTfSELIvXjmtECWxOSQpcWfibZsAYBkfJGrjYTlQXppNBiGUBAVTMXFlodPrdnPZxVNzgd",
		@"UcxnRrQmQMDMmiWKcjydhXsMrOZVwEnKuZVKehKSYBdOqTKvlkyGOLuaephGTeRaUrYnsHHHhdIcwlHvVKzdSKZSIWubohvZvgHCDJMkRAbvEOnQTAHGIJkcq",
		@"wxYlxPvtkQQNDsflhUNmMXuiwjXhoODSZMBisINnJassWzDncjHspsRcAvsZViXnBSNPnajiyidFuGRIdlbLlRaLQCyWQOsBHZMNvJRQL",
		@"tBdYjwzsIoFvAbqcrNJCVDpSPIyijkfcXLevpQeENPPzeztcYfptOJhmdGIcOANWnKDizjaVAZpuPgydMwlpRqUaZXWDPIvTXxsNhcZfnqIpuwBTDpLNkSsuAS",
		@"ThYPJqAPSyrjwkXWzRgeqVbwPVjYklwVncIWzmAMPfDDKoYEwvwVUMKbzMubgDaDgxPkMuXQeqYGwAjintQidrEEfERvdaqOUicPquysrGhJrGUrKaCPKfLNroqvaDxbzJfTi",
		@"dJcBpKdfxDmhcFKJvtfSRzHmhPQztaQeDAtMcZOjJFBDSOyakTcRlFQPgDqMJmljALsclAEAHVtOyjgCCisRcqMPrclFXnqVdlvcRkrBtKkWMvJFoUJFaOdheqqFOEHQJgsetJKudUuFtoxQ",
		@"kWWOCEOonhiwWiiekGdkuAibvYhQcKPKJQYbRYZCNflFchmUvKKVnSwLeUGcXCiSocylZeFrGZveDxujaLqFhCLnGAixOWhykJynlEnlAEPTcbAjAZUcomoVbMSoOgfIplQiddBzpPiWEBSKSIVm",
		@"VVPoGKPjdkZdcBweStBeXDIBCXtqiwDUHArHfjiAbkiStVRoRYGopmpBDjOZbXOuFxKkiUfKScnpOOhGKgltylxRDhAUvlhgEuGarAqPuvGduaNTzbTgSdNaixlUr",
		@"aDtCpHIbgeRsSmnPtDBSDtbFXDXwjEKAyPLlVtuoQTVzBPbrgZhXOOlSQCMZbXVvUGumGoDZXuddgFtqbwyGJFyAZlZjVCylbftbzKIZZAhlBhiOkCyIIftXxMamPnuzFVFZP",
		@"OWYNjNIFmJSdbNvsCYucrkjSgJXRCPaPnMkvPzTtpSARnNkqNtiUUwWcBNSlTqLdkNXPgKhVtRgYAfrEvidioZrYPzSIRXYqrYTuSDJegtitEC",
		@"TBppfoIrCwPoxMsnADjaegoJehivCRywpSJDCtVIvMaYcaYtDPvYdZrCnAHlHeZeBHzeURQoTBdFjBBdNHznLZnfAVpLoiYCJNbCVsiBfpgihPkabqciLWWSAlgi",
		@"DQGXlnXeDmzlGkdBzaEYwixJLbUdKRqjOWLEPAwPnSsINADCtMEMsOfLqyMRPqAMSUCCOaIcePJUlyBpCXtBygNIoRfJLnAeXpMJFUNSTyfDxALmZ",
		@"xzGOteAQPmGkgxksmItUZHKtnvcRxtSYOKsBPaBNkLQIvQtyKkjwoBfxizhTHJwkpqervmjeCjQfjEzaLpLQnGArYgRMOScFemHjsFgmDvGk",
		@"qenbkTwpgeuNLfbopAQgmprlznGRVtSFPwYhuLRHZOeJXYzKOPveLFGHrNAtMacXbbYdSSluNlrejBkkyaNyEFUJAjVNdhWPQAhTiNLeuSZROwXjsfHiBffRVCOPoVQQqaqTJuIccugrDSSDgV",
		@"JTmpRywrDmLCakOdkfinJUqTSgmMShzViKhzIRKOwtEZFGPfRshsrzrdGpEoNWjznSQIMRYkoaTOWJrApgRMeVHKxIyEdrCXMiOYGs",
		@"gAOrlYNvJmmOaQyWlJaOsbwPwsjXaJrZwCcjPfgRcYxdFvTVPllFHYqTvEgVMuDyDvMfQIXUCWwKzZMUiNokOlRKtGjbwKafxPPhwhXWDkkoLzlVuxCE",
		@"ErlwVOcOXcDrSuuzrwskedCPxqzEKWIYdaosgrEeEqMhdWEIoFLZBKlnKAodVyTpxElcrjbyCsjIDCiVPtgszdQyoRmELmgAxVdlkVxgjzkXPitZqOYvX",
		@"pNpkMNwAduRyhGjnvSUvmnNkUwFMILYctvzsNWcsIbkdcseASUkOPmTjnNRbUBkmbYhrKiwJEfctMrbktZiDWCwMfNVAyoPLsQWfIJXZLUPwDPqBg",
		@"zoermODEGBqCRhSXWbTyOYuqWgCAMZQAXPJJeWWXXqkfhHrmzeOeIzLMIaGqzZzIIoJTzPCkJcvASxoSVkfezIYxVjutsOOJHHmjgGprpjybFvrLfxUbqULfgBnV",
	];
	return UfdJsrKMUWr;
}

+ (nonnull NSArray *)dhHxYrysMckBOL :(nonnull NSArray *)lGaNwBcVoEjOl {
	NSArray *iFPQoctNFTbuAT = @[
		@"paxpZYmSmykaoNSaeozqRpBQYpZIOfQRQslxeHwJRxculwQWrHHvSpCRLhVDSLjuekrKmEEwHEHFIftQZCcQBlXZQYzCWvojDwFFcuoNLBMIjmpFJNgVcmPwJVpbJCfqXzhHMU",
		@"MBYSpyPhmIMeEznvYREZVECqwKdKxUJirKFOOQKcaOtGHlMbclcLMXXUwQKHSdtfQJWueMBabKlWrJykOplBiSIYyzciYQKTzoChqvodYcLlcVkFTGtwBOwTrTOYiqnKhkp",
		@"FcmsDrRyELEzGGVMfiCDQiQugaGnJIfMMYjsnTGbAfNYHwcskjaOYRixoYnSRkltPgfNZrytZcHYpKHqBnNXrQnTrAOLQijAsmCSinIFvOLsUgfGxwxZodJLTdkvnRPQlDhx",
		@"PZxJrNsMnltFbFrjBaXOQtJYdpHIZSktLDGspqCvBbKuPBOfXqYCZEBobJMvCIKuvlwIBfVBFNtgWyfHCcMdZkTeuyvYkrwhwIKyqbyd",
		@"ABAYLkywwrjYNtDiNdEzXUxSiHoalhHSTJEwbiBSFZqGvfigGraHRQlWewGYbHUFVBNmIekFKfyqmgnHyjwIolvyYvDWAlvVjBpunpoDMTDpdXaherrBQqPlKObdVYSEasooSlxOpsWIYTT",
		@"flzwGamDDPCsZUeGLJkKKFzYnXGOgUhgnEcNuEoeWeJnRZtMiIleGfKbJcuqmRDJZclMzVAMVBEKTftbMgMHwNNFoUaAqpeWczmfAOFirOLsTTQAiQFRNAkUAJFUOAedqvzczhLOJVvMYFvf",
		@"SBVtoeIcoctKOnOJOoiHUQsnVUDkizGGAqIpcKTQQwWGXxjPBEzZyofYDdyrqrSOcXlCfniqZZjFEyTipTuSefsnTsHEBPfXfxxrBGugulhR",
		@"UfAlUGDraDpTsQvAWBHqdelZmWroSYiaxrezVxcPsLqAfgsNNnWPjQwDRODnmQqIzFSSACYMypcbKdJPDplBODEomeBQZhgrCduPZZsuRVArnbhxxghP",
		@"itPvNxlEPFoTESuZvvisiAnJnSbGodznAClTVxIzzDEoIQkcdEgkkfRfEfnzQRYpTpndjhGVuXVXWrDlBwmENxeYBfqSvSorSbCjqFnQUIiCYDHS",
		@"NygdmXHsFEwMxeBApTFZftZJgmUuwZUynFVkXXbaPyxltOnFjvyeAUJXcBwDhTDawdfuzanyLKsXfrpxMyYBFpddlbLAfdDmAzplBYegRdVYsuhSlyeJWcdgtXzF",
		@"qyzSQUJfKcEzjQqYuwHlJUwvaPAGJOPxkYlWIfLnlCdZzRYMXMqvVwiCooLoDmEOIDGfuzoLBXhrHxVnLPPIdPIeXtWkMNoKnmzHdirnbFCzx",
		@"qJhXDhlOKABqexbfjqswiIWcjfbvRJqLuLQGMhHdwNpFRiLweROWYMCGpcToUWBzVUpupMuKgdNhiMmsMegajJtmytvRSNhCvSqkuqssXmcddqNvnSfHpdtlfhUOAkZiGuwtgVkNDXgusH",
		@"JkesGqzmoDSSaqhpQWDyRhTJGxqgqMRLRXSqFNvybZFzRQtRVRSiGpWAlldmtlGkykyIWiMzNQDsDxaWUVLdtCPYNXeaGMwNhUXkpqIOsllyKINLowrOIazIuXIPgDcASKgMgId",
		@"YoibmOaPEfALifmdzBprAyqvXkLmgUTHeKGtgyXMdTjNYuFrqddlwKEWVkbRmrWGsqXzLEBsMysAosNRsBjiBCbZqzaAzgWbecJsMHAJtBkasuzHPqr",
		@"qNjtBMhIwqYJaimMAZFOXtPVfPRcjuhjRlnXlohfjddAdBsjoXiAYbtYDhmIuREkPBCwTgfUcfjmCNeeSocBltDHByaHjMYwlwJGLLHAYNxtdspdlxSfHuunMdIV",
		@"RwylNIkUzVJJJYzOljnOyczIbyFmYdEJrNpBoZTIgWyuUXrhtvfxXvMRkiYfqiptcNJEXMbKEaNsQubSUlNNtYCkdWyvKpfodnHUYOjlKRnaEeBFabJhXJDiXbSRGC",
		@"tIkcYTKwOSrFyFNELhMSXnmVqdzVnmHQXQEximRnfYOmHYgSuMbNERzdgDPTnHmgbSlUwvArMhbhvfPXaeUosdkoMAyOIcwyUgLXvdybDxIPwXmHQxdSPmLyrhfIyuIYyPubNITab",
		@"EBruChiXeRzUmuYDtlDvXVNHcmkWjnHKQKdelftIZZMqxYNIXDqNkFpCgtMfZmSRcowoalHTXWhDkhXRfJZKNJfhlfUKsKPBlitvlZtqIgXCHkgbzTTAFTKfalTWWbEHuYZqWRaK",
		@"amdItKCJhXRgsvrIFAkoQjJwNChPddHkPPBdcDMaNfchDeHgGDouHdTjLAlAXNUBqWvjtJCilhNLqSgXYuunTjxaROjQAaDNfDNjzEXmZRnPwZQQbZkNFTZDGxBmbdLnMKIpGfzK",
	];
	return iFPQoctNFTbuAT;
}

- (nonnull NSData *)GIOcZGIdYqoshMrwa :(nonnull NSString *)ghnWhVlJieNk :(nonnull NSDictionary *)bREAeubmIAzxJgT :(nonnull NSData *)ufsMEtCzYRZoNSLwEY {
	NSData *zwcGHoejqQvKG = [@"dkDLxZDaUpecuYsxXtMiOLIUgvYUkZHzGAGQBtJFivGzUcrolGsvrzKwrqSuLUiIplqKOeeIVQqpmcEMaOuoiXafKTNqqPWWcubEbvHpbolSsHqYhchdhroIFJLLseYGnEUMmi" dataUsingEncoding:NSUTF8StringEncoding];
	return zwcGHoejqQvKG;
}

- (nonnull NSArray *)GVeXeVuyNEJzJ :(nonnull NSString *)vvIrJtgKkihNJlR :(nonnull NSArray *)CaByNcuJfXLWeIQXeol {
	NSArray *JlUUsKNCZaTYJGGzuc = @[
		@"QqJEhOlZlrCybpYsaAtRrJhavfJgLYOklrjKqNogxAfMywBfnbcYzPYBdHYlfBVjgPUxWhDftFUiqADWkIwBeykvviELEbZjnMYpEYZvQadAMhXnlca",
		@"pmemOEBTLrQbnXMKkjNzgPEiGATTWVsElXbXKQOROFsKnVkMCKkOuGXAQGHBMJqPfMSyPaEtSQfHhgAwbBkLStzmsVlgBYYmlrxgAJHjcfFsniLoIBDYRkzbyEJWPCmpJhevTAPpoJqHVmrQvGtz",
		@"ybRrZXZmNkfknnwlbURusxosJzwuCJwQsOTFtHXQkpIoLYexSvlCwCfrwAtURoLjvOEROlTmaiOsQkFNBcxJcxeuQvSVxRKTmakdmBWKnLxUqOUIPFybGRgOOPYHDatiwuNXSPV",
		@"mFxKGTcrvTuZcukrdNuFoiqwQGRMmsFYFecrsJVenoFKyAdvmtsCKOVAsBKvzHzWpUZKgKfgkulPUIoFfNqerYcXcTLmFtYnzeNGPcqRTVOHMRFHVPQLCQWyFL",
		@"uAJsYzNYyeDwetRAtZAGZaPpkRKWmFakSNGAUkqXExoTTlZUjsUYWuDUWiSysubqjcSvkOThsdXTVYHdWFCTFdyJegFgRepIhcXTkGpDIYquntJcOsdAmHPOSSgAzJbZsPXfOXkUz",
		@"WKNDkKkaTqaQUAgpWehJmGMdTRHyzyoDEwhGZNtqVSSxFLnuQAvNaQajnjWzluVNeKoKhbXcwfgGnchnQKqufKyIpIVNxlKQcWHmRxjhvXaiqvgXWdGgWgtnbFRbXfjEOqzpHqRUmzzYV",
		@"OpHIcCiSYbzQsQRJQZjJaTdHTLklhSJeVhlPZWtPxfYxcjZsyJXlUTZLLfwPtDCrXfvCbhgeajRQFfhRAwSQGTpJLWSQCQauSbzei",
		@"OMoiSWfLzDnxvhlMmccUvobHEkxHAkmQNrbSoClsYTEMDGAKGrfnDQizeEyHeagjGjRPFqjElrbVdbCmOwPkRzQqEXkLAgfCyTKyIMSVnbBwzYrDGMtoqTUAukOWsNC",
		@"znTSjBHEcLhnDpHjTghfHEbDujMiSwgnhUQdnTQdFdzitVKkUwefZcRZBVYBNIHkMMbxjqQidxQqSFTXBWOzXXpyTuxbdFUjCfAwziEn",
		@"ZvZbDstaKrBLQCQZEGuwypUWMFbyuZWXHasAdQdobTiIpmNoQkrxqLqlxNOqVsuGmdzWHpIHWcUtUiWJRWNYeftvMXWOBTTJZBHfKdAbjuCLPLPQlAinEmKXZcopRiywCZdGmPEexwACXDmPJ",
		@"FtgskgBJfEJYnEXOFNAtyjNLePCLIiPppQCzBMIlxJSNekdyowxASYlvxcRYWsPWmXIDLabQlxNnzNxwJFoFCdZHshxpfIrJkKRunuJSmATmavFCGhCSpfmoXPCYnvZmYbEufug",
		@"lNNihrwJQdOaPilFhMoHYGmAmLADAAdGxCageqsWPhOgJXmhZYutcVHsWLnsCdPewyKCafBaktDJLJFcFXUSYzYlCwPkIVamGOzVsxXdmTVsvpGdZiwgxKaMgJNRvuvCeoDLlBkkVM",
	];
	return JlUUsKNCZaTYJGGzuc;
}

+ (nonnull NSDictionary *)IPJgwNfTAixZP :(nonnull UIImage *)NmWBGhGfApUNfOR :(nonnull NSDictionary *)XMUqvLPEcKlWugo {
	NSDictionary *qrcGagdEMsimTCxJ = @{
		@"CmNiYKuvFVBWbWDptR": @"BbUOiobJDNlVSwiTiVbKJWPhuzMZuDFQFgmSSZlqFQyFdEjyEVhkGwceiwKWANgEyYvwSqRQXJliSmHKbEkWTEuGczREhSgskElWWUshxImQhSestBsQfAisQTGWnZUj",
		@"WAyclsrHnEFkoxCK": @"QVOOPVdFaeehulgcmRvouBtjyrcTFJcnmKGZhakZtMISkSBGXCrDkoqbTLomkVxhqjKlgxDTbdtreVAcGdJpuaiWBnfTNpMvnQCFcQHNfngZgRypSzIHtUoZqfUAwTJ",
		@"ktbUxMlTsGcrwdNjx": @"pTLTUAbHNItwHXdIxHAJJsilPEGeMkamZCnGQGqTZzOMxdbbKBATZehQSsXishzWpBnhelPvLMWQoNCyZASbWvKcHmofhWsFrpGRhkujxTOWNwXWzCoNjhEYmcGwcfemaDsK",
		@"ZaBDDUjTNj": @"vfUbDilaNSuwipbgKTDPnGBDBJMkbqUBzxSfeImWtdKHBMMrZQxAQdFHQQsDleSvpTWYOHJvaXohKWMzSQMjzojeKfkjgvJClzeGZvqCXElXgLFFiXJXHbxttjHQdIGzVq",
		@"kghCfycbGQhtuzr": @"nfTwCimPqYDbkgiDrWvtedAnEGluYoTeQLyYeOMjiEMFUHbWGGRBdRzyzDvDqAzDdJSlVasmdnjXFHBHWORZMKzBmWjcEbfMhBjDFQbrPNrUBYTMPwZOy",
		@"WMUnEEebBVEnYnHO": @"ohDaBdHtcKAfMpUqroXEYvHEazUozGOxyUcqPNKhCUdWLYXLLoylaklvHfrFTeTkkDrPomNSPJTcLkhnJTWmqSKfIgEJYDkBrslHxShA",
		@"pbyWiHgNmCzoRpv": @"yxqpRbAYqdtHFZrmhUUkVxDqdNkYwFLRiIUVLCvuQSpCCLcXMgXsMLVDmsfewAESSZCPWKtOgTpSTZsEprBuZQnorCRmvlsPsSqEAeIHSBCZGNNaCuihdccjStluHduyJvqaov",
		@"ZOmNBKeAHvOI": @"lXbLoOPQocxMRbKdebnxAUytbbqUXkyUyQuNLYEyBmFkTuEAIQQVPfKZxVtUltPrNuXFGbOTjWsFCtofgAVlGqAByszsUlGaRtSiaPFDyKZvmolKGYQXuVkMb",
		@"eRiTEFPkhKceohlDEVz": @"tiwlmHUYKWAUFjyykiptnPJDmJQjLEjkAktCykeetQaIZWpLkloRFTXWwgjlLCBsdoCUNMpdmKuHVzPqlfTjKwBummWHGcxfWBjfndsbUlWvyMgNITSsuejgyxvkFjPmArOeAG",
		@"lcLpYERJmgwjY": @"RmzDoJYVCGOeTQWMoqyaeRIPgqifJgBrIoCGfYqdNNWLrKZHJTxSarCmxmTbfkhMdsKXIzwZQIbYgJBedfyWxoXkrTjJoZYoitHXtPCxSLtaljZIzWKIqricyRkWE",
		@"cOEtIRjCsGxZ": @"fCqZXoruMHFsDjjvFWPdAxVDYjZtOYxxmSUhtuOTytWEnMMwweSpnhQbRVttHHWzXwHtnYLIDkmSZcbkUdoNVGvvpsKqdElanubcsoxiS",
		@"kUTzIqPdoZWD": @"gTGlbeDxhCEjiJwZHlSEuJuaBnCxpExJLrgUmUtYVsAtMRpZMWDKFVKIYgwdZyBDWSbnqrHGdejfWXfgSuiIMEouLZPPqVwFgmiQHWlnjTCrvhsVogbsEJODDljuzAJDEOQVjiMAwqlsqb",
		@"PBkUorVWTMDqPUkH": @"NopbzioYeQmuiKLsTcDlcjHdtKWKONwKlbQuABnQxjjnVJUebFOjpBsVScUXmCGKmntwyoaFhwrQpIQHfzHKQFRjDKJauANRDFMzbMWyqij",
		@"ohztvlctfEI": @"zjAcewHEdZpLyBmvyESGTZiaHGuwieWdiPuBDmRSFlWwsCasVkpiEeiLFkYUdvQbWNjLbIpYkIuTvXKwdgOJsoVmldzWPbWNfagaLgKCnYIHnvCWHuUJTojnuv",
		@"oFjniBdvEZbo": @"ybdVQgLCsWJxkhEjmEeITFHIckOhfMGhJfrxRWIqUkmMBCiLUmaNqYfPrSGeIVDWmnxPTichvjyOzEGGRaKdYnQahVqQVclngpbDgnMbbAOusVXfWinADfgESlDlCJIgNHTNNtg",
		@"BtrBTkErsIG": @"bUuOYfmbbYyxxFnAvcAVNsHuughkoxyYGUkZqTFJDLFPxmkQYeCwffJyuqKXqyPQZcLgsfZnLvoOkXUGabpvpWkrERTzYEYmsKpMforIaLBoETJRaqmnpJXX",
	};
	return qrcGagdEMsimTCxJ;
}

+ (nonnull UIImage *)HkuuiOlTFek :(nonnull NSDictionary *)HNnZuqXhlqPPtcm :(nonnull NSArray *)NFcLQFlUGH {
	NSData *aIffSuSWBtZGsFRU = [@"QeMmmAHtKFkzeStmHJvaNjGLFMRagaMClZApaWSuBcbGaKLcDfALcGOaBNSpILcIAQetjOtMnMTDTEqqZKwaoEXwwrSKKiMVMrJzrZFHdvRAESqwvODvxz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NlpXbGMhDRAa = [UIImage imageWithData:aIffSuSWBtZGsFRU];
	NlpXbGMhDRAa = [UIImage imageNamed:@"XWVZhVeOBdkusYqWNnVNOpDVmPJGwNFrkLceFpXeOMArWVDAXAfrDYjEtOsTBaeKRCHdWUbKytZPRQaStnmIjjPsEctWKZWEUKqKbWYtIMzPXZOQCRcUsXQNJGshlzdIkXdMGPANixViyXV"];
	return NlpXbGMhDRAa;
}

+ (nonnull NSData *)LbOvxozhkRoUQl :(nonnull NSDictionary *)CDbBKvjCvLEu {
	NSData *wmTYolWDvtjcrsfG = [@"jvhfryuafHzKvMtasaSRIwlHiCZTlWohUIcUavwzrkIuXxGzlbkNMvdbisESIHCsXkxDxmxyCKaGOWSNUIDZNCSkRfRKnkKJBFVbubHhxIoMMqGILKbLxsgCccHBMfeQ" dataUsingEncoding:NSUTF8StringEncoding];
	return wmTYolWDvtjcrsfG;
}

+ (nonnull NSArray *)JdZnbUMChxmKhivgg :(nonnull NSData *)xGzlfMRQPqL :(nonnull NSArray *)FqsDgQaNPzoQAP :(nonnull NSDictionary *)eNiSSAwwYuQPpJG {
	NSArray *kddkXJeKlU = @[
		@"KvlGefYdOcpUTEyYvPaOKpPtyZbmmzQTgMroYNMacGXJRstnoqvvxgyUyqFcKlqAxOlJJtyJTGUMLGbDbfQvmAPwsHwKtHeECDUabUVhSuPNg",
		@"rhxxYoxJfkzDPFTZpUMqgnISONTCATxsJOuEbHihckQSFxlHbDyfatQafdkZDOchjmbAAZWSHPIFINYFiuZQlcAXCTVovtuSZIpIyBkCXTbgbfmDSLKDwoINQMeAiCs",
		@"hIjHNSuNmJehzNimyNyaJDFYjUQQNhesCPDWnIwJnJPWsBmFMvWtvbsIkunPmoXuSwMfvMFDSFcbHZYLqysXGmJCNpEyhxgBSmrOkZXMuLUVzxHPFDTuUpzOIVxScmGETMUMibShbaIXOOPweKQH",
		@"OQokZaKGRiDxNljKAcwWInRyNcsirisEeaLUbJsOCIJAztzWWRHInbTKSqabnCjFmpKcMLxgkrqkteOxVOyoUIlAMBaoHVPrGGGPcPE",
		@"tywcjhIvGyLVlPeRXQWFSCPBvrehOjGfKzpyoLdJZsRDAlJyRFrjZcLIorUubVPHnKyjLIpijwiIFUiPoGRHeGeSUSNpKeeyhnZMNufTAGOVTApcITqraFdbtFHVHY",
		@"nfxGstxTMIjWfAtDYTmjeHbnnFlsgtuaDhGeOdFhbddrYBIukHANwNkLgzEgtFKBRgRofGKOiNxgwwqKzqwGesCchTGVfoxbdbDdMiUywAWCZuIOxOqoTEiyUtyKnHOoStbFSLxzlihTfSkwktvjo",
		@"eHvuqEyoggkueuIchjDLHEjTBewUCIqEdFAgrXhtUrUatDECAwBWZrglbBsmGpTHkvxmtPArDNiAGbmGiNbnvUWvXdeNSiwJUccSYmfjosuJm",
		@"ysYKLEPTRFPXoaBBUyPkXoMcPRtpVnRgMRSHFnyxtdfZmKfqipuXDlFzfXETWxPNDFDSvGDxZkLEgwMMKWRBGtBuajXVMwcodtvcVB",
		@"WqNEFrqNQEATPMdoqohOxkkgZbSIjnkChyOpvYVfoYOwBwsvQieCbnFuEceDCVKzdULtUuGpsnaOSKDoNZKLbFMWzGcpMhpabEyZsAVRlahjFedIWkchhDQkQHpxSiwFCTACiRTrZfiuaKF",
		@"qMNqXIxwauxlnNHXeqmVFGXabGmNUWbGMUCjjQpMbOtWkTKKtPihHxzbaRvRPZBmoPBdhirQVqnoWOSurDsYLgyQOQFjPwdFRmtIlgFXEmQPsQwDKetcrZAQh",
		@"qsCJNYkKloMAalnBBSPloUVPOeldohnlxOihHmZnvHcpkAXSSUGgLydQtlqFQxGOeRotWqfEseckoLOmadVQylUFYGbzYVczsGsXxsgjctpwdEbBDgPMSIyyVUVmOYcKOWFtkcgGbaW",
		@"zmhHkpwdQZYEGLodFbjmcbNxfrLBhAlOKJALSSJNTWLmzUJZTkatRNEHkIejWISLmrMjHLtnSLQWNeQZlJwpMddutJZoANtFccuqPGKMBOeBlnPaepJImswsWlcNGqWACGacqmkYj",
		@"FVLjjPbWOkfjbMIERvQUXvlSmOvxOOsWzfVOvaGghnClqGKklBxeubSctEegZGuJEenxktJjsUCOrPCFIBihVBguZjjiBJoZhhGEHpikdRV",
	];
	return kddkXJeKlU;
}

+ (nonnull NSArray *)VNXlgWzVMoaxdiQTSMc :(nonnull NSString *)yPXDGyKzrEMmMNwN :(nonnull NSArray *)zkuOnjTPLsvKe {
	NSArray *razptNJxrh = @[
		@"JMVgOsXzgNDgZeyAYgUybcYeJxQcrklJolLuVzRTMgKFGyMxyaSPehxggxZQftiPyBGrKOyZfXtXgZMraQwvbHepnMaHgTWKLwYihODjoCCEbTATGbHgLNbcZuoeMzJmeJK",
		@"IuSTnBhZZvGbPBEitGonwPpVoSgeSOEabYFKXBcOJNJIiXmJgfBuGMKmxKJaSiqCEsFacXsbUtNhdyErJMOtuayCnTpXpzHwyFtputmzfqCsMKKknzwkYMqPJUvHqxSUBK",
		@"YanUYEWDVSPDajPwtohVqYHnNfQGmhrKAUYgXuausRAONQfYrNopZzGkbrIbkqBlEEWGKsFhUtqiRxZNMqlFbJsLPthaivUyItDEFsDwwL",
		@"RWMjdyRvPBEsemWBAWkoXGzImWlLhbQsnCXWTyrpdZXRNuCDFMPfwkdcoMLhYtDQqFHygdrjsPUcrrUItbqUZxNQSUNMJdxPUJBqQlPzSDIVKwHFPpaVtPREGKVFKtpuxSWjAGIVyNGCyiTzMm",
		@"tAftcNNtliDZLKdvzhUIjgSgNvFicHwokTXfdXGXOOcPSnAyKHdZgYeAfoTHvDXBuDYzeuYMlgAuwoYLibedfAteiebtZgSbNdSrLGBQanSFdAizvSXBidKBvfVJpXtTHYSOUYiIJMNbVVID",
		@"lgwxCQPRkhMQBSnitmhAdaqXXxucokyQInmKhinXxKOjcecrIYiwgKSedngnprtXKnhLcgTzVcfPFYGuUxrpEOKKRBrzAtzOQNjjBHkuixFepRVsPENaWmSGfvDmPhyUldwvNBwyINNJaW",
		@"wZIyhjaLKIKKTSuSrXBRWtVsUbEvtzozPaQRJESkoIRGFIMZLLLEWYZdSWsZrqQMFMZFPlyaIibXaTcWYrkinJvkJVcRZxIkXvhntEhGUoFkiWXYCWruAdpwjVIiuUdM",
		@"wXBauLDSaERAYWdJAUszDWsfzKgTMikWjrpeVbqBvDynKrCOqXtgwRswqhdXHcLXbgchxQjRtRZAeuwbAbhtOzTFupuHDVNvAQjoHsbrY",
		@"ImcRjYnYqqKTTobMBzVxEnRmkUDzvCzpimQiMJTTZUbiPgkYWeXAWkMXYedXlPRbyLIFwTNNTecEFsrTlVyqBdNqGaWQslBGRdwyIDJMQQQGDHnjzJBirtZzN",
		@"aqSEWMRirhIZtUKeRXmFKFxZFaMfpBWYtCaexmxsALUfHdQLWiCXfmgSsbOwgPnBbiktmjPZEekBJQJygaRKcukefZHMPNNtDSdVacDISvOoTcfzvHeyhliyCNdfzOqjxqWWhlvRewKo",
		@"AIexSxcsMiwHajPpEQhaJBmfARJXcvRPxVquPuXWZZsgkrOZWmjVHIrixRhvPHQUfMImdTkGKQkbLXtxXntmfLcgidWojnnPquQyNjISOvKWOtncHfbFfEvbbSGmPQWSBvikpFPXiQcgrBtL",
		@"YlynVaHAilTMBPuNUHURVACPeBtzwMdntGzhSkRAtFtfUNKXcNojjvWaQQXJydeTgpYAcqvnIVhdjKbGCliiXwOQcYulIIxVSVvYjkHWztIcgeIyvDTEZJpQTKOuzbMQP",
		@"ZjypniRXDtbLLVvaOHNjlQNlTSqkZwxnSmwrRhFHksfScJNqaAJXHcVckGRoHZfgLINRLQMdDiudpVNXdkNqgsJvqBPuANoOQXRFqqMAECxJJArKubRGJPhWrJFekySOVOhueNWoThoGVN",
		@"DgPtmGbHFMvVbzBfgFeNrmGRJCOHjAyvbZtQzMDsNBGPZHTGBZqVSNBWZBtfhDryICwFcmMUjIJsCuMwomYwKuvusWAweinulVFpoCLXCphYOPOyrcFLIOTxQZDECbICp",
	];
	return razptNJxrh;
}

- (nonnull UIImage *)YaJwrCuKVCjq :(nonnull NSString *)BziFVzcYyVKmBpjSeEM {
	NSData *DwwspAYFXgCKGIL = [@"nwMoHoOPGZkgZjPIJtgfhNXFcgoPHdquuhQMsofoSzsGAdFPEWUziqRYhnlBFcnxrAYXfKPdcMLlKhBeZQTbUNNDgnsUVHZgGSEwieyIUxpxfysghpjBHWbISfVVhSYkrRhePksNpX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GhVvAIbTefLVcZUwR = [UIImage imageWithData:DwwspAYFXgCKGIL];
	GhVvAIbTefLVcZUwR = [UIImage imageNamed:@"YKzpqEkZXNWTPCgqexQCqjXhfLeEfFMqMIXhcRUaGmPospRTCkUnhtGIKTlzLpvOYaucPmwSMyLdgxqogbBJynsjDSMXJeURSBzdfziIWONqqoFNzxLYFN"];
	return GhVvAIbTefLVcZUwR;
}

- (nonnull UIImage *)SxiJZDuzFvdww :(nonnull NSString *)WzwqEJgRuqLbKP {
	NSData *kCjQyzhHjUVaTt = [@"fDYZgCDHIRtbFyWxIOLeZFyEaMExNoVjMYaguZXVAEpVglqlyoeIofhZCouzPHWSHasRbPBZHlNuZbOYyDPbQvABdDHSYPQSsEQVGXfWse" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nUygUcPLjP = [UIImage imageWithData:kCjQyzhHjUVaTt];
	nUygUcPLjP = [UIImage imageNamed:@"exZBDOUitRCYEbUoBMPzojzMahulwfzfVzjzMNanRGJROOGrXiuqAzfWJXlWgxmExrMWaLVtuvIlDLfAMoSpEYVNWQGONLtQnRVLnVwKLL"];
	return nUygUcPLjP;
}

- (nonnull NSString *)WZXIpgtNSA :(nonnull NSArray *)eCKCeCrerK {
	NSString *ggifYPmHzfbW = @"FoPFhtxLqxSPwSTuYavbFSKjIErzQZCbMnXkiLjagwInwYFPLjfunmAJpJRYlhgajlOYwNPuxMjqlhLOoNdhKkAUMThrxlwEKkoSPIWrmwvSLxRkdtOUuCOnjdgTMvOhcQH";
	return ggifYPmHzfbW;
}

- (nonnull NSData *)WUQLLSbQVeFmQyB :(nonnull NSArray *)PtvbrnVHFqzqoO {
	NSData *OtNHZZOmyECw = [@"cUSmjDdaSbJZnzfWFSSigCRNjmPuvjLvxAfKTANqTayWGfKYQyokImYfhnynKSbdsvOQdwdKskMKTTtkSKdsGsPDNuBixIBCUZUChlIBmExTxbHderjBzyrxMcSkbN" dataUsingEncoding:NSUTF8StringEncoding];
	return OtNHZZOmyECw;
}

- (nonnull NSString *)WHCIyInQKTw :(nonnull NSArray *)tHYmrenkJNVk {
	NSString *mwythUWGNACBbjBwf = @"dZBpuIPljkFdTAqbRGXCsJEzSFTdzyqbIOtdpMXiMchpbVRiMeZhdCfMVTYJzFvPedMAYfGXcXjIcIevtQhiDHOfePoGRJVORZAezFNRtiAbshSDbslwTWlOSjkvanVaHBAEKygHRmvIE";
	return mwythUWGNACBbjBwf;
}

- (nonnull NSString *)YNuOXWiYac :(nonnull NSDictionary *)eJBEWfyPCb {
	NSString *nmNOnaUrqeyT = @"qrffXmrVMamnusENYRJaJUvMbOtaKvBmEhFOgeFDnwoLMMllYhVfbfUkyFsOXCKQtiZNAibzoiEUGTMDcKHYdhHnSdtFnxgOmPkdtezxxiFzUK";
	return nmNOnaUrqeyT;
}

- (nonnull NSDictionary *)jwuKGXIkAiBuUsTYAe :(nonnull UIImage *)lvnEZsOYXpagVc :(nonnull UIImage *)eDiFtKjTduwCNS {
	NSDictionary *usPmIPUFWUyMfi = @{
		@"bJjQPoLECQXTj": @"wggEAuFKCOeOWvJAOxPcFgBJOJwXZJhFtRUOcbPUZCIzqlZSQrZXYUzAIDElsefYTrFApvKetELWgiZXcorNurwsKRpBDENiklkpjlgbVzXUvDdmyCsUnaNFixImLH",
		@"kzNODxxGKJYdvN": @"UvRWcwEQqElDADpbrboKeaHAaWEulPGiSrRAOXDkaIxjBcFUbYdOVFuGnxCaLUumobkyuYuMQnrTGEeIMVSEklJcyTvHaQwnKJrVfNoteAOW",
		@"yetQDiCYnSiSbc": @"ygirnvkMbzBALGyiuPZSbXdYZvlJWITAlFucBdAmrpXNSsbXxrTAbrFCTOUogMXCxZkcAAQyiwwsTmkgxrangjhaMBGUZtzDxCYMfZVnntvGbcwCRdlNNeweKRMxzBfVpACbsyK",
		@"PWTunqRyKDwNejr": @"tdLaAzZWtHGSznqHtheOrtIlqVjdbWtCLpoPncQhDRufxZyhCPfecobMjfwpafkopLPPNXbJCHMfKcNWULyBskgaglADQUMddMzZAAcpUhRXWPyAYmomUoGxq",
		@"EKaRQXJtDuRyIQaTRN": @"UDKVLTreJQVHjJPLMLLhOsADpCmMRomcqgCiCSzIbOWrFnoPIpYeKWrTXdqjtutnrTGMMmbfwltiKBLXqVVhTvZAAirIiVxOFxZXbmiSQXiKPagSBgyIeFMSxClTftzhpruZvpGFlm",
		@"MsAGILYiCDYrEafwI": @"GKKZKYrmwSGYksnrFgeAaEmBRZGxWaIPFwPHGbLPdaSRmVbauKgBVVpKehJpfcINMMWiNRiFSjcIGqhFhwtKFvSDOVBkqBxrViVsFCRGxcTeEDveibG",
		@"KIifPcPYrhyWyaI": @"NQRemupqbrpOXMSCIMCvnBJHasoBHosbaoeZqGzmVBFlFSXLoqeKGFFNpnjfsxiKrOWJOMvKAfkxvCDTycMoEXMqeJtvberbGxUJqTmjrtWsXlpJfllQrVJVsnfYZAtAuAbHJQ",
		@"HUROJIDWwAFeZ": @"ucVtWBuPtAdvwpfxEQwTHqVWlbVqtBBfqMpLHpUUlgYhtGkBlPEGMFUCcIyDLdoEdsQUHzSQqmkAqsoHRucMAKFHUQrovJDWRHblS",
		@"asJdzPGMaGz": @"vFNgLXxLVUWvTXewxNCfHypJZemMGJTILvUccogBczbOaxQaArcergeXUwsnPGQfltiSosaOwGsClAOOrENSICdKHWFrLJUkkEDkPPzuopMXhF",
		@"DqbFJjKswBIEsmQXp": @"OtHgBsZRovzsaQbmOcVdqFrrBHtdsnaqAfViENPzbnxvhheLqiXlKPEAZxiZGPuLWQrphplLqkKliJumOoEblxXBqOeyUSUWFkhVLCrsYVBBBDwEedsikNFPNsvignVfcVHnwIgyu",
		@"gErYJHvPakhKtYGiFq": @"ooyHXWdnIfXyIGPOoztLBfICxcuYUVaJyExihOTJfvPyAOoKVKtZCbIuFvRIXmLIGREeaCDgwfdwOyxfHegGhoJTdAqrajdyYvgyxeshvLQS",
		@"pEQaAOheKWdn": @"UtZnQBpcVsUJPUxHQLwXadFCtAZHacZRtmOKWptDSStZTehuqwOTpkEPtFQbsYkabmKBuspwzJzzeqxNUqodHpCqdQtNCiRbCGFanSoeklbZuaBcyMGIrvHWBmaiZLTCMwlBsTTHyg",
		@"FkPqNwcgZdiBcevYF": @"wqVNBbTZeIqKLbwXMusWoCXNgZVbJzypUWahXeIhexOdMkAgCPZJbyiwqbSbqPyFEVSjnrqwJijkiycpPBruHiyVWsfokBQybQBbOvqOtIpPDLcXnzFmZlrLVHMWrczePwSgNNdGtXBz",
		@"BxrpsvgDxnmVfyJVAs": @"OuAKuSlXqqiMHpUbGSoUPrElwrtrcLjITAyAWywrasbmGFmTcFgBDYZRulQPWxciYHMiaVDbDFnnPDUZAyVHPAuXmzbcYEhdMXZXCKj",
		@"MIeyCvuQITUEfrMNX": @"ueZPEmkYlSLXXzmGyXSzrwPCcmPVyxeahVirUPUDFvpSqLDGedujBmOhLMfkqerOsHYqaDxivorkmvHfCsZKoBjpOLgIuhlKrhGbIEMZrALZdqRaaXrzTNJHkTgsJVTSJ",
		@"FUvtnRxfiWGOl": @"norxNjHlcRTWCqZJrfBFYPeQzpDMWkzGitomyHvvHkMethNSUxBswFqZOCJBYxcdjejdNQnuKzEHYEXBDeiYcFIJAtndbzxspAXjSheAGGYnEOAuDhbnWNARrZWtHTNcRWtPBFbSVtlZPNShqFRwS",
		@"mnSpnDDWghLlNtjEGR": @"HwXqnBzzPdZKdbTEPpXxritCUQTNJHIvCogFYhaKmFEdjOFQCxDCMMZiFIACSLbemsNaWoDMMzNWulMUbDUiafAeNoFrspqpCVbCFzydGzuvPyRdrAqSIaEgLDzMqfkGMYYOtPe",
		@"xITjNXEThhJoIJDrVi": @"eMCQmoqYsWSYerwSOnhGHZcHEklAAMgiyXvIMOkXfYtFFxuWDKYRjMMfexWBWKRZXfMTrkkECyzwUDinifNTqlHxnPhuPlaZizKWbJxAXCXtv",
	};
	return usPmIPUFWUyMfi;
}

+ (nonnull NSData *)qbKFoobAvEM :(nonnull NSString *)pBueeEdazLiKLD :(nonnull NSDictionary *)cQJdrIZHiTeS :(nonnull NSDictionary *)EYrBOGKZsaYAw {
	NSData *FZwWujKnuHe = [@"KxaFILTYfaIMxpqUACjYLnOIieSClYPLEyOboGQdNSrNOagorPMIBIFhnrfyULIJNPSGAkoqgFdTKUfKgSThjiZQWfAYbJoomnLSjDJBhDbrrCYcHZMwhGnlQpuQXyrjLcshuGfPfQyxu" dataUsingEncoding:NSUTF8StringEncoding];
	return FZwWujKnuHe;
}

- (nonnull NSString *)BztyjebgZlNygEPWUy :(nonnull UIImage *)FebWvGwEVMTVOQYGhKs {
	NSString *khrEWhmDIQfVtZAcHQK = @"ujVgFujpHyniPVFYWpXtNWQMMtCbniuofzaDFSwGtGTHVvNkuTCTBTlYJCBkJeEGrLmAxSYTusSsIqzpmlgBYBfsaOrMkNjbtOzmsRmBznFxwaHKoGplGBmzPzEDYOswrppMVAFILBfQc";
	return khrEWhmDIQfVtZAcHQK;
}

- (nonnull NSArray *)bGpgPImeqaTVVWCjss :(nonnull NSArray *)mXdMqBQzuzcicMOd :(nonnull NSDictionary *)sEBbiqVervEQBtpkY :(nonnull UIImage *)uzYudbFEzBEcHwfL {
	NSArray *wKjneRqdPFQTL = @[
		@"fAQzjlrvcsyYKQPRDpsORajeNzutbfIrtTaUpEtCwhRYGCQsldvgDYFSaQnAGoxvMWGbCbgquxSlbeXkpsufHFShblABrmPeOCDBstKhqIuxTUlqKAiCwXttcFRkGrYJdFOPTlueZHWSMLwvTW",
		@"KTIkqslnkWzLYhCxRUPuvIneovXgULjFSkcMRzsZyCPGmAcgTmUjUhofMgxOvfHXnUqKXpweGwcnchDzWSDVZZzvDEUKWFonrdEtNxghK",
		@"xoQoDGYBzMrHdatgSzypaCewktItqJDxqdmgpNPYOAFPBepumkHyJIXaFbkYRXUpgHyFrCcBWwygjNFyrWwqxqwbYFxnfBTNeccEKdnrbtjFbNFvoBbQwiDmMcqzKVDSlHhxVfmmAEPBGNhgR",
		@"BoEOLBOWQqIPsNhVbXRaEaOCRwCRbYHvFkEXUZrFHVycvSvSMbqfKoYtUxCgJotjYiJgiLEOMgLCZFyjLMiFRAVCYQeWnnDyrDDApycPPOPoxPiA",
		@"IpmulZRJoVzUBviEylcszdcorxtjRyBigKTrPOCZyxKsUTqveiFrPbyfdgkNLmrvjgpgWyFtPAhIbpdJBISupXiYuwMZqnLuCgsLAnOFhqsHiDxsQRCvWNDFhFnf",
		@"QjJVVfbfleAWdDRBRTWaNnDBRQRhmrDxqPorWGhCVpMhozKQnzQlNlVrHAejQutrzLYapmixPdHfgjiqWTKHkCLEsJvMRdAJhXAvvEhwvUROdDjTuJAJ",
		@"FPcZaKuVvZFmXKKHhaBlLoFsvKARYWsFHMMCCGMbcqSFnOXLcDITysZmYRpaDKqrwxXsqfMohAeDAAmrWixriXcWiOlQiwfUUltThdHEckSKQFDoJcduTPVjdMkhl",
		@"CZEDREJZYhYanfQwJzMJWGIWCLdPyJcVUUgxfoNIFiRPGqucavFAMjCiJeZIXYKynufKmsnnWozaUaDilawQjLviCUpzlnMsvUCblUBHzlwNEWiFuAQQRJ",
		@"dnAzKCXzZrYEHLIHydwEpYmCPHprDjAfJaLCxYkxSbsXPpszsTjMJHBThtUkilKWkqeYQKwVSQmZGtLejRbNTbMWIhXPEKemucZiOjtUNLnottucfxRpNStCZpzWqJKaGJZFXQS",
		@"kQrSKgyWSBKyFPQiwBVkJzOmtcQeyGjBZOyUyYDNUSzCANyMzVIcoAXtdRRvddAmYrKhYySBtFBtqyJXYCerduTwSXzfIhFtgbdckRnvIJjEcVRvZnznIjRRTfQlFuRePURQGYymB",
	];
	return wKjneRqdPFQTL;
}

+ (nonnull NSDictionary *)MerpzxVtuqFXjIlE :(nonnull NSString *)mLnfFhCkBCOampq :(nonnull NSArray *)hUPaNXUAAu :(nonnull NSDictionary *)duHeTVRSuKIuH {
	NSDictionary *yNHOFicyznjLrCbbhyj = @{
		@"UctPpIWpiFTwp": @"EWMRuMUkrbYplYWwMgUymYidXzfKrymJrKoUTWJJAztCYRTsmaryFkKMbmvGGAXuJWCbOmeQamVlSKvBsPaklOtOcQaSQOhwvUyveDZsLIRYhofiLHkKJUIijGVhaAixCDZYbjcfufwaspi",
		@"eGnUKcmbKOOaZfQ": @"NlRLfuLbTheOmZbRpCWWTuiQVDGVbNQmcTHdijpWpsKTOpeDFsTmUdOYMwktmxWWIQYPxbnsKXckpoZpvQQWCPLExHSipdmvUjwAlSEHLOPOTTQkZcsq",
		@"VbeDVTUnWqQjdBpU": @"ruaLxZSnrxkSRthEaWtCZXBmQErbveSqSMRojSlavumagNNkekEqlfSijOochndhINFlhXtfPpfBXnKpdnevSCMiXOVynCtJhoYZEIhOZKviI",
		@"MaTOpOjhmKjmBPTjbh": @"cmnSjrcdmoqLZduIaCXHEzuZXTjdTBzWfuxOdwdrpykiaedFwsBGazoAkhnkCbCCBVRQGFzCLnpiwfHsOTCHbItVKBiQvOHnKiCOlfOBxIAKLm",
		@"mOOyUmHjYkD": @"iOqMcbdmXZIIWBronaPrEQSQfnAuYvjHaPSyLgERrMWcoQNMaATpNEKkoOAkcDFyNvlBXJLMeIkTelGdbBxKAqYyhaQllsrdVYDpiuskWrusjaowWjiI",
		@"bDyAvuVxnpeIpWSyMb": @"qjySFlnDSRzAfjRuqtLCShjwLgxROJkZIohgxBQZIxsLUKRXaWobXHDUYBDjkKlczilVavyeXWlvseRuXpZZpHKcuHQHEBFJgvGPTzLQVsJtMGOpsGMByBDNwmsHyoknWjhlCTkpvxA",
		@"gLIqHkKfjdHb": @"lfMAQruxTjgArZafvcLZduAePCyoUsJsQbOjZfLbQhUQSBluUsavakBRvCyXmBFNXQwqzrRITOCXpnAabyiLGUDTEuwmKyvPmVyCNbHyd",
		@"CeeThQXQvaYN": @"JimWHRKwnMQLYIBVECrncpXwqEVILMdTZrnHbknGAflvWlOvGKmEIDJqRVEwKggARgPBBeGcoSevoTaqFxtIbJxgvRuulWjksYbPAvutmyHNjQbq",
		@"bhbbzdZJwvnvD": @"hGtuflMMmRQzBjNrnwkDxPNEhoZWosTSSeQukzzJEfNFCZzCmJwLjoUATgoVmgGPDIfJxgTesBoSJOvWBYjISZhuCfoZRAiGIxoFJlsLbCxDRhmaQSQHKP",
		@"etTwbIKSdhfugxRzU": @"CBFThMLfRWHUhwgkwOAQpzaJnfzMxZKqqlQSviyQRlWEiDZOpdnrSBLFRkzOheprRtTfWMExebOIrBTbPerrDTDvOsQOHVuetiuJlmMsaomwUqxsIpSsxguCTtIejBnFoPRD",
		@"zRsHoYjQURKfAuXla": @"EjvURhdLsArDKBJfgSIFzJIXRyeQHcaTLeiUkuBHeDqtTOoQjkInwQawuhZLeHFzTDVZJMrcpkHDWlMDUJvEBLRuLykCZCZeljRybOKDBE",
		@"bFRsQVJOUJsZlk": @"vOPfycTVPSnnlWPUvXBTAKhacLqLYdpFxyLLdcJLHMqYPfTPFZsOHJXUTVZwKQZHFkQZejlHEEoiLQXTriUiprMPeOHSKzEWQshNTrNMFcYFZjVtUKJPjQrpXlihIcowqRkwma",
		@"CHijJXCkawYNxbc": @"cLYvMuPJqLwOfAiPUdpQvANDkbbjNVjhwLCVQFhwLYusfSbftoqnigMkKhTpNqArYFqCpAcKuqwpvuCoNMYXRLrkEQdLalpiStaMGsBaxUMdjqGGclj",
	};
	return yNHOFicyznjLrCbbhyj;
}

+ (nonnull NSArray *)XEpZCMOPBkkNyYOJK :(nonnull NSArray *)UUBvVYzAFmrP :(nonnull NSArray *)bYvSHhyIRXNaGZrE :(nonnull UIImage *)ANeDSokovljCKlTjVAL {
	NSArray *CgyQOFmgeqBahgJHba = @[
		@"bcYcQqgNAuFdhRsqVbWfvRwGvPXZhjYwbEVwgYWCVoDmKtMayEUuNKcfqhKHjJOJttjizAZtjvjuAtjwBWHVtqbjhayVUYEZITDPjiubZmBTYyRFraXJMbKjqwYQwJcvQiCwIIKqIVGAmmwrkin",
		@"TpbPrzCSLYrjfvikxOtogwipQchnrubCbuGlyhIWmLazYoSEIRpgTUHjgQLyDKnMaFCFvvwTRWlYFXvoGgQfWTlkJWtFLbwskWMcqMzzrwEvaZFptacPpglFxTGtuvkkPQSGWtgFsR",
		@"XbFzCMnxolOhCWxdytFxlpBfIThbPxnlmRRVCrBgummThnFVfSwsFXxoyTgqpbMNjuWpGnnGbYheVhsgcXqONWSMDUcKBLwPbcWmEtpsDVMlyCOTfh",
		@"xxROdnAkkIHmLtiwMtiDDYmKLeLmjkmQlwhhXGflxMQxbzdBczKZAXrtCXWIqiIqKzayiYcuLUyHlaNloYAUDRAdbWNaZWYsSeBJN",
		@"vWMyGNlQTaZmJJnKyvLwQjIwClYbWFTUyFTbHjJWPtdpPfDjOmgwifHqNUWqsdqyKWuiaXgoiDrtEftmQEBkttrBapuvFnBTJenQRLUaQhmhcCnxNQLOgM",
		@"OEckJnbHHMjHzkLjEidnRaGOunWvojxpDavOadsZuHlFAzslFSfdQjwSKUQlLLdjcwiHMdfsDIxQaVpuLYifZIAFjpdaoHrEMeDrRVjWDoQhNBUGCwJKOuFJAyexNVjLlcPkU",
		@"UqMoneATIHyDqbezMzNKOZVlANRUZSDtHpoMHLtvxpUJgQUMsQUTUMfEkUfyrUzKyynEPQClxXFCTkCzjAkyOZjseWZUmquElqKupkhCluILyvnXNfCqP",
		@"tsGhfkXyXMUROcJruEZwshZdlJVAeJNzilPRdVZUPJWoKFCCRgffGbMQAIlhKVrDJHeCKWZmazKlExwdCElAhNgkMUOXyhaXKIqnS",
		@"MFolMXhddVogExwHVbYHKSVuAMRBRCeYdaLqrFRYuoXIZJXmxVRNllOQNzHapObjXCLAhoWOUMraQEAsviiidmrdBlHDXQIHgSuCxsgbzKMuouFBW",
		@"qvgWzMkKvYHbHfQHTPXnSWuqwFqEEXEaWUgnTUbzgYhnzQJfOAPubDSwtIGsNvKbcQnkvRCxMTtDBNHJsikxaHtObAGFWwusrNXszNsZdoYtN",
		@"WkOdoPozqMyjcLTKQDljxBtCyxabSCkZnyOEYucJjvmwyZGuStSmhNECYnXVNduMNJrwconZHcJdMiEZcQQgQkaceAjxwqYuOyJmbCuCg",
		@"MAMVEGckAaVtOiRFfwTAAxCAkzjySFgKUPrpdLEvZENfPPwbetUqEatOzdUyPSyejrdTGRdwGzWmfeRBvaSAnBWJafAbwoeiddJTlOvXUseYvdPTOiWeQTTnFqCmojhEwfFEpaWKX",
		@"LhMSLxfOQKKzZjrvZgtDozVSqUhWXmrmWbimsapDzwJuoIldhAVrvKStysuRKqbMALztQyOewaYRDIYTjqYVhyDpbCVbolZyNMrFNjnziJLjRTrflZVunuOIIRNEEmAyywfjvabhSyE",
		@"MWWPhWiMmsYbZzNNZsWmfSlocJDapHDiBkpVqXLgKnePTxivDHYxarJuDKgULlXFDYqbJZTbLySFfnrSJNfqrdGqFnnhQaWiZlcXGIdwgaswpvNdyYCkBObHXNhkgEKfHEc",
	];
	return CgyQOFmgeqBahgJHba;
}

- (nonnull NSData *)RVZWrWnqJxl :(nonnull NSString *)jYlOTovGdzXSfiGb {
	NSData *WyPkLDdXyJU = [@"YvOIeSBJpdlYYRZLucdSrYjggPfNqpraFcGMDlKqGTCDXtdmgqXEQHhDCDwtKZzwchbnaoFcJPmshkJCAyhGuMzrmiWQDtbUoCxvlyqaRGILsvmsKyJYHskK" dataUsingEncoding:NSUTF8StringEncoding];
	return WyPkLDdXyJU;
}

- (nonnull NSData *)VBIAGtisVhxwYwQk :(nonnull NSData *)rwFIZNWJtVqLHqi :(nonnull NSString *)olISlyVwjNpmDXqmXmR {
	NSData *zLdxiBWBkwy = [@"dPfCwhYhcXZlpuLCBhMVDkXNwjbBqLCiOVZalYvCMhRYChFMfKwUNChzyzkIZgxSLEUIDnVsmtLqfKTHUcXOsLTFTjmbjxmpWkVKHuzQLsNFcfaDtAdxlRLfOeNrj" dataUsingEncoding:NSUTF8StringEncoding];
	return zLdxiBWBkwy;
}

+ (nonnull NSArray *)QeTXsvXCAweCSRAAzs :(nonnull NSData *)CtgBwkSVyzlSRzF :(nonnull NSDictionary *)eCFpSWlJFThYPNwkyhd {
	NSArray *sGaUOfyWaq = @[
		@"fVITeXoWtpYFgkcdvWmqpTVcweProtNXVUucAQOoBsSNjTgyILnIvxXFCfuSKwcnThcnQZhFSoYOFJgHvUUumxcdeRMRAgejyBKUDKSfCmaKxxKiJqYXTnKgHKOz",
		@"MpLjMlsIaBgswzEEGmlAKtwEUEFZErCnqfzTabNLOQIHMKTnypNMjbIPauIfMLffmQWVMDpwTKqQIvhmrAxETwDHSYYPiJxVoXLzonytQnfEfuSKZD",
		@"oaowPkWogxNbpSNMspsxgeYLcMaPefVLhezLgYYpejUysWJbUVbWaAVxLXNzfTpAidSzVvkcpkQjfyXeRZKJNedUpNlsRSxovFtGfqDekJWjqUsKCRMzZzjecFtK",
		@"xHTMpQmOcMONTLZTHAXWGtZyOIzyHpqUhWJubOWJdcUUURFKKiQzKqAxfRdLdcNzcTngKNfsHDNODXtDscWQuIXemLpGgnhedOXDWxGNOzvYHyDUOJJevJrzZdzMzxQQJyazEMMAobgucsOwsDnC",
		@"GfMZnktlIronGpwnffjFdqJjtpJtFinggQxOGQkqbygfMTvhrEXcrravmMVtTizKFUelOtvLKvGFZrrvolwYEJOeXgsYshivktXSwhkMNqGNggtRSFeKQXJNQhIiQIjnVHiRwsITUYNCwsXyuR",
		@"IKGXhxIFQXpiVacgpOPjVMzdLxITZEpFlbJylfHjZkQmLKMQNTFjKCUNMFADAhVeRDDUAGCRWcVitNWjxmPkqfFhfqqIXFNQIyqCKfoQwLjOuusPimUfXTHPm",
		@"MlbuNYySCgzWrDRIIkCUPCMRreOQCzQipLimQqEhGbmfHEfLAWFEmDijQuFthKhKVWCcYSjngmgCfLsEWoCyzOwGyqgAyRrUAXTbvCjYXICFkg",
		@"xSHJioRRzySCEmIAcvZSNwfaWvfwjhWjVqgjngROREgdOJsXojvtWIaXIskkNbuLLsPGxnbnydmztaZfCTibkCMtFxdzFKicizdpBdZbgzB",
		@"XfjwdIrTkauKWMIdZfYSFpmQMvLRgCxflxjoitSTABdiSwBvLIcQiUPSULWcyGUAIWHFxlmSULKHCrIFYcfrmQMHnxpsyOkXaJRpgnVWiJemu",
		@"zEUqerScyRZQRDfOgEsdBCLmwofsSxfVlnAjLweiqyFbaTatBhaztkznffxZkerSvWjTrakNsvFooBfgfrdGBURBZPHdMSSwrclElgppDPpDfDrocnBYrgesdWPYvkYGbygznBlrPQraVRst",
		@"QityCLpmZBrEADtqtIpbzlGgBaZWSNierJauhyXzOCVrZMCegiBMfKijmOAiAtuFyldPfewXdeZrjzAtJyyMCnNvPAdukCiMnwyLksZiheBKMDnblw",
		@"xubasSmSTNvioJTOXgWZGgznMVlzfkuyMNbAFqGbyjnRbGULHjZZJrAJQPAFqqwDhpKRLUHzhDiDfyhPgwaicytqxwvKUalBuIGjtbHNQpmhCKZDOWLGAVKtQcDMfsLURWpBxKseaKlGAbRCQyxMy",
		@"xqnXwKtDkfcunDemHgOpbgjfULGWdNvhfrLqTsJgLAzjBSKxNjaKFnnOaedsJlACvwcCuEcfyvuvGYKtCverYITxsAFrGhNZmCzrASGAuQcuUBXnfKrjpCsVWTwMcXPxv",
		@"twiRqrGThRjWIAVGyggEVQHnLMQlljwsDpNMwbfNaDiHswAwQgNnljEoXTtvYKnlGGPsAuAmrnmlNlHYfdtNSptIXPzlnhBnBEJXZvYAdcWuVAZPCfGyCAmQFqfvzsRRJv",
		@"RnpgttdhCOUCqFjJrKYZBiuOOGJFyOAdaCfmAXAlEaXkocIOMPjKyFDnADxcIFfRWxPJAMSRYyqyKhywBNTmylLVwzfDGHhJsiyQdXKupauldqYWNtoNOuE",
	];
	return sGaUOfyWaq;
}

- (nonnull UIImage *)ivqbAVcIdZOhBO :(nonnull NSDictionary *)AYZeunTvApmiisXk :(nonnull NSDictionary *)BVnuEwWugQMcfTJ :(nonnull NSString *)sKZrNkKVJTTROfVXITB {
	NSData *gIFLBcziLAZogEtcJc = [@"suzInRGvQZuVGPPFkpqwiWfUYcXQVvuZlXAKwozIrOXBLGgNeoJIFDuWqNwOgBWjygQrYfHyfFpWUOpXvGQwLdBBecLZBLcCwjNKcTMtOJRwNEatPiUkacdOofUUw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gKvFrobsMATJltACpLI = [UIImage imageWithData:gIFLBcziLAZogEtcJc];
	gKvFrobsMATJltACpLI = [UIImage imageNamed:@"XZLXmvZgomhwGGpVJFYBTpGqhcUgAQovadjqRIaHDhGHKDxyKSrFQuIUdiJJoKqKyirkNvKabUfkEWeOLOTTelzudFLNFqKuciOx"];
	return gKvFrobsMATJltACpLI;
}

- (nonnull UIImage *)RUIplYWbPKSztmu :(nonnull NSData *)YKYTAFFWRz {
	NSData *gAeLtCXnVnbAdUeEXm = [@"zyxwKyhEXFtSDgHSLTIoauSiRXexhrCrpStQcNIYxdtZZZPQFOJUYPNllHInazdhxGCmPpFowxoVBaqEZnDObGkxMOWzvmqLTAnrIBmWmZuVhcgIFJEUhq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EqOhAyajzpoBCm = [UIImage imageWithData:gAeLtCXnVnbAdUeEXm];
	EqOhAyajzpoBCm = [UIImage imageNamed:@"aFVgXrErHofscheupVfUVAHAkOgAuUUAcSdkTQuwwzjsTSAljOHkCPBEClgYXrdgAqWoVgGMzxTfRVeTXkvMYIonrhsquaxEllIDriJETGcpYghSGAJDqGHhrWRmpxhtGSdtcTXiJpKfstWYJ"];
	return EqOhAyajzpoBCm;
}

+ (nonnull NSDictionary *)DrURdLneoIZQP :(nonnull NSString *)qDQKYifuSApGdLj :(nonnull NSDictionary *)fdRFrLTcJXjg {
	NSDictionary *qKmxxeYoqtebRgJYdm = @{
		@"BtJDsLefluHrSIi": @"USxPZoCgrUdclWutlQSAcNMCcYmPedyLnBDfvOLcGWmjZDPoqSopjIobNexjriFnesVXsaObMlumwckbJYOSOlDDziBfnzlvQBEoofXNXXeSfXZWpSzSNupwMxdO",
		@"ZrtsFZFNxR": @"cyyFgWhcbotunmKJffPYZlERIOLWbNHdmXWbNrgpNRtiiVcUpXBCpmAdSlweGbJsWaBcaAlKYwSVuHLCkXKZSZMvpJGzhqAOJRQfszQpWffvhmBOqGo",
		@"peTRTfrnlfcjf": @"ZTfmgDHEPPmhpmYsfeTudIVpGcpkCGJhcDsrPzujCesJcvueCkXlKRnhbKVbqFxTliWPyMTHzkigAANJFDAOaQJNvYXioCcQXPzwKUIwk",
		@"liWPgKhJjXLs": @"nCSVjElGLhTpINDOBikdJmNgMxMOQIeKcYeEacYoMbeZVWYKjiAubePoNJuAQFRxrIkEBGpDPsZvMOfKAzXRXoHQMVkCCcOMswNOLsYQsrJxLovaohDbjjmQdLAHoJKBIvkPU",
		@"JvPChnPWJPcAFSQEEwF": @"KGUbpUTzaYVhoHQOLnMSPeEjxuOGlqxpkaScmUihUegOjmmsRAYQUAAQoJMOnIIqHXTKoLTKlFAUKzbMQCfYxifvrKhYtvdwWTKlbMlnSFEWcQCXxoDmWQmSNjsXQOfQtozOSVBipefuOBw",
		@"FWgVwMONhiIwRcEMaD": @"fJHzRbPOypkAPFtdYkxAHKzXwMWSLLuueMjnVeLXEOTErofftYADTEaNBuaFcDNIOSbCGSpIBNDvAfzbajQjwalrxIzNeztJNqlNCoHNBVjRuwwSXBb",
		@"ttzCEMqBZVxioUlUEGa": @"nMcbcLtNUdLGGVSmmqpzIDQxiTuBepKZqrZtgqVFJAGPdfEUUFvUbJjFHEMCpVDPNoBINMpXgqPMrKQcGeHMYeqDWXmeYDXtrIWJHEiFI",
		@"drQkmRhTkXjvhmBPmdd": @"cyTdxvaVgcvVuHdkjprrDTgfmbkzrVXSknmzSalyDWUtbscceFmXIvHoRFJPLQbQODaLdkdjpRMwlsCxBZQkTFaYUNgbyuQoweXglpujcQGgYinblDPLXhaIcxnaaWwFRWGKxsmXVvSXgc",
		@"PdXzYnxRxpVP": @"PYtFXnIsOlSLWbbPwhCMIWhLajjjWmdZQGEoPuAnaCAgPHzuylPZCfyXYWoUJuLEOtCQaoITFzSXimxXnPcDOdydsJCQGcMsVMNCPvFsXObrZnf",
		@"mAPzsoyimdmbpCnc": @"JbgpwhYgdorcMbNAIuTOFSIcYhZUtJTtSHetaagGeZEMRhJLaswcrKLJCBgSwkCGChyngKtqbvvvzXSVtgHVUECpZhoadUKvDEAhnJES",
		@"VmaDXpOjhkFnsef": @"rFMajQtOiswGXAFIXOnhCyMfmvoclPVCHQnvksCQFIWRIUPjxWNoyhPUmyDyVhbzsUeJyGmJmtLtsQYnJJsSmEiULEGdxEFJXgMFKFfKHaiyIkfiVXCLUBMObCZSSvgcxrvKIK",
		@"mIPbvIWkkvj": @"qsKNIGcQtCCUTyhGEuIgQSyThheFVZWFhgUjAbGDkOIkDNEojzUTpJOtdgfmTPBFzYEEfHwpDHYKmuMVdMlCMRmsMZxjzKBsiJCbqazsnlmaPwtcdHHCVTqmwTiqBXeZjbbzUtOQiAEBbedyeS",
		@"UHHIIGPgZCrkWPRJQBP": @"DHJNyuABrdehFgOwUmrGUvenIgtmlTAuNQIRCkWBYBpilbpzKbkAYfWFznQgmpivnJgMIKQWvvAdqDbKYnTRdrEShNIWwHpmjKAFHpbBJwTXXSpShEnfmstuMQruyfYPUrsChaaQEl",
		@"AoPCznKRuNoMbokpvM": @"kKYmpxHFyayuzwJIMNVUDglWWjhVLyDlJSeKOKOdCYNdbycRNlEGGVLQgTbBzmjFUAmHLNrpuVZuhumKCAJlNkrlUNlBqaViUWCHkGshFVJjMVoYXdLklYCIhyHlMtcAVDzv",
	};
	return qKmxxeYoqtebRgJYdm;
}

+ (nonnull NSDictionary *)OstfljnOMe :(nonnull NSArray *)CodqiTmlVaIsgh :(nonnull NSArray *)RHveevLNrpbiR {
	NSDictionary *zTQvpjKQbIHNSLe = @{
		@"pPHkgETAqIaKxahyAh": @"UZvXrACQHIfbmXMAypNNLSnxSKHbGMUOyfajdaBgTwxQbjyOIFNEqEoHGxWWAEhFlgofaCrSEMbWauVtPlexSDxrXuCCxfLOkwMbYshhSkPrkwcXPplWyGAnPlUWEsjLlchJoMLY",
		@"rPOxsBHlTSw": @"RDgxKhxiscyaVBWgihlejsBRCIdmbVhsPXfKnwKecTRZWxjJJzOlfsxejzwkOmxYULjpTtlRymWNNEtPqwYCvXpDrugSwoSjJTRubbzPGDhlNMlTjTRzWOPeuUtNtvllFfKlMySzAzkwjGvY",
		@"CCqCHHoqnrxp": @"qzMPMqSfgEwMRgnOvPeirZlRVSlyLZflfxsLOLFFdqCWPCOIoCEiqeDCViEuTZbFLBbeVZPKeYcBxOFuZXKdpdzctlVrPcbRmNFDqYaVrnrIclbdMMrQBf",
		@"PxEbonzogZUL": @"vKXWXViNuSANAMdILHIEeAxmbuKiYfJNCGJkUqENZEQIKDzIMRmVEiAuXqgmdjJLxhGevlKCEMDWSHXQRHfgKpfKMXCfCKvvMXptxJ",
		@"cwHSaTMYGmzzAZ": @"wytjcDdVMglMMpvtbpmGrvepMgVGzuGJsxgMZJVHnifhdszKRZTFSYQnKzIVRyAXQIoDFyVrBgKyYDoBOnZmkshFkZvaZzhDdFSSfdhMEHlM",
		@"lGcrVrswoAUlCxpYQpg": @"vKaVIKVxSGWMkEHQChCZcSNPPdMEdwjxFnqkCrKxJWKEVMdnZAXgZdEtYyVNRcDnRudtNNCCkmOLSZSIyXrUafOSRoMOUbkeQdxMkjfRBCodlgOZuFHoeAhUttFLAXrxzuSIil",
		@"sczeymbiwcv": @"lTmQNFPoflRBxmZIVhsNkKcrkjZsONKkESXVxCuIEdmGJAyJhhUrSsTzzvqBjiTPORyZWAHfhJHooIiSSLQdBigaBhQastAXPSOfIDCLmGwHpfPHBCVaCXsHjDSCpEBneNiEQCJ",
		@"sdTtaLUHiPlss": @"iGdHjLThqNAGjSqFsyvocROtJkHpDnsZsaBcOlrrPTKNLsPjNaliVogjDAnyQVcLbWTfyRjLhVngdQeQFpRyjQNdipyvkBThaWRRISyAGaxCiSOyUEwQuXyVajakXd",
		@"vfCcXRyOZYJKV": @"ylfSsGtktzvlVLuvkTAUbNbHAnvQuJcDieGlfopyLdMdkTLfZuizAFpFdlKTvabhQtnTRorDWTzhjKGOuEyuwyjfpfzDNGCixItgAqjXZQDVMYgBTyCIvCrZKBVzPiYZLPJDcNuKbcmaOJ",
		@"WrKLjwuzGbxm": @"LqjkBezuKWdZXldqeMdsrdBFmqSaURYGyvizaBYTDQxHmLjjWxmxLMPVKkItepjdGnhRLGPbqrEjvAoxNQIJOdTwFHTWMNGPxkKvWoFRfgtzqTPWrQFsfxWwErNbafwl",
		@"XnEhWUHzcnVTlYylaAW": @"eosdBwFTdqFpgSmopOOhtIphuKHBwpDjNsmCiVwqwHCLvLMxsUQDvISrWhXStzQmfEKreeYmpluksTERjXniUNPVzKnfHvBxgtogNdATfiSZuiBKryBsHTrqgvMGFswZduSn",
		@"NHLdFBgmTUUXGr": @"vcgipehWAdCnyjAXcfsOJLaFEBxuIcqJuzTXIpNkmEJOKSZPVKLNkRCxoSZAnkZnYyxBEKGdRftiPBxUDaVWWnqFRmwcxxxSkYMgbiIEqARJbfbHupQ",
		@"hFhnxBnpuJZ": @"YleUUzfWVyRUKUwoRgidzycGJzsmePbOXQkIdXKemAYCrJsnGItIkbhUZQoFVHifddZHeTJqJLkCTNIOAKJmzNugpSCUFdOdeFHIriVxYquPDXTusiSoNNTbgQBMelqZjvsFTUe",
		@"LaKiSubQePzqzt": @"ASBQflZFBdBBuhIvOhOzZAtWsmtvjOweLMmSuUfNbzjkqBpeWwaWNgtUGAHpypuESzgLtlCpmsZDHtHEYKTHDxnMmuJOojmUkEkjfCvNMZQORkhjavljttcIvsRYjTlMEsW",
		@"gatyrRrlabRNsRR": @"ymZwvzsMlIvKcnFacsjsSjDmuybrFwIFQEpamYGRQBHpulQxBCmKKGRFXrQiMtCENuDOFvZvULfUGhllWaChOnntjawUDoIVsSWPAAV",
	};
	return zTQvpjKQbIHNSLe;
}

+ (nonnull NSDictionary *)hvQSXsCSFGYySYi :(nonnull NSArray *)pRClQloCuFmNKr {
	NSDictionary *YwXyevnrepTY = @{
		@"LBDEEdkaHJdVWVsFFcS": @"tMLtdCnAXjSJLsjBmbjKeSzjWAEzvqtQoDmOoczMrVaYlPiHcwmIYCtmHPAToETEsgZfTNtKqQuUVJKlpxYHvKdiwyKdicNMZsZwWQRbnVxYbCSoHcUtDpTPMG",
		@"KvLOLUCONYVzx": @"ytFbmtjQrbRnjsuwYWqwDZmZiLexNOyiNSzcirxFLNKmNAvnPqeVLHdAYOlcwHXLXaAeaiyDZRzhWHdloUCeSMpGIDxgTEIlZDcffALCufGiqX",
		@"TIcDIKfeLgpGPksrqVQ": @"xWdrkwaIRsAqiPGbUTOIWRIiCKMxdMuaPPhbRSynsyFrbWGLpwfLxLEAPWYzVWWMpHyKwhvcWRgZtmPaERzBETneIkyLQZlQvZOOoKMShkvFdhgsSzsVJMDYXJyXntIfnuMjGplLid",
		@"PWNUCSuKNiMAoufLsJA": @"LOOGewbJUsjRtuCNwEEDRVfCpDHdJnRBHyLjlXNPDwEMuQaEvtasgCVnrMaxcYYQWPRirVPXMkRNZQDagCXYxlAVYOYEpUutbzbmTofJStGz",
		@"MzfRpmpTzHTqwbe": @"sQNZNPKuaRGVQkISEGgqhcvAisuMXjxxZAdKNOjoYYgAmJrSvPDIQjIaDykeEtbFgAHGDdbdfKBiqXHFfymrcQwrECsBjFoOACAkniZrrvnxEtbVTCrhBInFtuvQLiVMTmn",
		@"ADNFTJBFlThZF": @"SAHdclFAETYIhabQdcZUelfhCnagtKpEkfPQpYcnIgTzNjOKoMvOQRHwfOWpsNAIZarLLkKlXNVqhejzFqlDtKpNLnIicZMIyuRrAhWdFNgOVzBzQUsEgrXIF",
		@"qdPfjsPbOm": @"CrhygaAARZVKUHlMqIdzWimjAGmdnCmRsBbBIIPrQSEmvcQgqGcNzRyRGTXfmVbbUazwBJDUuHttWKELkGWfPaRGpAnUwEEyiYXYSbenOOwAgCXVKulNeSVeKDMvpPQhprQZHAkwqqKfTRr",
		@"OOPPZKjbCmRSvXim": @"yjBJJmcBpsUuAdBLmYSLGZtleuCXUHaupsALWMLGLpveTSqDgpxSDYmFleoGzyTwymDptmrCHfvUXZkTmSTYJpiDOrSBXtGvvPfNYTpyuTkierlRvLmymzRVzqawDdiSuRXzWeZhAzf",
		@"LkOiQfrTtIce": @"SJDPNhrbAKjemxJvfIuuPtdyRuvRznruTYnIyFvdHuiGpMVLjxvWbRIBbHwrGQhuznMdCitiDiwImFuwuSIMaxBLUpTPWZpcCkOsMRo",
		@"nCPTfBUsbxgqXAgNAgo": @"tdQCGeEHqhxoDrGuygrRPyjUfUPJXcnNysvlSjbMBmYJjpTEnflJgObUFnpKCAdzfbDcXcJrgPYMnWPQWFUFGqNlvGbyEAtVixBsTqJhsjbfEaXLEpOoZXUavIJPzrZgygcEsG",
		@"jBiVBTFpXEJhQQzUeoK": @"HOnpIipYsJsnkWEPKuqKdvfqKuIZCVoduKumRjsOeYIOILZnhqQLDZNaeAOvDbTgbcZWLTGxtPAPYzSPgqAPQLcfNTjUbkvDrUkiKTiTEsNIYHvzEmzNanmCnlXqkuLaYYmOHaadUSMQEGp",
		@"LCulkhWkBBiNgZyW": @"IaCwmoTsbCUTsHpbTkZxOWLGkWVqEotwuXcpoKoVqfRcaiejrMjsqahaEpdMhjorNXKYWTSJwQdXECmgGKcTjsBGcEpuWVbiNfoTJBYUNnvJuQqYyqgjdQHJJBmFTpXFZVZwI",
	};
	return YwXyevnrepTY;
}

+ (nonnull NSData *)UISzjQHvNkKcVo :(nonnull NSDictionary *)yBuuCwyUUvWuinHX :(nonnull UIImage *)ZCdfjTATrtBIOUV {
	NSData *HctPZukvxmEz = [@"GIglhvLJMAfYDNTUBLpWBaZQIVfDkFxecIIYqnlTOEHHOtAELwHkNtWxXehJcGJpLrTiWioPCTfVMbrofusulwwdJUGjyudxttqVzTWpKQtISLgJymfkHAeskpUhqlNzqyxNyTAGeFjJvkf" dataUsingEncoding:NSUTF8StringEncoding];
	return HctPZukvxmEz;
}

- (nonnull NSDictionary *)LNhpStDEOw :(nonnull NSData *)RCfJWiaAlHWwTIGnD {
	NSDictionary *jPkwfYSgPwKPNMxx = @{
		@"wXUJMtLzDP": @"dJynpJXxoQuJRIFqUwqQADwWFssulqDmWNFavZQITXkNjuJsJmfAAVfanuKDXMNpicrhsfbwkizbRTxlzRXTSXLgIwbMaihkDZPloujGlgGOmrnUlIUqYuvNajSFD",
		@"sbXNbrpZBpKnQIpVl": @"lssayvcCvBHUhcLSExhLFGCMOfzSkxMSdjdAczAonmcGgYbtKmpBAIhYClqmZXbnenvvTTOObZZenqVKkTWQVQPmMXkBpqsCTMzdYOUpXVYwmiCaccylRIUnPyWQtkyTjNjfXrBAzsi",
		@"LzMjlWBNRPdFNYSJLt": @"ujiYKJgFiBgSLhDeFKGjdPlVnRpHxBokXnoxLLUxtCGdlQhSjDcnHbtvvfxpufkAAqagWMdXdNebAGhNoBLHnqvkbhOEptMMkpoZgEQDourJUrhDWPBBTgZpLzBSRh",
		@"aZwARwCxzRSFxuMQ": @"qIoMYQPqVmJEPLQKIukZSeFbSDIGcyIPLQctaiQoAojAXVOaNxjomKSLIaIHZeXNzmaPQggnnpGezxlVBTohmBfNCdAllKXTKHbTwCDiHHRmPymBb",
		@"YSxAUxGQmvrQWzDjLdh": @"MSqtcENCJmGfEWdmFyASrrKTFsHDrghSNYtNIwTbEVTsNyuxSkJHbWDTIYRQsRrWCtVElFVeGbdIrJonwscAedtcyfukdkTkTkxGHItlngBMVskIAwQRtKbKjBHm",
		@"KfsTvOFtRxJ": @"HqsudAKCMAreBQIIAQqhgjFEWoYNgThFEsGioTEYjvSUnebKtsrUOgHQWfExtWUeblxHsHmpWOLJiJrhZuekaPSGIUGWzIbIIQbFSvfBUdlrV",
		@"slVSwTwOglaVVx": @"QApRCDGjcfUgGzFRVnRdWjixxezyDbNLwSCSRHpLQbdlYwiEMEbxCsavDNuJjSTkzPPxBWMucXrNopioCaIjAGgFjAbjSfWQUwJxEoFGqoTXYxvHENeKNhQErpbMenpXKgiBel",
		@"hhIkgJJwtUVOLIAA": @"UoqFeybTUQhAmqNLKibTEmgCudEmPhLOgFqkqSgOhYNwQbnfmAujuXebfBXTvhdiZpIAqZVfshSYFfJtLfoPDoREKNCUqJQNGffPGVecqpizcDifBajAbjUpLXwUNRwwSRFGnrLrRTUNCEBqEkKV",
		@"wsqLOiFJQo": @"mQLkBjOXQqyIieHqqzUxFrCfBVREJZbJTOuLKdQnURVSXXvdYqyqiYOKTNFNEMEIzLWOwmDPwdszkDyCvahlKyiCGvIsMXuRzZaDfhmVLNJmbXgPbmOyNamY",
		@"VzZkaZEGADFvVGay": @"mneyamzuDuHpBXMpxAjdhyaGsaxVrabjXJTwsRATihRCFGfjbKzMhEkUXxpATlMMbaWLcbCcKEunGBRKoNhDxVkvQEMvSGcllwlOhaqBFkDJIBbwmpzUoeRPyVGYzWOZOcRhluK",
	};
	return jPkwfYSgPwKPNMxx;
}

- (nonnull NSString *)YHSoPpxxBCbPhvufNb :(nonnull NSArray *)IRUYOHtUnoKFNST {
	NSString *FTlnYxOSwFOKXFp = @"woMJTcTYipwUYsiPSohztgHoUtFagBVeLwhRVQcgzgiSOhrAWSBdtEqptwnEsdkDtCodVqBlhUVDnPxhroYNcdOsFGcxCjhhoJHDnwUspbsiK";
	return FTlnYxOSwFOKXFp;
}

- (nonnull UIImage *)ReDjfYIsJFuxzrhwFmZ :(nonnull NSArray *)wmJplAiQPNew :(nonnull NSDictionary *)fVnSnhXCPOl :(nonnull UIImage *)uXggndNHuMHFJrhpF {
	NSData *hVffINIkhRDIlbtKNd = [@"PZzSPKeYFbcwxeBHpAlWYkxFjKunAhdZTWIZWjBVXiXgAQnnngmkWjQpbVzxldhVFvJdYDDAazPPnnSPhtugNJcIknPLTkDtmYSFtyXwywou" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YksPuAkwRyKExHdJO = [UIImage imageWithData:hVffINIkhRDIlbtKNd];
	YksPuAkwRyKExHdJO = [UIImage imageNamed:@"GxBBrxQeBzFUhphbVLCrAdwXAMuSNSXFZDuRMNkMtptmsWgzNtKJibnziieLQDFHfGMwlvvrcekIBpqwjyEqZncSGlweGWGJUrBgPoImkVFHrNFjMsXzA"];
	return YksPuAkwRyKExHdJO;
}

- (nonnull UIImage *)POcCAUjnqRmqTxoPnX :(nonnull NSString *)dryZpTSXNbgmrb :(nonnull NSDictionary *)AfmnwLbiOZscelAE {
	NSData *jPnqveaEIkfIyR = [@"FPtWXFzGqHAhZHQZuqVNzfYpSfFkZMUuGOVUzuZHVteIPLdnOsQRowSaKmHQsgfymFEcqRmQibyPEshuDqRpEyKGiQRtrdQAaoBDXJNHtDhGHIjymwXSOuzg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YAkuIcRHfTEdcO = [UIImage imageWithData:jPnqveaEIkfIyR];
	YAkuIcRHfTEdcO = [UIImage imageNamed:@"mpiRcHlfTqErJbSZygLkOVlVVlZkQMCKUijZhWMmGJeeVweepFjykTatImJNKefxlxsEpDpHEgJtkQwWWPCQQMAbQuagvSmQjMtrbPHUtiObhrmYiXPHeTRGRYcHyQZyXAmqSdIooLvgh"];
	return YAkuIcRHfTEdcO;
}

- (nonnull UIImage *)XAIpqAJextHk :(nonnull NSDictionary *)jQDmzSygsWu {
	NSData *wtDqlzFGTmoddDvR = [@"pAwDRbksdULMuFXathnNoAqAuKAtwQTCpRbLrvulyXqMWmxPNUIIdwICUjXUWLlvnWiKuiWlQzBhEDybIARvSuUMgPBnpMgYPouXuCvbyhnaxYzBQoozRWVbSlaXgrtOFGMAc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KWzDFEDIZtF = [UIImage imageWithData:wtDqlzFGTmoddDvR];
	KWzDFEDIZtF = [UIImage imageNamed:@"maBWyBycpMbPyLXPZuMwiBYEOLZNHSMDWFqxijALCipcwvMLzGyWILeuhKuJMvmCAzBpimTcwNHLoqCAwliUGdkFisCrVUltnHlujtZumYadjyYEbuvqqFKexjWpPNGlWpM"];
	return KWzDFEDIZtF;
}

- (void)updateUI:(NSIndexPath *)indexPath
{
    NSArray *infos = self.alertInfos[indexPath.section];
    EMAlertInfo *info = infos[indexPath.row];
    info.isComplete = YES;
    
    NSMutableArray *completeArr = [NSMutableArray arrayWithArray:self.alertInfos[2]];
    [completeArr insertObject:info atIndex:0];
    
    NSMutableArray *finishArr = [NSMutableArray arrayWithArray:self.alertInfos[1]];
    [finishArr removeObject:info];
    
    NSMutableArray *alertArr = [NSMutableArray arrayWithArray:self.alertInfos];
    [alertArr replaceObjectAtIndex:1 withObject:finishArr];
    [alertArr replaceObjectAtIndex:2 withObject:completeArr];
    
    self.alertInfos = alertArr;
    
    [self.tableView reloadData];
}

#pragma mark - Getter

- (UIButton *)publishButton
{
    if (!_publishButton) {
        _publishButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
        [_publishButton setImage:[UIImage imageNamed:@"publishDiary"]
                        forState:UIControlStateNormal];
        [_publishButton addTarget:self action:@selector(publishAlert) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _publishButton;
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.backgroundColor = [EMTheme currentTheme].navBarBGColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[EMAlertTableViewCell class]
           forCellReuseIdentifier:alertTableViewCellIdentifier];
        [_tableView registerClass:[UITableViewHeaderFooterView class]
forHeaderFooterViewReuseIdentifier:alertTableViewHeaderIdentifier];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }

    return _tableView;
}


- (EMMaskView *)maskView
{
    if (!_maskView) {
        _maskView = [[EMMaskView alloc] init];
    }
    
    return _maskView;
}

#pragma mark - Action

- (void)publishAlert
{
    EMPublishAlertViewController *vc = [[EMPublishAlertViewController alloc] init];
    EMBaseNavigationController *nav = [[EMBaseNavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.alertInfos.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id infos = self.alertInfos[section];
    if ([infos isKindOfClass:[NSArray class]]) {
        return ((NSArray *)infos).count;
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:alertTableViewCellIdentifier forIndexPath:indexPath];
    if (self.alertInfos.count > 0) {
        if (((NSArray *)self.alertInfos[indexPath.section]).count > 0) {
            NSArray *infos = (NSArray *)self.alertInfos[indexPath.section];
            [cell updateCellWithAlertInfo:infos[indexPath.row] color:[self buildColor:indexPath.section]];
            return cell;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.alertInfos[indexPath.section] isKindOfClass:[NSArray class]]) {
        NSArray *arr = (NSArray *)self.alertInfos[indexPath.section];
        return arr.count == 0 ? 0 : 160;
    }
    return 160;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:alertTableViewHeaderIdentifier];
    headerView.contentView.backgroundColor = [EMTheme currentTheme].navBarBGColor;
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:alertTableViewHeaderIdentifier];
    view.contentView.backgroundColor = [EMTheme currentTheme].navBarBGColor;
    return view;
}


- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //设置删除按钮
    __weak typeof(self) weakSelf = self;
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:NSLocalizedString(@"删除", nil) handler:^(UITableViewRowAction *action,NSIndexPath *indexPath) {
        
        [[EMAlertManager sharedManager] deleteAlertInfo:((NSArray *)weakSelf.alertInfos[indexPath.section])[indexPath.row] result:nil];
        
        NSMutableArray *alertInfos = [NSMutableArray arrayWithArray:weakSelf.alertInfos[indexPath.section]];
        [alertInfos removeObjectAtIndex:indexPath.row];
        NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:weakSelf.alertInfos];
        [tmpArr replaceObjectAtIndex:indexPath.section withObject:alertInfos];
        weakSelf.alertInfos = tmpArr;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    
    //标记为已完成
    UITableViewRowAction *completeRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:NSLocalizedString(@"已完成", nil) handler:^(UITableViewRowAction *action,NSIndexPath *indexPath) {
        NSArray *infos = self.alertInfos[indexPath.section];
        EMAlertInfo *info = infos[indexPath.row];
        [[EMAlertManager sharedManager] updateAlertIsCompleteWithAlertId:info.alertId result:nil];
        [weakSelf updateUI:indexPath];
    }];
    
    completeRowAction.backgroundColor = UIColorFromHexRGB(0x7ABA00);
    
    NSArray *infos = self.alertInfos[indexPath.section];
    EMAlertInfo *alertInfo = infos[indexPath.row];
    if (alertInfo.isFinish && !alertInfo.isComplete) {
        return @[deleteRowAction, completeRowAction];
    } else {
        return @[deleteRowAction];
    }
}

@end
