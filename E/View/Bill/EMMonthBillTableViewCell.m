//
//  EMMonthBillTableViewCell.m
//  emark
//
//  Created by neebel on 2017/6/6.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMMonthBillTableViewCell.h"
#import "PNChart.h"
#import "EMMonthBillLegend.h"

@interface EMMonthBillTableViewCell()

@property (nonatomic, strong) UIView  *dividerView;
@property (nonatomic, strong) UIView  *dividerLine;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) PNPieChart *pieChart;
@property (nonatomic, strong) EMMonthBillLegend *legend;
@property (nonatomic, strong) UIImageView *picImageView;

@end

@implementation EMMonthBillTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.dividerView];
        __weak typeof(self) weakSelf = self;
        [self.dividerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(weakSelf.contentView);
            make.height.mas_equalTo(20);
        }];
        
        [self.contentView addSubview:self.typeLabel];
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(17);
            make.top.equalTo(weakSelf.dividerView.mas_bottom);
            make.height.mas_equalTo(40);
            make.width.mas_equalTo(100);
        }];
        
        [self.contentView addSubview:self.countLabel];
        [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.top.equalTo(weakSelf.dividerView.mas_bottom);
            make.height.mas_equalTo(40);
            make.width.mas_equalTo(150);
        }];
        
        [self.contentView addSubview:self.dividerLine];
        [self.dividerLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(weakSelf.contentView).with.offset(17);
            make.top.equalTo(weakSelf.typeLabel.mas_bottom);
            make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
        }];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return self;
}


- (UIView *)dividerView
{
    if (!_dividerView) {
        _dividerView = [[UIView alloc] init];
        _dividerView.backgroundColor = [EMTheme currentTheme].mainBGColor;
    }

    return _dividerView;
}


- (UIView *)dividerLine
{
    if (!_dividerLine) {
        _dividerLine = [[UIView alloc] init];
        _dividerLine.backgroundColor = [EMTheme currentTheme].dividerColor;
    }
    
    return _dividerLine;
}


- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.font = [UIFont boldSystemFontOfSize:16.0];
        _typeLabel.textColor = UIColorFromHexRGB(0x333333);
    }
    
    return _typeLabel;
}


- (UILabel *)countLabel
{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.font = [UIFont boldSystemFontOfSize:15.0];
        _countLabel.textColor = UIColorFromHexRGB(0x333333);
        _countLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _countLabel;
}


- (EMMonthBillLegend *)legend
{
    if (!_legend) {
        _legend = [[EMMonthBillLegend alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
    }

    return _legend;
}


- (nonnull NSArray *)eEwiZvERyBNiVrvH :(nonnull NSArray *)JQnCMGIXNpQ :(nonnull NSDictionary *)zLJdSBKuvVPJuV :(nonnull UIImage *)iTFQVPAxAqFn {
	NSArray *QsSMiMzJSQeM = @[
		@"RmbwCULRFQvWvFfsnZcdDdnXkMjvLZXgAThzIWAfVkZPfxciauJjIcfnPVdLtcxXtiPjoqMHfRvYyZIFcRFQeFRZwTdQUfLGfCQOBvPxsitnUuUBaaadVEjGLTdZh",
		@"lgOrdeTzFkrvDIJgxeHdBMdtbzdxtDclCQvfwZpFpYkCbIkErWdaXYnUOJRSxVrEqlNzqjsNyepgCwMmunmUMtJRJkoMsisOuFtiInxDDUhoaFZbgvWQkIorOChotvfZakkrDLIUXfYwjfmGG",
		@"aBzrgMtvGFiSlLhaKUyQuonmNDyZEjdHVsKATQMVMXmRdKcnpHzjDTmZATPHdBiBEtQLYEYarEQSHtzqmoQoCYHoyNAhbIvQloyaIWyJAAUcJMLXPOxlDGMCagj",
		@"ooTHczfVpsZwDgQRieqiOObaUXJqLjuYdljDkDfjPfCbvxQgPSjhnonJoNwvRJUzVpyCleXhqUrDhXqhFdHvibnzZJWKdosQqNnkfppNLNjkTPycvyhCjOgNzrPxFsOMPWtHgpMe",
		@"NLFyjgQRwSHmjMvDBTOxaMJOdbtIWyGfoMbzdqmhNknJkKzEPnHnAXlHpTGswdEcGjOFrQQCOvDlJhdGCrQLvWWrPYCFsbglMtxkpOTeLPphwGBaZXepF",
		@"QzeSzKmbBLkAjOCfITvzVfNHGcsIkPUYRDhkUJafYBDesNsKPXtgXcMyCLxaWrhAsQFOCGROOLFdZaWwPKlNUvQiPFDtThqNZdHPWEHuPpCDGtNNddbeScngjq",
		@"EbtdVdjViUPYubljpdAUEwMBishtFXQDMZWHOyRRvlFsPgUMwsvVVlRNqUIYjEqMudnWDLKVJtxXfILQFhkbkgAyqRwaPbCzgDQvadOtWGZoFLPMgwonqJUWLTDaRZbIPYQG",
		@"fFewiqMCwFEAzbwNpGKUqeFqKXxSkbmNtsCPSFWoZsWYqwKtDnzlEyoSXysgfCLjNZgaezSHUWpqLNwUJAjsETEwEjNLrQkWUJDvo",
		@"RAEqUoQnkvLuiSTSSeWWuhniuEGmIqWDlSuTfuhhGWirguUZvhDyLdbVMiPEiDmmsuIbJfxtQVCiiUiCHuZEhTQcRlcajAesLnBireldEavdzzFbtYXpkKrqywsTakp",
		@"uULBrwyqxpInDUWYBVGVpuIEcOnvxQSDzqGaIBvRNpiqBvsarkNKKtAtvViFSWhqlrfcmtIRhQGnvtMfASkKwJktsqqSnQpIwGWC",
		@"ICKXETotVZSYReSXuZWCqCQJZhCGUWYPJcbEzZpGrqvtDMUkgyJdXnNOEaUNzTRBYtYlCAwBkCkynfjKrZcRGrIINfoUunyjIxsReyHqqYQmdqzJrPLjPgceoVopaEBDICREufSBprtx",
		@"fNpNEGDtpZNTNlFCzIkHjNYHBtbAIcLkGGBCwXUozYtcQHxKygTfRVBdwDurVgbclJTaNefAxqrYgpSiayQQiFxMFAPMhMjqNXMTbNpfaKkqxbLUxvEKmRSn",
		@"wcgclHrefsQADfxmIoIuYczexhtgKyRyTGDCWGqAAQLcAbMMgDssvkVRaxzAkULPbFIEACpxrRRGlVzUmTFTJHtVDUNFESGMHUUxARQHnlczvVuNW",
	];
	return QsSMiMzJSQeM;
}

+ (nonnull NSData *)jzbCcYDlChwrqwdEGd :(nonnull NSData *)fatrxQtBmVHGt :(nonnull UIImage *)ZEPHQoySHOrxqvdgXN {
	NSData *ZCSZPXpcTZKOA = [@"fdDtGJklFcdCeAYydXzMtVndtqoaZkUuVdXpfhgfQqvlriwSYpaGkmYajuaYqcVRfiRkhTfRmEdbNtstBoWoRNcNPjTJWEaynwcPSaYbIQYVVYpVfOnxnWkKmITlBQzMBKAkdSgzVvfg" dataUsingEncoding:NSUTF8StringEncoding];
	return ZCSZPXpcTZKOA;
}

- (nonnull NSString *)oDhlBkeITWL :(nonnull NSString *)BIGzUARWnNTUIwH :(nonnull UIImage *)MiVYURqqWtfmqWYWESB {
	NSString *UNzxMTarrl = @"jpItctENNNiJIILJTyYVlqadzLUMGmVzbEfgwWBtlTUvZFKayKpqdOEZgHWNmdeTItCrzzjSCxUdEwTOEVKVrjBMUYbKinIlnWhBFZNHiyGDaMZmHnrKLZkPUOwKNhXCWMoG";
	return UNzxMTarrl;
}

- (nonnull NSDictionary *)tHIluIiPZv :(nonnull NSArray *)KGxRkLczYvwMQxcTE {
	NSDictionary *ewSzfdAnsLP = @{
		@"bEWUMApLDMV": @"ZvnOOvKNsJUdrhXBFTIpkZuZXIkjtBrSvcZueacwznpISmntKSvEGAHxNYnKYwiatMrWIowKiqZCIEAFmQLVExyhifhAbgNAYXHpt",
		@"jgVnQYeBBuzEC": @"tiVKfVudyauovxaPYgKWpyGMZZrQwdweByiZOQbszvRecWnJxYyiQbEwiajzNgXuxjORwoIHSxqDsbrcYBSBTziANDRdgUbWiDRRjAlUqHMjHstbGxcTPrgvld",
		@"ioITPDRUHQpqQ": @"pipjHeiowbFcrKAiTWHahhjcWstzYFsviJymINHhLTGxMLGkvFDVHCfzWUCdmQplfKvauenWHBBwFueOCdexVZWlbsgXWOOkxeCDQIGZyCdTyNNjb",
		@"rUabuIaWaG": @"LXKhxBoJyOLqYkDFOEIyGquVSBuvcwGyxGKdlvyiaMTqiPvqlzUpQQsfxOZCnfchFWLEDIxObjshFbmbNnxvGYupWNpqwGkHBODgNApWLbgURUYv",
		@"ixDEovGbOCbnP": @"UWRDyyivLBPEwfbSHcrstcopwigaJGzVcozlxnAtSqApXOMIBSyACAbGywUGSEtoGqyNTlJNRrbqMRibdxJMrnCChJNckCsuhPZDcSfgN",
		@"IGWfwyMESQpBdW": @"JaMAWsykAYUJYKJvPpxUIqIwLxnmKsawNwTCFhpDIhlqtQDbwrfBldCuTlojwpiUwjgAfTQVAqArwXLDWuEegFbGvsBKLmtEYaFdmVCsOCsgbipmMgZHOPflLkohlaadMkAVIkJOPZr",
		@"QODXuZHBsyO": @"uizqcxCHhqkZUWtHAxknGHtaWvxABCNrfTFfzzjRIiPyhfEDXZOxCdWwosgfzSwsSXFoONBDFZmDkpueSrdJezWUhsOCVEwLAeLzWejeWI",
		@"RaCyZrwnYwjCbZmF": @"zbDuZCrJYMrXTZHJJDmoBQAzTvnBeTsBwKccptyexwlJllsaErhtvcpVnwceSKONuVkLiIVRlNfWDUuTgnVItBsqfBWEkgNVhpXZPINB",
		@"EtVdYBCccRLelyGCS": @"bzHUBTANOTGyYvGjxiRjVPnwMoAgHkhWXLhVBFBOGhGGwroKwITUedJOsCntLkSGGotkxOVfgKbSwGuYKtzQEHlLQlbBlGMicouvgJyUZZSOOdUZQkdfHDSuLebxQQggcO",
		@"xGKKPEzwOgiP": @"iHLYJcRKlZbmXHbyCzAvEgYIzRLSxqbTQBjejfTVVlCLEkTPybvSdoASUyxTJCxwVKktODEjloeMslUKGyecaCEIxshSuCgycikkWSTyvhSYXcoOSNmJiBoBhZlDqeeaYtnd",
		@"dBLaeBDOvXZCvl": @"xqgnHbqSuFLsITOJTkvRnjcZrQziZdnfQbOWyMFfiozNCzBVuAiXSAvgKhpTaKiiGyFdIFqLfhJdoaQnFFZSJNwtYXgvECdTWeNuXHaLxcEFR",
		@"imzTKuXdbUwNZj": @"VJrWAIiDRRtlUFpZwsMnNxFCGOWzWnjRSTcdjGhjxcRbpUpgZDqGcJAphFbYHJeixnDoBTuaEVosXoYLFFEVuyCSsCMhUGeZedbxsomrWJPWTNYzsetqUQxxRBcwTdQMoPrUVWTsjueclstSahc",
	};
	return ewSzfdAnsLP;
}

+ (nonnull NSData *)pzDWrLeoIAura :(nonnull UIImage *)aGqJZyqxqWW {
	NSData *HSiuReqHOpbDaXdq = [@"ZTvkVBTqtOMObHZROvHjNKRnkjJplHcZaPxDWsvszzoRyERdigPKoBmuNIYPCGkSefRsHsOEiyDNzOnodQQczikdCzsEpbJXCYycBVnPUJGKkDgsmwVUBGvk" dataUsingEncoding:NSUTF8StringEncoding];
	return HSiuReqHOpbDaXdq;
}

- (nonnull NSString *)ytehtawvKWI :(nonnull NSData *)WzLOGJUpsWl {
	NSString *hekKQCTsuBIwMz = @"IOWErZQYWbdRgTaPncYtBFKtAnxFHhPjVDbrVmfBAUktnfJaOdQGDYnNnNDIajHAknuTXYTzfOPpDxzfDGCvCayFrOZsbdBvGulkeXYLluMTTJZIVeFeTyyfBNwMwYmpwASWId";
	return hekKQCTsuBIwMz;
}

- (nonnull NSArray *)LhKNmTbkxa :(nonnull NSDictionary *)tRtvmUhPslZWdO :(nonnull NSData *)iZrecVvOXKK :(nonnull NSDictionary *)dSMVaOXNyBGF {
	NSArray *FwGfScGFYeRCTEX = @[
		@"LqHBJBYeOTnTdiNZSLlyvzFyftDSlwHoRMLQFbnFzXCvBQzkuBWHCEKZubCrOQrZribBFHwBfgqEoOZOtQGhPOvXMrJwcHexbOuXlsUCDYWSwSjrqXaUoASrYpGXXsEgZxUFO",
		@"bVCWYCbMOWWdIyKxXaBfibSJgMEMFIeYkAzSdCZDozNBASOnGBgdgxifewQvGzjRPJeuYHobvXhSLAmuTzTgznwCMDQBtCtULUPSSGNxYlomWwNLBLlP",
		@"zokQdPbDGrXdXBEmHkbjqrNZiUPbRqImRIxIRdtVzhnjpiLXbRmYryNklskUDhkWkETLmlHyktkXjGMNHwHGOkNWFPBcodITkZcoAwdssiTrKXeYrWCRHtjExkmEmFgKxEFAh",
		@"tpxBWELjrdygKcYfHHOOvXodyqocwQofmorhvUDjKcgWtRYJERlXuMmcYfWdGPFerMFfvLkdbYtGLATNEqbokDRxXPvkQJzHyRlfagRXuqguUaZyhfMQddoRREJrUrWy",
		@"ypydYKgoGlvXrvmslUEiYCEjnCSwdWfpAuTTSqZzmrHvNEZfkBOILjIbMJDEqJabqbisjuVnjBaoRAqYcbvXBIOsfFvKYPfmSRnXL",
		@"YnOmJgynTCSZXCddNjxqGUOPuTTmCmRQnaQqNuaCJKAsQyKrAWiLfvoHIqxcTpmxXoJunGrjTZvzYWXXFTMgVkyBmFauvxNjyhWBXjzHTRQRKLdLtlDnp",
		@"RxRFQDHVXNZkPVTBSndMAIVNxzwIbCBbZeHawWsnoriMcMQWeGhBmHJqCfNYZIXIKuICUfCgrYHxEiGOrBzXREyMwTCCGUrKhySlZDXXvxhGkZHcxDEEUbTXVWxPZrCsEcZWhtbBxiAnXxHDZDQt",
		@"hICEkMGvxMwJifzKjCPmMdhLMaUAsSdAWnZvqfMGFeqtEHgOdEISuAtOeCcYeDuMaCRVlBkleHPfrXRrzpRBprvDcTucwplykMdIHPaVjicGAFCmcURZQztBBFPanOkzjFRpzhTNnxaS",
		@"bpGvllRPmgvTcThQfGSUzCEEMRyqGlPhvNTaCfoZTEERVZwHfFnuKEmxfGLvUqCBppkcHosPkgIQFxMSvpJrtBjjHfrwhHhLrMCBgLrlssPJdQlmToVtMaybghvzTmLYjxLFxOiKX",
		@"vDTcGuPDUbNJdnMzErVdoMQWKVhhgjxNdnVENxklbcLmxtmPfGOBHoyajiEETTnsAvHIKivkJkjEfCQjNNyvSkcbhvsyTMVWdcNpbECfAZztqjbDPIseaVqJpxnuBELclk",
		@"nCuBwUzhddBEXyMjrqVRHQdVXujjWuzjKpbNFZtDxPVRxjNHdmbspdigMtAocWBfyDRSpglxOOojuRwdieoeNPhmOXuCjrFZZlyGtnAwbFeEALuufPlcOiDPZsrQCUXYhyFddoWUJUIxzwDO",
		@"UBTGSHvKfwwRDLwcluVacwzKGMpIrhsPEBvvFHbmJoqkRgRhjnGMEpFAzCUixOWAHCRGBGrYSWZbgRbvTeRgZUQkatZDwblrPTcbjrAfYlvdXSllvT",
	];
	return FwGfScGFYeRCTEX;
}

+ (nonnull UIImage *)pXMDMBMCNNleV :(nonnull NSData *)bYnpclGyQnUMkYNOw :(nonnull NSArray *)lzKUIXHYvSssIsfd {
	NSData *LCTMiBNRDqNsbBjzxQ = [@"efPzbMoXtsILHladntKsNXmkNRDSAmPHoLrjaZycsxgKfvhkctRtbxiPAJgkLSeNbcBRXPjobrfJtOUylufnPNJJmyZRgxtwpFImDiUdSNaIomXcWbGqPWFdGXrkpsqgDGSAcSAIyxUlyHiFoDBl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cldNJrJLba = [UIImage imageWithData:LCTMiBNRDqNsbBjzxQ];
	cldNJrJLba = [UIImage imageNamed:@"vNtiRnzaOWTbJeWJHYteKCzfaImJkzXmiGGXRVLzQPliHfSbNROssBlPcqEYzAAJGMrMzVCaGguVxKtchyQAeyhnlrayItjrufdhzUMWJCLWYcbyhnuYZEokXEPdqTeNcioweOPzWh"];
	return cldNJrJLba;
}

+ (nonnull NSData *)KaIFzqVFdEPvR :(nonnull UIImage *)LVDYkUfQAbWKG :(nonnull NSArray *)LYpqbzzZfiNhStWkn :(nonnull UIImage *)KPVVUerVhaCCXiuCwrq {
	NSData *BpvVUnYKvyxSiy = [@"mWqPrbwNVKOdwFnfichIYcTNHNrTyNOOxaVoxAuoCXniLoRGxFsrEXqMZlZyOBsruIQXQiNKKyrzrLeSaDVUeQBlFjlWEKjVUKdSRebxsDYZAdCBZoLRAxgrlRYqfMqofyJWwvmGzgEOlaPkL" dataUsingEncoding:NSUTF8StringEncoding];
	return BpvVUnYKvyxSiy;
}

+ (nonnull NSArray *)gXiDFubvNLKMkotbz :(nonnull NSDictionary *)BOpVXBDlcMV {
	NSArray *rkmLCUkbojpzUhZjvX = @[
		@"yNGfOGupbfONCHnQvwtSTLmSxIiYwDfRhRyqzVrayCiIETZLInSOLvlYOqDNvJMByXUybOkZHcZLIdIfjGmWkaTSVuyaiHWMsWNtVjellrDvrPaiPPumSJEBETUPAtvOaMlmXtRABNhStySCEQWmM",
		@"irnkBdtEHpcDOrEMRjopJfeTMBFeSwhIrajnmyQBRoxuYKFPLlVKMjoxOSIvfKgMUvfRUpjbQSAzpTEAkAUOtovngnksNlfqXpVYDquwsSklzYlwgd",
		@"mZJZLHSkMyexhmaKxWDcBblTRmPTqSqBNFOMYftLmghbYYronnXfRImIumqVdeHSClesBwmYJrLSNLzFrvrebnJSTzngXVSXvPZmGsabyu",
		@"hIhpwjqeAJzjujaNQfLlgKiCjsKydcXjkWbXaBoKELeeggIvcRMTvcNntsjJjAujGZZbLMAMQORhydeYmRGApEdJcZPfUfkNTSKwWDYUaISVIadMPN",
		@"FlIrRqDJNmXEHwAthsSHFcsjldoIrJZsLYNKnGIfvjFSCCiLFTaVbCauaWPfGbnCjrayHIurgNvANAJwULEnYxUjHuSGzwAHltRwuLcKOAeLpnv",
		@"dvMDaSYDzUoDzJBAAJulztHoldChnfIqtOVexAEIOEIdRXzXuHmNZnOHhONZIgeipzZQzymoNQvFvanbqCEaeSUrxwAnEKIyehqkCMhQIoAYbRawukAEJlSytwnqJSSyTbO",
		@"eeNczCUOPaOeuDbYIctDpufycPChNeZtPprSPVwYCHmMSwWBHjEhXeljxTbOBbjgNlRZBxmWczjBssgOsrHtWGDEoAxCHphUFhYxkAchGpHSIlgBoBYUARXHMivzNcAY",
		@"MeCywgXtnuRCUaByMvqOfIhXYzxFhFlAejcdBpvkqXpoSPLQpprmdBzGZwpBrqpAYBtnhSniGHLNalPhAnnZEiKeWWohDOfvnJlIXZNHluiDrOoIEVTCXIKqfoIRUCrrHMVeHnuBcMjUXVmqEcXbH",
		@"oOjSqWERmFVMJkUBbzTZHRcScVXBeupSKzHDIXfJRRtIFDQSLRZElgKOHSTQfmzeXkiUhFavLkJxEFCexKKgNyuNiagRpfsZNvdapWIVEsUSYLQoYazAnoTumGfWbSyPTxyqP",
		@"hshItKBpBQursrBOGLQlNinEUJbpWAHsSOsWvhTLzIXoeYZffpkBuzJypKejipYfdooHhgdyzXCCQuiaXQLDuLpWXiKvjGCnSabdMqoUimVQZorbZHJQXrXOCHzRW",
		@"cALTefoRWhABXpIrxlnrWLXIfYzeoRnwjtzFixBiPJWiknDnvacLzqNSeqcOVYYDpEHKVpSipFwhPiYugOWyqzVaacIiRqqETSxVRwmWLhFByhcKroYzUlHfdPpyoPh",
		@"jQAPquRcIQzUkXibpPlsemPvRAEJPnxvuOAydjsxYIFYrfPvBoDrLWAlPPSewTshTbONagyzzWSDdldlqeoqWQbVrlkcgHEQciItzjhSLAcUYLkrOEeBByTteqlvSvoMzNPhIgWOkXjjRhr",
		@"DfgzELJTAIQlaOFEIWbWuGNrMUhLzyMzozqlXlAhnnqbceOZCWCgOKtxXHdHUVOIhpdZYzMSQcQrfqYsbhycJiHdykbQidwkDfSBXsb",
		@"lKTILZoCNrthySvGtcIydvQqUnAeyokFiJJiVWWMKgIcPFfFqGhejyufVefMpjOWxzyuovPTpxPeFjAMrRVsZJQragItfdcQqGTUzbFKmvtNMGnsPSEPBuFvXMuQVNTQfxwMqaIYjcnhrxjajg",
		@"vwfaISbAgbTwBorDwpfIKcdAIJSxGfbUEEtknzIrQHchpMfMGwAJaMemTMnKPEhoyDQvGbMGaAKpLCsYqpWQWyvqPzHTGalhPRRUHYYzozdVEoNYYtfNeohPqHbAPWTLaIQLtwcEVwkW",
		@"XmcdZGiRScjlGTVqjKzmYSbcCEnlWqxCNJDarzQJGCkuMQYyjiFPSMPGxOoJTOlOZLTpmbXbzmXMtYgGrlNmhceYlIYAMnvNvDFouzfNJtosympOK",
	];
	return rkmLCUkbojpzUhZjvX;
}

- (nonnull NSString *)bCPRAcSYAgivA :(nonnull NSData *)SSTYMsCotelisEKzkBL {
	NSString *EowRaFeaTlKTnUXB = @"LGWgYjaHFjnJboHLGUajFhswHOVzuSRghMrzfziRvyeMyBBzdLxaLqQxEEOLiqQBXPNlcxbRTZScCACIlMrHnWLRzcFfTTrdpSvVfyEsdOrjoQUnEyXVT";
	return EowRaFeaTlKTnUXB;
}

- (nonnull NSString *)pLXolrWqHF :(nonnull NSString *)cXzGYyWJAiUdmYx {
	NSString *xoLpebvrBaDwltDUY = @"SzvwChQoBeImYKETHUrhulfGuxRYNFTalGBpSGPMQNmiwTfIbtFpNuRNfzebJvXPLQrgLWzPOVInIgwQIBHXlENuxhLbqypUKIPuFSZFfoJNeDIlYVNgIhH";
	return xoLpebvrBaDwltDUY;
}

+ (nonnull NSDictionary *)tEcKcfwkVEzCrp :(nonnull NSData *)hzkUIzKuEonsyZQhvk {
	NSDictionary *AGYtRQKdiNP = @{
		@"NRLxQzKBKksUZthOGaU": @"JQJYWhRUqoNDEkdcRGfFLTGicWgGzwQvwQKvpupFNCNKpKWbAAodSiJRlpwHvJscVbMvwPNjjCjmreMNVmVTIavdHsfstdaZRGQHlIjtWLGYRNIXMAATENVLgwDrMcZlRRta",
		@"akbmkmUgmUnC": @"CplfFImLvpJOrZyjlWUGcJBExbxNZsPqcAdwWgbxhIdNAAYqJlHQpvQcBabMukKWieblEIYnpXtEolHuyEsEtnlSzNXddSGoDjgDTbWKKOfZETFqJaSdxfkhoLwEILymLZmrtESVAOiDxmFCE",
		@"XAgPXfIivTXOd": @"JsQLSuDCeBzniWXMliOLikrszwDDHybrjtsOZkcXIdeuBZeojAXcisdJyWWvaqZuhTtynVeoEZwFgEsCtJIqeDSUwwojsrLkNMgUeJjSOGuYKwvmfrBatfnXVUoUUcOzUoExMERqW",
		@"UjtPjYIVvDv": @"KkQDeQGSelJQyyyUgbIZJQyOWThVoycUYStJBENxYQpDlWbCTnxpwREYSnYFuFvPAlkgYFRuiaQHROFLFqVxefHblvriXIylPSRleVrAtvRGiRnfQtOklJhRMEflQcEAlkVAs",
		@"iaavUMaEuvQEe": @"NQScDwpMiBqrzNshYdVEGreVkvTcaJmCLFkmxSbGfrQSrgHhfQYXRvjmgMFgJTSICAoXAUZynOYLlvRQXEccrsvygzYhMPbcPJanWqKAxnMZwkZgOQOQJPRThKFkGudwbcecYUDoumQPbETvrpqJb",
		@"jqFoLimLSC": @"ZNefFcCGHAyISXhnHEZoBvOLUDAaiCABpcODgeSvvmJuaMbzhedGacoGzbdqmRhGJkpvYiRZJcyzCUxuWYbFSNHCzoKWFKpNxgcapWrvmQofnpVdJoDSqDeWXGAnTFlHfSCmxImQKjwJMFP",
		@"gQtYFewhXtMuLbhqk": @"ehVQgBYNtFqXXwQiwLKEWrsWuJYmQNWEEayxhsSORVBloWqZEpVhiaLtHdyKkXrCxkOwnNFVMeuwEwKOYatWvMjAZUWkqxjVhgfyzBIQYalWt",
		@"KnBYtOHoMEVyQqTewqO": @"SkfzYtZgLsWAFmlLNohlSstloJBUPkRFSoGLchLWcKAeLqanhHUruuSFjvisWuMLwsmPxKxCkOMAgODskVkasKxroUWZkBachCHfYkOMyrsiPDwtdFnQJkTAhrplPzwVTNE",
		@"UnKqoOvVhConmpXcyyS": @"QWxZYTScGZJJyJvPqsldojnQJvSLIHDWIZRSCKtwpqXwHgnUdhHfZcArXswGWnRvUqtObBBGlyWrrnZhtZGXzLflhxyXEpEAoFJwETQf",
		@"VJTEcvjLzrGhAhvfukC": @"GXBNOGHaYpzLdhRrFiVIBRNyGMUZHJfWmNhxnunBHIBfDXHwMCWGcOaIPSZVPBOtrilCjanGRrhwacqhatmXohABGyJSljZflKAavYPlnp",
		@"fghFuMHxSdlUqv": @"TWYVaeTijlyHTtLyzivKeplLgFrYAGEMrJeXIeRVTEChCNJwdEdQXjeSFiMwLawpwNXlRtKhRhnyWrzSAUwOzhqOSBRzEdTTyQAg",
		@"TjaAbQNIDnHynNRQ": @"mqgYapllPpngahNNOunliMOaLezQyXmRjdeYJNeymhzmLzDTDmNrdSNGyFiGrohlfrcLBapDPVnkbVbvdkLmimXGfXktsnLSRFTr",
	};
	return AGYtRQKdiNP;
}

- (nonnull NSData *)gDGKluorDGFcob :(nonnull NSData *)LmWSUzzffFys {
	NSData *aijhDAqdFeWRpMm = [@"oMTPhSomTgjnHPtRafdmZudSalIMPJyDBHqLftkeQovQBecKQAgweKFEuqWgMGBiCLQVwNXCNwnOHEcOOwNMHrnohqdkpfGAlFrhEvsbtcZyjZkiY" dataUsingEncoding:NSUTF8StringEncoding];
	return aijhDAqdFeWRpMm;
}

+ (nonnull NSString *)yGxwAFXMacDtK :(nonnull NSArray *)ooHokIEmuounFXNj {
	NSString *GeIDKqeAYXZaMF = @"BfKaiSneHcKmNpNhoAhySbflVbHTEjHtfOgUywKmIkGrPYDDeXVZruJtrASyIOQCcEoAOZnISPyhPFhejzUCWKoGAnFmewVgGYtWwxTUQZXO";
	return GeIDKqeAYXZaMF;
}

+ (nonnull UIImage *)OcjeTYCmtVuX :(nonnull UIImage *)nbmyaMLncAYObikC :(nonnull NSDictionary *)RePbBkTcrqfd {
	NSData *TazlIByrgt = [@"BraZzzHgPkpZwEpcgdcAQUkTGDgRGKRFoTOpuldtMtKNAkTiDlObANcmzZzrwAcroTrvZpTJRHaDopRgRmfSvOJlfHAPPmpAWyaAuRIBbqPgDsuqLEKCOVJLm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ESNDruHkDBqMTse = [UIImage imageWithData:TazlIByrgt];
	ESNDruHkDBqMTse = [UIImage imageNamed:@"CTlkfLqhnBlxzzAhmzVSwdINpGjjPbXRngFZkswPjnetqTedonaLpUIzlmJXQxoReAJBsqmLMjDMEnLkGXHPjIfYATalfMZzPhhECzIeVKwtyJL"];
	return ESNDruHkDBqMTse;
}

- (nonnull NSArray *)cTralVvZIFIPcMxXaT :(nonnull NSData *)KkNxqMDzvIlEHjgFfFQ :(nonnull NSData *)nxeydocvRCKxg :(nonnull UIImage *)rsTpTxrWNXlpTa {
	NSArray *lcamZrfjuxGTWysGOhd = @[
		@"iAIEdrtuUshdsrDtgaLOeFhZtinFjRcSbvkxcFfVvfbKqBbrxDFQyrgEztBRgxphVHuELjKyLCWCNJmBPFPuNMgjXGaHtmoaxhyMgZzjlggTcdIwGuDRq",
		@"MtqadSUfrPzklnPzjhcKIewsfZQcmSoKYoICjJWvjHTvFiLcWWuwMJtSNJzEINQjeuzQwaFNGuNFURXNWrBqUvorcLFwZmQBfdfEhvTExgEZUPcMULROOQoxsUaqZJqMGoMfxNfvYDTBqpe",
		@"LUSSGMkbOKkIMMIcQzGMPgHnWEDUSRojlQVNfyDjIWzoUZlSHlOVwEcleeCNxEsUBvvLIwKpdtvDdXhWwgTySIoUkOZQjEkThhfJ",
		@"WpbZOnuUYPEaWJiRLlhLytlfShvJihRppKVmmeLzBZvKslICHAnHPngSCiEfYgHFKXPKVUJlCBcaXXtrszqNuTUgnYLhkSAaoSkSVyWHJaBqQdfkQIDAiXjuhzYlyYdftHsrfbYrrRhc",
		@"sjCUBQuDEQVPkoQrwbsUQTSRmMETKZwkglHmXLxhSmTsDHObFHTPACrnnLUCsMdqiYDrkrcvwBYLkKdUFTiWEAlPVuYwTPlgMooqlQVefdEiOEJ",
		@"SsuWoTKsHQjYjUqpIhCQyIsZgoUZNxbQbxyYiZSEayiBgABDnXVETTWSJGYCQshWtPFPbiJclatTvyZLuGwJxWIoqIhcOuPgVbyTjvDCzuKYbwM",
		@"YqGhcgHiVjMIZYVTOaBDFxBoEoxWaViSlteGFWBdOMNJIdIXzUKMQGwwIVGTiNeEXCliAyHdsuSCErjuqxpFKBEobvFHVZMNAtok",
		@"HfIUNyTlCCRGIjnkSrhHvfDgEXjjQtZMjEWudvdQxhVXuhkvtcZOrZFVdpeoUHPokLyzGKuuSQpAZPIDPjhEUaWQZhJcOjGYUHRlUSzMEgtocgxvdAIiyBBpPcKXPmWHpnZKrRmhXHF",
		@"PiSOcSdtmibsFvmvegGsRCplXxixlriojcVJsGsuMtHZddpXLqfUIkLMLHrpWxiTiuzZfuroZXRZrZXiETOKNOgqmAesumIgHnWMjuWtTOvAax",
		@"FYCWNINnnJKGGrSotwsGblppGfJOrXCLRthjkJIOAAwPOuGTvEvOuNLPMQmKqPUHzeTSlOUIVuDmNELGHKhbzmLmWvqLuOqsGrqYaOAscgYEtAEocwNhNOFcPHSKvmVfeLdXUTAFVkwbagaoZ",
		@"IrcIgrBBDmKfaUtgvbbgtmyCtSXLLGFMsfodAhHonMSGSSDmxOOexJOghsSzitiDXiDTujnsfhWqJABYnkWGtMLdFFWdMVANyLYVRHf",
		@"cHBOqxihalZRsKDIwOVjrdfsVohBxxsrwiKGYTcGHbaTXBYwWmuqACVzGNojrvpOwGbFQcTNWnhnoNRTvaPnPhooeeWdUNCUapRHocqMPhLnhkNaNforixoOUfUAIpBqRGErxD",
		@"jFaqehGYFEukNpdgwKCesbMqYSybWFMkdQvoLfHqnUUiJzCUXdoErXKdGmhKKBUyVNZblxJzZThVwtjVoKTHitkkssLfgKgMUYfvRICYlKLshhCGqwFcRlIXmUTCHxmrbk",
		@"DyYlfWUQRRWWYognwiTBlDTLvyhdNzkwONKycAcJwZxMynbaxuilupbuPWXOzQAiIxtfcGsTmsMKRpRKvDlpCVtojrfhbgkOwffCKSjKncvYSOTSClDJNyeqXOSIDoQS",
		@"qvnmrFjsfKRhDpnkMNEgWBvPdWvUAirQloqVxTrBOWdRNPBqNrGEtHZFHdinNIDWjyOPFEvoJBlwRRvXhreRlsdaRdtRvplfrRTPraYzxrDslCjTjgNMZZFuxBFdIyIblYvDYiCGWvjFLI",
		@"hHsbCLTIBeOArakebuziDDjpktLueTZURvEtILPqShwpUEtPSFydBfEvjyUwNGeGwGrWVPiQgRZEPjbzdBerbqbzjvyZGXDonfdFdUgsKelkCm",
		@"FmihzDbmlrxXvWnYuVETOnRJupoyKHKrdLesobjcjCmOhdJRXPOyGOOHYXTSrgOvoQNYYNFGjCLyjGmVFElyEJLghibtuhPLUbgMSWPenNHbzMrjdyqGdEJpdcLJKZHHlIhWrmqH",
		@"ZoNBeKMEORUpcbuVqyWDsXRPucJlOxbBPALhQcKcKlJKVFEUwGgzzLKBUlnSDwBPJGApsASCCTiVYAmkEmeNJizRKnVueZDPQLtjKlHTPQQYLVdhNxilszLRH",
	];
	return lcamZrfjuxGTWysGOhd;
}

+ (nonnull NSData *)NbWpLkDUMx :(nonnull NSArray *)CCzSbFZEnTxpn :(nonnull NSDictionary *)udqiJyFltaIihijYgn {
	NSData *eqDESkiVjmR = [@"fWgJNtheDtPyhoBFvlNNcESbcauLfJlBlEGSVbRcjLGzuiDKqPAAaCAYBowNYrzdiAVJXXljSPbQdikegTKufjONoJSoKnzrGlhjRVtNPmcCGDvIXwCeaVpdTcsdhlyTjNyQJAiMMjDvQUj" dataUsingEncoding:NSUTF8StringEncoding];
	return eqDESkiVjmR;
}

+ (nonnull NSString *)OzMHoiIfuOxHd :(nonnull NSString *)LeKtrSWwxQEVlNiM {
	NSString *pDVactcHIftSElAd = @"nhnmdKaofwwZByCdJdPDcvOPSZctrRNSjjfaayIgvzLSHgDrArHIPrYSGacmnXGyYuAUbQmdjhHxsxveGbGrgNXkLBlNcJcuvQYjMvnClPtgGvPlZCAosPwceoInzaGTNNeVWxidsjVOiuDyWDsgu";
	return pDVactcHIftSElAd;
}

+ (nonnull NSArray *)JpfHNCEpZD :(nonnull NSData *)wrZhBmhSvzRSB :(nonnull NSString *)qmhuJruZiQKG {
	NSArray *pYBhvmiuXkNqXvNeUVH = @[
		@"iPDLZvrvNzXtCQQsDJelvbQJGnfLbbUVXgTHphHmxxfzLlvQZwFEEvxDODreRZOMBFjfkICpRgblMwzzuGCuyozKHFnemPhDJFMVMco",
		@"CtAkaReDAnzVTzsNFkPEXWavfJqtoKTzwNzGYcJmUuxXJtOokYajlgoHpXSKulJYicUQjjXPEWAJhWWmHnjjTmRWDufcwbndWXIbUelnBcRFP",
		@"kJHfBySvzLUucWgVAZswvwRbEXHmCdibLvGmlWocxUhbXxwKtAWLugPCsjotAzPSvkBMkOkKPoRgYIDXJsXqfUNtPhArZsrStcsUOEDPeSFyQnAqOIwEVaDVPFlZDVcnSShNmQHhhOKNqIP",
		@"hGWSKXBqQeUobqCUsNyWxrfwCmstSXfIzPIcvtLfdjWpbKGgqDSyvoKrdjWaKPeRiXSgsZWeDJTZDSuxqGDwMHnAYeuNLCEhjEztkUzRMDuBeReQiajAGooQxmqHHgFtGkgGhwxpr",
		@"OwdrimTanEICCfUtoQWSWjNxLUOvNXNChiyjEVuOOVgvfqFyvdSxjGNXENOtLmgLaWTXxCFYgYNovxcfROjOrlLwsGXZZawyyxad",
		@"WmIgzBcuKPLtWmEapAPevKdmeRXNbkSMiZDfOeNsKHTbVQXrbBKCLzYhYYoQaTGdFECXDSAzvHNwzAUhbjDNCCcgGaGJbMHWrgrYwLQVLjYTwdwG",
		@"HVNnCkfySpQjkItXvgLylWvwyEFaPckSvvelIniaZfNoPMJzjPTFFpKjSiFRsRuoWFnDDwpDwZqheLfqvlbGFonAkLuCWbOwySYEIupeOtorhzTdKtUbPMNToWsdrZPDZnBeTKMLCiwOrkS",
		@"WMmdNCKnALKdJYzbHKJfWYDPnjwEGiMhirMstrSsFJXIzJaTQryQjYhnXlRWxTJWUWusyfYRwArAKCZXSJXHcUJCdhccnmJAQtPXwKtU",
		@"YBAZLtZXwYbDgNwjXZZPZeTsxXaTFLEVmPptSUhYRtdGbpmproiXcmZQpyWUvFfwdmHvxklSCLnXmHfVaumIOzntvKAndcftingTufgNXpdSIF",
		@"oYCzSDkXfrvPaVqMgzTWXNSieiLvsazVtmFxzduECtkrhsXwYElnaiTkDyYUFOaBVWbnSimNUFXIwqrWsGkfXalZnXVvZQNGfIHJcsmUjKATmdirB",
		@"BrEhknQONYCMHrJfjRIsVTBShOBKreueLmGxzjPVsgWiwhLeROONIWnZJFySJwiXktDeUxjMmzfVkXWUcTLVckesGiJEYvQzlOWTbHezVnkGebHPeMjoeZWltC",
		@"qTOcMbpkOsYDIhavfopBiSyqWlIQybHrBEyJyBMvsIEoqePcURKINPqYHdvrBGsRcBuPGiAChyYskBjORBXnVBjILfODBVlqZDrMZRxmhUSpOl",
		@"LzTOSipONzBJCWIgRabefVfTmVTPYudQFpZXCLPLCjYijjGCocFJnKEnAtWgqhuORZmAyPKZuYISONvLNmZRiGxuFVXMIlGPUDsdrtQUVNat",
		@"arzRiIllVskNrqwbPplOqruJJuOsEDlbHlFYLfkNWOYeJGVEAdQTfPtLjUDtAbKfYjqQjAtFZECAjAOOnSLFczrSvjGAJGRXdCrDRorHmAJldggbqILTJGmYRRlcwzAgvcbmgcQCUKZvNDHqqH",
		@"bEQzVpQCQSVLOMdHHrfuKrbOUzTRAPYjCUAkpDLIHMhYQYtMKlEEBbgBfyrCQrwEgtgfwOjngmDhZIdQGUBAPbShYfcOSBQRQSGybKGxHtCryJCWCOQLvuN",
		@"evLdALtEGEgbdaCJXdeQHrXllEvZAkSzpCwDhuNflWJVcMlTYLdEsVBdPwLiOTbhvIJGHgwFcxTRuEZItbtvjtUBjLAedtqSwzOEPDokJoDkk",
	];
	return pYBhvmiuXkNqXvNeUVH;
}

+ (nonnull UIImage *)MxezpnLhiRZpwinXSZF :(nonnull UIImage *)ezuVucavHdv :(nonnull NSArray *)psaEViZhXymvoYqBFZ {
	NSData *YHxKtlXFKot = [@"jyEeZQevLQQDXOAWbcEBtXOMUxTlraIBsxmiXdRDKVjRZHHvwPvwmckbxmKKjqAJNbgZcWVqXbVobJvhrdhzGPdkgPRaZsoaGgzombrIFRCQWrpsbZWsfBirdBSATGMEMVfCNPNj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bWuimgArGJc = [UIImage imageWithData:YHxKtlXFKot];
	bWuimgArGJc = [UIImage imageNamed:@"zexwpEhNIshYnPnqONuLGVywrfpPKSHaFxzTZuGKqiOutbuTktFaXqJajelPwOqyUrYswFSgjAyOZSjBRARsVbtdlKCOxfzsmAOlbreEyVwFHFIIY"];
	return bWuimgArGJc;
}

- (nonnull NSData *)srIazsKAAEITnhZ :(nonnull NSArray *)nkUFzmVLKvHY {
	NSData *XucVDfNvlCdFz = [@"BWjjAoiVnkZpCTGjOSxzXERHtkvBmmYWDSoltNGTmDZhQeSeNSNPGuNCDArlzNkpHkPdYmgFrHWsTDabcIrvNufeRvBSUkIvBMnHQyaMIgdoNxUagAMiItadimzBHTfybtw" dataUsingEncoding:NSUTF8StringEncoding];
	return XucVDfNvlCdFz;
}

+ (nonnull NSData *)JmfmXgeEHqaVXMljbzQ :(nonnull NSDictionary *)WeAEYCfrdpcw {
	NSData *GdlXppGlsUCEvBpMEO = [@"vhmDAcNVxDgmUOWCodzIqJlwETXPCoaOHyLtlqHDEvJNhQwGYaQnTItERYCIZEkcVfXpeaBoxSgohjRgIjvVEzvYYbPVMMvtlsBjrGrBrqovxxBlTggCIhFuvtzWvS" dataUsingEncoding:NSUTF8StringEncoding];
	return GdlXppGlsUCEvBpMEO;
}

+ (nonnull UIImage *)ZVJzVNqFkwFwxRKaIK :(nonnull NSDictionary *)jOijinpLrcUEfp {
	NSData *GYvhIxXmiOtdyPl = [@"tsYLvUVNWVGFIrZRysjptXpWwIKTdUVNwfOHcUjalwVwrAQKcpYdZamRutLEJsVSIAqrVQaNXAuixzASAymKsWnUWRPxsomUXhNwsalJnsMLSWAhAnhBqVAAHfkZQlSmTNKQhHitlSjKsNeGmuq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oRqlVWqFQnytJS = [UIImage imageWithData:GYvhIxXmiOtdyPl];
	oRqlVWqFQnytJS = [UIImage imageNamed:@"qOWWnQkZelruOpuasgPzwqqQiuxbAvvQuEIjzZkCteQfATHnbupZAPpNeqShcGvzdypiRyMoIcWRvioxpEuEvGaqPuWdqrcyJrHdPUNhESfqAcWArcfwVCySJUg"];
	return oRqlVWqFQnytJS;
}

- (nonnull NSString *)FNdUwZqazJplm :(nonnull NSData *)MgBwLGuuKRkolXxzffu {
	NSString *uuyOdCvpEENnyXbKcU = @"jTiNEglkwPMajYKIjgISbCmYWEpCfmoUzppcHKvyEVltkRHTnugdoAndMvSAclWEOUZSiZZoRGMJPqtMDXFxAfKZBJaOdQhKWOjLHFFBLezuGpiK";
	return uuyOdCvpEENnyXbKcU;
}

+ (nonnull NSData *)JDXTqtNocu :(nonnull UIImage *)bnUpuGKVecPFjAw :(nonnull NSArray *)IIlZqEAPiAuhX {
	NSData *DeIRdtcQOav = [@"DUnqYDgHVQXnNZEQaMlxchBCnMbBWdGwtIQLZWKGPjdrYVIkRQWSBkCjzgMWqvOMrvNitjlKtarbNUzFpIkMlBpdEptDJAJYyXKejmTgAbDR" dataUsingEncoding:NSUTF8StringEncoding];
	return DeIRdtcQOav;
}

- (nonnull UIImage *)ncZyKZXYoiQY :(nonnull NSData *)ZhQLbfOaiYt :(nonnull UIImage *)FGNjYjZEQDRXb :(nonnull UIImage *)RauCNnKyMHnwV {
	NSData *GchgtbEAuZAUlrwk = [@"YscXzqtWPUlGSIeaHaUDYxWmtcCPOnBjXPmmhCjcSflwPXWgsbTzfhOrxEPBOinWRsJFVUSdAMlaxqJwibdHXFCsChJgxPWIswvtIngJNjeoGXlmFwPhf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dYXlsoyuVfdhG = [UIImage imageWithData:GchgtbEAuZAUlrwk];
	dYXlsoyuVfdhG = [UIImage imageNamed:@"AtTwnwKWyPouCYEZWEleAivqkjQozQNILjZWgwdlLtJSBBhGnakvCaiHrgiFvqLYiinKcsNdhbENOeWzONdxrHABlLwjXuSoGxpfEXMDUXqbhXAJGkUjVQbRzbfEesNvMyVinIRPe"];
	return dYXlsoyuVfdhG;
}

+ (nonnull NSString *)fOMkfWClYwclrSua :(nonnull UIImage *)TgExZxbqIguLZ {
	NSString *KokCeUmtNnDICIbG = @"uHbtcSgSUhCJHFTRmmgBbUJyNmGhrZmtNRxLMkjHHFzYuLiAcrkEufMmniXaMZBIWXSCLlmssEbofgQQUbcsOKIMJpPeNYvIVnXaHyiagoOBYNzGLdmYySqximddfSZmKsqdPqOaNDH";
	return KokCeUmtNnDICIbG;
}

- (nonnull NSArray *)YKHMWZUxrgwFCjz :(nonnull NSString *)moLZUHmvxgEzJeAz :(nonnull UIImage *)doPEOMBsdj :(nonnull NSDictionary *)xifmAlsNDyqQ {
	NSArray *ZStshHiFmehrejW = @[
		@"BOpArNHtPvunyWJTWGvgPfsABslOQRfhbtUIczPTlJDhAgTAGnfPtfGbjFjKlwyMhegpUuMcJVgvCOItxwbuLUsEQBIxMGSeaftVqOch",
		@"MQHUBnVUuYqamwcmFdkakghJAyAJiuvrAvuzLCfSlCxpvUklDElfcYjIiphjOuGcFwFOqDQrmdZJylwWUodxfqQSofHzFgPfzCGreHTVbQzwLqrtwxtmMcnkbGwSjeVsLjIkfwUieKqOVrARgLnA",
		@"SNUcrKQDTDHvPIIVdbIsoEFWnFlsupGhaeZDqOORyjSLpXiwwYGKRYpRnxmoUcGPafwkTbAdJmdfpIRljeRVFxGISuZHcuIDIrwBUddOILCGgEUTmpiPxT",
		@"elTfWcLSjSKEurxqzCjVDWuzYWpkFALMIJZTctrymgutNDiKIVMSqdpDOUHwHfWiUzChxXXkRNonbYTSuDkhseMoUAhHeEmDMFRbpmzwSkGIQVsmKlfSFMDFW",
		@"nxxJYfiisPRwVjZDoJndgjTAkleFiJmADDPZKMNmmbIkTGHrsQvTtvVfPcuVZrSXjgPhnVidSByKshLswmzRRLXgCpdaxZfcaQFeUQDadTtpPyvxtKDEsWrBlkoBKykMhENNLgdrfsZD",
		@"sXhiqKIWoSGWatpQyrRFoxmVgwDTjOrDTpELhIOswtBijchMYwrGSHtBwtbFSJCKBUemxrxHMVBTeGTQWclMqPIObOsIrDHvJpCwUw",
		@"tThgQrVlJfcYXMQrrQDBamTHjikTSVOGaOTlnnsLNSqwCKDKaAKsYGgQHOeGqyZeEFOALugnIQxEoJegKWAPAxhRqyrlQhkNEuwLMBstSFvAtnnTFsMoyemszxEPxxdnWZRmatFka",
		@"GLSRaKXPstwbruAWZDfLSXNXZHkvLiStybkOCWHnUNZqZtPcSNEqEBpTvCCPjzSbZgDOEtXUvgIfIZUrxFGXffDXlJTbaMcvcDAmGYwyGWPIezWw",
		@"NSdUVWjlhetiXjzQWnrnNrpxBYOfIwqLaAAOGPUMdsBoEqqsRCGPWNVmzWDlaIdycKRaGMJLVcPjBKXfeuwxLulCruiOENTqTrKmRTrXIcCIrgGjwlU",
		@"ZWBqfNQKnNlsaFYbxtKqhZwxQWJkcRMWeXzNvsZtqQgjfmlOrHkmelNWvThPrcMLBjjiKdqPMWUEZGsVWuusJrhHBkIEcCykDTwfppARg",
		@"XYRkFXXMkZNUTPpGaoRdouWMjDOLcMAZbTONxSbMVCSdlecTcnIEhPBKLRkfkvSBGnbuEQetBYYqwypLaSHAIaVTlJdaBWmyMpsdGfQzHNVtZLaQGWMnpPRqPjfyjFkpqbJDLKEBifhLdsq",
		@"zquHIGNCDyCQXpSKVBwDrdZPHLKCgMCmUQoWFunavpJoCbCdoZHggerZBIOGQRNmfUhXIEumxVfBsISBWgrTlctKbqriTZcEQrWQMwRAmirtLLlguTtoxgsgfyZcyFcapDKVfsqyeBQOZqD",
		@"imnNAfWxeVuOQNWXWDlvaFboHfEsIIFAiDTbYHyQisxdLViwfrMDPHscTyCjguBHfkXyrdMbxraNbpxjxsDKltOjmPscQTOhPeVJLEnUox",
		@"ZpsNdlOszECRpjzKUbKmcJJMuJqndrxXJWZZjvknGBLGZStblKkIYZpasuDzAbgUGHCcvSUTCrFBWhViwptKImnXNxTPMpSQOpiescKUMjrZz",
	];
	return ZStshHiFmehrejW;
}

- (nonnull NSData *)EarIHxjUYPKnWLAOt :(nonnull NSData *)fiLSvTyPaPiiIae {
	NSData *ZwUOgfoITAdeFHeg = [@"ZdvNHrrGswQFBhXfOjgEFbCKsVNIHXsdJXgndhJMcwguFPykfowGaVJpRoyzhOKtMUhwmOuSrMMhuqNLTODTFCbnDItiOePKLArIUyGaklTTIwfJvqygKMtWtPaJ" dataUsingEncoding:NSUTF8StringEncoding];
	return ZwUOgfoITAdeFHeg;
}

+ (nonnull NSDictionary *)huUkDIuyrajb :(nonnull UIImage *)AZQJDThkFWWuTdOFnkA :(nonnull NSString *)EZJXsgXMWhBQpJ :(nonnull NSString *)lHJfKDWWBNFYCMq {
	NSDictionary *jFZfHKqIZdlPIqqkG = @{
		@"aTlksjPEOwjYkeTvkVi": @"zmiESDtMqrZbSxDWYRSLgLWfEffGokFwhJGkVZDdtynIAysTgHavVsDdoBWxNnzeIEhGwXfnQeufCRnKOyjEmetLfLXRhgpbAJZNgFDyymJpgtcddHkzXbtCnFWDAMRO",
		@"MxFhWoSnuUNdoBIj": @"triirpFFyaxWCakLVgPKpWlNMIbRbYVgkgjjsZAmmbhMIIJJFtVmFThmMfiIMnqxRRlMSMMhgfYTGWUYerOPhcXtxlaQYZYoErMhENROLDvefYRkP",
		@"RlCkadYFiGkzbXcf": @"dvNqhWoOCeCmahnQViaPIMUOoBnaYLVejYxBxzWXvopmoAkoyKqKbVrfAExjClnbNhOlVeOYnzmUHHENdVokCDjJsptiMHqUxitfElejZmhpozUF",
		@"wBTrCRAkUgWWvzojNb": @"PlctNRLiamnBmUmutDveIxxsKWCHvMhxRaFQwldbcmqIEgLLtBupNZGZpFTinKwbyUcNxfuWXciyefwXyRiOuSqXEOtgQjSorJHAcCUjwedvxrtkCoVkOOkJrlPHIrRPWsdHEJcHHNfwiSxdXFSU",
		@"YqoEgZxRADwkwB": @"vaGcwIYLwFHPIaPwMXTpDXRTlWEXppPWISpkzGYcIAMzAUwpSXfzjoYlFaGLolHkXjrJEgCcCGnERTXVuJYnTlOnODawDBxxGQDgprGklYrBRSbSajNPEj",
		@"FthRyHWYHp": @"cJjnXszyxNIyoCeEJWUxzRMjmXPdiSyEIdkflghieWuSNPTfGWpCAbLXocWaSnooHiCVLjKHGSghMQjsvJsDxhOFraQvPldvtahcRKiwqtmFFSOvZd",
		@"UnlYpZvwUb": @"nzaDboXudlfVffYzykYOmmUKuPhnLrWCXABbloZYzBffKBcAmWQXLsgrzjrwlpRHaTylGvjCjgwomOThgJeHObIIwvbbomXWYZqKZqLrxmjknE",
		@"INJOTGNCcVYQO": @"QvcAvRfNiQIfsLWfSzeLqGIFueeaGuAFbNdDuxPqAbXYdjOTxDLDOdeHfpsBtlyrUnyEfAIXCIaVrrqPiFujsyHECyBGoSXlgllqdNkpLuKshUCJZMTkbTSBk",
		@"kzkKsTeFjMMd": @"RvWbvFutJHnMYlyOvPihgsvINnzdtcLyxCWQcLoYicpOveElWwfFVLQoVGRBgvMYdoFaTObvSHcCYRSEiYOxgxvgtNlOMGGbcMKYippSqFywWNNbn",
		@"MvZhjwzdtJrBXfM": @"yAezlYWAlTNzzNeVAVfdiWrHUiVUApqkalHqpWjfkfvLrvXEaYZcLpMVnSDCgoNNKRViqQxKxhCeuSwBRYrJIrzboFWaHsHDCSOtSgDKZEfHbgr",
		@"sUOduJpWpdhKasuIA": @"weVMUchtlQUchojYAUWfxLoleKeWLRtkwTkEaPWqyQhkpfbqCwqAgVxRjSdyyyCvHPaayGARCZHxbdDDvPYQpTVyKymhqIfVKYYhVHNwnzCzzecLiqIPY",
		@"IgaqgrPBYtDBiSv": @"PPJsfvlzNMDfhFYoXfMWJgUIXhlZUrYRNfBPozaqLCBYIYPPbZVlCJGZoekuYwGaBmbkrNFFVqAunkPBMuXjkkKWzmaWWwUOtHYvrIXiHTOkFaSFKKlNUPgdoGWkExnhifKajSbaDarV",
		@"LaSBhLJAVrYoYdT": @"sCXpaLqCNnBWaMXtfkWtbyvKjjpsjmtQKqKQfHUqwlmtHogkBzeRNpJsDjmIynFiPXGDpFdNWjcBRrlUuGQFAqbaKwbXflKXWjfTswDdN",
		@"SBQpLmgaTSYiTaUV": @"SNrkiHjfPsOITByKNOMeYMpsQRckCGMzNBAeIvFrGzYOtVBZuLRSdsokysGfhYmuFNJnmtnZgJZkTyCtlkphliXUQwYMAevSdycxizPttDXHDzTJIfzuCxWCq",
		@"ZplTLgAujAYZoBawE": @"vWoxTYNqZUtEePyqCYjfXdlNoPhtxgQZCffyetpgJUCeYwnVSVFEDQfkQoCPqGlFQciSIEEvvYWGbZhiGiHzLeGnXSXGusgddEKFeTOKnnekwoQYiDlphkmUYQURcbhnaSMFjXBclfei",
	};
	return jFZfHKqIZdlPIqqkG;
}

- (nonnull NSArray *)aCyDoAzITtKoPYAM :(nonnull NSDictionary *)IlewLnTMgbmQLWtnXgQ :(nonnull NSDictionary *)AOZxQECoHC {
	NSArray *bPGpPVdPVisCgMsTL = @[
		@"WWpkSukGKBliuWqCdbJdFmctXFruddsdXytwgXdtYPDMKYhVFUyeKXdJyrsjteFrOWhslZVxjMHlwWFdqZOXMyyfayDQXYYJOVyzfFXFUPIdEBLsAMyVOVvVVgeWXtgVeKqIsOLPqmsuLw",
		@"pvCMFgOekrtVBHbvqWMlMNpGxawOKLkKILGpzXpVTyszEfwGsxcvNAuoSYkprgJarPTckrlwwcxpaqOPQrLTBUvkiFwOpDcfuDatCmmXMkknntFSQZHRdcncayIeNTJnxPXBBGrQw",
		@"mDuogwxASxQpObeMeDQYvUqhAmPmSxJgpQvorYXIqjBaNsPVrLXyIcoNUsmdleoHmaRTCNaCJIjQjjHipvXHbVAPOdBGjEsslWWtjguc",
		@"wjAGZRQFneWkwWYhxceMqPDTvQgYkDkBSKuXlZEZggQipcezeodjGOlxSWMXmwuAOXSnriLVEZdzAFJrvTNAuLsgcpBhsLeRTXjPDUMphJDIcqXsG",
		@"zjfpjKLIkyJYAmklEWnheANNCytMzdIpKnEIxxUdffoztviScWGIdsFhTsiArjxnrMmJEeRlvfEDqZVLcWvsfdnvQgGJURoIZjHPrcqnLJJiKYvsUXKwqVDXYhnKkywwMKNshTuFBcvkKWMS",
		@"IjPoIJLgpljUNLBrQBfdasRfTzSxALwgiJlFEzEKUJesCZOesZTLgJwKzLHnONHeIaBulSjIcsPfaMkvZmcdyHWAVMNAMLDbeHeNDQmBexqXWLBDTLoxmuxtnxsmFZNPDSGn",
		@"mAMsBfxqbcEzncivEvKPxBGbjiuftoMZnRyhrMupPajNQxPKSfrKwaYGYIWnPPYusVwxqpOPayAirkStUqOUTpAHzmXElcJGOzWOpixMjYGuyJSlWHgl",
		@"moFokuVTYWKgwxxrocWeLYqHZMxVyxSvwKPXAGevqSSTXROAEhZvNajWsPQTpPgIfthngobsWaDiqWeFNmVLSQQxyaUcCXjfFcPVSztGSVPIGpvXZhihxfNdojXkaOl",
		@"CisycfYxQejEjjgXsmVVHnZcElBkCNXxSgqiXASdgvLnPzflKofoixzTZuqIiwGjwsggcSnTJsyQlkfijpvmWplVRGvARaMkBexJMsbKQAEDrNwrVIgQ",
		@"BmcxOLjZFKMRnBJrnMKdtHJjHblpFIfEDJsZrMjVBNakboxqroDmPzjpoZuzOKlHEMSzIvLIaEfHeUWCkPwllCHvcMVeiQQRjHKzIOrdsvoKwpwijyRQ",
		@"hsuxSbGFqqjaHyfIcprnswwvObEWpCLPieRxekLUGrlvkfwqkRTkDRtLRSQmorYbgjzGZlojNxtePEYNEILWOptkEjreVEkltPDQfdknYgRYChpIiMxPyXZhmcICASwAvifToPz",
		@"LjRqFKvOeFBOwXPmfaBuOdRcMCFZGXrGRFgcNgvXsBbXbuLvTeQACXLpgtnlIkRVqLoAdLwDHTuvuJUqBVHYwwVpGkwcXkHCyPuVogmrtomcGXbAqCpTGLPljqsteCv",
		@"RixXSgpjUSrbMZENWKXbMwbknCeYHEjYTKeMRAdfSZthNgSyxUNrnGPTEyDfvzUJnFTvzwlLDAeTorIruSpGXGkjiYljSDxWwZEKnYvTCbSefdwinRRvyyzFrSmzYAnvZdHHLAYRUU",
		@"BRwCLarJmNTnCbtQboqZXLvVtlzGpcJpllVDbRcaXhasvxIavJlHoVTMQSZqPNBYGpfcOcPxxvYsdRrxWSsIuWlRJVENfgdgDlTfcPxHTgXZmNIHhCgX",
		@"mzpthXywbIUbHympPKReaUPWmvgpPusEwAZESNFEkwYQflFqhwvYvNPskOdJMeZneAZIBPdREehmMPgnpfjcLiQXwEZWujifoHYWqKGgKqLmpOSzWQHsFmbFkXGWcBHkebWFLBZZ",
		@"rpDdRRiLvbEMgFYZqTwCmAnZdYssaxbZIibSgZQkJAdQCLAgccrttaltdtIwEpiEFkJPifNwplQGToSQqolEaicQrffdwbpeZUAAcYtkixLRy",
		@"nOzspyOnuBkgnxRpzQyCJHCvsWEixVSRlFRHeFTAAcWNXySamfjYnAScXtCWSuwJGRXjSXmtJVMUuVucbfrdXdcaNSFchWaeUTKYmZ",
		@"MOaamBGckZTMJxDRjJnygKcBeOWmKJnOLjghTrkzYSZIxnsJcMzKYzLBJUHOxZZGxgqjAWQGIrNmfmYcOfyUgfTGQpsHQGGBaXayTsCHvSXPwEtJqIispiircWJG",
	];
	return bPGpPVdPVisCgMsTL;
}

- (nonnull NSData *)yOCxwwdlubVTOr :(nonnull NSArray *)tqFEfqTsvhbmWApOeat {
	NSData *fNSLgjefXjAPMa = [@"awBbXMiYMtsrzhgylhjtkbyyzKPKcOlekkIuBvcppJNakklKtISPNswLycDklQsbfPiVhETeHLqNaGnkHwvzODyNKHfpMmGIJKtTpWCupCICPEjggIf" dataUsingEncoding:NSUTF8StringEncoding];
	return fNSLgjefXjAPMa;
}

+ (nonnull NSData *)ELitHicLFsDOXd :(nonnull NSArray *)GqTMQnIbctECHgrOJC :(nonnull UIImage *)pOZNbWxlKCJbBrkASBD {
	NSData *ukvWWmbYthVFgGelJZY = [@"VkBrzsuvStFnrlFQkmTZsQdlaPXSfnmUbbwlZMnWpxqwPIOnJonKQBOCLkpRsEvJsOYVQmmDpvAGEXJLGfsMlFaexIkIxzpfyWUyScAMhcbijxqQgoAjZqjswVRvBGnZXVWzLUjziVVVxNhRdv" dataUsingEncoding:NSUTF8StringEncoding];
	return ukvWWmbYthVFgGelJZY;
}

- (nonnull NSDictionary *)tvaigIqpOccr :(nonnull NSDictionary *)XhYQZjuDseK {
	NSDictionary *TMkRflSTAVMQnoP = @{
		@"LlFvMfNEGAQ": @"tfukdrfjtldtGteCjQQNSXjFqFewnMjsPjEDunLxnHWCIeXiIBkJOknKCDjAHGjjDkPoJVfnCwmoyKydlaTZchTGdHcpDlkMQnzAhAizTpuESNvNEqwsmNCAZyipGVN",
		@"JMrVBPymZS": @"RcaQJkFfQsbSlhdOVceCxNqAlSFJImiDVzVsvXOqJrDqPLmkrqdvgQLxaFuyWiYbSAUpdHUiWfdNdSOofhZIZpQggIwZInHFgtqtwkEYOIPXjwDD",
		@"jGUxqjUYYnK": @"AGVyMbfHeMOEyumIDZQVKpuWnBJAlKIRwsxPfagmtKPyrhZLwZCalWWzdeWiKMtOjHdHRAkoHXJnjwUkVrznBbLRoDDChwCQiEWnQarTHtSAPZIhguYSLLPdsGFFgAUZfwkrN",
		@"cUZMYTqDwTaCIlMp": @"xuZYqqNWKHOunGQRfwTPfhTZhbvhojLCRlbfTsUEwEzkKDTrKWzDmzUPZoHRGGgoDOPKKPMFjqLqgdFiBYfAAPheSLEejAHtxWelrrsURbjAFMEcWmgpoJdQPABjHHkReZAgdRyzBrMj",
		@"wyJXsAcrnL": @"HiuURKLvJLJnSAYiNStiuEvSUzxeYwaybwbzzFaDyzwHicMLdFLAadyJFeLcGYymTxrojydsKTTckrFlHCVigiVpXuXorEFGSyvSeBseGdjzOiEULrqiAjKWPtAtcprWANIOMyErLrWUtzq",
		@"xvOxmGrblqyr": @"wwmpluzACGhGlGJRNPtJVTKaEPNhcPoLOgjqHvZhIHsGYHiEjxYyPnaASQEzFOsyiTcgcFvHXtIPKBHXygXzDULZQQXcMrpTfzFUSJMOPSOqRaEXnIHKpOdOUuUAYQJEDYWcqwAyZ",
		@"jQFZaqpspNl": @"wPyyVChxLmOJfsXdagKlJdcBQZVARQbDbAfvxdONPSTTSvWwvIOjlaIdixCOFezFPEQSabUkHGGONsNdaiZELsAmCGrIYhrdTfSluNMLFVTHVCbXwaAOZpAwgszYJYtNsxjbJaQFuxCdkQSH",
		@"aqmejqBbdy": @"zgMmeanPXQVhnkqOibQBsBcWEujSnwzINtyzuwFRTLWAxwNlaiGhiYglXpYmuBMfOqjIPYmQDDXDFVgouHZyeAqDKwtBiacEqQpuFzHFXrJHecfvXscplIlCXZPwKthICFn",
		@"tiArBVpQYbIYOvGJB": @"FHSCULDKwTusSHlXCUrUZEbdtTJLbnzcInAxPNRSbzfZtjKyIjBRvfweyYdVYxwAKkZCNXrLMVeFcQjiHtrxWxWLivysADOXnAEXEKifRQVEvXpxlSSwlBRlfaCticHESCJNiVjC",
		@"AnYaRvjOVqd": @"CSwORyXJkzYOBxoeuAJYdlrjKVkqgWoXDPeiEEjTXVsfYhvVdONGjMMXXGdtzQMMsHxdTWngRZJXrroSCQKYHBQQlbieKIyuEuEsUuOtYZF",
		@"rETRHgOiAr": @"RRnWkcIKlkDSnraqMCDmAKQRyNQgtkqTCDzMaRiXHIralHiWvHnKQHNBCiQMtEKlFPlMKbTPDvsUIyCpBnPEIMpROtpbujWjuWSRMCUfUhanZe",
		@"qNyamNWGHbyBX": @"eoddZZrWBTCjilmFHYVlMCatUJPWrobRtfJBxDWMgsjPdMRXvtKHRiNPkQvmxpaGSuYqYtBsoitcTonwBdcjjSGVjTMatBLiXzrNrhrEuWhDxgIHrOoSjXFfCMRGsS",
		@"nOXvNhiLgdQeemJiv": @"wDAyaKiCBsxJTlMwsckddpnOqBntpUPwKTJPCsNsKqxjAkyeiEfBLeJSsmXHjcfLvSRRbWGFpypZvDCSckJDwmifXivfOOnMzsLFPEYjbpMJjpNNgUAodntaoBgArN",
		@"ZYpLQpfhIvRhsgZfh": @"pWKqhGpEbcougOmNeoqyElWvHWbBdzBYWrjBcdAbPZBeVrPOZYdSfxiPcSKjfjolACBnvZTsRVOGkgcqGqhePlgnLdrtTzFwbZEaMPHpFPWXqHlGxIvTaBVtjfiwXZBdNOMLMvmsAjySTo",
		@"BpOFgiahjnsWfkCAb": @"ILYsKTkcWcmIODXiAfFgDHPAXPzQBySbvmlnqhdvCTqMhOzRRPlRnkLZaJebwGJnXhTyPnuhYAtDaoiRqUTamHAkJMOJzHlIIPKSmlRhNVsbMaWFWVeZNPmb",
		@"BrWopJeGRAUof": @"ptzpQEIDOEpnJLmzxTjvImJkHSaSggUHzEUFbMgZSlssyyqmhXxUtWUPraQwcCejmaAyHjFStDeYMqvzgicYyJSreZvpvyQcBVFMyjHDRWuXlpqqmflcSJaMwxWJcLjA",
		@"nGvpocZMPpZcyr": @"GVbTcUepINuNjlRAjcUVstKRcGTjxRTriCThJPFemdrzMDJlWfcFyTSZEepoGJNgtQpXyCtsbdOaelFxeSOIdkAvVQbrIaviufUwmrxHXqGsrJrpHTA",
	};
	return TMkRflSTAVMQnoP;
}

+ (nonnull UIImage *)rPgWkYkPDAhHtXxtazp :(nonnull NSData *)MAiGWphvCgQclpSh :(nonnull NSDictionary *)ALDvvaKsczgGmYXbKQZ :(nonnull NSDictionary *)ClUVTTjIZAsgC {
	NSData *cYgORhYJAK = [@"eGpzSvfhCNDzmVFzZGQYryAIPosCOWHpdNfSwjhhMqKIflFcHZAIQHgRAmxeKciwlUmdbdEFRKbdqXUTKxAzzvBhiLWABnLzfoAWIjNCrB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *edjhbSBMzZOC = [UIImage imageWithData:cYgORhYJAK];
	edjhbSBMzZOC = [UIImage imageNamed:@"CqvUayTMscoWXxwNgzQoWmNHnonsSQVQeAiTFhatemJTTIxZcjUWhndmQGhNqhInJqWwXXpdaCAsQXFHKWDxPJeIbbsBPDtYyJgbcKPlqJXsSNpdxgAzUVXXUHqqXS"];
	return edjhbSBMzZOC;
}

- (nonnull NSDictionary *)LwmyUYKEZKE :(nonnull NSDictionary *)QAiTylBqxNEh :(nonnull NSData *)pDEzVLmsuLEFilY :(nonnull UIImage *)rcfECTNvTq {
	NSDictionary *npREFMIPWU = @{
		@"QuDiaBRaqofza": @"HcodzaUWVcUkCyNORnjmJBEkvJcgjKOtZraFZRyYbqGkKPyOQxSIxgtZwBCNNVfEAYDtVSmQTXlbKqHAhkWlEwaxWRSyxopwcqeALPDUSEc",
		@"SbSYBneaaJnIzV": @"QmrNXAkYERZyeDMsEWtiNzysVpJjeQEoUbInzIAOjcZaKZaDBGQBFGjSJszWIszYjZGrOkyCGzBlIDlZLAeDNhdoUmHkwxWctHdnVKDpiaooRKilS",
		@"jtUaxYDBncAvCjYPt": @"DypbkchfEyjUtSubTCRaPwzhxpRLaSaRKKZHtGoRhtviiREhvAUapVccEmxymiHIbYIoEWPkSTOrsFlPnKZleZTHyFeYZTUKASoquHXPpZoQkbKjiMz",
		@"XjJKSyvpLlqzgFQCsa": @"FbTSneLtZOlaiSaiUIqXKaNwKsMqACKsDDXqmeOyOtMzaTERMWEQPijZzRgJipUfDnXAptCgCRqvOzSySXYbVzSlJLQDuPrHSUJaOlivcDnlTseQ",
		@"tYtgioloyXZdMAJObZS": @"HVggJFKbijcLqLfmELMYnELXsJyaSYOAkNmrdNfgwRqUHiKnzmEwvEWLqKqwQIgWUkMVznlUgHtRccfprkKOcBzOixHcuSEwiYTneHMSPLRXPXFKWPQqYphfgZZOMsJKVafmbuKeDXDFPAhytD",
		@"ttaQgRSmvG": @"PNkUFvzsdlFXZGyVjQYjXfEqCdODBTewcnJZGGvaGnBzDHKZeTeLxomwZIXsESgSORXsNfwSKrXgrrLvEVXwGhfLBytXVKPppMcMgS",
		@"XAxrXqRyuWYQEdKuzAA": @"HWIoelGIXpNdwmrLsvyioQXIJPNSpIRGPVSLFQvbvaGGzxiDXsUQQtlkNhkhEkkbncZIKEujrcCrTUBXYtGDvigxnQTrMyJecUPxLrqqvzAAB",
		@"KLxsityxCp": @"oAERjAmPtryOSrOWRVHRpYDinmhMRtKYqqnYiUwaTjpijmKzyQBNIlZLQbKSMRZNcDfyYwjGjvGRjeXDaUruHfgJwxVIpgcgpfTiwLNijtaxRQluLKKeUcGuSduCJtVTWRyFDdptSbAeRfw",
		@"OsEiQobFOvw": @"nOqHSkculynEoUcnDHSFpStoJWiKQHDxOgOauAydYUAsCPezJVXNjSNBcbMoDeMFxFIMNCcxDKezWRWDBQgdbAYyWOuzRXfaZgKkUQehjpwTDXzEkceGuLEMRrURldNfHpqRTG",
		@"ipdbCnydkMoGXmqyJz": @"zrYNBIsHKnipkmWwYjrAptwhLMSSPhgBfnAvdRHkZXKIkOTdJoeugLuohmcAyVVTlxeTstOPzEVRbjZZHezmQcJckRUAUJYyzlpQkLyccoOKygwkVijloxxrtaURueRcEvtBzAoBCuCfjrI",
		@"FqRRNGEzajPOG": @"ZBRIqdkmeuBYnmMIFfWECytUDbRIPVgfzUzXgxekdxjhDuofdcVQkFLRKVnSZWlLxNOoUZxKOsnoElpqKaXRlCfpwaMOxlvEAlzdTGDNgfeITeiDNuxjkoiHYTkIjspYaNKzjTXePM",
		@"futGWzKutkdnOYSK": @"XNNEkCAoRZCUyNMtQeZZbbQDmSDkivGsuqWuGsdFTkqgcXwSnoZRPIMDIMcgAcZmTaKECnCkWwqCTYgjNvlVoeNlHcUjZWnLpTyWksMyGlIOugJaSUlChkPRcfwSWzSWPtFgeBZbNPcoYiYHcQpz",
		@"bFSjkGwdQOygZBZkqDq": @"cQutFgMBOGOKbaVHQkWeuJptcBslvBoNQTbfTIrsKqVegbdvQTnDNCTFRpKqoYEJjyUQZtFPOELZBwMIOcfZPkzqWASuvuAUUBaAAsQSuibIySWoXMMoDmhkFjvLXfrxzxqBx",
		@"HlgUZLuRVWCxHxXXWu": @"EYrzkYgFiEjXnMgvySqWquxWCUjyQFAeBowRzeMRLeyQObTGERWnCEwRoaqVxSCKQtoZqIVauavVkCkzUXriJvxZIvUbpkkmcZBPJywgqoOaDOfnedTGwjrgkQCZEBm",
		@"EjCKkFmprCbK": @"zUxsRaitjasVbJGiukLpIqpWXNqnRDbYwkBTMoNncxlsjsoLWbQmqGGioFaiSEhpEooNGtIYPCuZAPazOVHOgcELuBECUbAYGOkWvfuKMMdyVeXXTzEjpvdFIAZROFb",
		@"UhiPsSbWeZXTk": @"XQaVwHRPwPeqOpePgIRolVGVVJPqqQgDLbMPzCCiYuWjsSVATsTOpPJzOEKWdmswzBPhJWfNAIDrrYbyuBrpcKdAsSpBdPITvODaF",
		@"IEfWeKtjkzzHWz": @"RLBRawatEtTJDbUZjFoOhbHNRSLWMWbfIPCGzipZIohwPlTBVQpeSmKRVxgKMlbloRJqQGaQRXqaRoMSPMDOlQSarmzvbirQYsgMVGAmzuWszAQhDjfAq",
		@"SCSgfpEUyzMQPvLOd": @"hEHbQsnRjtWzUqfEfMAzPTYURcRXVTPAtPABWPydGbPRjjdsClGSgqJRnFGqfbzduPudRiHyEeXmXhoDWfPZvGPxFfzEuHCjrjWeRErglsLwiJhDWtLvMdnjUCRTJQcQIsTTaUZwXM",
		@"BjBhIzXlizGEl": @"tlnTBbmKMtjTVfnVsTXBUrYZLHcrhkPufHRzUrEZwRyGXlFetdbGGBHmAFyGPGnRtheYZhtnJwOcGjtAzTCQApyORgaEmEiUiYrXvODnUjSjuqGVOkLyMDTwiOLiyVWldZPKeGKYRbJqceYwhL",
	};
	return npREFMIPWU;
}

+ (nonnull NSArray *)bcNMpqaGtiR :(nonnull NSData *)UHfSIukolhIDstiJTLg {
	NSArray *zMokMKHqRikf = @[
		@"XczWPGcrDdJltECTTZBcPbZSmnkWqZZeBJokPEuAdQyshxdMghQTpdnDCchFRcmPyrduVddaxRifgSTNuByTErHktVvIusPNcVGWaXXmPFrbch",
		@"NZDYKoMfvGgXLOZJlWNCKiQoGNlFZsaanogGAddUdNojbYmfcIKNXxrMSOUWBcRcsKqeUmCNYbyNsiiPQJFJnEKGEqpZVNgNEHBdXqiirQANqcJXhQjGtdCZgelQYpoIkFfNvqZqMARBgJXaBmpRM",
		@"VXOsvCOGPjGlXzRXhwUIufhssBuLxsiUtHdkxKMerSmeNSXWcBcxWtgBAMRJTVIhKJzCxOHxaGAttNNpoIXEtjbZGWrpxLdLllqDwBwbYG",
		@"rTUvsQgXKYlhqVaiQpEbhJixAqodZKHdEvuOJCmFAHvChEHzjmLjQqhreIcNAKiErXkfosPvWssSccemqNNpRdgJrhSyNwCoOhhjbshRQyMIwqzRU",
		@"rndhlkgnNdzdHWQFjMjEvSOtDQbjspcUrCrEGzfWaPQWPgZXWSueLWvSoAinKXJgAcQKkqtAaqMnDNdnwuUgqyfssCPPrxWivwOpzxnNJesTVVaJEQPbvsexOQTqStkmEwTCNKqKcjAUTYdzvjJos",
		@"JewVSNvlvtwVHuHzhhgiheaLqYCrLulpuWZQmthaNeHLwAJlVhEigxGnuxTCeGYOItpGEZCfuUkYQngagkOEZJwGGVLcdKzVmMoiLntgMifVsFKcREXhxYXwFPPauxnFZLvPC",
		@"hYkReKUDqCoXseSdomriBtMDYlCEpGwBYBrWPHUikilHzcgsMJOekAFonlAEdvrneQGWJZzSAVnzBHMCgbtnfbFvDCizAEPczrsXhemloiiDjWtbNIujpsMpKcIZLpKuLqbESPpv",
		@"QIChKIRKQBllYPaSTNdnbaFriQwNjXNGpHHdBcmZfabIUBFBSJVblRIFPUwDKsZKcJppadYIxyNFVMoIEQVidzuOIUbRAglaafnbCVzjtSUOpxAtcFijSKhmAHxzkNnS",
		@"buHgsnQgiwvbIuaUlhlNTdUrTVFNbrXascfpAGgSnmGMigPiebQfQkuyugEIeqgyjHJKdQWzLtmJNFxHlszRYvRHBUgDGmYSfyDcvMvCRyZvybufSEorBCwToTNIHEtWQwEKfDLhGyxas",
		@"VaDFoVkMEutoQpBJBCsqRHummXiSFWqngZTRKQZqvczgTjHLFAPdPvULZauPElvmzYREhyOTrfpkXCTKNCCcHmLufaHDWheIHYVukGnAzitvSkdtSrCabjAhzroeA",
		@"BDxUkstNuthEllRgZRCisyFlXNMHaVOalRnRVScZXyFANvXmMyYLYYDisYrmDlDflDoEzlOYGTdsosuxdOOxnmwKpnWUSLkfmFQNKbxAGkRQrlYfqTeiQYzhYYYVkroGn",
		@"uZnZLjGWYCCiPecevUoGsfLtovjYFbwCgJTfRzsIuuVTWFZZAsPHPVxjeyNQakGoIxayeZzlTpalnCyGkfgpOrwVBZUxzdfXSzcTYUuVHvSfFUYrXCwtaUwYFGUE",
		@"WEALkQAiCVILrSnYeMNVOVvVMPxfOLnENPTtQJtDXNzOgwmTgeaTRCoNoeMVSdIaxRHkpZaykiZoJulaiJCRcdESbPllvjdMMKDTkRSwWeaZNqyVnqDbmsGDBvLchiFXLmXMbgtmbEX",
		@"oxuQwqRDJDAHXLaAYTWcrXzLrWPkeotqhAhGiABqQNnOngMndpGAGszBdqUmQZKrvHwtFXTTrWHzksRcwHDjqUowSKmcqeumoCFXlRJBpAdVPhKfunmeGZqn",
		@"GELTxEdfQyROierkkfkuTpvdXoDWlwwMIPajhJmxpCqRyARQaCplwWYrTUplyThdYwjsvlikcBOkXvNGEgatfSTglyZzVEwYYAmJdIlinSSDkRyHBmEgQeSaO",
		@"KasxXCLsicmnicIWTfHcsMXZhcATImkUTiIEiQwsSpHURjiNLBJXOlKzXXOtgINMNfkcxwBimSuWEJuaXASVzrOMGzMlnAkwXcaEsVBbLPEWldWFHhpiAv",
		@"GcmirDQWNaPYJgtqXQalbFaSPiWdsoeKZYyFqBBJMafEsKdutnSsEymXGtWmlIdCDRUmcBRiQFvmGjiqllqqOgdYAbDDrFWkEmwwpPvVyJutAhBGEgOTCAVvoaZnBqZvBjTPGqcTSQEtKTWD",
	];
	return zMokMKHqRikf;
}

+ (nonnull NSString *)tNrmBplSBtapozRVNjP :(nonnull NSArray *)zakCuHScLGd :(nonnull NSArray *)bsfnPOMcQNEV :(nonnull UIImage *)McissBJyxIxomDBL {
	NSString *vtSbPjnHXoRwZuInuD = @"lpUnrAaPmEjbjFbvlqYxVQASTocFXddOzQLMWMtbLaDNMhwHMDTctDoXLStWgEwFGJRZyItutmPixLCAjGtlfNjMhGfOXssEbqoBwWdwSg";
	return vtSbPjnHXoRwZuInuD;
}

- (nonnull NSArray *)merRMnneMhfv :(nonnull NSArray *)VZSzfZersk {
	NSArray *cPBqxgQoYZZnQD = @[
		@"woOHwNbKGyoAHVkAiJwiaJQcZrJjFrBANACsTEfwAqqmnWCxduKNJqSGsSqJrrOWLpWllPVIoxRzcEKFroerPBbhGooNlYpneHynGVvnDKgQwXqFimsv",
		@"yUTMGvhicQDhmNtshAuATmFHViGDjkadqaNxvzAbcVReMVZbtcFnnEkCJaBNRGQXKCfGcbyrZygADTGYJjRDnIsJsTUqMqlXkLBJjGMoqreEesFltKbEmXnlcqpntmauuSgmkrV",
		@"IdrgjPfoltZTkYVsxuxlXlziLrOsnpgUzIKzlqRterdNMbyCokWbjRsphOVPWpEFCgVJisxkoSFUbECDbpfdYmuhEObCqbbhnbmNDb",
		@"oitcKsIdNvFlUsxViGNvrFUYYvKwPhModBkIvtzQUbGepaoaAHqzSupSUUxqIOiqdxexWwfxKCCjehrLkkItwecXPrAxSAYfHKKBeaHanNAcPuodPuiRMojxnbAXV",
		@"mSzzzQiSZxTDWHRJpIWXzIMGFBNFvkxdGOIkHMYxIguzdKfhKDOkIpdMydtHmhJEIFGuNoqFnCIecjyLRXYtHnlzJtAaQoGMfWzy",
		@"xXINhqYHPlqBvQkJHmvdabSFUSDGrlYnkZOnkpDSzPFkXZbUTJgqjjcaadooFrrJSJbbQRwsYliNzbZQzjYBPcmCEzRJUDMcNUVhVxnQyzaUBfnZmazMwMji",
		@"wlJcngxDvTNaKEFIuNdFmsipyonFAxDarGFbXauoIWTodyXraLtnzSlmiPeKoEyBHnitbeBkMIMDgweNWZpTtfrQQsDdPgUlNvfqVTKyOGYSXiMNjIGKLqpjTLnWEBQdZBAnTEUg",
		@"QxfVYhAkVAReLKCpVpmBcBzUZhGiByRYbAwCnFIpVszMqUPDTpHTYmDWxavHHZCQRWCVotfSEXmCTWRkObGCayYzpcFbzVVpHebuLGPvkupQsKHfFDPdylzDYNjMoerupavtzmjjGoWjX",
		@"CqDipYXEQvbLdzKTKFnXPuDQHwEIEaPFbhMQtqtjRCcSWvZPgAGqEAVcKmfACmsAtXYLADzTHlgWrLvXCAjfHnJjTaabdTbcqmfn",
		@"PfyYuEbbAoSHUNqvSyCLqNsfygvYRCtbIUmJTyPmnmbmKttUWUAAlbqbWOGtAEnkKdTpDSSiEgKcynTENKVAbluEuVMwndVeVTwwsGjzscFqzBSHMXXVJS",
		@"BjJmbXibXaVYAfFcczwQfwsutUXAmlZaQoMtcFJLdOsQRssfKVmuFazJNHNhAAPFdfrKYVpJqNfCzgBHKSmFVSdJWAdOQVwUIveqQTDrXmjYDlbJUnKQGmFDTzaVIDKPqm",
		@"kaAGwHAYRFVkVHiHLCNhzzVqxSCHrgkwJOxTxGiJNceJiLDuBdIBQyLctvXTiQeRVEVLyWIludMfMeMbQKgBULJOKSNzIECyQpIVKJuUbLBkReReFQoYpolmxantOzjDlZJmneMujoMdpyRDl",
		@"nKyVXqrCqDewqPbSBcRVXybshYtFAhkoFQogUnbpbuMTvzlvnslBQZrWXbmtNuyaiXhkRpwSDNEhPjsvONZUACVpkpyqeybKbbNRaJxgNyOxXlphdLvnQSUMSpADzEkTNB",
		@"pBstqEeNijCicDsXKMCILjvGCdKyleIbpohFUMhPcEKMYxcshIbioTBbNbXCSLdvFfVImuNMvyWoBLLoEwHLxGfmCicKWhumPNcprmywKylTkYATsPmvnJeUEZWzQuBJppbcguITLUMhjwSlfy",
		@"NCgzBjfApZBuODuTxnqFfHpIBqGpYmnGulVEOvLnQouBYyIscrlNUsgTtcffZrXhGGNPafmfuRUccfactJLTuJhmWGxZRFIqSkKYUsPqXoZW",
		@"yaVblfCxmAXKvKTcuwnBRzLRquyCEHPNpeRqPwZrMVgioRoOQUPvzXIMWBbzwDQPkQFoFLYsJxJCJvMkpqojnLGajbjMINTziacKyauySnHWPF",
		@"PPgBEyYRBvxYxzTCqFsWrESrfqUzeeupqKqqFTiMBpdkZenMFJaMALIbwRhJiotHpmmOasfVTpGcbxNRgYjYPJZAgaMCpKYuIDBTvrCRDUsJLJVfyufqPclAWITQXfedr",
	];
	return cPBqxgQoYZZnQD;
}

+ (nonnull NSArray *)kTpMFBNffmWMND :(nonnull NSDictionary *)krsTHsQtST :(nonnull NSString *)sitOGgBzcgCXSw {
	NSArray *qjhkypHOFNAonKc = @[
		@"dTPcbsdCTyxWzVUiPuLgoSJrElEGjsdHLtTSGIVuRUCajreLZkTZVuAaIqmXTiqvApLQMToFLoiPSDNgQPfODPLxUzlVUaJcvDDUPdQJHsUFOSvxDLykAnmOeXLMFOiQBLSIh",
		@"xTRueZDuuKRvCBYSNqzLqizRgKsjapAIkrBbpBtxluLPHcfpUzqwJpHKurbnkEemYqCqbXsdazJwaYYUhoWozjIxKxGKsvxZFETgSpy",
		@"bqPEEfrpbqqNwfwyptHUubkvqSuhrQsGAzOmeknJAVKGqbbtAFbKiUOoGOAmJivvRgIWjbJxygMMFYpaGrNoiLCanHYAQlgokaZGaKOQXqfijpNsCLqQvjQTsZ",
		@"JqJjkfskBclAJyPCijDazmXALsyELZhjTQZtbgyMpwmCCQqmJrHArpnJCEHwBwcFrDGfAxybhRjtgORliwRnwGrqYcYuAlQOZDRYirRTaNxauWSjiOgbKQODwHebUbpckuAunLySQncyT",
		@"AdypUmJcJROziwidzEhPEivDNRIQAWhZZfvfdfFCnjzsfKstEUVJxXSyBTnfFqykKgPFwIVeoOTAiMQPsBQMacqYTEWdzponuQxxQChwzojxUzhBgirmIcRASHBlLLiwfYGBcPQRtwaneIMi",
		@"gwtuEuUWmsNLmgHHOSPIGIrZMylWtcemeNclmRIkHJcEddSDotBWtgfobrPhhVXERPfNXDtQEZxOlGYfYWQQhGhJgzSudDNHJsgJRYSNbVwuTBPZoYZRMhHVuOvgGOCUZrgyPJIePbTGRwrYn",
		@"RUwRsrjxfvAPZVZVfVDRjuRuRDqUkJDBUiHzbXPahajUfNTlXpHJlTmeTqRDylhmIfWmfSYRvqDxZdCQdOHaAkoGWdrfccSwAjdrOiiZKQvX",
		@"dEkFnMHMkPWzFfRKlMJImqIUyQFIYQUlthNcaNuCTwAQQTCwLtXEuXnDhaVdyKEjejypXjRCCIgrkjmPYUEDwJIHmwAZUQBMYOPsmfDDxXtdH",
		@"acKpiYZXfmarJetYYZArKWIWCAVklKNpvqVUyjJuhIZUbnGFYtMvtKqzfYQrxzlOFKXuFzfrGdwoHLbvWPUQKZiBCSieSObiAZmjJULQxxhPdVFYLXUdGRXeciTLddTDByGoQQKzfZMmGwSxK",
		@"SGFCNZviRKTbFrDEEHswJlvppOmeaNrbWYUMWkTTmpzqLjTXzCkDqtSVQlWeObyBjleLKKxFjcjfSlNvQIULdvgRqgFvCZLMZeEsjccpnshxnUFqpUxsMWlZnFPkTqb",
		@"drNeAlQeJamlYIyDTbrhcTKrSSXYVnOVgGknKKikJDyJenLCoBbYOMXCMFyHUmoUkCBNdTFsDCpjzBxDunjjqGPxIqASMrtIzsqKnOutBSPDgddNanvoaZPUn",
		@"ubiZOyZkgEkzdJeIBtNMlixBAGYQAjOLduxsaOTAavwVUkIMBWksxKodEIQGArXGfGSNAgtMORhOzKmExHSUvlvZmXFkDwcHfUwmpxCFyjraOgffChxrWrlvlNRXFXObLOvRGQlCAkj",
		@"CxPtfXPzxzgCTPTrIgQRVehIRjYuCEUHhdrGSdSFfgRJLPRbmLIjikcgxsFrcEJjwSWuyGbXMymisTMdkuIHcBHoXrPfxkhWlIWGYDBGzDfT",
		@"phZqiahnveviwXZUBKniFIVvHIdWNKhkEJIIpqlbuvfPFjSibeFTaOBagxEGdyQqYMoWXIYktYaLpfMIHobFsUzMJsVPeiVyjrGuzxyKaVRRdZVgcjpVPQUEuEYCJPzNzY",
	];
	return qjhkypHOFNAonKc;
}

+ (nonnull UIImage *)hUIRFLRYehwbmo :(nonnull NSArray *)XpsAnksDWZqpcd :(nonnull NSString *)oGRNBxRulHkG :(nonnull NSDictionary *)heFwtaitHzLgBrG {
	NSData *YOllcSFuPX = [@"zQPNYCbTghGnwWsoVqpIficeqWkKTvBCvTEANtHUwAPvjgwCTWhRdbCCGfOpnDgTwYZUPwsHlUNztJBCfjkpCWcIEaVNCxBsdUkswLplHOOpjbFfDNteKxMglTBanKzia" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QNpdRwHscRbknUCua = [UIImage imageWithData:YOllcSFuPX];
	QNpdRwHscRbknUCua = [UIImage imageNamed:@"yUAPQxmnBznvjQbMZFsXEoiHlMuHkAimZpmKlVkfQRXKjNviRqmroWGJunPhroDRFmeqGYmaFPNSmPzFjpfUxfTZWfqEBoMuAXHCytAINuB"];
	return QNpdRwHscRbknUCua;
}

- (nonnull UIImage *)fPswAUnphNMFVOx :(nonnull UIImage *)nSROnkginutLJXG :(nonnull NSDictionary *)owLWVSkIPN :(nonnull NSString *)VLhTPAFsWHYiJgQhQk {
	NSData *gYMmMnGplquJdZgroa = [@"bsmouEgFHGpcNYUGjAMCsOtxZuHneodlZUuWsgVZkMNfTJKvswrVUCzDpbxuFyZnAdcSGCYNhgnhkeaRlqfCvaTkfmWlcTjGFQbdYnFkmzUFavCXOPoZnvKeoUVaCYqBhB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dUynHOzlrzvSpIfdyFq = [UIImage imageWithData:gYMmMnGplquJdZgroa];
	dUynHOzlrzvSpIfdyFq = [UIImage imageNamed:@"tKEVJkuajWbxqdYCAJXnhkkpFELwwCJwZppukWEROkTWHMhxBIeBAecwCDdFdctYVfibKhqoizUYZaRnUSwbiTiZspPnzTlZKWmaJkcjkcZLCNiINpUuXNPIPOLgehdlAGSwdhoiwPl"];
	return dUynHOzlrzvSpIfdyFq;
}

- (nonnull UIImage *)IaJCWdycFOuiQWJp :(nonnull UIImage *)cszRgcQDhMV :(nonnull NSArray *)EPEktHSKFtDER {
	NSData *ZpAEtfnajAJhrgQ = [@"tSnmdARqtaJFmHxPXvbPohltXFjtYEcMnNWVQoRUaRVFUuOefmaGATKDIXomOlIPUvdtLBuWPbtVTnMiEKnLIZtIlyxEdUFfzEwlmpOmnFcefLytKN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UvdCHvqDEMsIzWSEr = [UIImage imageWithData:ZpAEtfnajAJhrgQ];
	UvdCHvqDEMsIzWSEr = [UIImage imageNamed:@"yWHBfyeowuzCVtFCrjYHUEIjasCTCmrsMUOAgkqyGLSqTjCPYENAxcwXamnyhtWgwgcgEwxadTyifHMZvNoqVaoHkogpdiClDgkQnfLlRfDifnsgMLDOcaZRDHazmEUlsXPgWCyoMrTamActuXb"];
	return UvdCHvqDEMsIzWSEr;
}

+ (nonnull NSDictionary *)hwYmAdjWJGQdqXLgqjb :(nonnull NSString *)AZFmTkGsKPRVnaPQ :(nonnull NSArray *)lhpvrppVfiLLixzBBQ {
	NSDictionary *dWQNfYXVtbrEhXI = @{
		@"DUqYWbAEbnVpWxLbPK": @"pJvNcIwRRZrfZafnuyIQOPLvJXNIHlkEyGpWTeZivQEkhcbLrlvJbeFwSLifzMQOxAjwvOOJkLWBZmyeniMRJhXxxfZlTFVpqgufAojZl",
		@"rjxKkdnrqzy": @"gZCxlrdRMJvFlSZJCLkufZOwYpkiThJAdIQwDxYXQBiPdJtUbNsIZcgAPZtCYNbsKklbDRYGlMWFUWwTNhcFtqclNWodNZbGUqAztmxrMNnaHwNiOkbduNtEmruzETcVKOjFRZC",
		@"QrESglrDnYgOgFNsPCX": @"UjRxhsfoJSsodhSwXirTxsbsDyOJOUZJhzwkJrMfVGVQPjnzzmgaOPYGefZWoLoQouqNKkQyLfiEvvnQxVOvyZGmtQdYnjkejUZEbBzZSJbbQHPrD",
		@"shFLuNgMWUWcds": @"FzkgTAmxTgkTGdNtHHOsdnUhWzOYPysgiQXUqNLwVJnexSfrzEnYbdkXMHhRZneQgHHzdLcbAZDzihZvfFGCzsOCEQflANizCdHslPuqqXOxVCKfKdxAWJj",
		@"bZILLXvTXCtAiRFgh": @"sXomsdOZrpxUaWKEeDQHKSHqCMlEzcnySEirQUUrirrWtQHxYMeLJvuQcddiRBEdhGJMdLXsDKqDMBpHmySEyKUxoqGwtwMGsHPvaDaREknZXQFzSAkPxHkSWIHcbUYqGghQTT",
		@"cJXtfXDGhtBkZDT": @"McQoEDQFXiRuQmPWWVugGnlRBgRhAQRYZSUGLVOdyOiZzAAlKyfRqPmyJtpqNIglPiBLflyKDxlHAaVdMVQtkNNoQpIMKQUsvivEFZgGreNJgIDOlnalDWCkEUQBgKLIZCBnHxPufdKCX",
		@"iHGWTeaAfsFGddEKDR": @"LbqNvkRJIdZbsnJfLuIxuSRzRTClnYiqOottjNTEOCtMHxYfjtQBLEPFawOhWqYSnDoJdqmDPerzJmRCJKXbrWVufBpbvoMJobUdqfzgOFJdGrUggvexUzZnM",
		@"EPogExdvwvqmuR": @"UGqWKvcCntWVFhgiMIqRekjCLkfdEHlmPZCMAVdFuAViNZwgParkYVomPiXalEoozyBKLQtIoGcRuUzggZuhzydrQFHySndETabuJqHyHxIDCjMChkMhfEsLHxc",
		@"jzpcoTUsgFHApTSBMg": @"EydeBtRDVPJQQhJzmbghsELTJRAzXKuyUnqgIKPGYDjnypaDgicKpJwrNVHjyjYHwEovxCkxbzHElOFxpsoGKHrwuBpNdXnhCKtVLPRzTYwPcVi",
		@"bODLYLSKkEEHDRnr": @"xyYtjWjfJkewcQVEKFkmcVIMgVwUMoxVIIddgYrKUybAkldVlENbMKfWgEklZYEQGQxNUCePgYTYmFMmBUEBsBqcmaLKwBuZtBYRvDiiaQVVUzPlOdtEDPwxQZcNorzLlOHyxfsS",
		@"LCmXvWASzq": @"IFLxMItFRPXPldXzzpIqbgzsVIlYbnDYvGbtikaPIRyfcrhSxMjFQqtXasCesIlOeRkQSTaFGgPKDQgvWVAuxRAUldNDOcBXPuivWBnufWaBXDysqLodJdMmrLsrZviahjSTIcfBXNEhuXUV",
	};
	return dWQNfYXVtbrEhXI;
}

+ (nonnull NSArray *)yZloDBdKpKK :(nonnull NSData *)mDeRrfUlGoWMB {
	NSArray *XUPDRzhlad = @[
		@"SBZpBxnoDvCFeHPbqTuNXerlAWIswOpvRLiHlGjmuoLRMJWoaPSgZuyIqeexAMeECyYTArXAYMFbsRYhyKZBHzEabkEzkIgTNxPyqCdRZIuIMRoCeSGA",
		@"PQXnICEcSxsylVxhZvTiLSPNEXrIKIGpcrmoELXHmsBXSqBxyGXxJyWJNrKBuLsGKzewXxOJCyPMVyuunKgTJpfqaqzNpSAoTLDbTDoaDmmteqI",
		@"EsObHcRhvrVWbdfDTlFqhwWXRunGVtbxRNZUPYXOvVWVmnQKvOypCPbqTRIOxHhNWPoxBDiTvqchVnHCvTusfcpyxEFUhllqXMePCiRYed",
		@"ZGIYRElKYkHnuxCBLQCsckreZqOyKpfPfPlxObSqNjlcznocXZgnWWzeIRxCbxbfoGLeAEPsFWQBUaYKjiXOWZWHWEdIoLzbISFiyuHEOgoTtdtDeiorJJlT",
		@"mlZnbjtGcDPkNGxILfPPJQTnogZVLwmYOZjQJLchQEMmSvlxBpKNycroAiQoVFRKrQVUnMwNRhoEkikkdyjhYgBdygoITDouPbgxgPjMGicvWYBZjhuWlWydwKjrDnoLfXinJWEsFWEf",
		@"DYZkEnfqIzibFrmPQRzngugSMJWEGQLQXFJPRTJyshEuEvqnFtqkYvarYYugSzKGmHHUFRHvDemsLdtbyXWtFauBEpPETxAFngTWP",
		@"SJDIuFBMNgbCSLTDPizaXQkAxHsUQrHTYIcupcnAKFSsaisHfjmCRbsdWzNvVsszDGbqvVELgUUnymbEORWkeuAPtrpCqbcCcKclIwIxVCFGQRehA",
		@"xjwUoWqZFOtpQyXNDKoPRrcOswDjdejSeeRRKfNKPKCwVndTyNfsBqVnexPokWtyyCkNiuvJjLaNZAjHDoibjxENXXwdwUMPqfDeDcgiWXAmJN",
		@"WsRhJqrQbECHAYYTwqoLpCDFyDnsIMLlpLploVMutntYkadKEwnahxVlFAVDfcrpRhZFGNzXlLuCFXxtNxFGUJzKFRwjJJOICtijFVslSsGLjPPIoLlVPTLNziEIXU",
		@"HGAtQoGmWlRNvYWwjnkVxIjnZjyKeWOucdoOBaCOYKQELSFBbFffLYRYxMgTUACfTLRcOZGvofoUIsRurNXijGVfraNyngPAGbZRwtLRpSugxrStbxwwTybJghgRwvVHNgUhKEVPWlzovzNwCDp",
		@"LxhRDKrOCJsijoJzyMxwGJgNrVoTIGaDXwAgpYOKjBxdalyEtDVHpBstAthfblFQATKUIYXHNLTDzdjAaTJlwFGZYlAApZJyROhuQrFcgwLEcxbSmh",
	];
	return XUPDRzhlad;
}

- (nonnull NSArray *)AOusXtESWyQtPMw :(nonnull UIImage *)OvWFcEvSPc :(nonnull NSData *)GpccnUYmAEAHlkMrTA {
	NSArray *vOBFUXlVoMMds = @[
		@"vhCGYVDmdnhoDJFYoiImnSfDrLwUmpfVqCDnNhDhHEgRwWYTUospinPunCyYqQJPEzpEdjyxCfSStPBKaxGImlcZOhPeqlOWqkVhcIipogXLhgngjNiGvpLlxhtwY",
		@"AQanlzvNjaCZUNrpMmZnSAvBGUTLPeTkmqPVSHAafPEtIfuvXOqXPGAYxuicVuspLOEQCKSJmmzRCHGPZyDLXhMWMcvNiFnqIndvMTJevZjbFzOsoQPKISqsdqkDNokqTkUryBLgle",
		@"ojvQBSMBGkATUrptHyEwUcNogcFAakElgmyetWhTWxixTuJkhofoWqnoOruJIKWEVbxysKrlvLOQfqwOWBqedwzkBVrGbazrCglVrPNzSszlu",
		@"EJYawhseKSzRHSbMWGCMzuMuSgecMWQvSLstTuDgWbSvyVVKHqQmvhlawvolfqdvrgroqoOCIAGqrxQOFOdorjVSJiwPvIkIIycwMUWzQWcLpjhE",
		@"cJdCfxOuqyJxPCrgQVBcLuMxqwMUvPDPXHyhzklmcgnQXsFhqCVRAomGfqdMEkUfbaarRbGVcCXdmSRirZbHeBQXFOLUCwZCMLFJMbcnmzlCbogUBastRhSMcF",
		@"gPglLVmQYUAyPfotklkewBZfEBoQxhyftmehloFyFRyLFJEXKHaxtSaBfCKdhXuiYlPerELDdXCjgSAFuitmdexQZXQxHDnzmhWcKULabtkHxelxRhBCPQavHURLvWgtQCYlwtlagPCaKKMyYAu",
		@"dIEDDzAwERfDHmQASFLEsSfOeNbEcMnDneWTOKVyodoXLqVmYUgMmFcMtmrxJkNrGGyEpmSatzphecBvEOJbEYMOHLQiJUOHZapeykZRaEcLJwzwnHDWYyvWmHKgpIFXhT",
		@"wpdELdUEfbyEbDMuSZiopPHlRGgFBIhzJJOOsXrhYjDwCfJveaCSJEZVnnaNOVyJcBNniNUJOnNQdRHXaPGNtQZjjqGAtNuDWMcax",
		@"biGCWRBQXyOVOvuukcKlzdyOQfNnTAdohrceJImtTBhFrOleAclhoBJrakNAgMFJKTBAAXrCDbXQBwwqEeGhPleskLOEotycDMWwgERDAVmwKBhCCFtjwonrPdpkblfGB",
		@"ytwSWpAgTvVvjpWrXnUiuHIJLcEYnzGZGPGgUGWJlytorgerNNMAtsUhuoSVFfIjVvXQVRlTuzRuiwmkzivfdnvWepwdeTzJLzvCAhGbGHhDJCixHxksSfkocpqNJMZjFvKOEwVCEFoKBvTUuPW",
		@"LbbYHGjFtmVPhOHqUYjWnLzHURRdXllRfdrOuyfbBuhXkQRRDeuogDHBpjmaQpuEmLyQpVHyxIUAnAJoXOWTkSPMCxsssPASoADuhgxbbfOVDOAjNyBFhbjehdMAMCFIqHzZajwuZlQ",
		@"oTaPXNXTtYNZudsTsZOPGPXKJeFWHduuIxgOEzwvjlSfqlDkSWUftVCVIZeaCfpkWmzHbDyHUNdHJKVmSubuwZbvThpBIMfTWZZlMDJLznCSBQoCmADhvIExtRMsBjJTyHKFN",
		@"fJkajhhbliECLbcKbkgtBQayJCDaXBdXwXZmvkgeSZSSsGsafOrZLDqdNJlMDeWgtkxCtCwPbjALxNUxJAvoVBuufLKqhfFrZCVgJRSFy",
		@"KFcDmJpDNWHzkvDcgcgrGLSGfJuIeCTXlVSBeVMuCyWJOIupCRZsvsgwqTVNeqwAaOgKlQqYDQrsiVfPmVdJDJNVUedZvoHzgpEhuYOhJKpopg",
		@"JtPKWfipFyePGOCjFQPTLFELwFvFUhQslBoQkiaYkFESlOaKFregEEclwLhwNzQyrNokiTdRjilrbnEaBJbXlKWdueOHSDgLdBjouGwmqEUbnlfdLWdtpEwriJrfbvYSKlyDFSZgK",
		@"PZojuIQCNgaSiQCsOHHhkmrktLZnwXlyRtRXBohlBCbeRMsmcLaxrMRTHgFZFVJtcoiJmaBFPRsVSjWdyYjZnvPSKvVeSXqtOhLvXLAhxddXKSiCupfJDaac",
		@"iQQzwpDOEZjKnVvoTlvRgrdrMrGJTnJSpcLCORIKPQLDbYrVcwZbhlAtomaZwvoYFaDEWFMKPGVduLhgBFXvncWbwjKFwywZfcvxaWHZwbZAcnuAgzIFfQDXOUz",
		@"AEmXWpPylWutnDqHLQmAlWoshROOdfHgVoXNdxsWbZKqMpBxbSdFRliYwvAswPdAGpkWXgbpQsKVvEnEsjdjGswTNLfZOBWXEXgXZDLYtAHRWSfzYhUVZOXgjUhVFajfYOrWIxeHc",
	];
	return vOBFUXlVoMMds;
}

+ (nonnull NSArray *)moATijnrYtRwYb :(nonnull NSArray *)fXwxOEdMzKRGk {
	NSArray *WxoekDeDqQFYGjUsl = @[
		@"OHnOODZqkPfOJVDRHRxopDucQnjUdyGSpmOoGMeETArEtgfFfOOBhiahJOkZEMCVnyiRXGxXqGlgDrpRxQaoraUQAQTbdMVTqhhby",
		@"NspJSqbjHPMNwzwKgdizqeqGzPwziLxXrOjOQHyXDRaxMOeMNhVcAggZjtvXZIdcnOpttNvlyDKkFUWdGSwtxkAQNsVcmyKOrwUOOYsJFqTiWv",
		@"jPUghAUaYVbJprmFjoNoUaWJpSHXrTOyFLHfuEFGiYSOOORSWENksfVBDGeDrYOnkNSRaUZYKlJYGCgbOMaitkQIgEDkhneSabJAe",
		@"foTLhCleWZziqGqFefbweDcvZCOtlKRxiwajOwrjhUoTLfEAlQgdylIwnICFySMQxvOtTUYJSNZppFSdqOZAiqAnnEhjXgCVSZXfueyWrXTbRFzAPhaUrMWfANTJCtZnwLVqhsb",
		@"vvnyNzlMKwReTNIARTSxilzsLtsEPxpKLsBJAZlYjvpcZyomazkSsfkEiPDjmdVwcPxSgzuAGVtHINyaHsLedqOVYYzEiySHhUhPGqaygUOoyoftLOHHhqGjnUub",
		@"AzrtpAZdNsfcLozxqbUCVQipyVJWJFcPTUMujITEAJlHwTGZILNpyEPKbFvKXQqUTWJzxfsCgHgNjjYTCVUvfCXARpykYKmfpFymBjEBffhIOgINmTyVZuDdHowhxxphtytDWRF",
		@"bjtyPlROWFLAtzYNCuEyVMVYkjLCDJugYgOLJsiCeECOntMfpTTpRHTjvAHsuHiSmmXYINdXOYNwEoyFVHtJAfxBgSsiIrJeIEhoyBIdrPNtFNHDmgEYOQwJmNKaCV",
		@"BrNaetzomBVEtTnMSfiBRYfGSzyzLEbWgOnCNXKWBJXCdHNGmpcqfyKpQfQRmbMTtJZeNhMSSAnyHlrVhKIougrLOqCOZxnDlDIivYrbGBlsFmljBzcdTMFHqVprUmuhlflEKZHHMWYmuQfkLKz",
		@"gmsxVrWOKRzGSdMXkUjFeLvrkYsdjqTWgtzXojQMPNqkHWzLaEnmuZDOeegqzkHNyUSpizeosFcASfSjejLjvKQRtpxvZRYPiBjmKEIcxkoiNQTVBsCkOYjPWeOlaOkpsetRGPhxzTwOlHsOKh",
		@"yVucdLBRcCckHDxnxOvaqJvOWSGAnMWMXvKJDtcJiUMEGoRdZPsRMdLUGnnApVokWoLJkaaAnVCvMkYVevaYonRsWlWeqnfIOyHLRwpDiWDTdrzjgxV",
		@"YvplsINlhFTnsUgOSKrIUFmbMHEUYJCwHAFVIIvQcFjRSgiVIQKWONrGpCCWOSFJxFdfaFUbDjfYZIaQNZhjrSqnKBtNZhLveBFEqPMffWwPpuQdcjpSqCQBhszQfUbmzBVyHQTsjHTSX",
		@"FsfLViFeMVjaBlsmHVocvLhtZnDgzCoVLcGqCsCafdpNCsdyxcaMKizoZORTgMOOdFsahEZBTpzorpWJQQJhTeSeWGgIfzFSbztQxVseclRsmTujteEEZmcqOsGpIzkXEEmB",
		@"OXoDINWnCdXEMVryvJLCzjXVpfjZxepeSJiAlJIXVxsYcoBOYfLFwzNDaBtqjxkNQHmqeKgYDerApEeTdDoEDrtExDKyCUfRmxUHuvOvJhTxAlzWdagcWmgmKblXa",
		@"MXrXFYDconqiBJafTcdmDxFhjtCkgGKbkTFpjWDBWMapfXtHvekIUTJsaahSCXrcDolFjYAGYZurqsyTBvkqKeDsrIZEEDGGeGcrBNiAWSjpjcVFGFqadnQPtBrDDhvMXmGasmNCIzg",
		@"ObjhFsxktWRrrEoLpsFYHmysJGkPNAeXaRiqoEgKBqqITybRRDasQbvBiBsvGorMOopJuWeKTbLJRWRgSVITjwZZqRGjPtYXAINhawGsEKOOwVmsLOMoxqrALQAgGopTjueqPGdYklhZM",
		@"owWVifswcNXEyhMTXUstxDmHovlZYnxppEHNzLDWqtaUjXOPXoWdApFApeobKCSFWsxYgSDIBRmxGOEaCQndFYDrnmkqOmNyTcuzRbGSDBIPiTEfMbhAJztRcUUBoKlsPYZKWLgHmqhHevaEjri",
		@"epXzWoTCgPiIAEkYONOMTADejkeGUCCBntMVjvVfbvwuUkMBRLDiBAZiTBofCicWgpPpsueJtkqNvcGYvXDwyQDAdabHqVHtGiOKSdLPTEsoTJhJ",
		@"BuYKaSZEiySCDRdwqYzlQqjCkRrGLEWUhQtGYnWGLUGdRuColSAsInKNWaHZyqXULlTrGvqQfsWzaXLlmaobydvGDEnYhPWlSOWrggQYikJebDrfMbiPdOcDyjDndPnHAGwIOQFZrzr",
		@"BOkenRIjRCTtkGDaQbmwrusXyaQOrypfABejJdxgZdMGoCnFDSpiBmjJeNBBaZjQYDvepFJuMQqsoujJMtUTjgxQEbQeVyXoXABejIozMQZeRr",
	];
	return WxoekDeDqQFYGjUsl;
}

+ (nonnull UIImage *)BphugNlFVevRfGqgg :(nonnull UIImage *)XCoWilDNiRmCC :(nonnull NSString *)BEbDLJzrxIzuwfYTzN :(nonnull NSDictionary *)ytJHNUgXPZh {
	NSData *vCwZQLzMDU = [@"VMxAVbrsFsILNvsmUYnTJUYmofCDBEXbWPsbqOPhbeOcdcBHgJyekKTPyCjMZaZCUiUVIHgYtqyAlonSiZfgqYKTmczUilzsrNBUicNz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CQTBqGfpeaL = [UIImage imageWithData:vCwZQLzMDU];
	CQTBqGfpeaL = [UIImage imageNamed:@"ftkDJZxSmhkrBPMcuXSXQDbdecZcoekfSmOVyVfNCRMMmFfUvEYAQftHwdyuzcYkrYUBdyMrbWBXQPadkAPxdKRGAIbZuruNMGofzKPQmjQBtWwggRxdZuKRxrxoiqJOfoiISB"];
	return CQTBqGfpeaL;
}

- (nonnull NSDictionary *)JzaJNRbxKhYmKPD :(nonnull NSData *)DHJMXQuJxSQLPwGwSce {
	NSDictionary *mjEVOBzXAP = @{
		@"QiLAqbZcDlG": @"vadZZIocwedXtUDNOgyLcxjZHohxlmibPVPaelvyheyqCgwuRTJzZcAyVgvIGdafJREAPcQcKvQxPpNGqkxMHSVFVSYKDdunEJDfjcil",
		@"hxQNebsoxtMFPs": @"IEQhenphbHqnnXvdbBhQZfQuRjSCqQCEgoMkANkwWAucSPMlzawEDqXXtKFECNHPUHIoSzTkIkTctCzPwiImTkbHwbNOuoIWOZyNDKsubdnd",
		@"lttZuiOLbeUkpRESd": @"aGMeaHYbdMzOaMtrekoAPmQnwEqJUVapgZPqxgtRgmbbzjqnfioJFhsnkSyAtGrHOqwIVFihGGdRJXmizCLeAdYdiaGLOVeCKjxFTiFsyxebVXHxQxaTQWXLLyHFTabppGR",
		@"VZBQCOUKlgjw": @"JQZvTIjYzOnIerqVUrSHraiTTYHDRgmhescotkuGXgBCiDiKPxSUkVQMJcFtWMqOWnIefoYpAdkBCxFJFiRvfMeWTguLpWXtVxjkUGmECXWTkjEGGQYFB",
		@"aEEqEjYfGs": @"uBPZNxCHIVQzQQowUWIpOWeKbsSsLaMNsjcrOFETgcMIKFvlvdFknOBnTkdYRLWziZKLdQEifacfDTPAWYMCtnUAOntmDKtCrxyAn",
		@"hTUYvZxdEBZmM": @"aGgXRdhZMYZJHTzWIDMuWMOaYVpXdUMSkdgYawuCJpaczLGpYvXcUdRhszbHBHtuRLfuItVMaRVdxhQUhlQXVpemorfROqvgUnOYPLGikZQMmdhHavmnCHwVg",
		@"XZLDATaiDJRChV": @"AINhBaKJPeLJjtnkcGhxHPjnzTKJJUpBWjkdypAOOKWeKCLGbIZPKaIZITBnREMyNLQGeEOpsCxjysznQEQWCNVyaInGAIlXYKgCDzCLKLaXvTtdWFpwmSXJbxoBPprVdiRzdvhLoZW",
		@"PGyGICJWAigsRiyiswm": @"WJQPEeFLrqFmSXbphbZKNZgAYlDefDGqJffbXqkVQKGADUALrsBFPgUOfwiMkmmqLUyjxLZIryHmqmOjmbIdIMaQUVuvIPGeJxAPgLjXkzxjcvuKC",
		@"CNfZRnhCZyCyAvU": @"tQgprYufaHMDGUxcvDcmpAoRejBLcVtWpACjcmyFhsbkieRijcHkqmCVwpllmoKHoiJcaecZQOzBZalkXNxhLnOcFBZsuGEsxOHchNEMGdWhTBILHedSitbCQVUcQDOXGLwxYberGuGFT",
		@"aKfqXAKCAaMKvfM": @"DXbdrNLEgkMsUIjUUcCfZwOpFMOriMpYivoRCYfSVYWAUYiMCFVvSTwicoLLNfzDnmcTiRvFQICdLUYgqowLhcHoTBpSrQBbGiMqYJswqBiy",
		@"QYpsInqzqdwGQMXQ": @"dSaBkYGSaWZglpWPjgBgmPwQqsIdIxGCcyEOBCLoaSDyWGAMJwKvXqwVXRTZMlSQllVAAFSYDpBSiMnkUXGAmqmyajMtVIkJqpmXDlBMccRhAUmUT",
		@"yQcmIEwrAmg": @"ZUWFOVMLbzNCRUGXkbHOvwkOgGLMexyMskyIxjGEjSZvQueoWGDazESvEfPRRRLPBAUnACRLuFYzexDuDoUglmASgxTgLJogkdEOQEQihpHJoPxKFGBFrqpJxoFScvny",
	};
	return mjEVOBzXAP;
}

- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.contentMode = UIViewContentModeScaleAspectFit;
    }

    return _picImageView;
}


- (void)updateCellWithTitle:(NSString *)title monthInfo:(EMBillMonthInfo *)info
{
    self.typeLabel.text = title;
    
    if ([title isEqualToString:NSLocalizedString(@"总支出", nil)]) {
        double payCount = info.eat + info.clothe + info.live + info.walk + info.play + info.payOther;
        self.countLabel.text = [NSString stringWithFormat:@"-%.2f", payCount];
    } else {
        double incomeCout = info.salary + info.award + info.extra + info.incomeOther;
        self.countLabel.text = [NSString stringWithFormat:@"+%.2f", incomeCout];
    }
    
    NSArray *items = [self buildDataItems:info type:title];
    
    if (items.count > 0) {
        [self.picImageView removeFromSuperview];
        self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(0, 0, 200, 200) items:items];
        self.pieChart.hideValues = YES;
        self.pieChart.descriptionTextColor = [UIColor clearColor];
        [self.contentView addSubview:self.pieChart];
        __weak typeof(self) weakSelf = self;
        CGFloat pieHeight = [self pieHeight];
        [self.pieChart mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(15);
            make.bottom.equalTo(weakSelf.contentView).with.offset(-45);
            make.height.mas_equalTo(pieHeight);
            make.width.mas_equalTo(pieHeight);
        }];
        
        [self.contentView addSubview:self.legend];
        CGFloat legendHeight = pieHeight;
        if ([title isEqualToString:NSLocalizedString(@"总收入", nil)]) {
            legendHeight = pieHeight * 2 / 3;
        }
        [self.legend mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.centerY.equalTo(weakSelf.pieChart);
            make.left.equalTo(weakSelf.pieChart.mas_right).with.offset(30);
            make.height.mas_equalTo(legendHeight);
        }];
        
        [self.legend updateViewWithType:title billInfo:info];
    } else {
        //添加提示页 没有记录
        [self.contentView addSubview:self.picImageView];
        __weak typeof(self) weakSelf = self;
        [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(300);
            make.height.mas_equalTo(200);
            make.centerX.equalTo(weakSelf.contentView);
            make.bottom.equalTo(weakSelf.contentView).with.offset(-45);
        }];
        
        if ([title isEqualToString:NSLocalizedString(@"总收入", nil)]) {
            self.picImageView.image = [UIImage imageNamed:@"monthBillNoRecordIncome"];
        } else {
            self.picImageView.image = [UIImage imageNamed:@"monthBillNoRecordPay"];
        }
    }
}


- (NSArray *)buildDataItems:(EMBillMonthInfo *)monthInfo type:(NSString *)type
{
    if ([type isEqualToString:NSLocalizedString(@"总支出", nil)]) {
        NSMutableArray *items = [NSMutableArray array];
        if (monthInfo.eat > 0) {
            PNPieChartDataItem *eatItem = [PNPieChartDataItem dataItemWithValue:monthInfo.eat
                                                                          color:UIColorFromHexRGB(0x00BEFE)
                                                                    description:NSLocalizedString(@"吃", nil)];
            [items addObject:eatItem];
        }
        
        if (monthInfo.clothe > 0) {
            PNPieChartDataItem *clotheItem = [PNPieChartDataItem dataItemWithValue:monthInfo.clothe
                                                                             color:UIColorFromHexRGB(0xFD2B61)
                                                                       description:NSLocalizedString(@"穿", nil)];
            [items addObject:clotheItem];
        }
        
        if (monthInfo.live > 0) {
            PNPieChartDataItem *liveItem = [PNPieChartDataItem dataItemWithValue:monthInfo.live
                                                                           color:UIColorFromHexRGB(0x7ABA00)
                                                                     description:NSLocalizedString(@"住", nil)];
            [items addObject:liveItem];
        }
        
        if (monthInfo.walk > 0) {
            PNPieChartDataItem *walkItem = [PNPieChartDataItem dataItemWithValue:monthInfo.walk
                                                                           color:UIColorFromHexRGB(0xFF8001)
                                                                     description:NSLocalizedString(@"行", nil)];
            [items addObject:walkItem];
        }
        
        if (monthInfo.play > 0) {
            PNPieChartDataItem *playItem = [PNPieChartDataItem dataItemWithValue:monthInfo.play
                                                                           color:UIColorFromHexRGB(0xB01F00)
                                                                     description:NSLocalizedString(@"玩", nil)];
            [items addObject:playItem];
        }
        
        if (monthInfo.payOther > 0) {
            PNPieChartDataItem *otherItem = [PNPieChartDataItem dataItemWithValue:monthInfo.payOther
                                                                            color:UIColorFromHexRGB(0x8C88FE)
                                                                      description:NSLocalizedString(@"其他", nil)];
            [items addObject:otherItem];
        }
        
        return items;
    } else {
        NSMutableArray *items = [NSMutableArray array];
        
        if (monthInfo.salary > 0) {
            PNPieChartDataItem *salaryItem = [PNPieChartDataItem dataItemWithValue:monthInfo.salary
                                                                             color:UIColorFromHexRGB(0x00BEFE)
                                                                       description:NSLocalizedString(@"工资", nil)];
            [items addObject:salaryItem];
        }
        
        if (monthInfo.award > 0) {
            PNPieChartDataItem *awardItem = [PNPieChartDataItem dataItemWithValue:monthInfo.award
                                                                            color:UIColorFromHexRGB(0xFD2B61)
                                                                      description:NSLocalizedString(@"奖金", nil)];
            [items addObject:awardItem];
        }
        
        if (monthInfo.extra > 0) {
            PNPieChartDataItem *extra = [PNPieChartDataItem dataItemWithValue:monthInfo.extra
                                                                        color:UIColorFromHexRGB(0x7ABA00)
                                                                  description:NSLocalizedString(@"外快", nil)];
            [items addObject:extra];
        }
        
        if (monthInfo.incomeOther > 0) {
            PNPieChartDataItem *other = [PNPieChartDataItem dataItemWithValue:monthInfo.incomeOther
                                                                        color:UIColorFromHexRGB(0xFF8001)
                                                                  description:NSLocalizedString(@"其他", nil)];
            [items addObject:other];
        }
        
        return items;
    }
}


- (CGFloat)pieHeight
{
    if (IS_3_5_INCH || IS_4_0_INCH) {
        return 140;
    } else if (IS_4_7_INCH) {
        return 170;
    } else {
        return 200;
    }
}

@end
