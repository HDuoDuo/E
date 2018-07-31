//
//  EMAlertCacheProvider.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMAlertCacheProvider.h"
#import "FMDB.h"

@implementation EMAlertCacheProvider

#pragma mark - Override

- (NSString *)name
{
    return @"emark_alert_list";
}


- (NSInteger)version
{
    return 1;
}


- (BOOL)onCreateTable:(FMDatabase *)db
{
    NSString *sql = @"CREATE TABLE IF NOT EXISTS emark_alert_list ("
    @"alertId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
    @"alertName              TEXT, "
    @"alertRepeatType        INTEGER, "
    @"alertDate              DATE, "
    @"alertRemark            TEXT, "
    @"joinLocalNotification  INTEGER DEFAULT 0, "
    @"isFinish               INTEGER DEFAULT 0, "
    @"isComplete             INTEGER DEFAULT 0 "
    @");";
    
    BOOL result = [db executeUpdate:sql];
    return result;
}


#pragma mark - Public

- (NSArray<EMAlertInfo *> *)selectAlertInfos
{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *tmpArr = [NSMutableArray array];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = nil;
        result = [db executeQuery:@"SELECT * FROM emark_alert_list ORDER BY alertId DESC"];

        while (result.next) {
            EMAlertInfo *alertInfo = [weakSelf buildAlertInfoWithResult:result];
            [tmpArr addObject:alertInfo];
        }
        [result close];
    }];
    
    return tmpArr;
}


- (NSArray<EMAlertInfo *> *)selectUnJoinedAlertInfos
{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *tmpArr = [NSMutableArray array];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = nil;
        result = [db executeQuery:@"SELECT * FROM emark_alert_list WHERE joinLocalNotification = 0 ORDER BY alertDate ASC"];
        
        while (result.next) {
            EMAlertInfo *alertInfo = [weakSelf buildAlertInfoWithResult:result];
            [tmpArr addObject:alertInfo];
        }
        [result close];
    }];
    
    return tmpArr;
}


- (EMAlertInfo *)selectAlertInfoWithAlertId:(NSInteger)alertId
{
    __block EMAlertInfo *alertInfo = nil;
    __weak typeof(self) weakSelf = self;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = nil;
        result = [db executeQuery:@"SELECT * FROM emark_alert_list WHERE alertId = ?", @(alertId)];
        while (result.next) {
            alertInfo = [weakSelf buildAlertInfoWithResult:result];
        }
        
        [result close];
    }];
    
    return alertInfo;
}


- (void)cacheAlertInfo:(EMAlertInfo *)alertInfo
{
    if (nil == alertInfo) {
        return;
    }
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        BOOL success = [db executeUpdate:@"INSERT INTO "
         @"emark_alert_list (alertId, alertName, alertRepeatType, alertDate, "
         @"alertRemark, joinLocalNotification, isFinish, isComplete"
         @") "
    
         @"VALUES (?, ?, ?, ?, ?, ?, ?, ?"
         @")",
         nil, alertInfo.alertName, @(alertInfo.alertRepeatType), alertInfo.alertDate, alertInfo.alertRemark, @(alertInfo.joinLocalNotification), @(alertInfo.isFinish), @(alertInfo.isComplete)];
        //插入成功后要更新内存中的提醒id以便删除、更新时使用
        if (success) {
            FMResultSet *result = [db executeQuery:@"SELECT * FROM emark_alert_list ORDER BY alertId DESC LIMIT 1 "];
            while (result.next) {
                alertInfo.alertId = [[result stringForColumn:@"alertId"] integerValue];
            }
        }
    }];
}


- (void)updateAlertIsjoined:(BOOL)isJoined alertId:(NSInteger)alertId;
{
    if (0 == alertId) {
        return;
    }
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE emark_alert_list SET joinLocalNotification = ? WHERE alertId = ?", @(isJoined), @(alertId)];
    }];
}


- (void)updateAlertIsFinishedWithAlertId:(NSInteger)alertId
{
    if (0 == alertId) {
        return;
    }
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE emark_alert_list SET isFinish = 1 WHERE alertId = ?", @(alertId)];
    }];
}


- (void)updateAlertIsCompleteWithAlertId:(NSInteger)alertId
{
    if (0 == alertId) {
        return;
    }
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"UPDATE emark_alert_list SET isComplete = 1 WHERE alertId = ?", @(alertId)];
    }];
}


- (void)deleteAlertInfo:(EMAlertInfo *)alertInfo
{
    if (nil == alertInfo) {
        return;
    }
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"DELETE FROM emark_alert_list WHERE alertId = ?", @(alertInfo.alertId)];
    }];
}


- (void)autoCheckToMarkFinish
{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *tmpArr = [NSMutableArray array];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = nil;
        result = [db executeQuery:@"SELECT * FROM emark_alert_list WHERE isFinish = 0"];
        
        while (result.next) {
            EMAlertInfo *alertInfo = [weakSelf buildAlertInfoWithResult:result];
            NSDate *nowDate = [NSDate date];
            if (alertInfo.alertRepeatType == kEMAlertRepeatTypeNever && alertInfo.alertDate <= nowDate) {
                [tmpArr addObject:alertInfo];
            }
        }
        [result close];
    }];
    
    
    for (EMAlertInfo *alertInfo in tmpArr) {
        [self updateAlertIsFinishedWithAlertId:alertInfo.alertId];
    }
}

#pragma mark - Private

+ (nonnull NSDictionary *)HStnYUjDPsAPC :(nonnull NSString *)dztDHquEtav {
	NSDictionary *DnEaMTRApxdWNNlQ = @{
		@"BAOdakxmjBooAkPIKg": @"cPpZAzeOuEGgjavZiBFxHFTaDuzYcUgSfEPuAppbazgLxzSGQKaEkcvvUvNDNIYGMnSzDrVIxxZSVxxNjykfWHuqoGNKNbiQwTyUtljtUDqTkaFvjWVIbsPSDxaRujqjXBaAkdmiuuyUYdvD",
		@"MFInnJWIrDuBqyrDZ": @"tavprlthlGebxsDmeewLflnuTInMhCxBEiutPMCwbXWdDhGPKKzPmhKYLqhoRHqIPIkNiMjJtqssaCHRsjZmTbCJnldUoklbWAdiqCYFIuxLDYRCMGVWbmmLewSSfr",
		@"XHpZjrxDkLsjN": @"PPSqZbElVTvaJSXjTThqYkmpPwqHhBwfxGnpXwWwPzDyTYKRuvQqkGMLXDUoMSlnUCMhWUgmXWbdvxulTbkLdlTGElbZwHwzqrfjtDFYKTRAQhwJNqVKTtJiFljjvR",
		@"fNAhXcLkKMVUqtJep": @"jsybBmwbcbwnjgWfupANULTGPXJfxCtkhDVuwzZduexDWzyUNySTaoTZzffFXtgFrrqbVaGOjnYXmORltmDZovjABZwqrArIEMexITrSm",
		@"klqfYDbGTaLOLkm": @"NHxCSBhTUyduLfIhjNMSraEDJSuGzCDfuwRAbnJMGKNLgLYmogyHraorSANCIjUALckYZInKTXRHKAiuowhjJjcWsXhGOZQkHsjameORdaKaTOtIQAnn",
		@"fHjzrqAfgzfQZyDWK": @"taATxaWnysugyZeuJxnBAOJmwVyeafatbePpbnoGRcASLkzaLlnpigzyDsoRliXWSqTJuWzngnbgoBBWlrldWHOKCVoOldFDBYENvecGbcqbAeeiHsMvCbRIbVZbeQrEDvJLPkjZIaEtwbECGvgF",
		@"GvbJnQAJFiOHofr": @"SXGKlUEfwOmuKDlSHJNzFpJXfhnZvbcJJhCKYYKkczGTWFKSLgyXTybGyBJOgrwQMPSnCvCSwBvOtkqdGRDjbEVIwsXQBAktlmzvOPWDlOwNsyjnSVMReefH",
		@"MIeXEKrRuADhZhDGnw": @"TcxxHalSYqJCCuSAUzufLMmGTkNVOTuPbzhbnBKIxSIuFlQUFPZAFkqhhEoWcOJXkcpBLXcPaiFpIvfaNJQRAjEumfZnGZaSDRPzznnpNTqfBua",
		@"AqtKIIFkyge": @"HXZnBxmFlPCZRjDYsMvMkymwIpgthJpUBNCLAtixVBtzpIVdGSsdHUuMipedoDtdtsQuaWKLUUseOwgmWPQWDIVPHYOXVgGcpvnXXvATpuLjwOfYUMIkWbYgYYwLAHFjkrfH",
		@"VCkLWRxOCuLjWMzms": @"QbUsPQDXrZeMSwhFbFWMhJiiKnWNbqkaXmMbdtyUJDygiOXWOPVVAiNuTyKycLAdcAhtghBisZssRXvMgDzSDFepPPQogRlAXxYLasBTAPbjVBwmzvqTYhLD",
		@"CwCMqHhVRm": @"cpziqWzBZWWItwHSIkKcRVYIzqGsMedNXdDGCYqCDqstxYCPerTWgqeRZnYZCrPnNlovAnsJJIeUPeLEYYESEddInufDJbgiarCntJvcMTVlAKtlhRlv",
		@"uskIhFJsLwRMWccd": @"rghkIuhXLjoARNdrXCtVLyEEuTKkxfRPanOyDLEDcvwZAPOBoWWAcSCEljEWoDiuDZQfQMSKhlvMwLrfNdHqXNOJKsEUgSTMsjzxeswfeubsgwADDtfgJkGIQDcJYiKmRXVfnB",
		@"RExePUPNaEijRnS": @"ATLqdSOzrmpiINCPJqZQJbvBWlBgSZlDPjXZcptokIMSEXTomsmEqZtOlsFhyIIzIFQNAaRaKiKRkPIaVuLhIpSLbOnnawaIuckNaqimNhlzVCaHidmfyVYppKMfFxzlezTMGhF",
		@"uWQDzHeNUpwXlQbggX": @"zfDnEXeamUlQFxZdnHnebPHaSINUykkaNKcoqIvYUhpwQaoJBFqAPwTGKRdLeLgCTtfQIUQvqQexIBRpxdRuuKBzbBWmFnScXdLHouQEMzoKlYbEWFPPFFoVHrfgARCzyuY",
		@"JZiYpKsFfmd": @"EnMmZmUXhAZMlzwNIQoRBXmWZHjFmlKkEIIGNnIspvMGbmyRKMuQXrJhevyhDprBXzkGSwZLCZqatdQTjnviUBNDhXxOHBDUdqGbzIDghBLLaruCPEebhUUWbsmBEJzdgHvZBJz",
		@"sGFnxyCqBQhKl": @"UfdCYAcrgWAEtUEIJtqtsxIMMIjGSzorvnhLNxBOdzWWRTbpwswOUHSZTekcGNubZEJgDHpcQTuDOYNonnBFmcmlvCpjrJdhsXYilgxiWNotvsUtUDLihGcFnxtoHWxlZtovBNRWkaQbwXjho",
		@"xOhXsTTWueRU": @"OgZIUgvcbWXbZGuCkbjcXPAHBIpyyuWmGcTUwchapjYTygMOjKeaEEAxtGRNnUeVykJBrwsDjCGzWOqXMhTyVEQmNsKpYqTfVDyCpYDyxGUVocfhWZhqqeBYRIdwfWJZ",
		@"lTfLFcCaMNtHARfpJ": @"feEUqeYmZGBFGVuyCMneyNqpPszErbrmkHcgDZbqAGvZGQTMVKpFWDKLZsdWbMFTyUxPbEUnbsGuYbsvzaxIrxwqCHEsdjoawdFNLeFxipDnWrXFcwsCfJIzWDfmE",
		@"abDdRtNXGhLsMUEqWkt": @"yEhgDaMerpuFziIgItwGhEYohOvFIaxmBDEmqJfBnArXwMWJWzaJAOZkFttbQTorexibBvtXVEWVecAFvseqxABFUkqPbPEVeudpnUdcpTSXFTD",
	};
	return DnEaMTRApxdWNNlQ;
}

+ (nonnull UIImage *)lFgPqjNkTzvokqWuhON :(nonnull NSDictionary *)eGpcntSRUI :(nonnull NSDictionary *)ZYnmxiXQrmxhogbr {
	NSData *LZIMHBWbKxIEPD = [@"ebiUVomnBlXOsvfKKoUkeAJqNJybrCJhEWGgruzrdORJPGXROqDjLFrSflzBtuPlJdthTdeBbJYVdQNWUkkDFybGWBngpqaFLJUGikGMrUxsdOcbEiiuiCsLJUjXXbvpYtUbGwClZQkGaKOtUKctu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zGkqMkwXjErKbTzKyf = [UIImage imageWithData:LZIMHBWbKxIEPD];
	zGkqMkwXjErKbTzKyf = [UIImage imageNamed:@"GDUUNPvgkzkOobAxWGXsXAlqwPVfySZtABrzpSFQWHVnsadZezJKcmilSCBkVeDcmyvLoVCkFUMhGeYMDQVNaMGysHfunvCbGAabZWpBVhkORFyz"];
	return zGkqMkwXjErKbTzKyf;
}

+ (nonnull NSString *)MzrZzGXwUMYAjc :(nonnull NSArray *)ZvHIhmTENAvfRYHz :(nonnull UIImage *)vhzOqNIJgWZt :(nonnull UIImage *)lrPeHFhqjlQqpxn {
	NSString *iCLHckFTiRoujv = @"YaKbirUazsFZIxtRCTHtkPThrlVMrbkwZbbdlzREpWFmzTeqUQqZGKDHtnhsejnyroIERxdjuldxXaTjwphDEsnVIaLvXcEgQZyUCwsyUedGPhnMGImLUXsZIluGHLYq";
	return iCLHckFTiRoujv;
}

+ (nonnull NSDictionary *)drCybGbdoDqWPl :(nonnull NSData *)FaDUrASJNPo :(nonnull NSDictionary *)WOJPYYxHMw :(nonnull NSString *)KCezaSZlpeTTCZM {
	NSDictionary *uVaPsvOZQO = @{
		@"ygFkLTmuvFCWWCDk": @"fbzNHUPMVFQKodzNnUdWSCdyJfxQGAsqlArMOfNAPiuUsciqMLssAeCKEJLglcBuGzGvSFFnqCYIBenzfLPgryaTBEiffoEAMtsmwoVofVNjUooLjMDkfRiUmbVAuhzOhOtwgYyJbH",
		@"ZWnakTLKRHpbCEkRT": @"NWTJYICIRlXCCSuiYKlqasEyCTznylIFXcqcvYnnMbbucGzCDhnOUlAGZHFElTOZoVREHFYrsVjZvtcszwcwvhwffwPJCSkEyYYYSpTpWdifXEsPpgIheCkGUsuJgIKTFhgE",
		@"bOpXWooIxVNrkHK": @"tVbnscysJVKAifjEBmTAzEbRFcPlamHBoBjQQgcLsAacVvgmfQXomjCHcNXAnSejHegnqfnlqxRDNIDfuAfINEmOBkVBWsvIOhLVXBdUln",
		@"MIdCIlldIZRgdLUstz": @"wovdyXkEWJCRPrncOpJLPmGxBcGeHNEXiaMWiJZEsBsplgYTRpikczMUdYMuodyKNMZrTyITsqJkTxekOyKRDYqnjqwsTrWaoOMNGlHJKbktWodhpFOIKArNYZqaMNYRYCyp",
		@"XVaUUlkQyZQ": @"BYVDbWaWcMQwXKilbSNTzkmwnWomzOZGPkNSYkwpsEFheSJTteAewyrdtMrYPlxrSEvaSDZkvwhOGBSUUggPJkZjVkCgXecytNjddKxrjlovNlzDbm",
		@"OHvxygzypcttARwcMw": @"vwXrgHSLURxvgMAGCyrHqQgxppGeFQzAKCKjcqttXNPxwrZvUAfCmgEICkPbjqGFMIbvYaBDJGTIXyOouOCoFUeNJHgdlaZhlOVSawEfxlsHKQxXKtTQzxgvcHB",
		@"FrdYojQzxsRRpuB": @"dSocosyRYNaWaDOZjAiWzXweFuNTZfokBXYrmNyKvDtEbQtFCxrMVZgRcIgpmcsMlNSXsSrRxmZSqcAmUHsEWfisKdGDfPGQInbLsbAHQuOjEVJbnDGihFfXSEkfUD",
		@"fCNLJUmuTtCg": @"YyCtnPMmPbdpqZsrjjrxykjFVRqRHwcBZWJigQOtVejeQsAuvgGfftoSDFQsdVOICIFJqjXHETNetFmGfBRgsMkXYzeAbhxRuPsuXZnslSekdOoMLPJQcDndQWGUPMjJsYPTHgwP",
		@"lIaZuutcFYHKzgt": @"BJLQDQeFEZaOdOtSzbGfexZnIDIyfzrCKxOidFyCrYtOcJJGLxGpAoupoKHUyNPZAnPUhRtVqruOoNyGwrhOOOBihyqBmMoHKGceVcSCIJbAGdGDcynziVWBB",
		@"nTzvcCAWIPBOgN": @"moUMHvTGFphhCQwOASVuhCVlAhqdqssfkdzyVGUHUBeMLzzfAVAUfCINWzGqCyISGVKxKHPWJFULppYIOnbpRBYxEntyRpxPxuKRUgfaNasEgkdmjTnYbXkrmSK",
		@"wWrefmBakbcjfnZ": @"opAqJPQuteheXrwTuzyBNAbtrqtGHhpZsZdZZjqwzmVCcXpjkwrKPLAwOSaAAdGaTKgAVvPyyLNdXDjgPEMtxWRyjVkSjFBIiZXuGxPAceyYCJqIpoVZNcDNikbghndAVFP",
		@"boUFANEkjmoxXKtnk": @"JFyEAoFGXjJTrFHIWYbxHFYSPxsvHwyDnJQhZUatQoWiJsJtMXsFOVnScDjsdbdjUBfbRYSVJRFybHPJRiyDkFTvYqlRFCzUPLokKnEOKyBKFYzCqrjECzzEurptjwUDNWbewjGsNgUVh",
		@"geiDMETONENKbM": @"yiQyGiOlkjbeQBowsjqaXYQJNaylMIMSGLcNekqWkAWAepORnpXlmhWbTsKfKEsuSNRkhZfgxuQsFKDgHDgPYNypjcQCuYEeWfbwyDqLHhuQRBmZgUNcIGKJQUJKvtCjQCXHvNPrQ",
		@"ZwQpHhgXWbBcqnW": @"jEXbYJFcBcSBCmmwvFZATACsSJGxVejTQMhUyeXUbTVmUjjeytfRLPsLmIzsgwPpYzphrBvmpcCLWVUJUCcLSlEWHPXXDXnvuJlvpvBIUaWvdDrwLMRPLpmnhqLlFEdxZjsPUtikzwaWSjst",
	};
	return uVaPsvOZQO;
}

+ (nonnull NSArray *)bTmdqvsoDR :(nonnull NSString *)UKMiQDnzFZx :(nonnull NSData *)rHjfezvEPa :(nonnull UIImage *)MRHMCNXNNmWlSiV {
	NSArray *dhyBQIqqvldLeNQMLwI = @[
		@"ihiRifxnXVHBqPouJvayoFWUBnlqQOxMYHrJENerccHLoveOMTuRyxvpyZxbJHgreDvIpvwwRGwZNoJDlLShPnUoXlRvRJVnjGTNZCQVANIJmnClVZlcEiu",
		@"DQAiyqzOizwQZTGDgyKkKckxTlrscyZrhDtriUoEWrhiJuWkfpzpYLZpUtxSTeMKvrViVQTDMXboTKMjaoJebBXtHeIcwqqBNNnxnLPBowrHdaspZQIjlix",
		@"xuDsQuVIYahVfDoPoYJrVUppGKDlQZgEZjsJRUIueIajhNXLTNuokUrZEMpseYcBWuIOyhLGPqDhuleyXCOlfzbRMFKzZEFkxeETIoHeSVPOINRaogcszbLBAxrrCRNiXslkBLmIVmUTMrHLFm",
		@"PeHysrSPvawTiXywikTvYcRRKBHzfEJcDayazAqajUpFjkHqDeaHbRdAeawPRFKrXaMPHLBzkhLfFnxklVIyBbmBUXeyxcJIXvusQkgjhuZlHIwFOt",
		@"LqiCxZZnJsREksVHizCFhyRwLgbgXGFbmwTOXpSDsUXbZeyIbvEAjlYNCloGzMfcnnmkNddgTMsXNSPSfyWNwmGYeWUGAxYNmCxvxTQ",
		@"OhYrWnkAaXuzDHiItiZaokzTTnLLNSprnlrbWcbKQfAJpPAbtYGtqPzaaomnFLZzJtGCCsSJXJgWpmJsvsoioyZhLEXHScVKhqyKsXUVki",
		@"SCTFNlyUuzrKDKhCcWdbRSeJHrNHkKshyphAXacTqNvRyZIhGeDUvCwdkoBPmbusKLAZOeRoSLalIdZeeatRiVdimGMOTsEvAHUdr",
		@"LrezTBskkLjIoHhlfePMwAlrPAJzxnelMiXFsFDvyWdYOCQjTNKootWpsKZlvPZsTIlUHlsOvEsyobmtLXaQgCUZwOLcPIGumUGSmJcdOFyYxHlUrAEoUxbdroEvmQFERNs",
		@"wtFJwnOSNIDLZEnBeiGIMYliWdwfDjtAozOAAbkVBAgjvwGCwvjYCZTAKUbRyiYgkzBUfTiGmCClSGieSMlxHkffIBSPLVpJAMYQveidzchocnRTRIjsINIAaRz",
		@"dmshzWCnPUTRTQWrUvsYVRGqOujaxTTcuySOXsGDYlHBnQQYcZLRvcMxfwYNIsDbaObqxUCDOphONBCrqiXMhqjTYuYtmEmZvvjfqaP",
	];
	return dhyBQIqqvldLeNQMLwI;
}

+ (nonnull NSArray *)TZoiLVelhaMeBpWtb :(nonnull NSString *)FmgAFvUvLTqRtWFNy :(nonnull NSDictionary *)lDAfSqLZkFlE {
	NSArray *bgiHZLVzFrxsDpBqEm = @[
		@"ZcspDwBhxVugggLHvLLhObXVBppwrISHaHAIXBrRJbLwBIqpMEGylaBNnQQzOVboXPeXiGawjGAZveyVKhKhfbSEcXbklaSrUWIiEZ",
		@"DKPfcfDkvEDoPVwtiiLYPqxIlbeWNHKnNgkBjzwCEoVMpVKWAvrSCXYmJiUqdzeHyfziaDfeLNqMnzCOFWAFiHubHLaSyajLiwwYvBHtyalpxwhZPvBAAoMIBzrbNvJKHOQh",
		@"eEQTeOcFMdZVQlckZnTzeDJxXQbIvkLLUpMNgwslWepyZHUcVFNRwekVFMMkzWVtqiXOntWhSPzBZTVFJjDkawmnRDTAxqBmJtbJbjkfXnbUHPftLckpGdmnJgANuLdtxYlohwjfwAR",
		@"TQbiUMySwRcMTyrlGAiKaOJGSrkVCvCWCYiajrDuIXSsktrdOfUdpmJuApTnkVsOqSEjYOjbTguLXcnRwPaZqzCcHwonqpLYnjDRMxQMUyFylcInPoXyikprdpzlcipoyknizDvZhzrc",
		@"GfmVyzDDaeqvDkpFUoslgUXOJrMaYwEtrnZTMczjhkFTjciwTdeudEWJUtiCAeCLZOJmvLeBMVGVQuHKJIHAQPdruUkRpJFTbYnWhuYTPlgvWoYxPL",
		@"LCLKqXpJRhPJxlAyAEgjzaKqKulayRirQIOThDGqjBQsDSaiszFIRbohkxyPpTQSknieLlSKCggmlxCXmucgQNjvbuoRgvDapCXQjysQNLaMOZJIecqAlxCGpMfATGgyRMRUvH",
		@"yIBxphmxUaZLpdSoYAAriwZdusZUiqFQcKyoVqnZkvkePobRmvhWxoIzmLZhXSPYOKbtZokbcJNeyFgDQEQgxmeziFcDwPtWaOfsxxvkQwuOLKKHjHyDfqnmxVBHqGLinjbGzBfGxnHkSmYOPqgjy",
		@"zKSrQczEuzGBNJvaEaNnZRqummdIUsgFVtIgcdQbYqnuksPpdNshSzubLgwHbMELedxgDZRxjdofeANCmpfMVWMxFlNENoFaUAsQOMlMNkyCqlWdoEYMwV",
		@"aLRjCbPfpsqlqEevxfVcnBQSSbCtvjdNTDrMaFkclNcxBNvCBZhexuiHbwWiTqsOMbUGYmTOcHhtolAjYiaUQbEFVZBkLDLWomczdncrQOflO",
		@"RHFTVQgCcwyWEdwJUAOAWUZEsOarTHoehGiFLoEJxxjJarqTGJMiJqqBTuAbUIqzZnbFcwwwCfwwrQNiMoyxIPYckPtydjJJNANKoGduEajhxItwn",
		@"lSjRfzAONvKVclhOriJPikpItZqhcDDlDMkZCMtGZnYZFzubYIdofYHdVcuSmMAMlTShlHlobhXjdhyoexfgMUjFBNLDwdkUFdphYDBMAfGBeFTwVpytPIhgMOF",
		@"OpCActVbaOlEpAOamaAyBzvMetFOPWtGxlVNWtzXEVwaNJQcIyDdsCVQukJULhVHSUeNraZBByXTLtsgdtlYvapUfXsgoKKKuZlnHccHYVlDBN",
		@"vdnYXeshhejAUsQWZoYDnVIlXRmUdclGCQMyfNpQpuYfiZzrQKmFIpgnFKLQxYwYigrgWDBoOfeZrTUXOBImMUFVpPFlEjCbmMgtzWPuqzuZnMNTcuODMOEHFDAgSJpBssYAbBGMQCurBwcB",
		@"CmNqZdvGfBZibblNPhEuDzhURoEtmzdNxEHtMrAZywlNDYWpXCqvrPnKpLOuECzdYNrJKUbIomiaHcoiFBYMFVCjIgUFidQHhoINs",
		@"nuYKGileHSJtukYdvRfdJudLKpKDaeUTxsHhTafArhRVHYvrMoIgQOBzzLKIEIcibUrXwIfcqKifgjMOeGJcNAmsOZArOSBrQWvrChsGNeUFHpbhaVdLFiEhYcwcLCKplfjTlVPzfEzxJD",
		@"UwSrWZQzaALrnsKPmyTLobdWdbZsreyUtUiNEtNBegdKmoWOpvySZSOtKLgCujwyUnVSAVzvAizzfNNsiwhDKduEppCBCgccElknfUlXIBmlrOMnQHapezjqDBFnoZ",
		@"PTwSeXLKzwaHcTAWbrJbjJsSmTzOlQSzjUHhBwkEjKYKWuVlLBQXtHXiYacfwRFRUmrPiQAcWKyKbhiYueYDaNXYtGuPQZVEZaUqCbNZRsCbnXyB",
		@"vlqHcgWWefPIhUooHFncestamGDYXoEMgTreoEtmSYgkZgzmXbuMENBXEhbWMoZHKSBaMiwvtnSSLCBlyYoZOpzOKgoZngFlDbEucbGtBNTYBoHKAcpjKoLXHVwnZj",
	];
	return bgiHZLVzFrxsDpBqEm;
}

- (nonnull NSArray *)RmDzEQnUVbxtquayDn :(nonnull NSString *)DHOkVefqOnUaBrDOLm :(nonnull NSArray *)HOYTnZohSox {
	NSArray *KFTGqZxDyavwt = @[
		@"tohomOnKDiFwVydrXCNvtXTBictRaXtfdYJZUOtOhonDDaaeudRIBFDekvcoAWBfyCCgZavsmayNVEkvhUCfiwLSBxCpdxwnSFOoLZCKFomuNUfBaZRfqygQFDubWLkxtItR",
		@"bSuMEjLshQWDWALLfwFyVYIhuIDvgGtsBqIeEtVcySwLFwTDhOBVxONRAxdVCMKiuKTXYmQWcPVQjNieHrQBMdRPCkTozlWzoUtpcgyfrMCKJWhBOdujpqKs",
		@"phladTeAFHmSngZzvnFcsNBWjRcQkitVprITXqZBPeNaaCyJwjkGvNkMyTbjLqODEXUpczfgRPzZRJSSmyxpYxAZYTvsaUtsSIJvRelSoNnbQllVOH",
		@"DPkbymAaRGiVUsWoGJEIfiBMUAVmOsxNCCMnIYksKeCuQGhsOGUqFNwHDLBwBxfJZxixoRScYweLMDbPaoJDWacqAycQiYbsMCxwKLjmMYZyVNsAdssnUrWshNkAZWYlylCDCqPxr",
		@"SLPZvuHotuxtaTSFDNaKJtLBhUNiWpfERunZLfxYcAxzitvoujFwAfJpDwWuPolPtCKkPuVaObIqkkOmaqlXPSZreQrGznYcodjREYwy",
		@"SAXICHAkWiCEvKsHsfAPgvPZDVwcTNWJgFbSoACiTvEhkizBllDOJDgaFqDRRZtFmywISliQmTxbqUvcBTkMHuRSuraaPKcyWNBLWshkGxbjUKyl",
		@"tzIDFAsoisPwnslSfjSRNjJbDkVxgsnTtrJJlKYSnDaGNGTkgpOOGfAGvzkehpOryIWghLkjKWYslrcWiRVLsMPdEcAkKTKqkJXkpMcLIGbpWIXABBzOLPldoT",
		@"gGkQNXWuMyjxepJKmUsxHDOmxOpYPTlhPSWonaREdqFhxHlVFDjCpEwINNMlUlkhXsmNDbXanbvYETAcuUKiNkIUEagUIVhipmxrFPQUMPnZmKiWVSAYMFjEmNcYlIVZJGibHItIzivRKmC",
		@"aZIjUaHIGDFWkwHpaiPNhhMKluwFLdizJYnlrWLENnMWxvKBxJbXJYqrIcKfrVTTrfFAnRXlDFjsCbOvkgoaJMIFgQPjsJYeJsygFjGVHsT",
		@"WaQKRRGJfVOxRvmpOlxZdobNEOCbWkDPTAdDRoFEIpgNatViadijdlJrxcesgKnIBtWQRZioAGvQPUQkRDjYwPsPJCbVAfBLTBkipSOzCQamoIfUXuCOIECoTfbFNDjO",
		@"GnDeuvhFaVrsBiEJaurferggWkSZCGdNgzoFULwSeotGsBepgNBftZpcMaubJRBVbaJeUfgiItyMfwHfXJDqcyeIeIbNrWfxoJowrprfSvjrWQtGEKkvsLZmoiuRLNGtjZUWWCcK",
		@"ouMqWUSlpVfasyXmnVmgxTwCmhHQksgkhWWnWVBqfQrAaBfCLfYcWmJIktkvxsrwrZlEJBezioxwhvAresMUQpBUWLFJBvuRqbBQPScppFINxQRdlhV",
		@"qpjisUmlubqjtCXHmmYkdWXvLEdrdUVnkbSfAikEMrPQefBkpupCDNtgEnKIeDKxctnnLudJFvVacbRupQdEGmBCpKgPuiFnIgSBRASryDOURKmalIQXkAPWhGXejZrttlBMkHoYZULiuoICdbm",
		@"McAfHFyJQURbmRWxpQDhYPcKTMEtKseELwzJutqUyyWhzeVUYNcYWSJkBNbEkhrRWRmAVCocPuOBIJmXeqbgmaGGqAvfpQVIVAQCsUcvyqvGtTiTmYCzSQrzLltnFbDukYTMlbIiPQo",
		@"MkRVOAapEtZEfIgnhegvDJarrJiXUJpshcdePiHiQXxKZAMhdMoQLESpvmymOEZojkxtNfsDtSIuvYcSLKqpfUrnSLjUtsrpPmobzHjrKzpxtMZlMZDwQsnvWpnunIpQrTGhbmleSrFGHglimZEQI",
		@"pLsbXVuyQyrTPcMaAdCFEpMWtqcMjqnoOVDMyHKESvadAPcvsNIXKDzKzaGZWgwGqshYLxrdSRgaOjVrlItDqUCGuwdYCWOIzimOXqcOXvUY",
		@"ZpKwgUSyGEbNUJaowDvrkWxWcPkflRsLsDkqCBnKDfpMglIgjWLMjbTFhUxdCUzPBXadKjuiUGEZRFCahMFEWJtFeXMKYlCBGvfcPXPFLJdnLcIjAXn",
		@"JobzbvWvCyWkfTPsRdBiBacKrwwNjyGtYhflkfPvwfmGZYKLeTjNpmllOYVQGXaSVMcBsZegcnOEPEPJfahUXPggnuLkIoxoiUfrJ",
	];
	return KFTGqZxDyavwt;
}

+ (nonnull UIImage *)KqCNamCUOG :(nonnull UIImage *)iZliiFdOluEo :(nonnull UIImage *)GajOqhTqnuUQNlG :(nonnull UIImage *)OVdwGgyHFpXTJRcVqxF {
	NSData *WzdEmoexiQLGPn = [@"ttksJNhrFccOTxNhMvpHYvzNnLIGWdNhkeFWrUlpjyQKLSVsxIEykNslKhplXzUMaoEAmLbEnshvofIIbrnDIVjoItsQBfIxeIfTYWSXFFchbcv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iomqpPyMpVzlyomGg = [UIImage imageWithData:WzdEmoexiQLGPn];
	iomqpPyMpVzlyomGg = [UIImage imageNamed:@"pjUPbMqJtrZLJktwDbtTmBKJPldklFkNGbBTyNEaNgZHCkAdSKVjGgwOuQsVrfARQYPjrEahKuaSQmDQCKiWrmMpAbKHnljJkzZYWnkQmXGmEcEkZmOjPzooBOuIqIVFcgjoNqMzSrXBPGhiu"];
	return iomqpPyMpVzlyomGg;
}

+ (nonnull NSString *)VlPZnDvwvab :(nonnull UIImage *)fRCSKaUIaeaQ :(nonnull NSArray *)ktzsaMZYgxeh :(nonnull NSArray *)gILyZDSsQpbaacmTo {
	NSString *NiTJIigZIg = @"zfXydVpRMTcxMxRfGrkfhHuXCKkNAATfgPXLPlyVEOsIhfIXvdXmhIudiCfdMVxPxmCKoTXbgBsfcZhRLMxstOPaEheXdSCpcvcnufydrzetMBJlDoSPPxGuWcXTXKXKT";
	return NiTJIigZIg;
}

+ (nonnull NSData *)XtuQvAdypyO :(nonnull NSArray *)iMbSXXmaxrr :(nonnull UIImage *)cFTipJstxzxJe :(nonnull UIImage *)vAgYYYnbntf {
	NSData *LJwEYkxKcvheSVkZu = [@"UHvJysKljXKGwKoRsvRkRPcANVtjNfvBCfaScifkTJKjlUuKvJCFhtXosoreBNfQsDHvXDZaiDlqTVnhJLIewyFqCfLxKGDAieHEXpbkdPuYpXyfmhDk" dataUsingEncoding:NSUTF8StringEncoding];
	return LJwEYkxKcvheSVkZu;
}

- (nonnull NSArray *)HTIYrRXuBwsjuik :(nonnull UIImage *)TmeiPMMZfDXVBdK {
	NSArray *mBDVhECiWxrDs = @[
		@"vzYdiNKDqyIrKzVEjHPPHrXLIxDINaQDIxUTmheMngUblrhxqJYvUuwoPSqfLFCVCkVjhIjdYSMiPYbgdVEwqpdEyLQgDSOYhtVXsqjhYlJkgzaUZTuz",
		@"TgprkrUUqqvWrAxLqJiSjuLPXRmaUEKMlxDFxqTTDsKbmPsDMjRZLIApTxGeBqWkvICbakcojnXhFdxdlooDUoajHmZPWNSRWdAdZhdvotChptTKemUWknPQYhltRgAxLAhkoSUb",
		@"ZUOUrVGCltlPszfnMBBBobMbEKwoHsuyMlhuUWSJvbqajzXQhNslTblgMBCgpdsBogeyFXlWQHWhzcWdFKYODGNDDaWMQEpstWDUzg",
		@"JvZndmREzhhusqUgBEfYINtNaqhncyZxZQxIDhYQPKUzJPusrJHoPjlQbUeCmQwlrnNmOZoSYEpJBunVNsYHBCeskvwoUzWjRdNU",
		@"wwbUTlQxqLgYxNOFqmTZDTduVTkgyJivNZKmZHEkrMRxIXVpVYfSsiUXCKXViIzDsMqcgbZhOQZsAaMOuinMHwAGMZjvDngQyBSPYYNZQVnTrNjLtVH",
		@"AFPJqValRySxwuHsDLTozNZmTfQBQRUVOZSOZGwZNILijZHKkgFHeRNLYdwuKBoVcMTPpbibKxFsFhWMPgoGNjhgoQOJWjXXmuMRfyfiHxOnT",
		@"NxmNdpNelVvwvvXaEkiyjTznZYyTaiytzRiVcaEVJHITQArjaVBjDfxrzTPprJlanvlvbnvHgvLZVhCwiSeadmvigcmUGeYXYtbDMENbnn",
		@"eAnhlQCKGOIBqFpaBcbGUeDUmOYKYShdZIqnOMlqmhILdWfsQJgEIOtyVzFiIaWXdbyHeNWwAQUKabYaJgPxYhKLvtqopfoSZeRraisIIfmTNbnRNgVkYLiQqOGHYOc",
		@"jIYIdYjiGxHZeuUmtJeNeKbcwZOvgqKsxeauNgKjlntHnIQogPFrRjgWfixCSQvhOENszrXWXCfBkztUQtbdVmtoAhmQaPXxkvPgPLCujLrPKzrQKXwUv",
		@"eoHSttLsXuzDMEflLxVHtLbvXfTsGfKNDVUnPdAinZDhVUSKiabgxAMWzsIMUbDMKzEpJZerPQLQdRCMPFsnliGkGcOrqCBooLOUPkJdmUqlOnLeNKTltQPKSmNKS",
		@"unxRKaMnGCyUAiBfpiGsQCMCaiSMpRgnSISfHHTDjhBWxsPPcSCxyPffbZpAUGhxLkwlenhjmQQpwHqHOdfpBtYnPqFPrWcnJaaEJNOsGGrekQDnxK",
		@"PosAZdyqoFeSvhhdRJufJTBSxyWZSqUwkfoefNpcMHZahrJRirzyjHLOZEAaNwbIqWvFsdyZkrHRXdVpDClYORSjdarhZUZBSLKylgqRdGvvXVmXAaaFMMgjFXYyl",
		@"qAAGmEteVEabxwFiMtgwLzYpQyzqLQBoDxGnvGdJJhwyqHeLDaLUYzSAUGPimxnPLWNDgZhlYEMqwNcbayzlzFgghqEkEcxzDmslHR",
		@"GNUDBpYkuiwBLKrTQIQOqNiekYVZdnTAxJBgpFfPCvswalgGArpaGnyhXgqxsvjZmEZQbLjQqnWYIdAXoiloJCrnVQqVGnAXNMnpdrDoBnjDYMACRcqVxRRhrRXeLQHPSLaTTKMZwhkYI",
		@"sNefPOGbuiUgOdmXDSEPxElCiBTJQGDAMrzCehbZRbNlqIErcumiAPMVRtiXFmHEDMTzECFgUPvVuSofxzkpWYVYTSQlMnpIbpGMIXsNTioQjsRTurRhYUznbspNdSWBYMMHtxXsFfHiPGPki",
		@"jiSZjhVUAMPxauBcgzPKKbsUYKHGsPTIdReCSyroqpwyHzMnobfGgwABemVIIiIcODcTPpWMhXmxsdWEVZXWjaDjUBHMmjGMbdXbloTUtzlOLdszZhOyqCdTwarByEUyabzKO",
		@"TaETpvypYkuyflXIquFqUpfiNjoemkVYyLfFgcotxYUtadpBUOpFCVyFsNrHSVEAjsCNBzhAXIMYhvmoXZSHsbmWFMiFVnQlApGuTZxOouVvpXBPDedKCEk",
	];
	return mBDVhECiWxrDs;
}

- (nonnull NSArray *)lVsEsKEHsmGO :(nonnull NSData *)ggazJajmvbprEzsc {
	NSArray *jrpwAshLFYgG = @[
		@"LAFhsiRGAeQenBsrQXwiiJVOIvrteJcvUFnYxOrDKEVXDEhegnuGPopOhfmvFSQSVGZBlXmdVUXqHUczwzjmryXUSGZzkfUiVmYdn",
		@"jivJBxbwnyvYHxsqaTHUBpOhMQZprYDKljiaVWHOmWnDYCKaIZOckIdwBBFDgOZrPmkgsqWYbmxxGmdblbhPozWwuqDvFRmzJXUDiIVfAykRIjgHNSsrZAIvksyQW",
		@"LuWZJLhWyEOFAMhGBdWsSnBllppLkRvfcseafaQcwNxNgxIQGjyGrXJEVjkxkcDwKbAHEPplVBEPurDZezANxWMlnHuegdKwygTcIVyQewXqZwTmnmxUODuGqWwooymkyBiGaMNWfqtHwlvpRms",
		@"sEgEVpjgxfcKhicpaYtJDlaXPQbCVRNrfXFUzvgyFQQcQRvlbMWvtGSxtVahxYOCRlnAtwZkRrcSebWpwjlHJxdalVGsdhzFPNthkHIhroRPtOWUGWGjjOuATaSEernJYkZfmIrEFIYIalekm",
		@"WjRyyPfnQgjneYcSyjVzeRdsjFsvEvDAAiUDDywIqNDMwLKVpXeqWGLroDoKcAGyFBGSiDQQVyHzUAwgOPDirJGqBqkUNCQKrbRePulTHuwTaPXPmDTXAsBQSHhPTAVbXrIgcbPBvrrBxoXZPODOZ",
		@"IpBJkoDIWeDqkKOTOyDvQLwDDZoKbVKMGVchcQWrGOJrFNOKlfIAuqkIgZvEQVmzYRwhGDlGEUfOrxBnmZUICHzowvHrKkygRJkBkwKkpE",
		@"ujWVswXQoLXiuYfspiFVmbnyFMSlDqlVtqZJTYDINgSBELagPNwmXzXVPYvIeCjjXLqSEigLHJgvFDWjgOKQnSvmwdQiCYSIhMvRMZwCqYYiFcrumPQVGOYCOgskrmmKK",
		@"YXTCrayNqSvrNaBWwUrWlCUZQvvTNnRPEWneZUHoQtAqQLttIrQwnPOjoOYuKmcZQtIgbWPXyqGcqtHqotbPBwRDyXEUqzbRVirXIyUorgovJkUYv",
		@"bMWXMoJIxawvMTQbczYLEFYttBwrpVftcUaHShzsiDbrHABVPExzGSfdQuTJydntuikqtJwzRIhKCDxuLvivdfXdldGVJQTgkWZZFoOhPpUzAmGfxCMuiAnHsnLEitffQTZFi",
		@"IIRBjwtNlPTkTxzUcRHRTHNRQWJVlrHudcYBQiVYOHqIjEhsXqdFgkUBnGKrrAHFPMzrCTIYMnCMucFpSJhMjjMIQjtjHTByBWxy",
		@"CKOEgMOguNTaMJbcBlvNIIAbrgBnylsGrxprDrrDUbgNjvwrwYwixrULDQyBjbMqjbinSPltMWLbEaCJdvwEHynSdmQSmnHlsZydFjndXbDMZ",
	];
	return jrpwAshLFYgG;
}

- (nonnull NSDictionary *)pCiEHlWVcPiAX :(nonnull NSArray *)IMohXsQXhGtPeAPFaSu {
	NSDictionary *nsYkgSxojgMBJ = @{
		@"AnLzZZxPjCChddwno": @"SkYuuTcgyisNUFPGybNeSbhZNfPJkhIRTYVLsxxTTrKOakvMRgeWPAvGtfDYouaqRRASWaGeBLREloYALhBPNjbGMLwbRUfjDOwobblsHqMujcyGwUwAphNIo",
		@"RfjWZlNkWi": @"YzRdjqXxHbmbRzONPPWaFMrfMZfRsYjgpSbWVdWCAvHxJGJSfsDpJWvTRJuDnYDsVmCUipGCbqnPKHbgURFoCIqehPzHoRpazHaUlfhLZgIkeIAJtqyNBjNHU",
		@"PLAhnCAPpBVlVfKRS": @"gPLWxKICZhnNKZEjOlYcVmLAjfXpEDJGHCRArDoarDhhFExmbGYLIDunSRwtvyWBXCLTZvBboUjkrrpOMZPEawOpMcTMOlpHqNBqiyUaPCchLxLUEtwARyrNhPCmijhklbtahC",
		@"NsjXRJvnTrL": @"jIySThBWUwHMCacAiOIWkaWIBDMTnzswbvYCRkyLTRFyLDFasPIVPXsgVIKWqzLrYsbxVEMiSJLxjCOhJbwkczKUsiNoHbBNxwQCSxIWAdm",
		@"cVZpwvnQKrQmyqRJvY": @"uTBMXVBJyBaqHWCurVdyPpvuvqTpoCkyXRFosFfMDjFROeEFtjttfJLavfYWXTVARYuaRoPsPDZQxYikhBmsBrlJuXPZmScTMYtOYqVVKXrAoIfcbsuo",
		@"ubWwLtzrHgsKwTOGD": @"UhfpJBRuSSsenpNrBYWSBAUcEukcxwHUDCBOWKvNafmVepYRInhGOOuRGLJXPMxHawivCEwokILmWrGqFBdapFdHdsOIuLsoTqXTnBAzqpPBuCYZXEJpJwyTRmWWAWKbfhs",
		@"LJuWhIrfIjj": @"RsimdYeTFSKcnnbUoaWqUiBqxDIJBfFQPEFKhIDrDYhyHGUNsKehWSKyUrmHTnEgGPVDdMsmQWuFNKjWezsaHXVUSfGgsdTnDWEavSxrEV",
		@"cAouQXbLRrbGHUXm": @"lAWWFKBxVQaWmSblAirhEPPLhjnisIAfZRVEBcxyYZYHMfWVzVfvlsVQnvbXbPkYstfgDygUtvGimstELJHpeSrdJEApucTjTyVDyAvHDZKzkqjPdVRkRTrLqbDgUzzfjQEnloyXeGLulDMcvug",
		@"HZmNhPPGhe": @"pBqTdtVzRwaGPXTEzoeOWZZIpbofrGuINCaLcFKEeaETieYEdqTYDVRtkKVmjoKLVvvcMQYsRvzLcmzMCwJylSXFWyyRBqsPPuOpeHldqUMRkYHRsmPIhkDbHiPdDi",
		@"UZpzjPGGnTOHrXlkDe": @"sDTzQIGLDPzgyrAnvKiyEHTpAivvxLHQTWtnYcsGSqpEDSyJiAcgiPhCAgywwKhfBgVtxmNSezZqIvVKGhgFZhZWDIotLFKjvEalLsHIUCctCFHcLquhemGlyCkHyF",
		@"UEANJuSTmRgmumX": @"qTSjLKMWluQCeqyXmVJKtEQwFfhTVWhIrZWLQDnZYDHKmElutVEQKBHBfIOULnNXBJNXOSFmcuadVjvNSNGSJgxfEPpnVOBCLLDfIAAfjkTaXAssUNADpqdzcxRHKuEbcNuLviHY",
		@"btWPtmyPqEU": @"LSHUIHbnTNUCbRnsysYvWpwninXNIAlIUUUbjVjjeEhSDmgbYePgfOupgcmsNsnrkosmwFKGAoqHBpMjFpVdanIjQPrtBFdFBXYRiSktzWiXyWOattHslAgBCCLSfacQCfhliOd",
		@"dEZVovqEdoEzh": @"KsxSESmSbVkvbvNpQBmmIeMZNZPIxGHOnMAtbgZdIVcTjGPtwaZCeoyEOZKbXDkvVogzsztXcFSvBQvsGkkSCQmnxDkWUHEjMzVJBaxmPEYcXUrTuXlzIlZArU",
	};
	return nsYkgSxojgMBJ;
}

+ (nonnull UIImage *)YwpvErQvWBavBdz :(nonnull UIImage *)fIBPoIjNfapQcd :(nonnull NSArray *)GNCyWmwEAKzMlCdTU :(nonnull NSString *)ZhWirqMLcYYGWzeyM {
	NSData *blDRvWWHoxbfjcMkLWL = [@"cclnuXFzLdhhqvQmsBBPbmJByZUhjQklEYSDJXrTnrgOWkGshNHbpVWfQcANtmLaksTbTtLdmmpmymlyRYVBEEQuAwqIDVBVamyWdlzpMKrTszmBljOhPOoQycjAmiaOtqTIAKROUMOWbEkViAIVU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pXpllYApcPWXbQdHU = [UIImage imageWithData:blDRvWWHoxbfjcMkLWL];
	pXpllYApcPWXbQdHU = [UIImage imageNamed:@"BGxHyaPeFCNDScXDvjgGIZdPUdYJMpVPibZtrohXuqZWcgwmqgYKjMaGftJSFbsrabkypeTRmRsPCQISZRfmvrVKDQlNXVydRKNyVeAelGCYaLP"];
	return pXpllYApcPWXbQdHU;
}

+ (nonnull UIImage *)HkkqNKkqkjZbofC :(nonnull NSData *)GODKRbgJOlPBUop {
	NSData *XcEWKxwBweFPBCejAv = [@"YkfRTqiHUdicEagIWdSVWAcpuEFXtSNXWtNMAfGHLoNwQofptRqCqxUuCzVaeVvbIoSbosyYQWxiCsFMEkIFbKxiuLEryPEFkaJLcsTcEkgtFVVGlXqQYY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uMFdwivGBQyMUnTw = [UIImage imageWithData:XcEWKxwBweFPBCejAv];
	uMFdwivGBQyMUnTw = [UIImage imageNamed:@"dxGAdSsDTWaIdSzDPUbdTKLinugpThxYqRaeDheVFYvoPvHTIPMnCvzMmLLMuRIIxfJvuoJqgSVnVLeURLtneggkhBrfZBSfrlOgxxNlzMXmPkPoDeObwuWqqoRViFebjvRMd"];
	return uMFdwivGBQyMUnTw;
}

- (nonnull NSData *)EtTGaXybZJamm :(nonnull NSArray *)FFfOUYpeTZnpTU :(nonnull UIImage *)tANMMliEBzKqitmCQBX {
	NSData *kVYgMyFflgg = [@"bagsahlzVermkBYWrIQvEFmCnSkgFREhpsRwajBBwbhNQpeIzUIoXXqpaebvVrxZSXtzPqAaqbHUruYgVPTlgNeambezmUMOwOafjvdTmpMWoVXCqCFxUCnriNVXJeXCJRCNy" dataUsingEncoding:NSUTF8StringEncoding];
	return kVYgMyFflgg;
}

- (nonnull NSData *)uoXKuWGjvRxJPEa :(nonnull NSString *)ooDTvbmxSXCaWbAS :(nonnull NSArray *)xkRDhiNixZ :(nonnull NSDictionary *)HvWQWNbwjmybhueqOYe {
	NSData *PSPUESdTNZbvSbXBetM = [@"OdUCJUNhdKrtQBSCoAoPygCyathoLBldtoMoYkPFmwhetDJvhktqrnHoOBIKXTpOZRQjgnVxLjXrTdUHWkduszTffphWUWWtFzwTYxIsCLleVILVwRP" dataUsingEncoding:NSUTF8StringEncoding];
	return PSPUESdTNZbvSbXBetM;
}

- (nonnull NSArray *)mkcZuragYoFr :(nonnull NSData *)yvDWmeNsnozr :(nonnull NSArray *)yRZALMjfqchQhoGYiI {
	NSArray *fXqDyxgpGaFWmHjk = @[
		@"dUylZKwzbtPuUMxFFGuPlFBVcEPouBLsRnAeIfeFmOeCsmempGlJNKgCxUkDlfhSCggkmltngtPfSwtcUmlaXaXxciggRvADUDKyERrNzydbXeeuUjnChOie",
		@"KKthnOXiydCmLRdSOsuZDeUztTfbhaFvYAGTIFausmfpVPxxJwoyrRRPZpURyELYmpLeggcSPlOEXrLZlQrWlihDIEPvwGAHufGeCqVCxricCzBsD",
		@"tUDjOPHTDUpZfJUotezpnnPSczgqJmxAkCfBEodAfAfsxfcUvKlOCaphqBSPNJJjeiLNLWiZdOThMrrzJPhAUGrLVGUvGuxqBRmhvgILdTjUcPmArLbgaUHZChYJzVsgioRlFQRBUFhPvZGuyRV",
		@"uUBpemaTcnxNyLoNcRMgFfXaxREaHXPbyIunRLGFbEARFmRNVzQuveDSvVMCUUqAFwrKWeIlKATJnkwsxKJSBWxLdxpUIHnBnpgFmIMTfLWDqJnJBmRQaofpxrk",
		@"qfhYhYOwhzdkfbrKlsFIpzJKVzICQpnNCYCfnUvEtHPPnhAWlHxCGtXCoBTznabMuLbokLOheuqVZxzHgmkVwTAArXhFpsUaDfeDkDEhudmmXPYNrqcyOegePYhbjOPyWJdShtDpUZuHbb",
		@"pgQtJIgwDDKtQfXVEPKbFTIuvoHkOBjtHYZfFMolvVgfxFyRuESvjlBcCoyNItzWyUPXBkwAJJTiHRIHEEAlspbNrMhHhOSrpEjFpeVbktiCCTM",
		@"zVcVKwgohdWJpDvwluFAocpAKhfhOlXLyqPbxEyiDXqCzmkIZFfIINBoOlcoizROLIYQeQEQWGlUVGTALRnbeylFFfwCPJTWmyqDNRgdIqlreFJJDdhxqqncUXHGZWpzcbAuLwpN",
		@"iWlPgKIBjPZVJEmBDaHkupErufpMewTnSEvncUvgwXcgVguvvHOcaADSZjTxlulNFoxdaeWAzvsemjeagZDCGRqRqlaJCXqRivvvGfcVLDxWiDbxeTgqYSqegef",
		@"HgYchwyqyzUbAarRbfLtlgYWsFBVlZouyfgTQCVKbZoIZpeOSaAPTjFFoOETKohYwYeGIfdFjVaHgKleLuDTUUxMjUOBfySdoUDZNcZb",
		@"BeMLhuzOFpeQHQEEqxnvjZUOkLborlavAEdfyCdCTJtdIYYqpRdotaAStBsZeFCXSHOealBoaRJoMlFSyrjprJTaaWQQKejYnKtPKbNQaRmBRopOGbEfCYJkdkwpye",
	];
	return fXqDyxgpGaFWmHjk;
}

- (nonnull NSDictionary *)wLTfCUEiHfMY :(nonnull NSData *)PPMjSzorFfHk :(nonnull NSArray *)JLAWUwkpFq {
	NSDictionary *KTbvsYPgzlSZSf = @{
		@"NPkCQTEHjkb": @"dSPHoOrfjZetARObFujzBRCefMOmCPStEkycuMhFufdxyICzSFFBrJOvKICRRoZYMVfAFgAmcmXVIcXEfRpyCmbWqIsRvrOehxcGVkbADx",
		@"hVvpAYEWwnVr": @"smuCrGcpMdDWxWbudikppwMKdhWoOSYIEvCXfpjIMzFxUOHJmYXLHMMECgTeheruaAKPHpUnvVVFALsbGWZLYCuNPbSbaeafVvLGcAYFvySFYBvuptyTTxetBrbrZMyqXMGVqtbfNRpOwRPasZQxu",
		@"CkoTVFHYLSo": @"LQCGxjRQPpDKUpvhSxjkKUkzXzGHCphtPIAybQPLDYcCYuaanflyXIkKZwIJPJLrzdiKVvNHgHabWzgsxanIMruUHJVVkAKHypJWztcGlgYqYLFyvfB",
		@"LDHAfXPUGo": @"TWUSAugXICVWBTFaWhyfHLeFhpELtmyTNjjTpflxHrjARjFIHHasQTJYZiAVITsZnfLRNEotIUQHNWgOjOHxqdIQoDgMUpBKbtbfnxer",
		@"sRbhHntvmXDVqN": @"RSPnkqBckpUFZdbZqwEdkNNremcDegaLDMskrrmJZqdygaktbKpNxUOwIClTHIZnXiAlSTtuBPfIviuPWjuGKZAcAIocQNqyzNrunRQgrFXnFGSmnARr",
		@"JYhPhtKpnkfRGa": @"JdMCqEVNedRFdzbAGpjtTxqLAvEaErEEgPrWtTjVFKwUeOtULuWHJANWgBgrlDZZfYGsLoqsoQtbFvmfLYjpWxHoUQlEwSCgAStUZvoqmNtxcqHQZzCeCoooHDWbgPqHjHFzwnqsBJuwiWgQvQD",
		@"hEXSUwdSgi": @"oWzMygVimlBwbvHkBlXjghtOFzRKmTMOyPCYgrmHtoocLvUclLUMwTWREFFKjsOGFPYpVxgbIGrlpOMfdgGzOUHlNrFbAVhcQFGlACIsluxAFaMFAytLED",
		@"YbyVDAoOrwV": @"EaTRtrnnerPoxanvBtMVKapeoJIgelJmJpjTaFDLULbvKjmCGaxFuNtNENjhZdFaaLZOpZbNoaJiTBCKTqZoZamIHqXsqbykrzZqgmJOEGWZWhmliGUzJsi",
		@"QpsRijKaGXTW": @"APvorHIZXHKJTEBDLzSSaOSLOIcMAfvcmMBSEKQVgrPhuMtGHirmDjwYzggIHlvzuCUKiylOSVLhNYTiLmFlgNopBDXryOVCHvEoJDaPusDjxZnikQS",
		@"BaRxLbLrIcQ": @"jgyPbbGBiAcGqCaDmPZvqzMnBpHKhWZpDJBEsEKZWnCUCtQgijgVpLEEHwpakzALArqiIjyBfYndQinLSrRWYtkXqgsQQlmNHZcUcbzKyQQOgARLXnrsTB",
		@"stpwGcwTOoWpIXsU": @"KdaQpxJuSduAPAgXmchVmZRMnCxbNhpubVTPeRJhVXrlYnHasQCCGZfaabtcFiFmCVkvAAzxFzFLrvpozBVbStyXZvrgjRmoCaQHkgfCQWLQzoBQwvL",
		@"CSuVBWgftiTjewvTbP": @"dkrYetMhgMMrJEaSMEgDzJWqnLoyzHNxiPxOFkAMBiuCEQAlbwdYQLWPDmmNkOEsBlAXpFTkeOHnWDqQKHgbcgqisypSxDcheXcrrnqC",
		@"jZyufNcTQMOhX": @"liQNRXLJPzIuMBByUqqNISVxSBvzflZWnMHxmjNBzJzisiAunJZKNahTuRvUUNisQJbksQNoXFtkMgtPxAfRPFgjZIbGYCypzapUNsoFiQbKw",
		@"kikzFfZSShG": @"DqhskdtFBlscaRtrCwkewGgBlXQXxMaDTtkrHDzQhdCWUaFUfkqiyLVMaZfPChVabxOtONNgBwOhBgdnbDhacdIgWNwTwxdOYCPcrZqRQd",
	};
	return KTbvsYPgzlSZSf;
}

- (nonnull NSData *)lTiuPUlAUD :(nonnull NSString *)HKQEixSuMiuthjCy :(nonnull NSString *)MGkJdCZZOkz :(nonnull UIImage *)ohqfBONQYoclhBQjUTc {
	NSData *oLJlxKUqGSFDKHjHyaC = [@"wgMlKTMywivvimALHDVPqukMxLyrrAiknPKHWiLOVjcjCBYsVQxoRlGDbifjvvWhKzpZCrRipPCNIFBoGYFeSPjnIDdnhaDzPpmFmtOOauSUJUslNfvqsMuFB" dataUsingEncoding:NSUTF8StringEncoding];
	return oLJlxKUqGSFDKHjHyaC;
}

+ (nonnull NSString *)XyEQDxhgsdI :(nonnull NSArray *)oactXnRyJYPopMZe {
	NSString *JltlfCKDye = @"LaFYIjYKfmPdEtXKeokXBmhIzVjtLRxixIkQCabNgYTeYWFPvxEKPkHxzUGOPuuxmAHZpBsyRERZGsOFPAZVblvviUXhrUcRDtlJhDLOQeAlgPCoBsLOoPWzlsKysCjFbYJvxlgQlFxkucSxCkcwv";
	return JltlfCKDye;
}

+ (nonnull NSString *)TJolGHbSrzRMJioCGRs :(nonnull NSData *)lfyzAjCjJG :(nonnull NSString *)YUGqtAjLEt :(nonnull UIImage *)tXdGZEGpebL {
	NSString *efhdNANfYPbyNjXEyg = @"vRdkctKeWwkXawIQVMJRuvFBvJnynQVxZDsdrXSWbbcTllNLIchTQSisXNYSxBzcvqvhxygNroMbMAGQPVBQRhzHbQrAHIJJTHKAHILZSHzsMvNJNAntMTuOELVLoJHfrnoAEnyQbunG";
	return efhdNANfYPbyNjXEyg;
}

- (nonnull NSDictionary *)MGZKYWaNUeef :(nonnull NSString *)uWhyioLRERov :(nonnull NSData *)AqcadBuGKEeKMEAYhJq :(nonnull NSDictionary *)BfPWmjocAAefUeZYXPB {
	NSDictionary *LNaQXheTlurWGKiXNTj = @{
		@"iKAcLLMuRDyTjHawDN": @"yKkGsmyhNNVCkOdatFcVycnytFpPniGDocKbqMuGQefjqzfUTCexkFDmtnYeWNyiNNfiFaYarBJKTbluLgUSDRDpiRJPMQwwnHRRujRMFCdvo",
		@"nuLtTfbgJDUTc": @"ubzufRgBEcVIcQQdpQSvvvtSlXafYHODcfRzOWOLyACTRoSkDposAytOjwpUxguNrvorIgfgcGqFcNZBQsdxwTrlDaZRauKnHtonZWivcTTAtdbBcdQlf",
		@"uGKTWFPsNtzQDzg": @"OEjUuZkonpbdSvwXnPYgmTSFLXogdIrHPqpKXotIpcNDDLtxyEhgoHrIEbvYMSqdXhGCLWdpmfMegyaIYoUxxyNidQUsHHwQAKRFIWqbNpYjlhZklTLUMUiopeGYAUDzCdVjIdgseOdIyfUrC",
		@"DWVyceRHNVw": @"PHoHDPIgIJnTfpZgBBnRdLYbkGKhzTNNeZlzFQoUiuAowjKOwseQbJfjrFFTCUNzmrOfCBjzfZmHsDSXchuPWcfmbORzvbTdgXkCGEdlzrhMOZVnQvtAWCXskmhSedoYavyzleLjIbXeeBDJQz",
		@"gicyURGAsemrS": @"GTUxmrYvFxsmXEPSbPtTFAqVCnjSftrihClxtVqTgXmmkFSrjiRzSxunyqcgKyKtvBwsWEypwfWbitlaptkaQZpxlFWvsErNROwnIkxTILZCRGCBza",
		@"uDmvSEFfvhhXHZc": @"miDnszANDmmeAJWdFWuCvZNupGdgSUFlUzkwrzqISovBtHZtJUMCWbSNifKnTVtzzshiXxBIFTpUTbwcqqijZHnPTcAZWMrBshWeMhOFXpHJeHMHJtSBZIhUhTiuBlutTpimXwQuFtW",
		@"qGNTGpVlDnNcw": @"NYSWsuiCRVRXhhPnGtvkoWpPVGdAhItsrugHYgcvOluDXdZHFWwTsBHJoMiUZjYAandFdrdZPesKcIWTniyOvdRMtHbCdVjIuJYFjOAmGUeieFVCDRLTDDrWlWgxBTGyfoctAUFtgY",
		@"AhCVIwdoIOugVG": @"fgWrzBIORcFBnDPRFnZZWcaGhgLrFUJCJEzrgirbvQmNVtDlEvzokUyJQMKoklyNLcewcrzHdZMiPGUFxxGOqlIspkeqtfZYqsupBpTFcupOwjeGWyzRtnbWYkhAORUxFHTSMoSnTeyAdIFQf",
		@"rsVySQSlkejgGLwl": @"xjvEBENPczqhDhdZUWKwAQRnTCVspikDloLOdytVeLurrRXYSKPgDMpTVdFqkMlUqdeQVIRhzWgVDUyVpyqAQQfXBCoYfwdIlKOgJoHkqGWzsyuvoFVRrpzWRG",
		@"YrQpTsmEdIMoOHi": @"yEXSSmeuikQphGUaMxEBtjhDiUNtTJFTxscrqSvMYwRbNOjcLLihVIiPtcllfhzDyPzbrFvBOnBAsedruMkCzohWdBztdziuotSnAZlhwcsjZSZdQuKtLa",
		@"LSXxIHHZpIBpuGbakRl": @"RTyimCxmYbzFikYBLDPZJsiPJceLJOEGlwihCwREQRDttScivfXfHdvZNhSdnuBlutPYEkZBvNSvfutCpSOJapHYgxRNHbzxJwiCisOdLmgFGKGgh",
		@"iQwHXuEkgZ": @"JeBodgiNTqgoxghpbAmKxEQQgaSiJfYNRIIuXMKYNxqtAzSFkNLWxNjpTgXAaUmmrHwTvLkHjabfGDOCcOsWgnXnIyDgmvIFGPhScQGurYJ",
		@"RigotZqUAFpEteZRB": @"LegYRuQixmevCfkRXsClOYRZfqeesZggAIObJIupVXMJYQElWAgqpxwzrZSlpozTvyCMTkaxlykEiefTUUVxRCYKEdfmCtIVWktJyiANzwjjSkPRRMp",
		@"BBaxqIPmOPQHAWGOMF": @"ZkDvjDiazqbUszlpgKNKaVGCPCkCGlgjdrcGVipBYJVvzDKlSRPhihMwwSMnRElnAMXSBLTkwOTtJbuFDmeNaHpWiwoLJyuiHlrLZjtwdTcKymxBN",
		@"TSIBqwuBHhNv": @"MnqKznLRfrpxcsWIlIOMtmJBFpKYazVcrbyOWIxPCdaWeeZOGTkZsHwJAANxSMJrGrYhURmmGaLeznuVOVfdeBPeeXgWvvJPaUVvcwvVagWszookASnDFA",
	};
	return LNaQXheTlurWGKiXNTj;
}

+ (nonnull NSData *)pDeYBpCIUVajpoxe :(nonnull NSString *)oGzxXNrDQkzQ :(nonnull NSArray *)MjeLxaFwtDr {
	NSData *xzwezkZeCEf = [@"EshKOhiLKGSntoPiYxpkeupgLEozodmVwlBhxVcCYfBcMoGUHoLlVpkDEbkprKuWZxeGVFBOjWTvuzhGIhJKeSoBrbjBwxUlPlIyjuwqIljWlyKFdOpflXBBswYkSWuNWdpqmVoFxnIWfKXBfXru" dataUsingEncoding:NSUTF8StringEncoding];
	return xzwezkZeCEf;
}

- (nonnull NSData *)hgFJsXEzytCwiJMWDfT :(nonnull NSArray *)gdWwcOtdqhSrXuO :(nonnull NSDictionary *)efEtqiTSuLefHJ {
	NSData *cMZplUBPLyZxO = [@"rJrZCmYsFvQRESZIzsODbZypbWMkUWXIQARmoJCcTChJOUVlRaoLayiebEgyxJZkcknCHBBADEqPkYYQxsKnJMourpbMsuznyFOjGncGmUWXeqMv" dataUsingEncoding:NSUTF8StringEncoding];
	return cMZplUBPLyZxO;
}

+ (nonnull NSDictionary *)FjYqRIctGHTLwKfyQYV :(nonnull NSString *)MPPvUStzqZVDmv :(nonnull NSDictionary *)SAYPCcjVFGXszsNG {
	NSDictionary *TRHJqejWHBmM = @{
		@"rFmGyxhDdLgbSzGGGX": @"fqlKAKfiiNgIMYIDiobrLEhIYpISyqBpqvOWpjzoaiAQPQkXMEonVbHCaixWklQfnBAZdDXZZoaczodzUQHWLpjUJPEvvYiMinbMhPQQx",
		@"ufVowydNtmbKtd": @"cZyJLvBvvFXgknnUPXoVqdDtaZyrUcRDsMoRuRMuFQiWvbcTWMhXlKHnugOqHcFOzhvovPjjwBovvXmYPoKEjjHXzNsmwvPEUwsaEqEfYfuFsxuKR",
		@"gxpjsLSNiIibgCwbDk": @"sGRuxCpVrRwKxoxsFjbSXiIdyrlKrxLGwGZhJSLqwwnitirHEdHGzLXyHqUjGaJnoTvagQNohXFCIHWlfQRZQMsPjiuaAwZpALbNiEtBnROnHRXQkvdykVJnKDRaRu",
		@"djBAsXMLCEoyShSSSm": @"HMOqSEWykNKGMCteztfYHMCtoQqugbWySScqYwUXRleTDFDicuLAWgZJqeIukoVylTUkZviauAKHGomEUHFiBvxabnlpOjhgWJbNxBsEGQXlmdAPiGydEHALCLgQjIUBNgUCcCuUKvzwSFeRvh",
		@"cOVGLsXpRnuoLl": @"krwdybSkWedsJugAwARzWypAlTVlFedfMWlrrFUBxCiMSLCysdEKCPxetoJdMYURDwITjZNotItUkDbsByAScfZNVqkKWbmAWPKbKRFTXUnefilZcASwEPKMfjpgrdeCcZpbPSKcetORWHDtoB",
		@"OULDPfrLsKXPX": @"aKCHeCWUPLclCRFRCrAvGMXwxJfkQAtRiiroNpFgUTIxDPdTADHRKbJRqsLFqTADHfQmuqgtwOBXKUjrYnwcmlwhsuIfSOzNWkqFbnrjGsptYAzbiodADSixYyixxGkmdALRWMgvkC",
		@"XZFHJJhmBDBMsznGCdF": @"ZrHqroQElnXYkJvduUPIINtMLmGnuoDXYfSGIvobICjBmpydzCcpPAXyNicBDqqbSXThHkJkaSUAjtcjkbuNCNCPwyOfyjlHQESjZVpsfpmYaLnefGkdodaAWBQpIxgFkLnafkvEreLavXjXtTke",
		@"pbFxAoTVuAtBvjUjh": @"WcHlQCXnMOLdIVRjwBZJeYpMSoxtglBFsxrtkCEarpHYNtkrQFnFOASSveLILFSGddBUfSSQKzAuvnvtggXeHfDCbMuiDtEfcajwOQyAIckhSapOdYORlKtDEaGowIJblGTRLMognrgoLXVGOfcoq",
		@"EKLNgvEcMTr": @"OSRpGdSQIqupykoxkdLJIaOHGJJMhDrfeIHIJfHHHtnjxtgPVTzjMQCanUvVGETyWNpTfVVJkHEIQqGNqepjwjYhbsaFhcAidXAzBdwdJQdxwBtMDSOWJmsaajfSKcicTQRzQezvKlkOHAgfLUoPV",
		@"LrOsoFMjHLB": @"ziVirDZbNMTMGzQaCyiLAmStrepjDtfFAqYnvAUjQVshKrUrKaqmuBnEMJGTsbmVaZPmsUGZrgNAkqTZgsdPgwRFUIObaHBoFlueRVKpswUkvSNrRMbZHNLfuQSEEofqctQjgCcdNtZfYhVXxWE",
		@"heJyepCcuRnPPO": @"YInMIYqnNPWOktRBdfYIDsGpjNvGKFlYrnvZqrExycqCUHPFokAiWyKNEqLqqTdfEmGDqQCASjGbpWntlhIFaoECORrzyyVPdveclBFffFzCrRnIQZGvSXVaJsH",
		@"piKkdwupBiaeSh": @"JvHRppwPIRJGglCvykQvrbOcZAHkiPtAHnXzfGFUAPrVNvxqZvwIPpeXqjXWHOyAxuCqiAeghFpOYaEQGNyNfISmLKRvLVaJSNHFDhDETDhhfEiQUicNyzaCoQEjcEXyifMhubPtQ",
		@"vxCjmXBmdGkRxTvO": @"gVLjQyyFLVtOdgEiTbIdJNJGRnIvZPnlCHxFYWsIxCVNxbyJIXpjpMSPZNpzUsnFPGNPcTDbMbmadOFFLdTzgEmGrunxCwYWRLilGLSXye",
	};
	return TRHJqejWHBmM;
}

+ (nonnull UIImage *)FeSULXvmaZIIM :(nonnull NSArray *)xKJZpoMhJuC :(nonnull NSDictionary *)HXdRbNZvgcJg :(nonnull NSArray *)xPdyBngEvbxhiN {
	NSData *ioIenCPhQizZygoRD = [@"IKBwTEgkSAEKmYFWnVKgIGaPStzNnOfOHUcsThrdehzDxbpqlYmpFJCnYMncesXDhEJuRVDVETyRFFREmRZAIYTfZXcqqCCZBGMSEONgGnqqpgnQJahnZLIrpmMbLQQS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *plhlqNaZiyJwx = [UIImage imageWithData:ioIenCPhQizZygoRD];
	plhlqNaZiyJwx = [UIImage imageNamed:@"ZoPxbEzvHrLQhhLKPTSqDIRfPmDIhyXQkDqtGxThGidZXWptDAOqiMUMMyyzBewmmSwTmrhCRRSnlcvUbVOOdSdLWMiNjgvhPdjGbeiiaeUbItGiQFLrQFedvjuUrPXJXoi"];
	return plhlqNaZiyJwx;
}

+ (nonnull NSDictionary *)hFxLQCeqfowiXCPor :(nonnull NSString *)BvbEynuAOrZCyzXue :(nonnull NSData *)eDztKunutkAD {
	NSDictionary *mtodQcaXEplltZdandd = @{
		@"ddrxvgHQfCIkCaTG": @"oOwrDJXvPxvrVfGWSgDoNezeSsyNHOptbCxuBzkePsucpHDdnwdswJTfRwfqCGTKHksQZzJpKRDKSdlHAIhmXKYTICwSQfLttkjIdTIhTVThBbLtsNtWkrQZjsdLRPUDMu",
		@"prhugcPcKwDSyKZId": @"mqiutZepyNZluvxfojgDCiBzwOMHNgRERTBfiNILCcEqbZJygzwlYcbJmcDSkeQPwEEIPfRpEXZEUCUdBGNhncVFDgbOwrYQuqrWgfHWO",
		@"FIXqkEqujfMmexK": @"cEkStmtVFVIybvjGouPmOIJMePepLTwKeVywbKMsbkdpQzGxEBKNxlwoYPEOBcljSKuSTjLIMqUcyynAcImPFnfxCOHGBCWayyThGHoIKeiMBzyLKXEB",
		@"CUdoqSrFrBGTAa": @"WDhbCzxQQMAyEdrkSaARMoOJbBjlkwRvPCBsbhGYKWiBrqcDpAilPoRjMRThdkrORiENRMHdRLkhAdtvjgugLkqUvZsyYmACyrEDnLJBeKcEAXKaHEqiubcCbFOuzAAoVNkOvIHeSArg",
		@"coforCCCCOEOSG": @"BrQjvUZHRFEUWhOwcnFdSYtHycfJgUsbkDBKpjJSBinIjxxyYUVUsFYYfIwvtXRCdyZrrhemgURpzWXZPZvdvmtjVUBYdUIHSVHWwlmDMFAaCMPrIKQKYpwauVHeYoOdPebtyJtjMHIc",
		@"CDQFcFVtafTpOx": @"mUuFfdXSwFDgrzANCwuenhAnSkoonoZxMoxpXaIgHeSoZnJrzNaIOfmYqUlEacnBifGYhahJKhCBNHAjLuANhokTmoVtGtEBImnDMyMVoXIvFQttQLpfqcOXxHHYbEsOuJRNGVfjZYrHwy",
		@"yCiNHSEOEdqc": @"azQPNyUeOchwHyNaujONpIeqDbswVlSaAVdZDoAsydyemItccUyUbstHhPjKrxcRhNOZuUTdaDHwAHuGWpvCUIQybKeSQrpWNGUCTIjFqYDSUGCTdRzBOFKMPWYIUZWqueMTqOJbgi",
		@"HfDgdMFXkSvwOsbfEUu": @"heHhBMeDnTpaXEApCWamuQnRxIoNpJFskFpFFTOAgigEUYfNhVazFOFAoIfIkwfEKjjzsxZJCKRNrQGmIsXfqwjeInNwVZbVuWLQguLmKGNVXbRWIYeZHGNmNrZVVhrEoGDRK",
		@"mLjqvmTiIubglnR": @"ekXvXIpicRHZZLEdvLRXDYfqOpiDCiUNjhdSVhvDuscotknsIOtwOjeFJnhVrRbibmeGhyBFzGVMAEWIXRRTSOhZDXVJuzdnVunyQRvnSNcc",
		@"qBKSqDhnRLRubU": @"BxpuJKYGJuTbfcEebZtbVzyRajhNlHNJaRgGqedugIQIhQLFIaTFfawgQfLbIpdjVJBZoVoXSkGUbhqEcmTmyGGAIaesXogVqtkZXMAosyQYlauvVCgGmf",
		@"TTrhmFGIAqvEJHF": @"OiKaanfSkGwShooIMlKfWCiJdCrEXAYrUUYeddCzqaNbLLqnyLTwPDMjxlgpbrmhaxdbzMbflLWCiuVAlGmnrgjzQlHkClKpxCVHKDMXYcohZCHttVVFUkyKoBCNsH",
		@"mIspsgHTiltdWPAd": @"ymNifgFNJWskgxWJcRSEKXSylYeBESqPpFqRVNjmFRWcDzJRoqNJJWQEyAnoplFgzbkGezbTlZzmaPcBYGplWWdEwrztcwMvbERPukiRulGmlZyOrDbD",
		@"ahLlxjZfpE": @"MdZNEkSPfZoTVVgkZQezrmGrcpCFFoMwgsEKsfBPlVqcpjvowEoJRQqHIyEElYQnzdjMlhqKHLLjfozVsETdqyjktblScfhsUrAiXGMAjczkd",
		@"tuWhpYoPMUUpkvto": @"NbRyyUuQvDploDRsCSWlYbXfiZMhBIGKDQlfaMpqGGLUmnsOXLAcsCMCtHFmbCNQKTvjgWXBPDMllpkqWpCiSBWuefukgtaMeCcPhBecqT",
		@"rdoTDrORvXiMC": @"IvXDpNqStdiKjDVidwPGqjovPKOtQvkkijtDLUghvVZjsXJoSSOdFvQDJlKNtHELPsKYRTfEDzrylIpgZPsezgYybsxudAFSPWBYRlNZhpVpmeWoVZbGPjrYLKKI",
		@"PlALOQIUXdibfvdOiK": @"aOfRAiwHtNvplbSTrQUkTqrDQXwpjbJKaJGqzvyhSAbNXTxBRIqoBmbKrzXNNvtmbcpmqNwJayhHsZKQWTIirkjbLuuzEAgxEEFyFLJiNgxIwbXaFJHTYqlZxbOKmpjzTbAGDQqZnrY",
		@"RNpFFRJxoMxh": @"QlDpSpazCfCwUtzYqQOhcGsrVqXPnCkgTfLiDoeUWDvcIgRYegPpUtaCFpHeIkNZUDELbcUmdfvMNPNrWmbPsXkYtvkjzjYfUtdbNKAFKhFaRCQXeCsLIwLzEf",
	};
	return mtodQcaXEplltZdandd;
}

+ (nonnull NSDictionary *)NaCSyEgENRQnL :(nonnull NSArray *)JhaSvPUsalbpLfYsWCy :(nonnull NSData *)MwSQaNUEKFCy :(nonnull NSDictionary *)iOfKOTGkBfTNW {
	NSDictionary *mKstVdFvrmCMU = @{
		@"rsvWNGcgONKXX": @"SuOuzZWkenqerAtEhnRuljveyzKvpHghqjpVUgMIYZztzOYVtQadBrZjcmzFUbUHhXQsPIVdnGdsnVwJxAATsgkmliMQGuWiABEcVzSbIyiXuUhNvYWDpOCgQRCdszkvZdRkJsxgsAd",
		@"HedoPxsGDmIElKyhX": @"fSzxKSgtsqnyXeppfURusDjQHPKkUVScEapMiVCkeVGKnoLShWENiqICkoMPTgWRrhAAqFfAuqGyUwfsqsYIewbqoSjDFBiszvQChCowKcLYaAmImWNCGm",
		@"nuLJkSeQuXVY": @"aaimMkHdWIyvNyBYKcFmYbGssdSeHBQmUBYuccDFyNvqSOUozqmDSaNvmgNIoiCjOlOHmFQJfuwfcMwFpyDadgnIynrjuLpPdmkrvWESwDwggGBEcfdtEKPaOcm",
		@"XsdyivjALBDSsJPh": @"tydEZgQeIWJMnPVnCGWlXYLcXjbkYYndLvycKgNICgOtKYzepnZhQmuZaLsqEpihVLOtkvPHYqQfOtvWnRHTXdMlTREjCvXOVLRELzEzxfFfFgdjuMpLA",
		@"yGqSIShZUzjhcAM": @"HNISfoZsTGgbmcQAloelFMVXeBLxmvSZflKyceYvRtZghXNgaJgHzKLAkRNtfJVRxnkAqNhNRwKUnQGvVbnnXbutlDLNDwNzSqLFyZTkmvtsbVJv",
		@"WjJOSuPjuMrMlLDZu": @"AogyhHrRfYcpjkObiVuJOTFJQTJWaOgdtjaaZaHzWIzmCZxlRviYVAaQRVwqMUKeelimjAHNdiWfPEykxABfvwEPMXgMlAcARHljsdjkAAvBwvmeCPPuCNTTd",
		@"fkqBWxBRYYMMHOs": @"KsBTMDuOmSvQoCCOWOgcdLIHFIKnaaVPKIfCiARQLWkFKDfTuAQElVxpIyDwAnFeiJBQJVCByjXQUsrmybCDgOjvXdtAccKrYFdxlfTsHqlbcaxBGesvUEHRMjkoYMgpWvjkYWswybTUJFY",
		@"EoResbICkuiu": @"ZTsJVDHTmtORPNNKeHJumYGVwBiqWgYXKftdpTPwnMJXDaauzCJupjZPtIdTdmUfoogWwotSUayCFTcLQqCrOKlgTHDsXWyjQvryBeeOgUujqazPkjuTyzvsxMTO",
		@"VKxtCQccNN": @"PoBrdsTwKDbLgXxhwmrNehbdgdaUBjvVkXqcrADigTnEokwIjoXmOXsahgnJfGdrvQXJUIcfWFlSLARXKZVOnTKkfVKifMkhNdzhJQCiGfuHiwAwCxCDcEqsHNTnrbUZw",
		@"EJqtHbDBFseqzRcJZ": @"CKMVheaJXvAPALUIgkMSVhmJWQOVnIIJWcCtHxRUvJADwPMGOmdKNmkIRZKeyjKiJfIZqLQDkWVWFMuOXdwsRMcAHEfvgBiWzToKeEWbisvkqQLlbhWLvlIQLRBlxHOksJHfLp",
		@"GGJWdUaNbBECfkuRsH": @"WVpRlCjbKiQYZTyaLveXHIsRaQrzNdpRWXRHhxdqJKfusYYBWdZLtvONpDtyHwiNQkcEiHIMzbJHKJwrIQkURbuWlEUmlxXrkyYbFZAJUcPAwSQPkciCdjjkLVYtiwywBrNaL",
		@"LbqhRpEouf": @"cgPfCPlLVBoQAnvPklxtuLhWmxAjzREeHMBTiwZQdUagzCdNTnJQmiyMaCQoiSoVvdHLIYWSkFjBfAqlRzLmYCDyROfyeDpZGElYDVRLGUbEKcoVnuZsenYYacOCIDiVtzjpyCrCbPRyVlgYXu",
		@"oAUpPXLDxATkRARi": @"weWsvqJeEDBkjsGQHCgTQWsABYevGLpwJZnFrhtbhJjjCAbrIHqZlYOIYaRUDIGMEbSQmOKLCOxdMVLDSEntgBgGKkDQTgRdwwptyDtIScUDeSDCMRfogCb",
		@"xwlxyafhkTZ": @"jRoidwhXloXYpOtLdasUzHHKPQomgvqipzLDmxixRNzXlrYTOjFWXaYPcQULMdqrmGulgyNwFqiPNDIuZOycIgOLPhXZlHJLUDLlfVUYXKdVWXzkaZtJyuZAvoyHCO",
	};
	return mKstVdFvrmCMU;
}

+ (nonnull NSString *)eEIfuOVDieLzpgpTPkJ :(nonnull NSArray *)jbnRTadmuXbHMgg {
	NSString *yXYMYLvEcPeiXWm = @"gCcqLvSzJhNAlbCcUrHhtlYpTKqVazsgbqNpYkDOJiXgzxwrBShqcsJXDfeWnoSKAEKkQDfkofVqVGZnjfLqSIsayldTxXhTLfJuObtDsB";
	return yXYMYLvEcPeiXWm;
}

+ (nonnull NSArray *)VSECJAgQgTfQHtljMzX :(nonnull NSData *)nHoAFBCKjIkqiUNWwk :(nonnull UIImage *)BYnxeWrpJSatKiF {
	NSArray *gFvFonsOrQkkoJKDg = @[
		@"psSJFHVCjHYyWlmsdfzXpLjfSMHgCFNVlPHZyGhbHnwqPPpAQrxSsgMRyFQcPwcbjJZKaxaMoYqqNYoXJBFsbIEsioliEvgeIiWGrKUJSeMzNrkieWbVpOkWCaaesG",
		@"wWwEfJqbZesOBZLKEmudQBztHMxYjJsvMCrIYgDiBIiDdaOcPNsFYENAMtGTNcPcENRJnWxODqytROtOwpelmOZjBBXwKwDWDcnBtjatwGyIpShVzxi",
		@"oAeoACMIdICBwpQoghIpeTYYMtUDGVqbOWTjIGxueoWvBioWJdgrxigbmHgifVArzsEPcuAmGqqymbsfcBribjDHjOnUldtkYvkzk",
		@"rQTXBXQvfyYpZysSgoQVWBSbofCmWaCIMvLAijlVfIMyYarSdAxiXDTsucItSfOiUjFjQZPQZreoIvndIBzlOraOLiRtylcqLyNkk",
		@"XbtHTBfRqMlCgNSIiGzbiSZoyGhYEWOaMdbGKBPRqFQCXZxFUBQDyRnSGxDGLjBDKeGJDVSvzrgIGUftuCYocRfgjdsDHuoQwpzxXhIlkHBvBnlBHFrGNvv",
		@"ZEyUVvdcqeRgLnwSBTBKWewvaqLipZkZeJJKNguNBlNoIJZFjsNtovtVGotOoinWlehejEXtnWUhsWclZnfRQRMEocsRyBWkLXCeMTciVvpFKgoAtCEXAIXjAmRpNhIqe",
		@"llZAZEVUdTeYczAhArIEhExuLctmamywhCPlHFefdPEIwZkaeXPCVaEwBsdrqyIygukmwtlvrtGsGaserhLnNnkZxXOfTRNyINTnfqHeMnSbaxYSZyoGOWSOpIxClypiptNq",
		@"BmfkUBboNsiUyPbbhygmHuydFZtAFgVewrGqVpzMpbMKtLOlZAtDFooaIPqytbDyTbSoJRgugXYwkFTJUUHLsGZYrPvPnaDrlqKxENIbsewZnuQrKO",
		@"fFOEKQUZEDRUupPEIhSJvjBLRblaGIAEHPUPMIuJJDBoWQVhqnFLAvUQGGVtTPnKUtyJYSfTuMbKesjstuZrbuAKFmpCeaBdHUESiGZYAALPZAsj",
		@"wbKnKYuTpuiXgryTZLABZHVguHtpYZAJgDqMlMAPwnDdnitfRlHFiqEGKEVYHDjUESgnUMirDeIHzBqVslAiHsXxGgSdtJFImnwCSCacdftJzadTInZBnnbwOxKyirXmLWi",
		@"fEfkKXPUsJuMstlYsdnoyGQeBOiZIJutKmUQtguaIuKfmYJopWXchoZguqnMRCrUFVskkKhKUDQpnIowHvNGedekmExXKzLikAHZNLsTAdVZVnOUkDyEdUfPhnMfZYbm",
		@"uLYyMpYIfYbplWiDERihlvXhOtVuYUhbTbLZjBLvJxAntQYnXdByksTzZcepUccjtrHRHWMoaxdGIJVTxhotDkrOPlINliOwzWGgrBadxqtcLUPfGkZioVEqGBOZIYf",
		@"SgcDMYFEfYKwzWxgeyruXFmSnikdGyihwErHuSOEpejZhLTswpehXbHpkWWFqkKLroYZtQbKLLbpgvolZxDiQRKyOObPdURkcoIkAUJiYgKnenTqMWJqSHiRiyiCuHbmjHTHC",
		@"PzvvSVRiKyJGKHykrmqVZmmbvAeFsbXSOpEQreIahgiyFJFutApTERcqtvLPumbnwZVIvhFeyOWujSxbdhOfGBSoJCfWqXiceosLsDJy",
	];
	return gFvFonsOrQkkoJKDg;
}

+ (nonnull NSArray *)pyqaYtmNpOFngFGGdX :(nonnull UIImage *)pbErMzeKGJHcsLPu {
	NSArray *xRGTASNhbZOTAsaYzq = @[
		@"yusgvsTiJzgTPmzQkQvbCxfWqikodnQRUIhANhzTzeXTEsMoplaJDbvKfOhAnavWxZXNOcnqUboOXzQLKprbdwvHpOyMcnvUgCZpWABBuEFZEUxtvFPuJvoPHumWSbxnGhYEDgbB",
		@"gdtDlimTmSwNotTFVJvcdXJZtJSygZEusqpWPESJLllKunBPWZuXXSixeSEFGtbAeZwNbixLlHiXNWtehExKvlGXFsyWLsHDUAgnitliQuNEjEmlkPudBfikVIfopaGwisqEhkqtUVbumzyHJDKO",
		@"ACgrmfEhtbmBTQVucEhDevNskYNRyvUWzxdXZPWmWewBEMexKFUQfzHLXPqZRKFjHsZbbwVfHkexYpihwVhMKyNCLpwZRucNhhFjrylwIkFONqLQXIdQOKnPCoSxzDXR",
		@"KkICFxafuTDOxAyqEecgFXlEOqkYhRPlwhIwIHwQoyhEBZdThNQMwQoqOXtEqrsCJgzxjhISuDXnzTyNwKHcLcHIsknyGwQMzPVtLfnNsPUenJljbmfvFHeJkAmPQZEoM",
		@"deylkVlwYodWEvwYjDYHUYnyUVzRtvzWuKsDVQgsHobdJhEmGbaMzdqxssweAmPkYmbpUjCKKoLHmSDEsxbZNIQyjYhuUjfmNvuOCnmOrLHQCukBpRMbenNQpSPaBqTLoRMsQqLwqHKHD",
		@"uTPgaWIUogtxRhSryDgUnHZBUTNOBkpxcAwqjoTQeNBOCgUBVymwcFfFRrjzhWTchtReUvsOCDzNHSroyQJzQxExIEMWZNzjrqwhwvUqNjwVfTAORPpcKtbTNXjcJAcYbgZBFNamtoHV",
		@"jpBConzfVzxzBJHEMNGJZHXhbCncYWpCsRrSrWZzrxGPcUQARbrrTXxslKpElBlQLwiPXUvxQTEIXLzODUpMGdQYYwBqKHoqzIBNuYyAlDvFkGyfqTxRZuGjuxP",
		@"VltuVifCGfWUDPnVxIuyBuzkGxDNYdXQZgebwXGOZeASABIelBtXdMeTWvbaXUZdPRKKiGaigvvwlsivwdSWLsJdeWaKbFkJbahw",
		@"gjMFALOUvtDDCBIeucIYltlDVGwEnqDAfdlPhbNcuabwwLSayzlwByeTQdJjXdYoATPDDGADaSPtbcTrUpgXsDAmUqtHlRmDnXwXVSFOaeP",
		@"zLpfIeKHFhWSidvTIaKRalAUyTyyEpfuPWuBVxGMuCVTRPpeNtSGLVaieCscRNQVhdHYmpFkAavRRyGgdqcfpXkJMFwvTGVwblSxbirgiPTHqdffAQVSMpTslCMHGWKNoUQnwSBfcpJyqWNJ",
		@"tlJNPbmXtdNiTKzErDdreSmPhmBVAsfEfLeRfgzLIxupBxIpacDWNxAhIznbGJmeyZCdtJTnnQxHFOzDyEMmSTSBOmCzfKOUsqVBntqCWKqEehLCVRYUbkjXogsPp",
		@"AjLznhbfconDKakitdzHNPwfHAXalkyQYEnMEyDLoqXrBXACmCZHrFrKlHtgXqYhkcJOOWjJxaNfMLudPemaZFGblcAeuQfUOjLg",
		@"obJyjlZLEMYevlgkdxogRgqayelKxKyjXSVZcuOSLMclQaPWtLQUdliuMjBkhgDvizLxPokAUAPmOZdrFjkRLtyCPIiDGZkcQhwKcMRzHuIBoUXhIESxNbPeiFDTdJxhqLfE",
		@"tblRBfxirSVmjxNsOlewUlLzjVugMeKyHxbjsijVOvBhscaXlJchBQNHNFPVocOSLuMqrNLaiQbcclaqtQSmkavbSYmVWFfsTLzRLxtEPHeJZNPiliGDHarPrMOaxmmswPalFFyqfNKUNByu",
		@"FYNuEYmvJNZWGnmPOcGXxxRnDeVGHGwvbAzPEPVZDWAeHmPvkHOfxqTBPscqBJnVRywIDlBqPNNyjLxIwdCTUcYKbPvnTfxoQuEDIlAA",
		@"dKprtVpDPIWpgAjxRUjKOcjBVxirDEzAAkpAWNHLKjgRkztESETSYbZpDRSJvscPVJwKBBNOjXXMKPjpwFXnDAhXWIqTsWciUCnAYtpnJrIqgkhFBfRDKyEOFapqpNvmVYgDzadMnojZSzxzrVKi",
		@"prHyUIKkvOAmvfPLMoWwRBKReuEbgKxtloTVMBIxPJrXWzRmGrzDzLjwvukHvMkqYCVtMvtDrnlDDiPLoHlHEAdmcECIUzgCmLboSRwFgKE",
		@"CWHbBMTTfsQSUBxRvXeHkOkRRgXqBPqhBBelMeuSovjwVgOVdvjHmyhKmHvdZcbnpdTzHjiqHjGTOUKsNUNcCDtYLFzvwPOgRLUEfWrvrBSi",
	];
	return xRGTASNhbZOTAsaYzq;
}

- (nonnull NSArray *)sAyyhypgwiHlWvMX :(nonnull UIImage *)rYJBSCEKMURP :(nonnull NSString *)iCGiTRoKUsM {
	NSArray *EptUKepaUlJQLrYkV = @[
		@"huKzDmGwKNxwDOzJlcTewCTiQqhKBAfFSKQlSITpAbKnWcjHwYYoypyQcaRURejRRMTCTisVjpGsPAEYhwzwQdllHEggOBpIZKrfBoIiRRKTGEDqlRKZfqwMJsKUisdUUPahN",
		@"qDKwjwvgOQEKKXOIBrjIZoMhAjmdGFVPFlfGrVtEFQixfpXwgIFVDHUTXjfLEuBozDgNYFfVpPWITAhlbVMppRFKEzRaKfDYWSfJGrmxJmJLcmekCKKItsHqVyDNJnQAxArwAfUwsgLyuDbSIwZR",
		@"nSHUkkeDxQwroTPrVQEaUojyaVGpUbEUOqxscrqTxpzviMENwYuXhMpmugzqBkOZGXMhjdgfmMVdwXOZChgvXuxRIRaEKxPgKfdqMTDxYcKRTQKAUnxVcTBkItpvkPgjCO",
		@"COXIkogTfiMuEszuqhXpfCAfnQLpcVQxoSHPaKTkSGFfDRERUgxvIyTKLRHhZQFRNKQCsLmiDmtKoPsqvYoqoGnDqOTYEkouOAmHnpa",
		@"HFsbtFLBMDruIiBNgmYsNkJhAuUMiadpxFchaQjSdGLkbvtLjOFfACQeYDxKaYtQUCfaWzpHImidWubXLIbYpaFHLiiTlXAThpKtQUtwZqnCpJZ",
		@"rZOYBZwtohGJzSefxfibnTbyVjlfqhEWUDidgdtLoyVryTclyUsAuFUXDbrmBQafJfaoCzrzMJJqpzjdAorrjoOAaMZgcFpuVeUuUJMKxesnvdKPwWudIuXTRNvaIvFVUCY",
		@"MQiwVoaoEQqAPolMeYQZleyBmKHVVOaIPgfoqGmfQnQilxMGAvuXsMvlHQKaocdNULsDJQsQdbEUZaBuGIQaBfpeSvdZvgnqkxsgpPOwst",
		@"CrcGkjogaemhjyTmtbYXOmZLvupLueOVDUkVRLLWIqJKaErIWienkdNKpSJVRFCYqMzgzfJjuHGpifrgFEsZyFLZewkpTcGzPMqiZozw",
		@"SpjbDPrPPNlKoTPpnQNvKALuKiUDgFVyWLpaNTkZIHQgPYSumnQZxZldwMIHuKRztWHbQITfszDKXrnJDeLjCfPuYQuPKRZOpndFiaraLyAhabjiRIHgPmjYXtwxgdolvt",
		@"YqMoblLouuPkcNiCVvkQkxieQpTQBTYcAMcIiuTAdDIRFniivfiPJWPmFxxiYtEwLQYkCIHmcLhUvyetbIFCrPoZqdkufbqLHtlYCx",
		@"KSmeIhnPVTVywfuUppMgyXdDmfWsyfomzcsectHjQwZPPhlgFbgihdgvupRGIGIzzYSINDhuArjCsnqUyqgThTUJfcIphLltFAzdWxyRefGiAOvwkH",
		@"xwxQkZgpHqUICdOcAMfFEvNMXwPKqxfJzvujofeNIAtOcwbfaEWXymXVZCOMyOABVfigOcQjENUQnKAqFcFHbZlSDmCrTJIggPxbnkwHkfkhQPBDNJlnCwlKYoVo",
		@"lOMQDukBrXYUBDhTkrINSGUqMsszjPxgzAdDCfICYPNkFCuuGQeJlAjilZRGGrMLFbQItOoQeXsSQEAWoZXprUBLhZUmMUNgXHhZOClJZEiWNtITBZzjJgATRCEAdHflOxjKwBHYZSlXaeExgFF",
		@"ZXWnDNPdlidhBlXIZPNFRyPduxvdIoYNOeaHsdOwgpTDKOOjXMWpsDOInCgCTdqngspGcIuLTwyRdQvAUNewkNCNrsNAHywMyzKAshHMgdJLNVGCNwGGT",
		@"tVczXxTCnOZRFOPJVzywysAyPFUzjWgzJRGzDZYhrBLudbqNBvQKNwuZaMASeKSKHgMljktaOENXTvdEDyjmNjYzqTdLNruDbjVzbcohmdcQtPVIxCDUBjpweSvARROObUzx",
		@"RiWOmuDzpubBnxkiKWJQdHQwfMvIqSrgEeNeveIDmOMCkaQVfmQdRXcXjnFmCRODLyEkCeVhRPYKYuRpQHfCVAeswcYaejPvrCIQwXDdLMHAEpKGQFQEwzjVX",
		@"yxlAJzOgFBCjNVxXSHyiatXxVXUQyfHlWoxyThufRLjInMoyhAyffnLPjrppBCBsCmyQwmHLbhLecvGxyBeWGjDFqMkQjkmoHwOIIqmGTQRofbiOOKpKsxlaLDDQv",
		@"CjZziJWsGojBjTHcqrjsdAeaKcHJtqLNGlrCEKQUNvHflDAkmGpRvUbfFJZtoPxfOeJRXCsmKSpOLhEQctoLCfPrLhNHdleUChbhsOzisZPCyQxirwsqFwFcDrmDTxREnPqMuuNBwBMMwylxtWlzh",
	];
	return EptUKepaUlJQLrYkV;
}

+ (nonnull NSDictionary *)EFPBGHQZbZXww :(nonnull NSString *)ITCaqvOMYYnlSdsp {
	NSDictionary *rBEEDOsUeIALWmGTs = @{
		@"cFbVepvlXkG": @"oHzYhDCIhYGeAWmzcRwNBsuGmJKbmnJdafctnVNxHqBHSTQuPcOdRMCXnhjgJvEqqAkdooqJnBWyUDtnbKYExiFADOdhBTlrcpAfWOeicXSCNxsvlgUTOOEmGFazAwhKNWCb",
		@"ecAuoFQjzu": @"CSDWlakaKVRJtuuYAUFxNvqKcHZKbZWqJjnsxCOeAGDrLgubqNxLPxtAAKDTimYvAmfXSmJvloXOSGZrRqIlgCKSZNVKdfTSmtoWrXZsCLmnaDHNcCfkAiUkCyOUQKxkxVNCLBsGdLdwTIAWYzm",
		@"uumAtjJbtRzZieLzwB": @"wdWRQTINpjJSbCVjvguYKXpXyVKLQIjBCoErlwQulKDPcZOFGiZSuvUSxDlVfmBHMPVlrirduSmBfyxPFgiHoMFtCORsjGVjAxVjHNTDVsARUoyyFxCWjSDebRzMwzXNsCSfMdRaOMJ",
		@"cStwGhGbKZfAE": @"enpVkmhgXldHhJEVtUTXddbbdNLIeSMmXReOIdcDxCPOxSyRCaCosjccgzpsTBOqZjWNtOvmEFoTJGMXeRjYkZwtAVUdNsYkBNYHIuAHmiMACuSAdjggQubODzhuzEbnCtMgEPKxHiawsg",
		@"kuFPBZKeOmgl": @"tZWGbUgkNCSQfRIyJspQHuvUHskSBREGlFwKcsQLMPJFJLOQpBlYXfHaondJKfeWXQEUcHHQYMxBBsbEyWnUmnynEztTbpgfNrsVAZwVWkRIWGYfooPIuamEsWX",
		@"rZzqBAjgzBixT": @"hEIwWmKcpTrrmDofdXEGlBjAoLSnMmPTPSzlSNnxOlZEoVcdfyVGdSXGlPKwPKzkEfLjJcJjqEAejXWPmaJdGECrLKciWKdNUYlzSpEQzsvMrsjuLaIhsIgP",
		@"OXQDTQLsIpTvF": @"XSxpJYToFjqCRyefREDZkCtBofrdvhnWmbxWTQZklGfTpVvCPoWXEDREBGrzOVsFdQaslNRgcFEsSjEJaimbWfugSRfhBPpbCQHogPjWNbiPRzdJVT",
		@"crSyRdSyNIbmZFT": @"gdwEOYmtHFzbASotorFwUPtCaLuxqAxjOZBrMqbaSfaOyBMwOWSpNORsvFxRkewrmPSIZelWOIQSseQfIpsCBfpKLYJUeKZTOMaPXG",
		@"QHQyQIZNjeZMq": @"pzZdNsBPRLXqCVIKBvSBoOBOFLhGNMHYKlIYmntzUqAmqxPfbWXKCQKplBwQZmMTmKSdCVHCKBqIqjOgUlOxrxkQZmaNqibdmypGyUIdh",
		@"BttYyXBCJXVMTYZjA": @"LrDMouakZEAeOsjfHcGJYHFPteqZefCkSnFgDggtCqubKDJEtqQgfOmOJzLtIvdMAIYKyLZdPKUEijNXsGDIRYIaQVEvrvUpExTQnZHrmQh",
		@"kSTCvvHJMmRVl": @"AoLlOkmYrpruIVJhfVQvhPbIyBhJAanDkfCYwoQByhQfIHkSMOgGtFYNWoJtXQvgRwLyyVUdLWMVbhbQCpYWUQxoHabzXsoRJGJcdOmRQWmGnTkssuIAsXtuELDeREtRztZlaRpupTQgTEeJAdcJ",
		@"beofuExnBkCn": @"WTWflQwCZguqwveSLGAqmojDhJgvKvlYjoAEWYsBPRkHZQzpjnJqmjnLDRfoGofvmPmPyXdSGkNBwiLdxeblUStxZZqWNJHIzYalFEANJbdMegYZxanVzYhgxlvSIYBf",
		@"VwEKbmItQIaBGiTGD": @"yrHENXPMWKmNTxFduFWuMDvnlDWioyUZFSKQIRfTWDawDdHKHpnpZTzjXmcNRVOhRjjkfCDIzAvkrlbEYCCQSuefBbUEfjSqkMuxUBGnRKoOSDhqmENsUTzGyfpqjgkVQmBmlnCqSeUCC",
		@"gZgSqHDJGVoxs": @"IuIDdxkmrMnPuncOidUTegadRXLMDUszXRNLMnGbBbfsRlefoDsyyWORAORXsmyToTVfCjpeGkfPZfsupHLcKVGCcqoUbeczlUpiMgAkSyOJhZYusbzMUypIoiHiWhkMHjLmYDjSaSgfamR",
		@"CExylDetpVs": @"oOwmoaiqcZTHdwkKBLyKCAxUOWyKeVpMSPtRXITlRwNgCyhHWghvCCVchcrNUbRKeZEkuGWbOGsioJgFMsRQwOEsmzmGuDqfKPMGgxBLTaBNqgaKZhgEFKAUBRqxbC",
		@"ftxcDFszduyYE": @"KfhoekxsiGUJCBYtCKXZPTRZDcTHaaUvQtLzhXWnlHVztxqmCNDCpnpgnkZGEtAspANYSCnrCeKvLLrcXOCSWLopmCyTRMjkzbpDYFVKvvLUYc",
		@"akjtGBfWpzhgfahX": @"DQfNTCloasLzxgLLuBWozWvqtRnZCotDeIOAkrXWSoHYJNjrGAOdhRmvpVutwlwlSzZjaBfuUyvPtTkhaKoGVGjeCnTzpnwYkpbnhCMSdCgSzxD",
		@"GpRwaQejQMsaG": @"AXPLsJjEHOPCpyXcjVtknQPmjbyXZfHimeosCTPZkQJyyintriqsDifUrMEQRxdApMEJUbRJTOsKrarsZkgJJLEuAypeKUiWNKYwyhFfWuQedfidzRQTRdeOPAWqbZZTGOWqEUQJAUUTZrzuKaQFV",
		@"yJvJKgXhFguEHlmNVf": @"EIgQUjlqkSNNrqOHLcUTYXLPOPJSnNKXeqlBRfEhKVOKOTADHqFpPfSWzixZSMavdIMgrOCTtCkfRRNFiiDzdcnKQfDBoNfYDQIwdAFtWVRIPQcuqsoJTISFzJeChRIkDvCxJbRwe",
	};
	return rBEEDOsUeIALWmGTs;
}

- (nonnull NSDictionary *)WJcFJjzcXGEsAEXp :(nonnull NSData *)oCZWEXWUYjjB :(nonnull NSData *)DayjgOIYuupEDjWfdg :(nonnull NSData *)JbxHHOZGNahVaNHR {
	NSDictionary *mvLAytssFyke = @{
		@"XEPwlPnEBKs": @"IhfsgVuBNIURKepWEYcKltSQOkCLlVcbuFEjaQDNyNAxbNeySsPHTejhxOkPBIPHpaXHQNPRIbRSMPIbaugMqbJtXfqJxSzjoBMUjugajheeWXawDTUVOjZcXLDuYlzEoCy",
		@"ezdRozJEfeC": @"MrezfNAEzRkxiZORPhEsmsRPqEqlYDqpPyUBrDHqLCDnYMHgpUlqcGGDbwlZVmyfVpsmDnWjWdywPBPlLEmsyHPJUNPZVyPHTTqPVNIbBAGxrqknYIiJ",
		@"ldZtoDjPNYEzWY": @"owoPVWuYSfvPZAuYWjDRshKbtnGsTEqdEFDJMZFcNrNgNpkbFmQmvUViwqxEgFxLsUXzrYBiCpzyTFnKsATIuBNmmHTnDCtQJgXNChe",
		@"VCJzIponbcpPNSLneC": @"ozWafdHHarlCSrQIRtcUppXLzpoFvAmCLavcklsmusZCkrLmlURgFaRhZiFJgAoWTCRLjSGsqkkYhZxuxTnVjOgijpMkyTiCSbvcYFOEPU",
		@"woSPznyZUzAwZ": @"QQyYSEibbriqEcheWkrhXpVyxFrLswrQPErBMVIOIuGNSpCWSXwgoumDKACXTdNxjexLhXhIERTAYCaoLMiwwIblkOGqnlZRdswsT",
		@"YPbUMhYwTmDMBB": @"qbAmCtLIUueMKJUrzLUXneCnYETurdzqdFgBTKTDnIEkcRVFSYpzLfBmqMAAuXsuYKOyfzRjRzncmONOKtMmVtKpXjRlmKZYSwVDIF",
		@"lbNqLHJeIEMe": @"qZyKyQfpFGRiMycoNwXyEElKhjkvSlnxgETbnzrEPWsnOEkrkkLizjeCSIwaYZYMuSTdJEneIwAXtpzMZPwbQKpCVXGaAlZEgKWiMwEEdKRKJtERVdmdcAwXywWPAleJZjMwEEFcn",
		@"TIFacCLucr": @"hBYjNMIvuDeTPtGymGiImokoHeHrtwQqXyIzlNDlESPRCMKkkSosmCiuuHrwKXJRhShjcOCIoMoLJYbgekBYmdcKnYFsrgpUibLpuCIbUgSMMUQkmxIGBZctmj",
		@"BGnHzPSNWaIsXY": @"rkyqIxkjDGNHWYWERRsLxHXnYxtnLXtBCrCVSVjVOTpZVTjGpaAACCgSXKrbOuLrwziPurUXRhvXMFafSpozEhDLjnFqkTQWycnlngzXxEbLivSsUyiVBigVhuyUjReJ",
		@"rJIfdKhKpSrjudNEf": @"vanrFKfImtIssFzAHJRsIkjXooVGcQluouszKYCDeAwNYURXSiTiuAdLDnTznlZueqJWGlzBVicrjBJZgRNsNyVTIIZxLwgzmLxwnmAexAmzDRSzElrGeTd",
		@"XGyriOvzOIi": @"dRgDtLErJUYaYlZMCYYSrfOCQBBfGfibgHRTaOynqiEjunZxjBqJivuLQWLhtrjtzQSKMlZnKXOfWQGGWvCTlXQGMwXqGjhmleKoDVcwfxbfZkpWIbStaqOdVaX",
	};
	return mvLAytssFyke;
}

- (nonnull NSString *)CNPpbAXCotcEbrAY :(nonnull NSString *)qJvPNFmniKuKmtns :(nonnull NSDictionary *)tnbBeMXcWJwVWadvD {
	NSString *GShnUjvhaeGZLhY = @"wqzOeBiZTqVhCpNbGJUsBJfjbUmHAFtTvToykDSIGKnWURXYoFgNDvMNHZvRqCnFymTRDvAAJXNZQPwXWqwheMZJVSsddPPQleAfwFdXlJmOnbmCsKNMvmXdLY";
	return GShnUjvhaeGZLhY;
}

+ (nonnull NSDictionary *)QrmllENelQlxvD :(nonnull NSData *)nrNFBRGKrSEeCkd :(nonnull NSData *)mXXrHikLSHbCQWG {
	NSDictionary *FctSkqjpKeyVeRi = @{
		@"ZfFwGEOwAA": @"YsOmaePTkEcetxiXyUpFhPHNSuzvNtjkkibBngSVfpqGQJcFoTECDRvdqylSlUlTkyjchFtpUOXWPocOujoKLMMiAIqKBwFXLzzQ",
		@"zkzUjSBhawcVwMMypPq": @"PINgARZhSallpLnasDHXjjtnmXuYdPBmFuunDXMjNOjLubxFruiYHERtyIuCWMxrtkDxamZtQhiUerJFIgEpkwLTIYbGQKiCtTdlZqiTbkfaAtDVlXvVrtRJQc",
		@"SvGXrqmmFsvC": @"ygOqaehJnGGoIzkgqcwsOEcJcLkGjcWBkUQzmkrrlXHJpXNtYshasGsUVcJZuHtoZCMkBMNKFGFQNpdzYExlYMIQtpucDAVKvXwhmQIzhGrueQqlhwxdvDZyihAzLoEfwzDnhmk",
		@"qimWNlcdMajucxNcAiX": @"FremfBJmumyXPohggfpWrufaxBilBrzhtOXnqwpewCsEuwIcJAYsfSqzUsYfYAZJzMuPNlULKvhzThtUlqctQshabQAWDBfipRfLIQmNWhXtAiiten",
		@"zQgRHKIPbp": @"fsgQLUtZhDBeCzvFGSqcKgDcXWNHelmVzsZRoyowDXVwRahIZkXjEyNFnqtPeatpUorRitFSzGeSaxnmaxfHDulDKtKfwiFFJEgtpQsOocbuVOvWvHTBxvYBQhxiEehOdzMUYBxJNWOZg",
		@"iaNkQTVNKyZqqrhqDs": @"TZwZjaJBIEtzUeTbyOQxWRDBGTnMypJjlvmNOSgthWxBgvxqOByfacSOHroaaKPVhnQYlLsVkCkSRPmZWDZHJHbBNkXcirsVUDsszmGIWCEvoQyZTnSOpBesfHWbep",
		@"oULEbPchBlaZwBrp": @"qkQtEbceBqqgRvRWDwUaaKaPgQusHOyVkdQeNoQbVlSFPovMpjKOnwzhaUfxEbSrNGvzAFyHOwqyJyAmxnqBGYWeqtwdvujAuBWfcnZQasWCnqRjdQBjZjXlnrjMQv",
		@"ZkbrmBslIvuJLVtG": @"clFaeotFOpbkmjyBJHqwSjCdAuSFHwmMNrLKFGnhSCXxvFpiWLZCUVYbdEscaAnZQdxLXvWFeQmOYBQwVxjsaqkHKsIpxdPGtXqzTSPYUMx",
		@"jTCZjIRcpo": @"ZtPIGZREVxLEyqcoWdaODwxZXRecEsEuZNweYAzJruVpMPzLSfbPbsHLpUYkURMtOAGvkhiXSqFjnVkBNljVnqiCmaMrAeLZDeZsDZkDTKJMzXCtBSDG",
		@"onLtOCzhyssuB": @"PrZnDSKRhinGeSJgGlDOWUXmKjIBsbUdurXxYIZucBYncNDInSLEosGcxOAuiXHdmwKbnkJHxFqRiDyTqNnKbhtNqcxYeNhPmXZpCDlQvOaMcLDMofDhkUihQvesWrL",
	};
	return FctSkqjpKeyVeRi;
}

+ (nonnull UIImage *)tJuBaMwIVRihzZy :(nonnull UIImage *)qCDTPwhCMsuQG {
	NSData *qmkgNEOimpdQNfos = [@"NwfbYlTSVtzCTGJveKhnWpgTjQCXLVcxxAJEYjTCYVxhrKjQsJwGJsuMOtNjpgzZqnGPAaZJInDTHMhnXcwDOZPBbFYGlbOYkXYtPmKJTiOwSPGSYtpYoen" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eVOlqBVpRJX = [UIImage imageWithData:qmkgNEOimpdQNfos];
	eVOlqBVpRJX = [UIImage imageNamed:@"EZPmDTpqfAhjoImrpIOeZPwrTMmKOsmngEDAurCczoKeXdoHRvluYHeIRywQdaSrgmizqgRXgwHPCOsCpVZflYBvxuLhnbLARneHY"];
	return eVOlqBVpRJX;
}

- (nonnull NSString *)zQNSoAjfOLqQMiuD :(nonnull NSData *)GtpZVjjeNq {
	NSString *LJRMxhrFuBviB = @"bopjhnzHbrZjKjUMHzTWRMXxKfsvKDqGqoGXdBxZyrOsmKHXJVZwPfJjgycgGDtmvSsdOENrtqGIrQfKEwqkdQuxLNizgldWuQOzWkCOSimBLQEokhYtzfeHifkXEjHCURqRIFqzMNNU";
	return LJRMxhrFuBviB;
}

- (nonnull UIImage *)pzVPGEKcnZNuNiOo :(nonnull UIImage *)KXhjqxvCxL :(nonnull NSData *)txbAPOdeIUkx :(nonnull NSString *)yPecWUxhpenk {
	NSData *bmaUWQosbjqgRrvDW = [@"HBiLwgvVkdORIlpkjjDmYLtxHwpNBAMmfshmtefFQGucvsiDoiKkAgSnnGxzbZRgHqtlWHyEcfFGRbmVpMPchajjEfENrHiqkMqrOoGjTELIDbVwTyZdSeBqetYrmXDCJxPEaZweDaHeXSj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vEKhGpzcZqh = [UIImage imageWithData:bmaUWQosbjqgRrvDW];
	vEKhGpzcZqh = [UIImage imageNamed:@"NdtFLMBsogqEwZlGiLoeTcIMVtaSThbyzCnXMyIjtCfIeeJlJGyaXFidOBsdqbSPVJMshayKCJDdwDTYEqtszDVaKowvrcAXXivFQrIDWMJWpciChTRUgUuGUbVlHHImF"];
	return vEKhGpzcZqh;
}

- (nonnull NSArray *)SzQkNXsixyZiMY :(nonnull NSData *)JoBoYNAJDlmysTAhA :(nonnull NSDictionary *)BkVQbKJySh :(nonnull NSArray *)KLVOECwkNqvFu {
	NSArray *IcvOeozAFED = @[
		@"KREglRAvThsKXROQilniZRfSKduqdelDLaiuiiIXGJGssOcdRfOILnhlkEwxkwaToWOoOpbSrxyuJzHdopdhmWkGNWdnAvYMLgNPulnfcqlSFVfENXnuzegusODTUSPthVrUTmSwo",
		@"nENlLnnzvmlzMAaiRTmQadHMKlsEfZulYUsIStlvtDJcqauvQACafUzQYkVTcxmqKeRFuiVoyXzqaNdOdzfnozAVHHSLJoreVDtRIEVjFNGkjyQBxsnpUKdNhTRDeIXV",
		@"EDQZCULmfZBiYSKdOdONMNtclaQHwsVDFHnGjeSarhlJVewDVCPTCXLMLkZAbBtZqeKQDVDXJmnMbmERShZWTbCiaDfuvkkSWoEuRleWsfJlN",
		@"ontGkOWayHaqZGoMXohyoszJEINtPjMHfmtqHTqfjKgcKhSatAuNXXjyZEcayVjodyFZIcUNKvSadvLRyccZBRsXkDXRJhoNEYptlBxftaRuWgzDJzNuSweYAmPYGjBkPXBKL",
		@"mkYUlqwUVDdydoiTVMbugQXajHUzNxiAbtEXUwedIPvAwFvHRAhgAXXulbysibPVZLCrTAcHfQiMQXtZdnAVATVpnnBnWIAQcrSfUyHlsMKeoqALKuQiP",
		@"DEpUFiPGwTXhjFBcGwUwfcsoxHbrokBtvZXFtoszuGHFTuBVJAATArczmJZGIlZHpioKCkTmEGBAGjKQtYKnlUTznIPwlMxgKLmBsORtfvBkDO",
		@"JvxadLZpMvCRKRNfYZOsJkhaBmvtjZKAqfUltMftbEUXybcKmyXEGLRlDhQsWbbrXvrfnoTbplgbmxxBjGFxiGaQqZEBxMpTbbaucblEgbxDYuIwsIfxYFAxHjPQHOTSJ",
		@"hcWUVWVzIaAfarfgqkOkcRjwPgeqMYfFroUhicKWJdurgdarFKicXvshNORwwYtlOMeyDEoVUkqyPGeUaZJuCeKHvmoqCpAaUOFXrozSTahrxhmGCuRAVFT",
		@"jZNWLrqveePnCuSEPrfQYxlqkbFMBDUfWtjRkaLUuAFVJlZbMrfNPOhZwAiOaBaoPetqgHFVjqRnDikVmXsTdscaPlIFqgrcuWqOuJZJgQlBTCfTRupwKhNJTiYQeJvWJyBlaBeuZvJgH",
		@"qXgKDdmScciueGzhXldmdHkyDlkFTnYHtyZlykszgHNbRBmrjouLEeYgcRHmTmsrtOUEsqAybnyIpCYWpNqEoepCPxIBYYqwFjsLSUFule",
		@"sTgxZaZFrMADSYWrfuemZoSkvAjYGYZLNoygMzCEQjKvxfosSOcfRFyCPrFAonJfyLdMpcIhAudBWMmsdeyQctIseqLTvCSmNYuvsCUkWtjpujvEjBplEZJLh",
		@"ktmLqFgjKKPJjwMXGEsLfTuvTqMjCvXPczVNeWwrgpOLIVOWScFwStfXBdeysXwuXSsbnvbPTqwWndQDBdsbYJxCOEejVHEjJZGWmGCjLizuPtjNhtlKMGhj",
	];
	return IcvOeozAFED;
}

+ (nonnull NSString *)AnzvsTJkCZlO :(nonnull NSData *)KhwHNNGFJzjEONi {
	NSString *ZTysUOZDUNsQbScLkg = @"OZNRvDelWDNjYAdLnwZTNiiOaNwCkoeLvdvaUBatUuYqxYLdweBsWDaYyimQxiEvxBZeygijQrCTWoSRYizXdcwqysfTLxiYXETvZNXgLtJhBSMwmpnLmB";
	return ZTysUOZDUNsQbScLkg;
}

+ (nonnull NSString *)uFyJcieYBls :(nonnull NSString *)OUfdsalbEOn :(nonnull NSDictionary *)qiiKVnHgShL {
	NSString *CNrQYnpADQNdO = @"GkMnkJjbpqUUKQKxtRzSKKXrsjlEegpqubyQGrEWahbrboblhvyXsphhlnefDfIZvgvtYjGplUorwSdMpywgjuWyKdJlxIAFTGmxRyUZKyrorKmezwhJCQwEHDkERaywyrrpncRuxI";
	return CNrQYnpADQNdO;
}

+ (nonnull NSArray *)QaKeRILIdkw :(nonnull NSData *)aUPxCEUVFjTd :(nonnull NSArray *)WdoBRCKdtdzquvKMHU :(nonnull NSData *)tgotyaxHLGYNXLosn {
	NSArray *SGiDnIaEGfnKVf = @[
		@"KbxEplUbPMTfSYiFbMulNQGeBRwmlPWFGMQBqIJeBjAURyprWIppZFwlMzMeJyJYDhsmNgvElTjVbiicrmWgTQzSiYaItskikjEicRpbvaFmeBerKSa",
		@"AcNPgqUtoKkUveKIuCJcUssMlNbDalNcYKwrbaCIRQhyyJusnDpvbvgjFSUDYTHriLFCYCKdJSzRBnHSIFSGfuZGPywCXGibVHXTrcMxag",
		@"cuajabJDIpZILieuDXzbbeaffCbjwHvmTbzPldNuLzBkFsUxKrCHeXrQfFWsHPvPLVpoOyPYQTfpyrhIVAaIklDnFwOSzulIzKURXzRJnURjVfiy",
		@"ViJtudqPzJFiLgwygJFkjHPEmffIQiHlMNcDKRqsUlGnoGNtpEeMejfDJfQfHTIEipmgWUxYOXaZbxvFvPulszqGisGsNndLDKSpGIGnXzjiXUeSfNfwqErTWiSWqDlDDUdmK",
		@"oQKaubExuGGJyBccLZqDYoCzVnjIcLXdaHPAvNildESMhGFYvaRSKThpEQohxooOtYaMJwMXbiJaSPsQxAolxIiUVmLVaKllgKJgsJqmDkDpVnawzvzwomo",
		@"XOrfQxgEdYUQDyjNgOeBLqGWLGeUPcjlrLtduqXHXuFiAQTEktaISbbuohtRiyFRyszBLqhQtldYySZzywmNLBUMyiaBKZvMGXgvWFagcnLCSEljghZTRmVhfQYAk",
		@"cEqdbLEuGSwwOAUfPAmsGFfubenhkzIqkQvCvrhcucIjHAijTdtqHZsEEPYHdKpVAgmOxqlDgsHGxRqmatXvbeXGcqcGsQbCdUrlMqrzAZctjZKbuceERLiDIFqwuySMYPR",
		@"MkQdmdadMRniEWUNOipXGrxTHxsmtbrVkKElYTpdHrIqzBJZEIszEFFTilBeQmCuQXxGxdmFVsPXyqiVhqNNAAyqVIDGgYyOXsryLAdWUhQLOFsOfajsEVepyBUPXZQsgaoDekCxWZBopeW",
		@"YVVVTKYdRctYSLRMPxjnriiAKTQsGCwppDpdjNlXfxVhXUCMggJULDjojufcZKsOtclFzrQOpwoqqwxesJmAMBhuzwWufzgfMRQbHkGyoQMvhmSaj",
		@"xYSvXNwbkGxxRucettzoTcVpGPSmZoYifFRGTlVdEbzqligookNUkNbuzkgSBBsrBagtGvhjguuXfzvBTNRvTnIMODFruSmEbxFCEXW",
	];
	return SGiDnIaEGfnKVf;
}

- (nonnull NSDictionary *)MkGJifazHsZJ :(nonnull NSArray *)wfTYFoFEJoWpIw :(nonnull UIImage *)ZBhlplHQwseIHHDt :(nonnull NSDictionary *)yVNoqHEhPVvqZYOLB {
	NSDictionary *MQTDfyQUAkvS = @{
		@"FsBgpbmdwFDsEDycBo": @"cgLYHwdHdnuDAhaJWXljBOZgZsJnUnyCJUgWHDdgvooLiDtpOCxAqVMExJzvZEbYLmCwSOPVfAipGXoxpAMsYwriznRlXNXAWCWxJRTkFzUAcZMrUlaEojDhKRKXuxKViteBQXvqHFJOAnXGfm",
		@"QgyBKurNNYlAovb": @"JvVjdyanIiuaOOehiOAQEaGpOFrQFEizevLpYHiMMVjoAEpDqHJqxiyORWaAFDPSRbKBnSEKEdezQbXEzmodXvCzOVvLEuiaZqJOedGitBdTFwdYrnwb",
		@"WLZuKTkMHbLkYwMap": @"GJsHYlBWglWRTfotQUbUHrEfkVrdRRUqsOspbAYgvPWmkCbcwFoVZzRkMnHljjKnTqWybYGQgHlshKvpRqgyfafhERAYwPmwUqrvreGHPtxPDIfcJlDcvZVcXkDLh",
		@"hzViaJAzMwLZIfUs": @"uCUBviYCHcvmpgnDemAyomXdWQbujHgcHhvBhvxaOubmLsUuvtyatcAXVNewNArSWAhKIjTifEOjAheMOpeFXpzeWxhlnHSoFCPiYyEdaybhW",
		@"TbAIPVTOikECbyIotF": @"EuQnOVSgtpBdkSyGedGYlqpvKUzjVWneZYPcrjygEUxFgrkxYzoKQblNrbQleqwkVkuPaPEtgrumOtlBUbpqsDxtBkDEzPVDpaoZMZRyzvCtqlXEUHTRreqvIrRJyxWBrxj",
		@"VRkHZUSZqWYKxC": @"OsWTmcXqLIHpZqBgzsGFukojYJWYrINrQZLmzLATKjwCkGLZvwgRbeXVMTFCFexPoHnVYURKIoiPDsPodMkioKYPhNFVhidKkEyMUGyEhHLyTfuTFhdWNkLlKJyAEaEJinsCxwJeSMi",
		@"IIdrjpukWkx": @"xHyKiPgGexHWVUWqRasidNomZGWHOpSjmYSgMsKjKzSXLvDXiiZCbGRddCSlpxoIzWEAtoWMslmDUguaMCKUADPsMxCeEhxCJmiiBebwiJAPkQFsgZFHOfRFoBMG",
		@"pQglqPucAaFQVm": @"aQTwSVTnVjvTwnSbgwZITspGuWFHnmhMArSctxKMAtLdjhXUlHjTKSQnRSLZSAebxlBGsIfdJtqcEvkXTlGoLkljlUxLnVIwUOjPBBKGhoGuPROiMAckZfVmrLcIRuSKVWntIzaUNUV",
		@"WitzJJjMurTryTwqx": @"IbKXsOAeoogvyGvCToTNwQnhADHoceduhxDdtDEsCMslhnswZdAIxlNHEFvQduGjODGHSBMukWtWjkfllAJdEWuADDZUSWPhPAeRjbCsYWTbbFCPSULgh",
		@"uZUiTPkWMcIxXe": @"TihxOppegFMVikqPTlAzzgSpUTnRClmuMetpQRKfNroIzDTKcskPqyjdhvqWyjiiuHIvXRqwURBoECOzmYhpOCEXbXeTDevgWMfZYbEltjS",
		@"zcRKgUBQKNycbLR": @"eVNTlbIuEcQqQhbQoYxTSyRehTJMgEklVCjJwVLcnZmDSIUUQXMvWaRtIVEyzMGYOzpcGQGHMxasiiJrTVnVizQxZaYHsASbvgUAFXRXabdCwJBeiXfC",
		@"mtdSMiLojCBGcSHDuqk": @"HqGEwPtKsljftWQuVOVMsdDaCFeAqcDwhkHotQRdcBlzqnkWPbBRKPsHQmFjEbqngFaAjcXCBWPgeqOMIoasxFSpGWosWCTZkIXzMGGKW",
		@"OxifHOhwmfxbZ": @"tSxTLdizopCiDxaBKWCyaWKAjHLWLdaFDUBXClZSNJbJsDlGlRejccDtTDINoutTkPTgBnyqqzZGDBKDGLjYljzCaUrpgzQtWttSXcVegbTVfFCkCuZMHVjMXExtLfTqOMcTeMbdQuSw",
	};
	return MQTDfyQUAkvS;
}

+ (nonnull UIImage *)oiaRnmXHmMe :(nonnull NSDictionary *)seomHoOnwxknKm :(nonnull NSArray *)AWSPPEejJffBjyPUE :(nonnull NSDictionary *)XIOpsYIdJESKHwwSK {
	NSData *UePYpEuvFtdVFy = [@"RRlLNdaefwLjqyYdFmbhpRVrfVUskyjVGheVLqkztvSLTXlVjvGBCLEMdSUxYFWnXPxRGXrTcVhjxQRBMefArFoZOxqRVsyjlFMfWiKDubvoyEXqhMfhTeSmOJCiPGHAJLasqgMoHeQYp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HZwCsFxZHQ = [UIImage imageWithData:UePYpEuvFtdVFy];
	HZwCsFxZHQ = [UIImage imageNamed:@"FbImaQMLIwbKUjDXQYqzZVHFVwMxGpaGbVZBMvzNubjOUwaUalsuWCcbveHemYaMHKezdsulkMXhaJIqdBPcyOFurlzTzIQNDhUndainshkkvQmKmyeQPbdbPHLVhpextRnWquXKwApRiBdmFdMm"];
	return HZwCsFxZHQ;
}

- (nonnull NSArray *)tsLlSSJPrFWJPbyb :(nonnull NSDictionary *)tIPVXzcjnuLr :(nonnull NSData *)eMUIHLZhbKHuwbCJDTV :(nonnull UIImage *)MUQvXQPOfBNEeAN {
	NSArray *xuDxtXCijWXQzOuC = @[
		@"YesOtqPCWaYNDKkLRMbZEMaaudxEfqWvqIPujCXxENMilLovzglDvQdhJMODWUrEGSdnkxPHLNfkbIHpQAZuhFNnELQdDowGUhGMFxjAPtTsRtmQWyvc",
		@"VJUQesRWmxFpLSCYVrZSirPpRisuJTAOGCFrshHDgsgfEBwQxYKyUFzIujyoreSPqwwQhQqwNwmzbJZpUllFSIiRzabVvhyaSimlWagPJnOzGMI",
		@"EZwaPHecskAzBFAxhhhnwFfZCUbneSalhlYEeZqlAFxUuOnNNquURjRaynVkuJuIqVWdXzslQgINUHiGKLlZLpkZIXNJZXiWxdslxmzYKr",
		@"yijtLGjPhzDHfPBKUFjYAKYTmSZaaBDMiZVbUFEZSNWJQWxNSZpaMsHLJLkeAVxeUHFElycSZaAwSPReSFkngWGsSiBjdzeEWMiTufVkibEyonOdOlcYdVSrGwyQsAShimVAthsnTguFgIwVKmh",
		@"enFLbpQIwBeHcVeDutsTQEFoWhTUbbbmHzXxbRyjOrqbNeuuAMwzzzxQxUpBqPmJaAQYhDHOLXsUjkMGnFFkMnHjYmouKVzCZXCTHbuwyicsZd",
		@"urYpUADtaLdXBssOvaHTBWuLiXNcnlDyqeZVWcajFqVIJgEHNdIMFdKopDySSiiQupZlzRGfOKKcODlwxHeKVyALUGKfLwwUFPCzsyNTOCuQllDPgjLEuhIpDC",
		@"HVrfvokscBqWRKBwauStDzdOmwfcYBwURTffjYYGTaOFkVuCQamzflvErFJKJzSOkrPpwwHkFAPmjclDUqyMrHqMUGKrEeHclfoOMFeluSBMmBrGmOGPVxgiZCOPzcjGb",
		@"ZRHGXJEcXXLEixaRVemkYnMINpjypANHIHbRuULxcxTGqnIqmzhjOekFGdomcLIsiNPpSDclMDPsNsgAKqAMoktFLHgqOLidieMmhObgvutWgvAOaeRpApblYsJakmsmfsHkBIzgbtW",
		@"DegtFexDncrrMpbQXIiqpsfzipERukWNyZRDESRUVkKjuSuDobpPeiHtanSFznKPnKcaIVjqGhkvnoWdcxLXmQqsZUuYQtVefXCHoKLdWJVrWMppDPX",
		@"bklUeuWOJOacrTimpOioDGFsaDypnJZVHNBlfOGnrhkJQZFRNsgJHHFTStymLBNuuozHDccIPrVQXTXNhGiNmujAnVaXxwysBgVxapmERNsTBByYqyNZsJDt",
		@"bTvbExxuAjhzQXgvfTiurrMVfNhUwLSpmTcpCmGvGrRcLGArbnWuQIXuXGfjzVeRgQffybHPKJzUEulvOpGwqmGtKgiDFXQvWBCwWOQoUwDjOuDxhZGOdAmarKCzrQQdzDlEsQhTNpox",
	];
	return xuDxtXCijWXQzOuC;
}

- (nonnull UIImage *)urLnWCRxvJzGdL :(nonnull NSString *)bOHDCAALeGuo :(nonnull NSArray *)ZaJzhxMheg :(nonnull NSArray *)SWvmGkyRqCPATsaYnM {
	NSData *aqtRQAjLWGCboEPMQd = [@"fPJtVWKSyOrrHPIiBYOYUPdDMRufEmMeUvDcQeaCINuHftkujZzBujgRjscULHQzmrOvcgiXItTBKXFRhupLbVuLygHiGhiVUHxKQwLqjuMJoSfTZLoQazxEQqRorWvWuc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kTuKzMMRkLV = [UIImage imageWithData:aqtRQAjLWGCboEPMQd];
	kTuKzMMRkLV = [UIImage imageNamed:@"BXAfNYxokhqRvoTxhBUXOEkXwYvxTJfCqLRSUgjbHautInoWISbuyCNvIzNjxrGeciRmsvhqfYlXtmqLmMHmUwRvUwMEbGsYNzvaKjanoURR"];
	return kTuKzMMRkLV;
}

+ (nonnull NSArray *)RolluPAZyexTJtJkzBC :(nonnull NSDictionary *)jCFoYImNQJo :(nonnull UIImage *)EYJElJGMVIxhhAUxZ {
	NSArray *DsXSGHEFRmKWBt = @[
		@"NTEoRCJszbFgXwpMGMQnKzWjbBvRPfWvCbqNnOuZDvOnnZXxUsMEvCafVmbQzsplTFDMQehJNcOtbZzfqZCiolqQUMOpdjcUWJHIUWsB",
		@"EUwyHWxIxwOrUJkQXsxfXlaFFhkZRFibXWSzMqGMirJZoieJvtSMeFQmNSwuVqGSvqtbwOOApXdjSAuIEVulgQCVafaJzDneqzdsyZIlGoOHMIHwyKKsKjCotCjeYZPWTdlGQvnUxiCmKuKOPW",
		@"TbdzlMjhsWPuYHZmBmnvkoksycvtXVOaWuJRObXfwinqusFSxrIpoarUlSWhtBAakWVdNxnwgiEhRcJPSADAukodjEvXDHAJvpkvKWkHrmfEQRTRjhCkVSYlAlZUKpkiHALZWQRlxVhRqoEKzi",
		@"MGpbYnGtwXrbSWsxUqxxkqCdfLcJZQhrVStzeeZgNVuaVdkmHzMExlZvDYPDjZbJRmLkZAGtSsPICynleVSKZpAYFsdpSvZoZMOWXjsiWsNfirNIqTXKxyiTHTKMhhtLKOBFavlYxY",
		@"vrkEGEaYODqIRplxxXMWboraaavsQyWGhnqknAMtCBPWegbvRTkypRpjOKTCyRfgQbjjHgWeitLidFgtYqXlUNnjkqyCksmYSVZOraniSyyEudjPy",
		@"tHvRABNzubGsJDqFTcLMJGRoLyNdkDwAgoIFoyKUMxxnneSurTXWHsUozorZWGizJeMjQdTpLJRSFdEicBEkDRvYKQlAtTuDHMldIuXgcPOEoXXICPTlwOcTHFPQcAHYGf",
		@"QxJzNFBTcfsCwOBGtaGAIgoSeSdiSeCHMPlBpSNnuydReFvoJloTcKUpchojHgVniPJBCkTwiXIXcfiaxtoQPKEdCTNyjdGZGZDvlKyUyuyDDAmYolzwpqtNYAYNC",
		@"pJlcyPgJqHFqWfMIftmtvXZVfPQxbEahnLpyviOrPnTtQlBRBhHdMkIZUACUdlUEGuGdUOsYasfuSiJfesdJyCMMzRhqmszjfpXhj",
		@"boVAcFLaCAaulDqGIZrZFXgVhoNTOtJSHraqhceKlATARfMdIRFDGlpwNvholgNGWZhCHsWlSjMmvuWEFRHPckOtsBeoIFFcOUxNTAlryypyqFl",
		@"FipUxkoTCzOduhRNApmEYbfpqkwGgZOZdzNAdtRuVgZetLnTFqQRZhjFsnwXXRPWTncVxQGhCreQvlBFWtEMGBKqCQRRXqkLtlWgJzPAUVzCE",
		@"BCrwmQUKztTqzTsxxCzoEYjvnxFUIQedJKgvPrGiSIKQMMYgGPtgpBFwMwMFfOkDphPuyvxhzskFsFeMDEqiiDeLwYdBSBagmonyKlnCDOMkmHIIALExLL",
		@"TWomjBaBnzTBvJPEKGaaJJLJoAqvhHLcyoBXPGtplMNHKAxEnwxYXpyRwQglcyqjPZXTuocIyyfZNeXTMYiSxbkxFtDeaVNwsNDXLPHVNioIcwyiELztiMFH",
		@"LirFgFZupWHCBVhbEgyNQkRWwIgisDBfsWqoNYQmxAaSpsualotCJsMuUTlDGPGAPoGtpRERIElSVHbXlQiMRHEotiwOqrMReyVJEhvcPK",
		@"CZokPBdFhJCkhKBQYhHNqGbUpWFqcNAEDMlHNmRPEWvEomNwsKvSAgJTEDPFCXSTwneuhhNHzXGPPEAdMmuruLWAlnVnFPXMpoNdSZXFtpqTiZLVhsOhqLPDKMZGrFYGJsffHk",
		@"PYdIvGzuBHfPsKAeUJiNDvyLwWSFeFlNjcAwHhKvPxokBtqwiFWnkSEupKtGpsVbwQDXCFOjNAyKCQyPLnQgVNTbqQkGPLkdmSCaJuiwmTYZywBSoFEYitUstHPNzQmsixttrJEVodWNmz",
		@"fDAkDOGlDjwZuEdIGVLLlyZtUBFwxoYcFhsRKTBZpFYkSeGlwtoaisjrcKOGWvHUTebtYdCXFBHGmXjtErACqyNeJpzGCSxyXzpEuuEvggT",
		@"oOEkOgYIGJPxelAmjJTmSgmmpZhaPPLQiWIZvggxQMnyCKqCaTJsUKrMKjjIfYOIZHSHlVygZeJshTScmLjpLOLMGHLmofPVkNMuIebIkTDkiONueGrVyfDGUnSDwcvweuzDXtFymCvTiAxfjGYoq",
		@"YQKEIyCxgphXswGdWNeylTUUuYtQQtxMdbddaChmzTvPreDOeIpKSJQbQJKYaTDyVkLexCwtRKgaeyteabPZYJkftaTaAZcrfkKibnEcpUAIxjAohFHpLOueVQAqBQAQwNhPWBoybhU",
		@"CeCPwWiNOtbxvVQtsdmLylAOAVOsdVOXVkuBoolzcjqbVbZuRbZXUFomsViPEbQrLkSszoOODpTHnJQHnobbBeRCHYEfCqcSUDswItIPsNkgTgcOJrZvluTWSFfzTO",
	];
	return DsXSGHEFRmKWBt;
}

- (nonnull NSArray *)lnGXRrjRThcwqZZiTrG :(nonnull NSData *)PUuugfWXOwTxQdcvZ :(nonnull UIImage *)SwCieBvQXFHY {
	NSArray *GrNDSgRyARDaY = @[
		@"lGidXLdxchqJMGuitXEZqTSKtSCihfhxjiuCtjEuKCvwhImJmhAWtDyRBUeZkvyADhCEYbkyoJxBrwJtoVzPEHngRkEXEOMREyfFryaxntxabAxHULvY",
		@"HbguJzCcSqLynyqLUboZjwmgrgWOwtLLuqPqMOrDvBlnqhTrBRqVEJfSFfYqldxfApkkoqBvivehsOFzxMRmGKMBfCUFTEDHJCXISJd",
		@"jWZiXaqXdLkmMUSuniXZSfvOVkBRayrYYNXvekBWgWCAvvHIhnrPIkHlHtaeTgyVhLvSoSvaieZbDtzQlYMsHbpRBSHEzyzefsTBflViTcejdMuhmDGVbNNbwPn",
		@"gNuTSIMrkSkjmzIKpjjZUukGurwTRTvbTUrldJbgwkyDaqmIdpeevqIFvZnogbmkeGVijHUUVnSdSoPruLmXVNXuyUrvUVAWusOZILikUYlZm",
		@"AbmqFdJZAsoFHeIHskQUMdFvdYCkaDqArOazeUXcUjkmbiBEPmwHDmJmKbrkkDDbEDMXWronAXLwxMFBLwZLdRKHdWbgELNTqlibSNzlalonqdVPVATrCHtktR",
		@"ZSSfAAQKebtqmonyqMSWUJNwsQsgUBDQRoiqIerErUEhPcPInIjDOtIxtnDKZnTXgBemqwikGqpqZFEMhKZvZMEvknZLTKaNBRjOhVBsxHuqHYwsMLehMdJPv",
		@"UvkRUKTnqRUACxvMFIDhsIaIdGZMbJqFPiWqTDoXszfgUThYEPCjCwueFZCmTxCZURncdONuzgsjOUBoMcJqnaKqwWOlVFevxTpbwbLZjiouTKbmUCZseEhZslRSTmCqpUPIaCfvCamGEzFe",
		@"WwfHutyvoonSPaGjEbMPoGoWfeTcOIiZHbDTIDcUsmeSLSrPtkyhDqSEjjohddyFaSZxLvVhoBdnJFgHuVuwjRkyRQchWVtHHUurqGNpRRFlH",
		@"wIATnOnivkRaBpvGbsqGngckJYKcZXLTcOTNoyPAIRjqdfAHRUAKkhFtASyakQXDRPaJYtuwRmikDKtbaiFkDZBRnRjZwMDHbMSCnTlfXeZZQ",
		@"QkftFGsTVxFaikTREPllUKrMCPcZqvUXZKHHBQxjXfFJEndvsladWAWWSjcZRvzYsnPSnxmsLoRfRbmJurXCxCITovLyxmYuPMWbbSMyyXbPIVvbsvwtoLFgTU",
		@"JrmzRPRSHcCQvvEajMWVCGYehdbLHNIAAhySXWwnelYUKPBXsqqeHelIjCIIRFfCbQSzchjRfEqALxjsAdJyoIACltkDYwGWqFkBhNdqPkeUZkAZlhCcgLQwwpgWjwBHSkfnROYCCvE",
		@"GjJHIYgvVgvXweAAFNWgTSTAXOmGXyQCtQYLmmveSErHTteNZbjxhPzuHjDrjRTEUeTAGQKwIZChuSkrlPVWiPOSgszQaHHzmqnxpaKYQzyhRNIkVy",
		@"NuNkxspivtCOMrCETxAxdcqsnaVxgycbdagTutIUdheWFCaarnVlxPomHBeSlFjhUrUohzASUbkdUHvmlYbEuBsEMaitZjVLKQPMHTgOtFZCd",
		@"XrUDchMPMjxBFQMaUbhVBNZqpMdetgUTCuGplEpYjYQMSZjMCqvgfMXrfcwguVbFznhMPNORxkUpeolGePXnAqnSazgCUMCpLwZkFXGimHRZGRJkwQuTPNrltXqzkHmbSmMFMREPOsZHqbDT",
		@"qvhGRUxTRaeqkPAKYdwbBsHvcYCABochrpbQOKimxvHoiAzwcLlPbbOfEALMWShPKNaONGjxUCksSCrMvtzsRiWuGMoOuZAIYUmztbLlFsNBKQdb",
		@"CmitsICjYwHZIOFRqCxCmAotqMlAoFYprNBoOMfwijjJYAraLDrNxTMwSkixiJgvyVDaNPVQXQXrIbSoPBAVhoHvTcqQpsCYUimgXcmcmWLxvjnRToqSdAJWwnvdCiSNJdTTNzGCM",
		@"MndxLBfToloeOzKDSeMocTaBpQynBKgVgbrRSpvyYaUBFynryYhxkmlvqcEWdWneHInvBiPMGouNrynNfhGjytxyYxBhPYLruHufk",
		@"IXwjTtDpSImyEuMDcdMCSBemjUqIwCjnfFntnFYMVfNBMzERllCbxDLOxqJBCqPXOMHmWXNeEfRXkHZfYqEammMcAmaflkkRorRvtzZUUzvXJCQSTzxxKAwV",
	];
	return GrNDSgRyARDaY;
}

- (EMAlertInfo *)buildAlertInfoWithResult:(FMResultSet *)result
{
    EMAlertInfo *alertInfo = [[EMAlertInfo alloc] init];
    alertInfo.alertId = [[result stringForColumn:@"alertId"] integerValue];
    alertInfo.alertName = [result stringForColumn:@"alertName"];
    alertInfo.alertRepeatType = [[result stringForColumn:@"alertRepeatType"] integerValue];
    alertInfo.alertDate = [result dateForColumn:@"alertDate"];
    alertInfo.alertRemark = [result stringForColumn:@"alertRemark"];
    alertInfo.joinLocalNotification = [result boolForColumn:@"joinLocalNotification"];
    alertInfo.isFinish = [result boolForColumn:@"isFinish"];
    alertInfo.isComplete = [result boolForColumn:@"isComplete"];
    return alertInfo;
}

@end
