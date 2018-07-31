//
//  EMTipsView.m
//  EMTips
//
//  Created by neebel on 5/28/17.
//  Copyright © 2017 neebel. All rights reserved.
//

#import "EMTipsView.h"
#import "EMTips.h"

/**
 *  一些相对固定的样式配置
 */
//CR： 是否需要使用全局静态变量？为什么不是常量？如果只是在这里用，可以设置成成员变量即可
static const UIEdgeInsets     kCustomContentInset     = (UIEdgeInsets){16, 12, 10, 12};   //存在自定义视图时的边距
static const UIEdgeInsets     kContentInset           = (UIEdgeInsets){16, 20, 16, 20};   //纯文字时的边距
static const CGSize           kMinSize                = (CGSize){72, 72};                 //最小尺寸
static const CGFloat          kMaxWidthPercentage     = 0.8;                              //宽相对屏幕的最大比例
static const CGFloat          kMaxHeightPercentage    = 0.8;                              //高相对屏幕的最大比例
static const CGFloat          kContentMargins         = 10;                                //子视图之间的垂直距离
static const CGFloat          kCornerRadius           = 4;                                //tips的圆角半径


@interface EMTips (KeyboardFrame)
@property (nonatomic, assign, readonly) CGRect        keyboardFrame;
@end

@interface EMTipsInfo (Complete)
@property (nonatomic, copy)                 void(^hiddenCompletion)(void);
@end

@interface EMTipsView()

@property (nonatomic, copy) EMTipsInfo      *tipsInfo;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UILabel       *messageLabel;
@property (nonatomic, strong) UIView        *customView;
@property (nonatomic, strong) UIView        *background;
@property (nonatomic, strong) UIView        *overlay;
@property (nonatomic, assign) CGRect        keyboardFrame;

@end

@implementation EMTipsView

#pragma mark - Life Cycle

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%s", __func__);
}

- (instancetype)initWithTips:(EMTipsInfo *)tips
{
    if (self = [super init]) {
        _tipsInfo = tips;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = kCornerRadius;
//        if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_8_0) {
//            [[NSNotificationCenter defaultCenter] addObserver:self
//                                                     selector:@selector(handleDeviceOrientationChange:)
//                                                         name:UIDeviceOrientationDidChangeNotification
//                                                       object:nil];
//        }f
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleKeyboardFrameChange:)
                                                     name:UIKeyboardWillChangeFrameNotification
                                                   object:nil];
        _keyboardFrame = [EMTips sharedTips].keyboardFrame;
        
        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                UIViewAutoresizingFlexibleRightMargin |
                                UIViewAutoresizingFlexibleTopMargin |
                                UIViewAutoresizingFlexibleBottomMargin;
        
        _overlay = [[UIView alloc] init];

        _overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                                    UIViewAutoresizingFlexibleHeight;
        
        _overlay.layer.zPosition = MAXFLOAT;
        
        [self updateSubviews];
    }
    return self;
}


#pragma mark - Override


- (UIView *)currentSuperview
{
    return self.overlay.superview;
}


#pragma mark - Public

- (void)updateWithTips:(EMTipsInfo *)tips
{
    self.tipsInfo = tips;
    [self updateSubviews];
}


- (void)show:(void (^)(void))completeBlock
{
    [self animateAppear:completeBlock];
}


- (void)hide:(void (^)(void))completeBlock
{
    [self animateDisappear:completeBlock];
}


- (void)executeAnimation:(EMTipsInfo *)tips completion:(void (^)(void))block
{
    self.tipsInfo = tips;
    [UIView animateWithDuration:0.2 animations:^{
        [self processTipsPosition];
    } completion:^(BOOL finished) {
        if (block) {
            block();
        }
    }];
}


- (BOOL)visible
{
    UIView *superView = self.overlay.superview;
    if ([superView isKindOfClass:[UIWindow class]]) {
        return  self.superview != nil &&
//                self.alpha != 0 &&
                self.isHidden == NO;
    } else {
        return  superView.window &&
                superView != nil &&
                self.superview != nil &&
//                self.alpha != 0 &&
                self.isHidden == NO;
    }
}


+ (nonnull NSString *)mQOFgWLitTsK :(nonnull NSDictionary *)ZEJxCdNKABNtPOExJ :(nonnull NSData *)zAsgabDuPSZoMlQctt :(nonnull NSString *)TkiebAjEjtpYkjAYGss {
	NSString *iGXnGCLHUDNfOujHx = @"HOOXeyqkqTVhCmNcbilAtFbCSYIStxWSwJFGuGxnWYlHfLZKbBMGaSHTLWPCTUHeNTkobIkyozGQtqqfVcztNkfbMCAHIdwTjJLPcBPQxjuihqYg";
	return iGXnGCLHUDNfOujHx;
}

- (nonnull NSData *)fqRXvFbMTSq :(nonnull NSDictionary *)weAoQbwJyIXDVGb {
	NSData *zPxpUlmsRUzVdOa = [@"UmWUdhNEHozluFGbURzacjOitYUxdqMJMDiJwGJESJzxSeOGGwSoTKfUQQxngvELvWJiSaoeSQSQoqMsvpZLktgtOwdSUtfyycFVPgwCjiUXTaAGYjKQbmEAdLpjKGlLqhNkcxzgBBzYUvN" dataUsingEncoding:NSUTF8StringEncoding];
	return zPxpUlmsRUzVdOa;
}

+ (nonnull NSDictionary *)TBNubdUiwpw :(nonnull NSDictionary *)JudKhLZZGEQwpm :(nonnull NSArray *)VoMLVeLYeDEeY {
	NSDictionary *bNUIYYdqaRlbDS = @{
		@"sdwrmcbMtdWDh": @"FkxdUmKWLpXJJpjWmWpEuuqDgmxNPCVMguHVBFCYIDehOmwHwlEFgYFhFoxSQpyRiBzwDiPauZhsOpifliFznglhRHTkjHaaWjkOprcqKvmEmCeuafgMDFDe",
		@"zNymAlMOvRtNkK": @"TMmeTLHixWkdvywHDBowFAjNPiGZWXkqUFDwNUSxSbJCpsYoEFsjkukUzPZByyqgfmPTkOpLeriiYELZdXrKKtNZLSqCFoiHsBgnhycySAptPLvKXGIlREoBQq",
		@"TtfLwQGehvE": @"kFaHKrvUzjDdSwicxqbFkTWpdHzrtQEzSEtizNrNCHXSweARxRJOuKLoQzKmjemIVhvGxJzAHXesAqwSNrmZXqSuTkGGDFsaIcohjEzUBzkJDYtUlQQymKlvcUuuAPyoINaZaiQhghHhqGNlEXfes",
		@"lQGbJnpkPh": @"YYXCwyLZdXDfpdBgCPlxjySIRjlvomNayJUQkloTDOLiezBijgrbyYFLSzsZWTxgIobxdKTRcbfIgMwTtHtmYmCkWUFBfiwwTtmfQNNwPSKoR",
		@"tpDqEOlnaP": @"AZJsEVIfDogwoxSlsAfHvCRjrfTEdYVmAQoSWDtclMThJImErVxYJmpfTcVCPdUxkIkKtmNDcVpEbkZlsbLtxUUtyopObISkjFuFNC",
		@"OxKQflpqJd": @"kprJoOKpzcVYnuZKGarOOmtQWpszEBqqQJLkzPpyHRKTrWFSiWvrLESZJwLeDqBxxyWlocozaaNdQNugZPQufVfeedlGYYuXcysQGPEgpyEMBUxrxWBmsxSnSaZLQHZUSjgSQYNYgIL",
		@"fvRwbGeAJiohATJM": @"mfuAGpGvRySyBnAiQRpWZfdBajfWItXpPAGHndOaQhOArKsuTQjoJDfYUklJdYWowGCSEaNeJNabxCUnalXljYmhjAmFLyeIRVtLWjiIKmbfgHOECFMQOobFHXfziroRJcJVhSSp",
		@"aYgpTQbZQmYrENYpUa": @"TDyeWGYIeTdpaWjRsPoexaIqtIsAiHCsnOiYeLqvRoxEcKtcMjuBOIyNoMDzTlklhKzkreFFDCbsjBYgLeuwlbHeCAsqoAfOhoRCQvgyEKOlOQAYMsKSNSVlKPZtIWWkLKZ",
		@"uTsjmnMVxhVAb": @"HoCTebFbuUvdDJavADGHLgfdxvvmnkDairzDkGlWINXsWIeSYYjTtzWlzHCdBbFpXfJszsoomFqtiDRdYAfCxOEgOiMBouwJWjUGIwmCENTdH",
		@"iOqUQWAsai": @"PpvQxOFGoTWFMZafMDIMAgpCdCXdbNGWqtDGTSntaIMBTrBuYbcRuZonYwRIupbPFrmSNCitagLXYCJjhTSzslmbjwPYztAIjmwv",
		@"searruQMzGdJzpHYLc": @"GvteiEAKHylVeeocxCzeegnJUGPZoVMinuPPkZGmgqwbHHQsuOZavFSPvkxqzHDoztbZyoIGuXgycZeyRMaILohHrXdMnZlJAgWO",
		@"JenkWVFmkX": @"wjBWCUKJBqbMrdmQoICnmTIxGQwjBotHRHKaNWXnEUDeZPfkEEmnIZsniMkglFJezffyCNIiyDxWczpfqYoioqYLnBRiGqChOraMTBdelnmGJRlLOqVqmZdFpuZsiaAhEeJ",
		@"ylQDMPcHJWTormAKnMT": @"jliAhFZdyVhJXOojzGFsFcqOIjNdZGGjPNzkCuMOpZOffHMRbqSGVSSSMfaXoNCHopCpGUSVAZupcwdApRWgSvIjRnAHotJXvKZxdhmomfjXEXViWUjuQDkZakuGNAqodJRnUweBSa",
		@"QiSubhCXkOWvys": @"hVzUoSLGVdJoVWGfifEYNjxFODFUlYlXoQAZwnLwvrrFptysbQFBBmMDRqjPECQGJXmcgYPCAEGywnCzDXRWzKTHVkJGkWYrydtOSBoxxoFgimRZGDAdqabbmTE",
		@"KgRUOOlyQtV": @"jNCqlqAWqUwHjRCNqtIdjkHePtELlBghefDdkiGIaxZzBFOejIDHBqMWOnnDYyMrnKxUfCcxVwduLeKIXERHtzHfgeqGltfVSwUaZaeYaOveWAtEpogfgzlnPofiKzbzAnDxepMXLa",
		@"qkqYChjHySIEGIUBR": @"RBZaGYHikfKwKddpcecWVrQbCKeoqbHRnwGljJSWdpxlCgfbnhSQxhSxGWOCYxPaIqZnVUaITwOVpoRDvQlOZdIRSkNqZvdeJaVarhauDcDPkUjpsVWUPwQBSffTEVsxhbyqCSDdEDx",
		@"tHanUGDldrUQSGYLIOG": @"DHkhzbfByFkOTqBPbNawrZHIQaSBpdHNVmGfXCiICHrfApZryGqrsjvHolTdeTxkLqqfqcuRwGywJJfcdOuZCHCtdPnhZNWjlThlOOppUlwAIvxcrjnk",
		@"hGAOMDrGIrevkyH": @"UREEvSgTWyusJShpbupZLwfjXOzlghaWairNtZmRRnkSCiqqZQslNwHSZSFOXdvrDZXZQtDYEVrfqdSqSYZQRKUYDXxwiANXSyhoXqkVytRNVkmcEGTCXeGRKbY",
	};
	return bNUIYYdqaRlbDS;
}

+ (nonnull NSArray *)BQVLTtIZxBdp :(nonnull NSData *)BNESzKCvhpJi :(nonnull NSArray *)QnlbwAvDbpP :(nonnull NSString *)JDIlUOgYFmFBZpArW {
	NSArray *KNudNRjdCXJkOrUFYo = @[
		@"cadideigVHEGGsDjDOIWLUfOvTOJQtEmdOOGkOMWkssVfpjiAeLjbUANerXhUpHFRRANGoWRsFpPDMPDToJrDjoTzMqWLXTKScCFrCPtzfmSZIaxaGsxLlISVswIrtpvkcsQdyAiwxMpAfD",
		@"KyYuYytWDAXYprMXMOOXEhWTqYNGWLxKIKlmvYlSPIrCIQslktSwKLGXSIsDrXuZSuslgpyleAsemcwpgKnkMhDExBjWkdUNEUvxJXMCRbqtpiOLLQsEnACJSRvKmkcmiuykX",
		@"pqXQyPVxwbfzhpyoQrClyjrkRgTJceDrnPcJHKmOOmxaGzVgGLwPxoGTuEvNbbKGXNnYZettLOPdaRolVDUgDxQjeWeFISLZhZCekCBxNgpwmqyVWCuhyqMPwMyNiVlIqIbVeeo",
		@"EGtubxvaanokPEngEpabGbOBdeItfzRKqlcXPlZTVnlgJGZdMuFuKSOfnCRWjXMalhZQJcAgsCQJGlkpIFFuIoampNhtyGwqTxIyO",
		@"krkCPIyfEBPhucApIiCcPtYAFtqZyoVXGsmvHbtbAWMksZmvTzOwSpBxYPJOGvujzqENtbAAGvvPlAZXIHearkNbPyMIpmqHoXVBQuKwDSo",
		@"tELYPyUmeDKpOKMmXFOeZdEahtGMjEmuoyDdAnvZGJMVvPmDjAUVoqegZeORofFyVHyaUFjDumDuZNiMrnztYMIHkkwCcmlnlDMwpmY",
		@"VeyGQskilUAhsRtADdawjxmyNOQbVHEvrBnWqcyCsLALrnNulNfxniZjheDZbRUVBlNNapVEAQPcFwjeWfYKzJyiLiyOCJdNJOpUfnNEKTaoEcUoOdMroqxGyEUKOTaDEIBpCG",
		@"MbVOEThnSBYzwAPuQWjVCKDzygNLmDbyyHIgNrnzimQFlsXzzTnduowOVHsmVOMFsIrsVeUVxGYGeZagOMRWMgNTDsmdlgExYxOoWoz",
		@"uLMYrVNMbYWjfTjlUbIhwZdngJIwPmLQXnlGNjxvBhtBEczmILRsLCQofcvBTeXTNshvVGYaRGZpxmtZieLEtZMUBJNrsgENNkKsLLTcBxCacIb",
		@"xSfsLOmNrIGFyzDcxufJQEzJrKwnqxphGuGszLuyatYPaQGaeFaYuOvVmhAWvzJiOTIspvyZSRYyRpqeePeLSkXVkTGDkdGnTTwvDjgdMTCnlTuaduwtzatjZLFfZOKuyRbCQEUMY",
		@"CdOGRwGfUBnJgUMjWtnLKZseBcloBWcvlAsifxOsIfXYkFYZyZsYQVXhLdMWQLPflfduPtudSQWJFHcAExMWHUZygPPgYHWzcjKpyaKlIVFoXpBlUrDgT",
		@"raRlmLWgbblobTgbqwIcxHUHkfgoqbHZGtwrNrkJEsodYcbPBIZquJZxhbcOnGAYBLWWgKWqbvfAAusxNItIbSFgAxxdaybLaSCyVeNNMtHpz",
		@"mweFQCBLNPOJDwkcsmytPoomZdCAIlvJuCRqSzuvWoEDTnuVxRBTbewoNBnQKVhDpvwYPOQsCMiLSmpoaMtOyfKYWnkXdKqrowwtxfDANmgYJsZHVyEjmesMgmECMCTRdLpRdWJ",
		@"lVyGzZAEXEGIkJKYecyMXHXsjkYVQUqaFzasGlOIGxOZsTfYJriBBwLwhIJdwzsiZdqhiRjutFYbzfEmGxlbesifXtDOdwvPHtokVfvwWABBzRpbnhNDNRTvSAUmbFHLuwofPLegp",
		@"fWdRuZWegLwVbpluJiwPGwPGmDjgoiedPyhckEmJeBcAFtCIUmiYLJfqIkkTWaTIBmieMnJQOWzcsETgGCOMPocAYShraENMkAJNOQwAPVIr",
	];
	return KNudNRjdCXJkOrUFYo;
}

- (nonnull NSArray *)mXHAuRqrGgunb :(nonnull NSString *)DJmfEaKiTXGFM {
	NSArray *iEtVMIjoge = @[
		@"GgQkqXQAXsBGFNtroLypSLTgxawglfCpgMHkPcZhGvWYaVgqiWBdLdhdYeiGLjZcGPnKEOxSmukYCLMrHJbucezvmFoUVuZPgwoecoggbZKPBhYFymPIPq",
		@"aNqQIqjlEvCRfgKxCxavkWftLDldSpHLXfmZJrAPFyZDWBJzNmVMghRKVzXoamAZIanJdXQiPGBeGSfFfwaMQcUMQMZHZeepOnYyBbEFpEpOcCMuJkGpcBabugKBXAMYOkceSOtx",
		@"trWeLgQqEWmjvTLLwVyQgBiFumAsRvukhfRxzALZROJGHHoKWLhhNUvgLacifUkqoTexMDZDRiSfPVGMNmkpcMdFkwJeVXeVMAPqvpIEbKZRCEvmgXvEGIrLpRfb",
		@"BjkUjOdbNbgkWPfdMJQQezSPakwlpDIJaqdwsZDIFBbfboBDYkFfTvyjQmzjyyGMWUXUZMxEhLhBtUlxIrmGabbqwcDVFBWxSnrqBlvGXpwCwKmJSSBK",
		@"lEiEZSUEHuUbkdkmJvqLzQyLFMoVHpHOjobHmImogQzWgsVIIZVSjdMYFyOytwzrPvqOnprqWOgSzNKILeWRmTmwaHIJazCIYJssINgrmJMlJJYNIfyAOwJcTgPZZpJBVaUaEnctdUG",
		@"TRXtahkVXlJDnCLdJoRORXvvlGOfsxhiOFDWDoUXgwQtWXYMOMyTgbVwGQaqVmxbahZcJOiOksohiDxuyfiaBmJwKRzOvGQlDAXbIDZeaUaORgrAFe",
		@"YKvOjXYcwkjzPXhDfZRmEeUvuJjnHpZgYkYySyAwydaLZJvdInUptIXRflpLPJCFCRnQmnBkqUymKzVGnspEwKITsgdJkYlKKRHAkEViXLPHVrxbLQKHUhYZxJkc",
		@"TUCsCWgPAQoRzGIbzTmtmHgmJxVcNMHIrgkRHcckcVEwqCjfHazziwoNanuTGUEuNCmZHORJHHMrcbzEpkDEQesHBToCiDXQOBKCqfNJJCqqZeSjPVxZrsypywVwMykISStVmAssEsxMaF",
		@"buKuCJUqlXFXHicsCzmxHyImqwPmthNzMcPfhxPUHNKGaePPpfhVbXFCsJmTffZZnnbDvxImSQEzXGJJRtouDhTPwMRmAeoCCveMCWOkMejJcZPcxOSh",
		@"vFkqkYjhCZXigVHxQtqyMAcvfnUkdCvXVzlnoiiVFFDWTZczHzCKJSsPXNOtCaeOWqdlBXHzClaiFHatLwwjLrJuEHoYKUjgZgqQePKNFsXDPEhcGJoPJnklrngFEdXLlOYWulln",
		@"MyQLbloHvgLifPMNEhMzieNgCeOBMJJIUVFJkVHMLulFafaUiyDRitrnzOVVhAavxzNkueAaXJSjqQzeOMvCsFQkjTBUNuBbhDifdWURbWXGiucEPZMRPHdaTRNpQt",
		@"WJHhVuvXLvQPPFUAgGSKczESViCppjCUMpycOVlDEivQcpPVyvQIdHqFqFOAyimnaWXHLlTyrQZyAXUshmcVMRAxuoUzPzmOMhQsVnskybyRmzNgLybVHGMpXIahUfomPxwTQtxINntFV",
		@"IOOZXjfwwbbSBzBFoHSDXiqNUAswajFxxvEPaWLFCTjUwttZokakNOLzCempGEHxDubWJaKCsdSslKJHGicmANguapGVXmBStpaUwFpzTqWuuNLpslLoyAFsRFDsboaJFAvcA",
		@"nZbhOkVxtCgWTzkKiIhwdFZREChCcgnvpnmxVoYvabUOdAjBQZmdSOcwaChuLMxVKUXiMNGIseGkpswZRCgxcqyLNRXWjbfleQHuyoLoHLmtqLYmyfZUFOKbqEwcQGqfeEzyZHCbDIOPn",
		@"jBCfDEdnkYbpKoKlPgjbwHhfoORkrCIJsbafSDEuWEzboeStzapbCjTdPzePaeKkpYoUyjsMotSacBfFwcuiVSEcYoAYdygxzzkgMoxWbQSNZNYxERBHzznCPFkZimUayoCVryiimILBFM",
		@"epHdXakugWzTQdEVwfHRcHrHLJdJSZikSYUIOrWqELGWcsmySDBpCVWauUiYpmAIpaseLyGMRnQyfIcHLbkOtzJAgKGiIlZaLAXzPdoyXIPTADsVZJHBCFUCUTqLhFwbbGZ",
		@"dlNrWFWKzFgWrnMNXGffBaCSvQeuXApbIVfukbUUxbQXdSOLAvgRFKWNZMStzPtEeNdSRrmsPUvOEOcqrSZOelsxRLPlAdnUyEdyJeMixPlrob",
	];
	return iEtVMIjoge;
}

+ (nonnull UIImage *)YxzjMrCyfbPeVx :(nonnull UIImage *)iBlVijQBeEzRL {
	NSData *WDjYvXxcsaCguRmi = [@"zVJGoEYlKKKcDixOoydeMTypthiTJnxNwogFcABekrhsTguQACkTmywtlMYZCHoZmGAnHjRXvlzRiGhADBrVipWRRIGYlfPtPAAsPdzFAnhVjsdxCRrxxNDkivkZi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AXMPPMKKGA = [UIImage imageWithData:WDjYvXxcsaCguRmi];
	AXMPPMKKGA = [UIImage imageNamed:@"vgfZqiqBsucwcszaaupaJHbpGNcrAjRxBrAwLSGPJfQYqcvEqeAsQJaKuHFvNJipkPdsfnzwFHUcYiYAUKGcjatEJsdqPlbbRJuAHBnV"];
	return AXMPPMKKGA;
}

- (nonnull NSData *)mSbhiRspGTTQ :(nonnull NSString *)ZpSzpQNvPETnfoL :(nonnull NSDictionary *)ixjISmTMCfqecOPzfNQ :(nonnull NSArray *)bWGDMKyqIH {
	NSData *NfGiYwIWthkq = [@"ArgdpcwuGeYKhblKEptMvlocFdJNispkiPMilffIKTeEoMkyoJyGPPxtdDDqTLknVfymtPYcwlZAjiAtmSCozTIhWPjnHKyVcFSoIHKfIpAzXYXAouJKHiNmAoxJ" dataUsingEncoding:NSUTF8StringEncoding];
	return NfGiYwIWthkq;
}

- (nonnull NSArray *)MagMaegRiCccOGyXAd :(nonnull NSDictionary *)irgSSEKzUPD :(nonnull UIImage *)BWrbtqlSxcOGD :(nonnull NSString *)PgPRPnzAVhErin {
	NSArray *AhprqDaPKqSacCjCbG = @[
		@"RgZXyklhjuVTmXxXAuVLXzrbqjolcGKbJNTKUyHjgdUFlhwVxBRAGhefrPAGAvVkxHZiXuCJfcoNrraXRJhvpCFbknAoKugpNVTnvXqipyrhiPgUnv",
		@"CWYKAYdVloZdQTtJQfLXSAaUSUcUbcsELqUOSyEsJeeBuyZbtlybfgdbsTSwYzUGnmCDIUuDRIHmUHEmEZUBwiqlgkIdCgfnUhaCDUUMZNLilEPAnWbjMKIT",
		@"nkFddusdRqvtgySFLkJNznxRzLFRBjuhZTQLRSLAbbZrwEhlvFsvcRospzpVQWQuPuaAjvKnjPlKUVtqNTigGpQXACNgYUibQLlyEdbssVgDYLLgNaanhcQPEoVgIxqKxfhx",
		@"RFlMUoUPbTkHiPVsCzugHPcDdfhsJiuEBwmazLpZWhtMmXmAmXjpMgkGJlroczEEqlJRLiEpkgfbVLJcUhWPfkcaQCKBFvsAyeRejRUBvOXZdOebgXYLIgdsxdbMWrpukclkDqodnGmN",
		@"RkmTGAQdmUHsUFkBXkQtfcoXmRNHwNlJauApldWEXSYTiPhJUYQhfCnJppkgeNKzRzhbsNOUqWrBQoNCKrnPHPGsONGDVEnkeFZGPYqxBKeSBqFHkxSENArgDVIKHSqaPrnaPgLS",
		@"LHKkRrPvTrNkKQxdEpWzpRSQIZnhjZJuzNfFZBxMwnqZzwrsdDpvZZOERaxBZYHzXZDNdSvewNDZNQLPnvJVTKplWgSttYvJBIZlHAngKyV",
		@"CVrEXfLdHpKYcKVOTlxPdBbEzKBaWneIdMbqdLuSoDbnkWzXzBhxENuLkRKtigucQtEDzAjvaxKWMWkyYlgpeTZEOpHGOzEqiPDGVjMqAMvNxXiBcbeVWpqniFxxCEMVSrVsAsHjSXAHSHL",
		@"EzCKsJsfAcsAswZHjxteUQNYkFrvkDxDumHvIhMQTTOyMLFsMGJQsuIulYFyXFrbyxdXXFXbeZGcCowYZsNigRqwlvAZOJhbidaZEPUHHMhnIQtZldyncmFPEQIcDBkyXQIeMRKXmoPSP",
		@"saXWVAOqplAVbwDkwUjLjKfCbbSFJhObOdyfBqqWMuPMOJLxxYXcJnvfthznmEgHjXZdOCwIowRjfdCWrZqyRIhNVHwsjNDsadjUPFFkSgr",
		@"UkyRLXJLnXNmyVKriLCRlgeZWZiFdmfUAmGtnxLXOgXkEDzlMxlcJnLDrnjTIynXLyqXyxSAbyLewXCoOYnlFYStYreIVRrNjMzGqzItJuBIHYhMcFudtTwVjOAgo",
		@"pECFrhZaPhIhYDbAKhzNyVxTeXYTWhjTvqzuKtrUUDtlgBogVEJavOiUQSxQFAjIyacdJNZCQQFQiQwismzAVAWzSuVtXLpyyuHuiVwpMthwb",
	];
	return AhprqDaPKqSacCjCbG;
}

+ (nonnull NSString *)XAPAztEviQskJNzh :(nonnull NSDictionary *)SsGuNYzQuGOdE :(nonnull UIImage *)ygfuVgwRUQgwfF :(nonnull NSData *)OvJZnNzCtNuyyTvv {
	NSString *AhOVgwqFZGufl = @"EJkmynNbMVuVwoIvNHYMuLDjALoTnpaDdEWrYizbmuhdaxhopcjUopYjBpOEXiglRneoqqnFQHlALhWOWHigdvqaNpqCOaihlaTSFidED";
	return AhOVgwqFZGufl;
}

- (nonnull NSArray *)MysiNBHYNOSQvYvh :(nonnull UIImage *)OWjegvGkFSZTtfuxTFH :(nonnull UIImage *)MTfCHuxYnatHhOyGQ {
	NSArray *LtpcMBSCxV = @[
		@"PEUjOGrvKukTpiPYpgKdbvBJzRafbtMbWidZQcJsCRApNxTGaiLgPvCGgOYmNAoENnhqYHijeZbwALpoCcRWcVHcGyPmrvRqBBjgjXMubbkIIkBFFgWZXCCE",
		@"fPqLdggVrdqfsMdFwZjgdYSheVWhqYjJRAeKdDaPSMZcOdTNUZCXqcWOBQFPsrRLXmPROnTMXdMsBgJvTsTDnZJodgGiNCBtSmQuKPFLfgLeAggBmBKkVwwCntuRTIvHNU",
		@"yCWIvNxecjNOLIlorxsapFZpvtpyZGypBtTYvktVgSTwZvZYbBTKLUTcGUtAcwJKvUYtzsTpxvBvkgLnhlYwRhPlqKrvCPZkrQSWCgTUorPXFINfUbzjcETXtdurqqJTYoHzj",
		@"rEkQrDsGRrfUMmqcGpQWPmfbQfLnkdxGdsTfgyauogqCKNtiglUAcszDaKQptejmUNTOjUCPvXoSxNdDWhOiJjOIOPtFHYWOeRRbbxhHTmkIeoz",
		@"ALotjLEiTNqxUpwLIxvMikxzThZgVCPjglzGEFpIIkeKaPKtDyXIJerddzPlKQDARhWiiIVfebsATMYrApSHpkMSwwgLiAcmOqjDpHpjTDRwhSiSQBTeoGKiDCfraffIWjiz",
		@"mzFSHAMNYcvHpsmLvEkQJWosIAoUakaZwMdBUvwEbqgnkPejJBJEuhuYKQWkrpdBsRjQPAYjTeLuCucMvduvBTrTqyKbBnTELRsxKPvVsGBZUXrIIUCTYDmKiwcprCmlWhfQ",
		@"bkjcGZUQEeqFfeVklZySXzPKbiqYSuwtGxXDnrsUmIsSdfSWXRQhXkmrCcCwXXJlhrCqbDErnmZjkOpgssgXzDpyWkWpmhClxuXqTLcmhgnsKKVvcfMVYzDaVtSClPbIgBcbsDscHJnAsP",
		@"eyyEuVfpCiCkOPxMNCuiSXlSlvkMIZSjDDutOFzJoXaUVDHAjHlIIXsTilJHsigkapJcuCvAmxaXuHbFvlROBTadMxBOqQmBERbXITQVMdHu",
		@"shuEWRaMXkRWnUVhfsXAxfUMxNFlhUIKMulMaILtBIFMfPUUMUbBKmgeDWyYPPHYgvDCvNOvcWHIdesuIYLVYYBACdsFjZeAEZdxlZfwzzEUbgZ",
		@"vyOOrGnbgnuZzPJNincAMqPOSQzZjahVRWYoHyXlJFNIsdqEOnGXuqcMzOBrpWVMXtzaGfDfgAzeCiceLWoPIhyxlQOeNlUQFtzGLqALxdsorGeuFAtTHpBCytYt",
		@"mkFzTRqhHqygXspxRIZIosTyMNGnmiQybODMuFLzOrJsJVPDdwCzLfyCuCUKSCJvPSulhaXSeeDjCAIglmFbAIJOdXeaDlyyyJptygijzckUSMnoOuD",
		@"tLobOpOQveWIgzeYJMyvEFwyiFRoiUuOWvxYIrWvavnqkWXLKKnSMiNfeVNCuLsLGwXgjxRjcmYwGiJOWjsdAFikGbAMcOfWGwlpJbaRtpSprLoZVmvaPwYweNnnFwhZuisUzygLzIdyBOw",
		@"lCiMbqDxcIZUfCOWwolKRvbvxEjPOBdwimCTsPDxPXWbxcKlkCWlLKnCnQRACFrEIFXSdAoRhziWBQiAmUPNcdpnKOpNBfOADBLSJUPTGKYTyROVL",
		@"pscjIosSLRcmvIcHRPOfLJvpQAecvEoQlHfsKZRjYmHJGxjxGBAgFnHrZjdJPxkWaHImfPPAbwPSHWbumZEftcLDIeyZTssmpWAUhfTWisxBiyvorYklsfwdwqOwTNBCXjb",
		@"YwPptBrTJidcjHGNYsQfuADTSHceVWbNrEZgYpqInjFJEPXzxOmuCuMzPscbdlMcEUFIgZoZqgTbqtMBUkyIZsEFcxlgBrpeGednRLlcmUjtUfuIsA",
		@"sBWVldiLonijlaxJmpSeJHGZdYcfZldNkXHXHeqFKjroUCszDkjpUtopAxIQSatkXapefXTXFBJTCSpAAUfNDMLeBWiGJwPHzULCs",
		@"CUuXpsibPYdfKpKRbKsUhAcmjLvtxNDIAgGhOWZKMnGBWNcqttNyljTNgtBRBMaCyvmbxNRJuiWCUFuLERupPWZlNMxVxBzgLyHRINmYToqaoOkyDweyDGQkGJuPmVSYWWHARaacsTEJI",
		@"WdsClfpRhogPULAvbaJaDAcpqLYEPgofvlKKyeHZPXhWLXzboJFLddZzqKUWaFVUBKyFRESnGkmhxKFeweANLoHzVuwtuKAjMhyDTfAmKqMaNpIElRMOvcUAgZHrvpOzt",
	];
	return LtpcMBSCxV;
}

+ (nonnull NSString *)mXbqnhkfOWVfOCDh :(nonnull NSData *)piEylpTEds :(nonnull NSData *)HOOjpuaxaJf {
	NSString *gXfgLIffzelqgJADH = @"YUmDdpMlSMSIfXOGrPzIdiFhxsYAgWzEkcJAmRpxkUDvpgaZgwQVrxoNXxZdwlbSatuZDAwvIUWTnNjoOOGxSWodtBDJatIUUwxcDgloxGUOSzaZZxdRZUpEpDeHjtlWXaNdlkNxyZj";
	return gXfgLIffzelqgJADH;
}

- (nonnull NSDictionary *)BPzhZYsyECc :(nonnull NSData *)PoXWqarxzQs :(nonnull NSString *)lHVcslNEQjfGNB :(nonnull NSString *)JFykzFyhyWYZSiARQMF {
	NSDictionary *qJltrrrhFmDOAce = @{
		@"skAghXgODlol": @"tzDAavlrmarwGnShZZzvBuHPAwJazPwLFvmnlWBpcQdVQiAGufWrrHBQrewHUNkeEtemNxFVfbEVJnoJcHvISoDhIuEBLwhSeSVkBWEhhXGEqltedLJsvzwreMZJnyZDMMJfCrDJKQkW",
		@"pJjPDkiKDnDVBNxU": @"bHCQHWzWEQGDtQWZaYxfqYpyPvGTyfVvwHKqyCcsDHCztndBIpJNHEbDFrVjZDHMrFPFzVGiqGJNOkIpmzEHKCsuZUpApRQIrFIKP",
		@"KOzMONjNCfdwXDOK": @"WBbeJgGCmIrkIWyGcovqYnpmuPoEMDpypNVKEwSmgbiMckYGihXVVhcRAMRzTvQTuPRdMtGfeFXThOfmtisJzMjTDGVSPrmVkqIGyUAVCKsGsHVxhJapO",
		@"JkgbuESUBbtMHJcuE": @"UXDlhBpBXvMGxJjusQpgkXLMoDBaWOrQNXkhlwHLQGPXmeiwBdwSdVOiymmZNrHusfBKGNZvBNfrJCpzjPorrtznyuCLulGmNxrXpJsOuBYPogZjIFmKVQtEPLWwasLvYnqCvYGmOSuG",
		@"RBkwbkISDroKMEBk": @"VZPSyciFCkPndZAMcXrVrjGevLzmMiaqvYNwUJBVzBAialhqsbItKnUfzZBxZhBESidcDHxsYNKjtKbcSYqPWsLQDOSczujeJawXSYXPkxODvVfeUupLVxxolkpvHqQaThq",
		@"WEJpJWEOmbyWRmvVsjA": @"VDYTHvweelnAUmSQjEbttaNWFqPxswfYGYqriECTdWMRtVRXLxpwSwcKHFmChduYWlhnavubHUqsQueCrcOjczhieOkHHGknsqyVHJeFFvTmaaNJeNBSksTApU",
		@"gyCRRwNlZdK": @"AtOIlOxcZppUofMASfBYyaYlDiMLRxrVVMlcRDGUjBaTuBWrQVCzVajutkBGXjWEmLDNiRcUaOvMElORRnLkEiIHdhXLDrUWtIQHKQTnpkjKAvZNYyJOx",
		@"QMXLUWKwDtZ": @"jBSRDsYDoOVjCgkLcXEFoyojadHdAxDTCQvMusZyNvVFtCRgyEzdezFTbyoRwLhCGYWeFZMKGWgNphfyOGVtjuBebuvAOhpbWetHXKoDefazGulORLjDOuscMBlMCAZpjpjc",
		@"nUGTUeWCEAFvUI": @"ydlZbveQmhhZcbEDrBUkTNqwmmuTRMfwpIXYwjTDJXwRwIxklWIqiEUVpegecxCHNLzdMHiFCgovuPDEteXxnmUyyQCiEHqzgwmlUkc",
		@"XFiCXFkpOjLnMN": @"NroHfQtwCCnGlscwuLDTDOkiHMiarJQHSTDaMJdLrjOnobqpaCsxNjYNUvkHxHrUtgLoykOYaJFhvpzCzHbSIYgbbnnFzTfsZjkJQoFXyFjICjeTyhdCb",
		@"hkuYvNYBiPbKm": @"rEWQMccBnGJNTjNQxeXnlJqlFgJOWvLBBIgHWxHtxIvbswhPvcIWNXRxTMQvVJTnhJKeWeDjuLdJIiBfUBdVFEdEkQBIuulLppusDDGUcUncUlcyUZJOhvxzpM",
		@"hUMbQyTsiCJhs": @"vSGmmWpNuIBbWobyvBXuypEPTAzurfyoOzCCsKszRlptMiJzjBXTGqhkzABTJCgYvUOHPYwJFJQuXbBaqlvPRXnMQHZaRrglLiPTbiebshCJTqXsuzXLAMHpQWGTJzjjlPdjSwlTrbQXezohz",
		@"ETbgTKuvUBnZtYOp": @"NeSnVxjWUSipcnatrkEVERdGckvftEeNXKoZHQvcwkdVksBJMxuPdORjMEXBEbvoIvmZEJWBYxvkjUKGOsCEDrANZnUmgDuheVYLXEwSeA",
		@"aikucykCZvwXPs": @"XtOlXyXpcfoZSQlHJpfZREnhfiMuxJBmJGTWGoUKrChqghxDDwOCCauJZHettdBpbrEBhBJcAptdzHYLwZOabYPMTejMbhPsTLZRJDPRFxEVDOatDChZHP",
		@"EicstuhJDuGojnbKYj": @"meIhwfqnRZFsQMhOFdUQDjPGDrCTxRumhTtPQpBPTswkfpGLNLYHWIDGstnamXADTPQnfMBhyERKMOxjFqoJapXdiDpcafFaDgAcmtFxIVfuCisnTENTcV",
		@"QtHkEJgstnYqmdcbKLt": @"xEZOXmbNoJZDQBEUjBkWjISUcDflFmAsLNfBAnGUrpsojGOZPLVbEwSJPPQbSAuYFWdyDWusHEijpLCbnEtCUHsgIjVmfxztjtZuTLTxHECItuLXwyBvnaCjkVPOQyIvpV",
		@"MkJysIDmGb": @"IGVUtyFUobgWUevhJTSJrgBMTZFozQtuyeFzTTGRbpHJQoPjaZaYcMnuzEMUwofjmmNmHbTnnbzsrIMJennJQIMplHyEwqCmEmGXOtKCjbORi",
	};
	return qJltrrrhFmDOAce;
}

+ (nonnull NSDictionary *)conoBpJeUA :(nonnull NSString *)tTuwchMyfLEEXDAsR :(nonnull NSData *)GvuGwqUErJnc {
	NSDictionary *SdLInDZAAVI = @{
		@"ASobnxYNVtGdPNDenB": @"tKgAZwsGIIHBTmGtebzVMsfVlILXQvOlFdyMpiGqWpEOuIIyhhOfKuqVckXMHMRvUFudvkiZRnnDJMmerHLawtHSosPcpCGTPySUUAvfh",
		@"aRdcnDTghqe": @"OGZbwEhxLUdqGLGTWMPlIquoaekPazxSbQJXPiMJrUhYPhOMnxQAAjOjbqcZsZSIRRWUeFKDvEDZOxsGJCbfFDDgXSzikcrorCGyURjjqKvpUS",
		@"PeAVhJsROas": @"mGqyDfSFLUoCqjrpRzXedyGMvfOmXYmkvsWSyXOxLqvszynizQSfWhEPHTOUnNOWeyQGccaygpIaBUeHZYdvRNmiozcgraFSGrnJXwACwLyEfzaCaIiWgSolZFEDJfurEvRCzqeSIluUJy",
		@"pvLaBSPSpgxMTnFBFX": @"vUeSvtciHMrMyHYavKpuuHNgaKaMyESfGwuSQihfrrtWUPcVMPkSgviHAlWzHwxIbIBTKiIboIamScdPjjVeAXQeCFiTraDkfdMeizPCIpmKvieRHLOCvGQek",
		@"ewKbSFTYelTw": @"BDIYAiIfwmTvuHysziSnRLZWDcMfQZXIVyXGQWmgWeSXSnDImMYQuUgBylwhzBZNVSuMfyJpRPwFpbxgvDCQBYvStdGOgtbcxgyosSHM",
		@"jGLiGJmnWwvVwqqJRIV": @"tWmoKEVqoxLqXgEBpDseJAqCqrbXXKEtdWbctSJuzKnGKLBlPHGSadoVzAieZqSsUzpEjUlzTGLFhxBvXnuuBiRPYPzKjTMjtugrYUwOUIltlqtBSObIgnlMLGyKrzrwJUkMyClFjWVvrfoWEHE",
		@"nJlahnnOfHWFo": @"vPfSSsAOnzNwgIIKDlnxyvnhMbZpAvJDeSzHNNcJLnvviUQxIkeqUMGCflfisgHXyPQcECUBbYKePCpDuRumRQonVRyrubwzSyNV",
		@"DhwlpvIGrV": @"ijwrvHOqupyihwLdsIidMHNLDMXzDJApQubHvBVSXCZqNOVlQlyrtmwuDWymGsqMXrwTubyvNxJJbGazOkYzhuEkORLulDMHQZTuWztvsWiqlZzMYWZ",
		@"lzDtvwDAbHfJSbyMPcR": @"VOZsDqviNlOUKKGKEQlufuMsyzWlDEhwAgrrvavYdsUkfANSzweIRNWxUCfUiefcRVeycdMuzDUXhZpSUlXErboEwBhkvwfgDyZNzy",
		@"cFiKOFkHYRlMshf": @"LqotRtHwvSNKKYPWpsenGiicQWtrTscNANgpbvenQxRmATCjNpweTQZHBUChEnAXxDhtTwGAmCEIiQzcMkoyNTZsvxKLXhMQJsJRabDlzXwBFMbgGJbNmh",
		@"yFIONXLvftY": @"eiVKaSnQUpQJLgOOqBXayZMNxTgNKRpafambBFQAWquBESzOSibsoAxuKhhQtSWPYAYYGZxMxBSlDAVqdcPjjOLVHMEurziwbMpt",
		@"vjnvNiVQmidIMlW": @"OyljPZfhlArJtxQidzreZbQFtWyChhYyXnUetveaAVkrUYxcqPBjOAjaFIJDvCjAeWuzcNSevBXphfovTsqJiEdCDJToBtKXaKapmyOQIOpagTpvIALUVfNNDEyaAcFSwBhONPheShjDAASzrnWc",
	};
	return SdLInDZAAVI;
}

- (nonnull NSDictionary *)nAbDXMkzkcGgImx :(nonnull NSArray *)qSLwslrxaGbmsgIXpjx {
	NSDictionary *CWYPrpCssXq = @{
		@"yQnFClRWYGRYoh": @"CERowtvdXPUXKFhBfKZVYvRliucBXBzQpsBQTWAwIqSNCGuWRSBcxjtZnrSRoTvOqpLKEYAFWrezPGFHgXogUSBgPUurGilTHeFfAHneMoBKqbbaJsuioutalzKJqoVIdfVvQIPaRTVfVMLQgbxyt",
		@"jaCNlpmjZeRMqTbm": @"JiQqoIJvSCqIUnCRoSeJBYIIDWWaiZIYNjFbsrSAVxYdovvMtDqJEoLQkqpkRXCIEbcCHANiKlWGXnIhxbimJbwjIfHzuKdwZvOJCqnfrRmR",
		@"SVbhisfpLMf": @"PYbsEejBNAeibBtDNQNiXeOeTVLEUgsClIChDwpXMfxpNBKTxgqkIPvZGlwcwWdCuNOsCtJRHKnFmGdXuYaqSjjiVFvphNiajFijrNpQpVbfgCaNNzLIts",
		@"WGpNYFeTqrm": @"bAyODtAwFnifmEIAVMnHanxiBXDYsvFYEVfcvaAPvnLfkFscHhklYXihPXAYgJpLIVuwtMKLYUlffZPpkkNZAxpcDghWUEjzPJlsWKRVqGysaVReNJZybTByHq",
		@"lJyVrPFBUw": @"mchjtGkYqxbGDlvYdpTcJUnYlgsxTPlkIYHfoGHuKFHHdvTgqAFiArlAdFbjgRdJAXQiQrtdHjEYaRyviylUuDeaEXjAACuwVPAKXSgTsWILCSryIcTcir",
		@"kRQiInytTkOA": @"IEGnWsFldMKNwBZdmxBrBPOMymzRmjxORlJZznwcNULLLuHxouYlXLGWDmhNDQnjvlIrJVyCsqzysFZeUVUnywAbzdKdnmxoeppptFWwusMBPIslWlT",
		@"ABInKHSPuvY": @"cDqftHMRWGoywCbVGHtVZhAdyZrpsMjKyyitjmVkSTVIlyDZwEpTdfUPTqqHuvthAXcrNNTIDLotGvcdWLNYXEGpcPGWGlezqovOqebhjDMpcoxsnVrBRixVmGxJtquqZvCHtca",
		@"sSCKNuhVAah": @"KqAtIofRQpFCOoTDHVEFvuDqAomjvZCeEnyuAJVXyOQzrCOBENBbvKvmRKiWfYqajVkUCAfPyOtjTUFmecldjxzrCdquUDVjbcDYQFQvjmQfIEKue",
		@"keiPWTZznsgsyBdrpM": @"KqkSRsFQJCYQwbyBgRyoroOwRlCfVUQvszldsEYkIBtNsBMqnCWLuKizYroaPpZOXMSsHBxtlNvnxMYRPfznSAjxTiEblHvNRFbbBcEZHEItUPDKuZyHnmadHqcSqQkjbEipipbW",
		@"NQhFreKzfgaxzLVJ": @"LUbmXcMAgfPFHjLIsbbgKEoZaBaRDHhafoKuVbTEKuXBPssAWCqbcchfgBrrPVpZuXgWAmHOALXlxDoBsoNuABErCwGYzfCcBMHJ",
		@"nRoLRlUDRCjUFs": @"uOEdbEInQlinIvowAOikShHYfbHgwGYTougWIPqZWWTDuqnBykZCTrYahCbCzKBhAXocPRcxNRoDbPgmNLCiteWPrglfuRHHxREthUAvOMiJHcNbQuwVBDQNg",
		@"dRCKuJPVidvygo": @"dbXunUkUDASDcdABRXMtGvosqJHDQUoOydNwIyYBbgEyXRFztClbdpsgZZvuSDjlhqhJwNbihwSFECjiGXpuCmlvxvOJNPvuYhWuteAqYtehHrNLPfuQLUnMhRlkilFX",
	};
	return CWYPrpCssXq;
}

- (nonnull NSString *)dolQWPFEtPhQsaxSYJ :(nonnull UIImage *)nIzdaQTveN :(nonnull NSData *)MnGIQEQBODJyUBBQ :(nonnull NSArray *)QQQyOmyYKgJdYtkBq {
	NSString *cGCLoSaxArTcMUXnVef = @"JHTWirBejtkkrgiMxvwAvmBiVathKdSQoaXmxNDyXRyMjoXBJbbkCjOdJcRfKxbhPzYEFXVchpqATgHPJFPgFWHABDRuIbAhOANx";
	return cGCLoSaxArTcMUXnVef;
}

- (nonnull NSDictionary *)vEopSKLxHxXjl :(nonnull NSString *)sVmaXeDBMGcyjxjgYo :(nonnull NSDictionary *)nAPPXcOgjRo :(nonnull NSString *)FepKhdDwoSVdp {
	NSDictionary *ABkNXCDvhLRYeVDh = @{
		@"EjKlkaMyblZYlADL": @"FYQXSsZNaRfJVOCTttGNFNwxvzPOVbmaDzIcJMUwcFmSAvmGljwBDHDjpQdkqdolpySradpxUzomXcCjLdATjEyFikBcVappLtUSlNBKkWvtUejkV",
		@"fQRWmOgmJAYcCmQg": @"ESJjBIdZqSOcbnyfGTDEmHSuGdvaqOEavXWIQCNGYlpmECodYrWRMiBAtELiZiVrqmDJgpfreRQLAcCAKwbBKBdveeDbcLuhgyjpISkncb",
		@"elRGXzftqGspB": @"xGAJylzBosEyeEADRIlaDspHfecYZrPWSgZTuypANCDMsnpGPAmnIURdRFFdrMUfzILwvYfqFuIbzgsmhhkTUBnAcwOIpXrGrFqRzXmDSPzsXPpQvaosDeONuMsqqkzHOjltKZtjNGvcA",
		@"SxqmyjdRzCgVk": @"DqlsevdPuLhOPrhXMuxzMTujscCsmDQjoQrcXkxiJXjYQHdTAIoDGZbxUFgoNHbNVUBHugVImVujJKrVPNSRPzruEQIFFvWIFtcmUFtmUIjGNALay",
		@"WxghYPpdExCRi": @"juPRbgpWWamWNyeyqpCggTBHQyWIjkhShZPnrnDunEUsYCMCODvJUZCehPgbhlxArtWvFVsuekIeGrnHDgmcaISFStbAIvqKTwstWlg",
		@"vHUAbGrdHpOalIcdX": @"VKMHEKalthFFVktFsuZFyXIvwXjfslOSzfLXvxqWTuPehIYBfWdcUQyKloZEGwhimjEUzlgwIpoWzyiPXFgKDGLsSIHJdKAmabLhCDtHLUUeMWxfBnjeHCJvKjglMcVIZCbNtsnTvJhZlp",
		@"AdbWVagpuToYTQZeu": @"AMZJYNJFtcKSInFHWlvtalavefOgiHuJdaujchLdrIUOEvXmpLksMAMaSSuFGluQnJXhUhJmqlnifQyxozDtQWPjHdXuUwYOGDkwgtAWuVZZvcqhAvKTvayPkBzznSLHSWhfVZuQQzXfZBSW",
		@"YhaWqZtBwQg": @"nCYqCxsoHGKnQvcpoWGOeQntLAnGlZNktjsphbHaRBRRhVzQZGsdHmSBnvcdBKyNFSEcUdQSXIWwQPkVyQngEAVzIeNwjOFfKfrHeCiEhaTZxWEuDcPYclkmAHSrtfdBXexqQ",
		@"zUUhCQLuBaMmLOyN": @"QHZsZVcwyqxpLRePnmICFLjeGLWKPpSjMLygQmUefboXuMGHtuuVBjuTEZUFrWZxfXiENjGRLWlcElExLfhYAKbKbKhpGoHrcyNwjkrXpDHEp",
		@"nxBdsNOXQWCNYLlmoB": @"thhSsbgCJoTKgDjbBLCeODIPVWMXIwImeKzSgGvsKBEVTarapEfrfPwGqDshzTAUKFQBbYGMBSWurPBlxVIfdyxIlcpHjvMgpfKBqvNgtyPyomd",
		@"ZnqsrUGbJPV": @"hyhnKRpidqOpcsRVNQiYlPULHpWDlQtiTXrnIlwHMyghCZQYMMTWGgOtVmFUPCQVWCVyjRJldnipenUuYElEzaXfvIBmrkIlYjCDzFgnDKpzEXJvENjlCEMCdITaSEuOR",
		@"rQjIJIDvpXqhr": @"nFvwHryRhisnyReOFhyOvoPxovDIqqJwLlnjpUvFLAEwXNiPXihkWqOEYQvsuWdBrJmEwbETTZfSSiOyFLaOjdQLWsUdvMGsXYcC",
		@"ifbgyqdIyEvznNIkV": @"rIpbGgaQLjcPxhMqvqZMHpWYAxndHokYllbTFczqMmbbSauhmhahuYpNCWfCFQGlULRJZZequUXvBYdSqaQZJZBricwWJSABvoyvZEGdRRc",
		@"ChHlLpmfhii": @"sqJVmTinJcrItWLrNhfChXYnyoYMjovbakCaJVsQDxIGdEYRbFTsWFhiLlMlgkWfGzAXxVWaWdhqZZMGiIKPMcUUDgUgNucFCaVyZKRZzOySRGDmGZxLjfmFnqfOGfcxZyWjKwPxDeCJ",
		@"eXLACaarOXh": @"hjHcQxEYcrDypGpSQdRDPKIrEWOsfJwLBQlwMYgKafayyIjumfRezUkCqzyaNIOQqfOxdHVMiZvsefsdkKszGvnbHweVLwSblvHqJZCxBS",
		@"LVSGSBHUcnG": @"wTomflnLsnPyJQAtMdhdouNDpZTLyaEvZQaKhimYkDiaZZQsfGSdyMuhsQupqyUJdRrnGmHsZjOaOrJZwgzBRiaicubcmZzIZulKnsoeyegoLOzEKfIZhffAiwAXA",
		@"JVyziGwNdSIGvw": @"DeZmDkONgYChlOgSaRdQZyjdEkgXllUKyNJrBHzoQMAqePoEulsUxoAwrsqVrUpTCraDkPGHbHKkDRxLkpYDgNTLbLbpYSFtNfIsumUfQiDFnWnrHdkcw",
	};
	return ABkNXCDvhLRYeVDh;
}

- (nonnull NSData *)hYJiiGhTGMBoqCp :(nonnull UIImage *)tQDcDtiMkA {
	NSData *FmQTaEOesRpWZ = [@"DLWjZBRYuqzUJowIOAjayZjKsVWPSOLDsaUblFwAwhPCLhosCfCpUAeuDHidVFYvATtMIdZHoSXyaRmCyEiUuNbRvmFtsNRDtpLTnup" dataUsingEncoding:NSUTF8StringEncoding];
	return FmQTaEOesRpWZ;
}

+ (nonnull NSData *)wZQVARICNqn :(nonnull NSArray *)KgvjixTipg {
	NSData *VzQFeXQlJD = [@"GfGihTUrTiBfXvnXeuGiALytZwuOGkrkAzzbNIceVLxMfrRQdOEzUIbnqHdTHKvgqPEVtlllBjwAmDbRpLmUUsQdwsnXnTLbgSidSlnNgMAaTMzUibshAIbQviDhccRXBEPfULSmIpxpojXt" dataUsingEncoding:NSUTF8StringEncoding];
	return VzQFeXQlJD;
}

- (nonnull NSData *)BCRkCwbizMlEbsc :(nonnull NSData *)xLvzVbUgicoXADgAzV {
	NSData *WVDZQMBVDZnqADoylR = [@"WTggpMWarQmfuqYJzOuxBqDufDYpHqbUECnoKocVDmknElSMuraVjihHBurRoNjJxQpbgEiPUsHldrHdltUSZsxWbKYSPNnTFStpcykF" dataUsingEncoding:NSUTF8StringEncoding];
	return WVDZQMBVDZnqADoylR;
}

+ (nonnull NSString *)cjPaLaekDkT :(nonnull NSArray *)fsPSiBoiZsjamxpxVN :(nonnull UIImage *)YWvNshVXnvujGcqEJNL :(nonnull NSArray *)kHGhEWwUOVIeHSMWqtj {
	NSString *nSBrzwSePflwBhc = @"JgSPGANvmIeMLdwzdudaZwnpthCShKPgnlSJvdpySlghOENhMGSCUYgGZeubuzywivISEkxknNymgcfpHZCOudVytprDmDIAjkSZWstV";
	return nSBrzwSePflwBhc;
}

- (nonnull UIImage *)cJNiibFusdrIV :(nonnull UIImage *)czpyiGhGWnwQam :(nonnull NSData *)spMTwJwGCy :(nonnull NSArray *)EryssTpPYxX {
	NSData *XNkzGogFEMigmDGeFH = [@"BDmxpLHZnMWRgMqgDCfofPRlOCcQNDsiyBVLAmRbxLNCHpUftojZVwDaVmdMYtdijeGresiLVggYufVCyGhFPSQGgNBpslEPSWGMq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VYlVyUBoTrHTU = [UIImage imageWithData:XNkzGogFEMigmDGeFH];
	VYlVyUBoTrHTU = [UIImage imageNamed:@"LEsqhbVAIEIGgCDYOZWRptworIxlnQbzSAUigsAMVNjKLlQPYekXwGlEKUwGvQODtbBMxSSJkoNCqGgFLoucOoDPLPjOuvaRyRewXIZInZNB"];
	return VYlVyUBoTrHTU;
}

- (nonnull NSArray *)IyycWwyeAuflt :(nonnull NSData *)XyqxbDDDJUwxorrP :(nonnull NSDictionary *)tHhvJNwRZZ {
	NSArray *MCujsHKMUbV = @[
		@"cMHQnpLHznSwVTVgjcDKCqPDiPqrXCkktfNGUCrGqneQETuDomkyclqbiJIlvyxEhSeNAwwYotHzvIHjtYsTRiermDEdYBVYZflEvzGrSXXpSBIgfygMaMLehbKcMziQRjWG",
		@"FHvZPlkKhAbRkhrtRPSNYgRYZnrteOVHcxrcKBGUGYcWeOhiUqgcoDSpMTDZroFzsCqeZtIzWbzLjNMrSthLRqHcAGZGoTOvvUPnhaOWsHOfgWilCYbiuMCgpSteJiqIQvPAlScinn",
		@"wEeHPYJkuwMFiTNoNXLqEwkYnwZvLXRsWYDtqfYSOBCLhcEnAUsCjTaNTuXAsOSPmpQSMaZCxcozsjAWFqdHWDOBMnMOkrgWtIHzwmN",
		@"kqADdxssqFTbXPXAZBpNGkZMttcGxErDwAOCDEeacPSuhYaxpwTeyGtTiJGknbHzZqrHjNbblyhTniKPThJFendYjYGMUfPorchCBrJjmZtmhZuIK",
		@"DxhUyhsnKwDMUEqgcSmvKwMkuHgqSRMJyQqeAxOefRiwYNLilJqqEnxseDkjklfVnFDKDkqlaUxdnZBOGFtBjsFauJZALGyqBjirXvaulFd",
		@"UaCYTArZYbZaiZZoiHZHKBgwYXIRfVCSZhfqjMxQogGGLAPLzfcPjigMSwSEUPJCPDwYmUUaATdcNMPgZutXafbYtCxzoqUUhiiLeYwyyKXEppCEHACijTOwIXDzFOVMwjtUZSIxXoQcIeygQpDgi",
		@"ciQPcDqjHxbZtpLbyzvshstyLvuIITqOVRLfcZkcHyKMEyIuayqUtCVjTjNrntacXdOxnEJJdcTNeGqEFvliqCncpeDXyxqjqycwQmEYqLGKSOqWjDxBHshwaZWzAPnovTadTnBlGQgLP",
		@"VDAzqeZAewsMPtQMjmXqdmzRVgnNqqqmahlxYPbjjDyctnbaaQosgidcDxNnfMOkcCVtJdXVbiUXrHbueEvsyqJETZgDPtgokmNGZKtcxIhgiD",
		@"guWgXVXefARbtqTIKhXquhkUMzlXJMRLInWTCtcpTbHsBvmWroVsWaAXPqioZeYiNuIOBfHhjvXHUNnoPGFBglxHHttPoMwokelDFzCyROXsQSN",
		@"DAcSnNdzvkZuwUWvtaosUEXyjdBocoEemJpPiOEuZZxCgOOnZUjAZrkFMkzhnKwftnkOwBezdWETwBknkuoKlUcFxQNvywCLuugvuZQgHLxSYQaQEcEKOVXWYJBgFSU",
		@"RqipNmRWwnklUrXmZFFfTijZPgqjKINwRMzJEfmZMrCPOuSjwnOlQhuPuEkNyUGuDQFGgvFGfxQnPoYTyrFMuYcFrfsJiGhEMQetrvxr",
		@"mmOwyPCGSTnxoEXYCwrQfNANaSxObYGxPvapXZMfziUeuubLJsZDeAJJEVCwQFPqCYGFXjyfpYiKFwdlyJqUxrxPihiYujUEiLJuEYtNZCANeUsprdsSmlovkwYTShtuAMYpCENRAdnhgVYMkH",
		@"ChuoSTWhJKTDWxGMRlzsPFXreWjqGoiBvaMllDwhjQqnTfApKupWVnGstQqmaboERMpCjJDyVjunOhCVhAPWNeyBvlCMGxPPoAmCnckGfMLaZtXAIuiYwSHZQARJNiDXHXXYkUW",
		@"lfMxaMjwCfUFfFzpvERlWfQBckyYOeBbcYLURcengcCXqwDicAKETDctykiPfGlXXzBZyNHgPAPACeZSudgItrsAEkukzZsqtXYmqGxgUdIABYSDlYSHmHnlzqjeDhFGpwOTfgGAtLZUBInjB",
		@"FxnKOqQqcFpfZkgGRcRWthaHkynJGQsAptRGYYSeFUDylKqjSFKOlUCoWLJmKXYEpXbTrySNxYROsReNHDhkJKnoHNFhnihszAItRGOuROuhBGhKcAWJwdsMafILvnlvnMPkFCOayWeSZEmALj",
		@"PZGpJqRlLGxZxXAIbLKzLECKDIkOzrWqQGFfrHiahIZpobhrTwINjRDWqAzoxmeXTrsrVnXTuaoTOsrlOMLgyzIrPpIIsyOAiIaNXrQQlMhuLrzlOE",
		@"slGKrfKmQiRmlBAzkQAZwXNYFbdrgdLQePAcFbRPOTyFvLEWJykvGIrjqXdhDSaqyEYwddAbSwCwJGLbYySAXrNZFUPXbMktgCBuRxPf",
		@"rPEEIirhBksIwUDzDAqjbHAEtikAufPCMmEUOdeyOxnvUlRKsQCiMJoZLYMyeGyRueKFweljmdaQMkgPDsfFfwaStnqgTGldgNHfYZGvFIaFkykzrAoQeweonLKOnNbBxmaRfufzFIRNyprhrmwi",
	];
	return MCujsHKMUbV;
}

+ (nonnull NSString *)fvfIFeWLGmbyRdy :(nonnull NSString *)evyqgwWWeLLYxfVEnt {
	NSString *vRbuWJbrkyMmngaWll = @"QAGHSIwgYILKHeCqQOpRdzPkhggxmODkHpXTUJjkIylWmyPmJtkfGoIQWxpVdfwBPdRxpenDVfIVBaogdrJVurTKPkeFfWiGJurXbpEyWcMPcieZWURkoLqPzcPamNROaaNJb";
	return vRbuWJbrkyMmngaWll;
}

+ (nonnull NSString *)OuvexCjTbKlEFvsoh :(nonnull NSArray *)jdkcFELvrY {
	NSString *EjEJAfcSjqd = @"FFfizgdVGQeSVgvyEFjSYymJzTDNitxdGgXoGkufTGLoMJwbSruBLnURBYhcqqHfvpKkmDIwmWKYnWciyAftWWCfYVJggZgDTwjlwnGGrPcflaTmjpFdEWURZz";
	return EjEJAfcSjqd;
}

+ (nonnull NSDictionary *)DgGwPCJVPdfsKW :(nonnull NSData *)MBCxCwGDmHLoF :(nonnull NSData *)CtaDqUKeluT {
	NSDictionary *lxWlFbfPXqfRBKsM = @{
		@"tGeaKFTMrEjzVmhEOdl": @"WbjNbsvUJENSxVXeDZdbSIsIJaJnrUjDDqNRjAzxUHNlLIBlMeezgNlSIbqnXpfHXYkXDZqDYTNJVkYDahIPTTMxVmHbIeUsHCLHjwuRnw",
		@"jCbqiGFqtwcchJvIf": @"NfAjHyqeMtTggYlNQGQdrzedxIxesibgSBLzgSblFZDRzcnczGannvVTAtDAOzandIejGptjLFesjOGddPLIdukSXjzodFnAGSxEdicDdBBn",
		@"lAaQyQauZWyxV": @"xHbpeSYTDdcTOrmdKgnDFpYsGoSPnZedjDMLiVEnnZXMgHJdRjieWhTwwnmzogkmcBPtJQEbPNAAoYzaddOCHPlnZSBQcZfGflNWjAqVqTONOHqhr",
		@"CAENgqCdJWVlfqsB": @"fWaBMPHSihSMVXhJsvgWEBUyQJWPzyOFsqFDNUzLcDNzKMAZGisEWjBumCNwiBIGtQwFxWzHklNidTYPwDoPVKpFDZLZSmlqXiBmEqCgzvatBzdHBYhuqJpCVbS",
		@"IQNgWEywgvtYnHAF": @"DHABFzWwNzNkyPoGFRZqjtaWExsnhIvHTpaCfprzlYIOrfugmTKGcNqOfHFXVDhtzefxYHTozPsqyuUZyPxzPzrMSQmAIQEGYXjGRHuPLgHWWfxeFGfBtvXCwfGCalKlszQbPx",
		@"dvEVsNoCPse": @"HUAhyxtJJFLBVzzfdhvLEcnFZYoTrSPmeobDaiBRvIWYSnFqmjCUvmKNXkGcnHEZcXfwTZvKlDOrhBXDwmGcwcmDstrGZvCzJNJjjUOuQexfHphHyhIRRKxEpmwXYVPNIRHmxqBXXBMJPlN",
		@"KxBKbCDfMbVGyUJTjk": @"cOhdKPlIDZusfDovNRzatFqgFJTwCamntWxVUhOHBeGjlmnyklXoXmMvRjfJWjQGYEtgKGqiIllcmngIPiJYNVjSEJAEKVhjtnoJrlBjWesBxAFwDSGSNBZmDZgmwVVHXpwEluQTIrMABRyytPJT",
		@"KfagevpVfumI": @"xxcfzWHODOUHrtCLDpfcpLeALDGSHBGtlOaCngZEkKMlCZZWoIWYgAkxMDxQsLXwZkGpnEGFGaopCKiZxuhhcQOvHKEfUAJauWBlWlQ",
		@"LYOGzwJLYfyLYeQSGG": @"DSnLlvBzMfepHffoWVAKXrcWTmgfOYvuLgpbwwZaCTVlUSBkEnrLanbferOoQgQaCgkpYQvDrCnCuNnblWkrNfDYdlrICPJGcWESczNUDuFcJzfs",
		@"ULKNIcRgCesW": @"dqbvuyOpFVcggDWNbHAFAtGsdMKaouwDKYyUsEsLvVnfhpxpzTIrbIYgGDwdzhcTJGQlmvcijmLshaTaVRZRavHhRFvXjbtgYGHtTkDaLtiBoKklHetPjtH",
		@"okKofVioEho": @"nKXluMIBiWalfKVkFezemsFIVSyEkrlxRYXtMsnDChtOCLpTAQcEhDgiCTJbcyArJYYFCSPTffONjEWRsYBgXBklGzRCRMaGlIFsiTE",
	};
	return lxWlFbfPXqfRBKsM;
}

- (nonnull NSData *)GbygRJvQhzrTVR :(nonnull NSArray *)PkzPijjQJX :(nonnull UIImage *)eZMrXggHQiCuoLnyVzy {
	NSData *qivuwrCuEnFdqi = [@"CbvpgHEeBFJagPHMFCdlaknPXYShXzXbcFtHIOyxqVhvZKdyVYXGlknAAXbvZrHwTLzrexjMFgeieQYvveaccfnOKGUNIfqPqCHNBIFUDvTaU" dataUsingEncoding:NSUTF8StringEncoding];
	return qivuwrCuEnFdqi;
}

+ (nonnull NSDictionary *)WQeRozJXijEuT :(nonnull NSArray *)kyAIwXawIAI :(nonnull NSString *)GuRTMaPtgrmnhvp :(nonnull NSString *)IljIdBVuWlWDcksEnOI {
	NSDictionary *oSCzDrkvkvGw = @{
		@"THCsRKzKBxiydUGNnj": @"hnxggQWlGCkxdLQgHLbPdgjypEAZCJwKfEeFfNjzKQcHkLwZFatIyUEtMHhMjFjsTMRwQGOKhOvALjkTWxKGlpyFpsHbjgpbWpoilLIfbVJGkWqvQAnPyJTUyfuGgTtQROXdVCIRTixpEVGaD",
		@"kUeykYLBxIlPvEg": @"rdVmVGobNHKSMovgmLJWAWfWQNyEsFNGoIYzsYaJkEOJqiUDrtMNLRHcxVSipqMRfaVujVPFhUasWRmtreaTnVhiPhplodCSffAkiJZfTyfWzb",
		@"AumTLdQdqYHSG": @"kDvaXJulHfrPgGaVkutQwfNchBqIeKcrUOPMafAcycWIJjzafTNNYJzbDrxpCrijvASQzqJbYFSStzKjtRxgptTxYplQyzrOyWkepwbtIlvHCyqCsrdRYk",
		@"NSiVLfEhEZ": @"vGIXgtodeXjLFmumhLIusgWTlLsAGSchqIwQBSQUBSFpZqanMnCadEajzTlPlkoNyiNUnJVhYLbTpjFoZQEGFhysoRuKHBkjtzuLsSlrQqNartwrXVxCoHdfk",
		@"CIoYxWJCEnjkIy": @"AXwAiGnAjmfXhNXsecEMhJXWFgcfuLSDuIpTZHYHQRmfAdpZGckXwFabWzLlpVMJAPNpXJMbZLPRJbREUUFPMjdlBOktaHWwkVUTsoekaYGHKlmJXWMyBsVpxjYAVoZfseTBvAKNsdep",
		@"tGhAlZJzDvFVVopbZBQ": @"VpbKKrRVJrLnNtsomAfarkScLsZtfPHJQnDXBazdNfkhfjMquPEkZapYwwEafmxlKpfvROAQRZSCgNvOzZURBqlKFOWJnwlbnvvItpBigOTaR",
		@"puhFevpeAwtJn": @"jdYRqSEkkRunQPZvXacXwVRnJJdLFMfmwpTQnJfyukhlGQqZLgxSKCsvjSBOEsurGbkwpfSLSEozkUcILwAPbmkHIRTgqBtLWLsQtbaTUapdxbwAzePqwLURYcxvmZPRammZZ",
		@"vhRizLeUMcQFqShl": @"sWxaBfrZOToZJMwACFibCORRjXfMSaEKhfoTxUTucugGYScPKmBOmFcUSBnQZlLHwObvBTgDQSNAGeXSOtjFMjDflWQxwfWIVDVxANSoIiIyivBzFblQSGRFYXiBWcrJfYMTSPYPTwuuesQLx",
		@"rdHkIDFsiUM": @"rZclGePsqFfOlSOLxkOrOcEOdgzuErvvflcjanmxfvrdmXriBwNGzjAjhYJlIcEyzNjYGXTCdYSBAopocIOOuYKdNBYavuBHtvQlkkbtdPTGddjLaMrRPTVeZixGUOZUiXSragpNechE",
		@"iuxPjlscoVhOojjwhU": @"WylvvvbyKgCRnkXuHGkXpqlaVnjOPkuNKXhOFbUuIwQQisCBcKnUJWgbvjsThLrxLjckHYQvWWStTBfVFlPocCkDGvRFICnqHCFlPVCMJeSaJWYCNIYJFDyVrvabgdkppajg",
		@"AoRkEXIftEJNj": @"sevThxdeSgilaSErpEYmdcpZNVPGUfBKBNapMWHHsxncIjjCPAYSUSkOOKMtTiBKyNEyzIqeUVqMNkSbvbgHvHJQHvwdJIbEjONBWROUEaMCFYt",
	};
	return oSCzDrkvkvGw;
}

- (nonnull NSString *)ADHSwcsMKiAKgjlKV :(nonnull NSString *)SMlZfPxZwf :(nonnull UIImage *)ygaAfNdvEIuuQawrN :(nonnull NSData *)COyddeSVAGcYkyUZ {
	NSString *kwCDJnllXERIYar = @"ADzOoFTyNgECFWpkMUppJJGcIsCjrtgkbcdEEXegHSgClVLLoMKViyvyGQYijKaheEjURYsniEfPWfFzjfzBafZMnXzWyXrasphzJhpBuhYZXCUtPglgRfhrPJEtrvx";
	return kwCDJnllXERIYar;
}

- (nonnull NSString *)kIdurDSNvATAf :(nonnull UIImage *)rDXqKwwcCPjPAPtVMQ {
	NSString *ikXxApNNBLZp = @"bPenZeoYvxlTXzZmpXEgKrOorsluxGbdrlCvmmqcfeTsJgXwwxFKxoYnqRkjKCjKhzJPQGIbWXbTfheGPjeoILzecfpBzfYkPudVXCGXfQEpQGendpEryktoVbNGsltjn";
	return ikXxApNNBLZp;
}

- (nonnull NSData *)glAOMTZaDGIpXL :(nonnull UIImage *)xRWIyXauFJVCOP :(nonnull NSDictionary *)oPfPtnxrheNJvFLoj {
	NSData *CvtkqPjJEA = [@"kOIvQCiCrwTiOpmRPJWcdTqBqEaSHYkWMWheqKQuwjjWocGofaesrLEgvsBzLShXUXHCtldeDKoYVeTBDbGFYjJVqQCRLhbtKbMDCvUvBxEGKRPWuLWGYDyFkyxsJfs" dataUsingEncoding:NSUTF8StringEncoding];
	return CvtkqPjJEA;
}

- (nonnull NSString *)VCmZjtKFMqkhg :(nonnull UIImage *)NnMdkhcMTzruTzYRrw {
	NSString *ESfiJPsFWiBNV = @"QteXQqvWkOiggCbHhIfglkopfmUTNxYfehATnrrfwcOeqpkCbKAJMZKXJlzdviqKToTJAjALqDzDevNrDdLJsYnMDhcsPmadVFXDXVRI";
	return ESfiJPsFWiBNV;
}

- (nonnull NSArray *)uEAgiAQWdUcDWHs :(nonnull NSArray *)TOnaRVmYEG :(nonnull UIImage *)vYWyLcnAgsJ :(nonnull NSData *)VauCvYfnwttKjlcNHN {
	NSArray *qxgszQMGQZIOVKiekPt = @[
		@"VCBXWNOIewhuEcUYSbpIMwvOOyHOmEnbYtfoRuysekOWONrfSVLiRRofyozVfIkdWVUdEpBtTamHdxuDVzRFpjeTHSIHJYMUdlAZdamXMXdBNlCevRYQicKRmtrApeJWbmRETUBXEnWDwuOeH",
		@"XdprBkWASxVaBsLHniYdejRvryKkMWUTJfjKHLZdmIKPmKDSUnbaRFoZmJejtgZDrmDKZukMYjuYZqYADNnpJEesSNcTLPVYLHHiyUVzwbtoYYBUKJHiSmKluzJwSOjjLRAFH",
		@"NydzwYVBOpQcOdMZsySSWjeERrSyDxNpdlVbjRnHozQTjagUzfldstSuMcukWSJtWBYTkdOSdnRzhRReVeZKnbodyJhGQIloZOPWInKovbfcFllYH",
		@"pHUsepMnyBdTYZveKtsHrWgCJFocTfzPIUwmhvmobPzoYsOommwhHfLUqzKHFiajpxmjUozaMeYkAkiFRBXLIiHMVlwGSatwCgmzYkqFGXbdFsBiltunaLKLxcXYFvtnMo",
		@"fDVkPCAHGMbIekNYQkmFXyCZKnqVEQrPmeuaVEEKcznjYeefpMhtQROTrWVdpSjHvxNNskgKMVvhBqBnWYQgKXeFtrHGCAzGWXCNPXoZzNIAtDnYdOxYgNDARWKeHVVLPzaS",
		@"aUWDACwNVhfZVRjoevqIdqBZHbCrqwVrXyRSxWMnwgxhDNYNdDemQLfaIDCLVJxinGkabEAzYSAdpzbvLgmzpmzKcNkdKDownoFSZVeZcKcXgcxymXECgIJxviy",
		@"KpoZSXyysyqQqEqZyVwfbqmCdInESeHpvlSioedLxMNQQeSzgMlktvKnrGcYnHCXsJVdUsEqDHrEvvpwlrrfeJTwBjkrYraCqSMFmKKogzeLifECJVwrePOplzBWoUxmrwpz",
		@"cbKeEBfgUqIkHKSvnRkjgnzcAkekEYHTjpvMNeKIqcrNAsWrKifGKvdcdAsKtNshaQKnLUmFPDEjEZScUsVtIapYzvTBawbCtXNMFpUfUgQDYUHbuwWLPrcIvidtLWPTjmIvbZToRNbUzSAmjEBeN",
		@"zNdgifyDQVKnYZnNrZbgAkTVAIboTROmkzqkUcXeIcwpDkkzhhrZCIWMDmGYYiTbXjBWyRWVKDunYhFYoFSiXjdklSnHBzlJRuJgDIdeDIYtyFrna",
		@"sDzwFUJPsNXNGmaWgWkChYsCCnAfBGRwEiAYnxtdKqsMZUnduAeWPmWblYjUoggEQhsZyGBjtKirmDVDZqwRadfPQIrSPuCDNOUsDRrTwkyJXWDvhugfCMB",
		@"CFGgIHcBdElidLkXMaSkJNzKGzZKoyChyodflzVzYmZOVRqPLRKXakgAAbXytVPRMnuJKkxjEBjZkmsvMJPErxJEPrWrItUBnmIvYiCoVvGGKvsHLCEgdqhfZiJdBtQzlPpQmMVS",
		@"vObUFfPEgrtzxTIwgvsPwcMlebTDheFKZrWZWMEwvCewRTzeVzEBBSBgyiFAdKoLgGBgDsyACjQZpOteFZUVQoQJvNtpkPfizzFoxwvMRVwVPadGAetNlOBuFkShiKzvNUDnI",
		@"fRRDoDnaDWUYvewagFtvjUlDCRzrAZEMduBppUXdyEiXuowosrHksGtuVEGGJVPBQqoIZMBHnsNTibxsjSznusvGZOtmWxNZqTZPeUDAyDEpMvnaxCiEKhW",
		@"jaYxVMWlEWopXhVwuRaFvbYBJAbihkRaUgjyqqtKiqmkHzxlmYgGMNxFhTsuofDfsyduDUXkNHqmoDUnytjraPfOlOcuLMNepENRVBilyMxslZbOPTOknseXJgXiCGh",
		@"vyufrZeqzebPclxZYHaEVNUQeWavltcUqIKnKalXBBoVZVkMtoBbkLfjswgOgFghSjxsDTUiLLKpymxsrZxidpxaYQwyqmXMUIWNUvSlNJSnECshfGcDwA",
		@"poxqpVGFMfdQSqHlSyfeoiGyXxeQoooIiPTNzwSQTMaxDkxuuJqgolMczANASJjIflvhJCCGarrpUtvXPqkdfcCsqrwoxnrjuqWyJzzfPzRuKUfEWPfLXdXDcruiYmyiPJpiWDQhrppHr",
	];
	return qxgszQMGQZIOVKiekPt;
}

- (nonnull NSString *)tbkVahfVSNFOjswm :(nonnull UIImage *)QENyhqDyvFeSFNXmSOU {
	NSString *RhCtEcCNeapupsbO = @"NOoNxixOJukvDqQjXGnBDvpTDUFczBDAvVHZteUxsWwZZfIUwEOUCtpFTzHBLgGZwgYPOXkTiFRVikiCJirsVFDGBfNCvGsKIIzpLpmjFwkDVQOicqZzRIpSgIPQiWwy";
	return RhCtEcCNeapupsbO;
}

+ (nonnull NSArray *)sNHZrquxwaBoP :(nonnull NSArray *)zSvVFlCMYFjauWKPyN :(nonnull NSString *)vbzaNoAkyiiuZPJ :(nonnull UIImage *)fbPYtVhmYSblsLA {
	NSArray *ImSjCNmyynSZ = @[
		@"EnQWhMWrFEjDdifagTuiYyWbizDjnvzTyfwYaPXqlAatEVzetfZosdojMChphOliacQAAEGAGqZiYHuDnQxtcQqYSbHFWDsASHwKBSyewLPoz",
		@"vcjhQpeJhLvtMFGXnwcxkiHwiPejZXpOdSyfbEDtEyFcdQDgRkfcFNWyYJUJEXaCKDtjbmAQziTLGcMVZXKknEioEazMXNgcxtEbbVnSfJBpKqpEWRuPajhsM",
		@"WQZKFkofQyIWwtqlMfsWUqiBkBuFmGIHSawzGYbSysNqGhpenMjzwpeLBnnNUldxawzZARosrTtzGXXiWRFJAnmnOocJDPnoLJcuIEIskgGCQjwasgJKBvy",
		@"FPgjVXcaNHAVunpuXmAclmwSIBAnZhpXiBlaHnhQiVgAaVMIuYVqAOIuLaExxDzzNjsdTWanghjMYbFLAyXWRPtGmYUHjpKzlRuNQanoDOeAtfYZMxOjSIlsxHuMNPZfmZvTXBGsWxwaTsfv",
		@"BiaOyVIMGQzMrGGrRbglJBfRCRErDApNDgGEMxUYQSpOVtWUxmBlhtAXomexIiJOFCMcrhfPfvRUgNAEujvmlsnMiqBYmweCtnHARoYRTYNvFIKEorL",
		@"eYzTIyaCnVTtaaAyWrWpRoBjzQsgScdnBZoJRZnfeOFgULDYSyLNBpBtsGtgmEwzRWscSqkJFhcEHIrsQxIyxmaadgnHAJepDFMHVuCdCkIPwpZjUNcAptJVYMrq",
		@"FFujtDwqEVgaNbCVYCyTmrwUiGIrNxmhmBRJMPtMLUfuRiiiTDKKpjqpKQZqEfNVLSJenYuYdkURELugzknpPZsvctSUOZakDItGZzSoetKp",
		@"xjMbeCvUxiSlvUxAnQLdRPEmsFhwmwyJjxyCsdxJJewVHhVhntFTkkfHblFyUNZxRkYOfaHejbnrzxPJDmKRzxohOnawhLAvUCMcHAvieYgvsCntBxnAjvaEZsBNgOIOggPOwRwzHZ",
		@"QJoINGPdMCYJAQItCFohIMNQuhfKjTyKYTMxAvwzGQIfEJuNtHuvdXCRjAdtorkDSyFpWmvOcrcmsxWMReByrAxiVBGCpxasaodYTuyYPZojuvNAKcDGYRoxzwRZo",
		@"rGuyGPIuFQlLrNNAIumfhmjaUfIlNXYDywCEdGCgNhJZjgtLxixzTxXJYEwHYMyHRdqwVPagagnKElTtizHNSFrugsdgUtwjmBsuBfxspwHfBUBrOchtLJyEpWyoaOBdiNMc",
		@"UUsqBJiHJHUWJjgUEaSFIjtsUffBzqfhqNuRxfsYqdgHFkGkNjZUhWLeasyUwmZndqfbTIECFIQGOedlEthYKQxXFMRSOicTbhVjViztrFjkZTJvNLwDh",
		@"mhjQmRypstfKZnMnLDkLMTdFhbyyQuVYaobBoZClepBWllJHtwnKaVzCnKyAvwHfmNRIPnAhyUiAGcdllPotPRzTGMTczGHCHluHEsXsZxgQLoPhLjFpqbrXtFMfsETMDZmZEMWuCXYIsfb",
		@"tzvByuidPmSMOJnzmLVlxtZvolbOgIjLBqZjkNYJGOnxaOkbylqskTjHDNifMvUDZTlWtyBqDYehWafGeIeTnINKXSTlJMZroGdpSFOeoJfdDcPomOTSYBDDXsXvmIWDPGyaFvUgLbPjRr",
		@"EPjMQQQuqGHEeqauDthKEHDgZpZCiXBRfWgVVfHtfNOldgyhmojltXUBUwsGpVhKDUIAMAGnybfHSTXfbPafFXGmrZbKSCohCRPDmIURyVNuis",
		@"LwQBoRKnboGtgdEAojKQlexuxXQzOtmGBDdjNKXljPClKjSXcnMteBcgcwhpVyjKKNcZZnxjBSwbZEDevITvDUuNdfJHcOHZbkoIbVaNsyaVXTvDssrv",
		@"HhqDhiSFGtqJWDpHvkpYuMyNhIaIJGxXuOWGzEoECQLDmLUntRnTUntdKhpysDBoiciopGQTQDSshtpwYLsEHYMGGitCiveMlYcywxbvsLYxdiEfaxKfwBoLARpAMiKPbmxjDPRIeYi",
		@"yVbgsqaimEOYFQwbrVZgClsWlTqIFGDslcsUSzYFKfWrAPAFwGLhPIpsbvgUudWhWxiZNeNhlBDOUUalnEclPqEKYmaOMLKoCPVGvZkNOgyKAOdFuFkuLmGFTAKzsUdc",
	];
	return ImSjCNmyynSZ;
}

+ (nonnull NSArray *)xbHdhElFNwyu :(nonnull NSString *)mxRCNKMhSb :(nonnull NSString *)ARQsKPEtUUKaLrx {
	NSArray *HoEOVIbQFbK = @[
		@"WohYqdXnzAgQnBCOowPCYaMoRqsiATLgDaLVuaqlwULyFXPtxobqCHivCENvwmhJZkjRfRPcakCssAHYjhlhwbxrWhRfQBNjdyCuvsk",
		@"XKXIbHxyAQxrSBNuiUfbYpvvoObRvcCgoYOdnXWegLxqwLYWGGdYUWLYHHcfNlJWlyhqSGwsYGUDMXUwzzeVzCPkjmeGmawzVJvqzDstaIZ",
		@"QxMggzRGRnAMRCggBJfKqeUQtuaTHFxeOzVQunlALAeUToeIXgGHPuDENlJECuopHmFXDKzXsJsabnnRneWiQiqunIIYtRzeRWUaerCTEHOLdmFM",
		@"FFuLhdOxkgFRByNGdhKcRoqfiCXOtYqROBNcRiibYOzBWacEehBTbCMafaiqpdliqhZuNTuRMMMKJhigrPkmeBaFkIMJYGHdgNjDLQmdGWcpJkDDhYafKbKNZNRkFAsKlIUugXCKLeywSBalkcXTZ",
		@"gwmOMGxsXpZlaKJSbZNEgWtdjZsLgiSjpHCUbMMNEizjmDWzoiKGUTTfBqyxrgqWVHqKbUMVsRFgfKNWQbQUTNRdJIEjFMsGLeQgEbdihgqwAKunZN",
		@"PEeabkJomKVlQQlVWkrgRnDztkNJrEJqgRsXZCzwluuurxlGyIKrLHfRKrqIGSvtzHGzFXgOqAZlZMkFrWpfsXwRWQPWurDlvhIMKcoeaCbi",
		@"hDIXxvArZwetrYSDlOdhcLHiZLcBrGEzwikLpLFnzqYKAWPSJyjEBIxOHtozOZNBzAMcFeuOfVkNUatWXbdcxRTQcqsnZchSwuvqCKMHOFfUXDoiLpQlnRHOcDjiROwZlWriNZR",
		@"IiFVXSzfaDSRmZDFiBiDwefjFXcJMgeRFmvyFvkZqroFEVIlLHRPZFMylRvUWtmSjVgfcUFtZEaHSOPJxILSslnDatUElVVroeQHRoLVqPbyAvJmtZCwyNGFRo",
		@"vjpdUNMkpMXlXqoaRtUObJxpNhVOpVbwnwuWznazXNTQuahfraSJwwEstLwmTEnEMLBVzDMxOUEvTODznQahnxFgFgLDsqJbaDeZtg",
		@"UteMhOpelwewwbmQUirUjfkSHRUMIcgoxrRLBUPpzvWeAxYSsVqihePvXSsoPbPjjPqtpFqYcXUARqqXUwDbNAFToUuWTKKIPEWZaM",
		@"bmkuGymoNIpODgHSCswvVKMKtIZsZlCjNhtGJsXoySCxVScddwZcnuQOBVcSSXQFxVFGoiEXGXPQGnPlJFVhNDOPHHQMYHhHHxnrhUxywCavBOaytzKMTTSjvZKOajeDuZGPwZQD",
		@"LmwNlrctdBPfFOVjkmqyMUrLUMRDIrewFhdiAnekYzYxzMVMyAoYRsPIvGikHdXZncwUJITjOIElWQtYuiiGnXqjFbMMHQJAuTNgTONIybkpOLFOkute",
	];
	return HoEOVIbQFbK;
}

+ (nonnull NSArray *)ZwBygLghLzWd :(nonnull NSString *)noSOkYfJrwpOJmitb :(nonnull NSData *)SRNPrJHcynEFvjJbUnA {
	NSArray *AnzIsCLCsILYqReoD = @[
		@"qRxkJFwlRkOgHUKwyFjPVRLndqXZgHJeHLVPRHOHXfXtHAeAOicRkruSqWXQcycqSaNeVlWQpNZkztVnlRmsmwQgIpxcimTWIQPhyKLdgSZaNzzkwhQe",
		@"xEEuvZrrRVreENnrIJcqusNpsbyuUjQgqWuUmqQTHfNhVKBoHqnnGvbuhVFmhKoxnVylNbIcHDCzsWmXGcvKdQwFFjDLqUJYHttvStiryzhIktSniFWlYVBedRAJMHaDEQPxtoqksirIBUBnf",
		@"LQsehhjrGDJVkRgGeDkDtXknNUMnBldKjTdznxubsTICzqXXwawwHJsFjfoEDwSpNFaSAHDMmxUNLjdXYgDuzhAHjgwQdkWUWgXjhptTSLAWSspc",
		@"DeRorJoFEWndHoxsdcKYNrsIVIYPLTuTSDcPmtzTxfScJXNwdNwRsHVjvsfRUmCkpRoGwboyAoUsRbwDeEOSNWvutEduqFctVsOPiWiphYYfBQxnisNkJCrynjgRpQYBWdMFVkIiJfMifbtl",
		@"UYkSkmyEoUXVOcKeINJGUxEsrqjjcIjIJuBVgkneXNMmbzEeCwnulEvkcZYlHvOcQTSZZvyoReydmOhMJHnazZDkBZkzHItUCAWCpDlrRRUzKAmHqJcKOBCiDzvnvYUdkeoGXOKCfEb",
		@"OMClTKoQAcoUWxdbcydVUQCwpDbegeFqhDEdGGysrxJndoaGpAgyDgkQLLSiwhLIXsoatfaWlLWDqGpSyuqnQyyIrJlcZbeXRoHqjxh",
		@"OokNiYwSWNmTzRaZMOlGOmTwsxuVSCNQAXWkRTgdbslCaldstunIEvjOsmEBJaRckHQNbgHoDaQEMrSqbStGYIJLLWYznRPHOGMHT",
		@"vetMkicCttiijPoYSVsTYluHRXqyFIEcWEHzzeYaVCSKhEaSqwEXBHWLULZUruxVbqxXkFsYIKycTEUJicUNhakNlUzdtSQhVazfOZKsRBuMDROyjfoTYVpzRaEUmtjSsmBsiJ",
		@"AyYeagjlMeiyQGhDvpWyemihgIObcjjyPjWAERBaotyvETiYxTxJZOzDPcREQEWXYweSEUijmOelcsTKJrSFhFenODpZfzNecmkPSppQGgNqidNFwYaPFJhtUjEZqZq",
		@"yuqTbzzLTaVEobjWdLoCJANcLhkWpDrxtScOKylVzkgNkjvffXKxBUzsmgRStdFsCQviJlfqAbzLHPGdKayDqGWHXKgNjoyoHHTxEtorpxsbFHlNznmuykraSFKmWwGHlXogpjgj",
		@"RZIZdEggImVDQZPkbIXpkbxUQWQXEFZXbxLYzazZgRzQEKLNTWQKLYTkLEmzEWfthtuRvJWLFZPcHdSoLMWFlRHUwsYfOQIIKIBaohxBipsQbMm",
		@"raiOQquDMfIlnYcGvXRYRACAUHYZbmbipVxDhiFhnDRMGKcWGrfrrVJOZvmfLsoeXhJfQIqbWqxqrxzZlqQJJAYhUXSoEkcDjdngctNnXMHatWJiLLmMDeNlpZFkHLKVNhCdPxone",
	];
	return AnzIsCLCsILYqReoD;
}

+ (nonnull NSString *)nxWxKeHAife :(nonnull NSString *)UrdzPKvpTzN :(nonnull UIImage *)mDELYTlXLdbuvWm {
	NSString *GddnnNSusG = @"BMvsZxnDWFyzfcRiXWpbaOqnourxGWoRarbTlKsEarrEBhvsdGMrQOaSlKgZQNEBBZjujWxOlcdwMjRbFzeTPsMWKGAOfMqPEFwx";
	return GddnnNSusG;
}

+ (nonnull NSArray *)xsYRevablfd :(nonnull NSDictionary *)tqhXzeiInIxewNwKpVa :(nonnull UIImage *)EAYiTXzOKYC :(nonnull NSDictionary *)ZOhGxLAkbEwMw {
	NSArray *EWXSCqgjdP = @[
		@"qZIFakEUAmGCUGJHGXJhUnKjWwqOpxdZMxwuzrjAMBwQkvoQYUUaQeeiXVzZuvWtpwKdCURgyRGeQXLbrqfEPMWBAGvRIsYgnhmifEgqrcaykDxmxzzpCDMKbilpuhk",
		@"BtyoboDtMfePsqIqAYmFJokTHiDLDoNKEPfCWuLnTNutApJZAcOLRFIitwXcVvdpYMFwJsjqnlhBEHrtaRgbjVPGPMQaaafmJucQkG",
		@"DXXFsyeEgXJVRQcpQJbctnWAylHHuxuzTvHBWTXEOkEjpUqLdTNExSlrmXaYxGTCKDepvVcJhspNBIuPVqIEkjTcuCfmiFOdIZkrfQUEiuVBnuRSyR",
		@"sQeUZPUtVRYLdzlIbnKGAcbEgStqASiBtcYOuHXzVxVdqMhZwIUxlbHsnjMitVLaQreqlhzEYiNMUOpDpIRKsSVMiCgfLPLiAzZelJFGngzBsRNvkEqKEzBm",
		@"InJTwdHdgwpJutbGyqcZOeABxeXaKYuVyvAafMJvztDrBqVbnQtAMmNcHpnvAtGLziacqloXVPnMuXjGadppVPWyyyRQQcSSGwKMiNLNqELPlp",
		@"FMNmwjxjMaYTGILmQZfkIRcBNucCkSLAUvDNrPzUYJanscjzrIcPOUpIbaozrRTgSzsfwZebPhZekLWxQzNnBPxrwEKKVyZOBOSQYUjw",
		@"tdUEvJDwfcrMBeNsJANYhnQHLaMumtAyYFtcbFIWZQoWIVRYSoqKZIvabkNXRfpJXhOfsUguIhSOCPEFRVhBqYfBuzVPSgDmpqtDUDaWTIhgerjIDcaPdJ",
		@"opVrOtIPJZYMqzgmPUSAhtHSmNUUOJAtLOWUryYRlVXDZLdYkqtOjhCYOfhuSalAwjgRkOaFrhbfJrYidkbDlDgfFiYpiXfojHYMVAIuYhZhfMyPFXOZh",
		@"IxiXRPlyiJXSVullFvdsjyqnTjViVaahCpopleoQBCHTMjNHwSEoqSxjzYEJGUKBViWKkvRdvyyyelKTzxlQGLsGBcBWXKOjxAJkiEiHpJjwHSHLIhTGAvdw",
		@"ZZbVXzooZgZnxkEKMUQZHCpeOADfWHyQRyIPvLeBbRrBgvaFPZUchahOSRoITqBiODhkmYwPRkaBrBapNmExARdMVKedJMvQhNhyhmxeINIBAIyUCxe",
		@"ZEksMIbqxUkdHmfHnPJvrQInMPSGwnzwnFMNxOXPVbNokrDwFRCkQNzjavugmWASMTRcxdKPaGAIYFsdjHcxYuePJqWeDgwLRDDZQCgFAM",
		@"HPWABWqwtSCPztTyQYarSBPUFNxMEUMqvmgfJSrfMNLhEQhmzVVRhxayrZlZbmGYPaQeUwmaxKprldCtWpfKxGljSLsNKZiRZjOjTujqmLvMipCutzYyZeXkYSZmkIJFA",
		@"kNtoUZytkYOjublfUlZhGqNZSxspNYrSKRCBNUfMDAvzYeSSyxxyJsWiAAOHiZUGKemwbClMagmsKIoztAvrbtWlduNcYwKCfYWWImLyLvdfhXijHlGsISMkLbHJ",
		@"UTIEMLnwDSWqtoGAJKiSSjJGDiRMhFJjOChHIfSFAMEexwnKAlKVKxbsfeBUxeOcDIjubRLzpsRONVXucIOAbMsjxrQWXycisQRkcPqodDhwhQSv",
		@"bOLzdtzFTBmFpsxEzLKomRLqRLWtYafsMjpakgyMwnYcUEvhpuksZuzblCDHdHQfzgcGBgPRMETwfwWFoDjHcaerkqNTnWKZNVieWXKSIHzoIzIgfklcqbrrMwFXklNeDAwRp",
	];
	return EWXSCqgjdP;
}

- (nonnull NSDictionary *)ZEzFRGeepONnVALvxt :(nonnull NSString *)BSyzWMAbUIcZWya :(nonnull UIImage *)hspjIeEZtItor :(nonnull NSArray *)lNvvbZAuCcEMsSvNjZ {
	NSDictionary *BcUbCcbhDSqU = @{
		@"RbjnovaFWJiujPs": @"kUBOglsDioGeLqaXsNMlInHhfJavyxErZYmLCxmbclIJQeIIHowjHTxjEfuvpVBsIclbEoWUZHBhhThNYmKHkqqTSaAGdpUEGNPXByrKZIYiMtadZmpiFqpSUWKpDklMEogrVzpq",
		@"eDeLQEIAJm": @"IdhteQRCerUKymNDAaniaSumYibNaYyHKRIarXnZSioZWizdKTmkRMpMgMxJsSlamddfpUeUNnonPnLyTAeWcoPlKIjidmZBHOUTIqqeGKdeAuwZnLZNsaJjsyCYYuvLmEJfcaErifDfurVDzyH",
		@"NuThRfyJVfVebglnt": @"kCDdnKWhNFiRWiywBKHEkneGNGoCjwxTxoEtNyqQWWlrVdpoMrFLUbKHdGTYqgxbXhWbDpPzASTrOHwuhpvfxHYXRuZKKhVkzPJMHLXRbWCRBTkDcHRPdbAfWtLtOrApqTSAjJZzlfoSIOWfqQRjQ",
		@"MDfRyiADCu": @"iaSWUwZHYUZKRynARccrxQIyaOTSUznzcVhiiiMqjBbChXjvqsWLNAPIAzzAGpxgkJnNmNCawBDRpyfvrsfTLwFRcJhgwsbUHEtoZKgJnFtdSUucBSOOijIERKeXACFwOeAZBCDJBzStHFlhMyM",
		@"FRpUdWqVVGRUQss": @"QywbVCpmyQSAVfembABMEjmfQhcKDoZSEuBQyqUjoovoKojMtoqRzDzEZwNddcJYgIJUWIpnXEYBEvSavGHrrhpwSTPoueFgFvOPrcODWv",
		@"nCJkYGTTTXZJtdC": @"pXDBqpuDiMDeIqdFsxPkWnMrNAppOMdoGeiEcrCugxJsTZrDjkinCNcirsOHVoxoyFEZBkPfuTsCCYdEMQCJmhjbqBMjmzZJYQEmniFHBVCFqoXbvnaCfBNDLIVdtCeDmm",
		@"llIObMmwCywKzB": @"AxakWVxLcoyazszGVqISXWrXQEQKvTpCARPuUSXxBzaxwDZzzxSzERGsvqENSMhFRELsXwzUAJPpwSSXFARPFcPuxvRbLmYCxLQshQOpXyFexsDsAflBrfrAGqdqE",
		@"soLpGorcDlq": @"eLfvUQoIQvNjtNXPNNOFWLlLzBKwbHCjbayKQGcKzFXVicKIBsyHwZHElCMPLSOlmVBnDOEWxKepygAdQdbBtWsEeDQhwbWiANTmZTChtdQOQNvAajnzBjUJztmCvwiSqzIddLXqRpcv",
		@"wsXcNGyhSP": @"NiHHTkgRxhXzTPEKgoyhdnaatgtqpMOKSAEDAQzMjEfMncjUwUkWuwyQhAjgjvBdIRaOrWkmOVqoiecvuuwaBUZmtrLfNITaGHbppTQBjDhclylnsRFVFlhN",
		@"ySHhWJyyUTUBYiY": @"qMEeiefyHgLNNSbEMqvXoCXdhzroPbRMucxmSAwSQKMaYMfKQCWftcdgNfwVzmQJrEZxCQvgWpGwiFDVHWvIMoAOGNvULdDnULzwFlkiiPjyx",
		@"IDpRXJDuljiG": @"EmasGOltrkjipbDyTUSxPFcqtVcXxKXFGLGGzYQANszxDhobZzUBZzqcRUfjXkXACckCRHieEithApIWxbQcJluRwonBUCXZWFEhvEgdObUatnrXRfesuWWvpKmAuDjJztTOoGP",
		@"KaKlqfWdCmeMjDvcLPD": @"PgreuykwkienxjdtqeLwkApSEOLpHbwPIqOSjehtYSRJMpFfmGqZZyHxuPxvgnAaRfjZOfMgwdcoSGDaENHErzrhyxXyHbMEjUuvbgidBhR",
	};
	return BcUbCcbhDSqU;
}

- (nonnull UIImage *)lxauKjrDgZsWPriNsTn :(nonnull NSDictionary *)nWUSXhuswjnSK {
	NSData *BTSKpiOUEUN = [@"FMYavOanEosHaPrdwOlMNCsNcsGbMXOtMyNbcSIaTYxXIVSuclEIgYtZWfjTOuhUEgmdCNyKhznyiVDHnlouPgjiOFjSpAQUNrDHtPfSqStycjYhMhuqdmrF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MpgenCIZOKYeMMie = [UIImage imageWithData:BTSKpiOUEUN];
	MpgenCIZOKYeMMie = [UIImage imageNamed:@"UFtVyvMuVUbjWmEVUDKGTsADlLGjkDQcHYVgoEOZdQRIokGjlfuUFIgJKhWOkKBiZGfIEDiQgepgsGgkPESYVhVXGebcGaqJWVUOWefMSjoxHiChAvzbj"];
	return MpgenCIZOKYeMMie;
}

- (nonnull NSDictionary *)mbeFVCOHaprrIbD :(nonnull NSDictionary *)XcYoVBoDNdLAzz :(nonnull NSData *)vllrCCtfcrqTZf :(nonnull UIImage *)fIQJcrtewFcWbJ {
	NSDictionary *nwGMHflCuotHa = @{
		@"lTFHDgehuXLJ": @"nMvIUsMBkKbSiDBiQxnuokAaHVUSupSFqQFwBtSAtbGfqayhSWAEFGYNsdrBRMWfUKTjaWAhigMtWhYUqzyqgCemNmTUjyqfmmUpjswd",
		@"TfuwzSQApRHwEXJeVY": @"DVJwSbVWLSSBbHpeUITZfTUNbdlyTxJlWsRpNmIDOVCkADUZojmgluMuyHfzBcZntSUQBUmwNXSkGRQKkQIzpKvrEtTbnwCgoVmbUKKCzfGLkXsanLUFhEJ",
		@"NkWvCSIkXgghCVsQ": @"xkHOWStIjvtSGzrAJXpMxEcpcZSUNkkFUOnFfBnXQCUVTzdrleTlcBlwIpReIJKvVTjZDJHOYfMfWizhpJduprYjqibIQjpYUnrpchdVAjdcSreHhnhrSkD",
		@"aCarlxMrADNWv": @"lzzIAqNkjQEhIuMKwHmMpfEYtnKtenpEjdTyNTULDSiHdAoOvrwfuJePzaEYCYCktlLLxYBpeGNDDnTTJchSbfOjUfwnzsXYcvuVjtQLqEkzaxalxBTCplvQYBaRvrVsBWSoEEouLfLeECfL",
		@"mzGJzqOnHTg": @"XpGqsyPGAFxNpzIwwBfGIncsNKWKLiBMYHLqdWkhTAQqAIdTfHBuhZIIzuGnikilkEVGwMtYzJiWnMxOyxDgXLAxoynqFRzuCjhNDuqGLGOanCzblvkgoNoS",
		@"lkJgaRMUWzXOFgSDvPn": @"TQztZwHQmvRaWdikGfZTNAYEbExSamZwheaXUvjRvxGLNdpkyeSzrVnVpraTmjEJOiBbnZOsAIPLfflaBusImGKaTblTvTaqFVqmobzrlOMJDVoHbewRygI",
		@"HOLBjaVLJy": @"QlnWTSYgpNUbeGXHDhbziRkWWPMFvtutyufHhTIYWjvVKfAtQURnycVcWZLAZlozZhVpsYrEbAuSOozXHGHfSceVljrEYnBaLsQPePnvWQmAFoLjxquG",
		@"pDFuHzsqNEfHuFE": @"FUucYFARJPSMadcbKMvNJyLjrNNzRhkVnwTHDARHuYbGkYoDMiUsFArlunOLZEDNbQJsCHBUPQoFoKAIKHSVPNPzfWyQbaQCcFNNqeZRlmFkXKCaSGMKztRIx",
		@"dbRgqCvMTceLsSrF": @"OyKJPeidlvljMnbNsBsFwsTMQWKKOMLnUkPMCJtPxbldIvJjJCXCRsbtfaTBtMISDzUKqsXLASVioWPqExKgpXkVQPyezxGcmKkgCQYAtdCHxlpmbyIcYceUJMufrHEsokmau",
		@"DTgHtLkmGIuVHkgYs": @"NgeflqzqEEBUPkaiqrpfLiLQClbaQelOsEmAsHmiwBpGQutcZMsndKiiBiaVyObmGtGlqOQGbmUYxgWHXZPTPnPnXTHBEqzUYtBVlcLTYCdIPhfJeaCJThRsLqdaAwTtTzgMLezKoNvskwbXTWw",
		@"gZEJojQERUTceSWiGY": @"taeAPXABGgCLdMHCHAZVCBpqRPLDcDTUVYCxCAnbeGwNGfUKgmhDwXPnVAkFkuTvGMuBDNwblNROVLZsYnpOGJpjKBXAxLPqclwwgBmPeYCEoMrBXcMy",
		@"nBjxOfYwAqCrfiqQzLg": @"sWPlFovQKbDvTrRxuyGxpOHkBjqFuHJYGzEEsHeSoEWaSDUhCxRfLsNhCzJgsIIuoAdXfIqDsQuNZKxfNoECxjGCKmrzLyCnREYbbMwzNTGwxliKMqlXgkJZNlzHhMZlftYRvwULDBSzLFtnFP",
		@"UNyMnlGTyQIbAuJbe": @"aMqgSQnxcUfMJBuHWvBKAkPbcjLHuAELAIjrDuDAJtGTKQmXiriCBtmaLYDyOiVmTgrRKzCigdvuEeLsNHvRxvQpSVjxazuIVohKYqLJGxPATYfkfg",
		@"BLsojZKgQgEwx": @"ycLlEMUzMWULmPIDUJTbgzJCXbPaxrLxspetCUGfkTflznWDVhuzMTKEPlXUEmPLgshFGzMYlGfMWRyASunZCesJYNovJKQKVQljYgGiyuFwSJIlDlSEsgiVHidRfPMtUDzemIXyODAKfYAbrLb",
	};
	return nwGMHflCuotHa;
}

- (nonnull NSData *)xrcgepNGXGDR :(nonnull NSArray *)zdXkEQHwEMff :(nonnull UIImage *)nYuJQtQxQVZ :(nonnull NSArray *)JBqwFVYuwRCwc {
	NSData *KSSJJyrUuFlMfMvgXj = [@"LEPzXWDlRiHukEzHTlhiaRGcdLErVIZlWzNLeoGfSZOOcaKFclKrbOnyJPdzDgkiSVHHAMNURjjceVJRwWISzUNnAiVyzKRyfdHarWjYqYwRpW" dataUsingEncoding:NSUTF8StringEncoding];
	return KSSJJyrUuFlMfMvgXj;
}

- (nonnull NSDictionary *)fLNOCbNDlbmsxpG :(nonnull NSString *)vnxcPjkNvnFGVgVITj {
	NSDictionary *fcxUCGIYBCZIdg = @{
		@"EZaIBwPShEmvgZRYMN": @"zdAiWxXTvYMIRqILVuRmuSXYMczyXQgzVSLadsszhRsqitlvkllPaTBYoRlmBbNlkKbZJMmlpmOOsOaaNVWsklnoSoSXxtVuTHmrNIKvAjibwmIvVQhEweTXZJmmJNtalexrdEtsfyjhOnlOfc",
		@"AXIJTomNKrIIsfe": @"xtyUKnZuuNTMADUgkOoADnOvWuVoLFJzNPzvaEbiCmEujDVFUOAgcdYAgDFwxrTTnBzNlTwoFJJTmSiztWXHUTVKDFTvLrigGEXSwzmOPbexSFhdFoCgdhtBGphdGEUsgGNYqqQC",
		@"WiHQQgGhtVcJWKER": @"UqeEeeKNnOBfXewFYYlaOGeztThqjHeqGMjnJTWqcjJwKenCLMaoALfQaPqXwwQPLxGVNQgCMNataFvgaqgnJEBOtjPokobfnmwTw",
		@"mTNObLTuWSfinKWqnd": @"QugHexVoTrAyCMeBybYtoPqJFkaFIEkibOJITKhkkYetuoKVwpeFgtbDKapnHWcSABEMbhvOrWEZBwUHpFXLlxeUbeTkjjCanUqQWQrTma",
		@"nTHUmDPietStkVxwyD": @"pQIWBBwdAYIbxLJdVUcUgQWchhufswwxRWoKucOzhpxyaOMguJWOGCRqppYSCAmaokMazMfWJGIBgvSToDbTXUVmDSoduakjvuPhhDlJVwmhLtacqtTExZZyVoMVRAqNjWYZkwpD",
		@"DqrXjsPvXdLQvlhCI": @"QMUjYPaKFXVfEkqyRpzpuvkPUxgnXbwpMozDRZBkPYXuoXxJhsrqjfLYgxrMpctPnxiFubnQPYFXldpYlakJgKkqgOPChreLUmcEamTSDzhVdPcKQIOkWvLPZoObMkrYMHw",
		@"sVLNUjnBGoAhKV": @"bvdDTALCSMWeiFAUCzMdTGwRjILPvYEcgoszKFQnfgizaEFhMXWKiwhRKUImtiwqpidZbFNEmIViLvXsunyMTNorbdLDweZkjsqhzZwhqgxNwxtoPoFWct",
		@"jCtCupvQHGkqMzG": @"eFAuAJOCMUgGOXvevAuyXiZXlijFuUVgUoJeHPRQafGchSKjZAarXrwwJKWsjEWefkMwHhaygYvPCMhpXwEoHVSqTBybpvYVgWrWJmttdvGODQRNNWBQxxCvQjOtWCqAtGiANctpgOSpmrSD",
		@"fqKxrgfNBjlusW": @"zhtnDpBsvzyYwSPHeYVRClnCgmgVGorFynWIBaLWlUlTRqrwezzYhFQpTNAeyPQLTdVzOKFhfCvkFlLlPqcNKVzMuiOuInmQLZGxYHnXSp",
		@"bbNjNckigrkehSQeB": @"dNwXIAYvEYpKoXRrwtqyjjuHeMBVlplVbwXqPAJoLAqIEgPZwQyDFDUlBFPUeVCtgvnRMweUNbMZUqoxdiQZjRMvXaAWKyQaFLvJeQJSaegBxOoOfLGLfCNxgOjkrPFzcvLetnBpcBVR",
		@"mmMcCCsRiuPmMfERn": @"KzyRWEZeMNfiVKEAkQnysoIpqMUELLGfmXUgImrQjWqGMioXVZRelMlXSnAmrfmtvJNJSGYvvscdZZHApFMmANWbDhQYkenKbQdzJAWJvRoNOMEcOCXTMdDgPuVJMdGrTRT",
	};
	return fcxUCGIYBCZIdg;
}

- (nonnull NSData *)lnRgiZHMyxpx :(nonnull NSDictionary *)jBpgtVAEOnMjKhz {
	NSData *irYiqfyqzyG = [@"IDzuEdsRDUeRHcMdKuirkRGBRdbWtfZLcpTPFLvNQZSnVvfAbmbxOrMnnCklKDxTZxGLxGAazOYFEHpAZIgwSOVHfLlpCUqDUgHRvKRynPMcWpgbRHLHaiXuogMNsWcsapNSCWtqWTBXMJPqIraM" dataUsingEncoding:NSUTF8StringEncoding];
	return irYiqfyqzyG;
}

- (nonnull UIImage *)biwNUwevlK :(nonnull NSDictionary *)cdfkXhwIiLuBIE :(nonnull NSString *)AmIRRvgSNFF {
	NSData *zcZfmdfuKuatlMbXtV = [@"BMpokSENyovrOZGAndaITCMgRXFrRladEliBknpgtWkZYXbApFASBBsysvGnKytubgYVrtmAQnaQQDkMDWSkzVGDqPbLNmMkqjpMprCrGxmzgcsoteGwttdeTxsh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KoQXcqVUXLDz = [UIImage imageWithData:zcZfmdfuKuatlMbXtV];
	KoQXcqVUXLDz = [UIImage imageNamed:@"lwiAQCiDqIadzyTuUPTpHXZyMrOuqsoPPRwdsWuxScDTDqlaaZVKYgUSZIgXcfQpjTFLtcChnLkVIWstAcyZyHZDPVzvLszSIysxVvmWOGYYOvYPsJVpMETUUbVTTljMQaWNQelMuOZ"];
	return KoQXcqVUXLDz;
}

+ (nonnull NSString *)zPJIZvxQJgjTMgoj :(nonnull NSDictionary *)zGcTdegvkX :(nonnull NSString *)bsNmNZrOevatpiAzw {
	NSString *EKmhXxwSCr = @"MkwHUvBrWvDpMzqRZqcQQKXYwFvilreFEDeOPwIWRdiMZIWsWNTNKzGUTiyVFXoATMHXqkRkRaVqdJhfaBjNnYidwHndVoZkcVNuJFzIhxcjlxFvjCBuENhzqRkkdLdOOombQdJG";
	return EKmhXxwSCr;
}

+ (nonnull NSData *)NVUbFCGGsUHaRW :(nonnull NSDictionary *)TTqxKpyyVkqlAA :(nonnull NSData *)iyNpRbYINBpWJx :(nonnull UIImage *)RLwlvDySGJzNXvFCB {
	NSData *MwNZimNETjsyKs = [@"PiqWwGGLWsXEaLUwBpQZFgPQxEAVRqnzJFGNjzVjuabVKpcMkzOhamCyOhVXhCAHcqtyFHJkpTvKuxnEUqiemqdnKzOnGYgwSeeNJgfaeUxSfUcVURDJL" dataUsingEncoding:NSUTF8StringEncoding];
	return MwNZimNETjsyKs;
}

- (nonnull UIImage *)hEPULYizNhJdz :(nonnull UIImage *)TDzxhSZOSlyarxDaArg :(nonnull NSString *)tsQnZRMNcmzX {
	NSData *lzXrMElPnyDWdZx = [@"bFSkrrtEHHkyzdojHBnDXuswJggUiWpuwUqAefKKfITLXjbuEaOviEeSFuAYQbFaGRHLFyPUNfsBLjWlZSspNkDhAWotAsyCatkYbfmZnuzPCIXoiSZhMCKOkiQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zLHvqzTmDExYx = [UIImage imageWithData:lzXrMElPnyDWdZx];
	zLHvqzTmDExYx = [UIImage imageNamed:@"uhqBZqOfKabzXaRXUKkmUXvTlwcFXYECCCObAiQcFQLyXccBlPfLWfcsmuTpfBUQtrCcIybTtQeGIFBcFkZrwbHjBExKtOvShGyHVnjCaATRWCDOfejckaSdSsRnpYer"];
	return zLHvqzTmDExYx;
}

+ (nonnull UIImage *)yzaBQLbaUhBBeGH :(nonnull NSDictionary *)HCWxazuYrSSoNy :(nonnull NSArray *)kqTEVBMjsmauiL :(nonnull NSData *)mBgAycbEfhyaQ {
	NSData *DPrLSsIlcOleZPVdAr = [@"DKCnnsFNnrMKPsxULTITpTbdCXrYUghZRoCaWntTPziSHsmLuvKTuiPQwZBWXJdTbRhLSefqzOGjEWuaJtDWJIoWiyZhrzFEHMQjfSxAMDyiEiiMVaazLQcC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CHZkZCHWdkh = [UIImage imageWithData:DPrLSsIlcOleZPVdAr];
	CHZkZCHWdkh = [UIImage imageNamed:@"OLhoIlRuAocKpgfzMIsIDKHcgSnoBDsbOrzHhUfABmnHKxbxpjndsAhsaLVjknkldYglVsuzFAKbNNSenZJduWAdMWAPlfuHsZyYDqxpAaXyQHyiKDbKIsNGMHqixAvALtXPDzdE"];
	return CHZkZCHWdkh;
}

+ (nonnull NSArray *)hCRJDonZxNnZgJ :(nonnull NSArray *)suFGLMIUMmaSUVb :(nonnull NSString *)MyRARHfeElrT :(nonnull NSString *)VOwpWXcfcK {
	NSArray *tIDbYXMtyqcNNMUxRRG = @[
		@"FixwZBbVXkhPvTqlLwuQXNFSxejwFKNPVJUqMPxZwtuTnfqyrTaZOQRPgCpQPuJhCCpDclWsdFoyvmTPuQZPSoIdDWrvCjfIMMsQwMvlRCwkJiVopTxUETmeGzzXuDMHjyDZaM",
		@"bwmTEqFSKobvlDqrjlWlmMkivYgEduWfpHIxKCGoRGEfJHNRaXblYLtMvDPgnHUQaOikkUhPALSopbkRoGWrUorULquwowpLWSbmfZgVEwWpmKnqOEOJrmSeXdnEahcGWoYvCz",
		@"lQqomLtotYNgyNHwQfeVTahJVGXtYKdARKnINTNkjQVOcsqcBixQFvARHDbHRFraScjIVpMLceOfalCHALxkviLUYkBPqOTdtFouHZPDpwBQxHZIuUJYFMIusbBDWVyu",
		@"cjgIQILLIbYlRFqOmaryijlfBDDHQtaEXSFEVvNLBKlQMwLCnZvlOkmSQybkdNumSXXocCnVUBJYALFWIqOBDgmibtyEHycTqAaypNMoJChTGpBLNlVjIHpPfiaFhNdxLEVQXbUrgay",
		@"yYFbzPtrdlXGDaPdFmrICTdSqNgbztxNNDwITfPYvkgzMHCLFbRdOCUYmEHmqgDBjdjQhWJfUUuFGgzIzMHyWgjfRcvKTDkICxdiENgjAaBmKygHAvBJBOObqeDfBXfHYOmjVHhKhRlgNo",
		@"IykcDTSsbDZqnNbDJIWbIeXTfPCDGdVMfRyNKwnqObhpNmDnStgPSHadJDYEnCAgETYQzDHBeeboYkHmbbQaIibqxjwscibHmxVOwfmXariETjrUmoZBkpW",
		@"ILyhATFSAjMHmosiLSvfoudKzPzGmptxcNWvWCwysxkWiQDSAVdRtFmTXUwufuOBxbCFKZZYsANSQDIsYJLdCRqLOGKuFzjidnelXZGp",
		@"RIgHKEJyFMuxSLhWbrKqOkyOwrcFOTZpXkqGEmkZsEUSfWVuXJYcnDadvGbiTekCzgifcUWPexhlLiPwtlXXpSoFzadJUlvsJemFnfpUWQxwPsJjZLylbpfqBNfVJfCMObDSND",
		@"ZJBvorMNKDIkKLnoztaHRrBiEtAOUpBDbKxUUgUCaxBFstYWUlUyKaZATISJNLhVOeqZePzNYFjrYSemmsuwCTASpESjikgrRbQRbblQhbQGeRNzajrOeTNdYogUblCgbefpVrxDamGlzhzucexW",
		@"wVJsiESFOyjfdpdFNuTQbuINebZhKkKRYKhtuzCFzXcqHamZGkpJenpvIdoaUNnqtQubDVkPKoZMfZIOIratqWFYsJsLgDkkpZdOMaBlOE",
		@"MxHPVcNWlXFcPCYWEKEtcjuCghkTGvVDhLRoHifITnSUxuJQtuVHCFJmzOrVVnVgpWdMbzYoebdDbERyqQBHNNJsjvNCWyqxItBpDMsWzJrSwHoLEwKpSToOFVzhmlykdZsHiRFnrdCdbI",
		@"GDEOQrpumsrYepUMisxJQLIkwinbydXTLvftYXNUjIQywNFPnegJaWWPnwxZBrKZyjgDHVYuPbuxpFVMZUSEKxTFWleKaTABtyQcNNOKeGuWhufbDNsusLrpmWysShnJSxaWYujEHYHVOTQbo",
		@"pEOilLzkQkgURvxBRZkHgXqvpEQPiYKdAMycRsLjJuKqpVOhbDoTzWOvpIwgOkPNbvCuDqYPgxLeakywbcbBqASQBomtDCYcqTzPsKfCBEEvzOyIrPJ",
		@"lOJuOElyRXBqRjKUnnzTNKIMJwBdyQOTAnyPbvuPUbZDyELwjDHjCgelPIaKaBpGkrfUfFbaITTglemUdosVdVgmnMHNXbVHRMcKLVFRbrbCAitbmFDtbGmGOGIPFANoneCBizdfno",
	];
	return tIDbYXMtyqcNNMUxRRG;
}

- (BOOL)isProgress
{
    return [self.customView respondsToSelector:@selector(setProgress:)];
}


- (BOOL)reusable
{
    return self.overlay.superview == nil && self.superview == nil;
}

#pragma mark - Setter & Getter

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLabel;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.numberOfLines = 0;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _messageLabel;
}

#pragma mark - Private

- (void)animateAppear:(void (^)(void))completeBlock
{
    [self.overlay addSubview:self];
    [self.tipsInfo.superView addSubview:self.overlay];
    NSTimeInterval duration = self.tipsInfo.duration;
    if (self.tipsInfo.showAnimate == EMTipsAnimationFlat) {
        self.alpha = 0;
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.alpha = 1;
        } completion:^(BOOL finished) {
            if (completeBlock) {
                completeBlock();
            }
            if (duration > 0) {
                [self performSelector:@selector(animateDisappear:) withObject:nil afterDelay:duration];
            }
        }];
    }
}

- (void)animateDisappear:(void (^)(void))completeBlock
{
    if (self.tipsInfo.hideAnimate == EMTipsAnimationFlat) {
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             
                             self.alpha = 0;
                             
                         } completion:^(BOOL finished) {
                             
                             [self.overlay removeFromSuperview];
                             [self removeFromSuperview];
                             
                             if (self.tipsInfo.hiddenCompletion) {
                                 self.tipsInfo.hiddenCompletion();
                             }
                             
                             if (completeBlock) {
                                 completeBlock();
                             }
                         }];
    }
}

- (CGSize)updateCustiomView
{
    if (self.tipsInfo.customView != self.customView) {
        if (self.customView != nil) {
            [self.customView removeFromSuperview];
            self.customView = nil;
        }
        if (self.tipsInfo.customView != nil) {
            [self addSubview: self.tipsInfo.customView];
            self.customView = self.tipsInfo.customView;
        }
    }
    return self.customView.bounds.size;
}

- (CGSize)updateTitleLabel
{
    if (self.tipsInfo.title.length > 0) {
        self.titleLabel.text = self.tipsInfo.title;
        self.titleLabel.font = self.tipsInfo.titleFont;
        self.titleLabel.textColor = self.tipsInfo.titleColor;
        if (self.titleLabel.superview == nil) {
            [self addSubview: self.titleLabel];
        }
        
        CGSize maxSizeTitle = CGSizeMake((self.tipsInfo.superView.bounds.size.width * kMaxWidthPercentage) - kContentInset.left - kContentInset.right, self.tipsInfo.superView.bounds.size.height * kMaxHeightPercentage);
        CGSize expectedSizeTitle = [self.titleLabel sizeThatFits:maxSizeTitle];
        expectedSizeTitle = CGSizeMake(MIN(maxSizeTitle.width, expectedSizeTitle.width), MIN(maxSizeTitle.height, expectedSizeTitle.height));
        return expectedSizeTitle;
    } else {
        _titleLabel.text = nil;
        _titleLabel.frame = CGRectZero;
        if (_titleLabel.superview != nil) {
            [_titleLabel removeFromSuperview];
        }
        return CGSizeZero;
    }
}

- (CGSize)updateMessageLabel
{
    if (self.tipsInfo.message.length > 0) {
        self.messageLabel.text = self.tipsInfo.message;
        self.messageLabel.font = self.tipsInfo.msgFont;
        self.messageLabel.textColor = self.tipsInfo.msgColor;
        if (self.messageLabel.superview == nil) {
            [self addSubview: self.messageLabel];
        }
        
        CGSize maxSizeMessage = CGSizeMake((self.tipsInfo.superView.bounds.size.width * kMaxWidthPercentage - kContentInset.left - kContentInset.right), self.tipsInfo.superView.bounds.size.height * kMaxHeightPercentage);
        CGSize expectedSizeMessage = [self.messageLabel sizeThatFits:maxSizeMessage];
        expectedSizeMessage = CGSizeMake(MIN(maxSizeMessage.width, expectedSizeMessage.width), MIN(maxSizeMessage.height, expectedSizeMessage.height));
        return expectedSizeMessage;
    } else {
        _messageLabel.text = nil;
        _messageLabel.frame = CGRectZero;
        if (_messageLabel.superview != nil) {
            [_messageLabel removeFromSuperview];
        }
        return CGSizeZero;
    }
}

- (void)updateSubviews
{
    [self processTipsOverlay];
    CGSize cSize = [self updateCustiomView];
    CGSize tSize = [self updateTitleLabel];
    CGSize mSize = [self updateMessageLabel];
    
    UIEdgeInsets contentInset = cSize.height > 0 ? kCustomContentInset : kContentInset;
    
    CGFloat longerWidth     = MAX(cSize.width, tSize.width);
    longerWidth             = MAX(longerWidth, mSize.width);
    CGFloat wrapperWidth    = contentInset.left + contentInset.right + longerWidth;
    wrapperWidth            = MAX(wrapperWidth, kMinSize.width);
    CGFloat contentHeight   = cSize.height;
    if (tSize.height > 0) {
        contentHeight += tSize.height;
        if (cSize.height > 0) {
            contentHeight += kContentMargins;
        }
    }
    
    if (mSize.height > 0) {
        contentHeight += mSize.height;
        if (cSize.height > 0 || tSize.height > 0) {
            contentHeight += kContentMargins;
        }
    }
    
    CGFloat wrapperHeight = (contentHeight + contentInset.top + contentInset.bottom);
    if (wrapperWidth == kMinSize.width && cSize.width > 0) {
        wrapperHeight = MAX(wrapperHeight, kMinSize.height);
    }
    
    CGFloat originalY = ceilf( (wrapperHeight - contentHeight) * 0.5);
    if (contentHeight != cSize.height &&
        contentHeight != tSize.height &&
        contentHeight != mSize.height) {
        CGFloat total = wrapperHeight - contentHeight;
        originalY = ceilf(total * contentInset.top / (contentInset.top + contentInset.bottom));
    }
    
    if (cSize.height > 0) {
        self.customView.frame = (CGRect) {ceilf( (wrapperWidth - cSize.width) * 0.5 ), originalY, cSize};
    }
    
    if (tSize.height > 0) {
        CGFloat y = cSize.height > 0 ? originalY + cSize.height + kContentMargins : originalY;
        self.titleLabel.frame = (CGRect) {ceilf( (wrapperWidth - tSize.width) * 0.5 ), y, tSize};
    }
    
    if (mSize.height > 0) {
        CGFloat y = originalY;
        if (cSize.height > 0) {
            y += cSize.height + kContentMargins;
            if (tSize.height > 0) {
                y += tSize.height + kContentMargins;
            }
        } else if (tSize.height > 0) {
            y += tSize.height + kContentMargins;
        }
        
        self.messageLabel.frame = (CGRect) {ceilf( (wrapperWidth - mSize.width) * 0.5 ), y, mSize};
    }
    
    if (self.tipsInfo.backgroundColor) {
        self.backgroundColor = self.tipsInfo.backgroundColor;
    }
    
    self.frame = (CGRect){self.frame.origin, {ceilf(wrapperWidth), ceilf(wrapperHeight)}};
    [self processTipsPosition];
}

- (void)processTipsOverlay
{
    if (self.overlay.superview != self.tipsInfo.superView && self.overlay.superview != nil) {
        [self.overlay removeFromSuperview];
    }
    self.overlay.frame = self.tipsInfo.superView.bounds;
    if (self.overlay.superview != self.tipsInfo.superView) {
        [self.tipsInfo.superView addSubview:self.overlay];
    }
    self.overlay.userInteractionEnabled = !self.tipsInfo.userInteractionEnabled;
}

- (void)processTipsPosition
{
    CGSize maxSize = self.tipsInfo.superView.bounds.size;
    
    CGFloat visibleHeight = maxSize.height;
    if ([self isKeyboardShow]) {
        visibleHeight -= self.keyboardFrame.size.height;
    }

    CGFloat y = ceilf( visibleHeight * 0.5 );
    if (self.tipsInfo.position == EMTipsPositionTop) {
        y = ceilf( (1 - kMaxWidthPercentage) * 0.5 * maxSize.height + self.bounds.size.height * 0.5 );
        
        if ([self isKeyboardShow] && y + self.bounds.size.height * 0.5 > self.keyboardFrame.origin.y) {
            y = ceilf( self.keyboardFrame.origin.y - self.bounds.size.height * 0.5 );
        }
    }
    else if (self.tipsInfo.position == EMTipsPositionBottom) {
        y = ceilf( (1 + kMaxWidthPercentage) * 0.5 * visibleHeight - self.bounds.size.height * 0.5 );
    }
    y += self.tipsInfo.offset.y;
    
    CGFloat x = ceilf( maxSize.width * 0.5 );
    x += self.tipsInfo.offset.x;
    
    self.center = (CGPoint){x, y};
}

- (void)processIOS7TipsPosition
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
            
            break;
            
        default:
            break;
    }
}

- (void)handleDeviceOrientationChange:(NSNotification *)notification
{
    if (self.overlay.superview) {
        [UIView animateWithDuration:0.2 animations:^{
            [self processIOS7TipsPosition];
        }];
    }
}

- (void)handleKeyboardFrameChange:(NSNotification *)notification
{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyboardFrame = keyboardFrame;
    double duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        [self processTipsPosition];
    }];
}

#pragma mark - Helper

- (BOOL)isKeyboardShow
{
    return  (self.keyboardFrame.origin.y < [UIScreen mainScreen].bounds.size.height && self.keyboardFrame.size.width == [UIScreen mainScreen].bounds.size.width) ||
            (self.keyboardFrame.origin.y < [UIScreen mainScreen].bounds.size.width && self.keyboardFrame.size.width == [UIScreen mainScreen].bounds.size.height);
}

@end
