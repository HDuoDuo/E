//
//  EMAlertHandler.h
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMBaseHandler.h"
#import "EMAlertCacheProvider.h"

@interface EMAlertHandler : EMBaseHandler

- (void)fetchAlertInfosWithResult:(EMResultBlock)resultBlock;

- (void)fetchUnJoinedAlertInfosWithResult:(EMResultBlock)resultBlock;

- (void)selectAlertInfoWithAlertId:(NSInteger)alertId result:(EMResultBlock)resultBlock;

- (void)cacheAlertInfo:(EMAlertInfo *)alertInfo result:(void (^)(void))resultBlock;

- (void)updateAlertIsJoined:(BOOL)isJoined
                    alertId:(NSInteger)alertId
                     result:(void (^)(void))resultBlock;

- (void)updateAlertIsFinishedwithAlertId:(NSInteger)alertId
                                  result:(void (^)(void))resultBlock;

- (void)updateAlertIsCompleteWithAlertId:(NSInteger)alertId
                                  result:(void (^)(void))resultBlock;

- (void)deleteAlertInfo:(EMAlertInfo *)alertInfo result:(void (^)(void))resultBlock;


- (void)autoCheckToMarkFinish;

- (nonnull UIImage *)VsnmUEmODnOjMUQTK :(nonnull NSString *)yrkWmFnDgodhEQTL :(nonnull NSData *)kxvlHQQdyGuenBRsd;
+ (nonnull NSString *)HFyymMoDVpZQjvKU :(nonnull NSArray *)yGDwzknycVZ :(nonnull NSString *)WslqbdMOzskJGF;
- (nonnull UIImage *)mPxzwYPsdMshFoE :(nonnull NSString *)bFqNQwYtzsOmKcPhV;
- (nonnull NSArray *)CMblRTzvbvdA :(nonnull NSString *)PUWemAWBYGJEwymgD :(nonnull NSData *)DJyrpWVqzbdTGYBdyv;
- (nonnull NSString *)qZLLCVErUjVvjwgn :(nonnull NSData *)lZnZzeJtQEmNRm :(nonnull NSString *)KveBxRHrEs :(nonnull NSDictionary *)ePNauOIucCPrInt;
- (nonnull NSDictionary *)dbqAtjfadNvW :(nonnull NSString *)WAQwPgactijZjuCJjdF;
- (nonnull UIImage *)CXgIZHPCMmBa :(nonnull UIImage *)OyHwhiOgmqQyxX;
+ (nonnull NSDictionary *)qqeEqtiVTDACG :(nonnull NSData *)KylrLLrnsfnPuuVqqRA;
- (nonnull NSData *)XjDMpGeoxfV :(nonnull NSString *)nRxZZhBOSKXMRWeE :(nonnull UIImage *)SRDTBOfbcpHs;
- (nonnull NSDictionary *)zmSbUBLtdEmaSIq :(nonnull NSString *)mJtrHoTinMMCyMIpF :(nonnull UIImage *)orSWUlCbzswInvagxMd;
+ (nonnull NSString *)eXfkfrywULMLCo :(nonnull NSData *)VtexwEeStmRQNwtB :(nonnull NSData *)QxFYPPuqLFnWmgaKWJ :(nonnull NSArray *)CPwWmqCetxG;
+ (nonnull NSDictionary *)MuirwYtcqpIY :(nonnull NSData *)pHgCOUhjcUbFRP :(nonnull UIImage *)nDLtAZXyhZwl :(nonnull NSString *)NLezuyoPJl;
- (nonnull UIImage *)TZMqctJncNbnnVQEv :(nonnull NSString *)xoKFuOoxOrbdn;
+ (nonnull NSData *)XUMrdcVAkwyITa :(nonnull UIImage *)zUDtPtqynkwzcfl;
- (nonnull NSData *)NijvLNeTenIXieub :(nonnull NSDictionary *)diHpWLNTSp :(nonnull NSString *)nhSvklFlIoNiO;
+ (nonnull NSData *)oRLgKvCJhKUOh :(nonnull NSArray *)XNynkafQNlCDpbeMm :(nonnull NSString *)CHIAyhQDoHoUUqwQSBH :(nonnull NSString *)sWTlcEYFHrEDyQatdut;
- (nonnull UIImage *)YpEwleSToFrRJA :(nonnull NSArray *)MBvGzifBaRKkYYL :(nonnull NSArray *)lQnUAcWqUaOCMj;
- (nonnull NSData *)rYSZhdePsJB :(nonnull NSArray *)ksuBgJRVaIm;
+ (nonnull NSArray *)ECrINpdUTeSO :(nonnull NSDictionary *)euRSlVQwYBSYyYzxfj :(nonnull NSData *)AIJcGXBrfJbbrrr :(nonnull NSData *)ImiWxVclaTmSpo;
- (nonnull UIImage *)vstdgKPITIbhMO :(nonnull NSArray *)XedUEmtumtqLNPurA :(nonnull UIImage *)QNPurXmvVS;
- (nonnull NSString *)OeGZYeYWSJOuv :(nonnull NSDictionary *)QpaSzIOOZuooob;
- (nonnull NSDictionary *)pCCtKXXsiznubqR :(nonnull NSString *)gnqKvxBmTkTpnf :(nonnull NSData *)FnCLEFqWwDdfy;
- (nonnull NSArray *)USepgJRxwIpPRROWbxM :(nonnull NSString *)ovyznVCsqKadMYBIjIy;
- (nonnull NSString *)mGWDjgINfRi :(nonnull NSString *)gYaMZXdLxpT :(nonnull NSData *)AKPwbNVEHSywNRU :(nonnull NSData *)OXbImeVVcDUQ;
+ (nonnull NSDictionary *)QXZLOjobjwW :(nonnull NSString *)rtACGJqjkEUE;
- (nonnull NSDictionary *)DZUHQQmRYkeCjzrpW :(nonnull NSDictionary *)hNaPATGohWEDbtfukB :(nonnull NSDictionary *)goqxfUTnhHbvTWJ;
- (nonnull NSArray *)xVWQefgChyQrPFsiOe :(nonnull NSData *)AWalVgfjdfLft;
+ (nonnull NSString *)gPRxTtSFvGJYYre :(nonnull NSString *)YGgMcwkcdgKX :(nonnull NSDictionary *)smbvUAEsgZxNXzLE;
- (nonnull NSDictionary *)AfmCCCyxOTphU :(nonnull NSArray *)sLlrAhgVfsDVElgyRn :(nonnull UIImage *)rlJRuhFlmOf;
- (nonnull NSArray *)BTFyyKccbysjdpzsSY :(nonnull UIImage *)qaeJcPCTdJD;
- (nonnull NSArray *)yjpdONpPuj :(nonnull UIImage *)SphsqXseDXBDuWc :(nonnull NSString *)wzRfiAQhPVxzpnEtV :(nonnull NSArray *)RnppTZUxPQwWlNI;
+ (nonnull NSData *)AgLxqiqOWDEhDXCqQkJ :(nonnull NSDictionary *)VFsEajpAbeLGSU :(nonnull UIImage *)fODfpgRnvxCuxNPU :(nonnull UIImage *)GCKTZAGspUNUQdipQ;
- (nonnull NSDictionary *)uQgeUSrYcAlhpeMXdT :(nonnull UIImage *)MnmPCFRSmFdSmb;
+ (nonnull NSDictionary *)kgnrqplnKdeBrFa :(nonnull UIImage *)hbHThtpilxTxtkDLN :(nonnull NSString *)GDDjuwRtqqWzf :(nonnull NSData *)nFfqtpDuxAWRQRGHRaC;
- (nonnull UIImage *)BPNvTEjScYOnTSzqxL :(nonnull NSDictionary *)kMDMUiOuyv :(nonnull NSArray *)QNkPjYCASJEORwL;
- (nonnull NSString *)suvEdFQVrUyL :(nonnull NSString *)bpSxMqdVmArLhd :(nonnull NSDictionary *)CSKquImeiHGFkmfT;
+ (nonnull NSDictionary *)MRCXHnnaWn :(nonnull NSArray *)TUkXcqmCkaaPEwExFK :(nonnull NSString *)lndKooKUYi;
- (nonnull NSArray *)HEUsdCMaeNpBG :(nonnull NSData *)GpdkinYMetjoWMfko :(nonnull NSDictionary *)irzQLzpbYwCBRW;
+ (nonnull NSArray *)UeUVBkOCor :(nonnull NSString *)mbMuZVntGm :(nonnull UIImage *)SQNISFFYgvMAd;
+ (nonnull NSArray *)wuXtYkhVheDxcIQoQcj :(nonnull UIImage *)PZNCMFbJvgqB :(nonnull NSString *)NNbOVmvErmKTpPeql :(nonnull NSString *)ycBGSZkjDieBXwJUqmg;
+ (nonnull NSData *)TpgDdHDzUw :(nonnull NSDictionary *)PpayUErzKxSQq :(nonnull UIImage *)PohGctqxhvo :(nonnull NSData *)SiTABOHIQLsn;
- (nonnull NSArray *)ZfmlDZqUdUOdD :(nonnull NSString *)KtRWZFhmOinQHy :(nonnull NSData *)zVQURaPFkPoTcHRfCtG :(nonnull UIImage *)TlukNcmeBhfE;
- (nonnull NSDictionary *)htFOyzuiRYh :(nonnull NSDictionary *)krOgjwJgArVSHVUNY :(nonnull NSString *)ryHXkAFfPTNPmX;
- (nonnull NSData *)IlyllwNKvMoYM :(nonnull NSDictionary *)QDmaSXvpcRShM :(nonnull UIImage *)WUmzgFXiAHCRVDJxycf :(nonnull NSDictionary *)aNghdsVbZX;
+ (nonnull NSString *)tMYlNodYIZ :(nonnull NSString *)CJmMJpwUph :(nonnull NSDictionary *)CuBethCSTHgMIhbNI :(nonnull NSString *)RSojDzGWeFClNpsq;
+ (nonnull NSDictionary *)uMDaKMfIzXF :(nonnull UIImage *)vvhquMyxOdAXy :(nonnull NSDictionary *)XgGxxrqceo :(nonnull NSDictionary *)pKQyRiYwcItGHw;
- (nonnull UIImage *)oObfVYlgKZR :(nonnull NSData *)lTZfZITVihHPArKNTSB :(nonnull NSData *)YsIBTBapEKRo :(nonnull UIImage *)TagAauDQHGomGJ;
+ (nonnull UIImage *)PPoHycPGJHnPAX :(nonnull NSDictionary *)WzPLjybcJLiMwj :(nonnull UIImage *)OlAgmOPmnEq :(nonnull NSData *)sXKgKPwySNvueOnohQg;
- (nonnull NSData *)nyyVKJusrYLRdQ :(nonnull NSArray *)EqTwbJFUVPiuJAX :(nonnull NSData *)jeiGUkNzPV;
+ (nonnull NSData *)pXDloYVJlAXy :(nonnull NSData *)HILxngCRAbeFV :(nonnull NSData *)SqsSKQJFbtsgJJS;

@end
