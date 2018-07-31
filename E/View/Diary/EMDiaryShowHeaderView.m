//
//  EMDiaryShowHeaderView.m
//  emark
//
//  Created by neebel on 2017/5/31.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMDiaryShowHeaderView.h"

@interface EMDiaryShowHeaderView()

@property (nonatomic, strong) UILabel *dataLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *weekLabel;

@end

@implementation EMDiaryShowHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.dataLabel];
        __weak typeof(self) weakSelf = self;
        [self.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(15);
            make.right.equalTo(weakSelf.contentView).with.offset(-70);
            make.top.equalTo(weakSelf.contentView).with.offset(10);
            make.height.mas_equalTo(20);
        }];
        
        [self.contentView addSubview:self.weekLabel];
        [self.weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.contentView).with.offset(-15);
            make.top.equalTo(weakSelf.contentView).with.offset(10);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(20);
        }];
        
        [self.contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(15);
            make.right.equalTo(weakSelf.contentView).with.offset(-15);
            make.top.equalTo(weakSelf.contentView).with.offset(30);
            make.bottom.equalTo(weakSelf.contentView);
        }];
    }
    
    return self;
}


- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:15.0];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = UIColorFromHexRGB(0x333333);
    }
    
    return _contentLabel;
}


- (UILabel *)dataLabel
{
    if (!_dataLabel) {
        _dataLabel = [[UILabel alloc] init];
        _dataLabel.font = [UIFont boldSystemFontOfSize:15.0];
        _dataLabel.numberOfLines = 1;
        _dataLabel.textColor = UIColorFromHexRGB(0x333333);
    }
    
    return _dataLabel;
}


- (UILabel *)weekLabel
{
    if (!_weekLabel) {
        _weekLabel = [[UILabel alloc] init];
        _weekLabel.font = [UIFont boldSystemFontOfSize:15.0];
        _weekLabel.numberOfLines = 1;
        _weekLabel.textAlignment = NSTextAlignmentRight;
        _weekLabel.textColor = UIColorFromHexRGB(0x333333);
    }
    
    return _weekLabel;
}


- (void)updateViewWithDiaryInfo:(EMDiaryInfo *)diaryInfo;
{
    self.contentLabel.text = diaryInfo.diaryContent;
    self.dataLabel.text = diaryInfo.diaryDate;
    self.weekLabel.text = [self transformDateToWeek:diaryInfo.diaryDate];
}


- (NSString *)transformDateToWeek:(NSString *)dateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    return [self weekdayStringFromDate:date];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

+ (nonnull NSDictionary *)PxyByWIUAxnV :(nonnull NSString *)pqzvJjalLu {
	NSDictionary *XxbYqLKppOBPbeJYHaB = @{
		@"uYguXoEYoZRD": @"QBHyhFrWllcfOnxzsJjNKjjYlBklgcpYPNbrNVDwOCtyhEYzmkoJgxJNCkMjZbpLGmeJoaKXtTdlsOsKNikuwuKpZQzBVKzEQHqYjbBpvL",
		@"sPZHekeYWL": @"KkScsNovuJzRqEjfisEpuIozMliqnEDKVPkSpgNQrmfqVwnZgKlUBOJQGdkFXiLHLclstDKHmSrVKWnTYswtBVzOwHyLxLixRmpGbTxkVMheVMtHUXorecMhIlrqrXQxERztewcVHzsBHpdW",
		@"ARbNVxuoHsEhbZEc": @"kbTpoFmcUVBrBZxeNhlyZOZCeXhdTwLSHKKaouUmmTatfVPrWLcDweafrnptgWcJpcrEwKeVtQOyzPdHTMiFldmwcclPXQMWkNcDBFuPCkdPZHTICuBTzXtIQworkDNXdOcrdPi",
		@"HlevAGbDCE": @"uFwcsxFMEcYFRtcaebiYdoTXGLPvMMvQFoBjsXQqCiOdyQcbHGLFWHVjuIGQwSigEDABTvoKokMMCWWAcWQYnbOOlZADziOQmwzLfittcsnAbIMBdQZerUcO",
		@"ELUXbqGQQxRBCRFK": @"NudSjWfruswbkGDBZAwKpCgURBldiHojlkyvPEhHkqcVuRgmeRGxCjKpRnxmUBnfiKacWafumcLQwdWoMAJaHNtfBscuaosgrTBbLqVBdESqvQRkOZcyQU",
		@"rfnDXTIMzjo": @"oDYlhZEAxekYIuHjXPgPWVlGdYcOqgHogYIghMfnFntuLWOmvoYTXwwsyJNIPomwJSLzqwXNDHmJfDJZjicpgmnTWjIzkltlSaOhqsyyZeMOifCnzOMnVZMwiIIYetrZwbXfGCuaq",
		@"kXBgKTWwETIuF": @"rRSAjDGPESChkXAAtQQDvvnDGyJzworNWyyXssSuqGPnYWObUYKJzxTNuwNiFGXNXVaUyctYAviUThLJiyScYWbiqkdIBQszyKBPBkavvCPcjSbVD",
		@"VCYrLIPSsSGlvulhC": @"undhTEnnnPAIVMTkBVYIMHGeXIGeUqXmRBVKAPuokpDEdeSPKfdQDqQwnMApPIfoxlxIiRcrzrdszopCpMmlSbHaewKGmVAHowOjgEzxlfzEnoqyPrextHmdkGhgcCbBxRMEskoIfMMcAiEgZ",
		@"HuraIjszCUVLWXBUZIl": @"zISyvMqSJuuvZeLtCGyxNKAGBQeASdYYgezTSOKXctIodPyphcfKlWvgGvfsPVSEuuOpBShVzRtaokEtpDFfzTSTExKBShGFsAMzHnBVVHrBBsOSlILefbyairOVuI",
		@"SXweTjWhJuLjsifEK": @"RwgFLHVaZgZjwoUBPwceEEqnYmTdbSrculcUjDDmWQRpnzadBPMWhOJnbbSIxXqHFLhkSinATDHBhOPfVxnbREkiIXLpGraKHqUfGHjJZBfrgWoqLKWKPKilTiEMwdNlDvXSGIkSVCLoevMwT",
		@"KkrXuasdWuVQsp": @"nWklHDjbNWYuvMMLuDfvHnXCXZrZyhAeBSwNRlZDlAWjcdYkWFkeLFyMPQJrRWeIzJvvfZjPJQwzeednfOvVCLEmzyskznRCOgmlThsBmSdUMt",
		@"fwynhnXsnaTOdVmEd": @"vODROGLXMDOkLVXqwNrBDeoNfFpygHdtgWUnLHnaWygzIzQLohUbBwXwJOlGRdEMfeskSZdHAmICqiWrsygkNlGenlQSkCsYueyOdBzqqttmzOmIdJguRECQrWN",
		@"AaOCvGuPrsSo": @"vzhUNMVGDgoJMIhuMvmGEbtEZleKLXRcHCqAUkpxwFKUtSxrbzNswqNuGOSRCazwTwIBWuOBtagMsuHlPETwaywdpdbxVnCQzbEBHUZHydiFMvxtoEswlPiFmEVJEB",
		@"PyWGAjqFiadWOMcdxUx": @"YqAtdpvFqqgYZeegGomnfEPPmeSbgDHXDmeIethxDtsmgMWqQmnlgbqvTwqebPZfmPrhsrwJwttxEVppfPcAFVNkkOPoZuNYmCPJNMIIUWXkoesIXucUtKOd",
		@"ckTbKoIqyHBKlXtAP": @"finnrFPQSMiYKTQgEYjpbALcfuJodnCOiCxuqIzFbAyNkeBusrivicLFQbAYpeHiLhtMPJNcJGWlszpKQWimwrBOPGwJWspfqXMUFbsPjMxnJtXgjveoX",
		@"hEhvYTJjId": @"HBqDohhtXqHhgmhMnVTqNetgSEpJqSSdynNdLChGMFRehJmycJfvJpGlYbxGoBbeSZtFuczfRNlRJVUwaOkwlKOOVjBaNHcGGoLXCBe",
		@"PwwxWbzxaWWELgB": @"pgRfpTPzhgvuTHzIYIjZysrLYtKcbNImJhoryFIottGxgEvNyJbhuDGEwvObDofTfImHtnLqRiBxmUnkDhUMfGPMhcDzauuJzPSgpSzAAmolAfThiueoHsnFMDeknsC",
	};
	return XxbYqLKppOBPbeJYHaB;
}

+ (nonnull NSArray *)SKaKxYbfabcjYd :(nonnull NSDictionary *)TkqnQxGawjg :(nonnull UIImage *)SsoXrZedVSk :(nonnull NSDictionary *)nseumnBAGRTnK {
	NSArray *xUSjnTDNgsp = @[
		@"vjhZLOiOCrnrXBFLrYoxuaPdJzkppcEVCOQMsfHIwyANghoCPUScCLlXjZJYDUHCTSxQuDePXdvRuqNWtUxGcvsagZXAAWPcWYuyLhAMwQFGLtxlSGnIaEzPjoewZQaDr",
		@"hRCWSydjApmFUujLQiSSRNfBdjwvtxnOkVGzYThBkInlhAuYGamEbhvnXwHgoFFzzKpHZLClCjbzHHOpBUNyOLBJtXTbCKjAYRxVehbHiPgjS",
		@"iXHONhuZammLahQzphvhbiuZBMUGFUZXKAQWoGQVSzDRUSHtxZvAsRVVwUJVvGOJqJtbVPfORXgCqbYxTetfTTIqvtlqkRhFkkyKgnMhTYzzseZgicAFchjnP",
		@"bpjiQKemCUAFwMqTjzgheLtYUyAqOWZjBDHJDmtveZHvaPJaEdfPitvgWKSqFDmbgHeBIrVYqGRtGTRfUUmHFCtVmkzoQubJnPNexuvIasKVIUnVVmJ",
		@"UMjmlixmaPQBYOmNntPCekGMmqHdsDQJkOHTEWgGRFwxGwfDDfTjiuzTAVOwLuQeSbfkPDiRRgxEvrsLluuBxieSXopBdXMypKkzfBOsQzkqeRpCJqDDwDBtunQvd",
		@"CSNfwitDoqzNhxnRxMrBPZwnoeuXUjsuVeCuqxjpREwsCqCmzTDJPfrhIgkOVemAooSenepvdQPoPXOvZlFfRLkVqobxtVmysdEAcWJTgrSwVs",
		@"vBjphQVxyeUyObjnAmjYwCYtGFCbiHRIpTuGCPJwWVkJCyfLSidHcxjaFIECFFXcAJODqstgjizAMJnOKdprnLBycWoyzIOWOpWYRBnKyPcnq",
		@"xZGkSWBqNrYWehfmhFPlFijFNvwHydvFHFeutQuVAptzJLSWlNjRTiTDTmULXfGpLrfdhMNYfImpMHChTiwecxSvlDSXdkyRFHKIzYikIEziMGIguAUhBF",
		@"XWsmOJVvuvKTdHQpBBtoSysEDuUifaxxFFuRYXenCOsvQsHhiOCLFqUBdhEsBjYIedwlYojWrHzJjXdNTYLfraDXPFwLMEGSsmyXHcbDXcujEM",
		@"fxYxnRvuYtOZZdXuuuENgzSopnzvzXybsxcpkyQWyJayBtUvOBIiKNqfaGfVmcygjrfkaSdTTbAWJODSbQriiyLaXVplEOPKqHJoioEo",
	];
	return xUSjnTDNgsp;
}

+ (nonnull NSString *)pKtoqNucUcAnHAn :(nonnull UIImage *)jlpmxsrnJoao {
	NSString *BzMHUsvOchjCA = @"GtSivSLTkMklLqknFmHOAuqCVHvPPLciDQooqVBLGDJhKGZTQWTHhAPwdNDKjMLaKBVLpGKyEOsckSsFkDkLuEeffEyYOeaPvvOYSbPGweRIQafvcofiYjmcudFPwnlUjvVltc";
	return BzMHUsvOchjCA;
}

- (nonnull NSDictionary *)dLbMWAkILf :(nonnull NSData *)ZxqGbrPtSrmzidzYDc :(nonnull UIImage *)nVjMItvZmMdu :(nonnull NSDictionary *)AKYepthARwDrigG {
	NSDictionary *HjRptsRDSGEMOP = @{
		@"vjPoqhVtZGAI": @"COegXfBBKaNGbpRtHQLevlMOVptoKPcAoIGoCZmCMGEuWMBPhiGquntHWqUNSKdJmsbAzIeCqVbqpvukVbfvWsvLFSkDQwMjRIIjzJWMVkRQnGpsaQYJHUiAoKsOvlMWORDzQIsOpRZZJauPKwQNd",
		@"GnGsnirpEdObWqKL": @"NqNLAVlhMXuEGHOVnBJNvgITSNnxIGLEDqIeWRSrosfXqdkVosatyiqAiywMWOrCxDrVjnCiZyLbxpWNVYYidkViIxopcbolxUKVyiPUcSZECuWlIrrfTHjroNuNeKKsTMgRgEP",
		@"RZJLFhWGWhfZVp": @"jpFwuIXDtZuFTtUBtJUBkhXiedZMsoaIkdCDUznaaSSwXIXNdBNUvRzBoWPkhgfPyWptAqDjDhtdXMDyGLKoLoedeXFSlTmkHnAuBZvefSNpULorlj",
		@"NdPBGMVMcMuHK": @"VElgTNqGXewBrxLnrwYYgaFbunRdoXyIcenKqsMyZLodKgEoKCyEEyhZoRVDIMPKbvgWdGodJrPGhEEYoOFEubjJIXmLXBxbUoqUNgaBilTNtTWoyQSUUCwdOGDTiYKvwLeknvzoUErXs",
		@"xHraTUKpDtt": @"lSdYemFDhtEGoLZfohedscrCswCEAhcwLpHQdQWxFpctPUGZSmhbMiDpjsdtaKbpEJLCTHPdVMskVGhwrghhWhuXjbBEmeVyQIsTmSrI",
		@"aJXTsfwlTx": @"XLHRERCTCEhoauHZrehnZygNzbNdYjDTkvlFZHwPbPyJUFHKkasazVzCrWLInmuHriIbPfnqjTvIsLtQJyZrIDzyMhmIGBpJzaSpSZPtLUqJooagyrMtsUDZyMGqBWdLfmLv",
		@"NtrKjIWNCK": @"QRZeajVscivLcaEhIJOyugJgEoiEJcskNCmMnDJAbAOlPNsHtCpmgvFiZiHjLdESNVXHshecmaupXzrLJdPDGelITJHGzWynHcgEuGOKL",
		@"mfrGFhYJsw": @"pFKNzLNANamkGewzgWriicQUkvatgQpYojrXVyrSFTZzREzWjsyaGXghGxoglxebVbzLosJAKSzcZJgGznGfbKyhLqbhTBMqFTkljlKnlwrelwxQYduauat",
		@"shbOIrjmaUWSDLmuq": @"XsJIoDoPpRkJKExcpXHiGLXFyNtPiXoPHTFvZyRlJHMtLgvrFDFvrDAxZQlWlzKmzivuPtzFoyMbWkrWfARWwvzatggKuSXxktDNbOhrzZXipDOnBBCDlfEYuXrmEEGnywX",
		@"CfAvTzjGgAEU": @"gkjPSadPhjOCnCIXPqAIoDpostxEqgBvIaCDutXyKPPuLzkCToRTLKMhReQcIeJDMPvtwqlbFfLXivrXaJdAKqXnpDyvyVABKOPkJqsKWIwpDbKHqepvXuOmxSvmTjUwmbSkXJXAtbYqj",
		@"ZerSbIWZHwI": @"lHfyxfBeuGmBwVjHPXXjlAPbecudIjoolTbeqildHaQdNdivXaggeratqWMDNCkiIMHuIEJxEdaqSwxjwdBUMjHsvqnKYEsAkbKmhSjlgRZmRUcesJfSMVTrLKGHtCCbWWq",
	};
	return HjRptsRDSGEMOP;
}

- (nonnull NSData *)UQLDeROMgbzCLfgZLvm :(nonnull NSString *)fvIQkBBrAVeOYgapC {
	NSData *GHpzmfrWVvDdcBxMC = [@"VNDqIgjUkQpbfBIHdIKAXevHPwrpNIIvWYmzclXTgPgMhZQhtsasPqEfZXFzqpKeCIaXOoTKtWvzxfIiopytuocOezlvHohapCmkOIReMzUKxzVTXyuRkCUixuKql" dataUsingEncoding:NSUTF8StringEncoding];
	return GHpzmfrWVvDdcBxMC;
}

+ (nonnull NSArray *)mYGsCcSUunASmKnSR :(nonnull NSString *)wWpNtAznMmdNvOtqxe {
	NSArray *AbvaClUItwpOeU = @[
		@"ufNpiTfZlCREYGwsonBmMTKpEfUCigZLVSSshXJBWUTpEgIatpHjIyYYkzBRLJUmYWrvJAQzPpIXxuAjSEAcmhieynxvTXzdcwbPJoJADkzvilnEeN",
		@"yIihNnHxAYZXDjSYDfCprjkgMNNonHvllJvEOmzWSXjQrzxETAhnQkmjffNhPZuCkSBXsXxXuezUerDPmzTzCpxXYlZlpvZWYwEiwNYJWYPPRTqoLgEAWWbRHlRWTSudjpPiP",
		@"dZcatjSJvFWjMDjTGdhxWcgGgQYFpDyHCmKGPoIqqXOHJnbgogcoePMnDcrQQgjmIYlLSQWznikMijZNEQHxenNNDDfmiNGYbvsHQmbMxkmJwKoLNDJlyhXMYNXSOwasTdCQuOqtfVAcXj",
		@"jruUazrXVOjLUUekmiujZLRIjPNSwuOHJJNLmNdoQbaMdxcZFmYLIcsTHtQDWQCYKYEMivNzPXtVrBXqDYFImbqwMquLxrLbwqtBAKRLRZXJuLcoCgbOPYpZhukYiBQfSTpNo",
		@"LFqNcJxNMXGeEFdHvXMQSCeGqyfusCZGOnQJhIjobUzLOzBWmYWobaAiCAOkCLhIdEColPdtdoviOXbxSYAGtwepzmTtEXoBuuTsalEnTtxdfachyojqHtKFuDnWwofiCMzVzJJuWoPkCtjPfocI",
		@"LwYPerTgRNqrQGFgZmoZusQwTvgJnydmIsTCjFwJUokSVNDYIVAEXUMBMuFRmvoecnLjrctDyBOUFSKLyFRszxZylOPQENgpNYMjZajODlfubGOFH",
		@"aakgXdMdLqeJaoUgipPmrYazalfHzIjucaAYaqSugwztElSqVYhdlElBKbReizvavFBdQwFKcOHnmWMnvpPtcUVpBprvZGTDGgzckabmFXBogDquvQxjiRxuzktadpNogzDCrBcCDWtFRM",
		@"dGCgvstpYEmWldqZVKWxBelcBEApxQtHThxepVdfPcsgzBMtbgFhRTORwctoFdvZvdaaJXSyxWdyiOfjlDdIkSGwCuieFTrdddisJtezMIDiGaJVUZOZjQWIqjnuZTAwNyxGLuCGsuHPwccUCqxL",
		@"gJaGKJemrkNFqLrfJAppryJeuVpwWDTKdovDxItPVLepxZqqMFMfwOxUhTOnJlamvrRETOtOVyJfseidvFCvNrJsDbcRcZPaLquR",
		@"WldtAsfqRNQwEhntwpOtgSHWzvSxgzXlFjxiqkXKOPkyUpqNyJXUzvAniXpuKsuREXaykOsQsRDyZSRlzhwTbwaaJtMYNBOiXuWbsTyZyC",
		@"uHnkqKwboVvCddoUciCyeXPpFKsamLhtWADWxcYLyBSgtAVOoykrHmXdLPrEhhZHoLBXwrnVWCtMnkIVKXWzoqIKSPkotRbFZAQOArEZvTRYtOvPwXfCpeNNXZeHS",
		@"AoCMfaUIESUhminClJCkWGKlhuqiUULPNGGlFTGwHjxHCJbvcTLEmWTxbhAcNElyiaoLxtnPypXdlXlLhCXpgsEZrduVUmKtBzvprkBmLywi",
		@"XOBUrlhnNcenFvZlUvFkheVzZisxoAMbjSOYlblgtkZtegdGgWmXuMYUWyMzmxRlEeArxHbpotNUxLKqXxINZWpMYvUIokAZARlyiWfRCHEvJPsXgKcsDxQQkaJqoynLJZbJEBkPj",
		@"ahmqVPlypdvDbLIBsvjndzompfGKMHNKqrZgsoVYQuIxhUUjnuPcGrmEhpJvyzkXAJvbfkCwxSnQKtmeiGacFcpZIwlAFgNOBexSEuruJXGggpBPYDcsMRAbfUpjaZCvvCwtS",
		@"PvjRKEqmwINIVCPahxvquJSKvUhbAvluINDsCzZJUmSDjHcbfNrdpoBUPARpIJWXszcUhvNbFXWBmefcTMVWtuPzArygNoYCKNRaBYduSEdyOsdZXGVLBxIaKTwmTwugXvDfBzQKGGaZHR",
		@"yPFDBUdvwcmxVMLbbhUgiOQIGgLmKiBBCVGRXgyNvUHBGBRZYHHyupXcqRWbTVEEMBmqdLxjPQMIEKxEgGruXKAaMqWDeOjlVOibebSyglcb",
		@"NuEMcoLEKrxyhgJNjNXkcVcrqneaZarrImnrpFYztwRHQRsUaZRwVCDsZTRVAEnviVRDOetqLequbLNmRWSSMvhUMwjzuCnSEDxpaUjQZjzCgmVBHlbgFnxigUefxLdSeTlJu",
	];
	return AbvaClUItwpOeU;
}

- (nonnull UIImage *)fWNSiDoCDuXwpeIKlAw :(nonnull NSDictionary *)irOEkNyptVBEOThi :(nonnull NSString *)ukoAvbzovuhnC :(nonnull NSString *)GaBQgYlfMmXauByypmF {
	NSData *gbPDJeXBUvWlU = [@"eUlaYaoYlZimEuEBmCnvdmVBRXFBitMnVknHGhbCPqLNPcTovQobVlnTVYuUChYStEufziiZVdlAHtrHPtlqGdHxsDPQyturXRJDGwdIScvNcjhOg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jOkGTYdpzQzwMNOVGX = [UIImage imageWithData:gbPDJeXBUvWlU];
	jOkGTYdpzQzwMNOVGX = [UIImage imageNamed:@"vlSJeDjMPQXToifFuFaJNNZCAHhVtjZpWXqvnyvKfaQduwLiYsRrgfAGMWAlkdqfSuxRBngZDKSWLcBtWUxCcnDjaoLUnExduezIEEU"];
	return jOkGTYdpzQzwMNOVGX;
}

+ (nonnull NSArray *)GkWvfQrJYCRZPgUlL :(nonnull UIImage *)BPtjaQbPse :(nonnull UIImage *)dXEuZMADcqWrXT :(nonnull NSString *)cfntoNkBRdagol {
	NSArray *pGObzXvIDsyNrarhPB = @[
		@"ORGHEEtnwpDBXIEmwJSnzEHCaaooQRCiGptPqegZRNFTLxWqMlopaBpcEoZozTMsuTqCmixjppwktNpBYeYiWlRdiinRLDkHNpeTzQoZvKeteJxDbLYxvIsztLPbxFmLg",
		@"GrjPhkKtMrNUQHByvpYocNTVowxbYPkbGpOdJFDXYhPFNwFWvkJVguNfddKiMVzAWiovttENmGGRZqHOOWXWpophWXlUplfeJXCTggsmAnkpsRZTLAJyHobXfsGKvVVpMXZ",
		@"zZnIaUsNbIuKCnBBCabNHMFAbbvllrylWhTGLgNABtodfNgysDPVqgKWfryvYAsWwaZpnDTXXsYUXbiRsQLCVdTHjEzUKFuwkOrVPXmtmMlCjyPCRgDhtZOHgOvcGIwTGTwOxOSVefb",
		@"IQahDMCSOrfexQOkgEvjtsqUzvjftzjoFDhmLSpYXLCZicVJWiIZDulKGbnSsdLHKfeLjFLNcgdzAswwpPyXXZsUniOhFDwiLqxmzBOBmStdiUMZidMcIVg",
		@"YLFfMGcvVlkqpUhBTCRhOqfTQRhjkztaDRjncxnwxUARPcTxXHhygONavdJBDNBtMeagxZvTdtgKdMAqdsiaAHwgHOjysQnknPFNgKFioVddPnbgamtFuJIVgWvifvIebTlUArdugG",
		@"YWPayRktgHNLNpkjpcIemnNudPEpKsEZHaYMPjbSQEejgawHmrMFgKcUTwPEZMJfHARVyCrMYZkkpBdGvCKzglLsebDrGuYDchLkxDLnOfwpNnuWZZZCDmPnQWBenwDGdceAfUaAeMMhrMNFVN",
		@"TXzAOyTQMdvvqNKgUIlWWbDsiAbqATQeKmtJbDVMhKHlOMxUniVRvFrPegvulYlsGCOXijkyazpVjytuAUilUpZcNFBaATDVOHbsTvnJQmxHgCBsGIAwTuzBLJwWeWAvmuqqzkyl",
		@"iqTSuBlJyqlvLFXZahltJDeAbYsQTkZEomKoAYAVWtzbipcvtYBWebXhGrGiYRFFvZahBKXyutrtWUJtsBjdMAavxMFKZQMXaPxYuOIaEbXeWVeRghOSsjBhBHQNQCrfoOvRXhpIUWo",
		@"zbpKhPXIhrqdlNprGaBmHuGMJvFGAcMEALnbwMgeIFRDXPChpUvJttFALOGbfmxLRTBNCCIFKwRJCmCouCNLWotuQnesYZLvyruJN",
		@"cBfqyVVPqJzUxrkhBWavLvkTJLHZHQHvfuuWawemusFCvfoGCQLqybWgWPyGVtnEQJYZHCWLvqeEDhcfdhphlomnzTanHhMvplCOpKVwSaEruSNMVfcHJHqnMuPySBCiPfBmaYijgIjDOshpwZ",
		@"jJiEfOmynLkjtNaskxpatxaEltwIiQkSlRPutBXRSxuzBZXFdobaNixszlKAqcSYSPOBEEYpPwCanDAIkCVFZCOWDbGyJtZFTMniirbAxYMLMHTvfFRZ",
	];
	return pGObzXvIDsyNrarhPB;
}

- (nonnull NSString *)pdvBkpuHLdJEjNedlte :(nonnull NSDictionary *)CwkSfPmGiHlblK :(nonnull UIImage *)vOgkGPgBtQrigCI {
	NSString *cJPsoWfcVsXyWxB = @"RKaaASDWSPNkvpCQTSaxNYLcLIESABXfLVueeKHzEkeHWIxmmGVeESoYYbdJulWLxrNOmqMGOwrvYWhlwJmXtmeTRFlENsteTFXqNFXBEGWHyJiDO";
	return cJPsoWfcVsXyWxB;
}

- (nonnull NSArray *)IYOTHednFWQXuLZQ :(nonnull UIImage *)SBFvuyjeesootVJlG :(nonnull NSData *)VBzeMgkHvoWJejm {
	NSArray *NmDSAYXBsgCWkoIvI = @[
		@"JiXPXvFicUondZdKfjOmwzmRDYsgjrGgrFaWiAFuJkjkwwRZuyAANqXPLeGpRoCQvzOPoYahhNIPjUbIfounAChlXjYtMilXuxFGjLAWaZTEqvavHbSjmmxyGwLiGGgMsAXCoWFOiffmHEoemY",
		@"UYxlsjqQsmWTZMwmXrqVBVVDtpWxUiwRzltDPsoaKveWGvRwfrlQiTEcWyySGLsUFNAtShBRmUwLOftpQhHtUrVViOxwgiZIRrZICkIHmxUJpKUdmgfdhkDGbNeMWDiExzuqvxWl",
		@"feWDCWluTecmrluFqEgMVnxhWeGjTwHGEhBzkFHxDCPniQDEYLnezblfwJCorQJUPLRXzyhGncEoRNsuHmKKvDlNtHMeownFAWaCIDXYtIusWfZZHZIAMyb",
		@"xNHlyGxedZlBmmErNyEThFuqCHifUBiYWrNMlfsRHqOoodQcqmqmMTOPxTDUNxnmKjPWxwpysJgsvyZSsITFJsHEgEBJNyOgedxzMyShUKVedcqZyyqHKpUSFzIrxDZaRDlmXgxNfBJpDXbuwGwiT",
		@"GGDwzaReozqkoyxrOIkiWsXhnjmXhQEXxYwxKRySXYvuLZZJxONERqIxmHRBZayaZzuCDKaimdCKjdvqChzQgGnXTKNvQonxsECfzhiGjgvVwyFjBVlrKTrvsCLUEEfHuTbOfgjEMFxgSXeDTPfZ",
		@"XNGOjeFLdwuZgKxZOKYsltdVcSdMFRRPNmNIdQdRfNFHVyXjAQcxZzixYnzPAqCXuHnsxVxxntcnvVDtFjRSCltlPZOJzoRzBFbjjQKBwCVhdFTynbYewItIYzD",
		@"SJrqYEUrJvbAmVtyhSZAAQgQsSkYJtnQipovJlFcwdhWBnuYRbXcahmFfBulNdwHTeSoujgSSsPgUPAwokgJBEXFYonwNTgqmnEKXwkXSroGiMSmHinsjMGekrttDcOdeLjMCXkbAptGtcQHq",
		@"ERZXHyKKcaVszFXQdJozoXaupMbCQbjgVWSeNdWaNdWyrYOBzYnLYfELdKRXcflmHZlvmMHDDarPSBZsPGFfyTMPbalHHhIjCOrQYpMHYFlwgXbEpsPNaIZjQvASTEL",
		@"brbnNyczIBiXrmdPFGGOHBIUEIbBwwhKcImoflGHysOQsucEZGaJrsOpdcukkNDVUSKooGgkOxxUdegAvAtaSiIzkYBzMZyeMIbnsnyqVDkNQivHIniwsDVrTyGopqWDfebvqupPTzVmUWKoPTR",
		@"LFoSLDMbYKnNrPRIjXrhEyhCfSUIBNJkvNDPCYBluyfnIDuVQNqXXtcIBdMZzZPNueRwUPzNJVYzzCyUGhPlPeSSCfhZSspsGoVHPfrtiGprjQLfmZlWVnuJcjPoKPFOMgGgioOCNFimnVF",
		@"rhsmFYBeNEWNBlKwKAEUMjqcXXyQprkARtaUOdNesnNythCUDavxNInbKjipJUrVcXgWinYvsJohKOfpKQsGJgwvIEIxTaQJFRFzzFn",
		@"OCzXbTlhgKatdVkHSsGbXFfBSzUuOxhrLpSKfUMuXIKyZFzPeSLlPMzaOZWdYaVzFLpNyYAkwogNjtgWxzMQaIRjQyxScqLDcqlIwKgijuJyKuzmXcqoikDtONgqRfiLocnVMza",
		@"AgVvfHKRZpfhMOzVyyUMXXnuihPmdDzluXCauWXLUpHXyjwYfMjLrDCTUiQBQRlTvSBoPLLOlYOVfEiDKZurehaSeAarIIkuYmKxyEdBDFDfLVtbUSZysrizHpj",
		@"xoUMiYQvcbVAdYGHsUisepAbXkKWRzaMQTRmWVBojiBNuwTAUbHQVhZtHiithKjrvssSSStyxsxXQhNvOzPZZDSellczYwgpQJOiwcevXKnkIrqwnLXdoxqskqEKkNpupSuppEMDJG",
		@"hAMWgWxzIOjdhekwqzgtqtzzyFaOPCSEENMnbqOcYvoRQoAWqvosFqbtcwAHiqUBHietYrTmGXRBEBnYCErHDBideJwexrrYimMNlzJYJm",
		@"MuuDmmLibUXFNtwMyIvrHgVdJgNgIeszBnpdILsHDoHVGSmqioWxQuOrxQzsCzXIrSLLvZSiwTJWGrOFtpppeenMgafkAfYOeuiyUcYLJRMpsHwcCkwOYmlUHUmkqvPDudVrWQHVKKSBq",
		@"cVmfISIgGQiuCWbFTdyzsQEbXLfCPQiMoUwgSrAsEsLjtLeOzJZeNkmFDNzuqwDkqQuGNxBGVpJZORBBYGqmWbLjFBFLVrsMNBfIuRnmuwUfHkya",
		@"KvODaUaMAMRZSgCFWhiryEBiJXZSTeuMnjizYmBrItRBvleooRacZnAuGrwSdBkinCnUhvdPORkgcrFDvpTXlPYkyKsiEJfxYDuWLFQxvhEUmlIqsHUncsuPlsVNHvsgBeh",
		@"hZZzCpBECCZaAEGEMWkjaAsljeMZlfjjXqluUOvqcNzyoxigAzhlSRBjAsNqHfdmmRvTHcoJbcJspKjqZbZUqgjoHgUUSjMfwBFyazGQIfFCqbjihSCYGQsuoqcPvNCXrLmshvRiQrNWaO",
	];
	return NmDSAYXBsgCWkoIvI;
}

+ (nonnull NSString *)SZCORzMxmDihzPDzRZm :(nonnull NSArray *)jjiegFqajInUAS :(nonnull NSData *)ckAaXaXrPPOa :(nonnull NSData *)hybiRvlDjddofqfizm {
	NSString *KaAAEfsFIHWrUO = @"aSHITvXDIPgbxiSLilmSYmbObanawyFQMJpAhcFgRRUvEWIIQNofmsjylhuBJqkpDYNalvxRYTutsZMfgtJWPscbwpsITzxaRZIXciJlFgNcHWEHJUfXsiAKO";
	return KaAAEfsFIHWrUO;
}

+ (nonnull NSDictionary *)bKUNqtwZgwDSvWBFmXs :(nonnull NSArray *)rMrdXXbYFIfoWWqXgZ :(nonnull NSDictionary *)KFZFcuVEHMjzpTJcs :(nonnull UIImage *)NKetoGRwUWHsb {
	NSDictionary *NAgukppzmra = @{
		@"EuXjDkpevIbF": @"MXFetftNiwbrnJhQVtkODvIeJWgIckCnapoiRssPjXrqTopGBWTWGFBtkXRApNbBOmfHtcZsIrUYwHjwaVovsRereSkeyEkJnqtykpmhlcZQJWafW",
		@"RYzuSRGDkbI": @"rIbAJpfjwqOPtAVqNjGdmKiuJrStHEzGjJjqxYaFEdYuWjcutKUtznmaQDqfDPNzKSieIHepuMiZltkbsxjBbSfsMBRexzXIohLHLryWrdSAdHvyQrCvqYxDExnnbzIJsrKiNS",
		@"nTWdxuBubsJuDybRKmK": @"LNKAzCLPYPzyEJLqLoCHqAlIlLeaAbjyQtSnnkixLJEcuuXwcrCarYPpDZcvaXNmQMIFzhIYLTgdsDhFAsjIuYfWrXHMrudwbuRbDHsTnevJvRrRQEXlrPbxTkfIsPHribGfDcadhuhoEY",
		@"KjgXsIbjkQoIcSY": @"WmIEQLWIgbujvJVYtkKKZfZmWXQWptFfKPncfQolRSUQJxuyhglzChEQZFuBELTODsSoLvjszHCnTzLbqhINPIUnjPynnjYjFDlIIpSlNbRwEGxjmFvuCpXzCFpgHTMfUDukLQKtCmsnMKIKjpfUp",
		@"jMkOOXITpmeF": @"XSAzOKxGYVuOyVDbnUZkCrrYCrfxWRnLLAdtEPuMZmFfssvaWiAjahumapMJaPvWvZNCgHoTRPiBltkrDwtZbkzEeGHZQhmUalhdybg",
		@"qQxpCCDbStSkrMmbVF": @"yGJlOAewHqlLZbbnvvtBOSPUmFNLXRHfLvsnUtKQoxLvgnPoCiOKbxaBQPBFwEuiGqspJktuQRhZdAzrnwSjPvVuEUleTZLChEDe",
		@"xEjGqqozawaVDzxh": @"OQgTGywfEzKbdcIkADHAANDxLGxacNplwbjHnwLShwCxoWMykbONfTheTKzIFLDRHYEZEvMomGCLudvfDRqoCMhbIsXcBQeuGXXGVmjOUmecDwyilTWrUWD",
		@"UmjCpgUFxZXq": @"nyZftSseSObAiIyADVSCRdYTscopzNwUHMRLZzaAgjggjMtVySTFzPgtjSnDzJeqxPYsUyzafNJsFbHFStGptBgTLCHKRciKsoxbfforSjpniO",
		@"CvqCmFtmTCmhtRAenfm": @"fSGxSuwGtRtUQLjOrEkSnkRomiXmbLsNZcBHJKeGqpmbyZUWZWlGeDnBNsdGTofxeSEAcCVrZibTuYSrOqovwPxpFOlekaxgoqVPNZlrxiOMFItwyjYFRDMp",
		@"vatuvOLhVRJtoIDc": @"gSbHnridJFyWPliapRpJVaeLfAjDFUXoIAXedkQZqggFseaKSNLirCWnekkGMUhcLOeqnMHcrucbIXWDCElhZfDcAxpCKkVchGAcgEhRVftw",
		@"MFngaOmGMdwWxdCVHez": @"LezUgyNnsTufghCJPiJYlRtUYzJdGKWThcGwjnAiweYfVwUCuuAQcviwvMBaSVJQHtrLokKvNByTKVzPZtUoGZGwvcptuaFULQIbur",
		@"ANAsikjbYBwj": @"NjIrcIScCdHHkagsFOQqrkSFGCtCzYWvWFXPlkPiOKhrLwGWfVzyEEsNEQvmugpauNleEymAYKHeHFQEMFgBaVXvyBnwvJtVIJMTYKVzWyzUgiJsJafpFsxnYpnsjuSIQxBEnmlTqDj",
	};
	return NAgukppzmra;
}

- (nonnull UIImage *)fYzYBSTDfnDs :(nonnull NSString *)cSjihSKYdivthWma :(nonnull NSArray *)CzWEGbnXqtcpNwcUH {
	NSData *RVCTaezaWWKZA = [@"MRnonijHMqacZlMLEqzYkTtpTBZQFXDlPRmiybyOJpkOncuMhRjCHQAQDthQaKqtAVDHmJIjvQvQXzKUjcNoVnzgvgfWjQxafCmxPKesjwasnkDZKVYOYzQmeebIEZhGecZFhGO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pBDGWeNAfZ = [UIImage imageWithData:RVCTaezaWWKZA];
	pBDGWeNAfZ = [UIImage imageNamed:@"UYsHiTxYvcZtHNXaDOopbSeJHLgijlIHjerCsOwJOvPpIZQhZrIXyJGTEuIBZhbjiiJbpVEcPyLdgzXosbpcFlREibnvBvnlTuyKoKBkzNPbzCPO"];
	return pBDGWeNAfZ;
}

- (nonnull NSArray *)fqpdobIyXr :(nonnull NSString *)NqbFmgLBrKjQqxAL :(nonnull UIImage *)lbGSwkDOTetzLmEiyF :(nonnull UIImage *)mOGEliqxxXuOqeQVUd {
	NSArray *gvDKPRXIWZeoPZEDgSs = @[
		@"vzHDlFiWEfwXiLzlhdTTDSEPCzTPhoPsqSBDzDVXyNJOMUVVGdETtXYjyVbmZzxRKhPIiEFkUJggNsvsZqWwllAXPXRJOXoZDtFeurGuWLWGHFeY",
		@"wblTDHHfcYepIQfYCiMRVMlGRzXjZMpJXQXKQZFfPChxxWJfwDqZbNFIvnagpVRHUnEPiEecGLDLBIcOyHwFpqlEkLsJtIHIAFKQtcomgYwMghVZJaboXwdWCceOKpDNnOfXOIChjkCQGf",
		@"jPnDgvgxSpQwNcROKBZusrxufDRlOesZBASlXYmaSeseovqymhpokKVPqQouTimacHorZowfjUkmcJWCGvRzcwCleBRVDcmAaSKWqMZxMQKCdHLCStMYo",
		@"BYNTCtGkSoVdIsxLZyATqklkYobytBsFwqzGhnhtUQJXJhaaFmruTwmLOcUNIMfFfpIVgBVpFHZWKCTKbvNtMgNLyoRKgNGnorIhxIHijbUbH",
		@"mtBOkwzGnonjpHkDGyOXsHBUkinznLwDBLrxGgGgbEwJBnZVjuEQjoBczBQlLKxsZvvbwZQeCYFaTIfJjPJBmPBJtgzIpbsJfNhmgCeOrmnOwHow",
		@"hxKdgPTdJYwlGTUEQRclkKemtWUIBCVyfXdrUevAPabBjsshkMpZNgSjCiSDRBfUCDRJiOmCsJHUZnekbNbeWQSXAvpAVtdHGXTATlzlRaQksTdijpZCpWuz",
		@"gCltyHBwPdmNCjpsfkeLRdRFJToTpDlxILDbCAqDOYkJrEqXOwyDvqgvcEJKiSlKyPsObINmtxyqlFgkcXBnTRGERXEtXWWGBloXhSdoNReGrX",
		@"lduMSoXTtXKBGIxqGcHeWrDtRUszWTLOMQDTkjYrXUgdCAgBbCONmAHQejGRnNQFvAhAxjpDhajVwxgUwJVMWDGOEVyvpiBFFccoARHnIzxYnueolaEmaMUDXTdCQLNahRUnUb",
		@"XgYQDvVfpOzsSApoWzTrNpGRbgIOUpneFkxYFLJqdcXdleRMsiFxqcPJidErtBQwOPKfAHUwQMKgbEEhRAUCLdraDMkthptaxiWYWxdfqtlsYQ",
		@"eUgOYJmmPteJVwmwqyTpSqciIHYIFZGaNJcNBvpavzUWSqbTbOUSavqthuAdAYFvBeZUsBpOvWfXoapDvLNTEISvunIvdaTahFIlDbUClAMSBrIcIvJrXRFBOqcZNUQqtWpipMThiwFJbtZuYY",
		@"JebRoNKXeHTJEooibuxlNCfexNwgYxSkwNnUJwRcVgGkVbQwYRDpjtlHLvdllkqxeFAHTjfNVbMRQvcDeqXzTwwDIlHJmfiJHhoGzA",
		@"iVtVMPpQgzJqRYsazmxJTywchluzgJjhFcNnWifxdgNKofpyyvaVlfrnfSycsOPTpInWXOLwMEWkeaaPxpxaolPtfydevsbhSZCDC",
		@"LfTUJUhswYEJcvGGtodRezAvrTdnQTKGeEqipwCBlHkzdfXxDPPQFlXYowllfvDYhYnqlZhUiPAhvSwDoloYCYgcCPTBskZWZzYpBIoQ",
		@"xboTXjvisSHIjcwzCzgyEkfkIUfVQBmUjJdiZEeqgKUbLpMowwBsQWiExOpxzDDnHEslZuAqPelqEmVmGensLVfcSplMQKDNMkkJO",
		@"MXjdMblAmrFbjoHDWRrETgqBLnkeNitLMGOUMZDKTEgNvLMBFSoYitePTKEitdzddQElQaSKrmsJfISYGdLruVplECRhfJtTgmSSqscJQZkukqsttAYhMseNpmdXPmBkyFxZjDTHU",
		@"bvbvhdeacFuQZrkeQFRPSnzCbhPAbkBGTxxjrXLLeLGJQetAaKTOXnjdkmjbGdsQABbOeBSePvSwVFVJqsamdEzaqsbjLyPSxYItcovBuuCZpUAlbwFTlVheVIEXSlnENe",
		@"EfDiCqynwNhhHKoAlOaJPXpGBGBjVjRyPntDwTsTftoIYhoBAutgSjQZhWszadyAOXMOvniRPuKYHIYuyXzVtWwKLrPnaObzXTuFfWFpBndGJNOQUuDdYWWlNVEfqOfVqdKYLBKnFLjF",
		@"NqbdpEYtHlHYZzcoRKSEKLCUIYpykeYsurGIHttJGaxxLUERAZdKcifoSeArCseyIxgzeeIHJYXbPYMMvWdkbBSuGlflKiRAsCHqceAelaEMTzECAgY",
	];
	return gvDKPRXIWZeoPZEDgSs;
}

+ (nonnull UIImage *)rBXoMkoXWsGAtV :(nonnull NSArray *)GEsuivSNCtEy :(nonnull NSData *)YnCrOYsKfrzTQuwiHyz {
	NSData *jIMqAiuDyzXB = [@"GpPvmHBLqVPDWFtFFxNYTKXbtPNdNOLMUrFJMJgidFZAHWtptkGJhAHhwUhoWRfCcMWEfgmygKjuIKcpJFHrMEpCxlKvHavxEtkgDgnWNuOKlrMQbfEuzNloE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ruIXPCCedjhAYxwVP = [UIImage imageWithData:jIMqAiuDyzXB];
	ruIXPCCedjhAYxwVP = [UIImage imageNamed:@"RrQkVIBTnUufqaOdluyrvUIyDRDngblSfRAxNkUiuswnVKRojFgGMHGvIKuOZanRvhbqqFoTclVzbzLcdnkwMQQNvEVYZERXFrNuJpkLPXhVzjiVL"];
	return ruIXPCCedjhAYxwVP;
}

+ (nonnull NSData *)oDnKyoDwbFeITRfBCg :(nonnull UIImage *)nYRrumQzJKuB {
	NSData *hvuUgRIfLrCCwGXUo = [@"vrdZrzrUKubEHZDNTLbedARNDzjcQYiyYQNIccIamwwjwpBrBNCnaZXQbNILszDvjJfUHAECXthOyzlNkJFMJfjNOXedsTFuGNzZudrhkIqPElxGQMpjdthQnStYAahSVY" dataUsingEncoding:NSUTF8StringEncoding];
	return hvuUgRIfLrCCwGXUo;
}

- (nonnull NSData *)SRmcUctIGOCHFoxl :(nonnull NSString *)oaRClbONGtauxAn :(nonnull NSData *)AdLGhyHrWYTUVRzGPZL :(nonnull NSArray *)IeUAKUeqkvXZCfUNN {
	NSData *YsvvslCerowFGkGeQg = [@"xECMOauNmPHVgrdSyaiOnijLCEpoWfRHXVIqKvsnvXCkYjVWuDddAjUjeOuygNfFQVpIQxgcLLtkdKpeknyntYZhFMeZUIHpXHDaOJmTZTxbm" dataUsingEncoding:NSUTF8StringEncoding];
	return YsvvslCerowFGkGeQg;
}

- (nonnull NSArray *)hmRXTPzoSsvdwJo :(nonnull UIImage *)PEQIYYTpitVoqWM {
	NSArray *nOAIctEoyLHbx = @[
		@"YTEMgyystQcgMHCzSXxsHOOaKVlVWYJrBzvVAaQrDHIKhDDJLZanGJJVhXtCWmXSSKBiwUuFeQCDNDYUsZsaLmPOHnRkrlfDIxNHNcz",
		@"asSWllrwsDEzTLlAGiIUtHbleeMjMjBSUMSupRzbBMgSNoLFmEqoVNmhbGPBfjZFJWUCgJgaCnpaGXUFdNpvqWuhGFBfvadLpwEyljFkZMOJlARebhclkWmBekuBmVLpakQmr",
		@"WuqmnvuNqabBgjkbcLUMVAHpWnwgDNCCJhqBsoqvnMzYouhwBmxHUPxeejBEOUYnEKyYBDndyJfSxXwDrhQZBjqFCldfoDExFoFBiEKcnfIlyawowJDHKFV",
		@"HIJQzLKNDIaSsRaAjxcMNYkPpxnThnpKNxvdjNXMXzNtqaehlAageuJjfRgwkNnYQZbnPEyFodxgDvkIqIUAhlkIApMFKsORMGvtKTHdFLoDvrnADgZwYprvb",
		@"qCpYFBNIxkwgInEHQqoaYtcApdcNUbIZXCqUUXzuxakGYOYayialGiqEvmBVRcoCcktbkwmeIJdYVnCNrsfwZndHdwyOWuHvHaEPNfHpFIhQMpTxgbSiXfJVCKMbkJdtCBxTGcFbCAJdhuN",
		@"OMlPDYTdSTNsaCBKLqFqKkHfuVtHYGWGofzlRDvqAQwPclqmxdgynTKYzCQvztdzBnhmxAlHpOnRgiWLcZqdrpuzREmkUgJtmjkkODjbTZsusfBCSdPy",
		@"IFVNAwQkAjBQfIqLzbCxAGFbIFMIAcVlDLeGZsVSKZwjvKjnTItoFJihyJQkRkuqNOMVsETtZKJtLibHORCJUYfnRwagpYFqMGCbNZtITxglDIAZbCsiUuvKoWRfzNclUyxtsDJwvC",
		@"ZnaKBrcqVaGrAFRhzfAgQeFOioWsmKOElxhCyTvRhrfydOVuPnQrrhEOhjkToMgNmpDPwpwmRppJPJTxWPAHqeotkodETptsWWXMYlvsSBNi",
		@"JpUcrNeIEKQeaCbXfxaZmjwWWHPQABntiCRdCKEcfULxgfDZnxZtkYUNQUDBCkXcUeSvxZMBbqwQUGRfzgkvUIemcGnrcsjDNXcIjQCYzyWrBtkplaWZwGsFF",
		@"iskxwrWKXAFLJcoVODwJFSjuAvDxBUMwhDMGtLXQBMzfiCJVFNAgYRnedRnXnslvcEUqkfqlGJtffZVIgjauWQqsoqBBfMuZBzcxpRZChMExPzULoMJHOFKCfQzQtIAWkkjpLDDSzM",
		@"JcAwCVOpszOWVbsyrgxNzFmQWBIhtkvMuHJnRLEYTVRjjKLqikiwoIrhceAnlaejuLbWHIRRIJfOKrGBsThzdRjxEMjXzdWIUPHQCpgwOqrA",
		@"RWKAhMxoYPAgzEpHhfNuRYNIovskLHnKRrrkMZdizKCEXSFXTuQQZXPenZqYoUewbjyFolnEdYSqGjudgUlEstvaPpAxVTPkwfoGGzRViWpZaNbkLCERCDqbDMRiwGHnLYrTFPuJfkIvr",
		@"ggqDxPYuQyIIvbxybORlqAwiafUhNXDStZEoBPLxaEAyeWHXryYVibdkmDGGlSSrPDumkGTwlCEaDBwWbLxTuaLAweJSycatwQYdltGeYEjlqijbaiPBLVwsyWTRtLDSzMJwtv",
		@"yIaCvnavrgQfUfREyygMRNMlnUhzuBeSdYgwOFkCseWKbOmdBxTdPHIfRzSEUfzFyaHrKwBzeQwQFwLWcUHdZrlPxatywPWxxTuPawPjEQyhjDCBOcrBpNOJKukITXgDgaedbWxeFuWi",
		@"HGberFCfeiAojOOiIiBqXnHwvITXRMDhQnXDcCYWFhjcjslTTGczvqaeTxPdSzmSbmXVdtGYtiyGKrkNrseQOSBmwyQCSKJnSmCkUcRSIlmZBzgDZiwHWCePDZEGZbfyLCDppVEm",
		@"gsojeniCLacJPYXJYlejMendueOyvKieyFpCwKsPaXEarPyjMXrjSBsJtbknYOWgpYWsjxnXmvVbAuiNSuTGHiWNIScsPfDZgtFHzIDWccXhaOWsVUpZyVWexxPknxTdhKBBVPenxwHaamr",
		@"wcCBWjNgVGHsvbarbIDCeolCefoWaVOPXGbfnomJdCqpXwHPZbmRMUkTSuFJGCGevxWIyvVEUbDLlVmaRbFgXNxAZmnMcgQCMMmfLbYNMFthleNzQYyKGdlUXeSgXDlFSilZjrCCSxTJY",
		@"QqCTtTXkxHKSwjmnRvAnqdBLHgSsPKXaJVWgCTzGpYVOxITEzcnruCIKPxaNbuQBfdHXFFkhSOpKPFvMrluKcpsrkwGOnEFtKDRkYaHCBnlknNXMUlwZkOwWxOjPDjjYpOqwlqJCy",
		@"mNflqmQMoJaCQGvoRYrUviEiySocmmBrNDEseEpsTtjPQqzcPTJwxHMExcWiBMOgmhLHvGOePhissYybqFZkPiAtBNuSvROKbcswxpmcHKkHhenqIBclxydooPUN",
	];
	return nOAIctEoyLHbx;
}

- (nonnull NSArray *)XvlHZnrrGl :(nonnull UIImage *)jyXESXbwvzoKKHXhP :(nonnull NSData *)quIISDZKoJUAGdCJpHI {
	NSArray *ukUwapFIwa = @[
		@"RpWWMIReyhbMwmmckYSyYerNzPjzqcfketUXmfOoxteObNHDOhXXntqrylesILyDTsPALaHZbzcyEuSiEPQdeKUjgQQzsyVQtuhoRjqaXuavMUYZMbMwjDQxZYiifwPjgRRJLeyfuxN",
		@"BVItGsPHyohkKzcAnncGSVejJFEEybPsqCrxgZktzYzpqaADpmIZUmWMYSEQnKruYjuqsBvJTFlSoiJHxihblwgxZuYjHEnLcNztoBGYgSIHmzDVXVJVERpfDvYYIpja",
		@"pEEgteWdzcikQuqcSiVBzjiCpssAQZUzEKmUUXCwgfolIiUpecvceIoTZWUVANTkciVOvJEsKxBkPmZkRikxyOgbLjiUBSESwDACxOLpzHNCRpcGbvdbIbN",
		@"YNWneFEbBbuimInFWgQRvhOmGZpPvFdMSgDynvXaTOdWiyVMiiTIoulmZWRlADtMqkbYJcxdHSlssjheLJjGhwKsrSmoMBUWTViRJPzxsPARuSSwSqsHJpjmKlvNRVqBheJSAjgYWBt",
		@"LeRpaSbAqoVWRdhVHeLoIafdleLzGovfVCvjlqGCXdVZfeRfUxwjuzLJQFmsNhrhofpPcoogYQJVLHjdLFDHyZqMGblCSVlmrxJHTGedtNCeehLSiWPuSBaYHbWKZAfpvtePGW",
		@"CdZnFrZXsEVMNmJTnGuCoUbwoHNavxLzAHLoLYXEGryGoHmQRdsuPdnkdWqiZSIuRxJeFbtXZgSruuXqYRaPYHNgUkvNBVGChBsYFObUqnZmwfFEZiycpO",
		@"CCcBGWcJUWnyHWmOcWYVwInWrCfCtafQeApieNDMSRvrvwXqRpCcqiHAWqlJmbESgrtpEofBVuiQwJwAQtakMNBVWcmrGkqiPYxSgKAPJFKJlnftUoBIsDLGrbHaTIvbhFmbsUT",
		@"VTXnoNxeJxudtQowEIVxvTdTrMCaheyoKlevnGlETnVjwEyqQNbSnpnYSUFNfCNAsxStFDZozKYIFXbyIILXAjocIxAkqgOXCPQtltJLsensPKGUwfFyyfYv",
		@"dIOnmeCDkOxULuEouROOAdkxKNHRhxTPPdcCFRhburjPWoFbMSzGcIvsUCypQcswyQqxMQEMczjkUoHwweaLACwUFRGdNtHpZDZkdulieASDBBzHBNRWbHMfvuebabsMhYhdfctb",
		@"jKHwIhbtIEKRGHxLvpfnltWzPPkmkdIubklAIeGMbXtvsjmtsKIeDqwPnjKJONlzeJEhKuQeHvItsaJsqOuYYWndDpOeOQPDBtvmvGVtl",
		@"UQagLrLUdoAAuxtLeGfxgPsnWADQWiqHlZoygjxbAVOPohgwClqxVTmtjsDbVWrFTMWpOnTQYqVMqURRntMrQdDVzDEbhOIXTvoakcFydwpSUjHjCJmifzxkTilsuNckYHnaWw",
		@"FnhktlCJuLvunhOjapIoXhRgsKgrXfLKKMyMciJZJXQjhyADXchmBZDgnDsjLOQtnzoHKhYFfKzVeeWaJWnVGxUsgkxQQBsPtWXnNnWKvTkzRiocjOWJwlRiIRIBNdLsIuV",
		@"poMRnHqZHMUgHcCVLfRINZfjevNfhVTtDnayKLEBxyjCAmBfsuHaJJqEghEwVxoZLpFOBSHWFQTqdsZLoGjeKJMHTVMZuGLDTizbunCB",
		@"oAidCoJhidvGvttVyICswDDISTwQKDuslfwfdecOiPOkloVmxHzwjFjTLoOsKJzurungERJkMXgLESpHQPwjMucUOQNYMivLDMuCAypQOWoCRQMTXixtdkKFeXXhXifu",
		@"ocjkMqCGGBcCURpgWgPsvgZCLwgxKneFNDUbFInfDJNCRfZrKemaTuKKYgTDznGaZEBEoRWuSUgIDxjKUvBeavcYOLKRySZgiNiaaSrXjQoAOpLkJ",
		@"PeZzPcfyUlDiNTiSfxNCsOUsixIDgYwwbZKnRvZVegxXGmNZvZOPnFibHVaVSKmzzCdSdCjXuNAkRzgsTqDAHdksZyfZpEXIKnfqpckiMZZzIedetHDL",
		@"zELTayNGrOzBRINWYDRcsylqaIxFQjqUOqzsKkrlECRvtmypacRiNgrSxZHazQpmRwNiCFSKYpJIBvUuKlEIGqxJHQIEJoIJVBWGKjnLBmUOJuGFIzlsqCRoREiifDhfRqoUalVNl",
		@"kGwOdBUgqMZrWiPBPDjVXWvxyVMetIMgPFVFzqcEfJQtgucgNqQflSREZTHOaUDenrbsjcDFlsVHxuxEtgCyCfiwfXcmeFiKpmCQeEqsXzhsQlbwrSeouizFEYAzTFbByw",
		@"RWKEWyAmbnJLdTZOATpzznaMIYfjzjyvJKVjgJuJofLCWDEXtwpVnEKDHfkrsADGpElbvApfsBLUhrXknNvuCtaZQywtRicvVWGekUYLugGFlXF",
	];
	return ukUwapFIwa;
}

- (nonnull NSDictionary *)yFWpzlWsBw :(nonnull UIImage *)NDFNGjHMklOp :(nonnull NSString *)vAeWdwkJGKnIEHmvL :(nonnull NSString *)teqZLdptuQDmdczowD {
	NSDictionary *BpyNRfTXXb = @{
		@"UjNJxoqXCKQjnbRb": @"gfXoTFLmUVAlZhfEHBXxQpHWAmnbeJLcezFRGYbrAgafOUWhroDWdcGGjoIAPCUycoOWmHOZmFxgetPZoyTIQzEdvzvTITfwiYyYxJAdcyL",
		@"SJvWrRLrxjrcT": @"eGgLDjlPePYtpqsxvSfZyLTykxrjqKIXmJcbCQTzaTdCEAuWZGWOnOrpNVHttmRkzMlHyWkfpQNwpnIPezsUKJUcYuyIvSPVbIEEwnPAxQlgnNGfVVP",
		@"kRMZviNuhbty": @"esRUirXFHEXGiSmjXEXQqbTuwAqQLPngRzniyuUdNoJgbCesnoqmIcrTETQQaocyBYQXPsaSLFmmXVqCGSzwQsFAjgMspZGoCxvTlSBfPEzCXQJDWsjwIwXunk",
		@"GcKsnyqkWiho": @"ycJrfUpsPpDRIgTYCQbAJKQAKEzgsMxYzOqvcgWPwXemLzkyDnwFrdvVGytnzhxKbVWZAhbEECMXhEoCSfeVZysGzUttwSuaehjOxTBBehbhCwDnKngysqGIrAWFXvnVkteRTkNEWucJDMcgWz",
		@"AMmYImcegFe": @"neFmIulwRwqngpbRqNkbIcbtkLEPNjQRfKoVcuqCYWuNQoMETAohtvLmjgcGVzwFksBCfsnksGbrtDRkNlHVGJkVIOvvXOrHHaRrnlRHnpDaksCELkmwdoaUVhOY",
		@"pdjmsJDJZnqDDEbYs": @"RyPdSBxkPiSWrwyXspZZLqjFiHbKbowWEWyGotPFyhLwaKVepQfHOJbyTDUHFHZTULNTAVDLXwFxppVrANKVBUbqoTorwoAFgQoYNGoMugIeDhdygVbkfyrkpRaNbrdFbyHFkMBvCdSUQy",
		@"YtaoYtcTKoRljBdsaOE": @"adHIPfrYoFYYACsiPnxhivnuRABVJNnSzJQUtxYEKIMezLKLeIyGQEFNfEAwsJxkidTUmbzEZlcJhNdJJFItIFCDjMSNFWdVwgbXlDJHQBRvLEtzKutoIENXnUBehjeieR",
		@"OAxYwWtmOjC": @"wezQwbdsTHnSAtKszAnRphOhKyoMTilsubnTQCHghJOSejSXlNZKjgCgXSrWTomwZMjOUlMlpcSGHkKVIHEsHaBozWZRooUIgRiTlYLaQb",
		@"EOEdICjVeMwiyj": @"IZsdJkssRBeSSMMuEuYwuyDiCqpWYjRKxWfqzETYMkatBurOKoFNurJAZJgDSBYyboHYfBwQyOZCpOFYaZjHTJxGltHAighCxqxZKcALqrrSuapBXdzcNOWElIxVtqpQeJTFepjD",
		@"oFprCNHCTcRtVTHQJT": @"RyeObQSDQYoIIiGBXYdrMzQRBialxHwTwVhBpvKpZbPwmZZZJFLcjYeLWBplcZlPADWPXWHrFcqRKAySBDQgExcExczUidMcCTWAqAmAndTXPpzQiTGQogAFlSyLXphLuh",
		@"AopEfVBqZzrilxn": @"IdegmKnACCaWGRFtAVbgQXfZFVEfPfnZgMvgEQqupBigQruFNNrVEAWTurBRPBUKQRUCfFtppgaooLwBBaZOyALMFDBWoJmyVHSlohWeZIyDF",
		@"iCIlkDKPHIaXPml": @"NGVXBxxHWaUaITkQvhKzoRQWaTFeyPoJVrjHGWxZOPGzGZZglvGqMOcnVSxEZWoFWSyvISfARJSTfiBHqFMnibQmQgqnilwUBZXUhwIhVAcNVnlBnykREeWoiI",
		@"zblKXGKvfCspLNI": @"chUQLqtwMtrfpooocqUztOjnwGVBSAkAXKrrfMlsbvtLnPjNLWGtumqugMgVzBpMuxyouuWEKnIjNqrSCmprRbkonKQKNUXWvKzvoGrCsHQqWf",
		@"YOEQXftidlOdegcF": @"FrFuqehlAKyokfyaRvaBTeaMcFdrKwqffapZrFgcYSXAyuitiEHVuGnFaKDUKKouiKkRPMvHkwZMkAUqYueJKvHoamPXyLGoQLtiRdyQG",
	};
	return BpyNRfTXXb;
}

- (nonnull NSString *)gTbmiSRhbWRfxHH :(nonnull NSArray *)FfLswtcAunlSaqQ :(nonnull UIImage *)KabDRWMgLudKZ :(nonnull NSString *)dFjIAGMYFwYDrZGHB {
	NSString *vFaPCwjgnTL = @"ceCkzUuGfRpCjvHwcHrudfBBDsjhDXPtUVQwoOTrHsGGqzkonWwnYjzpoWGCtdtzktvZQAoBPJvbSmqZWsCWEjakRKPYNbyUSlEiXmcfyounibSHehRdqZAMhNcbULRfOUPr";
	return vFaPCwjgnTL;
}

+ (nonnull UIImage *)WOFovAZxLHsvz :(nonnull NSArray *)wcFOjoFuzNOLbsXniU :(nonnull NSDictionary *)wlLuWeyOiUFGMUC :(nonnull UIImage *)TvwYMYKHmxoTw {
	NSData *ZdXkdpMcrPS = [@"kaKWGAjDvNItGxyyDdduoNKgysFywINCZcMqSOqtPnVDcbtBPSXgKzHcNrpvYcRAiwwdPJxoHMqwrlpQqdqTmkoGnjLBlxzdkGtt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PPNpqNWkEV = [UIImage imageWithData:ZdXkdpMcrPS];
	PPNpqNWkEV = [UIImage imageNamed:@"cDmDKOWglRqNdWveNfJcYOTVkiwmmvSInmtBbiOaOhSBzyFuxhjmxrrOLJmKtIaJWXiSbTOFTdLVuIQKwRMOFLDkaSAzEjMYzlqfeTXzfDzkcPvIDOeCWZNlkiiieBVcCTGpsyFLjOilGohwGO"];
	return PPNpqNWkEV;
}

- (nonnull NSDictionary *)OHIUeFKfbYpjhc :(nonnull NSString *)wZGGiCRcqrXmWiNH :(nonnull NSArray *)TzzEzGBZmf {
	NSDictionary *ysgmoxWMyCJTwbBPlyT = @{
		@"oNSvqOkPpcoolD": @"ipCOsqOsUgnsyNcnYbkAudWLoCMEXbsWbEXBPHIDIvyaQuTnrOKAyReIKGfxREJccQRlkLxdyfYokQyKTocAFWeXfdBPYXIATxpGZ",
		@"cWmsakQuGxyDAMcXZz": @"ywLdCiEdsGePTHsKwsMoTliLdnREEyYRmUeadlLgDsYwoOMFooPzVryvDPOEjdLBVhQGySzrDbBHviCOHXvrLevcUJWYGRJLjvcqnmLIioBlZOAAoodYeWxRULwODcAZRobIhXE",
		@"DnIcCtUIOiaDsevdOZJ": @"nhTzUTWMyzGLqmboWNyvuumFoaZwTBXTOXtGRfJMOkiAhfLQdWLnLSdnUFsZUeGTcBPNuAUPidSnfoxperVVzilEAWuWFHtLCKHcNGjlChYFCeMWHcHgdQXcCtTgNbleXk",
		@"LJCDajTuIkCzcIeYHjm": @"WqMuNeAkUDmGzNUKzykcYpqEcSWqQubviguZOnSyFOfahkpNHJBxURwFZrPPVFEWzxlyNhhxEGbjutYCGVYFmNgNLcVsBdiwznzSvVnrLvGPFvlyZbvDfosjCdNYGUcWLKb",
		@"hHCxKIMjymRPjcx": @"quVclSWSBZcAWFOFGEyeSuUskdMWgSWcsQnycoYNgUowXliZnPaEknpRjMZqheRhuYHSeCXDgcuBFhRujVphWyYOZsTjPWWCtsItTiRGaEOnuYRtlwjTAtNbDQZgkVfEPuqdvDAVSSIaUbTHprFHl",
		@"rWOkCfWDSUSwYa": @"BVLLaYfAwTNSLLcTrspqnjEoqkVRTbTEriiQiJZtqURQvHwWFqGqjERHfdjhZxrXSwoympSeGUKMlkOjdIQfxvDPQvyxxtPQJKouKNOK",
		@"yscfZQajJMUSo": @"sGZORVBELPAkgNadGaGxLiNqfoXlQkAuOKjOTlvtKiaMNprXFEPdDWWdYPCkbgnKonZsVjLPmLLBoJSRUsVLVXqvkKXNXliRrjMivjZUqjvSjJnijvFWrrzJVRCRkqdvzPLICSnDHBmfSYdLvk",
		@"UiRFFaQCdqhx": @"DejprHlRzfwlkezlwgQclrkCybBYfDaaoIAMrVxFogNRbEVexAOHLHBXQCcHoCgodZqgXOYChfQkrpzXAKFZipKtPjiPieAeHLvKeObyKmUaO",
		@"BJNfbNdKWgSPeimAAOl": @"sjMnIiDMIMreHxvQCFOltdCqlUBGnyjttJPSbqMVtIFoiyLkwmmZjIgoOtGWWYjpiDrXIzoEQmMdbLQxcTBmIpxAwhnGzDrDsNCOaZuIIvFIvKGsilMGCowqQcHl",
		@"lcHSwKWAxOU": @"WZwhaGmexXwGXbatqrEmjPHDUPrkRInhfeXtIOfaLpCvKuqENyvvUTzvmoABMXqEgMVcPemYtohWUmEhmNPWhjgsKGOqfTozSVjYkDQKrhocVnOoCqXWjdtWb",
		@"huujSrFIRPqCAFxmakB": @"GsiDxlKoohZZDGvDJYWbYycKVJGoyDpPmmSxaDwUCvrxmCWIjXpHiiUKFYHRykdBgMrxmcMvgULnvDFGSIaDtyzQbeFGekIpvATqEcbrLQKBOhobmuMTZxxTvEtFhlE",
		@"qonKsoydbtBAy": @"PeapihcBpZzJGWxWWFXOWIGTrZujwRuVSWYABpiJXQDSuRKaTgDRTLdSmrzqSwvlGIZuXGENeYDxJynsoCVjAMQHCkLSBmutPzEVSwbgAJTqgoXMiwEoIgwvUoZXXKjCqKbXSOMspJOCCeZrJGT",
		@"MTKVmhCerqwMtIjUHRB": @"TlaPEiynrHwjxZBsxocrUaWToHzogFuLwmhhfGwugoTIfEYFXMVpVVbuexJTFFSjbAmrarqBPLAaCKozRrAgnwZUXiYUXHtgwXUWwvwoDtZE",
		@"VtpifoMRiErYWNJbF": @"XwMxqENGUrhEgfMlmZrwkCdTDNUofgZzwWNDUqDBwGHKmtRHqHkbtYAFCQMIAsUoMpsGyVHEKGbdlLoQuMKkkxYqgfnEDKDzWjqJGUosRaUSQLIhmbPmsbbuovYIhqntfhxkXsaroWtbJgg",
		@"PTMCeDElHBhhGuS": @"GyWdXvYpklnGhKnNlEFiYRKfJlMvLSVibsebHECndkzPVGhSiTduCnFxVnKprNGszLoaYmEFFRlaXYPedViKvXnYCBaHiueUQWFhywnMKhwJmPCEBdbKreyBlKN",
		@"bqHHayZZvSogVAQE": @"fvfMMeGwZTvbJBqJrZADijPstoFkGebcLKjlWXHOQMqRPNzeMaodlnuPmxGPGrwaPDdBWHDMTPIdsIndWsRodOYAEOimBoyYHLYrqva",
		@"rrEYqesxiAZxi": @"pbOvXtgCopaWreOgGFagsKCOoedFxtJFrPvZoeSqUlAMEobmrHhbJncVsgtiRQHGlSerzrkBBavCDAUlwScWNTvmdbuiMCtEIHEHhvIjJPvcEvCwOl",
		@"XfktCIsKPaeWmGIVO": @"ADpjjRZwtUhBYUdcVIohssiVYQmxJLJlYRzmPOktHogxHfjIfKcYYUesKxLITMrSnWeQbFcFQDNPVBTkFcXYnZepZYopostHPTAPHOAPuCNrbcZmnmjdAencEvTxaUdOBnQTJKmCpvJnyQeEUMd",
		@"eifrygAzFF": @"CJyIWcmbWutIqAqvIPtAoENwdLGeGIXOhKDZcCGvaGyQZqaWSepFLFaTgYCFDOxCbKlFjaBSJCFOVLxAMSbgmKRQusicwKlQdwxlLKzysA",
	};
	return ysgmoxWMyCJTwbBPlyT;
}

- (nonnull NSString *)WvMyiHvCfUvS :(nonnull NSString *)RUbdhWbBVggXLTBnfT {
	NSString *pHHexVaRtbpdzYtde = @"CbaDIUcyCnfdvSogexaFXTCZfjLOmucVRdJMOuYBAxFwSIghTMyEdjINGciFaZPFDgIphcicGyMbHGmjMCwrvypEKHoVCGwuKmOWMqlqZaWHWd";
	return pHHexVaRtbpdzYtde;
}

+ (nonnull NSArray *)LwOAwDBOOjuXAYQ :(nonnull UIImage *)dUpUZvuFvIP {
	NSArray *AUNGvhmDdr = @[
		@"DSMfmoCubcKGGrSdaSUZYQjgnaSdoTzgaoOBMKPBoOSRZSIDusbfzpWenBUwxiwURcjFpSWjNiFCEsvQBitdPCdEPPiAICkcBdIovtDwFWsMYtNdj",
		@"gXAApfAnkghYfLATNTwXhzDjJqlQYmKaHFkbDSJBHhbfBUeqtUxdJkTZdnDLQdLOqBQnLLnUztybYbNyfnSMEiNFePoIwwTYQyHBLiWUekqndlSDDhFhhRuyOCHREnvCxuKbHaWLhD",
		@"qpkujTprzHEdexhWwvhcPjAXllSAiunMDmILjpZcTVGIrfdslKRueziTQJKjKsjXrATFHkLtWguQaskiKHtPMPDgBMJyBFshfBTMrJVeCinMTYNBrihEhaeyVDTtJYwSmMPCpcmsjeOI",
		@"toNjWuiAByezdxcuJSKrICLWoMLHgYXziOkhiOXxHDNoKDBVTHxvzDDuvhjMUVopsEWsnLDwAfGUxdiahnQTaxVHglnzVsgbxkrEQElGHmejP",
		@"eCikrzluIZUlbotPoaBdkqooMJHaGTyfyXGFoYaXxPYVHKZzAeXEcKkMKTIAqsjbGFMvUgJKRhaxvkyYPgBPxNfvluhXSjUznRGZNyaEigwoCYjwQZebreoazpHDzFSiEeGYrLpPTLXDKByH",
		@"YHJPNemcuWWcJNLyitSRrsdYsrNSuxPHBdSiuUlnGfDTIqhKMCmqJagsurYycWpsLgqRjWatXJkjdFKLGGDIyCCOPxiJUQPWIRAmpZCLjdVvcBKZLKxgguBxbzuxN",
		@"yIQLxSSOZWzTyaZajWGynKwYVjgwbrQRcZiQMdfMLIevBWsBBbNeotanApQZFISESFLKgxQGcszJMsRIGHoxJXryQwDiRPdcwZXPYzGkkJhGw",
		@"plXfsnKBqyUdBySLKcGBfCCADPjkWJGMTvdINaKQLtoEIznWVZhvNsdVjiEpRYDEQlTSeGpheNPvCVQSjpPsmVEDPQrtrsFTWdBgGZTBfkGtSbgBzRawNOelURsrgMaespQFxPuDBHPa",
		@"mnKcQEWJkCgeLOpVvCYWlZfoCNGTIqDkoVtqLhlNEnqPqEgmLxAztezQOohvjQUasYnAWlgsYlnhnncFKZcTseWBPoOwPeJaebrvXfYLisAkdtffLPRDQrA",
		@"MXKOiVbnVpkJbKFyPbXLsVwyxWQycLTZxqADWnbYefqJAdWfPUnVcaUeYiljZccPBjKTGpUHTBenJcQMSrhhDQXmKYSoeCCSWrpCQpmwAEbiXaqKKqoOwBunSrh",
		@"jKAYxMBpXZrPoxwzNoVOYVpLFEVMDXQBYkNZfrnXwlENjxUJQYdHbaHRRqrzTkBABZGaDLyOUWcLlhIfKYQXZngxRzoFOyXUiNlXlpjOHExUDYqqZHUIEJVt",
		@"giTbEviTZGSlbgwAtkZwiZYUBVBgOIdNubogDeQOMEJzUsFFoCorAZvYRpnPErVVenVJhsZGtcXkzcbgJvXRlcUQMKDrJWXqyiGgIOJlYpUOIeQnhOSeEEKNqiiYVbEiKrhoznZhCJDDlij",
		@"GjnjrUUZzuZBTxmGUmTOUZsDJtzKQHVFVjdkgkrdAFdMiOdrklVVmpopCXQLgQbmuTRFMDATVmpNhTEUSHVASQmlgObejnjXlBPdvcQiOiEkIa",
		@"JNlHrPwXRauEgRVjqWlTHGJIspBzoWMqgPHNgxpNclzmTLFjNNzBoIDWrDKJLQtshGyZwdSzHlAqZQBMORlVwPHyLhRCzCASZFqcnQJhVhJBeKWOrWpcHiuPZDKIc",
		@"DQHaKPMXasqXctrsiXNaWMXwsVpYvTMdAkjYixuJVKXjxWAjBKsnyIqZscSSJcjHcPvntQCkqqkvfPGfuNMtqvinSHIizipqdtrONuqajZNnsxsFTnaYHgEdlIjphAsXMnpwJJTcJ",
		@"yntswMWgKkoclIaxdbxzHrfEtPBRyabxnSyZfplnQrVshbLPIxXhNhpXHbvshazbGhBbxtYQJuSXKaicZEWxKFXIoyFHHhNHzcHgEFosWyGafnNjfxFsGSGmiwnkymDkQ",
		@"sCndniinYNQuIFAGDxyTVHUqXOHMlfQpJPkAaLQrzgehzvvXPCeGLrRuMnpoLIdgFifqxqPLfWDHvCnorEdqzYwCVEZrgQTHVJYgm",
		@"BNrXaAkSIUldvjWCasHiDsTqRPNgoLfABfyENIFzQlgPkzcukSoeEtsQJuaWztIqSkYxTLimMvEXmcgAgWyGsuhtDSSyOiTabEySPYvjRlcHQZZT",
		@"fPeIBIcrestJcxcPkjZPzrAmxOIKAiqEbfKuMvQNCFTyihkrrabIHMkFncdoieckArYwMQgNfeFFzoNnLcObeOtjnOqGnjWTiotVrmKziqIjRiRjedvlP",
	];
	return AUNGvhmDdr;
}

- (nonnull NSData *)QlEucoEbgxayZtp :(nonnull NSArray *)UaQyEcLjLOlGnOqA :(nonnull UIImage *)iUVnwBiBVmFPYQiEuVy :(nonnull NSData *)IULZgwheXwxFn {
	NSData *tmfaEjAMzKfBWLkD = [@"SaOCenLGMdhmqHzGbIxYybHLPfBgHeyEQyMxLZOiBhfmJZgsFLsyxVnMjGBSGYuiYAjWvHuMloZsGNQfcmBSfBPDFuICBvlyXQThZkTrHbfWuNB" dataUsingEncoding:NSUTF8StringEncoding];
	return tmfaEjAMzKfBWLkD;
}

- (nonnull NSDictionary *)HcZwHCIPaRh :(nonnull NSDictionary *)bhISPgPgAQx {
	NSDictionary *DPyGeLpPuZcntpHvuFO = @{
		@"BsCjNJabosMPBAZ": @"fKFtlYOKQdpdXJRXHdRCgEVXPNjMeEmHwsmUZoLmROOTgBsqHvQDQuGINtOhYNtPgiUQtAyHUuKbTbKxSjvtHyyAacWouYzcDUiYPGGHzsZdvXYIoXptPsStvIWcBbcBtUnpaJjcqwRuMUKMQ",
		@"yLtEVDCWOQeX": @"voxQCQOlplROxqWtimPChMkNvYDyArqbTEqcqiBuQcEJPMtKkhMxjWtkDjnlQppBMJeqVpszSdxdieXMbKvBuhgVBvsLkHutkOvOSTwzyBcdhWIjnWFbTtLkuoD",
		@"XBQiYFAAFdlt": @"kRHTdApRHUJjEabeJxfAHIqohHaRsFtuoNEYaFHFFaNAiwpCUPcgxQlxkcstqumbnEpCCYAWfBYLCgdAgdpDHXicBxXAvDEljuniEuYzbEuIgPlWZPHphtNZUCxGzBDytXNzpTHBT",
		@"tXEAhhcahsXQ": @"TYMMbkKoZXOfYjvqVduvJIVcRgZoyAEqaqFwsrmwzcerfAoJmyUKolsBNkpQAPEnnPQugdGnrGybchZhxBKWtTFIrycmtEwdGJxAsPAIQFZfywlekGnwKTq",
		@"nFMxTOlHHUeYZEQMDcp": @"DfLcsuSGSXaIwEUkZRFdJJcoGElmecmKFSypEIpaMiACmaQTPBavEjvDsJfkkRFNfjSHrFnZNuyGYkizvtcXIFhYgoTqHwXxaipCIGFzWOCKhsjOrTqZZRuDTZfSusaMiqvAloat",
		@"ybzRRgJzcRYK": @"UEsTVGkVDyDdaRZSeBTsrNLyMacCWWgALpzCwYAsEGxohafszZrtcBebXcDcECnjXhsirZsdfPXkeEJyXEAFywcBpFTlWGNNPqUXgBnSeEM",
		@"BlHKAJxglZRbqdT": @"ZTpWUhdoVcUZAhSoILTPWmYaFWZoiiLfYkiqSUIAGQitUMJABOhJovEPABUbrdrvNsFKSxcZnDuhcdMcaxEoNHimTMiNtTWFTHxSsipRiJbRUbWwUkIOOBXMISPeylsE",
		@"VXOcQetOwpAAghAj": @"MPjpEaLRSSrjcHeWzAdCvmJYLXYZZWPZrKPkSqGXXQueaXIVqGRRvErmiexnaszHLtxmPTWMKRljUzOpwUFBrZiddNrOioxVUoYmVoErsUryLSBqXooXwwuNIIQiUpiAqlFmLaCmaFCwauo",
		@"THGZowZMLFGxMVcQQR": @"ewCoNGQchCpWpKQWvOWmmnqEihnbEXimgiCBNdMmUOkZJSPiTKxkfPLjVSiXhlSdZzsHjDQCWyMZxLlBTVWFNZaFlkWVtvaspbuSobtk",
		@"ellWAOzCYYVXOEKIcU": @"NmuKkTFfUGxFdhZckFuXSRvolWXqCiLQOoBQxTUMLoLpUUeLoBuSjzBptWykGAeJOCtHgjrcXYoXHHRlteTGcWAmQUxhHeWQlZsPoAtb",
		@"KqyWKczaiZnIgM": @"mMKMUKHBEecyyzIZdDkniMFaGyebYcbjveIQSjWwrSiqyUcoYBHWxKchEWqkVJrBKVdXCHYcOMWzIBWEkRGtcTYuuTsGEqrogYjPUseDiAbfcvOvhvPWsdDGCckKIcAcUVlNmJguwTXiKEA",
		@"HORoMSnUYmBeZEjHPi": @"xRSlRZhgYhgPbqbrOGYSUXxhpDDKHpygZpveBBDyohYjwsIwlwxbnhCJAZnomBbNgkBhaVtyPXEnuUZDNRdyvIOmRZxnbChPyfVggkxFHZlmjEyLdCWCCcP",
		@"DAaDQymwaGJlHMpixO": @"gcDrhUuWsnNwHGdjXdZDuRnMQGGGeGnGKTdzHvAraDUVnejxecmwGXfQFgANdAKtQTRnTmAzXlsLSCtvJBvpvHJFEfvhXuSDFLSmbawJmBBMJEwizGBpxGhmDSeQzM",
		@"VcPqtElkPufJpHGBeM": @"cBjRabrvPiCbzASRDxxEhggmKfJdbsbZZlUlmQrHKljrIrUKNQeCDdCVOmzogdJudJAKRNMueMAvVGrpuknMkuImFvtyUnIeWJvRLDNXwMngUXxqiZJy",
		@"QoQyVrCYPQcr": @"jirXwnYvyZhjfuBqPwgmzlSUDpBPbJPHRtSbPGamHqOFAgwrFANBeTvdymHUUKqJvTJgTvKWpXNTLOUFqrTUBSwUjMBzIxQavGSkxuqoxDGIQSUXgTwcfDo",
	};
	return DPyGeLpPuZcntpHvuFO;
}

- (nonnull UIImage *)zHihaQHRXSlRwzZOAq :(nonnull NSDictionary *)fUDaucbLoBOMMZvX :(nonnull NSDictionary *)VHcJvykpTPcnk :(nonnull NSString *)yFEBBUWOgmQWyB {
	NSData *OpKjmImkkezztq = [@"tsDHljexVlwoLbbYALWwKRWFSlGRPcSqqfAEzGpHsUBBLlqkHcBUZQDaMrEOMnGJsYOfOXqOvQCzTbjBKtdpFCggcUldFAdVJcCuF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mNmYSXHbRwoXl = [UIImage imageWithData:OpKjmImkkezztq];
	mNmYSXHbRwoXl = [UIImage imageNamed:@"hMNEtyvuUmNcpkPqysafzkKxrGwOxXXXSqtZgZAdRNZfUcDqrKSGAUOKZZqLezlEValWBmyycxSYtJoqTpGSWxgiEpbRtfnsCbuEhneWJqnPcXQy"];
	return mNmYSXHbRwoXl;
}

- (nonnull NSArray *)cseLEiCWtB :(nonnull NSData *)yallABtYVIZcHwY :(nonnull NSData *)QiytZNgLTyRX {
	NSArray *mbgUzncCXHrZ = @[
		@"ZNHVVwUEpgvDFrxVTrTDMVSNwtSAgBNdiKbQZVbHxXomtSKtPWiEzUeDaAHQOKAyxVNdAzGKtUfLSVTNubCBNjJIDSGrnHqbpSxnxxREgJGbFUnfdVmVVZuqkVrmxBtyYN",
		@"RmMXEjWwuVXpuVllZaiJvSzURtsFzKfggyXOuPkptCyCgleYRGvroVagJvEaEZtYEAboHxwXrPiHSTnnwuabihYeOENEAuDlrHqwCFeLUIHPOjnpzvDWE",
		@"SOzHIomPgDSdelRtPqyuUvlizIGIgptpmGLCGqxGElOyIlVvOIQNKRVmMXcTUCKlHVSySsYuEuzRFmSxCGAMwjszEOIvldQItvwdXxa",
		@"sTQUvjlOUNrLvpmGVILeERoRBrJkIwISeYEKaqyvynwImhLbubJPyZGRoIfzflhrwPZZXeRVmKjFmuXhHFcmWddzFsYpacgoODyb",
		@"IoRxjCGkyUSOSdYxmgLaqSnMgrmMRNcahGbEemNwVHzexjGcoQaTthpxDxvtVjnxYxsbrbgYoGoXzeEqBFAPEGhtswLQtcgzUVBbaReyaiQrJMFAEZglAbzuTqPcxwcJAQbbGzjYysBDvP",
		@"KwLxpoHjLUhnCQzEHAkmeSbdirWMNcHTLjxIVxcSzNarQTUoVYLRWveiEuFYyqOyDMDyAMSPgjzzpoGLrlkgpIiButMpdreHgJTSBWrUoDPulwXJsyLmZDSyccEaZiPCWNxhjVpsnXkXBpCQqB",
		@"HFuikbXcBcwaFicwVyMhVXXKUitdBrIkInEYZNZWZWfPItRgCqDkQfspjlUHgHBqwJEoLvpmZhGucqOxvNSWJpDMKHaafljaELTIAnhstSRWFLXasOrljcLZBHcOEzVSlRSjqlfQRKASNoUeLI",
		@"kzvtyfbWlExZcFpdfOKmwPwwEbOVGeGaNtocioHZlkAtWyuhGDWoKnIoigwQWpUYcrFATxPajlekzhkViApQhSPaJZJjYQCUHMDhT",
		@"caNNHoqWcSAHFnZclohVnLbYhwqVWUIIYTMvYpGbuqDRaEuMmCRejtEEyKHusuhbCPQMaHeGJAvJODZqsWlnNiyOYMpDLZYkCTnkmmyguUflLhWzqFLhJkwQrpLkAdlqE",
		@"jmbcZVLGDVjHCAEARYZpYUPlthJmEhYfarJTnlZVPCOArpidhNVeoDGaiwhvnYaACYqViQWQxTutYAkTbDGiyANVcLtyXyoUxkeBahD",
		@"DCtycypnGHYTyFidhSElXQaWmwVEMZhcTquXrzaMAClqNSSaSwvXRdoQXDYENDalLvLyYAyovQizffGBzEWtbETglaMpIfAXhQkXfzlsGBspukMmsKnnBo",
		@"zAgvPLXynmybXbSUwRyySelOxAtcxIZKnyisBtYdeKFvbbMLMwKfXucNtmZEQawisQKRgiLFuPAbKReZWKqeBGdYahulzkmctsIEIVXdUilxWQvkRDxapOoJCYMSNvKOPkkiUeiVllTKMdnH",
		@"SjIeDBftDxOJPaUxKdOGkffHoJHLVGAxlHsIBXpzOwwpUIGvCClKfMmZyovouzZIqIqHHZeLrMmksGAUvHOrdXaKQRxgLvwlSNLmdrOytvJrYuayuxbLlyIabFbTPbFVPRhDVZeStNFTjclvz",
		@"cvmfpOsiNdEosFsUgYQYnFlZEWAjfTGrchcDggkovAwskTXpPDbVHcEsttzPTDiulgWXRWSeBaFbgxhtaVPGjzQvOyfbcLXWDKCqymWlltHpZKxPlBzivdXnHiMirJaEoNfZyBnWyVNaPVW",
		@"RfDkBmGwdaSHvsxIODqhgFbqWOyjyHuXkxeqvTqAcBzjhzvkEUxksCmlyZjBUhcvRdhWvuPkedshTKWfBATqChiQztPhRGeyWWDXtvdCOIOEJiYDikWZogSVaioHKkQeGMvTdQBp",
		@"XmOjzgAXqmerPPMgnkrWYjaRhOsappiKHjDVLJPFgjCKeRjvzjmbIQPXoGvrUppurnTPWqiqqCOVPwaUFnNqfysWDVaRfMKZftrEuEQbxvneDogLtqbpnkDvDbFeFMOjJjTiWjnLseZCRJEh",
		@"LpWEOaZcGGBGcpvncSLURYDfNJQFgYEwzHDZsudgZYJSemJjBUNBtyECtduBTUirElbiDKqgxvJGfuzfMZtDCRGxaKiOhypvzezXENcfAxKXGscKFWuQNOtjMUcKuXb",
	];
	return mbgUzncCXHrZ;
}

- (nonnull NSDictionary *)DPvKpNEAYBbIcovR :(nonnull NSDictionary *)nMmpWjdXbAmH :(nonnull UIImage *)gFEmHeDBfTZKTK {
	NSDictionary *bdNUilltpOWp = @{
		@"yIbodmxzIBZ": @"nCaVBFSMfwlPYaNNSFCxTGVjfVdJusmCsfyUsFaoQJhDOqiABRgDjHeMvnbOFmdRfQqdkUSNnhDQSKnrInESyBZsxCECFEEGPjjLACidQctJhstDYSeuwNCqUejZ",
		@"felcoPBgXeWofMCg": @"tWgOdusiJlpepTwiBPfcznShGpwjZHYrYNFcZoSfiUvcbtAZYXiowekiqbBsInFhIyuNYAiKZwxLVkXnuTCiGAxouzjkVMtAJoCfLdLRuowEVMMnAhGRmTXa",
		@"jvhAirwtjvVrzcDKJ": @"dRevxqfQMslAMHfGKMxByxXZHlvNVrYJwwHNFPEoBfwSefnsiLcBHoJVKFiXpAUrVhwXwQnwFilQLtTHaLPtTpMkDaIixUDUxceUMbq",
		@"vIbdawvDzNdMNojXcEd": @"sLyUsFfybfFYXvOELlRDoJFeWvJllBcOmJLxInLUjLhRKgsbIgSxcfgJRoAQzehQRrAnbFUptuuBLxSmeHvbGrdiiNnjAnaOOwsiqQosQILNw",
		@"dhjGjDaFUcTa": @"hcVtSFsQVKULFpFLUlVdaUJzKZAMpCAlMiMjLsKHkudEaEnKnTNMielgyiikRKtqaocNWlSnBjpfPFYkrGNYVEubxCkFWHeFHsQrN",
		@"kGTifpKaLlXUepGPup": @"NRbwYVcumgxwzSuBBLHGiTNkDqzYBvaIzMtUOljRHxIJUVekkxTTaWmsNvMMjUTUHDQLkPbppUSuCbuNneZtgIdpflXlRRtLdMmtsscfzmVeXbpIBinaYUgCNVZ",
		@"QxgDmIdIaBgVgSbtfU": @"jKpCCREPgbwQNJksgdCtMtjIrVefNFqRLlBtnwPTZiaohzTxFCGMwNeGrJMDoGsABuWfmPQnXOkGOOUuMFXYeyyfxzoCfXqdQGWsdHC",
		@"dpsDblqtJsFBNChxmez": @"RZjGHqFsZUGykUMgWxgRpSYniAMjRfIcGrFKDZmbuUvqTQiJTsWvzvAvTkGCsIEskmHOTbkDETcloHqfOhmzxCcLjNRAIUOqwbUPWTYPstawJMVqrafciNtQn",
		@"eFSJGJrAsntoqdL": @"GjBcEjVmtTgxtfwCrGNufOfOujtgatWSUckYTPawpBxOAobeTqJVPSfTIazqHSMwvuJFSQEIRLrrIMeePIlmKXjOpTsNgwhSfdrOTxZRNb",
		@"xXQatZeKrI": @"PsvkcKuAXCYcGxSllEPqerhxkbCAxHRDmhMfSsKgbIVeGfYEdkgXRHWZfQrhvmMOxBQkXGYmloYnMcwFdwRGYkCCrViQQFiQSYXavwDbtdWvizQXjQcfWcMcZaCFYxBbnAFTzZLSJeYFVxs",
		@"XmWVLjfUUT": @"LfIcbdhzoXCccWxmoQGoAMmfWHVEOhcyXQMKswxBpBqFNKBQxpQbWTQIlyAwDFUAJnFMDyQjLnwjoMjWkNpqmyWlYlRMkFacdHfdWUHjmAlWg",
		@"OIxYUBJrucy": @"mrFOWQqSlaLgagdkYjrINrFMvgdcKtrdbILUEqxJylPShuEgYZzXFSYCReycmzORiSaXdPUbICSTWXwheQTZXvPTMGpxBJOehicGxMpRysxSPyViWCRGeUpficNkhYaESMaIfExQXJAJfqDfNntB",
		@"aXgTPkQHZeEmHTCR": @"QWiwPGPNWApGhAeZLrXeAgPVNkGtvgGBxaTXhBXbOzvShEELFhulmmHVDqXRUNQpiaRvaiOLdilzwXczThXFrMyFfFrdFTaWRLvIEvzeDttxSBlYdJebYvQIpdlOmN",
		@"ZqdhFrnpuXSl": @"YmuDAImUXHPSGIqtkakskHErMOBwLCSqHllwGygxVFEANVlQuZiXPNrPaFJiuNaMLNTnqxGZDJkeBACKQxlQiLsIgXCIFJIhPlcoWybOXTSvakTQBGZBgwQTRsZkmoQzmIo",
		@"fNBHwVKPzdlkf": @"djMKPslDtNLkZTgBocHQinzVKJVZiVXbDxvkcfmCmKmImWiKljsRcEXGzSEMxdmRXAnMYAIoOqpTyxRGHcGGSAHuBMbFVOXurNEVuSXfZZBikqlbEcLPtWiOTMPzmi",
		@"kcVqxpKyFiOV": @"DVyCEVymwGiOnboYEspaRINIaKOhoaFLFOqasDOcXcMbTNPBIcWSvLQVNWmqKrNpwNmTAndikYPZDQPPYyEncrNQzTYhhIoPOoGWMFocnQAAlIqidVjFWguSZI",
		@"beTHWZxpzeLgimXMoUC": @"FdrGeilaBlvBEbFRVxKJvaIukdDQQjdWqsQKUgvANVnOkVFrcpdjNHnBKuOozyLbpKuoSJDdWXeTxFKgcUMofjGhZODykxfCyyBHeoXPlFoxramIHitnBCGrbFPdMv",
		@"qRGDStAEkCKCiuH": @"HwKvcRlBMgWhcRVTWfKRudtRgzOzUamQUpPLkpkRiwbQMDRtKgPflAXDGuxRNLYGcdAsvzncfuFYWWqMecdBZgDAbSkbVehqvIORHCbjbGejsirCtFYwDkWQRnporjtXPwQb",
	};
	return bdNUilltpOWp;
}

- (nonnull NSData *)AwrbMdRuCsEJPWLAoh :(nonnull NSArray *)uVnCJZmHue :(nonnull NSData *)JqeiZKWCEL {
	NSData *rchLUATqnVvL = [@"SivXuQpwKWFcwkGClxlGcnaIxouQyqIthCCUJqEceAhxeTwEbxjlFsAFcrxgACAsjmHLbSyBEAbNOFMXAkqGEdObFmeKtUbYhjhuUDSkULMjXvAlkVTyoRsIZfNfc" dataUsingEncoding:NSUTF8StringEncoding];
	return rchLUATqnVvL;
}

+ (nonnull UIImage *)ZRDHgaIuamt :(nonnull UIImage *)xOzqspOKCmZhMSe :(nonnull NSArray *)NvcfvCZsymVyyTlHP :(nonnull NSData *)fgTDMuoPCS {
	NSData *IrsEMvEPjDq = [@"HLaMvDmWtmzRGkLunWbPMGsFoTVFquSjZrRynITWYhEyQHGGgsSFvqvAGxCKcwVFTSvZcfSySkXmYpsvOrQgkulzgBNTkTplhqpJaFFXifARKhNUeLkUMxLlSjdpKOCfuArbZyfyioDzYazn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZpghqvVclCX = [UIImage imageWithData:IrsEMvEPjDq];
	ZpghqvVclCX = [UIImage imageNamed:@"YKCbPUgzKobnPlYkgGtbnPYXsLgPdyoHvtiseQjfQViSmfKcMJnwFmJXILMRJkatUtNXbKVWrgOgPPkEWsdWYNmwDbSqDdltDPiyAohTMuXEWoZrf"];
	return ZpghqvVclCX;
}

+ (nonnull NSString *)tJdzKVeqCuxmhWHtYlF :(nonnull NSArray *)HcmxucfFrdsQv :(nonnull UIImage *)eiIXnzTKXqFCngQAX :(nonnull UIImage *)qUsxGnEyUryB {
	NSString *tflPpiyVyenQneNZcyf = @"SWodxIbSMwzbZKwQiOmcCjKbTTirzlspiCMcyMpeubKewISeLJOVVCYtvzvAnCkQPwgqFFrbpzJSnzlbTUGItbaatmLWEOYixCmvYDoRdjpah";
	return tflPpiyVyenQneNZcyf;
}

- (nonnull NSString *)NZlsbDELIHbfnO :(nonnull UIImage *)BWVXenejEmPUOHO {
	NSString *qMCnotgcNLpyEic = @"JFttOTDJQAdSywWHqscSjsPAOzrtWBufLInsHzXpXdwUMpnVziXwBQkXUqudRSsrTRyVcbbcTrSSbHaBBFjTQWezztBKNxXyFlvqxpYtyHeVwCowGwMuQDlujfHYcMrYAyNQnLagBNpGSb";
	return qMCnotgcNLpyEic;
}

- (nonnull NSString *)dVFOtitylpE :(nonnull NSArray *)pEMuUHNDDl :(nonnull NSString *)VhECPLJhGyud :(nonnull NSData *)eTaTQscmKTsPGJnXF {
	NSString *bqIrkOfkazSnFeyheF = @"UmxZyesGNnIfwkSgGqbZUUBgOjqIQpYPItXbirBXLPEfMtsZuyFkqZmXopDtLTnivAmXsEwwEkObikpYzCNAdMhVHVujrwJCDOsg";
	return bqIrkOfkazSnFeyheF;
}

+ (nonnull NSDictionary *)kyeNpOvywd :(nonnull NSData *)XTxgPYaPpCVzZXqqez :(nonnull UIImage *)ZoOvCeSfuV {
	NSDictionary *RbCWTSyVcGv = @{
		@"UVrEjYUzribM": @"yfCCukaUaWiMyDNgLsPjCwttlliZLbWlZgYJPwhiuGWIpOhdKxqNjbTIKFvXodqBMjlSoTghTATdvTsIDqiOiavALuZSJYsAlODTzPW",
		@"HcVUpBSwyOzbaikdqfe": @"mxVnnkDwUmmcHfKUlMdgXqGafIrqrGLvkbvtMIRxebuWqtPcPUxFxevUkqIMRmoikJBOCdDnPFmhXjAggPWTGWMnlQkghBtoolRFgmWFalhgGXpliuGTBGQYnQUtCKytTPxjYVluVuxRuzlpA",
		@"BJnaFOGGEPryYIPuv": @"lkDaewclZaSEMDBoLLoRsVDNHkqrlXeMZUWqkrvBYdOqtsAEYwaXaVqztVrXQsTWMxGoUVamXkCwwGqxVgEHnQedxSLmNwdAqPjuVctkBMVgIHtxwktRnhWPWZDuOeKCosPYixCUyM",
		@"bjWqriwKJnkc": @"sMuowtmDKOQwrUVNYrsUVIbVAHxDUmgheEwkGlFpYLvWgqCvxFDsdOhZYadUWJVpYznvELuFLFkcCDEhuGgpLLASIzfndjOKNsalbAPFsexNsjLOwfwzjucFOHtUHampLuKFSRjffKjflwsrVW",
		@"mtwJrCsbaOMhl": @"aDVWkOMATZEwWgBOJfhogmlrKqEuucNjjRevjFtvupuEtUmMBwEriyvoyhrgcLIbByeftIJHKpcJRDWpMkPHbqtIgTSuCUpTjkJXunlVtbyzppyXAttdL",
		@"unFsEHADSQjnfTtzGaw": @"paWidVWqhWINIvNRDCBEWBBrokELpKpALUdJItBmYGYbAKWdxPDJmlOqjEEawpbQEzJNefValXEgFQwPHOxFkZBKRHPGfQRvzGLmj",
		@"YNCgrQFcFP": @"aPbrsYvkDXgLgKtZuyCqwWvwtEOQdXAsngrfjIdDuuRMLgzpdFDvMFmtKpkBaPoAOavBEWfnjyPLZfXuRxbseIXpmqUeezHawSiSUxkIolYoAndvcxleOzjGiEr",
		@"uhNXZtwnvqul": @"sBPQgBHOHSEHwNPAIuJBifrDHQGPRvitPBgjNjAFjbKiiacBKKHhHlgCkQvwzQyzmlhjXawQAHDzBrmOxQDTQPfQeWmsMwOeAvaTyijJynqvkoreAIPidODdDpZOuA",
		@"qlUfIKRwLkMmYRLSiUD": @"xncLVZymxnlduMyPCmAZsalcdGPXSFXTKCkjefTYaUzxSYmRAPGzJlXCULSqPZCnEecwypxSXlOutwPqRCrNJUsjvxGceyhVBeceBXJQpoYtkdTEnevZwxyWJmwSxDdKtkSYSsQaJEvDlU",
		@"deKycrUDVaTQh": @"pmLIDTYNMLpmMsxpFYgYSxfJRZCdiVwWCZUrSlnkuuwAZWxEXeWexJYdeSOLxHvGAKDjDXhvThMvLVYdILkXVYPwRgDDjbDrfmOBRrtRcQljGbANI",
		@"VBwocgCaOosidqAnBxY": @"QBpoltObsCxDxnBedUgyLcvZkOloXSyTCKuBGSUBqgumiiEpVuqqIsfvVaELGRmhaZbNqoGQAZxFMloCpKfcoYiLCABJppYzwDdSw",
		@"BXfPBnwyzrVgwwhzrXI": @"LOpgMCSGsogxjTbiQFCoMoTlMynoLkfdotQkCuOqjZgsYTqUbyKLqNaiLOLwKJOdJxGJaVLzUpAiwrQDHIABRhcBcLjTtanKXJJDFWUPJpNlZZQBHUOxdqxDTCAphteKBVYYJ",
		@"ViuwJsZNUMcaUPT": @"UotqINFtAKQdtpaPdOMPtDxXkiWahPWROXpVxvajvhfdbjlUbamgRjWJHlHxfobGIAlvbrqOFKUuFgzLejbLxLfwAnlHGPMlFpIFYonWwzalfkVbXnkJuffYwMVHfDTtTIrudjObruV",
		@"lMlFazOdZlgIxAct": @"ttHCRkBqfMQveboBhauRFTAzUGLaXkbRyXfrjryyKMUPIdujHsZvoYtYfOKLtFDXJuBDwdFhnhWUtlNpPTTwVbVgaNcGIiQfsDtBil",
	};
	return RbCWTSyVcGv;
}

+ (nonnull NSData *)XcDDubNKEHsG :(nonnull NSArray *)VjGOeGlmKMKw :(nonnull NSData *)BrQqDMXOSzFFaJWadU {
	NSData *lvWVQRhlDsFAsZhkG = [@"HjBVcwMUscuUZulJfmCWPeLlPtEqweoEkbSDKJJBUDujfozyxSUewlQHICdLLrgkaKBHuBoXqgEqmEJUVvXJHaAQHNwdBKhcrVUBXMFmeLNLFCXzSOJgZtZBAmoELYCrIrCoN" dataUsingEncoding:NSUTF8StringEncoding];
	return lvWVQRhlDsFAsZhkG;
}

+ (nonnull NSString *)BDznHxSOumAIpmtYBH :(nonnull NSData *)tBKamkpOCBs :(nonnull NSData *)WOKpdlszieRHJoACoB :(nonnull NSString *)WChiCcSwoICd {
	NSString *ijzMDBGPfLcBldDA = @"XYSZBtBwutOziCMzwivmeshkjDfXjvIpbzwdszigUcHUFQNpJeOcgUtJCMzMPchwmxKhzwdbGaTymSjCwxZBinBCjfYIcZjsokPAezXzOFjytKs";
	return ijzMDBGPfLcBldDA;
}

+ (nonnull NSArray *)HcBFTyhyJQdxose :(nonnull NSArray *)IiroCckFQmi {
	NSArray *hxstMpNPfAMSQF = @[
		@"MOwcyLpXAchVwqbMLjohFORwmhelGDImVTpXifhWOAeDwXmWxvPgVOGLfMBZKSUFxtLiBHCHPFuislIEktpwdpojrdCtPbKzbcRD",
		@"ECxTKLisNPtmXIkrdZXKrRksMceuNJNpvjlYSkZmktFAJjbTOhPeWwRhFPRcpKKqbGnOLxcICjWvAjbxUxSnwvEKJYqgBxdKAqQFCyFywDZjWoZrqVyMcQMiXmJJPnkDwmsJvX",
		@"VqUNBYqNFsQNQpKBuKhOEhEZdhvxIlMvyWRaXUXnLRSYOAzHAyOalQICbAcAxEkIqugBkceRBfzNXFfLRLaOswRBMdUafxOzbGPqQjDKIxWTKqVYoPAZfmCBQsX",
		@"TJkozBdcDRsqyUzzXJWPzakYjcIYktHdNMyZicGeCqqwLkEYvkeCGPlFhcNgRiXnQdBCRFgCyUCajFImAinCtjutNOewOppvMYuYmWEbWyFOWLjEtabluwOoiRxMKpsJ",
		@"NusRjUBvssQYbLAJCFgLsxYmyPjgpLLjZaYuZBthvBvFcBYlhnXxigNPFfejTYyLVJUpAmuENHguFCXpxjueybPaRbLFEbCeMlyjmPZKJaGlQttlhfgSYgvfIXlrjvlUgWaViPZOHSluPxASreU",
		@"dTxExCPGwdEjNeXAdQagbwKsLaPhEjnHVkeISLOJziDuygMdstvaJYYJWtpuslyzpoXRqYsSzFiSAMPCFnedxaozuqPSHyGHlCzEbtDxvBIEOiJuSPBNjxo",
		@"hskvkjmQtZrTnLQknijmlipSOKSfjcAjJEWcGEISNHUrMmasJXcGLVmmiRYdcvDKKFcjaAKyyclAbVgnoXoUVpstQkIIoRSsxuXrkaFFDdGBLKSVcJiGwaea",
		@"STsEbUCAijymBjFmMmpwYaVfkVIXJcfiJLfJlUDvqUfmZBlmPkjcvwujrXJVnKURZGttchMQwPdhlIkfPqsOHsVoIrCGSBmOUwtXWbWLCeWwN",
		@"NbUmUIXiQLUdAEuApJwPQaEGmbAnwbgUwJhTGxKgAphGXaeUaKfcJZIvrqbRNxoMZvhQntokiCZQLGkrudSCgpSjeTLPQHJYeqkToysySawIEiDSsoiiqOmtNIQKa",
		@"lgTLyeVntuIthyfEnzgRjRGZiTEJHCaAoyOxXpvscphZkZGPzkWYOLvcnYNLSPGzzPPlTbMZBrAocWurGKsLxBffGssmLBukOtLSZbiYRpHsVWTSJOOgkPqnRjo",
		@"QjfJiVCvcTwHcirLvUJoMqocGlfbuEEOVxxBcNqFFAtLIugmlXOerrdTntXnuaGWfyjHjXsXAYCJZzWWEgfXxfbqrIHwEohuPuGAVTbeTwlnnbCzjrGyjVYsJQRECMzHBRUbwYQQtPse",
		@"qxLlBLLsdrQwGZJeAroEQNrKGQeVjnquyFfMaBdFMHfXcoiXhNvYzJeQZyokGTruiOOuizyAOXhWREcKXtlukjjmFPEFUYDcqZeZmJacKZrCBVOpOPjpANfLrgGVLCBPhYObZdBzbdSOC",
		@"NcAlMBdLtFdgXXImFwuGejNRROnNCRZXCURyWwJeAReiLHuuYYLfvdnhQwedVZuQdZcYbuJMxuiHnkbmftkzYfdGfsRvchbGxUBJCSEiFkaHUFDJkrNwEHNKgyXIBgXPcBanFhi",
		@"zxnyrAJApnKZKcVqdUGJYojFucQTAtCQgLZqINpQkwOjLuyVlEmxstyJzFCXjtyvKaqoVfsIdNBMYRnUFejfaVzAWgcYrWSynSebxYQDCebmDnSkoYwXVWTmGT",
		@"FEhIyHxAHleMMxloEnBpuvBdSqmSVWeCgQOICUsnxbXrkBwAfwnJlBEDlXdxdVyxfxXsnGLKrKQgQojuMjYWNDMhVXQGYTfMlfRZxezbKfpJZBzrZFe",
		@"iBMiQRhiTNTwKdAOIQwbDpoAMxgBtGoWWAKreRwpfChfmTHmbzMKRNEPdiPgDvFvsnekOekKBtizhENJrshXngwkcfuBcRhwHqZBDCZEpqQBtvmTxAPmWowydBEGb",
		@"IMtrfBZgJoKjGcIRMrPkodjlctecSeyrhVNLsxXLDYPneRBLuUOLnaxnQmlgfMXgDWMkTUpXizdCxZMfTHIuTlRRISXykcbWGtTaLWrKVYYQzPiAQEGFYyQGgcITWrTY",
		@"qOxGbItAsYUfnHTXNRxBlTVFYYJeWxZMAudsZLjeqBRzIkcnrUacHuetgPSjmarredoCYSYGJHEEdUVVaDWhVVmRxbDYQUruNJdQqLWFreUInowtnmUHdDZvptKcFYkmpGbsVgVofCcuRPsxu",
	];
	return hxstMpNPfAMSQF;
}

+ (nonnull NSArray *)XSBsPkAzAhPvHb :(nonnull NSDictionary *)qHipphtCrExz :(nonnull NSArray *)waWECmIQSjFjyNrBCd :(nonnull UIImage *)LxqHcZtRUdn {
	NSArray *dFzxEBxiwr = @[
		@"PCfnEtUizDJrEOnogwarzsEUuUfNCxKRhcNBhCpbJlBXixbRHbvkIYRiyNvYbbqqXzxpZNugPPcRnCdLsjSaDmZJrBkXFOMBLHSDpsCSAKqhBTE",
		@"OCgqVGzTDbWyVtpHExCgPIoljfatbKyRNIOdSBUdWiOzVXmGDouoRwEjyCoUXmqQkRVhRcABgNZvCeZFyeDglxkFsluyIFCyKbdgQdlLp",
		@"oJpUsgdpRIPRFVtkmFwxQXUAYADTKBdLxuoRLlRUTtWbqNWnFaHfRKQQINiDTFKdWvRcqlSxbmSaYnKyMTbxNNkPrlsqfPzonvfelm",
		@"vuiTOVpGrSNLBENVROiMXAHhLGzMNopWIwnxCGBDigWgxAhJQeuXcSROiEQCWOHqOFNgWYXCubhzxmsPzsfbOGiaVAlbKBUMSYURLHUjRkUoW",
		@"sSGxeZFOFdwmmzhRKwzhZeKgbpEytGxPQlpVADeficNgURMyYXOZcOkpYWykuhMOnZEVwQbaPHpXQKTAotOdFdvOXRfzuPGXHvVBjIUCz",
		@"uQufjmZWtGOoKEDaPjeroGeJatBgQWEHnAkZEZUTuanzzIqnKGsCzFktLIXwsgipvLyJJzuRqdJqfJApBjWImkptMtVKlXEzrrNIuoJt",
		@"obiwjWcXTNkTUzdDAZuOTEpYOYHDgIlfzGHVgpNYsGpaQEBTBSyApCEuAwmghYuUWLkKajXtpEDAxUZGDHGsxuRTmXeWnFaypmDQeCmnYHXnnGYxNnOxmgBYk",
		@"DEiNyvwCLgaekXGijhcMppbCFGNVMLfkasEuoDTSqygpkHtGtGgmjGlhHzUywYhzIVkrJYWpgCcJygynnwWDVyszHeDRCnzuxZQmgMpEJCQRSGdwu",
		@"TAnELIADEnRrPKNZPgUWPCSHMaxsomODRNIptUaMtVxVpUeJTMEaAoDjarFbIXNNjoeOyQbuYvHBAtWcHmdihweJvoOqLawwrvOUCjdLEdQOnhABOWLYTozVSJM",
		@"WfzGxdXvZqqCAyFEcDYzTfJlNMcyimFswpajwPUTsGnmNnaIxqZInVsRIqgqQJLkotPmfxPepsuKIkissJVsGaAWfPxhmLvJByVszUjwRBXCzUybctIPaBSzEMsuxpbJxQ",
	];
	return dFzxEBxiwr;
}

+ (nonnull NSData *)AnQUvPtsXklJH :(nonnull NSString *)ZGnbnbLfLNvjABWX :(nonnull UIImage *)kBmTonbrDurt {
	NSData *GTRVLqfzmSH = [@"TZoMhgwetqTirQglYUFlhwQHaBUchMohihDEsqoNvwdlruThwwcogfuqqoaVgSFnoJshCryJAvqXEyjswffdFQRzbiccrKrwmCwhWqeAPdAsEbNbDUi" dataUsingEncoding:NSUTF8StringEncoding];
	return GTRVLqfzmSH;
}

+ (nonnull NSString *)BcIeXaXLzU :(nonnull UIImage *)rPvyaOnTnmZhaaEMJ :(nonnull NSData *)LliiWtNXsbVRxcT {
	NSString *sFlPSZcmfcyWbZIJ = @"EmSVgWNMElbxTgUMUJXzPFzDOhhITioxYAXgJzauUjzugVTYdURKDlwukdLpEchOXEyOSgGdOgwHLrJRuWiQUotpHrTWOVizcvILPiLxQWElYeTvrMxdYZFwyatz";
	return sFlPSZcmfcyWbZIJ;
}

- (nonnull NSDictionary *)wVeURgLlEngCABllb :(nonnull UIImage *)YBkiRisymztYLWaVNh :(nonnull NSData *)oDUioMeyno {
	NSDictionary *QrSisumpxMPkDki = @{
		@"vVdgWPEDxP": @"mqrulcAlKVFyYQpBkSCaRwqgGKrMoctPVqaVAsNgxjtktYDkVEtmSShaEDGdZbdlBpRdcvhDscRNfbTfmnJDljTDocAjJGhqAaXLXVKKoEtIPKBIUQzIJUlgQiWlutnOiVQqSPFdxFaP",
		@"KgTKSLoRzglItOa": @"TgzoVYRmIegvwkTSPuCXIQjzoeuyZBzqMsVtTSJVhyGxRfcfnCTaKzYAILgWSqZMIAIddQJSMachuJJZtpMjeIlnUXMGVeTninRtFOy",
		@"ncyUItXmoB": @"hjomQhcbZpVQDFOnghGQUBJHPoueTRrQZPeoJtgaMPnyLqAVHlwgBSnbUryjQGbCbLIVZIqrXELgcAaPaFnRpSEHWYlFJwRkzAIvXTupbeNOxsFQlvomFvCwScBZQNTKFCPpIKkDGyIdiDZse",
		@"xnPhptAdjRaKFdekaY": @"aXlJIyPvKhkAdjboSZZioXTDIPsZkVtIuBaObyKEZaPSpxeYSVUbGYmMXAAxqDArEruKHfpooNteSKUnsyKMddjyMnniJlJMIrRFvPiqOnduqRbhvBOIWIXkOxouxdjYpumQcZqSHJMdmNkizq",
		@"PXzJMrgIldz": @"JOgelDwFfFJGgHtVkqKAWrQnQXAhXLRDrdulELGacpJMEEdmScrjNwvbrXwoqWJoBdvqecCrOpitTlatStqyRBsOrrZmylhnEsSwEiNmLfAyNSyBdAxhFhpNNcdDkTjbeGMapsZBmaImEPcHRaMw",
		@"OxROpCnzlUzakxi": @"PtHBbRqIYNoTLCduSciYERmMTjEwdJlQiXzvsqJPrRKgpGjoCMedxoKrNGHbtxPkqStVxYMdXYqLLccCgIggiBZThyLZKeIpFdxZEyroBmpmT",
		@"CZuXBHhaHxoef": @"vaPJSSzawwkZRhVfnPYnqcUogRucvAveqEqhjtQtJxjwlifmQIhKkjOJCsRVOIPibMTTTNcTAmhViZzatOvQTGxvbHXPuWWufNZqJaxNEeoRxgeMxUPAKgaFdkdUuRPinFdvyXyFSOPu",
		@"GvhBuaUxJYLmxfXNT": @"faYnLBihZfNdnXrWyGtcIYxmhVWrrXeAaPLHVETHQXspkcHAsKoHNuZuSQreSPxeyaIxYVHzRZLcEoYhxGMlnBGkyDZHugPyUiiNktDHXbmQzH",
		@"huBvegrugksuyDia": @"sTsEsNfHteFtpGIDViJMrDuSccSbsgrgjSqRcVjlqMoCcZqpegOkCbeWsZlHqapfmUqqsYsvboojwkWjQAxjFhBOMFyyhyqzqgaEXBTDsFqroOTmYEFkThztJkqqMhGeGWgExhAOHlc",
		@"USQvcsBaYmPLaneNASP": @"PGUnOWTbtngodLozROcjbYjbIXnCXbYTCXLMnGglNeCgZrHPgUTOyRNMRRSMfRQOwKKenTFKVxIcccXguZbUHumsTKyyXiPxKzWkcaNLSzumViLGEhUFFZlNCpcMlXluuLDS",
		@"fxISsHAxoK": @"HqwdFEBVpGxYLdHBUSLbcaxKzpYTojQmcVFPlsOqoudnnOvVXzQsnzEsSWUvvusCbWPgWRmiwiAbzdvWATysVaYFszHsOPlFqNdKeqDNHcBUkFUsyNxMCyQFxsAMcpHotZvFRygmqzdwg",
		@"nYjytqfDqxyXHsEJU": @"tfwKwPfScNDxvMBkaaEovebCQzMklmqGCUTXIKJIeXxCGQVPDYSMEUNDBKTEKriYGvImdMTjgogCJcBIhoDDQrzzNalNdvxxEPOZdYGKQuAeVMgCktHMXyjiaASeYXzoWqAlAHgruetAlkNDjUx",
	};
	return QrSisumpxMPkDki;
}

- (nonnull UIImage *)UrCFNUnGKzaAks :(nonnull NSString *)aWzkFQoyUs :(nonnull NSData *)whqXDckkdPvxTXfaEhc :(nonnull NSString *)KzjViXBvODEMVYrgx {
	NSData *BbOHfMKTWUduUQXgsl = [@"MHYNxNiKWbxRMBSytdhXZULNBTSQfxcNOBeBrpPkYEzWkVGUpsaYBRnqCEdQteZDwrGQzLWCQKJZzfnBULkppDuBclGJRguFcXXnzOPNYghCT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XHmpsNbfjmxowBzOtM = [UIImage imageWithData:BbOHfMKTWUduUQXgsl];
	XHmpsNbfjmxowBzOtM = [UIImage imageNamed:@"bzXlWaOPfNNOTGWLMryhYvkDAGWHaFDAsntuRBNqRWRbAGBCCHhXwqywqIraoiydrPjUBXfJMYTQRIwTlQgPcjzBXzBBVJeTcVJFAMQVuBFGrGiOGpCkatfXpLiXcJtZooijfRYGVgeoTe"];
	return XHmpsNbfjmxowBzOtM;
}

- (nonnull NSArray *)EBHKsVivhljt :(nonnull NSString *)xfAtThDyHPuzaAOewW {
	NSArray *gKrFAlKWiFrMUIkxYGF = @[
		@"CKCPaWramqBsqMMHRKsRKAStWBGLcwtipYaQYJGDniBNsbycmPcWdtWiiFTUVCyMejqxJeIXLLjuJjyhnoZLJdkJLKbbxsJOlOhViErfabBzViHXPzTyqjSFKRcnPwAVWYwriAJExdAtVqzXwTfiu",
		@"WktafCGxOWhCWKgEAkotIJTKPhaLPbaKnLeUcScCBFkNCzrUpHOWRasxpTRGVvfBtIhoyxHkhcpXMRZZTLHWLxpAlaQyfYTBQNvAskWKrvlugfZYOnhByEhsStueAOyatOLoZBdrLukIaV",
		@"MtxhXNBadwKzpoClgFMkbnDOwthNnWwMzoyiYgSoyOlehGlqhEkfSEGsaDVIeLjvDvyPGavbhYoYVMWofhtJLgGceuPgIIQUYDpeovfLwwhdsFffi",
		@"WqbAodgCEbScYtVLaJELgMCCKtoNUuNBHAmLtdUgoDFcYhyOBDLvUArjkOlrMIkDbOdIMNbgmwEqGvOMqDrXIlAUhFBEhjSkuyQujddsFjLwPMwWeB",
		@"cYNzaKAEvHKtycRJaLZAZWYukCFHAbCZYhBNXNPJFDCkOhDcTobjuyTSZUdepDbcoMipnKHnBaFnOqyjphOwZaAuBzBSwyjgGqOWNkqDCSygarzCjFqJkzwVnODimwFjWaYBdQdXyMsHa",
		@"hqEkywaBWHNACsOsriokixmiVkTJPDauaMnHpqlwQLanxgKngdLnCkbYiNNfKztAjMcsytigQGBegKgbBlqpuVTnXUbRLcYrTPhclBMDRYSbdbpiENlDHNQiarfKLyZUiymS",
		@"JzewbSRMbFAFYUrVUpDCSoJkbjjOSJdrpVZCXYqOhvIUIMRBIbMsEniQxzkatpelCRPxQEdZHeEOVuYUSdNBrMSIUKvMMFXVryvEkDqMEVnHTjOaRDredMceuuu",
		@"WwpqVRuvncUxDBiOlZotnbmijBlLjTewcvQFirRjceRYXzbNWjBDwyidGuTkWVeCYCWRQynsNbquGotnlPVImNpnMIfaxmHKfxdWMukHhWLbgSxuLVNOgUmFnClTA",
		@"pEgteKQUHxLpXVVAZMDVBvEbkaCnlxbsBxCFVQNlTTzBVAeJGWMbmWULDqSwtVlUEtjkHUDCiQrsEHhNAdVWQrRzJzfFnHYFZWJBNLQGjWIpRaRYAqQkfksmSnakjqPGLqhLXpnBb",
		@"gIgWlkBrLQkEIsJLXyqXoiXkXVJdtRORjGEXGxVdDGodUGRBnyRranXtgfvQNVMgALiMioVFREDcMtuShkRuFVsUiUhaJscSOghKjSttsnKNSQaijMeqrckqUHFrcWraNnjidZFYCHETxaiqm",
		@"RqMdsEaSBuLQgFnMLsNPjKSMuBmCvOiSMxepnYggVewuogFTeMNfyoItRntZWpNDPGursLzfIgOFMgzpXvWxKZthCvtHeAsrmKBrOpxgehHKETwfbCSuuhXoRNDilEnycXRHltKQvIzfToYlQyHDV",
		@"mEKsBmqbftsrcKzFfZFhmZXBkgDRSbMktgztjnUkMhmZfeRfRBhPBpNwuDrjoungGzqSCwxJtHchIUPUDMXPWVHnFFtlVWCkasApgOh",
		@"XXxCrlEJTiyqkYscqQsvFHUOfifGhsAdHAuOkUkXaYgfKlsyaSKShWkdqQLshIUablMXqLTvPuNzNgLASMyTenwQyXmgUkLPolCVDvyOVwUcERWPEgozAsnAusHOUQwUiERqohzaisNNyPWQut",
		@"SeoLcOohIwgiGXfQzveXPBglcKAIHZDfOuGXyNnrEQYPYoEJXHAUIiMQFHMRHmSymETcVcEFevsJDyogoUcGASjRMzMFgpYOamIYsWtueeQAaavQPnSLAKfJSemiKZdLvhzpF",
		@"zzswXWxOXCkxbnvZIRZSuwbponLXYmrBZGzphRNccYiMHCnzQOYmGlKOtzsDuvtJZCcbURbFSjhsdlQfxnjGwrOuNDwfIZcFEVrVXHlnfcweyvnRVXnfQQCquaNlRWc",
		@"jJyuCAqkwpZNLYvFySpbjXgFxwzGYVknoGttbKvcsONvpIFzIwnNXrCUaDBchAmnjNAiFSDLLkbKLFGSCddrbspWdgDeLfwGAYLDYwVPKuKJWAnyTAXHmIJCnKOZskWbfgwtLCXZ",
		@"axZWfKCRfTaIVBSbuZEtYDownoFqRhLAmrkHYvROEIKiFKDEjWspEernFTUqKZLAmiytczlGfnKAMFWLBLRqAFSJiGrFVKXmaZiT",
		@"ckqLkmwJDKzCtvNJMcBvagcCshHLWaCpNuztSfANnQxTmtqnBblElagFQjIcXzBFuFOHKpZuyqhlLuSNiawKJVUhJcIhbXtOCaGOHbAvTBFOAAVIQNRfGdnTontawpTpSntUrtFzTtaGVkapek",
	];
	return gKrFAlKWiFrMUIkxYGF;
}

- (nonnull NSDictionary *)yMVqSrRQeHcIgdCQ :(nonnull NSArray *)YCcrktgtVORQpT :(nonnull NSArray *)EslFLYlrSrFtR :(nonnull NSString *)TdwTzvqCVkcylKEqWp {
	NSDictionary *aFXCoHMkhSsWQxIrqCp = @{
		@"XoVsPeWpmsPk": @"gdJZkheyAeoVYUBIcZBqkyLlRuFEpcMEaZXYLxYrsxSRUQLFNIhXMkgoJUPNcEeUjIUdwdIjWHJhOljnlNLuQwMDSExtPXUuZmNWOxfAtLUDOLNkoslKrfpykBNlyx",
		@"qdQpRHLYtKUHvcc": @"GUcYYJDPnlkGqWjUZQEJBjwpRvYLxMzODJNqmvphqbjqXehqmwDZHRwBAWtGZyvhmlQNwevPyqRIEqWkjGeuobuVoXulSAlZRqLymHW",
		@"EkulTYNFhjQyn": @"EhnMCRCNcXzvlynDBLzTrbIDcRohkQbkQfNYbPPcqRKjDVCIFOkBseGOKBHuEhdJkyKLXBzdWqGPctoYLhfZFfhSjSbkUXehpVnvK",
		@"fCuDwHsqGPgBCXJM": @"qByvGEiHLeHylgmteXvBdFxAEqAOjDdqzEhkUoNOzxDegBgTnGIlUzahzBERCOtkplfdsUWYdTpEewNjAykUmbHnKhLnYLIJmylmuQFT",
		@"crppvgnrBVHTfCAaKCS": @"uGcJDvXyEWbHzEFfkjJsgFZRbBGiwhFquOsTnZSkJXgHsQrdioPvBNeCGlNXuQRRWJZborvGRfhtItAxYMjevlBIUWFtqahzbWFPkkhggWee",
		@"yucGReKyvhwuzJXSl": @"JaloMUBfGDroQyIAvuLRGRvOvnQSCbixdHRIrXZNvGhQrGslEmfqKHuzCueVMSzPzDNOJPwyGYjwLwDyKpZLLsFvvaJlcmpaBvIrNCvmMHlMJbqDxwzfqywlYOhFsTfPWzNcSNDJBAxRHGSjok",
		@"tqQVhLBEyQhACTOm": @"lSjBfALhhCBLfOrKMJlwvATIjqecnyncHRGvToPUjVqDsqGfvQJbftCaKZxuKXhHCYWjoNPjkXyKfyiovbEDQVCvZDMlXJhmodCZsusYAmsRvIGNFn",
		@"mnUufJySTZY": @"NpDNDsbPfAzsdBypIsTzDrNVaokBexCyspPIBPVPESmWVUsJGuEuVQKrfBjTjbpcCvKBTgbXWZbBbQXMVbDUUmcEwfhWLvskkcYsYbpePaBjedcESyOhZvGIwGrupCPxrYx",
		@"kWOZaBEpGUzOAIosx": @"iHFPmeKYgCdIyQZvmzXaqeqPgjjDydnPvdzZKLoAAeATnHQleLRmCxPgUFrxzRcjyFiSIpMdLDCFlTtyCDxRiTRPwphJeKMEthSzdCbZJTLYmvMCmxBuYwUYTMXuwhZPeoaxETGjxFd",
		@"bLNbkHGOYGTYrm": @"rGgJBdiTHUULvEAtNokHWawKmWIwTdtgipgpgaavWEmxcweohwXNETxBXSNAEAIyBqXuVBlnLpZTnZwKZOcdlSxFlmRVGHiYioqijJSaPNhquothsiSbrfgMTAHlvZpoaS",
		@"GDWKqMpvgywfDjPpkG": @"fJYiaxGlPShHyIhnfpeFbmHFggFZtjIMgcNmvRcQvKcPblYchIxMNcgwdEgUZtvQQcFrHYHKinCFdxPXYHhRvZvFFbQgqOqAVyIxERSOpcGboxzNdOeifGLweOzGrPsPVcUTMdbufSacF",
		@"GTPiRJPAQxdFwor": @"EySBTBZynqEOpJZtvByblAMorPKNGZcfZVikokxNNZazWrUyLqHJAtimoLqfLeWUYVEcYvTRTwfdRfUMXIPycYFbLFtFShTOcVHM",
		@"zAWMCmazXBVHdWtrp": @"EpWHTILiEzYonDFelmEMtWZoqalfQrtGhDhoswhRzIEyERcPdhVZljDclIGHWvhmBtboGHEczNTvwGUUOctPvRHnbIHpEqmxFIotZkijPMWTEBodwHKNZJpQwHubPCTmmdghPpeUdGdaVHt",
		@"HkufPOYjqDnPTfJ": @"HIysCEBhFqJCUjkxcRfMDmOYGOpCKzpPDkoxqcJtKdXePvTbKKMALRtXQDqybPnKPQgnlSErhtvnYvLlbhRPHYehVgNqXAKhESQGbITbUdxsp",
		@"JPeyspcjspjnRZ": @"GMUasVvfhoMLxXFbcJnZftdOqViIRGkgQeazjqqZREkDopQbTeBkpwvoSuaBgalJzLtLWGuMqGyVgvHgyUKNVQaUASAfMPLPRYGJGCV",
		@"qoEDKwKJiMUj": @"INJRtqLenbknBLbuTjgLOeURJqEmVWWBkNFbjCZJCcZDcVizlbWmcGAfxVskGLayZIJAxAzjVPORGFgQXsFpJGXxMuxYivHQoRmdNqlxmIcstFZIRYQuJgnHJYyvXtGDwwZKSiaMUhSUssAfpOayR",
		@"MMrLRUqvgayS": @"WYtQxlvYqhTufqApCbnwFzJibohlxNNgNGmgtrEfHmyIPqosBStyrFJgfMCdXrvkeYNhyuDlnLWdhdxETCANYXKXVJSUeBXfQsSmlQkcSBqXxMwHJJPdZaMcJzniWkPQp",
	};
	return aFXCoHMkhSsWQxIrqCp;
}

+ (nonnull NSDictionary *)WISUedhvAG :(nonnull UIImage *)RqfNZETWxHTTkwWirw :(nonnull NSString *)fZTucMZhcgLASjNbqxP :(nonnull UIImage *)GCotkOHRyRicYEw {
	NSDictionary *dgAbLeVSZd = @{
		@"EcabhZedQuqnqvWZeLy": @"shdHUjBlEvdbqIwYrbEzkKgxPkNDWXJuNHkKyZEaEkggjtgHMmjWoJqAZwloRTVtIhvKXvBgGdpjPiwqBLUrgMxBgSRNnBBsIFvREr",
		@"DBNNPSFdpSlgtGskO": @"bKPYQbZfVcnPMYdQGmwrkIDIUbEsEhNdbdpJwKflWTQEQhWLfGIXfydaTYzsbpAizntSqnytYPfvriTDVLYSgOocgyGZHBBVFRzzZUQ",
		@"fHChZJKMHJlXRwRndD": @"IAqfRHxUnkhtiwnFlkTEssEbYYFlPfeYfmXZIFFHaNMSSdHZdkxkfmQmmhWzkuaAtsdEGnuJSTfEjpeQAoLsvOeUgaVtARqyXobAnMHmctZUGywXRwtUMJzukUVXqofRcSrSwgavbv",
		@"IdRlzInMUyxtKN": @"cAzRTJzvhmOuGhWVxuYmUHJDbFKqbMmGBrgblVzPyREilbJCIaskcGxeSfOHfDvWWdnjoHJrXCgCbHZsmsjfIsRpbzGvTStmTenP",
		@"eQKGiqTlpxryIufkZ": @"JENnmhyfnUifoFwSyyGqwpeecTsvEqyQWcDOPjDKTaYrrFsqtcrGIARNqtUKGGBVKfMbbAfXCPqDcmeegqZQTOLcPrBdaEyrhgouqSaqVPSKHI",
		@"aLVIGxHDEkgdf": @"iaPHieECgTvtKRaRJEgtIzIqkUAlcFWiogiSfTHxKCIqYZHKNJPeIiGXCBNCBdRrzVCQCBmUahEaxednRrSNQBPWDkQfppBDvfAydQHHqbNT",
		@"tuGohBkCHDaSTUD": @"PKYQKpoddubDGXTvqNAioeirQOFjnOIywGSofNLSIvsPZzSmsvzHLyjDlpgKYnCsNyOIzKHjZjYItXkbMwNSZTUEsawBfIJjBmATNZAAvdiyKQAgMGlffUrancWWzDdoNqWQFKxhVWzMVDPLHU",
		@"KxnKRUiRcY": @"WdQBhCgGzpdgYzKPDaQHPJDovaBXeSOYvjOdjNEtsTDAXWuLCvxMlIztqMMokSbkcJtNkyIqOpkFthmUtElpBnIKMAzQgEnocyFnPZhlLqOfybNl",
		@"gtnfrlZwbSvonHxUST": @"rsxHNRGkwinVBrAZygnQXkxxSJtjsrjogBxwsXgwCGiLSEGJijDZDHdWcjsdynVkcsDYbbPmEYJINYtoAodFSRfLhpAklYXLzDhuERIzAiJlapdetxsaMtvqNNMEtPtCCqGmDskv",
		@"jcLcdlquGrozRbtxC": @"LYkojfhURmPyZLETFeXwjanBlPowkmeUrRhdjsdRUqKLbRdjrNnRZsyEGkyAxGoskRvGxNFXvHXdUDoeMNKznPERgHhQyAzQjHIUnXyawWYxZDojoKuCMkAhDWCstPfVbKHEgjupQAtEcEoH",
		@"fppbreGZDPPQvEG": @"nlKFwJOqaauavSRtEGLYxJyZqHrUsYXFLShWTslfYlRMiwqHjWveLDTHhsExVNoxCwWQhUSpPfRPTEuoPiScAcaEncppTqpNfiCdbdOvavRDxKEWwScwMlcyKIDdNWGoSezHjxstbRUfJkguOW",
	};
	return dgAbLeVSZd;
}

- (nonnull NSData *)TKOpOWMkJv :(nonnull NSData *)fmQnziJQFhzBU :(nonnull UIImage *)GHqqRbDCMVaBDkn {
	NSData *XvXAZblqtrQmaQKRE = [@"TZhpqpmfszJzfGuuFwsuGgzxTHRoKDgpQLQrPORDGfeUEXBzhRiBOAmMoJxpnpMzEpXPkbSCJvynKHVpZBZyvTIsjMLZzvdlPpqZoBzOEPYxemVBwnrLFDfsvQVvZrGmtvBJXQSiwW" dataUsingEncoding:NSUTF8StringEncoding];
	return XvXAZblqtrQmaQKRE;
}

- (nonnull NSData *)NCjAIFBaUlSBkD :(nonnull NSDictionary *)FHcONhSNJJZJ {
	NSData *HQjLGvnvSSC = [@"nNcrGcqrWqzDomBXaJFBUjudqddXWawGYcFerEGOvLLpvCtPMDWIufferoeNZLGfecfGTXUkoEhFjIcHjqPyNchPMjmetNvGERARDqAAcnSMASheAcpBQMhmaNRCfZRs" dataUsingEncoding:NSUTF8StringEncoding];
	return HQjLGvnvSSC;
}

- (nonnull NSDictionary *)hxYVCGaLpwlzCSbGs :(nonnull NSDictionary *)gxrlFXGvEeDhRxCl :(nonnull UIImage *)irFCqJGpjSaFmS {
	NSDictionary *VzLFYMLvgFh = @{
		@"JPFTZAmPGBc": @"zkJsJiSIpMBwXhxKRulDntDxYZCkIWdyhYpoXLvWaYpIykSsaQCJnvqasIgKpCAFSocnweAtlLhMliYoPSdawRPIOvRUvtjmmNFScdDUkTAInYFYxYdXQjURafjBJdyziJtLUwmfjntlHUZSLUQzX",
		@"ppSsdpYbNrFUX": @"mrvYNxOUZnWSThYhoPYTNkYJKegbojhGPVvjdUTTWoLbVWStCCfjRFZdHYKXcYefnhdsUILyouPSqcIOchltlKHqROfNYeOIkLDdasTVEyeumkBBFPbHXZScBCTwIsN",
		@"sisUCDlDaBRX": @"wTVINYMIkeVqlenItxfjPsvxgWnUvvkKgnFPBRfNZCgeHGFDJxBBkduOqZkrBvXNLhBvACtbHINGvocGQxGOYaZyGGsaaziuEuqvTyho",
		@"pJEqHPpNtnckwf": @"MiQwztKhlSOztATKfjahmYKjUXXSSTDpJCEUYyrtpIwdZPgXzHWhsAfzriQsELThjgDcYHkjMFHxVIauSVaRYJzMPWLtbSCncSpoUtWGimYGmbDDjGzlSZRjHQA",
		@"KGjkTfqwjvb": @"NMrAXIruXRsDLzsUmXQABTyjsVlaAlSgPYSBURkRmFxAxXSHJZNZgMNgZfuaSdiYqQwWngJFaDOSrmDOgtqCDhJEPhJRvVfvxSQCrKMVurqRtmRemLtNBNjWTVRDvAecvmYBZTozvVOdgH",
		@"bUcikurmbsb": @"dlVOLmATXsuhomWRsYMeydPoDAgLqEeFXDbLbljXHkygPkBidDlvCrvGBrOubcbQRLexOBDYXvOUbIblnVRHHNgdkmsNUurlXWxJ",
		@"QLgWbcboeYN": @"DzyQmfoqLYVcQkPKSELUvGTzcrOrYWNObnugtZDqkCKRBXGFLrVMYXKjUTDqWTADnvgiJOrJOtWBGvwvmtqzAcftUvGoDkgUMwYQuWxZzKiULgUFADDOE",
		@"lZFtrTgHnhhhzO": @"LtFQfqiPqPrDvoLdRTqYwfqtMIHhBHWXKnecHRfrMMkXlwzeaTyFQgAACMrEejaSYDJRfYsUjnJdImCSQcjbwuZyhiQJrMblRkIoMOISDfsxOMAKsAU",
		@"FtxiweOJynXz": @"NxqpgSLapWdLZFPCEKCeKECQnpeiqtxzGhDOGfInMmqWCteFLVhbDnYVvgnnijJKXzIugqRCdwvCwhDFrMKxERRLBbIUKMkWYfOilkASfPELsrVjqJqvElUYIpWlWtRuaqhfbETirntz",
		@"hAXGkngxxZkNiR": @"WAfEZSfbkDZLgjfwsOqBPiRstIDkVVicBnHGqkIxTeiPPRHqlsgThbkgtOOvmvNPPrVfrSzlXWdyGQqJqDcsuKeuaCnZJLhwtPBIxszTpCaPgeEPhSixpUsMNjecuAtxcTBTtAvYvCCk",
		@"UBnwykZjxU": @"LjBghMVOLGBvHhrcvkohwzkGFhLnkVwlKshOMSIwaWIMDagADXIwToYucHYpluyjwdBQPZWKkAaUNYxJsCShOzmuklmUGxVHwUUEqRpDfNcvxgJdtVtNFNSktUNLRHTDVOfxqyFM",
		@"GoIQlsuysryUAdh": @"HfskRAVoIWJSyfkbpEWmclSmgjXpbGlVLhGKTHzbovkvRvcuemQlONSfpkfeqGUlKtjrRErukqjYuBPyDIvetRhwvsMQfDzkOqjxBJSYmDRzgTzAe",
		@"FampOcZxoVveFcgSX": @"NJDPpXezEICmPnZidUjtxThJlwMjjzWLgpyYwfGDMNQfJIxjAUwvnRyaQTQIxEjObjRBMXgVOQTktSbjoRJZOnCDmXuVEgOwYgWPWKXfsmxCaBzJyhgDjBzFlItNNnbqivyujBFol",
		@"MYigVssDmkKETbio": @"rDNqqJBWGVFkuHLJFmJqgDjuOYQUhkcfWHEtOXGRQaGzJlbJffiSNefmqWUyumgNdPJwxhvNCgcSkARnQbXZAYHbpCaZqYCqdzUiiBaqhnHkwET",
	};
	return VzLFYMLvgFh;
}

- (NSString *)weekdayStringFromDate:(NSDate *)inputDate
{
    NSArray *weekdays = [NSArray arrayWithObjects:[NSNull null], NSLocalizedString(@"周日", nil), NSLocalizedString(@"周一", nil), NSLocalizedString(@"周二", nil), NSLocalizedString(@"周三", nil), NSLocalizedString(@"周四", nil), NSLocalizedString(@"周五", nil), NSLocalizedString(@"周六", nil), nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}

#pragma clang diagnostic pop

@end

