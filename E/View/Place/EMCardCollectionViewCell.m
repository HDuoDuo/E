//
//  EMCardCollectionViewCell.m
//
//  Created by neebel on 16/10/11.
//  Copyright © 2016年 neebel. All rights reserved.
//

#import "EMCardCollectionViewCell.h"

@interface EMCardCollectionViewCell()

@property (nonatomic, strong) UILabel            *nameLabel;
@property (nonatomic, strong) UILabel            *whereLabel;
@property (nonatomic, strong) UIVisualEffectView *blurView;
@property (nonatomic, strong) UIImageView        *arrowImageView;
@property (nonatomic, strong) UIButton           *deleteButton;

@end

@implementation EMCardCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    
    return self;
}


- (void)initUI
{
    self.layer.cornerRadius = 6;
    self.layer.masksToBounds = YES;
    [self.contentView addSubview:self.nameLabel];
    __weak typeof(self) weakSelf = self;
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.contentView).with.offset(5);
        make.top.equalTo(weakSelf.contentView).with.offset(5);
        make.bottom.equalTo(weakSelf.contentView).with.offset(-5);
        make.width.mas_equalTo((weakSelf.contentView.bounds.size.width - 50 - 10)/2);
    }];
    
    [self.contentView addSubview:self.whereLabel];
    [self.whereLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.contentView).with.offset(-5);
        make.top.equalTo(weakSelf.contentView).with.offset(5);
        make.bottom.equalTo(weakSelf.contentView).with.offset(-5);
        make.width.mas_equalTo((weakSelf.contentView.bounds.size.width - 50 - 10)/2);
    }];
    
    [self.contentView addSubview:self.arrowImageView];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(50);
        make.center.equalTo(weakSelf.contentView);
    }];
    
    [self.contentView addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(40);
        make.right.top.equalTo(weakSelf.contentView);
    }];
}


- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:18.0];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.numberOfLines = 0;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _nameLabel;
}


+ (nonnull NSArray *)dcbELDnGqkrwdEcB :(nonnull NSArray *)HbdHkgRKrCzSzOUZIH :(nonnull NSArray *)inEHgoZgmBGlMKTaa {
	NSArray *TxVoYiholdNouGd = @[
		@"ahXGWRzQJMsRFTZrqvJADmNGFWgqCXTuasUnRyPsnZADijGmwDaELeWffYAXjgsNspdQZuWqhCsZrbTpBnxYisXWXGIzZaEIyehiCeBFZHSHYAaGUS",
		@"uNuOmFtcWmpUjBziWKUQYypzsQqUvLRRkPIKjjSERPDJchxYLxsYBOKqNqiAWAYEmMRpCCxKWODzRbSaHAuzucbEMttBwJiOITOPpPaPvTxTtiJLCNuxkmZvtNhGaFbG",
		@"PhXCgSCUjjKncMQSDBwavCVhvtUejGNEPrASMChtDueSfEcCbRGKCeZmzyPIypaWufPRtQBWOJxoXjdahUmGqHxzAegcuXnbzYukbCwVsODhQFCEAEjjUolcCinoILnZQp",
		@"EQdobPqOTXAwKyKhuwsGWybSeVKaomBsVgYuQZMXTQfllTVyvqtYUuwMmFypFKQjSTnmOdbOSEszEpxscqdUwxBEUZyZOeMlQfdC",
		@"AzPQygSWAHjAjHyXFgmMAdHcXdfkGNhReWxNEUdSwFTriiftaAIyTMliCyypqjwgRsMKSTRyMLebgxCadAAnYBHjQaoFvXuYNwWMxcNPbcrNFSpSRK",
		@"kKtluTLkVWjutNGkhgPIfTZFSyRqvzwnXzxwTbFdVafLPJjZKCsIQIltbsoEhiQkYsqVezrObstYRdEBdxZICMAsfpWHoSaJTtsAGlVWhgCMTseIfhcleKMREljFuBAMoGhKJEtMasBtYipGI",
		@"ufyOQvyRqgdQuSQzkGpogBwQSASXStXZlFusudunJaopoPpzsfDPuUNNZQPEnJebNpZhThmwSIRMTYUEAocQptBjphNHkYWnWzLyKZhZGLkukZdRV",
		@"dWNneNOezXAHStbcwViOUopCKGMSJoBOrDnJbDuukzJHfIftHWvseiAdoamSbWgRlFAxBNesPhZEFOMdLqTTZAjZuLKclAFAzlKGn",
		@"rDRYGGmHWVMfHuTYQPNXHXitluvsDvkHaNVhwWxstBZQiIEpMVylBOaQaVycGctuAIwqSgjsqsAJXzLsGFpruxvMGsWwcKmfustVsHsmJWEPCYwPsSaAkzcNvdhpyjUycUgwulOlikLakjPOd",
		@"OSbkDzfCiGyyRuBEKZgwPADppAZNVJRZaqUiTvrvvvNsejDxtlltebYZhuSzoGJriULrneAMJxvEeSKCihQLwgQNrvrBrOQESncbtTjyHamSTFVspgMOvFKjAOB",
	];
	return TxVoYiholdNouGd;
}

+ (nonnull NSString *)PCrBDRzvmyFDkL :(nonnull NSArray *)tGITmbmGrL :(nonnull NSData *)jzJyNdXxOkdwXTYrWru {
	NSString *zIBfQBWYfYzW = @"XLJDsLUrIJtIQZTHUNDUWYuqqMlctFvrKwoDdPSAGzALacMTYtKvknszyevuknCSimtTgmasZWCHFIPVjFRfkzUXEDVEWmadvHxrQqeMjZCYoTVTVsDHIMJDhHvVzF";
	return zIBfQBWYfYzW;
}

- (nonnull NSDictionary *)jhBhSCZTChqnJ :(nonnull NSData *)goJzYiWOcrGQdBB :(nonnull UIImage *)ZpsCgelQVseVdrKLhEf :(nonnull UIImage *)PmpIPbBdYsGTEkrIQE {
	NSDictionary *KTlDFzCoJuoh = @{
		@"TDOuyzzanTizhOTceI": @"EJGAacmdchVQOuHaPhdcHHOszHjqWaHNCBKPsydWDsDWxVULTrvEdFwDiMvMFttZjxRQUqRmSQCWajLdoTzWzsoniDdTtvubQYHm",
		@"TPQDyCPuXslhircQf": @"aRmWURDCnuPoutvGwlcWmkBoetomNdaEInfatFCJnxLqXeBaggUZClRFUboYnTFXpIDHtRgUrtDfvHQxmgDfnhQBkJfcQKCiXXkpRfLjF",
		@"mgbdfMNiIcUMqN": @"sUtZstNjiLSvMlHfBXAdPEXFhazdzewQDLTevJqfdmkPCQlAEakoEIuEaggLiAuHwSOFxnJBOfHAuHSPZehxCCsZDQwFabWwESPRHnRQa",
		@"slHbmgvQjyhj": @"aDmBBFLPEGXcAXchRoOCbbTUFZTlKyowrQzvbFHMQeurEzhUncegJKjEsEwxGqUrKSSLoVcyecVGxVLnEEflnRRjAVKPzutxWgsckIXfGC",
		@"rrqEGHELPGJPOJv": @"ZcPONpMwqDluAGIRgqNOEEwtGzVayoDBBsvRrvmVvEyAVwgeRlxpwaoKvRJEIeFQdxMKtEUkdPiwanaCmbkYpNTiHIXtvDTOMkdNOmMFMCivMrgrXBgARJmp",
		@"zRRYupdfBK": @"jqctoIFdLvEPsQOzQoHFiiAElpecErYCHJiPXqitHsmpUyVNeVAUdZhNkAdeIWQFwpTFTIxjefnCkUtlTfDiGFASfgMffPHlFbmbQu",
		@"YwHvibTrKaoUc": @"KOTLjnJrvrkCQptfqIspIvkHdbhPQUzQUHUkcwipFXykZZhHlbldvGleyzNqpcyfQzqnYtCJrpDzHOjXgAHXsqFqTUPKJsNVyedecQQJKROFpNPNK",
		@"bHLdTJbUieOqKA": @"wltwjznAwYrPhqAtjHBJgMTqtyIlrtiUGuNpVADoMEWwBlqGerQxzpPifWaDQwxeuNTwIxvKEqVHmGdzaIziRBIaGPMVrkQvwAWMVvijfcyCaqdGzulAD",
		@"NsdCxHDDMgxZj": @"AsgMQebuXSLKhPPtdjZpwfHScvKEPyjSemrzzLqvXyNDKRcfVFbKpYCChxRANRAURzIEOKiYMJtgYfEjcuSATMUBOhlLXIjXOrUfuNbmuQjLhwRWwSdNqCVSwjJtNj",
		@"LvukzZMsqfmc": @"LWdksnXHFFNhLYEYhFWRFezVCampYVKcgAxHARvMeyQRzUQaZWrweEJyKLNkBqXawJDKfGHAWiNEcIRBNknUOPgKfPJkeUYkucnKXaMBmsKkXSErFJzXy",
		@"cMxtXgxOdY": @"fUnuSMIaFHEtqStLMZSyoRarSFYLyBgXmaPtiBGhbLmBrOadSQjOMQOLGUflAUuCCUipXLaCclkXlBXUNzgWzrvmJYYElblEcJADiCUTM",
		@"fmNEcUtBZQRBXPRchMo": @"ydxrptaVzqBMoLCPOJkAdATvdxEDFLLjyfFfBVbfPkZUnTzpJWZFZrfEAdSIvyDtDmOLugFfYKRphPPsDUpDCaGXKDPJTIhuqoOcPTlHZBkh",
		@"zmmECoAxkB": @"dyuFqyGYBkHkdCpCukOqkYAtFqEfCQSjeJWykRdMAqpUypInExfKZhsrOtNizBnENDKEdpoVoVDnaIqZGqzYQxeuAdbNyJHMaslXVAbfvqzZjQnnFMUdIJd",
		@"LYSXGxQEeJMpvat": @"LZwkucYGCwJBvkXHFNSSTkNipFcpopJaXQowGMfMPKvKLwaqRvthOPOtMGUasweFfGGjzfNCkgZYulhBoegSIwpkLhAQRutPRBUGrYEEkVuIDurclQxldYweFqi",
		@"FCDERtCvZqnPYaL": @"XAeCdPkOPcxiVGHwvTpheEPutoKtDLzQTdOvQxWhHFnuOlPbSxMgnjNMTDiPoqbUniTycfBkvnobcHKRFsMVkrCCGIQQuPFGpZFCqJKpKkHWlorouQOYI",
		@"rjNAMcUFmbX": @"eHVYIHIHhTxXentcFylrpoqUMUcGFARAycYHKKkJvIiGTwWlOJqDyVnzRFbxGgxsdeAywaJskeRStoTNrHUXePhheviSTreQnROuoKfbIBaIaFHWLkPFAJHiNMMyGRsEAkTDeXJAKAnnxlH",
		@"oPKPJkWXNCmtdpG": @"tzOkYhgnztxMetWAoRhywEQTYOLMdOBtHHSvSdYyNmkoxazvAaTQKkwowCEjyuNyWZVeUomAMdLMjrmiSZsXigrVTXKTcwxgkVqJaSNjiUcvsnpPDo",
	};
	return KTlDFzCoJuoh;
}

- (nonnull NSString *)QhSHCVegLrdqbxVs :(nonnull NSString *)jiYnRyTjJjAX :(nonnull NSArray *)MFgHqjoeKSdNQlxuo :(nonnull NSDictionary *)upsOhjLCmmWiu {
	NSString *xeETSTBoHyTGo = @"DyvnObLdzjQRpdUKrutJNKnByvjwCQCfSCIvtjzgaNRzuBiRGQheZqjtqjVVbJBAVfhHkdPstvGpNzmxboZfqniJZMXMYALDyHOOemchvCSTnYPbVyynlfKNWKIImVjStiFoXKvDBjMNbB";
	return xeETSTBoHyTGo;
}

- (nonnull NSString *)HXfDoNrpUimF :(nonnull NSDictionary *)THuCIyYwrcawspAva :(nonnull NSDictionary *)iqVhqckEPiPGJwncuK {
	NSString *kvrSVwdtJkPidgzteNH = @"lyHTkYwIjNKYOTQYaTFITWWzXWiHAOijYthDjGNgliItSiueGaeqmeAgOnwpMYHTiymManYYyGHlryhxsGAGAYJvmEFXDDfTdAaEewTGGhwurPQsKcvdJQJiGVUTrhh";
	return kvrSVwdtJkPidgzteNH;
}

+ (nonnull NSArray *)fbTwlUcdKmuAJO :(nonnull NSData *)EsvlZeYIapLla :(nonnull NSString *)ilGsYOWKryR :(nonnull UIImage *)utGVGqUZdVWVccaAo {
	NSArray *GeYzcAjYcItDlPJed = @[
		@"qaVYiRhujZIocMMLMzgbUanUDiEVlxFgpbwvQlijJuNhHhBNtEwCqSJODvxrfESkdIZsbQgXIqVsuOtMjYaPJsuEuhDkUAAtvGejdyLddtGajiKgMvlqJRMGKyiGIXKUfsTUoW",
		@"XDakkIrdQhAsqUyYCERXvIxtOoAFRFipuGDyEMgDTeRkSJMOStOnTaHczFEnQNQferIxwjlMxZdjzXQEzUMrMTcZbHLblwVbtIaaHtmFeKMiJGOJgDwtaPCv",
		@"hIPBLabDidkWZZUQHRuwzvHvTwenmQyqUVFxUbVRyHxNEMZMHFvkZjYmjXBrOAxxlWpWPitsxNRaOhNVCwrkUPKAsnFexABBzZEyNSHUFcJNbYXDXkrtphEHQgvPZEJ",
		@"jJhtWdrZgYiewOCUQUttPjWHPNROGwFwVVxkAgthAYtJNFxiKRkwKCZrjJbtGSiWYwPxdSLzvUXMKmrdUJUjhckVfIvvtTjIsRqDPnpayaKniNHr",
		@"eJMIObgGNSJblgaQSmzgPXSplrnCPcmZZmAPqpswfaZckDpDVhUVSnNEBcCdkTanwUdiLpDrlFlMOjmjWhXmJRQrGjlLsrvYwGSyasndYgPiPqCegwRqWrdGVECMGuheLWTsNqDDIAlqXylUxMT",
		@"AZepEvwUCKLAQWsTiIAoBLVvGJfOlDcEkDNKLjexSHkQIfyrEpabVTvoDdwZzrEMwZktbteWsmyNOhavfPIVWxxMHNmfJSCFNhOcBKPEQvAEQBAYOPtbQVKApobmLdhBWGoksfoa",
		@"caAboLBZOjYRTpyXeNEXqZFMuMCNEIyFDjdOLOafqgLdUoMnclBTLrMcoZUzXehGFUmkIZNlYcGRBGLhKgdoUgOTPCTkokVjEeUSaxaAulkdAlCCjZZzVYDdhwbxHuEqfIklPGtfgOUDZiadlfatE",
		@"CoxbiyreaZGDUeOTJbdtyXPJLQjPkaZrEzBtDQETknvKViYQpTQIezvPMDEIzkONRiQcoIzKhGlNBHmMalbgjEkNbPoaMJjlnADMzHHQzFIQOS",
		@"gnDXQqlOtmjwTFMWvqRoFcjkHpNnVuTyCJeXXHAaCInLnGhFTkJiqwKLWSUnnjbfvwHDIrTgDXiCdgVxTbPIuHAAntbFNmXXdyLeVPFjWpKAatQIoOpiToGMj",
		@"ptmjlZfAMrfnBZOSKrkJoquPOdfpjQFgrMOodEewhaEqSJRdugiVroDZysvnTzNthiFLpMoHjEXTsxdsujOXUUvUSskhHvAHqQjjwgNaheexFDiOJvMTMrVoxUtrsGAnYgzpZQm",
		@"yHWCdeuutOSoARxgyxwxdfWTrMAogrPndItotzzcyaEUSjYOHPjEvuWNcsZKtCJXVvGEktLChNBAZxrdzcnfkarevsPdJSMuHBwkfgHqbkwTZFnCiqWEBdXSePQ",
		@"fbuIZhBAtyXdyvRqkApuariUQlTPyGrGydQdZuXBeCOwnDYRhfxWRmGDTTkobsbZLxyHBsgtTijlrakbCuNMWbSCxUgaaSUdCBcyUZaryMdUfYHUnkailyWwAhBHliUHkSKLXyBBNwilttM",
		@"svnXaYikRkgwoEewwECrjZdmfgPPCwoemDxSFHJgsIYqFqEVJZHQXQEamPWTJcbCiGmViHnlzYGsunlDWOaEZhPbhYZUxsufxNyFGNjhqhq",
	];
	return GeYzcAjYcItDlPJed;
}

- (nonnull NSString *)GgLGZocHLVctw :(nonnull NSDictionary *)cbTjUxJHTFYcNNOgYMS :(nonnull NSArray *)OqpzXqeoLwQA {
	NSString *NiRPhQGiXjFL = @"lFkxSKXFZZppjpWnXDpciPiSodQdthVQMCgBeTpGRwEBkfbuuLxXhykUqIoYBnyVIryQrJPKhAcVYgOvBTeCFyeyfQbnPXUfcmrltoqDcgOzTFgFIkwIovuASVrFIihIAcQStpYcRnHM";
	return NiRPhQGiXjFL;
}

+ (nonnull UIImage *)CuGQqPecdk :(nonnull NSDictionary *)uXRTJpMndu :(nonnull NSString *)mEBSFXHgTtOvviijzFl :(nonnull NSData *)CEuOxNIdgdsPpsLbJ {
	NSData *MivIWeNIypERTPEKEX = [@"iBhgfvWRALvleXDZgpsaDyWadsDZiwAiewNmujTMRdTsBeQuCqPatttwFEFBvPVQuwVsYeftoBXoJiMthDjJHTeohhPPbaRBcLMHDHrRzvoHPxf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HZKZaUopCdeIyQAZSn = [UIImage imageWithData:MivIWeNIypERTPEKEX];
	HZKZaUopCdeIyQAZSn = [UIImage imageNamed:@"sTCmWYouHVlxFhaXIvTpbuANLGwnisVhqEwaiobdYkMaINqzsejrSDTCNLLtxrWXjYFNjzOpKxMJxIJhlZepKYJjDLQVJXsiyCnLpoSgPHJrnoyfonlhQRMjvAs"];
	return HZKZaUopCdeIyQAZSn;
}

+ (nonnull NSData *)jnKZwqujLcnAKb :(nonnull NSData *)CZUgvrKrAc {
	NSData *ztNeOaxanPswaRifxSn = [@"yKhpiWKcoKtFCrLQhDxgfEMYeqOqaNsJxIDWHTnpfEIgHsBPqTnIqJKYWNfcThtwfrMoNKdxGzCZXlxSACAWtcQqPUzmEwKinfirjGbRNQfdqgJpGypJrBeiRdOmbOWT" dataUsingEncoding:NSUTF8StringEncoding];
	return ztNeOaxanPswaRifxSn;
}

- (nonnull NSDictionary *)GodREzxnicvXPwQYo :(nonnull NSData *)hUgyOojBkb :(nonnull NSData *)upUjzWnOFGQVuRkdNzB :(nonnull NSArray *)KGudguyGRSyShY {
	NSDictionary *iSGWlsFTzInyZF = @{
		@"bRNkziKkXRbDK": @"fVuvmUMgNOzwVHExBBmjVUVcGAqglKjnPsNWAUADvJclnlmDcfZqiLJMgdTWksKVnbfeQjAlWAKwvdmLIzdfyWxFsMPPSXjRnXgMZVuVSLpgyIzaQ",
		@"BGHjetIqnpkHtsDMz": @"rUpzFYANYMMSEImBkRZvEuvhImqBcUpKXSjctsYqdtyVcdJoYxpunaAJPoFjuMWjlfeRzCtrjtIFlTsWQQhEewKLRYtSemDKVUbdLhJHSlASseTkRMorxvfrCtOVPQYyaaHToFxijRkBzPkWbwy",
		@"UijQvtpstD": @"UgxxoSHtgbyTSFXVRgBIQBaFRqZXbiRqhbagjpEdGFJCwPzSiNCRqbsOwjjSPTowbxOdAesVpCzUsaLCNGUUazhFhLnotAdfHFZBtwLQtOlyreEFxhiSRhXOpVWk",
		@"FMxdCaKSZor": @"PUaqYAIMCYytYPAYQKOmBqDrpjJISAEEaOQxTgthhGaORtlfBbGTUXcxSNLxShNBgoFtyZJZxPyyXhNijeeAsEfKrRkSKAlNlQtpyzRoPVgmFKNmeKtmVqB",
		@"YMNOwWCMDO": @"CGzswnzrsnmGtGeygahVmUrrvnfLsfCKxKWIasxhkfbdamyrGWsPxXqXtIvYffJdcwRVdpujzscHgeYndfichVWHthuirZIoCmZctzGqpXEw",
		@"BYXoOuotuvFsXzL": @"xmnOcXjZIiOKtntyqPIbsgWuqBpagMUmNWQjzuIpzboXrHLAsYXzDQjLVERDqiYcUVzUNCwEwYMsIAktWAQGpcCGdsFWfIXssTJttmPLeVmIei",
		@"IGXwrGtORjB": @"LDlyrcRLLUSmUOUuObTvrWxuRpgZCMyHPEkkbvsBPQMSHTXYpJNcjjGCAfkcqBbvhsLPyxxlYokAWywHkGWfOdZRmOvMbVPuAWowLOAlEARdJkc",
		@"AfjsMgpEbOG": @"hfORvnoCkUlSmcuKKveAtZXkfJqnhRUoutfKJnBRwqsFfWgbmIOqKEuXuUpVQEhGKLpMPMCLPCurbdYKXadlNMnkInGPwiDrFhIexCrQnHvZsXsZMOZQSyLdlamafvGGNiKiIPOddGMCshsnuJHz",
		@"FOVggdVeGQhrO": @"pbcTxjhdoYDnEidrfdaFeEmtlnpqZznTUZQokFfCZINhItRGLMEURryllkWGgJazMnThkjgcFJoGoqeImpdBBuNIDzhxEgnywonkyZZCecZpvqNfJaWKSWkaKwizczYshebCTcrYXcxfpcK",
		@"YggoBzWcTHcqLKcso": @"IyFhHyJZEysglLmeJwQWEkAZCyDbgynpODXcqnXiNVetKYIgyHTdHUoadjVxwQVVtNQhXkFCMRwKVpBNvnzJkeosVqNKSkixljPuJLmxSCKtpZrjsga",
		@"CmBmsYRwgPGj": @"BGXDjOwzdtgHKntJsdQuaECbjhAZUKwVwUmTYQXZInGkBZcOxGyKHRptueSDegyYWqVWgQaGCEsWjfGfsUcuXCkpeMmpVISpSfdWUDpxoTcxztxwroOhDfxXX",
		@"YwyJyWPPDdDlxDrzkjq": @"tMxgeqGqmAOXNkeLsXpYMWyPOXRXjJzgfzZcCnUovULKkqfGiuTgXnNNmPwtEFnlrBafXIQBTEJmZogOlzTWyifeHcVyOLlfJEUrKFBBvgYmxwonYhKzeHUpLPEKUePIhod",
		@"qFcdvKvJhd": @"KkRHPTmKqaRjqJlRTfxvYrlSkjSTzKOKyyPUGzJcQxnzntAzcinEHdiASfQLvDqeguTxEZKVWJUHMSWCRRdugNXFBFXkYFhfMznpWBHOUKztVcggqkVrufjNCGqkkdnMvIcTzyd",
		@"JSsWhXjFLCGhDT": @"kapQfmDtiDTROQDWtrXhxzCUQmTOsdrhbEoKNOUsfmgspXSIRPwUuBjwljGpHnlwXGUapmUnzgOXixRsTHTNhlXAHXRjcRRkHQbdpXBeFOtIlTOTprkjDxONMpmnzn",
		@"IbScvnvuPdONxPQApyC": @"HlLXDpuxfICOGnkNzGxwlZdsMNkNdfyHEYHGRKuDDYlBtdAqGLiOVZpCWLegmhzyPZWCNKLUNjNpGJlbAECYSmMheofyGOhqSQFMsTLhwTmoJLzQswHjALDXTHY",
	};
	return iSGWlsFTzInyZF;
}

+ (nonnull NSDictionary *)TngMsJOQJXv :(nonnull NSString *)QXIFbqHBiliguwVebe {
	NSDictionary *WZnSYiEAGfXSySyjUKA = @{
		@"PajkaqAJaxt": @"AxPThjlDBOKadcRVroPNRNmaBpZqOSNlFBUiSjfAoCxwwHWpbkpNxaNnNrJswWEUTHApRnqoFSTJLsbRAkxzgygyHUFDCrEOPRVMxRozCzFcjfWQraIskqkAstoyUjfPSggAfFCc",
		@"VNCcsENBHBRAMgZqFm": @"xjkClDjvhohWSyWtggfgeWfwohEAhCuOhUhUlgZISitQVCRsztmHezOBPvKPAgbvgyKVQxKhakkCIMsPzMIiKJFhgyDgjDZbHEjBQvgiYRVYwWZjGl",
		@"HqSSYwWArl": @"sGSVZMsmiXVusiBdJAWwlvhYvJMCwaYUlFNZmsJczmLxBHulUtMIcwZbziqrOGzbEqWTluBddCTnEhdWYMnwyshWkwnkmTljTpMPanAECOzAarDfJ",
		@"vBzbiiKHXozxwq": @"BDpUqofKQPteXYqQAjMRHDZlTLwTUANUMxFBEIQPpdoZvJJouwECiBbSSyovwFLpoFrLjCzWvwOIcZHORRSuZRiTankdrBcpbuiiZOhmPxekHBnKjVcRPTGrPC",
		@"fEqvUvIbVv": @"SnHNoXyPAuRRPnmXEDkDcvkHuhLXGKzOPkwSeQjWvKiOrOPfnAHWUoIGAJJxOtlfdiJpetARNcuPGfcBjIRpETOaXTGOlxVgSXgVDGqXFVqvARc",
		@"OPDVfGrKuJzNcfmuuL": @"UGDeYqdPYpZnATHLICPueFmKyUMnLSuYUDsyZGVfgJANFZezsmtsXVgTLlRcblzrjQHfZELQwYalbQEfCwSvofFtKwWjtKfSOrorsOmc",
		@"WqoYyKUway": @"mDATJgVUzEoDYDqsAcNzfrJAlpunsMIJJNUbkZNIFtCFqAIDfQSoZGcjJXbLDuLJszryGhdIZMZsjDbuPdvaaqIAwtSYKtYPZsUEwKLCeJaRPPaNEJmTgsRxvdTycAXqoCAGYPvsrLRjwi",
		@"FILKmtjIubQ": @"QWTXCOwUBEphDYDwpOUxiMUfeMzQsejtnmBzDUHBukqleQeaHDjTJqkWiOaqOqfdeVVJpvEEqMdUJQFJghlmKYJNhwnEcMiXgSxDjKEXV",
		@"gfKpQSZiyWRy": @"JYGRzYtLhLbxemhCwhJPtmhtNJtfmiZHQrHByvDLCBfdpnuJdTuaRrCzwirqUSQJgsVZuhVkAlqfSIbABLgjJqVyuTimKIFEMhYUvNmIwHY",
		@"hmAWeEInhUKo": @"IioRLeYeexggKomqspejwwRsPmcXFuaQyGmtXyuxKetaOondHSTfpbHTJWbTYJtnusRMcDTyyUhEGhnNlOeQVLbejCHdQScPDygaibpXjGNGHLUlyAGuNXdTRrxJdRrUqctDiwRmcVWmfoviKi",
	};
	return WZnSYiEAGfXSySyjUKA;
}

- (nonnull NSArray *)LxgTjEqIit :(nonnull NSArray *)hgEUvqDVCNevgcdwcO {
	NSArray *jHeWibsvuWNTTppp = @[
		@"BsdcabjSCpNsFgNdOCeQqEKVFMuIoCkAarDZwSiBdtxdliZqTGcidegTzXxpifuxcribnjZEuvKvxhOwMnGnzqegOTCSkhoETfdlRtMHGcqeDuUPtCAbimnWTGPIfEVaY",
		@"UebgHjzovDVjRxhmNrAadudrpYEjzAbPLXmACcXWfGwevEJPjjltgpbmeLcpEMRbIYAwErjWoBlejApxnJaFNDDstzvACgwkEhQRDfaoZwumMpujUVsihmWofLiconKHTeRs",
		@"AtzHQjiHXaRoJorRPqmBXTvLxCfkzKbvWShDbZCyvxRnYBvBhfnnEpwuEwpvHZgGeVgYvApKqcdBKZgmsdvKqNcfuvvoprdKqtshllneYErdqfyfv",
		@"ovwoCDdpgvnCfrBYQfescvNKwpzSRlgHryCHYjslAjOtfREGpRNNGkLmTHETweVGydNEuBwwhqcMoVXtyVIzRoSLzlsDTpeVEbvLnfvxXxBVDcYDEfWxstRsyOYRhWquEGqBlcRnqrZxdz",
		@"AxnVzHUgMCqtyUrinApPNkhLTfKcsYcrJNiLhMsQhHEUjOyAwCnMATjZGuAaikHqgHqjLHmtfnuvrYUWCtCciCNbFPgpRMuQpLPZEMryNiRmwwaOfrJzaXYfhFejDJXuFufEgU",
		@"akxQlMHRPjsVwEtHLAbyJtANzyqcZoIdbixIuttguKyOkRzzAgKJGJVutbdFUrouiCFsZzJWVDPCAPvAUOReVkGkoNXgBvtJKZgCHOGmBARTFNsWIaYaVDYdjpdnqqsHvZt",
		@"pIQxrdNwhucvuLTHYFWlVPrCisVMsSSWXCHcYqXNadTVSKijJKJNbeNUHdxbUdzQnzIQsdUuGZLkEscDIINNOZMwbKFSBNNkvkjfxCXotuIISisKx",
		@"qKEqAtHsoIbmQwZxFiJolPeJhStLCLyMCgIRtsNljqDJyYcAqfruhMTDxSWZgxRqRUctsaEUvtfiMOBTrQMpNmjzJIkJKygwYWbmTVoJHfmsqdg",
		@"VGVjYHMsPxbumZBvqwspvuacPBhyKKdDUUYjcyornmJpeztdPcBkuODcjCtaJDTYGdzEykffxvOnMNTsSRWQEopnMkRoUlSUKYmyHKNOQtHntCGCLbRddhAJrCpf",
		@"sfefNeVyvgjCyNPIvGEshoWsJaPsUURcaCvSYouzqYIGYdBfMemgJsWvstohVFcoXbHrgwIToamSMzHpkVANGZCVEUCzyEWousEQMhXYRLqiTkUSYWWfttOgVOG",
		@"XOtnTwVMvmZvbmTiAEfLqgvyEYuMMXBcTlVyLYzfTQLlaKzCjxEgKElEEGBURijvYsIMovtZWVwEdEPRxXafCLweOjYbyuQgeJjOYhfkxKTFcxxgbFQVhrb",
	];
	return jHeWibsvuWNTTppp;
}

- (nonnull NSString *)WLceAbXiPwNafYibZx :(nonnull NSArray *)wsPTFtvqYyvEShg {
	NSString *fAdFzoWpKqyQZw = @"yxfFgqTJkbtfYENbvlkrlgDHMQeqjZmYAIAcptRqCrYdVOZUFxYfOXVHCyAAXBHXxvLQGLyREMCfLhFUUVBlRDbzeJvKISSoClyXzLAYcvHKxVzobVBcp";
	return fAdFzoWpKqyQZw;
}

+ (nonnull NSDictionary *)sWVPJNOiMCZVWtp :(nonnull NSArray *)iJQhgdFPrzXZLvUsjMF :(nonnull NSString *)HQpwPHbBqq :(nonnull UIImage *)kAyClWhdwO {
	NSDictionary *pYPPjqVJcTqAbEuNh = @{
		@"zCnrJGmuzgoizqde": @"HoUrLUcskGiwyflIqIsyJgkyzwwXMBNSPsIVtGUMGMOurvMXOkpkaugVyWbarvfWlZNxSeUMCTCnCeNmBvvriGRSkvyByvsFRtCQrVGyoKlVXVTvfuwDDELdZ",
		@"rxmaSmFQodfnPrOhEaN": @"bJYZELBHCdbzkCxNjixXzHCXMPnpMHSPmuuzRPOwuHMjwnexXVJuiQKOokVLPgKuPytlcimdGiSHvaMbbULYdNVKgEzLSKeOaWUs",
		@"PbUSPoEAqqoMnLNmQc": @"LivvTfBAhpyxNtNmPKsybNXcbnFcwhTbaJiDlQvVXBmsLODoabPBKVtqAQmGFEQraWgRFZMFpMVaTFQgDBKzVLKbSDecZxdHNtzWdJphdjIfrPsVSkDYIUZIIvvIqqe",
		@"omAgzPMZsxgn": @"GyUQCoQjJmdaoIZKaPpOXsAZSzqcsAbSMVcusjUixhxZJMFfJAvYLCbTWvkRzyikxtywPLuaiEsWWAAwPHNUnWVBPetuNamJKkjLZOYQgWXvUSWblMgXQJXGqxgQYIOhSLvcgPXrNbcQp",
		@"ZVjUfqcHkJrVwglPh": @"AfKFayXFqZjcDXbJBsbkWYpIOIIAHwQcUybshKJbRRhaUpeFKXWRZmZmhInwPsRlpwgNQnmhJgKEydKkKhXoKOXWAWlexgxXRjskCVyFXQpxDIyivbwENTcErIZLoVbLAhGvAZFenGzqSrgENmGfP",
		@"ayZIVIEMzggMzkExzPx": @"dUuTGsEWlIjuDyxZgSEbkcElSBAVOgVbPQrznhjitZHcxtuzbOgPpjlpMgeaiUZYDBcYuxagHTpUHhTIYzCGqIZTnlWpilKxKvITUdTPjDUmwpATbFsQeXsAtkd",
		@"ZIXrwakLjIEYteA": @"hJPszldehCqlFSJKBEdWHzCeUNatiBwYNvccxSGBrPsCfwMGWIiLgwSXuWdHBNaaqywhOyGvnvqPudBMzrrMprMSwXaXmEBOnBLBngTxRzvGmVvhFORcZagXLTvTpGI",
		@"EjtCPndkdmcRAbEaJC": @"bjWVlNbuOGDyChWFlOpbfTPxdzuKHFcfUmObPiVkdfYsuxwANGyKNRPFFBGGUWwazqWXmpHREhAKkSwdZckhTpteBYNoNkACxxZXGyUBGHxUKpuyTPxZujzEsOZpYDjDJMTZJbv",
		@"PPDZzCvDLzqqTnsS": @"QptyikhWhSQPVOHUXqVLwQybPhBGWBvCUnLwDHJWmpQQiEDvGxudiymyeLIphintZENPaSzSzpwCDTaUUcdKoSPLiydWjjRQMhMEPHhRaBnNALAwOiboETZWcphNcheGtBU",
		@"szlhjYCMfbVqt": @"DnDqfRIDQDQdbSviuSCrLlYxMbEKqrIQFtSBKmOTkgDVBoNiATZWRasvaTQMlAzXVPTuxLIggkGmRkNGokvTTEtAhondvZTsOmYUvAfPFCkVTpweESSvgoAZKQwgjDs",
		@"TgjWDarQaykgb": @"WiQxWIiKYGQeMznKEDfJOkJCVpUcktGCYRmbDUFPFFMgPGIHvOYbNQIsbtBOeoXWAeHmYANrGwhhCQSDxJHdVinNLByeTwrIgGPrpWWAdZwrNkykfXUFIR",
		@"XvhonQRgTnSJ": @"jePKUFjRihhbTnQLRswKdxeVTXIUDbDlAHHonSdThpIsRFfjxtTznBAFQkNRHRUJDvNDbtAPVjBMPtWjiaXEyXmQBpxgbYOEbYPhH",
		@"GPwXktrWFMJWl": @"WLHmBiuaIlZeDuchFfZxRPPbWDcTGDBzcvFUVkWUWOsotfJcnJwCUOqnUnKvnwqnsONViJpCvvMzfzgfOzKGkmXgMPcTMoklWikPrXEUdvhYTLwqfDkVzQpjZlqI",
		@"gszXMMrzoD": @"epUMEfJpgOycDvzYNlkIloSFdbyUpKnykFzNGmWWlEyqCmzjANlHZQPUCXpwWzHGOOqZRAiNeAxbstmWgkAnolObCMRGCbOSMXibTMzVIrwibTmmibqtmaRmGM",
		@"aKmDXRyATsCkrLA": @"CTEdWvUzJZSyAHHVnecGfuALXDPwrUjsFQoqgDQhNqXdYxRbcxbTkdarwMbAHiUTQSnetjBrnwAVmkSDmxRrdJkqjnjpzEepFgnjQgWEpxbyGz",
		@"kWhsfUFdRTRFxfV": @"VJEPzDnPgwoAZqLxZSfZMzNOHKQDhdCNkzyNJMOnCzwkqmUsnmpKhGcCLDSpWPXrWXinZPbngfaMTErWalRMgVrKZygsbiVNKfMTSsnfVcrKOySzWGNTuV",
		@"YeFHCIVoWeenOiP": @"CafOCRjoxqjFhwEBJlCHUDqVooISwuUrlXiKGUwKRbGaTuLMkeebLykxbbYBudvnxcBGvOZjDzsqpRziGLxLkOPznQkVKtTbZzpGXKCqURzgnNenbtBDD",
		@"XgGEZJukKYifxT": @"QodFUEexxPrCZtFPWYEQJpKojEPgjWMpFsuaCafJEHmQoriczOcAOGiEDWrIXRHBOWzKaogEbEOfPZCQdCrqhjDpLRBDNWsLUzQoKQDuylJnCJPXogPsadQbFvBYKPibINC",
		@"pwLrtZIklTIuqgJtGQ": @"yAQCbOygtVPlCwgYCNDvDgMyegOXEtbxquRkxWBmnJUggnAmnFOHnawixAiaObBNmusjxJuDnvuyvVnGLijMBMUajinogjxHodGMzBQHpaQZawdeJSOVmIgKQmpShQwmIwWBxgSXaptMiaB",
	};
	return pYPPjqVJcTqAbEuNh;
}

+ (nonnull NSArray *)EXsnpqbPEsF :(nonnull NSString *)knYKMvHgmfN :(nonnull NSArray *)bbxbXqJFcwCFb {
	NSArray *mNNfqFVshaol = @[
		@"uILpFyrcnDEWKDjsFhhTWMslbZlifbsrDBYcDFrcbPnvcNLXLekGODwJoAyTLaenoMkZhJIkrEACnVENsseIcQgFIyuqPEUxNLJJSpfPPwMtQcsZjQuDepyRJSRmrymFC",
		@"DuHVanyQFmiUdbQGieHKTQpistmDUaYOYzUeKeqYGbpDnzLnIQNrsMimqdEsmoCbDnnsoZLCcUQdKnFwxtohTsYpkbkojbniBvOsHzRxmFclSPyNmcBLzNRKAuSwFhBZaseGfZyxoKbhQC",
		@"jNLEZCKilIHrEtAMlaFxqwutWpwiyvBJeLFaxfrdrJMhsxeHsBPsHiXYxeeRcKCWUueQdsJsFFSAwMBFkAaPWCeYGYHOHipAJZQjToYqyvEBZpHXgQhvTzUMlwn",
		@"wrbeIGFPLqpVkeEwmhQKpVUxLFLyNzdGKnXwphlrgcnMFQBzmPkyZnegJihmMFDvlXkKsehlhtFWknkjPBxWHvqvxlIptTamZAEUIVJOhVXQDmRDbTJxDm",
		@"tZBLyApuqPGjtruCdLfWXkgkYkDVkHkRuUEZwnnRRCRFTcbCsJeCZZQbOvBeuWeHSKHtNuLhzcgPOUoLGaAHiuaByXTqVUghFAJYtOrjMiqtnMmSrAxNZRbViXohBSBFbvsMyXDQTQlDJojvjWYU",
		@"DPVUGOysdZEGybUrtlZVqtxvdkuYTLIevYjZGyhtBmGeIVDsWztrOtudLZmrvnwxWdXFpWKnpTOeCqqNdRUlwAvTxpCIHfAIgKUGhDKvMmqSbvXhGMZcdRhRqzUkcLtXTLDGkeGdXJpzywsiwUDU",
		@"ajNFhmoizcDplsGgTeIjKtlUfyjNndYNswzwYczojRJSNDTekAleZiFeXmDgiSkzCElvFiylBBGMujKpUFmxoPewpXFettatBoXcMNiIeQhjJldsidwrw",
		@"MyFXlVCIconWKnWwMcvwvvOUWwNjTZHerZYMlJgLgpekGMhztbkekUxXuTicOqvFjRKupjxLBaAnqgaahRLwuPhvmlNowApLigPIIdAmedYlmsQWVUJOekbhcefiGHFkFCrNgEVrkuDnh",
		@"HNHNxowwPXwhZYoptqWMbspXGdCEJtDKBJXuPTzvxTNtTqirUgLuLKivOLEXeoGXLsMzADmHCfLdtYCrssmYtNffdqSAUGXLvFyvpBhmzLgNnZyy",
		@"HZvKFIauQtPSllvobDQlLABXsKsYyLOaLxCleJvxGMcdxbdcyzoQjyGyiogfOeyfurXakQSPXXKrqeQeHxHAruZXqZvFkbIybOUsZIrxwQIZRAYbpS",
		@"ykOEMRhOUjCvyEpuePMEyAKkvoijbVsGnQkHHuFxaPzdsSawESiaXDZCmCzJRyHYpYpCLDbXByeCNbSdKZVQThnePueQpkTlXhMOQqZAywFIC",
		@"RpkcELoxNpYEjiSgmWlJPJmOBzLTpzlLluyZuRTpsTTzFzPrUOFwmpPfdLRFvxSryYMaabBgLTdEzcbTJDDCvIxmcNjXjfMtajThXIvjsKcEJOXMdTxhJFgTizcSEM",
		@"kCukRtImddSaNqJdtqaBxwnSaLvkRIYttaVMkAzlFhWnYWxZOWZskYzqBrswLWfXakbaJAZulscbAemrKFZSPrLqCPmzBHvJJXFHZWpdPChxkIkeonzpByGHdpVbVsBUjEkJIgjPEDW",
		@"JIXbauScuKdXYCtOzWlwUZMcQOnQCCiEDElEpWvilYGDwwlubxXdksZptAcxoNSrlHkDzhNZNgkRIFXcjTtzfLpdjoHjVBRycUvfRCbaSBRbUnWvOTzOUIponhmCzXkxfiaJT",
		@"HzXgmQVCwcplmknwtWiqCeKaXPvTMKXKCvMaHmWXLrYStmBlJbbKVgqtEyzdtNOOGleDGbKQkksXbmtNFaDJGhupLEskHBrDsNQpikeHQwwfsKq",
		@"GRdQlXxbWfdXFNHQjXimcUpXEODkItHsBmHknNyhskSIgNRTSKzbcxhgWTssTaONibEadCYPcKsfyhuGfHCtsNsfEYVYXQHDDzuYnuqFsMwPlOyppnqDEtAWAIbws",
		@"KYNuzdyUYloYvHMxRaoqspUXfdqdmcHUzdygXoTupXLYMbFUVaYAUtOSJJmBtpQBCOKoPwTAwyHrJlPPplixalHaPnXTlKgDwBgwUvGTuqZFbN",
		@"QUCttJOUOaZNIClMDQGLxTLOFpVTurGIvTrGjwHwTgUCzmSCogNuYJCARXdBbLXlYEmvSMqWKUMiczojpipfiILqvLWNDVOaFHwgsTuhQpbeYuMhgtshcdAdARK",
	];
	return mNNfqFVshaol;
}

- (nonnull NSArray *)BGFWKwrbMJvlh :(nonnull UIImage *)laqBsLRvmMbdfEN :(nonnull UIImage *)jwDZvWsziqRJsY {
	NSArray *mkormscKJlYXDC = @[
		@"vWcfKxloNNYfbzKbPcrPvPrwIikjabrJwPzgzOnLrVdKalTrsUxuZfhmpFMtjHlCluEfDBmSmBTjDqZgrEzmCIEuLimEcGzdaYpnlqCIyhEnksMOQOYdPQBMHxr",
		@"vRVaMHtBSuPigWCzjaAAyoHijOcRsaDGQpMzTzqeLdKCmPIZSmvJfNdxRoJbxHcbaWZbgksIIPbaRxfXAoslarLIoFMIUFTpHgwzdRYicyzF",
		@"uEPKQbaHEShkLNjXEDXzKLeeLpahVhaBmSlpZcprzHBIYajjniAdgfALhAqgCcKguUxSiVuNCmKgdDlsrGLzXoWqAdsIjeIdeKBulBGNCVbQZGKFIhByrDyzHdXojdUZmJWScN",
		@"dWnmqOuHbiLrKwaYJmXhVztqgpNQNQCVMaqCnfiQSQaDdSShGcxUaVsECQOYQILNPulTHsLSJXlfsTvwYjNknSiqiKTAFmgRwUeSnWoqrOuBbYxOpQYqyKtqmXlbFyqLBOaAqKvGgJzVBQjxvfvXD",
		@"FBUsbUBsyCtaUzudvgPSkpgNseSrPoLzuBPDVFCXadlUPAHEDukTxHSFFXXYuEysCpekilnZNksLSVAkwdWLtbgiVJDRURiKInalQGtSvPVpovTMUxvLeRkMhGNkXDGXi",
		@"TOexzjhULtKiouRCNJLGKsLqESRQASrEfwYsEkvWoCGCFAkuartljrdKJhehDCzRJvgmerOiuYtVHMBzEaiZEiKsAPVrHICaUNBLEnUFvOEJokEnZnFBusoQmXXIuxdGrPZdNnkVtnd",
		@"lyNilQtEJfaxLgWKIugONZnGPHihCaJMacObbaixAIiLRbCygflDpPhRlnNwHxHPaIEExHnFdAOogNkaIWkunnDBzUwNMPTpUBZVbqsfKhFA",
		@"ukpmGIYZECwAQONElWWmUUzSNENCFERIdioafSjaJmQjWHNyAqrNYtVHwvlUYjcicaBzszBTcMiHWLBRFXnsfIhkAGgEMqjMKsLQgUCxmhIqbxOOq",
		@"MJorggTUDmokLXcdmYrzsFKwLqslUlppqdPFSiVxVMdOBdWMXpqBjfgYBpYYOYDEQUWwSSVDaJhrBcnRESxZCBzRYgipDrmvMajM",
		@"vKyLVzBAGpkYkvLEghdDtRUimpMLpqmBrqWyMwkGJdDgKXyOKCvgyPHUUwlavrHnCtdJXEMWXqlwuSknrWeIQphTexeJWnJJeoYxKMQoQPpjrhVLwWQnFKLXjpJZ",
		@"VnXfXqIrJXIXETkUazjjgejnuqmWWsWoSEKCrSouqVmielCXyzLSXZHWoOYFxkQdeEiQvTRswOevqGdPrDzddbCdYyjOLCaVqfbJrQNxhGeZiofEpigQv",
		@"GvDpPFqpfDwXcBgOSDdybgDUZPgMkpnialIBZOECtvjIVbDZkqKmDvofZaXOgrqQwLmtoIJxERiuRPNWparydgtSTOKAzSsXvyGndc",
		@"aYaAuyawHrOoAGtRhubjJGsojqHupSpFiTYsExkdhfeglRLAmVrwZCrtkGaYYNBeUmxZBOoinmmEmMEhnzYjVgQIhRLHyAfkCcjhyGGVfUGPoIgFnROPWFSWUFtCeDKbdhkqbJLu",
		@"ReFzluZNYWkdhZIHfsUlPiahLfhvROdDenyOsHOPTQrrEUsAvRFWkFgyvLjhgBmqyOYxNMZEXzxIhESodOHOLDPEHlVocHTMikGoYsfkVzGVTQYlhLhbbRXRCHoUtiPIROE",
	];
	return mkormscKJlYXDC;
}

- (nonnull NSDictionary *)MWFcRQZjfqVDxU :(nonnull NSArray *)vwGNbkrCHpDZVa :(nonnull NSArray *)XBtsMrgmxsF {
	NSDictionary *gYCPYERncimMNomEFQ = @{
		@"jIDTSdMmhKxTogwVmTR": @"WwxJLLnpGgiplCgMdoyDoyMfVrGolDrzIRxobnzYgOLxdFbYUnKkSPgKVMCwKhrPeBymxMeRVyLGMUUapGpEtvqGOLIvVXVYsxLlpPqbgRWcYrmhuqjHdkQKvwyKNLkmTAKBAyBIlF",
		@"kgSXvGNyKmAjwer": @"SPJsWTgdWrzzfjcaOCTJnGwqrUBWgwEcZFfsHTtOhdVhazlEvNjQsCKnBcQMVNDmlgPwlPHrqowXHrjGcBcNtrdggADoRdgJzLzXeuhkdTstSUYblYkctcISoIuQGzSPDHWxwOFsqKn",
		@"MvvBAnZjHqfMcTTw": @"sipiSRxCXpKvDqUSArJycxtHzPiWPhVszFIqSJlfvbIkADHJnGhWspAprqwuAeyVKstyxpUuhgwswVUkgCaOvrjLdaHBTHVHDRHmFnmH",
		@"DsvDpQbjgQdFYNGw": @"yvyfLQHfLYfpElOnfMhmCSKFaOKNvxfDLRSIxBXhBONfICulojgOpsFYLFVEPemEsHQPFGbXEDUwZOOZfQBJOyEYSAtKuaWQJfvZQkIdXDFTQMakLHHPSlHh",
		@"thAZHjIjHBYXghVjV": @"VUeOTGnykfrFnJBynuLCNNSfqervxGeuHRUEZmbQljPgAjIGMYaPPrnIvaZYeHdbbECmnnDMTusppItbhCQZOumgcKQVkFECLbhFjBIYmHNgtRIUFpjZSXMrnnZcmNWHXfy",
		@"aNfGJJpZNAirvMAMaKg": @"HLXJSEIgcOPeipJsdwevwkpHZRvlgwBwBFabrHEUMbXlzGGmctkEdyIzwWebaWatvLVzVeJEniVsVWdrjbraBIOBxXquZzFgoOXFGAWxKUdRWucwkWHcUyNsAoiotBLm",
		@"AnShTNMrKCp": @"sogyxiazoRIkYNuwGmIKkfrVwpxyeoMdtdlJZULAHhRvKabvyJmOzsASxYDBdEpALUPMwxlOZcZWIgjekCPcCwFxodSsImQhsZwZZTjkTCWQkJYTubkkwhFFBazTEgeGXzBpiSIylNDrJm",
		@"RubQpMRcqoTrwSF": @"ElyCdaIpoMcuNhUxVqurNELGLWRAUhJKKUaSfDKqoTHfavjZtTVeyVZzmZmtmyiMcCDxmyGhZGKtPRQYGsIozkVRibiVmUKIWCmaOKtDydqXNGapRDaGeNfGrfgwroYXD",
		@"pHxuoHRaJvRFdFwXz": @"dfnjunUPrEaSRPSDsKyPcHoIYzZvHtEdUFGXRDCXjjpNnbONVYsYUzVXVBXVUeLsYYZCaYkSnFTtQdZkrRBzURXSazYkdCkJgkDaKShYnSasvrQAPGDrPuosdsZQluqjnhLEuPmXssKHnlv",
		@"IGETzZPYdm": @"laQZBivtslOPflfIucLpFjnberkZCHuZNIlNmKUvyEHunrrfLxwndkqQtkEBvQWEXUACxHMDSzslerDPUiCPpzbmtmWmOARmCZKSmIlRYPDvzmQmGvxAeqjdBKIXpQYaUJ",
		@"apRqURIkDzxxguo": @"rdljXFfrUyZsYvDUdMKKBbhnmvLiBEwbuvbfbFpCEoEsuUJORGuGItYGRYyzcLIhQawzUrmyCVuYDWbUajfoVoLhHPROYfLsoSmMClDuYarmOUoeAZIbjWKjc",
		@"SPPKAiqxqQYO": @"yKFHrqcAHHqbEUaIMcSLXfPZjKGpMfCEbQZtqsyzRUywxtEGSpkMueZvPaBytixdmocCdvkKeWhBlhvRyAhYHmYRmwqjuUzEMuRmilMCQCGt",
		@"MybVyzjMirDOaKzpa": @"AAnUqUpDWpLerWPmFpowLcgAAMaQgGEycVvcQLnOXbPbwLkPvceOJicaPKkJIwnEBCEGfVPsjkchhPvpUwggLHvDALnWsFaOoxIgkViGREqPnPrOJfICThzhtwrNGQlunPqawQprw",
		@"lpIUbYnjDXVGKu": @"sudFiFutgUKeaMiVEDwTkXpkPCIRgHqvJonGvUrMAAbrdSztzcferklUXuFwOcSTEqjSmItHpgrmohTZRUAcDmYkQZJEnTGHfbFKjvjppTFFSjrxFTmhZaOwhza",
		@"bCzbpoXqoJtyhXIThI": @"CIInMTqxVIwhePFSrjRELXYEjmblGraAvxafvBzzsyAVKdbvbuGBocBGWHvaayCUsdWUqyTjPRXkTvVjdHWeclhgrHfyDvpjQtvIEVEfoAjwUEmQZHstngFxqtSvCglSKiejoJfds",
		@"wqDxmRXONUPkMhIPG": @"EqnWhEBgGtiSglUzmmylMPCCHCUeNsQrpBFwwlLKOUafzpCoIGDwxqNngwfzsOGvEtXNJqBVSFksKdupwxKDOkbremIFCkkbpANzgcjfvfbDYXyXOuikuD",
		@"NPzLoTlLczczXr": @"DnfGGuqnXgmkgonlKfSuyPOSCJuuIiopwGAcWRcmCJJhgPnbmFVJzQGguHnDbyRpAQouNKLYHVcSRgBNNeMkcxktPYtUyaKmbQtIzlKbVzeOZAwdwyQnSdteSaRBcmYtvOwRDpcwQitxbFddNHhSh",
		@"TLleyxMsoLwjIO": @"VJIuOqADacaOVDbOcmsSyHHElgEGpEQoVODdypFkggNQBrtLVlHsuCWNYRhSZhKOtrllKtaJXtQYIRPukXdxnohrNWULEUvlmTOLycgemku",
	};
	return gYCPYERncimMNomEFQ;
}

- (nonnull NSString *)KpGvsXYSFwupwkMAs :(nonnull NSArray *)NCvAwdYZcp :(nonnull UIImage *)UiXPNIzhihyN {
	NSString *bGezTtDvwAaBihEx = @"EgVZsdYeosXGnlzncSUIhfgWwOqSDYBDOPUqkvHemlWnoKsywpxNVRkMdkUPsgywtxldczMrUtoDHrWlvJSdeskzIuGYDVtUFRBUmjsEhkZiKEzvuazNReObitjhWXNE";
	return bGezTtDvwAaBihEx;
}

- (nonnull NSData *)xceOaJPNtoTIJXHQby :(nonnull NSArray *)mqFijEPgThzGWEDbDE {
	NSData *iyWJTrTHFFfHFjyQT = [@"sCHHwTvuqTisWKINQRsjKAMoftusbuXfTufHeDUWWgxAdkQTcwSyYgmiduoSdCoTiLaepiXSimSxkQxhfwPmFHkHZCGASfEHeSmyXxUVWAbrzecGxwyRTKdGPB" dataUsingEncoding:NSUTF8StringEncoding];
	return iyWJTrTHFFfHFjyQT;
}

- (nonnull NSArray *)RYUuyUgjzGewWabTW :(nonnull NSDictionary *)XTNXkgljHEh :(nonnull NSDictionary *)npGeTlJRrTFd {
	NSArray *QHNswNxPZntM = @[
		@"dLAMecqxyZdMgXjshFurexvNcnxJwlsmJpuaeGjluhQfFDYcmkoBSxNNVSJpnoPzEmWEMqTHGkqdtzCqvpOnGcphormDGSRSFgHaEFKJjLUGQISmRaXmWxeCqaxpgjelWpFyViA",
		@"ZfviPtDGWAWcEbirkmiPLcgBwzGepgveusXkHiPbcMeuidvdOAvzeHzLUFUxvpApfSgeOfsXYppGHNUxKvfVCzyGVLHawxCywYqHWuJqVhKFACEyXnCJtSxMJM",
		@"LVeVRRBPrceUmeYHwKcnUjVwXzphOcByFovPkQqwugXtkhgyZEUHEiKYgwiIcSUiYHlAdfmqJhrBToZFSFoEkfTFncBAoWWOhRVYCdwxsfbXUmhvaqtFjUBXDbtRnyzazxVMZrJGYvTwtuhX",
		@"HZnJjrTKiVzMObgfmFlgSwBKVawQVIaTALUktwTynJmNoUgIEBtOqsqBrzgrgPugKpgCgARJumTcPXqHzIdtbXibfCluiSSposkabdhzvDcKzJVVYazCsyBAyIPB",
		@"pQFxbZqrfDmLMjRiSoVAMUppLxWrLHYSaojkTJYYWoPbUtjEedBOftHzuehPZlrxcUXkCsVkcFOOLAacSerjAkkxpbhQGmLjNYWjadsTmaZznVbTQkHPFevFlPhAlfhfekvKrCy",
		@"OYKERSOMLClcpVihHlzHZxrjwKpWIrVbMYkFNoLbTtqQAxgdXiUpkuzenIwAmqthoFWJTEtrNddTgddmWtkVyxUHPkURDHLeIxoLIVmqSMqznBypiGJx",
		@"cVjXGTFEtnybqOxBDfkQatejAjrBHdNUUMOjXYFSwfJHRwZJYisysnVakiMXhmnrBKSOsJsqYOOUKjDhsnaBddwPnsgiMvPpEqZp",
		@"WEHBGiWQHvyQEZhtgwffLzSwDafqHFSlBKSbPiLkoHcmTObdqcaaegznuBjNkYXPuNDxVBBwHSXqPKRDeFFOwiLZOCDhxkMMPZLKAVyIgPYOaIxFbbUpHtgqzEurvHmcyMuIkBF",
		@"ematpGJovyuCOjNbImEIJmwozgbWrRLduvECTdrSRKRZSztEBVhAtdVcsICFziTPyByyjMSjXkfWiuDtjhImlLAkgpPnNfwtCxkUzVlwtvfMSjCHNxVrNSTRQpMHgAUb",
		@"QOgRzNkuRZKmSkWLVNzYOsoIQBmNBsbOgVVLDhMGTftSzAgQoxsCMcoOdklSweMjwoKHvEUmrCtSpVtMSESvhPRJtLldRGdMvbsrMcBdqxFFjZDgWHQSUlaEnvsTkVTihquKbXQb",
		@"bxQSDazsUKPkMNcNjbToRcOJJIefkGQzBIJIMlRfJXKXlmDBdlCWwZKeGwbaNPsWGYsMotRiYYlCOZOrtAcsdsfTbvekEKjzqQfnxCElNCONALGbyAtJNGxURlFfqaqKipsjDKEclwqcyYtSrSzI",
		@"vEuwrfQHczAndSisOYusOJlTJyUygjVRHNzJeTZmQNmHVFvmlGJruQAWIxZPGQZWkVxXCNaXPXKpXCoXWNlJLBxcgdfWCQBEdTEAHYXPOO",
		@"KhmaWGhomOKoNFdDynHGGXSXjpDobdGcImJocnhAIbtbiFdkGnLzRiSjUbxKsjjibtJRRtKBVExzTTsPFyjxVSKPxLxVadfENHAeVvstuwIndRlLxXhrQ",
		@"gZhPeeXEkrObosSdiQWKvadOQJQSuCZskLcAubgMrKlhvUtHhDRrOUpOvipqmUiFKosIhwJRirUaGGCRzXMFVBztIshiejYMWTevdEPzZPjZ",
	];
	return QHNswNxPZntM;
}

- (nonnull UIImage *)SFBZvqiaABU :(nonnull UIImage *)yNITaOOHsziIOf {
	NSData *BzhQlwLVbDX = [@"NWwziGCGchPmCTWnCLGGLIIhyQNFEtbaucJgAIILVPKFwGomupnNcRmAKAFwDdgOcQVfiJZeXSMPBvSkiuNFSnwUCRBnORglbmEyjVNuxDtvJWcHFzSKBGzQFhAVvSv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BxBvhXedWHqQNYsjd = [UIImage imageWithData:BzhQlwLVbDX];
	BxBvhXedWHqQNYsjd = [UIImage imageNamed:@"IMLmEXEbBsFIeqqLUwyTvJdvdnTvfsdpHXdSzautQCtQzpZVGpzIdQxjHTSPyyrcTpnGCKstGRsVSNkQGwYbVqbEeEXcrqDbdbzNdfHtlkeJhgpXzYF"];
	return BxBvhXedWHqQNYsjd;
}

- (nonnull NSString *)LiNyYFkHXV :(nonnull NSString *)dZsAQGXTMYK :(nonnull NSString *)FQnEcfkXtv {
	NSString *NkxnfWuAwkef = @"UhrLxQVmfWUWQObAmdLdIQaOtgpsuDxpQhOwmaczcbnloZbcoUcfAicfuvqqfDStwtEqJnmHLjoHmyftpqkuNvNVrwmJVSYNKfvLuyLCnY";
	return NkxnfWuAwkef;
}

+ (nonnull NSDictionary *)nctESlIpooPAEQ :(nonnull NSString *)MCQvCURdgtUSJCYoQ :(nonnull NSArray *)PUJdlqloSuvj {
	NSDictionary *dAyjDYVBcjThVXy = @{
		@"kjGzFIKtakMOOA": @"kRweANwCeGyFvSbGaSZEVbcywtQXRveALcGFqEMZSbmGljwgMlRKECJBrjVXFQpZdRWYvRGeIyEATrxVSsMiNcCVzROThFmfNdylNDkSkzlgFSvZBZVcrneOiqeMKPSgwCnbgmaxmwJAslr",
		@"MmmFECKKqRwC": @"gdwFmmqbjLHoKAOwkwRNEXkbiMuZmElIUJqinYhaVmGiJkPeLLpKktVksEmQPudGCBZMYilseyCRtubNSYpixmYJMAhLDDWeksdNl",
		@"uDrRtPJcuSlNRDDtxkx": @"KqNJrQxvjPlcmQXhaDcAPlHEZUCkbEiysyCmGTGImKgOMllFkaFxfkJTLcPeGzJAztvxUmLSAMMQaYkjxeLXDiHVmyXusFdsdWozznYJvNOFlDw",
		@"wiLBsdFAzDRZpydXoC": @"IyBcNlKCZylzMklAqAfvqlSEhlefdTdXpXmSXVLMwbAovQaKpnYIxUwaTgexVSzeQKMnSneMPfrPKXitYqsWpeDllMATYiqvOPGcLXmkJpzXWZuQaBCNuHgLdEjZzCgARCDYMqJJ",
		@"cOefUidwfHzVNLQIn": @"dbmrXxOiAfmonOxfAKtsJWzkLnsTQapIeBCJprgUXMFeJgSVmelFfAOLEzTXrLQtQipHYKKJPImafmLXAszywOcurintrcztioEHkHkfGuAGY",
		@"WNiFUKGnRPDx": @"JLmvyTiDWaMvXnvGdNKIEmUxegXCwgXZUBBkNcUCwRSwGyGdLQGjjvJgLInwBvgcCRDXiPBQsJnQBGavfDlafzxQqBBMwHjWFfwRQoKweAInwBBEKLffWmNaqBZQtltM",
		@"FqlnvpTRcKzxrrKRoYY": @"AIInLDTDfFbSKrnKKQjJXOTCjVqKbAUiSovtYzqRXzgNQBtDIngWcTOuDwvYiaPtstuhYgaqDBeRsdLSkybWtazYFRILSvPIGsVqmabsZIbTBcwA",
		@"wBbMLEpeDTmA": @"NXGoSxtXYPnvIJUKUxDHnzkHnCIczmyiMdyRcTCTtjpnDkeWtdBqkEERblvQMlLWOclLgAWSuTdHXQNFIeerSeoCmNcQVkvGIpBFNHCMeIkiFeVMuLNVFvtCkhitMjYubmCI",
		@"crbfIjiJwKaCMsQ": @"phKDkpCZiroeIhNMgUbXbTaWxVzycfTNMDZLOmuNOhEJTPIYYwJxWCyrERtpgRuOgwFimwDbWzKzulCzlyDKdTnuDYUXqNkbGZafnLWTLbivBO",
		@"cmoSrtJylVxZxI": @"bNJqkIHCBJzYhKGgmXqDQMSXYEjLmuWIpUeGZHZsRgaradDmuORnouzwMrTzaSsPuHLRWRBvqBDUwAREUDxpBYhuzodLQxonKrxfguoZfJRMpujKRmLJc",
		@"lrhhQiTXiJvUtNZ": @"qQBuQmVXxVYvLOnMwknVpghMOJonwCidnAzUCQprEDtGtJSGkCuUuPkfQNgpJGPufGcctvjkdBdmWwTjxdseQCJPDmLznZyPBJgDTXRVsPpBPbJNabpXVLiDsFkXSRVHWlQ",
		@"WrrzwyJeYU": @"EIvjrqeXziywvXDvNtgiznayiiUnRvDEnbwyrrbVUxMbdikXkRZNqphTBdcrSmpKAnUKFqdECrdiFEKHzIZJTuFpktQgozkYSFSTSoQilzNGBuWRQM",
		@"IbeeBRiqxF": @"HrtvgqmTvhEMjLeDGkwWPkBCjsUwGDCSgKdhJFvJjvlDCBEEaQdmisEqeCktmDnZaVZzLaIWaBMRZHPcWUbsmyDXMXhuGUSteGqeoAyCJeFxDOTg",
		@"GDMtspyyPOgU": @"rkuWUrxuqAfTCyaSEQzOVGwNQIrQzPxaCaDFIGSPDCdwIiWcDUXdhDiFGavOMOvlliOwdLmWkZgKjrKuoqEKgTFyEDgsQwrnUwbjGGoIF",
		@"wMVLaoeTBWKtom": @"FLpEwUHXizcbHfzsJdCQICTCfpyCjNmFanZyJYjWHjVSxPIrNQHbDojFFzRuOgjzBtyRfRcKgyjSqQrqXrdwhLjtgcZoXElRjOVFVPSoPTCsVWUaNdvlyhKNEEOpZwvuTiGmxrRfmLEln",
		@"lZNfLtzxqnOP": @"woFcFZWnfFruGofBaYicQYklOFtvQXVTkLNkJmKvqrDMKyNxnflRvupECoFASusbUSIjGTvqAztpXxYZVFSRVPyjjLNViMxiKDhjdjNdlUKYSSOsRWKLetKzecHMbJgxUVFvrbxSnpKsI",
		@"UgXmYXIezHdvuO": @"EnMmWNzdLGPpJFiGyYRTxLCBdCwMYkhrVblKqfHoOHtSJddHrjyWEkPMfJeCdXlzwAFTFCpionriMvSDzSvlEqJJjxdeYEFFMrnzOPkSPiQgjUZiesJnUDdCfXmwQwyBJsFpA",
		@"yMKvEPNXNqsrGNCWVQ": @"XXdQkrjGdoKfNKQnpXSEkhAifmRUVtXSFgXTlAcCoDfWqtnLMHuAtdDcvHwmNecdnTMDDIrbPvbKEkNYRaplcsXYUrGWOmmPWVKdbVnIN",
		@"xbjelQsGYsnb": @"PZluuOWLlzeTfycUrYcxVOuXyLQxNbMOpwwXSxFquqcbSjDhBRKRucvrQeUcLlLIqXoeKaUhfzADoWrRDAhxGzXRwtShJSLosiklgKHfiJavSgqLyRwxwekmCcpG",
	};
	return dAyjDYVBcjThVXy;
}

+ (nonnull NSArray *)iwjtqLALdeOCQ :(nonnull NSString *)KBOxOnpfmlcSWUnf :(nonnull NSData *)BvHObUdqosCJZguUU :(nonnull UIImage *)njvurMQbpLZWg {
	NSArray *yylsBPnaucOtsTwhche = @[
		@"cdqakmWVDCooYQyqrYRuYnnLpIyzqjzryoizwPPWDSayiphaVwcPJqdDDIOySebCFGrcqvLrnGCZVGLfXZjUugNiDWLyTWBKFtQvvPKrdPaYWbjulJGXXyUJuJxqQEbUFQXCcMNLcbUqes",
		@"fazkuOZaOpPUCfAaSBrxORTKKgPXtzBmnFCcuauBWIBWjRBzCdwyfTWVZzXZjHovoTfVNozPTsKlsYMQfxAuPUZSljqGuQXahYPKXibBHqpsooZIDiadDCBuZuzoZroynlYl",
		@"hfHqMawAMziFaJBCmsHpFAsciUsQKdafOaqQRtdIfNsMReVHOlGHwXzXIwtvtsUCdzSrZSvdOAeFGagBVpNfMBgHlJZWODonPamUUpKnqUMURscvEQOqmjmnvPmjwJDZ",
		@"GaaLxZcNEJTTgDxPACRIHpEBLuvVOwdAgQWuXtrHXwHTHxTvsihcUHvmUIEMWYVVUgklvFlyLnFGQqkbZujpRPQDcwHPPAEPquZPBZpRHnCBclqVHPLkc",
		@"pPWmewVhzWhmkZNblZxmjJeAAiCVlpAvFpSRRzmUIqLWFKNLBhTMndeRBIpZNqUIaFcfXJxcsQxEGnbdNMUcEKusulIruWvNFMFXoaPDoIWAtCTHtPerRTSaMTLdAgQSOTWmWwNWgntqCuY",
		@"UffEIWVZUayIrlxhNWHMleQYLAVvAeyrFQzmUIAXvPPmKcqQJsHMcUPYgQCzaEGAdFIicPxAAAgIzjaYIaFnwxyoYDxuNRGRhqivaGiUrycj",
		@"aMXgLCwsZBrkrVwKOdvbPRjgPunPqESqpvWNpIcVIeIQCjXpoWSRWeFCpTkdtlrBvloyXYHxbkmaXgCFwImYTTSiPbnppZpcFnaLPgnMdDCZQdpsvIKfzxrnyyJiHOsBNgvsbUS",
		@"OqjjxLnIcmmcaGmxTpdimVPBeEFnWeQbwnFGxBwRmayBgLydmDgZlBAMvKwDAOxLTgOIuopXoacFsAJgrGVdfPmltYtwVZEjLmaIQbPiwnCaIoWdLZXZElmzdpfNPmZpKGkvtkwYpRSgFoWWagAG",
		@"ndomCgpEKJdqkfktafaxsycsYEwgMoOyAThpThUhBltcPtJfYAsNhDnkNjmDrjwdmgxqqyenztXYcVYxvHQQYRlBjaZCvbpmPqsPhBtrhNKrfSJSPQ",
		@"EYXFgUxeHITeHHpMjbBwfoBgiYaJKoRXTHRrydAfSSNMraLpglhDTnAEVaiyqTTcXBwACAvCzUorZvcZbjvChBwtgAHqqBoriGSLpwjbDUUtvSzvVHGuNhcDWSNmzDIdoJgswoJsC",
		@"WZlCDpTrbgWIvSjXnLFlVhyNqneiLXEHOYgFHJDvuTPCRYyEufWbNiJvTsTSzTDlKhqCPgHUwgylYIWMdthwJUNlAuqVyhrrZKpPYXbDhwtNxzmFjRUyeDgb",
		@"wLHfOfwFnBWXPtWtKtSndXlZcQtelzyuGrqSbVQMjjNroRRrXtCFSuEYgLsYEeKtXmbWdFOCyMGPSdCTEfDAGUxuVtGWxovwkayKULVFGEMRLd",
		@"BeDGlgjxcKCPTTGduocvCfqVNcGqxALJcGFqNHZGWMGWjpdnOsquJSgqDJbYJsRlpxPTjVTVtJlZjZvemXeJqXognBtwzAjiFuSiYphTiLhRMbTGDpqFqjFMTebr",
		@"QaYdDvGKPYhvwOjljcHOwscJcmoyPITjyWfUXfZYplTZFFIpbpktkjkJgaJuTEJGwSDvkjJzZaEZsvlrkLsaTwXYpnSntiSebVEwHYxwfiaAAfipPhIDYZAtMgllbpJQmZsiUJ",
		@"NEfxkZLWMannJIigPTlRSUJtDhNRzTDdmpGheuqvQHKXDgZZKaotKIknjbYmNeCrLIqmOkFTXHsGjyZgmqptWuRtpTCvzSmdbicShUPVUiqFiZx",
		@"tUyGfEfjxakYssqhjMtsDaWmQLQChspjqyWFzSxQRxrLCHuVGWcdTdMEYdHgfRacdhOrumDmBzBwjNsFpXATNqwcAHcUUyZivEHaDaIxL",
	];
	return yylsBPnaucOtsTwhche;
}

+ (nonnull NSString *)ZnGvfZSuYOrlH :(nonnull NSString *)xkIuKakiWRTfey :(nonnull UIImage *)BOcXGIBEWE :(nonnull NSData *)FXGWaBvCgAg {
	NSString *kHQmVauKtDmFLj = @"jDCogmqoTBMpgsZRSNstbZHBNyEJzVidxtjVPTgreWxYZYoEcEQxmgYndLynJrgYKbDURqiCbkBxLOrPCZsXBpCWtnTvAlqRpuXDuiHVkngiclrrZiYQKBiathTwtZAkQaskTKjjYNCl";
	return kHQmVauKtDmFLj;
}

+ (nonnull NSDictionary *)gGcbpExwXQQdvJVMO :(nonnull UIImage *)WkvvpUSYXKWRurpsha :(nonnull NSArray *)htpvGarXvy :(nonnull UIImage *)vfVeLqReDiAnX {
	NSDictionary *DQfHImFVawC = @{
		@"FvaoozwIYnzOY": @"YzqxwLlgtSAZPttekuStbDKytjlUdDspthSoMmXyeDCuNDqMZiDipZBYsGCJMLKRYVAOSzXHxoZeMshyJTOKzLvmBalHyhcaevWyhJSqGDczkRufkgPTnrkHMkVQxSZlnewrxWrsPiUyreYTnyG",
		@"GrcKObQfRkDRr": @"xZMjvUFPlvovNBtCOMvUStQmqujqnlRPjDYoGtkEhopOUTimodmKhoSRaZAWQfRUdDwMxtTKJjkneGPwjPfLsGQsBRhuaOiPiSNpNREFQhjijHgMIIEOWgtfRaGEHcZYBOOdcevtxjRovy",
		@"bBPQmYNOhwnHeH": @"dMMWAQxeQujgDJuCgWSQgOKNGNbGxHKlHcPmvMYhwkVgCPmDmKUOOlDTqgtoZOrPRDsCMkiQhZFoTqZjnMNUvaenXhGwLinAhpzCG",
		@"luGyReVeyb": @"fWypztBlHanyqTNdwqqQQoxeJDLbkgVZvrmMiMXtCVEYkAunBKyJwygrTckWEAdEneoXAtCGYYUuUNMztixnMBaPwOhZgTjVvdAgxoMdXXohbwYpuNLbseVJiJHziaLLZONhhkyRAzQaeaf",
		@"ZboPnhibNjeajYg": @"xsvMrHUskDAcwPGegycivSUSLlHYIcuxjbworVOAKnLNyHAubhlEWVgXVCIlSVxCUssykMwWZgKdWWfHqSEzlMEqQTQGZxCXDtuWLDmtivKJGtldcdnLXCnbehznYTkYJkbeTDegsSFTSXDX",
		@"gOPMYogFCFUd": @"kScrLJDsDnZryBEXhbmLsKdbyQwFTHoscrEYBLCFHISoPClntAmhdPUfcVgjHFwjRfnsOugkoeVBFDpfDJGGAqInSUMdCGqLpXXulUcwraUhJHwgeLYRXtCoiQ",
		@"TxIDUtwrJm": @"bvZZzAywbjTuVuHYTjQKlgYzLibuZJwnSAiQupJEPfQUxKRTpmWXknZbQwWbzBOnLrrQWiNUypDnLgQYhtVbgRLSdQHmXelqvCYJBYUYNUKALGENffskHlRkiDZFRgpLjUxIgcywuokRRRF",
		@"ycFNiQfVlQtlOXLWZ": @"AvEHPNoGoUWXXdDGnPbPhuJWWOiskmvvjCGnOJbxlSmOdmKjJDitjiwmFDAFQqngjdfSLABQwTZiMBikdegAHzVEwZFaykGVMqdIAwHJRwyQKbWOhnFIvzIOvOrsKVJzVquYUaZB",
		@"vCOYroqozOQ": @"COMLKIGHMXRNBroobpMbXQCJbYwoZoPuyktIUFnMZvGomrXeQVuIOIbsQNOmCfDxkjzLuHUPYLqLEYUAZZWsvCiYUTLcKWleRYSUitYHIrxQYMGOskKcKiUspCCUA",
		@"iDakezIuNuyDPRWmr": @"FgokzopuhUzDkxTiomRGYlntcnPKBikeZwAeoyDDzoUTziduWRZEPGpLQFRTiqfePiHIPjGKqfBbNqKMSJtIajevZKOmMrtymLCkUSRIOdQqlmrGwxEvfsDiXBAKmWswTeYLf",
		@"thAWScIhHOTpgSBakX": @"YWLFMbunuVaTRJEukZUmEhuvTkDduydccwUZacSGfcvPAHNbhhreeKnabOCjmenBEfqvlbeuhruldOfzgHzaktUvtTzYWTXGKmpBKRYoTEzEkkgtigwoPBAIijBXXjUuGqy",
		@"FvMYmsLRLdhYXjRI": @"tkblZhIJDRJEyBpybEcredpMDDlUUSRhITVPknuaTsJisWBKIZSQSxWRyxTFVOKOvjECOPyHGsxnYTtTCNmfTrZJojnyLCDZNiFUqZyGzLwGKQ",
		@"xKpUkpBoryyZWuMgYUX": @"BXMnXLzjvRzIRYjyaXfpvcXdxZeTyzaIgCvgRPZIEQNKGeztluRjZzgeArnxrakTrVfYfEaAozFcoJYGuCsylfuHOkYoKObCqPMflpTqgpRbkVHtcwuvQseNiQCGPXnmUfwSQmn",
		@"bYtCzPEgDp": @"FlkqshJIPrbbeXfChGZYLJwnMfkwarBmCZENgQqpbUmlEaTUXOLlvbXlQMIlBJfgJpnbpPMYZknrFCFtuPtJTskicrqKYKDaQrykynXmryPibpOvCTfaMNBBLkgceZZDZiZZGf",
		@"viAlTnwMgNFVNrfZ": @"dOweldpYLEQOmHJvayGUBrGOikkKgKGJxnUpMWGAvcqMzlcsQGLGHIHlHtzTiipopgnBLoWEfzdgmFLtQgvMCdpDurnhYJckfFiEPgCakXaBANBlycz",
		@"uhMiRKCWfjbUJVpG": @"lhAkufbmdtzEAnXcsKXPnxNuQOkysHBVBPvtOdKKXqAEKPfcYHzCRSBWYZkUDDjPfAWZsyVSTwoilUjJUwJMEewGdTnSsuuljFVdYNbWQfWELdVYLECFBjrxTfHmxNAgdvgE",
		@"HiCgPtsKko": @"gAGkpCqTurdxijtNrgWjnmVXEmqSNkdKdbFZCcFecftDyRVHWivsGIIYFEBKkyukeRcOVYFluSGqMhiWCnhVybbldCrXeZhGEwioWosAHGImJtUgWAZJdlOkqAyhqDruCOnloSJsucEhOikQMXjE",
		@"EuhSXUQLmj": @"vPviBqienmSTtFfciFsqSfKjoYnnqhSOKhJkDdJeWrhpoxOYdmYHYtrLrqfqdtYVZrKYJLbxJzQtcregqeAgQwklqTDJdDsmRVcmFwbhLKosgODEUUV",
		@"QJsMacOucDW": @"oJBrFlsMICMSJttgnrHKQaQPPsRakREjrdWApJKXQKZjhwlXTKyOfJZpxDayeaLCWIJKDxPYrntMtMvAzRKLHZsGvyRhFuXZOFSPGshTISktcvAKYeAgDx",
	};
	return DQfHImFVawC;
}

- (nonnull NSData *)rfhUZQRNQryXoph :(nonnull NSDictionary *)iXTCqOQvWB :(nonnull NSString *)zpVIQbNDjFpdKiRpSTT :(nonnull NSDictionary *)YZbFkGortLNhh {
	NSData *imHwwRGPlytZh = [@"ffeGnKaJeWFlomsGDEtPmKYLhzArVTSTJFHrJtlqHtDBTdJYtccifDEscfCXpXMgQKeJCEJNZwyXwkNHwUBHYJoHcphzBpgwSrRlIwcLHIrfD" dataUsingEncoding:NSUTF8StringEncoding];
	return imHwwRGPlytZh;
}

- (nonnull NSDictionary *)tWXSGJStbwWgwJrHK :(nonnull NSArray *)nYQlXxbrpKXJoqvBWW :(nonnull NSArray *)XbpnDhhnEW :(nonnull NSDictionary *)kmgtIduqIWYtHXa {
	NSDictionary *AiIbviorLUwSBuQyiAF = @{
		@"JWXfvgXWSrN": @"lSkTCXNBTwmbDBisoNDHBGxVMFvyLdNWvzfOFKTAqkNZLWHbpvpZZzZqbhDzFJBSyrLBHRQAQvxTTGfRAGYlOCFFrwtVjBwlvRZkjHejBIYQpAyMT",
		@"UHDQGSpcvUcRN": @"NiZFGkMKiFsYfeqhPkPaCxApAxKuRrfNCVsBMQEzMQHFnEeyBYKPaWvhVJaUxQZHguOjPHZHBiNTcFeucuHeUmqLBeqsYWNdETPvuSpbOowPUfkqrVjYUJcApIBdhLDYheVLqTlUa",
		@"cSaiReaPyDSvWpkEcW": @"BJhwJADRlxLYOKVKwQNbghwnZTEgoMJjHrrnwdWIFUogCISWqdTJOzOfTxMYBbKSpdMOLhMdNfJuKafSdHqZLiaPoUmlJrtXIDKiUnYeNuOZXIBNRYhDTJCUdPOjBIeCCqjbLwSsEVjL",
		@"frSFFokQdrkAvhref": @"aFwmMSIFtZavPOOUczPTFuiWNhPlPLoIrATKAyOpmXdxMhFYanBiCyJPwOPvFhSSXnOstwzybuGeehVNNoASRxDWNIzZWsNOIXaD",
		@"oVxGRQgPhTsDr": @"JRAedlJlKOpnbqvPygOAJwoFykoNMrNKhuqyvvAHxWFMXGlCbmJWgWjlTuirpwLaVyqUxUtXhpMEmheTxGASIjflsrYJXShHZzauKhXIeJvMvTQPiqUsMxQyxhFsDQmqnsZAlRfASjMLMQ",
		@"lJNSwHtOUQuRqMbs": @"DhvtbDspfEHhEoHNzIeaqVDPYbsVKfFVGogXLHnmNyEvcekjVHkjouefkEFxBHLTGNdANvOyMJPOzlhZufGLhwSMsZURiPwRfrRUEwvywoAZeHALII",
		@"DlvTWcLbkAXHaoNV": @"BJWARYEldsvizfmfNEWGwUNkSekkHVguMujASVvnSWAJPfaFcuiULAvzDONfpilKLrftiZIYvzZrgUroHxQlHDHToPnsIQIbpwHQtHOsg",
		@"HqkJTWfhKejioNrrEM": @"XgBZhTqpsuOfDrCRHbENCrKoKQeMhpuKEVUrNTLLBADLWiqaEvGtZZjFqxiwCJSJGCJHwGNfwqQOJPhEjZitOkoNnxzmloxnoaLTEsinyUKPMKiVyAWYXifMi",
		@"JrdTyIXEGLbkCxSwNVe": @"WiZgUTZoIXdQTFhkefPtwRyACVMJqXIgxUPQGneLBmYAYoVmwUsUpwFxVxPDwUEXRPkRgZltuhizzOeoVgrajJGJjKTWcTqiCevfUFMsaVCHKuRRcmVxyPJzZdQIDuvrdqpdglxwgOprbuhVp",
		@"lOjexKhXmP": @"pqfepENIOtYVeyIkrULYfXRqfmRmIyBvlKAvansnGXbzXpNevRFkVrBQHhiQrpSkNQGntGMMQtrcuGwGYRAsUTEXHQBxnPpEJAswEKijVnVGLwuuloCPEceNDZ",
	};
	return AiIbviorLUwSBuQyiAF;
}

- (nonnull NSDictionary *)BctMoCQqPWmFGMApm :(nonnull NSString *)PKXTMdtZDYMkJeQppu {
	NSDictionary *BJAGrkVIBquvwL = @{
		@"xGvOQykIdkQOkVKG": @"UuDLePOGzkhoOBTKVgTajwDWGqgsdBbNBzvnaJrcqeJMxtRiFqxHzrmgMQWTOrinbusxPhmWofnPbJiFCuFyNOyLzhAoCTcUjrBkaEbKpNMLbhDoiaQxAqMSlYLEJNpoABSVw",
		@"qCKZmCLgWHzTN": @"dLaeCGhUalZREyKNBGJujIzyKyhzYUBQFOxEcjPmzuGdHqHginLogCZEyODofxvXOEfUJxeUbFiFIOpAkVtZdbsbWRlrWJLxXwDGeqsRNRWbqRwmjCiKlrM",
		@"VxUdghKUrs": @"vltlvFPtvzwglnmciBVUHnQRcjVVqJOcKEJbldhltyRregIvwrLqpbijCMUgGQnuijmSfYkTCqvuBfTzogIUqVPkMvkkwUvtzisvEMeJDNHrwwK",
		@"uUskMRVYmGs": @"sezxTfBecjuYhOdFzyvDPcopSzlDvjirhTVDldRJUSMKlnYtPpYKaDavQfUFDEgdDOQbURPvSWekDfRNcjkBNPPAcLBxrPHmuDVd",
		@"EZqApZLOQB": @"CqRtVjnUtnyrsurtjZqWNfPCfxbHsPQuYRpfrfghpIIxpLanBkFXNBWMbuwMcLmPnQRTCNOlDLUoVvbYoKyHPaNRbZbDQBkKjRctgpmtWYDOqawzjRYJZBxIzVdiUctLbC",
		@"RENBIVJPBHyJpM": @"lWIKxdsQmoolnwYaGSSecaeAWwVyDHtyFmzntXixOcFqeWxMCdjVwyJllydlSuOEYGFofkMCinljTEtuCJrAZceLGilKXzzFISGbJnUbFyJKColtnpnGGmYuAjEELqoBNBhpu",
		@"BWfYLyokWhEfh": @"tpSoUHHDGNxgfrfLaapUIpaHNkiVeoeTDKOUJJxODMzFffrYjXhMBfDriugVYsDmCXWUbejeAXEGEmRggQUEnSkXpaUeVzukbwcdKYnnoIBGASFIswnBFmmsQBLtzDLPRLLEPFxN",
		@"VSJBbxSnMt": @"rWEyYhvWMefpWrSeiXaBIpunDAlQnrjBxGmIuErxYjDTWKWRlOMbphkOqssKBbOURWgwwyqNSmGVORrKGsykAKNIVehVkEwAIORwsYCjCkICFyEXzELRNgUeIMPjjlnePon",
		@"trsjgJscWyHC": @"vjUVCFvjNhftXaCvbaHGGNKJEVaIYNWFIhlweJOtrtxWXwBkmJPotitlYTVKYxVntcjOsjUQseYJbYMABjVGRVTIQhorfZJXjudvLUjSLLwLUaVvNvfZzCk",
		@"MOnsyXbvmSGVrCazLpG": @"PrKJBRizPGXeBZYGRNTiVsjGYmaSYuENcWDxXkQvAzGcGGfZoktfEAhNNcqZbnlfpasEtVwvbWJgmmPgzoLtYJZOoeFbnYfmQDmXCOPLsjSsVbYKMBhoJCKmWjLfovRlkGAgexyNoiptvDIZICkC",
		@"jGVklXABrIChpYIy": @"DTBqkvCyyMyDbEcBvLHdORpXmTceIBKVZlFPpEJEsrsfmjTucMtIMuFmYyYmWDZQVSLGoSyNghhvkpfWWyrJnhEsDuwnGxymMXQP",
		@"ksjSHCjZDDWhBqLro": @"NWgYDNBNdLrguTXPjjUaqoqBLNlSpVeSUpgAALaTDPsiLNOQldipjTBLxRvNDkigfrUUBatTtDXXMrQAIZzIxboAMHcUGobmZTrvwierAsiThFY",
		@"SbCxUcIGDeJJRTOic": @"sRYshuBVCefwNBBnQttEfmVxMeKBTwbZBayywTaksrdwHKahTEntaidYWUSoZYhoMmKuCDZluCqUMLUbIzrwCOQHdbaifnhmBPSEftfQbGwMZjOIeobLrqxqizURMjCePVjvIDohERhj",
		@"WWaoRBEwSzSqXIsWL": @"fqMYeDZWGUGdnSxgloiIfReIqDBLSwWQFHSlNhkxyxRpMmIpCWnnlfCBxYIENDFuNayUVStthfwdcFdsDwGzRpjhfaHYkbLzwsEGodYNkRoGWsdIoqqBfcCjrawtaluDiTPzorlahrJclOslSSn",
		@"qojZREyRIuEVuKebj": @"hQXdFzmddzbGjyfaQfIxRGmfXMezghMmXRHgZkmTCaKEzWMaymEnKytZVpnHePaVFhWFDbtAbbggqrufjfDKWAKMYvOUopZnsRdyPmzlmyqZMzrZsqcExRVMUGgODYPkxwJIuFQBRRrJxJTzPovC",
	};
	return BJAGrkVIBquvwL;
}

- (nonnull NSArray *)GfUZWOlTVbp :(nonnull NSData *)xJFzvSsheurbDBhG :(nonnull UIImage *)toFONSoqkvemVCn {
	NSArray *hsmPdunjccp = @[
		@"dMknojwpQoLOtQHgsMmjFdmruVuSHmpuIXyuXOgboLZFTKzlvWIMqYjEoUcjpxYVEQSEeriuttJlFFvsVBvTHcTMvUyBuhxXhLwZig",
		@"HUbxVrqbgMNUtDgAAQGqsxHmJKcMUeTsGTIMDOCZejYJfLpWwGsoKGJkochtCtHmokCZBSxgFcMPLpzayuNrKmjPIPewnzNutmCoLQJpEdIqRKMIQmeybpMmFqTzk",
		@"QWBnOifBbAtNOkGNXbKnlQZcbqOaYxgApvJgsQJvqIAWxuhZuaQsvmoQNClTVxcxGrOvQOjiUupbLDFmKLeNQvxydzEQtEHWgIGqtbkEvwCbspXhwHvcwJoCNB",
		@"VZusOAHTJsSMnDcsSsOhuQmOWJwvLvhxnvhVOEecuzZBNosAbPDRDnIFSztlSJjYpsjPURZTsBCntjrtvoXEhBBTzzpwhNKjmFdvmyycKoNKFpdRQITpCzJMDOMEeSIuPGLNUrOtWljct",
		@"XNWdYadajOxLrEoxKYHzwfWTzuEJGKfrucpGNLwNutqyEXfamcunJMYkAbnIrfMzaEuTOuKBAbytRxEcluaRsRDPPrMbLvVUDXjTfpcmvwBPwcnAxubrDyMDB",
		@"JyrXiPNTLNbhUduBvehryKmamFqgYKPRBJtVtAAMchOdafSMeWUkuQibEhqaSXLNJcQybljypiPxBpQJDoydlbiTLPiRUaibbBUPPtApNgiFsVlZhvsZXCOuumfXnSmxOJpZPZ",
		@"PTGsgVkHJwUTKKAoVhxcKidSHBBhInKNcetheOYgvWILAWMTiEiMiKCbIPKAbcceWeRSQwqZsRoQwuwSrYhcPiizPFLLWDDUjxYLCtYzXGZEfxfkBHKbLgCCsuuTieTssZgj",
		@"NeRlaQYovcxiBNcRsgAeDDoWqAxKeUSZERMUnAdMKiYUogopzkvMJFnSkrHbpfCnMwBFgPtxYWHoJgPwghuAGBegXBicashHHRHnvWCOpNYlJvImUCCxouHrADHvzHNgg",
		@"SodKETyxMAuAYMPIKwzjYASfXTBGAtNXpsjyMUAGpddvSUirVnsyhfjZJpRSTkdoKjNsdihOJTnKOVRTbiPlyYpvRyZSXlpeBgijFgnVwdtMuGhyxMStUNzbsPeHqnDWhpxSFRmJfDXqAa",
		@"UdXalgHzuFhBtyokijeIeweqgpviaVPeKpjTjrltDplPXktNQychuGfEyMwDnYqMcWDRGtjQNNLIBsZrEqhvCtFDsvDAKejJZVtkShmurHozbQA",
		@"MdapAQccddUnyTgbwvwQXOxcjJkkUVosaOmMeJpalonjaZIdBgLPVElUpcQwIodUCcnXpUUgzQtdRDGqNInuunwnlOECHwdBjtatbk",
		@"IwimYygkHsapUERFWPBZXEDYdbSCsLReVgCsZdgPyOtDrgtuKpCiKlCfjzantasFwqSYnVbHDiGLLFGgRZJHLssZnYarbJgtiQWasOlfkcDfUItgsZaKrmQXWqXbQkaVwme",
		@"goGvpjxhmZUWqbLifwxSVnCunzCdnkatQPqNhwsikwbEtIvJtUOrVLyCCyiuBRrSNgLhiuXEQvXITydWCenaGXgHjfmaapSqxCueRPJBnDiFkWiGmPqCDbK",
		@"TEJtiCQKBtPfDnyxSqMPiovPMrpXAZUMiWjhUKeriYaUiisMQFCuhBUEziUKDdRXMXvakidWCtGBIfDDlzizoKaGosyjJXUZbvNFtTPtVdbRySIrFJnrSXfuwpUJcRewBaeXMncNvxrBs",
		@"pWfuOaOTIxseXnPlKNJMUeHTTxgRQRHHoOIxHpjtZzlaifFFzfPVBdgxKvPJRNuCMasdtwRMtrYzVLDZmhJnNogRdYTlmKPmWrsGrmkGUwMoqgZmLurYfHwYquJkZtjhySALiWKR",
		@"WXtcHJsBdfUcykpgwToaQMbDZkoETMmEXrtZLkbcnVwfGeNFKtNOQFaURwCUJAAnvrXuhKMHAHwKefwIftXQrnkUaRGmbtkyInFkYfnoV",
		@"pszLELdvNjcCDJhQgRWOEbbuqhubBsNdVbkGTCOIPcgbRbSgBpExXGwDXiOWlOMlxEBWjkWwjgYtRulMIOistHRGVAZhcnIRHheYEWpzVaKtHqnAfoupYjbbVCwkYCYBWPwtCSrWiybwmBEwNNP",
	];
	return hsmPdunjccp;
}

+ (nonnull NSString *)YdqRNarkINLjhp :(nonnull NSDictionary *)jVdvEqJrgm :(nonnull UIImage *)zrqebBkYqZ {
	NSString *CtCiFcUFCxxLycQHAJU = @"CzZaFmnLlRrdADdJSFaqeJbOaMBpEhFjSmckGEkpAqocVAHGXdzacJcuHlmONQmcdhUBktbdyoSwKdgVIPwrhjRIzEovkDNwypuFRdAJrTSdbysjizemGVkKElAwWzUVXOMVgmFqyF";
	return CtCiFcUFCxxLycQHAJU;
}

+ (nonnull NSArray *)HkVUaamALU :(nonnull UIImage *)gyxYMMqLvcGlgZ :(nonnull NSArray *)bdNUCfFUFMGcfh :(nonnull UIImage *)JatTdcTpGQbKFDW {
	NSArray *ZWJvTmpkSl = @[
		@"bYGdDJVDIntFAFgBGLytlYeoCLYLbJklsaMGoqtsUIHfKNGrGqUhvGLEjtUbsXqHnnDaIbSNSuRcSqYHYysufokLEtjMqYlvsvCJHFmMAwFVkQqE",
		@"dFSdZJEIAfUDancFQQZHXNdWGPBCoQxavmaQEeYEfgPSJwWFCpnSrOOkVOuEXHBGikJxjYnXRivupKclzAKWeMErzHkYdZxWlphqkwssxvzDW",
		@"xOpOpVwVjdKHDpBikujjokSyEBvyAsgcJxLDKHLIQNBjzuUBwvJKJyvgvexvdUSDnpPbRLOnwdGLeABVudNUrVjKCzidZZrwJSJoyEpZhPSgnjRcGWpMoJAmXaRsbAR",
		@"PffkllAbbeNGZTgTubOsjmsBKsgCgYCpZNgOyXmkfpmTprhZtwryFlmGtIcHOCYyiwzdTPajWcGPlCaLPCcXhVPKIPRcyYEzuznPjGyCOAonAylItzmzMsvorKOHVxQaASphGvgJRHsbfCrW",
		@"NgTqGNCWkZCSPBlclcPFZRfxyPSLGKvJdumYFQtuxxhFoLXWPiioMeUZFueESJRGkBCJjTmdRFSeUoNzxUeslCdOnXhEXIrAhMWOtVPQdLROUThHiHLGHaiDIJNfNYPJsRVS",
		@"jaeYtgDmHaUHOvgVkgycanOLEiPZtYvUKQyXbggRsENQvMRjOYmurnrUhAeIKSiXjJEWlxkLYbNoWCOaOMNOJFJUzqLsCuXpXzSPaRElfXaxtVubc",
		@"DgXewWTcTnKebQwTBTkYOkGIdRafjYdZjlyEkOPRpQwNcICaICGMirxuiyehPBfFhtSSiKkzzsOpYsyHqsElwmPBpBHDAsJjIUaGhUTgnqGSjmisRQvaWQRrkwlrkqdzbpIvdUSIaaJgYiwQ",
		@"rHBgRPfJucnqYZNBCVURWKVLyHEhdzoxBZPTcoWfMGAxSjQXtRKLHzWFdGfebqOAyrlXPepdXpLQbykyoLViysJTdWbCjOIAbVrlUYooIwzWFZkhMcQUdrSCQpjrGharxEUFsZXDmlm",
		@"jxHIzxqPWiqotIOWxXVkEYSWUIQtYKDHDKxBmvEaUHCssJvDReyzZrrXnbfATRXEzJlyNbKKDlEygWHNltiOprvPbPbLFdDJeMfQxOEIqO",
		@"MwKzsOQdhrdbAKtVvErYbNKzHRocsiTOIrWrljobZhLAhwHpgkuwrrfFwFgDIFySgBwRlwXgcYrJnfHITAroelZdFIeRnNKsJsadkaZelDpYgRY",
		@"HnMkbwUfaRaJVZJDADkMEosIlIMAcdUUFJzDeSmbJoFKjjSFTdsEtCzizmWcWPHGeJCdEKYIMAucCniiCoreLgJpJIZlSdukTaUfGAigmGxYk",
		@"YiODRrKlWmWkwZKdIHwmOSjNFrqrcxuECsZZDUQtBzKnmivbbWkKHUhwdWlzcEnYBnZgimHDvoxqeaQlHNWtjyensJEsKvdkEucBxXDsFMZtETPHOoTNNcZgPHbWlKmCLcRhsHzUWyUFKfCg",
		@"jrHvUaGduQWUeBVIKZNYIsjQtcZDCOwINUfgTJqnliAUTJdllzJpzcFatsulPlgSqYCumamRTbYPYsDSXORHJmqSzFqPIxUFIohVIBEADliXovFkcTkXDWfKzTxXDK",
		@"thVfcLRBEKyIGgnKxYPEvLRNRxkLdMbOiypswwMrqgJBSdetPwXbEXLWGyRMzTNjSuTcqolxBGJuGAXCIVvFOPsMBUtpsPsgGXvdMlPjHTAQSbxzov",
		@"yeBNbTbFvFtfYvmMcusvGylnQslilXZiGIvVclKIAmdtJrRvsLexoWLPpqRnDzxyQLSQrQEauoAMMvzBSFqaKTCnZENVSKcEwjgtYsaHYyDYTgQcNMNOXStK",
		@"VdYjHHmIrCSWmGxRAVXdAxIGUQvcShOGsluYutuaOoalxGoqkAnEiOONiSYyqhLlzFLcFfnzzwWQGKATEUWXCKdjyFuQXWGcPymBShDkdItBdaTkpJtLGqZrGxrHARGgrLBzoVYciNsGaStE",
		@"zPBXCfuNbjZNFpuVFxikXVKyVhwYhvSIbpHGbPiWbmmRhImyjIKecaytyshlUtyFZNoxxcEskkqeRVyNlktMKRmMpZOeWrjRfYJyGWULbtAujeANABKDBIhPxWYmKKRMAcjCOYeAKhcRueH",
		@"xqiKLKdbZslNkOLoChUXbVFrQtMTBUNDEXDNMKmedPXkAlZKwdyTNxKkbcOqefGvVFaoycNSDHzGjDhfvNesYZgXYofwQFOBKIaltlLt",
		@"ZoLCxEspGgSOLzOXlbVnCVFbUJpEQgVVVpzsviluXewAUxfIixDgtfetGgnQMKqyaTuvRinulSJbFoocfVSeUNYLYHCGLOzckGtyDCuGseGIxOCMMEzWwAqflAeX",
	];
	return ZWJvTmpkSl;
}

+ (nonnull NSArray *)WYMLuHGXJhVT :(nonnull NSString *)usZyNSJhbl {
	NSArray *ftAWRnENvUcgpnwZD = @[
		@"hCUyTOCLCBAvNBBTwBgbsnYMiOdABUhxRgLLZimkYmHpmIUrJgOAgRjiCXucGLPfeEnivHiIoshuGTtzGrSPmRqRdpxtxnIWYecSlQthWmvbyntxODOEnBswiTigkirLCRMSDiMpTrQIWWsrVsrYY",
		@"wHdBmRfvYycLyylFfLLQXJXJRFqoHRiZfQALrsGtwRlMXCnlSWnWdlZqoHlveHpXfFKxYRmqnYcxIxNwFqLjpyhWBbHpEIlwMgDBmXGxLhWTupIrW",
		@"AKYPUVgyXpmmsZHzytROFENnTVhwxGvIKFnWxsWbAVqAEXMWVvebTkXSWOPnJOQPhPqjPYkIQtxfIqdLeZpEeZcZpGikQMiWUKDRuFUzGNjejGuumOkHRUlXAeahKZzlyOuOMZ",
		@"KPFgyNiAYSmnSseRKPSaGPXPMQxyMiwyKjOCnUegKcFHXRtOqaRuNXabmixlwPaTBFakLkOrxyjacBqBemphnCvOvIARAOkWNtZMmvtanAltncD",
		@"MaJnIDzyNFuNuZutNMTjKwBiTIrudVAvLFlXDulnggsMFoBUwyMEBGJYYtzGgykJBFaNFXuhcXIIudZauJdfCGgxqHnlIitESIzxZYIXOCmLdCiapJayhOc",
		@"CGGVxIzrHAnraGqhLyOqpOsrNUFVhCyRXnmKENVqvnIbXcUrrUmLVrxQxgJtSQkvpCGkfIkvXgUhqisaZZhEOtghViSnvEOYztgJGJ",
		@"dRkQkgAFHBxTGAwvcmQKccXcxFBtDYNrGtJsUSmLGKIBQOclGcAFRvYsgcbqRkNxpSMTizOtRDDipBjrTbZuwbJhtqpehhDCuuNbGKRsRbPlZuEv",
		@"hOLKTDbPknQZmLNzVWVMCHhgFVGrKVKdXzNsPRorrCkviVQOKQpmqQSSQQPNhXDtbYbtkYOrBZMunBhtfRmOlmDOoJuFTMwvnfNwKIdaKVCJLNcVdKLYFTUbCguhlIIPapinPgpddH",
		@"uLFEdVSnTUVExjCkbKwVpvsZvnODRifwzSVmOkbrDhrFksbWMMrIFAIHwliMBTiOszygYMjOXPBkkqmWzIzCHilZwYaQQEsvpmNxWARSUSwAUg",
		@"YLokzunYXUQKGmcparChVsfspveuyuBXtlIfzGfZozsoLwJWBvTAjgNrIXLguQRGVlinlaznYsPZawxoCqmNUuTxhzzeEQNPFDUdHHMyBttTkOkzVEdwqMJtVkgjllHkHPbjvJOGhNuEIrVFV",
		@"OHtajTNLwcIwvczvRwpkazjsoLpUidclkNRdGCUGboGSBXAejqdTgzfDEbWsRqJPtXqSPRIEuGPDSlFgWFjdjCIHuInQkgUCnNqwZfwSOQNJQECMOLEvRJDalepsXreSBuQIjelTCTyXjX",
		@"gfbZHZFstfHFhfqozdzDQOZrjHMjjmIfGyrIphBzUoVxWbKAYiqYFlgXrCWaMedVDcJmZsUlNJRhAXhCtnFepVXaKdsbeBqjePzJGdig",
		@"pcTfVazofnwbOmgxqQRGwIJpVOsplCncQagQMQRKoAmMTyVCnmoJivZiPbAQLWnCtyPzmXbFJRLAPuWnDszsOtYbPIoLgFLRKIDDyPLceFuv",
		@"RWeZMausCUxYSqEqjLSuPMwXjcOWDcQsEGYhbHRsguxGkFJMmXXQhkfmITAptxfZTTHIfvtWbwWNpZpcmAMVrYDaqJDCEDAwENYGAKrRrQLWXVHOVDRALhoBKYTRTbCtlhMDOKMtfon",
		@"uZJKyIArDcXblOsyWMSSPnHqSrjIbChkpMEDvOpAqQUgqUCUocHuIontLlGBTfNTsUfeSLYAMHSqpugLcDhztgoobvuNXwWBIaSCKSoFCl",
		@"GDgrcaIGBRVPNcCDumQaWeNHRcYNZRsviVXaghFfdxlGLjhLetJxWKdCwAPmeQOtRKBsbrTfDnKgQckagHfmmbzVNkeWmBkNfZloYONTWuHSuwJDhZnjJwNauHDMTPBPFWrAUZMH",
		@"WKsOfrYFelvxNbFubwXHOIsNUxhPsvZwkLZoDxrxklDFAFfEuvjosCBUJSvWIQwRJriueInJgdPLquoiUGeAUNCmwzrsHRzDFEiwWeJISjofuekPRfrfmXSjNFXnwAUEEGKyacEmG",
		@"txqaGmtsCABvSUPPEPmmlUmMzJzklZDsuQrkECAPWcxsThcGZYYWMWAyZXDOnIUPXaNYNigwFkaMoCqsYJaIdeFbfKtzOtEhXyFZYCagJhAUzWpvsYtNMMFZumuaRMaWphyjl",
		@"jiDkkTpptfiymRtQVFwjiXwKnPgoXgsUBKpnrZEUEYYJYYoXYAsCJgAAGbwVmGkjJPvgwbdxnuWuayQhNlcEeAUzTmOuPlfePuFkhoMnniazrVmQoLJNfesDWyblWA",
	];
	return ftAWRnENvUcgpnwZD;
}

- (nonnull NSArray *)GnahJUGoLd :(nonnull NSString *)klTODsAUvKyzlkSoo {
	NSArray *byLPwToWRZjnpk = @[
		@"WWnwfCYAsUeymonCDiaRflsOCUqUlZIgUqgFYGwMtqFTtnRgPvUJaFNXUcTKzvhoHELYrkXXNpbngPuZjnvEUwRZENgiAwdgOWucGuOtcAERuwb",
		@"qINKDetjHaQZtHmgiBwYEdOWsIQKsuvbxKkpXGuSJOAOMroYIspiAihIllvSzKikgssgRchFdVfCUeBeakYuHYCgfqRGwFsvmQnSQYrylVcvQzMRXKCcdiGbzdKdMAiZoyKSIOFcTkx",
		@"KNiTJdlklLavqIZnBqoZyMjMKoAfZbCRTDfAyJLJPlrlsjqNKxlppNijKXYRzkbwCvxIRbJDdWCCuMgxmekbwZSmvEsWcVCBRFWIknDGzpjwOsCTFjcFcGnTHtNWxQDAWW",
		@"XbytzrJnzOsLIMyKwDzESvBmywgKhdIVgUcQZAxmYviwYxqoCOWGtvCPESvzhdKaKJZUJBdTDpAVItWzJFFPOpRBUjuCOfTpjxNaVpDjpcatkcIPUQRtTAXQkwy",
		@"gzHLpmhiFHysSdBsoNakFreaBneThsqMtdUKNMFpMXaOyUPVQPTiVjNteZSsoJcYXipbFJGDtccHKWHMgVlSFdltlqjzcTuzYcROphunEauXIwPbVXEdRfmYasBGXggtwLq",
		@"AlhCiKiGKXiBuMPRWAFDKnMoeekoSpHOcCqwUmtaIMfGKdAcWyLPnKHkOqKBoeHIxbvWxwOBmNtRPNpFDqlXgaqxpPVFQOLQqJCeudSQJQEGGrMyPjwBfPFHYSUwhhPXuS",
		@"iCXUDDeStzfMBEFlpOXEmLaNHLgkFOmlxcAsYYZEMobOWglRXgoLnAXEXDioOmNXBzhTCVDibhfDSKdMkgTxDcsVimGqjKVWcmmOu",
		@"uIixIfrIljxgppfzgucMRWFOPeYduplobWVrSGcmQnyHXwSOYxwufHVdblLfYnnsIvQvNCHLdGHEuQSaKWaTUABmJorzudfVCMul",
		@"NDypXHWZRUNCiKCYSMdzgQuynPZglREkuugSjCRJvHnpHsGZpileTnIwGoOZLKFQPcyNZFgQouuQCVmWNGyKmdPHONWpiAKaINGLPZOnx",
		@"YZKnrnRCegwcWZAgnhzdlKOQcAZstHohEAvIBYHxqXBLUxFbPKMppYnBpSGkNhvaFSEYcNYLljNXEbpCRJaCzRrzjvxIkcuybldYGggwWnzLYCNLEJdNQGQnPyhNqVKQAlom",
	];
	return byLPwToWRZjnpk;
}

- (nonnull NSString *)BlBKojYmme :(nonnull NSArray *)GSmMUicIojMbfIF :(nonnull NSArray *)duzTMXqAyGQex {
	NSString *JvhNOxYOZmGbafYkYT = @"uzSqhuNvJUguBPNYqzoawQqSHyBMYwnWPslqAKYwfuEtZajgKEiWGqEHieqWVmfqbWQWywqNLtqvkDDVibLKqebGOVjaGnaOFfypcMURpBPSPBAlaZGCukK";
	return JvhNOxYOZmGbafYkYT;
}

- (nonnull NSData *)GPpFwcZFZqbUj :(nonnull NSString *)vJvEJVUvWXLsNEGzGXp :(nonnull NSData *)LzWACkDXAOYiB {
	NSData *ozSiiGNcYfZ = [@"WYipbVrxyVKywhacQmjDmIsWSBNxorKPCcZGqtOPKSgLsRCJKcpQGjhiDUQkIyFVutGUtbntkYklinvMqMoGkIYpVrXZjZNeXnHsgENAdQBTsecMifoJHiNlG" dataUsingEncoding:NSUTF8StringEncoding];
	return ozSiiGNcYfZ;
}

+ (nonnull UIImage *)FgrCZfMLYND :(nonnull NSArray *)mIoSRKnixgPDEnp {
	NSData *VBMnsljzVqddLCyf = [@"zTDiymHOoOiLYkJhuSUusglfujUxXSXWcuKojIUpnnSddCtUOjidTejxYvyaPzYMXpsNoDFSoxvUuYoXTWYmgDnwfoolzrrhdVZgseZfQnMhauMKvjonKJwXwEjKcKrvTGkhnNgcnkbgZIdZQJqd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kKlafFCtkJmnDLz = [UIImage imageWithData:VBMnsljzVqddLCyf];
	kKlafFCtkJmnDLz = [UIImage imageNamed:@"QKUaDngxiKLFphJHEurSbcFmOictJEXPHIKMfysAVlgwPQijbkcpHUdcgXQnUuDKkfYodkYsqMlSTAnPvBssvKThtPTwAYIvThvqxKPcMOtxEJb"];
	return kKlafFCtkJmnDLz;
}

+ (nonnull NSArray *)fQxiChQpkUdyEXYVvXa :(nonnull NSArray *)nqajtHfOkniQt :(nonnull NSData *)GsJdhTrjJbZYsElC :(nonnull NSDictionary *)yPziZxynAsoKVujPgEl {
	NSArray *dZQkRrKZujhORxwib = @[
		@"GDUydoXgCzkOqqqnNVWMNtFGXdAnngmzoEZZBbSvForGOJaoubsTeavYGIpSEolYauJmhGrlJRcGXCuHMRpSTMyWtPseOapgWDlKeTVNLbcUnBCMmosUmuVUZmDkJrJW",
		@"zUJjoKpracoBJcYIpaGLzlvTFtyCavjNOwfUKMHWuWMeXawWCxMerqVuIEqtjeyJGRxutPiRWMiGhyMxaJYTTTRmzgtokQeEWWlsHnFJXtyjWQcgzdidfMKQgTbVBoODjsbtLfYGcU",
		@"fyFJSjSFyhkVLWhDZIgDHOHlbTELsPyGHpfUJOuHuSkrTCirzmKmGQHFLuEWnuPyDEZJpknOLoyfzVqimefwBdTXpcmlkkdlGWYPexbsHNCnCIoJXNP",
		@"BeImylCdhTCJNfSAliKpbDYZVrAfTzJTOBzzEeoSjYzrEHCWdCJYJQcrNgommIdrGqZcXfxrRUlYPScRIczKYNPAktMidYZZjrreaClEjQaKbkhYHXaOAODIHLLzqKGIdOZAEabcv",
		@"mYeRYpHdPjNTLcpjcbRrwZtXXFwLWhLDoSWaMAIKiwYjTTuyuckeWkwJsUDaIxQpHWPlyfqVZzVJquAmjBzQiqaWDgPkQDSmECJFTpXMginOrlcfhAyBSB",
		@"TnGKUhWHKKAPrcFcYastTJZlTvJwvbYjreFmpeIOqaZsBVxsETRUuzlRvpDSNjCxKcCuPuAQvlHyAbjXrXBkVuWKfeYHQrQqPoraoptldYfQOQYagWMRutgLuOrM",
		@"wupNsZdYWcXoODxNZpMvBdnFvlikttTbcSJukmuomHEhgGqFtKVjylDnCQgKGTFXzEEEFhkFBcLiErfkjENNZowICRRqTcemzxuaVQyaQzwOQnNGbHIvLffXeODWf",
		@"VCXOEtltKVXNQOtZNhjVsTpTtitVWoyzPliWPHqDDZlfokUKLISLUYjnhJVyNlZyaMVBzhmMGIFSynzGPwvANmMRdscnQFmNDRANBFtoSIqf",
		@"GTHAVxCJwWFgrcyuwTCHFperOmGdFBNzrJBsnsuGGVbPpRIbYrGcWxXHkrDsoFkUQYVBTWeOyViotuGSYWxKZVXIGRGMuFFyGmLXFjsMzMlGEILzVX",
		@"bTcJarGhGoGTYJzUafleZCDtDfYyDEWTDPIVlUanyFmflwdWDySgTMsaQVwyWYYGlbEJMdREecAAhTmgHmPOQhcnShSeUaCvTdeaTZji",
	];
	return dZQkRrKZujhORxwib;
}

+ (nonnull NSDictionary *)WHOtoKTdMgUhOo :(nonnull NSString *)tfSgTqtsyYezMvsr {
	NSDictionary *QYRKYWpUliupNdZ = @{
		@"MZBmnpWZkuTOhz": @"KPjyxYiUtjHOpcrReqvvzOPseuMpRyXWcFPjvuzZuQLOwWKNVWiPXPWEHkbmFDjYxFSvNRjqtmDtvdWYpTRBZVfOahpiFouHOdKwpqaizxUasNeovbqMckojr",
		@"BnbWUPkzlYpXtQaz": @"gCKfUIOfURCIqtZBXwimciLFPSPFcIKauUyWLLzWbScraNTHUBmWVcdxdSagRGKTfljJTuqaensYcyKXXPJwFBhuLnpVfQFJhBAbWjsrQXwCIEIIUeHZsmxUlpnDweptzmFiOaqrMXPVNurVnt",
		@"KRBiAMjYQftxOl": @"XsLaFlnvcgRFEaHoFdlSrMdxAUWYYQLuLjBhPHeDAzjWyRjDRorCcXkkVOeOJluXcVRFNEWGuOrxawJivYrzsvlnKTxMcfWKTvNBEJwoBthbFfWIZlBWgRSCikGwRIYIlqdl",
		@"vTqngDqDEcpPpdIwS": @"weVpGmvLPZMyzicqYgrpYIChxEpJQhlgdafAzazaFUpJbcLcgSRgcnUsrPjQOdFuRBOAdiwxIbuEfrkNnaGGJuGsPkBjALeaHjOFtyRdRojoGaBeFsLRaEKOanrzNiqMojgfqpLaMPBx",
		@"RtaJkWaQorulk": @"eyDnAsgstwrWpOqNgOwBQpdRgZImWYPYjFiPqUOHgIKxvqbloShJRDqlxbnMSCUYehboRejbmdKYWkLpOjbuNsyhbUxNVLwiRHJnFm",
		@"oKrgeLZEjUApgzDe": @"uBCmFMmEdTWzoHmQQjAMjeiwbcDWYlsSfJNgbRermZaVUFAhrdHvxhjTUjkbEWgHCaFjrBzmNKeltnQxoydTcdwoNBpAwUgpfWxjmLLwvPgpnRIoSrLguXidjKUikXF",
		@"PZiBGbAAjxXGbDZyLv": @"skIUheaXJIpwFYMVaaSILJEYPhLNKKXejbPQSPUrXrtQWmVkfKoHQKUsKVKcMAkfqqqwWHTyUvcnoWpFHnJWlNrEBSEdDfpSquXaPeDGW",
		@"qVLlBOFhlpOewQzIr": @"eULXqtLtdrJMYwQXsNdexpKNcbPnVTjtqndZRpsrOfHeXmjLynImWOQRbrwbXsSprOFkAAxGViqAeBMPSvoenyxIifTzaDAjLxtZAKEtHSHYkVVIeXhDUYLyijcsIdxPwfc",
		@"pvabEYIOmQt": @"vpkyYnWiqStNXYTniZIzzfwFzjusaXFvDOJutzRuEduQAsmjpPVZEZlPNNzEAXGQipJiYdsAokmHpfehTUwweZIpkcIlvEqGDLkiGOccBbIQqfbPwDBYfJSiBsBQsdohwWpUUMdIOidmdMtZ",
		@"zbPFulHLryWnKiKifgG": @"qqRRmVYonInyHUPgYWVSBMSROCDQslaTyzuZagRdjkjkvNOrJnphtrLkFJdJZzwzCcXDIOeGsdSuUrmoZXtAxQJlYfgNfDMPVtuwcPUdAlpTyImlOWGNsteIImDMYPglRIKHg",
		@"ZMLnoiiPrvrzvpAGV": @"oOUkhLejQGrkEzVLSeXuQfdUBsPTsUZCVWPCoCBuvMDeWpIKtBPGKVFgnkPwMeXKhEGRGJQDPyHIZdGbPZIzLviCEkRvLzVmTsxpwXxeQvYZtyfqjyAvwsBtQNuGVqtursaEluHimIybWf",
		@"RgSJAyKJNWRxNE": @"HshnOCGhMgPKGneqLTRfRAEEmqeOYFFMSQodXmGMogGJOZjcHyRrvPAfCYMskfxyHZjtxdNrRTTdimtXiNkfEgmbtgIeeiymCEHtPTRMRNmCvqZEIdO",
		@"TLoxyswtdvUOZU": @"XGeFKSsNuHucLQRuVuirsudlrDOiReFxfIIPbwkZmUfRLvhSMnTGYsYzoNhhqzJbAwYdrhiPTbbZNTVxQealPEBiWpZRFWAFQsIejrOyhlSbYNxOcsyDpnofbjGeoQlCxbPGkVwQWHrgjcAS",
		@"TYsIleRJbF": @"MkDvfUFZiCyzaiAnunwNHafbmTaxUBfjMWPMbrkwIlCtABZzchQTEuKVhfdXDUICzvdWTInMzjIiScliVXszolLgvTWIikCPZlQFmXu",
	};
	return QYRKYWpUliupNdZ;
}

+ (nonnull UIImage *)DroEduOchndFcnzag :(nonnull NSString *)tGGVEwSJMkrZQ :(nonnull NSDictionary *)UAEQIEepjSBlFw {
	NSData *JYxupJAGxnscMZ = [@"CpAmZBSzopFVMbAEcRPwyiIDLtHGfokNALlCbacwaCltfUOtNvivzFsQYKxFoSXuwIZkfDJlnmMrOExEvxhJHOdYVkxfhjlEXBPxMUXGAIyCoRAzFCWdZeqU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ITYSckPKmfeqDkW = [UIImage imageWithData:JYxupJAGxnscMZ];
	ITYSckPKmfeqDkW = [UIImage imageNamed:@"bjjjHIVjubxymNPlLJBGIzMPPHQdbsppCBZOnkWxMbYUmLTRLDANpyUcbwLNFKAUrdMtlEHsIhdDXTmxbVSgQlgHiXjKcbwKhTxG"];
	return ITYSckPKmfeqDkW;
}

+ (nonnull NSArray *)RvNOokiuZhlcpKxp :(nonnull NSData *)HNNjofKpHOCH :(nonnull UIImage *)cLAjxVnlkoricxo {
	NSArray *yQdNwwRWKuXI = @[
		@"vCsEghvNXSNaNfgraMHnafqaBYhgyRcsGdHOYBIkIkJiMIqwxvEHfaRJurFRTaCVVOzNSGNeUDnHVgqJQPtuhAnpdgTzgbBtDrILWvVaCIWCieHtpG",
		@"BSKrttJYCIlYXVLKSoimHwkXHzGqxhJYEPnrLaMchiGJofjJOviOKJXJYVjZXZUDJJWkYtRTEYzRExlHsMuDMrFQlxOQyLTrAwKsKSUyrOGhLHlPqcWYblMKMOiwpKQPVNdDAwkkfRktdCgyU",
		@"ammpfbqGFUKNwJSPGUNfAMBZAFNklIqrbJNsglLHajkWwllCIWglnOGymmuNyZRUrBENUNRgkqIllEyIKMaNFvLOVUjzdNvsEvpgnnEeUOOlZcwOHmYmhRQKdxVYjUKthOhXEhQhhrgMsSFN",
		@"dCdpBxhDgkgMnCmbBRAoKGZREBIqhmKCkrtohdSmsjixkJuyGnItlbPsmyotefdYrUrXlxpMPeCDtauhclCXHGFzMcMRVEfvDKWXvnG",
		@"lVzRtyFUCutXlMRlHjrGlQXiIlyJJHsQQBEzVCXHUSSXnIfQiXNyUMNkwLiRHQjJqAKXxwqUZYTEAnyuqctVpuLlEmIfQXXHnJnbyjwxhfAGyJJmyl",
		@"SyDSamdIYUuEDTnCrZANlnTctMMmukkFkEgKnBwrUxwJTxbxwpXlKnzObfjbCfqYDjNmMwLshzMIRDPbrPxxYXZMylfVsjzUptqqPYDZgjIpZWJedqFcsBzhdzRBwOlzeiiHhkqWQrNevG",
		@"XmqloscEUwhuijXewuyMTArBIcohVpRNYaYhWSDIOJjqknoOobdKAlaaVnpLhIlJgeBjwclUMpOcnInFPNvwarCQECgSCfBOCIdCbRFAHnPzctMC",
		@"rGoxaQVDOgkHsMZgLBKxPqpHtdDHchnLlarKvlbBeILXShFbcAAeHulSvUNIOxjEiAowbvgWktkWXQuFsoYVMOCNvEevfKdfKbPymzdOqAPKgKRWwAlsRPXgsZlfaRJEOhgKhKn",
		@"XFVSvDbbDQRSHzwbbUQHFhuQzmVPYYJPzseDgoWtLIpSAltIDHpMqXcsRNZGdHiQlBOTiQDYlBBBdkcXsljsNWOTTbXpqwYwmEmXkGyGZoIB",
		@"QpfOsfKBPYsUqalDgnSucVlIKkWwfUuBogawFRDSYKoSgXGFILkcVwygTsTyiRKRzDfIQFcnOkBzRJBDeBeJOZDPxepVEGbbWVWENBUjxQlcmjspaKSyTSgzdGsIuBqfwmfItcsGwalbloWFA",
		@"rHQJBbajfXzvNvQhbEsQDjaMXPSyezxuuuDasXCHaGepOgZzUuhLpndldkWfChzFRkjDzJMESTVyhZgwCwmrZLrURZPzKiYLbgpUXJvfm",
		@"WEIaMpBxdqALnzMGlmPtAVVwJVbcwGyquedshDGmpPtmEIqGpdSXhXjJNNNVgRgXdNjRfvFviwFvROQqzIVAHkGWUZOuWoTfuWdZnWCoSIAnSmCHTaQJUeNHCAqMhtKKYgvJk",
		@"FKXGHHZZvaICEWvnyInnECLLIdnlGObUhkaFCXsHYgdKwQNkfVIKJoQHCycFgPpuTPYOimPgziwoNUdOjoSFRBhAzpYsMbmjUiBnnzRpdauPcndTaklfDGSAnWRtkIkScovgiArHufsRQmp",
		@"VCdazCvWoYsSvbdIPaNYjxTARPRFNOTbQOgoLfWjHNLGZiveABcNoStYrNnjZrKCLloLiflLBBhRNltcgpXEgInDJPIPzpYLyuGMWDuEJFcjYIUjRZqTrPFKfMXkxIVkqXmhdK",
		@"oVabWxEwSJinsEnWOujOdFtWbwBewlLPrBVNkOwMdPzFARtTosyBETgvtHxOWMUiMpYauhZXiexDbDAWwYWQkvaVGvMTeWLbtzrqscOJk",
		@"XlPOETMhlBkWDLHXblAhhqrMTurRnGlThBYPAndHaNsHzKCwXxqAZsbLjKDMciBvVDuMWPzbzeRLoMfJAMhQtJgYppcTkPqVVyXYiiliXgmchYSNEUykjGDFXZGLdQwJuLlbGkM",
	];
	return yQdNwwRWKuXI;
}

- (nonnull NSArray *)wQekQpckCLdOPDn :(nonnull NSDictionary *)TqMjGDqtfWpa {
	NSArray *CcknQsbgyvcWAfwrYTP = @[
		@"FeqbKbmryIaXjiCxTFWAFKXHuiFipAAeKCafJItJcPQnpKSMlHsvZmCgSCtpguSmKuFfvsVDYMMJsbebVYObFFTJEZMmknXrTUdEJdhOiotOrnLVNcuznqkYVZiVgrTC",
		@"hHfGbMfLSNTYhUMFBpIHSpxaHnPQlPsahQopRpkzfVutAQLcYlDMiDqzspKRJDWDHYnRByYxCnONBPmgDATKNKoOhcTrHEtFPTjZsYGtbsToesrJRnMRXgqunDnlrYfYPiSvmCgefaAicGxh",
		@"vCUeYsVCgObAegJROccoKmgaiACbqfdBFUshUkphBhYkjaLUeztiOsAMlPGyDTvELlSqmqGccZJiRPRumQPtnYjqlzCLBOaMEBej",
		@"lBUkQUOvrRnXDmcHpecHeNMAONmsLkjgFrgEmBAzxvXbEnrgQuaRMIMuwvTvlRNeCiLUCtVbKfOfBdjtPdeSEzlEsupMHcroJhOqKYqZMuCUoCqLExRkFtaiADzixQOummbBtwRARkCpozVWEBNy",
		@"qgGBEIttJImvxdYolgwrKKenfNmnDKpxJwmnENjgeImxdQloApJyODnoAFdIZKLOBxPUMOvIhjEUjEDGMWBScrmemRIgYeoxqxUxeaWcNrZJOl",
		@"ByBDdAmvknRchMtSAUgyzmXitixtoLXRseNznNnZqdZtOrpTNndrgDLFoPmPkWFKqwRwNpCGySAZBLOhUojIzKJvOodGSzULuPcgvNwGgSYzMqrmUTbCweUC",
		@"PMvYqplVfcgeLDGrFMzUflQmlyVBzJAvVyFtdxmThIncBuiyFMJtaUpJbMqEsrdQpaqEkQHCelAcmMCJynmXaMVjGoExWFQmBBHlhbaqzPf",
		@"qexVXUADBeUMrCTCQcVqKFVADCZVOiTpdmlHylDSVrICgovBcCYsSSKAOdROElGJuBgaDHENlQGwoHmksPAKTuYoTwmMwehsRYfeiHsUTBtorUkcLtuUvYDdWojokac",
		@"mcwgbJwkReGplWyGYzcdpPZrzFKbKldXFNLWohDdwINkfrNVfDdpUrSonrfpafbvEJbGeWYpHkpJFRdInCDrhthouxvxmuSRoyVcAlSQbFwOTEPnpjOPSajIHtZQQxypCVwnHDSSpBAak",
		@"NSUYGAWoqkVZgrgSBmVptckTqPIpVMkXyhlZnksbfDcDBtEAtoPXYqTlRZvrvrwpFYuKNUrLlqCbKiZMHiRdlRIvbNXLdmtjcVrjxW",
		@"gjhxcxcXMkRnfPqdzFhwNdVCaYAlzpnxhvQvHjKyFNWppJMmfdbyBKRhtFofsbmGiYCwSKaUiGkBrGFJkRPeSDKZgwJHVIzNuEmCtD",
		@"WCnVQNpAuQbYRuJNJpQGGgtmKYRmqFLFMufWvRFshvozBVWEOeoJrEXUmixFzAYTZYwySytstyuZepWxhKtdmyUoEGSPzIFEOIUhyUaTrNSbusmTwtcozGMsjkDdFpeVTaBKWyxtKaOjPNMSyzOaD",
		@"MoatVjjrMJJPHXqAXFRsTJDKHLOiXtLmUNyvrSDniIFHjueOTcUegNmXFKbXDrMZmpKaICMYbzfqDDFTDOjCqBSdAMXroHoXunvciduVdrOADxVBDuiJwdnHbaQvqhb",
		@"kLemaoLIpSSwIpCWGCgrPMkwDAvRZoCVOODtjruIfaHsNxzlfjWTYMDSHQqNvcsBwjGsjVNfhkbCjgMzyNtEBpnKYsFmFZWElTvPjKMuElWfUyxNoRsJIDyrchpQcbFkSej",
		@"MaqMXsawbLLYCKyOMXhvYYsemLkWzuIkliFTjmZuwslwoXqWVjQnVJRCcIYBSkodboTiHbLbqxZvhYzkwYiXPHXJJJgDTtGjwNmOCNMbrjTzpwgoTveEksTqNsaSpB",
		@"BrKjxZHCoYISVDnshEjHiABFfSrrkklfoOXeqLmTKAvHNfufOkLKcUmtSaMOWrOxcXCsqQoJRXoYMxJuyNVdUEukCkEhPwoTEjimSeRjqwEfYeXQHnhvH",
		@"svEjhnmvAsqTCkHCakWGMwLoNtskECnBByivOjUFhIwDrrJuFLwFEAsaSKgNKEsDxXXKmnjWKiPgpVbJFtDwXjlNZUBbKnvBpNfyGkWQqpdgNFSOSMcxHEPxWlAyGHrRtlSswYDATmAinHIaFTHj",
		@"eAPnqPEMOnqBEHYydramlfhMoNSsgCxQqaflBKgYjlHQCiswYWzMHmkhYtjcHShQxXlcjBPQwIVxsMbQLuWUsqbGoZNZYewwQodPw",
		@"CsLuOdpRnsaaDYpxjeKYXwtzyUIHXIqaCklkrqAxKogTAMkijYzGpmgONiLFEzEINxVnkfUQIhVodpwYtFcPJxfMeXRVROomfdRRgyKAYqkTqQRptEwtWUZQtfzLldugazcEopK",
	];
	return CcknQsbgyvcWAfwrYTP;
}

- (nonnull UIImage *)pkOUUxcETTSxqobxa :(nonnull UIImage *)pKUKgQEnJN {
	NSData *gBHVoeVbrujKBgEnR = [@"BxSvBFRwOoBpWcKemezMFkOaNCcHFielkfsVKNDMyTIGCJMTsiKWgMNffsnoRPfccomWPhHJnzpkcQldRGSXGMcezBOItOAEhSqbpcEedTQtYipvzBSVaBcnUujwoVghUGWUCBQEXS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ipmYnCIxpWgyv = [UIImage imageWithData:gBHVoeVbrujKBgEnR];
	ipmYnCIxpWgyv = [UIImage imageNamed:@"opCMIUkvRzvBwvHzGyshIPTAwfutFOTDcGqVHPXIDnRJBDQsEOAYHNiiWFkfKjWmykwBWEGtrjVNVNNsmNIVXsMAphsSdVRJiWxlykWyVdtndXCCmnVVpGIgrnxZjsQCbMQTmOdOyEZU"];
	return ipmYnCIxpWgyv;
}

- (nonnull NSData *)GZIGHdqTYxaX :(nonnull NSDictionary *)jpKqnVhOeyEzsjAP {
	NSData *QdzhlUaffcJw = [@"CHHqtysZcGZfQCqQdjgcELBGTyyVtSHcvACJAHFnnIHDstnkcJrKFZcpPQPYaZFOlWoeaFzTLADkqauBSufXeQZzOfZmEbYdlPXgDuNwctDwQmSiWpYXzChLNxXTk" dataUsingEncoding:NSUTF8StringEncoding];
	return QdzhlUaffcJw;
}

- (nonnull UIImage *)WIFegbGZtaEJlw :(nonnull NSString *)JWgbLHhMwEFD :(nonnull NSData *)AAyTxTxjTg :(nonnull NSString *)YwlXQUFxtq {
	NSData *YUcptJzzMxWUXGRt = [@"KJaMKxqHkIOoOeMRfcBegGIxwykWrJNcRQBUXHHLrJSfuxcTaWmYHiTYgLbiSMcEBcZYOiEvqfZYezFlKAbHnOXwkXJODoeqbatffJWAAqROsf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yAfSZDfDjvXr = [UIImage imageWithData:YUcptJzzMxWUXGRt];
	yAfSZDfDjvXr = [UIImage imageNamed:@"kbprkuAqOOATiZViimfBvHqiJVdvUtMpsjkMxRALZAEJANDSKRMqxQjaiCydiwbiQxuymfrgdciGBcjwQJwvZcnaOHVbRrHwHVQhLQHRIaeLc"];
	return yAfSZDfDjvXr;
}

+ (nonnull NSString *)rsMjIBUMccez :(nonnull NSData *)HXNWQcvNQuH :(nonnull NSArray *)hTVhxcRBAxpKO :(nonnull UIImage *)fCjUfchIczJQjgEg {
	NSString *QayvkUsIeROFag = @"RyrWsvrFWLbjuLqzKOciXRyHmApysUkHipNEtUWKIUvkcDxannElpsTdbDtALcNQfJwEyHBRIALJXuRTdZiiNWybpTipIhBcowHnkeTrUUjLlZzQkIllguPJNf";
	return QayvkUsIeROFag;
}

- (nonnull NSString *)nuhyoeydXcw :(nonnull NSDictionary *)SHtfEGHpfqvZ {
	NSString *HdhGiPpdOwTJ = @"wbdcNoydnfAZOGqhSdaIEHEEksXrrILaPVjRqdpDUqNiyDnfnnrqcXqGSaIoqBFgtwhXMwMhgKCcENApkfADpQgAkeOSogCOkMOuoBFY";
	return HdhGiPpdOwTJ;
}

- (nonnull NSArray *)QDgHHbDjRdOosrtDrW :(nonnull UIImage *)MFUZysCrrOw {
	NSArray *NfwHfvOTkZBhmOrlO = @[
		@"pMYlUDeYwulhStxtjHFPbUexhwyOZQxlpAbExXAciNBzpNCyUikDlAxcxZGamjyJUkTedbhMJINUmtAWEZhsUaAZcTknfUKTbSKpqzcp",
		@"QEQvhftRqiofGGmoAFrUomjEPvvwCFwMMANmuZxIbcCSmtOawjaAlTxaGzoWHvHFwNhZwCohikZGsPkXNwjzXiGHBpdxPghYXMaIzJepdNCVRTPBReJGuUYXDTOzEyKFW",
		@"CEYYGJRvVnJlMLflWbkfVNUkRUoPlUIrrVBHnikqyTCokfxNojKiLQvbCHKBkMNazfSLWDLYUwfSvodPTvxfSlMJBaePyakfgIUmeyenrMLxdbHMbIhvOkpXfwhEcEwZxGhCTOIBsD",
		@"qdfurKjOxHjURcQaGgvVXNHJIPcYHXVDnMotNVOhUWDtxuyrYseXrNUJaYCrOvnJnEiyXyxqDUdpplhkGPponVhpFeBDtawllGGoIefIAFYnWdNhXHfojNvGKtTIUm",
		@"gQnwaDdSdCObdLIkxykpeuMTnCNoQJBrhztYrlnXyVAUDVdRTLiQXyBVurxwmrwFIScxEwJSohGAHfGbbOJLQcKhAmULKNiJHPWuKxpjIPkxztKDesFOXFhIzjFTZxqOQjwCQlIgQui",
		@"GkqQorvXsnNDJKufrSBOBWesjFaIwNclENwlVBTpnihQFUzbCjmhrPxGiYKEEuxbhsAMCGfIWudPjkXquTZPxODVWOALKMnQBKjFxOFmbnQaKydagcvEiy",
		@"QvjTEChODtOCHwyYjqXnUKeVLSoArBXgUBcQsviRJfmerqHGryJPqhxVICpCPyzduwmninndoIXPWlBPUivihkYhOQdOUDqszKgrsfhDxxXXRKSIdj",
		@"JJcclgiMrpSkqIdwDWCCmZqquZYtQaizfFTEyOIYHACdWJNpdNVlotWQqpWQWgsNoyjTOHLGciLyZfzbgxBWbnhJImPLEYUeQpfKa",
		@"WrZeLloUHSAYkNmcbRLYpaNoApCVPJQkRntYIlkMBbXnguIZDdYjFAjlADwssngKfTPDjcDWZvesxDMOgYChLFiSqrYgWTDSHmfguqFrWMkIyjKBcUHFfvimfOYBhkdhRVBjVRezZC",
		@"qzzhDhoORDcliwGtJRykFDRiZIjSdullbnLuNJxfAFmbVgEvcBOraKWAWtdiDlWzGnWkJyJPjdJddTBybDNNBxLvcDxFONyVUTjcZMGwKxBOzdqjRteEWQRmJjTSsPzzmSKkYxuAXQ",
		@"CcktUhsMmvVnVWqeuPUEJDXGpFcBiPPJyOBnaXkftgnUAIwyCoJMknsAFmvNmsxyvzTLtylECFsPJVHLtDFFKxVtiiKqPiJQqRkBcDactgGGQeqn",
	];
	return NfwHfvOTkZBhmOrlO;
}

+ (nonnull NSData *)ELwFHEuwAsElmL :(nonnull NSData *)GbxargMjeE :(nonnull NSArray *)HBxLZwHbHByt :(nonnull NSString *)usajZQOiPB {
	NSData *DSmTkVpZwR = [@"PfHpLsDyOdNBoCoEkEJXsBGyiipOuSoaMietnlqeoNggIKrYHoqPrXMtkNgDYJmMHnwlivmkERgsEBqWIcApACbCEzEBNAPIrznUihcMSdBsZ" dataUsingEncoding:NSUTF8StringEncoding];
	return DSmTkVpZwR;
}

+ (nonnull NSString *)ZEoovuTXUfeXxDKAQxz :(nonnull NSArray *)sZkXHohlYbkuw :(nonnull UIImage *)umrnJoXyKWwAxWugTP :(nonnull UIImage *)rThctDYLHZxP {
	NSString *RzwYJNLaRu = @"TfwowTMhUTteCePwjwmFMAxQoJHdHRniWTWvzYqJRxKNUEEElvZlqCvoqRLBjQOrGbqciVYgfTYdtdeoYezPaCUvRQVolRSrTchDWQiNclNjPlmaMelKXOOWFSUaFcMzDWClkuUB";
	return RzwYJNLaRu;
}

- (UILabel *)whereLabel
{
    if (!_whereLabel) {
        _whereLabel = [[UILabel alloc] init];
        _whereLabel.font = [UIFont systemFontOfSize:18.0];
        _whereLabel.textColor = [UIColor whiteColor];
        _whereLabel.numberOfLines = 0;
        _whereLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _whereLabel;
}


- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        _arrowImageView.image = [UIImage imageNamed:@"placeArrow"];
        _arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
    }

    return _arrowImageView;
}


- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_deleteButton addTarget:self
                          action:@selector(delete)
                forControlEvents:UIControlEventTouchUpInside];
        [_deleteButton setImage:[UIImage imageNamed:@"placePublishCancel"]
                       forState:UIControlStateNormal];
    }

    return _deleteButton;
}

- (void)updateCellWithPlaceInfo:(EMPlaceInfo *)placeInfo bgColor:(UIColor *)bgColor
{
    self.contentView.backgroundColor = bgColor;
    self.nameLabel.text = placeInfo.goodsName;
    self.whereLabel.text = placeInfo.placeName;
}


//设置毛玻璃效果
- (void)setBlur:(CGFloat)ratio
{
    if (!self.blurView.superview) {
        [self.contentView addSubview:self.blurView];
    }
    
    [self.contentView bringSubviewToFront:self.blurView];
    self.blurView.alpha = ratio;
}


- (UIVisualEffectView *)blurView
{
    if (!_blurView) {
        _blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _blurView.frame = self.bounds;
    }
    
    return _blurView;
}


- (void)delete
{
    if ([self.delegate respondsToSelector:@selector(deleteIndexPath:)]) {
        [self.delegate deleteIndexPath:self.indexPath];
    }
}

@end
