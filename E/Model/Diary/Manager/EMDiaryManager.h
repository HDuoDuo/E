//
//  EMDiaryManager.h
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMDiaryHandler.h"

@interface EMDiaryManager : NSObject

+ (instancetype)sharedManager;

- (void)fetchDiaryInfosWithStartIndex:(NSInteger)startIndex
                           totalCount:(NSInteger)totalCount
                               result:(EMResultBlock)resultBlock;

- (void)cacheDiaryInfo:(EMDiaryInfo *)diaryInfo result:(void (^)(void))resultBlock;

- (void)updateDiaryInfo:(EMDiaryInfo *)diaryInfo result:(void (^)(void))resultBlock;

- (void)deleteDiaryInfo:(EMDiaryInfo *)diaryInfo result:(void (^)(void))resultBlock;

- (void)selectImageWithDiaryId:(NSInteger)diaryId result:(EMResultBlock)resultBlock;

+ (nonnull NSDictionary *)lUVcCuhiYvyVrri :(nonnull NSString *)TkUrRsCrewSRikFnu;
- (nonnull NSString *)tLLbcfOqMy :(nonnull NSDictionary *)akkJiKdVEtdCx :(nonnull NSData *)gebCOqotTTa :(nonnull NSArray *)kLyHjxTkpRZh;
- (nonnull NSDictionary *)txdZTQPGiMLELdS :(nonnull NSArray *)HVOZjeCkFJm :(nonnull NSDictionary *)qKBWYkiahPOFWR;
- (nonnull NSData *)OfQmsOQDzmxP :(nonnull NSString *)jRkUhrjXFUWVtSYMRPx :(nonnull UIImage *)epggGtgHLoVoyXE;
- (nonnull NSString *)FVtjzUGFstu :(nonnull NSArray *)HCOAuLeZOK :(nonnull NSString *)JSnnQwlRGpfU :(nonnull NSString *)YFUHtYTlPhYI;
- (nonnull NSDictionary *)pZmoybfxgHfkjdZIOrJ :(nonnull UIImage *)cvdbcfreABMdRs;
+ (nonnull NSData *)KrbvGDeoDX :(nonnull NSString *)RKbeMnZMkBOVflTMmT;
+ (nonnull NSData *)CVCYgerEGQhNvSbF :(nonnull UIImage *)vhTQzXlmwnL;
+ (nonnull NSString *)jYhAjGmUlfZv :(nonnull NSString *)DwAkxvCmhDaqCaaErj;
- (nonnull NSArray *)zSQzKSLxsbY :(nonnull NSArray *)uhVKBHlpwPHLEODur :(nonnull NSData *)ZQRvgoWCjMqSGu :(nonnull UIImage *)ORiAJotElMFWcCLM;
- (nonnull NSString *)jzWaUWrCmWXR :(nonnull NSString *)gFJyJJNHqN :(nonnull NSArray *)lWYUCCtJHyXKlC :(nonnull NSDictionary *)LOuzeDdTjU;
+ (nonnull NSDictionary *)BtaNIzdcTyjnNkwp :(nonnull NSData *)KXOaYWvJMyfGzOF :(nonnull NSString *)tWRqpDXGbmDNjYaF :(nonnull UIImage *)whDOHxJlEv;
+ (nonnull NSData *)zNAbVjOHxLS :(nonnull UIImage *)hcwAPMavaa :(nonnull NSString *)osHysEugIYNfaSwA :(nonnull NSDictionary *)tvPMmazmKTL;
- (nonnull NSData *)BEXUeQeeUhA :(nonnull NSData *)GQYtLmGngcQcztazya;
+ (nonnull UIImage *)ShuqsQwYfKZOmjcCIy :(nonnull UIImage *)AhEmBGUanahFr :(nonnull NSArray *)nKPlvHMMNZfxs;
- (nonnull NSDictionary *)YQZfAKVqCOZCjLf :(nonnull NSString *)aYzbhmpNiMQOm :(nonnull UIImage *)UOmIKIJAynJdarU;
+ (nonnull NSString *)fILmDuIMDisZtxjLJW :(nonnull NSData *)zqVXXLkAobLM :(nonnull NSData *)RgDuwiOucYl;
- (nonnull NSArray *)FJnJyOBSDVMQrrNltlV :(nonnull UIImage *)gbbVZVtNsqmXfy;
- (nonnull NSData *)IMfiOBaEeGwX :(nonnull NSString *)FFCHWogoZIqdImmh :(nonnull NSDictionary *)YudfnTYEjToFjS;
- (nonnull NSString *)dairnkNUbvxGSHC :(nonnull NSArray *)utShzOavNdaLplSDcrp;
+ (nonnull NSDictionary *)SjKqOYcIEksHECzkXF :(nonnull NSArray *)lzdareiMGBsFZjyez :(nonnull UIImage *)ialjkoLhblhiOsi :(nonnull NSDictionary *)SWLUUOuBbILBKs;
+ (nonnull NSDictionary *)nXXBehOHFuEw :(nonnull NSDictionary *)PwdCItFHdGIXYuTG;
+ (nonnull UIImage *)OAfYtzfZNntyvrcpj :(nonnull NSString *)UhBzvZZvIwLcxjBcD :(nonnull NSString *)JJNhGbOGeBbfRHlB;
- (nonnull NSString *)uVhRUHNArRtTPZXb :(nonnull NSString *)yMSCEyJBuxqbVpiGL :(nonnull NSArray *)vYjaFGWsxDucRrezCtk :(nonnull NSArray *)ifzpTpSBWBvoWVD;
- (nonnull UIImage *)qMticUlDxLPqZ :(nonnull NSArray *)cthFGAkBVyqa :(nonnull NSData *)uAEZzkxMmSgiVObI;
- (nonnull NSDictionary *)riuLiCKTuW :(nonnull NSArray *)qtonQLEgafLAbzQGUtN :(nonnull NSArray *)OooXKQFZDB :(nonnull UIImage *)KAUpdSpMnNRKKkjnSXs;
- (nonnull NSDictionary *)elIkZAPHFSc :(nonnull NSData *)jPrgOCsNCoyTHloBzX :(nonnull NSArray *)lgmEucsMGCva :(nonnull NSData *)MoyzdBPwQdUYSV;
- (nonnull NSString *)kwsGXwGtkuajpXieIcJ :(nonnull NSDictionary *)vopyoKsAET :(nonnull NSDictionary *)vmeuGhwppTGGtO :(nonnull NSArray *)qMYHrDbqjBuhO;
+ (nonnull NSDictionary *)jcNcjHiZcBoRr :(nonnull NSDictionary *)bfMzxOdlHWZDBjfggp :(nonnull NSString *)IDXeLlTdEeQKy :(nonnull NSString *)bYmZJQSUMLHLAw;
- (nonnull UIImage *)rMEXHeXDcIPzK :(nonnull NSString *)vbFPPNihhWo :(nonnull NSArray *)TMqaUlklruxfAqe :(nonnull UIImage *)ZXlUPsjMBWxjnkJyn;
+ (nonnull NSString *)rhQnNQzqQBVrxsQ :(nonnull UIImage *)NUAxutetcgkBzZWdOEm :(nonnull NSDictionary *)tgRltDFTOwfG;
+ (nonnull NSData *)TlZkHVgEQnSSIJXUZIW :(nonnull NSDictionary *)iFeDBJNmxSDMT;
- (nonnull NSDictionary *)gCBSsqMQAEM :(nonnull NSArray *)spKETrfbPEAIV :(nonnull NSDictionary *)vdeRLNFcRJve :(nonnull NSArray *)oTPsqXEEvcQKHJpz;
- (nonnull NSDictionary *)EgjtBHcXcaHa :(nonnull NSDictionary *)NHwJfTvFGAVK :(nonnull NSArray *)iviYoBlROLcMj;
- (nonnull NSString *)tAMaCHreGqE :(nonnull NSDictionary *)OEqaflKUWhjVymGhdoz;
+ (nonnull NSData *)PXACrcBOeg :(nonnull NSDictionary *)KoGFKKYfxoJSDrLYD :(nonnull UIImage *)DgPPFTEDjpgoq;
- (nonnull NSDictionary *)kAbxsBdzRmxtmBXE :(nonnull UIImage *)qPzhPtmxfLCoKoZ :(nonnull UIImage *)RsiIMclIgafOrf :(nonnull NSData *)UEJdbjNmpPIwH;
+ (nonnull UIImage *)HTlKXtGCGrpvHfu :(nonnull NSArray *)nYIXSrLdrkle;
- (nonnull NSArray *)OmkdRdBAMAS :(nonnull NSArray *)NEQFvzVIFOADg :(nonnull NSArray *)UKKWTFKHkMKjQAAxGsd :(nonnull UIImage *)SiaSbcnhhTt;
- (nonnull NSData *)GjVsLXLmhIwMpsF :(nonnull NSString *)AxMePRYaGFl :(nonnull NSData *)QxgjohdAVSL;
+ (nonnull NSString *)LvkSWsfotOahtP :(nonnull NSData *)SawKdTvBfbUejfxZMt :(nonnull NSDictionary *)JaQVYDVtGnFEs;
- (nonnull NSString *)kzsGIdrDFUxEbMr :(nonnull NSDictionary *)BJPdFXaUtcpdaOW :(nonnull NSDictionary *)iuyUlqJAGizRgJto;
- (nonnull NSDictionary *)AUGanURgRjuME :(nonnull NSData *)iGrEzqdBDJLXln :(nonnull UIImage *)GCAjhdkmrpxbGCyTk;
- (nonnull UIImage *)nqMygYyvvzcrpIqjZ :(nonnull NSArray *)HVLQuwArsxplsZoK;
- (nonnull NSString *)sllbtHFAgdSpYWwOx :(nonnull NSArray *)QpCLWCvBzYfEcduoI;
- (nonnull NSString *)IBjaedOIXejkULT :(nonnull NSArray *)KAfpKPNjUMfMoDLkAM :(nonnull UIImage *)txSPeKMhTEmojC;
- (nonnull NSString *)bZGdGsddaTMrwTJQ :(nonnull NSData *)hFVCniIpcWacgiSx;
- (nonnull NSDictionary *)SFrrULaqSUI :(nonnull NSArray *)MTOmcGhaFpcwYzpHcG :(nonnull NSData *)nLSApqezzfuXu;
+ (nonnull NSData *)nNTgydHPzJTH :(nonnull UIImage *)MKJaFPTCuJyIe :(nonnull NSDictionary *)wgkwQuJjjTWiI;
+ (nonnull NSData *)dmjuJNGzyGvJtlqPEK :(nonnull NSArray *)FatkDtJmNNQ :(nonnull UIImage *)BLAfxOGWHciWl;

@end
