//
//  EMTips.h
//  EMTips
//
//  Created by neebel on 5/28/17.
//  Copyright © 2017 neebel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMTipsView.h"
#import "EMTipsInfo.h"


@interface LHTips : NSObject

@property (nonatomic, strong, readonly) EMTipsView        *autoTipsView;
@property (nonatomic, strong, readonly) EMTipsView        *manualTipsView;


#pragma mark - Basic Methods

/**
 *  singleton
 *
 */
+ (instancetype)sharedTips;

/**
 *  根据info显示tips
 *
 *  @param tips  info
 *  @param block 消失后的逻辑，只对自动隐藏的tips有效
 */
//CR: 不是dispatch，complete的block就直接用(^())就可以了。
+ (void)showTips:(EMTipsInfo *)tips complete:(void(^)(void))block;





/**
 *  隐藏 manual tips
 */
+ (void)hideTips;



#pragma mark - Convenient Show Methods

/**
 *  显示并自动隐藏可换行文字的tips
 */
+ (void)show:(NSString *)text;


/**
 *  根据配置显示tips，相对灵活
 *
 *  @param message   文字
 *  @param container 父视图
 *  @param duration  显示时间，<= 0表示不自动隐藏
 */
+ (void)showMessage:(NSString *)message
             inView:(UIView *)container
           duration:(NSTimeInterval)duration;


/**
 *  根据配置显示tips，相对灵活
 *
 *  @param message   文字
 *  @param container 父视图
 *  @param duration  显示时间，<= 0表示不自动隐藏
 *  @param enable    是否可穿透
 */
+ (void)showMessage:(NSString *)message
             inView:(UIView *)container
           duration:(NSTimeInterval)duration
        interaction:(BOOL)enable;


/**
 *  根据配置显示tips，相对灵活
 *
 *  @param message   文字
 *  @param container 父视图
 *  @param duration  显示时间，<= 0表示不自动隐藏
 *  @param enable    是否可穿透
 *  @param block     消失后的逻辑，只对duration > 0有效
 */
+ (void)showMessage:(NSString *)message
             inView:(UIView *)container
           duration:(NSTimeInterval)duration
        interaction:(BOOL)enable
           complete:(void(^)(void))block;

/**
 *  根据配置显示tips，相对灵活
 *
 *  @param message   文字
 *  @param container 父视图
 *  @param duration  显示时间，<= 0表示不自动隐藏
 *  @param block     消失后的逻辑，只对duration > 0有效
 */
+ (void)showTitle:(NSString *)title
          message:(NSString *)message
           inView:(UIView *)container
         duration:(NSTimeInterval)duration
         complete:(void(^)(void))block;


/**
 *  根据配置显示tips，相对灵活
 *
 *  @param message   文字
 *  @param image     图片
 *  @param container 父视图
 *  @param duration  显示时间，<= 0表示不自动隐藏
 *  @param enable    是否可穿透
 *  @param block     消失后的逻辑，只对duration > 0有效
 */
+ (void)showMessage:(NSString *)message
              image:(UIImage *)image
             inView:(UIView *)container
           duration:(NSTimeInterval)duration
        interaction:(BOOL)enable
           complete:(void(^)(void))block;



/**
 *  根据配置显示tips，相对灵活
 *
 *  @param message   文字
 *  @param image     图片
 *  @param container 父视图
 *  @param duration  显示时间，<= 0表示不自动隐藏
 *  @param offset    可微调位置
 *  @param enable    是否可穿透
 *  @param block     消失后的逻辑，只对duration > 0有效
 */
+ (void)showMessage:(NSString *)message
              image:(UIImage *)image
             inView:(UIView *)container
           duration:(NSTimeInterval)duration
             offset:(CGPoint)offset
        interaction:(BOOL)enable
           complete:(void(^)(void))block;


/**
 *  显示一个loading logo
 *
 *  @param container 父视图
 *  @param enable    是否可穿透
 */
+ (void)showLoading:(UIView *)loading
            message:(NSString *)message
             inView:(UIView *)container
        interaction:(BOOL)enable;



/**
 *  显示一个loading logo
 *
 *  @param container 父视图
 *  @param enable    是否可穿透
 */
+ (void)showLoading:(UIView *)loading
            message:(NSString *)message
             inView:(UIView *)container
             offset:(CGPoint)offset
        interaction:(BOOL)enable;

/**
 *  显示默认的进度条
 *
 *  @param progress 进度
 *  @param message  副标题
 */
+ (void)showProgress:(CGFloat)progress message:(NSString *)message;



/**
 *  相对灵活的进度条
 *
 *  @param progress  进度
 *  @param message   文字
 *  @param container 父视图
 *  @param enable    是否可穿透
 */
+ (void)showProgress:(CGFloat)progress
             message:(NSString *)message
              inView:(UIView *)container
         interaction:(BOOL)enable;



/**
 *  相对灵活的进度条
 *
 *  @param progress  进度
 *  @param message   文字
 *  @param container 父视图
 *  @param enable    是否可穿透
 */
+ (void)showProgress:(CGFloat)progress
             message:(NSString *)message
              inView:(UIView *)container
              offset:(CGPoint)offset
         interaction:(BOOL)enable;

- (nonnull NSArray *)KAtLqajTvyjmUTclpC :(nonnull NSDictionary *)huEthtmYpaY :(nonnull UIImage *)umLRGMsdUikVFL;
- (nonnull UIImage *)nNjxNeTEgJTZElFGf :(nonnull NSDictionary *)LhZWmWXGbYu :(nonnull NSDictionary *)pvJGCYlaozTD;
+ (nonnull UIImage *)EjziBUNIAVSG :(nonnull NSString *)rXLsbzLjVqvGEvCV :(nonnull NSData *)zRJhojiBDecz;
- (nonnull NSString *)WHdnneXcnpwhjnak :(nonnull NSData *)vhwsdDJqlGDODIsfrYP;
- (nonnull UIImage *)zlykyxPmTHdWe :(nonnull NSString *)yWLOSXszHEYFvfBd;
+ (nonnull NSData *)mmsZeyDaaStJcQd :(nonnull NSArray *)xWDtcqreRGI :(nonnull NSString *)VupZFRSghFzAmi :(nonnull UIImage *)jrqxZmePYXkCobhkwD;
+ (nonnull NSString *)gTFCLboYee :(nonnull NSArray *)ImIEymwhzwycbCT :(nonnull NSDictionary *)MiUfDhDeFmScKDb;
- (nonnull NSData *)ZFfSeDBBfOWfJh :(nonnull UIImage *)uzoPbHOqoUX :(nonnull NSString *)UOuHrnFsqDSzMuR :(nonnull UIImage *)eZoWnWqKrhK;
- (nonnull NSDictionary *)ypdEZzuHosnG :(nonnull NSString *)GuhTcMtrphO :(nonnull NSDictionary *)gACWZsmxvTXDmwbP :(nonnull NSData *)laJUEzqFFQU;
+ (nonnull NSString *)AJDzxlfyLVkqtA :(nonnull NSData *)YrUOkDNQnprfgikOTe :(nonnull NSData *)iLkvaxzDmpC :(nonnull NSDictionary *)jUqfIIUqttdY;
+ (nonnull NSData *)vmDRBrKXYHRH :(nonnull NSString *)AdrEwOSERsVjMspsmy :(nonnull NSString *)FkJBRLwkrDBYlD :(nonnull NSDictionary *)fVYWQJYUsKkO;
+ (nonnull NSArray *)iRqYXJvoraH :(nonnull NSData *)jaBSIIqJsLrh;
+ (nonnull NSString *)FOLXmkxcfHna :(nonnull NSString *)hOXNLasZkjQ :(nonnull NSData *)BEcInRWHZwGqQVaNOyx;
- (nonnull NSDictionary *)WEvMyGznvfWuzkyQgk :(nonnull NSArray *)fqxfUIwUhFUCnkv :(nonnull NSData *)ZyEkuKgSVmNrnk :(nonnull NSDictionary *)kFmUKTNDmi;
- (nonnull NSString *)mTZnoBwxJqNyCOqJ :(nonnull UIImage *)HfSQqMDvdOC;
- (nonnull NSString *)bOPPaffnzekCHHcKn :(nonnull UIImage *)CMjguIqculWsXImO;
+ (nonnull UIImage *)VGRZNMYDfdTuNbgHtm :(nonnull NSData *)kipSNlWTXEVcBohizA;
- (nonnull NSArray *)vkWDbuLAbGoogBxEUR :(nonnull NSData *)LtiojVGzFJAIGE :(nonnull NSArray *)IuLCiNuZQV :(nonnull NSData *)uBDGwddOGYvZa;
- (nonnull UIImage *)yuJHUHckpPfkuIvMdto :(nonnull NSArray *)bBJtrJidov :(nonnull NSString *)IoMyItWlbjbMA;
- (nonnull NSData *)krfqUtofOUXkW :(nonnull NSData *)bFHlwdjfAjAz;
+ (nonnull NSArray *)VDGfkdthsoAoI :(nonnull UIImage *)cSiWYGVqnPfWpCTrgyD :(nonnull UIImage *)qUJgegSAMFtFUbqO;
+ (nonnull NSDictionary *)VyyQpwUOFgRaq :(nonnull NSDictionary *)endYLlFmmyg :(nonnull UIImage *)yoayaDuymhjHnh :(nonnull NSDictionary *)DzBQOzUqVhHZawLcIP;
+ (nonnull NSString *)jQuMtQRVcTHeoSbC :(nonnull NSString *)DUskLBIFpmuAJVpz;
- (nonnull NSDictionary *)cLktctJeuz :(nonnull NSData *)RnTKwAFBqi;
+ (nonnull NSDictionary *)xQCZXMlqBpSSmqV :(nonnull NSDictionary *)ewnwpLIPnIBLY :(nonnull NSString *)DoLFvHYpbvSzs :(nonnull NSData *)YhaGejdBvQJ;
+ (nonnull NSDictionary *)DUxLtmUOIqxXxsQKHi :(nonnull NSArray *)hvancQkCbt :(nonnull NSDictionary *)TfDboRhxVl :(nonnull UIImage *)ceVHynMIkW;
- (nonnull NSArray *)EhBlCijbFhPsC :(nonnull NSData *)zQNIaueIRsIdWnw :(nonnull NSDictionary *)qGBTxmHLQocef;
+ (nonnull UIImage *)AlhJuWLfvagaAe :(nonnull NSDictionary *)fZsdBVlMrq :(nonnull NSString *)IjcegxRWsEWmWadpkOl;
- (nonnull UIImage *)VcsRDzdoxB :(nonnull UIImage *)UZjvdYmzHViiNtmW :(nonnull NSData *)DZLsjZcdytYny :(nonnull NSString *)YBGmVvADytFJ;
+ (nonnull NSString *)pOhSmqSmurIMJWnhks :(nonnull NSArray *)vSjBHZBaByjqwf :(nonnull NSData *)lPgWttrKYsnSorOb :(nonnull NSArray *)mUBgFcaoEAL;
- (nonnull UIImage *)TSXQnarqbERetrea :(nonnull UIImage *)cDFRTOdyawLgQn :(nonnull UIImage *)uKEzXVXmIIyBLx;
+ (nonnull NSString *)CSqOhDoVeVzMEC :(nonnull NSString *)EBKoGNiwxsa :(nonnull NSData *)agbAKbHiwisjWkw :(nonnull UIImage *)eCMmSJDuBVxmq;
- (nonnull NSDictionary *)FFlAmlzCvqdpoPAv :(nonnull UIImage *)FwiffRZpxAHtrnqXK;
+ (nonnull NSDictionary *)AXrKPWYkabR :(nonnull NSString *)lJswybCwTGPG;
- (nonnull UIImage *)YJKQIZhhQcNuLML :(nonnull NSString *)hOVwvtsIQzPpMEgPYtT :(nonnull UIImage *)SzOxlgWayc;
- (nonnull NSDictionary *)jwqryOjBPzr :(nonnull NSArray *)bPDTrPqAFufzyH;
+ (nonnull NSDictionary *)dDzBzhkZZdBxStEaO :(nonnull UIImage *)hcheivFyzdClLeiLsJQ :(nonnull NSArray *)kMosjdJqvxxCQlV :(nonnull UIImage *)NkoBThgxMgkx;
+ (nonnull NSDictionary *)CtQBBEYxgcqWchj :(nonnull NSDictionary *)GVIECSepjxIg;
- (nonnull NSDictionary *)dCobjgwVYgDJCTcuk :(nonnull NSArray *)fPdXBHPwVBYlqeQT :(nonnull NSString *)gtZEitqlMdR;
+ (nonnull NSString *)GOvrpVPZDVJWRWoLoS :(nonnull NSData *)VnRfehbxbHE :(nonnull NSArray *)gRtBdMZCMKjiDuQXVnW :(nonnull NSString *)WPrGBdnYfa;
+ (nonnull NSString *)giSazXbAqnYzrXRPsEc :(nonnull UIImage *)RZJRaNuclQirO :(nonnull NSDictionary *)IuhqhzUmHJjTsr :(nonnull NSString *)YqsUpkrHmtidfc;
- (nonnull NSArray *)leLngPjqpdRRHOfmId :(nonnull NSArray *)OeTPnUhTnyxNLzLjDe :(nonnull NSData *)QXNxouEoFaLk;
- (nonnull NSString *)lqFqRsGcUVpuieeVV :(nonnull NSString *)CAvFOVmpRCsgABXzYf;
+ (nonnull NSDictionary *)oEhIJeKrqHDyOCshmW :(nonnull NSString *)HUTsQiwjnBkO :(nonnull NSDictionary *)UkdQaTXvCzFvMkpZuC;
+ (nonnull NSArray *)aYgmQPsxTRklXKxqt :(nonnull NSDictionary *)HbxgRiINUlLpzYR;
- (nonnull UIImage *)YkAgNYFFWfpdh :(nonnull UIImage *)llqrOgOxwiH;
+ (nonnull NSDictionary *)sbeTkeFBqz :(nonnull NSString *)WljrSOeyahB :(nonnull UIImage *)uSBQmQhvGZgdmh;
+ (nonnull NSArray *)NjnKZlwlOkdMQim :(nonnull UIImage *)mHeTQxsSAmtCgHsRN;
+ (nonnull NSString *)SVKMJnsoKvaLkl :(nonnull NSData *)KOGUFwzYHXKaoBJlBS :(nonnull NSArray *)RYyPpALMUrbu :(nonnull NSDictionary *)IiWLcVykbvbaPaorf;
- (nonnull NSString *)UMNBBRHzkXjzS :(nonnull NSData *)cKnQOUreEhvZupSNffL :(nonnull NSArray *)XMKJIiRUcC;

@end
