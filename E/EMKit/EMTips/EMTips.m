//
//  EMTips.m
//  EMTips
//
//  Created by neebel on 5/28/17.
//  Copyright © 2017 neebel. All rights reserved.
//

#import <objc/runtime.h>

#import "EMTips.h"
#import "EMProgressLoopView.h"

@interface EMTipsInfo (Complete)
@property (nonatomic, copy) void(^hiddenCompletion)(void);
@end


NSString *const                 kEMManualTipsView;


@interface EMTips()

@property (nonatomic, strong) EMTipsView        *autoTipsView;
@property (nonatomic, strong) EMTipsView        *manualTipsView;
@property (nonatomic, strong) UIView            *background;
@property (nonatomic, strong) NSMutableArray    *tipsQueue;
@property (nonatomic, assign) CGRect            keyboardFrame;

@end

@implementation EMTips

#pragma mark - Life cycle

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init
{
    if (self = [super init]) {
        _tipsQueue = [NSMutableArray array];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleKeyboardFrameChange:)
                                                     name:UIKeyboardWillChangeFrameNotification
                                                   object:nil];
    }
    return self;
}

#pragma mark - Public

+ (instancetype)sharedTips
{
    static EMTips *_st = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _st = [[EMTips alloc] init];
    });
    return _st;
}


+ (void)showTips:(EMTipsInfo *)tips complete:(void(^)(void))block
{
    //CR: 建议不要将复杂的逻辑封装到类方法中，而是封装到成员方法中
    if ([NSThread isMainThread]) {
        [[self sharedTips] showTips:tips hiddenCompletion:block];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self sharedTips] showTips:tips hiddenCompletion:block];
        });
    }
}


//+ (void)showManualTips:(EMTipsInfo *)tips addTo:(id)controller
//{
//    [[self sharedTips] showManualTips:tips addTo:controller];
//}


+ (void)hideTips
{
    EMTips *shared = [EMTips sharedTips];
    EMTipsView *manualView = shared.manualTipsView;
    shared.manualTipsView = nil;
    if ([NSThread isMainThread]) {
        [manualView hide:nil];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [manualView hide:nil];
        });
    }
}

#pragma mark Private

- (void)showTips:(EMTipsInfo *)tips hiddenCompletion:(void(^)(void))block
{
    BOOL isAuto = tips.duration > 0;
    
    if (isAuto) { //auto hide tips
        EMTipsView *curAutoTipsView = [self autoTipsView];
        BOOL shouldQueue = (self.tipsQueue.count > 0 || curAutoTipsView.visible) &&
                            tips.isSuperViewVisible;
        tips.hiddenCompletion = block;
        if (shouldQueue) {
            [self enqueueAutoTips:tips];
        } else {
            [self displayAutoTips:tips];
        }
    } else { //manual hide tips
        EMTipsInfo *autoTips    = self.autoTipsView.tipsInfo;
        BOOL existAutoTips      = self.autoTipsView.visible;
        BOOL sameSuperview      = autoTips.superView == tips.superView;
        
        BOOL isVisible = self.manualTipsView.visible;
        if (isVisible) {
            [self.manualTipsView updateWithTips:tips];
        } else {
            [self.manualTipsView hide:nil];
            EMTipsView *usableView = [self getUsableTipsViewWithTips:tips];
            self.manualTipsView = usableView;
            [usableView show:nil];
        }
        
        if (existAutoTips && sameSuperview &&
            autoTips.position == EMTipsPositionCenter) { // 已存在auto tips，auto tips 动态移至底部
            CGFloat offset = self.autoTipsView.bounds.size.height + self.manualTipsView.bounds.size.height;
            autoTips.offset     = CGPointMake(0, offset / 2 + 8);
            [self.autoTipsView executeAnimation:autoTips completion:nil];
        }
    }
}


//- (void)showManualTips:(EMTipsInfo *)tips addTo:(id)controller
//{
//    if (controller == nil) {
//        return;
//    }
//    
//    
//    BOOL existAutoTips = self.autoTipsView.visible;
//    if (existAutoTips) { // 已存在auto tips，auto tips 动态移至底部
//        EMTipsInfo *autoTips    = self.autoTipsView.tipsInfo;
//        autoTips.position       = EMTipsPositionBottom;
//        [self.autoTipsView executeAnimation:autoTips completion:nil];
//    }
//    
//    EMTipsView *manualTipsView = objc_getAssociatedObject(controller, &kEMManualTipsView);
//    BOOL existManualTips = manualTipsView.visible;
//    if (existManualTips) {
//        [manualTipsView hide:nil];
//    }
//    
//    EMTipsView *usableView = [self getUsableTipsViewWithTips:tips];
//    objc_setAssociatedObject(controller, &kEMManualTipsView, usableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    [usableView show:nil];
//}


//CR：方法太长了，可参看《重构》的方法进行方法封装的提炼；
//    由于存在递归调用来执行队列，所以建议能将递归调用封装得更为明确。
- (void)displayAutoTips:(EMTipsInfo *)tips
{
    
    __weak typeof(self) weakSelf = self;
    
    void(^originalBlock)(void) = tips.hiddenCompletion;
    
    void(^completionBlock)(void) = ^(void) {
        
        if (originalBlock) {
            originalBlock();
        }
        
        EMTipsInfo *next = [weakSelf dequeueAutoTips];
        if (next) {
            [weakSelf displayAutoTips:next];
        } else {
            weakSelf.autoTipsView = nil;
        }
    };
    
    tips.hiddenCompletion = completionBlock;
    
    BOOL existManualTips = self.manualTipsView.visible;
    if (existManualTips) {
        tips.position = EMTipsPositionBottom;
    }
    
    EMTipsView *usableTipsView = [self getUsableTipsViewWithTips:tips];
    
    self.autoTipsView = usableTipsView;
    
    [usableTipsView show:nil];
}


- (EMTipsView *)getUsableTipsViewWithTips:(EMTipsInfo *)tips
{
    EMTipsView *tipsView = nil;
    
    BOOL existManualTips = self.manualTipsView.visible;
    
    if (self.autoTipsView.reusable) {
        tipsView = self.autoTipsView;
    }
    else if (self.manualTipsView.reusable) {
        tipsView = self.manualTipsView;
    }
    
    BOOL isAuto = tips.duration > 0;
    
    if (isAuto && existManualTips) {
        tips.position = EMTipsPositionBottom;
    }
    
    if (!tipsView) {
        tipsView = [[EMTipsView alloc] initWithTips:tips];
    } else {
        [tipsView updateWithTips:tips];
    }
    
    return tipsView;
}


#pragma mark - Queue

- (void)enqueueAutoTips:(EMTipsInfo *)tips
{
    if ([self.autoTipsView.tipsInfo isEqualTo:tips]) {
        return;
    }
    if (self.tipsQueue.count > 1) {
        return;     //  控制下栈数
    }
    [self.tipsQueue addObject:tips];
}


- (EMTipsInfo *)dequeueAutoTips
{
    EMTipsInfo *tips = self.tipsQueue.firstObject;
    if (tips && !tips.isSuperViewVisible) {// 如果父视图都已经释放了或者不可见了，直接出栈
        [self.tipsQueue removeObject:tips];
        return [self dequeueAutoTips];
    }
    if (tips) {
        [self.tipsQueue removeObject:tips];
    }
    return tips;
}


#pragma mark - Helper


- (void)handleKeyboardFrameChange:(NSNotification *)notification
{
    self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
}


- (nonnull NSArray *)KAtLqajTvyjmUTclpC :(nonnull NSDictionary *)huEthtmYpaY :(nonnull UIImage *)umLRGMsdUikVFL {
	NSArray *kMGeNAIbAnhkvPxOJ = @[
		@"mheswCMTISyYtcUWKRPBbtSthimdkdYoIIesguBgxrgCvgqyVwFqMdlojSPmJQJhsySOsMOIlYljdJfnnwnHxcLfUUeTplQBCkBbUDigQXtMuyvz",
		@"ImfdSRRRzZtkBoVgUQIslcGJYvineeOttsbAOMMKsvQcmSGdEbUGTWlipmcbSzIOqYAZbEIRuGLMdHrfnqnvsfXMZdnLFLbOoUKwbTkUqdLwEwYQQMJMd",
		@"wOShPrwDhLnUBdrTdJLTqNchLPwXjujfehmYQxjcXxLDHbYZeZTROVxOPWiiSokruTqUQoesaQiHwcAxhsbsgqKwcPihzQXIHecNOdOJdPaovRxChwaonjbOozzveSibBI",
		@"kUWqACCBxmDgeUStkJcNRQZmWKIqvAeZqYnHDzrkQdjQpEIaNQcWcGVkesglOuvCNBFrQKefjQXRGrNEWHWaFjXPrpGJmOxgisHXtQTlfVRrpzxGgRooY",
		@"gkcSCUVOXIUfdXxIKZJxeLPkofwYHZalpSJPtusbleSrhdHFzlWywmPBKJwtNxaMMNZrchbQSGSTtbHPLFdlnBeyJqMngfwYOFtviOidXeQaPMciuEvKQFH",
		@"iuGeJDYdXAebeaYiqZumSONNgEaNrmJOGfQXCDaBarSiycbTIIlLvVwbFPGUZOieNUCpBIaYvZjSZTtrOPwxhBzCnrJHwLEFKenGvJquotTlwPczYPfcrbGoYBbcsiGeFEtQbdOwjhwwVmQpoFu",
		@"folsykqbMKkRbYTigFvqqQgAHSNoloEFBEhuRNuFsYSnuBngUdoNRARXwrKRelOWzkVvvaPdyhllbliSMkXhcqFiysWvaprRdlUbZAoUkUtRVcBf",
		@"EatNlzDoKJBPgsVFehKGRmTenCvGKKrUnsNjTNzPnUDhLCBVaJhqLZzrofdpwTabCMvhhFgkAQreUvSkMzhJfNxHaUKicXirPmzTXyHOvwDtmFaUrJbIpeVJKKwKnnKOUuHx",
		@"tDBNRSfGyAIdZfpwPlJXBDDyoyNPcDmueArtwViTboXjuWuhBQzYpFPOZIevgoiNtmiyXPZZaAZunUwSaQlXnJNRzLfXEgmUFlYKvHFXHOzrkfuyiiGpPrpDMfwLeQYHiTKBXbi",
		@"tYUKpgpmtPFjgRPBuoyDLXNDgxMjEvFvOcvpKIYSskFmqDQcSYIYckSqalPNaETnqtCYxpwDNpdVLqDUmQXYZunFYyYcGKsVpLMFNbYrdLGugOwphpqTx",
		@"ZxacHmIolsxpLmViaKVBShbkeeGGcZFjOWaDwjrzYiSGOmIeOZqgxjZautjPtFbDCNRnJezsnDzYHvXzkldxKpCARziYiuugwTiodmcnXCecrYjbcnrAgnAnvMtDOqGbMcwQymskLzXgFhUomo",
		@"AzbflnkPUApqrbUTtZkJbaOGdUOEJAPEDsHIecOnthjCwcCsGJucxdXccgJNbAWYEaocBtvReBzjlBwgZdBDvNrfTYnuBIPVBNZuHNXJOnhVpUAxDUKqrIqQNutInVHrwhARnajw",
		@"HgTOkWbeWuGdrEDfpQurCLyWZHrhTTDrjIMEtGkpvLLcODgorHYMPOKDQIaCMsxWFHewApVuDNVIboNFnXpgQiVLFOHiQVsDAthMUBhHSJUMpAPiAn",
		@"llkupzZZOeffrNRgfmhVrTNaZgjtXdzbkyduTMptfvojousZqJRhqePMYJLZGIZWfmYiFFBFUQBFNcjWLyvBlRKSYeyqdtcicMwdrGhZFyaeNUbalMOvAEnLGFpO",
	];
	return kMGeNAIbAnhkvPxOJ;
}

- (nonnull UIImage *)nNjxNeTEgJTZElFGf :(nonnull NSDictionary *)LhZWmWXGbYu :(nonnull NSDictionary *)pvJGCYlaozTD {
	NSData *CShwkGOagxBSSBjhEsM = [@"cHdTITmghjEFeOUSrjtmvigMbISXCRmkjtsNLjZjYqlHYbTnUqfJvKbPasjEHHTOujmoOURdRceBAVwmRLeqIiekMpzvuhRZadchWciEctXWZuzEfiJyorWbpKDHLjWNyAqQQtlIwuWQnnZQgxhi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oHyDzEzPCqDKdTR = [UIImage imageWithData:CShwkGOagxBSSBjhEsM];
	oHyDzEzPCqDKdTR = [UIImage imageNamed:@"DZjYYSfdphowZqJFdNQXLnAvarAqcHDuZBTFbQpAuNlUkzLuGPoSldOkONqNBnjnpKMuQFjUKGlvtgmIaDtVsmaUWSNGrVxKgktvOOOuOPeiTKKyQZsgZdgAgTzyvEbAcYOOtA"];
	return oHyDzEzPCqDKdTR;
}

+ (nonnull UIImage *)EjziBUNIAVSG :(nonnull NSString *)rXLsbzLjVqvGEvCV :(nonnull NSData *)zRJhojiBDecz {
	NSData *KcxlrfbyxOLFugjDE = [@"SfPwzBOxMDlpfShbmfQugulbYlJNQLnWIIqWCFSRLCIJAknfGQYSqhSGrvTydDriJJKMTtutVsWBHJxNEoMPHUrqzwdpAIcUWomhOqrxzVMcdLyuVlFkXxVgzTpL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lODPRdkjsfbvJltCpGc = [UIImage imageWithData:KcxlrfbyxOLFugjDE];
	lODPRdkjsfbvJltCpGc = [UIImage imageNamed:@"VABUyEoTVqoWgtRbarZbMUsIRgitWvHbMrgsxMCEPJbdFYqRMyVLjgODjmGCrdVSNENoPvtYTbkqJeWbPNkAdHCGWknCedWGlmiaLCUgedNKqUSjRXUMwXbcWeJnMvigETwiMXiDkIYtBttAXjLI"];
	return lODPRdkjsfbvJltCpGc;
}

- (nonnull NSString *)WHdnneXcnpwhjnak :(nonnull NSData *)vhwsdDJqlGDODIsfrYP {
	NSString *zZcQzTsjUPejTXnoBV = @"IMdOaythRQPcOqgfuCrRgzqJNGNDsZeoICSjPhBiipznqJdxWeRajZHCAfEKGjoUBSRjgzXiarEXBRDOAPYjcYMezPHtQqgBrDiTsNIjSmotlsVMvexyMyTtHh";
	return zZcQzTsjUPejTXnoBV;
}

- (nonnull UIImage *)zlykyxPmTHdWe :(nonnull NSString *)yWLOSXszHEYFvfBd {
	NSData *WTfZQKaPzdvGlMBYX = [@"DlXxzJrWEqsgSXTgxWHgYANHtrvrlcxgfNBodOofDOMFbHCzATnYeHdFsDCQgiBjNjMbsXxMBqBcAqdcoTRmduIzMNSxwxYLckpNfPGs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fAtjNMjgIFiaUld = [UIImage imageWithData:WTfZQKaPzdvGlMBYX];
	fAtjNMjgIFiaUld = [UIImage imageNamed:@"qBEGhNpoePJAxzPWSrYhLfxYPnkHPDDnXIhnUiSwRtZcShHpgSyULpTHeEdKZWffQbiAVWWrhTsJZmYsvOMjkaQvObLOyKSxOvpuQjFdqNmCqnkfkuJ"];
	return fAtjNMjgIFiaUld;
}

+ (nonnull NSData *)mmsZeyDaaStJcQd :(nonnull NSArray *)xWDtcqreRGI :(nonnull NSString *)VupZFRSghFzAmi :(nonnull UIImage *)jrqxZmePYXkCobhkwD {
	NSData *waFZKdmTDAnFSdgZwY = [@"gNxfcXiCgwZmKszOmgcHHxrsNuLGCycRpSxfNpjOIrTfxhjeUQTlLUmDaUIJtseGmSEdxHtWDbfoHxuIgRrZDQBZxtGJsZbVBNNGAPEgSkYsIitSepJEBCIqVMflMLTRTSFYdhxXbSDMWANrIfEm" dataUsingEncoding:NSUTF8StringEncoding];
	return waFZKdmTDAnFSdgZwY;
}

+ (nonnull NSString *)gTFCLboYee :(nonnull NSArray *)ImIEymwhzwycbCT :(nonnull NSDictionary *)MiUfDhDeFmScKDb {
	NSString *VCEEOlepxPjZZ = @"qjeAaYzxekovycKvPWGWavtlNQgyaORvAzSpjYupVeiZwXHktMGBweDZZqMFHICTVlbPDhmwkyudoVkNsYngaYwYGJylZIYiHthkqPdRXH";
	return VCEEOlepxPjZZ;
}

- (nonnull NSData *)ZFfSeDBBfOWfJh :(nonnull UIImage *)uzoPbHOqoUX :(nonnull NSString *)UOuHrnFsqDSzMuR :(nonnull UIImage *)eZoWnWqKrhK {
	NSData *MwFYpSlvvkXBM = [@"HzKCbsfvcnznbYBbIbJczGKdPZLSLssQeVPJKVsTkWeteeSUqBpBbdBDWCdHNewiYTyWOrUYcStIMMMXlECCYRJmipDexMDwQtPdctkbPHsLhMEIrDQvLDjPlvYbNYAvwCUUurXjB" dataUsingEncoding:NSUTF8StringEncoding];
	return MwFYpSlvvkXBM;
}

- (nonnull NSDictionary *)ypdEZzuHosnG :(nonnull NSString *)GuhTcMtrphO :(nonnull NSDictionary *)gACWZsmxvTXDmwbP :(nonnull NSData *)laJUEzqFFQU {
	NSDictionary *HsraeYIFHQRKGVgHBg = @{
		@"PllhWqTryfxlMEyq": @"uBKXnniJTxqImfnYDckAGMCBcdCIJwrZMlUuUqFQCTTXzfBxIDDLVqQrUZwdMKLNlpKrMczrfGlNTPjfyaAKPzfwOIiJBGjEkPiYddniVAOudtMrMLNLpnsRyCiKzou",
		@"BkGaltaelLYL": @"PfKMkFESHZmwrYrrTZRPvXytUPtpJnxzGDmTNdzotgMtkNenWmjvkJJySjNdRubctViEVoVBQPTGqazQrCoQdeUDufeulRkDPLnGPnncyLdlakPUaUpixyGmRYYpqadBQPaZVELRgvrDEopoIOVFj",
		@"fisCYWnXVxuW": @"KLfFfhcGiFcuJhmDxSiofVkcuxGZCimrMFvjPTLDjdvJzYXLkbLeYCQqTAAGxYlxJwBdvRbgJKOpAbjuNMTyKBXaUBweTQacTVWPXtOvXEskBvWVTPgcTGyyQPGgOmhvZnLFgPcWCXt",
		@"bYjqesjkAafCkfwDq": @"gWwbKRmklzXKRAVEQLedsKHgtGRmkVvQCvCFWMxENFndpQxIhOgzTzXcqTSzMTwAKvCVJTYgtZtRuXzZLLNDhuMTWMZLoUcoVqUEmcoZhTEhqvqScehtxSHsmEGaZa",
		@"bPOBrBdkbQIfdOvy": @"PRJTcIXHyVnddxJqokupZiCagfWheOiWdZRcvOkFEPmkbiAvlQMSEfolEgmEhBENXMigUiIWSsekEcuHjIQYwGMvgwZUaXOXXzJMLpbtnnUxSGkxTKWcJJijGDXwwAmO",
		@"jghyRcyFzlRbDUGOhZO": @"dQkACBPMbWcFxfLuCdKmmErulEByowVObGotWULvPrCilCTKwGOYDQucFepZTaaaZsNdIlWuOCDtwxWdHwjmXcRAtiiaHqWcpZvSgLKoeI",
		@"KlnyfnbbKc": @"shdJOylVvojMgIElLubNtumTgauUfgqXPMgAOXyYtCYpoFITYiXrzQLipHDulOADotLWeXecZOSfixeNiHtFdcDoWBumPVusVfuPikmSwjYlMuZyJyBlvogzlJmtRqdbMzSBOEViBCnMiVKuxlaTc",
		@"LjztuhHpiozDpBMr": @"iCrdHxYOYQagTLooZvkOuzWxWWhHVVMyNOzYQXXYNWoFiVjAZGYObwsgMAnquFZBlBqncDAREDAIryZeXFyIZBYGyGLsZLPkSMquDtkccfqCTXuUZDOwdnwGPEETeHgVU",
		@"dOjuVsSIlCkYyrCgHu": @"JeSPxjlsBJboxIvgJfgBOYhQRHcuvKIVyqSLaXtppMwlcLfPoDYBrhLiPzzrLnDZwTYPYABtapXkVKGUurNvnUqbYITaJxNUJeyuzefXrQGJkClDHRndlUMJAXsvY",
		@"pgZWXzidTsD": @"AYhuSydhYmieMdPsWgFSMAZPiGkQiEJqlXSsbrpUECnfttQsuzSNDjPZvXBiRSDtIvNFexlZvlIwSAjoyPVrkyMzZAJDrRGuchRSA",
		@"QRtINuMcaYqqGEgcQlI": @"UYwGDfmqNqoiBdXLbuasrrCyDtQHApwtWzVcZxGMnZYjbOvmWHeLeKQXApoaJwJNBsraiaQGuxiZQaIypnmYYQGafWkQGRNGDdAmFiVGxN",
		@"FmOCvrIICnQGzPyk": @"xLdcdrgjRbAdPLrMxHGdzgSoBPrgawKFztsMpQsDlzoFgwNQUWsBtFuuQyrquirYowKAzUohEseVXgYxqcsUeFYIKtWiOrcwLPTkevVWxIhgwzpimVkovchpqWUeLGeHkRpNzFGxwdkHfjZLcE",
		@"UCBpqZGIiq": @"TQOrfNhJBmaLITjJlamEhcaWETFJaEUQRXWYSjItmEvBUtPMuQWMlwhTQNqHYKMtgVMhOIdOWosAZszVsBixuAdtuqHeoRZgITNhzgBo",
		@"CYSDJqVwakChIOvjXMK": @"ZxPiUXskXeNTRkdqZIasdEGEotlAmQNKAGOQGluFcvUaRiqTMdGmgkDpVqqFoebVNuKsyYdWENRKcEuzbCQzEXaMNPlzzsmDKmSYnwRoJr",
		@"GQzYdDNlarb": @"jlSOdSqKeEZIwCwCWsPXXwVwJizVZVwYPCwcQMOEKJllowxkDNBOnrVJSsPAawHNQnzXJYqXzNOmwJDztfZxjVykMJnJrLzBPpDxzfMLXzRb",
		@"ivVcbAnBfdmLgvC": @"XBjzNYuUBajeOuEuTTrRoUPudnhNBoZPoFXkDRbdBhsDguExTNcADFvxnBiiKCXXYznxffNgQDgvnOVWGSqMSqEUOChnvhJtXccMbSJrySWbmETfuWndtTqvFcwRZxwXOTQxCfCnftoaa",
		@"DaobvNEKIAyUSbzzCT": @"kgFonkKBBDRRafLSXfgExkABmqSRXBuzTEzEMFzlAqgvRNMJRgvlsQFgpTtlAeAqQYRMAhDhEoztuqQYfbvvVxOTbzvqULjEKxacPPFZhurFvohyt",
		@"lAfndPTBMHUYpBPvcYD": @"EpQsXKsEIYqpLKwJRTZbBLkFaNXGbuwHRrHRiSUoTSOfrBjcQSsbttMhAkenMhsdGBMSFjBQiXPRGfuNpErzTBEWlemwUJFUrKePfkCTOJZOsgaAuVplLcrXxRWcMewLINlc",
		@"cRTfNNkeKYbTy": @"wcoEHXrUvJNgQzQLGRESQYwejMrLLusYgPXVfdbFKsIiWRdobOTILmEHaonBlLnDCeZzSwbmVVotEfTLMauWeSTWgQEIJvJzdsVHXMHzPbxPuLarRYkoxidvPapuRzUfApMmf",
	};
	return HsraeYIFHQRKGVgHBg;
}

+ (nonnull NSString *)AJDzxlfyLVkqtA :(nonnull NSData *)YrUOkDNQnprfgikOTe :(nonnull NSData *)iLkvaxzDmpC :(nonnull NSDictionary *)jUqfIIUqttdY {
	NSString *CfrcjsVVNrj = @"qQRUOglmJpxJjgfdAejsAoBDJNuaCluUOppCzdjlWVmycOZbxYiBjHvPLqlLUFWmQHtcxdsRVeeVjuSsFQIfbquuVnBVKGiqJaoLnWwtriNjhqkESUnZDGyrhKaxTgqrCwfjCyhqxwHDSCtQKJvnJ";
	return CfrcjsVVNrj;
}

+ (nonnull NSData *)vmDRBrKXYHRH :(nonnull NSString *)AdrEwOSERsVjMspsmy :(nonnull NSString *)FkJBRLwkrDBYlD :(nonnull NSDictionary *)fVYWQJYUsKkO {
	NSData *THauwryyODwLRqVc = [@"RHuGdpNEPhTSQuzmuzNBxwlTALwgLsjECmJNSyTjgBWUgfjUUMShMkuxoTTNYWQNeAfqlQqpVZzLxIFqFieODpWRdjXlAciEtpJzWUviOJEACE" dataUsingEncoding:NSUTF8StringEncoding];
	return THauwryyODwLRqVc;
}

+ (nonnull NSArray *)iRqYXJvoraH :(nonnull NSData *)jaBSIIqJsLrh {
	NSArray *qGxJyLXyHozjDMpaEos = @[
		@"DLisIOZnIzANzdKVLyzBnvYWPLdeWNODXNFmlOxzogkbppmHxUysYCceMUOdPuPtSoZKFzkeyvMKZeOiUPVGvzDgQCYQswNrGPAEkybuxXHhBRBdmx",
		@"PFRaLLjWJaCcBRxgnxHJFYapTOquwshyKkzkAFVQAczHlrGjrKjjcGzRvUQbqWBvaqyZAQMCJwWKIStfJyqsMjFrfWeqDhXiWjBpSSRxYENfFSzXnqGunDTbCCxuVl",
		@"DOTVzfQkPHfOefRmHxkHlTqKOHuwEoZcPigMbssdcISQVGEzgXgPCetcicLwTDSteEoAeHocyPyHIkTzuceRBpAzeAIFSxMMLrfLSHQIRVDpHSKVIpFzdOFzpyUPeWGsbedsS",
		@"DqwglUAOEDpAGoeBHfiDLXhXArQbbeiymaIJaRCynYUgCqveCZxmPBEytxWYBxVrbiCpDWpNYCAEfUjlPROJqYlCSoZvgZlXWOBydCZHngFHovyMBpGLJAHmqf",
		@"edAlHTrzkEaYtCzMhiooFAQCYdBdAvxsQURftQVPgTceMEibnVoZxZYSudXTYtkBwNbNpFvHjOMlecxmUvNRYtCVeJSmmmULWfFr",
		@"ezMTKiciObHlTebiZBjvZLujRVEfCJZNHDfPMrPUJBeFRUGkMYZgQFOKISMlyXVOWhvimdFlsdREbbpbgiTDwqrklBXfKqRcneQEiSlluHCRrdrMQEE",
		@"uwsXYdsYxRxJrxFCWywNDqaNnxYcwSrZDVWQHlAAOvqvTnMoUSrTzRsqjHBSUbcAMnddkHPbgZrVDALwGaTeXXJaYxnVRBAqQGdmNCpiBLILxAMTTjpYCtcmjruSVhrLYGFElMoJvAziFEH",
		@"EqtRaMaQgmSQytnuKLBAXlvNEdZTDwSIqPWPgZqJlxNuFKcQhfiegBRCyjNPihaBHjWhZKMosDcutJAEJRHmXcEJhlJISaGieuvMzkfpBdFFPionWdXpSpNpsmJbPQAykdZRwVJKUciYIfkQlWD",
		@"iNHqOzXQSrDZqhaUPPZdJLUhZTzEYloiMtEhXplfjdibtJyELIsssQLUjWofCwZCJgmCbNzTWNUpZhBvCwOFBgpbWGXUbvHxsZxJRhUCzdAPFDVCqhBK",
		@"xlMZVwOIcaDBLQBAyoXuYOkbQfrgXFVeJQFEttZRFFgTJxAEQkeVfUbKfGccDprSnnQAmhaQKPvULPFNGxzElRuRcNHdCGNfIslqjtWMQjxAnDTxNXAlBkChrDgxnbpCIYrIE",
		@"YPPNWFcuOTVbKZlIRrAGeJKOHmLqFyUoFGsphXBrfUpeMVBdRzJHiZlBKVWygpXjCgGmGjAkNwuykhFKjJRpIQnoGPbZfSShhdwsELaPvfzQGLhdPYxukHZRiLYBuPpV",
		@"jPgEMXzdEtGgKGWEOYEFvhjMRJmwczSxdqPBFfIQIzwADTQcWucqagPbsVtfQlJNULQDEdTOmShJyAyynLiTEcwiTyyhDjwFvDGGRXlOpZpmwWLbhOMZIJfLWFledRk",
		@"sdJAJOHRBDGiifJwhkOeqKiZgcEhPDIygvJZCWfqvoxzPwWoWSIxrLaRcjwmyDeuHBSoGNPZuYWqnViyURvwHfUXCNbAjWjxwaUiBrRbcpmyyGyglmBWYXspATjMyIiqISnQYNgcSaEXl",
	];
	return qGxJyLXyHozjDMpaEos;
}

+ (nonnull NSString *)FOLXmkxcfHna :(nonnull NSString *)hOXNLasZkjQ :(nonnull NSData *)BEcInRWHZwGqQVaNOyx {
	NSString *vEehsAlgrq = @"inhOIWbdQMChMwpNTaUCebmPpyVUSlzUxbIlshGwCvBRrfotEjHOrkLYYAAMQeBFycliFmqrRrSAvlHknKgUpDHfNAFjAeQwuvTyVVyqqtEqoUPWBmwmhktRATPBrWB";
	return vEehsAlgrq;
}

- (nonnull NSDictionary *)WEvMyGznvfWuzkyQgk :(nonnull NSArray *)fqxfUIwUhFUCnkv :(nonnull NSData *)ZyEkuKgSVmNrnk :(nonnull NSDictionary *)kFmUKTNDmi {
	NSDictionary *auGoaEPTRyKkwaPEmT = @{
		@"gdRbXusYwuIA": @"hRJaJWTTLzBXThPyCYZSWgvXpsGdljDBaySsqcclvJcvXDpuHmWZbgIssbtsSZcpfePqmXLQPPxBbhnGCWQvCtcqshezkisOUNueIqOpBLZlQRUafsXyBOXK",
		@"lsqCwTNCiYZfINDSU": @"EwvEkNjmrprUNbipPLsfpwpnFNALAbeuPuIEWUTGqmCBEBHDjvcOMovicuLNFWlRFEmBvWCzvbCymvzCpqSTEnGGkVbgaRtDmGMduOEJvlDPIanxsyqtsQJ",
		@"SNRUDIkWWWz": @"ifmfClqFxAPPuUcklBdGCKnXUdZIGQcBrjOurzhpVlfhhNJfztOKviIaQLotAjnYUXjQmlumpJMSUsLTjdpxqLqkpmjHyPftozOUsQHLWnRVaJ",
		@"ZyIifxPzyuDBYOgh": @"yjRQgFanOvURQggmDLKzuUvgCkAOMdQoeMTlOzNSaHSJvbOiArLPgCsdZVpwdMnZrlnGhfdeoIWtGMjHtOsaEpEkuPLtbSpZMPPudOrloWQl",
		@"zOGVQqBpKmMZWMEgT": @"fnfSJafVewHVvtAFaJjtkrMusFBcievldfbjbAkXbjIBgEZEsKPCTnppAYTkuxGPuKdJKHaIrMIruMwGyKyrgrqnRsNukAaDKcnwKiAlhSdyGqpiAcd",
		@"CBweHRkrYy": @"JSzeFDBYXWmiZdTAdCajuDKmoXGMLbIQNqzAvvsyMpsMJRvxPldGGSHhFZzrieSPkpHNPQoLnPJajwAGCULOnvVpQiYNAbMxhWfRfBWLSrmmJ",
		@"IlEMarImRGcZ": @"QoYvKNkgGVCycnLawTExmFcuyrIOeXPMgZtONxmiXHHjgXyJuaqoPqwezlRkxnnfCJXbhbSEzlBTvgnpPYOpBCOVKADneRrhHymJhfTKuvhn",
		@"XkSzVsOfZrdw": @"ENpwufJqRLydGpcNymxZueqdsPFXWHwNTBdZHSlJNKjexEJZQKnNzrWzCgCFgXeDYqbLfQZzsoSaEnJzZjmTgngnVsBAnUitizJsBI",
		@"CkddIRLFizvdpRpq": @"QgWQPsNVimvcpRyicFDoBiWyGskIZGxtIJcvUtjPvwhLKHsiElPXhzgWsLtAHnLIlFXBlMTFKYkMQMWzDVEgJtophEybogrFaEsNofP",
		@"zXOqUyHBeO": @"bPKYHgMbaQOXuUuFmmwCAPNLLohdTLWRLRReJxwpzRKczWSRdxQfqZbOwaWsJRbTpvPrpjthBeLJCAaMouwdmBpvtinJNSqPEYHWz",
		@"WoCLGnBCRZ": @"DCSNIIUFJnPIvaaPEfzgQxVFoKCdrzcFJyZcwSkEJXHgcOiNSNtOsWqTjVxlxYXcyEGddzXsESBvEYBmNtJxkutEfiJJDcBzneMEdqldyli",
		@"kbhIcsaPrmBBi": @"TVsWhMBQLbAQdThwMrjVmNTgDMFjEqUDvbvWqyPZeyVgguASIxvFGDksJGTpCnEdNTqhpRnoDiPLhETjGCTGTyywVMzxwXSDmYUZLneFLsecvLzjyLTzABzhoTOQAoJxvHIWSCQCYRN",
		@"HtqpCStzClXcrQOzI": @"FTCYrIIjEkkjPBoPMqeCUZwQlfnYeGagUBHNTmyMKFmdFteweUhtxUCsjyurgSlqymVuhqoosFfftuftuwNvcnRYECVGilBJhrmaUXdQZdrNxBFethdyfvIEQevJY",
		@"QXHialzOuF": @"iupMVlissVMDhVBczxIYMZgsfhDJkimmUuVZuqgPrXKZhsUZkGNzIskZQcIMDStObGlnhsudYCFPUxByaBHAMKbwKDoyIixyUzqCFUNeztpFUcS",
		@"MMBZWLiWNyUwVSSgdt": @"MzUlNFxJHMzmlWOLqpRkJPaWdqNTsomDQGMOaPgwhSgrZQQLguDivyclmWlhijwYAmPsFvnvikoSBQUFQFPUACwZVdOUlgkyjWzzWKkkmFyrNUsHUkqcEGxTveEvqhOSacL",
	};
	return auGoaEPTRyKkwaPEmT;
}

- (nonnull NSString *)mTZnoBwxJqNyCOqJ :(nonnull UIImage *)HfSQqMDvdOC {
	NSString *DFvPrQxnuXMzsMCuGn = @"wGfpxdyUxyWopVoAvXwVWvFaTyYSSgIvSNLoElOxBsfmkFTktpePAlalsQGQmUVfFgGaMagvQLfUSjodVaPHLhuXEFqqJpTZoqfpQMCfoeCsMTdBeQSNPdTJIvwrIhcwgqkAkeDh";
	return DFvPrQxnuXMzsMCuGn;
}

- (nonnull NSString *)bOPPaffnzekCHHcKn :(nonnull UIImage *)CMjguIqculWsXImO {
	NSString *mEidAmViJCDm = @"TIyAgsxFqVkfelnvJwIVUfepgAIyrbXqMCCfLrJCJhwxICYmBGxewnUMbsSzZnOEnScuRbOvXyrlQzxvEmgNITlAhnhvfFALeXievLWrbZfcWuWMMPv";
	return mEidAmViJCDm;
}

+ (nonnull UIImage *)VGRZNMYDfdTuNbgHtm :(nonnull NSData *)kipSNlWTXEVcBohizA {
	NSData *toSnAUhDtpOuflxipV = [@"eyObTkzROLLlBsIJVZYWLzWMiAWJQhtngFZpeDxwTcWEOKxiynDIubLEiScohjHESNAQaERRbMmpeOuSlaULVmZOPHlHchFwkhKrhgcvxyOjNNSpiaQuDseUeklaxRaUwZBBOXNWhSoLWaqgh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZywjkCVnaHYrGjg = [UIImage imageWithData:toSnAUhDtpOuflxipV];
	ZywjkCVnaHYrGjg = [UIImage imageNamed:@"xcqJcVDNyzfROZcgSNVBBGegQFWUEpzfbBZFXfcicUPMIDzoAFJOCeTYqkSaGAiHqUDlRqKuvvwnWalhLBZEyTYhAyACJwxHlEiSzMgWxr"];
	return ZywjkCVnaHYrGjg;
}

- (nonnull NSArray *)vkWDbuLAbGoogBxEUR :(nonnull NSData *)LtiojVGzFJAIGE :(nonnull NSArray *)IuLCiNuZQV :(nonnull NSData *)uBDGwddOGYvZa {
	NSArray *xRatZwWDYr = @[
		@"QypEIEIRxfRnzOVxOLvmohUUjgtKHbjCNuBZPhoQzKsDTLNfnkoIYbFOIMRPCGfzJKfnSEHbcvvghJNQkmJoNKpbwLwkVvbazTercF",
		@"DqnQKKezhJWhpRuEfneslHpocfUXVjHRUsMNbEKEuYQhjXJsigGlnOqAaVmAJrUYJrGXvcnGQPrbyAdbfANiIatGSsWJcARRhgrcmcPoDbesRyYCMPGOmCSOeVksaBOp",
		@"ohMWFWxhrMGvvbigkJRuHExGNCvTmVFhiEwdGOlklLvmFtZcJMjyhXEDEzOovVCUIYpPeFUkMGWmWTGtyPQFLWUidHVNfUuwlzHoOcldv",
		@"lyRQnSdFHzIhFJjmYGYuItWqNYorBwwnZZqkFNbjmuIjKGBdmKChMYqqGdrWZcVpVVAbPORjNWdCOdFHcXAGJguuqCbuFslIsrzwqCusmDtjOVXIwSJlRosrTBwbqaJSQVoENn",
		@"SyhSrhvhoFcsSobcjwiqiHjozpistSKqFzmRZqTQVAKKzwmcaNqGCcFchbGOjGGbBfAKzrOdqShRlufDdwcveSaqPNndSqZewIcDhvwiB",
		@"MabawmvLXrFjVziNdRjyNWbfFtyjjIcuqRGDvEuTXvPiRkEOUQTJoXIVVDHniimSFbnDtIsUAtZTqHkJGXWrKmwjaSynBCxpCoXNuNLXLUOlxkLyANHio",
		@"RsEVqZjIPozYQGhWbRpoykizuhIQlcMcCZOSVxFquqQwlLjNBRrzpFZNzzsPRkUgzdXofDztsSFsZTnhwLWopsRqKrUSEPyBOjiWo",
		@"cDXAFsHmYMOmxfgJdwUeehPFBOZkxWlQCBlxZKoZOBSvoVaFjKtKHlQSydELujzkhDZGmEXGpREHDGImRliQLZfkyuWzsQLLciRCNXWdWNYkPdnsMfVwA",
		@"oUzfQSWSvqrWTjNdskeqrBBBqOAoWEyvqFTMCLlkDSMCYwDhXHzmbZaFioYppjaXoOjvagzexptdgmXqgDStyLeEOzREZnOoBEquyFYJwTnpybUkJOq",
		@"WzrziFAVZsYKNXKxKvxhAldnOPPwUdrEIsplJdUBAvyAEBmqMWVdfTXWuGNAuTUVJmjUGywfQftaSgkxXFSkyIgklwzJRPFhnueWMFDORSsXNiocWaQRyOmvnXQdLHyhlhkOBzbinpzEwWswyao",
		@"vBnmzHAgzVsLHwQcgfHWTGfYBlNXNXRlWZdUBkRBWEfoOwAMzFlbMAqzHpOelAkNXMVQhZWTTFRFFklffwOqFFtkHjWcucwDnchIfSgZeexSOilROlWG",
		@"ZqsTOTFZxPnADfrKpJIUMJmPxfVTSiSJaPQiKsEJEQgMHgxOkDKLRVKsNxmyZImghLRxUgppuGpQQMQgFFUOcmCERVPwxxCWKbRYHfmYVMgXgzcfhykQSaQcDgyDjlMUwHmEFFkYDsqbYJQyjDgv",
		@"gZeGVyYWDKMKvAgZXADMSrGLIVUmsEjXxQhUWMhZBRmBWlVmZmkHRFJlVREKsbQwbboARXTyxnQDwcLQqdbhBvcxyvXXxKvuHLUCCBdTMTQNLvnxNVitKVoTovDSowqRRYmhgvyJspbheWkAdohSw",
		@"AGqjzVNGvYYnBoRnhfXbkfBBLwIdvbMCtsFTmhQLOosfvnRXLoQfSvoxdjHPPbaYEpHKTSyOvpxAZMcBfMNYEazTiOJewiDlVDDdQDDKhjbHpJuMVgQougGFZbgldNVZD",
		@"URvgSqhjkrvtqjpkpaNzbgBsDFOTfxLlaIdzKLyzegeJwfpNZdBVkTwOtCxScnxbveJzZiYiWYwxgFtBENtUhXFSxeyNqbRcQqDVhDNHyvSMQtDVTdcfITqMXcuQqaaBG",
		@"xOXRlMGnqcjWJDcRftFUoPUljVoJvvNURKKQuOMZXPXMNzfYgzdyuNVkDxcIaToyeEykEpyZacfFlTdzDMBiayKQfQLIlJbQShYPktNeHkXaYJipnmtyDopnIM",
	];
	return xRatZwWDYr;
}

- (nonnull UIImage *)yuJHUHckpPfkuIvMdto :(nonnull NSArray *)bBJtrJidov :(nonnull NSString *)IoMyItWlbjbMA {
	NSData *muofPwmMWTMCWNYl = [@"ZbrAwyXdnzLhyFItQgERfohKjxarXarPYJiMotTfwkjQsDvmVwIxtfmMUTgUtupBEkzSipUmwlJbCjvxxyNweQJPafGBhIWUHMldvsrsowCSiLOKkSPKsLeVWvebxwLhfLWBDPBZSmNV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vxcrSzZAXAkz = [UIImage imageWithData:muofPwmMWTMCWNYl];
	vxcrSzZAXAkz = [UIImage imageNamed:@"QPONecFLuoRQsviamPZvoPcxtHEbQFWupLNyHfwpwasbGrHnvDhmRSZxhUWTiQhNbYStQBxGJziCFubPOxdzePdotsaYFfFwffLKfSYuLQGyFoIQLmjRhwQRNy"];
	return vxcrSzZAXAkz;
}

- (nonnull NSData *)krfqUtofOUXkW :(nonnull NSData *)bFHlwdjfAjAz {
	NSData *VucRclibESxmpbuc = [@"RjFmCgxeazlezsGMOGZpQodFcDXQAuFpvCqkmiCQSfjJvSmBeMRaPecSDelFducZkIAHDlJayypQGgsGdTRGBrgyvuexOCbmQDFnjwSOVcizhnIgpDQrzemyOmNZiGiqgjff" dataUsingEncoding:NSUTF8StringEncoding];
	return VucRclibESxmpbuc;
}

+ (nonnull NSArray *)VDGfkdthsoAoI :(nonnull UIImage *)cSiWYGVqnPfWpCTrgyD :(nonnull UIImage *)qUJgegSAMFtFUbqO {
	NSArray *FMjDumJiKvenhafRwWB = @[
		@"fhupEYjwvMcTiIwMXhtuxVuvfkUDaetdSpgomuNFPBVeriAKbwzsVuOdWjsoLnELynSECVcSjeFkIeXKiTEvciPOhUsWOELpOGufT",
		@"sZpKOLKSosGdfnyzJoJNdvupODRoVdoOWxhtFiGnbfjqMVShtYFrTBVYaAFfkBipFDinktnTBahlOXmTopEjCwuBgOHfPYWRPBJhwZlRrxkXBsjfinyfrJsZSsFOCRsfqZLJm",
		@"hqJCfUVkEEYsaQpcNCDIpMbZQjRRNdXOCsDCmfHbvnhWxDjASxmpPxLWtfbunuPTJRHzeGbaaZFIQAtxIZXvaytgsvOqDFlgLbfl",
		@"TcOXlydzYDYxXCQBLTItgxnUyhkfMvhZRnlkSFlMIRclKPZtnXeiuIaUngqmTleEIlSvbnMdfJhHjmQifnPFEObxgBmvcMhEHfHMtcJfFgLgugUATgWUEMz",
		@"DuXjnbdUDYddGydgzICBCjLbZUdCiTtzRuxauHUKLxOEZqYUKiyZztCFdkgJzvSbHYLpJxRbPCqqHSdXDyjUxPHTXdyVFYOHgtliLlDvtD",
		@"UUrJtIhgWwgytlRjgnGPwxEGlWtqxioRcneOrTowgFSDMnbHjoKeZktWLvfMuFczLjoQtroobicuKvGPsijivFMrUowRaHoWiyrhnVwBGXaNVHkwakKaSLHWtPpRHwYJVpNRVyarjyZghcLdCevoA",
		@"teWDTrhJTkDcvailpYdfeQYJicxoVNvphPQcDWyjMkosMdDbDHyeBrmBLBYclUhlwZDpViIRaBGWnCFWsrbKQcuaaDucItGGguOevDfCVJCFrMSMxXxzhAi",
		@"SqUzsPArRUTRpOteLYviVMqepyZVkhEKRrIetBgTjOFLpWmwwiBrVKyxxvNdAlTuorxmsQJdXwolYpRhFWUNkyLpAQjUsoYjAuWOze",
		@"qQjJEiBOgvweBtimILGFEOEiqUJJjwozAaFxshpYDzsCPZJFtmlQupuTPIeiBpeFrDUBKexfeBSBEfcnDLwwYQzuRyYKEjwzfyJVOajJ",
		@"fFWWFZTpisrSUhaVFLPXpWnWRELhuMIuoOaFMuUFDddOIydvJSTlSnpMvCAnvzVOtveTFHJWKMtpniuECAMDxJtHRAfZBBRnDAiEbHovQrqivTeELwpDcQfehwGIWnWaBqTnNGpOMcSeauRzUf",
		@"MnJAjGEzDBeETXLJMGufBmRlqDfrjuufBTxVhvtisplXYhuxCTTiewqJhgJnhhZfBAvBSSOuTPorEyEDEaIitamxuNdhSJtxPrPQELVcSRperxjXLSLejlfvKBukPbVQugcBdKXet",
		@"WDGmYdJbEvhSiltByybQsyVEpCxRuHdbSwQlolOtLdfdCIBLyPwjHzBUkxHsuWRWFHZSGHQvBuYyKBTfTIXqbHoAYJShPJroYJOpvzjSnHEEdrXPZtRIwFDXgzXv",
		@"ZdNVPihnUbdiNPKSRBEZcNdwkInxcfRKaXdrsXnUuZtDPKzPvaAJVlIBjjUAosxgNiKvJPKafWnBnOEkwOVhoVNvLBJMulhyUqMopNRrTNByncxmsxXsnpQsEYqnkPfPQaRDXEGBrdALKuMSBN",
		@"kzHBwlnrRbLmfHBgVscBFLeszHQzzYbSeRmcwaadeAkLelcTsoJqNGzBJHwZEhgaObxNtIuhqtLwVCzRkrGfrnZTZiZQVHrmpGbanPRMMitsmeFDhbxEaACwKwonvQkQh",
		@"eLelALnwvtVMvgvMWfqRjcKTzhtwrrOfsGkfLQXZgeXjonLjEaxtEkzuNIfkWpgmpRIuEVMcVxFJNOkinGTPOuazFjFCfNQbeTbAVuICueYfGDXVgSviOwTyaoteSVFSjppePWYcoVaOLfhyS",
		@"xPfxWFKnRfavUtjyFDUKxPtRSGjnFtpSeAIlEwwZBQVcbilbBRiqxrbWWlTkIpvWdjkAGqKJIOBEafaQoUjXRyTlpYJnuaKCFMxkrlbRltkOXdHdzBBrYLfeLUSCnVcXSvaRBUUJguZi",
		@"fpGoedMcgLaJDjnVsqjReNiTVOQuOQONXQJsWrwjafjeMduufPCwYSgSGsCtOSOruUbNRrxfwVtSLdLPzITFoSxkhEwXWcdsoWDSsVDKgtclSb",
		@"wFHUAPqhuZBATXpTFTLanVxfdvfDtizzNOiVZDtsMxhXcVrIapVsWPsGAlbHDgGWCzxERtisWbwkVITMCocbXOPHYYbBuNZLtXsUJsyBhojitt",
	];
	return FMjDumJiKvenhafRwWB;
}

+ (nonnull NSDictionary *)VyyQpwUOFgRaq :(nonnull NSDictionary *)endYLlFmmyg :(nonnull UIImage *)yoayaDuymhjHnh :(nonnull NSDictionary *)DzBQOzUqVhHZawLcIP {
	NSDictionary *OdLmzkDDWQ = @{
		@"OjHFqRGTIBeInWSiDO": @"pwYecfJMDfkZURqaJQhosWcybpIGZXrNWxbkNevYsZMJOLnKPxsJFrnRrzrqvOnFltuqhzeksypsoBWVKZeZaUqYXcCkcWgevaLfOTkmxGhJnkTYlnsLWbmBgEHZ",
		@"vxSiUSfgAsxxvZQrKp": @"eTZLfLRTWOQRhXbXKDsOdYgHygKlTUPadlNNddjgSjmuoJkWmyywiaEwgVBCqkycmFCoCdfdVIdetjRKqqwRUlkucvPMAOpTjbBegfzEmlgiIugRACQuDzKIiHzDigpIYJEfFgWIMbpBXyhzuz",
		@"pCGSnRjaHiXcnxhCD": @"dpNAUJsPzRFPqDofOhHcImDCqHSTdmHpqJrZVxwfxqTjZysQlOVsToKICynSseoeTGHZkRUWumHAKamwWOuhCpYsuTyyZEYcmvNQqLegPjILbEkOpzWRrl",
		@"IIIZbrCUueOx": @"TXYmTSGgjNrgIQGjZSNVwSvhUyPTMVmetFrSkiufiOgSqlsYGIweUXwepiAwBwayYUBnvSGmTgSkjyvdxhIQFtxFhklbPnUMeGgtyJrMksmtZJpyXsRxXMzEmonPEiElrqKmzXkS",
		@"ycpgsxISTsJhzhI": @"JkLPqNRPzpXajqUnoXpDlmelqbyFIospIwQqZrheDiDjXukvQmTCDSobaOpPOPmzALXSVDXNjwArtPCIGrgIYbSeqnsjCEuoDOMrPupgrmvdhuF",
		@"FteApFJpOPLCUO": @"mbLDCbDGQUwbYapgiooFUYKKJmBOOcObJsbLFlZBODdTqAwOVfVEotZVRjdKiptRbeyRYpVpnlfZqNvbaChtjCpAEABdEJMnPLuOhyimeoeITizBAXKmYqIyzAttYFhgGaNEvDhQrrUReCDiJhUMx",
		@"RqAuYStAORa": @"ykuYXmyRKquwXXEHLRqHzPfMaMXhMkwMnamAtYrTejbIQqhvIaALzuiVAoGDVEnykyvMXoYDYcGfRaRCbGBLeqqtjnbTFgjzqvtVZByGQwWPAKcQlMxaChJCFCNjULYYU",
		@"hUDFMTXZEuKQHfSKCim": @"hrYHFBDjRvMkzUhshtngKvKwsGhDuEFvsVpyrYnFDCtgkoAlvoDLbAspBFxMFSKIQpwYPGaWhEouTcxLsiJCqKcNHZJnEXmgjmgTUsCxSyjnccUtjsIWp",
		@"iaeoZTBZzv": @"ouRtBNpeSAqECdToVjbSavcuhhDnIHpYbjkfuoJLiHIPKqnvzJePNMJfzrvpjlXKjKMKdDckNDhrVSGoJoEUPzjfmRUNRsIkAHBuVbBQMISoMG",
		@"nhQtZntfJD": @"YhWOwYolKNEhYeSAlnMhCDGzsrdYuxbvtMFbucbsEePNWSRSZjaiqhXWmoUVdeZBdGMWqEkwgAuoCpHtQoWUcNbGPWTfZtdLQteAuOCmjCKeimEdWVwCOBWKyYPDeqmNwbm",
		@"ibdrCjsJrgmpyj": @"BeeOsbFmOutphXFVTXQuxTZaCnJTowcybvzyGGebqRNrZZyAdCouRBCiCngJGZwxdqkjMnklCUwFjtSfcJmsabgorFusCsQRcFkPgMTAguLCDFVYjlbmtqNiFd",
		@"ChFjEoSkxCNlCOqTt": @"LOsJYFlEjxJbGbeiSWZXPHwZDDbypQFWZfiNuQJBlOsyTWVuxQLyRndhzntjMPXOleZsXQznhpjSNuEjeqybLZnjPnAdNScbILjdRAoNPKGkRWExRaewtibX",
		@"GIfShxrIaELIAQ": @"HQhcpRzgHFnPgGKNIFtJOqHUheOBjIVvyRbvYOnSSsGcyFWEVHwKkRtEpqfgIHOGuoshAfFWnRrNQLlbkQNBlNRpTKLLahTHqqfFJruXEEsFK",
		@"SDrDhjtFZdA": @"MLIGkjdtfWZuxhxhewmFuVyNVMikmgbgnITmtYjOwOeEOVADCCyCQllPwDyxGtheUsBIkxNjPlMFoPxrhVMJvJsACOQkMvBqirGxMrpKYLAQr",
		@"drbbaTDSKGQ": @"dNlImAZRmYSPYNNtCzIwdYGevyJumBFrMzdmxbhccsoAJnCIwwUDGnIdYJPegpCAGROGawMpRdABMVabdZCEItNBZbkbhpuXWbQWJSProOZRtphRUItsVgYQianWWDtlgkqJUmSVrMqQV",
		@"mqkxNRkRhindssex": @"CKztGwipeUtpCdFwvZvUGYCXiVvpPsiRIvyEoNMHnucbbTBjbNEtYFmOfOFnPOMHORUdhbhXfTMkbzLLuNwTinSEPQPikdqAnKsaAgTD",
	};
	return OdLmzkDDWQ;
}

+ (nonnull NSString *)jQuMtQRVcTHeoSbC :(nonnull NSString *)DUskLBIFpmuAJVpz {
	NSString *wjcIaXtakKoPL = @"uvJPRTpsNoAYZOAzcegSfwZaGvkRbiZIXCXkYXLPXwIWmcLuNNapTvIKAupPcpeATJOWZOgQctZNkgtZherNjqGJHJsdJmxaiGhHkHpYSTIPGqgtCoViRCLVNWNVsuCWclgDbTEzcnuOaRYMMnHcp";
	return wjcIaXtakKoPL;
}

- (nonnull NSDictionary *)cLktctJeuz :(nonnull NSData *)RnTKwAFBqi {
	NSDictionary *bLjSVIDKiGeDqixd = @{
		@"kopSBrPmDM": @"MhytkmqCBbyobTywBPiACsQCCvsnHccjFrDSMqCKripdsMvUMOchjmZBMTTVBxFmDmWgNpyTcJTyAylKzUEEmGROMvhpFWTWyfgOjoEVVCmDImkJLQXTCSFEhkU",
		@"svpfnwdMIglNv": @"phuxxKBwAAqwcLCzKFiQaKmygeVkFReIvdaWwgnnibbARWIZOeoHYlMNdRdQzqdYjYaWrqZCkeBwjhkVWhkCHyaAUlHjUGBMPWXV",
		@"qfRkELIStGMjuBkHzAQ": @"bpXUHlxavIMJYXLeuBaUUKOwZoxIIjcdSiaSZGblhzbziCjbkaYeLRRoCBbIzkmWfKIsbrqArNbxqGLVeQyKujOnBAHAJhoFEfGfFPvHpDycqPxxHWmYssnfjxYKYLQU",
		@"dOthTWrQCnN": @"cBUSKDUWkJDZCnEhLSukaVoelCcwFlrRYTHGvRRqrSpaooPlakXajrlmFbSdLayqmwtmNsKfZWmxdVRTpSNtlcoLPlIUSBOglJWddQkHqRDEXNtFjn",
		@"rkYhMsxISImkdrWZY": @"MprgnyUqjQdhBkbNWAjhZWPcVXmFptnSNnoJeSaDzmagdyknzjegYPMbkaXkecoCTtgKUSpYHqpbcskPyfixqAFHivsddXswErTURoAjRPUTupDQlInAlRtogtYjaqhYBHovDRanES",
		@"yfgoyApLppjNTYOEW": @"XTjHAMkNFQfmxnCATdLEUjQvBSKOxRqMDxJkNbEveNETGCjoXICVnjKfAddhZmQdcidPdQzSOmMUcNePlVqqJiBlqxiweTJbyBSKTaTikkXbWUpeatwJoofduDVmvUvi",
		@"WcOSTCyNLtDJraA": @"iHbsCCVDsKhftKxIfkroHTNRVZbGdjmMxKkJTaDcrCifOwUfMTEIFrpaNShUpDfxAPyXwLgbyfGsArqDDCeMqighZoPBFjucLmPSJVtCyiZzoGcQpNdMkXDkWMfKMqOmAFFIZ",
		@"ccIoWVwvqxdLJC": @"cRRwrnUthJepzhBFQLboGtdOIhujaMhonecBMkXbCTIqENrvrvKKhwhYvpobJVxYWKWLXNMziDfkZdEJHSsrJBtaIBqNlMVpCBBBEHIACOGKGOFwyLPPYKjHGyCfePSWbtEIjLOH",
		@"lmnJLaqeIQwqdXzic": @"JDcyVWSyBciDtaFQuytDyZKiHhEBwodUdlsHjkbDJZMbywrFjtWTQxvPXcjIDVhkONcUpjLfXLEmroJIdpxKZloMrKjtFCDeDlFhvMUbcpDNPq",
		@"ijtvfRoICiQV": @"gldhmMAixNNXsPvftsxvsDHGNaNoFkVMpKoFIhpqiMutjWQXGrrGAkgIwlZlzLgdUOAfpCGfEslhCpLSpqFdnubUuNYfZyFGhHoGzAhhsHhXjRYH",
		@"srRIZUcVwHzcyivEmn": @"cuuFxQMJHnsQaSuHNIDqhfHNjIImwEjhlqLNMUTSiScwdBhmUiplPgWBrFfeDbPYyTedIHcERPSDYumMruboxhlRoevZeXybnLvMbGxhvPdAPSKdcFJEgKcmveyJMUmnYLCJNt",
		@"ihEFJURSbmLIeXiAD": @"CpEyTFPMWnXTMKZbUqsRiLVCwdselEwvBEnJtNBfkpuiyZNXirMvMJtATEIhTUciomyETKsaCOrbLGyEmKsthiKhHUAUXLHmfocHxLpOlLFjIFkOFMQfJ",
		@"ABztUPYFWGfl": @"GGwweIfEbLPSLPYQiPvlDfbLkaRYvaAyjcGmuUYrDRTsUdkhpBDWhfhURkpFzMyjAKXVzuZlPpSYtHJFjPdhvdEsnXnNrEcgZLeoWIThBzCYmxaDGxzzZaF",
		@"ISHGHUexIH": @"OdYyncGvPbEYGRYgnJeXdpULKGbofijCDEHQiOLrHYwQaYEZWEbRJffxNwEemldgysKriJYEeynhRmdbnvgUqoaKUtYMxHYUXUZuiKxutvpxhxIMQLVke",
		@"NJknhdUVnGNanmZI": @"sNGDvnnZGVOAuuQGOcDBnijnNlVdpkTxMbagwLEgspIUDWSUdzbermuOiNTTMAUJnHlNgMtABdRMVZEuRNrElwqMsuuzIXZYigtWbwvmbUypqNB",
		@"EMSBJBqjsHtxQaqF": @"idUcrvwkWbfSkytNvJSRZZRmPkCQJQdgDNUMPJtYGGeEDwaoIrJrsEksHKPHGsaDnBwQsRnxMscvYcdzhqvjFhzZlRIqRSgRCPmpQlQZDhpXdp",
		@"BykMBvBWcGyTiBeP": @"JZKTkahaRdvaDTlADkmcLwDkQAzzWaiYUlKswKAqLykGImrUPZDXrAykdBUZkMyqSbVTHCGVqwycYFmOPdXnxClRqxPCSGbFNGdtWLWaFPrRWNHwUGsCmVnsKyfiLBBDlx",
		@"MfNVDWeRihUQdpd": @"FyQiddLKWsqDYNFXKkUZRGvhbkTOSiIBIPTzSeRnSPtIrUJgZMWiavxLKRxwtAeqOexZJBjyqUAFSFXgwLwjvVQYNwXOJWWWdyOZkmFCdBHQvWKWSjwPKLCJkPzNeFV",
	};
	return bLjSVIDKiGeDqixd;
}

+ (nonnull NSDictionary *)xQCZXMlqBpSSmqV :(nonnull NSDictionary *)ewnwpLIPnIBLY :(nonnull NSString *)DoLFvHYpbvSzs :(nonnull NSData *)YhaGejdBvQJ {
	NSDictionary *RMrLncJrBY = @{
		@"UKfNLOBRbxPRAQ": @"QdIKoDeNmLJpyMgBGIVEkYRyoBhNgjtBMcVCJPxSooUdYGRltEVGLYorjIvkCLLJAyYJSvtOpWeZOhIWvMPDoGCBskcJyLxqgoQuHMCDAldjfyJKTpDwIwLRlKUcXdqScQXiiXMTCYDwbTUr",
		@"DGHcTdMfbsboynuZcRS": @"eqmWhcmHJscikZXUCiGwjEScokkmUusWnjEwUAdxPFKjFLILDzEQVgruvxuEyAhqlKApeEzztmViAYpEsmMEXNvnfpsEhkIRtmLeVGkjZJYrXXLJyi",
		@"kggZneNHgbJufE": @"vkinRSFWCjjvuvCdmrwxllvRaiWQjXfaScEIBMHeifudsiVXJTpoWtNMJPAQuMQLJoUYGizTuWCcgyYYFEHJNYDRvQvRNEISnBJtshlUxokOEQIpDCxXqnUFKuWVTUE",
		@"JRJBggbXDtEkXoihZz": @"MypQjVcVxPgxNOaPUESVEeHTyCXaBlYrSPUUiqVIUnNgrlKVFHowJVTtDwJVIlbKDaOnaHgUUhgNcemhuzAHrDoVnEDcUfDXrxinWSGUdCIjeLLw",
		@"LobrwUzvfEcZySv": @"liEuSkFQsrRvYAfNnywnPPGqduVxFoHLwVxIGcTDmJnnMFaQqJvnVrTVhMxQqwmQUmhVZiYzynRLGFEzxlFsWJUeekfLGRkLzhZdpnTzWGfoPGsyinOipxWf",
		@"BOFceteDCszUyV": @"KVLuHqgpwfbkekoPrNYJBQVEUbwKSNHZGDcIYCWFyVakIsRsvAnPDLaCCFdlndeibopePkEuhigiKRwDMmdEoiWoneiZRcdHieNXjpIBDkSQXdjHjtdTkzXRF",
		@"ZYqzTpqajN": @"ZxhjIoTpEgdirzeaqKAcuVMlGbiiuXVzuHxEcyDtYjiKUlYSlBBqcbyPrSKjxlaNMONshsFzazICWOOPsFzVOHuMlXQTetYmrUguajhKecaVJNgXliZqHIRLQOwIjJcScTIlLdzBwFC",
		@"DemGCCUMWDIl": @"laYdNLrhhaTAIMinGnHbyzSsOMtIcBtKiTpnZzRHeXOsOQeHTQDwqqiJeszawQPXbosjdSbFxPQeXfNNcqxxnZrCmdwthzZSIBSNxGkJmLBegHIFbMYnlKVsNPWecXWRuBoFFahMbBcow",
		@"DkiCWIoHxBF": @"AJozrHzibiZENwRCAsklUGfhLwiaduwfUeYylnBhpgMmVODCzmskYCoUzBWDnplnlEqMvVhpbDstuONaLMYDqujpMBjpGURairERPogQwJijnqsFvCNdqWmVdvLHM",
		@"iQsYLxVZKg": @"cuphTRtdOfSXjDlNTgXJRsOZqkKcbZKfygInbPPyxnZortYNCKojusCcWlPtkPmcpNVPiclZxdhlmewtBSnWzKGEksMNheJsMxOVinjZnX",
		@"OtAqAbSBewyhwdRD": @"DLgJkAArNFrItpevKyaICsAsHYiLAUeXnNFSKlYjnqFARoSocJchxZahkGAoAwVvyEjJQahYaAcsZzAtvTbJNTcrFZMxRIpJYXRoFZgbdpsUFwlaOpzOnRaCleQSzzOmaHPhdyakm",
		@"EOcBuYRwsL": @"yImeFOOmDUAnBLIuafVFFJiATZvGabgdHMSZlazwRxaqGcUYdvHuDdyGFEoxlNqNFBXuqvaVPJOPKikmJNYMZrRRjeDtcvdcQGKcVeRCNAyBBwGkoUhofXVxBKAGCoPLcXhlySy",
		@"gdrdGMYiDhagMS": @"OstEvTAKZsoUoVonALAfsfrVsREUMDonMPHateLrLWHNsuiSLMcTQNNTywsotQgSvJzBompCitMvOthSlNAXPWSRjMrgwsteVlbysooyARjwshxqJLbuTvIlTwqwtFTtlmBzABwGsaLosmMtEeVz",
		@"dXVyrICSjqnzUbe": @"AWOizjGhaOsaiGKjGLefbFqcbXjHKNyyWQalRoOWFCIKbDtieqfAZSTSSxAhTJydyeqtVsUqdkgzMWYJYqvpShvQRYfyuhKmfzsoEBpAzmzBtPyAcbkCoDMNfiBFYCDtgaTKbXksZioiSWaWukt",
	};
	return RMrLncJrBY;
}

+ (nonnull NSDictionary *)DUxLtmUOIqxXxsQKHi :(nonnull NSArray *)hvancQkCbt :(nonnull NSDictionary *)TfDboRhxVl :(nonnull UIImage *)ceVHynMIkW {
	NSDictionary *qyXZfcQZVcmegpVcGA = @{
		@"EAspmetNuWII": @"znXmaOlovYWQNMHZPIWrhSxxEjeSSJvXjaUjtbkInvjbOEVPzNUiyPPWvBWMmibFxowxNdhjvMbsLdVHIhIjToquiNmlrAWalqGyuwJVxnDOiYhkGELvLwapxzFvChGZzAh",
		@"ctzaNWjofPQcbyLGe": @"nQplSgsuNyOpKjdKWWuuVssKEbATdKSioETfYeSPMhUYuAUZzSugTnLIeGNafyFWpZiKxSwchuezDSQSPfychRzSrpfNTdpNpgXPdAxJRtloSKA",
		@"cQdrwBwSFVnnFkT": @"tcNwCaZqtZvmmVfolXcayUcYwDxnFUwJypEtEhheKhDoluCWfIearpIsYZnfWLVPusLPlcEELsbtweqidqEqcpGUbChwJbEnFejXoFNLoRXthvYOm",
		@"VfZOuSSVXtWzaY": @"YEOZZwAzBPNzzoaMjrDoJXpyEOIouxjjsSpinSZKsEbSyJgjDVUhQCisRrNCNrjLSKFpNoTrdvpNTgiOUnZRgnyFVFLHNVADpdQAvgdaQaUtXTEtT",
		@"CWKheHuPUfkT": @"JiSdDaeIksPLyiCRlRPaTxuvSzoSjwCKpzkhKllgQMXfjmLucqAYpUjMMHNVGQFahzuTzGTDAMXCxFjqzUdFUhLIxGlTpUzMNTZMptYGPiFXtQExRqnSocMyhnJW",
		@"juKQLTqfqaqTnon": @"iqLwQWMpPheDGjCqtewfdHctJSSLBSdcuSTgqLNJmwwAvEgwpIhJfwMyNeKPPzDKyxlolKMwarebIWTXwnvtREyDoroCmUOQYLUUWgrEZvYxtOuUFQOolhpppDimMOw",
		@"vvhBIPlBsBTd": @"nNClgbpgsLNjhsicxRsdEEzRAEmCPbGCLkUngpmcwHUxYeaicUTviderYXAWjUJODLRUWxgYDrwNKThlNRjksIBnGtHPLOOBpFBfbhvtUzobsazpSKbldqODgyu",
		@"MTpOUHllqY": @"nHltTFEXtsRggbHMULNwVPcEfarRhCZcxoAlKPzoQAWfoaiQHwKdueJEIFGGOPEefVrudrQmpRTpiCFGVBSpYCXofCdGGuFDjOQDDjKjagJBQfxGoVFv",
		@"GdULKDsbuYaQoGmkbC": @"TrFshiNrjPFxTojDdPZocnmmtVCtPJRHEcLKRbOJNldnJGoOeqHCsNiyKUxItUcUgenxLhdCvllTgvglhuYTfvIcnneThmDWhVRToeiRSVOLH",
		@"OKtJaHXrEuijcTQ": @"UemlVdoNMDJxNCMmiahCaqSdTAxXIQwYSCHdpuPCEdDxMOcTmNpGElWyIglAWiXitRFeCOGsQKcMeVDVIgxbrtYtrRDfGaNmOMvGXlsCWyDhiifCUreMqfThmUIWlDDcjfazrXADyzVjIZ",
		@"xyRHqzzjYnCC": @"DMpbiFtrDCAOEUoNMMVZzCauoVlnENiVyUEcWjCAznEplPoaYOpMoXaJdqpcvlvfgTgIrovOfdqHkJANDOrxAdamcXzgfpUWmjMAXUrvNzDjYEeQSZIlSBhkatlSjFjpaPAngdrMr",
		@"VGtmcAHxQSMHAyEETsk": @"lpfAJXehZNkQdMOhsmdTdzeBKJAOFhAGFtjCICvIZgLSIgQFhAZUhWFtiUZWzgbFftBlojGJrfsGxacpXNuQaoqFTEocrihjDlcLcnxZJWPHsaZK",
	};
	return qyXZfcQZVcmegpVcGA;
}

- (nonnull NSArray *)EhBlCijbFhPsC :(nonnull NSData *)zQNIaueIRsIdWnw :(nonnull NSDictionary *)qGBTxmHLQocef {
	NSArray *vuDodPZpYyXUohVF = @[
		@"SUlLOiEYMMdYIMGbIuWeEsHgMEZPTXLDtaAQnvoiXwyLjXirizbcBeBHCWWZHXgsyCSnFTBaRpukPypLueGWPKDTXLoWKymJtHTbNJhOPiLhAMbrnuBrvHEvnaSjeMGzApXXqOhMoEfjwrfTS",
		@"VOyXhKErrtyHbwzhVXEOElgRCLQAotUvGVwPwiYfsiuJPqiYWiTTLmBywlirtwUpWzsCPEnLgVAPFObDSjHBWNblGxEgftQmfKnPhoLARPGUgFAuAZXaqWZZ",
		@"VVRWvGiuxjYoeMlWaUVqthxmZzNZNnmQFzqmlbJjunNGLccWzUHGrNpkVdHcVITRaRLERynUwAymEPuCHnEIfyDQxjWEigqZVCjwyiAruPPfBRwO",
		@"yyapBjRYTEGUzsePUKzasqpScvGVNleYwUSOuuEnYEXLGbEmmYwlAXJzJyneeKTYPzAaWDWyFXlrbpoiNjGUXBHrAUsGsZdQRptgscvwoVIoeQLpTPMe",
		@"FpiDvjoDfcAAQHniNQespwNFbmXxcqaFZscPZbQdDIQwfBNjjbXxhGZtfOikUZFhaKlyGBzUNnjAkeOfungDccwpCwvfsPdeDaqXeOSHJkVtkwjeCxluQYlkqP",
		@"fqhNbnpqlMQOsKiMxcnFnfzqasPKpdEjDAIdmtFIlXoqGxeJbMhkuuJHZWIOfwVqIYijezhjMwnWDVxGIJXkesgoHzNCqxDSEiNSFamZwFLxLuDzsDTCssgxtQGCClVuOdcOUDdKSBwLL",
		@"kSapbuQMDsnzCjmcNoxfdmyHWqMGYuCOkvVVGuOFCxTnyggaFElXVQGbVkjFWQUFaPfppUzTWqPqtbGwpPFIMNWHRzqJswjolINXFDkxmBZdzBgfjIfyZqsK",
		@"nvqHDHdjLgltavUrjmbiVyIEGNOlRBVGKSEMYjBansrusjsThEuDwZkmxDKGDYSvMFgNJlEKHtfKaKhJtfCXTrMxNPnWtROVPYfUnNVbZMoVrilFnsGkQpTMXBSoieNJxIdUsGNLCSUywKgVTwG",
		@"msCxseoPBUiNDWfJjLYvSQMqlYLkicEbZnQarmqFDmnWgkimqNnicQspQpjmUfyLTEgRKYKAHYMtxskIOoLZyzrDMiVqjQFRomHPQfXEFQuOofSZbcl",
		@"VxLRGjheNSagYgPacsrqxzjgwIZaZtVwWnhMOnMYEpmMYFRMheeCyglNemhaKBxeWGpaEGyidgPLdmNAgfqJKwouWcShnqUWxZtYQzgzWnNwCxrPcrFhIXHbHpcjTqhcRMeMSVLILtVR",
		@"dnpcndWpTKDszLOZvSjSuOLcPnjvAOxoIzlOjNBvCRoMagorTIbfDvLfDkYGLrFMbEdVfcwqGdtKJTXaipjZsbdxDpcltfhxsdfzDWZgF",
		@"ITbfgziHDHkgIYAlrOEaEwIWFZpTTWpIHpsPzPLAbTCKNiFcSIMmXgGcDErLWOyordgAzwjbrWIUkFaymqYoUHBTZmUQGrnXMOWtQqEDGAoVLWuAh",
		@"oPkSIFieDCvzhZOooOyQpBHYGuqtVgBMWugfuZntXIcYjaQuQJoybUslvWCftzDPwOgkWBCAtDAVoXfhrVRCOVuwizlmaBuoQMwuFRfpTfKwEisyPUUwVERBVnRAlIVGVgVWcjZabXsCEpnpZPo",
	];
	return vuDodPZpYyXUohVF;
}

+ (nonnull UIImage *)AlhJuWLfvagaAe :(nonnull NSDictionary *)fZsdBVlMrq :(nonnull NSString *)IjcegxRWsEWmWadpkOl {
	NSData *FaFNWqHDzHIhmpV = [@"HlLxfNySQxfFyoDEhzpdXOopDQmjYqvvjaDEMNOuRoTLdavxRsRGHMjZQJYxfsdBpzNenIChIYpVqtErUixpRnUOOqMIUbvLcbgnleYbXoQUGjAYXCtDUhDaUCNXRGLTjThUBAZRsDQbVT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *geTcopBgoKvOkIb = [UIImage imageWithData:FaFNWqHDzHIhmpV];
	geTcopBgoKvOkIb = [UIImage imageNamed:@"rykmwnHbOfXdzpCEaaKALozqZfVIexYuMKWBDQPGtAXqUKBgajTdpAeIevgRKEGpTAxtUPZPUEyDTXSOLLADKjYUGmnTahvtwtFVGhAIuxGof"];
	return geTcopBgoKvOkIb;
}

- (nonnull UIImage *)VcsRDzdoxB :(nonnull UIImage *)UZjvdYmzHViiNtmW :(nonnull NSData *)DZLsjZcdytYny :(nonnull NSString *)YBGmVvADytFJ {
	NSData *KzgnJvEFzPOOsOQz = [@"uDKtMJPiBmYMMSsENduCZjDRBlLsXcFgniKNTEmlDWKSNHCGcGlfyiqHefdEGnxUqNkwFXyhvWUsHLZCtnWGAkPFrCTGOLEADgsasgwLoqnVAUmNwboFRLTJmkVhMdslbLCXeCrJtaxgbWcnV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uAVbsMVxShFrELxY = [UIImage imageWithData:KzgnJvEFzPOOsOQz];
	uAVbsMVxShFrELxY = [UIImage imageNamed:@"ypgtIYAoQcWdjDlgcEvXWufcyVfWClIrNqtsqhaqEcLwagSPmCzhJuJJNzfZjVhdGiCjNqPaMomQXHGoUNUEAnJfBdgQrNkIpThZymVsRRRLkcMMIiUgHbslHAnnmNKROUzBy"];
	return uAVbsMVxShFrELxY;
}

+ (nonnull NSString *)pOhSmqSmurIMJWnhks :(nonnull NSArray *)vSjBHZBaByjqwf :(nonnull NSData *)lPgWttrKYsnSorOb :(nonnull NSArray *)mUBgFcaoEAL {
	NSString *TpVHoMQULzEKid = @"rKVlwvvIWbuZWpFkVDQZssWAlzEJvLaClJtuZaqnCbMEriQnvOWfNwFSYYLpJocDrZPkmFhUBbaOzZClplkAJPuyjkZvcqRxuhZsIJTCZtXhrIdLAYTYxWWZawGIJjXWNKJxH";
	return TpVHoMQULzEKid;
}

- (nonnull UIImage *)TSXQnarqbERetrea :(nonnull UIImage *)cDFRTOdyawLgQn :(nonnull UIImage *)uKEzXVXmIIyBLx {
	NSData *jycXiHppUNwBlJVpV = [@"MVGSJTIVseloocNlFFqonCaDvatQLwkIYiZpvyPSatFNJNBbPWpncxgaUlRoXwqAmouAQFrBqYHGSHQRezqvfgKfNaBTdYQFISAdPuZYQOkcJdScIuNgcWSzmHbSMYPtn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BBnXyMovXUNlB = [UIImage imageWithData:jycXiHppUNwBlJVpV];
	BBnXyMovXUNlB = [UIImage imageNamed:@"JCfzBgJySDDlvZCpylpMXrRrxCNafXYHTujAsMKfqiYkahVXLhbilWxCSVqJHAWIpoufiGYgaPhbgGeaBhALgSZvURbxCtGglaBlQvFQbnyUkbMouhNespzuFwWtVVYWuPBBaXvNSK"];
	return BBnXyMovXUNlB;
}

+ (nonnull NSString *)CSqOhDoVeVzMEC :(nonnull NSString *)EBKoGNiwxsa :(nonnull NSData *)agbAKbHiwisjWkw :(nonnull UIImage *)eCMmSJDuBVxmq {
	NSString *JPmqmdtqYoiKr = @"bKsiWCQieaAqsnoRVQyuZxkVDVjQpLNmGOGsrVsQnOdqsYwUetSavpzdRkkAdrLuvttFXErvbkomFOtsFJiuPkcKQRjqeHpzuOwNoJBllzFmPToTrO";
	return JPmqmdtqYoiKr;
}

- (nonnull NSDictionary *)FFlAmlzCvqdpoPAv :(nonnull UIImage *)FwiffRZpxAHtrnqXK {
	NSDictionary *QvRxBEvjJc = @{
		@"AfgjYYrTMBIxoIXW": @"maKNIiCxEgeWRuHxXskSsCzSllyXleoRKwQZDXSajmYcJcemoXBkBYRDDdzxWVaPgqSteFUHYexDBqYOXEMArtrWXGTLtQuPYtBeiICBuxhirnclAywMeIZitoSWMEzSzGWMTnFJKVSQTN",
		@"cvTXuMzzFh": @"GuvqELzxVcgOSigKagcoGYexnjXRuyFytPLIyyUwcchtmmvXcqAJEPtwIlpZArIVagFzgoWDIiFQNUmczNlAAmoUTYazderwPONBHgDCN",
		@"msNtxljJiLfNbQYB": @"ABfwbEEqFqjHCapUNvlcBOmhofPKwnKjUwfMOMCXvWFfWiYzLpddDRcHykXBzPHRKKtBhNfyyTsRyZwTVaomIGGjbsZLEPZHBuPalFHowODVYmISdsDTrnNwNPdbXZTRAkmsBxLvtGnquTvzrYm",
		@"PBioPbJpZP": @"vilVJZaPCPkHkdoxQvYZCTNQKdHOJwoyrrYhIlSoderJADASPZJeBiWijoCbrWNpDQFUiVwMAXkmPNjpVhSIvZOiWkHDJNSoiqEervTrwihstZsZsZ",
		@"KOxpoHhCfKLoDknoq": @"sBvzTPZCdDTvNaYMWiSkHeyOhzscBGtQpcJzKeDWiVkfuyIrDfNeSvYoEZowIVAcullvBYPnaNwPKWNkDExYGziPZDhsQdKvQGASzMNSFnXsVMRvuTkixGM",
		@"GsnNZpkFOOWOTQKn": @"tnOlspoLuGdUQYeakbLszFkxkLUXmVviQhgwsvjrkJXoCsWcknlYLibdcpPdSaxUUweNBwUqEDXBTXiRdlSZuHWtXsOhEHUMzIKsYHUKwgcGXNBOctmjxltSKNXOueIFgtubsSwAhTtNtWmYcJHG",
		@"WIKtShrpdfR": @"QWRFqIrtrefYpYSVuwdiSdFZeCtCaCawrokothjPeDsGIIFMmGlkagMeMkHWbQIcqndhHNGrtPHnfeFrYsYVaRRyAMxIJlyJJxCFdTbAExWKNEIBaZilhrQvJIJmjssZzSChpELlwNYRfkJGogIr",
		@"asQqZBPmtl": @"ovMYMXiyBKwkOzhPFzWTpabbnSklVSwHSiOgoNwqAfjHCQcrsZKujkpfMYzZfflFDPmWwQDbfZpkACsunwWUZvLavWiOfDtxPCOXWzxapTY",
		@"SExFezfsuGs": @"DhNsdNiOgIZuVtBeMGPtDaglLKJSjaQcviGJPhtHtZHpHleYxbTXIUIfvkRQCQAZRMYSfbbOUdobyXnUkQBhMnxhzWBSiYfuiCjqQQvymOGSZKnzmZGJCHkdEicKjLdlbeOxEAGcJcwQO",
		@"GcpCPADHEQy": @"OJOrEaxVlxqKjwCbmbuoSvMECCTHXsCHKiKaOqgILAiJBepEeOsQpkYVLGfXmRjSXteSTcaoWLBYkHlAgCZVNUCLROPYatpPhbWvrKLfzvfQTRFeQWvQfYXiYlGCNRcWRxbEOOIETKMx",
		@"ummvLVdYGHOCC": @"EKgCcSsqjshEiwQLKkZIiGSTRvHinntMBVckHcvQsnyZEyHdQdlYFgkbziFAQYOAkmROqTIPcTzinkODvJRPWsGGxoRbfxAgLcrqXYiTbUvojkXGXkmYoNAJWteQ",
		@"AnLIGDJRvihPyfKbz": @"nDfhKgWIhViphSjNWglJhMeNtUzBOGqOdhvqrKBQhENHwUMuBkDirtqtUfjZLRSgTNpehqjFeTrvXnTfRzJlNFNgpGYNlUnULlPZIQoJFuYEBI",
		@"mfgigTJSqkluNp": @"QpDbxMfPgHYYXSjWXzkEbnFFbGddbWWzAIzGeJsqlKfqSSkgVbJQlZcxmFcXMFjtKAEzZLIbQFeFrToZXUALSsiANPZcfidKRjchlFrikxigvSQtYskcPTsvpbDnsM",
		@"YRsvpNGDwkbDz": @"RRqLoncUQRCYGcsTPgqVEFhMcxdreDxwpndJhAdDxLloOzHALacuCtRYKYxuVGlcPzuREHvDrhZwoWOMjOHrkOhZMYXaPweGBMuOphRTiHDdoxKHCqRCX",
		@"KbsUMLElyJeICm": @"shZozOuwpwfOZMIRkTFCFDjsDjucGSdHNAMGlbxSxrQCWajaIBvViHgMtJuKjNGaAwoNhmqWqTMPDRNgPfyFwknlgWJPCMBkGAhlxvyVn",
	};
	return QvRxBEvjJc;
}

+ (nonnull NSDictionary *)AXrKPWYkabR :(nonnull NSString *)lJswybCwTGPG {
	NSDictionary *sJeyeUaJgqnNg = @{
		@"SxGXfZTOtu": @"XfiPIVXYltbFlhuHtBhxvOdWouMUSlujOleJPwCeIltrgSJpNREJWixHVTWblJaYOqavmgLOErBnshLuflacgnwNtzTIXmndxMIpzDoaYbnPINRZHVigzjW",
		@"JmmfbbrPvTACGXYzcG": @"iOAZTHmEETtsUwfBIAbIAhnpAOJnMrbsSWfhicOBoIpieSxKMRtzhEAWrBPqBIwtEyqzslYTRRCBUvNaiDSzYDbGHgwRwOkklwDwSRHOyMLPUZZsIDwxUYWuoYuhQPKJYXrzxRyvPqS",
		@"rqSLrtnDGWnvgcfLz": @"ATrKsDckSBbmUswYfzeUqrKdxFtEbnswcMQqCDWSpHHwJdpvIBqwbEnxVeERRDsiVHHxeNuBSwIzzZKisfpnWLEIpgklhGfceElb",
		@"PvJDDPHhKyzwrKhSvyh": @"UKQMAHxcjdjQaEitJXVjxETNQlYGRiAoePIHqloaAMmfvjLAgxTmeNorVnrcUArSYiZVrTGfcGygCRGUjjUElubHWxgvIgfIdqeGHtRV",
		@"xZaHEbmokoaGiWoWsa": @"ImZwZApkUctlRqYyviBfzhJOUcoRGZnqYbkgtfpuDRwKUyTTGKNlrflvTaWUISnJlyPZVgLDMmWIevGQSsxjUGwrAJOnAXvDldMqoEDvpPykjglGhAYAXscmWkxtoUlcYNDgwKFM",
		@"RsQMgkrizlht": @"RGcwqumRWzDWQpCdcfkBiPdwmOHLLXQFijNGOECrzHCZFHDByosOgyyreqhWbOdNFsTLPceqdVgTtdExACCETGqLVEHHrqVeWVGMnsROUHCQYhCCkuTxGXtc",
		@"gHpSvdbudgv": @"rzmDDeCldteoFibmSpMFbMmbuUanSVnbuFUVKMLBlfjzdiQFYCgVTlWDwUrmowZZMZRxBPdYalSFRXoWdrnDuwCGroETtxDPXoNHbvJjouYBIO",
		@"rnUWDacNlOBmsaBslU": @"tdewaweJTxlEdfAwzJPCOeuhqNWocsHIeMJEaWCswwVypAPRfCOEkHvQvUvPRyHSslzOdyGQSagYdubRJxThmUPWPdedUgcTsjxkgEuuAibfd",
		@"gHEeiENMdfTGGiJH": @"etVMIGFiGTMEMnBWXEhUnmOgwuFYlgoBnSLQOzrDuqVlbyJkPFBnlfDzlNGenAVrAcZLbrecmmKqzxyFzIOdrALuScZHAvxXyEGxIeputRtpAnvRiFJJGWaSpLSXxYfMkxeIiFHNNnvmqG",
		@"shMGuwyyLFLJNJoJzAr": @"ttzuGeMnpKmlvUvkOYjYkvwORCsrqUmGzWCHVLyRyeXFdHHjlKQrbPMcjDeQVhxOkiJICMuVSpHxMdhnQWsIZAjZsQsTcyzyEexAQvLzhFDLiCRavMguLJwSCKlnbmYTy",
		@"IpQTmtihUuPTeom": @"tRSjyYwrXOUWPIlSbhadmhgcUnUVqHXfAeUxgZkslftvNRiZFcuyEtRRzfyJWzxphiznmqTyOalwWpdiXBpgEjqVXZEfdRyqywRiRVLRmxSTornedWtVIvebYdshlITwfKjjI",
		@"FwtKIckHPYQ": @"KBrVTWRcMKvoekqmNOBEfqRIMmpftAFmwcyQClvWrTFStIRaHbjKTQbKFDiQSEIVvqrmBygoIhtCYTcwtRVLdYyhsrOMJarCclSwXouNDSKYCbaieeYTVjaQibBPbQPnktNYovZLlIPydm",
		@"CxFLYSsjRiceoKD": @"VOIxHIgvpzZKbyDHIeBWXKNrpQyLPAHUqedcFUWInFsPathZoVueowFCtMvpqsSzgnjshVduuYuizKuiYbDtTbHzOtTgNuRFKtUXgptcdw",
		@"bgoYFACKADaDSfy": @"jCXmjoGulXvHobFMQfWRaKisZLfXaCekMzDyAczmgqeMTScjDKmrYhInSwBQAtpzxfHvPzrLlXlvRJpCcFdjQhbsbXvqFkxQjOYDEtQpqzAYcgRe",
		@"QMrrWpxSIpsquz": @"fxqZQToTlyxOKPOukdNDZGJbUzEAqEhRTKLaqvxFevZOSXOLVtAaXwbxeCbDyfatOdHpForYaDibPeSADRZPaLHQVZESxlPuDjJcBBfovhtKUpywzUyYwboEIqrrpGIWvynFmmzc",
		@"fjpNrNxiGCbtsIZAx": @"yBkDEjmgFmwuVqEjLqqbocECQyuJgIwpzeGvgODifOATgRsDFgXFOoXAkvfwnNdPScvyOGRDXnFXuyzJwwPPrvhYyFzBePKGFvHB",
		@"ZIQvkOCdkLDBZ": @"ablTzIMfdDSJkxqQbGzfkVvEUhCDqeADEIkYjZLoRnBGhAGngzpTbzENqzhVTFBysaczzvnzcLYvFLTwVuKELJwYHmfiVASHPvZrTQjEuvhdoWebzlGpW",
		@"NMHwhzJtTKrzHo": @"aLNWEVSZvSbJAncFnbMfgjsklNCJvbJkgevDHsYUkjMAdSYgLuqFjIeUQIryoukuqGZeeEXZXZjvBjuEvQZbMDSKBiabHkvItPMx",
	};
	return sJeyeUaJgqnNg;
}

- (nonnull UIImage *)YJKQIZhhQcNuLML :(nonnull NSString *)hOVwvtsIQzPpMEgPYtT :(nonnull UIImage *)SzOxlgWayc {
	NSData *ytGRppqDseXvUYhJbJT = [@"vrmuGZbEfnrzuLcESXxhAGDRBkgLhkDrntsOzqZzhcONUpaerpNhHyiiMnOtvtStIAeiSVrIWkQIyeMMjLDcHmAfCsULnpusRQOYSmbHQLkhavDouqaG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *akCXmGdecVkUupRHfuY = [UIImage imageWithData:ytGRppqDseXvUYhJbJT];
	akCXmGdecVkUupRHfuY = [UIImage imageNamed:@"WEsZCaeIWbZnVnLEjZXMvucVgYxiUxpHprvSSiclhayezPKtgikepwCsdZzIDppGLNfdgJIcVIfxkUOhkRSZzjndfpQRZhABWwIfjAECPCDmHGpYpux"];
	return akCXmGdecVkUupRHfuY;
}

- (nonnull NSDictionary *)jwqryOjBPzr :(nonnull NSArray *)bPDTrPqAFufzyH {
	NSDictionary *fRsZzMlwPFH = @{
		@"BoQCRBnjQdH": @"lSROqfoffVwPRjLWFnJvMuqRvFgAznCjivPLWbXaRxkQXeIefXTOGCtOIXvcEyUZXoLKFYOvUBlqDeOQCvPxKAUfrOiNhLXJCtidCZrAlDqnXHCGvekYIrGIepBnUYFy",
		@"FAVqKjUSTOasPiPBQo": @"rSyCCDisgTjjUeniKTeHwTKSpFmLEmxfdEPbBTPqtApqexZGOPgSMpUrcbpchIpIrAxwgWCCJQXVghjFNInRgDxSqFuxpyGOSeHIEMFTESGSDbuz",
		@"BzCBvanUwKqbee": @"gyYIhlpAcydNDSWWOdNPNAFumMbvMpqGdmsKOmLgjnxNYNYyXTFDMHZaBZguJGuyclXbjwTTPDhkSDhCgyWlouEgAqgAXtIrKSYhxGsLWFzrTJfzHJRXdYY",
		@"AhIEVlhghKlWlDVzXPC": @"ebWxwtvNBRKJAASRXHpauspeGcCaFXPjzXHUoYRQAiAzmePIKOQXnwhzLEDghyaDzuCiEWbSnOgweNPCowtLpwwwVFQLGwcEbBHoUNbHmOhIrYsZJdfqzGfEcxd",
		@"OgArUGeMELMj": @"WfXIKknbzYQllVQQSQEoEEIqeruZyNlUKJOBglCZhGhgPxjCouAcwJIGMYmbiCSZcXQiNGyIVWVjWYHxzMNkPuMODWlqEuPsSapmydDZqaLouhOLlzKfCLCKnTKTBDRkZPcMbaofthmWUXp",
		@"XUCXwqNzJzkdQNXHsAd": @"JGozMMgnEtxjutpILRwDuObXcsHGVbekdNEJvGNspDOMbbrWJMoqAFSBLRbfKoFbrMNMCwcPrIdsibGDCAUnDBrCwLfnFQLVpRoGACsDkFamTxAAVhQHtqRGzxrRZORhLKpCjpiXm",
		@"wjxQzZHDQqFXQmSI": @"tBsRymMgagwsoynzRLIoFHwZsFaHzZrIFhtaGndBGSGwuVascNZDwXeGTCKNlXehfsnNdEdBWRSoIxajPVheTpreBhzUyeOHOTtIBBljQmyJbuUAxusGUuY",
		@"tYETADyokgZrXxUrFR": @"JWnRPBzLWuZSSafcJfsRqygqkdqyGXqVetRVfORKEOkFFvoaoreUiUvwYknjrDXqKLIBPNeqXPlIqGQmGLXQlWuwcwJTGAZPiUxkEHSzfkcrKNqUwCvLOwbpBVoRWO",
		@"LoXOhTzErZoK": @"bRIELCtnNYHdBZtmOXoYhgfMEZcZnQmwCPgaDMrKWTCFKUGlNGYGTKurvFJFusDMdikqPEBCkbqONfCyPiOOCVbIuTsIZYOsNMGjXpNPooEspjVoRCyhjRpnjSGtLYXaPyjMbyQDLzkKEf",
		@"jNWwnGdaSdy": @"PpyohpCOcFDoBehlofvjdMTXLIAiHlGlFNlpZyjgaQfqWUtqdKOLWOfTupqHdjBpgpthZsRwMdJVZrCrAxfoQdvnzwYQzkthbhGtamsWzHGpkaHqCADt",
		@"GNNBvrWkeXwQ": @"gqQXfzQgQXZjzXVIfWjzRbnGwwqmaLTTbzcvgHXLCCsaICGpdAehxPaRstAfjMqgROgGujJTyRaRgEUwxboEvDTgkifQHdKKhonoLEJFsohBznCbRCz",
		@"ymYJxZYSoQLfdcPb": @"QzkjKwbEWyyatjcmrREbSZgrKpgXzFBWdMERYVwzkDfzhZsyJIcFixwazdNKTKnwmevuCtIbqwlMTcrhtXzCHcvqnzyoQiiZZnSvHpGFNGQBzodemoLoJ",
		@"DQSYmvFUYrGd": @"SWjcqACxaIrkatvVnCgpZAsMYdrpgoOaOBBhVcVqVBxjJxvcnVjBqbzYNKkGxCyVksAjTSwmruivSoqblUKTzlVndIzQLKqXkCQyLtYnWhGsLhBIi",
		@"TiiMcjaizxMgtEwmyhI": @"ENhwVlPkoElkVpTIwoRdRnJvCsJJbVJrITiIYcFstsCrWVlkSjIhTlLHEJhTorwDPPPiRpezZazhYJLFmuNuttLRiHmyVOEFGeORXXEJUiIVlymPsLJXoXFPE",
		@"PDxBWjPGuACEVXoIp": @"XiQXEWPKmuFkPQKCdjQhkxbcPokpryZsGvWKfJFmHbbkKpIwkzwzLwXjBGJMqHyeVwqMNMeNhoVGROuNfwlmBmDRuutFuKdZCzyDRRZTqQmERldCBtfts",
		@"mmDFrEeVnAfu": @"cvFOzGlzqbTjnRYlOIcbjlpGecJZBuFwCJJhgKVaWyjzhovKgMVfwNJZHnXAixDErfGjuiOECykUxdJPrcrCeGulESLZAAUySKWZmocyeMeUjUoNAWfw",
		@"lPojvSEEVWVprGHHCcs": @"kdDcvMUVSbKzvpEOmuxKhUUdFMMCSMWzoFmmgSdTcvUrGprrZTTGZStOFkqmnHBidtwgueLnBVCpLbshJjAPIRtFyhvpvUxMcloUKJGKBvfcUdcGrfumXuuiSlpRHmG",
	};
	return fRsZzMlwPFH;
}

+ (nonnull NSDictionary *)dDzBzhkZZdBxStEaO :(nonnull UIImage *)hcheivFyzdClLeiLsJQ :(nonnull NSArray *)kMosjdJqvxxCQlV :(nonnull UIImage *)NkoBThgxMgkx {
	NSDictionary *oyPMDzPGTPiMAlGamA = @{
		@"GhqCirAhQR": @"TwYgXFnttEqnWymBZTalvNwSkRaCQFijorSLgIUUwUGhfsSgkvfBFhqnKOzfYbAJatUJDdIybHgFfEaOEpGXzelbmeBODbVOBUVdtHuzPBCncyEhGDsdKYLMEL",
		@"LpmSPkfpPBm": @"nVbKoGGQoyMUgcKyipHuVTHAVjYvSkjdfORwTbCLjJWdtmZSFogTDXuYYmLbmtTWcBwYtOfixqiFEwPZOXaXCZumzVcJfDSBXnWMEhSvILW",
		@"rOlnKPSfQqExpH": @"IEUtWkcBPqGUjgNbzHqbwhPXYVyujYMNafymdzFWaLIIuqQZDDKSDNnHnakHxyVMOsUHBKBFPHMEOfvoiokebScZjktNlgePGpapAKewVZMAd",
		@"pMnymmjnTcjuHVl": @"VjUjvPvsNhMBFNdmpSaQPiYgfePookpljhVnrWjbDPsoKcvhemyLPBFjHukBKiTHgnqIFZfNelLvpsDaYOquWveMjezFURhXAMmEFSrIYomrtQsrtfMWECV",
		@"OBwkZSCSWrNKN": @"rSvQvrFMJwhsykBMCysOaIDyOStKrIqARMzCGHnjJQLlaBxQCjrolKbERZJbemRvhnxuXTmUkaIhewqCnLOxnbFvQWvMQbpGAfdx",
		@"teQgnaYezHjBowsatqR": @"ABIdBUjjJBoFipwCRQpZPITfMIZkaMKLhafLzHCLpjrNcopJmRUjBCugbLvuJkAjMxkXoGtpBmhOhpZhrRrEhmPOcnuPhBnghpHUFZaunaKeJlcMUEBmIjmfUGW",
		@"zXGVLfEpCBshsgxCi": @"piQowMaPAFJYhiqASooLSoTpLQBuGaNfbBbOtGkXMkUmMEAKQBIyHZcYAtoHwBSlaBsVRENhmBjeRRYioSVeUvqzTLHphQwYtLWiJWhCiSggUhZpMKOBsvkDVhIaRWUJWIdDgFJpjpxDL",
		@"xeLzpuOBFXtn": @"JeumYtmEqpxTcMGcahHndmUHZScHzydtFADwgWbrqjKYoFGhqLpVNOXZGtnbZmbQWhlDlpcNFBuALUAzvkJJruJGDetwOaONvxkzgeInicvDNKlpfMLvKYjxZipiAJcbjZAIKoERvSbqVVPcw",
		@"mMyJmWsvszfYBWpPimx": @"OlGNXjLsSOPAPiiQZUWMZEpBRcNAZVXTIZGpkIPIDykbYKPqwNLieimxbiDlkisFNyamhueythFOAgrdeBCdDYpnpxkYvrkHjWEaMQuKaleMuWNCLXHEmoYTriCgLMwodoqUBwmetGOO",
		@"NpAyVEXrTTCKapHh": @"SRbqSbRROchOibTklHOhRPXiygMgTdQWqmuUwomfzlYfTBASrDNuSniOoGDkoHEKQCyFxHHAFbKHwgDTQbqORpicsEbODTWLYUoGclMLmSfMaonVZGtWtqnQgjitMRzxdMKZCQqtNUcTJQ",
		@"cgKrPUavAxuCeCCtYc": @"WmDCLDRsjwWFCbYJJYGMxoAewlWtwkEHHeTTOqxHmjvnPoZQqkquWCcbXVpUKcaFUPlCsUZxXwQdeuPJuYbRVHQVrpXdLkajOHRCnbkefWQbPhdNdfVJnTevwGjYMekzAGZFkRhCeh",
		@"hAHoPdFvOfzqy": @"jjkCUyiThgGUPDZZSyYctILRUkdpAJtXnqKfkWlYbQGrkUNIgQuPZVfEEPtxsIbNWdqMUEJjoNHeUCoKmkkDLRcmNnAZUMMTaEDaZRtvRiFFhJcBx",
		@"FcBlpSdwuPJnS": @"FIFwnhjofxVEqPrYwhbsenAEPKsuwJdoOLEZxlBAIsqaCzeUUUwZHUXHgfIPTLDmNLmKFrKixIEDxdwkkLmuXuJGSHTQwfZoJipdkuuoLglCLbPZTBScNSMUCoVXyBmCLrRSVORmCPAZrMK",
		@"PYPacQPyAuKGdAzfPS": @"PkhchGZLuKhszgLieDBZLGbbwnXYpNBKshDQkZnmmsWwCKqDDhXAznhoeFROsGenPgJqarNIGVesIrlaQfHfoxnxNEKVlYTUhtfEgDaZW",
		@"DKamnJRGPWRzeWkyjR": @"VxtXXTkUAhbpkmpgHAxWYyBEyWhpMLtRBUvpHxETivMBlRtKqStHmEDJWEBsFIuvUXUMIUYQzKzMwgpErUlJjPIMNnOXCykXbyFWWUtlfpTh",
		@"mfbUxfpdrsDrUkQy": @"CYNkNRZqjUGbIMDeQapTfTjPWkrNCxoAewtJBFAvWwgSmjJKppKzdSKAlCvuHehcAxMsvSQXJYFgmpFqbKdMYAfWwGXjBrKtJsjkDtwbrVVxjWScneUsvLaYw",
		@"jyhhsAoIKm": @"zFvcKWBeumELmQMpnxEeUYJrVXwLfIxINeturiRuFdahZTDjdsiSFZEpKHysRhmqZDbSzaPvfydYXLwEHmEaqhzrEfsFqthfxVCSFtxpI",
		@"xXMCqgANEShDprQjGO": @"wljQCzdpEhLTzSDHFaALrXRuGXrVlyspDMnMOBLAQtTxjexITOJGxrQmzjlVaMJgVytATOreMlqQRgrRXsjplcYgHXnVMRZigaYnskeBt",
	};
	return oyPMDzPGTPiMAlGamA;
}

+ (nonnull NSDictionary *)CtQBBEYxgcqWchj :(nonnull NSDictionary *)GVIECSepjxIg {
	NSDictionary *eJRGtrjcmLcuDRtX = @{
		@"CwOIyrwGeuzbvozN": @"NgHexgfSUchqTyvLvOVNAkMwbJEaUROrqzFnmFeGbGSfVkeNWxmUuZZaxqAMXEtbVIZKfhtFWTrCazgxNVSDXKkdBLxycRwhCsSeVYhzaFFcXs",
		@"bRivtHvubbMvLwBNOT": @"HHWsgUetSTMNiZgyliOfPKBBbphmuKWzamxippLiiYsLMTKcwIlAPhgbrjGcqiacpVLgXUNRRZaDZIYDjhKbsdnZmJcSjBmhTxXqmUDsra",
		@"dZYoBAEoLALoSsKugH": @"XpLxTTxpwXRPzzNXyiWkljelHkgKtcxUDdPtMGwkxUVaFIDvipdTqapyIycuJtROBpZZxewgjKOfHgndIgWLyscsuhnGHQuLJnazoDti",
		@"BGIgmAEhcypQ": @"POOapIendiikohzvwYgsMmurEARhTAmGrukXWDDryXuzgtfUEaJyaKGuDrjoDKZoQkqqtuDZEKGqSPItfeKPpCafzWsciMerQKsnnbsBvtqEeALPMCDyOBRnQwoSQyFLRKzyePhW",
		@"OuNEbKzSFpaUi": @"jHLSTtftWaJSMHRdUYBebDLbeXRKETdbVRLRqyYtcGRhDOXjikJwuPlgEByCJMIezGEsNKIlsnTHnJVOOIgPYchELjpeuXuJeznorBoAjvajVvVwtQYTPanidsFBlSnpSOYtwhCgxuPOtbYl",
		@"yhdqygpBNBLsgwRRm": @"vijdrlfhuDjXEYUKKieYPQLqwYTkERLFIEPodcBsOkEQjervvDaulTIikrcrpJSJBJnjhrhYNYaPRnkmSloanZIVDSVLyiDJJfoPNvJVhLfHIxLf",
		@"KPGbVroNbI": @"YgFmWKEMtokMuOqJqzZgmOkbvQEQJFAhsbxEqGoWxkEwFuYLyXiOUXuacbWWBBmQBnaRpTHcHttgYTCkDyuegoZUSjNSAfRRfwTllsNeigfmbtCvtY",
		@"mYtwFFhBYDZmHVSi": @"CvnRLszMkSIkxgBKGiKcJWKwNtQKLCksQgeUORrGqDROEsBhVHrVIOesXcuMzkMmInbHlQWFxFvDbmvMdNsiFVOUoMhSAzAyjxIZJXWWnZBRbvCqjLfKyFSscvIgzoveqeNwiLB",
		@"ChIatsdNiiCRs": @"DuUshOXNIkQBmizWDDlHdNaIsXQWatMIsiIgTaIUoRzAhGlgGdBmoMmQmHpjHkTIQMblWyexqtXFnqawrZEOPzeYOUZwcTfKZLRdtrLMAlQdVhbwiqKYaEYuuefTyomBwrGLWup",
		@"WoNrMboqFcIab": @"dDABKJEJVNVlIfzduoRzkEZnbGOGsSdPXxsNoIYoQyvladLwPgnqyyzOWGhSRaWcviOpYpxehFLqTpEMuXJrbZCEoLBauZMJzogTJTFXZrkLqGWsvttPFLGs",
	};
	return eJRGtrjcmLcuDRtX;
}

- (nonnull NSDictionary *)dCobjgwVYgDJCTcuk :(nonnull NSArray *)fPdXBHPwVBYlqeQT :(nonnull NSString *)gtZEitqlMdR {
	NSDictionary *AhetBOzGklfUoLSCGRl = @{
		@"rDhcwPJpBLRmGlak": @"WqJDTahzSxffkATOOcmnjbbvJlyXhckMfcDYbqeRtJDxhvzJYNyMHGRHREqUwlGysisZhOsyavvIqdrvMUnFFeMGcKCufFpIOeSgQHevyUNnMNfDKTBnXPFesU",
		@"BvCvIpoghNhwZVVdiFL": @"KmBkjZKeCKXoYxTrhvPJamTCiouQrmNQTcZfZiAAZBnzaUkTcTOrSSANTWLWQUmTyvJlVnHPOIjRebTuRdRLmNUTxctgjiMWsyVksHtrcONmpnUpOBEBeDfhrylpDfjNWeiHPqqlc",
		@"eWrJnyNEHXQQG": @"YXbqzGQHHSliDIMoMeWcoDaZbCvWJtFgzoMRQsxPgBucEwPYXDlGrhhmZtDbkbihmLgSCvPXRtgQVaSOkpEfvGfGBhWqMjcALkgkpATLmXEjCdRVLvsZqktpYxDEzrgIdtTGJwGzhaVowHsaR",
		@"HDSrQZZsWnPkFNTN": @"avHOvhQRTqsfKxdSsKfmZoHOOnocYuBweMFszVDVkWaTcRRddcBFsAEEIMTglrYgicHZavTWwMHahdvlwPFEDmgtltTJmWXKjQiQGlsMs",
		@"RYOqzGicKxRSSeCtk": @"FyFBkCPJGrxhpPrMMjpmLiWFQaseBCwcncZYmtFjeHfCQrbrsScBYLmsnuETHYkDjIamkgfInXPEYPNOpIiPLWxfpaCGHwATLgyKvlasRvRUtoPTKGYuONQUVzjk",
		@"QIlWyMQzOmqo": @"dASzXnRbMrcTllzrTrUZGgNhToqExkUwkesCRHKsCRSHZLluIpszmccTTQokPWRgRGCCgalHmgXeTLWTrcViDOpwbfQxyuXtddMwYxhAsdA",
		@"VvZXUvYgouK": @"YuWfWkmRgzyDpZinvjccqjWGIpPFbKyUcUyxWeamTtouZHZzJVllmDUkUBMHiPNumNxWYuyIiGMbWHgLQSkfoncxcVWMPeQLkblBCRsXzako",
		@"qHZtVakSzZpEVFA": @"crFixxmnwvxNtFbzBhnfHZnMPjAgaluZGUVQOqgKfYSnlpnJIDxXeQZVPFVnvPNYDOPJOCJijCxGmHzvyuwamcnVMRyHgtVtJMKxdUOTUEGEzfSSlAZBEXqJxWAvGIwTJOgbcHrl",
		@"NLlPpPzZVSpk": @"sbEGILSVxecTzbNeCbVEdjHFntTHOROrHEMqldPtlxxlgHHEVWakDQXrkIlQflBdbBWvdmcRvONaLNQctnESVxjndWSHQZUcqDudddVniBriRHwFqqGeIGJpgXBVomIyjMYkArvMUfQqABzBV",
		@"eCwMfFKBPfFKgJmywTU": @"laNNWBgTcCXERDexvWBUVLzpTshJOMiqpOnxmFILutUItCFwwjZTcKclEUAwnqRcFEqjwykoRZlsxtOtHLMKPoacjjRsgtuBFmrMUAHACXecYnUoBEj",
		@"xyILORnRpi": @"DtnYWAQBnrtAotNMUozSXawfMQbxUYHlmiaSlzDSiTgdMEBtjYMvKAFaSXKrnqZeFxJGRSIMNvYNiDxUkrlYEaxJzaxwZndhRciimro",
		@"lAgjWDcVOGYeFU": @"VXdCvRZdMOPzuPeNFcsHBHDalLzbzjlPCrTbNQIJxJIlgNRrFJRBWetzLypFcAkSocOmGLpqvwwudoxnaMXvNNPSrFzeqKBMWyyQfkReyAtBhrDOTMe",
		@"FvEzmhcWhBzfXizvu": @"rZImKNVLHwWdQCOQyxekNgFLdBETEmFFwmTJXrYRymeycGzEXLmetMmYXNjNJqCNFkIzujtTiihIJxnZAHwSyXDbIARVkEaZydzgyagXXgtbkxRffNpnlKpdDNiZKWLdwstYnefmev",
		@"MVKfOaXkpBmBDXo": @"fwFpCXeqSTlxLXxmSBllfizqOOGYQTAfIuiZBGWpkKyMXsApCYOEuogelqWPUGLsYlyRTwnLNLYzWvslyrvutMlXqIbXMZSByhEJVKkjUIpXkyEMyZwJtBr",
		@"qvottdXKWh": @"QUsmFAFYVGiJXtSmEhablzBoEVDqMlSwdemelriekQDinjQizCEbexfDUFGgnvqZEoHWbFMgOBYRTPPkZnsBdJIVxWFtvTquOzvdRnqYBmDWoXWfnRudlIxMj",
		@"BlaXAyHFPJJKV": @"NUZRIAtfmxIgUtgzZNZAwYoEPIpIqJgRbeecVYPKKHWPYhQxDIdBwLMaemOqyfdGNXQqJTxVrrsqgWOwQMYUoLZaGKYBZLXvwolpeZCHaOADdUKAfoeZicIgExpIHmusybcZWNpHxueKueWtsKcz",
		@"NCgDAPBBDHO": @"QPrxwUdYPwQZQFLZXyCUIkWQujMMIhMTJniQMIMZwbTSsFJRiXPeENIzLuLOHFuTfvdHdBqaBGHlDDyICyfmufQZctsbbYhiUoNKwyRCRpv",
	};
	return AhetBOzGklfUoLSCGRl;
}

+ (nonnull NSString *)GOvrpVPZDVJWRWoLoS :(nonnull NSData *)VnRfehbxbHE :(nonnull NSArray *)gRtBdMZCMKjiDuQXVnW :(nonnull NSString *)WPrGBdnYfa {
	NSString *iGsbBwgcWPjdkpoyWz = @"IsxjsVWNKlkJMDpuFrwTebyZsnvsQWmWflwLtULgTydlixNMUtViqRLdcFjBqxoFVuIDmXjSwmjlRFSWxknuJxkymdfEnNqbjUKqbdAZmehZKLSRmaCdGlHLfrnHiWeTxWfPLqjgd";
	return iGsbBwgcWPjdkpoyWz;
}

+ (nonnull NSString *)giSazXbAqnYzrXRPsEc :(nonnull UIImage *)RZJRaNuclQirO :(nonnull NSDictionary *)IuhqhzUmHJjTsr :(nonnull NSString *)YqsUpkrHmtidfc {
	NSString *rbJMUjhgvGCUpW = @"XONgyikiTWFWLTTBgNAFMEoRvLmxiqtMMGiXXNjfsGUpgtBZCKgUpfNmLLWgyGBfcgEHbfQkjeRYeirrhCetGFUDcznyZDUMBYkwJsfsQjnSWRs";
	return rbJMUjhgvGCUpW;
}

- (nonnull NSArray *)leLngPjqpdRRHOfmId :(nonnull NSArray *)OeTPnUhTnyxNLzLjDe :(nonnull NSData *)QXNxouEoFaLk {
	NSArray *zHEuevDBgxx = @[
		@"fRLOLahGGxkrKShKVctSIQvZhZCvTSaoSXDwjFBavYERodjBQrmNBiwHysDDetMeVfFbvCuKMtRSmZysmtOsfKVHyIdFeDKMMsXzZtFZZMCJCFwpArBwHdLreyPLHADnItiQWwwqnZBbuFsrFbIA",
		@"ratgrnBbKABNqoGjfCNIPyMTcGxxKKgrwYJSOJgSVchDqHCjbcKaXUGqbSGTfHbwndQjkLCDDbNGNSQnmdWqwwQaDIgNqmKfRvehwuOlZgSYLqhWExqfkIJDnZtXnOAHdgUcP",
		@"bbXRGjxgPjQtDdYGRcsQUiXdnEJZsRgUqtTOndpWqKjWDCCLpIxVgxnKrtiYxNqfZuEmWGvUiQOCRRxJGKZnIEvtmxjoKeAefUDVTofzOIFkdQfakKqy",
		@"ickxuXyWIsvrLuGoktXoIlVubzVlvmGyPOeCauMWrtJNbryjIwIblVCOkPUWJPlooHpoWpMbdBNqCbJbrawGOMaTBWvIGZdLxGQaVMwcZIPliRwBISjTXkHBfsfThhAQYCdkwvGVpBhajzTbHD",
		@"ZPekZfyFXDsuKVPHervFpbmoPNKemgDnXhCOMXLHQPJnWXwZDoNLOWkaADZTBYyBuesQDUCynySuvPcLyOftZssUseUqoeEASbXZwEkLORxnYtQNsJVQOwIqUGRzsQUkyAGqnb",
		@"QTWHlaZOyVCSvPZPIqGdDjAexTxKeVawxkhymlTpkuHvMLIjzfTOUYksjmEDShgsVQXnLOSagqKJuFLjkkfdTZwBxQnwZnLcXseUbSOkdFHxPncEKqxToAOuYyjJEY",
		@"uDgvbHAubcxmXHeChUCJgXbFeGQWhkTtbziTJVVERVvcrrIjFzIijlGbklMBwCWUgAxemSqlpjsdAWSEIARzuYxNJdNZibUbbipsnAyKmFyAnCRNRAehcJeeBuYqTfEZKrjy",
		@"pUuiynPhyWXBMaaNGIqeiHYbpkNWZvCOPlYABbOIcAtMjfNGDQpJaVrvRAsblOBOtDPQIZzWnaEfKaKcYuwiPaygBSBVsGWmOuSLhBXzKDUGBpLciBgLXMnZdedsgUamZJfpeDoRQlEEtyK",
		@"ccJelnOQVpMsyRvVTJhPpZXVvezujcCZFNNeEWwXaXouuzNelTfnyGgaCMGCgsXHrRyDrmBXSzhspzqNcQJAeFkcQZiyrgCEwrQjMmNveRRQqjjYpyNzNDPzpgUa",
		@"xbZHpnFtkerwNCpaJOKZwcZnkOxhaeshhRCvbUlXGMsXNJCyfsJBfRDBoqGAhUJAeHvGnoAPEVIqEwkqTIkLElhnyPWfYsMDVHEFfRugOnycNVcqXLtqJBLBZaBOydUkniazBSNstCCOtS",
		@"nEWJqztqnPTQifzpOgJGwdJFUUgpAOulrVMsYwBYxZkYIkvRFIvREZpnkXGUPiaXKcANxrrejdmBCZHINpGiqQqeYbUBmMpvDsZoMxFVxSUatuFQtg",
		@"yZePPwpUDwfhbpxalEuziMhVukCukQOIkOgzREtTRFiOfCsaQypnkcGbSaWmdYvypdjSQqJNOjiRLFpQISBzjtOzMZmpchGlJKBDsBtZyUkfZvsovSVcBx",
		@"BkmMfhyYOattfpIFPAaKHdQXvIeBdPNlvaLaxCcGliFVESXhpctNugPNGxHojacggrzlFeNdfnXcjjeUzMwHYKQooMJvufEhYXBksUxtI",
		@"yfaUYkQRBMGTQDfQADnPSOljADMDgSnlmrFuPpalmmNdLpNcbxMcGFSQkDDjICQMiqborFrACsQdadftqyjPSyzwWJkoXiniKHMjwuhMMJbyXwMUkB",
	];
	return zHEuevDBgxx;
}

- (nonnull NSString *)lqFqRsGcUVpuieeVV :(nonnull NSString *)CAvFOVmpRCsgABXzYf {
	NSString *wOCnIxSfxRRZonLZjCz = @"yWZFyOlAFfAiMVBzWYouDvGQbYdwVHBGyMgAAXIjXAEadutjbACqfHdJyPVwYraGrEnIOqObopZeuForaqYhiIEKTMmadHcYMqBbOBKzWqLyytwMhcaeKEVlfDmpmATkQOTkKcIicXTWIxbEkTO";
	return wOCnIxSfxRRZonLZjCz;
}

+ (nonnull NSDictionary *)oEhIJeKrqHDyOCshmW :(nonnull NSString *)HUTsQiwjnBkO :(nonnull NSDictionary *)UkdQaTXvCzFvMkpZuC {
	NSDictionary *owEjZwEslT = @{
		@"RtdEsOtmDfgsnWL": @"zanzCsYnQRmNUeKNxyLJAYJuwCPmhbUAKNLkqsrVwthSyXqxgfTyAdwwXaoDEKrKaAajFcujTRVWaMluenPLGXFqBiBiFeftmQtquomogZnSabYdBxkOIOuedwFXnkKNkFONWbobzoDQtK",
		@"rZRhmzlQDwnmGIWdszD": @"hmIrevkkhwDZNaMzvgFSPJSfpuAqtxAcHKuCGPmKGpWQoXwGlSioceFxMAEvIvbPkyZosQphiTFhyUyRZAQsZatoCgyXUhEybbTzyrSfgzZTPisopnyuOIXQkKKlRIOMuUVQkLZyfKFWQawUGv",
		@"FzAfXxdaIk": @"bDrcMbhHqcWnXiEpenyGmNvrGlMDLUjKLLSEtIpLmqoMpTmLcGTsrcUuzQpYSCmAnSFDFDGYKYAPweuvATjfZDMcuBSnJjssGdKFBIdwfFsRXZoKo",
		@"iySKBHBbau": @"uaqaeJewwcvzQdOfLbaKYJhuJoNlupNwskZEYTaDBIUqInfzWJXSxjeVjkPBmRjitSFxzWuciYDWwMUodmxobMuaRPDumgAlZsuNMXIuCeSnpCpkevOLXhqf",
		@"XzFXLfdWaMPX": @"ThSPyuXtjzTuBTBUwnCODqKOFgFvBDzFSUXuMUgLPJtXlECJjPUFzkXLkbadiTxRStCGVmGbZyOkQRasDblwNrzjPLpmeJbnTnPLlJdkBXPXixiNBKdQMsjNEljwzQRbzuFARTeQ",
		@"rduviEDAsy": @"vzsGqNSYIOGUYctwnnEfFefaOYJlJPbJqRiHgKFGUSaSMIBpfHkNlVydecManlgGtChDXLDsFJznUuTJZJaDEJPnpDdzXJJbMwYNaAvFMCRNukmeRwvBBnFFYYZqbPilPiyooWkYeFnqeJDQghU",
		@"ZGCDCQMZymT": @"ErphQFfPUKRmzjlJvGuRSbfXXkqXzVdXXRJmBmVuwKXbUYFZYjemGgzLezcuHhuLgAPWKNwWIsdgDCySgTOFFGfKRgCSKKdLyhgQmGyAZJcsJLciIRiQTnAgPxcYtRvDmVnZbFZCGat",
		@"vogssPNVuoNcVOq": @"BjejSjWTxgVglufMxTYtdOtGlVDsDashzboBucghvJrmAERjFqWPXsCoKcRmaNeqBVOPHmuDVuYnaiOmOEzGbEKqqRCZeexGlupRnxqncprZcAwcLl",
		@"qvfAiLPCJkznBLFGYj": @"LskzDjokcAQkNaJJvVuSJUISBqGhLNKDRjRyclIhGQJvDmOsUrmaFqQzfOROLKvxNxuXuthiSmziFBBhggchQFvLiXKrErcALbLy",
		@"svDZFPmmfuaHt": @"AsAMoxyrJzAhLfuRYLAJXKZNnLgoEMAmytROLJQAnvAPmvVOAcMBbBZGWWcUASYuKlGbMCJlyavvMyxyrqvBvbOvNGlvCTLOLWnlmcIxVKHscFeWDLxcJjtYsiSczaBp",
		@"ngYYScrEHnI": @"LYpPXgEXaJIfhfRETdJsfmwfoVqdCSUhEpketmLYpRmoZapfaMeczJSkvlwVmpTZCZeRxXKiLzHPvvjYOiNytVagyfjoQbxUimsRPiQjcTCJGkKCbSQxkjZoyQckuFNlAz",
		@"jLAIGKiIGpAnyy": @"GmvnGYDesEtCBSwNdbIGCjPlTYWQwAWJXjfCYXLixnkwJodieXAlWeYWuwBhoYdWIZdOcKLALgFnItNXvjZYwMzxzNZZlyhKbJxuFJTYypgeDvEjkMTFD",
		@"EyWrJYccTV": @"WvitMZwQwiskDdEwPtbYDEUDIWtQljoxEyeKkvjawXsCedGYtOrcZRpSBFVoRvwAiIePHtRqWXyGCNjvCsmLIgtzuGOInPiQbCZAamYzcQqIgfiCA",
		@"VQIZqXaCgx": @"IpUFIGiTvbRArquABftnYAIdSpQnKNsAgtJfpqxYwiCSOHoaDVTeOROazFSpdPoPGprInMwujNPVuUbkzneOjPrclAZXNvzEKYiyMaoSXXmtEQTLw",
	};
	return owEjZwEslT;
}

+ (nonnull NSArray *)aYgmQPsxTRklXKxqt :(nonnull NSDictionary *)HbxgRiINUlLpzYR {
	NSArray *TgEHIqTTiXFX = @[
		@"UIAuKblqvtqEkwgoKkWXjvOgXQkMjAFuKYdYngXGGAjzQTdSkexcuIigRVtKOLRqvMCsZkBnWtFwoiAhAznuePWdZxRBbGPTZXTdSvXvFfGCBIgUvGwKxwCoxcvqsiBSHSbskzFXgdpETJ",
		@"ymFpCXHBLRLfajJwssAzUWHzjklOOEYbWnwZPcemqUKPaqVivcNrAKDVrNAwQhVQiwqfxpibcfEssxCIlbbbEtloKEsyHOfWaRtToLfDQOsLzvBWlwexyXqnyLXFoFrDGYfTzFjQUlyJ",
		@"rPIknCNJNsfPDWbZFLdImeLaIWdiGfHEqZqvdsvSWmIrUBFkwOdNEdHJLylefZcGOMsEEFqgdGYJILIHNyJJykMCbiQxyWKGTZRRQKuRlPVtuISvxNKDSXUxhpbDCHadc",
		@"YvMhSixXvaDjXgueLPOmrHBfZZqVwcVDpmepCvUVXRJWFoRFLHqnqTApWVPIMwySlaceePcIspaarDPxGgFPcnbkDWTBALIpLTQurpAeJtHkkd",
		@"KLlGhlMKjDLsBWqnTffnJcfWZNXrUGWUTVjUHoKMPbmYdZVQpuLECUCGldEWXKRzCJhOKDcMDPrbADFPxOLFQMaCLpGCUBydrdXvPJkqNialZ",
		@"tvNhuOrxjcqLVfBKaaSUbBZxVTNzTPpRWMRYUBgJyvxBYBpuVLSIzASfrPwJpTypVjmYOisNZXRFnRxFfpkcNCvfdGiFZdFWKttJEbBbFlyysKnfDjVBEmBcEKqOMLcPLU",
		@"bzvbkXBjbJaxnxczOpvISWUOOazcjqJwsfLlMneohcUIeXeUmEkemPmdsHlBeTzuMttHSoxboajRsbVubSMwYLzuGQbXftHFakIcZFnUVOEvMNcxSQgAvQLwOdghTbkSgBfWptQQoL",
		@"yLhJVCInSiADMlubrDzuVAXEnFpOPERoFbJNzXpSgoznAmNlUSvCdIAWrxkcxhWivPhsRVxpSjqewySWXbhxDIDEpxglMJCmOiAchcqgfcFJxLqc",
		@"wBveBmEEiYdRjRZeJPqVVGjZanhKVKAGYiEGPpGrRbmWickNxdeEkeWCwiTnARAXlhnHYzsEhlEOgdDJmVGEAUTtUiNCNnaJrUSjNxipkwvcvoqBp",
		@"bfzdDoqmZmgZndHuDcqIsjQfhnjaXCFnNUIwptJculzmpLJWDqKXLJiWYjPRiBUrafXCLiCkoPMmujrnDVTJpxCUcXdWOIrxxmdLJQPFZvvFAAkOgNTqeaOjPtyRVeSOiUSgMfX",
		@"QFawOmFBXltmgYfNogoZzrEnwSWSgGtYcoBBmUvKzkfJynyIvEhvgeFzQuuBuewcLiMOiVDIUyCJbvqSFzyMXFYeREQpphUpbTFSQGNaavjpfRUCJHcJMSOQgWc",
		@"CxLkHmienPlJRfuJyRHnAtlFzIiLemxZkDrtgfgFcTTobttvKAsEvlgtrsmklehPMWbQjvGxlVLXMLmnQiwFtlpTzVQgPQUdNyBxi",
		@"cmMLCjyXmKOGNmtYlRPDkuAcuDqqLkByzGzXOLXvLfhlCVlwBfkiSNilAOIkkhNUNdWxGmsvJoDkzttHBtNAkHhvbaKhbADwdkCgYtekvbgnbTTuVlAAJpCmAzMItDLWvWzWuiCowYPemfHkb",
		@"bjOsDFRYUtErWfmOyMUQGcteOpKRiHPFGmyvrcjBUomisAgqXzfSQZEHjSFCnyioQMGEAULuwRMpoWQNULSQBQqDyWXIpIMBNheZkgBqlwyp",
		@"NRHoyQvSwYSLKlQHRXfJvhGfBTnPlbSUDVTiHdnsJLJsfsejIPwyKdODIalDSXnIFiQxtxxacLKHHehAgNvTXrQxdiWVHOAomsNFOxYZsRrowCqXTojIVWtgfMW",
	];
	return TgEHIqTTiXFX;
}

- (nonnull UIImage *)YkAgNYFFWfpdh :(nonnull UIImage *)llqrOgOxwiH {
	NSData *xDlvoDUggUJbBqQD = [@"LWCZCnSbaUaReBsSSeYRMOuGenHqEIGSRGKEKrFHCxriqmsyGpZRigWBcGfaqXxZmVQwKuthtxBThgMGnfzOJqjpVlXZyqlGpcNWRmMuFmQHsRzLqBXvKKMUlksGsOCpGtZthRlXBvJn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *etrYOOKLPsYBFPh = [UIImage imageWithData:xDlvoDUggUJbBqQD];
	etrYOOKLPsYBFPh = [UIImage imageNamed:@"QQjUIhKgsYmxEtLoGjTIftaFUrvSdIJzYPYVPaTddQkkvZUIgiabRLqjwuiAMifwWoCctVgDhMFuORKjCsMnjsijFteYlpoRrEWhWyVREHYSEtEjL"];
	return etrYOOKLPsYBFPh;
}

+ (nonnull NSDictionary *)sbeTkeFBqz :(nonnull NSString *)WljrSOeyahB :(nonnull UIImage *)uSBQmQhvGZgdmh {
	NSDictionary *FtokAWZMdFDx = @{
		@"EiUriBbEoudF": @"LuJbLSZmFdisSFfzwkzqqFHNxCttwPpYyvbfSDxrBmooWqfygYDgzCAjXmsKsApcEotJHmWXmsJOgZWvqIPDRdszyAfyAmSgKzonvJNDPfxEwnkGunfFByrVTIBYWeqRwfwGfwIYxqxbkE",
		@"vrOjvxpruMEsu": @"zAlxNpYMtGtieJNrODPrEYFxFpcRsLNJqkPbGRqgZSlILFECLRnxvqozLsekIXYgkpiZOOcClnsmLVNKqqRdhRMHkDJrABdEOHSzDrOKzbTshKoNHHbjvugxy",
		@"WXQLJazaitLbxxn": @"ORNJFGaFyHUpQpHjbgoTwqbSDZcluwmLvcAEkXnFXNwwjIgNsTJyHVVivAsqMpEIoZDYBxizpgWhLCtYepWuEaPlSHaDMmoFQzyxnyElwaNMfXxvKFVydpsFXOlTdkgjS",
		@"OORaDgpdpNbrUPFI": @"FfcBNYPRtXFsKckoimRecTKypvoYQkzTziIMCPQrDdiCIQAEWAgvZjioyBwZFButbRWNICRxZxPsYYMUNchnzunsFNXBeoVNYJOSkCRdHPYCWwfL",
		@"SDeyugiAylogK": @"fpbVkHGPxWTaqDgLdJVqgWOAhJlCEOpbEGVQElrgzJVmtJetPxUbfOQCxpOWdtsbQJbXUpBeSvPNulitjTnbQvreLQWmUFRZluxemeaukNbgiZKRLUxFduhBArrIunDeeC",
		@"aJuGCYMUWvb": @"AZZaeDLkrCtZGdFFqcqFmWREeuOeKMOyaJMEdLWJGsSvWFQNlUDKJzJyNTBoGhblydupJowSOXzGZAGFitxyfMWXFqfABKQetcjgAdGAuPrVhJTlKECyxYXuHLMSVwvbBrLZguWlQBRXnwoNetxSz",
		@"bwcSdbbeQxypYs": @"zcFjeXsQMAxioaGEfNwAMqHQIgBSKNplhvxvbtnqMBvdxNZnaYviWoamSCpaFSePdhMzgIoaeKLfNJATyzDEHJKdIkpszbdtKbgkMgf",
		@"pjzvKLSdXcvjio": @"dNYpTEUlrFmqDyCLdHcQBHHJXvjGyXPixGufVBreIVGpfKZyLWDuwvsvuHbroqsbuIFwLYxDXLgQkRPjxDyUsTLkohYWdFkyVTsUXNpBJvceXolaTyHvVwiXdagVcjtle",
		@"PRWpNBMFYYUrrrX": @"wKNBEClIXfDCXIRRqlnqHiRrKyhhQGBrItnkVinqIoZcHhCOlYAwHfCmIutjDKEAriZtpLOhAWcANfkehStOZJjHtzVZENCPRjuJTwsWLsClwiuYfgHhcTlrPfrvCxCYxDmXE",
		@"jSsMXppMlftMKWA": @"xhUNvzFGXlYGEAnsCmUtqRRjmtdGzIzMmVPzlDAuYcZwwmwxgxiFjjnrwvbUaUYDKkvyPiWHsclSHuOOQUORMqBHRvTCteJFloRrUNHSkBbTfBvnWfeoVOMHlx",
		@"mNJbTYXHLj": @"vtxvQBIjPdpOPrmywAHWbwYVMuAvuCIgyKnIPGqvPxysbXTvExjECChzPcjxJNAzueLSbuKdMITnMysdbpjsPanqktAJiuOYXmHmyIppNMVOIGZb",
		@"WkKLrWTyuZRclKnZpi": @"RwFQjiAqcpbmcVjcWVCRGPFKRRUlVVMcbdtKPtWFrSiCGIBUgtjVNEWvpbasKvqoOqGkZOxkNyvaaPNotkIjEbAArejROLUeMOUUxsvyuefmRHndCIbIDNfiPmPYIRsffSdGMvqzIFMUXSldVFFK",
		@"AmXCoBiOMVW": @"rJUPSqgpmjrRANjRfDkHlTFUoZVPbUUjUPKLNsbNKPOeCSCAVjhVPPwkPkljwmFvUOSCJjUOdqWdggjGLlptTngVcCvidEsFqMrDSsK",
		@"WZlAIsYKEbHBkFbHiZ": @"ElwvfWyYIQklVBkLLspKGXSrXxJlzZQkkHDxKVIjbZrvTSSEcgjpPrENYrPiFeCaHTBnrgVGgaHEeTkzrDtddWsILFFOANoqelMzsDfVidjVDRDYxwFVYMIuGbjtEoWveDQvxxmCiMNSWR",
		@"EvPQToivNUgHgzNnkV": @"WXckchWvImWPqcvpPOKtgpmONDtwILudgSUQvCHiavqMpeWhIBiNfhlXHYEQzVhUusRFEkMsCVNzIAXOaUVaBlndyxSZlmBBUpGzoTJkESGfsmRivnaOVMvmfNHRAYqIcSwoqwhxRuZIDvqChygAh",
		@"aQtGHCnRMfg": @"WzXLPlHOkSpUsfqwOtUTVHEioINgGXNspNbnZiVOduoHWYyQedWUUJHgDvUUSuHtdIlZNvApLURDAhXcDvllVOIAFeFwrgnoEHyNZiragtlbnNVUeEJiCLrqxwHmmujjHSAIrTTCAhLe",
		@"xWqJfDATpLkS": @"dfeQCrLXdKYtYtBhVqjbSdKnhWipVFGhEYYFxpgMMBMBXrmYxXemuIfGLEUvDknuNfFZtpQGMQeNEvQoZixZsTghJaUWUDfZaONaAlIxjTGo",
		@"RiaePHmWNNDn": @"IoLipkwDleGqaolxyFeJHGjlDXkRbFOsQhzaaUiSpDuaqWPdTrgJpXCwRxDYdwUbyDBKCnbxdUHgbkzttRDQuYRoVdKkulYOFklcOjyOvwehdlNGZKvwnSKMvmbKxGpoLNF",
		@"MiaoLRschY": @"nQSJYgkjjTlExeyrgOZaIoUjqLXJCsrkRKzPsyPvTlRZMhXJBYbmkXuWZIOFHxacIJUvsEKZtjFzQKLNjumFVcVWUTeAdVcJCEpqcmLshNoAdYcFPvROdDkPss",
	};
	return FtokAWZMdFDx;
}

+ (nonnull NSArray *)NjnKZlwlOkdMQim :(nonnull UIImage *)mHeTQxsSAmtCgHsRN {
	NSArray *KvLgPJQmBJPB = @[
		@"TeKhdErNsozPtZDFrInKjxKNPMibWzskWoFcgGzbvYKnTdLxbdpovpjvItCPPOBEiRdGXJwPVGXEGNInFGoaUrdeiOLppyjYnIyh",
		@"AgJPPbVPHvHaEOrlPksyRJBJrPalEWtJObVMCsOtNKbTeBHlKVDXpAnuxTnSjylzizXmgVksjcsHrpSAyjpnueRSxkSIlaUKGiMUPZw",
		@"yFeFjZLNtRpyBVeguDPalPpvBwJjHyKiqDpBXPFBtjIBGMDhGVkeSejnPNZvAoCWdRHzgUmpxzVMAmesvftgFJDhtDVDgjuOIbAmfZmwTRzIUb",
		@"IFjsTNUiSfsgQsNDPQVWppFnjZjZUyNiXqGdvczYxzBMilMlXoFBjYWpoeireklihwxkoYCkYaYUGCYikHNBCLhXxstpevAwgIVJkPFUPpgYJWmukxhwFnlGuuzwlzabGAZEpjSOUrIYkIE",
		@"JoIjbcUFoSTzGSFLSQDyLeelWyAUcIolfclubyBfEOenNGBFOUXIyAZpduuCculBpDSMXYkREjFqbpiHZiDbygXSQcvaFNdOPgsHpFGTaMGPgfSKHLyADtUYi",
		@"NYSVjuBmIvLFPUDbLmSPubgWtsUiPpMJvFjcHTMqUHKNwqRTIDSREMZaiHxkTaSXifDtLcbdLfZGeCozWyerrWlUCeVmbpDpERVAvtsfMenT",
		@"jopkCENkfhxmPKtASZqOQOupqkySYOEwbaCdLVboDrqpoygYghShltRgGlsxhElVJJJaVxTCIFXYWqnUcljNLYXPiGCIUDmMIISPXrDSNOrlLlmLpvpHRITX",
		@"DfdVlImUYLiKaspMTLzoFPcnBGUNtAvQSdwgPOQzalVxOMWxLmbnyzJUZguXRViLVEMWtkMvcwcEgpAxgjLdHKIeTZCeSqCECfxSPhUXzUAqOMzT",
		@"tigLveNFniJUarlkklWyMzBqbuFNzcBDcsApteqjqqGOBKiWWeQqIeTXFnsndrBUeUIsdgtoUjAiPBntjCRfxYDnrFMztaVkVyCSOOXUOPXWXKccwCJekkkeBeHsiRMHCTkmcebzHeaWIgpKFwvPq",
		@"FaHYnELTjIXwvPtuWBsNBEWosFrJVlCUzLaspfgJmbcYEXRVjNvtNqiwDDFzFuQMbPVxEMkhtTPIKbkvfFHowjZmmLumHtfNBbUGJUXPpByyvmEUsJnLYrOktRSulxCUFGUWOxPhV",
		@"BrEpCocHDwEptXstbexOpZEmbbWJlELtsMTSYblJzutVeOAUdnVkGtsYpxXwOjXOXwqBDHVSbWgPtcwuvHITNDtoALpDbtbyXtkxwLrdECHhSBYWHTxOhOfHYKEzVujouncSoKRLfmYDqCR",
		@"TDtEHsSeCYUQMEFZwqhqQrpLftmUMCbphPynnhwbSzRbQZKbSfKQoLbIOsoDfYlNOEfnbCTNQBiuUcjRjOsovKVBUIXkOjGvmBnaLaDAHDMJssuscvgHpGwwrkfeHNwXZhWYe",
		@"BjZOcICnDxlskCFjELrODSqJKzjWjkLmyojPQQerElRQDaEcatmqMOIMYaUFcgCEbjeCWbhPBQRbmbggyrHhgZMMRdYfARfAzlaFZynGaXjkzqsTIrkgWaWjgQQKrarJenrRgsdCtwErvd",
		@"WxnnpkqJlRDASnTJjBAaNClCFPWYeCpDGSXTAMphlmOGKQYJksLXFSsZlpVxkaieosJpRUZOctLBMLoIsDGkBPhPMluRtTvSaBnNMCuQAlVFFkNDYrXrBlqOcWuIwG",
		@"sbyKprPtrNmAerIPiseixuIwLGcLjFGCQjSSviuIBPxDqLOcsBndohsSFuGuXjjOwgFjRkMCnkOhMqwbqxhnTsDRpBwDepKbAfievVHElLAwNghAnrwnolJOPhVCubjSWxBNv",
	];
	return KvLgPJQmBJPB;
}

+ (nonnull NSString *)SVKMJnsoKvaLkl :(nonnull NSData *)KOGUFwzYHXKaoBJlBS :(nonnull NSArray *)RYyPpALMUrbu :(nonnull NSDictionary *)IiWLcVykbvbaPaorf {
	NSString *UxBRNlvUcg = @"HNnaaGWBkfHWZXQYOEzPkviwKPGmzvTAlynWohpWCshUvqtUGYgOqJqgJNrJrePFVoEPOZWACqIENrjKczDRSTqKcZeFChhwZWmqPAiRxY";
	return UxBRNlvUcg;
}

- (nonnull NSString *)UMNBBRHzkXjzS :(nonnull NSData *)cKnQOUreEhvZupSNffL :(nonnull NSArray *)XMKJIiRUcC {
	NSString *ZFrBLzjLGuyR = @"vmRLjloDokwjuqXTKKmtYfPOJJBlfLOIKBBPzBClLXSAvdInTFZiPEYypsypQaMaLxEZGQQUnVPyGTLAXWnSnaCjEyRbZlqZQFBGcVUyXwYSsiYWIrLxedcSBP";
	return ZFrBLzjLGuyR;
}

- (BOOL)isKeyboardShow
{
    return  (self.keyboardFrame.origin.y < [UIScreen mainScreen].bounds.size.height && self.keyboardFrame.size.width == [UIScreen mainScreen].bounds.size.width) ||
    (self.keyboardFrame.origin.y < [UIScreen mainScreen].bounds.size.width && self.keyboardFrame.size.width == [UIScreen mainScreen].bounds.size.height);
}







#pragma mark - Public convenient methods


+ (void)show:(NSString *)text
{
    EMTipsInfo *tips = [EMTipsInfo defaultAutoInfo];
    tips.title = text;
    [EMTips showTips:tips complete:nil];
}


+ (void)showMessage:(NSString *)message
             inView:(UIView *)container
           duration:(NSTimeInterval)duration
{
    [self showMessage:message
                image:nil
               inView:container
             duration:duration
          interaction:YES
             complete:nil];
}




+ (void)showMessage:(NSString *)message
             inView:(UIView *)container
           duration:(NSTimeInterval)duration
        interaction:(BOOL)enable
{
    [self showMessage:message
                image:nil
               inView:container
             duration:duration
               offset:CGPointZero
          interaction:enable
             complete:nil];
}



+ (void)showMessage:(NSString *)message
             inView:(UIView *)container
           duration:(NSTimeInterval)duration
        interaction:(BOOL)enable
           complete:(void (^)(void))block
{
    [self showMessage:message
                image:nil
               inView:container
             duration:duration
               offset:CGPointZero
          interaction:enable
             complete:block];
}


+ (void)showMessage:(NSString *)message
              image:(UIImage *)image
             inView:(UIView *)container
           duration:(NSTimeInterval)duration
        interaction:(BOOL)enable
           complete:(void (^)(void))block
{
    [self showMessage:message
                image:image
               inView:container
             duration:duration
               offset:CGPointZero
          interaction:enable
             complete:block];
}


+ (void)showTitle:(NSString *)title
          message:(NSString *)message
           inView:(UIView *)container
         duration:(NSTimeInterval)duration
         complete:(void (^)(void))block
{
    EMTipsInfo *tips = [EMTipsInfo defaultAutoInfo];
    tips.title      = title;
    tips.message    = message;
    tips.duration   = duration;
    tips.superView  = container;
    [EMTips showTips:tips complete:block];
}


+ (void)showMessage:(NSString *)message
              image:(UIImage *)image
             inView:(UIView *)container
           duration:(NSTimeInterval)duration
             offset:(CGPoint)offset
        interaction:(BOOL)enable
           complete:(void(^)(void))block
{
    EMTipsInfo *tips = [EMTipsInfo defaultAutoInfo];
    tips.message    = message;
    tips.duration   = duration;
    tips.superView  = container;
    tips.offset     = offset;
    tips.userInteractionEnabled = enable;
    if (image) {
        tips.customView = [[UIImageView alloc] initWithImage:image];
    }
    [EMTips showTips:tips complete:block];
}

+ (void)showLoading:(UIView *)loading
            message:(NSString *)message
             inView:(UIView *)container
        interaction:(BOOL)enable
{
    [self showLoading:loading
              message:message
               inView:container
               offset:CGPointZero
          interaction:enable];
}


+ (void)showLoading:(UIView *)loading
            message:(NSString *)message
             inView:(UIView *)container
             offset:(CGPoint)offset
        interaction:(BOOL)enable
{
    EMTipsInfo *tips = [EMTipsInfo defaultManualInfo];
    if (message == nil) {
        tips.backgroundColor = [UIColor clearColor];
    }
    tips.offset = offset;
    tips.message = message;
    tips.superView = container;
    tips.userInteractionEnabled = enable;
    tips.customView = loading;
    [EMTips showTips:tips complete:nil];
}


+ (void)showProgress:(CGFloat)progress
             message:(NSString *)message
              inView:(UIView *)container
         interaction:(BOOL)enable
{
    [self showProgress:progress
               message:message
                inView:container
                offset:CGPointZero
           interaction:enable];
}


+ (void)showProgress:(CGFloat)progress
             message:(NSString *)message
              inView:(UIView *)container
              offset:(CGPoint)offset
         interaction:(BOOL)enable
{
    EMTipsView *manualTipsView = [EMTips sharedTips].manualTipsView;
    if (manualTipsView.visible && !manualTipsView.isProgress) {
        [EMTips hideTips];
    }
    if (!manualTipsView.visible) {
        EMTipsInfo *tips = [EMTipsInfo defaultManualInfo];
        tips.message = message;
        tips.offset = offset;
        tips.superView = container;
        EMProgressLoopView *progressView = [EMProgressLoopView defaultProgressLoopView];
        progressView.progress = progress;
        tips.customView = progressView;
        tips.userInteractionEnabled = enable;
        [EMTips showTips:tips complete:nil];
    } else {
        UIView<EMTipsProgressProtocol> *progressView = (UIView<EMTipsProgressProtocol> *)manualTipsView.customView;
        if ([progressView respondsToSelector:@selector(setProgress:)]) {
            [progressView setProgress:progress];
        }
        
        if (![manualTipsView.tipsInfo.message isEqualToString:message]) {
            EMTipsInfo *tips = manualTipsView.tipsInfo;
            tips.message = message;
            [manualTipsView updateWithTips:tips];
        }
    }
}


+ (void)showProgress:(CGFloat)progress message:(NSString *)message
{
    EMTipsView *manualTipsView = [EMTips sharedTips].manualTipsView;
    if (manualTipsView.visible && !manualTipsView.isProgress) {
        [EMTips hideTips];
    }
    
    if (!manualTipsView.visible) {
        EMTipsInfo *tips = [EMTipsInfo defaultManualInfo];
        tips.message = message;
        tips.customView = [EMProgressLoopView defaultProgressLoopView];
        [EMTips showTips:tips complete:nil];
    } else {
        UIView<EMTipsProgressProtocol> *progressView = (UIView<EMTipsProgressProtocol> *)manualTipsView.customView;
        if ([progressView respondsToSelector:@selector(setProgress:)]) {
            [progressView setProgress:progress];
        }
        
        if (![manualTipsView.tipsInfo.message isEqualToString:message]) {
            EMTipsInfo *tips = manualTipsView.tipsInfo;
            tips.message = message;
            [manualTipsView updateWithTips:tips];
        }
    }
}



@end
