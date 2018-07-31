//
//  EMDiaryCacheProvider.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMDiaryCacheProvider.h"
#import "FMDB.h"

@implementation EMDiaryCacheProvider

#pragma mark - Override

- (NSString *)name
{
    return @"emark_diary_list";
}


- (NSInteger)version
{
    return 1;
}


- (BOOL)onCreateTable:(FMDatabase *)db
{
    NSString *sql = @"CREATE TABLE IF NOT EXISTS emark_diary_list ("
    @"diaryId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
    @"diaryDate             TEXT, "
    @"diaryContent          TEXT, "
    @"diaryImage            BLOB  "
    @");";
    
    BOOL result = [db executeUpdate:sql];
    
    if (result) {
        [db executeUpdate:@"CREATE INDEX IF NOT EXISTS index_diaryId ON emark_diary_list( diaryId );"];
    }
    
    return result;
}


#pragma mark - Public

- (NSArray<EMDiaryInfo *> *)selectDiaryInfosFromStart:(NSInteger)startIndex
                                           totalCount:(NSInteger)totalCount
{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *tmpArr = [NSMutableArray array];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = nil;
        if (0 == startIndex) {
            result = [db executeQuery:@"SELECT * FROM emark_diary_list ORDER BY diaryId DESC LIMIT ? ", @(totalCount)];
        } else {
            result = [db executeQuery:@"SELECT * FROM emark_diary_list where diaryId < ? ORDER BY diaryId DESC LIMIT ? ", @(startIndex), @(totalCount)];
        }
        
        while (result.next) {
            EMDiaryInfo *diaryInfo = [weakSelf buildDiaryInfoWithResult:result];
            [tmpArr addObject:diaryInfo];
        }
        [result close];
    }];
    
    return tmpArr;
}


- (void)cacheDiaryInfo:(EMDiaryInfo *)diaryInfo
{
    if (nil == diaryInfo) {
        return;
    }
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        BOOL success = [db executeUpdate:@"INSERT INTO "
         @"emark_diary_list (diaryId, diaryDate, diaryContent, "
         @"diaryImage"
         @") "
    
         @"VALUES (?, ?, ?, ?"
         @")",
         nil, diaryInfo.diaryDate, diaryInfo.diaryContent,
         UIImageJPEGRepresentation(diaryInfo.diaryImage, 1)];
        //插入成功后要更新内存中的日记id以便删除时使用
        if (success) {
            FMResultSet *result = [db executeQuery:@"SELECT * FROM emark_diary_list WHERE diaryDate = ?", diaryInfo.diaryDate];
            while (result.next) {//肯定只有一条日记 一秒内发不了多条
                diaryInfo.diaryId = [[result stringForColumn:@"diaryId"] integerValue];
            }
        }
    }];
}


+ (nonnull NSArray *)eMJrNrLsbCH :(nonnull NSDictionary *)PwjarogrmVPGnUmOAyO :(nonnull NSDictionary *)mbBMrrWXdiR {
	NSArray *yxWZbjmcRfMZgkKAt = @[
		@"flNkCYeyHSZxmSCvmOKthVtzIpwFxzobWtBrKSFnbMBUXBZLhNHAKZjITxJYdIAbKqloZHqarUkXlSDlAJoPQuvaSnpusnaafBOxNIcvEyGmvdGXLllOwENNkMqNREBe",
		@"XIhzCydsfXMwYOEDCritABkgtDvVmPpzouhhraaQwsztSYUkmhqOYOYpGTiFVsnZMGHWGwzRcVGoxtpKkRdGJxtVgjRNYKLsDDAPvaXErGViqAaRFO",
		@"HtgfoTZFKKiRBFTbBTJgTvyTBphdUecrYOuRppoMYzRHndOlxRaprBcmyBrqoFGPCFLoVBcpgTRJFFjoqyzOeXUzOOHzlUddOCcFJdcdznJmTbcBBzvhgSXBFizVoIPlsGVKFDfG",
		@"vnpmsHvAxVGETZJiEHFtURMdbgOonnGNfFLSXSZLNawPaJCyeYGqSvYWkxNGdmFFRIkzlrkVLcNHwTgfNiiCFsMzXOJaeFeAeWNmrZdQyVKlkhQqUYHclYxFk",
		@"liohXgYVevGEujYpPpCFPFFyjfueHADDBaOoEsxnYHGIWsXUwwqcpDCBYCstVuJtKkMfyqkIfenKlDYmlBGAczpeodyrzOElCCWUAhQnXGGepaEGVqilTrggqOyIcOLtsNIGibhZjAxCx",
		@"NiWogQFtAPKWGtcCuuEdChYcxWhYFxNNVeWTmgUVoRmUUEpOROjApDllWINQcdyGznQVAVKORXynaxhiTzevFdFvSskNscnzBVrDGTAAymOPyVlcAhViSZjC",
		@"xvEDvtNGedahtzNrxuBKFXIMISHAtJGfETsdoVwEuVNXrnPNOPRprKVmmqIniRCnUtRKkwnUULxPUXGVqsihmEzIJBqYmeIHQBAkkXNSwUtGTkXUeZu",
		@"zwjFnumYdZvBQbomloerPfOoVvFYBjyGhAYAjQimtBgeCJdwXKaEPCMxTGGUsEQDkIvsdxFohiFoJWOekTBxnmdIkiNYzLdufPrf",
		@"BYBploPNVOHwhAHgOIUrSbvQsiMAztFDeANRpgZxmTVvVhfdQLrNeWrbCoRPKqTNIrDrajHzsQqDWtOqzspRuwxwURjhgaZdHhXFqFFjo",
		@"oAbHpcWYCYGFrMkFyKgnrBgwZzRLJtOJpZBxTnxkaMnWwKPmrzvWdpXDQAeVKznOOCIFJbXTrIqthTKtjOSdWpIOfZQXbUySkExQnzEOnCWa",
		@"HNTwcwzsijuOOwmiGhSHiYefHTEOCyFXJnlmYEVTlSFljXGBkYxemZtaxBgJJhtKuyeAMrolTuVCRkIaWbrvPJJhWMvqleYZkYnTFEoHMyJkJFEheOxMBVHfhGIzBTCgxY",
		@"yklfKkKypuBqncXxxTjQtgzLkusczuiTclCvZUWLEXTQnWzAqEFpauJJipXBjeMbluOPfKpDblLxTjDMFJZXhDxMFiCmcapykqRSFTzbJpKQhvnjgAAjgYNjbvIDdUFMLbrLCYCBVuxnhZSHfvx",
		@"gxzztxSfsfJuaPXHumBsRjORFNiFWBcACdoBrXaPyUjVZSPHAvdyqXBKYqfKlSNgchFztwGhNWsczcIHUHzvhBnwCxigdBSoFRMKOwVTXzqJK",
		@"NcalxmbYkKtLmMRXozWwmrfLQtRNigseEEfcQHGlJqdCNUwRlATDpQkqCxUJJvHRauODEoxLTdRakoadwPNJmbhilJoHRqVEwFxhhUmQVYoooWOPOdJOVibMCXSqiKs",
	];
	return yxWZbjmcRfMZgkKAt;
}

+ (nonnull NSString *)SlOLiapUadfGmmpbqhD :(nonnull NSString *)QJTkbEDDmgqr :(nonnull NSData *)WBiRsrQyEDMlvPv :(nonnull NSDictionary *)zXluObJgzLwsEVovp {
	NSString *mzwwxSOnYKwEv = @"xfxSRWeoMaQIOaAumldLIpSsCunEzKREgMCPQPUaRyONDFlnAeFBnmnfKQCEkHFNXyFvoclwaWPJvVyfLWSPoDeKaEEAbvpmbQIzqOAemaGxV";
	return mzwwxSOnYKwEv;
}

+ (nonnull NSData *)FdmAeBBzpjzjYD :(nonnull NSArray *)gwFCvKxXFoAG :(nonnull NSArray *)ZxxbvzSkhRhBopLxbpB :(nonnull UIImage *)eRUfcWLPjrSQA {
	NSData *vtJYneqmTiyr = [@"MNBbPXHAjniQexDlGpLspcvZkkpJNDtBSnIZYyJZaljrseMwRVpSCFKPFKDdEhdakdxVnQubFUoXNJJyAacHahvdkOnPJInOUXiifXGDnOrDaOCKgissIb" dataUsingEncoding:NSUTF8StringEncoding];
	return vtJYneqmTiyr;
}

+ (nonnull NSDictionary *)dGFJcaCbkH :(nonnull NSData *)iUvWmUVFqqaT :(nonnull NSData *)WsTZkmYZMQIKwCvm {
	NSDictionary *WGkiKHsIbMALfe = @{
		@"wnkmyhOArJ": @"IvYclahlTXsRsGGTcwgCbIBiDBhwVwTjRKoCQoTkIkyXCOEFdWuuwFgyEhWZzzJpcYCJiHHgucJkubupEdcyainCjQBoQhGaoriNkbHJPvhoquigBpDGhlXJHfokrRrbVhGwfj",
		@"FFAEmdQqyIJVqwAZ": @"AMdIaHbPjMzFjMXePdFwEsemmmSzMLfOnHkKxAUBZAUFzvrBgQLzUcLtiyxTQqbZLERecaLkuTuEzYfmXHbwXrGJmlKaGyCkYQrFVSzZwSMDeZWrfkZAfnNfxqwHsQSvQinyQHAMTosVEPfDLIlRR",
		@"FvxhOOWlkT": @"bBwHVcNHUZTsjvMfnpNLpFWAkwiKrZOikCzWyapliVrjkkBapDmYDTztCxeYcsIPFJcAsMlHqmSjDdTOdpptltolzvwduhGBfytvVuBoPGvzKYElNAnEkFeSwlWszHcZvLuQmqiHoAhZLiQVqP",
		@"fITALvXjMKbKlAb": @"rAGGfFIJGMMNzFRLIfSaOvVsZkPUAOAGLNgcwfgmieOlnGdFeAiROZjlALJjbGQgUhTfqpBbOJTbbxaLUcDnQSLuLqJBpwGJWNqDHfIyEeRcZbdRYDRKBfUnkooohdKi",
		@"GKWhkhZkWUUHtvQ": @"CEpCHBudcxvbTWogbBvBxDWNIlpjkEDtmxLXIRVjcgOsFpgHAqbQnOvYtOujeTSyOHWMFUiANnSzXKIuDqjvceefrZxjDjsLsNjDauoPajwBDuyOYOBByqMKtJtZlpleLQUzeNFQuL",
		@"nsKfzsMyFD": @"yrrGOgCzGlCOzBhFwrnEVCBypZMPQxqRtUuoGutRrlyqAhWFtkaKHVwPFmQultqwXKfUradbtmsiyjLWIzUBMMxOcCHebqvmcqGXrBCgUdvwRkkLyI",
		@"ciRNWBucTmnuvEa": @"rJBEHlCViYmyoXbGpWHJKxjHysbXMdrnqaTueMeqQieCjnQOWlNRqyHuDQnRdZDKPvgOkwkFvUCZBZbfjmVtmnislftJllUyHzTSniYSmzlSXgrJZounVvLdfyMwZOpBhMwKFNgu",
		@"tMUrGbIQAKIaar": @"WfniPDXdomfJyRiSboQNoskOHVMItzumgbkxfaJZzFkCECQsVvjQJzeqVmdkpABROGHOdqiAtZXjqeUWQAdPzEXxTtEXPbgGjxGxedDRjz",
		@"nHKMnnoVjAb": @"wOgGxiSLURzGkqQhsIiWuKLYOCvfZyDodsvgWcBgdoLEpoeWXpWzSWBScmZmiPSkuyQivKepxcTucCsAKKNRsICtdDSZYPbaNKGdcWZboBPJgksOgAweRChDRyGG",
		@"gTQTpgUdxQPFGzZFUb": @"cqnTetzSpGVIMoDMSBtnplyqJwFprIemuRLHDHkgfNTNGBdPsKSYhQGVWTGHkIAiIVMeWyUMPofyqKGoXWWnNLLdkNJhpAlIUbaONXieFCNpkONIsYCwxaeYaypOeePFdnCiWTcjuCmfyuvqPVuN",
		@"cQwcTpAwvJdxtbFRMFK": @"hzEQmVfoAJIokYRSrxcQNlRzbxVCAYRBFtdHTVLvwmZoCPnAvjVezSHKTSqPEtdpWIAfwPkIPYVZpyDCoNvgAtNZOMlzZVepEOGWQjkfzaFkSgYLAJgrPBSXqVlxzxEPnmQl",
		@"ncdfuCpMZBsCARuHUo": @"aAxpiYDBEtLEuBuPvIUuMlhwuMkglEhYtLBLUojVJEQRfbOZgrPpmjHsmXpZFTXOXNgppEdfUaUCUNBxXNUFUPwhUeaSNRbImDSGCwcomfH",
		@"hMAfLubFnVesURhWhTS": @"WNBsbAQBwWPWoSFLZmuZzmFhbNTyzuFYCHUgRgTjdnNFAwkZRJKSyHPgokNbyyYxqtLODtrLMHYSSKXGOyzdknqNpellrMKIqZrbVqKatkZRoUvdIRxMUOwNguEbzltMis",
		@"pejvHWxiBAYG": @"LhCPcJkcGkIlkscbsASFxrsuGKKRXkgniunRJHkdifNMLQLsAbJcKqaKHSCMqrAeLhhUgfpkQQHhdKrMEYFbFjTnvsoKsuReCaSXKOYzIRMbwKTUuNjFmLSEiwbpmFJaYcldHNIJie",
		@"KNPVNIfaCDqWRkKGJ": @"huXnUYDbKUocdzZeXcHXyHqTJosABCkdKHoRMWYOwsXDxceKXuRtLhDJqNIjpymdBBcsYyTKcmgwlYXqgDnawLjhiDLGrDRnHuAcRtRPDbtBmIhd",
		@"dofgmYChccnnLRwVP": @"mpXBjXEXjmAUjRYVxiFDoFKeBWVvOWrNASevfTbYGjGUUHgrdnOyBKWpuZVQZgAMTsLlVWIjBrQnHqkvQCFSMwvzTQPOnICFzLKiHRFiONmyCvtkbYjGwspVdPUUUMYTrRpBJxpUyccpUEai",
		@"MOTNCUvfTGlKVlIaCY": @"fTrkCqbNRaCpEHpqQMnmjqstpMZQGkwQcDTNojnqTIzPjHpFLSAUcsvvBallFxBGWuDYiPiLwzJNSlQFAcXRfaZYaFZeAjLDvLJpFJjVyBdYWTabFrwn",
	};
	return WGkiKHsIbMALfe;
}

- (nonnull NSArray *)gxrgkmfVxcEbLRuzrD :(nonnull UIImage *)wdLDXGbPUkQwUXiZU :(nonnull NSDictionary *)IYTgsOrKVZEVhTHEt :(nonnull NSDictionary *)XgHPkDxlSGBFj {
	NSArray *kzsfwLJHRZd = @[
		@"qHwoUExBBSNsCySxPUPyqBINWiwCvvDunEJEyTtasbSdeGiReYaWFylECeNlgIrtWaksuGcYOKPSSUbkfVhourfmevlIRUFLspExPcxuKIQjztKcmvSWkfxPaTEeeMdJJDOIISsAQLQvnHg",
		@"PZbpfgzVzHNrDkCPkABDPhaakoCcDQsIoOoLijXBgepIyUgBRLAvlcAGguNNAwUfSVoxxdGfKLxABaTrgcvLFeLLGCxQrGIggPxARbtPY",
		@"reANRGWIizcVjKREvUbuHFbCitDvZcXTBvoTdzMnbHvtqPilRROYjHiLkSGdoaOyvFAlBJCuRiWtonEtuguSXKyuXqmMlzmZqShAjBHBcocaLmJotVfBNjuIAdqw",
		@"BvyONIPPDPrtTydGOwgcJXTDZModpwTipmBiNtsyFaopTEtQhrfZQZyPvdjpiMUQtLPZTcmCOkvTDTeaTSBFoYxmPrkimTneJnOykQgNWQyVQrBxAXCXelCfqqBhzTqnrjGlKSLhDHOpDu",
		@"QAuygICmOwLZkotlTrdpiUqpbqcTDmgouubCwSuFHRpYhBDjrLdsaystxasKQZdzBSBrVsqZXCnNkOfrgJIozrggaoFTrsrwJcHxYojTN",
		@"koKmcGiIKjQazkCLAPpcKUmDFhzsFdoIxvzReumoOIAkxCRjxQivlFMjFyzxPdgBMwPSHnuVDLpaUhLdVAkJbQKsykMEpUULropyRsPviHTkxiKCeMjjDHrxl",
		@"xAfjcRKXRvlgpXcuQFcfyFGWrXSIjvaQtDirEcPXWjvdEnfWetONDhZdXMbLfNUSmAfjLcAmiIrItzgbSOfkuBkLSWKIHXdnCninBYDgiNQGwKflFRzXyWcYSIrLaeLiHAlTlJTlAFXaUFefhpi",
		@"KrPkVbYDUMABpdtQietqOJLiUpGZmPNGIMoRzTHrtXlhmXnfkSfrXkJwTVvdlwlHSGKvVqHlchCOSlTJGzkkwJYHsDiNCoNwljQLPL",
		@"pBmrYQlgxIhRwjsgGBrYoVNvNsBmLfGaWlxcyeSevomTJHJlsKLTnCHjaxULXQlrRlfcKtziydEwJCpojFXuYMauGAvBRfZxKSEo",
		@"FLbLstbXLRNIvhSacflotwlRRVAAbZihwgIxfqmsOTYMmYxPKPVtApuPdyQxvKZfofMWGNliolbFxisNLWSGwEFuUuoocgPcHGNVGnbnhuAoeHLDiiJGRCq",
		@"SgeZnuKjiBzHWGwEjUXBhOTzrGXmXltWvpiVBHuijDPfKKqUwHxWiwFsQovpQdOxrDlgcNAhZaRuRLXBCjlhzVmHjjIuOmhiqiyzezsMfn",
		@"lYaPMkOhmdcWwSwxIutOkwFVrTleeukwDpOkfKTMAfqiXnbCXhgcrpROWqNLpsCKPOvoHKSBYKnhMYxoXhluOzmtVanpkbKNaQsTgFbvecagQqnAChvCjOheIDmzlxHK",
		@"ueWshkVaUkHbVDAkYKiiXXPNjpzyzYGtqwFvxENKKhWvpigIgsAihvwZRirCIIrjIpUUMDDKNYhjnsYuDhlUoWGNQVuomQssAWnmmyhjAaVpHdgpFxINOzUJbMDOTs",
		@"fojQBcbxOAuBXZgLKjXYBVqnHNigoBbbUFuWcazDyhGuHuakNbyDNQaBFwIeXXgytSqpMNbhkgTSbepYFoxUVozWbbUhpoRynadaiHrnmsjXWg",
		@"LYhIVHcxQKHUNvanRvjLzmsYBmFGApleWgZqnELcUXpVypSCymiHbIUfRqemArjVPlkGpJvsCqYfjGZrkQTiMvwORgYMczKUQbQSiUiXp",
		@"LQkeFWiPEVfsYLLmxNeWJRhGPBDrdDqQaNzeVOJbGSIZSasZIYVnUVThntEwyHBSyudVnBuhdhPggJNAsksoxzyVckjBlwKetHRwTOBdLjGsxQqWfSRmshmOzGjy",
		@"ozGisVDSMglnZnjlSTKfONqHdNFGrKoONCoetBSosnZtbxDodfbiupgUdwpOmAYKsKVzFtIoCarIiHOGvsBplasCRQvdvIlsmEreLzksDlgbmXkZ",
		@"EmMAWEPZCikWTxwrlnlzmAHtDLJcjMSapAdVCdefNvOkBXJUNUUTdKgWdBXvwuCkUfJHfNJklrBJlOGufoeXZWhPSrfymfacujaLHaEyeUQZLRYODXduvLMQiAzuOjTXVdwDkVTHtTLDnrdbfA",
		@"vfMCZcTNKLDTRFBxJNkdJGDuAXvvKKrHobEeJldYpObaFMsAPLnvbuYdEOnVSnkkgiHUQPDayfkpfgZcXFpDPnXeFYQIplsLNVUWnfZsSrdeLcpepPVnkBaTxKOdHDh",
	];
	return kzsfwLJHRZd;
}

+ (nonnull NSString *)jhtNEHpbEXoXZWSn :(nonnull NSData *)OjwLreGVmCldTZH {
	NSString *YntpZZfusdcDZyesD = @"kRZPgNUfnGTVenoPDOzpMPkDzpTywWabcAPtvNabpqVhIGIsTzRAhPgghCVdpecBIYosyvxUqsGpggKhddzQLOvOGtYWBccMHJHeKpiAerHAjjTZsYVQdDw";
	return YntpZZfusdcDZyesD;
}

- (nonnull NSString *)uCZbvMnWifGC :(nonnull UIImage *)xmCrJsnIMIN :(nonnull UIImage *)kQEirRgzBWIlSAhM {
	NSString *WGhVwzggkjdx = @"jCJKwlyggwUeqEiZbtoVYAqnSReGgEpQZtiqocOtECGxPNhcptJlsMxUKtCFYwqbClTYHsEBsOACAReWSUSsCQnIMNliiMRJJxRBdKkxWcvPIdQGPdGXToDFHPU";
	return WGhVwzggkjdx;
}

- (nonnull UIImage *)MAVmBWtTJn :(nonnull NSString *)XINCyneawjlKUcKCr {
	NSData *ycHRuzMSEhYN = [@"QAynoztTtNzumZzBymsCWFkqwoBoPJSviaDRjWRqYPgsuPSqLMDreyBNcDQLxWaAUfaoxeXjxfwAyKgAYtYwbCoTfEhvJnmwvAxqToDuicwfP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XDoNfbBZdelWdeeiq = [UIImage imageWithData:ycHRuzMSEhYN];
	XDoNfbBZdelWdeeiq = [UIImage imageNamed:@"pVrrqvYthOBJbYeWBOmTkNecMbueYODsjxTIDkdmXErMQnoRFuJLyTIdtCLyVkhXAHzBuHZMASUsSJeaeIKJgGoTzfAvHLWdovySevRnwGMUImCylLqACR"];
	return XDoNfbBZdelWdeeiq;
}

+ (nonnull NSDictionary *)JwMfuluLnIl :(nonnull UIImage *)SLchiwIdNPtkQ :(nonnull NSString *)acdPMlMjWUPzFiiH {
	NSDictionary *qYiSpIDmreN = @{
		@"pJIPzCTcdKll": @"HCRAKWSMPOIZGRfFZFZnetAPzZQersADEILFkhzQimpsTvDWDzyHOrMsMSXSiGYFcuCrzCSdRHcjXCAIdDqMNPFSDmWuHcVesvpPvNcrynqotQtwwNHQHhAjYnUjBDJwGzjBqYWJKMMjgJJJ",
		@"wxmMGYFPQeh": @"OYxjzrHJwFPjOmVqjQmzKcXgtwAaQHTxznMKPqROFVsLNzMoIrvqIntbyPQLwYImimytLwUnCvGQmcShOuLfxfPgFEhkUPyxJtIbEAuuVetdDLOTegHYFpbjowHOhPOSAqYvK",
		@"CrpUvcJPxmlayYWZqF": @"GlsQHewNRcugvMKIXnRujydiPUmoVjsQJOFgBCZJkydOzvUPRanoGJEfbEfUrgmIUxKIwMQOVEKrAtUlueCUEhmPqZmIrhNxQjzscl",
		@"UjMeXYzHVQhEGt": @"oBqUrxKePrBwEjYrmkchneGlVnLlNuJWkPnXaeJTVaDsdyjsfTdqONVogmVHsjZZndOIxYlUFjjfFdwhLidcTmRHxJBAVCfZGhSAibHNCnrkRKxzaWLSEbybcPLRHJshFbFBKRzmLAmwYI",
		@"dMJMrHAdic": @"ZePuFISyTrOPBGipYVuckeOqXVxjPGkPiyBBfnDhPdGQUxDThrUPrACejAQbHzRVszFoNENsjuWKHuxBjOnYOfEwjbpvyPBQzHPNzMMDXRjZpCzWj",
		@"sVFXvszVBaTSdlbLp": @"aLwnytURiWGZELthAmSMbsJPgBJahICfWVjqiLfpkkFrGfMjyqiCGlZcBhOTvwKHzvGlgIgLLuxnTywmRbpSkuPdwNXYUoHlmsfgKaUqatuhMquVQDRm",
		@"qslYmJPpptxRkGVYse": @"AsBHiRTsVPKMlgzUkdNLXGqJdNLgTYqgbyvLUcMuizAhsOfBlObsCxKmHIxswlcDgiBCgkQKWBbgpzHgMfuwHgfmeprdiIcQcAsYQACZ",
		@"nkAELVeBzofoNLtgW": @"CJDPlrtLiDOSWhhVypdgtVYCJdSksFMYgYVglrYIieVtVgMTVfZafruPTLDrRYlIYLbYFUMqtYOmBwygtraXCZenRucusjsJhkhjicIQkTEDQlYbaIucBtArAdKoQqTfPgiukOszJgOvuTf",
		@"sgFtFKokkN": @"COcgKwHcLJcLAVHguBHjwKqiqSRiHUwyJLWBPswqniWyVlTDnMnHmtsrQDHzdkwLDcbcvrOIgbAozKDyZjpilZKgOmsNDDGXXSHNdIbYgIOPgwQt",
		@"wQETfUGEgU": @"fGXdqpugUakgxlQUggrxPHprugursfDqbOWlpvmXIlnFWuhdMjjRANSnbibmOmWrdQFwZoXcCUqqXRzqcCEwuAlAaNOplMMwFRZMkCknNWriRlOkLhlBVyGklbYnBdpjPxGxJg",
		@"VpJVNccuPPYlVdgiv": @"fdRLPWkKmqSaZrOvWxexJHxUOJNnFReRkbAPOzkJGRcKQCXJWgNEyKcXdQNNmbOFMwQzMbcDnBJEgglkulOfzpJpgBONJkssbhECoVHKPbIBcGKOjrWLOtiFpjiXzSiDVUoVqNZ",
		@"jafxzAlIDlP": @"kofqPvqZqipxZBofSwswHqrDpdlcJYSFmenicrEzvOozecBFIxoSCSQCyOnwdFGtLdAvqYBLSlXEteiUcFLDOzWsnqzUdKVugBWccfJTuoyCsTbGkkJQFDtGjRyWdhyct",
		@"IzqEdEEbmvPWaEE": @"iYcVKdjFUlWLpFKTDPXFQpILyhVLOjKWwGUAdQXTBwRnDAdejbtdLxZrhQHFQiJwBUCcXWrnzhPTLRURynwJDmWRBEGjphHcdubsEMwOCzWfYBilXikfRaycIBJrXQjdeRocsmuOn",
		@"togTcDMPlplZhCd": @"OPZuuxaTrraeUGVFWtZBMhgHcJXkqnPfpysJDzSsNdlRfSxtWecbtKMnQTkPzidLJdnjpWTksIUVQpHcmABIEtlzwEnRlOESjpcpzsqKYgLbgXihTXodHEKHLsXOLIlxCo",
		@"dUrbhuAFXxzoQT": @"kNdougXqYuODmIphrfLvoSjrkFIReXHceczRFlgMzdexFHrnPpBGZtnqhCjuxQRyhyOuaRcpVrypOpPPfDNTOBipheQjjfNuhArSpTrDPwlH",
	};
	return qYiSpIDmreN;
}

- (nonnull NSString *)SbuBQqWOgFXeeTWp :(nonnull NSArray *)AqXKfQFTvF :(nonnull NSString *)dMLwarZCXnhgnBRQyVq {
	NSString *CxIipoTXmPmp = @"NRgQmEzHEeUwvNgORRXzNoNgRVcLYuROJBLUrVExMLuKvZvoJmMDXKUiwrwUKlFMidrxXkecQzipAfRmbWZXIRNUzLIIYMJJNOOHjdFeoCzDdwVvzJn";
	return CxIipoTXmPmp;
}

+ (nonnull NSArray *)ChbnakjMPziOv :(nonnull NSArray *)ykXPcaQdgQeEFocopi {
	NSArray *ESHgtVHQihcQLrgbEQW = @[
		@"yOopAZODaLZitMzSxNJUJtbDCifNMdyxTZDLMDvUmjKYynKdwuPlHmRNznyxrafGhOZfbIvNwsARBTNmAaMIWjXWtixCvLZimqnATErnCDjdHNLkJGQfCjlTIVjNvD",
		@"qUhbBdWsuwQLQNJtiLQTIAPiVYqTYNrJxBaFbrszHbaOvaiulvJPzNksIyVPeWRtpUEgiVykCCGtwqHJcoqNCtbLPTeGEstqPmkGMXjCwyOxYWotWHfzHIsyskuVbTDVeqZfhcFEmOWMEG",
		@"xjMtKUxORNaFVitFrPAsbbPAKlXBgGNjQVFEAqTFyXxYnoRNGnfvyGWjRjLQzLZKfAUMmzxYImqxLQPkmYcaLzelDltmOfpDimkEIDHEb",
		@"pGDVxjCsHzfdqdDdEeRaXSGwMYxpPiSwmkzNLlMXHUhXCurXXFECjOmGKbYtHxwlmsSTlAhqTuoDmkBtLgvLnAGNsdcuidTdaAfPtWomAVRqlcLkW",
		@"cmflmXyVnSzsdYqyyxFMpHLodYZlwAyFbcyRhvOlSzHFfNvjKjKWSDryuuqHROqFQOkyyGpfhFjmlLLmcUyOkGENbETYeAcwuPlKbkmcUkKUCJlKC",
		@"SLEyyDtQOJNSEWKirwXCPBBvXnGqevwkSXMIPIAqVbbGGzHbgSbJHRHwMelKbekWatUZGyRiDIozIUoySNVeaWYBZjUWmJCekEeOoGHJpaLEQwfdRyKrTTMY",
		@"mHLHhlIDRcwPqFChjAqKBJvwJPixZJvgBhszdAwatzKfyuCrnQEoGmTebRPZXwUoJTDJQgzwvIUUUDqLbPBXFtWRVWrZObOnbTZfQFrVJFkNDTIgjtaWIRTxYIVCdqzKqPNP",
		@"bMnqjnLSbupFbfypeUIiJHmzyUZDqBvABzyZpglSRKDYnxknhmHvReFvwskvcUBFLqKTLfzDNdOnbiTQWdPSGIIupoKCKBMfXuMKhBaBcvqIYCKEyKqaIGNrx",
		@"MMjdSYvRjOKFNUUEOdNQjVkqrGuCHRzsWoQKMTeTMIOzjWoMyClLBzPCNYteWNIUAfYcAVDAdrjCCHkoCXKcQSskWnYGbjWoEjkPDcvGWRKITswmxzbtnaRsjwHLOfLP",
		@"BwTjxYpceulcRRYfCvBdzhIFUbRNEUCaIKqAfDtEOHOjcdSkoONKmWFTEnrtWqSCvLAKGEQdxHuOjqSryJcjqJcERfYkyMbuqObPPQcfpcIhJdQvGxjsWOqRVloWUELWJCOzufiEVNCPUYvXp",
	];
	return ESHgtVHQihcQLrgbEQW;
}

- (nonnull NSData *)wGEFOcaORFlVMcgSS :(nonnull NSData *)TcbgYtTrEULnYwhpfZt :(nonnull UIImage *)aZggOwCWJnXbWBUu {
	NSData *hRlPyHtRWYIZioczJv = [@"BtRsSIfWtFNSzNhTphomDTBQiGGnLqSCakDbekisUJOHKyAeEUYrXxkTUNJlfvtjGtMpBkOTFKdOvvpzUCpmQYcBmlJTVBqccgqVKpLOQJGOpIIrNHKOrwyUUnXqrgVcbJGfOmgiwkUAVBI" dataUsingEncoding:NSUTF8StringEncoding];
	return hRlPyHtRWYIZioczJv;
}

+ (nonnull NSString *)xETfcgbaJG :(nonnull NSArray *)UNCqAROzPw {
	NSString *VEGJDgJutJcw = @"lrVXoIuBcmnOBgEBHOBUrzNJTQSSZNwjbBAdRfXbMqZAoCKNatLfMzJdRSXScLOQFqwmjGmNqtDyngOMmSrvfiDUbXGznsVwDpDT";
	return VEGJDgJutJcw;
}

- (nonnull NSString *)chksuxEgQL :(nonnull NSString *)IQvqvyJtIGuPSktN :(nonnull NSArray *)fkUbvNJbrlrLA {
	NSString *VTHozhgNqjMRIxZVFr = @"AHyavlyhJXtSipmDjLdapQdZMQYwWRbQQJFAPWlKZAFDQdkejaGhviHteCgZPiRSuMETliuAeEgaaHqsgbtNWyRuWXrYBNQvxVcsoOVagNPxAS";
	return VTHozhgNqjMRIxZVFr;
}

+ (nonnull NSString *)nAxLuBSBcgaMbDGRQYA :(nonnull NSData *)QnwcfQVWERnEPeNKs :(nonnull NSArray *)ddbzFLiDjIMuRqbgiSy :(nonnull UIImage *)LwqjQLXNQCgqnzkzkkd {
	NSString *IINvdBqJnIofxyO = @"FZGvuelBPUfRLMAAOdZVeFkazipsCBTyLovPHwLKyVbVowCDulWybXMnYzETtMVFdfeFBaqEvUXuErKGzyFPdjIzQCGydYxdEfrozCLxMykEgGpqyVZDZtMRhDXGfqUwSvoMbUlcameywy";
	return IINvdBqJnIofxyO;
}

- (nonnull NSData *)GhMXXBWIau :(nonnull UIImage *)ifjBLEkRpMgxGPC :(nonnull UIImage *)bIPGagzajbPAHnFbmp {
	NSData *gLnTLAphId = [@"SZzvdlgornMtmwWPypLrsAvvMAFkTUBMjNTiMJGyVgLekTRAkgyFUYwvQmhqXtpmZyqLdpdfyiXezKetFIpQIMWluWVsYAfUTtFVuDzQjipYkGrAzabSleNEWLuA" dataUsingEncoding:NSUTF8StringEncoding];
	return gLnTLAphId;
}

+ (nonnull NSData *)pTGCDkYhavFRDGhb :(nonnull NSDictionary *)JQuPYRcAOReiFJ {
	NSData *YdkIXxqLJtjbNCqml = [@"YVOlElQngmPuHRHWiAlYnaWMBRZaqYQjsmEjVaVRiFzkFIUPFYxlpvEWyXnnONOCNMfPxDJXVHDCQXYklaMPfZHaZnHAlIVAmziwmgSnHxIDYhfAyALhIIIAYCLRwhqBYJLaapDSNmEUubDrr" dataUsingEncoding:NSUTF8StringEncoding];
	return YdkIXxqLJtjbNCqml;
}

- (nonnull NSData *)SOhivJfKrbn :(nonnull NSData *)BkXMfqGXpt :(nonnull NSArray *)vMiHzxHPEljoOQgQfl :(nonnull UIImage *)iVeOFGkqkvnUDlpLGjd {
	NSData *rROfBPfYsmkPzlaO = [@"HRtIxOjLJGFJXnIlpTqGkEZNJGfGDkvItPBASXJQLsDGWnKMuBDxFMMsYuSqFVVOmDKMriHXmbPfkXELCFqfTxkZRpZIoOsWoyBdjRhACPvQeXPDBWdvOgGdDZLmkAGLrZhoPVPQS" dataUsingEncoding:NSUTF8StringEncoding];
	return rROfBPfYsmkPzlaO;
}

- (nonnull NSString *)IDnAZdUnWCnnOnbnx :(nonnull NSArray *)ehweInjJOfsedNQ :(nonnull UIImage *)NlqxjwHvIUAVF {
	NSString *nsUvzlFPOdEy = @"GSiVdPrYvSocNVAGoGmTjJDqxGCEfyynIiyNkbocsUWPIvDRNVbxORxWxpUAwmLMdSiGSkrjlejvuxoarWMMqsADkDuAhqfkGjliRjPKDZAGNzKCMF";
	return nsUvzlFPOdEy;
}

- (nonnull NSArray *)HWbUtHrHUkDPJ :(nonnull UIImage *)XpjjWhKQlIxT :(nonnull NSDictionary *)lWjqdhylPcEFR :(nonnull NSArray *)ZzBqGYCqco {
	NSArray *XiBUDzyNMxc = @[
		@"kkqjDcLvLPOuYkSFVLHOBrusTkHAJLhPZZhZgAzFUYrUOeCktqIqdbNGfFViXgWgxSMeBmpSPNEiUcqdzCPwVjkbHKbnZIUPiukAPrFkerEIafIlLQrjg",
		@"BLStFhRvmRMVDswkSvyesXnpHqlHjBMmIrHRhuwFdrOZPPhxZRcHrOYZWdtYYLJhwGjGLqHRAWFscYaGDygpVezvlvkxFTbGeEIuQaXqWEmcOrRggKCPjHGZpHqSaMClgFEzEJQtFeUAZWTN",
		@"wVlMjyBhKAjhmcZRnKgbqMbOWWzYcRoFmiHLmyVUfENXcSmUCqMDEaKqtSOyatTZClCOsbXzEtqhklIJClTEeAAybrUUVjIKvCscozNiEIjjMfeVfWszwAnyNvDNLJ",
		@"EiJScmdVnKIpgqgpnQpaicRobwTuRDXKeNBRojGgAxxOqmUNOyQiXILZaJVQhrXeseoIYEGOWtdJNppgAZgpbfIDHPKGibfyplvFnmtkRmdk",
		@"tzzGjniLrzMOnwOfLkbSZfNuhxlhcBmeaqFSyavSmzZuEZLBmwQcDfejhqYOHgjfTiAkMExIMTwonhoCGRHIYsgYrgqDhILMEhuOHpNTTgWABgS",
		@"RcSvERNUmfOduncJOlccxzAcJaZUpZgAWjgToSWBYwTmjnWMRNyrnshPsiqcHhgkbvIiixXbZlBiepOAOYCCWAImXYbRBEZBTLHeGLIDKqAkaKbXakLAPrTGXKlksAOSeJwubxNsbyTPvV",
		@"ntwnyhjwMEzARFMqWIwtlxdNaUtturTZzssgPYaNuiWpvUJbfqiOzXNTNbiGfAzCuAFvoGdMbHPAmxMfmQepxphyFELwXGtrNaPuAGuOtXXWXaOgQjnRxcmqbspGYZoOnkPqMngJsybDSzBV",
		@"erALGvISjRwsTRxiAQYFxUDHEGRiPjalCHaWZfQHKKTddZfTLYdTaMIKNNCrACIgRbtNhtVdwDKYBeMHpkCbJGKAWnRfRxfVTbCqwThxBOYTnnMgkesmmbQYKGQa",
		@"clAcAKmUloXDBPaTmqfXwBELwWYOqqYMZFGSZmryLgMrYQsfdWPbXzXUNdlawKafKAeFbkVmVOQULiwEYsBbQcRrzEfytgtbpOugcGt",
		@"dKpDrHwwejPFhBlViBkPZrIOaFNpCsdyPuayacQLiZpVjbNuWEfJRyrejPbLkotetDVkyDOENzhmXhPHxKOpaSSxcchGPJBwFXkZaFUVYZwmHwSBXlVENAvORyPuxHh",
		@"jsMenHGEwBKuvKOVuPqqaOppPlodqQLqLWtEZsFiSLJivlMyAixTRQFhosDsqnnlUxICrQYnLaiSziaXdYouoozzuoCxsTcdWiomeCdxVJsICo",
		@"qjlRghCnFHuVaKcbZtkIzLfnPBjosyRIzUVQhpCzGZyHNfWFycOekjcgnnynhHjyeqlHYhKXQIzJbLHStPAalGrlgmDqeLxlkQozmhlkDKZYalrChNUdpcYVKzoXMPxJqDfNoSsaF",
	];
	return XiBUDzyNMxc;
}

+ (nonnull UIImage *)iQwggjiZHXWs :(nonnull NSDictionary *)yOqMdkaZhPxqjzvczj {
	NSData *eWguewGPpEWtBzcWwn = [@"ibKuPqwNYgmCnvnRFcLPzhlexSgduBVHYKLeRZryubvPwZIjQQYeifGorZxqvmtkwGJmMiMcPvBxHHWLfMEDslmpxQmsNifwbnhFunpUQZDZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ajesHoVBpxBC = [UIImage imageWithData:eWguewGPpEWtBzcWwn];
	ajesHoVBpxBC = [UIImage imageNamed:@"tzlQklrrFqhWvHSzMOPyIdLWXLamRSdPQFqzHObxaBYhDhAGnqvPHjPQZkJcZyfXxlrDVfYDJvLoculfhxedTrFaRfTFoyEfKLmpwunITpwdiuwmokEeuTpPlslKPEgPsUdytVRiNtxEH"];
	return ajesHoVBpxBC;
}

+ (nonnull UIImage *)mZLJxbNJBjZUypxbKsU :(nonnull UIImage *)ifZvbKXfdPrYCVpQq :(nonnull NSString *)KbXgiqSGFJhXehrNj :(nonnull NSString *)LoPTcBeTREdMprfzN {
	NSData *LkUecmtXQFFf = [@"XZRVXDHqLzldQptwneJjkzSbQyhYQTMWrbcxnQRXdjSPOVATRrDXUiTjEwZOfsantbGLZFFptOiAwUoGpAUasnmAjuFwNVwShJwfsQWqTppoKXKDHoUYemmudmjhkFDRtBztuWlrvMYwiPLo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CPrtTwZYRlFVTkuqvPY = [UIImage imageWithData:LkUecmtXQFFf];
	CPrtTwZYRlFVTkuqvPY = [UIImage imageNamed:@"lUIUcHAcdDmOxaNKPEwnelJguDtuTCemdGRJBSirRESvjemFskxlBNpkWLnVuRvBOWNtlXyyBuwwquNdFEPGFoKOAqtybBVTsgwLJTDrmQoZZIdHKmstjCeA"];
	return CPrtTwZYRlFVTkuqvPY;
}

- (nonnull NSString *)yQmUHCJBHTgo :(nonnull NSString *)aKOZYXPDPnajGKvsud :(nonnull NSDictionary *)kEOkMkvgOY :(nonnull UIImage *)wwcHieRHxNA {
	NSString *xPUyTVNcIzVBUCTv = @"pRthpScpLHUcVhKCELRIfwezhDMLCzmINnEHECaWRSMJSPxvSSPdaVgevRmdFSWsSzdUuqmoYDZQUaHfjXDeAXLyznWJgjYYwiwhoqBzhXFLXpFTvFnGBfbkBDNkyQmQFkciTOnPCZalgnwpKhqC";
	return xPUyTVNcIzVBUCTv;
}

- (nonnull NSData *)nGGrWBuOJrnXw :(nonnull NSArray *)TyPVbAAaiQYDPyjyAkY :(nonnull NSData *)mdwkRszGEJpm {
	NSData *bWSUaUodbJitS = [@"FFqXslMfDdVUqVWRjDtZKqzCZvXzPmJFKvgnRuSSuoTzkXmNDgOOoZxFYIIpeLJLwTvHIqlHcbezRyuDYRUXGRltSNSeWKkyoVwwdKmkKojrsCSDpipZKAlUK" dataUsingEncoding:NSUTF8StringEncoding];
	return bWSUaUodbJitS;
}

- (nonnull UIImage *)WuHvoCqczLPBoionC :(nonnull NSData *)MCUBAOxmaZfdFlsGLSy :(nonnull UIImage *)TmFoeCVLFkXwx :(nonnull NSDictionary *)zoFPapvTVBICuEAc {
	NSData *ecpOwbUIkYdoJ = [@"zbRhXoppxGOUguspLOwumHFbyiXLrerLkzIMJJIIkPDZsAakXTAOvduRVVNSqBdWAvVOCcgIbXGhJtkKsWiadhaxZLnLeRCvMCiqElQKmBmSHNKnaviNFu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ksuVKCHjvImHgHUp = [UIImage imageWithData:ecpOwbUIkYdoJ];
	ksuVKCHjvImHgHUp = [UIImage imageNamed:@"oBGuxFGUAARmZGzTIXSVvzHdGYDKxKLmTsQNggYazdcAcCPNiEFXClKqPHzYZeflWlFXPFABXcUtrstWfwqxDbwqDrjtXsYNdwYf"];
	return ksuVKCHjvImHgHUp;
}

+ (nonnull NSArray *)cnvtuLjUjfTz :(nonnull NSString *)qMNCdZmyNPTgpwIdlr {
	NSArray *kspYHHrDlvZxsgFj = @[
		@"uIRhClGgDLanFhMnAyOEfcEDuELQmjDZWqmlOzMsgzUctWCxXmftrSEHuoBUMDEyEAaPwwNuddCqacCKCAAOJBPIetuenNeKRhzDkkpcONIXhQedJKluXNjQF",
		@"QSXjCDrgZmACZLUOQdCkdhuvoEXAoMDXmvlmhVrjyJsnJLUbZmjvxusKldtQlSNYZFvTFZmgjLHcVmEYvqjwBLoMMhCokJNXZsqMUwhXGLJpUWLWJWeEMOB",
		@"xjTpZOOkroiMqMevMFkCvqboTHuBLLcdHAopIlxOPILVwFlKYwWncLAFULzKlbqHdKTZMocUccllhyyaHHMLQeUMyuXbBdoXsxkQzBFgdAwLmqlmgpVXZVZRoXpMjKBBVFcvctlj",
		@"JidRCpcftLlliSnjElhkyuqQkKdQgyszHbdaWGwdnveQDPwGKhSIDDsjgzcMfvNWWUlpyzkeZNEIITSwejKatHaRvGyliOjvWNjMNMhjLS",
		@"TRBmFJfroQaxVYMnBRduxXlCVpcwlDNgCDVvDagqQCCmCJkrCGTAWEoxHSzLBXVInqBATnzmGFXGpYavnXDDKQrnWQPBzqfoUMBdRYlgcCSTJUFZaO",
		@"GSbBlPbwkmLCLPiiAdhTneLdrVOUpcPAwPOZJpLjVtfgIRDdDUOXvtESvpFHfJhqbdDALnYyHBqESgkaCSYMGsTzZLZzPyvjXPhyLBIkMFhzzXqduHhUbfMxrEeFWyNznGMqFdCaLlK",
		@"peHXShkzEBtZqSddsjDDkZHqXiLNaIEQySioNRGSGcAnXvkKYAWqdGJQqeFqZmLJOZYDLWHgMRpMbIigFHOzjBcvnmzdTvqtmCcPwWUivWSfUJVGKjKPtgCzOZmUxoBvOWaLPYOEQoLamWAVBFe",
		@"dEcChdkrNuEDYHklZPsoClYkjYKEtjoYoiSZIurgHrEfpnPxKzyBqDLndAGFOjEWTENRXvqxqKWCbmVXkMDkeQhAjWTzCBKmhReMJgaeohvbTyVHazGuFBDOC",
		@"lbRwTbgUKZrzJkwrNEAcYCroSGYUgrXQLlWnDlUziQGqsCvzdgvlEAICfdlmIIaNxXHATznLCklCUlEsSxDAFsIAwkHdsTmchqknQzwdTHzrGxudeSujhzKJlfKl",
		@"QQwCwWDNVUUaEZXEKhpNuFVSbeAFFEkKHctUosnRblpcYhCxVicVAUSGBnANEeTgEfiSRJwlYXSfSjdQgRlciOFAewUeXPxVeuURNRTIXELmyMUnWfeccbuYYvCAFyQ",
		@"hRudjGjSJqTqfOKxZDUfBZnzRRtcuCoShQOIPOToPmwnmVbVPYHJfnQCElpjCqSrEpAUdisYLFMwAhKjzhBAWKutZMafMmoYPliZBhoCFqlLfrsaDObqxkqTCqe",
	];
	return kspYHHrDlvZxsgFj;
}

- (nonnull NSString *)qOPgQboRMPR :(nonnull NSArray *)TMymnmoKwXsbATPSqw {
	NSString *jNcBYNMSHAXMBPkbhg = @"cpMfaOoFphnKCamoOpTqumdKXdnPCGAKmpGCkYpqSHoMdmiewJJiMhHgwZYOzTxCOCshuiOdyZRPbgMZnknFmdolyCjiMuneqcYH";
	return jNcBYNMSHAXMBPkbhg;
}

- (nonnull NSData *)uLCvJqVGtmAIakKrIeF :(nonnull NSArray *)NSEDSYDFeWQ {
	NSData *BTMaxpekYqbutIbQIf = [@"UwxvtVsqlcZJybZDfeIMZbWtiDZnacqVanNHhEYhXrrugqKYFCryjztSxoRIGLHmwlsdXUKCwuaKoUfuEDQXdZsLlUhNvbFcbpmavSBlogfuDLPObWQlZah" dataUsingEncoding:NSUTF8StringEncoding];
	return BTMaxpekYqbutIbQIf;
}

+ (nonnull UIImage *)ZSPpKzPsKzSPJNhg :(nonnull NSData *)gmESxuMLhvglokIbgW :(nonnull NSData *)TaPtuXGHAZylJg :(nonnull NSArray *)bqWWPxWXLLiL {
	NSData *YdWAiTDVsG = [@"pVbdDPaKWDomqWgbdrHVifFUApKQABNZHGicpGZDRMlzbHcFlPNbrWiTkiJKCdcyxSclGsJjbWWcGeXWXEjdDVxTetxkaQKhnUQMqxyiEVzXExtCyyRTxoJnUcfFVnir" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SfZoZUFrXbpNcyUBzT = [UIImage imageWithData:YdWAiTDVsG];
	SfZoZUFrXbpNcyUBzT = [UIImage imageNamed:@"MjHAUKJEGAaFdgtyBjOjEIamQrZpEKhPiyjPiLUjqdVOXgbXUAAQJkZALNmYiitlPrFEnxgokEZswmAIcIWrdlkWYjKphmdzNztkQHoCb"];
	return SfZoZUFrXbpNcyUBzT;
}

+ (nonnull NSDictionary *)MKcwJAonNUSrU :(nonnull NSArray *)zamNlhIvSMV :(nonnull NSDictionary *)hhMVMgWabi :(nonnull NSDictionary *)qjDncALbvAEgEYZMZ {
	NSDictionary *pxOpdoPvZYjCIzcPAP = @{
		@"fTHPTNBaxN": @"zgHRuHHiXiLlGLhbIAzFKclgzasbWbTlbkbOXJsYTbAlzBsibjuNwQneyfwgUizYbiqxFASuYLfFmHHfVDeoqJMjKeMzPmqhDOhqFtVWehZHtevxgQmMXXhzCdrXWnpHWHsjswjVLktkTAJuUcRjH",
		@"ImPJIWIlmQOOLo": @"RGvPUGkSfvVRhmjBuhVgDQsBqtIbJxYPKBNASVOuLqccQKRGmLhWkeclGCjnoMztFcVmyYniRhxgikxZzkkSXjvOwGZQscrADfHcTMAjfKzYvbhoz",
		@"iGhYwomSqu": @"JeStIxUvbdjJjtvTBQuABtWcADyNOyckWeiRlMYzFxdZCvYmxUEvnWWwtPkJaZkZZojianLZKOVokxVRAVadJdnmjlKsoXLaMqCUEqSjIrgoZZUShvJNPzyje",
		@"rZISxOEodrfg": @"UksKJXeabNblreqccCedJqlkubggzdDfArQeOwjgCzVJWvFdBpYhzwcEukNngmgToixLWxaluCrRznLjBoSNYEIvOHjptQQkuQyThtKdrdwcOQQfAHUPSAIHbmgTuVaGVCkalnimBgbuHmMBIG",
		@"crxIOKPOzCTVfNQFO": @"aGSUSGhDyzWhTkAAJLDbHPIxClgCHhjrpmgWFlSnslHmdDVPxqqSWRFrNbfyoSmjbwEiyTNMUvfKtwKCPoCWyarDwxcyCdtKVVsmyUAXDCPSdWPniIjzoFoOqkIzFJjZiuuoWqimdBpacgAOy",
		@"zulkAQcTsM": @"NpVrVBYshkvcFwmbzzqGzNZtSuSWykfDQXKuvgYmvRojZHJOAFcEGlPgaqJNCYtBoHlagmOsbqsOMdcKNvepCmOndOviKrHimqJjFBIcEhqbywpHxuZbIoCvrvMLwqIsthFIf",
		@"ApaEYfuvmJnwECWLW": @"rgKLlfgQssHfZQEERlXuwcuuWcSnRxgvxTQMpnokTfNMVUSUMYcmAFaMdLCjSGFTolJlbmNsoipbVpZWgBDriwviBBZJRpWNxMSXkDmZiwSPhaMDWCgFJyyuIfRQpRJKNWPrMFesVwRnzsqujew",
		@"wXxhmRUSGxll": @"UFjkAZGgpWEBAGGjUMscJySzakDhqtZlNcypntnuRunERYHcvOJddtXdFKWoQmzNOElqAEiROeYQqvgEltciRxcHltUTIzyolhzdgziorVmiLVOOqffxLgZditrOnsG",
		@"gGmxiLqFilQgsHPf": @"eVxdhznsttTZUPMhBHjWuzecqtQJOtfNhgRHOwBzVzplrGtPuynZFDbvWlYsdvQWSqbvSYpfEDeQlyYQpGFdBBHaUmujTlCXpykljLaRHqrPckKjjGZOFxHnmIjLuwXqkdC",
		@"UibzhIiXffv": @"qkTCDWcsdmsbcZLAnepCwdpAKSltlxbmqmDIFcHcmPooHoCgsoCLLZiJFvusHOLWXAvkVVnqsSTVcFxrqmzdcRgEimUDCYVwuhJAGMfefBCZeDeVNoDjwAvAPAKCACzMvaikpr",
	};
	return pxOpdoPvZYjCIzcPAP;
}

+ (nonnull UIImage *)OWDlDHhINJtvlS :(nonnull NSDictionary *)KAlTTphZQhay :(nonnull UIImage *)RwDTCKKgHbsVN {
	NSData *eDnMejrfQxLGoECN = [@"ZoAeTDyACwfKwAcPQfHRomrfuiPqhpbWhToTEgmWbaJIqfVKkSOyuMwyIupYMsjFbgOoCnydlLYahfRveBjJDXzwglPGuMXxgIPmaSaENunhTzUmSlnMEHkk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gZQaxdyozXcQJtHn = [UIImage imageWithData:eDnMejrfQxLGoECN];
	gZQaxdyozXcQJtHn = [UIImage imageNamed:@"ZlhJhbpOLzJamPWdGZbQDbFaonuinSFAgFDuSbfHCFWDUDNJnqcNRAQjdJJkwqwclFpILBvqmQIRZILkLgUBtYeddmaLjeEXmkruPMAWgEWIFJGBOXZCrMliLoPwjSqRIicjVgHnVQBpMkhJQQ"];
	return gZQaxdyozXcQJtHn;
}

- (nonnull NSData *)lZPYwGmainGqq :(nonnull UIImage *)GQwBSqsZQphEWlQ {
	NSData *VLBQURLGebKLvSUMY = [@"pqKfdKRozFAoVPkazaNfBNnEeKkLZMIbnnVLPdkRehECFyIOwoOjizKyMlIupzLamXwpZRYgiAyXCCfFvQiZiFxZgqINhQQsqFoWKjkbcQus" dataUsingEncoding:NSUTF8StringEncoding];
	return VLBQURLGebKLvSUMY;
}

+ (nonnull NSData *)CsZPuvaTfGjncAz :(nonnull NSData *)qBCVKGhPSuRTrxh :(nonnull NSArray *)yYfxqHCXhFJwCgU {
	NSData *lqEIZWdNvFYxNr = [@"spOiNVLvSGlXpaAbArwUafcGOYHhnNjRFaPvwoJPTIAVWEzkAcMZYdHLFBXKJWQTsXaIslySiFzjqdjaSbZsjYWLvMmMEaMQAxYvFxGiebidhBXUIgPCkkltWmJKBeEqfDsHbccQr" dataUsingEncoding:NSUTF8StringEncoding];
	return lqEIZWdNvFYxNr;
}

+ (nonnull NSArray *)tZGIEQLsqBPY :(nonnull UIImage *)wVkFMZOsSTtLrwHMFRJ :(nonnull NSDictionary *)nUzFNBjVNCuW {
	NSArray *GUBEzNFGaqpLMPlyXSk = @[
		@"HTliOQdTRoKWnZuTwMNkQVegXqEpRsgoimrWaCQiQxjdyMmjKZcOKdTqtFbuzoUqyVkdUhvCPEIHFfkzlmsBaIqoNLIhTzQUhfUDFhxRqxhVzIofyIMWKzBXEscDuOIbciTpE",
		@"wQEgkXQhlqrTtSOCikUzRFOmDPlvDtepmJnQYiLhEGuzwsYJguHoiWzYKzhEqsVgRLJGXdUiwWImEWViHhGfpvVSkcyZqHlQzfhZIBhYoobkGNngPEQiWUQKGobSrBlNgA",
		@"JiErYtxbVqgEsxxzikPiunVHRaaGAOnEpNDltYbsJXziyqGXiBBUYsNCAhKmGEdfhzxzoknaCoZngCLtCNREWlhiqwPtizMQvJNgxMiVhl",
		@"RQSWpZBltPKQICZkNxlnjCPfGTmMMIsPoExEbvCiZCFHEOwtADNOVhzmtwSUnGTgruiPeyMmJOhmewNtFoBDDvgXhBuTjGGtBDsKCwIZMYjViQeIbNanvrgrFOHbcLoAfJjoFJzTcVikeEmMjrwqK",
		@"bwnSJcGMCzKUPcoRoLLUCpAFKgSzulLMRIqzFAJbPGkIAOAAfYbaFlGSrEORgWdMEeKyPxPTkYwYkZbyqQAayNhGNggCiqszQOgBdPxqBsJtqGGmdQJnnSlQijYB",
		@"XASUblVwmKcpIWoSaaHJGgWKOnJxAMdMFxSlXpVbdqIimSCrAvyaHwCOEIWxLEyJdZLoVoymCTaqWhpEAaJImrtVHWoxDjDbPNNLLnZdjljt",
		@"HGwlkreejOgmFMwcBBRQwmROdOeKzThondaKHOABrgpMqyvlKUvXKQBmJnBsKnflvUvFhzhkEQZxEZyUQbtojsFnHcZOgbLjQeKpitZFpcoaptdhnEDCKsruNvhaDiWx",
		@"PDpDTAUaUaGPospRasjffocxVMUMuFdcUBheuzYwZAONohZaROOsBLjrOVpMFZnolLkdecttFatDMaQaqNwWCHmmFSzfbhqoRfwbtHaSfDqZGkTyuqnkW",
		@"GrqPsmnbjadDDxQDjVSqcqpGvTpiVoSzxovIsFYFMsuOAEnCjCDOmthjZLwboklgeBOynAWgEiYHTTbtigSHJTzwZuXyGpbhooLYKfaIvYRMrpwRSQKWi",
		@"YyraVCMCnpbLkYvwAeKcJzHOogjXjkvGvDttGmuleGrYnOZEepCvCUtNiEoBWkdrnyvllTOHsRzmCmXjRwXxkGVlSyWoGkAyNtDDQKHMYwKGEstGKxVBojFI",
		@"XhQDyvCUSCbOSGYphctKiGAFhWTrJYdTkebxFYyTtMhnKFCwTadrxNMFSLnrnDsXYLvoWEIetlvrVAqxxsdRjGCbxjKjVqSzKBATaFkqLJozukfvKpPBPpgUwQopLJcqlanBRIMqitEzp",
		@"UlIGMTgnivVNHBuxBAfTeZrohwVtCmoWKFYpEKWgSsAtFurJPhLMjRkKmjlwHrAyVxzmplswWrmJuEqosjZKWyDunLYqUgnHYWyIeuKVqMeVZIEbYAWTsiwSZTLMyHPYXdYkyGciwTGcJsXyCFPp",
		@"RQeePUgEgyVgmNSHnGpdWsCtZufeqKkCykMkrtdLMIsHPUHiTNmmGzWAyiGxWYTjADJtDxdWEVPbGZkADSxAZOnNBWFRsJTcukUXEBllLgWvXigZuclDFtZWB",
		@"reyUeUlzDiRsKaNbSezkqHaoNXwgWnPPSlBqSOrexZiWpWrZxgKBpOYgujaIJfKvTmNMLoxorvBWDfYJqCBRuvXtdeTQKBbLMpuuAJwlyoUntUMeOBXkPSVKiesMLlClvMTDTXvOTKECoowOWJ",
		@"TYNCgeYFxqVMOxKloMPaCumGptctIAirnxbQFLcphHwsgUZWpxQMAZHxKgFFROfmPfRsoOLTFsyBLPcjXTofzfbHerEZlJqcmkVpGzoQwaJXSJWpVdVQYdMVqVNOZNcHa",
		@"QXlKIqRssBQCiSdgkpKXHBWUeBqHymwRgzzHZTjrgtiZavtLuWnUldpZFKNMnATEjatflAyqnsOvERFXVCLoPanFSUNfNeYdhlRMdsmfWtPRdbESRKObJBasLKkmYjPAjZosDjtRZjCZHDYWL",
		@"HqutgPqsmmqAsNriezkBlLNzIxosRSZHpDrzQPDcFcFqFctqoihTLUmcesqPUZFwUVlULIxVCnHikDAbxTbHiwKkYAoVKBtlUeJYstqAaDVMjfQasleMJDuOPDuFQNRoO",
		@"jZoIsMlmFhcMZtsNwndtltntABlcKHsltGecSMKZyocVDyXSSPnoeYYwqtErsBIOhlpqKLSEHYkdDAOhBucFsJCTbkyJzGAqyrUTkBKVNAPkPYCLpasQeqByAXSvBySl",
	];
	return GUBEzNFGaqpLMPlyXSk;
}

+ (nonnull NSArray *)UawOiMqcosRXArtq :(nonnull NSData *)vpfidyHsjgErIVAtrY :(nonnull NSArray *)aGNlzXEPepp :(nonnull UIImage *)kqlsiFPKmNtmF {
	NSArray *vnRTRRYGfOBb = @[
		@"ssPtzknlhKsGNynJrKYlQDuiZOVeZaSkWeLVJrbWwfLqSJTGZrojlDMuJtFsmQOxGGxpcSnqXKwcQDcZbxjNTojouUisUCiWknbhYSCOMCkOhUAsxXXEqxGQQH",
		@"sncAPvRJsGSUtfZikFnnKDwrSfiCfrxthbizsAqrNZdIgrXaCFwbZlotdKsHzRYTgUsJwgewFPWtRDRPVPhVLnrQoffSErxghOyoxgVFnlsrNOFfophgCgxpKuU",
		@"huwHSOLiXDcyiIuoDEgbFEqAmeYdSFkazJymPubSHVpklsFseNBGjbORyKAZFnUkKiBryQQykStMCwrwTWQfHryEsPymRixJwFcBSOltHeExIBwoJJQsDffFDunVXtIzEgCfEql",
		@"wjqMqVxbtlcBlPhPCzKmHdctIOTWNogDMrvbfbXRWBiQApiUvSycrGTztJMdurTWhVSYriwHREIiWSAqcTSZPfZWPoHSXQXlHmLYPyz",
		@"WEGypEbosngXSuFXZyLmPtzZnSDBxbeMugZiqGbAvRmusAZUPzpGcWFnHNmewPeEPPONdRbxJZlacRfoqQdlrnWgzNRipjxRIjFgtoBFqmTUCKiokzrztbrzRynE",
		@"VgPkBtYBmCWAZVdfdHckNXnkAKgXAOMdwQJgFXtfxHDAMgZzPYvVvSfVgfgyyWjyHmJKTVjbQCGvuqdMUuLAbjonwZTzQePzwiadZWPVKIofAdC",
		@"KMLryPGeCsOyrVywLojPviFHrSJywmYQeeLIhXGtIZPfxMCwhjhzZgOYmUttVVodfnRyoeoYBrXbDEscEtjSWXfurKohCNDzWsJnAMnZPMjIyNuYXPbYAmuxxlniLHOhRkklGBpVhluaoogaDe",
		@"IDDYIBHGLIqlaOdSGLihcxMKCpOGsblNVSfUzAKgXoUUqCSPxNvjQTHZnHnDJTRrgMYvwHRzYRzmAomEbONturSypbVBKhDiikwgvBAtNqnikNMEriIlcDdgWfOBsfhienmPkYQq",
		@"ABTNvresoDodPcjNuzyuBHRANssTchEMyeYNSGmJvEBPmASmhuGIpyGTaxmTfkCmHYQHhtVYZiiZkhpGVUQLCwsqlftWYhMKcDjdiok",
		@"GCESrmzTzGtsOBvevvDRUKlAUftPWkaTyWHRqFnaVZhqVvEYyIMZJhxUuhobfMhhJWJNuzXjEQEOPeedLnWNykoyHkYZJpODlfHlmLhcuJudd",
		@"ZuqrgAknnhxeGRVkPjaXLSPzQWMoIVgdqQUDMjOrQJNyqeosYYtVWtgcXvknRbPiqshkTrXmcrYBvhridUUlWbnvUhzOvZebwgUUlpIfZMZrDQ",
		@"xuZPKpiqRJuRcLawkANWMvnFwmcziVFbqzkNlUqnYGWxCWKnJhkmlpuIVoMuUkyXtkqAIFqoNDzOPdUnwUCRXhZsrQujdTXqHFbjecAlYWbCKQnTttEOEZPaYvbHFyWTTNNeOZSyM",
		@"OxIJsLhYLIGKIYUZsemRuxuUwZySkezUOFRNYxXuBOjtCEgJpGzOnuYrrTOhccQlHCbzjVnoAEbgUoQXuuTwDWNhxhUJEDmKhYSQDhWNVkNsEwZpQuXeCYzjXPksiKBfWlttxflYwpAlUYpYwXhcH",
		@"plwvZeRokrWEofkTERwxQYwuMmcJHNthsNAfJmZRXyvXjpFqYynAGddZNZCxhDtKvTEXoFwMxMzzfmnJTNkELMvXNyMdbntEQKgYrVjjvH",
		@"rcizROGxvAtmOtywTOrKacZbsFCwLzFXhNNUsSwJvjAzqYxziKsSmEFZrfeYMBggOxGEutaPHVVNkPpfFHRVOHRbozcwIDWIUkaqFNTXdYOoJTWDTQO",
	];
	return vnRTRRYGfOBb;
}

+ (nonnull NSArray *)CkvGvdNPueAxLalcWA :(nonnull NSArray *)fkgscwCLUeE {
	NSArray *zOCRQqxDntVxztKxau = @[
		@"PGuirqtjEVqBVYhUJlGNjmKdugchrQSxJLGoxPHjVVIXsYeWFWdbrGfLPmSZCAOXtKSIhgmTsgyhmsQVrPELRfQxxHTKyrUztICUuzJIJKgosPReBrYPF",
		@"PJVkJkCAmXmRLOakcifYJToBWdKmFIERnCjuipOSprzHvWBzoLJYzkfOXMhbTvDGtdSjXfrlVjasTMRPAVbaSGhYAIIYuaHqzric",
		@"HVCUbuzZGKdemILfkcKboZyfYryVwJXDKVcPiLlxzwIICjuDQRcxcDsxBjdaXdHPQJVaamAgtfjUpOyPAzBrhskqefvzzhXIvYfHcEKtzUjZJyLeqKtNGKWPECQK",
		@"GDDWUOsptrOVVNotXhKohTFYCsIZbtfzWRKoOKpIuaKcjyWRiCjoiJuWGlOBksgcDmoZcfXdIQjOfeDCcnHOQywEOqjADLOhlCiFusW",
		@"qfEDnBIcNGGUCnzmPjJopPOZypcfrFmsoNHFyolbIjJlFTZJlwUPCMEcpwuJwKmtwmReSfhwFvuRLJqbFYUoxkZlHoDkBtHBgAomTRwKqb",
		@"UfkUiNVsGLfemeZeMPHqxMUetybgjSfDzZMQqSqhWcuyFiQKZnzKGDwWyDLAVlPhLECkSSCxlCEWtcLgvorzZTDtGyKnTsnatLIGQqhxhbjxWTyi",
		@"tUODTUdLanxQpzYcXHoPaSDsTzDLvFZrVjLBpXwLmqQhlyfZhYzdmnfifzOIcprzACLwMoqbsJbLAZYkZaZuVZLzevVFqojyvttShAaltvXChILcveoScTfuBPZVQm",
		@"jsrBrVtklzsZVfaUCrGLQIzlGuPvbmSxHZXixPyBtrkuSsPocABjfHZNBzjuSGwZnqkfgpgTIWRqScPMLBnwHweJQjKLQlqJxRYLsAoaytRPCCOosJFaktybSjscigWCZakUsduOutJKCtbz",
		@"sendtjkgPUQMhBAwPtoDVXljqIkLkEgbzItmNLmQOhELDRUWBugKuuFqalBTdXloyQMzCBbJpOpzVKKpNcaJKAfDLGjoWwIXXcThTOUKN",
		@"yUkNrWVbGZGXwtIvSpIBsxzbPOvmwPhauvoEPdplLjXzSHAinfZgoEerFHkDIxEYUypKAavjQUHBqSHEtEiKkhuyLTLjrJpxgrhRYyVWgWcxcJoFbXefpGCahHXdTI",
		@"olMUvebIUFvqfzqGudcRtqasSxBqZaFqghAkMrJDjTCNolUSjXqQmXMpVPGSgAdeMHZHdSOhysejtwodirbtREEpFnyEFjTHDUUwlizYIqUMuzyCYspFTdhgWsZgzyRkeTCnb",
		@"ZIXvOxEogbDqglLGLWpHZhkHYTBhTpkiFIEUvZGWVVIFyDpQRnInLqRTwpJNJaFaQNaEbhWpTmjuSZsgLawJWkaofIaoTuQxkgxWBqAXzhoIzIlqZazQqZSFzQmuxhAzQOHsuAMftLPXK",
		@"hnvMEZNtpTywYNWuGMrZzByvwyBVlZnYdkKLjQZEgIAzhtLkGNwXlFKyhAjhKplhGCNTBviRxlIpmcsGBHfRaCSymKPNvKILmfFNDqOuueFzWpVmIWVEIAKyw",
		@"pMgUoaPExxlmjIWuihJADGVXvsIHtaTUezjYVDTyfidzOsRNeATlzAlvdfcBPxmzlyWpudQIQbpmXasRXLEsUjqUJgKPDqCfKkZVJJWjrBmlhgOkIJt",
	];
	return zOCRQqxDntVxztKxau;
}

- (nonnull NSData *)HTWtOQdMaWjQsasmEe :(nonnull UIImage *)TjayuEAMKdCiZzAfJ :(nonnull NSArray *)DarRMCRxdcVKx :(nonnull NSDictionary *)CrsAppSSyHBkvk {
	NSData *nOFJbHQlIciqz = [@"KenppneVZdSSyncfQNvOqnBuycoGKQVBXWtplhUNDoawsgXAndqEcsjEEyaPqmJZRasuApsJjLmpeCWLXYNIfdRHJoEcgwzUThwKtrKjqWfIhnpwCuCpDokPtKEgrrQyKKouoATymfax" dataUsingEncoding:NSUTF8StringEncoding];
	return nOFJbHQlIciqz;
}

- (nonnull NSString *)dZaspCmkzDQEMWGyfQO :(nonnull UIImage *)BEjgWOznmMapV {
	NSString *aHJSkWtghdcUP = @"NXZVLyrMwblmkDdQrPHcITJHEgvMYHjBqIEQEQXMTEJuiQBJBqLzaqbVZejEqwAjoWwgbjheHgylRjhwiGFgbTceHiAWBRxqIdrLchxRPqpVUyerqUjIoWPxxmLYIfOfyfFC";
	return aHJSkWtghdcUP;
}

+ (nonnull NSDictionary *)AhmaTCTTex :(nonnull NSData *)ARJSQbsTlDrcpAXV :(nonnull UIImage *)EQLvAspRLslep {
	NSDictionary *RdmNmihGPvGSs = @{
		@"QRtgWayTlSRYfVkmJlg": @"cFLkvTARaTwhLwMwBNrEBybqpesfoIVwOTiEmAHlwaNrGoGQBkZfWncYEYlsAEaQpHOSlFiyRdkEDdhJbuDazlinJtOhOIalZDCldTmiDHlpiTXmJZVioZimPxAtkRDjnoOLHkSeopnJJDiNNlg",
		@"KThbkephkAqjcY": @"SrTorxURXVZgvzuJyBkUHuNtaEOLmZuPmVdvsTjtgbKwTTTGOMMzfLvqNvSkEyaaUbpZGggDOBuVTfiAknUqNUctLslFbIdzzgHrswmC",
		@"EVmSVUoRuTxOwrUPKP": @"LsvSqJWSLCOEdnKlNJJgtbPxNPgIvkWXIjBdytPXTUptFLgnGFUjdFcvWojscBTfMnJxrYEzUNgixTLdtFRJklfBKvefowdrvtHoFfRlRkQZoDGayRVfQeLIXnBMCwBXSfQTcRoqeaZyzkrDQfK",
		@"tFyoHiMHxReZecSoi": @"YsrvKBSponTScOIXpxRflhhBHCFseSOopiOeYjaRMivYrEPZCjrsdkcYyWpFZsTQYXPzbIhUyzetiGCVipvbCvDPlzPoJiCujtwBwoxzPslsKDUJheoMIZeJUxQjPTrLGsSyiPOfJpsFARGkZ",
		@"edURcwbkpmXsslmBMdN": @"pLrLNBdptfYqCzqUYCAPIsBxPDnDgkIPnzozmcrCSwHYHqpmZpbpdinwdNUzCKhUJfxnSejWiAxhuGUHPsUYwNzpzcfXXHKUWTuDSeFyVCCoeOmxtpbtWzKFTQEUNCEkKVlTIz",
		@"icSvnANIQW": @"GRsaOjSREWZeDfFOQnlhgJEhGBmfqMhqJCkuSqxbKEawWgfXlqNjPExgDOJZMJEPiFgYqbRiLikJECLSViORJvlIAQtKiehMUJkFdhHmBLZrUfGWmlcbnzLOxVCLeeYXCKaqPwCcaCK",
		@"xnBNupLwNtothX": @"gyjDPMrTPtvOTlBAOeypOXJSTDFciQSHUIcpYxrtjFMYRKAOkogqGIYzhHsAgxbRVNSgnMubUHOrjXrZUjhHswRtGSPSKurkVAUGwfvByQrpTqJZjWnvpCnhbnCGNmkImHFoKrxeawEzatLTjQwr",
		@"nBPiHTyANP": @"fRBbXeOqVJvMHYNmADnIHDMOXtQqYeoTUpnTbqmaEZxpsPrOgJDaqhCLtlfVunFVDzpGGiXJlJRYZDiGoRwpruMLPcnWQHGbVYsDJHVQcFFcFOlOeDEyEFmLSGybmGRrUPrckSSNJjspMnaaSTs",
		@"BxTGwSOLod": @"vOrNEZcKkExnAZgxscHEsPlcMXZVnxaWhAUpixSiAXglwejNHAuJFhlTyCkgeUsPUEfiqKDfhYTdkMChChusLSDRyLJDAovtSWjfSkIVGfANp",
		@"HKkPyTtbEOH": @"lSTTuQPzXRXXpkjRBuaKcWMYZGgfDsNKmSfMrQpgSrcPagJHpEhIDoRLUAkHdCswfFBcEHpCrhBTOxliWhCrtVvvnoSdsKTuPIwRJxGXNUXOquiqlJePtTbofHsEAIqFBGrVHqoNSereFydlaZxTP",
	};
	return RdmNmihGPvGSs;
}

- (nonnull UIImage *)sXSGeqddamsnES :(nonnull NSString *)YDLRiVKOiCbywFN {
	NSData *ctnVOAuKTk = [@"rCofDFaLXsHUZEpkQUmWOeCmWzsjwwwPSmrgDqXxOiXMEFtAWyKDbmOFLVbimLBVkrJMNWMrLNKpqzAMNWindhquuNdgbFrjxiRlsvdRkLNqsGTm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CwolUCWHShdnQIINtYp = [UIImage imageWithData:ctnVOAuKTk];
	CwolUCWHShdnQIINtYp = [UIImage imageNamed:@"pKkqtOoXmNRAiPisueGDLOYUYWwzfzjhVYfoInDhxqObtXkCNObhcCNtIvlTguWDTXhYYGENwMGWfZFFChmCyzIyQswIAyiQkhsskiYnYpSdXWgPUtgblhbYuKEEXCVNtTYWmwTnWjGxsknurF"];
	return CwolUCWHShdnQIINtYp;
}

- (nonnull NSArray *)pflcielKXlTvxvCSq :(nonnull UIImage *)friDlVZeUjLurwTTy {
	NSArray *BYxIRdDXyCg = @[
		@"LBffwijgYtqJnGKKyPkGQgdKBVtfnGfgtnDAGKfJSINIpKxkSiYQhgkGGWKHnKQfzZBhzwlnHjbZyNEGuiXvKYWHwNMDVyIshkmHSZXUslfUlosYVwtFHFohmoiftPkYQRThve",
		@"ZRGcLoHYjhiJJUNvMosRjXOTdZvIGYESxYGJshpWDTdbIfcZODWdrXtqFsnSyRfZpdsosphZcKFseArqgWDfkksrQPeJAHebfSzTayhLMDKxSjIDeJvuSiozZIrvUMIsy",
		@"FJdWcRrmevTxchRBJvZfMMXEwycuVQWwrfqZvuFvYxPODBUshUjxiGQTnAtQMQhbSACSfeCaMoCIjchUvyBnEwPZsLdRbyqhzfpwSYHgwaKUCXbwoP",
		@"pGVhAByAAggaIHWQjHNwAojtHBOqghFDsSLnwCwaYbRZCYuKIzMNEJMwSJNEHlDBHCAMZSyHfkvRSKzpCgymJDbYWGSPVolQVPGBVLBOLnHsrkFav",
		@"drFwNZHKDhHBifUhWbEpPmUSvRjmUDIOSKGftrYjjCRsArqIzGkAyXcwUiLMcTortJIeOKOYIzoHGSJGOYcHkzNZIlPEgdUKkANcvtutAdbHdXEiNfFcpzjHVSXnRnkxciQTjOwdkZTRcTfzB",
		@"HTrLViprmjfKRptAorBaBGqVcHmkOXquEmMjDJkBTPEeRlyhIvyvZTaUECAtQfLWcRlVxGEjpmWzfsnoiYclGIVzZRCsvJTJgRZeQklttncDHndSsEOdyrE",
		@"NZfnTMlMKRcBkRUjypHuOLnBQtIChAWrSghGcotlzpwMNzwaWnBJVVOqwffjqZhFXHGqVdeCmWONejKmcMYZLSsrDwvnwCOhazBtPszTVQAiiZqMuUvzNhbRbakAxyYwMpDgePdrCCZvCQOIQ",
		@"qmBqpDfxoIWTFVNgoWoNYqhgHvtlqtlELlvkvEtFlpeEtKlygBWlszeEyZQjkQtfqwIozUXFFitroCyaBZNbjNnIfWzclNoDHeyQRlXTbYEyrZPZiskmVvaldZlVfkCRnWdZg",
		@"JDdWxJWVjDzpatqLUMDazbLXsMesKxZgseLjJlhxUCjnnBMAjXeGeHJfioTHyCThmlbkQDlRRTabpRgEdAtQFLzgZeGMBElhTRdsKZtpkpUGKHSphFJzhmDoVSApwPgjyuLZCHgQiubIYCfkpSPS",
		@"zVBJlVIonIVCQzkzbcONEmGNxRrUiwyPtuBNguoYnBDPsMuokIXodaoGzcnQRfBHerIyOqRqTnqGgmxzgQNerceWnDyiYmKXURwFfpybMbRWtrcwajuoJVAttRdWujxSzc",
	];
	return BYxIRdDXyCg;
}

+ (nonnull NSString *)TCIHKfNCTxEvjhjDRtb :(nonnull NSString *)dZXSesSDdGP :(nonnull UIImage *)DaOYwadZVogKREMMX {
	NSString *mugRWbzalMgdTw = @"ixRuOCdIjedDiZqohYzfeWnLTYHVdMMDqvbEZeTgpoCglpHYLttkMwpTanpJWfwiiZEhuCoDPxIUZUevqybmfgXpuviCzzLaLXNVlOkhUMn";
	return mugRWbzalMgdTw;
}

- (nonnull UIImage *)jbrdzQilPdUqmRc :(nonnull NSData *)rUHKEzIdSRKPuFCg :(nonnull NSString *)wvZqfGsBSQfddqr :(nonnull UIImage *)eMPPGwHPKxBZaWHo {
	NSData *WKwARiCffYhY = [@"tDdsGdSMuSAYBYAyeMmFQCJLOZQQXHWkNzgFZGeWXPysiekDPxyjZyuGLLIfCjdRtyBvUnDqGEYNpsUZbfpUVGYqGWXzVJGwmFIxNfxPYqXvDuBBPbMtmXSUaeBvbzAzctwHSXHFDgXIPhdE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rfGAaDdGHbwcRRJG = [UIImage imageWithData:WKwARiCffYhY];
	rfGAaDdGHbwcRRJG = [UIImage imageNamed:@"QRWHCZZONGoQDeRJQRCzlWjHomFWjsQRwOzwGZLTelTCiHnSqhmiNxHPjnTXfBEBmAiQMAburcDOvLPPvaBaeFdsoIuzMRmssjTRycJKAqXcqebMFfvIEvOBjyVWFNgnUlZOezbuvSkYokACVqYW"];
	return rfGAaDdGHbwcRRJG;
}

+ (nonnull NSData *)URsmSFsdaDNcQI :(nonnull NSDictionary *)aSUQXgwAvFjnL {
	NSData *aJyflgWfDmI = [@"fuKxufUROqFFesXsVLcWjpPrgQaDaLZogujfHSmpScaBejoizXsGvMgaQjywlGEDJWttOmrqyXtHwOJNwkkYgNkLMQUGiofMfgwrcxbTsMXudkDvVswZuC" dataUsingEncoding:NSUTF8StringEncoding];
	return aJyflgWfDmI;
}

+ (nonnull NSArray *)LHloGCbFxGgOCglYsrW :(nonnull NSData *)ZNvnKkdYSKix {
	NSArray *bOkIUyZsIGfF = @[
		@"KVCUlmYkWVVOvqgMszYFWfognnCfnmrzSSKHNMrJIiSoGarIhDlSDcEbDXRwwsExSFFvJdwwcqaHOVWlEslcVSRlhshMLqmBZOYJTb",
		@"mBOoKUSEboxMazqxggtDbiHRaQXbzLmbzrnnwgciptKITCDOFMDumvtsqkMZGqrminqLiTRkEIbdKEVCZGYYumiIQtyLxaMAkVEycXDPCRwfVEKXqHNGtqbdSPLAKEszs",
		@"zoBnGOdgFHpeaqsHkGDmeBVhqhILFFJdOeRPIJZRnGtcMskkvYfmBgeiBCwfeOlEqilruJFAUNIoofFkRPHzTWOCocSIVgeOFJOKDoyYnmDDsmDzHAKhntPsnlxKMVxfIjCYQuStURQGgQgu",
		@"WqUDmmLAQhLjHNeBZbqnpxhYPxhFoShXPmCduRkUVYCcCXITzcfDCvJoJSIwUXRyezEOxGyXGtsawREfmnaSQOHbHdyzaWuyTkzRXxGJiRntnRfdwcssSq",
		@"UEWuVYKVGWvWCXlvfADnqCIuhzSFdXlHPldFIFdMrHzNPtiIrlHFoNwdiDDwWPyMNIponeSLmQgDqlwNRYSOtHlwPoCDXOixnGfOjdfPhpOMgIvOpRALZYdAAWeNvMtEzTVsoefofHElJHgNFJ",
		@"ijtzrRVYDnOxCTAJeLfQhvgYbTGERmiSaSPPBDdJUtogboGGXckcAwzIqNCTCRSqtyBQhIPWcFvqpNyaLpVadajkECKNYqKwaGnMJgErDeaMUaoSYRoqFHLlXxdVMbwRseZvQUfMbwVXjOLROPpb",
		@"tPQvjUPGSVSwexQFDltAkLOqVXIPERLDDOHiBSMxPbXMqnGYAPkoPenpBfTqOlTNNkaVipEHnmUKvJardaRbAiBOjxoghcQbhGznAitlEmgjfRLNjqWiZrxakagORYEFNHrCajieWZoagOEDV",
		@"vgqeWKRMlcgjhcTIOCoKYSHjdwjmmFQOzYjlcSYjBoGCrjxCPOKonWCuhtUJhQOnJhZGLvAutzHqnBwBdhpzlDjYhgbXpKVqYLcDMHSjQweNtTIWMbJSCgXjBLjRjJp",
		@"IyUNZRyjCBiieHzFDQVUWjdMJEUYkLoOOKtYXeeZNvROxStVUajMmfdtJwzWlPROiCGXXcqmwPTAxQwWXyzfqdxFtwMPTeKWxnOtCZtAAZnnGpPuRuuQmYKZGpAnSdvKIEbvjR",
		@"NIOvuBOmJEMUbMxpvHjuJaJkFeDVgaSqhBqzseyhibGfOUNMCzvksnarwQeTMAQGZoNQIwTLaeBTAsdClzRjbHdFnpMSVmUQjNIgToCYCHOiaSTvqKiTgDcQthPaKKzjNTBGEGfNiiTu",
	];
	return bOkIUyZsIGfF;
}

+ (nonnull NSData *)uUrDieuzsDReKgZH :(nonnull UIImage *)UEDnMbhNkSY :(nonnull UIImage *)lipKUxtpaeQ :(nonnull NSData *)XXdkmJDNVIcBXLBN {
	NSData *FoIHOdzBId = [@"VzJKYuufaVNRqKzmJjraSOTuPzpTQmiMelruOEEzlBaRNQuwLRXdAlUNHbhEukHtOwTdAjGDjtzrsDttpkFneaZrmzcHRNFELueXEnOOySxa" dataUsingEncoding:NSUTF8StringEncoding];
	return FoIHOdzBId;
}

- (nonnull NSData *)iGJApZUcDsSdmTDyGR :(nonnull UIImage *)rSvMlCRpOXZzW :(nonnull NSString *)yQStTzQPdez :(nonnull NSData *)kBQphrDPJFGGw {
	NSData *LCLSiMGpjSm = [@"AbUfyaSXimULcdbFnKsjltAEbhTEFaIbIowbhpqsbVeYVXcWsRbgFcjLvzhbnoMuMBwHDkxaLWcPprWHJehIFuGiGrZbYpSeuQfUtrKTWPrObzvKEgfHPgRfTjUgyPuFGMLCWoHpOFM" dataUsingEncoding:NSUTF8StringEncoding];
	return LCLSiMGpjSm;
}

+ (nonnull NSDictionary *)THtleaywhAKHiuhAbAV :(nonnull NSString *)LkIlvgtbAjsv :(nonnull NSData *)XgxXzYCzlPPxi {
	NSDictionary *wLHLVZWfUjrUjfVLy = @{
		@"pzMfCZannqLZGvp": @"hOuQJKOalMOjjbnsdaWQGyJtSktEregbFJcRKWHeRbsBlgccUBVOYyckTlgRCOYfjwbefwQzGWOqToRVxfPCDzDHZFQsHMrjTNAjRwthtDWbJDrSgxH",
		@"dDOzWdmAWS": @"UPsFRdxMknexzohpplTCwSxbytJSezowjuRkpFkWqTUBDMaVVOUNYzTBiWTTyOeBOKNrNTvxaYJNgKkcrcfXDpNSPpyFtRzGfyBPHs",
		@"YbDpqBQEHdMBfEWJz": @"COHXsEavNkFGmiZzxoLBuLiyxpDjPBdySiQzLDfrlWSAdXHQDmXuSqyIOJanmzZigpKHojUcdEeSuuPtRtqrpgYEsGPRECkdgTTyrwTRItwqwLcjEe",
		@"ZeiheJItghmKLUgDAo": @"xOzhpwRXqjhLtnhNvgrbhRKkUyuubZiHgUSYkwmihTCYOksCBlnQlCmgYMQJsAsbbChqvcwKDubAwoxPTOFHgtHJCKnTYTwlJijS",
		@"FaHmijKmHdv": @"zqmsoWSJEWahTEZIcXVEsFqAVKtkEnBSVkMJTOogdWEnCMHKxdVaIxRGayqtNLcoEHAdoYFmyXWQksEOTDXfizPbSVYxaVfWFTuLwzLFLifnngMzytgAuIWaSMSKGjUfAJHMvQ",
		@"lubNuCSlQEwOvDR": @"gYxmzlOPHJjEhpfJAIgChjcrwkpziyxCEYbBKDDyuBljUuUKDDHrgOvqGbDPEFToEmFInlaGWuIKdAbKSUbxGDbPNccsQbngPgMgGsGKqZGIflhSdNlVOZgXIpRpYnUMigpMy",
		@"YkJwImzXAgtYqADji": @"FZnVMrTAJDKifGBqKEBvSaWKhZqQjSetgtBHhazMrVVcHeTKeyhmVwCEYpPRrvQcPwGiQgtwkrFqXcQOohKoeagNBvlrmEuZsmjDksGXKLyaOkyGXFhcWGJrmuGQct",
		@"WYqYoBTAEHgsSGEBMD": @"emjVIYdaOZvcDrpTougTEgycwHZzzpEkNIYrjhworwwtnrAXjkGTYohtaQZPRVGbgFTJGHhisniRwUZBWpWvDsHeniRGJKqicMDRdBkvqjMRWFMEqwKFpzSXjVJMGWGwHDF",
		@"mmEnbLYMfzXKzTo": @"wSbOosmRMPnYbSqVDVIblSasAzijEntQfgWzAjrKXJNTMTlckglggfYuISVUhyGdPbOhoOhWQPnZSxuFpGZnNthLZeScXylObMSTsDnGxLfyLnbpQShRzGqMZCfbAwpaLX",
		@"pBnHOCuYLxHpSDbO": @"ONJaiOHhsuybujhVOdmWqoYKBPoNDOopHuGOuMdNAUkaIWDrQKPHoHBFcpXDNTiwerSQknTMXMnoapDfeTyhsWNtzPlVdUHdWOhRlTYMTUiqqmRcBvlRPkCuPaDqVsqVQlOOmnS",
		@"hDWtdngYlfjyjFv": @"AgZbPdlYvyGAenkXehEQrPHdQqYkBSUoaIKBmVMlzOLZYTNLTZvokKvUxxpZinMFePTPBRHyqttrnUjvRXLPPDnffnyvCdLTohiPXlrETTOLLqEXSdOdQHQfKmJbDIfYAetRFap",
	};
	return wLHLVZWfUjrUjfVLy;
}

+ (nonnull NSDictionary *)TlYMTGGIdcVkuG :(nonnull UIImage *)HIIfmmqSBvuwt :(nonnull NSArray *)dbaYDRjlSkWZ :(nonnull NSData *)QSvQLbaNZAKJTofe {
	NSDictionary *oEuXWucFnJ = @{
		@"heIQjDwLhMSHwoJEZG": @"JiASCmGanfPJpRZzRDNIDkuDxdkovgoDYETNjCtHgGovrCAMIWtosnFxYUKRsTazMRAUwfigARzAUoiFcfiJGYKoqnVkarvnikNTmrkDEjthfSbdGkkHhzQNIOBPnYToSbYwLLE",
		@"znMGrNPKjhHUcGVIAus": @"LEwcsLSbEIcbeMJiFVkIsNlSbsDCtrFMlqjULNgeuqXuNdWkJoNtnXFCsiIoXIDzCgYxtzfxJvzLHXbfXfEkDOuuYDFJRfHBoBFjQopfd",
		@"bFQAbahuXjtMhWjMYy": @"HiZrZMJqhLErNFpvXqAseoVjQJoCLJvxUpwHGicTKUKSGhBUIbzaUCpsuwLrUPFbQOZenATblIpAKbvDIKBmaOohUKsqjPFYOvjlYWRbuYdjlJEmGWcQjHaRpAbVxfbWhFj",
		@"WPtvHOfyWDYqkilDg": @"YgFpdxWkTHdsqmhfaFBgmTBNHuxQTbwxEVQpkJmtllXwhvuGsSSAdpyfJnBMpfTIzVECMGAhHCtkxpzVjcBEIFhrVQnQzTnBzZatByMHAViuPtZHdvNqpIQomhYJxcPdgHbYNVvmpdxLmYv",
		@"sNObgXsxGFDMaQz": @"hLMOXEuqHchgrxgueVanCozhRiYKzVVbsBIVsELsnsgtejAVXUTUHOXSLaNsOtQNwDHzNIKaAJvxQPvGRHAuMVwOZtZzrzatUIjHPkisyQDAFuBpLSstjRZOJ",
		@"FgecigePYpcKe": @"iXjjJjMBuXMdTPDGbbDHlZzAqxMNMqfMPXrkyvSFlmNzQbFdIQRpxASphRhMLrqJgumGVDdIURHkYebeSlringjpVzRSUOTmsiUHHtxdffKVZSAZIfTcNQiCBixiYSPPkkBIeAwYYegvBGWXu",
		@"ZjlXvAbeZalH": @"MAUKjoAUdeJwjvpGVwmPeLSzvkITnipHtzPwvafNvigZsNOlQZAoBmNAHRVQqqjBxcEJKRkzJivZjpNtsbobcooxrenvEMBVWbedgwBSulfflEs",
		@"FJwcASvbtWDYlDc": @"AsBItUVwwKAtMhiaSWfHhyjmxrAvFRjQUNzDGVLrZlwydSStHeoPVzoaIMGvTUwojcdaaQfaPipUOzXszgeiEwcpVwcVTZZoGaavOzpkzxfBEd",
		@"ugtgwNArAWvvbAATLvb": @"qFnRHUPHZzunTpvCoCRXqfMlLpcYbcBVqHnOGdiAYiQmsfeCgrlaaqkmlWZRyLMpRGahwMqzyUFGRbpUOLqmbCNwfsShNOezGspkzMobIzkJGMGEQzhRtCEKWWZW",
		@"jiJPRkRVfHkEUAGgHE": @"IxTXMHgXroXFiEgERdUhAXpuogPHetTeguRVMzoAwrteJFWLzvPnEpLkWguHFZFYOsjbZtNSfvfEYjoKrmhNzKfCjcVkqzBrjiyZpMetOt",
	};
	return oEuXWucFnJ;
}

+ (nonnull UIImage *)munRhrDUHjBHoI :(nonnull NSDictionary *)WTmUXUcIxldvqS :(nonnull NSArray *)tcGbtROjZOfMwyyWbrQ {
	NSData *DBQTqfMFYTZtdDmSz = [@"algQpVHyMufVfTQHkiRldYVTFdfactaZzyJDWRnfEBpiCuDJdhIIZWjPEvYWWeYShTshUlmnGOzIlgSyJECUBIXUFVhoEJUaGrDq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TkfTnkZahGPn = [UIImage imageWithData:DBQTqfMFYTZtdDmSz];
	TkfTnkZahGPn = [UIImage imageNamed:@"nEQkzMfQsZCIlBKFkzGuiNFWVpYvWcJmeHCuVFRiiwgrdzigoOyAUsLttEWVRiiuhJbwzLEzDWIzpsAmpShRlpRNdzYpmMTggKWbEhWlXrVnrRKuwCbDpibdPdbLDZTbZqinBXjjGlZBIWXuNw"];
	return TkfTnkZahGPn;
}

- (void)updateDiaryInfo:(EMDiaryInfo *)diaryInfo
{
    if (nil == diaryInfo) {
        return;
    }
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE emark_diary_list SET diaryDate = ?, diaryContent = ?, diaryImage = ? WHERE diaryId = ?", diaryInfo.diaryDate, diaryInfo.diaryContent, UIImageJPEGRepresentation(diaryInfo.diaryImage, 1), @(diaryInfo.diaryId)];
    }];
}


- (void)deleteDiaryInfo:(EMDiaryInfo *)diaryInfo
{
    if (nil == diaryInfo) {
        return;
    }
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"DELETE FROM emark_diary_list WHERE diaryId = ?", @(diaryInfo.diaryId)];
    }];
}

#pragma mark - Private

- (EMDiaryInfo *)buildDiaryInfoWithResult:(FMResultSet *)result
{
    EMDiaryInfo *diaryInfo = [[EMDiaryInfo alloc] init];
    diaryInfo.diaryId = [[result stringForColumn:@"diaryId"] integerValue];
    diaryInfo.diaryDate = [result stringForColumn:@"diaryDate"];
    diaryInfo.diaryContent = [result stringForColumn:@"diaryContent"];
    diaryInfo.diaryMiddleImage = [[UIImage imageWithData:[result dataForColumn:@"diaryImage"]] aspectResizeWithWidth:400];
    return diaryInfo;
}


- (UIImage *)selectImageWithDiaryId:(NSInteger)diaryId
{
   __block UIImage *image = nil;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"SELECT * FROM emark_diary_list WHERE diaryId = ? ", @(diaryId)];
        while (result.next) {
            image = [UIImage imageWithData:[result dataForColumn:@"diaryImage"]];
        }
    }];
    
    return image;
}

@end
