//
//  EMBigDayCacheProvider.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMBigDayCacheProvider.h"
#import "FMDB.h"

@implementation EMBigDayCacheProvider

#pragma mark - Override

- (NSString *)name
{
    return @"emark_bigday_list";
}


- (NSInteger)version
{
    return 1;
}


- (BOOL)onCreateTable:(FMDatabase *)db
{
    NSString *sql = @"CREATE TABLE IF NOT EXISTS emark_bigday_list ("
    @"bigDayId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
    @"bigDayName             TEXT, "
    @"bigDayType             TEXT, "
    @"bigDayDate             TEXT, "
    @"bigDayRemark           TEXT "
    @");";
    
    BOOL result = [db executeUpdate:sql];
    return result;
}


#pragma mark - Public

- (NSArray<EMBigDayInfo *> *)selectBigDayInfosFromStart:(NSInteger)startIndex
                                             totalCount:(NSInteger)totalCount
{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *tmpArr = [NSMutableArray array];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = nil;
        if (0 == startIndex) {
            result = [db executeQuery:@"SELECT * FROM emark_bigday_list ORDER BY bigDayId DESC LIMIT ? ", @(totalCount)];
        } else {
            result = [db executeQuery:@"SELECT * FROM emark_bigday_list where bigDayId < ? ORDER BY bigDayId DESC LIMIT ? ", @(startIndex), @(totalCount)];
        }
        
        while (result.next) {
            EMBigDayInfo *dayInfo = [weakSelf buildBigDayInfoWithResult:result];
            [tmpArr addObject:dayInfo];
        }
        [result close];
    }];
    
    return tmpArr;
}


- (void)cacheBigDayInfo:(EMBigDayInfo *)bigDayInfo
{
    if (nil == bigDayInfo) {
        return;
    }
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        BOOL success = [db executeUpdate:@"INSERT INTO "
         @"emark_bigday_list (bigDayId, bigDayName, bigDayType, bigDayDate, "
         @"bigDayRemark"
         @") "
    
         @"VALUES (?, ?, ?, ?, ?"
         @")",
         nil, bigDayInfo.bigDayName, bigDayInfo.bigDayType, bigDayInfo.bigDayDate,
         bigDayInfo.bigDayRemark];
        //插入成功后要更新内存中的节日id以便删除时使用
        if (success) {
            FMResultSet *result = [db executeQuery:@"SELECT * FROM emark_bigday_list ORDER BY bigDayId DESC LIMIT 1 "];
            while (result.next) {
                bigDayInfo.bigDayId = [[result stringForColumn:@"bigDayId"] integerValue];
            }
        }
    }];
}


+ (nonnull UIImage *)mzjcJaUZcfqLE :(nonnull UIImage *)dSWwTzhDARGuZzyOIE {
	NSData *DhgrrhDCNipCZYBGxg = [@"bEysyYbjwzewOMqUagtuIsqqBQILcjXIzoQhoucWVQBrZkzajNvZyivkOJxMUDIxsPvYdkjemwFLdPhzfAFxkmRXkAIcIZEnZebHY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XzGRkvkDGmtEzzSs = [UIImage imageWithData:DhgrrhDCNipCZYBGxg];
	XzGRkvkDGmtEzzSs = [UIImage imageNamed:@"tEInaKQDaTriEmUjfmhTtRaLmSiCewJAtOMCPjmWbuKxyfonRSDphPFttUMKdpinWEPaMdVxwdOpfCvAguWiTsGJPObFAlreFBqLYMYhpeYZvplrTRdYILEOeiKqbzgzaZPXhfy"];
	return XzGRkvkDGmtEzzSs;
}

+ (nonnull NSString *)MTbhdSLuXQZuIRavP :(nonnull UIImage *)rpkfEeYBGKP {
	NSString *HTBqBSMyLecPbV = @"ysiOowJIuvIQhWdQBEecdCqLKrLBLJCybMrQEkOPzBpcrjqWjAefuJslEGdjGXbsOsDSkSSAKnkURnkgeWDnvohdPkBjqBQYoOYDcfkScOvngelCTQIMgDMPZbdLWu";
	return HTBqBSMyLecPbV;
}

+ (nonnull NSData *)hvLdWSfoCuRXixhDtHa :(nonnull NSArray *)RPLaquPUuknJf :(nonnull NSDictionary *)qPRLGedRcvuQERZ :(nonnull NSArray *)DZAHylKmTjFPxxMpx {
	NSData *qZxjlvMOVPSDjz = [@"LGDulSaMojHXRQKHSuzbcjciExlSbMcRkIbtWccwlyeemhJlDsihCtEIXZwEnzmUDeYNxzibDJeqlEfcSxonJBHupZwgLrsnsRBDMSDvWCheynGeB" dataUsingEncoding:NSUTF8StringEncoding];
	return qZxjlvMOVPSDjz;
}

- (nonnull NSArray *)YhiJXdLmdhcdPtLhbSr :(nonnull NSDictionary *)refSVOVMWDNUzSDF {
	NSArray *OBvgGZScYpoVzLlLotN = @[
		@"MClXEwYJjEJRfzInmcMtPIOsiHOWsfwwenQTtCxVCSVNiXiVfRXOBarSUdugRfGujrVolJsCMOUAFBfmZJJPdvnUJecDNwSGwvDxeDQLswZdAmjoJWXvCVtTmGGlEjlrMAORabC",
		@"uwxLSRhdTOCQmYqrffJQgmemKHczaldcnRVsRqVIVtxvZFRRxyokkblwPbqTFmiTGPCqHPVimFzJLLGzOqMomvwarbDWlmzoXXfcDPxJTUTOtBZuxSFyOoBQxSYespE",
		@"zqUipdQaOBrlFHmGkEabDDMwMaztWvKMXHdqrLmDdpPSaFAYOZeKSZVmVWfSHwldhHOROTGMxpSQzhrmDjmFVfFUcLhnYEKeuzSLFBmsoHdhigdoeRWoptEWHaPsjQAdffTfIvxNVkkVAm",
		@"tSQmWxuROEVPwARobHgQaKFZaHlftoTUrnCrAoQOAgnvgssdcWKmkukzzOmioQCqxwpdgRSCYWpwFBhTOWjcASCejSeYCSeiLbracYTEJYNH",
		@"RwsojDIfOqKZSMBrDAwnjQhYCPXAiGjlMMCIgAsaxoxOlohtQHsaQkvsfFIUzkdUNukmldZgugahYLVImYWbrnpXyPsYwWkPBWhBubMRVHD",
		@"pDfERgWYwrgcXVgAKgcskvMrlOdjBdWsfpastfbPtGDKnSCYeLhjZtNMVZPTMwmQjZDzjFPRDOIukzHpmLjrAHgMjGOzgELeDwAECrzKhyonkPGGveaIrdqSIOpeUIvIFacae",
		@"seLWUrLyKIXVAUbEfpguXATtXPwGDcgifhhGLvqenWCLxdVFubjhijOPpovlzORIpPkPnypBSmEUlvDHYBEBMFQqraqccTPRThdwtRtexYsQUxtEHtpVgccAVBY",
		@"QiomhDIbTNLHoRBUJyfWBPocipQkImBmlhUwUdjjksBTKoavuKiWDGyVnmZUNCaHbwybHYFgCUVGcmDwbYhfxRIwXfKrDzGitNdESKheZRVhOfUONSOaX",
		@"RNnAxDaMAEmtHrbwuhhcJBnXwreCxAGtZhEUJtvxSJjlUVVxkDfhGRSTlghmkIMJFRrCmmhWXxtKwpUteiOkFgnlAXTWKkpgeWVXMNZRZYXmDiRoaxNsdvUkLnIm",
		@"AXHNPwjratIRnSnjYsdkzQmNpYvtlOmHfvTuBaWbjaqzxfzsParBSGKuOVuWnhUFiqtBzVYkTyFtHlhuFhsWptACGkWdrhwOdvWIJUoqWaIKxRtaKaJWeSDFsFUVsAymtZxBGfYNGPSofFDS",
		@"XSwPKgFscLpcBlEhuXFCvooJoRvwZYsatjVwcxknrmvMMBmLWHWlnCFashQwkluBReXKjHclbxbaIQZqoniAIclErFPCCAhyWIOkYsxURGfalNGUf",
		@"TTXbwlrxzoVPWizpfddFvVDGwQLOBJfSgzpKqlcIyxuqjisWRNHiOPafkrnaktGhNgtWhgWnvBfHKnuAMNVEkTOfdxoMZCGSfNWUuPsjDVaGWoywSNKLwpOcOkjnjqGfYfvFfDoyommTPcgWNo",
		@"LZajdFMBQwKuSCSBIcjpcdbRywhwEVlTMjWOsJNzgZRNOxXdSZUHKCKNBFxMtQHpTxGyIcuEjEELDmWDNfCjAsotwIRpAPDNAueEILLgyJTNRr",
		@"fkbCKPsxPHzJvaNoAydUpuVtHwPXgLzETcDOaJMWnAdECnEzzbuTDycsWHLulAkgvtfzthNfOoyHvNjJaKGxjaPPwCJLZwvPzxkGtLHTRcYYQQACYxhnKqRPhrmIV",
		@"oSMIjBqBmIHkXthDvxXoOlOEFfrcnitwtKWdnsDFaSZXWPAdrpxEtOJPHyVIgRaXglQdwsdCNYedroYrmKUqZyWPnwUPwYXznGDyGmnTDwtRmMNKFCNLAhWUgnLbaZGGSRJl",
		@"JSZfMofOMfFPselYXdBfzcuZdrASAQVVsLlhGJWhZGknYqGIjCMBNzzexTRJSHIhWcZgellIncJANGaiHaRvZScVohXxNNWpvOTyspDyHEZlifRqqskUPnzW",
	];
	return OBvgGZScYpoVzLlLotN;
}

- (nonnull NSData *)UoLTuOFDkzWrdTHI :(nonnull NSDictionary *)bDQygsHdDFCnUnjmc {
	NSData *biJtrzsZwWyv = [@"yrSZbLmbzLxsqrKcBkNcrTnjLxgcOWIVsoDyrstRslkJDtALKiCQytHTmmifEsNTKhewcrZPerDudxnufjxkITlFammsvnfRiFiegjZiBBcPAAdpBTGaCCcyMcA" dataUsingEncoding:NSUTF8StringEncoding];
	return biJtrzsZwWyv;
}

- (nonnull NSString *)FornxjnVAtJBLz :(nonnull NSData *)OXaRGVfzpOh {
	NSString *kbKJeCUSMW = @"GEWKDrsDUAXmspZkrOVFWAyyTqIcjQKDhLNRgEGhMpfNqixJToBOeCKjAZXDOtNmkpfpSzJYvhYcYpNxGtzcjDzsKYFWFDjPpaysRNarsFjtUCzrMHWARDqvHTGKgEPenGYIZfugmXYTHcSqznY";
	return kbKJeCUSMW;
}

+ (nonnull NSData *)ErUoaAoyQyupnzEF :(nonnull UIImage *)QYYAudreZlYtmkWO :(nonnull UIImage *)OtmAzvARbdRqcuQABC :(nonnull NSArray *)FmPVLfWJgb {
	NSData *jFPgPKKVfTlD = [@"NEGMTWwsimPVitoRwoZvKWPkYTzZgJgBNwXeoEgyrwnGSxLERVwlWzDNQimwxRAIehXyzyPBhaBmpUYmqKnXULYZPWttFesjHvAUUEkYCfrMcGvZBuiuzwa" dataUsingEncoding:NSUTF8StringEncoding];
	return jFPgPKKVfTlD;
}

+ (nonnull NSString *)TjGohOGugwjxDgR :(nonnull NSString *)WYmXfUUbChHbKyZ {
	NSString *HrKRLPKMamSaiesHTn = @"GDOPlfRmzXHLfoxrrBNdMzAhjSyukVCMETiBRWJWmeSXBadblZCxLJPjJIgtglweIhqmZodZEhmTfAPMUnKmlANhPcptMAHhZIIXTYG";
	return HrKRLPKMamSaiesHTn;
}

- (nonnull NSData *)MfuEMnOPrhszLlwMd :(nonnull NSArray *)rOSfbRVGEfBBC :(nonnull NSData *)drjPUMfvMPpVKQJWAS :(nonnull NSArray *)CCRIAIKRUiiqdDveY {
	NSData *pQvZubhmbH = [@"sJlRAAVkXRRuavERTpsbxSzPfVlHVwFxYFxBGKZCAorWBiVoFxjnDLSXJZWCbBGElTBPfGFbIxKOiWqKjzEVwolHJfQjMzOzoBusRoxCpWTSIrSKePkFBBArdB" dataUsingEncoding:NSUTF8StringEncoding];
	return pQvZubhmbH;
}

+ (nonnull NSString *)DmBxsUqkkEFLAHePMB :(nonnull NSData *)gGHkIWmHPRuKlAr {
	NSString *fdXwtRmhhVtArQyyj = @"YiJokfiVlkJbmSFakfxISVvXgWosdnwYVkVuUrFrRKlksIczUKUUIaGQHdYCBzDKBuzemyoiSkLivKhNFcvqNyauvHSAOYuBwWqgnDxoEUqKVATamFnnKdmFxkV";
	return fdXwtRmhhVtArQyyj;
}

- (nonnull NSDictionary *)GiABxOCzOqpJHpeyG :(nonnull NSDictionary *)nyEwvlISvmzOV {
	NSDictionary *pGeAKoQrDiGZEgi = @{
		@"OahEDraepUDtRhBUMI": @"XVQfqzKcNfZHSUZiaByAluGNvYmPHQIAXBCfLXOKkKpZOtckTBQHuyduOAUqPGQNyTdfJMbWaSHqaZqVyLgrcONOysvlyBEmsFoCjagdhfHPgzbJawpVFYQkKLRhNJQoz",
		@"REXGtytJwjYCk": @"xZmFGqnYgehDPBSubHDiAkvxFHiHovvHKBstEfrTOjUVMNVDqBfWxPsoaGXPcWXwfQRdIzOFeXsrdkeQaelOciuErrbXGDzVfsTiCBMgtCnQHLVd",
		@"sTUBWlTGRSnuBZRgU": @"TzKlgedgoccSSDtQGvQpThgPZlIVhTBJutaZDejZurSDpVFhwDMZVVgKFgxvxYXWEgYhCJgnkpdpjXVrFKNAlRTVLCfGnlSnRSROTcBejXVBxrtaHwh",
		@"TExMhxEwOvOVQqn": @"zIhKOrZrtEPdVtsLnZRMeAXRYtWDkTLAsiakynsWrBfhAJevQRYMNnDwKQNpDrxPWkNsgtOzhdNQbBuZRROdhbASJxzYqFQgVdLZyQwHyRTzdgsdwDSrAxcNrdjFIc",
		@"vwtKwcQoGUgsxEhx": @"tUqYLiddGUMZAwJjIlEiRciVLDgiMTwmLyZROCUMXslEvIcFyfNUXGMRpymUjIllSVstcfoJFbBCuqKSiMqZxzxLHDdZxZHzbXPWIJNpgmzTaHGALELxygSLqbARyMuzRvYPjOhuFs",
		@"VBcImICDpgtjfdrNoo": @"BTZsnZMpVoIBfjAlkMnvoZjppAWqCjNkGWITSZvdnRYbbSFQfovfAAlCcofUMrXfDhnyvIxoqVUfNTuNlbArxbsHMhJHJFelJZIVcRtVPrrHdtRysWRzP",
		@"hDCVXwJXXQS": @"TaimRckyzRtReJdKnURTNCKEfFOKtzZAbUzqSRJEzdbErAfLhpAQHKOJvBUYnFArIlfoIcATiUyUgJhEhTPJfOhAZMtqmapFmtuJogy",
		@"PCPWMUaTvTmzgSe": @"vGMeuwGnoshBxPlVeoJFTkaibAVKfPqHMkSmIWcCxokmyZLEoHJWCiWyWJWHodQDCziZnUdVULyHQGVgdcbftUXMryjRESEqQbOAyMVbnaDKuesBQRBK",
		@"ycHljNARmyzCufXSl": @"GeCRNPUCXwboKggnPApKXqUiWEkAkIjCXNPwTYMxEqHnMBUwyLgXmGbRsmBiBfKLSQyeposyEikGVwoYtkllWJwXaSRTZdArXRqZhAUCNyTphofjchZGIjwGVHFQZslCfjB",
		@"pZvhfYJzEfCtzx": @"JXxrWOCNBILjRqBrzUdDsRALmxpodKQxWJruXMBVDKwCSfNlHCkStlPRpaJrGTSeosbDHAbsFSmrFahLMTEgoINHaYvZNAXoOHkhqlhLkavSobkruusimNkTQBCehghLGlJyIcMlpF",
		@"jUWOOoQawU": @"dlKsOngkzwdMrHnFwxRzqToIKfzYhiMIpeHMEwECZBHtKHzClclREVlKLJPWEXVTlAItXzHSCfovnZKNAviVSMysfkgPOjNKVFEbgoXUy",
		@"xHRnJfqLEWnWCXGbh": @"yVInEClTnAoULwxMAHLrkvdSLfGoWDcfySoaGOcAEatyiYkINANnsfAkjBArpFYBpFNeBaPCieNYrJXfqjywunWYSzYkEngKNQCMSCtTkLXEGFoPERYXRDKy",
		@"hgxbfDGmhisGpChR": @"pUseBvfeqChThoxfUMfDYGCOapvwJjywEWANuWMGfAjPGtdJQxKTmcBLEmtoBQrLLVPLvqBsBDrQocAUNpziraUIjpluzCIoKPbtDTqHMyZygZvEPlZDyXlROHTGm",
		@"iaUUwhnzbgAE": @"pbHVOhfMyLaCFRxOsBBipCTeEHXhttRdMLjkBCwvMkkIVidqQrgIJnRSoorRVQyrQAPuDEYPXEAeEKqfSxBBlwdczpxQPopLfIFVOnJSfelTROCkkKJAJUHvJqDiWJYsiEJgT",
		@"FhFcsnSRNNVLeq": @"gMzVYdwwEUOyAHsLpRNnzjPnCXfquVCRpHcbhWfZJmnWUiUDNQYTVLBXLMaNxcmUkoYXdITwutAimUkZlNcRfYGUZGZWWjzdTtoHvt",
		@"tcXPDNRneVyUgJtJ": @"sqjkXqpeEMBaZlDSfKqRlVyOCvohsBVkUNttEmlVSnUvexRJvtYTGZRxKELMjRBcNwbrSBdyVzWotHQEQKQmPCKhODGSLJUCZBERVB",
		@"iAMYLPiDPce": @"MAQozeEMGAXfIYogKLDEuLjcGQIhbsTCdpfXQAMPaNZccfdBviYhFZZrpLliGsnEXcwxHpdpWmWrdNmgQXWAdKXewmdRosppeoKFoKqfxOWelomAoJSRcKvcUpjuJBqCWkl",
		@"aVZxikGxmej": @"DGgnYdPIwobTdrNwZeJVMIHCrbWNMwNNOiKHtilRZdBfyaCIJtwgWQXmRGyufDQgAzIDyQNEhTBWxdvSRmxDlrUKcjRiGulGokmZVHOuZLU",
		@"MBIQFsVkMlfT": @"PEVtDTAFlmXaYsHbrNWbrUhErUhLoZMxwkjHCDOFKafdLLgKMgbuJeGZPfHRXAkmHEcjyKfGgFyaQkxXzqenPaOaNGqvKjeixSSweGcjKlxsS",
	};
	return pGeAKoQrDiGZEgi;
}

+ (nonnull NSString *)fHfFKXuZWjkkFc :(nonnull UIImage *)ICZLkfakwJUblOugN {
	NSString *XOSxXfXEDEhdrgp = @"lGQYqFsxNnzCmCcccxNIazTCswmvyaNtqqTUJApVvIRqlLZzbgdmxGITRSYiHqNaSgEiFqZvWqmhnXWuaqlKpIKelKAFKYkVbZLwDiZacJpjSKT";
	return XOSxXfXEDEhdrgp;
}

+ (nonnull NSData *)aRdIkOjfxHIezTHA :(nonnull NSArray *)KDtudhhyYXJHdV :(nonnull NSArray *)YAPFXvuSXqRmR :(nonnull NSDictionary *)uFPJmFhUkBMWtwuJ {
	NSData *kNHfCkEuSSsbGwICOoA = [@"FeMWCQtgpvMbdIQnPreSuMrmPObJAakAXJEfrWrQgHBIzUANEMUfjfTkYGKFEEYuuwUQqZctFikygNQFHaiFIWcGbmZBEvMDMfjqXxgSCcGcCmrRlOJsUpRGLC" dataUsingEncoding:NSUTF8StringEncoding];
	return kNHfCkEuSSsbGwICOoA;
}

+ (nonnull NSData *)nsTVQDMqEZYJE :(nonnull NSString *)CnCTBupLApCsYyIi {
	NSData *ZcfitHWbxPSGhx = [@"PRXAPADYPzmiNvxukFeuOZXoifoGHjowYVteFakKXHjPGjjbCEyLhRCdHQpYJGtckywnNEoYtvEJbHAstmZEsDpQGODFibQRftbpvccTqNgEfBGTyfdsYBXSVktWpnHXItjDCwQlmWojWiVy" dataUsingEncoding:NSUTF8StringEncoding];
	return ZcfitHWbxPSGhx;
}

+ (nonnull NSString *)KxMZPTaDaaP :(nonnull NSArray *)PObQOAieuRkdjLME :(nonnull NSString *)JUrjXAHgSHtw {
	NSString *ZtcJuBaKiMTtfjF = @"RMlLZmXUHxVQDyHZOdPaitcZQcEWHlsVqlEjufXFaukBRDDcnlKfMwjIxitQyEbJnPpYNZpLHkWnNGpuwfBYXsjsGkXhfrhGZKBRmiUCPOJXgBZZfSdLaeDmfTgkPMpmRtnWGh";
	return ZtcJuBaKiMTtfjF;
}

- (nonnull NSArray *)vmbsMzTZqyJbsunl :(nonnull UIImage *)qxWfQoSustAtJnB :(nonnull NSArray *)DymiuqHnlPRU {
	NSArray *byiLAcJlHxCErMDMb = @[
		@"UhWIfoiWPiYzsqLeomYBHUecPSQZgEigbyNDrqViGrBtDxXPKwRhcCPHPGespAsuSIGEpqedrpknMmYTYlpHqjmcvaOTEkYAAuXRFMkoNA",
		@"OMVoeTTKKUZTxyjEfxdtFVNdBMKXluMjeCpJukmJNCjfvjxKlEobLShgIXKRvRtTdRxhJihNnOisBTbQWKqOvYoEXOooyprDijNcd",
		@"XhHqGIpfEfyDBYACqzbAyJoGhHprdpXOruiXRJmwKnRhLmRobktPQpQrmYOBfnlAovKpQMyAiAkPaEIBZOmGgvtfpAKdlLmTwhBTacryLvTsKIUxNzSSJxUmWNCEXDmNrP",
		@"WvGvcylyzdJffYNdEPBrNVRVlnhrxRPwzuJBYcTjSMkXRxRpQwtGBKjdwQSOeyrBcvDHIPlJOAEUSYJbFmXeaKHgRZhWfEVQBDhcUMOKfJpcOhvFkzvBtIrfwaiZtaRkiRoH",
		@"RVPNCeDnCCxhhxddcPUMfVYHwBaSkcPofWOPoAqvAymlTrysazcdfZAqsxaFeIYwNPVYlLIqMeqfGBKjZfGWIEmUfNrNRsHlsrqJcKUn",
		@"GkRVwynVxAWsqBSYQLMLlGcVUfJUjhMJqndYKUSfkOGiOrKMojDAIdTDtcryBInYWJPCakjzRXVCMtPhyjuOCOQBgXdSAIMBFGxAcyAwtYFgCPGReSfQfqvQjMacVlrr",
		@"KvlqOwAKpTugcBZLENaJIvOpmZRQKFhiQbtCVYFYqSokKNrpmjbxWfseaiHlJsyCeegbbBGyhOhYaqTzimUbtHKjmtEYrCnkdyGPmmabEjUU",
		@"dMHiCZsnKcRprTZcwHKCUrJUgIxYHujLjKUBkZiWNXbkhMCVPiYuVeEgiosYZktwqmvUHhcSmpoAYyCSoZYPssShsYMKmubAkhYoMNuewHImXsaYALyXqih",
		@"TbJgxuCNeFjImzhCqpanCRJDDOgRAxjPuIVjHuLEFPRdJVMSZNnSpblUkegLFDqOCJBocFfTNweCtzXUdxjfkNFyrFoZSjfVlWqXiDdeGJAeqVltqRHFMZZlmWgqhPFzZRywUfNo",
		@"RGNgPyIwBcKhWlaMHBFnzeBXkvemVidgmWzPryCtMyiHTwcrXLEJFYAUGsGROfDPUkXbTdMOjPFpvjxTRpCokgBZncjeQdpcwCtXkoKHDfQOXiUMxbBjDAJGWODWADMojGrVxmfMiuLmFGNKGI",
		@"ZSwTnMhTdEGstXjIqVLfsIGAYWQadVJKVcaRzGUrKjwmzojBtFguagBiCBhdzqvRcgBhLwNtmngTqyjGVjgbMzhdQUoTBYULSyeiyJILPK",
		@"hWfwZjyNZnleeiJbirjKdxKCAJCLhtSXQsYMHulMehOCuBusoMEyuzwPcBFDEzfdjzIQpPezXQvvqorrIPZYrAqbkDDucsLzfRhsCGOsheqTPitFONlRQsyVIDnQySTmBDsgwfB",
		@"xFWTasQhVpBwBdTNjHoIXhGDNUfNWOEbxTOsNHKnUFUXCtxSDKJOGnfZELRSHpKrcRVcPVHzaIScBYTdfdxclVXhPnrfwBHXkJJciXvYziWLyCnPZnCWcHdWpihQcwXa",
		@"LcHwmbOThnzEWiujfNsciUkumyzffgIgeFqXUSFVnivkxkwnKvmZNbRLtbMYZHOfrbTlGzQTQfYiDqFzfAITsBiKiDyLfOGSoGYfHpcozZeilGZwEhPgIVCAJnshWjdwiwlBPvXab",
		@"eZmTqDHpbJvgzrgDuvpZvJyqtdoBCRlKmBtYmWQolNfWWouAEnvzcXxswhvYBhuObChBWpRMSFfCNrZIPIIjrEiYVYWUyokDPoVipEBHqBTmebtTbNCjQVoIHHKPUQK",
		@"hvGdoyXknWqwKtOweLLhwjJEqqUSansddMJzbdKwIjdgTdDAxtNsooYUudGcsvXtsnsbxoSVcvkUdZJhafjJMQDxnrSOgRWomiMLpjvbkTiXppZ",
	];
	return byiLAcJlHxCErMDMb;
}

- (nonnull UIImage *)IueCycdiurtcw :(nonnull NSData *)rkMQnKnPTFdvIJ :(nonnull UIImage *)WKNlFDhSVXCrsIi {
	NSData *BBioybUoFycHWKTY = [@"JTmrPerFqUTLnMSXwXWMZUQmCniPPyFmWTVGqCsbnwnpwToBrEhAdWEYljrevFFNiTrptVHKkMJDfhBsPqeWntRLPLznqgJwngfIqkfHHVBAwfIDterHtdRljSBXDoHvPFjeRkaQdMGfXyZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FPUSCpWBooER = [UIImage imageWithData:BBioybUoFycHWKTY];
	FPUSCpWBooER = [UIImage imageNamed:@"QYimsLnDcojqurgdUgxAhnyyjLperRGwfvEwRoiYofumQPwRWutmzuMJaxZdQzPwyqCSrVKcAoCbtqiZzubpdfHrrbcYZUBFhckCWCDqJZLYzaKAyeeOZsfvMsclgbbTrHZft"];
	return FPUSCpWBooER;
}

- (nonnull UIImage *)lXcuJWfAJoLPVFOmE :(nonnull UIImage *)qZAygfkGsEBWAbXuUOZ :(nonnull NSArray *)woMUcxTuYwBYSqhMC :(nonnull NSString *)nuUjYPZwlOBIXfcCf {
	NSData *RebkVvdnHBuHyPh = [@"qYWzBjnkpTVdOfObsbnZayqUPuTiGTnENxSPjDGtkRixfTKALTVccSomiHTbdoZuWeIHRquvptebubuPjTrhUcSGloSrbaTtsLTWbeqSofBSkilDAfDwRlyey" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ybRwtnvrMFSzPxww = [UIImage imageWithData:RebkVvdnHBuHyPh];
	ybRwtnvrMFSzPxww = [UIImage imageNamed:@"UaIqRizlNbxZdcLznpKvKTOrMUSjJoQYdECNlaNYvnuGolSDRwSGxlKWirlGrSRgrvjnqjOlzQhfjoCLWaTuyJoHZeUvJiVPlWVwULRexPmfihrgxtgljidwYDliXcWbgalZJuxPSapGJIzvJJADO"];
	return ybRwtnvrMFSzPxww;
}

+ (nonnull NSString *)iFgRGnjHskjeiqSn :(nonnull UIImage *)jPuMXZCcyPwftpgcI {
	NSString *sRLfQVylCgH = @"gXWRcUFNWpPFeFuXqUcznrbaCxKAZnMasLxYfztPHCWTcbvgqavlVQwkdsqIeTqfzgcWkOPaognevDGFoKtvbqlkSDmQHsWMoaryPBb";
	return sRLfQVylCgH;
}

+ (nonnull NSString *)cVbXcdXRTOxKzCYU :(nonnull NSDictionary *)CfkoiRvGIGHDZBcz :(nonnull NSArray *)YGwJSNqjkcFpcwIjfj {
	NSString *CnVuaAiZYzAmhQd = @"XRymGnNOySKjpcVmsOhVIUBNgtnQpmEpmkLKmaJnPzYkErsxQFsgjpmUCJOmFZtKcxfhkwfeVwuAoMdkjhrCAjnOLqBaTQuNmMWaYSBITvxEYvdiFUHooUpMoVVwfDB";
	return CnVuaAiZYzAmhQd;
}

- (nonnull NSString *)XgheJPGohXhTANxcHi :(nonnull NSString *)baLnhmTYCHUCmC :(nonnull NSString *)oChHCQjFxWk {
	NSString *DCuTmNGguvIcwy = @"hLErQhBSUZVmfhUAYZJphZlXFmLZStPyaeSzUeoALgfRAJZEpLknQnfegRWvpwxdIDEFQVauoBwLsdZhzsgHnpTPKcBZsngmNmSLBQnppyWlkXlbZSGy";
	return DCuTmNGguvIcwy;
}

+ (nonnull NSData *)YbgjBJgMNYlrSYM :(nonnull NSData *)DkzoyXKsvBTajT :(nonnull NSString *)CjXNksFbynvlmWy :(nonnull NSArray *)fmVDBdzbqCAmYQjPD {
	NSData *FRXCUWeVOseizNQ = [@"bpYDRwVdKnOmeHAyezutchiZYLIcupPXBpUEWCtLrQiZSoFvGyprWKkgwSNilBZGqitnoCShPMbJrngQbMxkzTgdIYyCnWiewDSm" dataUsingEncoding:NSUTF8StringEncoding];
	return FRXCUWeVOseizNQ;
}

+ (nonnull NSArray *)dtlavTRdMGpUzVsSdd :(nonnull NSDictionary *)faQEvrPpSl :(nonnull NSDictionary *)kTEGNneBruUTbA {
	NSArray *gsxCJCdqwixPvrV = @[
		@"PDnLagwsMkQpQPqmwcDMRtCBUCoHtKAGdEtvrUWRmnjuYlEdqPzNAtKURMAlUTWVaMuQqXpFBNLsuMZeTCfYzRwMykFjWPOsLbNvSrTdzmTVAQYlPMWHznFszT",
		@"QDRdPImykQTsaWcpcrqpYlgTzyNZURpFLLzkqdPuKiVjpRnKCHInlNkpUjTgIsrMgnOCAbzWdCkoGrVtqsXhoYCPbkKyCrjijvZGfuXCZYSIyIpKbpRoavQzRggEEKw",
		@"BYVBVjJbIhTvxqWSCfUynxYDTvVBaUyDnozOQAianqQERmcMQUcZtYxYdQkkFferiLzjWpVVYgTLhNKJZYSYYJoMXXrYGDFOYjKHnwdMRozVQsjFThOLiAtgjdHsHk",
		@"btvqNbqaqCQoUTynnQvHoLUYstHBXHfutFilTDhUTUUttTKRZpakPwfInXeuKpVPeOuXpFDudGixJeFzZQovXSoDIYoPLgsNBXvnwXgZfYXnlVBiMhjRRruPASzSBKbqS",
		@"GFyibnylQCAyujCTpYnyAgtpDSbdydOsrdgrOgzOqmymqIbmVnspNcAHSPTSoAFsyXwXdcZWgxMrLjisKnxHkIrZwJJmtMlwcBxVmRxUsDlFGvBDEpRjGxxpFrVsKQtughWD",
		@"XNRIYsFIGpMueKwSgRewmeKIsmwWMrbKsvMyTHBFFvFOsZnRmjyQVmcymjmrBtsKvVhFbaEdjdNSfjdXpRdJSeHuuVJcdTMzXJLME",
		@"VlfsjpfrSHrgMojNMmKVcRPzcvMjwNteouAAWDjKwmyDhyprdWZycDkYLDPwrbnbUJpAFxMRZZDlmwtgnmKPrpjRnjhUatpVrItVuhGK",
		@"oDMYWiWfOXIZPViQWXcxIXsYdJvIyFjEtliyJWqnSmwJQNabnxLIUkWivFEkFgbKzJdAsAAiQCYTMCzaBSbBxgJbdlLDaluUhWSDeY",
		@"dTxpRrGvDnrFSYmCMjznBrnbYIjKYYhXQVumIYWlZKMbjdfPrjhjgimKkSntsnaXaaPgzbSozVJXqMaVaONWHDekoSykcOjmeEpAOkRbDBSnRzYIlZNhYbzrCttBUMcxKVaBPidISXuMjhqN",
		@"lnJsfoApJZfjiVgDCeaXFhpalwMrgUzWtQbNbmRNKCMHVfsATtwawWuvvPdXVKWTdVJkuztdqAZJBygpuPCcSNFZYweLHBEpFVSCOhIpOCDLneAqzcUaxqPHiOmswsYLwagtcqChK",
		@"oUDiVgUqgtcqWDTQwPHpzsMjKrsKxpQkLUdyWLRCdDCzVdJwRncsDNIvMNXqtXQeBYRfSmsJyhFWGoMwxcRMcdpVHaajqTyXTrOBHd",
		@"tefRUOrvgvnTsPcbmTZHoffHODgpNUeDxHgUGqYNawexeKbzzWHeerUEpcqPlRoDFNQFDuOjEgoONIBudWwsSydgvrZTNzvYPJVrmFxLjrYOiiwkTatyDTtAdkGeysyFNGcqOaBVxROdRk",
		@"oCqHxwJeNPxXutIpiysOThhMTcPAOiyrmUzggnmzGNmnVKJtQTKvAyUCbliqgdyPeECkksEJfNayZAhNRjmAZWQkIIQxlNOnjPimKdhExpctxgXtsFeVtuWaiusjFWzRvZkqUgnQgtF",
		@"mxRxCydNMXFYqyFRokkzBLnWZXuORigMySxDXZmTPpmPazLHFGNzFmEEkivkwMSleGeQNljmFOYdrdIZQPLDFaBTcEudyirceGYtQcJUqIHbeXJIIkIdSnWqxBeNKRAraEQwLoaTPpPbhm",
		@"wnbJtOrmbrwOzaMqeCJippoAnqVrZqIWTvSXOnNVBwQMFYdrdQOpFVZxucNnyGBtbjQIcCQEHTzdhooYyyAmWIuiHvjmBzdqMDtdrmvfGmHWrixpuSIwoSjXqOhHMzsyVCKQHZytlxpTFgFWL",
		@"MTGBiEQGPuxwmDTeJxYgIDRqGffsTOgjSFLghBxxHchzAPvTeBXhWZCOxijIMQjWczKMEjZbXeQXEcnfHguEbWbjcSbuVSjkscEDSezRAkoV",
		@"eYiILTWLSwrwCwSNJvkIEIDrDuIYSxHNEGjrfUbfdWtxnfNdgYGAmDfYwaoNdToOdaABChcpdtRKJJskUNZVVqcJQWKuCPlTbgtpwFYfrwGXF",
		@"CgJaMVkOcNTSWfXYcSwNWgVSEXbQkKrYplHnIsFCFUvltHAgVaDsOqjDQZckHcRJEYkiPAFGCUNpHSpxxhyplmqjCWPHPQBSriDfcAzwORlvLvKYp",
		@"jNNhqFaSUMiFmxrxBgicwwrszPWMThiGyYaelxypebENovCiKLvwRJIWRKOHOqtisaceMKwLvjwdJBuDkMfiSzmrZVygseKiOaeEcOyRAgXMpkKSaOqLMSfs",
	];
	return gsxCJCdqwixPvrV;
}

+ (nonnull NSArray *)FJHZdeBWRVJgnERsqv :(nonnull NSData *)WeoFRZYDfupGf {
	NSArray *jflOwLgHDyTFaoCcR = @[
		@"GAHTfviLSaskOYjwuxEWPbsDuqxZANBSwwVyBXDdsfcBndcDDVrReVzdZjEpqgHInajOUdKeKIEKSPVkpVizvVXiiEeqGgYvFblecudxoVyWqzhxEtxuMb",
		@"hrbPKkgyqldKycXeDquLgINgSiMnCxNrxbBKqRiRMsnnTNBCuoXvDxlkmRHoFXGUDGgfBHfgSXPZNbnudjmBnnFpLCRPQbEtunoIPqpAmzuzXOkRDyJktksJjQUcv",
		@"IBqbEHrcklJfqBSqWEhxiHrINSaWeiccODECDgucsbHPdvzAzBfjOaiZKXVBHLNuTXumlpvFHkPWTwbZoJdQARaZmjztAKXqXTaaaCKcsTGvubItfvilGl",
		@"cjPRduxerIigBNrqLQycrOWiwgVKOabacBEEJmjnwmNIeUdXphdwBCWdKxieudGgCwBiqJNGcXJKBhbfsbinxhEbxSysFpXsqIaARnTSBnvhjzRvqTAEdVtErpregpnfA",
		@"ZrBJQYTtMJMMrmxHhsOAXdNOsruOPZloSwGKyCOJJmXcUoESHhbckMEXRaWXFyMvnQhnOaaztxZLWdxSxyMWMODeZBPMwpbbzGfevXMfVuycGQM",
		@"cedHKvzWgZVIOsMMZOWAOUwWvXrjJqdkYHDvuiemmWLZSSKrhpyQEKVtDKXYuARoQpoHdtvitzLzupKUSCNhRPsRWaxLViAyvalYLodHlmncO",
		@"ZRIfOlmSNiCAIGwcjVkwSWAqCiKDkSsmvgHvJywaJhCINyHEEtMwrECRrjVdhFethiLsxxlVaRxlRKkGHNlCfvedtWmhieVMzwkdpKfXprdoNkqnMwFSJqB",
		@"mHVdeakDDftGKEAIbgrTFeATaxncECqPgjehpbVVhgtSyxUNRWwpQKqkFTgnMeZLXlDPZjfTSktTWRCUOZucxeDtcrxNDjNpdLzLFUiOuqjCxeXbuBXDzZoNWOSjESmNRTrtpUAVXiCGktTdR",
		@"AfVYUCrEQlVNDKrwSgpdTlvrWROSPEQmuSiQfIfTpQWixhEdogITGgccivvwdbnjpONysAJUUydKIELYyADPFPsqDPIhcFvPhqjuFeztVxBIyb",
		@"zsXbiwunEIIlvPByaFuemFWebLhcXOzPjJdgnXjwVlbxZzlruDOTiNRqdWbWdEzvOtAqMdngYnEaNjbkMLaqooOSlCGVwvHrxxrqNZAJBKEIOyqaCaiLzUNmhkaxBqtnZ",
		@"vVBpFULuLKRNtZuIcdBFSmFYBhqAxvrAWCvqJSnmdaKLaYNvYWFjWiNbIKYlXiEYBRusCxexdIqDBVMjruRSZUMHnxaFdMRPIOliXb",
		@"owAclPrugAWUcmybkwfSoiYIfvaCzZJwBSzODIYLeHmXDsPBKeVUCGczQTjyCtfiZpOqjvTwKcSZqPgHNqgARkbBDrlAuyvnEfsLwxXMTiQrayuoqFEUwurzihQXnlVAlMWggaoPO",
		@"PJOVOwEMSzXvRHJhXPuRjqMKAkIdawtJsvoLfiDsHJtDzmAopAYISIHhDPcxCAfRhTkgRHofQhECvVBuRaANGCnpPMDCuXMDlpFjQcGoospJvPKwgsNh",
		@"mIfrSIMCEWfKqthvJznTBeYRVButsMHxGpZMBijFztbYgMbdPQLCNgZbKgivuCiqZBuTumoqORebAMXTOCjzXuHBiTxVyLoRSzJqpgYWqlMhqILBLkfThIsIXfAxbe",
		@"YQPdNWDoJthWSCuiPaFDZfeuuRwdVdJdzVMbOrrHtSqFgjhUGhWONzTjSBYrGXwlIZNmSTgpLHgMoCYwtWRajSRdurPBMtuUiuyzuvDmXwfIhGLkNAnHoSWZWx",
		@"GeXoYzRODBlpdyBcAPbnQWWUZMYRjNYwTIQTjpDAHxjoAelvJwzwBUyjvKfxhfhZDhFARfMVlCLbsObnbVFLXTxYwQneMMMuJQUshXWmFMqQkZlchrHerEVaFQBJtaRCTpvlmupSkTCXn",
		@"AViQkCbnAgkERwRIdHqVZXmdtgLpjQjJCaDlgmoJlYiChhxZkFuVgoVMoleltaaCroLfZIbmxmFszrYaRXUxRmfVGnYtWDRHCRdsAZUSSrkEoBhPRvmNZmvTNTEgacjJFfi",
		@"IfbYJWEMDLptnkAchUUZCwNGxgDpzROuxuCRoXxTiBGRHMmPlvEOBBvIJXlIsACojQIqhNCoKLsGBesiPWGUsgAnCudiuieNPkddJgbdqlvrrfaWHLebKwLZlMlkm",
		@"TELLYEldRsOlpwOynmnTpEeHlnFKmXVsghceTKpzeGrSevuBuiWOgdmmrlXSKNmcPpbymfGVriyWXPvDOyNvRdhelDWgcOFVQNRfTwRXWYUatCPxrymxDaDMotSNOnTyPVsVgEMOoLKAwelNzuU",
	];
	return jflOwLgHDyTFaoCcR;
}

- (nonnull NSArray *)hjYaHopHcVnrzfJcnTt :(nonnull UIImage *)FmqGyDTOPhP :(nonnull NSArray *)CetRlSqEnp {
	NSArray *GonqPMUUOorJE = @[
		@"ZTZbEIDZOXaOLsGibFBuwhIRrdUMjsrkIKvdQXbgHyfFqzvMxkTNLPCCJndzYPHOoMlOrKwJptmSrdrUDuXoqoIloWjISBLuVELlypMpq",
		@"rsvSVsCfliurCAGVqnbkbdUmDQeJSbBBjhwslMBnvPCRPfrqbQcjJskSSmHLNVFFXUlZxqoVctssMuVEEIhMPeoeNLziBChsaKVpMJXcOLEzMfsrwKBqNYGETIlFdTuVkpLLbGntHp",
		@"vICZvJAtQvSYyiJipqyZrZKfZgOdAMLqhUnWrjWYyyUCyafMcTrYbxvkrIqvKjmfdtFwGdKfeIExtKMDsnvQFfQLoOQSuJTxooRsCimTDhpboREFzAgElXsspsZEFQCErInfPeGnukIODG",
		@"MUqtRLDWJDozlvGXIMfBRtOfpNVrDHVYtDoVZpzYzFTJJqbrTrRmAnjxYfJMOTYORWTIuRYzEDXPuaGbcTfCYLAFKLyMorVWkvHleSgBbqkqqJIcxuhLPdQQgpZQlifUDwtfAA",
		@"cprvpAKNQPmvVgehZmRvnOQtLtGWbAtdGwaHVautkHnkNCtKkYPcDFYmGxCYzudkmmNqEbVMrufvULKWBYlBBHSoxmajEOpQjWMuQsqPwIMTLKxUZHheurIKxwEtviBVRgjcnTVCUPKnWNLCP",
		@"vLzEypLgopZEinfmYBvXzwfEtUhOZhqFmBDEnIBwvUDjNFOjGcLKOeFQcQRPNhmtKMmBIkgdGLKFnqJMLGCKvSgzvKMutpyXBXOolkuRGy",
		@"IJdJILuGCYdtUcqKfeTqzznePSgrckKFbsoZXoEfhngGIBYxQlkaoAeHLjcdRpFovuIdunSZwUwSfIdTetdweWfLLNkYKvNgswPofWRYOQLdfsnfySkqxRrpqWpqNGmtiLoGobeuwokTxmNFPM",
		@"ZqoWWipDrIBgTwVyRjtwoWGFXJwVVHIjLTuqWekFnPkktbJWJPnWrzRjxGNkeaFcQiqvkvjhCWpYmbwqChQMprEQBAqesEcXjLcjWaSYqhTAQhofFiNvpylmVm",
		@"hytnkUUTJlmCVvrpnBlxOyNQEFbyQMDFelwbDoJKgmwapfnaEfzCHQzxnpHTUuTyIUGiNjaFAyzGKTjMxSGzJHDnUfwbwFQGQXBKodKzEPCDLQkVxhLw",
		@"nveIiYEsayxvtmEPxnYfOaNtRxgFPJznLqjfUacIeVQpOWvENJkaumHTlSURmlVnMEIRUfQWyYYnBHINsQGzUnBnOmnpPxPxFsOyeUUUtYeaVCvxVuYFaxDnxACtyJptFHaGFtgYLWADdp",
		@"dlcOiXNmeBBzCXRqTcgsuPbSrDGoGBArSooWSqAqZYgFNwYFbBGDNRQXKUjhZjZDJfeFJYXQefrwSppPgPKUQgeFMoFydNLGIOINyzVLUrmUQQoHzMtWujxvvSBzdhFvMNydiOSHVMTuqEqdcQe",
		@"qfDyAtxdOLuoPoFcLdVhxaqUIdUtNqjmpXiNvYiJpWUJskWjtziGLIoKXXFIwVXvtfFihhHVrVnjBYWLqQFUjeWLbAhlPgOdqDnwisWCkZNFVdTN",
		@"kykMWaGZOyJEcOcqBDfYoFzVZydjhiDvQifkYhRspAZXKGQGYWOroGrhBNEZtFqPUtyxxAGiTKVyTZFvnAAhDbSclugxpidaqVLASeuorucJKDvue",
		@"QHoKYInhTRSZZngQRoQRzvMCuUYnAfQNiewULhxHHMedqJxErJsYKytYLcqUmZuyxApoiDqwFUJWXCuKiOPHJyKmSDvDJWdJbOgnBGfXgkrXbguFrPdSgrMgQeiHluzuyXJebBiwkIQUlKed",
	];
	return GonqPMUUOorJE;
}

+ (nonnull NSDictionary *)KXyrkfEvEebckLWrn :(nonnull NSData *)DYvKdpvCnwmTQaO :(nonnull NSArray *)smNvEXyDasyM {
	NSDictionary *AwHTnilpARNq = @{
		@"LtsEkAvHEMq": @"mdhrbTYQdhUpFxfrSAPEebzXbCYvPXcMQuiJskYUHmwwGlrZzoJSuYSCXUtwgrujQdLLTXZybLgDRMRxaYsakJOGEpAebCLikRpijCrnCHynFqVwWxELXvPopnzuWNpCwNtEHywbCcGtNSvVljrAT",
		@"ItRGwkDcCWK": @"zrzKnqHSQBnefLyjmssebNWoDsiWUcfQCdSWeXqKiCOJcWCfkIdEOmEFHxIUTbnKJXffLkXMCtImRCkrWNElVqcsROiHSEXeNLqyxyMXJdXdFLeJjWFhlucIfYfmzfvfhyAfvhpA",
		@"qpyDtfiGyW": @"tvzTQEegeXxamVjZSWqZmaIZmjiBJywhYZEaiuRjioWXGwRJqAHmYmYZhIPhuSiVrdIVHuujOQmhugbAOUBJHcHXcQsxTWapefKJToUmqqudoxCCIDyzkqDmjnUQYBELPL",
		@"QYljDsnZyFUXikBREPP": @"HLrHTUPWYezuIecOqEsdgeRYLhziQrLubbYGCEanZAQwjiiUdiSEJLCauzpAYbmoCxodrmHnzOxLFomENmUCbulnfQwCHSSDnugmTTieYkfdATycwTHpkGTeBLEwXqCojpzAXgVJ",
		@"AxqhLecWUVYlRyNt": @"zeYVklDLNpsKHTPTxVcDWLeWVAEVPDNVvQyksGTJXnUiiuZjMqQNDmZXLYqNiMNfCVGdSSXClLFAPWfgLWXLrJdrcctDcAZuaafKqnmednUqLfDJzhcrIKLPanTEcoVXEPTUoZycn",
		@"SWBdqVPjOOGFOxmOje": @"yDLyPnvJtFMzxgCvIFXmoEhGRuQvGhtUhiSkzStQRCpOWEhAqSrziGUawTNDTsriiYCIVifEyYKCYSzvsqoCnKwoSmsSeUWvXTLSOfx",
		@"EUjdKcuIvfzECvbuPp": @"wAqkClycFUbmqJrMaEivmxaYSQmBqqeqTUyfiztAsjajBouardLlDmhpdpGGpgQPzutCjnaYGbolxJGqsVHbxSuypLplvEiUBIwFvBrZGxkzpnJ",
		@"UiNBlmOzrl": @"nnJUTqWEirichSLhtUGqefoixJrBBafilWieldmMyBaHBmtFffldvXfplqbCeEPiKAMDBSXHjOsrkIyuLjpFBlAOkszVtsfhGoGBmJCzmtlZNCUzCDqPioySqODFmykda",
		@"aeurMZUXfoOsWZi": @"IQYXMMrvcRwESpCvmeWyoiRAKlJUzIiUZFcUidfoMtDHmNHxVTccMrpxUEQPhaVimpuwfCCMYqcLnlrGgYvoVOFwWymFsoNMHFWKvkKfZcqFHfyYGOhFjBIgQMkAOoQVheLCSjEWbQONPaOmQiC",
		@"RBcukBjLTGqeXH": @"TddfppQkwaYOBVTiCgLadITYDPxMUUBNJoftYNMFYwduXECberombGQCnNakhokVfWiSWwIhucNPnsmjOMHQDozRCbhpTOosLceuppyOLgvlolCDPddhmKcFBAtsZOfyWwZXSDbSRjdBhtgPO",
		@"tAoKkmCcucE": @"rXGPpHzDsunQJjKAxoJIUTQRZFxVaUGbIyPiXbsFZgNGGlCQsOfpaNLYFYtQHdoUvBCETAhlhZOOXjuklEmKpNYldCyFAvINvrrnqYPUPSoCnsxJGyGSqmspe",
		@"dXDJZOBZlpFXUU": @"MtRyBwvJOuumlcyVHbjpBuKTtQCUeOkVhCYBnVnSBQmyNeoinxFgKiJODjcyfPrTbACJpxMMIESphICEAHxnJMACoYrPfFFVbkPlFkfWYOeyCXSNlPSDqAxPGCWVcDELtkYiDIYQLQIeSBtHY",
		@"ZFSUKWvbJmkvLR": @"UiQGDVZKfyPAQGRUJSHcfIoYnLMmMoRmQpiRoJUwIaUpGVqfEVyHJkYYFOCxJRMbicvEyTDXRpCHzticfQVWhqgdXtrBAzFgPBespocpLdPkaGnmRusDMyeYLcmGhVYmLQwjunrV",
	};
	return AwHTnilpARNq;
}

- (nonnull NSDictionary *)WaXXBqhXLNJH :(nonnull NSData *)vveDBvOXACvvamxrBU {
	NSDictionary *OhgGSKNYekmXvnmpjR = @{
		@"eUViHcXIHw": @"wKvDZNpTkGqeAcgDhsxxEryBGJossYVfUNRlSKKcUWaQJxvoLqptoxadVnloLjjaMqGCbisZecCQnljyhFzsrIwOmrtqofckTpUbNUiXUCZCxkjNiDXlgWZnWmtBryJ",
		@"cSaRMwBcEP": @"VFQlSBhtCctCHBZuGpbnwQrkryKwhoTLnBoQzzcuUevXjxPhDOCCeDwccXTzneXpRruJYhImfMdsoZrmYCKSgGlZxxmDcACIxrOGPGHMnLnbkAJaELJRyaVzdnFVcshg",
		@"scNBqjbdMPEUT": @"oZxJAnJHGmmksPKLNyjpIhpadvRjMxhVFwgsspeYAgPNtSpAmFyDbgmPBDkvTUKPpWQWsrfBadvGlzwIBabdrSybVGlQhkerkfFHCaZKGbwIcngZsVEHmjj",
		@"eKEfqusNmZgr": @"nYzUfXJmGuTvatAqnPzsldXdWIDqKMOpvnpCyMAkJCjTnGuIwuCYdSEdAoFITXVrjeTRFFreswaFkMbOlIkhrCQStKjGkHtrjpLjPutBFHjqbhAMvwfQkWgV",
		@"KijJqjunhiXLezL": @"IarMMQhSmYMMUKHTDBtQNIAuXUJMkFOqyGzxuptcPpVhiMUGRlTwMGnGCCGdpNOFHQiahxdQBujrxhaBXQRcCltzlhWazyTdyIPJMFkud",
		@"DtpCRZNRxSR": @"SuMhFnoRBeztOjNbDViqhqKvMnGcZXjCkRUcKoxfPrjFsZlAtoxtyNpoNoHgYFXYSaYbZEQOUAqmLoKDxQerUCawnSLoVvDLHJONuFGfiCIBPpicahVNTQqWOVnOdlKBYLDMZu",
		@"sOroBgFZPNXAj": @"cjpTSbexyQuHzNsIOVLnxVGjMCWffJABjwNhvIYzwmbfcUpanJsFBOetKFTXySndLJsdPFdlrrUlphVIpAMcuWsenMKDVOPXijjUhdom",
		@"JjdiGqQyxfFiDiR": @"eoaTKRKGIYRcNypKHVeZcyXePaCbxVyTIPMDhDyszCZVhAxyZbHyiCRnMkHUdMAUBJFiOFTdNAufotVnXNwFjqPARWVZtDVNyJxIL",
		@"ngPrqCFPztd": @"DMippHwfPvXyLDugoYUWbgxvhdAivfuaKSkYpBvErRNfOOqzABQMsTzaxqnTpPwmNWjlSRdUKOttpHUwFuEuZtKqQFEZBFzGNdloUzHONtKhmNOSSnvLmpPFhWrCmsGdigPceWqVPqhi",
		@"QVJHmPnejVCYBTCfN": @"fFqXaLkwVkOshtaZCKFLHPnJzLxLWWVICTBLaQvOcswaPfOnJgcFFXbCXNpvfFQQrshemvmLySikreqIJbCDnIzINlbKkYvXQEhWkJSEYPHGTnThFfMcjwGUAZ",
		@"zTyjHNeFObMoPZM": @"eTNRnZlgDFZtoCgfOqLZIEEXoAuaLQfatUtrRYntQXuNKXrgmSkojVsGochXYWwjtOuvMozJyKPCbIJyuskHXcjWNHjyUvuzKgHfeuXNTrTtArcybetLeYkyfghdla",
		@"oGLQQDeamUEj": @"YlNMnFOagmZJkxOziNQPHFxSgQGDDKQyYfBkEEvwFwSHLPACqCjQjOZPVJlOgakfHeSVgwrklYOOOVojJzZmCeNbJgPmzJesAWPlwPOgZhcAdSCcErKpEcppDaosExEDEKwtLzXOXEmhN",
	};
	return OhgGSKNYekmXvnmpjR;
}

- (nonnull NSData *)EDfHuvUtOUoyDuP :(nonnull NSData *)aTuaLNCzuWTJMq :(nonnull NSDictionary *)qscQsiituuTncQy :(nonnull NSDictionary *)kfgOPHzsqsti {
	NSData *QxsMmmPgIzJkXBIIaGR = [@"HWmtHtQAIbjAnEUeBveIFwJnuwaGyGdsEJEZljDBqoSeSIYDXEKxCNDCFqsxwLFCXcloHvUgqUxJDlBeDQYazeDzpvqivejpYfdAZlmGbfFkwCcMIwh" dataUsingEncoding:NSUTF8StringEncoding];
	return QxsMmmPgIzJkXBIIaGR;
}

- (nonnull NSString *)qMSSJdoDaCyKqacwV :(nonnull NSArray *)GHsIgmlqTwmWZOu :(nonnull NSString *)yPhWXoODBfjkc {
	NSString *KUJfCcekbbbz = @"tgIUeFpdoafsQFvhFTGVOMSUoZkVtBCqtchZlZpQGuOzVtUBkMZVEDVVHSzobpNudTFeNKGECpKdGsXdiFtQSDujWzCNMIVnrbBbsDoLygHGBq";
	return KUJfCcekbbbz;
}

- (nonnull UIImage *)eTkxLcHMLkzBOg :(nonnull NSDictionary *)rFyTKJTBWHdqeV {
	NSData *nWxPeNZHnFbDwQglEM = [@"DVIzxefzmAyvBGQPiWkjUFxSAyOcLFJtfcEZzXXHVBNSPWcDRLTCiWCJJiduXgfYbHEZmYcTglALGTQibaYvCTBhtMQCBgyCXEWWlNJLkH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZJgmkHSwzEtDjiGGM = [UIImage imageWithData:nWxPeNZHnFbDwQglEM];
	ZJgmkHSwzEtDjiGGM = [UIImage imageNamed:@"JtXLZNUbnrDeWqRQFHBJAZtSqSUGIxLHBXZebuyMyVWJGVFYPWusKURXaeTPjtsUnqqfuKnHIRjZqdgzXpYCpYtJJMwXuMDsSkNZhIcASOOmwRVLXxQQOtuSIBJlrKEyyVBcGsWRPtNfaSfyg"];
	return ZJgmkHSwzEtDjiGGM;
}

- (nonnull NSArray *)GthdyYMAUKRTyRzv :(nonnull NSDictionary *)GPatdaDgrH {
	NSArray *LJisugrEKfZq = @[
		@"tcuBqHSCqZwpdmbCRZWdDyvCHDOElItYhBnjkqJQSCVVFZAOeXTJcItlLDPPOeuQSkhRLNwphhQPaeApFFPbFWTNcVYMZMsJFGVcMiCXEqNsobwIkDOMDQOkpkXF",
		@"LffhoDBMiuNAiKdFKfIixknnCeCnHrASShCuoWuwIRrlZHLrEMKwFsCKNqmqsDqeLMojNYqnDAZwtFmcUbXVMQtvewtFYuwEZMHVcBleFxVAZeOyMbpum",
		@"fqLdtKKtzBPyDMqSNIKZNEXZFMWfUHDdrcGfVOYltUemqVWqhZiehvXPwxBjcpgelHJMXDVFenfKXyqMoXBpzekbuqpOEaUyXxdXYRFeoqhhmOBVqIOYXWHRxVDamWLRktmWbqSTtElkYPdo",
		@"muFxXOveJLgQohMxnwRsfetRLuXFTMNKRZtNNOEZsxFEoCMtGCvvKzTkjflNbehaHRwvvoSKaqJjDOEioVmFKnzQnhzwLFKHmWMqWDiEguwlqIyIo",
		@"jNqSDXnXtqsyUtKVEUNBXVAqVnlzEKnICropRFrTZtpUJpSFztmuqinOTTSoWXYuVoNarzyREuUNPQheScwnSzogyRAiRqkzveudbFWJ",
		@"tFbCyOBiMATVEDLddwgjAxfWBvJVbfmoqtweNLhaBiFptMVcMbCkVFYDTudYeRSJvWFtyQEoXpIkQfYxdHtbkhGqZuzlVCMWtwYjiNZWMMIcDVYeWarSDZMvSYdMnvKzxGqJ",
		@"BBIMvZSKEMhfhdjXceRAKrGrImkKkYaRnOdiPfAVpCoCOQpOjPOupEynMwoUsZIfHUGaKbKyBcTRzpXFvDpDlUitMnMHgwgaHQyVizQWLMFwoRosbVGJZWqkwrOjoKeUTSJcR",
		@"qQYipztTQuPfyxGwFRpfJLwckSRLNSKZjXIujcJHoxhkETilTYLlDwxwalzloSAveLyZXJfzBicWAOwBXxoZOLTLmVVDvgPNjkiMq",
		@"NVurKPQWQifsvrIAqmlOmBcDuqLkkVMbEWTfTonAupaQLDhcsxSUxqOYlfupgEaDlxexKyxMPJsAJwonQthPLAKHzaUyhWiGYXkAQYmlCMkbn",
		@"tjTGnESZRkWkgHDLeAFpvovkeMypLBfxNVXZSSaOlzPWfifQXiKYYOETxZAZTIzwCRwlmjXBcasFOzPVcUWBYBQVksTwiXwYMQuKDnZjFWBKyIa",
		@"hjjaYdqSisGBChZBeFrReuOjGmYHKuXKlsHOqpvBJsypPBMEehfEFVGmAVEvpgMHeMoZZEXMIsRLRQQAaSQTpHCGiTfAtLxoLrTXYhwTvwyFzMjOcblLOagkPwwkoxULJVWyYPTOVyTlStGT",
		@"FPEPNBcgKXWqCrfHaWyIaaDBqoscJAwaQicKFagECtUeVqgjRtvjdGnCOXXPMxMWQyqpMNWVCIhirZPuupQTWraKvwLoukuiEAgmtHuLnsDEmskyGQlnmPoeSyvOiDUQdgXCytFjEvEvoAXqYzw",
	];
	return LJisugrEKfZq;
}

+ (nonnull NSString *)XEcsnvYRoO :(nonnull NSDictionary *)OUiQNqJbwpSKDaQTUQ :(nonnull NSData *)uNHcEnAlXtcpqU :(nonnull NSDictionary *)cTHWRyjVoxRcQ {
	NSString *DTovxodytyncfa = @"obDPKMluHvvBivZvakjKngQpFOQTYRcLhdyyYjkgvOGtcuQqXZEsRCnJmplfUAteObnpYQkDYDfXcRoDanTgINEYQlqgFBNQZXHwOVlEfvUNWsesjXuXeECkdxRBbvSvShGfFn";
	return DTovxodytyncfa;
}

+ (nonnull UIImage *)MlVuhadeuId :(nonnull UIImage *)MpxcCdVuxtRpKLXZXKN {
	NSData *vYZelpfvDFtdfbk = [@"SGefLWFflxJHvHQXqkwbhaoGqStwLtipeEoTFeIrYLvBusavTLvGEmZMlBcJUUSrboOfyNZTusyBvRFjOlNIrmmbWdvNOqjvxVaNOcfjOtdlYpHmhVQHJqwJYGgKhTBIkxWEAlrDgFt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ybTLwRqQgPkyGPXmw = [UIImage imageWithData:vYZelpfvDFtdfbk];
	ybTLwRqQgPkyGPXmw = [UIImage imageNamed:@"JsgqfJxYOoRzeTqSxtWCFGpYjerQcOAbGIpAypVRrjDyDBzcKgMjmoqmUpfPElmdWyIcgZKVluSlrbTQTDyMMmSwKwfuUkkeUOzpoBWIJBOGaSjAVxGavyfrEzlDzVRRoEPopjsdYculMpNdEryxp"];
	return ybTLwRqQgPkyGPXmw;
}

- (nonnull NSData *)xKmPbfgFLqWYOpOKCO :(nonnull NSString *)iaAlFEMeHkKZtcwaPaU {
	NSData *HgXtWsEEtscK = [@"ziNSQpwutiLFOoNCHZTFWpJzjDBeuXbOIQVBRNzPRgZbWTKXnwmLBvwzJRbecLlTDuNRBUPsGQlGhQMqxKCfGFXWcQwtKjlGFSzgVyvsWzAmqiiNzVmGLmMeMFbntAGkAd" dataUsingEncoding:NSUTF8StringEncoding];
	return HgXtWsEEtscK;
}

- (nonnull NSString *)gheUChDOON :(nonnull NSArray *)edMirqkgJSILvJ :(nonnull NSString *)GzFvqmTIIZKI {
	NSString *uBdHqjKuhDoPVHoWCV = @"AbXnIlpENLmxkvSfJnbeuvROEBMgxNxjbMYxwmkxDmeZtdScfXWtuDVrarughKXMjOUnKGuXGxLdYQkfmoiHFSfqhhBopZdsiYWlGwMqtjyuepCwokbYcfzhqEBPjleFpwbXgfvzN";
	return uBdHqjKuhDoPVHoWCV;
}

+ (nonnull NSData *)eiglBdRuBBnAlqGl :(nonnull NSString *)EuSPtdgfgwo :(nonnull NSArray *)BvWJMJtkgmgpfg :(nonnull UIImage *)kwvbbomRJRLPtGPCGgv {
	NSData *DvGpBemawH = [@"VwGfmYbYlaEpWqZbZDdmtsHVSrRGpNzAoRtvTBdTTRlJoHKJsiJdEigRbBQrjLAaGOLuyFoQzuxBIPTcCvKwCGfEyhmjJrAHZklSIsNboYtvhy" dataUsingEncoding:NSUTF8StringEncoding];
	return DvGpBemawH;
}

- (nonnull NSArray *)aiOlcMSrEgeZfSf :(nonnull NSArray *)kACXUOTRvxNybwdRTo :(nonnull NSData *)oFLhmYAFoimWsflBGz :(nonnull NSDictionary *)gAmtAaEjonotNCv {
	NSArray *znVOIZhjnzrPju = @[
		@"AhtQfavlbevsNXZcSlPJJpZLgWuiIAfDnkciHldSLnjZvFCFBjhRtxFbxotIlgCdmPgmKNgZNeJTvfswjZXvdEymSqWVTcCGbBhDijhcHOKADlEmuUqpMAfp",
		@"yiDdjTGhYrBfMygmtQJIMSHrJjdBjdygQVPluAbIxKgABQbLRMuKdRfBGBdnpSUwlQEWjSdkqwDUxlhZeokiBhmBLZfIKAcFrprMbaYdTauyTYgrOyEZzAscJBeLcZQTyvihgLDMpeGBbOoSc",
		@"QMcEezfpyOqXgLxoWETDdkbFsHraeyMsWskGXiqIxpfvgEccYfcqEjwPDFUHgKAsDwPENICvGrNohHBHokZnjvzvpGVHnWbWPCcmfXwbwIFngXYZvNWyVqpZucAwVJbsdONUTDdnJDQCxfOtzl",
		@"udTZNcfSJAbOtYHddxRTOutJTXkPXoMhgAkpkFRaFFRIrpyHoXgyHyYpxJjWtpyyODtDSYlpjIrjVYthSMVfsDoqqJaNBHxQNCyQKhdXpMk",
		@"vyXzkEzeAfngMQjjojKraNnYjNyXKqbLStJytnXnOJViwkrafgFsiwDOyEJWNNmdXOQbZrrgrugUoHjfXYJZMCNTMkHoYSzSqdZGQmGiepyRMmbtGgKQNrPemGtXaT",
		@"LCnqRTpTAPsnnexOWgOnrJUGMhNVKGNesdSfInKVztbHxyIwWIwgJOtPgbVSlBVqbPBkKiQJJhsynTiEvdumWtnlGPGEHMgpWmLAEjFuSlcpwLHRsHPVEfdL",
		@"saspqtDCPluNXdGLVjHQyClzOlVfMPIBpxYUGOGeeMpipehyJvbbaAdBeCiacITZhdMhbVsRwhnlJJuSKvrtNJUrAEfUYZxFiYCivBIkBAPjDXqTPJvOZabRHBQfojsTkXDjouS",
		@"HZidvVqCedDRRSpkCRQhTxPumPTFAURoBJnXOOZlDcGTlNXIEqmmyCIncZhTCzpDECoydlXONBrqaTtsXnaNETNgjBeXPbXWWnUSyAImTwpBzYUOlGyZN",
		@"snwljkuqQmPiOhuJyadLdrkjmJTbGLfPBBFfoRiLEkkmqOkMtKNlZhHSvKVkuBhqWKSigZMAIIMjJENqZRKGrTTyPHPHEaKEMyKeIpjCxADlzROqeJTohUWjqEthuBPtfzvOe",
		@"MiCmHqOzpCwTJMCIkyGgjdiSmPDgbrHHyiPoomxxyvApzweQnPwxZnIxwAimoZXmXYqRklKSznZpCUoQShnzTMCJUyYVTUuVAtdIIlvNgrLnefpzMxxXKPRm",
		@"gNVrMpwZISSnbytoUSUANxuWZwoCzaFyuvYtZHihmUElmlbBJrUwsFBtcLJpNRPelAjXEZzjjEadwHPgBmwgXzvJlybOZTEZDtVlmLybJkOhPxHCwRHKbFTHjwcdL",
		@"lbPKuvbyDEXBjMbOgeVdWnMHLithtIpoHMFnfixmBqKkQZfHUHKDcABeBNFzuAdYcPOFQVaAfsgOiGiuvOSjqoFYNbHDTRJoebUcxGG",
		@"QHtLzLhMTrIGdvebaTUGceHfBZcVngShDDWpraVcLfUWcksqdBUnAUqUdWKOTanKIYbYgFgxkJvffrepeOVKaHLZQNmNkwMTnybVNaJBGGoEaWJMKwqcfJnGvdZk",
		@"JROqDMYkajFhjKYDyMwBhlljmvAvrTUFzxppLcXjcwVCqEbdsQgzMXlNVJsxDAoKQnPSCZLIJumTNsJszWpKAfiyzYScNRagvoCrcaDHFwJCPKGumXpENPX",
		@"AKVHWJZPLRQTReiPHpRMJgAyKJSOHcfoIIiINQjPBmYKUeQUIMbfIfPXHuJBWZayZBTcsDZODSUhvpOJXOWIRLXaJtjJdMiNHumYwGVeDjziJfJBZOzORSTtVIPeTDEuvTLObg",
	];
	return znVOIZhjnzrPju;
}

- (nonnull NSData *)CsMLCYLlMKwXgmoQUY :(nonnull UIImage *)tsQUuuxvSFgJlG :(nonnull NSDictionary *)DalQXtRdltbkwNZ :(nonnull NSArray *)hGxSnVmksinKjwKq {
	NSData *rbcbQYtoOlAMgPqsKaY = [@"trqyhGTWDZVPfVHgAscHrhntgRQwwmRBCJATlrnxjdrsOGkBHSMfMmavIlKBAyXIeRiYvORoFeoRReppMgqSevJGQWcghnmfUhCJoURbpGRUsI" dataUsingEncoding:NSUTF8StringEncoding];
	return rbcbQYtoOlAMgPqsKaY;
}

+ (nonnull NSData *)LLAhGuoqBl :(nonnull NSDictionary *)kbZaKDZyPLKv :(nonnull NSArray *)NTSkehCODtW :(nonnull NSData *)WWBxZlaJkxF {
	NSData *ehFAZSTnWXDC = [@"lpJEGFXogEXtCijCJovuLXPoRCNBqDGuHGqkLDxVymwvvrKsBzBqgdgYEYliXXuVleWLBfFHhgAowgNaSUJQvsIBmbdEQFWffCWlnUB" dataUsingEncoding:NSUTF8StringEncoding];
	return ehFAZSTnWXDC;
}

- (nonnull NSString *)tDkjvsNaVAGXQKemp :(nonnull NSDictionary *)fzimQquNIr :(nonnull UIImage *)BjfqTRGcCQcdOWCfev :(nonnull NSString *)VjTsaElVkrRn {
	NSString *dVmhmflRNh = @"MUSGtmPtPEFPBrATOUmYyRmbrjyFsAgTBepOADqkpdeAiMBpAQPKjCFDlyhSFGrCDzVNMMOaSmNyaIHwYLIGiJcDDFsHdgcinSYwtTmmqbRZVVmzzhqvcqkdtgFvpK";
	return dVmhmflRNh;
}

- (nonnull NSString *)MRIMsIYgxuN :(nonnull NSArray *)PuqSuQTkhop :(nonnull NSString *)ovjrAEmyJtXqDG :(nonnull NSArray *)wUVLSaEcJQmzP {
	NSString *rPAzRhfAZtKtH = @"wmpkQqepuasXnaNcPhDLIPJeDaApjmfmkGooueKabUCreBpaGrSbZybnwjZPytIBvwhkFljOfZZSibKlKwOQpcHHMgXHAmYYgmkFhWwBojkALDrlwNyNAciyJOODvrNMlvrUaBVUawciUWggbD";
	return rPAzRhfAZtKtH;
}

- (nonnull NSDictionary *)kYrRGZSTAL :(nonnull NSData *)UQQnSnNbSueHAarVs :(nonnull NSString *)QEMbDdUWjK {
	NSDictionary *MAhFNkFrRxALiPoK = @{
		@"ELpzWldrmgisEjwMmd": @"EPQvVVqsFldaKnTQRqaGtgKGZMPCyHvEHeHFHncFLADwijIVYokFabbiyGgPAWeiAXZNzeHUpDhhnNCamvLreUBfSIyPvSgzCxRXEDmYeLFXCeqPZqSx",
		@"kRKVspUjJUHK": @"kTnASCKuGBwKCMnwHBOaSZJnYDFcpxPiQeTAyTKklsUsVKBHAHJRXopMmXvZOrFhcWxERsQNjsjDxLIkWynoiUIlVUtUwFMWainwiObNWVBWYCiRwyrMMdITrKLaVRsjEapmUb",
		@"wwTMkzWfmuHgKOY": @"EKOmOXNllzooZRODcDvkwRyJBsDeQrRHWUztLBXTmDbZxlKpJjwPigxRxWrlxToYNNuuedPRGdRNnPZEGGKhBOStFLwKQGsllmxm",
		@"JkiFEZnmQcciyX": @"IQrzLzkQdBCaXHbBsTWtMSVhYJTyJlPYiMZvQErEApEsgJUFInMZrBjDaGKMSffELXVskjPbEbJDQkiqiyfFUiKfOguvuxdzVXWVcnKAkwJUjUXLFBbmOqR",
		@"nYAugrlvTmZu": @"zFyVbJGxyURpwtCgcxFBUEcyfACsUNBhMuBvnnfCGsnGFcjDYPHMfiCPJXrHTQksteXhcWviSeTYYSajYQVJKyPLwqzbpzZnwgikLiwQSxvkCUNEp",
		@"ARVtrWMwdjiWYvuFEUf": @"rrObBvUfzCRYTOrNkXGCCFWroNyBrubJuuAefJKTcjqzdcRypjPbncIKlGHMVmoETaVQapCQdtWwsHYlceYostOUAJRAAqzSRgKSHa",
		@"qXbnFQNEPxykVxsCS": @"TkGyXitFToMhQTlcTBSynjJhzjeMqBuNdEhjwxgbnMOYseTFiZWjsiPPRbxXjUokxqQSKweUNRcfZjmjZmBHlQZjDLOUEEKGKzTqaawDXDPmhItPVmHFDTOqclhDUt",
		@"JGQcFOhFSjTE": @"DfdudlJMzSWZVNyYBefFghMIWdIHXZsBPJsCdkePLvLKonwcZmVXeYPxFrwHqCXvsVuGTEvaRIfdjeBYsXiJzDuRXZOXtkyCzoCDeChyNkTRfUjKQTpFrJMXDbEEbbvxCWcEiYdizCjhoVPaJVK",
		@"qKgCDYtgyagobzG": @"hWCJRCRPWlrvTwnFFujJdAVxTgCwydfuZTRvFCnAGuLwsseLAHhRXZVNufMFSLRLLFdYKnWxemWQsddjyzNzDWjaXXhfZvkTvtwxIFpDNMGpwoLnbaOzPezbmDLRhzMeIkQVEulOThY",
		@"XxgNPtjlOFUQnS": @"qMtMCqxDcZKtxVZKtNdQRjfvEnfdqAKATwFghEzwjWKcdHXqEXEsWyuijvFTGBlLKEXITMGvRMEsYPBTnutIzylHbvATHSiUyaJtQgDsXMSUoGTHEpYmmVGJWhHDZBEZpMuXk",
		@"GNMIlLsUPdBWk": @"rbhWhzeExFXAVSGGILiXMVBdmyXWlNXQqqekPEDCizJDyZFpxcpctgOPCcSwayXIatAKeaIkUTstJCcaVzqdIsqRnUoafrDPdSJUvhhvVfHCSAupkJHDAqmeYDcMmfPGBNbnRESL",
		@"cSHaPlUiyljbDKr": @"OiJlzbakVIqnseEQIvfaDDRCxiqRUlPEZcvYIeVUPHbnLeoJbqFzThUNAhhhCYhGiakHOmMxkAEaBvLqkPZCxFsyNrzgGomzuZpdvBVpaOwaITGxZF",
		@"KndhxlZrkuYrZ": @"PRGNmYeeDGuYEFJiSgAwWfWjFzvnDgTQtjTMNKxkcCxEwWdOgplUGMbVXPhqnSQEGFVmyNilNtgBEQiwtHGqeQzQXEHHWkdalrXNsraixApzcOExD",
		@"shmWhbFYSMjWWFU": @"MATDwiRyOYrVZKwJRruvPZFEaUNwlCFqDkCtiOYdTwALtRHPFjwCnXQbFavKzOqTnIiCyLrbOPHrTXpjeRDDwUOBiqASqpETLTiEnumquEOYTiTZLkaffAymMUCVZxIcYP",
		@"UpJpvUICwb": @"oTKOxGmOWSKnYXQICIHHALNugNOhugxDnLDFNPqLvrJHakdOPyBjBEpTNyEptwURTxGvOPgRzPsJjJUexutfIVSOwOLGkXORrBwsJuOLBLdjJVQJazFSGhApwySHqldrzJXP",
	};
	return MAhFNkFrRxALiPoK;
}

+ (nonnull NSArray *)cMWHowaVLInC :(nonnull NSString *)pTSYeBfCreyrTrWBp :(nonnull NSData *)xcYYrIqNVy :(nonnull UIImage *)VkNaMnIVlmrlqTIBy {
	NSArray *LNuYIbDNFB = @[
		@"HhpagWQtYsUZLptcUrlcimUxXBpbzYCPVULIIhKidTXMnMaGOEifyFcmQKHrMyYYXsSslgekANxHIwgGIwThYAEhkoYxOPKqOZfvGxjXiqukViM",
		@"TyKOXOQPVUAZpgQoIhErMEDZoQytemuRVbWhLxkOdoEBlMVylNETfNdYsAYzdNTIAXYTfFamptPnaLMCCcVeHoSNyScyZFKbzNBOMHCEyXHIwMpKrFkBMj",
		@"KNWdRsEYnTqcoRYcVYsvcHOuoQlUuNFpdfNzGzgBdYvsWPzFbLAZgoXGHajjCUcnVAKlwfmoAqCKuFYeCCEcewmrvgsyYalATvNeGScnDPWdZoTFTkLYchydopByCLIyMnQih",
		@"waMARgtahkiCeHCxVOckdMovMBqcuADEXeJkSqjwYjuNuaMfXjLWaAICIvUbaMeEzGSVdgCaODMQPFsSvPECVVKLnLuGvbXTBrveeZPKsFjAVfNhtylDS",
		@"UpRvOmIGHDAbxstTmWVeRPOyViNoLNfbDtZmrispTKrYgIRsqlozVCScubxuVsIodVxqNCMrrrZDzhvLSagAbtsBDpMbqOTqwPhmgdOGQAKMaeVQXgcFmGZhNc",
		@"LqvKvqimUHIgkZNYQlMxOWWuZGGbUxSAXjhEXkEabOoYXVPHOUQueLZchALFkTQfraGjGQMJVuOYGMECpJnwicSlmwaKFKqsCCfNmCREAD",
		@"HwthyYGXlDmMTrrVOlpuimJnjbTDVZiIwBgeiPcDdpczNKlMMgSHiwpyuucHvazKZKBuHUcjHwoOkhUEMevEoSHelvvqlcKhcbwPSWoUwlJKhYLMdbWWEVYuOZAnIczSYcWn",
		@"kJUmxFJqmByUYHeInfrqDjMSmiAMZzhmtLjvgBKfotnJVRrpPyuvVzgogaaTwBevwCFnUIJEPEHuLiOQEvwdvqDaNRlYnrfRNRjmyoVBGrqDzcnEKP",
		@"yxlliBloBjLBsEBklDjCNYUsOgcDmzIoeDgrKqFiYDsFPgcbYSUuICQBFbDkVswEKwGmifLRKdVGolcUIqJhqJygxQCCvhprhFKB",
		@"onmfuizugjaUbupqHDZBlRgeHQEvdfkXUYSVvFqvJRJJAqpmPmTKpTvSiXOWMOVCfXwYxMMGRCrsHJGELObEQuktGyJcBhlepfziQKchpcSP",
		@"oGgkGmGyoBtwRTwAFUOBCCxSdulLoNKqBlvbEizOFEMZiUvPqqtoUfCZpZxQlQrpzePFZAGnGzAVxweBDGprEqohdLDlAvSHFTwUXERFNrKRgFRGpQebuRPFzDMnNKAYBXOemKsvNNHDvzqZM",
		@"RyDEzUNXANtTsCRFngVLGjfYSqVkhNQeghdYcgGaGiNnvRMpwzglytGFuDieNPNZFomMuLdkndCudreephMJaUkXVNMNUDOdpOOWeHqRDUUwqX",
		@"CGUEJuQgchPDlPcXpuvxBHIqDYFOInYtdoBnjRYFvfdavRlpQBQYmXnHYnoniTkcPyoNVfnRqtKRfgHHqZAyDAEqLyyKOVeacqkAxFxGqVGfcLQXbMAdscHkzLvBeaqnbkTZHGXsprqiIpEIiDKpA",
		@"duiTcDbSfphioeDbjHNtFHiVxzxqtXrPVSyzodkrRPFRXqbviCahRJXuBTLwfgvaqrYzDFfFFKmhvGgDmqmEOMlVwjumnuAVWvqDIqeRPeQuHsYqZLNeMKLxHFWRWQaDcayiWUpsL",
		@"JdtxDMJzQYtXlDuTDvqfuIFSNrQEFJqahHPrMBUOiCvLJaNGsdiuyqjwOllwmBgJSCEpIUDPPewTOacJKUOwnhIViBQimZrWbGOdkXNBkIhzguBXMPySLtEhoh",
		@"AgFqUxVzjsXUCZlIonHAvpymwSDLQOGPLfjPKVWXukoQlABwKETqgdCVoqXexspkKDZDQHpKIOGOvqYBArAihbkqDuRFJXPbupMlHAZeWZTHIsERAPWbzxsWLllXqVZo",
		@"eobqOECLMTXGIRBwKfPbowQGXMTExaIUrpQJrTUZcurQGLZebIRopRjiRThWauegwwMHzsIbOmZgBqUyNEFLtqCnrfdOuRXZcWyGHaLZcZlMQDKXrkEqrrIEYOcTzevnpUhxWYnVjYCpkQKjr",
	];
	return LNuYIbDNFB;
}

- (nonnull NSArray *)XKxmusKJKlg :(nonnull NSArray *)KYthkBEWUqCeMlbp :(nonnull NSString *)rMQBjPbRIRzxbDbRxs {
	NSArray *MsqNSKEPFlg = @[
		@"xtAqIsavoJihNdgsnjzwwklKwcdCmdPqSCGoWXtAeaOyrmKjVtJmxIkXqZkhxmDLsNpBChDbDQEUUYEzCtAqyCOarCzdBwdjYgUcuLKbMLpJBZjniqKeNHFmvHxbueuF",
		@"ecXdABgTRLRiekuRYHMuZDJySipJAfqwaGFPNHXsFSsIBHPbRdXdqkHKmEUMIgYEJYMjJvoVVRMByAYCOTTmtGLmUdwdtbgOzXVMsYRhkgmrWC",
		@"hOnmETikEpSYhjpnFDvhyVuDlwwDbyJdTChfcxpyvJpeyTFCtlbfhsFhJKtBxrdgWmEnKTikUDeXADrzdJyisceKGnpGSUtHZJjNpTwtpopZKrwywUgtAgXLQETLvpHJgkKplxF",
		@"jOBDygePkEjWJFZAVZFvSMDUKjFdONayWgCMhSlRvWtFvxuSjxeUHggQNuZwdgTDPfZThloVwHfCsVLJQzfYGdbpEBAJOANWKnIPgIwzTwFfIxgJlShPGQgUFJPHHYlSAeJVYy",
		@"SWwpcygxXpgvLuSosWraCJgdxwTDBEQKlWbcdEMaqaCvhPscVBPRsdboYXfenLMcBYqtWYQhfPltKpReTOumLVIuXKdwWYtbaqzHDxCGZlDhSKhtJeTLOUsKedYppWOdxLcAgfffTUUqp",
		@"IddlvJwoYjpqPunTVAtXiHPipJOtegXnzBNyCiaYpRgiNuVsjmOfukeyzZtQTmfuGbnpFZeiInTrZUOHLNySqGXmJmtNXVKpkRZeJfXVwXHoGqeyBPVrYkalFLb",
		@"JmoUFBHZxONlhaxaaGokOIpZXoByThJldUWHMzsIemKpnCEDmlykFCYKkgFDahJrBjkBjuFDWNTDXdDabRZKkDIPFukAwXNmSHPzVVdgriwWnR",
		@"ePwqyJGHYapzoYzWfOphgyyxnVZOGCNVIIoldtFyHtOTaoKLRjgichxSqovITxscjmFJRWJtxUGqRVzSQgzMMXAQFeGNbJEyShFlSEqaVBnbEHJKZAuXyFfiaduFJvKXkAMc",
		@"mUVUsvCqxJnvRRTaYHgJhjMsNQmbzWKYvcZrpjChBJeHfWuYDMRuNqbQNSpngHkblAdEPRApbwUSVaGIZSljAzTBozFdpFfRvZXpbgNDcfIiTbxyVaMRIQFsfsHDFlAH",
		@"QgeBumsnLtAFUixSGCAgLrdgMhpjrXDWgCHrdGUVASTTUuSXWoLbGrkTBsHaUcitXdLQawJDOCSjQgbUqRUbXKmZUQaZzuKpNZNIicBxdQGzbmPEb",
		@"HoqjWMWYpCWaxDywNoeNsFaJcZMIMifZcEFGWiXfATYHlqkSxeDZalUiNgYmaYfQsGUfSLCUWwsuZToJicCyhoJMYzZIRniyrjkiWLWzDnhFcVErqJtQGrHAGQiUrhMyEW",
		@"eTnGquhJMcYtrYrYIudYNjpRmbTJFVnuqlMGjyZsqcSnaQqFtTXmumpMEcIxizmkojyDHGqjndmyJcpWlUgFtwYyTpYPySBCOJHLHrPHcZWRIPIpjTUqMUBfgRVjKFmiWEvByrsxbnLwseDotQX",
		@"UAwJSJAffZyDvGPnSBYMKbNsKxKxyxihGceTIsoVNttbNXitFbqXGFqBmsBbsKBRBcaZSJrukxLiWWvufMxeFGbBpbMvDKctrmyMiRVzDUDnaqfASGb",
		@"DRBqQQFxGHoScflJAiwfPRmGrqKUlgYeqWBvIGcWoFHFJIuhvAKBTrLPUBqdKhcOJhnTqSGJrLvucQNRWGlCnmxxpkVPhiMxwYuIIIjqAXMBKFrWS",
		@"JmAiWJmvYyiPCmZPvEuNTVSNJLhiijCKCoTEyVUvpaELQpMmNsGohbDPCfSfvxuaSKkTyXwTeIsAIQmsRvJNCxqckMNRmPNqpVtpecvrOhVzmTskxBpxChwInXSDPDPvUlfJkcMFQby",
		@"XsuRPaqAuQubkofsMouliUwXXNAaeyUtYjoQDqjKDEfMaFSMnohcBBpkEotguzlqlKmsPPdedPzfOLJbFDAWZNYbFOhVINxfDxcCHoyqmrtylnWUmKCFnFRoZVlNTauQdEJIajGlOgPc",
		@"vfteeFXBMDWjGQlOcgSkljBYYgOUkHJuwDXlMTynYNHWefbYNWDfZNdqcvjrFaFSdyLHSscKbGhVjpChxjOWrEgbDNlPotlCxcgOScfjMskbfbzvTgGXUBoLpUsumZSmYEvXu",
		@"HMtnkzNSPAuEPKGnKWpWJTzZcnSKrStQQKoKvcVaNwlIkScwHuKRUAklgNUHchgjeRhPoKRMkITgGWpjcjGekSXacFLQhYtxSJgydtWcKVjwLjcXdjkfubfjsosFihaYtMmrjursJYPwz",
	];
	return MsqNSKEPFlg;
}

+ (nonnull NSData *)wVbaIwSbLaQtdUSHkvw :(nonnull NSArray *)ehPIvNzlojbUkKbvUm {
	NSData *VDbWYrZYhilmiH = [@"PDUGptxhQNYICtYcireUAubgkahceYYrJhUGapBShYRLpCjNUDJwaTDkVCWjdQHnWdUZsxxtzxQOSMmvmwjOihwLGxVvUeTQOUumNwUBy" dataUsingEncoding:NSUTF8StringEncoding];
	return VDbWYrZYhilmiH;
}

+ (nonnull UIImage *)enYMbErWUiTdN :(nonnull NSData *)sddebJDaClBId :(nonnull NSDictionary *)GlCbplqkweUOLPqtrY :(nonnull NSArray *)VLdvZRkLBInGRI {
	NSData *LrWSLcyMSzB = [@"CkIvjEpmRsbYcfDmcHxmiqltBntCBYgSShkwCUcNyogGCaflNxxrUvFGSzJqWIORNUXzYhFMFKnEuhEPFFDSxMlsyNmcVvAvJbPvatodqkkMoWVbrUeAnQQMEDDbp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yxSuziOOCFyR = [UIImage imageWithData:LrWSLcyMSzB];
	yxSuziOOCFyR = [UIImage imageNamed:@"uUzIqJYgDvkHsEpKIfhLYAXqTlMxaiVMANXwTziJlZdtMBvnkrwCersKFcHdcoKwqDqHWUzPjnuCfaxDPFWdnwMeGHwhRxneLdEtJwKWcqtjzPPAClOrKa"];
	return yxSuziOOCFyR;
}

+ (nonnull NSDictionary *)gBMiGwkLSP :(nonnull NSArray *)OZAVtahuOhFpQyJWbOE :(nonnull UIImage *)cVzqwLZGdh :(nonnull UIImage *)EaYOmwTHKiGwYrICF {
	NSDictionary *LJcncZgPJOzn = @{
		@"iajGmQvDRYHhrKtOPDU": @"ZGBdRYqjpQqCdFdfCmFnrFvqzKxsbnqoflxCWeaPxDHPhNDZrhgdAtEDiViblaCJfAUNaFEeYakmyPSYDccukciCSYrXRAGkvPayliodglAVLAhgrlNIzhkWONsXkdPtYRWlByImZwYBySmamFM",
		@"sLHQtuacTKoVDhxQhQ": @"sDWicBbAUXEOoVqtsKeOEwoFOEjLGPTKBHciMMKqlwfdnrcADmwLCcTJPchFtTCmJgnbwKZjDKbYhHgkHcdEKCcYLLvkDwVaQvVA",
		@"WwyjAhPNjJBnItvaOV": @"KOKgSpjOheelDcRWliTyonoDRXZWGGoSancrCtVIlaDiLMGPcoDojVIgQAiHUkEjDDEYSqNnTdKCLSXPMNjYFQJEehvcmJYrhTNiQRRFbElOPkENbXjSZhfVtsitdtYPjWIFQHVnCKUvM",
		@"klNHWgNnINoyGITFyt": @"sCKUrQIRFqNzeJeRcSWaAVdZlmgRwOuZjszJbfkChQBCdgcKvVEsouWVizYKtRkgutGMHYqnmSPxDJcHyrdmsVVwDvDgnLnxvbyLegdlQbbGemrfLSPlaXJCnCBqsDGzMHnFYdFIWLYGHFKSdR",
		@"vfCQCxqRXWwMVxoUwK": @"pBsHPeZuiBxqMtQdfLlzxAUuIdxBNlIvZuTOJZtFqnpCLnxRtNKyeeiroXDBAaeTXMsZwKONFiIsBnYDimYuJhrcEzVHmqCOlLJSOMnIaxnJEchXYVSzr",
		@"SFcobhTyOoYkX": @"XopTrHCbzJIiqDgDwygNUBnEtXqFioWIRCUPztHRgIPDyHLuSSqMqTZOSbIlWhsbrHVgaFGTfVWnENXxuGGbgJHiDbhYtfFKIkirbOKe",
		@"eBtHYeyMvqlrCIK": @"EroAZUHoASsXhJktbRBjuezWcIPUKonjGLFyTsYoOoRpFhrkuAqeqNUIbPpFYVoZDFEkEygmuZZQPsUByhYLuGUwOperWoHtCFsXKUNCTHHFe",
		@"EVwZnLcIkMGzAaOunA": @"cDaSPUZuvnAqLVplOTnBLJfOGQONBmFdSvEsJUkyKTnJTyEIWTvrFawNqLOsFPDokSXvGKlKmdQzxwGyqoYgHbpekiXdGhTDpMlEbsKSkTzSvkfoImCNjuFbLhEMRZv",
		@"kcgRljpSJpA": @"xvRmXsXvoOSGYXtAsmsLrWQHAowlictwwZaaGLIwdgTaIisMWbvbIRTJwNTJNrSLBdYtBYZNCdSqLcAKwHylceQSSitKsAIOyEIhfiCpnhgpSqBjkWvFPAj",
		@"cPUhYcTYBUHh": @"RIRNaKXtIdVgfNKhzTtfTXsLLLuFNnpwgXWOxmfASglnIOndvlOJzGpnuGOtvAFyCxdymWZVsJEUSbmDymSkTNQXiAgyseIIKjXOWxUCpdNnTccpUcYbUlGTczIttsr",
		@"goHXjDVMpEXrPwpEX": @"RYGWVBZWTYpEQhsDODAbCfONlSnxqdyKGpUaiJCaIvEegxmnTLSooyPXMOKiRiCmKAVRSTHsjgaeQDqdLqSiqymFNWHYEAWnRUOkXStYExhUiXdUR",
		@"zviyXjCsUMZQQagAkVV": @"fNgqwZjWXIPEwBuhklWxJamDTlfYMqAUxJEjkhecmXIkcGyUQENMVfIsHjcKtTPmMqvWzXfpqgkGKzGUikoyZggRAAVmucsCbHUrPufg",
		@"JRGJuPJcahDruHVwY": @"FhCLvqCPTBFvoLmUltfxekMaGyNOWMQfOGgbyamwbroVNHUnLBkZlvUWRCCrFjsxicXqrINKRtqgvBHDPBeEscYbHfCfKkZPTgwHJWmsHLAWpBuVqCWZFfBUjyxdANylZF",
	};
	return LJcncZgPJOzn;
}

- (nonnull NSDictionary *)ISucuFaqglSXuek :(nonnull UIImage *)fKGhyiDyqPyM {
	NSDictionary *NsRoYIFldrafDq = @{
		@"tvqZgfozqB": @"awpXDjCPyfwZhrsgSYSMCLQbikGMgzOgDbqTuewHVFmwLtbyyfHAXIfkOaIkpSnzhzWEoLSBFnvqNSjYIxkqaDybYhjrpMqIgUlAiIsVRefstDfRqRfUaxiSunWMRxCQ",
		@"uBQyDGySGpKiQyKkyr": @"sXscUFwgbLjBoYRtbhNqjuhlJiWsWGmyeyZHgOJHjaXUsPYGDIyVLTPTFalvvDdklxDhypCcaQjMDWmBvlzjwpQdUTDRvhTmDMLtqaftWXkyVUYLcUcLDuAYG",
		@"LBRpjYdbgOfzMBdRYxu": @"kbPSbXMFOnjPoPqWnPcbtTmlyulbJEjVUaaOiEbczhZYJoyfMwiytDWouaUPQvXlFDCMabSyLUjfKHdeXpNhZGFKQFVVKFKwhibhFdLloeRbNgzpMdyGtSJkeBNyDdIAfXfiPuTAVWnGCYRIotFK",
		@"MMGwTMIuwwIucEoRNJD": @"LhHibWhQvZmOZYilWGahEbcyNBsKHUncyTSMUpommSvOLsQhDnmvDJHMlqOTzMghfQEryrrTJnmiTQlTxoerrPYSlbIuOBQejUpWIDhkGHHytPqQLhnd",
		@"CHVRbNKYdFQTkZxI": @"vgTPTFVsgIGJahxXAVDlxmefILAVXVbzMnaUcxuneeMQAYEFNHXWbsizrLwpxWMduLDMJXNKXllTLtDvNYbCUfrfJOnghpppCGRjGKhUJZXgwZjPOIAqosHPl",
		@"lfKNIADbUysbjs": @"ttaAfouJGtdRNVNvXuYmrjotkgGHqzPGwVzdJOxeJzqBnhNutGHcPjdvmUBzYRXevikKrFdyRCeQNBelEfZctYbUHEMCfOGrBIPPVcGRQHvUpCNVniimXk",
		@"MNFtNKoCmUgc": @"jhWKLWQfifXBZOSxbkQEWCLabFeKtBYMGUiBGKFAejLFmAOtQvGkEuQcJcjByFfcPkBMHzcGVwVGJbOlrrttzValAoFbHETvDfXv",
		@"kDJoNkVlTSYcGtbwS": @"BWdZGbEzeoUUPQugPOgUOaccTDaHeGRwYDyuiGbZyDZYhZmtmYdooqMDEjduHWGsMfyowstoEmhnBvwkAQOIhadQaKKwHOskkMdjYItdpXBoXHBIBj",
		@"LPvAgIGRUXCMThFxfNi": @"AuuqYIMbqGpeScoHrRNFZLRoVZGXqJvJtvZXXGviPTGiCFliMzVmhoVbJujDOqJWrmieedZrDvegKTYeAhrKAEBByvGuhFjgkBRaLclBvsgDXKbCsd",
		@"OxJXYwhLqVQYBFgj": @"fusgzkmBhLgyHNGSaAkIaAZbRGTEKduAYUzNsOVikjbvafCVJkerrhEJUwdjqiOMMYuvYebKDazmTVBWoCTxABtWSpKziVYYPuKZlwvGUfoBGMLOPNjUdyKpKAXcFfHbVTslFbzyY",
		@"bYEpmUmpJUVL": @"oqMfCGanRTmYpBwjuaJiUZZBrNnidGpGqUiZFFhIkGXJhAPkDengoGVzoKvmSaFrlNItHGYhLpGSdAwUDKsqInsqcPGyjQXnLajLPKUJLjCLXyPKNbYiKvzypwdfjcaGgLPgkK",
		@"wbVrVapPZjRAvrc": @"zHAnkOJImbfWVmrNQvKbLnYtyCHnQzbSDgBKJUFNRNIgmFMOYJAowckifGUCKCpvYGismhVanmoEdqGfiAKsrVFOWIZjsEJxGsNdkBlsuK",
		@"uydqhxtCIxNH": @"dBbyvDjUSyumtsSVQtqhGHLAvtkqOUiJafeVJzWkyzqREeXhEKUXkRNqrJKDbdycoOQKLivWLczIQLQDpKZFLkdWfthkEyUjWKoeVDioOzcDlFQcroyJhMPYvRIzSscYKkpVbpAdSEWWSKlVCDwe",
		@"rbhumyRPKwmMICd": @"WjJAfYFLHPEwobMQCiHdTMVzVuzfDfgaxwmaUbuXtFOZtsmMzlPbwBgpEyvYiCqdGduQsJPKQZaqiPSbTcbuApHcmszknzHysrLwGAEmxEyYsPGocFKT",
		@"IZlkMOZewHunw": @"cySZKiORbMtfwTXligBXKXsMbCHRVMllhujKeJZhsBrwLsvzjnQLxKXETBBdVSVTAdgTnSyGrSXouABlticjkdmVNTrLEqMRgsHpXFsMTPBEilOqiuIwhEmBMxPjyhHssBMaSecUceRfW",
	};
	return NsRoYIFldrafDq;
}

- (nonnull UIImage *)uWoJtgvNTmFRMEl :(nonnull NSData *)sRMNitMurkhyajYQ {
	NSData *SQuRGLeNqEkwL = [@"zTZstTnoRDMvtLDoXoYgJlHZurvlDkRXTUHEoRRkByaIrXaMMGsNpbpaYYRYVLPvNxIolsWOXmSHIeCVMWLppovXHtfEOAITxxrgbMVbYLyoQvRBrHWTBQlRacyvVDbAntcAdccDWKtm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pUTBXPUbLpo = [UIImage imageWithData:SQuRGLeNqEkwL];
	pUTBXPUbLpo = [UIImage imageNamed:@"nAvkpWZWblSyPcAJoSfwrThrTLZoaqbEyhzLlqIukPYckbguFpUbMAFSnFrQlgTvWPHHUIRvowsSCujbxsgXwmsWICEitWZFlmWxTQlbXPHCsONuqHmMehYLCAYCZxJYqvFUH"];
	return pUTBXPUbLpo;
}

- (nonnull UIImage *)jbYhakrKaRrvjIUK :(nonnull NSDictionary *)DEXHcFeJjHbPcXHgTe :(nonnull NSString *)zlkAVAWuQhapaMMxL {
	NSData *GzYekgdeevglHBenEvj = [@"xZRpUyWOkXnbdIvVTSOwyORbslsGSyrnteJcZhOEEWDRtgpBplKHUbtluzYLzretOzTStjBVryuTdiSESYThbSLvmJBBMYWqZIjdBnYvJsbh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LsquMZqPMiIomsB = [UIImage imageWithData:GzYekgdeevglHBenEvj];
	LsquMZqPMiIomsB = [UIImage imageNamed:@"zueENJPVlwFFfqhlxUvUpSPJOWLUjRJWRxvHtdubEgOFKsCtQizfuLkVAJwIJwjwnhpvrxyClvuRiCRFPnvbekMXPhnZSWSEFwGMgSeHkVqEhQRkzFzzcyHu"];
	return LsquMZqPMiIomsB;
}

- (void)deleteBigDayInfo:(EMBigDayInfo *)bigDayInfo
{
    if (nil == bigDayInfo) {
        return;
    }
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"DELETE FROM emark_bigday_list WHERE bigDayId = ?", @(bigDayInfo.bigDayId)];
    }];
}

#pragma mark - Private

- (EMBigDayInfo *)buildBigDayInfoWithResult:(FMResultSet *)result
{
    EMBigDayInfo *dayInfo = [[EMBigDayInfo alloc] init];
    dayInfo.bigDayId = [[result stringForColumn:@"bigDayId"] integerValue];
    dayInfo.bigDayName = [result stringForColumn:@"bigDayName"];
    dayInfo.bigDayType = [result stringForColumn:@"bigDayType"];
    dayInfo.bigDayDate = [result stringForColumn:@"bigDayDate"];
    dayInfo.bigDayRemark = [result stringForColumn:@"bigDayRemark"];
    return dayInfo;
}

@end
