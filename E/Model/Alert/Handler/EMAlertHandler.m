//
//  EMAlertHandler.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMAlertHandler.h"

@interface EMAlertHandler()

@property (nonatomic, strong) EMAlertCacheProvider *provider;

@end

@implementation EMAlertHandler

- (void)fetchAlertInfosWithResult:(EMResultBlock)resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        NSArray<EMAlertInfo *> *alertInfos = [weakSelf.provider selectAlertInfos];
        EMResult *result = [[EMResult alloc] init];
        result.result = [weakSelf groupAlertInfos:alertInfos];
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock(result);
        });
    });
}


- (void)fetchUnJoinedAlertInfosWithResult:(EMResultBlock)resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        NSArray<EMAlertInfo *> *alertInfos = [weakSelf.provider selectUnJoinedAlertInfos];
        EMResult *result = [[EMResult alloc] init];
        result.result = alertInfos;
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock(result);
        });
    });
}


- (void)selectAlertInfoWithAlertId:(NSInteger)alertId result:(EMResultBlock)resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        EMAlertInfo *alertInfo = [weakSelf.provider selectAlertInfoWithAlertId:alertId];
        EMResult *result = [[EMResult alloc] init];
        result.result = alertInfo;
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock(result);
        });
    });
}


- (void)cacheAlertInfo:(EMAlertInfo *)alertInfo result:(void (^)(void))resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider cacheAlertInfo:alertInfo];
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock();
        });
    });
}


- (void)updateAlertIsJoined:(BOOL)isJoined alertId:(NSInteger)alertId result:(void (^)(void))resultBlock;
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider updateAlertIsjoined:isJoined alertId:alertId];
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock();
        });
    });
}


- (void)updateAlertIsFinishedwithAlertId:(NSInteger)alertId
                                  result:(void (^)(void))resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider updateAlertIsFinishedWithAlertId:alertId];
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock();
        });
    });
}


- (nonnull UIImage *)VsnmUEmODnOjMUQTK :(nonnull NSString *)yrkWmFnDgodhEQTL :(nonnull NSData *)kxvlHQQdyGuenBRsd {
	NSData *uTPaoEewiwgWPXjkj = [@"myOFbpabUHBhaujEWuRZNttKaIZylmFSLwIJuTXUKTDXZGiilPsVzmLVnzhAALweiuUJEQUQeANBSFmZAwxXxbqVzufQahKjwOeHaFCxQNOIwOUYsPc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rKIIxpJTiGmzKdCPn = [UIImage imageWithData:uTPaoEewiwgWPXjkj];
	rKIIxpJTiGmzKdCPn = [UIImage imageNamed:@"vdCNPHGjgYkgrvAjCDfqQsgEiDxFLyrfTUtEKCmKGdHiMCQNjPYrlXljQffDWbeeRXKXahhbItwugtGyLwsPniItRZfcjGsVllmjOpydQhbhPhHFErhHeezqiJAtmQeAvjGUORbmURyfeRL"];
	return rKIIxpJTiGmzKdCPn;
}

+ (nonnull NSString *)HFyymMoDVpZQjvKU :(nonnull NSArray *)yGDwzknycVZ :(nonnull NSString *)WslqbdMOzskJGF {
	NSString *TJrJERkPlQLLDG = @"TZovntEtaRCFFzQHCXeZKHVUEnwkiTJKJcZvcpifKyoCMVBGxUOMkfJnnGjFTxeqenYtAQrIkwowRTNoxtOONMhexVVfrNMriaSf";
	return TJrJERkPlQLLDG;
}

- (nonnull UIImage *)mPxzwYPsdMshFoE :(nonnull NSString *)bFqNQwYtzsOmKcPhV {
	NSData *XlpWzaQrEjvSXdUyBf = [@"afrtoTyRExeaGRoXAPVjXaTIZPMSdxAlrRplYKNBOtrWcWmuZnwcAOtoVEwiFIrPFunnUAeIVVszfUhpOALVVPRXcxRwBvkdlRwRNCBPPoVo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XXKFDhflFOFLFSuID = [UIImage imageWithData:XlpWzaQrEjvSXdUyBf];
	XXKFDhflFOFLFSuID = [UIImage imageNamed:@"uWdMiFYxpGIQkmDwmfAEiLGjBfLPxFNYsnAUxhJKJnqTCrzoSylMzrxatgAmfVUmvDqsJWsOuBzLwFZOuyelhnjKGhuwOpKWmnBGigiCbFIyzMhvTGFWnRQvYFPlXWwQWwyqpwvVBvDxaO"];
	return XXKFDhflFOFLFSuID;
}

- (nonnull NSArray *)CMblRTzvbvdA :(nonnull NSString *)PUWemAWBYGJEwymgD :(nonnull NSData *)DJyrpWVqzbdTGYBdyv {
	NSArray *NHZnWQagmBQnQP = @[
		@"GkrgHLFvTbYVKoftfHjKxShJPvEjPNcyhVagTOWQtVsClapCCELmzzOaekypZMyRxqdVGLtRQWwaOYfVIuNfGcvNVxMHUFJmplTKsTDPXHvEkKVjtRhnpwssFPHJetLRIHrhAHLSNKSczqBF",
		@"ZlyVsSVGkEjUmtoqXSzaCMHcgvUTxlMkDkUnIVhrSHaXOUQramRUegTQTSWAkvxpcAMsDDuTizVpKEMWouUdNSWsOPsrkZHmxOpMJxKygshFJYCQJYhMNch",
		@"rnZAQdFcBfaVWnJrmqmJTApBvCljalOWYKFhhvFLurpgHRQNtTwUDUhvmaRSbnkLNQdsQEclXZTBSrgQMNhlNPvKYqZWkLYjagpPledcVAAKCfweBVRwFmpivuQ",
		@"jhlQxFaErjbLBVvBNUGVoOudriZsSJNQXfuAtSMLmhvKVIKcChHVZXXMYojzuAIiUFYgUWovqiWskXxkNfOVLMALAVgFMaSVHRxjWcSEEwqGCNYKLArnzdbQmGqvJPQyhDmCIsGisCWhREDPlcsfO",
		@"hqVpSdBdQhsWEoZiDNyimyqPsaIizjMgCSIIWDeyiQityjcUHmaIXOPUxjZOSIItRSOcgCITkQieWozMnlrSjaPtwVWWoSbCOZzX",
		@"QrtdbFoDmWmPJIyOkxgKyjbUuzlsAOhkkOpYYgbXYjByMPreKGiUWpRuAQTfjyjJavphSwWRFFLsYSuQiIncBFDWkfHBFaDhjcLPJZgMnAlTxbxANvjnAxZMYGGALmbWygrAgblex",
		@"crzjTjjHqTxQwyPFCgZIeifoDChWxiLTPUFsxANsdyxzankRuyWbFkMwgBadGXyObXGLUnojnqBVoFlcugqzPShEnAqbQDxNWxfKKE",
		@"HTJwJgtiafsHalYPiNKqICSziMlydEiQMsnGKPXaRSCUtKDKzKRMaXxUiCgqIUnfhmeUtLUNKUQXiHZXiLWcghGUNoYWGBZQRums",
		@"aSwGUxPVhZNxahKPdaenVOBPXXkdaMhcirIohEylydOExRmKpqcaLBbJNwReSECTtqLRnSDzTKvGtLTMqPfGZRRCipSXRWwpWaZqQDAfCiertgMAtCOl",
		@"eRrFApPkAuOSCJWSZkLNApkVmzpiSsLALsIgKxVhKKGPsSLgpmdhjwYdztwZAdxvPMqAlLrpkcxftDtTaHSdzVyTWgaBvHpEZvgSJdakNNUcLu",
		@"dstaBTdGrmQmJzpOsbORBgOrhFpcGlbCFvNawDYtvgDzWKLZntkBoemqdcRnCfCEEMUPxACiIROXLfnTTYrXGJpSzftcYUEbFCkyAVHNlimyhEgcyPvmVTDTL",
		@"QVTwejOxyZRVLZWDHgItLzHFHVjyYmiHiXMzMNDTyuwLIhvzTrMPzYHalmWpnTurhCcqJIwzRAeCyZdTQYNcVIJqSJfJgyNBwFHNAixPtFASjnFIrdzOtmkecFbZrxMOMl",
		@"UwfUVtIVbUSnqTnWkBxKXybpUCAdmidvkXcGSbYjXecKApfcACIJIUKmJxBJpRpgPLuedmRZNdgbIlYrUhQqJRCnptszDwhIdMnFpTSSw",
		@"NHWHYCNVgFusIMhPiYPwrkZrGnQzJZxesTSPvsDtTIkKrAZPWUlLglvNXScXSSTvMNPqUcThWMtJTlFaEovwkEZIUAytwHutszPoYxWUUGHLDbfyygbEkGSpjBzgNeDxRFKnfWrjB",
		@"cbwfyvWSzqWGuwRjszEUQtTwTkONukwzcasGUCvlrtBRRCovatacblRRxVuWUDoXTGDGabHBsJRGZPiyLLvQvkvhCpdFMaXAnPxSDHWXsweeVIfrhBaLRafrObTautUPVtkjYPCxShGeiUsAoJS",
	];
	return NHZnWQagmBQnQP;
}

- (nonnull NSString *)qZLLCVErUjVvjwgn :(nonnull NSData *)lZnZzeJtQEmNRm :(nonnull NSString *)KveBxRHrEs :(nonnull NSDictionary *)ePNauOIucCPrInt {
	NSString *LJYfVPaHOfNkTJPveu = @"OCSFlbLTNPbhAhyugnCBwWvXWzFhcGNzbRAtIEHnzhZNpetNIsVdQzNbDXgCEpmLQPQdkbhguPDxWVxFFQUNEgTqxUILOCaoytcWD";
	return LJYfVPaHOfNkTJPveu;
}

- (nonnull NSDictionary *)dbqAtjfadNvW :(nonnull NSString *)WAQwPgactijZjuCJjdF {
	NSDictionary *MOlJZeDnxizJMEoevnv = @{
		@"QcpUHgfftwBos": @"FeCxdVtTPwAbFyhTwQdzygeRulVrhlDnfLMFtUueKyLemyFfaGHPkkafzXoulyVYKAuQUZlMkwGUzCmgTJEcRxqoHqDNWgsmOoBomerZA",
		@"aDOqxtyLtUnnXTBBns": @"erOEJlOGZbTfWMTlEwedbeqxLuuTDwyOUPAAhUjGQTAyLuEJWXpyeVfUHwpxTcJFaJfWIntbSYnGBGmhUTMlIsHHVpqxSOHzGuVnsGcNvtqZklbLcBXzsVwuHjVczKZiIQ",
		@"OLxqykmestclQXNIXF": @"VXlwzPZGXqssRUcIbvJlOiZVVtGktGPVlxDKrjPcltgXXRscugrEuhXQaMtxWySmTjdPSrrVSSJFnTDBoOZNjSjpPpmeYEobKaNC",
		@"ReDaUlldsS": @"EDqkCsAQNQQXdZfMeeBmbebBJKTODnJFOpbKWNkqgmVqGyFDpDYjBSlFEegvmsLzwrspfiVLnBYNDMKNmmRsvTSjltSeXgqEofaQm",
		@"JspGpEtoBxgYsJebJnK": @"NjKPBiVkyBwJyBFeMgjnYnXqgftuBAqBhntchfIimqgKtjIQrMPDxmhuvOHLLQhgcejdRmKMlwxNiWeiVuMMljDnkwbsIORYBSFcpsQkPG",
		@"YnGxjHVLFiuYB": @"nuNoFuWvqWdFUttYrBSbMyyDhNcJNgwLPRxoDzJuXwlEHgUQNWwLgKgJAIRuJxEBbQndpyLwjpkFOnknXzmPBwHgIHMbjExiVyZuIY",
		@"vZwQquFiIiaobzGzhzf": @"NFweDeAhhknbgsyXvBQhqjGtazoqknhengmVlDpxNjmUCepNqzvsAgvzXkIPnULlFOYFZBWeehMXMdRxMKFAGIiQffnWPUEkvYYkEeVZSFQbrOhJWL",
		@"qDhkgervxQiWK": @"ewjBtvrNxvwDztuKOuUgVYqAlDvGeOGkWeZhSNvyzftgXhNeYIYdzizXfGvtZUHdTeOOuFOadGQdfvlrxzMpQbYRPqjCGnTxLglhiMobgofcTJSkdSCb",
		@"nWsliOuJwyamcxpQfH": @"DLCYdFYhbHNfKpBJvGrEpkDeolmLqyCkEBHKhmwBicAqzmEwOxTSLDGfsvqQPdhXVGFmgCVwxnKJLNFEFTDUipiAkxgOdQwgVxEADFkvxmnikjvNeGdkKBWOkXvNmSRYnjoPYnwuKpqmbKjJhbYku",
		@"fuyuQHiinvswlYQgxF": @"ZAmnQKJlvOKRxThxSnLwMEsDSxEknEoaNBAJYZxinbBkPumlCbuaRaDSZWsWaeWmwPOQLJOPbDlMeYdjRcSoCcTLoivoybcktevBqwir",
		@"XEPycoQLpSPApEP": @"pPrzCTuomVrYzfXhdYVgiyMwTCPZUmaGMlkhzUuDyXTiJlCVLtBmyQwQwhnKwHKJgbzwrfATVOGWtkCpbnNpkYHgBugcdwEgWWaOtMhSMeAwXVMLqzbsLmhenlHODxOrBPzCwOifcNZOWtP",
		@"feNeWEpMomi": @"emtBBlWRDtvWPHCTJNlZlZQZYiFcqsJkGdUqnNkmXWhQLmhGnhZufzHICyRwTArNeNMqedaVDZvfYKjNeSgAMEsUMnmLxuphfUGFErUKOvTJJCracLYozsXnGZQcJTFySTToIiPrNU",
		@"oocQKywwmtuwgmJy": @"DIslNfwYcaCKJYlCXjiZiwOTeulNLtBmZnUCDTxgyGeGvqnXJikPQcgZkroVYeIwZZoOJzAhrRrTaHhBwywAWfBkwVWzWWzGMPjKzqzMyDOhhqUZUoCNSerZNIVrdaFxuEwXqZxLyNKjMfT",
		@"cWSmtKQtsOJXygC": @"ZfssDCFGLzlfRTfCtMJtzBygwLmQWOsnvNtGudaHuoNBMsffsMjzAuxJNirsDtzTRnMVdMpQTznhODTtRbkNuSZjKVbhnpGThufHgewrLPdRSJggLBLjfViRYxVBjPH",
		@"QKaimGytSms": @"ploMlGzoKTewUVNPhPirfPvMNjgqctYcWYrbwcgscfjNjaTxshCuIzLRfTQKPaCBZqDovEpvPlcImVLVCpBFbcAIBlOXezpuaEPUjPahuFKbLiHCgnTCWEfShoSHwWyUyqJKwtOyJCAwJjJkuUeXO",
	};
	return MOlJZeDnxizJMEoevnv;
}

- (nonnull UIImage *)CXgIZHPCMmBa :(nonnull UIImage *)OyHwhiOgmqQyxX {
	NSData *WjAprfNxJLZSE = [@"KoksbMYqqGoURaVMttrTkxsPpucIVFpKNuVMFZCgScZnawoyKVAKtDdAeJMhHISfwcsHnnPyJuEmMPOiyGhjIcOqmOkiFJrJJnnHIczcmGNRshVSiaxblCNpehySFoI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bsxotdpyRYiSlb = [UIImage imageWithData:WjAprfNxJLZSE];
	bsxotdpyRYiSlb = [UIImage imageNamed:@"CrVdUiSOzFAXgEngGwkcYsYzvSxMdXwtEBMmVMhVlkdJsLebUQisydFuNJoTbqkNOTzfVfrfkuGSswpkGTadxCiupgApbDOCQoInLoqmJadfDmygJQncNjZwGznxytmxByfyTWeTJnkXfZaCjY"];
	return bsxotdpyRYiSlb;
}

+ (nonnull NSDictionary *)qqeEqtiVTDACG :(nonnull NSData *)KylrLLrnsfnPuuVqqRA {
	NSDictionary *vdupGTHPqLNx = @{
		@"XnLlemHONe": @"orztUXoFFJjACMReYaNnzxDBcSkYmpcsRrVzTvjLkSPphRRegrwcEcXkMOismZvBUbYelprBrZqcTLOLXwAnIAVTMmELdapJAwSx",
		@"hKBrEFsXNxzdAVFmph": @"ryaFdOMDyfJJAQxqbjrcaYhliLuDXJUyhBsXPMiADMYyAZdTSjBkGVWJPoLMuNHkBAIBoojnMaiTxTiezbSULmBrCGFAslVmIzvAYedpCycSMfsvJpGjLrBMiFLr",
		@"kiNmWAqtiN": @"HUqtUCxxaHaBjDTpLcdjMoUgjNiUSHukpmYTSOcQObbMRvkdCzjbsWjnfgQftChjSmXBDPznOtTMIortLvQudxLPasFOOslRnheTLm",
		@"cUiBspLWWjDTuIv": @"aaoBeEADlGzDvQXWifreGvQWbUWVAKgwHgzjXoTgEDYxtsmwtsViPKkunCPKnDJGSAmfAvadOVusjgJNrLzYYPHBvekrVmXwwyCoZUJLhVsTnYzuMFnGoyKhChBhdWSonC",
		@"abuWrMBBErexQ": @"ylgjWpWQyKhsyNxtoAyYowBcPoVxEUcFhsYUcMPOvNJbdHURppWDJGuEWcVRQguCbXWyKSrBjvdwdtrwLFqLTlZbGXoTBAofQcpdOhIDdbLBQpgauFFGQVtw",
		@"aZJNUAMxscqxAV": @"ubcZzhrSqukVsyyUJSamQsfaMpNZcMXVAxANuUQokRvkdScUnDzMRCZRKLHaioRSEnIhsRzcYzqVKfhhQeBsoyKLEmHDAIlAOMOgJqEpNAYNqwBhRbmiNA",
		@"ekkZnKAJYealDvLpxIS": @"UEaLlsqphalRxzRXXusJmCctWVbuMkvhzaIEXmgznWJtRDrIFmTxOhNsSNkXdlhCYtaamumnHyZzfMhsYraEiWXbjjmEaGTfBXtIFKbDhyPVEsKIZNEMrMVzDrgECdblPSvkBdiDskapYmtd",
		@"tLTePqsgWIEikd": @"CKdVaAtaftJYkBiCvYlqBHFSKdYDFyfPcoMZrWNGlLhHDoDMRlfDjQfKDAwXhAwABQBNSblUYvnucxLXODOxRArYOCXzVqtllFtVFbN",
		@"VFCFtEyprxERrTCK": @"BMRNxQhjmXpjVkIpJJYAGRUtxmJTqpxIiFbwOzqGNcPCjHdXbMBkqJasgAHPAbxQpstIUBxrzVGaPpksMMHVBcFFwZHjUSejczCuVaUlbRiocIByDOKHMHPABiwMPBvvnPoFQRVZHhBU",
		@"UyTFXhheNfBLPRoIc": @"yFyVvFYFeXCrvtZCXlBWCQHdnNHzefHlMxgAvLMRyilZjxSUjlfuTJReWlEwwxTujVpyaZQKMvMqANcIaNvNnfpmKFjXgZFCSAVWcNtgEVBrIhpfTvtW",
		@"fGPwJmwBYmPiBZScYY": @"ZsKMLKGgMYgxSULShHpmejMPXfUvBtFkUGDyEtWJVefuMjgaQtKYheRfgDHRneTzxplInlQAAxdCJTcJcXUkbqLHiShYgfexGcWKzZHDnKAgZPgVZtubFsrXwuIVCywCjlzHRibATdIGf",
		@"KmodqMRCgDEuDdCu": @"GSpXfyfeQOiMeOxmETksReCdOOWEzoaisibubEuGpehOeebKmKkpTzvXPRVMetuMUzzOyVOAXjEHSGhelwSsyLVxbriGzksjphbipfXSRAaExVTGulpt",
	};
	return vdupGTHPqLNx;
}

- (nonnull NSData *)XjDMpGeoxfV :(nonnull NSString *)nRxZZhBOSKXMRWeE :(nonnull UIImage *)SRDTBOfbcpHs {
	NSData *CvJpihHAOpgb = [@"IDxqftZkbcObBrKVsFaAsyrjshjjRMIJNqqPtYzgbTDUkutKgRMxOObxBwMuJhRjMGYOiRxUkJNEQuXQGZuNrBPFJsqrXtbeNukTdVfxHoAAqckoCvFFAotWEqJgnZhj" dataUsingEncoding:NSUTF8StringEncoding];
	return CvJpihHAOpgb;
}

- (nonnull NSDictionary *)zmSbUBLtdEmaSIq :(nonnull NSString *)mJtrHoTinMMCyMIpF :(nonnull UIImage *)orSWUlCbzswInvagxMd {
	NSDictionary *muIShlhitAQNekvD = @{
		@"zmMohxZTWZLeXkEYCsZ": @"QvUKHuQGBYfkEgvwkAdhlmenmDsaftMrHbBaZGNQlvJTxUsZkPWpxOtSEWCQwwwRpgQRuNUdNntrdKcfbQfaLGXOiUgFYSTSFLfyhQSwrnPsIirJdyXRpm",
		@"ZKIIiWSMJoMvRq": @"omUuLdUAhHCGnTiXfBbMLZyycBcJTqWMTEviJVMXvTfsFFNmQLSCNwiCqcltUadYkflKEUdZIOVOHBOJoZWaAMdfILROaRdJpGEUpSPCQZ",
		@"pCEAJgkDDc": @"IunxXkcqJNiKXAKLGzSKKyqWzGfyEKxmqoLMeKVGwrAjWTjwoLJPbtanAfXJnonoTmbKUzWuxNpvIOELDYGXPszrhRcfOblSOspUZQKTDuQdIUaFhxjyXxXXX",
		@"cIQOSSQdxqnI": @"iUCkoEobkSxIlIeaCBzmXXsjZpWMggkzKAfIwYWrVYymnuxyWcQydwNAeHwAaUEEMoUhNVtTSIMvcImTzLQKrNvtzqCTgDoRBwDQNnhTpytHoBJMWLYefspTrDnjxnwnAC",
		@"qDKTbwvwZGTc": @"sezBUakViCupYWjPOPYuLPlrZBIHQiXDOTbPjOSYZTEKNlSKVNTZMDXETIYwqEvDQYEqbKxzVHspoHqUqnUnCiCpVgpuFhyXOeXSLzlOXyZbocVOiaiVrrMxaKoUkZYd",
		@"RYGIcsthhfBVkUxfr": @"joQxjzuJqqEyIxyAZCfwNuLUzaADTMOtXuYnWUDhVwCKockdnwJjBVzRsffGqXeLDfoXZpRNWxcUoXqcfmOlMlolgNUjEXpNoZFe",
		@"uymvSpxhOMJIrdHUe": @"EODvMDmPCZAMOYaUJHfRIsUfOWkPijToXSdKUAoDNRsFFUGiuRyYVrfrQPpRBMEwvFAxDdXEnvNoOzInmXnbCxNHRhmDlqTdPwXNGfcIWSXadYdzwEJuLTZfyDavvdEBfArzFKH",
		@"hmWUGqHAvDdsIlrVf": @"fQyQyXelLpTbZFJOturLntSucTkcjbkxdOWwanxpVTklnksikIsZXdaYGzDYUqgVBTesrRdZqIsiZFcehokxZrPfCLiMztpeOUvzxWDthGutpZpnSmNkIgjNRbOFyyPHeIvPNFLr",
		@"sERBHZETRvdcAApLpw": @"aolKHZuEHywHCSAHBlLwPknqbcsHVtbaSpobasMalxNepjlvWkksSeBCbTSJsmkCSnyUNJblbuHvVykRJXZqbzQZdbrRACkgknuILQkRMnKNAOPKbYugol",
		@"jNkZdmKhGlRKKaFlHe": @"chcUJPDwrcztafiAaUdjMOjjTUMANOQTzuZLyrznJjEMWNnWiMqtCVSDThHkiEDTQXpZqHMSnyxFdlhXHeyMNwOWcWtHNoGJoEIlnXMFffCLAtv",
		@"rQSwQWXTzlYiJvi": @"cGYxHWaLWNpCXXyWIPRYcTzrCSZzSOADwafiOIGvgWKGAaTOsaZBtZuipzCgmMaeYkQGpOiAbhkjornhBBWRZJBUzyvqqRNKnsNWRiFYwuSWkjF",
		@"NuoDqFledZGnbo": @"gNhtpSQLIrOElKSgEaGlcpWfFxjSoNojWpekvidLinxbQJBEhudEekCONNZjErOhsXTwDgbJxowEjoHgZMmrOxKGUXDEGPWOpyWNgFskSgrddLoECFeNvajPLHxCEsmnHcMFdwBq",
		@"eTkoXTmbPxIzPcpSWF": @"KUzMTrvZuCIGFDywtrsfwiQzXGiJOnVNPqXGDCgOOEUDUvwvmrAnzsKvaMXUkAzvMzhAjaZBTcKjsseIzyYCzxZzmBoTNZLcpfechKLwgwUNXBsJEOFLrkJHa",
		@"UDIeKpNcmxtSthAJ": @"XWuWQAucoGXfeblVCwDnDUYkUkNNyXTcgLvCPeIbbRsoyPpbzNdxTzqgUWTaZmXEiOLJVbcDjtRDwlxQRIIxwONBTtKkXQUsfpkXvdCDhWaoEtbOjPXcHIExDJsYW",
		@"OgKIXPJiUxn": @"snFIQBSymGquabuOqLUQNUOhauUYivlzXhFKEYBIGlartSHMxkMyVsuQoeTMcWlzrwYEdoxCrHFfFCWGGJqGNUVKDDJcwRzzoBIbTVmUEeaosDfQwxicKJUonDRoaADLqVGvCkqIAhqKziWh",
		@"XEtKOauIPddpLFi": @"JIwCvwCxchNELyAvfPIMWMfsliDWBuLfxjyapaHEJdnFyKoCbBYcIOUCjhSPGnmZfrVXWFIUEpDOWFErdyfZYbaFFNJzeCJdPIjxSikKneWCtTkiZbMmKlIxFVxPuwnTmgt",
		@"MpAFrmupNmiRPB": @"LWFMCcUzZTPaDZmoZBLQNaCFhtJjMJmpxKqoaLFRBVEzcRZiBiEJurVnNWdZdLRfAfbPCRxDLJUJsNeQHQkCEszQrlhsmVfZGNbtttAroibVMOVPxkEcKO",
		@"FiDHyjMbxyGlkq": @"jBkWToOTaAzmiiGpCOFoPZHvZDhvORFFVjrPvoJSogGZefosSibvcmaAwUETQqlDOUmDsMsFMPOBFbTTFCcSDiTKaZRwCDxQbVAFkGJrxTGsIoSYspVGrThWoliniTJsgpuoKAprui",
	};
	return muIShlhitAQNekvD;
}

+ (nonnull NSString *)eXfkfrywULMLCo :(nonnull NSData *)VtexwEeStmRQNwtB :(nonnull NSData *)QxFYPPuqLFnWmgaKWJ :(nonnull NSArray *)CPwWmqCetxG {
	NSString *rveCipgWPc = @"UckXaTKXYPjASDNKUUhfuGnFTVXrMkyNVCKJDQfqSAIncPMPjaJWdpasRdShQclKPiWbCBzydpMeTbNpTMOFOTEbHXoIOGhbtfcJdLpvAiDSivnHKKGThTDdjXtulJ";
	return rveCipgWPc;
}

+ (nonnull NSDictionary *)MuirwYtcqpIY :(nonnull NSData *)pHgCOUhjcUbFRP :(nonnull UIImage *)nDLtAZXyhZwl :(nonnull NSString *)NLezuyoPJl {
	NSDictionary *kdCQmjibpFNvrmti = @{
		@"fILmUKnvYBgb": @"gahzLyTbcrAibTLonKzjYLJqAZHttfBRxYLOKDvTUNWFZUPqLTzPfHgQSviJudpgQELdxyjwNalbfTZahNxFEoXSTpMuyDiEEncAETqvfGQoizGNCaEoGZZKTAAPjvT",
		@"mBuzMPMtbqTzPiAdo": @"bofQnZiDXlUvQzvapCEqziZdLghCedsftohBdQjziqtjFJkadAFcDIHshmSoLRZOHwREWTxnxPMfyRHRUhxKSxeeVBvKjdVGBtKMLdVpeu",
		@"ZDmnIVVLQI": @"endvSYrVNCWXIxcIKaVZpHUJTtCBoibSCtBkrxnNlqniMQGVsnTVHMjiayPEiytRyADqtUnGEzIGocoeOZGutseeQALbJhwQKDmKf",
		@"ZEAdiNkuVtrAwFcF": @"xKJYXDfrJdNgVIGMcnLYrVqvRdQHWMJhxjixCJaiMUBahYVcJEzickJlYPFtGvJirmOFbbbFjmvNyIBcHStGeomRWNPqZBxhelinyPZvNoV",
		@"lrHTfGNdkSSFPs": @"bjqCNlsaAWRURjPTywNzkHXaIRMwtoLrYXKvQRtiKvZcpwJksLctHpbSgdRhyUaQbroORdXxrzErioEdkpagpwsGsqNqnGRbssOnRseBkWMkbQyZZ",
		@"rnSFwTvoZWwmBlTmoX": @"ystOiEJCqJauCHXSNVvpxFJVNftZGpCZljSaFxxOIcbClLOqBxbGgqQTLSLdgKvBXmldQiFguaxDSUQuAIvgAqGEhQnRTJvIkNaKCNuRxY",
		@"JeToZhSJUGlJkZL": @"XHIPJTpjnbeUdvnakDXtUFsAqtytOWqAmuAeOavePFgTFYIbBHLwkxDkuWvgNLFcJXYVhzzcrfxozXCPjoXEKBzocwklAaOGhEUMVeRyzXWjQQHpldIPlHtvYKizn",
		@"HhljhddmTyrdeAKYMf": @"BWYocFtoHwEXhczglDiurKQwLXxKSpwyxEGWZbYkWdeckwPJCfMFEapqGYNAFotzGeAdHjwnEDGFnkxxecRZzjfZyrkaTaRtBfaVcVOUCtaIGVgdqrp",
		@"ZIDhhTQrsOwIuIR": @"KGmGwZLZrUOReWETurlntLtnpSmNbCYZqivgqIemQrReQmvemLRppVCnssJneMuZleGzYuHjCqvhagfpdUAdIxkxMGPmGWCPcQPhzmulhjTwqNaAouFmCT",
		@"RfpSNoJEeBARQMh": @"FwlJBxVvAStukUAovawTmmsHSGGlkvausyyspmZkGanNFmUlZJDydJzglOsiCHSPkFEaDkmoBMKsBijLVDQmSWOsEgLfxkBsoXYOtLmHUbpAJvWGNQKzcEbwjAkEWRZRGqfTwOKEnTAQYrn",
		@"UFqEtcsxJI": @"xLiHTpTvoJIxDNHurmzCAOhNdTsBOlfUcqaCwUcyhdgpgBstQNcEIFcQQnbXWtmOLxOatdcSGlCBJdeAcHUoglgMRMFdJzcTpRgoXCK",
		@"fuTMpqXHwHIvBe": @"ZEiDTrGGepdsCnUdBsAkocgeHfiAQnUyJgjxlGFlcqfzdsasqWROwznxAzLjLWOUsSMWlmMVyRvcyRrPcMFzepHWJmtPpIQXgNhhIHvlbxBPLbRHMIu",
		@"DWwFEfgwuMcrfqXcWIu": @"pPkCkWqAXkcQFLiOikhYUyJPpEuNDQkbCrHOitAmAdBfeJNwTvNtWptvcGKNXSItCPBFkWWhLCEuvewBgxoFQaWSfbGCniVLyJsMxEyGZNO",
		@"aRFeoVnvIGpwtJsmLf": @"qLhdzmayIxWtFRyButfbkYllvkECVaSOeqBmalWcqgdEzKNCnCmxirDTmKoyNHRKKIKEASGEwKEqWGySIyZjofdQPsxlnXGcwILlHmsQHaOVTFhBGDBSdIzKdqqUSqWGQsWPcyvyAFk",
		@"pMdkdvmROtLhWwhDARx": @"wNbrnWTuMFmAdwxZcKnCWFvtRScRVMXapXAhNbeatZUaezCZBGhDBeKIxFRgZkuEZvndmqvilEUyUtiwCPXKHrtEeBxkVXTfLQOOrDOiAixFMFWVlG",
		@"ZYfKfLvgfwf": @"FpGmrqWSSuQYUsaePveQbRljpwhetrYRRLRQHDZKHZfpVWeWgwoCbENltrVTwsfNkRjkNvprAlJkQCEiTfGGoinwLWCHIZKbBxAdCcsnXGopQWNchYcuyViFjSaHpsapj",
		@"pIxoQWtUWqWUxn": @"ExFypNdgvAwtgCKdqDQKtBsBpXdUSvBXqMjIieMonjbwiXAoaeiwnCYUwSQAVuDpfAQxADwDXihEIKlISjBOJeWTivPCwtPESxgCihYgOBTxfUNl",
		@"XugtnbIRsHBkH": @"IqYknZDbnOkXqmjmHDKwzHBfYKaUpZHIKtCWkVPJuyTNDgnHFxtRvMAJIVMQfrniUXPCWXaUozTBWZJDMZfcMHQIPOYXhadDzqPz",
	};
	return kdCQmjibpFNvrmti;
}

- (nonnull UIImage *)TZMqctJncNbnnVQEv :(nonnull NSString *)xoKFuOoxOrbdn {
	NSData *kUBWJzkTPFqJ = [@"ggPFENSZTRFQhKNFMIrDHjUqSRtkSktfWXhfnjBUtevoQWwcRzkqOfGoiblayPLvoYatrXcuKovOdsqGajiiSkPklKSaKzJaylnosyNngYxSyoF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VCuBBzoaiKRzyIAjt = [UIImage imageWithData:kUBWJzkTPFqJ];
	VCuBBzoaiKRzyIAjt = [UIImage imageNamed:@"eMxNcioXFlIwiapVezBDrIexDANYHNtLNIsbGzAUpdpcKZWgufyExvTslDCufSBzXMPTOjffWBoNkPPTVrwmuqtFZBFUjrOhbcERpNYDTJ"];
	return VCuBBzoaiKRzyIAjt;
}

+ (nonnull NSData *)XUMrdcVAkwyITa :(nonnull UIImage *)zUDtPtqynkwzcfl {
	NSData *ksNOoBausLfylnoQz = [@"TfyZRehmFayjKkNgpNwUMeoGPtFWMHkGuhhebtKbfxitCEJnwDXRItqXdogTedszyWdEnPyuGkKcERwgzmOZcDMSGUsCCgkyRikqXjTaGIeykflEbmAohsWSLuRMwlxmxOmRgBkqlihgo" dataUsingEncoding:NSUTF8StringEncoding];
	return ksNOoBausLfylnoQz;
}

- (nonnull NSData *)NijvLNeTenIXieub :(nonnull NSDictionary *)diHpWLNTSp :(nonnull NSString *)nhSvklFlIoNiO {
	NSData *roqYLrFuesYOgYJCuFs = [@"xbDEvENkYvgUHHTznRcMyNvjepKcNWRmljRgQQLYowZbREBlALDvRaTAWoQMXmcsBUunEZHRIMwuEnUyXYsIMrsccaWZHXPafpOcCsChOsnNatRCJQMH" dataUsingEncoding:NSUTF8StringEncoding];
	return roqYLrFuesYOgYJCuFs;
}

+ (nonnull NSData *)oRLgKvCJhKUOh :(nonnull NSArray *)XNynkafQNlCDpbeMm :(nonnull NSString *)CHIAyhQDoHoUUqwQSBH :(nonnull NSString *)sWTlcEYFHrEDyQatdut {
	NSData *dvIyCEkRuQMqRwnH = [@"inGjHQgHBDwUBbdyWEBeDyfOryGPnJbouCHxAqSLsAKdFGabWypXQnrhXsyEKCIQwnGWLJDeAjShJfAxUNDKIcyGvLpeKgAFJdLwEzxTWeBtpkEmbMvxXWVcaerIUg" dataUsingEncoding:NSUTF8StringEncoding];
	return dvIyCEkRuQMqRwnH;
}

- (nonnull UIImage *)YpEwleSToFrRJA :(nonnull NSArray *)MBvGzifBaRKkYYL :(nonnull NSArray *)lQnUAcWqUaOCMj {
	NSData *RjvMdbeelHwJ = [@"HLOKeiRRjcvcETclzFLWaTiLZoWGLkXynicsNXsdXBDKXeOzslrOdPLyETreqOLPslncfuIOpctzGUaJiYGZuZInBCOlOpBdsqquLfGyhsEgBpiUYZNOnBLyRXMBGejxTPyPrm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zdQsessyBo = [UIImage imageWithData:RjvMdbeelHwJ];
	zdQsessyBo = [UIImage imageNamed:@"NbGksvTVFxjPYOuIKgpxUzAXqdfMWQZDPcNbGlARXjhphKgdySzBHJGMMJLGRDsZOTzigQXjtpGGxJjXepEMRagmLOuYjtHThbeJaVxEnKDtgCGJm"];
	return zdQsessyBo;
}

- (nonnull NSData *)rYSZhdePsJB :(nonnull NSArray *)ksuBgJRVaIm {
	NSData *qXioZYxjciX = [@"dvjUwjFHvWKKhqdrJkFDnMIGHWyTGZBznHsbrerExqTsnZmGEoBBwWklOOsJcNqihOOWgmoJqKhaYdyQEzZRcfLCVXvSXcySuruXGymmTKfxlJzyKbASljdRPVSeZcoMiqxfIlKYcTbJJWqkOg" dataUsingEncoding:NSUTF8StringEncoding];
	return qXioZYxjciX;
}

+ (nonnull NSArray *)ECrINpdUTeSO :(nonnull NSDictionary *)euRSlVQwYBSYyYzxfj :(nonnull NSData *)AIJcGXBrfJbbrrr :(nonnull NSData *)ImiWxVclaTmSpo {
	NSArray *dESRaqGPNU = @[
		@"lXHVSJqSFlcpyBCgmQmVQKScEbbmoeRiJoQfqfyPJDiXGZglfSdowuvSOahHGAjNgMjUZOPNbMRXAjNVpygzDSpanyWzIaTBntoXbEFbWihCzVabjQbZOImJTVaZaxstHVMoJzwZqD",
		@"MwJtFmfjAwybskcHbhIvJEGNouqjQnOuUSzQPZoeApFncFGPvbRIkoZSnmEgKkPZmQiiSRLEPWgIBhCIlRzGqxVRenjIsbDchXtbsvypJ",
		@"WMyZXOVOOuZyaSyXmBHLrrjwzvLNXFTPUlguHguCquqBjKqrOfQSHsvpbsbsdrvbPwTVqcxgoXrqnCAbOtADUjcpLNMHEVKwKoTWcjVU",
		@"nTTIpSOoXPaEQOOzKBrRgMhyPIedwdJnfvsiuvvyuRAQRYoGJPGfcCyvQbuZSNsvmbLxVLwqhyOAfdbbrYUPGAJFZjENqbcMnHzaIpScAPLa",
		@"vKrVAfLRzdYCmjzfeSHEibOtpwcEDaewNcUlGULInJagPfrXCuDzmQMNsHuuQuEDkhhQIktBwPdPMsGLElJYJLqTgiesmRAhpUEdFRUwthOOhRtgrcSXPQOmaPocDhikMaQCwmX",
		@"ELWpwIAqcpOssQkGkQQfZaxtIWlPqEYDYAfERXclQBbWZNlcRtwgQCBRLQsWeCJYiUfvPNMksjKEDXIaaPanDfbZmNUBbmhcqNxs",
		@"vcbfeuXAquGeahjwZKYbFaqWdoVDkVQqmeAlCxpWSdDAgAehCrqICCbGWAzFYWMnothmfglfHGkLhWufqtUqMyjeQznpuUMbtOcNdGAFYmjdPercwmAMyt",
		@"csZEqOoAkTQcRFVebmUtqTSPtkUCgJMQDJtCFjGHJUccxkNdVsnhvRLPzdyDBOFUmApIWmEPHCLYMONmwgXunHwhVqXJeOzgJGzMUrVwmpVYKIBOyOerziIuCYFIYOWpPPgYAjc",
		@"TpifpDWYDMRDZkkhBhlteooMLxNEasHINyVijERIHGfZgiqNPGbXSPjEDbDwPyaVFoLiRgdZllobsUYnOlNBEgHyHBSIqtYbGpRNGQlYknDrnafsrEdnrEEKIMbakRT",
		@"yIdbdIbNiEfJLIjbsHijjigkhTSXHFWvfiKDGTAivUHZaiwywokURVMhcTqGucYLbNzRgtEphgpOVgYidJbrPLDXhPOSpclGOgZSHOGOckCPXfSsTz",
		@"OwWptMjWxhkgJxkWmWpNTyswytmjQymKMKdbobWmiWqlOJlZufVZOccRxzVtOcmKTPGaOBrqGTPVXDEUBMFZXEraPmUiSCByRUADPPNCgaesPsUHU",
		@"IHwvVMFieEIYWQeuscnTEdGLOJHjJVMhpJYQSoUWiCdSqSnFNyzTrKYnDVZnWDciHZQJZnRhJAJCrlZNARsxJXeEhMLGvoioWqrovNxUmjmlsNtiahpZDxwOEFcoYe",
		@"TzdpcQOLFYLVtZCcvezFFNakKSFmaCzBHBvIYxKsodbeTZdlZSLcQurjgKApWiqhXMESLfcmPKPIyFpPZgrGbmyLSDXgQaAJFTegotIIHuPekDLcffZJyQG",
		@"EHOFWQGfInIoKrvNjtxkGkolOdkaiBtxZpepIAcKlgDypgUjbZuiPZPkHlEsuRkTKxvTPgibVKmMCppgBQpiFuBrVpoyVCVtjhXWetbuNNOwefJFRzw",
		@"NdQHPskrJcvmpcGlNMIducpKQTzmgpWjRRbNCpCxjgEeCMqPAAqliWAnpYWGQKGqPavvOOaltUhnduhqTcrCzoOTnUBuvjXyyfEqIGblzddZVZQwUFKhBhBJqimebb",
	];
	return dESRaqGPNU;
}

- (nonnull UIImage *)vstdgKPITIbhMO :(nonnull NSArray *)XedUEmtumtqLNPurA :(nonnull UIImage *)QNPurXmvVS {
	NSData *lXdrbNHidR = [@"wNOVjdSAkAtRnsuUQzDKdRYYOrSDgGCDAxrAgrCtNgARugkTUQCYRfTCjBMVPPVIPRYMrZaWopFbQhASbUahSNoAkCZEHwwJGkxifeAqqfpjvBWADMBqwYhJxSFAf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yFtHGUTlbRKtLx = [UIImage imageWithData:lXdrbNHidR];
	yFtHGUTlbRKtLx = [UIImage imageNamed:@"FWwKBvMxpmImivJAzTnsFqCdiqIyTRboGxrWlnPUFfrkAxoNiVkcPUPyAytjbGXslmIWcDDbEYskOyiSPeMpBOppyKDFsbLKRoFyOMAhGaaRCvWqIEQBCkofAwiQCYSqyQVBNTaErmDRQrxOTOOIz"];
	return yFtHGUTlbRKtLx;
}

- (nonnull NSString *)OeGZYeYWSJOuv :(nonnull NSDictionary *)QpaSzIOOZuooob {
	NSString *afFmrGbvTQT = @"yXFhCLLXjNuWJmNeAXYhMaprhsnwIZrtUaoGdMZjpOYYjofImZOlxZCiBNqxJRdyDdThlVzlReTHQZUsmUwOnVsBxIZIgzVuHoASUtPTLSpBJnKsPLdcBpew";
	return afFmrGbvTQT;
}

- (nonnull NSDictionary *)pCCtKXXsiznubqR :(nonnull NSString *)gnqKvxBmTkTpnf :(nonnull NSData *)FnCLEFqWwDdfy {
	NSDictionary *AehozOdTWWWHVwJImt = @{
		@"vxonKijUuWShhrz": @"JIhyFrPcoiQkRBVEFpybvEFGJAjYGCLazoMdhCrJOMoJJoacNsCpFEhFHqloCYTmHSUWoRQswLBFQJxYTVxErXQCWggNZKXxnloZqvKgwYQNbOaJfHZmblelWDVmtse",
		@"IskdkiAKjtFKMhYkUuq": @"cGPUzxBWzEYaAEFVKfIRaQPCSqktsdVEPHIbRfCKQkNILJwiJrhdlDaqbfKQShxQSojvVfkGsJpmlnTvHiDIjZTduPZElZqYmbwxYiswWBSdcyntehK",
		@"bMGfsCquZHWD": @"SisEiADEMaXKwnVFoizTUKQCxxhkXVAxHXsQypvdsZnjkaHViDeylxoCKHFNYCJanwojNNYowtrkamfvqobhXpoFZoEvnTmxsfyuAKGmVZlYmlWkxjtnsICPPfTOCUcMp",
		@"WtdoXNOHEVjGigtQi": @"ZiXRyyfhPBkDnoxEmhOKrovPYRCpEUtqxPztBObeHvWZRrReREqGMNXqKeIoWwgxBfqzMeiyNJIpAmKPchoxJpSJZTdQyuPcPqvLGOOVLVBWVpzVQKaBAGjcUN",
		@"TvSXLtPsYvW": @"VgbruEMdmXVYiwzotDwcqkVCdhTyEEQlWistkAkwQUFgYaYkfcUptgvKkdDQxDNEKKnqPFjdNmXySjdNErBKPiYreinkTfhEicsWlXtFoQNMLaaAEvupRbbQSHgMhUNUfalIVgjrwknSJZ",
		@"rHvuWUJyWglFWApee": @"pWTAxWycHjuBlcbtZFbkMrEaLostqexNyjFxemBPELwRRjfVMKdXHsFtVHPDkVnGELfUQuibNSyvxqrHIZJJmXHZrnSzbZrdsBWagkVGNXKuilWScChoFebSuVgRzyrzolXoQp",
		@"UeduKRwpnnVxMI": @"joyVxldSqAlYsZPFziQCbLkOfwYwnRYaHYReMnbpsrXHMIAxfYFeZUWQAvTmZInXFJvSccKKzqRyGdVGmezWEaCFAMVWtPVEXHGQKAOT",
		@"RlqGmIItnqCnJTjNnz": @"xSpfanKvkLmiExurmEBBOuqRArvijUBcJMOkpldCEaXnuXOgyOoibrJfFxEcjJWiwbhjbZeSqwklMaJaZXZIIZpcMPNGPpJsBJsHAarYWsCHN",
		@"NskTqxUBgNgpwt": @"NjYGEWWMCvdJCKeIhuoeGwaXcIFwnjSkOIpvfOocFNzYcvbrMnkwpiRIIjVXAPvBxMdWJGgCuKvyBXvawtvwYaDwCZXUQMnSgZqOOALVKyPikIQyNBYCzoDThliomQwfjVNWcszTCHWtHd",
		@"SWfKTgpUxWNOk": @"EwcZmlalAaKsprHURhopnXbIqsRlpwNTWqtuKwCPnsXsVWrMzQytixdSDkcrIqhdfOwAjKzvXeDPiSoaOnolMIDflEKEjTiKcwvYhJmMQJnh",
		@"vlCYpRXfCdKZ": @"EHLPXORoTYvbrHygeViyLYsTGVMlHkpQXViQeenQeOyRYGaPwZTiaaGIpCXpTjioxyocICfFhEdMXOPuSZKXrrreySxXhedVkdMRCdgOZKvvnjBcmeSCdBytLTQASSMFLq",
	};
	return AehozOdTWWWHVwJImt;
}

- (nonnull NSArray *)USepgJRxwIpPRROWbxM :(nonnull NSString *)ovyznVCsqKadMYBIjIy {
	NSArray *dcwhFdifzwDiK = @[
		@"ZHXTLfLTgqIMoZPpiwhlkylRvBDtzbflaqVIVFcPCwByhydNTTpglPQfXskeNeJtEPmKwvICsuFeWpHluCfnLhvPJaPmsRRYZyqjJUGEsdtQHnusztFwimOeSnAoe",
		@"OtKfmgqIgWPiyUMUbLHUJmXPQNSfHlumNDtauLQLjBSLjNQDDRKIheWsmILZLqgPnJIKKlIPoTrTLNPLKkJAwvgZXEMSlPPcXjKHltcndDYHI",
		@"JotsheOepvZmriTWCViGdoUTCsHXARcGCCogIXwCpdrrVVXjTCXZWrUDyzgcbTEpvoVFYIGntSzvwaCOokdDlNaCMmeMhPtDsKWIkHOsouohdLkDRtPnciUAfwICEwdiyhuhRAKmeLYtxNgQdKKzh",
		@"nhzfgEpZhURbDYtoMWdoYKnufZThxRumCvxvpepvHGlpYJYDwhuqyMJwIRoZXDvURJoBmrdqmqseQkMsInQfZgjqGMEJnnHqYPwVIZGoFTsIcImWXtTtZhZBPOJityaocczx",
		@"jUxZxCFASPrFLnOWIIlsMlNTxkOwTypqSDWEnaIniaORikfoKJkasnmCfgDwoIZFUczRSphAKvwZiuzfZEyVMCONtPRfIvaMcHgQnzO",
		@"NYyBxswYONQYrboEZuUYrgdZRJZfOJTPklXpoINgxGwNcfGHfwUymjsGLSkakdhHRYjcKSxUVayFpTpMpIQiyXwIiFmEQUKWFTOQKwYnRyPjjcFVykhjIxUlrJ",
		@"OgByLludVElOGWGOLPtSnOCReyJeqKyHeRzIfDipftUHEDCYUYXzhiTKIMrKRdIjOUjKWSxmPdwvHpGJycAarigOwTLzlqgqlpfDGqoVXFHfQWckrAtpTKIlqLkmyvkHhwfDtAJrVmuywFiaMA",
		@"NmcdULMPRPrNDoUfDFovUdANxCuEmwqhpkSZczwYWsIvfSnDotWcskRsEQfaYbAEtFqXpjNYoJUZvaQOoCwNtihZMnEmXfkiXYiZJSWWFOYFnzhOPhjggfyHINZSeYsFKlHHNfCMb",
		@"SSxOUsePfAFuTIAwaXySXKeVzpnxdQGcedNyJqsumvBkseGBLjOwUBKGifxuwxSQPcXkqopnVAVQemIyDbxuRDyIANNtlGaRGQEpiDdfzOMNPLwLaSbCoQzqJeKhwNuQnejRiCSrKb",
		@"PBIcKdzIYWNYhnXSwLLsnCVOdwvsRPvSYhpXJFuiUToxOmIVEIFbfjZYObCgSjZddDkzWUOVqbVCplABBTJZhQUVfINlNmkiJIpIETzMMDILcBJbcYpq",
		@"aoVsEugnZLYKAuAImbksjcUHbXPQbMhbTbDokAsWYdbPZBYnnHssaGlFLpzNlevWEEwJltReAbzpqnsIXuybBoDbKNwCAjNAhLUexrCEZwOUQzwsEecPHqeMnpGtQxPVIxjrcLmRLwXAuZeTlIGC",
		@"ZHPWWcWTuknjkcIHDijaxXhXObXuMFWBcCvogRRHNVhQLXNhbtnPpIAZeePEZVVKugPtGnzoNVgdnYaozaRvQeieKnTrUieuxeqsL",
		@"tiMSIBNySWKWAFqnoZbuNJCOULVvmGUOXmlHEvPEwGxzmrZPTyLsFJVKCuczzbBdExjlJJautzlmTmIyNEvaQtrRdcYHcqGjcVBHExoBWQydkhZRJlFHjQ",
	];
	return dcwhFdifzwDiK;
}

- (nonnull NSString *)mGWDjgINfRi :(nonnull NSString *)gYaMZXdLxpT :(nonnull NSData *)AKPwbNVEHSywNRU :(nonnull NSData *)OXbImeVVcDUQ {
	NSString *qYkhwrwflXyjK = @"gRWUryLPCHSVhNOQgAGZxXvqmmHOwPAnJuPTUlQdIsljoAGdHVcyTEmzEyLCMGhetKrsBzRHpzHQqqhLtZRaIeTOtHyWpLjVDxifOfRuyZuLYBIKacYwQVKy";
	return qYkhwrwflXyjK;
}

+ (nonnull NSDictionary *)QXZLOjobjwW :(nonnull NSString *)rtACGJqjkEUE {
	NSDictionary *UzppbUcBZzUGlIt = @{
		@"xcoipwihFJePpCdhj": @"xlyFSYVsSbiqdySGzFhhRYjPgmhuHXUhExTbArQHqukvdpwiioLiQqAOAPXsuvGaxPINnHsABxGWIctUiUXAWRHiEnNPSYZPAVklJARElrpYuXuRPeZpflJuSjzqrgAyVIJfj",
		@"JpICfAkYEkKpmCrLCFh": @"eqDgyKwzHIYGRYFodNBuRlfQbhgdZctVvITPkSHWeuoWPMZJJPqOttjhFeoEbmGCZDVojMIIJvehvdbDGuItvFeGBeioVxOZHEaCSUFQfBFJZGRFCOuXKAWgxZXWmxLsFcbdzylnOD",
		@"IBfTAVhgVg": @"ifviemNBpizgqUolsnbfPgAwEWFYOcMObBLdeordMgKxcTEwLcVKKgCMpkSAxLlHxONyBZIXTTHaHqoPVtKEUcNQyuCxtaUVJNuzBzJEWNXNvktBGTSKhdkKqhpsrBjnPAohvG",
		@"tQJvyXlaQY": @"NDGdGrDjXGfXWDDYlXemReJiPepIucRdZOamkizCLWHvJRzycyuTMPiKEDccDAgBMDqZanNUfuguvEyCthbWKGeHiKxLsjtGARScAzmcRAxkmyRqZhmULjGcnnenvdroJQRnOABontMatbKHm",
		@"mAqEfNcOOWY": @"VRHUtbSMcctfkcJwTBomfPxbsqIXaEOxOjlPYPgORjunbYuXGJfzGyuxSXlnbROlLNggeNaPprmWIwiCpBidOHMqKtmYSfZyAemLjvuzkYUoFlzeVXUHidlyDiaYXMgDIlmbjpEKVhVC",
		@"KwDngvpfOBWITNmmVG": @"oWbjifTueATSmbqcpuOXlxBzHJLIjxosXKHldrATjDGshgAOXecWEbjALwvCrPSqTrzFeuOqpufddaoWnJwSRMOqqBzLFtaDlVhvVfWwfpIwAVylimYQalljSqYJqtPVkRfnNRClhSgmNeCz",
		@"PHUJuublpcYhW": @"qKBEwYBUQFfCggFHMeVekJsEXVQHjCAAVkxfSNofeHlekqrQdOuMleVyHtwoKqJOdJyIjIVgfviYuDinprgETGnROowUeOvHffFXkYYJuvWWUPadWTGgoThCdKpUnKqYXszEoNQ",
		@"EcClctQXlLfPUFUgHW": @"lYofuUDqFDdqQVBHbljTfmGuYOvYqwYZZiIPXugcnRSqZLHbgWWKYacirXQNvfOuPTHFrrkXeGUsHFmEfkBpJDwDLAdQZllgHBYceryzDfPiKqtYxVtvAHAZPWXZpTDuqNhSdancUpgdpZxoSjGDj",
		@"oFxmtZBnPO": @"nkTnlDbDImYzqcUGgYRIUZNTYqbXFDiXkevIGAClDVgWMaGSLLpoetGiKAQCBTuFWsVInMFykWOrdRUlvQSIegZPorWWPoxwDrEVnhwmGtzIBuYqilvCeqGtmduuASGIHzRUrkFfuXW",
		@"oOrYHhBCxvap": @"edZWAMgISJdCjrGzcgMffZXrQuTPsRqLKYNWWKVpnCHqFvZjuZFiFmKjKFrEznbKvPWYuvBFeWcBPqkwbmDjWepgRAOIdxcwDylmJdPEGZxJzrsPncvXKTkYcMxTQAooucAEFvCHKNkWGgkH",
		@"imHrLKCigSlg": @"zvYsvKsMwHTWdXwxJLSJqovvPYpVfkfbwVLTVzjOHftkPeIxzJAhVldQIsxHsdpgeMyHCwSnHVvdNUhDtapzghOtGHVkfQLZSIaWSWjJObUWcdBxNBWYtkfCidZzh",
		@"ymZRkgCQgnZjHCF": @"MrWraUjadieRvHlAkokvKcLsVaKBjJzsXbXwgwDWjpzsHNUytTaXfPIsHFtBYNxGSpVHBpLIzAYwvKWRYeKbvxizsHhZHcFCuZiqQUUxiIpdVzBCKPwtFsUGhiXJtod",
		@"WHSuBvFhynAElBH": @"hGmcXEpJHKBsEjHydZIesyxvQuospjXlUXDnAKjHWhaKxiKpAZLiUylIVxGWQNEFCkYLDiBbvVdMLvEbrUzjJUzUNQnorIVzFjceAKSyFIhd",
		@"dLIFuWFnwsvLFOE": @"LhLdUsdebSnDjZGagXStmwUPfuXVytamKlsTctOLDfZVEApKvnpWUEKoIjuDjuzgoyZIaXYjoiaIbRnYPYWxibVTAHlpcsYkKayKRciGeGSmpuGqUCTJvcYGgYaQQGGInGGHIPvq",
		@"eMeNbgFIZftoJxOJu": @"LpAKuRHXtfaGFPKRUqqGwuEFZbeielPKePiFgNvLfzZlNgITDEbIFNvyKnUKOTzjyIbSFnnqCeoGomgfmbXlUdTAydHAeRBaTljPyejNqzCzzDWCdYiqvuMmMmJhBvSaEzTWhHEvQgypN",
		@"BUwkdKdzisNZxj": @"lNpnEHMzyuGdiYjWDhvAnFaLbIlNzqMyremIRIVVkCrzfXahgCBcEKezYKBKdBjjFBunFIMxzFShjAShHyRSHFpKuDBGDEPBXYPQpJVjTxPVLoUjaU",
		@"EBCxPCJKwEKMvDRIV": @"lFbBKSxkCqgyDChyIlUxmczEamCPcDkZRLeEhqBviAgvAuSiWxeXzWRtHLeLnXYmWCDetWzOTNDlDczesNByUeTsiRpahGySBJEJltdDFGgU",
		@"WtpYCCtzlXsfI": @"PmZKswiexMFvqSRVGZKsIFXvwvmYmGYMLNyIrkdDWurAwCNuLWqAYrhIirpXOXTxkpjWyeovmpuFZtWpifCHPcvxbLClKMWJXJwBynLqRcxYdMBVgPtyQcFXRxigyXpfIIW",
	};
	return UzppbUcBZzUGlIt;
}

- (nonnull NSDictionary *)DZUHQQmRYkeCjzrpW :(nonnull NSDictionary *)hNaPATGohWEDbtfukB :(nonnull NSDictionary *)goqxfUTnhHbvTWJ {
	NSDictionary *GClzzZHgjUVRfuJLzMG = @{
		@"alvFutvIceZbmXWbD": @"OzhVGBrEKCLTTazqBVGhRDYWGniBPoLcguHvhxXLcxsvwJBOHugTWiOOWugyNqkmLUJDoCjeyEcqDHQlaBQXsQPcCyEnghUyZwhYqQmDqKFvHZhIKrvyBZtwxRUFViVzNPw",
		@"FPQSUBKPbyrqzrECsWG": @"PudugCwxzqhCmqzuNXDknTnOpcQtDyoWcRactFVGGRUpDdbevIfVZpHsHaRzKYbROrtCDernKPjdouAzDJXfwzbfjDuocPaKxGbvQtfqDEEATKyl",
		@"bhGalCivQo": @"qUsNRfVkWOHwbxeAVvBUeAiJJxhpkBAHjBhXkUFOhWrGXwNHOdhzNqWJfivRIrUNkovhiDMOmAstkvViudToEqegSRXCVsmrrMKejFTiETTLrGMkNMivetIadHPGGxExaXxQqCpKEgPVRNA",
		@"yyDEKRFQJvlYwb": @"FVamKzGpVTEmDMHiIhGZAmXyMklOTvlealvmtlZMrRruuJjMeDYgQbqzjapIGZEfmwsuujIRNWJYwRogZUZflCyJImodENrsCThVUwjSiAufaleieqAVwSMmMiYgblXjAZmECeFIeOeJYuVfm",
		@"IopItQcJQvWt": @"utcSeKAOmNuzCwsWfyNiMyPWlsilELTZpPCYYDDpTxxEfwUizaigwZUcVvFcHTKfgIwauvGJAedflefYKmIlhkRTdDbzgUNZPEGOBpcEpZLckJzMdFLJFEdTVHhTSgmpyRPe",
		@"GakwKcSpJYfwW": @"ORwfMUHwjjlpvELWPeXJMbAvJlTUPXpuAYFvLcXJZobzCvKUewybLqOfoaKzFqqvPoZCNWqYFJTZBOQenoztSOMaPvqwMNStwOifWMlYtxjrUCagxHLSqiBSvFxPjeGdbjAdXLThjXjLRFAdQXvkQ",
		@"IItFqlmVaRXZ": @"EbOVPFLkngVBoOyugDWdTWwiuWfALgRmPQpZGqqpRQWZoofvGVEeTWxaZdITtqSRoYpREYQkGpVRnYOffftmirZrEagJGiJgMTYHJWTtalNCuzYSxwqpnrPcQCUEcAmKjQTmAES",
		@"SSOQSvPAVVnnRohXT": @"geTUNycFELBNoqyrJvVWdEPcJqsFjwHqMCEDVUyeJVYSZwpbJJBbtPHUxlYjzPUTiooQzBaCfIKtLPwVcwyzdKevwLNfZnlpSMZICPyFUxUURfBlWliiehQUG",
		@"VJChTBKiYIkiGrDZd": @"MElSUgFmBagYcwUiRAMCtYslWFlbmVzgbnrFOSYuOoIVUeZnoBxidqLnQiCNPnYbblmCTyKKYBwQADHfzlfjHQkxWKVJEPVVwuWTvfuzstcEmvulaAVhvhlCcNtfcWzdXYS",
		@"CBseuStKbQKjMbfCPX": @"nhmylgbdJPdZVvfVTjqiQOZjYLScgWHdwbWaRffbWYAJDeuEKwXGpOklbMuuEAVGeeNCOEMTobzsrZXspufmEScItTsLbwySwGCpHxMIHnslgsEZOekewxYYhLGvHJvfbKh",
		@"NndDtxzWQX": @"RymzBXlgUoPXdrylpcTNnlXmWaJiOUgsGBOMJkrqPXzpBATcYDmxYYytjqDCgKBdxbZisSuALKdsWuSqaIdkGgBnMBGXnVZPSASbSVFgyQkThMQYMlmXDoWwyoHGfQYDjuwXaZSQk",
		@"zLBPHEzqxiT": @"vEEbLEghaJeWXZfzVnQYiEBINiuXiZamCdTrgkBTpEoMxGNctfIzUrPTBlZfmqPAJcKtZbUCbIFYUdzgRveCPFRsVcmZsfVyOaWNSncdvwMseKjHjGpjvIQfNqBtXAxFfrBMrU",
		@"INpUtAKLKmswUuLHVik": @"FQUCEYTSbAsJDkDRxlcVSNTHutdBQrfddGWlyTmFMcMjTZOFlZfijwHHqgOPvAhsOIOUlYjWAJcahOgVLblxqFanyIINtqcqVgFGdu",
		@"jPuChExYuLRACXXVAi": @"oDscpTYQfQSAfCVCDDohFnECDlqupiVtpvjsUlqZZzrpOsFLTdLTZLqCovEJkExnmsklzZqIIHUwhIIEamwbhFUjWFEpZyepqNcASliaubhwAIYrEi",
	};
	return GClzzZHgjUVRfuJLzMG;
}

- (nonnull NSArray *)xVWQefgChyQrPFsiOe :(nonnull NSData *)AWalVgfjdfLft {
	NSArray *JCLPceJLbQaYGu = @[
		@"HmeETqcXQshkaYrbrkteBZqeHXYITynnDkGpYWlbCKsMxRaBoUfYIlPiQFCvwYlrzUJbIuVQtcgimJiZjmvFGETVpmznMYXiZSnOaTYRLwvgFlEdwGPtesGBFL",
		@"BEizbGwEnrKSCGbiHaoNPwEuIOXlvoTgpfawQXRFmYyJYSYfHGehvupOBxpqGjGkfoCRoRFYYhOVukxDfxYrOoxPWBhAJTPRiUEJfABcQRHgjeGbJLFtPyssoYyL",
		@"ezMzWOcjRrxBxfdLiMPRGhJbOvuSgZSiETLhzlHSmeumGmDPKtCnEyOwafSEOjQTXzvGkTtQtrVtnOleVZreZQLhvMrssFieLxMJFFfuSPmsDrhiFmbByICmxIGQkuVbFldjESnykHoflUUKxjh",
		@"diRYMXQYwgbkXevTJEbtKQNLnzdVtvuSACsWNRwBooXptjOwfoBcSUQFBKEtpMgCAVgWxPIxxllCxCsSYhJfTxQeHcacysaLCVVRnCAHEzQpoblkTWZWiBbWDkSVij",
		@"efvmpgHJoKBPILCdXRURtEWGhKbmXiEIVtGWQtErBGCftTSoKKKyYRVjSmctIlmqOKVDZBHQCdzFoTUSLRgjzinDccvIHekjhCLBjWXxtcLMVkut",
		@"wyGQmZOYuCMjlvpGKsKxkefhzQcbANXHiOficyNrKgqyjfDfjZCHnwOBzKfCrLPApqOznmNAdHTZpvRsKJStOOviwaVVKezLdwOSfzXrwIOVeJWBeBNe",
		@"hQgQszwVJTgsZVGhbbLJJVfYUuXISMUtdJtRtwlWrVqBRyOdgClxvQpDsmOanVkaouYHzYjafwxNlgOZarBTrfBWUQVENpHlDYYMvmsfJXKngWzzTgUklTcd",
		@"MsBvzgnEjRKVwiKwczlemKFNrpgykRhCpshjYFTPkVNvFFNFKLfTPQClvzBKLzpijMYyHSxDDwMPrlyBPVyvimBhtkxLTdspFZmTRdizfDbEQXfdwRlJKFUVlTM",
		@"DgWwXymflCGuyFMIAtcizJndvZuIHmpviwDOwZYtgUgJxLNPgYIrHfChDtQvEzbutcCcXCPPHxdETSwfdmDmazsrwduGqMfzRuaiRYKaPmHZLBHwXkhepWNGeqNe",
		@"YVCmSLqnkEIxRaGdsGlEXOhdercuZQWOJYjqxUniacDWolIDGguRThTyjXbrlbwlRatESDzmgPLxUCsvPSFotRohRiFTPOMDYBpmFyAwEEgBBBuzYkKBqOMzCXEoceXIdLWAUqPfTMhKLyW",
		@"WcvHqDtTEsCpVrvgdakoNETfSCjLGAMtCJzSvxuBnrjKssmueAbPXXtFsXytjKVkSkhCNHVrhsZinRIIanVbMykdicROwjSAdTwNXPdpBuoB",
		@"RmjlKMHCHFGsaBFxJRdCzclZChjvQVQYjWmFGzuudVyMTUAuTWLviFWZimEmQpZUXfIkTdBheacSkoqudJwFpgyCCRMInTLauZDMlGtiMuJVWkzUA",
	];
	return JCLPceJLbQaYGu;
}

+ (nonnull NSString *)gPRxTtSFvGJYYre :(nonnull NSString *)YGgMcwkcdgKX :(nonnull NSDictionary *)smbvUAEsgZxNXzLE {
	NSString *jPJOTwHOdQZUNWIqAvf = @"HzfopPNOnTlMWXhkhZWNOKRjkqAnbEotcWTfnZRJYVTVVWrRfqcfIkprjrbMnMAjocAlXlKIwAbCOlnmKSmDRLVqeUkpVGUovJXozcAlrxcDbqQaaOuRXfLqMHJvBDFywtzGwLCKmf";
	return jPJOTwHOdQZUNWIqAvf;
}

- (nonnull NSDictionary *)AfmCCCyxOTphU :(nonnull NSArray *)sLlrAhgVfsDVElgyRn :(nonnull UIImage *)rlJRuhFlmOf {
	NSDictionary *fmHdyYGewdOIqmhN = @{
		@"AWRegaALkYrJw": @"yesDADMCizdqywMTSexfKCohMpTjiiYCJwwOskuNRNAaDHilxPzNFyMOvakVCZxUAMynddQgFyrnZqcTkliToFohVuSrJEjlCvRM",
		@"jXUdrwHinImAGjflrp": @"JlykMQniZFsseSsNQDmxgqlTghMprlIAzQqmTWkHjalmmXXEXXoAvRplaSrXoQJdzRUGzhRPeONMAzPhybEezOtfuBWLTfgcqtXPMbSO",
		@"dJnFDzYJQmhWLqHaAV": @"VIApzLcweRlSYLlZSDITvjublLiOInpLNiCayHCUwkpIJlxcXfwNnYSYbfIstoZzqOBljodaumeukbipTfRHqaTMnvRPxgkgkyoEfKTkqRcNJDMGNupvGBfvgukAkkeKrIsfhKCWfkaQqTvTOQeLu",
		@"fhCyohEKHqsfRWAffXl": @"bJghDrbJBujDZqZfZtKqZiLwGLnBqoSYLWPThfRunxyecLMfNHuEcAsJETzXrRjjZfGUBkofBDvJTeqJayLqjGMWbWXKVfHsvtpnyBxy",
		@"JQrHhCBadd": @"zOxpEzDRgLMlFlkIhcWjlYmqCPZxdCGeTNBmhLwrgAvbfoOMZUBhlgBvPFNukwuIZhtWODCxZWQbKsiPcpLLwDuqVWzuQxFsiqeHNsCFalcWaUemyxYPBvSCzKOpPbWczK",
		@"xhtIlvgvsuOkNb": @"FjCtNgWRtDyFYdvtjhaRPueHBkzkwlVXdQzldezPvnpOtUtIzDIwRvKvxvlQmgQcduRFLWaFsQILyUXmUvheZXRrYCWxfGtJbrCCukrEIrIXVAkcgTJTZfWsOPNdkMOanDCBDtWGbmr",
		@"UCsUZaLuQyfNmkAKtS": @"VCwGakzZltgJWBXOCCDZVIkavgzBruBAeOUwxOHwxBgSsxjGMUDvByurvgTixwsEhZMxgsFCjxviLmEfrBkcfsoWONmmmHrnUtJbmJqKXddNKgYBerNkEmGGCtoGUbEk",
		@"FbEDHkrVuaenoDsVEA": @"szrEAluMbgEGWDLPBgnPdkZYeHlbmbtgCuwXmZoxVapwbDBtQYaDVlETpmAirxeYzZHkTfLdrElFnfOXcyusQNiyedRvOnYjmqjjSuXUeEgMDXJ",
		@"tPoKMYXTxqcKdYtfoeF": @"dTCpwJrQvICtMfVYVurADPFEglpieNLLAJXBmlubZhffURcgcflpadpsAJETpHpSGVNPfDiXWBlhPQpguOHwmXpeIQoophiJvjXqBWRUoqAQKNGcGhhfxautNWepVpyIsUxcwcGZiJjseoAOrAe",
		@"pwirxuOxNbzqlBXy": @"NDdAXPEazBRqyUdElVsjVExyTEuxaMpxqrTSbjBZrpXHysPTsbDDdhFPZQFajSEKZvODpRTtbRHZFBqfeWvEvLfLVSAqQOZxqiohLQedxTDkXQumNFhfBHEb",
		@"ToCUCegBzRxRoZFt": @"isPSzkjRSLuLYyVZkHSWKZaMbqSnbEaHzMrWOYpQkrNowDHEzVgbcCBKpVKlRUEvdOIPZNFKXPuCoiXgcbezYnNyZfEHCtFoPbhaAtnTlAWMAauStQlUoyOywdErWJyQgoEAtfzxEuK",
		@"YOtxDyyRgj": @"lvmLUIfiLlPELEetHPkFwCryCjVwMsLzlvhiuaxleiTEWhnAzZdRQHwuxEbIiSiHDUOMifVdktMiqkkAqnDtYmrRqhkRyZYXbAsvm",
		@"tQDHWuEwHAMuvTWySQq": @"DGWCkHDEFKfukUgerjmTqBqCgnosRobPXJXSBylUaFCTgRbAWXtQtySWnqEeXMxyQDoRUzTFagQYxyHfwXHsDovdlTFMCbyOsxIQFxTZjInmGPoYFGCzLYgKGXO",
		@"JoVxPwJEyxxFoMtx": @"VPwWUsoRGztFZPnJdBuCEzQSihSbGuOUdVCWdhECRkjOQdvGQqHpsiXDEnebPLdMUPuMvYXgXNRTZGKrVocdhowBjxayMDrjvJKUWbFJEUmTSDiDDUONvubgIhbGEIZedlKWafySbGDWAdkjF",
		@"fRfBuEVMdLpEOS": @"GgDhXDzppCEvNOLvGoKOLrIwoTiXQJneDtcqCZNtWMuhuCavhlcaQiRTuFCTuxfqbZBmubgOKSRIQNKBIVNnMRSNmqusUYnnGbEHgEg",
	};
	return fmHdyYGewdOIqmhN;
}

- (nonnull NSArray *)BTFyyKccbysjdpzsSY :(nonnull UIImage *)qaeJcPCTdJD {
	NSArray *YNcEouhQDGD = @[
		@"iTklBAWYGuCcZqycpKphkEpUfJOzVjEQWIhjfCFaMEFWqOyTfeCEzfuDhagExkKKkecWsOYYckqzdeaiWAlnkZZUuWrYeZLpevtERMVUuoYhhDQDrEZEDkivFDS",
		@"IMGQCpyJjxdWSUkmgycgSJTyfckBPsTNJiFBUWmMqYuUAULieTjvEiaNOHiwUfeCoCVgDYeAbroLyDNixCMQhFrmaPhKcuNgBzSWPUUQbNsnKrmdtxtLONsnKMZvrj",
		@"lDkZRllpHpojmRRxydXnrSnWLszzmKstgawBEKyYUgIVdtgUEvorizJbGVgklceUogmNSdMRiiUnwpYuPPggaVCZpASqDMFudhuQXKtDCTDVVpwaZffIbPhGIvKAgygotwInYeIZodDOODEz",
		@"ZjSpuKOoUdQjHFHuqKoIaETUbGUmhwExHEUsKEzgaaywAmJbdJfFTlWhaiiVhHPgVzcQyJjVWBdGzFRAarLAvOfSAbCdqAZDwHMsuOGjeczbPIXtFzUBegWQspkQPpIbvA",
		@"pCuHOjheTqjsAIkcdoexWtRUePJOSlyrHBTkBusrMLBvNpKfVrYXYncEiCYVchGbPepBGTocVBLrmkdCFjYhzcCEXRCsBolfkKedNRndDBowkbvvCpxHkclCf",
		@"lZhUJLWIgwsvGiEExUjsLBoyNEITinsoLOFvGrMyUcDKrkBPyzLszPFWviYnufdgBDcHBiLWLTTAcYsrItjRvTZCVmHwCJcrqMmOJeRjVymSmZoUIUsiaRkGNmuZdeUqKOdVIjePrOYVuXlXGJ",
		@"umtetnEbRwiixgHtVuEnkIdfOXjIKetSZUSVQNADDzHJbUXYnNeVDQScaqNuHUtjSKqXfsfjdWNcNHptlPjXzBSygBPvDSlLDUBokDbgQSkeVKcRHzTyeUYXlHhThzZdHSRocIuDJwiKjTfIHwzJ",
		@"IRdzgZaDJZVgSweCZRlfUpOtVScsRJuLWAMZdQHwItkCZQmvPlmDIlYsaFOfsOagtWSnhCqcwIOLUXXVhNJNXTpEtFYmbXnVzqqILTRkazmqyJHzRIdCBsKbgzMDmJdXLBRkEacpQJXSqNBSIu",
		@"duvnbMvnYVMkCVgLJJcymNhNxxLuMIsNFmpVpGGRVIeDswosyycLslKZTDZeqmJLptiHeWtdbEjzGMHXiynoIEfSTVcCsooazJcHwddVExpYjbspYBXEVfQwdOw",
		@"jKrgPVLrMWpgayksUGrRtGvZTDglxLPzXszYHqqgFcWeIcgtnsacvzTIfnMryinybEJKqaynuPKPwpSmMCQbixMlmVcTTUQvyidqzqSBMtyeTYr",
		@"bMPDBrFSnqswFJcCXFhjgdMhXzBYIYXQotHmEFPdIZvCvyQcwGnvPNqiAtEwcAzqGHKYopLSzQsKjNEeirLKXVXbSyQGWWrZCryPrctagdkZEY",
		@"TtkXetzmmYdxsCdJyPvfqbpEUbFhQmKCOXkCDLTaoVbgsLhxyFEkcMghWOGREhQJgoDptsugJVrwthyWyyJqkXbpUpPtdnqFHBbXGCAWyboCByUhJuqjUKgXxrsGaBtXoXRzQteREp",
		@"WJfbRTKVpxJltWBdqeYopxvQnFVxxVTrxByOLzmYBNaDEsxjSvJxyFwpgfPPHYgIPYlOjJhbfetmqLgwmisPVSblpmFGscjZraqSREoDKdSxGZifUXopVhxQUlBQsaJjtsNXI",
		@"VdDgUEizBtZcHaDuVQPwJDfNlnWPLQuHqvwQkGauRNRohxhncsVwdNLOkdfeSRJxEVwWAUffaawkvONHKzrHVQhiZmuiZdTkGAqAaIJVz",
	];
	return YNcEouhQDGD;
}

- (nonnull NSArray *)yjpdONpPuj :(nonnull UIImage *)SphsqXseDXBDuWc :(nonnull NSString *)wzRfiAQhPVxzpnEtV :(nonnull NSArray *)RnppTZUxPQwWlNI {
	NSArray *SgfTSpcUhAp = @[
		@"UUHRnZYQrlpDxFoawlEmCeVolldzocJtcIIrDdHSLFGRyBubhKATrjlNxUYOErPfKEcTWZCmBmfGQlEWwoRjwXslMfxjkPTmdcQFIwfVFGhuGLeIeWoSCbPotZkUuQrXqcH",
		@"eFwJrhuJErYYaDWVSVlbsqLYXddxcPBGgDXcSVOwKgnBfKQRNCEKpohEXGLaHQRkXRocRSRDzVxCXPUofrebXQaeMsCgbImUOTOyb",
		@"ltbhKaRqWZsokLZeiXrxhRKSXpnXzstHpgqkYGovnqeenFMgTSarPNODdLcnTWajVZHndIZbbMdYgxLJWIbSnirirqyUEaMPKtFANuggRMDeXZLINGdUofqasxyf",
		@"bttZcoTfUaspkLleuhLAfhxAkKGZiLEaCgQTsxIQgYxrcikZNYbBrEgQUgoFQTlniODqagvjGSWreRczDjSfSwIWlpvEAKqywdVZNaaatHqBZZtGtYyH",
		@"zVEUVJmFMuQaMsnvJgEyVtIFlliIPWbLwEsjrnABYsycTyImGZqJvVwbnWkjTtgUSqJFKwPeQwFCCKedMfPYJXCtLAJqZQDvdbNTxxQAyvRmNzOgQWRsMOofiTSuGVcUKvWqJBgx",
		@"ZsQIFowYOTMPabfUYBSMJAilNixrxZTNrfbOaGRvqMSlsLoLiMsodqaeuvRRCESGwDjccliNjrsFVVEbeImBTuuxhxJvzutPiHeAemLVFguGgtvzzrX",
		@"FUEopZoUmJmaHBVStXULLXNVrrKcFynYDEiRaRYqyhhoQykKcExrqYNqaUSMrHTOhepcrNJjzlVwhXwyzpeKKWuseczNiBXkEJJAHUJwqEzYRNsFDMLmyzekbY",
		@"zHFigEUFwcECIMgnNYreCfxnFOPIOvrJbzeIVsxAlGVXMdCxDlbscNmyRMMnLTBJJUgtyZaFAgIkQtIgCzKcJcGKFDymHghpQvLTIudoECiovE",
		@"IsZQdlKrXlyTJpXvlCuEAKbGhdrdOrdugesjdcbcxmSbQzbfocQQpzxQlErviUftWkDFhDKSbRuYsulmFGUnhdwHkhiBEayILucegYtA",
		@"CJQwwDcMLvfWQOoNXLgCkLdIoEoGmVCSMIynIYTgQaavNrKfTQsYhoksPLaiTrYSdlrDpapRuyExkKdcdTasxMXWEBPpUfbtiMqxAnpabdrEfLbQbWMif",
		@"orPOpLJErNMnQafpanesgtgLwugfMeAnjCLmdapCssXmIuFLSsQfKUSDiVgJqwGNMuPrFCVbrnTZHnvFdQAIKXbQNPDCCaMCKWIjdEVqCVSfkgVvNWaXLhIIcmOakIgeSXUOBwpYKiQlz",
		@"CHHUhYrTImNzajDICbmXSyhxDGVgQuqWZtHCRJfgDgBrOWJxHDLXOoRVXkvYSIJWwiApvfaHbpvEVtnxVMNtUlUSTSxtGvRxwHAjDrqkhBjuAgANLeTlJBGJDOmYWicGsH",
		@"dWGVufUquoSXhcDmjTZuDADafHhaNstzTXAFcSzijZJViEAfbNVNRtFiuUzFJrpuXHBlXTzhlCjXkmKBSAGsHeBixwbqAKpIbSWdjsEErNMCYXUZcXKhfUwWqBDDxV",
		@"jKHvAbtggutVeXIiafaHgmcVkcTOauuehDWERndFStmGMTGKdrUuLJOFYpgfjYLXJmscBqVLOSdOaodYDbhDriTyXWlUzwyLIPmiKrkdJnOoZbhrfclpVAuxNUevxUwIALJQdBOwl",
		@"dPvERwtbaYTzjumsaJZRVydkVTKLDLJpHAodpotVXqXkMEGFIPmGdOSMYsdPIQKQfNRMWRymAfJQIEpRhFqTXqxJtdKYhdjAcrDETNjLIKpfbxfUnKexMfVPrvqSJpBvKsdlhXthvJOZbflCuFYFg",
		@"gvVAwdpJyNGpEYyBummgoPPMhDPIvXhwnjoPqTKQzFfgJvwxrmCCNqeCGqsNTGTEQdYWByGLxSoFBJiToNsDlEAlonPLirdghQqjHjWDaQFRNJfQpEcqQCvuPXPexlhJHQC",
		@"AWnCUwQWcEEnfhXveCgIZVpNamxvuzHjSrgvyMzsvHCLfOgmvHauNpaukQIvEotoyFVyqYSfQBNfeOFkiLBnihMhmEsWFCOnydTiDokZnzmH",
	];
	return SgfTSpcUhAp;
}

+ (nonnull NSData *)AgLxqiqOWDEhDXCqQkJ :(nonnull NSDictionary *)VFsEajpAbeLGSU :(nonnull UIImage *)fODfpgRnvxCuxNPU :(nonnull UIImage *)GCKTZAGspUNUQdipQ {
	NSData *mQQWINDvkgBULdrlZi = [@"FGAWIkGXgbLusrSpmhDEXngBExGCsBVQFqbMvVwjVvvcRJXYnDGEAUAJUixlYvcTauDOgSdcywqVKOtZVvMJZyNBhZukeZwlCBCXHWLNJTUuMhMkIAQyuOQIdiQo" dataUsingEncoding:NSUTF8StringEncoding];
	return mQQWINDvkgBULdrlZi;
}

- (nonnull NSDictionary *)uQgeUSrYcAlhpeMXdT :(nonnull UIImage *)MnmPCFRSmFdSmb {
	NSDictionary *hlybMqgzrP = @{
		@"xvjCkXyPqKzeGmS": @"LZbBvYHtdWwVcvMclnArBjZxjCWqpNraOripsqBzjcCwPdtReGzyNHnIOQygbYsjaPUkvlsFHQKHkwqRNhvODTZyZjfmMrehjOPxxFfTXCIMcKNfEdiASaDClKXa",
		@"JlgtxkugrtfHrJG": @"DgYFGAStlvaPaldInjIExTbgtOQZPbdxiQAqMOCAATvWMHQUumzSgBwzZIfoEvlwBSGbsdduszZSYzfvmmWqWTRioyyFDdtbPsOrsiodbiQ",
		@"ietztnQwrGGwy": @"UggvsenWcPLVLMBCGLFHwLVQQRelnsKfFvtTWcMgCeKWZKSPLvuNdujKXPOhcWnsbgcfilhjcrtpQmqWMDYOZJfGocjxxOjRkqhdOmxoyrxVeDTZupPnQvlTs",
		@"FKwUaTfdHViJdCz": @"JaduWiwRNWKSsmPtHNwrCdILIpbYVaGZBAtFvnHXHhePmOmDKizxjXWJnndBVSJjFYPPAnjQKfWnEKIyXxUZvgFCDDQoFMyiOQRXQzYhrmzmwnqyfXIXHtokriFXbiCgRnBTwQeawYeaXW",
		@"JwxTbWeavxZ": @"bRYQFRhYzZoaxMpyoYKAVBvuZuwmCGPKBNYvqupYfvwSHjrRccqFegGjxTQdqsWnTJuYNkPocwEJLFtdlUHFVOfcrqKNSaNDfqftcjpvIpQMOMQzcuPZbh",
		@"NzNuPXdpgnWrmVwqyX": @"HazeadaXXfiANLeltkAbfLcHupTgMLgPEEouxdNtAzIreuPvWqaGIlIKfAhLJJUJYrMlqlYcCbKjInRDjczBiPxijSqLrmESSKDKbMyjRbvjXpwWCurXbZLSNdEqUsPdXTidIsxMjrfMkiqvLy",
		@"UqYVgvGqRTF": @"yQXqPzplgAuVefiEuuDoRXIwBoLPHAOetyiOxXhymTGbXvczSxpomtPMxCHWRSafTHLXPOolGCVRHmqCYlNfyejBDiTjwmTFTUtGsSpT",
		@"xrELfUOxlTtLY": @"iWTIjsOAyWhlBOlNGhgvmDDHNIvFLdaSOVRvJTHtsdziOYFdKMGShEZUQSscfGwYNsnizxJebLZpEflioIXQUwRdoDalfybrITykmnLLPFhnSyxVcPtrlGKloPXydBMvAaKFlLYEzvjswAgEXF",
		@"veloCuTTvjne": @"zxtdWjKKyOTeRhtgrlAvCXtoXgmJcuynqEvcJyYPvTcxZepWHtVMNshMrgdXrAHLitHuLLOxwGBDkUywTsPShUEwvlUyShnblzCndECgPRamqZDEWUMPEeehBHGgtlz",
		@"mnEHVsLwKvvjn": @"yWpwKjovqFfaBZtefvoyOpnLQGWaokLcWCwwvruTSUuwCiGPnzdtcOjbladlZsBUoQSpxTykcRYmUibgScAGkiGyZUAQLYlCHhgEhzp",
		@"DAGciafGcBDt": @"uAlaAnoqvZXdhkBhmloJGMdGjCqMZkFIDDAsXEdMZRxlCeuzRbcwtKUXPdeUwiaIlXLePLzvOevwyekXnCTzXPRdZwDRGfvfYVCSabHMaDzVucvyAnkTlcqiDJpBhllQNsTtln",
		@"xLsAuREIBkZKmSQQDEX": @"rdzDGfJfIKgHfZSHNodMLCqEIXlwDVHbSOjPHhIjQonBRtnuNYwEnvHEKotGfuiQUlbGJTivGkEUSDcfsLvAWxOXeGFdbUBHqBWtdzwnDRwbUTCFuCHgCsdw",
		@"hmOgtqTsUmAtHlPhwGu": @"vUfGkzwjkAlOJYoiNWETvDJaufCSmhXYikNXjKxdzSTfUKYODBjbRXNwKuldwLsXbRmEwwdebGXjxSBnSXtzJDxFoBEIBKEFYfRntCnODCUWjxOGLerFpFEYYGeRTgHjzjLRegBWasAdPyxt",
		@"uHOTpfeFUQRfM": @"PaRWGdvaKSFxeaGYnXJppSVyHxPhRFqyJyOnQvyLLOsHgQOeseayAKQIxHOSkICnIqnTEdoBFCszMzFELUVkOJsmPiiIbAuUiIPLGaEYUFBVxVyx",
		@"EGFDvkyKSrDpSzpzCV": @"EdRcirxlxJRrFyQxdZlnbVruivMVcKRwCpfJaMXfClxvzUacRSbWvhHyFQGLAzbDoUxHdbfHUIMpLHQuBVnwAbjnUjhyDWIOWumWbNbjzZCtP",
	};
	return hlybMqgzrP;
}

+ (nonnull NSDictionary *)kgnrqplnKdeBrFa :(nonnull UIImage *)hbHThtpilxTxtkDLN :(nonnull NSString *)GDDjuwRtqqWzf :(nonnull NSData *)nFfqtpDuxAWRQRGHRaC {
	NSDictionary *hUCihosgbfOXpLeBo = @{
		@"OCXlcEiREFCkj": @"moqLUmJGGfSEVNwoYgTZMCXHUQLeUADdlgvUbalPJwdpKSAKPYieohapdUjnVicUHvMJFCvdcwirwMMWFFoquludcLTJmlVQRpvfSkKaCfFIAJvcsAGuzZrQvyXNEhNSMAegqIgs",
		@"mUooNldNmzRmP": @"BHHdMnBreiUwwNhiwSEHgWZQmAayKGAVggOXnmtDPnDxnfGiVdCPeHFTDOtcAuNUvcuXndnEjBiAlDEwITJQdPGpNwQPmeBTuuzT",
		@"QlbxrjOZlGlKgVxCWb": @"EbfkgLofoOHHbVLZAzNUukpEZLLUzOFQMunzSzzzreZmNbMBaNdZreVzwYyGHwgZUPEnoYHsmxnQpglcWBmbgbHUtAxDHQlSNdDWdeIVMzGUpQwRTBFHAwhPFQPNjJupBPiSOXyYaqvgPngpEyRm",
		@"DyoLlVubabrKvnOX": @"RowZEKBRGUvzuVEbjzkghQAuAwrmPMYmxZMLIXcrakRZlwsSirOCYbjyktFzZpcSaTGfipADeRiRgnGsnwGYOuDrbWLqIUPxMKhoDVAsRYf",
		@"GKsTGUVTCnGiOTje": @"gjPecZeegpfShoegjRWTossDrofixFDtFNiZlpuBkyDiVrNcnDxIckdFtzRZRnxiWcUoRDplNDJuRMCrDYjuWfuuFRnKyLivErjBvobTQeeXRwsQpFyDLkEfUtxiQ",
		@"LjvUGnMbKnqqlsBG": @"XuKbuVWhjhlHGQiCKulXjVVQQPiIfzdtBrYXQxuwzawJcdKeuwKTaYTzEJrGOhletQmDMxxDemCUMzliyRdzotSihhvhiHtbmjAzsvYMybnKWfoeqRJHkpXMEwr",
		@"syVYhmozlCjvVPijs": @"vVXSHoisXcUWvmsWehjtjMoSncenOWmuyQtpSnilgoOQRpAwTybpEpcXGLJJnBnRQgjJJfhPIzfyvBtIPJzFubzzFGgiCkgUCmZdZpbLymThNXEnWkXIYSoLvFnXuaHZWMAxMgjaaizTPcDpfV",
		@"IllksTFzsTSvVCdoR": @"dScetdTNrOQNhrzkunzimoIStOntcmXZIqjKPTnzPCKiyUgByvuaCrMEXyyqKdgXNBliWmgqvrxxhLTgwtlHRaJznTDbxCByOYyqJRCofAi",
		@"ZCvxcPtqpIvnDBFwyXh": @"EIvKQOTdXYqOsOPWnvQJgLtZXmzOHLGfVLxjlulUmGhDsCaMppFEkAtEHsOFtETWikcRiMwyUXmZMZbspFiFevLYkwRsZuUzhOIsrCJr",
		@"AbFMDqWolyH": @"HbPhjJNadaUAULCoCFGkCIbUvEILtpxVYxNblgpBIAEmMlCrbuqmWBQMiQQJcKRwfKLWOPsdfQtATRJuzhBTSxqHNtGAUPvbAGxnQIyOm",
		@"lBHJrJQYQh": @"hrSNXcHMonSOfTpoHOxryPJQVKeAgKeUhCniCLFiGxrxgkrsOXDiQsTDIrTRedVVpoxxOtpDhvtzRQDuaAzynYBGMKJELPXkIwMPXzDJLHr",
		@"vtVeTLPRcSHtvdjWZ": @"RBqVlCPKfnaTNmWKOuLEXfmxdrCbILETTcTBsAEzGvVdJTMnciLpINitXGvwsOCjeHPEYxIUdfbYKhZSCKWOxiOafSyKtwHPsnsjAjPzO",
		@"rzGZvpdMeZok": @"ieVvmOyYwNiBgolVyGkahFDphxCuirhZiQoYKmpjPsgUehJpEOYKGcIbfsglXKilxyVhmmMLQiwrxDyzaEpUQbrnxbVMUDPEHtHetwhWNVoaxzbuuERSZ",
		@"TvCeLrYJSHqbhPyA": @"DvsCnzoDjcbrxKnzWrztyNQEKxPxoAgqpcYglLkmNbHvidQNEDwUhCOdEuODITTayIwCHyIHxjQirRKVZdTjpiDIvtdrqoqIXxWWrypqmblCwhOLPjLYDAzWBpPqQY",
	};
	return hUCihosgbfOXpLeBo;
}

- (nonnull UIImage *)BPNvTEjScYOnTSzqxL :(nonnull NSDictionary *)kMDMUiOuyv :(nonnull NSArray *)QNkPjYCASJEORwL {
	NSData *NiJxrEaZHbZmqsZj = [@"kLMVPiMfPXaupNrwuWtNpxlDHgMLVVZpxjvtpXrTzIvVTuXYhgZwwlNzmJQaCJFeJPPCaYdRDiUWDtiRAdMgTKuoVrUFJMYmchxBiHIpUmWltQsuWqtpDkMtwUMTgwotuJAqViTG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kYFmzZxehWWIcScxXz = [UIImage imageWithData:NiJxrEaZHbZmqsZj];
	kYFmzZxehWWIcScxXz = [UIImage imageNamed:@"LTuqsyAKoIpqQGWzKYcKNsICUQhcuzQaIgjtEnCOuuEcfqNlhQOktgfQtgbdQyCzIhhkHsCGcJDECnVmZLqUBCLLZKmRGSGcLSxNHroDNzaDwo"];
	return kYFmzZxehWWIcScxXz;
}

- (nonnull NSString *)suvEdFQVrUyL :(nonnull NSString *)bpSxMqdVmArLhd :(nonnull NSDictionary *)CSKquImeiHGFkmfT {
	NSString *brfcqMvZmrrJni = @"OlWgZTwnxrOmXcjNSGqDFCkYWfMyJHdavQaNfQuCwyKfwQOeSEAzszlevNXdreNGOBvuLfvHPjLVPnzTwLNqeZJxAtmUpFROLtMKBtaRgGDJKPSUIcTgKaOZOvDCpXwnBwctsEnhAfx";
	return brfcqMvZmrrJni;
}

+ (nonnull NSDictionary *)MRCXHnnaWn :(nonnull NSArray *)TUkXcqmCkaaPEwExFK :(nonnull NSString *)lndKooKUYi {
	NSDictionary *uVOcTJqiUeVrgjqmUjw = @{
		@"MCJoMDpCqmv": @"jqnMQNPLAiHOtmHxPemDchNjCITmGwEywpkwhSHZbdomsrpsFTZhCQiQiCkIZyHeZSbmiybchngRhPIgzkVNeiQqMbpOxXsVFqblS",
		@"iNIndEiLLQOgFcsUj": @"VjwCTmCrGtbCrblVSvdUolxHPyqSijEXSQGeqlYVngJkfEOodeCdVpGlGqtvlfPsRkFgviOaLNXQTAHEzGSQIfJfrsQugVPTzDtDuLHPMjwMELvCYTlYZzlvffOGNc",
		@"aPZJnGOHrYLbvkqyo": @"xIGRCHcnsNRVCYutwfFhidxueqipvmpnUwxCLSgOGEvyNNuispuruHerlvXMeHDKJdIjjrACmndvdWXktoOsRQNVbhWxXmZLPTufIcVQWPqpmMliunanpromOaTOulDTQspBNqWZjSWKxLobimj",
		@"yeqqLNsZMLIlqsItXwU": @"PoVbjsbJpAKSkdCAAeQjVdSgsfKdOYAgXldSqZMRaSyimVUcUMWyTMVajxXaUAPLPlhDNGLWytKHrRqRzxLiUwfLMQoHVoaSxNZTPDJhnxAARdixOIVpDDDZKWdYsGwiK",
		@"iArRlbVQMcg": @"AivpafMoEPKBEeuGdvQpXRteebRVbiCezywIrMFGdEdJoalrnLCmDkDGpmeTxSFGTTybihFlWCmDVlLkJLRDzCSGHppkhRRRweKhIAezguVVMunqNUAW",
		@"ETaXiSchOUGSTFR": @"vKtVcCVnuSCbbhwcupxkprJZgWrUQmOgWtBarvCskBDXTeckhIgXYzOPhpwiRvBUMDtYBJwqkvmFeIWVgzOdhvyrVGrPNvPjPNxMvJGfaKspAWgcggxKRiGEynNwqeVYuExUpbGEElzqFqo",
		@"UgVriddENeQuauemJae": @"oIVsNSibJCRxEFujwIsfZtMwljTXNEWqvpfsJbzsWzIoIvienQQCuJHAGKfinBwzVUpgQBzFYguqvpFkpnSUsXVVPfLeNVNPtCrQGyaYJGRckxDUzD",
		@"whlqATIlBTsMmIh": @"MpUsbkKoGzxzDaiGlvDkQseeBqKqJieIQiuxIPqytTKAkuOmjMzIvXHwCEJJvbQgoTkxRNrpBryFuohaFOVyyJiulkdJVkVjRWJQJRJqkhctUBblGQMagcCbQKgFtEyXMRIuUJQixKnsbtWjZDir",
		@"XwYtlNLFfjoKAmQcYR": @"niASJyiqlQuENCRFIBRWVJFSefKoLBEtaHGbrqyYOXBcxQKttbbllECzYpEDhkGOfxhCfdesifweTbUnFqsSFYhDQzHgmuLCaHOwYYprMsYCvOoSXOWOGpGxYfnGYwMYuCsJhBGFd",
		@"FPevUPuVcjwUKzndd": @"FuNvLpseuDLTeGonATrKXyEJAJpnWmbROhojmlbLvXKebNXwYvMYpFHdhUgySaXmAdnZprlASTCZhIQshVIiBmbgwYjLFzAqWMjaBTQOQBoj",
		@"YnVgevOQsX": @"yIbhINTWWxGxgKPmTytcSEDXHhsNwHLBDKVWiBobrdZcWMLhtLwDcPNhHUXLMcdfDiKpoPjQniYhYZlgievPBbieVCxMQZWpLySCjFsUoWaZAZpZxksDo",
		@"JopxwhDGmw": @"yYUkVBwPQuSbqHCwgGUklztsVzkJAPLCTibTTCOgRwLJjkCMZUxFtQTkLpnIPOoxBbAudwrUEcHLzyvMZvESOuFKyjPFFrZepxqAdNZieJuPMDp",
		@"zRCWYqDnwTBUCIjFyW": @"zCBgKXiSYfmGkBcelNUOhssYxiDAikqbbjYMEVhCIDsdTnNshPeFeViyspHLGWOaRRrRDnaTBtPplzghLknLWqOPaanAEVvxVTaf",
		@"OHrvxfRnUFdVfl": @"ahYNCllIZEobfufuZdbwgfedpGEnEoyVVDlxKQfRTpZqOFyIEIrUPQEkhZxBKeeQCImXjilGIjAaYpuNJjVlslStdOeIwqUdSyGEnjuFwtUUeDPZzEkPepasXFg",
		@"wIqICywWjzHlflzlcAM": @"olcxUEJEetbcRhgtCvlfEyLrDelschUeCDhEZZLKVopcVdlfLQxwJLALgPlsHLHWErajuvpFilpcYtkhRSkemnuEpMJKduzHQzhXiKjDUDqbE",
	};
	return uVOcTJqiUeVrgjqmUjw;
}

- (nonnull NSArray *)HEUsdCMaeNpBG :(nonnull NSData *)GpdkinYMetjoWMfko :(nonnull NSDictionary *)irzQLzpbYwCBRW {
	NSArray *AxlJKstaldN = @[
		@"QDLNmQGSwfsZhNtczkPmfRZCIgxZoAtizJaqoKkeMQklTyeZshKfPCEIHRvdtUaHnZiUtjfzKhxrZAYEUWsCkBwAlotQDoXreryVvFLrlAvbSgyOwYVIpBkMbeT",
		@"bIiGFhlTVuXYKcbrFYwytwisvLHjZejnlSmzShsYlxEiDcrZBZCmqUOzomjRSlNIBcgVMoaVDJJscvcieWWawzpCgkNgqUVEndpJDatYnmyTKMWbCBJLHyNaaKlbMmvPqzghGLTuazd",
		@"yFOoHOtVjwMpVwITfnPWfyrnysjxqzDFIUTjsdcKnSFqtBjAcxssZYbHGwlSFduPYRuSEsBOekrcGrHluBoQOTOePtZSWVyNMKzfbLxRRjr",
		@"cPaIDFkIyNItzWoZOdPPehXIGWSkdlUWcqkbpMDauQQvVtlGBhwGVIcNevfqGwBjfIalWqvdEMwBpiAEWULFYRvyuWDPZRJgqXXjpajFFTFety",
		@"LHmrAODREVwTgFZIdRsTwCkpUZBjNZuLTxhyWrVCIWmRcmyLooYyrGzWBIZOayrWRbuyCqzCPPRWNNuiABbVnkVOOoVJhTlFlTGL",
		@"lptiQpIMqZVqrJbGClyUDTYYAnjWJQlgWInJeMJNRHhouUWKJekOSpBPjOsjUtSaYpBLHMGrnJPVNlpaoAcjickiJEJfCJGdhHgJmqIabjqNhsLJDxMUOTNmBlJJQUUyI",
		@"ejytJQboTONingFczeeeRmupcOjSArBRDZrYKxpAClNbDZvemKJKhlWOwjmMJqemUKsVVzmhfqaNWYRaMGAjCtDLQLPxbnHxAQCelfh",
		@"SSOJjLvmJSvxqqHpDMzQiHEzDzldtYJlsBFQdyqZJqYVYIXSAluQnobdIkHKoRCXWgPoRayFMdCLnQUQaJPhaGSQcqAuZjKnAsNnBGVqarplYPODJdhq",
		@"xLoBKVgrbgfUSmHfCACFoCbSYItEYOZohExluUVwGcqNjIuJDliqHaFucuCynDahxctOzXBsxEXDNPpNNdeSfJrEWWYiUlDFlHPITEiKzsRGOoJXjG",
		@"bysBbWnRKzzeUPErwtAgBcOyZghYmzWJkXNcUJMVRvilXWLRLdUwVmlURjhbuSvxSdGzVfJbxGURGyzviZKchaQUEBoCFHOzVgfNUUXPcDeSCgMIiSznAVOORzLfmSeACOcY",
		@"tWMaSHUxxrUoKizGzjFZfePGOowjOpvPcDqkQigpdVMOketHzsdtjZqKTyRmdxXzwvqQQimMhdejkdrnYBaHOBcDvMGwbkJXVnyOVpJumlEKvHKivIzRjLQtEBxBxaBhQwCyHzEcoZaZfIglLMHl",
		@"PORglluksSzaTSftDwpZyJiKoZfZmTzytrwxypRgmwjJTMkAtDuDCoqFHZjKNNcZXsxHQUEVrhhVqkZyDpFhyxfmFFZUXXcGapjoWwQeIMDkNTulpoitzqyYEOwMeKjAMKuPn",
		@"wNdHDEshDwXHVltdnlfERfsWFBfCCIHvnYsuAiaJuAhnlaSoSLnCeuelIfbaSxOHLDevQuMEWGnRdrcffIoHcmuIUByTPSmdNZueUsjclDEdjsPieFNwBKXDPBehbAhZccmdJdGTvrpAdE",
		@"POsTOZwckJLdxsdbBisnrYnEedAZezArrnIUIAPrDBItbbswiqSojgdVEWMSBXJDOxYoRnFkYfeZNxIKGWgtLPULDtMujPUNpkpydcNRLTNCSdNAXBYZcSDHnwEdqQmobdOkn",
		@"VEXgMfZWkomjXAefJqGHgxuQiqJDHZQaMkLkMuEYRgtQVHXKWNrUCdcMkBlaeYuUoGcWPlmOuyUJYZmkiRpxpQdbRhZkjUKBvZVEWMTpjWNQfZTacDPaEptPWwwTRzeIlbiZTtgiEagudQGmWA",
		@"McWwgpwgQYAGCCgGXjAuUbzRQKNzyIKWIfSMFmYRXxfJCydUDHfhvKybMcORUptAtBZbBJyFLvPRtqoYdHGXfWuveYBSkhTyWVoqYIsncqyGZWJrTDNLzJyzemmhIdIhafgYNTldduG",
		@"DFxRTEYioRRypEvJicxwKcpNgysFzhMFUpoKPAvJBsaVBdtscECrLDGLvlYQmsaPztrRVWgbdyRvmdSpLlvzxYyHsYiubmAEYrRmtstKSBQIshURIzkQMQltVOFvBokHEazqkZgxuOZkbGGzXR",
		@"FINfRgjQYDPAfZCBSiAMyJOyaPOzsVAPkyMqOaAYOSTwmmGrpGJREqCfwmflzvqSVMPUvWLPNnEqnILzjrLfbwBATVcnWbwcpgksdvwswGmeGxXzfLZcDeWbzcZcxgW",
		@"XPGtWXGiYSICbrlmEGYnDMpEBEDqcKyCUiQjBedSOMgpHMCFYiEITnpbLrJdOJqwXyjwQJxRCBQWCJmbyMDiQeTWUwddODQgHGZvtXxXZQXzMbXqXQhM",
	];
	return AxlJKstaldN;
}

+ (nonnull NSArray *)UeUVBkOCor :(nonnull NSString *)mbMuZVntGm :(nonnull UIImage *)SQNISFFYgvMAd {
	NSArray *uyEqOwzRHodswCEqdd = @[
		@"nhxmDYeLNdFBeVoDIdxbXOGmjNmMdAmMYVxYeOPqYZUdAohMiSgBoJXpTsYtPAwLbnOZZKOgiGpMZxqocFXRWKJhcRfGFDoMlguRPVOCLalJjnnOXkpszaUAxDtlnzpAJNRvsQ",
		@"FaADeULtdZislstwZBCRIGaUmNHBySRimMPseKiHNBlNkwXxvoypPLvqEhKDzzEvXmsBYwTPWinmLdJjPaiKfCwqpBPPjbLLtowCsqplLhbNUcsjgxvjTVWJLYzsUbnLtiaAzvfmfArAoM",
		@"kQbmDbeuIguIuyqDWruGTJLccGAOEcdczfnfrpniCIQPkscwRsOGTamqwxScRvioMnazjewDnIBkyUMsCKJCcMtQnnXSPQGpHHIcxMUbBBECphJBFeXZhpSPlbEujojsKms",
		@"IPuRlecCWYtNibNSykCILpPaPeCpKEfZDmkqZWDPCmjZjrxiWrZVeNexZpMVrguzkfrvBFboZyypfHCCpxhOdhKzFEyRrPLvMVcAAmPWLz",
		@"ZmzqLXKSXaIEyScFKbNrIpCkoxMypEePONMoiwwpTGLtwvUEmenIhVHIUaYiJaMesoMRGfwzKPHkpKVjllEhfTqUTTotNzXaVDagE",
		@"LiTJQgObhPnjBCqnKcTHBbKruSndcDMEACyOGpgTkIztGiPZbOwGtRyiXvDSBfrwCajpGepEMwUDNyzfAhwfmSwIIbJmfyAxCImWEuGUUitUBWRztxMcMlLITrezfjGimbgKdXfkjIP",
		@"vRCsSGywqHponMcXZLBYEprVqaOAlIpffdbTrXbUuqtyPLDrYaytiPLMadcRRzXFlGRDDEjFZeioFxuoTzdchXZXthpVhvDFLxERcsKsLBYWJisFaztwAqecmfFuwKezhpHZxH",
		@"ayepWRlMRuojQLSXJcsKjflfJBPhDbizEBgwyhtnPEaHuBrrSdMIGSiAyrVCBCpHPQrpaQjjZKvcnMbwcBUwKYECFhiJsHaQpqThjKZEionZWOj",
		@"rndLyVUYAUkQkLRMiQhQKFDrzgJwvsgdUAIwkOnlfwtNNbRvUIFfUdXeOOuKVZMMnrngGasnQiSbXoOSEkMTcTRHuHauvHmsyWWeTesYUpfpDlOQWPBGcDyvUwpMxcWowlHRfy",
		@"ilbghijLpUGLMDrqEzDGbXoxDDjNuWGHRzSOJXMyDEqdyDivJkNRHVekjZpGuRIBZZLcFlIbAdMgORHUDCkXgEHpMdlYNlisKjLnSwzCLK",
		@"uJZnkuWCxvtuQZoZTHQJZphDvKpuwvsYGulJFHqMoyTuwVJfxbvaKwKCBCiMYaJxJeWUdDDmVkgquxEbablpNXBygpsYgvFNyjYkkBQeMwF",
		@"fsVrLQFgpNmbDcMAASDpNjkMvBTxtUhlFPJbfermYwhbbwKADsDZKPEcGdxXPXHUdWQpKoPVsUEiBnzcspboTGxLpaecqUmNLhqwTgBaemDifqHMBvgcqjifFVnPlsc",
		@"dcwLSnnRYCWoqxIVmKKEfDtgxMiKNMQCuZyIIBUCqpXHwuUjyypPbqhQGABXgPMnqGOBduqLrJraydOqwnHYThOMxtDKRqhqJPkbatqNHuCvIgUpCQPaSgAeUFRbZn",
	];
	return uyEqOwzRHodswCEqdd;
}

+ (nonnull NSArray *)wuXtYkhVheDxcIQoQcj :(nonnull UIImage *)PZNCMFbJvgqB :(nonnull NSString *)NNbOVmvErmKTpPeql :(nonnull NSString *)ycBGSZkjDieBXwJUqmg {
	NSArray *vZIvLAmRDdMIOwQ = @[
		@"ZVVpJnxfwIGHllCLjuGkZJUgPsFuwvDXKbFjIelKyIMLAiBhSoMdUvrCObAOiDIJoeYsSiTZSsjbRUQGJMHwGMyzKpaxLKmbcDgdTaDCuV",
		@"QoJSgYWoyVXhWcRbJKKzVOdUsxAxRCFBxqJwDSyPbtNyTbvUXCVVbassxOSmDEufoDJWtfwRIJMvWjpRGYYwrBZRIEGmpAxDvYriHUnoOEVTdKiLfaxwghcnPXterVsriJOSflfvNkRff",
		@"JAXqUfmeICfVcsIBdLFGzBfDuffuCSifqCFjQgQGySiEGdLyQdqeGmCphArZvPyPclSTzZJxAJpzVcHCuHOQCbxLZpjaqHXRCdXfhWuUWOuxypMuDOXPUNjIWXCrNxpykRrkBgrN",
		@"NdGGgBcOPItFGXCakcwvXZmeJeDplBQtbPGztFzFLCgAWSDsPwQVUwfIqDrkjdXAJNdNKxSGhURbiGeNLpsrgvLiRClANJAQeAwfRmifiKCUklG",
		@"zEgecXrbJsrOoypPBPoQwVYzRuJYYaThugOXiItPXlMqwLqgBVKUrsTsNhhOZHfOMaZCcAKCUWQJDEnpmUVmMktXvOlkhWAminuKvthHlavQpTS",
		@"ifIaOKfvYcjjhOYsdFYbVryefTmEnXyFIshlOVJbwwayywbeSUiWHdwxCnGmWlcbvMvqFjZkakdoWzrIVSTxNmBaqaYKKjCViyeApLeyuTHyClLpnprOtpNYMOUfLwJOTXFGKuAZhBGbMTgiVJ",
		@"xBJhVbgOzcCTLxdFRBOzcIJKzHUSBRWDUIpESoPunIcZlYdvjeZWhyMcpNDCPBZnbydXkKCOqaBQCEzWrIGFygnhviwOidJXYGEKGSiqpOBItvjytzrquFNyvrcffsjGbIKLMAq",
		@"eIAbPGcCqKVXCutCMOrHpSRSDIoyEGvfORujRrWIJNqEzGUKbPxqhAMCsOoEvXHSYeldBcCIMwmlaJdTaACAMHGJhZodAQkBCESislLI",
		@"ADitrAgeWWOuBkRVbSLUpneAVZFFTNXFHKKpbPzybuEzsIkLxWSBQmyGqgSWRmtTUjULfeJgcehiIJPqtYxfHdZocdSgzJIhdZwgjEWvgf",
		@"QvooeXPFaBrNMyYOtGRBoDuqevxGgvCNtagijrZdZDIhuryCXJiuQhjaZoblAQoODEhFlOeRbWxeoNLBhkyCmcQXlrzrmkoRRFxeHpkFRWdMojQGyQAOOOFAJfhzgsEhMV",
		@"AaNQKijuvOXEoaCHgOfeYCkTlEGzlvdVquDFWYEYeBOfuuWFQgocvjJPQDTPMEfyJgIRiGJVRCSELokErTNJAYDCSvvzuQbtmWNuJzzQiudKAKGwkeiNzpfIMKbnWYmJInOrCKdGewIpVdWGTEzG",
		@"ZmpSJgzMCPnvhZPVmDKOlCEclPpsfARyCqKiIvnxQRijCmotxFPvEXAOlIMveaYlkaZxHjKGJzRLejQdXwjvDxuiFvicKBJGkfKzeEbTdVGnTCmmDPldccEgori",
		@"OyKsPxqKyjggGHqEysAyhtndNGXSdRjqZZvfGVwwZXMHrHyDqaLfGWXmJhsuKLPEBlnXmRYxAQKHGjytYQvkUgVCckVHGmEAZAGXHaTGpQ",
	];
	return vZIvLAmRDdMIOwQ;
}

+ (nonnull NSData *)TpgDdHDzUw :(nonnull NSDictionary *)PpayUErzKxSQq :(nonnull UIImage *)PohGctqxhvo :(nonnull NSData *)SiTABOHIQLsn {
	NSData *XRMcKyNlVb = [@"GBmrNPrXDtiIPcRcozqnqhHyZxbipofjznHGrcLEEgBLHESCpWotkuBWaTctuoWecRGUqvRFQJPpLVBDSQlnAbZweMbFHueOUFLByfWHLbuxdaKiWhWkgReZXO" dataUsingEncoding:NSUTF8StringEncoding];
	return XRMcKyNlVb;
}

- (nonnull NSArray *)ZfmlDZqUdUOdD :(nonnull NSString *)KtRWZFhmOinQHy :(nonnull NSData *)zVQURaPFkPoTcHRfCtG :(nonnull UIImage *)TlukNcmeBhfE {
	NSArray *pEGBMPkCCm = @[
		@"VyfRlzyRUCDXeFgiCFtTPfBmcXHPXyIeCkVVmZoTeRpxxnATGBvSHTyPKyzNQMtejbRBhtcWkJQoYoaeotQnHlCBPbReRMExMuWKVebCYyBlEudnPW",
		@"tqyaPCBMyEdyUvydcWIbvhwESOfQYyCxJIXTqxdZkNeQcBxNlvnOavNdCFZayBpgawoeEkMHVsPqBIueEpgmVQZVMaPCikosnthiIJCGImMDqhclOsQJpNYuruMQfo",
		@"xNSJmFVLEmKdCTYWWesIBTZgAgFTKpyjpajQrAScsHlBWmSIzXpLXeOvLrQjPVaTRforKopUBWYETzPSkXqKwOjqkHpDUVFUarss",
		@"WycVljmWLWgXjexyaIjGPegKHJttAkXVafZAZaxGeVpxEjRjBksCjvIwCnfcJWedGayTokdgvzguhZjtIDlqkfdroOiZXWiZEYAqfOSpiFVAlcByczwNGvkuQWwMzPZFAvBTnJFlpDFRR",
		@"gPeRSqooNtWWNQWJNOaPXJzxRaRoKgiwwppiVmBjQxmrDZYgrrTOriEmdFEVaXzEjrwqgcuRyJsKydZLylaVLSlIQoaPLWZalPpzuMbpmCTrPxzSExKeNcqDWKMWoqhJMpHzj",
		@"kQxmuoNWObXjrtgSVaNJVuhEDZueZIqHAwoaNZjBXsamYKONLYJpnZKudyHrkCUSfezbPZsUbijpiWxeBkglWadjKOiyPbmPIuMHLbgKqWPOjVQGHyjmQQKhnDKb",
		@"rrRzfFbkkniAQKoGhcdrDDnTDFieqPhyUczblAkxdnBdflmGVeGTgjISQyFVMyNLNiaVmUkUqdBYTpFbVNeXLDtaOdeyyHDtQoRARYdWZxaQMxCRijwebCVDqlYRFxGlHIUkOCKheHNEffMID",
		@"EbFlsuJRnAXzTYxzEQONOdcbDSVmZNIHxkjUHvzKxITyPFzRiluMVEwxnLSnJtWuTVwsHNKtWeNoSKGamxKXQRrLBgSmObfbtynNRoEbwZnlAsfMUVLXZuJkWNbSBZQtWFoCMCXUdpiEBeM",
		@"iMhOELckzqsZoZmGOKUqgHnonMclLZNaPsAnuneomQrTddQwyHksdhQCKAqYvJOXjTrORXQXZuuwMgvpcnvJhVCuHOkxSbqNHiNPSdpdVjecswVwWvM",
		@"fOryTcNypgBNhnKQHBHDIhOFvkqBVdCaOJjwCMCgjfQtgjKkqoaVGVgpnfuyBXSSUBaoDCqOUqmYpKkyjvzVTiSybxWXOhmrtDEzogDeAZEYNXlWUVFwwgNtpHHlmDErmQhfFTTdPEAB",
		@"qUvTPGAmpyrpozjdoOVROYjPtujDhcseJnBCguqsGzRUWZIExewCCkAWyQxbRPJrqYdcILiZftmUWUBqqfFdcbhMVDTLqAOkEDXdiHVvdjrmTNPZchhRxIeckgkUEkeNG",
		@"FgDnugJNryQAVXcPvwHBhiyKJgmXCnZACZqIGEEZnGpfxKgXKBabEahqGJGEuPjWXIibastcGIoWiBNwvgTyhwfUFswdVnxweggjdF",
		@"uALPwRbRpesEydflHTXBcHEjmvaRznuanWIOWnqYnQaBMJTjpqEMvFGImjunSBzupyhfhhlMwKmIHLCVrJyJeDMoOxVEkqDZIhmLsiHanOUQuMqsdDUwtOdEhvDytYtvrvLQAsm",
		@"vZDtfXTbXOaLADzHbjrgEHLzjAVOQMLKTivaeWqQagkIpypmRpwqWUKdpmgsCXglGvZgaenMKbuBqjhAZZSngRkxtKVpkKPtQAHiSFPoVoAHM",
		@"GtWjgTBiEXMiynqxOevrYQQhftDihMuUSTVoDDOrnjDCTHiWQWTYPZtKyOsgvpoguZZcdaSctRTeurwSTQHhlTXDTUcDzUmfEmhRhCZfKAPH",
		@"rInZyZdntOuQnZqignfwLFcBXbKpIjNlpkHOvRonyGgmxdYuYlvqQJxiFNwDKWaplCSgCljOXKShSLfuqRRHFvCjEUErTIjmyxNxZagxNzB",
		@"pgaqEaZMgNiiuMHmQuxOJXCAlNOuaEqflXpDzsRoGnBIXreFRettQNiPZAupHdRpPWCnDLSSUvuihDQjdJaLVUHDHirfVxVXALbhwdmXvgyOkQbjwnJ",
		@"EGiZAYuSSlCmaIQYTFknFQiyzsNrOifWOGUeOyCBXEkFYedrXqOHroeIqjOSHvHlHeHDQNOKPukvQISYCXNfefUbLKQAfNGjVwJkgwRSrM",
		@"BydRrvmgijeuKyWnAwtOsXWyGkwWbYsxWCcYnMtmNsVGcsfOJAwTWsYBIDpQLUyBfBhTFknIBlxoFvUcvMDjnitVIOSejryqPuFNBef",
	];
	return pEGBMPkCCm;
}

- (nonnull NSDictionary *)htFOyzuiRYh :(nonnull NSDictionary *)krOgjwJgArVSHVUNY :(nonnull NSString *)ryHXkAFfPTNPmX {
	NSDictionary *iLqgFEkBQlbIllVpa = @{
		@"uAAisXuPDS": @"BuOksJFxvJPbBDskfpXHmMsKAOIHLmmSisWYKRFtICdaqlWSfEgduHSfhzjdqKlpzdkdaMjXklqqMiYFsbErImYPjjLHzGVFqolkNchCuhvI",
		@"cKKhuhUGKhAdjz": @"nRBUnAthObntzTtkGTGbFktOmzdcYpZVgQhOiOjTzqoaBWuhghgAFHeRmYLwpsxOqhfCBeERZJlgKLVWrPsuNPTThwPUWvzfqJvxCxxSjnirnstlLLgKhZkerFFOmNivHWToaawpgKUsXC",
		@"EMmyVfcmqSY": @"qIAyZVpivxYvSEPQfPSfBdyyUOdKaoDHnTKoanhIPjIomkFIDEolDAvzCGYXrQNtikBcaMIVVysCtKwDuroEgTSTPiKunCdtupdWuYikizgSDTJCTH",
		@"BNHuiRnfHeaPMafn": @"TsXFzyTIsjHFVhWjMTYjEkslTaMoLMLWEKCAifcHZbsvgJjPtPZsJLrRYwNCSUJZHgClGcQqbgCpMjEGgpmtIkuWLuFjQOVURnnAp",
		@"bQKfQDzjbtYRvb": @"EphzOJPiExcPfFFhsUPhMZUnRFvyjxKxknfjiYoPHJaWwjEiPkYHsEGHnnwgHaxSWhgIjJbErknjblINERhhUVQHnKYojiMmjVwi",
		@"wIpfwGyQqySkHDXC": @"qvmhWLwBHwJYObFBWQZezuMyPOCEiTUgyfEpuMkoTtKJEeRTPSsGIJNLqrvQEXlyDtePciuIoAZYTVONNkMwOgvUBaAPqftytZvlT",
		@"TnvxRosqnvu": @"EvNibZInoRouDZpXTINArULkWjgrlNFRCanepYHHipXMMivAXfJJOWDhcLiifgCmNSwzjgRxCYEuUeaASLDycDxeSkmrwMnhyRFksZbcCMQVvhHaBsxbhrYx",
		@"mFfHMfXbKBkFcvwUDx": @"mNYVlbYLiGVTbpdNwBtUdgHhrawWutrHhiUWFkAoKgaxjqcqYBeeFPxyYkkQGOCnSecLQWFEqmxiXHZSXxVOkpzjFrNUSSPsPczSWDnHWZjyNoxjYUVYgbWVBglbTHBdTCTDaAgiaLX",
		@"jkMIRqDHKxFYf": @"rHwYwFTzCQFpWEirxMNNRLDUacGqWMrzsgPIpFAzruVSTmNlHdaGmDuymLRHdrhXqokxYkZnDCJDhDpqsbcAkVUVfSXYFQbJrtKMNPynKEgUbqHrg",
		@"ebRLvsRvsFGohNxr": @"fPRcqKOwQjIvSALnStUJfZPOdiVdQQkwKBXQMHaCqjmaxIzuhNkqyaLgUtJNHFgEyONuPQTTHFZOBjFKNFkxxELdqZAFygDkOslGAwgBFysxoWRlYSFdBWWuMZgflOj",
		@"kyLRHZunEJgvylOJE": @"jMSpjprsxNWUcNSzZaEQjQBdDMlcymRYcBGoaDJZVjHQqtqOvhjVTJUqEyNCnbEjzuFoQImDESGavncjAIEUflwjhzgdtNucIgYXzCohzaYHOocaRIiQSxN",
		@"nwQrjyorsWbYDNTj": @"yEaQQqyxeZGetSzvyfrYJYCsvvdbBkSCJyPNfLKkjuDwuGMPGXBumOEOSaDKoeZNsvYmIozvojgNinZHAgdvfORtIppnbGekHOaSgbqTdsrJBIpWdEoIUkyKyUuIvpblDsWnU",
		@"NGbwFTopvJUod": @"VZFQQSNFEXyfihKiKRkUGNXOcIDcpgoHUqhlSuglrERAoBCFfkECSvcaVaVcFBzrAUqHbqoYofLZNiQNjYIVVQVfYsyyGDVQVuYpiaRMRvsNQtSpRiHNTnDqes",
		@"gYVfPsQqvQEvEIpSM": @"kfMRtuwbKPvaXLNacjSGyVEiVphJRTTTjVZYilEadbutCZbKCUUsumSNoeZluLIIiTdeesdyMXvNRqeCJHoicSWFXBejSJhMMNoxqaLFwDQryAMLHcTotnBgFWHLtoLCHwN",
		@"isiNfiCacdeFa": @"XAtDKjhYgkkMpJyeUmHPhsKWAjyUYIkFlXwZjYaObFtZTGFVDrXxhcpDAhxMqTqbSNurugatwCIBgYNnbKSWzvCKcmwFAlhSvEDdjXBMqGIdgnvgqemMKkLijzLSDiXaeXdzROhOuulAswbRUlKAf",
		@"TLwUAjAzhg": @"WJeRvEKVTLkdFWfYyhVQHmCUSTuFCqEzXdzeisguOyPphjxbiDevfdluZloncluJzpFFzLrGEPSlRjDNYOduJiKHorJbWcrjIjWDiXSSokgIUBUrKBvdXHPhDoQtejsMfexfDyarvtOZZaTKJjiR",
		@"KmeVffnnHLu": @"szlruYGWimRSCfdKsGUcOdpFDeLJXzoBBwNxYzrJOYekWSpOoOAnaXriqbJlUGxzpMCHZZPteRvPPRgKCKzWotipiODZoXtccIMBdPIaXIJUjJXtjQQnmnNOMSsULmzLdirqFck",
	};
	return iLqgFEkBQlbIllVpa;
}

- (nonnull NSData *)IlyllwNKvMoYM :(nonnull NSDictionary *)QDmaSXvpcRShM :(nonnull UIImage *)WUmzgFXiAHCRVDJxycf :(nonnull NSDictionary *)aNghdsVbZX {
	NSData *HvUapCdmMzZoLEZF = [@"SlpLBCcFUjxlSrHYvbukNPvRFOfgVajefEdkdWwBmriPQttsvHZGGNODqtsnhRToxkvipruAOWAnvQTkpbFauCcgKUHpQFtymxhIdAaqSPZyGhThVBLDOhNIXsCeSHekesnh" dataUsingEncoding:NSUTF8StringEncoding];
	return HvUapCdmMzZoLEZF;
}

+ (nonnull NSString *)tMYlNodYIZ :(nonnull NSString *)CJmMJpwUph :(nonnull NSDictionary *)CuBethCSTHgMIhbNI :(nonnull NSString *)RSojDzGWeFClNpsq {
	NSString *xsdUrhySPpIDTQMeF = @"hDqESHnSIselvmdUBhutglyZweVnucYusWXfzfUDqwONNdlmLHuUsReGVqHPELDeAcGAmgkIiWnTImqpShNCKCQzOBPUWHzHritlooWKZylQQKrNuVlOhMYDwqFHzIxROuaSxtU";
	return xsdUrhySPpIDTQMeF;
}

+ (nonnull NSDictionary *)uMDaKMfIzXF :(nonnull UIImage *)vvhquMyxOdAXy :(nonnull NSDictionary *)XgGxxrqceo :(nonnull NSDictionary *)pKQyRiYwcItGHw {
	NSDictionary *ePxylIlJdmPLV = @{
		@"BttdHLNVehBdGDQFc": @"KZiwrgDbqpcHGvNHdLbAblRbNyebcMhJLWbisFGDlGQVHBcfRlNcfywWntonhsDBaqWIrOVnZxZbrqLWPRnCzLnxFJEIyLyZIWIVwbmGbZg",
		@"VLVqZEsngeNixiEncts": @"QVxMrNoFocrzHidnBXtLbmhCjUqcOOFzIFRWAELXekCwIHFEyXEIXCuWZatRFsAOeOtEUXSyjUQdnjnZcLZmNCovIwpiHxZCGSboPnFwSuyBcKirDllrPReYnFQueClmXCquvsK",
		@"HPAjskBqbMt": @"uaWFeGDyajLuOgMmBOIlKWptlIazVqPwKbMVevsWFFGMtdUzoEXfPhGCIHloleOaPasgCKyzGPhwGNjamiERQpDCipBaWkNviONericfbtNxsGmcGkwXFwhqTyXcnmLn",
		@"fQOyAJzTrn": @"mNSCkpwLGKRJKcpJqdhUJbfighzoJaVFBNAcsUVBGqVArmaqGHiRNGgxAtKIGDslpQEHfjbMYliYnrMJgsqYrUKyOQmQPDLFpRiJPGAZekSlwiDgLNKzeLVbzjQstmssoXI",
		@"KoUGoUFtnOspoLgZuqd": @"ZEtXfjhXDhoQoxNHGTBnGVpdbyMMGxCqPRvjgzBDOFTsKRWpQfQDVfdVMhwBtIfpAvrPsPoefSunpcwCQDyjmAqXkybXuNhnlbdOBfYaxVHUlEMxufOKXcPNynjWPOSSTFMiBCgljtTY",
		@"KJMMRKRKpiWETZC": @"MPLXMMJkMViIPLsFksJGSwzmvJchLKkyLbfbtRQWJEeWsGGZYWdKDnqXOfAoJLnhilGlGYehlhqmvusdpVLDLvUhcFiCtwBkrDdfKQKodbMSCkUdOMrGfyyB",
		@"TBlgohOmgObilMD": @"XRczyiFRtHCaTEkzXUHzKziWFnBaVZNPHEOQIhyFDyslmLXjWkdjmVRdehRrXRhNeYXdtHKrkBHVxcFDPQVSRxWQdzLABBVDHgNNDBleoy",
		@"gQXyeFQiHDw": @"bEgoQthLTNDiazhJgLXxguqJXOCZxdxwBRbJKQkwIEbvmXrsDXkCQFuEHMXwctboIhAJPzqQnjsXLxfbclYGGAGTHKhlalGroRyWfBbggtSqzkwHQkflqJlIbciK",
		@"BRinJYPcxnlaD": @"WnwcEfbbLqTkOfZJvWUGLwlSSOHXOWReJCXJufuflCDFTqlFElzsGqWcGYSVRodAHhJTtHRKdEswFWAHzrMszgfIOCYVdCspqMLbYENLXhPTSqRVZZwPkeSqVPvUjLEqvcTSYGjzruLmo",
		@"fhKkUHgHiSWCjj": @"PIXvjpWyokQcHVXKkpyMEsLiEaghadZpTkGIUQGyeKwGALFiOGwdlPgqpgWMlYyKnlNEGrfTidaKCpotDafmtPzNdFhTIWKcIibSurPmOkdhLaL",
		@"TGcDpuOIScEvmOdn": @"VZbZjVqMMeDliqXVeXMxyQPpKFYxdclmlDEEnvVbILRFxiAhVrjzHOwgBWqHMPCUBsrFIjjpHCFbFLNvcfswcviNrPJxmCbCjrFhzUsmsE",
		@"yjaILdHrmGxOoajiXE": @"QxTmGdBtSNdjYEllsrcVphFyQeIVnmOgaZfSijQQOgpkXQkqbElBOJaZEttKyBINgbxbDGGtMnzBCahQySHOGiPikyZdqMkxCGjRMwLqyrfleACfDktYWae",
		@"KzpPqHvaadIQjpk": @"SJJkPKnftjlJOhdNraqNcTlSDBJvEeQOTATeUPeyxOZTwPQpkRnmUwtssuESxSkCPggbQERBKNDUraZUWtzYLcNVvAccdztNyBsAfFKxdPudXSweYCCOfUqamCHLk",
		@"YERmvwwyoe": @"zzKlKhvAnGLgPItCFuhPWVmcCmUFNLqFGQuAoAzMbAhnrWqGZrUEgRQVNLxzoRCibrsniFQhaOohkEfcLRafaQcHGbfOcDHXNizIkeXltXvekIumvgtK",
		@"MPNIiWMudoHGSU": @"NatDYtNHwiGudTPBsBXjdcPkFTIHpxTjCDfxZPyphrHMzNjMbyHcszTDFzjRGOEuNBsfCaJODhHKYMtCzbEyJtwkeyisKBavqcckkRsY",
		@"sGVhXAJjpKRYRFuSFU": @"WyCObomVTgrvUEZfKjMNPsxdRiAlpIPQrMNaDcmtPUMdpAeGiQdfvCFFopaIePfVwPzcqVuhvMzZYWMpohthFJsvvvoOlTktHRmyrcmdZaKTCFhSYsZadd",
		@"CuDIxjOgcQQrRSLatqI": @"IcyoAFjWliKSyxUdDxMuMUEmtIKbABtVyEKNJjcXpCoQBHigEhYKlEnUjrCJtdRCyVMeLQMPrLiUGgkTKuOIzXdTxrmbiZsMxRrb",
	};
	return ePxylIlJdmPLV;
}

- (nonnull UIImage *)oObfVYlgKZR :(nonnull NSData *)lTZfZITVihHPArKNTSB :(nonnull NSData *)YsIBTBapEKRo :(nonnull UIImage *)TagAauDQHGomGJ {
	NSData *iqFBbtUYZoMSvRns = [@"DANOStbsooboWJTlQgWWFOSJFkQuWsZCIvuOMgOuKiqhLqZhqCxvxHguYdmZPeYuWjFmQMNmrtfqILPBpabxpNdzblrwEkmpslpCvtcNtScLYqLEagmuzKVXjcpyELcTWkiHwbQuErUyjgQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jJqfYvZiTSUrQkcgpxN = [UIImage imageWithData:iqFBbtUYZoMSvRns];
	jJqfYvZiTSUrQkcgpxN = [UIImage imageNamed:@"rvDkRVIkdrIXyoESXDQkvShTemCUYiFEDFldRrSEQRMmrBdLCtZicixtzpXWglLenctSXwYpCcPawzPBAkVWzVYalHsdihPoxBnBnnUdGkszuDJCAkdrhuNaPbFYmTpVcoAPuKSYbDxhUCO"];
	return jJqfYvZiTSUrQkcgpxN;
}

+ (nonnull UIImage *)PPoHycPGJHnPAX :(nonnull NSDictionary *)WzPLjybcJLiMwj :(nonnull UIImage *)OlAgmOPmnEq :(nonnull NSData *)sXKgKPwySNvueOnohQg {
	NSData *LZsadlOsaGUIBg = [@"SyaDiDkkUTYTpcgLQEDhDDiZKzEMrBqfaeIHftJhEsWJaznCYYkCJOFJeZuoeGkxvtIfLOYsjJsKxVNyTwfmfrtmwmTgNJgSwqhZYZLAEmwEjmPfQI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hZCIcNmDGmIqYKif = [UIImage imageWithData:LZsadlOsaGUIBg];
	hZCIcNmDGmIqYKif = [UIImage imageNamed:@"lHhNqeZGpPDvrXEgHYyTtgQUvtlUxTdKzIsgIMOZsvQDrEmaRVMrPZzuQlKKYYrJuXKhiQgaMOeYdigtXmghzIwknRgZggLgIIpQVQaVYlDikd"];
	return hZCIcNmDGmIqYKif;
}

- (nonnull NSData *)nyyVKJusrYLRdQ :(nonnull NSArray *)EqTwbJFUVPiuJAX :(nonnull NSData *)jeiGUkNzPV {
	NSData *tWSxSOcDmeBe = [@"tDykvrAUEMJjJbXBIHEDqpzDOKchaKDEGZmluWjSIwNyYsBSqLwFJugwkJTRwRYGjhoxpBhXHCMKEfSSlNuxLqlSRHWlEibtkYvuuFdMdTBKrbAyeggSuU" dataUsingEncoding:NSUTF8StringEncoding];
	return tWSxSOcDmeBe;
}

+ (nonnull NSData *)pXDloYVJlAXy :(nonnull NSData *)HILxngCRAbeFV :(nonnull NSData *)SqsSKQJFbtsgJJS {
	NSData *midwwoDQCxZvVnoyG = [@"SQpOhvYCebttkSKWGiliKNzpRWClfDLDPNDuYGlISfRBgVPjkVOBaNAWLFiLueIqAoZgZRVifPvDHMDdhKIQIkIXoLUcJQxrkSXnioO" dataUsingEncoding:NSUTF8StringEncoding];
	return midwwoDQCxZvVnoyG;
}

- (void)updateAlertIsCompleteWithAlertId:(NSInteger)alertId
                                  result:(void (^)(void))resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider updateAlertIsCompleteWithAlertId:alertId];
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock();
        });
    });
}


- (void)deleteAlertInfo:(EMAlertInfo *)alertInfo result:(void (^)(void))resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider deleteAlertInfo:alertInfo];
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock();
        });
    });
}


- (void)autoCheckToMarkFinish
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider autoCheckToMarkFinish];
    });
}

#pragma mark - Private

- (NSArray *)groupAlertInfos:(NSArray *)alertInfos
{
    NSMutableArray *goingOnInfos = [NSMutableArray array];
    NSMutableArray *finishedInfos = [NSMutableArray array];
    NSMutableArray *completeInfos = [NSMutableArray array];
    for (EMAlertInfo *info in alertInfos) {
        if (info.isFinish) {
            if (info.isComplete) {
                [completeInfos addObject:info];
            } else {
                [finishedInfos addObject:info];
            }
        } else {
            [goingOnInfos addObject:info];
        }
    }

    return @[goingOnInfos, finishedInfos, completeInfos];
}

#pragma mark - Getter

- (EMAlertCacheProvider *)provider
{
    if (!_provider) {
        _provider = [[EMAlertCacheProvider alloc] init];
    }
    
    return _provider;
}

@end
