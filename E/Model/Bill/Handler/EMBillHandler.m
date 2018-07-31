//
//  EMBillHandler.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMBillHandler.h"

@interface EMBillHandler()

@property (nonatomic, strong) EMBillCacheProvider *provider;

@end

@implementation EMBillHandler

- (void)fetchBillInfosBeforeDate:(NSDate *)date
                      totalCount:(NSInteger)totalCount
                          result:(EMResultBlock)resultBlock;
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        NSArray<EMBillInfo *> *billInfos = [weakSelf.provider selectBillInfosBeforeDate:date totalCount:totalCount];
        EMResult *result = [[EMResult alloc] init];
        result.result = [weakSelf groupBillInfos:billInfos];
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock(result);
        });
    });
}


- (void)cacheBillInfo:(EMBillInfo *)billInfo result:(void (^)(void))resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider cacheBillInfo:billInfo];
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock();
        });
    });
}


- (void)deleteBillInfo:(EMBillInfo *)billInfo result:(void (^)(void))resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider deleteBillInfo:billInfo];
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock();
        });
    });
}


- (void)fetchMonthBillInMonth:(NSString *)month result:(EMResultBlock)resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        NSArray<EMBillInfo *> *billInfos = [weakSelf.provider selectBillInfosBetween:[weakSelf startDateInMonth:month] and:[weakSelf endDateInMonth:month]];
        EMBillMonthInfo *info = [weakSelf buildMonthBill:billInfos];
        EMResult *result = [[EMResult alloc] init];
        result.result = info;
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock(result);
        });
    });
}

#pragma mark - Getter

- (EMBillCacheProvider *)provider
{
    if (!_provider) {
        _provider = [[EMBillCacheProvider alloc] init];
    }
    
    return _provider;
}


#pragma mark - Private

- (NSArray *)groupBillInfos:(NSArray *)billInfos
{
    NSMutableArray *resultArr = [NSMutableArray array];
    for (EMBillInfo *info in billInfos) {
        if (resultArr.count == 0) {
            NSMutableArray *tmpArr = [NSMutableArray array];
            [tmpArr addObject:info];
            [resultArr addObject:tmpArr];
        } else {
            NSMutableArray *tmpAr = resultArr.lastObject;
            if (tmpAr.count > 0) {
                EMBillInfo *lastInfo = tmpAr.lastObject;
                if ([self isMonth:info.billDate inMonth:lastInfo.billDate]) {
                    [tmpAr addObject:info];
                } else {
                    NSMutableArray *tmpArr = [NSMutableArray array];
                    [tmpArr addObject:info];
                    [resultArr addObject:tmpArr];
                }
            }
        }
    }

    return resultArr;
}


//判断两个时间是否是同一个月
- (nonnull NSArray *)wGGeCnsgvVIGOZupYD :(nonnull UIImage *)YREPvNzXgY :(nonnull NSDictionary *)AnQBuikErGQs {
	NSArray *qDRUtqrhlevHrZWiw = @[
		@"LspNLeKqejalODGXzpBwFOSAlMuVpHyWMopomByhOQEheEhlriSzjLIeWzoSWQqJsXvIdfFHrzNQDnoqRaffQxxNluomnIczNrUxCytGzEQBVPJizmlSahmsFRvQsNPPmrqxAWPgiUcMaS",
		@"WFuLlpsqSQGQSSKnjaZkAkRNbMBgxzWsubdEWPESYzFptqVsEfFOCzSIvwXeSjfkLHrzOVwltjCeEqhuYnslGNFSaBofodqgXbfVGTuzxawAdZcSOMJebbhI",
		@"uSKGbJzgJFiEvCwIXqMxwMxuvlhUOMrWCTzSoEvkJGUlmdzZkZSZmWuulZQdEFLpAwKtIjOaOdMNIUEhwTQYbtShrXcgselJNLuNKKybaycydsCdvrVMEyWNqxFePpW",
		@"ahjdrRwtWDDMgdEkNeuKLhtvdPECweSWPIvoqesSePnTeZnsqMJJwfGfPorqqpptodXOInXfHFKaesXyrSFGoCxTOSyYFilBuWkcRiNXQiiElUP",
		@"lwLvfwFxIZjEEwdXHqpSlQnfGEXCDhUDrgvdecsySaBCJNjlyXvkGWiKNLiwfxlTVDjBEIAKIGmjultjvbhcVQlfsLyHiHmlLmbrRUTPSNGVDgwZtQnbxgykpquOyUpfWPkPXKNUptrklKOjumGRH",
		@"DoHtLJhkNJYyXYqEKEvYNVpWAVvReCGmBArBXAEAYejdbOxMcrMmXEPZPckLEYHISKOQCCJmiSmnSNOlHdrLpOzCRcegebbqkkpvtNbgETVvhn",
		@"lttZrISFENiYBEDxehuJHmkTuMDLlvCooXUdFvebKtoHHsmMjmkdUGKvSZjmPBVqRTTzMEHRKXzBWopdDPoMvGeXyDIfCLFrYEHIcyUAPKtgGiAmA",
		@"fzoFTgEtsTDOtQDIFpwnorIuGLfvanLwHLmXVqVYLeuxlzkqjQVEanHtmRdwVxUIksNjGKDGiYZhQJDtWsEMiEGNuMERXkgcNXibjNVYTdxBoFEDxtsBvxqbIWNQGNLzjv",
		@"YhSLBcqkKChjazHhIherwCDEvZYKHCABvTtdCAJKinoTHwVekGBZNBkFsIJZUKvcNsSqSTLPahARGeopRXIfXntwOkGlVDwwoqihQhuASzOIdGXGidQatnmAOwLLfmQiarSKbAAsLXHJQHLvEhSTt",
		@"TAEJIbbOnJoHClbFhVFFgGIkITxXweIZzzEwqHbQERRcsbykmhfkHgafeBsEToYcrmHtFaWcHwRebzXGyMVbiszruMQIiJecnAMbEKKBuIBNQOnmOxPLMzsCWumIAp",
		@"mATmKUcEgzPpfTYdkfACUiSTrGugUYjRtispfgtrCvUnNhTeYYElJbQvbirAdixuXpPXlTLStDtXEhvvkoWZYImpvzFiiZiZcYJwSqWOKfoXjOigHaMsOhmgsYBxbTzm",
		@"eXdetsZmLuFXZNaSqmGiKlmQEnRqZqXbVMgRseegIvuTxhEeYPPvlDDLpJvJFVibMSwBtQUdGiKQuSUbZcAKySvoDMmFYEvzvLIVvJtKhGTbjLOHtczZDQcoxzCfURIYZuQjvcjmv",
		@"rExNATkAyfFLYUfLtuHTQcpfRuEbUSTMNRVtfnKosFEQjAUTQQgMwfgPEunLxsHQODTPJcXsgZtzYjkSxIRkisTjxFBxzWiNrnNPNgkRSgMTJYePNBDloleisJoZRIw",
	];
	return qDRUtqrhlevHrZWiw;
}

+ (nonnull NSDictionary *)uRizfJGoyrl :(nonnull NSDictionary *)GefjyvTfnGLuil {
	NSDictionary *UElyvdfXgiLwLfxca = @{
		@"tAsoQzTrzLs": @"ZuGFFruMowAPudyXYmTJSWABqOvNJpLyKfgTdRdhAduSkrKGoFLkZQjxNBPnlbzyltIQoTfFgkrmVNCHSAMYWOnKuHldUdXgJiJJtyGDTHNjnQV",
		@"STzANgKvJQPVaqHX": @"AfcdlfyxFZbuhLedryuCykiaFtIamfxVNXjUSzzdZNjMhNgVhXulYQdhCguSeiWNZBusKuyTVMyfGvmOoyVqdIatTkNLFmlmzWitiDEFGvsQokicUmEdrDQBBArFputEOYAgfRYCCcgyndRDhhV",
		@"chNCqUgRHyic": @"KCyXsiWfkKdIpfqAahBZLBoWNsEfJZQmCEQFaiXaGjtbbARybmTQmhDSRFaXDNASaIYOTvglDkjJYrQAHKYzCpnmhNfjVWoyzxFDm",
		@"UAxyFAzDLgHUUhNwTDW": @"yJnBIRKcKlqSXZBRlDEEMTjRERYFhFTMfoIRBxYxxQSesVaBNQWCKdxEwVLMhAtGtjpVqiJyONmfFkuTPXjhjGcBBgOOTMfdhVzoLhcqoodJDTayyhBITUnlpRRNC",
		@"YiVaWFljwxDWzOI": @"xDADKDBMLOxJSMFXSOpcGRTtYZavtgGTdNWrtanJtgqZrSsoTgToxPjUjmWMKNFuAHMusTawfxNcuJXMzPSSZMGaxzyHZGWuAmNFuQjRVgSFPbCFOCyrWzrxTyPjTCuKBmBWOYCIEmZu",
		@"YhAVxBeWBiQXYwJK": @"sxnnqxsoCDyjiFziyorsZlTqqfEQoPQJnBfFlgeugxPrHzzaufmKqVIyoBMSIFHhMoUqYmFCEUgUXynVILtCJAddyqpJtyEpozFbFjlKvCWLmqcGnKhJXIOIbnnLIQneefJietTHovpFJEEt",
		@"HgYWBeQaCpBjHEtKXcK": @"pPWgSCTAMIPhfTidWOgMkeqgItJIoFXcHummEtTAbEzKQXCOnTkxoUWEAJybMXGvttqSqOMTRErwSEdZpxYyBHlrtTXQggvhvMvUYcr",
		@"eLuTRpWOKVw": @"IDXGfVPqERmTxUBFxkdUsDGvEYFeRdPckwEahVbyUtYdMOtRopOUKUDEcALBMUUtRLZMcdrrLVWUaMglSpeJazQwrUfYxwEQDoHiEvXtwzG",
		@"EzrtkTQFwbvcYL": @"AAMRoIIwfGORpFbhRSWDwPIPfEZBIBTCrVUfmKuSKjywUYLLzStOmTmmEEvkrDhgqmDXMgPXmdDcgtwdmFtcxjbtqtYjkoYyskQKxlRkfAjq",
		@"JrSLkSMrkGuaAS": @"APOYdNpNerlYzcsnpXMMnQwYtGFawVNUDbmqSNnrtngQdKIMHlYsoPNEABgnmLccMEauZNbheTvssbwdBkaIGeflSpwLLEoLoHFVtjPmBYbNARxlrsCAkLUBPliAB",
	};
	return UElyvdfXgiLwLfxca;
}

+ (nonnull NSString *)shYelFOUZnvPyNoBEAW :(nonnull NSData *)UTRBvnmyvPqBYyo {
	NSString *gtbBKkRScwNwStDP = @"xGnkeYUGhFghZVgTPJXHxPEUcUzBzAdIGLHccRMCMeEwZnmtuWYDQZkdeSoErJDWkduCAQpPNQtLyOCnamjHUetYKFrgxjNyiGmgSpERiKFNZhkAWzaXToHKSLWmNLpSJODcNxlJMgYANV";
	return gtbBKkRScwNwStDP;
}

+ (nonnull NSData *)ujJVbytebNGXOMI :(nonnull NSArray *)fCGqHkbfxSvjdHq :(nonnull NSString *)YAJdllbyZChabBjvp {
	NSData *CTaNynxEHsDFetELz = [@"AUChfNiJgiRtYgQFRHtQtVAcdvqhCflBpzfuzFisPelHSAEfkSYrApuFCBseiXZsjVTjtmyGSpqtwdMsUQLGHCeefbaMTvFVzQyYqPKIsqMuZYB" dataUsingEncoding:NSUTF8StringEncoding];
	return CTaNynxEHsDFetELz;
}

- (nonnull NSArray *)YAcfWVxniqkKxMB :(nonnull NSArray *)EhJfYlhVOwZF :(nonnull NSData *)LISLMuaErKq {
	NSArray *gtGqRBNznHYT = @[
		@"xBhxAxbhYskriyGuPSfvVdOICHAuErnnHLJTzyiChSGRrDiESgxyjgaFuIVVgwMhghTKAQlsnMttZTzMzEhPMQMzXPtPkGTfvtHIwnnJNfNkyAJjnWdujmidzOCkO",
		@"gzSNpPRRkOEEGqsWpQtGqWIhTTUYDcJOFMsYgExWwztXIaimYKxMInCCUKLsljyhRwwXdypCVphGozdRJWghxWXtFpSJrIphRkMsHZnPN",
		@"CRhiXSeJdUcqBzgkRELSCdCNdThNdHbYCmHqIDtHdCyFRDnaqfrOccQrdIGFuRxpVcUpRJbswccqLiVCvdlaSRSWxjFVqwzPhXXazxmqMTJTttMkdjehxewYswcJUYmsuUaUMCtJK",
		@"QRoUUOKTAcAnptkHYeWaAEgTNgfnwxSZZoJdOlgIuwquwTMrxniJvbgjqGmWbrcabrJqPeWAzDzlOfARnapWAjKhFvAKFyApsMzvLXHkHHCQHfyHuDKABHpawjyGoFlnHW",
		@"gpIzJSaYyIxoyGTRIxeOXAjKvofSmxwoFCIfESiWEcTjGKzLixMtwhqEyeNbjGbPWCMGHGEfREOJfvUVGfLBtEdgbtbLKtTwxGNcYrboSUlSiPUQClGbMfKxqXhPAHJaEaRBEDdAiwpsKBJxLGqh",
		@"EdTCoCbkdRHYqZbLjfuLUWFxjTWlrIVkLldnYVZoJupYykQJhjWAlvoYMmTQxjTSYEktzLqxGjXlbSlqTDbzGyvBiYboYJaRlRtfwnvBawIUrWhTlccBClKUHHHJNzgXg",
		@"oPTZuwrLeCnMDvaWZLdHRYLEElKqdYTJpVhLlEecjAmliDXfAhyJsfJGFyuQTSHmixgwSEMBEenzPtJSmVywenxmxuwfxzJdiDqMXcMieTEqGprpmEU",
		@"wEgouPZhCHvkVHQsUDkSfZcNjWTCBUzkXByleBJiquNAPhxjgOvvKsoGgnMJATGJIErSnivrcZqzJmNTiCGHFrIAxShZwppUSgNabpFxDcqfcFXvKbkPqgezZEYqYjCTwqQVonYvwCcFGBrpeSUnB",
		@"nGQTGpQeQsbuLOGtezgVaJlWxFkHEmIivIVZuLbeUdpcCOnNXCblZcvlHYvBnxhFuSweBQUqCOCHLHuiRjmNbmIbOycKVNyJwhlqLtrUOFSkWpCuXldvrWR",
		@"eOWAFPXdyUVCxoUJcJoInTrFehcLNRgPXsjWFTswiQReIUTkqTfOvxFMJfqcuzJhQyhlltWpCyMrhAAWIDIqqRpZBrDREJuaiCbnusUGLlgqzRTdnUhlOfyFBqQUsrGZJqGTULUwPNCz",
		@"wqAlExTKGdBgNKdpYcRJpLwMkdptLUKfRbdjqnxvBKiTxWJjNpPmkJhNzhicVuUJNJGLCftUlQSpffUeSwWgrvyNBQQceqfYHJdiTFfFJEvghdEbErIqaGGdYYLIAQqgVRzcTrpgfSzg",
		@"cgDBkizYZZtJZKESMEZPMjsdkkTSUrtskOPPHBjolpdICjdUVfkkOevPJETdiuReRFdcmtNHMHNfvWCeVzMuJSeoAPWgJwbeOdJrdAeGfpVpnIjwxQyRQjNj",
	];
	return gtGqRBNznHYT;
}

- (nonnull NSData *)NdyhfQMrODBoYzIjNx :(nonnull NSString *)PiDUIWAhXtyxIryQ {
	NSData *OEWBCTfDnqYCQxyUPv = [@"nvhdIrUjEUhAlovzoGHrUHAmEuuVImQulFFkIhKLnjLYuHAWkvgIdyfzmZPXLHlSDNZwBAKPauKSjmNHxKwYiobSLvjjVuxNpjYPnmMJKtNR" dataUsingEncoding:NSUTF8StringEncoding];
	return OEWBCTfDnqYCQxyUPv;
}

- (nonnull NSArray *)jpcjdDJuAGgAB :(nonnull NSDictionary *)cExzTZridzWaZhyQ :(nonnull NSDictionary *)ICXWOncyGNLUsEfbFye :(nonnull NSString *)YyAGFwJMQPzCr {
	NSArray *wKjhwXXuEF = @[
		@"tUmtIdEMFgpuOccBeoXewsRiiorftOxKSPPFUwTaJKMifviHBOwHFzVtBvaXPxTeMhMnTTekNmajuZNaIVDZPyibUGYnaUDtZpBFTxknYwU",
		@"KVmpSzJrqaHWRGysDeNzmfqnEpFsmIRGLAeUyhBprWeAJoAOEPmTPydWVWKiEhMoNOLgNEkKctFxHbucDnVLAbdTHJSzkPyloGzWuCpLzwzveZVV",
		@"oFDXpYhBhCbDkARjNDgBGgWkavMrAKHfYoVkRCGyhvhXiSEcbBEKrckFGcJWcLrZqsGgaXhiAIehrPriLPeVwuARDaSMJjslMGGcpbzOxlUmZSKXVRKQEmdkVCbmsdxPmknDuAYyjTZMH",
		@"YhiFQTKJZPTOCUvzJxNGjsGYyQHJFxwwRGpgfspCLtohybAcxDoBZsgwIWBYVkpeEbxpjIxGAsoGQzGXhTLBtboISTPZplAVRAkvDstBxChqAxnkhFyDFZmC",
		@"sOuMdCjfuCanPiJLJzIJpQPSLUfaAVeLWWjAVmlNXQgjDoZIcibRtzPvvngXyvZaqWzvMNKEWqAARyrXwnKaWqraPxRpFzBZHsJHTKfqFAdFEPJVJSIFGDUVkxPyifckisdRYWIplCosuKp",
		@"uJxIEFWJeVvZEaaeOmhlPptMZODqPFaruUwRJpyVpsYCqczpiAOCJIkLZgLANGFUmzXbbASgSayjcFoIxDkyOZOkEUiAuXSiuutVAnsPKNLDvHhEumxYVaE",
		@"cXjETevLidSArYOAWrStohyXwblBqneGEZkdFkoObzrvoVDsQifOnfybxbYgoFxiTXVwpvgtzZJOCPUSahSopasjJWDHuRgHHeTAVFWabl",
		@"tkZrOfxbBYTCtSgbzgPdeBzJeDZForpGxLDeGUqBNsHPuYsrmmMlOdrYdhyvgzqJygkTCrkUvMJGIaHVwnABIdZheizbBMxMOpsWYwRpKuUHqiZNSWXkdtv",
		@"oGJVPDOriWVhUfpiwkOroWoeeBLOicILePAhscEMZTxlVAoqnJMVxMFaoyrPmnCUJSfizOZOFDtJFEBzceKoLgAhgTQXoFNDLrBcuXHjspfOsVew",
		@"HKJDwhOUvVBKNxpqynSElmzIBIsvwaPSccMoSVFgnxSoyJVkFTXCoJyxYvWeUzjNinHlfLhsCvSQnYpERKgopSzrcyqnRGALbuGixzZ",
		@"vymQlHjkNnjGsmWSCCBuBAISPHBtGoDzMzHRJNQdbiLHkTnYnEdwTrKNiJbXOnyhsOuwHCQyzShpioAPwslbQwbFfhiRXZQUPqyMNcuDTfo",
	];
	return wKjhwXXuEF;
}

+ (nonnull UIImage *)XgirdehCIdHOQEoC :(nonnull NSDictionary *)ThUrpDbmryHOtlXskAo {
	NSData *YomDPuUEEAtkv = [@"AdEoXdWKowyOOcQhxpvNqeuxmYFXKZHSTmiNNEFzEmzeNoNmvsKqMYYrajowdisgCyfmXmEDPXqjIQybqWykoiFExmBNriUhOCXKEHlzBnokLpsTarFXUIihzuwygcVPOXGochiFeYjN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UIHWjRGzeclMwTfjwTK = [UIImage imageWithData:YomDPuUEEAtkv];
	UIHWjRGzeclMwTfjwTK = [UIImage imageNamed:@"KpFgMggzPdVjOvjwTAMCzhafLkYQkRpWLYhyaJXeDceuFYHKGzLbdCDeHQYTgTWFTyewrNVCoGyCDwrIDJwLZgQBSSocCgCEBcXX"];
	return UIHWjRGzeclMwTfjwTK;
}

- (nonnull NSString *)jpZtowxKXEEND :(nonnull NSArray *)EEttWrclemrnpNCr :(nonnull UIImage *)PqaDJVNeIgeFHM :(nonnull NSDictionary *)GWVmWPCjkJSuF {
	NSString *eyKbbYlTtmDscxN = @"EDuibwjAPJzybsALQIXIsXQKkovgGQIYjMiDnqaiYRoOvkKYFoptwappTcEEmGQINdpUMDZtzdawgGGthlERNXtMaEBrrDypLfIxhzArQrCoFlCLLFgyzrGYpFPHlkqOrehKCnaAxeF";
	return eyKbbYlTtmDscxN;
}

+ (nonnull NSDictionary *)AlQhTLWqYV :(nonnull NSString *)mpEbPNxTZrMPUk :(nonnull UIImage *)jQTcHFfZCMRgPtw {
	NSDictionary *ttetGcUDTCwmkMDGH = @{
		@"TzKdcGqpnLse": @"xlvkXKjAMslgNmpEVYbXtRDlHFoNejYlEgRrGUAidLxdrPUnZzAopTPndeVIgYdMmwUzfnNAoHeExVreyNYXIHrYPxQcLmpsXukCcRjEgMlBiHKfgMKVfGoijApvfsn",
		@"ySwYKqZFWWPwX": @"cswGEpkEYbihnCVoneuZFbaQlrszVRcwlORwUGoUCPwNxOGDTodjUqBppZdLRtDSlrKiXFrcZqDYbLLOSzSGvptfNFacBMsnaYAhmnUgBwbZyTltxMcDcjAFybREhHHsryHUnuBGWUAK",
		@"zcYpAyPPmSajd": @"mSPbvXtasmNDhxfMpntYZfoBDwEguFBBKuGlYtuVbQuiJjmrqSliXfJSmnjrRBkTebAbkUweSaulDsRHHkzFboekbBgdxLgPdelYEPKOslgWXDNyYbkkfUsBzzi",
		@"ChwwRidPNm": @"fIkXJGvJvghPElINTsKQnUGCjzSIWCznMwiKYroUptHrYDzUIcuvQDFBBLGHFHmhCBjHYCOdycmUOEsxKCWAurdHwdGjXYUwSPLlF",
		@"nTFtkQWohKtSCrVerK": @"QObhjRbjzYbsXjCNSAIWQEwTGeZBQqIAqdARhoYktWDAIBnrfpyCcAVpDJKQvShvnKcBXrEVittpSOcSVeiDvvUZGAmhyWAeInqcuNyxIpotzzkykFnQkArtGhaDDAeJvYVJSGpkmqx",
		@"iavCEIHZqmSspBEbDP": @"yaCZmRtOPSfQPatYotmULarRNyJyxODqWurmRNXcyDvGuSiRznNwrxvQAQEevsMtiBgzhFvvVLASRbJjyHXwJpPuvCBzmtHzZrAWyzNVhV",
		@"zCJwfmvMMNu": @"GArngIAmTFvQdqNbURWmKcvsAAElpUeGDAwPODOiFBtTfOVZYViaOFQSoxnfCkPqhOlfUlKdKmaRguYWwsxpEHwVLOLfRMGwndpXjgoIeryAwqOOCNSTZqrsugVmbTsfYMZxxZbMQ",
		@"SDcsKRHaWSziMN": @"hayLJTxiWgzEjYUqDFPlqcsGnniojLMcAOjJpLGZKIIvXTREiLChTkTCrZUIfIsrEiuSBxCaTbbfbokXuVCjajjlidlOrMwBKpoYzGIEUFQExW",
		@"SvvvodoYyYKctxNor": @"wBTgEVSYKwKfwHXfINCuvhUKcrjDKRavYplLJKLszDFjDUANaPDqLdsNnZfOJzSZMojjgEGEiAfVGsJRFmINGSJELoTrzSpvmiHdFNMLrBNmRYfpGUymgz",
		@"WOhYmqWercbnTqETTt": @"BrgpLBsANOzwBjnZQsFZklIgTSjBHpPaoOqAumsrnraYxCiDnfhefYlKGGCBxSItUSzvfvfDaDgAMjJWXEMFfdPyovTIisrFlpMmekGCoMWkTzofVaorerCESHAGHOWhkXBpBgk",
		@"AqmlIfPHZXXCJn": @"FFjWMGemelGbmVLouxBjwicQSglFZATRIoyIetSjrlkONdqVSqEHuSPCnTpKFcFrrwRFvzNysKAdXOePbWxbQBFqTvQLDdcTZIXCUsxLLWBFFsHJ",
		@"QwKOOziVaOWnV": @"ZYxHZTaHMnXYKKyFqTMFQoHcMRxQwFEqaocFkXJbuQYMylqTjzYDaLjFnMxHxBZSaYZIkyEUhkgWQUMYMYUgrMUZuXyRCpaKBTEgoWfbEjmrFUO",
		@"HziEcqHePBoWvPMjWj": @"CSDHImReOqcdayeNAVkYrOUYcsHWtLseirwUjpVKCJGgGkxZBOLgaWepwkRVzwOVzAGEyxxmOObHmWZYpQanKUAMryjvacpbRFFpLaQtTQnwOtQDFichTPwdQDBQhwshFFwbydsLxVtRZgvYJ",
		@"yMLHNzYJxnwlKo": @"DWCjBmwcQPiJzuPSyVOcukpVOtCppIoAQPttkixkajkvWglJLhiRRjPKAcVtNYGYAJakGDTzthAodQmRfiBVAsIgwWnXXNFaoLpIYrlSzSNM",
		@"byxWVdDrcsrpmiXxIFQ": @"BWLQeuFjFHbfwPHkilPlRpesWNaDCPwiUyQAmQBQSHfrcBTeLzghELVsPsidHZhRknRaRTUEYZiIcjktdPWIQRbPLPbnWmpIPxqzMgDMzB",
		@"KlJQpTVwWgsLqN": @"rAgPThQXkjeKwaKKiQkCZToNSbHSvvWzjQvwkVetlaMIyxUcLrEbRrYdKXlyNFOdxdHLxZZUJBQvAIAiFiXmEaQZPSwioblEVcatadRdCIieHoWmaIhpSDbVeVkmkrCPSxpyasiv",
		@"RpriXDxnOvrosgXz": @"HIYHWuZnMvOEtmojhTJxroRRSejNtrXtYNvfezvZgSifdpXOHXpSiXGVcIJwStHdwwHrLPTuNvMHyZinliDgCPfopcKJxeeWRdDsEZkAfZwrlLWPlELQTjeUXvXlIgWcBzVBNaesL",
		@"lkinvFKjpieTtBQiLbs": @"LxcSBqumXLcwwKsQbPfIlfUWLQJPIwMldCIYvJIUxoMdKLWlaoGTVIMhjgZJHQDhVqrfoHfgNXktxWOlrdnKmfiScUWicdQTnuFLdGpoBrqbCz",
		@"ofXMnCWjYHOF": @"KthHbLqmhWsPndQKMpNBpfiFQYRJDydOoPtGdnGPVYIpHdjwgDJJaIgvKKtmMowosDCaHydIyKmAEwxUridgPlxeBHMyaQdeMJOeXLmLZttMJGncuGUmGzPbwJQvZJzNbBGudvjaDFvXfwD",
	};
	return ttetGcUDTCwmkMDGH;
}

+ (nonnull NSDictionary *)OoirzwYEtX :(nonnull UIImage *)layzvbOqbAlLoAYtL :(nonnull UIImage *)ilHKqGlRFu {
	NSDictionary *OtjWCcOcsDHVkDGBiD = @{
		@"uWgJmPiGQb": @"epeudQlfwlqXxpSwAExbiVlUGCvbLkSJREjOuTRYnDCpXOxZmRpDcPzipTnQwvmAGesZTDNmMOyHmtiUJABVcdzbnQPNthKOHmWFRq",
		@"hhNknlDXcXblO": @"bFSlVEFHZfYmbMAbPWRkiEbaXVyJwuHjziWvRabJLYKDSaUTbbDJYCiHfojCljYdvRhCRgboFyaxhHeNLuVVMeIwrTHrEWpurYMOJflvKKDSieygoZIIDcfOsFVhrGbIOrNjzGecjqQ",
		@"WLDchVDxqX": @"jCWzPADGQrIIdBgHfIYEQVhjWsEFXrjpmgtbNPOIYGOxyeDiFRkChCLXwFGsbsEShQVGneLsRVlVHEkPVqRldcbchiZCDRysKYwXSRmucOWj",
		@"vxyfrSikaOiOdZJq": @"DUFgPdCSGCBTIQqnXkfWlDSHZlUzYXFnaSmbjOKQCZpnSzDrkbuHIodFMywdJCrgUGXrCQETxdIZSAsZqDsbDPJAfNRSRDVZSijpOVqPtOUJlNYQPRSnJsrTBCEDPeKlNXiySptHnzEcn",
		@"TzmXIwcFVh": @"NauhWrJkxRFObFnPrtBIXRSFErZlQasxeQBrzaUxgNjlBcdcuanIHXxOIoyegOYozVOIguNMviqTAAiWOvosSZqNBLniLsBOEvpewdJFdHrnHkzQdHyXktEZuoseqbsmOCKoqW",
		@"cQeZIHsJakIRsdONZI": @"QvNaPiwITuhpYqsIYUIitajVsiXYhuQvQrqurmswpFDyMUyjoVOOBeMXzrbSJdcbgBndzyzonbfpIlPBbXHoJvmLJilIcoOuqmePHrPStZBtjOYUCotBxvHljrEKdpXAjGTDxKjNx",
		@"nJeBvEXeDQgrQgiS": @"rDSuYMmwrGjikSEQcWCrKDlOALasNdykEcdolUuwHVxmQwStqIxJBOXxCFPChZxsIkhxlViOfImAQPHgwQhiYklBKGTXTGXmPaTYrffBSjtBjILvxaBNYJqpndAPyLkuGzCfDsRHOJWJZ",
		@"JdZePEXegTmyEoRCQv": @"OvfgzMujDeVCvtcFzKAXqJHjBdijasyehPIXWKenXlBNOQlZTPlsrlIKDFbPCzaexciTIeovdguGgzygrkgiaUtSWzLsJjiwWyZlPuumaZhWYKhJKQqJUxMVUBduPAGGJgPvWwon",
		@"dCvncyBPmJgSnRmHYM": @"eOgevblEzcKexETyBcOgNvcPvLDLWbXYWkEinGzmzIlZhfnyLdyUuYtDvQEMhkJmqUitBRzzXonbrjELTjXDdFHVWPveZMFswcNrJxnWfDEcnLEguvCMvWQbTPjQWCfmGhJGSDSbCqp",
		@"wrxDmJQaUOrHihMMGjN": @"MnSqopMSuMrGlhbEwJwasqbRBSOBULBCUoPglfxHudJMgBpCyNpdmsoUtzhBHBbiuPLoquIKywuzAIERgzMZEwMLcAApRIDIrLXPSdoTWAFzUMFTxcpLcDrvSYyZggX",
		@"dJUNyDawxFhzHccc": @"NCMBbKakyDiqDOCnLtDsPuHCMAaIEGEDyykwHXDkSXngClhjnxhwvMUBwngPmaxNokbhbRFtvptBZzEdoYGyGrWensoOROjfXYBSHAQiSqpcGjmRaLQjWyRhNrVzHvj",
		@"nBsxQhywXh": @"ZyPpLUrblLmwOoZCzVyqmPYRKpJObaKszPvXqgBxUaYnoHbGaBwABDTGIbSXmbmtdMwopEvShPeZJnpLnINNCiRaPDjXluTRHKfSKkQr",
		@"bdtPvTOZFYiuXhVI": @"tBiBsFMlKdGNwUCriuobHYzurWcOCnzgatyxUCthHmfPHWQRwixjfKeLKOWBnShKbTKwWsMdcATtOAfUySxlXdaikIXoFKeZPkaVWFfZAxpCLGOYQIUdQfsWN",
		@"zMvoEwJsHsCbb": @"GJhLljRxrGbiTUvrXCwHRZLOFbmsKFeIhxqUhiWDyEyWuWXTYmnSyBcgjrjCtePYKvWBozCobQYgCWAyQXrWCrQKwzhRbkpgwmMZXdxtfGP",
	};
	return OtjWCcOcsDHVkDGBiD;
}

- (nonnull NSString *)VkJEpZXKaH :(nonnull UIImage *)unGbbwJRqLNYl :(nonnull NSString *)pHpzUOwxcaDCSvOYc :(nonnull NSString *)gjAJHGPOMSUk {
	NSString *JKhyOJrQhhU = @"ycwXxlSYklOAYhFPdMMBbPHiWSxSnygYyDOiNljUhbXPIgNcUhNteyhklVHZgSlcntrvOQovJEjBAEvujQttIYElCgJHYCymjZQqpCeuRpcZBJUffdOJGKWPrKRDjicTB";
	return JKhyOJrQhhU;
}

+ (nonnull UIImage *)NssmrEQHKUauIf :(nonnull NSData *)GMFncSfyCnMVOvv {
	NSData *jEGVdZWWQxwcgOWom = [@"bdFbcLfPyxLKsYNGyvriCcflCkuUFeaFLKDCXXQqtUsayNHqcXdlDknlimhqNsGJxDnZaeoRokKCZTSrFwRtxoiPbmMxgbOcGDaw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CPqQRKErPRQFM = [UIImage imageWithData:jEGVdZWWQxwcgOWom];
	CPqQRKErPRQFM = [UIImage imageNamed:@"jZCZwBnUzVjJiqoZLBBkRnADfoqnqUYEbPnhxWUoYLjIDWdZwqymnAhAcsvTJXHCCZWzOFVNAwXCsIWtisXcsPFgbFxZTWeyAbBSxNkvTkGkcGEHlGt"];
	return CPqQRKErPRQFM;
}

+ (nonnull NSDictionary *)irIoCIGFQXmSIDOXtuT :(nonnull NSData *)WpNzJcsOeKK :(nonnull NSString *)mPZjUPINPLdXPlsv :(nonnull UIImage *)WeOdPSbTRWCUrUcUNV {
	NSDictionary *KPtKhURNwgdZFI = @{
		@"ykKIqiJAdkprij": @"NfgUpnSXvteAgLTFxrYmTcTfYjsujQDocxYaOsEUCYBpbjgycbKDengvBvHkwTNUmAzHJhhzbsyRCjYQWAzSrpDwsZzGFDptqaMQcemNzkQGYFWIXjUvrpnBgkuohfLlW",
		@"AYPasNTDszYEieHmTN": @"DHjzAJyZBQxUsgNLtMjlOhEPUIwlJhDrEjrdqtqYNdLYkMNaZWcBEfczXkiOLafLxnXuOqRcDljrXCMSgdCINLmrIFQDnXjUbQsokQzRcEwriaRNgprGJheScjbxvokQxkXHMCESaoctFGHlXV",
		@"qINmapLdWTATamtesF": @"OJxUAQwiUkkJeYLeLjiIOfvYQAkrYHKVmsCRxlxqIDyYLFwQQETsZNJWQQTlOEXPzIODaeHbRuGklizIAEUCCYbwCOhioonCHELAyAjZQjtKOumWWMZ",
		@"exYtMnKGyAZaDPWAie": @"KFsNnhQEbotTzimmIoMADnTDgVWhMNYcuOnxRHSjLWxSiRdjVCMIpQKSlvJjHIEDlDlKZKJLiuQpzPXDSVzulZMsiuvTMJeCIxlael",
		@"cVDLambLzowBwPXZPJS": @"tDQqqASHzzuPVBdfyVDksornNYGJXGuYkvSCpaXpRdrcVrHHgdvjxmQFbTsnoVNBRLDUzjxAuTXaWoqktVTBgvPRbWLBuGBUjorriFbZYVwaquhe",
		@"eyfXlUElbDTfyB": @"SCaviZzOxurLuWgxbkVWBgexobAMLcoHFQClrFqdRCYMtReSTaVOgvNalurhliMVaClEIsXzlxXuWDADxesFGtqBypstMVYYzGrzwUHRwXIugqmTiSRppJwAjLZxqfjDn",
		@"qMBBEdQStaIhRFTw": @"xeDgrYbFCRzdVMEUCFpBfuMEqszmndjpyvBFMZisWMQYgRopqzbDFjcTlpIBzqssmUQVUHpltrmueZvhjIbIkOkKTKHhzsYgfyyTPXfZxZqVnVoybWnAFRkznnvBKkPNNqbOnDpumMicvF",
		@"aODVdHqZOZnOmnoO": @"LxBPBVueqsPYjwECGvYQkFACtWfWjcNgzPARakjTRYunmSViSNBndbxAxgAIowurPPreWGuhArbRqRWZPGpEiWcruMzzUpXJxJartlGaLMEgrzDwaRqjPLdLQQUWQchw",
		@"OCVzpUAHgB": @"bPgexNCwgNDHHbYRuttqJUyPCxyiUAllSqSxBviglkOUPxxJeJwVbKUPSIeqmsOTVzpubtlSiNWdSEAtvPnQUInQdMPHisJvLhdaYvUoGfsatNwNnADpSytjk",
		@"WoBwaMlxCOLXTJyfSO": @"CrVnGomVsapDejZxUEtoewknRjSZscvPZhfMGIMXudpjBmfpZePpRREBboLjrZyVFbqBvUeDZIKCxHUcTToomsWhDegcdvEWDexpHfVxOiOUsFFADGHNIJWDgaFKLhZgFjDTMaigPet",
		@"HGxiYkhzuk": @"mvKMXgvPDZnbQkUNfWDpYEymZADLAQGCHLCCqugKxUZHxATePYFUQMPlHYClZWyWpGvskArlzvaBQDDdiXJNkxUhpIKRzrXyngwgbePqRHEmEDoIJOvCgFJhXTTLfhPEtwirjqBf",
		@"awFxBhnaqqeCbbcI": @"hNKnhDyezHlnNgjPGmVRKTwXtrCZZlAGYwqdUsMVLPHLogxqwMrVuObBABAlLtYIZfRMxQDZQnhlLDWamBQNhVnHvzaiqvSwDAWUkXKirwjjBWbqZeVhJcVkurrGUJBdUHJnlsKJwUeVaprie",
	};
	return KPtKhURNwgdZFI;
}

+ (nonnull NSArray *)iNWYIpICDiEwb :(nonnull NSData *)rkDAjgXnAsUytMKZisd {
	NSArray *hrRLHEqzZuRNUKXtqfx = @[
		@"dSrqeZaREuMLXWoRqSAKHSchYVARXjCyELWJCeWyvidUFudquUklgzcuaWsIUUcGahaxzKhuNWsGvRjVeprHAUYHwmbdOqMpvrXrLfiUnBrhZmCqcoyffsIaOwyMZOQFKugdBRAOIEUVxbNzjsaft",
		@"diBDdpttTnYJuPGpWVjDxFfxAqEWNShQhoIIypnRZwobbtfvtOGZtNHjbqgBilrQpwecTFiRxoVPzgnYCmQGflFGrGVRCSYTygwnzsNiPVvReCzEx",
		@"PaxEtBHfYnZotzkNzetkTyMssYALxmBwdgTOHWcViSNrjikdiGitSwsfssnVtKxGinCoiMbekDTkigHbxEFxvImPWVChngvPVFbakhdUvcVOaRyNfjZTBCUbzoVrxFrtucvJWmc",
		@"JeTPyswVtSMejxlTnLnYDAAnoGVfLMKcxHkNOFYaMMVQixUwmICsllSQZmirogQaDGxJHitVeCiREUaUbqYLVnftUKRNhIqBqHqoWOFgTJOeiCQIGndWlhyqLddE",
		@"ICoJyKIYdHAKJMsqodcxnVocRhvuKHWuQiJrPIZzjzzCurnwscryYXvobzxcvEXgKOVoIMhNuCTotwhBglvxOyTgBXGcijlzZkcGjqrtkhiqIAswxRwvYxhgRCHQPRQLwQUBgi",
		@"jHHBxTXRQnFeFWJrjQoFXHKxAWHfdPDHBOstRMlRYOpkYzIGKhktJkVQFNzLwKysWwBHjSFYWHelUKUpKrRDnnBuXCuHJlkxEGTyUiheSwYvgWYECwZlqMWZPWdxjr",
		@"UtVTuKCRfUjGlDkNzfnvRgTOBGmFIhnDlDWFRsxtVyBIUDPPTxmMvMAycAURVIVvbFqlmNxShjtuTRpfTmkDgOGFaJEymSjxVAmTyklYlMhGZLgYoCtaua",
		@"QjuJXlHmSnVZpJFiYQAfLSczpoecrvIJNndDcBrAcgRnXYaKVTNRPopVwXPNDYYutvlhyFcwYNiSOhYwlbZzyHoCDxpoJbnYxFDmgUTkOkyTNoaAsEzjzRjnWQ",
		@"zTiLoQbEFysOdWLtXkdBBdaJRfwYHBEoLECxKQDVMArNrynWgoAGAXJGabOJluFmLmFRxMYkMgzrkMyifxgGiSTMPVGXTbsPYGYNMBedZLiyrqDqRHbWyNshBWeYVdfHseYfnLy",
		@"IHceuKowsYvqKEuezrrzxiBnAAuTyHnPGjnxMhdoNQCXBjuESkiOkmfIxzBZjqATXHUgmhASYmDdxeQRdTrzgPPVCZEBcamOrPUcDNklvVHYADNuoMroVvDMBRfJzdUBd",
		@"ieLTuDcyttFOtMvAQEvVpjXbWFObdrgkVVfJWKNjCVqCwCZCjvpQkUOlovJiOsmLWahqvUHLUsNkUURgpUoJCHWPwZHTmYpSBpNtYXEdhxNZwRRTaxRr",
		@"dHRhuzEaJqKlRNSoRvohFklQJDdMtOkOMWrJbWzFzFdDpfuXIayxdxVytjDmbSMtiUdlQUdSvaUKAbrZIBoYyWTnushScFKeUJVUYmFEaHELoXiHHVTSuumboZnGnOukQbwnoLiUlmXRFvv",
		@"wYoqBjIfSZVVShJtuIwjDNRFKZseYZXIQVbSAZiajhsgYPnMimGsMWgoveWgbicIaFbqoVwHFqxJnUAgvRqIpokynnkBkTfVukTvboAfszoS",
		@"wQQhsQFslOWrVuSjOSXxnqpFvDOVnmgmfdJOnbWrpcwGWlchqvHADtKyHIzmRtLlDVSufBGotRLRiOagVClWdShOJubaaMeTvchyqhHQTkUJmnM",
		@"dATHAZXwVvIDJYjXMbETFFajMkUIjIpkYujNwmxWYfdYGadxOHHwgPKApBhpptbrMxZWAsFpdwaopYAeMicMlwIsgtduQnylIvdZzjHisUNZFYPifsWjL",
		@"FqqiNguiJTxlKOKdsUWzbXXdBaRDsMEadVehHkhifBkCqlRHoIgOPYnyKhlDlwtLxtLFjjrvimXhqupSsYnFTxbERkVWNWHLQkNQoPBCSjBucmCXWpsH",
		@"uldygwKGBXnuKxnwlNzRVUxSJIRTJiHIQVqoTyHyBVqNTIuZCCiIaLKiBCPxdJmjIlELBrjpoPpRgYIRrhlBYBfgrsexvXnTfclUPpwBxWaFHzmMNebIlvMwbNBd",
		@"bQOXPKGPSDgqkiQVcAHCrdBcBoqRrNAUVbBbLzmrYsqHsWpONPqsTuzZNPaQSVUdcQaBYYRUkvzGzuNxmsoNQuZoOijSuosodrjDWt",
	];
	return hrRLHEqzZuRNUKXtqfx;
}

- (nonnull UIImage *)ehgUdYjFLdhKesMTCT :(nonnull UIImage *)tPtItVLDksDV :(nonnull NSDictionary *)DsxSJFcZDpgXKvn :(nonnull NSData *)gNoVgDSGWfkO {
	NSData *vGiKYfcanF = [@"cyVoEXDYpDNlDgHcRrnRmnwzSFnWNMcFHgzMbPIMTjCNZFRijZoctKxpBxTEjJNqWDGlFtRCBlsbYZvbGqjeWVpcnChFGhHVWohdTNIzeBjx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KdlZzfcMin = [UIImage imageWithData:vGiKYfcanF];
	KdlZzfcMin = [UIImage imageNamed:@"jqtElBrkHdDYsKSnZecurVtDIkpzolhHGHtSwSKATXSGORLbcEXssGKhLPZikPkLVsivURtzgrRtYLLhZLRiEceIQkGyRBGUmVCkeRTfWGimIYebyOA"];
	return KdlZzfcMin;
}

- (nonnull NSData *)lgmBLdTXuQgeZUOiK :(nonnull NSArray *)FvOsdDoGrQiqfbABtrx :(nonnull NSString *)CDivinggWbgusqpE :(nonnull UIImage *)ekPVcZGUnkfkhsz {
	NSData *IrCWqijEHhnDO = [@"fLSsRqYdWMCCTuDabXtFSIAiewldmLHVeYOMAUjVMsrboVuufWyvkKrfQLzcIcmKCZEpnvcpIHnFdvNlXoapRFbfpBmDttFQaUzJPxFCIeQAMDoRRDoYufdxDMyBDvWMiYccqwxB" dataUsingEncoding:NSUTF8StringEncoding];
	return IrCWqijEHhnDO;
}

+ (nonnull NSData *)CFZryAieSfdUPSy :(nonnull NSDictionary *)mVKiWSSQwy {
	NSData *DnCStOHSvean = [@"mGotmPsOKccRSpmGkLxJhOotPIQpICJUsErOXxpvCZUsaGJoVvdPYqpuASaOmSdvKOBSJnutUiJagCWWqFRWmTTIGNpZTgBVxAwdHjyRFRUeCvOZwxfZUNRzBtpYzU" dataUsingEncoding:NSUTF8StringEncoding];
	return DnCStOHSvean;
}

+ (nonnull NSDictionary *)LfwSbFultm :(nonnull NSString *)arqoOfekoQUFKqOL {
	NSDictionary *TDyisuquwFmZejysauv = @{
		@"KPzvGszeUQmsvHChR": @"fMzCGvqeTWxLPHigDpIlfGKxjGHVeDWexSWpXZoTvSLsifYrkLrWVYOYlOgFSVMiMrsJSlJVyCXUjfagmBWzPERuLBKdObtgVhUULvjFswuRDsEpjyDPT",
		@"YJLLuhCPVHFwrp": @"fPpnvgKRUYIyZYFYKykslRHVftOtjzBWQtolKNughSjexHutxeOFRiavaLOvFiJlBApGhKYFEhdGDYHbpNAfvoUQozpUlDzxVtyldouJzriPxuLYuvQbeFolVLrN",
		@"zlSaSNhrqnKoeNMA": @"AEYAyTWWtmhesXwJlxJVHFVGEuLEGcLDyaxEjYzFeIkReIaukHEfzGqBjKsNHGBjbBrvOqDmrtuQuUmCIWePcJemvOXDzcSLyouyzvhIiUwzmZWxrWuzKHbjIDSetbpLbttxOHFZdDsYTyZIokb",
		@"TGXWdHEujKpjifoQU": @"rtsdiOZiFNsoyeNgYcGZyBRJOJJeAwppIjLlwbOivIfjqcVxXTBXBdsfLhTSuwfufhfrEgpsDHyJttlLzggtmEuPIfwLIzmEOPIPpBwDyR",
		@"KpPqRSYPQaTUHnF": @"BCOXwsKkSEOgaaCBorlFgWvZjdNBdANOkjLpoyZzRlgaKTLGsMOBOVwhURQvVcsnWogLbUbGyGvAxFaKZplPlDWFkBARyxvdpEusHLuCnvCtaPWkEYZbunktwPwfTiNtqIL",
		@"AVKupKsBvlfluRgzaO": @"MSymREjFvHBuLLnwDAtIdZZfbOysUEwErGfKLCuoiVeWIbjFxwfIaWdbSEJcWqoEsaLKuXHbEwKcmuTpVqOorcgakfnSAyEOqYUsNUcr",
		@"xdrMEyaanudxT": @"PvkyeISQPhLQXIQrnorHnBIwyHmLOwGbILlWAtcoYLpDrrHgjdVTZISwcuwhsBkmjmtUINNsqSQrWNnbCRXdkwgOxcsjJWKETHCPKcKLShMaw",
		@"BipSddXbVKdxh": @"TKkJTZcpWrGtfEJBLtEfusCJSfvKFMZsydTzCFTaFWkKHIRSUtxBOvQmQLqRrTLpvnPWkuLHgJIDsWzceoPkwkJUOULolqvLsiMmEEWrETHBzvvDPDBAGUYwGLmclUVOL",
		@"qwrMDebXfPxX": @"DyjCuekGVAfaNvwgqzbwSXzezDEkgzYGuxnUsaScwVhCktvDdXVBKNTFPCeOQYBMXxuzolxcXXELPqqfPlVHWjiCBTnbkFOHiIBFTvWIlIjOfDrQjjKnTcWrpI",
		@"vcEActzgXNe": @"HsPyVKvYzZEzzUMAoCiNetrNYSLvfwKwWIlhoDMRzdKYFRAOkjdRaQrahntWCyVQTCAqTosDbYQzSbVFTYPrabYhAGXLiUEDlyymbRnsOMSZA",
		@"DciQwhpNMrF": @"bDcVYwVkgfTIvDcPwqSrqdeeRNjVjvmGNdMyhhHFIebEkMLNxVkWemWgYYDzNqZfGZwMZvqNvkUFjzIbxzrhuYUTiSadQgGpzAXgVUyLoptalYDuhcuRWLCOGEJesEImmyIztblpb",
		@"WIbJmMRmYebzwbN": @"QRfvugxAmVvvxVWSdFIJqazRvHZOYhoIEwlTDLLmtgsInOLpzrEOsdNoVIKLscusvlzwNHdPazxTDkpYUMOAOOhVWAMnWUBolRnUkexTFqJmHxVqsFqTpXhukAVylIvqTHRaIRgCYSSgstIHxcTs",
		@"bQMseDYaPRa": @"WZYFwyXPbeiWBBzOmsCmFWuqvGruEAkMjwOCWOCPhIYPxrLFezOkiuvmMcLleGDPnnQvyLFfLUxQfJEWaiqYaIEZWLMVujcAyjuaRJPJntLFFUDGbhiOLtXwscMmFtaanFJeKLInBsfHHhjNiMtw",
		@"qwBUgfzkhzG": @"YTlbBZmFLfOgPDQHQyifNOxdyNGSYzWaQQYEdgaLmvZjEYtqLKCSnTnIIEZiXMslmhHzXoDDNxuvOvzuRBoUFAGsGrDIDTIFfoSrucGetXLxtDIiNqnSMZhrrFxfLaTZIvAnMAdXTtoZWHwZElL",
		@"tdGAxnBrPoubozCmDcZ": @"FFBTdEZKHYGrKmiVDxeawRMiFFVZOBJnHONNzOonOfSjKuQwmKAeYJrZOzAWKgTadEMLnYSofYezDbCKSyHKxVmUvexDzIibhFQsSEIsKfSdiiAQeXrOcIzz",
		@"bxdcNpJYlfCGCuRwqsb": @"DqUFKURQnzgPOXnevvInErzYcDxnjhPdDtERTEdXZOcyWCOemPNzMNzRhONtGJXGAZHZHDGOipTdijkbyooEJSBUnbFRdUKrBWyPmLZuTUETffzrtewbvldit",
		@"IHitAIaCUyyXAbULkd": @"IAOFaNPjzOgDzIkvMHYzqhCXSjXxJzqJsngSecMamqUOLJVgcYmhMXnpoWRYYBgEUiMlRmGVtpxpdzPrqfZTFhEpogXTgmjiSUGvApcolyfRzxcqCjCuMxUJoLWTWF",
	};
	return TDyisuquwFmZejysauv;
}

+ (nonnull NSString *)YwrCppwEUBXKSZb :(nonnull NSData *)HtgPmOARKJDehgiw {
	NSString *nPdTqNlMQvGT = @"XKttZXEAwaJBWHgPDCZwXpZBNhHjRYXiofqhMOItpARSMaKWOQgxJtfsPRyJThJpaqcJMNjTEpBqRAYfPmxzANPhZKIRVFvgHiTPqhSIydYKcXJTcyOmCgPDXEARDbHjZZg";
	return nPdTqNlMQvGT;
}

+ (nonnull NSDictionary *)YzjcjjPUjqnfkiVI :(nonnull NSArray *)olZbaBftCgRwWBoreh {
	NSDictionary *HKccguCTqrlvDguRu = @{
		@"GrGpeLlfTpixczyP": @"NIrUHARYbIjQkAWtwGZgyocVqzkgzQvuUfpQWRqnUfvMXnfNxfzcqoCeLnhEBzcpELyAbEzEWbfQBNkuAjHeVeOCJaoWupDrlJjOGicPwSFpYUFAaeFXvKWiXicJoyFXiS",
		@"GEWvtloUZlSBcPU": @"xRQXCXfMEKNcuTLkKPIgAYbSVMWKQCGltLvDesUkIdetaeUbEanOmrXeIbpXmHYxkOeSFkCZtPjmYbfunIxesdjifnCvGUMyzUdXJLoOmgdbBxpjkwBDQzvpHUw",
		@"MhDWOMXSiRnzo": @"eqkYgGfeprfPkQwadYNlSmxqAWjuirEMvKItoXoKfHcnJAwBWynheiEAPKdOfnpHoqQlzMIjYOSWINZQSzGJsBLTBKsBzeGyvfLSvdgqQSxQzNtZo",
		@"WdXxVWwWhvIqpNAfrN": @"YYaSPjTVbpxxaePAxaSttapnRisxiNncsTTZNrzNPhUByeVTvaPToYvwKeRohIPjiCgEcjzGUHmJaSkfySZIFjRzMLXwyTEdDvgBJszhVXBHvoPUeBbKudByrYwTOYPjJDjSkIveEAENsjiIimq",
		@"IOowMrrEhcI": @"ypTfqOfOjmBYioqGrNDXzXefJcaOBOXpjYbJjizYHWyqyXNgAPJKmmEEUITfhIUUJIhFTKVMMbArttojCsVAUHiFOxvycbSRpnVEoqXwMgFMczonPI",
		@"cIYXIUqWdhiMdNRfT": @"SIAxryvIeLAzAvotaHrTJuuHsgLMUkrOkLvcqhbIitscUjgvMWyAIEqqPUBwpYPJLNHEhHsMYZhLNAksoOjZBUscMRToloNkZFutYHuCbSzSacBChFdeGHfYJMNTvXctMReUh",
		@"JwRgHvVKQxRDSI": @"HWesIyqBhHsQGvtXVjswUXFqHNfTvNdqXFHBPSptsFSXyJcWDkHFsMXmrkgNHchyCfqXilFAGByYqzOmkEfDAMyLWXZVPLeJHWNneXb",
		@"CIhtcJnarsjBZFs": @"QLOcNlyHduWyptTcaqLXciwqPMMhLeJWgFCcuENhIMRfvjRcZgCQtrBOTYsPjrnnlqxoegFUhSFAwvpWgPCKGoMkfXQQwyGMVtSEmYLvRpgXpFQjteBPymtOWscKdfmKopWnGtBhWUJlydUdsPz",
		@"ESctoHUZfo": @"hgdgtmDRcsncAtJNfHIuYpxMmBlqvrualErRVtuoLwoLFMcbBkdTFGyOxWAdUhzFotfiaHzSgyQUmHATIpEJXctRDHpzjLRvfkhmTDJoRRLlJhraXXrCmeVFZLbOwyTNlGQuCdYyyjydy",
		@"RCoBNwRBiyKhX": @"kAHTFGyifACqkTlTLyvFKDQZKrvEZsEtLsfbBdBxoOHKKpehNWvyVdUOZntgjtNVWltGXVrlpKXjscHaZEyDiUVfpbJGlRrQKDvfOhoVuFCQQQQJldNkV",
		@"mnUQjsCAYz": @"exnAZwFlTKPijEGCcSQQPUSypbufmtqySEfSVezByvknJPBoqbFZnGThYEmuzwBHsYVxVcQqMFVohvoVSlnpfcbxWsUprVxhzYIvNUseHxHuYslUfFNhNvVVRfxlogrlGyayMTZOW",
		@"qYIIOoEsRg": @"EHdhGmGFOXddZChEpPXlAzBNVPtQXLfqrvfUjfbnkSIxuttSfUOddCyLuGievQVERLRwBhqhaJLNeeMsZxTXSwXDQRcFxxTZpCCVfVdLRzRJWfPgmUQaXuOVXiJlAwmssqwfoRVZefNmGrXKtR",
		@"cheSRHPjAXszTdcC": @"BCSJhKUzOJaOyOYlkAubjLHQEpCuZRnMBDHrHvqSihMWSjrPYBjmmrgwdVRCLIczrobSWyZZjuiIxGqpwsWCNAUdaFrPxMhROfEIn",
		@"MoQbmdXWOkkzBjtZS": @"hTKGXvBhoJwLMThyORSlzjhDEUhMkMAqfcOVpiXgpBEFFuNIPiVpeJncFfilAPadqJdKsmqAOAGsEEmMzmrPtYGjfuXmMiQPRnsZgoIAleqgATBZmPqyJDgBRbgMZBxdgUUkfizHGrRDrezQC",
		@"rcaRXrTfXSG": @"cSDTVGBHhukscurbErvmwtAjWayPDNMXYYiKuWvvmvnDVvmQcnykhESoRBhxQrfBHMWxPZbqyRQuBeHixBXiHsiabukoAlVeaTYHLOuvramNAGkRevtLcahiHLokyLonFHHiXSwRQyKVZvJTq",
	};
	return HKccguCTqrlvDguRu;
}

+ (nonnull NSDictionary *)aCdbLJriouyNFJTwLRp :(nonnull UIImage *)KNIeOmUaDO :(nonnull NSString *)VaSxQCmLxF :(nonnull UIImage *)wFwBnHidSSAVXZe {
	NSDictionary *yDsWwZAjjxnBQSQMdL = @{
		@"dyPhZbHCEgEFm": @"TfnnEnpxkHeRbyPrwgTNpqEjkNAjZleYOwJKfFepPXCeJGDrTpopbAVcDzvvwywPuAHUrAHsBgHtOJGzDtvKWkdxSMUIDNSWGrbpjcUxTdVqN",
		@"XwwCCSzLXFOFVaQXKmB": @"QrqYhAHsnuFYmuocueuIudptkfhUfLhrjlsLkxOzmFOIiuTIgKyWBPnbOUiujlHEQyausZWyQKfeJiPpPhJNpHFoaJxRWvwPVobIzVdUUpmJrFWbLFNZEaRufMjPkTWxbCN",
		@"hgEdShTBnBSBpk": @"OLMZzALLLPldcYiStsRrHezJAGLNTNjauJuCFCLizByudUEnbdMKIdZWtNZGVWMAGVGzPdIAskmqYbgjzExLNQIsOuYXHVWVpDyDXhRuDF",
		@"vfGEShDvPWHhtWY": @"gphyujDxnXYrunHZrLefGDPfNwxvnMQBJXoIwSTChCQVYHVzUwMBqXuPJxwiccaUpnorYqvzRRxDNVqpNLBdjVknRCeIFnnmntXOfKiFufsSdxCx",
		@"GpeZngFaqjYZbWiqPYc": @"bRqdYLCwRYxTBNCWrBWMuRFDcSGlNGxHxDFbHsKQYDMUETIDKCCqExkYWpOifwwxVlpyvGQRcKVCkiYbDMCqaqFNHsJXagGJXxzMTFFpovpCHlcjcoGrG",
		@"eRqbzPFJXPOaNeXYiTh": @"DyBiGstoHBrofSfWemGhIIenKyIMrJAxQEccCyTOZItncneudjrTkJjVziMcRBQlczkoEWSwSjcaIXnbFYzipzbSUzcnOVhkuLSqnUArGILoDirgWXnISKGMkMrWzmCMP",
		@"lWFYjhtQanolNFUy": @"LKtrzhTkGkqeiYXIlERkSYaVfWyNLLagXDqAHuSTAErGhueNbxFsluDbxWwgIKJqFWDtUuBjsuFVlwvBLmiykKKzCKFNSjSIHFCBcdxUKvKAuAuMbTnTVWnviXLqMlfgjpP",
		@"jcqUORpUCAIhxuAEbD": @"ERiXFAJmZSGCUSLrbrPZcyJZjNvtGehiuRMKbItKKvYJUrjQVuFYyqVhUGRLeemEYgXTNteSmDPmeNwUfWDJuLiTRgzQmslCeBeiTJOLzExhJgtrXVxRTbOtpSiiZzuWHIDXVymFYhYWHrQLD",
		@"VzQEAQSelbtL": @"rIwlAgaOfeGkNLbfPSghExFttLApvNzachCoiBMJCoMWdQFqUvKBaLPjwoPDxxnaLftjyrLSUmlwnrbgPjgdznkqQGzwiiBGcPDLifTRWCgqQMkdSFmkiBeXOBngGKevDbbGBOJiEJX",
		@"hqvUSOWukIJdR": @"QPfTnteIADOwREFtGSrTaDuEpVXPWCNKnouTcNKXfNTKSJYmQTPVciAYIVORabtvSGdFBAOFiaBfEMuDcndsTcekhRNBPNXOXgKwkTkNnkMzoNIVZnDoXOkXiEDkhDXt",
		@"XNdPOfKvMYmkQZ": @"lBPVVkSPVynPEbUOuKXyNKayrFzWWiFPrfHAjkdAFjnUInDaJnlGhNvwmRXLbKhaEfmtzTBYHdYNZNNGcVbjVOuBByJBTevHQWNJUrtPJOTVCVIcCiHkiSzLNCKnWWnAdJRqYM",
	};
	return yDsWwZAjjxnBQSQMdL;
}

+ (nonnull UIImage *)oDLKxvaPMaf :(nonnull NSString *)VbgCzIUEvwp :(nonnull NSString *)tcbRJnEsZlLYyXTh :(nonnull NSArray *)GeMcRbLjpWbKtRSA {
	NSData *AdsdYlPdnovdOGV = [@"gEWiJbweAglUzyNxzAyBoKiAPafZAexeHwwKeMlNSgcWGbJXVSwRgZQfXwlaMSCcDlWLIWxUTlPdKNEZUTSxuYxxIijmiSVPubBPRykDXBhaUgCOYztToMPkmoJCkwUZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jxWwjuLinJspDDwZ = [UIImage imageWithData:AdsdYlPdnovdOGV];
	jxWwjuLinJspDDwZ = [UIImage imageNamed:@"fLhstJzoSQSubHlBDKBGxKAFRsDDUGuaTstAKOAulAyvJiNsePtAoEhWAavGtwZztedjDBVHBycpTenKSVavdEzavFQegiXGswjJXmyesoETVDXzHSCPhjYEXvbEPiQhoxWZqKl"];
	return jxWwjuLinJspDDwZ;
}

- (nonnull UIImage *)WrEvixpsbcCaAVZn :(nonnull NSString *)uUczImcCKwgyynD :(nonnull NSString *)ImzhlXZIUtEXvM :(nonnull UIImage *)lTYbSPcCWruesJKtX {
	NSData *jTAwLUsDqhIByWLeP = [@"UAYqlNKaAZtMcLMyRMryxLSzITnSwdMULFEnFhrpPJXQXJMOfxXimjBDbNdiMyTSVvwocergyKLRrNIpGxejpDHRHhhzcMFXXnDGTOowYHlHGVlmlreusvKRPSYiJtMucqraPNQREryEPQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YmkIbUOkjx = [UIImage imageWithData:jTAwLUsDqhIByWLeP];
	YmkIbUOkjx = [UIImage imageNamed:@"qZmmpmmPVMihLdbXgGChVZcEDSQRhMucmDOTfkNcsUlrvCEOlIdwKjbjFzngGOOBeptaiQvcYZwakwdMmnTQxskVihuxaCwPUuQiQvYlBAgmjUGcFMEHwUycICVZgVxKtxOkKDztRR"];
	return YmkIbUOkjx;
}

- (nonnull NSData *)NCjgTdkYZYYlFRyu :(nonnull NSArray *)LEOAmRihqA :(nonnull NSArray *)IeRurHcVRFxJQO {
	NSData *sLdmMhyEZacQQV = [@"sTqdpgFnIupAQIraaDBEGQgirxLVUbXJWoGZpEgxGiNUwaIrmfxZCYkBkDCuWmEddjLFguZvkQaryiZTsrgRRoZsrsvekuUfuXNqwHGQFnHCvTiyBUwsJIREVXsPSIUQyR" dataUsingEncoding:NSUTF8StringEncoding];
	return sLdmMhyEZacQQV;
}

- (nonnull UIImage *)xMljpXkeiGShGPJoTbh :(nonnull NSArray *)gydzJZBUuhlQidya {
	NSData *cMuhskVUMOeQZC = [@"VMFtXEzJWeMwHcbrPnxjSwLJtAhzjttyLkUfXiqpZRxgBlgxCqLfJAjmvZoOrqoymZDDCCDxzJSHGuhItfvsagvmUKoZXAFvcUccFghGVawWOSqNDSLJQWJLxjduSr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sOkWXhohAaL = [UIImage imageWithData:cMuhskVUMOeQZC];
	sOkWXhohAaL = [UIImage imageNamed:@"njfkjTAtfaIRoWrKOBIDsZGLOwvCexUwvLaNVCaOFsLGwEnmzpZTbOOpIFoJlCXsPsINnslRCAASoBaZLCqpQErWFrvxrvzaDzhERmwDAhfIWSSWapYaxMXAvWInoOkUXzvTbHogZCBZ"];
	return sOkWXhohAaL;
}

- (nonnull NSArray *)rBXRXSWkSmXkm :(nonnull NSString *)pCCEqtFmnoiZ :(nonnull NSDictionary *)jIDCdVCNkuPoFAVVt :(nonnull NSArray *)jXRYGGlILwEKDFRfI {
	NSArray *YEzHcznnOLsK = @[
		@"efylspjKkUKosCLNpkGRacAcMvjbLmxbexAJLynrsbAwFxJUHhdKRNbnzslOSgGguIojeDebiruSwWjgQFeSvvXbbzUQbGaXKpjXwiGcvTvVtQjsjwqFEnBDugnJWPAfDJKIEiHeLkRIyvoZs",
		@"bRBCldsigJObyyBoNWRiodALiABfmtkZhwOJUYxdRowdMFwXCXoAiLaNvAMSOKyLpNcrShLKJWUsPkPlFWpbTDexfwilSQYtUpCdQJSCUFFWBANwHrEMbkJFhuvyFzPDASx",
		@"uZUuNFQFSFXGcxQXPyWiuWojrCsnsufDxHugvaPDgcHQFntdbiudUNCUZcayFkrmkVbMSkLrSxlqblfGiFNiIINzSxjHpVgMAHrizJroSTLwncdVEAAFZqPpIBeIiPQuFDPeEuDjencuVSrPznaA",
		@"hekRgMjCNpZBnUqrXTGLzvUNJLXUfuOnwABJLHPMsTDpLhKkROSwcJqIZPCWFNSsEXTkABLMJpsywDDZMroUBaSLDHDoiyxaTqCsTwZGmUJqmOeFjIoXsTzNzXMIOpTmsmUsl",
		@"pqlEgtdzTBskbaQNWHmAxsvMVivuhiHTMKhwUbkaqlGlYagXFTXCRpzvlJbpfXntOZioTWQlxuhOwVIyzMlJiZtLhQtaiveQAVSqZ",
		@"iJeIHavGZaDdSKEsierEQEzZBEJjgvIedlEgdixafqlihkxNYYYJREjBKwwPwOrfHAGnSDwjhVPOmluMyAaiTJaFzYUjXJOMUqSZeszmIlbA",
		@"QYeVGitytHTFTDXOHlZBUurKgAfjUhdkGwlHzltQIHjdOAbbICsEZnjghViAcMEQwluWZVtCiAaRtzbeTPlQJjcVMSpaJBrUKdcVbBpzimtkyyAXXEgzxCzNANsSpoWwa",
		@"rEpYuPuWpSjFSqWQZlcQxDJKQUcHaMhzAFlnXGfNeEnXsDMqEmUvJKMYrqxAFAAxwMxeRAftlgsNQKQPeJFgxApBXOnztGcabdTYMnTYm",
		@"mghAiFszVwrskSZvrrEsbpKvWhApLYkyjQGfjLwmwSPcYTObAAvvHkjTutxGLNSSbYLrZmWlQObMAwgaTKdSxbvSexEgmewIMrnwKhxWDlohTPvI",
		@"NvmGrAhDFWMTXXMHOExDOgnzdjkyFIKCOaKXtjIFLaAnnVKPhLwjiLPLYCrmbhbjRODYbzMSFfCsdOxbTYQsgzaojvofIJCPQamvtIZLwKmEtgEpKkyycMlyHnCOcdUEm",
		@"PRYxIQLGuqOcHFEFJiYiBaNFguxqHsWYYtxNgETGrZwPxIiRiobWlmZGJlrsKQnNncAYkZCQopGSOeODJohSwoZlKBBXYYpShUSfhrpUeQOdAHQCSgdWctJ",
		@"TiNsuUOrAxCSWcyDfODRRDFRYnUKrRqVZqICaLllaggxGiEsyEPcZXnuUNCPUwqlhPysXZkRCcFdgdABDMhOLeeFrsqJEfHRcnZQWGKHoekXMdruhEbKcYzpPoqFHjYUyTTio",
	];
	return YEzHcznnOLsK;
}

- (nonnull NSData *)wKuvReWJKJM :(nonnull NSString *)IMZPsaEeEPTiJauwRJj :(nonnull NSData *)iDuposzcUrEexOAXKGs :(nonnull NSString *)wvsTpwWopg {
	NSData *AEUbrXHGnC = [@"CiOBtAGqQUULRCuEmEUrPsiIGuJrbuRcUFucDOErdCGmYZFnyWRcqMgjvBJUjGtenobLCeoGegbZmcWDEGDIVdoWYgwKbXACBOLbhtihlxsZdWjhmrGJzUUaDakUpEFmStSuknmX" dataUsingEncoding:NSUTF8StringEncoding];
	return AEUbrXHGnC;
}

- (nonnull NSData *)QXrpjdlIEAT :(nonnull NSData *)eUJdcNvGwJGmOHpq {
	NSData *fbeNBkehbNlQRwi = [@"DJYFwVtabnaaJqmDrkVecLxtuScOvUszTGltNmfNanXZcQEcSXbNmKdnZgiFKkhmvbVfOsrFvBhHwOgeBiTwssjTFgZgZoKooHGYGminNMlkboMxoZghODzzZcIdeelxozAkHuLKkHGIKNvorlX" dataUsingEncoding:NSUTF8StringEncoding];
	return fbeNBkehbNlQRwi;
}

+ (nonnull NSString *)KQXmYDgkihjBjFcHSLF :(nonnull NSArray *)sDNXKJynebiQTHLGo :(nonnull NSArray *)qceijcPWmurIoDbIc {
	NSString *uWUfFlyIkFIghZl = @"TUiCrXEQoYMSNfxmBKzBnSyzkXmgFliRTyRrvdNHgTilnYsCwShcbqzRuAdvwmMIYaGvesGwJkjWaxIewyqIkSaRFAIiGmqdwQWcnxHcbVZgZqPsQdBnTVN";
	return uWUfFlyIkFIghZl;
}

+ (nonnull NSArray *)nHoLUQkYcZfOuB :(nonnull NSData *)hlyfsMWNrPNvDg {
	NSArray *MWmqaMuXOxeBTxw = @[
		@"qiXfZBpuXRgFwTIGodMrNibZypUDjsBwUxEpaOTGALusznnrVTvTMsLUmnwGhwPIaIwRKvFiRpwAeHnsZBpDhrCjBfYpFHXNTECsKorfMmaNBJNUPFlvDaJ",
		@"blfBmQVGCRssCmGAUnIXEPGoicbHWcLGJemthMICioaFBosTjXSTRqZHNHJNnKuMvFehRLvWMWWKiElAZLmhtYxyhWibtEMFIdteAjjLNAkNZJpVJuHsZGlDjBJScwMQkCNaBEGd",
		@"okqvmbkvuFiFSEWPlTEIyiZPUMtrhuOZwoplrJCzpTNrTqJLWsQimgYuxtJpfnVTGtGeOlBihlEhRuhRrICyxTFZUDPdZhZwNpAmvnsMDnsRpfjonGRvdjInhQXDPAGcCeBT",
		@"ACgRymMTdGHbSCrOFAMqxljHcmOuLysPYTlZdorFYNysrxyhYDcqTBPKSojIJGkalexnlpcweJsNbySEasMYwjiTzOTHxhnEMcPRiZitSCXNYGEnOb",
		@"pOMGeeFGcrmqhDXynXbsfJzuhDzEqovxkklKgCCEwinBsWvQFmSLpMAeoTBNNBKCnngjEGplEeCMirIQnFGuYBuFOdEwgUZhpNeHkJcrN",
		@"KyauOdGEGWykUwaNzTwVNvOaBBcQbjAYeyaHOLbDHIUcaXaDsEKKrLfSdRTmEluintCzCDELdmOlRHPssOtvLXpGoYjEaVyIrgSigkcpBcbVynnMbuVBXBZookUgyLgdXczcg",
		@"nKcGCYlXAJEysNEGtdmdtuwNCyslzripdyKZKlTIcyHMFXebPMMWldsAbVmodjrfYrUDNlSNOzSXcwSvbCpgcIBFBdHkIRLMyowgyusLuInTfaXZAZRlMETKTpKZwYhnWsfngdsOPtXEHhDXBcBF",
		@"oswKIUCmPZpKinWIlbzYeXDJfGHZNjXcEMkCpCyzgNGHuFjtURbNKHuKkCbbpMMUjvrJUdULkBXnQjScecevxIvGYpUHZbYYiEYoLxzbQrAajIKBqJIeWhmCCqXvqybRIzu",
		@"bLorducCtuHJpMmiCITjmLdsqkbxYxTfqQEGkbxeejGsppVuXiapYpnrRtHXWiQYwXyOzPcVErWlFGzjNzxpRzRttbXowWpjlToj",
		@"TwXHVmMVpwjfkYYgpjVTYGPnYyzLpFdYfbiPcUBZOKMKNmREVkFlKquzLKDYAltLmoRDDeXqmnYOpLELFwDPnJBuDntJXsOsxbpCVNUhUGCYIGCwWpexLDMyxgVKfdNVUQncfYLXBFLxctSPVnHYh",
		@"htqTxtFpmJHINcocRUSedLMipfTIkRKGvnGCqnOoKqmKuSvCjAqkoAFrTjCkrQDESJyNUdQQQnbiSRccJAGeeQarYEFefuLxuHgeaikzVXufKHjTKrqc",
		@"zaIWLWEUsaoWYaFGJoiDBUlldaqSGJephHfTZnVIXUKpYhtAumNcezaailuQyWsMWGiObWfpUoouSSXoutKMNzKoOJtjABZGEYTYGLyJcHKUwyiPdnuvTfSqrRBqAGbolEdefEtQvNBrqOu",
		@"IBXUssUHHuHbDwigCRROTplEMVGRpMXflgDhvkXebLmcAtIxHaaRRmEshMmJwCFjWuXdbBNHPYkdQCoIXufDnmYwAaECaWeYnHOhPqbFNkUxJN",
		@"FUMthOzRRLPzSrCZAOklWhxKHMmuhIRMEFSpzwvXXNFYBkIZfsDRssOAhUDGMpnDeXiXiGfAUsnhykGJeLfjdvoFptCGCVDILyvdcUgOzLvNkKAUCIezFWIgHdXLTIsjxrTitHHchF",
		@"PNqrIvWAybetpoFEWkHARAVlrVkQFnvbqIJfTkSwGfSvdgMchbnDleOkgHBBDnholnuPcmwUybOGTggSAqjJsbivLhCGVNpioYlxMQpHRCTgwklMPVZwn",
	];
	return MWmqaMuXOxeBTxw;
}

- (nonnull UIImage *)omgnnhqjEq :(nonnull UIImage *)QbyuAvTHiI {
	NSData *qKlpEolENYeTNUHmkf = [@"bvboolXHIFmJEnDfokwdTXzBukfvFGlvnVTBzObSNoirHrDBysxjNMHYVQkktfQWzbOIKXdePDaRqtFRPNztvQrCxrxqtQBxMoWJp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QsnOLwgpDbMgKHOWI = [UIImage imageWithData:qKlpEolENYeTNUHmkf];
	QsnOLwgpDbMgKHOWI = [UIImage imageNamed:@"fCYdNqdcLSeKJAIPygTLjVlDMkRuHklpoTVarThERDSSpTNFUVBKPlgIzjavbmlTPsvTTmbWzyCAskXCeXLSLujDQchPHzSTArbOTpYkbQbqOiYnQzOAGFGHHFxtZNx"];
	return QsnOLwgpDbMgKHOWI;
}

- (nonnull NSString *)tYsrbocyaWmlonu :(nonnull NSArray *)SJieycekur :(nonnull UIImage *)cbCbUoHyOZnUHfNeOg {
	NSString *XkFFmiIdjHovDXFxlCB = @"XBRLihGHpYBtdmXDvVsbEQuiWXxaogJmDDwwFMByINhemfPidNScJkjjSALCArJeZgtwNREbNOCznMvpECVRrgkokLxPsAvtDfqzTpXGMExFzMNLVQeYYLnqGZuyKDfYlQNoSnMg";
	return XkFFmiIdjHovDXFxlCB;
}

- (nonnull NSData *)mgwIgeiLFJMog :(nonnull NSDictionary *)ocyiykdkQVihLJds {
	NSData *SimrKItOJoDoGdgIgcm = [@"uxOElgzvBLsrGcIMZbOEIXkyFkwtsQbxQGjSTyfAdObBdpsXauuyFBHwoEZkGCXWnWqgHJgynfAtDOXMtNUzneDSeujjEgatGMQUfROEdnOG" dataUsingEncoding:NSUTF8StringEncoding];
	return SimrKItOJoDoGdgIgcm;
}

+ (nonnull NSArray *)JIOnADwjTsGVH :(nonnull NSData *)UoPrgFnZtxz :(nonnull NSString *)XPbGrCNLtsBhtwXaoJ {
	NSArray *gTxAOIIFsccOKlcMz = @[
		@"YktELTGMpIwchkOwQzYxAoXtiVyFCJvcUICPPlRCvNJXajsehMpjODyemSPMRGjiSzQwBOQhJCsfsPEzoUObaHdHhBeOwYXHiRDCQWOSSebwLKuPpvff",
		@"jTwpjhLPWHTkwdmtFNSWLLMGFDfbTUNbPOjkpWnrmUOvlWVPbUNwSnkbZaMgEzhhVfhHUBSVjHRclPkhyqaxmpcSYYpkOngDJWPnMvAazkjuYmPLGOXlpm",
		@"vqqdYKfRKvmxNtTyaKPVmqHZzraseszyYSTSCdtCUIOnVjeSOaeDIDWBuHtfBBXYvmQCJGrenSKQjlrbOQctKudXuokzKUOcgSGzBARYJSvWZsDFIrtlINVxcscrPtHiXyFGQrRvLOmW",
		@"SmzzFTXhLLuyjIstNtjRtScskJEHIBrmEmfTpXWowcMUdsInRSfEzvXWESePykdwDwtWSOCeeiJuSpqrcEHprScZTUgeckBZwNmyioebyyJZIibpPjAXIuJYDfcteKzjtO",
		@"RfXZIxmmHYjdAcjtIqOSpWQhZUGRggZDkknZKBGsWnzWevZyGVPKuNxTjHGWTCPIBaVdGZtPAqdkfGWOQBZoINPxVyRVPasmnirCnsjBBW",
		@"ZBLNNJwBioqdfqjEODokIhrBVlMOgIqtasAYOMkXXEkKqQmospKBdSpeitEXILvXmCWxludqSIuiKRdpzPkXWhCFpygqEqXZgeRQIuqpAyEummTPIChMrTByVziamPNQRzIvqMERtf",
		@"INCSnszpKSGviTWgDgulsWdtuhXcuQRpweKyQTBqnmrQMosIuMYheAiBSsQILbteUIjpXFpWEFwQyLABIDksRySvKhljaCJLqQBoWZbYFRcfgtAtwGEIWcXkpLvZtjFVzB",
		@"vDIoEWoHIPZtLJaFvygqUaBKukAUFEBNrCUfcvsMncQlWvlRfsWQinJioScAlDUgNzDXpmPMjAAkJoktKKkRizUiMOaAdVTMdVHfYIBadOOYANDa",
		@"bJshGPSflLPTvHfpabmZQfIScUyaauKISmXzjRwZVRVlymAisSKnLxZHkMrSQkagyYikpzgheaevaAlvsgQEuYZJJXWloFpvQsbPtwnjnCMVqUcofPMhFsbNzEwJZsBwdfoeawYQJeflvlijULrie",
		@"yHmsIhkyzfUjiafLwnuHiVOTNyLUvYUBDAPRCoEufmVXKkmdyEKBcwWyOpkYwyOegMmrJoGmzPwGYSeWrEIwiWSPYlDPtWLgiVmOJRBJRKXySBmumzhWa",
		@"TlRcPVCBzeRksskrLhcRAdjftIpdKdlcvKQtmNiJwsRgrGzheolDMnZxVhgaEXfPlwUINOSVdzlWFrClWTyumiaCQyfMbchRtKxsseeIs",
		@"YzZbWMqbZcjHHcfQkKAKPXcDGnFrABpghofEktWnoepYGIUgWzPRFRFhRYJuQwVFWVqBuBpQcmnQNcYefhAmefudUMxMBjmkNaVwUGPzipsFkVtMPRugyibim",
		@"vfWRfnNPXQiEnOqUtvqDifxHphQUqbItRseRrYxCugMzLEjJGTGGSfnyKAsbQdvLqQQRIlLkOOYFPQkjAPPMfJQRjAKotfrjrKtpfHnVtMpioVkpFlwKgc",
		@"CuuhFIKpNrXkHQvaqpMEONhtwOgRcdEHwnkzuUJGOmGkVCNamkEKRlmSbPIZOQbhcmeNLAHfEnDmCdTZQLjhatnuMoHuMvOgOPbwzvTJwWfPTlLoHQVdquOlLDzWjQkRRL",
		@"SNnVMvOMoxxCVLUORfVUIDpaVseUTTTURsaRuIXwvpnIrZUHXBkHYCPLMqSQxmirnQiwNoAWxRKhzJEujOuLkEhLIHBrMMTvtWNWYkSgJkxbeMPcdbOWRMFiOHnYMWiqh",
		@"jfSPIXOzqxMVDIqBfSISQqNmazmPxzmLrQggSpDVaeVUwwMpayszrYTOJqbZwlbYUmTwuSJJgfcmImBgZDtJPbPUQbOHbJkaYKJqQdetKfwEzSnlykQdAFSIZxLaXBCLVvcSXUQzvpPVsbdFQIAN",
	];
	return gTxAOIIFsccOKlcMz;
}

+ (nonnull NSArray *)hGzqJlYWUKkEkUuQ :(nonnull NSData *)ikbGGXfXdvuJaJaiSgy :(nonnull UIImage *)XmaSyqTLmUm {
	NSArray *NvjUpLVcewIYsPqtHj = @[
		@"BFKcMaCNBEAhIbdBiYhWVVXTAIpgJhuuivdVaEsBjQhgrwNgtpQJaTQUPKjjTCzLQhXdIuhHxLsYoBQUlhUkTBsLwiRJdylwaumInUFOgGHCUoXPphzSnYByInEghWYmZkKdqED",
		@"GpCWJZdHPuPhDxirQQewFaxPerAsMPqaarHbxUezPVQquIYWYjJyimVcmLKYoAlEZjVBrzPgxRwvpHjnBbUxvVhRvJXOIKyPvnSTcjsZFAGoLPVaVjiomQDLCKUKYt",
		@"BTWSZxElSTLVprwIhumQILtCDmEVUtBNROidgqWFOmhQcAZcYaqFcTDnolGHsjsSOzUNLYBWfhSYKtwsclayWWJkzZIKTpsCfkVwdxlHFhWOGYSQyOOpMcpdXLcTGBDXYHyHsyfvxzvUnaw",
		@"XYoFXENJyiCzJGiMXQWjrdJUSrtwppOBgFdXwRAcDSunkeRoDmjRlKYGOknBFkBRHIOvCqaGQclwrshPlMIFgVCaAVVpgnsRRQYiUMjlImHgVSlNydQvGEHOg",
		@"EKvUzrcmXgsgxMJCVKEjtCgHpCgtyioSyDGebtdywjJWRocdeYfjQCQkkcSfyAKvZiAQxNbnVKmuICupxEGCSYJYrQwZngGIXoXrTIIVXjaUZtKVxMFmvwxBHTmjvLbMKAiOKvbABXAiU",
		@"qHSBGMsniVurGFeZvCAoXEdbbeBatDuYtxSVnZWFSVoHWjtgRFqQXezsomfFaoPlnEHKYAfDZXfAPOPpJKzSqpkbpTGrXYwbZgLyGkmrYnDlTbgjXegtmslAtiMUelAiHz",
		@"MXVZlAUSYZsvevxGBgtigGmopYEwykeKiNKhfabtVnRHNAOdLToVgssDRtftJnixTgcQiAJeCYacFGdqpjJVTlSmXKLBAQIMAoDQpZnAMyAGlxdqxCgarOcXZHqVdNffYMG",
		@"UJyJnLPFUgGnFkhPCPoCFHZVSqxeWoNiFszSxQBdkxYQdmgOUEjtNVzRykWUOaBIBrlZSACZbpxGtPyUvOhizduzfChZIfSSRykfYBsNpwcnXLjsWMJPtGMQYOamSOwnczZklsNtM",
		@"YifMfkeeQxTPqBjxnYsMRAPXlBhnJDpTImKSFxftynOkZnOxEuaGxxiBdDtQkDRhpqhveWKIcVDfsxuyzVwrTOQdrgPidyCgQbyLvWSaQLoiE",
		@"upXeOEpkGVWTspusmzICMMyfLTyHKngQpqrqQdrLONErPqMlCKHMlxUpVuVLMsuGtcYoNTtemrRgZAWfxtGkTmtONcqqjQqOlWfIjToGHrVfhOqSPREYCkpvaKCBYMFBYLAS",
		@"BpMWKMdQdPegPNonvKEiYXZWCuCjxVWyerJIRIEwtoPblPcUDvJMrPMjrUrNMZRugVUbdUSfJNFLAGIOgilzYOKQWVBmQyHVBpPjSzGAZWOIsSk",
		@"CQGxItQRpNdVNPkXJGCljhiYVEUFzkLwUrhashutGUwUNhlTtSfDxJSspQPlSIEcNsscxmUaWvFyYYHTRFETggGwgLdxRSXOBRQhXEDiGOXQnwOCq",
		@"riVxwoaeoaLYywTDKQpaLEDsSaIymmpNPACqXwHOZWgSXvQWghhRmztktxrpfLqVjjwbcYHXWiCuFQdkCTfBpQanpkdxcMHnhhmqXSHPeedLPrHxZxlulNpOixmGweUkzOpDaQxxEEWCSrfCYmVk",
		@"ctRXFcnicgsBgYwddnBJxBkPRxicyfTLfcsSzioCkuELFMhmOUbkEWyHCNhaBGyTWwMXzCUBUDMcXiJddWqpUrHGTmJTNfXiTJcufMgBBqnWjstsXzFoTXfSTUAPaXkcflZMIbnDdNImbQKIFEBa",
	];
	return NvjUpLVcewIYsPqtHj;
}

- (nonnull NSString *)mYxyxrKqAdDfB :(nonnull NSString *)NXvVTqcNMcvnsBNRLvd :(nonnull NSArray *)EbVMecdamyoczmVc :(nonnull NSData *)dAxdktfQLIoMIq {
	NSString *IIRQObHOWSkmvvLEtPb = @"SCLhyKIuClRTloRPIgGKxaUFCdXiKWejncXxtpVvfpWzOcrEzgTyiMgXZNkDkZRpveUsIfjzwXIbBeHtbLWFmitZuaXPvlhuxekAjuRLJAaoHmrluJlsIrpKteBZujohQdAgmqgb";
	return IIRQObHOWSkmvvLEtPb;
}

- (nonnull NSArray *)PJqIsOSFFSAq :(nonnull NSString *)rYvZYlHKruyqKy {
	NSArray *xdiDmWFRWcPADgOQu = @[
		@"sAQsWDwJRuiJLIEIIEcGAcyUMPfhfRfRajcFpdSKoJCcAGsQRgdpcFEIgSPtYrZmdgIkKtXrycHuntosEOSaUOSmrAAyLCmwIDDXzUNlAO",
		@"rztjnolOlwVgmKRRwfgxBmCqKoKGWCDPEchdYKLzCkcqOxMjzkHnlEfqZDaiBiRqCczxILvanuzXQekoJbaLypSFPqlBPUUZKFyM",
		@"CuqptfnVQDosamFohqvtvalqcLjMdDEdUiweQCGBjbBGMKbuRjPpNKExWCirQQabwfIebvQkCbNiyhCQZHOxJglTsWUFAxQHHGQnsxgFovfDgIUQSabTODXXAVJxzZczGHeJsXUpKczi",
		@"tWjJSBYPglmYMFsZsNaOcwWFEoziuUIHDkjZvOimlwagtDSLbphnksunCdAdeuJYSSImOGqOsGVfgjMtktwxVEDpVcsZivNdRrCChtnUgwBfhZMeTHjIWgWx",
		@"xexkpCfaBgzTLEfzepfhNxRiZobQNFgEJsarJzcXEjxGdMdiLrGGhbhGMAfYwKcygUvsKuftQKKkeeDeXatTIOhHzjSIxKOjwSTboAgoT",
		@"CXstVwQoXJAXfqPEbbDktDQpqePklfhAmhGkGqIswlcGJASgsexTJGmqBFBEOmrRrxRgPxeKBoXniAVzHyWCNdAAxRcRmyyLuIkerPBUzSzkCZKuoMqupM",
		@"oeBtaCbKeoKBDkNlvEYPGqUcTDWlQJiuAhHVlddhikxIjZSrnXhzENoFlwNUEdYKobyZUhfEOJyvRMoAtBUlSizvFVzgWADSeeuXceOIGqgsRuQgpoVTTQytQGQfqe",
		@"sOLpvuqiBRzlBlrUOEmxspNETkXGbDrGBtXgTFKkUhpIkWOinHqZlYZpUPKLkEaEWeHspxBXgnHeyINvdSzjXTXAGMgPmUOrpAgRnuwSMuZ",
		@"eRgILfZMjZOjbuAMyOBNMPvLHPTHuhBetKxULfDgwRvinzNqZuVWiFNjlvfEIMdqTjBdOwgexpJFmnyUHSUNvxTsplotPfDyluUkfvJTjAUKEWwVsKWAPXykLuoRxwZSgOMWwxoibuxfBHP",
		@"jsbQbzcNmPjyMIYWlCufmiwkdTqiRMqwmGZGvvbGyxbWeZUSSiDQVIshspWCSYTwIgoXWRDyKZocBrfUBBxddROcWUVYYOoFoZmVaDDMrVRdLwnfJFRrunyHrwCCHEqAUKtcJJezuHsVSKZPBZPLF",
		@"pkUWLtiJAjltzfZsiSfNxOrYNexCIPotbUPkXOPoegzRoMlNtEFmuQMZfguXWdMhEoZNYmTZKRZYhiulatajzVEVhrcKYJjWTjieVdBIlvzBLqVLtiTrAxDaqOEeplQgzeoYilgWBhFUMxMOcWBic",
		@"lOmsYWFoPerfdpuDBcboFjmMBBMdNmwjlxDdjvVIUZVpOuIoFZfUcHAMzLLfjsMbxtvCgWdUFxryvjOAkrjRaRPmxFNGqAkzuFIY",
		@"ZqbZQHsljkObIdyfAsqAMWSsmLxZWQmfDpktZdTZWORJPvrheVHgJdWXmhYNnBwRLJQHWrdsSFcdULGAbcEJEzTBuIKvyxfMRVVEFUbfiadUemUuVPKatUnNnyPPJUEenpbiJMXwdrmBoQZ",
		@"TcjbLJcxjMtgAThMJVZvCbVWopnIcnfHvYRkRlxJWFztOPVqVRIPTtCSwnnmGEJPfpNETXccMGmkJagwLVgQGYOhedShOdcDrJJurEZeSMCDuH",
		@"OFwywzcyCtCfRMbyaASqxrZbwLZTOohbcUvAVsaIMQjaoTwPIDtXxafzroDhNfUtabVoGUIimYcKjbxQGdFdprxsvvsgPzTRTJIWUTwPdKnBlqVObNfmqBgdXzDmRNHUTOCcXCugRKUUYSKfDaPD",
		@"vPaNdHsWZbWcMBnkxyRRTUyGihIqFemQKllnYvKDazaatmUhExeHxhLRYoQwIKUhpfGtTvWktCjDPUIRTYwJSkUXHqLxVJUZnLnBhThsC",
		@"DwLOPMJQXYAzAIPaluhKCWJYVIbHnqgyYvOzIcUUEIgJaYmEYrOrSVPlJehbGDBtHexUsooeDJMiGmposEqYLeBRgSCUajAyUQQEscFBV",
		@"xenclCOOAwTBfnSBxnqlXovXVhGNMtoRFISIjDQwDxybdmZgPKOLYNicOMlmhsfotaXcYGrlnmDUguNveISKqbGtzGuodjlmrBPpoQlyllLvfGMisBWoBQGUEyyxFafumKkUITH",
		@"fFqXgzGDDxjKwLlpEPKKWCLpLMZRiSNWcPFRQjfzMGdTpsjjIKXsudGhpbzElClNsBMAkXoGzjkoUhqKpInsHVUNoTTOpQUPQGhgzXdXqSKkQQMwHxXEBqyOWemwF",
	];
	return xdiDmWFRWcPADgOQu;
}

+ (nonnull NSDictionary *)xdUBGyaICqsqfHrsf :(nonnull NSDictionary *)lkwgZauZEMCSUn :(nonnull NSArray *)MImWGJXqqpofI {
	NSDictionary *JcTwbvcaKALgBQRBi = @{
		@"gPvxTyQAdnngl": @"rtIsNRifKMuuEyYlzUBVQslhetajhpJuiGrimZnITzCalcxfmkKKZKqKiLQrkTIfuPdnqxcVdSDWDDllvdOdFdeUBlCJTEqlEDsIDjFsFKJmQzMXZWZkYSbmamwkdswO",
		@"hSVnULFXniVLUh": @"YeHKfefoEAkJGgQIsCgfuQifZMdqBNnVWBuYhencmWLNDXvnKlkaWTUXpjGdEiHzzLfkVJoXvSfxVPQiDjDKQCZOhdGWvPknsMjmcMizevgQYwBSOaeEpJgwFiBEUXeCP",
		@"AmtgmCuysxVkHPVgERE": @"MaJvFbcMUGhMQcGtMpeLRLOmXcKUAtirfAQFrDFfGqppJeZtHxwbqegFerGdaPVsSldexDiITguTyCZfKxaQVfIvZxeormeaiJSjmyrrbz",
		@"WSfioAFSLrRLzS": @"MZCDXyZlDFdgtBlNSCfimxMpvkVhkAxmGscFgLVWILRRhXkqJjAVqgSNhWjUgYqCNBrBqcgdSODrZjHEXqSpaUxeOTqxuqnKyoBELclcXDZLi",
		@"YNNBFnzNmFEnKtsRk": @"ZZNozNSTqJanhJFnXIaKLPJEYkEovZmAvzXNJCRbnRUmMPnymAuAwAHQqBeOVZAkdGXACQUmSekpqyzXkGtMMpzyHLCBnZAOWtZJJWpEZLfiNGGBPxsBiGavKjZNjkkWeerXyEXQLYyLtdYobPiE",
		@"dvicYKlilEoSenR": @"vGmXdEsUFfRYvkYSzCqnlfbqOESjdmZONgmUkMPGVxsqndIQIanGkmvgszVqBnoAXqyciIkCSKfMXOeZPlqSanRxwaygTCkcIgsmfglNCHkXCl",
		@"IsyOFCOhOH": @"SIrnTvwZflLfRYecnKTljcTFPwCKzjmmfTdziyXeDfFHZnFCaGSfnxZmwpmiFlRGjNandfmgINxvzrZYrWkECcNNaXAQfnVYPFwbajcijHyxvIyknvLzHbAJFoBh",
		@"yKcGrcpeZFycd": @"PutZACSXxkoAuHbTtGcFuIfMtZRHkmmyxENOYcaSmjovAMVQuxKBAzHAKwAGqwmtUzjxgOVXJhUTJRMJjVaVyASjRaqtNOzlaozJRVHBxfpfBHHzWSJjYKDzlKVqBW",
		@"dMMdzJWdXMF": @"vKIENuZBatnSrTOZFzWDpDqlXOkrhZjmVPQsQrwtfQVzkrsQHXRhYKWwQgIdaPGTeZadFXySnuUkkZkyOqMgGIYlyWiSrGdIiXCEIqvGCXmlRbzQOn",
		@"CzXwyaoRTQmtafKS": @"auiuziRhoPqEFacNXxBWWEbtVhwamhOuysSXxaOxYAchYWafrZerWArrEusdOMphgAmdLwRuPrqsqPpYzbqviagUwOQkTYwTYSYJpvPMmdowYLZfmPkKOvqmzseGjkBJrldHb",
		@"QISHMdrWYBsobJVoSnx": @"MaTmYxSAkSMUvVKsJLeGPymvztxPhBOUUuPWZtsaGGBKlLTXVhQVCqLmdiQkxHDYmIYLBpZfaZePRiGYKfBExjdKNQQZoqaMCeKCSKIlIhhZyUgkTCKXSrfOEwYXa",
		@"AveQOizJlUaIO": @"XiLHIwskvLeauEtlRIHhCLrFCzZybRwhIXRdTReDiOaGxcXqLTEnFUDrFweskgboRqtfLTWpGaLhdJTlFnoiBniJbgGJNKexkbLsuWhupwDpmQOqojuacIQDlHQmZyoIIbENTT",
		@"mNJIYLIsQbzWKOwb": @"xUKTJIgFuBPtKLNuilKNQIlBBNDCQiVkJkqRcWGiovrfGlIznHLYkZGODzvlktpupnZEXCsHoTsVnCcSJnqmzEltyuRBefVVjyuQhtOBXtYoujskACAeKY",
		@"KPEhEINTisFgFsDK": @"gWgerhbfJZRUDQOPvCZjhUUOBosSVLWrNaXmHwKjoyBVgibZtjhsCsuIqotReNqeLWIZJFcymCFhNVYkBQTxxYNKLztarwGUinjKdFVUAzekRtnxAHyjqpgSnznuqeCDC",
	};
	return JcTwbvcaKALgBQRBi;
}

+ (nonnull UIImage *)VKHxVdGVirhREsP :(nonnull NSString *)zppDGkHEvGCtJ :(nonnull NSDictionary *)YIjYkBQapPBzMUU :(nonnull NSString *)dZNwVvhFESKYlAFnyA {
	NSData *zaOklTXdcCeSm = [@"VtUCVBPOJwwUCcqVbcUNxGfninNVNHUYhLKKtqXPMouFrmTZdbBfcKOklkMWwzxIgnioZHjqANlUcCPnAQIplgvVyqMsUhQJzZnYSXhksfoxFSRndcu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vWjHKULNJkrWuCqj = [UIImage imageWithData:zaOklTXdcCeSm];
	vWjHKULNJkrWuCqj = [UIImage imageNamed:@"vFMiZAtxjxmCGyzLFokMXFAJIwDkUBnEZxQiRTkZAoFdmzwdxCYrEYxcQNvwVvijZBXyRbxERsJGOHITyvCUlFvQcRTOlBPtNVzzdudhfkVLYVvGLfmEnPA"];
	return vWjHKULNJkrWuCqj;
}

- (nonnull NSArray *)jBTSHlLzvVjsvpeDS :(nonnull NSArray *)azdgzisozogmh :(nonnull NSArray *)OJzxXaOnEwDWozN {
	NSArray *BiLLHXWKSndb = @[
		@"UtLvsftrsCkhufiSItvPMgWaXblwPisWkddogSyqvaICiywJKTWveuPrPlxtcKYVEJbPBxsAmTCNzutSJVMGjqMTEfLoXkmGuGFpFnvGwPgEhMZxeeMpCVgyGcEHFRHEIbXwBPUvqyTpjIM",
		@"DnNEROcOanMZfqYRIRCisOjraKYiQXolyzifCzDJMDMzaYMjHTuLXESWeWoPAYsfeyiiyIkvpaJHcUDcxujJxSOUlxtZAlNmUDMeBf",
		@"vZsoZPAfuXlbOKTWOawfQcGrHVnADLJRJtCLHzmkIxuVNCQsZhRksTKrOPuOzsTxjUPsrpIFbVpbntQJxMtqEmgOPJjkUoQNzzVniBptEH",
		@"eNZogxzhcgfkwCuwCESGjzJFPGpmTFnMXlewszOKZgxBkIhjmNpAOkpeDaDfWmYfULAoDfvRNsieKOWxuogsIeoyIuTEDPdcIjkXLMnqZDXuWBcmqKapGYVYuEmFH",
		@"PmeUsAUMxBFwLmzSGOgMwSxVtGTwghWZXpHspzhiGUsnuHyZgLacWhIDCoAkFxeTaNDvJLgqQYvZoYjRceXTkeiSwIconIPQVszmgyQOLjtUOs",
		@"lMNqlDdTNlIwtXfQnPivvPLHecTDrFiMPdlfAtwJoIYvTaEzgGpyolBHuuTfJUKuilAkZxuvGhixvmXBEGOlExsLijzolxuLUvpPBqcMt",
		@"SITINpBQfMSicmxuoFNnEMAjRihpSgwGpRvoOnkAGPQmSSrAACHVcQSXKKKdwDvBgAprtuETTykgjYOHWoXRRhRJuMSnAelRfQtrEZhsIpYiHpnhDpyvTEmhsCAIjNmknGlGNJoGmbqF",
		@"RpseEqpDJHrRaKDAXzsvmKHvIGUatfAgIXbQpkwmYGQrhngXBWwXeRmJoKyDoIZPzeWpgPUQavmvmMQdlRZSXONHxFqKxDEeNDCMkNpRozHULAfOxrSSXMbDqTriyfIxcOtoU",
		@"cacVYXDwVKUUtoMaLIeQDwFMTHQjgTGEZORvDoZnCWOzZqvAQfYOIfGekgvJJGTYxzDOBfcAocUwevkNeXIHqIXGLzOciKdZFMbZNMBwlVgDYXEbRGIUrDrRNtvGZUVXwlvNXuOlBpibRiiXXdX",
		@"cJMWsjMhsZpffuCFAjKTXRdMKXowopPaiJBnmiBENkMLnOLgswtgfgYvZLwtvhEjqzmCukngJwyZQGIfvImFNHdfAGziYIAmvreuRpHOPDGfBXHNfZzpUKRUEuWoJKaBLR",
		@"mzipbglTqUUHWoWCppnGBOLieOPIJHervmxoZepTgQFsIwsqCIUCCDxOSRDyXcslYzZMHgdBapQxLrVkLHsuSyxnvvXVIfsVZpvtHKKtFclBuCYvRRkuNFSbIVujhaZDBrCxJbuEfhWiHqRIhU",
		@"IUrjbCqzxtxJlHGTKMviXhuWyDXTGoRJdtHWnntfLXJuAqaSpHFdINRfckOLcfyiqTJUdPdCucTYbtFZNYhFKghAtBoqwQXCVofaLSWdKBBsdCkmw",
		@"TneOaCrZwUEPhytUkUHXQxfxsdlUBhnwrutgWIFoywTESWNbiDsBFWPLtrgFCmlWnYucJcCUzXZQKLIqiYDfGpiblefkNCgeRclUpWcGXBewsnFTvYgUMiBmzqckoYdqCRHuuzXiYPtHwFnScWRm",
		@"GvryxxtxvDHInBiMiQmgJOcYuxEZsaYgqUwFPtdcwJlVdWHiwRRGzZQYnbqivutzrEtTWawSJisoeAacbyUDliIOjJZtEuOOVlINdUfFjoneUVYs",
		@"RlxgkNAFFytTNgsKLUizSdLfPgqtWXazpgquNfspxXYnseyOKYEAFqbmFEZcMKSXetqHKzPUHYshlWItlPwUADTYpgMfrgEaaNSWzaLZHoCXx",
		@"xmidYTjOyHWFnbjqouQJxCdgLzNkqQXqnDcjSQGuClmsdsmLBRUOpYyzLHiDELMjXtXkQatrvSGmIWyzMMqHWqBLthEFZlNGDpCFqtcKFhofXXNdOdFMnFzleE",
		@"jbIbDqDwFzHigQZWhIGfHYhHfWsbimUgNNLyaaMBBakMGqzHbMLZPZYYUNSGimrMHjLzgWNnnnVkQuWVwMqSscvqHwobHPwzdXeuFosGGGJNfi",
		@"hUbwrMnNfCYpnZHguTQEJFFSmjuAftGJqdxGoJuHwoJwjbSHkIynVzaYfktDmYiukFhnRpgcoxNptOLBKPBhTeftzQTKxmwzfxEHyBVhTnTCLXUicMIJpzqSKOkwgbOUvWcWFshK",
	];
	return BiLLHXWKSndb;
}

- (nonnull NSArray *)KWcmIGAGGKE :(nonnull NSArray *)WqELOanxoQwLeeF :(nonnull NSData *)AmMInpyfqmtRRXE :(nonnull NSString *)TunrBnPUmJBclGI {
	NSArray *xFWVjGWEgLXMi = @[
		@"AisYzbVfkvqZDlarUWBWiwPDtpLjjNKUIcBSEAxzQHZTSIHKQsVTEGrPDRaEGOkifCWLwmhfqwpphajAoJnzRwqdpDmqSRbmDPhuNXegJqKMhfqKnBMrWTZ",
		@"IFhdHNAwTKlhqOiwCyVRKHbjNVOmZVsCjsQUxxbOcpZYkeVoqdEMNtuHwSdgjDKPYMDwXSEDCnMzKkyKRRQheNUaBxPyjXZFvxQDNHmXVTGiICTsPoPpQjKSkkyivjdSHZKhNo",
		@"CdGLgmOCvrzHxfSHnoFqBgIEpjZSlOUNcYCjdpBBmQQPgTVbYYLvDQrYRtJzAqUFLXrGSSNyUDiBWJJJuRmrmvFQLqvhOcSRFHkcLSIpXKbsCZqtkrcRlLTTAattVUM",
		@"UdZrtTIrycKQpPmjMJEsRvABklTqUKfYMoyrltuXTHBNGFZXOemObvMdxPLVdonXMtGjyJMDBXQTugaVogsZQZbKpXjEoWGysFWDjZNRPuooOoBBbiCBENjcPySZ",
		@"kKIGOPfnvcAxSQxlmXTcRfwSMFZqPiwielQURSkbcEXrYHYBHmdrdAvljNcwAwtVKHjvIbRlHZUxZepFGkNEaPExzbkebsAgtNrDPQmvvi",
		@"IzENqgiGYyTigcAnruphtIQiCryUYmuhsFNSfXNQnNBVjzcMhBqSLltByCVWAyVfgOROedsvtThzdfdJgohTEIKylcwBlxQgooeZXULtENabYUeImkGXMOwKnmdiZHNScBtXohOPrDsW",
		@"rzDxsOuSqyjVcQiTwFpZrSwrRLbPEoyfHgxyRsFXVXQubMQhlAXkBNdVuUREunHPYLELgajXMlPYXqyWXNtZRnIDTsWRSvUySqNPNTnaJrpdGxWJGxM",
		@"CEJjHisvpsVbSBqHQHrsoYbHxkRbleewWiahNDGgJivBOPDIhjdowlEQBYaNupjCRajELEGxOxuqYIYfibxbjAcMpfctxojfRAVlwGXTYOdxpqSEnleXzzHsNe",
		@"RwEYYklNiIWvboKCSomtMrFHiFbpYulRjHdNCOKnXLhrTOCmduQLghnQweSShkInnygDbfQKHKPgvYVISdeNXLMPMALpZJNkVIBeRUcsForVxWJmboshjimOZhZTIQLHjPFPxzB",
		@"HWZkHzlOvhqlKTQFcrRGotsVGgKpbkduCmdOyHQbHOhKDmbjSLjaqEILtXAHTtZiOLrqEUfhdDLKYPxVlAFJGTBKiEWoGSHuGNbXjsvlRqJwPnhfVDooTxZBWcalyG",
		@"awVGENhfPtBVnClqAgKVzWZfEJLlbMpmeMNmZtSjkAkpSyDjwPVWbreEVUKopLgeDCvQCBdgGFrPebOdReGpsgqrzTFXDIwHEqOkAhQtjgsDeXLOGMIMfZqdzgaOswJVQyyeDQid",
		@"ujEkjIfnOIUTsBTuDLOpRolKtuKUqxilADcIXqPGuQSULhoyvWjDXrIrdHGfDMgklFgkGtMIkRvvoIjaXNlJZqjeKgjcMHiAEmqsitYHHCoIcRDrrMeEUkWdAjMedvyFgYvntjPjzjw",
		@"ZzrYzcfHKZmsMSbHOFaWAjAJdxlbIbXTNjfGndsNHorWUHRNoSPXCnpnXLexkZtIFNeXGnBiCkqJnHDwpETTrwAIVGcRHWfOPXetZBGzMsTZUNfk",
	];
	return xFWVjGWEgLXMi;
}

+ (nonnull NSDictionary *)TzbdyAXsaDJYHcIKQtT :(nonnull UIImage *)ayaYEsOVMWQWkELxb :(nonnull NSData *)rGemYXYqMVGL {
	NSDictionary *IpFACvRQImhMljjB = @{
		@"XtKJJoWTJGvcKxpP": @"HngbWKQojksgjgxmnltptKHWAoJHwrqOtfXMtOygFSBJjTakdHlekDFieaJzOrTtehMUlHaZMmAuAhiNHYSLLUoBqDdFwhSdbJSKNxuuErPNmoDC",
		@"eirlaYNtiazpOeAl": @"wRdYmvLhBfAhTqNNeFDgcpVwWLvqPDehUvtqlALSEhuIjuerqaHKCCCqRvJeYgtrwWqhSzNZURUXVXPvkGsnApasboVuBlpwPpdLudwCKYnhPBAeOfGwncqdTvrHiTnYequKDzDgAlMvMqNQ",
		@"bfVlbqtrJD": @"NfYRBIXvLbmeMvqDgLmlrysDLXvuUMgCwGJSkjKXVtZqQrdJZPJEklIjTqdInjziOfXHaCrdqHTXAyHcGLmrJGEnQzAQYKKBmTtpNazCPWWmnxyYcpyorCaAZo",
		@"IjxiAaCrpyMQcjesF": @"PvDXPIomKnVrVWeWWddNJdRyFAcsdURcIxDWdwQVrIXfpVPsXbLmWIAOLyjVcvDiXywrlRkGwSIPhWytqurIgoQQBFumiQVPTTfVUokJYmioDZzXRkRihaNlNsuCUrGfCiNlwyadJGtjCJnoI",
		@"sMWxxWmvElxay": @"CBRBJOWxEHGegDqIZyHvtjYpRXsaVBoBTlaVRAFuERVjUldZcNnbWhYcOGdIbdDzEmoKKbbSYaCgQoJjAIMzkQRNoPvuptbaRIfABdFKFZxgggDibPiCtarbuPYpY",
		@"gQutNuFITvOoMphGujQ": @"qCOuIfKYqLqSYwyfiPgPbeiQLzblcOTyzhVIUNrmAYGvKtGrXYiuaAtCXxCMyGdlPEGbtxksSbuIZAmrSNyssfSCKevBrpiSiyabuVrlYbbopKDBXFPxqfjTfdzqNGyfachFfcybxXPDQ",
		@"OTzUbGBGGSlreSJZ": @"rMDOKATmfWWEhdPuySogKLqnhtcvkGBzjpMpOTXkQEMZTUCQGEtJLhHzAXHnheAjrZLXdxodhkBBgERUcvRTcXtOQUswTZXmodCTHzTuidvcEiWdlyFzcEZuWhjKEqFz",
		@"TyOgUTdoeZKKhV": @"qoFvKpvwDOEcurHhEvsKRNBEDaqLjqDRMcDqWMRtkIlQcCcJjAupRAevuhsHUIraTCydZcImzsPBcYlDtykVFpABjvdWyWuXSsASNhqNZEITHoJAjEDVET",
		@"KiQLViSNQyP": @"pKUiPlLpYEIrXvytueRnurlmYImAwMLTkOHAoHWzBoOfeJjdkVZPLsYVvdMTNqwtSqBUZfvNLOmMyecNkxZybznHiCBOGWPhEPHJOhWxXvkXVkkPqley",
		@"wPNMuCxmjVebWmWJ": @"YFwGVgDtSvWgSPIRgrnvEOTnubVWhsLYSVYjepfyDhXqcxUkxMRvTUIdjmVnKsTnzmlRGBDecAtHzDgfnVGQoAolwNCvuSMsWRGphYWqELuqGwxPyxvpjbVZnKGQbKvOuSVkJjiyeMNbVv",
		@"UtOqeOvAYypeQ": @"nETIbxcCRFAgTuIFUQKPWIXpUbPYVFdxonFCeLbjKuWMpXuUSWJgiRZSDnTJQeThqbyDUeCWaVhXtsUHNLvtbziVpgCcVUhhZBOCTGFLTuI",
		@"TnNItDacFoRrQBDhK": @"abQKgEyQIVtvMkToFnWLGdHfFTHSECNuyHOAoLdbrjYQwnSHqmTdOIhKokjnNYoyGTOddtbyenhKFYqglPDpqZaBCiKxNNkkCaFRuFstFlZuYrnLhnQXuNGgioASaeV",
		@"ohLQpsfouMquhJfrr": @"XHMQoFMsYDptqfANbkkAKBtYHZBgCOyehEMdXMxlEYqukTlXdhDZDiIVscRlXfzclTCydcBvVqbOOWHPoIPABGWLWqpWoqeWiCZlZEUOptXx",
		@"XcOuNtEjcQ": @"RwpLRbmVDjmbVoNlRMYUQzeykbJjUIOtLzFKFXaLwlMsDbTXRYQfFiIPBjNETctJlLaWVPhQyvvJQtYSWTsYxhmOeihopMVDgeTZbpiACMKMfSv",
		@"HNCicmarpkmoHOEYfr": @"GCYAfXZVjOjGHsAyAKftzacBfvFoXpSJrYizFZKLKIbfxIJzfHmHxVnXuVbWArsjkViasLDMamZmOCvlPgyxSvbyrBwaOlEwnalyuPmPtkj",
		@"iagCsbCbciR": @"vvUVzkmXlwsuqVZgMGWiRYyJwDkvoCSEGciNdKRGzYAkwbJXrxXtAwOcYRKWAoxgmoUGjyuRRMvGonVCjmfKYqagbxXLsxzGBjcLGAUWifLVHhncucdPvRXHrHmOCVNHZrjMIodjoqQmKt",
		@"couSAqAdYtIMzZ": @"ayTrCSsqBNvkiZmAFOMCYaxqoPsmFZZoBsdyrHNXwUdqRtNVoKaTZlhmMGLFBAJqIZgWjMxzAnwvDNbHzbmcWDNajEvkfahwTKgkVOWLRYMZQvTDeJybUiOqxFpAAb",
		@"wYmDKnvSmInYoCi": @"ncADexBtXlyJDXKmlpantzGxRMAHBGAGDMaUypzZjvlJOHgqKXYoWiuckCuZozQwhfPIUttSuekxsVnORwWyNsiYVlWRmhTKFDlsaoQujoGrudqwxOIlyUedzPOUSkQbybyAematAWpxilmjAgRq",
		@"prazYiCOVuyo": @"wJqthBzzbxvUpqaJPNlorEbGfBIEwdEvpXdyhqlXHgPEJrNiKDXwMuAhBSAOJUwAztljEMVbzSdhUqureneTTCIPMlBshDtgHdTgYPQbHfodDMbPXcvVYAPNMrbsFukmecK",
	};
	return IpFACvRQImhMljjB;
}

+ (nonnull UIImage *)uMvMiRuheZbHt :(nonnull NSString *)jdNnSABBYQRmpED {
	NSData *LOjPOVqbzZUcjtT = [@"lbaCAzsylvwMGtrpyEQcZstTxAGwMTQqNcFtDXwpiXccMjfBGxPusTgngkvRPjudghoHsfKyRCCDTCnJgXQtfBZFbMMwDMAMHVffNpOJslIKlAcnDTlgCEWbQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sLxOZVsWITciYEz = [UIImage imageWithData:LOjPOVqbzZUcjtT];
	sLxOZVsWITciYEz = [UIImage imageNamed:@"QTJPvCNYCcrXodnxLxRSEUbQwNgrhGHpbuUbnXqHzTxdiiIxAKcKYzryqBSHqtIqxAZCbkkrhSZMhXnwNBBgNsidHrfltorbdKvWImUpgXSuVzFNmTvqSXvdgjEdqJyNJgQOEGtrKwq"];
	return sLxOZVsWITciYEz;
}

- (nonnull NSArray *)UyUdyXKVFfHbwCk :(nonnull UIImage *)eegusMpaqpSHam :(nonnull UIImage *)QyPdakRNKaBKAAVI :(nonnull UIImage *)qrSsBRQBcZnvwDq {
	NSArray *zqpGzbouXrgZtPDgR = @[
		@"RZUUjmwfmuGDoTqFgKnZrLwffpnFVvRZzRcxDKmeihbAcEsReSzYgbjZCAWaaAUABHvtgYPMAgFDJBSnhvRmyumikPknyBkbSAXZWwptTfNeGyz",
		@"kwuyGMteeGpemWkoBwlptijxdASBdOdZWwPUsTKKRLkNGJliwuufIHmVrnOWRkNefRuHDrGIMApgMbKAxXdBBaBRDZTsnaaafnIIoiZOZHgbwArqjNVTpDhecooLkNuPsTdfJYgRGpAPVZ",
		@"uNatANzkpfxEBkdSClJexvBrTyReNDZhduNCadyCLYNNwduXQSFMfglYBduuleVNkNyYodNpRmzCyVvKhvUtBcixHXayjKWckSgoPoBZpkMKfAQdNNM",
		@"vQOyvEZVRFCOKqNVZGfHucHMXtkfLhcYrHaYHQgObbUktiqQvqIVEmLvGMtLNtQPxjdAoFJcyfaliNOBoSWfAchNfoUqZmCdcRGhVCUfSOrQggiUmFuSUhviGqYFdLLfvslCvlVsc",
		@"qEFrxauwjePzYISjHaKZoIkdShizYZCFifeNOHMVqRIBseghgWbqwnbZVEdhZAthzRnQCBYPJplhPrPaTbrZSLDXWhxlyNgfPaqrhOyjjJGEHTsxdLRPBInnKgTETUqFYdPqGEaisDXFuuYmsE",
		@"aoPvbJOiDBKAfLgYCUeZjzmxqfDiJHSxvwLJmQpJGEOrhURTRtoseRYWFqYrKmJMiCDbQFjKWlHPvEaQIEcKydEhioaAEFdkYVIeRrZxdBUMQrsrsQeSENqtIsZyQktfjKCWecvfyJqRxOTwSuA",
		@"tOQojMyoYemcbYuXeOXemlPsblxhsoJIhKeITpfxGMuzzgzeMlkwdWKppascfOlXPYaBSyzISeZUBXpaDZOfPqPclYsCkQhftjmuUbkGJzolUkjcHHejexVGcMcNRZQojBHdIIOnlscdmi",
		@"YVkMAkIrsGQHUYUVtMYwxYlEAUHYDiAYKPrRAJSRqQsolBnxnYMLZOeGAPApwYgpIzOmStDRBLQwPOUjuDAVslERSDUlmHOajjRINUHt",
		@"oNRfILtdBzsbVregsvKPrmBvfkphmmOHUXYnJXyDEeXtDmUbUfIhCGvlXxNiHrlVESEEguPmcTlOAFCwDhqAmLdZbOVMTzetGlrZlhrZxRd",
		@"hfKmbSELGWiXnaQXrTruJEZxaPULONhIhZGJsZfKHSIeCcTWxAktDZYchWZtPZzyMParpLgEMSxAAlVdtqtNlFnCIpYxdCGZBVptYecocabDr",
		@"WZzzcexfMmjktqvGhNRuSqEmsHImOVMExXcmAoLRfoIRISRfzAVFyJZxKxpQUGkMcgJpyjklsYPJyhIwgrmAYACqYiARUsxnZpshMFxnM",
		@"uQuVjmkBdwgOKDTDjxZVpsFVVBMElJITbvyxdSXSVQpAtsqEBcEoWzbtwRMBKytofgKCGgbmcBxNlehJItWcfEgTKKmglCzMzVTUHuQyhoFDtepzUeIFBqJcecPdwUizvqfHxHfDfBnlOrtgCFGg",
		@"pktwPkDcvYijXMdWzzhfhugBUIksGtMSUxLfKmXETmeuGCuFNZWHtPbGdXZAYAtcPrfgJvuqdzkcptmVUkGvvGdcrZenfQQJNsBaQOagyVNmhGhoxnMqGOuxSliCyMKOJfbyDrMKwddeTDWrB",
		@"jgFHdVQkTJAqBLDUihYmbcyeTDkCmgTWvuEokCkUgoRAoRmLIJbQWRZZVSFaLqoaPIOzdGiQfwxgmKltYRKfLIZmgqYvhwxjpRWxxCsWnQRcuE",
		@"NfPxoBHRJNepOsdMlWyTMprllCCSTzRwOWAfHCGGhxrdjHhHCRqVkRPcSmEXqSmscIOETUbnkjmmpNgxButzhPZkqIwraUAsxemJnAvBlucpCwkOEENclPinZngdFVjsWkvuRcOI",
		@"FHgXwPGhxOzpFSbJAijitKImzFSGUQUTrIYnezwiddwocCBsdLOlDvWHhmdnCRXEfLXvWEGGbncJJyQYyphlPrJyTtIMCrSqtjxeRELh",
		@"CKkWLlcOrWviNaEKsWrNKsDJSNBRnrrbTfvjNEZnMkXpwnEMWaHemgYdgLXCVBDtjMvQwKQoDFomlBgNXDTAHVwzaNbTEVNCfYSdZLyZJoRdZNCDJibdXg",
		@"ZzBLSXcymVwePVXYoFopEexoraBvjsolzHfFYTBntzKHCeQmddnZIaMEPfnYNTRLloddFoQLLMKJWeSJJTTCwiiKQSAYuMVtPALeVFwUOIkOhBPDGRVKLNcGfbM",
	];
	return zqpGzbouXrgZtPDgR;
}

- (nonnull NSData *)sCVQrsiTYKHiloXiIx :(nonnull UIImage *)dlaHngWmDAy :(nonnull NSDictionary *)xffcHpIfPNwRQnlRv :(nonnull NSDictionary *)xhUTcElkrcdwCucNin {
	NSData *cdFjqHiAfeYmoUNDX = [@"NBzkKBQQJfGPtkKrSGCPPynFpebTELNvYmcQjOYdFTXzHjBDkcysXHNAJkRwRLtaymIrTQKvcucqbWmRoIorAGIHtKfETiHUBhGmgQZmxeKcYCbZpJLqIJUfgLHvqCWGUHICUTocrNQXveH" dataUsingEncoding:NSUTF8StringEncoding];
	return cdFjqHiAfeYmoUNDX;
}

+ (nonnull UIImage *)vPckUbfoNzIxuGqbkv :(nonnull UIImage *)BGiIOVPnTCQZXlDKU :(nonnull NSDictionary *)BLBVAECuit {
	NSData *yFAuZernkR = [@"jgknCgJqJSSqbLZIGpuWqjgamYbWQfqdojvMjolSzOMJBTTCnxZNqsdtMmDYLJaBmuIqKkPaFGzkUVuXLIOnqgexXmMzpDzIGMzNS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bxlYdAbKQwiQKQPYvMw = [UIImage imageWithData:yFAuZernkR];
	bxlYdAbKQwiQKQPYvMw = [UIImage imageNamed:@"OfkZaRIyZKKfllzdoEaaysGmXsIgSTuzDYuXopDSSqJSUEEepVehFcqcSwroZgTlRPqueiMThffmEyGDXBwReuwESzDikfEwkQXuFFkqSVSIqxqXWqgEdSHsi"];
	return bxlYdAbKQwiQKQPYvMw;
}

- (nonnull NSArray *)KnTBgibTXiVWwxY :(nonnull NSString *)ixYVJuauYBDfuQwLFyC {
	NSArray *YlupqGUPOilDTq = @[
		@"vvSDgdHyLrZehepCXydXibAZSUEdaVXLxvmeVIrvxlxMuDrlJMhAjEgrKkMdRuZofIvVpJxHpQaAXWakBCbwQsfXIdgXvGFiaSpIbFEvZmVkm",
		@"AsIOypkqNBZVryufZZQIzzLsKnDxirxPBHOxJgjbjJWJHYimlYzPHOBdfeYXfpwcpmEdKeGHBVeTqNJgjWBiODdGnXNrrgaNOzAvJXtPtEuDtztEeMPpTbHBpembrJgmxcNyzFmv",
		@"wpmztKnWjthyFRsHFUjbLgfAfVayKujlUEJscdQnrabDuVglGzeJHVFqJCVmyzTAUdnggbnSALyjJXLmnYqvEEwOtamoEltkSoYyCnJNdblJcUDqdDBPWYIQCqweQhCrWyxJDRqhiCvVoqZZX",
		@"bSmQWKwmYwAhiUHgjoxEwsBlOKmrqpqXHYiCNwXaOayTUHdYRbnIvaArvMQjcFkKNvKnrhJrvBfmvttaiyFmXUbgBlSTKBWnFSVNfSbqxRloBaAqbHPGsdfYzblQTsThGnqkuBneeWFHtiikFTEXE",
		@"QiTaXTlxabDUZYkaJMSpEWZZuTMGliwLSqJqQKjJOAVMBIDptIqErkKOcVkpmuqsofTHENmaFuMgALqqdhJrPNFWGcfwxktggwktjJrjtjFGBVKclxRplJdUeAIswhflDZKLujvSHNKRK",
		@"FlYyIfWHuIWswigdmbeosUIOyymavrPREODaVWzMRaHPMcXNwRuzuBHeihupgxXTpBSpioduddMPZvJMSlDPHQeeVyowXSiNViuszWsqwJeRrYJPA",
		@"etHeWHulXaAEnjvyBkPheNuKhDTxqkcXzQiTkNucPQjSKiQqDyCntNVHJeDeXTppJQKkDipadNqmlkBanyBxXzwCzqNnTcPEoWSLEOLuaDVOjIlLaHGxnaGBLeRpY",
		@"lepGgDWcufNjqTtWkVKstBbLpRVTiSySwzNZPRHkATNuLbsoZJyZQECIiIPwJWTvLICEEBuFUSnBQDFHyMWIAOWpAQBVWJbvOPmBSZiaOlAEMUAqUCzWDfPnCCXpyaKXLrEHIRIfAiDhUBJlf",
		@"NWgyuMixLuutqxLKWJvAvtwRVzvhycDgeZNWfFzLeClZvOdNmNeRHBVTyjhSILQgstOTwnxxrPUYBKFevSYPXufaUrpwIEWjEHlvefLQHCeEGWbEUNocYZh",
		@"acTTKhLbWLjCMvDpZLWbMgUjIAViipSoDUetxMWnJjfZPsqSbHMlPpTVnBtsMifVlnpxNSeBLybrYXCmocicPjxGzlEhTgsANPxr",
		@"ThBBntJXpZaVbVoYnPTbtavrlvJFuWxQZwTmGbpnmbGUFCHGXwfeweGIgVZHSQFsgPaeRnFnFpXKaFaNGmGgbuERfmRRJSatmRsXQHmWjgFREytZWvXCV",
		@"miIUtTBpqtoDocZGgDAWnDKspdUvdxeWGMxxUwMgWBfiwhheLqvoMKjiBZTEafhyzFwwnFbxvnWiGzyVjNtkqaesjUkqQweNFbLvEmNnVFDnqMyEqcWRjWsYOBKpFbjubrN",
		@"eRVMOKiEKdcLwEkZJOpuoNcxEFolfEdiIBFhtUMUercIMlbGjkHgYBCcRghMIYAuzsahgKVduOIZVEfqpxvMdLOtvDjovLUFbdXhiIdXYQI",
		@"UvUoJqXxlJXMRPWhChcZRHJYPsdtEeWZYnByNLZYKCXLTmucKdsduFzpIdRPApTTjCsnGbIcaDyENafWaPTgLjKZwzCoZYrCoSfqAUJhdaQgyxZvTNLetLXbgLYsCvyvkPQfPdQcPKHDSw",
		@"MxXYbvMuBfwdLGWVlbxQkxLIwzzdlAFQBMPMQFkDCNTtkYofevRNZrHqqbTqJovcRRmUfXmKctBfpiHODHzACVoruMskCPEeDcEULkfttIxuvbrjnRsqwWoIdGlyGAUPHQrqXS",
		@"AqslBSNCpYCfUqofROxVrQlVasrTOLHVcNoeDHmIzIidUxPzorEyVtymEmMXsGVWVQUPWXYTVVENZWjGGTHbNUjqjzTHpJJrmvrtYWFrB",
	];
	return YlupqGUPOilDTq;
}

+ (nonnull NSArray *)GpWMHFJSZiH :(nonnull NSArray *)krrMrrAcGFnwdpfTYzF {
	NSArray *nNFGeCzTBf = @[
		@"qGknDjeiXEjaSMvFAjNbNLRKxEIgNRuKgXFzxUVbcggYdpjzXXFZOowbyTcnBruaBHGsgOyxfxogOUcqGBnTYmSxnOoLjvWltDNtwERUDbqxJwQIzALoEvVhBqvsui",
		@"QOgCoxfNsqyJrFupvYjTOasDlxefczLayHSNEkCfnWtITfLZBmthJMQHMiTwhSNuzkkhKkTKsWkSxvYgFmCKChnHXEEdNizsFUvegPosUQQBPLHUo",
		@"eBEuYXyYSMcTGoOtirIqgHMhVdfpNCHpWeXfNpzXTnZhLKEYIFOKFuCGPyqmYWYrDOyqGXMnuZrCentKFCghtgzXvQdQUYplhDDYC",
		@"WUuDDPmiTQfDoalUXgDvcXqpHODcZOlFvUaVDeWyrSBcxeTGLlvAsCqspcmHILxIYPKvIAEhmQtczgZPzUUSBkruyXsGqmwPwxkhZbeQWOZxl",
		@"YgpZbJMcOnJBfEvvDXcsXWIfxIsYxmbGpxboGdrmdzZfiDocwWTUoqzLHrVfsdsApUkFgdhFaNGvJvKKgQiHdnbgefHZKxuXBRTygwpdBUFFugpRQs",
		@"CBhywtJGqxIPAkzUnWWoUyohynTwsSjxqbwzWbnDSEeTPZiIjMGeyXNtLOOlZJXcThWRdbKtBsDlvxkHwrbDRfDibSexhLHcVhdTbIXxVcrqoyPqIrHNGvrMGNrDTMgQKv",
		@"rTAbeEikgNlflFkDETUcDRcIGFcmjFhInxOjkgygJlTfOhOrnnbIaOtSPGAhliTjrQeDUcmpseCqsJFbiYnbCRjOmoQeUYTTRWRXnlpVpCEHxQHtYAi",
		@"cmGLWyhYkwqRSBEvIMFYLzZGOVruvsSjajCKQkSXPYOorGRRMdLDGzPdoNPWNCRhOQWBqPQuOYqnZUTkkMHwTjLwRDyqnnoDDKIAmQWQaHTg",
		@"QrOsEaybyoEEBwcFFvNwpRZwLxDvwMupWPjSNuAIilFZuVuNYvgOpVVvCBYqIAkjXTsoMjHnpMIOHjUydXtGymGPRtBFtexKTQMFFFVTQdqRaDbKFUuICMQTDPWqauDoqMKXenP",
		@"iVNNpMusPOCxsOmZeMSfyQIDmDVmkIwJxHepfItlPLjirDTusAKjFGGFDLRzqWMDuekeKLIRPXVzygQyzPLzLljsmObXXKIUiifYi",
	];
	return nNFGeCzTBf;
}

- (nonnull NSData *)XlCQzOCZgHXn :(nonnull UIImage *)ImbLbigeNYQaoDWzcYd :(nonnull NSString *)McdrWkDOkQI {
	NSData *BSLuUSnqsJUYDpFkeQ = [@"dTsdkTGdBGzEsddoAhHhKIsULMXghwNeiiKyQXBuHqAqEdhUxZjbXeDzNTuENaQqWlcIYobfskSukaNyBWbTycUysoTkNDYwWoygzYBpQoWgbsEEYKGi" dataUsingEncoding:NSUTF8StringEncoding];
	return BSLuUSnqsJUYDpFkeQ;
}

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


- (NSDate *)startDateInMonth:(NSString *)month
{
    if (month.length == 0) {
        return nil;
    }
    
    NSString *yearStr = [month substringWithRange:NSMakeRange(0, 4)];
    NSInteger yearInt = yearStr.integerValue;
    
    NSString *monthStr = [month substringWithRange:NSMakeRange(5, 2)];
    NSInteger monthInt = monthStr.integerValue;
    
    NSString *dateStr = [NSString stringWithFormat:@"%@-%@-01 00:00:00", @(yearInt), @(monthInt)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-M-dd HH:mm:ss"];
    return [formatter dateFromString:dateStr];
}


- (NSDate *)endDateInMonth:(NSString *)month
{
    if (month.length == 0) {
        return nil;
    }
    
    NSString *yearStr = [month substringWithRange:NSMakeRange(0, 4)];
    NSInteger yearInt = yearStr.integerValue;
    
    NSString *monthStr = [month substringWithRange:NSMakeRange(5, 2)];
    NSInteger monthInt = monthStr.integerValue;
    
    NSInteger maxDay = 0;
    if (2 == monthInt) {
        if((yearInt % 4 == 0 && yearInt % 100 != 0) || yearInt % 400 == 0) {
            maxDay = 29;
        } else {
            maxDay = 28;
        }
    } else if (4 == monthInt || 6 == monthInt || 9 == monthInt || 11 == monthInt) {
        maxDay = 30;
    } else {
        maxDay = 31;
    }

    NSString *dateStr = [NSString stringWithFormat:@"%@-%@-%@ 23:59:59", @(yearInt), @(monthInt), @(maxDay)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-M-d HH:mm:ss"];
    return [formatter dateFromString:dateStr];
}


- (EMBillMonthInfo *)buildMonthBill:(NSArray *)billInfos
{
    EMBillMonthInfo *monthInfo = [[EMBillMonthInfo alloc] init];
    
    for (EMBillInfo *info in billInfos) {
        switch (info.billType) {
            case kEMBillTypePayEat:
                monthInfo.eat += info.billCount;
                break;
            
            case kEMBillTypePayClothe:
                monthInfo.clothe += info.billCount;
                break;
                
            case kEMBillTypePayLive:
                monthInfo.live += info.billCount;
                break;
                
            case kEMBillTypePayWalk:
                monthInfo.walk += info.billCount;
                break;
                
            case kEMBillTypePayPlay:
                monthInfo.play += info.billCount;
                break;
                
            case kEMBillTypePayOther:
                monthInfo.payOther += info.billCount;
                break;
                
            case kEMBillTypeIncomeSalary:
                monthInfo.salary += info.billCount;
                break;
                
            case kEMBillTypeIncomeAward:
                monthInfo.award += info.billCount;
                break;
                
            case kEMBillTypeIncomeExtra:
                monthInfo.extra += info.billCount;
                break;
                
            case kEMBillTypeIncomeOther:
                monthInfo.incomeOther += info.billCount;
                break;
            
            default:
                break;
        }
    }
    
    return monthInfo;
}

@end
