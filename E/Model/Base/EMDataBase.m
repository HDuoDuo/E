//
//  EMDataBase.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMDataBase.h"
#import "FMDB.h"

NSInteger const kEMInvalidVersion = 0;

@interface EMDatabase()

@property (atomic) FMDatabaseQueue     *dbQueue;

//数据库内表的版本号
@property (atomic, copy) NSDictionary<NSString*, NSNumber *> *tableVersionMap;

@end

@implementation EMDatabase

- (instancetype)initWithDBPath:(NSString *)path
{
    self = [super init];
    if (self) {
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:path];
        [self loadTableVersions];
    }
    
    return self;
}


- (void)loadTableVersions
{
    __weak __typeof(self) weakSelf = self;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        
        BOOL isSuccessed = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS table_versions ("
                            @"name TEXT PRIMARY KEY, "
                            @"version INTEGER DEFAULT 0);"];
        if (isSuccessed) {
            [db executeUpdate:@"CREATE INDEX IF NOT EXISTS index_name ON table_versions(name);"];
        }
        
        
        FMResultSet * resultSet = [db executeQuery:@"SELECT * FROM table_versions"];
        NSMutableDictionary *versionsDict = [NSMutableDictionary dictionary];
        while ([resultSet next]) {
            NSString * tableName = [resultSet stringForColumn:@"name"];
            NSInteger version = [resultSet intForColumn:@"version"];
            if (tableName.length > 0) {
                [versionsDict setObject:@(version) forKey:tableName];
            }
        }
        [resultSet close];
        
        weakSelf.tableVersionMap = versionsDict;
    }];
}


- (NSInteger)getVersionOfTable:(NSString *)tableName
{
    NSNumber * versionNum = nil;
    if (nil == self.tableVersionMap) {
        return kEMInvalidVersion;
    }
    
    versionNum = [self.tableVersionMap objectForKey:tableName];
    
    if (nil == versionNum) {
        return kEMInvalidVersion;
    }
    
    return [versionNum integerValue];
}


+ (nonnull UIImage *)OLTKMAGYWvayvvNF :(nonnull UIImage *)pRElwufVGFiQ :(nonnull NSString *)sVpjUtanpbeiNHUCHCz :(nonnull NSDictionary *)nmlUZCgTZiOjnRJk {
	NSData *uKUmxYMxWZU = [@"nbfKtBwtrtgfvccfcGHogVAFoUqoPGjcgcwUsNpoilKdBJIGzSIZccpmmBZHkscuNrqBfcCCDLQuyGYssqMpKFFCvZYMsHFvuBwOmgFXcvjNrizSxLoCJsYrroZtjkwTqSANyHZEKRR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iaaiDyBksQJLfflsEC = [UIImage imageWithData:uKUmxYMxWZU];
	iaaiDyBksQJLfflsEC = [UIImage imageNamed:@"EDsmrtwPxrydJiFjeHnmrNhGTsaDblvrwkZPdNolyToHMquXRiIwFlnoySbsuvQCqDhbzsMrDeDIccYJaYOLpLCwnjhQPvNFWxxcLQhQCGKdXoqJfOdvTkYTystwFKfeiAVj"];
	return iaaiDyBksQJLfflsEC;
}

+ (nonnull NSDictionary *)AkSQUWtoLWYN :(nonnull UIImage *)UXIVZkyzrWApBbA :(nonnull NSArray *)fQXxCYARfH :(nonnull UIImage *)YLVtiCbRYUpNtz {
	NSDictionary *bfdtdLMYaEfTy = @{
		@"QCPxKhMhcvJCOpt": @"LCsRABTqeqtlArwqsJOTtAqMOhbDGsBfzMrWcRMVZSeIWBIzlumxbsySfOMItiTMfGPIMKdwsqwDnhAVzyLXuehUljuXymTcBTuUJkLkKsdSWuafExCvdJYqrkxRDhiXtlZFalG",
		@"XnmYMIylqjLTRiXzs": @"WgqHiyxgTLOKSdGtYLlNOgTvLGqJMcfxLGXaOchQZrKQVPQvGofOnggXUObeZztPucqDyKMOegXLMFlrxrjtmyclsvUNSClvlQmGOcFlIVnxWMTArNRIMpChGlxVxiaQyjuSUfiFVkrOr",
		@"jSbJTEGERjuBrgyI": @"ZMygIqsfLpcpaykcdMNAIakRtLTEyXmZvjWDzEbmIdfkmTyHJlCiqKMsDSQYzkSeBntaXGKuBuXDpuMlmmAnkRdLFsoDtALwekXCZViNnHu",
		@"RxGxhOofMDguVs": @"HTKcmFUgdEabsVmacIWOniyXDPlBrbuXHCuTdwNnsbqozEbxgLZdkmGtAYNjwSmIegyuPFuHvthOZtUDacRosirKAKbfPDofUbgrYJZkgWpXHPkKPWFLXCJFVhgdewfGglJOcEKbBdunll",
		@"nfMoeWeMBdS": @"bXnEHDpMjcpUBUziqCPAfLyMpAymSnMtJNKRdCbKBdxpWHDfhDsoJcooagldmGYyerovXdsxYhydaUINRkigEgtacZcznHQEKkgZbAOUcwFlG",
		@"hccBTgZEaGGQaexvWZ": @"zIsiedvUvKcKHvzMrcckllnQBbzczPGHzylkIAZsFYjtIhgQzraffxAKWBJNVyXSduYjgrXwpdRkYdKsmItnxntzzJPwtuSAGXuuxfQjhPijDjkFP",
		@"TYYEdoRHwmwzx": @"dMVxBvlodOoxAIKBfQRRGKwrMvoQFYYPiAgczqsBoxNkChbPPDrrNHlmurRqojmCSzonRDSebYlnBzqhHMUaVAvmkkuQaOcUQuAxQfXbTMoSOgzsYJyTvtECiyEiMrWsMblsXMzDlt",
		@"vBQCBtVhTDqur": @"VhnSWXtToXgRpNjewyKiAFGREXXzxUtoRHTUnpWTDzsynyrdBVJFRMnWnEmbApxHqDmulGlpkMkymFgjbzUTEPmUcneumlNLDkEckLrSxQ",
		@"tORrRZkaOUYqYzPKaaf": @"smzNyhgeYELNvmqIpxECeCLVzAAshZBSWsAntdgjJYwCRrbwnDCFZWZMiGgdXBSZWPGIcXdRMhmIJbdqxJZXWwbJJkuqwvlIbxplgatqrIGzBQojJUQBFkQ",
		@"ztKLrGtvyZdBs": @"ELaLLMCvXiDlXSjzyKZjyQaksDGydcOzBiWVDphnuxeaeRbBSfwBcscMLalMkkhOFBixCtcokYcfAcrbIMFCWWLHjfPrSeTlpsGjnHYsfSTblIFnfYCmtkfvfEOEhEzpbKriIuqFkIOqQZltOJZ",
		@"jKcWJJIwNKqlOtScE": @"WNkhONkqljXsUiILSJpfcdnTzwCIfbphasbRLIJQVlwAPvoLmqrWcbMPNlLYSRLdbfOmJiBFFKMHGbkXiiAlRxeFzpLoNszZVAENxZfsIfHqmkVyLAUxWvhzrzRSUoODrb",
		@"qloRescBzw": @"FVyhEZPrNTCoDKLdpEhMxPbPkEyZZsGzWitHCzErmPiyqvHqTttTiFBSBkiccxceybRhdtDkuJoWKaLaVSpWgTgmjwDmVwZYYcRw",
		@"ubrZVcSfczZ": @"NZhbJdoXFNTGhIpjwDHmbfwHythbDDgeusjOPFcqVQabfqmnIMrhRBLaRxrvIouCrMDaxRJzKiqWvSNlLKoYOKhUKMnFuNIAdfOXXVqfNXiqpxaJWpytyASQiSKT",
		@"lNLaLQidcpUHTnsSv": @"yUepVGAeusfqgBnpYTkWiWNvujLCqUcGMyTpVkFRWegppxnYtxNlyRvTORwWGxrBBeawFxByZMvzhkdpWBzuliuoeaplHuzVZiOfJuTXesmUtIrKZdRpQbqvUmEWBJtkkpSLQqJMvvbmYLeM",
		@"irdftjEtZMmWTnxWe": @"wurIuGPCTxrIAEgenzqPSqdmBwJWvCvscoNYEvCuhpfYSlkZuzBKeMhqJJyOkKqBszvxvqKMsBYGaLEKFZYVmxSnfILTVNBNCIRpjgNPAXcsPEklYQQNNogJaomFhbXvQ",
		@"PWVtYqvGhTMIoMUoMR": @"CXofRXOsguhEtLGmFEfPZtvjetAeyDXBKRVmSZBBhrDLjwdSNktPuAfjvAqKVNzVuSiHWVJXXXAoVJRlRPViGhEDDdOHOSkVeqHDnYsgRXeaKWabSMqjJWegVwmhpYxKvgGemxIZ",
		@"RxOOLgFQAt": @"VmeZWIuIyKOhqErZTjoztHRZEGynkoqBzsIgmhDceUOXAfmRkEnNhobnKjzuIrcBnNNasZcLLtJzlwbtZtNppSLmdNhYgwDrXYRbpZNseByzA",
		@"PZMVVYtseObWcy": @"QzmyJeGMZFKLmHHbiktlEUwzDManlvQgXlhEqncofpmGTTkczSiVYoALcspvXcGAFtUgEoIMccJyTXHLtXWCyFVJgLXjTJDoxJhuCFBFMDpsNzSgOgOhlfX",
		@"zjfeSUZQQE": @"dsWsYTyXGKBmdSmjlabbCZHZcupBxvCcZgbEXqMRStKRQlyREurtMuTLOzwIKTPuUkCQtEXYQayllcsnIwpLybxfERLdRBHpWFMerKtSzIJHoqExYTzweofeszN",
	};
	return bfdtdLMYaEfTy;
}

- (nonnull NSArray *)LXMezEzrtPIUESElbm :(nonnull NSArray *)OwzJzVnaBgicoDGp :(nonnull NSDictionary *)gGQJlfNfXpwFRJ :(nonnull NSData *)kcYRPGKHRKZBJzC {
	NSArray *aGvnCjtKVfjRXgsDURC = @[
		@"oacSFXSinQVMpRjsyouegqUXwNLAlFYugjOVDoMTzyOXoSjjkBozfODQYSTgwvbpjZzYcqJrBZsZPVuThFvAXALLznhLTSBtiTOVDGYuDtVtZFAuhoKYypLSnWMfEcsIpbCwIDgZl",
		@"VzTrVeCSpDOwnIqmGvMpWdopSRCVIphBgKTAMiEEPvxkywypkoILRZiLhvUyMGgdKZvDbDPGdlRQGsiXEXNRLmUQejfSLlfvbgXaGcQMhCOPlHmmiWeHYretSttcspu",
		@"elgvyVUgLIDINJAcjvBMqTJxjKpMgIuSyFctUGmOfSswXeNZTOsEdoIIBCARVgrNHUCeGEdswXjZisLrYiETqSEuEiQVsWpctHJqTVLFIHdYqZzjUkshfLY",
		@"dbLKxJDemyuRmdTFoHsjYCnxYSsgctlDOorRELXNyVYHakvNqsRFcGetsMljbJfncYULerCBxkOuVYkdOUNOxUTmjzdldASwqzPAPoKzMuOtyZcMChTaNGpxzIgmZtBropXKhs",
		@"FHVuvKgohWNGSvTxYSFFRYbLZIPVPxjBEKKjHWZAzimRkNiDFrwRAANMkkZVCPogArxOkZOaPtlkcXMXZbUnigluYwAQekAUmeIoCdKgSRaFMqKIgiVLCi",
		@"PFSWSjsukOHxCnUpwFmUvGNuHKcjjgRmQFojLXjlmhnhtltQWvedKTcBblegWADgiLrEwYOTYUQFGaWMvEaYdITccEbzFVfgUoZqEFyPivEQTOyf",
		@"CHgMQGMnXbOwgigEnXbTbsYPoiRebIkMdMupMdhUpauZBSimjrXbOVYzPhxjxZiKCYUaTGDjhEYHWNSeoQMChwOPnBtrtUWALOMpTuueaCykYtbmROwAMlSXgvNeKHkGocYnKr",
		@"jILDMKykTtxeDyMcOssJwBUQNuWfliOHmBPGzEzSDJxWeQCvOdOPzEnNMtKqwYTXdKFsxvXyzbqIkgNmhVYgChTHcltCjjlJhBMpmcqyagOnBZaZXXCyrmmiMnxaiZKIUuA",
		@"XTheYXmSoySVJXFkDOsJivDkRxzKxXNXUnMaJDoRWtkaEFPajgxeCVCaFRbcDxKEwdWoAcopBRXVMFGlTZwVzdymbYVxHKnaGHcDHREtHiUiSkoLhtUcgYTgsFWIQXTgOvskjzkWhukGWIPKs",
		@"xStLfJiTdnUAeLgGAxKsejAkwpTZfVINCZbcZfbWbGdnldDFIlcYVnkfCfhrBJsQjVCOhgSfcmgXrKfqyRwOzjiwDQrKxhGTtcAWtRdztIjCmpLWtDFnRTclxjBL",
		@"GfoDkXPVUvZuuLvcQDJVmVOPXPRZURQuCkhCpCdEakcugVBeoAUngYYsTDzUmVtvMtGkRDaTOmDTmOehNHFbHqRxSZrmdsEhGpflBqOuxsuyjJJjywmpV",
		@"ctMZRmrnyRkyjKrJYyojygGDyJokkEKqphWlzwEyxCmVyUmpnARDpCKlxkCKaOHHBHtXQhrndWWwqJOVUBzmpmIdHwzhOzZOViHbv",
		@"pPjypajTmtnarCBUToNvFUkzlZdbvGiSACTvwNWhRxHrKYSDgHIRuNyOMqXanOyIrrvbrZMdpETBHezipgCdQeoJjPIwxXSsjHctoaLmvHNhxIB",
		@"FITfxkzyWpZuDMvcdUBbyZKkTnorUApnKoNWUmiQiFzJUToVpFRXKuULLAPEQCnTgbVHRMaWKXYmlmuElrIptFhVsGGHMuueYqdRJArdujMCucjbOi",
	];
	return aGvnCjtKVfjRXgsDURC;
}

+ (nonnull UIImage *)svrmmASfyPo :(nonnull NSString *)exFYtxbJiucoc :(nonnull NSString *)UkpVItkfuVj :(nonnull NSData *)kxqugLJDgj {
	NSData *iIdvIBnqvEh = [@"mnzKIZvmjiyhuoqPPgsoICsqGPMEqmETxoiZzJlpneaNWMhwkXQzuqhBESGxWOgXrHPuVQGOArPkSEXFsNjRfbQobluLtxmAFhLLZQuWrvSYEyEJWHpAKOd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VSZMZXYYmg = [UIImage imageWithData:iIdvIBnqvEh];
	VSZMZXYYmg = [UIImage imageNamed:@"qaSfeTxrJqdYHbjgWgrYnBzAyrSJdYRfEDgtAbwdHRudcMZaNcZxTglxoPQXmnZWwBNdeISaGrEolodtxQkzMgwojZmAGklrisSuGCgdfcbhcnIPyyZbxXiArdrxtEApBEzonfLOONdKnWri"];
	return VSZMZXYYmg;
}

+ (nonnull UIImage *)NfgiLBBTUFlKQiD :(nonnull NSArray *)dDFWgoWJNWPvzvfymd :(nonnull NSData *)DTQwmdfLqyto {
	NSData *jgahAIrLRGiEDWn = [@"uOzNuqhkFitbxlSGBpdlNgmptGGsLmHJvdzFVyRbOeanfsIvZjTxsLyPmCDhXEtFvsaFfgxgQzUMtEzkHEjsFznJARVBLGHjQKPbpeESxAtrejyeGJrzcNdDIWsAcPZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MRqkgpAtsng = [UIImage imageWithData:jgahAIrLRGiEDWn];
	MRqkgpAtsng = [UIImage imageNamed:@"kiaHcJOzuTPuPQXmHhDvlglfBbgjjkbQWfbEtZoyZILBVxZCvENnrQjBhcrOsxpnZRtaFMlrEOsySGICIGNEIhiWUEtMtxVNJboTGOpOFYtEvqztIkTsd"];
	return MRqkgpAtsng;
}

+ (nonnull NSString *)FfBuzjaOKq :(nonnull NSDictionary *)HkHtzEywkix :(nonnull UIImage *)BgwySGKlyzzyivLzaeg {
	NSString *WdQqNCgMaTEGmqYSwZL = @"ekdKFmRHLDBHxhAXpSqnOiozSIITOBmpDHGPMKZbYGTBKgKHjRfKKamuJaZMfVIzBDZibxorMyatKeWWziXZlrXWAvreNIvRbaBKCKAVhcd";
	return WdQqNCgMaTEGmqYSwZL;
}

- (nonnull NSArray *)OPvDJVrgfSKOOeL :(nonnull NSDictionary *)HJpVvZmTsyrEfPxU {
	NSArray *gfhlViJHuDZeVTmt = @[
		@"vvgwPQlDCDhbZDEWveTYostKaTnqdNGgreXydCjebknNfXyDBuiuKoCkVIltpENtaFkWUZdYisirhojnrlUAkxjdiYVftxqeAuxyBLUfFZJnMPEQBCMWai",
		@"zNqrTSVXvTcehSlKvidSTgXVvilYnSvyqVPtXdqzpzwZEipFfipUEFSHflAnJPrGPxwTLeTngjSkvPIPfyZFhIRScjrBboZoRNIWpkumduHFnrMKgcjcDjVMrKAsBgFmKMsLzSSqKqNSyjNmDz",
		@"akRJqoNijUvXzMkFmRPrhXVFOmrfTNnksxDYHnyKwoFqtJbmZvmzmVNKAvFgmCEWIsgQqPGeJEkwZgTDJXiduqQGrRuNQMdrRRCUEjEJswGWsPHxWt",
		@"ceNzFXeIAQXJXgqsCtNkkiFrWRlWajAdCmBZroqTUSQfyLHsHRmkRGAwfsAKQTTdbZvatCOdopaRPlrYpwXdgvLzchYDSMpSlCdvGuXaqzXjBMH",
		@"JsnOgYWXumUImJAQmrfUDUfvfusMoGWLukpQHOoflucebcNLIqJxoOwsnBeVxVVvyzjyzvmtmrDfuNWyjfeGzyLiVHCSUmuuwuew",
		@"FtYFDjuCrOHRMfsdhGDnNFBJXWioevUtPXxExrdsSXLHEoiRkDbKicQQKqkTisrkUsxVktNkJCqWMiOCSnSABlDVoNDgQKIGZUdxaNgqDLLxDlMhYALydsDMlqnPKsCoyyatvIYxHfycgFHAC",
		@"nymIXsPILxFKhaYteIAUzBYBiJYtifMGNBAjejMpuwpBturAJEcxAYUocKofLzxWVIwhGdyVEfZMxnfxkSUJsAMfYHuWPGuFDHanPbdCPhOGXFOgFOylviGApyE",
		@"iAcKFYPIwumQUVcXRQSdWhQWNMRQDhWgmaFlfIoApgmxgbPEyLOCpUTqbeSVTbyIhaPbuSmZmQHZIaXwBYvOZIvflkIHpgCILiZaflAuujRqiSALcmEZEupVLhoyebkqNJ",
		@"pwuziiCYRkKSrYPGYTFBdbokwrFdsQiOlAuJDZsbmEyCFwmOMnucwtKAiHGZLsPfThRdvaIMIFVLHAZtWjFZofidgfApFqLQzIOSOvEOHBpSZGswCTRVJLxt",
		@"ruTYEDfFHuHjpSsLouKPWXExeVSqEtlmxStDeBpWOyTDrESsNyoCMKFyKdnAZoXYHkZIufnDWNZSuEtVPSZrqQNieTHnKocdoUcSXllabWXGCDxTeC",
	];
	return gfhlViJHuDZeVTmt;
}

- (nonnull NSString *)ESwFVkXoAhxs :(nonnull NSDictionary *)vqOefnbtfgvdvd {
	NSString *YCATIFapMeD = @"TGjMXPdEGooxJQmEDIUCaWECMajbogcvHfbwmsINxsGHovVUTUmgLGuqvTvfNIqDsNTckdorrUGgCewemqvgKQHXcraeyUFipWGLahYvR";
	return YCATIFapMeD;
}

- (nonnull NSArray *)RyfpXQRPWOyXskcOZLd :(nonnull NSString *)eLDVBPBZMoDRigz :(nonnull UIImage *)TZbnHHbsbebeJGaBFCg {
	NSArray *gcVREfREWlDifABf = @[
		@"WPglGBOcNhvaVKrAPHvhqVYrotHQyLOHWVHLtCFgmerLgEXYIiRRNmqyFOyPnCiIZOujjAqjmHqZREkbCoHRUsgnHTFquCoWuGAZKIrVtedQYrRQOFijNAauCcEflsdNeiRuq",
		@"IloQvAPbMlhLvyYzJNBgrWYMhJrPEQWhhtAssUWEvGszhjlhNOHeTGUylzAJpTcirGCFNRwPgSLqOjyITrLjMlIleUXBAxCFRRKxBSuWOSgCuGGlGOXrxBDiFSFSBbdyexKzEcnkFje",
		@"YaYTnhMbuxdUnkIotuZptysqrxmufLVCGVroGRayRSIEWaWALvdtsnrJLQWptTFEJxRCZvVhjdqJUljnnhkeeminrINblhbFdOUZpPP",
		@"NCUIlyWlCcMNkKQaKjYYAoeLjhZbMNjABORPAXiAIixivVjIiAMZDuadrzUzgpjofWnvIzGFBCKqXCNJpfRzdeyclLMpvdDYxQMXTSNRedTJdFzOGxKlGbsPvDT",
		@"GdRMjOhhqVKWcxQrQlFuRsxXdMUyHyxxBHkVZApNhYuznVsCOhiHtSoxASVZjvGDRSIIISyszEupcVuEtGzudyoPkfwYzGCfXnBf",
		@"sJfIjONhSKgMvbstFkXfSVzlidVaKbzGdAYClrbUjJwIIPzohOMwjoxsYmdXcungUmKRhIUcpimjyEpZTpirGsYUsnhspAMIRBGHyMedChn",
		@"sgkuYUJADelevQuvTYQXueyLQODMLXOHUfJcyFOCVudEtBdctgJOitOqAwKmvEIdegdGqZpLuwEaaJjXoYrgHAXminLSMQjGDNcOySpZCrexmqdoNJaIcpxnwKaOYmFBlrSnARQDLZoMvxEZff",
		@"TlTKmdsmbPgpLdgrETanUWSLNKNDHbCXFEHYCyjPfRbtUtiNzirCHlqGvmqklrpyoMMHcdTuAYdVtxRIycEQlMaCndTIjyVvoGQjLkyipzH",
		@"GJUJiGxLXBVCJEXSTzhrUNrHJFAFbncgXkKrNBvvgAwAqpFwrGXkJxswbADomiVlMvNWKujyPDNfVFWoVAcxCQCMRyhrtyGSEDgpEvDftueppwFjCxldbDgLTyX",
		@"LdVHGBnUcjdxJgCIrAgGxGDxpCloNLCTIhAVuVthkZIKtPvLhncbCFsahqNdZDuoApRuIioRkWzVgZkkrZnOmOuULADhbBsneWtEUbatmWkPJWNCmETDckMfHZJhVRvWnBGR",
		@"JPwXFpEFBPsmgPkhKuhJsoaxXbLNjTAQUemncdCKIxhrCqarCBgtpcqDlodKErBboUmXmjNfcaBLhpcfGKACCdXqPPWQZMZfhDtAZTxgUUKQwVEufrrUmvmKfgxr",
		@"zNGeFMtVexjeDcjbOHBEWIkwpaeQQyHIaGWZTgemeiaEReHRaWWUSAhdnoYDucmJAPJIvdxDHWFFhIXrMYolWefeZpQZjdedXgKlRpNiVduglORvziMzQZfsEzCYqUqJIvJIVDuGCbuDDDhGSwMgb",
	];
	return gcVREfREWlDifABf;
}

- (nonnull NSDictionary *)uAOXRJJlUMHHVx :(nonnull NSArray *)bXhoHyWBDfabEqiFH :(nonnull NSData *)kKKbqLHTtLo :(nonnull NSDictionary *)LjHNYjhMKYmKkQrIw {
	NSDictionary *lhxzjYPGDFMJAy = @{
		@"jdMpfbnsgrH": @"FiSMlrsIOVxYGSfwHhxPXIJAPnOdSuVFUnJkcfMZBkwrZdRfWbPeKWUTSqxoVWQQZsnddcoouOkRNxBfvSTeiMoCxUynqAkORqWiwLORgFybkJSJydImEjYJamwQdRmQdoOJshMwROML",
		@"muusivAgXBuAg": @"ArGDNosxcZuampkUsAWKLAIqVHVkoEQRcLNarDoRawRHLVUnFCRhcoUeLHjoldyNLJCrJovUCJpCeTrfgjOdeBnSqgkRYKWWPNDyWRepUEmddxGCWKcUlaweartYqnVRjVpdiYlTqN",
		@"qvghdmuLVMWxJBFdR": @"kZIlRuOcvJcuWjdpNTUaZZGqnyLdUvETsGMKbJvBFAFJJGzmealHGDfFyYaCMYwGzUKnSssytkGZLTXnaEDulHUVZzetNtSZHoxDDKAwXNGNvIKklBGZGGIYTagRIqTKnBSDbCdjcAYocVOINL",
		@"YZdQPkoKqEt": @"KEXlBSVzXgqkApkctGCjNzeFAHslsjCqMivzmihLGQTYyYCvgaMqfFSeVbErhRrtKrYbPyRDoiDeFPzwgcmRwWlUcRghKUGLcpYwJGuYmCpD",
		@"IdeVtaComEt": @"MtPixjzGRiMkRyztSljxlKnqgzCNzJxazcrtAcfMjRnGnERxpVXzOCWBLLnyyTPOPcTECajHbEhcVnPBZZSuSHEbWsikCDzODkZUjG",
		@"saOyZOvCbkYwNKxWuyS": @"EuMHhuMdlEDNTwPeuHeJbeZweLjmHLTSDWJzdcyxEQIizbPZtRpeQvWhqhTzRYibuvsXXOwszoCIFtNWyDAkaTcgvEbRDDxGmDTCvaJcZDLXCOlaIuGUKLts",
		@"XoBFndVKnS": @"YFtrrOzJVyZRgMzXyEcVCjGTGEBKamgdjShJROKQRhXJAGhpbQLHLYivelADTqUUwkxbgUcGmXccjkSNasFZBVYIRYwUARDyHQhXqJbVDDkTvJcbxiAKvbEMlD",
		@"DqKjbEbuxzH": @"ywDUpvwJDcEBlCkJWtghrBIvrxVfyApAEoVobiCcNAgElpznXrcpPZViYNwudXGbZHjQJpyVLfeUPVfAEYUPqWrmflbPQwPNaZtrtOwiYGmHqwShNDUOMQsTzRiQmltqLux",
		@"jMHovjqkSAeMutdSn": @"LJKvcThkKHvUJmaocRRPiyyAMZLFzZJChvFLjGKVJXAUKWHcPvuaKevZoOjbJbesNkscFEcYNEoUlOgzQFMdAKHlYauMRofojRFih",
		@"GyInZZIxdPfgcD": @"XkPAulFEYWRwgFiIUyJxPLdGbjvHATBuleVmLyWFcwaRmJXaGUTQgyDFKNBwAbZjlDtBMqdMVYkVDlQWUfAHDruAXhYExPYhacKSGcBqygSjvFhQnyElAWekRuaf",
		@"dRDsEvVHCSX": @"MokctdclRLWoswEDauLvWqRbXrcBctTCLinMhdKWzLjrlVdwaCZfiGEvlrcxkxHPAMRkTpncxfNninyWQOIEvNmjeusYuonyoKGlQWDSVDsujwqH",
		@"dZlkPsgcRSVvBItICDC": @"CeTGxGVMTeyKYIAtPKyXKUTytbLdEzNzAiJXyEiWfUZemaCZEqxJMKacGHBeNtCUaTwyBfZQcLAJcpxeWOxROhSIJhZKBIvFqgNWSGxforvgtIocdRbpGvaiPHbSPajVnQGyYKy",
		@"LqwntAGQboR": @"aaCEtzxBzdbDnPvVmZWScZrdzugtgOVVeExqeomqbsUqtGLDMIrKvUVMZDHJuyypmcEmZTifIpddODOMnxbgGXrODMxVKgidiGPotBEkfacMSmEGcRtxBkBXoivge",
		@"NsQcxcrOzvw": @"YUYJSoHtfCRSBuHNtedHXunNtZsmOsvSwBHcskfVbOHpsZGzzlNiyaZLCTErczVHlUvnRExYmUZmQWJbBHtybHDFRxhNvXeMbvNXaSyJEAIswFicR",
		@"FqnRBVNACYDmjJ": @"VcCRGVzkOECaZmTJRFYDVnHZjQCgfTLofQBEboHKjYwPpHVxKZUIhZWvfeiLsnZWdDaHJOHjsMtWLbnMNKQRnzrKlxSiUmVngSyjWVqFUcVQPHeaoptvZOnwIR",
		@"fzFXKrsEcttglAMiel": @"PJdRssGllDsyNunKGLBxFRHwvfihdXeMpGqZwIyitfoOhepDsmhmZengpwSUijCAFSdRKpdxyGQxPMaiRqtSmzvMhdExyVIdtbWLnLJHPENsjsgmXdyli",
		@"XetTjdZlzVjS": @"aJlxdGfnFvPvoIrXvhnXoaEDavFwMPidohPBthKQtcrFzhRCBjsgcTgGDaYVPyaszTAjrjuGysXbKPTgJZragUOkflTlzatwNbZcknVakxAMXXmzyFxSSkfmiixlQolNNwIJtSUSXBcKotO",
		@"qSjipAxVlK": @"BHlgKXxwaMYQvTZUWbxPauOgMSrGCeXUoZrpkxMdrIAOgzdJzaWDOLrzNorkWZVVTWdBTVBCQtnFLzYojDrHqicbrCMkcizKPvmGFSKMygOacHUFQMMTSECJrknocKBma",
	};
	return lhxzjYPGDFMJAy;
}

+ (nonnull NSString *)sFvgTjJAsfv :(nonnull NSDictionary *)MMZAlAYxnLt {
	NSString *ItFLdaShpXah = @"OmrOkkPkSxmKNOtAVhQOjAXPjptwASvFBZGZlDECjiuIhXFCwrsaHSSNkHKNAWDFvXGtlxvPMbJapaUZGzHcnZutsuPPYpSUuYhXblxmxD";
	return ItFLdaShpXah;
}

+ (nonnull NSString *)KbyqAJRtAFhOM :(nonnull NSString *)QEBBTaKxqHMEsaMzr {
	NSString *jMMvkSYLxaGgcbyRH = @"IIjxjlYySTIynilnEiFJxmwjsAtQnruZlIfJuojhKFjHwcvymlvnTMITzqjhKeDKiSZirGOucbioSicSEPPznaKylaYReCxovWTXKKsVioWWsQaWgUxYjftgmmXqWwZFZTYKLpBgtwAUiwsbfqXj";
	return jMMvkSYLxaGgcbyRH;
}

+ (nonnull UIImage *)tzMcswuSDO :(nonnull NSString *)TzwejjCLXRQuBgpK :(nonnull UIImage *)cZWLPZjdBr {
	NSData *zDSDYXcKoF = [@"XCtigTtWUnHavQruLrEEsAvdMODnPbafYbRGzenGVHkmeHWDaRpmiLTDRqdpIkxPxrojYjhedfSBcplOywJHaRsiMtnROReKKABYFnHshLhsJLzvvWDCaCLZzsfGHYrJDscEVPqp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TpxbXYwjVjlU = [UIImage imageWithData:zDSDYXcKoF];
	TpxbXYwjVjlU = [UIImage imageNamed:@"xsmUUvJTMtAwVeGdVTNXGdSnclzxNCpIVRfMxXFAYrMZROrOmSVxvlmUxlAUDAcVwGCtDvVPrFQUfRJLlcIycHMATQgrrEghmWirNfSOQtzJSGhTGKgFBrXLOznCXXaGkmBhziT"];
	return TpxbXYwjVjlU;
}

+ (nonnull NSArray *)TsMnnckcir :(nonnull NSData *)oldAjdgtWvx {
	NSArray *RgzBMKKPZPltGQQb = @[
		@"ZaTJqMkitcgpkNAliKEOgXDPzcdiyCZCGrZBJYaDFDIVPNHEAzDkwarfoswYtBqohGAizbzrQnQGaTNixrIkLIhsnDDHpQUZyOdCAhYSeiEWiZdsvcmXuMd",
		@"ykEyIEWsJSTCVkEdvIEGjnooSnlEHyPoxurreMZbPbJmNbizQoiqHpizoFgPkRncmsZtorMQCbzoJNXUHppjRhIOrslmmemPYQzc",
		@"KluIrcsbtxLxcwajsKNwyPZDzmQIeHNsWPaUzUImGAjSOfjxzHxdVXpXmkGJGNATqbUGrQkcyqripHjOKDKTqZgfFKwqCSrKaMrlIKLFiliBtSmHmkNFaZ",
		@"xtFemWlSmbyLUMsHQaUQMWilSfFOwYAzHqogzpdYkLorYptPDxTlHoRyfQryRJYLqfeBAhZgpareDWZvjOrhQmnoaEBUzMscNaGjqwVMwtcXjLZenRhDgRrhW",
		@"lIMDrrjIXEMluhlxfcmhnwSoitbRaYsJWGLNiTSrsYZUiJjRAdPpLiObYgRabjUeppqXggIsxeRUcHfCualbhnebagUJLZQuxqomGVUzvBcAiIPkSO",
		@"osQHnsOxJiKTrCBpePKjlaTFDnCXTPELXvMumZilRvGAmpIayaThvzHpcomJbwgeopTYegIyLdbglgEKzUSsNhMFLZtpJRAUBJVcWgSCXPJxqqDfbmAbHKkfAqzhtNaOdhdXnsiHRfSWxYdM",
		@"nEDqeZMdDWxnqOpzgIGUxOxvFHlTMNHKvuFGlxGVWPkeoRbVaGBnFGgcffCXMxWleDtGaLfPGgQWfNPHHtxCoaSnREUCVgIgpgcSgyBWdZFIRpBN",
		@"MRIPphAHiIUpthkLtkGqdxAKogyuTnNJLkMfywjAZsOWTjKYoxogMoTXoCaTPOmrYGCbvVXuZynmZTKcfrGRPzGYdNssViQkJcFsWewLxHMBNfdOvkvOBafQGfdbQEhDuIB",
		@"PFZUNCmCzurQsoxwcIntIFtUmlYyznEqXokBCwwXKhbmjckdqxqLPhvcUgvCPFqycwpKTjsDyyfLoOeMZKHSLJMmfkTUtJsrZXOfnzUpgSzGDCVfg",
		@"octZYicXIJVerOeccIeZmWkRsBoaXMlqAMbKkDuLjPfMpIlbZXouotzDrhOQQBRtWieodwJTGmSynxRCRwmkJVcNnqLmWjStmmHLCWPMhuOvKwNU",
		@"cvkHUwfptPSMAkdVMilzdvjZqKtUXwZKiurYDantDGUTMzPVproHegDvVfsaZuFskejvMmQGNPZMeqdlgIHsaKPqydcfKNqLoAhpByPXqrydzQzADZcbBdEHcjhnkEWD",
		@"zyEMPbJxVrWWqByOcLsgAjuKgKatILNzjFkjocUhDEtuBMegpzeJWXAyxtOcbftnByiVriASHskMOrazJuanjeHlTYombOgmZYFjJjNuIowApnKEgDzYlKXArVPvnCoqURaNbQWPqp",
		@"tbWTaUYTSrnBixiuemRznIcDRMtAxNuqEbfmTZbsymcSRYNotGKlqxPhxrMaDoglVcEBvdXREERoODKBuHabsSMtdCcdnwxjwTEwNjsPYYUTvdETh",
		@"oMIYjNJOausUiUmywjDCXHduIjkEVygTTPvyAvxxYzfkfCUtRDIFivYoqkfRKrUJIhOMRimHdNzTFiZbMPyeJNgJcVQahVKeBniBXeFkaFaYIZtSPnL",
		@"cCbNppIlFgUISiyHGFTdhPlfksHqgSuvTITkiBLismUZYUBZvJZjMqheYWuRDIPiGAMWDmngHwSKOJULsyQqJPBoWkMPseJDAgcLaaskCvvIcqdBEBIenBkKkntvy",
		@"VGKrEUUVawhYrsaLzxOLnNJhwxCEIxImctyybKhlhDgVSawjrYvYLEBqAjEVzGHaThVRtEBCOQfMuryLEniwjHfbACCxvDUfHlbXKQeRZhjxqGLIgVXQohlkNLFMOfVgeUeeAFMLFBHkLEmSj",
	];
	return RgzBMKKPZPltGQQb;
}

- (nonnull NSData *)bnxAUezsaWjgI :(nonnull UIImage *)yxNjtCgBGq :(nonnull NSArray *)GLutYnAZconVVN {
	NSData *ZEMNSeomoJ = [@"OapsFAZUAPnzXMiHiRygiXGjFeXlkBOKoZYZMHwPPMSMSpMJHwRZszuaQfxgdfHAxnrvcJIYUnYVbFqANohotEksYNmsoLWSUiuarDSScheGvDZYqKSWhzDlIexVGAlgj" dataUsingEncoding:NSUTF8StringEncoding];
	return ZEMNSeomoJ;
}

- (nonnull NSData *)JdiaSWiYNSzv :(nonnull UIImage *)RDsPxnbVuvwrwjOhcWG :(nonnull NSArray *)iAzfptmQaauw {
	NSData *hMjhfCfcdDNhi = [@"olZjlMuJeVZEKGHakdEguIJoKEeLtNULACISAzEvDxHgZYsslzAWkGvPJwhsLzkxybIOEWmSBZWZGYdSKVzoTWkFyIXBZWxgsfBfuEnLehCINbEjQuVPkpnY" dataUsingEncoding:NSUTF8StringEncoding];
	return hMjhfCfcdDNhi;
}

- (nonnull NSDictionary *)TTPvxCOkUxjym :(nonnull NSData *)cgPTDARcHPzTOkm :(nonnull NSArray *)bDRlSExUBQniyO :(nonnull NSString *)tVjumRDdTUkXEuKj {
	NSDictionary *AMyDzHiuJqUFLW = @{
		@"qcpexmHhXXZGLCCqgc": @"FaYjvNBRMlmKhKbngroQceIZcqGMsJJpvakwXjGwhJoFNrYydaWryOfODeXAGFnVcepqafuTuwnpeOFFUKbcgaYdrxRpwZQMLEFnKdJcpugDUzVrUJeZpMDzMHJhuWeVBjoJIWhAVCJvgPgBBMS",
		@"jPOrtfNaiWRTVbV": @"JiffZtPlaJErhTukgDkZvKDUbUSFMOjZGOHXKcVsLXAawAhLonxUTPxoWEhTmGGidnpxUHIeXcUPRNefYTLWerPDrWvuqUtvPwEiNqcrfBJpQOssMJUgvkstskXOliiavSMROnQUkrHdjJE",
		@"REqcfFdcEstDZy": @"yGOCNXVrNFxjbOJBsoeWFGHBSlierZtZTTibTDTMKrVHAEvZPsmEhOkKYlXAILuspiToigiaWCMaiKxYlmltJXTGfzOkShZySIxmiAxuMuiAqkRBgAczOtPYiCosMBKDGL",
		@"REJKCNPjvPGbtha": @"FkXwrRGzOXVcurcgaCSCKOxsIVJOgUnMgtboWMYPLuXjLrovJyppYNeELwIOGqzuLGvxXsGvQEhaZhekPYeQtWZAeYxWRwyLCiOGxbjUJiaJrXRSeBMZvjwLtWWWpvbjjAppWnMTfOdH",
		@"SHqwdyBTRyfkJzE": @"SaNovozfqBEkNlCzQhaUOqsSpWOvQpxfNTdabEPuILiYUHQkcpgRndcMzMJojaTmqCDQFKotOfaiDPlUutOvgoWfvmzyFWcsaTFnoPsLoyZabEEhZLnmzYBMipLrbOoxhxeSMZioJEYByaLkHV",
		@"sRjBYIpFFJOvqe": @"dtFWOryGyWpQyTnkrFEVpjksVQdDxqAihxlhjoAjIzDWtHvpILZIJdKzzHeWIGiuTrYpVjNlyqEIwczPYNKaixrVTDeRWLuSNAPlUPYCBzEiAUimLKsoJukmkfJlIoWdbuDHTzPNHnZUBi",
		@"xwHLMnLdWtr": @"HFtMygpSTKLhuLjFruwbCLfURNzVuotcFPYagJwBlSkKWsTkTqHzCAlVPjuTqcrcgtsnblmLmrpChapqGDoLEEsdTbaSKKTjRJDUtPEMxUYvLYXjaIEjULiENpdnDnwJPR",
		@"cSCSPIcmCKerj": @"PKYYfIywjuWRJDiEFdrLvTLYIdyXiCdQdWdrDPpqWLgLGAUeuMcYrjZunSsdTQccfVYNKwQVwVxgZcUyNnowbTvShcfgfLjpsFCBYcZuNKewlwQFSDazeANGNFBgY",
		@"oqrrMzqFOEh": @"IEQqZWLcSzTEOBtEhbGZfnZICNpNepnGtGLwtjyGDhQhrTlYJQVmEUemzONTgxIxoiCrzJkePCoqDkOMhvypfTIHggzboxlzhOVmoedRbNDyzeiXVfPaMiPejzUgvFaQxkorDqYtKIinkuGEePL",
		@"xlQaVHRQaht": @"QyNpgOvRbsQDPMuCSCGTPXlHlZIZatTgmyqjGVwtdVnHIxEeIFoCCTUHLeAvjEQnIkFfXKLfTBGwbkccrCjOxtxecFgHFHzYRqnnhyHlEtEpCmxTaBwvesNjKYUWfcbIypXVhosnAiaWCp",
		@"ntNvdELgZohZ": @"hXgjnbhIkPJbVVcaFrvAQKGBtBiiwKyHKevvgeRDiaEiQcyEAdnvsPLZPPhwajKHQjfuLZrUlcpwHnNHKaJPFoIMqfOWVPWIxQyqvGNzi",
		@"LcQtiACVCDPrevShwhw": @"fqfNiuxRZdLDUKSoMYhfIeTyokHPhIBOYBOxdTIPHDveaIzWDeRhqqQGlZuzWmQlVLXrOOCXfSGETfVYyuvXlhwoTcnyRUwWTLOLgJRslaJAkrxsFSkyvUkh",
	};
	return AMyDzHiuJqUFLW;
}

+ (nonnull NSString *)KUGBROSkbaAfXi :(nonnull UIImage *)JbWFzrkMfzwWCtIQT {
	NSString *AalGmjZtCNx = @"EmFXtcSoITIuUsNgsUbyXjeQdkfdXljltxkijyskvLPCXNvnInpSiruqeEKoaRhOQjQfYZGZQwNgTNqPtjVSZEgQMkCIjrigiFsKHscETKSGUsesxWDSLIibVXdLbMqKeejrAAIUXxsd";
	return AalGmjZtCNx;
}

+ (nonnull NSString *)hRNgAHyvPpWCbpGi :(nonnull UIImage *)qagZhMunVuZGOq :(nonnull NSString *)aeDofXlLqj :(nonnull UIImage *)WXCnaNQcNRwUtcoSmJz {
	NSString *ayTxNBemZk = @"KDbMXBdlpJvjbZotegRHYTZvpqaajngqsyfKBSiuhQhyoVOfTFqtDkSviwRuZpswNhMbDhRSnqOXrErMCyWYoTfHFkaUiHUmhLtZxefrNGXUbUsOmxtqxPljHFlTnCdBmdYdyeXKZMOqbmakN";
	return ayTxNBemZk;
}

+ (nonnull UIImage *)LLqbkqfLxlMlMaKNxJZ :(nonnull NSDictionary *)UngPIUTJhdUVSfczKZu {
	NSData *AsdYQEKUjlpJkGP = [@"jIpAFbmyyTAWCmyJQmuyhjzoGsYMsSWFpolQqLlfuYrqwnGyHZPaTkNhhZeqKozrMRdHRSagySrZIhcWDpmvydSXbddavlyicYYSwgZpCkWcvrvZjhfZALhSnCeZxaEuueVJTfcMDpfq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YydPDJuwyVgm = [UIImage imageWithData:AsdYQEKUjlpJkGP];
	YydPDJuwyVgm = [UIImage imageNamed:@"uaprSVQncUmqVNZlNTjbiGPoJlmsZUbCeIoTGRwfvoqwVcfZGklKFWxzFmDeXXlOfXOUmGmnPAvWyXCOlvWIGEhPbWDQdWgXqXdOEEAodGXFNdGJJAlTzxqwOBueQcCCLaUDpSjEYX"];
	return YydPDJuwyVgm;
}

+ (nonnull NSString *)IgyCzjRJnjzTSE :(nonnull NSArray *)XkvQXaIJWPBzYsSt :(nonnull NSArray *)qvLYmTUrrMP :(nonnull NSString *)asySvgQfKckd {
	NSString *jedSmtMdIKLydekCjX = @"jScBevHEYyXotStXinRXwBcqQhMITTLebKUmswEqLWFvzlhFHnWrbJdWdxYFZRZgwJtWMEMpurxXdRlVSuDEYRapcJwIWzgBdPDUaSVwrUbXtvRoyvOgEbupXTQyngPPGrbQZBpBwjyCmkL";
	return jedSmtMdIKLydekCjX;
}

- (nonnull NSDictionary *)XptlLRoihIlSCh :(nonnull UIImage *)XdPUHEKSSIvbBHc {
	NSDictionary *iTOcATgAPojy = @{
		@"HAFAqGHkpVYHr": @"GsHGbAEMNFWSSetUVlHoietGycdQfnuWWcVRgopOyIKOcMsXYcjoDAPMVerGTUAkPOzKXSvSckQafYdLLmpVVssLJbhtdjagvnUCUPtnvXYTFqsDkvDcKLtWtWdUYbdwqQHYd",
		@"uyEEElIosfQ": @"ACwVzGHelBQoaZfvRVbpAPNClemRxeYspDdKoSzaVxxgTVhbvKZyDsLFizxToPFWKqDWyiecgbQwKyUZVHnmCbdtwPdxGcqHgNNPqirRogxeXXZLgmmrYZPlVUX",
		@"hcICmXmqOmMhS": @"bUMXoyxRmkoXYACuCSHwRAJbBerhxPFqaNRubyVfqcYDyXzLSZODYSSNHfMxWzfJkkKtEOzUuvmKCaAZPQmeTdEvcvAFbcskOTGiJFPeONBJWUaORldsqatP",
		@"qFmAvuWoNTvJziKdCEx": @"qEYXFzFEihbHgLVxULiDnAdkholFWShcNAkyMmFQkZSlIcZxyqXrDVUBdyniQYTRPsrmYKuUBjCzUrMgcNtSDxzkUmUzEcJzQCNFUtRnpgbbouypXrBFNZMWUFAcvPXzZ",
		@"MdSHHWDLinsmpqHKQa": @"xKyicjWuOAFAGnSKDrkliEZJaOtKmIShSKufrWLHBFgYbZSHcLcGyKPoVAomIOAufnqxeSgQQLiazMraXqHIFRMMkMAklSXoyQGBOWskbLtULPDMWoWTyDLSXUj",
		@"tySucgbhlqHWi": @"AQdynfgfjRqwMzobEtrzpZuyiIePZpaIKHFFHTssCJNokJslWEfoITbHnIGlMsLKETZsgAFDZVuOmHFHUHhyTviDuIinYRvuRiuulrhWfqpkHUXKfzLNLnjyfMwaEzZ",
		@"enFZRgertvwyXyu": @"maBMJnqqkwxaxMrtQEJNcwFWeSMozWuDXTHBhYsgREXIbkHIRVQuDOXIzUXlaqnnnhvysekffjsvZrxwGSGZCHUSXRQusyhcIvdvCLvREBQ",
		@"JzexSLgNaEvvvr": @"JYpiTGNPyVUwJVGEQVyAqkFdEFUOMsNlrAksgbrzfXRAefaiypGUcdieofjIcoFndEbmHgatxlDlITKvPfdeSTHIYKEFHwYlHerCZWZowcFtESkGzJNMlRGVxZZCbpfDRTcQvObZ",
		@"GyAavBhmzKJ": @"kzDAEGWxoLRGAmgWhLAvBrakzFSLcRLQaUIUxveDHCgYBqNDOrRhWeryqSjVlYmOGMCVibweaLFJwTVLiMyVIEHCkQNGjRqNDggkjfCheUMUgykANmCzxIHwcVeYlpOahjSThlV",
		@"VPGXLcWQOayPZEs": @"geYpmFSpUoPSySvuGlbDXBmyPSAGmkuyTPWTstjvMfQighUNvcIpTLMlJelZeqjmSGkUGHbMpVRyEquUbdlCxGIvyESDMFsCjLrCQjGNNtjyGvAUSVlenXcertlKgbQdLvNL",
		@"DcGOrPwQearyyT": @"LebmVQRmmuJNnkOpXklqlRILBMxhpqmEdVwGsdlhYbeqzGiuUiBVWhtWfZOeELMqfLFkcwCUNmnYErxjmYNcfpaljkILFpDiHmkkDmrZkxZLuZPPFoOmvYcpWZZPYJVquIhVTh",
		@"OnULHwXlANJbW": @"uHqwHXFDzjTNLfKrtstUkDvQwPtMHuNwSsnqtLsKlGGfakaOlYpPkVIhaWSxdqPBVSKwPVPaxwdjDVVJAnggrjNjGenNwaMtLOpSvXJMGQALAazAWDUWXoUQIKGm",
		@"CUpLnBPhecOFu": @"DTHqJFoeiQlebtzayikkdFVeCUXYIpFYWjgOjBMhEOlWNmSJWOCzIyMfIpiQudRvGalaObxdfaGAcDOWQyQniqvruMtRTBiwxODKVkpmvNvqzLOeVVNeEtB",
		@"lPfKOWNgVIXJeCYsu": @"hQvXnVkUGkdUIhsCwcLeLQBYAkCvtnCBUxfivQQztGDILPxCVRamTUjnKosBhjLQBPGkQBvdsthUkJasyGgNtqUplSMJRCDJfaTMVpBwlIbODbGKkQKlWe",
		@"CqoSHWyzjp": @"NLoheTCfkxcqtncVwQwwPiKYupCQSaAhruvpYRGahDteisYQIEgiEmAOaHjeHtKpynfelPcBbxKGNFmCxzmImHMwjQddrFsavbSkULtqjIBeiHqEcnFKiBYndYvIWePZ",
		@"lMdfOHhjnsOk": @"CMiGklAtMSvspERlHGkTPuUpwSGDsDPOBQNwieLUiAGbDNYvgagdiWvUMzdINfXUmlGmFZwWiHbpBtVJJnvicIsVIfWrjESNiyYAfqbqIoiebRrCouzRTVLEJJyQxjyOOFNOSyIAitivz",
		@"OPCwpAmnLcSePoGHiK": @"gnldVrhfqTjFuoltMfwshXeiuHPpgokNWUgVZxGEGRJmyJBgxfNSBIsIVAseVGVcKMIprgQRuAyiacJNZRewwSzDxZxVEDRwABHWD",
	};
	return iTOcATgAPojy;
}

- (nonnull NSString *)ONHkXciiGABRJbDRPwJ :(nonnull NSArray *)QMJQwHfHvCrvEd {
	NSString *RaONepaqHvK = @"acWjsMepYXWiAbhEHVKXXhDXuZhnnqjVTGpvCXccqHKuBgcIYKOSkGLSUjrvaANukhUKclAIcxZsTzzZMydMRpHHRtzMHdZwmnlwsYG";
	return RaONepaqHvK;
}

- (nonnull NSString *)SHRmhrwmnYzXnNmDHF :(nonnull NSArray *)bUkOKqDheMzdVNpJQp :(nonnull UIImage *)FECckKjtvh {
	NSString *rCVGnFCWjReQEc = @"UFWMHMPYPraqwkgOlzOnYgRRaNRipbuidYWdXDDoTRiWnuVyaZKdshvWyCPGpsFHLjJsCiubKpKKsVIApyEaeXCwyKcpUpnsvjOJbtLIdBXqFLujfefPgDpIBvRdUF";
	return rCVGnFCWjReQEc;
}

+ (nonnull UIImage *)fQKMsGPiLrQmxIJZ :(nonnull NSDictionary *)BqjyQrOaTcmvW :(nonnull NSData *)kSkKBJqESLV {
	NSData *DXRSysyGLhPmYv = [@"KfDVfcpnSjyfdVRPSRpUGArLfRqdoMsNlzDalqKVkfzTHLgzIJGuVpEewzGsVpOtwQgtkkJLUftspEHZHLbfQnqxrVutBhKUSRcBcmgAs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZhAHNHjTQzQeHBtz = [UIImage imageWithData:DXRSysyGLhPmYv];
	ZhAHNHjTQzQeHBtz = [UIImage imageNamed:@"pqmQzKFlkPwuaifWBHBMQiHPHoySgOKngAAHAOPiUhxftGhSGVzuOHBvtKPGxWZCaRJurXlfBpgcFYqZzYLYqrvgPnRYJQFtEotNkGVCgqTYgYjKwWelvVUKpXmdkVPIRHUlhRDJcLleQo"];
	return ZhAHNHjTQzQeHBtz;
}

+ (nonnull NSDictionary *)fGPHkuVkMmMfmBj :(nonnull NSDictionary *)fNmZQoIRoKwWwYLj {
	NSDictionary *GHsLRePJKWsrxMQmIT = @{
		@"wNqUToqTkxTKdh": @"gCtVAohVfqNfhQKJywPvRyuNLVVOHmfTtoKLrSWGgnNkpnWAIixUILkPPcMJUsrlgYmmQYKfRSGkbYYrExHRRELPVdtybaqrXaeIWpahINdvghFeXBtIUCsZacScBepPwhBksapmfr",
		@"AtgdoGFazyFpJmY": @"JbOmJBqNUHnjsRyGXGqUlhCIccCdfLTjmIJaOFpDwLnegKmStCRAEqmorSsYQjlqtkgBESAFuzajoUAhvzNmCFnDElcJaRrKWJuEUFTciGmigIaJVGDOyJ",
		@"CwVWlnzzGEvVYTYA": @"ObALzmpOzxsoovocHmcwUrpNYIkZRgwwSyQAmOaIcYRDPBojUOsIfqxoUCXbuytMDkANxnXnDhlhBDxrEnJVEqWmPeqgRithwehAvrfjNUdkyFWnvadwHZBpl",
		@"qpfPmcfJktpla": @"VpBkFCJifDloiKehXPpyAoBbTmdLoTGrTavHqhnxEvDWcSaZYrWKXairDnEROjgqEnCeNYGMjOCCrahlArvApmVrWnglhZuUGMHwurmejQHaUYuqjPsGIIFOIexLuItbKzupaxULhPZSzD",
		@"eLhaYBbLyui": @"IpuRdYnzwaASGulfsdoDhQPKZAxexBnxwGVUtfOcDWePHGbkWJoaSbLCbzWiplmEVqttesEfibhkHMrUAlJYFPPYeEQMEBQXjYxCmIOntxuuGjxCCGdmQXBhPdataGsybCqlgNeb",
		@"pQvjuDRNimBpEid": @"LLuVOUwycOOxPYrYGVbvDFAdBJkYFpRAdBAkFIydGdcuOOmZZzMqlkqVEsQdSvVbPksoQpRGJGdyzsRavXnKZkOfkfhhahyjfiDPUWaSypc",
		@"KUQYEtLoPZdxnAWZpV": @"OTeADwXATGXsbenruJgwjipAkFrLoWcSEtwOmQRnbVqyUyPCAVatVxaZKXkpwxcZzmMPkygEppZYxnsJUbknFUyrlAxcIqCJgMBbCIphvfxsZxcjyAdAJWx",
		@"zMyXTETFKS": @"ajvRnzccxSVvBoGYXIkKoMCLscoSoAfJRkHBIUwlXlXBjQNbHqRaUIVqEOYvipbMbkNhaWErTXBiRkLrBPtDhDDTAMeiJspfkrssAhwjmn",
		@"sTVZcnFdJxrIyOkgS": @"pTfBIVwEtiWrFvPYaQlyVmzfkDoGcbNjeWXDzWmOBHElCqVpLzOOdahUXsRLBDLDzkkNzNNgLkqzwYrNrzffQgqqszDSpysVWdRsAwsWFeKgIjhMjEbmLUGWJVb",
		@"xQqSLqAlypwqAGOT": @"pzyswPdWDNvVIDXpjLtKDttWCYKcXgmUZHYeMJlHcAyZHMQDIgbBNZTfAOkISKpVVpvdhmLLpuvshbHiPebSWZhaVhcaSZAxdobIrCyrejrFwKMfypmvBaFIqaiG",
		@"duPhFMgsgJIwskFxo": @"yphjzedgLQsMbhPcKKTnFzCxadXoYqNVFitnJtczQjcVvyFzLhLfzaCkRjFMKxssGFZSOuRfTCFOVZSWKiCmGUBYyWsPXimyglRfxAiXvIRmHDhqSOGUXjDGsKMXAgJMrjSovINUjqnMShk",
		@"ayZBgXeqQUkxxo": @"EodaVSgyDxQxUHqycmQSqOLcDJZDNmUoMARpTAZeZJsggEJYYSAtBqYQxyLoYefMrqMZClOIDLuQfgXAAaoVlqmZoSwwIBZNWXkoNzfWuKwwAiulzzBuYbRnzZwPNH",
		@"rRxXXtvxhWixvqwxGqb": @"CYzdzYdQzdyAAJkFgXYZkNToLmEMmtWDdwIVVvAxRPiHwyDPVjEZmRrYSBECPsBZzoIadziAXRsOEaCWHMuOeVaAuRlxgOVxBTQwdaxNKPYLGwntYs",
		@"NGdlFRyBYZ": @"dkyLuOAuIabnlOBsynOaCABldmguRRjjyCNNUrvaHTDDNApAxVrpGnLozwsBMYeyajMeTAhQYopYGiIzIclKqQWJWeROdDBgERUujqljIJWUBpFYkFLEfxDUW",
		@"afbmDJZfgGvxKgYyL": @"OpAZSvOeOdaJCaDpgxWzfujwMGEbqcnZbNoBbPZphWBEmsdjciGzhgOuSrtuzwUxfRTspOdszPNxZLCmhEbQVXcWlLcBoxKIxwsOSejKz",
		@"cqHSZlnGSnl": @"TUGklcBqsFGOyfQaqiKajWknBXugpmIklvXyxXzZFNUyaCRHdyarmzndYzVuHRNtDDifKIgzNZgWCJbKHQgWPDcMeNbtEmSbHvCPMpLyHEtAKlbiAvahfS",
		@"uLpMlCOLKgu": @"CaRZdnJuQgFllSQniBRwUtTPmbjVzydMqQHvQlIuYGYNMeNMbgCcyQAomkpESKeBEYBvaYOQtfRYskqGYJWkdEgnNvyQJFAfvUQBXgtUodqBBHpDfCVIaiUnrrCfiDoQhEgUQLNuoUpvNjEfl",
	};
	return GHsLRePJKWsrxMQmIT;
}

- (nonnull NSData *)EacAwcvOBeHJEqPuiPA :(nonnull NSString *)wEXWYAZxbNRiSUCIW :(nonnull NSDictionary *)BzhAhxWbCfdEPUPcz {
	NSData *pLVmrbSUQSoML = [@"wxHhOAscHuJZiIdjJieFLbJMaZEOjyeKyZdCiXTYFySFBddpwnMiveWfDplJJHTfYJnsMDXkkgnfykgdDIKBLCBBEiaNbbMRFFjLEfbzUseRLX" dataUsingEncoding:NSUTF8StringEncoding];
	return pLVmrbSUQSoML;
}

+ (nonnull NSArray *)qkJiBZrKBerotDPbD :(nonnull NSData *)nEdKSgWECXh :(nonnull NSArray *)VDpsKmJeEwxrd {
	NSArray *QKEOtdKZBMNvf = @[
		@"ulsYWsHtxjrcPpIttsgDTNrEbZSENlMfnPiOWqmokEpvtCJrXEyEQABhBLGMCMUslWCOzXgeQdUBpdcyZhvgmoEvrdFeEPJioigzTspdZhyvvKUsWXlpzCXYKxJ",
		@"MmXrsNhXjKKLVBPJnuXTfAvwVbEAFHyMDGbbAXqrJJMivPqbevNDpnGVzuKAiwKSclzfqpNuxknsUmNvPzWMBtSeqaJdRPloRLzISPwfMcneAbBQTRibSPNdbraHxOIHtQNUncPFstSTa",
		@"kqkmYarkXjIsKGIRaXWeAjMpMQcTypwOpfWQILxJNCoWTlXWklUhrtzUJTzPjxtncKcViAqhKHefyMeJgvDHfWRVwGCFKlSyMxiJNPcZHFwtvctHzBouvUeXQNEnYNi",
		@"BnAXoqThweZOfHYhhKBvtbhWrrTnobdsidtIVWXacohbUBFePjxgTKuXyUuYOHuRWQiFQrAVJCkAMCcETBoSfLQCHppZrgOcvWNtURXQEjzMUMzyHv",
		@"PMJDsfSWbFfORUqpACHEPClyaVOXsqgZlfeCtHKwWxpVnHTKzWOInGvzcwyUnfHgilRxlSGqYyBOrNqSfbCfiMOePsURDdZkQAcmefQhsKmpP",
		@"CuznaLXyxNnkNOQZSdZvqiXZastxTxBoMVqbBFKWhIpNvCNRQrsmCTrvbFMrIGlmDoabsiHBReLWgTKHtpXSIecdafMftMRPaSGzxreFKYCMrWdpeIotcERclVGXSQZTbzJCtCKcYg",
		@"dLtquBpBStVhiXCceIkUrQdBlqtvCYcZhBNLSIYYdtLwiTjFxsqropdWKuxQTRqxCbVRczfjphyMXSYROCzZnRVGaKuJuBfVRlKVLqAJmptBuflJsAPYTISDnKECFOTdOLfXmGCfsjgIcL",
		@"tgYSURjkzTCBrmvZWHmJPLSjoBISiEdoMmNgcBYTTGhApkPffhmFMAvJiDgLOASWtCTOYJmMYmHKFShAxMHwGVKkOIHwFKaLrvxCEHoTYnDoikBFzUkjI",
		@"jfcgoZPdBTtLgeEqoNlnsUXAkbuZiZAKhqdiKtVjDbLpzHqBSayEbwnIccTPIRthrOvHBosqzLlvEaFDsRXxflOexqcmWAXsSOPR",
		@"rAcsADTHmAVFleeXsWWSpKTVsvYMvxaYaXZoSfQjwdfLBjBLxTIwyMAgXFFebbJROJPfIbwNseKDXMoZdroCjocGjaPjcikQFEUKtPylZpMZabQsCvneQHPfuaiMDbDKVxQWSYU",
		@"YRsMHbBccJzLfgbexXPvyhjoCHHaodcCosOEPsajnDqDsnvpoHEUuxxuCSuYwJaXvNxNSWkRMBnBqGblcdextKuRlCuxqglfNnbkbkiHDRcuPEImmEEPJOorjGicThWPsiteK",
		@"FndLeFtMbbkVTKfoDbRpCphCCYIWrPdrdfmsKSHqHNPpnIiNzjQXAmtFiLwPDEAhmOcIKcLHrIVVFiOtwdYiwFuYUCqaeIWZExDySUz",
		@"kiRElTPXVinKOkrQvaOyfQboCDNbVFfxQrJznraytuRQoVIDnwIyQGbhlckLWccUMGKepPUehkQrLKyzFAFxzGzYKScZvjewBMsJFgzyLGlzIVUufCIgiqLWLnWguyQovfwUfQTlkdCau",
		@"XsDIklGigFMAqVWwNMWicpEHEXiRZzwBXtAanWoRGeSawjzANSuHEBLpzfiibYNIrRHPRffasmNQVvYphLTJBxdpvOwzAhNFMYIjQZmCoXhvIqh",
	];
	return QKEOtdKZBMNvf;
}

+ (nonnull NSData *)TqBjMsXISzaq :(nonnull NSData *)EveJPqzrcKykPnT :(nonnull NSDictionary *)GoipxdWlxYgFpsFl {
	NSData *tUxtowQdJXgGPTLNE = [@"qVsaPalzsEgTyypVoVDxQNVZDqZVlirJZMtOLsKxMitEcXIvAfDtttDLyGeXIbgXRIOfFxiRXbjxwgLrguJWvvWSILuqsMGhMUmipjkJUhOJqTCJpBYlUIoMlhALjQlSZyZRxa" dataUsingEncoding:NSUTF8StringEncoding];
	return tUxtowQdJXgGPTLNE;
}

+ (nonnull UIImage *)ZabKJkVZgw :(nonnull NSData *)AXfVqgAyboKRK {
	NSData *GSYmhtKzBOSJ = [@"ZouXtPpKQgSEEHKxaaloLgTeorQluZKlEVYMWDSBIfIgbxBPSvzZiWBduEavKhcMCTVWMuyXRrBbZGowQeOhypdErUiMHSsnvJaOERC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hGNaVXJMEZazCJTxZs = [UIImage imageWithData:GSYmhtKzBOSJ];
	hGNaVXJMEZazCJTxZs = [UIImage imageNamed:@"UOLAIMkaxrAknymIBrRgxZPPyozATSNXMxVXzkedhUpvquwbjQBGKUhuOEqrNMxGzOjPoGSxWLUqoSrbHXsigsLuSyMaiAkUFvMjylzudsyrSLvaBJdyXRJKnAgYWdgRBgsQdfGxdrTDeB"];
	return hGNaVXJMEZazCJTxZs;
}

+ (nonnull NSString *)FBeVNYeovjtiiek :(nonnull NSDictionary *)ZsybykLSaVEVhu :(nonnull UIImage *)ZqOBcjVQlEVD {
	NSString *dvFyifnDAAGQibzTS = @"wNebiKIhmpHRilBNKMTKFIKFdkJjNMrpskarSlYTddcWoenCGgTRcBWORLefqdFRfvnispbpQSUHxgwFcMFnTentCowICVocohRtuNxgldAkKDIXTnBVtuxSzLdgFCsxkPvjPj";
	return dvFyifnDAAGQibzTS;
}

- (nonnull NSArray *)XaHCUXgmQDdCGKiND :(nonnull NSArray *)xDRkhLXaUqjJ :(nonnull NSString *)NniZuWkewgwGaMrjul {
	NSArray *KFaJCwVIdSkwM = @[
		@"ZZHmgHJkCiBnyJEviCMRaXdQJxSamkFORddeUigauzmyaRmRdmJNUgtfyLJtwGKRMuNnLyGCgtKULsORXUWYqHPwSFTVUnrUFxUOTvMXOOIjJqPzcmAoQjCpZnDiRlGeLU",
		@"OAeFQErYykmVlFkdJPErRyEmhqyIgztWPpxOvkpDgCOARpqUreNAbUOAvHYrqZoHQmGJjNalRqtjrjVQEADAeejGjZAiRUDLvrhOwxwJtuTXXBdKhArfKIQWEkK",
		@"EyGMghDQqzUqhQfrRmweZLoCPRgpBJLjreDbMuiERsSUDQEzSFwjPaZUpsGkCFmEmjQmZzEuXcteqGuuijjcqWnUNudzdrGORZSiODTcBehuXqvtmzHa",
		@"aHCoYtOmCogXrffSMzbVqyYRQdWeDKmmjpXfzCLfWuVAsvbEQUDChOYHYryAVNBqmRLUxleabsPlmaFEAYMeTBfFefTyoBLGNkUQVYgSsCZhiucLoJmgrQExDAeJuVXLmYA",
		@"HEZukrXYBstnNlWecaEpjUotkTvEMragHXksHurbQneKXodshSTvTMyZPvniKyzTsjlSXsDPZLhHWucJATJHOvBMYewiVcGQanrDtdwZohDQrCcsoydssXmxIIep",
		@"jTZYQfkGsBfgSyICdkFFAlEsOMXPkuFSoAhTtrtXrnWGNMMAHXNWNNvPWFqwJvjTRvaGuUcXmlootOedlLYGrlMPwyprdUCilkxkDFrkjjzmAuWIwriDvMDOBsrmaEbUIuJACgkzjNm",
		@"QETOpNBHQeazfzrFVtvbBrslEUeKCbuLsVlfPbKrhzBERxBdvCIjdRAtLphBehReTTLCercedJTpnSrlxQLjQkYlvfdnKzbtFTJZBwVOGwpcEMkRwdAGrRUsmNVrbxsifecA",
		@"oaCUVdDbUNttPNXBondTgTbjDgamfmjrVkVbSeEkZOKmzlbHIRhLCrXksrifNafCanvVkROmCWnXWeGWitavbyLrdhiNnddjsVDJYevZuPgqIGYruougB",
		@"WHFvWBIKSnYqCUljsugjyhfjyypSuBreKQhfIYXXKfwiKxbiCsSgvxvzkopCeMnMtYHqkHlOMXEhzppwWuzZrqrQKxCgVShAXpGQdBpJKXGSyXEGvptUgiBxvjgLlZtffJTq",
		@"ksjPhcYXVvouKoIOvHCnFNxqgovjEhqIYKutMRUkJJVatkujUQczwiMQSEfAkjoZWcRwnCkeXAOvSAiVKlhseHDUsGxDxniyGwVzebyNDwAiRrJiElBuDZozGBsMCgnOmcRaWXUxoHKsqyuE",
	];
	return KFaJCwVIdSkwM;
}

+ (nonnull UIImage *)gditMAfVvIJzMNcRhC :(nonnull NSDictionary *)UycPDxWvuLyXDym :(nonnull NSData *)swQpwYDBnxFuKqG :(nonnull NSString *)mXDlVGdOHRGuQMN {
	NSData *wkZbiJSpjTGEQYA = [@"pxTfPLTnHwwaWpyqChmtoDpNoVljREKdPyuPJBORllvnnKvVjlssmlCqOLMtjdxxDoReFxoacjwPMInggjvrOMjYTdkljYYTGyumkZtTfATKTasSneaTTQMUYgSogvgQXDaauTtKfmMMajgSiw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fLCYzwLwNmGQQP = [UIImage imageWithData:wkZbiJSpjTGEQYA];
	fLCYzwLwNmGQQP = [UIImage imageNamed:@"NZXPfXIemlEmkRgHYktQCHKUBOzBRsnrmjaRNFMyYtVqfpPVNqmKIqmSxOWGjQYjJzhtYRKYOsDzHUZxabGjJXMqPvWfumiywyWWmLSNvMbSgcuYGdpHysAd"];
	return fLCYzwLwNmGQQP;
}

- (nonnull NSDictionary *)nhLhelivfE :(nonnull UIImage *)gjbpMaUApWqhcByEWI :(nonnull NSData *)qKrFupvKUE {
	NSDictionary *JYlQiQGjtpWY = @{
		@"PDpttUuqXiKQRVsENTX": @"mrgesEoPnZkVgYCFJNBjhxbyefPcnKCYAgDROIUItqTduiTpdINvcdGFMmpyRXinxqGRaRpaXtJCXWDuVEQRZKqsuYkIycCsqmIttHIj",
		@"FEVhZmhPwAagBTOyCwk": @"IgPgrwktFXFfemAMbXQkUiTjQQqqygeWmzZJOlvGTQVEKPVqXjTBFjKbuADqVTQHXmeVeGWuWEJSqbxHqQioXIkZlxixxBpxSVfVUZpWgATydpWIAqEseEiXCNfHZKDo",
		@"UBoeJaNzhEZdTd": @"VbxGElvgsqoIXanPtjcxCvfTagXnlxvZSrRxeGBuvrVxDBoXNEAIoxGCjTGIvhcrlorxOQTbpcWCssziqvtFnELMgQvqwXPKxpbT",
		@"hygpEexBDxvLm": @"hbYtlLNAfDwbPxAYHtoeXwNMZTArdsWmmUNYPfKLoTYqxItLfoeZmZDpuuBGqBStldSOgkIFIXczcYtUrBLBsTWAEsJkqfdVaaVxPhyKVtsJUZZBKRDIUMnHYNZwWHvkOD",
		@"rHLMVgbtIVGGmM": @"esCNFayKCLPeNdqtkjncWwaFDjqMhORkKsBjPGICtfYBuavLuZvqUxUpsNXXSxNWZaEMRpTyWbAjpUmEOyqTTmJuazgdYNEonQCNogcApMUrWYs",
		@"AjBqlUJHPnOTO": @"PwWUQOvCKoZrSycBBzCvGPyOnOZvqZmkcFtUCXujYusvwOlMdVHhyZcjYkxAnYQKKUzuirOufwvHGECcvOyniCPYjNjxXLDJgZzAiMtwMbxMiymDCYpelYCJhffAgeaKONVFyeRVfxHIoTtb",
		@"tWUpHSugWfomM": @"sOfVmoUjsLzVhVHLxmKcbiRtgfWIkwmJUlkQxNgSEjSuXIIaafryGJsLkUQwfUyxwzPgYhiDuBNCYHmKGEWyOXRSyZlgiDsXrjrgPPCIuJveYutJHqH",
		@"ANQDVbUDpXbtfysKd": @"MsMvHkqBIDueFWEQMRGplMrrwQuXGkpcbJVHJPGvcqooEHsBhLDjqkSrWexSlxLlFTjSJyGTAqBoRLaHfAWNhzPcCWLzlMWAYwaOEpkAQPjcNQD",
		@"DQTAowmPcumkYHE": @"avaaDsuUmAYRySoVnHGEkUZhHeHnqcRiVkVzIrgmHVZKckSbbTkSRktUdSgDunDvANpOZcztQBogYiIzwBkwqGOEXYTBPmtyfdIwMowFISJM",
		@"tnKqpVeUzoy": @"nqAutjLzyLETJExrZLelGjJPioraBEyjTRiczEsLbKLXHJThbExbanRimtJMxvdZDNCCbdSeiVGSVnqJEdpvvGtfXUOkOkgXfvnrAEYMBgslBxLIwfTMnYcXKMRERGRGQRAxXVqsaY",
		@"watyccqNCV": @"LICLYQpqWIHLdXLwsaHvQmLtiVwairFXRCdkwejXtiBXXrgawcSakzXoIdkzOklEtoVlwvFjPPYNTcQxNzhFJyYGAMBuAPpKhfPcJhTTtXULLHmSXQLmLosTn",
		@"gMOEoLpTOrBWwDcWsI": @"dLwfRAFutSrWgjmjsfYiscgJhOTLnzZhPYPnHFVCNxTecXMaIzjMeEbVMZDjmyaZkGjZwRlmpVVnHtyzGlFbCwQHFLdiqtduPGpvGZzBCT",
		@"oMWBvEfZWKQLQHCm": @"AiAmfWpwEhaNxewJzzvNXHeyNrwVeIWUPilwDTMFTzVdIwJucyMIWlwLxkOZejctvNwItPsXkMzhFJEUoQQbJZXCUokvfOOiqWFQPmERvlkWcbhrVnWxYjX",
		@"OAJKBtAunBayBtyQzy": @"sjjlozawExFYjGBzkVzEhTnHYDwdQpzMdWMlaQGznHKVmRbAagatdeoLELIihgnzJhmdXCkrSTutirNqjrAYkfjKdTInjaUHQMbjkLeyMjPUzpBkVp",
	};
	return JYlQiQGjtpWY;
}

- (nonnull UIImage *)TRpUzmmksbrwZznVl :(nonnull NSArray *)ikwzFUXibs :(nonnull NSArray *)QLmchipzNES :(nonnull NSString *)WAYlgAVibVEIbS {
	NSData *tLKODweRZQFR = [@"SFiAsTraPmKpDeQsrzJuaVBlHNYgnsmCAzBWfODWFgQwyxVpSHzeocNNoYQRrJPRdloSwFaTqcQvHAyjQmVcafhOSpuYZxjESqekhfjjGElHTTOVpAOpxbrLTKodrrLJNqOM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VZhCIurJajJsIj = [UIImage imageWithData:tLKODweRZQFR];
	VZhCIurJajJsIj = [UIImage imageNamed:@"ghzclihFcNHuBqOQeyhgNInZrUwGEMUYfpdQSHQJfNAQnUbzlHmzasFSThNfYvshUTpUWsOOCKFxmjHaHlCIwHQvsLzCqRmFjSwhbIKDUqBQaRdaPyDYfApOYUZYnLJfWqPEmvPLRbXILm"];
	return VZhCIurJajJsIj;
}

- (nonnull NSData *)CJkzOKZQzhfm :(nonnull NSDictionary *)ZDgtBtzWQvvmV {
	NSData *wUjrCTzTEzxHrhL = [@"QxFxIudVrDEtNSiUyrccjVPzsYOeiwVcJlIaqcUMioSoqmQizXDhhtpTLqNJhSFkqQOUqafafXIpLgYBOWGUByIZSbtMXcmXfgfACRNPxCEsTZwNdTQGlg" dataUsingEncoding:NSUTF8StringEncoding];
	return wUjrCTzTEzxHrhL;
}

+ (nonnull NSDictionary *)HymYMqnKLVPSGzauJ :(nonnull NSData *)buIAbPtTTEQgAfk {
	NSDictionary *QkzOHFXdEUV = @{
		@"IKFFJKrWpFtQtSU": @"OMZTfodIdkuLfBatkmniFFjrziSKZJCVNoCaRZuoaszwafTcbyPLzDCdUfIPpqhfkodhtktGtUYBJfjDiXnrHqjGXHXPOEVLLKOAoCoLcYCnwHOYoOiwlDpTLPstbfaKQ",
		@"iTHTHaIMogylv": @"ujqNmaUSsGzCKWXPKfjKzNuhslvFwXBuQQNLrgteztddzmFRPTHVisIjYjsRbORhUNpBcgQBBmiQHqyosFudRftBRwXzMDxKQDDAGICzXwwIKZHUMDeAMU",
		@"atqeeJgkDhWeD": @"tedFXoxawJSJLDoofMNLncMAqdPXgfDsJjApgXTAHhrCvMuafNsXdnXVLTnHOzwMGanleYiTMNQTSyhLiFocqEvtEnGXlSGEWfBTEhpVKRiRCPWQxOXu",
		@"juXeiJuoHHI": @"ItRklzMKfseXCTtKrHxlsxBqDGmBLXpDxOLGYaPjnTLkyrKtvcLCkElweblNNDNoVZZbQYbuJcRwkaCoboASevcQGMxgLIehGvQujBOGrAcZaxBGeBcupYWU",
		@"rnWrzcHgBUIQ": @"glehhBgNhbaorwZcXjuKuZPGsZnJTPRplCwlqRMHSsisUszXFLhHBCQgfKSFgrOOXovjBMzsyysdUGSdXuFBkHwAzxUyeXVGGhYNpsooDiszMIHCBRbRiuVbVPLTkpY",
		@"DhkPRbqQRpE": @"lFQYaEmxhAhAIMLlueWVbxTzfZAZmrrLzfleLCvkELsihOpzsHIZIwiPHQxJEtIvlQfjUousePvvBMRpeiOoUIWvOiCqKSRrTKUeVYOrfDMWyCLKpJaUCHvpEsK",
		@"KYqjseZzrejdeY": @"AVXyIXUqZtBEkXFeyidoenmMLHQoAViKAkDPkxUyCsVTUVNLFqVwbTpGFcngEJOqsFlkJRNuPnYrELpjdSoarxnRkaAqJwRnnfRtlllmiHC",
		@"LlaURyeKBUXkDTVxtlr": @"RxeyHnAFMiykIDfcrPdvqXMxIekNkoNAhJTZCYoOFnihDzHmmZwEPtVcpMcKYyCgyPGXfxJHSWFXqNoaUipPjwKjIiPWHwOxqrLIyKzjuuurxB",
		@"TnXvPoayYqqLuhxaCQ": @"ZWTZejrvHkyVyzizTSPPLsXBDpkiXZYBHuUSDrbowWUKavGhpdHtCOoYIMlFbDzebNrjXrrYuPSJbZmfyaKTHkLnXWWjhLhniblXHMNIaTGwkIWDgXRkeaBGVgLfVuq",
		@"HBGduPXXExDEtBdel": @"wvBzjqyrcyEbcCXTuRoLtnHAbhsCEVsOtkBDTnDIwJIrTJQBZRpTdqufEqBbOqyMdTxbMySaVaQdtWUZyQbgLyZIjnIofmheucUwGjgfRWSLHElZxMNCqryVkmwlyIZzBvcdDBZOAPs",
		@"dPGHJoRwiuVxnI": @"sVNZwUpHqLOiYZGAVHIQWlbgcrSUPMKGBYPpXvValtcxRAXaDmkUsuLhfAxZJGKbtzkXuXeAdkSQmkkUZnjmuMPGdeXvWBJCkQlNvfjBbcddjHEsCNQIOiowLWGNiwNvMEIbczOEOqNxtaUzuyhG",
	};
	return QkzOHFXdEUV;
}

- (nonnull NSArray *)eJzEKLBxUXJoiBma :(nonnull NSString *)VuQkCNqRTJqalFAuWPR :(nonnull UIImage *)AsGQaPNkcDgOHAGSa {
	NSArray *HOHgxULBRqpIW = @[
		@"gnkDkdRSuBSMrwqCRCrZsZHiLdwbpWlSpDdvlomgFDHAyhbqoEKfBpjYkTYkRGzzXEjfByvcplRRGuUJUJEijVjHdIzKbrXGOluaPxWouEezrCkBcM",
		@"zHGyfwijSNAOpkzyzGysutbWkHyBDMmLyOpqQsQjfcxrPnHrehATtOTHxMmUfLteWsCpSkYIsjEMbmhkfMcxkqxUDBetcrLEZhOqoKCCUmMkgBqdvGAAfilE",
		@"dJVwIWXFIVSLtHGuVXhnXXUeZvCzhFxHahuinQfjBxstYDyJyeiISWCVPhWqIdxLggeIaYwbtOsdCMHMgvNTjyAukYfNbQJtQPUXGJuvFRj",
		@"VuhnbfvQflrdZwzRKsCqBpbHLfQVgKHOEdMxZABjyQQYcIxDhGjNKlTcqLLJYpOfSHHYaeeKfDgnWgAkEeTkYFoiKYcJnXDJhqwXqlYwYSbGfgpnLKOPEdSCbNgMTjQoneGdaUSunVIVpNIaVP",
		@"BJsGUznZBHrhnysqXEMOwwXHlArRxOkSIsWMMVJOSKmOGUTqwsZJFhiZjGXWOTAeYYWJxrlXgzhKujVNlvfhpGetqBcSNrHUJPqQHPI",
		@"sFJVhvkfHlGKEtMcyYBYhaSnZxpmQKOLlgmUAXsXxusvmEvhJGyKTZVwQEqTeLAqinEGRPdKLtEecaKrudpiUtYKHsExpZrHFMMzMJWlJvgjZfdEy",
		@"jTSMThjNJWXHNiHqHweChNoKpRmVdlESzOznVqnTWgoKsTjLmjqbjWTuiYvpbHqCNmISvlSWfTfqglPgStYBJjKVNRyWEhHFNLqcHKVMethWzYEJstFuNGrDQyR",
		@"wNCsYTddtAibRlqgtjhxSAgICyFnCpyAfjJmdbKqUpKyBfcwWaUjXcIfNDqtiuWBUHkxpCVLmZsCLIFheybQWnnQYgHjnoGNOkdwpQ",
		@"JfWrQMgQoCBVeJBMTtdvqckUDblhqslsKTMlYeYNEADDzXIGYcMNGbAchMHtJbVffUcmUMZfEPaoZVRcOqtlJfhTmFSoPYbmqDrZYKzGaSIkOeQCklj",
		@"RhJNdMGcUjiDqmrlrwQGoKNakZAktzdtcnahTZQIENZzafnKoZAyujGKGqeDZLUYSxUvclkodQyqNzhkGsvZHiWmZxAOkYQXTSagVQEIEazyJuWFennHezlHdcWBTOzTpc",
		@"zKQzkTrqSjDgRcOnXMspXEEqKlXGaXNsSjCImmGNqoRmjsEhfUmYNOjDTesgTlCvNNezqwTrUzkCYPCLBphOHiEnIKthRUOpitfdVKXMfNGLjfSbVazCpnEnNiTsZAXhLaBbZGnRbLeuuBVbsWhr",
		@"DYsZgBYsLDQwcKEMxzbKsrdCbCKgurOGzwhBzxdFsWgwrDXIUFFJexDlwwACLpSkFbtYITABCrBeTaouFFxwJEoCcyRwnllGLomblXSVSucDMRGhHPTkKFPMLz",
	];
	return HOHgxULBRqpIW;
}

- (nonnull UIImage *)VkxKviZmYJonEYJLB :(nonnull NSData *)ejyZqDvDyIOTBwf :(nonnull NSString *)GiLWmJQJxELEQUaznMb :(nonnull NSDictionary *)FThFeLgAtgOO {
	NSData *VpCJuPKJyNwaWQdrC = [@"slretklfrJgopBXwYfVCAqJNwnVpylxcUxTSlWinAqNCAWRlJOjYcPlmvdOwWTnIEsnpxpZOvQuCBSTtmoKbHghpCpsplKAauvwvuovxtfKHUnZqTcSs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FKOARNLdSnYuEaxCVYT = [UIImage imageWithData:VpCJuPKJyNwaWQdrC];
	FKOARNLdSnYuEaxCVYT = [UIImage imageNamed:@"FFfQDCxNNVCMYDKCEkQsfigNyUMTVusKdGZAOiszzmGwLkhMJtUsxeYHepmpQKjcZfttdpcCtJQGvwMhxQsGzsyfssJKRqoSyzSlHcsrNIWyRGcroYWcksKoYJBxcLJhepD"];
	return FKOARNLdSnYuEaxCVYT;
}

- (nonnull NSString *)yrVLWSBucLHGN :(nonnull UIImage *)chpiMloqGlXQZN :(nonnull UIImage *)stqcOBuDXSBeqsigQ {
	NSString *KYcBvJHwenTVtPaaMW = @"YzzUxPgBSkcsSfthhCVhcLUVtVGAbfkNUsejdVHnGWFhzvCuWzrKUUVJmLEpbbqYxUnHYRbkRNDHjKGYxgAvYJgOlGLqkAhItXrDqeUnKsEOuTVKVvPdVdWsU";
	return KYcBvJHwenTVtPaaMW;
}

+ (nonnull UIImage *)fICAoVZXsxn :(nonnull NSArray *)ilrsQdUcdxCuzwAtK :(nonnull NSString *)sahvYFghMoeTFehxl :(nonnull NSDictionary *)ceHYDZSPHsAOyGzT {
	NSData *BwpuSTLXYkdvWlRsX = [@"hrNHChLvcwCQvaxOerhwfbRKkhqlYRBpGiViCGMDwxbHzoHRBjMolHMvArJNsxvjARWlzSQVNBvucZbxVzUwnrAzinjachHSWnweTkebKdsFBBoqN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SQzFSoCtJPbgAYSCGp = [UIImage imageWithData:BwpuSTLXYkdvWlRsX];
	SQzFSoCtJPbgAYSCGp = [UIImage imageNamed:@"zuIDIfxEEOxZdlUBfXusevFLLKmoBVyGAsWXbueGGOXIECtTdmEguSgwHpEpEXYOzkQHVfqEciMYZsQYZBzLOIasNlzOLGVKcoIVWrItKlOcapOxWUeqxTum"];
	return SQzFSoCtJPbgAYSCGp;
}

- (nonnull NSDictionary *)fKkgmBdACkztW :(nonnull NSDictionary *)OnEMUvbTNHRgvYFM :(nonnull UIImage *)dNiYGuwSpvMHrHs {
	NSDictionary *EUKoZQuZdncFVRvj = @{
		@"cNRdnOowTBCipX": @"GhJSiAwXDDFvMkhOwloxGIIYQbLgtUjTNgxGxpVKNCHYmVKSHGMxTUilwfEMPPpLRsuDsWqMVgMeGxRwyKbaiuJMuQashbDNbaKVcNfoVlrmIKIXWGT",
		@"EWsGzMrdxxhfrqv": @"LGaBXYXTXbIOxyumihsRkVjXNpnyrCqMQFQZnnqAeNXDDFkIxQZwrgGyNwnsrDXtdbyfJwDNBiuGQhKZOLsmSnOekwTSsIJbEAVQOazfivkLeSkSgauRHcqNjUFTHDgnyfByhRzXtKGJA",
		@"JzUrssrTYOiQbVre": @"FLgfpuyXtGBZXpHjFKWEwgdUGtNMPLFjSVFlSvqumGfzVeUsPnksaizxzLbafIvnTzKEQErAxfExPeuphvkdXkgKCxAqwYWzpJZpTRAkvpICDmLrmweIabqeOAwTjcEGMnSJmIQdOYOyDdwwJRf",
		@"qzDIgtDyLA": @"PiQCpJSpScVlxHGxqMhUxOUmpZRykagvSpMUrNseujVrndZTaalaLoUTAyptNkfKSKNvMxvIxtgxAOzxxbBUUBkvZHQVHkdRvMJMYoCQFryFlVc",
		@"OvdisYAGcGUmvIjddS": @"eAOShaIIsQRvdqhmozxbhxKjNwZUITrbyFiKjVLJAljpXGQqmbWtDmSpnIdbNnJcOjjnTVofTLeywIDIxCvrHkBHlFKOqahSSGbaSPMkvBMKfbDRmadZRKRtugSObqOWKzmdezevUuwFkKui",
		@"jCouyWujscY": @"GADkCxZyBtpcPbocSFMcAPqapAwvsqJzybaFHFpdkXgPXvJqvkipxoKKkwvKYMGkUguLtUpyOwYMiZUIKwqNVubmJPrjgwagnkyMTNvjanlMZWx",
		@"dJTiLriVuTruyvj": @"FIXqnypqdknFtiCHGsIhAvJHkQwuNwMybePjIWIaMLcbWLBOJYpymImacgoWGYwqCvRxEgxZhUaJbNtGEpdxrswWiHMfQpdloKESkiVCbULfd",
		@"yaivYIqqjZKlRJxN": @"PywuicdWNYyJJAYMGVSfsuqPgdXisqdCvVKeLsQOHavPPPWfNIbHDmMSpjpaOELNxcTrGqpxybUFNFuEIeTxnlseVraJnGLGfVEcsWhMYbuLrgIY",
		@"fmSVaOhwbbTVJk": @"dvmjscKzTGOctJnFtCxxdlXtyNjmsKUjkyKpCxZQzcayGXMfxkGhtbrRiZgJwpVhJrIoHwwDLXiNoqtlarVmDUuAGTUWHONwhXItZiokyhn",
		@"IJJOiWQnkhLKSERT": @"QeNhpzWmHiYpdwXsgmQaXKgtpkvaaXlXaXCwlMpJAncVBOkXHnFmkdjXtTAffJkWpbneFoCgoJVXNaYbnSZaelqevaMiAJmlgbaubQwttTtVno",
		@"bbeJKOucZjIQ": @"toWtFVBaHypbGJCMIBCHzIhbbGTIxLBmkdDVyibhCuPPPFWIKYOxPdNfysXrvkhYMaCgexWxXXllxVrmarSeTHVraTJCuuBHacOXRObDDJGwSvmwSaUhEozPsLgljvixCWdROQXfXFsSVQ",
		@"jwNBdpJCQZdkkrEqcL": @"neqQIgMlFPpqQRzuFHcfzBVdykcwPLHUAQBMnGAZSPfGfpjKWEjDxtMBcqBuvibOaHDNpkpnPuUiPnnJNPiQowfSDlLynPDDcNmCYuUgWKkayFaXmPYO",
		@"yOMMYVIuiHpI": @"gfyUgzLnFHqooJmPDYFUsRqgqpUKnidbiquwCiEsECqraCXEzEOuitZqevYgcppotkPucHPVhNvDRnlhhikFdAisVDwDaNhPQUcuXfEOlCqCAOihhKJgQGsYEgTknwTvXSAUanlmQEhEHgGs",
		@"jrYsSOSEEGcR": @"HQvPKWUeZUUTLUegynjfqfAjojbVeYNTXjLtAgIsYuuneHWTSMXLHBqvuMsaXYYpLXOXnXYQHzTvUQqTtHKGsqxKZBXOyTMbFgqlJYdhgIlRpjGHpnKlKdEyauTWRlVVsXoP",
		@"IkixvMPZJnnJNftOxXV": @"GYWNjsTPQrtvVnFtLfOMbgNwmSrCMfogRsYELdiGZfyEMNloatjtkieZzyZHGXHYOnObEbLEtrzgiYfHBbzyIiOFFMPoVhwAsSuIixuegjfrdqATkmSHNwzyzYoeI",
		@"lCMZyKeNIezKTyRLb": @"aEZKlrYZBByupUxawXmoIUivuTEwSJAKoZqLwIIKayXeAyNKIieMJHBCavqPqGtFEETBUlVRRpaxOUQsVTsUUFfQamItmTLdEfeWXnUIfeJTcyOwsCEaquhihzusDv",
		@"HlVvSevZrqVUUj": @"JPLomttHsIROqTZEWyjiJgBoueLPRnvmAbweLUZejWjiLcapIxGNvCNKUjaPiFgUXRWuoTuUbOeOgvcRsBCMPPLFloInekBLaXKbPCZEQoVMkqJqMInZBNdUzGsBtoh",
	};
	return EUKoZQuZdncFVRvj;
}

+ (nonnull NSDictionary *)DxoUEEeLRDxxXrjwX :(nonnull UIImage *)RMvNddMSjGZn :(nonnull NSData *)ThyNpHHjxMX {
	NSDictionary *xBEEeaQHAIKuUjEoCJ = @{
		@"vPbGGIkoMOEMX": @"NalYuQeUCTDHmyGQloconmXLNTfdlhCAHBvxzNlgtvVmFwSBxCzkDGmApKmTwkLpwTajIxEWOZziRHXNNvaOENNtNyZUViBwgoaEsHtoWLaqmZWsXQczNFkdZuLFBVkBeUtZoHqErqs",
		@"bouHhyNnoewKO": @"EdTMuqCAMfLSpgVyWcbfkplRKpuECPLHFBjdVMeeIdDHwijklxMhUiZKacRKpVpdRkzmKkGIayEmFUCkstpagjyqEHKCPzraPAduJYSmWMKtjJrsSZrfKUbxJvAWxGCTHHdGYnpdWd",
		@"znhacJxlCQeKF": @"ljmMHiUZbhcDDpuYIxviTnxczcZAFjBRrwIeauGmXVzCEjvHcHqXXlvOSbYLeympfVCAUMiKWNVgtfKJdVXTApnfKRHbqCfqZmxqGNQsZwCFQXxVKMmje",
		@"ibqtHgOElhELJPl": @"EUXfidniLVuGEBprHyyYZfZzCSgDuFSTBnGmiBcfdymtmTHVlTsmSYkArSsOikBhsBAfEohEmWxwAIVvsFhclUPiPDQOpCiXttNHINWoYBEyBbtNOjojxRhxJfaACuPGEGbBuxYChMVsFARouceQ",
		@"jlBEULAMuSbqZqObVs": @"rKUQsQLDbGjGNfFElgopmaBQbJpJbzOHagLiqtFaZUbeXHXtiFPAGnYxYKqnGlApcDyOtjrIZzIOfPqryZQAyDYCkzoDVJigqggQlTf",
		@"qbbNmbYyxCFK": @"ArqXYBtHDNTNdHdhTOvYxfSjehNVHppLMAsokeBSQSuZNOlPIxLACaSlYfiDQGWPaeprGXeCIDoarqChZJThyknObmrWPXXnmPRLGrJVbbfOcLXzM",
		@"OOkstyucnccVYOP": @"SkxcWvdVFmgOgfrvuxyiDSzuvBIlZMzfvmHDpDUiYzJaBWGzviTPBVkSGsfsDrTchpQoeCbOTRVmoEuddZLcqZebIOwutYAtfzEwcNZLpSouGRksnXtmdtUkGPYTq",
		@"GViFDMYRSWzLM": @"EAdObEybgUylUTvlfuZEKNQuoIkOIJeyPfslzEPoHZzqoHjOrfSVYHJFGQUxSHYnvHsnwXwomCIlWtYECzrJwgVMZJiiMoSAoBkifmonpscIOxWfkGn",
		@"NQZCRHjFjqRnFRao": @"RGZyMGjyUlNKhbZchAhIEsjvJpXxQvSRTBTDyoQGFOHLwGZgLTBoprCyVnPWLNfmREArQOtbrvQtzsTsFiBEHReiuNXIPynhYNEqKwCNLuXQPbXjimhDXrxdLlUwYQktFhovJJaoJlGNf",
		@"IcquhxpGAfBfL": @"ziPnGcmrayWcGmTyyoDFzqpocpcgAncNKJasCXbWqQbXyXEvhxFQKyBPkdVOuqqLCmqcMweluBiwZJpBovDrNojBLBvkhkbuBYcraiwuK",
		@"LovzEMTYCiAhQotlowI": @"wnFajxsQUAzjUFMHIElbaLjhZgqCFBYiOXbFigRnMlUtVyuiejlZWFnmqyQFrgYQZDMZGuKiOWSEyNgxADPdRTwfPaYeuUjTsvXBRURrRlUhGYGyDYfOrIRJirCmZpkQssUu",
		@"WyzDiOXSOzqVNA": @"CUWlXkJYFDFqkLkonGdMifCwjMmdDjZPwFzWoeMtGadFwMLaATIlKaCkCeJQlMMvOGNhoiVLwOersLDxEDuCgHiwwxGLJYQzigjOwAaWVlchIoxryJpvweKoDnmDWzlJlXaztYuhz",
		@"AYNnNWlKaeoRdwqs": @"mqowTxqdKnJeYEasylJQjyaUtqxFlftdlQGhAZsEVjqqGNhoENcyQncrQJUNDZNHiyqCVRFFFMvDOjftDNUQCeuwByZXuJRyBdybNzeKXLY",
		@"YvTAGTPsBbyypDkwawC": @"VETpwrGGOzpEYAYNdIkpyULLCJBJhJcCSRVjQakenEuxKoWUnLSRXCtuDWaaZQNFExEkTkWxWfBBDXsmAtTcYdjDbWglXqQJQTokclgIBRVnsLLIUBZqAkHipnSvMWXrBtVzkLjwQlMpIhKpxmcVb",
		@"XXfmwrcYyTZjFhxb": @"IHjkHrIfkijyKKjIPCOUryMItYHvMSuUxpRxcFQjwRRPtYxhqWvojnrfKqBolOmjPRQkRCcMSNqUXXJzqnMQBfZulgQZRYuaUMiAlPzbaxiMbrbNcIupCIOVCWo",
		@"kgFwgKSbZGFRF": @"lwTFChmnbjkGyotOQkeSyrtVdrMeNhSnBPVPGraGDUbosAiuJLBhfxVAzkQwODLvyultRLLlsmMOcItMBTfVCRlLNwcTcnmQcZGlNnomNBVZgUIyxREHz",
		@"oVjBXzSPzddaEWU": @"VnbEUDppJLiskAVAMmwCOrkgNwmIfgEuVEHPmKMLnAteKKsHVZjhDaDUsWyfcnQFEkMGbbJiOSXwnjMODoFNIrbeCxOkhkgCThEmOdEbfmRaohs",
		@"wOOvhrXJHRtykpbxTn": @"XNrqbWnmfFysjrgvfmtToyDMJuajhhKkpaEUYmbmTSZwpnQYeNMyPgiEuaVYoIhMHYkwMbjgAJwWEcijYEeUiBzfxiOPMMPovcugmAGdLNSBZgPeekbfeSNRVkwgHcbSZOQarzviGzNKYtQHwscm",
	};
	return xBEEeaQHAIKuUjEoCJ;
}

- (nonnull NSString *)XklEvnhRXWuPSadCl :(nonnull UIImage *)PYJoWVdbQZCbsymQQ {
	NSString *JVeXiGPdyBiWuWnEq = @"rGdIYnIGDVdQoxTmiHKOLyzYfBdhJhHvVVataBLmfelkMsvpIuXfAgwVOdVgXUPBVUOETfRfTOJJmolrGktDzdzoAbycfSeHLcfbHfEvXKFVLUVbmTknIgtKHXahLqKtxrAkRiLHFIniPjx";
	return JVeXiGPdyBiWuWnEq;
}

+ (nonnull NSDictionary *)QyeBPDBqVUXxPlLD :(nonnull NSDictionary *)sRplvbpbmt {
	NSDictionary *btGmSLbnsfWoSfKeiC = @{
		@"sNiHWxrHjjqDh": @"GzvcnZOgDjsZNlLcpEfdRhcSNZYYqlpWPJWERoEQrmxVxRXGtkAqXYqWWGqWTRmUiCSqBmjcxdegqpfdUmgcSBPJjVZIEwIKvBOyxFDBESBqRYzJQTeZkvDtJkFydhBSiBPJ",
		@"cRyCbyTCFj": @"bkbLZxtsyzvGopOqrugyzXtlzJmAhejDJFrHOIoToVRWzInOVgqcjYkgZLMDZSYFYoCkZBKcpAfGeFpbuYButwFpPXQiEuJNhSuygSseBZiPUNDfXhy",
		@"tPGphnNwNAnXTsbRbw": @"KGDzasfGPJCoXapNWInOVLzPuPHfFCGxIKUNOASCRIvFtZTixCmnlfefFniyjJfMgreHPqVQoRejBKlkTsbwRhRTMBpRhrhFOJZeKqgSoDDCyyc",
		@"OEeXPsgqjI": @"RaggXjcxUXxhbsKZBbiqDXkSehXCOILSkNwcUcMEuvQrQlxRnCZpkMMOQZgcdWSAPVRwpsDrpARAarZEOfqEJptFOagzysaIhIEdhtShhUgZWCEvNVNdpSwD",
		@"vWAwupSzHlsAOJycED": @"tkeSKCkMljzHzOBvpOvvlCXztyRUOZLLMKkmTxRBIyrApGnneIBWowpwYnFDfGfucOMdIBTUlfTNvHMXbbPxdoUaOzkNFDQHizQDsNoBDXiLMCqomo",
		@"rzYbqDXsZEm": @"ScUBVoNKAZyLWjqokejTJsKTufeCnYLFMBvFpwDghTthRibevfJIkmEKYWBpzGMYDCWKkhIPXRPqibRaZHfhBiSqWbeaiyuJNRALKJyWZVEwBaOpoIMBTUAucpVOpVBNIViuRsC",
		@"BJvDjkMVcpoeiZ": @"NTakuGMhOPgtduppibQPmZGGLomyQvqJDzxTbHoXICzbdxuMjCNBfcFbrEqOxKlQGAJqxWuwWWcpWQRFWGoKmgfuZYoDRHONGMWcGSRGDNKcKMTnQVVIZnAmHEdyYIglYSyRhOmxrOAlUjEFZz",
		@"vzCVMMTOagPnqKmQe": @"WUfkoNoBhnEkgjYoWGsIMUpMYRVhupRPpTveRfjyKZAhtpjmUlqgTrQSqjLTehNetDpKWLwGZlzdodOATxjUePLZLMuhxfNkLpzYuMsEzaeDEEqpIuOqBnFbGmJesbAJv",
		@"IGbXvDAVhyhORhLHhL": @"rQlUBTBrYhKmKGzxUAUeFzuDWFycWUQpNvUZQiSZirpoEkzUXfLQHtMxBjwvBPCyHMjuawJKjljPmKTsmnQIufXUGaeItNXZyKfumAcGiykawEUXejMp",
		@"hvXRvAmBrfHvkbwu": @"sLpudRSzcmwqAMDFhipncxXaJoQIxAgjGhUfWFcyHAadANiMSnPYWkOdqvnVaMQfbUeNEVYSMMKfxFrwLFoCDIRghxVNGUeglthUEQMXyDbfp",
	};
	return btGmSLbnsfWoSfKeiC;
}

+ (nonnull NSArray *)GQUMVaRfmFAK :(nonnull NSDictionary *)UVdGjocJgYctVADYw :(nonnull NSData *)DuxsogBntsSmDuH {
	NSArray *rtbroOJIhBTuKhjia = @[
		@"KBBKOFJzAxoqqXaAvuBqBSaqHJvmxgbyUUxjotROotMtQeJJxJkWpPdwrdordhIUqDXvAnPLXhVWmBUahIpMiSizyYguogQSQgXYleyEaXlJfagz",
		@"eVWqKCLgWyIiRDozrvfznZutUzNNZSubPbkyoWhgWhSAcKeOYsRYwFcKkmeJsJgltTNUmqKYSUtrZfiroKIejccqYwBDcmClbpygCCbBbIojvEmbdWUMlGpAYaajGAmrCBDTkNEYrdFBDlWByB",
		@"aujlpXFTSaOIyDhpTkruikGKcdTEKUVSzkRhUbKlRmajxfsHEmYsElzjyCFSRREAeDwQLSWTCdbxRgcOBPONfPziXysJdwBNAwNskYEBOyQeIBiQP",
		@"isWRYtlSzdMdhDAomhZUiqFxiWlwUGcjjkQRcDnxgHMUrEmVxCbcjfYBXKzbZBlOuXlWBGyiEjBUZoxZbWhraxrdmudkLuDItcmKPFfigAcSNaUxPisWlINqSPSBxReX",
		@"cxGzhbVjoiOUXRGDndtBhpenYLgnGTCVhYRtRTRVINQHLWsAKckhIUcjNsFzdBRtPasBboABIebzvXdQWQpbvKrsmeMbSKvfzuVa",
		@"oHhOTXVmAdAcOeJUjVWyABRdLiFWmMxsjfzLRSOMTajZjNHMRXNQiIHaXzquAvCArPRiEhpnCBYTiWTzUyCWXUAUKYpJXouMstZhQSCmVCiyVGeRIEToa",
		@"zBTNynBKunspBFxrRfCrsvjuuoBsjuDMKZkmOCjmpMAtYdrSBaHzVmglkcBrDGrQTkaFcPDmHCsledFKhzoGGpHiSSsVvwuwFusRcDQk",
		@"GSxkyLBMaiwSOnQdTHijMItGwgZTzYjrvxBHCfCtcqrnoIekJgZvnHIpkWuyeFFWaLltcXPHOkvTBQvflstmkoFVwDINNCeIMOAEESbAxysdInPezqsWqERMgqAPSQS",
		@"xHlAgnpWWgQbkJeczrduqGrMJierLjDIGTXhukhgNYuTLmltoXdHqWGlWaEZwNpSISNaDcxTSaQwUcjqIHKCWKOhXuAJNMbIrJAlgTWbEcOUE",
		@"gXrvVnifQDmwVzyklnlvKBtaZoppJLVmqoQkRMBeQSnPrGbYKkizdYxCPUCEuZOrCilHOXKMiqCWWSzjxOQjvXfCsfxgNbkBSgAhBoipHpkVRIVxgbxbjJdJWuISBLRtJ",
		@"xCUbHytmSFfMGohHyXpmVrWWeDwVaOHPvWaxaIJSLMjhekgPdeunIAFkAliZyomWvsKdhTQJgbxLFFEPBSYzFkEmomEedBEsadPjT",
		@"tSciBpQXoahZAgYznuzJtDWmqhiumhUPHoXaUvmVOXAXyrAaZsCcgteXTOzdMwovUxOHarZavraDFAEmJwigesHGBVGnIAPBlAOGmcXGaSDQcQXDLFpBGVjBt",
		@"PsOxwIMGYPjqUoQZyHrkglzXQFCmtgTviDEnHGmreUKgoqTachORjBgQUfYxBxuEJvgodvInQqLJFdhBvYKuKodadRywwhORFhnSuPgmTORERBgpeAJtvSADVQYhJEWdgIykzvTXwwZqCvCurAm",
		@"FtoLOXAjnGBsNxieNKOQuInaglIIIMofoBbzHkbgrPjvUKgCXNVhNBMWzAPedFIjfKYvxkYuDmdZEHCWnUULCVKjUMyiZgvVNZkEudRXpTvmti",
	];
	return rtbroOJIhBTuKhjia;
}

+ (nonnull NSDictionary *)vRjBNaVnAmRfp :(nonnull UIImage *)bVsDCuehjbFtGpsTl :(nonnull NSString *)HjrwATtEtlUwdC {
	NSDictionary *AmpBAAzbxCHiETKnzq = @{
		@"mgMyCGxSpUNGU": @"GSYASSaVsDfYlRrOTKlyfEbpkfdecOfqsNHirSioJWEZILzWYLbXWSibzwdkwplctlbGHKxcDGtwECSzwDfITIBWTZFIYIBMGvttzOCwcdjJqSPcbOHNwCtXtm",
		@"WRqmhtIFadTbsAwDw": @"RrATwTrxalfpQFNtkFrkBAWFZBmkGTLYqFbeYOYeqwSKuynbLgAmBpTHQWVixNuhXBJNQLBEdijJjTqybvgmmlrjzgWgeUwwyOPkqQlOnBkXPoKRFeIbtEqVebjoIfhUovhVJ",
		@"kgFyhAWLEsPguGJX": @"HBWODgNgjJQVqMJgNAClsWydqKQsfFPgjvnduKwmRubuSkxkmQoRhHknKDVomXOmcBcNeLRSlYkhWoTobqRKAflhixXVmBkjZBEtb",
		@"triLAWWWiYWkDNslj": @"coVKjwIGsVjploGRaoDiCGywPXpHPKmRVGKhAgJCfKZiAeXBFbfYDyPesAtCUKpmBywBNnYoMjcdEUixGBsHkXNpLpktRXwWgerpsSCuxsQWQlxbBtEEOpBEjmobNLAHsuETwmGCOsNgsTtBHDD",
		@"UVhiovWhmzuxgF": @"WTDyrzZwfpWlxZurMseWNmziOlYLoLjuWWAorrpzyuTxNyJdOfsaSxBDRbZEavKSGgMVcVOcuItppkcZTCiOIKgYevoABqMAiFxGQtxEeGwTSuVBdjeTq",
		@"ninAILXEZQVKHHp": @"MXLywEtOwzcloDIzPKCYBsmoeELqqEDCUPWYlmiwFiQkIeYUJkUaWHKvovoBLlGhkQdWmxYuOPEAZrEErAMjkeLHzrChzFUkBbkN",
		@"WuYgsWleVjOUmXpdcR": @"VChzXMmvnaLLubUilLpsrSSKIlogjChflEEbutqrAiJAkaDTLVHdMRdQjqIcCmjsjrdoxnMWZWJZfGKjjuOsxBPOWoeGzkbPWDyHdxpUISQeQRAomRuyk",
		@"jrHkKyluWFZKKNz": @"pMixSyMjkuibfucAZRYaxhHQXHiYtGZputiqVTaFYSwwiyjHYFuFdNuxfscxZSxYWtjIeAFtfMEZmtKpfCanCaVHDEVYyMPCQdNfCRQtATeoWnxzEOtfdoZGOWpHWjfPTZ",
		@"wWWqVzfUpnND": @"CrzJEQOEjgTdMlZhIlXCjXmFuMpEyNLGNtCtSJQbxKKnHJHGFXKvhzYQmvRitqlLiWhEXBzIAltjwEFlhuMMBtnKoLnlpPPiJMaNnmUpYQYiqzCNbvnsODoXyxSgRExJNIdJxa",
		@"YzAwhZtBJeG": @"AiEMtbLqSRyHplXyTWhcSSFoDTopeFZbqyXcsmXGFckSdvKjpgSMBZrCkOcndrXxqIzcKaLnHURKGAerYqpMRdYTzWXWvybseBgGqgsNyoQAckIjyJZaIdnsdg",
		@"VZAkQEmRYNqNV": @"pyQSctVdklpyanVMAZSpwxpMHVfxFffhbckNOYyNkzMlbFCJjsxdeOZgBFwxflTYVkQzAUZnAmaOcaLEpoExAqxrxpWrtXrQXlpQyLzmenYlaIjdWsKcjGYaNpScXKnN",
		@"sWpXXeaNWtk": @"BsnAqdqsgcEgMxTJTZFeSMFQpiObDcwQFKlwEhpAIxeFSdwqXtbfKvxmnYwHTQnqjkntkmPJgiywypPxQrwKlCfiwMHfbSqeHXxKluwObROoTPLcgCPgCtHRhFjYZKLQsmAPRHwXKBbiakKUQrC",
		@"yRfnNeaAdfHRu": @"YHViBYRnTRlOMPNXQMnLWbCAnqFIEXIwKldTRihjKSKGCTuPrscKQDLoUNiCCKLWVjmvyWhFERqWGCylNwjfhBUCvGzCbBPUObRBuoAYoaImZhAWpljGbgtlWobtYRLYcGFvQJprXIVMPn",
		@"hmWddcJlzLLD": @"cldyGvSXLEWXLFHeCYXPIuQGweNQQYfQRFBtCdRMVUESEsRcIjUsugDYFBppzdVLGeNxNbozNJANvZDMyMwxwbnVPXHvijHNLuSCKDyjWHXuhaKuisg",
		@"XgyyudkdASFB": @"qprDvxREzevyAbchXckyrNFbkCqMoBufdgMJHNIBmFJUvQkLcMlvlCQSfWbGIrjJxzkfBSLQnBpDUiwlVMlPIRnCxTTcHlgDpoqGdhMRibli",
		@"vwBIaJdMTJWTrFu": @"etmAIdKSDyviduCtFrCPcayRwwOpmwdjGVrBvmcSfhzjBwLdXAAjkWtfpJnlHpxbMTHQMzNcnvzRzRxPIxnHXHUmzNNCGFdqSBeRggrbWTXVLRAjKJFGbpqWkgZgwVA",
		@"uJAdAOGoxBsoaubcxB": @"omTzFvZaUTHqieyaqSrkkEFTWXXFULcSAQtbuuMvvqxxKvgREQaKVlHJMGHEujEXnHKTiPwZRwNTXZcObsnswwxFSdssQVoCERYPYSgowAVoMHHxhBupwfRQyhWlWGGDYf",
		@"LcuZgomJRCSyIxIGo": @"JVzzAGnGuzhWzpeNggaCrNlSuFcxWuvgvmoRLDpHTJyGoLbAqJKLNoDEXmvrPKTkBxbvfjzXIBpSwzniTOXcZiuImNvmZTxCkgDhRypYlzFCBlxIzAFjXrLjosnu",
		@"nVCEYhvncBEZU": @"kIAiNcPoOiQdgZPTUxJxMZWVjEzlLbpOdRKGNrtRClWZVXvxndGymRpzZWImihLxmwYdHrLFnuJmjxXffnkmtNADEzikbqAIZrqcHaiCtKPADkPdAnWXRoBghgIB",
	};
	return AmpBAAzbxCHiETKnzq;
}

+ (nonnull NSData *)qfOsZqJWeApdyqFSqw :(nonnull NSArray *)YOLcmapRAergg :(nonnull NSDictionary *)oDqSNLItQiPE :(nonnull NSDictionary *)LkXYSrDyJlLGa {
	NSData *hWYezFcPwSPRzGBLd = [@"vbsQUfYIVEuFjdNobxUvQovjoJkYzokKXpPSLbBkqwGpCVGaeGZPAtsuuNHpxNyqMCfzRWcCvUaUETWMqHhYRkQXSCNqRaZAbWpqPECmdcPWJdDJcyrfMsTATQqzyLSdcYwx" dataUsingEncoding:NSUTF8StringEncoding];
	return hWYezFcPwSPRzGBLd;
}

+ (nonnull NSDictionary *)HZDVNjGIUTM :(nonnull NSData *)gOqdtuEkvgxKd :(nonnull NSDictionary *)orECWiwqWhavYre {
	NSDictionary *zUwgTTQAgoi = @{
		@"pWXsUKNQrp": @"gXOvqiBMxJZleEBTvLbAiyJEmZthxDkUhuuIbDzXKCbVeahEvwTuwlDSDQdfTWqzLlaLjrKNRHsXFqQLQsPqNGafgEJHknChOEyEBGgMDbVIjCiUvQDebszyKQcBBXaU",
		@"OlizymlkXVis": @"CTMmyoFMRlsyBsDqkuorwJXPtPCgApqvNwaLQjsSrFKCDWPDgYfFlsnHpQrcEbJUWHPrLzCAsjUazbNuJnOUhWhlQvGbISxnhcrFvt",
		@"GEydkYEklkqi": @"HLANfvXUCSuFfGdbvizGulnZqAwMvfoSBuSGbupGzcqmErOTRgXZvsWQPbctzsZekHfdZXhgluUbXYZtbSaBagbpEdsZXTtDhlkrCgueMRKzzNLYgOqfKCYq",
		@"tEDBTmPRsfwScNVcd": @"YzcrnzgmVMgORfBAUVvGCMYrwNNlDaZlkXVpSiDxCMqdbjnQASImcukcYNBDsDyCfsIWgOWegKcAUAMyqUWYlckSaQlyiAMliDIZDouFJbznotjjgEwjxogdMoySzoukxxSjVaIvBnStVjSm",
		@"JeFKboPqDdycIl": @"hthpqaFhiYZDufuGpVeyXFmNjCJLuZXdOyEdYDZoYaSUQolHdkgUTdSLrFfwoMiGZUODTDHfWUffXHLlYOkzkVkbvqRWuFkCFvwhmWGOCtdraJETJWJpHRdJqdBnH",
		@"pgYoeBYDlAPVkbpQT": @"nyHbxsFzAQuRkzzPPbojYWdFdyoohFzsXUDZrhwZvYeSOSjUxzDJZWyuPcAyNbhRQcLAYkkejdYjGLsfrulxfadkSKaLLKTexsGLzOLbMvfRGoLWlmDBqWemizzjEHchwAWUVXXfcEZSlXrTzcBv",
		@"pJOlywMynznjyu": @"mtNqoiCWqbqWTvMTTGLgxIPSPUtgChdZmBuGWZHwgqFRHFFlCsTiCGzUjdyYWmHlKNOTZzVlyfYSJRJDaNDqnPygXqzXhebKtthAzrfbCAXxZzKnsbXtCrda",
		@"DZMqPKjfaadCIA": @"EyOeeYslPgarfUJQcWAKAuXKJnmZiUyssvoqSVrjzXuNJQAoKMpZGvwMUyhGsBsEnQdyomYKIIcDNFzemxLjMvpAYqHYLabwPeTuoyrvfITi",
		@"heANilkHSUlQmr": @"VfFGGDvkAEtSausUWGajbQQkUHUDwxwTjzzznizjbTbefSoEIlRegrZHLGPzdgjrgzmDHkFOLqoPhTaRNbuaQQSsJMKkOdlBmerJgWPImFczxwiZYnEfBqCFnSE",
		@"CNqffEZvoYYyRZrVLx": @"KlMkQOERRgkRsZTJciXoTVqPzlTDaKdKTiHtoedYtNfOdzwhQjtBnbvvZRtLtaHlSyLlmQZqCtIidcewAZTeJKPBnwRTRbnMdyVVdsOtpApioPaokwBnXlIGrmLFhxPm",
		@"AvAKltfdDwcSf": @"GAAXgwJsLlnvcYfNSiIaNsKrsSHqMCVdBggmPeBPMPJtzdUlhylNMMHJpYZQJVvXulAyvbXWhnTUfphRfzgCLhOqlSXFoeDVGlTlbmhcXffHKABKqtzglTIXuibIvUXKSafPcdsDPSTxo",
		@"oeNstobHwEl": @"PxPhaLtCfKNlYkkfOsKDkleWMXlqTGaoygoQxTwZrGWIosNuhIvKiEePLEUPvjfkpaUiDCQlfIPfcNemEqmNCfdbproAGfVySLjsfAKqfEamUfBPrIJpjMYN",
		@"MPaFVFvDMySnGULn": @"txmqYRZEkZRGLcEqvAqijhsnzBfzrKeJksbdIlcpubGZmXhyjTzlppuUaMxmCHxBQKVjwVRQGzvQpyVvCkoUcQXesXuvaUKbWmPtzmQDZhFJBIEfmlOFGZqOgrBRAEqIXPdTja",
	};
	return zUwgTTQAgoi;
}

- (nonnull NSData *)NxqCNtrmkgDDZqaeu :(nonnull UIImage *)hCFEmFudvb :(nonnull NSDictionary *)jGamzFzMMmMAMXl :(nonnull UIImage *)DcVUCQRCnxYzxSzRM {
	NSData *irbAfDliEhKWLJsFrs = [@"XCIvyRlGuxjUAGnHntcxTyFNlraqKiTQFjICBZMdJYEZdaiJGjlKUmndomckDCNLDsDWSgawgAquDLMsMUWjrTySWcPHOMaAECbqfnyrYcWfBCllhlDqSJeQSoE" dataUsingEncoding:NSUTF8StringEncoding];
	return irbAfDliEhKWLJsFrs;
}

- (BOOL)updateVersion:(NSInteger)version ofTable:(NSString *)tableName
{
    if (tableName.length == 0) {
        return NO;
    }
    
    NSAssert(version > 0, @"The version of table %@ should be bigger than 0!", tableName);
    
    NSInteger currVersion = [self getVersionOfTable:tableName];
    if (currVersion == version) {
        return NO;
    }
    
    __block BOOL isSuccessed = NO;
    __weak __typeof(self) weakSelf = self;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        
        isSuccessed = [db executeUpdate:@"INSERT OR REPLACE INTO table_versions (name, version) VALUES(?, ?);", tableName, @(version)];
        if (isSuccessed) {
            NSMutableDictionary * versionsDict = [NSMutableDictionary dictionaryWithDictionary:weakSelf.tableVersionMap];
            [versionsDict setObject:@(version) forKey:tableName];
            
            weakSelf.tableVersionMap = versionsDict;
        }
        
    }];
    
    return isSuccessed;
}

@end
