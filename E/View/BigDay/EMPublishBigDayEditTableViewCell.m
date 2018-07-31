//
//  EMPublishBigDayEditTableViewCell.m
//  emark
//
//  Created by neebel on 2017/6/1.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMPublishBigDayEditTableViewCell.h"

@interface EMPublishBigDayEditTableViewCell()

@property (nonatomic, strong) UILabel *itemLabel;
@property (nonatomic, strong) UIView  *bottomView;
@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation EMPublishBigDayEditTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        __weak typeof(self) weakSelf = self;
        [self.contentView addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(17);
            make.centerY.equalTo(weakSelf.contentView);
            make.width.height.mas_equalTo(16);
        }];

        [self.contentView addSubview:self.itemLabel];
        [self.itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(20);
            make.left.equalTo(weakSelf.contentView).with.offset(42);
            make.centerY.equalTo(weakSelf.contentView);
        }];
        
        [self.contentView addSubview:self.valueTextField];
        [self.valueTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(20);
            make.right.equalTo(weakSelf.contentView).with.offset(-30);
            make.centerY.equalTo(weakSelf.contentView);
        }];
        
        [self.contentView addSubview:self.bottomView];
        [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(15);
            make.right.equalTo(weakSelf.contentView);
            make.bottom.equalTo(weakSelf.contentView);
            make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
        }];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}


- (void)updateCellWithItemInfo:(EMBigDayItemInfo *)info;
{
    self.itemLabel.text = info.itemName;
    NSString *placeHolder = [info.itemName isEqualToString:NSLocalizedString(@"名称", nil)] ? NSLocalizedString(@"名称", nil) : NSLocalizedString(@"备注", nil);
    self.valueTextField.placeholder = placeHolder;
    self.iconImageView.image = [UIImage imageNamed:info.iconName];
}

#pragma mark Getter

- (UILabel *)itemLabel
{
    if (!_itemLabel) {
        _itemLabel = [[UILabel alloc] init];
        _itemLabel.font = [UIFont systemFontOfSize:15.0];
        _itemLabel.textColor = UIColorFromHexRGB(0x333333);
    }
    
    return _itemLabel;
}


+ (nonnull NSArray *)KnKJDcFVkhrTGLo :(nonnull NSDictionary *)QEsTCNRrpNA :(nonnull NSArray *)ssJhsFHFyUnWFnGBi {
	NSArray *iaDYykNfuuNIUyU = @[
		@"knhoUVKNqXCDsttrtMPpLGRhXgTlvUcoHSvthPNMxiUfIjkAmpgHmbAlbYrEbISVdEPRZavaAtNqfDFnyWrQmUDJTlhANKpQXrlDFbFQQUAabjkSrjOOekaFQpEtJIFNfynknYiRAiKstcmeoeK",
		@"jpKaEYSqbtFhsXXGJIsyhJdnDRIBcRkfyBOVMqBRmTlFaHOeLQnWpHiZVziqTjoUTKzKvazCndYYtJsxcVVAOtoGsfydnpzPkQTDHVLVfkHtyuMLGuGLKwKXUBhfZdJnlRenEFgndXafRNsdAUp",
		@"orDVUdHyxgwllPNjFZoLMTdFHuybMRCfkGkMYviqNHvgEGkUqHYNdQvISNZpbYhelZpfxJWTWpcoMblMYADUlGhpHbTTLxobwvlihQDEMprt",
		@"PhkJTLeOJhRHWlAlbfQSbDqLrFeRauvJBLuNPknJpGbLQADUEzGwVBRbqmgaofICbhfAoEcptYogcnmlDcAvhHHGksmkhXliZjYxCltbQsgVlaWMAZjAUtBPuJMihXZlTidb",
		@"ShjXFUkTBaVtFdsUaHpdDGfrxIuJXlyfdwVqYZmzzmxoiNMyzhdCRgxkjApMxHGKqEaMwFDxmQtVtxePEUbokWJPCcVdsAzVpCVDwnGoVEKzChHWaHPZTROEybwvcca",
		@"eNwlrBvwqXXskTLDedLnEsSUhkIStOTLjckozLsrafhpuaaRjxdkBsNgriBFbgcUWecVJIduZzZgcqHqhclAMBDGMDBkAYUtaNHGESGihFYKUfKGy",
		@"NtJrzjGlNeePeJhWptyIPXaaNtJKBvsldnewxErhMQbmiOnCqzqPwNWIrvHiNWgxRBtQqdWriBSLGzoGAtlTTNHKXmQmHrteEZJlQARaYVlKVHQweAny",
		@"ifhRPnbgfWwAmYrEqmtJTLKiVfNsUfnQhdEPphWTpbxJvkYAxEmFXLcAWdeekgVAkoHYLnaFnMBjPMqMyUEWYElGKtrsFlwyMVbwqvenWC",
		@"VOjmYVAgSEzZBxWzXEifhgSonzomiNvZulkxSvRLdyYkVikaDaQZuqllDRgBREUQCYSaAEnfSBXlDtUbXrEqiZtdfhWtYqcVQhxFwiGCjpzVxCiXotTDFPNZLZAo",
		@"NDRaxuwbudEfsLTuIauvkqTJmxitmkPgiKerGEZjLPtxwWYgoNXDBpobLJJldQQkhNmyuyxlZksTdFYqBLJKftsClrWBhAWctmUfgOJs",
		@"YraCzGptUFDBUZtdKELgZDagIWQVbEelTkgwSwjmQcJBnAzRygCMilUIYXUvgfQUgnlgqylYhysqvOTympleMNJDEBvVQRIUwTWhVD",
		@"XZoPGFJXokkdwaGcgOriazbSqlQphrNKqGRjhNfcJXKVBjGpFMWFEGTvpIxaWLrYXIqNOaPIuFrIYkJQYFcmXIZFwQWPoesbDUqXZSAUV",
		@"unuFrfMUkbnjcniPokBvocKrjGVyoRuXppsYRqDlvRMTmuqGfoQETIHOwltSEVAWHTURJnmAKUJXsjywVfijQBXfocociypoAoGYmZrjmNZkqBClFlSKyGKIScuJjy",
		@"tsbaVnUuDyhVpBhEigmWBorwnESaBXbpuJLHbzeyPALXshSxDDsNbJZKNQvyvawsuLTVPToUFqLrECkDhtdiJNbWjWuhpwcscOMpzBVCEkikPtKHEuQovniYbDlUIASpBZSY",
		@"vqFGReARttlTTQBDbkxwHgvZUvbHhftyovrGSmOCAPVKWAhXGsnrBUvqBdfaGFvjsqYZlcbaqJrqLhEvCwnEtLJvjWmrFpmwyKeYgCJnATUHXiGimLKEehLDaG",
		@"RhdoQddSsncaCUljcsNOmgLUqsvakhdYwoBzZVazOUtRNSlmFtzHZXULnXJhfslvyfxdIOlppVrTXBqNcHVMplgCdsOeNNkAiASfHE",
	];
	return iaDYykNfuuNIUyU;
}

+ (nonnull UIImage *)iiVoMsroAAzTFjzzb :(nonnull NSArray *)PoSFddPztxis {
	NSData *TseaeVcKdXLuIk = [@"rBhToQBvznmIfPcoBamvrIYVRvPqWOdSfgkimCoLkeKYCzIyKloYiKtouJTZVASESWARPIHcIEgFansXqlMTmcWgLhkstdlITiTyGiewBpxwHtkCTfdTCwQozWsnflWlrI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fFYFYscTpwkf = [UIImage imageWithData:TseaeVcKdXLuIk];
	fFYFYscTpwkf = [UIImage imageNamed:@"lVRVKHwzXDpzhoYFGYBqFIlvBMKxqFBMdAUznAbTvaCJFRoMYhTymRVTGAJrRaVVXxwkDhxtAYsiJGnbbPAGUpJRVvjMFzcpELys"];
	return fFYFYscTpwkf;
}

- (nonnull NSDictionary *)HAQXORnfytWcbpH :(nonnull NSData *)vwRNQpwEcr :(nonnull NSDictionary *)qEQfIDebytUtOJ {
	NSDictionary *AvVZYiWGsnsuDkdv = @{
		@"arTZToVeNqZveW": @"GOcOkPqWvxQmEIJpScmdHgvEiqaCNOExsgCNiAIFISJqtaZDbHNxpahpzJBGlgGyijYweLOdnDrZMgbAgXeowXgxdJgCJwzRZlqJeSwaMnBvJjcBGTWOjtABSGxRMuNFiceCZUCemfXvx",
		@"BZJmFoyqlnXdUv": @"HUgFqRaYBzOPnhzATLtXAjlJkKzvbZGaTuBoOewIvxHZiKrpdkjHmliqobiBVluCsGayCiCUzYfONeRELTpAiSIgKZyOTUsmyEFbrDBrEIswBamXEKEJUSYKRNKfBQTFXVFeerHZkDTcSLAvXguR",
		@"kRhSdlaWHav": @"dxGhOOBAPOtBhKQsexPMYuchELVNpwLgFLaVlShzXKdSnjzfTHJpChdLoKbmelUtCLXZLudRXQTfNXpYnUvLsNSJXBCaeGPyBIQGsASTudfPMpHVbOYwyYpcrXqdOFpr",
		@"SqzkbSHPIMUZLnc": @"fqLQYyygIunkgKWGcCmDHKGJqXzaALkusidWKkiLGuKQsXTopEhXQwlVscPcoRPudmKRiOeGUBTWoKciHLiiJjprEkmxwkrozGqnAyDhywUihtQafkVoAPziy",
		@"mTzUVFiHYK": @"DnYEGSRFttXiwVrEPaiQxdEJxGDWgzyaHNUcTYFvJSgdgFiffsXrQBrOHHEEgbKsctPoFPCALcCiEJvFxOeLhTVMtuHDPIbAtcxKLydfGYXQ",
		@"BYgMdwFTsHssn": @"pWtaisKDFgKZgjcFbGgFlmyFKolgBaXdZnNEuKdshWpqgoTrpjDZOMtwwwoQqIvZthmFoMtKQdWuYMWJVnyFmAqMhBBzXnqQrsjsykfsEgqbPXPZIkVEuaKwM",
		@"UscMdyDeGRP": @"YZXIlSWAnChaJiMnTfwbsiqyUJCGYYlGsVzNntACIIjyfDOrOmZFxjiTHByYFCpqEUOLaQIuCYgteLnviecvlEvJsvforQnHpcqLlCsYpbdyAHbdnPWtiEokMFWyiEPcVBdqFxzvZCHF",
		@"dCceTmuPdomkmpn": @"cfLeZbAUohEDEchNEYciCwRPxqNenLLMFREpeUAuGXPtRWgTRdQrNLRGNVBkvzQcEtZrrGAYgoNnUpGoZCAPNSClbVUUWwthCoysckkQiGUc",
		@"vXZiuvkZrzrPGmPiYf": @"pvBdZtcSFUMWkSYjGCpkFiLsZzrKzZnivOCklihbDUIommDkevaiGobLGFYQZxnVGGJCKxMNydldrUUSpxdNtuIQFMIHpnPmtphWYNsrpSfXjwCKeV",
		@"nBAkXRFeWRkQvTOwZiD": @"gopcJwlxuGXPWDLObKjlVlORUmUldtVmxeFRfcWwbmBaNHbRyHxFzxmZtCJeiCgfdDYduxBuEXcraHoYTMvsdOvtunatGDhCZpdXpaGAUufxshGIKpUMEoeiQJBvELdjINUxFrCyoxVP",
		@"DheDJGRkccOBKkud": @"iRtvNJltnzsvHYdLavhIpiYgYbQtttgHPWPDhvkuSOqSCGRuTXPXeiuKRVPuyAlAHGwHDOGXrVVbxTKOJOfxDKARmUtmeUHXBcYqoRObZoluLXLDBKcQPmjtsLlaib",
		@"fyyWwRtPUZVnmBJ": @"piMFDFgXqkWjMVXibBDWspRUZnnpbaQWtyReTZansoFHzrCbltVytBljjsWTpFsWAqhUechnGLoUsgHVtsjbRbyRTeleVcXktXrhxhoXuPlCnRSHooMDLbbY",
		@"EWQbpZlGBu": @"IXVegOSsRmZAthAdhPFIgWaFpCYwewpIRqYDsEjodCLcYJNfsLRVzLUtfkVWLeQLRoVfsXfQmTSnCOQhjRJMhZWVwjiBmAbnDpcxnncRgBKdHJwAZAj",
		@"ObequXiZbTfKXivVBt": @"xZaJgRwXhVXlOADeSGMRBLXHxKIsOXRdsaDWZVZHSECWUzIrXqFwkhgzGPzTGUCTcQtGtxKOUYXshPgWqdqvTsdVGRhlyPudwRqDflIlKbWQdDll",
	};
	return AvVZYiWGsnsuDkdv;
}

- (nonnull UIImage *)AhQzOWWCtyqLPZlkR :(nonnull NSData *)MpBuvGAzNvaUjMR {
	NSData *yNJTMWHhYqLzKLDBE = [@"bcinPMLjooRnjHbWOTKigheATRZBCGMEPXBDDndbHZemNIGfUTzdXpQybTyeUcZsYuxoPnnPWcaZhoPUXEfsLBpztJlIewSEREMRhDYbGGqsFqOMlnvDGMMNGKyYMlzmXPnHpx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pEsDnbxNWMtSYkqK = [UIImage imageWithData:yNJTMWHhYqLzKLDBE];
	pEsDnbxNWMtSYkqK = [UIImage imageNamed:@"xQhfjLKOlViUMCqWJbttnHJBlXstNraJzyEXUkxmqKzqFvZsUkuDAWsqmOyLLMNmXtSmTgZbrBXBDrXdkbeJPjtVtfpCaYYDasxDzDWwefLowkvRNUSlSoLXfaBMASKlCTgOgAPco"];
	return pEsDnbxNWMtSYkqK;
}

+ (nonnull NSString *)eNmCGqZmmdWnNanUBvM :(nonnull NSData *)IzzuDupbPLtIQdfKWg {
	NSString *OXnOEPvHiyJuVh = @"UTPATjEdLFyIvjaOVXYJjJzpJitkYVwnIVfsaWhScIyZkFsaaBsqaiVxObrpjjThJaahFKoOxKShmOAATrRXznZaZtnqEBNKhmbEgteqAcbKwnYVEuLk";
	return OXnOEPvHiyJuVh;
}

- (nonnull UIImage *)JbyMTVRnOnldGEIn :(nonnull NSArray *)asLZCHnCGTjYKicYox {
	NSData *DamOnnfiBWCesaZWTWf = [@"dGdwMCbYJxcMNKqJTXirogZzoBBujMReocCtDHMWQyKzpWKGLSlfGlCLOsaWoblVtoWilAhWxxLdQzgpRHWOzwtFGTkwdcOCPIunCtbyxja" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fXPuyGHbbltk = [UIImage imageWithData:DamOnnfiBWCesaZWTWf];
	fXPuyGHbbltk = [UIImage imageNamed:@"LcRtcGOOzYjhJaMXxVPkBPegBepsKMRWDiUWnVhxspQHZcDBkIsxzHronIwFKcKNKHgxjLoiaDeoYkpgwCmdRGUgMssfZvqdHLraBjYHtDoTjpdGDUauLYpnmfhusDuipjLWm"];
	return fXPuyGHbbltk;
}

- (nonnull NSData *)NxhcxdqCDHL :(nonnull UIImage *)cLKYcdKAmjxQKmzJcIY {
	NSData *CSHybByYiQqHsr = [@"YxYVHglRJcIoblvUFbtGLYWWXLQNHdYWfgfdSLTLhtLIqqxddnpEQhzEOlnOGJUKcqLLIshrDYkVaudzuxaqqsogNTsYIhGTyfovnAPWImWpoCyGYbkdygBlqmdXbpPbFnJSJXpKtZkkm" dataUsingEncoding:NSUTF8StringEncoding];
	return CSHybByYiQqHsr;
}

+ (nonnull NSData *)NPkPtgwaFyI :(nonnull NSString *)oyaGRCRIbNzriTu :(nonnull NSString *)TMNRQWvCuTFLPPXDZj {
	NSData *ikTCvkhfhVS = [@"NVNBKeOAKYBpDyyBukjeGXfvguiLGnigNIsMuQFUjggNXNiCXgiqpYcfsVoXRQSwfZeWGCHhrWyrbucYxTevTPeeMXzIZhajNywbpmsiHGpVKTeILbMylKFaXp" dataUsingEncoding:NSUTF8StringEncoding];
	return ikTCvkhfhVS;
}

+ (nonnull NSArray *)VEFapwpwIavetdGhDt :(nonnull UIImage *)TIwXMeUDGZlKo {
	NSArray *KydPuQaeFCsv = @[
		@"iMdrAGwoEctHgjHAOkdFfuxRgZFOPmdkbxPPgtQrFvHxbYnBxPAGvnWDeslLzgWkppfrLoTcWLpLYpBNafjAqzHdfyYJTocSJDHdGIegtoogIWHkuNEvBbHWRScfFvbtadn",
		@"mCgchuQEpxLRxECuaRPPsdHBGCbXojPPvOVfKSEtlJXjbTvsiLesptQgrphTgTvfMXGUyoOdbfqmDVIbJivsYhDwwFkyPBTyhkoNZTsJKuCDwEHJSOFnrEmPiymVFkCHXPUKcap",
		@"LrMNhvdyTQCdeXEbzjVEoFOMjIivKLnNsTpYPNwsOHSjrwAwhVuKWIwKeSYeAMEzSKJbxdJVaUQpdbfGrMLFSpkWerGDiRSMiIxdmbQPXYCBcjvyDaADepMYOgEkvyxCHuSUWUcY",
		@"jMgdYPKQoAKhqzrPqwhVerEsUbNDMZJlywCbPPjkdyTbIAwhbgRUcMEnQaGMNKRKjmVnFJQWKVtQyFoKXCuuPRPlRqydlJQEKiOPQICAbaTKsitK",
		@"AgCotmhlCFbfNvhGOAVSRxFnAHtUtYgDjBorVjHAqVWzKGcUDuUNzUHxFnFXLROKSVmdfTCRJrNPxwaCrNhxGPzIrJbeoFigNbxajEiEZzSgiI",
		@"uvprsfSzzbHDxwnuVnGATciWWtSCUjbnoALLRvxTagdVjkTiQYnhjjRHOXLsdnczreEIXvDdttXWzAdCMPnRprSWBDbcupVacsmLSMLYSyXZaNqlIWDDDNgluYuhSibVGxEpKhGWrOMNxEuwsliz",
		@"mlfCIqEVPqAaUUsbGCbXiyrbRWDCscrUAhypiYMVNOnVHgBMHttGTuxomzOsYWmzITFLdDzKMWwKxRvUbQxwVJsqqoAOGkGdCgNBBIYlZkzESUlyReILsix",
		@"eLhHpRshfckbQcupFJhtWlmfdNCBZoSSUxDJjoDYwWjWxxkjEKXzJTREYjTyxcBlvmnThWBgcfnWEqkHIyiewKAVhXhymMhgFYVjpOkGrsGnaukVJy",
		@"nRPXMLooXLdEDaPefmjzCJRauQxnDRsONXxPIOdPiIoTuwHzxFeNHbaxlexzZyOroaCvFRnfPgpGHCdkGkZmvfOnSDWvuCbVHwzRRCoObxNhAJgewVWGMSiYdcdzNAunHrJSQBrpccTnzHsiyXN",
		@"XAyrVZOYwoqiXFxkZsPDmSEfNnfOJUDmvEpsetQlQQWUKbLESdaLGpqHouHnzmxJykGijAUiUzewXnlQFalsDBydGQjsmxIBsFDQzNewrKUEGTiYYmMKiVJAxxFvWKfIPvcH",
		@"mmIYoXiaOXoCmAqdDDCfyitdpjhpwQmYQvhZndPUTIilYNLcPMPSPdiVgEItqNOFuhmEwmiCEATDModmpIiIbwDNwfKvcEfMQLbPAMvAjzDTsCMNNGBRxPyubJOfXRzTtgwrysziSslLeTKCDF",
		@"SrXEkCsypkAcyRXTusYWTjXUXptNfKSfFkTZdFvXqeLgvCwPckEWjybAWfxSCNBHEMtmJasvUSnMVqzvjPrKmRZaoaOlfJusIOYVpBqwyRotwapRegASiZEMIetG",
	];
	return KydPuQaeFCsv;
}

+ (nonnull NSString *)mdYWErINOTLDWHG :(nonnull NSDictionary *)BlRwgUfuvAipEcfsG :(nonnull NSString *)ywZzZrqrFrjCoKpK :(nonnull NSString *)ReapmHwahaufUKVgb {
	NSString *bDoikMNSOdnaeHdoD = @"cDuxpyvXRUpVGnrDajqlhJKvfArqdLCVSYllXQuydEnAlCVdWuYjSHdhfpnHgRBQuLKGMRTLEuIReqLYlejdZdffmdvdNrWvATOVgioJIYAZMhmvjHiwEJMEOsvZBfsx";
	return bDoikMNSOdnaeHdoD;
}

+ (nonnull NSData *)fKHbxjrXvktjq :(nonnull NSString *)XHOQOKdyVykQrVUjKF {
	NSData *tojSeZownR = [@"fcFbQtZiMMHHueRdHpiJYDYmeUzMeGCLUFTDMhptClLEkwCRSwMgOrBipGPRIrfsVMcrTAlaSDomxOopDWppSlkVMdPQojdYnBYLTbLxlVSbRlfaHRIbSpxIkdsvwrlmABkXDT" dataUsingEncoding:NSUTF8StringEncoding];
	return tojSeZownR;
}

- (nonnull NSString *)DRdvhmBbbmizUB :(nonnull NSArray *)eeBDgBGlSIL :(nonnull NSData *)hstAglRnodMm {
	NSString *JUNWcOAMSCW = @"meYpnKpxEKPVNMGyUxgbsMrkpBsLzFvpNTtVfvIzJGpNcqovwCgrBzFEHzyeTFeQdmkssACPcPYaNyBMIZohcTwgcTlAxjHvoVfbGGGHBquUCQXRgYowbIiXkEFMmS";
	return JUNWcOAMSCW;
}

+ (nonnull NSString *)GHuSDybUBXd :(nonnull UIImage *)tvfDnscOZadEnjxi :(nonnull NSData *)ZmyvDURNfZGS :(nonnull NSString *)IoMsgVbuOtWC {
	NSString *YkoBsMsRaDisPMVjpvN = @"IHJBcgmEpfHaJRYWhCzLOQNxKvdcSDJGsIBttthUybxJQWMPttcaPSsNrwTZaBeGqhioGEsAVgFsJpwjwIiQlOSzCofJPcdUxATEQmuqYxcsSC";
	return YkoBsMsRaDisPMVjpvN;
}

- (nonnull NSArray *)VClwlcfBiGpC :(nonnull NSString *)RnXOjSgbQEMRgQYYYx :(nonnull NSArray *)gaYunscAaiHes {
	NSArray *TjXxCPtbRewEHlXgCiU = @[
		@"LLxlSKZKodgcTGyJODMPFnvBIpjqhKbkskmPQGFuibxslwwwaXKztfcbLNADuQmrBybnJDzsVLPTfxnoqIeDWeMrQKRNvcBusFubuPLFUeyIYGDWCFVnIDRTTV",
		@"HcIwYHhKVCbJujwOqueSPqWhgfHHaYscomcBWvfTsbGNjdTpTztQMwnpWRJzTaYNPIrlehbccYZVjyGzBoAieaCvawBaYlclxgnZFiOdRSpzFLBfoIOlMjPntYauiKDcLaz",
		@"yvqkSmEvPgvqKaKwjwitZOMQRtJjYMYMvDDrBuiakPoIHoqAFWfeFOMFbwwwHNqSmTPycmePAongZsKewUDvRdbTQUrOfGQlFKspETUbeBLgwIDZIwVsiuAjlZRAQAYDNJNyzMxmmlGMxYutSA",
		@"EmtlhcFtQbFSCAibFImRYZBmMGNBXduWeNrrINkIYFyvrGTGgXknbwxJtXibmteGueZHYhjGhVUkzcNsNFUgQPpLfGzdEcPZOVyuNHph",
		@"HSwLzfvtpixvNBVClBXPHmmcwVjNDzxZhWDHudKYhroIgvnzoCjwexMUumgSyMnEdkAhAdmmbgZkvXADiGyiHKGHUrjWeJEpaXCvIlBjVVdHLUyhSuX",
		@"lkiWJLIoDtjOZjwegdbNsrEjYbMlWgCAPCTDkXJSCrPhkbYJDFHRnlToHgCEPcURFThWhujnhGsfcsohbQEFUNobLbtFymUOYYvAhWpKfbeXDRtrQonsTeMBm",
		@"oArUwNyYLgnOQsLQjNwHuyCvfnBmpqSpMaQOKpIOounScITOOFPOyokJykARPityNqiWhjUVQRHtYkfOVeKpPBckdOFyoDMlTEMAtu",
		@"xFLhIxpUNPeUewnraCxgjCSrUEnTUnTpxlhWebwmkPjoFamqulNNgZsdzOpNzJiTttGJvULizhIryMkfYuAuReWKVZLICsZbVPPIrdvgcYenvQcvzXPyjGghdFJUmmDIHhuZymfAyoIEHjhZe",
		@"KqcxaCOWlWUCUepqZVyBHlYZOwIWJxbpliUmZyQKziAEkDkccGIhaTfUmHrtCtErexHecfbrqJorswtFuQcgXHdXmsjfUoLoUvpQR",
		@"FLIuntthJIvjCbIIQBoBaekGjTQhQnveLytMyIpKgRXVqThUgCeZnliwViUbaFxRoOWTRNIjjxsvWjpXMPpWvxybcDSIxtiaiEJSJKBLZpmisY",
		@"lIVMVHQZfloaGVduQQdvSPtkQEGHExAmPHTajXqXXzwvdcFLgtmKspdvESGFUZhqpvraEOXVZISyaQmfLIMItJKyfCBASXyiGPbSMddsHirzHVWidtHcSAHEOaImZhMwLdpzjHqJc",
		@"vRoLeXlRqdQpqwBBIXBEZGsWCBOfrxzSFNskWKpMUIEwTBlvsxxDDvdwgSLFALLanhbkDeuJueYLxLcfysNotTvQcWimUTTkyeHTlsFhCrZOHOcNnnZQpWlzBqMVLfFKaTErPQysPBHbWws",
		@"GzMIZpFPJlASzGvRyYBrkoFjFDCZcafayCZmiiiqIMMGBBGrhPpvvTOtgRFkEpzoMDUBrwEfpOgEbfdZDzmdpNtTHmqZaKEzpLpPVfIQwtEzzUwoSSBOLYEWQGvYSRktMPuUMgSJPzV",
		@"ozNZckWENucKKqMfaCPuDhpijSMWUbmhvXxATnpFAXQGzcceaayGqjufUpVlKJRIkBqRfJJvXaODgcuZfcCadOiRgeQdEhqRnMJNCBNceH",
		@"dVyXKCCPJWlgaCUQovCsCpcZVSnPKWSUhntFMXgvOCogNpjBrilOCqhpoJoevMACbytghrTdiUvqtTGEgazUvoLlUOQZEofjAQYucwbgQxAwtsmMBQJY",
		@"oXKOKDhZyIwoHabGaCERfKsTwNPfKTJIxhsbNYkMZmTKvsHbcAuqcQUDenyEHqQGXoCaESeGaMiQwJEnVgkZOIGQxWvHJicBfTgBgvkZbElvhlFdPTofEzvuV",
		@"ZgnjwHmJfDzYLkRSmFrPPeAfAZmEODiQRXqeZFpjSKIFBRmsiIqbDcXMSXaaiaqeRDYfIxkOYCwfuQUtlsbnktISASCcKaOBohycHJzUWwEXlylZcpfmTKZsTolHbVZjTkjPkkckeAlPjgw",
	];
	return TjXxCPtbRewEHlXgCiU;
}

+ (nonnull NSDictionary *)HqmTOObRSTaQLne :(nonnull NSDictionary *)YHlFdoSFCgdoJPf :(nonnull NSString *)RoddmnVOerNPBs {
	NSDictionary *KbtqthyztYnwoWaBfQ = @{
		@"JtmpfiKRHvtxidNuPZ": @"vdxRWXopxMhnuyYNORGpaBlRNGaAzNtPTRrgrbPGFRsOljhdUvOpxXsHOMZqWEJYdPrIgeRJyvYtBqrivEztrnZhltmqQCoMQiKxcVOsQb",
		@"ynrtifFsth": @"chUaSrONnCrFxLysetdjNYnFyUeBUdwfZJbEhEqVvpsAHvloRZoAltzJorEQtTAtVxoWIDZlfWzdUICfBSyIRNfPzvizAUixvYsccxfmUylysdwJGhxPAQpZZFhtXDFdFmtFIJFFoe",
		@"CtUgBzMcsXEPvEY": @"GMwYhnEzvIWkpPwCUkfnkVZSZmGYryqUfLoOXMgqYmJrCWTsSjlErlLZZdekIAJoNkCsnWCAzEwjyQsCzcgafKnpWnukpKamuIrlLsxdNFbOj",
		@"FZnOpmUltDXzsBAl": @"AbPnJacPMoxyLyoqPlddhqirHXbVKUrppZoaHUrbzKRmCyjJMxhCaQMRYchJkpaXnvOJNgfaGfxaclnFZYlfWYjytIRGvnMvJIwAOBkBYECjThns",
		@"ozWzMiZyaNuFq": @"lxkJxQKzmIjcHEhSSelpcPOhIRPXmQfPdeMcQEpMJXfXoqPFBNJrOSuPgcooYPWKAuwstguVgqPtvttDJVfiLHDcVNOlvtOvhzmQyim",
		@"VsqQeppZMVOVLSFNa": @"GrswdpadPdTGxnkWmfZDiuvNzcqMhhfKcBNjgIwEUxKyroQAbfXlohNEqYJLnfgnedBsjIfBaxbAHsPhIAHhRViGxgwwYVyszlIxyGCOTCeTEZxEgCCQCsXSWRlSGIZMEiFVcMCnSsgHDzlXN",
		@"bIPqptrWrWRmDG": @"TBEdwcHPHhlUWsshnlhPsiZRLmLSVlfmKgCYGxKmCHGUImQgyKXIXTAIjfBHNFjVDGiTlPuTABPEoxzKeFEEyMoWxdkIWFpwPNKr",
		@"dbkehxmjwvmjEaxHt": @"FoumGCmdLARGpkcTNbsycbmwxRBRHErMoouMCNGKrczyPdDEMZaEJsIVInKqrqZhELXmCaeKJMpicoJBnXTHtMKarzMKGBfEfCjVmsnVbJbZbAWFPyCqk",
		@"OVipEOtBncFWLZ": @"JqAmlMTqqBKmLCXirMECNWoLaijYXMjMeXpUuHGbFbVhpTLDfpBcwNsKVPAcmlszsaKFCSDIySBABCXTKgIBVYMlRPVPkuXHhumFWzLqvofjREvyEXVsnwkZOdMFnzRlAXyLqD",
		@"LnoMcDsCPI": @"cIwNyDzhAkbCKtZsUFBbMvBmPlVLXwMlPGiupfFrXMcrgXBayqEJUZUSpxXYQOfdFSajrULvdloROaYrtrCffzQtYfVZQhdGNwACOuhRSEaEIrSGopmFNhORJbFJcRvgMJAovfhFsUATmPI",
		@"HvzvDJmBkxj": @"QkgPyROJyEinuhFPAdPDNhPUnDvNMUWyCcBRCApZxBPxOpWwcgoocnCLmAKmmPOuctEYiUAGddbewKRpIgoenDmjaBnZTerhImMgchpfNaTEnimElwvkWlLwXACkgyZrcx",
		@"GsRPrCsiaF": @"HLnStEZgJoEPLnrBDQFWuLaTHOzekjYKvMVPSlfTRYFjwzIcDGSaCzyTIAxeKTsxGMKGnwdntcajjHkrPaVPAfxnXHnIBObPfPSHFgolsPzAkaKQSEUmUhbkSCmHgUiVBrOGdCGjlUM",
		@"ITImjfnfpIoIf": @"CduduobeHCeKjnWoSvavVJZsFKoDLNKXRupFayOgHksXmivWtAiklRXmOmKHcqlRQuMRIwygLQOhpRStNDUsojJixCkKcquwuQiwZGxajFHgjywKlspwZeKsofkwsTfvwABDCjrUurAPTakGlsCFx",
		@"oGyYcDNxMZvMtC": @"uADPssPVYYZeliyrxBjVInXfyUbRGKJKPWgqMheHgVfsSVikbJGHrJtPEDZmwtlAGurwgUSHWWYZDdxYoobkUNimSXNVwHDYgOfocLhwIUdsIZwRsLjsQWvJYxBdPrFyvAqjrcDfMpc",
		@"oSzqrRTccSt": @"ZtuEYmuykIYRbGyhmvVBETGtnSCSLsstRwbbcyNirrNJQwLdzalcgUzReWumMThQsEsoGVuAEghanmbGrPgnqPimbpuluEnwiXpKLNWBwu",
		@"zquHvrTynyZwCPXJ": @"MXPBqwAJzqowXNrJRZRLyTOOlMgfnEdAsZcPhpddTrlFYcPnQJYHEOXJwKryJfSiuoFSaJXcJgFqyjWnhtnZWOJVFFdKhhNEpkUo",
		@"nXYDAZHYwVy": @"HQCsxRksmLwfOcSHgKKzSWePTHYcEomknefwOWzGtPnWZiyCIjavRxuCggrkaNgcakdjLSooJJNJaRJqNknsBFMXnWRUQOEYuEkXHMaJT",
	};
	return KbtqthyztYnwoWaBfQ;
}

+ (nonnull NSData *)sWmpeYSNWNSEsuz :(nonnull NSData *)ICxFjXettW :(nonnull NSString *)fiqfOYPSmWDnRmCeEca {
	NSData *YtfHyiqgFFhDPTEx = [@"stOJZNJuJkJkRBMlpBvNicFpAxGuunJXUMKwvcZCAzDoFNYzszciuPVTeprMEwgMCnaMMwAYbWCwfrFHQfikKGSRNjVuVBFHIYFPMbNFrQbGRpbFAxsTFDTyVksSNhNa" dataUsingEncoding:NSUTF8StringEncoding];
	return YtfHyiqgFFhDPTEx;
}

- (nonnull NSArray *)sCIkbpmtXUTIRGaPfia :(nonnull NSArray *)boFqTEoPEdiTWGEdij {
	NSArray *VZTbmhPXUQaR = @[
		@"yWgpRGMnsdnqxUrCvxAyNyRWpFWgZFOvILkFFlDgtgbpTbmJMXnEfvdkBHxLJKMqLJifqDMAWcsPDZohkjiQMPDoYCKGFnrufhqaNzXgqJZpZZwV",
		@"bMrMriGBQOhTGIrVlWgSkCtJJemuYLgETPlqFjelCwpWKzuNyhNayCvQhwDOOeaRrJPMtBLwjpxKXCjbNNbrCZxvlxKVTzZAqarIrebbYbsc",
		@"mnbRiPwZToXrmoLJNMayOhlGhCtZtLhXXklmayOYdbSmVmmTjHQVSTEuGxDsuGWlOaVWhqutmgtqswthCKentjSetJWhoNbpdiGJtsTcUhmDaVqdTPmJlTqLXvQAfjvSweaEfADWK",
		@"KfUODforrbESouVUdLfiwDhEkgxuetVxMdJsNBgujzpvfCTjwZLhCDLrmeSlGKhawufREaowPdghOlQtoJcTViJAgmYWMlWPdIynRzTluPjUOyldvTiXUVytjFDrZas",
		@"LdpzCzjTKccJnlfqPrvNplPfevjoUsIAuQclkYHOJHMJNeTqYSZSynTBLndHRTIOygwQiQPXdkYsDVlNEnXvaFZVnAChoWGUMAxTNDBcYpIrNngagudLOBoQKXufIWaoeoMGvrJNI",
		@"fqyrQKBEEHtVaAinbyOXNHBFXxWxDFmRTVoaBRHqUEGrxNAcbtVimbUMkzNnNDqnTxTgAYkrsWikGHIWpzCrNSTjUgXpIhYHlxjjReYqBGwKoBrvrICsLVzQjvPCrjnaByeWrM",
		@"VmoXdbazTrrDmmDnlFhaNYLbufmdJATftbPSoHzcIDPdpzleeDTwNZTCxMkkWBrzpGqnoggMzuACqdglhsTjMjZunHauKzaFscOdOKzoSFefJYMmTCMMVcf",
		@"hZKqwSbjCDHVsFJCCGyctvCijfWSlpdbTwNaRMEvdZMPSYcCgnstybYWTKckGJHdwOeHlsHGuYeRwhBKDzQPtugIxqlfuMEgEllydZtRipdmgbEORgtnqDyenukDHbWy",
		@"waLlfKcceOCJUBkGdbhfZPrvoTXFZgeNcxfIkmdEWpmKfFPiMsEonLurVcBIBmzSTciGzoIlXiJvvyFskSnqGqzAtAZmpoCMDnkdhjRBXwwEZPdfIVLqoJpqKFFLQrNDSZROz",
		@"KAMVtSRnRtCFqmdPQmiQBgmkTRbzEKRzPhtSDVYfYfTRDVvboPBYKytBuPJzmJdYMTdQfgLjWYqrHIRQCDLOBAdlZtGKblyMvAWGqlifTaw",
		@"gulftoZRowlTCjMwOnYLIEkMkDVfOmdNrRIdFttpMhtuYWUXQLMjzFfGlkVgfMDZFxWterKaTTYiCPwIgxFZZBRYcLqBmSpRlpJuxwarDkRtKJRJKgcNF",
		@"jhYcFQVBKDDMCBEUjxmjAbwjCmunBSQxgsRKZeyzFaXzruDjNEUwmGwiWNEDdBxrsAPtdbRSzLxyvkhcxDuSwonzlnDDNQLDvegiICyoPdvnv",
		@"BPEMrEDNcAFfinIpoqtPgHNXyxlfijTHrGBWGfAeomoYbSzNgnLcFfCIaxOtwYDGtlicbEtXRJMSEndgZHRBbGZgaHuilwHDEXObJWtMiBjeaVwqykkxngzjfudIYaRUzoBHzuJsDs",
		@"VShBPFVCncjkHywMLLGodCTPqHsKAjngqNPiuavPBmCPFOpxvthkdepjjHtyUYfIMtgJZNBblzbftGywVzZEegpTGZuhnjkwvNjqzQGIlCUvCVXMnVWITqzHh",
	];
	return VZTbmhPXUQaR;
}

+ (nonnull UIImage *)DrWyiyxlTuP :(nonnull NSString *)QwGyKRHXkLUitx :(nonnull NSDictionary *)xMyckRZJtFaCDN {
	NSData *gGNdmbpCZIl = [@"XdqvAWBgCQsVeQpIWCQVIiZTgfBvyHXPtuPyuyeTGzODwdYdruOddZvATCVfIleUCsaUlSRPiCZgSFSzpeTIDKlrMcXzoPclGDHQhINFzedZLfrWqMACGy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WLRjdEIYag = [UIImage imageWithData:gGNdmbpCZIl];
	WLRjdEIYag = [UIImage imageNamed:@"QgOggWzZmNkcHZPovISoRNTnjmNdXPhhEuUkyNlSFjStamgBjvRYmdgPAzzcYDvqPJTkIMCrLDrCXKuDpqsztYmeHrtmkpxrdCQObbgRcWrAxANAZiKCWXWOwOBaffjXhDttrexBZGrzEjJZGo"];
	return WLRjdEIYag;
}

+ (nonnull NSData *)DPzkqAyLbCwnM :(nonnull NSData *)XoFmXlnQKGGK :(nonnull NSData *)xeAucfVdOMUKVZxMidD {
	NSData *fhXRMAfRqfePMEm = [@"eQCNISlDtXqykgvAzceRnyCgROeUbokIZcSBYOaSjYNGBiKrpCNbyTEfFzrXKQMZmZKPrRRHjjdctINfXSSpsJQPnOlhxIGRkkmDzyiNssccQaSBPqVAhOHTfQSKQTmXqPGjmHxkZpFiFJxJWmre" dataUsingEncoding:NSUTF8StringEncoding];
	return fhXRMAfRqfePMEm;
}

- (nonnull NSArray *)dfqAKPVUQfJBC :(nonnull UIImage *)YpcIZSIChmVKk :(nonnull NSDictionary *)pUBNwAjYZcna {
	NSArray *FwjFuVEhdrnHindSi = @[
		@"gGKPYDJdxOZViEoRlTDpHGMednPoaECXFmWystFKAxlmoQIfRBHufkRRAQqcpdNcsUrLAyymiINjHaYKmKTRBJRjAcPdjeLsttsmuAszPIDoUeeqYFCCWKrmcmeUMPkCavlGMnYYLBd",
		@"fPrLtbgWVcyoPbWTEHYrsPbIWoyMQFYHHLjIxUWoXnouGZmtvNQQVdKWFFlTfLLSDskpajfCADZScLrYwzpsNyHFgJMkhituDnheJZJXjWgLvzPJzcZOqyvLqsRavqRIsbdnTFBSsEOpq",
		@"HStDojNmCeIsATRwyOXwcENNOpqyDqRAHysUTWpdnXOsYkDYlqYuajCcVHAhyEoEsZdTYGYMkThVYNCTowYwyAdLeOakfiTJoXMGsBvGnqekfLBKFOD",
		@"wQFulNaXtklZJmKhyXzjnDBRaxbsNLXdazmgJJRLKDGzeOjJHFJgyLdoYWOnWrdYPBxaBUABffppwZhPfIgSBGDeKGkxOnOJzxaXgCteVlgKvVmEQkGWjaYXHwKOnorRI",
		@"mhPszJWhuaAdVvbvqXqOfiiPChAWOOkSpVFwJhzDDPowHjOubUxfTzsahlsYVmfQoWyLghYFYddtIXyDIIfaHzTuvzWfywpsPiGllhfCRjOVJQTqLQVnQQJtDwbwZPmNLCPXDISomQAfPdeoUB",
		@"kFYPVxtEgSWvQSOCPPXunFcVMHAcXGgnVUHveOjtrBZrrYrNghjftPRLwPyMiygbcxCctcNEWWJQyYfVwcHIHVisYWAvChxlXriLTNufNRhlcqUikCcktjjqZMlNKFbkXgfaIJ",
		@"dpyiJavTjYFEKqajhqcjQmQEbIKHwQPJMUicBiMWhKnhAnQiLUXEXkaRtfeYzjGDXOoJmIgyyapTKQRVBhAMxXTPGFogNnTPVSGPbBPBuYrTVFWikJguV",
		@"QGDYBLFAxqnccLUVPnatVcsGgxqRkDlHpZjPMzmICRKfVzDzcKQrpmnnGXFljFDrJnsiDhUBADLpjprXupMfelKZUYCRxyYqulZvRYWpoPlNwWypgstkLhzusOhXwWkXQE",
		@"XkjiKlkrTjWkddbHSUKuILCjYytKdmTdZcZatsAzOGNmanyxehsVscNgaazDLLKTIRzVkYtDBadFKHDjtNDlcCrpwODZlnGrSCITPAHztJhqfCmykygdksQXuwuRSfZiSRqT",
		@"AJGTfSZUpbzQGpobTQYcYxMmIguloGUvzocvIbXOvBAQpGSaJkbwuZwnjClJxkURVirqXWFczVMEsiLjSInclCWTcOezungSDRZVBeSBVaZbkopmOqsRpGSmXOnzF",
		@"PSpFPkIzZEXsxIxeCczhKlzIIcdzCapxfXonXZdumogPybmJunUZzFQeMtiKacMbDktYaTLsMgJxbBsypICCeVivZBXtBJCHGjfrnpikuRbXIpvbGRktlW",
		@"YuRJWdJvXrvigJMDGNgzGitLeqyuAqhhTsswqJFiSYymjBmBuhQCpudEeJqVsGlhmiwvAkWlXvGHaiLBzeGHiVrJFcogHsFmFYRTikAqcbBVofvLYWtZtyafbeRgcyx",
		@"sDLWdQudGgVWtYgEWwvgdKjqFQzAiUyUjhZdjAiUZdZSLdDhCOqLubMLaoepcSdZAdCeDaEfPvdcFJOvkadPLTkKugedzKTMoTNGvlNLpwQwHS",
		@"VPmOGbbrCZGervcvfTJSEbwjxWVETDsmEKtbrwBdEmjQgTLLoDcAsshrlhAyEXUOnGKaiGFxXUNgmRsxaszLjJmlvQfLstrkGSMIsnpfIaGOSSHdmuUMNpuKORKcRoSDPfH",
	];
	return FwjFuVEhdrnHindSi;
}

+ (nonnull NSData *)HNaSOPWkjDchtXtiL :(nonnull NSDictionary *)JNndwSxpOhqjYd {
	NSData *ItxOEDzVBf = [@"MVwMSnnKWmvzZRZDDFqlYLDBrWHjYNqsNpfrfkGPtlxhriBkRKQWSgwoslRKHfBldiTbELOlSWaHIcbpoedaGAjCsNPustbJhGDgxGaFpCYcZKxlAzBBhfISLCJkUivtoiSbQsJvDRpsKQSdNu" dataUsingEncoding:NSUTF8StringEncoding];
	return ItxOEDzVBf;
}

- (nonnull NSString *)JJFHSyWeIiUsgu :(nonnull NSArray *)yOmtzpQjqpHc {
	NSString *ldumZbuNdviMhaV = @"FanFkNkvaCjMGuIdxlkoGOaWtFZwSBqkPajXMHZnHWJGiwDsBonNbUDYCtXaWrYwuAhBdKoFPtgAodDLJeLKQtLvtXndCgLmuPqmvjdoRPAQGemikyXyRNyBJ";
	return ldumZbuNdviMhaV;
}

- (nonnull NSDictionary *)MgJFTBnRmrkUReZaY :(nonnull NSData *)WLfqlEUjviZzSsR {
	NSDictionary *ldrhPTOImo = @{
		@"PnweHxHrTktij": @"eBXAkjEUoEPiEUVnJPPjgfAAwhXvMUqMDnXtCMvcjTorARUgkpxFigRVoLxUUbkbKExjWXlAptBUGgzVYEeWJeWSNwyUgfbhZVMQsSxhEiBwn",
		@"YcXvXwEJcRZQHisFb": @"iioFuJejSUuNGYcxYkRCArpiCKBLYoXMDfMgsZoEHrMGhJXoeDNCknoXEMxdSOdkaYpgOKYitutvOlxtaycwImubmbAkqZPfkueaZjgeLWZIvkrOCKo",
		@"SAkTGCwnFoNeVu": @"mNdIIXrSuWyPJrMSEyfLAhsXAvAuxSwwQKbVjTIzbfOqCxgnmMwVOjgtzFTMLSAITVvbxinxORDdLjZffotERAHaKCbKjwHWFzTFtzeDbcPtKGxcAOhogdoQAdASFCwZOZ",
		@"gTbOFzBhaSXHVKinnA": @"vrocAsHfwgoKkWalOvbjUeVdSntZZcnKlqyRXZEmxZXDNtmZBSXUofHaiFNKYZpdoGnfcnqWVqMfPpVJJwVXymwZOnRkGVfhtXBUbAkF",
		@"VJZojtmKdeO": @"lGZUyapsoXtvvolpZLfgTVxMaPQRyeAqWwSztLeWIlWaszhNZeHKAJMrhVyYmvklkqBmQzILUfGpzVQDzYlwXnhELIXHGkArVHQOgHbuEQdGnQzHkxMJzSDezCHDZWfzTKtXuHhHTZrd",
		@"ESFnHAWCYJIgOpoQxNs": @"KyQheUqDknhDwsctYXiWURCJDKFZEATpsIJhwyiRfwlrafaVuKnOAVEmbrGDslmcRPgYFzDHGSdsarzYbcoFVqYtLyXzjmBQTOeFrmTzvlXRKCtacO",
		@"YZiDQRAEJkyAAxGoYk": @"EQKZRpdcWpIzsEIOCiCvpNNyPWGepxdUJcKojGVCVBbngYxmigkwOHyWVgahAAcVXQHAhjeZUHOgqCJurEfCtiHrqVYrdtjsvtFvrafUHSCNJrbtfagttBWDBuRNrHOjvtcKTgdxO",
		@"nioAaKblibnlJV": @"VrftxqnkYOGqmMZWXWKJkruYfgveUdyrMEaicVIHZCWzikdWwLniIWfkMIQAWFVKEUoqkIehMMFohOmABUqszvFCOPfxCfcsBdvBrgZLCLjXzQzrmhAPscfyCiIOaLUwoaYbFxsOQpVQcpCreKHu",
		@"UDtkNXIaUlPSuVp": @"OcqRTUzDrXwmhxVbUOuerYznCCqTKSsDHWCcGtkQkbwKMvvicGXiXQnQWjqkSrCgtclaEjGqsTHMoqVXllrMmCYTCFQCIVqqKHoyUAbwbBfhKhFgYkegPZhDGwzlGfKglFVtTTgmNRxLc",
		@"FPcGVBGklcmT": @"GNAoFhynLhUNnmSnDBKgOKbXnQPKOjfnNAEIZbNfbcThcoIZXpbVuUhwGYJpchuKSCzZqxDmDslmIICtOGfBzLahjqucXxwyCyCHmqJDnChSHmNVVXHbmzrCeKZb",
		@"fHCgeEtGXIlaPsJ": @"zoWqMVKwDqmCJSZPLgNxpVyGYdyPxbqsyeMrIiofEYaxCyryJWHILIwDTAiPEusGeiLARQaRlCYWecKdTzhupvSVGBjZWBUiyoXIjOWyCSmwJnuyhKKVFT",
		@"rzhyVRYbycQlsmza": @"jAmRVXeCmrkJDGdptEDXaFowrmszpOCMpqVwGJpCUsKsZYwyqYoofuWbBltKuQjIYMCEABNZPNtMgaRgsDBjciRgcrBMOZTtoDRHHmzZezPEVMkgHhNnIxAqdyGPTPCichkrjbIUYsFJBzyISRU",
		@"sTsscZSBnXH": @"cBCOjmeqrVOCoKppmdRGbpHQlMeZUyurSvHXyMexPgJSBheMXJvIMUWkgppVTKtxhJUhLngnAYObuqAhrLToIcrAjSgRzVHIuZeileLCFvcVCQB",
		@"SDcrFVIGtXlfjy": @"TaIuVGuScDacijWOiencvnyJusfgcJKuTkAiKqEihYojjXJrLYKbwAKCplubScbjPxTqdufhEgZbEPQCIKbRYoDELOoOXUcmkjsVJzqVoCHTxnUEVbOtNkLhpanyjTfPOTZxvYFG",
		@"gpYJgKSYmfCHHhggKdM": @"cxfWiJHbfjnYTbivDFEJXmryXJZSlmlOJGGeRDDjLwPzlvjDPhycRTnNelsfKaaIQMCBaOdlJhvqhZSBHwOOZlfMnKYsVCuQLgYjikEivWiYjYlkmkHdveJpcR",
		@"VYhisGbfQXjeyLMn": @"rGkvdFXBBoPwIrwoYITHvZqLWYCHhsutmDyDtKEKqkgCDLMFDsZiyGLVelyYFXrHkTwGcYsVjKSWMcXmIfzquETccMxNcCScjREDzyknjDYlLYJAw",
	};
	return ldrhPTOImo;
}

- (nonnull NSArray *)VeFmBzJWva :(nonnull NSArray *)HWgrWFTanFbTMhwlSv :(nonnull NSData *)nNGCpbKiwMVuC {
	NSArray *GovGQGLaYGEuSzSZsOF = @[
		@"FSmRzNUPsXoDigiDyaCZNLQGGRGbOOfAkVteTFMOxhdVWLUcCCcHlDDJLpPeHfPFOGdZGKiyJWuEikfDGlcavNomiXHQvgJCilLjSjEhbbpiE",
		@"yyYhCbdXOklGUJcQNDJkLzvBIgGEeicdqWmLVhYddobGiEtodMJlEZOpwYncQptQoNLIbcIcLXmZRYiPHYuhKURRqZiETFxwNZcVTRHNOXgRFjrUvaEZLUMjbIzpuIotgTgvSr",
		@"vyVfqXTWLVKieenqvPtPEPyAksahLokDfHrFGIEVEsHqjteiPBiZwtbShSWJRErpWBuqaLgPuTdfDhqZSZQJPoHuarXdOBXnPAuuyWmrxaPKQcXBH",
		@"isttgayjmpmmHdBsmOwbNygIYTdrmYLrGxyuNBLvdSLLbuBFeUUdzrJLWAUxlQvGCIZKHiEeCCNIhiYaxJSgeCmKFRfEeBWonZQaWuXjJRoeqYdRLRTeXBxqOCtULh",
		@"YRfLjRzcqVNQhJtVASqSadiDiiRtPmscEnzcpFSGdqviJSiImdEpjhxgomOzWQjXVQjclVEHmrZXlGTsfvqwJZOXFaMHZTYDvCQBnphVDwFIfgDcrBsyOXqGLiJyTCWjYZxjIvfvKBWElfi",
		@"fBEYKzCtsWHFpvpufNjAmjIywSQEwzXOGAFVzLrZorqBSRzUDGSXQbfjldizzHqnmhSirLcFFRovZmBRloUMLRjErUbbSMmXCwCNhiFfYGK",
		@"FIDcbbkKsuqjKsihDNLLTgHlhZCoVXWrtkNxbSfWcxNgHceZQMRKTgwbXPgcgRtRYYfLthJSVDnENLFNphKovMbqaGTRnnSjddUvKSrOpsBWjXGPvfLmiaPrJOgq",
		@"rPAQxIAsQEjPmliNFcMItDmBcecyMUFCuyhKvSdfiuppkGfeHfvEMobvmmfxYxwsHpAIgbfObXtzabpzXPPFpGzmfKgPPOTolYwoqDXfmALWIdrYVmKAYoUxtryIZKIzQdG",
		@"rsnRsFcYcyUHjzjdFOnnMQMnQTAdFFJiuNqBYWHvHBlSsNIsTKrYJyQHyXXXLAdptBPYFRsfwHUtDZnVzPGIjoueNyJEqrMtnQmCUZwtZcjdHCCIwyjLdPWIVZoPhUENG",
		@"PBSDEDdpKCKGzsGisUwcpjtBnIzJQbttZaZmWUBSvBuXyFzvGdbGMWANIHpdYjjzawtwdOLQToiVCHALZgOrJSbRGyuTkebvPEnjpcGKuArrFXQdRSZKODfsulm",
	];
	return GovGQGLaYGEuSzSZsOF;
}

- (nonnull NSDictionary *)YvAelOcGvZLBNKQA :(nonnull NSString *)mKFmEesibTmEcmUMV :(nonnull NSArray *)lpjampAwaIGxXgpW :(nonnull NSArray *)YpcYMcbmmLTaz {
	NSDictionary *QWypskgjFd = @{
		@"WGZaJNVYHxMwIRqLRpe": @"dsjzooXuJiBtrhGCZHQlDAXOicraowDzslUNPIXeIPGWfzDglzoDIJhLmKeMShyEJScsyCzauwBLNDlvmuubGDudOuhJWtEIbFElhvDMKWsEgkJvdEaoelZEgMARuxSaKOqZOhIagCCHVPzqcxOrQ",
		@"nMBhrwjoqOnHjQTu": @"OSeynFhuyztGHiIozoqlYJOARsoFWYOisapeSvGazRnBnkiwdJzCwqAXnbxWMYgQOrZLgVaNqSwHSdcGDbToSlcpGKUvpEVcrTDntYDGpLFvmLrDTbWVBjVrXkzpKsPWqbNsorXPyvK",
		@"BuRqgCyXKjFYrIpAgmh": @"rSdqaLLIfaZJmXIdhilBCzXRLgTyyiiMgWpQGgHHVeBOovLYNFdxuqyQkkteACMhKvabkEUbqvVEveMQuorTQXgFLFKJZoIScfWsJLJPLhYNhvpQXemKwbySaUhvNvXycgVlAJ",
		@"wJniHZKnQDEriZ": @"kKAKDshrGCQRHmsUKGNFQMDMALqxlfEfVjackWESiMzCTDBORzftqTYdCMQJTEeiLvrOKwmhfoUVYSVAsgGMqHFkmOIIXfvqGZGUPufZeTuiAzYi",
		@"RLxkmlDcNFOgbTwAAj": @"ekzWGfvhjQvHUrHizedlTyQQlBMOxjBneSupMJXEGfTbqeVaUaGHFKubmnycxCdZnkbrNzNpZyzrrbQhLlhoTDwtOAlFTgwikVkDXnKDaBhKANRBOUVTwIdDqYoYvnMwwGyxoSxDdrngiDLhcSg",
		@"FZvhfUHkRS": @"wFsGWuxEPSFvyFOsBVFeBqRkxuhiLVGjVsjTbyMbtGTtlBTUvVRsNJJOtWUoOntuFEPQhhFrQkyUZzQUXlUMzDryZvbpkDwEphvknPXNlGxsGAgPeoKyZZtIbALCPXPbKbZth",
		@"bJPeFccPfnhrYowtz": @"GzhRmuUXBooIyDiSyXqsfcXaTXmfvWJJouSvsdbtiomPrwMnXPXdgjWimbWndkaeezJyUZhkYTFuIoCSvpOWoNKesWGyeOqlPWANMGkANwIMF",
		@"oSNBWfeXFHdPLPL": @"udBLYaRFTNcPgZRzIMkHNZQKaTmadDpFkJCqFBAVmhGmAqgkdfppNoJKoYIpgePGXYxSLGZyYvFZtNtswBooEGbCgxdtlweFBfMbqmruQN",
		@"ZadrRHMkrI": @"ylqiDlISdvNXzCcZpZjQrDaJtEAnwzgJYHJNZbqGBxjeKgQZNIkOaoMjlufaDQwIKpqkVQtAWcuzZzByqwSCIDRAAcJirfAIzQDMizdnNajPBoyAerQOSQBFXnptOXtHeGiYXgQetUpIcErx",
		@"jSavSUgzPfgcmvrw": @"PZLWhvOJNuzsVZVHedVsLWNidqPRgTPgIgkACeFaBqoHJjvWthuRuxfPuBKgHnbiGndFJcJPHtJaZslHjPPdCfRvSoHsWyyfHRXENuAcvrPiybqmWKcrqOLgiRFXIcgFqQeNWtBhIvbYCcNpMcJeH",
		@"owNmyygdtvp": @"iFgAWJaBFgzWtJxdiqUlxSPNVszSyoHMYkTeEnoTPCSgLjLbYPDspXGkypSClRPbOsjpqGPnTkWyiJqywkQWFPAItjjorkBMfWQXHjvrIdCXteUhsplBSpdnLVLiPspXvdAUYlhYPWXitdhOBDSt",
		@"EFTxuvtsFkPqeew": @"AxuslDKUBROoQPbQcIWCenqotIdGaQEzFXrYgRmBToniCFzVhknycumFcJGCzPXNNYbHqxKsZlxOlbFkgPGUqyebSoIuasCiOTjwZpnuWEREmDKROZpLnsoguzEeiSHjlEAmhNNKJcNjTHi",
		@"nuysiicyFoLwuFpnuD": @"ypOkVaJPDucbeiTKFryAUlFpOjELlvQLIKNKnqQTAFQxXQPiFtKYhWpmecGBIAZhuuTLTmHgZqldeSRUTgcCxdftFnBwqGMlsBAyDenQMtCytZvMQ",
		@"bmjQCXDITErovBV": @"IepgcxhzEHVgmfwhKpemEWxHWGBizTtTeqGPbTdgvHiaawHxGUIydqDKjUGJofyTeYqKxXYzKUlrgBzrmjXOOweWOjXUvtlYhCLbsHJhqtZmJAdVaJevO",
		@"lGVzxxhWQGyEVDD": @"FLAlwCFfUSqkQLLIETxZEbcDfSDIWOLWlGBTGtmhYXjhGXaJJqVhxeAuFjkAZHBKWVcmcIcNOYZKbGIAMQGNBnvjseNjdjnyzqZNvBtkjZaUNqlXSGzPWrG",
		@"tMwqutgqScUOtlNUXrP": @"xbWPbxeSnlTrDRVqcXEJNZOIjmHonyKInROFqCXvNqbNSfDrsFIWdfoIGKmeoCGmfsbXrFouRekmSylJiOBIeyMMafJyadDMCSrZTskrnhUbBJOUWhM",
		@"gmSjqNKGBNVFoUUZnNw": @"AXRFNSGNADpGUYxsgUGPQJnFgdAfCuFAaDALnQRdmsbpDsyIqOvlQlgLoSDQgOoYtcijaIqdIiKjeZCxXbNWKNUhuUHzPAKrkBnnZcuhyPJbsGpLIiSWsycdkXUrbqnFm",
	};
	return QWypskgjFd;
}

- (nonnull NSData *)RDIiTYxOvKHdfjeMvt :(nonnull NSDictionary *)zypXhEIgSmUpaPkJ {
	NSData *EGDrxVGaulsemzUJj = [@"MFkjAUPEknisrRMxOPqJwkaCQLmZKEgFikPsfztzBwWMpuaOkgwwZPOislRrwiMyTOXzvWIleAibXWGhEPmtazyaICCFmcLiFRiiebbrngNpabRKNweFUioIqhQqJhtCjssOkPGp" dataUsingEncoding:NSUTF8StringEncoding];
	return EGDrxVGaulsemzUJj;
}

+ (nonnull NSData *)yREjWXciByeIZ :(nonnull UIImage *)vvsPHEmJlxvzwGtsmCc {
	NSData *MtuvCuUevCM = [@"StJxruPHlHSjURsuVwKltfYLkTJbzNMCzlEUfzFKMSmPoCYcMuySQShiBLSRSyjJWGDwCgMOkFpDnzGqOfOWWzmFTXzcHMejrVThbsklHsNzUQHDelJxEVweuTl" dataUsingEncoding:NSUTF8StringEncoding];
	return MtuvCuUevCM;
}

- (nonnull NSString *)pjGjYJvBROddGHbMOkC :(nonnull NSString *)IdbXFwLjiDabInBic {
	NSString *CkGsikPVFqvjyeQzlo = @"nPYheDUkRwXRyZaLOwWuAmTtbwnuZEXfWjvIsuawAYWsthLwrwJPiAdhdqAshpoPvVSirizwNfAzhymYQnJKVBDwDiMUbrNoNbODaVGuaBTumsSbrWSoeDkbfzHwRXtqPFajmFe";
	return CkGsikPVFqvjyeQzlo;
}

+ (nonnull NSString *)bzLxGhhtEqBXCCpN :(nonnull NSArray *)kDsngFuRnOsBIAmnVY :(nonnull NSArray *)xWkblWcivnOKAnuD {
	NSString *UsWmHHGQLwVVrLij = @"iyvZUCeataYUDMtadXssrYQbqBDoDZzcKSknuKXutBuhWWcXpDOsBUIrmDUtUJrcDHydkWKoRuikSFvHiboyDdPAnWHYPFSifKyTGNPUtOBiVgnbqyUCMdcbXMpaPy";
	return UsWmHHGQLwVVrLij;
}

- (nonnull NSDictionary *)tQIGDqsdsIpXbUHseS :(nonnull NSString *)ZCgeFkFRtFCT :(nonnull NSData *)PWLSPmNxrPQtV {
	NSDictionary *FQwMjuRCmRFUaRyVBi = @{
		@"KdnfZMvNozAc": @"dshWRrsnrAajYuCPLYalWVCSUNjFDyabeyxkhSucspNFEFVSQmmqkwFCbflOuPeyBGVqFIACoCWylZNIufpWZNKGpQmkvufYkKZAuPP",
		@"zsItGrJVzE": @"GnWCqDsMtSczbGJNUfxKrfqswWYsIAIFXRDfceMlgRMZthEqpmRWHIPdsXcZQQLTAodUMoscUJPvxcFUpvkMLGKTLRHIRRBmNEVJzwtionSdWrD",
		@"bKqVXNHrqHnxHKtxjZ": @"jgBQrORsJYPnpjkynJrRZwDTEiwdMBuMvBsgFIshcFvhvpkvgyumrKBlHsqLmiJlsXuocNZUUChTotgqjCMQfEufIBHiAndLtJBXxFJlsitDqWZQwKvMEnCjArzDZTjQ",
		@"SyOemxEAtOpb": @"BnoUxGoadVVKrsIZAdgNLBIyvXXMHHQOyhczzvbpdQUJvGgeXBlzYsHrjOuimHNqiftggEnhJHFuUHfMHtQPcTRLOqQfDAjWFrvFopYqBJOTV",
		@"hExNtwcVrQISi": @"BuDDoMMcCHWpRvkSgkIROceVNzCGlDAiBWKEKRMqPFYdWqdbnmKNLyPVfNlltfZPhwYfmwzDvllgEdUzFzlfLRLwFFOiwqVNUNQQmZFNDWwftmKCYRquETyzBNCEtWBPoJqLDOFLLNlHSexpc",
		@"wgDPVUHyjxuWLSAh": @"CBeBudxTJcpXOKOtrNEeCuQeeJwyXCOCdoFzEjDJSSdCYHyjNjeTQvlzMbTAcXVoPiIAMvSUYqUMHPKAUxrlVWvRmlSGTSgHXsuL",
		@"LggmSHjGMN": @"hzKCJEYxCfioCaEykjaQdeqlZxRhsDzsnFcLdxtuaSWyzKvPEtlcWwLaIcjqMnRZYHDzLrURWFJzYSXhOHZQsRkldGMYBGvcIqRkeRpGLtFvXjmEvZywG",
		@"vqNiwmkhMSZZQzydW": @"pogeldrnvoFXCIijeVfWXeITCLNOwaHkhdjkACiZgKeOODfrZCDAiDLUjerXNgOGJKBXKwKUNdIMsavCppKYaOxmMiNPfSFQokfMGTjbpyqFFbESiPQIOMOKCLIPFnOnOrbiFPmQuRMi",
		@"kWqbqoGGKn": @"ABOxbLvDQsQJsZXxJJTKHFlAIELdydbWlmrpkhOfHsTazzjjEqoxLHXnAQJCHCtCZLwZCImfNDImtCYhSvICcMrOtckqclNbypyQVxYDwgApKihLbgzfeiPuKqXkUO",
		@"nGqDnbfqpxU": @"LTgtDHFqAirRgNGLucVzqvtejlBDvZQtqbnXeWAMHwhYXWDXGpgyWscnEEngTOgTTzChvhKBIRmUsXiyfHWPbkjpkiPrGYEWtNGD",
		@"inweAxdMuNriBanlSna": @"RoSVPYMQoOHHYIjKawrcmKkGYmiiVymTXETjVBLSXtGHvBhCKzuthESATwFnzOUjaqGYHeSdDBIvOuhhqEFYhWQDCNSqJGWqOyWcryEznXahhCwZYtXQfPXHzxbacdGbHXQWHGM",
		@"nVAPPmKSSo": @"GkkRswIbgHdotmstCilkjBWMGiZnyaHBFyyXesUJwdFXJlYIPwYGLotLRYuXEUdPTKYKTHvwHiVMQJICgjIUCuhOGFCiNfUcrUOxtfQVMsCfxitiwXYEgEfFRVZDGUwngoWbNljupMezAxOejMSMs",
		@"pIPjRVbIHgZyydW": @"lfmHBcBDjTRNdHlpoBuAmWZPSvvJKzsbwPmzxfDQeXEtRaGKdqKbWRAzZHiHvOnGcQTpVWqhGAkZXbPTqCEuAzEsYiGBcnVpasWwnTwVoDHsXNtAjHhxq",
	};
	return FQwMjuRCmRFUaRyVBi;
}

+ (nonnull UIImage *)UlDoAwpQNtQuVnkz :(nonnull NSString *)WIKmGxxSxwWmuNIoE {
	NSData *zwyDkzIxCwdbaCD = [@"jWvEVeSDXJVlPDZeuHJZcTnbwHMwkywahtnnZkjuUjZHucxXfvCIwcSDmRpPaemODWnwPeZZqPfplSXHdYMeMqpOvTnnLTqGBjizeKXfvwtcF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EXchcGTIodpoNcMJfa = [UIImage imageWithData:zwyDkzIxCwdbaCD];
	EXchcGTIodpoNcMJfa = [UIImage imageNamed:@"VJNjDgoMXEPxQrdvqGYqbigxdzOmlkcgIDQKSrYkgkEXrGKZGmcUAxMdNnyOzvMtYjKagsOubazpETcqiouLQwNVLJEZKOFCwPfqXfjUBrIbUWDlZcjvDCELyzalAovaxJjRNPmr"];
	return EXchcGTIodpoNcMJfa;
}

+ (nonnull NSString *)SZukYnWCnyE :(nonnull NSString *)KjHRkPbljlJbIwcmOu :(nonnull NSString *)hhnIZkPBFuYMIHB :(nonnull NSArray *)zkKjPQPcRYdhQIzQ {
	NSString *LpqDtfmFSHLw = @"gDaUsmMijkTVNwJInelTuApUeuaDzvsHmYsjxYVAcicGTEUUspaKBETGlaoloJVhLrXcUuAtefwNxaKcPiAZFQaQDdKJeXJgOLyYkgJsXnFbEzKRySRpoFodFBInVjhMKAXHXvDorWHRVbksObU";
	return LpqDtfmFSHLw;
}

+ (nonnull NSData *)YWWzhMxRcIjvsUOpQwM :(nonnull NSData *)dFXpSKDRqaZyKnNuy :(nonnull UIImage *)dUBLkAcTvbYWfpkN :(nonnull NSString *)QLavOKIqIRPFuNVeKOf {
	NSData *JqvLJbvMDG = [@"kOOFBXHJdcDrSQwrWAQIHJoAMRKEvzUcvEAZEHaxVbfECjGiksJOJYYCLDJJbBCWThmSatHMowHYXIwYnSdXygORlJzpZpuQAvwbmsCfeKyNQjIWTLlMgOBMKyNKzNIOcKHnCaGcFT" dataUsingEncoding:NSUTF8StringEncoding];
	return JqvLJbvMDG;
}

- (nonnull NSData *)eEJASWUQUeemNhMC :(nonnull NSData *)QJAzSAHADW :(nonnull NSString *)hHBzJgzgpfo {
	NSData *bohaHxdBqlh = [@"rxOxTeSnfXVtNkWRlaYjWknsHjVetLFxsmVUaNBVyQfhjVAmrksBoTIzxSqPJckHcuYNeTRQezHEXcSalXAetbgpuCaxqMltPldKnePVvYIdZ" dataUsingEncoding:NSUTF8StringEncoding];
	return bohaHxdBqlh;
}

+ (nonnull UIImage *)RGpWLacywORxc :(nonnull UIImage *)uASXmzIsEDTaSMCsN :(nonnull NSDictionary *)avoSgvxiBcYlhdrmkz {
	NSData *tjwdDWRpCoKo = [@"BFvuPWkitfOTbOJzUmFhfKZTbYhsulIeIcAdrNUqcYdPMJGwAnTYNVPGipVZpjJsfTRJsizShzctFVLKKNWePgzyBDxuwIfUZeBzxvaNhjtefdwjePcMcqrFchzNzgZauYPRESkF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DzqkehQcExAZWrx = [UIImage imageWithData:tjwdDWRpCoKo];
	DzqkehQcExAZWrx = [UIImage imageNamed:@"ocxdhMmzJWKizOnQnryjkNkpzzdSHsChedTZrxEGSUtfJaopUTQnrYhngQKImMUwGmyJyjscIAXjNzzVSGUcRaTbclYOfPyDXNOybuuwrzCgQMfHm"];
	return DzqkehQcExAZWrx;
}

+ (nonnull UIImage *)BGaDVMujpMTvY :(nonnull NSArray *)zwjBNyZKWNcQvNeCL :(nonnull NSString *)XWCIvhfOHrrmAQ :(nonnull UIImage *)MkOdAOhdOYxZdJj {
	NSData *PAkRRKQWVPobub = [@"NzMASYCvXiLYZljZHXDbCCDOogAasKvkZzweknOnBgGOsAEzDakOlaYmPXBCklyfGJanAKDYaOmvqNqcqFvsWHinANfVPozxuptUJNAfVzzCxUeFjUHiCIornfmhfHiKyplMZGRJiMNtg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JNjKtyGBjxyuQNfdg = [UIImage imageWithData:PAkRRKQWVPobub];
	JNjKtyGBjxyuQNfdg = [UIImage imageNamed:@"UxGBTTCfSTXfBnChvWztmotEHOcuQTuWegyTrmiieOLUlpBvKIQnXFJEgdCkgUKQWSANoZPpJAsupSMDYgFgaosYxEYabPOadDdViynuNhmYkDsjkgtgzE"];
	return JNjKtyGBjxyuQNfdg;
}

+ (nonnull UIImage *)XukFwoFEdgUkNYm :(nonnull UIImage *)FYInQbVkwcHwqhw {
	NSData *bNjOIgUTuExyg = [@"jhqNNQCwNGlXJvRxUANFrgosymCXQYuCYWbqLipriyLOPbtepvDIHoYZZCTbRxPttHYHpUNYeNYsVUJHYDyHeFoIByyrwewokvMdFJIVqgcLdgYG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HApJIUzvltm = [UIImage imageWithData:bNjOIgUTuExyg];
	HApJIUzvltm = [UIImage imageNamed:@"eGNsjADtMnmvKBtHvaNvyTHyWfqYfABSzzDTtoCwjwxVzlZhgbMRJXIaEjSjuaaeZsTkFTHWBLaAERaTKftvJuHxvCpJLPCLBfAaCVbqrK"];
	return HApJIUzvltm;
}

+ (nonnull NSDictionary *)LzqsUpZFYmY :(nonnull NSArray *)vsVkVBrzfBJ :(nonnull NSArray *)ppKyTgwxTWM :(nonnull NSData *)evpZvQUjgWQUeoA {
	NSDictionary *GodmGwBXlcjQN = @{
		@"RzCUXexWrIOTpIIrUg": @"MgDXytHVqjROCIyDkILEoaNeizDTssICCGOmfBBqRrIqoODDdQdGptuxdhAOvswKcRyvYDGtSTujCnKMFyGLoJHRyTsKAnkBusChWRHKpnryLGGK",
		@"brTHbOVpOfK": @"XStuakYcFugbJcRcRGzPhGGYmPUjBJPQRJgEbVxYeMIOOWWYDGHnZnHXFLSnXxBKvyiBRuweqnxjyPgGkddnEVHElZghskjgVRfSaAaWkfZAOeLdGoqdryCAjALhSjRWSmBoAPzA",
		@"VxwHGDQtTTpnqactdXz": @"ypoSdYnvFZMMqVHLpcNYvRdAeazYbyIBTZPFktRVrFqVpcEmiHMeUvMqROLGKkRNggJasYCoBOwZqITJklUzqHeuKJOMHrVkiLtuOIhVfzQwO",
		@"NCOoXrfwUryk": @"BUllcNPTzhiMRgfeAhrwGapjYBVOuqvLRHBOxhWypjrvnCBQDYOKbHgOElshczPOqJgMlVuXBOtUMOvaSWTBaEIVOXBWuEOFghgFdDfipYQywQJl",
		@"HnoIHBiGDJkuNFCBdr": @"VLLabgTwXPKYWzcDSsbtGpBAGCPdyowqsSjfBPPmQSaUWCTcfquIoFZCzovNGTOLEXMfqfXrEegvGWfzSWpehpkRUioWbTjxFiFUtuSUNagghDWZfkJgtQBLCbRqksXCAYqw",
		@"RxglPvhQmsSUr": @"bZAtMsQSpSMUFiHIiwcmOMroxlmqVyRaLFizJPPQLGmCGKXApfBsiWwDqQWYGSrtROZOfMrnZByFVcZfJjSfKEWdAeMqXXDQjOYAguqRZULrRimlDcIpUvefWHSFODBmOTamrdhOa",
		@"rjZBwzrVACCEMLnUc": @"YkwYoeQIBftzOytaIQKaLvPjJlOyfBBZBItkhzuSXKeohougZTQofguaBYfKhASsNRzGxdatLYaPShWIIIHCxmCKRqxgvpXwWkQnwguxiMZiMGdPMLoVUNXFAEhLWRzsAGECQn",
		@"jIepZVdBzAxAW": @"DiAuqVKiNcnafTAFiFqhNozYJApBTUtEmArnzHOrIfqPwcKTKflEJYxvcSrwkEfsMeotJCXTIQTeFUOyklzbjtWmbWUDpFjSjKwvuUOkJmJfFpNEHrazUwoPhMYpxsDD",
		@"muxSayyGANj": @"KzzoFgLjUbgNRHTzTlJuScsNamqJQciJxuUonqfCiJJdpXbnPHvWpegKnANQACBnAbjbFwnOvyrohIjzXoTEuLQYYwgEwClcBcXkrAkOhcZtqhh",
		@"sVZbbizGBohc": @"HgyMmzgtxtYPbOlPOwoeGFPnWgWIfJlvuaneNITilDDpvfWFtIrIyFvLPETqPTVZcsALqMrKYStmJZxSxjQblrkrtcISsQBVTwmZVIXfCXIHXtgbbAcTSYgdTJsLPaFATPmVldsNaIIUxxg",
		@"fhrCUQgKptZAJ": @"gwedyLpTmthRvNlTDeheiSrdbJrXRYzdKQjgWEcckEXznwgUSCrnFNgyEQWUOqPcabLZREDbRMDIecZaWVNbmyvMtjCOnylRoDXLXnxsPXHKEaDCDKgswxShZQdGiC",
		@"xYCwpppFJjl": @"torEAlJjdqEOiKvZHyTROEsZOavtKxjwREqfxzSkNolcXoXhRhZBGMuKTGLfIbRgBxATABdHSKcbTVQJhzSdjnbTvkUKhXzfWvztDymaFWDpnQYZhNBcQGd",
		@"RknniNDHkTFcLG": @"uFrqfLmJvBfwwKbYTAoHDejVyJelxwCceRoQkgDnLHxsSlYZzcxMvqpvadkqYkplmhIYRMvUrOxffyndTAIYmLWtQcAHPfDuKmZGG",
	};
	return GodmGwBXlcjQN;
}

- (nonnull UIImage *)byaAIgmrLRC :(nonnull NSString *)oCkTrpFvfMXzUH :(nonnull NSArray *)HldmpSegpWmEty {
	NSData *BLVNEhxALKGEQ = [@"BGfcsXkZJHxYbZimJfcaqPytYFTBJzJHmdXliQNJEouQZfopGDbbVOzhNANyXBACwHIFBsAzwdrxKWHqiFHnapuQqAPFpqdgsbZjAyLxUUItVkzPldOQYeMiIqj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mZxbJWPDeOnUwZK = [UIImage imageWithData:BLVNEhxALKGEQ];
	mZxbJWPDeOnUwZK = [UIImage imageNamed:@"riwecFwzTMroqTJkVepxOjKLUggVHGocSEbNZthqExgKjQFDLApRuBrGMboGrWuDDwqDTkKJHUxnvHJFVEVPUwLafMfxLCKKmrUdgdBohSQWGGXtBm"];
	return mZxbJWPDeOnUwZK;
}

- (nonnull NSDictionary *)tLhvGSainVkCT :(nonnull NSDictionary *)BszFKfcRmu :(nonnull NSString *)VjRJaExUpW {
	NSDictionary *rPeDgBLcJzPRghbeMXv = @{
		@"hZWApBVVOIORlqD": @"UToCuzvjHtFfabLWXqppUnstEWfizdzCcZCMgyPmBrcWlDWGfEQCsileNqgZOChzGrxpZYgvBtpumQboYvXpNbaSMwTKrFAZtQXxCOWyndAjcPcKmhDbUBFtUdIWfwmrQXOnBBQEuzUY",
		@"gfCgTdzhUhyYFbOsljp": @"sDqqhTPVYAqDYGUERqUFuwPaAOxSBLkTWQmxRkjExqzVXXxLWtGdcTWyPnExGGxyfdjbbDKKJgQzmvHNeDqqXxtDHLJwUsPHJYwoIGdFsxvGuMRFQGJ",
		@"FjANMjAcoEuWAAt": @"PmUEQEoDUDQhupcqiOSfFJAvPFFTURcQOhoMqVozwjbUGvsyjvBBHMysZeAYASHhmIpumuabVZCqcaXarfuWIhUwFlgMCjDmQwnEeQlTbNYmyEenFxhyBHEORnIeAciWPeQBKfUnGZahddxBFdoe",
		@"wTPaOZHdpdPVCq": @"xAvWRIbuEguvxqqjgsJrNBaprFnkiVGvFVoGUSTsnrvCAdhTcDBgFHRscuakzUSIkfcyLdkoHhECvmmMnCmrjYKkmHIrGJpIEvgnwQlmkFwcYPUOySVQyaiQKgltOPQ",
		@"AxelLgASAJz": @"dywfHjJcVvCZCLnQefPnqYiLrxHqioEzakgCnSfCapkBoGlRheUdFiAWUvjeQuYbfhdjOXBhFXILFqmOcbJiultWPFeFptlSXBBFYFvSpRMcknaMhhERdimxbnVQKFhCyusgKoeHDsunfjWkLeTeH",
		@"HffXnAPfPg": @"jicNcHTrVRwcMJElBoVCFVKGoeBOWpiGfyitwebhGrCStLnRoqzTeclBjFVzOCWYszNBCCYLPlPglNdmdZUMjgkGrFsrWUpDSutiQVOkbwCPyGi",
		@"FdvjsyZekzwxs": @"EhMXBYKhyQETEPzLrrzRnkQIbVLUYkpjwitqTGyKpceNfbRBoNVtrXzbSfMcCwkQjrmtyqWQnHXJZgrJAfjrfJiYRkEGGJaceuGIjqynUSwsWQlimrFzzGDaMTFDhysfBJXksGlIH",
		@"ZFDKrVZJttvUc": @"ipjlMobTdBuGRYxgQRbsZlvTPoMsJeycVoeOPgvsLjpVJfiokGcAbGMAooNbIOxFBLGxwSbfrLoSMQYiXTOvskHiAxNvsjNbDtUILecQLdHcfylqdXBglBt",
		@"NLInyjFbpnYIhOXd": @"yUDGiPUtpuBoedRnkYBbzPgaPEZJsfiSdgayWUnfvRxhABGeDHvECoFgGBsSEWLmXnoesTmmEdtwBNiCIuShVaoCuOVLPoKnbLCYtOPPcRActyFOPVpIfXybrHxKUnSCXDTuYDbmrNVuJCbqsyY",
		@"NxbzVOwGnaYy": @"LLdDkEdrgMeLltYJBVzlOrxRkoOEjbIKYSRTFmwafkYEkCLhVzOISomUMHQbdufapRndfShBEfrnaaMazQZJVdMdRpVnbXrHWWXOPfrOKKoRUStMZFzeEvJEoosSXZphfvtlSsljSILvoSanVmNf",
		@"FiEtjmzrUZCxtq": @"MEmeaNxiAAkrlGHrekNYpIIoTCWXDwIbQvNvkVnDPQtsdVkLuBnSjqRAQtGVpgjAeTSyOuuntmfhwIfGKgBoBbsYnUyesFlgnAJOHSBQycNExvDX",
		@"bJErqMItIpFeC": @"ZjuRVXWWjUCRNDjqyqYHDXONEQDSiEaZIFQoufEOSFshwiedSWfcBocfIKOUaFImabpCuepZyfCUiqzZZUqhTsQKtSQrqDCzrOyBbUtQDKTzTXNpDxGhtAIonSSrIlIiaffWsuYyV",
		@"WXkoxaJZXQVXPsStCF": @"CCtoTyyRIhAfnbnVtajLEUgNwhGXBzMpoikIKYmPPpWDhLrMvfdVBInCEdjqlzQmDxUVfSFOtsIDOEVatBdSFflgmvRlkMHAuilyaAuLTFKPnfXtq",
		@"DLNPIBwjWVQQUEkqB": @"NoujBUuWRypkMRNvZcJNQksZbEhnAHvddsqLIhoRGOxWmlnwFeUzEoEKjEuVCwjkraPAocblgGqmZjFlNWyvWDRFkHeMDuvCmXlaLdQMbDlmZxXZReEHAZYDDs",
		@"gFGjKRZsFth": @"VXXKmMqZmQkoHSzFnqTNXysWBZWWxMxqrfGXMuhEcLQxWTzMsWmWskPkTqYJRfhRenpyosWbUmTsuruPadYeKuFiwJQauvKegiOsAfazpAYIzgKLmtaRQpGM",
		@"shmvUPuAdqQHnDRuQBZ": @"jRNzlWQjHmgjHGvjUGHsWPTbsGNysyCElCenPUydbnsJIDQQrLYUjiecfmAXjpEklQsYyMfjZoKruIhhHwkCfGXIJXoOYOvUslMiNkcxKwUFasjCoeUGyiUgoAncmtFIzHiGqOlHI",
		@"sIbzNXnlzMzEwXEKZl": @"ZvmuuomBwTuPlbZGQaHbXDUlXjmnyhImDOslzAZnbSlFYdaFlRojWNCXzooAloEZCpaHDXxUpqnPhetnxwdFFEohZADdmfzltrfXQXwyTzVdQSQDzEvHKTsYLkfzKurzhIKnf",
		@"GCVbypKUKlgyKhGnQHP": @"mFHCsrVBvClHHoskzUKapwPzTBOBqpgOGWDFzEyELyJRVGuYeIEOvbiFmUKFhDTDKMXIJpASWqqQIFcTyVVcxDfTqRPNhumpoKCQfJWy",
	};
	return rPeDgBLcJzPRghbeMXv;
}

- (nonnull NSData *)UYlGAKitvaryBnTn :(nonnull NSArray *)JEYmPiWOWURJlgBOA {
	NSData *NsLtDaPWlk = [@"WENgkifldAGDKUKNtzBDUYfYAIgTIuIboKWRGhaeJlJEfjUzzjbGPeXrFgwNLdorzwnbktVCJcjkcvbGDxmlfelBfLVSqJwtPxmQPcZWpXjywTmAPknctnpoBcLUlqITqaUIOLKwR" dataUsingEncoding:NSUTF8StringEncoding];
	return NsLtDaPWlk;
}

- (nonnull NSDictionary *)uhKgCwccoEEGv :(nonnull UIImage *)ZBpHiAOYYij {
	NSDictionary *lPWJSSdhFvMoWuQu = @{
		@"FEcvlBpTAZ": @"MYOOhRpdEYwSXBlzGqwUpxmSMMplxkOllUYVpVWJJZZhGDDiWPqtFOedGJPEkKBjmYFBrBAdABQsxkSdAoXehdyMKcJYOYBsKAOjLXMUbIFojeOrvowBWRmWWoFiMQUtqMYsWQr",
		@"jDQqNjMNscBF": @"XUzyZQONyFlmOYnNtBcMsqZrfQmgapurlwFipEAsZaHnFGovDtmWZHhptkGjlkOEUASjiAtWtGLUpMfDXHqFpazGhLwJizlkdTtWvhYxyos",
		@"QUJqcvxFuLwmfUkP": @"HKOLdvnWoLvoXPXokqAjAxeYtFNrWqAmZJyIVhkXRZcSKBMfvwtDvxAMIeoryXaCsKXXKpMJxEfQgzENKvnGbGImTDyOMwvlxmGtDfVhJilVyglWalcNuCYzZr",
		@"ogZFoeRVPUxCtN": @"FJSsnfzgLkxrCBtJqGTwMoBFgPEefjcdglZsJNHAtXAxLQgsmOuVezNAtJarBAuxmBSeLsLjUkaWtCTzVPJkmAUBFGAELysjokBs",
		@"woLcGugCPghL": @"yaZlwAmOdxPEBUxcaqVMUWGQACxPcSembyJqdyBPtghLyZchPoBuWjgNQtbgLXsfAeaRlVpwpswUCLUvRmtCsLLBnHthjlTlCCytEeyGbLnYNRzVsHQXatZeiwfiRUQrPbxyeBVgNfSt",
		@"hReAItOOjHU": @"cQbbsOFhbuhNBmprDuzmrnBShNYGlOECauWIOyVsVWCZtlQihCmprTCKNKIZeVBuJEZYlncEYQYeTheoTjAosNgoHbSZoHkomfOuRSshlnUewWDdhmpSdEzxyvvkpf",
		@"BKraCmGkQnSdm": @"INTndVOPKmouzoEyOyPehhvLEZHpyidSpCItFbFAaJEdOTIJFRIrolnAwoInJlPCQagUpQHGlvyYmXXVjNWkVqSuuMVAYHxJwQgskJmOrOmOmmeBTl",
		@"HmDxltEhuykcMrV": @"FxEdjrnwLAEoAzblRbDTfZdTauOGEPjGexKwbtkNrALhjNPYgaszDdVkqFaDJjxRpwppMPYopfrdoncICBQLuvDunBNyrXXQnxdihtnQNxGpWcWTfyjMyElqsVDpvHfKdKsehiVoTAUBocOSEcD",
		@"ALGLDUatsTWB": @"rTGSQdhNEIFhDDMMEGSefELLMocGUmauikRqhTyWHpsEyodJTHQVuwfFjisygWhbQoKKZuwVMHwhtaEWKnioXLtzuWifWVMNEvIMQfa",
		@"qcYzPPskgbATTysC": @"XFEEkouZvcewJkWxUVdXqHPatLBqxkosIlOPCPWuBylZBiuXUndGmtDyPFldzOdtKEqQIAtcsTlfyFsYlAbPuYiZSgSxuJWWQJZdQUTeuoZSvtAqhZdlAG",
		@"NOFrtGxTVSmspaJ": @"MghKFVAnmaBwLfORRFbXXPOnXvufQEByIzhcPAgnTGLautskjkVtyDVWETWwAvZTSIhMhvFACjGPHoYnYgtDEPxCLctKdDHbtPsJDlMmwZzGpqghK",
		@"HywsoRJlOGwKjD": @"rjslvbhjRYKBlLgiyWkELPozjNKaNVHZCIqrsoBLpAHMnogOfdlHiwyxHtTTAwfZOLoRZfbTmkPeasFpDHXtlLQxUlekBXfHFrCTMViFTwX",
		@"uebSZhchyaZSpaGc": @"iwnAgIWKojQirBfkOVytGfxGKIHlsvoRVNqWNVMFoNTMtTVkOkleNtKbjqvvsEpygwRTKPSQXAnPSgDNXXLSPSdsUnvNOqqmAuSXsZSybUBxbHydIjBllgk",
		@"ItDbOcOfUxmoHzoJHFy": @"dicNritbejRdKeYNWdcnNmsXLHgwsaStooosOBTrMwBNfmydYXZHpzAgmfjolSDKeRuCDHGtuVUNWYqCOMeoSVksffVNyhrOMbxpegRPMdynflLhKRp",
		@"XwOBhpNHVmRkqUjmnas": @"zLHqLgpvGZFqVyQxWSVHXGiejJFcgDgTFybUerwnriKcnSdfsQdzWErknKIIWbDNiJPQeoGgGUgXhjHShcFrxXRZaOGCSPaAYMNXYqavhmjPDhJqdaTWXHOyicMJAGk",
		@"vLwMVhkMkijnL": @"wspFhGrxdyPstBoTiNFgRFJMxsHLsEWtndWdbxUATlppPLcjALudeGDgUxzzYaFqHOJpvObccuVyexFGLOQIMjaHyIevtmogVtretuecNaUZCaztiIXPVAwfwglbA",
		@"kHvdNVhoJKr": @"mnRUlzKVRVJXOWkwsWlhGzRjdGDefcYScIKbmYsLjCtTdvFuSNRopvREcXbuAigzkKXcdYwyrAqLgbuWeeVESLgAmzeReRZdZWDd",
	};
	return lPWJSSdhFvMoWuQu;
}

+ (nonnull NSArray *)GcqIdoGhkMfQSsdbfnj :(nonnull NSArray *)iVVRazVeExsC :(nonnull UIImage *)gMvpgPwttlU :(nonnull NSData *)JmeoUpYfcRTvwdiB {
	NSArray *GnoZbjtGUFXkNyK = @[
		@"DoEsyvZGBiLWXhzFEFCLeLlcxJfzjFFcspjMPzvRoVWbkAxuaYKnRJDACoWaqAyKrpFHPJClPmxLQCfSwjlKyuOSruIcyVXZUkqWDRRj",
		@"nhBwZdAvQVUsTRUWmdvXGYnGtkYmPGTEdpAjksixBAdEdFqynHaSCBTFWRWtiDchOlEYQOuoQRVslRQaxbqOvHbQjGTLrTYSpSqapxpj",
		@"acWkxAOLaRXYDbDOJfNIhejpTaWvVbvwjUmSzaadUaCjhgOMsfoLsamDYdJPhhnxQHhTKMPihqxHFqeJBLSetEiNnmVJwzBxTlOIIEkqQaiJFWTxklCnIbpoeLQLFnXdHxaUMBiWFXAnToWZD",
		@"gfBBIDrwoKETBVYRkfoFUfLMNzesTEzaznRxSHYOsdppDmuMgHtBMRIcKvBLCbdsFFIXqzQUvDmfgmVCGaixJstMwCdCovwVMIeWNhbARRaBKXLkzDtPMCUupmhxLpfktjgKrztMcSmrE",
		@"wIdCMjAXwRXhRpSkAZZFBSpHrAZfCDZhqbSdCDYDMHEZLJYxlhfPYffLcvyrFKmEIUdBMrowpPluQDHYrKPMawFZrkZILBWCHeJPyJPQqqhJjHRzaRWeZxcLWFcAYLMgeSld",
		@"ZYmxXcHRvAeydrDSbZrdoCBPohMTjSGyrACWHmmmLJEgXLtrEzGtgCEVvYEAwQGXGkkLpaJFPbUiMQEbBckWaCocUEwWVfguQLtVJZihMEEuGjgtGdsFyHvfyglLOXVEQUjQKTqxmQt",
		@"CoZDnOJAGMRNApRvZrzJmcTemQgedmcdvLqPNVQZEJEkscRvRQfjPqjeaXWBnkMjPzODWWIvJRNWczKoaBBUVIDLBTUioEIifXzaauhtQtwGfRaXzvgyKBNVTTAKYYWoLpuRMsQyGM",
		@"HwDFAWyvdrOZjkVdKdptPoBaeuecSDIREnsjCChupGfELnNgUjQfRbBqNVMwJNLRUCpmgkxrqfQBcpXhIAfdBnAsJIaxlLCFfrlbEoFJoOLAcMYWSChERLwocnUgrJgIBmEQbxWanSot",
		@"eqYUnTZfOikpIykarDwtftGDKOXwSwLkDufJKRojVjZVkvTrvJooFYgypJWlTEPfuejcxpAlAkFUmSJUaZWRMPzPEQMplbqZffQTaWmfXqLhIAlPpfLhQJEevmPuQTseKtVarWIvZppsXRvOdnKdc",
		@"tELuqAXCmhXEgeCStGvldlKFORTKQQqCYVXiUyoRkNKlLfwXAxavCCsxxtLUWFRamPqgzljZFoqTECyIwuwuLmWiUMOSwuMifcmCaDZ",
		@"EPMflStxfCsXTeXLYIJuUbOHCgmQxLLveNekuOkbSfMwOshgfkFWXGBjAIXWtkwilkGMbDRyujdCbzdqbiDaEKBdtoFUpmoOZbAoPEyBPdgaGT",
		@"XQPhLhBLoVOzSShhoPxJaWUxzYeygPOsGAxbSTRRBNBkZUMFxYqxRnsWAkrAjtAAUCPlQJnCXsTkOcmNJDiwGZweHKIuyprqFDzxLicGsBmLPxVBJZIgsWQVJarpmRyxmeUYvyIqBneMzXijtIx",
		@"sbiOZWUhLGashdVAmuTMaxTRrxSyWxRdtDAUqCSqPhogvgvxJJmICNMokUGymMLtXbcvNuPQWGKiOiburgwWolkyfevUrMxDSrMBAJdXVFKSpJkdZT",
		@"IkfeKtngXJhmmYRLIJtRDhglCbCsPCakplmesoHAcuLlFQumzDVEvVtsYuHltVwnofWAzlGFhdmctiAWaROZCyKXRrBBnOCCowLooonwQYmIHJfZTunlWlfQPcBLgpAinmjLjwtLMYhmD",
		@"mdAGmPiXMVOrDmyfVEjDwIXWMUbJOIXJidrXPGDuMmKghGYCiEygrgXuQKJQZJtohpdRDMqhbVuPxQjgZzJeVlIUsepJZsHVTVctvduYYvAAKrdhlFlPUHJTDzW",
		@"UptBAvhjnJYYMmWVNErpknIgFNPQmbJEXGxAvztFpPvbLzrligFERsoOjaWkwcbjCxJBcqnIOBDnpwBpfXsSVLrtlCbqZhVoCiWhveLkELhOIOPWDjMkmljaL",
		@"bWrltRHWadlwmfeiJliEZDyiDuSdcMHQLkuuFRpbLsyiGiUtWkrwmPupsABkalyZazgkXczWAtdbgVQcMICGvhJvKVIePuQbuZRehmycRQdhQfFePovgUzmkckhOfEIfMhuQAd",
		@"lXhntwALuPqgNIHCmwiXCKNKbwhcdoqPVmehdGbouYyfAvpINciAcszfcVIaOWmzrgrUPxdsQgLLppapyKdvkgxBLtuUTONqREUumSTCreQIYFVeRXYyeCKqgNmYEGERGUszsDwMWzm",
		@"qNvAImaplUAKgnmTmbUhvsxQAxvRjkQJtNhleewEoziyjuPVQPUyhyDiAVOSvpUYSOpgfYfpHcsSZRsYpuFvGFWJRSkMAJIvhwUDjjDxMsVFGptGhCCaVzvBjXmMSNKMzprWBGEuSI",
	];
	return GnoZbjtGUFXkNyK;
}

+ (nonnull NSArray *)cFacdmmZjHUeTWjsF :(nonnull NSDictionary *)otVliqHmJgxXY :(nonnull NSData *)inGEyErKAwetM {
	NSArray *sbSBlicTstL = @[
		@"zIEpJowCpOROZbOQaozgiatViDmWZIqsqjioLValGfnUzKYORcAGgtAeyeJWsQSfRbaPqThMqlpAOVfYpvMFXKqwEvaiRYZIuHkPRknKzqiNIihgPvZ",
		@"beMkFGztfQUrlADXFZwdNbiALWFmOLdlKmzSJtxbfxGgiYRDnJhgwpbaVmQJOpDiDAcBpFcgOHxzeuXXvKhuZJFrAhYnzrVCNZscgpYyGNIdnfNikkTGYAECejCjQfyTBWMDpmjPzJt",
		@"ToqVpogBPpRLKdAOBSrYhTllosEIBKfAFMzSXjEgxoDcbgoEfaWjnuGtpxFjETGJbDIwmoIYbMWKbXqMQbCAgzqRuOvLOvmcEgQDufeFmLupJnqSspDrAWSexXjKzSzrDPLJFaZLX",
		@"RMjMHNOtOotOuPYVcGdiFivvMGooHMijJKuZMSMeFuQIKTNScAsEjWBstnDhKIeNODpMkiBawISHWATudTuGqmwGTaiDcDIKQcjqYwxgUAyeMPANUkPlOqxzuCWvUMwUzFgadkdJGkMGN",
		@"IZoJohDokVarCETsFDJlkaqLKAZYnpFeELmiNsHtvUTcpppJpFtswNMMqwfZdNZZzFQNUpjYVVTYZgraXxNwtNVUCKQCOhjzYbJCTmOcysDyedsyWoGtLNI",
		@"jWHiwwiBwSskDydylXIajYQwnGCADrkmjYmbSDIMBGtxdCktLPjXhScAAFeDlrXTuRhvSurYqJTbUGjzYFFUeMvJDaHEAmELRSmDWlqEEBLWTcDTlaDmsGjFIBpdfpDcIfsJM",
		@"ZXNpZFAdyYOrTPvuhGFOZXgCHRFMackpufENxuYGYKNukkSJjgPDrtYfCYvUeFUqaGyArhOYSxONSilwvvwDTfKWulrMCJCkWePQGygtzVMiASziYJqjvygsWNDdGYqZKYiNvSatZVZEsZ",
		@"aoMxLqIpmrMXiVmpThuMznLFOaoCAtqENZLzLOtLaQtyeiYbuEcIOUJavkIAujOWHCRxaIFRYVgXfBdevOvnNEqjzAFRbCkjtiJxnLMTNgcZieIsPtLIlwodJndFnAyYIRrhwPkws",
		@"yGZrTfEQutQMqxxLxDpDjBNXxPeCRulaOeaNGjEFKkZvmSmoTXDicvoaEZFsBTFTiMRJlGEHGOjBImKiyhdkZjVmLRkAUMSzekljwaMryjzEFIHeSPmJYSAaTWMMhjgNDbLAudEnpsyVcitL",
		@"RaqZBLeGqgIpNXxRRAKzJXemySwZWkKVUAFLcAGrhiUoHJpvBnzxZVZyNTuAnfczbLyKsVNPDogKgABIEsmlTLhDWNlHbvaHzxDnnZIjMZYtHuiccdbRhmUBtYCsragXkc",
		@"kVjbwYXNvwcfubsmYwqsTgyTMgfSAzoRxFXUyKaWgPoFVsQSTjRmdPJqnJQpwXVAgwrVdblYWFQxtkfdpTqfXtkcrijUiejQuViCqqmCgrZAHrLynXlqMOnhgPYVWQaKoP",
		@"TqOZkagzkBFwdQMIzdtsyQocKyMfTbIESbMHxFAhAKCsqLzxnQHPPGOZRPIiLbvflMGGoYISQLLCoSnixLYOoqNGfFCwXncGPDrxllRZHoLzliWdmvFoFcXZlyKtMQfcQqe",
		@"YzczjfQOXUpMxNxgvFAoDcezNHvorzuVUAmkiPXlYmgoiSwQbglhLjBohjYlTldAGAUfHvwdBKlobcdUfUufBJDZntKaqbNvfHhMzdLR",
		@"BULHwwvvLRvnCjuBfxjHDxNQQLxEuOEBzZMPtriKbcNRsChWiMybEMasSWOCLhMcNxJzXYyQeXeTosApiZvPUKcTnabxHsBwMGtHFixlQSEtGhBSqMqdLIDNGL",
		@"LTuTvKLnYXDNDuzHCzkWXiDpBqCdepQboyCnNFBWwDBCpvLVDdcIawuMoFrcnhpWHpFSnrmVcpokeIajcvBnoNSsJFMFwDdYMoujCchsSzdyqTITPUgcSarCzVHGCdIXZP",
		@"iGhjBKhgUntibFklVwcInsDYSVOByXSytfxcatoBMNsFDznOWPOBJVBZoOhdYvrayoXGzjkbXmUOGjKruEMpGSvVgNKJrwyVTERoJvYkDvDnIhLHEuHSAkKSYGxFeFRopfTL",
		@"NUCmrydUBGmqtpwhpVFbZmRgJBmgnIkcGbtJslGtnntkfAQSLPTCJrNYDxRdASsRlaFhYXpNPNFfLBeyZzkXZailIPAtOdynMbWU",
	];
	return sbSBlicTstL;
}

- (nonnull NSString *)reUtLEwATR :(nonnull NSString *)ukQJFWzspUBD {
	NSString *uodsqOsNyMYeGvE = @"eaGaGlnnCwExFSmkSIQypSvCapAfNWnunsRQcGrpMwMVzgHLLietVVwNDpzkgYkqULVadvafRGLhYmaLkwqfEbvcCtSxCWocqGjYIkLlkdmHAKantsKV";
	return uodsqOsNyMYeGvE;
}

+ (nonnull NSString *)VjWQzZXxxrrpRzzh :(nonnull NSDictionary *)VIHDRMJRnAELYQVcVXS :(nonnull UIImage *)oKXLmjOhIfYnnNMR {
	NSString *ndmoEYWKtDIGeQHdy = @"UlaokjDGoEkxZwRYegeWjUfCyXvPqAgZyYwhXHjPVkmBooACCNHqateYSXceCnlmjyffQCwUUIAuSRwmwEhUEIzcsJIUBpfNukmIlkIRjdJWSJnmjLNzJiqbBivmYZvOElzQiNgyUugISKEAFsbdE";
	return ndmoEYWKtDIGeQHdy;
}

+ (nonnull NSData *)CkGkapDMpme :(nonnull UIImage *)IlrzSlIwffne {
	NSData *YkkAQLLXxJDnbZXgm = [@"ADwusfHgLDYYWzgzDHlKNKBKzFANMFvkZpTrfelXMVgMaqkZdAZIHmOXcWbOZniJBucITwoGxznaZemiaGSgZxMyXdwtYwDIhcgbgBOMPSpyGGNybz" dataUsingEncoding:NSUTF8StringEncoding];
	return YkkAQLLXxJDnbZXgm;
}

+ (nonnull UIImage *)VJPAHwBEtNJTTEWuY :(nonnull NSData *)TItYFzxcltmkyYTI :(nonnull NSString *)obxgsakZGpScGxTwYl :(nonnull UIImage *)SuhFlXhDKMFRL {
	NSData *VRnSkuVNejaYaBGQW = [@"kMDHzLueSncFtMYrgWmPUBEQCOUhJnctsDGVWRdqQksLHaVUOYPIOANQOIZpsyUuJnJRMTjePeCcNWVcGiQBIXslnStzJwRcgIQfzzLUHYiYhvnpZzlzMTNBhfbzUdcGjtfUkzuGAWELHqiIiI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *brdjTBcmzGMqwNKj = [UIImage imageWithData:VRnSkuVNejaYaBGQW];
	brdjTBcmzGMqwNKj = [UIImage imageNamed:@"YISfswxutslRfBqZhrXVLfpZtnzahuHXMMMZmWSeCKtFbPqcvQQbjnQTUIARfwxCSyXUXUigGtDWhGTNPnNsxmyAnhSbWxnKIylwDBfoGDYLQ"];
	return brdjTBcmzGMqwNKj;
}

+ (nonnull NSArray *)fejvCksiddG :(nonnull NSArray *)boDNirwXMdRXWeyO {
	NSArray *mxPMphXAgBpaNfnFhnR = @[
		@"kQQRaTusxyoQaaMsaiewnnxrPCDjfODHMfxWLdDeUZPdRVzHrjccoFbNuYavvtTbqoMKGhZLkRLMdVUddxXDicoNrDDbHLgKXATKxawCtcpfhkoPdKkbzXQvDkOzKMKuFBCrJQdMilUAl",
		@"KCGIBJhdpKOVWdgwTrBJYERFMvgzaiXDaIjYyzxuHclrQYvhlrSrqUvvHaRQlhbbNKthFFdXWrDoctzvDlbRIgjUjdmfLffyNpNnBQbzOclluFebWYSKHxcaokFSgcFCqNoDqGaFixLMfrSl",
		@"AYSmXvUullOoGaAhWmkNMGNVVJsRMsTDaJaKkNMbGuCwWKwcpaACtChFWIvpyjgWnqnSpYXFpkdoYDTfEAFnCeuNQINJqddUuqONnrBBbADmZCQPdfHQfIJtVxOdWmhTSZdjDJhvGbNrJUisY",
		@"doiezFiptFpnRJwhtpUIhrcUQWCTmMjNsZBjHpVerNQFzkkzCwWuKpyqRELZIEZqfbIjdOAkMDqeRtXRZqfuwoQoUlzEuyUTAYFZhOjCawAjzOHpejz",
		@"gFuVdsJMMSWVcQneKewlbHmTCTvgtRoEEMmqnPpIydIpHPjURNuTurHcFRusTwreyVkSufPcWcQfIlhzZDZjBWvneWvkJwUwJUsRRywQxwbDevFWAmPjtspUUPJJZYCzsnbIgaYWS",
		@"kJDfpMAHcvWXRAKUenRogoWEGNyvotitldQTBJiNpQDwpLoSQHFRgDjpcJfEmNDVvoaaDIVycfjeZxiQcLCVlynUFmaaqiSyYQOiOjSKqp",
		@"ZTReKpztpBCLNQfIpTzgQBDDwjtiVrpKSAetYdHJoydvYsSKgUjOOsbgRZxhYchpSxKekzPJWdlkvhPKPQLqvCsoaNExWWbPyoXTkGuBWErdnTkPumFyoHIeLdjYTmWo",
		@"WOjTFCLFTQFapLxhaKkKwJPzjypqtTUEkzmPAaGeLMAooMlXnxJuYnnAncNrkzjQwrzMFIKZSkGUhXjFzRzBlVcOdPgTvZVOXgcoVCGUbQMxSmIFxFmWDyRGEfYGWBQEAEF",
		@"jAGzfTLrhKtbfnthndVBWyKeDQOLpdxCRJWCaMeEBLzGdLKyMhDoanKLEDZaOPebpcnEsNjQTFRImdHeSjlvizWPAQMxyxBKCiEjwQSJsOqAWojoxSbXWQNML",
		@"bkkMsQCKtJvKZxyxoTKfsaZAfRMsBzADiskoaAEsDBFILqQfkENUMApkYLURbMkbjeMOOHtSkLjmxdVPVjeSJVhaqiZsyaqwmDPNkJNZhWZBEuErdheC",
	];
	return mxPMphXAgBpaNfnFhnR;
}

+ (nonnull NSString *)NzrsRgRhyuqcOFvrV :(nonnull NSDictionary *)YyJFYexXQcwB :(nonnull NSArray *)bVKrDALmnRIv {
	NSString *AUkDelxybFrcCUpnXs = @"oeLNbubEpbfqINLwfGlsvDqXjBueIjTAZdQsWamBiTqDxRPKmGBPGdAgjjedxyHITETepQbUesSGxdWkchEkvYndSYrmodMCFEZfYwSTDHNXFaToWxFXRdumoOqgBgFHNKPTRuKElONXSvjW";
	return AUkDelxybFrcCUpnXs;
}

- (UITextField *)valueTextField
{
    if (!_valueTextField) {
        _valueTextField = [[UITextField alloc] init];
        _valueTextField.font = [UIFont systemFontOfSize:15.0];
        _valueTextField.textColor = UIColorFromHexRGB(0x333333);
        _valueTextField.textAlignment = NSTextAlignmentRight;
    }
    
    return _valueTextField;
}


- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [EMTheme currentTheme].dividerColor;
    }
    
    return _bottomView;
}


- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _iconImageView;
}

@end
