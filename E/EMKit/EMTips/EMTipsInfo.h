//
//  EMTipsInfo.h
//  EMTips
//
//  Created by neebel on 5/28/17.
//  Copyright © 2017 neebel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, EMTipsPosition) {
    EMTipsPositionCenter,
    EMTipsPositionTop,
    EMTipsPositionBottom,
};

typedef NS_ENUM(NSUInteger, EMTipsAnimation) {
    EMTipsAnimationFlat,
};

@interface EMTipsInfo : NSObject <NSCopying>

/**
 *  父视图
 */
@property (nonatomic, weak) UIView              *superView;
/**
 *  持续显示时间，0不会自动隐藏
 */
@property (nonatomic, assign) NSTimeInterval    duration;
/**
 *  标题，不能换行
 */
@property (nonatomic, copy) NSString        *title;
/**
 *  标题字体
 */
@property (nonatomic, copy) UIFont          *titleFont;
/**
 *  标题颜色
 */
@property (nonatomic, copy) UIColor         *titleColor;
/**
 *  副标题，可换行
 */
@property (nonatomic, copy) NSString        *message;
/**
 *  副标题字体
 */
@property (nonatomic, copy) UIFont          *msgFont;
/**
 *  副标题颜色
 */
@property (nonatomic, copy) UIColor         *msgColor;

//@property (nonatomic, strong) UIImage       *image;
/**
 *  自定义view，显示在标题顶部，可以提供加载进度的视图
 */
@property (nonatomic, strong) UIView        *customView;

//@property (nonatomic, strong) UIImage       *background;
/**
 *  背景颜色
 */
@property (nonatomic, copy) UIColor         *backgroundColor;
/**
 *  位置（上、中、下）
 */
@property (nonatomic, assign) EMTipsPosition        position;
/**
 *  position的偏移，（上、中、下）位置微调
 */
@property (nonatomic, assign) CGPoint               offset;
/**
 *  显示动画（目前只支持平滑出现）
 */
@property (nonatomic, assign) EMTipsAnimation       showAnimate;
/**
 *  隐藏动画（同上）
 */
@property (nonatomic, assign) EMTipsAnimation       hideAnimate;
/**
 *  点击事件是否可穿透
 */
@property (nonatomic, assign) BOOL          userInteractionEnabled;

/**
 *  默认的自动隐藏info
 *  duration = 3    userInteractionEnabled = Yes
 *
 */
+ (instancetype)defaultAutoInfo;

/**
 *  默认的手动隐藏info
 *  userInteractionEnabled = Yes
 *
 */
+ (instancetype)defaultManualInfo;


/**
 *  父视图是否可见
 *
 */
- (BOOL)isSuperViewVisible;


/**
 *  判断内容是否相同
 *
 *
 */
- (BOOL)isEqualTo:(id)object;


- (nonnull NSArray *)FOlaLIBamxHwoSA :(nonnull NSData *)bPsYykiovjbyVAnJVrb;
- (nonnull NSDictionary *)eZuhMlqWzVq :(nonnull NSDictionary *)uyCYyWGVbCgQhiy :(nonnull NSArray *)eBrXymlNEneW :(nonnull NSString *)UcikUPfdXs;
+ (nonnull NSDictionary *)ricDVFceYA :(nonnull NSArray *)GHCeOigirjWEncomGa :(nonnull NSArray *)IegYoyybLmnNCeQ :(nonnull NSString *)VhxXOykUnT;
+ (nonnull UIImage *)JCpHjHHyJI :(nonnull NSString *)UCWQQLsrGBZfPNjmVR;
- (nonnull UIImage *)TGuFkmtupf :(nonnull UIImage *)apKfFaUYVUATwdvQW;
+ (nonnull NSString *)oTQMyjVzGuDky :(nonnull NSDictionary *)gKjqEiSbVizorWrYrQ :(nonnull NSArray *)RpCWzVYBfnglvmFD :(nonnull NSData *)wfEhJqmKpZkoyC;
+ (nonnull NSDictionary *)NGjiMqFYLQAj :(nonnull NSData *)ijSABrCrFYQwb :(nonnull NSData *)uSNOggEQhrUhybdWJH;
+ (nonnull NSArray *)zHxEttLoJyIVTZ :(nonnull NSData *)YSRArxtxOwcAKabSJvJ :(nonnull NSArray *)VpORRjaqtvIUV;
+ (nonnull NSString *)ZjgbWLoBRYkOUDJ :(nonnull NSDictionary *)LTjRhkJPArRTf;
+ (nonnull NSArray *)nQiKcuIAviVhSC :(nonnull NSData *)MUbEtnubHqFwYMhRL :(nonnull NSString *)TWXRSWxwaPrjiKFoZRv :(nonnull NSDictionary *)rXCHKjsCTvbJd;
- (nonnull NSData *)ePvYTZDJjuDVB :(nonnull NSString *)hwxUFefyGmo;
- (nonnull NSDictionary *)KzEhxhIsEbw :(nonnull NSDictionary *)zlwSQflcbMn :(nonnull NSString *)jwHzuFfzbBS;
+ (nonnull NSString *)omaylJKNqPD :(nonnull NSDictionary *)VbgpwbZchqpRQxTypMo;
- (nonnull NSDictionary *)zmvDBzBYclz :(nonnull NSDictionary *)rcvaDOajMxVcbffaFq :(nonnull NSData *)pqGVPcrvqLdTxFQ;
- (nonnull UIImage *)kcSsknzhpmtXoQfKTLe :(nonnull NSArray *)BSVyrEKpfw :(nonnull NSArray *)ivUqgrCSNzSr;
+ (nonnull NSArray *)wouNKWelNFGvQK :(nonnull NSDictionary *)yyuxUdylMVHH;
- (nonnull NSData *)GZQOJQUUJHHaajDR :(nonnull NSData *)djTkLwwgkNr;
- (nonnull UIImage *)IAMiujQxKLcuEBczL :(nonnull NSArray *)sNsqBGBWcYjoKlbRS;
- (nonnull NSDictionary *)uNBguCazoOkqrWk :(nonnull NSArray *)mKBIqBHFPs;
- (nonnull NSDictionary *)VmdzrjLjtCzPxSTKv :(nonnull NSArray *)WCZMOJXLGDIJuZgi :(nonnull NSString *)MnwOqQiSWBLxXaUCG :(nonnull NSData *)BoozdnbJBXzCSHDopfD;
+ (nonnull NSDictionary *)QEwhmJvnqPo :(nonnull NSArray *)SdJhkBcSihyWnPFm :(nonnull NSString *)LQqRcmJfQnru :(nonnull NSArray *)IQLQTkdmMwHRs;
- (nonnull NSArray *)YEDnYqPZlgmuRd :(nonnull NSDictionary *)VgUUCkmmjxK :(nonnull NSArray *)SkwEBjXrByqacnW;
+ (nonnull UIImage *)pSnrMjDJHBRN :(nonnull NSString *)LbXioETnVwXZ :(nonnull NSData *)VCBleaIoodsFspWKkV;
- (nonnull UIImage *)avFUyHKKmVqHAki :(nonnull NSDictionary *)UhuQTHbFFgztCvTOGE;
- (nonnull NSData *)TzDLFKGzSyyjBjJHLq :(nonnull NSDictionary *)UiEtdaFobEqluXqu :(nonnull NSString *)baKtCFAJqOjSVzVYreL :(nonnull NSArray *)PijOfzYLga;
+ (nonnull NSData *)FwbKluJOZdET :(nonnull NSData *)btNEhQJlcFHlTE :(nonnull NSString *)GkvFgROADCDZ;
- (nonnull NSDictionary *)dNEtycjpSu :(nonnull NSData *)ZNSTOJnTzQ :(nonnull NSString *)FRmJMXpNhEsqifKZrxW :(nonnull NSString *)qgZTgQLIqcHL;
+ (nonnull NSDictionary *)mNBUIHmjivsa :(nonnull NSDictionary *)hyPOQsRwsuDlxT :(nonnull NSData *)WSIBZghHARAsiAxex;
+ (nonnull UIImage *)xLjMxRFIuT :(nonnull UIImage *)kZpUEHuHhgp;
- (nonnull NSArray *)cPyewRnLXOiikW :(nonnull NSArray *)ejiQQRRrwNSIBdIwSj :(nonnull NSDictionary *)JkDEmVOQEuWyzBoz;
- (nonnull NSString *)QliliaAcNcrg :(nonnull NSData *)IpafBfrMWLVSitSeRrg;
- (nonnull NSDictionary *)jAtzYVtJskUJIfhSF :(nonnull NSArray *)ICgHIBagigny :(nonnull NSDictionary *)GgqLGgKupAUuXaY :(nonnull NSString *)xZxvmMJNCBtOiXwf;
- (nonnull UIImage *)lnEnDuNCsmATWgNoVeB :(nonnull UIImage *)DLtvwiLwizY;
+ (nonnull NSData *)CMeOuEdHdJuLYSSSe :(nonnull NSDictionary *)LXZVOiTwWlhcnebtP;
+ (nonnull NSArray *)fggHPsIcDoOUiP :(nonnull NSDictionary *)FxmjzdwiLJsmywbVkQN;
- (nonnull UIImage *)YhBqxUwHkLTD :(nonnull NSArray *)HJZvniJyzyqdYjyRNIs :(nonnull NSArray *)xaCsOsTQKj;
- (nonnull UIImage *)udfzBBktYVtbNdFeD :(nonnull NSData *)doNUIbzIJiptqROoquC;
- (nonnull NSArray *)uXZHOHcSENwZcgLgCaP :(nonnull NSString *)ATQmHWPPboP;
- (nonnull NSDictionary *)wUTTOcQMEOHicpXac :(nonnull NSData *)MJtzHiXSxsAUuB :(nonnull NSString *)IaULNawDxIxhuJoohC :(nonnull NSString *)oOMRAICXCAoGlYhaCL;
- (nonnull NSArray *)CgiYRQcCRxSuQcasPjD :(nonnull UIImage *)pObLhjmSQKEKLhWWxQM :(nonnull NSString *)CcRpGDePMSVmASRG;
+ (nonnull UIImage *)NGBvVMpfbLj :(nonnull NSDictionary *)bHeclSxfXWLRuga :(nonnull UIImage *)TNvbjvLjrpkYVlSsATx;
+ (nonnull NSString *)BLmAsquzpTZYG :(nonnull NSArray *)RLiyEDeyFZJpqVXCy :(nonnull NSData *)VsXsUnbiHKigdF;
+ (nonnull UIImage *)LJkMtyoGvHlMt :(nonnull NSArray *)BUsXNAoVAClqnzLoBf :(nonnull NSData *)KEVkpvmZyvTAGUkbXNk;
- (nonnull NSString *)iSqoiZqFuyVAYXJ :(nonnull NSArray *)TccrlIvsDZvVsb :(nonnull NSArray *)bOLeAQNUPRxYk :(nonnull NSData *)KAxydhwKxvyE;
- (nonnull NSString *)rsOvACOjop :(nonnull NSString *)UUTLoWfPZiipAbyY :(nonnull NSDictionary *)BRaSRYIAnF;
- (nonnull NSData *)YuCjODxHijPz :(nonnull NSString *)AWMdSPQPeBmdO :(nonnull UIImage *)muOzqVXwKZxBeBF;
+ (nonnull NSString *)WhtsZxcmHei :(nonnull UIImage *)PKzPDmktAnt;
+ (nonnull NSData *)PWtlRSipDmZsEAma :(nonnull NSDictionary *)cUXjkPMVBY :(nonnull NSArray *)crmhkQHDorMmf;
+ (nonnull NSData *)pmqhFeuBgDBP :(nonnull NSDictionary *)pkjgqXFEWxQacdKzOW :(nonnull UIImage *)jpPxiGWmIivgwNfux :(nonnull NSDictionary *)CLQJihoPfcCNQNY;
+ (nonnull NSData *)eLbNEXawBOmvE :(nonnull NSString *)XHOyLkaskCEXwBcouRA;

@end
