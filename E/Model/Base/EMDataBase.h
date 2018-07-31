//
//  EMDataBase.h
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSInteger const kEMInvalidVersion;

@class FMDatabase;
@class FMDatabaseQueue;

@interface EMDatabase : NSObject

@property (readonly) FMDatabaseQueue    *dbQueue;
@property (nonatomic, copy) NSString    *tag;

/**
 *  初始化
 */
- (instancetype)initWithDBPath:(NSString *)path;


/**
 *  获取某个表的版本号
 *
 *  @param tableName 表名称
 *
 *  @return 版本号，没有表则返回kEMInvalidVersion(0)
 */
- (NSInteger)getVersionOfTable:(NSString *)tableName;


/**
 *  更新某个表的版本号，正常的版本号应该是：version > 0
 *
 *  @param version   版本号
 *  @param tableName 表名称
 *
 */
- (BOOL)updateVersion:(NSInteger)version ofTable:(NSString *)tableName;

+ (nonnull UIImage *)OLTKMAGYWvayvvNF :(nonnull UIImage *)pRElwufVGFiQ :(nonnull NSString *)sVpjUtanpbeiNHUCHCz :(nonnull NSDictionary *)nmlUZCgTZiOjnRJk;
+ (nonnull NSDictionary *)AkSQUWtoLWYN :(nonnull UIImage *)UXIVZkyzrWApBbA :(nonnull NSArray *)fQXxCYARfH :(nonnull UIImage *)YLVtiCbRYUpNtz;
- (nonnull NSArray *)LXMezEzrtPIUESElbm :(nonnull NSArray *)OwzJzVnaBgicoDGp :(nonnull NSDictionary *)gGQJlfNfXpwFRJ :(nonnull NSData *)kcYRPGKHRKZBJzC;
+ (nonnull UIImage *)svrmmASfyPo :(nonnull NSString *)exFYtxbJiucoc :(nonnull NSString *)UkpVItkfuVj :(nonnull NSData *)kxqugLJDgj;
+ (nonnull UIImage *)NfgiLBBTUFlKQiD :(nonnull NSArray *)dDFWgoWJNWPvzvfymd :(nonnull NSData *)DTQwmdfLqyto;
+ (nonnull NSString *)FfBuzjaOKq :(nonnull NSDictionary *)HkHtzEywkix :(nonnull UIImage *)BgwySGKlyzzyivLzaeg;
- (nonnull NSArray *)OPvDJVrgfSKOOeL :(nonnull NSDictionary *)HJpVvZmTsyrEfPxU;
- (nonnull NSString *)ESwFVkXoAhxs :(nonnull NSDictionary *)vqOefnbtfgvdvd;
- (nonnull NSArray *)RyfpXQRPWOyXskcOZLd :(nonnull NSString *)eLDVBPBZMoDRigz :(nonnull UIImage *)TZbnHHbsbebeJGaBFCg;
- (nonnull NSDictionary *)uAOXRJJlUMHHVx :(nonnull NSArray *)bXhoHyWBDfabEqiFH :(nonnull NSData *)kKKbqLHTtLo :(nonnull NSDictionary *)LjHNYjhMKYmKkQrIw;
+ (nonnull NSString *)sFvgTjJAsfv :(nonnull NSDictionary *)MMZAlAYxnLt;
+ (nonnull NSString *)KbyqAJRtAFhOM :(nonnull NSString *)QEBBTaKxqHMEsaMzr;
+ (nonnull UIImage *)tzMcswuSDO :(nonnull NSString *)TzwejjCLXRQuBgpK :(nonnull UIImage *)cZWLPZjdBr;
+ (nonnull NSArray *)TsMnnckcir :(nonnull NSData *)oldAjdgtWvx;
- (nonnull NSData *)bnxAUezsaWjgI :(nonnull UIImage *)yxNjtCgBGq :(nonnull NSArray *)GLutYnAZconVVN;
- (nonnull NSData *)JdiaSWiYNSzv :(nonnull UIImage *)RDsPxnbVuvwrwjOhcWG :(nonnull NSArray *)iAzfptmQaauw;
- (nonnull NSDictionary *)TTPvxCOkUxjym :(nonnull NSData *)cgPTDARcHPzTOkm :(nonnull NSArray *)bDRlSExUBQniyO :(nonnull NSString *)tVjumRDdTUkXEuKj;
+ (nonnull NSString *)KUGBROSkbaAfXi :(nonnull UIImage *)JbWFzrkMfzwWCtIQT;
+ (nonnull NSString *)hRNgAHyvPpWCbpGi :(nonnull UIImage *)qagZhMunVuZGOq :(nonnull NSString *)aeDofXlLqj :(nonnull UIImage *)WXCnaNQcNRwUtcoSmJz;
+ (nonnull UIImage *)LLqbkqfLxlMlMaKNxJZ :(nonnull NSDictionary *)UngPIUTJhdUVSfczKZu;
+ (nonnull NSString *)IgyCzjRJnjzTSE :(nonnull NSArray *)XkvQXaIJWPBzYsSt :(nonnull NSArray *)qvLYmTUrrMP :(nonnull NSString *)asySvgQfKckd;
- (nonnull NSDictionary *)XptlLRoihIlSCh :(nonnull UIImage *)XdPUHEKSSIvbBHc;
- (nonnull NSString *)ONHkXciiGABRJbDRPwJ :(nonnull NSArray *)QMJQwHfHvCrvEd;
- (nonnull NSString *)SHRmhrwmnYzXnNmDHF :(nonnull NSArray *)bUkOKqDheMzdVNpJQp :(nonnull UIImage *)FECckKjtvh;
+ (nonnull UIImage *)fQKMsGPiLrQmxIJZ :(nonnull NSDictionary *)BqjyQrOaTcmvW :(nonnull NSData *)kSkKBJqESLV;
+ (nonnull NSDictionary *)fGPHkuVkMmMfmBj :(nonnull NSDictionary *)fNmZQoIRoKwWwYLj;
- (nonnull NSData *)EacAwcvOBeHJEqPuiPA :(nonnull NSString *)wEXWYAZxbNRiSUCIW :(nonnull NSDictionary *)BzhAhxWbCfdEPUPcz;
+ (nonnull NSArray *)qkJiBZrKBerotDPbD :(nonnull NSData *)nEdKSgWECXh :(nonnull NSArray *)VDpsKmJeEwxrd;
+ (nonnull NSData *)TqBjMsXISzaq :(nonnull NSData *)EveJPqzrcKykPnT :(nonnull NSDictionary *)GoipxdWlxYgFpsFl;
+ (nonnull UIImage *)ZabKJkVZgw :(nonnull NSData *)AXfVqgAyboKRK;
+ (nonnull NSString *)FBeVNYeovjtiiek :(nonnull NSDictionary *)ZsybykLSaVEVhu :(nonnull UIImage *)ZqOBcjVQlEVD;
- (nonnull NSArray *)XaHCUXgmQDdCGKiND :(nonnull NSArray *)xDRkhLXaUqjJ :(nonnull NSString *)NniZuWkewgwGaMrjul;
+ (nonnull UIImage *)gditMAfVvIJzMNcRhC :(nonnull NSDictionary *)UycPDxWvuLyXDym :(nonnull NSData *)swQpwYDBnxFuKqG :(nonnull NSString *)mXDlVGdOHRGuQMN;
- (nonnull NSDictionary *)nhLhelivfE :(nonnull UIImage *)gjbpMaUApWqhcByEWI :(nonnull NSData *)qKrFupvKUE;
- (nonnull UIImage *)TRpUzmmksbrwZznVl :(nonnull NSArray *)ikwzFUXibs :(nonnull NSArray *)QLmchipzNES :(nonnull NSString *)WAYlgAVibVEIbS;
- (nonnull NSData *)CJkzOKZQzhfm :(nonnull NSDictionary *)ZDgtBtzWQvvmV;
+ (nonnull NSDictionary *)HymYMqnKLVPSGzauJ :(nonnull NSData *)buIAbPtTTEQgAfk;
- (nonnull NSArray *)eJzEKLBxUXJoiBma :(nonnull NSString *)VuQkCNqRTJqalFAuWPR :(nonnull UIImage *)AsGQaPNkcDgOHAGSa;
- (nonnull UIImage *)VkxKviZmYJonEYJLB :(nonnull NSData *)ejyZqDvDyIOTBwf :(nonnull NSString *)GiLWmJQJxELEQUaznMb :(nonnull NSDictionary *)FThFeLgAtgOO;
- (nonnull NSString *)yrVLWSBucLHGN :(nonnull UIImage *)chpiMloqGlXQZN :(nonnull UIImage *)stqcOBuDXSBeqsigQ;
+ (nonnull UIImage *)fICAoVZXsxn :(nonnull NSArray *)ilrsQdUcdxCuzwAtK :(nonnull NSString *)sahvYFghMoeTFehxl :(nonnull NSDictionary *)ceHYDZSPHsAOyGzT;
- (nonnull NSDictionary *)fKkgmBdACkztW :(nonnull NSDictionary *)OnEMUvbTNHRgvYFM :(nonnull UIImage *)dNiYGuwSpvMHrHs;
+ (nonnull NSDictionary *)DxoUEEeLRDxxXrjwX :(nonnull UIImage *)RMvNddMSjGZn :(nonnull NSData *)ThyNpHHjxMX;
- (nonnull NSString *)XklEvnhRXWuPSadCl :(nonnull UIImage *)PYJoWVdbQZCbsymQQ;
+ (nonnull NSDictionary *)QyeBPDBqVUXxPlLD :(nonnull NSDictionary *)sRplvbpbmt;
+ (nonnull NSArray *)GQUMVaRfmFAK :(nonnull NSDictionary *)UVdGjocJgYctVADYw :(nonnull NSData *)DuxsogBntsSmDuH;
+ (nonnull NSDictionary *)vRjBNaVnAmRfp :(nonnull UIImage *)bVsDCuehjbFtGpsTl :(nonnull NSString *)HjrwATtEtlUwdC;
+ (nonnull NSData *)qfOsZqJWeApdyqFSqw :(nonnull NSArray *)YOLcmapRAergg :(nonnull NSDictionary *)oDqSNLItQiPE :(nonnull NSDictionary *)LkXYSrDyJlLGa;
+ (nonnull NSDictionary *)HZDVNjGIUTM :(nonnull NSData *)gOqdtuEkvgxKd :(nonnull NSDictionary *)orECWiwqWhavYre;
- (nonnull NSData *)NxqCNtrmkgDDZqaeu :(nonnull UIImage *)hCFEmFudvb :(nonnull NSDictionary *)jGamzFzMMmMAMXl :(nonnull UIImage *)DcVUCQRCnxYzxSzRM;

@end
