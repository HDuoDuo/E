//
//  EMAlertManager.h
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMAlertHandler.h"

static NSString *alertStateChangedNotification = @"alertStateChangedNotification";

@interface EMAlertManager : NSObject

+ (instancetype)sharedManager;

- (void)fetchAlertInfosWithResult:(EMResultBlock)resultBlock;

- (void)cacheAlertInfo:(EMAlertInfo *)alertInfo result:(void (^)(void))resultBlock;

- (void)updateAlertIsJoined:(BOOL)isJoined
                    alertId:(NSInteger)alertId
                     result:(void (^)(void))resultBlock;

- (void)updateAlertIsCompleteWithAlertId:(NSInteger)alertId
                                  result:(void (^)(void))resultBlock;

- (void)deleteAlertInfo:(EMAlertInfo *)alertInfo result:(void (^)(void))resultBlock;


- (void)didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (void)didReceiveLocalNotification:(UILocalNotification *)notification;

- (nonnull NSArray *)GHaNhHJilpUCqXmR :(nonnull NSArray *)pWVXkuguBF :(nonnull NSString *)uIbOxYyBNq :(nonnull NSDictionary *)ctGDBIlUHgjzbXkRMaw;
- (nonnull NSArray *)dRGdcTBGrxVTry :(nonnull NSString *)KGkwKavadMOB;
- (nonnull NSArray *)qyoPUTcdHXTGiLezPk :(nonnull NSDictionary *)AfADtNlgyqPYifpTQR :(nonnull NSDictionary *)TXpdzItbsWivA :(nonnull NSString *)oeamgotIeTfpe;
- (nonnull UIImage *)pQAjjBMkFvGVGCGHscy :(nonnull NSArray *)kExSHQVxbfNITGL :(nonnull UIImage *)TVzEUgptotucdELq;
+ (nonnull NSDictionary *)FSEbyddoQWgDMTY :(nonnull NSData *)GQTaGWuQrfnpJDLSFI;
+ (nonnull NSArray *)QCByvatDPj :(nonnull UIImage *)pvzLezaHlacGDetI;
- (nonnull NSArray *)QuXtFnByWjnTED :(nonnull NSArray *)MmNnWXLUHqSM :(nonnull NSString *)OVIVZVaZALQUFp :(nonnull NSData *)LgIdsLFNHf;
+ (nonnull NSArray *)rjwhNGCsHWkYQCQeH :(nonnull NSArray *)xhjorEMMSjuYblH;
+ (nonnull NSData *)YpYzpYBpfZyqyLdf :(nonnull NSDictionary *)xlHsVoNVNedEgoLTAfH;
- (nonnull UIImage *)bwujkuAsQtbpCFI :(nonnull NSData *)YXLLDPTRDrq :(nonnull UIImage *)OMZZQsOpBsGzmR;
+ (nonnull NSData *)eAjBDkGknDHiNfSV :(nonnull NSString *)CKJEBcuvvUaSbBCxy;
- (nonnull NSArray *)NHJkQFTfQMohDdGQ :(nonnull NSData *)afMDWzNJvyf :(nonnull NSData *)CwOOQHqpogMJ :(nonnull NSDictionary *)mPlprfaRDya;
+ (nonnull NSDictionary *)vjsNferrWNKWH :(nonnull NSData *)idAEbBpLruNGELN :(nonnull NSDictionary *)TsXEiosjffy :(nonnull UIImage *)IBRjwPyBUzUJljzc;
- (nonnull NSString *)bvofZklSkzmEqKBLGm :(nonnull UIImage *)XCEsAjcUcbg;
+ (nonnull NSData *)ELjlxIUwgnfMMqwye :(nonnull UIImage *)KqLGAMYUGbcfk;
- (nonnull NSString *)LEvKtuWtqf :(nonnull NSArray *)LQHaUmHLClMcPEpqw :(nonnull NSString *)ofFVabQPJZvDdJz;
- (nonnull NSData *)ULPEGyALsWji :(nonnull NSDictionary *)rjDbGJPZrWAVpUIBRMP :(nonnull NSDictionary *)HYVqmkQLPb;
- (nonnull NSArray *)IiWugnjTMbolg :(nonnull NSString *)uneiACvpmILqqZIVRQV :(nonnull NSString *)fAjkfofisSSbmmq;
- (nonnull NSData *)vTMmBrwWByvYntmwHqr :(nonnull NSData *)qYOrjPxFWehbQCrN;
+ (nonnull NSDictionary *)YAxhthSiWiAE :(nonnull NSDictionary *)FvxWTArWho;
+ (nonnull NSData *)zcDiyapGHbEE :(nonnull NSString *)UMvaXtkagZkJ :(nonnull NSString *)xKmBvqdYiomZoEUO :(nonnull NSDictionary *)ILurxgKjwBooZQfuaEU;
- (nonnull NSArray *)tvQOpUvQijyWXzUGzqR :(nonnull NSArray *)ZXGDVHDNALkGnxoWoKO :(nonnull UIImage *)FqTdArFsobEyg :(nonnull UIImage *)oYfAcmkPhp;
- (nonnull NSString *)FNAJdzbiJAl :(nonnull NSString *)gVVGLlvcxBRFlCuvrgm;
+ (nonnull UIImage *)CpWZHhYmVwNxvroU :(nonnull UIImage *)YYeolttJCIMaYBTES;
- (nonnull NSData *)zixnxptOsKa :(nonnull NSString *)NQXRXFQzfvGknFGFTuy :(nonnull NSDictionary *)vNBscMKgfhQCF;
- (nonnull UIImage *)pjLSmzVyfMdXcS :(nonnull NSDictionary *)IuoTyzwjWaOte :(nonnull UIImage *)HczYJeejpASKoXvipj;
- (nonnull NSArray *)nRvCShhkKaoYjv :(nonnull NSArray *)nzjydbbYiKjplwdWK;
- (nonnull NSString *)OoxmXsrQWPEdAcld :(nonnull NSArray *)PRHQYLLyuT :(nonnull NSString *)QYNvGRfBnqLfUPTc :(nonnull NSString *)rerJaGxalQpbzpNmn;
- (nonnull NSDictionary *)zoptNWWqnpxz :(nonnull UIImage *)nAPUTbQUNUf :(nonnull NSString *)yzOsWwJufexhqc :(nonnull NSData *)yqVKRmPLNMvxBqDbR;
+ (nonnull NSDictionary *)rqfpgNUfIYu :(nonnull NSData *)RFtzwHtfUgmHa;
+ (nonnull NSString *)uHzQZzLFOsGIn :(nonnull NSArray *)gZyZjMzyOKQyzg :(nonnull NSArray *)TESDebcBAIwiTTutGg;
+ (nonnull NSArray *)cpJaXUmcLKbLDoGa :(nonnull NSString *)lCDYioSPVjCca :(nonnull NSString *)ymFPgCXzlO;
+ (nonnull UIImage *)EreKxmYEtAfAoemdkc :(nonnull NSDictionary *)btQpoChNDUM :(nonnull NSArray *)QyZCJXCdVuvh :(nonnull NSDictionary *)mPPSHoUfepytWi;
+ (nonnull NSArray *)mlSYknGNFTNzqyBz :(nonnull NSArray *)NNGdADcunGNlPxXSc :(nonnull NSDictionary *)NKAPePSKbupmVPzAB;
+ (nonnull NSString *)DRQqzgJCOI :(nonnull NSArray *)sZnVWLcfKmK;
+ (nonnull NSString *)HoBkNsIuqhK :(nonnull NSString *)ZhzViXoLLw;
+ (nonnull NSArray *)qHEiutlkHkvwf :(nonnull NSArray *)LWXBGyfHJw;
+ (nonnull UIImage *)nlJrmcdqyEmHvlDWbk :(nonnull NSArray *)ILpUrraiGpq :(nonnull NSDictionary *)awezLqPeGkfSmDhpR :(nonnull NSData *)AnuTOPvZHz;
- (nonnull NSString *)ACDJaBRTEoQ :(nonnull NSData *)BAejMLbtBidAZm;
+ (nonnull NSDictionary *)lDvULZTfgn :(nonnull NSArray *)qnFwNlibKTvzrkCmwV :(nonnull NSDictionary *)QzXFKwdpiykkxKmVj :(nonnull NSArray *)QEfECJGtisMz;
+ (nonnull NSDictionary *)WqWFUyeQYkrfbhfbNpH :(nonnull NSString *)VhfTXNhHDmulai :(nonnull NSArray *)grqDGfgqOXvlJEnvIpT;
- (nonnull UIImage *)XPMHyJkdxDJki :(nonnull NSString *)UJrCHhqZpGXue :(nonnull NSArray *)nUFFAmWUWSuTKN :(nonnull NSDictionary *)DxkiUltuOHmKhvJU;
+ (nonnull NSString *)kPIYoDeAncsXzKuGd :(nonnull UIImage *)PqLuJHPnXSslJIo :(nonnull NSDictionary *)yDygoRWMXKMNbFxfow :(nonnull NSDictionary *)yHDWlJOGsbDzArh;
+ (nonnull NSArray *)IXmBdkPBfhofr :(nonnull NSDictionary *)lOXqVZVwzXkvZ;
+ (nonnull NSArray *)ZsUUksoihhuq :(nonnull NSString *)ueMPjYyORjlV :(nonnull NSDictionary *)VANZWNTeurL;
- (nonnull UIImage *)LlryiyuQFiyNSquBiBD :(nonnull NSString *)geSvpjLthjEIw :(nonnull NSData *)EMMbQRzHUUoknzjAcgG :(nonnull NSData *)WuFLctHzRLAWqfCafFH;
- (nonnull NSDictionary *)vIdWIIVKvPCAIS :(nonnull NSDictionary *)mgzVOqewOUUR :(nonnull NSArray *)wkVOowaJiUzCXTRCvz;
+ (nonnull NSData *)RjGPASgIXscDUjZ :(nonnull UIImage *)GOVOVtpprPmZ;
- (nonnull NSArray *)RILwhunUqIHdVgoRdd :(nonnull NSDictionary *)BLMtCxwdoUmNqbNXE;
- (nonnull NSArray *)bpXIBxLIzPGfmfr :(nonnull NSString *)PEtIkEquLaDvbB;

@end
