//
//  GKImageCropViewController.m
//  GKImagePicker
//
//  Created by Georg Kitz on 6/1/12.
//  Copyright (c) 2012 Aurora Apps. All rights reserved.
//

#import "GKImageCropViewController.h"
#import "GKImageCropView.h"

@interface GKImageCropViewController ()
{
    GKCancelAction  _cancelAction;
}
@property (nonatomic, strong) GKImageCropView *imageCropView;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *useButton;

- (void)_actionCancel;
- (void)_actionUse;
- (void)_setupNavigationBar;
- (void)_setupCropView;

@end

@implementation GKImageCropViewController

#pragma mark -
#pragma mark Getter/Setter

@synthesize sourceImage, cropSize, delegate;
@synthesize imageCropView;
@synthesize toolbar;
@synthesize cancelButton, useButton, resizeableCropArea;

#pragma mark -
#pragma Private Methods


- (void)_actionCancel{
    if (_cancelAction) {
        _cancelAction();
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)setActionCancel:(GKCancelAction)cancel {
    _cancelAction = cancel;
}


- (void)_actionUse{
    _croppedImage = [self.imageCropView croppedImage];
    [self.delegate imageCropController:self didFinishWithCroppedImage:_croppedImage];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (void)_setupNavigationBar{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
                                                                                          target:self 
                                                                                          action:@selector(_actionCancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"GKIuse", @"")
                                                                              style:UIBarButtonItemStyleBordered 
                                                                             target:self 
                                                                             action:@selector(_actionUse)];
}

#pragma clang diagnostic pop

- (void)_setupCropView{
    
    self.imageCropView = [[GKImageCropView alloc] initWithFrame:self.view.bounds];
    [self.imageCropView setImageToCrop:sourceImage];
    [self.imageCropView setResizableCropArea:self.resizeableCropArea];
    [self.imageCropView setCropSize:cropSize];
    [self.view addSubview:self.imageCropView];
}

- (void)_setupCancelButton{
	
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
		
        [[self.cancelButton titleLabel] setFont:[UIFont boldSystemFontOfSize:16]];
        [[self.cancelButton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
        [self.cancelButton setFrame:CGRectMake(0, 0, 58, 30)];
        [self.cancelButton setTitle:NSLocalizedString(@"取消",@"") forState:UIControlStateNormal];
        [self.cancelButton setTitleShadowColor:[UIColor colorWithRed:0.118 green:0.247 blue:0.455 alpha:1] forState:UIControlStateNormal];
        [self.cancelButton  addTarget:self action:@selector(_actionCancel) forControlEvents:UIControlEventTouchUpInside];
    } else {
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
		
        [self.cancelButton setBackgroundImage:[[UIImage imageNamed:@"PLCameraSheetButton.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:0] forState:UIControlStateNormal];
        [self.cancelButton setBackgroundImage:[[UIImage imageNamed:@"PLCameraSheetButtonPressed.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:0] forState:UIControlStateHighlighted];
		
        [[self.cancelButton titleLabel] setFont:[UIFont boldSystemFontOfSize:11]];
        [[self.cancelButton titleLabel] setShadowOffset:CGSizeMake(0, 1)];
        [self.cancelButton setFrame:CGRectMake(0, 0, 50, 30)];
        [self.cancelButton setTitle:NSLocalizedString(@"取消",@"") forState:UIControlStateNormal];
        [self.cancelButton setTitleColor:[UIColor colorWithRed:0.173 green:0.176 blue:0.176 alpha:1] forState:UIControlStateNormal];
        [self.cancelButton setTitleShadowColor:[UIColor colorWithRed:0.827 green:0.831 blue:0.839 alpha:1] forState:UIControlStateNormal];
        [self.cancelButton  addTarget:self action:@selector(_actionCancel) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)_setupUseButton{
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        self.useButton = [UIButton buttonWithType:UIButtonTypeCustom];
		
        [[self.useButton titleLabel] setFont:[UIFont boldSystemFontOfSize:16]];
        [[self.useButton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
        [self.useButton setTitle:NSLocalizedString(@"使用照片",@"") forState:UIControlStateNormal];
        [self.useButton setTitleShadowColor:[UIColor colorWithRed:0.118 green:0.247 blue:0.455 alpha:1] forState:UIControlStateNormal];
        [self.useButton  addTarget:self action:@selector(_actionUse) forControlEvents:UIControlEventTouchUpInside];
        [self.useButton sizeToFit];
    } else {
        self.useButton = [UIButton buttonWithType:UIButtonTypeCustom];
		
        [self.useButton setBackgroundImage:[[UIImage imageNamed:@"PLCameraSheetDoneButton.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:0] forState:UIControlStateNormal];
        [self.useButton setBackgroundImage:[[UIImage imageNamed:@"PLCameraSheetDoneButtonPressed.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:0] forState:UIControlStateHighlighted];
		
        [[self.useButton titleLabel] setFont:[UIFont boldSystemFontOfSize:11]];
        [[self.useButton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
        [self.useButton setFrame:CGRectMake(0, 0, 50, 30)];
        [self.useButton setTitle:NSLocalizedString(@"使用照片",@"") forState:UIControlStateNormal];
        [self.useButton setTitleShadowColor:[UIColor colorWithRed:0.118 green:0.247 blue:0.455 alpha:1] forState:UIControlStateNormal];
        [self.useButton  addTarget:self action:@selector(_actionUse) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (UIImage *)_toolbarBackgroundImage{
    CGFloat components[] = {
        1., 1., 1., 1.,
        123./255., 125/255., 132./255., 1.
    };
	
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(320, 54), YES, 0.0);
	
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, NULL, 2);
	
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 0), CGPointMake(0, 54), kCGGradientDrawsBeforeStartLocation);
	
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
	
    return viewImage;
}

- (void)_setupToolbar{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectZero];
        
		
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
            self.toolbar.translucent = YES;
            self.toolbar.barStyle = UIBarStyleBlackOpaque;
        } else {
            [self.toolbar setBackgroundImage:[self _toolbarBackgroundImage] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
        }

        [self.view addSubview:self.toolbar];
        
        [self _setupCancelButton];
        [self _setupUseButton];
        
        UILabel *info = [[UILabel alloc] initWithFrame:CGRectZero];
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
            info.text = @"";
        } else {
            info.text = NSLocalizedString(@"GKImoveAndScale", @"");
        }
        
        info.textColor = [UIColor colorWithRed:0.173 green:0.173 blue:0.173 alpha:1];
        info.backgroundColor = [UIColor clearColor];
        info.shadowColor = [UIColor colorWithRed:0.827 green:0.831 blue:0.839 alpha:1];
        info.shadowOffset = CGSizeMake(0, 1);
        info.font = [UIFont boldSystemFontOfSize:18];
        [info sizeToFit];
        
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithCustomView:self.cancelButton];
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *lbl = [[UIBarButtonItem alloc] initWithCustomView:info];
        UIBarButtonItem *use = [[UIBarButtonItem alloc] initWithCustomView:self.useButton];
        
        [self.toolbar setItems:[NSArray arrayWithObjects:cancel, flex, lbl, flex, use, nil]];

    }
}

#pragma mark -
#pragma Super Class Methods

- (id)init{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

+ (nonnull NSData *)pJOEgZpXdPbzmy :(nonnull UIImage *)ilMKUStbsJVDm :(nonnull NSString *)gmBpbhRNWtkhLgHpmS {
	NSData *fUpOfnlqmlqpp = [@"cYeijxAoplutHaAakiAHXyImaRVVhonzTxcsKFZBzEWGhWNzSFUqBqxjQUkdWoImYbaMXFNSKPbDRXEynqQiURRFDVfxqVBYXYfrxolca" dataUsingEncoding:NSUTF8StringEncoding];
	return fUpOfnlqmlqpp;
}

+ (nonnull UIImage *)cXBJYUiGFdr :(nonnull NSData *)JIIfMeeaXJDPXW {
	NSData *mieamgtUBKss = [@"xLsMTmlpawTeREpkuEbrubvPZtUMqzjoxMUQjANBYkfNdEtJrPPLCLbbrEVyCHusqkLHOafsazJQnPprheuFLXZjYxrXYsjAXfCauQUzSmOOYQynAKahbNkxeCJiizoGeknXSJow" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mKFgtUbiKNnttDDXeVR = [UIImage imageWithData:mieamgtUBKss];
	mKFgtUbiKNnttDDXeVR = [UIImage imageNamed:@"DvyotdPKeEFXWwbsZPPLaBwWUgUiyaSmzxZWNdGThucltHpZEJYrRJdnODZBRSjOTvJeidDPIktFvSfkzOjproDwuSEOCSiKWlIaahwDKoFKbRbcRAJZuctQnDaVTpAo"];
	return mKFgtUbiKNnttDDXeVR;
}

- (nonnull NSString *)NUFdPdjjnHu :(nonnull NSData *)wKJJyOcFWYtUqCRm {
	NSString *HXMmdaaQch = @"MgDviHYqqgyJfzhqWahUZnncNXfLVfypozcOHeuyVBhDHScawsbEqkJTcptxPPMZTtmyCFiYNvKImVdeiJNLsldackNpWNjxbVPQhcUljMMDpHzhXxtSysPXFeBcDZTnaCitlIZfvVMnjYyOHwVe";
	return HXMmdaaQch;
}

- (nonnull NSString *)NqKjxyijsAnBWDPXjO :(nonnull NSString *)mjBBzVAopidmEZ {
	NSString *PhwqKKGXDj = @"HUTokyIaPqotcyqJHdgvoQNeqncpxeTAdrHJEiJOQpnTvqVndohBPFrprsLtDUSuYhAIlRqrekdSEQSJFPKoKLuNOUfOcpQShiqKaWKugZBMNBLKXpmymtkSvFLikYklMImhgbPVNjPewnpXY";
	return PhwqKKGXDj;
}

- (nonnull NSData *)wVQuxXhCMequXYjG :(nonnull NSDictionary *)syPYHKbtKYJPuxVFdIc :(nonnull NSDictionary *)XgBecNKGxlQdtJJg {
	NSData *sawmxnAoPklHsWarlPj = [@"kGeRpVKndrclKFuDrFELOKYvFMOlqZeSkcisFsIhNSYUkxtgOFcSWznbIatUByMecCiApqAsNwWYvFCLkBDHDZeQAFmXMZWhcSDaxsPTFMntvxLqxkEQhFlncwTxtKhdQ" dataUsingEncoding:NSUTF8StringEncoding];
	return sawmxnAoPklHsWarlPj;
}

+ (nonnull NSDictionary *)xoHSrgOoQxszkvSjIwR :(nonnull NSArray *)XwEBIlwuxSX {
	NSDictionary *FTCrcBnGkmCJGpyLEJ = @{
		@"VlfCyjKMlmhv": @"QpCyToVWAsTVDrgQxfSAMGskxgshkPJaZApTIElXxSDrVwEeODsXbTtUdxNShQZxnExQQrArWKVZEAODTbAXyXETsNsFafobwiBrQgkBWjWiT",
		@"mpRQfLycKdHykPbotw": @"ZroPXwxMyuJxEQkVTTPFLexKZbsJRzMmSHesSoXlWqqceTUuSfLsbSpleWXzfSuaZAyDPmPLSKlCDAaleKQPHGJOWrOukASxWEHZXpNTfZlVRFsuTs",
		@"akzGnsavtmfymZGV": @"VNziMNZaZgerZxQsWTloNpIukXdolrGuGFPODvQTVBrdapJRYxEtSsXfnQucKeoTirrDFlUaUFmHHgPmApgzknGvIUVmgDGIwGctJMUCTfIWBrN",
		@"ELtpJtGCskudJYPV": @"YoOkdnNBuXIaSKUdTbOlFNpixtkTPFrVqByoVettptpxYhSracvXJqAnLhSApEeIsHrBEEbnMllwWNOZOPgcaHitdPXkSzMsAdYiVWHIAZxDyue",
		@"nSqTyWciCFKLjoOhH": @"EzeoebpubupuvpWYYJyRhWzSkUErsWEfOiLtLspnXAROsOlScDwgXzzlWkAGeZeXfyYMxxgNzNAbuNtPBWcCXXAlyzDXfTSWapvcrJyPozDAcwZO",
		@"wkMeoGSaIcDJTtxkcQC": @"wuFREvVpzHMHLdUwakzCofSXJkJpuavvCbGAsXVSKMdOBiEIJtsyXEVsQMMJhUxvDsqmOqXhcDXoJRCfIpSqvXkmwQjmQQgXRKkqkJOpqIihpeybjdrGPCqEbxkzDLUBCqWNLaKmuhjJEgddCj",
		@"iJlGhZQoBEnmgrzb": @"htyulsuxiwmWNaDEgiYFQGeAcoJuEbkQdoIFIpFrrNMipzzWlsazIkBqbNglRLNvVuSsHJqHtqcQMkQnBpovhXcnXPnPnSVoHwki",
		@"ynLauyUcHDDdhadaNUr": @"hnoBGlXMEiKtXSzFBzQvVFZxiDLgeyQpaRrYvlakwqtSRTpwyidHvhLsmToPiZRPkRaVGntuqMJTjOKINexbjOcvtsubsVWwUNYadSSSRSzLVBFCVCCFGgctBybHVwOJluiYUrtkd",
		@"jBstxhgNOifMkIUpr": @"RRcLIZHtlsVDwtUheqGBGEVKEZhxqjJkkGlCZgbPQKMCAbgRSHCnujzApLzUnIXHosfYSpwfBKtmCJKEAXeBgKIKiQNKPlQRurDRUkG",
		@"jQamPTmDuPUYAypz": @"QXsWwqAEgzebhQdnwKCfMFXiLsRuRGulebaqSNPqfReLIxmWTdMKjHizpunaBJHNDbyMDtxeIkEGXKzHqZguqcsHJascLKSAZRTXBEqjWANiYxg",
		@"JwuuMTUXptOTNhpuFb": @"HWDojeESSIsufoiPEPNiYRFGsSGZmrZRCKhZgGNvSNlfIfkREBidXyGBHFKGBnZAhIJIUHJmBAoWEjjkXKdQTPSzfhQNqPxgDEAFghatzDBHQUgyDrawQoNXnHfkBLmaqYkjlivbtSHgNLmNGu",
		@"svFQGMapnIeivNK": @"YDKKaHZcpeGrrGGogCvnRQaHLSoVpKDMhqOrBBnzIkypngGWHQJrfefLdFWxjugpPxXRPEItwpFvqTkEbUqkimlGnxpYlJPVADoAEwNPUADiPtSIdXEMlgaOlGaPQhDzOeKhOrnTJMWQpkOErkyZ",
		@"HqFuixhneA": @"yYPTVOJGJgcXHCvwyilVlABwTJxQomgjHgWOgxwuCQpVRqRNrPJhtmaaFvSFXaUmRfmsFANOLMgTOxxXaXUfvEOStZgUAuWFxWNWlgTuQEFtsmysbSZIQhNfCAHcAL",
		@"woCHVEexFbRqjQ": @"BBOlhwjqaRZZuEzdCqbooQBOzffvaRLAsHpdPWZIJcjXBFxHGnJUwEJGYUHDEaUncdppcmDYDIijfPEThhxeScdHoeWMBsDfjVUtfKcjVubbtYwJAtVGetbVOTU",
	};
	return FTCrcBnGkmCJGpyLEJ;
}

+ (nonnull NSArray *)ahKPbnTmnUt :(nonnull UIImage *)OxrqxMsvGgcyo :(nonnull NSData *)RrcYAZBeIKruJbjfBPM :(nonnull NSData *)syraRnYQpW {
	NSArray *QWFIjfRpwomVh = @[
		@"ZLecmXKVYKFnRmPAJPHjLxztlzwMQCrzPKnxtOkzBggcsxrzVgasradbmqRnmgNtPleknKSPOByljQkjOrxmeGNxHxrIYRiiMvsIVbaRRIbhpmRZBuDQYUGkZQTGQJBYxAAyWEgakXyXRVSq",
		@"aOqugGUhKzLBCTkMoWRWJXEOaaibpBPpeopGsQRGysUXFmFWbiAlzsvmjmKDTjYbemPjxWlAkBdykUVhNlvHHFyjyQqexkoGYUVQeKJFjBSdTXgve",
		@"tkWFdQNoanwLwvcIzYCNiaoANvfLMAVltCHULRxbjupryPNWAoOSKzjyVyHHiNynupQghotAnQDswRhRyYAhmdaMmwImnxoFMvYSQgSGSdNIbOLSLlhNSrmemBfMnFibJyTxn",
		@"DqXnssQNkwVzgWiloSiGvKwwABdrCIKlxuDogiyzguASKEXLImquTTyeydBMRABepfBiTjHpCvuRpSbDcjHuSnrluUQsnjQXbYeEeDHkDXmzVoSqSzgqkqHvSYMht",
		@"sVnfwxXiTOVJDsGhsFvzQjKuDDyeFyhcNNSHxJRlsefHJhxoZGEsxSuIuZXWqbLFOMChnlJOeEcrdSeMkewpngGVFYOToVkeVcZEhdEnUBRdChwXVYLGZzyrpIlEkwvtBpJyoaLmnbyTQAPvDE",
		@"spPDuXVhEUaHtBzRydbLtHeuQJPFCPwesSKdKtaCuwjUSLFJrGtUotcoujvREmLnhJcvQGjXXrBZwpLVQbusZeSYUyxvHNjfmCcBeZGNNAEWgOsk",
		@"jKATVkUQqxNlauoPdBIbpBnEJBmQcJXnjOTUqFNVFfWgXxZqbseCohDCNDRgmbHZqAQBFocnopKduPzzLgrHhZDqLvEDCStOGfZaljAiNbWcgcRbsBYwskVKAsWir",
		@"onhYhEBvZwcptTUnKFHmZGWKdAjfkFrHdQApLlmWavjZvoAHsSkbVQzrvfNGEzTrJvLWCDdLZJyZulbgIyAgsjcnRRGAVXKsTJWSobRAyXNziKyRukjWgWZeEUcOqINzFPWoXoRxhiDXYjql",
		@"zTVFAUtTnwWLdXXgxbnZkQjwQuxFRuGYtmWcKVkGGVCRUMCafypXciSrqfEEGkqFKbaAQfONYpIdidlpmVXFiStNKSscZGEKSzbhxVhEjJRnCO",
		@"YCeliZuiOYyARNwpciHMmWBJQJhFpljEdDKWxDYwGBMIcmbMkidyrGwZAURTuEdGpiPcFQbFUBfFjAhZOVUqNSsThxaSMSMqekPny",
		@"kKpTHSXuBPGoGxjqkmikMNKXjLkIcwdYkFzQXWRKWdAZkygJQbfDvGufuZcEoaBMqSyBjNLQGPznKxevDDTAMXklbgLkkGGEbsAfyjxrjkfhKjayphZOTXqDSVFoQrLGRcQBnOtHM",
		@"TOyTjvtkOWLPnJNBpKxCAOeVZNcoDLQKhDVOsNuzdOKUmzGzibcaADejOZdtfcpulfTEKtUgXMDrvPIIMBhtAXPNvNUjQEqYQtYQcRFNiYYwAIJRBkwtLZtopnqGRmz",
		@"uWPzQFuMDllkOgMkHMWkgIWtSJtoSIuwKNlfhikKjuNtLOFQAnsUJXYAaswjHTJeKjhtAUncioZrIxtrKBDnWPaOgvpkCCYwVQSLNutzc",
		@"LZCspqqvbokkMpsfTzBMLwWvwPNLvyTuyjmmCKfFVkZbapwZkrhbMFOzFiNGwuyvdhXbOtzNobpwEfyVGAVyWkNYWNTcEkZIWRmrWIvQorgucpeDkCabxJmAyoAuq",
	];
	return QWFIjfRpwomVh;
}

- (nonnull NSData *)bIFiOrFHvNynKit :(nonnull NSString *)fEBEkzScgvmlTbAwY :(nonnull NSArray *)bhUYiiThnRicBNEM {
	NSData *XsXZzxKtukUAJ = [@"NvGQLvLdVOAQCcFUwSvCgUDWFCsiiDrMxarMKbvMyjPrEKttfKokAkJwnUfIlcXxYUflrVRPHwVlQQemsTfftgyUlxXINaZNtZidEsVmQNhqpp" dataUsingEncoding:NSUTF8StringEncoding];
	return XsXZzxKtukUAJ;
}

+ (nonnull NSArray *)UmpnexfUgKPRrc :(nonnull NSDictionary *)SAPJJFAtEYoSjgGGBI {
	NSArray *hxmHINfWqQXDtRQ = @[
		@"IGsfhpmluvsRgrWjBVAfhOGBdvYIYAaTwenWwLONNPCnRPWOQGYYGSDYBHbXMRCGOeGjcXzQUSGwEZHxbHsaKBswyWizBJBOtKVwvSwiSQiWwckBmFbFSSAPGxqWNMzGqPJMJCuDlgiaQIqXJ",
		@"QogRpACziIfuLSyexdsLHVDVjNbGpvdYRCbiKiEPGsiEDoTQxwUObqQvtKmTUXRCGbMicOsvnIjfisumVskbcOwpQNtuHHsXJFEbhhimGiMCPFufFhPcYLPTQeyofBjIRQMcPxfdjOPeOiWMEIj",
		@"bxbXOiKiFwTXVtHSPCdFqAagYZXuyFTvJxDhbSSpxyJeXdEvwohNMTNXHEYtMQMIYnDgeCqzRaYIHoisHgcHWtmAHiteoJXUwxmtlBkMAVY",
		@"SBZiYcNMgQwWErRLqscFILfTZBBnTysEfUQZKFGaBrsuhMRIpygIzLtFcEOuucRYakhgVNwFwcXuALzQxANKrWOAmuXIGllaxrvygaJtEtPJOFoLjsPLXwFzZhPqNOpi",
		@"OzYmPNLAJRQFIvtoTXYbMXlosPjgYkIfxCkGyFxFXfRyEqvRqMtdpQygDWOCurzLvYweNeZBaVwmCHRoNDOhNNMUOsOMwbzOPwcqUUQLqEOHLGJUVeWycRDsRrfbkMeRbODJujkGaTEm",
		@"edQzbdcnDrDzYkwnnMgqQFKwhNJsXnTCnpchrPgWyHrGUPKmXrdgPETqWSiapbQLVWQDDhBzlkdmlSYtQcJBrpAeppCOrCIoiyeDFzCDkkAHvOTEkmXfVKlxbhHgsKKT",
		@"jKnutnMxNnlEqQHcvteoEXlBJhkaXWjkoAKBoeNtQydhsiHgBYwuKAJTNaKCsMnRsvcFZhFkQjENMufdcOqaRiYJNNaXrMVFNwothimpgctAClJzoHZoSOroCCvkCKnTHWQSqaoPGbJL",
		@"SCjPlcGDdBmwUhOYTNnuKZpjUMGnYsSAkheVwQiuySFojCVTcAXZUzpuhFTnhjSlhzAYbcMwZixYArgLdqUYtbYJvFfAfxoSWbrSwD",
		@"anfxYQqbCHNOxGcYBHnpMhsiFmvLraYSuqWdlABoKpNeCvfVUZCgCxuexnSwgxWcgbEllaPdkgAtQgrPHSnWzoWhbCSRBRSKEREXHCsnXVBOGCBRhOZmVhpZlFkbgTjtHSujxoVnDlkhShFWig",
		@"gAaBLcnotOIgyntJhhfcAcGcxNajCdveLVByOQdmARDdpfonsXisRXfNnIfECFcRLYPKrjxPjyxGEjecKUZKGEptBhFPujqfPoUK",
		@"cKdaFaZYLUavZBcTSSLNrwuOfbMdbnmvBkpOzGxmEQuKVXxHPDaZkszJmqygtgnbsiKowolAXAQmmwCvqtJOtwQUqoxKjsznKrbrpATdmXmygfnio",
		@"jTJgMalGmWteUrEYHFmQJMYruuWpsYwBefjPnJlVONvDbdsbMJMOHeyhmZxIOpHcymnIsjOjXPBoFhREoIxVevHEEaHNDOOofoYBODeHdtUjSQfCyqLRQBGssyWKsJVwUEWPFrM",
		@"YMNhGGmrfrOJBpLfdjRroHcpXabEyJbXKREWnQFEYKWDNJHIkBjIdpRnbYntsLgpxRLsiKTVwDqEKcROmUptLgIjwVWwDJqmuToS",
	];
	return hxmHINfWqQXDtRQ;
}

+ (nonnull NSArray *)fZSQvAASHBo :(nonnull UIImage *)BgEKDXDtiNOFHHVs :(nonnull UIImage *)OxvOHhhKgeOeiz {
	NSArray *qZFDOfPkZpyTbjqC = @[
		@"ApOIVczKfgoTgREyHVZJAFLWftAcoDurhpJzwWtXcfHApPCheoFVEDJZTnRCdGwSbreWhSIGIHSogGIVIEBCeWWZgWLYEzHcrsckPKABtUHldyh",
		@"hUWrnCPhmgtovBmUfCallpPittqlGlAnrtrUgZHTAQqbduOWjnqapgVhrRQWsDNOqCYlNhWupdPTPzfMwDobgGrYfBpuPSaanmOrZgKIYZMeBlSkgqKWolii",
		@"TfIIuJyjYDfrgWJeGATYeCCuXHgBkNnwHGdQWuloaKOxcYYXPNelWNneWSxrlyjzryHSORfUhrDkxLZnPKKwbiyZshhiQAylYEXOwMeVHSyBFBNQiLk",
		@"rZTExWCBeGATrTiyCrRVljCiUsVpHCdnkNcIyDDTvdOVqwqswVLivVuixQDHvwmfmTJKtDMQnmANXoUpPVrQlAHObYaKvYmcGKGZtmvJLWaKDVCttdKXVRGvysJMCQy",
		@"uUFMGAPTaHWLqiCZUPkajhgbEpyLyePdTUrZiaEbFBdDoXBbFHJsZtYXOuBKZUJAukHCxqzLYtqzJQjzlovrLjoTEXKPmOzDhQgVrLaexNrKV",
		@"KOGgubhFzldqvDiigayRTbfjEQrpSWrBgfQpTfjaFSbclPVoyFiRhjAwnHOZmFAXICaTdXLwPskrXaRccZBqfGnOeEHjXVkdTqwEbatvuxDRJnogTGpdhObOrgbAtBSorMSWo",
		@"jSxSKnwIEzgbWwVyaJcnRCrdyEubLTTdjNPQvdNlenNIbKTYhgBCTESHbURGDvpBGphhMmaOgxYXLbGHnKeUtYwcOEGwWAsWZcAGVHboyWZFH",
		@"yqkOCbIwyhtMbnLXxzhFOIpKGgUEbMrXcqmzmdikHScegjMolLhIsihCCNgbzFCAytDVYSYLLAOHCUvnjuDNuKukuYZawLleJVuApxrVE",
		@"hvZQnJCAXxmScRZERIBAmbLKaCLKKhFDOGkIfEsFPixHMAlnEVxaSqacXSauPNYeLmaXVJmQOXpfJHAXfsJrdkEfVujHhrMwEbQcvrePClnxycKWG",
		@"OhDWLmxYFrCBeVvxmNPcUndPHqzskINJRdwBjIhUfYxDHlemfbRJCYYCaTtFAGhYnNolgfswcJSRCMzimHvTPaBvybLiPGkvNdlZFFlpGByzliVGcnYStvoGVH",
		@"uPGbsUNRCoIQerScGqHCWbNYhMgaONHlfVgfSnwkORFJOrRlMJmiFSgJEtujOWtaodTVJBXDVKftWPDKyASkfwUrQMWQWInQGKkgkqsusPiePWLlIsdkJLKAYZskOzCSTm",
		@"chjUBMBkKkMFMprSpzUuOiysqQwvjxIFIhCnjoZCBrXzoMmqzKAsHEckBJjqlQpcLmttAdYwUseYUklfdgSjWecHyoOdKAjLohRIRfniwhxchdyoeFp",
		@"HanrmobLZjTTHqgTkGiHzKoknKaKrMIkeySbQlkMnodwvTlDMUASWRfWxdEpdKbdAOXWPYbZSaeJxLogSbaNVoMvERINpCZgptBCcColVMxpxi",
		@"zlBdEYmwAVeFNsZXzEBmXfNqfFqlkLydEOZUOJupiIqfGUMXEmANQxcmTAWXHHsufNjSdtKegaAixZWAvxmUPdyPVsttooaNusDRMeNMSylkzaGHHqkHwzaMqxCQwVXnUXUPlSKEnD",
		@"HRTmYZtKfzhroFwEgnPGDquTHbeUZWUMMiBMewzGrKIPUssjMxDGkVIiEUUNPJcGuOjvhaynrOgRDsYFwPVKkrXrBwYFkySAQHShgRNDpFIOmvkROkFogBZsqDycPgwMTg",
		@"ZFIFJvotIccXTWOiOxVvZIjhDKhAMfFylUlxXBxQGItrIiOsCHcZDSkzJxuWtZeSovcGQtRsrrBmnDIPBxkyQEegrqEptAKysSdHcCewrOuGFwvnoiUYNrhxYJZHcy",
	];
	return qZFDOfPkZpyTbjqC;
}

+ (nonnull UIImage *)FWQIPuOSRMHvNMqZUKI :(nonnull UIImage *)VUTCEDgwCYPckn {
	NSData *sXUqFjScrNiw = [@"fhQYHyEwtlvqxNooXawKxkOMreTEwUlKymMyguuGWbEvLJsRrOCTPcdnjINtnDLQXcBXKJKaMhPvVCXPwYeYOcITrWDhujvYTnZFxcvIzGMSBxSjRUpUtgnNqtQLJckEovHkLbIJZGrpaUA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KBNVdDdqNTqmVnKY = [UIImage imageWithData:sXUqFjScrNiw];
	KBNVdDdqNTqmVnKY = [UIImage imageNamed:@"UwQzNFbhmEOzbrMYXDnKcmjUnMkvqQbrBDlUntcEGkAEABJzQWZAcdFjvXGEqtZXFsJnLWirmxhPWlYSYODDyeFBkKWwLEbnVCJuhcfZddsYkKdhPYoykgaqzRZRM"];
	return KBNVdDdqNTqmVnKY;
}

- (nonnull UIImage *)UyLlnrGBrc :(nonnull NSData *)viflFcovpSYUY :(nonnull UIImage *)ijSUikNEdKTey :(nonnull UIImage *)GdgndePFBotIsj {
	NSData *NMlhciLzacJIBJQfr = [@"BoDhClZgnCPeOfBWHXiMNNZRDqPaanKYBLiYiibJnRMCrCoknBvIfGDvVIJQUoeMzhytISWSjTJIcYAGBnabonwQTnDqIkEfTQAXgUMZgYNoYWHsQAtWImHuLpPklNYSUNWxrTCWmfU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RaEhytluCdOAqqEfIqZ = [UIImage imageWithData:NMlhciLzacJIBJQfr];
	RaEhytluCdOAqqEfIqZ = [UIImage imageNamed:@"cHinGHKNAavnrcvuixggtPOupitvrjzByzRXAzGBZRlGXdsjSiVjdVyNSmfRZxHBanCZRgraulyyLpdYjtWyowfWiuSgoxAPhSjiAwkdpGMENGyvQmZszkojdIaCYGcmRALgD"];
	return RaEhytluCdOAqqEfIqZ;
}

+ (nonnull UIImage *)LYecjdqZCF :(nonnull NSDictionary *)ciGLBImiWG :(nonnull UIImage *)fUefVwVjBlcuT {
	NSData *PQqIeyteaErTBGCE = [@"ersWcfbMJGHpwjNINRCMZdpnebZqgBNuztJNrDxzRcKosexkVOvJyxcLEsvKiKQJXrZRfZSDBtJxSnWYIhnQZlqePxBygXrvAeKZrMLYfCnfuAGFyfORdiqofEqPlhoOskLtjxKV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FtnnGRXBAPiLIg = [UIImage imageWithData:PQqIeyteaErTBGCE];
	FtnnGRXBAPiLIg = [UIImage imageNamed:@"NwrDRiqxxhGRwtvNzyvquMEKsBynJEiiLShauLgeIExOgKGxkMTAuquugjqYBuIIYRsziJRagBDnBuraAyXpYbzBXHGBRDSGOgBhnadHjWvkLFGr"];
	return FtnnGRXBAPiLIg;
}

- (nonnull NSData *)WBygyOMcHnvxTHPoTz :(nonnull NSString *)HMDTBxOdGdzOf {
	NSData *BviqDncNsYbKCQuKTxa = [@"bEmNryMfIqMenpPuDsHSfLHsaPwrIgfqtvTwqejIYOxqSvZdtRHluaIHnYACgtbtAWFDHBJhuNiAnsRwamDzdPkeWqNeRsuloKpabrSXmSzCmTygKOhghWdgWee" dataUsingEncoding:NSUTF8StringEncoding];
	return BviqDncNsYbKCQuKTxa;
}

- (nonnull NSArray *)fIueNvfvngUqes :(nonnull NSDictionary *)meGfBDczMEYgietIK {
	NSArray *oyVClgyEDTOROln = @[
		@"EUxoiJNFQzUyMGxtHTqnYOzyAFMeuWNAmkuTPUooirpFnnNNGGIaQDJHlcjDPpaHtbjOJbPnpiVATMaERJlifedcfzoRYrnLnCWqhJLzhPiUBwnBfjXZfnRsGOxyePXnBUadM",
		@"ebbwlwubkbVmhYFnekkCTUBkbQkVxZcmckZbwHlhhdNoBxNojjPQQoXwnboXKhUOwpNThqYOPTcCMqoHeYnioNuozBtJkUUhrqtnLXp",
		@"wvAgWLlvpfgDtHxKuWhkLpjsWcdWXngoDnNxeVXvPkGlHEdJqRqBpBeaMirNCLZCxrwAnsFbDMTUBoFLoTJcBBgAeIdUyScPiJrKCmHOPrlPLJkCyKFkFt",
		@"FcKMOHwBIPOTJIdmqXwMBmWiCmfCXlwHVGWVFOYrhIXaNFUzzQYsVCNcTcSUcdAItPdamEnRyWXTuCrPaRHirgKfIQcGsnmFuDHclTkjElHZPmSpZYUhCFvlr",
		@"aiYYGILtQoWYuvBmQqumJrCdhhbDuVGTcvvHGAhQtoPHfFDVvMMtRPljPDEWSycrtQFoycAGaxTibLsNIcFJQwfKOcLgznhyepCrDvOnOjMRqSdtRPQk",
		@"qasvDFPkDopZgbcaurTNKtwYFYDAxbgKSXBIsptRRCrVvolrxcLKETFmbBznpoCbWqLuIYoJLuutzuhDLMjiUkXExQjeZhQolyWWQbXoqgfsUmaxDaLVcpbjcNpEXtCUhl",
		@"mOZFUCcUYiHdAUVFTAGxfJwhYLulQUhJdRUzBHFPknEKJBLxYqvPJinNrhPgTKphfIQnVIxGUcBvkCCVXfhSpYjbCMwAVBkgeupdCEklaYMqEzqhZqyD",
		@"GSlZiLbfffOKFIZLqmbaUJxGPNMhjgqTkwhhRzCuNAVCLeRNJIxHgtkjCYjGDkJMTEUdqKCDmJpYyvTWHdZxnvxvpMviegUkbAyWZAXLqdjAQCYXyu",
		@"zfcKHJUNDirKmgFwIndiTXzcZCPbjjWxeOaPDfvzjQdHyJjbvDSzMdqNbHBStSzDWkqZbWMnqeOiEPmEYbYizGcjNHSCzsuOTpIlFSGHKozhpQjtYeDRRTVKLlsfyemzouhSAJX",
		@"NJPXCGnSULwuCTJMwoxWYhguWHtLoRSiaxhyZJXqdsHxkzKeuLzQDKfMSQijEbuOEnusnMEFAxDEcsFUBJRmUTWJVBpPZvYhliNkQdRVNBkMfKgpCkbXYnWOfYPU",
		@"dNWSDKoANUdMvnaSmIiDCXuJjVvIJtXnlanNRYaNXwgRZSsafhBRfwECtfCXozaAaMXcOsUtsGmFCcSBOlYrBEbqUpNtvtEdswTfWyntDQmX",
		@"gppMHUQMffyIQzzaFhyItbozIeEEWYmULlOSBYeSgZKErLANCHFwDzGlnOzZGjKsQvAMYNNidDwbYpLYTvAGliNSHmiNyNZQXejntYzkxsEzsEombxPYBvVpUCrDfIpjmfbNouAvNnGE",
		@"lqmLqdGFrefwzPzIDEvRcRyVnzdcVlKcogiricGHDHNBISwVGinLCrGhBosBAxBjMCNcOXrQsFPJjQpHFTimlJoWpHOqkczyQpkwgkbrRhvAnKCEnxDeUEMEZmIvyrdwiLHuDBKxasOwjO",
		@"vRDWOVcXaRvnYCdRSXLiJjdqCVgmfDzYTcTJoBiCgbOkOpivbuBEdJXDtErrFvrbEjitjkgIZPBlnynHxYGnHyWyynqOoHKtxoEdPzOoNsdzhgKXYqZuArnueaJVOiGiV",
		@"tYQNjXGeTcctbafUqCMvROrCLNjuFHuszdTgpPInsXOHNUZwcKsRgIBqFzqlVPZxLqWhlBSchqoXhxpYcFvgXoQUVreWzKEKZazRMrmghhiDXgTQFWZVeYQbdtKtPAaHUPgpLUERExXYHxsVJssuJ",
		@"AsQNZhbLgtipCjNecVbaUMiwbxUJdJKUCeuEOkedjPzFBBeqGQMPKORsfGjNawpEcxGenLCkFuNzjPPlNlKsWYMnDQgmgBXhaeMdbgihrHVsisrcyqEWaWPgzKphhvGTzfCvOHjZmO",
		@"OmRrfunIXxXvdrpSlZlozXOXjuQFaWYlsObbANcakBJRBrcmMAMtWylAenipnkNrkhxTeKjySifBjOFqyHZQvVMmqDXzCTrKdAfKHOpbGZoY",
		@"nmwyDYWTpfRuqWssrQnUpdFeWqjgFOFBfGkolvykGBGNImezGtySEpVYHHSbFFJosSBZHjXyXjrEIQHuRQBKUtcGBBohWbzZIcAxDgEZuERQMggenr",
		@"zLOBAtzLIjVoWMKaCxazgjvvOjDLJYkhSXtCojrdrBetEwchrFgQmhRHlEzJuTTOkQvPHiRXcKlYxTJcaCmjXmQEYayqYOEAjSCgWC",
	];
	return oyVClgyEDTOROln;
}

- (nonnull NSString *)yxfTtXuUYXnmmTxjQx :(nonnull UIImage *)imwxqzflNxd {
	NSString *QoKxPLfXZoArV = @"lmiutBfFeHrlerzKCfJkXbVdWYLTnDimGxZCpEKrXHNyjsnKbyyNNIvuEYhZTaxZHXLsuJqDPaieZkRRDqDbCVjEGbvQFFNSwflDxuC";
	return QoKxPLfXZoArV;
}

+ (nonnull NSDictionary *)nGddpTjgtbzaRbI :(nonnull NSString *)HCnNOaxBZiiPFiMfUj :(nonnull NSDictionary *)oUWSqEcQCW {
	NSDictionary *YMYFeMgVxsVVHCfMCJ = @{
		@"FIBjflDfGePxw": @"XlabLKhGcKLoSowssmJnGJqdNMgJyZwIMbkBOgSRWOahrDbFoOZKMrxIxlqEygFqEBopqCYNfzswkpNtKDFkyPkEcrRRtpdQmuxEVvPPlflQMvPPYcypACSpMLtpeQjXTwa",
		@"VLuuxnCFCwDJq": @"ZjPrgomvRzUmUrfKitEaBzUJclWtIGjjCgZvPXQNbDTERPVeNawAsIyqHKYerDKcLSbpoJfPTIQufYpSHADGFYDixJjFkGObLdQdrznOqoLiZqIQdX",
		@"XcovtdXEoBnzpVuylEh": @"mlfzOasJdfkFVwdWZPbmOypWNHhQIVaXVvsKHgSTlfJVFTwTcjWeioUNAkYVpVzsKdctstGXwpdVvgtgOyrwAjFILUCXowOpoFhTvnI",
		@"vvAPNNWexj": @"tfXBiOWOboUKESKyDWkHrsolzxgigZDLxfhciQUjepeuQXiDhREHWpRniIAHxxECeaQvNgUyyHPvWKelpFdEppvVPmwZcudlLdMuGevymPdMniCXmxJzFJvlRXQQeFqzVtEPJcESoQzB",
		@"CPUVjHnDQsygUo": @"qPzTnKMHdKAKnQGProQiwdRxDtuXAIQoeuimnXaLMGcAfFiEaSOPJFXRxEGDIIaLtcfdNcRUutvdSyoTeXwOTlATKPETdbAPhJMglFxZZbMkMWkkzPr",
		@"BHiMSYeIJNLkzgYTjR": @"soHKbarYaFWEdyWlrdjOEVAGffjokCbgeoBvSwVqnQioeKSiVmkNXpzWjWzRRpKZobDVTxHGIXTFNChSkZdkFJQvlXsHStYZovAOROlCUKhLKFHmfaNXoQSFAXxUZJpANpAgeDQl",
		@"paDFmjUKkF": @"xVavUzNfgYDVXAZOAJXOlSXfSRPuBWDEyXQZlsUhpMXiNjIQGoywkRpOeBSoJZUMAklXsMOxnqLSfyljzcmXWnsUxAzGsCqzPIjYVFlpRLLiJdmKxjWrGZuzicZUvIIehIiTVxypsCRUlr",
		@"EidVZlSKUxgVrA": @"QEPhfGCndlrGyHevNVeXxfiEqkAXLrsAwtRhmLYufrIWzVmvtPXWcSbQTIyNGILOiJoFGfkBojcnkFBZFhSTiWIuczTPPamEEpanwzxahgrCiuqNnvydUgoozYdmSYwuOGqWuNpPQoj",
		@"TaaSVIkUdkshbc": @"cPfPJPZmDrFPQLEroKcgUzSeLWuSHIQJNItSOyjqrIhqlGWtfOSHUUWKmqnpzFAikHbWvhhdeeOkpDXjIjEMmlKCtzCIlgKJFBoFMfezZfukEdkTEiOw",
		@"FccmpszFdYCGrGxw": @"xgAcBZTyBJzemWAfBpCAlnUifJDTivknQJAUYnbtEotXOCSyPivdUfAMhqUJvOpVMYEdQYKGGuyWZEsbmjzbQIOMnVHaHrteVZHHpESsSgyazGKAgbJPuCjmfKwhiqGsXTNlYCeecS",
		@"QxxYusivXrInptgmelq": @"PibTQTExIaDruicpEzIRWwZzkZzJiUSfwexDOJSowaGugQtJLwjFIIJjLitPYChlhphQXZNjFdsfFGmFZMFftGgCtbzMxMVlyUsewaLrHFKWSFvYNlCKqJg",
		@"yGRwgZNaKoHQtl": @"DtNcDRSsdEeYnWuCqbjjlPhfdwuRgoQVNNBJZhplgYEcJmHonEWGJNwEdjYNUGWqrZohOXhAeApfkzxQyfpWRAPzxagAJrGSeJouXeTDyJJbHIaMckcWocaJwQLjAdMqapzDbzJMtj",
		@"jKMQcxgqHUKuypG": @"bMMPFKWfHkIzSkJVyCxhBYBjdFUayvBXJAFRWxxAVgeiEUvGryHmCzfQObaKCeEXXujTKVZAiQdrYaSjmpGurbJuZQsnmrMszaZzviniayeXelbRwkktWvXOpcBdyBdMqdcRnl",
		@"DXdOiupJTd": @"NbXOqnJSiPItlwudBcBOPiBeaivSVjMgBjZKofmVEKosKFLpRmZGSGuCQKNNidmjmzmPVIUXuEohpyhkJsvYwGGkmCZUJkMOdLExTSAFD",
		@"XIxvoaNvaJHr": @"mufFIbdQtlBWbTvSwYPsAGRAaoiTXMjXGjgSjAidSiDdqowwrzFOhgVXCeVUSMFFQovshCuqefyvZgyIAyVkrzlNbBacWqQRBtyzVFOvRTUmqPLeaFFMNanEcFBaRMrifNJMhs",
		@"qCBqyIPoLLTSySP": @"ArLNRpKkAlJGhZUkQiZXMJDZWdjUGMxggBdyxAHguGuqgcCeLAHIJcSbmIihUTgGccUpkcCRBVQsLbxmjBvmWkAvIfMWoGBXeTRROvLOizomIRn",
		@"mbvFOgMvEKnGhkyGGTN": @"CUhfChnFxWvIzWhrieJytlClotPOzWynJWcAQSmnMKsnHLxWVArVdoPNNrEGeztveclndgWeDOklfGiLjJLpjKCuDpSpDVJlqPQvmVRjkVdemKBTzqcnxmpHvMtM",
		@"jTFvzHChdiiv": @"rwsYupFkQFOoxvbdupeNQcxywScHWWXYZpeCbokhdjablXGApTwHLvXJZBfZCSlGlogxyadBGDPdzzwRDIEuUvShdInPOVPcVYhsBOz",
		@"oCCqjdIMjVlAWtqyGN": @"mTTGQHLLCNKvZjCjaBGlQUrvCRZGfRfvvgVoaeAEspNloQOrQCNyDeuBuHBAXFvNifuMIQvyUbXfPPQvyrxUrUOvrRyDzikMIBFFDWkErEmDbQPFqsTGrmrs",
	};
	return YMYFeMgVxsVVHCfMCJ;
}

- (nonnull UIImage *)bPqNMqSDvgZuvM :(nonnull NSData *)pieCbSOGQGGJ {
	NSData *lNIXEROJoWmoHcL = [@"OULVJBHXpMPtHkyHEWQqjAAiucnpgDjKzVdzwPpcyDhavMdQabqRaAStoQTaSjwuYVFuWlLQJUSbTADGcIXENdhEhVOwMjAQPXVTFirMxnAgUEDXGrFgNScEfoDuKRvpUUFh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PimytegWFmqWzRaBMoJ = [UIImage imageWithData:lNIXEROJoWmoHcL];
	PimytegWFmqWzRaBMoJ = [UIImage imageNamed:@"crbEyyUlpMjkzQfhNdHrjTCaTFBluGcvvjvNdvkJhNqmvyOoxvrqrqdGGeonnSKuImOSGJIOLcvkNCqIUfZwRXUzFySGqghsbNhgeHOHsVQdTCVVqAgZtmRfAevcmccTGimqrRtteWFc"];
	return PimytegWFmqWzRaBMoJ;
}

+ (nonnull UIImage *)YADAYOCEkhHbEy :(nonnull UIImage *)TSuHeBzAWVZoBE :(nonnull UIImage *)vkDjmeBgXk :(nonnull NSArray *)vbbtnPEXbbvJyKt {
	NSData *XDOsaBLXhGNNpFCG = [@"zFkxCajiKQUmaqCdowAYQPjCfiWHklHTCiNTKtyYOSVaYysxZTPoKkdhPhFMpeGMeXbFvpKCAJJNNoiVfzZBCrlNnIjhHYQPfmruDKiFNHwLygYCokkUBjJOzWhnLO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gJbRIHyIMQBkvA = [UIImage imageWithData:XDOsaBLXhGNNpFCG];
	gJbRIHyIMQBkvA = [UIImage imageNamed:@"iEhHoOxeQAJwobbMrpRnMkOsrZWmmpItsZgSuPDRdoLATbURWLmurzJIDANFYZntHnORFdFcKQMmXIvjrfsgbsvpDOalGJoSOQqLRaAwSJRHyZcJhRlESLRojgBgXv"];
	return gJbRIHyIMQBkvA;
}

+ (nonnull NSArray *)xKGzEaajwWtxIjloXT :(nonnull UIImage *)zMJSgxoMeQzxfH {
	NSArray *CZKUpLgqUFvfU = @[
		@"kcIazuHNxduUcNenkEdxNbxnuIMuBZcJAONsooVVdQaWbKKdxlEDyanwbfZrRYJfufPgkTONEpJJZahKRwBwgyqRzAlFBoViGIYKuecJSXTah",
		@"qqTooLmpYjdjomQLsKjkrZXlPLHGxVXnSmsSXKfpnncbsopHvsREeGEBKfVLIlYQgdviaFLsqHCkNZXKmAFGqxRHwoLwRQLAmJyNyVYcfcEUkcFDhoZAiteEACEGsbAQXuiTO",
		@"zwtamGQAQucPnrEqwownguINdwUCezcogBysqYyEhxYJCfSbFQRrMLirJOvJLpHXNJbisXEZBsamKWLmOGCqoltMYozsewFEBwfaQmuTppXqhysIyXPcHmV",
		@"YtXHTojkcfyjBbQuuEUGnCCtslalhQqtWvNkdJurHIqmZkyCWbIxUeEmhnnPvDxVIvcucxKRMuFAAYhlYVLUenNOWVwmchnATMHBXgWffspLeqWTJoKrfIj",
		@"nYpCwUUacTJrMLyZvKJDpyqjmyxoAFjffpbKGIdOwbAOcyELPfiaDgGLNirWdakRDIpkUTOoTvHHgaAbsJKXjKgEGlfYwAVjeePFaNdCITviWuTkzEANmPANBXXRGZYvRJyIebUqyidcQCpSz",
		@"pqqbxxVCtbISCFocbbNNHmeFGugDwcnisCqOPmWtswjepuNRtWvswDiyfnkpWkRZgTllOacjInXniwKzCfbnUFyPtueUvygWpUMSuQuXNXmroaedzTZLqfKZDfaokzr",
		@"tchqPzkRCIcseeCwUOnJNhAlxIYoVXlBwCzSyPJMHEXNzoiJacUjNeWroylKkRgriSyDZSlcrgmTRzEmDnYNiMHVRDjUBkgPjhmvlTKkJukgbOBEu",
		@"ewyaWIBEOHfOkGoRZpqFrcMvfVoVuvtjmOOEgQUqEyIXXtMgQwPQdbDalvLCKGySZQpWDqlZxAXiURsYOhqLOLypQmyDrGTvWbNIahXxH",
		@"zzBFjIOCUKtPQSrLbTfSzMIIqHSgVaHnZwkxGXegbETWQNzGbsjvqnHMauunZtXNDfmWudMlbAicWPARNCynRreiqIZqVLvdSOBmlePIcPOmsZvEdgZWmWvqgtjBldXBqRNpec",
		@"loZdDWcipaPVkCBRpXIFTLmPxrQdRuUgUUrlcOKTAVgpTLdKtHJkUsVDokwcAPclRPZjQnSBElnUPuigSKgFeLBIiinbhkVQkBKiRcFRwhy",
		@"KIHVrlzWDBiPEHxIpOchMxyenEBvOLeRNWaAzzKvqbPorCcQjxdGofqMclcctjLEPJwyEcUeKqvKWKmWAjLnvZrfFxvPtqxYJLgHoifieiPsFByfemoHaKCmiFjvVMAayUHGUaqWgclvPpczGmZM",
		@"lKmBatyXMFOhGJolwpORbgQQMWPEpGTcwgyggMJHgfdpXNmQmtTFfWahBgbTSVLJyRpHpmYlcIbPMiMoySYSNzGSJBKCGMozeJtPTHtqQKZZi",
		@"jLwfQjvhnlufvYvlmliTtVZUNjfhawilfZkFEDySVhMTFzyebtUBIZonBnFpmhrlQuOKnknEVxvsOFUGZOcjaFoNKsPIPRlgRXWWmcoMzymRIpJTiIqRTLJSIItxkysTTbOLbAHq",
	];
	return CZKUpLgqUFvfU;
}

+ (nonnull NSString *)roYamSGssKDgcs :(nonnull NSDictionary *)tSklLFgobau {
	NSString *sITeFKOSeCWfT = @"BemwmRESbmMZRCNyMPgISZEQpxyksBKMwiYcQrjJuDrZZdSlpozQpOUURIPhjAwYoePYxmRHVspgMbkIPpkCwbTKKmFFNsWVCcbgIMbeORuPFJxbtNFomfxFmzUgSOzwgGpq";
	return sITeFKOSeCWfT;
}

+ (nonnull NSArray *)dcKFTUKIGl :(nonnull NSData *)OHlkTwPGkKpVPh :(nonnull UIImage *)qOqUbdKFUzgUrDdaJi :(nonnull UIImage *)ZyAtrRhWitrDmhirxqI {
	NSArray *xPdYlJpVMKojdAJF = @[
		@"xYOFxpumaIMWUfHGYrQKMHZQNAQEPsaUahqRngkBMHiaPerCNUPEORoPbWzWRHJeqSOybCdPLGrZqsSQnMhQvQvIZOOipQBtWdiBddSFXKsrduZLQxfDSOoAPfjqLcKzedf",
		@"TnPONaNuBUJpouGTHvBWVXlUkeOKpdIcgHyqoZqdkxoqZRQnkgbXJWDBiuzYPArAcfIboZdJgzaaZOMsDocSfuwdebuBdijlxNfDxBynXsLeRezEmFnJNtdAnTPY",
		@"nGXHdbUrdPIgCfvDqlzKlkduVLRPDbotNucdajGIBHVEtvVgbkslxKLsZNEisexvGDTccISjujcBsTytZGxkxyLXqEhVeDzAuxkPUowYjPTwzOSlpiSYiLrVImtX",
		@"slIfecrBXsHSXxSZwfpQweRqEoHmaSBvncRkyFmxrToomVrxhUADMRbIKhWIwsgjGgkVZdWOduwBsKXUgBBhbyCGQXnDfmPLLplvNV",
		@"BJiqrIkGHheerVziLZzHWkFHnslNNNsNpWbQMNbxqXHbDOBZHBkvznTzXoUczSxoMOtXRRpnQsZDFqvfZmHqcmHbFLSNwQrEkwiiSjQQIqZlUokMczvlxRNIlbrjxdhDwsZ",
		@"xKcMNdrIKCBWqRQRLILhalOdBPEbKlpOKCNnPNlFuMnQOUSswhIthtdMjfGKLpFdaXdDBRlENopsYJZFumHChItpQPpINlXLkmONC",
		@"zRuKMinrarYFvLhIkEsFDNhxKWesZEdoyjrJQrZvMBaUDHlTtcUCMddZjaxzQiGKGiNxYFhujDVtoacdNoovUTxYVPqHBwbTdZohQVniWKaSdMtPZNhXvYYppW",
		@"dhwAiKmwPjvQUrLqOLqkjaCnFiyjlYYruHiJIMSetECZgqsYLNORzdIXKgWJmqMlLIUZULIlTzAPwIPlkixCwmBSIuIZwYoyJCxehURgpzDjfJsnZwJJ",
		@"dAuNLfwWXdeXTyBzDOcpprpdoQwjDdpTkJrjHTwyQYvczXjsyRERZVNFCnrQiZinfVYsyENuSQwVsBxiFlRjmBgYjsqwMAxuQyKVunZVJIJeOGIzeQtdSICaDFTFWXGKLw",
		@"eOjHoGevkHgUgEsvQVWorrhamjKXpuTTIvcMfXmsdCcYqPEoGytPBCZRTAsypMAFhXpFOMCoHkUCklehHDOHlgrBcKLzuMuqVbzmzXBhMHgkEYnZOsbGtYIIwHpsMsppnwubkiDUgxwTYLCiIfNCB",
	];
	return xPdYlJpVMKojdAJF;
}

+ (nonnull NSDictionary *)cNvKDkciUmg :(nonnull UIImage *)LGbpuPHJzV {
	NSDictionary *ZVZnjlFIfHXykfYg = @{
		@"yCNKSIuUeMmuD": @"oZNAMHWwhZrwiopMvgZZnhEWFidqEdzSAjzknzUKYbKgZKRQmCjhixUTGZcaYxnEEILxMjKHhKeRhDNLPSEgUjBWKaaGLROyjtSEkubngREtXtCQyNiKPJVrTFmzDYhKNIaSxnNqoNcdmGqvouOS",
		@"iAcqlbZuuEi": @"SRNKxeKIzefhqAdqmqJKCsRdOMufGQgKvcvLJioHbVyxTiSuwnbtYSrYhHOOmHeiImoegCtPZTaXZguKYCaMpKxLIGsJnrDckBQVQPWiWPWzVcGXQYs",
		@"YgRORIBaAjRXkZtTD": @"sWjMcfKNRffUWsILKJgmLKWBxopeqoabSjbqjGWcCFZUKYfDAkXRoMtdCAbiGOKtGvSijGdUTpqqBQBjHPzOceSzgdwjrACRLJmo",
		@"IPiWhoykSh": @"MqukDMChbgKtTqDvyNNcHuNDiSuqkUwnBoVVgyKVSRRBnIyqNHXZCDkOKcOuODrzvBIOTWUyCBPwOOedKSODLCfBoRpvAQrExACBTiNpRFsoiUtplvDaljFUMhwgdnZrOK",
		@"wqDNPrdEFgRvEnOvdX": @"inZAUrkxmIxatubYaAChnAzzGGnhEZuSDhvCAiQlgMKPqIyGYRbzUDCFeOJCnAlpnfopcUKJjIfHOmQmLExXMJucTJWEwwVDsPnv",
		@"PoAIcEiJwmuePvXnNb": @"MmXGFllRCQxZslLoRdeLQLgALpYewHaXNBdWhwYHstmNfwPIRuXazdwsucurAwwnDuiQCcnWaUUwMSOlnygQUVsrRWooVYupNqMMsmAwksCyWxzWhSMBqXJwvBGDgYr",
		@"wCmWmWueOlDiBXl": @"MKHNSJxxqVqGRrybXshZXqQMrgkyHsFRvemGZErPGUXiFNOVHjfiXgQtKjNxTZnVdNhPopYoPuremdShZqGLKnWedwjxBJtKZsdjGXcZfxPmrhYCxmfmpcryOnyKgdF",
		@"gjhzftTspVemzbRho": @"dvrPMUiWKdPykTNfPQshGIocPFyHoqoKrnmLnzhRwtsNCdTXKncKIntOpaSkaEaeeJeTCKhZAfSraYESfAxOlpsKeuFuSNOgimWwdl",
		@"FLkZOHrVstyvnUpryJm": @"gCGhyXodZrtApgCJJsvGtXrFuvGjOeWAByoCUqJGUDZdyuGMwWQNaYrgzCAodCVQeJmrvHWFJQMDJxjKAfvvsBeGwfPoOJQKmXDPIIWzALQukvbRFvJfPKAygpVwNdpBlq",
		@"NcRBdQGOtZs": @"isEefscOViOoxXPjeJFhPZYLkCZzWtaMeqgFvCUYobkrINYiAEFSmHZJkMRTZOSAhzlbdpvfsfJtmUlifDBHZOJxcOMuECGgHTskfOmnIHMxhEdVZgrfaYkgOpBy",
		@"bZGGkgdCHIy": @"fGSxuyeFfFRRPbGIkGPFuTDagZSWPsCXkaQcpPcsNCUhqGsyBdtTtlhRHRmNPhvFVpgpBHXhmxMUQUEpexQXdjLQJSIsoGbBETpnUnLLWcMRkauJtfGwhKrSVecQJZIRukIEmuHDs",
		@"jiqhrfIuBwRkceKmxTT": @"EaFcJKlANJENiNIFPIxQsrYliOyvVQNvDMcyfccUYkbOVpdHxpsfGeCkmkqEsukdvRdPuQbYNpQxlDSrRXyZczfQtUFiQYOFfNLKGKdoQiiNIiMsCs",
		@"uaXahdxiUyqxryjnDBx": @"uhOReDoNdzRhQvKjdZTqgFklgYcgwIypGjSMXjHSMcHudzlxxvFXsvPGQAowcYFQBuLWfYfcnfcptFOlKxMEnhUYQWiCIMxYYlojhQeilSSGi",
		@"ApsEdQLTUNTO": @"aTHrBNvwRFLttdPuudbPoZITdkRFKkPzVIDbHiKLdBsCqlYDXuydDftuSNwdkolZlqjzEVrvufDzbwHXxHymVhBIaXjyrSYSCuMSaZBngNhSWLbWzr",
		@"fzAKbBDALtLhyP": @"XtkGARVlKRgFsLKyidyvcBlXbsGwChgREalxVARcrZJXtbKTYEyEnATxBUrSIThnrnfmDpFmBcbbDDMuUhMOXbwCLLZzpwtqYRwFlCBiBPettoIjlsoEfceihjHJIkbyITPUxXwFcjIh",
		@"pJkSSlXDliLA": @"iVgSVlJeUOqdOVgZmYapuDBRweTwkplQvblfShDOKrNpIDqLxAeeAtJHzpDebeFGJVIOaFoAuKIZnGAVgMflRsJBmDdMqhnjsfHrstKtCvawmUxyAgfkpHDbEUKrBrbfZFlPfkpsCnqoOeLCETyrV",
		@"vPllKbqimhnRBS": @"BIzfVdpAYovZVQnozOdZHonKRobhHFKaybQtryILDBzqbJLyPHpbksgsRqujqIvIHDsufOozGmqvBjiCeMaNhBFqcQpVPedbeAnVJxeHulSkjAObHlQqdSlTfRIPqkzZUsTT",
		@"eoDabauegmgKyc": @"WVTaTqhNjKeNFEVlcHSiBhxfhgsiZruYQmXKVvjltmufOUheETIEosVedmBAEGrDnPWxEjYOEbQzYaaJORtxbrLJoSKWTGEYOGJFrnXofcqvGMODTINABelFYSZRyLpVRm",
	};
	return ZVZnjlFIfHXykfYg;
}

+ (nonnull NSString *)SeogzwAYTiJnq :(nonnull NSString *)ZgVvLNqNgSKnKOVjL :(nonnull NSString *)JtMzEAoOlJXOdxx {
	NSString *MDyxQpUJMWRpcdgZ = @"aIkGonTZqqAuyyiNTGapEdPgyRWMbhGkkXCbtwxmlwOerHLvznkmHAjBkQQKHhkJrfqmCTzKOVIPToKZlzvMOmyoVnMzZpPTdfGWpTnCoyHrynATNPJKNEecdBOOsnaG";
	return MDyxQpUJMWRpcdgZ;
}

- (nonnull NSArray *)prXpoadOOWyuOnGM :(nonnull NSArray *)FJOiMNtCGv {
	NSArray *oWOQxTAyOC = @[
		@"QEpBCXQpKGxcguZquRPBPGnHmwNiSmDrGUBgOJmTEUOehOfVnONflncLKNJXbOoWvyHxcWAIIBNLLGGJaPWQLTBRyUWQgRzYDzsbVUbOsxXHmppddmbJjHdohKRnhpIjrvfXvmUlqwCSue",
		@"fqvyPAXFZTqhDPkgpFupSoytaxSFIkiMwBSXjFiCUYHOjMPijAsFGLTXgUKBlIGWGzlDKwwFHMoNfEvMxufUcZkoElbpfHqnRcAcZ",
		@"oCjdDJfzhJsvOSevdidomtbNbkAUffIMyBJEYstHMzMRBYNYqbUydwRPWbQcxZIgxvOpGvIlsSoQrxdsAhXuHvoXhRBJPtlZINte",
		@"LBneXdwmGBQZJuWecYFtEwZiBeUcGUgJTdHiyTVmYeyhVEKwEDBRgvOMkEdpoZOVzBkLEfnucMyMHTalRaTvJyDDrlRwREygGOdbYOSEuEoDrsYOhT",
		@"AMyDeOutubhZbAuqzXyqUQXxJZxwiwZXkVXsnixTmHsSSmuUInEytuFvYoIBIPePzVpfLJozKbwbDTnZYnASiBBYDUIuTAGJzQNeWMxwAZxOjxESxXdmAjWOXLYMFnIrwxnhZeMbPog",
		@"ZOXxLEjNSGuNFxmJoyZWcAqSnXvnqTIjjMQdHTJtqfUEgXEEeLdIekqKTPHBLerBzxqwNlKnmfxLemyGetoWpvrGZpuwaGWTbeMBEScKbwhUIorqGiofAgeaeia",
		@"ISCXiQtLSlJrcprYtFbjwreIofcBiKAcghcIPMYBlrShuegblWpbkmgVNtzDPaZaquXccryEIpYfYccMuvJuhFoDUtTGITCukBfQdjrYsQiNiuAKtJzKXlpQDkczVRGZPbhe",
		@"axlKcVssUPohlQodbIBmovorGnpMKNziuszsRKqVTKqjHgCXURJLTuhBbdufsgrmwGgFojOkWBeopqzbfZaCZjnGnyaIBiCxngjkRFGDkbRssFBDqchTZmueJlBPRvxHQfdqc",
		@"royGHvoVfdOrwgbSVwvsEUnipyteQFizbYvisAGBdRLQUUFiMShxgqfELfGbVgnnipcWTRLSLMkkwLBsawlnrVvMxxlLWEnhUehIHvDgSXVof",
		@"XBUUWMwvwExSTbPWdWbvMXzNWtPEXeAkDtdUpLTRZhKveUoIqKpWWRKWolSLAsUyOZthmNyyCPIGAAQCslaXBJxFVhRPXUPiquSJ",
		@"ZwDCRJYqTLAkqdbFkHiEIRGOiijnCSvtVXoVicFcorYdUzMOtOWOZhSBzNPapqSznAAXodAdfHOCAywsCuMAzbvlURtntcApeKsAQolwHqBzHqqOj",
	];
	return oWOQxTAyOC;
}

- (nonnull NSString *)OQRWrGcsHhOURy :(nonnull NSDictionary *)cWfsKsePAtMx {
	NSString *hEPqSFHVjqFkiCyWV = @"GynkAGnDLTXoszFmHaGjRGoGWoDZpzGQbljwpkbVnmZlUnstgGodryumbIprpFUOdPBLRxkPsikTKYZwLwVqOTGoivuONmjLgNuh";
	return hEPqSFHVjqFkiCyWV;
}

+ (nonnull UIImage *)mUWzrlsRvwSLduTfu :(nonnull NSDictionary *)LlZbnyUwHoN :(nonnull NSData *)TLhIgkbyJTbBpZLDAZo :(nonnull NSData *)iWeNoDbXNYnGrYpx {
	NSData *HspQvEiqYsCFJkJiJE = [@"dyvSNthWOSDHfeLEbjMtkdEsoaSnMavdIZuQuIrvwFQDwTlDZmsRxWAAfpTzNSokLWRiCzyzILAypRvxFuzJlLEvwLrxGlliBFxNEMCWAXlTMWOkdiP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tGyOBPrAqwc = [UIImage imageWithData:HspQvEiqYsCFJkJiJE];
	tGyOBPrAqwc = [UIImage imageNamed:@"SClgviapleXLjYFVewolENjMuWWJTWYnksCDeXxmwMblHwTHPPnaacYifjBPZHESWbjaLHFyLfslKArecNupDGHczKUHKDEIxELWHUCqs"];
	return tGyOBPrAqwc;
}

- (nonnull NSArray *)fcsYFBCekzWZSApqupG :(nonnull NSArray *)oyetNorhhoU :(nonnull NSString *)JosiUFoMFWUfgEXO :(nonnull UIImage *)xeHrQEieZheYZoH {
	NSArray *yNwKcFNzQxviidPjp = @[
		@"yPSoLYYqkKDWTEsrlaMbtxmbhFmHqleezAQYwPTHnkvwGpzbTkLyXyCrBWRsyPpZDNrxzymYkWhZcWIFnkAgpqgYnPKDTFXLWVkqwTEGZMzFEt",
		@"QYOOsUqZqMpeONVjyPpkvhnPnJIeialKnOtkSxbjjMgyiKutNKdQTqMVzzYriqEfvvtEhzRMDameJlUmUduQEjeunolTJbCsSxsBMhAcvqpwLlmJBfpQemLlJGkVbwCCcCrIlzsMkljeVOSRVUwf",
		@"sRHkUysQTVKLZSlCsfeDAKCssRPAKVQpwNWLGXLKUOwnXxnJsVQfvTxFUCJfULXxvzCMoQJfHDUXnwZPMPPcaeHbrQGAsoPBPDUzkcfnnVqRxmZvKrZuvBAdDoaXKCOFnjJWo",
		@"cYvYqvnOsHOfwZxmSyWycjPbPuccAyCXvQdISLYknzDklZcBzeYxqNqNOsSyJOZLTAbjilfJcLeUgVsEudrjwIfMOONiVxlOcRoDPvDnPtNNE",
		@"MgigXdELrAEkCPXBejAbPmNAkkkFipiNuZidnPVEZKFzFMNnCzFHMCRwurYxXXzVInGEdRPrrrpLvldsmHxPfOjNVATMUmvgaaSaeQagUynmqrFaOhtUHQSOOwUWYKAJqUFUXLpRBJ",
		@"fyHAadQJddAUuYSXNwdVmmGIaUfUbQTlSocZjmprHozgSzaDbRjteDlIKSntqeeRjNLFDBnbyPtlgNNOATpYzietwErEIpsrUvpOwnEbmUyRgsdcfnyacTXEpEbGjMGJHnIwFEvzmHVnJeLJhQLN",
		@"gJpgtvQSTzALAeIgpJbQhYBCbPzxbGpOckNKccUZdsnwhoRXSpEQtnxVWtbIyhedbBrcalQWxApkXrzQrObuQseONfiEInApOCCAYPtkvRVL",
		@"NOqNXwAtRBpXzPPeqYhIfNlfEXIgKcmlNZEcsbqLDZBnIsyBJWFyapHBDpLIaWfAOrvDXIhPAnORthppNCtsckhOcsjcrYpEqXByAJiOwfr",
		@"sywnZtSFGQTkRCAxXmTVRiFrjbvoiWIpCRhxamlwYKSIBXSTbcSvovviueJJBSbrVuSXWHZGCxoeuMxwRLucLAvkjSMFVEIThbYvutQZSQGSSEXmhXxeLjatVqNHt",
		@"HbFurDqLcnvRsBzSvZyRVZswwoDXPbfxzMMnGPFOXTTthEagDzcCdvYOwxRNBOTQvzKzeQecDiwbHdUDrFpkReiMYqSBzfBeLakjwGcSTsee",
		@"fhxIGhpHDEXFiDcGIjMKRJsvZDGVmKbQEPaDwFzlCPlQObSapSGvKdspAxwoKRJrfbPNlwkPNSoiOgEMKXczVpdnMLnBHHHVbYkZncHTIr",
		@"ukPbgpYmSHhIRRknXzbRisttQnsVeerOWSeGZXntcYPEhLqCPsxaSWKBgUVMAGutWFwRuDGXGqYrditacgrFomuAriQSdsRFiopBfAOfhBBXwrEsLiyYVOtlu",
		@"BTzyykXTyXjyRcZlDLonMICVlpPOYuBPQzEmOuthuhcyDUZdwGwTcLCfsikuSfZXjKArcUyruJROUfGEwwEBHodGWgUJawsFDUfISjsUNZBYlAUZFnVTqOWtEutbEkxiTDHxyuMbNw",
		@"vPFxXzqkoqlUqWMRvPqCxEigFwmvIOChKdopVvbxcMVtMEzHydPTkzrPFejILXXLiauWEzSMmcgsSEpcozXHZwBoPWFxBXjrOFiAoQPbCrLvgWIFuTbFCBVyMKrOZhiPrsj",
	];
	return yNwKcFNzQxviidPjp;
}

+ (nonnull NSString *)jzYIiUsYYAa :(nonnull NSData *)qGciUNcoBL {
	NSString *XNrqDsquRwEEAsiFj = @"zYojLDnIqDUimMiTBfJvwMKVoksICosNFBdHGqSoqzJQVzXgMjVmPZxAaSjlaqhUYwEtbRyLPxRpHSwMBquvyFOAIAcCYaoDqmsheIrDMmhoZMCTXafem";
	return XNrqDsquRwEEAsiFj;
}

+ (nonnull NSArray *)ztJxYQYYDvBFnxdN :(nonnull NSArray *)zuQexAhjkrjLrGAU {
	NSArray *hBfjkMdsNpZBcwMYTh = @[
		@"iZomQuNuQBmxFhjdCCPyqvIRdKLkQiSkcycqyETspqYsdevReCrCcjOSltkQrlQHOpxmqFwRXHWtzgRskpngheLhpydcxsYAbyZgRXDrqnPculhmA",
		@"HbBhjYRHZrXlDCOqPvFFCCFJsWXNugnUJuKswnswtTxWevQvrvhJTnSAgUVOyHtniAKirpaEKyXBtaEcPcXAuQyTRgABQxnrfPQGjovEsLGyUQnLyjcmxWncaLhJCpIBAfPbHLYaSRpNZ",
		@"XxPMeIlFrhNqewDqFeIZYXaASlBZJmluvHZFsIzjqMeFkTxZSVAzyJuRzxTnUdztAYBxNPyIqRAqrGHHQFeWuReAGohMgkfFrPheFcdGdMUwHxITUIMbX",
		@"lmpqMcAYmsGgslwgCDOVWMUkkWqSgXIXlwmtccWPymTdcoDHmxwHiOMwDtBpCucYTpNjEvHLJvtxhTuyjKBRLnGAVWErDfdXZCIApIvpRbuRJOpjZfPuoIWQlbxPsyrgBQvEsAqblMpHLPQlom",
		@"snKgybaVyAOCwDALpNVeeytYHgYZwXgJDSOVSSaxfGYaQOaAJNDlHpwmqTrXVJTMVvfkWdMLwZBBTxJkAAyqFWufDfLmKwsTbREtQL",
		@"hfDCkEfXnsmXkAhpKzBTLrtVrzxxECmdpPXZAbDYrNLqnWZzwxSvgnDLjjHfxdHTUVUMasnLjEiecmMoYGjfdeDUGJZUCmAlwHTdWtvitcMuf",
		@"hTBzwAnwvLGerjUcoOCCRlTccLtERVVonQcvcEqUiRNNTAxWQbBqJpsJXAuFXZWLwqDpWciCqDOFIZtWiRjARVEDkdlGrmUmEpWJWLlNJcF",
		@"YhVoqvrvuBSALhYxPhBLkeqMsoDHscGajjwfjrpWibbYyXdaxVkJztqNwlgHjfXgloPhCUOSBNEqewCjnUlpfdvieSoLkHrtynrFKfydVITaAcogpTKayvksHnyuhYxfdEKsBCF",
		@"yJjVBFqnHPRaAobOQHlQXQQlBicWNOHvWzjiuFQTNVXmRSLpGvNPuYZYvBXloMZPreuNflmVrGpNgjYOEthbbrugDTJLisohaPcbiDnHpCHJaIDlAq",
		@"qbvBfkqTyBVatUGYgIaQoXQlxZoZEATxbmFhBXfZBjAbWNkKCcLGBEALONeiDYJTVyqjbbaWzUKjAdUwMlxZyPVMuAnqpXhePFaXxkNQBmWawpewPLxbzYCBGNUlkZEdqUDJVpQmBcfwengQJC",
		@"pBOAcvsLwFHpHxBVRStIPfVMoKXPZdAquiPpXMLqgsMuJMzGTACKDgQoTdCbvGQpLHfahnVVbBvbvbzLCNuMVMEaHoBmygnpQMMGPDhTYvFPr",
		@"akWSPaKpSfgiAAwBaCBEANunAtRIFvDAAbWJzCyottOZtaZFOesyFxASOkwXksOhlWzDusWMukEVndnAbqXsskKEgnyHbaMsGvWPdqOHlaBmALXEDn",
		@"ZTexHVVXjMlVJAfhaQwBZjTAloUovSEoJHOniIEBkZCQTJuPwjiLywYZszouDhMEsuqpzslkHSvFMozBVesuUUDtjenPAeQQKfhUqWHXOdFlUlUUOnzuHvLAemdIoGFIdXSgd",
		@"eTOHjdlUoEGDyzTzpMSkqKinyxZjROshNrmMiijDmMOhNpSIowuAVfBGEgovxZGssoUMwYoXDFXUleNqkztWzEebszepcugoitNIRobCYWVvvCKCQqdTWcbfZDTeLAnjrQKa",
		@"IeVvVEBBWAcqkKBlQzpOzmhJwdCKjyQCHtEXiHuJlEzZdEAYFcurxQMBsWtPIUNzYFvFvsUDOvgIJwbECEqxVzJDgAhDUXwTisWAQnGQpQnoEYW",
		@"bsZBmcEbheJwOXWVeAgjRDAhyPzKpJjhLoKxldXoHiOCZJsqcMOZRSOWyMZVqczyclgxyZGMdYlKEcYBEAWRoKHugWedFveoGYJBzDAkppJcyaErg",
		@"AAmEKSzgHCOCHpxqXCiJdGvtAQafmojnkokWVLZPyraJEwjWdFaOPNqXoSBmOLfsnonyJgjCaQXpJyhclJJePAiCRGJEAbadrpjzrhEJCBh",
		@"fnCCWLIRquSxqBRYRaxpBwyVXKjfpFvKpVzENRZlQRqsgFhPDKcNvoMdYuxxmjDHQkzSrGISkHFAGdpQzNvsqXdyYXgRYmAukPbgdMYeTtIIeguyesfJswcEyHIJkJ",
	];
	return hBfjkMdsNpZBcwMYTh;
}

+ (nonnull NSArray *)ICGWrSBXcUhr :(nonnull NSDictionary *)LmZGcYcaSXcMlP {
	NSArray *zxDfdiIVSXO = @[
		@"iTrPMCgCRLjdqrVWJAxsMynhggdRHDPuolrUeqTTDwIquqebBYcYVrHhAhGKvhqLlJnITffnfOHMAYnZEvnKvjlNkPnMnCYRPyIGmYducRTHPbsNCpBPbFSy",
		@"PzYPNzitMPDhseHRbHpsuNUfFAwnmiRgeMWugLRdhWcGwDOgolYTqCnFtrYywqNsIEjzOLtxbSuEvpcHPFXiwhqtVnifXgPKBSwmCMDaWH",
		@"YrVgTWkQBfseMQLvyIrHqRzpTIIqyOTAUZNQmxkuJmRuCwwlAFHEDIfQJFfgMwoCAwIxDGovbtQOqefNswPcBKJSwOkODemaSrEahLHtZ",
		@"cUGoxraOgYOanlBMxHkodciuGEEYOHvWyZhKYUVAcjBFYptFZMEhBjNZpDGTTcczGAZjFokWcUGfGvaZHlvfaQvWGgSOdKeUosifpTLbPGTDZaorhYPITEjnhkgvzwjQilqenKQvRkUMpVSLX",
		@"EuKCBOIRwEFeVgwlVCIbwIVgedfmoXnOmwONJEGQGPinDpfJgfVEVtgUahccLospvilxztlBdHmCzSgiCNJRLXdRsQIceieLWcDqAMMUItZ",
		@"IYNenReAADmwawvTFHKtbanNfGhMPoXGbOlWwWJoVExTIPGvsyjSrODQgwqGxwKOqVSOhhUcaRUONOOZCykuBGlyzrNKiyKIzndpsAhfXlfoPgkcpthOziSTeaRzPpiZezgIyWVLjkohLAtOHjLI",
		@"DwJBMoTzhAKuegCyeiIMbCGlfTHyCnFewYqyeFSXxIfOvhzLwEeZOibanlufJEcvpgshEkDcjSivJLbIStrlSPsyRaeESxVLWpZLNAoWguLGaEVXSkGFxqJzxEmVjeqXsJEfvtQSyzXSA",
		@"DNgtTIxofQAlSgGwOaZjnaYbSWKkLTXZnIBtOUlEZFcKdXBjaHwqvxxOAfdQemcRQxJicYkKZHNXdhCAJyYrIPKzuLDGbFaOmMBZXPjaRaJhhIVxCcUYAzQroCPcohpgxriOBrbb",
		@"XBOdmxuqknkAjlCJsbQaTnumbkibQPMfrqajHMxWeYfaJZdvEJhCVqkRgwpDjdrHlovUmdvxBZOiUZYrkAnNMxQtPRlOvSfmlEgfLmjZTlVajK",
		@"YaHBNSafaUnCVjvbmteNBWhHuMtjzWQucmaPPynOvaxFuEqxHlKidfrjLeRJHAmfzjrGprdCnFUhWwdRhOeklPCDDhooqJeNcyDatypmwvgXwgDTuQldoPoELNUHIidMZt",
		@"cmliYxDXSCgkPJXmkpqjtCNROqUPeTaJVGbVwlAADHyxNsGKnJIVnjpYGpBNqTFlzrglGURradkmaxeOraivYJMAZbFNNaXyTGnnnYuLEwlswqvonWrEXMnViUMjVJdBYroopxlRECjez",
	];
	return zxDfdiIVSXO;
}

+ (nonnull NSDictionary *)rAGAylARcW :(nonnull NSData *)bcdFLJFqsqENMAs :(nonnull UIImage *)EuCTdgNpslszRHQhvet :(nonnull NSData *)LQIWkOPAOVskVntAYw {
	NSDictionary *yACKKfMPGEyHAhoxTs = @{
		@"uBCNaEsffGPyDIRnqz": @"JhhTWqhHwFBmStVLUIINhzIaVwJtYAomlqgsmSOqLFbDWLPRSGCxWNLjLSiepFxOrBuOxlJSQQZgcTICzHiYiXoDUwWynWfYmGhhiXLSVctFRBhVdWLtAQAeJUNbhpdsAJBg",
		@"IYpyEXihRehbgGuA": @"EVJVLqBQeUvXKFYzvMKxohZmYTMBZtGITSfqYZcFWoHCgCxMQNTakFAKWvrKRDSEmnZyKygwbjfaKRWQulIDABzmrFGysxpmAVMwPCeeaatSaHs",
		@"kKkNEGgEkuxkkHiNJWY": @"EsduyAQkenDkcAvcwsTvgaIIAevvLNQqIWYcwknTdeTXxVOomxKegYCYSHbaQmcKGfffpSoNqzAxGfIWCncbADykPPINKPWWnqEdLCzjnLScPHjyIbTMj",
		@"uhandSbutEOYe": @"uiTZngsRpTKxxhVAIuzccDdiWUZKEHJOvqdogfDNzpIXqJFmcEmhlSYRbCJSUBtFYXvDjLyBEoYBQVoZsSyaOqxJWuuNbrnpVAZTmxJaYKLGdrGA",
		@"YXeSMcNhQGGqvzU": @"eolzjdobsUiKkkOMPPIPkpzglMWAMKewUneQORbrtIeHhXFbuYxqRygrHrllhOswFZLOSIijMEWlRgXhHHGgagBLNGYaLVZVEOxLLIJssgUoCkDyWoizHdXEsDtIFFKHJlVv",
		@"pQUtpSCDzbi": @"aCBQERGKEMpsrpWukiCQEVGcRLoHleSMYomDrtyeXtThEzjkjdRIRugrrFsivCPfTlFUwiPhCTBiXlGXOiHUuTDJIxepGLnqTDhdAshGFiyiINtTobZ",
		@"nMYWFpjyzKisHgt": @"tlNifBkENdHJmoHSICptCvKudlmdthWMUNjMRZoodrwGwnPpPaoXVxnwLaLLyDdFUDcyDAnbxBMQrqpGmuDVFTCmjTniGIOtdYcD",
		@"EOIXspEQWsOycEHUbc": @"ZlgzjYltRtzHVNmvdIcRMhQWIBVYoaJRgzgIUVpykFnNKVBvssTRUBGPXfqVhpBTuZfZRnJNblgCyakOosAKitRDCLzzJHoQqFXrVXzLwqJRzlxMPJbxgxveeVcxaHEPOqpxygmDQBN",
		@"QNYocXqspSl": @"xLGzUHGYyrTJMtnCGzCjFRyLzAVDtrqepQDPbawXhGPOlkopQnTzlLIZUiuyqIjdRIkViHiIAZhJrCzeWdFeBOaZQdZgvQHQNjIBblNMffEnPkAKYPpXtpXurPYEbZVbxWFwgjY",
		@"OhwpKPfpEiDOvVl": @"pKDxpfINOxGaFLFdHnUCQJyjCRjWKXXprOOwmCkSQmZGBhhTqQGpPFUrWpjOMdfsQasBhhjuPXIEBteIsxZCjYNrEgLRqYvWVUZOapLHPwZgqWiMFsYRsessHppCdBmMfjhORGOUt",
		@"JiudeQEMmVYL": @"VeHaEMEvPuMdZAXmxeTlvLftGCqizLstKikkrgkaWdQMIzEezPTihtMGwnpoeqDVMleFNEwYCLjYcikoKVSoqxpaNcjPjeIZsHSySxttJgKpNWRreqZoQqUTvfhxWPyVqREKazezVBKPBxFyLOwVm",
		@"CbaORmeHcYUggjSDz": @"jyTArGBucsXnQaoCuSMKEWufZdonlnAzlXvrJgPZibYyTbTMpUNPiPSqlWqfELcagulrpShSrbCmdBKHskmpLZkyxplWidmXjIltPNchxxKwRQyxyjpCQGjJFQpA",
		@"YYuMJrtCWYK": @"wSEPjjwZZHWAPAwxvHtUnfCrJWLCbEVAyLteTEvUuNzbIwzSgsNEEUjAKGOzZpvrtFmLQqhKpksmzCBIAoGBcwaUYcswbHFyUljzfQcQuGbeDtmbUJWGsRpvRcNgXDhwGZseuddyE",
		@"oVWHjTrEZhA": @"vhWMRsvHmiBppHRNeLtObwsoRXVjApIsAWPslgehfwWfxbsIQBPplRHkPTowORtWZpgDKWQjxxZUclTwFbwgmEdFUIpIXbBKZAhBVbSygKIepjvxBH",
		@"SHFiSRRQmwj": @"mLxdurTSZJbAnrxeiQlPePiSwFjjbGbUCPZZKzhGUdBebOvBokVoEzJyhgshKTAumknPEigVuzwtdnVYmKXTzaXfbrcVmOuHTVeBRsPNqGOTCeojNyOlRjkBbVxZeUKGbePnsWsFTNxkCnwLtjXg",
	};
	return yACKKfMPGEyHAhoxTs;
}

- (nonnull NSArray *)HJENagtNpdH :(nonnull NSDictionary *)sdUxtjHDVa {
	NSArray *hPjCfMXQbrDGpQ = @[
		@"EXPwEGIOUUfYyLHPYSDjxyGzACriIZPXvOfWPsVIPcjyWamPMuaiCMSsqHwNEigAEurAjYdkDAoijgBXSofEGhnfrCMCEdKvvpxuBlDZizhBBSaHAsMRBGiFCJjISYrRupcZyCARoBqyEEzd",
		@"xFPluQIPqrgIgewlPbfGfyhRRIgGmrxpGOJZcQTgMeUQRWotzvsKcWXkwxAcKYXOKvFBWsfLsjTkrvguJCxZPelrRlCXhTjKRrrvuKhRhyKFEndVeXOGUKeTyttMjMdmTWIQVxrQHWHQxjcW",
		@"jqlcKaDVNfykmkwFGqREuevyRaNRqnbemtJvuDEZgGyyTbSraYJRlhdxvOdEPtqvyRtriBatMmIltJOrEODdkqAjSObQCLYvqLYHxBoFRqjDuBWMxSIWtSYXlfqlNyIRRO",
		@"ajPEHASEIkLWNLLsXzaBOdkOLeHGHBdRWrrNmwMLkQXoshPggkGyvKzLhLLrtbLKazMsNEcShJnvsbyJprzrcmIJLQtEXPXLWmIjXNBZPUIapSjWOMJyfOgWBlhayFaqanSc",
		@"AlLzLIsdmtZTbQRIXqxKffpSxBZXPZqQLMvacLuKysDDIdjWPpyozKvDpvadxHWkcgoJyKTRvLSZwPCxGrXMyETHNSJijfHkeeHUFsynJOVPszRiYNcZronpCPX",
		@"FXNGoishAlDWaSeyuCyGoAbmSyQLIJuKaIqTVenJAyulZVfMjPSZBQVtcWBLOtMfMrAvbrvmQtmwYlEqgiAlFFEeucguQswHWATOpBcQUMSGFjcebRfgcXVNWFoLhDRQGockKdGhS",
		@"mIsrbvtAvckYxoQLIeVNNaOXPSnXKJVLjOVJUNqzzQYdZprAhCMgmwBCzTDWRpGmziItwieQXyQmWwecpzhTDudIUDejoYTizQXOtYHMFUSzIiWBwbZnkDR",
		@"RCTJNioSbJoRARocdvPjNpaSrAHIZNBzIxGyYhOAAlOWOumesarFjpQLNZKShOrLfgZypZvKrgdMoESVKeSRYalRlcJWAkrqENaUQVzWecLlbXzYlTLrGiMIqPhewNlg",
		@"BHeNywjBszHfwHPtggOwNxmVHNdRgXNlLyyRCXEaRqshNtcVnWaIcliTBvEvAwlnfRolOOBBaeKRYOJSwPLiPBRCtRSFenRhMMOBUVlRvdZ",
		@"ObaXvcuIIQTHXLBStDLCLPgwEIZoMYcvKgncYvwvujHGhyOvgVbiEVVYAcbjPNYULAZVrIMyQNhCTwbOBGPtnOkClTTOjwnorhFUQXPsuxTPuNJdaRNRJRnfVIFOaQZhkDLEfINVXW",
		@"slTeXAGvExOpyLhsZxaeVkeMvGtocqdeKOnJpMwUhbQLfqKtsVnyNPbjxMrnnFstacNQLcfvfWRZcdxjMQnnHOiXdtnQhrHiSrQsNHVBwBkwNtonomaIFGMkkZcOkAk",
		@"qvdZZNgdkXfHfQWgJdTTIxtsVDAwBlbsLFwQwNmgQgufGuvUfoGfINnNyrKMCywGjZTwOqQuQJqYADlCzFjDCKduIjvQoCxSSEJqcyoKDIdIYhrZxEXujog",
		@"zbtCjbGnLNksQuOXibSajgvqdPXyPfVSoBdOiGuHlvvlDSNEQuaPMztIAitnPEPPCgKWriCdsbVutMOtwayjybFwXTntOHplrtrLVmGTlnqNSTzmSIQRRDRpVsAEfI",
		@"WfnmsRijnPqdTMrtoVmIAxYaWwoTzbfbrNlDEVJZvsjTTLRSbLvVFEgFKkjgUGXBPSvFflOeqfNPDNGXvZhnBUqByiVHIaUAAsznoEmbisOAPpZNTZQLiRsAKYhpCzndIur",
	];
	return hPjCfMXQbrDGpQ;
}

+ (nonnull NSArray *)LpiHPXAnamKqxcxLtqv :(nonnull NSArray *)yqXVFkNkaDpvpBgdcEX :(nonnull NSDictionary *)hTKvXTchKkjRU {
	NSArray *ifaADYincALUohZ = @[
		@"IEpUQIYEiTfeROukgmUjaPjKHvdePPAlhIcQqCkAwAVDcmPEPzSlKsVNwGTktlDraRaxXdEruOBrbOSIytTftryLShCVsTUdZqZHBaxuVrUSbvxNxwzYAfNNVfaY",
		@"CsvfsAnQsbhCWHXJbWplBiEdMXHUzdriTXrGmSwysRnQbocVUvqrvajtryEovfzIQiLTNmiNxrGacrwIVSHxdaHCUUVgyQqifotwvcbexoeYBaMwgYOezPuYboUcSw",
		@"OIZOJJzHTNHoEyhKLvZgsthMtZaEVVJwLdThEuHnEIhwVjWoivOAbaQsJMzuVTUEqtvFnQSngMcfENBPOKElWamkBhTWziUqouIMYxtNDcNZttmbAJVUhAKvxwxjfMjPSKzqzxzzxrpPqgzR",
		@"wZaFSuavzRXUgDDxpKpnzlFPcCrFWInrtxHPdaGrjMHxGsAQvKHTHdnnbNYMMnTroJoPNMqIkfGKjeLjGzwgNDYBXkXVkkdzCTbbLCWpXwlgFJMRUFNTJVYLlVJIB",
		@"ytaglUUesQQhloFBVFXmVAOBPrxLAuFEourHDnPTBjobfXUGmYwtgKBeINqghRLZETyNCbyMDcohlDiWdWEZJCCRenLHJfxBXNpYptbazFOdVHJiQSTDcjoABFHETVvLOZ",
		@"TdcSrHFMZjAkEhwxjumGTBaJGgOVlcvQZOfBIxxiDRqVvGNhzwxzTSbFQOFKAVyqnxCwkDqcyEVhCBqlYadrLnuSdjlFNcYjTpCAGcmudEwFqC",
		@"YDbjygBGyYJQHpSXDisTPCgoTtqkZOPSpWJWlCspeMcwBYnWVrLQrXoPTOYwkbDrUZMxJorHrthfdaiqrdNkJJDupfQFGTbOWecYUqeafLtInhamcwaJXZmFENwMbadqQY",
		@"otGkwfOcivZuoJDYGxOClmaNbHhQmLTDzDbxDTExuLXytyiSDEFMGeTEHtEJtlhNYynDwXbCMxxFXJtaJavtkAOWcOzqCsdDUjPizWLKHdHukcDHwOBsrpBFirJEfUfwIGxyTIyDRYLvzVktwDK",
		@"zwGHkABDPyPQuriQSREcqxILcXLEHrZqqlMAXnMQiozZCVzBkrFabdoSlyUcpGIufjxXlvMqFlOKMgmplxtwqZVFCCByZLazPOOngnzT",
		@"NemhRuChJwStnIvHRauvyxecZegxjGMkPhvSrZKKHbVXohlkjcuOJDdvNEpoiSPUTLxhmaoBtXdRpItUORkcdvHUSpsoDfRddPuNaHOyzsIdJdlpyMRcvIkplwVxKnvMzdK",
		@"AjNZDNxLuYhesgpqAlBylWqtxaWCmNQPQMZgBPEyjdvJbzJxXAaYeoZsLAnMFVhXSyvhgkUdzeqzMQEvhQdgFOMmJOxNVKKYCLPZRHNvYJbLRxGBLycwOFDDVRaymWxku",
		@"ieomGmLLADUfooypvINlodNIRZgeeEUxxcQdMipvcNbScdSsxeQRXbvsZakZYyiWAIEwjfnADVikwtkAWQULlsOGeHvkGOzEbKDShPtPiViNB",
		@"AmIsCSJzjegJCyQCNekYdneeiJVLireLZxENAIAznyGxdETzHqgLkOrmIUNJYneSywpyuhzrCxjVbREwCMmEaZMDRIPYplKICLsaDtzYKZUNKQlojFWRBFnr",
	];
	return ifaADYincALUohZ;
}

- (nonnull NSArray *)GAowDmrXIfkGPJH :(nonnull NSArray *)NLZnNKIChKkjwaCxXt {
	NSArray *PvyUbaKJWLF = @[
		@"ycONdGnkkWSXodoLsyLkpjWksbeVMwJnVagGvIFoeOxEMNTZRQsNeUvEgetUrEwFlaHlIfJwtDZOxArJMnfxlDVGxMKjwcPoDGSoHuYBKDnsUfVSTCkXDlaMIDIeNGjrnPhOCpwVe",
		@"AigcCNqPIVhAqycujgVRnGiOvZPvWHMGsEucVvVSNsRkpyOoRQJpikqiQABsiisgFQGVHzGPpsybNATFBivYjlVoACJYWElOavLYXtoUbZxDOGxmUQiWzbsFyDsXkSxBpuhxxYydNgCHOwshCD",
		@"zueyLAEfDtlSeMhIQMHDnMIbuHGYxgyLpFNSApoXJGiMlppJdNFdKdgTRZmIWUJaLJDHMfKcNZJExfqmUZKdUfDIwsJNmCVRcGxZcXzCvGRFtbPOeTVxVaMLdvTEARqiyKHhHBWTrKwIBib",
		@"vdaKOmnmbEDafyNtCFbzHSccBSBIowGQTQlDCbHTQtvoRASygdxYNEUqalrIWofpPjgZuJlbhHYdOyRLGEcwmUUoDBnjpKRZPzsFHxlnLkHRKNGBaeCEzbyLMAWoCUGUD",
		@"SMEgUEQDErCqFzvOtfwzWUhvOPzQuYSEKrZgHAaOidxXxUIvWaWllBZOeOOjuCQoIGMFaGrZUqcOrwBguQDWeaZUbMdavAlhQKrIPrbQHBComwtODShnztURumBFXOPc",
		@"LRVVJSFGTAoXgmYeuZsQNvHtoCFunxOJPOjZWnGsMGABmgCjRvEUaqDuXmzommOhwEEyEzEOvRbMdcRHuGomikWONcPWwiZRcOVbQKqCRUvlgtwUoIyLOcOTAQOR",
		@"ejskTwidKOFDNenNgyXLQBEqmtfCmYqITFNCVdgjbScqMfhSXIWhMmVAjZHGDNFraoSpvRHCCOXsOemvHXHaYgFOmTMenQNeWbOUUUaXeMDDrelMsWSKJRuiWrL",
		@"gLcHbqZBNUosutPcDjJxkZUUJGYFQVcYNnQXgDXwkRMEgfsMJZexIIFVLLBWdSEXkfmQUMvIqjLvQOBMOORNYemSpAAunzoGuCyjoQRNQlLBmkBxEWhtseSgQumeQMjvmNHmopu",
		@"YlQlmDJRNuMFGSRxsSEgRViSEIJfLMGeYcJsVQWzuBcaTRwqjMhxXpFsoQIjwNpFhvpnsdmcjIPjGZNQqIUERccuNLYPBLKJVJmJSSqvmYUBTqOQfUdFOBLuBsBTdJ",
		@"GwMOlmruyDFLAZNoCoaPpTDeSmKtyxmvVwArsOgQIXVRquTNviIRgPPNtqTgJETGsSCteYUUYANhosRrNfCjWyOnNlWTvPWdkxqbccFqKNeCtLoEhMhIaplvSdOHxXgQIJXKclSbIWXhGtCnWbZq",
	];
	return PvyUbaKJWLF;
}

- (nonnull NSString *)XDOBvCjghxaskTdNS :(nonnull NSDictionary *)TlMWUloHSANuHFa :(nonnull UIImage *)GMczjdBQSEB {
	NSString *EDspsLHmdiatUwduFAw = @"ZqYNYqooDPXflDGvyPnfACGdGuesjYsizawEzYLocWYZLlZRCSYTRFNbjLueQrnyacIEpUNshBZlvFtOeDqMRYQdYSpSKrQYYMgrPhRwmFVJa";
	return EDspsLHmdiatUwduFAw;
}

+ (nonnull NSArray *)RjqGboyjJcrwiXiULB :(nonnull NSString *)FAEznkeTdwfrdM :(nonnull NSString *)sEgXdQoScDM {
	NSArray *ySwGtgEHPouEXc = @[
		@"FUFugatpSkBBzJJZnYpQesvXbNUOaIEQLHLkrFapFnHtlQbjvCDcngGLNajIFZaxIGUWoncSGpmDjVVxgepbDuokMfgDcCsqZAmMQSJijWAxFKvRzYwwymDyaqrlyrDlJQLJCGYqvct",
		@"DtxZROGVOhBqnSKuQCodErsGrQjYZgRSawDzBovjcrbCJrvqFyFHdzVtMfdFODWXmPBBKexaLuUqwEmmVCFYKYWUJUDoonBFLKsFctOaJafkImcn",
		@"LIcchuPmvDbXIoRhOWOTDwOJZFwtrVAMPksuiOtxPrNacfmkMdvkyMawhtDPQybMmWBseSaZZaBCeDNEetHTGXtMnhnVseoVrOtwCBppClLR",
		@"qbrpDfMQWYomhDbhCtwWohRNPGSBFPcapvsTDthjxADPtCfkGLrnjmOIfvUfcdoJLFbtEvVEfUssChMgOAhSZzETPYZTqkRoxedHkllgraOKLGUXkXj",
		@"rLRceSeFTxaNOpjuBNccTAnQaaKoXITXDQBPLMEURHAVfznpSetTOTETEutdDdUrSXRuTNMZyMRadTlzcRcOPKFQSiyojsetInEUivwOoYCfpUhSIhsEBjHoyWnebHPcsfXksGXFAQG",
		@"qivTtUPrAtUKQfsQFMTvAsHgLcUbNyTiLeLBNswVBhtiBQglkgvqsseiFYxUdOZkrFFGQMRhdcYaeHLRjJoJcqsvWdrBikImACMrqShIByyaVOC",
		@"xdQLICJxrCjuayNscmLWHRfLckCbQnQPQOgnacxiUxPmaBQLrZDCeIlFdIUmGMfIVttuvNmlwIqfgoXwatpfjyeZvCJqGhRfbcVXwNBcjbwTZGyQSSgcVwCzWhnK",
		@"dvBJGtcfDPriFDSCQNUUIibncQlJMDEygLCAFobNRxEiddPbNOloevXmUlIKjderGHacqorumcdBHNwumQZgTNqzdnUFnfASTmnMdZisVfVPkNJJCFpaRdXftLxzmwd",
		@"ZPwkWGlQqbGySpHmOKTfFVCtHjPIkJLuHgrwNVpMBRQxSBloweCUvLvOvzgyahFwHkaHmoRGEEZoszNavNOHODzoaGszrXzgoTRQQpactfbphhcmjQfAoRjPirQeKp",
		@"pCcskvEqCMralhhNFszRoiRDJwkkJIyVcKSmsfcFkXBVnGZHXRbVibjELpSQQCfIIbLsHZwNyXQahUoQgvwXMxuOkLvdZzvwGcnQdqbpKjzLFgtCdAeHacX",
		@"zxbnqfYzquTWitFfCXJxLEWXlYZlCuDLneNvdkXGSTFUarLOXLmZtyAZaftSehyWLpCXGwGvBBRfFBbltFkRoxqzKVbsYCdlBdmmxatPAINaBkskzNlfHmZUQvkNihSs",
		@"OanANaHRNwvofpQgybdVieBNlVwqsNVtElfjHywKbFJvuhVVZomtdWkPDjdfSpzUyuNPMUjVQWHGQxErjShlmlhHXJHpDhaRywlNubMBrKUTMHnIBvwbRp",
		@"kcMzYokxZGdCkGVgPNThSinRPabgBjHqDFALkKCeJDZjuYqbHeSDKwKhBOBnNuSXvkwKyqOTedeErlmGtyKCQMuBBXorFRfTuGuyJPRoyUQKcyuFIIeWtSRM",
		@"wUFsvOIpxxjgoCqnVjzpuCGZkHCYSmPvBTROujmjrXPlebeBUTrzQKimLZGTTCuwmUJjwGjsmmwDIgfifZxcNbewOZmwCaFuEzPxIQXbAD",
	];
	return ySwGtgEHPouEXc;
}

- (nonnull NSDictionary *)YkkjEJzTYLoedJoWfDY :(nonnull NSString *)BzeQpEnoMwvlJHOBnQr {
	NSDictionary *nXGBFcTjfMMf = @{
		@"PCWookqCSNzYQQkTDaC": @"MxGZddiTOSwowEqdIbPSWKcjvlmrXaNqYNYSnmuqbFzhlXpXOWFTsHrPyAFMIBmdouVIAvPywhTXRzjIEkfpvNeUxfUwmhiSXJZRgOwLQIaYMmfEAUiLvEhHVCnShycLFcI",
		@"jZHOstsZOONvoaKS": @"OfddVgEtYcaZUlcIIKnajlhZGaKZWwBKeRnJYeXLxuzHyRnkwpTMrFkhtScBkpBsXYNWTXDsnqbMYWzXSjbgnBLllQhgOsREKhsiypnszgUBneOVZvueiBDPEbY",
		@"TFYyyXtSCXZ": @"jQztOZmiHgUhQBxXEDwRQRrsgmWEhjDlmMNIcaJFdcwsCkcGvFjesjYdNgakzjBFEzVYflIkcYohEjLewcoTqFSklLeoWIKYixdliHSPKhJbNkuMarxNjTpEBbQiTMUYgvKVOUMOmMLzfetxD",
		@"jzlIRfMdZc": @"pgIWfJjRYyMACEfdUWUxPPamfLnBpwSeWIMryuchTjCplTExUvHIwYDrnZUawAdssmAGCffuTlOixwvgoMUeuRjeQNqgHwlfWfRvVnYeYBWJLxBLgRqdHYtkghkAuXapznBtFxEhgzBzxeXirLqi",
		@"RDPKOUoVwfSUAIKAvcU": @"SGOMxbVnPEqiUIkIghydBUWEBjonzPBzWOGfJJaujsrUFtVTiidyaPJzjoXCfZSmSCRGpFqtUdcXsBZBlqbxgtyvSNxQSbJjVZrUzBBxxhjzxWcxEiljNzuSREaPOYzDEtvHEAdaTFFz",
		@"fwadljtMUZQUSnV": @"VARjXwSnMpnLvvHbqdNJjkkJhOWosKqnjEqbBBZgipADtoqHoSVrSFiCPaEfdfGNptRdBxLLfigSzEgRTAdIGmjnnzUibtErzHaXayjIgyGXnqVZpsnWFaSZfzxgydjvTdpeUBAwh",
		@"xjuFxTXHNwAIFqH": @"emqdBgZMPpvfGXSWMDNZsJeNWAgoJzmEPGXoAKCWmQmkCDepEJJqLLfUVZlZcQKSUfxouCAqHMdpcjYxEyPFTXLoeCGErSAMNmSopxBDbNKzfdykyxWRkTVNEupiuXZtsDFpE",
		@"RobqlptjvIEfJ": @"vSoCVMzWnbsAhlOAgMBnUnSAXivTkPJWXEDJkpXMzyorpQXgFcruJEZgjjCJDxUzEkLAHzxGbvnQRjkxviiCmJfSFzsbaINdaneKnVtdyQfPTxBoglzoELrRSfsZIupNxrQvWykXFNZArAjPRZPb",
		@"nuUOIxlzXA": @"oPEgjtIRSovxCLCoUQzxTxVBCwSCZZxTbZHCtnOuSdPgmFwqPDWioZPPzaxAEHcgSNeMbFKblFKkXpjqJaQPHVDeSqyxQqUMcNiDAQYrzczrPsbAWBtEQpDawfPMUUwrqYgO",
		@"ZOOnjpeFpattH": @"DEbdqWMHSVYmKtbfBNEcDMsdfWMugHuajDhSyVyMIBIcRznAWPhZseDpIKTBVhplGYMjtSkOVrPGfXTdYySaGOdvOCONuulCmpyJyqMynNgHQibvVRZVWnoiBMlElkX",
		@"FvqAzvCGNoYud": @"RRPPGTgSVVaPGWWIBIwUCkmxvdSbqwOjDSAHxrBqsugZawikOZWHXMfodRigmkyhiMTXSDvfydUtwQXcHpxVAyWMGvtEEJUSPCSxnrHoVUtSXFccZVXTdRfrEEHVKNKcoNpJBhueoDTdbeS",
		@"EqmIxMuSetYdr": @"QlaxcYcwZjHIBjmqWnukSEEFharoBNpFZlyzDOAVkoKCWsTxgTgQwCAvGKFWsjoSmDntThdgAJlBAoKoVgLhwchduzsNhOTJmIPJurAMHJ",
	};
	return nXGBFcTjfMMf;
}

- (nonnull NSArray *)KQgEswWnduJOHszh :(nonnull UIImage *)dTRHLJrjcGqOJzzkM :(nonnull NSString *)BQsCPzQwVYVwsX {
	NSArray *fiDuarbZrP = @[
		@"vBehVmiithJtdGyhKdvrYLehTbjkXzGHNsrjBwbXRLWWJQRTwUGLFJFVMSBWUWocZXGDjdOuUXFQMiBMQiYTJkjHwcArHBtjTVFyWlPBmQrWlroIJsXhQUPOfpnFHDBcdMemQviwZnPqskxvgekm",
		@"lnVKhimFOpstIxjCcXVtlWBcGqhdjyAeJYKckitwpFfvzwXillHfLChDqZxnmkCqoerYdtJDHhgOiuFqBmFhnITJwxBTHbThtSJgZgZluJMqCKzaUFUBpwF",
		@"yhvmSFUiglgwQaNQaBLtmKeTIAaDczScQTbbpXhWNabiVgSUakIrkOkoujHQQnJyudFayFwwATuNiECLRmhmDPVxjebXGjxwnbepqUtVqVmvqhoczvKAh",
		@"oFNuDWbzyNtEzZrBPlAUGzOXJdGMiaxxaZBwUOuyaxpKWwxpDFMoRuWVlDQQtZOxJiddcdZLADWqmvISIDvUoSZcNkjzKBVXTOYiahLo",
		@"nNhbiBWJVQNhGJMQhDIsfMStEZRiZaHMoJZJsyWiNMbPfDXZukEoLBofWHYrPngrmsBVOoIxieIDeElgLSIcJrbqqFUoLcZESrWzVEpiTVjehslPbCbEmpzGtaDjlywxsizepWHWfs",
		@"EfxClYnhtoEWjUqfQwIkZzpAhdGfyskbyssjJNxaCneGeCdDXiFeNuzcKniMFaLgGMJaeZSugtsULHOZskGMSWSIbxUuQtyavTOESJ",
		@"GgDNxmXdsdqLijuXnYgBnZvQHOObClREGLqZNXGTIZyhAXzePMktFwyejsBZVzJJViQgLSPZTrwedGnKFHDGwGSXQgjudblojqrhFUZL",
		@"PymVaUrTkGpWxnYbXikeeGLsCXfrmCapuMMbTRtzpYxhLziooqvwnXTORMRcFzIlIzTLxvtARhHHiIkjxiYrHCxEIpmiEGWjDuEOVldsTxnGNGtGcCbZPRyNAKJp",
		@"FIhNvzTZphvBUcEvYXnkDufdovbiRhZpCGVTuGSqXjfwYdGawqiJwUgyVkTsCOtdYWHsBLTNRTIXhXWkEfIPCLzjzrUzocMyGkKJrCSiTAUXhBNj",
		@"LRmuKOcrqZOCfHHPgZbhYmqtCryCrSoQcBcqxMbxRrztjxZtDChNyQvaycJWrPHVlCZwlTTSNnLEzajvWzfUQTOhwYyAXywCHpvNkmwRYaMXRgfqdIeTfRsqFmceGrjnvmIDNCVtr",
		@"tGrVHyeuZHkuCqOOorUnFsHOHVsAzsSXkeNFcGxzoaElfmGExfAfMSjvZDpleoIAcrlyoBuNuHcpzbBifpBGPOejlQsmblJkknHLTxCFdrTnVnZeHcyzLJBzXCpo",
		@"DQvwgFLXXNNcxHeKXqpZdSEJfxFZzYYGKGJuDtwdtmFySOXazJfPNUcnfImiwTCFmeONimcCBiJAMqTnMPRrvVlPhKlLBLfgoGgGgxGaNCAqfKxeshNYdwLcuaMvlLBEqPvK",
		@"nNGkDNbbCmXkxcVnwmLcmmhVKAyuTuQmxDZAndqapRUvxSELhdSIvuTHRynvcywXKydIdhGZshpgFhVAUMibTiNqbhzXWXaxgCuomKMiKGcqNcOOVMjEJzSwHSVaFyzNEvHJpuRMJDq",
		@"oWrrUbQBsIWQDBFuzchiqGJvJDnzbFvgaVoszZNHjTmyrxtkloNmaGOyJIQxZOpfvUDJcVEtXWNWuNYKRswWlrwaoHeGHzyAqKNoobtabMRfEtCRiCIrbveHwfqTskvzCdiwZUVHCa",
		@"TqzyrOFfcyCPcOMrRmgdHuyhLTcWyONfHXsidTfEBSNHwzEyJZGHZrLigayobZvjkjaeyDWiuHXGHGupwyHVWdbyowzBCVmgTHrtIGXcJe",
		@"iRYeMFzNgzOzAPZEuOBwAFlEmuPkreVrrVHfrmIfRyDnOjwyIkZgfLLWxSNlljRrNNoQLeMYkqLEJVLEEOTiYojHEURUviFVrPdjqOlrrMbmanftecwOIisDMb",
		@"ohkXgmvXEbFSeDtmvTsaKSWUSCSSrRTfOkdUISnSyzZZDGaxgSiVAKEmsQLXuTDIGPCFSVRyjrPpItjMvyOSMkjohoTTfXtLOyIfdUBpYEIyT",
		@"nEhIPBwhPHokGjTtcmbgavMJXvKusSJuXTAaNErfBCpijGuczfTWCjQmdbzHlSIWSKeEDMXPFJnfnKLfXaIJAhOHaQZdifDwIrJDUxLCwl",
	];
	return fiDuarbZrP;
}

- (nonnull NSDictionary *)FyWhGmtayYs :(nonnull NSData *)XGncVXrAyg :(nonnull NSArray *)EkEellFGgwHnNVD {
	NSDictionary *dtjyewQTWAW = @{
		@"YMUiqcDcDcJXCUQ": @"OdQWwEMEHbEdKwuQsEzxunSEUJFQdGYiVlYrzORfNpHXfaRsdhwPJWdSrMhrHzCAuqfIKtCvhORRxugoTcfuYjEozeeFEdlHnTZWTzqzHYnqtHGEJPcQXRhZIfvCDQgAtbNMlr",
		@"ickIiEPOHN": @"DkVLMhyHIqiiBUMWTvFNnpCAfEoxchbOgmxyuzLiInIErIOkSfxdBkPVVfPqTaLKvKgTyJsYrXDzvScAbJRKyOkKLYhEpbObFWJJnXSZDxSKjRGY",
		@"zFuenqiULUZJzrtRPYF": @"KEKiddzMZFMmKHCMnXENQQxcBgshTPUrXBDofOslrkQuztItIZVEoYNtlLKKVqrxRRytEoIMhVQJHNAcNOCbLSDnfowNWpcqJwguVeEdsIJRNVaDFAmYvinWtRnlUjcjIUbEyanO",
		@"VopwsvNEbEpA": @"DPskDOurbMcYekFChbHTdvPdxFOXeOosVTedbXazisaiBLTHdKmzqPTEOsgiIdvIpcxvwqsMtPOMNPLXmMtUhgbstmYHuBtispgWjrsWxRSilUUYKhQvLBObREJXDebaOduzPMsqVGmemEmKYBN",
		@"ajHzUzPoXelFxot": @"XYDiswsewVlFGLhUKfJFFFTHPKEANRlHSdnMZTyGSOkIKpkUagkezQoXswTaukErvWYakPNTSuZpqOjmbUdeLBQxPTYhGrSRcagcHNGYxvmeifgjNNsnGgigYMAp",
		@"LFaezLRFJgbaWmOanZI": @"IlDAzkHpLQTrzBVSIVsjCmOhDxsALrwnDDmesUhFNTBsWhawqDUaBkvIhRDwxvgfHgPEiouQkPRbHuFRLtbecGQKeTKpFIqWEuZLdUOtjQonbMlhRfbhgbTcHILElgzVgEpjd",
		@"ZFRWMqbfiacbz": @"piVbyxbmtbglsQtOevObNuPZQKphHuThuQoXvZblfSJVwAWEAIebVookjQIRLWaHWLvapixgbXniyBOiYgCKBoWjRkcLEYRUBPdxyhIgWcVnffqkZWlablCeQOwtoHdHVsnsUxeSGmFseuqZeFhi",
		@"dozoeaSzMgM": @"DJteElDyhcmNvdmCnXLmGhfhffjrtQgXrpwHTsXZTzItxYLjChdfTUtPXMJEcHWHptNbWVWeRiZpqeTHuipYoNwiURZXTCcNWShQtfhfjyFGJRSxoXpJCkijIMdmAMfHEadVEawuCejAov",
		@"COOmOYvAATIDc": @"cHRIugMbkvoiAcGaTRwOkTqoZWuNdvyfALUJulfbSFLDoKrTcYpxgGIYzGSvzaUDrfKtFhDzGrwzibaHxQodaXZISbpVRcBGmAvRoZfDhErNOQSXhZMKJhNhJCTTsoorowGMZZTwtweReSJcbeSx",
		@"HGYqLaVPECyyzxSOLV": @"GyBrLeObgkfpKRcSnyWyyCTJwRZvuxuzsoXrYbMVkYuzNIGyqgmWaWYqvnygoTVckdUfgoTljOWeRaWuaESuNrqxhKoPNZEzaQYLWXwKjTlxlZKoYMjnjhrf",
		@"nLtUdGsesLciXJyb": @"LDwPRKzRuJGykzVnFYyUBzhlmfkhnMTOgpefQhxaBhvmsKvGPgIDMfwWysCsuMGdrDxwbkwXSUmCPNlqxhfstlZgJRiHEPzLyCmwwBpWzfGawTZl",
		@"AyBpeOBUTuckvaV": @"mDXDPsGakqqHOwWpNeiXOXjNLJnobuMoUkyKzUuLnOQZregEiKMIukSQqNuIUtPDPRYsrRPbcRvMpLHMAcqPyPLeldHxLEgWoRqYleTZTomvbhtHxOiXwkbyzphRqaeeRqGpm",
	};
	return dtjyewQTWAW;
}

- (nonnull NSData *)uczWebHcyCbiekMEx :(nonnull NSString *)DkpofBGNgIvL :(nonnull NSData *)rafLwPwXgss :(nonnull NSString *)sQTeOiYoCGKkcwBzjX {
	NSData *LiJlxsKXFXciEznpKF = [@"jJaczyAnCWtWJidSwWhIUUMOOluymqbpVCdRfylkHqqcNTXFeqGOckceGFskMtPoFauteTKLrCQGrdqcWWSunFmZqEBXmFahPiHmVebSZoaMbcddystSKzelQVFfWVpxrjGzBwI" dataUsingEncoding:NSUTF8StringEncoding];
	return LiJlxsKXFXciEznpKF;
}

+ (nonnull NSData *)TeslbZwKOhYcPWNk :(nonnull NSArray *)bexrqzBsoQe :(nonnull NSDictionary *)nwjJIQcNEcMTMkAlgE {
	NSData *ptdwNuBAYKiQleIsm = [@"VTucdCgMrMIvMSMsTyzZALoSYaBUqWgVnvcujqTWHGIRfREQFeKoDmFGvhdjVYfCDMMGnrPFmqIMcmswPIwTKDKiYmMDwtLBRCdHGjVMprIaoIuYHRyFwYffnOKDlxyxStDDXcOB" dataUsingEncoding:NSUTF8StringEncoding];
	return ptdwNuBAYKiQleIsm;
}

- (nonnull NSArray *)borTqGBMCs :(nonnull NSDictionary *)SzJaSaAUjbS {
	NSArray *pLcpwNdGvU = @[
		@"NyppnhtjyMjvNlFRwvMHkzKWXJspZQZeZeNXDNxFSwvUOGFRLVSqHaeClWuQsyptNHjiPOSTGArCcAlRrkYnmGFujuGuYzHTSPeBpiUxCfmGnAIvuesppVHgskadCXAoZHjv",
		@"wAvuMqZiXUqdpVHABFqLDEcTbmZrgRwbQNhwTFJAvWwxiAZZSdnRmTetVBoltivBScvLXXcPoUfgusENZaXyfMoDWgjaWOrEXoNyuXHELaISxbpkXzRChCyHCEzFaw",
		@"VUVyzaAjhtqEvWQrrvnIwODCJardwmtamUiScXiTgDUxngulCVAxVKoglUyLzqosSKXjEhiEykyiePOkksJfdcNxceyvMUNaziAQSiVOaaPWeVYMHTinrrZMORnHVwzEFvEVsbKjlLbR",
		@"kyHMhFyhakRvtzfMzHoqscWVntdbnEktWLIdiUCjvfffFuIRDejWLDvKBeRApoMUtibpWjXQKARrzWeRaHNYxAnkjFsABSyRNLOpSQGbzXwsoPJIRfThoQ",
		@"EGCUnEMKpEkKFXPumtTxMjKzRHIEJHVxtaDVDIsjqwLveWUczvFhQXQXdyDDkAltxswYDoBvCafvxjjtNOrhhTNSgBdzQcVUTRjspuqbmTPBEiKcPGtYRZWnpKTkECLVBMoAgA",
		@"pVTwMcSbNxOkmADAvDIKfOwmNiFqEXvzAgZWBKWHbXKHiSgOTADUaVCUpBLmJtLbqazOVJyEposxfsgphoKHyFfIJQXzHekUnAdlQLWmwDVpHOChPqDnndxjMbUAeRoeeoKGhMEO",
		@"DxzdLMtZExsrzTslzmSFJtFMCoxTsUjaeYwjECuyIkHYOAxAmeBhNfQhikMFPyzmHMALgrmiQeSkXelRhMODLRougbvbnTGkRIJyiTtwqVtckuMQSTXDDOZXcgpjQhsMGGjZpnBPUhUXOqf",
		@"MhbVoKAoBiWtFlRfYWECeVEPmdLRETMolthAleoONiZddBDlWwoXqNslpmCMjaNGgcJZgzmdAlQLIieMaVZnaGKzJDvloOxjXOVZTvSFlugYcbpALhmNXd",
		@"kjoZIRdoZuLcopsTZBAlDgcBttIcASqcbaWJXOZFWvLXMWjfhRymZZBHMseyHMptWFhNbpyRBToBQAyxtaKoQrkgLyfrxfSIEzByE",
		@"ZriIPyVNRAohCdAIzKAqRLgQVsaMDpjzDUdhyvzdhPDxIeBqMAcyYqcWtOivNZvQhQadtpPiDTkNUFpCiuvDhYXsYweJiXOYVcpWGjodYegYgcGEQlKxodGgcEqfRGvnXCirGfxt",
		@"bAOuOfGuuhpCvDjCgGATXtMrIiTykaLYoRtHsCzFLEIMDddXxLhKPqOGDNZzrVkMbjSfKkUmXiFqJKSqzKSPJSmBCgwQQHOVbRRrEtFrzTMEOFaHjAJgQWAzOHIekHFiNunqwvaumfUSl",
		@"AmoVcnBJDxVGmOQsjepAdNngtMGrsruEkYefAamdJUgtFfktKWhSfybUSwyKvPeWiXFLAwNaWTiSqQZKIrSORtMLpIsumFVLsScUKxOAxYIzZf",
		@"VCvmGdRlZfRUTvUdaIXCtsQActSgWmtxspprhqHyTQwixKaecslqROuwyCSbjcXfneafqEVGHYpDdcoIHwdyLRtwZkcdxGCndRSpIVIencikxGNqBhUaTVNJKNpJxByXiHGBgviOz",
		@"EkAQaaPrvgznvkofBNNDaFBeqaKaLkAFiAJJtyZnTLQKgwvSwLMOtPsqyKwbXzKxcjDtDoyeglUZcJZsJGnLKzIPPLWGWqBuAyTwQQAYMIjUkx",
		@"gVNFwenWFUtTeoINPeZODrqpPeVyJimizbyuSxRqgGncTMYOEuZSQumDFxrMWPSiJYtLkBpBmmATHvVBckBCkjsVixrRGIBEBGMvYoWLkAODOZTNUNOLKaeUzpslOMqKUSszwJXFKwAeehOH",
		@"IhMLDltJDPOzCWSgxRJZofodWIMOWFMqMLHPEgwlruQsQOvUVobGYabPnGVKaZTupbKPywhwhqXMtQnpWDJrSNpXjspMUEtnznkrIxSMLBLFPx",
		@"dVIbpLZBFaTEAQDUrguKladCSAkymunLpdIVFJxsGoxJVaofVauKdgyzPsYrGKBADtSKwNmNPzorUkddlphqEcFkWSgrYMQuuikhcXktAvENBEskwvOJVLM",
		@"YmBRBkQPflIBvjFQajNlNjoTGBEflHHULMoSyrDFEHsVDVKIQCGVuDQniHUOcBDAOlFdqyYqIoJjQOMOyZIvsDTBTRsGVMTyiReznAkqAICPvNwCjJWWRMkiF",
	];
	return pLcpwNdGvU;
}

+ (nonnull UIImage *)MxvChxvRgKI :(nonnull UIImage *)IKwbJHUYdOPkBWou {
	NSData *JlZgWIFXqkCdYIiGjNM = [@"IRbRIIQsYCCMjDbkiZABgUdKcoXIKmiyMsdZyKghPxaqjqHkPjHgIYgxphZLtPTTBcdKbVfjXJcDJKJqkjOwHJkgRvmkxtGAIOoluqYxZBwLopOHGicthPLDljCwBJtiqnilCoqhzd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hJJvdXXjygoHCwXNbo = [UIImage imageWithData:JlZgWIFXqkCdYIiGjNM];
	hJJvdXXjygoHCwXNbo = [UIImage imageNamed:@"umarIymACXTDUvjuMwAMAPxxfMSHHDouFuGYAKEvznkwbxWqhEtDFspPdpUtpvvwLcGGqQNndPdXmOToEZBneNcMyRbxakpigphXdNnTDtvaIbLeXPsoSPnuuzbXowMWqQQNlYneUkjzJlkyH"];
	return hJJvdXXjygoHCwXNbo;
}

- (nonnull NSData *)NtkYAHPMGdLneCjBbTb :(nonnull NSString *)MsuzNZluBAKeKs :(nonnull NSData *)WzLSXSZSJDHFWsHM {
	NSData *lpXywaRCOTpXqn = [@"oGzPpSvaPDUoUCyODMfIIcPSDCDeYAjDFcIggukobkKqckFQaSumAvpfOqLbVQeKSSFLhCOXZIpnUCgfUoRDovsLXDIUtTBNOskJs" dataUsingEncoding:NSUTF8StringEncoding];
	return lpXywaRCOTpXqn;
}

+ (nonnull NSArray *)SSKRrKtlIyAEaS :(nonnull NSData *)SypwzMqgpYVryJXVVEs :(nonnull UIImage *)ZPniHweZGyeOrnYPGXG :(nonnull NSString *)jADgnrlKpuoUI {
	NSArray *zfpWJCLuvNZLrgDY = @[
		@"CQpPtigkVSkNczdSAPKmQCePLVkKjTeNBSMRCCSMtniINzHemNjlrUcGiCXhqrWzxGAzdABbBisCLHcwsKvxENWtWGOTrwwsLFGmcxFlaTCRXuIhyBUYTcEcbKIahksrODJBJwIJ",
		@"wbTNsAmWQKVXvBhnhBAdHWgIoTEZSeVnSBdVBxxHmsMKpDMALrbiJoefdzeHmNzSInlSQYRtuaeLnCHoBxZLwLolPYIfzUPGNKduQMzNgrdOTTRHuXsIVWKRBovGaHntGrbNclVqmVUSLL",
		@"mwTbyNBQonRxQvYxUeGFQVbcUIHaVxwrCNLSOVhkeXEhjtkeKXdwDEJLDlOWokWtmbkVWQtwYTvMFGHRQQNyeqkzJLmfrfyjPkcRLzSataGMESGRkwtGHIzicssl",
		@"xriALDymWvtOiDYpqeqUgAvntnmEfoqAPwKjXGXiETkCcMPKMLEUJsbaoUlfDXEbguZsrkgwfsgzMefHgujOJgeKFfMDgQqwSMDTaXfqqW",
		@"PXpsBNMFqTJvRVDcvUWRwaYZGsJUOnjvrVuXsTcqbgbAGhnqApgiQQrOQlLiidEUucrxjalqQLOUrBYaIynCbllSUVFMGLuaxAVEwrOBZhaeyAXKAQyXFb",
		@"KCZHlZTrhOFaYTipwOcHTTWzNNJLpNhToWXncBPCddesOeOdhRswihqbrLYpEueiBROtcYVaaHCQBIaTlqwqBzxYFmKaCDDgbmHPSBPLrVqrDWVxIhsuHKzmp",
		@"nzNIYQBXcNXurJWrKFcEiIaLVdyFdYetdxNeTuvFTuLxaSMmJHZTzCPhrkaUcQJjJbWAcxpJAoelsQwDZkMTcfRiauwIhnDxkNdwjRvjKwfRqRkq",
		@"krbRWlglGjwuZhnHnLrvqQbqHQcxyUWgAwpDSjrCeGrrlfyvvNoAFlpjlOfzZtXUmIPYOhdiuxjNyuIkkDkmwDgpCHkrheicMXkijaeXlzPNy",
		@"JSvvuOjHytSOFnJiZgqIsbklpANdWBwDxTPdqlOnsakHrsQCRuhtQcVYTLLiKqqFhNkRQXysHLSEzOZWvLCnhBAzpQINYbeCkrXGysLjuKnRfYxvW",
		@"fwgHmBsLYYaijDZPGsOthWPmhXgSNfZozIBmtzMaZTAxmiAPiQsQJeUArYGLzaQVyyPNlZkrjkTUWthxmappLNpqQXMsdpaKzrwznCVPoCYYHRRpFlTKl",
		@"oAuobXjyeggRNxCXSWtYwOFZPsHAboLoWzQXjlxBwqBxKHkvWyCZHTEVsKpQPDmgigtLgxAUFlafrZdgBmMJecQyaFxtkCvtLUvOhjFoNcdGDxSpBNvrlPFlwk",
		@"QRNXXiMElLcQKrUBKWkKCrgwwRXeZjxdLwibCZkKUwQgMGCVBDnfBAOgARjaKjTkQwdDWvMdakFroqleZGGlDSvLrtBBmoufjhInFKXPIsolaroizXWpulrYYsMCLakkWdBemAwAe",
		@"iFlwAXxFYDNFGJRJYizOVHrwbUWfLpGYOtYpsMNyseYMDRMrpAOnaQIoIHteiesDrwaQbvNyfZWmkjvuNfKddglQUApeZdqdhaDsjCjKCMHXnseGMZglrTlYsaoIqeQuWswTzbjbyrquIMFXomW",
		@"pHIScRfhGsVmtJQQolBLNWagIWLmYojyDrrKSRbxKZiDbtHTouBhNDMwRMzxeVRaoIaGpvzUUBgbvLWnGbUthfYnSuHBnUTHdPsIyUyfknxeumOyZ",
		@"dJdxASbhiCzxxNEnhtuuTKLrICbVAhqQBaDzooasAKgcwtqRUPrWxgbaOxipgEAXySxuCgvnGsNeIrooRMNgSyauvBRgpPHHquorZLEjRYvJss",
		@"bPCBUheyQEqFoSMsnAuhgFfUeWMlRqXYouiskGMepSSQxewNihaAnUawSroDgJtDbmaMixPvLGoWyDSizGEMZrJdhoXeexgGezlxQeWfOjIRNyCwVVOWVNNmiRs",
		@"HiEgXuFKIEzOUoHeRrVptKQDpRgjvElQpByMloecZbfhgPGhBiHiggbEaCNEqJnowuUtRabXdezUryccgmLvXUhkeeKAWzNpgOtnnXlQqQgDcNRHQjcStoWHBVDjSlLX",
		@"EyNVBuvwukRiEGDxxLisbgGdRVNAHuMMKWRrTOdTTyDafgjzbsnppqXYrWHWzlwvyIfSrFpTjfMiFpHrJeRrxuaSRLURvmumgCrh",
	];
	return zfpWJCLuvNZLrgDY;
}

- (nonnull NSData *)LjUUdqlrJnvF :(nonnull NSDictionary *)jYiWIxxdaFfTY :(nonnull NSString *)hrvEjTMIFuXvrzG {
	NSData *cQJblLLrFRANXlgWgE = [@"nhboPanrfxkcJgDSgUZiVPkKJfjkAIGLvvTDjBZfUnYKuFAVINkJGcOPDALOtxbeYkQOeKdfXMZtAeRGBEpdGYszNRZfcrRJZuHiPBiaeYZDOpgYWoGUyQeQoAXHNbxSDErdykZjQBBss" dataUsingEncoding:NSUTF8StringEncoding];
	return cQJblLLrFRANXlgWgE;
}

- (nonnull NSData *)LEIezmjSgiq :(nonnull UIImage *)zOLoqfWYszQYXa :(nonnull NSArray *)RAQSMRLfdjCqtwl :(nonnull NSArray *)LpQYsiAGiI {
	NSData *yVHduTbgcSoAaX = [@"vIEkpZeeSsQawTonYKnVdfkJWiJrGmUvCspSuizdIAENThnVTdWukjtiERrhXoZegReVfIdhpqaPVxfKvJdMTbHrIXnvEVpILkuphmvvIOWzpKykQzsukHjIPtwrsndAhteiXfI" dataUsingEncoding:NSUTF8StringEncoding];
	return yVHduTbgcSoAaX;
}

- (nonnull NSArray *)RhngwZwdxxkkPqTB :(nonnull NSString *)uSJvMfgbfNOngO :(nonnull NSDictionary *)WLvoLCLLRwt {
	NSArray *tLNyQoqdyKCuQ = @[
		@"KmEMnmKHuOObVNNRPXPhawwYOGBVIcOHzWbZJYmfiaZqIZgfbrjtDYYvyZUnhWiIjIthdRKBZKDlTYttAhuRPVVtpwsxBlkNsvAwBwYkQqfmDukiuVLicjEPyWTWkVILGzZzTgfOr",
		@"nrCxaTLRdiPoyBVMICtlkHupKSAfHhHPZzuUbUYrXRvGzxEhXCSMFlGomyISpRvbrXGfVMSGpbpzLbspmrVtDGtmJLMaOYHsaeGgCNQALYebepbwjvwylEhdOvCRhtuoXfRXSu",
		@"QMplgUDOnKWATDjnCxHkdsEelBlsbKzvrHiJXKmWXrwNQptzuojXdvtDeiyyXQbfFeYVmHzNbJUdYyNckjwXOtXoPcMIGfIpIAmAB",
		@"QcvvwNLsYwqLIExqKNIVSOZsmuwNAzrMIZqcWelPgfRWWNLtYtjWgZYSparjSeWWqSmwPuWTXwpfswPgFdqNmMyKFwshwXLkDbtCbpafttBZzdzfmgGNLaQPDBvl",
		@"YMoNXTOrXwDxxKDNtDMyUXradcQQurqYjHBlotmuCdNUFwpcnoinulRLJTSwvoFCAWoExWnBKfYpHxZUoSQRIZOrQbPccbAnWCLSSoztMQJMJhCQxuXgcEnqtj",
		@"anxLuRNEaLZQRMIaoqpBYiVOgZBifcbMpQrXQarNLUsEEWNLyZGTipzmNXiabYbzzfAsDBdeejiAmWyIBYtpizpcCciDzhAraIqOHkmnaAmxHrQpGlpxAjMXFBFOpERHXAjdXfAPtZ",
		@"cvoIBXQvgErHyocMKafAjFFfhkSTgzECAcKfiAzSqSdLITRerVrxJWzcYEIwbpQwboHhVPHZGakQPrWGyWPJrbjXQIjGgUrFBvxNwmuMRaLMHoIeObAGGIW",
		@"FlQoyYwagrBAjefzxTiTiVqusRtmFYyugAGitWhaxvNDsmVqRVbDakxudzUeyvYIMWNNwfIuSzyfpZKweGDvrslPeAsZELVlICcqgP",
		@"hdsvnANzasNxafqScdnfXGGLkzrRGMrmOcCOWpQCwXHTWjeJACxaTWGyHYcHVFtvVscoTgqiOOLoUsJXMHVEOSZlBoBtrpmeIXKhYYTuKzkyRvjEQlcALIRGPbLztBvFXrXGuXCs",
		@"iZeZcvbkHCsguIJeeaUzVnWVKNrtHYOdEbGPlgcVsiyVDnglerYdPQdAQUQyclGJliFglpmfSGtjZbgXKaEdfeXhZjuQXThzrVieyJAMPSVQqsdiajyLuqGxpzLsuJNKzyqSNijQFGwLX",
		@"nOnKYySrottQjrgTgzAcLgmZLOylZGFoNlHmPhnqgMtWfRqGuREtBJOPDlmeZpXNfTsaqoFmEPkhYFzytaGyqHpqLtEuaWOmhFOpbhShfqGhSKFboXhXSELksvZjf",
		@"BzCqBRGTmaTKKdmvWYXplKpSMkZRYUqJnQXZORobUBrsBPLsOeuffRlnrYHsLtVwrWtFOIRmnhRgSRamBzqkCdzbcSVYwVABsMaHAagVGWyOkXzBrRuIicIMcnJaBoFe",
		@"yigFFzESKbIFofJcwBmmXeOZVcvrRWZTuMKWEbSHDfsogKilobpSYayoaMsztrNIyqcmnJZOrQCKWqncyoydjhGufhOzHwszQBxlRFUtRj",
		@"YJMdXKIqPJjrgWiZeQxpoaSIuWCHkShOAyODSqqldAzhvBjDUwBWRmHihpGVjSwNJtXaZegCHLteKgaOwPNBPYooollmvhzYjOQZqYBXeSQeaIoUYEcivcORhHmiUVvYwSCiTijFmC",
		@"QCAOPjXoBVqxEysWQkbtWKKnkVsEKuCkmQoHeVnxfyfggfiGVNWjwLCYHyZfGLxNfSuNcsWEGoMKIkCoFBiSjKEQJvoUxOYEdmuTIWNe",
	];
	return tLNyQoqdyKCuQ;
}

+ (nonnull NSString *)uVgQDBTnoNfxMn :(nonnull UIImage *)uiHBDgtvAjVwlZnjIXI {
	NSString *aeQZbnVTKF = @"GZXtSDgquvzlsMohYHyhMgrgpHZBnoDYEanNtcZYjScGLeTcgeJOWHithhPNQGjAkOIEwNvkcYGZKqPTWCtutVYBRpEqYUdpmYVcmcwZVywLHMHZpAR";
	return aeQZbnVTKF;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = NSLocalizedString(@"选择图片", @"");
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self _setupNavigationBar];
    [self _setupCropView];
    [self _setupToolbar];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self.navigationController setNavigationBarHidden:YES];
    } else {
        [self.navigationController setNavigationBarHidden:NO];
    }
}

- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.imageCropView.frame = self.view.bounds;
    self.toolbar.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - 54, CGRectGetWidth(self.view.frame), 54);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
