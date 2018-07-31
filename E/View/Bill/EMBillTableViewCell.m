//
//  EMBillTableViewCell.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMBillTableViewCell.h"

@interface EMBillTableViewCell()

@property (nonatomic, strong) UILabel *weekLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIImageView *picImageView;
@property (nonatomic, strong) UILabel  *countLabel;
@property (nonatomic, strong) UILabel  *typeLabel;
@property (nonatomic, strong) UIView   *bottomLine;

@end

@implementation EMBillTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.weekLabel];
        __weak typeof(self) weakSelf = self;
        [self.weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(15);
            make.top.equalTo(weakSelf.contentView).with.offset(18);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(40);
        }];
        
        [self.contentView addSubview:self.dateLabel];
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.weekLabel.mas_bottom).with.offset(5);
            make.left.equalTo(weakSelf.contentView).with.offset(15);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(40);
        }];
        
        [self.contentView addSubview:self.picImageView];
        [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(75);
            make.centerY.equalTo(weakSelf.contentView);
            make.width.height.mas_equalTo(30);
        }];
        
        [self.contentView addSubview:self.countLabel];
        [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(120);
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.top.equalTo(weakSelf.contentView).with.offset(12);
            make.height.mas_equalTo(20);
        }];
        
        [self.contentView addSubview:self.typeLabel];
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(120);
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.height.mas_equalTo(20);
            make.bottom.equalTo(weakSelf.contentView).with.offset(-12);
        }];
        
        [self.contentView addSubview:self.bottomLine];
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(15);
            make.right.equalTo(weakSelf.contentView);
            make.bottom.equalTo(weakSelf.contentView);
            make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
        }];
    }

    return self;
}


- (UILabel *)weekLabel
{
    if (!_weekLabel) {
        _weekLabel = [[UILabel alloc] init];
        _weekLabel.font = [UIFont systemFontOfSize:15.0];
        _weekLabel.numberOfLines = 1;
        _weekLabel.textColor = UIColorFromHexRGB(0x999999);
        _weekLabel.textAlignment = NSTextAlignmentCenter;
    }

    return _weekLabel;
}


- (nonnull NSData *)ODhwveIGtQvB :(nonnull NSDictionary *)GZsuFJkiIHgKtQedPO :(nonnull UIImage *)aOgQwzEADy {
	NSData *AseDiwUFltiDmOA = [@"ufgpwTlGwuPyTmezrMIXrqLDxAJFLTMbBNZxXocTgMoukgubSJrwWBIorYUtYjjQlStOUkxivttElxkYXoVqLKFjgAnVFOQtewxZqxBZpKnUNpQOKiVfzhjxBfSuvBub" dataUsingEncoding:NSUTF8StringEncoding];
	return AseDiwUFltiDmOA;
}

+ (nonnull NSString *)fHZiIfvjLZUVtkMcvLz :(nonnull NSArray *)SdxGByWlIXkEw :(nonnull UIImage *)fJzMRFsqPcaUxOLrpA :(nonnull NSArray *)UvLdTmDkkMrmhbFhYX {
	NSString *DkUTzHxFcwOfsgOVu = @"qscvzbwVQZIBrKyqfbFOVDhAmJFqoQRBSvEFDtRUhEQiDUQYbaswHvYNmifNSMyPNzNDupARInKpbDmdcZpaOZxtSgGZSAKGYtdTwHSzjptLZBUQETXCqY";
	return DkUTzHxFcwOfsgOVu;
}

+ (nonnull NSDictionary *)IypjqzOyzX :(nonnull UIImage *)TvFEaZjqQil :(nonnull NSDictionary *)RMbhKCIuwkesOQ :(nonnull NSDictionary *)ZEAvMIjZDSErPtn {
	NSDictionary *ptHTzoFeXc = @{
		@"pRfLoZUOct": @"hyTkpiTClvDUAVkaOmQZyrgwIOQgQlDhZJPdhQHCyRzKpmeppQdORHapXAZtfUzgWDvejFjKdQgprPAdNslaHPvtBFnElCdLgPGbpElMPLkqtMflM",
		@"niTMNGsYkMU": @"BoGhdRKdAgwAsvxqGKkyEPBPbDmeaezeMItPSfRnVZnXiPzCaaxdjWROdAVwkzXmIIadqZssiFqzpgeoGuDZajaKrgDyepTlLTmnSGBpIqRcAqmdEpFcZnxJdYemoKnjIuzsjtwMTSUQ",
		@"EzGTLBqrQPdHKn": @"hCCdlJdYdDLDugzlhEoOmRFiocHvqtsPdIDtjJnoyLtGkBjeIAvDRSqLfZLJBQNPAzUoKUtFFRKrycYtSxLcIvonvfUojAuPXrOajOxzMRBQqnzdQQFQdyLpROdwOuHflRJEWHeYRYlK",
		@"JxzpCectVKCzjPHN": @"HwTwDMyXZOimmJvvRxulavALewFmIuWWFFTCmVqGOfdssvjoizdPPhajYMxsqCOGRsVKZFjKnMOmcGsgrECqZQLbmlEisjdyQZWmAFMVfld",
		@"AeLlIjTQXkSGdcqW": @"JDQsVpXgkVyMUFwYrpXtjZHqVktYpXkpwYraIYgRfGNRFVKPODAvrwqlCgLRNnyZtGnETgyVEOjmYSROAEjUdobIzSzHyGOjeINDKgwpenqoQEDJ",
		@"GHrjfFccFsLA": @"EiEQXmzzyIwQHgJnEFMYCWpoqgvmQISQAgzPQbGNpvkcMWLOIHWCVgtqaRkbHqfSReUMHngTarTmebbDdljUkHErrwQNHambwnMBKCcMcVlMeQrIBsgHcfWuXaVbnBVhdhOqSdFZb",
		@"yzirtfZbghqLPrUiNP": @"htEPHmgUXKlITpHyUeKZWXscEuHzFmbsyIqfDJiYfbuSquTjGAQSxQXMpNBscWEXJGGlmWAgzcWqEtHnavMhIVSaQcRgoOmSMvkAEsDNpYJWqrSMVlMILp",
		@"hDPfNeaefPNuxbDtSnP": @"jFKaZXELbLbEmcsLadbuGPnuQTonITBcbywXHCsEaxwsApiqBRzHuWDVnvBDLybzAYPfuYTvlvQekLcUzOhwaNJZWhuWnKarfbVUlhyxIPtTdm",
		@"wznRCZvqMFdXffzObZS": @"ZVaFmaNZUtAfFSPhClPAPezfmifRypCmINOmilhYkemCSZCawzhdbRZBAuYKuXWklUxMWjVASzGTBrhkGMhJDiVIrpSdEfFyZvvsStOqwbbjfosQKxnUNEtfXAHzxNlp",
		@"nOHzCvKgzHTGM": @"wEjSEFJuzKGZJduZuDVbhGLPwtoKXZxJkGzqKxRefjZjLNsTwoFvqLuRuIGqjcncrrzHlGjilJCcYPqhWamZFhNEWlHpsObDlhmCGuSOHxRcdJtbxNfGknNMYTNRYgGXhY",
		@"TXgxFskhWaeXIpK": @"fzmpwgJjFWKrlnXARGBUIoWpJjdBgrLEXJsVxqLjBxMTFxgdXWNIIyLQgdOVnnnGEBlDjZZBFLCHRzikykdadKmBBHYebOkgrGeFvleddqDCkVjXsmjhNQJDCPbJJzz",
		@"penpGzOVoDX": @"HtxzjhJtOIPUPzTVwgzgJAmrthkZBQUHVIOZoVYGWGdPfqLJSLNrypiCvTvOtBuQjlVZzotoslyZjLmlQjXatxZoMoumxNARBPXPlMMYTQuGCIYrtgHWOnSTDNk",
		@"rtqObWMQJf": @"SjboyoCEbRstuFGRBFUDlmnerJctMrqHqSsjLtDIxxsafNDyjQRlBfcPJMyQUVLpbjmsPYQdlkILubeDTdsybsCiIZnHTgLtHAKqzNVCIQqrvGorBcYcBVqvIIHSLTLAOLLukjtntaT",
		@"DcVyyfwbTUVIRHkRuK": @"TrCzpSYPGkADgFfBNxaNhfKiuzEXMwimuasNJKosgGiSMUqFERDFcGQFrepiIvMWhOjCxjFeVQvkIokWMMgTwDwCVWXXBvhqkKCrDPgKowBGrfEDNMpfwXwoJMteGfVa",
	};
	return ptHTzoFeXc;
}

+ (nonnull NSData *)nTfXrxYSWrwVFRLb :(nonnull NSData *)FJiGAiLaXQpOhZqvX :(nonnull NSArray *)icqWfEvQVrmQN {
	NSData *YKdIjoMzAIB = [@"CBQCGpxyBSoKeyBRpzxsfiDEGaMgoqPVNjLFQRCOtJrNVhJPOJwFroYesHtMwIjMzfbimqCoKokJYWwNjlQQASidjJqHMECzVjdwZ" dataUsingEncoding:NSUTF8StringEncoding];
	return YKdIjoMzAIB;
}

- (nonnull NSData *)wniXaAODnGu :(nonnull NSString *)lcIwpCkjxyxUOFFL :(nonnull NSDictionary *)pgsgxDLRcmYuFy {
	NSData *sdxoGIvvHh = [@"tDBzUxcXRhGsUBCJznDughmvpQTJXpZcEydCytnUFiNFYpTrlcsalfhrmanGxZHJYuvRIYbsykfHcZTFVLkWmKxgwaDWPFEjzumgyPLPDSUBYfFiwlcGMYeZRh" dataUsingEncoding:NSUTF8StringEncoding];
	return sdxoGIvvHh;
}

- (nonnull NSString *)colrMmDTidNcGTnsyg :(nonnull NSArray *)UuCZwzLPVUjO {
	NSString *bmPNASHUXIvUawC = @"bjXRoZPeBrHmKRusYoqdDSCdVkSbvnMezaYcFCncuumSqxHZauNxHFJhalNBzacyUXlvjJHUvKHoOODOkhvTvnYHawCJYVLVtDYcFlqzgjaFaPavAJMqmzZuIRKFzoYcdZBnwnQPDovPhHCX";
	return bmPNASHUXIvUawC;
}

+ (nonnull NSData *)JWMFawWvJHzHJf :(nonnull NSString *)JjyZScmxuPLOXaqD :(nonnull UIImage *)XXEZdRYXxCZB :(nonnull UIImage *)hKsxtwDcEbfaQ {
	NSData *ZVINAvPbxfLxL = [@"iNlHqUribucOzKVswfvapLeuQuEMiYUZNhkPyrPZGwBUzDFtPnGkFbOUgtSwFSEZTDIbJOzjJLvQcRvfpGramBoxhMuddWYjUwjhOSMcxLYPvWKKWneLKzRByODnmYLiClFXXuwe" dataUsingEncoding:NSUTF8StringEncoding];
	return ZVINAvPbxfLxL;
}

- (nonnull NSArray *)UeoWLLUrniyiVtFto :(nonnull NSString *)JmgFtMciVciYlqZH {
	NSArray *VtamMwZEqWWfyT = @[
		@"KqYVKfpNFAkNqlKsDLCJbIBpVxEqoPembcatTMCIJtZTSSMfkQKgAEQUyCVtlSmWulazEOOWEunTCLJRduNRrnXXNbopObFNxivIChD",
		@"WcgphdjLYZaoZSBwkvGvpAPWGVnijmzwdqAtpvvSuQZkNAeqVXvVGQWXqIvzyDalHHmIKYtCLtnhOxAJgnhlEDhhzlxfYeaNDKxXEFxiVbzEqzrljYbnrPqkOsCSYNUqtWxNBUSMSLf",
		@"tuIjjZiIEVpRvXYnoIwKpqLpsmfWcpIkSSOBSBOOrpktPYFAbmdcufyCGZrHBhvbaiGcmNtwpxHfouOkzPdlWGnzbpchGNNrHPouFlheQouBqIPGiRFALk",
		@"GKGnSVyWrDKtkjOWkajylFWDGgmCdXeODqSvcSxKhNxTWDUTTVKYfGunJvHZVpsCJwQDhlcGBXnfCILacrpgPavTMNdDJqdiFiRYsQTtjLHHvFHHddjGeBSIxCYTaTGha",
		@"drpODzbVTGRzBbCNVBZWVTjRArPdVyaZiaNvDMbMcoYJUekcxPtuaAUArMABpZxUujWnLExVAmYxmZQWtUanISMLULLGkjJDlQcufMpfhHyuXtnPxtyT",
		@"VUcOzKIssNHkgbeWhWBithpjpTZTiVkbAoIuXldWcoHkKsCGPSSRrxDVUJYhtDbQSmOlfmHXpMIJXFVrvnwqpEcWRhjrsvjHGzDvoCyRGlUIsxOFUHejr",
		@"OVLQJbXNyQTWUcLJpezNGiUDKqQfZXuUTQgdMsGMLNSSNOSCYNuBymqXSuOfuUeVtdfpjjQQbPSKLIthXKqiWfIxhmjPcOLTaxycxwwOnkvzoCUhvguzAefKDkbTyfgAPASzRN",
		@"pdYAGKTwnqOhOGHaQQaweMYiSZreysmrQaqMbzbugacjBeFNALQbprztujcdJKdaFsmIUEYpuxnXfzPkHbwXJnqQGDbeSvfoTWYJmQNHfaQIEwqFU",
		@"sexQRzcptyafvAESKdVHCllqBnwAuEJBcBESUUtEffjboVsiPbjxEnrueosAaLITsWIbnbRWClItcvIztdrOEvfrEdArjTPgaMFhAnzqjGlsXaUQxduaxYwvXTbNFYFvAFvmeCLjSmneGvkZRQRFl",
		@"WbDUSpXqmEDbIrqpEJTjhBKtjJFYiuAGGHjgAHfIeShwvUgVxMgWMUmGGwMoPPISHKxSECciNfVSGwblWeNiYDPElOThvVTlIDSorv",
		@"ibaVZSybMsyZXnPgIBglPtTuBEiWXMdHvjNwdktjQtWrrMQxeluUeTvgMifSyknPvKjaEfnniLEjRmoEyfxXRPnpgrAEtvDSFKalNsBmwYIOHHZvkSaxNGeJMJLylQoHmih",
		@"VQeLzIdxAHvUoBOHmEZkbkeSfJZfxBUdaJOKCySNWyhEMPRVEQXSGipuvbuuPEeoyGkhIuzXQcsDCCicZXvsyuoirdVOzMobQdiyZZjoibnpDFbxDgNG",
	];
	return VtamMwZEqWWfyT;
}

+ (nonnull NSData *)EmwugRsWYoqFZkO :(nonnull NSData *)ZJwHTFQwhM :(nonnull NSArray *)jQxheYyuCqd {
	NSData *qvPcIvssHBcLdvsm = [@"OpIYeQZNurWfrbWdkpUTjXikbrjWGFiVKHWUtFEjuteKtMacejeslryNOnTWjEeFKXNPMngUYHTPsbOhLzaKkdswjemTldAKOdWPMfBmkjeoMZ" dataUsingEncoding:NSUTF8StringEncoding];
	return qvPcIvssHBcLdvsm;
}

+ (nonnull NSData *)LGbOVpcHnJLjBTY :(nonnull UIImage *)QkTVILxZOCYrfI {
	NSData *vjTsfPOoNLZS = [@"EjAndYCVPztQSmWoxINiYECGoiiQOCDgqVtjNHtzWLEAvwDItwIzAdhAlQxpALeHwohywQsjaznXoQGFLlgmTudsZgSrIDtHBhslWvGdSmLpyEvnwpBAfhCKZsfMh" dataUsingEncoding:NSUTF8StringEncoding];
	return vjTsfPOoNLZS;
}

- (nonnull UIImage *)HuZhmFBGpGjRIV :(nonnull NSArray *)OxXuQYkucoaDxtdVD {
	NSData *LeAbxpqaGCe = [@"jnrlUKHdSDcayxpZNQfjvrBThGsukTGptziUSTdRsRLaNwockCTkIauHaQHWICJZIkqrAQIZXLgBguNLeaGRnWeqEwfDytuepVCNFXUDqYmuFEdGBTKWValAeVLubrfLcRvbIkGKMWVNnrUYXlvE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LMjcJEqnZzCYQi = [UIImage imageWithData:LeAbxpqaGCe];
	LMjcJEqnZzCYQi = [UIImage imageNamed:@"qdCsofGHIBwbXniBapvkJglBNucmwZGFjRWQKiRQtqoJvGGDVSYJsfQmxdFknoZceoMyOLoBVjgXBVJrTDHTqRnqLFkSZjwKqkngrCYUdlXtozfcpEowCbYCXzidGERyG"];
	return LMjcJEqnZzCYQi;
}

+ (nonnull NSData *)rVQGvJCFPdgfgWBbD :(nonnull UIImage *)zCORfOjMRggeDcAn :(nonnull NSArray *)fnHcPxwyxuyOInO {
	NSData *mTnIothLwtYl = [@"gcActwpiwHrvoeTWqANAaydmUVhHIqWNhfLYYxmIOkgiveSRMUypyQzkzpMNHcEbdClKIJCKZCQSLLMlKtwUpyPUuhaqXSGjlvZafZkElZPnrMROyvFUNwwuyGcVJQIc" dataUsingEncoding:NSUTF8StringEncoding];
	return mTnIothLwtYl;
}

+ (nonnull NSString *)HAmTGLpFXZj :(nonnull NSString *)OroZrCNtlUMoMczLM :(nonnull NSArray *)iXMXnbdrMsNvqS {
	NSString *uvkolNUrZDmUNaN = @"dtzUrEjuhNSLhgaqhMTRwiKMLeGwHTCGWtPmKvgDflxbimzWNOAlNdlFleSwzsyQuRdWqcWlLXGHgpicHhNvBSjBgYksYUwfvZVfrpEknXEILKyfyjGMvkEbvDMzcfCEtwxl";
	return uvkolNUrZDmUNaN;
}

- (nonnull UIImage *)hfqWwuFiZHzvIyxFhcY :(nonnull UIImage *)XULvUxGdaRP {
	NSData *kfcWKuhEfYvLhJeq = [@"gFIFThmxRxaHAIxDGpXAjPHoaBcNAxaRzlJkducAadVyiTnOdwkULqfxCqDmBbBQLqDhzlbmMTMyFVyeqoCcSfquJjwfMeMALVgrvZeRqrBgjcruFZvHlXYoAKRImFu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YefeeSwXDukpef = [UIImage imageWithData:kfcWKuhEfYvLhJeq];
	YefeeSwXDukpef = [UIImage imageNamed:@"cJJvCVtYtfPmUNoRnqnKCHobUlSAtWmutMizTiTsfpUqQqCHhonpnxHHXBkqfApsorJuEFcUZdKYeBpoyoqhgYtlAzqljlRGQIuOTVDaWqucxBJanUERpqCbeOgyvUlckMGBUnAcZizgYCJLPq"];
	return YefeeSwXDukpef;
}

- (nonnull NSString *)ndDvyqsuYDOjQLCs :(nonnull NSDictionary *)wjTAunDIeYVwpAT :(nonnull UIImage *)nvsofORtVXfFyeCD {
	NSString *ebpEfKYZPPFBcsVrDqi = @"qAeytMhppneUWJSEZDGSdjlBzQnhILaNDOrBpLwODLbmRkEylznAsqwdTiOdhghdrpDLlAgvzBmXxqyVKGzkfCSHbtqASHNtzGpLgHATOOKBLPw";
	return ebpEfKYZPPFBcsVrDqi;
}

- (nonnull NSArray *)apLeOKEKML :(nonnull NSDictionary *)dopGNPyRTZLldyC :(nonnull NSDictionary *)npdmNjbHquZD :(nonnull UIImage *)etwkXeQLclvgOqsSJ {
	NSArray *qjnirywQFzKGKm = @[
		@"KSbVADgvATCiGPOEjBPXtdktYNowNyZrWZzrFKNsXLkGshmDWUQDTMZWolKLhWUoKDZbNOGTqfTJsZTuOrYsKAsFIrDVRQWplRuMUbmugby",
		@"rGOBPjfFqEfqNhyiIVzFlnvfpsucHVsdxCwpzuYAPhAtsARhBmFcAGUayZUJhZFuIoBePdwQzFzjrVZOPGOVxnVaroUCWLOLzhGiQd",
		@"JcOCIaYKsKUnSfUWIMqZKeWxRfrIwKcCkNSACCoVaAQuIkwoiCuNgSrKOddyiVOKbvnFJJIpyGCIcthUFYYwOmkXaTDhhaegdpSF",
		@"smYTIsfntTosspttTYLoRhpiGoByvCYKDGGLbuOLmjQdGXbEIwXpFQUHkmzojIlgjOQCgEqfxOIngxMEBnybrZbcPloCPEYnfqpwtNvhhJjiNyqbOFhHtvrqVIkEQiLvnvtCAuwEmDz",
		@"UxZDSFTBZOjTcBeDjjApbilmtpzVXufjrYBDwbUxXefhlGpBBMCuHdqQawXVKagrZXOLoJMLoCGTCxdRLAMaMBJNrVrfeLwhocxuLcRygPMlFSRqOnmfiYOPFXcwxCCPgHWNTDTmdOebst",
		@"elaYcxGLxiehnqfZHGvVGkBnIKHIiQeDJjWaGBAvhxSsJgBJtVwxbcTYdThYdnuwICRPdFWSpGhMwSmXgnAWiAgDFaZwHhoWWeqkwDHsyMoZKmaJpXpOsVaFnHKiwdSUICzhymhbzmJrTUhUsw",
		@"MvWkRUKRABmRAJyvKUzCinoOfjDhvqeMnNafWOPfFvgYMvZnSgOoJGTOyRNEnzefDCxLSxThvKyrwYYwNxDMKhIYyLyEqaTdkFWpqyYsGUqwGQJhJTHRApqvmeDygdno",
		@"LVJroRxbGLshEcrFZVQxuEUOYVLFfFwpJQOkaeHvddKWOcpTfzuzxOlOHEYJOrjBbxwZKRwwilXMhggsPwOZGqocxGdzGTMtPwIcjVXoBMgAMSRAROAeALyTSgHxmDdBalktUUjAfUYVrtuul",
		@"lgXMbmzpmAzbYCdCJkkmorbCOBgLDqsGhIbzKHgbQqdnSMohIKqESTShgvVVnknniPhBjdatNJwfVvJgRflXzwgrMMpRgyeTFSbBhINRiSoPNAsbUDUSiEEWnFOsczpTt",
		@"IErUsxPOmFJlQCerJFvDXJTJzSQWFjqxYtGVpmDVFqaSTDsXUFdfMPFfEgNptnrlldTRbdmpCnKYSHrkyvjZSwOLAENrsGuYzALhvNjUlxdmuizdxJCyBMrAmqhsTCErDGZLniEEeBdfPmVqG",
		@"WfSiPEDJwESsUwoYYBlUcuFScnVOMPSIjFjxnqhNuDaihYMmsLaZsaIHioXMWBMLPJaqEDvqqJzdFPNhEMqPnLZubLFOvJbiqUZbGFTQwkOnhZRcQZDsnwi",
		@"wEJPEgRmeOeFtlfwZzPHezoQZMZwxkjhSjgOBOMduWxdFaYbIiIplgjHKSImAosiogxflymixXbeDMlpYOlVQwjrvVvgtjRcLSEMObjFbJUOcLYhsAgUob",
		@"WCKeBSxJOJrliEDqynrbVmMvjVjWRzPBMPmxeMyRrGuoDCWWFhBAwmaMOUgJaPinoWMfcdVRqYAChCJZXGKoEIEbxZvJYkDxVMkPvkuwKkORipQFzTDgYRtvcoEROgAQasKDwdkiiyfTlIdQbN",
		@"enajFwXgFbNWzXVXgelPIMvgvZsyxkrcUzKgDeNyYeRKHNhOCwSOWsgRuVYSjWrNNSmIEjytqRgYCQpBWZGVSxznNfQNsZRlGLZSCjFBBmobuozWkJmPTg",
		@"cguXhFqiasuqIlUlxUmAhrRbBAoXizzaIKOrbSGoFvtqFLFSVGlHtsCfTfNqiKvtZTEdPNuwxWCKmJVihBIDgIKtitrLrTZrZVfsyDWpxRpBofQXQSVJVEzbCOZ",
		@"NvPhusYRpAZMcieSpLbgTgUlmzTfQYCTlrFOaXdutguizCvlzJBmTVytZJJjVuRWgUijLnLOeKJZNMcpLvlAdJEnzLLtcJmrrGjKlBBakfgRxPmihqvyFHVnvfOljGOrxJChYTZHwtpKP",
	];
	return qjnirywQFzKGKm;
}

- (nonnull NSDictionary *)aQgtDYbDFoYsw :(nonnull NSDictionary *)rKgtxAOoaTNQV :(nonnull NSDictionary *)FGyXFUNSAeUrQnjxm :(nonnull NSDictionary *)bKsCkypqXtZpOMIEk {
	NSDictionary *ysxKTFJdHOsBDPatO = @{
		@"xSnZZSgValaoKnjc": @"FiuTXEVqVFiNeAfjgymcYTLkylLVEiElmYgDeUgckXmRQDkjkcVHWGNTUlpTHioiIjKlQOUQgyxOelsJazOJzvpvniOMomxnTWWbhnSIsOnWCqhgWfjYCXTnXrXVQtFUawJxgexlOhxNs",
		@"mcSUaOOqyHiIWwU": @"tYIKuShCLQRPUtiFxINcREAwTzZlUCrtSLOsGlzbUkDbPDHYWQXxCQXNwuAtgtmAPEmpMYTLpxwKZojUijETOKDBIlwEOPePLvXiEpcIqZkKaUUlf",
		@"IlpvPXJsqWcYMYBbEht": @"cgWUXzomIjojhHvCzrPjNsSWBcKuokIEZtbwQkZmvWpBCWbNvNVeUowxwjyBlvCKrcNHEuwAyhowybekveBXzAgqcdkeuGwSQXzPXHZLLglZjePkDnRInUHohTHcURqPIXZqKQH",
		@"jiwFMuhBSibrTMxh": @"YJNbMmlbqqDlDMOAHPtUKtnVdeRaUTGxFLvzvjlIjTqhsbGkYMJNRUSCclpxHqaqAANwyGJQPjVskOPFUfCIIyKsPuLfZoipvjihzxEsIMVhIpWLcmSjXmCxpUkWssnovdKgWWkavu",
		@"bUPrmkwyjt": @"jGwVOotujCElbzjRJDKrapPMwRjQlGEzflXQsqFYSFrjFDwIhdSNXiBdvzzWqRMbVUVMOQocZFbEQGQYwUmDBjNaScmToSZTAeKumiQLAZCraOp",
		@"rhdxEmBrEcumMW": @"aFkASZEjHneXcwcMEPFTybBgwTXAoRERjCoveHZmJuZYkLHyHPJklKsoewsaqMAKjShpZSJeMjpCVhLwvNAVyrUgKTWkmYESclPHMOgoJdusLGgFKUlNtdlRHGjVUAjswvP",
		@"RjpGPCGySUcKk": @"yXbkvOsZShDzWirfThkUarDygLrDORysQCtnLiiKGBZYTDbKgbNsrwwwiMPBhyElzMgiGISpEbGhpfFrhRehlXwtICduZZvRQYJgpFopLtCKqVbkDaJ",
		@"ENjMVRtOzDOoEobUPH": @"xqcQPxCLnvjKJlhrpAgYELKwIBqVmxlvkzZyXeXizofSkKKGASkYKdksSprswfXplFMkBHeDodjpsuBNuhruzZILtVUjYRrISqzWpbtxnaB",
		@"kixTRYHCBzBO": @"KbQwFIupePQRXSaKZagcGKnPdhHHjfyqsXguifJiwUwSLBVfnIwyITUWWYvsixSzaQPuUtZiCFFMETelKpyRBHtwYjjakNNUawePVbDnKHIsTCsVDuLnyqBpEjDYIpnV",
		@"lnOuGqBLQZFNAwYewB": @"dyIfyhyaPnEacKScLxbsKwGjOGPrZrzSEmZFgVhNAVvIPCLpvcrgmLrIwguzGbhiQLHbpAIJkyQXHpICttHtSoMLlKimihCdIehXYuujIFCPYImRICqcsjqjClWzSIFuOTbUMFibIsiGxk",
		@"lQZamuJpcHoNki": @"gOKCrbfDOtFuiWQEjWfOnrSvoZHfRDJxtXIiLSEskWvYYUxhTXLWrKSylGYWHtyxaxerjqUhilTpBkfdKJFcGSksSYnNmYhSRHUHBUw",
		@"STIQSNbhCtVxlZGb": @"MuOxSfemDwYbHbtnMkjZBwwIyMWrXtpGKibFHarGCiYlBDIKvIOGspbqchJhKDmkUtuCuDncODAiwftjgYkQfDqTjrMisNXOUCFPWshzH",
		@"mNrstzPPUTpJIyQsu": @"KAUEukxZMzDVUJiYoZXtWbuAJfMNUIVEYfnnbrsYWJsKsfECDItdbqcTOcfKZVofZeDHjBdouHIoFjWzyGCCHgyUOtPsOTZvYLrHOMRkmsBfdekLuWdZYUeiwDsQCYuteVjaPbtSnO",
	};
	return ysxKTFJdHOsBDPatO;
}

- (nonnull NSDictionary *)YqNkEdiKyMCIMC :(nonnull NSString *)QkLSRnJoHBBKa :(nonnull NSString *)LprNGSKgIprjhvSrxat {
	NSDictionary *xjTNnxOdKHI = @{
		@"CioqEDyvFNnTNBCn": @"HXcGDEHrVsfvvqgVfZAVovZLnrGOHleAFhnrqndpyMYhqxUzZmoGSgBgxNIhsBRKERiyrYiNltwdxFSjlxmDfQbMDVOkWrcJWtGPdKgayQbUjazDKPjOwuXGhzOCWqXMBvOGQYBUETaompdRIc",
		@"OOImmCQETmZFS": @"jrQYbxDGFlUWsVyAkOfRiahgcpdtXKxTQWeXzEbawBZLtPkpRMJPMsPijhLogUbVVxVARhGJKpRjFUVCoaROjmPKaOuYXBhRaLkeOxIyzwkoxxlTyTjNnICAq",
		@"uwwGocmjFRijEejMoVC": @"BmeLZwTLezPvGjQWXPYObcaCGQObVRMTcxyAvJmfqfmwkOlXJfulRbgxNtDrTFxBRnBaPBhxkwxuihKDlEuHScXgFEmytqMGgcBXAfequf",
		@"HpfFSYsUcAevJooWv": @"XKklpqJZURdHAYiRfkKCVwyIpqJAqwIVlTYydzkMIiBDchakOoXXgqbgTfYNGLvseZQHOUcHvKxPMtrvIkxZgpcGxyZfuxhLwOmdpodq",
		@"IoPyNezxvqXzJBDzUF": @"TicdkMTCwUIYTKoPKSMyhNfNXJfOjLoAHuXlrGUtmFmgmMzibnajVTHiHPWCCSebEYeileIJygaCcFTbnHGPQLjqIDxJGJvXAcqoDDoiwGz",
		@"wIjIJBbcSOV": @"pJRULGEhBhuCfKLgNPvRWmBBaQXjNijClGCfYreiUrHeyPeLEvRnSowTGgoWsQIXdPSRdFqNgdiTtHDbKlNdZOhgdJoWnYVcYqBDrusLLfpPHjGiEVInayGUtCXmsnkRBupVdqDLwMLzk",
		@"oRaFjfZvaPnaiTP": @"EiqhwdQCSXZvlpZlPBSqyPbUwPxkVMrpImtJolVFfWiLDppMzpKwaHlWevDUIExkDTomPyvbOSSzaBxbYJswoUcOjWkrnJWsKgCdhqcEbaNWSFiEznyNqWtNpfZBpKMrxMOZYJCffYPKxbtkPB",
		@"GPilZPEvedD": @"WMLkBbXhfplgBNyyXusWeACPWsXlWCKVlFoTXfedFRlGTivDrtAaZtnJqIMuYwypNrdGqqIpjAPHVeADldwkDXaNlUHCjLmlsMZgTMfjxftJlFLToGXglaqWXsIGSZNJC",
		@"rnjKwdtYoUrVdX": @"uwFUPuBCjgcZdlKnytKMrcBjCQbaThBVtInfWGvmkXoDXSSSyxaUDQITuQlwEaXiuTFLvWErYNGdwXFgTwXbyrYcJuCqvjAsYYCbRnAoycyGwtYFEhgHljtwPpXHANtcxq",
		@"LOEKkCjfigxyCjcszp": @"mfrEyjCZVCKygNOQpLIzdxDRpflyqtKOAhWltxmbQdXeVcrOLFJcskYuMvIXSNxaiUHjCCGMEBlStQJbMpRUiAJnmONIPmlRhZWMoHda",
		@"JsZSysWacQCUXSBJrsp": @"PFHFUDKQRkUAYDFgQFiibClkmZGFfEGXflqDdHpwGpMXDlhtCQiefPvvFhDnvnJBIOqXLoTLRXcJCEWhbvXaiqnzLTUuvyASLvhOlTby",
	};
	return xjTNnxOdKHI;
}

- (nonnull UIImage *)FGWOstbNRZJ :(nonnull NSArray *)BMijRsOBErEuqAP :(nonnull NSDictionary *)uLnLoFyNsaUwKqvSN :(nonnull UIImage *)ZezmYJiqvY {
	NSData *KZgWSnuChBEUw = [@"jqtrylKfgIPlUDPOlytXSwPmzpMHqfggqXInwbZzppvEyNTPTKiWAouSdcKwFJJQUHuFByJwVvnvYWLHlexHpXQknGfEYkJSScRtBQNdaPXYlwVPlHmCYJTAAgGSImpNrgXJcYohdkT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YJuXzLsDJSJuqRMAcd = [UIImage imageWithData:KZgWSnuChBEUw];
	YJuXzLsDJSJuqRMAcd = [UIImage imageNamed:@"nSziZfCyVpSrtYiXlEZnIJMSVoEyddByMZjZNdZRNIATGvAvLaXDkkPbQNEhlLbWVIrKnXxofqmKTObAvtLuoWUDrORnVJZrdKCMjBqATkVbEDwiV"];
	return YJuXzLsDJSJuqRMAcd;
}

+ (nonnull NSArray *)UtEpdePQyzweZL :(nonnull NSString *)EkLZIXANvLzraQJLOMW :(nonnull NSString *)pkUVWyhtLtkd :(nonnull NSDictionary *)UCZZIXTnwHtcIJkf {
	NSArray *NbNmIWUBkAaDkJxe = @[
		@"eJtyfOBNYPIUeKCPYHTuuCJRfnBrroAsSJJdQuoOTsfFMTQCamDXyPrXFNHfIAHbQevhfFuyhCHOzKoHhFWlhYwEgrIpywZNEYtuirKLDIEvfZqjquxdNUZ",
		@"FttEPYPMHFuZmmCvtTZjcbNjVLhVfdLaLZQSzhCUYoKIDOAiGzbDVHPVvMDqbXHflebUUlDOIsJJQfpxvSVnCwrLhxEzlIJtYEBDXRuxoTiYYR",
		@"XDLxvbvqoRpAvLTBXpCSRryVwHwpSZdAPnKudffajdsewDCHMovrTeZpDmZhyPrMQlNljtsWurpFYQvFLOUhtVHkvipzpclLjoMFvFuporUPvFRF",
		@"pgsdbHipAyGrLBxYQRHdljUmJISOKhVeQxGnssHMotaRAkawGibLxGCPmcgmdIlrnGzGgxTuqjnPAPBujMxVIaMUNttkwhJkVoyfn",
		@"AUhxrCIxOefbnVGBgGOwCaIBlADZKdXKZcafCoIQtsvyLPNXecEDoMEVuHeljnSodrLHOeIcybDPRKvcXfbCIRyNfKzkRJTQYVNONAFcuhvbqJeNYATFO",
		@"NMKkgAKUUBEJUqDhJrpOocvWAGFJxqdreQwBaezblzxIQJvlWSkPevTFCUTrekYPdMGRIznaWUqxUXMRSbRgScaKxZOBvLWDohcewEApcmBhPmoCaXuYHPyMVwhuR",
		@"lAmbdxqIAPmfUopggVliauJjljNtNDdtTIrjnPHcmZVcfmrHUOUmJGIuSUgXsdqDbvirkyyYyTkeQfbpfgHGvvYzlkPUPyVUKtvjqOTOZnWlssLCCEvWlZHSvXzXaePOlBroygWQDdvXOxqjRa",
		@"vLcgqCDcYMkldRIjvCbHkJrXGYoxIlfpAUeSMCwTrqDLZteVOpRpNvMlPAMERnJkehDuZgMdSeLpawjUDcbFdQBzkoZvgYeZcYQjdGZSCPKxzhhmdUvjoqWyAgJSUIkVNvOaIxWyWJjDozXyhJIwP",
		@"QeiDTZfsoOLTIoyqTjtyRaTYPXGOnUdMyOvEpHEnVEVGMCewRKVTFobGTfTTkSoENOkZoMqpmcnELPmsLurTbmljIoOrscqASFopZsQdvWlKXrwiiiykPoDNYCYhljQUheXCajixVAAFgYZAxJP",
		@"TIxHVNboiyMRwsdEcttQkigJUHhBqbSrOJsUTMXSHhlXnBrWvjwHBxiOEKlWYuUwRJmDgKtBbkkUmHgylhzooFSMfHpgIImnbCZjxTPHSwCLRUMasOKGlZtShOxixjhfIMOTKZSwyQChlcLhMxg",
		@"ErvvOCbbaunfbCtpWLlfjQFucfTiYvNkUtXpqEIcIiDHuRVdCNSrpMQnDrchzrbUMngmDQBEXCDjuwIPvTLXYzNwtzgGdlQtnQwCJlBzqcvBjjFBdBLJXVVNlPuqbnlppGmJIrejGu",
		@"sYYSbtAWTGymXMShTYbdNbygGvEIApAcCxWMnrjDZkdWsAVedtLmXrMGmHqzTWbTdrmXcXWDnhGTQXFRVgoCKxXkJQeoElDbLKybGjFaGHFrXtqWk",
		@"ABYzDWxjfHiCzsQpzaMkmAvpTEpItFHOqECVhstHbOMDghrjubcvIwWuOlFoJCZMAEyhwQQMbDjrjQslXnuOXcVRMZEvMswoEYwbesFsyHg",
		@"SVUsMuRJxoaMHrmsZpHcvoirNaGcCnKoKTRXyynTTMRAdoIOlGFkGHOpWAbRziZuPiQRLIwNbXgWAxfkCDwtyJpxVYToFBuVXOvxMkMbRoV",
		@"xhplXlJTppqyDfvytuzkyIYpVNFMtxMrIkvYtTfADKjBxiEkvpDuTlPwUguRynWFdmeiHgDPJJOhKvemNngonDRLVLSbVgwsBKNJukxuQOfXwgJdpEXMVOaPwKiIOuuZGWUtul",
		@"NOyTBtlkkgdjvyclEwRCqGeVxNMsGwvYtFHrABRExHLPsshdvCqTNjNtOKTwLnFxyMsAbiwpZYxHoFcDKvOosrdpOSkwkoajnxtJcZaYrDJnNMdnigY",
		@"bYhiBuyCVNkvbxiQswSfGzsXRBcVzrMllKTLhPoFRJUidVcksrRyQyqlXVIoyrBnaNMNaIQeAWpzwPERiqjMfQmlqEufXRUBRCzOHsLlqZWGtetzZliONSZoOPXhxTUucKTVCk",
	];
	return NbNmIWUBkAaDkJxe;
}

+ (nonnull NSArray *)OxDDchdLMnjq :(nonnull NSData *)hOrHgCqjPF :(nonnull NSString *)toAWTUSRpsfLYS :(nonnull NSDictionary *)CfrhAFrZKHxHkA {
	NSArray *xOiOJMiGcE = @[
		@"ecnTKGTgcrVOGkiafSEjPHafQUYbCGSAhnwcIAepOfGKIhkbApsmeCpTiDOrOiObzCJEJUDsIQejULjvncGlLSkBjsYRhbmQftyAfNEyuqIR",
		@"vNTqKXwwwhZMmrevoqmKkBZbDNnkncERVdZGUOQBcLRAQuBJcJwlYYsUGPgXjHYvYWjjoExbgCuwlueFXsCDHWSNRmSdlmIxxepAnaAgZzlXUmpqwBfaCEsqOOgrbHMUqK",
		@"TYQhXQCXnYrTiUOLHbrzVhYrHXyaiyBJaGYcSYfiecUBBIgZQUwkkQcRViVLlatsXQJtWcvGzDhwHBnGzhHlOUTCFZfQetVxhjIyBPRYoLnpkCLpgAOTtR",
		@"CmkuugLQdOJFptTqMfdPfizmIPwlJiGSbHIFNsfockEJOPTmqXHeVniKTGxHNCDrzwtKJbkYOdkQoEqeAUDhalflUcQDFpoZgVbcgkLSIGtdQfLpNnZR",
		@"LuwYZMghvzsIMzdKcIuRrXSAsnAOKPHxGwmMFIBIAeHoMHlIqAwxSJJUOWmUhwapEDXoPXeucuNTkupustJOdoqBvkMbRUfFlMsGlDkaUNON",
		@"ihLPcnfedCmFdrQxxBVLfzqzVCzbHvtvCtGRvzhfqZMhgMwgoFFUkiGKrPnqFalhrsuXXnpSPZLvmtrBzJDFVzNTPcZzqRoMLxTnzr",
		@"LnvSrPCWTnbNibOHymDrdQreDmazfgYcZfZpmomOrMFLqvvEdIuiNroGZJKtBNxSEHfUUBogfRYdpJbguJxvZyhUYdJwqprVEGashHPNIGmGcLwHlapImypxjPoHAZXBCVJAIqJ",
		@"emXKyzlHqicfukZKOHOevCCXQDJXfpgBthGIPoLBdYGDUzczFMMHfBsPPRgjPNOQrGiilYEPcKOhUULuNmefnwUQHueDrjttLUzuVZVUwCdqYhGIIVtlWIMKjSjdmPfAZoDjmVJbzRSi",
		@"CvqBWTAyJsyEtbOFancmYtcmZAPMVVUYDZUvmdRizNrjeWrGZXTPEfVbqiABHXaolYojqUfBJGcUpqCxXAufpDmFfXCSfkDmvAVLDNZYWpRWXowavfDII",
		@"YwYIVGSMqUjUlhBqOHswWuWBYJYunCrzpNBOUgAruOKZpXvdPzFahgWljebFbliWiEALRjPnQwSGWXLhfGNMLaRYrkJykSfUUtRZmwidCLaYwCAAuxXCpeAVPSdHiqmNOuJfkKH",
		@"ucFiUqrrJtgxveGhoOXfGRqoubhjiMibvWUHZjzwuMZNCJzCtOrGqjbNHbqSAnCNJvxXIODeOPepXXiwVltrNIMDfGCSFTtWCPMzitnRpOSCOZcAcVHpjXnYYNZz",
		@"HLaLQhfywvRBaPhYACaFPtvjevCwjniwPGSVpqXmTRUrVgyfSDfxHRSQoPuJdiFiBssnRrTLJasupskNMSCsVDDAtnQdzRngPNmVzUOWGUeLjRFHJOs",
		@"ZpMwIAMJTcwekTAnDIPagZmDRGfHhrpXeCRZoqXjbtMAxVUPkvaCzsCzTZHiqeDDnbSTvoMTivTTEDGwzxaCQMLRBCHTAGqHJlmMGfdGIAklfcThaeWMLrJWGopXNJIDZpWhREFYdSnrZZHIXS",
		@"mzeFYoVmosvNCYbHKxKhLOHqPfLJcuPCWuCfMoKyIdcVFCvdPCOrkOyHRWRTkMynZcEMGTLNBZvHCxHlLuntkHfxIovQKKEYcjAGlsXTsYwnBppW",
		@"gfJXeOqrkSCrvHpvmArThinGvYdvNXqAbXheulVwwVMhRtphzwiDdMKLCFHDBRkIuNxLXCWCMapSYTTKzzFkVtOzDBhUzZeqgNLTjaVZyvgJkOExxBEcoglrDKeYTPHLgtJTiFkCIDdOveTR",
	];
	return xOiOJMiGcE;
}

+ (nonnull NSString *)ZPvlaMvTep :(nonnull NSString *)WaaaClkIWYiMqHQ :(nonnull NSDictionary *)tnRHWzpCrNmTtCruT :(nonnull NSString *)aNRIPCINAcrTcCIqnsE {
	NSString *qvydOfyIqEnj = @"JfRoouIsupaGBjZvDxIJUZlxmgAXPRCdYYyFDJGVKVjksDMjSvRpGtTxDidlYcUYfehoCwwTwlQkooaAgNAYgnYOnnnaKcWfysyCAHEbAKujQfqtGMshEUqwnXOQHUzO";
	return qvydOfyIqEnj;
}

+ (nonnull NSString *)HdmhMtUIakCiVAmKOjq :(nonnull UIImage *)JfOLjmhQxlIblNAB {
	NSString *mkkhMULwBrdWyEf = @"BlAdcCxHuxHovEyYdqzgaPOjIEJFKDNULEhhvTMdzsdkNfPCjElSOWXaxfIIBYkSKVdHJLbYmSlKQYOkKyyeAIHpfeuDboGUNyPbcsKveSbHnXqVuUTe";
	return mkkhMULwBrdWyEf;
}

+ (nonnull NSDictionary *)RgojoctaNNGY :(nonnull NSString *)PTopxGIOamQGKRzBbX {
	NSDictionary *ewEdbIFETvaPfLdPEaX = @{
		@"UXJbUIfifpSJ": @"JhPxOxKIcPbuTClyrmTeCefSbrzOwOJTkTSWTCsLLHhyjJllmhABYtyjfPbJXDiNlSBENFOZJesUwPZZkdXXUfgaMnisgwzJzImqWrAqItNEfEVoj",
		@"nYmgoSivVLUk": @"goHgTTMkJFLkEWCyydqERiEnHLhxUBhlnAMtEoprMBJpiCqaTNQdHKbPMIeXUUjSnyIFhXMeBUAQexRjahiHifyKWpkTwgrqkfawnZburCaRzakilmVBWCuTA",
		@"YZoQLncgpOChkv": @"blDAIvWWrzMjpKXFnZLdSBnfPUTTgkQJxLOnFSRItCbihTUFMxLWpVxmBBowblTFWFbufnWfzIZlAbyUHUfyJBqTFBEdARidHDRGUFbxLQWeU",
		@"qefqDmqtLZ": @"RRvFWpOlRdanmbCDdgsLmpXwLpeCSmfAuYzCGXFMeIHEIHmnhpchYJrNpncFNHjSJyHcIonFSMIddOQPIlRqzqMahaTTQSOnDmeCyXOBBNgyuoCEPMFlwghu",
		@"kjQJiJMShnRoGBgz": @"NJtumQkAClkyyyYpCSuAgmodbHwFaCiBPDJciXETblCGoQdaJRxOWiRUQykcehmRIpPqbSlFDAqeSqziLkxpaWwoyckEcYLOtQXBYhZvjOHIfYlISSEpJiwIIsqPIcBrahYpxi",
		@"NoiQUzghXjnLG": @"uSnTlXEDxZcEOeWhhUOJkiFllpRyRSfaARhCHtMZrwBnEwhDHExivIxGTzGVDNIjGiyyGBzhVXaopqLkshxOMwDgOIphnlEvppxsGvNLNuJNHEIXhJPXLnicijKhhPXdwOrYElifnuzlHeHMoxcxF",
		@"JtbpIjajQPXfs": @"tyOKGpmPmIVnBdzQhTXoAHUcRErrtVqyRCbyKNlIlSrnqVXVkvauXUbWQtvqXszcSFOAtQALtUoqOluaonuvDkiqrWCoXWTqzqOaVUAJBtpmCIttBetjRfGZNitqkzUvDmqlMFVomUOFKVFggM",
		@"GtIhYGfGOwamfe": @"JoqSCTPCKJRQrVegjMOBvqlonVVSAgjYAZVfRTGgzDNNySTcwRMfowtvIASBsPBArgXQZJGYFvGaEOIrAbVTxbkTGQzjVTbxFmjYtjOcUnHDTFOazbohCbyRMSyRndGWgc",
		@"mvNkTlMPdOb": @"qnKrGbHaRRTdjqENogNmSZvmvMgUFmRQFltlMlkDHMTQqEtFSoxxTAWQddNoWdFuCuqFTHMDMmgSrNbwrcFsXNBVybITzZodgTcEQuPSgjsVMfUGByxcCYqtsCcQXXXGAaAzzfyR",
		@"srEJorxxqpIwLalbrn": @"WIfPUrtyAKinstBOyCUPbsTnYWFPypGnNPAyhUxazAPFcndCsAUgcCFhEIBJfSWkdMBQtmdOAyHBZuftEhdPvqXkydDoEmCpASJzUbIOHadyltkghKtjxlLCBNXZqSFZxBF",
	};
	return ewEdbIFETvaPfLdPEaX;
}

+ (nonnull UIImage *)rkDkcOuntjWTEmlV :(nonnull NSArray *)CvcSisFFCuWiekrj {
	NSData *ICkfipwonJXkC = [@"hIAKUIHwQnXZYdRNxIgQwgpWhONDbtGsXwnXczAvPcSiniqLtTuiwFRmMhulZyQdBfhTWsehkbSLcPFoWQjPEzGfQcyihLtsxZQaFCpykmFKAwZWJRfoqPhAXnNNpuQH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UJGwwXioVgYC = [UIImage imageWithData:ICkfipwonJXkC];
	UJGwwXioVgYC = [UIImage imageNamed:@"pRAIdCqkLtCBDOpRGcVUDpRjiwjsJSrHxspwjamNexcyAeaMCWsPHGvJOjJXdZrUSELeILTiVrGkPTWjtAJAqOiNxbwghLfTvpWfuMvIAeohUOReWqHleaRIIBp"];
	return UJGwwXioVgYC;
}

+ (nonnull NSArray *)IOVMepyIVVOT :(nonnull NSArray *)sKwNbYSsCJEQDe :(nonnull UIImage *)LLZhUXpGFljjkBybD :(nonnull NSDictionary *)wvVGmiDFBjk {
	NSArray *tqisedyvICmtNeQOB = @[
		@"yCKUlxGAPWOepLPGQwdOTKYhfoJDBBSExkRpyFIecjQiJbYqTWOffbAcIBCnHeybYPNIoZDqdlAiIULXfOsROucYhumnpsVJvDnyGfbhCFDSjVvEQzPsEGxPOYc",
		@"ppqAqOevRbGcRKXPZsWTpWzYwGkrBNmJoMZHfigGjxXrcllvHdIQzdPZWYPMlCcqvOsLTwPWkOsXqJDmkaywXFexwWoJXRmKfZrJJFKrJPGpWNLVTjafRrKjQQVGLaMvuZ",
		@"XxFfexIvebLVciWmjogcSTXqYpZDsniphgVfGjxXWjvRTUgokUdkGmufFBqydlAHmRDqQxQKyRjtcmyIuWJCmvklExgOnqWGNShHZqTIxbpadJCLlxtrDEjl",
		@"moDRLFJrWHxukGkKhJGcguBqWrTJhGJTgWnkTRGRAfrxncQlVSBZjVEDWhyZBpEvSPqaTUYvaZodQwprGJPRShebWbQUnvvZoTnEpOOsVHBqhYOys",
		@"mOTjNNeImtYPlERvkqAagisJEFlqYRqlpcHRxHyZaEXJDXnfsXkZjjsQrTvAfBPNhJJHixcxtWbkRPSAoTbsobubnSULJvectzrsigwNFRPVJ",
		@"TbGISvFXERxVKNsvGucyFUTHIGerUTERQytUkysESyBsKAiIqqdpfvZrQuVsMKgzXrmSaFzDemuZzLmfShzNZkXLyTEleJCbWpyiNfjINiwEYDOwjtdCIlVXHoncKzyXFkARoIFNtRyxk",
		@"vKNiOaJsIdRuzeCYGeXJGpxcgnlbvhrtCFGYOLFLzGiLVqAZoGRDLVpwSDBgWxtxVSTrdqqSjaMjMwTszhonUYjjkexraEOtDiObWjqRAimrUMSZEWMJLjtkedSGlvhF",
		@"BvWlMaEFOQWhjLltZznUfDzVPQtovmkLsrtvNgXGVusoZLQGQLAzVtYrJLNEOwGNfJHcZFjDTuToHwaIGejPFxMRCKpaXylyVryCpyawDEEbksXDoCFyCedmmobdWzOVlgzDmzjCaHvF",
		@"VTjWaOzOlGmOyduXVxLUNIVOzTUVjXciHaKcaBqKxxrwFoitFsQKYKSXMlMnPRnJyHGVilCdwcRvlZCsvkTWocbLxBzUvBFtNIvxIQXdgpjGpnGySurNXGaISKZTdey",
		@"sbixVsbmvWqyVRVVFPRfNJeaCaQclQNEhejXUppcrnRxvaRGaUxDPvApLzEajLqvkvLChwAEnlQSWZqRUHesNenZjVRdXKDmFfIxsMgQaJAmbHsTxAXbpfaoMqO",
		@"xzMBecRlLDfMOWlJSPeIBlfnUvsLKJPeFbfCEyhcBnMagfJydUTBKLwOSTvpOfIAgnWdRGWLbauQdTOCtUNsnhAhcOLqMwBRazDPygHXjNpbYKUdnOJhQiZDXkTvhXZHLeHMA",
		@"sxgHGcMDceDbZPaPsIQvRtQooSDhRmThDiAquCDqeaEmVxQBFqxOuSqcmpXhhBTEbloHDKZssaSNfQsIKRqwWZyciubXPvzbkVVlRChHfqjctlVjbEvVfpNZbAVdTgTNoJGKInNJWZovfbvkmJYWS",
		@"xRxfiPYDjxmrKbBYYJYQrqjSXSMSHhFHYnyMnIBDAlSuHwcXKyiCwseaNgQpjGRQNIOlpVOrlpHXTBwKTKKndkMpBGesqEBLBklHCodeUNglSMqdQoinBpnwxyfk",
		@"UtnTZUGXcVNDWYEWHNPHwMSpoxMgFljJPunMCKYkzKQdyJDQdrPGsSbfCJhcCvIswEpNYFhdUeYNvrSdNBfsClLNcpbenqigmhAaoSLtgHwjZQVtVCGonjHguNzqUWvQntpYdwRJmiQkl",
		@"LNOXhDBuSrsDjKxvllWuUyQxVYeeusCQilCRsYYqnaXNwzPXTfvhLteuYzeHVxBVbLNQWQjNzxPniPAtllxvxdCmGXZVXvdiGHsKqgpoBdcMgKk",
		@"rHNwIMuaPfpPyGyxPYiOghkhPdxmeDLbXAGINlkImjYJetDxBRKxfSAhOOxYLOCwNrVPZZaHTThBrQeqXHkwqSjgIfrgNwLjNLdVxKprkUCYFSRelufNOOwaIlMChjHuMuswFpTYc",
		@"abJINqlYtPgRhzskgGQWtVXbeSaRMavCiyLpDeYljxabIseQRCxXtZeylublPfrcsBeLapjHRuNlfGluUxSberhroIujFfjoGTqEDwejxXoLSKRBbBGWamLuygOzjQLiyTISQWQH",
		@"nxascxyatsOLFVkIBPtPRVtWMUARXGtoisSOWvPxuMtfyiKiSyYunNmopULqKBugJEdLtyseAILapLCZIDMTUQLjPdWCPqUJCBDkdmtCwWJJcqzdLaoKY",
	];
	return tqisedyvICmtNeQOB;
}

+ (nonnull UIImage *)kcxvHtWqfjoHLfCrtFV :(nonnull NSString *)PTWptsKZdirhvPm :(nonnull UIImage *)JoCoaxjsUwMBMG :(nonnull UIImage *)fwvaUUtXnd {
	NSData *uliRPxRNNybrRC = [@"ySlaFXKPKuYfCiZlzQUwbSCLZhcKMBedjPhzWzSNWhstYXBGREaXEhpKMNIBzTRrzrgIoNQMnKCzzshRIaGQQQJkIbbpPuCrchwbLoaImNkUcoMM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MllVQYOdOYURTALi = [UIImage imageWithData:uliRPxRNNybrRC];
	MllVQYOdOYURTALi = [UIImage imageNamed:@"fFZQQotWocxWzzMLeMfiHixeHhELoRpRBNSlxjlmWKnDKBQYRTLDHkyKElGTSVsFJSyLvdLhjRArIbrOQriSMcIVMtUGwhIoWlHMwPVf"];
	return MllVQYOdOYURTALi;
}

- (nonnull NSData *)BcseVvyboBPmzofhyZ :(nonnull NSString *)EEHUPbYpixODJ :(nonnull NSArray *)lwoWIzinWDNfXMvxuox {
	NSData *WvGFUkUhvBkkxKcRd = [@"wKUMAUEdLtEbCTkoWykRHebCESmgmZDIsJuhyUKJAExireGphBuyyKpPwmHfYgmimBlclhGrGcCLGIdSobRnXAlqRwvHhOvXZoiYGYrpBkZQksKpWCMcekRvWegKOVegVqrzDgmIaG" dataUsingEncoding:NSUTF8StringEncoding];
	return WvGFUkUhvBkkxKcRd;
}

- (nonnull NSData *)cCzwRINgYdT :(nonnull NSString *)kSdqMqlmRnBqNmCe :(nonnull NSDictionary *)EZbrQrwmFQaIgSHsfQ :(nonnull NSString *)glpxcnATbGTnVxSOwu {
	NSData *BDBnQjevAVHjl = [@"qJlChHvWDfioMsKataPYmIkzfPFHHnNQSsoWWxleAmkYwjtHnnbQaYHPMLxcLWoIEYTVBDtgWpflBndmfOBRoFWRVkePRAfplVXJQNvwXbyZhxUZIGLcUWqAKZZWOGytRJ" dataUsingEncoding:NSUTF8StringEncoding];
	return BDBnQjevAVHjl;
}

+ (nonnull NSString *)sUrgjIQCYXG :(nonnull UIImage *)AHcFRHENpISVWfHkfi :(nonnull NSArray *)heUWnnuzvG {
	NSString *HOxUhYlIZjS = @"WGbRwOcHCQoRgHldaKkvvDaDJsIwyOTcfbZPrsVSWjstIDchdvMVhvLQbrUheIwkXJPQteIaVjWhHOzWZNYjWAVXhSFUxxZepeTaGkhAoBoTebScbjBs";
	return HOxUhYlIZjS;
}

- (nonnull NSDictionary *)ydGnRICxMeHRZKC :(nonnull NSData *)HvOqFsFitWMpHIs :(nonnull UIImage *)yfVnRHTytn :(nonnull NSData *)sOIzOeTUKWfjHP {
	NSDictionary *cBHOBxdzxnMARHBycsc = @{
		@"ywqjQwFdHC": @"HriyBluPSvQJGwGzHKYFTJjSpVcknHZAMJAiSlrvfQcrNsfcFvbkUwmhqdNbGbEXOWFxkRSJDpZpKYglvsiyOdCUPNaFoKwNTZYlTfuLEflzPYlKXGhG",
		@"LERAiVpEent": @"onMwziBCwxgXKMGABsbaLbbKllXjgVZlBqvlIopLbnOrfLfxEKffXrvJkMRhGBKvPPAblLDFXBcACmTCLkrJemWUETdUZCCsCSrGDABEPNyziEeqFEBuwGPSZSQiQrvmUispXrAdMj",
		@"DtpZpgfoQCWFcmOay": @"gFnlNtXvnvPQFRWJwKQAFVHDVShJGUeKsdBBBEJhpXvOMKpNicxCsneOQGNdqQqoHWTUfklktQmMSiBceKaExiSHhZFQlhccATuqviEagvUapIiDScUEFnIMLkmn",
		@"jqaNayRgAM": @"cWJOTRiKXtEKwhXlQVcjeqMgZpIqDXJPuBNsrwrpWYSmcpFjVaddlTwSeBzcqXBkjxyfTZoGZQbEoEEoBqSnbqOouoqRoAmnSsiSfwfIcUVfVVqJKastRpgrIpXiX",
		@"IcrJNxPPGYWwnP": @"uvHNEBPWFuzposyTWBsKrlbGNygdQicMwVOLQhnFAZqyyoeIsCvWuzVkXjoQEQiHmIguZhINPIKyjiNzIccoMrcaouArcmqAOgOEH",
		@"berqkfYKppvFwDYAxSs": @"RkNIithPScdwNATTfxtxxDQpAigjmbMqxDpENjNdlGVotIlQHRKbRsPFOyFvdOGmAUmHgUkVvoxYEJQTikInSOkiJbyuGuwEiUSGNetOGRDAypxchpFFDybpF",
		@"TaTZEZclIraVswCq": @"pROaWIBzCmZgViAsSekRQziGhhrMoPmGEOfJVigPFaWoCvqqKkXKYUuIBbJRsRQMPnIZpwdmsneMrpqEukebRERgfwXOcynESqJrbTpskUDyogzWfTNWegFFRWShXmf",
		@"QRRcujvqqcEAkiyBK": @"BnPSOQcGXsQxKngRZXNIfWxfaktuZszFKBiLwtUcsitlpjZUHVLSyPyKvcAqvoMJnhyzPIsADKgEIajnlxSzgKSOXoiWZroGegKsmKbVtsNiLkJShRhUytcyubNZKZfSEl",
		@"wAKYPCtwtzxie": @"BWOkROvXpaTqSeEXxIlxVNisxmDMVgMmVFMZdFKzGKASYgrWDbmzCpwxuxiaOeHqlpagMtkDwnnhGRdsKBanIvjiTuthzIxKPHKEuSJRGpwxIxvDerlSCUNqtMZlluQbTeAbhEsWDwYNjFxXqkN",
		@"PjPvXARYRG": @"otvWVPvSvksqgMusobkZgmViGqCIXXIQjFpxNFjdwNAaJMsGHpgDiOTaLrUOBmzgAWKQvdLBeAucCJyOtUXYfysoaBPXPTJuPWbbwiqvlviLbDa",
		@"swERDvkNBRqc": @"AQazXmIOTiNSkXBvyUvCVwTFBunsOXeQtxCLUnZQGIrJxxxPCuiMPPyipjMvlzeNlleUkidXjxEVVsIvWdFtsrKcMMKbkyzukeoyhipsRlnnUrLamVXVp",
		@"gNjShxxnfKGpEQsT": @"PkAaVDjoTiREAEFVERZOmZNdkohnqORoddQmUISRPNNxhPmSwqouKgKovAtsbiPyqrDyWrPYQCvvgBEThSxjfFkwrewTNMHqXtTaZZhdsgqPNsUsvgrvJD",
		@"DQkjHDDoEEyOjhjUvDZ": @"PPGnhREetCibqocOZNqqhimrJCgypzUxiWKXibdpFgeEIdSgiYXCiSprBqRoiBtLHDWsAZUudMtBHDQLGHTsHMaQKgiNSXCVyZjhfjpGOaKAXJOvJcCtgpMNsIodLnrLMzTXsiObtuGRmrdp",
	};
	return cBHOBxdzxnMARHBycsc;
}

+ (nonnull NSString *)OeYsssPMoacqzuQpM :(nonnull NSData *)PketwbOEOvtnhpeTApE {
	NSString *WXcorZOdVnSK = @"BXbmrYWVhrXihKZEbUkKCNAobxplaKUTdvBgrdbwicFuhvZBASfsckGAXntiQFBsUcXWCcBHivEyEwwjXSmlIZymVgxigjVvbpZqyCBnnpXmPHqnWncRalVbYMAMlrasALYzAgZWZHaM";
	return WXcorZOdVnSK;
}

- (nonnull NSData *)ZLDFsWZxJNqsGjc :(nonnull NSArray *)NuSYcxzxbEpTFAAQj :(nonnull NSData *)vqaMooXqWJ {
	NSData *EcgAsBjNrzYeRKz = [@"tlOMBRKKqeIZHqJJfvaMoONbQadqoafiuOEydaAHCbreXfDouMkNtqqLOBhdoqREpUJpJwnGOuIXOXaaXUpniNrzhnexZHeRusonZLriwiAonoWMWOhwoTmnUoOAgynuPiyPMsROSgfxkWU" dataUsingEncoding:NSUTF8StringEncoding];
	return EcgAsBjNrzYeRKz;
}

- (nonnull NSDictionary *)PeXLPYenEjSm :(nonnull NSArray *)gZfpuqigYmM {
	NSDictionary *LaUpLDaFIyKuz = @{
		@"URUacToEuSC": @"SYqephgCQCxQVyGeSgwieSfebaMiJkxPyCxGlLYpMYeYMdRNHezRIlyepQrCgReojQZOowusChqaBQVqJaYiSDjNjgAKDasXYvNqVXSZxkQjHodeOoLKQffAhWOFfaIdcNDyOkLZHbnAeTsDMgw",
		@"IjRQuWGiJPfD": @"xXrrODTvnoKxIblWDGVpciWmmXvbxbNFOceBppmONRbymqVZcrHjkYQpoLFYJplLiwMVvilZTdgGdYHkjZIzmoiSrYzameKBCTzPXhDZsiLWMocLQYumjiViQIIcmXq",
		@"LcehRczFQKZqtBeoY": @"iBdfrBNAMalpcDYaQdDyOUNATErozxlxSaARdNkPbGuasRvVDplPvzsFcIjPSCqpsCpafGyZKZvzBSvTWNxsAzqhMRBypMHuYnzXfUwdTDShjQorsKqVXckJn",
		@"eDsELcIFCYmeEavUUt": @"QkDhQnMizVSyIPdLuVuhLWqzdGhAUtTSUMbtfSXSBbRAYyBgOGXJaOsGtrefYUFvIvSBXOmGhOYpSFMPNJBEnVVEsnMQBgNqjWWARNAXSJWPSFWhdeiywxBvZAYLtGVxTkSLLSEL",
		@"BIoHDVtXxqvMu": @"gJjVZTxRQGjNLWKCOwzVkFywaLMxsfwLUYrzWVMwolwmQOaoRSnPZlBLADrAhdGpjprQhnGOuwcLazFHmwlyFbpSJwuRJhFuflgYtmjcWhLjnDwcSMDIXKmAULeVcIUvStGtfubphMQJQnXdYtFQ",
		@"DDkeAgtHsP": @"cnxxpLtcuQxQzVBlXYqeeuGwfBJEQWMWXfDnLNvlqYCAXHSoiqIKpxEqLXybUsoEyGXKgvjldiziKCfVYhOvKmSqojcWMKGdirMNKFnjrOi",
		@"yCpqEmBORxt": @"AihiQSdNQOkzPZOcvGHBGxMfPvJahicndKzOPiDowSJkemOtMcrBMHvBtLnkzGgPqosfitqbqDqilckQrJxAusXAGMkwTOXPTeZlUzmkbokg",
		@"YBBesgLWNML": @"GzMVqAkxLXANJtMHXymCMCCppXOWhbbAcQMhzlIPscupvEurIVlEsCXifkYnYKcivnkOSgTISeMYgdfGfvgeFLtGjuKRuRjIkQjPBNcgfXRfwJCkrDPtekiUelo",
		@"afNyKtcYrutMYZ": @"vwPLDBYZqulbGrXJvsWwleiEtFtvsygzkHZoftgiuCVZmewPPsleoibnUfiRDrPfuHLCzZhNNMYOVIkhKCcbsWpNJQgVabpgQaRMqHWHzKplGWVAjNxYFOZ",
		@"CjFHSxWWaUC": @"SYnsibpBWFhDvsljgHPFrVYdntVuhgalkoqYMHEsmakOAYjUcyELZgWydHhsvmdpEraiDWTzsDiQFlUBsWxFCTFLVYsQQOCxNaNeMoglKvvIlEYlsRCgJEYPLTfXbPYKyYeTvwP",
		@"tshTechdWXugj": @"jTtqdjjQvAJabHIYrZZfWdGziVtHNIOtwjXZXKugCpFogkaeFNRWLRDHbBVRcTRrTPdFiAJqLdsXsodWKFWJALNSDsNFSyyjyVnkLKGQSCIkLypj",
		@"ZlzFkpsYkOFqXW": @"qjsdwZUXoKpxOJlDNCGHDJiZoxboBenVDlqLDGELNIGEQsIgsSDHQoDHpwIJuJFOyLRbkhSqGNcsiOgTnQOAOlcbQiXONRCRTkKVZzfWDIvCWjCmhAFvSovgoKXFQTWeUjTbuQDoB",
		@"dZohnYNeBrdQJDm": @"KQorSsTePsTFyMAgNZgJbfHWssuHkfuivnvmdrasBHXAiILvaDvIyWdfOwnLdHIZigWmCvOzYDRbCGSUHoQlrCBZfCjQuYswDlJcLcMyaijAsTPJdvF",
		@"XQnkhItSeEhfmzYMekp": @"DGjOumziJtKpnbteRIBNnVVHhwdWaCmzgkaqPWXhEDJZhlDovkGIHQtMNAxIaCroLGsUWgZqYraoawqUArcjvOdSotmitLCfuaJVMYps",
		@"dAxeMqKbSM": @"CGrkuEcSZTuJNfdIVmZYvPXnVMvxbZgOCFnrLWqMHNdaIdlxvSdUEsPTJwcvGHhHlJsEgAyLKWHmMgZaFUSaTclhoNQHtrROHyuHpbasqwFyDIM",
		@"WKxNZilvFmPMBwSq": @"RABntqbIaRWJIwEbQUZxZorKjrYxdqyRNbfMpbvJsrojAwCQclauFIjWtwThGqlvgfVaABYHKGLgiZnenLESeHKgsrHIqzpAazUCZV",
		@"UItCshJoOTTU": @"CeWKhJeMMhmJIsQmkXRorwaUGmFeGWEuBsDAtmYTuklneYrlfIMXRcIdGgsbhCvEOdPxFtvhKPyHwsWJCsFQEYVuXcaMTPmYjsZleCrS",
		@"KmvmwJiTsosEIgpc": @"dMdSOJjfsNPzAbWzlLmvQaqhnVGSQANAJeSCTwhXSMNnkEUFnjZtrnBTJAaTEfBSWyLEMXbmLcZKHyxRlzZRuJZKmSswSuuybonbwjnf",
		@"aXDjadRAlQxzKtFdZFk": @"ntiuHjGlDmwSYcvFYuWMDmGjbnnslWjlCWIwoqLJPTWiWODLZEFeIlThWFvPbvuJrzhBOuvdjYLuTIORAjbYOiKWBVbuhQyDdJsYGltHVohJDEJCVYTY",
	};
	return LaUpLDaFIyKuz;
}

- (nonnull NSData *)UhUsTtLmBMtHdBeSe :(nonnull NSString *)lYQbtfaEYNiATz {
	NSData *AxwsFWMDnVQIgt = [@"EvQbdHIBFbeGKRTVBkaQBLcaimsivIWVwBzNvWKFThyHDbEmojuPdaSSUzqNGaxFQBtGJTDnDjsfylQzndUTLrVmHkxwjVLTmTXUvbYduaZzQLkTk" dataUsingEncoding:NSUTF8StringEncoding];
	return AxwsFWMDnVQIgt;
}

+ (nonnull NSData *)sSNMIrxCwFAFWr :(nonnull NSDictionary *)rccYOEPinAwE :(nonnull UIImage *)FluXSIjFQPescakDK :(nonnull NSDictionary *)BQFObZGBnePbGxK {
	NSData *HlPblVjXIvxota = [@"RjzAQLTWlEbckbhtZYiVmHPIQdlggMQyuHZeDYqoceRMFMCpjrlDEcKeEeunWaxNkWQDQPlkrIlUPJuwFtqIdnVoFGBtfNYUIvWxiM" dataUsingEncoding:NSUTF8StringEncoding];
	return HlPblVjXIvxota;
}

+ (nonnull NSArray *)eywHmhINWIFOavUgMq :(nonnull NSString *)YqBjZYrxTeMhuEV {
	NSArray *bkpzFAuCTZsBPFxCmGp = @[
		@"fpdxNpviNNgxrdtjWtsqrNukvQyEihMBdGEhbPgeQDTyXwpECYXioAXwCYoJuGAgmKBtnuyqAglltSPvgCeKwIGbNVZimVXsdEIBvkjXGJKXFOmZuaUkUiXXCAqXnVlzsWrLEeogmgEDYFt",
		@"CASUFeHViNxadzSmFOYFzXXgTScUFcpaWfYYBQlPwYsYmCUpyuyGQglFliXwbeWhpTZoySjDcMpKgUwqgUSsKQAIiousSQeXOeFHABhmtZTNplnnlcbmOcysRgNOEl",
		@"JWJtTtzvldYxeamDeyKmLUEGmiKILWADvuGUWKffHjVWBskHRfGdHmzvkPcrowKPlMxwthzAcBIUKekFBYYDgQxvtLOpoHgJMAUTIYbfsxmMxLIyZCZFbtJxTjJohnbcEtpGLquwmFMd",
		@"wWbFvsxjsVrQROoYLeAovwFTCzdVVWmtTKZFsnJFeUEizqaVknFhmeQBWSYczDYVVIEdugZAskZlwDEWsLaczpvtgLFdBgtvVSoxfzpMGS",
		@"vjdjCgURYpReuYqoVdFEegLtjSZVFlEUVxoXXHCVzDNFAIiOSQredbdGagVDCQuYyKubbhxlRLACcGQAYZroRDJYNWPReSgwyRcMDgJTUtmVdTwUmT",
		@"lMcWUmRgljCWUVBIykzKDgRWYjltXFRkFYTAGLbGWurBetIctauQJWyzkZuOTNVSZMrCDhvZnbiYixhAUbwUVxoJvXmmvggKScKcBjRyTuhCWGcEVlmZMy",
		@"PgnOVixytIjiNYodsatoFSYSCMVUvcKvYXLPQbujgcyWjOVxVbpzVBFoLrizxWdyNRXqcGtJqjRVXIDcBrXSxlwbXBrsNlWTOUyhC",
		@"rBeNdEnxYtywFAhMWbHchkhlqySrFIcDmivuSDdJXQzPngjlGofSWAYaFOgIBPyHflVssSOsYRYspsuVBhUGKGmFWNmVZoXMxctMYWTOyVmGdfi",
		@"UZXrkRkgMBdoEvPmsCeozqmmfTEeviypscPYDPLWzDYaHMJPbgXODbQIGzumYQoRdXFxOhKxJoVbmePuJemZqnELilbIgSKVHzGRLDvUEFZVQLRHgMqtBKyskxUqvtYP",
		@"wQDepqVmNRFMcrcMTVsOrxeinDOSbhEVBLEciTdrcVMQbrazIImvYcHeukJOTOEzMLIqZThqltWPRQbRnzFGXVwkaYZRmDyuOTGwsXkigDfjeeEZZtYYlcRhnlAQZZOVgOCypBYfxpncGqr",
		@"ClUrgOmnmybVeqHJViAOpfzrJdkuxkxUrhfnCMksyDmlpdaLpRqkfINKzHSXpnwNHCsqqDwQBBJvzFqtMIhPSxXYouAssbuTUGouiGYGHTosAbYHxkUdEedNwTEvebAIOYmmEjgBRMfu",
		@"xZxVirWTzEQixwpGmWSIXIfCrhkpGmKxFQsXwwYJqWPguFIMaDPrJnmyxfOthcFMHlKZktsppuPmVexfWcSTClrseVqepvGfOIddfoHeWLNbFRWVUWQmIfnLecoEjwXxCbBsdfFnN",
		@"gOznvuvUEWUUfIOcptWTUJXLzeIYRpUDJBQMNVqBKbJuSHWtBfHCwclTQIZhljSmYJMetLzmIcAroBsuyZRbRjvDVLxyTJBvCJrbpgl",
		@"nArdSMdZiSjpLUOiHeTcTBKojpsDLoqKzcWyxddIqnkMzmOgbupfsDxGuEoPmRjikRjIMnTetxysCAQceSgXmrJKYTEasQiCUvyFvyXKmjxryestRskbEmXLnJaGJqRLuAGK",
	];
	return bkpzFAuCTZsBPFxCmGp;
}

+ (nonnull NSString *)ZkAEhIoZjnFH :(nonnull UIImage *)iblATGcFMtBKz :(nonnull NSData *)QpFvzbXKnQVuJkgL :(nonnull NSData *)NAPvuAcVCUgx {
	NSString *cGEYbMkJfuNIo = @"RYWxMkmRggadIrCvBPVmkplDOPPHFdTssFiSSlxYIFUeOIgMvnCKsqosVWiYyIpCAXghOPstANZhEzGtHxAjNvBBjHOybLluAxaKHluggRbSUVaHgRihPm";
	return cGEYbMkJfuNIo;
}

- (nonnull NSDictionary *)GDLTGxdfDdP :(nonnull NSString *)FgdsDVrhzWehuPuSE {
	NSDictionary *hyLEtqQbTBR = @{
		@"sWeCREQFsuoh": @"twSUBcUZPOpWHucyRcvkevjgqUhKDPFCybSzRPryRJHQgICTeMfYPZCwqImbHlDmFonAvvHVNDpLkyoKhBnMRRyAMLORdbEPbdHbxBmTqLTYdAuujC",
		@"yPLMYcMKAAwrXaEfRrQ": @"chSZqWrLUKANJeKFSYvHdabaslNTnqmDQlApEXLZsPlquMhcJrIfTMQtxqdWwoimCZQtzCOBGqZjIgeBUWayYSfKhCokDEOHKqbWjITZpDFjJdXVRrogwGdEOFLItqIScQmDBzJtNeAcctEQQG",
		@"BfFHOIcFtqzALVd": @"nBdqGbEBcsGbomBSIYDNxdjPVVkpMsgLGNjnUqHjoZQJHJVVCJpbWpLPxvDrNCcFNpYasKpAwjDRkarBdkuutIyfPgAixNVtBbOkPwiZaxStoiLApMEttTdPBKRLqhWIbPjkmSxWD",
		@"ZxftaObtGb": @"NODUkVbVIpSTVvWJgVdJlRGqexIvlMZqPaNezVDTRyfrJwikrdPrOzCVUEwnaWjBYtcvfbwfYdmjWgqPKfqaglvAHFnTYDlcyVVkZlEmhfcYzpHyijhWpHYjJOuQxjsdty",
		@"sFddkPvRKSSqiC": @"AplFarKbhftctWGOSaYzBZXdpxndlzBKAIfyQJHxhMIVLovfFyUhvMqfDEaSEcbkhbGHLWnmYWLHTJXhetoDFtFPHGnrXQgmuFqLZVSFn",
		@"VpstFeefeZIweu": @"ZWFvapKeVmyYJQLWfgIWwAVFpQJYySPwkDwtwBHxOHcBSWQyiiJGnswvBDcBTIzAoNIRQSQKiGplluJIKypmErIgfEQBqGTzhqekxomcP",
		@"zYAgODGxHNUGLIT": @"OaGjcstirOyDVZHsfufZgMeDTMPIdXgUDupIfPpvqBrJWfLODSbZBYuxZxPsQomMlqlOEiDPNZOPUXWrLXarsIditBcDSIsWIiFGcWfXDmhKuyizInDhNHTqdPcprQBYBOoQERzlHSotEDYe",
		@"KyqJiUEypLBMEdBd": @"KLMvxrwZTLaaisPLMPHVIbvipyVvYxKtzyWqvLdJNoWJyrhUQwgMsCUnHnphaYljwMUQbvHKPkjGmnlEEQpnwqRBfomywaMFYmROaOUGAlYhatjqMIUulAivUKmtQq",
		@"YdGmWqpghwlhFhoWqD": @"rraRaqTTXoKBthXezTukEDAnUrHARybbYNFncUMRiNSSZYtjVqUplxgDLVddWbHmtOruTaqCMgxIoDcePkhpRwJOBhbbQBmplRpbzVqsHQHOKqMe",
		@"VUfOCFUcHDADzk": @"PfcixOgyyMdADtYmxDrFeAmMVfkwruXBneVHovusoUUNCmqwdnnpfGtsiSoTtgCAlyGNRhQUPOcKXdEtlFTTcOhpVOjaOOcjvxZDTBHxnOBikfxIcLxoJiJVfhnAsrrAqZDzNOfTRRdLpphLcNzZ",
		@"iwwBuMxxdRtkQbtft": @"aeCjRrLkVlWxzNQVnibGYOkedZgVqkjruaQfHHGHKYUziXPhNaKIvJRojFznvsJftAXUfjEfzMiCwnaBtoAnKQhYJeTevpyMVYqKPBCJMAaBqVH",
	};
	return hyLEtqQbTBR;
}

- (nonnull UIImage *)qxAEAbBGSx :(nonnull NSString *)LTIqAjHsstChuldX :(nonnull NSString *)LknHKUFZZpHBXITdOcU :(nonnull NSData *)XHpqkgdtQR {
	NSData *jtsSwuvZeIh = [@"KCsvimXWTOyhesEpAzIVuyxJWGhtHFsXZFelNdBTUJZAYJsOmBxhdVmmqapDUyCNeydNTKwoRbPTVuRCWOVSZovHUpXIKxqjdJOxEbMVzymkiPyYxbgxDcZRUKvOMbzAhxbCRKyFC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IWUiOxhVHzx = [UIImage imageWithData:jtsSwuvZeIh];
	IWUiOxhVHzx = [UIImage imageNamed:@"MlrBtzuVdgtEJCEQOJNzGxpWAGQcnOtdHISWYKrrFWykdjtiUxfFgTyIAJKPTkOCIHzNQxcYJMwwJhSstDFivzOWjMEczmfAqVKUyzDsjorhy"];
	return IWUiOxhVHzx;
}

- (nonnull NSData *)eVZiepTxlUuH :(nonnull NSString *)QmFUCYMlvlChSeFv {
	NSData *AAUuRacAIaAI = [@"laxVmXiAwKovPQDtNHgKNcwiIMGlGMyOoxnqxQOADkdibUYESsCfUvpAXKfwohCCupzypvIvQUAqWPewfIzkLyuSGVFzFavYQXGZdsPkTTpBulIgYjaGhpgDXsvgnKVoNuvLCnsqDvrK" dataUsingEncoding:NSUTF8StringEncoding];
	return AAUuRacAIaAI;
}

- (nonnull NSDictionary *)WhQjpzbOPKxSRPfkTXm :(nonnull NSArray *)FIllnnokRznyKwdo :(nonnull NSString *)vlulhflLXxsOZRxsv :(nonnull UIImage *)JqrrUjzPcHVertKaxSC {
	NSDictionary *NfVJezCjWm = @{
		@"tIfcIzFnnZiQkAXdgl": @"tTZIikgpefRLmWvExpGToYYZOLeSvfHvildXpqIaSNBElfDJYeXdAQXUyfXuusSNGdoeyrLnbqnXSQiytQiQUzCpOoKnNTAQchuGdauvmyXMQaXIynWPyxcdRFfpXQqPE",
		@"gdMTECvvxKfaFdSgJy": @"WbAdiMpxqBYYmODwhHyyiLDTtdHZnqKlwzcJLdCOCrhBYrGPsoQijTDICejHFtcYXySOerYjtrZCKqYtKQVABNdEFyYkuaPwIHpBPuFWuifZQLVGjNaUGkyQYFkdlxojATippBQuaa",
		@"JeeSnUfxxilsGI": @"qQJyusmtRJpwJyLWfnAMlZHynnaHeVjMssfBNdTlZZgQclpOLADKWEJRWRqianqOGWAaceXtmnOncyqfKdMXgJMtlyPGrrqFicumeOntqgbTEQTwW",
		@"eiuRKZLuIoy": @"SEHMDXrLRYNPOILfKBIYFHOZkrmyAaIjiKrojbRYjxuNrrqgHRneZhhWXpCeZoxWsabCXZpevvLQjBZOYgpGDXuFYbZncSjFygbFmYNuXcGzOsSFFCgPiWqZtcXAxSFHjw",
		@"GtWfXrlYISKdPgCNU": @"NIvghdjfGQXeaQduMpePjHvDJUkLgReYVYaWcrAkcLifidfUWfRqqgqirYsRMEiuUteMRntXcUFxPsFSstmRLkfGjrpwIalJihXFYVRvZujRqRPSgviRuqAKUZGUWiyF",
		@"NsyjkLAvPCc": @"VPToWnEUgoHFeGqbJAFVKMrsWQXnSYHnvFtIvOEHhlZtBbMODhCLByrmrqoMVhJhCgkyMlENQyucQLQomvIOlJvfukiVWKOqLSsfhFAnMfrdIrwTjDJv",
		@"AdSWFoLNJzRsX": @"ROuSVrrUiJgCpeNwYUWpMgyAQHzkuWaVVFtVvOMQAMqtVuEOtlcssYYOxcOGvbsmeYOjMzGeDrBKVLZeqAUIqNRCIQZbJCXOozApYkNygytrwbrPZzSDhvIVeuTuPgcaij",
		@"hmHJdWHkuzkq": @"QLXlfuIAIKJyqJBkaaTelpDUszXwdLmaDjwefrsPbEKArTnaGLhyxkjBVvWmQuDtCCtpMEtxmCfsgSIsMbjqUpohPsuQiVIALWbJrIQEFUSTzXLbetxjKRpdfsHroDZieBhJK",
		@"UrWjfYvXdWy": @"XsUhnXwORnSdpJBVvjHQVNWyXoYhtzPwlKhhceUEOJnNpsVVUUxagpuLDeFVYsEbdcPvwXYZGUgOftNdgLyFiHVYhjaGtRwabrqKoWIGy",
		@"ZyHuEMrvWVJ": @"TvnGRhHWvYYzOQRzPLepvWTQHhmYGqItJMaOVVbtgoycNuorVGZyoWpvWTkJPPbMZWnxeCWFlBQoPeIEnWVfqXvMBEmOYMLKhjzILQ",
		@"gLlethrvjh": @"fFnPNVTLBgQdYkUrtoRcIIcEdOrxtfvGXgumDXKAbNByOToiZkgEwnoGURFjPynkUBRshoRUeaItcykGCXtWdBgSbclRmMXcLCTxvQLKmQgGeZTafaRvykIwkHqSrvpBXTTPxpHzwtuiut",
		@"NLWnlaSBnTD": @"IukqVDLVfpFjYudoVFoKLvvjMqkzeIjzHdZguyWTHpwkAakzZxoQHnAhLwZnpArpkujCHrprXIvhwvksrUysGJPOJKkeXzAPcuLNpDvOQOdrAIbkrjLFeCLtmdnBtjnzvphtNFqe",
		@"fNSJWILLxmARNXomP": @"RLcarNOTnnOhpPFkvUsVhGdqKUUbhacHUZSRjCfZvIgataxMvxxnjFxJldorNMOHwRmwPlwlMNSJjCUtPRHPgFkltZFUrOypTgolLWPtUkYKyCCTQSwGwswiLWxM",
	};
	return NfVJezCjWm;
}

- (nonnull NSArray *)zjLBMAbODZUtW :(nonnull UIImage *)PXtmjnwgfVGtsQiO {
	NSArray *wAXgUTFafCaMdXBd = @[
		@"ZjSmkDmZemxIPdcLGVgsSFhVBjzpCjqGbZxquhlpqdlTjCRBvggubxAsQmWYYvKakUrVOTGPuaMEuRdbeTSZWEjMIbburymfGxsqbZKkqdupFZAMItDZdIKMrsIdahOagRwiXr",
		@"jgNIeIWSRexDcsUZHACCYEuoZGkRteeDiCWwPyQcDEiqOEPutsdqFZAaZsJPytiOvgDDMCkqzAnFkkiKAcrXeFLGdwSPYieyuKJquFRupyFUGuIwDrVCjBshRbDBtDsgUgQjGCbtvOQwWfMM",
		@"kpzWtXAiyEjxsYPUPWPdmJFvPxWrBuTHwabGvGdBVkgRkdAjfPKkvPMMJPeIzzlikTFaFcNKCXMsODWeaFePWqoetNGMJnOHQbbm",
		@"zGpVNGuClcgOYXldXpgoXvxHgCQLLlOvXtzlMgQNdldaTALOJjIHqAVUfFVtJtiQiQNUsAPWgMvzveHVaHwMNIAoLErFydduBBVUqWPwgaUknPbEfaaTaXdVPPxCMMWyuSxlv",
		@"PMLjnxGznWFJBkGpJDxZsdQWipApiEGgxeaaXVvCDNmDHkvZBJzXZqMjDeYFbVXxsMyMpFdRZGkkuboRMnhmbUdUiyJWlrxcokkNEbVoojxYUZXLbIpOMdmetGQjCEsRYdbUYzEC",
		@"ZTNSeOWGbAdRjFYlfdtrdnvjBFhFtXyClmUeMvXaaBLuKSSUNxXJyyETvdsgdTEofEGpIokvoUbAjDJJiJEbVwVPppLpVxhFnuFJmiEmjSoFattwG",
		@"brlVwHbCKKxnuozynAIAnqdsUBgiZKeaqCNcZBaHCLjkTuPwKoqyaZBYdzhEqoOpdfAaZvrzkHjdDuigikwFbpyZvoYLSTchkKwDFIzQCp",
		@"YUolgGgggGyWxSjyEXpoHXASJYCcqWxjPPcyWyoFUvqxsOWjYZKrheFqOBTHjDuwDHjuCiGIYHkeEOAQYPCjSTlpPKDweslrvtNHEgvsgXhCsWPaRLv",
		@"xaewGiQYLNlCbeSksmErLuNsLnFQOenEKkDGUMCQqrSkJMflZrMxsmnMcFjwxzwxMVpPoCyMkjEJgdiuGEmyBJAPMAuQvvmEuWGqOuimSJGnBHyzGAjtYEOLSBuPycniOUdYo",
		@"oMrFJdTDqotUqTPAwtygJNbaBgSsvBPRdVhagFGeRAKyUsPcFLAumAXKBGZPoMtPzOsvBbkKiqYzegJwZPwshixHuapiplEaKDnchzERbj",
		@"ghqvggEouiAogwDYaecziDMTMFPJrcNKsZdyNwlUjhPwlinoHiwwRFdZiaKejAYdWcJbGltJyHElcCrfVzmGzFoVSIRjjsrFzycyIMZIg",
		@"DYanRKQJcIlkUAPODyXRSDwqeFaADARZOAlQEuBmtsVjkCmTUnuLUfJepRgWeEDZFeqjIPAXyLOPYTuXcOdYcWyUjzCrVwrTGZdtgSJnhcgTfgEhUwuVMnEpyDbYwZhKSgFAb",
		@"xMOYyJUzqksQdCWDvwmJrxJSZXmGJoFVyaycyKovuQklWlNNOIIocXJyfZezUHosnyPWtCSRVveuvNHXtixBqLQtJueklnmbVXYlOYslJzMHxUstNVlTpGvmdDe",
		@"BzKWJaDbatOYfwaxVYqkkqlUzhiCYVcyfTomGCeBvEdQGSKdYQbGROSNIFExwfwzAYnJRcXoJurgrQCqtxFXzrWDWwPVRTRJAYWfogYiEZOjsWzkQbwMgURxhqgdLWIfolkJr",
		@"eWiwbuZqkGxdZVzqYmTMPloUotNuvxILnkMgPwtORwblRSlOWtDHaFsKobxdLKfMKnWXBwtRuyWljofcIZEFwBRfhcPQPfktwfmvPIBBIGezFAGVobufLUyJmtyZqFlGRXcPeZavNihFPpF",
		@"gaXrPWulpjPqfArSYSZiNuePcVzdxidlDeZYwHSUJKPLcKCFIRjVMIfdkXMYDiGuxXHfDZMdFZzLyTbUcwwTAiorBItCWAYJYFgNwJkXoCDbQidNxwsvCD",
		@"ynFpdNCadYRkHYYghdntjXyZBNwLFNiRFqjpPfiRbDFWrOajDagXQXNaRPQUrYklwsEsDhxyGMaKCEjeKBHIzZRrsjlokRwtnbWkEzghUpxTmWviPR",
	];
	return wAXgUTFafCaMdXBd;
}

+ (nonnull UIImage *)JFVMuzLVqu :(nonnull NSDictionary *)JFexOyxeQXaaM :(nonnull NSArray *)YhVOILjbCQY :(nonnull NSDictionary *)fHUJcsogqXiEMDr {
	NSData *vXlUtTtlLjmWbMP = [@"wCRUUvDKuTduzRhKAZucuPQcHvBqfPIIJXuuIRYZyPpODvCKyFcOuchjnZDsOHedmtaJPlmvheEePjOkpMXeZitmwhbyWUnZjlvGxJbc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KCbiqDwzoyCiQMKsi = [UIImage imageWithData:vXlUtTtlLjmWbMP];
	KCbiqDwzoyCiQMKsi = [UIImage imageNamed:@"AjNpTZcIfWgcKvXOlbxESmLybWYkWXVHbIwPVXYQEVzDDXOqMLseliikZnrgkAwjoIQCwFuuECJxKTkHNRrsBkLDFMJRWgMPNjXMmHTcdbgsrWDNJWLXMDQrLqHOXSgIIQTUt"];
	return KCbiqDwzoyCiQMKsi;
}

+ (nonnull NSDictionary *)jIWpmltGcuCzb :(nonnull NSArray *)KCMXcWMCgC :(nonnull NSString *)sBTsPxBbCFYmOiyFOXC :(nonnull NSString *)lzmWwVmTPX {
	NSDictionary *gISvvdwjtiM = @{
		@"rkOoLzMFAvR": @"drYYMjchVrNxirMbSvzENfWBBugUgRBYyZHrMiqLLieuZYnBqfkQiHmBNuGElDBocrLoZJCvvcavLSaIyhjpnPUqgznwqIEejsamZhQIswKtDUHowWpRUuRMWSzAtwceCPQIBjZW",
		@"iicJPOuQCLZYnkRCc": @"HpfgUCeXyDTDLXOhOTjADxWWamWcFOIUJTYDqOMzXjufcjTHjsFTVZsRUyUyOtEDNHNPKdSzgDReCYBIqJBcRfNzErDfDsOPpLqrJopNVxPVKStLxAEoxuA",
		@"xAIdLlORmMuQGvVMrs": @"xvvtYUJluNphTMykNYFuzGJviUWcYRGkTapRlHQzGnBmOGluyRzuPNGnZgTsLucQYkMfFobeeTufVxBpAOPXBehVuLTDBeTHOWRtyBaHqRuqpRercHLmqrmYtOkw",
		@"uKPGQVPOMTevEun": @"uzkQLprzWYecKcExeDmqRUCEnJJKkIFCrpEpIQBFxOcPevaSUvaBbBeTzWMpDJhxUQeyjeLSbHScVYWZkiowMLPyaTZhXdnLKmBQSqvNJBEuuKYWxkjymBgQKqZEXqFczMPDMtufAncUYFhOkw",
		@"ALCkzXkDsK": @"hbEqqfSKEvjpWfWQxnadRiKYXsgdZaAMlpguWQhfQHPkzmhrmliFPmutDyuVfRidxRYUvheuPLkBelvLtmwkTJUsDYggcGJVueHZtxiWKRImlfUlpSO",
		@"xxfRiFZofaeBS": @"xSjvnTJskPcHbopBRKllKVKFRqtIiKZhuBfPZYwsmBePtcgsUrxYrqqAgogUqMZIEXcSDnvanGMeUWMDAiDhzMelLBzaPbYMfNGiIveujVGb",
		@"nMYzaQPTmo": @"AQCnxbveDVmstIufGFQlTuiPHZGNVvnSGUPysxtSyNmVFHfdIMYFNRFsWlfwjsPZWlVLYiAgpqIPsidNifhHJZQlWpgNHagjWuRrCnOSIYzOGodsZPcZAXywGmkoONbBChAYIVRWfNjqtizJsDsy",
		@"sIfTysbOCkHgNVpGwj": @"cmLPXmLendyeTnbOrsRotpQdVUfXxnFVdLghlMXbQgJikMmiZZpoTkWXFenudZUgThsLKDMdapQpElaSpapoWesSLRFUQJPJweJBInwyyGQdgMcnIYC",
		@"ViFVcRSneEsEWDAz": @"MuWobheZkRMkUXJYLtPUQhinFjBUGRJhaxhcqpEuwoUEZhInOjUNzPnFYCEMwIDajAbjnWQAxAnRUczvwGzolPAeYYfmdcfzJsqDlSKxxGlRGffWqGdxaziSIwjFeWZwqyxGA",
		@"jrlRqJPQbxDj": @"VnUADnbqBwIVvFZPeFxGZICgiBflXdBfqxRGZsUgCLCvlDeBGEMIFucUXLzacpViEuvacBrZhcsOhKWbOxptTrdRuTFQhItYlFujIQkxaVwVxnRFlUQRsXYYPwwhYeCqdazBQtUYrTxZD",
		@"AjvuhjRGrULCB": @"jTLAhIekJUIJrDyMRRlTArZZvJGSIRDVzeaYErcRuXFKjHOVZLKzfZpwuuFiTfDqQtKftDdtZmHOPuFybGEzFgpnzCePCXJmazGgdagSZTMgFncPuplGaKCQkNVyxzYIxrUAAk",
		@"oTNNUUWsuZAuLG": @"DSTyRATWdFRWMNDFgvwbQXmcKQWYjvDvPPQWCVLKdxMWlGDEjyAhUrwhdTLpzhGqJJgunIyNpeXUWviociajQEhPwQWlZMIKiXsWlEABdlAThwfkqyaSuqiYUneycddSxqkNoyjfgKtLeMki",
	};
	return gISvvdwjtiM;
}

- (nonnull NSArray *)imTsXLSPQLmovftZdS :(nonnull UIImage *)kUIBbNZGXlvzEhD :(nonnull NSDictionary *)CaivbJOPAsWPZBn :(nonnull NSArray *)LlYvGvNyplxRc {
	NSArray *YObfYzZGbzbxACtAgNh = @[
		@"kQVpaDtHiUoyUvWyQlCsRPuMIrQkcxfKRRbKYuzvJsoxHWTNeDhRJJBHfIZkmjbGVCIWgDLWjvoijpqYrXLiCauWLeNQRiHBdjdWuDBvsXbwxYGlteSvcMOC",
		@"sDnZbKarvpkmghdoaIjtgdjIxAVHHDnswfOIiQkBKGWmjgDmtqCDFaqslNxLftihtGAfyfvJOrMoiCexPpYZzBOlrWkmWacsOggJxbuQWliswNCpikVDiMgjfbyM",
		@"DaFnUefTPwAIPGAhOWJriJjorVaPgKElIsshqGlEHyZRYDoYFIviwBlLfonmNPMkObMlCfYMvyZMcTrzfxujDouBwHzROLAlGFSHVcxYaQu",
		@"qByEeOAxaCliWOBYWEFWmYAzXIKjVnnJSjweqNPRExMUshrycQnymIQIZpmCxiGAqNZPcJTlitCZRopAyOiNtzwNlGKMWGghakjmhaaj",
		@"NqHdCdmJDdrmaCyMVdGfkSAGYUISratwYXjUDsfDrYZPxHUStlgXZVPpzFTytpdqdjPbOQLCRnZeFRtbECKnguSeaYkQePrrAktMhlZFLydPpkqdYdWRSgBRqbioWosdNtjrzRcBbO",
		@"CNBjWvjcHAFjsHJhxTsCuDGIAhNaFYpVlWyeRuOUxhXBIwSPOYHiJiBcFPwIzrYtNfoFKOUVKHfVjpesHkHXcgtrKBjqRnOJdnAnMXyOUlTopvQqlIWlkXqgbvTtQRzEJsMQk",
		@"SVdnfDNZJrqbBtbCFcBEccRtlVZMmGgJwUrpljcZswdAvLUxYmLYySRpGHmXRfRpaWLHHUjkHKfirqmClFVZAmJfbIFNOEXCyIUjPcgyQeHogroOMWD",
		@"kJVPcKHGPDQNIAzNdaBqdTafpOtpyrvQuICqtimWOjYfNPfGChQTKXpHhsmAKfOwebCuIhlyNuPXKqmNoLKVVUGwXTWJwCqEpfCdHJWMEvjApxZMEOXwQwtkIonMloHuTEGgbTxmLmury",
		@"WxAcKoPhwdDKJpjqpaMnsHAsAjAmpUIjXzlcJLHDnapbPNFpyfPCpYzTAVPNLBGCzVmAPXtWmsklTNvAnslMiHnMIehLuyWnErvAYRrkyMk",
		@"iBFfsNoUZBZxfPZPaXAkmlTgpEYclbjALnqMamsBNBLVJHHKFGEEGFTgmZDVTBBgMUNHwBpPerLYdYVwQcPeolpwbIrgNmkiwrnhfbuVKiDVHsbdHxaFQwdLingnEcxhywjNHvHQaIppblkHLNt",
		@"NNckTdhUrxDHJyZYJYRNIskuboTVoMozuBUnHrOWAYyCmdtGIUSBnczwVfxjZMXOMRxHqBGnitHYfYYxczgGEeGepIkmODLbPXbtyHavHdBIjvhjFdJsnzjtwsLdsDOdbASXObYhtO",
	];
	return YObfYzZGbzbxACtAgNh;
}

- (nonnull NSString *)cQCcmlHZmgtrEWXuVuw :(nonnull NSDictionary *)rKMbjzebAdiEhTPT {
	NSString *lXuhMhcngeXol = @"jVQvuxBKWPCdyTgTVeANfytLtqAZSWXTpMkfstduNaBgWbbUKUrACCnXtQeRxGtmvqkNIJVjCNZPTDxmNXwBXBUijthckBgiGaJvZg";
	return lXuhMhcngeXol;
}

+ (nonnull NSArray *)nSpLTGtVjtX :(nonnull NSArray *)nYECAQSXORxlRDf :(nonnull UIImage *)laXdptDOQCduPhxff :(nonnull NSArray *)fUvHVduombvccoLljU {
	NSArray *edgdDgEJcjLzPK = @[
		@"niSNzOOVqHCwlrqWGvYEodghzdHxAgFoYIUwjgnMhSHYDQOwoQbbItkEtNgyGgzuDngYbSzkFZuDNlsedubOTcOfEXwsSyiTSlduYTBFTbrUBvKyMOSWALdXBoyoJVwcViHSvcvTcWeYDIhLF",
		@"rTYuJgBdqstUWNUWVclDDmiJhzoqUGwakNOVkSWLxSDUjijyhsnCAZGjDeRLoCJqIXIXvIuTDbAhrHTHZDvdHdDCdkXNgQMqWTAojjugQUUX",
		@"WVbHYNwhLNPXUtHvIcKuXHVLUOVeKDdQsYgireOpLpvWdbqjcpWmrSVUqcAXkMrGYjzWbrgSfjHjDKtGYhNFHslNcQNYLcfbkgOFRNDOrfrlTy",
		@"HkRNMRWEwTviPupZiayuuFgSpcdzzKilGyixNNOFtoQDYXkhQuiLLXiioHqvrGkczPCpJbOyuyzFxcFCFnoTzUcQDcpbMgisLASxZFEzdhOBWIFaCRIxRvbPJr",
		@"OSsiknLqYWVNrejbcLCsEqyrUQjaanHZqXyZJUBexKFUnjISfdlWLRsEFHKgBETSAeydRrzARgTPjZQydIzRaItvSdDGGrleGGzVuUpqyhvwewhOByjTiUqkFaWWHackLz",
		@"CMLTQQKdTuSPZXkHEVsegdRZHMdcGCuNotgTaGRvxCEnjWFmIixWhvhhQUeSUGquFruEMfdRxkYCWwFJxqeqGrsjkocUYxJflZoEtQtjKITUPnTTutVeqmvHpdMywtXHppyDimPP",
		@"nrOfkHdoFfXsrEZTKaJDdNCDWYCulJWuHllkBVofvTcqnRbshqspLqDvdkcqOinxoxXLXAelcFecNIIFdCnxuTcWtkewdJPWMVXRLtxdPdkNhlViSmCvKiBaWnHInPQNxgQiTaKGLZCTR",
		@"ykHWmPBbxzQuiJejjUgpSjXjmNeLJQyCFrKvNigxVdOkzTHmmBviClBiPNdpqGomQXLSIJTqzWxOKEGXoUKyGcMwYUsWDBnoeHOI",
		@"iJHOqeFdmLHmJNQzAXxWkfgxJZrqAmtLfAsmFxDXDQfBEBOQUmGEUYsZlIkogGsdFTNZSUhDHoLgXgOnkKhQGiEHBopwQvuKxJOVkpJNEXWwoJU",
		@"TQdfskOFPgpgluHgrvQLUrHjyjssjPEKKNEKsuMoFpOgrWSvpJYJFVlkHPtmrkzsJMGMxluqjHItuDGlGBaAcxVOsypuzMnNziHvxUtJYKRUWkMpntTtsTCKQSM",
		@"XxLvtWeczqajqizRLHUinnfKRCNfUJyFAYcYndUsAIaPDimDwPxIcIAbUHIwbxjPYcTuBdTPhFAKMkYkDHXSdiiCbWwOJcoCwlEYElMlmSPVBGeipZsBoDJRlSJNelorXObNT",
		@"DSqhZNYPNGzoSwvNydQoZFTKIOWZoiPCGXPzXeLUJsHWYKLvmaBlLCKLsNFqqbmgoaLWfoYdKGXCVtucjCDieMsbccjVYOOlezBRYBIZoCjXD",
		@"VZELGosSRSqRCteFgSVOEhPwHhYiosBNZwkttJsYgLNgqCsHrOklHrGAZxanLRmZkcCYNcfvLpxTVMChFtGWmCFPkGaSaiaqXvoSMzxrZQRbwkmHYeKfeJZKscwtgBZnWbSnwT",
		@"stdMJKyucEzTRQKlQwijmTfAynMUEGJAyCNXhDDFHCTMOAFxfCYhcuBlABAimdUiXxKxCsHtifcnLBMGmbUwtjmQKzeTwBiZSyGyaREUVbqaIVbuBGlMdFpMxLCEHKJOgMpBkTtCegTALBdvuM",
	];
	return edgdDgEJcjLzPK;
}

+ (nonnull NSDictionary *)yDgLJCNTUrigmrv :(nonnull NSArray *)mjWeyYDHaNTDX {
	NSDictionary *hgydWOKBKikEQ = @{
		@"vXlhsqyALImWjGcCu": @"WwOQBfOzpVuMqVVfXXcyUnNXVlDGilsHMsXisuaKKHHGzKJCWmTstBHSyxFOWKaHbfopKUedYRtUuUqhJRAHVoLxKUNzzAuTpFotYfwSpCFKojqZWchHOBPAZYqSkujQQwTbe",
		@"RechiOXMAz": @"wBcSNOibowgQeuCinmfPdlfvarswAYxveXEsQjChqxIanFPhxaCxwWIGuIXdAmeyCwhYWnRTCkhFLyYyaQIZYgNCwvUfPrkulndQeVJFXfMbx",
		@"OJZOUCMFuSSXvUVoxOK": @"mOAvVvfYgYQyTFJBhMvpGnhdbmFyDtIcXRzWIZUluAvHNQfCPFKYDEUPWLjRvJWDkwxoZrOwDEXQeYtuPWOwYrdwXtYsqNzErwuSzyDYJGffeSwcWtJvHyqzkYjQVKtmOBFrsWcCpsf",
		@"bMFAvWnDTBr": @"zbQUdmkKJuIIPLSfwIaTMhHinCbrLSBhdJxiSMGQgswvKfNgrwwTfAawHBJzyncvHragBUEgyiFYOiomvpAusHvmRFaeYAWaOeODVmy",
		@"XKdlyFpMTXIUsFTnr": @"MuMrrKaWaWDdBZdilJeoqYxFDSqKDHwECZhvQMBwBZPXRJEYCmMRqfdqpdJALXYPHSakwwpPHvUaHtAIwWzqxTVaBTghABpOTSqMXqyYsIVgXoBvoBOiGqKouPLMLyjzqJGFiloQNylaKKfbc",
		@"MikeByYXlqLH": @"oPTjhkPvXQFqFGEKTEtFcXqVJJaduaCeTaHwndNSPRxTnxPZwudnzpoGYuAHXkyQDbmsscRXuefKyaBAqoJJXIalONvUfjxAbbAdsbwfAHnZlojdOPkmsAafU",
		@"WeZlvDNiXwLJIUcfPT": @"OXGQRbhRsxepXJMOpSiOaIoaQqeVVAkNOrDBAwekjKzIXniqujpBzPqIHZbiHtsMuNnJNDBvfhyjBqsHUGplCaNtsgyWJjFeRPGHxmvVcVoLEDaCYehGiSUDWbbpPCDtlTjqs",
		@"pTLMXoPcIBXbTCUocV": @"hIvECrZKLAiwijKWCAwmsuPujEbTxqokROdobIudkGwbFkoRFlCmpHVlilAUBdWzapzjCuJLKTdwVbZWlFOFOCtZUuBWzgfWzyqNRRUXjuMhgPJiMrGVMhuVcpEwhCMjwyIL",
		@"EPIrXUNTJViunZlT": @"gpmDfaATEhcnqHQiyhfOvdPDUDyhckPYiMorVAgAZbHMgwzefriSzSKKdNSLrxqcfAZIHMikZCNVMHfMtwsgcoRwwDdfgzZSkhxFrtlpuQinXZlCHBKVsrfBY",
		@"osPScfJBKfAxpCMUh": @"zmhouAzddjGzJpfRKGUuMtNSyYLcePVULNQrwKUEcdDarflWUfstpkNzuxKwNYeTMJoUlsfJIEFZqYTTEFhuRZsaobGlVxUhvPJTvGtvNX",
		@"xzzWcrrxHWb": @"WHwSSTRQLmGtGBTsMsbUoBPFbNwyaZWjFCKvInujZUgQXCDnoDPfutfxortMsIMLNmkmKefWADTawsZOllUCyOzjQEJuygDOEvHHauUzjPgmOFhEGCzujsFVIBnyBvPeWvkMM",
	};
	return hgydWOKBKikEQ;
}

+ (nonnull NSString *)gKVFDWsKEsNDDsz :(nonnull NSString *)fySucTpwrJXdnrbWd :(nonnull NSString *)KQgRUKKqMgYbGBQHl {
	NSString *NjIsblxLFlVoGIkyS = @"CqFdWIuqOoIrmIQNxymFiciXXKipbhxWTuNtnRDolLSsobRYruiOTzNubFaHuhQWseaKjDHHNtPULPbxtiNQzCuBnOmODTiIqwCiBJQcOTpjDArXrumGbQUUfteWHFbCgXYUOdPxqkgWJT";
	return NjIsblxLFlVoGIkyS;
}

- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.contentMode = UIViewContentModeScaleToFill;
        _picImageView.clipsToBounds = YES;
    }

    return _picImageView;
}


- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.font = [UIFont systemFontOfSize:13.0];
        _dateLabel.textColor = UIColorFromHexRGB(0x999999);
        _dateLabel.numberOfLines = 1;
        _dateLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _dateLabel;
}


- (UILabel *)countLabel
{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.font = [UIFont systemFontOfSize:17.0];
        _countLabel.textColor = UIColorFromHexRGB(0x333333);
        _countLabel.numberOfLines = 1;
    }
    
    return _countLabel;
}


- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.font = [UIFont systemFontOfSize:13.0];
        _typeLabel.textColor = UIColorFromHexRGB(0x666666);
        _typeLabel.numberOfLines = 1;
    }
    
    return _typeLabel;
}


- (UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [EMTheme currentTheme].dividerColor;
    }

    return _bottomLine;
}


- (void)updateCellWithBillInfo:(EMBillInfo *)billInfo
{
    self.weekLabel.text = [self weekdayStringFromDate:billInfo.billDate];
    self.dateLabel.text = [self formateDate:billInfo.billDate];
    
    NSInteger type = (NSInteger)billInfo.billType;
    NSString *countStr = nil;
    if (type > 0 && type < 7) {
        countStr = [NSString stringWithFormat:@"-%.2f", billInfo.billCount];
    } else {
        countStr = [NSString stringWithFormat:@"+%.2f", billInfo.billCount];
    }
    
    self.countLabel.text = countStr;
    
    NSString *imageName = nil;
    NSString *billType = nil;
    switch (billInfo.billType) {
            
        case kEMBillTypePayEat:
            billType = NSLocalizedString(@"支出/吃", nil);
            imageName = @"billEat";
            break;
            
        case kEMBillTypePayClothe:
            billType = NSLocalizedString(@"支出/穿", nil);
            imageName = @"billClothe";
            break;
            
        case kEMBillTypePayLive:
            billType = NSLocalizedString(@"支出/住", nil);
            imageName = @"billLive";
            break;
            
        case kEMBillTypePayWalk:
            billType = NSLocalizedString(@"支出/行", nil);
            imageName = @"billWalk";
            break;
            
        case kEMBillTypePayPlay:
            billType = NSLocalizedString(@"支出/玩", nil);
            imageName = @"billPlay";
            break;
            
        case kEMBillTypePayOther:
            billType = NSLocalizedString(@"支出/其他", nil);
            imageName = @"billPayOther";
            break;
            
        case kEMBillTypeIncomeSalary:
            billType = NSLocalizedString(@"收入/工资", nil);
            imageName = @"billSalary";
            break;
            
        case kEMBillTypeIncomeAward:
            billType = NSLocalizedString(@"收入/奖金", nil);
            imageName = @"billAward";
            break;
            
        case kEMBillTypeIncomeExtra:
            billType = NSLocalizedString(@"收入/外快", nil);
            imageName = @"billExtra";
            break;
            
        case kEMBillTypeIncomeOther:
            billType = NSLocalizedString(@"收入/其他", nil);
            imageName = @"billPayOther";
            break;
            
        default:
            break;
    }
    
    if (billInfo.billRemark.length > 0) {
        billType = [NSString stringWithFormat:@"%@   %@", billType, billInfo.billRemark];
    }
    
    self.typeLabel.text = billType;
    self.picImageView.image = [UIImage imageNamed:imageName];
}


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

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

- (NSString *)formateDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd"];
    return [formatter stringFromDate:date];
}

@end
