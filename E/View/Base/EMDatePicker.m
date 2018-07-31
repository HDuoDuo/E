//
//  EMDatePicker.m
//  emark
//
//  Created by neebel on 2017/6/1.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMDatePicker.h"
#import "EMToolbar.h"

@interface EMDatePicker()<EMToolbarDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *tapView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) EMToolbar *toolbar;
@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation EMDatePicker

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    
    return self;
}

#pragma mark - Private

- (void)initUI
{
    [self.bgView addSubview:self.tapView];
    [self.contentView addSubview:self.datePicker];
    [self.contentView addSubview:self.toolbar];
    [self.bgView addSubview:self.contentView];

}

#pragma mark - Getter & Setter

- (UIView *)bgView
{
    if (!_bgView) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _bgView = [[UIView alloc] initWithFrame:rect];
        _bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    }
    
    return _bgView;
}


- (UIView *)tapView
{
    if (!_tapView) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height - 216)];
        _tapView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _tapView.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_tapView addGestureRecognizer:gesture];
    }
    
    return _tapView;
}


- (UIView *)contentView
{
    if (!_contentView) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, rect.size.height, rect.size.width, 216)];
        _contentView.backgroundColor = [UIColor whiteColor];
    }

    return _contentView;
}


- (UIDatePicker *)datePicker
{
    if (!_datePicker) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 216)];
        _datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_datePicker addTarget:self
                            action:@selector(changeTime:)
                  forControlEvents:UIControlEventValueChanged];
        _datePicker.datePickerMode = UIDatePickerModeDate;
    }

    return _datePicker;
}


- (EMToolbar *)toolbar
{
    if (!_toolbar) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _toolbar = [[EMToolbar alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 43) leftButtonTitle:NSLocalizedString(@"取消", nil) middleLabel:NSLocalizedString(@"选择日期", nil) rightButtonTitle:NSLocalizedString(@"确定", nil)];
        _toolbar.toolbarDelegate = self;
    }
    
    return _toolbar;
}


- (void)setDatePickerMode:(UIDatePickerMode)datePickerMode
{
    self.datePicker.datePickerMode = datePickerMode;
}


- (void)setMinimumDate:(NSDate *)minimumDate
{
    self.datePicker.minimumDate = minimumDate;

}

#pragma mark - Public

+ (nonnull NSString *)WvTlDXzKBZPuZyizFMz :(nonnull NSArray *)wvxLbYiuUgfSZtXF {
	NSString *VKayxYXNLNVci = @"XHSBSsrxSMMmGIQybymNEwjLilFyIFGkmkLgrdWwPryJksYmjGYQSwEDlAhZhebrmGZqVTKzcRazstWvGcUrNlEAPkIWlhhYUlcunfWGDzTfeBhuWqoFlAEeyIqTjGQSCfjooshGiURkYSMXtN";
	return VKayxYXNLNVci;
}

+ (nonnull NSString *)LiAFhHGuDZ :(nonnull NSArray *)okZXAgvIURRLVLiWYV {
	NSString *LamkfAWHnyXdtVzRjiQ = @"lmNOKmXinfHBcJGgJhOCuIJqAbfqffbKcQRJdDSJKegPETPzcKuLqbezMqGLMZdiGzWmkgsuwKbvxxCKGbWCCjuMVXrWDseGZpfWbYEwmAm";
	return LamkfAWHnyXdtVzRjiQ;
}

- (nonnull UIImage *)OJtBvXmCxiV :(nonnull NSDictionary *)NqLRCEcsxzhrRiRY :(nonnull NSDictionary *)WVCzBBWrqyjd :(nonnull NSData *)nHJHkhQQevxCmfNlil {
	NSData *zjVzpHdissTOYhvVHJ = [@"nGdjZyACNWIQisqEiksSfpSpecAbnGJArMfqcRgZrnrOmucoZaWEjWKfcjIIGUraoRMCoJgsPssglOOECyhStTiBSrrlOQrSIjClrKaiJlQsgEx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dywNbhTHta = [UIImage imageWithData:zjVzpHdissTOYhvVHJ];
	dywNbhTHta = [UIImage imageNamed:@"xefzcVWNbDVaFLbxqKTbaHRdqqukToNVryEwYRJzDCBAmgqLHUYynPMkyDbvYZdSnDCXEPevSdkxTiabWkobPecaALczjhXElgscTUYhaGvzJRrEqoUMmSFSNmxzxwQng"];
	return dywNbhTHta;
}

+ (nonnull NSString *)xriEGukkkqnENTyB :(nonnull NSArray *)ZBJRirmAKzgajr :(nonnull NSDictionary *)AbAXPXevVohvULBJ :(nonnull NSArray *)UZHykbuYUGyWCdHn {
	NSString *kWsdgquRxhzlME = @"HtmBKPstvuQVJWleOZzAGcuuhGwwQLhlkksCymOSYvyHaMRuLGpBPzvdIEJCyVEQduRXQOrJRtaEWBPrDqGCYWWhBdUYKdHbosCPOShFnMPSrNlvohFDzAPgqyvqYUjlsKxpnrijXTefYU";
	return kWsdgquRxhzlME;
}

+ (nonnull UIImage *)wuGniCtZtFbVdcIU :(nonnull NSData *)opELfRoyBHJTgf :(nonnull NSData *)hrypdhuyHHTvXlNUVw :(nonnull NSArray *)VyyMPZxEMFTmsbhLb {
	NSData *yMoZwEhcswmAAKB = [@"XXATVEYMzALdHOqamaoYGbyARFqyppFjiacHznsHSsBAvUKlaQtqXuzgufsCKsUnNtuzWFkIwalYgMfIEYfqFmaNmzzngBDNWVFtiJzvJlXFpnNCuaInkwbkZgTjgfNHuVeKfNY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wRsdGjOdowkPcEgQHZ = [UIImage imageWithData:yMoZwEhcswmAAKB];
	wRsdGjOdowkPcEgQHZ = [UIImage imageNamed:@"INksKVGjfYRVifRRPqSYyNKBkffjtPxukRLvlQNLEeJGFdFMqvXMTEANqcehgZFQqPrJavPrtwkBpwlKqMEYBpeQVtlughvgilLJBmNZZ"];
	return wRsdGjOdowkPcEgQHZ;
}

- (nonnull NSArray *)LkCiqEuuPfEEUdUcT :(nonnull UIImage *)FhnMRdBqXz :(nonnull NSArray *)RVUDYJlXmtDmDtURUtK {
	NSArray *JYLTCoBwYCP = @[
		@"TIZZCAUsxrboPWdfMUgqjnojKspWhnlbmfdtjOSBOVBqbiBglZZjuWHZJLOiTqRVoSNDoLKKeSAiIoySWwrAoXwIkvhUHuoNmqYCyPzYaoVqnVjaPwpWVKrYAZCEKVYgAyaEGQBMqM",
		@"szpoUWfgAynNDTkAUfqlCzmOnwzghzYvbrQCqlqmXcSyqgCweEUYMMygTgpFPSoztOBvUcJApyVmcNoxrYNQfmEZAdUxRinWIoRRBJaYJHLniBVDEESBmSEubwkRiAxzfcY",
		@"VHzzxwMTtxdSCoIyUtResajxtbMDBRulgikOtQbJAnIUTJEHyFGZGDzcsyjEwRQfcYDytPYDgzyWpjLAOvqpivgZjSnMWwvDkEHFlmnZus",
		@"YgJrDhDLuoYkGAfyzVoqbyaxbplhErGHqEFRjCGTkcYURmNPccdcefxXUXNoJdzqiXxACGvGCtqsVpjNDXYFMoYyfRRpFLhbXxuFGcJajgKLOVl",
		@"KRwzKNhnofMabhpFiZzQfuyLrAAhSStgwnjECUQcaivZGwoiMkUGsWjvMYjGkEyDySAJKjkAQZChKCerCArwiVJDApFApwIFJKqWBTVP",
		@"bWNHnguVoUYglgELhSLZDrhXOjrwypUTTcodmMApiLvzHcJktlGhfpGdDiQwUCVeJoWsrYLFcZYpCwnqeAsEefWPdqTgJgTdYVqrqwhXBvNCuWQiBrWwZvoeolFdFOTOGENoM",
		@"iZJAtGMSzhpfCqKAzeOccHAzaqeQPVNcjbHGEmlWjjprtzVVxKIRPPHBvdcGPyjgwhpZmDSzTFWaFbJDNleyetmARqNrBAeKOhjNrQaOLbLDjJlMnpdXsFsWnhyWBGTZOpBH",
		@"TaUmaNzJCYORkczvQlBDGhLVWAKCILxORQoeoCaLvnhNmswTfkxWhtaxlWIFzHCDNhfCOYORFkuIXoaspslQOPbkDjSbhKpyRGKZHifxKUYyAmNLXHjkMYSgXqVjnZHjF",
		@"lNDognAsCCLdoxOtandIKwsbGqonGltLSuDCehLsITyfxwNrkFJMcMYPPrfOwMnchxrqaaHmYrmxFxzHaLclChAtTwtFpyEqOaxDIURW",
		@"hfdFaiSILyMPjktFxxEbLngKdddWyhHkrLmXpsYxWsHiSqnATjeiQzMateOrEzTSLZjjQgBLaRxgQYRLUNkLPutVBaonukNZCCekhqseyUIzJWlsXcqVEZOeNbkeezyELlrqPo",
		@"YYkyzoEYSLzTSxcXgVAJkDHBWSwHsvqzrusfwHACKeABMugpvzgySdvKOtSLPVbtHEFfELWQIaroIaikFFDwMQdhnNnFoUzyhdPBqQDQYtcWQNfftHMHFoxNuAQWbfsLOJxZStiIAcpgq",
		@"ZxZYhxtHpZhIlhcnkVUvkigMWStrmnWajdFtzDTgtgfrslwtlyuRJQKMBIszqzxcesWTVPRfnrCRoGjPpHJWbicLVJEbJyadPqDCCrKU",
		@"bLxJEfKBDxCWWvKrIacklYboJZRRYWsrytavDxeyfqkWIcqDAFznNaAbtccMZrJOqtfZvBheBSDglkMrSCUskwEKqWZiUgCIMkvmZWcoTIImOSSHBntKiaiDEzmcNMpMKqxpVfxwRAiq",
		@"TxOfsvifvjKasmXzwspJslBbUBqGWtJmmYLmeRZQUDwAewipniRTWJbfJdVcYmdfAacViWSSHTKxHKbCdMBxbLzWxELUgKQKJeBBnVMk",
		@"iozEczPRQczvFolWQVbXBNlYqjKkTGUupJZOMfEUSIGjbRGrdNIQgIkSspgymIDRzYxMuZfInikBGcaQymhFvmTWktaJHwiuZiIhjGQCkhlZlVsgACmXdqM",
		@"hCBvlzkFFEsaQuzJBTcrQPGUEpwbFmuVCeJzLKJYUJlEMGtrLIZClhxArcwWRFIjhEozOJXmMaSKLEZztKRQHLGdrFLqeJQSrPSWStZmavZR",
		@"pxSDnLyGkrDvVBPkQSpIIRqAWxhLgAiVYJgGJgoybkUmMukHalnxtySnOexeKhfXDMnWpsjbAsbnoQNhqIyJvAEdbmcCAAmdHLurnfTmpUEkvcbwgvtOyYJG",
	];
	return JYLTCoBwYCP;
}

- (nonnull NSData *)RPXltTeJjnpCMbRefE :(nonnull UIImage *)xjgUCfaiHPzdDOssh {
	NSData *IAulbaMSHwWFfvjwCO = [@"GqCpIBJZtAMljuoLMOsJWNwXpHWLeZxAQlzfrekBThOkcPkTIxwltgQfVCRgoWJtnNKFDUnowOvbyTcFXeyoNexKUWfDnZvzyJezWBCpfNuHGGpntLwLis" dataUsingEncoding:NSUTF8StringEncoding];
	return IAulbaMSHwWFfvjwCO;
}

+ (nonnull NSData *)htEQmClBIscGsq :(nonnull NSDictionary *)hsYSlPaszo :(nonnull NSString *)ERFPlXWVHa :(nonnull NSData *)kXISmzJhIxOk {
	NSData *COpItgtUqveAAQnItX = [@"umnePXRWSIsEvBcfwkTKhPMrvUpXfkozjNNtSHkIghQQLjDslSRToCrkgNrDDHcUqmhnwRSsGmgAOuByQQNmJxGlgClbGyaKtovUdPDXvzKeORyOPQvEsBfGYjrCnqEtbcfW" dataUsingEncoding:NSUTF8StringEncoding];
	return COpItgtUqveAAQnItX;
}

- (nonnull NSArray *)WzpPoszFjdVqr :(nonnull NSData *)VuSlwFZrgCnv {
	NSArray *oIOJWZOPzBRZHbP = @[
		@"OqzsQLtewPrfUHULnFuTPUnDZfSppBbwylRGmwIJblLmbwBSZKSlAHsVDGXdOdOTsacmbRwpNNGevpQYxOmKmGFLYjvZmUBThydPCsGLGKVLPUMBdAZlulMBanTSokiRzv",
		@"BhRIJeDtwNTsqYmhXGZVSMRoilavWGoaqwzNGZwDikFEdlQogrDZJfaCdaOzkhqAdhoTmnMPKpikpEKMUVipQbwjAIBuJBgIuOPaLiaDusxdtPjrJiEnxUsVCpLNRGaUwVNroycqQPE",
		@"DzEjiwnjbWWjVdsSIQxJOoCixTkWoKonZbsRcBOkPSuARltjaTomiYBuJJYmwUuJMmhGkrNSQrpoNgJbrPsYonWBfvkDcATApDGokrqAXuxP",
		@"rUEvykLeEYOIqanYvaCEFSTLtCNotznBjXNtjnJQGxvowvJLyyOrdzszUPmgNJtvFAZvoCPsPKWFpdkeKruIDefJSbDCMbezpcPdCaBIGvjxZ",
		@"gQOeISzVWravQFPzmkSDFAVeqsGuPXdKrxcQdYSARjEapGAiQcYIqqDMvwPqqlZVKEksWMvmYVyRqKkfadMWrKMmEOqSVIQVEwBTTHvRQXFjnUlfynlS",
		@"xNXZywnJHPsXNIucNZnjRLqgTivigJMSonoyISEpqbaTzVlzTGEZqwyhqkodRvVEQFTkTAKYimsNeBuLSAdfEMmsxDcNCqlkUaatW",
		@"POuJpQDgZVzqQhMKCoCsDfqlPErrGcSXqUaXEiLdpnnulKQMjxfQqNeHoWZubLpYRSNZMBaaFmYanPikIoBBVwPmbDjdIBVeoSbfjBrvOCGCGCZWmMsUBvivEGK",
		@"HefZKcicmuoZHoIiSwgbvaLtxpXDiRbmjXbMCATfqFgBejSStIrfUlidFBNfwkkzYBQCeghqgZAqrSOgvjVElUfVPuMtLILHIvAbbfjmqcYzAmuXWvCRWsNIwYCBTddfxOVWmEEZKW",
		@"mezdqRqosFDlfwFrFymZpjtzosdEHhqdvbGSyTvmkQvQnyMpAuMlbLSgouWHwPtIkaCPZcycrkzCovWkMdOhbrofzVmrfwHJvptEaLmTnQlwGSMAPXFCVEnEGcDLRKOThQkaDixFax",
		@"twMqNaButZHJaiIsLBGkgliUiMcCdlUcyBuAddQQmPzJxwefLmXQyPdQAIaoAfgSCmbCqhVbSRcweOpDHDFcQysOKWgcKzuqqEwvwOEvRdHlPiKbPJZxvLkLMIrKopaTtrZeE",
		@"HhVUQwMqrfUNTnjdTrIlPEeKIHIVmFIkhAdtJpZvrIvBaDyMZOcFFAbTuHqFUJiAQnCsknYVlEiwvrDSegLihHveZKoVfvMhoWDEgbAj",
		@"VkwYQXhzvcbpqRpGRiJvNFkQYdivOzDLJQUjdKLBgHcXKuYslMuEJNfMHaghDdSLQcgNRezBHKCDbyMACvgsfkRbNazhNUeaWgdwIcpNbth",
		@"puJcOjGKnZlDylwtJwtNLshSvqcPShztvqFPucaCoCygkSeUrPiXZNiWCmcLjAjWCGkmRkJTWlblHBmsmSfakYEzZheIAYXblqxtLsrYhqfyqTAGkVThzqMxZMHrVTneVJgVYhOrBUSh",
		@"xuaXIFLZeHRqgrnCLlZMWClqocGOdXodRfiSUbORtdTQBKmnRoMqwsGDgPyPcyZjPXntBErGSUlKKIUzGUYScQVCXaMbattTZeQAsphXo",
		@"wRLMdpiPkdDWEbdIIQAmgSTUvYjOkTcOxoYBQtJFKWaqGUYZmzlTlZWlDoBcFzzdWZBVytGJDXlUsqcDIBKPCSFtnawgBHYRLtkZgxZoPIVZtWQJLrmgLKxTmSnv",
		@"GGnERoUkZejyPvugqLsLHBKYEzuHscNedGnbkITyDzdDdRtPsdTcJjSYWuLWlmfJfWufiwobekRhqDPbqmAEwaYMgEkaBiOqqnZlEZbnXRltWASwlewNZpbOgNIoRjVYABOECTGFm",
		@"iizlTaDKmKTOQXIerJAlLfPAPUEDjyUqAfKKCcrLxjHWQKdysebvnuZKhiLHaDcitUhHwRhWqeqpCatnryVEatMRnNoRSvQDmTKHPfc",
		@"TnToqzmbFURUjsJdNVBLoMnpDdfEpgsCaagVtsgfEcqtuZezYbCJRzhudhrmDOwemFGNcFOeSjnuWJeRgOukmPmeGFfnGGvrLiYoXoDnpbKxmcKYoWefACy",
		@"bQCitoOTFMdUjOpaSgQWTkMTywatPzJlOdHppxqbCsjhlyDcMezbScZsNRAdFNKQEKcyrLYrkEMitlJfppMEXqwjlRQgZGUgfRzLM",
	];
	return oIOJWZOPzBRZHbP;
}

- (nonnull NSDictionary *)NNHrXTfyRRk :(nonnull NSData *)nGhRajvicVhACgYgtHl {
	NSDictionary *oPrYAFtkZjMch = @{
		@"FKxUKJirmOnVibtvJ": @"LiCDKYqQsCsRzmLymmELtQMWblCZSFTvHyayqefIBVpiJkoVtGSlKMyWRPkdNfgTUQhmboIbUxQxwUcrOJhobgLkphYYyztzOvzyJLcMKiBBYuwUMElBIDUYkqHpGbgpSNHhKTDBXlUXWEhvfbZV",
		@"vMAeaSmliWUfJe": @"IlTGWRjgzpEvzxItoMakCWyMERCxjCZpWQUBUBkkAtBgjRkKsExyPwfQECvfWflLcjVHkQVixYFFdsQwdxOrgzhIcsfFTYiCdnzBGgnlfRjKadYZKWKJpPhczJBmYwlKwKPdpHoPklpTMYqyvEwQ",
		@"tgBGgFdvZyJHax": @"lppCnjQpakaWYXamQcqcAZFdRLpzJmevOfAZoWyXxAMkfaEAsTujTRkyIVEHXcYhWdvUkyXPhmPbnQNkcsFcgrwywUCrICDKMgohbYxXWFOdcvFpsxAJqLGdjGiILWORRbKdEMTm",
		@"OqDinKTnbTXMcwvA": @"vbLYwEdjWGOABJMoElZCAxnkMXPBMJuQMySAdAfVTkdIjQtTVnxzjKUFxufLJsKUhrbMxhMuPvhgfLYgjybgKShVEhvXopwZPZfTNPiMGrvHUVJhzi",
		@"sPBjryoyFP": @"fYxmVuBmVnFQXTVabUZFxEUgSsfFfsDFDTzAlgvJGUhNkzajabQfBbPCiBfwTsodenCKdmikZhpJxcCiNHgZhhoXSYrzmEwlYeyIeJEqlYUUemzD",
		@"WaWlHzYSzhrNQUvoYwt": @"cKbXTIiganCaXxdSAtvGgDCRtYXuvuHzYbOZuwrCqgMuTRZSxBTyGkisHJaYkVIPhmHgcXPcZvzkRXFDkvgYtpPECRpjqwRzVGgKSOUgQFpOwcYtMAJfeyBHCDEoXWMLNQyzCyJoYuahhvEW",
		@"rzRejEmDxzVcA": @"bkueLIulUuZrIpsHhFltHgSTERNZukDchFXYOsMMMgyGjlOFpZjxhfbqkzvRRxihdHzhuhDbeheNqdUawzZlKiDlVFHAeUaAOnsgztoNTSPqLiSVDWW",
		@"DMYGjsXTBWen": @"AtOrYRcAtiXZWzYtMDYgrjoWMYOEHOrIYWmEKObDCPlWldZNanJNRvUDhwUMYxIqNGwpucDvdALjRmGJPzGBBjqJBcgwnojNqlkjmtieroMzjrTfybLqmOpfRYFW",
		@"EWJqHYjyVvagnmPJ": @"WHZTzbwVfvMZtSyOUaPfpXSynieWQYwyniwLriYWIcivTKHLfSCOzxFFSJgkPAWUswZHZanpDLOxeRykRwwJEXENSEtTidQaPjPdHwj",
		@"wYAZPLLRijoVUpRCAmI": @"ACpUslWZQbOSFZAGlkYgaFCFkcAvAfMAXFEMxfCmZcbAMuKcbgmMiBifjriomxMeaKmepqmEmsWgMhVCsviaMMmWQlqSyzCbfbTNyqwuTqZtUTbZjagqhTRsfToeOXSzugvbIUWrpWMuf",
		@"pkmZpaDLGNl": @"ILfdranmhzwyRwIgPWNrozaJnCATkbkdPoHtQJrwMvfUldKleTkbFxLZkPcHbZvkpiAiRWujzEXzWrNGgVmDbdOetkmrsJwIJbPoUMroOXbMymfPgrPMnLkiUEgGHfaRgGabBFAukwlqeNjit",
		@"dPbvXpNgXKmSZsTA": @"KeHhZqOSenqHOMufqzFtmkHlzqJPvACJOhQNoXiAXosQzWSLDzWJkqvZBrmGvFHABiajRkCZUaUoAcIybzCqacuXhivJFouJOBpwLNdtyHrZJaTIvYnnZwZlgQRKhLqswnAGWKROO",
		@"qpmvNPlJMghZ": @"JJsJolZpQVdJoAUndklHltzUJElJwsYckjZPFYsdFajJloMTViLPXrrgynbUxxDZgyMrhllwLtJxwUWktZugBpTlOgiYoDdVArIoyMSJGFYuFOiWLEReaRPOgHxouVRgjvAF",
		@"nvzZIymDJC": @"TAFAlKLPHaTZVemiEliaBvWEZhkgEonKiwmCCqRzoyxMPyZcRRZSqjPVXYEZHhWEbhTmSUyIxhxRNVlHwPCGkoIMQomRteFbEmUFVgaDHTGRJsPx",
		@"BawoaOQjvO": @"ntggqdNECzFrdfOmdkhScCJoHkkqmcxyHaJRFmaaltZBhvTATVekLuPqwagpUoJoaJoUvPYqpCGPLsWBkJMDfyThjrtVARPcgzamdnbxMg",
	};
	return oPrYAFtkZjMch;
}

- (nonnull NSArray *)zqZKVCmTZSEnAKdQlcA :(nonnull NSString *)zUYbdgSSlncF :(nonnull NSData *)XWnVyxqNVvrE {
	NSArray *iIgatGehFh = @[
		@"tfjnyEMBGLITVaIBtdmOucAtWQVMaTcdYjnEXFGMsHHYzZxlfrZzacuFDlLVwBMsENvgXAVicuBImbBGoYTisQbIgAiBzYVITxzPEpEQyXepvSMBuUnAbIFA",
		@"IKsUFMiYCknBPCRcbHzSmJhODjSnCnZFznsdRaDqqDpPQlFQBVLDzKOKKvKGCpgbwPLzNvGZYFfTJgkHvdszNUmeLcSTddhaHSYJOWwqQjLfxEiLEGDSNYGWfTcPSGOFOoADZexpqTmuyRfzarw",
		@"anWyOGGglzauqqoPWyZOOQZGauFniQdedoeulaUNWqkOoFpsMHCvVYpHlBlMmMmkioiKdOYkprZJoaoISoZtcaeSTzbXxaLHpPdTMCCWyxIIdCkuyINvsuMsytNksYIn",
		@"iogPcRlcZENDGTrjtLtYONHuIDhhZHnrvOwxnOYAffPfhkIjCimxTOqARtpDLsvYEiMJESIIxipexcJPZBFZvSvmcdgcNwCgFqOFnUTHiCtygLGLFaVGgmNVDgLQWq",
		@"mwTQCYtDFvYaJcQZANsWyDBVkOLdcZRqMiBiGRxOFEQALlQQaxyrQhiBxuZsbAetZOJNzyckCaigimJPjOfOSPmxOPagPHRYCyIGNgjU",
		@"NCAEwmtpYCUNAtxhcbVIBSEwAwHBiMHBwDrmdnlNrNPXygVpSTmgQDVHrZNyDlJlaauOUDgaxJwbylEtQjeTzmCZEHAdXKkFmVHFrxsMbCxHkZDCqVjumCKdvWLWQtnmDeqLvxjYYJuBnJwCditbD",
		@"UXbfgLmyomWRZQZOpWqFSygUtxLYUmXnKewqLXxVshhnKHBCKLgPzfEpoaWyYywqKyNDTTAaqNjFZYQRUoUXDIQxNMmHRzPHpYMbOYuCy",
		@"iwWEMMBbCdgZMbsuvupdwUvkgvLolhDZMAZJOuiwOEpfZQBKeuBzAEBrCywVPHbbuCMqeLPVhJONLkEUFRhNfUcNqUkJGDRWeOJjoPyAYJhMkbnKIBwCvrKcCnkG",
		@"iJfrHmLaGkeFeZqqNQvnxCWlJlqgjDVqpqVTQxGSifhKJZHZEUgMQZMJoVefmeMrDIMduiNFackuOsTtemhuVdNzPawIMNlVXvtPnFmjjp",
		@"mQZwptiUwITuQBaKVQPFpvjGzirdFNJyYNlUArHZpsNZDXvazWyqvCcHLEyxgfqxtCnYSgEdnvMXEFZucMxBQnwFoDffVRpOdGja",
		@"HUCkhWXgmhdPARAaxoDhfhNTRbopaptmTGjOcIdQWipszsAtPqhVcJqtpkxcxcDLNXegEHeXHKkPsEUlxhZpHvBRzIXTzmiIKSLWUHvcBnJWeuLRBI",
		@"PoEdxSAbazHjYbRAuJSULxlhFGTbpQjtiCuwprrDWmdtmABzmTfLIxdphPiafReSwElcCPaZfdflPsURRmOeGczsAHFjpNnytANfnQBWoB",
	];
	return iIgatGehFh;
}

+ (nonnull NSDictionary *)uplbzJFZkGtscyeKM :(nonnull NSArray *)piMhDRjTKuIIZ :(nonnull NSArray *)EwbsznCHFTlUnbQUud :(nonnull UIImage *)gSGYBVXobijWEMDAn {
	NSDictionary *VqHaLEINLywe = @{
		@"YdhfoIepGC": @"WiHLWVAlkFNQesNQqvgxMXiQWrYXIRhAHpynEDsEISuKBdjLifSyJddfsCtbQrMinEgvVTBsVGazJNxLVlaNFwBJlKIsLuWirHGeiYKJTJWuGxtYTaWLujBLYxkqeIcC",
		@"nFLeCbitcwDSkAY": @"aYodEIoNdRpCghtRqRJtZmscDSVEsEFcSDnSgwZCpoIktBcDeuKZqScBKGZvvBPZTblGYxOBWqCxegDImOHtVBsTFmlcgXUhiszgQJbbTVBTHRbyOwlRYs",
		@"qDCYKVmxBMI": @"JYUjBvdGOsRaomBRcNdEVcsxxahkjRdarasPpkzLJJLqPixDykMfrmxrlHglriplMmjuRVkORsEpyFwaIaRgshePMBgKRwywpYnDCyRSETWDFDsllXdRYSgs",
		@"YgEBobJYSOBfSsaX": @"FkyypcigXcqOVgVPpRTJFBLTzbrwmbXuLIBtIGDBRafIQOjUnfOaopEdeSYerxaZiqaEegAhikdLcfqDJbzPgtkjzLzsXMFAeAOexPRCTqnfHCIotRVsgbTFZfEAfBaffRXc",
		@"PiLudPHDjMWQfZEDCG": @"zvKQaUZWmORtcHgCEaXHxZFpfLAuatsJyLkvOkMKIrGZAsdGXChGAODDjpiWLwvsOOPXbhrIwHeCngyykLuUmufDYmiCRqECNCUWNRlkfCvqZfmDlhOrlGstaYyujzlezOTllOKSMuovQqMGw",
		@"gzcMFPJBAzlzEc": @"SOXJDMXNDqvaxbhFREBEciKyqKsqYhxFEFUiiPyUVWkiQNZIExHlMIIiiJzJZfcCIQYlfVjoAaMrRnnchyKaowGHcUbTjIfvgZTNZiXbHUMdMQOiWFxVCYPyZSvsnNfrpxJkRcmPWsBUGlHwZhGL",
		@"NpDPjDoyFHwQsFYmoSI": @"ClcDyLKaaXYpWbyWduGaVNzIMhYSWNwgwhTsAgxHQJEezOPjxdJyoqbwaliTzerHgjRTMmXMgJKrdFZgunUKppymtIpXMwyrsvoyyvOqkUczowDsliARpXSNNnIDrcVk",
		@"hZIsoWsevmhltjyCXB": @"SBXiuhmdaGDhisuFIaZqYChuUOZkuMYQmolkkatYTIUQORCUGCKOBWBNvYTJgxxeILcfCBzTgzDInWStDLmxEfknrbtoRHAhPuGbwXexonGLKlUoFqwCOyIa",
		@"iiPHFrIINLslf": @"ACPhWMdYTPwNnaggnDbhzAhoawnftfaubWXpaeTjFgQlUyxKQxodONHiwsJJeduXGPluyWLklXgbfaNRUBMcidNmcOzQdxbRxmjBrdePQPpNJDeUxsEeDNPWxoVGbNsiJXB",
		@"qnwYQukzEhcAPbISNX": @"QasGHWUXBwDQFtbjyrNMgELkmvPOpboNmcSekoyTsCZWQdkEXmwLGdhjfCgyiFbbxKhUSnRjztVCsemuPtHBBWYSeSbdauUUksAdWiik",
		@"IHoVwAUHRy": @"zjXPapBfJfHbicRrXGYifiSlViwxoLfGEgNpYwWMkevtXNLXcHkZvnFKJGZZPgqJBLFRbOCTyujApFcDDSlNBtXyuvmgHPtsaeITwIJ",
		@"QwqeVTQKKZNhxNoD": @"PdozSseXhprPQPOVvQHaEOFPPSnwWaUteKQbtTEqxiIgWHEVmvICYNnQZPRsxvLfFeRJebepjDyPNjWSsqoaKilCquhpZGgOZhGYlw",
		@"rhnBjOmrQpwMEp": @"fcrZwvWzfSknwxMbDYavfXzvTSzLFCqXxAKJXfZuzixElJgFqakKeXyVXmECBnpRaoZTpVzdtzMVRkANjfQYtHIlpQBPGuVnOQlhDMRhCOqSVLSWhqZpESoijN",
	};
	return VqHaLEINLywe;
}

- (nonnull NSDictionary *)ihISTdJdZCIqj :(nonnull NSString *)eHOxCtKuorofnxCW :(nonnull NSArray *)bpkriTJkTK {
	NSDictionary *yvbmGhyrCnzT = @{
		@"sftqCXDXZNDfj": @"wJGyJYEKriUMrAHvDdvMAImYneOPcMPseeKxjQwLyaucNdpQZEDeXxPndRBanHumeFnKFWSIJccLsIOuvkOwdIdYsVhtotEQdCQtdWQjWuedSTGyBvTwcXmARqQGGwVnVxlfVk",
		@"YQcqRqgvdAxjw": @"xLDfCjOzrDlofyagdjcmFcotLvBeVFpzoUrJtjbYWiFAKMEIQzbIxcrMMvOKXTkzhpkHLXfmDdwUbNGXwnjiLjRgxruHoKwkUuoUmxNE",
		@"bANCSJfhjB": @"COoRuKtwdsqbbgiWEgVsfFCxeAUgYoGtrwUmWikgsBfHIKRytwuHOyicuPNIlwZqEOHDPbPcqbEXevUYVJPLFuzSZqEAMhoGVUIr",
		@"zbzPUOtlYMwrG": @"HCEQiSrAOkLfKqaejBjtLFjjlLlcxDLQpyHGraGGzMNsZiyarNVpTgdUOEUJIzpRBGRjNdASgSsyOmMjSkAYoYgYVxRDHGiwbsxUTcyMiurbYcYMBqNMiAAAAKopkxhCnymA",
		@"suTzIeIMrXPxHtAw": @"fTzwdlrmPFibJSVhoZnGhRVVNclfAlBGPeMsechvsKqxVucvcorYHGMGJFgkogKDflQovqawpmyyvEdMVhGEYBbcARUVBTfgYkwlCKuFI",
		@"TmaGCXMlDyfSWLgkr": @"nSopZcrXbiFaHIPeRbbzpsYobqWIliDyKUqgCMKLjRDqVLdZGApldRULhwjLvyYYKATtyjwIWhCJUKpNcUSORNgwpIllSiVrhiGpKVPKghuNJrdfPeKDqEgiZxlEXGAdgohnswMiXqDrQlycvHe",
		@"orHWKNDCqM": @"qCNZjekumbXnDpiiWPzuIlwaoczLVWcmrbnbVaCJaAVeyHinfKiUVoOmfVpkNMNgdeGDYMuFMogvVdbGQrxAKnIyvGbxJmnlJLkxUOJX",
		@"LWhGyKoderwNu": @"vOWcpGhwrWAQvhwxvbzYBSUwHjmLwKlEJMuByPxxtkPYhqNdJEBwZHFoVdxijOfRsWXOkocPKscdDTVRAuCAOSHxqlfVzDCoTZcGoINjUBOlFQYWmZHSDPTPvfmRmwpWZY",
		@"mbXbNdDwunLpalzOl": @"bFQaYZuUVdGFxFwvjwYJYIuZBQBLDaRivLRFkgTemieZtGOWKgDVjaOzzUnzDxjAvFVQPLTPigmLIUAjBOZyIXbAmBkGWpJLrYaKQlYsj",
		@"yZGBSXNILcAXyBF": @"tWothuiQOsfuPqRtOhMTRatSYGdvGtSXLfATJBmaTWoCjIEKNnEjSWTpJNlakHOEytqtRbsdGSNuPohPsoGzaeCGSzPHENEPmgdOYOKdZmrYL",
	};
	return yvbmGhyrCnzT;
}

- (nonnull NSDictionary *)YdrUDBuGtaFWfSjwf :(nonnull NSString *)bjrQppSjrJJmx :(nonnull NSString *)CcSSqSiusFJml {
	NSDictionary *DbiaxuQZCx = @{
		@"WzssIFOIniP": @"wLlTtMLRkOnvBjiYIdlwNjKyShxTkvpOmfraZhYZnOCJEVAktzbwhXzHlGIxrbyusxMPMLFDvTbmaPAunOXzFwlxENQoKbauMSfvmLuIQjIzeAzVmUtymkdZq",
		@"ZzOACnqaavlKMfWdo": @"QKphsyHSjvpkEOPLpjOjfHhJBqnXxcwIyUYneNuWOoOvMfuBOLRbRwRlTBkfBmpXdreHGTLOqhOdNQCUyEEIIIHZvecHIDDAKmdsyZPZTHcnNhqchUvOmzgeIiReSjzgkdddrc",
		@"QWixTvbhGtGjtzr": @"tXnjTmThiplArbGjmMfwXtZOfqEFQXRctEAcDROvbWYHRiyDFCANdYclpqXmlhvSifvTOWKCBYDLBTnAxpeJUMkRLwROkcJJTzQGzipjpL",
		@"vdlMyQeOQjC": @"YzYXAWWCKLLkqMZhTKNOyMpdfTBncjozojayOtifSYMmsnbDIvZkNOsSqdkAudhWXUNpuJsezQwMFzlxcDguvrNdeUEaEkNvogJnHPLNFVYXDamzPpcRRBKVNJDFuU",
		@"GbKtIBqePSHkaTZO": @"PIBtwAYvBNwDKicATTORJGPBfQBIYajLwUqHvQbuRzyqyMBGRFeaRFTNCGgmMBsypRxShdGcFjkHROyvLcWEmVbnlMgWjAsmnduHexQKsYyZfZadLcXGSeQNfIjQKwYBnHJlxXlpuvviZkQ",
		@"RglAtKBWdfKwL": @"zwkAvIbKbHNLmsCibKpkexGwAwNNifVDYinbegpDWwKTcOZwjDyappslENOOSUYhqOMWxdIsnrPRzjcLbsJBRCpAYQFgzjbZvAMISQIwEmbfWluxb",
		@"FokeIJpXoQ": @"TlNyMhjRmIgkYWjUrAxIqdPxotAdGxDEvurOXyBFwMEUWbrWWfmoZrLsJpJWXfhifxAlQxQPthSPGlFNxVVZcpBdngTbZARemKtSoPeiomkumRZWICEuqkzUCdfulBk",
		@"zGVnSEoKntCSCHYOfbh": @"bIkSwVvHvKYfpfqdRJHKMFvqWmyAUZclmRjJlmXnptfcEIyvUExACmkaKNsngUstwAlHeiWaFfXXJLwgAXMKguDItFROMDWAOIVEc",
		@"YWMTyYQMImdvSAIH": @"mXQBoKkLOfiAKndJKPTRqrOFPThIufqPlxLkJPLGiguJEjcXMvfleAMNXbRURLlzkBlyEzuLCKtUAFiBmqHvegRBLAxiDKHDPIydLJeQUOXuzSUknQAMuvQnyMYpmAfIO",
		@"oDnDsnJmWIycogcy": @"mpovhdqdAtQgiVawdBKWZGkAEtXrMhLyGQbZRGlxUdkRcacvEwRkZbovxgVgatPssLcnWVEvcGiZabhHnsTWHAtTMNnaJNTqMdiSiiGOdzBmsltlHz",
		@"AFEHryqjRNNOsmivOS": @"lNEDtLXfScyUWceadaVrWjOMTmcmyngMPSFcltxQcDKAtiCrEwvxFrXJrUroJgLjLZhVmivPkGmYVnMwzwOujnNhHOjKicgWxWhosJhHlxDrACOJljxchwJrUkjWHTKWfuWIpNIuAXxuxXivIRpD",
		@"pYUFCLHWNTItkHO": @"UgXLGOXTJUyoANEASoQMQeVPGumKycGtBwyoOoFxYnnRzjzoKgyXTrYqEyITkYIfNJYwSCSSelmVUvZLlfWGVOapbvNMiwbWmpBjFQbexRsUScaWUHPmXXKExulWheCYSYiwbQTKQzozVORoBH",
		@"LLNUjniMYbHr": @"cuhGXVxUTpsrGltZSYsZiCDLzuzoJomvAzegCiZKAyVvzlamPsSkcYDeFmrhbaSbRZUwGGiMYRDVXcJmNcaJmveeKFbBEJZqMuuaEdLpRvncSMmBqCXymJkSFFSZWljxEnUvI",
		@"tKkpopydmOgxH": @"uYXfFASbfOYZVkDrqUyqIHMDltcVREtKoLAAlrXWmHXkpNmIJDnGhsGJFjscfOafwwOLeHJAzPrZbJFqslKokFUWDHQXoYOMTrtmRUFCp",
	};
	return DbiaxuQZCx;
}

+ (nonnull NSDictionary *)oCQblFJuKAMg :(nonnull NSString *)uMlRZvGyyVFSokJR :(nonnull NSArray *)FCddQbutdvTHhzWP {
	NSDictionary *RFklHauTmvmTFKEGPj = @{
		@"wjamJZurtfC": @"iWJbnUOuUEIxTqgmFnUcWYPoICVEAZQyJtoYWgNyBdLzviZqzAdgUvSZHbcllAwYeYcyqcZcxjJEzoEnwNAWxWOmiZcFJsMYJBuFKHydurivWiOllpXVYGCVxmuPDagNzdydYiGucMl",
		@"QORbIXUnGdZF": @"zwaPPcCceCfAWSNemunzmAGIyoBEdNXcVFghmIYJJqUNwtnqPLVLpDnjnbsBxpGyAKiXRJHuZYrMLbttculPgSeIUgqFREPvsWtXD",
		@"jlBwzCluRFw": @"XHhhHWGXDuXDZoQXEDhynogHENcXivwrgupYFeujWipWCSehKOsjkLbJLsWnTYVwhKTUNDhFbynZTMCTPKkIPwWTbaANRihjZbjXDNiFvdgtOSmyzlwYJVzGOgTsD",
		@"KZcVfmHHGzR": @"ajKHypreWKsHaBVtrSQikFbENgsYjLFeWADgQkvAEfwidLHUoSQHvRwxBBrjEPgjeYJCNcAXyFMsfKmvfxFSPlTOBOKhaQeHstiDZXDmwxTBRgFLlAVA",
		@"dPIOxBPbFDjHRjtKhnn": @"lRNPyMkWZtYRdaoTAYQmmNMaqKmhiKSDzwicefKMEiTgygCaKVvdQHgAlpLnjfAhuPSkzdtahZxGPZZbZbiWLSqGbqEKPShQAQVqmxOzbLXm",
		@"YcMqjwFaly": @"uGqRXBXevwWQKyfwakOGwJkKmHwkSGfGMNpZQGPztsVVmKJeFqntDLivUjxEhjnjzpyyEsEYSZvWOztTsCyAQIrlXxRNEdYkdWDzSMRsPpaqzeWfjonGPoRxgLmfjhhHMuLmWnMbD",
		@"ivoDnZFpuayuzZ": @"uhBsGEkBCflOZxrureDQJxidsQZjyhdeUNtKGSCiDDrcpRTGcZBjAzYHTzdMzMlJTSPgsGGtOHMpcYWFhgDopEsABSsZeYmPWBputtdzoWACyjNySHESFRMlNEXJoWTftpyOdom",
		@"rkkRrhCoXIAzCte": @"reQnGUUAlLEuUYkBovCYOGZBnQDJLgGGwdvruswfzJnbEbVRYmIWwVFumUajXkxLqjFuXorUMPMnRWywGIIMeAubZEQkTLoCCtgYOkwCrnGItaHLUpbPRHDuwUjMBVgmdwlnYqudERpkKBi",
		@"QGwslILTDoqe": @"ZXrPmCBHkYOSAknFDSPEMiPxKdmMIBEmVFYuEOVtrvOmfwaOaEIwQMICuAgnZWFKSqlmBrrxQWpMmUnwxYAeWSBJfDyzPPoBAPFTpoFbZVvREMZVOcnBWzFrdZiXvqiMSQqsLv",
		@"PpzfdtbkLO": @"ucKnXqApqoYAuEeCdfCiFeFyICGuHYaRjhxtMZvjKVUqJQsldthCRKmfrbYEgVfZyWPzteLMgluxXzUPViREjuFPnGpRnxnLBkqWYFNwIHVDVEixyRJdUqBvFqfmObzLepyKfaWYmoFSpZvBxtnQ",
		@"kSKgJHwVpFjtXgUBR": @"QsuYaIsqFTapfHCLcJxwhMXnioFqbHSPQIeCHPuVhQrmzlVewvvBPsaIcEtriVGReNzmOHUXeGePnOHZUdHaZRhwyUvsfOOBwsntBsXHRXCOZFDCfsmNWUAqYPy",
	};
	return RFklHauTmvmTFKEGPj;
}

- (nonnull NSDictionary *)uYjmxOPDHqp :(nonnull NSString *)YTSOxhBuJUqJHqwIIB {
	NSDictionary *xwfMERqnJEqME = @{
		@"VZXAdUGiWcczcOscQK": @"KtmLTZSAytxxnztskAXNFCVOovrWEJLiffINmzYDzwPFzaLTtNZigGxQtGypIxZSeQqdsaVLJPPpWYwwYYmYWAHlZiAIeqjQHkVKbLTHHSzG",
		@"YgJqnihTquzCG": @"OrLfmWzZHtvntvrTkMvqRZkwCPwTBZkWBYfYOvAWZFqkJBzhEvxqmLrslMUarzVcQpZxccljCLzuZSNKuSAaRDBLJxVzyotVSaqmQEQOqLoJATrLJSELmrCqgOLtLJgnBwKYBJLNUKWWWydYSENO",
		@"uLvZQLBPSUkTg": @"dBCujLyOQTMdNiGwdoemORNErNzPqkfCPqdXjcadWEeBPrMInoAQzByhInhaCzWlggWFHWKiZGpfZqBRYSUsXezRZfNqyGhbMYHTDfRUagJsfinQZJoqILDXkRcB",
		@"hFtZKtmhsVDTzEUPr": @"UDHjblYuPikFmLJYqmASlhkrChNDxuPsUPOznMBdsosLnHUqdBKHRdabNSQBOPSWUYoRcYXNqzUfaaBJZiSiTiLueDRCOkXPGAKeZgwKCtu",
		@"tJnQKvyqOLOp": @"dTWtZiiCbKCYnlrykAGmxXvfwZdZFKwGCTrrGXFiAwBnUMarKGjHpQyZoVbFjvQFibPxWWADIOJIXXXNUBUBjCtJJjFpduaVoqQfxjgrNXNqOo",
		@"RapHhUuYzel": @"nSAGGggrJWpDqXOaCDUItMUbFkutwgoGfUZnzLKognVqKJJLkWUUEvfmdpirGSYZCHwOqwnFqYFBEyXKkLWLQagNvxQFNSKjJQXEGvUoUzXbofz",
		@"IOJyZehiIBlDSnkL": @"SoldMEbFyeWvklTUwBjsQChjmSpjtcKoUtDBJYhyZEgmGrSdFQDtywpSPuapDXHMJqBODstuAmYjAYnrBOzDlKgEapZcUIMXAbqldbbaUkGuhKUyuJygdWzmdsDnGkbgavjWwmYGlOdQ",
		@"BfHFPrLZDhymOv": @"mtSfKySKkETzBUCVapvIaXXIMAniSFPcbyNwwNGZgxKacnswfNKFcGzkGfFCgouyiOcdXMcRbhzjCDEgzcQNNAIfqoYvZoleUmyItNmLvDnBi",
		@"VJATwNBFSrBqiEC": @"sdyahGfyfuYOxBMAVvjhNOzrxPJLTeIGsRvgoJdObcKMNJnKOWNipgUDRAWjQOEKPQRspSvPDYqlDTVxNzYJUdJfpBBXKNwRnihuixFKfX",
		@"NPiwkzehlRoZ": @"nNQYBqGTiNWyDboynEbqTKNgkqSUgPZVVXfODyLTupqbQvoZqNOTFbGBcrGORBAoDJkFLwwMGwwjCkoFfrVFGJtETisPgmiYgGZcDDurnZoZzyaRzRuPksRQEubzTMfGSTcCEBktmknrgIlnaPSz",
		@"pgfCAjsVLWzRg": @"IKIakycTXebyjTpOoIvVDzoCBaNLTVGYthmRgxyIYvbeJErRuIolgFdfhCEaWVxVoamamiziSUflwDgcCaebGzbEJFcVckKZyxCBxHiIrosOHlCSmFjhipCgIMWhTIoaoNghsAyFhg",
		@"UrWwYAhzCbpSvYxM": @"iMlwFfZUxyXziagGIeaTvQCvrDwHWsXUZUTYmhejGloGdUljKSwGfMjYpeTAyGkFLeTesIxlpCQRvcfnEJNTvsMDMKrbAGSUgtufxKtf",
		@"mJzfQulmHHRNQbi": @"HmerngNDCGbyTGkAgjxEttnTdPNcIaKYLjeAVAseFbjwniShntpyxtEJDQaoxcJXMOzuooeNTohiKkgLhPOMonBaGctYFdRzPjWGmowSALpALqTvrBiMyGPjoXdOCeEcHM",
	};
	return xwfMERqnJEqME;
}

- (nonnull UIImage *)jrjbNUTlBRMf :(nonnull NSDictionary *)aILBdYlYIMJT :(nonnull NSDictionary *)IPQTbqDAxRzyIr :(nonnull NSArray *)QadWzvPkyuuGWDMsWSx {
	NSData *iWLkqjSewpuCjONE = [@"OzyylJcpkdEuHFaXCORluyYZOMyzNYjaoIZrcQnlekMwyczJelyyJTFmpmAInsXqqDnfYYLatXOKSlSjvAfGcOJHnoeOKLUmFHfhKlMNxNcljHL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OSYgwayBzyYftVvOdjW = [UIImage imageWithData:iWLkqjSewpuCjONE];
	OSYgwayBzyYftVvOdjW = [UIImage imageNamed:@"vFsVvccrPwsmZhWJhUZsZQDJTXJtosRDhhRLRmiRTTQbxcFDtDDcdRaRiKckMuxHqLEyYorsYfRjuAgciHyTImFXWgmfftxomWfRBYWPLUSxBrat"];
	return OSYgwayBzyYftVvOdjW;
}

+ (nonnull NSString *)uCGhKhockpaDop :(nonnull NSDictionary *)JPxEkaZRVVXsvASCIJc :(nonnull UIImage *)aCaUPtGXhn :(nonnull UIImage *)tkxBmADyvGS {
	NSString *RqJMMRTNkkuLqz = @"WtArRVEGMctlYwQtdkcvSbvhJDGwAbWpnmbcNqkLjBHxiBnSPiVCIXPquAmtnkINysFPwdgeYgJCAetzQFqfxclgPNIViKqeykaUVCItGBvPxCbOdrzmCZGxVZeohkvHXDZUSWeRo";
	return RqJMMRTNkkuLqz;
}

- (nonnull UIImage *)HFfuNWPMSTCcSSCA :(nonnull NSArray *)OvRAZqoiEMioYX :(nonnull NSData *)QwFzuWEGiVk :(nonnull UIImage *)tTqUHwOUjPUpM {
	NSData *VpgfjwcMdkuYgvI = [@"lTdopycZWresJfmidMqjwaxUbJUUOEhUodlXAxPEyBkeSUZFgKCVEVdUKHXVviCTQqoebcnifNTLuZROpUaXVbLCQMiNgnNqEBGFLwozxlbWuf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LkzitkrnSrTJZGu = [UIImage imageWithData:VpgfjwcMdkuYgvI];
	LkzitkrnSrTJZGu = [UIImage imageNamed:@"ZputSfsZSHfTjACAYXvbfXrlbgQjcNYYPktneJIadapJnGsUnJytniHiBBqzFCTAHUSbKmXXwobAPUvbNgoSUZWXpJfuyZAXRwrAbTlDRPMlIhSrfBoKaxPOgeVWrHWhSwUtJ"];
	return LkzitkrnSrTJZGu;
}

- (nonnull NSData *)kJOGUXmcOVlsqHoab :(nonnull NSData *)sANmvveqCqSy {
	NSData *wwGgsJAPHsXLCH = [@"rCkwIRfGrxerIXDaCMjWuDAAorOfyjzbkfXPzTwbSTQMwIcsbeOuFzegynlpHILswVErBbBQudNMkalAXGnSOEpnnEljTAAitIdAnPpqtyTYvHfLlaFFIWDgAmsXQtioylzELbM" dataUsingEncoding:NSUTF8StringEncoding];
	return wwGgsJAPHsXLCH;
}

- (nonnull NSData *)bPfwSZKKVP :(nonnull NSArray *)heiyECCXTpKDcrqPI {
	NSData *afylntZMCpGXWYK = [@"WRyFTzFLfxtdJQFuSdzbzjfmtznnhHtLLKYXesDFnKfNGgVatkkJHkwggaSyuLAfLVdmJoWsHTtxlQVwwjaBVHcCcjksUpCQaqvgTznoISrIVCBKVIcSAgmNGFokqbADkCIkItZDAYQLDLGHi" dataUsingEncoding:NSUTF8StringEncoding];
	return afylntZMCpGXWYK;
}

- (nonnull NSData *)ZDJEoEamLsciUoAiF :(nonnull NSArray *)DfkdsOSHaszOwl {
	NSData *sUspRUHppBMefbv = [@"nUPBJeoRYJCjTTLIWxkrrrdeimjlpQXBMdqLSzldJVHyStAwVrIwGsuVBaSTXhTYdilJVqWrpQWiqymiYGxuzZxNFOKBczSIykJJdLgTVg" dataUsingEncoding:NSUTF8StringEncoding];
	return sUspRUHppBMefbv;
}

+ (nonnull NSData *)dRAwiushCwhHp :(nonnull NSArray *)zKcmYtwANLgEtV :(nonnull NSString *)BwulQbvbiBcwsZU {
	NSData *aLQJQhHRbKEDQAwZ = [@"fgUPNgHOtBHINfOkkFfHVwEWwdlSTBBKSHGMuTmphalfjJVHNHhQJyudqgGSgZxDmgsWctLabuuolgaQxyEpIticTCcqeUdxkBdDTatFuerZKCaSZqUcKOcwWhmATjNPETgUXwvC" dataUsingEncoding:NSUTF8StringEncoding];
	return aLQJQhHRbKEDQAwZ;
}

+ (nonnull NSString *)AdhtFpQoOJMfybgh :(nonnull NSArray *)hfIAOocoGaJlLP :(nonnull NSDictionary *)DkUpXGqgQutSiktskwH {
	NSString *LpGBEHTNULrAqx = @"vpiJDUxTQIxwOuwgTOBKwpZYbFkpdWuBkzgSwMhaunsuDLSpmllmbxvmoqABHtIUtYNotSZgPamWpzQImPRaxFdkQTTTdZpGauAIScdlHLrxIAMWEYiLIugj";
	return LpGBEHTNULrAqx;
}

- (nonnull NSData *)froqKDInnxhhrn :(nonnull NSString *)QkAvwIVrqnYx :(nonnull NSData *)zQuQPhtFkvOCKN :(nonnull NSArray *)zODvRDiYMAW {
	NSData *ViWHoHvreNcYS = [@"ljRISSrYfDQodSCrmHeRgxWcxGVcZYzGSrtihNLHdxShBVssHBzYzMGLWBPuqtQaIZIOmCaYSlzIQqNUDCVXCrswOFWEDjywZHClgkILFRiDuldD" dataUsingEncoding:NSUTF8StringEncoding];
	return ViWHoHvreNcYS;
}

- (nonnull NSDictionary *)UTjVVYbWJKQuqIKVSn :(nonnull NSDictionary *)SoMKRIFfgUqCgLi :(nonnull NSData *)wQrSPnzNSer {
	NSDictionary *yvRTqdzOoFZmmIYs = @{
		@"HeNOCwYwMvPAYdamfjo": @"gxPRIsPgqWdLGpMqUAHgTiHygveuYpJkkqzUeWeGCQQJLpfXWQVShyNdLeVZvQlHXSPULZjkqEIEUzoJSaEIdORptwZGrQiYdvwquoxKzGLjtMnUHftahSrvZk",
		@"GCRnAjFrtCsvVyIjS": @"CbrPpfajGStdfxSXvtThHIHdAkiKOCpVWptsJtYGmVvcsrquVZrZTKalpZHzDABuDEmlnkmIfpDFOrELRMgRLuIMiRrrlRQrymIotMcMYKvXmNFjQXQIrBoEiIwJVVx",
		@"FFcaskfauxmwPUXuOv": @"qzGMrcdbLtXHqQcILAwQeHwDZGliOLCEVuNQyeSmSlNDJSlKHbDgTqEwubgVQBhXdEBKbeBFVOWgiDQJxLWMykqXKigxYbUNBuGgragkQnggAGQ",
		@"ZMVINjqJHlaqJRHUOUA": @"iXIIhFdKIcexCSvUNfpldlwpTcdgaWjaNwmExsPkjXRJzAGgmcPvBKFOCiLJsysyiEtEHKNLEfQpIVYGEbIIjDAmPjlbNWnWeVJdMQGqBinzNvdYdFnshNJVGSDyNnEePYNQOXcWrfJyqAwsoQtS",
		@"PASHnRmOSQWrJG": @"imYPrnkiJWubBScjxDmogNrUwkOhRCuBWIiEcJLdhiBniPXfByZDWyMdFVslTmuFsgUQzGGgVcDsjImlIVkASwDHOhELUkeLiOPJhnSio",
		@"netFHJSbCnvAZSGltq": @"LJgqNuYuHhegnZSQAgbRKwfZXsmpLoebSmWBRXJRXjaRtfuNdnxxalaGolPnvZcmNqbGJPTjxMFLErUyScPmptwKSHlAwSidZqWvXEngxkeuXzEiLYsbVsstuolC",
		@"xNlErxPsbyTyT": @"zUxLktSrMxtgOVAincSocCIWsLYzixkPtqtKopldcLZUIQqqbZqCWUafcqDSOWGTPzFqsKJetHnMEttmJrmPFBaShScIKwpCUFOcfDUbvOcmmFQDitwiqVbeyNihFOfXUxtMyaY",
		@"DEpvoyocnd": @"IjPRrDrtMkPCJewBYAtLyMeSunOMNVWojFKqoJqyZZlJpEmQdEZdLTSgjIpZpbodbqzTbvpHDUUDuVouWRNfhCJRhKUIbewBRmHgKlOYtjBNRXCLrdIbRgRxERxskfJia",
		@"ybEimCmZdYQIciuhBbQ": @"NwGUQWtVYgyhfiFAbgPtUiVPzODDUZlmSBUJgZtdOyAJFFVCqDvXQkDPkmWJlGsVpnQflppHPBHRaJFGAWjhwMMWHvfaYCfKkSoIhlARpdngHdxD",
		@"WLGXuQQrmZhJRZwbHy": @"fLpnXFVIbqUEOJefSHjPvGvPRMzQDCWwEgrXqkqybMPrsfWlYmFVDLBDeSbdqfTRSnPWYWQpUyLtrKyChiFmNDfPfjLYyiuQVtUvsjEMihIFq",
		@"gepkSEdPbLxdfpc": @"xKCOWglaRrhhTuAHkGabYDRdjbcREqNAohTxevtNJGzLllgdqWTzeNYKmvHExxieFulZMMTCHVaGBJNwoFtzTDcMlrthowXkOgVhPwDBdWAghuZLAufVmoCmZXjhgelY",
		@"kJIBgMRwWBfKduEeD": @"DIuIZnFMtiDsduFsUnqcAzyKjJBntWQuFDIgaFfEHSisBaOaCSILtSnqoGJtnQHtNuLkgxwpHciqUHRWPxDVMrcxYHDJYhmxvWdSLCeJipmAyswHPqVloFVg",
		@"YRyQbPJMVXDvt": @"ltvJvutLyTLkstAvxqIzsDRNUxMVXmsrFpUNRBgkwLXVrvsMWEGEwMqFwBkQsatkQDYqskbegcHSRlPgUVkVrdvqjrxFstlIBFvQjIusynGPpbYvbfFYTLNORXcfmedKQIleuZrAY",
		@"CDZthWFcmsPOctIU": @"zwxqAkXybmuvjIZMkvnHWMRnBcaWXofDkpsuaRppFMqjTrUwjWIHjzkwJAREUSIaBSUHgyOIWCHynejcoUROXECmYGGsHClkZUFGcofggDGDzEGhqiL",
		@"yGaMiEMioKD": @"csDyUlgJbewaSlSMOeQeVSzMdHYsEAtCnYslCSfyRWJgfDgWtQkgjnbvFsZClEeiihwefTOrYqyrDbajpQGoojhAsLHSsTKWLpDGITGDgmiBQsQvYfwQuMVWBhkDkEgFfHZzoHXVggEkt",
		@"qjhFOzYbpOTZWaklAWl": @"SZbSilesZRLibFIIBNzOxxuZHCrjLqgIEyVjOwjXgZkoigddUEJtlZibWazoVGpzNRFGLpLMeyXtCkUwNOMmSvHpzjKMPKUhRasHtbIdFTNnNQhvymvrhf",
	};
	return yvRTqdzOoFZmmIYs;
}

- (nonnull NSDictionary *)WYddauEivqVh :(nonnull NSString *)bkzfSkMnkULgWOzevXq {
	NSDictionary *JxxWraKnZJCFkHlRx = @{
		@"ejMULuTqxJc": @"hKhfYoDEuIhDCsvgzuUkTdKNbqLvkaLNiNqemQBSzSHgVrhEanONQvpjGukxRgwMAVqiZzWFPqppxaIvBshmaeAbYtRugGtjGIClOfGgbDNBmrbOaaxwDfEfFFctRuBYgrlzfYBnbgCeT",
		@"mjhOUImUBIHCPDVFvsn": @"HtJuMaiFQwgngeYSLRyuToQZavCqSftVyJVJDSLuBEGNWuUYdbwxylVLXOxnqInuUAHnJvHfiIZvwVAALlsrlYuRMYwgkdUugDGFxJaCJjfigU",
		@"cLaXeBjDalglpt": @"bVfhFYBlvwBtZfNFXTrOGEWrfJvopDsdgBDJpiJdeQAEVDsYvEysdaszcBxtsJHEpmrwwftHzMGkjsEyUJFSOKwVOzlDvTLFcfcvhQuJKJApoOcjnMxyVzUWyGoc",
		@"aEDSsTySSFmYlVetE": @"TTDPoBPTtSWccdIjGFaQrOCibDhzkzTbjVxwEPmvDBQTWkFJHgrErfMiRTcAhjsWFYDQztxvmzRrBdNmlHApZaOBoUraXGEOsmwg",
		@"NWAEDGliDl": @"SsrBQjzZtKMXCQDmFFJxcGMHQbbrCUauZHMhJOeTWuLwQTuWijsXhvIuEqDiQmMDOiFkbSWUVgTbbDbHfmgBupeYLiMtPYGjnNPKhXfymHpLhScKEpfhkkWrsQIHiXAqIcasgSoSTp",
		@"dDomxVuFeBeTZsqgGZF": @"DahoPhdwsuiEgbbURZWQlwzihmWHAjSvqfPXFLKmsolcVSdogThgjEhkevLBakbeiTFjCPprxyccjwZgZZijIqgOUjBWwdSazVotTwAWSUYzCCQwvkDySGUcYRzUaFBcvvo",
		@"BdluUZVlFUGp": @"SZLnWntZppkUPPCDkoYijSEOeyejaLOmMkZopcrEZQOTNkkXRXewLLMuDhCjpDwCqyumZuJMoWOgYNxzJmmMoQpIgzDIquYZwPSbfGRit",
		@"zVHJoKjnIiQbmF": @"IQveMAchtQnlKHYsExOloGXWfAuJcKZJzDYQxpkrIRsTBGsrkcgtzBNwblfOBxMevVifpKUCEZDTlZsLPWXMMzfjZWZZXeWxTuyIjTCSVeRmW",
		@"QmJlECIiLcjKQZNviW": @"vHURjJZhLzhBIFfnzUyxTPTRFbDFeCQmHPlwncsUmUuQOeSTzQsvGBbntloAwmUOxDojmsUdiYiLXtjcoWWHgcaBprvNzwUWkpSluZimEGmUgiHXEZNrYTEcCqhJPMwLQqCxGLIineYJLZoNXERi",
		@"KUeYiHbsaqjsKdUf": @"XkjEEroheOfspIhimofmOBraWwZyKWxpHinBQFBOHYLvuRLuNazMwcNcqfQFuAWZIowchvnCiqxmxftfqqlGrOfbCbvCNcKfZNIbpogUepajVWjEkuaIeDyiOEXwOQUrH",
		@"EBCEHntNbaSa": @"lDcyELiCDpIeGLIDYnAxOxgjJtDxCwdQvbGPKwhKKaNvIQIghmxITXILUJlClSbYXLpzfCEbRWMhRPKeyCnSQuRvHYegFRmMtVEKYJawVLLVQkbDvAcrWQOP",
		@"DmTogXCOFrDSY": @"NcRefQiFqruLeIlnPhDvQMgUyGSDRPnriPpmYZzWnSmBNxExliOiLQSLmZdIjMrHCSlRqArmEwQlyVnhqcREnlOjUlUVbCtuWGYObqxpGO",
		@"dsnJvCrFDoLQi": @"EypbQTNHAZPJdKqJuAdYNbhdWBdAORtumZgYxfpwJOWOmwFzqNLVqxufKOPzkBMPbIWSbYvvyUdYKrUwxQGuDZivhLGFyXesjJiwbaCUftHzQomsQElnSKHXPiw",
		@"WuiNcdNxdbusQyDBRN": @"eLtSUxCTWztBqQBNdNTVinvONnsQhuPiwacdBPvUnxHeNXgAVnuLAkDtTEDtBYRyYyOZiCauccGxUOnPaqXAISLVNiuejrYcafNRaQWWjpYpmuVECdwnQXujWsWfALbYOrrP",
		@"NADVfbhJCBuVKxW": @"MKNXPhYjeBVsRQhBsKDfwGGpDMWpgeEzFgzHtKsORPABUOeJJSfmqbMXxtFnFTfxfaXdDXTUyaypoVvzFXuxsAzBbLxrOSmzrTKsfkvvixBUYCIdJgxfegylgYNWSKTfUV",
		@"pchvZUiUdI": @"sEufSvhvPctUoIiKvRjzGVTfoJHilumyxjDyiCbWdeWIDXZBYbTfHIifqQPwSaGKIRuQfvWQRKnTTCpNtAOMmQdAUqcKNrApFqqYFGSLOIXpQQBOSmdvWbAMPNWrscKi",
		@"PxelfeNCDrouTfi": @"tqqgbkUKtWGsKYdEYnSvgwTKHIXVxsHnHDpqyEJSyImjgIiyQvdLipyysRYVkhDNVqAMXaHPwcbMlZYIVDMbroARkwoDsaahahPyCUMcbOphefPPeGxMdKA",
		@"pPLzyFpmpDnjBEk": @"jNLDLKQOzWYmBoBZLApycbGJmLRQyMGRtNFdNjJLecJjsjvCWBEvRIYVzSNAtaASRrKcQewFdtmOGPMxEwcjbcUATBhHFWlaMsMlEASUjXwNPhziTnXaIgTzQEVVnASrl",
		@"CuiYzrXKzRWF": @"iIAMDuDipgBppCNPrASXdWcfZARFLSJtOMSlVRuQkwuLhlvjdnuDqpZuaYModNESkpwaKOhOMVnoKBInfhOtayDmLWGSipVvhnpUNDSByPPLjLYMAGkoHRCxL",
	};
	return JxxWraKnZJCFkHlRx;
}

+ (nonnull NSArray *)mOrSlqwIjvYwbJTdHev :(nonnull NSArray *)jtGZCaHDAXCKT :(nonnull NSString *)lQdLuWNXxlPUUCUi {
	NSArray *haUuFwlIuVqpc = @[
		@"uikwoczRABEcEjptJGiwbgjAdqEzOniIhZMckBLGGLpOTcNFgBfKRXoRHzeqgKWOAKkcGlZpZsqWgFegWLeCnkldLbOXlOjcXvtIEkXVzsHQwsSyDB",
		@"fyENyQmwXmapKRwdoRGAwttnAIqvKcxJlocojeugiGxWdIfnuzYtbFoqdfgCNSYJWWuRAxELcBLslnkdSFdlVWxOiHjUJznoAenGrgseCoDnKIwqK",
		@"knNhJbmlLKhCDtEIlLGEjGLfAnMCwYKaeCpooBExHTyfdrxbQtNojDjJelceaEvFZmpXnUvxyfvUTlApsfWRRcIACNcbelgCIJEoVJzVY",
		@"gxFlpGqrEbHOTtLUXmiHfliZsLahbnuUsZzJsPUuecRrCZkMedKjENjanGKhrUPQoCXRjTlVwRHxqsIoaaitGfPtUPtRyBpvEETeERRhELKHuEJyfKdpPIre",
		@"lIrPiIOInPyoHxvqXunateezYqRqngHWKLelIGlhaYMfOcIBHknBaLgfOvjxkwMhXWHUhVcqAJUtYdaAmdrOetYdmYszShxoqWpBvwldvIEzyKBLQyZJjhitlfqQfVIVQKvsdAOWmdAX",
		@"hJZAIlxQSmiuOxBcukkCRHDgsXsQOaClHgdSwtfyVHGDWJhqDfycnSMhdQpeLUZYHVriOtBUZIpKEiYGKUsYINyFqgHXyhLgopverFYQTrThfPlfQoDXwKjFQbiRi",
		@"USQUkRaeYUQWfDLAsvzHHADiGieXhrlEaMZVLcnLIyEoPDqNIPZCGcXaAqDIZTIbVgZNAyAqAaWtzpjgyxfZZStYQIZKKjoGQskBPeDtGzsiKSpYdqwBRPfT",
		@"xQlhvOxPuoyaUzzDMSADGgJpzpVbwCZJTNUvYfUtGbPluNXfcwFqvEUQzxbWjbNsuWmAathdLiPTJnraomuSgcZXGrVjzQkotMVKTrMYhPpFExfpYnvZbhwTnZMvGCES",
		@"KhFCfTbSnKHDTGdJDjhakIvVvfbipMijzqxCQDkAcooILvipZZCbfyFIRDMabrTbyMeXtmHKLnFYYjFZrNLeSPUzyBAFljPKLDIxLzIffhNrnXgxugYeKIRmqDnUvqcRSro",
		@"sYpbSylmoqUMUEkqrDoHIrvzipzsFdtbjzoZlJJTpjsoeVgiJesxZrkDDuYCYmmeZcrCMCCxeLrxxeXIMrGSYepWDdDrCqlVPbetpjTyjKSdgsqj",
		@"vnbZZBouaZcaRtZewlwFAQSmwMWrYhgSgdERJdIKksZAvovjKeTGPEKgHVPgXTOECZGtEKryUBlUCUbqSSUIJvFhzsevcJaMmyXWuweVRyEUJMsmgeBLJlJRIHdpBnlQuxfriomkUbrbZDc",
		@"FJyHjWxYemaBMcGtBYjGjhbTuvCkDUdxkxnfFPJBWUyGkkzqJRaUNXNHfRvYvcYqdctHuZtKLbkMvWHqQrsGvOQWuWVuQarnOYhUMqDostcxWWPaWQwsXFIOIEPdozQxyNIgKacnXA",
		@"pYlCcWuFxAEJtAthImfowBfOKJARfDjcQzmpvyknrIXDpcivVBTCPpzIPXKXYnfQaFXdARNjHmrRNVdViGRgzrGAsufppMfaunxdFzcCTGq",
		@"VCzXqOuGDOzDLqFVDzjTWPQNvBXcgxZULIIKndeNBvqHHLYCKErUcbVeFHYqDhfYOqxQLCJOfBUxUDXQwycXtiYatwFMpksUUebBQPLOVp",
		@"osbLWyuljZBOlfyUOtCkqqDDAeJfkKeEczoKknhPnesgOHSaLfAAFbCrKQUbBqrcxQbaFatKyYxDeQkvGyHsDzZjCrmtORlQpIIqzHzwQ",
		@"pAqTjfmpEbkMfCLssULgZnEWunfTLNxDnAyMYdpYDpbzuOJDSiCUEOIIwaVDwKYozZjRwxOEYkhzvUnxmQQCCdEoYeYnXcapDcscsVHJMMuIh",
	];
	return haUuFwlIuVqpc;
}

+ (nonnull NSDictionary *)ZHPpLXoSyhMPhbfz :(nonnull UIImage *)VtoywnuLSkCfeuXib :(nonnull UIImage *)TWGbqMvilRzib :(nonnull NSString *)AlpxVVYwCJTjF {
	NSDictionary *oXMcyYXokwVVHmaEjaS = @{
		@"PchtAzRJrjiGyCwvOc": @"yYaNxpPfXWfVIYMeAbxeHAcxeRHMGQIOsfBBSPgldsgyCudoigVJJhBufaWjgKaumIbkbmZKOoicFAWzEcdzXwvjxviDiybvraRyaXUKZsJtgW",
		@"WUMtJdJQZisbbZ": @"oDjEejKPNOInvpuzoHLwJGmQfnUGhGCxnjRuLXtFaRiUjMJWpsTGGfQfvBFUCKXZdfcIshXyeFbGRrLcIpsBmIHAisAZDGjzBqyrZeIoHACNIYqrQOBkaSkvExSXKiBFeQNfbRwT",
		@"drvMQZRaMPxYv": @"cVsBCIJILoVeZqSaJieanvWKKHYfxAvyofsqVkLKRUrOWdAXyvxHRpSrWTQOviVirwyMTniWCqdNCrMEIDmuxPqbZDrUAwIJbZCQqUvlkd",
		@"QWPqjCChzVWbp": @"wLDUVJiBsdrpkeyhRuRCdVQCttsCXgPyykKAJBCyyhuHIlOnWnKwgMfugOtCBQTkvxSEAfzBBWlhncnpHTQZqCcZMZQeAvpXUEOfNYtqNGiFnhBsMiN",
		@"SHLMEzyhYGjMC": @"QZzJVgfDTAWtvMMQjHQIRWKatJPLPHTKVZGfmPzLcGzIOlTrdMmpuEIVyLmwnYyUdUdUehzjgsmkbSjvOcnVLIGaeIPKgoZFNYLbRcYzGWYciIrHzxcildnFyosrVuYmPY",
		@"EMwBpYCysrvbARo": @"FpCuWXkmFLXmNZJilDfRgObpEpzsemlVQXXRUrmAjcXOVjgdXojIYuslKNLzrYZyiiHZGomuyrOdFAaiPfDSwGANiGaciZJoXXQZriJIKyGlmUDLoRMdHniEUiUvTPPZqfjxa",
		@"UacOUnDJqjgnSJWXyi": @"qoebslncSPtHEmRWneGgtwehgeArYfTPJPqrnrPEyQYpnxqFVDCpjQiRWUChGrqNtcZZfSUlDEvGkeNMVycYivZqgaCyVHyDZeqfAdOMuOEJgPgpR",
		@"MKosDESOGRpd": @"bKkzdsWwgWVRgzfigERVGtObeeLYsxUkxkouPpDSpsKUyVmsmBoxcwiCdfYpXVhgadRwuPMNbkRMmgFUhCYFyVyYMVtQTEsZBYbnNLFfnIFzPIQyGTYFfkFxCsFpHvuRtSGdLapfejDqhbwzMeNoz",
		@"ZypKldoEqXbLlX": @"thlbJnPRzcCqyLLkkCravkhZjAEnlyVUJydtYHmgwumrBqcTbZLPZPwMZznNtkgZzECgTqJkcNYChFKhJURrFXLYBndicgKLaCpzymZFDDdOdZwdfml",
		@"upkYHYyGJBXgetvs": @"ubLBObUaRwQEiiaelAOQwZAgpQvBgAiyRIqwiRndNdcudoERnUlQppZvNWRGRLjRqNWabMrJvauuSHqGqchMVLgZTsHBMzrWCFuvXscbbqDjs",
		@"oQnRPmuRDnTY": @"XlKCCGCLEdTRdTmVrCJDqDYEacBMUunAelzWmRZBSJkLLvDwLnmGqgLRcnvcPMSsLuEFwvsSjrcevTxaUEMYoMwVlrfviEmuTqVkoyxNKFLCVM",
	};
	return oXMcyYXokwVVHmaEjaS;
}

- (nonnull NSData *)lGpgEjrzzZo :(nonnull NSDictionary *)OBSGZHeXbdiS {
	NSData *phZYlExbYD = [@"BqsNegZTzSsJApXBiiFRoSlHnjBXtViizKLOwtVeNNxYeliJuLZStDkeCQxUHkRQDWKkyZiXkoHFcBtrbQyOxwjHQQdvPGNwraPcqrcobnhKHSHSJEyDekhLyjDhMwyKeKfAYXLtUcpAJaI" dataUsingEncoding:NSUTF8StringEncoding];
	return phZYlExbYD;
}

- (nonnull NSDictionary *)hTuEtmMBbC :(nonnull UIImage *)bKVuTQrNZJGmFZ {
	NSDictionary *DbPEpIWIcveLlB = @{
		@"wHmADDJmzBrlcQYtH": @"PKnCJchXdGSDDLnLAFZsYPFtGkgmOsOXbFtmGvcsIvdhmptqNWQyWxYcqYuwWcaWBLnLIolVvfAErbukhDvxwMdmedZtMxkYALjzelXhWMmlZoLRmhRipTWclqtQxEEUTAIMTTpufLshTqYBEsnem",
		@"kKyGJRetIHEkX": @"YWBoNwAdtVeikjitETsrAMtSYjMtjTtNCgSXYZofroJdXRObySGEehBprmMtnusZsUcTDzwJpltyWPtYXUUZsRkyQXLkjmWCruqjWjHIVKuiEcDmSWFJdrzMPvXVavyjhmXRrlaaWVjhCmD",
		@"KiKwIWfOtwxys": @"RItpwVzflhiqJOFRjNyipfdSmeROwKgtgvdaQNxZhswCsOdfISyEyTEnvZAWyhqfGQKCeVQkuzBEkEHVBhZCdGfjYKfbVTjBytvgAZHpXGoAbNDhqpjkScCESBVChiWrrpNMov",
		@"uYKymFJXWFa": @"DpLuuJMnoGVVEkxQbFqdSNkPvaubvjslYMTecsVIGboMwEaGkqNplcZgtyvGwMNSPEFhMChxJrGaLJhbovCkapZMRruviNiUSDGCTBvmiVZzxqgGTnJJjmEHM",
		@"zjtheyRMJuhwvVQhY": @"LquMZgTVorMtVqGFNXBoBZKdQkMlcfyOsfiZWLUnrUkSWJOWMpkpyphRolUoTrRGPgBbXHigQOByzKRzYqqsukugBgZPgnwCcYeiyszMkPdfYxbxCfALLwUSNSsNgmNbyHUdxEWsLMQ",
		@"yWqyCOfVNsorDfvST": @"iajeFCBgciEKjPCbnwPjMwcvZpzPFSNTSnuzCRwZCZUDbLicAtWbmeLQPNOxTvnhoZYftqdYrCUsQBMhVTTcsbSEMUHbGnVSjFRixfQGrsjQsPtvKacbbhc",
		@"RWnjpgwJGod": @"VUnPFdgflHHrefKERRekURNzLpoTjoLvCacPkQpzTFJgcYEoqWfXeHrkbNcrWAWTqZLVckHPZPCMJNogtDwQAWAbNfylsPBliCZMLpOgleXwiTATuXPQUfAmBIEnAYmA",
		@"NxNbTPxTaBPqGMNgSFo": @"QNFMprqjCjRfheFqXnrTfguozmnizTUyESmTzvMwKOsvyInvEVLsiUOkqkVTFGnDwqIIaNEdSNFLpIEwVgMJOzpuqbynLRyWKdWEkHGISUfXXHqrtMPvmWJw",
		@"trHrqfRnHOYUmvuSlWZ": @"zhCbxpmHpgUfYmNBGXKMyExTbSMmFvIVUgqvRVPyskFiTzYbdHFpkuKcldGISUoMAAYZMJwISNymkjroJHiqHXQriWdjIpTLztuLehngpZJxIkfuNIffs",
		@"VnVBcREOoADvgB": @"PFsPOdEeDCaKaEdZAQkSONpysgiBgLsVUlzvaUXmZyUsaWMmkeyWUdxKQqfuAzfBNzXkkDmgTFUaBCEEtTQoyiTRRUxuZbMUqkYEY",
		@"ysAAozenrrDHFwp": @"EdlLifojLEFMiwecEdrkyzmHIgOZLhWHUELjQYWBuRrpuiDWPenfGdjrpxAbVrgdXCmCLXTfTIDeuNtBmSBgKhwGsviqHmXILyZENmmdHtiSljNWwudQHDlBsBMd",
		@"uonPWMpQHCpug": @"RxoUOrHBchCfaywuzNDBiukyfLwHfaszCCKpHrcefLOcRpVGfLVfDTYwTVBSzGnWhBkNwVFllBttBbrZBzfpVTsyChQVHFAPBkkAPmVpvGmSCz",
		@"vCXgYGbmzuVv": @"smXdgwJUswDOVplVJqhuYEyRDgqGGzUGySgSyPqvCMlmjPYevMkCVdNmCmUlTbiqJeLhPlAGHBwRcBQVpvtfPHpBaBiERJvMIjtz",
		@"TalZZqJbRKcYH": @"SeaYHFIBQTokpeGPxxqLuaOzDEhoLLBIiDSHzlEunPvqFIWZwfVNyVHcaKUwjUPSrqhgeZCGuQEkBRCmXHhhpSyCcfRVosphkkEfOEqcWjQyozNPtjdXBqeGFGjXo",
		@"qIUSdqfeIrvkeD": @"IBhttxgHocrXRejarOAobIDsEGxFHNyLuURLJbwRwnwokKLhINVeWKgzQQOvTFqzgfuElHIIIiHfSBDmCTRkemSIbMwERwldotxccPy",
		@"weayDDblXwNvha": @"ZtoESykwfPyZZZgBShQEKCiwiYHCmgxafmuUQMARsFKlzptGpunDZMcCZIfKctrvNtdxIXLFaUtdEmzPTqyJMoKfCuflsgGBZBzOstiQXIie",
		@"lVUVKtUYmWoHN": @"PkDmYgkXRVRRyJxjcCNPhThuQSVrUCdTQHBvkixSlBhhTKrTkQtFEFYjfudFztZqPOpOPlPtaZHcwQAOnsFqUCoBLIvbrLjLmevkhyovNHaAvEnzeWUHpgHuZESQjLhTvzeJFZnlmm",
		@"JUVsMuvWFbSjCMm": @"XAhzHloqJDWeAxPMXSMahCYxdakDdahuevkQpYtdumHmqxcKkNuYwJBigKaHXOIYzoBJiEtaUevxYEfYBPjYKOkZjBfVAWNUpMShagGWdeAZxMGcpMRYvodCytrwycjuXNhafYOzGtWj",
		@"ahbmagMtFRnVWu": @"HRDHCzlWYDNXazSPVphkJfhDrKGJnNJLnnugoKCgxHHSjsmoJVwzIOydjrFGXkxyjWHPMSSJDWVtYrjyZoXwruRmUDiuIURFQJtcNIcECIqHcwyowBpxhcEHLoURgtWLSkGeqIw",
	};
	return DbPEpIWIcveLlB;
}

- (nonnull UIImage *)UXIrKZfOsqnKtQCJMA :(nonnull NSData *)iYnpkzFICkSDPFw :(nonnull NSDictionary *)IczSUevHKrThSQQGOGx :(nonnull NSData *)THwhiZRtVDIr {
	NSData *mbRAiFYhJKAkw = [@"rtrMCCHSVuYowYQiDlOZVUkURNolRaeBErnYSReJJDsQJHdpjRUJbrqcxhwurogNKUUVaxLmBtZtjVULzIEtsRSCuAdtVtSmTMwyvouAZvejiCdckQpfSXl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MrrXDNSLtGSemdEQi = [UIImage imageWithData:mbRAiFYhJKAkw];
	MrrXDNSLtGSemdEQi = [UIImage imageNamed:@"aBwiyscfKbmpLLapXaFAxNogSxzaBOXGvrlmEumNshOOYqxRMruIgHahuuusAIxFEMfNVJaFfRBUkHAwJDsMTAMhnFsQStfpwaLEaVdgBFGO"];
	return MrrXDNSLtGSemdEQi;
}

+ (nonnull NSArray *)PJQppXHtBgZ :(nonnull NSArray *)ETmSyRqtsHrCzcKuyEJ {
	NSArray *dDnPiQwUkAG = @[
		@"vFVyCZXGKasntjNLtYiUmbwCasUWDYOSskKbAWYdTfhRHlQsnHBbdanUbPZrXwtfyQXkWwxvxaeanZtPAaVWGeasrcVVOzGMqwknGwZDEQgaAxEuVLqOrpqLNjoRhifPyLorXRZZaFMMgQz",
		@"ltSbMPbBASNOJKbSoRXFMxajLYpleJDwdoxuwvokVeKxXpaIIFiutBoZTelcFYiAVQUKifqbcXJjMWJSMplpEqFbBZLrqxwMzhzPKdWaPifeDWWpqLaCOYSvVfcpWDOyVVvwICQ",
		@"WfgjsbQKDGbEOuwXFuRvaYFpkmzKcwxeKPVGyxPqXWqUoxDCyDToUCopiutZJRGaeAtUrXOjMEsgkEONYAVztbNBTJKxJaUeqvyNEvAlFpuHsrPHguqtTvBcr",
		@"lLLVJQFTVDdUrRnGqorSTxfEMvoIlPhgqwdpOIVjZUYIzwuMCCZptCfTfYKkSLicOJIaRZiptbiEKgTEZwhZuWVkOjMmlmwpGveyrlHbKeoObqvTrDHpuXFIkLCnKVkAHNfaRpazPkUszktRkVjD",
		@"YuJuBFrqOCKssoRufvhVWpoXgeEhanVOMugUcOTaHlUGKAbFWzMspWQKBCSHbMnmpnCpEAQbRqyrGbUtAtnsjcuSKLPkdCKodJiEBOVACpERUDDoNmEpzrUOzPWvR",
		@"DRPlMPGCAvPZXNagTsTehKqCAdkvbZSynuQpASqMPbizjaNOwYtDfJnYuuqozPRgIDEvUNZWGbONHmzSEzQRzabtAUtnlXlruxqfhZM",
		@"kZUWtrLjbzUXJNEYbprsTnrGNdpxtbjZvflHfsFszYlTKiejKqvGIAqQcQFTgLInfZRMDTvwVsnnzqwjDQTDqSNyJmRYMNlKMfHlMtnBwGityvjnNavMczYOWzAdJbOvFcRZwQICWTDBtE",
		@"xQFeGvfYzWUeiGHBVkfBetoVvsOapviqGBeJSztZLUjjFYBeRswYYctmnMXOGxhzMlQntzVFpsWaQonFhEHWbkivYqFVccyCPlIYvVAJHvJDmhGIrd",
		@"eyaprXdzMyRgjqKKdiTbRrXkFKlsHhJWGrNTWblFTHEhTwvQaXPFUzlCWauHGTLvmossIDAeuyqwdUMSDsCOEPSBtMYxbsOCoSFHdgVPFMMPmZfYRND",
		@"QnDRXoOcIXEvynRHSrPWNiTKJEeYLWQgwHObzVAUVpnnSjodPRoVScEfCXgxYKbwyKNyzfrHgAqtzYkeLDVSaCHBPKEcXSPCcKtlVEWqaHgxQifZNuKayWrhosiTvDIWcpKxoyozsXAYunPvl",
		@"ZPaNNRQFtZZyYstySUKAirMnVJNptfxmjejLkWsnPtrLYTIaCiDekEGVmxEHaOKXSOVYQddeeoLDZWRZjRkiALQFncPgVVAPlnURTjGLpIVTXeuKDkCtAcOqTQKTMrxrBFgwOmTovJGgKO",
	];
	return dDnPiQwUkAG;
}

- (nonnull NSData *)xQsMckZqss :(nonnull NSString *)LeNoWQeGHZkGerpUnXK :(nonnull NSDictionary *)HmKYlIxRAuCzQcefzLk :(nonnull NSArray *)ARlOsEJXlVeB {
	NSData *JmYEiKMwjb = [@"uMKjguOSswHnMkilBTnVBgHwdBbACYlHWHQgWBXrwttHwWYInmHZPKnXzgEaFLPKbwVOzHMXgdNPXkSBQTsTOPlBBoHtIkDrsYjOETmyNLNnuQFlXWatOiZLsiuNDlDzkVqIgrrGMgKiOlVDVqCh" dataUsingEncoding:NSUTF8StringEncoding];
	return JmYEiKMwjb;
}

- (nonnull NSString *)prLzZkUieTWEp :(nonnull UIImage *)yxRYsJaZyeJuPuaXSys :(nonnull UIImage *)oOUeSZDWRcX {
	NSString *fsncCREllkyrIlMm = @"VxFpKeucCKguEuNIeOntkbzZhFmCDwPFtysDSKvmNqAlNrIerLrbjtlIjclyBkBvcTkhRBDZaTmERRHxMGKJhNrcvPAKNjPGVpmfUtCuLBu";
	return fsncCREllkyrIlMm;
}

- (nonnull NSArray *)qSvmcFxKxdxBRcbIVcC :(nonnull UIImage *)ZWHINYkUTdNTm :(nonnull NSData *)IxdEvzoRxeHpQ :(nonnull NSDictionary *)gNiLhnPSgZ {
	NSArray *wHmuaAOlQPwshtHS = @[
		@"OhbVaDLgLaTfMRPbKppbCBIGdeYiUYqzSrKzGKsdKpbzyweQFaUHpnHDWgpbDRGiVByqrmeWBoGKDlpaXXEJAnxHXLRwEErEWqblnBaILMWqdpcalweampzHkrnXurhUNLpsUtcwIyxkjnZOALVD",
		@"MiEgedszSXwKVLrsHepHsIgnTwsQNbIxkZrpVxVnJhCufqgDHKZXowxRBDALIjHKYoarCxYhbkbEqFOKRwKIraeiaoqjsOSYhwaXUV",
		@"OicmfIjPkwICPSBbQXhYMLxkEbmwPJizFFnCSDANLpwXaPpNozFMJQfFFzHaQuWjXYMGHXvQuzTCxgZAneswVVcdYEuueECTDIxHmREiKxxPKNcZvsprrIimkHrvl",
		@"myFdVejSjUwLJhtMAWGCPUEreIpbztgJMKrrlOBqWyLdEjaatAFnvzZVdKyHpCEHfwLCzpEmSltUppDTSoVFHzgSFmIIQtFmjvExIOJEfxesAAhVRKgDSWMUBVbTWxfDRNXsvRbIhlhFgmxj",
		@"LXvOgbQlQDoLwhweZWvlWmyeaueGdfABoksQwkughkXnaPuMPHHhiOLZbCyOBcuqSawyJAchNfhUwYbDReXnajKWOWMUKytkByGdNmkAzKJqxCuNCSofCthOCiUGabWbvdoNb",
		@"oPtqlFugSksiBVSGdGnHbPILeKsUnunYxwrOEOWazTCFgFTLDzWWaITctDIygwJrRlRPtLhiKSWGARjfvXczmPEhyrfAqeTtkvHgLwKADakOWzzVItgBqf",
		@"dxGvaclFtQaOCjmTUgVuIXXFWoumCcbtHmEXzGCEXWzUUyfpjxEMXlzCdfdDHCxoLclHUJHAsRaXcwJMqxKpgvhoIdcOZoPZzsxvUWtarmrNycTuHushKTWMczMlwgEzhHVuFxpWhA",
		@"mZpLCVDvegMMEXoyreEJnKQqtomYdeDuVBfKKyzkeZhHywsFCLcHoZhpSypHXAnhRWtOlnnpKSeYROmxbmyGDuqiPYonadlertKVQuW",
		@"ybFFyZDLIkPZCYHZvnNCscyYEwjvTVNpEDhhmQrRADxtWFLxjsKBbcTCZMMbPVezQsWGRvSUUBahPmUkVntEZaZfCxFTQKSSlUHCRzEOaFRUAJfd",
		@"YDsSTulaIhsmlbgjserYznSwSHCcXPWhKgJxRopCVYTBAtHzWdpmutBlnfvLdySQHsFxplovqTDVYurDohuzqJgCcxyUSRNIwQFzPwUZSfkQBJUwdVPFVPEmJzSkqgmNiROUDVg",
		@"UwIQpEhJmXMohvWZTVxVvzXUxzHiAemMhGYePCGPKTFKNpIJQkcIvayXNDbXuHVzaCxJUCqcoGGLcfvScEftkBRNVbupXRrkSWEn",
		@"xVHOxeYZKGgWqdVAalVQPdvDyPHcJcoCxBhIniaVFHymHGotkpqIjAgYhGyNtvjPOwTmXCWBwrtbsmFZRmyKWBMOGngNVcExDwGyKRzMMgSTgVejXXYYCQJTBoEPOTgefOARYlSODKSM",
		@"IFpqqRLYkLXtLCuvelTvmgfXJecEOGPwniTXuvaiKXSRivssjYLbJBBSbanqwjaaHeFVTISbkBepkuWXscJCySbCpVGOvrCVGQQOcSTrdOCTLtPgjZxiFvxOSQrhdZLgjyiKqWaiwDB",
		@"RyGiptuSJpTJyndquqqdIGlYMYfnumoFEOPwmiHSWvwNzOvoVjOjIwOaRWPOyvxqPOoDHCLobRCNtrxrFuuCmSlRrjXjEOxjxjuFGLVcjWoqzsEErX",
		@"gftPCJKxtTRqwjXzUySmHpxxVRXccztnGdBbcBaEhoWOnCoipbFeiYfgRYtSiDYaJINtHLAWAFYmruEZnxkLIeRCrkkKrZneCVRcNMNyDRgDexetCZ",
	];
	return wHmuaAOlQPwshtHS;
}

- (nonnull NSString *)vEpJSTjEUCnJuAxY :(nonnull NSDictionary *)OsiVDNgJFooD :(nonnull NSDictionary *)IZFRCirNksZLBFYzBT :(nonnull NSArray *)gSchBeHSwnNyiCFLEM {
	NSString *RvDQRVUxuofb = @"lURDhWHwZhTHxtAYZntxThqvdcuKbsbrgJluvgoJSpQEpEpuhrQutjHRcYAIVntnLcfRzGrNILRxwxJAMPQGSGqOJnyQOQBGVfpdsshYqc";
	return RvDQRVUxuofb;
}

+ (nonnull NSData *)vAGthHPRMYtRct :(nonnull UIImage *)nvcTnUKBDeQz :(nonnull UIImage *)xFlBbVnPnM {
	NSData *zXJoIwdHZbPO = [@"zSnqCWfrlovokOfGUcuWziOkAEzejcjktLVdkrWyuYqpnBNTlTrMwgikqUYaNHhAjSMxgDpkHNVTshaHzcZnJwMvJdEtRmdFzxLLjbDgppQgogRDhcPXdAZaLkdJVFupvHhYvEmo" dataUsingEncoding:NSUTF8StringEncoding];
	return zXJoIwdHZbPO;
}

+ (nonnull NSData *)VnIZtQBkAFYUrLL :(nonnull NSArray *)FekoLAKNJHpzNkXvMik :(nonnull NSDictionary *)FfHTUAytZtTVJbs :(nonnull NSData *)cphlQOgxOrRI {
	NSData *usbJcxwBDYDNvhbzNG = [@"xxIrODAZSFtAtFvtFVjrcylkGirNbQNaJQWLVswiUkAsCjlTXCYlmUWHczaoPLqdZaLanILDxcoGQKEpvEHjTVbMbVTlsjIfzMPojcreXkmMqbHj" dataUsingEncoding:NSUTF8StringEncoding];
	return usbJcxwBDYDNvhbzNG;
}

- (nonnull NSData *)zdZooKWFvHHV :(nonnull UIImage *)pYeNndUZtMltk {
	NSData *yiQWmWOoAh = [@"jFzgRBFXrQkqaCWFVIUNcnKXWZOBWHylbrRLrRYJgSIXDGKaYePfpIpjaiXbltBsttlxFGmYDgSJaipdxPcsFkuWpgscaVSVZhasHszKvKBmNPhIOgxiPTgtjhRXUnqnHJOYy" dataUsingEncoding:NSUTF8StringEncoding];
	return yiQWmWOoAh;
}

- (nonnull NSDictionary *)ORwjVFrNEb :(nonnull UIImage *)IDHStHfFvonWntcaT :(nonnull NSArray *)qTIsNvaUHTfqQp :(nonnull NSString *)vXbzAulcrKkUPRvlLYM {
	NSDictionary *uHAiUwRNXCoHtXM = @{
		@"CgaPKOpvFuN": @"aqPbqxCpSqfPEnDKuBzbTKSdgAUPaFJMeifuEVxqNzHJgJuHhlWAbTdcIXTbbrJpImVNIqFpkwxzluiALURBtAhxsaEEqvfaGvsVuPrWqTMzoYRhOPyTHEezDHFrr",
		@"MNveuZWUXyApFUSKlg": @"AtCldzYuYGnpwRdJjZAzltDBoveiHhnLaQmvjcgCCnicNAFOJdjGNUCIImSpGgrTqihZjGBeuzVjPQnpXOVaAcscSaxVvNDhCqgEcQBtUFjHpsGPxiKXpQKuFLFVZxpXKOrPqMVAYRosHRrA",
		@"iFmebeUCsFGfEK": @"XSRugRZKxxgmkzsbPlVWEPvxAFRAOuhQDCXRQsZBsoVQMoinoYuXMsRUrXFMuaWJXFoobQkzEeaixmVKlffrYaGZBxRFCMtVOMcUxpaJlUkoNEn",
		@"oSpUFYKVghSIOWDdXsf": @"WtZrSuakBeaaJgjtlhqappGamlEyMWLepeVUPJUbslNeMRxazQGSQYecYduQMUQrWONZHwHZUXzkhoVDYeAzzXiVIuqSsywwfSvCgsiZLFkvAioJLjksFAO",
		@"GzrWlRquKJgXQ": @"ZdfPeLxIWrAKIQRrBLXkwLSzaXtZrtLEMcDnpSgowCvEvWZQagBrgkHiulWKsCrewuWtSUBocGwcbthYVdVuMISintvycRPepUZIaOjkoDRMjwHGRemKhWjLICklmWnZRxgQ",
		@"ZSbrqWuJiIFOraIGa": @"uLtWqIhOwDJqPhcXpPaWCyhKbORJdcFwRuWZxthyAmfdMBUbdFvEaeiucjSyyhnFfRrvpBLAABbjpRyvtPPHLuslieOoEsIoEcUhLgllbgFfJCdEuPmGVhREzrizCCeyxu",
		@"ZNbOCtySJJClBjmdpxT": @"qnNoxUDzNqOYGAeHFoCXRLQEbmCqsgQtFQTMdbylHSlmBFYviTLSCnNqlwfZUcgJNzkNWVVWOnevZbcSCeyfGFORamewMOrtqGZJkYQcZWjtAgjOvADBPzjEeJGjHjVYjpOQyerpjzj",
		@"REGwHBlKnapeGCNBG": @"CvfUYnodHMLypzLWACnirfLWXDgEUOCcenyMMHiIKcXXMXjbUcCToPRKTJopNlPXAYnCwqnyckaIPPIrVmCHXDiebZGxXvXNdjYpdxGPsUfsTtZqHxpIR",
		@"IQMJDcJVFbDvZndV": @"ULaLmokeTvXUSPPTfJGTxmSkZbktbZMSQoLRUjGbFljRsqHUhGbfqARUrNGocuSpBjsUPfnyEsVxzBRQuIdyouQsEvZgsYKJimcEOCWcIZHGuuyrGKNZdis",
		@"VtDzDvBSyME": @"XZGTZrZpqahCULAPQonZHYfAEUGIlEZRoQnxGMTbjBhnzBrVtXSjejdJSKgLHOllgzBgXphUnoxwCkrVMSWobizCCtAFCWnttHRpVdBVskmwkpIeklcqqTswHFXVbGxTLnQqYfwlOQkwvp",
		@"gzwMDzWrLDIHhzVwBPO": @"bZSttCWgbCEvXHztlZtdFWvJJAuRBvfAhaPoZSECzEEhMaXriciFDUMVICwcUVwlnmFZcLpblyZoFMVRKfBlOezsjlyGCzjgaByqsV",
		@"JHAbIsfuEYQZMZrk": @"cVbFCNLqfFvDANeKPgnZIEioOhCiwNlUuBEvFAXLBcdTMatvpJrvVKiDAOObvmWdAOJgUTMYWxULzCePuxuUQSnsBUfOcZzvtdqDEtZKhdHFnJxyPMrtOOcqLPnDLrWDTNjQ",
		@"BFzanLSNcNDCCnLcocJ": @"EjiVzLYcdyKFrzYOepBXWkbIwFKituEIQYaIXyLXeZWasLdJjudhhmcNVauKCXmckhwyeWBBspCTCWSHkxrXsadkQQQfowsezsbpCUpJAGxKcY",
	};
	return uHAiUwRNXCoHtXM;
}

- (nonnull NSDictionary *)YPjSUuzllaPHTtLJweE :(nonnull NSDictionary *)evNmkzFWIeQUTyoKXE :(nonnull NSString *)iiCCWpVXMNZNFClU {
	NSDictionary *zBfsazvbJvEmbQEB = @{
		@"yAvgYPyOOPtHwfKfRJ": @"OpFDuJrXJKepTIkQrwTyjxhwxJEHtSigCCpbfocujmMsKzFclaHBUtvqYLkMtVyVwLSrMnpavcxhEQtmBufvBPeHsnTeOJeviHhhcCuckVxuEpLVynmMndhBGSOSyWGsXWkjWmMeRTDCQiqk",
		@"trwnxKPDrEwBCN": @"nDUPkdEELmgDLfezOqnqwXrYGCUpFLOyhUJQuaIQBXPYHcIfUCeCPnApPsGIfUshxsNdGHFniGzqQUqaUtPagoxRmmZpwolfbsMKqHMfUjhUndDfWSLk",
		@"oUHZxOVCEErrMOlBcc": @"GtVKofOYPLJqpChEzxLFjEdeSLzjgrLLWOeHgqphImRdfaqUXutyHvXCpQXMOhcymEDWpUjDrDfJmcMjpKYunKDImPaobFFiWawCPFwnHqQzqPlTYVIEFCSSlHPdQqhOqVPIDtqGXTDtL",
		@"sdjgdwoiHqDY": @"ZdwKxIEvmMdyEuIPZZVmvAgzyGCENhPMqYlLvMQbXHUVUWDwlsniyrezjLCyvydqXPYVMnovrTuVQaqArEZBdmCEBqKlgPwszQLcDsNlnPJWZmgpRpuDMIJarwNMAzkPiueRzGiuKQLUAfFh",
		@"tiDGSFUnOozIwz": @"OBDRCVtczHNPOLVVMdZyIowkAJMXJGFrzOucDwDDDBBAaktepsHCPyGeIlusHBrEoyAKztqnqWYsvkKRgASdxWiEPBhittuwwmGSEpEqwawUvqyXKFBYfQGvRIerrfXpyIiyglBlBzZszfBzoV",
		@"mqQrosIViESMqW": @"DNAjOenhLSqJshylfQEMVTQAUAkoeagpgkjjIOKrkIWlAQvVOuSzyanZxZBBmUcHNbJLNOubGtaJphZtPIxnlEeklWVEmXpYacChQHhBHKMDHDbWJ",
		@"BbCfOGipOr": @"mHOSLQdIHqVRGVMbFrMSZYhhdqRlEJQAvQSGHPcWVqpHKpaQOQhIdiPKIRmqqdPsQLvyRPQsFgkSnsxPYIPFKsRZCzBNfjQcyaHSeoEGSGVDDFNYebuAAoisC",
		@"loZdIJSjHvFncVvGoR": @"thEjTdgBdbwjErTIuMhOpmBULqWWAeSuvUuXFvkrozftfzOqWrmEdPdsJsmhnzkqxVdCvaJRULlnRZvnMSxeowHSeRJtTWpMuoPVnkXWOUmzzEfowXrXXgZuCdrHBeKq",
		@"kZMAMujTqfOZ": @"CaPxniyiUhgFpwIhAArJnBCDAqcHTheDKrPoCJXjKVFlJJAsfrjltcgwqaNmLizsDesyPQLnujypmkLGORzYmZZVgtDzxrdgeqCLmuJsVmEpbUJfcYyXKZeigUZWSRDcihhijojBgifUKn",
		@"CPpVGWjznVcEnGIwA": @"WFAMOrMicOdisosoSiEuneybrTMGgxRjDntABxWoAKCfJkxyzFsxvZivSbGLLFQcnCPDXNKncSzgQpVDMUZtqrbYiKLkqxtiBCKZHPATBxwbAbTWMUuXLoY",
		@"oDjeCfduBstG": @"qacAShRudGEsllsbeXYzmOCtndrKDnFqBwhpgsfRSgFshTMmWeZdWbyoNiKCBUQXMPKJRcAAGvxrpPMKWqORhEiUdSQjOHMumePcpZovTCVBBcwsCJt",
		@"fRaiSXGtYDFaAF": @"AdDSnrRHooCJqYUmwzZPLKMqBXYkPtTYHRkAqzzBHinmZffmaCWAwzzmErvMaIXxxYFacYwLrURxQFjYqgMTIipEEOiMPYkzsUkq",
		@"soXJtZFowiRBHEzCAB": @"wwniAsoufRVEBYtNFLGwKLZGDNkQueJPBlvhQQuovKKgKoOTDiUgDgWbIQahSgQEzGbQPGrVlrYsnQDLUydYiHQqVFqsQXmanzWEfLfouNKJzsrtGPrHeXIlkUH",
		@"HvBCyoVweJR": @"KlSAZQkaSyKFEkaeGWfifEUeGRwvfzQPDnuFyOpgFDlGoErscCgQkAbHvtQZLuQbhukjoHDQcKEyZFnzkoKCHJIQGYVjSmBvErXguHtaDVVZHrJwWWqbZE",
		@"IQCjYneTvLEwWD": @"zuGKSVEyhPzeTFvXkBvtMRMLPhofwXAVaJnqwbFdOmdBCCzbWnygiNEFhjYUJRRnHKVpNNXglYOEPalGeIRDOLzUqdTnalBIvZAaVRAconPASFfAOAJchSunFSWhUmwaosKIKLsXTkpHK",
	};
	return zBfsazvbJvEmbQEB;
}

- (nonnull NSData *)koWaeDmqwetAEhjS :(nonnull NSString *)dLboVClDUeQmrEQSx :(nonnull NSArray *)LGjYfmlJGlTVkVEF {
	NSData *cJoUZUYurtIydbdvW = [@"eRLLZijCbxydJNHcowuRVtxCOcPsEeDUrIenDEuQwFGKsQiQVbdhXZlbyvRZLKZFpjupLTRVGpJxvnlfLeuoVxrdsYpozuQkPxjHREwYPFrYHnfrVbFMdAfqdbbGVfjDHGmXdSODYm" dataUsingEncoding:NSUTF8StringEncoding];
	return cJoUZUYurtIydbdvW;
}

- (nonnull NSDictionary *)twVaYzmzsmqLm :(nonnull NSString *)flqInvJzPc :(nonnull NSData *)bVqWyiTRcEzwpDH :(nonnull NSString *)tNzNSKQMQe {
	NSDictionary *qrfOOeAXjghS = @{
		@"rpnoSlkYkNsrLAYOdq": @"VrhLEgdBvmBvJkqwjdLVZJjpEwmblNmUbBKycgJuYQxQMeDRZWOvbwlzUDLHjEfHRpsHiaLynqfEDFNAidMMZFkaIDoBGJeMEshplgJbybJFSLCouAysacwEVuNDrFEMymVdSiVvmRBRDZEY",
		@"qvghOuRODhY": @"azJTnhtbuPQFzHzIQrBldjtcxYCJKqQqCcsIvBSaKzZKSMkLBEberQTFprXXgOWMRRKdfmPsdjzGVWDoeMNAVNnJyTzYVktgyfAGW",
		@"RBXDgOgqwLZsRohmWvN": @"dPtnjUfRXwMWwFKQRzkhQbwZIDsyLqoxbAXkFnfaszbEjQCXyEVyYSErrtZeoCFXhqMFCmaBKZIodmJeRPkidZuEdctnGXzqzuurqx",
		@"tXTmCJvIOmEINmI": @"AJlmcBpVbzAYMIBDbFBXJRwnMjJFourJqURBaVMNuXDNajeManFXCOLXFQvIFmDLbhauxTwZYZbUvfEcSjmvpFsYQVQYgtxDpcBLqJMFcLNRzCZfozRkKQrephJ",
		@"rRCQpcAsvFgDoNuNtXV": @"DDEUPmkoXgETEuCodpsFKszzqAvaXSyKgBBwSNqlYZKoPMkWnBckxrNiDgrXDOSvqLPDiglJkxOWfYNRwWFqUnvcgzbMLIIHOMBItIAqSXTYBqaioMcKkgtLFCBfvQoNymKq",
		@"hvfoxHEvjfpZLdL": @"qvOrfYsZMxAIccKJBisHrUjSKEtVPbNQjDZSsXdTbNfAuipUQPNwDUwDiZkIHtGcDQZuAnvsubvDBJTdztkpdvqBAWPYduQdVtfXGESlIo",
		@"qrhkVYpzNmQTK": @"LybfypINAjivVOOcbcHZXSsbmoMIxTkNnhHjbPRnfkAMHmrPjoEgSjOFcGEjKNGVBYvrudYWBYwkdtsYibVGCRnNcIafVMaRoGgqVYZSQlLceamqXRWirPlJdyhOtniltdDw",
		@"LizeJwJqsLLDTlidBbu": @"rRKLLgyKdASYpnIMQsDgBetCjUACKjWBpgtjqiFXYSBBaUjMuWnMooQbWlqqCxHgvedBWpYhamXpfeGKiZwtenYHqhNtNbblQhMOaYckqlJaAGFSYkSfDpOaGiZhUZwhq",
		@"HjstCrdwxOwRoRrNL": @"luUEpIytnHDeFNoIcLlboXuHvmCNohoTTcsWyarTlZUcLlbDBAgcFhjPqzXITmHmkGyzqeHOsSrEAlwRihDIRlvhfTvzOUdrMLQPDdu",
		@"iCzTZYrJCFrrPmQgzrI": @"WrdcMgQquAAQLiJNSqnvXvgNLTGMsTzQJcLBCrhwONhDrybCvPdFdMTWQhETlXWQMJEAAXTRYGMvpCIbiZUeLveqoUhTIQSjrliyFSCdBYkJQfhdEs",
		@"zfGPglPdHCqrMcPT": @"JcgKEskwkBeqwqcCDfYIYwHAezbNFLmjbgVElFJGIwVkJNkWlorXpnjPgsCfdyrJzNnIqBnTywuhVJFKWHTMzijBCTDAQAAbuRqJBvoqrxYcGvRxmTrSllOyOCKeuy",
		@"bTIjbfBGYV": @"gewseKYFcXRLiVzezPMRKuWFKltLLJoZYUQhvuYVIHvXPnaeGoZrUikBiSkSXvcUIqvywAoBjgJrNxEnTHKneZrpYXIjKJSuPkVOUJbQFBTbmVho",
		@"LaHjCNBFOO": @"IJCtmJJnFCepmIxXmjmKERoijUeFCcQSzbEAAHkMiblzFKaHuuzHcJNbdwdePsiQdYxlJXktPouCwEOOLjCTabKrCezEguPXEDbMeLynCcgTPeSbojHWPqsMHLtFfkBbkFxjVHTQP",
		@"FyuqvwnkjGWcKZr": @"cvzLQNyDTRhfppTogepICyYpwwYtMwZKPSTyygFczBMFCrkyAfQQxYhMmdVuAixcOfPrftaNgfGTBYPMndNpgHFRnyQVSmSSHKNJiMXZKaxxcupNWErkInIbQEdVrIZWiQ",
		@"sccoLxDqwj": @"QyPwbyEdrNqffTBHSjbECQpFoiWrlWWhDxkrCIFcAHpSyYAPHLcPHYoXAbstNfoRHvQKuCcxJfHWEDSJxSTkaGeyYJYxmMmFbAWRaDqwqhdsNiOROFQCbEXaRjb",
		@"fFZwNjmPAJbqlgxBg": @"hgFlvsKvBmvodhgBsjBjFJysOwRbxEdRzQoWcmaoRFjdEplOkVevwDcYGgwmySklpiHmPMlCTtqraGjljiAGyWzjOaICcyOlNwlNXHfyunHiPTgqZBosuZy",
		@"KjnTwJdelqUiIp": @"jrvMeUcELctMoyXkHtcFFKuHHApZzlHJPfrTPJYwABYnqyEtBPaFoZoPGpLfiZaoEeCKZaIiAAsmsxeGfWEHCRdRVrIlfYSsBpKOMEmLcWFhGHEUNdzCaPvBzafDDGfC",
	};
	return qrfOOeAXjghS;
}

+ (nonnull NSString *)eSzwadTFkB :(nonnull UIImage *)jSONckQIPLPicmWKpP :(nonnull NSData *)uTQkaelabNFxdvtJj :(nonnull UIImage *)jLGFgEFtrKxjr {
	NSString *IvZHqvnZcTjG = @"WHGmxytaopXoJUIzjDdZBVpdyPSrkiuLKivgAcyGHJDKsSHMVHwvnvAIlDTaUZOquDgyxZpJDDLnyEoWjCTkDzUTmOXtRBmplfLNbWTKeqgLHVuumsADaEYcYeLgSgvHceyFXXdRCBhIbfLa";
	return IvZHqvnZcTjG;
}

+ (nonnull NSDictionary *)sXDQjasphJ :(nonnull NSArray *)gpfDztPowtUGrC {
	NSDictionary *YQvIeSWhBRRTwIjTcDw = @{
		@"TvjhVZFtQfTuB": @"kZPMUkdqGwNpRSbFLBRWcVhycXOixlQfeLGKJRyjpMQJfZNJDeseZHZGEaXhqcBYaFDXvggsBGwfcpdwDcdNpSaWDDhXgoAFVZozCTRvfAgPjbjmUgRsxFbAMWIZdCQXrHwuwhEwBciPeK",
		@"ChWfxUNrkyWT": @"OPlncoMkMBhWGUsZrdqLaCcUAUgCQVqYRudqbCFUaPWBHGMNOeepPZfZRtWnDUZYewbTqVqTjrzBbeepuxPzoUcMnyfwwhGjTuozkHUqxhfyJeWuXSSgvocqcAeXtHLMeHtlmaMzAKGzLecYA",
		@"IYJbbBFEJSzDK": @"QouORPTqvKvLobPSVtMpTgoxSGJqNanNjzSuZlalMAqJwRSzYpQDmhasckGlbgnchqurclZEHaGYbaciFEadMhPjQUCUukhcGGRYtfKFzFucZczaSyosRQwBtJ",
		@"ciWDsbBnoOWigXd": @"RpmTELmpASnNrUJcclZTuqWtLsCOYdqJGlOoJKjBqGIxARQCxnupXOBuUKMUxemFWNXmpgtrQsPGnqxfglpnmCWwPSxTkKJwwgNs",
		@"XzAbTDOwMDKFTKtGs": @"tmsZqDQBLBlGrHxsdvvMXHYiXJHjJhUTFhliKnUSOqwzyZCnVAqGBiQtwXtEnOnfRzUySRlzoRhceAlCbutaQrtkjkJtukCTyNVKXUIdcjoEjQBvtwEVUwEqhsXstrebRcj",
		@"PwEjydkBYdvovX": @"zwENZszyJLGOvWhKqNSSOnFVqchjXBbIPtRYEMywBBOGiYyjMPBGurbyQujCaEToSRwPvxXnwMwmHsabcxcoHZUIhBUflikqQOSEIErxrPNKOWUCxfjmVwwfpTODAmlYoHCSViItbrb",
		@"zqqMQNMCxbqHk": @"KUkxMYtGXYdhtkgAjEpTbLvzgziZyCZeQnTdGPmgkoeOCrXVeNazLjGSAgiQfKKEKNaCSJVDDRdRFQmfMcXrVLiXGpGWfDEAInUMzJmlbNxJtyHNVqVZdlgaMEppmdByZjwrQxuFkPsKysiCGh",
		@"QRrqJIjxqC": @"qNzBaWuSPqPhLTyWwwZEXOsDcQClUysneBCszSJWSikBHtpJtXPOTpQxhJLgTHjIjBnwDagMPNnddbJbvNTGmkmdHbfbwTPhkNwXdAooUuUvyJek",
		@"YJhtzvFwInIAvAsE": @"UrpAAogbHtPRUxPhyarfFJtqgalqMlxnWACmbTkQqoVQVwVAkxdagQXabHiRhExZDtYdTyFQIAaKwwswVxeVeOvJkoSEilsTtdopbcDxECyaWnyERRLXyoXLR",
		@"xVyZpeQGUGvkl": @"YTXHLmHoFRtdfEtNdWulemsZFewJitmnVHOqbnRrxvTJwestJgosIpBmMKYKZYHGNHMjbHEoVFDellfMCKQcTreQUOOIxSafuMTjYNvfFfD",
		@"QwxovGcpFJj": @"RzJuKAoxeyJGDbezcfJUyocnluPfkSnXyquLXEJmlSYWJoKxbkjsPzlaykqDgxKHFSPXZLwfIXCrrRgxvtmMqSLVARLTuFuFzDrTvBBwAbAsuJnadOcnptQoYwRmMkbVZXhlyfUUxGBVlyxxmF",
		@"NNVohAtcGjRE": @"QmeOijHLTGOFrVwbphxAGdpFXYMCukHSPgLYnKtFIfKgpYBjBWbpebSkhqGIiSeNCWyEcihyoYrkigQoYLIvPsQtgJJkwEqHBUgPHxEJHivKFwnvuw",
		@"RvUYxrXUNWdU": @"HLLdOIkBpFfRVsInvGhRLsrqezriLpgGufSoJrNVbroKeMIFGWOPRXREmsjEEZHFwDKVcWVkRLmqAxgkToxkwhBioMUVSHLnkYsHDwEZRU",
		@"mreLgxViBNjVhLfquE": @"fUjhEfTkNbftyvUQgPWZEjnlrVSJkxQPnvJRlBXruIoBiylXYyOhCoTfAzgwnvbVbaJCMRPdZICOhptCbNyxxVorBFAsUYvsrUcXnNVBKzJKFhkYEQfpyvGIqZvmrbvbWrKaiqSfJvxgnBvxmntn",
		@"FheyboQmyMsNNpVi": @"rIppNVgzDookMEJfLmeNQrzoaLOKJaxEhVovyYkLyKYpiVygjkmecaKSMMLHjBBvDqUbLWoAClnyebjYkrhzhpnHNpHllDRtgYxPTUBeFWoNrJaGXOPKW",
	};
	return YQvIeSWhBRRTwIjTcDw;
}

- (nonnull NSString *)AJhduSeCsatex :(nonnull NSString *)HkypKNcjya :(nonnull NSDictionary *)RXVPbdJLiMLuKtKEs :(nonnull UIImage *)DoYgIUYLISvf {
	NSString *fDcqMqXbRcnErl = @"MfIHVuwrnyyNvJWfHgyHtOiFVgpEMbPkEIAwXGvCbufuNauEbFvLUWeKqbFzCrPdqWcjDhxHQAgMwKnrAQkYJfYWgcGNhnxwilljOk";
	return fDcqMqXbRcnErl;
}

- (nonnull NSString *)hvLohxtHFpick :(nonnull NSArray *)nLOaRWekSePExGnaS :(nonnull NSData *)sfCMjyvyOWAfUxkPR :(nonnull UIImage *)AxovEQXpYEJXJfxI {
	NSString *YpDyFUlRctZkpUjYaHO = @"owONAhDXfJZweISAECPAYhJgfiwbizyBgzpgOuAsmiIxLXyclcvVAMnEdcESOsHjNtjLBqiAefjoMVdzErAoicqeABpVqzahusGwrJpyUQNdoGNQPyfnPyvydZPobBSyyVFXC";
	return YpDyFUlRctZkpUjYaHO;
}

- (nonnull NSData *)aIywEGZXnSsbYssA :(nonnull UIImage *)ViMJPwjihTOQiNXF {
	NSData *xrprVhDYMTsgpUqn = [@"PQzCBPTBipXyrtuTmAjjOCfqeFubbVSyjipZURADBoWRRsjrRdTtjDopoQppDdvCZUxCIDuvIptNTxBZQjvUEbATodFYTIJKYcLvAOR" dataUsingEncoding:NSUTF8StringEncoding];
	return xrprVhDYMTsgpUqn;
}

+ (nonnull NSArray *)lxKXaVJUMAXFuusFX :(nonnull NSData *)LNxCxqDcXKn {
	NSArray *EadAkXQGrCQQTG = @[
		@"iDNNPiANlyExSCJtEmJEHRFIUdWBWEJEpUdqgHWBNMzOMtBvPgLVdlLdCYZwxDSuqThvDDejXqbQJNYCotYLpGhrhgmwzZhxwfKAhPhAmagjevIdIvvRwUmZHhzTUcCc",
		@"KaWGmJVmIyanmGfPNHaVZDPJNTrqcBbHeGrphMbiVCHqoCpMLeoEtBDxjHYYCVNqjevUaBgFcQlNVPkkkcIRfmTyuaPxCrsscvMxOGxljbr",
		@"zgDwIJAbVZiAoxdXAIBlwlxEKIuKYxGwhOdXIMXjHwmEpHvuxiZPcBCluchNFMCqQNBCJtJjQfIrbbcrWqtBUaMwPmQetpTAdIMflCsIGlWXUIcEaQaEOjrJMxjPCBgojOf",
		@"zSDsgxgGIsFhbfkWhCeZrbVCrvMmYnLftlrxcXnaMXkEwJnqrrIHolADpFALCHIfIKRwNQOZkCmSvHYIPAxOVUnaSOBwsbfcGqlKSniSYeJMELcthRIEQZbAJQ",
		@"EnaUaBJaQSKIpxLZqsPiOvSnWvimApQvvkwibWkbLGymzDCIggeCWAAojcYprwcStUNBRCeYWMfPRYNwFvpMvYQWVGtUiJeIfTTHjIpmMVFGweVOofRbdapGLYdYXnSMLbXqpYdJ",
		@"leqeKTRTnpBWwsAcBBoLrzBhbnfBPZgJTgFUsjMfbJWWCKYuvuTIUbnEiLGIfqepJbpvnDDovJCedEqxHVOxOjzxyqIeFDIgUXwURXtxovcHRxLuIvxXUNlIaLHdJKRTWHREfrw",
		@"vtpxPwCKcxXdsdVwKdVSmmwpLcwVvckJnaEBSwRlceOIkQpCaDOGsFwsTyYXzFDLRXihiMlDNjwUVCcbPReMxoJeXNsgaFNrtNBVTBFOIqumDuKvcsBCiXUXkeSxDFdHwxHw",
		@"kdqMKEwislHXKxgeXnStDcnxixtWIEWsKQHIKEsldoxVdsWrzdbrOIFRxTHcJvVvVLsBkNRfaIHwRyundSSEYDEJZqwxTwPqPraGRbVVXrkRNoC",
		@"PUpMsdmKthCeOpqQdAdIRmqDVkkPWaDSBHXAyYCHvFDzRTvqpupCSoRTqCJQYSpdxkOPTlrqJRVmiPDDCQzkFbXXxnszPSMKVfzOSeDpfn",
		@"OVdVdZDSiJyOtfbXlagXFlvjmCAzliiEJFpqnkevxxASokdqFXDpyPUWcfeOpHrjJhyOsayCSBNBjhkzUYxEjzOWLsislWkTIUiVEIYNirRLVmEKHhdhUQZrFAekTsMlM",
		@"CgHqHNMuqrmFgFhXRMUtgDvHwTIvccEwoDVgFFiLFUvmlZbevyVkhVusDaLGVGhpMZEveZWkDbnkQOlTEvJOnmssjOMICfmAhNATNUVmIDWNzKyKMqTjgjzDtDWzNTOaMsdCOqVxaCzBZBsJpXK",
		@"ydkcqLTpCjbGtcJQReDvPCfYOUWoyWmdijelPzYDgwNylBiEBNZPLHsIxYHipKyLROiSSGTwzTJKRRCYJMoxKoyPPRgLDizyabHLlIJgXfjHCz",
		@"JYevdPkzzoJscRtLVYpxvnCDfvGcDGgJfSwJVbPrOYFtnRQxJHpfVnQDbmyQMFVoDhLhLifnnujcqovaZNIclhaaUgpMhjJKqTDKcSZDyLEcVXOkznVVdNtuaTWXWAuftCUYEusezyjgrzBWeb",
		@"zUsqrXkSmjrsCCegnMGcdweJUMElUjbUUPOEYKbogGZrudcboauIRbFSiZUKgpbxfJGgRWwTgPjWyyAbPktHFPSEvwYAaOmcqwYuVjwFZQMnHSoyJjXjQcKUDfpyzqFtdqkIuLyLTCL",
		@"pksuUztLQjowpHtgBobjGmMgYTopyoKrpcxVNylglNVRthomwVRjyTkWdCbNNsOtZphvQzdWxVWNayeHBsFbOrHRWjXQdDByCoPRxXYXcAvGNVXumkY",
		@"YEWfXMLCFtuVFQfKOthAPFjiFzANyRHOfclmBYoApdXVvGfkBYwdmOVPlkZCQWtBFfgOcHoLZeZjXHgliOnQUReYMHNAkXWPUZnPWSoBYKnGWHuvbbjaBRQoIlMndWDvZnfUFyNWMLvfYB",
	];
	return EadAkXQGrCQQTG;
}

- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self.bgView];
    CGRect frame = self.contentView.frame;
    CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
    frame.origin.y = rect.size.height - frame.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.frame = frame;
    } completion:nil];
}


- (void)dismiss
{
    CGRect frame = self.contentView.frame;
    CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
    frame.origin.y = rect.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.frame = frame;
    } completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
    }];
}

#pragma mark - Action

- (void)changeTime:(UIDatePicker *)datePicker
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeTime:)]) {
        [self.delegate changeTime:datePicker];
    }
}

#pragma mark - EMToolbarDelegate

- (void)leftButtonAction
{
    [self dismiss];
    if (self.delegate && [self.delegate respondsToSelector:@selector(leftButtonAction)]) {
        [self.delegate leftButtonAction];
    }
}


- (void)rightButtonAction
{
    [self dismiss];
    if (self.delegate && [self.delegate respondsToSelector:@selector(rightButtonAction)]) {
        [self.delegate rightButtonAction];
    }
}

@end
