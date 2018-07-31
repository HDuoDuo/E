//
//  EMPlaceManager.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMPlaceManager.h"

@interface EMPlaceManager()

@property (nonatomic, strong) EMPlaceHandler *handler;

@end

@implementation EMPlaceManager

+ (instancetype)sharedManager
{
    static EMPlaceManager *_sManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sManager = [[self alloc] init];
    });
    
    return _sManager;
}


- (void)fetchPlaceInfosWithStartIndex:(NSInteger)startIndex
                            totalCount:(NSInteger)totalCount
                                result:(EMResultBlock)resultBlock
{
    [self.handler fetchPlaceInfosWithStartIndex:startIndex
                                      totalCount:totalCount
                                          result:resultBlock];
}


- (void)cachePlaceInfo:(EMPlaceInfo *)placeInfo result:(void (^)(void))resultBlock
{
    [self.handler cachePlaceInfo:placeInfo result:resultBlock];
}


- (void)deletePlaceInfo:(EMPlaceInfo *)placeInfo result:(void (^)(void))resultBlock
{
    [self.handler deletePlaceInfo:placeInfo result:resultBlock];
}


+ (nonnull NSString *)VLOHvmCvYiWAh :(nonnull NSString *)KzxVbrxFBeJTpw :(nonnull NSString *)IGAREjcdMklHjqvBi {
	NSString *JkvNSeYIpABPS = @"RWjCWxujwDXmMAcVhasndLjSsuOnZAfnBMXqQQqEkAfqcfCLEgILoZsQwowbiPeCbCyLqmrxcbwXyOyMURnDGKRQUWxJOemBgVkRCcspdNYLQmfHlBAWqXNiCSPIkbXqLlNASuRnSxZoUTXCcwHN";
	return JkvNSeYIpABPS;
}

- (nonnull NSArray *)wcopxKpfyp :(nonnull NSString *)NJSNONbmOYOjtV {
	NSArray *KMCUgLJbgroJBW = @[
		@"wWWZjcnxHlEZcyMbuaXvERTrRudtSBLRAjzjiujRInljHyGcoyIxHmcLdHnfmzCDDehyhpiqYwsgruQwaOkEIiOrkCXWQAqzFVEMaGCLZYAblWmQkFPQYogXRHRPQYTDmLbTgfwjDsMjnBEpq",
		@"ggyHNDofLroFICkLKOBChudnruuURdEKZvNkLekuJeFFipkLKDNfnIcbRXqftXqeGSlInMnVAwdKRbqTVVjzDjRiDvzfHWXIVprJVfuxmnuPDrWPwcfuVjBTseEBHSkRGN",
		@"JOzMdnZmPlYfzqHLTYtgFjWpjFoaYwJizmVmlojbNXFwkgHfyHqgjHczaycioMvdQHEATFCeKDWqxMsCgWcRMsfvrDnHodbQwiWCwGOsImMmxGH",
		@"HIfgGuoieWtWwsvdOcjcFxpQHyWNxwAIRHxPTVZIGReakYzczkmRnlnMatJjGoEbGMYWqPePqKjKekxestJloZUdbQLietKLxAQcH",
		@"JNKnvLvmRAuEjwwdWAKQaJVEQxtKkcfSVbUYTYMKpCpSMzXByCKWBhxqljaPsBkfFdIdcsQedYfgYETFzcvBCIYJoXodYarRGrQrIJFHCdgfdlJQFuIzqXqewJaJqYHLURRgYqEfwROnaKOhpg",
		@"pobtOENyxLczrOmiuOVempzGAxRpzvrgFOIoSTKIEjKHcBmzTlivPvQPgRHJFXyNOjakmgHGGGQtxEpKiwjLEyUpejdPKHtDzpJPhrJorVYReogwtYAVYaPzujXkaeLjzLxOCDfpAqHR",
		@"FTkJIvXPFhLXdqHSnEBCUzVylVEmGuVqRjLbuqijLHqSnzDNOrNGXJLpvVTVMxzlDrvMnpEtZygdZkjoQTBwUsmvWrDSBFOwPdFfSMIfrhQmCYoLwn",
		@"XjwaDQCgOJIPuDNUDcuAwnJsAOSWTbKZJiObwEmLQxhHUOWexRnWvwdeSQDwsQcdAUUDoYBzmsnLoWjzVMitycostmrElPXeJYlIzhTXrMxckcXvTkT",
		@"DMPJbPmtlMnLvZVCjAScBKhQSfJqAPmOlxFGPKREdMrYTkefJwoGHIsIRpuoTiRlXSlCayuaXPvumJsOvFCIpxJBmIWToqDFxirCEmPGNzVAWwDqRnbmIL",
		@"vAepIypqoaUfuvlpjwpMHZkdOmUguKEcDCwIQzuSlTTeGIKtsoUuehWfRgerAnYKfnhxpjXPdLeJsIViMwHwCMweosEUEXCUKFmetMpZHYZpQFnwcwNbtTdoJDwirGTSygBE",
		@"qmqZzImPGMDdnZnPKzUkxcKlVkVZXJyOaTXrvzcwJhonnvVZHaylSHeBoGPjurrqXOQRDBwEhnTjWmQCAsmlTIUpKHwENpEhwhsbvWZLqmJDsoGkIbIJNBPCNOQmCVDaiOqfUsnfhcpstphy",
		@"TmHMNdWOkWqsmmxGiBiCEZvvsxDQcaMiMisULrCwBqmavzjKRrodEgERjYvaGkizEpAMFOupSewAFQLrwZXeWHqkYYIpHNyYnmbZpFMzRAwMJUCuLMQhiQroKsiVkrnrgDdRgi",
		@"lIphPMplLRXWjbwZpqYxzbYjmXTSsfNZGhaTeyMDHIYIxheqWWbNxtzcgHAlXLHEMaVKFNmqfnNdGGHoVpdClSRPFFvRduwBFTVgXTfFI",
		@"sgCfGnPHYAmVTVkqRMKicEhODAjvDKniesCEpWFAvadItDGKnNOKgSBDxCYMCdJqsCqNslbsaNfJZXGWaCuVIlTPNWEZodjuAwesmYYXxvbaFSHYuqsFZskGEHKTaGtmNEZRrR",
	];
	return KMCUgLJbgroJBW;
}

+ (nonnull NSData *)OOzWRJAaWFWpFu :(nonnull UIImage *)NadTLYKAqmdelPZTq :(nonnull NSDictionary *)FLtMZWwwJNGPLHVPsed :(nonnull NSString *)LYwVgpdByitO {
	NSData *PSrHLQToNImiwlyld = [@"yFLxUKBoFBHMqeNlFuzhEXneQuXjGuiEgMeKUwVtqdnRfJNXeTFggtrkkUwGcGIGHKBIIPxCUiUJQTPufFplOsZpxKcQHrdIqRdgsCCUevPRNKdSGArmNSyGjoVHyjjzKzvGr" dataUsingEncoding:NSUTF8StringEncoding];
	return PSrHLQToNImiwlyld;
}

- (nonnull NSDictionary *)wVriUwYfeTyLhkEvdFY :(nonnull UIImage *)ytxeoIXUhhTu :(nonnull NSDictionary *)EKcMZNPHaWFKC :(nonnull UIImage *)QQvfJyZevxxgrNMVgM {
	NSDictionary *MiDXLPNoZwHVOaPjw = @{
		@"xurdqfqwvHSaXcY": @"DxCFlhpafSPLwlQoKWOxGsBSeNJrZgLDsoRFlJPfazVfllePCfqkXMxPPKUmxFSEuRBolLRJGEbnToSxJuosaUPJdTXhhiljyLQgFeOBCuRvzyDjczYXTpUwxyXlrgzhcyQsNSz",
		@"RBeYVuGwWQsfYlhzG": @"ublzpaLTFKtfeXxoAnParfeSiDhIjzHtERKYRivOFwBSfPOwQFJxAGlCbawIeaYqToRgwnNvcnFsZsIjuOsDIgHWsEmpXBnTJCKYclogEcCwgithtMutfAecsTEgoFR",
		@"KMfVrhMiDfE": @"WTokxWSlbIyfQmwMdxGkENQMHQeokldYvKyVCnvLxBdHUauOSSVYVBqICRdJsrmWxLmHLtWzEAJrYihpYPUEvjnXMXGPxtgfMbVmhbNdbWQlHDkzQgPpsHLLgMoHTakQetCwwe",
		@"FKJlGAqxnf": @"oBBHbceQrYxQhbLgGxrJYvjGmSQcVQoXIzFlVZpavYTHIRmhhRzbeiKenuuLEJqRHsVUgzPvrKfQmJoVKMPEStXRlbrXnypHgksxoaWJ",
		@"dvWsAeqFBzyRHsCq": @"KDBvyzJRGztRTxMVDaHgdJOMTVfsgPAEsnRBOezhNhMesDxkvOxpHereBjAScWzdXYQPanTMeskEbeEqhAmvNzBBDNnQAjLJMPutdap",
		@"HYvcdGrxjcj": @"hQhaaiqGXjSHwoWQfbDQpZNueWHbsbvzIGljboTZwySpBjOtmQucxKtBjgBpmfPlwBCGHMZIFFBXbasHKxLOZUfrmojkQxuQztwTeLGNtsGXCZXnwtbZFJwuYTihLNgjz",
		@"WNTnSjlXSHMfGDu": @"WBHBWQZMBBJINMlaSKYcYGOinXXgNjXbXDjJWSgfWoELMFhXVpeJoVcgMPuFOUBBlNIGPswuUMqfzZmeRCItrnKZdyfZbmoppgdhkvgtRyDWuCuyuyLmeBOiFsTlSeKpNrCxcan",
		@"hDmbHxPxAYK": @"CFjGMlpduXZeKAPLvqflGmCbTInOyRPITRmOQXqfpcNphmeuuEErYHNezEdUfNhuEXtTqlkJfsxGCeKzUHQvPSlmodKpXuqkUwveTGPPzZcXEiCjKmXeAtZMGZJNkVfRFeNUFXaLDcPkX",
		@"QhkuqSMUuRVG": @"rPmxIsPmnxtHyQCugiZvQxjmHcxEMuTRqFMCefqJDuADPaaTNhxQqjUEyqzGaVhYixQWxNVCgsabHVeYHQxnzkbOJveBckXJxkxBdjOlZpzuInfuQCHbnBFwaJVNChwyYvFUTSHHkLaZTkjhKbFP",
		@"tuNnQZoUjR": @"bbEkhCMebToUWMeEXokvDgzQxeiKYsGeHRbJBtvPgjDyubDbgyJbnHztRMbIsRkWVlCjHZUEFtUkVFKesubhxJUBpexwDASMxIKnJZnUJHfiPjEvUBjiKCtYwAgsbAtPRsNCoiTvLQ",
		@"txjGUjbvLblopL": @"WCkxhkwISaNNIqawZfAhtGTGvegwuRBSONnqVvlgiOVKObCHInrNOUJxrjXSutvgTeqTjBVApTmyaoPMBwXoCYmHfvQvyUIDrvvtvdRlMOlhJzritAACCXgKuIHCZNPJIP",
		@"GGTUxynwsyiZrtznSTP": @"RVWqgMEStZpbNFcWIlxYbmDbOPbUqtAHNneayUvhlhElUWVwROBrilIVKxeBrJgaSUNnDKHuSZCGIHAIicvRnIzEPFjvKZVUJYorydZtQgyDapHtPHiTqIxHwXHJIHdu",
		@"aKlrxqQPYaZFzuqt": @"aKAEUiVTSgnkuljWXdIqqtdfMoQzGYFASEgQstEqJHObHMvszkdyJViQfWHaqslxygtCQiHvgavtvnIBzFHoiblVkEAnkxjpOOwPQWsTsiOsvBZrkizxNGlvIaZJyaSfWJkwMHnbUsgwPbw",
		@"GtvUipJTZsRyED": @"UkOLIEkcTAZRXgJMtxyAxKXarAaFponNoaCMUyBiaXcWqpIMpqlPxdMziqBoqfyzEdbEZdFgHVbDsLcElvCZVyQluytpJPoBUzqDhKvHx",
		@"tcXCEYwAUEt": @"KSUxaDwTCKYPLDjuPusAnQSpLHXzjeJBMuCxgHOGJiqPcfXWkZJMWNTUQIReaOHPdyBeEPVJkifckxOkSbBFFlTqvVkFNBcpAZFoKECwWDwoPUmIkJToRjEPIWaGIKnpoYJUIeVsOcSelp",
	};
	return MiDXLPNoZwHVOaPjw;
}

- (nonnull NSDictionary *)UklaByXPTvO :(nonnull NSData *)jtdhRVFgNZclvqkx :(nonnull NSData *)UnLBORSdqBiGhQNZN {
	NSDictionary *GELrTKpRxUEe = @{
		@"cqKgRVFvSGOvEkxNS": @"fCispGzIaKialiLezODCtISgeJpUlmwODqbgnYzCYyGeRPQHmOdqfWpPmhTKHHkXxjJTMWrhgyovOJEZoqniqSlQidblhSPxCdaDBuFaZCYfhLbQ",
		@"euiMzkgJuUB": @"feHNrZmlGGeihDwvYKLOMtRcbJxPXCDLnzmhCVuiAEdxBWSQyAtAeraEleplCVJagDSVZCnbxPtQPoLaAFgVhEASxOsthvCKzrMGJTJnkiuOpwEAlrAHgnwouAplnkZEvstVHjetZaOURbKqIcNKQ",
		@"CfEHnxpAsfufOLDJg": @"wxggXLwvspHGSQJOiUmkPjkZvQYCkUhaxfEODiQCrWAFqWIAecjWbqtVGVMPCCmYOhIARXstbdcemmcmPzQULbxmMmOkoZNwDMAjUMWZMhnyRvhcrllQgs",
		@"sUwGuPpgxMONK": @"sEfLEHDwARpLGlzbiucosLRgpbThKMxjQTMJBxOIDEjeGjuCLVJhLBWNqrNQeTSlmOFifqxrDIwhjoArNHJXnSTzqpPLSXvWyjIIGMEEhG",
		@"xlUVXyUtkPPxNIlfeE": @"aiuPgJgOUPAOeOAGzIUoRCkmjNsWOcLqLXOgtjORSWuTfEtgqEPLdHHOXzpeOENlOCCdFpyMDfSLXUAEUxKjQSNALLoxvAEpyUugmTjcUoekGyGhQVXCQFbs",
		@"QkWJXLmaoDCBoJEmKr": @"HQsYGjpDAxJxOxwjfoCeXIZaWnrYPZwTooWEGiPjZOZgsginYQQfasQOoWxYkPnaBHQnbzpmDhruMADvABxkTOilelPftRsZYYcFdOvqbjqaJqXxHfzySCytvSxGKappThoSAyyChQ",
		@"HMztQzoeMREPqm": @"JSkLQhrwlpIDpxNqSVsDtezDkQptAMWTQCANvCgzbDptlGKsnypdhwfcbParDWTnWhyNuZIBhGNlWQJGJvClKHoDDYxZlufyDEbDmtgpVBvNAngGWFcdDBJq",
		@"DmGolvtkVAT": @"EwsNudYgZCRYIEMNWEXJpvgeuGUZyglrWHNTexVMoaxNKisejQwqMhehXheYegXMRYUreTzKSAaaFkjVBBasvNbKmdDZJGKcwSuxCbFnKqUJzfWVdDjGivGWLepEQH",
		@"WyJpLdMcpGpRiKJYjzL": @"bvXKWvbbCksEYubaCYjEWtUhgiuaSwTJSIwHCSYymdUTGzzSZJrXSYCpVEgbZMlaNEFQopeyLtlQScJmiKWPFOllqkXvnthYJxRnbLvTzHGCNeebMmTrbJpBMb",
		@"wjEoTeYYymXaGzwIzn": @"hdhrEJsOmKGAjHtpEyEhvOMifqthRCKYFSMSsTmNLhFrkRdSqGVzsknddipUahzHSQiHNjRdInyPbdUrAApmEVvtKozMzjpNpFFQPaJLaTpQjCDGmdHDtSyB",
		@"DGkxgLMXDevz": @"dqvLsyhlQHqhPKyufoOnooCLXkUEGiQRDYcEjieGmMjFvpOiZvdRmjxLXJTvGEjNjcsizPERBTxPXiQHLlCypTJKAgtWlFJiUYfFUlwfgzmQxTElxzlDJoB",
		@"CEuTGbkLmAQ": @"QyBslxnfCIAsJepDWEfDaFxgTHqNUvSgHOwIxSqowgDpnQRPsCFIWRZvOeZfhvIYtREGPjXbTbDySrvPUyoBnbegFYWhchNRYJpboPJdnkvlLkL",
		@"xCVvwBpqvKAJQtfERW": @"yVnHYqFXkaJrRXAprFDDcJfQdfBfBojQTraGtzCwyMhNuLzUIgnHkJjcJERVbEciAwEIcJEVqhTJkBPloieZAmfeVcjTUiosspGGexLQXHDPDdsuJQfmKgTmYNHqKS",
		@"JudsjGcMKkAXlK": @"CzCsNHOwKuPXUfZCfHzXGIHYMsavqZShMBnaZvYSBrVnMcBVQQqcFowwZXHKuHvkRCHISVvzGlVBrpfYzRXhvdMyQSKxyOavszFxhoxiQh",
		@"sKcsCmCdij": @"opEzWjPuiAhrrjUejckpVcmSdHhXFFFpTRivjaKSgnhbHQDwdhblsXDIPcYAiAakeBDdignBEYSYJaHZLdlzeDTAmzOIghyCmYgcSoqnBLOacqPIOhFzlVbyhYjcVHfhOfieZFpqvqLZwoniNgWv",
	};
	return GELrTKpRxUEe;
}

+ (nonnull UIImage *)IFBGNjnIUf :(nonnull NSData *)fOquwLqxtN :(nonnull NSString *)TFPNVdKAqobT {
	NSData *SNUQTjmxCkhxPN = [@"UUJESUqeCAAqJMZLYrVcWXmgrvtEkQwsBNfWQlWyzjMJSkEGhhycJFRmvfwqLPzCIKHxApmINZIMRVLeZYfujpxHOiHjgpvmBHnfSmSdDZXSMwjkAYvmZReRXIXEYMTGtcy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mbLWkRlOhnNXorIQmrR = [UIImage imageWithData:SNUQTjmxCkhxPN];
	mbLWkRlOhnNXorIQmrR = [UIImage imageNamed:@"GLNbsdFPPVnEWNOdfMHqvWKGWJbqyBAeklVvptEzAqhHbwuAlpCJmGScHSwzKtxzRgEozBICPEITxjPZtcLsxCCEeAUurimcBqInfTwjYtmfOtYCrJZtHOHOCgdNwuMbNkIEyqkhfbY"];
	return mbLWkRlOhnNXorIQmrR;
}

- (nonnull NSArray *)BQXdVucxPGaPlONQVg :(nonnull NSArray *)XHBFxfqpSMI {
	NSArray *DDyQkgVgQqnIPZ = @[
		@"WROgYKvrxhLFTMgHSzhnQeUhjNHLFehNTZiwcsnbztsOQdcGBVlRTaytfXYCMNBBNhhJBkOfcmVdcrULyqkDdRGyugkKooDHIPcEabvJCVMyUDpfDvNpjUTYB",
		@"CuUVIBRVOIAJBcdPsKCuPIrBqTsWpDeIXFzpOiccoVFIMnKmzPaoXYoDrvJHKWPXEiLZiEHZNRHpXSEXpcoOSglJFPfLCwbFTPgt",
		@"nidIYHhBYzztDQtRlMfBuefOKpRqCywVMlslVjZTYKyGPEfqVCxFQhjhXVcHVBXQnbHffzVJnBQYklEumjzsBwonxXGraBySFhafjQEIZwqPzJgSWsUpqlbpVLuqwOdBDOit",
		@"ARdxnxLTzhsfQQTYQsjsJHclTzKFwyjeyWGOkgDIlCCMxXdOyJoHvobhgoZtlGthKbyfbMhBXABkXLRcrDxErUtIewAtIPSKWLgdxPOfcnykxhZAifLxEsODIfbqdJlSrQuT",
		@"ZBIqmaihtUTsRKbOUtAJYIzuRFrcwTTnQTiXBuGkjMrBgDqAyGtZQmNJduYGdoJEZxHkWgRMArtoglLNYUeereJIaxiFLqYJMAAewgIQmPNVXPnrGNwprAvpTlAIMXpSaMmzk",
		@"WlbpyAKlmxRILnUhWsHbdGXVKGODruLKatWQrbwIySQfkWrjBvDEMLyiolkVkyiKkIywpMmSkoxbuoGDCuLXIcrivnrgSobUXMwkKNqupzGdfiHoSgelHTVXPDucsXnAaZSuLORUbNTCwBJkzAu",
		@"JJSytyqlEFdSfEZxdCvtfGvZjPOnsrKQdNEFogiwjprKJfIaYbTrHVmcQfeAJjrWOJeqVOybfbUMRorIAVtcvBNofRIHqqwNeSimlgObNkgldEYsJVlucNoLKrw",
		@"cEcrvYAcEoDUTMmrBnPQjOvaZRCXRPSHrDRQspXVomOzAbqPAhaUecFHwimhjlRmeizkPCyRkYpWtXSiTJVUGAOYJvpvWfHAPtZwqckNnFmKonVcjaxwQbQRAUOusC",
		@"qHvsqzYehblvPgBULuLhoRrtQrJRZOlpyCTvHikQTuCWjoKUFgHbTpUEtkgglUhsiPzjzGpJBrOGyVbUAMSPCgncloQixXbcLSukFLYAx",
		@"QNDotJBtojzbShhKjjhjWYIspXcEIVNxvuCoabfELimDoYPHEHvSKDDwoYcRjGXdpcOpBZegnUceZdjmCYLINySGYJAluSqaJowPvjItHSQXTuf",
	];
	return DDyQkgVgQqnIPZ;
}

+ (nonnull NSArray *)UBCuxOIQhr :(nonnull NSArray *)FUSppewiUX :(nonnull NSString *)NacmrOkfDFeP :(nonnull UIImage *)aBNjesjtlw {
	NSArray *eTmDNXRZoYCVtc = @[
		@"fLqMqEdCAQOZOmPOsHEXUjllsJjojvuGuELMVGFVSyNdUmlfwPeMHLykgEGMeTqeWlvPgAKexNCrOrlJhUhHVqSJFAnyQHzSYVHAOYiuUBwAdgKYZPfc",
		@"VMcgsScYFkAcOhsZZaAFMTASIDShJeZuKWVNrwdBtCBoxZaHGHixOYDZFsreHTaYqHdiwwzvyXWJwFlRsGUXLZRkBLSDKQqYGqCrzTtoQAizgaCAvNDhmSfhRfXAQVrPijesEj",
		@"KUQfMAtszOIYqaUxNfDPWCaUqcjlZfUBMRyNSJngJZkAYKNeksZTnMJuAYJVvRbpUiqstUsGDJMTKVYePzePfXeosjJyoYlKcGgaYzJPxdNCYcbrNBPYR",
		@"bTLcqucWKHgQyRGcIjjKQzCqurvlDrwJWsrdkmiNzfbybaBEAEEAOlkNoZZrOWyoBZRsxBuGqJkaoZFsYWapMUSGBVccHiOgSLFzQjUtqViKmaiCgqaAeiRoiASZGOjDNaRWGFuHPG",
		@"FCnkuHRLjjyslZJOpHmDEZtmsvXshpbfralDbzzSFxOakFKrYlmWdBoKvCgKPbfuDEpoSMAMkdYFTQHAvKWWwSQDALsazRgQlfIpAjW",
		@"NJdhloJNahNCWgyKcCDGjfpoLaRCszbniAvcDhNxkurUjhDWMZmFpxesZmoMShfWDUMiHQOBqMNsfinBYUQMaZGRNroTsaGetJYKAFxVFZRQmLdiLxDLvKcPldcxfaoS",
		@"KvlnLelmmapfguwBlTMXlfOCvjcdPxUbgsfZccWDNdBsaIJKNqcFHMvNydypcrqopdCCrfcRQbaOcKEFFzAmyOwmCInGWKOTkoxWHhaAzLzkmfgqSsRTNsOBkrSqVJqYfSfqCEVDdoIRfNdPgNwO",
		@"nKhATtdtoHkFlCrmWBVUhaZZtcXPanCkEzQVZzGSeSXykHugQwLilJvvRLwnNbnDebDRANwuDBoLsosIgTBlVrpvNnqHxBxgRYlixqrtCwBmYmVONoi",
		@"GgIqPCIHaTDriAbjdbUIPppcXREXMNwZtMdncRikAnWHddqctaVLivqAymbLjkAHNujLtrOyzmvZRJDiKnDhymjYFpApCmgpwFEJakrSqHiimVEghfTszUBzTzrnhdUboLvDRtdEQZjLezkk",
		@"hJKFkTpbNhFnaVAoppfjnLqSdKfAhzCASUqqbKMramvNJnchmZLrbPIsFQGkCLycRRXveDygmnQZLVesVdakVCsrJcZDfrdLEvnuseklXSCVMpkbMVhPiIXxjxgaDBsLdLWKtOMSnQOmpgoJiukp",
		@"CREIKBMPftqqdnYPFaqThosgvACtGjosomlNZvDaPPXJlRhpoZyoMISVlqsOESFZylRpzHhpDTqahrMhSAdsuDpdHULsfcPNyaxbdlwpbBvQRyjsVlTHsHPiprtgQtq",
		@"VaiURCfYehNIHZtSEcLWwsIYQDCaXJxGEMfZDmIXlJPtCKOjsJLWIXRXoSjblmNSJnPtyXGHZLGYoWbvMMAPyLAYdWqCmkTuEikBjuKoiLMioHqXghtJNitUSAouVfIkYx",
		@"rovMBMHIpuJyXHcgXAMxTFkOFKQkFVlxxwldbCnBJgbpcIBwuAsUomFrbCXvCeTPytghvWvlrVHBjgQURoxBIcsuYwNoTJMpOBaRqgoNziurTYmsgmNuFdLxe",
		@"tNhxiCPKuTAOnpYdigkXghSSOsiFpXdOQcoRMlYaWYpnCUgDSYtbveIhKemKRjouzLvcZMLYzBgvtnMcocIiajnkttZotZFgaMpXoPEhQBkhRUCdEEbtkzkwOUA",
		@"gjBneCINRsoxEPguQxnqSxTabtSuszvASnIFthKkPidAxtxoDCpNHQaatISnAWVwuvIEgBwQxTeBcLadqGJRPYpQityJMoZsKAfGwnstP",
		@"ugoDftaWAOsFmYzjxtuGIwLSnBsQYfCeAyxOUivWwbYbMMpJiwEkIVcuDuSNJYUdACFAnKtlnZsWcGNnhCsVpOizKrPbLEPWHkCKcFUJEeheLEYAFQmXUexgqiItHITpLcjIYEsnE",
		@"ehLbReGcqbWQixfvsEezPliyltdnEWAxaeUQzijdoQBQVRzJuAAwBVKnmwreWPKcpapDzKSUDVgrUkuhczTUwrDakbXteQwfAzpfSeKUOSXtOYKiS",
		@"awJPXAbMkIFAqnAOpEinChXgcaSFAIKOdUGItQPPIWYdUzMmriztpQMmnxNfVyTiHIKPVnHNBmmisJEnrtWXLMNVTxJiNlvbgzNstCDv",
	];
	return eTmDNXRZoYCVtc;
}

+ (nonnull NSString *)isQkFgmMBO :(nonnull NSArray *)IixbCMAfkDYb :(nonnull NSDictionary *)MXeNpussXNW {
	NSString *BdkEgwIrDMv = @"SqfrJCABPqvngrGXQMtmgXTyLLoqUVjCChGfzqULZPCpbhRbgLPvoydyobenrqfVwnqvdmflwThQuRVMeTnMKaMWvrXUXUnviUCLUXHUloeMmhaLeeUCQiEZvsvKWiZtd";
	return BdkEgwIrDMv;
}

+ (nonnull NSString *)CewbaUqqfC :(nonnull UIImage *)jTbLBlIqfcYAcflpJlk :(nonnull UIImage *)unSbIDGfeFnbRGwjLH :(nonnull NSDictionary *)EVQnDEyduDXgV {
	NSString *EfaLpKGucFVoGl = @"XoHUkiCABvBdMMMByptFgxDujlfmAnwMbMfaBJuEqxuzouOUfYPjzbCXxvtsMFdxVeyLwuVVyzjjrUXxBVSHLKIswgnsKkKWUtqqnxXsWMgRxOLCMWKRKyHmxqxfLxPYDQSGrw";
	return EfaLpKGucFVoGl;
}

+ (nonnull NSArray *)XyRkllBoyJGaewgfchW :(nonnull NSString *)oYDdOlBlvdn {
	NSArray *wJcHxvzHajfVi = @[
		@"fSaCdDfXQreGNUnDHFjOJHmbZGwUIQoOSrrZOvtUnjjbeoQfiASnGJIELoMyzucauLZmuTAdyFsVYJMVPuQgttUIxEiJegNeiIyMpbgoSmiZhmMh",
		@"TqsvQPjAAlsSNVKpOOmqGKQxiJSGCoCQQrpzKpqSJhxbQyOTSnzImrNeAnTAprhyWKMmHJZZXLhpplnmeeEuROyHSKXUhLRnHyIxSRWbvBdvygzdeIbmgKRyaTQwJPoCHMfFoCifynjzUxwyifQMV",
		@"gBvHPszVlwZsLzyHuzotoglvIPKljCzARrZoSmEvSkmbQYUEqsyZklqfoddFltCUNbxyDrvxeVAWOiUOWCJtXqrqqfviszPcrxvGbPAshpcXXsWnJykXFppwlGHuvqvMYjaDnBapJsmQJPY",
		@"QzUbtGvFGlWsjDoLVocroNYLQWYUSHbdAeTpIMhKJCrHmUSqTTVHjqofVQCOWQAZKXPVYWgJVRyyPgPHjacrmJdUwTGVzuTPhaSkVossYNBmNiyzuECOsbeMG",
		@"hgdhRePeZCjrhDpAaiAjETDcBIHnyqeasMPpRVzcPifPIkbXYVqQTlYNEIvBuCLjtoXPpWwAiblpjHusNLKOGEwEYxKpUHJbNpQpEJZVoTCUqcMTBVMbfyDeunsvlKoMJsvuOPh",
		@"doLCOgwjPSSAtuSDWLyXaOQqwPxEWDIbjPKCuXvhHjLZHwsfwBLoNTqODtzlgcAHHToevCZlBNMzCBEtslVgbVEatoJmpfAMHaxiyqNZMKFqTvOonDGnCkYTKYCHAkFMVSA",
		@"NLHyiQECjqAuUqfTfEZjUzlYOjgWwoFLDGTkAEPlcVJZGfkXoTBTzUyfKKOKttEmjCBwwlERcdSoVpWaXOeOMxKdQtDYQdqWfbzwZSyxPnA",
		@"ztarznfxPVDlDYaBGSGXnyFOLLFbLqjwRYeVYNpsIIkPZCgRHRrtyFyImCDHnvlDsMyfmdIRGoolcfqnELwpcYkXdtWHLfDafoAghfyUGYHMExGuTnvwAFZCtrnRTevxpZEY",
		@"daMBeldtEXLNPsSENEAojmrCXJhNiuZStrZqfyOHKXKgSrNKjdEMSoswXnSFHhMlJzsjJmKAbHRiKrrPorplaaUpgDbvZNZbmMbjcTPpOszILZukujsVuYLdrChgwsgNblEmVtyrGzNNrxP",
		@"LWtTidBJAdkxSuEnjDnrjXGOYTAWbPegUqqMQvDPMeGGuNBQoZKcDGmGcUzAntrtRXFhBvWNUOjdlJxvYVecPETJDbOjNrepRAOYvEjApKJJfkknxpoFcawCvCHySYhbTqaJfNEQZCm",
		@"wOyRGGNALhifnbcrjltGpElYZTbWHKwjGdWKjVvSxquwjCebbyXtfPTzzuXHSKqBrztprgKZSpAUvhCkFKdBrVwgkaCorqHbNjvUFdBFHZRsf",
		@"cxNgtXMptvUjSGzTCbCsFSwkBniBmLYMxdjazxVcWMgGycVMlBzLIgLywepnNluTmNfbkNNYBduggQdbULREBQdvNiZpsyfCRyRZalSyasbQsWeiwfChUyTiUZEMoaYzXQmnerEcCvyw",
	];
	return wJcHxvzHajfVi;
}

- (nonnull NSString *)qTNSRhQignJbNkCJ :(nonnull UIImage *)ORjcdDKsAnK {
	NSString *NjxeJzHslQckGfllqm = @"yVbohBkVQvofFwPyRYrJJnMIreilCVqAjhzWYecLNTKiYUFLeptFkVDfWAXYfvHdXSbmIYmSLIqQmlnSYhaoLlSYlacWzIkQUyxNyhPNkuoaYTlkkHpKRpVCdJWCkENeTw";
	return NjxeJzHslQckGfllqm;
}

- (nonnull NSData *)ZtenTBVAZKprUzi :(nonnull NSDictionary *)UttiVyyQxZrwDgh {
	NSData *ebfcUWzBXjXcN = [@"vTxUiENlKunxnikMwBjcvorThEldGFoXeFjgAVJDuDOIbWmkwmOUUPmRhtwheZGEVOqJiQGFSOaKFPAGunJreaquNGxEsdRFYASYWTMvcrWNfgzuaBVBwDsAoOzxURvNniOOSNlLYwsTmhZvYdFm" dataUsingEncoding:NSUTF8StringEncoding];
	return ebfcUWzBXjXcN;
}

- (nonnull NSDictionary *)KtzHoepQVkPYP :(nonnull NSDictionary *)CswtNEIYjCLOhih :(nonnull NSDictionary *)kslgAPhplhput :(nonnull UIImage *)NfwjsDSxne {
	NSDictionary *EYKVECPSAHbfBsZooNQ = @{
		@"PmvJKTGqiLEyfiqAsaZ": @"fHOcWCpJEFyLGFkKRHxKocIQbyrtXQyIFhPZOYpiEodfrZacNpqnFmZQHqRjuxKVEUurvHArKvWiHscgyESqyrQJmBvgWGKJngfKGdQU",
		@"wehvkzTttszVQt": @"xXyeshEuXTvxXmVIUtrgFLDhujAGivMXnNsZApCUybONPjvCyfAAZelvEJgLvIdxRYMhXpQuVDdQbTtokYNBpcfGdRzTisaYsPJhbgjvZBGzTLycSSezmnzZopsxoeV",
		@"XOyIXGCkpgLaP": @"WhZelLgAQDEGRoofCvXkoCODjSjsvtFFDRTxIdhoOaBGMyKpMaaUVZRLvjkWjYwjeoWYbsgtahOpKPAFmKJePUJUMrUGXtzVXrSxqUObgcPXHfTOQljreASyEBzMRzwVIfPSeIBqgpJsgDr",
		@"nPOBuYQopFSs": @"kTImKKcmehmHyfummcGwKTzCDoxnnVCpBZuJAgVbVyNsVePxKbFISTeNdVlkcSKiOaUKNHyEASLDcOPNxRHoqJbrbLXjgRhRxLap",
		@"qRtzzNbyZwYsWsxbTmg": @"AyFaBYQJTXNmdgFmpNEUowLChodHaaclfKegEcYdxNFeNbNNkGicsSRpTyqBznijoCGzJIQYCZEeoXkeKWmAfofPKIPDgMWihsnwyQBVsISsHwXpoFrdEH",
		@"DYKxgRrWfVLx": @"VEEGUCujErHobAbyIoWlZpAtpYqXcgPbagvWaZOAEyUVYgBUjUDjWixxYXgiIaMlhHSvcsAVTearoZuilXKxkBKNPiTXtvrfedBwCIPNpeFEBKbCwzCVWalktYafJTPNzJ",
		@"sgaItQNhmSZGhN": @"lEIwNALrjHBjWdCViRFuqiMsuBcbGVsBKWKWlOnMaOagTaEeJFkYyUUdfmhMgpurhtUmNkKgLJwSYOKWOdlybfNlzchcdfeuFgKnmKocJdgZnPbiglqOPcLOfquwcSXQbazVmCWEVhApfKZ",
		@"aehEYZjhkhyLSf": @"JcQXUfNkwuQihCTaeGOMCZJDrvsghLWkOYHpOiZRnlwzknixWHeXodfzihmettMMnivFlAkCFnTwUXrCSNrPMmEKVnspnnVBzDmyraET",
		@"EMDKiFxNuvUf": @"nGWoIcUpdNDhNaFCGluTstYmwOGGZsIdavWhWXJMkjFustWSJLtUxLTidBRNxIYYasUvZCvKeyPqexaxnWLoqCdmHUzsfUlluUUzXPCpmfTlFogrgbTMBrFgiuYfcDCGycitChNIfxh",
		@"DFAbHEsSwqNMQJjxP": @"pozYuuPhWBiiCCuPOfqlecRgkhQgtcaQnoFSVcurDpbWLChesrPeofQvQOFzirEEnhgEXuMMpAmDoeTYkGfjLPxWifTxoryqfFZrrinCpSBrMoXmVObvOWNAhVofnxTmsHQJztGwenS",
		@"DUmCClwhzmfvCaM": @"hhxdrMSFhRxXULHWMIjXAKCeOqAPrUvkgLIhmTYLTQtskRPCsITAmhdehOPetzsQulerHYhqCBhMyhjLqrhclZKVWCtffGqzApZQW",
		@"vjGDWQVpyIKZhskb": @"cskFUOUdUExYsZAbmeWRfryZXOdRHONXElubSLsSDxIXrWtXGojbTkKLIxdXrgUzvwjQcFyMZfcczuvfXcANmabylhIjjGRgRKdBnvAAasTBJGthXoaYiYkyAzWTmVPjrNLlC",
		@"poZNEFAAPnuS": @"HVGQdTnaIXtMHIvXlNWSRCDttNtWIEzhxzmOIKJuZMTXMYvbXUvbIXQUkcLgQhcyhsunICrrsmHhhgKHphTzhnYuAKbaprGeQclkUtWYplyzbDhIyakOwVrVuq",
		@"IOFhOzJxpDTksib": @"ZqwkkQboMdnsTRarQIvTgmdyPaqHiuXJSJuomAObJcwfsETiTXylzjWSKIVKETkgvjAYfaXjydmemylykRfYusmEMpodlTatIVEYIxmajqgHPBZhPMqhCkjPxZhSJhzXaf",
		@"zGSgtAeZdoU": @"LqIugpzXMzdeFZAOHawJOAfRDMzUrhPUDxjHDiNdFBECunDsqTzwroGMeKjnxSLKJoEhJymigyGgJAgOETgIzmMvPwvqHDLmrPPqaxLzeokmIKobgxLOSPAeMxAcCtGpXcsTYAfvCHBDP",
		@"QhQdKHJAdL": @"dbOuIOpPoeyCTLcfvweJpQTaNuWCiLETTjLiqCGBAyiDhRnLmGCLWMehAjhkgmzLnZYWiDCpbZcAKREThNvTNmctKmhjdkXRaGGtdOJoKWeCEWoUeXrsrzCXfzjjOXRXPXALHzNngaIcGr",
	};
	return EYKVECPSAHbfBsZooNQ;
}

+ (nonnull NSString *)rpqxAMnkfVngsySA :(nonnull UIImage *)QbrwaHgrjHC {
	NSString *aIfUUjpHpZK = @"cNlHStDYWjWxtkrdLFFnNSkscPRdoPQOgtGSxjPEPzqkotqeWIjUHdvENofzqxcVpXQAtPerpUYPooZMiKvgrRScLfWxVWuYbxAYdemzRforJodEBEzLbibQxbBTOtRvYDMGXtbBqqCuoMN";
	return aIfUUjpHpZK;
}

- (nonnull NSData *)DqBrYfVmdlbH :(nonnull NSArray *)zMzVpVFAeTFa {
	NSData *DlvcGMJaDkYQJb = [@"eQvFVjsDJRDscMaKgumZaJAYyNHvLwEelVvFaYmpPsKQXYaMKZbWSalgmWsnDhoqDhjjjfCKprkJxRfwVkzinFXFVNxAtyMDzzigjnHNqlmQAFKormKJOPcMWaSnvOdPCJWuaviesaCOAAJtHtDh" dataUsingEncoding:NSUTF8StringEncoding];
	return DlvcGMJaDkYQJb;
}

- (nonnull UIImage *)kTNPepiTliTwOitH :(nonnull NSString *)CtgMKNdBCLOLZaV {
	NSData *xnKRDpBHFGewqRwzjst = [@"UPRreTrymbRERIMXtpMQSAHbZydrcLQCKFEBATSKEYLsFXqPmqgZDBkHGYQouekSXORuxrEwSevSQWvMYFEnKAyvCYulKbdWnSIsqFCJMRYRWsruDWGEWJpH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DrfxQKLTsxSzYXOM = [UIImage imageWithData:xnKRDpBHFGewqRwzjst];
	DrfxQKLTsxSzYXOM = [UIImage imageNamed:@"VQJOiZWzTqxkcqFfSSsMLleIpnTCeeOIGvqteTQumDchJRzpwHbCAIPGSZWprxHQuJRfItyeBYwsklIfUoHtLhuOdFiJcMBaVBTuOEreIEJCoAPBjUfCcdFCQmDbfOM"];
	return DrfxQKLTsxSzYXOM;
}

- (nonnull UIImage *)lHeaBYtEhOaTX :(nonnull NSString *)qLkvKINHPSnjrcrwRPW :(nonnull NSString *)KXDQYhxBCfslOZZ {
	NSData *ohikxEofYymzEen = [@"xzEikkVwBDQyvZhIFgZMkXcKBenudsYqQztjurfmkDAMWUikWLEwMCPDmnzMnIHkZjVaxuuAmBAPlveqrekmIxxRcKXCUYzOfxTTMcfReyfecbVLgTnwdZdo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NNuSgxZVSz = [UIImage imageWithData:ohikxEofYymzEen];
	NNuSgxZVSz = [UIImage imageNamed:@"RXXZkJuHRhdDJkbvfjrWnqrPEkGXIjgnFbQeJjgNAQyWNxIDIpFeiWDOygodnAdMTYCQrXWPhRzdYunDOFjBECZVjRPzfHhBLgpUdhPaIfpkgTjuNStrqRbVJBBfKEGxDFgDvDcMjFKdM"];
	return NNuSgxZVSz;
}

+ (nonnull UIImage *)FdUnOqmlobqXjaMWr :(nonnull NSString *)FLOqUaXBiVP :(nonnull NSString *)rCsaNRgCwGtexOfj {
	NSData *QpzAgElNOsPc = [@"UsZTCJeWfZTZNlzpbLGywyWoHzmmsQFEsYMgrZKfbBIGjQSwRQTJxcgYtZRyMlGhAmoBFxSXdAvTvtxlFRUQjqzdwaSUuSQtEpQEKblTJyMQTnjVYlwbFhtOnxfrNvjKEWmuuXHX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lbWrORQwsRryUI = [UIImage imageWithData:QpzAgElNOsPc];
	lbWrORQwsRryUI = [UIImage imageNamed:@"DuqgailoKjszdXyEzhoTmYAEiftKogkUtPqwhCiDYrVLamDLiCCXNHsSSCtFMsfcPFRTHkHchaZrlJKSoXscouefMWeapdNKGrHbEPawXKFHTrLqHoFIx"];
	return lbWrORQwsRryUI;
}

- (nonnull NSArray *)trlgVwlBsXG :(nonnull NSDictionary *)vlMUiqtrziVEvbXGE {
	NSArray *HMvtnLlfMMnXL = @[
		@"gSVlDARliuLIHeEEfvyvAvESbbBRppKClKulsakfEpznEmgmRFTwFFghKDLTcWvLBlKvuDIASaFMLzqnZLmziARvfwEfhPpUqkkVboiszztGYY",
		@"cLEUnuGqCuCtjbfWEnCJGBNkqsSXmOJljQKjOzxqoeHwatcNLTJlKthoeLihNyMNkYUkpgYXKfwkXPrmWWmUUzXrjMwgJaCswFFKtqFajNKnlhJgqhdPkxMqKi",
		@"hQaBcCozWOtwmkEMZQAEkqTnNjXTLKqQqASvkcqKpHaTrIjKAsRPWHXyOElOUYxoLOXGGjUnHfRyZbwnqMxAmjMIDEClloPdoThUbtpoWjCGmAMcAjLWPoUYnwGZDaKrRudICOxsOgcn",
		@"GtTMvPyqRnzEJKXhXfLkDlRiVigcxASkrGydUvLwLOFmrbykJixoHuvYoushivEjijdKdAdJjZbvhFdCaonKhUqOopuzBJqSbIVszXtgR",
		@"CIUHnOlWUjIluZVuGEeoNXtLcVAxHGWmjRNSTIntLLqfqIChTmlTpfFPeGWqVAalRteNTStxBzTtkECgnkckrMjFIJCwLmDugufhZVOmoIsDSmVBpPMPwgHFYtusLILOPfakzU",
		@"gvAXCvgihoMfBWkvRBbfPxqDmQpmsLwWFXBrpYyDeLLkRCzRJziLvtCFGhNbafMrtQSwjJgAuTHfuxpqVyiPxiERtFkAeXJEYJSCqpwWm",
		@"dIXpKeFsvapMDpoeCCkqnsdhstnSEpqsQIjJyfHKejZUCVOsyUNHihInzcVFECxCqxHzugpMeRcWIqMccHtwaalznMHgjgARteRBAgDFsMwgieGuoscvIbNKNSZsjSpgQccG",
		@"DzuJxcLRSRkukptGgIWSMzfiDyGXjwMaBhUbXtBvrKeNVdoANaVHeoIxKqLhYfjQThgNgIJcobNOBekdWgxTTmyfxwoCRHzSxwJUlmWdJ",
		@"tdaPWVFwHLfKBGTGoqyLEfMkoCuZKZXBVPZpXHeeYrvGkdcrAjpvtbESdTNrwOKFuBjvFbcfLFEQlrwNPHBvkPGZnDdppMelaFTeVTLkVuYVelARDKZqZfovPSVMayZYgsyrHjRxCa",
		@"rccNZuNvgxFHiqzZQvLPSxipsgeTWygIlEPovEhjJEwwhgqHMYIevfDJlFGYlnZkacMdFmknFUOGsdfxCxaFPEcKBCUIYKhrQBWtToZZrteUMIbzXPL",
		@"dXeerrWCBqkuEgrAHyvOHRAxrQzlSFbdjxJmxbUqJpodcXKGVBCOYhKWHfXxjyDFXuktbQrkPgWtqlOelMqRKmCLNTxyNWcGxkwjZStqaSoSgIwx",
		@"YNXxPGftzDqVURppiNRRIYPvfLRyuLfXhcyLqoarjLHmrqELGfUMERbXrefxSiHGIdiuvRhrfmSGXtYDWQfuZbalKlkvZLAXnnYZf",
		@"nTzqvdIIKzaVfYeBqNqrvWTnDFIPgnwyHCPylWiswIxupmTzFOFqyvZNPjWGVOaiCyFFPGNfafQhBndJItkzxhCHwPONYzKtWQrPyTfpsuSAPlbvtodxypIxcUQDQYiiiBNISDuiLAEYfAJIUu",
	];
	return HMvtnLlfMMnXL;
}

- (nonnull UIImage *)OlcCQLMqYQMEKVPYUZY :(nonnull UIImage *)bhRwAjUyMBlPSmS :(nonnull NSDictionary *)CvgwXrmpOuupawFQb :(nonnull UIImage *)VvgHDrOIyeNXxA {
	NSData *TuOPVSzQOpjpVXIYy = [@"dvZLjFTMQJiyRZUhHKLPzRxzYZBhJkPFopdgHnrkIzqEhdiDLIwWAzejuChCyLyIasAeGoGKlCEfvCwKUSHKFBcMxHTAMSkKmZPXpIBHIDYVcnRCJKIDHmIsSjGofGxgcHWWPseeCOCqCAOxaZFtG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SNWwKwFPMtG = [UIImage imageWithData:TuOPVSzQOpjpVXIYy];
	SNWwKwFPMtG = [UIImage imageNamed:@"LdWwHiZJeGSqhGiLKBjWAerSCuWortwGVPJyjbsdNjSjRooqHKoEjVVPNjZTsUFiidAgSibnhSxzQZNOqqqwbYnkmtUSqHlSASQQMAbMHyzslFKDCKuRNAytPLeNnZwILJCmLPdMVuffXPRtcFEal"];
	return SNWwKwFPMtG;
}

- (nonnull NSString *)WhTFbQVXzUC :(nonnull NSData *)rNwgEpjQOWwgGQcHp :(nonnull UIImage *)OlkIjogROFqTAE :(nonnull NSString *)tkTAuSjFshp {
	NSString *NbmjLUziFqVB = @"WIUrkUqeqbrsYObJFPkHniWzLukIFeeattJqMpHWmkfBIHZdpkEfWbghWQIkJEowAEJjuIXKNnxcbOKSOGdVvIkxAugrZTMQkItjSUZPfVdbDfQoIQwEnoNkDFeBDdpaLFmjbXytUYdmIOKGzHbFz";
	return NbmjLUziFqVB;
}

- (nonnull NSDictionary *)vXAbqxRbaMsLR :(nonnull NSArray *)lAeiduNSYXpMCqpQ :(nonnull UIImage *)oSYytjCVCxIqrtVegk :(nonnull NSString *)qilAZKICpjTjmWawSN {
	NSDictionary *VWaZlIVNiiL = @{
		@"XGNMfdNhELbIBcK": @"PLcFHVqMVQOsdyMLjQZGSWDTLZiWFRgqbLfQlZTzqCMLOCugYLCdqYGdcJjOmMSyXFrmvXqiSsPJQXteICNQkngVRaTzHBJWhOAaCWQQzvgsVXshXgXiNSJcUPWVuZlTHHZudtobTLusp",
		@"ifonbKavfEUjyBCbwp": @"hmXDZzTiJPNIpHfuyITZOqbFlEZaUCmLHqlWWLBoaGODtAOjjDequknhVlBOPDaiNdKeVXIagilDGlTJBAqIbuZSVFPngDFsGXTBjwuxeQQekLGVRTJgYKjzfJSVKSzL",
		@"TgkRnMeqqYHxcZzsGT": @"ubsptLgWBgPdyHZKNJYzZDcfAyWgNzmxMqKTxZXbDuWDYhuKiDDUBZaPESwHZYLTTCzmvcGZSiRPnytsbNRtbtMWuWGdVkPNCjUzSqRVdom",
		@"ZYouiAZpac": @"DEFaAntKgvWPWyjDdLYOPQMVpVgMfRPnuhwAjViQgQslLpvelstlhZzaXcUDWQPmpnxldbrwfiWYYWotKEtgwAmKobUtCkpYSJCpYRrje",
		@"CmGnABafenqZ": @"HYDKnmVvRYIHAGDQNhCroRmMAeZqRnKwFOtjDctSrbbLZiOQAdoOUGZagEBZlzGHAgyOQJCdaRlCpjYjShEVzGdIWBhTtbUdHVNHCofFvdzFXN",
		@"fQgUQLNSZEun": @"GDRVyAdeBrzTuYVaUwkCEphotpfpwUAITuiEdByagOlibNPNMibTOhpwIPpKROweNBjbUgZvNVDFbkttTzEidNmBfXEMHOzwjAlcBNQuZPNeTSmEwzDEpXurtEflEIPuBNqoOtgyzguKsgrwId",
		@"HjWuyJWUois": @"ZtRvCxGpkCDDuyKnWIzjqZsRoDeSRcxadaVeGVhARKlldzabNmoVekWRwBywnnToyETZubMsplsCRPoXIDwfSaSKkZAzCHqOxvgSYVEXsQqOzYpBpvYGHrSa",
		@"fNvAFfumnZzlphWMHDs": @"bjWvyMNlasBFLMnSEZnxiReHQBkAlWXwfpCbIjdrUCatRsCtepSXBhnxOGQmeJrVFspaiIOZCMdcoomrQhITosRdksUCkdgUeeDduDBXiyQlAgOUCqCtUObMcnDDnVNvqsKX",
		@"HXVosbMHdg": @"PtijQyFzjmOsrptcUVulmaVZpawFDnOlKquHzAMnixYMEWqRJticOXofbLlCmdLszjHKmAVAqdWfsprkOIDmzsCeUhGaVuDmVtzSBCOohOUaC",
		@"sLSFtcirOdgpHA": @"kEKaxgHoUSOzfpKhQiRLPHQiemjVxrgdrvkDOhRBcVOmuSlDtQhJRoXSdUcFnlZPKMYXvvqmMPyZwKunzulfsBLHvqTscWKzdXbiIsqLUQr",
		@"HZjXdRnIWnn": @"KQMhKGuUWhGdgAibtUCJIuSJkitwOAEiFpIIDhwEplmELYpQjhUsZtUSTChDJTLeGPVTmzqYOeJGmvpvPukEffKQmwxeXhUPvbfRhCsCPrGZMjqFYkmWSWFKwxAu",
		@"xIPrEHTFyNbgKdwxav": @"WQExDmgxLUYqNUYHpPeWsmrXEcuMLBwCdrjEbWZVTFsjcTMkLRCsVJENCzeujJzMxlOwSLjSiYmRESNMDwsLStdGbUOfivZBaudwIiFCuKANHcDZIWKZCKxyMpf",
		@"XgoAhuzFTsbtUcxIVUY": @"FeaTWsunOgTXDikjdpMlipfukoXmlQrzDFZqxFXVatrGDAMWxWXHDqmOMmCPCtGOGVeFCfTzMoELhcTMEgidlbECifECVxHNhafjfEbkAnRryFulXotBBiStXQKHMSYrcRkMPjzVIRgbokZntg",
		@"MBLdSLjjQMqaptWnqR": @"WRrPjXnXKzraYYYhtLerCauDACqvVyTRsUuvYopgKxiUBdmOSuJAnYMEiwOAvXOdCUDVyAdsknFYtIeeaTGiFcHYNKnemfOQMVwQ",
	};
	return VWaZlIVNiiL;
}

- (nonnull NSString *)pNIZiniZiO :(nonnull UIImage *)yhPeaohxxvjIdm :(nonnull NSArray *)BlEqBlxKOgbqKfAh :(nonnull NSData *)XCUQqNvfEzeBz {
	NSString *EtNPafJxviycRQV = @"VnfrNgOZAtkrIErPNYAiRNwwOHJedNvGoGoYFZedrYgjnhqalSgTiYlSVbcubBGlvkoqpuLzqBUznNmXuDgxXmSbxBMNuPsQtWbWLcQHQsVrsKieDdvMOATTtilGVz";
	return EtNPafJxviycRQV;
}

- (nonnull NSString *)eAFUSwyXbVDwwGZbwIO :(nonnull NSArray *)XhYoSjqIDEagAwFtX :(nonnull NSDictionary *)HzhCOMbHRLz :(nonnull NSArray *)RxXYYkCYRrQiOjJAna {
	NSString *QgpbdMiZHKCcShteP = @"ASGWDVjqXHEcIXWmtHkFNqeiOGWtkPZAfhzNSIqTvkHCJEelpZaCPEjmTfGWCkNtwFfZekfKFNAKWDzaeMJMHSSkrrQxuWiMrZPeF";
	return QgpbdMiZHKCcShteP;
}

- (nonnull NSDictionary *)jOHqlGgvpqiDVtk :(nonnull UIImage *)usrOCVnQkuC :(nonnull NSData *)VONpgGcDJb :(nonnull NSString *)wCzhIRRoQyOwnY {
	NSDictionary *jLWzpXITiCaRwc = @{
		@"HzCpSoIRomalWsro": @"vbglTLQlHzndVqkbkSrKByMuJKIDxAqssLoJuLcCdmWHHYksQmjKtJaQArZJlZJnXkUbhalkznoTpQdHYGPSeYypbtheFuyBtzBqZfIgoESHxHkDEjEOYn",
		@"cMznOjbtZanWSOU": @"CTxystnJOaQzEDqPKmAhzqIrmOqBemSODTAjPEQeqAEFxCwtlaFAuFiRTlniJcnVxsSIMKvexrjNJogXLNFFDCBaMvfFczXPiDlVfFzYEcJNTofijTGEqobICSBJpxSZpXvRpwMIcFKsKT",
		@"HyoeddQICG": @"jHKcUwpVooTkeubwgliIjcwDbnJTkSbTBmhBFyurCKPxOupFZfXAcOlqrmJVkUBGseXcJQzAbonsZkGhcGtmRdDHDLvNZuTEbixKiesEvpWIRKGwLgIXY",
		@"YbKcOXHQObArSphcWc": @"DcfAsXQSMvMnYWpKzwxjJFLkPpZFyVoGqacDRdaZIhScvpFRNJPmUJFnxylsRMNdqMvGnSoWwIyIhxjVcIQwPHulRnoYvitkDKtsTzrU",
		@"tCaTdlpdWsZZQWiJdBe": @"zVaTSQuHTBBUniyqeoPTTQsTXtUllDoSOZkwIiqzooIHqYPzOeKKNBprNPinYfYneGyKbixEpOnpiRdSyAqBjIzxYIgFWKjhUTjWIAZapeKejQUCKVKNXAWHjxLBBboepUIDsMrYvSKwKqwlafFfp",
		@"uBCRGocJEBFLGNvKiJp": @"hsqFDtMnMqIcjBZiTulCTVNiODAVwxQEgHoMBKZsVBbVtONeVjmtLJslzEWgSOugrbJatvIJERmULoLcPVrvODWjatdGhscgRrAxziRiyHUtJzSCiffuQUihBiUNfBToVkbP",
		@"VEZEYMZJOlaJjNhwCRQ": @"indPMQhcQlusdQdoFrhUmIBFIJnmFbaFTjssSUbToJlUxxshScVhOpwdyCSavFVXmsJdFXchcYjniTBIswDqhqTxLBkpcsrhwZPSHsgTjhAEpR",
		@"DGKQUQyObz": @"cjPnnzUzjjDuBDImszoRPTFVNPsRQpwINVuNSFUNPAvfSvytaRgGYxfAYmnOyXhZrbXhruXHOJsJaSMVOHqXInlkGnZiPUSTFeeOsgaHxTDneQjZVGrYTrQeILFDBlvgnwSiSwdR",
		@"SnhnImwLspmznRQe": @"YCflYUKafJqxMVwCrpmrSDwycmZRLBDOPuuEyZtekSXJkmvFsbygxOrvwIBBmEqpvELHMLpRhyJVDUNAFXqNpMPKieisnoLsrAGcbWsAbqIyBMQ",
		@"GijvoBrDPCsO": @"PhUvFXGngbEPNzhqGLhJtkgnkJcRhkwIpCRHsOeXVOuLQgeRTmwhCoQBvJWRexubAiifxZnKKMTmperaatkkCvMDwyxKZqSflTKhFwNlZUKeRVoFAHfOWfMLjUHwxeZoH",
		@"cGjtMoXibVNdflvpBU": @"HicqEEavhUHGabDVOdLWXACVimjzyNfleBXVfpHahpdrYeFUJkyjTIWzbSWOzBYqVHOsGBolgtUlCwQNvLmWTcnUzanXLfXKWwFaqF",
		@"hnJwtTiesuEtXM": @"RczmLTBZxzliKlgUEcbUTiAtizsVvDycpVUIVRrEwXfyKCHfcVIpUSinHTNCVBUhrDFrlGYbrBxHtoYAWaGTMRkKjyxrdKISwlHczNzWaonBxUExaGEVfmnoZVshqvdnfbkyYcPHzlhhhjMyGifgf",
		@"wEmNkozRkxzStkRzPrh": @"OQXBxygXixDsmtiKTwjiuWRIMXExMrcgXBxFfJjCHGCEoSiJbxIufrymYZtThUGBecEMKWwGJLWMpKLqXxtDoanPHeNzkdZYURXDyixLOp",
		@"PkmosRBWnhHinTFvFW": @"SDnUlJhxhMSsfTrfoMoBHHgzllKBWkOkASJchUnFfkmOspcwedjVfKAhkTBCGIQCtuhbWJgEnzdzBlDQVxijwzNCjRxJsFVWtPvYmxLPYOAfDsGjCQlNsvfyhIXBBYzljhAUnHNaDlwTmIme",
	};
	return jLWzpXITiCaRwc;
}

- (nonnull UIImage *)JXdWRArbxqZ :(nonnull UIImage *)zVRTCFbBwXMMRapV :(nonnull NSDictionary *)SJtyyeiprf {
	NSData *EdLXLbyhBHrGaUj = [@"ZirtWmjtQrPJBREvaBsWxCbyMMIwWYBsTFMamccMIcnAYwsCbMmAmTBuANdzByefvjzzTYzdejYEIETKnwLJDjzWJVHAhUJZRcKojaByjAbCSKjieQFUYoMNPusmddzLlFHefGJoWnOD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zGjXHPNYoiFoBb = [UIImage imageWithData:EdLXLbyhBHrGaUj];
	zGjXHPNYoiFoBb = [UIImage imageNamed:@"HhNDNiChSHVYxlwCRoOuXjyfDNxDePWyQltfHGCABaVEjfRqyjCHQqUJkZqxvXoRiCUISxyPpTloDfIOPmuEAJrzpeYzvFuaorRAAqrBCgdIdaOzBkgP"];
	return zGjXHPNYoiFoBb;
}

- (nonnull NSDictionary *)BTwCHLKPtLXfUt :(nonnull NSDictionary *)fMwoJzBhUXvMznqPqx {
	NSDictionary *JWkdYmRnTQyGVSBI = @{
		@"BRcATqgdHwXgf": @"GXGRERkqPRXhtxiYOOBHLrJOiUnZyvVodfNtDvQGmCTilJDyRNdJvQjpYGKlOMusBuUXVinLzrPUhbwQOBOPtinZUtFhcvqEcRsqZakOQJAaGvSiRUbOtrNAklAYNmZiniNlwoxRNcrHvdJ",
		@"ZOUCylggTM": @"rJvdaARwprvfhjsgKyEDSLoAGolxVINiapWWXCFenNXLpVaASJZYIbmohVhvRpfSEHsbPuDYRtQHVaGrSMfyRsGdpmnCoEAWigUPzCHs",
		@"ZGqjwaAPoQkdz": @"bghAIdaSAqdMQgmWAHfvmpqoDCAkAXbadjvHONZxxSkcnFOIAGfqXAZRqJEDiWtBeMNqxrCinGiYGBYMQEBdFrLaDwksCjMoJTExPJsZJJFWtADTMcYCHdeEVBYUvrMccYYr",
		@"eAKBORoeiHGVS": @"FmfBozDlUGgLUbkNtAvLuCafeSskgsJtmJBScpGoFPcEAiJidkIgbLSZxxbDQNiLqophbGQtjvpLCrABIWVTQAtkPImmZxcOHuaJxGRRfhSczeUZIMJqtFunUzwHomluiiiNgqyVpUiaGt",
		@"lALDDDczto": @"IgGREoIgkzAugBbtaZXQpNQyoIsmfnjcTaaIQCpNNhCPhTteHqXLcBbmclNMspFEHiQIKbZLCCjrJnAzLezOUlqBdjQkDujUEMwNHpzoCXR",
		@"SCFrnDGVvPhxSW": @"KEzEnAagKthAeVnlANthKUusbGQXkEZQHBJBTpeRFyMJDTbirKitYnehzqtTFUpQPCNYINFXHPPeKLnkbEBTlkDvKRYNEysjpBMikMFmckmhrGiBTSInPkxnBXWY",
		@"qSuHABjLLKZCwLOt": @"vnreAayPwpvCKkAbKcHRLobHiwAuvRwOMsIhZZqzcukqlXOsABpnepHTCZseBsDvWeiuLWpifkHQOxvfgpAQGguGctoxmHbuXpiQyyydKLSFmZiupXgNa",
		@"IFATQXwaHNnX": @"NLsoypqzqopBYvwJpTeLtopsVnKkOIRBnfMnkWMQREubXIevnJHcUySFeSxIWAigXWrLpMiWBqDCimRfMXHLKndsrRPqZycUSbGGUsvvSeZaLqqLEROvOYMaXCiLxTaUBqKzCfCMFmjsZwtKsM",
		@"cerSHNGDEXwG": @"SHKlPYAlmFLQJdSGjgCGubBggutUaoPWzoorUHtkZIqKxxqeXktyDKGefwmQpQDSHiYkYZgwszQPHZSXxjwedLXEadOQvewkAGxfWboXKkIQfcgXaDudOgRldnEvggPnGZMhGmYQ",
		@"jGOYmENgKtGEXDc": @"ZyxNHeOhnGtxHMeKGDsRtcVuDhipFyEJVxePQesdYzCPWbFrpyQuAwcSCiXxcdqWbWAiNKlKyWbKAwUdqvkCWhVKBNenhvtkJThqOkSbjNMPgEqR",
		@"khgpAovruFcCAAetB": @"oFzInMpYMUpCACcjzeNrRIWDUGLVyFMpvnEZceWSXHgJxAeTjZhDOIBUiYXGPRPIotoCbiKfbMwgqNFteuFdPsNeIsHLAuNYOrKQVNduFHfaiShUMslmpVWrDnsaxfKDzfTr",
		@"WXUQqqFiTRRGi": @"FNyeDIcSndCMwsNWGUFjRGKjtrszTGggeDmdvzfUzUuFXkIwVaKwnlxIfpEYEaYhjrUeyTrcaeSdutHUSqWsetMDLhhmSdcpDaEGwfAINFvcJAoStuuaiYCPDLvpIT",
		@"GaJwytPSWpPxJgIwS": @"DXEUHOiPpAQoQYFkgCzKPmWBiquthASKTIQEqIooQxPEvNRNANqvYhtsGaQaRDBSBkkNnMkgzKidPHyYaFcLWazNIoBMZUAvwtGRtefmHMVQDwmPNtZQbunAGOWxWRniOGrnQmTP",
	};
	return JWkdYmRnTQyGVSBI;
}

- (nonnull NSData *)ELbxQZjWJCajkHu :(nonnull NSArray *)ZLXWzMTRubwoLc :(nonnull NSDictionary *)QFODIWeTEZSYsCUn {
	NSData *yUJoVPmNbKifIU = [@"FcNWTvxUHuhdAAcFclUKUOHGsWdDSLGQSxkZrMUlpHWYwGMkHxaCmmYkSEAqbjBgsupLdYBfWKnxAiGScTwSXWAXnBKTDKUYRZCgEmhTBPCpFDqwNDIqwyWVKOrLHNAtHQAeR" dataUsingEncoding:NSUTF8StringEncoding];
	return yUJoVPmNbKifIU;
}

+ (nonnull NSArray *)ChUtwykymJckc :(nonnull UIImage *)FpqUoNrmjGdZDoFiZQJ :(nonnull UIImage *)TUrhSDcMktGn {
	NSArray *wjwgqeASZvBRrLpHaL = @[
		@"ZNIRgEidykBrJCjWpRriHrylPJAQAqBDPLUiWmkjjWOMwqXEYgOGgHjEoUNiIIVeTXjFydXVkuVvOyJQuhlxVhLNiAHofnmgRdiOtqPeSeABCnmIOmHlxiWlMlcLiAeHcAwpGRTLBN",
		@"BjAKaAlNUMpasJjRiarfuAIjaGSgDCVhlGmihsDnfUXheBxVGrywxxGNiPUTbEYMNQDlYaZTOvpntrcpfQdylIycnhjvQLLiCuXNDESTRsq",
		@"GsRRefvGAOuAvPXkMHebaCOziIZyCbAhOYstHVWaEyxRJKKVJTKXssunqBoTDJKryEEiKsYnBKzYbrVrHorGEVcJohXpryZDLOswFvFviqTFKEXQoJTKQQUDAIkgIvkHvyIDfuiwtrC",
		@"juOBCslgAyNOBXcHILMlzglUyEHeqIOWOzNeRPkMqkTMRmnftmypoVguZTEeUcFiFYbimNojRAVBgatscWlcOanehYddplSyolFIXDQkgzPtnmNiXULbpBtntTvCGhnFLMFVDoBIRLLQsuBYJkBpt",
		@"gTgMsoRPwzkNRDfSudpTUmKyUNcjhyzHVUuRWIomyvBGwARiFOfGHNwFIFdEeJKfVWufuczdKRDjxnlrkPAgnneTKiOhGEkeTuBsaPKcIfUsKikpJwyGpFGCQXyc",
		@"YSiUlqBoTlJkELCBpVmoXIYCeQdSSgJmnYACFNsUVfIaONZQgdXXVLyQnYbhdtXIwFZVdszOBnKJkUhByJErImfFcIpsXoOJXrfsUlzkbTtp",
		@"tGjTriHrClLrYtHZfecsjRdqYFFRaihMqGGfvNpHGnmroUJONHUMViJTwhqgpSpJMLUhJBIBqQPWjaNdUxMhZtlSDRMRexqoJmDVWQiCxJfBqFsDwcARSccaGLRd",
		@"moecoTuoLrBAHDuCjsVgGvxpffuBvaoNQwRhUOKMpLyUCdUbqbQgZsELRKFdGHlPATxoTKWaCHFUiLDpfFWPDHEugKzeNtYFdjCOneHYWfsYhtIXpVQCKoOlaJdjmuhDMdiIexPW",
		@"GgUyaxSQVksSdoinvJzKMepYNYntwAOWWmTibassYnWFyItBFAoXubFUpxqRUaFEkRLaIWCJgwAgQHslGYDdUcxNllSWmKGtbFrUUojgYxJoGbnqHjPmGUKHMPn",
		@"ZMSyQbMTlTCNpjlnpVRNJcJFwoFImUWrmIFgzoCQPsWSPZdzxWYmMjnNMtjPRGfNBZnHLzOusjhvQxMNKzIhnvLSYblPEHmVNqxykqUzAWjzpgIOOyCworQcIqmM",
		@"inJreWcApnTUQUiekcPOKdfOtQTQzrwtsNsEZXquNSPNIpCHGUQqxvppHyZwghBcOPsBrRAcucmkatKFbrVkkqrMHCIxaburvCrZtY",
		@"nvQuNvcmXwzgqjwbAVDpBFVnnAQDisReHeCFmqgqwLKbtOHjUWYzcfBhiaQyrXhInDbbEIBQjBjYQxrfssIiTJExHjxmMktbcHbXtIIxNAFUIviRAstxKauyZGWkqEerfUyQTXkg",
		@"fWlONFtvqpthfmgXKfZVpVeQXqMXDroaunfmfXZZEWnuPrVClhVVovdHCNBczMrLmTwPqFmeWTXzoadacxehXqvMPPpOyaWCvAvvHUqWNkhfEopvAdtiFAwJA",
		@"LDuodRQtyTJNKPaDZEncmupsUZnWHmBzTvnrIbZHtzLtyaTnGmiBBjBWbjiKWkQmEgrFaNSQmebntWKAkmimaNHLTPyHzeZxCFTzQeOBEjInHKIHvW",
		@"bRKsmMPkztYgvpKrmbAmmQCPsMUTwCrydedXXZTxLcXBxbxZiVRAQhKNtWcvrsqOOGNZYdPawFfywoYYdvUpCmNeddGMCVkOoNZz",
		@"YopETRVvNmcuucELykjCXfBxpzBGkKyoRZAkLMvdQsXqCcOCCQzuffLegDryMyzgEZemmqThcFvvYeZkWCiolWHjaXawVYYPDwrzeCoacPFkmIXzkYuaTQftWOUjYdwxiPYCY",
		@"QlzengzuiIqLiKxIORPBVzAStJSNwQWwZNVKCfCSxCZZMcOfDYRenfYvucDvjDRstbwDkEmEaurExEtOXTLTcugXCKMCkjbRuUDcDoXVgqAlDYUyyAkjObbKrSTfdANpIJF",
		@"yWLWnGxPjeHVLHIcHfIQgDTcUfnELVDzOIMrFCtSSBKyctHMMwoAwhRsyTOYdKTuBOpHDjcAiOnrHLGTxEnMCxNrHEmxpCynoqdFckFfjOntfroWqUTQfpQwf",
		@"apSkszNAetgITvjtgwJINbJTYykEUhKQEybPGNNKmOEBiNQTKTNeSdxgngqzLCnjWCthTGLcDqqtmMKZTOLbRoLyQvULNfskJeZnaiUePJCanjHFkpDGTlSFePhjZatUaJQyseNVpBb",
	];
	return wjwgqeASZvBRrLpHaL;
}

+ (nonnull NSData *)dBXYBOlsCcSKWncWjt :(nonnull NSDictionary *)RMFkjeKBkEOLZH :(nonnull NSData *)qIjzLLFzJZdH :(nonnull NSArray *)XUGXNPQHBNVPE {
	NSData *iMHDIAUqjqAIT = [@"ksdhlhjKqGTEBCIylVaXfNxBdEULccOKxlsFidIAoDaGvszzlFjWPVOtWcSGcdplyVnyUPFSCjmrcLKZjdjOtUHXnFOPgQrgULDtL" dataUsingEncoding:NSUTF8StringEncoding];
	return iMHDIAUqjqAIT;
}

+ (nonnull NSDictionary *)bBuvhOJHnuo :(nonnull UIImage *)YsLSuBzRPjtqwMsrD :(nonnull NSString *)rlnfHlSbluKnwiRaL {
	NSDictionary *EtibQFcxFtHKit = @{
		@"YOTvdwDTOAZNMC": @"eMNEQLEYrRdEvoLELPrBJFJIcEVfPuZpfFOhSxUYpNOtWMLywmHTDbjqYmBDrzRyslCAOtJkZPeBHBAKocQYqjCRENCftfzgPjVoEbjNczsJuZIsGIGNxCcoqkiartumOGJVlaUgB",
		@"lRQjSDXDPrf": @"LQFDOLazammVhmsGCgRNDfvLHuQRAyKFnGTTNVNJDVdoNHWgJOgzwGQsjwdbXQlTaWRZdqcYmcGRuVOYcbcVnyVylRqbttYbXIuVZMaEhjFXoBfViYalLqTXbzQCvFnlyI",
		@"QfXMWGMQsydeJFVl": @"rwWmxAheMSxrEbrhokqDdGEmOhIMUiIyyHCiSLGVmoTzAOrMRLRVllZrzbFELMAMWqDeOfQZmMFUblfpgIpbvjysKBCodMyXOahBirePZjFdMwYdkaO",
		@"zldtbqKzfTLQFCIhf": @"uTJyCPGuDtGDPQKCIvtfQnGpwGcXUZKIANjAqLqecJxhXdphiMYTAjLCrzpjLBApnBrtREwyNrOmhgTOXfswAdtSMmBQNhZANEhnAfMnihVPfGZRXzAYgTFnPXMNmwN",
		@"fflgvYjoMYwMo": @"pOwJYnoshxxYOilzxtuFfvJRoEnqmPDzuuOOjIrudwecwCPfevJNMAHwSuMLbSVTqEicBtFlwMMMnZbutwAVpCtBpjAuogWnNOiiNPajlAQNJK",
		@"ASDKaarZWPFH": @"fmnAzpWchKFzkRdMnIfLmASNKHhPUfGfieCzWjvRiOkkKtiNFKKgmDxTFVsWqTWebgIPjoBRKQkrAccjSFoLgqjUgipUCDwPXbCflIQsIHdaWcHSjzfXQuAqBCwsVBJrwqjzVK",
		@"eKHDWRrnqcr": @"nQyHTRAkjBOIPOJCAaGRzhixWpJpDHTsDnYEXMWEqaLlzxHhGeKwCUMLaDFkXgGPGaRIKgwkGvmAXfIWromoUZTFAagsWFQefwFwmTBojXbuugwuBJXFeTLAadnQqwM",
		@"KXZQdPrWarxfntgwZ": @"PCTGnkfeSimAvAeHSkDukajmmqwYXReKBejkeQTtvZSgNAdQubeirkLfuHAsNinXDQPNOLMGNsBtMcdtkKtNTkFWhpeRUVaOAEkquXRsVLjhSuyXwqxOCdwPjWlbkjybFPNnlP",
		@"lVnlkZsNab": @"MYaAqPmHDjsOCScRkUdWIZTcdFWgViRVCcAzVuxvuTMPJrXpbGRuDgoCcGDgcLfeLpiBDcncaLwgMExoCdZDVGImEbtMkOPeklMuakxLaZWUqBtybKTudIxFqrT",
		@"PwtLcEvFVhwTumVkWe": @"xHorNPDVuLRmfkWgCIzAuoOPaFniiViHcgZLXOIVaSdPBAtlQBTMpotZKWCpiZWkUUDPysgJdQEpZfaBWxUXTxynPnpkMfnjepFcQrAhqmfNjjEjUUsizSOnzhWOEFfhAPJqVmz",
	};
	return EtibQFcxFtHKit;
}

- (nonnull UIImage *)shFqkJOjgsEemwr :(nonnull NSString *)zYdQNPalaVCXLhgru :(nonnull NSArray *)MbwYYYlTsXMZRZfI :(nonnull NSDictionary *)nFmjjKtRYeBlpdlOrd {
	NSData *kjQXCKXlaJyavikQnx = [@"wAcrZEftPMwUfbgqcGZixmxOkQEdjWunUxgPqcgOgTJRuhpecKCOrmuwiAHibtfdfzamxpnUKUGOoqfZKRhTtbHxDwuYoPkpPLODQkcIXmTKBmBbXKOWzp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GspPBiuSyBn = [UIImage imageWithData:kjQXCKXlaJyavikQnx];
	GspPBiuSyBn = [UIImage imageNamed:@"YWzKPGEkZSZyEUSZfxWPXXmgURMOcCtaTrEPYXYgkgXgBtpTMroOcJwILMmwuBgVYzRENUIeqytSIOhFaNeWXOdtHhtcchytwzwPziQquzEtieztxNTgkAEvedTzVVUbepdBxnUiAVxM"];
	return GspPBiuSyBn;
}

- (nonnull NSString *)xzbELyNfKhglSYfT :(nonnull NSData *)ZEkoAPZAZSLYU :(nonnull NSData *)AeJQFMpuBDcdqPfZ :(nonnull NSData *)ldjYqqxFay {
	NSString *HieOjiJmbzeeCYA = @"ZKXXWmNgJWFGvBehkNaYOBSElayYofjnROmOLOyPwXVzXxIrgxssNZTCSGWbvGKivUWpHmeRrkLnkVupCKFYMODhxCNgajGVvYlwHVH";
	return HieOjiJmbzeeCYA;
}

+ (nonnull NSString *)KgnRnhizcdUxgyljbyb :(nonnull NSDictionary *)HJoaqMcrNiBP :(nonnull NSArray *)OrvhItVUUYdwy :(nonnull NSString *)aNYXXDYkNeXrOBXzK {
	NSString *pcaJHRRPCIEtuGvoz = @"GsCgRyXNyXectmvuWYTaMMvdHkHFheXIpWbsoBcYeVbjwrCsYAJDHsDWuRVkrcBQNmcIhqckDwVuWYZautITLLmhtQtxXzXwFEnaBTcDtPtMgljkaNUiBNyudtXhTOwwYtcnshTpIfhvjyQwo";
	return pcaJHRRPCIEtuGvoz;
}

- (nonnull UIImage *)ZLJCCqYyMryEk :(nonnull UIImage *)TCikRJwoelfRRcXk :(nonnull NSDictionary *)mhlHpHFUyUlJx :(nonnull NSData *)sycolBkefXeKhmGKhXo {
	NSData *dJMNTLgMdLSpfEMBIEH = [@"EklLMeBWRHiQXvxGHjnTNcJYpPYBgrchnatfFjrRRXrEicmsCbAfEOJewuTXRymEWvbIzuHUdroIjOfGrzklAAYqmGuSolXGpJYWEvcmUsqAAXuMSjouQkkrwaczxvqnLfLMHZFUsIfRkRWVBwb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RZggfPcMRktNsOhpXfD = [UIImage imageWithData:dJMNTLgMdLSpfEMBIEH];
	RZggfPcMRktNsOhpXfD = [UIImage imageNamed:@"CdfYNRZhLgVmGKBhnhDVkAJREFvtmQOkqJkflcByaGwQSuKfTriCmDiajLcqIduwcmaDaMYxBVTNZKkQPGRYcgpihVMvrXTMybRpaGejCKhZGoUAjOKapEXQbWRDQbEuJ"];
	return RZggfPcMRktNsOhpXfD;
}

+ (nonnull NSString *)uExwTQWqDuSZUJpE :(nonnull NSData *)OUostLbSbOyy :(nonnull NSDictionary *)HfyJJCrdifrwuGUv :(nonnull NSDictionary *)WCMdnQPXXONnHfqXF {
	NSString *TIkepMzvGote = @"TaCInFlxtwrHVawFVPkwobDAejNXxYKbNWKFBXKAMiYMZLMpxUrPLVlCAhzSpkWSGWQXnuZcNCSxoblulFWZpVhggeDDtlhgqoamZLlyCySxzhsTsOUqXqkUne";
	return TIkepMzvGote;
}

- (nonnull NSDictionary *)ODSMtcyeZVr :(nonnull NSString *)oOHTKvsdFVbCBFOt {
	NSDictionary *ZQTZEOkcLEzoRaLB = @{
		@"fMGSvpebMqM": @"vGlTIgvIqOesYMeYuJVFZPGVZddmnsxYjcIsjQxpkxbJjoQmniPQcAkWGnwBNIIBCrBUUVUckKJSWpKyNCjuDCPEjgLjUNvUBSIzlVuXKwYN",
		@"bxEFdDWcCh": @"HsRNwpDktElTqxiKoMFGujyuWGCWGvuZEYWBLWOTAHVnLaFEFSfsePbJZRpNfdLmLuSrBupQlLELDXDOJbJfnoOcjHtmFaAQPuFER",
		@"xLgsgTiauMTQZEqn": @"HyAnbfXZoUWmRDskOcMSMPMfOKMxGmwZRrvrKkbBGmYJSMkqBNnRMNMHJclJlcwgEcmgtsqVeHfIMEfFRRQtAVbHDFcxjcFZzwHRCJ",
		@"IgRAlJOIzweWaaOOC": @"FScvdoolbDVcGXXZSiVZiOGKoeCiFSphVXYpSGyAOMSpYnvMpLuCSSQrNqUIysBxgzYkhKfOojeUmoxJZuzIvtAQXcyGBxIZwxnGQJSlmaAI",
		@"fxgZaaArPQmU": @"psfqJrmIaTJwrghEbqfnVMNtMmqhhlRMpzjAaqPSAjnBuihGpkDXcLYLpBHtTlkLdVcEkrnRYadQArvcPhufQqAxkeHUOxNsjtqmICODxoWtJquslntQpsQBJYDrWOXxQLWHSQPBgd",
		@"ELzpNuIzeC": @"inecnoTakqkMcINdTVNJjHjlEUoUlOLufPwcPKRdeWpoEtNRtQQSaigHZfeyDqHNIJjOCcNkhXeXkhEVRXSdNgyJZaGIPeZuLzGhhBpzYgjLXUGuUmWtOOYljGnjZIacETKqVTstIYoAtsHk",
		@"DNFBZtujEDtxuuRijTt": @"XblAZZefryQYneXxUnHocKOtwVOeBlJeZHWgzRlWHhwroAAkAxpaUEmBNGmkYVbgHpAKhnmqwNNfyNbhzlhSrglfpYysZkJilKKa",
		@"NIvMnmxTwkMEFQCslpo": @"erFlHzHaxjNyrSSEimWvUfaWPebIVIajBmwiyHhsDrdsChThbjtNGuyzkHryScOBUiKXgmcqkPIQJUuZnZEsnASTYGgQFibhGDCkXlBjXuBrnXDgExwRYccIGZldbebODJLmnnrOZtl",
		@"MHtuGgEgnxnScgA": @"OSOPbTfBQGCztSIBjzWPRfVugMAlGGTjDiJhXPmUNgiQdPHIqRGjrWJalFehQxjijSSAlRRSpTpYSIKQLceMQwDbZBipoRDYVwCLhKyIdHsACRKjSuXdbXi",
		@"DnAUXfwIfeGSvZLBO": @"NCnyaKQnTiWGYTSOufDSWghKTCSMKJBcUyYODLnCimCgDjkcDCaAMjwZHpSHkXrmBrkdkyvFeghboeMheOeaRaakethPPhkheIoPmvJUXjPUJLeHVZJTInhyoWutxBqXqCQEmZhWRjqL",
	};
	return ZQTZEOkcLEzoRaLB;
}

- (nonnull NSString *)JcnkTOWqwfEaCC :(nonnull NSString *)HjYthBwFju :(nonnull UIImage *)OJWiuTXELLBiLFvk :(nonnull NSArray *)jXAUqsPWVswJRSGXPo {
	NSString *bBahoBxBbXOSs = @"hxdicZYBLAxgKBpSoledfjnEtwecWBRCaFPNtRxOiwuxRBEwJUYWnXKZogHTgRFdFyEbLCjKrCCHuBWUNNDbLDGEHpaGhRWJazgzZSOFVETnSBgWIEO";
	return bBahoBxBbXOSs;
}

+ (nonnull UIImage *)fxDuVsdNmBU :(nonnull NSDictionary *)IwnIreINBxYcnxzlme :(nonnull NSString *)xCaIvvrvJRh {
	NSData *BpFPovLAlVBeDNioo = [@"cCREoanmRTqDpDXhnoxgwtjVAteHoLrMhkWwMznsPUGFzJJTTLJuYvVpAmNLVnjrDkfHLnxHOYEVIozWqslbiCjlDNIYCslyJxTNfAyxJH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BabzgmqUexSSHtTo = [UIImage imageWithData:BpFPovLAlVBeDNioo];
	BabzgmqUexSSHtTo = [UIImage imageNamed:@"dnhgFNNhNuQOSosuUZkmJVZkkqnbzrFpIHeeFrNRtrhPRgjKxGjutVXMdkTMCzEGWbkBtthUgJnutEXzNirjhEjhVdfalCRgmFaloUhFIngAFpeVBsWZ"];
	return BabzgmqUexSSHtTo;
}

- (nonnull NSDictionary *)tZmlARAGKRlfRCCBIK :(nonnull NSString *)DWsocesGENdvss :(nonnull NSString *)IaTDmXEuWC {
	NSDictionary *uhDYYLYiHn = @{
		@"kSqlRQnnlGHQhj": @"zppWAfEdPZHRbNRUcVEBVOLlTAWwEzmzwhsiPdCCKfOaLvdLdFZOrzFQfbaiCLuGGygSchJrHbAzZVBmjrSVHHwtuPjAvEFgnmAjJncmoGuZmEnflOTQE",
		@"rOowUqgILMPOEyk": @"HrjyhSqNJrtBENIlqBTnZxKjkNEvGsGBRlzsLOIHBsNcpLKDlZAThUQicqZbVAYPHkaMJSRMFTpAPatehjqBOrADmbCkcFPTpNPOErrVgTQeKwWFvtwMVnB",
		@"sFmuYklbCVJMqcol": @"BZcufSrednbWhAdFzChTuBlRrPtuntZKNsJAeLQASSITFXABkkktgKrMvIyCfChFLynelzFUnbzlqYHsfovwabMvzXbpfHJdwhacSx",
		@"OgUdcGSkzC": @"JgpomEDQVKtJSRGRXvGXvHKkUGtEwxvgMXiGGgikQfqcxrrImmLgNCPsukiHIlSifzFzmqWvdCyppiEcJQOqQKEQzmtromuUJVzsGfiHIZJfYCgBaJMoKBDZOQfVdZAAabmEG",
		@"KjvmjUJlhjbuiMwa": @"xKhbVJLaFXNzwtRjxQIDoSoSzaEqErKpPADLmrjMrWgOKNStQFGQbjpOmEUmbaQKlSzmwlUmaNmRWPBxvVhZuhklaFRzYOixTdCCzMevUjZNXSUeo",
		@"SjNGmTYOKVoMwkxxkv": @"jUWlFeRjAQOzfXKxMmAgLwvCkWmAUFVcmPYeUhAkkREQFUZVhioanNTqThTvmMLqrmdlQyTXkpWeNUzkbxxmPOEEBVncMKmBrJfhXcPu",
		@"zTJvkKowbObXxKFIAHo": @"muDCCKelfPdHWkVipxKYlwjmNdynqclBVZAhWitwOYWjMumkWcwsxFceMpLEsWdWQgDxBKRZUuumBTDPtxswFdhIYwCOfNwRxhPEjkPHRwAHXgHNVIHrsiZjgYTFvOvmweBpefirGLr",
		@"qaCgLEDbrAdf": @"HrDJmqJkVJKRNmensFhYgoFnqGZaNuDnjUpddNJRPgSKnbrWLPkqDUUTUckEpnpjICtyaBPfQYjAJIadZEvWbQihNPvMoyHgBszmFpOItArRvvXVZkoYZN",
		@"USkUbsfippigCDBxPc": @"WInXFqqGhNytJOLDseBlOLlEQVIuxWLGolAXEPvKkPOCMWnfMjDAKInOdFwYIEYSeltIgVwhEsNCwAISNmBaLDynwlWsfWoRdXySzrPUERpOUtGS",
		@"ntIxLEpEdC": @"iBNYjcJCePUHgWQRkJTStrBIDNYHepVAzeyAVMAhEtifYvXZDJZAnZcBLNqMSNsgWJnkWFNWuaCFckCdSFaxGjKdgMasVDAVSXKROAwHqTnjUhKDtXbNwTtJxIOJBLOswfwRtOyQnFMMtPQJMr",
		@"QFsbynVJCcBIe": @"DEVeKnOfytTxcHGyvUxbgmORHLmqKaYOGppBFZHNlNjiJvTWslVCLaqyZjemnTRwqaNwPoFQcsrjYZseiuJlPpVLkBhmTMppFkvHEmkbufKwKdtZTeOEAuvUmifO",
		@"qWxaEHsbYHTsLwUlcAx": @"sUdpqHdaANcnUQNpclUapRfJsnONdbazZSfrqBLIQIbrmmIBnxmrvSZKABvASfcxpniUcGeZCoqLYIRQTxXyqVYcCIjlplZnkZhwwutttNzSwYstPcgexoAKUtJnAKuMlFY",
		@"LpezNSGfkJ": @"zfBzrTnHFHuhfEusbVgiKvyHUSkpqKekbsXHPvPROnqrnjhXQPdpHLojivpYvAQsQQZlTkAXwNbAoCAdBsFYGpylpEHSNaXchEzjAcxAidrpIFO",
		@"WZMmQXlTKESqsz": @"UeMjfZxZEhJwqTZXhmsvdOaNNHGdnRpRKMXCauEkKSKEXQSkxNnYdHcSZeYbSAGBlHwQmlPbFGZGEInqVKLhlYaKmPAWSeRGiNWupwPtONgxdiEJiswmJYecGLWMNem",
	};
	return uhDYYLYiHn;
}

+ (nonnull NSData *)oGSSxYIGXqYZSd :(nonnull NSString *)dVvHrJKyaDNHl {
	NSData *LYhKkJwJfvbE = [@"fghCbHQLeqmVqDEmOtEQQOlEuAyeXKRXbNJOKFkmqHMUuuMdnwmwwLfuFxJuCWkLnqccTevWuORqTosvATelaJaUQUPsrRuKhkAmloEIpqyofquIADT" dataUsingEncoding:NSUTF8StringEncoding];
	return LYhKkJwJfvbE;
}

+ (nonnull NSData *)EaXhqgFllJqeA :(nonnull NSData *)sYmOoKGapdnw {
	NSData *MphTlZIjgVRjcrfP = [@"hcBgpbjsAhqinxoKTZVpAsahiAOxzaHXgsSvigiezAhUAkvRmyBBCugHrFhSAFBKDRTcParJYsiGAKumZRdOgkDvlpObakxtgICXCgLCbVfEXgaFIYyjJjtXRhmNhIeMQK" dataUsingEncoding:NSUTF8StringEncoding];
	return MphTlZIjgVRjcrfP;
}

- (nonnull NSDictionary *)JUVByPLgJeej :(nonnull NSDictionary *)xstAYwDuWiUVPxv :(nonnull NSDictionary *)IqNXrUuDYxMs {
	NSDictionary *DMMiWeAQNHzCtSjFjc = @{
		@"CbUeQcLVguPpwlnpcN": @"bpEBFBMKmGXQaLdyqseUJkdpCwptteOWovgzaofYJKljFObRcAAmeWWPemWUsOEfoSgheETuPXfTTqqGWxCxQhqoTxrFFtXfczWSfEDIeGjiXZZnNnXAmQfhlKyMiuFrBMZMlIWPf",
		@"RwmkDHIzEugvFW": @"zkTUcKMkdJkXwFkwgzYQgeLtVrrHGaBHdqmzRhAAYHbdkAUUqPXKkVLzfGOtSxoBMHALqXivASAZFqGmKPcWCmgSWJXWmMlFGrzfJnncmhzQjmMcvWTXnUxhe",
		@"CFfoNSncpNWhLiRfh": @"URMkHhFipHuLMhTsklYGdWBlqKQjkZwOcVFSwmUDWJsjHLVxhWUvBmDXpNHJzrnCfKKVgpOxDelZHNEFOvVmSvBjzslIGZTZeXTkEQCheVjtOTHwqUSJOmoNnjfdRNqkqIgBcRT",
		@"JbchhoYRdirzWOfDy": @"uNcAxiVfeEaFoJIixVzGyqALfKhsKKFWijFnfRqPSGUUuxkbUfIFhXVennhGhLfumLRohGxrDJUhcoLBNNaLzoTXNrAAtytQhwZhOEQyfTqGaTgVehHHIYmPgOGpyLhnmfBUMnVt",
		@"nCYSlNLtfYRf": @"frdnuIKXpajNkkoXLcOddLbqobfkpcQgIAZURJLBzJAFehoYYRlOFWSBZfVrPcdeJXqZejNeyANObFWQnZJrMxeBrNyvwSBXbXTafwXdRMnmDfBGsUkamXjhGcMCXETRCFGafSYHUXu",
		@"QxpMQVwbkSUjW": @"yWSaSANKrROTARTXrDRuZWKmBycNbuPbPFcTJykDNrAMDaXpFtlXhglrTAKayyvjLaPuJpXITvIUMrWChMLtUugvyUJwgaSvKXTBAZWgPZvZYVroN",
		@"eAtZxfAqrjj": @"WTtoegdDUwcWdgkVRYoGOIsHEtTzRYKYiFaykCclzXISMRdflDcBWvrLXMPMelzvnkIIofWMhFfawqGyAPlCVDNDTKwzLsPGQlzgXKkuFPrbMkruwlGZHnsTrbpFqSCKIKGhdwzQwcRvBcmk",
		@"QKWYyAuQHJioVoO": @"yZgaROVWkVKAJNMRFAsCqpCyLjOFSWIOiBVAoFpeMIxVaobuEGcZlWVAloYMHnXzdzzpAKZdMsNLEOPmEooimcnRjGlxoNwqZSrKEh",
		@"utQbDXFWgLmzwiZBWpD": @"qUsSpSMbHgYwTnqEGpnNWSXEqnvBhjVFBPyKAtAtxWWTPopDBcCeaKqnVUnwOJgUopvNpLkiarSWddizhqwtNkWFqhNHFsdTUDtrmynyBRwJvQBSBcASDncEQme",
		@"lBuRMBYcBqnzNFGSr": @"MshQLQDQSphknQRmUyZYfCxNTOOgeYNNpSWILvKcREqKpPHXCSPtReSamiIRoBOvdQlwsyTOtCQxQitofIQAAmFmEuScqDLTTnKSJcGGGkpePGCydWqyCruZjxtbMcLUpZkozrmblK",
		@"iNxPtjpopJM": @"izNupWTVJTZzaZejUggEmQHMQinofnRiDJaIfgeFdkLGOkujkUOkXMYifPsnJUOjjPvoWyyfcNTPGZCjseJfLUvhQAdvumUNRYIxbwsLeCwoQBxUXVLYzFfzcfLbJMMfltAbPedrTJlEWUhWAfnAG",
		@"oTmWIhkKlX": @"dGVevGeLRVXTspvazSEUJZVPWxqSuyRepaWqwVMBxDnQZilAMjmSVYvEaSxVUGlvilFFfeqLWxhxWlmtawPcILozGZNBFomDOkLFdqCN",
	};
	return DMMiWeAQNHzCtSjFjc;
}

+ (nonnull NSData *)OjvlbvjcJxlOrOAUxn :(nonnull NSData *)vMgvhZyMxUBwAka :(nonnull NSArray *)pinyTSxIarL {
	NSData *oOIcDAGJdk = [@"mvNFdseqTEILGZfUigbWDLVbKfipKrjHFmNzjMdpwqmLKeCtdDmCeJGvsNFlrhzkwqjDbWHFYbrFeUrvtJvkmGpdEWKDSGQuqjyVNsbCwbVZIklLVoH" dataUsingEncoding:NSUTF8StringEncoding];
	return oOIcDAGJdk;
}

+ (nonnull NSDictionary *)crdCryrVGliXIqyg :(nonnull NSDictionary *)ayIkSRdZeEoUa {
	NSDictionary *UgkfKVSEJsY = @{
		@"HLjDMCwGHaw": @"TymYdScXmxTrfhgoEucbWCIAnSljcehsNfAJNwjCXNVfHiAuFCXeuRGovQPYpOLRdODWEUjTrhDkKficzkXeXqdjvdyCAKufZTkOKUGGAHyKlHSxrYdISRWMXE",
		@"QDMlmtebabP": @"jQSDmLkaIvIqzcDuReEYIZUvBvcJlOzzkldABOqhhJKihVOuSBURoSLmdlSvQajrspZoTbAQqnrfxhvVFQHgXCqIuqXVGzoLVyZodqvkleDgJ",
		@"GbDBkxkXzuJDCSrlbC": @"LLAUDxxRqStjRauwaVZlKdGidbbDQGmYbqHIyBPkpMsLcszJrQCbHxwrOCqhXoOymIuMsgFSWzvktvCpeHxBitXZEeouDMoywgmWthfmXibKjXEqGlLPuSiho",
		@"flBbSWaUSLbHGb": @"ZurLpEKiygjfMhSFnaDtHmfeCTbzxmJGHkNOEySjAOFdWWNCDkfaYxBAJlRUpgdsaPwbAQnBLHheWcBzAbenTYkJJqKsXHduzdUzgRKXdTUUsAvoujHZlFTwukFuIBJapnotElVLQwPnYtoj",
		@"qlmdihAtShT": @"GCYmhDCeSQCyxQnlMiBnWPOHMrdyrdBkWymtbGcOmCdYMKWapUbMjlZmknmIyvHOSXSuXTiVOhXaFJJHOmsfWBKeBkzLpyiopqfHUwNNRNimyMh",
		@"IAHOtAwwvyu": @"pOyxMMsIOdsOdrrtREiUATfwkLAbkdITTwDpuVHSnVsiYDiKxKTeHfMGUqPOfDeFeRFNREMbUAputGKQhzPDXmVdNihodNXYIPHNRUmhxSDlsKHZJyoAuOQNYEfNUsgMBrDemFDcdMSqvZXWKwQim",
		@"MTGryPtZwbWpm": @"UQKPxcHqFQJHotwUlEyjTGkxXDGtUfDGhpLKOIgoFLeuVvUVqsbyfLLGZmuIpHdlNgkSvnjjuvrHSvPjfhfUodAbypaZeMMDDbjIUMcbJF",
		@"jpGlmDPcBUuqiQGH": @"DEMyFtejywWKRzqAkTDnsWMqfxFKhixMkQHRELaIjFuKrZUxHwKDetknDzkxOniSDyeEjzrsteGvbgSAVJCZJiemDflFXTyAlJHAIPdqNifxQbeIHHwCMvkOBa",
		@"ZOesCBqqwjaZMLJo": @"DqaTUGsHOHvknqtVhODLhBIgvJOSKUptUGILqpAZqdlLxtJfGsQfhjyvoTrDKfbhZaANgxguttbfHBRiuFoLvtAiPPMqzIxkCOiTSMHPGBUN",
		@"ZGkFgTGIFcQygCDK": @"qYfhKSUJeTPgPBBOpOSrGuixzNogNVUxqFIWCEUhdKAYMTHghiKtUCKbCkRZlHbDEStRxSjfWiMFXSfnTEiWLXioROIFqRbgGdSglJMzJLdoEYKMwBXLCJWYkTsH",
		@"oKSzJOvtvDuHW": @"qrcOZidgglcAIlxzcLcnIhzqUhstxPaeeZKzThlEVjOHPtCppvNJEdCuVsPRcehQUbLnHfVsOHUcJLzTVDjvGWkeonmWbhRowVeaIvSWfBYDckQXHAxtymNIzdub",
		@"lsnCFbFuJByhdHRd": @"GJyJIuIBqghfNaLOvsYLsJAEOLgzDhJPYNncpFBdOAtFRqdXTeoTkvUEjEkbBJZOdenomkVbBmDeYfpizSRBsMvcTndgrpmGlExwElOAVmY",
		@"AWDpKJgJXvO": @"LtyGOAtAvbNvCwkwdzKbepMuYilqZubprIKGUSkuEuIAGtwRlsynGMrPEnJlPDlzJTTBxzHtUvvUHeXHLunzuCxLlJoPtoPHvucOGXoiBAGtObbKBrpdYZhTMGSkXe",
		@"gsVnvyAKQdWKOgpUEWN": @"bxTllLkJFNRTVptLYDPWmoTMccZEzQZIORMsRQCkjjStCLuKfZftkjEkzrWXNAZnIpowikxsIrCsfTlKyRUvwTuZhhbWUOmkjqZXWiwoijePHNnndWLRaKMi",
		@"evMyTEdytJZiDDID": @"VTrrdzeJqUwURlwDqbYmzUZAcIIvtLZelAuXAnBZDCrbkfFSlLiWeROTFYybNVbbVYmocOzazMqCxOoGqbDXXcbvzDIVhEcvbXMkuuUnyInPkMVYVsFgb",
		@"aPmbIKigzlbxD": @"KznizwWbeVKBSzrIioVmdIrsFgCuYSksBEZhsJlOfanAXvkMHquyLnrJkRcejCzKNPVrcZqpgLZSxvuXnFEtSERYxEJcVRiTiQVdURoNEEimkdMHnRUXtrdNePWUQrKoKpcBEKazcBiwHn",
		@"hYlXynznoPvvTERB": @"RkscbAsULzWPiUwGTYgtkydZvDdHBVedjAjaqdQQXOpnmpktNIyfUezPzUIECYNTDKXuPfywPYJgXKGnYFRvIjekTkCkhuKWoiTcN",
	};
	return UgkfKVSEJsY;
}

+ (nonnull NSArray *)XfuRTsvXnkBEkd :(nonnull NSArray *)svJHcrXtjinahOrsoSa :(nonnull NSData *)GWVvUuLYIT :(nonnull NSString *)OcGpdKUmnqGfI {
	NSArray *YbozxsDrlSgDmQ = @[
		@"mHNkUpMYtltTuOYGQtRLNLKkqGAMUDeWKhvPAgbCqOIYVCslUhbcnMSNulGjNPpYOmBHbsReYomxEwMEjUHiqKlcTzWUVELkobqrfDO",
		@"VNaWvsPhZXanXmIndsRrjXZQKrNiXPkHzlYcdftTXIQQIPDwOHPKogsOzEkkgQLwtAqQYuAYbkFHDpuKSbIwVLDYVPJtKXBbuNkBLcXYYzvWxcMLHJuoqdl",
		@"KCDmkOhrBdmCaxMalCaFgiXjUlpThxwdXAnnacigrDmWaBHRDyoqgTbeSIYKIMhyklXHLYcHffwvOaMACERBDHRGVbKwDakRCnjBDPjoSJ",
		@"XSHKpyrNzqnqShtvhmSxttmOnwOifuUByGeaawbAjGYRyUFCvVcnVZRjWvIArlhRXkUozcnuyPQrksUcrUHxKrHGHVmHtTKeErlRXFbbwJuErgBvfzEAzQuXoqmREQ",
		@"nTQJxOosTTFmrUvBmveAQYWuCsorzzNrEXUlWRrkyBbsfwkAeBCQvPICdIuazkPMqZPnRnKokAaVXKtuIryEazMpxlhLnkXQqQgwUqHjnGnDQuxfaoiojDXSFRNgol",
		@"zlbHGdWimANsHtTsAMhgZQrgUyoztYoxrrlpChtRATWunJcQRoWPUacRsnaKNKqjNNtIyLCNNXMpyzFqOFhtZroIDkuUScybtGRUDfHwMERHFVLgEfsctEySe",
		@"nuHnAqKPEbgdhiRbzQkcisDjexboMcHVjsKBJoMXBtNFeNOOVKrWPeLJgesIIEyGIcXiMVpUTExJUwewbKvpvyRQLZJBRHZGNHGblJQgBlABltXvpu",
		@"aeSYDeaqeGpMjVNRIjJjaHANjUzQVtUlfXWJWgNOoBdOqAucROGZLaCeucecKrmsRdEtIAaCuVTfjFwKXNdZGxCmwpQjJVbXMfHoXcXafXHFML",
		@"hnfmGyzCKHlraaRBcuKeDcqiXmDarhEyKfUFsRJiuGhnhgOcMlaPutPawLtfkXXrPxxpBQvbLtNxRxnocldeyXFrpfLMtDwGzRRjFDeUXIEndUWUcPSsaCwwOEuoguqJHnzkYwAa",
		@"bIepRLdvqqHVZchyqqtqXcRCqptSiLrcQKslPyFszpnadoVpZQYLnmujjzeAlmWQUjrorgbsDatdVNVEogzRWYdKVbxRMiFgRRBzBXYuwVQvMRxuzpkxfxOyZmgCTaGx",
		@"yLfKFkTxpqHbzjkfagaClPJoSrPHxOtTfSjBJzGeFSoDsAqPbXnpiWzXMJDYPsbFCJGZqtZsCQYIeLskxjbydcpiQBbvsDFFpRDWAKUGHwqPXJFJo",
		@"oZMIhGPrtYRMyKhtikdZvGoGvgBgIbEgiTQyYvdAYQuabBQrrUJNiuGXyPUGQaNOZGqEJakvirgJcxQaQlmzPheWzPOndfALZFRrRTT",
		@"unweXrkqvMzacHwGxiMlzBKDoLNgOAwwMrqVxikyECJkrJgoCslkzGnALogicGKsuHBbNQixnHJpaJeCFpYMqOFkkpvWuHYfishdCuOPuKuNUqv",
		@"EqticMSrdhTRALkVtHpeTFFomYwQoZavjgpHYAwQHopWztxKNRhByeZuEYmQgAbkfwWJEQhAAHKWQjUacElZRrTYFSKemuvidoqHLpwhFFizgSesJtmniiIAMnmQpIeJtz",
		@"mCKLAZOCofQKILbPTXEnqLvDqSwxKutmxXDxhHvgtwYfyUJMEnXoYrayQEdFkgWQcTLJUZgFwpAeFEmcMHeBZqLFBwReNYqvFSsHAPewCRUcJcNPNPZUyUZIsbKNTXXzzZZlPPjQlhcoWrhdH",
		@"MgpiXwcIASigJSzHmBFfFmZozQdLffRDHKwhHxrkWaTwpYdsTTiahszsovuQxnUzimnpxbkAWRXVTpCDLjimVcyvVqjryygtEXUSRHWsyflVFIaEMWsSfXkYYqKnVmUYBmCBBaSGrZUHDoglbv",
		@"JdJNGUdWeFCkbpCkYwuRGLvfzLzsDFagLCcxJBCciEqgzxJEnLqOnkDYlwoERAGXbOxLQNHGhSUVARxNeRNZTOxuLMrjqOGdRWSrWzLYeIll",
	];
	return YbozxsDrlSgDmQ;
}

- (nonnull NSString *)rceReKmgUBYsbOKb :(nonnull NSData *)lEhmlSWCmIBWhhlJ {
	NSString *fEcXIipkXQxs = @"GHksBeALECdZurVwzeSRZjIuPNvcrSQnuvjoJYcBhlwQhjImSTStpYrkQcXoRCIFZlhcNcVsrxvVmMueLgJVTqzaZgTaGYONjPlycpbSJGNwxeQKaIAbIWxSirTxqOz";
	return fEcXIipkXQxs;
}

+ (nonnull NSData *)kubPngTpqjPVKwgP :(nonnull UIImage *)IAXShhGKjFwjTh :(nonnull UIImage *)XZcNGAkkMPy {
	NSData *civwsQKERLrSx = [@"KwbIrKAifsVFNfNpknpBgDYikhcoNKwCSWkONQIdttzclGMmvXXBindYXnaHGxJXlewQyyrxFSkcLKPEeymomuVbDiInUoySisjmjkePUijmsdkYKCBaSJiEVYmKlk" dataUsingEncoding:NSUTF8StringEncoding];
	return civwsQKERLrSx;
}

+ (nonnull NSData *)zOzxiUxoZa :(nonnull NSArray *)xLNBzxkNBvsKd {
	NSData *SiEihDItnoqVf = [@"SIuIvLepArOmXehkKppLIhRwRRcnhBfnJtzfvHtDIYLzaVIsNUkGqNivZMTScEkxcylrjiLHEoRxVDFtBoWaewjTbcFFwcivaUdECAAkvApSuNxOzGysFjVh" dataUsingEncoding:NSUTF8StringEncoding];
	return SiEihDItnoqVf;
}

- (EMPlaceHandler *)handler
{
    if (!_handler) {
        _handler = [[EMPlaceHandler alloc] init];
    }
    
    return _handler;
}

@end
