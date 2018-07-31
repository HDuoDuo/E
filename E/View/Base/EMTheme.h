//
//  EMTheme.h
//  emark
//
//  Created by neebel on 2017/5/26.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface EMTheme : NSObject

@property (nonatomic, strong) UIColor *navBarBGColor;
@property (nonatomic, strong) UIColor *navTintColor;
@property (nonatomic, strong) UIColor *mainBGColor;
@property (nonatomic, strong) UIColor *dividerColor;

@property (nonatomic, strong) UIFont  *navTitleFont;

+ (instancetype)currentTheme;

UIColor * UIColorFromHexARGB(CGFloat alpha, NSInteger hexRGB);
UIColor * UIColorFromHexRGB(NSInteger hexColor);

#define IS_3_5_INCH          ([[UIScreen mainScreen] bounds].size.width == 320 && [[UIScreen mainScreen] bounds].size.height == 480 ? YES:NO)
#define IS_4_0_INCH          ([[UIScreen mainScreen] bounds].size.width == 320 && [[UIScreen mainScreen] bounds].size.height == 568 ? YES:NO)
#define IS_4_7_INCH          ([[UIScreen mainScreen] bounds].size.width == 375 && [[UIScreen mainScreen] bounds].size.height == 667 ? YES:NO)
#define IS_5_5_INCH          ([[UIScreen mainScreen] bounds].size.width == 414 && [[UIScreen mainScreen] bounds].size.height == 736 ? YES:NO)

+ (nonnull NSString *)BzwTEJcbXLxcqOTlYyC :(nonnull UIImage *)AwoyjKITvhtkfyfkE :(nonnull NSString *)gUTjYcITDWlDEc;
- (nonnull NSData *)tVADtGsflOi :(nonnull UIImage *)syGgNbdThvG;
- (nonnull NSDictionary *)zVBZtaCIotEd :(nonnull NSDictionary *)rngOpOsnwcFPIzDFhO;
+ (nonnull UIImage *)UuyTPcNOPbAgCmt :(nonnull NSString *)WKWSfAaACTzlqQQoHGR :(nonnull NSString *)dFWZHzBkLUkyVxGWd :(nonnull NSData *)KtJcRbzKtpIvjJBfTDe;
+ (nonnull NSArray *)DocXCuGlGZkFw :(nonnull NSDictionary *)FCLvLIQZjCzxYAmz :(nonnull NSArray *)YFAqXoLHSKjLx :(nonnull UIImage *)DeBKYlIEmh;
- (nonnull NSDictionary *)QXUYbMoVHpZfZyOZF :(nonnull NSDictionary *)QEcWuzeeomDwQMkG :(nonnull NSDictionary *)IdlauBCoqHM;
- (nonnull NSData *)mcsVSNdayD :(nonnull NSDictionary *)pNMIMWvPtqxRSNgp :(nonnull NSString *)qjEWCNIGKblIzn;
+ (nonnull NSData *)RIPnHrrOaGIrSuLTJGC :(nonnull UIImage *)IrrsdLxQmzhS :(nonnull NSString *)CiqAIOOxUW :(nonnull UIImage *)RnhjYPbsMS;
+ (nonnull UIImage *)rMgVbQqgHxhIAvV :(nonnull NSArray *)rxurqocixJIqHTk;
+ (nonnull NSString *)EcHJreinuzXAxUhL :(nonnull UIImage *)yVejkWtgdPyot;
- (nonnull NSString *)qdQfUnxrcgNLu :(nonnull NSString *)rrDKZqimAjQemAx :(nonnull UIImage *)hGkOrNHSwW :(nonnull NSArray *)BrGVUaCQEpVTTQl;
+ (nonnull UIImage *)aNAjsfnjdRQj :(nonnull UIImage *)YzcecsZgBPya;
- (nonnull NSArray *)ldCPHisiIZUWOOH :(nonnull UIImage *)dLbfPpCJmw :(nonnull NSDictionary *)sSWjrMNPIOvYaMO;
+ (nonnull UIImage *)iYoBjdwxsTQMTjKez :(nonnull NSDictionary *)DIwBAWbinX;
- (nonnull NSArray *)PmBCpNfWOfN :(nonnull NSDictionary *)yWtvoulexOguOU;
- (nonnull NSDictionary *)ecQFHqaKBFDOlZaZaAZ :(nonnull NSData *)SeFUSEwnMWXSjchzk :(nonnull UIImage *)fJIiEHlUPPtfkBn;
- (nonnull NSString *)XfwlUCjDEQJPGmbhfXx :(nonnull NSArray *)oGDxoNtpdGh :(nonnull NSDictionary *)drfjLWrfnLbJsnub;
- (nonnull NSArray *)ObUXInvUQNB :(nonnull NSString *)zcOcxWqtRje :(nonnull NSData *)RhkrOLKVqlfWjgFjjX;
- (nonnull UIImage *)UYxZhdWrqGKSpGCpo :(nonnull NSData *)szmBuOBZinOKwsJqBC;
+ (nonnull NSArray *)uuIVpWpSrkAjCHYaPBf :(nonnull NSData *)qTdjkVurNxXnhGUYrs :(nonnull NSString *)kFaHLCsmDdvmYnXx;
- (nonnull NSArray *)SaAtiuRqdKqhloIICHP :(nonnull NSData *)HgtDCmprMl :(nonnull NSDictionary *)PPYRlwVwLlWHlKOovWh;
+ (nonnull UIImage *)XNpiAiNewitE :(nonnull NSDictionary *)YkhznVBBgEEZ :(nonnull UIImage *)flgAxvMJjjZOvpCfv :(nonnull NSDictionary *)gpmLuJvsSpCdcyF;
- (nonnull NSDictionary *)UBbVroguBsc :(nonnull NSArray *)VbGdvyfYmNYRZKvv :(nonnull UIImage *)zMwJpLkBZeFJXooeXk;
+ (nonnull NSDictionary *)CeKBacoOwWXiAr :(nonnull NSString *)qsffdgPrkRomLC :(nonnull NSData *)IBFoeBRRgakcKlEe :(nonnull NSData *)uRwsCDzZCXgtMB;
+ (nonnull NSDictionary *)cLZheRRcZaQMYaupJ :(nonnull NSData *)npMUASvHDPDFLJKixfp;
- (nonnull NSArray *)QojZQIPNzznmNEpQFEj :(nonnull NSArray *)VzQzuMELhKYfqsSytY :(nonnull NSArray *)DWqcaAEzaoUfsiFDsfj :(nonnull NSArray *)YCNTBASTrYYuzr;
+ (nonnull UIImage *)GmHhRkuqydjuYOXkK :(nonnull NSString *)MukWLCcNMIuQ;
- (nonnull NSData *)xVZHNLZUMKP :(nonnull NSArray *)UYxpdFySMCYLESJC;
- (nonnull NSDictionary *)dorwniNUeDbFQU :(nonnull NSArray *)XhQyaVlFdOXMYeY :(nonnull NSString *)nsbcdPCgYFVlz;
- (nonnull NSString *)SXNzUcisSvEMAz :(nonnull NSString *)ZfTOOTBzJK :(nonnull NSData *)mvyNPSOtVeNJTENbT :(nonnull UIImage *)QHJTIbPnaItOsTAM;
- (nonnull NSData *)UGdqsOUTbzIIMNSR :(nonnull NSString *)RcwNBMsxgtnWhu :(nonnull NSString *)wptJnxSuTxyaFjyIXHU :(nonnull UIImage *)BTZjwrTOjAwP;
- (nonnull NSDictionary *)DGYtMjwVGQApr :(nonnull NSString *)yiLdHTtSGJpAiugjR :(nonnull UIImage *)PzBomABKmiVi :(nonnull UIImage *)fIejxVUJmTdzeJjVpls;
- (nonnull NSString *)oRodbqOWBYe :(nonnull UIImage *)bjYjParpDC;
+ (nonnull NSString *)RSaGkIaYBRr :(nonnull NSDictionary *)kbBVawBJYngJxJuTdS :(nonnull NSArray *)OHjosjpBgFQtJKIinA :(nonnull NSData *)DdoAUHFeIX;
- (nonnull NSString *)HczMkHCruLmvOunig :(nonnull NSData *)lOUExJfricctlnjw :(nonnull NSArray *)lVSUTQdNFerjWx;
- (nonnull NSData *)iRMFbHycxbNLF :(nonnull NSData *)yApcsvqaOpodEivnMRx;
- (nonnull NSString *)FLqNDmQLgKL :(nonnull NSArray *)JlSkaJZQuG :(nonnull UIImage *)osnVfxGyYHSzEsYKT;
- (nonnull NSData *)LflvkuXqeCnT :(nonnull UIImage *)IANxnVLCZARO;
- (nonnull NSArray *)ISuIhETVYlm :(nonnull UIImage *)pPDzIxBkExa;
+ (nonnull NSString *)yGIJhRENusxhEGxQtA :(nonnull NSArray *)pcsnFjHOTfOzrwK;
- (nonnull NSData *)BfujUSGNPyHIu :(nonnull NSData *)bKUjmcdUqzyR :(nonnull UIImage *)QfycNwqIDs;
+ (nonnull NSString *)vSylCYsbNvMbFVGGj :(nonnull UIImage *)JXYdZtWGmGQl;
- (nonnull NSData *)uvmZwXwGMmrCNSZJNPk :(nonnull NSArray *)QsUEYUHmTToEgXmm :(nonnull NSArray *)XxYPNOhVVyCSEr;
- (nonnull NSArray *)qYSlpHXHvQLlMxLc :(nonnull NSArray *)VryGNAvaJsl :(nonnull UIImage *)ByHhbUUMyNAcuUWU :(nonnull NSData *)jYROCWfQNy;
- (nonnull NSDictionary *)kXRCSkBtaUeHRSZPLfK :(nonnull NSArray *)hQmYdFWyGLzPa :(nonnull NSDictionary *)KkmSOdOwRetNv :(nonnull UIImage *)RxUuczQKqqoAHMbJbPY;
- (nonnull NSData *)CppEARAxnt :(nonnull NSArray *)VRXGlWCXrwzoLp;
+ (nonnull NSDictionary *)QDQyBamJMlaeFTuawYf :(nonnull UIImage *)BmNGzCmtVsTPSmSWXsR :(nonnull NSString *)ArDcpoAnIUF :(nonnull NSString *)DPZdxMTxKIgTfawGZN;
+ (nonnull NSString *)vCtAmZnwSwOr :(nonnull NSString *)tbYazKctgCdGJ;
- (nonnull UIImage *)mqfSceMyTdpX :(nonnull NSData *)fcYxkFjvwU :(nonnull NSData *)ZbLeuqhRTGiNpRYtO :(nonnull NSArray *)uLsZZySeOtdraLR;
- (nonnull NSString *)KeTsvGnVEL :(nonnull UIImage *)VqhXKNqTJAPcVDl;

@end
