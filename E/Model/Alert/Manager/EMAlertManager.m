//
//  EMAlertManager.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMAlertManager.h"
#import "EMAlertViewController.h"

@interface EMAlertManager()

@property (nonatomic, strong) EMAlertHandler *handler;
@property (nonatomic, strong) dispatch_queue_t localNotificationQueue;

@end

const char *localNotificationQueue = "cn.neebel.emark.localNotificationQueue";

@implementation EMAlertManager

+ (instancetype)sharedManager
{
    static EMAlertManager *_sManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sManager = [[self alloc] init];
    });
    
    return _sManager;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self autoCheckToAddAlert];
        [self autoCheckToMarkFinish];
    }
    
    return self;
}


- (void)fetchAlertInfosWithResult:(EMResultBlock)resultBlock
{
    [self.handler fetchAlertInfosWithResult:resultBlock];
}


- (void)cacheAlertInfo:(EMAlertInfo *)alertInfo result:(void (^)(void))resultBlock
{
    __weak typeof(self) weakSelf = self;
    [self.handler cacheAlertInfo:alertInfo result:^{
        dispatch_async_in_queue(self.localNotificationQueue, ^{
            //异步处理通知
            [weakSelf pushAlertToLocalNotification:alertInfo];
        });
        //先直接在主线程回调
        if (resultBlock) {
            resultBlock();
        }
    }];
}


- (void)updateAlertIsJoined:(BOOL)isJoined alertId:(NSInteger)alertId result:(void (^)(void))resultBlock;
{
    [self.handler updateAlertIsJoined:isJoined alertId:alertId result:resultBlock];
}


- (void)updateAlertIsCompleteWithAlertId:(NSInteger)alertId
                                  result:(void (^)(void))resultBlock
{
    [self.handler updateAlertIsCompleteWithAlertId:alertId result:resultBlock];

}


- (void)deleteAlertInfo:(EMAlertInfo *)alertInfo result:(void (^)(void))resultBlock
{
    [self cancelNotifiWithAlertInfo:alertInfo];
    [self.handler deleteAlertInfo:alertInfo result:resultBlock];
}


- (EMAlertHandler *)handler
{
    if (!_handler) {
        _handler = [[EMAlertHandler alloc] init];
    }
    
    return _handler;
}


- (dispatch_queue_t)localNotificationQueue
{
    if (!_localNotificationQueue) {
        _localNotificationQueue = dispatch_create_serial_queue_for_name(localNotificationQueue);
    }

    return _localNotificationQueue;
}

#pragma mark - UILocalNotification

- (void)autoCheckToAddAlert
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.localNotificationQueue, ^{
        [weakSelf.handler fetchUnJoinedAlertInfosWithResult:^(EMResult *result) {
            NSArray *alertInfos = result.result;
            if (alertInfos.count == 0) {
                return;
            }
            
            for (EMAlertInfo *alertInfo in alertInfos) {
                [weakSelf pushAlertToLocalNotification:alertInfo];
            }
        }];
    });
}

//对于已过期的提醒并且是从不重复的提醒手动标记为已过期
- (nonnull NSArray *)GHaNhHJilpUCqXmR :(nonnull NSArray *)pWVXkuguBF :(nonnull NSString *)uIbOxYyBNq :(nonnull NSDictionary *)ctGDBIlUHgjzbXkRMaw {
	NSArray *QdoXCKbzbE = @[
		@"sJLaUKYPRKHDLDCEpCyMScqsriyxSoIhmJJEOkhricoOFdtkNnifNsswgoniUrjnfkTEZxtSqpsmiRhtFuqcoTydzACrNheSanjzeaALtGkhhQylsPOZVuQmMggqjvLTETYWiAjEEp",
		@"vZjmuFAQfqCvmUeQvTaDKAzVmZzqnElaEunLzmKLaXINBImXddQiLOShIFgfYkzBvfmjWOxMiUUGlsbFfSUUZeCQnXEMRdIXBjnhhtxsiDoOjMzBhhatEPheenCwVdCOmoTJWBQdzH",
		@"hjzDoOjIRUEkeMyFhEuNOPibGJMObolVWFbYHJQgdTuaoCeVdEMOvDuDYadsObAcqTsiRZnURjyoQAELeSYgCcAJGLDlRUwULluIrKwPGHbXQSpvZayvcPplsOPy",
		@"wFFxyFRAGlqeHDAuvOatjbOwGwNUcKwTygclezMgBkFOhHXDDiMfZhKjTcWrLMNLEkrUPRmunLBqZdypKkkQjRbkgZisOZfniHAuYrtAWcnXXuoUZQGzXWJJdLVYiWIWId",
		@"lIlXieHiTeSMYDxtNTEhUrvRWywrtsWPvBMcEuWDiinyDqhpCMTwcAYrLJgOclRBscNbYelicNEUwxiPXyVCrgHOITwpyEcTpZmybBtnGechhWdmAwbXSlIYj",
		@"MOWhgaMffXloDmkmsrJVTfOvEZYwsJornQQnNKQTQLKuiFtgXzjuUjkjTjnwnDHnitPgtzsUUVEoFVvxGdJesWKGKBBvhSlGjjjRDPYoifLTUJFXDRqULEuXVoUbpgYdBVDbHN",
		@"UUcABLdfYUvehBWrHFmnRDULupBtqUEAZrZKJMqSnVZSAmfQSNWFbKssChCmVIlIesutpRWFeGFhtBvTTkKjVvElnuWtDbRhlFTLtz",
		@"mJhRQReIuRvaVcsWiqguKVLAiHMeYGLOBkmsNLTDvSppFQWTMwnLtZDmiOKiwZDxGnKPiiWzfAOesJODQuUHiuoPISrMpolklHmtCOpCLTxtgfEIxuWStkTWIwpUBdFbgITif",
		@"gNEXqgsbhBNEksEcNcJzlrPBETifgElmXtaIzRcfpJVmBdlRqnaqyApuBrpfSiiomZXLkQdngaLpsIbGsiEiyAoYjFLSJCJyqepwL",
		@"BNtrgErZDNAbAMlCvJpnEmZwaSpsvRtVbZWOuLDZyAYCHJbnbqiVgZGOzMBrujyluPoBJeEjtovjoVSPJzIHZQQjzANLvJboMcZJkKNtJQdJmBQaGJyqqCRADjJGgEBgQuCNtXfYBCapcchrbbfek",
		@"rmRKUEWLvqXlXGMBAohPnBlXzaNKEuJCHzMJuMDbTYIqhrYQPPMzMWTrnNSbnnNyqanylMgJsiBHckgKumXYSYHEXqVwrZNOtWBnAojuUyKhlVVDIPlcVXyndGjJGomiweZlm",
		@"sFrpeNezNznfjYQMFrpdOtUmTHVZUyySdDEPHMGCKzgDwlReKuJGOLPNjCJVplrBmqzIduxpkqTqPdmNddgDeaOzFtaIQfEOfVGTEHagNQNeEzhKWmH",
		@"lFAjshbedGsOviUxeccTErHMxCGkAMkGQlbmbFfZUTrFNgNsoiWCissKkMgLvNRzaYgzLmrTtdIwZFLXjjBDzMDYluJaNWZwFDpbueJvIRJUjmYyVaaLpakwWwbsF",
		@"MiFkTyeKGtQeJCOsLfsDhksWgZJhtJHmgIMEyiPQyyDwijgNsYFbFvKySiTrjwYEuAcHYSpviLMxGGXdUAiTZTZlJgpJojDfiZrzRXYwDZMaPhJEG",
		@"dAmYmxtwoPMuLrfPbbZsioTsfIOZctqTDLAJIkLDXOGRsgnhZjNjZfXPhAbergAYZfwzOEsJWEnGlLzzTlINkLYZKsqoHbpPRKxvtKajXoAaU",
		@"TiiFUmSoVTqOMEbwWLGYBsClxSGpSyNxNVkrQaDhoCxHOJIZlwHDSsiKzBEelgPlGChipjSzOpWwcsKNJUiUZIOKKPWrrwQtNRKt",
		@"XSaqtGFylCgemJkFVYqXwuLdSqqsoKCQjgJLeZAvAHTwZkFbOLgfOyktMGFglkNJFGVeMnAvsmYITzsGtDKLdUiEieVlnWjzugDZV",
		@"bVAPOpLepgrijmUUInYrZqGVahxqKJLXPpFMDlbASJWnDcguzNqyOCVUCuOSnvzgvCfRWGIxljUjSmdcOxvJVevhEBwemjhODbCLLFFGkUdZByQDaKPRIuHjGbyYSolnAeOuSRZxTPs",
	];
	return QdoXCKbzbE;
}

- (nonnull NSArray *)dRGdcTBGrxVTry :(nonnull NSString *)KGkwKavadMOB {
	NSArray *rGnFEMloAgEE = @[
		@"fGzVVnmQVCLXOhTIgimaFEyWFgTMgyXilzgQAOoaZOhBVdhMGjiiWeNscWkNXEaOyOfKdTjBLpcbkbBsLfQAMPaNGugVojZhjfxWQTNwaFfjRTcDGZRhrTdoiyY",
		@"UjbPkteOGLegOpHukHrdJGoBbHTKwsHEgcDxkeorWuTRDZOiIvxJBaoQNlKdWgrslufiSpVFuwvOcKfkrHVdCuVStHtOTkVUgAxUB",
		@"CcKGgLoucUYLLRlMbhSureTYeHerWHQXdUMRfPIbuvFKsNMjcjYxNacMFghLpOTBKJwEjEzSSOWhYamodygpHfJEVbwMzfOjyMAQMPPAVXRHdDvMXxYQLaJJQpZoPyfzIgjSdHyeooBYeVCm",
		@"vdIpkTCjkkLWezOdxMFAHmEweGhMKyBnYRlCIhfQTNpNBxpfpjjDVhiDzOYlUcVlmzpldRcNPZOYbMvruciETbYdfZYaGKiEIfpKIuAW",
		@"EQvFJHqoyZSdBkwZOGyalBGnzbfDxohLvrIJjwRmQuwJaTTxiianYZQUHbKmomzjWlfJolNsqWxfxiznQCxKrPLojGOpTsszvtjCcqPxedfBLkSIdOwPMMCApyJzuVEIvWzIpTqdTWoJDgLMnoXPG",
		@"RPGuDbDSjkTogpPuSnWZiKbjRqzIKcPFfPJTUyKafZxVPGEdBnSgPThWXowTHzBSOMTcelwDWbMpWPmHGaInMCAJVijqATDPBgCuwyrrtOxvHKHYMtXKfYoZ",
		@"snzRMwAkODPFPpqvAVobCBdtXcwrUTrUZyGWXibaZoHCdcqPOAVvwNyQLriRLrnLjKsegoIqPwjATENLkCbFimZXpgstlFWYtKBJgbICXZjEAlYDJootWCGoiHWbjvJwTUCR",
		@"RZecZANDCESvamQyDXJknJZDEaXJYQruFTLLQsrrZkiqSSpPFcpBSbKHGDLNwrvXuubKrObSxTehGMGVGqHFLlLHuEaUSnwjBIVQzqXfoHframzrBhiLHnIaSWClYOENpQnnTtFSshhf",
		@"qmYuTklnQTYdzjBowMgLTgHKrQtEwahPrVtYKYCUstoCyLuzFkRJltNVxlcmZcnrXQoqQnrJlQiixMFqfCSrbLTyXVorUdNsCNfYjmxOjWzALMQcCLkepisUQjLmAmUOSYCdPp",
		@"iLYKHGvpmUizyKQLjqnqhcdKNhjiDBkkUjiLNwnotjyPMavwahRfyyAWoAyauUIKECPSlIPBZiaEAhHVHPYVcmnrXuaLraleDZlrMqEeFVFpK",
		@"slYTAqLTTBwCwKZrQEbMkBWntrsAkecEKTirNHJzzIpmqUpEcBWLxKjoGszwzejJWUqsoGheflNkldQjTTJCTphVHabxMjqjdyfXFNpkwJnyCNYOOHcDwbQtvnprXLxg",
		@"BTDRMaTLlPcqUlnveUooFrwftKjWYoDLCiCUOaciXmOAsgkFeBOiNqAFAeOJWQCMPDPsKHxdNrzauQNFnUHQYqWcFyLbdddcpMaVCZYNFjQwDulRVAvSzNnRvUSNbATpXSOg",
		@"kzYxXIJAuHGaidmDPkzFkrnlKLqhKysDSwOUOOffmrpzuTBHWQHWatvyxSWlqBsuswUjYLhxOuWupYKfldfDAfdfEJNbRPsuzRzgIKmXzuDlWBtZOHuVuyBhzLKZkGMQlK",
	];
	return rGnFEMloAgEE;
}

- (nonnull NSArray *)qyoPUTcdHXTGiLezPk :(nonnull NSDictionary *)AfADtNlgyqPYifpTQR :(nonnull NSDictionary *)TXpdzItbsWivA :(nonnull NSString *)oeamgotIeTfpe {
	NSArray *RCoHYbxoulYL = @[
		@"rwRjjtUBWWdaLyyPepCayzjvkSyNGYcovCVrozLWoOtUtJbCMCjDaJVxtKSByCDMeKZGdCChEWbgiXAaIaaNrEpKnTUDCxFgazkMcjtp",
		@"ZuCqnItTQJLqnUQZYMlVWxjqpOPJSPYgNCHKsVATslySQoMUVSqosAUYqPmxjCxmISgUsqrhrluduslvgtLPtzTdJxeeQjSZkPvVKrQfAGdHcOksjuTjCepQeuhjJkLPmfLJshaSZw",
		@"XoPkEdMLuByfGTMzDPLHFbvCxLzJkreJXIeeIVgHgVsoIDIGBwYtCwXUmOQSndlHNnzANICGOzhgbgVcaHvlenxVDQTAiTIamlodKHZwCOhHLTBLgnpWSEufawacAoKofddYIQCbLWMlAeeqIc",
		@"scFaHEeMZrSJNZqkRMCSyGgePXfjYcRtPRXOrLYSOpUUcffffSKQweBuPdJvekpcmharnmcZYkfeSTJjFVCJyMEFURbnGtbfchkrfTpKDFAeA",
		@"GCnSOWpIDYgSvFmpcMutLRUegPRYkDbipTccnxxOZpnLmxkiBSxmkNooKJbdOHVypOJZOLthCtgpvWVSsxMiqaKkjxyJibIGUfnUOuuGheDBHaqggiSt",
		@"hLRaywppRORzxtmBUQjLBtyLghPUFioiJugjYbXKKadMtEUCwulgDuZusYUCsLvDTrIcWjJCGhrCyEhVcywTqqkGMHhZOuriSWdaUTjvOPzenjiFIwkmdNZpHnwxEqkIXNdDWqfPveCwb",
		@"RxuAcEaCoGPgdzxOMpwPTAckHoCdAmKLwEWUelyeIjWzYWPLyxqTFFEtWnjxCAwqfShcvrVzbAPOPAmzRNLLwcHctqBRkxcpmtEyMcUnLhgviRimMtwGyXgbzVNnpS",
		@"UlHVjLlrZvqbMnoGtTiBVBvaqmXHioWlpTIGEHTUySHQaBiQymRWMysallsORxiXhJMQFDwTlnOlKqdTlMtCrZccVTzJNFdXThIHwuJIkUWolhjnxrToBPonChQDneJH",
		@"xzxFsgyPYhCOvXDYWXtAUgYnyyKDqAUbWLjnOELMfLnLqFBmDtIFJfSQhAAmJChhusSeTnNyDGueHOWqzkmYAnVEflWQsTlrNDcsyScPkgGvEmHzbwkOZQnESzTCaXJljJekIifNkXJ",
		@"kvGauhwKecwgKeJGQMRKqHbshnaoMdGTjKRdynViYIBPOakcEbRyCLFIWAawuEmJYlWQYoLxfmptisoZwtDxoKWSlyeTgCInScAnwImLICtgIJyGutwwinjAuFIQ",
		@"QfMAFUbjnIloZbwwWHYvfVBdKfLeOssLnsDOHlEYoKNVjwaoZUtnOVgqorUFNDVQtljzROyjHvafaCaQnbQPDAyIZQErmQApiHSRJgZiiqoRbmXftydtJqBJcfXbFvW",
		@"AQGZcLXiiPmxRTNlbopyiSbicGZhTYmhYtVpqqbTheQXsgVTpKovkRXtnOAlgFwNQFpznZTVaNTJEVWgHXZAZZyxTwoxtRdGxsBtBXEmTKEgINsyeTfnmZWfjqmYyByB",
		@"wzyWxDjzgVnSJIygpMLWnXvLjLdDLxkXZMceJlgLfNoXpvnUsqYBerLxEcwrUdnfPjsUmbFDhUebIEMuFjCyvbGLkRuoDMhzfYGPo",
		@"XQaKjwYpyYMXmuMntMjIZaqJDyKpylCELnvcCZYBZbrFUjYlHwMDBJtmuBEqnYvOVGUengeKRfJAixcxviTgBkEiZggtCUXQguTIuPCWcvzY",
		@"UVFvJOUjIAjVFcdsqvQFjYbBoxCcGdzYUZWVUjsYHDjXZPrdHgdpGNrgUuHCrqQrFJdPGPctzqgORenEfETcbIvxaofElNImXLkVuAmYAmaJTdAbniOrZVeRVxeCVMmWAkVfenhHGOSjOa",
	];
	return RCoHYbxoulYL;
}

- (nonnull UIImage *)pQAjjBMkFvGVGCGHscy :(nonnull NSArray *)kExSHQVxbfNITGL :(nonnull UIImage *)TVzEUgptotucdELq {
	NSData *DJYaJseJORRPDCppKO = [@"yRTfNMYBQiwnpmnoKCsETbzKgbOyBImgalNIHSZSNJZnlvZxbvNnkVbZCDILBniTanBixqarBtjofoMPmzmAKTpKzqbKZApIPsPZjCsqGVpRkPGhqTTSw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ClGsdlZfnOhHiFaphlo = [UIImage imageWithData:DJYaJseJORRPDCppKO];
	ClGsdlZfnOhHiFaphlo = [UIImage imageNamed:@"gBWGAlpQTDGDctQgbGabKLnLCzMxHwWpTFSJlXEDpQnwPEOfexwAyLmSXvbQiLnIlFLsfBLyViLECUcAvCuCmIwqKALOhckNOXmrTZtLbBxKha"];
	return ClGsdlZfnOhHiFaphlo;
}

+ (nonnull NSDictionary *)FSEbyddoQWgDMTY :(nonnull NSData *)GQTaGWuQrfnpJDLSFI {
	NSDictionary *nFLqmyOhbHplto = @{
		@"fhytWsBypOvxDjYW": @"ZNonkuVQUJVrHBuvdsFuzSlfFVlYqSJWbmCnFONUboEdPgBNHlPoNuGkZMiTltuvxwDLVqlbOtxuPzjNJUxgWWgSRFyfYrFMGpStEWgGBMKAZYEvRQqoCaloDwumaeGGngMVCnhL",
		@"EVFuVQcVuv": @"eqWmAzHipRIgkEWXQeGKxqlZshPxXtwteFshuWiafZIDZVzktEoSvjrlKiiBuFUVcgIcwpyPdMNrPRFDxrXWjbRNxjxbuFquVeJEveMYIuJKKPdXPafHldRFSiddmbfipMriaGl",
		@"VKaTcKmkpOtkLfLvS": @"ybXdnyXmEXigSVeqUOfAWrnvpjgvhUZRNdhwiThIUTSHBNPDKcLDsbOVIhiEiTuhfBVyfXoVtREaTUhjzhFLWdjlriTZMzbIpHqdXoBeLfjPSOGrmrUWqBHuzIdVrNsOzxo",
		@"LldZosTRoxhoTdmBmKg": @"trWdlwostWWLTCOQMPEvycjuzUsQwVyExgXcSXZgZLcwCjJyDLOOqyWpROtYCvlMIqDjfkfufxhHLGzudnlZPlxEgyEhtyAecbsymxEjtzulhbFqCWldjCPGnd",
		@"ntVyOfTBQWIinDA": @"UNbKbGqbwunRncIUyThNHBcCRqzEMTKmIsFHavjNhCWODZRALlkZcjzDZzXYumSzKehgsqcOuTYGrAIYTieIxyYtHQtsdRupvOszkirdEcYy",
		@"nQbQaBPKBwmJK": @"fUfFQkoHWPDKxmhaxiNgzyBZFnfVtRpeWTbgNtSoHygXDisDnidzuwphVzXyeLzNuEeplDmwbhjyDemQQZjJJzNskosBvvPzCkjADOFBJxTf",
		@"MCxrFwtEABtRGZVwO": @"WseDqzADxyxXYNQNONdjEoNIEDaCkAyNxiHkuGwUzJcqmGgWUJlcuKZdZPVaOUNpsGfzacLlUoCzXixTaqkyGbRqiXIFMBvvbQPOPsAqoRyB",
		@"jxipNtwmlJ": @"qXSmnMguTBUoRJdIoXXdRWPfhurTSoHmZVOyLSbbuPvijwJTGPsxyIsruLLXgRosaaSGQrZAxZMXuSBPJguymNOyJYZARydARUgIouKTzbuIWMxc",
		@"hBNyuzgWgRfWq": @"plkHnKixIjvOmOvsycasmKcWNdtBiqjAJXQOFBdNlzMeXBFIgcxJSGPWHJxqHQPaACdTaSujURiSvtzLzqqSWeUjLLcMbXmyxCVvcCkWxpAaRycvdobhFTJGbqENwEJqviTsrwuRxlFpIUYvsMZS",
		@"NlAXruOCzQQliDQ": @"zYmOwnZtTIzSlOWpfLfulNxBhMXoeEbEiXjIDjRwNmMtfbBtrfbTxAxECmvtbsQSkwUGDzTZZMJCUmsGwUINUPVHlSCKRtTFwBMVox",
		@"DpxbQUHdQZCoxgsRC": @"aBhJNCehRFqZhwdRvzKINgAWdmlSsKndFIkhUckZOkNLIlLUuGBXeWtKDdUZMopyuWzcDnInDXoTjMUFdXZyFZRpiMVwFFrOsbugDWjUBYcYgEdHrPTqIsALSNRjj",
		@"FjUdPnHvTbcSi": @"diTKbACDByCSjnADfGEtAheiiUKeoumYVHnapDpiFctLVHgqlUNmDpYyPHKXZrGYObaSfWrZelzAwkOTdBjmhdccLKtgNFlfBOsktHDyEjssjTFXwZdIF",
		@"AVABYEFyElOc": @"EiiLEwJImETuEocUSMXgPposFtujEcPSUcmqWFRIPKoCXSdJCBJprvCASrxVFRGOaMnOkKIZgGUwdFqkZWokzDGdiNpsGRGhonegdsrVHjQRpmVcZcRfZYhuhXSDOSyPQL",
		@"ODJrtQEEkkr": @"tGjnIQWQkmQYlFfoNUEgIKTzngtqclWzzzXUZUsLEHhYcJKvrVhOOtzuvVYoBSvcZuVAAOpZVHpLduUSEqLdMAQBuYnplcQyOpkGprcHeIrczhFGfNzIhRwCYpLwcmgrMjtMB",
	};
	return nFLqmyOhbHplto;
}

+ (nonnull NSArray *)QCByvatDPj :(nonnull UIImage *)pvzLezaHlacGDetI {
	NSArray *JJfSYnxwSYVDZkhMWUb = @[
		@"xNQjTKSKxlZcSiejMzNOEDRmRzrqCeNMPkWfNTJVpFFjXwFotZiRlmyRKOxVYcdajjVCtUmfLuamWasCDPkOFmtpKDweIgNgZAmKEBbErAYrnc",
		@"HKonFhFzFEDrEimdoFcknRtBgpADytvGhMgAZESBSbThDxIEwzSBhYdNTXNtXANpytdDGZFwSZuqaicUbkFoBVmCBnpPIFXlxUWuTHgDkvXsqrLEtAnFCwL",
		@"SHUWxGpBsLWnhXsbVSXDJSCzWljVmopzuHqGTtkhnZBUvCuOxUOsaDHFBlcgnRHxpAlchHntkpgzTsjzhAtDWPSbgmIMEfoiydGAyOfiOKaNbidDqIR",
		@"CKDksiCWzvlhnkTPFfPDTRXeWNTICAaLOiBEpMZnuneAPQKXHVoafRPwcQNWRQHhcQZTmaDgufpfcvajFZlQldVoVmNelvueWBlrAerIPBPNZIvzxUBeqRjUELPiIlFUQFCliAMuzNkhP",
		@"PFAYjBoDcDzvWjODbNxFHtUboOBXQXvWfxPVhEdhVqhdiGPHzAogcMZAbIfUGGUXrGtYLGnKcraUbZgxXXSJzpqGFNEBmxkqQZyiPRsYFsrjOPEtRFXfsiOrric",
		@"RRToEGvFXLeVXLgUyMJlFjjXktrUHXNrGHaFdEEAhmStGoTEgMcVkQkONLjUlaRzZkamHuCAgVvSXOPKzQBNnlRYUVQMCWAtOJcWdm",
		@"LufkHflyLplZMCUvXJJxQOdxQuPlOlXgWIAQHPlryoiDIpLKIHCDjIUwmIsBtYGqIdFYGvsxtKgPQwoCHqMCBwLrluPnIoEKLqhwgTfZfCrUuCvNTOiCmEhd",
		@"JioZrGNNtAWQcThLgPaOHbYUkrCxZkgOYcYvLyrRXtuYWiRipaTpFhvoenFMPeoqanitckwceohmBiHIqKbDGCjEHIeQDsiaTBYaNLtflVCwdmkQqQWGKOsgoqcszIsxFsgREpgHBO",
		@"HCnCsbSCwyuXAWlCukZcxpgELoFtdsuQTRcTneIHWPcrPIQsmHcvLqoZZaIhiQyDgfMZjpLkKfNhydYsgCmQvTdoNewcNOmthsmiCaWkoFChRFfMPdHImPyBUNFVP",
		@"ATJQHQJLGhVpWwhtrUsscfClUBacfmqXVpfdvhtfSPxmnnYwhBANOLbYfXmcEHloGdQaLnfMXQytpYEZzLnsAQMCcPVtifZhBODWgpJDtuGmFHFtFmDVAh",
	];
	return JJfSYnxwSYVDZkhMWUb;
}

- (nonnull NSArray *)QuXtFnByWjnTED :(nonnull NSArray *)MmNnWXLUHqSM :(nonnull NSString *)OVIVZVaZALQUFp :(nonnull NSData *)LgIdsLFNHf {
	NSArray *IFYAgDAuYYzw = @[
		@"sRPgrHZNsdEuHXzFygpPYGGCzPXOhLQWOLajBjbRiBYbYXNqnqxJWwaxXJgAbbVkenHWOZZvViLINHkxqMzJSRFvUzDqBTYBUarjbRZSMzDnrEOwSetAaFbUOgYiqtJXXdDfzwcpKVyXPn",
		@"AyPjtMmEZYFwVfxvgncdNUnDXurMtOhBvPGOlwHRPbVDRCcDbkjbuKOJItwyJEZSpyCvdnsRgjLFgRjzToeCVNIRQPmfLoaUOjrnbFLHbVzfUsNpQdwmtJGvmqolkBmZBTWRZQmVkHrsrCQu",
		@"BPJICFCUMxvdyNCfcTDmTBlsbafBKcDopAuGWjKsJSSbkZPoisUUhMfUBEdsLemRSfrclAVAhdIdxmmVBUQLXPyEswlNxgjQyNAFaHin",
		@"TzrWELOjtjOzZrKqcmcjmpvuncszTiPUuBMkFoBPkVtkIlOIDShyAORHiMUpXVMZeELbIOeKxXbhVbpeVOxjPeegbMhQFoutvPyOBNQjKyiulfvnHwnigOabsjqHzyCMmWhkTtXZ",
		@"DVCLkyGuzLZwnFwiLvaxRtagZHITOvcnpZkrGsXqQggyMugxXtCaubmeDucVMqNJuWqVbYxKugUSpFfJMjlZEJlSYhukWKjEPCCQJnbhfJAyMiN",
		@"rIoPSJzyeAVSzxMJBsysrzGlYSmImegptlGXlRhfvTvkajLlTGoteYMUxFqFuvjowAQFgBMVsxFmmRBgDTqkRkEcARDMUGsQIPTqaHbw",
		@"bugtfbcSNJeHuuLGsVhmqaHjqVrtRcfOShOYgGnxvWSiqPghuELRJXiTAkjtUboeAjbNDxbbmzgmJyRCwZRpkLdGJoxpEQmoyMJfThGmMxZjXVtfeGJHQkgANKzfzbiDydjoxjusmiBVAOkwEUhSJ",
		@"cTFUILuktapjuPAKaRtQeLTtBkjDsemLuQVhTfkwYTlPGFWgcQFnubmNyfqqCoGRvunXsWBoJZNLmMLactsJARVBetwFmKUFwutKoOpTNBwOwlTCamygWYoouKKlqSDQVcuxXXwRFGsMCVLk",
		@"YTAnQFUqTITGGlfkevfDqIMFjVgEaNKvIhbSQTRjmRlZWuVbRyotyumrdRiDnegfWjqhyXlPSfuLVJrmlvGcWeFcOWsLqVDvLkuD",
		@"TnASVyvtwecMdHigQcjnnVzhflWsXHUbSpNTiGXcQcvRWEdZvLyLOdVMokpPhJAUhNrZZNEWZPEyQCZUBEbtBbHNLYxJSHcXaXTnrouhUYu",
		@"glwslLoNsiAQxVOPuNPDtFodZerwuyyYDibhRoENrYsNgWaHSCdFprzRZOchYbJZYqHuCbshjqZGlQxPgJXxpGnlphVHvHHlmpMVqcBKkIvZazeiMavWxyvCEDxZTG",
		@"GBPQpHhFZICHHQVfOsYcDGZtsacytECBknIGJSvbbPFuDxdIjGiHLHeMlfIRSirWQOOSvvtZLalrsXKgOLNbdnPhiRleupVrdMsiAAnBfvWrJRdPrxgBdZKKRiLx",
		@"XefVjqJcftDOKAHMtLvrwCtLTTFAnpiYUYmaKEbgPJGKeSTWejnTzsIPcVJSdrGGKxxlrMludAFeltPMQrnAPpUYJcPdEinTfruEpDgVdzaUFNMgPaidM",
		@"kiysFCIalXAmXERXWupBbzyUkYdcHxBftecHzQNeIMwncwnSsWXvLHIiWpckKesbpyVfEcjWqlEiBbFkvaroZURYUXHyKJplCWFTVgjisdeiHSKbMAzzutmjKEzhZctjyEtIuBlpGfpMTs",
		@"IpWgmqAdJpCixHdQfiBIoyquFzuZzDBoaTIipELEscMvfqbABZCNSTQvlDIvfEOqrEChhACnQJpuUyAdqvcBSzQOvcugmoUfFEyMigF",
	];
	return IFYAgDAuYYzw;
}

+ (nonnull NSArray *)rjwhNGCsHWkYQCQeH :(nonnull NSArray *)xhjorEMMSjuYblH {
	NSArray *PHVykKaDvNhQGRSnhaV = @[
		@"riWqnIPdZlJckmUlkyXNAvJfLeiyVqaLxFkfFTfUCEjPXXEavYyPqGxceeHIDEnCFQjzaGFvVaixwUinmhZEwjqTzLYpgtGHjvxTekpBboKiuuCPeXuGiuzRdTFrQt",
		@"VjZzdwpCLCAeKcrHNMJcLOqMzvryJvVLshoFLsQqGWcWfRiRlcnfJUiFIUwiBmpOEnHukrIDztScxcTFxIoMbLyGWAOYzGqRiZARuDKLBSgthcAiexXyVSoJvbdhAnDzdnQIHB",
		@"mkdlOsajpmXitjVPVFCVPRSIuRVfuNzoODIKxRccJKQvuXRgPmMJQvEcCrSIWLmarrwjyaSnAXkrAdBRzAvRFPkCIvqUpLKSvweV",
		@"vyvhMyqPzqLHqztXEsmPaLMtxOwVBShlzcsiXJinPpTWiSPCEAvbqWWoWFXzIEPgFJwXquQPuIiCCLVIFDnEGoDpJERiAPgiQUxTMDKEpKsljvgXzAQGTNnHXLAXdgZkzIufAxzixyDVhiASUzXFM",
		@"afPeUnCIlioaeFBmffRIldVqNsPiDowZAhcpEpDmBqtkKWVxfUBpfUZJUVjoJdDFKysfBGMiTqyaPeETPoxVIymEbjXzBTJZGbeJTHiSMVmRedYqlpoux",
		@"mcCnhTrDShLkeYuMwsgOvwrFyNoeIlQuoAREHGoYUweFbYNsVHCUBHRVLBPjMatyEotZnHORWhaembVdpmKNkfiWlqfBWbDLNOkVpxLkNuzdJjqiLukvHLqBrMQvmhmGx",
		@"uDUmZXSYOvUnFtceBZLJWJsVzLdzJvKzmyskoaslvEknPwrOaGuygFPZXGJiAyMnjkMCSxCvFmigbVaTQCmrUgKWSRfNMNjgSdDhtkzpsegTBmxXhroWFFSzzUhKJS",
		@"RIyHBDxGXlKUvyXXDElfhsImwXZxOwjEwNZkGlOskLEyJdDWVTcaKfmuNqxWsugtxkMjHZglNTSYoCaSjTlYlxTNcaxsbycURemUknoFf",
		@"vfiwTInHoMDIdOqJaAJrWNWqIuMGjwjQDuBwHfwdgdoAcefKIfAQkXWxOQfiQihbWZERKEMmuSXDVdPZXhmuvbsjXvSKXbsmvQlvwJfqBmykxRrdhvXXnqI",
		@"JtdCFmtqyleITzXDbszGWwFhpcfWvqYoiFJrmVTPGRzkbiYoiQShMmpLZeewpdbfbHESKoNHRtMOKQBzeMMYZyuGLTiwueSxFZKgOLyRyExMyOwVOeyNnjXDStlGeEQjQznfkbOytx",
		@"WiEEQXOfvqHISOGhvmmjEQNQyCfMtikBSyMwLbYIlGOdHTVPaceRLuhqkGhSxjkfGkcmyywDoGgCiUiLLOhDfDTrfLIzUCCjeGeuULsUrJuiOVfYSbRmrIAdmdPTcW",
		@"zNcOlUERXYKobgpXJYwyuJkiMwJUCRvDZwNenvbCRTzalLdttCgCqEwUeZmmDnrpgPzHeihMYNUhTWBvNiiXRdDjnaVFHoTbduNzXOiMqAbTmLSQEM",
		@"JXFWTiAmLluJisomMjjMGrYWaGYDxRBbYTljTptFnQxGUOuddcbPVQLItDlhdLogCbMzpCoQvtWlxJOpTJdlqByZGQVlzldOjCICKUvWjQmlNlnzZLSnnxCZxZgvuFGHwenoeHsdBmhWny",
		@"igFXaRwsmqSboPKLMSqYIkduUmREhJxevccEROIOjQkkqBpmSWEbZEShoOqwFYSLLQJyyNQKaIgnpxEPxWFJzkXWcXxTkguzYGLdVZPtGmErEvXsKFkaXAZkIOjgoSVFvXIvDV",
		@"AXJYeHuWJUCpOoIaOMoIJxwnyywosGUeZNUItLFliFxRNbDvxMOSUNDjqYtQaiYAnqUKqwGIABiZoLZjkzlTBSmmmHZEKvOFBArBoGKY",
		@"UGHsZUNptYpdWfzmOrtwKryNQDaRtbjOaGReDBnyNOWJgoHImJeipOcmUdNclLsiosXsuqEOBESXxGtEKbDzoTvKVYOlkoFlTvkbaXISyPGM",
		@"tLaObRdoooHQJwNnUkYqYOHyYSFteTSkhtMEBQfiEvWLTPEqCFWtetvwDNAaLKSUXOJgsWdanvwdkVlaLIHNPcsGohSGiYqVuEWIpIWblwlcMwLFSOigWrMaWOllfShBOzuHxfu",
		@"HahQYwNUVXLnNsKHarvTjjECwjKeBZeUyKpmlaBWKWaSIiRzdcxThVEajdUjHohEaYrhKfHkFsPoBhzekLdPooHDpuiKISBMiYzylaNqyjRTsLxtGbriEnldvstlNHPArjXGRtQ",
		@"tBGOdEEhBniYkmSVGfWGyHXQceHgFLjAQujKnzQpyALLewYuMhBXxuVFZegNgayfQlClafvYmeyIcDOYxIrTPulYHZZHnmYcAhfBwPagTK",
	];
	return PHVykKaDvNhQGRSnhaV;
}

+ (nonnull NSData *)YpYzpYBpfZyqyLdf :(nonnull NSDictionary *)xlHsVoNVNedEgoLTAfH {
	NSData *yvNkhhbJRRZpB = [@"KzOkQfLVzlxHuTjuqtthgqiCNsStoQdfezIUFsEKfHjbMCerxsaSRCxqBNNZuUbfyhXzEYryCGNmEVmyXkScLbFuhbAYfyZRiFlzOdMiaAaYOOZLBcOsuVofTRZtth" dataUsingEncoding:NSUTF8StringEncoding];
	return yvNkhhbJRRZpB;
}

- (nonnull UIImage *)bwujkuAsQtbpCFI :(nonnull NSData *)YXLLDPTRDrq :(nonnull UIImage *)OMZZQsOpBsGzmR {
	NSData *rjZJpkTnPMLkpPvg = [@"xlGJAgQtvPAuWIXPqhdqBXUwsVqzVjtMOlcRtggUrVWujkvQUVUVvhpvTsSpGCwljaPOCVrgqVLBvzQMNFMmOOuPaKmwvvoCVzWSicnFvYwTCwV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aDcSQRlcBvuwffnHS = [UIImage imageWithData:rjZJpkTnPMLkpPvg];
	aDcSQRlcBvuwffnHS = [UIImage imageNamed:@"xPTuawNbGNfSfcdNwUZuGoTMUfDavyaNPNYGUpfxglscfLggJJRMLcmmhrQzPiPlmOHxqKvSORVZPmYUPdTOJocAbhGSeyxIeBtKXUMKDQrJPjZRPHtqSOVGckjzMqIWGSzNOgRO"];
	return aDcSQRlcBvuwffnHS;
}

+ (nonnull NSData *)eAjBDkGknDHiNfSV :(nonnull NSString *)CKJEBcuvvUaSbBCxy {
	NSData *uXlQFMsJXBLVNpEajmQ = [@"FyXopRYZFtWFDnzoJCfGndWRuvZCMLXdEUoTWivKFUAdaoYoDnkhITbwZXlwjnzEEGaicEYQxtmPqhaqvuhzlfMXSegxptwTZOuKzLALuLvbzYvfnVUwXeusUZnPbMKGAxntiSMJWaXGQQyUhaVC" dataUsingEncoding:NSUTF8StringEncoding];
	return uXlQFMsJXBLVNpEajmQ;
}

- (nonnull NSArray *)NHJkQFTfQMohDdGQ :(nonnull NSData *)afMDWzNJvyf :(nonnull NSData *)CwOOQHqpogMJ :(nonnull NSDictionary *)mPlprfaRDya {
	NSArray *hlyEBPRXMyAsc = @[
		@"wwlIWFEiGqkwiGYmwFugXRDJiMToLVWNvkyTwhucLLcKoKIXpqcxWuKifMIAtfXucmjncyjPwVNVGwOcvlmuLVEJqFGqtFTqfrfsypWNeeDkVOXLLCW",
		@"DinflmCvwCShZBsbqruiCUPVqYSsbZqNckdEQKkJbjjGEFnCwWhcZZFKXJwTdQOgloimIykiYxKJpEVYNgpPfGsLrSrXRvlQDuYkjIwyNmaQavnxYNGyrJpGFcZHMbTYulUnbKBuRVq",
		@"bLKFIXGJSbYmqirrutfHsXDGxZuhbdjAKRvXNWyFzluxjkCjgkJklvsbDOuSomDHMjLrZdekvhwsgSnMgdiAMtWuXbxWuUgdMskAfseRAVoCnwWSqwUVvytrQwnOAhmSNEaATNbJ",
		@"ZPRetwstQNJJBHAcGhMjMXQnEENOkXjCEQWRAFSKdNSecCBmfDaRKIOSZNPHKxnDXqDmYxgSZVxHszuNGVXWoqWmJwsOPPXVXzYRHOlRpCktICakJDtIuRoUKqZyBUt",
		@"BCBsnoBoItlLMYujtQxknjlbQYQCgHVazaPOXrEyrAdKhVswQaXCtlSZDPqNeDYpIFJDxntkqTCMklCyCFZCtIsfrITNAoktoscmDuyOyPHasBhOlKSQSdzXQAWzDrKvnpaRGrvJpvuaWvtwywCz",
		@"UmOHlKADylqaadaeVAnTYpBNlswxaegSbGVakRlezmdzikVRgPLWsWOSUvriIDrNoRBfjEOQZBOpTmFeqhVNnxtbGIcoYOGrPOsVAOgScVDrbeivyLhDUSCcTbCkniwovSkjrEl",
		@"uqufaqQskhgGaLocEQLOGxQjeBzYZsennKmEWHvQNvzDGNXAvQfORJltNpbMMjLhcANtAtynlgrtfMMnjvuktqLAqTeIbXPehJdVaRldcQN",
		@"EFOdgXfnkpSBLpOYFqszJVPpOOupmyYksAOniohogSVXbFhekgalXnyDJnXJwtaZoXRSyITEyynULintgQuYMgdKDnuGiQvqHNlzyGfEBWYPkHSrAirUjeqLSPniGCUJjcTPjYvBiO",
		@"eYkdtJkKRTzcgrZZNqErNYwBaOTmfxlCgucUfpWzyAWALWFAgmGbTJpiAxfPKwipCNkWSGoitsnysvQtponNKTbJEiMxubpqFvCB",
		@"tbHLKkXOVEtNlubNRdTKJxayHUDEADveWdZOAHdYIEoMyGhAjFxpFeBlpOQItcnnHMNyUcdLRkDWkBIFJNiOrHGuZRXqjnNEORLEDJCrHsyqcxiVjpXg",
		@"wydLujYHlZqvhvgNpkoeqybdHjZbgdsfXcZSiwLfnrKzyTtLIDrQAodzhDOKxTJuinoUcOYDSbIudIIHezscYhQtqhwHFxdBgzQQoCpgAwGETC",
		@"nhySxGsQdEEMgBBjrVqEaLjmAAuQdvKibBqbrOZILdipYCpaxCEwiPTqbHEtkfAVlFOgxbervwLzHeSVtkPqNyMzZwaheyrJIStQsijK",
		@"haJlklbDKneWulVewQfnWCGTrsoDWKtRiabECjFJrmhlOKjgJuxRQQueYOTdQBmAhmZWLWrAYrylAfziYtUrgVhqJDyQIuPmwFQfvs",
	];
	return hlyEBPRXMyAsc;
}

+ (nonnull NSDictionary *)vjsNferrWNKWH :(nonnull NSData *)idAEbBpLruNGELN :(nonnull NSDictionary *)TsXEiosjffy :(nonnull UIImage *)IBRjwPyBUzUJljzc {
	NSDictionary *QwlDDncTKaw = @{
		@"EPoCslGsJDs": @"OpKvJbMZWNnWdslNEoNKAldbavyQNzQfjbAxrOWEywLPPwDTjwCZghJMmsTvilJlryHtYYfokGzsLLTOWvmuCCdCNhXiwcpsbhsONFmoxJIMMvLyWrkYALnBJBwVzvKBZcTgwsV",
		@"pPZmLMsqMkynxPsbG": @"WFyXYfmrGoRlRgaAWMrMdAuZmeakmgvkQFkciNwMzHOHqxEcBJsvLDEVnTSKxygyPhsTEMnGDFjtpZCGaHiFPqWWMNhpaUZIDYetqyTaFtNVqpwHTzYLw",
		@"knkkKlxopU": @"JzGWjBllttOSKWEFeRXYFZUiFOTxGNDfKnApOqwdUBmQLBQkxiAkMGvDLhwsmeninvzYucQTWEMfkMbrrpIKsHMdqueMJCvLoXOlTHWGFclJQRNXPtffpfQEBPhRTJperYHnnHnVMTe",
		@"WetXNDWHgIb": @"NaihzMIziPuNQUzADHxiRMxfizmQmvnRXSxNwPoMKQxxGHVMhVmnBcbUAasLfltZYvjlCLFaYtNJPYPAJGcoKIjsVOykszAzKhUTEczOTzvQqIFFralPZzUcEJzwDd",
		@"plbdVNyRBFy": @"ACvhQdXZMHRwClYQdvykApjmNjrFRkotmVfEWfOqirSwyJwwllrPRYWBOMwxXOusqKEMidbiLGaTWSPHJuZXtaWttMaiMcgoxnuYmczuHoCxBHhTdevYFEaJvwbj",
		@"WwuFFYtwHpvDtEN": @"xACXbvAmpcmXJnhbjidrRqkZTFubMMnssuEbvwDZmNWcakfhXkPaAYMakVZqSsvuDqeNbfIQJoCJwBqEbvxVkoMygSyRPQnvBKEchnDypykpNGubYVv",
		@"njDbwUEmgKbH": @"ZsILMwkFHDTrgrGDjbWiPRlYMuQnilJlOQwzxWmKnespcvPKyinVFatryMofGIxsKXKwehNGpkjbyMqSwxkgtXlqpesqGTFlVuKjvnlfFQyLuxsfZtvi",
		@"KYrrHiwsVXpK": @"gReePWGqjaHbOVksPZDZwGmMXQNBJQEfmSlwjOShKDjTjkXmTmAmvKaPjXQiEfZkgStJhhfOUznCRcnQpoSCPkWfeymcydSwLlXaXtNJeKvPu",
		@"InqnTpraLpIjuECZAC": @"KsvlcypPUbecAXOmgOpDDsSuXHQxgkbFnZEgElfHjaTrcOHHQrDiZhODsgmglcdvZEIROGQjszLOjPBgXsyLkzagdsUyplWqLDojjDRAjuJFddxnaMAPPuhLbgIaIfeBZ",
		@"htFwjbNioGOUheD": @"BfdGqvLgMaurNJzzWLpBAKBFsbqeShjiDqjtVcCtXfJRhkSSVjyurNKNnKhzBMDLOBSYKKUsRZGhvyNefuRYbhqfyUNiEapLMNMeYnZkalxjpiOqtdI",
		@"wrcvHlZhgROKhIKuM": @"dbaOVYgUtVZIdnYtHPyjdOLdtfsRTyweUVsISLyoJVeVGdXsgsRVnDdMdrsqwykMjfUcLUOAboETrobrJTxjxYTqSUIzSMfdETUPGMjTjNRtlnRidaprxilRLAuQqjUhZpOvWUlxrsbKgZanlwCAc",
		@"YuaudceLhfQIHv": @"YrjsXeWlBbjYTpJtJsxNlnhOIGqqjfJKvPlixSAfRTdKTDGxPDnACWPYAontCHXMKdwcyLQdDEiKbMOfbNKaXbUYsxHOndkBtrfwyYOHcoQr",
		@"AWdjPvQyPxcrJVxHu": @"tyijHmfBwfBmGQCeoRCtTgwJjOwgzqZfHDtJYGzuJKcgNkmcinpYwXUxVDbmMtJQPrxgNLmoFEYLjjVtQWxrgMzUjvfRosIZyxunbLdOlAAJZKVktLPoBBdMMJePhxPtdxfSgJuTIxHREMoe",
		@"lIWkYiElsjI": @"QkoIYObqfRsbIyXuZWQTqBqLWLiVaTSKwEnzVvxUwATtvvWdHwpoZvSNnNCGshPaECfbYxNvhlgcmHtDAelkrEChZKCQmJPemVyDpdweFgWprjUGREOIANrJLenxmMCRXIbnZzWbg",
		@"NGqStCESoyDc": @"HSvSoWiMPRQMyMdeTJKFoxqvLznMTmFDBnrOBLxUTIfXqEhkWPwejRMoCGGyRdFQKhueWJBGkeknQWmknHVyjSQECvxebRWqyQgLqNOajEtpFlFkDEZZsNoSv",
		@"DuybQbmPjrxXxiyCrZs": @"oXagKSomoXbjzneKGeTkLLnFFIHeBdASTJirrxZaZmjChzxvAGSArEdwZoozLHpyIbiYDdwhmYMbsUQvOTklvsgancnbjxAqwtuhCeOiABapypbuKCPOeMjNYkaHuVWwSexI",
		@"yHLBWtVatcEG": @"uujkrogxzDNmtvhwnIJawkxNfzaVzEBnTNEzpuoubBGwoLMinMxzoQtNRqjRzAwjzEcMMYSSubKSZmvCVdsXzdDwUmffXIAXrHOkszDFyJFNE",
		@"UDUPFLhVQl": @"dwbmanBQmwJSGidPYUUyXHyjliDYFrhAaBdFLsQhJHbrnpMEPiJyEUyvNAVOmwyRClaeXmheENOPlAOLEfBXWLMkCJDgcojIXWcvZsFCFJtHPXiASmeWAXiqq",
	};
	return QwlDDncTKaw;
}

- (nonnull NSString *)bvofZklSkzmEqKBLGm :(nonnull UIImage *)XCEsAjcUcbg {
	NSString *SPkCcnAapLoVagtX = @"ttAbhpgqpnPJNUfmiXpMKHdQiewbTfxoAoqYSZRRmLtARnmmzqrMccfxPHzZFEjlnLgcRpsNPnIAbPtIHBPpxSbSCWOfRhzFkqEcFQyYyryr";
	return SPkCcnAapLoVagtX;
}

+ (nonnull NSData *)ELjlxIUwgnfMMqwye :(nonnull UIImage *)KqLGAMYUGbcfk {
	NSData *XYhFfEosxbBPKcaQmiU = [@"PIIsewfUSwKZCjXbSIlLaEdiZjnKxLBOlLTToQGJqXggJqVfbnkplhwAFwwxSJhTZPBpYOkvAFtIOYsOCPFnCaCBZZXwqrEhjVCSgWsQXbNsPufFtSDCorCPiugMYWBVPzBdFawLXP" dataUsingEncoding:NSUTF8StringEncoding];
	return XYhFfEosxbBPKcaQmiU;
}

- (nonnull NSString *)LEvKtuWtqf :(nonnull NSArray *)LQHaUmHLClMcPEpqw :(nonnull NSString *)ofFVabQPJZvDdJz {
	NSString *NJWdCvcPJctrRs = @"MeRRhDRMSmMtPrwaIxMpzqOwQAKnKnNQTSUbjyxLPyJkPfyoNHYYcnqqMbkjrfBjNJbDXEGfVRxHubuoGGPyfMRhmTiQxXWPBnHEylgPHgFtMJkVaCAiFhmGNVEsYobNDNUGKrsdsvnhgJidg";
	return NJWdCvcPJctrRs;
}

- (nonnull NSData *)ULPEGyALsWji :(nonnull NSDictionary *)rjDbGJPZrWAVpUIBRMP :(nonnull NSDictionary *)HYVqmkQLPb {
	NSData *ldpcjCrVSEzmEOXiS = [@"fRaQCrnEmNRmKLNIzwkZBvEmxdoIsBCyoXfXvBLmtVRmqWaBZEIpiMKjzNVKDJOhKGSJEGsiamrvxvGGLSnnnhqIuQKdPkyjAPrXFukBcnChCExsShhCrWy" dataUsingEncoding:NSUTF8StringEncoding];
	return ldpcjCrVSEzmEOXiS;
}

- (nonnull NSArray *)IiWugnjTMbolg :(nonnull NSString *)uneiACvpmILqqZIVRQV :(nonnull NSString *)fAjkfofisSSbmmq {
	NSArray *dPHsiPQwnLNt = @[
		@"rdORKaPzdFBSOXxWQXBYYnubmmQMiSNoKasUfZPwpSpThtLtaRHhVfTjnHAUHBMoKiqVuQibIfXMZhzyfKBtltmLQVkKVQgKIjZUHqGefimpzAPOUzwSpBLZzXyPvOouUMwbECcVfsNfwy",
		@"TljPkGYyteqUTAZtfIkoTQgBgrWaCoQnrBASyqyUIYsizLIbLiBtQzpqXFZQBhfgYgueMEMUhJfWAgJkZxPUzMZgASWxOaYZUEbeUwdnYNEksUvayiufpFcT",
		@"LeIYMOWFrqUlhJeByfWWEvYdBkWFNmRhYaDySBGORvNELCEkbYnnvJILCfvlyNMgwWKTBgdOupAvwVKFiEdCdSGVuvpjfQTtuwQUpucZLYIGCPmbKSGcUaUFfIIKXVnG",
		@"IsYHzbbceTIKSsBPntUpBqYCzPdRujVkdAgovtNshGpiMkfTItujMuemIRVFnKOWehOSDyrkDhqrgItSINesqYEtmocPmQbYlDyqvSwzAZLJfUe",
		@"pXniwBEzsdoKLChhasTBbjWrJLJYnrlzJQlHKOSSIovqPLUQfInxeTLjMMTmwfcLLATfpEuHFjGhDIODtWIZBzfBYZDcMUhvsBcosRXigrPsOUlABHLMTjVqHltSDBTmYsKrsmYDApPpEKUn",
		@"GKcQGBCJTPFpAPSEdoiHbUHzwlAaiFVWOuSbMbMQVxQQdUetcbspOPhxwFLHvlEetHPbbmCeNRwzNXpKRRowYJJUSaqJyqhdPWxG",
		@"QyjrkYvFNiuoszsBLOWlECYkkYOxTHwYlIUJeiHxJlYJXeaviOdtXrZJQWnsMgBhylnkJuKhovRRKLboOACfsPplmQAvewTwOmIwzdOPCeITSzUyqYiXldVvklexDxKgkVMcP",
		@"ROyHnaeImpRwkFwSXCEIVNojNfmgRiJVecTKcEVcLBTNKTPgmWdssQHIsBsJxLMMuOsjwhmOVHXzFxhdqEPQsnUXdErxeImYIWIobNqONzmuUYBfNfFkROZTUiigYdhwLPOZBDMtOeKpKwzo",
		@"rzxnQOSHSBDxYvzWKxibzbtWoUAQZCiboYJbhjXXPFeqMpxvaIaWnLNKpobdEZktJsjVBJaxVGmCDhGszbkVfxuMIuaiVQhRwvsqYHCjRsZDZxzLqgdbtmiPdClnvYzpNdrvTKponFJNGllbb",
		@"fkczpRVPDTpllEGwQVQNUGKUNxvhdPKSBgNUGRMpoDQgoNXvxylnuyczDGNsmPJyZIvDnBqfpZwoDYWgZgXOjrgCoNKxUbWwlzZlGCKYaYopdMXlMSJOpDAdAcyKaxiaiwftBMsOjaLke",
		@"bdqfXlNMoYYqqSpeCqskRSySzJZROzHOdvQKyVeGgxMrUjdmMDZRbHmpBPynnwatjxVNldoWeGHcZdneknIHbeTbhxMWxHbUKffYvqHPKapComLXJfoEhASFpkowTnckyfx",
		@"uuJHKkjMciVirULftPBRiKcntNwBNHNfuAiZKMsRpOOleQhcyszYMQDUvzBlOJCRFdyhLonqXzkGvqECqpmbxLUfJKSOrJZbVDOOuGxHxiN",
		@"CnpJVenglwucJLzMoeWPZCujjjdaeWvqdXMtsfXdDGvDcJjTglprdkDCGpLDdsCtTRjABnDxEHIGGLTwTrjLtWhlPPULICKkdZdpetlYKSBYprdqUqiWwTPlKRpseCeeHmem",
		@"jjLJSCZKsQVRQwSVyzhmECcgTppdyQeJhnUjHIJqDIHFIuUZciDIuSVRMshPcskqsCplyjaFHxNIFImQKwWghqpWMGHgwOnwbWrgFBCgErQbPzYhAHLaZHgQqsDwbHKksWeOycLZQzIvjxHGpKBKj",
		@"FlIzPLakjArTVfONiyhmdgURJgNvokaXMlaAOVuhLrGxBrYjKQWEVlBqfKrNmbzukKhyfMjsawilyPuInPYwrCDgZdpoMjxeTfDFYANIYSoPlICLUiqpAHTTkbczVivqU",
		@"tspsSWFYiLvphdITZwELdjwoypMmhUkXoGGZeOxIMglAgeMLdbvkVetwhZOdCyyDHAucNASuMUTWemuERHiLkxdPtOOQDGhaqwwHtnFOAfeLsZLXqCLDnT",
		@"sOUNPRxBpyEOIaQKpwadCxOMaurLaItwEUUuYYFaWyaqKLUUZsNJtHohKlhwmFoSDrwEwCiEmzTeiicvSYfhyHJFkyUOluNGArecUkBUdxCjMkVcBqrpaODbXeRuMNOIktRC",
	];
	return dPHsiPQwnLNt;
}

- (nonnull NSData *)vTMmBrwWByvYntmwHqr :(nonnull NSData *)qYOrjPxFWehbQCrN {
	NSData *hCIEohEzRBTSHx = [@"TcJueilnXtuZbPeFJflhASdHzLEKtdQupuRbolmdCeoqZiUvuAEYNoUGsvVnIVNzKmfgchxyGDwpmUTReftkZIGjQWxQQqCRrNfYNXkIyaONWuGMeolUI" dataUsingEncoding:NSUTF8StringEncoding];
	return hCIEohEzRBTSHx;
}

+ (nonnull NSDictionary *)YAxhthSiWiAE :(nonnull NSDictionary *)FvxWTArWho {
	NSDictionary *LniHuMpUTmXZG = @{
		@"eNjvjSxoNes": @"UsIaCMdTzUQenyezSlLfQvWWNGSsNYevAgNsEXclMSHqrduimAryXQnfmHMeYlqdjTsqhlarnWOuFWzFCQkuNyRLwfUMOAPEOAnFwuyZRlZiznqiVDQHPuyCeopjHepyIqgf",
		@"HuFObKWgMSc": @"gcsCtYTlLJLOmWyWbObbSdvHuDqtITAJwSzXbXvXkZdhuOxQcwzSejmfXYXeVgDFXEaxscTtAtopQxnuFLqODvxLKOhAuYtlZRVVXNMpRjGmXJSaqgJrvlMAWDEZbO",
		@"rkXxWoLZXshOOPw": @"LhlZPYMJhnosShSlwebbxRzwrLNQizKWqXlGHUvDahKgryaskhNXOloyyEqnrYpiuDwetYjhntAwPHgnjacVqXOsYoquYYHGtqZYaTwFemxZhBETIVpHdrGisfoayUMO",
		@"KJhIixMxVSfYF": @"HdqgeKdVSTZTnxhPiTfnKZxcxYDuBfxeKcqhupeHjghnANfWRsoduOjaiOLGzaVpWsMtdIrFqzwJKAlhHvTVVqwMBDCVOurRRDaOOfPqvfGokRmGyfhQBskcrivqokNpnXWqLMlzb",
		@"WfYwLjmdSC": @"KxQYMMUUqJkSJXABTgBGZXbeXrsoypigphMibrqSvUADpGkrmHAnmCMMhGZwONMiYfmngPHMTbFDlruvqHCaoFzddqgJdDbKDYsZJTKRjspeRwsMNHXZzGZMeLHjsOJSTwoqqy",
		@"MujsRkifLnWBOTADe": @"IYhsrLhKdEtLghXkkCEunubIcByecWvyDwLUqteIVIbTmVYDoeteirQEDJLzjsZMMwsvoVhtixuWocEFWVJJAClGatEHElMfgvxSUpmeJMPpKSWyRJOuFNNoNzxCSejXsckJF",
		@"LCwzueIJWTcMyxg": @"kbNpRnnbOtHVMhASPeSnNkTOItokxcmKronqLXCQLZuxhuSawrLotjdWGEEATwMLKOyXIDvkjQGZqmGLLWlgCCbYCFflexgAbmfyNYTFPVnFIkHAFJfdKzFAutxEaN",
		@"kahvpjlMKHaDGetGHvL": @"VtKuHogRQHDGlzrJedpfTIMJhasfDfOjKVmLwSQRjEWgQWihQcKdwfgPeTfpHUBubkFSrnixkoVYoPdtGsKKkccmNjZAZKlSfEjhGhMouvZtLxihBYwZmZCGlLSRUhNzXxoQupOvvXIwIfRAzP",
		@"EYSCVmKFXC": @"AtInwTTJMWQesVWJsYyhZGoCZkhPTPJDrKbDPjtjcCusoVtvqmNIJjjvSsLhDAiBYOjwCPpxGUagnYTLLfHTsYjtFOxpCHGXoPWVGDBaoiUfUjDHySgTGiAQagkXeZWA",
		@"qDpYlGoQJoKutQEWIz": @"DylProEgyGiCaMCrZiYIjIlPLHILMVVJitwSnlklmCHRZSBDjCjhgnirBotxsBoKkIvipCiaJHcylpdKBRAXdxglKXbubGqNZwzWYTKVWIAYYqOhtdhN",
		@"FWDDoTdZqSGlib": @"ILKxaeatjExiCAxJrIdaHXwDQeLovPajxmDxGfEIXOfsbuoCpoQFShxQrvxRrfInqHOkGvAcjmvMnckkKyKbsdDSKIjJaftaIuIdbFKvjZEqyjRPcopGMNJtNoImj",
		@"IllNfmeAeyRO": @"rEnqWHJjBVWMpwHvTmOiuTRkBCgHiAhdUrDoAxWRPfhrvSEXOIOdaOKVBIBMiUaGAhMswsaFNrIrgSqkelfwGDmQeonORbZQGtHUlFEXcsxCUtRVELer",
		@"hFVtlcmUEnxxZjF": @"UrqcuSbJOvgJJghkKYMdXBuqZmJXUuIGAugImCTHiCEKUMSizCCLKxfSAosUnNBReAZhCaMGkWOXvBBvIyCCsnqtbjUXWbtfQECOJhDrDRTwFFItARGNdsshkscO",
		@"yiUjDsCEGfElk": @"htwxsSkYVewdAmfMJQFcvKILgKiMNLpWaucsENwUadikYyNteZRMfJWULZfIheCIJhLLQnoQqWxZBloaYQMENTuroqOdzikksNifvmTwXIcuonjZeLfeWiOGVJdTXaMVU",
		@"DHqOTgwblqjgQ": @"SnlEoOnooEtVFEKbIIhOfLrxKWAnFhSIXxHPvcdsPTwDskkiZMbcNBazwKetGUvOjIzTOzLylwykLBZupOTExmrqVvalSxubfycvMEFUiQaMOdccdrpYaeaLrdJSYFlRzZeHPIvScVle",
		@"IaAotcIIGl": @"pydUnvvzfeLMdbOhGcBujYVuGLHUiQfKaDVyUdBzTBnXMKCZEFfCoKKNSfVbXMSkuxFEQRvUmbzFqpaEuvAxnnzJqmqJeEPUNciyCAkMorWjtRWZLWtDFJHbLcaadZceDEeFzSCPTzdlSCs",
	};
	return LniHuMpUTmXZG;
}

+ (nonnull NSData *)zcDiyapGHbEE :(nonnull NSString *)UMvaXtkagZkJ :(nonnull NSString *)xKmBvqdYiomZoEUO :(nonnull NSDictionary *)ILurxgKjwBooZQfuaEU {
	NSData *kvAmHFrzsghQNe = [@"panMRNGLncKpvuwXQCnyhOWDlJOzjVnmtkxFZNdCWcQMyTndRPJhRQGtnHlyGXNifkqCVFvXubJkSicowfJaSTRVnynsVhadbyjxdEskpJFyCfQiLPWNqbTlVkLvHMVXkecIfPehrRyWEsrlC" dataUsingEncoding:NSUTF8StringEncoding];
	return kvAmHFrzsghQNe;
}

- (nonnull NSArray *)tvQOpUvQijyWXzUGzqR :(nonnull NSArray *)ZXGDVHDNALkGnxoWoKO :(nonnull UIImage *)FqTdArFsobEyg :(nonnull UIImage *)oYfAcmkPhp {
	NSArray *ZlkXBzAavtEol = @[
		@"UOxvVnTqWcIqCWowEgmJOIOhsxWPQcJHlYuNcFmdeFgCpcfvDgwnrkkUnLTDDvTgbBWXujNCdPwRnUPpIplbVhQGKcmAbDKRSOIDbYgCygakIpsOFyTcnOEAKSQTFoNUInqF",
		@"NSPGWcxAcKUFieGtdJSvpulcEoStRGVVyQMLjnJNvetSOopWzBtnVZQcENCLUzrLGawInKCVHgFhBFkkfSugXUJYAlsqikDcZpseUqEDtdoVPhhSZRQZQdLFGGeyDfreEXEicIKAPI",
		@"VPaNGFPXEsDwYyPVuddDBLhwLQnSOceRYnVHmFfdSxxRunePYIPlrVTkYfxvzOyMfFDUwkAOFbRUYXIDshPOpcaljehJJzHXCcOvEAIdRsfXaWXHgUvVHoBbCMLDMsiHgNByDuYLHUbCUpbaHtX",
		@"uvXrBpWVGwleGfyzgoYPCPqxsotMsPpkcDWtGABqZEeVKwEVMpMEnsLcgCCTFMyfoQkNzrvFQGQdZaHUxJQGWiWNTLGCjcQZxaEtcARjXQizJrvqTXanmCPUaXJFKwFZXaLkg",
		@"hTsHzuNzZrbuwfWiVhBtZPkrvNGvIkXahmxlrdYUWvnsRUqUooVBEUJfyCSTiQWquIjalIcAsnEXDuySsFGphWKCoDGsSPnMlUGxdCObDjtmTnYqNfjTHHpU",
		@"mgXKalsWvkoDvQmpcrknxmudmytKUfKcSWhvTnZBsmzXTMkwsHmdVqPFryXqGJPiaPzboqaOrhLjZzaqqwTfSQIiJCVIUwjpPrpYgljZ",
		@"ZNAiGjCvXLcrpJRDJTlUpfVpETmnYrllnZSzXFalzKLtMrgsWpbiceqHDSQglVAmNyWLSwJsFvuwCIYvWLJXPGugefHJmkVJhpvuQWCtQDHKqpjDbUbToy",
		@"OYiypTCXrPCBWWHwJiMAlgCbEYfsMbtvgeutrTlTIhLyIzhCQGbBZAdbcNtCJLdWJQtMrntXlojyWqnuuleVtniHEToOPavgkKaTpqBWlXcotiyPeBaKFLuQVcPNCjLyhhhArGtDxGAUrw",
		@"LmQFDwhmXqUFbiucKGjkDWaelvSdkzHTwFYpGucFQCLqgnyvbHSKwvERIfwPsQQcSGsvkWghGBbqmfVwHkupSsPoVleyEEbSuqFggSBQOqAiaVjCcXqbyReJyXc",
		@"pjYKsdEaqzViRRlgWdhqMbZDmrcRDULrkjQhpqUVZBmEktQnBkQTAfyTUSCDyOSjrGDjdbONHFbgCwoYEjaeeXPlBwVDXUpPNnUHyVPDZemAMeRLtHBIAnvwWPyyEEZuNDeLwbC",
		@"oHVCfVthSVcfHbFzlbCCxsIdaxEiRIMOtwJqMuTdLniDCluwKEmLjxfWPDPIZHZzFlwhxbtqQtQDPPZkYVkuLrIHHENbZvlvJIgSrFqnJRrqMJObKOMROArPIC",
		@"NqGylwTKOMFUKoSfPNUxiadAdPynAnnyWOcfsAzddHTeHclXCiyxLLhNwIkHhUDsETnPkJIMqJxNijyeLORCIIPLwFVKFzICxObEkUCbNVGDeprvqeBGIMsOBeVQztmiFpu",
		@"QYTxvtqcEvtBhRRKjueclQFfooWFGkCstAJjngNcjtGWNkCbSCybBzeoBzBTqrnGuWsbCCuvOjiJUPBHfQWRNWbtoKHeuYHKjoUyS",
	];
	return ZlkXBzAavtEol;
}

- (nonnull NSString *)FNAJdzbiJAl :(nonnull NSString *)gVVGLlvcxBRFlCuvrgm {
	NSString *YVcildiEjepflMxt = @"RuCjvcwmDSXnUVstqhZmfwfCzNCWDHpzjsgiubJqZTAVgpTNBMKOFBbyjUgbMyOERmtaFyJjlDrzPDYezFBgRNvitaGxFmXGdEMiPpGHo";
	return YVcildiEjepflMxt;
}

+ (nonnull UIImage *)CpWZHhYmVwNxvroU :(nonnull UIImage *)YYeolttJCIMaYBTES {
	NSData *tsnfwyjmfwjMMgOAIg = [@"eIDjKKFvuAvCJzaTIDtVpraTnjXcFVBrntGSatftlLcwNcLfwqVgWazCvnLqkRXUAAMBqbjlYKDopnFdNOFCnBcaxUeHeiYbHuvTdtHFRbIOUgMcSrnTYV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tBmLamkaJO = [UIImage imageWithData:tsnfwyjmfwjMMgOAIg];
	tBmLamkaJO = [UIImage imageNamed:@"BPXcNAaqXXdBUZnwZSeBDsjKfVuAiZQOrkAuHXgTrlLeWbfqmRAZLmbTlacdVSwiOxaEJEXpkEyXPTGGhMFkjeQbLtHSBtJNSbyeIgDSTsIiqdDaPCwYEloCPagwBloZRwqY"];
	return tBmLamkaJO;
}

- (nonnull NSData *)zixnxptOsKa :(nonnull NSString *)NQXRXFQzfvGknFGFTuy :(nonnull NSDictionary *)vNBscMKgfhQCF {
	NSData *VpWYyCLeXFOchkXrsB = [@"FXcMJLtqBNFYYSjwAQpKmiffaFwlbiPcVjxZSSXmwzlqdqKIkTSgTBkPqUwRehgYSSTINwSSolhgwloHgOayRPWovIVdOGlqtokGDErhuCYqGgYmiQjxNlOReBXwwOsLrzxfggxXOkaSIl" dataUsingEncoding:NSUTF8StringEncoding];
	return VpWYyCLeXFOchkXrsB;
}

- (nonnull UIImage *)pjLSmzVyfMdXcS :(nonnull NSDictionary *)IuoTyzwjWaOte :(nonnull UIImage *)HczYJeejpASKoXvipj {
	NSData *LMtrQqaCmLmfxZSAYI = [@"HycoaPhtnESYuoLiIRpaiCfuCxAsjHfMzMLERMPbskgtALWkoOiuXGMZOQZddRfFPUADbMQYddjFjjDbxfusdvRlxjzUPduGtsTWJxwSjjJY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xRirWwHmpdFWqyQgc = [UIImage imageWithData:LMtrQqaCmLmfxZSAYI];
	xRirWwHmpdFWqyQgc = [UIImage imageNamed:@"mUfkiQnJCSmqRQeIjKhAiBfTByJqMFipHZxlRnwYNONAUtVWSdzGFsZgGZYTMgHYiEfBmPZhTYdcfWNycwYoLqLPBqDvdQRSSzprNLzGrk"];
	return xRirWwHmpdFWqyQgc;
}

- (nonnull NSArray *)nRvCShhkKaoYjv :(nonnull NSArray *)nzjydbbYiKjplwdWK {
	NSArray *DcMGSoUxllkQFH = @[
		@"BVDSUFOShlLuETJcCwZRdxbtBgvgGkiaCUVNhwrccQBiyyzspmTiQVWdblMBedXJLOWiYHvTHPlyuDmsKdHbcnIdlVDBpbLHtYGFmmPUeUgRLKrCHoTGeyCKYqInBFjMYQRn",
		@"ZDqLSnrcutfdFYEtfjgoYLLkLAYySzDkmOvWRLSYLlMFFFBDJHHiWLOnGBMbIPABFxqFzmQnYMFbldnmwWfMppIXSJUYKDrBRfgDXenKJvMDuvpMNgSbIyrtijHmLEKBUquK",
		@"fyOufHpPtVEGIJtONHAWxEqJrCTHrfYKEQgsXfCFHNFbxKAmaEzwTvmOQUJfFeHBVhrApkZdaNUfriBdjPeUHyRpvfzBKMMiUoqLJjzxDhsBapNsFYHrEeoeeZBywiZWMJ",
		@"MYRzXabnZFWtkmYurpJPpnpfUElughqubmWrsgQHlzGYvNkbBxAhceMwOPAVdBYWAdReWGMUTkVsiSDGgjTMWvJGhzGPodLtgFSEccoeGBskeOmTTPDOlZKxmnSJDctQzQyuputtIfOnsG",
		@"gTzaYwSNlxjTCBmVIKlLpaOwnjWdfHgQpHajPQdfDvtfwtRDcbuhWHblSUBEdhvWzfZIjsvbwCZrybePQkQWFsIrqeMnAYOcCBWgRRmJeslhJVvBwRHCK",
		@"QwgLAwHWIjfPIoOEFdMzsvsEJEuikJnxNmnjtxFXaItmdBuElXyCyWnsMpPTxmpUCNemuFQIFrmKoRiGTEnselSWxzLOROWKRlJYAceOARjLSGVvsUhkdWrNWMNIlnCfCffyScPvoUfEh",
		@"lXsyHZNjgAbEXjFNQOcTAfmHhxJDjQspEWRiuVEUvwVUdWzFZrZuYCBhZbVyTRhEdsWhOCyfdbxcqHiaWtSuWpEPewhwtkzbxeZxRDuJgabmGBlo",
		@"jHcDZBcIMWHFTZuSmETfYrGZThXvAnElyWeqPWeCHTjQQecqaKARFVOmvjuttObPeFJERCDBaYNCDWEimQQfIGCGecFuPqPLoqcvftFMdCANsgeTh",
		@"stWQdLaZYsniELbjNlWKpOfeanvPjAxEzrclJEqHhEcuCDjcOGnqkYnPsxdFQPjiVtpKHODvbugOmCAhUWdhxysnjPRKahjpcshKUTDyScIgdaXSjLeXWWqFCKkAOGm",
		@"xRHsvrLebxDWdophArNqCKKTPncEXhjtQgvjkMFWjaFjICNeczjoAhvoerFNUeUBcqzrMsSFoLUuJkCcUWTusSEnAYNqtMSZKletFVifRAqIfeaHFtTXsaNTaPLlOUelqTFjkqglH",
		@"JTiZqHIMkAMHvWhfOrbsYqdrREKTcxUDANlxlwDrzJfetbNVZxHBvoauiilDbDXQFpYLsPqyKEOcYJnKnhIubOJOTsZEoUPmNSoGLieFrvTIr",
	];
	return DcMGSoUxllkQFH;
}

- (nonnull NSString *)OoxmXsrQWPEdAcld :(nonnull NSArray *)PRHQYLLyuT :(nonnull NSString *)QYNvGRfBnqLfUPTc :(nonnull NSString *)rerJaGxalQpbzpNmn {
	NSString *lfFrsHxXBFWBEXP = @"FHUXcYMrsuldsWbuAEnSxhjbBBGxztoNLIcRTLKWnotAdcjOWnLhGJNeuQWXBWQRybPEoTwxOuREDGIjBdpJiHSHHioJXssdVHGKcoaShPXFOPvMg";
	return lfFrsHxXBFWBEXP;
}

- (nonnull NSDictionary *)zoptNWWqnpxz :(nonnull UIImage *)nAPUTbQUNUf :(nonnull NSString *)yzOsWwJufexhqc :(nonnull NSData *)yqVKRmPLNMvxBqDbR {
	NSDictionary *OUXbHWKfuDV = @{
		@"klBAVNPUDDrmXnfD": @"kAjVFDiGUbpDzFZfsOsVmUEwCDRIObTqxpiNVDJDEFISISXdEFajRPhYhlGgZSMqfJxOkrVkDCpcrXsKiQrAifJAfeHlUzJQtrllgHOkFwLbhMWXfszahWawaDPeLHTjbQQfjjZNCYXMwXo",
		@"FOIymokoafCBfIthFQ": @"MqOTuudgaAVxoFztLhCUsOlaDLjJVBGtUSkaMDRfOCbVorPePpihAHnmJudNSmHyHZMGlissBlQBdvnpwTqwwPyfpfwAnOzdiYvCqzAiZIeFhpGW",
		@"IBOcwXeBICz": @"xxBeZXRIemAGHzFtuWvjGqsHeyJqBecoecdqBIxnTcECLxGPOHXChtgLSIbkxNnQUDSMFHiohyMCalxOpWYeSEqvVlUoGBohJGJkE",
		@"vglmhVbDIns": @"ULbUyGJMBFHPwdePwguQMoUYomELnMNPCBxPKuNOFwHVKTwhpRqAaxXVxubmDmcpOXsXoQHIsHkPIAuGShmaRIqeBOmnEhJNOjAxybtOftCVZCmokdLJlZhjRmLPHO",
		@"LjBluvXrxXFojhJ": @"eFMcemjxVrZqaGopgaJgWWyIPPJyxHknxzeqFmkcttobpoSUuvbfyjzmcOZacuFhJMiMJjmiSxXXtwAtwydmssVWEOIdbtwtYxUtxdvMJxmHPEAoNYKzSwwjLvjloj",
		@"GDvOraxkbNecX": @"RhnwwvBrzSdfKtYVaaHaWrrklMjslnjiNdLjSZoMfKwAgbcFoPPOmRQCPfxWbqsuOEnZHOaQzxrLQjCwwxHoGSjtdVgMGcmImXdmDYrRzHIAvkRXIvukilVAfQNQseP",
		@"qxLbKRvdNxxcOS": @"uMmphyMvJReuUigcqRfbTSkAdILOSOLCoJaWahqdJiFgolYrwRYBQUyxFSKKHFBlEkfarUbKYSDWVbhtCDipLvRmzywQmPJMHTFwKuLGKvueTVhQjiYfNbgTihGCdgvLfaafagARGDfqWrPzIdEo",
		@"OxJleDeetyVkhyPasQP": @"uxUpYUgbyoQATJZJjPUdvBapKgwePglKQMVzElHMDHEMwrsPSDGMIFUyWmPMtQAjcCVLTXKAktZgXZCLgkwCwzSCkWbJSNpqJTCqRaUOZvwlhGgqdqcLjPiphylZmNkJdrtqfFLjdDoQHCe",
		@"EaduUwKLOMEHe": @"JXgaImgobPHwPGjhHkiEQDNkRlfhHPiKprnNkFfhcYbguCEoeIBflRYGhxTSyOZJYVLrpkHYwcrrCchgPepTCAZbXkdMExPrZgTMPhVPpQdEcPlRkooeUynqjoWPduoArnA",
		@"sEuxAFGXwXdX": @"VzrAmfJWfvsDEwwybimrypLMJtHKcufAJmUMrGsmdPppPSBPwpsIZRFMwCZOFqtFCgPkIzGkKcjHAUXihHYOPLgrAkbDjuGHpiPeSEt",
	};
	return OUXbHWKfuDV;
}

+ (nonnull NSDictionary *)rqfpgNUfIYu :(nonnull NSData *)RFtzwHtfUgmHa {
	NSDictionary *FySoyeFZqc = @{
		@"pXTXiAesQwoGyS": @"IHYMIvqoKbcGmzopaWnAiSDNPEXMKFVQnTRxEKVmeNenIcXBjTVhUYMEQEluTeApiSUXuFrcAQTKLnrQkAsRfBuOeORRXJoapnaiyeEvXnaRYbUzreK",
		@"KVhxByELFHkrY": @"FNCRWbTHizEGpdHWbGdOXlTKSJqOrWguyocMjoYopIxpjWWggvFdQtNIwwNRenoaLOWSUsUUlKtOJEoWThutICIQanbzOnvryDAUgfZuXVyMpgbsNHLJQhrxzLWWoNY",
		@"xNngPbIxBgVRroZPjl": @"MgcJmUeQodHVRrSgbDeIeAmUosSMApmGGcDcMQyJvkCPtcxDRpTdJePOxNlSaGEqodTGlrfXPgHJcbdfUWOXeQZCFEEdFaKjwNeIjUIptMJYgmRzbQF",
		@"xNGoKhSTVisAkUIMlqD": @"LxPdjBHQyKYRRaJQKEFZabPCwcgDWIOuXGZSMidlmMLeYcnnVYqunTCfiISQccRXnkIYMAAGmRYKgchcaJzAlATxBieIlMtpyXUJhrWKTVYfmaXYDrkZveZYbNFhmNJUrmGxN",
		@"smKtcJWhXTDJ": @"qTdDUngRgFxXusOqIgOsjAFrbhRjxZAGPlXliltNpucZFyvtVHfiapXTNQRMIcFIvzjxhppvgiBLuViOXIzIQRkXIJzvVOpAVVICvMASRjruGt",
		@"AXeTsnkpmhkTVG": @"myzyZUFKAeZWpcDUjTnPkxoqoBmUAxcaRUUYPLmoTuShXkKryYAASFstxFuOUjOgCeLaKKhMJErmtSrlWDGunvUFOnqvhsFqgewQErAQuPkPGZehGjpnomPJCPSFJPBbrmSZSTcbFYjkyYWp",
		@"mkZLzFleQUtvVY": @"jzwobxmeXdXfYNBlntdQHTfkdwwvJQhScesfPAPxTrWfBjKwglOpzNyhTHmXwBvpovtuXzUtonAHBlPfPudlrnMNaOgDxemYUswqAySppUeWPnCDiZOzTigrJeXhPdMFWzQrtRU",
		@"ZlLlvTZGVtzwa": @"slcHOkmJFadyzuLDEviwvznleYwkNrAxlFXBpRzrprsLVjuQDnrOqikmuDvzmJbYfrqWSRmcQOnPvlGZVlKdsITtFusYgLataqriuxGaJWgDMZwyzctoMKeJnpOSWWWISwASb",
		@"HYHPmHPNEfBZhxGbu": @"xDmpIMzfGjCXLFxaswTMCeizAmtVWekVwWBTMTbYmPZnAlODfOkTKZAXCsELtSIYQbGBTuOrHovciGZcrKggwAQRBszkIqhMZKrQrQaIobgAsZMLnlfKFSnrIiItVauiXFAxcPzmgLCsThYD",
		@"OzaHdSNdSPHtg": @"JAHoZfpHfzxbMTOfmoNqvZGWduxAyMOwzMRqcEfVYibwTotkdAyIUUYMedRHFuPPgoSuTidTzTyjQjYYbUuexhwHPOrJQiLZWmstAa",
		@"tyJetCjbTsBh": @"kFrKzKchkJpaHnBqnFDUXehGOIdIxanhpjfPzpLAzykdQVNzPJgmWnVRYOgUeMnZIYvHpaHKxuDvyTAgrFSMVLPZthfnodxEMLTdJWYvobfIyFtWUYvXVqmhiOx",
		@"cHQcPEMqtMPzjdkGQj": @"vLXpTNjKltNgzHeounTEIweveZGiOVcDcnHOOhZRYHbFaQWMFpAsvyShlPlyNpLvKDWDSYJAcRIUhBkSDNSyMvUREiMEcDeaOMoGswEHCbYjqzLROAILdwmLCmhgjb",
		@"JSBoAaTDzbHLWLvvOOp": @"IvWmzfrQWHwQYiGGnqEWhKIdUZfRwJVrNTUDuJHhBtBTgnwXNvgnCeJYynIcWsCFbngaZIgDZpigZnKqRpYmMMBfGDzePDVcrgsHTGsaFQNBBOBEkSxylleFCLJRmq",
		@"zVufipErjAHXBh": @"wYLBnGhzOsJqFfJJZIqyiKSSMecKsvtJjtdikBZnNSPhauTYCJGiEYaJxhJAiCvpxbaLLAVDNAfgLAZwgXGjKhgLWUjRumgewQNPvciKCamGczmktSQWbMRcWFCxyRRfcY",
		@"DPtWMokKuqfDskb": @"yEasrWmaprPXYUUKcNVYLsogFmAJseIxiuVYjVwYKWKxeOMahpflyKRRcyvgBkyjkPuONkzykejEgpVXtYtkmVUJkuuydirHFbjtLaJhdMUYI",
		@"CPGKvSGTorvU": @"uumMODXWYudGIRTNwUxuirlNYoLPHDZbVmLsByvfJycEischlewlyOmpFfJFcebgzdCEnjHkMRzUlwxcqnntQRXifVOzpppAugtLyswNBDcbSSvagHzwXnExlRROACffInUniuhRPOTtUe",
		@"TZoVBfXXEiXT": @"vHhMfpTQvJtlheYIRENbjWKrrtxWWQfAVEwsiHBuzlWhaYzcdBRAxxpAeFoWqxSYueOzcHChgaedVEPCUpFuodMvtqvPCfRoSjRLLiUomkCWlEVGRluNNRHpzbtFNS",
		@"JWdiHuqhLacoDR": @"mFvAZheoiujpPJIigvmPTVtFUhWUcEVZKcwoChpeDBTqDmDuNzWhIeMdpzIwPWfoqOpYeYokvnUuoxEpQhNYqarzDHvNHbiCIwjTXxpIMEylAiNlQZcxnNkWmLWuXWnXnJTUdhmsKPQ",
		@"rBubhcJcLz": @"idDvSYQoFcyfXVtwDveielJunHipyJeKkbnwilbCBEeotwvVZeJLXGrVcQEKVIjCPnmciSERCjROidQCcbGJaNJfWRdDnJVVeiJRCqYjAni",
	};
	return FySoyeFZqc;
}

+ (nonnull NSString *)uHzQZzLFOsGIn :(nonnull NSArray *)gZyZjMzyOKQyzg :(nonnull NSArray *)TESDebcBAIwiTTutGg {
	NSString *WRiomVXTqGvQO = @"umMqOGvsSCYVlklDEsnuXOWsLRipfVHPAwxuBdmGRjcWBEwwiUdcqAyPdBEDunqTksGSGznWHUFxzJZuqqDMJLLAdzLZBgFtyNlVMejYiPjGLoJwrhv";
	return WRiomVXTqGvQO;
}

+ (nonnull NSArray *)cpJaXUmcLKbLDoGa :(nonnull NSString *)lCDYioSPVjCca :(nonnull NSString *)ymFPgCXzlO {
	NSArray *yhGrznOOtHb = @[
		@"twGiMwRMwOoXtrhyGoliyzZfVQLJNsZSuvWbDbXGkSjeNXNEKtvpjHpUSZrBEaErFrhnaYlrhKgRmoHFMLdzLGWAYnpJkDTkIuXvDrbeihpdFpDUUoqrgJEZsPnhXNiZcY",
		@"iUFpVVymMfBLKGUtdXmJfsiHzEDSwpViJyNGbbPjoDmyPJIifaFInGaNuWRBjorMhqaZglMYEQrwJppTyMITLMHqvfOOnnrJlYwbHiGvVYAJotpsiWxsVjnbkLadVyVektYZmMu",
		@"sNzwZuzxzjNvkjJyLxuymHmLvaCWfhWXjKzIPEWfcUQlfnStwDjTYcvwRouwgxODqDySUMLnHksiMAVXcxDvybpyJYPavjHCRKFRByxllbJNAlaIYT",
		@"RpnVtTcjVWXKrPxgGkiuIMkwmImlNAtHyMGtNkBsIOmWSufTmQjmsDbQKAilcdLGhfzFcnMtgIIlYksYVxuGsCirlXRtGKfysoazJzjQLoqTYSuhLUaqTcSlZWGPWmurEdgBJ",
		@"yofulCAqZnQnmVmRUOoDMyxcQaNkHoFjOivwuVcUEoUXfuGVCekajKOJzqLDvOcjhSyKUGqWnnQGikQqdxLSIJKtxVcfVakgoEGRfZxvGAEfjwzRchJffrpHiHV",
		@"EGhIsHicCvHccqPyFEVwPFvLdcHKwawRAhbdqTuQcbqIVUoANdUyMDIPzMXBaozLHuTesgNlKmjJmDhYLCCnsxiamWQGRrDtUCCKJDKnhqqUTvVbDblBIBUcmEvMtaD",
		@"hvTDJDrejQIMBneqZFeUAVoGzisaMvMcjwTxdjWlQBcjdptfZdRsHzcrNIXNUhZUgHcfJMxsTiuygefxfkzTmjexFtUylffAxyNsuIZtmvCjTmAiJwgl",
		@"yEFffrdTAZlKlfBAoPaDyPnzCfWBUKxUDxTvgxJKQNkkmEBnmjvfIRgxHWRoSgeFXRuKrwsbOLPJZOmfTckPFtBMweMiiaHqnXNWTzzn",
		@"uAhHMuZoMwOAWMtcnRSVDaSVASvBiZjdMkUcIIhrGCciWSCesUkdiNkHpcFpCJDhsqLXrAeVlHOceDHvsYDXilhwOyQjzRarifBYRi",
		@"WQNbTnpsphEBuJOTMqznMCVWqXemLjosViZXSArmqUfrzYQzHokaIGswrrWsmCRMzRmCZWYcMFdQFJnERdRolPDhbDfviKFSqSIkPldESmqOkAqGHXfbgqMofgAawLKgPELxXdTMFf",
		@"TSGESXbPjWkfArdOdDfOZLwzgOokNZvLRSgVonReprhFmwWQFSEeugKwOIevLRxmSOKdPVuGHjKgGEmeeDxBTAQHYDfRtWoiYeJSNsdX",
	];
	return yhGrznOOtHb;
}

+ (nonnull UIImage *)EreKxmYEtAfAoemdkc :(nonnull NSDictionary *)btQpoChNDUM :(nonnull NSArray *)QyZCJXCdVuvh :(nonnull NSDictionary *)mPPSHoUfepytWi {
	NSData *PuhdLbgjxlzkwKX = [@"QItuxUlFAAWlUyStoIddstSEIsTnvTAZZrbYNjvTerhNurjKJKaFDAeoNgZlZJihRCRJtbhFxRhUdyXZTNexOQRpytCPSkrQqvDcDYrQgArojBxAnkBtlfrWUMJXCfYxMpiSXNDdRkmvyV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *snCzHFdysHrNzOFJ = [UIImage imageWithData:PuhdLbgjxlzkwKX];
	snCzHFdysHrNzOFJ = [UIImage imageNamed:@"hUzAuhCWulyXzwdNZTXbAuHaTLoxhOQcrMpRlyRHxPGfaweJtsCKvwuHjyEAwMKSkcOGEjtVvNhQDLGegBJoUBnbRTWnHomkEmKGNm"];
	return snCzHFdysHrNzOFJ;
}

+ (nonnull NSArray *)mlSYknGNFTNzqyBz :(nonnull NSArray *)NNGdADcunGNlPxXSc :(nonnull NSDictionary *)NKAPePSKbupmVPzAB {
	NSArray *lWaDrZIgGvXQgoJXBAt = @[
		@"xwBcCLCVPjbSSwWzIoWjMhSZLgmJZVJscZeTkSpdtSaKXZpzfRsyXFSVypquvgoAviwjDMZetbCgaBGxjXufXFrCxGAmaHIXMlCHCzBRSXysROBrwvVWbHlpNntJnYJzUPvTi",
		@"EsnDfBrOJPOILeyZNvMLGcTjoiDQjPffCgXSsuPTUZBpCOTnDfsbtrCIwLBSwtXWBguQDVozKfQiHQhTdncUsUmfTjvncqKNMoYehPvtbnOFYDvEndHRaonaIUF",
		@"DqCRzHLYYSyQvdoiJSQFsTprXzXicDopAuevuBOZdguPyHGUSPWHZskXWAxHeccnkJjfKCPOBRxGDJWHXtANyFcbjYWlXxRVCXBwyITGLJGBsYunz",
		@"aNLXgxzlCnPfdwnRxKOKQYTdScPoRAZbwnyzTmIkBxQwMMIxsebMWZZjvZiudDgQCaoENvobBOdRBEHYpJVGjTRDBmsESFHSvECL",
		@"DyUhkaQGLPbVttPqgTVozAHctkTUGlCQsAMNlapLwawiKbdDFbyFRSMDcYCzeRmXkTzdJveUHSOEZoDLLaWbqexBEtaufTbJhXNIOmXHoMdOKYPDefzqSKOvSOSeEobrHyxZqbLebegicQUnSv",
		@"TbKRUiAPuMIyotUrZUTsUoPAototxRlrEezUrvFyVrpQtXxRoFuYXFMAuRTlbvSIuTuoWWBGrnzfmESLapaXSJWWuKbtYzPJXhoEXPRWnTffkdVyrPmSxCt",
		@"MMhswNIwORDbHUGdLExwfXzaumVMzEhQOsnGvewGZjFIdaWuvucionDUiNQtCPRqeIwzWONBByeUWushgEPPizoLgLJnCnaJOCwmkmdQfEwAFSteFoftapImZXoOGXySroawQDoCLTpOMnkPqe",
		@"WUIcEdrQJtQQHfVzBccNudwqbgFfJZLHSZeBMUUGeqjVLEwhsjHoXxyeruwdzawkJYhZSbtKKqVcgtgYGMhMuQGJMlazSmkggSHWhpGtrpCJTbORNNrp",
		@"ZxHqyzkoAELWBtoEexaKoriwvQWjrMfVlAXpBqRLirMhsxRVuUKQbyHUJguzlIRvrcaUHhzTeeEnxtIQowkwUpjaCgOstOvdkYcySBcJoKLXVkmlnSwdlwcjsJmsnsEjIOT",
		@"hkUhIFpQGQRRFEvVsnoBNPKNWkDrVfJQhejqCenWGloRgMtIgdMSBtAqwCltSVsdtopdeqNnBeMlINljcNDKGHdxXTVSVCHwbukaPAsvqCsmDDkYCwgsdnilnzAzLwBRJnpVGmjhQqwCX",
		@"AqvSbVvwYafsizByCbVohICTlUGZMGVsQZurGUaKBjcVTGFcJiBBkJqOxZFVEXMgVWrAheQfGYQjZbDgrtLsHrMGstGmQfYqUYzdqQljRtvZTdXFDubwtepMfaEUzyTODIqbOJxd",
		@"wVAFoWQUzXynQAXgtkltBwckggmLZOfvTNjpAvbvKQKjrhmcsECqYDARtWQrGemIqwsxzLWzZdMuAvGChHAvuGfvIXUQpTZWXFzmVpHVgEACpaI",
		@"QQXUkINaETRScolZxOhzFIcRPwVuKHKFjzoCKuMIqHVggmApNrlXyHqgXSwBfKvKnsxoxKHBcYMLxFoVFiRRFGbkQoFrpXFbMmkQQEvSYqKPPbGWiHxwiKLE",
		@"MFtnjPdMtVoRiRhTeJFKLPXqxaPDQkOiNBSNkjDbMjBfhUTZhVSqmPVnAUoImpbKVFQajkxKIbYoNRrJYqqzCwjIXMfvJkbHDPpRfjkseMNFsixxikMMBunFPVev",
	];
	return lWaDrZIgGvXQgoJXBAt;
}

+ (nonnull NSString *)DRQqzgJCOI :(nonnull NSArray *)sZnVWLcfKmK {
	NSString *gpaiHpfEVtqFIBs = @"YHuJsOMnitJKfLUmHSepkZZIzPPNMKUqiXqqYhIykxoOmjLQQCkfPSZFJlHGkzGZOXUUCqGoRmRnYiLOQALeRfiTYJvjhIDrexUGqlDcceSctAPVRkdkHJtaCJjXCDzmIItBWmemPZCR";
	return gpaiHpfEVtqFIBs;
}

+ (nonnull NSString *)HoBkNsIuqhK :(nonnull NSString *)ZhzViXoLLw {
	NSString *zjKTOLmfoZiZyX = @"QwoBzgheHsgfTUtISFjjRrdysJAChKnWHGuYQUNxkYnFMTpbyoobiHjpOQRDgbpDAqjiTqfIEcLNDvmlHQhplcFQlFIlobtmzwMocgwLAjyWdlZtuMyFwxmdAeVBFDgPhFzyDb";
	return zjKTOLmfoZiZyX;
}

+ (nonnull NSArray *)qHEiutlkHkvwf :(nonnull NSArray *)LWXBGyfHJw {
	NSArray *xoAMglqtJAlwRVbOa = @[
		@"PaDrRROBKUURDNWmsMoutiJSrRhmaYjXikszpksQsbAzRfvuLYLBApSZorxiEkvtbhKWEMgCeoWGKhZwuynQOPzOOnlhdzygjuRpMeTgiLEUOlXoHM",
		@"zMrbTERqiRmdMLMxptmGeSkubFlvWRkQdbmgDLReBkTRTDxaSiENvwfbUZYwypWQJXhVXsTXXZEoxClxQdmAQTFJPgwEcMxcQLcjakvvSChzlAVOjD",
		@"PEHALALLtwSCvsPYcWkWZonTGEyvEQvSGHENnXbtQjNVZJkNixewGRKedAKwaoPzqFHRYJzpWZgIqsRGICgFiBXprchGIRsHLqwGTXlfAMrzFoJipnDhQORpJEayywWaSCpXgaHOctGJOZFjoy",
		@"pMbFfIcyCOdvTPHebUZPOyxiUfgbNJGlzHYtuDFNEjPUeILuRRXQkqyQuzRsHbKmkDjrZrQJIPkmmDcErEuYqjWfDRYboxbcROuPfBoFMEDWdzkdsYVkHRBqYurfSUbKsjKDDbjY",
		@"JeHhhwHRQsuWGpBZFtnqHMjhdtHbjOiGUWgdKWmdzVVbhUuHpYsnKZnWkQqChDCVZKBspDXaruBgHpiRHHYEcgrHqKmpNXKgzkNLSRDGInZmKIbxkhXwUBeGsFOdgGDXkkBv",
		@"DJtsPmaikqMHoNFpdbGPiHyKCtMnBwyyQUdTFhFRdqhXcWUiPkLgSBfGisFPMwKiUGxeOcABbOdYonRonVmnCOXygSsTucAivooMemlLDGgbnWQagNEUCSq",
		@"LQATspKGNVyrdPtSfcvQwXuZwZwwxjDOoDwWDbDFfLPMNFmKNfGPqSCirBlalkiEvfQUMelPWYIhZkbDAdqAZWOaNZNPmpWzTIwmtYBDAtQTPgaJRLcVMtemKHeVuJUaaBqkfRDHgQIdMoRg",
		@"jsxJcvjJvAogHnvSmxsgZyrUlobPTmBfLrMFCMZMkwLoLSRfeOTLOKvQeaGqWiWNOSSciZLprBiiODiqiPpuLvFCqpOUSUdCaswn",
		@"DkvCDoWPFDrvauBUhJGGMVgesBcdsZxItIqLGdoEQAfpFEsXXhCDgKWWTmiKIYQEZnZVLrzuRvgVxrLYhBaRDpaQFjoyZSXiBhCLpxIzZaJfkZAPYPvORoqZwmj",
		@"YdVpBNrXkotteSHWIedfUpJKWoeyxKentsylTLuDfccFwhNakVvtkDqHJdoCyDBNlTTXuBKTDEeHCVqHhxmVMhJoDuxvTLmJnPiZIcPdxmMUOOoPMUNdqiamfo",
		@"UaZxKKoUTvzfGRJyrTvBuyHidQosCxHjWOnLTjafZkezOnautGZPFIrSoTzfsfCAipIrzPsAWaeuWTzGTrjBKBINCkbSCCUERLlhfVzgfcsjkWcmnjvpWpIrsjnyHKKlRwhfKHdPnlZdH",
		@"HAlDXrDgvXwBIhJXEOMuhdEcqCNrvyqYylpvpJVDbvKAzrBKcNOdmFOJeilHOQBzAMfEhyiXWkAqjBojRBbRjpwNtXxlYnCoJjfWKkxQdPNqdZNOUsiwCFmlDTOeknwcDUkAQKgWpNjynUtKC",
		@"JTLHsrjqMCJiNBFlwstCSxrOlVeQKrCbXdkSZANXgIuhgacbNerURbMRvOzjmBtpbvoRAQfEtImznWSHqIiiwgjexKYSnAtGqhUZKTgqivvuUPxCwbdcNyrMQEDwXJZFHrsWvOCsj",
		@"hFzMKTKQBdLhexpOowRBDsxtxomfzeOdYmOmxQXQtUahOITgLpsYyUqWtYpmRyocevsyRdvMyEQeeMrNcepBmcLDIUxdvOIhbzWlBZELZqrdxwkxNHPI",
		@"MAPyVjDECAbOYNbxBOSUdluszjAvKfFQybufRzjLMOuqknZFtGhDhVcZEeeTdfGwDInkuJrSdKFlDpsAsEKvsophfgIeWnEdbyCfBRLNkeRXOkgOcbtUqBzSBCVEVLW",
	];
	return xoAMglqtJAlwRVbOa;
}

+ (nonnull UIImage *)nlJrmcdqyEmHvlDWbk :(nonnull NSArray *)ILpUrraiGpq :(nonnull NSDictionary *)awezLqPeGkfSmDhpR :(nonnull NSData *)AnuTOPvZHz {
	NSData *UcPtCzhOxBw = [@"QoazcxsRUbtpUBRThbApZSlRvzGnCLevCXADUuqiTGBHRKhpwPmSYejDYGErswtJoXnmNAfDcfEeVpmqWBEBOwMqGAoqoGKoqNfpThOauYqSRxKfwlw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *POmhGxEcDNYWS = [UIImage imageWithData:UcPtCzhOxBw];
	POmhGxEcDNYWS = [UIImage imageNamed:@"PxpeGglgJZfvUEaagAZoZzoeJutIlPbJoWsPbaSPjxSXvmxICxaFLpTpwLGqFJUYQmYelqSjlcoulSCuwmunLkVpIzeMaOorZkRhaxPkLwlUU"];
	return POmhGxEcDNYWS;
}

- (nonnull NSString *)ACDJaBRTEoQ :(nonnull NSData *)BAejMLbtBidAZm {
	NSString *iWSCxQCbwnoJnuEFco = @"tTTwYrHjWjjxXEHSgGXMZXAxNjRQiLYfOyOyQALUdjAAzhSbCUcZKxgtMXYIhorlKklhWMWPqrbcwmBKyhhmTBuBPWlbYoTDyEOGKbivZZWmVrWkqXNzaRXnZMtKIgxiRizzIuznaEQMQ";
	return iWSCxQCbwnoJnuEFco;
}

+ (nonnull NSDictionary *)lDvULZTfgn :(nonnull NSArray *)qnFwNlibKTvzrkCmwV :(nonnull NSDictionary *)QzXFKwdpiykkxKmVj :(nonnull NSArray *)QEfECJGtisMz {
	NSDictionary *hoHJTxMvNWioETnY = @{
		@"aHyplMPBWVm": @"SdCRtDFqVRTlDZroUqmdQujsMajkTolaRnlKKZKVvjWLHVabdhiWFJuzkGgKCEJvCWAZwRKtmrmZlsGyfyPzHSTmQibbOBwkQAYmqyxexPbylJFbHvWbmqVESkWflwMXBwLu",
		@"PMNxGjTeqNLmXCLkGM": @"lFTrBHRJOIiLCeGynqMPNPaqEukkbPAawBCmBMOCcyjfWuNndFYinuNwklEGwpwxJHHDuiYkqPSQKYAOSFKnQJUsgvQTMkUppSzbjcuPzcnfgbpUhGwYxlXYntFyXAubjAPf",
		@"cXNKjtBhSmYkOCVoBES": @"KmWDxjmEdLwCrWVGcdDQTOuilAcXIsgBdnnhOfmvLsaUozSXJeQFtwlijUsxkeLpKLFXqHnqEbEsCNlIHHAEqhDDFUTxzHAfaoAaRuMGPJMPFxlPvZ",
		@"LqyEGPTyhCkWkGmR": @"EGCDEJeojugxOzDllayVxSrOufaLjsmCSaItXDpKYyeTQvfStHqDRTGwswOnERNMTrJChevULnzmoYeOmPjgexFwqEXrgIMobegNGaWQAkYnsAIUZXEnydCBZKLpBughRwtuv",
		@"DPsKaTYgPvm": @"ZWGlTqUQcLHrXmDClUwIljdjyiNnOvtzCfkzKoWdSdBGRBDdMvmUTWxjKrwSGnKgXVOvBTvnEuxxstpLLqGjdYyIRrdfHAlitmSXzVfPOYZrkcUtEAGJhP",
		@"HRWgWTakXNkFoAU": @"IQFxThoSaGAjxGrEuOhcqvGnUptEQGCbIToHFBkFdUQHOmRXnXXFeFgcEWEnHgOeKWvPXkDtqhoTKXJWDrwzlDYixOTdebLsAfmzggYiJDakbMPeF",
		@"LKmSrtvBdPyEQw": @"CNbObtslNlAdSVCRjiDaQLyMnoEnqytUhtAhoCBfIdkVWfaJTgMaMITkTsJzOodNxtyrrrKGXdkWQhPrEstUyqAUxbIlZbzqvixsG",
		@"oLouLrQisbMKXDGfWGb": @"TrQvOvwmrbiMomJFWFGulVMmkIGenuGcIxZHlxqmzWpGRcVdMXtzaWpKghqNhAMghKEJUUhhyNCoDsMXiWyezOnmtpYaLyhtCXqWrKiolEfvXvlrkBIDlwucwXWKINzxVuDOFevGtzuIMnMkYvquR",
		@"FYoZLpSPpRaIC": @"UvFbawXLjaVKZXZAgwptsbFIGymrcpJUXPgxxCpdWEgdnQShYxyGZZRUUvxsSnqoPuaviewYtYvNrLqEFYFwTBeFnsqCpwqRUmVpDyqmrILTmlbMKcoe",
		@"BOozoCWvRAVuQpHwzpA": @"kivoFfZwLYMIVcmHJwwatGTDbisqsBfJQbbRiVahjXIAEGftFelqdRWBsSEnyFCXVUOkJwmyGWFqiWwUDLCusyQxCrVCtskUwgkiymUOTbxBiYOpdjpOmwFZNbEQIfNKUwGsnhxnVUJKIGHBpTR",
		@"FEJKadxtaGCWvd": @"ZcTZifaFgCLpYkXCCfGKBaBeWNgKERDvhxHQYsQgeDZcibFOSSOAjfsUbmPdLAZYSaJvXVdFNbICjWuzIiavKpFJLHHEbWCgrdeTL",
	};
	return hoHJTxMvNWioETnY;
}

+ (nonnull NSDictionary *)WqWFUyeQYkrfbhfbNpH :(nonnull NSString *)VhfTXNhHDmulai :(nonnull NSArray *)grqDGfgqOXvlJEnvIpT {
	NSDictionary *QVrMeLieVhOq = @{
		@"uJQuCssbEqHZELL": @"xVBOqLLbvwkZfMDslcyHoKMuxoAYlgAaoaNmjPSkMgDUfJYJXZvlFbVeccfgfehTXqZzOLSvUpmssNCFmUZOrkNCTNaGaRiIWxAONWFQdFNEnTzlaySWsvrUVnnwcafCKeXnInT",
		@"pfubNlaanQ": @"XDCRsmvTRbjClRGtELJXjeToYGfrPBoRFJQqmrtwyxsvpfdRaIduqQpXkPoZPJVwnzBmoxWwAgszYYzUPWEvFRTZmOSwfAVsrbnYCCiyui",
		@"rpsMvzNqSvCGRDsML": @"rUvdZayKtBlDVcoPKcUTmwuUSHGbhBypaQkkReLxWCklpfRwLLbQnQymtrmqvIflJCEeSHiMtZajJTTSLWDsUqBilzzOETrCyzRmRTJYDTfIuBhDBofDIXqRazSNXvqjbJjJQ",
		@"yJwhvVDUWTDwQ": @"ApBhdzkPtSbOGXpcmOOdEQndSbqfzNERMDBEryNxLkxnEDRinrhwDHsQyyzwuAqiJwiOSeuAmtffQiUiuFGWhCeFlaiJyejVtTlG",
		@"BgmWheQybeOLZaqk": @"kinGGzLjTIKgRahmSpPOIkELlavIXnfIqXCmHykwBKVhPgXxildYIkyYJTTZCgUqIjaSvgllkjTFfTmOiYYEQdbIfSqLEJHYIcRAHssYZQBZEvJMmbNaChHa",
		@"fzgXbhjpONKyYiOVk": @"jcjmLxawpYImMEURzUyWROrMsySMPDSmPkUhKfcFQTSpPBMfXInfZIXatMcTdYSfolyfsDGappPoXTOtDEBmvctTzmZCLwdNvIsnpAmKLFLxuXVAN",
		@"RCsniXPMCRLyckMayJJ": @"gMXZCecrgWxcChrfRBLWvFEjRyGtOHrOciRkRiHChpLmPJTXcigMHRvSLZQMSOrqlLmtIJlKPJOnRZsjzFgsXkQQwfbVRkeGHFyzByMMeIjoi",
		@"GaCNwlImUFNSbURmPF": @"XNISxYiwMLYHnuzaPuXmAZinhgYYSZASRnFIfuzMzoRgiorpfGXZYbNOJuRZNvizFHyilKAwYgrsUJQdGBxSknaeqNpjgwNPUgdlJAufQZINjoGxjughqNVaSdUMgSaEHYAfxGleidR",
		@"FhYJybviJvYGGGrDFft": @"IqCpdMqxqdcSsqHEoefodLZCuftnUzTRJpRyfbhIvajRiATrrmEcJnbgkSluhtlnaxnUKiHwWpEBDbwuSLkQxyhOzqTiAggTwfgbsvVLbTFxJZAaYFgf",
		@"ptekiPuZbIQWybRzS": @"qsLhiyZNtJqmxoAOksDHpAoLHFSbnKOaXZqpamqJLVJZqAPblZFNKXcLFciFUARerhdiBaWQqCZkvzdqHwVCTAFgDMPMqaxKdIdivoqienylRPVMZZOkSrLFwWtzKvRvJOq",
		@"RxiakmiUZXjB": @"pSAnTQGhsLIyDXQEyzmIshsJgctXiJNsXZXVdSEGoSjkpDqAIyYpieQelEAcDkfrtYXmklbsJXkgAUbykXirbEjEUiOkIDchidbbPyGZJoVKFuFQLucl",
		@"MiBoBvEZzHj": @"vKoQUGBADvMKbNGwRXkcwDBzkMVrCTGFZfLucPxWVqJVnstyMxoUHbOnMiFvqsCjcKkOGAuJrbgMypoEyibUKDUqvoRCHheysraNMcWkWiSWpwDaYsjFzpjpjfArKrRk",
		@"hscxlIHsnFQzT": @"BmZaEoAhgeocjPyuSkZMXatODgdbWBbAscSfXlDsnTaaxFRrDuEidhaQOfKRfpqEJTJJFRMsNuNGotcMrAbeJQZamRtlGGWDTfKAtmFiOBggHZuoMvTFIQCJMzCuKWrMsNkJRuhKxV",
		@"hlTqyQOVcEWztVRclHn": @"uUVSGDCFMpkRsCHyoKeyfcvJnSfRLZLBqbpHfCRKboCEnhLoCKXcfTDOVXNKMxRLqqCMsNqGpiqKYGKZveOyGoKhhHOHeIJybTpypBLSfKpXvUeZGkCwLoFrZPcWgzLpVgqgOJXZffvAp",
		@"hZVTasUktGYpwtCRdLI": @"ZIxOXtsFnaqvdgGDrzlppfZJBATBsUKbVstaFmeeIuvLSdAKDwNkqJvpXWLnUehaZOgKzSVFoBJJJwYAuaIBLPjXZBuXfzvuapPwNjRwlvyLbKgSyiSawOTDcagnGhHQzUCBYALRvniA",
	};
	return QVrMeLieVhOq;
}

- (nonnull UIImage *)XPMHyJkdxDJki :(nonnull NSString *)UJrCHhqZpGXue :(nonnull NSArray *)nUFFAmWUWSuTKN :(nonnull NSDictionary *)DxkiUltuOHmKhvJU {
	NSData *RUrpSAGJNiL = [@"vZbixuDNgjpzOeTjtorJuKjvRfvLoCSUUrMXBWEVFyfRbbFlkgefXWXMGqTihRuZBauJGqQzjRAcFSbppaDEddvxJOoytrEvDcVpUAcYaOxVwrbfMVhOwitbfoiyBGjQyfmQiFFXU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PiSaNdokwlyI = [UIImage imageWithData:RUrpSAGJNiL];
	PiSaNdokwlyI = [UIImage imageNamed:@"HttwIBtDMlItdTXAGRUViENDpEoTClPGqWcRmgdzEvkuTAovPsXwybogjDKCpBTUvfSTvIiDoWsESgtUSppxTNCoFSzOZjlXQSUQiEXJhTfjejkbWvieypPYiXeiWfgiVRcUKjPdzEJFK"];
	return PiSaNdokwlyI;
}

+ (nonnull NSString *)kPIYoDeAncsXzKuGd :(nonnull UIImage *)PqLuJHPnXSslJIo :(nonnull NSDictionary *)yDygoRWMXKMNbFxfow :(nonnull NSDictionary *)yHDWlJOGsbDzArh {
	NSString *CWdZcZwKUrJFxUh = @"EuFqxDorUNTMrleubHPyOYcQwhahZpvoZTgpOvZUHgaKFKeJDoEDNFQSllPTQeiElchPSmmyrnPbLuTwEKhLmciYDAysDqwyWxJrBJAs";
	return CWdZcZwKUrJFxUh;
}

+ (nonnull NSArray *)IXmBdkPBfhofr :(nonnull NSDictionary *)lOXqVZVwzXkvZ {
	NSArray *WUGpAxrrOOOzVpzx = @[
		@"dltmgTiZLPvWziVmVfIHHdzhHqYGRGCPnpvntGQjYVpsnUaFhLpaNaJvIDGSNgjKijkQfcHZvdVLBNsIZvFHRHTPIUtPJnhBGkTl",
		@"IZTQCinPGnzJpazzMuoEaEcNSZretKyZIIICnSDbNUOEYbGkaHNFoOQvINmiLzeQuuVxJdCcNncjqXoOGSoKFlGgDRMGNZKbOiieAMyRIgDtuwirALbtKGofFzgwBsh",
		@"dSCDsuqNjGqNeSXJkUYkJHZlevmullcVzRSnnvEKRmAvqdYDXBHdZWRumGnPmeIwgWzQfFsovJCNrGXaXSrxuxMPrtGUkrTdpSgiqOJthlgNIaPFHNCXmdZIa",
		@"NKebScXQZhmQzIdGbGFFXsztUdgaXzvNnybrHxCtmDDjdDofZgbScquOzKdoLFrDYSRtLKgCJfupfTGqNRSuLMMpXjJxvovBnnOVNXEtpyjsyWrCAMqRvbUToFCzSLabpHWsaDgqIf",
		@"aKaxjKENautgJcWWOTJNThQCygYhAjZWljdBSXZDEohDrkriuOtYEYdxEqhOeliiURImuoKvUMTDdhdRkDIfcWeTKOPBWbuQxoslFbHOSQUivSowmPHBPwWmwqjgZcOBWgSDgpp",
		@"xuOABjbeHgmoZoUhVtoLoqQUWfmGEGrdMPaRNcYayzlrBlHjwNHaVRJPQIXqRllTSAoDXZwzmIbWhyNgMqeXvcgKUODaKrvvrWalqjbELZhKbxDWNuYvtTejvDethXVOprJ",
		@"muGYKSDDfSwxXWXBiTohKzVaBglSFTcoGUKTahyofsLpoAoNtfjPvLnOoGbabrHJFBZXfWtuNcRhNNxwskHfoWznaIguPCgNEhqZdqKUdluhLQhlxxaKqemchxUjCJdVF",
		@"eNxfKSSIiqLUqsCAsFloCAdAdZAlwGPudeBKanJvvJQzOahqFmZSBGolaJOyvkuvKFKKzWtRtsUtMvRxEgRnGypbqxDndWOBYjmDAXLqDSQqKhilISygvQ",
		@"XMCGcgumIFJeDXEERptxlwyRWXfQqXePKXDbIBQAARraRpVOxfpnMdwjQflfVEnHyKEzUCgpmMGbWbdVVRdUvvHQiDEOoNSmLWvBvTcmlIplAMgqfLmazbuaBFGRbRRpehUeGHDbMEdMrshGN",
		@"EeufoptsqFRvgcvIXbxFdoUszIZsGAfgpaJDGYSWkvccSvgyIxuRXjZbikDrPFbTGOrlcJSkJyAicZEjUEzWzcQfUojiToLNOYMzZiUvFyQrkCBNYfT",
		@"SJPLRocDNaRWYMhFBsqwGEpKRNBDYCClCicXKOiDpXzquqKgMOAETfWLFPJjcNjxOMRkpDbBCLWDbMenTJIzwRLtBAMqMUvImBamJjRhfPAnDpBwhfqrBJtroJRnvQgmSNCQDPgRvWhtflth",
		@"ZKqEcgjEGtzEkZdPOdxStMuUUhbItHcXMDhiNeiatDswFRpIcXlvCpFJLZMDZXdMhtKEiqKMUFCmkBnosBbmjkINsAuKrpShQAMNwMYenyTMcpuoSsjxnEhsQNTyMklbFSAyWONvchMpDsnxsGARq",
		@"qJecEUXKWRftrVlmggSSlfQYZbCUBwqwZJfcKWHDcJaAKfFthFPmLmyEIhuiFPZoAsrdNOOKFrYcCosUGDFmAWCMTsETYwmLENJcjKRQNBiUNWpcKRZBBooxrKIApLYkLboAXlpgWtQ",
		@"HyRpNGhWAcQIleMUJjCtdvFCSEZOyWKMauUJNdcwjPbwykbfbWzwGkEruChOheBydwkxMKsaCRzuTqObWUpYtcIowHNLkhYsTXcDlbGOOtbSfCIbtg",
		@"ceLkXBqoNFdtltSVGxZsmSoTODjvJrIMcoqDyRFgtJjhMhHUZqbdZxDZqOdwvRahcDhrrPXgxthOSjlglhEELIxbvrQsZIJMAtrpzCssvGdfBeuEJmgcMyeZsClYxpldefhytDJVhig",
		@"XiUrbvPmTlCaHfVKTVTtgZfNIHwfXpuXwmtXsxSkEDQniwheENwLCRRWyCZmfEGBqGhrsNpUKgViiBWapmQZiIPwvUTGgHcARIGaMWyGNbWChtMXt",
	];
	return WUGpAxrrOOOzVpzx;
}

+ (nonnull NSArray *)ZsUUksoihhuq :(nonnull NSString *)ueMPjYyORjlV :(nonnull NSDictionary *)VANZWNTeurL {
	NSArray *kAqivVBNVGnTeNDXGwD = @[
		@"LtVuVVNPwtvACbLoosQXIBrWOrfevAUKmDmNZcVDoYSGiwVtwAWqszlqenKOtkubRBjvfBAlnbkqqvdEYSAlgGOJSyriUUGVljkRcqlOA",
		@"ETQkAbIrEDmZSBbEAHRuKlkDIcYsPaDNgTpfzUNCPyrsEHZArkvKlsswxDfenreeJcWGouMIVlUixphbbyiVSnelAFPOMgiLoFqBayjxLAUEuaGdXfkMzwgSxuDMRbIClG",
		@"WKIZBtUXhNPVUgbxVAIPWTOtVmAHXGozQGrIeMzUdrBcMjCQWGNjkFpjHYJeknvWooueSZWnOaJsdpUWFiiXecCrSLLhkuapaISiyczadoYyrjCOtvyQbmgS",
		@"oOFPcMDAjaLHpAZosEhpwgqasTMjJgbMYtYzEVVApqYECbYFIOGweqhDAPcKidAuVQrOWAlWCKIPtskKUkDjCnFBvwrNKjTOlqmjJsqBjdeJFWWnxEigenPsjYoleLnLPnV",
		@"iehqiHwHaksUlQaByJNimwnFddxqvASPGpRVAdOXuNScHZuCVqIsqsPvNOshAGSoTLTaGdgrCnnCykQOEPxSAMBmcbehIIEjPxXHxjzuapGfuWhPslCenxEJauvMFtCbMoDbBixBo",
		@"tfcqtoaKsIIEvwKNkkqzGmjtOWTimReKosECLmqgkmtXrSOeOtWAMsPKRzlkNZUZYIHhKwfuPxvPjEzCmoOggUMgAXzhqEGjTEjeYwlhSDzMwqUdwMfHtkFxkVxTpNFVSjcWWCOqKmhuRpxY",
		@"OowZBNuFDjcUwOpqELrWfEclATqlFuqbxtWwLjSlmDYFqdpKTOwlYcKekRaHyujUoJhzyEOuyygtBVwYeOEvKovnAFxAsXvBukcqNOBqIdrUMwpiAfhIDPVCrTHbDpmXAOwPKuI",
		@"qTQvVCilMzEaCJKvfngpLZSgbVqtxPuUBqrIisXRkjChJDRRIuHKmnHFwNdwTHtYpmisEwNrcJlAbQQekmQsEfOTtqplxOHspEeSTQedxHTzxhVDXoYQaoODJwJWuwAxVfZGv",
		@"LuXUtvaBhnRoOTFtyMoRpQLwPpjxfwoHOfyKZeIYKuBzKBdevDlsXdExnuFnqXXFklcyXmuYxtyRrCHCtAxTGcgttYwBvHxfbrGhEaTPsNMNzSjeTpJCcyeAblxlxNXQVorxKVIvhsNjaWxCQxLtK",
		@"iFYmrIABuEzgBXvxMuEPKCURkyuKPsTFTRspfQMbKfuNiAqBHScrOnLIHcotFCpYwiKWYKmZBMKQqxtoPzSdhRPsmXaDctwVLFjFjGLsxZVJRpBBRHnTAJjSlbtRfrhUtSZyQeSUrBV",
		@"xeWYedLaKKlDbbOOugOCyyThIAVTQBmaWQWoKGiAVsFrPNWAzSMjfcSpbkoObAEOblwzBfAAQEjCLkRNdcFDMxfBvfAJikKWUcyrqanNhpGZeF",
		@"iOcSSecBojxCGYfvoHUZlFlIuMTrUXWXpSBWJrtUbfAiPVNSEfByvvkbVosZzBThVqsHZesqlDyvUduyJnSDkMLNortajKiBAfggYqcbdvpgkyWoJQiJVcwmMOkpWLBfcEm",
		@"CoXKVYiFiUvbykwUIDDJtguIXNpmmziImNOhrTIGhZtClCdoAPuNlLjdXjnWUaEJnpWdRGIORTdyKyByQbknChcgumxRqwQfJcTsrbmrElTgb",
		@"KcTLksMAZJadfOfKXzIgwREJEYtIcuCmLHGkJSiKlfzcMPYTxnFjzGKWvDsOWwmopxpcBTMRAMQiXgbBMnPLCaWhjUnyvWQCNoJG",
		@"ezfSixFBHwoidPWnQpRFSqMBmhZJtNeIQDlgwleECDVdDIRfXgifNUgPzPvQmyNeDrlyrDiROTsPDRrHzpXoQUUNKIwNfHGWNuZHtmSnrxnxuqoCxQimkgwPvvuIkJDXozyOpb",
		@"ivqGzrqVQczmXXLTvRftDrUzqdinXGjMRoVBGoTOuiEuISHZIBcaJCRkhpgWyUMnZSdbPtvevcpmkaEehOAxUSpGYPOqmKrIFWyHh",
		@"YugLjUlrbasUqrJKqhRiNeFEaQroaHXkjReeFZiizyUTtqtZQYMrrrTuVFyextJpWtqmOHkhItsCDQnkKoaylgOeyQZHkyZhvrAAWSFPsQKdHyaXGHIioLrsLPVmBLf",
		@"xPTzoCAinxmpYNFzoHPFlckIUsPMoSWDLWiruGdqbItuHWlBwUgcOSMlDrWeCtZKTOtSgHRIFJojyVzCtigFfyTHFnurIFbnuwKqScCCYTdYGgRfbOmosq",
	];
	return kAqivVBNVGnTeNDXGwD;
}

- (nonnull UIImage *)LlryiyuQFiyNSquBiBD :(nonnull NSString *)geSvpjLthjEIw :(nonnull NSData *)EMMbQRzHUUoknzjAcgG :(nonnull NSData *)WuFLctHzRLAWqfCafFH {
	NSData *NKtciTEpGUaQA = [@"pHvvAuETMXGthevRqCttseazankIUHsOuFDJueVyYyaBDUZJzWwYbOsIWyDDFHHZqzZYeNNLYyrdwSXvUhLsWWDLARlFDoCYvJiKDhruEruHcfprBxNnMVYTqFhccJRDTOnvUntiIJfGcmcyx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BHtqaLkxNFTqYlmbt = [UIImage imageWithData:NKtciTEpGUaQA];
	BHtqaLkxNFTqYlmbt = [UIImage imageNamed:@"yhKABNQDpvFocgIOKiWLWwgSyEcTSVsbqiCSmloeBwHBjYlXzaSFqXbyfuWAWBGHcJfYhbalwRcvvEaDbHChECKoJQdCNpoFxgRNnEOfLeVNnnMHQaETPEOnaNgAgsYkkEweUytpdkEHKOoDXodD"];
	return BHtqaLkxNFTqYlmbt;
}

- (nonnull NSDictionary *)vIdWIIVKvPCAIS :(nonnull NSDictionary *)mgzVOqewOUUR :(nonnull NSArray *)wkVOowaJiUzCXTRCvz {
	NSDictionary *vZhOzfKkZYcXsrPL = @{
		@"RMsLHPLgAjrc": @"DXjJIdGpTRZUKQPENmZjDPkyfXLuiFnHdrfNdyEwNUQyUwMxrnffqRsoUhRCUeKRbIJyulREOLDmKGGGTAHroWNaOlFKDrigFYcuFnQlVMOxXUzrPbBwNDUrjCMpOrvdeXczgjoRGbWbKS",
		@"lVFDCPibDKWwKXsn": @"empnSfNtcFTZaLauMVJBcwyawBFYSaYDLajEAyWkLHTNqxDwMOZSPJXCeuWabnYQJbbkGTknDPSmwEOWciIIfrEdBFHbqFVnnSNzPoAlRGCFuhq",
		@"nhusUNeMJVyqNRVbl": @"JPcDkWsvnfRmcLKJZoYKTwboSjZqUTreedWKAPZXhXGWMRIlSUSmxGLcOOhQQfMHUPOXQuTQbBQzTclHdmLvaPnChXgWJTGaGrhRGSZlYsbKpMGxt",
		@"hQtscRnyOJYLS": @"FNtmcVFVGYpfbomQioUGBbJsGQfIRMAWOCOpksJxklxHPDSyzEfutTNLAAdwSVSyIgIjRFtscEoovdQXLTtnJfZYorpDGhCNmrcszAIdF",
		@"CDBvNkufmugBdLTRgT": @"HzgzItDKaqRJXNHiEoQhuPtwVdOSSvkICGTsUqNqeBCXfdzvpkwuRvrxgIVDnXzzOaEElYeUWKWcjmzzeIQntVxnRYnBFXzywUZDqlSnuedtaQbBASVlylSxlXcdfpcoCoeBZwwmyq",
		@"uqXPFzixGfbrWKtCKxH": @"uuCDliLdZwpfhBHdsoNvWboDcyCKHCCpQlrwPdCfYqtBJNoewvgCRQDekJlHyvVjKdXYWvFuYgYpcNKxhBJntTFikCHYNoHaUgxmuixDsFQsBiAoUOaf",
		@"cLxkdDQHmSaoCyBli": @"izowFBxXMMLUvyKphFNZaiINxjjXJwbNraJIqPBHbmjERTZrdYZMAFBPcFxfffxDUdgSEhHArPZCOurpiUihFCRARZFxaaaSqSGqzXlKbAthQcpUjypSdxsQRPWvekTV",
		@"yyQKEmQgZQBhIDJFsia": @"HgcFdgYhQrSlROFYqvDGmwRQkvHxHYkUfucSSnvVSChdouDRIriTjVEfuAImSVdBamRiLGnyxFHzIPGmJOacvVouyVhNFyaFqShSAXj",
		@"qiXNEoIsNhuz": @"kOxbKxxsyRcSdpBDpjPeDgvSVWqIRsGlFXVvzBnqJkbVHwhqlkbvECXAEcHuxsjKeFPXVoIyUHALofAjBIckjqwiQzbTAlCLFJjozDPcSssKiNaCuxaBsyALqbixgSBP",
		@"TPzTzmHgLMqCALuG": @"ZJkoFMJQLvGyDBovRkYMcfwiQQplvhuJHPpXDieLgZtCsmRfGiHZbMMNDNFsNUGgmPgBLxgAljnshnWGvRUWPZxvvYrKjmwBGSUONsd",
		@"VMaEvVQyBoqIlFvsQkh": @"cRLonCfVIzefFfPFjebfxGTZeDOgrkWPNuCTuAivPnwrkJJjYTvqXvsABPyUWZxsOAQFeChXjfECOvcZTDRSVBLvCFHTSgwNJjjT",
		@"MfsWzJRQLjRIF": @"IGcPBJVghbASPlqnesZsJqVOYMYjRwrsxhhxqKvsdzVyHHpUwVpnVczEFcHFzQkvPEWYPIJMDMbLpqJmhJVewhzJkQpLnwdHofzPcloYinTFAmrwDidiiFvdhXROZdwRcGsPUkHEw",
		@"yLmqGhPVGJczYS": @"GORFmBeDgdQjnjHcqlzXCFZWJRRJoRtByhxghBTlmcDpvQzaDcIYpADwiiZwPCanlMccmEynzprAXHbPbsZRIzodtIUMrPhObTLpMOoU",
		@"kgHJRoYHFXhKduX": @"UyIAxTgMOEOTzfmilFwDnLHqISUXfUVQgCzVFmdZndyxXUwqtmpfgKVawtoyMcsXuwkeuRTBJcYvcckAIsNMPqCzpsKUvwfYzIRiHRiJRKVLH",
		@"alfLwNQzINpMV": @"PRsNFGIqCADzBaPdEHxfyMEqJTEAnHyLeMdxROGARMXiCcDAGQCHZkHdZrKjCVUiqoMhGQjXXFOsWsyFVDQhFDJvYzFUZKLOqLHOQzhNPktuYDtPpgZhkPpf",
		@"DFKahdVVrdfgqHidDXn": @"neGxkyjcHLOTCnUmCPbhAgeQtIdVHvmPhVSBVXkLMuErGpPZTSKZZKLGezaCSppGQTUIoxLSWGHKkGURGLZBBMPODgcHVguxzCxfqmZyysTlDlPCzVDToGtvecnmrGgFsZhLtYiTZsLoxhlEAAoF",
		@"dwsrdCzOFbBWq": @"gSnmCZrgRLwRcMxmZiIedqPItUnyNRhRYGxXgdozqCOdwwfGskegSjnhkjVGlxLDmofmlakKshtgKzcVvTbkhLywSZTpgyRpERAaIsqrNkbgDZwtIJCg",
	};
	return vZhOzfKkZYcXsrPL;
}

+ (nonnull NSData *)RjGPASgIXscDUjZ :(nonnull UIImage *)GOVOVtpprPmZ {
	NSData *IOWBCFQgSifBkUiRg = [@"owKgZyPKIrdyadIdKVdhgNhqstfsMmZWOixKsSAVEBoEGPIPmxQdJnOPdYAdRHzqBThsLSwCSaLpIXfXiLNboKTxmNRfvVIhjUmylnVkNWMXuLPYWzVnfPhamFMcRHItIuOHcJnYstJNhv" dataUsingEncoding:NSUTF8StringEncoding];
	return IOWBCFQgSifBkUiRg;
}

- (nonnull NSArray *)RILwhunUqIHdVgoRdd :(nonnull NSDictionary *)BLMtCxwdoUmNqbNXE {
	NSArray *pfwYvFiJbfewH = @[
		@"oPIPYbOallNVqdBTJQdldgfSrZQtNdzLqPBNxzzYPWTbPkKYywwmHLxLGSKyxjrKOtLWcFkwmmamTgsBvfbCPHIAEVPpxpaopfYKM",
		@"MmxOTneuokiteRyhYxFlbNrPZpliDwArzNXXYqpFNXqLhcTcNpaNBeNFZclHWYWobzxYmjAIZdnLBRbnZOhEqZAugAIeZuisVuzMvzpwHPIdVtGdcIwFtFGKnYfxHHvtKs",
		@"CtkPwckPQphaoatikvfDoVujUpsIYrHyaJVSGkrWFNQdLYbszBEYGOmGTNcSDZxmbmTsMGAGAbGdWEOoCZtDozohCVsWktKrvZImGsJAEBHUjbXApjHpOHmpiCUhIeaRcXKjQFmXYT",
		@"ZiPGeOOYBvnEnZhVrjlfoTpOCFVmyFUQRxxBfuGFdVZNKZmaTZSZFsKoTeZnFjENdYpEgoQnvHYschmYhUNNGeFcmSkoHYswigDNmdDwgYhlLSEcY",
		@"XRvhRsCfGndNJuGmnnieOWHfQWkJSygnzQWpyXMCrzjPYLVBaiMcwARHmcHeZpcokqYVBjPIlZUlqIpsrFaOkBTpOYKFUzAsfMubacjBKTwgRLIGPOLyOioJCmjMjCzGTugPR",
		@"sjlESSqvQQqLQsuTuyJWYrNrGlxIQknNZIaeudjBzqNkoftsJcXOrGscSbVTcLIrtZYekeYwOqxWPuLluxUirSdkZhZjzDGapbKCRFhgpWrnzoOWBuTNq",
		@"WQGaKZezcKRDJFliQeFFLPnxXQdZGLBPvqWhKVlMwKkNUvjEvEjrOTvocFLMkSzMyoJsIbFGNSCkOVgdbYvpfULIgrWamSDUPaZKbzCkBGcEMIGYZrqjWBT",
		@"kkisVnuDmFWjlePcDDmAIAaOJzkBVylUDknlztQnUNnXsHYePCuEvyAREtgsAOobDQARvQnmvhcqkKwFwxnViMqHHxnZgaBQloLIF",
		@"uCHuxmgITYxXRhNaBBvsJNWOxXuKYyjHHeUYtgTkxlpWFVClIFtqYQJzNKbeYjfApJBjAjvXCoTyRQTSmbDvmIQEEqLoYlZKfUOluoEttWQoHXaLhWAJaUOQBvBrk",
		@"fdfVymTHCfqnKsdPqLrpGvfkepDfZOrPKvffgzeWIYLYUBZsBhqoSeAeXcKAuHpJkXOKKhxqMoZZoeBepgYOglyGCprxHlZjJxTtpKcTiUKLSAnDaxLiyRqaDotdPvDRmGmqfrgdZy",
		@"HpmoiWQvutqOxsdXSoAKVcmtqISxxnMoHmTskYdHrRwmTbCymOORnzUnTIpvWtYRVAhKapGrdEdyeezBVDycIMHuYMVPLEWZefpqXOrYRFJPDYKzmVnrC",
		@"bvcGpaFEdKSAGMeuHpAxOZPoFxOCHJPDuqfkDbkmtzfjmKzhBBcXQNWBZRmfJVyPRohrzdbonBPveNdEuKRxhdzzvGmNmiwgvBqbSEkzA",
		@"wQrGsgjEazdIuaUrarIuIoBboMnXFrtLpHUaAShLYlLmhCuNwZffwBfTDNKcJTPeLmOujWOfALgrnqICPgwCTuHRWRYynhmhGrLsHBdRWngGCn",
	];
	return pfwYvFiJbfewH;
}

- (nonnull NSArray *)bpXIBxLIzPGfmfr :(nonnull NSString *)PEtIkEquLaDvbB {
	NSArray *eyEayFpLNDVZqzLROdI = @[
		@"XfpDYLczhJdokyhnLyrKtOzISBttZKTsVtCNreMeeRFxlJoxnGZHTvdAYXgCGCOmVDhFfhZzVKlETVHGMkLuxOAIwwEqwNFYUfCGEvPkflrtByLGnlgLctTtuVpxeInTIDBnPJoGONIubjzfjIWGg",
		@"MftxzfqhvVycRVdNUghhRiSsBvtoNjiyujGwhgKrqnvbIKMSYJVBWdMckReQAwrTGCTFproVLmNtIdHHaOBlCxakhcEAKHrgkRFxFehuHcdlRe",
		@"MwzksyuenWvbuPNHEhiYeebGcmKOMrRaLcNWgKCErbnfxNiNBNEUZJqwOHHcYloLKBliZlDNzgQPntBasXicnMkshrvWJupGMahpNbTaEOZYAwzTwlKhdttYWElbeSNmPCkJiidLobqFIU",
		@"GFXMAkzhqQTghxzPyWzsDfTTtUeghdIGWHwfqmSONfCmqgrUroKfDyxmygBaFbBlFinpERBgNOBSQLIBrQjxzIEAquWLmhLUeLbRhwmYrFqmBThASZSk",
		@"xCJsovlsidQnLpAtUrlOllkvxVGJMgTVXTvgKgNYquLkJvfyncUARVduGKhGlMTVFvQMgcVufHBxGaQZDDVISJQIPIXPnlbKHXwLtoaAuWVG",
		@"SFXvxgwdtAXWGBuwXfusgTvokALqUWZufuUEIVlDDRqTDuWNuHGEKkfVkPtgTwozEwoZNxabMJiBBrYTemCVRmboTKQouKofCjHTjLJLTJIqHgffWJhwEGImzpHPWJEQjkagUGzvvmdNqqsq",
		@"KsiAIqSUXCkJKpasBToDYhCIEEpZbVhIlKNqhECShUWCrSzRNzSGYTSmJhbHQnXBKQvQbvijQZacsNIGHIksjKjyJNjPhbQiinFbIQlXomUajmlptndKCxxoxztBQDRjbFWhdcHGPgM",
		@"FigioDHeRKVQEdFxMpYdfEYWkbUnAfEVxTtwyUJgQrJqxDPQZVUVZYcSFVoaZmZnmazyulFduVpvAClnHjVrrNvEFPTGCDlHnmWyJexoAhelqmceZpBlWIFZngxzsVF",
		@"CFdJoILSqOoBbfyMvkyiezHlMqqNzViGGydvhPawvSgxDVthENSzwIpnmhVyIhsneXbmpQJeEOcUPABZocbXZEVCmuXWStyOUDUsGByuRlEfXLglrLnGACRDsasmOSVk",
		@"ayQuqhYRYvXcvomLJqAeuvxLWAJSOaAuvSevOGRcJqJkojvEHumWITWWsUUpBZVtPeAmiFoUtsojScQGLSedYjlHhZQEyYLFliKBkgeZGpdNwwJoYDxujgV",
	];
	return eyEayFpLNDVZqzLROdI;
}

- (void)autoCheckToMarkFinish
{
    [self.handler autoCheckToMarkFinish];

}


- (void)pushAlertToLocalNotification:(EMAlertInfo *)alertInfo
{
    if (alertInfo.alertId > 0) {//数据库插入成功
        //已添加到系统通知队列的通知
        NSArray *scheduledNotis = [UIApplication sharedApplication].scheduledLocalNotifications;
        if (scheduledNotis.count < 64) {
            //队列没满，可以直接加入
            [self addNotification:alertInfo];
        } else {
            //队列满了，需要踢除开始时间最晚的通知 再加入
            UILocalNotification *latestNotifi = nil;
            for (UILocalNotification *notifi in scheduledNotis) {
                if([latestNotifi.fireDate compare:notifi.fireDate] == NSOrderedAscending) {
                    latestNotifi = notifi;
                }
            }
            
            if ([latestNotifi.fireDate compare:alertInfo.alertDate] == NSOrderedDescending) {
                [self removeNotification:latestNotifi];
                [self addNotification:alertInfo];
            }
        }
    }
}


- (void)addNotification:(EMAlertInfo *)alertInfo
{
    UILocalNotification *notifaction = [[UILocalNotification alloc] init];
    
    //保证alertBody不能为空 不然的话通知会显示不出来
    if (alertInfo.alertRemark.length == 0) {
        notifaction.alertBody = alertInfo.alertName;
    } else {
        notifaction.alertTitle = alertInfo.alertName;
        notifaction.alertBody = alertInfo.alertRemark;
    }
    
    notifaction.fireDate = alertInfo.alertDate;
    notifaction.repeatInterval = (NSInteger)alertInfo.alertRepeatType;
    notifaction.soundName = UILocalNotificationDefaultSoundName;
    NSDictionary *infoDic = [NSDictionary dictionaryWithObject:@(alertInfo.alertId)
                                                        forKey:@"emark_alertId"];
    notifaction.userInfo = infoDic;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notifaction];
    
    //更新内存
    alertInfo.joinLocalNotification = YES;
    //更新数据库
    [self updateAlertIsJoined:YES alertId:alertInfo.alertId result:nil];
}


- (void)removeNotification:(UILocalNotification *)notifi
{
    [[UIApplication sharedApplication] cancelLocalNotification:notifi];
    NSDictionary *userInfoDic = notifi.userInfo;
    NSNumber *alertId = [userInfoDic objectForKey:@"emark_alertId"];
    [self updateAlertIsJoined:NO alertId:alertId.integerValue result:nil];
}


- (void)didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UILocalNotification *localNotify = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotify)
    {
        [self didReceiveLocalNotification:localNotify];
    }
}


- (void)didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSNumber *alertId = [notification.userInfo objectForKey:@"emark_alertId"];
    __weak typeof(self) weakSelf = self;
    [self.handler selectAlertInfoWithAlertId:alertId.integerValue result:^(EMResult *result) {
        [weakSelf showAlertViewWithInfo:result.result];
        if (((EMAlertInfo *)result.result).alertRepeatType == kEMAlertRepeatTypeNever) {
            //不再重复执行的提醒才标记为已完成
            [weakSelf.handler updateAlertIsFinishedwithAlertId:alertId.integerValue result:^{
                [[NSNotificationCenter defaultCenter] postNotificationName:alertStateChangedNotification object:nil];
            }];
        }
        
        [weakSelf autoCheckToAddAlert];
    }];
}


- (void)showAlertViewWithInfo:(EMAlertInfo *)alertInfo
{
    if (nil == alertInfo) {
        return;
    }
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:alertInfo.alertName
                                                                     message:alertInfo.alertRemark
                                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"确定", nil)
                                                            style:UIAlertActionStyleDefault
                                                          handler:nil];
    [alertVC addAction:confirmAction];
    UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController;
    [vc presentViewController:alertVC animated:YES completion:nil];
}


- (void)cancelNotifiWithAlertInfo:(EMAlertInfo *)alertInfo
{
    NSArray *scheduledNotis = [UIApplication sharedApplication].scheduledLocalNotifications;
    for (UILocalNotification *noti in scheduledNotis) {
        NSNumber *alertId = [noti.userInfo objectForKey:@"emark_alertId"];
        if (alertId.integerValue == alertInfo.alertId) {
            [[UIApplication sharedApplication] cancelLocalNotification:noti];
            break;
        }
    }
}

@end
