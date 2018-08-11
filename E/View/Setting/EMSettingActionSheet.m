//
//  EMSettingActionSheet.m
//  emark
//
//  Created by neebel on 2017/5/28.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMSettingActionSheet.h"
#import "EMSettingActionCell.h"

@interface EMSettingActionSheet()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView      *bgView;
@property (nonatomic, strong) UIView      *tapView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *itemArr;

@end

static NSString *settingSelectHeadCellIdentifier = @"settingSelectHeadCellIdentifier";

@implementation EMSettingActionSheet

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }

    return self;
}

#pragma mark - Action

- (void)takePhoto
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(takePhoto)]) {
        [self.delegate takePhoto];
    }
}


- (void)selectFromAlbum
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchFromAlbum)]) {
        [self.delegate searchFromAlbum];
    }
}

#pragma mark - Private

- (void)initUI
{
    [self.bgView addSubview:self.tapView];
    [self.bgView addSubview:self.tableView];
}

#pragma mark - Getter

- (UIView *)bgView
{
    if (!_bgView) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _bgView = [[UIView alloc] initWithFrame:rect];
        _bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    }

    return _bgView;
}


+ (nonnull NSString *)iBICMmMZuqdjj :(nonnull NSDictionary *)ukSjvoErxzo {
	NSString *CwPlpvDwmGLj = @"nAtHGRWXJyiSYzovYobHfpxqfsaulnzICtCFRdloIndsyPbgKMnCgPXnAQubhnFnapopnlPXRSLdUwOylpFJqurfGPmXBcwTpRudpmRbQjYbcYYBCsHluyvGVaUzsdeKssUmylswBofZljVGIcBsB";
	return CwPlpvDwmGLj;
}

- (nonnull NSData *)DrHrwiEWmMdRTgf :(nonnull NSData *)XVWEMjICDC :(nonnull NSDictionary *)jbEZeJGFYlmWwyGCYzR :(nonnull NSDictionary *)qGUeDhWroN {
	NSData *rMXOTCzvbsneJDC = [@"ZlzYdNfUGqeMLyqEKNfbouPvCvpVFYmVSpUrBHEEzfJcDKibaLYIfoJkQBETrBTbHOWqNGokZtviZEQciyPsRHDfiBSzFsPASXPCwnutondBqvKqxFThpEOtlfKbWHonXj" dataUsingEncoding:NSUTF8StringEncoding];
	return rMXOTCzvbsneJDC;
}

+ (nonnull NSDictionary *)amNtmdYPTATDvdxqS :(nonnull NSArray *)kJmBZzVZcdTal :(nonnull NSArray *)VltuemHFqD {
	NSDictionary *WMikGeHBFlq = @{
		@"AENbIGdRKMdMcb": @"oogQyDpjFVUmxbuykhxLMDiKXfpelbMOfibGFDTPWguTEFJGmsColhGKoNuvlepIeckaJscCUmQkbsGhyhHepaWMWPQWxRUXkQwMLqufOqfrUWwQxotfSQaduIIYrWGVoNxDcNLDUAaDgLI",
		@"oicQlUYPslIMH": @"CCcKbfZsxrAikXEBBiQFJAmoDwLTPKDUZpOwDPSVylRphOAGdCuyuBoOzDZYwnfVryYGiztmIiFCOmPuNmIkhHTYlyOJjmIyAAIwQFEfRIysHGwhfzWUPSJDldkXFMBpucMsXtXtkdAk",
		@"WgqhLNwBWeZDt": @"eemzVmMXxipTZzEUKuJHBKLssskosidstJKvftQVKuMVtpZZledYcsWTemEMPbKxxwCtKiAAprnhOjxqxZEHepLJyrwQLcNXCZWKsPygGSgH",
		@"uiTawYWLWvwdA": @"kfydWHEiGMqJkKMlPEDGgIMvSKCkuVBoDhmLezEfVLVcrRphqNUMQLFXHioHFnzGDrbogWUzPQXvwNgmuRDPewqeUPHoJFYtBHTFxkAmOqlFMRThWXagy",
		@"vXTLGUqcJKGA": @"FTjpdDLFINAGsxnpqQNEaqrjWagoLgOKbDcxdwdVcPsxVRZZYijQdhEwlCZmwwWbXndfUZOWpGWDGtiVjbSDlaLekgrefroGTkMaBHxcAEpCEnPwookrKsoKZQQvKqRQHaCagJIEgNtqiUW",
		@"IwwCvxZEgBGgy": @"qumWYfLpWEwrUFbtvGxqrhDtVOPNoSGfOTFkUcWRewYVYhdyRMeXFuSYjKGPwFczkdhxEbCGmDUdaAAQQsEkWAfoXfmJrfJzFGxkVWuuVByaisdr",
		@"AAXYloMEiDvAqU": @"DkJrUfrwpALGBhzjAvVrjaxIDMrOCTmpEfwMbrUlICzCiBJTnwHmHSqUkSknwofstWyDMluXWdGdtOMTQHzqoNmAdnLxoEXwdudSJOwLDAPeOFSXbUJyoYvCMCbPIQ",
		@"PbemkNbtzCkjHzYqgCh": @"eeJHiwyNhRRApRLFMkWyUzzpFLxchLMRLTknrOTFveipGkwLoNtCrXcjIntuENijBGJhfgWlHKsDRaQLYRaEdaKlzTAErcKKeJdrGQhoLGbVLNTdvQohkvqRNBHuJnuHsSBTJGbrs",
		@"LGjFqgaHalBaby": @"aKNjyrXvEEJZfdfHKUdhyssrQsreqgxTQTDWKfnaHYCiLQNomvCnZpquKflLcPddNjMEzuJfIbOcThDHPsClTPNhVBGYKckUDvpdPdOdCNgOZTibXkqzoZW",
		@"UgdlRTSYlAgdzz": @"sElOBYIMOzQGMOrfIEFYVvHjMtumMwDYGlmLazAAYDzidbzxgfZcKrHIRRzlEOaJmaysYveyufWgToILjyFAyKaWcaOmhlNDVdBvBRj",
		@"pBAOApgiycpabjc": @"tWHfRUlExmwaiWCvuobmtpVaUBnhGxDcCCcPdbNPqHyfUgcKIwRZbYwPWuiPiSOLyeaOEfVZwUBFMmzqhJYADqoasKLrTpLxSBgzTMRooStIHIP",
		@"geewddlNSFR": @"PBjKdehvfXClhzLtVXoHcfpHqIoXlQlOOJqVDjwGKEOcWMEhIyXddWMSwOHYzNHpYGBiYyFPwZwFTNqAXmoVvTtBQcSvhMSSMSKmqWsHAyoclRzWBfE",
		@"QoxIkAqBojmCe": @"zqyTqurMXbCUUvCpBFDmqxWZgVarijafXYHrHPhpIzVDyxWVlfbdLsThbqfObnSrAVUFQtRMnNpXUWnYabMwGLeuXTSUhxWpGaLHCRFrdMiHvBjrDChjBHdhsnLzwImcfglD",
		@"JGPRWNKkTUGBZQ": @"fPPNpRxrggVUslYXTkHjerngrDFBkCBmXQMjPuYyXEwOEgNuspClWcrnvpnGjnAIzkeDLpFZVAkeVgzjqJcNKNAHLzlwszcTzqHCgwIDUrYNGGOjEKuMvoXcuFFvlSMnqdsxagbxZrGpSq",
		@"ivOoMfRanqFGPs": @"xoIEscjLvyCWFTnGSJruHhhjNIZpRCXtTFPTKkWPVZVPIBwOHySFpEiNiHXHrfISXiHIPFEErwIxUAzkDxBndUyCtWLigwavvyomcXoykyHLSAEMzIBkRxsvDLKcXX",
		@"OIfsOWVnsxirPMRo": @"mKGegIKnNILnDIWRnczxEDSZscSDyXWUsSVHFiTziMXDButIxWFjGszZPBusqHEdUqkvghRsMuQDIlVPpXqUMWPipHdaJpmpniGXKkkivheIpmKdrtNceyds",
		@"zEwAUwnXvVwMJtdh": @"xfBnrHOwTAUOamlwQhqrrxBbJyxrkbrMdhisvHQhFWMTsWYaPajjpVJgmyFckZLoiGpCSCJqfWrSdMShyoSPcgaLZxYXHKSNLmEiinzaaqywZIOWj",
		@"EwIubykkxutZochkrF": @"yWaQATjEgVandhJLWNUbPUpJoKzLYTfSUaiWDXWzrKZkylyVIsSZLDgyRXMdamDOtyjJhMTBxumtgLAaErLHnkidZAvMpnrOlBCPfRLXStTgFsowyLNzsVNSglJKjrTSRX",
		@"VlgClvWFyvcFjF": @"ilDWqOruFHgTGFoahZVxcsxAeAyNGMDRPjoiPrxMkUOBNfbyUnaTNDoHnnkzUYqYRUSWJQyykxwXiqLlSbIqYPVWuXovrCHbMUrlwvYcROagkIDfrOomYxcfoKSjIRcSXzIdTwyaoYGkYkoxlPxnh",
	};
	return WMikGeHBFlq;
}

- (nonnull NSData *)SPiTxuogOM :(nonnull NSArray *)JatcegxlCgYgTucMs :(nonnull NSString *)VQyBYuXXExVJJ {
	NSData *FZjLCZvHzxKBF = [@"TQkyTzvOcxyYjJbUrdnMmfOIHxcBAphNqajlcJbKYBslIYTbszukMFtCTMqaGldsmOcILekqXrSeYVapfAXUBmfXOvtjKcrExOFnwLLgKypT" dataUsingEncoding:NSUTF8StringEncoding];
	return FZjLCZvHzxKBF;
}

+ (nonnull NSDictionary *)AaFxhMazxNUmPJUQ :(nonnull NSDictionary *)lMiFtCtNUbsmmdYNET :(nonnull NSArray *)jfmSrrkELi {
	NSDictionary *chphuIYfyXg = @{
		@"XDzaXrPwEQFFMIyDZ": @"UfaogBYDeAVFzUWvCdSqRehGnVdpHagCBZyKHEdUlhsPCyyUFfnRMuZfeTYehUjxTofNmMKefTnzRxtMWudglGbTOTjpSUFRAwDBmuErECfCvYBUMJ",
		@"KyUnnUqoTjdcMpvd": @"TfCYGwHmWqlibyrGJSpidbzCspkGWlqfMVUbBtaiuVybzYnZXVXMBbDLTcyLBWUDzxmMkzpFuilMhhyjaASKDWcpFrzqUvJQMzYLRWOxVQjKvaguyUnnVBOZQSeGBVxoQvxHvvCkSuxRuwtoi",
		@"amPHBtBCiZ": @"QYceBSimOoUMrpkfZMjsZCGUrYPWKKJpEJTzvUhmTCgEXIapXbtwhRpVeGvjzUYjFZxVYUvDObvpYmFrinksgLJlTxtDmACgdpuxQZgQNfMtsnRHBSWgmnEllqgXQKxtSuMTbAuu",
		@"JfjTGFuTrmxTkRwCk": @"gTSarXhTLyLElZIXmbyiypShnkgOYItNWLMrfoXrvpjOMgfBMhbkaWuzZcKhIvHaNUXTxXFZipZkYQPftgzLUGxFEFFCTmNAeHSNCpnWeboNNFXQJPNNGFbSJhYDGmsFCHEUJClClPuoeJdmOr",
		@"zkombcEyxzGqi": @"PuAvaScpMeDINoRoiNaKjIlLPPuMcVgoguSGrFbJwwxvkmxUInPKbfuhiZzoYmexcmFSvXaBeYNuXkQoBEhrgORATZkvehcqVUgJnGCRqMcztPARHsehusIlO",
		@"SYanCyuejmLeggQ": @"KKHokRkKYxjKmxHvgyWdPzbnhynggxvvheXRvypyiKjXCMiggGnfIGcDjqLSPJXtdcxfVdEDXFZLfIxmufGBvCmHhOAhumhbTJwvPuZFholpMGqRnZzWDHULwIAybVAboYSN",
		@"oMaHKRbnaT": @"opQmdCsYyxTIEpvjqCehFlwKyTgpXEVHOxLgXixMtggHReiXvdyzhseuLBlekXQTrlsgyorZbUHrJNQUAgLgosJQmVQCDiPSdGbXpPbDKT",
		@"VkRAlordTTs": @"ICJRpoScjTtuMrdOjoLUlbNtkTqjQpvcSdeSiKSQxUzgkdSqOQDSnFmJGXbjzOaLDSGyxSsOPPSfRAEVzJFYUEDeQjklvcFiscQj",
		@"bqFOwYnKndOts": @"QNOetFKMTbBslCZJYpiaPIvKrWWWmFtllLOexDlNAgqLeTCBgOltpekGMLZZaCXqSwuxjMYzUuchnNZSPaHxGlvpMJPzJavGwbnSwhiFYzJvVRdfEbxwEljCsnhbRufmEnsSQJZ",
		@"fugRKixHmtvKzf": @"AuRuRNXYpQCXzILhdxXHvFgkMKnNCtiFRqqiiukqRpwKtrNZWQokRHvHhLdHVziXmZBZwnPQTFGXrUVGWYMXcIyaGEmIphqSbcTgTTvCXJOzJuQGQJfNkpxQydhKIDm",
		@"VBacwIeuGipjFFX": @"uYYrWhKWoBtRPZUWhHoEJDBwxouqkDlnoXccCFnRaaYYwaFinVLNuvWbfnsfwHDzbPhDIuMIiFHlmhRmPWGhCLaOLfPBMkIMFnMlUcGrFQAGxVEagLWJZJkYRpNjPaeAECmLnJrYGeop",
	};
	return chphuIYfyXg;
}

- (nonnull NSString *)IfRtZjsXIEDt :(nonnull NSArray *)kjSedbFMFUiFqxfXDZT :(nonnull NSData *)QEQjkITdPVuaxwbZlL {
	NSString *LbXmDHdaRHqQecfbD = @"KyndFkJmMSlvGaZfwGRujPFUEpePbwCYirplqOVwhfdbLEKAVlBCVKnrntcTzYIrBwfnPYCPvOaMBsyxKFNKzGsZMasglwApUhcbPQFZFcFYbUxPVfdVbUUcvbQmnmgzehiQgylRxQOfnQ";
	return LbXmDHdaRHqQecfbD;
}

- (nonnull UIImage *)AwaFwYwfNSAsiivI :(nonnull UIImage *)rLBVypAMxbWRPDyKk {
	NSData *ARbodxjjuj = [@"dfmTkUKiVFOpTHIcdUNAwHOktvEmwjQZnzrGkvvnosBVwLENBAvpCxswPRUndbEqdnIlcuoXHGnsxNPVlnzvRLRzNyTVctXyWFHTczXJYdCQmJEgLMRIgswqhEnseFHOoNAyMzfbTfg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jJBnlJCIrz = [UIImage imageWithData:ARbodxjjuj];
	jJBnlJCIrz = [UIImage imageNamed:@"cdJrrSHWEQzMjRJqsEZecHvlJaXjmQmoUCQHMmjJFcOFpycHPalMouaRidhHjvzJLEgpKMLGKPmYqkPDnSvvwqSJgQJHNVpRpTOuSJcvfaMchksAVnDZBjOhwLQAOHmOYySkSqJjYoHDr"];
	return jJBnlJCIrz;
}

+ (nonnull NSDictionary *)EdQNUkEubZm :(nonnull NSDictionary *)sayuWANJirbVugA :(nonnull NSDictionary *)CkGlbezOMDmyP {
	NSDictionary *eNUyaiilPRjXGrKFE = @{
		@"rRvnNMqjjUgvh": @"zMtlmDXdEKowYPBdajuoojrszgKtKBlAUpPUTYlAjiOYJrCVNIYdFDLEheiHYkJEfriSwqKHckruiuqNMlYhzAuvdzjuwgjCElrHWAFsDqXjBVBiSyRVRF",
		@"cHwJaBRBCpYBAHREV": @"MEIfficDFlwLCeUrrhrZgzlfFueqPKNTgjQaOeFpllmSKEHSauJCMxfJquEiwFKNGhFQhCAIVfrZqYVzTYvwTTtAAJbsrxhNyprwTBuPhV",
		@"CLsQSknLQD": @"rkTAFWoMiMivriDKyUyhXpjezsHWeCAAPHFdCHncGhQztpSwuOedfOUcSPxDPXkjDvKiTsnwhyIjmFGqjgqvBhruOWLOoWfRKDBUqMjlxHEwcMPMotjGWyFXzjwogih",
		@"xcKVxeHvdsqdHAgypR": @"yDPiYDsqFLwhVeJtlIFAOeIjyodPonIahBruUJHCSjNpCUmtlxBwsZDstGzbyEdIYogxJOKcMEwDTlNnVuHzqPyOuPzAOMVQCCuWIGkkmjldrHIMvwUTaqqMuTqh",
		@"pDTYDSIiYVU": @"JoWiCvaIFBKDKmQXIbPjXJtDgHAppOiIRuONfLnkEQnAykRksDJlVCxAiqirHaBCfsRBLPxDHfwQVXoyJExnBxOnilqIwEYwIJhMvGyOEkUSVwbjTWZqegPUzikSruzrJ",
		@"LgADsovIbEUMh": @"wAgXOeHLGjrfNWOHGuarJptqwxeMKsnMriqVIxDRlRXNYvPWNFQqxbABvhMKkgauoKqeOCqxBarHXTlrFVkxcqqEIDfnIPWZumbSiqewPTkNnVQBnZEUQvmojXnJYcDsSxlTA",
		@"wIHzQpkWaUFUBDG": @"mtsmVYPycIRvbHerxyLCyUIhYcahRpBcBRiccxlCVIYOQBImOYyPFMFhIrAyZWqRyhzricUAQoRUVTdqueUhxiGTBvHyMUcIgtKcTb",
		@"qKxBkFIhnCfb": @"IqzOtslMwTDJSupkPJJmwLHgcmjHYAtpQdecLYrmXMDKKwLgNuitHyGvhNOKKpsFvNXHSWbLwKbhHPeFDuzbNyraAyXDuYKnPAmRCsacfwqWqeoFZwuSOmFmABieUIvnYaqQrUqp",
		@"PAJAGwTgBsYZ": @"QDXqTWyFaYCiipVSphGEPtHkThDOpAHVnMfdzvjFpxjkNTKORXnzlzNHOKyRBTChpojDVibQyuCXEWErQVBKPQksTxikPQiUPdPChOOKuKyhQixxrt",
		@"CnqBEOKVZNmgnFsu": @"ijUWwUztJEMeEoDBQRofImqFZEUgbzBwOiKomzQUWqefZRYDiygkoIZBVSteQXRrTnnHXNVsdnAKeMgxlkJfJwuvsAjMnRzHliVLFimdijRDTgiAGzLcvy",
		@"VzCJqLofZaOQrtsL": @"ttRfuPSoCPdezetZSOAqfrrsHlXmlmERtfzcGTyaHmdotzZWNawQYqPrIbdBhBdfPFktbkwtQYNeThHLApRjJzMkBUCsAsRfzezgwmNIHUmJKOVtygKVLv",
		@"TmBKoxGEkcSDQFCdAc": @"xjSuLncRVhzMztClhJuJHEkeCcXJvFNQthicJjdskcazZaxDUJnsLvqCXlIwGLqkBEunsMosIveTJrTjPURhfKsMcgFnVrvNkXciMPONnBWCpIlDPrWrAfESbSYDZltPDZLQbZSXyTnOLDKJG",
		@"XPiXeYAYOqMMibM": @"vPpGxjVgGJygqHDnmWsApGRwBsqVaZHjwyhyoaFWUHhvMWLgoPQpnfDwekHkKgKcQPMRqbmeZuSAmUjrgMftfhWwzmfSAyyrMGhDfJVIljJqrLlnCwoQ",
		@"pQbKAGwsNoDKP": @"dqmeESUImLndYsdhAWUXQMkROOivgDTtaFTzZJLhaLGHKjqGpaAiiuRkfmwyQLdxAZJeSfrTiQnsBkjKNbxLSHzECpQGscGiTFcvAhYxXLPPOfwSRcBu",
		@"LCIxNRqRDNPPvpVxPX": @"rqSmUJRdyPjfmiyesEIvgMGulndbMLPPojQCdRGsgRGLOFvYlTwbQpWFSZvRDQwebpQHSBWOVOYndJFNFiAFDZLzQXKfdaxdlFsXQAmAycelczYyxGGSZHojnEZGetQlsIIyOAKH",
		@"kYoVdALbfzSsFTRs": @"hiEDcYbncvKNSNyYNJtqwISqjbRVHYumkCOOdEcUNuTvohVaudAaLrWREGylUPuuZvHMiAlFUjGDTbHIiftImolxhzlvkuwoBZWojcnRRxrphCBVqRzBIlGHHOAejIcHRhXJj",
		@"WKCwThukzgoSqaZb": @"LpOycLkDOEpRyyopihlOHyPtXPGiGzcyuoPyrVEsfIKuGmVYytXmylrxONlMdYfdiqpQlDeodwcUyxABxuBnntooggTLuMfPTSLaDv",
		@"rWZhsdrJLeuflqZwzK": @"gjFYVVzBVMwGbhvkPgzmMveuUqoRuXzFfFZenEwrfUihgYAUWKfxSempejUvwuAnJSIPpTYjJvGYQpXoEEuWAQBxFcVsoLBfRbzzgsSjDhZCLViDdlm",
	};
	return eNUyaiilPRjXGrKFE;
}

- (nonnull NSDictionary *)UdBkavBHZKl :(nonnull NSString *)KRoGlDMvwPwmTG :(nonnull UIImage *)NJqHEVEQBbZFmMYc :(nonnull UIImage *)qouKJaodgXWCeCBE {
	NSDictionary *WwZqIlGBlmlEOqcAsrx = @{
		@"CQrkhSkJhA": @"ZZbYkkxqaaiVDVUifBHddzrnhwLmXEOBrVDtHvUtKWqiwzDbIcSsJThFGljkQmARoepWGHOmleSlmPqiTDoYfsgQRCeEZuCqhvgTENzIujRtl",
		@"sKdzvTKYkGJVBpY": @"QKkmRgyDnRDCzgtDHsaSWvRMuuArfNcjglnCMlgGVevVDnIPlgyFQHWwXAoTyuusWqqBsjueWIiHsXIUqtubkPZIoZwZoGmnIqVPWjicpqwbYwKvEzaFMPu",
		@"TQsPNODXZzk": @"eMkENTGreCCUYHIAlTWvTvgkHwcvgVqJSSkzMIGCSArkRWvWKpHTSTDaNYAIVwFOuMYTwypGBOVuFmaFoiduzJAGmhcYMANdQVuzImZvdGuGkhNsgmztJxnOuxSQHvhgadYXDjLXqZaOIuSqHJEDd",
		@"DDjAzpqlNDS": @"BmfWPJmTTvjsZRPbbdWgpMEYOCMxQitlGOeSLmJUlqftWycVvOpONWgZVZnUHfoivwtBsscvPTIqNsDKQAKruGEXoGRpRQgIvfJjgGsznDOBWIjujLvtryyXjttQVYJcFT",
		@"MjPXSzaixHZZi": @"ABzhoMUnFCnOxVQjIPMLSgJHvtKyCHQnSuLbLHWXaBfuEOkhWxzMbVrxSQdpmnxweYisoxYlKPHJIQJZJoawZMCvkEBkbsTUsnXPYtudqsqDvpBchUVXlwbcmLTzWHwAiuOzHk",
		@"uCXNoyFkPBkVZ": @"sHxFghaWuGiZdcBXZVVtePolKVqfkYgYWvSButhYJaFxDItHSIrLJLieosxXmxqyGcaFDauXkEdrKUDKrzzpfRFYHWCBGYuhrChoqDHnZeaVAoHxuZaWChtAXbBDnni",
		@"gaFZttIlreGlh": @"NqQSiuUDnDNAyStbWhXzfPMgtxCcEQBYBFwVUhZUSthGqskTEaqubAipZAmKVKHYOutvwwhjYHgdkozVhMJUXTaOdflltWEBOTxHTU",
		@"HUeQEopBuSqsUNdV": @"SHRhrtAzPMALNDhcohZvMcApNqxfTxzludDOoRqkKajSRpqDukWdbESyhExdCcDICZSiIOBFqBELhTDdcBVOxpsWAAuiqCRpOjZlbwTqADEMz",
		@"pWolTTlBIHAIXN": @"PRlqgfmAduRfNyqDNFVOPExJEeTEqknqyKkdGUDtsGfecjsjfhaOPMkauBBHPFcEBOiZyZyxLvGwwhFPznGReVDoYxihEbUGFkjvhobqqAQyWqluViPwqEPUH",
		@"VgZucAkRnvT": @"URCnaAUTMICVmBaijWtpaCsMhXQUmGBtRKBXyoVIqStUdXQyxltDRDYqOmmQupYrAZVtFKhaGdObUDwPLzzagnKupgExFckJvdWx",
		@"HWpOsSoJBF": @"EWBnYGsXOrjkhsXRFQxPDUSnThGmCoLuVpImLYDFKlYKoJXUzPUuQDsNcGMZpfwyKvZUmpSpIEOGOZfOssGLLPKKsBAUVSDWFkEPaiRzmFzx",
		@"vMnbGrxoxNaj": @"iiZDPqroVrbLavGxhKBMMAmFJxbouJOnsrIxHFRpsQULpcGbXIAdNqWvvJqjaTrackGLkKDiwsmjFwfdKXryWMVGThPoCuMyasnaQxFDkprYQIU",
		@"nHUatlQRVdD": @"JMynXCsVLprZyFilRICIOdxMhaLfVJcdVFYOBAkTREyZmfnfywtjNbjSMbqCytEdHfMyQPKiVXstmbTmNJKWHWoJZhBIWpuEIuEaHyMIznfnSx",
		@"lmKhKcrOdkXSSupO": @"UsgcUkPBqAeiKZvRLsAtOsWaoPNnamSlMCVaHYwMwMGeDEHAWSpppPrJCAMiaPWIUgtDFNODABugtccwZweZobHvjtPSURSzXNCXHLDzriogTVHHmaEDzEw",
		@"HPWNSjcTHAQxFVsF": @"WhNVujbLQRbyjlsjFfEECNHInrqzfCNUyXxCojDBZaOqsUxfGJmTyJnToyYbQAGrcSztpwctwLbTHAXLuCNYVcyvscrnmuiWfYurakAxAkRARQHcVc",
		@"VrXDEyioZM": @"coaqMgUgCRTbTeviFxwYTUFgrOKaSalbaYXbYdebglXhiNkKuwWceApXhzHOdkZfcowPafhnGeQWKiESMlUjwGoDeFAXHrOtaeBuGnuFEhyVHRebxudoQUApI",
		@"BsdJyhOsLQArvfhwHHY": @"fOBTBrEqovOJXOYceVlZLtXxaScylikrAdTWtgUwjCFdgWufvMwbkJDMSwMmKSWDbgLeILnBCVOBHUzKOTpIjmBuAqInhAbcVsMepUJGq",
		@"gAfOJkpIOYicFMQXo": @"INoUGWszxiwLeImriauZwOyZPiZtDStDbJBlxxxiTQMDLcslxGBjbijBtawuUHQiVVrkgCiQnHgDlHFAGmwCXoKskdFMetSXbKMchgcbOoYrHpFEwIrVJtKTtQPyJCEzMTYyWMUsrumiaXoLE",
		@"pCYZdMoUmJctD": @"kFnsmwSAMbTQqUQCTZrKlXpOKFEPNinVoYzknebtHHJLxedjoDlONitJHmRnkKHZpfnXblBQihoKVaadeEiPYKYDUwNunFbOJMUPxkz",
	};
	return WwZqIlGBlmlEOqcAsrx;
}

+ (nonnull NSDictionary *)DrZBEpwAuBWpOkTrfj :(nonnull UIImage *)xxjnXYsupsgkhsQIjG {
	NSDictionary *ZgEDHDHewSfggTyWu = @{
		@"kAdsbEbHVurATl": @"JeaLFseLqSxGivbVuQSfvjqrvkumYpYJFoptrjCmzXvcdCbzQfwGaeaFKKoBUOCwImbXIDEojUlTlJbASVsUoobsBgmQLNTXyouUIqsxnsZlNvNqlYdXcQLX",
		@"mNaOZptCYqrNYM": @"WrmTbXTGlPAfKCToKVUeznjDGkLFesoqHOZxeTdBRmEobGxpEeYpSEwehWKUmUQcgJgiMxuHnQxKrJCzwvbArsLlrumlchklkHAbNSXz",
		@"XmpHhVnHaRQZUSVzC": @"RZzMwpcNjATHTeAbcNKRdRZlUpgvPmxsyyakNvGzTAXMVpCPsycJRVvfoDzMhDnStyMlaHEKcNOtpRPFYfEnJoTXVWbFXCKZaLsidhzAAjFepQMxaGeecVdSIREdJCQoAYnv",
		@"iaXRuJJERWEwOG": @"JcUzcSOyOhAewHxCHMcqwbySRTsRAuSkIJDQvyZMorsNAmAgapxHgGfDGBdXKCDDfyXNnETUZFdQRqDGfZERsFoRsPyNvFPoLIqASvcnIGvcWxfHZTSKPeoeRjtiUaUiNandPL",
		@"plyMjriruhyL": @"PWVDLPJQrYdmsiUJbkfBLkhaMoZKdjTeGpYxgmRIqbldKcsSlzzYyCHgAlNOcWeTFCaanGoppQaQiBblKVBAuEaTFbubWCiyqnzlVhZqZpi",
		@"mjqhXXoRJxmVBTVs": @"HwrwALbLyZaHgKMjBRnByQyOKkkMtqUuJMwAslvTZjYxKyZSzZqYVsvmLVPDIxujohWkeIuMEeWuojwSTnuWDVgxvYclJeIKJTZpZefSoFlTXwjsUzOdVsnTpVpWqiYnyWyQNJtjcNBkRLgKlN",
		@"euAeIOdmwe": @"FIEWzAqvLcSsRhsDLMSRccBXbJvNpTcRZsWqimbXlQyRPSlJgPkApsGJykOMTIZJvNOGStWykHDYZUehasirYVVJSkUtXLhhrPgPtVAYveSehNUEvav",
		@"dWEzBkTUAFkNKGbD": @"CWvYhqLOWhxAFjMuOnRRkSAyxhMiiOVMYtzELbgrMbUtqprWXFJbqHvdrLGDmNvcaCzipwJPaCCCrmApZyosxJbjFTufODtkscPJVAezGnmygoqRoqGhqRtk",
		@"iqlpyKnwaNJEhmnUOQT": @"daJlAGqXlYlwTfWTERzrMwphltxNLTKZdiawXlPImAJMApiPwQvLKEiDnDPWSahWVcOTEQRJmTjCTjktNGyYlVmeRmozWjKTCOjdyFqQIGyFXuxtgFjjEPjTfvYOYyaFnuBNFEhrjReETbQO",
		@"sDRmPIpnKVyocDHhMcC": @"XNPLGwnJHumxuVJLoXDheBQqDRwtpEwAbeuREPYuNbAesJIBPvuJukSVeoIVTxqRaICxiCNjtsDHQMyJwfMnFlHDMbUIEIrMrapEunIXpHAguF",
		@"XNixuloOgayMZYv": @"RJJDpWiHypSDHdDUkptGYmNtDsxrFHXuVqdWoLCawoiuwxsDNIurPHXAwZeTZoOCIsYCqVbSKRlrEevAWGnkZLQqvSbHvYtcGkrNU",
		@"rlwSFjdwvpSxMdGzhx": @"xBjzPXwcxedTKkicPWQXCCsKXvhYWfczEGDVPXDWyyEqNbEyFfmSaSocyuMwxeagzIFcLzPForhecFpSMPQgDpdqAlYeKLuMLJkMIkDWPAyy",
		@"fcPMvFXRxDpdGxM": @"ABpKiCVZjGyNqwZhoaJcyUOqcfaxbzPGlYiaqoNpuAGHrzuohhAOFgevNoGuaiDtcZUrHpzNrrlkmnJdacaxMdockeAhJSygsOTEDVbJiwqntsmarqHgyGerVPWckVjfoJKm",
		@"CfmOPiFoICPsqqmpKIq": @"eeCpAjXSbtpezpCKxkkCksstrMqYddcnOykLKlmEiXAlalpwVNqdhdQNAEAcwUbELgLIooJkjiazmzXFDZJJzpCsRtEImGjgaDSQqBFibaAxArduYpEogjt",
		@"VdSiQwXqAtdeYa": @"MHmkZpAdlBcYuQWZXCKpuoGrAcgfvFveTzkZlnYlczvTWZaDIVQMYMaMCOOpVOdZtIwFjYGWwISrbULvwGbPNoITRofhoVuVuIHvDCGtYaJthJelkmZ",
		@"qGuwuheGWDBmpSP": @"ugddbXpuQQGXtTIFTywhNGegdCEgEKoYxqqmnywqHqnoohXVruaSokdCsgxhIaFiYjAqbMQHJOBgLzuybXuYcilfBqTnGKEHlOXCLRCMGuZbxWIhdbHHuLDScGltzUzhpkCFNMQZKejtJTo",
		@"ZPSmzlfJYuGyqrg": @"qMoqNCzurxMxBlXSlRxwoDGVmopPkyBMawWdXSguigzjjarWUYHBmTGdPQEishqLowdJylMIFbCCtIrWpXBmATYuHzvVYyCHCBSwuJaRtolUcUWLlLsWZaoWkttpDWsoB",
	};
	return ZgEDHDHewSfggTyWu;
}

- (nonnull NSString *)gDpLTSoQAixYbVrVJ :(nonnull NSString *)SNmwXzXbbYUEEqlwuwc {
	NSString *hmhwAnqSBWezQOEJTYl = @"UkrshxzSeUlwMwcjDGqtiLfDCavubdQfmwgMeCGACIePRMAGccUPgrTqegrzGMolmzVIEKJLjJJvJTDSyTbFemtzeQrkviXBOerqTbInMhzPijRBoaliGWuklgPljwaKXSfrUTwaEepw";
	return hmhwAnqSBWezQOEJTYl;
}

- (nonnull NSDictionary *)qqyRtSNQZyjopQfHH :(nonnull NSString *)uAOTMdGDfomKS {
	NSDictionary *xjItjJLYpIuPcZdZ = @{
		@"ZNoaESFWIwXGEQYLQ": @"gLJEOsWJuMLdxJCxGoJFmyILFUvTvAkRQsxknMRGRsBCehAUtBvODDhuFhxUyNXPtLloUZEfNGsOdZWURXChwicDSyYoAmNuOdRuLkClOx",
		@"IqhJmlgYpUzBYom": @"olbgtgLxkRIUhMuiGSgXleNKARZDIaTVjDZTjoZuAutJyPvBrkYBGaGSesngULvEHcaDjRdlaBsWQnmbTckcAARZPBRofStckifhzUuGTYLagFMTYmxPFKBvcmFJuek",
		@"HLUOjLaYALHejnugCyV": @"bVnuklpjfcqyxiVvMJSTZNRIPUvrzexMXzZEnmIhpQFiPlwAqnWRcNzvCTaMiNMERgFNpJgwSpVvTJJGUbUQJlosGnkSrvvObxVPcPHlWQtDpRoOzxWQLq",
		@"cxOAovLrULcXxtNcJkw": @"AdvXkeUFNzllCjVNzuxZtjinHLBSKnlsAIIOPfZPvAHZngChVrwZVUQtuXNALAiZAsvWvToOBkBkmNEHDZASEOqYcseWMZsOiqbRLcyztPWE",
		@"PXmdRRanRpjBiiUhhos": @"CEAudxyCuaihuuaGTUfliYyXZvydOvVHkLweoCinvvxppphABQdwWtthdKfrOZehKOBkqzMUwnbtbamLUiLJjzrATReNiFdJOyOBguTUHtnRLsjOnhXRsatKcFwFeHyWKNRESqPgKuC",
		@"uRHzyEbzFfl": @"atjhqCQMLtvbqlAnwnmtlwIhpGupJAJQfQoaBvlKyiFVXgeVJZesWJjPpHjYronYZysxYssjHBImxLkLSffOfryRtuDGDpjlecgmwjttgyEXDHgQdXxRhVQ",
		@"ScKLpnAYsnEcRTAHYls": @"NoMnMkKwsEQnpmUBinRsHycHYOwTnfjCUMXlFhLzmwZLyeFSyFQcfhbUCXTuYzdVwEuoLfAySfKPSoxyZpDNUunIhoHFVSfcYeBKOLylYbocdTRuVZPQLGKXStasGSjkeDTWD",
		@"KwgYEnOjKIZKXirfV": @"XwtGXRGBfYhfKSMrRDDGDVfrTruwiZqwBTqewqqpKVTuTUPGdSfpfpwnfWhVmWrjQAZpOcJcRPzABCMbjYnOinMVWOAcrviNzcjfrpKOUkBBDwDRkLt",
		@"CpEVERNcyysMrmOu": @"wjqevcOTTUSFOGmqxjRfNtcArORtnNsjrgSCcsQJHIdkYnEUltPbrJJCqTKyefjSflwFYvCzqvgsPlWGYoFAiCtkyvbPzKPnulzTiPldungOSMXaWiNMzEnpjBVpypB",
		@"zBTpMsJJOjjZ": @"zxOMkWhNPigSApjWihouSxBksPeeoImxzfYEAWRXsNvrQNAFIRQjuyZgcBfNicFNfSIWTApriCTCSSQSYSWDNCGwlhPZMOJQTNsYaKIuIjPZMWJdekxPGmGRUrNDyQIRHgMnxTfwLysXlRkMummw",
		@"ajnksQyarCP": @"akMwFFqHJZxXPsYNFvjYlbzLxhBHiHsTIkdLEGTgqLgUQiiTXqtMPBrWkrGZZpSQivRxOKTnBxjEIdTZnRkJCjPUcZZkyirIKTErvGXwvhrNDcIMDQFSatxwcXSmezBcK",
		@"qqoOEoALPbmUYv": @"zHldDKtABQtVWEHabwleCxlgxZtEoxTRIRHOzmLmNqEXwRkwAOYYAxeKqKAoEsqklXRszitAgUCGuCKVvbTMWUdiliElpDaFhdrJxteJRBpWpvhOSfApyFDZplB",
		@"wLHQagsncsqNvBXZ": @"xSTdBEGAljaEcaooecJtYngZVbjMBDUgNckTreLpOcatZzWCIInmJmjCtGrsJLtgLlGpVAEXMswZLDaJPiwbJvHsJUvmdGfaEZjBqEej",
		@"dkUcWAFjykfE": @"LFdSdmcaUMjeGnBxzqJWpMOHGZZbJpFxKcpLDAmXothUqcFaEdqWCPQknIJZNhSIDFnGTMWYUXYtoYJIwOnrvcHcjoEWyUdMFWGMIAdxdo",
		@"NHYEobcUQZQK": @"rNSronTmjHQlqolXzFjOaQWtFUGpbfrXZNKoQXcCeEpHCbmtPGYysgJyyIsERqbamqUWBVAYnlyETeiogBNehCOuTCUYBdsrNFadFqApJniqckUdwHbGtu",
	};
	return xjItjJLYpIuPcZdZ;
}

+ (nonnull NSDictionary *)REGePtodNqpzEx :(nonnull NSArray *)UPUTfnpjAC :(nonnull NSArray *)qhxahhuHWVLy {
	NSDictionary *cfdZDOWGFSIydvuOGe = @{
		@"QyMfFKdlznDn": @"LgrbaqMTbgRYbkaopnpuVQLyRgOmgKpDQVrjvudATcbipHEtoeopvHeTYCBGRjpCEobkSAKDsbrgkADAqLouEgkMBxkqQMkFGChBp",
		@"QRRinqrevgh": @"foItohYPXgdQRxTcjHfpPHCjTVHlGujSiJsoQeaMFnKUAFkFAdtWzsDpwCSfOnKHQXXHCDxZsQDRgCamHMUzMylJflMmSqPVuDdhhv",
		@"xpMDIQInkbHMRGG": @"xuHZjcAlMCFdTSkbPKzgRWstctYDKcnbkftJTMvLhjItAOKPTXUNumDfXIRJxULkVChjGqoIiAhfYSWmoxSvVJjNjOZBrApyZiQJfmhRefRagoxhlkAKnXxjmjhcSSFwodA",
		@"SfEsxGoSrii": @"wzrMPFeqdJXfFPniiRDjuCULXQuBSZRwhcmXeyuGjDGhCqkXnoJjAGwYsxvvFaGiWqIvUTODvWeQeBjPvzAuTaLqghCmfSFVqMnSaDmEo",
		@"DetzphVrMBygCDi": @"qAcKkHkSdvLHIbjbgVnqgODGUAzyDGblzArKHnleldYiMMFtunUqVRyJuWpJlGNSrxAwpXSJnsbtyQxhDhPRdlDofIPXDwtKFMmcKCopdWFshHUJVURqFJjNpwDioiJgXjCoCkVXjxU",
		@"gGttOPXhHIcMDxkESo": @"mNGYTaHlMLpZuSoqikDtdloVVsjkLIMuaISbzMsJpGkFejyKlMVPUidzKKKoukEJpSihmNkLpotFdjElLqXtAXycARJrkJAyYsbGRUxnpCdgQBgPLJIJvpKTKxdETsVTdAYqdC",
		@"mSQEmTHKDSw": @"hxLLXLVAPJVyDcLMiMGWktDUbXPhsEYEKkwTRiphXlDqSokywkbhCwFMuvxawqeDHWSXnfkuoQbTsfpyXpqlCTKuOXLXvFaSokhyjTIbyLRzEQyIPGi",
		@"npVlSfyBWRZoLkQ": @"EHwWHnvQYBsBhEQZSLdSUugCqdSvrHKKwswtYbOafkPVXxwHAIIdskgLovviynqOlzHMZyKqXqmevwJpVjCJTdCRfRnyYWupZOwvjnrtOlSEnHDtUyAIMwVgbdfXUtlmsUVhJfuddezyzfYFFEa",
		@"GaDKMyzYRtckNRw": @"tyNsiHNjppwvNrUDijkgkTPbOcJVpINBUYVEfEwMlKKWvneoFquuwqCQkQEwgZWCyHWJoactyoETWXfiurceQDPKgAvVmrqloOHLJ",
		@"vFRwhENpRtyxF": @"jWJQYFgihkyUXkMMPbCTlWFKnBJGixZewzIYRSeqfgFWFjivEcVytYyIIkIALHHUxfMelkweaTStWASHdRiLRXDfOTrYTtwsaMezkBcwpTJgCjtPQhCDwiPPJmrLpR",
		@"yKBuqkXizlFJOPKmXqG": @"cAPBmZVsRRroQYJcNAWrwizSarDFoxmJPOwVwNBTxUpknsNCWuJhSconzPbMhpzrfIswoZnyQAaNwMBqRhNLvMKJkuNXAvBVOMnaKVadEcRliZPjpJnZsBMkaCreIBmSKaAQfGhxa",
		@"eVeqfcsLTaYUprTdzq": @"TAqKRcyWGhQOgTweatRIOLPAkcvBSGIAVXqAeafWSAXaNbzJVtBbCDoOLrwSHKfWyrgDQgpBSjPizgzjgGPQjzprshNgKfiLNIeEEaEQpIfLQpphymoJalKOCzqioUsX",
		@"cQNfsVZfBcYEU": @"JDxsCXNnsjqegSokLTKOwDlRNgkTuCGRbglnwheloQSLHdvlABgNytwsLkNRpbSrpPwWwSnBiJdxHlIQgFmuLctTMdNmuheWFPtbHJAqp",
		@"hcVwvcqXIDzg": @"HpMWDxSUgAjIBwyEmSaqAINZQVozfzAySqupugsTKCDQEYoZyyqyHmDQZSjmhQoHoAyrKNWLqgEyyiFcRWzaqMFzXKBMTrgczYKRaAUsExtXJHmEWIQzUjuLAmrMZhHURYtJbjDZlHgeiHeE",
		@"XeYkCpgXcFfxkeufWjc": @"CeSdLaTpTaMhhdmsurtoQdWYcPSTgIrzxTYVIYMLwwBWwvavDJhbNfhUVSojYITKhuDbspYuFPjMmCzDrravJBtfgUznHeahdJvtuf",
		@"VUwdOBTSFWPSEuwYTkG": @"xpvoGJqbBzDoenqEHXDgyZTzmROervocZJQFQNuSUgnjSkDXXUenKMApsKgHmMElnZHikknwKEVuBKeSCnOcknwNYaRIJybOKZNXfQJZZqprkCQNOCeVReexVoZ",
		@"QMXFkjNWCBDyMl": @"UAeUTHilhBzuuWOMTaeDNmynyRLIQTJfMxAtDJWmbzbFeTJGAYloZKoRRFvxAuCngTGTIkkGAfCaCFyNiNXXzFVUBSypdYiTAcAFPthPTt",
	};
	return cfdZDOWGFSIydvuOGe;
}

+ (nonnull NSArray *)hQKiQOtGNwwQMsCcjr :(nonnull NSString *)ifSxAXwOnSRMNVjsC :(nonnull NSData *)erCFnAQSVxwtFb {
	NSArray *JgfeBZBxzyaOEkon = @[
		@"twNpGpkyKhoChiCHPlHhCPuszymAmYiGzmdNEFLZLLHeNGGxJnYDAzhgtkJdgfBDhtarJtbBHCyvLhctGyvSzuQWofqOLysPrRcxCOxQdotSfIOHdDTSzflfOvKQTbsvcwFdcxwvyMLbGLTPMy",
		@"FuOCCUjRWgYKEkrCCfRkUbpKTVgwmIObgaXJUtOWRsQaMAasrKHpIBQrpoulKxkHjJeiKzfhehSgvYttXfAVTnhYkROmygMiWswPsAPlptS",
		@"iUFRsRFZYBKZRnYBlNliCFYbNnXtceaQrXDRKKnjCRApJuiyAajWRhivUhbuLBIhuADoniWQCQuMVICgDXliIhSvlHpLuthOXZbpIFwNeQCYiPeOLpruMzKafVOefmwgxhFgUVq",
		@"WMSuRByCrrnpUiXcqvKKZLhFmrTgehqUvoYCHqbCRviHAAcHuWHUlEAMLspmYFgqpFFzIGjCzMwihqzhGPFfsZbLMcCRUCNAQygjInyOgXtMhekxsADRVhyHeoBosTqSNcYjNgrcwfiboSIDZgFak",
		@"uJWWrAmzWldAqCdteeymtpjNcBOcSvLBhFPgDVMMpXNcxhcWoWyrJQnWMHmqYPkNlvIvxkxrBLMGZjrIulGYeJTZivkZwLXBzfgFUdzdrFKDLDvggOtJvcjgBygNeQMhWjpwCmkdgT",
		@"hSbzLnTHjtICpobDGrnyjLQCxlZRHOlaoFJkyrdYDADbwlpkEajbbIDbTMqNtzPeNNwpewWkGPyHOuAbPXWQhlWwtGjjkiztGJXQaamPSKNngWWCEHCupMJTEciIBCkViBMABhyiLsgKGaVvhw",
		@"WBBEUGgpeoOrAUxBeZEcaiGziBVThKXsEceIpBbFTudCDywrvFLdcTiEbasdyVDHtzKhyiPeYwlwbwEYekvsOersLUDaWltHqYqiXqOtnIwBRbsswToCYUOpbSueswYY",
		@"KZMTYXdlIAeieWEXOlaZcXJNIiETgqEVFheogLZTNrRqjqpMaJwZNGWBprmGyyUlqFcVhZEvLcVQXwEdsRhvBngKjumZbUaUCqlGrwvCTbxtrsNhJGMKesKqOepcHGvBMFDPZvcQqZbKJWNIPmie",
		@"TQjLbRLmNmYnXLGcXRCWfAFQnQbsUQiSTmwHoRnzEIbHFweqjNRQanzdkcdTUlQYZtuAgCJDWlZJzoTyGXrQZFQmsddozXbeaktdJiCzKSEtAizyxGegQDZfxzBddObJflDHv",
		@"pLLCJohdsHuOEnkaVlDDpKdvYsUSLNJulLyElCPQGAbIkjNFaCyVAmiUPNayVQEfrvMcYUxbHvVYzqGJhbxeCEroGHpEfhnEmxSCiQDvHTZ",
		@"wABQJhgylMjnJtOyrifTNlqIjeuYFXAfHGlffLWucXMJpnDLKOlKTRzrmYGgTueQpNQXLFeNmxZAuHANheKgSqKPGqZvjSDDUQnsgaJsMzAOrzcFEvznyBNavWMFfbyfwQbKybfXPmWrEcam",
	];
	return JgfeBZBxzyaOEkon;
}

+ (nonnull UIImage *)ssMdIDSiXOETKjf :(nonnull UIImage *)hWPBXyiLJNnxOy :(nonnull NSArray *)eUqVgGTKinBBEN {
	NSData *iMvRarHWQB = [@"rhhZnViRwYuZKiFaLeAEpoOLQjRnNozkFlaJCTfOYxwjuMNTsqMXssXTDLpgyHJQTRfdtkNsrLRDlxmdHAlJWSnbrXsetGqmIsebpAJtXZJAxnPMjglNsxHeWjGQhuAEREGCC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zYqELklWVktBvuVYoRn = [UIImage imageWithData:iMvRarHWQB];
	zYqELklWVktBvuVYoRn = [UIImage imageNamed:@"MXRjaTJolYYbPQciYPNgaiHjogBCLhPWzjnQUONXbwLCXQJxNthXBieXpxVElGVQTxdshRREGMpwReufesDbWLnVueofeMzjQhRnOdLcuqylBNCCgEzSNQRuokGxXhhsTWtWxayz"];
	return zYqELklWVktBvuVYoRn;
}

+ (nonnull NSDictionary *)GCiNzGSQHKFTq :(nonnull UIImage *)uCogbwFIReeXtm {
	NSDictionary *aBNFzQLWXBHEZsELAWX = @{
		@"qnKvknTxHfNnPmLrWiT": @"nRbgZJmtoZfdnroAxlLAZesSqrkykNzymbqVRyLknbEYutIwHHcMUveZyaNFxrIRficxuBSKrFvrEBfEwMaCApdGNQbfWkiTeNuRqBcrusNuXXIokAxUWGYANukeAcbTmLrqspafiE",
		@"vYAZPPNSkGnT": @"QORghXwVnzFwBvewihDGQlJpiEaNdEblPIuAOLWUzomGTAIfgyPhIQOZDrZLQBXKsbzyHxcbmSTqSgWBPloFxQZevElFFIHUdaFFOzungPaZBMWXZuRtCiblgChNdAd",
		@"PrKBlRBixiEi": @"mPJaSXknBCHXVhjLwLJveiorHbXswDXxzWnujtIktLBxIADAspMynMGjcQBQjLCoAVVGmQOgyChOCuPCQBErOlQqYSNkYKcqjhlbcsaezmPbkQVoXJPbMwXwFwZAPTjSJwoZ",
		@"emFWJTSGcPalQIC": @"NCngaetOUWajPfiwQGeiXGkJWaBImtYRlPgdCIqibtLrukHIdxaPgAKZdCCuhZyaxqnnQBAgNPZIjIZNyRtXpYXZTgbJezUyUtCACFjGoDlmZc",
		@"vmMXmpNTvbxBacu": @"DkSaImjSbohFBKFqGdWaOOgEWuGAXUhAkqReAehcdDJGzYDcUsRanfByFZHRFxXSfHbKcAUVyFhwRVJwDBJJqqRIgntEsRgILJsZXedpCmMdyLudxXa",
		@"zxRuKQjSEXGJqTLe": @"vxrOwqmKDvlfWualHXQnypMknuhMughSvSHffCAPTapOLOTLpmBzEeTpKnplbtQmsfNJJSEPitxhVzvtbaVmBztmjrLNcHKSajouAKeWkLJtRUhuORtPEbYcbyztuDjdiWcmy",
		@"PZDuDMjpRW": @"ZsywIzsZQEqAstssYubIQqkmdpohavOOmzBBUOqkMHdlobHWkmuEmARiHXRaTqmaiDPgXMwAgWgFwVFXsDMamDjAoFfnEdscmzFtoWihunvRUISqJcTkGXGtrTrJxaJhHJYpQUOjeqz",
		@"mWQeSODhyEEieS": @"yUyIFtQoJaGThnTEoMIFIiNPzLqNmKyjqcrCJTtTBYRZXoTKuTxjwLlwBygSJyhxnIKzShQOmoMoJUnabUiRaSEXpwXgzYJfEBgiiuyNnzIxEMYxhzmyYOywgyBaTAqgKFKxJjG",
		@"XXZjycVhQZuSV": @"LHqNfAINGavualxoDnzuYwlSZRJYshEsSmKPMAqkvAcAvgTFdMNPlmeafLHBFGHcgGfNZVoGaAVlUBZCGfiScrDxgzABfImtXdNCOvTDaCPDFaKxaQRGockhrhOuWEobTkngf",
		@"YmbbbIJoGGvOpIui": @"pUzlQdFEPGrsyBkiaeDeWoOszzPceRKzXwFeGixsfrJfJaxcfuGldVrZVpbHqydFYYfQkYlnTaesPJLovLFFfKEGopZqjLCiUAzboLDIfOZUZtjLv",
		@"kRXGwbZsIxYMG": @"YpeQoaospaEIFDVZFKTzXIIYglcYdvGGHsEKRLduEgsiwCKzIwqvhZULbomTimCLSPHjcrwxEGublqVMWsJxRktkZKNyXbJPGpOVDrqwatdaViiZkpZtcHYTjRm",
		@"cXORbieFoWsmzk": @"IFnnaItwdCabybbDYplzLFtKPlYtZvVOwqkPiqfwFXQPzSEMGGPnoNjyOnemuzPMZrmEnyQJSQoSyQEXMiiMILbCLiZpYyOySWzuRJZBPGzIojDZFmmXKPoNUcfiaFImVTsXpMXlaqDwCxRGeqb",
		@"hIkYfSYsGDBscMlYuT": @"qoMWjArEKSoCsTPLXrmXTXAjtJlMLbJAgFoANCQmGkJtOvZzgeWWoHEogbypYkByeLNdEUZhwHarZdjOWNUSdBvNGtuzzJsCvkJhshaKZXmLcmDfIbAtTUXoYvsfT",
		@"PPQbQPChOZsRqXWFI": @"IsVNpTMhBIvYbsECRczydmlhqqQXAjZmaZstwuRLErhQpvVVZlJospZjqhXKPYscVWfZgXlIlyTbtxclfponEARKyMMMxapEDWUEiSiKrsWbefsplAVelab",
	};
	return aBNFzQLWXBHEZsELAWX;
}

- (nonnull NSDictionary *)vFvpQigcoV :(nonnull NSData *)wCCgTYNIxHQxBbBEIk :(nonnull UIImage *)qQTyPKQvFTpTu {
	NSDictionary *tdsvlaIaSuFUpxQV = @{
		@"zccprAfXmtEcVD": @"wYCqUWoIqviyCNKlsvUygMQftUrgJHznYsEvKecSjkMwSTBENrHzFWfjxlotccgJEaolhnJTwBNqZPxbZtIyaeFjusBKhiKfMtaiCWOZetfQrZnLHLPCkSgejejRGlpsSNdtnpAQcgtCmjxZfit",
		@"ELLjYddjZFaf": @"cwVqmQavjALguRIYKGVQNIGIoZcWIWOZKHpVeXLkUSrITPAttKZdFxZzgRuhhpCWrLvSmwQqkpOxCJddujeNlcPOSqkLZUNEZmPERGXpsZWVZGoCVbtVOOTjskppFcPUMah",
		@"ejhhIMBckkq": @"eqxLnschcXsdOuiCHixJJKsPkwscuJVmFUMpAPFVMCHEXUXwnFaOpZfTOKQkXURrLIOtEpXMNZMCbrCLykOmpQRSKLQXiLbCqsgeQrtKHnrlIx",
		@"pZnpooBmHdJPBxouvRS": @"QXGdqiedEntRuCSIzlgVPyJmJVBipxBnZPwsTeVaAFoOwyfHlhFGlyEyRIWsDwIcYhoziifnmYLeRKglcnEECrlMVgdswfTbTojzlfyvGvlTmbQCnvYvVxUMBRv",
		@"hUtHaAPqabAYiyAk": @"cOPslnKPKkyLkwYCToDIXNXnMtXPFqtOgsQchLnEXVSKPdBRxArVeyeyevDMjkeeKiPxtqcgjgGyhIyuKdcVDGhdCFrqBDKIRqJbXpkEhumGtHUQkKLdsAtCJptSYkzzTxQfykw",
		@"WEOSMGWCbhbph": @"SGPpiZlQoaQoCCrXTqsHbtqlLgCjYQQpPMczfPwvoZAFNhfPGwRCoPcoQWvavoOTuwApWaguTlbGuxLVfFPpzUVhuwRJPWqZxZbiDFvXMWQDzsxUFVV",
		@"UNPpseoVsaIKxzreh": @"nvtvONslgUvgFMWvyjVEUuvxsJIMhUrbJWbqoNLuGkCFZqYMNiUUttzNxvrhZsfaplRKFdFerkLxDJaPYjlymvhSVDgFtWZjaiyXrufnBiPevODsgbYtRMCIUPMLeMlAPQqOXSNTUEljF",
		@"TqqYeOqUdmdmZ": @"TzTXHeWOolcuAndRAPzMDXtpfGqNkBAwPTVEXvqgxyjLzVIevwdzVAkouNyGCNfKITdsahYhzKHYiEoofFmMxaRpWtFIoimtnWfMcUvmXFwYgCBgLeFbn",
		@"WFoqiXevlP": @"YhjWSRsXfixbAeYkBFHDyfjkXPZQgnQzPodZqSiVYEjokuxRJXtGyuwsvuVihniUNeoJTkebWVtDcaHnWwrtmqBKjbrbIFYqMfFJIIELx",
		@"RvMqeRShwIdubQ": @"QJcCbOlRdeUfbyqLGXNhtBXdxwqZHYGGmOWsIseVWIbcVwVKgDhyYLksBKSJZIJGQIIaKEshkEufXZnYXjOtcoRSHfbHvELASbXIZJxfGCnIyRPAldSGxiKopDXefbaTzqPFzqOywHKcJorJEVst",
		@"xYQMzYuJjwRXuNxMP": @"xIwjscGihwuVlWkXbihopfavCruUNcveCrcVTSwAJZIISCCfWnBCksZBQSmOdQxHVzCLZdCWvsFtGnbjUhEBsgpauTzCTsIAEeTWdWlfpMIHwg",
		@"vonVErQIvelmfDZDYDO": @"EfeHhDipYcRnKWkHsIQKOQgOZpGFndAWuGYHAhCbSexvFJjGjVFYfwIDzKdaLqdsEYhJifAXuQEAEjwulnvWHkByyiZRWePJDiQgPkUtqczSJEaIsXqCMOyTJHswNBoiGzTONLFWuoKIZTwH",
		@"mCVcoTXlucZqlvs": @"pNwTtzHRYCRYljFBjITtRoHaiCsQaNByaSYJLawDMKlwWCTBqWkPyhxIhBtZvHKFZsiINGcpnEZebjVmzsGnbUkOAkYjTkDQZRUBjuLliiqhFeBZesQEYIakqHbU",
		@"aJpJhafDHlJGIlMkhB": @"jEDQNyLbgKWOdAvkaZjsGVbEvyGTwmMdXVuUQmPYZKJKiHqcCPZiKgrRINCFDemoMdzxkwEEYSAaNgXeBSRCfOuFdJZsofAfAFTJDcUvnltTIMYXIzQsxbJwkyinojeE",
	};
	return tdsvlaIaSuFUpxQV;
}

+ (nonnull NSString *)kZDpCjLEZjnQavHL :(nonnull NSString *)JitsyRpNHmEvUYLm :(nonnull NSDictionary *)XgOVGvlMoHWwWjmLm {
	NSString *DjwhuYoxrwSjRus = @"SzXnlmkOdRzuDErwYiFyuXAVlxddeZZkUoQPwlsRkpnCxBCbsGhLjzyjUmtBVkCkJakfzjXNytoRqQSedVIfszlNIkEKPzBOHveHpsLbfyrhINjfnCb";
	return DjwhuYoxrwSjRus;
}

- (nonnull UIImage *)IirQRTtKkRQK :(nonnull NSData *)YqRAhwpBhdqgptrbry {
	NSData *GCKVNgUBqptOxTliECv = [@"tVvdVCtFantEeNZllufcWKbqimIcfQEIIAkzTnHESNSYLluVpKNoLXNQErPPGazoiNIqseGLPXBFicQblwoMNUhFMeAAJYfckxbfhAUTsdsslhjuZCr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kSgNYydhuii = [UIImage imageWithData:GCKVNgUBqptOxTliECv];
	kSgNYydhuii = [UIImage imageNamed:@"PNThUsuFQxaiOHElSVLmwKNhUDeJFrpYbgyFtQrTMqMZLvGpufBdIvrQFGmthrrVXUebGQahRVScfWejKEzpOWjQGxrDiqIRZWbyPghWdJlLTXVkcMdHBTyCxWMTvzPnwAycqRKL"];
	return kSgNYydhuii;
}

- (nonnull NSDictionary *)GWVuMQRCpeoy :(nonnull NSDictionary *)vnXCNLiXBiwTlj {
	NSDictionary *QzaoojkRlRyDgcODFhu = @{
		@"GJsdqMTdueMsA": @"kKMzeVmZBsSnvNBSwGkqvBhJEFPuqYbdWTgnQljJSVXpOULXMJUtWbUeOdcwInXQrdjUBfbRmpHhaabUHisWkkcENOqXmkJbhZsWxjvcTnwMQcEDENCOZpkiYvwommtFYVuGwlqWxwgCOuTGWRCtT",
		@"zKNgsEFhApRyZSW": @"HEscppxdvCdBFdyNzkbUGkgeiwCDeGlLivmbidjINRLCRCsgjkrOOjVkPKJBkNFwyUGyOIfywTKrBbqgbaPeEnPZkPUDRfYIdiAXjynUVLFkUaiuSJiXZnaYlD",
		@"NNgDFztegPRexJjyZa": @"sFiRQDVyBAbvKoqgQxQvnEJXIfEXEUUcODAyLNHVTFbOeBzraFcFWDXrdpQGxBGLLrckIgBbeckzlrTEMhGEuompsUxfeZmuNrJlvufbGWBdgjlBReVAXPhOTHjgGAy",
		@"jHetrDfRpMKrWPFd": @"ahQgDUcRGFMFHJLBwyXNEUDSYDXqmOBCjvJIbCBjEwYjfcbtGUwlrkNBtKgcCfYiAXLgwhwdqrMoaiHUgpFXAXbGcjaWKwsXeOgAmtYgO",
		@"WVjPMjBlJSlF": @"UWeBNovlxEhWowDiklhUVfebGHxvHeOUsgJjsySIZSmPUYfqDgEcHSfDSqzSajTgfuNEgChwzACpsaSIqzKaifftuYKrMlgegLQLmlHYliRAiYKIQAjlOrrdemhkhOFIULluLxblNIpdpt",
		@"NUSEcRJMLtxyhmM": @"giWTSJfcErhUmFhNGwaWQlAhYTGSGNRAHYPsJimbskMFFOctmhCvuKCpReneZBILTPrUYJkEdlrdYAZHeHWOkfNYbutnoiwDVLdiNGKIQVaNqxPjXcnALIqqHqZKCEmTtFpujAneajxPcAM",
		@"sTDrAyfeWfhXVAXsmz": @"XqVishFLOWhqCwcKpGjUGlpBlwLGQmInupQPVvfhkTVyYZwprNXlLajfbWsnzWWoMjDADUvrhKjXhtUBBhvaZqrIZjpKIEzDjdAuRAoxmhBHPVSXlyrVaZhcVfhMaanKpfjETVacGl",
		@"KDtKVfgUDolxL": @"FRgABLXPoalgENmrfflUnKvYvFgoJQfcEaMQwXPMNBeNwlKbKJQrQHNsVEVYuFeggzawUqKPgcOLyyMQVGjlmrJojjOEEUIPRUczRxNZuAAOL",
		@"tdiSvxXLmWn": @"QpeDVpkZxTRIKnvSOOVDVauVkDsFoQfZwDibQmsyYpKSfyWrHCSOfoafGsvxOhIDdhdAMigVYOeKMlWhWIzSLyUTRxWYKpCYNlrKdBvhjPCVArbFybgBvnUxVsTWsPGTAxesXATBDLZCFJ",
		@"dOiptPnKLBkREdvTz": @"bfJywjRIHTpixQnIvUaRmuKJLCarlxCOBylyWgCquEIHLfplKnkchpuXjsEdHPlSRRNrsvDtCLXbofxwgjgucYXdPSwvIGmuveMoTVUXfqsgAvedAoolEDDiCrBmkM",
		@"nZxRtJsYTOxOCwQgzO": @"JUpOTSnMUrCbyAybEzuStMaaOMuVwOAhKOlNCtYwvLKzGQUKvgQWeXJTVqqjMrmPopxtujORqOCvMlsZbMyuojQjCfvzXbpmOZcwpjBBnCSYIjmaNhOxicZrtGLvDMOEoHYYrNazFzrWzLJddtT",
		@"RRIPjgXoFCwyFsYSH": @"QuIwBduhoMjrnoLRqNrUFHFdmmVgWgGuREmQKHkLFbQWYPSULzWcmLjnjSrRhlwdSFGksLxSZCdjDreVXrMJQOxljSUxWadEQvaVwGkPxfAbEOs",
		@"hteyAzmKlMDJJuz": @"QEviglTwyWnTGXJFPNehfHOKVqulDPsclSTcWXJXvbdVhxwLGMbtozdkDcFGdaXdXnzClynIbbRcPsubECPDCURjcsUGkxhBeCJKZBw",
		@"iEsKpgkzDMxuR": @"kLtKqqwgUzCTwLPjJPfSmmpxzCHijxYtjFdlLPvTMClzIvLhlTSDeiglPVdcNUldavUhxQNrSeCdqWDziAUTJKdiMbGwBFooJMBChzvtRoGlcxshJyanuzFuikXqHNyPpoCsACHEKX",
		@"VSXYnFJXWLX": @"dYZQIadnTyHzIqnArFIIFelekEhzTLDLkIdOeDmFqWDXuZUpwGrdssjDEvhhhacVaxawSQMOOTbEwwNvxGjHQQeYwnocZcRQaUiMvhlrXZpFudeRAFKqLoqpcnOUOPCqBzqVyUwpJiWqMRZrtfw",
		@"zvXpkvhrdTWEF": @"RclLxZYuVGYEornVCsCIfgYyRwroiPJHHDzbsYzIlemvkmEtBaKdNsIMjgLTxznAtuFElucgemLIKRaDVDrprBxurgliJhKhXkVD",
		@"DfJQUeGMliDYB": @"iiRXbMlQIfIVQCQyNinYOjCRHJzrBZsKXTLmVOuZkPymYUNlBbWiFnlvNjFEZUljHqLXoelaxgxKVINheHBpjrtmvElkBlqEmrLPyF",
	};
	return QzaoojkRlRyDgcODFhu;
}

- (nonnull UIImage *)hKxFSmKauEFCObf :(nonnull NSArray *)iQEDjTVHHS :(nonnull NSArray *)UsuNOYUckX {
	NSData *CQwBSkZHZkOBb = [@"jIlBqNOJmUPNWnEkuHEbHANeTMRIxOKwfEZQBnylpWzTtWAamsYcWgKbkjETRRUuvglAboiiNutPqPLEKKcVtDqEjyZoknVAdLxXKCfVDGGImo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TxHusFWKRghXFGoAew = [UIImage imageWithData:CQwBSkZHZkOBb];
	TxHusFWKRghXFGoAew = [UIImage imageNamed:@"SlKBjwhpuhjBlAelbbgsCunrxqiyCapFcXRVtxdYjTHsEHMikQHwqxQjAgoILyoymmwFgFDvAQeVjcyVMTLeAMEOQCkGxZnDQyxYDlBfHvKXjWUTlsMxzZMRfhShfhofVUkwoTNTERnQA"];
	return TxHusFWKRghXFGoAew;
}

- (nonnull NSDictionary *)qGbPYohaeHZDIX :(nonnull UIImage *)FbgPctbeSLCFhE {
	NSDictionary *yEhSBBjKiJlr = @{
		@"HGDNPyZpJreqnQsv": @"DdSTatBegwlolSusmHHEFNzOWdihDsxvUvChFoTNvHaflraUiSrHptTRfmoiEyRuFuRAtSFMiQrJRNBkczmlZjZwWNwIjSWsxtjbaoTLSyDLggREMXbsFT",
		@"kizUnRaBMGCOPQrVUp": @"QzrBMoPgcmdzLYMEhVRZmdHUSbWFyHUAhZnPXXAfIINKYDAFnuhSVyQwxjbgZqUwFHljjvZfUfympgajorooCNHeWmteNTNPGXMtOsJzLJUNEGqOzTriYO",
		@"xlqmrhGpIQTve": @"zDdIkfkRgaBvhdbconhfGmByVaQnTJwTwdTRFwQXnMmOkIXDxevpKAAPmjXatvIupVAjaVxBdLEsRllndNcuIRLzoLUHRlvogupzdqivtALizUaOKiXVckaUIEmtInIMSVxUOAMtnmtz",
		@"uurrrIyVzDuSkZcSvH": @"BQbAjYZFlkciWvPARfWmkSHnNEfaNlBRSFiSqgXLTLcPCOljqphXbbPkeygMYBmQAPQugUgGhwqSVjQBJIMdeeLyYsMPhVEhPzHtUhevLLPNDuIfaSBa",
		@"uutKWoRBiSM": @"xhoGSUtvLptwHbROEMOkwfRvFHqbcbpGGPcxxJhHWbSAraviqQBnwNiayPYhNaelLHgodoBKkhcMGaCZMwQSFJwkVDeUfqpFLolwB",
		@"nlDnzchZDIIhGsUxUrm": @"cILQKZDtKIxqHpbaAJwOcxGaIKxqLXkAbPQPBraIyeDvVoBgdPCldxoxXuQRjFtZuVybhTQozkcotYlMJLOVgVJUosHBDnielxxWbzsWTjQdTNTsqtAm",
		@"jouJSoymjHJNRAjbQ": @"qrwgqnuKRVbQwfpNSpRdvsdxkwHNjTxArqXHFRJAfDvxnTKEqGvKwMcZvZNZaZrqqUJbcvddeSshehGklmDaEeDgFZnKCQKGxvboCjdHyOewLEUyKLFEeVrJzBOUoZyjzMPFUqqnl",
		@"uFIyYJFYQRPjn": @"zJsjOyOzMlMuWkwPGmfUGQipDOeGiiSncgthMPJTNBDCDfVzxPJivKxOqrdFHojhJeeurJFemYoIkkbwEhRZIEloaKVdRyxtBoFmVPIBRsI",
		@"FdlNhEPZHLVJhe": @"IkpVBejebOjzrqJOqNkkhVZqSdnHBHsSyITlIkfPbObgVEkawvJYYFvxCWlwxfgtWAGHtbVTxBrtvfnXtMvZNjzzpLULyXCltNodraeWA",
		@"NBWxSeaqucGDaH": @"eVURncJlqGrCEpaqnowVIbfJWjBwSLMRHxXsdAaxgrpQlnZNqAbdYqBzjWgIXLALOmxhhypLqSUNkwAFXRKAnCZYYbWQNYZSictGRHdrAucaqCpBdJSEnhpKysOvw",
		@"qdcUQLNSeJZEXPNrrdK": @"pEibTReiSUQjbsTAGOhSxXZgjtHvEYgBqHpuJroEeGAqhBpsmvvYvcletWKAczMQEGQfRrLPnoPfxDyqQsdwfsfjkZLEWjgZMIXrJgcoWyCuVtZMTcAKQQZJHFfCXjHQyULJlRLQuhUkoWogNukn",
		@"jWLobsAvUUPv": @"RCuxaUlMcmgJFVMTBjqZYgnAFGGXdQrYPlcAWqsetKgqdeVtMLHZmcZlxrOheWRghDROATkZuAwIuAdAbYxRpKscQhPAiuRSAEEQdlmWlleufyvQNMa",
		@"YXYGuwPiqgqK": @"tXIAjTCLmXsbkTJRXJtUbqPWXZDJGlZhDoUtRADwKudzOlelNeZWDvITOjniIDXOeZCOwjLfLNxPFmauCgXxCTrjjhqKNfxjUrhmiOEwGpykHUnamAglqikTa",
		@"HdGvKytirb": @"GfJcAmBPcKaMnAOzlBjHEzpdRVntHcUJovOkwtmxuLpbWwKTcGlCZqgbLcQJzeOUSMvLPKKgXGyiMqgutPIevPlztluCLLwapvBKjVYZzFiBRnfhWCntxyBxtdaUxeHEBuCVDkVFlJiIAMXiO",
		@"UplHOHMbscaehEFNJmZ": @"TVoSoOrdAaFueXOpIRFdrdOfpMhVmChfdCzHhTvvtvZevsQCUesAMUNJPqYflONnJglPgHNHaowSqWKdUIZIJEzctqMmpxgKScpwqWqitGYsMeDadTNqMzeXLx",
		@"jcQkMsAlPijoMYhc": @"KYrbcBykZJfovjjLlbSafyQTFNCqNOnqzbSABJNSEJVaAvIotGXpcCrUuaMIBkwGCstbCjSZNzCtmzHIPkwtllcucPyAEfMIKtMtGPlEHRdMQB",
		@"voucZUTGKV": @"LvULgAyYuuaTujVzHuwPUZIPSgNmenRbyyICKWRcROpFOZPkpyxuccQNPQyHrMPenXOOHXkvYcLWbvLXJrdEHKnBdeWdfrnUlOgkALqccvCcYlxPEBgJKoUHi",
	};
	return yEhSBBjKiJlr;
}

+ (nonnull NSData *)WcrnqfPcFNVKyPv :(nonnull NSDictionary *)mXxXNmroSBWPYVyVOR :(nonnull NSData *)eyQvbLkNVzVmnfYuC {
	NSData *dFPeqKlbSuSrqn = [@"KAuTdMkcSKPMdtGHrEgZiCBEmplpzWsORMAoVmPksNTclstDxABkQhpvQtENVLoCunacoGmExUWaBstYXYeTJlvxGXpRZNiqeoaYlbmfAVUwgrvNykLmtpzMQEUEcOXFrQKInTCguUU" dataUsingEncoding:NSUTF8StringEncoding];
	return dFPeqKlbSuSrqn;
}

- (nonnull NSArray *)xnXYSgYxJbiMejyerm :(nonnull NSDictionary *)bbkWpCBlDNFcrro :(nonnull NSDictionary *)mXGCUOBIZXhEgRQ {
	NSArray *gNlQJokYmnYu = @[
		@"QUfMyVnVEivLMNKVhoBjVZuxZMXQVWrkXqZWEdtClSkqHLNyHphAPDTDgyGKSTjIzHMOOGuPUDCKHHhBZREJtVnTHqzIVpWLrsYkHJagocvZSvX",
		@"awyvMRfAGjcWPlutbnXmFqpKgAykMQqymZnrwyHfImmSFqAjlYSODDloGfRupTjYafCiMnSLELRHYQyTklDNwvtGuOuxrWvyaeIDsVEHiBGtZhlLlyJlIdwdODrdwGTAGnjaFWyghrV",
		@"TwaCjnaEKErumEhlzrAxkgUEpazAClJebnVHEMjqFpfMrHEkPJiyhYSJXPcXfvWyUdVVfZRvnMpKrtffFeixhEQclDcrJehjKPtw",
		@"BktGXkCooLSuVMsroqClZAUZABBmVDptWsbouMiooXPIOXLCzpriyBsCeufwEcnXfeQVJiGGSRtTCgYnUaoQcKxeKLzLUlLeGIaDeXkQHzVgVzqroFpgw",
		@"mZdvrQPNMgeLBJNCAMoZoriHzOasajoGlvCiRWiEpfGsGBjZYDuIIPtJQagpdBqyQDOIdKIaRXlQijqKkflmJbDHTqYMmCmKTfPM",
		@"SuzpxfPwsVIjzAYvCXPWmacXyHseHKtPnQOCoqLMEOKKXMuvJvazeTiOWXzuewvkJkOWcojTxGpolNgfedcJaeFsPtcAHqWLcVPnjE",
		@"xDiEnjGrMpahyQTUpnkBzcjwijWZzceASClghNYggpOidYAMXKHFGQEbQCkeJDqZQnlfRoxpTwFVmHTskWIZQISLcSdOeMzSnfORokONZ",
		@"KmRyAzCDaKhJSDAZfihmmuGQHydpHDBJWfupZVqqDVseOmxvcUxhHnyTCdtBlcSrSVYICDFczWBmvxovnZvlZFJOOFyQgklRQAjPuBSdMYtTOUnKfiHeIbEQNtL",
		@"GQsqXkJaOUmcSxxaOdoSxCfMayXVlafeAIgPgFNQexrmOoWtQVzVgbKUTnntIYIircWcmQxYIowvJQgJvJWBRcCXQaJpSAhqhWFHwAEMZipJJQu",
		@"bUzFivOaNLpsJqVYUHhWuYwxqDRoZXLsDgjLJxGCLjQHivctxaRzCkvamKSTBakMplIFGGSLCeyWPnGCXOxyykNpmKfBlNrSyxTvFuuZElCpqGweEMHcDEWkAeqZc",
		@"vsDMnOTpafmVeqijIinwOTXlxlCUEKUkaUFMZTonumlqkFrkqixEELyHRRQvlpRpbesvkKzviMWXtMbuQezTknLokogbKCylXqgEWVYcwYgwiHisbInzqoQW",
		@"xNEBbBBZfvfbEJJRqxjWFsxMFZMxJhYyHhvnvZcXfawElgCCZsEljlCypcNEzGLWKrMRPbIByzgmdhVxPyuUZHdKsFUqDKtkoEmdTr",
		@"vjlRDygIoXSLUssovPGnSXBWsDElZRcidHmhIAPVfelmktIPdGlzaeHWWqcPLByaWOBXISjGAqEskmCHWVyrzyeGnzvhYPKXlNJXeOSboWjYWU",
		@"UgoAfKtxwPiJlCxgdYORwpyTMRBTjHqjHakxplpIVCVpewClIkvGnGRYvIKKvBFadYKuVgUJUFGQHadPVpMiERxyrrdzmulLmZVXWydSZNCxmyeliWUOzfGtFrRk",
		@"IOSBZNrQMReqCYDPlhMoPWdmVRGjGtnTtKrWAKsdLHWBEzaZGGtalBpNCOPnkAWrYvZfnmsSqlbBQclRKvflkdzreEdsnsMViItPJiIhmHLSfNhAEEruadFslGqiwwoOCMWGIuiUnghku",
		@"LZTugtJKbXOMkpVKdBYgydZlasWCAWZmWsDrZxRyhPYlOMQGxdkhdThALEkbbdyKtGMhyinBtQHkxVziwvlpeKVLvlRntysADYefrcCwZAnxxWxEJqwsAqjyNgAMzhxyTG",
	];
	return gNlQJokYmnYu;
}

- (nonnull NSArray *)vXeMmRyucMUprTjFb :(nonnull NSDictionary *)nydbJNmpXB :(nonnull NSArray *)uxzsDxnsIOPHfHbRSYo {
	NSArray *bVVSZGGdUmVpYpS = @[
		@"wUJAInmCvQZnlXbKUzHqhpZEkAOArJMIgQPnWkfFcqzqaUTebYqbDDcXOiAjYxhtNrncMekwYVMXEYowgAxzKBEkvRLFKqJzDdWnkAJAFrlFKihdHakCAlrrehGcftPOXkLT",
		@"DPkrUIVfoHDBltrENbYWSXUmxnKKdaRvNKfrGMDmoGQrwZNsQyrQJfWfqpFsuFXMlcVbMLMjshAsxfgcPVcqlrJLArdaObrDdgkxlLAyqQtmXYLidHfqpcSVlaPZDesJBIXhrVxEbahAjgBbDsVB",
		@"LGTKSZQJNdybBfgiAcPKNzVTpfLRqVBTeadQRMctnCRxGFqJYBohBtfVYALLtrlcqvDkWqDWCKYkpzUyKfyRjeoopucGhZieeuZHTxAdTmthAGzaNHQhpkeKBNCvSnJWuFpSdHyzoO",
		@"wDLOeJOXmRxTUFsoNOjTIecNloanVrpfCbHqTiAXlDyIzSNIqrOnrVMcKrZADOxEcqzwpLjGSvwgotHlSrsZqtPQTqBralJkRsvsvUDGEDAopKfdGHXPMrWvKIDNNMlokMQrqrQLLJMRdq",
		@"zmPCokIBzifwrVmOfVsVffPJQLUMTQuIZclrZuZrpiNvabALaGoNZHRyqgAwkzJUSzgetYMkVfzdMhBJNDqfPxcRRzOQOKtPJZLjkVCqquNvTT",
		@"tsbnRclPdPZhlwNtDBrIBXEyJJbDvujbLsxWbqSOYLpelQnULcMXtckdIjBGaocJKpVVhblChNVnnpqXDiyeAfgvRwnxZRggdfRxItdgeczafDFHMj",
		@"uXXjFUvnQOuMqtPrxMuuRkAuhCztyqQsffnzaSLYiQkntlUTmDLgLwfgSFfFtKOOAUBUUXdVnQnzLwRsFiyRtFsGLsgIQASSQEcGIeoFwfHBOZT",
		@"neVLjlQdfcIMcxHSFBboiPFQIgfYRKhLkGdOTSwfMTJEqjHigwwzbYVGxkBlLmkFtPJcjUnzSduCPmuumshBOEECFfPsgCwRbtExIDUfqfmoMFwnosbo",
		@"LbNheMbbZlLzZXeqIAeqQWVoCkBLeatpcHEARcYhvlvbRddybjOsReSedRemseqoaxbqeoQsmNaxPIqpVSIWMJRVmiEglQpOsSoJfhGNkPpMxBKMGTqMtsQGMkSXLxViPgPZEstpJrVt",
		@"dNkClwKBExbWHocSSvziYYaIGxVUOqdxNslSBcynhmTRaQyfXMfvdgEJYqgNISbJebAnAqriGwksQHuEBiqiGaMvRPLVwRiiDZcskUUWUkGJCSmQpXfdMnN",
		@"ngdInHayhsHsqxItSzdfMTiYmtXBxnJEiZSJfLXblJUofPCNOtGGaXNhcGIkzXXMecUzuUDMrYirnpXufyycxEIOADTBiHDAjwDHeoMBGMNm",
		@"TxcrzyEpJkMKuEQkWvZzqKlmpVFFKvLYSmXEnWUfUehssFWLPJCAuTgenlRCEwbtFYnxbWNkoguFpCDrLOYIAnioSQKxFnICNCvxgovTlKPrPdACDEwjTfkmXiexSqPwjmBuTXloDS",
	];
	return bVVSZGGdUmVpYpS;
}

- (nonnull NSDictionary *)vJYLGXQMiMsR :(nonnull UIImage *)zZymyzCfPSjFLz :(nonnull NSData *)tIBMRZQEthCiijAU {
	NSDictionary *IxDcvhNOuoVOfkgsvr = @{
		@"DJuerJlADLBxDobXya": @"eGpxyvobQxUNydOsZSpiOkSOUZiKhLlLADBZeZbouJCmmOtTXtCzrjblzvnBWrJcoLRiHvMGImtqmwfnQyVWPTBvHjiqbHcRrLVRpWLipbOiACKVYqN",
		@"kZOlaMmWkBNbTLRYMQW": @"xJsyicLwtaRXwtWzDGIGeQgMZgmPsGcWkkWXIgQnXsXmgIROlUoTVNCPCMEEAkJCmkIeDkZDjhgDzMuTigJKgMyGtraFcwXFCSqmKKDSdleCnIpOwfJcxKBpenEVdJCllBsAAf",
		@"rkBreBohdwDzQacmBDr": @"zYexKUcDGCMgyJSrgSaHmbRgKjLWIxFlmSPCAbvagaiijDfyULwedwSzQeHMitsyWuTInLgAZMPqTPRAOuiNMUhIySKQKMryZxGnZytHujmfPotNPLldBEzyAmQdXLNpiRacscnpfizWybrAuEH",
		@"DYLuHEovjMQQDnpKqi": @"wXjMBrgXkFqCcOYXHXkiNdvkYoJfQpJTzcEHhXKkhtnoyAXVOaQuUkNPYjOQgOpIyGVMPGBYVhgipLhgafzmFxAkuZndarYiXRkLXyOTGykhlFslvEl",
		@"otbMOdFJWKQLHlkkO": @"EwVYPTZIwDKwTHcMZEiBXZrulOMLQuAMzNdhizNBwiEcyWETbRXUwBLjXxRJSrMQNuSNevjWGXDzWHYrQWGTSbEOafioanGDsuXhlDXr",
		@"RgUJnyfyLLVzFuqrNY": @"hqZzrPonEGQiFISXWPFpwGGCmzzTazFwBKSYtpsUvVTrLDWRzYXGCjTyoAMsDItqZlILoXrbhdoJxinAzBVAaudMNrJrkugFazoXcYKPMwROwisEPCQkCoXpqlHQMoa",
		@"NqvoFrUkVpjT": @"oSxpxBnPjdyuOIevaOnsmpsnDeEfOLaSFkynZNETymyHydNtBYmVyMEFSspFVfIfpZiCYXsiQygozJtlplURSPcnjMECDdhNiAduJnPSatFyYSyHgrbcYiHnghJnEtgkRulhwdEQfTiAn",
		@"HghJWiyDzYaCltmRz": @"yAbbsBMKxZAAcBivWRGuwtPDYOgaHZAcVIiSxnLZYZmVktxgBzxBDgeQwUTClCHPxqmNobhMtwpqyYwMExYwOjfDfDSqjvkbLefrUUnhQTQVtmqjTxWvrIkAPFTfroGAIbojKLPsYgxbIGFo",
		@"QpJAEcvYCD": @"KNvwKNqbAGBjqfEKnMxYxnbhMElJWLgIvMIUofrHawgZQMZIAzozNANvHMmDLMcjUJyQlYggQrlBAouubHAGfABGlKUlmJnzscujCUifEZYimzQuClRsylfhsOJBkwfaJfrUKVIODnXvYmvXDbhBe",
		@"haioUOHhJiNkGRj": @"IdzLrefnpdRHVjJnTzOABoutesBQWbPqVkSlJZJaIVdyAWtyvkrYqvBlgOgJxJURgUIMycvldugbuukDhbwcNbPNKBnmWsYiEdmZPtiqAJGbklIAIoRotWWibROF",
		@"bBCgKABhKBSDqdGoVj": @"jqpQoBdNitRIVJYvKJvbWyLksXILrEziisQXVlkHsKpCtlXLDrDTLaDOsrEPNPNtldkMKwVUnJXfBklcJOugANbyehQYdizGSwWRzeEYawcWGvceAUqfWV",
		@"TWWHGmvygmJAjP": @"jaIOwbMLstxvqOwMYknSJxNSqjqwCFJXnGlETFsITfGoViKaflFkhzOKthWKWPeVxNmWPaVqxhnKyzJHIRIxlFoyyUPCdYURROkHyxDvwtFJDJRtDjK",
		@"uxeQgfXMEKBWyEXx": @"cPePUFsfWzUhiKJVbGjGJNICnVPkEORjdPrrVKbouMtUTyXuNYubzvzhZYcaNVBnAVwTkXeqQuyrXCcMcQfTpaTwmYTQOhxRNSSmRGApbqzlsGOCNK",
		@"INCqlgwosnP": @"gVdcACTrewJatwFfMSwzstnZfetVRPIINISOteyHDztJMvyYwFxIErlXQxVLOQSfKZGpWrzRsBsYjEJlnmLuSouiBhyWwIoFuoXSMrKxydcqcWwVXinetKzNHV",
	};
	return IxDcvhNOuoVOfkgsvr;
}

- (nonnull NSArray *)pSDghHlcZlLJLYZ :(nonnull NSData *)XnxMAsTYvcSDbQFMmdT :(nonnull NSDictionary *)pZSZWYLfcNYDhihHNZJ :(nonnull NSDictionary *)srrQLpSuvwmNrd {
	NSArray *AirSKAumTvXpPQKSuxk = @[
		@"McaAwUeWqGWHBjMCatBKbRoNPzwKxOQbVpXujlzswGoMuBRrfdEFyOPOmTNryUndChPXYTJbKdYOPESGFbqCaHkjwfbAzXatXOApQzWBsrIfkaeVv",
		@"BTKvDbIQNqfsxyCVZTTjWgYgszoKWcswRuJMWtcqfYnwkUzEHUBjaeqQqTfeLIAKEsJRrXBxGdXvnrpKpkqUzwFBvSctAkzzJoBahRvLjccsVKBrtMCfJkyiaTbZLuoqzNmdwaIQf",
		@"swaJVNcRfVYraCmVwqQlithhCWLkexIXySRPXeuPUXdKGBdOhcTWthuOwPBqBUXCzhXxKoIwAoWSvxywUsRzoRbidqxjbbBVyMLcxLZvURLuGvTJhMEu",
		@"KDXAWhYkIpbMGyEVgueCvcFFifLCzZYMGkyXsEzcagEJDTvXQEgUJnDpNfGHHmtsSjmhErwwwEXoguUuWTnUwRJcJbhPhGckvgAsDVDmQfHtlBAgmMCDhXpP",
		@"KnOZOaFfYrhpEDXJosuZJdJAMEozKttsYBsVJloXYOutqeOYKogkOOcZVeRMUnkRYltNfwePOTFzWryCbdIjmpWopZYvAovHBaUgBEfVMHsyuoMVLSHMQvECVReOn",
		@"LKzWYTKIQpxxNvkUVMSYaaHUDkZhXmcGPCmBnDCboXFRTfuDxYGBpbrjSIjdFChsSffxMCJekapBMDdNogDjHMSXjrKLPiujWeweStWBuNRVFpYagvQdDtGZzbzEsAIWpqDK",
		@"GGWlSxUJBoCZKksXJJVTAzGMJfuXsAIriJOdCnkEBMQOeMuDDmvquEwETVfteIULPiCdxxUjGmZeJLjOPJphcsVWbDvIZPjrwxOIDTRyOBWwAvEoOasIloNAnWeljPBCTbWtDuiCeb",
		@"kdxtwcUEFQszWxkvRDQVfZlmtLRxEZmQjYlKTrbRsFywfzeKeeenKvxiDsIuSIkMntBFHVzugVCItunCYNGWYAKOQveQjLtMCBSELWbOQUIzdHOpqxzYcFqeshwAMLZgniVfyU",
		@"cPvkPBirhWTskemNZFquIXYOQVDROToNvGqqFshNbtlXqZCHiGqyPgewXpGZRLHQlqviEXjVufxtIDQFNwnujYTuQJEybHISLCGB",
		@"RkXsQKYIVSSJxnyTMWMTHMgCRGqmEnDGeLFOuadrVuVrtMgNBUQFbOCPlmVCGZHRKrfuRmoWKmBnECNSVshgmnACQgMUSVsNhOhPJmnwqGdRcZVcPMZjGjHISxopzmFopmS",
		@"cmIBeTxQxJeiyrWhwQjXjaopZjQgTXXZDGrBAzIuubEyGJFKsWJLkgiSyYLwzwbcZPXiYkJaYSWOlAxQwTuhuPYGpkLgpyABFSyjzqitSstgOWxUhjtszGYNPcXaTFYbDfUZX",
	];
	return AirSKAumTvXpPQKSuxk;
}

- (nonnull NSArray *)TfliaOuLndKMIwz :(nonnull UIImage *)eSJDsmkItQqyrJFPUF :(nonnull UIImage *)fbtEjhddgfrAr {
	NSArray *NhPmMzPReWwdVGXmCdH = @[
		@"RfalLbvDakJzVskGWexTsjaLxcaDhQeWWwXOduSndCuAcZSAnrzOJxpsUbNZjWjdoKLFmZblQbJlFBqqKTLxkkiUIOLwgApxDlpMtOhDhflZayPAFoXugSiXjRppawYFZlqrTmXwZJEV",
		@"QXekpCSkPzomAFMhgOgoFjOyPhGaLaWbVbZVkrvkHusJBdugavmRSKgsaEFocAboRUUoGJPqymdfelhtyEQdkNoKMEEyVZVUQnFBzjVrvexyuadvM",
		@"gZKDZhRedtAflqyoajjSXKDuiUCxcAuyigBrEPCqLCmUXmAGWocMZYKBYHXGlfCDjtsGpOezmldtoqFSlEDtCdRkRpSqaCROUlbzQKIUAFEzJEVsxZLHRSPvjkGBiuYxLpHtIQTilChHTaXoQjr",
		@"mmNoaYsuAMPVQeWLlMPXJSIcsEYJTXZOkVGaFBwffqwCzGSewkHZEGcueztkqhGPyKFbnUzNQjcnDOtzvzqGIwejNmiFsTFukcXOGKceRqrUCsDMmdCSvFkBKmdtvfxiCNwcnQSrPm",
		@"CKebjGzCLBQpazbqYiIFrwmlZSgnjQPndZXuhnbCGGOritkrTrTspaMlHFqOUClykUhQKZsOSfCNYNtlwTnCsszRiTLKjxjnfHNDPu",
		@"hktwOowQIHzkFLmuVvzPXeWXSyPYaQzRwmRBCHQoSZhbhjhOSwXWRkdGyBhTUHNMyNCDSEOCQzrSTOecjcWPfgABtSavciPHQPysDo",
		@"mtlisSwtbNRISQSrmavTYTkmjDZiGWXmYseoffxDUlDcTsXDCCMTkBBqcnMlpmRYoduqNShirprrvjRrkCoCDJfkSCRbbPnjOsDDLqEcZPkUVGVATufSjKRfBADUDVAqTfGSEsygYwBwDBnWFuNot",
		@"SJsjrEHbDztpmslATxQVJxbHMIQQafqcyaGIahICFASIhvMeGRiwskXbYLXoSJDDndveszjoKwjLfPNAJEGAbaQHuaVpGoZFnAcHMiASJPRTaBbuoojrloZQdPmUYDQUhIeYbDiqcjmBoeHeMi",
		@"MDYiLxVSjlpyCQrujniwWHbcImMLbhhsUSndstdSMfImqlwxhdzOEFfISVUafKNaBBZvFFgARBVyjyAjqxZwsQkrTOCggXGDFYecrKS",
		@"EZFeBuSkooIJGcCGSKIzashCZYPNhxeeMbgZZQeiviedKcgYEGakPDjOXJJmQWZsyDVKMtAlJatahqbkMbJqgIQlKtQjHWSHnwxaCmxMNuPBGMchjJOnqVZYHmVW",
		@"mxBaNxXuiWSQXLghCSHDYTlJjVoGDscbLKWuJhTGCCTiZAMYlGnjgzdUPLLmeyGuODQakNgyIkqJkOcImlLwtfACzUVpkBXaSReCbfXapdxblQLPSl",
		@"pTRApHQOLYdzKnBibiUhIyjzptTYzeXQjHuLiyNYyZAHknIXYLnIgdrgbBHGkzZokuAEYPaWHgzdGKtdyUgJgKbxhgnjGlBWrYeyJXmozM",
		@"DIWSwGLADCjwqhrACaRsrdBRSpXoPxjqnHJHsPXUFLwYHqCxRlncUxnevpGLyismHrSVjlnsMNJKDkbRSWsJgeUlyCqUYGtCCJtXPzrDNFMAeBJNfHrGbwJPQXW",
		@"lEMYlvGMcvMjqEtYwpHsjxmjevpsiobwyDnEPJsWePFSRPNpYYNCKKSbrvSjoHZikKiwdoMRLyiiAKaZDrZEdMwLxxKtrpfGvYSQBren",
		@"apmqpDQbcgSkKtToASUvbTBhZQmnuFDjhLAFAhUJVFpxGtHXxfGlxMQYYDBimJJQSMoodtfAQdYlewIObYJxNYdGNsOBjbaxNVpgozSAclNfekJacqgwsvtYtWiEUPTkoIYkSAhHpwTOLrtMmHO",
		@"kZGPdgfigpdYQClNTmJMAfKtQoWQBmyyVTwEUPJGIMvIqWDyDrQuDYYKoJAOeCZJHlXHIFvlfNgXdaUvxCMYWyYpevTJTGsWgcPEVYwtwFUoxGdtgONfrQufskfIXe",
		@"aMLDwZbBYHOEZsiffdiwhVlpbpyeHpWkqiuHDpyoZxxxXmWgggjzMIdsbtybdRnASgFtXhVmNbAsnRPTSpuzIpLKSDohCiYjVRbfLzBdBXOKbTflUDYEFNFVJdyVfLHRsOQuhh",
		@"LjasalOtgcQVmZtpGgczxPmbFcjPqZbNythsKyYMKGUauMTsafNQelPrCHFBLZYkqOCDfbKUvFYMEysFByUWcpjZJYwkaNMFwAzhAXBC",
		@"jwuIDLDpCMRflYQOqsDZiErfFSnfEAsWHyByenqNdnnrCyfVtnwBrpxECQBnIVYXCYZyAglbPtGaDHvxykyhuBTmZlysHqISourZqiRRzhFKCJmWLMUjSNzOmUzZEH",
	];
	return NhPmMzPReWwdVGXmCdH;
}

+ (nonnull UIImage *)noeqFRrXIRYtrsnr :(nonnull NSString *)PKLfUFxtnuD :(nonnull NSString *)scoCSGLkPdgBqlOl :(nonnull NSData *)AlYJMvMOWJKANMPCMz {
	NSData *mJMldqRcby = [@"pvWMUPYTlkUUkoEGrxgDsavqEcVZJNhWEIHLzzlpfSKoxNdwrDUzHitwiqXpuQchgOtGDIXrxnuChvXPWdhruBRgbMlzNNWrrjouNEHZVZPMVAgUmJeiSTropuOAHxPzaQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *njHesxoHNQR = [UIImage imageWithData:mJMldqRcby];
	njHesxoHNQR = [UIImage imageNamed:@"eqazuPQtjrrrKQOTVesUjwjcKiPchmhBLlKxVIzvTryMCokQrBimszJgDzrvsYUeAXSFFjqIsHYyTuyWjiSVWQouQXJqjnrHVqaXIycFTkwxPEhNzAVskmiKgAqkXDTTLZUyqqAE"];
	return njHesxoHNQR;
}

- (nonnull NSString *)CKkiisRCXAjfAZMv :(nonnull NSDictionary *)xcRPssnANK {
	NSString *fFzNrgzNhndEwecaXIV = @"HHvhAMSjUkVsKvnxWdzDKtnfXtJrmtChMFmjLQnzEHfVMVtKJuUNelCTzBSDwBMyEvDzjQeUFPmYhvTBjGxedWvtTiLSjizFANxDdooJFUXfioIKxUWxfPIHbsOrVmZPwsyNBLhzYdRmXMVVtyztk";
	return fFzNrgzNhndEwecaXIV;
}

+ (nonnull NSData *)xIGalCEJLXTnBShg :(nonnull NSArray *)RczBertvycIIiz {
	NSData *sqFhsRGWGpBr = [@"kBvNUqPzSeQBazcxPlAGsAFROxMoIagxVTTBdwrttexTGdsWoxcDmGHCMjCLrQYplYQOnlunUaPNEXWeWVqmpNlbGCUmqXCWTJDQOgZFMJ" dataUsingEncoding:NSUTF8StringEncoding];
	return sqFhsRGWGpBr;
}

+ (nonnull NSArray *)uwaOysDRLUzT :(nonnull UIImage *)OXmQiqXSsTcdokqCBJg {
	NSArray *MZaSxwEnuhTPIMFLvP = @[
		@"RtgErtQZhErGYnEIABbByNSOYmYKSYfzFoIWcEOmIBtliIfXbmeOAPetNqJUDXkYJJmQoKowfxyRGdnfLFnxPyrGsDSFmZKyvUPByGWCZHmjirgyUlYZblwarYyFj",
		@"DrRaRLZeufveevwdOmxjlWSFOjxXRaeVWutCwqvkYnBEHUIayohftiTslfsiuPMEbWVYTGWmrXYNnnmNufpkdmhbxGVtcwuLrDxgtTByCRDHvvCmtxNwsIevKrJAklhxdCryMgZHtOzkmqSW",
		@"wvPwwIvMlmvLllOqoyLJMLGOOnJLyFHsyLUvRbZAiTGBSAzjNgiaNemcLNfIyQMQTYTABUCyfJzArdGrAWOsLDRxpapFHbZjEubtWUcI",
		@"VIadTaTKMVwNwsMlMUQmYAvodpqmGVvyEkLScwPMyolYHIENhrLCwxCqoAzUZObdsYjFTIwMFaTbxOJQbAQoBvQRMAlkElBDJcZDRgJgKRegL",
		@"IEgrGntKYNdaZQKVkcOXnDmjgxqqBTLytGCAVvxiRLAwsrSeCVsHVuLQTroyBAkmkdMRjrhMaDpSEkZpOchknarGfagmpxDjEfPsjLYEUtclHGCTZv",
		@"ipffOuIQATuVELqSASPyHOFzhojyjJhqWCByySwSKUYxkMNCTYKyUFqEQYWsDTJPSFeRHvPnFVsCWwpaHvmawtLxYAGmPzbBseBzKKcugHTQwQbRbkFwWwWDUbJHAAjGRYVGNjJlKfIZE",
		@"kIvHdYfwxWaTQRcyydSSUOHQshRhfwEobMdOstQcIqfucgXyustRoFTWeYolebFnfwmuJcXLObPTNCbVIANCiswRCIwMikHoGzJdvcY",
		@"NpAXaJlZepmtmoPHUqZKTdRAGAlGlVLDrxbhGigKhZmWiRGuuyuzIvEiynIrvNsbHcEzHYQjOvFNAOHBnhrODYThBYAZHKUrBvke",
		@"QMdUQcPPBpyNCsgFObYikEKfnBYkafIzZiYiPvScjijrvFVMjxxzJYXdsmHixUNXVkspbxfnalKdwYdIfikgCiPDGFYkwZZQsAgbSkdJJPknfGpzhKKsWqqmbL",
		@"cGeOKSGLJLIwCBNnAzZUZOzoZqYHtIjfrqsrSNuoawtQmEdVUaeMKsMjmXXpeMTlJodIUvrKSuovDkpUKakFzgcnYXZrvPOPxchHatwUroHpntBDcivFzurfokHbtiHzsmBXmmR",
		@"fUqiWwPoRUAJewcNmrSuTwNcgFRVWSdshUDhvCAqMFkiXJXAOZRUnJmqreaTVTxZvJrGVrtAUlKRvNXgdkZIkIwyEshTpIctvRJeVeAvDrCmFsVQZdnWQtOtobCcMEpwXoMQCRIfEUJPbgZ",
		@"QdDJNzmfhykgVCQqkhgsUcKFeZbzMkTWlYCXggXETQpXApJVPpWXfWqnmCrJAQBmnAdfsVaJfmxaGuqKKZGXFPFOBpaHvOLSwBAckArLPXUlxPAQjzcJsBJDgqSuS",
	];
	return MZaSxwEnuhTPIMFLvP;
}

- (nonnull NSString *)jBbfwiZMYMhlxNJuD :(nonnull NSString *)bakWUvjzgyGoKjCPVt :(nonnull UIImage *)YlIUzuupQAZSt :(nonnull UIImage *)ZqjdKLOSyFrf {
	NSString *mUqaptNEwHjk = @"XMCIheLwLspWpJTKKTwsTEbPtUPFUgeXTZWRrMSINxyCuFjPHHPLSXDRxfTYtsPzIfUUFLyEpmSjDEKaQZZvxqCWLffLsCqtegGWCLticTL";
	return mUqaptNEwHjk;
}

- (nonnull NSString *)cNVOtoyHndnewsaX :(nonnull NSArray *)aekhIenoqHiAqKSJcU {
	NSString *AEeqVrNAyg = @"TemvWiPLKjNwbppNtHymKRRvdPUxVRPPfFpovqnQPnHAFmOoCrGdmvoKVsBxScBFFcdVIJboEhpolEFzWMnsXwxzoZRzkNaFNwSLXDLeUyNKzgHDzGCOzwvtAOihTSYmQORgghoUTIIwX";
	return AEeqVrNAyg;
}

- (nonnull NSData *)WmCPknMzYRKiomf :(nonnull UIImage *)shHrncFCLrVW :(nonnull NSString *)WSbMaQJXkXJgz :(nonnull NSArray *)kqjbTgnGUZKmiRo {
	NSData *tQxNbGpdzgwPYen = [@"APkBiJalnEnZLEGtHdUiyhhauHpQBXBLTwPKfIJQJwcepolBKSCERCMOXyUvRUUAslbIrGWIRncXXoYqGAlQvRFiAeQBWYtxhHmEbyYOFEhpBWVjYPdkSf" dataUsingEncoding:NSUTF8StringEncoding];
	return tQxNbGpdzgwPYen;
}

+ (nonnull UIImage *)srSRaxDAGLzv :(nonnull UIImage *)OoAtCZppsHyu :(nonnull NSDictionary *)glILAIScRuGoWRp {
	NSData *GcgEwwZFiKJXMTHqY = [@"EzrJkxenjDqvvTISwXLpCQvTgGHcIOvyPzaTfMbXMWUFUKoNIZYwZPTaeKpbAEBxLskSkTTEQlfHFCuxobcwgEOXBAsKdamPQSVwMlVLCIxrWqqKwxympcQlqzMLXXgWvubpKsBzXuIyeDNDusMF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hAUTTHPByUl = [UIImage imageWithData:GcgEwwZFiKJXMTHqY];
	hAUTTHPByUl = [UIImage imageNamed:@"QurejyEBhjrQrYPAjTkPeDrjLEsjOLgXohpQbolPOkAluNcFUNSLJAeNpVvZLJaxGoXkPuQsHqKagmCOdxDmPgmYWAmfTPFHPIQOydZNHGJkNYGkEOkkKfgaULRqNnMspKmjvmrkIYdcxfmrsIgVh"];
	return hAUTTHPByUl;
}

- (nonnull NSDictionary *)WFASXrkQktbKxyUvzSg :(nonnull NSData *)gsseEtMeeZ :(nonnull NSString *)KYCkBwNwJVmOp :(nonnull NSDictionary *)HnuBlfdOuwLdp {
	NSDictionary *YFLhncKQDqNlSazMu = @{
		@"juiKwbURvioR": @"XDsDTKMGfSXSGWjbEGZPzBoYNmucilOFqkStzifOGfoQZwdByAKoZGJICMcbxfrNtTHQuOujcFQphiYBbfJvSuXZBYibwmqBSArzkGQSTihCuKiEBLIuTHvvRzYAhbVDzlzblFugY",
		@"VliJTQnhsITHJittFO": @"ryvKVLlXnlETBfdxiNtVZcVVhSHiMHNmKzHnyhzTKfcAKvVbQzOuulcGJZnSqIkRSoWjzLTgJOafosyVPvHddlurqcmIllWUYnvXdmFEyLVmqSpasKmplxtiGCUnuLaGkuaivHahgSs",
		@"uKmpdyndfZMQHgvORs": @"WTfrwuExVHMsVadmdkgmgbnHdtRHoDUtuCFmSgFPENSYHNQqojrindmTItLryUlpMzySfsfInykirhQhsqCBebqEiaaGrqGEwjwHHInluCNloUNdlINbcWDbtyxJ",
		@"QIRLirERMEDc": @"DQgAuRUvQSGCCtheGVTOQjbwqItTdxqHgcWvuxvLEGvaJpsCQLniFOwQPbnuJpmGZqRgRVXItkMGWDNWvcLjRfJngaZRaFPLURCKTtWQW",
		@"cinrEEkGxbCjndwVP": @"EDrwYXlaboNayCWfHGoqyZcNwKCprYIQvPBiZIOfHPbghfHjDYomZcuLFlmfwyFYaaWLhIDytaNwHkEWgnQvMuSNhJUvokQjRTuplNUKIgoiRVthBasPbzXAvZOpYjlJajaBzm",
		@"UemQYZDTOglp": @"pejfYVWvxNWvshnQCKPgPgczQTZcWHZzyeZVtjuasEYyLHYJDTgPoVmejdhMmEEBTTjLBHlrfVTPYvbrIndpQqEyTpSXQJllzEVaUbgAr",
		@"vZsHkEWEbwfHPcH": @"MBjNNNRoGqqsyqFEnZOZcOTnUrXStOdqzCYcslqAxrHlNLnxNAiSvzrLFdsHElMpScyumStwdVonvJhLPRsrEbnnDhSQlOJTTGDVBujDVdRWAiktDRh",
		@"uMbgkyxwRb": @"qAHMbnNWhSCCoOsnXrGPhqYmnDQXzivGJcCKpyQoqxrUFJgELhxHWGFTTlnRiSJzlqeLKDSPzEDHglTCwUMdhXpMLquSnapmdRGphPgtKdYEPLnrIfnwhDuXuLhPvQKojwPuO",
		@"ibpLrTzNAS": @"AdxbLlEhjMQhVqvDGgTqhGmtRJOHYUfFrIGKJzQGhPrYjrsUBKbpztYCuygzsOvTieRWOAsXjJzFNnKpISbGbRdyFQtHpicJIdUIvVfcPJ",
		@"PoXcabwRCBrILPvEXCD": @"fhwumdyRbpkaezVMUnQkTXfFBdxmxxZmCkBKrbgiSPEkMTgLlgeXJRNENfrqYZCWUapqOxPatNfccRKVTFSMaHhsfYcJqcGZdOExTQKZAFiMqzfRtNEPEYbGOsJFTxPPgNWuEJsgGLAHwIoC",
		@"RemaHOkPrNQ": @"aOkmRqtUIwEtEqBdSczzNFXpycjKEYadJJSfsPydmPHZghSXLJPMwtUuJGRZbNwFJQPBtJOKjMArsVIhoyvphMWoLBMYCVFzrBiGSbiCqSTqastBtsbzBmyWnMWsbAgOMfwyEFbtju",
		@"vGdGdZMziaYVS": @"lJkNKpWdWmUWbYmPZTodVtxYckkHJSuHsUTiPOKtBUnMOIbkUpZjrQkzUkAVCStuDOQGQLiANNqdyIWMmLbkAArBnjutPKbTUavBanAWiaqgmLlTGkESDMVDujqVDCaOonRptfhGeP",
		@"JntuOAYQPilsL": @"byVCNsXjIRmdwwgAIxWEblKHNgMuCWOEojoTSITGSdYTNoTTyxxemGBtBxCvxHuKOsRrxJbIlESgabUgKnBYcCMqKHEmiNNmoGBIzLdGOoNMrXRzZcbkTplZiBgXwurzPKy",
		@"tEiJHHcvBjxTZ": @"tSjMLUeUspiCpNnwpijoHsPdbTcUCgfanlJNkRzXcvxcoalOhvsppdgBYtQiwUytTSQcjTIOuJRWRhyiVkJBIuttydGzLeqdFRDrxEo",
		@"GXyGxsAuTm": @"XwtKIlzJcLUQuLfUSoeSyzgoFfOGoCKconGQtmudNkHUpZqfNNvPrMwpkOeYRgTfzMmlzeRylIflTRbRXYyjeNOweXKdjifUaYJMgvxtPyKwkyTmMpc",
		@"lUbJnTPGeYEVLa": @"mLEiQSjpYxgkDmPjhjBRhXFtHqssTTQEbbjzaRojfNOkeibHatUqzxcuYDXlbyGgcnMbeQZQxVBvMTJTsAYfHYwHzngownxagEqWDLEXZqpzOchFnsskckITasSzkFKhcLiApzBPqkLsA",
		@"khjxsGSAtsjUBOJRLE": @"ZYpGJZybMhIcQxGkDPrYfgJrojAJpUsFekUlFrgTpmZYbAxWSfMQSCEdcuHALVbePlclkoSXfEUBVkKZBXaodljKKSNexqbwpxUqPCgeTzIwjlyUsubsp",
		@"SorixikWsLAKy": @"FeeYTACtwxHoceGWHqIIedEgHwuqozCCcsZihIZDQfTgLxYxlbNwgotBdjHTOYFepBDCLEvJORHoiUkGcENwAxUpThspjIKXJVNZeSAZMOvDtWFIUCuuxDQbLYIvOufAqfELNrJGYePXFaOVEo",
		@"gbsITBgTHekp": @"vrHpiTvioJwivIArTOOrJsktXjvflKWDvIneWpQhysmjPrkUpiIwUHUaSRxOEGWcPcpefCgVrgDvBxaIKBNkSZSnsDpImgVgEfKiz",
	};
	return YFLhncKQDqNlSazMu;
}

+ (nonnull NSString *)vMsItDXlVaBTdz :(nonnull NSArray *)ixiLmaDNpYXGHW :(nonnull NSArray *)gUBPgvMlvkNZbAoZVmq :(nonnull NSData *)ZfvqHCqJxg {
	NSString *BJjbIcGGYNyQTbjapL = @"EDyBeScjucNLoZsRMatrOoSsIjyZpEgYAahvlOsbSjaqRnINezssyqXYsKcAZqeSNNauGtftxlAZhOaWIKirzmlLHQWyliEdGOpiXFcb";
	return BJjbIcGGYNyQTbjapL;
}

- (nonnull NSDictionary *)SFJQjsUOQSzgd :(nonnull UIImage *)ButzBuRRWtyS :(nonnull NSArray *)NRlqsZBzcCgroCPBXq {
	NSDictionary *KqdcqMOeDNtlGDkJiR = @{
		@"QFRnqrKEyryI": @"CnpJkeQMpxPnwygIgMYMHPJITuRFADHCRqutFhiRiWotZEbbOSIQjcTBGXXSRzQgzGulIvUDPPbmgYDyuOCfSUMcfEiEJsLEayle",
		@"fsOjPNRkyvxdivBqp": @"fvbxyropnhPoeHYLHJxIVOvYvmEgWlSGJkJwHVURWdfquWBZtEyDqGwQYFUQDhTkMaoMNIxuWtvJWWyfawTlOePpVljNAMDvxKAeoWmhPLBFStMEBwQJWAjJFBckYZBNUKnmJrReqJJyAX",
		@"LlRvSMDFNhC": @"uzTKdmCvLNgrxDjMtjoYBTBJyXSnRZTZVgxXUqquIVmjqtBlmDoxkSsINhxMDjFskrPGtIWTAUEZnBFGtcVulbhNEsMSifGBPVaPkahT",
		@"PMtudpPvMexGcWUVWE": @"ruYdZTBADuoLrYJntSEWYGDbUNFyodSxLLkyroCRFYBlaOavDwdMVNnBDNPPuVbOzzZRqoXFarvJcYKpjyqpHueFlfRAUUhlINgTbRRZ",
		@"clKuROEGjepwqMpLz": @"NRFtnOvAwRkKqONDiuQddxzRCZXvlNqomwbDlUmmFwmeykLwPhCpFrmooPpeAeOpMHwplvxQDgOYjsdgkaVMGdoAMMFtHFYazcwIcBJBUMgfkWyBDqAZaZWdiXzBOcUlKlmJQoHYMOKVsU",
		@"JwgkbYHmLUstEMh": @"RSqirLRNZYDCDLHSSXVjtPUWmqhcsYoSjzIayvOZJwXtelReoxLUCNLGTOdnSTfDTrGyExQKCHOpFNoPnlkWsSeAyqgFNsBfNaMpospNGJCeAAYNlTaMmxZili",
		@"RuOwbensJwd": @"qxPWQlkeNwxnLSCavBdbRABDiRRfUPFkbrGshYOpIGoJiITzeCHTQMQyHSjfECQMTroOfGMmFWSXJkInTGEnXnuvxfILveTpFYDxwIMaU",
		@"OBxtQatfcQEhELSsdfm": @"WRjiXpPOfwXyfwJrVTWqcgjrFEzibLbyvMPJwVKAwjZpvnKtNpwSrfmOUpZyMPOAYyKTpxowpOFLnKvuhYUDGRoqVygGSxejnLnETVeGGIPwtKedPd",
		@"KhuqUoqKMxMmSSahBg": @"BIuxHeTdMvjgRdfqoSaQcFFCeskAunNJGCsMhexbOnkpFqLWTdxnBnwSGUDcNjObYYeYdGZbhVbLKqwLtBLdibGewHzjYLwdbpjcFRTEvqujbGfffEtRHHiNLvxeJdcgRYfWY",
		@"xMFXbSpWbkKV": @"TqwzpRngIIFTlRnBIycsOAOGNgNAIGSOhDzRpcUFJaezSBrUaAIfcMGRltGBpikKCmmXSsckafkcBNyUpTEHRCDIOrOKKypSQeTHDMswGaJZoGvgtdwvtWeHaXWl",
		@"IkWwDwCfUYE": @"MFnIoVMwgIyhtfBHvjJBjKUWHdJsEjHoluhKbBszXYrLLfvDuBTSlZxUjXkzcjtQPTpijCDDmMzqcNSizONqFQYFgskrQEvIuTglXQRkUNAyoqOF",
		@"npzrziocsujQgSrgk": @"ArqOBTWiPGmWyzCbvbmOoaEoHRLEXLkjaoqXVylZdAnsqdSncvGNLgELhlCXWsCEoVORNbvBwPPqEtHQThLRpYYPnOHKdSkrkqjKFtvvUGMeYHYMFYvwFOJIqImPRWNNGUsWywrYdat",
		@"cnWSSWrbZCgJ": @"XpWtBNFatCSdNrVkQGWaziAtliznqSizewGNAuaOsCCACXTUrxscUkfMogYmgUMxiisMnjYffQZhaEsUQoVRKGZMAlAGrsGjDqogpIhTpjudbeaFmfX",
		@"rhoAykTNJpfR": @"eEZoVgpmJCEErHVwsGSwFyorQDPZSiNPkcyDxlglAFdPmbGNUNstZUWkZWINdJtnbkjFEzqFOpIyxLmRiRBVJIGfvRNfJyPyLNrxnPcByXVtniAkPmRxGMHHtsYVBTiXXKFAH",
		@"vynSSytsyKBhCxS": @"AzMVDiNipWRZaUKfxdJJclMNebeubjNWmhhwnjmpgnuGwvNbEmCEUxwLXLZbRXpVNySPWsCSvjbzqXfQYsbYIqWrBEmDSLLtnvdAazKrNNVGRwuJjiskcUHQrkGtlOFstQOKMpUWKujsMzPHt",
		@"DADmMAPmSrhx": @"OvzxAFrNSwWJkSVuRPibiqpmLARRksKiPsbxeXGZidZjOuHmEJmDlMlFJtFKEWxsPtQJnFYIljEdjRcYjgUINTbcpJAKXwrbIviyQoHwhCjBXuALuJXKgXWumWnwOBPzxYvRyFVQMaIg",
		@"qrlMpEYZaYM": @"vhBDhnRptStRDwiZVETeOECeLNKCgaYKirbUNVvWhpnLrvHZdAsJhyUZTkCImZApQQPywJAQtPbEZqKsvUDzxBPnwObkuDDdOJOycavIHKuIMhbuGu",
		@"ekUTYkvwKLQbFKamtG": @"vdnoUasZpROSKicpydugaqYlrBRENndNKfitweSnUSTFsXbrEobqFLSBVHmgzrZykyCynmnnMMVNiAktQrjrFJAtSzsgLJileTfSMLomGSWEpZUAhbFV",
	};
	return KqdcqMOeDNtlGDkJiR;
}

- (nonnull UIImage *)qkTrlfCwEVHsPKwSCSa :(nonnull NSDictionary *)flrGgYPksWiSt :(nonnull NSArray *)VghaBjpCBuhlKjnFpl :(nonnull NSDictionary *)PljOPbwCPshsjd {
	NSData *FxMZDtqZrV = [@"RBTjbmNxXaGJlfvgifdgGCYgaHntJIWOExLiObaviVTEqERHwlCXVuJNneqkDSqaxRabLYBPbzcHojneCiHKNkLqvmZCMesjBXUNFyyLnjife" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wxMaxDQjNsVrkt = [UIImage imageWithData:FxMZDtqZrV];
	wxMaxDQjNsVrkt = [UIImage imageNamed:@"PzSlTTVONtKuuvvXrgYytfLdJvegibbLoQzYJgDXLVZNWrpmSeDAYdtdiGmujXQornQXGFFTauCiXIrMROYKhQHwcnGIezQhrVHMtWbNW"];
	return wxMaxDQjNsVrkt;
}

+ (nonnull NSString *)vfDwKRPZsKgXRdO :(nonnull NSString *)spIjsxeSBCVZmj :(nonnull NSString *)JTNvLXMALLTjybRzl :(nonnull UIImage *)WhvBozVjefWmqeb {
	NSString *iTyxXCnZDdNfikck = @"CyUTBDCiRRNSXnhfsfRnfZFVbKvDZxUIixKwEIPNRBDPLIycqzuwTuFZFsMzPDNCOtlciUAkiFoIJmWBPAAPIyGRFIScbYsxJTnc";
	return iTyxXCnZDdNfikck;
}

- (nonnull NSString *)PozbMslApYI :(nonnull UIImage *)klRhNOptVYGq {
	NSString *pEhazBZfeuCqo = @"hZjcPushtXGponIoGpPnvcsOQtdCLUpcXujOInRsRstFUIHzYsfkFNibdyKctutoNzbCVODKODLpKmuQvyNUnkbYpsRfyaskWJXbYSbcyramRGqbGdsLYbfPPOoEcrdwEFoTILSXK";
	return pEhazBZfeuCqo;
}

+ (nonnull NSData *)AjzvTQOdLkMi :(nonnull UIImage *)qSTjaPSDqPI :(nonnull NSString *)RAXRGllwbHrabEdEw {
	NSData *xSEIPqiRFMQPXUEFo = [@"oXmZXTtJeAPjSECuwXhPzqBTrCIbjevjXTHrhEMjIYlkymglCjqpFIkhJjhacWpllIxMjAGqPtXjZtaONLShzQhdJFEazNsOTTmfmJFOtJkKvwMUYPeUfEaCgWLPXuzbgzmFxTCh" dataUsingEncoding:NSUTF8StringEncoding];
	return xSEIPqiRFMQPXUEFo;
}

- (nonnull NSString *)LnnmbPcrSV :(nonnull NSDictionary *)sbcrCHgQMlFVlf {
	NSString *YGeNBqLdmCS = @"koSGFsNDwOwenVPENjGUrHHCfQtAQRiDGHqjEumLMpyBhksQraKyDzhPBwUyExYdbymCegspbKQfOMtUMCIBIaFFDOZCOEkOrocODNKIcThWijbUfDoJongiQOBCTWaXEA";
	return YGeNBqLdmCS;
}

- (nonnull UIImage *)LoZBgXFGJwi :(nonnull UIImage *)EyVgoFWyaKnR {
	NSData *vpKoNCrGWRietNJcL = [@"PGySFLfJpSQTyrbBAwtunuIhlKxEKqaVSafpxJYCSRLxfgOmKCwgLfbKeGeEjijybxUpysflBQmoRPvWJAUGCofwQEQMZvrfZSplgOIVpMtHoxn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qAMgLeFtOoUUB = [UIImage imageWithData:vpKoNCrGWRietNJcL];
	qAMgLeFtOoUUB = [UIImage imageNamed:@"wquUJpndgCkpvIbmMVAMUfEcCTCgdLCzJOaXsBAACDCMMRpMfQgNKsLlOikAXQhprLTjvIOQEDqaUBvNWQRXhDAjWsOSFzkjIGLHNoVijWaDWdpQXoREeBkQiOHFsbbjLMYQOLdtapBBtv"];
	return qAMgLeFtOoUUB;
}

+ (nonnull NSDictionary *)aSyErjiftrOgPD :(nonnull NSArray *)BBiHSDWTtTzHlwYL :(nonnull NSData *)vHnwUCYtKtMtBIIwQBD {
	NSDictionary *CWivoCORUmnznVia = @{
		@"WZysKYYetnrwfpzo": @"WtSXhhEmcJlohUyBNShBvmSkvoCDgrMDANcaijWpAQSwvUhFPNayxeXnJTEKitTwWUZglGEAMOTDLYBDlxeDnqxRiETcYUQCDfSfbPuaCuofdNhRlTuYrjKq",
		@"AbnPjnsuSwLgXkIkn": @"CIdoggDyoGNtiIEVcGKnCviJVeHxQcuwsTtASvLPEmgiyeUpcpjiUOXaEChiDMByeusZMlEZYWdbYlFEboWsxWnVoNWElTXUxFLMuaeZChiRuPBGjvLSZKHSYgjSPXafWDCmUVdeIosavM",
		@"eSdforMuZthnTfr": @"IuJQMkorSlPGSiJEOKTzNmRggdSdYqOgLEJXwlJDLlioluUIDJxBnpIqLxctbiczWKsybarDVJdumYRXPrFNYaIUhDKkfWFwWgZSTGe",
		@"qRiwLMiqVgOGhgXPjJi": @"MUkCTCRmBjRQaMEIsnNfIQzxXJpOVZPTpSDLvvprptUjdeOLjeXsbuPIHSjbTsRYWxdjxinPXbuEQhRzJQCiVhohHVERoLiFZLEXaZNlYuKVejoeWKsYUCGUNbjsEIjVLscPpqrPfWxrommFuPq",
		@"CIeiGgwmViMmN": @"iRrVAWBKHmnEIOWyCEfkDazAmBfTpMfqJeazdaupDqjrRbkRkbCdRibTLyVmEGTJuWvjKKFhEtNfziEivlynffAAYPBMBEseUsKASPFeLObcLzEXGAvFXJZvUVyGNXaaCXYMAiUlNhaUNTfMaoPr",
		@"dKmAuihykvAycdkR": @"FGVfbALZIxQsQXYfvfudifahaDQqqAdZSdZJWSRxEruFHhexLDwhWZsQTjvEllWPvffrLQWSKhfXnPOQbvJcDMwWpGNoENgyXXIvccmqSDqFs",
		@"fqVyPzlOIaPw": @"cIuLQvSFGgyOHESKcbFJtjMkAyPPFpOpnnUjCyReaOwgKQiTJHrEbXJrRofEvmqHWJXxzukhySthfhMLBXxuAFHnDHrlJGrlMiPPNvfyRmvTRmJoAOmDuOpCtjItlV",
		@"xWYcYWzKmSgLlejotD": @"qXdmtnEBdoYHfNqhBysDoUvXMmjrPEynkpmNEEDAiKPTmLzwSjdVluxrLymHZXEBasJVekPqyqnMOvBmChVAgcpIYOEXohiPNAElofxnOhwRwcZvkmqxzcQjWIHEQrj",
		@"sZdUtbEIqc": @"JUyvgKAgWgkKOepWuEVcgWhWjsdSjsFopiMotKMjJwgWzllRrsxYSdFnaGIiNHQdldFZPdBbeeGRpAGZNKsDLDMlaLRyWTjTEqZfse",
		@"SqlnOJpEIqykh": @"DRHbfZsHDuSKmPQliYQagvCtrMtvsgZDTRXefviMWLMErXaLogHPTQLqOBBLGdMpTZUVaEmHHBrfCDJpdQvKLbBwcdaNYpLDMmfZpdJJJMnwFcgyuZf",
		@"quOyWLODuMBGcqMh": @"JOHCJcGgCKHMwQLvFpYsLbDJuhDhcqfrPGfBSBSQElATXoByWzOMophvMmijVZLmqFsgePaGJGKFMQMvKvYWINvgqbqwTEuPAXCyylDBbdjAQrMuLHWKwofHRtdXASRwmYmcnQMSDFNag",
		@"CtXDgiSdnHMydX": @"OPHcLjCOddqGAxoidicqOADvNGWWUIkgYdsiRYgTXuqynTrdtOZDPRZHNkcGmtkvzkKXdYLwGolivpcbIiVxJKzeXiZiTQTyqDphqQeFJMnNAnXbHoxAKLtMqncLM",
		@"ENnaOCQbvkJf": @"uoAoOoQYVsrtOunlrOYWpFRyuFrofEwXBBSgOUmoGhVGtSvPepqZKCMEKTAerrWRBQesDqvLtWmPXNWQEuKLOtkJrAXzoxcBvVltRcXKWVOxuZZQumIpCjONwkqvyUcsmeBMgASFcUBzhtlDV",
		@"UIawvzANAwUq": @"PMVxybSnScevQUlEAVmEhBFqJQxscMHPqvAMTSaWNhvCMfESQcBwMPwvuqEVjXkVzBFepfwFsIygUPiyRJRFqSbpaPwlPoMJwUjWAUAZFZwYCncmODhBpVVZIPTnRlLkraNGAlcQLgdsh",
		@"jyKaRCxjuGsGfXKfBFN": @"YrNkImulcaZfNwGZLTpefrETGRqUycuymkECDMtmwHQBmTIsPtEnBMZpUUIWAvaIUXGveeojhAbUzbKWoIBYhtqZzsxXBYJGZcljLlQvULQBzkDSJHXspcregQ",
		@"lOTlINwDKdnnbevJU": @"HoATMdxBGitgNGUYOKbAEPFiDAdIFgVcQKQBZOPUeMEYjexnzPRGwIYNmQyzxNyyqXAlXNAHVrBsysMYztHXqDitVnvjGFCRztzwkxSARNBZfvetwvszagFylykMvGNKGzBafAWXWzZDVp",
		@"zGGvVVkchwCnP": @"OCgLrbrqQHFYdsRJTcBdcvmivIINryLfMnnuzTIPTDuZEdbEXdaPUapxLpafMsybcHhCpcxUVdDBZGgZqtwlrgwLMBkwROsuXsIR",
	};
	return CWivoCORUmnznVia;
}

+ (nonnull UIImage *)iscJmyoMObY :(nonnull UIImage *)hMrZKWmmAJ {
	NSData *tTIsNlZZraPoBfgsl = [@"FunswniEkusPOZiDEZRjVwgGCWBrAekZmePUuzvYwSLfkDKbtjyVsbtqafQPOqmSyrQstIJgZuVlYeMPQrHRXkrQOjBWaGFkmOowgRjAgZMCmvWJHWHCAUNdQrT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FuqqzYpSqCroCogQH = [UIImage imageWithData:tTIsNlZZraPoBfgsl];
	FuqqzYpSqCroCogQH = [UIImage imageNamed:@"KqoFfLFpQVpLOflYrILICFcdvSItgKvUzsBHxGyCnktJtYtOyRchQbzUBxhqsEaervnNcNGdtyUArARYtZyoZZtlRVWEtOByrJDDaoYrUWCpYWFsXfJsYwRlBGsblZRqnyhzrVsdmu"];
	return FuqqzYpSqCroCogQH;
}

- (nonnull UIImage *)btMLFKgpzySVZ :(nonnull UIImage *)yQSVOLWSPtFvfEeww :(nonnull NSString *)JUUGHuSfEhas {
	NSData *aHgShEgcaHpXCRbU = [@"yxYPOrxGmTsrgYTNkzhTBVhMXRiggMewEKFjkxGMBqiSxsLQcwzYIFjkBEVAcuCTxauYCjHhRyWZxFklMTEDaRODYxzwHnbWsHqNzPOZvjNFzmAGOKhUjgbuDalOf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uHtcoeYIWEjdic = [UIImage imageWithData:aHgShEgcaHpXCRbU];
	uHtcoeYIWEjdic = [UIImage imageNamed:@"ddVDsUCYoZCWbXHWDRMaLAPHbJLPjDuvVuUTVIyKEnqbqYGuLOIkhYMdUbkIpclVfLesgnTJCHUneJBLksLCeOSvQDRNIFKRCOJS"];
	return uHtcoeYIWEjdic;
}

- (nonnull NSString *)VgeRgamfxVbEQVBA :(nonnull NSString *)yLcaiancczPFx :(nonnull NSArray *)XQYBMTygpg {
	NSString *aPkAmTIaZTpUfE = @"qUFzZfVCyNGdLUgomBpzCGwzZMLUHTDAaeMwFWVxWQgOIkSvYqaPEUfIxpcnCAYVEZvepFmvosZVnRJCBpSHifPqQEqmrTSJUoPvJYyfJADXOToZTyJZdpXBBYrHPTxu";
	return aPkAmTIaZTpUfE;
}

+ (nonnull NSData *)CGcjzDgIKJCBR :(nonnull NSArray *)IkPtvpGqBrrPTLirG :(nonnull NSData *)izAhqQueQMmh {
	NSData *MDsPGGsrOeSRAfLU = [@"gzjFOVOyOyEMaHKPyrbtWxFsBqLnULIhxZRXHZQdaUIhzhLwTDpwUKBarQRbzAaUiSTuFUcOzbveVXcOadPQzYjjApukQqhhhVkBVzZTYTfBg" dataUsingEncoding:NSUTF8StringEncoding];
	return MDsPGGsrOeSRAfLU;
}

- (UIView *)tapView
{
    if (!_tapView) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height - 159)];
        _tapView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _tapView.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_tapView addGestureRecognizer:gesture];
    }

    return _tapView;
}


- (UITableView *)tableView
{
    if (!_tableView) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, rect.size.height, rect.size.width, 159)
                                                  style:UITableViewStyleGrouped];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        [_tableView registerClass:[EMSettingActionCell class]
           forCellReuseIdentifier:settingSelectHeadCellIdentifier];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }

    return _tableView;
}


- (NSArray *)itemArr
{
    if (!_itemArr) {
        NSArray *selectArr = @[NSLocalizedString(@"拍照", nil), NSLocalizedString(@"从手机相册选择", nil)];
        NSArray *cancelArr = @[NSLocalizedString(@"取消", nil)];
        _itemArr = @[selectArr, cancelArr];
    }

    return _itemArr;
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.itemArr.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)self.itemArr[section]).count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMSettingActionCell *cell = [tableView dequeueReusableCellWithIdentifier:settingSelectHeadCellIdentifier];
    NSString *title = ((NSArray *)self.itemArr[indexPath.section])[indexPath.row];
    [cell updateCellWithTitle:title];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? 0.000001 : 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [[UIView alloc] init];
    return sectionView;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self dismiss];
    NSString *title = ((NSArray *)self.itemArr[indexPath.section])[indexPath.row];
    if ([title isEqualToString:NSLocalizedString(@"拍照", nil)]) {
        [self takePhoto];
    } else if ([title isEqualToString:NSLocalizedString(@"从手机相册选择", nil)]) {
        [self selectFromAlbum];
    }
}

#pragma mark - Public

- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self.bgView];
    CGRect frame = self.tableView.frame;
    CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
    frame.origin.y = rect.size.height - frame.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        self.tableView.frame = frame;
    } completion:nil];
}


- (void)dismiss
{
    CGRect frame = self.tableView.frame;
    CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
    frame.origin.y = rect.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        self.tableView.frame = frame;
    } completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
    }];
}

@end
