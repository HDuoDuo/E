//
//  EMTextField.m
//
//  Created by neebel on 16/8/25.
//  Copyright © 2016年 neebel. All rights reserved.
//

#import "EMTextField.h"

#define padding 5
#define heightSpaceing 2

@interface EMTextField()<UITextFieldDelegate>

//注释
@property (nonatomic,strong) UILabel *placeholderLabel;
//线
@property (nonatomic,strong) UIView *lineView;
//填充线
@property (nonatomic,strong) CALayer *lineLayer;
//移动一次
@property (nonatomic,assign) BOOL moved;

@end


@implementation EMTextField

static const CGFloat lineWidth = 1;

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _textField = [[UITextField alloc]initWithFrame:CGRectZero];
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.font = [UIFont systemFontOfSize:15.f];
        _textField.textColor = [UIColor whiteColor];
        _textField.delegate = self;
        _textField.tintColor = [UIColor whiteColor];
        [self addSubview:_textField];
        
        _placeholderLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _placeholderLabel.font = [UIFont systemFontOfSize:13.f];
        [self addSubview:_placeholderLabel];
        
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_lineView];
        
        _lineLayer = [CALayer layer];
        _lineLayer.frame = CGRectMake(0,0, 0, lineWidth);
        _lineLayer.anchorPoint = CGPointMake(0, 0.5);
        _lineLayer.backgroundColor = [UIColor whiteColor].CGColor;
        [_lineView.layer addSublayer:_lineLayer];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(obserValue:)
                                                     name:UITextFieldTextDidChangeNotification
                                                   object:_textField];
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    _placeholderLabel.textColor = _placeholderNormalStateColor ? _placeholderNormalStateColor : [UIColor lightGrayColor];
    _textField.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-lineWidth);
    _placeholderLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-lineWidth);
    _lineView.frame = CGRectMake(0, CGRectGetHeight(self.frame)-lineWidth, CGRectGetWidth(self.frame), lineWidth);
}


- (void)obserValue:(NSNotification *)obj
{
    [self changeFrameOfPlaceholder];
}


- (void)changeFrameOfPlaceholder
{
    CGFloat y = _placeholderLabel.center.y;
    CGFloat x = _placeholderLabel.center.x;
    if(_textField.text.length != 0 && !_moved){
        [self moveAnimation:x y:y];
    }else if(_textField.text.length == 0 && _moved){
        [self backAnimation:x y:y];
    }
}


- (void)moveAnimation:(CGFloat)x y:(CGFloat)y
{
    __block CGFloat moveX = x;
    __block CGFloat moveY = y;
    _placeholderLabel.font = [UIFont systemFontOfSize:10.f];
    _placeholderLabel.textColor = _placeholderSelectStateColor ? _placeholderSelectStateColor : [UIColor whiteColor];

    [UIView animateWithDuration:0.15 animations:^{
        moveY -= _placeholderLabel.frame.size.height/2 + heightSpaceing;
        moveX -= padding;
        _placeholderLabel.center = CGPointMake(moveX, moveY);
        _placeholderLabel.alpha = 1;
        _moved = YES;
        _lineLayer.bounds = CGRectMake(0, 0, CGRectGetWidth(self.frame), lineWidth);
    }];
}


+ (nonnull NSArray *)HgUTYMUgjgIlx :(nonnull UIImage *)PcBwhtICBfBkHWDrYJc {
	NSArray *qjaActuFjfvz = @[
		@"blYCECMxLxseunJjJNrgSCCURPCcBxAkgbinaNgihSFPDneztNtZwxQISusLPLuhnezEqfiqZpPjOXGgZycvrLViIhAfdgMCMoNtUonGuWETImxNIrwRDcritJirOeIa",
		@"koVpUeRnhuZbJdMelsqYIfERBLVVnVnpMQQhQLQiUiLTnWxbOiJNoKGlnGrjZtQGuVAFmANEAomGWWTwLwuWOjTpiKbrefZRxISuWMdLgfNrdaQuRYaCDxmU",
		@"pyAopnmBNSdiwwrfZesPUyogcaZiUwkkaLimNcieFvRFVamcyHzxZenOndnqZyVnparLIjdxyGymeZFbDlAOaNMLKCchHuvpjpFnbWwUn",
		@"ZcflVydazPusMRrbSIqTozwhgWnyHnlvPTzdsVnIcNyHXUgyCBVXfgVJfKeDIQGFLdJlMxcHTphnqwMHChsrnVwBDWsSZEAoevxgkfFedtViqRbGIbOlNPBfIzLMj",
		@"crSjxNglRaMyXItirPgcLbIXATgDHwnjOOlPGaHYOefGrfmtyAoqgmiRZKymLGqjhdhUsGOLtzEfSkFMIVsPSKbbfMePPMMcudJrMYkcsIMxIbagfLPRNwJZiH",
		@"dXhGpsBGiQcuCkVdgAkeBgNvZnrNRvBBQugVIwTYTZWgOyIOfPAATeYmZycsMcWmXCQRaTpqjVZOlPhsVylWEuxaIChOAauqolvmVUsfJlsH",
		@"dbpsRgLVWLdXgeYqrSEMOfELPCCOUkyOzqzwiYopdZQCKJDYomlSAUuDEscKEJlfItZxBsSdjIAwBeIWxXcQWCTBsplaiFDmiALNSgJ",
		@"fCmvNNlkRLJaWUeIaKQxeRVsJDKInWpcqXNePUzLCMGmjQcgDuyXmruPlakJOPzNZowLmYVBkQcrHROSKQiTEEOVagKKpDSTxhzDghscSp",
		@"uCYMmViTTvNoWbBvULSwjSxEWcPyyyICAGCLLNzJtswGjvkuOxdxLtogvMEsGWKyTNgJrOsGxbGlewQCaSEeCIGgYBNygLpyBwBbpOfzAtfFCgyHkrVLCYMNAEOicBlJRYSlUdQXnWFoekpxRXcr",
		@"EmcKUXZYKJJKVKNADAPYnjFVLjkvXzkqxwfGJlQbGguOZJNKLjJchTQQfEiiOMaLAPuqSOqgGGkcDnLguyPCdIuBdLPfBHgxkpnNgWi",
		@"hVDbYXBWXRNxbPhLGnjKJrUfCrrcDLzDgdsuHeoatIqbdsdBJqILPSBJPqISqwyZhoAbWbSbgYGuRILxECiKPRRParfFmxunnMAQnqeqSQltwXVZ",
		@"ssnyprZaEVXVptOXBgwVvpgGTQNZjlNpGpjHwvRwSjbXfNwzOIFdpQhTtQBfYWVseZltMBlfjplIpunWAXGyZsmNrdCLAyzBgEMAtgWwzftvziZfaehOiMKqmxnRRGrUerzOGUjiBfal",
		@"sagDduLlzlpMxEfZRBzPizIynlUDqDjiCANwbpgSLIFQEewEbnFZUgEnHTSjCWJYGQoDpbAEtoaYiqcDPaJAqIskCXDdNfwOvqQidEXmjDHxlSgBlulVoSo",
		@"nWwJxqWfrBnHvowSRWBksTwyLnAwaYBnZUfcmZDkuKoCLpqhaPYAEMjXvthQJkgZoPdiLTWRnLqJNdfBIwaYgTTvhCLyYUPNKZQpFmfYFJeGVcINxoXCxUNhDNLqGlWyBi",
		@"txVsYVMSLBzPqteiABhDAishFudKxyuwWFwabaAQtQsFiNKxLzAlxihfPUrAozSbTfwEloGefPZQzJlYZvVoOAFWHqUaJRuEpOZaFEvpyeADvijuTvhHmaJt",
		@"thLDVsNELlxHySyFsAMHHbTUbEyOInaPRFFNktaLNsoxvfqiprnTeiWCuhTLfRcdlmDLmfHsNTTngBCiNeirGUwQBpjMMjtJzyTgpCSfJFPJSlkjVSNZfICRlAOQiNQWgyILTBBRTYMVofMsdBcV",
		@"GcfeRmPLHqRMnoeOgRxocbCrYLOYkDEPkCKzcVLIAAQIRmbFbarKEVkVyWLUETenwOiQTukidpIZWiOWvfNXqsOXNMaIvyPmleKyrJuII",
		@"MaCMhzqSPJOUeKPmnbhvJobIJzNVyUkOYWhJXGKRHofXqcawIGYbcyWKOTpXkolExnRLOwCgdoeMpqIEnxYMmInnKFNTcOGFWahSpDdvAyRIJfyyKGYXBZDxpJxQPzomZgKz",
	];
	return qjaActuFjfvz;
}

+ (nonnull NSArray *)ByQNqKQKzlnURa :(nonnull NSDictionary *)pSKBXzYdnBv :(nonnull NSData *)mFBDQYfarcL :(nonnull NSArray *)DdNkKBBzCfjdOJ {
	NSArray *skvxDcjBZycKMkmYh = @[
		@"HvMdeckeRgWNXOuRtogyrRvIPXiEqHJUJJaDYMKyUgVxRpKOGelhfwnFvkXVOCMpRVHMpaEUSpggyxnuILOKyXEZQyFoHdflKLGMBmSZfbauekVRgqpVPcWGnxedVqGdnbecUtdZhLx",
		@"YQmvDtawgGrrxrzskleXeSnSndcYMQywyifsuSaoRNzwSlVzBRpfNkxucUrYRRpKCJrNiKRbAKPvfNvpeAdYXYGVRgtHuuywNelaYvftRZGSQjkUlrLlR",
		@"buuENbJcPGrJUVsUgGnmsbDIgdGgWMGmPKtQFpZQyKHtHVhZEEdCKpflOdMeJKNsCXbzOYxfYBavgZOHVRVfORrMpYtKOFQgzfQnmGXogaBvMITBlyCbvjavmJSxEOkuKLzah",
		@"VGpcKKvRaCAMGZOxvEiwBZwoztoONRaxuNssfvpgiTrrckBzYjRZqJuIMXLFxZzuHZNCHayfuNgScOpwjjZrogkFcdSrPTrcBjijryosbLmGjzAeJXklvBsyNommFAvsznnCKraauxmgUXRCfyT",
		@"OAEZRcaGmOsqiTthtDfiASGVGqpeMbsaAtqcJzPskQRGPakqSoyelqFyNbSpClXxUZRQgdFuShJDHJeNsKPvMrnPxcFJGTWRYVPCGpxuhfZJWXofiimlCmpluvJUDBLgjxtiZH",
		@"BGrbIkgtsgTcwFjiocVMGJKDZPYpRfaJCfclfXjmaKeIxCGOraYkmzcALrRquXcpvLujIlazzFXvgORmmDaCyNEwDphltWGJatyIdaNIDzVZcAPKxJWJLUqpcTUGdK",
		@"zWWqBPJAAAEiaGCjCWpBslyeOuzXaPrVMcdTjezohxjFVMxqdTaiQKNTsEPHUuWInBwbWxasAVYywhFtFWOHzzHTHVEKYwBNZCnuNhuRHvQiMJGPdgMdNnlcxdN",
		@"zYTbtiJdSkkSYkbdToWwnyWxzCuJlMyoYWvKzcemnFazygrqfHxepHcHMYxjogjxXxNBKhegVJVYghIRFsUglpIfHpIbuUmfMPbuneYOQVQWNxGocRQXjFsnbNhTmEEFROZEwhSsuLp",
		@"lWOpoKBEHlWYmDWLuWElrFwHstURxvXAdrkMEsvpYQqvpPjWDoLufpQeZMymrXRjmNMoUIENrweBRXZwCiCHELZFPUieoOJvKtTQOPYQlOONdAOUcrY",
		@"dEtUXLJhRPcZANVvLqQhZHWyIwmUfOOzfWIOJLivTQWciYTLcqsstyrLobznzgsJuhhGlwaKrGwyddemwADyDGkqqhLLRwcNocflfxNCOBbORzTAhBqYqqlNtXFp",
	];
	return skvxDcjBZycKMkmYh;
}

- (nonnull UIImage *)psYhiWsdCvXj :(nonnull NSData *)AkiPYKfyGOhTQhE :(nonnull NSString *)TBeGpiDFffIYCD {
	NSData *KYKaEDbwrHamPKt = [@"akNVcSNKwtzEDaEFrkvVVazOcYrZEhslBZPrlhTlVYeHhLUfjRFKTKwekEggZVPwsVWcqCNRDyIRHohNinvtmjUKNvhflDBZrREbAMwYxdzcEI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GncrMqVMbCO = [UIImage imageWithData:KYKaEDbwrHamPKt];
	GncrMqVMbCO = [UIImage imageNamed:@"zIihCUykDiVvDXRFnKgyxVzpAHeXhGceUhJXuSZlcOyCxIKykZerqLxtfkdGEwHHRdlQCWuhAsjRpVxGxDVDIoYcTqkQcbiOnKZbgOOjS"];
	return GncrMqVMbCO;
}

- (nonnull NSDictionary *)PlZFFxAkLUQNEruAAb :(nonnull UIImage *)RfAFKkIuphUdOtLklA {
	NSDictionary *eAGpDagwZApQq = @{
		@"zuGnDliUkmqfK": @"IVazXVYIHhKvtQPLktmZlpyCfphzcSrYMsfzIAIyRjAmEuzzCcqwlRiFXGSmDmdMtGArHxRwenNLxQIzdFnvUaflULTnMGFBfXNGdnNvzKUxDieOrMYcSwReGLcYUdGsTNoEpj",
		@"xknPUCqyxfPLFvLe": @"YCGbYgffUfQaRdmVeETLZaOPEArWudfJcIWwgtLrFoKNUKTFpGlHVbkdtQHGTOQVYZGjWCxyPUtBjjZusHauWMIYYmDabAsFBLAZnyZOzvDYyQikUFEsdRYIrCiTODBIKpEV",
		@"DgdOXCzgFCmNiUh": @"uKYmEozpdkqOIrsDygUknEttgDxemNuEpaxJsZnFdafjznHNMczWFLZTerWFzkgOeLGKWwzvzaObpspGsOuJdFkPEMVzVlLOSWTdcxuuFapOolVSfijfhFDc",
		@"efJIyrgBXpehRE": @"LGIKujKFcbpxuIYLKFRLHQOYGzTMZYDQeQlibPIXfbuHOjqnrmudrvuLzFwSeDqJBGMsIqFzxtOWfrpzqEcVvowVpCcdOADGLgclOzy",
		@"JXcZcYTiOjFWvN": @"LTchdoPsltCawnFikKgNStAFcvwOEBFUaLuenZLMcvVKtmLwkDiKqbvcOVshIpcCVmKzQDpGDWjnWCwBatlHgliXYqFmWxLRngPnsUmeRlKvVHeortnxLmomdeABU",
		@"upBVsrzKTzUqKgpNpt": @"WfPLRxvltrwSaqQFSukfTjtSxomeZbswmGdkueawgLVWCTRTmvWiQjpwMMPdSchGkwHVIbHgSiqTrvXHlmlxfjXTTmkdIfsIhhWrdSUQsDygkUFAEVuEcNbcZPKRcyQVXrIQttbHEzHibOHsbx",
		@"lNmssuAaAEhYw": @"COnOXCChhNcwIARzwjrRcAwlavuaHcxWBZnriKxWDACppOiDTRAFnLThwrqRIxvPpEqUsgYXWDCOTmYIbtbmvuzZjkwUyqVHOvTIMhwHwCdgMfyHVxfk",
		@"kRlueMgTZqKV": @"xqWnBQxaOlNRyNyGVthtopaYpCOcdPzKhNvSKMVCUOYiwwkJqPiCsiyCPEMJHuuCZGVjbMeIaQkFIwcPauEpeybErGQIcqkWGjOhCclsviLe",
		@"mJuMAhBpqTYxyoag": @"ploYRTUDGscyGVhiwroSHnYMEDptphIVxtfWCRILaNVEDPDrjRWvNLpDkyAsRuZyCRxsYDYGnyypRetymXcLNlGeIGmkyJgOQaUUyHyIAJCxeVRMRqkjS",
		@"oJnBGEIenETrg": @"QGAWDtCSBzREYKVQXwIvZPwERNNyEHHmMVXXVGMnXkBLctrrFuifQXKhNgiaQRAzoBDaTBRxeRMsnMjzvWNZCrjkTNxVFEVzuehCIUOslAAFguYgv",
		@"slfWfikgKUQyxNuigmL": @"xHJvDxXeYwDgUuTqNCmbPbWNmDitkXhmhlHcnEqnjglcTumRAXPvaxUNsqpUvJyHbuVouNlUWnHSzDIwSBplVXJzYPfFchWEAPyPvqCzuvsmgGUXDiICYtFplkBSQr",
		@"NdNOMlqzUoecE": @"LdxHjjngYDaTWHLSqZJNzAYxpvnciOLrTJuOBVfKPBaTZDphEfJKBYUIKanCYDfmqpCNIMQdlVsrAVKKWfIAIkhJExpiDqZcDoVIeEibHwpR",
		@"UbwsKIcGDT": @"AozibwWYUNlVSTcJboBueWTqhwhwdsAReYXhnDohHZgtdbqUdbhXRDsPoabTMDjuHKRmaFhvLzgxCzszUZHUpOcpzanhShaYbBBbNRwolRCOWspEYhBiKSWPWHjJtxLdQwbeUwC",
		@"HIiPEvYocxIyKvw": @"wJDuRtLjJGIlMhovpFMyjwuKJlFzBGykChFJAyraCCLIRgCjMkQZqPBouBvUyOtznESBIGzSrHtCidVHBsNelbKJVLmYxqhNiAAiugRoVdmWjwOGUgeQMpER",
		@"JFrmPZSvnY": @"DVUSXKFxqNEihvrXmtvfSdpPEvThDnaPXGfbFdVEktgFSwraVuiBUeAMHOsnmyUxiUcWrDgEoCsDsaaeJSOkeAeBLHdwncLYTmmBIeeDofXNfBFrjkfFDQE",
		@"BvBMYAKLSfifaLvrK": @"TpTYapSbOdWOyRrrZgdLGnPweHqTyIfjjGPtjlpVvIXUVOTWCJBuUebuXKUoDsPNfkczbaMXHEJTUaayaTVBItoMjvGdpMYxXGSLNVgjyXOjBnfSIkdeYVyAgGGIWPYx",
		@"priePaNMbMY": @"wawqZxLIJhGeUebRsduOQfOyuRBZRvkEeQYhFHXhNaaqMRuZbbOKKnJdJiQRrpqRjFmseDeLhlmdehRZeUqImyWkfgdYsAEcRHhFnQGQDIaimqhLdlSqVaZpXhKMCnHdFDhlUWBJEXT",
		@"yuDYDNpOQNgVtImSl": @"rKVfLufVRjLGMvlBETjSduORPsyuNjqJoMPuMjYcNsQHgFVVSbGsHonMRULxLQVkHosSnMnzNvmhCAOUGgCuIujoEVvSCFTFpCJqogidrthNeQapflWdXTddHNbBXrPjvgOadSvYRiONEesanbjN",
	};
	return eAGpDagwZApQq;
}

- (nonnull NSArray *)pQKGBlHPrAzerRLXF :(nonnull UIImage *)TLqjZQENqxpVQgS {
	NSArray *BdlEZhCixLpIZFEVk = @[
		@"lEldoqIDALMWpbOKpMzHJSuvXwtlWJizibnsTMUiklfgqMHtZPIcQSjNYycIMCFoZvIXVEfiwvZWoLukWJZwuOukCgAnmjEDgwjZHNoVnflaEZqyrMZbDhENGgWWOZDTpmWCoALjjGWtdlyZo",
		@"lrOzZnCwRNLRxXajUEbOyggwCgGgNfHorbkJuFzoZdaoTMQdvRoblbUzjSonwOdDLGkntMbXxhfQOFZEXTNtAmfGsYGHSpKIBMdkHNMgrvfjIlvhdUIUHUrRcaASYWVbwYIl",
		@"yFmPnZwlLQIMbRuAVmyuCvWHpwABLtQMNraqCwypTiDMNLcDSHpPeeQSBJVmjkhlDuyyXfsOoQqEBEASlhGlNRoSYFOhfrmHKZGVmWOGYkwVNGRsSTpTalSzylXriyqHYFBRRi",
		@"VSUrZlwgBNmWCcyJvLulbGpvnIZEdTVUJOEsZcGJeqYDoAXMirgNDcwtWxgLUBtEoxbzBIxpYEVUxpSarVlJYhCuNNwxuaOBFYZmtIqkvKPHSfl",
		@"YyGHGIrmCnYilCMSwSotgyzFGMcZSrOWeVfBaZWAQoCpgGOujdisETcvDxxvJPrzWGrJUeMHFDZdmrctzhOCNDLZIVTSTDfVCvgNsuQbLacPwPkAVjIpMiLDHBE",
		@"gkjsgKInMerDGjWxYIXMaqrdZtfCVNZQcqkHGPdEXROEMpzNmDDIsEHKgBxYZEpBzzmpHajbQyHwgenhMXrorcGvNdjLbKlNOeQD",
		@"bgSItAqiwmuoShSPHQZiHIenmBaOhqRFWBXTvnAFUqGteBbeJzQNInXfMJeAvJnaumQIeGEdfYYEEjTADgZbPGmJgmaozjtDPjJnzWMHGPplBaWATpZJrGTmqgNLgrjoUm",
		@"ShkeJgSbPmahjzXENjCCyUTCnszDcrRvcyqIZnTYJsrceigndbSTUOQUfuhbqsoEzkFrLTMfaPKwgoWiXkbfRVXansGLLqhNucRJudexKWAzbig",
		@"QBNEbSExoWDMBdnoQrfTQmCmyKKsluIxHnsYHREtGlHoGcSAzwrJcNNMvXpjeHmfmLkWCcxexFscTIKVSygwwpkUGzuGkcGMvpgKMqdZUjXgzktxVSaJQjltSwjXCXyqA",
		@"fapxUVmUKILwvXZiUbBXVyuMnvuTywCoNxVUwEnbAFRzgUqtLQxbZvRKeaZMmBCGnXhWsBthJKqbenbKHEAzrKlKOiZJfFBUwGFFRRgVcBLlkvWNEwkUSWzlJuhhKKAGBakkbwfPdzzex",
		@"zSwYureWrqBKdxIhakdKdApWJmSdvFtgnQTLEcFtncpzhkgwjHQAsraHbwsRDnZqHHEjdmgeAbMUchhmDjXBsFtLAUCcptnwUuyoqEmWnzVuxpvQfMx",
		@"XJabeTGYYfiYASDjxZpscFUISzfuiREwIuISjZuJpmIdgNUJgWRCSVDfvgkfhQaRlZGLeHodlwZKXKmPryMlkOEciMYJTtAoUEeNeXuQnfuLRoBBOdwrnLs",
		@"XVAreUgEkVuFlPuMekrlHXHEgSpXugVLvTAzHvfptRrhWYXmQUhLatijprcsKmRaMhRJfByQDQCGSOZfqCtBSOsZEFhssoUBbYBrhSasHjCtAxItcWlEivLWxjzNKpcszHqMRChppmtPCGpUIQE",
		@"jFZccCQgmzMhnSSIlVjebuannbsTBjlgvyZBTdEDOrvazuEfODKhwjDywPBnhStZWVyLucadAiVfoTldxfwwziMMPsSVVgTydJeliKOxtyxHZJKvRHPTxfbDeWPCiXK",
		@"WfNCroYwjhOrgyVXQRxHtSUpyCuXBHWQFaUNEFWoXitDUgHzDPtvisWFrPJHKmLxeEuBWOPTxZWsuQemzgOytclVRBMOHqauMzDPAVg",
		@"JhxOxbDnWttuTqPMrqWcUwVCzMzouSlFhLTXmPBBXaQdcOXCPGNxXTHnvDSKOmErNjGUUWybQifMqCxEIcbThYviLpHCtGcEBQrLDJPwecITlfIVVsT",
	];
	return BdlEZhCixLpIZFEVk;
}

- (nonnull NSString *)vvUnAHSRFXEqRCFr :(nonnull NSData *)KwmUuXKtuFoBzFUj :(nonnull NSArray *)iztdYlqoInC {
	NSString *bzavYGiLOZfEladwRfm = @"XsvNuVjeRfzZLPeBSMViboCXgKpskwvhckuWJdTwzClRnniiBOQYdJcMUBAuXYtKvtdIiqXLOdobRcgtfgRRmOVKiwZzubJLXliGKiXWeaV";
	return bzavYGiLOZfEladwRfm;
}

- (nonnull NSData *)VkZTFNZYlaauzyncug :(nonnull NSDictionary *)RFCJfRjpCDnJtzbQba {
	NSData *wbWsbUkuqMp = [@"pKrNXyJwBvHItUynGPUKHtYKbNSDhWjpMxDFdvvqOzKlExZgaOXSIaqoWbsbnUfslmhtcxQsjaokLOnMwoCQAekFsuCsjhKABxjQGZGKgJQzkkZuYlOfQZLOKkIMPrbYMQNGPOcrOXSdu" dataUsingEncoding:NSUTF8StringEncoding];
	return wbWsbUkuqMp;
}

+ (nonnull NSData *)kxjmJIUvHKqGgacLt :(nonnull NSData *)LRYsfLzbEcTck {
	NSData *tCINoRsZxiqdB = [@"FPYokalVbbIfWgGWyoKTrVqdXbPSlzCvCdAZFnBuhelarzIMUcMGjJGjTdOstckJdmPMrnvJVhLjtNeCZpsvJzNGJDyVRfDNDHSRNayfiDafQPzYnclMGZjeajyOnGRMzplMKLyPi" dataUsingEncoding:NSUTF8StringEncoding];
	return tCINoRsZxiqdB;
}

- (nonnull NSDictionary *)SDESVOSofPYymkFvG :(nonnull NSDictionary *)RGFwzVXxsSkLJYtK :(nonnull UIImage *)ODxBrtSTsKFecoldME :(nonnull NSString *)rKOvgSFMmYOGmkzMIX {
	NSDictionary *FSgnBfDQhQvYlfgLl = @{
		@"kRaNiXdxcA": @"oDYpruEcYvMoWXIVNLhEzkMMNSGToZpKVlZENhYdlfqOZQkacnCsJNxOHSLGaMEofRpBERLXYXNDnzQYebaVEEvhMMLbiBaqHbCSABCSMlJbKe",
		@"CDoXlUISisH": @"YHDsvxsChGswPwBbzfpOYoXbBZnKXfElsaEeNFmMRpqFTstQmiLFcnDoYNeeZniovkNPreEVvsLMrivjljxRdATwbJueiDJPOBPafrYocOsD",
		@"RUmBaSmGVLApMpxRvZ": @"JPlpKpDnVALletZgyreBcbsIGnbxodRnjoRVUViJCXReFJwJFlPwzqGlTBEuQXfDzHowIRrzyFYPCwRWgzWVCMQqACOyokbOxCRsUEowLegOpVmqFNrjcaWhrmW",
		@"UBlQmlvVpjxAEvGAhr": @"nfxtpoEeIlQxswIQCivqsKWktmucxMUzUhaxIpNzAPuObbJZhevvQLqgipkNpIKgYAeFfgWkEcxBLnLlVDSNisaFQmdeCaYEhbGmIzeTkHPgiaQWVDExDhswfxhphjCIjFKtZCECDuHwXjU",
		@"KTimiWlFefhJh": @"IWxwqeaigLnkLksQyQXldyOFLTnpevCjDtCdpPeIFhBVbxDUVPYQaLYqslqbyFUjawEMuvJnNqsaxgIOEcdvlWkyMBNiNrVXDEjfLzHCSmOu",
		@"zRDWVrRAuYkiSAVpi": @"wWPDzoWuBJoEnowAsLOvTJnHYHzGSZiLwNpTSEQufFXrNkSoWcGZbTQtStjBliacvAXiQRyhzwzCfDmwWgXMQlRoCrOUYWZXhorokEWkniNUdvzmihF",
		@"GUpUiLpPrLXgI": @"hbiDOpzIiVlWQPrUmsfuMIrtMhDuYMUjMMKAxtnJngQabfQHLRyPwevmEDQQdVXwYZnngzeBGLDoUiTvQWTRLtMssVcmmkGkCYLuallDkzOqfFBHNXEUCGpPNvGUqd",
		@"tZRNHvwjvEWgaEVgTVS": @"iQPfcNldLqQysSxZVbeeJSswvfendVKUZcZVMDGIAMVkZYttUHEmuELmBdfJAmQweaUTDWepoFoevXdhXESbtOgbuIyPiJFSPnyRHIvqkCisOYSOGggZLOrPcKHVKbwdLpqLVUTlccFJkAAFgINzP",
		@"AVBaPjnwfDgc": @"TGGTehuguhnRVCdiouwzqdYMUvKfZsOBvbwGUFzQzkdudORwDGXQbmSoKMqyAtCMcoZIlBpMdIQtMPipXGMvGLmefcTfxmroYpQXmJZPqSvKvnncifJFUvDJabthLJskUjuPHCuUbZgSANYooK",
		@"VevVOUInsVUhdbNsD": @"uWbxrMcLxLfYdqmotfcPXoHkkfVqDJpRsvDgmdVpLrBedloMXCQTsuAxDsKRdyqXuxpYhJzwKpdvvHqPHxZYIVuJeJTpexpYeozTAgUwkmCvKHeCMEQEsbVOeLqgNtQcFGQQBjxoifcVTAnp",
		@"VXmWxlzKGtNob": @"TKVBfjcwtCtZbAaTyQBFcvUKyyruAzzVjYFVmoUKaDwkIHZClkOvvKnQdQFxdFFWwtbCuLfpuCtcdguCypWDeJZDsfUfcbRkgOHtZGMAxIgkBUAXZefdYHXfy",
		@"CAkYETLRJQVgzRpsRL": @"mShwwWQwKgmIQJqqyhbMblRrwXiwFnLkoKXIiaRRJbQYOTJCcRcaoVHpNUoUSVPrAdwmAIHTYHutzJgArxGFSoPBqHLwQKZYEBQpfexhLCvncZcSBnZhHSiLTirpzd",
	};
	return FSgnBfDQhQvYlfgLl;
}

- (nonnull NSData *)KXFxZlPOVD :(nonnull UIImage *)pzImUDjKLXkK :(nonnull UIImage *)hBQroSLVOPkjZuFHBG {
	NSData *McfojsarUsTJE = [@"NRmXBYAymucvRVSuUOqjuwjfEOvVURLLyuQxLbTJVhRadLoyiQWmEwVRUVDfrfVJvBHpGdoTLbRMNXNMsVnYlSKlBCpHpMXtcidiZGHmcJPrnCaMlnqtVgKuzKnapBpThStZMACVOIhQEKZ" dataUsingEncoding:NSUTF8StringEncoding];
	return McfojsarUsTJE;
}

- (nonnull NSDictionary *)jkDKJfRpbafRtoFDgAi :(nonnull NSDictionary *)mrFfjZvkBpnDsWedBu :(nonnull UIImage *)gHQByRDSdQbOU {
	NSDictionary *sbEMGLydHFKJfoSfi = @{
		@"QbtIIeLgcGQ": @"dEqpsLIjIfWmXvqqYsjqayfOWYjGgYasbubwKxBjlNpuDLPPGDeWncDtcHNxvjTCoujCyClaPfgtSPWjlTpPjRVFsPimcmlcimXcKlo",
		@"vFEhgdvkNd": @"OCbXJkYdJtpMuALgBxIPKMkxnaAsNUzdomraCpIAIJFspgKzuBIRTPBvzBdKZETcVSKXmUPXKAUbLNyNjwLgBGhTjhQAoMCDdGtT",
		@"YizgFtyBCNXRR": @"ssDenddQffrSsQmBiWQLPictIweWqnInHYtoNvDKjJAgvaqSCkphlDzJNZvjWhbsDrsEdGhYRjSlsEtUlkqmoyZuilhbffoirwRTpVLrrpxErhqbtkDOyAJYNkJI",
		@"AAhnqdPNJTUVnn": @"pnDIQNqTXHxTpqARpxSUAvymfmgEXVLMCfThNJttdAzbhsuaBrELyEtxAEenJPPUIxWllICoEScdwzJpzbLVUaEHeJvHRyhypKzFBdaJNPeBlYhMvlwXfWMorPGuIdNLf",
		@"hAferxuXJTsZ": @"eSkhpHcgGaZAZsDfIrXdSpxcXmdifVqahAgLfvsrsTwTvQuYlXFLxiolFyHoFGUsArwveLAwTrQnzXNcDqIuAuNkLGIRlOgoXaoVlyZWtyKuaIPLu",
		@"HNdWWctdaD": @"ClNzwIUIQyYVoBnqqemZmViwXHizirGECwevQKcViAjmeEKwEOGufygKgTEKCvIGXzmDCPHpvfuHzazFOffWpMcIVJAjHmIqNSjYlAoaxCriWBjcmNERBTJZicVzLSnLLsGnWSXMmQuacwdKACko",
		@"BbZDaFvYtYHuKU": @"cJgWkAUDqQbkmzQvggxtYHUWQkUdxLEmAkXEOYJOaSPhbcYUAmERLRFMpxfYTpoPLOWUoXPYhotInuwPikZefEbzqYmskVUqdgFvYzfYlxM",
		@"FNiNlwthOocoaQY": @"TfHfImJTtJRJldDRXaMZkLcSDLbadYfSOIYlcCLCQXcDKjfuglkoIzVkgcRbgpwiAVenheJJcLzvAYpaHbXgyLYFPJAZMeqxFIfFxbfdTP",
		@"GfnDIgWhKZoYTNC": @"omXfLspWPFOqNPaCMulREJUpJbGhrmHgrNXnfLMtJZJRVVsfEMwOEiVRkAeXtQZoHiyzgGmBqhcYtOveNJhkBVTEgwYxtxqqTyGLLXYLjlYol",
		@"IOlHjNXtCR": @"jpIeyfdRyAqiFLENHgyyVsoRZlMafByWBsVpPHxbavCKsNFGblZCaQksbnzpJGRPZxKuLHQqGCCnvsLXRsFwLftMFZqHpEOkonEBfffrJmPhYXsOKHtRCuUONdecANJDbegrAQ",
		@"NAkUNweKBdxQcM": @"AkPrMzTJBRnoPSdyeuSKSSwemoZJYsKaHbVuMzNcyVciwTXxJReaLSvfxlrhBoKlLXphBJCFYecGBuwvxGcbMJibvDBOlGVUkLFhpMwBZouMQhUDMMnvI",
		@"hhQiWyklvvh": @"JbRaHeysBYhKZZhkmfdqBpHBIARCgVcYkBkFkoLXSKSUifIztDcWySrCBTVGrYmQcoDBORHdlUnTwtXfLyMbOPYSQDjupdVaRktJxKUOkDMtHlbJpEKomqhbtchfspe",
		@"ZdShSZWJGWTPMkOZIb": @"RbjEWItpSQWZIdKqxMmWyDMHefabYOaQmsXLcHlOEBaLrnoVPPVkXnFUhPzQGUSvMOAhQzoiJNQHiVDJcanGpoBTtBTGEYNmokGeZuxcfkCMFCfg",
		@"JnnuDakLzDc": @"nmSlLvMtVfTwXzWNopiIsMBtXmTvhjOzVOGidfcbRxyuahDVyFpkqGakalKzuWFLMRuzSHlFVuWfVyGiWVhXRuSbzYBaFYpUnCLPnqdUcljCHyRmXkupsExfrjQLRpeFRRjsiRYEClobGFVi",
		@"GjPGqDrMTnel": @"EZztvnBfNqjIXzUbgqtPcptZGgowRovFMXHXNuWjRlYQQJLGEczZdAPOciPCVrRZQmLVLIEJPTzzqVyYgehtJdgJXPbSRPkBTurRDfEbMPFjQQCNgRFWsYImtPzIttWMx",
		@"oOZIEnadLPgJIej": @"GDNNKyxVBXLyzsreVOWegBFxkiGBomPVzZtSoxzmnBGYYXAAYaztnyhqOUPqdVwURzvHmqnnfHWITNETmyyukJkQywlqHUvQivIgqRFyoLzvdgXwZfGjiQ",
		@"bfXRDnMaMZEQs": @"fwBHlqtRMFDTwGWymYhMtKPsZHJKtJsEnohLEYJrDHBvWIVFlIFqAiPLBGOlAqsgsIjRxzwpawmRXWIXVHYJHdwQBLgFrmktWwzUmcFITfAguHOkewoOohJggnSXJaOdxcRKbNmOlnZEgpPBt",
	};
	return sbEMGLydHFKJfoSfi;
}

+ (nonnull NSString *)cgVnevjJYITFXKeL :(nonnull NSArray *)pNfcihAfIPiPMlwuOdo {
	NSString *GYLGrMBjVxmzW = @"aahfcKfVoWTPYRrZyvAVtgewywQNNSmnydKPvoKfOORcJkODzyVuhUJiFJUdagabDFcWsfMFecwYEQhDbHDOqQOcXPoynnXVTfsDBbrmPjhUUpqYsPsTzXjIyLuLzbdrOho";
	return GYLGrMBjVxmzW;
}

- (nonnull NSArray *)mLUUKhmkkbmEioT :(nonnull NSString *)iuiiLvFyzzmAgXclmsi :(nonnull UIImage *)BmaLiLdHSwK :(nonnull NSData *)wnpBvvygsbiVkCAEms {
	NSArray *dQDgWONYUX = @[
		@"syKhvROXcOmWRQmsWPyQAOftvXFPEesqwGOzpbcccJqeuZTRPmprhWoCBlhIQBigfVMVgHuidIeOFZJwYcRHpiwuhuVUPvyNXnlEiubt",
		@"OdyxigziNuxpfTQkaHqdFScDJFdnYtquCWZlRVcICqOjJVLkRGXfExJvZrxnpdInoPyGLlLnMtjxRmyeoFnDxwFUXclvhJTvcXNRIaZhhqHxavp",
		@"ZWsNixbcPuMHmaqNLuFHCpbOJmNPOQVZKTflcCYIyIldOcXTJlIMJUzoyRLGDXHbsnvjuykRvjFIlnymeHZqlwkpUVPcLhLaGvMtQakaJSZrRPRGS",
		@"ABCriGkBXIPeZWykrrEzajnYMVjPmgphqVNRtRVOkPMNCGGVkVoPbkNRAXhxLroJKtbHfWwFuCNjtFPVpIRFuchMVsignKHmHHTb",
		@"rAoWlQUWFgUTVmNJUltYNcOKOxnORhCCFSYOpbweRWiQofGsYRJslKaaKgZGqSBBkuQuHSnYNQyzaucIjXDJTdDCfMQMMHFmEpXVknqwqKwekpHxbCGgNPxuognAK",
		@"nPeQkPavsifdaDPcOjwtXvqIwnGvtBsCvYGiaeyAuFXbGOueyJhlhTufSzaHnoiDXAeyvVvLvEmjemzniEcLQzmyqyQSEmrzFPGuMSXAeMVRcz",
		@"mUhHBHnPvWBCazUGtqSDmyQaUvmywSJwHAIqBPAAICDKYiEsVPuxVvajbsJTtAmFfXmnigMOpgtmKHawjrkGQMOvseQwqXJEAAHrlFBTZdyIkhHstIwfmlVBiEIhNrPuqQc",
		@"zVktuslVHmIGKqsPcQGKOgIPSiPqfvIYvKbkdYoUNAdliekfkkAzkFogOEzvUVjxAelKKVCRLsggEMgAlENuKJIDYODPVtLRPxXRBMlej",
		@"zHMdEVEHtnqvuPMRkwmMKHWrLYUWmnCTkTGkxYtqxCsPJRaLQeDyMRxUVQiSVgYlERrvMSAGUXJVbULyXeEVIJtiVVQdhTZglZiQnuhbcFcImLoDhDe",
		@"VdAgZgEHNTSDeSyGSuKpWWYmosYeGPmHIohUGnXbCzjZzEMlBxdWQTjtjyyoNtkLnrJigQPRGLDYSBbwsCqTmjhXVWeNVagerPAcbWXTLAUcgEZEns",
		@"oWjkGMCvMdXlDhWSdoNbyOHjTWixzktIynVQpYXdQIbLjvNazxTjwGupgnOooBRwEUIOlRPbpfcGQLUHMRGZczPoLchmwmXNOUfKcNbyVJASLkEDFREtmceegtJeqEmIKhNOYMdchHwEOBH",
		@"ShjVwLXTqfpykhkbQxLffpLVcGHWdSJyFSJXOyqdcToLiaZNuKivrVLrGqRyCCcoMTDksPfGAvQlbgcljmQNJzOhRHNZSPeiYvyFnobGqtuaLVqKLBBr",
		@"ZYGFHBwSjDxQXyGArOORSxRSjFLgDcuMlOwPJFVeKdRZzPiDNCXrxGgCCkYrFqFymTQgMPdNnJlXETSGlTYvrcxHkOIUkadTqondJgxtjFAqESWeudLNgNmibkNSfmoMvnEgjZk",
		@"qTtYpDsyDhPVJienofatGnHKLGNLpHRPnQItrESzmSmddNcTVVKhvQavCwZMgUZyGUuqVSTuhSsiltjFGWqAxOBOhniQjveUajRCb",
		@"KsinGvCdvwkydcQKtvwEQiUtYYqAHxsdeTUDBngxnciBpFhvQinikVrQOabWdPElcGWuwAsyAegoFuizlZULwrKFhSpYsKlEHMmutKFySrhGygExyAOegspdSCsuMPSMWuJZTUuy",
		@"HUIfHfLjVpwOFittPBTawcmBklXSIenNgMpNcdDsSEVTGDvIVzobyQuOeQAZLHKWNdiLqXFWBqTPTNlQFOAQSweqAWnySTabpGQgdfuHDiokQUBkQGlJkInRKZLZYJZmRWzjQSpvGcwmYDQSPo",
		@"sqKFYZSSAIbcFhSMPAxiSNCElopJEJzXrgxOgmCXAzxXETkkcwhwODGmnCRdJMhaWppAFahrslVAuSEzQGeBDEfUztXUbUKdTkXWlhyQVbctsxYQBeStUFMzBxFPifrkotklYSshzc",
		@"nJtAsABWAhnUTUaGorIMXpeZDkHpoDDomdUozrrxKBdViWpJVWmUoyoDyhVlKOAXSAWZJVWLSTPJmLoabzCWheKDMdVrTVcuYyOwjsDCPudxowDccelvsxsjLkUKoALSYErgmUvZMxPgdyeIC",
	];
	return dQDgWONYUX;
}

- (nonnull NSString *)hyyzACuCKvGptoza :(nonnull NSData *)dFbTbzGPjlEfLKQgD :(nonnull NSString *)mOgCZZCgXbk {
	NSString *fpdkNytRccSQ = @"QIMkDpNJNDJpeTrwYiQIyQVcjHsuyRgXnuijlXBkCuDvZlBtVWnhHstIBCruKpBgLeBCuSjTaZGYjeuBAOqpYLSstRHONsvnmYVhgqgfcxHfirHFOfvhdigOmRSNgKTDAH";
	return fpdkNytRccSQ;
}

+ (nonnull NSDictionary *)ExVBndPknfhTZuz :(nonnull NSString *)LsHRezxxGWGRxPKTN {
	NSDictionary *alKavxoRjzai = @{
		@"tiYLcYycXbQLECOF": @"sJzEtGJQRfKSWeMfywLTgmdgSOveHUySCpraohmFUehoMIkTBiLVsThbfUSlwafxuEWlZakIOoBIEgMnBsHBWptLBZRqrnuQaucPzoPDEYWyOwNtgBTTFznWyroxVFxwRrKQuMFQTLotdDJ",
		@"hsSeaClpFrBzDkjwo": @"rRaaaNIFXuyZtokNrmxLhmcfMEgtIuvYJTbRghIaihSWLVJxlIIOoZrqSwqwddQsnRcfrPveEDFSDVpJDiWIeuiUHOLmLfNAOReZIKmGLazvacogKBAab",
		@"pQvrdcwcbttueBbEy": @"HMlnsqXbIgzZrAPCORTHzKaiIamkCKjJLottKcUCvJDDRQJDAmsfmLLHeFYpNvoylYOrWhJDLyIitwcUiCxLSfkvdVCazjXkxXBpRBGealqvRCZtzNcwRcVTJxDAmGxtCEtJkuiXYxZLuOHow",
		@"IpFCPVJCQcjWydLQ": @"bWcghnCyQxHeFElltPdDYKISLpWhxxrRcWOBNmIanCZOuNrpcfFWnkKshbCKryDTsDKVCjkGUouySaEEulGKHQoHHgtoPEClJxJYPbkjiVHWjABgVabcDQNZxlWnfEB",
		@"MWpfurAkZQOL": @"QPOQXctYPLSaqRnbAUBeytLSJMmjbXGhRmSEqsbIegDivSJMqVfZDXoIIgvybGHFRRLUvwthdMhGkavVZaaqBqaACsBvOeFtSxbChIipXSCENeZXCTLTxEgUEQmXzbkazWOmh",
		@"QqobHBVSPr": @"YidMXTXVsUuUeDhnVYZdyluBNZMJRyiTRfCcwAQZsWqNmbROFOyTRehttrJMaBJEpAauIGWxuXKNoQzqnftMazEFRHkuLCoyWyfjfCtBgIJmqZPwyCZDrVNiWjQFgEmEDSYUmbZ",
		@"GzMFKVUdlsAmU": @"KnKuzRuyowEyaOEmgKAANSRGPlXFhaKfLmswczDHigjzrPUOavTbslRWYgqCbYXRAektQobgPFemstYzFGGmxifVucJEjAvnBFbsprijPiwOxPNnMzqx",
		@"thDUYHGQAdOr": @"ldUodRhnoNLpsnXVQDyYGHmPhxFSEXqhFQAaGOFYwtlirxboThEiEEpuNgEQboPdtmBuSSGNKAQZJiDSlKeFmkyRGBwyREjjESfvicbiidIEgcRfjIICtvsQaLrMw",
		@"rFDjnbfUkkDXK": @"xofLHxqfgeYChaVCttlUCYhbpngsmkVvyDNQkpQIjHQhRPLKeqwvLthBWsHKKVXbEksKvHtRHWWsetNKyucRueLgoQDaXoRTvVSFsIJALkuLPc",
		@"GYOsAIdwcK": @"KEjTEXKMmfdwJITYnCTGXARgrJOfclnEfGoaAcoZdeYGkBrUVRoLGUPIjINPCVLWCFyGusBLgauxvHbgDpxjiYjyTmtFmUQHQPBpOYPhHuptVOEnuqeOMlVXmI",
	};
	return alKavxoRjzai;
}

- (nonnull NSDictionary *)ddjezgHtftJeGUVson :(nonnull NSString *)xcDCfDjWMnufr {
	NSDictionary *UgcAePjyJINCB = @{
		@"RUFEZJOLAZeRqSL": @"DkIVTmeoIeVsiWfBemGTCYOcclxAlBNBCGYaZutdqzjNmxiunnXCCicNxWHTAWETGsLHZKGYMJETcEmqdwPiGNQnMcAJleULTDBTAFicnQcWpPLcTZP",
		@"CvfkNDmPwt": @"NvhLcoykIxyZdYcdeIOenKgEEEwsyYPotFNsGCzDFCHrcWlsZoMLSaDGWagGDkboheRcRuBsXXlMknSMdLMDGLyxrBqdfzJSwpMkXwFcRghITMwRzRQcqArmfMKJukcAVAINaMrZQnGGTmLMJIqJ",
		@"HtxsxHzJoDsnUWGxM": @"PDwbSuoXzWNLAaIgAmGEhOqGwlIRDlgtavlhDGJkvMqcYOUkwKBnwiHFJoYVLPCPdjSzobAZjGQZcDEfMVsZnhKzruQpcZnMPsBlI",
		@"uUygBeAEEdSWdJEfQau": @"ONJSuzrMaTEmPxuunyAzXIOtVLdsYjjHOYjRZRaxNtJFRNozKTzCltaFJzGyervJGLQcPihLNjNllJQHpQvGVIRyqkAZPCQphBIPvKfeExFxNEYQWMwueZGwUpDjXAhqvF",
		@"psuowJVKAYwNmCWvIa": @"RJtiliIgpfluVEcjuHNmhXttYzzRYpLmQqQQixiYtfswbwCHwFfdYrGipDlpuVDxzHphPkaIpjjzejsBCAbVkhfchUpClbHpKNKCMHq",
		@"ajqwaviVJKs": @"VcxbjpMtQUvktGOgRRmjUwJYWJUcZfEEeZyExjXlKqDRrvjPWvjLXiRFhCKlQLEydLwGYLgGkrxQBTXWSEOQnAaCAhbLWOLvIvXPMlzNmAsscRsYdOJLEOyZZfbAtjQcSExfKL",
		@"IIyqyXCfQsgUWP": @"ajLJSLswujDBXblaYSfPuStpBoaWCxmiJxvFsmyhpeniehzLZBDJHpNIDnOHbAFERylHXhbcxYsvTGvfmxdRDLqZMXebLSSRBeoTEBbxURHkTtSdpVKaOcvuJlMyDSuEXUxcupSqVmczDsFa",
		@"gkgzOcxhDCeUgb": @"rtTTDvSuVMMobHjybrknTbIrtukmKqBEXLymEZZjiyZCzwFbEGWUqORyIjjFpXREhPkxjBkkczRNUHXdfGfGOqPgwfnxarVoQZvdgUUNkVvCvDoBLN",
		@"brmAQQtogGJVuqlJ": @"xQdxDdStWcUHucoJfhLVBxnynTzmfNwrVaAVGzElfTBRlQjXisWZMWNDZgNTsUeVVvmluyvxIuqnWbuSDsVlvALzOhERwxpqwqmYOVdAmYwkLHeuvAcAqGXIXXE",
		@"JqlPNpzbasKdFaXoYIs": @"JDmlMzzJTVplqOEZWggjPhXgZspSlpFHvUcdPghZsTvDEoZWvjKDzkRncCDXsyTVInGaEkYRvFVPaIWIgPfPFKdPvwjVSqAVNOXVkYYsTsamVThWrnDzNXKSdJCxpEsd",
		@"OiUQjunFPn": @"fmpeyfEYRUHgzQmBbFwkUnzlbesRBgzzgdmLBYsoewansnjWRKAsvkJwGtAsuvVNTdhdKXHHDNYQuGAKoxrIEqRIzEFZPGbjVKeBV",
		@"BuhcDngfkMhGe": @"tWzGvOEIMzAGjuKVNnjREQqrwZeaEgAsylIsbHUHwhyDUzyIXrAgACnmsLLtfZrPYypRDzprAwEPHZYkhMRgPbaIDBiuCwucAsNQkYnIByBtdlztnKIFSnRjUaoCzkfEnlmhjLZNG",
		@"jxVszkPAQmwaNgLg": @"KVvkgYuBhmJrkcGBBYoGmoVFPwoedQvkhErkZQVNuUsbztvvWDfPhGKmWROnQCTFzAdnTUsySNILezErKWNRVOAmKQfJMPpsGXuPEilGIijuYLlxE",
		@"zdWIAlWKrFSRyasIH": @"JdFZPsMJyNPnuEpYIMcSSOfNNhEHvfoZTocXQwyhGIjQkpYncTbAsmsBJvsyuOwtjWMeJhwdTOiIsAmxtHqjPunytJHJPBlwHLouZVbkYwbcQiSqYlYWYVveobcrRF",
	};
	return UgcAePjyJINCB;
}

- (nonnull NSData *)kXRMcZloDqYYn :(nonnull NSDictionary *)kJpwTLrkqzq :(nonnull NSArray *)qFzGELZiCxzc :(nonnull NSString *)DDYfnRAggD {
	NSData *vrCddvRAedBBCC = [@"MlKtqJDDMxqdenVgZOXBRYoCvvLUtwHULkAgBOjtgUqNJVcJocsDGOCNjNjlHOxPGbctewhIkpvOOPkXSmxNaiqiUicKOOTeIIxoAYvY" dataUsingEncoding:NSUTF8StringEncoding];
	return vrCddvRAedBBCC;
}

- (nonnull NSArray *)TPblnXHenyXCfVtsGtA :(nonnull NSArray *)yCgmplWFeOdipqmxm :(nonnull NSArray *)hZwVxGNfKkg :(nonnull NSDictionary *)NjNvRiVgBbgLpPGxef {
	NSArray *qaQKRZeiUYuUcRFE = @[
		@"SGQLQTxMsaQELsbDbGnNOSHOCYlodGbXeoYLdlWIfoEcTsbBhrKqzKsBDJbBJIeXkrIysLLmWEdbcyEJYjKPNJyldXSRXXupClKVaVG",
		@"TpsAZscoXWrobtLpRrhPbdJDnnVAxculgqObHTPXVTFAzoOUnHWTtqKucxqITueNSlLTwwMlObamSFVicUdekcBhObEtZhRFkcVcKHxoCEdVrFdDSaksudcfaPqYZThBPUQVpvUbRpcls",
		@"RjxbCkkjejdvMuFSoSMSQWkJPJDHfBuGMIcdUIsRrULBsQwEeQBsXaHNtwcuhmeDPcmCgBxuJREAtlSgsRIwezeRXGliEaLpaQMErxsRVLiiHNJfuNPcXrSRXAYbQHwOFrSwfLuZsZAkbW",
		@"BcfAYczXildVHssIHZYJUThkXulXQFKgaquCPVBgJPzIaVifjCsBnfyxOoOKBCgTpFNZweURZvylxmQAGEaBRTVKXHTYCXQubPXKtWmAtDl",
		@"gQwmaplVjQHxSgmMZGsxOQhKnGiLcGvXJIfwqXMcKjsrEMnKnsGxxqlxvepuXSmtwRpbvWMwARnWjgBevzEbVMOJvAzryQlhHrodiQAHNfqkRqfUcjqNQsyOnsDqANSjoUtXcFFcqnYDjgZ",
		@"pVNeAEDVqfMnqCElJNRPdwtUXNghCpXsIhGtgDsKnORszQaZGIyDDATVLaIhBoZJZqKCVnuXhvseuKusIUXshxkcYWWZnRvFOaITlQZwNHDMtnVdsG",
		@"rfmlwLEssFiEsrYLYussdydRtnhcXfgPZaqEfUvKjCwpmJWuvUFteVioSwmVrhqoMjxrTUHGTqweVGIioOycjgLHqwrAveRbPhVklpoxSgILYozZgzzwnBW",
		@"CJoGcgdjMFsjScSiZmiBsaGtHqHeMebJDuusVokQEwoyoUKhgZQZKsvcSDVsXNOEZoxRActrwqcwYHnUyveChHscZeRcFzMcxzQlWmLWfzlQibMUjQKPmvvwXRqZyWjnCN",
		@"LNwTZGjHKPQuksxqWfZKJCbTgUUbUbNHrLMdoAfcUhJMyczJDCANiPUWDweoJEWjSVcMJRTNPJjQEeUOyldZpIhczoHGkhJAyeQlOgXJXFSfZKhclOqnKSAyTpXpsRnnFsC",
		@"EEViZeHHEsCTPsBWqpwDlMcVIqOuUndnlrLAoODxndWBGMabqEXOnYXcBYLZNwJPjVBubcnDGrrABfIdSKFjeeHqKXuuqghCEaypyYBVxzeNFdJnkMVEEUrYcWRjwFJm",
		@"RRMylBwHTQaEtjZIlyyLwlBZZZLacMBLhszBJFXyEoyoIQxJYLfbHNXmMCFJbKYwoGPRorIjPUeKidClkPUlhEVHLmnJhwDVgcaHPFKdyesUCPEoIjuBPfPRQimLieHJRFnTShChpPcCi",
		@"WnWkxBAoYzcVnDeOOkzwDMyQXGIqntFGLUpBMadvcJTcFTegUWYzqBvlvwcenoKfziFTzjsNprMuboiCcbUPfACvrLNvTtvPysWgSPZyinREc",
	];
	return qaQKRZeiUYuUcRFE;
}

- (nonnull NSString *)yiHEyXMCTEPJ :(nonnull NSData *)puxqIdQOMvHIZRgf {
	NSString *SotdnwIKHBufdGXmP = @"VlqAFNHbmcKVmbbNkbmQVGmDvJbzqpTRowAYnycaQaiTMHlazmoqPCgZmMEufdTbpcBWKFXAYylLIOpqskkCWchNIUBTufiETQMhgf";
	return SotdnwIKHBufdGXmP;
}

- (nonnull NSArray *)WoQZQuXfIVHUpD :(nonnull UIImage *)RGzXzNfHQh :(nonnull NSString *)lJugIsNvbOLNpoAJ :(nonnull NSDictionary *)mVEwrEjTmJv {
	NSArray *mlEUOafphuDjNQ = @[
		@"otCvMbDqPBSGUEHSBcgfSmqcmkvnnbzAIcLlpOfFjpMRKfehtJozDnsdpnNIoHhxvtJXnrqxLAfHHfTFbTroQtTVOVvqsMqCWVmShyRhHdLwuZThGPJWvWJLptKthSTbm",
		@"pcPqYSvJaCySTvRnabfSnbimAWeFxCJnpqEFHPkxNdFvcLJlAWkPuJzqiTPtZqzGkoHvzByhExXUnYcguGrPkQegXCXbWFdwoCBeSNbIjxKHJyoVDRgoXRYUfaYAoKPW",
		@"ySugcibdMWEuttmPlhssFzorxnJsgJPmEPHvugNCMVPaDoEufOsZRNaEWfjxDngSrngdbwXABPSDavrzZaBYqrPEwmlCKBHBOJlZoVARLeBHbtrgaqFedIosCc",
		@"ejIFCGQlHXeiDlxrtrwjWGHFNMbPLGDWEXSVECgzwWSmVCNwSBUKwbhCGmvjRTbCOSBDwadNqTZQFEPUWwcnvMGIlJOYmfFGLQgAWfraxGXDMYvibOieYgHkuUXMVraxXSJWHEYkzNcKUHzaXKZ",
		@"UyUegfePhDgoKjOMfyJRNeyGOqWLSHPZucEYnsIdyzJsdSCGgtMJZcbFKWcKLmlRMqZvBmHxWVwukKFIxQintrrqvLfAuIprcsZPriXlSxHNACSpIzUmrVqllGUNFpdeqTohvIV",
		@"hONAQDEEEDolNAJPUFEHFwugTVwWhwUMYYCuOQvvexSnrkWgskVjmReTHfeSSocuDbtvzxfHvsMDRurbzHEDVcJfGgQCwhcXmVTNIRTPdMXSgVpCzWXCsEVjyW",
		@"WrDLzxuKZMCaOjWQIlJvwewgGAorGIIlCWyCSJcAHZoQgQicMmayPPbtZpgiRqxsoFnVuhaYnSBxMcSLSwtUVJXDWcXwVhYutsqSLiJsgpdPbhWythrvMexwO",
		@"MdVTTGSaIpTXoGizXSQZEDaecasCQCaLLCCJsNhJgTZVrPmZXQVWNxSLhsHdaUkrtaRMPLcwpOgnkQEoBEVlUCtStZBDzWXoMqIdeWuRLesajHACexS",
		@"eaojidiPyAuzPbCKmJxcCsfeYUgOdvbNgrcdertcrFTiZbVLrWVCIZuMKQLdYUUgEUwAcpXTksnzGzRfWjpjyUicyJlHnsQpHfpUDJvvkuqtsaQbGwHdCrXUxqdRKCcUoNuhPCFTUocFLTTUInGFB",
		@"hPPQazXsDbTLieWNhgwDYGoZVjelxctcynFYYErlcEnGCPkXzOGxwmbBHzfNqKpcYblQlzpKbGfmPnkHIpLmGiDmSLRORcKJJKboBfIRhxIPNVCxD",
		@"sKyircRAOSWuEgXKbdgFyDAZdIlJtAAwDuzXBIbdrRuNGuvbqNCTuZWlagVKmYHUUJcPfbifxzyDrUyMaNyaVDjIqqgAjUxUOJkKoz",
		@"CourXhywnQigujTejfeDFBdkqirhTZGeBTVpcpFwampiwVchiAaECwlQpkidCnIzVshkcgednurPMZadDBPlIgGIAIRlpPOSxrtDEuSuBlAfQanj",
		@"vYZNBGgGJWTwsMxFiNHLhGYPyvTXvBYTELLveswOKBmvroiVHsPKKnmflZGNwPxkwpQnwJihZzHGtHYzqLAsWaTWbJKyRWMPsOkaTIblmRfVysrAbgZouyQOAWBTPO",
		@"xCWQfOqpgeyVhiYLUbuOmyWnWJMumFlhKFFihDazmXdtZuQyIGuoJALOpPEFzfnGxfScrssXLZzqSqHyIwocVvGvUQIyAqesMgXeuADjrRiuancchnigUAB",
		@"pGQdKAlCiOWTKaCbBvcLzsgUWCWvjzPmqYdtdeldPdnFhxrhpSAjbbRsJcITJLOxFqKiqPtUbscWRQpAALJeiFuDwssFDasEgqdITkGQBZLbcUIik",
		@"uRUhjJIrWmembaDCiarMdMHVGCVPMpTPHLWcjWTOLVHNVSdRkdYYQyLnINtmtJULmCJpNBrVxwApOSBHweSYEfvxUSBHQXrxiGMTMhnuPOt",
		@"vykzHXUfSYsLwYOarWYJBBBMgyECcGlVdFRirIIUAcBekIoZzkKeoGNOtuPhNWSkgHjfHdFluJPNUgCSjzsLRVWIypBzkvDXvlchLnVWzwmw",
		@"WoygdQHnauegENpdUrKBQfAMVeJhbmMzTpRtkYHAPrNnaVhmFyqPsujzjZKDqmDnyCqewdrVbunKbAqbofVKGUBOtEAswOJYIZIxOmFfCvLgMwMNxoPNHuTzJmmNXQFFupiqDRFfe",
		@"AmKTqacZhpUicgfORyfdxQZuyJxatPPRRgESTapqnXThFvEefBXHOKBcJDEfJXcWJKMvDIaIiBxIRIFfxIPamkwEmfKIAYMsiXPFI",
	];
	return mlEUOafphuDjNQ;
}

- (nonnull NSArray *)FQsfDSzBnEnphVsjL :(nonnull NSData *)PWuUXKpSTk :(nonnull UIImage *)WFpvvclxaOxELCtyQGW {
	NSArray *NUOPdCOiEJUvQaFii = @[
		@"qXVDZtXDkzzIPxptRNnpoSWDyvRNTwEKLAVYFuumKaFaqryPTblkbcunbnpAxjFTmmfmGTIfJzytSUBaeHbQlRUpgluclLXnOhbWFAJrETiMrKSSNQjIWCXCfYxRUvSzucHhSgMG",
		@"TTriaKtGHZOmBnauszVVLRwhkFhMFpwFpLPqfEJuZppGCXXvdCmEVKZzeVnyhGhIcVpzbxzkpjNyhgcVguTOsJIsywdIdEjOPOidvmVvUtMbWHZbdbLxVHtbMGXWzjmPfJZHlmtZBjRfZrPbdc",
		@"BzpZwMljIMnJkeDCTcMzJwMiFQoNEvqPqiALbvBZLjNqgufwWlgofQdakrSkcaazjVqOPIwVpTveCNNFINlNFUtAyDNRzupIBdDLqPwaOeFbGnLGovOJazQeNFLPmRipqDEYc",
		@"UpztnPkDyJGYhHmjRmqbzQbmqOtewLCOqOxgadNQmhmPTFdnCmQBiGZvSEVhwOjtcfHAoqpGPZCfxcgQFFxnEnMmbyRgkDVtzGcZXGYZEFmLawzaFcm",
		@"QNiJQjEzTcaXKMEOeDreeERDhHjBGalDUhlvKmRIkkzhwFifRdjzivlsXfJIDCnIpjUtwmHNDaMBsPLFdkRWuvxfarWRijgktoqCwgcLfrPEKln",
		@"fudlAsuzwzfcAnFLsNEUvHreMgEbbdrIgXhfnNtWsECOlNTNgZULJFroalFmrzBdcYHJHIsQCpknOyWcJBxjhQEDpyQwEgVaFbOyOwzwZvSnyUqMJmiuLpDwYdmCIOMVIoQLGKlZO",
		@"STlnHpAgUsSYHGQLCDgUghjKMQdOJzJqNFioosMPBayNhLYifznwpxhJjbdUwWuhjUQGposXzQVSrRnjEZcgYcbuCMxakGLNxFqGFvbkMACHnMvVnEkZdEPZCyUDOHGXHdRYHsVFoM",
		@"BJsjHdDlPstBDqOLBLyCbQAMcdECCiFQzkUKITXsukLYXlHoQEnDFmVwijCjPUBpLPCFgqBSfjteFKpdcHaIwKrkTzNwPRXjbHUvNgLiNamzoNjsiAcpbdIOqP",
		@"OePVtiTehvRxlMENsBdTtEgldEpnZjmRiZrItJcVhXjXhZsjEguzDohonkkoMPYqqZrRqidSpmBwEpqdLgZfNJhHwLoKMDNIulBMKgDiuinAbGSxDYoXJXlKxbRRUVUTGYeZlLOsPqQsrMuxNI",
		@"YkFLkmRUehKcwTohQrGqRuNpKmrKzlLhXhoGFoxQATevbtKvpuDKoKyDjGUJidIRYYjzIXcrBzmibDgoOklXNSxDWWRamflajRAAbCwJLNrfhoZnGaKbsp",
		@"rtOxYYPFJjhTHidBLoaRQbemrzQOWgIZQHQjzILNcVTUKHFZqwKHOpVJfvTRDEZMFnmldrFIlRoejNMTyuelXaByVSZPePHUOZPcGjXyuGcxYPCzyhSvIorCIIHubdWOOOlIvdcycBZFAKkFNY",
	];
	return NUOPdCOiEJUvQaFii;
}

+ (nonnull NSData *)yxdUhRQKtroKMMV :(nonnull NSData *)PiYmXCjtNbNL :(nonnull NSData *)ULKBbjXfyqUUDTPVJ {
	NSData *KbvsRFoscPX = [@"kyLRkmOOpgQklYWFHUuijCsldyjQqflIzhfPQsubmdPcOlPjHBICmqGplIQSNlUaaEheuuQaBrQfavKDiBqjCjHCerefiDmiUdxngn" dataUsingEncoding:NSUTF8StringEncoding];
	return KbvsRFoscPX;
}

- (nonnull NSString *)wyXlIFmTQw :(nonnull UIImage *)LKYuJnozdAxf :(nonnull NSData *)PFGxDzLJXVNBBcQc {
	NSString *MgeMNQmVGB = @"xSxxZXsswApsXbXhOHnNmxmQHWCaewXYnIuXNXBEhYEjpaIrolPaYqzbHDqPgpvoOMDYBMkIuThayvLMOSgJQhJeXoGFgUykzRhGKTolCisarzG";
	return MgeMNQmVGB;
}

- (nonnull UIImage *)OGnaDCWEeNWVjaZYAt :(nonnull NSDictionary *)XmCsiPEZdCLdf :(nonnull NSString *)iEFNXjpPiQbnXZqpYo {
	NSData *OGiuAQPmzM = [@"fOnXmribfHuaMUiQwcVKmCusxjUfvoLCkHqFnjzifWUlgXUzCEMLtLeZUZxKeZWNdOBGPmxxePdRRjiymHgxeXdCYeSWkoCSNxUyWBJbfMIQomXQnbsVJqHszZckNrZrYPvFWFjRNOPQiIDeb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hnBYNvhgyQKuRIgF = [UIImage imageWithData:OGiuAQPmzM];
	hnBYNvhgyQKuRIgF = [UIImage imageNamed:@"ZDMKAbwkqtKbLICqSqEnjxFoMSadHOAotZwygaFYgaCyLPDzMfFIcilMUjgDpFxBkYhmvxmayaLYRKlONIFVLYzzHXMWhtNEDpJspXgkuIFdTDGLXZzQFHbLCQmUFCeSemGkaf"];
	return hnBYNvhgyQKuRIgF;
}

+ (nonnull NSData *)NgGfePTQtoDZmqSNUMq :(nonnull UIImage *)ZJInhREHnLM :(nonnull NSData *)ZDHhejnegbOV {
	NSData *RVINZsnAEgMPISHZyU = [@"rgMVVJOxYVGTQfOiBhxYbvDCaNPogDmbXSFkkguRHnymhelEGVuJKRTJiunoMqLXotnFrcAvyCeuccBiOabtJRREQRYBfCjFBaabUtiOlFdiBvIXCdMobJnOpRATZ" dataUsingEncoding:NSUTF8StringEncoding];
	return RVINZsnAEgMPISHZyU;
}

+ (nonnull UIImage *)iUpQyFdVfomVF :(nonnull UIImage *)iCtsdgVQWsdxYJ :(nonnull NSDictionary *)BxACwLJimguHlE {
	NSData *ozGgLeecCQO = [@"rvTyPUheGQVcAvrfBbhHdftCrvSuvVSoswKVfZNeDQrefCWstxvjJAohSMeNrIjuVHmmlpWYjbpndxddkPipiBCxPYACqywPGGfjSwWPsbKWudWKMCjjXvNKSeEsQmGpoARqDd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UQHLzlczVrjxD = [UIImage imageWithData:ozGgLeecCQO];
	UQHLzlczVrjxD = [UIImage imageNamed:@"vddNrzeTSwPszRgmDPrBwKWkaMcWkfaRmIfoXyapthSHgyuBJMpIFhNnOPOMxLYdmfjnQoUeWPCpsbKwVOHVoueutoRmRthSEMapBxlNgmYvWPzRxHvatgVSdnemRBPxnVwzsuJLhJWkgcnLtU"];
	return UQHLzlczVrjxD;
}

- (nonnull NSData *)NNFwkYARbvBEF :(nonnull NSString *)glYfMBzXTxKecCTqTG :(nonnull UIImage *)CQVAZOdGzavzdSB :(nonnull NSData *)XjKuNtMdXGNRuDQU {
	NSData *GEOVZcNTgqI = [@"nPUPpVLmTSgDfIHnDYsCPRXOqNGwqrPvXkKSIasVnlXEANApKAhXKyaqGPGhnyLEOtHsrqZcnWXcyfoUfeHKHdvSflsJSDhMoISzeQlXUOYKwPQs" dataUsingEncoding:NSUTF8StringEncoding];
	return GEOVZcNTgqI;
}

+ (nonnull NSDictionary *)JcDoTWPVRqP :(nonnull NSDictionary *)WNYvYaBicxpGdu {
	NSDictionary *WYCsqwtXbrtF = @{
		@"XiTQaSNhKrDCn": @"pywsiVEaDszoYaXEpEBirMbypFXAQEkYHXeiUGYSRclZCliNtknYZvFGhskxQzxPLLesSWGXnkXbIvbUAlLcHakqPjHfcWxnqpNjLsPPNlpYVlqBHGACZv",
		@"pgWrYcueHW": @"wSomQfFZTsKxWwEHyvNQqaZZkTYOFLhzbNswqByhRBQpySTyhmYubnVjKwuydsCiWCjXJfjwSEZoeonPYeXSOUeIWjxPbgjOCQTMafCvcJrcAhSJDCxLlTcjVjsXqw",
		@"mFRkwZhpiMLNoDvFN": @"CeVkAQqnyMVlalKkafBYlTzYBDLWoYuiyYmeCVzcogkkQvRMKikNmiXziPlGqwGJyiSGTfPevHgDfTYbViFtyuieNJyVHDKSaEuCndqFDtQPklZXVNdjDhPGrRqsxEBnJJ",
		@"scGdOyQGgJtWcv": @"zJdEbtsqEdHlSLOPOuopuTMbjTADhqlIlfvhlmhyqwjEaKKITYjoOgBKZQyzkhsosxSXYIroRGUlHOXIlAkQtJbnkYfucpfaNUPAYpbSxtPMXnyKvsIlEuNtSaj",
		@"WYpxEspicZjjN": @"nZVlZEqfdKZTIJZZRoIEXYXFtFEPcpcWEnRbFyfZWCBDIBFKCLeUIoupIgmYKQOEABxnXarKXGDdJImMvErhzuABBjjupWrEVMtp",
		@"TlVTrpnZeMmL": @"rGvHyKnviWgrZorIECfgUNPYmMsozeHivVWAQYoxYRCcLNnrjCcYuaLZXNfyxEXhehBXDicQVeotlTIyEgwnmtwZLMgBLescxiTxOTUOkMi",
		@"GtAdJCUVERtk": @"xVoFbtDOfRzNlmgKuqVTlabBIElMBLdkGjuAxpqIBbfMvZYjiXUfWvhgUjkLzQheoAAzPfxLRmGxQKyAoTLKrHFGdmkcprKgSIrJuCOWmOowWXFdAFeszQcVnSCZkFhpAqRgsRbHdcMf",
		@"XbzEHBosWtVPO": @"qPqONolhmZakAJwVPSZkBlxSmdEswJROMFHiIFKaUidcFJUvDBjmQCKQBzEwzIploQLnYidhPHjQJKUELFFKpvwXjakmtoGpbjNzDFRXCsAtLxjxyqiQhoSuLPNXTQbBVNWupiGRhbWPZYEpVU",
		@"vCVWUHVtfdL": @"bruvmWWDeVwAFEpQJzHyjcYbnBArrwmkafSPXgsgrmWkALSNPhTzTyKUMudeAtVRtwIjacXlIbQNoUZVDRcsAmacWDLskpKmBbUATIDQi",
		@"rikaDIAXVzq": @"MdjvIjvafetNKcvSStUuNwuCYXRidPGOxnVOTCNdwMwZxHcDyMFytYTgGgEmzfJGRONINTcibqvYrvyWipMQSrKJHIkvIAqpuXhZulRsnjCqInKTaBQXwImVNrwtxVPEkLqTcuBhTlXwveZKEWv",
		@"HkMJCVqxFKcINuLOG": @"StOVbKJJIJJZBMNnYOjQVOhjhQyTJIereDIdiKtxjxkgxCuXOsHnoNbHvhfgzwAsafYvjMicbxrrcgUcrZLHzZROxRzGOGlgJqoraqpBMRlg",
	};
	return WYCsqwtXbrtF;
}

- (nonnull NSArray *)iHxkhRsQuo :(nonnull UIImage *)byRkcHqgrfGDSEfTED :(nonnull NSArray *)UMiJZBVwezi :(nonnull NSData *)cxIyuGBoXq {
	NSArray *gCfrQrVlcysqS = @[
		@"VfzXlYwFvqADDvWcFymkqmncxjQYSFcFPnbZeBMcXkPtYkSmqxHuBzQDdzTkhevfKqYtgHxyKKCnbpqmTWUVswFgLyOMaxVxUfjDv",
		@"CSCQONhGWjLXOdGoPhqhRoFRElfntppUsknYlZyGkgZJIwIFCISOFJNJJHCZgjcDvljlVQFEKjUWNSBDjvJvsStTVrsZQhXacoDWJm",
		@"oQktxuGjPniWXkUpcIIIEefNQYdzjThQSAGQKXVHuTKOttZoNFhCDVpkyOhuuwEJbKKlJrrSpzBlPKeaRLtSlmkzSDHseoVJVDeHMjVHKfqAikaDZUnyKzQKfjIofPTL",
		@"JyoHzsodVsZvzhvTIgaseoPxPJzWJKwQRVJjFEvDpDuMZmAiHpIugFVPxTOqHGEBOTXdaajQRyDbPiWEgLGDSsjugPrQzhwcWRlyBqWEOznCzgcbDikDafRiwfJSuIxXtvkAFEH",
		@"CqhQlNnQUPcuUvzcwhSiYBORsvXndBoHvVSCCpVTNcIVOjDkwPltfMNMWZSDCTHGKZXOPwTHdzyjhCOVkUBnRIptblmZokNjOQkuCHzjgJuAtABZKjDHg",
		@"pSJDwMPioWGeoaupcUAWhOZatxzUyteXwITFVBSbDFcXRhJgcpDebGienZOuhPGuEUwtQmdpjaGxwhqTBhgOqjAHnZOAZPzSFzCNbRZFfyN",
		@"GYDhLXHYecUAaBenUqSyLuRXBKRDNfetVjWEooiRyikbEBWsDhknSQPqWLEgoHhvFNSaEgXKrRhJAtazadYJKhSnzZvFTanoxiqCgoGcklc",
		@"PVBmBdmHHTzZOXkhmMboAjIhXPKUcllPBQtSfCRsrwpNrYuRJqhdmPiEOfhAHTQfEGUHAuSgcponADBcyQmGkwhHpYMgUNSHWkCLo",
		@"nDLMwwNSpZSZScjUHFnVJQAbUlLJMwqYjGwLASGGRNMLqRxaVRwFkWCRxdaHJoDiGfYwCxJEfOQEbAYySCnMoqrwXmUnJPIaDyniESj",
		@"mvWDUoyYlomlvucEcteGNODAXaNIzJTQHKNBaBURURnjjSwslWCCipDWTbrvQtprbRNngdjWehnHQsMXlHOTSdZjWTCtFchULtesRaEYnFaluGfsGBjlNgcrObyAraRnOnDtVGLLiwRzDaTY",
		@"SlXVXEOZqhJFNQenVSJzHXyDIIdIvUdfOPOEZUbauuKxotvKVvgrlAEnwdqAmcmtxLgaCZPBlHtjBxLPOkWTVFcxsEvEOkaIfSVLsMfxoeDeLryHo",
		@"qNtLlkvVQrkdQQzgaoaCKxReUzSHWKWCaMrBpbLyEhVtHjbfgVOlEqWEANuNSqCeOHjxjSVEbYBwGZgPPbasEGRSafffafyjSPKtaoftHHdPh",
		@"KkgYWmCmPFzdwjzJNrWJwADjCgUsoudAiOoKqGweiHHDpVWfXKlnsaVUrWKlbyeilFitmoZSBdcSRLpsSezfkBfSHWWdkIedWWTvTznpTdTrQqENztcULsISOGjHhzIHfdkxbxPTkijNC",
		@"kLodCqRtxurpaPFYqYIBxpQeIVgglmudSCYCdFfXoDjDqdOUWqZTJMinwaLvzUemoykqMYHEvHLqZWxnluawXSZStREgzpStujrpsd",
		@"HlrxDmlCuZoOYqwPezUybzvEpTYzuwNwKDkFwTPXUuDsoredHkGVBSavvRbqPBkcFiGIsmjTrGbGUinOqUKGtAebjCvfyQBESnrXqKRoWbmAodmRigLrKaymMzHnyTuiiSSDpuUWHE",
	];
	return gCfrQrVlcysqS;
}

- (nonnull UIImage *)pcxbuZvzpKyLJ :(nonnull NSData *)CMmlqPWMgdVru {
	NSData *GXvPqnMPsnR = [@"HppcEvbvGMgMryvFxAtoiYTQwHUrVkAYKyeNaJUcwajkBmEaZMJmoaPVfYmGHyeuwXSCUwYyTRnewGmtHLDQMhlDggNAEggkuUspFxu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xEyAkDVnCMa = [UIImage imageWithData:GXvPqnMPsnR];
	xEyAkDVnCMa = [UIImage imageNamed:@"sdxHbbNVGXcFEREwKCybScUsjVUwVggdnvHnCwNWedqxULpmOtMFPgPbCKiNBQDXxZFNCbxrOgesgwwSNrueUUwvCDLAWrJGiyKqAFfymjrhz"];
	return xEyAkDVnCMa;
}

- (nonnull NSData *)ZPnTdgBRWN :(nonnull UIImage *)KILRcAfiWGZ {
	NSData *QNOCBdrbrcGiR = [@"ouanyCCuopGevOOSHpNTzEozYMyXzIUhBJBHeTiKpNzNDOjmrmjKYFHwiWNKorIzzzOmJGqSwEJFjwfjFKgEoHBQQIOGeGiAThJtIfxGeAN" dataUsingEncoding:NSUTF8StringEncoding];
	return QNOCBdrbrcGiR;
}

+ (nonnull NSData *)NVNqbzSztodYSoJ :(nonnull NSData *)JWMXktTUXpMLaW :(nonnull NSDictionary *)FdkoFoxdrbbMQwMAlTG {
	NSData *hZrBwHGhuFGCu = [@"XtqjpSVjpcQqxxfrIZKTFdfHuKxrKuqOGiGHGCWeGUeqUUYBkCAUNXAJlUONyJdMLoHYUdZIRrpIzePVOsZNzRgIJMetmYTJwsaaqPdeCOUF" dataUsingEncoding:NSUTF8StringEncoding];
	return hZrBwHGhuFGCu;
}

- (nonnull NSArray *)RsLwlsYhXQghnfDo :(nonnull NSData *)hgHLpogHqv :(nonnull NSString *)pVyAtdKQDQRR :(nonnull NSDictionary *)SJMEWDutnprfeZgxRG {
	NSArray *GqbvwcdEDADkjMbxQNl = @[
		@"jKBfyVJfCeIWTxpyoQYvACZWKayKtvSAXyfDjdkYJhptxcrKbsDmIEHSGYtjcbgrAfCotZZTcCFvpoXAUcABadUeDxbBzAXRiWdRv",
		@"mSBMINbXBVDexzuZEGBXcurtaTgVfFFbrheGXteGdyJvtUzNULxrCKiphqqardPfFnNoGUWDNPPNEHKoTomzFkpShzqVgNOOekklzJFqAHSLCHHYmLWfeYHgKM",
		@"VvhxnfugyvJqXBjOGunZNRPLesoXMZwZpVHkLjirXccuyUyjwGVVXiHBemufeWZQuLnlLHntZVzoFhlvrfRwRPzxIIUItJcbSSOXkSKJuOrFvLybCMhfylgQHq",
		@"eOxvGUssNUFGLeYTcISGwVwZmIpRlgIdmAOCemPhyAGTVyhBNpTTWuQnhFeitiXxppngWjdXcHaiyHhmYNkNiRdhMykXeMvgTToeQlbYAEyUQeVbOWavUfPsrVSpYAyGEZPOBrpKiUafFp",
		@"ONlqmgAViYPFZEuNRAbtpHeVUumpZEgBWHkZkcTclzNHNEPhnkdKMkSmvvEYimtqWSGSxikUHabdCPXPpFbcRelbvwQArevuGrgFXw",
		@"ZiTTwqJGJeTbnlcRXmewSEExudldXJQDuHLbmIeBCuhHZXYaRvBrrFaMGpTtAyNcFQUvpPwHLmSyIstyyzJrHmeCdhFkvppEqgkJfZcLkPHECLhKwI",
		@"IeDDwQHjBgeSqaobVURJevEZGtxYLVlmtPijJmNiZsFFaqvbfwzwyAzbsLdUBMpGcqYjnOaEdpoXymWSUyuDQCnIYEeAqUIDgqKPkahEuAIYqIjhHZRihmAVXXd",
		@"QPqHMpCWWARhueHKfkrzrvuuNyuEBgiqZCFYeaYaMKsFFYHITDHOoYlAxvDrqOMaBlYuzaWXzNlOjEqBqJndIbyeRtXlleIAfTBZhMWIFqU",
		@"XWLEeRbkdhdKDtZcCWYhpDdmQlobqLZwKsFausyvLGNTBBIwIjhznDQpPByDLdOrWSCgXojdHZINlFnZpXyTPsIlupKVhOPPsmclTvahTuWHZprspaSJepKXDwN",
		@"XIxgUfewnsKaRWqFQjMEChroXnPFbrwVdkJqXDJGAfnaMuRIwQUMyayUWTJzYNIrLJqrvSptCQghhivjDoVDauoqabgzjGNSukqlQzxquvpgLZMhqgKuXdEJeKVeshTdplmmBvnj",
		@"DCOPpEtbZXKMgMFdVLPhFTttHzwUfMqKZuQWXcUHrcNbzvxrZTNFAhjBxaMQBGHvMSLPCGDHSRginKTceOvIUJAIucqMDfvXGoiukbbaRC",
		@"bgfrqGAoJvNGZjepMFEcKPXjWtzJnBwIChcVnyFRbgVRTUsSzEtdFNXDPrUMCjWXCpFPBOxyMugbXjyHNgvYoooGYeouymOFdyTuF",
		@"nTgJqjBzpzZozVhMQtDWrJxlVqlPmQuwWZOoPqiUFZdWWAXdafMDRnrFUxzAmAPjYsVxfsXYpIgPkBOOcYxdmKNOKdoqDyytqlbHUMyJsjJgSfmSztpLBvXJilXomL",
		@"esRrxpLvlNhhyruwGMDSjCKzJPxELydEwdIQknLLPPpqqTmKbanLqHHQwzvbeOiJdJrJPEGUwEqvKDWFnjOfUIRGFEYtZmrIzymDXqXoTeRJnqbNkqXfPEXbLoqNYBJDHUshbmhssWDY",
		@"GKJqbZkBxCIwKhaDFMxhDuWmXccawjmuNIOvBGbcJWMokKIwmzcsbLhMBKawlvegPAejvMUqIFQgOEaHjvnqnTROBwzIyDsFiQwOaxgTQKxEHtzlzGJMrmtGqHuYjuYMnIPcHhYNZcwLTnjrke",
		@"MnHNCUUxLLFqGNHbwpVryKpivlsuQNRvPKFdcHEEGTkBFlCXhPNxsCXZWjxdyTegSetHNWiIhMXdllfiVsCEGKcIlLCEcnlwWGrrSgXCcTtBCkNbBiWubTCxfEMxpXHyZHpJt",
	];
	return GqbvwcdEDADkjMbxQNl;
}

+ (nonnull NSArray *)QjtgFueWqXosrPVwSV :(nonnull NSData *)HAUqKagbARrJeKcNYn {
	NSArray *mOEPuFJlxaWEPMqXQ = @[
		@"yqkxqovhOouMmDLMRkZFDdAjcKOkRISckmQkXICohRFJfhASkJnwGTPCClwnrEQnFPcelLmLZIASmwVlGWNxhqshlzSMfLIgZlTKnxlJLMSwEbXGSbnVR",
		@"ACFtSJvvflXYhhwTNrbzSTmEVTbtimZXVPkhXMStPeReafqkEPnyMXbnWHeOKGgAmUeSBMOtxGCOtmgRWlgAMxhGbcKqAwvGZUmSykKtIPbmkqbHXgZVmbteCi",
		@"GwHjXrEJwcjyXwbQlZqXeGLikOJPynYruAuEubzmiLCFcnHQpyncNuconunKxgFunTHSiSuAPCKJxgQEJVAehUhdVQGiMGWIySedZpnWYAjXKupSImoJUTVBljCQIWScAmyCmzDT",
		@"YKbxNPGhXdghJKAklBMqeOdGoLJYBtCdHZofjgPwRXHowZLHnVnrHtLsoQZrlfGwDjpdqrUHdgQJtwGBvTRqjqCkpWWJctyPxfkVTiVBexXCXEQFWrXRoo",
		@"BPrMtHDNEfTduHcDAHudfMqFCJyGlfiRVSKidhExETHavNdlSzWvPvRSwzVzAMcoPTCDataqPHZxambfDhiesTCKDHRUODEtaLWhPIjbKYnnvohJD",
		@"KQnsVNlYHqMSwaHDDvKOGOTkIqfKidSHANHwccRoICDAYohCSyoFACzjynPcQAjXGpXTWXcUcdWtVeBFOlrFfoOHBxzmrDVzeVAMElBIzWoOTQnmYxQDSNQVkTZfeVkhygRwGyOk",
		@"oLGKKyMmkJYElsDnZAoRzwUFiwKobhkJFMnqxFGHfEZMksSNkyZFcAfQdxBZCjJeFMSSlyOdmvgAzRRvEvgVedGHKEnlDTymIuVyqBolaaxwSzDAGM",
		@"wifEXSdOWtHPMhFIsPFBltRpNJCPBsvKnpjxQRsXHiIseRbjTmBkSZtDGAyUsbzyItRFfptyNXYyRtQXnoBrAXarHFKpAsuROuZAXrPdmupeyZlsPgMeKQIcMWibVEoqfVskRZ",
		@"ITdxRxQKlpmDuEdOSvYMcXfufiUapfTfonufCANEmljwuUttmngvwGYIOTciPDpGKzpyMMQbwNAGrQffIXNIURLvEyDPnCCHUYbngofUiRKAgER",
		@"POXOzGNbBoJkVeCAktkgzUDTxxAEQceuTgzdEKVavMlhebTVqWfmqvAFhncjcmbEchdhdwKoCzacghRpqlrbfhEbRkOWtoGsjDWAVGpQMofsUMwPPAMcYSDvRwiAdxelkiDiodLWnECBrgWpY",
		@"YFAyWxWTSNzkdtwlNwIDYKQzoDCplBvbwhOVRGEDusPpzFKRcAuzTWtfoMJFPFZxGfcudMjwFFJwWGSsQEKLNzBRYhhBqMmeCZPppEJFDEdYAGfGDFVOwEpVOKtxIvmFKZMHocmFnekfIcUWJYr",
		@"sAPBWDMMiRFeErBaZaTQbKsAgazvqaDkIliWtyFBqlqjPnPBymuMAgTKXOUyaCKSBziOECiSicLpodiDQNNuZTrHBDqkRmGIyJMUoZMoDRmomLgCwHzcW",
		@"APjbNwVoCLKdyFHcFyFVGCjUgpturRVPBzkJLFZnFrBeWEibTxKAuZFBOVQEyZjxqFEPmCORexDqinkAeZaEpnytVwieSfogQgVxHZFIrHcpusTKlqOhioJMTfLDvBnC",
		@"XOBTyyYePyCRpDmaDWviNooWwbVSFshoMSevJCsFgQXIuUgMFdBkSxRpacvCjVSlCuJBWlgqTbFxQEtaYaSwWYKXwdgxKHatJRzFSjwMvYZUqfwFDlyZSfHxgBIyNoRfNGvIFKqyfzWeemrlsU",
	];
	return mOEPuFJlxaWEPMqXQ;
}

+ (nonnull NSArray *)apxZArkJml :(nonnull NSData *)lTNaTQWdDnhtq :(nonnull UIImage *)KtsUafvXwtzqQpgTWk {
	NSArray *veSrFKlZSknlkknEjq = @[
		@"dAOWserFvCfLIyAwPIwaIOvjhMhXJpglqCEaqBUiJTjyBpbyRrSVjnWYFtmmXRzcPDXLXDQOFVBeXizhCGSKuJfZndJOhDEUIUYbrBfmCfihYQXVLwTgzhvglePdxSqAqOfXSZYcVgFjtQR",
		@"gpjRnypXJVbTYOvwrSDsRzTbgXmNfuMAPeeEMJQIHEDuVbLMeTlFjqjSEQvKvtLYwsBHqXCfpisLkxLkOzALMxelNscawFlaUJVuGEzdNwJXVVBgKyAAkwnFRu",
		@"CDhQhrxvrJgfnyZKEbpmXegjGEkLNPMRfIqeYbTbENXOgtmTZeURGyEbRkcrhZsxvRmVssGAaxDhMQUNFsGbcEyuFqRTNSmFmhocRraaAEdqbpdHsTlrAETdTtsfmdUGv",
		@"JSgBPYlytvIbCNsudFjCZomwwqeABnpJKpfJDEcErHEZrYuePigBCsVXilYPvoOdzMKMwqyAeqwbLastZvotcVtZOKnGimxDtXnwHzcyskPoDZINMijRQjCRHkLxOrqlKCsHyoSPbmRyouecK",
		@"elVbdjmkegbctVGTphUcUWFEGOPUGldKWYfyLlWXGsCnLnWbrBNIHhooIbXZVkwmrQVrTmfikWelXgNXKDjaplVlqYbmDquwjIFUtlqamkQJIOEXCkR",
		@"DBXRKImmgvUuiRAuXLsbUjNFGbQFreCLauEAbBvYADdvlndmgqXMjyAJjRxgeiWALCTocgUrDcHqXhqhzDoDRXjQKAijMkBcNZieIAYJaHeQmvhlnGvSaYwD",
		@"WzeztHBpKFWWfssoVgAoYQaDSqVYkrhtYBavsFieDiaUHZrCwvetRDIqZVEbZmMVxftYQpdTvDopDsOICUUQKqjFVTyBTsnWnSqXgbfIyXeHMCYpMsECiDIkcYBHSodFIYENVCZxBRSb",
		@"QYdfBlfHPDaxsEaTZFJVvUcJNVzReWqkehuYBqjrSrYQoAJorlmhtRTmChGfwwrSIqrvgDhOijdNdljAXjgJffMnDqVGxPpkezczTDzYAnrlMeVWdVXcZtsoiQcJSay",
		@"fzOMXiRhTIZqyPTuDgSBFRfNFIwiWVFgMgkBcOerApEZjCWcfmsogsMJLTYFihacMbVQQNFXLbzIOKRIluBZmYcmnSOzyQDsxAMCDonrUI",
		@"FjoHGrgpsxPfYWRVoFOIGipergQimvzdBwiKHGWxooNlasAUINeysqJbFaQPzWVzNIJhSrRrtuIJpHRNoYSijigTiechePQFvoOEiagAtDZPhMFeYunagEBSDIDwxKBVDfhXLfzLvi",
		@"RujENxhXxQfmLeNiZwsNwTZvZoesnCfXEEmXAmKUKuMzpKIcPxsuxvYCbVJGlbKcVqGLieqXGEbIwMLWQzxotVdOhqfbCzvHsTUSRTIBvbESQSPxoIiYKMcfPhVrnTLBotLTiVwMxezZlQA",
		@"YJUQVRRVWKcGlBnaIdfuhZZNvfeXQDDvZYtIVKyCPGmnzIggpIlILEcVBOscoAkTpAbitpihWWIvXkyUYSfRGzvDjlkgenpNqwnhEEeULUvJFXXwKzJLagJjSJOT",
		@"lffOxZVQkUpciNHmcWoKwwvqZSxzbEjEdsUcIyRjtOIcRzrsgNXaFOLTakAnWFRWyIhvmmakkrvFSXRYhSQBTmHLZEGCrwZfkMnxqSIEnzwskbfAlB",
		@"GPFMWdFotJncXMkGKvMzCHOjEjxoCWOCNupiuhUwHGzPOMehYERNBFTPWzvpkVeIvKwDMRNlceoDscRvbnYGEwqqpWBhPMsjSPlGEXzNvsGwRXqSKqHxz",
		@"vhjszkBCAtStRnisUOZBteGqmLrhkbJAleVRLgWIzfgkpTWwhkeWCraYPxioYtBCsgnwXuTSvbrOHGjUnTgkZxVarnUwktpLQNiRFy",
		@"FxiFuXCcZozJncFnVGmekChykTLNbqBnQWtQkzTRNaGnyBWVZTDszjrQoRmnBAQFKWnmODaEewywsRIofqZAVyHqfvZuZtUPknNzATJffdhPVBXjEdFRkYXIWrFefrS",
		@"TdwLMgqzMvmZZmfoRGfpmxptNQlTSIUZbYkLTaqjLudIuninApZieaUrIlccFINHwtyzBxRhVIuUerVYUcEVEoZChVDkCQGJKsbxZrMZxhEQepqRwyZNwGjDTwDDVsXeDHJonPPtyL",
		@"FqDLRuIpRcxYEPSuNoOcTrmRpjuycSrPzDrtYAsCGluRPWKbbNYnWfMmTSJlseSeAPiVXYdDLamheebDuKqQSQuGGwKjuadkTvWMLsXuHWMXlUNRCISsxPPbW",
		@"zisNbWGEIJSSrpbgnbECAIhAoLsRDACFhAZztrkZscqnPXWGVTGtmYSMHgxQtigjUaZBzvRfMoipqpBJRMhCHTSXdBgBGwBnZKeDIZMQurkXMnrmUvlEWu",
	];
	return veSrFKlZSknlkknEjq;
}

- (nonnull NSData *)OVnSFcSsZgMqswSXUM :(nonnull NSDictionary *)JXsOIJxSTwSb {
	NSData *OodTTFmqlHEipPZNk = [@"WGVdSFywwKcOeQxLvmWcDHGKwOzVnhGciSAVafEmTZXfOoFbAJgBawybymDlgKmaDeTrbFwXYWrsULkUtQZVoJQJRyvxBmfjQnvIvLcGFqfrLnyrfYOtxxizIR" dataUsingEncoding:NSUTF8StringEncoding];
	return OodTTFmqlHEipPZNk;
}

- (nonnull UIImage *)pFmHJHBRCSjr :(nonnull UIImage *)vbWgSrTDNlrDzftRNik :(nonnull NSData *)zDLZTJoHZdsEiO :(nonnull NSDictionary *)mKVdlhMMDxhQJmLJrw {
	NSData *iejyvryvcEsyF = [@"HlXtjbDImfMFgjBGIkgKZYWlmHcqycPSGcSyFLrIpkcluQqLPQyLKvAJuAyExtgsCgkNOxgJUNooESITLRlQBQGzLMghdilHRIZNPIfcyQdZfWfbehSKTtdKxeWkGj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rZIelTMqFjkXeP = [UIImage imageWithData:iejyvryvcEsyF];
	rZIelTMqFjkXeP = [UIImage imageNamed:@"bUowGJFbOJFlJtMPvXMUDkHPeebJpmRZQSotRKDfFQFEDveLkNucnQreAcaRHZndcjqDTeQaLIOpbzmWjBaQyuUGYYXUAXAsGsEkIPHKHwKoFDzqEipJPGwt"];
	return rZIelTMqFjkXeP;
}

- (nonnull NSString *)VMjtepYlygWiVsox :(nonnull NSArray *)fvABOHwaysrtKqWtpD :(nonnull NSDictionary *)QXRElwdLoRehas {
	NSString *dsUidWNqzLdIPmBDywv = @"XSpJaRsRnrEDOpNVsECHpkwwzZuECtzfutFxHfXORLiznhvqfvFRsEuthoWUuHOULzIgYBMKlXKngRQvTEyOlbwxCwrSlrLfitmMgL";
	return dsUidWNqzLdIPmBDywv;
}

- (nonnull NSDictionary *)kUXxrFkwMTDyduEQV :(nonnull NSArray *)xKCVZhlfDeGVmOsvK :(nonnull NSArray *)BeprSRpOYmcsDHh :(nonnull NSData *)LvUWpynmvsGkks {
	NSDictionary *YzvKZwiGLG = @{
		@"kEZgNeSkaWuljmwshDv": @"MfIyVNkNqGvipEOnhjIlMQaWZDRCqjnReuwWzmDfRInMueInmqaSHDFpESPFkiwfRTKjpiktTjvPGaFVzUTmvmETjkaAsIORVfySZLvPFtRvKSZzPeGVDVOlHRBWolImhtbJxADqPDJ",
		@"upuqTJFpMgxpddgSxe": @"ikhcxZMNNonFXQNPSADzlKHjWjhQYRwnuCQpQtkYKVUAqqnDwSWNsEMZeVREnvqupxfvVNqVVpoJduOAOKwHxkOgLuBevtxwlYfeeWjnIuoOzqeHjCbkTncEHWDWgyqHUGRMhfxqbNpOgEGeEn",
		@"rUTdSCNQcCDKHtwMDx": @"tlYTFLlXTDiSoApHTEupGdWOdTcAJOfMrCyOUjMvucXtQlqSONXLkxQgQVzGoUIrMRhpGtOWiijYRwPkUhWhTzsWAXjhNiYeHWMjUGHlzztRqVHlMtRcYDFlMqbJ",
		@"yOzjpyBBtnmtCmjBKm": @"DfrUgCmjPirTpgGHMwgNCZVbLdfiqYnFTcbayoQrXGqKBGZXeloCWnsrcDWSsRaotNpQkieTpeGzWBcwCretrONTTMDKveincpWrUXQpaNbROjFELqCcO",
		@"MLZsnFdGJMp": @"uTmIvaJExDXuctYtWcRCgbAdTFgOAIpBrwAjAIOvBxdBmrIHPjxIkhEYehgYfWaNgewnUowrTpVtBoehJkGApTyULYAHCxkHIFzPWfPKBoFjcuecAtymfNPapqvQUytwNMne",
		@"xQDYdALkKULVAo": @"wDGzisbFuTDdiMMCJLXsjnIWvseCccTioLCixPCEKHyTsvjclbZvvJATqMxJqaGuNSfSiTgUsyADOTgyJKIlIsVfyZMYCOLmNwhTrNYQqJwKQOOdOmhhukigaCb",
		@"rCELEdpVISmByiKjU": @"fbQwTgMMXDJDHDNvNwiCOytmhOHWsJrbAVVVhNnNcXekiLpQlpDpMtkMoKCUxwdXMZeKdYAxSQVtXTVjdTrparMhKiYYNRrpubWCkpddaR",
		@"xXGZvEjyqYiKmrPMt": @"QXuPUMAbyEyEbzhkSKGWFKqDdkqFLuEkrVkHVgzipjZaciAmaUIZOKfZKEkHcsZxbnQuDVbsDchkKLHtUwLmkTXGuIwAsnldTtufddIcytBONiNNOeNTyuYrZuzyIUrINbEleaYKpN",
		@"lSyvmCjQuWWPnYl": @"nPLhEiefdJcGVdtHUDBTzBHZqJXGvUjMIvkMlsPOJqTPqaFIXgedVPPJaTpBZSpYSoDvrXabskpBtSFFOkvcCHPDHaQKmRbuSBeQnoyrSbVLWxJYJRUXbFDTttcktNTrggRmBKiUVasBWi",
		@"nKIOLNAvQeKFlEstt": @"glBUTVyFeGXngQjWxFbihFIXBkDizwmQCiXOWzIWfsPhFGZvMMAqHuthLwJvCBYrKkUZUhuWoohvXpgVTGYCafqPRkHvWeTKidfJctMswR",
		@"tvJUKVYhzlBODmeZKv": @"JRbIXoshSnQVsoINyOboECrypuAOxgYmTMAjONKAaCscoNKABxpekFrFUhNmyWPkDjPQzqmHMzhTnQirPxILCeSYHWORIliWyrxpghYBQBMMzbYxBaFbZqwklyyQPPjETQYHY",
		@"qatgVvTXKPRz": @"qUMEysZcwSbjOVZIrKbFEAfWJTvgFXlEhhftIWEAOMCaSEKshRmohRPbUOXHBjmBjhkUAbsgycXjGGUVcpGfXKGsULGegnGsbjYAsnxtCsykHdjDyPvrQkadYHFOVkJIrhzUhbwmHaaUJrI",
		@"SuArCWoukWSXmbHaf": @"WtHPCMvKPCfRnhjtJcMVdvIUDBzSbJbTeGFEKZxDCgiTswkBrxljZamobzHobzWhDiLZGiduZPzxoijqjAaPywVfgwORiugrUiihjIbRelElOShWZXtZFwGBEQqVzGKhOShPpLYXsHkCV",
		@"XmQnOoLRgyGx": @"SXhZfsAJQWkqonKnoforURLwShtVaENgiXuwifvRBBuYPFYvZfcNmiiEOdhzdqDyyqMbhhmMunYLwdWmvfcCgrKmZeiCTjPHncFrENtTPDnQMriOZimaVRdllMRfODWNxbrDmOIPMrTLKT",
		@"PlFNxLTMXMky": @"pjrgbthhrpJNOanTRZKOwHwaKkWxuPicBdgVgUugPgSCjYyHGtKRwdPIsLMWyAjaLELKniYZsWZMSqJfIZdanHAJKjBNZOMTAzUYjceqHgtsuPdtSvaqoptAwHAZCXKlmUVE",
		@"nOzSAwtMSSl": @"LqdIBzCdbXOhWXVtFuiyPuXuBvrCeNVTQgqZUUQHbttkyAaNAVKqIuofWAcvMWfEwszcdXtfqqFgAIsnatsONdddYUicfOskSkDfMuzIWOVMnMpMl",
		@"AFJZcrvgONBmwC": @"DMgcerkJSehuovHxXIKazfBxelCmUlMvmUhXRUYUhoZgLJlRCBaFzFOwAnGzZhnReEymqfgDYswZsQwDDfqbHSzeBmbwJCXhFnljrntRsFFvQbULWEsEZLREqdKPOeXVQQAaicZRQYcijKUcvNfyt",
		@"kXpTGjmHczd": @"CSRMuLWCPTMvWftfpDdqbzylIRxOhQLBWauHpgxXJUDorcFRgHhYrnwvyBsASMFSVxEOadOBcZOmXYOtgdjOWUpdsHgFZUwGeZOVKXyfjjNIQhycAEfd",
	};
	return YzvKZwiGLG;
}

- (nonnull NSString *)TekgZCkLVSUitKiDHY :(nonnull UIImage *)pnbktZJSwGv :(nonnull UIImage *)BnpGNyxZOtMew {
	NSString *lpVIvbAyidSCHae = @"gZUWWvdthxazZSmtRQNENpiMTiatJjYvIPtTBarlCAmVkUTmkYjRXrRTwDpOzTghZRCnwGWGvvxwNecssHqKLnjCYrKYVcyHlILmSHB";
	return lpVIvbAyidSCHae;
}

- (nonnull NSData *)vWxwGMfGjH :(nonnull NSData *)MNJgoIJGKKyZAXvQGH :(nonnull NSDictionary *)hMMFyYbdXZGW :(nonnull NSArray *)KdiDHhRTmTHDVs {
	NSData *HHwrqjOYZE = [@"ptXpDGAaCVBvdTpbvEvUQqwUAdCMseRJgATiZoxoFsXyIzHSApeCyEHicGYrhJZKYTajyCTqiMdeFoSfcQtqYSFzyyuIeStqHKpfgDfkgIwBJziOPF" dataUsingEncoding:NSUTF8StringEncoding];
	return HHwrqjOYZE;
}

+ (nonnull NSArray *)gqYbazWWeMmg :(nonnull NSData *)EJKzKRZuOSKX :(nonnull NSData *)xKfleXRLmppuXRav {
	NSArray *aPodSsZWOk = @[
		@"mjsBnahElZgcGjXgwgTsVHtjbmMOBtqPHsNEDLMTiKrPybZibeTxqDCZOfGgNGQuGhajmJPXbRXZBIHbLphqXFkZmWSgYlhTXrvDVmerJAheSjyxQqiDwXSKPPiKlaW",
		@"pyjkbqPYNLnHbNFpdelhfEfwmOMDaBhMrWszFypMQEIVPTBtAwlArlFGxcRytrlfuRfSQGfANKCFfJMJGwIOJlgxQYjIcnJQornUZAgDFyLUrcdgelTReupuW",
		@"WAhWoRJVPoWVQUHQmYCWZRVzDGMPbgdtjKnWgRlbnBrrNDjezyiwAeebxQMazwDCmihgiQXueRnmtOieOcfqMsoawSIPHTVSuOKuFskrpBCejsZoyooFvMzrSwjoWWHIbbOJMoDZ",
		@"IFsPRUUwQtPnheEExlpIGcHpsPDcPvrUlyURieCbtCPVMqPqhXOZQThwJnnmuNTUEEYsdNycMatBeYogicsvgEbpnDoUlQvbWZGhAEYlofhvShfYR",
		@"xGTsZeaqSsutkHOjesLFBYkwWTFooBAuWVeEFYTetIaYarKTQYhzLUtfSGvLAxjUHexvbEQnXlalNYMHcvHZlZHuQqdJUqRdAnkByeeviPywDCvhaWxjdfffCqLMIsedCvlyxgbLcB",
		@"NCJsevhMniDcEoDoerQZHlvbmkkPxKoIiCdbILFVgJroznWVuSsxrHpWNQOmcBdktUuOWhYsgqnekWsJgxoNybSAYWJazBGOfxoohy",
		@"HuKcjEKgHtJvDhxizlmlbbmDQFtjjotUdaAPByepKBFxRdnWYjxbXvFVskVdTrmPIhErJBvzUGuZojMJicQxmqxWzgqYIQVciibw",
		@"cRLAEGabuyKdfRthgMDyckbPRgLXJFpQninAXxRCKLpEeiDCyfrqLtMVMiEzwhljcCcZoQKalQMIZmYRKLJyypDWBtghnuDJZzqPNYgYLrxZqtCennikVrxzCpo",
		@"hLXRHklWIHGdTTNJTMUKssfiiKnAetnAkGDFCLRnhLhJXNBbbiDcXxJPbvnYLRvmyHwvmpaDATwaaMceMDHukQVVyTPVIVGHYubfLuFjuCwLHYBwYDjRIHvYXxAqjDUAECyuLgtDfHGPRuV",
		@"VPBoerPVBmzsviLVIznuqOsjnRqoIiZwniwOoTgMryNDLIjGsxJlyhgpbPmbUXRFeJwafwcaNTHxpnqkPnjhXVrzjcLPNniAegGoXMoTKE",
		@"fIcdbNBSMUHadBfTcNtedrTinfXQGhMswzMEvMAyvLnkouUYRamdXrFxBPijesvldHqZqcGSXAjOShSeyqUCklZmqRpKFtQzusESscuaucYSceFhKnYvPEnUUSWojNUYbMZGxKSlBFkdi",
		@"JxFlTtTkoEvvRmuAukrbvLhNUfuIwEmAvqUetnbTAdqsZkPZlHvtgqVXXTbXZIPvXWWHargqjfyQcDysWWlvLpmhOrYUlJqpeKPSprTOZHGGpmrDKWVMwKIsKmLxXytdZLMBlfhoWKeq",
		@"XLfnvOUUFhSiKEUtQjnJOwxRwIgESbtQtGodCDXjmAPtDDwhagudNpRffinxYHCCktigmCvVdWmkUfvDanXJrTIciNvhdRlzdNPo",
		@"BlKiXpVfhtNtMELFswIOAtXrWRhUwLRzrHfCSuOaxOKivwUxOpwCqGqhVvISfARLMZxTYmLBOhJHjiOtYgLMnEtUxraKmSXVhSbVb",
		@"bOjIPmuiQRJcmEMnhClLMXldIqAVUdYIkUAJfRfuLPBbtbwzjRnjaNWGAOMiPdclrYthHQSJGGVilQktBXwlMgjkfAAkzZanqhqOKiAXybKwdYxVGRo",
		@"jccxehwseEmpCyYvkqSzrOEvmDwGeUYknFqLUYPcBTVSnvHbCwmhZYUtsfbwmxxXrohAWxeVeEjrwEIOroYDmcBjGeJhdqsTvXljxfiaKJxtZdPozSsqpjfkvKoduKWtUIgTCTVOZsmG",
	];
	return aPodSsZWOk;
}

- (nonnull UIImage *)bVYPKoSzQNo :(nonnull NSData *)dsaNsstuiBhEdF :(nonnull NSArray *)ToUAkpFnAyrLJcAX :(nonnull UIImage *)ZmxUpLXJjHPSAoFxJ {
	NSData *bMVPjoUlgTjX = [@"bHstHZqekIJGspbReqqmTUhZRKmZSzGnGstklFrggkipCWSlDMkJHyGtLfRyNYQIJigPxbXfdBkPgwrBBPZLMuFuTXIOeRysnSVQOONYyZh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bvpsOiCpAhpYKTFoupf = [UIImage imageWithData:bMVPjoUlgTjX];
	bvpsOiCpAhpYKTFoupf = [UIImage imageNamed:@"ayuydyEmnkEODVFDHRbCeYSpTZrnQPHNXJjkeGOTyOpABTxFGnSvPzmcSyWsLpOnMoGWzPIiFiNWDEVCPJUDnxIvydpxjINcDoxA"];
	return bvpsOiCpAhpYKTFoupf;
}

+ (nonnull UIImage *)TMwWdMYYdruiqmA :(nonnull NSDictionary *)twYHgEvxxcjUQ {
	NSData *WOZuUboNUBjZbxd = [@"iHPqZvGbGyZzLVWgzYKcaIMBEUaujnrzjNhEeYXBstthrmdufiwZSYipdYkhNEDjMGINoiWQpRgiRWVSBDYNjrgynVANLVvlqrOnyFihRXUZJrqWCi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WoQshVqXkez = [UIImage imageWithData:WOZuUboNUBjZbxd];
	WoQshVqXkez = [UIImage imageNamed:@"AdpHqCWrfUOktSnQOMtsdfFCkhIALoECBkhjOhkqQIwArQlhdsFPhNGquXvZdLvlZqFkRLsnTsTetWSqUxSpwtkJnMgEejljkvctNQLjFJXJyjWfyFJFK"];
	return WoQshVqXkez;
}

+ (nonnull NSArray *)FgatiRaNRvD :(nonnull NSString *)keyLGEIvQbXsf :(nonnull NSData *)hRvailtNnwR {
	NSArray *tMTZyKAYPbJaxYQqa = @[
		@"IIYLiExlJKguALviQGnSBzCkyeEPGSstwXkaWblAcyiYCHMyQTuaUrNrrBDZiPSfJxdRfTFaAoQdUiwihJpRnkayokxrBwdrtjDATlfzFVOvSyLTaCUAo",
		@"sZIKiMCOQywgaXTYbDpBQurykSNsYWoXVcGBjJlamfyqEgcUymhdWcQsuEDNBQlESOWACxOqQLxnSHKOTfRlcgwRbefYaVCbbYWMdJJkFlNSBFLNOzOutyNyoTPjTWICfZRwsTYUnAUzmJEzd",
		@"BFYBgvQFwXuxifUdnxiDSAspPLmcKdoOAJJPpyMyxDaLfkKyTActihzAEvCDXfOvkeMPpWDABjMEpDkVWysMNItjgoMfMjxIlhSEdYblNyZjQtXE",
		@"yOKbadcoXvSiXJQjQeaRMUwNztJFVFYSAeffZQoCHJMDEaiYstYPHUDQEpaDvNfcAyXHhgNeWwHFbQEEqXdWFJojaUpfPewGwdhkaEOhorkFNeJSBEywa",
		@"gXYmXakvxrLXsuHyGnGQhYaAYaBIalXTRoZFYGesXSxWEodXUmemnaicNNXHMKdhhmmtQEfxxWOzHjxagDeOQwGfccJFluJsrgbkACVlTVtuCjWgXkItCXBynmEIYauR",
		@"omMKCfvbhJWlxGiOFUttKZByAmwnRflhZZZPLtmmTfivCDDSueqGrmtxLLGxRhaBTmSUYCIhaYeVwjCKMSaJdgtSBePrEGLMcTsvxkdXHwFCwCQDptvCvYcuYyyLNHTRhwBWkvxfawevyqQt",
		@"GufnvmRbUjYDAzQYyhHSVAXKTQGvUnZmBUFYcXMNfxeoWOJnTwsGgShjNvWVZuHFDdNIEtKzoSqtqnPgVqUwElgwuwNCJHwZzpkYQoKkmqJyYAahABSiwtzDShluNlPDHuJLYHvpgqX",
		@"WhRhYfbCpgkwSGvNCJioFqvkmBVTZdxMszbFEaWcdowguZDKhLEWPPITCGoBgHaINRkKTVKNAcZDIazoeTjMYePeCBPtjGrKugVxRwWBwOFpgYux",
		@"zCURlyZCqmImrzaunpamHaYZRXxTSbCCaLhuqDnQaCdDbLqbhotJDMwoMafROaMxaXMsVYUnuZilPwIVGcFuwOuwvBEuGYneYrWFUhZDZx",
		@"plPnkuxodZYjcjrxAYIPmJzjhTeyUTbvTGsyZzJMfGSESmjtepuZGMLvVAOnCOCWkdOgzgmpauqSkHCNDEnWRkDdujIdjXkPzEeXdSawaBLgWcUEFyDxXyatfkBrr",
	];
	return tMTZyKAYPbJaxYQqa;
}

- (nonnull NSData *)jBkLhCEFEgIi :(nonnull NSDictionary *)BLyGqyQZug :(nonnull NSString *)KusaQRised {
	NSData *bOlMSumeBi = [@"mqsfiQOowoimsAvvevbNOphmKuOMtxWaSDbrxQgJzNfTUYmhgqTULsQaXenviDCmAvjLIFevJEsmHTOUBtKLIeHzVUoMqIsMNDzWdadTVxJfFzLSNfkdbcArCBljCRFJspM" dataUsingEncoding:NSUTF8StringEncoding];
	return bOlMSumeBi;
}

- (nonnull NSDictionary *)JaOlxrjOaLwbJL :(nonnull NSDictionary *)pIKdMIOikCPKrtLkVeI :(nonnull UIImage *)GmWcdxiNEwUD {
	NSDictionary *dsNzlVMqeTb = @{
		@"pgTbFeLxDlxXvabwW": @"oXxbsCFvFNuoXUWIzkwqGMhuQTvpCmQJFPqJRzVdzegOihTKebsIDLsRwGHFrdHZkVYLUcgHUaWNSDHYerNZNfHbzodamiQbsIajsXPQiZpIbGlLZmfEKdPHbJqA",
		@"KyXjMJUyhKB": @"AbpZIALZZqegvwTpvKVwebNXaKDEtkpMFhceXjeiLiQcOAIQWHTHkhiXDvzbNBLUeErPVevskuEtKgUeGepErbsOhunWcsbtbyWajYOAeMItRbrNmInDJVIkZrc",
		@"zAPjdFLsLmeIpsNywc": @"kKDNkEMIMSNyDManvxrgFIMdARVKVkpSxQtYKHmQKTmyXohSdenkyKTuCTGLjylghzPksoAZNLkVgeqDqWEQnAwhwQKUuOXAZQLbGgrgoHbakRxcJdARwvNAquokhsYgLElTNuEOjhBoeFogtx",
		@"vFYdKVzhZTDN": @"ZHxaJZBcAJKIsVflDBYdZBOVbfIdEVStDYYeRxbpuRGzBVpzCirylWdDITGHxkGfZPOigCBJnBbOqgljZcIYVSrVMDxiHwPzGculEeFqRXnK",
		@"sdeCMXcPma": @"bYgxSEpOLZQcasUUekMMShRfFLUygnngCIApbWQNaXDlzKwfVmNIXSJUltvZgdZwDwLJeuNsTKUtPiYywOayxuAlzOgcSvKLMUgaxL",
		@"wTdhIdVavpMkQpoaMo": @"pxgLaAFJyyzgrsctnqigdBMbBEVbkUDRpIIsrxinzKRVniZaKGHZWCquslGbTdoUaHubomUAZadvHHbClMLAFCJvEKBLwwGCZFOcyRJABsVKuLuaRggigDYRgPMFXbAJDFEVMVHwcQeEjMY",
		@"UItWZZUGtxLaFH": @"OwdkUwszurYpJzQjuBJWEdVZVGnAMFDpBAidHBPEggfVjsSBgUoszzbKVcLkilwDzAvibFFzCGBqOvfNQwnGGTGKsvOpWAWRZWegwcelK",
		@"tJWvCfaSFsBoFt": @"nLLrQDNmAdheFnvCYXRBpFgQcPgjOlwScmuLggxAxkYEFKQJsFmBVOFdxnoUypAZTPpbbsbWxdPZkzyBYQqXhLWsIiwIwDSGwBCBFTlrgttkZfYMlBoxxmznby",
		@"gtDTTDJjGZOHUx": @"KWkiPmZelcbDRaPqMhGPqdheWeNQKEfJFdfnDKDvAzyhAzOVvLvdphtPVxbXDRqCVyIqAPmmxyYZWmITBtMWMAznPPpMJQHoSfeXSyfRAFHYATViQqEYaffhzmQtsrbknCGnLHodhwSexuQEu",
		@"LsKoXJpNVl": @"yLhMBTBDORulIvMNkplDxYyxJiKfHXzLhcXJgBthUjIwMRUrOTVUATJfWvpRbqJlxgKAsmivlGfzDBAosBQQywggZReShyecXdUlxkCvZZAnCOzIvfKztOlXTzIHFiohXCzsVvXu",
		@"ZPyIDQJkjXgTgcbe": @"bUsYPZxBUDmJokBffVBblbwwxafHmfetCPUjsJCLZZUBPAjcvGSOTtLfkBzwPmhBgDwZyENRTbohnDtpoUqcOIWjLthlhQpsFteKPZGCGrNOfNpXOCEPaEXcRWrqBlTBqzihyUAOMdUKVvVR",
		@"dbLuvRQDog": @"pHZRXQitOGDSiDuaDXgzQYXWhKSJtOTREDnxnZOYUaTJIRlyvlgkipwgupctWsnAvMLoTDkkEdqvQrueIVaeMObdhysSSJpBPfMBRczLIsZOrEbdlPQTySFmppEGIRyCPwKiwoEcHWTwml",
	};
	return dsNzlVMqeTb;
}

+ (nonnull UIImage *)CZEXsVQRVEAbNGPUnuQ :(nonnull NSData *)QiTGxdnsYqxNlHpx :(nonnull NSData *)nMmSCyyFNYkJTMT {
	NSData *ThKEegSCUXdra = [@"kiERcTtsmKvsojATYiJkfFPmHWOHwqfFSIiQHvuEktJqxeAAnHdaSAonslBHZHuwTqHgMUFFgSTBbqKkJkmWNNRjgQtTOxeSMMjqEPzGheqKeodCReOtfhynSprifBQoARu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CUcsWTeZpoIXkntHp = [UIImage imageWithData:ThKEegSCUXdra];
	CUcsWTeZpoIXkntHp = [UIImage imageNamed:@"cYCKXrYizKZYilNARfUsASCDtItQkgUkfgydelmmEDcbTJgOFqiDjnQdVWROpvuroGodyaJEVZfcWtbylReNEFCrUVEeDQaWOzEotJDzdhge"];
	return CUcsWTeZpoIXkntHp;
}

+ (nonnull NSArray *)BiKgjMTIvgBqDDXKUDB :(nonnull UIImage *)ovuUIixIeWpLVDnijYQ :(nonnull NSData *)DkZpWMaceebtBqNc :(nonnull NSString *)BLMpBKOcpCOwv {
	NSArray *YPsCWeumkjBPAXUP = @[
		@"YEhpVAMHETtlESQlVvluMPSzHCNNpOJBoEuPkMDhzJkgQPecpQaDmjSjgOqqZlznbuRTcpWxlhrFQRkHHdowkZDyiHmcQkehwxYHcBXTUkKLJUEVqDqECzMlPyWPeSdcwohBDePmzyrNNGqLWDEr",
		@"UyFNHUhAYkGwAnipTwWNqOJcaSfZuRYuxrLdEawOgVmQWAyoRxjqgteXrJuVKArEWjqaQpqzIaEDlZUqgbxgPKEcTKlZMGsGWkxPNXc",
		@"szkmTGaYhhOxawBvBfExpfdEqpqrwmBCZPvSPhefSrbVawuaOuDyRdXfvoXtwPnzPSMqHSrbCbycRsAfmqKvpHDuAAjaMoInjCIbtbeTfeXsTJSlEqSxAJlvioUspm",
		@"rZxLCdmQdBYdXbcSPBCtEaxLFshJGLePNrLuUjQTjMiTlKXFQRgnvDHyGIByjKdSZZRezmDXpgMYobaHWLhmKlCrlQUJMrvjadvggAwljzfAvBnoNlsfZOnckyesIufHsmdncmlNrOhSZ",
		@"SDCZCNUJhzryLOcBqldTfQTttadOrzvsWiyyKpewqnXpoIsKCFrtGSfVFaBjrOFHQJJsmYnUUBZMkBljTDeDTVmXdAzBUcVaJBwkfxBqHdfnoDjZyUC",
		@"UxJUJPofspnERlkinOCZrBckqiHUfrVHsXYzQqWXFBdgKXdoodVHyHsdFXXxQuoQEILbjeRLqCRGaDDZenQTjbByjjJaMLihtdUFTVU",
		@"wzwOrLobyRFudXDjLsTrlCfryVNkDTfhISqWIXVHAMFpuLhWqiBgznyXdLqnoSIPuTDJFXmOIUVaHNPamSphUlviHPgOgbSefKJzeVyiEXeCEQyNwKnmeFliuyMWijBMzsDENYoIlw",
		@"lVqrBpSVGmoUNAUvgfHRxHyoeiFcexuCLvECNtQTwvKBWIeVkVxqUfIigKTHQqvJqSfeHgIzJHTZYTzMHigsXjSrLslfddyPGzyTAAy",
		@"jQbzvhISdkqcCEWghtbxqReLrSoQGndBsjvqxkaTlDPnZIGSoLmWiHnwwVFPlIoKQPabsXxGijplltqImvBoWZFxTDnrfMOEeZcgLZRWvacUDMVCkyjJoLSPDnOEreIRYcWESfFAqhopxgVuqP",
		@"firWdJNhXtlYHaKzBKQQuEYjTeOkpopELkivlLxGmPQPzromNRQFuEuzhsAnPFcshJJJySJZhlLGFQfmrmPmESYaMASnaZipPnCHShYB",
		@"uGGooTRMRHZOwYTSSxciqAWzZcwVEYTTUEUmyBcUqFdLcsRxDVICaqldRkXSAbozSUGmsahntVXqYQHJMiWqyROoIQBEYKYzzAYhDZDyDtuIwPMCicMYNNlPegEnoFbDjWmcsjS",
	];
	return YPsCWeumkjBPAXUP;
}

+ (nonnull NSArray *)IFEgtXjocXBrzZiSz :(nonnull NSDictionary *)mBZYTSKoerdStkBh {
	NSArray *CktWzJCgOspaEHclo = @[
		@"BUJCFNysWNZtnEFJAiVQaCByAtQLmHdGzvQXplPyIQIrPYosyoBmSpLqDuKqEcHBARbeVJOfzgbSQlwvGcvAOxEEcLsDidbjUsziqVhLkecocIXQl",
		@"DkGwtJEwflPrJPYSRiojNqZSXLVzijHIalksngqWUvFtnZALrhZzbVGLiRAwAMvoyFwcdQUhnKyPNaFqMIHaedlyKYBJCZSYuEHhdcbWzBYthPGUIFVDeOMFAVyySzvLAyamAlsLRNskC",
		@"ClsyoSTjwbIkJdgcZfekYUDSHcNUogccQPNCOyTWpezllxLiTcsMcOhSTtClwrXiYUvwINeCTukVHVSQXOYSaKTwPrYVLrptMJyPetQdOeDYaChDIpPEgQUYugIrJe",
		@"tOigKZRlgYyfsJkALQdryqrIWDsAqkfShJYLObaowMIPSNZGGzgbfdJtnDkagvVrarllnmlDsCSLYOOsmmLgRTZWiZmNHXTdXqkjPvhUXwWjUnIYWEIfeA",
		@"WmQrvjZUQBMZyfefXfqOGferlkNMyXXmPvQBmIwzskwWuQoiofrQqxPkItdtHHnhWqknoetcHdmuDpbhnLNccptVWQFbcRNnFQFmiWlceXitwKVgthPDxciYupiGWDhdPEAAn",
		@"fHeZUfAohQJrlvEIYqITIkKeuLyjZjRPbClzmQYqkAbGkMWMyyjAMOqpIKwOcVRHoRmDHTxwOxJdeoidBXdzTiWBzvQCufgArMUjzZmInbwLUaPSaIYQxWUirysIBpLoIPiSusTzQMeByYFatoT",
		@"XqOjvcnuQaIDSNKXVHKAWWaHYKdGTQbgeHIYzClGfudsibrymMVEqMHwKFroIUsaRuLukTkuPaLMKVAsVsDyeUkBIFREjDaWSmiteHNupysJVEEwztvrDVZhqBSrFy",
		@"KHbOQZvDHaVirTbbcgscpqtPPSPiiGaKZOjkXApxYTIVaIzfEKiojlOHCNzxhIJiotAZDckKCmAphVJLppAQOKKWrCLugNdDCxEDlxTmwvTExuPrNRkcooQwAgcJWetQEifKVjQJrAUuCPMO",
		@"efSTDfMOWASikCbEkaFqoMfFWJhXzMXTKDWXQshCIurEtsTWkRStVEzDXFPsBOAuRRlscoVVWkVoQkvWyoGeEjdloQUIEFTTnnWPdtFtbuWp",
		@"ysXWDeRnFmElKblpcKKqnHwaoPGpJvzEQMiouSJLUCFMXUBgYJbSIEQOmcQNrftFOnrVrNhwpxFmxuZSjEgWwMcXBriQlUdKQyGvZYHjhsAnWBnAfNswUsR",
	];
	return CktWzJCgOspaEHclo;
}

- (void)backAnimation:(CGFloat)x y:(CGFloat)y
{
    __block CGFloat moveX = x;
    __block CGFloat moveY = y;
    _placeholderLabel.font = [UIFont systemFontOfSize:13.f];
    _placeholderLabel.textColor = _placeholderNormalStateColor ? _placeholderNormalStateColor : [UIColor lightGrayColor];

    [UIView animateWithDuration:0.15 animations:^{
        moveY += _placeholderLabel.frame.size.height/2 + heightSpaceing;
        moveX += padding;
        _placeholderLabel.center = CGPointMake(moveX, moveY);
        _placeholderLabel.alpha = 1;
        _moved = NO;
        _lineLayer.bounds = CGRectMake(0, 0, 0, lineWidth);
    }];
}


- (void)setLy_placeholder:(NSString *)ly_placeholder
{
    _ly_placeholder = ly_placeholder;
    _placeholderLabel.text = ly_placeholder;
}


- (void)setCursorColor:(UIColor *)cursorColor
{
    _textField.tintColor = cursorColor;
}

@end
