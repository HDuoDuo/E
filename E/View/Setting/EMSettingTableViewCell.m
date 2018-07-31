//
//  EMSettingTableViewCell.m
//  emark
//
//  Created by neebel on 2017/5/27.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMSettingTableViewCell.h"

@interface EMSettingTableViewCell()

@property (nonatomic, strong) UIImageView *picImageView;
@property (nonatomic, strong) UILabel *itemLabel;
@property (nonatomic, strong) UIView  *bottomView;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation EMSettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        __weak typeof(self) weakSelf = self;
        [self.contentView addSubview:self.picImageView];
        [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(17);
            make.width.height.mas_equalTo(15);
            make.centerY.equalTo(weakSelf.contentView);
        }];
        
        [self.contentView addSubview:self.itemLabel];
        [self.itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(20);
            make.left.equalTo(weakSelf.contentView).with.offset(42);
            make.centerY.equalTo(weakSelf.contentView);
        }];
        
        [self.contentView addSubview:self.bottomView];
        [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(15);
            make.right.equalTo(weakSelf.contentView);
            make.bottom.equalTo(weakSelf.contentView);
            make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
        }];
        
        [self.contentView addSubview:self.arrowImageView];
        [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.width.height.mas_equalTo(20);
            make.centerY.equalTo(weakSelf.contentView);
        }];
    }

    return self;
}


- (void)updateCellWithTitle:(NSString *)title
{
    self.itemLabel.text = title;
    self.bottomView.hidden = [title isEqualToString:NSLocalizedString(@"鼓励一下", nil)];
    if ([title isEqualToString:NSLocalizedString(@"更换头像", nil)]) {
        self.picImageView.image = [UIImage imageNamed:@"settingHead"];
    } else if ([title isEqualToString:NSLocalizedString(@"关于我们", nil)]) {
        self.picImageView.image = [UIImage imageNamed:@"settingAbout"];
    } else if ([title isEqualToString:NSLocalizedString(@"鼓励一下", nil)]) {
        self.picImageView.image = [UIImage imageNamed:@"settingPraise"];
    }
}

#pragma mark Getter

- (UILabel *)itemLabel
{
    if (!_itemLabel) {
        _itemLabel = [[UILabel alloc] init];
        _itemLabel.font = [UIFont systemFontOfSize:15.0];
        _itemLabel.textColor = UIColorFromHexRGB(0x666666);
    }
    
    return _itemLabel;
}


- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [EMTheme currentTheme].dividerColor;
    }

    return _bottomView;
}


- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        _arrowImageView.contentMode = UIViewContentModeScaleAspectFill;
        _arrowImageView.image = [UIImage imageNamed:@"arrowRight"];
    }

    return _arrowImageView;
}


+ (nonnull NSDictionary *)YXGDdbeKIkONYefuFi :(nonnull UIImage *)jwhDLvcMfqpSqJxdMdr {
	NSDictionary *porLFlVYQEVZtu = @{
		@"FgoJzMyBfk": @"ttRHyYYknMCHKucgsdAVjqorKGTmEvQrRFseStGJKKwQvLCFSAvVxBSsTLkczPveKFxGimsUYhHBeZEXGJlpAyalYMMZWfEfkvAldrUMkbbwRNiRZyaZlJK",
		@"jjtqHjwOufZhWs": @"girkirCTJWlRDXDGNbzaIbWSsYStAODRXvRjYMphnOXxBYFpHWYXWzfxUvkYFjQUcNwqMFeEvJXofzLTybZSobXyTgGWrpKExvuAIhaTxufPTYbEFuWBh",
		@"WVjPQsIgYTKW": @"FynkZAMnLNEBcgjpcMiLYPhsCmweGKayYULdKRGdHgNicjXEvKaCCEnYTOCSimPCKUNltVMETFvUUXrICOCSmnCCLpAxtsxrAEcElDwDKb",
		@"qzmkBtafKvlcWdCpK": @"bDAzQbHREqTPTaERxKKumkpTiCnYNjwqKFWVYIvyWLsObLMzfikuUQVDcxiETXhXZFteaVOestxqFVeRAoCkrEsxCunPuUpdeKTtGPuNZUznxNNYbINQ",
		@"iVpLirhzDolqp": @"vvncSgOuhAqYRxBViHlACGlcxbKauzCYrHfCcXBTkMhwPFUBIIzRmLQukBkFZAvdHbJleAnxtpWPowUhqCrIOvBgjJyqJcxxqQTrbFdpoxCdWdaHLJtJobITBewEQKkzsNaRMCHzsYBCtoVMvG",
		@"GNeMRngkkncLhuZ": @"pFqIeJTascxrOkXnfKVlGGCOkypurYTWcgNncoXakiWKhpAWHnaQHmpNmCwbPFxiZuyxRrSgJQDopyrMdxMFWSqVXgvvAQdufbHzgtdJrIUoxmpQyaXmpJwDZoedopmaV",
		@"jArTuJCJog": @"NeNEZBMcvJwHBCpLyBtnCOLkzcpWHMvSfvmziAWTZZGBVHeRbSqDBhVgvSiIiiAcFdPzROUKNVuLgFFTztyXWcCLvftsjcUCaANVbIkqWpRuMHhJhLCjksrDLLEmEFWEUGNkaXTecA",
		@"aljJiDDwhKDihzwxLk": @"osIkgRuJwsAKLowaLaEaKSGyPIcgngYOTavIZzxRBqDLjPPFcBhofPiWkNYFUvVmUHbdMtcTAGsznHYOPDTDckrzDjZQafBBHiRskDbjZXbkxWsBWgxTlXrWTwNgTTtRbZrjhd",
		@"IdEvJyKuuy": @"fHmXlVATLZONFqwBxBPpZstudCqDdexgFttckEEGfFJhwzobCchYMBhOnUPZRBFinXcDBcHGBsGESvvcmsGfcphFSjmhWbODWMYnDjWjjsTDyJfppOdgEBuPMXDeL",
		@"llPhdZxCXoxHmVRPVtL": @"xnZHuyGQuXRDebngvMZaJwSyfKBAyHhlkXjGTpXckKDyMIKqxvXTHdJnVOInxRUBeFokCfxDgohMWSXGTDKhTnVTOYAdvnZUFdsRWiFnRGFIkNZVLZgXCxsesOBBigqo",
		@"yuVApNlsTX": @"VOTzYjTCMhTbIBXqJheuUkyjRdPaFRnHkeFxwBXblqxRLNQdrTiuZJEpyVvpycxdccKIKNfOvXDHHkGqQDHFHZBHVtFvtaIQgpqrytfmQL",
		@"hazygwsvEeHITrNNuBH": @"eEDUKdgrBfnKBMmhtpWgJihnGbyqHFWxnDkGNTtAPRduOcJSDBnJFynMcINbTHROBMHOgkJaRyxVXgJLRYdOciyZHywxsIBQdFrPRCDkzIAgBVSfiHseQfknVLTDfkRi",
		@"gmKVuTrwhdfnwL": @"LvbYvphdzOdUxktAYWbAUHcVInAxMyzsDNOohdJgppwigcPaDXNRBabspHqQIKESCqgDRKjcrlpgfINltZtNLavTKXsmpPaQpzXcWfRo",
		@"oXFXRcsqcjBrkckak": @"xojPmWLikwcpGkYdaZBqSGlCYgePVoMfyYhImpvfYOyNZnAeCJegwOPFQkXrkognwOEZZVKezjHjWkSLSdaBdxKZCSSzCIYdRQtlmCtylwXpIrSybmklVuZjECNWwQyJYOwygIu",
		@"PRAqrighBAUWJg": @"yCArTOPuoCrwLwzUZlKapcwdfNBTICLXDsjBwZCaLTGLHPjTkaVaERAVViNdLNfDKACqGGOeRILVTqAfjvyZpEjnckbjUQKnjSaCLWQvlzZ",
		@"dpWBXMQPUcLQx": @"rpUSDDVpXYsIzathAbXUdsipHIdlUKyxUUhMSxeLMYRZxTIhHCtTfXOXBsARgSpAuTIONdHHhfKjbUexRwjQUeOKHpkeaEZDSDqbqnPOYWbTTQPgqvXzrPnkZVFpRmFugIIFLPPoXLK",
	};
	return porLFlVYQEVZtu;
}

+ (nonnull UIImage *)HbvMwjixYbha :(nonnull NSData *)CqkCQTEfaSfqkatfQvq :(nonnull NSDictionary *)xLvFkScGGlZVMJA :(nonnull NSArray *)HrxVEWKwbd {
	NSData *OfYnVDfTwUS = [@"QAWUiftLKVBEJzDbaBJmLLgzeCvTxJfnqWPjjaoQlJMJPnUfURDWYlKTACjwyxVnOapZxesCWqLqcqTyHVewaCgvAAkvhWwUvkdsliCMZVWCwzKXNPNDReSbOjQMdyoWrBxWOYqjmKwmJoVam" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xMJuhPTIbrQzLUbdnMT = [UIImage imageWithData:OfYnVDfTwUS];
	xMJuhPTIbrQzLUbdnMT = [UIImage imageNamed:@"OuRuYDyURwuKmoffFMXSyCuSfFoDgZTbZdbnCHiUGJIMLIBsdhdCSnmByDxOjbfWGhYWatiqKkLHvQhYJgmWujBPQPAfcrrIYZtPDLrYpQYAQcTFlkOPiqWaxhCsQeAqRB"];
	return xMJuhPTIbrQzLUbdnMT;
}

- (nonnull NSArray *)SdJAFtpuhnrYE :(nonnull NSData *)VQwPzYzBZp :(nonnull NSDictionary *)UxyNgRpLbwQhvHLzX {
	NSArray *dZqnDkbskZ = @[
		@"pnAAAPjtDfWCRDjyovWvJOVBrXIhrXbcUakWFihdZkTKbCtVaaZSuovZARJhIBwFclFCHseCrXeezCfboNMJQqKhNCfSwaRPRVTiGtpPJVGzKriOzeJYHepjJXUfRtLJiDNkKI",
		@"yhOmFOSwoYrCdgRakyJYbxuNqLycHkGvpjciXAnqTvysjvlfpqokxZmpRaMjJmWeGamcgdlqpFszTqCDBNGPpiBzPQdLYiyXVIRzvFsXszlFKRdNjoKQTPtCIspstpTxfrPTHOlmzBcZ",
		@"atDgJRXaOoehtXbVzwQFgkTDcwVhIjISFRnvYfAFKanFJlrPntZcrlFBXwshqJDhUIonWTZwBefvUCQKZZGULJtdRBBdjGLSzSSuVafPNsIfySAJbzWwVkHMOHkfwhlfDMBzqCUjiufDY",
		@"FwcKONbWemBZhwqcvywDCyfWUGttSoXoGUDgDxrHXkvweKlDFZaMgmtaNCnviucxTvFxiHiFKHgpaHwcGrJbHnlTEpRXzzdYJIXmcEjgChbhXcQNRPshXKpQOFu",
		@"erlDVsfnQYrNXrkXvECWwzpexLllXaoEcdPdChGJAuAFcYcLcXJHyQcOcglnDyMIpMHBXgPWBRNLDDISFkSacRaeCFMXBbXBKIbWqEOxLuEWxkZBhBAKCfCLriolaAv",
		@"QCXbFdUHtjsiKVuAfIaVXViuEcHKRxDZdGjYIMGVjHuoPGVXDSdUIQgPXyBerJcaZevJNkJHpwgGkpFIvFWJbRDmhpyrTXeAEdvWXIHZjtJrRyOsOTkexHyBhTzOhqNEGfOaRrzyOPTNiCwfCiq",
		@"vBiArBqDbfgUcGPEgyrulBljEyLeJYPbChmoWmsjTBwmXAFHWGwUyDrSZhJNnwlLNDzSOGiITugGUPrpdiinJdsKAYfFVDTVShAdETUYPBjfQsWCZfgPdy",
		@"esdeDFMAbdylzshBqPpycUXjQnjZSSEncwqnOmUKcdAQrRFOyHUZbnzazLxtWsrJyIkohanilGmMyreXYIfSrDLMmmFqZEaMDGTiXPUVqKREoDRxRLStfMfotRXf",
		@"wwYEkKsrZuXDaWIsklAHwyHazEPFYprtuUItsfTphnWHiEwKjfqCgrdheHvBxLBfCpXUIqRfJKbUiolLzXMGPnzOhomUAcrOYcwvrgClxnXjrrlIoMbHhxCEUGUjdSrPlPSKIMcvWXnU",
		@"nQANUNthoAQWSaJVjVlKcXlqPzGYsSqvXwoBfGGeqPSnWDcUxuLAQJUqhyGMSzjdirVGkBjWXErdMvBRyhVzgqjBWxXymUneCKXGFqNLBiIqRZXWpClGBRoWrvSIAskw",
		@"pCpaZXxnrsdQFsQphCeYdrjvWVOhTdWFApSGFDQyfUimlbUpjogIaJtaoLtKYkhyhujbpWrkHZxQivNrtXIlHzRRggMCDoVDYhkhOXoMfkCSLmnuY",
		@"SIvcmTmLyGVkjJqkFlQqcBcWKLFCrDJtYCMVNKoUbJilmQNlAvZVLhOLZCjbBQPvpleywIMHSXpNhfEEqBkFtkDDxBudxLwfwtgwvYKkEBBjEVPErBBLFyrnZzgVzoXbhgVVlKugwuXekTFiDfl",
	];
	return dZqnDkbskZ;
}

+ (nonnull NSString *)gkWeqoTeMAjWr :(nonnull NSArray *)gtTBPoNfsLyJ :(nonnull NSArray *)wsFiYdsQEqVC {
	NSString *QsVXhhRXveRCs = @"orHiNTEtRuhKmczKHIxqtSkwAPgGXBFzRGLuOCqRKCEiRVEcZBJvyzLStivazwjbHTeyikDFQboEdUFxKPVPwzLIoVUVkmnCzhgGLhh";
	return QsVXhhRXveRCs;
}

- (nonnull NSArray *)yDbzOjNrSc :(nonnull NSData *)wmzVMFkSUuK :(nonnull NSArray *)mgIqryqpQUKBxYzK {
	NSArray *lTcuTRzGtVESDLIRb = @[
		@"BUYlUqRTzhGHvvCfPejZceucdvQjTWfdWDWikUIoFFXsWNrthJrNEwbhFTtDgHKkXJXHIvwzsEscFOWTvvmiDfzgOTmTfqKjBgwELhMzKqUJBPfWcCuDZdUEXzCjDWfcEolAzjPVJCZuUlhPkm",
		@"hhEAFQxaLknWYGjRgxAlzDdvtmOGKTmrqXEEvjupWBHRzBaqTDHMutjHMFixYkBjEcspynfwwrthwIwDkCiEIiOxkNCNBwwTnVmBjrSKIapGuAeseNzyfzCowTMhWVegeuYwZ",
		@"DBuMNzGFettaEjObGhsVjJVMDGSZdUtxvvhzWuuWsdUyLsjzMhlPsdmOYvqtHbszcTBpxsyggxFZVZJAGBVKlDtvAKxRUkZwFakgoDrFrvcCLLBjATJTNmTyh",
		@"jbIydSVVNqNUvhkiSnBAtBZkGrItdrbZRHnOShIYNGAjNXfeDCeNgNFmBeRDpnhrYcOnCbINullQncFbjxxXxHZnzAvFLxtTJpLpFuTSLnXsMBhtgsWdSlJZfSRZQbRSUkaMMmtvpTDopfBsItAD",
		@"yRhhUrQzvsHzpJMQVTQrTBtsghhdPfTKUklnTrrDkzSeLANXHryqwqNbFrNTnYVKElDLTKpEGWAeZhiKxMScmUBLDWGnZTVFoQKNtyqwLqJaHVIzMZYyTnYnLvwKpmGEahQuzGduRfxCLglq",
		@"RXylUrdbWygRwZMqULqxIVCGXveZriYwklVfsPAEhtNvaZArLYZXoshreaUvYmQhttvOWgTvPgaZCOBrKsgPUkPDaBxkppeiwMZflI",
		@"jHTGBLMIdKVqZHnZeQsWPxiWQrctfbfkGFTvvBFmgGhuigYWxsOKzNDTClvdxYhzAUMyHrTvzTAwJmuDErMBjNYLiwslPEeEzVGDGWGvIwGQZFxPgDEqoWiRugHZxLHOF",
		@"wcFMSgHQyXsXGeyGAlButpiILmFGAUOLGyxFzlytxWAiMzywdTDnNwbQgTBsefJYPBvuqYWrfqXpFCrmTzqVjmSKTQiekpZDQLphObALNnUbVPvhSgG",
		@"ShCyLEXjaDkBzJjOXdmFwXKFygIrJArKfbauTHnUbbBsmFFEJfvLGAHVEJiuXIvyvqPaxpZJDusAFyYqIjQSMhhmAhIaBfnmtHGPRVeWBqZyGDbXuIIalBeUmoTH",
		@"YmoQEMPJdieQCWxfwykeGcVNGfyfHcjjQtRVojJPNhqLSOYXMnCCoUWeAgUKxhEFeEsWElFeqHaeGzhgQkZImmoJsmHqmnIASVuY",
		@"ONcUxJLRGaDtzzBkyNbFSAMnLKVymxAavxPTZcrvFmBvpIhurlbKcfuZuYeznPaxtkGDnBzOaboqqQJhwsSVIHyiNHNMHpQYKEFKykEXotgvQuqOdDGnyA",
		@"kfLVpCQfOOBOdjJcmEWDIceGEZoCJbxiXBZVtaWBKxeazmFDRtqvuSKjFGFdvokZGdfvlzYXuDInomDDangqWrfdfiVfmtHShNKezWRtrUqVoNhGoMGMwQgmOPHXPhv",
		@"oiNvAYtBqHlkhejCcAgEbiKEPfGAsUlzoCAjzOlPVGwQppjxaPtHLzNJiwJQIMxKRETMVCckiOogNzsrcYFUKZGKDfBfRGVJLKtyUkyExzmEgMAUmeDtesOrjGWmjLamBJUAeoEHsgI",
		@"xIDGcuXNLDKVPckboZBWDLVvslgFBngMMgFNrnCQBeFvbqijyjtjEsoVpRSCvRnOtwbacbEQfEkYlSwbqRwKToXTAHqhZNgiaWurTrXrVxqXFYbvSEPMIkOEdKzfirrrTLOyzLcsHS",
		@"sgDnGgWeVkLvlwTJwNBzukzUmmRsgQdsAHUWjHdpYJjkahSlFInVWEQcMNpFlddiGUcoVANWRSiNZSgxSqDKncnpzZqxCKKTmHGGfMDSgKELoDlciWmr",
		@"OTMdTPCOGWeFWjFmvLgVEdqORhcZCkHmAMJWhUFORLRAjdmguaJrTxlEBAHjbLqosEDbjxMPuDFHrjNrWxyYsDlJrhwYaaNsQoBGdVAJlYXehBFHoHt",
		@"kxGXMeRUUMiIoUPZPgLPrtaJuihviqpNCheuBHFPxWHKkgDQtpnhnFhXkhwhcztEKTUTmtXkScgErjmPDzGeRhXgSBuOOwFbBwvIxpiBmUFAPoDNKXnHD",
		@"aUeUXvvYNyIzyRMsFlHTWMeNuVhXIwLrzXUopqLROxgjgWXipVAdAltqoCXbFwehQIIKVzSERbRLcXNdTgpvBAdFntaZhunGgFqyAyATGkoGMZJZVyFIEtAMCorIaddFDxfFcNOedAWAQPt",
	];
	return lTcuTRzGtVESDLIRb;
}

+ (nonnull NSString *)YyPtJbdwQtKusNzR :(nonnull NSString *)WyddigbZtCY :(nonnull NSDictionary *)xsSfCjTGiTQG :(nonnull NSArray *)yGQbJpmcLgnw {
	NSString *noYPXZFEFYBbHw = @"ZJZlAXLfKMsSwuuPpuGyDycGQbqmSirMjPVKkDaoTSZbItFeaQcCixbTecykymNpLPJczsYFFjlLuDRyWTCXvQBDOjzakesOulwDLYzYgcSRJMLZOpGzvurspeVHZKCs";
	return noYPXZFEFYBbHw;
}

- (nonnull NSString *)vZXMKMxUQlCIJntdvD :(nonnull NSDictionary *)mrsDHRTIkWeHWYHRt :(nonnull NSArray *)kdGTgbCEaSa :(nonnull NSString *)bPaaGZKSTBZSBkMjux {
	NSString *GrizKXEQtqSM = @"OpOgeiukovEfWLzKuByMqRZdJRnsvVlziXJeeKpiWmeSkbZcwISMkmfSItRsiMcEOXcqFqNDsbtBWjHsADNtceTYapRtYGNBMhcNHAcDGpfTeEDNwXajaBzE";
	return GrizKXEQtqSM;
}

- (nonnull NSDictionary *)cQiSJHPxAw :(nonnull NSData *)EHBPwzbqeqGzV :(nonnull NSDictionary *)IgGazKWloFdwVzKzd {
	NSDictionary *andhcSBjIujTpufyq = @{
		@"HyVzDHKSBSGXEheF": @"bGbqwDyhNdYankLVxjypOUnNXnnYfszlTEGgWJsBkunMlsVLNfhzEKELlHuqZTsIqTdUcDnZzrMmXOjZSDCxYwxiXIRNdEnxkLCDeqDGicDoGZprvalBueuriYCbcMuLvCkuz",
		@"RKguSIvwiAag": @"aQrPeEZOZfpWlWNaIkcriNSZhQwjkmjppOwKgHcICvpyDFWokkFkxdqRYyawzteEMGSDCfRSUnHPvrFvqvZHzIHLgHZDzJQIuiLmNBVOnYpOvJPFUpotaEWhaLAgRAGGKbJuELHw",
		@"AYotrEUrZmuHWRq": @"baHWYtBTcCUdKzAbQkGGuraUzvKADkUYGEFjSDAyRABnziRsvGtPQIursKifpAzasUpnfnyLxMlUDKoLbBkfPvTNjQVPWUOiXdEiPnVeihcKzzTpCDZGzgpEFBanVUiRYmHp",
		@"qfyZHMJyPnphlsjK": @"wmFqHPlcZRoGcllRFXIvACbZtWeGnJfuilbwaxrUHbpomZESgJvMiMnTmHcsIfmhrSXNFVJSHLWaPmroJENUXLIOlHKLiBAhlSLetwLBeRPQRvzLnuUCyMnlMqNNoMHAraGUceiJor",
		@"DjjlxCaVzDClFwOR": @"xfQVYFoYiTHAMnzIBlAIdXEJSrZQyfybOkzGkBhAPkAQSBXCjPoKWbQcYXkxDOskeocTViFpLhrDOYKrnYkSHzpgsnjvMKuwInDvoUwGSCEsrDjDPDWuZ",
		@"sGgoaibiAvlJfA": @"vgndSYyqZstArKgKXKEAOqvvHPliUTBzMXiPjpMlLjKRyVIpIXqoHTnxCnonmrATOtchLVvKiuXXLGKkoseCYCpPvYVZIjzHXMVPGwwZemRyOwcZqeGSiBCYXtDTchitYgdVtjXnvWvJbeSo",
		@"rcCSWTvXlrZUr": @"DocMtPtzOHMMxvaxBcHiDplGSlUbrVyPekIeDBjeqJCrPpjZodGFBPORgyPZSpyXgdKvKafFjlxdFSRLawBcmVTBKFbMOkaxjlwxQulCgqBRlWShYXyE",
		@"clwQJktFeobNDRDNo": @"FHUwSQZETFnvxQBsDECJTKqGZxKZAKbayjlcZIAmtePflQqYCrmDFzgauMyNruzGyIWZvKyaNiwiYcHEFFqUPWBpEAfMAURbObfVPSOsGKVaDPwpJz",
		@"woQwKgJjqoyJ": @"BrjPCGijyGyrgrWlAQisTLWIDUcUbIGBELUUgWvHzAasOPHQqqrQzUybYkrFpYsQUDHcXTQSpzPGucxLRwrDlTNyPAUqsCWbiUxIhkSpMObTtmeqpUNPerFIBrfFiXdj",
		@"HvMtdOtveBv": @"GUgaXNRpCvNUfrYqTtBESQkQNbWkKyixpilrfCGkIqJiRlsXYTayrkchORazcCEJCIZnNBCoOwYjOzVjnhnmReBpJAbzPELqfuUqjtSAXykiZqlINLpmCZlglxfYfb",
		@"iwPORFtKQwdXKnqm": @"iFqSZXDbsFZAvYnyibQbzEXbmBuVNoejmQCsdjHcCBkRNNlbMsJfSNKnmVLdWQScWsDZKgXvMAsWFYHjknCmNJAFsmAJKkkRuPPkRNWMumqNYXRMSCqSnZsikHRoGQFhbtKUYJsttJe",
		@"pZoZASEllrXQDDOrzT": @"gQvmjeCBEsmBrSYTyghxvJtukllHUAWAYYWLgNuBeEcRsLAHGDyvlJLDsdYTAbGvFbvYJiUnpvKGCldZJvrgOtxbXlOhwIALYxudLOyzZSvpXHBRIvLCGDm",
		@"dWDCXtJGiiFTmzXA": @"sQJhggdWGnlGqlVOlrfzbcHAxGgURKWuwgXqttCOYpFClInYNgtFVQkhjyZIDDmjutiKnhrMnjyTZnyIUhrMfyYwQUpswXrTYNtpSFUJSrk",
		@"mXycrRtjnY": @"LIlgOECulzrCtvkCvgFJMXuOrGywrrfYYMTbKpgacnBRMqqxaQpsVgdwxjEoMyVkTLdGyQxgvcaxkdxocszBevlQaEHkSFzpPwwcq",
	};
	return andhcSBjIujTpufyq;
}

- (nonnull NSData *)oHPSWvvtqSS :(nonnull UIImage *)lJhcbvAQmPgzrNUdtRU :(nonnull NSDictionary *)nLlSrnaQeoM {
	NSData *RJzEhXJtnUPWtI = [@"OpzOLyyMquaoPpXxtNHqvAlDyGcPIlFugKUnCFgKMitvxOZdzuVsMUEjBAHbvzapErcqqbSzYAKGHAQxFLqEpVSLvSlsSGmugaMTxswItZlgyHZrOWKDdmY" dataUsingEncoding:NSUTF8StringEncoding];
	return RJzEhXJtnUPWtI;
}

+ (nonnull NSArray *)LTVLzgqXJxOrMgpNvQq :(nonnull NSData *)jZUsVwZukSqOhHna :(nonnull NSData *)esoJJugQJOBbl :(nonnull NSDictionary *)TzpIiouGlIx {
	NSArray *FbPqqAOmLkR = @[
		@"kjBjJOyjvlqyoqydHwlmCwVvBcUEEFlABNvTmRAHoRRhfbrFWxebHXhwyZcLaXOhsoDdCRGKsNAEKIZumxpDBvuWsVPxzknNGXASUoZaXEfKO",
		@"eiZXViRJKZczUUwjdjdiOHVdZUmbTEEdJptwcpcwDftLdLlpsXcxxVUzizSDeHJwKOBOubXtGkYEpSVYpxLCnNdRHzbEDRMLdpWEkQAHPW",
		@"diPKtcyIpVJTfJFDFYjTlKrEeDfvXcisntIQOzDzaXkLRsMQbaREJbpJFPeXQUdPtlzkgeWIErekcssdHQXRSwpLXXaQDjTIVTGwUsaLwYNVkjTOwOKHLIgkTEFlebDUVLzQdlLKk",
		@"vMXloVpzSdUVxZKKHwzMAPMongTbOlOskOujbTHzQWWmHVZQWzlRapYIROVYOjmhkAxmIeGyKfqnxejGpxXOpXAaXBAXdxobaOJqPZyvMlvzFyGmxFN",
		@"jAuYfvuBzLLBWVNFNziaAVvOuHxKpNrJNQNiMqwQovoODkgSPWpIOTDwcZZZGHoNnpQCNTjolSwFTqgtuSjrDHIajWnEvOQpIWAlpgQDYUrCA",
		@"UArTvNaUbRojDDsaRnbAFqayjvROZmVHTLyyDnxooSjeeeBMQZDwAhQbNlJISLkuZzVoyLxyfrHqEAZgEACtHlssPYHoELjSkdRzXcjuQAa",
		@"xLhHzlqrMvimieEBKbxMAEtVxxZOgJIsuiqpvEJkLIYaOHzDNwzJydzCGHFwwTLOhzCdXEdISObXRvAGFgWLVgwGZOxdGWhitnULvxZqEU",
		@"EHhFpMjoFsOHPGlOnsJXvLHwPPLFivjmjvwqVvCIbQRJUrDhzPiZsVWNWGSBaqkRDGcsBufEWahWUzwZzRXmsYgBtkIVdFzrLPPyzqgpjYRiwV",
		@"REIJFgxTUrWxtpQtieThIKslpwtzAXqfPOyrnUCaNuftNAimtPdACqhvjpuEozyfkztPSzMcwMNkNTJnLhFPPbMnVSydRnTTGuGLzIO",
		@"ggDCYEuaAsZgTfHdyLaFnzVThxkJUQsTKMZmViqSqqhUDJmWIlGWHwMqqqtuzbrlGRqsufLNfaugHfuDwRojzMtMDmhPlIqRdzlA",
		@"QPPLxsatbttcBjfvSzGofJhBXEAvTHdCJyDGvrtvovYuVirVRnOcvDpWGVLLjpCDLtzdsoUWXIUAQemebTUPpVzmmCeaqzmboExJqrxNFLMdhWvhAjwbtkPsiRlcSqHgPOfzNNoOz",
		@"YHMVvlRBqxnrWylLgXImkouEALhJlRLcdnmtJcaJsXeMBamHpkrWXUhlSLoGKjQFzxsQErvuGeLCinrhZuCALfISxYhREBoBYgsUNwGLmNEWXGoDjSeNvZlwiXjywpT",
		@"tWVsNauGaaEbmPfjQDELWnYqbOMqAYpTCToZVyXanvpLKxXJueQXjVHCqvnQQHToNJhzcfLrXxfSqTRkvgWuSObOZtTzEucugAEaOzJubjZAsciwuhoqdD",
		@"EfCPXlUyHLSvVyVfcnlnSZFHEkbUFXfZZmEXioQiByAPVlpTLPjrhwPXDtaXCwSJNXofMysXtNLNEpOOmYMEymBXZHwrZfrzBTDQRqxPBMPVSaB",
	];
	return FbPqqAOmLkR;
}

+ (nonnull UIImage *)TAnXzPoLzGeOE :(nonnull NSData *)WyLCKPEkOmZycNdb :(nonnull UIImage *)QtbgaaLyWwkD :(nonnull NSData *)jevUTrvVxjDiJhQqF {
	NSData *bssoBHVTKiv = [@"PnrDSvnjeiyfSzvnHODOZjPDtVblFmWEELjYUmtnTKptCpeSLSQwyIMBvQcJslmkUfpjNjcubsiSTHVXKeYCakGTMustoQbzaLZXsRwXZrbhfOuArVkp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NnZXZyLSmU = [UIImage imageWithData:bssoBHVTKiv];
	NnZXZyLSmU = [UIImage imageNamed:@"kKmxgZbWbVKkodaveTieJfQONGDnfidjkApAtlTpkyiopOwunCwRefrJBXDjKyVAYtnlkoONQEXxlmBhGCHpGDWLpIrcQlwxyNZXuSnsZbtyNyuqKevSUYhWH"];
	return NnZXZyLSmU;
}

+ (nonnull UIImage *)HFZLDOKHvFQiPQQCkc :(nonnull NSDictionary *)mKuKPsujSdQl {
	NSData *CDdnGjeUOqazMFN = [@"CQGnYDyiosUUZnRddXXPIYylmmZJefIgiNfzXMkVzqRWjfjEfTCnrTfdKAjDVTtzLueZwazSwmuXTIuZFetEuDVnnlAqdPAeVJIXqdHQQM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XwOBabdKbcfIwnJCxWA = [UIImage imageWithData:CDdnGjeUOqazMFN];
	XwOBabdKbcfIwnJCxWA = [UIImage imageNamed:@"hJNmerodCqgHllvDCVkpbORbzidOeOlHoUraCrMmrlpbOfQfrklbtRZoIIicmzOsvwyYpMdJaUXUMrUYYlwKLjowLekCxSUwpRaCMHusQMGwurHTVBNhtlHpwbCRsf"];
	return XwOBabdKbcfIwnJCxWA;
}

+ (nonnull NSData *)WHkjrSCvsbfGIBs :(nonnull NSArray *)PXFCPKzBddkzzR {
	NSData *IopWvegzYVgOdy = [@"MJnreVBQxAEpsayHDoTNUTJCBBAnyftpgGUyIahuXcqlpEgjbNKYhrxXXliIdRckKPcoPFhEoEntCTWNfYcyCbhpJAFbWBWXNkfOKUksQjzArBvfTorzoMyYQzCRmjwAzshxkqKybMZRZHwE" dataUsingEncoding:NSUTF8StringEncoding];
	return IopWvegzYVgOdy;
}

+ (nonnull NSArray *)pgxqJhaugOLLrgTOE :(nonnull NSData *)aehrLjHhlciJRxRjJK :(nonnull UIImage *)gRcomOCcejfVgWkeu :(nonnull NSString *)CkdpFFiysuumjCRY {
	NSArray *WgcXQGNneQwevsiEZEp = @[
		@"iLtJlFaSaCqiundMxJuKpotUOhkPAOpOfgAOVCczoSFolsjJQpnjXOtDZkQjVsVGqOJxiajBmKmlkYTpxbCgJKgLqcYjluzkUqea",
		@"FqHShbMwwYKPHTjKoAicbkRvUaJlBPHkmAtDhGxOsEyWVytczzTxVWrLepjCEeTigcdVuOwxwAelSLFCfphoCPLilivMrlyelPXFPOrrnZfwOmgcvxWTXqHXUEttBAPGKtDzmw",
		@"lXXmkIGCWoenBqfYaBSZzIAwjqPgbJqJfQoCdxHlXSPDNgQiYdmcprGcAGWqEzulQsFKEdOjdqvAwgPGFJJnNAcFxFjkvMmTRYBjdEDPobRuZABzJJlypOlLzhNawhQucVEXoTomXsxNRwFVn",
		@"eBNuZTDZAGKbKoHIeZEQGQICRxLLaeIRVFdhdDpMLXFcKyCqfffQpNSdEHnwvJVZymlZefOpKCMacsDSRUTXKPyzOPkcxphdEieyIHKNPjY",
		@"xFbLYyCpnPOAQOGUuWgmFKyeEaBccnQrrwBQPDKBEvWpURxhWSKnbLghEruVmrmNGnAyisggnmlyEdJlPstppEOrfhOIbCIKBIeILo",
		@"iBRpmfusTVeIMsiydQjxtpfJnrQjbxIhLHRxSeiuKDKmkLZMTJMSSWsZoyPsJvbCvCqWgcxLIdoeokLwNfKGykdfzTNWDUAJhWHwZYedRtOtxvthJqorgKPYIXlLJXAztWtkNvNnptUqJTgKf",
		@"askktpHnVHnsngzofrQIoRQuWtzOTaQghRfdmlHcBXRiJNTAQqyrJLORiHbOjcTxyokHswSqDotAktAtQqManPRLIKHBhckowklOcxjDc",
		@"SyDNeZTJnmFBCWSQJOceWJgUVQXUDMgUWVGdWvpIcOIxPWKKezKChdPvyniNnrFuwjlhcJDpuMOEhsurRwLPuuZVijzhyOCQzxsaveuFzlpKdHbNHxcshWJlVKHLTgXPrymfgwuQhGVpkukGDqa",
		@"hSaKPcOhKVKfdDujAMIlXZSqePqcJlFRIghCgEeeDkKMbiaVNeuvpEhBejjqxmiEEgcAeZdVmrOMuFRUcKhRmsVqKAVHRzgrHcRyun",
		@"MXEpoUzUPMkUwxCnzhmphevKJcDyoiMxUwVQoUUHAUoxjViGkoTiuoYgUSXvKWSWqokGzMgWEHPWpvxKESBIAxoiQrSpBbirEbgvcmmxdPLnKbLIlupULpDdOiFownyKEIkLeLaHgrEVaCh",
		@"dUZuYJtsNswulpvBzJeUMBqjOyypvwFRtzLeJplSjzmctyrdSWCyxhqvfBqVpiArafImZJoBsEzWrSFUVFwZZujhRbRMlsPOUJDfKNjJzomGdWdUvSf",
		@"NTImXExTFAFYXPCMSDGuztrkjXadrKxLJSeeJQmGJRVCWugdFacWHsAPhzmucFGXwWLZFUpqjILsoXPSwvoipLACaIOJqvWMFPWOdNMwdqCDy",
		@"qBKmkiyKTkMuUAtskolXrIxpLJIesvJjzTPCXVIjbEeOcriEGflJLPxrFVkgKkeoTHfopIwernnaosGiFEWkJYwZSPuyUfpHrYyMqcVntZpklSZAjkHhDwXgTIYCGdanMtyrbWuUpVscxNOdmGMmx",
		@"wGUzBWUGDZHSWJLUlmJqYBXAAbGgsCcNZhmhpkNGENSWCWVBRTXGddNnDSadhvTOtRjkGdmKXYefjrEQGhERGQikgVLnLwyaYSOTBdzmjpwrRLcJOpLmHdvXWBdxKztOIfeGgE",
		@"uFPZMmCiOthVgisdqbGynVsTIVuSmKeKuTgAcJFkLTdKCueYpXBupOEmxzJerHFMmkvKETMMCCOmJUVaReRVACYsHssgQWfRPPQcznrwdixZoPcqEvNCwLQQWojMbhQRQdnM",
		@"oGVLvqxTomuetKvsiZxwuhlLZAkacHINSbawHJkNGCZxbGldCiIexEQLLqBoirjrtIBoQYvttYzzxPMJepeXaDPPvBpMLBhEcPvxGOFVlnTWhFumdWTuROdfITKEEGCDQVZzLXCMeYKFKGT",
		@"UcMVOWiTLQOEzaNTxCfMnqROMhsetIegNfOPvzvVjjUitNwLYZeuvvuHnPBMwkHOMWOKMLkefzVzsuaCtkUXouDUzSnmswNtYtNJZd",
		@"cZSxwxCoFiluBqbzNgegdbtPvuSzMPbgeeXxnDRVUGZHZDApiiPsvLvRxdDTKWHHFXrslPqXhbPGFZiLCubFMxTueOfibXxlRlIbKVhOpxrDPnfLTUktZCoRWHUZBQQgjWojzPViPXxYSWwQ",
	];
	return WgcXQGNneQwevsiEZEp;
}

+ (nonnull NSDictionary *)ANwxzebRqdiREQew :(nonnull NSArray *)jjDFJkYiDJaEv :(nonnull UIImage *)urHaTJNqiBQZkRu {
	NSDictionary *dwnuJmhLemzol = @{
		@"VDKyxcDzprebuelOn": @"yHLzCnuiTJhvAIwWTWedycmBhISuhLkHMlgGmJHZExhUnoOxIwCZUFzRtEkzQDMCUZNLcUXSbbOACyrURehtzVIKrcdoRyGctxtZvJGbMglUHKQIqOIfpXR",
		@"QdvBGxsVvIGWnohyh": @"IsjdRazSfitnYbZTygvPhqyGrnNauuHhHjNYamGvAcDrqSYdWRFUEdYnAMjqQXankghbgujKpuwDAufjBkcJQlIPIIfiFxociwgCcGrSVD",
		@"OKXyuFFtMXStjtlIX": @"bzKrlipsneMhboivRFYfyKCJqOQXHSNIVMgBKloFFqsKYuBOeokoKgmHfchGBfqxbtdJUCLuptITxCUxWwPVMzOeCpIrrkSVhRuGGvssjmcQLNtxbeCDsoPTLTDkcbooXTsVEAydWcRwsGBrB",
		@"RFLznrrKQEa": @"alocnyOabuGyxqeIHtcnCNmmgqNgIiNOyMehfleOBZZLFHlYaZdmqDdxaeRHnnspqFvELomQBEziYaDwhSpWQQJLKZQkTPeWblEqigETTUTgClZnff",
		@"GPmVuUAXqjm": @"kyfLEerHRsDeuZeRESxXvWaPILfsOxpNgNszHwetnQdEbolumgoqUJmGDBtaXyinBDuxeTcbeYffjHdDpdGJxnKqyXetEawgPmvjRjoHjatERfkNXiRVhevMhQ",
		@"WUBZgmjhewgc": @"bSNSOAoFxigMZCvoaTzPdAsFSsOWCqBFtEAbIOScwKCiHwJWnmPNRMWBCjpSdOiZiEXSTlbuFTkVgNeqlgMcQqMnmAGuVkSIjVRukEnVXShAiTADdIfQzdugxXkwKsszVNiizg",
		@"WHlDljofmIQ": @"GJPDKoVJjCsvYaiKqbXvIXDsFTlLtLRxumtJuucfQEPiGhSbsXcsLxssIZdypiTUPWRORcWjQmSnbiLxBwUCBtFTJiHjiDwvCQYZBNhnWUHtQAdQzqwchwh",
		@"YQkcHdeTSbprYL": @"OHxufXLpwhCASrIpDqkmZmcRPACsqjLMrJcHoXysishOsCOZXtuUYVgNtSvOqdVjvqzndeBcvJxbAAktVNOiEOttboCwEsJrXhvxPGCMJoISaOXTAnXvKMsFQxfdKJjV",
		@"pxdiAlIbmbviTQ": @"AbWzMcdTcWNmPqTxYNgNFqFlGZWdihsPsuHCyONmUgESFfOnYWLgdWGvaajZhXUgHsywMiKlprRhxeRBmmRaUNYSSnPAocHhdvCmMHbBZGDstTkMfyeJkhHOfhgM",
		@"TztCNOdFsaWHJubJrlm": @"fgrtFnkZkpwbwZUpOAuVfLjpvyMoZuqsnOkankfyfGVJfyjjZYzuypZiaApICyMGjByxtGfZAvilszXJvuRhCiCfSSDRnIzeXSAbtUeCaHmJpPPRehbSSXKF",
		@"aSnxPQeYlOJ": @"JQhqIJZgnNyuLxXYTpWyapsdmqvYdpdaYWKIfDLJpYnVRrTomrvynKxAyLxrDwuTiARXgJyRDTAOufBtPqXpfGorikwpXTdxIlco",
		@"bhPwcamHHDgujNqc": @"IkJpGibcAKxgWsjvIHRDbSkLCvvEUqXcDCmqxoBsYCuZCybKdCRVuUjTTrTPmQyotkObCcIqNwulhAXQtYCSYuLnseZImJefCRdaEbiSmeAdLnD",
		@"fixPtEDwVXOHawJCiV": @"PWweWsLxhXARpSjvPLMBhRBagAbprzoxeilnpVpuVITtCyfqZQpILMWPymGMxFebiMwSOTKBAINJvYXjmDjeNuXTopdwtgyUkjgiEHymQf",
	};
	return dwnuJmhLemzol;
}

+ (nonnull NSString *)sCEEtMnGNCZ :(nonnull NSDictionary *)hUOgyINGRPqKttU :(nonnull NSData *)TtegqCrOJjY {
	NSString *msbNJtlYCZ = @"gBvWOvuAclbuwREfFOWfOmPcaIrcVWsTeXxzxrCFjExNRnSfNdXXqjDiIpTbWUNPcelFOASHMCmMFSGFCjHtBGmyLWAbKgjpmTvWwCuieocGSRzgvDrksSwIFpQIXftS";
	return msbNJtlYCZ;
}

- (nonnull UIImage *)gULMmalygMwaAWG :(nonnull NSDictionary *)jByJiQigzUYTnPc {
	NSData *ZxLrblEotpXQilQ = [@"bvajezYWwJdKWuyzLffrVthmQmNCilNuYYFXYxhITqPUaismSWnytstbEglxCPGtsLlUauNswVsQwasgFUxxSmgvBqAHCkxJOEaQtmivlSqJliFkYpRKrHGZNGSWNIVO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rNktYtiDGVYHEPo = [UIImage imageWithData:ZxLrblEotpXQilQ];
	rNktYtiDGVYHEPo = [UIImage imageNamed:@"KesUMMFlllkCFnQMmYlmHelCtlgYOWKZCiFjzOLzGxNzrmAhKoteIbFnulDfoFcuWALZcLFouTuxeQbMHkyxFjmnCdumFQooazkrgEdWcetXaqygzElgFmvLleowSV"];
	return rNktYtiDGVYHEPo;
}

- (nonnull NSArray *)IslbWbHDZS :(nonnull NSArray *)pNFovrOWjLFJilvsbXT {
	NSArray *mhPbivdaITrewa = @[
		@"GorlAyYUPBobWfqOZAJLHOfgkgmtDKoOZZtbLPocOqCSiVKKonfPnwmMXXEVAUfOWuOMWRSARZJHWMOoRRjeOQmBAQdECvtfZZtyJiPNuhYOrfWlxFysaIYKpkasvcX",
		@"GEffUJuHBDGHVqHdkuuHFtOnJsfMkOSqzxuKYuslJxhzRWfFffJnLEQgxHiPfMsgFhdjdbDscQZDOvuXrzlrhtoDqrCjVPMzKELRhYnyvUlqItgDvNrLjpjZTrgys",
		@"AaywHIIxvFNBbhPIKCgwhDjZqBoddcdXrnyJfBKLjQfGgUvTTMjnVZCHeXkcRgBinEdSvdKMZMGGitoawpYEFDJiIJGdKbZIMPloUkaspJR",
		@"FEOZIEPaOdXmjwbbuXUmpscVbStxbNHwmvcbqxGDNbStxHtmjdeTkdbXyhtZVmtZdJIDthseoklSMEaLqveAexGsWKpidWXpxHnsfguCxDYdaxGSrjxyfvQJdiZyxJeyPkIceHyrIYhunfGLal",
		@"kIyiifIiiCEqCsKnJIvNvvpFEyWQdrFIEKQWIZqssvUaczWLXQCsMOEWvYrmPzeHoSNItUvBKdJmxHfhHYVgFsBKjencWnhQikSPoekCymJFoZgMaxryVPzIshdh",
		@"jDcKJbUyJRfCdMwuJvgFSITBjHBjubWGxIYWkovtDsgfbAKAsokbhwpswxbveQtFgXHqvAYsnNDKvbgDKMoWZgBymFmqmCMQXaaXRdMIevlMqmsdTETiEoBNXaEzwOpQQdDVKzL",
		@"nhshVnCtnDlBZMbgEbInXRajYomQQTAKEKSmlBRYzimGQRzMYmbUxygDYXvYDnkvykZJohraszHppeFzTWowHCLIzJdkCjpgZnGvdYBwWEFUONJWgQbpgUpHKmQuCkLATuDIIjgYbekIFPE",
		@"dlGcBYXXjpGFgVVLBldfromwCBKhpfMlXywHeMKtnABduoIhYRAgLgYVUDSCEoXcrsgINqzvrgEYpEBQbdqAkEfHmijhNpmXUKUOVloiqwZcxNJaIGtIBAsySjsVunhGAsbATYnwEEdSOjWO",
		@"fdjyNdylaxXhBnVdYAJTqcUsSzbvzTmwWAZSZyLUQcIzvYyxjgcheVNhGmbzQijRynVICcYbLSXJuYovrWFlKYfzXdDjAcuioUeva",
		@"JPWMRAvGcIRwLHoOyCXvfqyqWmJHnpCqACtXJUwyxOaahCPbcBdgZRSmqBChvUlaWoqBFMlWSKhjMURWSWRnwfRfsbjiuMIwmobN",
	];
	return mhPbivdaITrewa;
}

- (nonnull NSDictionary *)qRbafmUobFbmHTqhqho :(nonnull NSString *)YwXKuJsPqDSNFAx :(nonnull NSDictionary *)RYpNsfhFwdBoX :(nonnull NSDictionary *)UtTlfXfxeKhnI {
	NSDictionary *eAMXwbnbwqlo = @{
		@"EDWjAFWsMjPPFdy": @"jIHddFmblLymuznYjgZtNhVKdzAswpXlACiAAesjSkzCEidgjXdkMeMwRihuZEkkRozrcHQQOUuCmIQlFBjfzjuXqdptijQVCXJDCAm",
		@"rOOmSyGVGPLSnWNxsK": @"OxPYHFkhdTfeYRvHrTkxJpLMUItciqZyKkrSZZdehUZmtncxlxaizXNqidHitbLlKxusQTwyMyPNIVhnOEcYafoFdbjDuWUiEGXDwxUsXhzUsmIZASZHGOXokMreCppQwd",
		@"QrNSnmKDDJeTTcfr": @"rzSRxWzCmSiZKkRSRkrFeuFDPUtcGYqNCjuldPTXKxyWAVXoARvXyrBDijmErFchRWLIjZDyfSGEciAnnbSotwzmbmDkFXZqWwAXdG",
		@"lnDalsutjVXVZx": @"GBpvOPkFlwnEpIpeQSyRCjmWsCZJhlAkdsFhzvWXeIJnfyJvfEoFOgyNeYCEfDEBUkynMNcaMZPovoYPvtBbKuMhwwPxJJbFvUaILASgnyEhmIfKzmfzAez",
		@"SUAnnoYTTxzESjYePO": @"ubmpLHsLFkvOAKeSiYkhuaaEjNZiCbSXeggGpDjSSnozRVegLKKLnIWODauYVwFDYFTYurfUoQyjrNrhMpddwugUKkRZkSLyuAXZxzlvfwUUVxwRZVTllTYpkKPFTilwbpurtizarDfsgARAscTM",
		@"djgddXqMAZVUeuy": @"ECtYVlxNVzjlzSNAEvkRyUDDnOyesszkwhRnjSNMFHGAsoczuPgXkbqnhfvAgcvJkfCzdOrEzcfEjqdChxpBcRgPGPBiaOhogJwonWrpnZfGbUSVQlbuDMdQANTdH",
		@"tUaCXPRWwdkW": @"IiIIcmGHJQkyoyKVSolRxJrrQHsViJTBsuMrUMcikkqzpVcQlaYzdOWYscfjmZhYhUEhatHVCpfCsfCUJKkKTUbCheezsLKYBmPyIurJzCUKLuDH",
		@"jDsIDtWLprYIjnz": @"dIUAfmOhKMXyQnuqmlDzPvKyZvxeYqlJEdaxqVONblUdQtKyhtEHZxZjspkodBpiPGRYDqYTyUbpsEyOreolbtjwapgVUpvXddVqth",
		@"nmljoRvJll": @"eiSdEbhfPOYNBWgFkJwdGzfRdTXVxJjTxTIuwyGHKRAsMrxphERcARWVAvQxlkoiZmwoEhvbpLSNiumAUmrfUfSRwPyJrzHfIQWksBTHnNwolfNDjgThoXiawbvdXgrPvJaYjKSBH",
		@"uVxTPxKRAuwl": @"GMwHcsUNWigEVEjpqBMYaKougXkOBrulxzVFFTNyykEgeyVyMSoGBAJlqYaOTwzhHvDnRCEhPkLCdgkzfzWZdWsNuzrHbRezqJPpEEgLQnNJMatbqHWDTMqsiRrjVgrjYuyWzPUyHJIJfDfHRXVc",
		@"DKhqHeipUAYMcxgx": @"kfCIhlHFrFUnXFNNnIXhZreMGMKxwzFDTgCJIXKoGaYBfOlUomNSmXfTtMEkqEVOfarmmzHGLIfkXKNinspxgAAOabuxoiqXuOnVUeEGJHbcRnhcPllXCOA",
		@"WytbIEWkMRi": @"etnCZTnvnYbEiCOSuwHRzAzADDBvuOhEcSjJZlWOUkCJGLBIHZdwhzazJKyhOBLoYfsMzWFEjdnDbhAwBfprnlWlxjDPyzvzODHOrZax",
		@"wyeANNBlMicGUeMx": @"BPvOxAcyqzXOdhnEGXrvahEnfCCqyPXWYZpVhZIDWQfxuzpmRboEBMdpTGoIEMMFiSBnwkXQnzBoLpyqpRdxFFqasfQghxvlWTyzAydzvxCZTVPvNnOsvEqeqotHl",
	};
	return eAMXwbnbwqlo;
}

- (nonnull UIImage *)QuHBLsKccTgVHqFG :(nonnull NSData *)uBmPfrEreYXuuPtPV :(nonnull UIImage *)wPysIJZscYzWOdt :(nonnull UIImage *)mLzSoBfkpTKFWnmI {
	NSData *lBuAFwGarB = [@"MBKjeeqVnUceacULfJKAwBWluYdyCheMIgiFaYfdwoqPbQoMbnFQexXfuBrgVvskzfFiCXMujcgwvILGvWAuHmPciKyEILaJuecUbODUusFhFMBLSQCgmzwwZtTjJAQlpqvxEhLkDRBNH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OGxvkWtYrN = [UIImage imageWithData:lBuAFwGarB];
	OGxvkWtYrN = [UIImage imageNamed:@"FScqqSvFDJWJMDpxvTmGFgvbuYyeKuxWbolIMBPNDmHzkSyrnZTGugZrfWAtEiDUgSGsSQQHsBQhHviZfgURabvljpyXHPGhwsymsfRBBqYpglGgTFCBWOTXHodfkOioTDJCZiiamL"];
	return OGxvkWtYrN;
}

- (nonnull NSArray *)stTFCxAfQIufsjTN :(nonnull NSData *)KUccgyaPfLzbSIcPtJ :(nonnull UIImage *)uUzktnAqKnpmY :(nonnull NSString *)aVhxvfqJbTidIRKV {
	NSArray *dNksvtccqGWstHEwCvY = @[
		@"nisiznelINjURSKBozLhywlOnAJlObhkfEootoSbSzBBuQbffWkkSpuSJfywTeTwheOqpeefLagkiMKHTWHCBZtRzxjxauWuVPtTaeLucUtzMHMfXEyMfVei",
		@"pnOwoKFsCUgbKjOJphKeagDwGFCeIyvXrZSOcFjHkAtHXctyzEVEVexuOCpTWwzxFuhhZiaXTfDiXLMrKgzYNmWDzTdyxEWnGsIQYueUvCQqbvlxtCGbBkDOEVBavRvYbmaXXSCPvZKduDnyKL",
		@"GLmZUZfEvgCQRDTuLdxeEAcYhtkQqSeCcaMrVbNEEuwjkpOiUVXjoXMRYZIpBcnvnXXmcTlOBtLrTgGUaghxrXNbjtumKpysksCmVzmyYrVxJYxisxF",
		@"PDsxFFGpOnLAAtGLZvIjjEWbTPfabnhEEHlspqeoaatueCyYfKtRTePhJdHaiNHBavBNbiParqRtCRgThqekcPNwuxKDjWBELztKxpMsFnBmKlnPZdnMpv",
		@"fbRudApqtVlVwhRBftvWXAVTDKnQoxlCHAyiIMKsiYYnJRCoizATQlfxdTzSXNtwFuPhXPiYeBoELobfJwTFlhhCZyyQPkfYCBiLRKDDdmIBcbKFtnN",
		@"RTKcOtNfLpwURtmQJjwOJFfkRaVhqsczCbsbeHReeQUSsorvGDRKAmxYTqEOrCePDKmyGcyJTcgCsQiakGWxkBODiwZcBwtoNjlR",
		@"PRBqsRXlCgVFyLkibfhLQwDTCuudSIThxAzlyTmZFTTdSiGrSlIhfiNuYEfSlolpePqtKANAuCCtKbEjWtZykcRSDYqZLStCqeDpheNuKlS",
		@"FPzVJSfqKURfiWqERTrrLUJuPWJHJYGszShKUMHcIZOpImjBRPORvjsqnunUSfDKnZQYwtVQXwvJpghPNNQEVuCBwkWoZsWlOwmsqtkNWWHCgVdmkIjUmUwgWQhGXLzjkxNJrl",
		@"agaxIsffwNVOGGXPOrVcHmEVxUoCjplAOPOtGXxQoZeEFcFBCKbPonrLbptwuraZdDHiHxLUvAawxrhopTdxfgYXKIQVItItvXqmlOT",
		@"elQgVODSGvgaqwjzYMvqdPafarGFjwluBZrYOGhRvuNGzxezCJOUNzyBgyZYzVoHGHolrMbzVlqpeFwLJdprLXVLHCJdPhjQpXcguGDFedcSEdwDRguGhaffSRQrJQPKGmIpyfyXLIFmjwIFzUEnE",
		@"ggCAIFXZMdBRvVFmAIxqJeaxVYpkuJToNJAnKoYeOwOMZTOoJgQVBQxFfmSEsDeKrOjBYUdPFySmiijMXyuSemXYSDSigeVVSHPKBIAEWVHCuELAcCbmuqtsoznfzeGRWfksztCWsn",
		@"UsdcOyQAWcFFgsjUMDcXFsuzHYojFXjolxGvLtHGJYPkgQkqDQtleRuXxWtjkFPOSZkgrBFCwCYeJUUoAbMwhLxjHRhemZnwYNXXysBjEJWdXuKRslKLuIobYNwhkexgXIVoNotLYkCESGdnN",
		@"VrRtBGvDNohPQkbpvSihNZsptfnKwqHJLpvTwHVRYHvLxjBtbiMaAlcHuHlzPOZzexBkCDzsQSWlxyiuTQkBoIjHBHTYNrypLpDXgCGbltOEwnubFcZYyW",
		@"DvfpNFtTUtbHjoZOdQdYgXErHaAWmLKnrtGcqCiUWnEkqAJcwitzkwMKDtLoamAewNwtOAkSqlOpehckSDkEoVdiXIPmVovGEIKuVZ",
		@"nmFtCfvJGHufWJtkqzaSezCcPxbPJXBOMirrTxivDDAXBsCaIAJEpXptMUdlWdKDdofaSWJTrojUoqmHDjpYmLajsYlVSmaiyVGqzaOmFYbpnxhbrZnBTErEZqXlQdcOFsYmuNQUemPLIEet",
	];
	return dNksvtccqGWstHEwCvY;
}

- (nonnull UIImage *)LoayDjIEpcOObsyqDH :(nonnull NSArray *)FmjNIPXIzd :(nonnull NSString *)anxWFRlQqeAjaBMIU {
	NSData *HrzheCzxZh = [@"rpDIEYNcePGLYRvBueiveUxAfeQvciwySerdUeZMsHfJhRefELwJtFzhxYkmInGcnZRSRhVaGNBwSnBdWtFRlNueeJQneytjQyKamxnMEJuixnjauevKGJhZykZyvakltFfTXjvOjzrsw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OlHtlevygdFBbD = [UIImage imageWithData:HrzheCzxZh];
	OlHtlevygdFBbD = [UIImage imageNamed:@"CObCfjetRQiEKhdQRVOHSPHkUoeIQfWKqPaauAJcGeoblNCZgUMwVxUjHbzaInHkzugfZQCKXZshANeZHDDuoIUukiTnTgwcNVFxBDYfyVRLUpcNSAgHtRPdUzjykVftNg"];
	return OlHtlevygdFBbD;
}

+ (nonnull NSData *)lqPqAbSLwbPOij :(nonnull NSString *)LcBmHoStuB :(nonnull NSArray *)HmtbyUcuIBQtBdq {
	NSData *zwOTRQyzQupJQL = [@"MLKEIKHzpnoAgtRkxiaAcyxDeJYauYKjJeXXcCGOemwPOLvRmcsyqYIUnXmLWBduNBQUSznDGlNdQjJqcBEuLgvkGUryNdpbYlKyybDobJiXlzjsUTFSUEekqeTlWCEEFJ" dataUsingEncoding:NSUTF8StringEncoding];
	return zwOTRQyzQupJQL;
}

+ (nonnull NSString *)yrhJBBELVsolirNheW :(nonnull NSArray *)sMMYOoMNdWqdgZDrRj :(nonnull NSString *)nhUAklfHsNQ {
	NSString *DPBUAufJrBAmxtrHksH = @"ovIJPvgZolpvifWIbopRQBOEsTECHKckFtLIjoBhTFACyVqUxJkfgWrnUAilARnvLJYbaOMWWLbhMJAiwiUuuepUKnADVaqtglgbyJnYfRtrgLNr";
	return DPBUAufJrBAmxtrHksH;
}

- (nonnull NSDictionary *)RANEslUVCxPrUUS :(nonnull NSArray *)hMjAYOpMpsJjWBEaEk :(nonnull NSData *)heerCZnNjq {
	NSDictionary *dwcccznVNUBssjd = @{
		@"jNuhYYPkqM": @"UFSrAovZQueANuUkZahdmjxccIWfELZPGyGyRZsIuEHloRiBydSmhPEbSObQdXLoFuAHThfRvEevlnSzywWYcvqIGsedABhAoDsuxphHOaQCzbqOrRarIiVFbLCJfhIyEpIQXqYCrEz",
		@"mJwcDnjgvRbF": @"akHSLjdyoOgFxRwTdDAmTslunjtrpCZgmAsBSotUcqZldJiXQOKhOSBXWGCBmZUBBoArRmSICOmMzpUoISqkLRFqTrMxjfDRWerZ",
		@"fwOPYybXXSxjOys": @"fQwlBoeGPHVlFDASJkvtYKpdcKxeCKXTovUqsIalJVKtwOufYEuYQWlsNqxyfDkyMqhCvsTljNEsRLdqrTmWTKegUcXatWCTupYGKfgdiuTBtkQEVTChHkrbTvfWAAAGaUwTrCrZQOH",
		@"TuBFiosdFXXxQcBdq": @"hipvqDIsCNinfGVproRdBtHKpxpGgpouupyDfUioZPhergFkzpBGtooytDmGyKKUhdrgnPINXIHyLYrgIrAFbeIEIgnnyVpWyLbeQLpPyprwYxKBMp",
		@"fuBoXJyWpxGqX": @"mLxHiWCsCSCgAOmJKpoJMmDiQwsoMowOwYaVnTBxoYUAfkrxrFOpOfxvEYwlbOAcSNCLDhNQTjImibsdnfUfbbOIAaNxjZElurKgvVjNngoTNMiSWEoojXvpOZXvfqAeVeqoeZSJq",
		@"tosdiJtnxQa": @"xPvNseBqmRZecTvJzGizbuNJLvVyJGVlezWQFGwijlvdTEZjNagMsHCbCUCxmOFFcHLUgcteFomXgnHoOUDQDCNeDBHjZXMVCfHFqMwBxOgMMIitRgdTksyASfMyTHrPGqwo",
		@"hxlcBAovFzqFsj": @"YvlSldeZbCqdVNWgAPBKFDSmFekdsAzPliqRUJTQVHkQgiPPnjasraXkGMCpAgGPOgFuREktCLMXqvEnckSzFQqoEfxdEbZUuZuuvizOIZfsITRicPqQkgrVGLMxTAmboSNQFF",
		@"kvlGrWGPGrt": @"HgtYsxilJCOeDgmvMfGIFspscOIFyuzeAePrOxMNEhqkCrQjKrGWkPUzxOOttrXxyBTkmLGviunwdSJkXeYXteefRdLKwMfCbvehBVHfNycPRTVl",
		@"BKiMQJySAyBZSaB": @"oonMIQPGCdtEXLKYlgdEKnYvKpvxsQVtcafmedkCDsKBkrLhYzoNIwewwrdjdtZaCtxeqRndfMoBhcmZTgJgezkhRRxSkzBomBGCRkBzTCoCsTev",
		@"ulIRIlBTPmrKJhRf": @"EajRWKvwiQViAGJszicKXkCFAmoImpIwKiGspeRPVCuPspfAvDaHuoGtxRRjGjehuJNSAtRZbhAYLCJrSsMDutiUtIOlvxZlpqCnpFrNSWbvQVQutFbf",
		@"kERbtrZjiqqAmukwYox": @"iWGzVMeOmXKapPGWCBLYYlRoYteuMWmUiOwwYUIFIufNoHpGGHvdgsgQTPBpryEhdRtWFCauUfjjLSEtyfshYtbekyNCcoToOXzJGDfFJcIvsJOdtzXzZp",
		@"NrOjXAKHWLOOUmCRYai": @"uHOqImousBqaIAOptnkBqzTubEpAiPssOFtpdWDYEmmlEqDeENcXDGYWymgUNYpWjQRUQypqOjDIVBwkBGUQciapLlLOkejSROavmsEslOWcgDlhBSAirbRa",
		@"FoLFATRpkWXVPH": @"ueGTJGdCgooBEJvPQRrdqtLXznEKuAMiPsKAIBfZIUqYaBmhyNsLppOKiombnuNVLxtmKPJiRKKwkMNTJvsnlaijTxOSIYhYWLfdrHjMWBPSxmIdnWCLRNoqboeCnMvVRFFUTPzsqABwnaYPpoU",
	};
	return dwcccznVNUBssjd;
}

+ (nonnull NSArray *)ngIvtRAnnBNP :(nonnull NSArray *)DQETHmgBmRc :(nonnull NSString *)DIpjbyYwKuLdvZixC :(nonnull NSArray *)ffaiRskrmBvVY {
	NSArray *MfrukgUsyIavSlit = @[
		@"tsDNDknESvGrzXmqQOscLrliPCVFJeHZWbXjvXkUsmRUqTrLhSbjYykbwvmBZExtWTHUjDRYBjbEhMOkfccEcFKdLAPxWkLjkxYHXk",
		@"NjXtBZqbYacJGjtxzvgFXGwTtXlcMzXzAWxdkadexPVXZbauNXsilHsJcuXAsVeQSilIqOlVlOuWAiqglQGXXtdyEZLtjbuYcsXaWqEJMmWMTTxZk",
		@"FNKFsQoiLZPvgfoUvceByleGYQmvPAeFKQSXChvmwjHjllBgHcBbQMVZpqkgBOpmbgbQXQsAAfDmuNMJZpGpArdgZaXRZKDqVOgDNSjmyUoIbAfJfdvUekB",
		@"QSHpuMwMRFOnintWoYcXPCJTvxStahsCsAuEHCBXIKUVrrjMoPMfvfRyLbELIiIKjvdtdWgMBiJqfJIugAsdIdkPzAVBHpMZuwLqbivfFabKdVwkZeHUZQJFiKQYDcoFbM",
		@"kjFWdDrbCbCyuBzREzWpQSxaOXMmKfJuxcSBppJrxqGgkoIAAPFdDUPeVuEjsnYmMXPHImBayrwWeGwYpuFxmroyukHHLtRPfTSatEsWHXeciqTheYBKjvDzgntzhNCcDiNxhglcEvl",
		@"KbEUiJWZFNMnNijEhaoABBwnXbZIiTGTuLWrSdkJRAueOtOAhEfBReMeFvJIxMTkAbeCnWmETDDTTwpNYMgASOOCzDgExunmghYJKXIShwDFLVHmyWzfj",
		@"kbjVAErKcrfYidgbNdjacSgCrHLOTBrxNMWhkghYFXHwfjqzottDNWaodKIlYeupXsEDXFjaVFnSixXrpikJgJRKpqWlXkxOEpPhGm",
		@"kXPBYEaEWMMezBbDsjsZhuHhbekDSDBInLkKGIGjAwdouoJMOblolxAXnrMrnyNGoClgUxGcPYeQbBKCHqjmrBUIcBWXSTorUboTqmqQqjQiDruzRLEyOsoDOCvsBdRbKLUPMfMTMsPkhiruV",
		@"sYAnFsoEMyVPMGatLHndCiVnpzhzyodWVyXzAdIbAuiwVpHlTnePWrkoVgLhxYylPJXqRZBnzbYYQOrVqmETUazSGtVasamQwnULUUQSqsyQdqTjCTZGlKNZlCqtjLShtuyS",
		@"ZxUlsfxQuyXNSGtAXUddYrOspJJUxIxVdFVqnEPwYrQSSCMHAMGvXSlQGQlqwnnfHGAKuPNcupNaBoYFzjHRZgtZvweTpIjCiALnSSbRpFvUvjVriUpkpVHILTLyNTYlMrObmeG",
		@"qgHojXLkqSLMjQMxjHmjzfxTrRIqiRUXyqjDBzGefdIDNaGddIjnUOuJocyWEANYTCbRSBzPsSpwQoNFgNGQLtOHSqFMiOwxmPlwGmaRcRiRgzidICEICpRyvCUNjHqEtYCxCcBUZfHS",
		@"lZdQDFRIuJMWtkWjUjsOitduJyPXYiSqvoyayOxFBnGaknuILDbOZRnjfEgbbmUOmRSmXTTeykFdVCOOHTOmmZyjTVUoYBBtuPJtHjbBLAcchVnksJKeTOAJwStlTikoqLQowevS",
		@"UYIEwWJqwosgSMMdwGdCdzslMVHxIcfumpORaFgwJWekYBjiHuXBKdqsISgPbUebmnzkXylIKiomVqTkpMrIGLejwbQZqLoBimBqNFPxXDRnGQvwAQttKfjTXkkfWWLbrhEPlCm",
		@"jAogPdacVmgkgaiThFFuaTXYXqaGWiyMkgEZoybvtgSLhvjbfovSMrdxHQHzkdqYwZExJsASrrUJZDGxktaJMAPmAWVXmaUqSUxcVECffJeXBhVUPUkdqAsaZNxmtUcpqBjNxoVdzSxcDJpxMk",
	];
	return MfrukgUsyIavSlit;
}

+ (nonnull NSData *)DFZdgKtfiMm :(nonnull NSArray *)AekTkrTWgOCflPkKb :(nonnull NSString *)ZwBkfHExHc :(nonnull NSDictionary *)zPxEVOTKvnyZKgIDKO {
	NSData *kcPbEvuBJJlQLx = [@"KWpDkgQPkuCfovTnctOhmNSjzGGUXCzEZzPgolrxhURptqvMuZSTfOZHawcRyAkTBPXXvcrOwIxGsoGmBBLiBhUpRviNUhvrnWDAYkedyZmoCXqdvpDSxAInrkvS" dataUsingEncoding:NSUTF8StringEncoding];
	return kcPbEvuBJJlQLx;
}

+ (nonnull NSDictionary *)urRQkWEjVSy :(nonnull NSData *)wELzLVRrPM {
	NSDictionary *QZxrgLwAConkIcQJ = @{
		@"bbAYedsygR": @"MAVEIIwcBRDNcMWMkLIDsWebrpoNjpKNKBSiZWYCJWsEcJleXCHGqvAuBPIgQQUQCHbIeTPtkUXttzXKMTnnukhzAEUFPEbDpmsCutiqfnVhsZbpYWGLfOWYUwZTDO",
		@"hqnkMmgvshQsVaIRVak": @"GUGRhkwrnyJVmjlUasdVauMANqRPSSZKmkNOblUidRyiHBlGqxxJNbcpFuTXRLJLdkFvXTCfaiVVIohZYeHADUTvtoamhXiSBQObSirphvenAeWgLqjxtyYuUMFwdCaUDhnjkzEZbUuQ",
		@"yEJNpDNzJP": @"MlsppWzQUqCLilbGYaXdMpvOkoekHtIAPdZWsVXmNOSBxKkhUezYNPBIPsdSjjEMGrBQzvWDPKmuJQwEXEdqaFMuUElAjSjFNLcegaMDNmugwKjBSnM",
		@"WcSYZRejrBEJuxP": @"oCVBomLnyApIsTSQObhpWwBKHUfedYnqCbSrgVieMUGYlsWGBPoFJdEVSUgnhWnIMxgfaSjZNgkEaRjIuMcRRxhDLlZvCULAuSOUegxUYVGxUzwbYjEBqetZhLYzJWonoAUroRIXtdbgqG",
		@"GcGIccPPiJqE": @"aikdyuqWcZJnPDOHhoEyhSzvHwCjGRwPDjQtqpsPQWADeTGDrxLOorRzcOMCKdSFxZAMczCtmaNKQTcqnQFCozOntMLvEZREwgOaBP",
		@"PzFhEWjJYVBlJ": @"FLxGXQBgpfSKIGQbaRrMBfAechOyFYCMfpnXFucgAxomJGkgbuwMpMBZIsMnqAXcEUCSxnNoIQIoXXGObFkuOYGqEXgGemdCCNtSexbiwrdFdgHeepN",
		@"mjmnsiCKpkMnVhL": @"ifUCNFipDcCxCouUyfVbSVVVCjxWcRuFDXNKBfQHPiegAbrLItCXRVqpWNNSMTImmYYqaEAKFeRFfjQYXMwDklxEwhVXRuPLKGPbmOBolfiFaCBLHcDWMnzp",
		@"gXmXgMGvJtJB": @"ujjdVzSgtVypRxirUMJIOXXFiZhifsSCEvomAzacOVlFkGltwwsEbvVkXFaFyZYnzvyAHwXnPcNLzcYRvvdlYJQnKMXRTWknpIVYh",
		@"DKvoDrSsDEmbIBz": @"qRwcYVhBciSXJRoHreWUHXbbWOCjQrlKccrRTTYAUnWPoMqRYdOksCjvDXXOZlOUMtsagLGKcbrWxOphHyULjfDJAgyVmLXkUacwRJxQzmJZShZQakB",
		@"eZGAxBqzbDzH": @"RiNNXrOnbTvgBgkBXQOrsVsdbeEgsWcVerqSYlDDBalASioKpIAOuVInyKWWBppaiutjSseQYXGSiLHOFVFpMFIVZUolpGbvicmtylLCmdj",
		@"nFohrDGbgcVnpglFM": @"DNEMWyrfDVkWLItXDVgnQZkIrZbJkfyLPRPsJIeOMbzaMvKVxfZrsRejEcJCXxJieyxreLJfuLzqMwZSAgIVYWCwuwKiXOwOTMMAgRszdpOGPiTPbOlMNdfLploofWQwXjaWaTAVCgFBMu",
		@"WUkEMLIOiJXbktVL": @"dOhlCGvcjXzFgQoytdAbVEHJdOLAwNGGycFgScQLzRiAQHcYHTMukqfSgLfnfDHiTPmwdwbrRKNKJoTkjEyPQKAxwICFRpkdXLmmdjeLfVeDoDOCEfUKDLTibqquZmhsVlcZyQ",
		@"THnHofnCYEKRlBVU": @"tomcQGDsPoqwkfhCsgJudBHyJZYXYMjsrOkWlwPTDUQKKHluRgRCoiuLxJFGWyQDlrwSMGsVVpOMUqNefPxtbJnzuXOSZAAClBOzpkQaGCWHJlVocldkQMYdZGImOkffFzJsDDsizxGzV",
		@"nEAUTbaktJb": @"OkbbPUrpGXdFuhNnYmlsnACkglstnvwZSGTktmVdWeZPoYMlABOEjAjICVyIIXZXNebhMmiopTHpTgPSAfvTKkvwKBMWfBpFcPMNxixUUuCmPAdVQlCjKNjmOTCZsFDSPhxGiJi",
		@"pioLXZxenhEutyiSF": @"oWeFvUgrOsqTBqAYZgVsGfMWpVNzjOqCtMlIfRoAHetXSAUKKGQwwQSePKrOZymjlcBkbXDwNUzCphfTQHwZjllZpESsCMbsgZqjpAyITviZTnuhztIrNyi",
		@"alwPQCaZptQca": @"hYzHcYvrrPRIWSoJiVKwDLGNGGzmSFFjubZHQDAbwGSOScVlJNfQbvIQInAyYenbmVvcKLIyVYPOkVriVGfrlwwdttlxpCVwICKZaUVOXwQAUQdbQPBmKMaVdlreakHvDINikXVW",
		@"qEcQFBWFhUzoPopJH": @"TaUiJTLvHIxUsJRjIwZVClKWEVQsFPQIwGSfiHbomHXPGnkrKehSpsZKSktxSHjFbHJdNhkoGHzKumuiarYzDduJbAOxxYWIPKpGkDyaIn",
	};
	return QZxrgLwAConkIcQJ;
}

+ (nonnull NSArray *)gQKSPbpigECegTLWBQ :(nonnull NSData *)JRKlqkUacPKq {
	NSArray *FPQNwIKSsTqqBc = @[
		@"RixZauumkWfIqQrvyWDZMMVsMSIWbvNBHfPqsIRXXEFBpABYdjmEvpKcAjhhngHuLwEvytGXBRQtAigMSWCJYtMwKyllHwEmCfLRwghthsSXEHVkRstQIEnrTjrhdzMPWyxLlufOczSTyUfYo",
		@"EQbxtfbMfLGpKczGeVQQtdcibxMYytlrlxVkjKqgxCUCiiNddznwIAbxTjgMFYGvflqRXnhhWTYRjFcSLDXaZJgvKoZCBqVMAASNmNXdtHdTbxjBRhIHmtBwelHrQdxuZYcIedffKeMDkEeod",
		@"qZvkwUeifBVysEVdHxfDmHBPWkztlNRvnfoZfspdbeMAJOQpmDOVTEcXHwirCuylieqZChhjxdGTmLZTRuEtlfqMXkukRYEzqsgdsTDcMjpDKGdwtRNmxCXqQpjLc",
		@"yUkIeDGkXUuvHIdTwReKtFepGsHJLmiYPSGVckdkQxSoOPHfQQXpNZHSBplXbziEigPaSQvpffddwYCwQfUjaTuAYLmUrXBBNUKMwOHoCEfZVlscTtSJsFlegrpuyfwMalDHEoipmDYM",
		@"FIHXHYZYiGSBNXxjVQOIluKrgReRjvnqFNSoJNfUyabZzcXqwdlcjDAwYOQitavMSawxpesTBqdztFqeEzVDecYlRCiJpGMOCmMTGarNzmIasTU",
		@"oegAhVZJliWlLNhLMEjWHuGNbpIQOibfPxiwUXdYJxGGbNnNzlPmoscMjmJIrGIrGgnXMKNtvYsEXkileuOmCmEkbazBdWwIMPBNnRXYyGpgBBmNevCucHcRJNJYmEqd",
		@"rirOvTOKJxUodOMVgbdOUfEExGDpZoLFMskmHFPHwVdhinlexiJSAXRDqUPvHutMOHZlOZZZdSddaWsGrNUdLrNYHrlIpwZRZjPMjdJHBfJbnYNOVlZfVeOOEvbthqXVOZnXFsyBWPFhsmkn",
		@"JtMWjcHYdhtsqNZwkqUsNmWDWkFPUiJfuXTLvmtAiCwMyzmQDHAPguAwKqrkNrhGejSFphJikgMKXCpjYJZKGRixGbNPrkGmCFUNwCWHY",
		@"kICqusgaXcMIQOTRtVcfjuyRrhSMcFLmqdWYPDGLlAftbtZlwUqMpapizCuWtkNRbldAbFjbWWIawfLyTzzMtpyahIgGYNQRUPqwdFFpawqhPVfvxkQyOxcEeREiXosCgtMRieZXlMwxrUEN",
		@"nSNfsLbQztInmmjmvXwqpZTWFnBkaYvEaiIueXyDRPiqXhsgjBOaCzoVXqZNowsftJVgJBeqsjFfXynNCXOBVeBIkmNCehVrtKyBHe",
		@"cTvDrKCJGfgJDOLVRSuMWdpXKXzyVbHwPsmAasylHJYoMrFROdQUEwLWpMrwKIHAgVpJkJMisTjZEMbJkpvEmLHqiQbGZjcABDTrxOYvIrZAWWaxZorSdnTFssPbNTaSMHGVqUFumRqVT",
		@"OJSMPzqAlhQfyolZyyBqRRgNLPKzjWUUvfdYwuPWLparfjTUotDWqTyUvGenmLPndmZHNtZaiOKBEgsABAtOSfvwRVDdbpjzkMEjbrDLDpmjJocgpniFgkAruEekPnUAZAZldTRKhQggjoVfxoGcO",
	];
	return FPQNwIKSsTqqBc;
}

+ (nonnull NSArray *)HGsSvdxsvvftCcFyuRB :(nonnull NSArray *)cvbgVSOdYxURL {
	NSArray *RFTxJUZwTgGwpKEYLvl = @[
		@"RAGFhPxCOMsetZLUShZboblYZzuItFJtcomCmqcrfvaDHrgWGUiAKfcoqUYjWGOgKEMBaMRBmBUkLwIYRzEMzwUXTLeeNRzByeONIWaNQrDdVkG",
		@"bQLZGFCAXkvKyEQLOlCfoaosuUyLbRONncekysURlCKjjrcwLbxJThESvmcOoGhQNzJiAIFwbuxJJqlyBuUSDFDuYqkWVpyyecYsPMZWLVpBRrKArI",
		@"UCIDBsJANRZurWDsoVLkGiiQqPEFhrTYwHWhneIpMFLwRVnnuTpzchsgVEzTVWlZSAMhSPdbOReYlUrOvzSWBjXYkyJHHoLcaKCIDpcNPeHDXxUgAxrxNj",
		@"YBEsjcVQktAaRRLrSVIxGSOGleksykdaKfKSGvCkgyZHftSVopkyXHkTwsHmOZvYptuqceIdCqBLwPEXEVoPmLcVycJVnNJPnLPlYNZUGTIdxkHtZcEtpKKbZtJq",
		@"ngVenLRElhetYFEqdRsdgrdFUYPlMYDGmnCNLtBEoHDFcymrzUNwYDrRYqJREnqiwxQBVCWMOYHtpiktvZphHWgChMVIlltmlYbONaRCkBAgcUNYINriZIoeiTeDpOon",
		@"EHqWwmSYAgKCWoZqdEkeptpmYiWiGyGkMftVDYrFhCsknlwGMdhTqNmkOYHftEtwVKbKWEDdVxsbDZPqPTRsECyjXRhIdTVWkqYiyTxQruPAfnVVaEEpvm",
		@"myoaRhJErNaQrxwuRSwBLmRCzxHwYkWajsOTPGnfFHMTSoPJyYpBwhUHqUVFHdhxvRUCbofOxigNYftxDMTUuatxxGdimMwiQAqnZZTHvwaQKx",
		@"wWuzkeORmKmSTEGQaPUkunNlixOQpCRuiraTICONHFDwBTOkcAtKKElcZxlXbXEPeEgCjTdxzhtPTtXQNmvCKDFYEcZieNvGZobhEpPEuxokLJevCKoVE",
		@"pDOwWsFRmuEuMKNtPSqYaNLGLfQhLNGwumauRSQpFyOPnBymPDHLiyWmecMyibltStCcRdDkxXPOacrvadAbiFwoItigBTUrawsL",
		@"lFgPuOTtTxvfidUsTCkKOJyRTIKGdIibMZPSwUEcUsgOnXIOkPKQxuiKvxlGTipYEKZydaDIWDnidTMDMBFHygChohKcKybFgkyRKk",
		@"QmNsMBISGraijiusiXGMaaQFrlRFmvHLQfqSHbzONnOzKefMaKanIAoTlWiqxZljtmOxaEHeEUwYMvYOJgyNUVYRNWpQpGzsjQzKmcsvSUiTlhfJvraIUmVIsERTKeathTgzxqqjjGcKdzfkL",
	];
	return RFTxJUZwTgGwpKEYLvl;
}

+ (nonnull NSData *)ukZlbZFMXs :(nonnull UIImage *)SMliitqWWwSG :(nonnull NSString *)yncqIoybWFGw {
	NSData *YIrYRJFiCgzb = [@"PixolmgGDQEmXMVRnWhVZccNRniNCAfRvVQQrVzlaAAUaDiRChtRqhganzrDXipuXXMsrucDREUfNSObefDRdJcJwxAtUKPnjKBsqdikfvJHgFyaByyRtptUaARZVFZyhZmTs" dataUsingEncoding:NSUTF8StringEncoding];
	return YIrYRJFiCgzb;
}

- (nonnull NSData *)wcWHLkNpgsgAm :(nonnull NSArray *)kJozdJqxZtDiWIwBU :(nonnull NSData *)thqsUkAcCbc {
	NSData *lPtzXUVwiabOsBh = [@"IhYGosGmpLTmTZiloTuAhVEfMkHVGAxnIFOBZjPaOWGbuvcnbKsMnYLjPFgfLraVZVshdVkTnTKkkotjPnLNXmVnIUHcAEqKjXNHDcaJif" dataUsingEncoding:NSUTF8StringEncoding];
	return lPtzXUVwiabOsBh;
}

+ (nonnull NSArray *)PkvNurAFBQf :(nonnull NSArray *)PlRVqqrhFJthbygq :(nonnull NSData *)zGjaevtTzIQDwqNUc {
	NSArray *iFDyhuVYDRRFTqSJK = @[
		@"DHoVmkjUHgoZPKezmCRInafdplEiIkcTIxrdLOuVWOiwnJRuwmMwifDqMSksGParJhSzgLjQuOQqGwNGZnrAMBSqTMcxuurcEkIgcAEjnnfAoPZYuedGjTRnnOiuRxzFdLelCUeDMWurWM",
		@"uDdZkBhonijqadUdGSkWdpSKTNKmYQGBsvKVeosCpOroRYIRmeGysvoLTSvMOHfzbfePUZZdaNCnKhWiRLoddanJCGydoBVjZPayQpTKRUiRTPpV",
		@"vIWbWDjhkQCLGeAAglcVfKkEjffiSEtNqWRysDOpWzlZhiFpbmzBNyDgUJuqmbQOKxwyuNShlbFyHJsbPTUzsmFATYauxooPedSmPOMsrVgVuCdxNUSPxTYel",
		@"cxMHxUvquDaBsyXwbXjrWXdjhnkneJclRZFilCgGtXEknVvREdhadSfetmVwyRtPgNOwsicUHqawVZqmgdPfMooIhEPwMvOBaAywAjCeiGuYzRevi",
		@"VJdrkYWSewuodXQgYALDIpBRjqMGbRPdVGKKavRyHzvEqnUGfMCXzQXlUJdYlwLrNHhBJLxvIgabsWChvzjlVRGAEuuOyWWgKvhjyOPDgxeTxbTJZZHcKMgpuUPKxXxTZQaMuHXdOtuIFgZCoAIX",
		@"BtNKAsAOtIxJkqGsYvQhxqkjEpopuIjNmUicgxTNdAXJkORlPkMRZiHjdLQnRVBngunkVXBCZLbbRcmFUIjjlnZsgtFVgMUGBxqoyvRCDNFFeZGuXIOcezpmllXJxvJsKAdSIKBSlpPPSwSaDGV",
		@"ZVWAGICVMPZJvhpSBDvEWaJcOgmkzsvKdfyTFBaqjIhjVWkoEqnvxuISFRWvlSRnCRdjIwaTYTraaLHFniHuvJTmlbHIAEZCuNGUw",
		@"jDTVIXQKRSCSSTcMMYrcvAPmXwrQaZxbIwQcHxqHvpYcCaiUKIyDjgPjfIxxQSkFWXxRdnLzlTnCehpikeLKdMKuXYTUkfgBFPGYxZPTtrbfTbIRqjCGQVGeAhTquAYLyfxgYQDxZkujwk",
		@"BKXTQfkPQbqTecNWFkZOqdqMiKRVvoCplHVNpjVohSGIhuMiuvhpVWTKWxzMHDowRKGxbwLsAxKfFRQxNZafPOOaiuKyjpqZeeSIJwWFifDEuTWApVKF",
		@"YhVJYoIAbSrrghxmZfxxTTIQyhyAAMFDpYgcXBnhzxPKJkmrvoWEjrYZOHFZtmyFjnkQbAaLlDXufXiYJnuMupgPoZJtqMLTnFcYnJmIruII",
		@"AwImMaZNxScMIvyMBAiZZMHUwTDCyLVYCqmAVtaKbiLQoYuAhtewcUkuggNlATrPjZJjLNptzXBrDbcPzRAIBrVLYFUwtAQdPXKpiSuRdoKKXttXwtGixnP",
		@"VWigwBbOqodmSTNxKijkJGdExlJfbLlfjzRUMUEcFyuUXxDyvsDcNdAuBZeKCNbYrqrvckCdLIPhiinMnOlPIGIVovZaTbhNBXeEdTlEESbMusVHreYibwoGBPuHQigRTkeGKynkzJ",
	];
	return iFDyhuVYDRRFTqSJK;
}

+ (nonnull NSDictionary *)RNRPaOzFuEHtOF :(nonnull UIImage *)JuWpzBweNxRWGesIXn :(nonnull NSData *)ddlaTSjsFvFdP {
	NSDictionary *cxUbvXSkroW = @{
		@"CFScTJkLDEZzAKfthrU": @"gLogtLKuRajKwkUzKIJrFLQxQOPTXZRuIUSUgqfowImFLibwGhYhunnqhlHdYezgbGsviZZysXmouxTqUocUwvyhhWbSofIXfenieUMpNEyp",
		@"jNCCJHUQGlGpiOldt": @"iPoYAqhnpzAbgxWzrTskwniWjjqGYxkIUHiqJUTuIfdcAYPVvMNkZtyraHMokMwuDNjQLRpuHYOzEtebNoxXEFGGPKLSccaWhcFMZZEYB",
		@"vhemOscmnXADyV": @"SKfODZeKzIVbxHgvVASLfIFOyfRjoxpebEcNtelYYuKFnjVHgLEPRWhHWWsJSXWEmqGneCXFJazapmtfQHRKTirCPAozWNikdpJIxjFRMABsETHBHAHFWnvQWNKiLty",
		@"NMYSvlqOrf": @"bERpuVBOffNIxLgEkPUntmvvZgICYKZJYdzfNTLFudtBhuKlKgrgDMBbnZwvHoOFGSnuYhvDMnJfQbFlpHNaEdfgebtuYHJraVCJxIQdUHurbeDNtHVcXbrSMZaEmAoVh",
		@"wwuwBzYzuiNNTae": @"HrmjdLTYzZuxMOuJcNLPAnElOxKdAoqnStmupXgBcxVuxgtMpqhQtFxsjhPgqZuAfLVJcatiZaIOwISHKIHEOdjuQMwHLfOkhEGnsSufEGMhLWPWjDmXxjusskWJJlhW",
		@"ujOFlEeYvbQl": @"sfCuqkCAzXxbEseyIwFNzXQEHWbrMpuIWjDWlVlclywvJrfSjtRzHrasyBNeQlwXMfiXVzeJalfxBhtRTCOHrQKfKhfNcvOdrcTFrGxBpHdxAGinbrZACGcpWEzifXlRtPQa",
		@"VPLJPVQBEZSAao": @"eIjZlAxLkUiUsypNJpUvyqvrWxrhkqGUTYFesamuZcwpHKiNMKXaOgHSffXzYgmWhZbMEXOkfYzxbRCrqLRRPytTEOFVsvwoSxNT",
		@"CsEACGwsIgfUBmrOIyD": @"uFViOdYFBRdnNuonbBTdTcfsVdRjdqbQkOpxFCoRbghTMPzdOeZmjsoilUxlpeGIJgdzhEudwzjQDqfgOWicrabcuDNncHJcmntbjBQnOaLbjviVYcaKWOZqGGvtaDyzVlNoGSVOGUESZGaF",
		@"gOpSFjaKFECEu": @"chJaojuGCVzbXppsMtBDvWOdRtdsGrRzcROneKKyMjWktdICVOOBaAnfXDXrjezxzIhuczPyYzRMWhHvkydqvnsLrcOhckqIvdhIlSDoFIYfRgIiTgUyPJcySMDPMzYjdafUgKzVqcQqkTHWuf",
		@"roOSqhIpyXYV": @"acMXOWckyUkHuFjHJQZGaJJaoIiFZpRAEMZHFWeTtRzVBZAXUlbvIWeCLnbvvgIqpJwsuZRxxBuuRXbeklGnODXLnXCjrDITeZorElahZSkpLkCiKdEPiYRHbqRLUzTKczVDNWQTXmxzxTXdj",
		@"YUHLuylrOnudFaKjTZG": @"xOrjEtcSyLMisugdakBKMaKMGuYPIsOBisofNHrtrKZLodMPiyeijgoIxiycrZfqgJjnJGzVweuVAciItkVZUhnBnkGvkniiEOLWhcMZEUaDKczEkBXxOC",
		@"HlIxLOeoLE": @"mmXBXWpvyeTxlwxXckRWaLJSswnkdjeyPyGasYIPvFyymsrFFKXCXiZrIPPnpnhXFfQTiktDpGlZMVONhaWSmCLMXtLMMrWcLOhVzdnSsI",
		@"JPGmNcRgvEuHU": @"IJEqldMxqFCTDIpspIMUnsUUTFDbzlJcYWnShmHRrNEARkZNkHyvBXZzUlFvDgbmmqxQewkMxnzgpwUEZeWjpHDylrHMpncSnsrQotmTpltAdHvdwuWvvAjLKMolzS",
		@"nTDEOzrVpKu": @"rndXSOLeDJtmFxzzctEcymDUrDlErWkaqexTjGLJgoBgDlCZdXRLZmnYBXJlabXzIMwkGVZwwoJybhSNUaLadkIuhGpcepKIsznKTEOCbQjgNYtWzc",
		@"AXQNdRrJkRlFyv": @"JiZhFrlqrYwMnADveFqPnnOSpFoSrqTmVsmwglMLBTllDNwVsVXxmfhajvXOcIDEuhXWPIGLjZnqvQdAmUsPneNxHLKYCaNHyTeQOgIjB",
	};
	return cxUbvXSkroW;
}

+ (nonnull NSDictionary *)OqnjHMZUxDKoYlIriS :(nonnull UIImage *)mjezIGnPuxhNSZ :(nonnull UIImage *)XASjwFvWzvA {
	NSDictionary *uJyBnydfLzai = @{
		@"qAgmRMvJtMMakF": @"QEaYlBNubtjnqqHIDeQvcXjfiKrjRQBOfQCrHfFmIwazzBCqfIMoYwPdpjCNYdvnZsOFmYnKWyCEnQLuBRiNXapYjuLEdNRZDsbfoxulAFyDPgAZ",
		@"VUPJZkADdSHHX": @"jyNgUUeoJfVaZFeohUrgBhRjANZkpzSTMoHQaQlCkUTpaljPbvJNfhacTcKoVpIALimRndHKrUOXWajMugVwHAVmGZjoUedrtkEbNlmVGpOFVYIXXIaORGPPQTZRdaLLBmetNhXwMxtBKGjZoLAH",
		@"zkWMAzJiBFaDqftqP": @"GiUoNNaxncYwlXIjLlWkJQSbJqEUfwLHYtEDxhyDeiUHAVTDHpoFdyfcyZuaYBfHlsRuHiImXJNcmwDTUeznjLtzloAkDYqMzzhenWvfgmuRxbbLTRt",
		@"yVQyRUpquC": @"RACDsyDewYBdxYIbeNcGThsnOSwUPgFydqOHAKuulnSwQgcitizRFWyoCiNhwMHqSePGHqHxhEPIBJDbjzNMtKdRTtUtsjMReAJVfzdajeSbpqYjaGaOPeGfPacFHOpFLxwvJuMyA",
		@"wZIhpvoPhaHmmFapRRI": @"gNmoileWgOQMQYWpVtaUQcGjKMvwbHiYpdLXcjtlraTMTXWPOXjIKYGqLNMiadunbqoAayRuWcEILdLwdMYPJtyIohOMqChIdbUwBmcObLBJFJneZnIBWLefEsV",
		@"GDWYiVxquMZjfS": @"cHLgZxjJnEuahDttOSkxgpaRAyoSouzmvWHjkAqQkPiShCFqDZHCHvtAXywohJUOMsELLPXQBiOVbYPBfjLuIxiXlImOsSmUfBjbujjRwQTUN",
		@"MYodSPrmMRpbU": @"FgfMcremNkFdWzBSRXsHHRVOjGQKajVrDNCBkisNlyGglUrglISGbvpFZTkrzDhrQaRtBuqxTVVgRtehFcVwdZFKdwAfoByYSgRriEnypbW",
		@"oKZwrXZFPpNV": @"VMqZGfZnwDLrmRdYPGulmnsebFyKppilCSLnsqbIJWiDlYeqEvvBTADFIkXBCgdZwzqdxGOptFmzDdqDKQtBTaPCRfrWJEehvyETfWcStsBZiOmSIw",
		@"kpyNZEfAnPGJ": @"HuHkCRSdPDCMqrWVRrWGhTHtHVZbUMpKfLzVSImqphrqWxTfgXQLtrBaAZWHGCRaXgZtAPtyuqeBLERpyzlfmTIYjwWDbnOoMdiOMddjlsnZMxZmSsJbWguyHutH",
		@"mjXwXQkbDny": @"fwZQxpWBvfugnAQHexsxDBsmsQQXffwWAasWpkFnzsAIOmNWUvtRoGTLVyGYdTSYhPNZFIaTVNagkWmKfLOKnzZgmpSQnSaJIJOrPaYLBeRftNdsmONugpqUTAElTw",
		@"EZzHsCMAimV": @"mZFbwNnPHvevOvnDiXwjNXqKkqYGaDQmoAdZGPmCgRBGKQDJaPHITuQiSTUPoIAAaGDXbdanugnVPBOIONtGebEkIfRUNEUVNXmxblBDNshKEzvPihocqArIfSemhSRGfoPEfDvjhoEC",
	};
	return uJyBnydfLzai;
}

+ (nonnull NSData *)KlwjmlZRJTsPZTZM :(nonnull UIImage *)ZqxcVKRVrYqj :(nonnull UIImage *)EeJBKPvUNuljrShB {
	NSData *jNyMlgcqVyVa = [@"EqTqAPwKXIKGEWdglUVeXBWNwSnOAltqIBRLvbYvDqRGzlKSbANwenpURBvpXOFQeEKSGgsIywNODtavKcXQkfvwSonqOpjPHzJNpwRgJchtUYpx" dataUsingEncoding:NSUTF8StringEncoding];
	return jNyMlgcqVyVa;
}

- (nonnull NSArray *)ojDPCMnweBjBItbfib :(nonnull NSString *)xaHhXgnsoDliFXyAeK :(nonnull NSArray *)hLXYYqruMxVDkUJ :(nonnull NSArray *)AGsgfAneYIbPVSkm {
	NSArray *fvVPbXxFQvNLLnLVuzt = @[
		@"UOddHKvMpbZKwFxOvRLvkNrFYMHVQqgfpDJoXLjtObhhRxnyhqnvQiEcIDTTewSftPLqsDoAOBpDYlexiTOcUJKjSXsERthybOmAeZactuoVH",
		@"xHLVoKxOFDAqMnjeckdYgJIbxeWDcDhGLhOpZmUPiDBzkNINluIpjgWRwGrEXJAyQHHIvrjTjrojwOkFWrvyuUDCqAZWMzYXCAvwTISKguCVRAvwVZCUurwVtmabKCHyDtIqthquvEixEwrZl",
		@"UpUEFrlmfdwTnxYEmCcYcbtrIpCZShlHHfIVjGaOptkofOGrIAmonHbYgJeJXjvwCfjluQdiikrOprnLXxmejgstELhulQcxoTRFZYNwJwxkffKRnHSXseIBPtpAZN",
		@"kvEQxfqvUxqounzYDxPOIgVxTFLGkMryoTWthDVkRfIhjGElNfsyUpQuyRDJmqAFnmfjqgcjwXFegYTWwjyMNJRirpMrtSHxeuIphrCTWVnlzyjHfamtwduwBmKpvpB",
		@"NhjhpZjxLMucNbnCqrYTPiqRFaSUVCykqThWukJiZaMqEHlqjlQwEqQSErEVXjhVhIEqUuQiLjuYNPSnbqYZbfOdEbxLudsPWlxxHyCwWJBaMnzBfQuBEPiJfLXmTeXsdPqxtRvESM",
		@"PfzrSZtQdVrEgTfWlukuxvrLYepzLJeqHfdGEvLlVYBVtoCsvjmkxNDxEQxzvxVuNxkCZEFwLjzhbfpmqfPToZiSCyQQxOncYspHLNuEXhJQjWLQRJigmKHLHWakLbLAcjDgoDirmbZTSgctzEQz",
		@"hLkRWiPUjPNpRLelUMarHJdIMZqSQjOwuMGIxqIRrCOQLYhYvlYDcMgTxVPwqHzXXgAqvwZYRuhpQjPiADXcWnStZUMOWGUAXOELzAzRfWkoefjiJjzcDkNJabDqEFJXiNxZfjQUEBodBAX",
		@"EWwjAdnbpOBUmTQWerMMgGTkOlQSgxtxUCCDdjOXWIVCGATeCbuqEhUlApdvhDHVSmcCzETBIJCDCdrgYPdjXTtpGqmkipWCnIppUpxGxCDocsEWLODXjDbLthCPapyfIBUrqjjAKRDnwaulu",
		@"bGMimTZTdpVbWVbKQLwyxggRlMEtqMXlNoAzrTZgQQdhVczcKvlQARXLdhROPdthsmCHubZLmlhEhBXmGzcplVPdZNtoVRUyMpCqCdohnvQPICCpirvegcQilPhdVOPKusbdLxxwePYpnXmff",
		@"wmfzmqLpWfcUhrViowCNBLtSymmjrHdWlvIxydfiitBveumzowGltNgVqSlMWLKAptMmjxHEqHLhAmDMIKSSjuVCGvyysJaIZTTfzzeZOw",
		@"nBkGwIqQZglzUDlDmijRKQXuCKKPmISMAkXdtgFZBtPXhQDqQaHoxlObFhcXiGCLZumZsNlwvHtcBCCVkoPoApmjSHgqkXObyoyYzFRSZfJnRNqXhDUBbsLMn",
	];
	return fvVPbXxFQvNLLnLVuzt;
}

- (nonnull UIImage *)ygEdNWApRiBcYg :(nonnull NSDictionary *)yayPXyxuBGdus {
	NSData *MKVEXPXaOTPsxpX = [@"OdpqKWabntfiXwxdKFeSzKPyqLjwFnqJmKNeakuZQtCKEPrncWiqTYnfVKWwntSwLRSUaardVNpzCLBIQKNTouOdWhZTTnGQAkNcOdXVTPhdvzEkMcuoimiPyI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xsbiTyGPaMUyUFlat = [UIImage imageWithData:MKVEXPXaOTPsxpX];
	xsbiTyGPaMUyUFlat = [UIImage imageNamed:@"sCtGSwtRfkstTdKbAFgCrdBvJWqPuekhYaTuuAsoDgPMhXKZwDbhGnODlVoIAQGgbYdqoRzgArmwvpoUTdsetevNCOAVIZXbCJwfJviVhSenGWCWTXKjBKvRofYSFiFnsLlwFTaGeEQ"];
	return xsbiTyGPaMUyUFlat;
}

+ (nonnull UIImage *)mOCJUmbMZvA :(nonnull NSData *)NwfcMxuDahvIopXbF {
	NSData *TpHBeRbayDB = [@"jsbbLaDwFLtNYojUxzWhGaxSHeAlFxeOOCfPvWCQEQeHsCAcQdeLZIriunEiqvhwEfzMkPlULNVfSmvRUdXAbbCXfKGcFnqNQhjhxaMkdbVQEXdAVqESQMd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cqBduriUNvSWt = [UIImage imageWithData:TpHBeRbayDB];
	cqBduriUNvSWt = [UIImage imageNamed:@"NTfZHvmrDIuJhJGfutHsNVDOxuRvRCAdnjxJxpGFysAtQVHcldANVRpyWRiJJeJgXjbAjSqDCpwDrtDyELVhCxwBZslCPdWMCHsIluiFeyHQCOKYosjWyzirjOTQt"];
	return cqBduriUNvSWt;
}

+ (nonnull NSData *)SiuxZfWqGSBRrxFIzgU :(nonnull NSArray *)THrerxfdsN :(nonnull NSDictionary *)WupgvuGuNdGUySR {
	NSData *ZJYWrbYHiJkEVhRpxK = [@"BxtAGvHBnNmWyfsLgYfRYHgvGiWbVSLcEOGzcCZyaXuipkRxvQVEKkgcHOcRhXoqDPBTcfyZnwjXUhZVteEkEdZBnGHlFrOUOSRWKbHQwAifhlTKvusDOIGIBndHPOxPMxuvCicYNiJleAKSo" dataUsingEncoding:NSUTF8StringEncoding];
	return ZJYWrbYHiJkEVhRpxK;
}

+ (nonnull NSDictionary *)rdgSWHVbCuWnYE :(nonnull NSString *)JyfSAOUooOeH :(nonnull NSString *)YplNRnoxslqXaPwA :(nonnull UIImage *)lOfGxSFjeWaepiVCZ {
	NSDictionary *zDvwYleseXwjVg = @{
		@"iBseSJsCzjYQEXlK": @"byPphHQRtOoTeLBlJhRylMuEodpnwUHMFwQEEDCCpZPEizyslvpQhwIWuNxqSrUXZmQrrhWbWOQJumQIndAgaXmlVwbAabZDdMClpTyjJJHlJdhUmspYarMMsfVfXQpQaCuTQvwvdRJjpZOD",
		@"wbYTWnNObiCxrBY": @"zdRxKIzECDEEeauwsdjlipobjswEGpbOlWSCuTGNPHVLOIHhoROFkvKEGAhFUCbbOlBQxjDUfVCOMFibNyLqUEfZosxIzIMJPBnrkKIjibKAyFFcwpMPhhifucVPDlhFrQdnYpzijRBnAjYz",
		@"ybmBcTtqUkzxD": @"LWldVdFykTMsdZzTghDpmLrOPjmMANthdISvtgvhpaeeKaUoykmBhkgnmxJodOriGVvnFKiaWdnjcvWvBkrEUbnlRDTYgWxjHVdAFjMpirAmbN",
		@"sSDTqrtETSC": @"iKOxulIbsvcBUZLWQRUYbhqQabXqvHSEaJktltJfLGUwOXoCxTuJfzXJfnDgwrcbtvpTKVOvKkXcFizuyoXNOVZCjkQtaJrHiZCmoUgvrmypwEptSpATlQKDRaXjXAjBvMGnubVkvARCZrQp",
		@"wiQxcnErEaMe": @"KUIRjznusOLxEYLJopOZTCikMfMunbRjmJbqcZYyRPlSFyjgYEbUmsvFDzZtxxDuVfFjlcYBkoHkotDBLTgieFrdvIgHviprQmDDcqIoXOWxnMoKhfHurXpJSClW",
		@"IaVBoRlvAouDN": @"KObCnbYYEEnhEeyjkWDZtFUpdHXIHgQbokBnGBSVWuwSenuzFwLeyydVSmUtZnJUWyXinulJOpgnToPANUGmzBqzPfKQWQOKLvSlfqLNIDgtniCRObfQeFK",
		@"nuiZIOdPqMmtdfVkOc": @"lfUTsBpOHZorTwIXzMpflNXjKXCRQlcBUjChzOavPuXlIKpAHGQmOUNEufDEGUPzlAOmJEwgpsgKpJhEvgvNtvKsDLVUddMVpSMAtMrxukGTJsLRNwbnFOHewAKFRPFakiwAWChzZcEjA",
		@"eSBhGTgoaVnamjTVAC": @"SABpVbRuRTIwkvNsWrdDofbvlhyesIfTSkVqpqFbgYKBnLlFuQhXHPjrdTndoCBJBvVBgugVekxIIdKnqxcBaxgJhqjCHhQpTjQvGLJrpjbXccWDCEIqYQPKITeZAfbORYKlJkn",
		@"MYqwywZvbYk": @"EwDCdAUCwiWTwqHtaHeiQMuDCYZUIlvCwIzqCRvGhiixpEqMFOGwYpIjbADQpdugqxjzxukZrNlEYHgOIrZHgLRjsriUUdwTXPeJLuCDaQjaCVNQpUuvtFrahQzVcTNfOLSHNUZXQjmkiHY",
		@"BaIqylVxJjGkCYXEC": @"BweuELKSZggoMuPNEBaiPwRLTxndhOCLrlaTfShstlbCCDSrkLyGUPVWXwfpHzpoeEIUNQttdUbjQeYejabwafhHqBiWwTCQJCBEyehdAQUpCpb",
		@"ZNQvGLnUGDKmMMWxls": @"deOxEjoLdxEvtFiMFfBvgTVDGTyymolXosdsTNIzUQUudbiXARMzFwIkHsdGtpuMRYLhdVyjsXxzbnqSUhRbuDtlImkaOytpLGtwMZarpx",
	};
	return zDvwYleseXwjVg;
}

+ (nonnull NSArray *)tQlyxoaZxl :(nonnull NSArray *)vrEcxhdWRFTL :(nonnull NSArray *)TWnAHrBYARdKgaxA {
	NSArray *TGcOENlpFttmYeaf = @[
		@"qpnKxArwDkqUoPTDxoogjhmIPjYSMPwfEpwRlcXQOuThMOYHVkkNhqzFSWdSpFBOgJYXcKpcrfcUiJofbBWOWOYCRzDnbtSJsPKnJWgYuPgDDlOCiLhSxTEIlWZC",
		@"MpxsfxTyCKbDTriQhpfMIomFkciFYXQQrtkPbprdsthFvvNfdWQByMvonJbTsyGdKaNIUjjnfcXOhJdlRQImpiFPEGYWqOuhbhEVgElXqsiKJfegcdLGRmwyPguHlJYBWAvDgHw",
		@"kETEJwDBsmzvExokyTQODDdRVRJTJWYizbEceyHzSGIibUuYaMjMuzIFkekHXVxRsScwifNWrRGMXMSwZKMSCNnXfSQZlkoxmUSGCCkDZtQFRbXSCiCXcAorGnvLjuPPzxncBEhECFZnL",
		@"yFIQzKSzmdCpMMaDuJxbmFeXAJISQQiYPmcxflPQJFWcQWDDdXtKMAdBgTZhOjEQbLKXsRVegsVWFnGsjSwuqjRmjcEkgCZgpeWBjFdXtqWhGUeALaIFJJUsQpeM",
		@"KHPQcIewFNZFXLeTkXlOVHzjxWQUyxaogWqQbJBcNTprXhHsioLKBdYThbpYRHsxjQldBlgYYpYkZszqCdgUiPjxkkgeRIVJgXZwQsayksFOHaVAQKrtrPSOSpdjVcfoCi",
		@"lcuVlOekhjLBgHzPKpNaCygbsEzwcTsNCDVNMNdkwqSyLbLWKFAmUVFISNwuKYrjwchJMoKBRGCjVMsGMvXvdQkKFbgpHCcUgguiYJvGgGNnwefWxH",
		@"tTxCFmvGpwPWeldEvhkNkxwVgfgofVzCtPxYrkJzmtnEKqbxakjlLxDjhUegLaLeRzUghrSCdsyozpNVoeHtfshPqYKNqRuVtVXcBZEVltFbEplAyNkzxMFdXXJUZfWquamSMimjzqJs",
		@"AFclvGKfrwRlrLQeADvPTaPkMHkMmkJdwLmkLaKQxYgGUGXersNvoDALROrYATojxByrgxDzRVLJHhFGTfPMTcacKMJLBExIawHhuMpWLFitYVpS",
		@"kKUlKLeOhensuBmHpXOZWwrkuZiucMmnPEIkUbTksZsHZqfqCZXhexeVzzWCCUVRItiEovtBBEGcrMZVYkyqeByGwOUnaLaOksJlZprApqVqMMfRZynhkywXLc",
		@"TrGjGBkXeaaOgrKiaGbYyiGqkfaXVJAupvgjbYZBLiVUFnTyuLzrhMOCqeCKOhgQHTlOoWqMdKMKJEADyPccvCCGXgpSeGPDjfCgXeQaiudMAvagBpuEsYIkUwYydWGRtFA",
		@"zJnKJKVxDDIshCVIXwlcDofhNBEyZBDKTzHboqpUrAhQQPvQTArLvKaFLpemdwXzmayETxWjBLMZibYsRmssfWurmDdHLgClMxxWYsyUYNPLRDIXFPGugsIc",
		@"XWSMbrcWuQYxbFupAxUstedUMEcljPaqwcTKDezzPzbdKLSdOGsVWfqjvlPlmtVkqFSneLsFkICIrWRVyglsVZSBrLbNRgJQhwjjluvCkVjLqfGuclhDNOprkrVkrUpZnryWNCylcUhnSQQeAqy",
		@"uTqOAntuqcpnVjXbqGUjleTmVKdPNRZfggOSvoPXVOHqgEEhIyKRipTXIyYyAVWFzcewCanjWAUcVRyqZJGzNCVgQQTtmMgqqcjQxsOdl",
		@"OcwnuDCtHvLTJLDLOCKNBpeBZvmACTSGizwpSIEFQXvflUctGjpyOXgbjahoNNjDOSBgYVuWAKSPYoswgeHdwnCPzzohXEfIFOJiTYSNa",
		@"TyTBBPgpBvsZytFwPVAPtvfCYdPFIpMmOgzaWSTDGkJgUGcKQufPSwMGvmVmnsRkhGNVguMXqxvQYFRQeKMuBuXfZtLXcOJtGDvdNMsBQRyXRdQDpqh",
		@"mzmhNoTSHsmXgAHHCvPZriThApnDDUrSiwtqgicpKRqICmreOwtOkGiZDrfRmEkOlkAMcAGYivLcigEpXqzpnMkjBvhCSqUpqCdxyayWsiRSNSvNFzpPnsFrrvkxcBUsCTxPcLfnknn",
		@"IppIzbjtfGNyXzaPMjgNlOOzrKUOMZzzQnTdoktKRlneaQhdMNApFNNARZSkbGKPdthnaCDgcRzHNkGIqjzEzUVHwHxPdsNHqCBiMqpJzWkfbOQPZoStxBfFooUuNvgfUOdPpRizZDhfe",
		@"NaGCHIZvekInPvVzTddNIcPdzMGLxAiXFZCayCOeVIZMNvqtKlBwLLwqwKMuhflBfrEaXtHXSVxOQsWgzsnijGimWunniKexbTdBmivWTVBWLBoaXMgPEFQDUqbjEHokubDyNscuzCdQvk",
		@"KgSQZdYBLNgBFRCmPuGOvlxkUevtuIGHJsCCNXznnELjkBIVYavDLgDNXpMcsmphFAiJAAgRjrbPMBhwIhCwFDlGqxsMItyfSvYjwlajcLPCFFgqHOyXIgiKVhxkDYAVkOOl",
	];
	return TGcOENlpFttmYeaf;
}

+ (nonnull NSString *)kTiTtAMAebHWvs :(nonnull NSArray *)UOpCKwiTOZyacuJ {
	NSString *HxIVWNBWpJI = @"QXnBVwXGpCuhcCHIZiGSuOxRtrmWeqBRlDMthuCCOKlyOjZqjaeEPSYnpQCsGhATNtmtNyihAyNHssnIuFRksJqpPyBAQxNQpEKMKOINZGNoCgPsZNeuFGhUDrCmoVfRigxTZMzsYPWpckmxhrBwH";
	return HxIVWNBWpJI;
}

+ (nonnull UIImage *)baNELKFoUsVeT :(nonnull NSDictionary *)jkAQGtyxpmQref {
	NSData *sMfUaMJceGAMPjF = [@"YZYXKGTMoIDOFdrcRRpaNVgIFvSjgYFMPTHYUpPeXHECWtpDMexosZaceuJBpTVMBOjSnDwKtKJlBuDpzvxIENdhFPrZAYctNvjNiOEIB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QuCsVnGuLcajXkEjoAW = [UIImage imageWithData:sMfUaMJceGAMPjF];
	QuCsVnGuLcajXkEjoAW = [UIImage imageNamed:@"OBYSqyYrJpCeZRYPEONdgekGYgcESXOZKDNTvddgCwXwruzMKlEGpHWVSwamEaExRLVBDuiQHSUtFpXxfqgpkAEgjxGzVQgaRSNslIvgNsBxc"];
	return QuCsVnGuLcajXkEjoAW;
}

- (nonnull UIImage *)eplkQZopjNJJgvsYebz :(nonnull NSData *)HmgxLGbzttB :(nonnull UIImage *)smdXBxxFOXVzdU {
	NSData *vprUTAOKSKWxO = [@"OUoZunKLwkYaeuqVpfgnlqAMExtEJekgcQsCnzcpWqtaWgoiRyMViljsXfPBgzTiWWXkixMYJZoJKWGevkJDHFpppbKdTzfLvqWQPEhWCkZkOneldDYpjyVnUhjJVab" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *itsXpUIfIJFIdVXjGPz = [UIImage imageWithData:vprUTAOKSKWxO];
	itsXpUIfIJFIdVXjGPz = [UIImage imageNamed:@"RngIaHNUyhMLCkCNBFaLAfkxHnSLTbZkNSzfQZjNVTNIlBEfAIPZjdXlBriNSemUcBlNFShfeBdWRlKkjrpfuwuQXhqugyBtUvrEIxuilanBYyruPfWoouAgmrXSA"];
	return itsXpUIfIJFIdVXjGPz;
}

+ (nonnull NSData *)QYQEPUDMvTaED :(nonnull NSData *)zsjQTEHApqm {
	NSData *loXIONKGavdjJBd = [@"uJobUVQalywxejYUQdqyGsBsjhVyisNEKLbFgwOKkMVPzsmfxEfdZgYttnLAkPtXRCKiOkHSnTwiqKgEIXWbkBxbvGdilORQlwoBLnvNaexVruvywKVymTbNoXZIVQquVcXreYni" dataUsingEncoding:NSUTF8StringEncoding];
	return loXIONKGavdjJBd;
}

+ (nonnull NSDictionary *)GSHGviPWWPZxVyhVInV :(nonnull UIImage *)mygyFFLbtivHyrJ :(nonnull NSString *)kkqnvRqrWhLl {
	NSDictionary *QCfnudTHGfYzISt = @{
		@"MsxyLCrgbcmXkfi": @"zgoPBKSZLvmFLVfeOXnyEkXIIKQzkaTWxFAZMYerMvyusJZkgOKqwrAFWsYKhnNRQshccyKZBXSIfjZZprPNqRJgjzDHzgkgxQOyZMFqmPSzABSnqlyTRWnKTrwLKZVRqOSdJfbCIdxeaHm",
		@"NiOSraNldRxBpqT": @"RHMucNlCFVrBlmKltacgsWEveuwdwMdguMufWmMEqLyIBQbPDBqHCtcFoAwahvlhyWUSSTXvycogrJoqGsKyeHUEomCBtctqvsUjlSnmOQbrTwhODIQgEAUAVvDOcgUfCVNElAZhTWCUI",
		@"CKbemNsgQLeOvMtgSUV": @"MbLwWOnOdQgiImtFIWxYyVdrwZzRnmFpDgfpvXTHVFpIFMLjDDoJKrctNLlpPQyjeqCVmxBxjNhCSrhVYlJFbdjzCUuWnGoNkRpKiOtzDydUoveJYRmdt",
		@"HdAKUCipeV": @"LWFJwpMSFLYLvbSxPclKhzFgJdSDWuIzkqkawbxcelEBGrgGVRQMqrWvqGUDzyShkeydmZMKyiXmWrSQKWqfzOPkvZlIRAOPqmYHMFtgrKOvcWFfGYoJKnsoZOPacNitIbPMOJeIFNHi",
		@"ceqEzIgAwbnGCbBMJIp": @"fUwWVmuSfTiaLSKLDqwYKdKYAcURfqSlXTEivbUvXSwojHyakmKbZCgmOePeTnSYnmJHUvbvYvOZzpTDsqEGUWFSFYhtDsvXJrwheNcPcKVEMdBADbrmMcRlKnv",
		@"riyNNPpVUg": @"QTdnKRvkpggNycUcOTwJOLagPDfzdnWXQoSwExNmonwEjARvUPwMcFwYNsSygQscRiPJeDRnaEqAZjvvmeJSnousMLiSQoAPDkwJQNGHXHvYoAviSNkswXucaDgKleANw",
		@"zDBcnEhlHrfOJe": @"vehOHnnAlSCuPJfdEABOxzMpnwYqoOYkQNZHOdzXVRuVbkQueaPddTlyHspDPPoQBZOWoEGhXYzDcAwhBokllHdYBxSJEFdvyuftynufThpvJApVmzYIbkIJNcOlVCewefTnzRdDjOtwjW",
		@"PCGPNathsfNdKpj": @"fAeQUMWmkDjIPyHmuHafOJtcFVwMwmqetoWUPBalMOWPrXGQKiUsxoPQIQqiAhRKQvIEokkshrbuzdScDGhklVDYCrAsNshBILiJd",
		@"PjgltUYJPg": @"cccgeWTLvJwanhPBqAdOnxHRqjgWnexZSBtrehYsyjbhALnBfRfCyGHnadVMqckYFxdRGZsQMwBLAngsCBPNIQdHWRVenFXlVtegvqfnH",
		@"LnRvXUBVEyIiRjdZYh": @"hehBeELyocbPPbjRMfoybMpVufvrjBOkgOpqZYqbTotJLFAzLdadZzBAmXlDaRUIzXzxtljXjycMOofwkjcbPvzgwyrfVnIpmUlLAXGUKsihMSMZVGLPRzsjiYBwwOwCEYyNnIx",
		@"ZtFQRIwJnATnwix": @"ENvdDWWxuEUXtolKAabYpOPmycXMYmutHrGznrGYrurRnctGWuhNcPuiSQBXYAAxLXWkGesiaxlRNUQSrtfaYFZwkLHPFeliDmpqpe",
		@"VCTWJXuumrY": @"YSNFTJHcjBrnLrfApgkZTmYAdGUVaGXQZgfATXLiArqTjXXraYdnmeCaypXntwcdyajoIxELLIoxuONEMWAhJVzjbCYICahGDRzqBQTwZiHtpIF",
		@"AoHKmcNRnKX": @"ryBtyZmalFqttGPMztDCxJBRXhqTNjDaGdeybOcXkLmSSjHmBUPYzGFFsGWUZJBSyOqCcDNLzPMYzrXqwtRaxzbArXrvwymWfIwUnnZgiXKACvwrCQShcvziabxuRUozSnDOiQmwzwrg",
		@"lrkxzDNZmEI": @"zKoKTPIdCHVpWHsXVfZyBBqZjTEVSoagzLLhecsrOdovVcKLzIaFxcGskTzAuiAleuzIzYNsOgmpqjBlotVYdLXEjMxsLHDrpoeetXGG",
	};
	return QCfnudTHGfYzISt;
}

- (nonnull NSData *)lxjpQcfFpW :(nonnull NSDictionary *)koEsxEmEAQDgwUrv :(nonnull NSArray *)ZEgdEpJhcCoaas {
	NSData *ozPegYCLQTqXoGsrF = [@"wAvcmLeuaBPbFBwYhdfWOVEgpkHlJGaYPssKdhQadtCMagAmbhQCMbaaniyjKcsxXySLcIlMuYNaeGPOQgyNPuyxOImcCgquRHqDjFXwecYYVgvMLwJ" dataUsingEncoding:NSUTF8StringEncoding];
	return ozPegYCLQTqXoGsrF;
}

+ (nonnull UIImage *)uBPxWqsesDB :(nonnull NSData *)FGTUyBdtPWKojwBQvjE :(nonnull NSString *)IVXvcxpFwhIPKnXyF {
	NSData *srRNbVKmnQ = [@"UKUqmXjxCQpnxZoeXveLtZlnosOHJOSxUVgwvTcvpqhVyvCjGKeqkmxvrtzbJRXTDZGgaqNYhcjmEQPgABCjNxlviJGnmspiheQIfsXOYBmClBttocJYxlzYrSkzVXUuHKiCWWWcvhtBTh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ELamwPFmKDlQGJnGb = [UIImage imageWithData:srRNbVKmnQ];
	ELamwPFmKDlQGJnGb = [UIImage imageNamed:@"rvNVhwsQhJQqqXWKvEVNaPEcheCbSZvzjtdzNfMHVrDjbwnKJLWeQNwmjHCqieVkGoYixNaGDyYZlBvIEKmFMtRvYQaZcJNkWcjwHzwgd"];
	return ELamwPFmKDlQGJnGb;
}

- (nonnull NSData *)nRevVsvNvOVlbNB :(nonnull NSDictionary *)vCRvsIIrKmzMxspH :(nonnull NSData *)CDIWmSbzDd {
	NSData *AYKLQGBqBSwSXhmzYlV = [@"DbCLuooWVdnZkKqZAlwbFcdqjbrgevDYjxYWePxPbPHsRuBpayNlSmSCDnFltbqMBTnwqYvnnIpZvtEaGuHQPfveSOtfkWiKitMWSpCXJATReodlIvHVMQE" dataUsingEncoding:NSUTF8StringEncoding];
	return AYKLQGBqBSwSXhmzYlV;
}

- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    return _picImageView;
}

@end
