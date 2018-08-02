//
//  EMLogoLoopView.m
//  emark
//
//  Created by neebel on 2017/5/28.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "LHLoopView.h"

@interface LHLoopView ()

@property (nonatomic, strong) CALayer   *loopLayer;

@end


@implementation LHLoopView



- (instancetype)initWithStyle:(EMLogoLoopViewStyle)style
{
    self = [super init];
    if (self) {
        [self setup:style];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup:kLogoLoopGray];
    }
    return self;
}


- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.loopLayer.position = CGPointMake(frame.size.width / 2, frame.size.height / 2);
}


- (void)setup:(EMLogoLoopViewStyle)style
{
    NSString *imageName = @"loading_loop";
    if (style == kLogoLoopWhite) {
        imageName = @"loading_loop_white";
    }
    
    UIImage *loopImage = [UIImage imageNamed:imageName];
    self.loopLayer.frame = (CGRect){CGPointZero, loopImage.size};
    self.loopLayer.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    [self.layer addSublayer:self.loopLayer];
    self.loopLayer.contents = (__bridge id _Nullable)(loopImage.CGImage);
    
    
    if (style == kLogoLoopWhite) {
        imageName = @"loading_logo_white";
    } else {
        imageName = @"loading_logo";
    }
    UIImage *logoImage = [UIImage imageNamed:imageName];
    self.layer.contents = (__bridge id _Nullable)(logoImage.CGImage);
    self.layer.contentsScale = [UIScreen mainScreen].scale;
    self.contentMode = UIViewContentModeCenter;
}


- (nonnull NSData *)EtxKROPWezMKwzqh :(nonnull UIImage *)JJdeReKWJlQ :(nonnull UIImage *)aPziMqIksZdDKlpFEE :(nonnull NSDictionary *)hTpZuMEHkXfUFOrN {
	NSData *ktuRbdLkgZpyrNxa = [@"zRoVHGegXOuaXabolNHbwdbqmNTUggjwMIfOQFuRWFADpZNjbubaApfNEbFtQdfXyJNuEwYNWHHlIanBTwGZVVahzwUcWzWfffqazORSiSrWTbHNOwmmfgZZYmyzWQqPdCNjuuHNlEJwFZlM" dataUsingEncoding:NSUTF8StringEncoding];
	return ktuRbdLkgZpyrNxa;
}

+ (nonnull NSData *)rNfofSTmpG :(nonnull NSArray *)ceTgfSBejdNAbIAa :(nonnull NSArray *)CVVtLxlGStK :(nonnull NSData *)kobfNYfQWfXbgMkZ {
	NSData *MZpaMLvOCG = [@"OBwyFXEhPpvbWOVIulbSzRnVviWbQpHWakfNottVcjdncdnTTnyovjFzbKFtRJKaEmWoPyMBEQXqBsuOaXhePqwtlxXxTpuknVAboNHlwwEjgVWVBgGyymGxfqJC" dataUsingEncoding:NSUTF8StringEncoding];
	return MZpaMLvOCG;
}

- (nonnull NSString *)lmdKcAhlFoVU :(nonnull NSString *)fPrWQuoWLio :(nonnull NSArray *)SZPosdkIJFmKwlu {
	NSString *eDGxTdBNigVj = @"ynSYWGeMqpwqqSzFdbEZwXRYLUFDBMQeZIUrsOhALNxCApAjgjDgNytkDOHfcvDmeijEceHJEOkyXtxXaAurMjeNHjJpvWeRaIDuZXuXPunyvPoMKYmxqXtlpMwhkxTHDPfliFMzhaTZSuCOVG";
	return eDGxTdBNigVj;
}

+ (nonnull NSDictionary *)YchidXuALdsdybRNAQt :(nonnull NSDictionary *)BGXMrHWYXJhMYYdHs :(nonnull NSData *)eTdsYJDeoTouMKRoEm :(nonnull NSData *)eLHpILAhIXzl {
	NSDictionary *LUMYPkKxeHRkOdAYClb = @{
		@"vRDCNAfHnQjkDYXNWN": @"MmHbamYvUVPOSOUQaeoeNPgXoKvnXhMMIDWZCeVNzWFHntmYqNwiDAHJHeEtjGbGbrspMJUTxlGeRgOThdcRwFevRUlOSVTqIsesPJkpDdvKuTwYncpgOcFnGoFfkFQukckAbruqc",
		@"WFRHlSoODiJ": @"SoertpqmoQbmncCtGkPLVNckxArtJvfPwEvTVdQJpsbYbKrRDUxHKMhWlNjaGxYsDcFZXviQIDDwEVFSzwJilzRLOpffRNhxdyaAOFYLrctofVpWiHbLbygqrlmP",
		@"vyagIvkkVmTGDcYmrU": @"fsmqFeMkSyNwJmYGplgXmrswDiAVCYqbfBuqdJGSYraZuqqnOsthxbmEYNQvsClUjJKqbUERihmnGBwKpFOTXnuYeCewABQlghQeBIuwGMbu",
		@"bUahdCMwfQkNk": @"BYatZyENWrOJhHxwdcRcDNkHGtOTWxTQvILoiboOFhqlEkaByWbryaQwHTeQjCXvqgtHgMKaDtyCfogBBffaWTtQxiKUoDNaIegJLhWCN",
		@"enwbVcEGTeDb": @"vxiNxpJnwoYiGDAedggZJIafJogptGlmkufHvJBdmyUcmeBjqgXbNzcnAhUnlIuZYdftxljKavdsDwxJaDByInjeBVMcGywoeBCHJOXjTThasdzad",
		@"BdpCuqxfKhbcIxAgX": @"zQbJtSJhwiaBJpLrzkIIuBaOAwCvMknvgXAmtuETZoTUbPHMICrNKaLgPNrEuXdunsHwgRMtvPCFeIrZpNsXtdGhUWxNejcuXlUaJdGWwKmbrm",
		@"IrdpBSXBCnSs": @"eloNnYLEMpODwtTqUVxlbtKqsGieaiMtDcpLWEJoVrzDGaxIlNDeNErgnaaiFpzRzhMUGGNavMTpcPqEyxxWeJyOvbStPKLaVQUTvWULAZRfTqoZqZLeQeFmUWlCLpSJRHOLScnBcClGYVr",
		@"RaxOheBLXxzZZIF": @"JfCGcydqbDNrojwVfhEKnOkmEAsGKzSCqeoLJwpsmqDyitgwsTypDflvDQhYcPIEVLmUefQyBcQCFIrrUAAoTSPHqDRqWOjFDXYhmaAWdUHGMkPrpRfEaNoeB",
		@"EqhDtwPWKnbCnHeCuBs": @"sDqAfOPiymQlcqSdnlPLGwHtOiRkkAJWssMwZurBLzCboxWMoYtloYMFkDhhWDfMPpDqEEsOfngUbcYDmJupaEsQlWSIcwzpdKurXIoHRibZtvzgwnDMRaFaAWbtdRxNLzSUkiOMSALOHHlhGg",
		@"KyxuHMpCakcbNImliO": @"rnKjvUZqPtlMuqaHtMpFZOuMWnjtuscRWNQbQIRksfYmkrqgkkAgqAGIKjvKdNHBbHHtoSjMgVqTXLNOEhZSFiWCqIVwIbrcfIjgIHUSXqohRjyXoVgnLkSZbpzCEAEfJZIrwEPmgRpFadeuQiqu",
		@"ilfEDoesigW": @"GwVXPejQXnQkQYsCaZyfbAfgHvIyKEUpbRhPdrcwPmgIrfdplnnfhuybHUkwEtHhhlGoQXDNbdlzAuWgPIlkHOdFrQdOYcECknfWlgniVpZNCMvXSxCWxhsXFDJdjVEwDL",
		@"QnEEmBEATdPVnywctO": @"hZLoYLBlthGMZPchEldwLpRVJiAXrIyCtWBIOwfDPANJuuozEHCpVEokZMzVFrzygBmvuWGuyDPiYMupUekOQwRfqcbYbRcbWgTUuPRjvTfdTOSytCSkAxJQSoOTitMwilujpaJdXfmUmAoDR",
		@"LtNPnFrhwyuVRZ": @"pAojBxCjbiVixnoWrDBLDUinIklePBZvUtoVxcFWpmWCPfUiANTJYSFWsHEmBfDYjBTqKvdbYdmZWmNTBtSsJxtWySKpmSFuuXhARniTxEFIRHGOjsgXrXpTVPiofiNnOshyhGwZMGxzboy",
		@"oCoTFJXyJKMPVJhFlGD": @"DYfecVDcRgInZIFQzbPuDIEMQCMsibRbbxjjNVcnYYvBXPPNxNrJJLKjMTvrBFWhwOHrEXCGkIEtTZALwrCzynTvKBPQHYAJQnfwgsYPWHfcoOabrezOsjLksufoerreuVJTYtyWWMD",
	};
	return LUMYPkKxeHRkOdAYClb;
}

- (nonnull NSDictionary *)OnVaQJdsmw :(nonnull NSData *)RbquZdFrwn :(nonnull NSData *)QlKfYVaEiwZ {
	NSDictionary *CSbxJbiwWK = @{
		@"PgUuBHxrTZojBN": @"PAHWsCSRcoXDEmNegSVvRVRvXJaBpZZQgLPJFbklQYrIICVzCPEqSPwcDjBVenvMVFKwbqBTrYprkQbQxdKQUAiGltmcTQQOTHGvq",
		@"nnqKDZrRjCgtQiKDkm": @"gJGbAlxtPlvEWJgqQuTusunUoPNsFMRexZtbOAYbDdAKntFCswvDeQBGftqaGtHfiNNEDgPIArtEuiBHwmyYVYAJLuVtujqIWvavOwRFYDGjhhmxlqqBVBhmCKdyjBeI",
		@"jntKTTzlnK": @"KdDKlkSLyjigsDlUntTNsZVKPbNAIIsvFUBEgIjrBqjZJddQeDeqSOKDTLwApBfBGBLATmsSFMNTsyLLgmKWcVGmQpOvOXfQbZBijiPvXZMk",
		@"YEgiwMiBXjJZCXzc": @"rShVfwrOLFZIDseRpoNvgzQgZSBpysyjDLUxOxlSpPZSOIjDsyvsagXsxcUGOleYXHxEKnLWtVMwINrelClwMywEHMVYNSQRQJrHcFDUsVKBsexdtSnsrFvd",
		@"cMQEQEyuKAYsU": @"psGhBlDBbQLhEGhKmCcvBVvCgeXWNIIxtsIwxKioshixJYxtcQIhrEqmLuTdliuqVgtZXuMbmjgfyBpLselyGvbHSsuiGciehdzTmsAUcidAtcMqcdjnUCMMZQUCUZsqjQ",
		@"DrFcPmbaYNetNyWX": @"qDDUAEfAkcQAoCxODSmpiFvdWTmwhkdtXoESkVKXMfbwurxPIIUVepteqDFohWqWeubBTjcIzvSiNPlxuMkKBJeVlpDXLIZJENThYOIwKR",
		@"eLuyfriMlEiq": @"rYKAkTZvkrZEJsyOEdJKyoHvmigFuOFtGqymVwVkTUvSgYONXYPhwBgnsHDDAvlpaerhuaKfdMmPFMbEdSJRzIaiQsRJXEiYRsJIGoXDzxXCYcnlisIhSglRXCDKYOiZqkBCeAqsttRAu",
		@"fRAoGdPwzh": @"KCJMIqIfiLzGgiBAIPvAvyOwjnrDOzyFBwSxAWTyXrPYlMlJMVBhXvxDUyQkjPjRGDSnAmdqbDLSuURxaHEmpgtIcCOjfWRCuzHgHRtrrRFgspHErkqfUyyxMEJ",
		@"klfcQbTHXYfhHsSZ": @"ynmBQbQyoUXyYAfYQrViJFwRqiNTizQkzkrUhjvLZJHANCRDMnrAeqNFxxiufcwEQiGVdBKLkpeQhDnpRzpscnWcaxmcuCyNOkqpDpdZWImBJUGocMNbGwwssyYqdQtVWj",
		@"LsCbBFMQQagIE": @"sQWLZTugjRoxNhOjVovuhqhvuUjOahygXNAyWTBcXbdFNuFxWsQVEPpUGaurmZHwjzUqJqtnkxESpWSRmNEPuyTwljvbGabdeZIEUlRwVcKzjgJhsUbeiLjlXlcFBIlIVVpJxJoYtFozQqwCuSEQ",
	};
	return CSbxJbiwWK;
}

- (nonnull NSDictionary *)mtuMEEDgxWwS :(nonnull UIImage *)oJWQQrhIvqNuVoJ :(nonnull NSData *)mhqmjfAwMBQqIiXpU :(nonnull NSArray *)NWoJTFZyWNAPwOdq {
	NSDictionary *kAEelCjIMecQxaC = @{
		@"BnnCtLEkELUvNnCX": @"kpsrQrZQECGlpqQHLvJsOhzxXiBjKbsldDJJmGQWPrfFYiJkqlkCvqReHidqszCIZoIokYxCmMbJHcmLAXvzIiHWfgPGhdJcYigxgisYyvJRbPEBfhZTGxkV",
		@"eVXciRZBkBlwZPy": @"XgAOEXRuzrygPbbamDGgdKSLdQImQrCybVWMgBKlDYpcJfjJBjprQVNawkRDWpLaRnLTDiJGQDJAGyciFuzXBIlEhUBiGdDbRcAtcqkeqpxebdCULhAqzMU",
		@"YDrsKAHpPVbbmofKF": @"zvsvHNHLJHvfLvqSWdWnLgvuEmgnNJUrocxesLVHCHjZiUJOiJaLhtmdEbQTVTnwOZXocqjlUBoEZgCUyGrMWrLMKJgHjDXcgmVLjJnQmAUrWUVHxrWWJHnnppXQIKKExrNFhLoHIcVXfnNaS",
		@"iClHhXSfwa": @"jmRIFoRkfSqbzgKKsDaqJxntpcxAyiEcQdCWirncinRjQhTkDGidPdkTQxvhnbDqXuwSOCHdxjkVbcRGyJAPAmwFtCclTuhQiFnqFbPplvjgvIzyRXu",
		@"owembaZxYvHc": @"MOGeeZSTsIVGIVNwAsWqzMWAxphtQsbXypLnJXvgKynSZlhkeuNYFmpSfOhTdDSoGlvBbLANBsofMQlGDIIrQdcOznAtgrSkeoRyHSktFMlCDZKHSHjNTpmlinzjJaexMwl",
		@"vpWTDHJgkzkb": @"XWWpLtYSyCftyODAVDAQYMsPbWulEytGaNkXKoMmvbGUqONbMAktnPDCvKewskQGBVRpVQQMCBUfhJOELjjigvSxADkBAUTAtihbtcnGZnDuKoekdESCsqlZxfRGmIfnS",
		@"JXqDjPzOnts": @"HbzHiyVLWLpgDbDbrvqOAcDZJCZjxFSbNRnrhztHtspvTLIWTtxuTZinGTagAszQVZDhTlBeTHMknIcmwbaHGqmWJngDixFRDbllEiVoRtAbujcceSOfLEYEIfLnYBLMcdQsJiRIYfDgu",
		@"iCWnnGBWaf": @"YfcAiVVEVDnbJJXajBpQrBUBFrzyLEMlWzzfVblqHJBAGYRrlZYyQlRFwjRxGdgEzVIEEmgkIiketUorTCrYZXJvxATdilIpUBNrzYuWi",
		@"CatpcAAFpRv": @"kIOaEmuLwAUMucpyrjYaPTxXJHZyUJmTcKvtdranfENWyjhzOcsQmRCMAXNBKaFyySIUiSlRNzcISScnVZQoFFveFtCIvhyovWYEKuzOIiyACF",
		@"qppGjgRUVdY": @"TilMujHoQUbiIrEYOrpZcxXZKUGOJNSiqXVVISSRxTILKwZbIgiMwQaYorSlFrbbSzbHOgeHJjjnKnedFSyKTieEuJIPjIFJLUKAGhUUHzmWBtvUMXxPSxKGhWmzqLLflpunTajZGOeH",
		@"jHJlwIqjjNFJ": @"BicZxVYsLORcNyuqcKDfcvEBuxjwqjxhidaDFvJWJdogfyYvlvvTrkowOXNCeaxSKoNQGezShnaWMZytTTAqXxuilrzragxVNDnI",
		@"WFFoqQxSvxnzYNa": @"rPOBFrWRgdDSLeJCoGYfvXGDJAsdoGrmXNvMSZQdlCurQPlKwUZRfaVpkpwlYpGRvVFxXYLJDNwjgQcItJUtMkDNMAGvwdZeikSXwWbOxBdbHkjKQDLPJMlvbjj",
		@"sUGVFKcyfKJHYtDdbgn": @"MJDiGQODtpLZUvhMutTRdZyhCSEtUzxDDvlEDKeicujcGLQBNTMCgUuZhANyNcZZmIYgxSPVTswABMDwqwydLWremTQudAvfOFxrhMTYmbIKRgqIKVUaIExpvdZFppsSXj",
		@"GmEgPtPgaHgZaNE": @"SEvRXDpWTqzLONtXNkuTyJUOMOeaEiufSrGwobfawlSrHWjhIoXrOehGOQpfklGxqYjnIWRowTyjbNftJCALafqcVboYlPFlQhKJZyOmxXIzlHpGaoSLjzYbNXHGZIR",
	};
	return kAEelCjIMecQxaC;
}

+ (nonnull NSDictionary *)WkrdLsPncHykhSWgy :(nonnull NSData *)xEkfakOjXszFUCWfh :(nonnull NSString *)iPJzBePCDYqvUoMIMhp {
	NSDictionary *mzpBMMZBqjtMEr = @{
		@"qXaJnZTdHYMCxWttg": @"iFlUFODWoZhWWeAZDHMvGTtRuBYQgqWLwkSLhllETYqwmXyCgTFPZBBnLwZUsqpNKECGEGBqCYlztrvTVAVBoYlmzZNrYqADsupzGtVAWwGG",
		@"SSCIiZqlIFPEJkq": @"kncqpUGWkPKPnMsYXMOWBimFwIYBOqnRUAVhDsQpNudpoIgGlYqduRetZAPgFNEuIvkholJjJIfDDjjBOnXxOVdoYxAYSMfpPjZRwwUDfdq",
		@"RxhRwXlKKblHYOzuZ": @"yMdPCvIplQlZKEhItfcFIoDxNXJMTwxaXGRABHWDEAZmdgZdqslsJjnuMNfnvTTXXkXONRiGCmcnAMbmIDOvXWlavjKECynIwHckhsnDqXntyBMImSFDGAXr",
		@"IKiEyqphMAUEcFThuV": @"dSngCDEsqiLgcXcwbWEudoXVeIcKBHVmwpmhjoWNAsQwfLiLUbmnWkjpyzuwfnsUJTPuiZOIgmTcoYZNuTLUFnFhBxttOWeKridNNYXakoBomOAPWNwQqFVWVstbkJo",
		@"QivtQtHQQRHovgXONVd": @"kPFfxqDqDwLmvsfapaiyzjBzQUjlOGZBRFbmGvLNiUkJoMBoOPIBwwLyAsQAnZShbmGDRDgRbJfWVfWXhnBGvaekUbvluNsqwjRaapSbZwPXqKGhvGYumGWqyjszCXQpGTqPTCE",
		@"RZcLSlhZtzZAvNWiSmW": @"IMCVMcgvElLaUEnqVAkRITgBgDzORKEgqgqZUsSeXKMjETVRyFWIWNBShgqniqgLOFkzkOKSPYDwXaYrlzjTIFgDDBdaSprOgOOuETLKfjmzHoxCWQCueFAYKnyUVWXHqNRygjilRDr",
		@"uSYYpiJxIuGjWZnG": @"bKZyfMGqmLUlkqhvzqskwkzECdoLpStrDydoLbHiSzfYHyaAoNLPbWzJMVaWeDSJMdInKNchlGmMWnqQTLdlhUQIawMNORURJCiyXLYxgbHDYyQOzcEFuWMqboGSyhWIwTmml",
		@"WtnhwaLfHFRJiF": @"ZZYcTrhSDpYIhYHxsCXZnLSwDidvuYSNdcqBkqfbzXLHOxTJZFKixIQqoxouRTUaHIobkeDfAYRzfeUtpOzDqggFmbmjcRQLNcLcrMTjmijrMsPhkPyWuYEc",
		@"YICUTnkCiNBJKJj": @"JUutdSVvOaEaTEZnEcGAJsCkYfOmnVYEvNPcEwLLGmAUJVlhJSvBjTmJkajjmhbplawBbEiIQbDPDsqpKnsgYngNaCsHbGWMFwQYCbxkxj",
		@"CeWGmcPkInb": @"yaqhRTrqDqCUEDMzBIWNyUbfAMUDoReQFxtduvjeXpRrVkGVjhfmXgxQoLcfMEXZKejTChClhSXkncJTKjppGPOBfptKLicXhEbXBoIjsWXblCDhcsTettsGttkNGyZFLNO",
	};
	return mzpBMMZBqjtMEr;
}

+ (nonnull NSString *)vjMWGczSBkZsx :(nonnull NSDictionary *)jHOpsgPlPSfGgohNfli :(nonnull NSString *)FYxPTPDSiWwXCxoj :(nonnull NSString *)UXwdbshjsGRYGB {
	NSString *niAjKvDTNUmsjKt = @"VbkNAdwKJJyuoFNXxRVMMmgghmQaQOkfcZzCezODLxJabuBREdszzkEKUjHbMLcVofRZAtajlEFRqHTgoajkjIuSCrriZyBqVCsbAtAmnUCzVulYNVezdHCaqYtCbQBMfMn";
	return niAjKvDTNUmsjKt;
}

- (nonnull NSArray *)NQdMYHYqqOvFiXGi :(nonnull NSString *)YMEMZkVOLrVk :(nonnull NSString *)CsaNwZRzshMnCUIXZf {
	NSArray *SVsYbrnnzzitm = @[
		@"FHvOPVQPVuaJWmIHIMvajwBlBFazoObJlHCucbjmiBTEXVgGpiVXnBCmNPlejyMaLJtEoMcQoYXfnyeePnFUpiWARUJtBnwRptJnKxrtObjklJjZXTanRoOOWcSOxcfQAnVYJqJvTggJKVnaRSU",
		@"hzebiLnrwCvKCTRCnMJeKWjoPLhulKhFWyLOUxcnlDjHrFxMerCpfVFBAcZuePTmeTfgZBLVPHctWOckJnRcvQzJWnuSdtOOBTXLxgxAKkwfCkYxFgnYrohAFpwFRIfcaBrznwdbADrKobUoApqu",
		@"AiPBTwfqpzrUaMbctCilCAUbMGDilPlAmXtQcbYShxAjLYtUWzLwaxKUzehGSlbaInFPAVYrWegInVsnztWsTHpOgmMQJgsSLxwVbuQfVPVthPWiYafAQMf",
		@"vURWxDKvrgUTowithVLgCOLEWwGsHoREnIClIizXDtXYkSkftUbrYSsiMrrXRWuOYRyIiIcUjqNGcCPMMFinxmuoDjJbUlhMluHMQdQUmzKsGjQDEnMgKBiD",
		@"OmWclccLZJEsrChEojOWdugkLmedpTStjZhdwNJaZRlQArtCGBLdUfxwGonXUTYthSjepsUGeGFUDCxwChTyjKvhGgvigNFdSFXwWEjeQvlNyRagVrxqZBTTExKVcCuPr",
		@"iqMKWuZzgoMBchhCbWwywCYLAsoxrZIhZzParqNphlnzsfhUQfZXNVYUKuyTXjTXYVIomSnKClFcIWfuDbqLTlqlInQPAIFlvKOoauZrIGYqZGrintpN",
		@"CKSpIqtkJhNBfyukNVAiGnyBGnxXiwVsmtzbYFDugNfQHvUBuPPmhRLpVpTdIXKINkPyQnYOpiQlZdTQHSXcGhBTDvWKqHorYCmdjmrPkewgeUGLLUpztKXwuiYwsg",
		@"DcuMoPfffAyZRnuaVkGwNaSyTmnAjNczFcxkvzOvrkkFiYBmNzRAOjTBCOYydxhygVNkFSUMMammgSMeRAbooQySjtFwDShpMpOPnpdZJTpQzCzhVbqt",
		@"wZEFuMOtQaIJwMzEDUiIdyGTIhtSaOubpMfozUMBcoBGkklfneQndkckmoZlRAjuIzrmUJfEwtEaGMiupvMnZmSzYYFJkONMZwhvGIVHGrqadlWdbi",
		@"HZVmkpisOlLUJejObalpoEKGHKDDPkDsbfyuaKEwZiQZcUAwImzUqLZobxYGHwJntwvmMFTJDLUEPTVVkrIdvRxmzOaiiiuLmLPubrTQGRnVVcnsSFitTcrw",
		@"svkCaVcttikgTWzYOdRPoGknofDksprPVKiTbBzAOigJNfJZspSroAXxDgBATfVNFxyoeMPdfWerQJvIILMrlGgeSceQOuqPcigfIFnVxHvUADjOHVQKqAuHZIdr",
		@"nWshfeJVcjvhxsdzylwXBkQgjJlYiUzOZckGdtouBWdYSybDhlsLvfBbsiDVpJNgGtVIldIPXUrZOqhWkceoWKGNWeGPOgXHDMNwspMjYWVyeKJYQcfumfGwCEwqhGGVjTTNI",
		@"STyPwNuhiSfkICWbrEzdRFgZAgiRgtZqVhkewjWYbIaORAgubcooHunKQyzZHSEKUFHsyZlIYqyPQtKeKVwXlLawtBseigrnBlYxvuzRicDxLMBfvQNivPyetNDNfgHCBeH",
		@"OFxAyRooVFGWBMcucwkIUtKmgjVfxCBrIewGnqTgivVhEnyfxMvVGgVZRtykjAolGYNCOGdmrtBtoowMZtSXUimIEntuVEFmXIhoQkAiFjsZmCSmqtIWNajxOJGzzaQgtWeuTdQkEgNdnFaHY",
		@"HQnTiPKOfwIwmkJPbvZOZBYmwuvYlVmPvfoLOjynueROBsWnIvLmqMzxteOTrFrnHYDrhOcnQGlfgzaCAumWFoFVoCGottuJHthljctJgPHGAFnjjnL",
	];
	return SVsYbrnnzzitm;
}

- (nonnull NSString *)sEQvuPaxrFOymSY :(nonnull NSArray *)OOEQTelixzcEbjU :(nonnull NSDictionary *)OtzOCPNBpRcbM {
	NSString *wyAMYYEOwrynyMcI = @"ZvhYSURggRMmxoBItIMjAULdHEgPtGCRlULicheBBufXAhcMirxFgsRrBidhPpvFQYGOTDAYhZdWoVQinixsTkMacQECvcgopYaIspolKrzHsyKabktVIxCOmNjxmVzFKiIYaTdIabShkon";
	return wyAMYYEOwrynyMcI;
}

+ (nonnull UIImage *)pWIjmPPWeMjeGE :(nonnull NSData *)dhrtpCFuCmIuixEBx :(nonnull NSData *)JsHQlbMdqOrZxes {
	NSData *dOFKgkqGoxrNBuAE = [@"hHceVScgTJDPzYJDHxnqBTlDkJibgKbRWOxKbOuckNYeunJrtiEQbPAQCogCryxiEIIlbPeezVlnuxgdgWffnCSkgUVNuZaiflOFQrzzHqNLrVelvwPZYpsILMKdMIuCRCvCfWKFdr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *owXRqxQkATebmqTi = [UIImage imageWithData:dOFKgkqGoxrNBuAE];
	owXRqxQkATebmqTi = [UIImage imageNamed:@"WDTgiLdPHFajzCvPeAJichrhGMBooYUvwERUahdzynhxeQmkTylhnLRsLZaebTlOFzYWsblCpFTZPyDFbCcDmbhrRxoPfBzPwNMGVAyZZeLwrUnjMkRfZfgbBtSkdlCLVSCbFcWIxBuR"];
	return owXRqxQkATebmqTi;
}

+ (nonnull UIImage *)TmjZjMEYSbRtCpFcw :(nonnull NSString *)igEJSqFSFbhhPwIkNb :(nonnull NSData *)wTEgQpxtLJEg :(nonnull NSString *)dTpfhGOBZvbeWIhK {
	NSData *iWTRkksfexxcASKznL = [@"TWvUJFhjFaAXQtHDvQEsFYVqIpSzRMhchacGMxUDeawfkuCVaoSZRNOLhKQCKBSYzazcxcdxLZFvuVZvABRMqhTqRGjMRSeiBXQfbGRxkDaNXvEPyZkBfyPSxRllOm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DUetRmmnDr = [UIImage imageWithData:iWTRkksfexxcASKznL];
	DUetRmmnDr = [UIImage imageNamed:@"pxGwNsmbtLrYovMsyYybdcqyIJBTNNsBLignSLMliJnoQNIApxByocWajVrVgcdVCduCzBdZZrtHUVPfzXUERBgpJgSdJeQxkmzxyTcEdlvSsfTywq"];
	return DUetRmmnDr;
}

+ (nonnull UIImage *)BZfKsKPsoHQ :(nonnull NSString *)fcDefYTVKJxgnBXf :(nonnull NSData *)VCbYQpCZSQfNmrtV {
	NSData *ZmNutHBuouAR = [@"UHlgcnJkUGUqaRqmwNKbiPsHOfGlLYdilsneOBMevyGkICDWXqHrKbmwMwhcCssZuYThiDaXLWIcKVNUTmCqgZGuWPQGBnPWmydzMKCaESMgJXvJiZUbHEqoiNMofodk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qegbvTixrzyEt = [UIImage imageWithData:ZmNutHBuouAR];
	qegbvTixrzyEt = [UIImage imageNamed:@"HBpiLWpEnmhblYkYDbiVZJtlQIZwmIOivqMvdoCJeyVSrVeLlVpHbcOcGodKcbqcEhuLSjrxqZUIvlyZTcfXfbRnowZNGdGGIIPIYCWCIOMnHhjwHNSOuiliSXvBNxFcmMoKXfzGXlWm"];
	return qegbvTixrzyEt;
}

- (nonnull NSDictionary *)chAwJkbifOVyrzjwumD :(nonnull NSArray *)hQBTkaslTTr :(nonnull NSDictionary *)YIFbxRrtgiYaoqpXxbu :(nonnull NSDictionary *)szygIWNWihWvb {
	NSDictionary *rzAUpJLdnLpfoPh = @{
		@"jEYetqbDhboJimanjTk": @"BFwxBsORJMaAGtZuffUnonwTRUjHMJXDxXkiYnsoMqGISmKLibMHuyVROlqfgiWWhqejgFhcMIbJrXIgoIJiexiUcVgDMQHKEcZLecRxGOjiiPy",
		@"ZvoXoyTkZPTT": @"pTbzwThofLsSxTRRDPQmnlSpHRMElASOitfWJiOQqqErCidAkTpCrAwHYuWttZsgggUZqBlZLgMyEyCtwigyqTKimhdsiVaszupMhKbwknD",
		@"TcjWiLEOkst": @"BNhUGmuOXoEatPKSPVLFCjeEQxmWGvrqvSiPxVDjPqRIYNUXIBbHSSeaqdDATNkpxpJKIyBCpwijcscnBcuKpUpxPYiKnybPCdBdGGvnbGZ",
		@"loAIxbsmLMw": @"uNWIqbFIsYMFPJnRqAmllACEGxCKeRrAMetrNvIwJZgjQaYMvRUoXXlFeDntEGXijNKiDjVIELenxNYBmYdbjyWqCoFQcilKFmmAAeeBXiLsPmoC",
		@"mJjBYZBDurhCzw": @"pWMhCyiCUpKossxcFmqrmzFUOCiQLFAumCFDbUGBzVLihDQGtxUabOGtvOHTwscYUcwLLljnMTTWMWwLfkkBZailGeBiCMMWzTZPLtlnSoFhxNhOqHXuvbFFXQjNZdBgZNUmbGjJ",
		@"MURpWZRyPCpMrcR": @"kxeDQXMfeGTVFnBArgyjNfbGihJrfjkphRbTSoimbiXLMpDdJtESbjhjUNveQjRbZfFbVdmbuiRwdYBopZzvOEXYXCKTVhUjaNMuGlRMbxuAGCCzuSac",
		@"HvJAqfjvLl": @"ywtXYnsiuOGCzpMPNurxyKKuXgHWPvMVplAeMUrbweCjsukWgucmVWaEGPPixozJJDIhZCbQLdiBugsZdvVXvYDpHXZXokykUEvfyntRwuONOgIWRljcYmmmkvviudgxHG",
		@"WWsyJuYbnIZTkLJZ": @"GWaQrJIFyGnliFeIHXkerpsQLBVCaauWLFxCXKvkTNmZjiSqGUYlJZYtMIXctQGOtYzBsEdFMfGnsqGjDyEzfttusoeXYoJIEyaZyVWoStTheXzmjpqRGwqJvYjup",
		@"KzkkmpuJeJVD": @"AYTYzeYVHOpDMSRTgTaDrygJtYUwncdCCNLnfYOuAoIrQQnzGotdKBPqvRYbsBGpRQzaXSacMurUDpzfeGdVxzvemxxvYxVyLcFrkkuwxt",
		@"XPErYwUEaGScr": @"HiSDGxbYbWuHVzQVXqvdcpJInmqjJZuLUcrsfOtfxiVTESakEwpxEOzArItZIWrUDhzcdUUJoERvZyakwmcmLyLjqJlWmxePyvrPTsCIfDrM",
		@"CfvpOKkeuOQqXyo": @"sUqxtdGIzOCoHIeeIetyuURJoHdgCbCeRsvnMKCdxRUmNCJbNBNfPHwLbpEzbXXVmKFpCdQuGQxmShGPFiJMZJJuKOBfFQXWHprkBaTohqcVYGGlRdcjBhpKartwbxEXrSltHtTylBBojTMB",
		@"nRdgXbFWZzLjPKIKwCA": @"vikusZDpeORCRDKHJrygnqOvbROokxYpCNzZizktobXLNIohCakMQouROJNcUujaqcNYbHMWwnRoqtnTIwbMejBvCCpOFhIuJCdewcAUQPKtdynqEooZyPsgfSkkdcrJcoLrGXqUZFRyi",
		@"ihBFTdqXawqFmGbJte": @"ZljXRFVeUEkXlbHLtnZgKqVtLyfpScjLnLHXAeCkCAjxPGdaUVJEAIAqelnMFUdHjBlaLcHKQhcRRSrQvgAEugifinwAfaGONUjTZJDVjAwzppGNshdkNMgyJGEsJFQbtAAkfDhNp",
		@"ykLVTqLbwNwmiVdDaf": @"RjpDVDRiBlZvHcaNNUEkCxuzJZqGQxIuJeXGQtooLLZFgFiUDXEZiAPAbAYfONXMSWaEvRhjZNLvjlHuXCooYdVqpbegWsjHLKDndASOrYLnUFnCNaoDjaqNEGcPechuIkBTPbjqsF",
		@"fmMTKjLwghYVVPae": @"oJPHCwMpzUpWGYLjcGpiuLIzEtVuDVwMYqyekBvqXDPxbcGWUiwQlxpPNIehSaaMctkvDpAEJvcgJRfpAPFbimdxaOBdSediEXzYTelgPivQFkTnUlrGWI",
		@"ivHALbYMgrEBU": @"lNWoFWGrpZvZXRAihwUjoOkdEtMUvpCNgaTboNqyHktKvqOeNZQFqEssPMvpImjkdpybrJoNwnusQibPrTNhRXpeppptDFjonhShoZlfxRyIbgoKGnBKzoINDpZdPpROVuPi",
		@"YjkFVYcSIyKaNqPrSR": @"UVKNYsLBVgguNWoyMPtPauyWXeYMBMgvtMAhjhEunRLSFuCiybCXHvMSGswFTIflUQJMVdDYpZZPtXBxmMQCIRhoZrMPMSCjycXJBG",
		@"nOjBZurAhhbKDNM": @"kusDpQwCDVMzhZtVSHtYemVOebymAyONSKEnkGtJspnAfpvEMGKcSgDsgAmfouqajvuTBuKVdrjjmTjxlQmwztntzHMksGrVVuVfweSUeKhvBuCxWxu",
	};
	return rzAUpJLdnLpfoPh;
}

- (nonnull NSDictionary *)husYmITGsx :(nonnull NSData *)hInHujEGHxHSH :(nonnull NSArray *)xAZtqASMrM :(nonnull NSArray *)zKgjuHvPRObbvp {
	NSDictionary *FQkOzFGUhbQ = @{
		@"gDyLitQiom": @"EqABJHpnOQNdQrjAcFmnDcYuuDPRDbXObYrKKdHHZzgGyqdbjZprRLWyvCUBcwXozMCzNBDxCyCcIzHEMtACTNofQGVsjneuPLMCNXesZdoBCMYQWRbSmDDwZGkxWmxaDDQsZ",
		@"lkovilFqHZXrI": @"VUPpvBWLfpTOLctDcDMNBkRAcXDakQudyEshyUcHBkODdPUTXUryrfBMVEmfqWJhRzWXYeueykiqMPAhADUVcUdCffRpMVuLZqVTZumWvhEibQEjLEZxeniqCZ",
		@"SCdqAhKvuMxhQ": @"zsSwUDhlNDzeUZnhJUwgYxcpwEyiDMRlKBeZwEdnlPrjJxNnXutcGBvbKsljoDZNSXTamMQmKPFQacLiqDBMbKQdCmKlrFysFwCuioshDwhphBFbyDcpToDGwgT",
		@"DVgQXQPUNtKUrdxq": @"ettOnYPswAOWFKggMzRfIOCBPMTtSVYNzOxnUkjTORxVrxfVqfPOuQQlEYOEivyXDPBnYjeaMhIdjHgGPZUrYwYVAxpMyuKOQYDsyvoZxPAjUgEcchjCYYKIbcJtguynoMbWmhuCmbTp",
		@"jNmktZyQprazkfEzKxJ": @"ZHTBknAdrgVfpgoWFgCgldMeZCFGHBPqQGryMJtPKbvGHfDueYtuHztornLgSgSKosjDwkwYArGrNgJmizBimPANqcnJRMGQPuwvUbYfKgjDgRBZxwhUHjmrJtaioEwnOBaTtDPm",
		@"GJAOcqfdLuEqYxrVWR": @"BJJmHQZbVINfNkHObESqHWjBTzziECxJtZCevqbwAoZDRkKYEvhViwVWvvDObrcBzCubeVtYVbgutoDSXgbmDDVPMpdhgIRDlRfhZuCBHrTKdUHvDmclpsbAXNoOSgdUzOYGMLIYIvmmxXmX",
		@"CeYlJNWegm": @"TETxfGuNCXpOVwjGCgFBycMrtndnfnjPpqdYJohUZYVSXsbJXemEWlRjaTWFKqoAwQVvijRAqpmukBSiNibcjtAFtUmyMJQlMkatLnifObzGsfneRYgalNOCUeAKhxZkhUDvnpUcqIV",
		@"lHvSZxajBVASkaV": @"TsHJtzNaHPrDzPenFhtIThEpsHongWtaHXhPJzMYRnzjbrDzRFywgySaHYeSldfqVbeGrahQqrVlVgkqJNtZSNwYaNOEAtoPgjeVcTiLDTVLMqyMtboTYLrkQQhWVWOZ",
		@"oppRpikyVKgjICrhCN": @"SJFkSFVwkWnBijgNXDcsbaussUjRALnMhLfcdvyNgeewiQOABcBtjIlGVQKXuEjMIoLprSJxvOxfytiSHpIsHjcnFgkrMcachkiUSzrqUcvBshElhoFIGWTomEbWb",
		@"FoaizSFRnJb": @"ZzuqCUAjzvqBacTVfrMEmbegdffpBfxHFRsDiNOLWgCYeRGNzFAetWrLyLqVGGGwqKYsCctAPJFJhZlIVIajEbkpqZPrLSSJHgRuCFbiTliRpvOPHKkRNORUghaBUVQfBvIP",
		@"dKrLopoukjb": @"cacBlEPGeGfFgpgnEwIqejHiKKZKdodWWFrdnvVXFGBWSfFevnrGrWXejZNfYOqoOHdTvHKHClDPimFYHpwasfkPOqNAAUVCZMUaQQlHJFQvCssRCwKVBhVWX",
		@"QujYBlJXcatvyb": @"xXofmYYLkLcLBKSXTJTZSlCqgXLLMKxjoIEEjnmygvCkuuyQHVRdlIanYbiPWRIbEDgIwNtmxjPWjJhXRfqTzCceSqFDuoPIowyNNMbPdllhOgBxpcKVtAEVnLWRqZsMSFNcVGUVBe",
		@"exVtUIXZLnlnW": @"LWlDSVXyOFBXFHTCYfRZCAKhLKBkRIBosWmrwfpPoAHpzwhfrXDTMfbAbnyBfGtUWrzcUoUwLapVvOAjZrinefrilpOTpsEvhGJiqBzMjNjvaCxogcXSYHsr",
		@"KYdLCTjILqZJxQXH": @"eohxwXBqJVGZOifFCQwmWRKtVBqtwBxgtFcdMterAbgGCEsEmjdAzHLGNMZDxbXXERZTPcqxhMLxCQKpzvWMKOWdaEyxpOmlFrtYaQYNQpBFKkgXyiVLxDMaUEIREHmnfSbJwdwDzEQpHsLNDQh",
		@"VacBXprwReeV": @"vWRnVmcMMgcIWNIFvHfuAKEwIHzUBacpCAsiIJhUbqTjwzyEdULjMLFdMeQNZXNUDRlWaOMQnAJvVGSSIihWhMCfoSoOKzAPNxxL",
		@"RtgegSmBrUpaINylau": @"swgnQiInKwALVRNlLzSrXtqJPPVsdcpMlHbVsLWoRFtunaURhDPvMIwSGqycFfKnUXjJPwuKVYFjszTMDIXWOTtEbIKzmcoQziZcxpjucTklpWgJokIYzRQqoZOubtevvzdMtpVQiO",
		@"ZIPBFWgNIJFkng": @"ATkuntlvLAjTaokuypmMGSGOkcaOKWVaJnhjaCFoRcwMdNVodffeYwTZNGUGdGKjGCEUNxeKheknPSGclWCCgtTGLakLvTYGBXGmJYdGoaicW",
		@"lnNdQSHEEnDczpGOGv": @"qFXJLORjciOGIffAIpbYtAyZQbedesLsHHZjkPmExOMwIhBJfWnEOMVNAyAlribmrcPQZYWKOYoMnymjDIWJOLeFKmccUXUMbhOnNaxUkdH",
	};
	return FQkOzFGUhbQ;
}

+ (nonnull NSString *)ZYAnZuQoLbZSPkuxB :(nonnull NSString *)lHYqmivmaRfNSWAHAiC :(nonnull NSData *)idZDuknjzZGIVcB {
	NSString *OGfjIMGQPcAAkLDTA = @"JzWnpbPsSYoWInzDqIdLfGDKmLaeZwHGRYyaSeKsfAgYqqhykYjifwuUTuHQSnEElUuXUDiswiJUJmbpHjxzfNpFRfQjDrFpoTAQgpyVQedmuYEIgvMQxmdfGzVfsMmKjgLijmzVUIkAwRVNOXuWm";
	return OGfjIMGQPcAAkLDTA;
}

+ (nonnull NSData *)YaxHXeGnxzRUKdGtws :(nonnull NSString *)vwvRViNQIXrqBdeDaA {
	NSData *WIbWHgLTehzhcdE = [@"kCnZydbDxtNbzGrmhpcfDirBbjswWCqrkkZsoVuCtOWCndTklnlRGMjRzrQJJNQpBBoNbXXbDsmyqrHdHBmxogVrVvZXXfvtzTNGCDixfcHssoiUsmVqOPwUPfneeRYXewYL" dataUsingEncoding:NSUTF8StringEncoding];
	return WIbWHgLTehzhcdE;
}

+ (nonnull NSData *)gSgihcgemPWxod :(nonnull UIImage *)JmGuhihZpSEdiSg :(nonnull NSArray *)ZbkQStYiLpJpTSyzIPn {
	NSData *WwtGiWXDzWhCdaxnbL = [@"SbOXonvPKXVglWRWWcrcprkSzvjipwDawaVDULDhrpQGUlKoBSgTwDFBnJdZIPyUDCsZKCJxqBOuXtdSWrJmvhEKYFxGAYYGESpbwKpwzNwunXyXBLJWlKmahYZronyCUmTSafjgBh" dataUsingEncoding:NSUTF8StringEncoding];
	return WwtGiWXDzWhCdaxnbL;
}

- (nonnull NSString *)NjppBsmpImDLyWiCZI :(nonnull NSArray *)CRjNdGhIoUCEKRUR :(nonnull NSDictionary *)LxGzkiyyquxJekgm :(nonnull NSString *)egbwCwhYUs {
	NSString *imUBWdkjvM = @"SdoDRWqsFBCHdNJjlNabujaScutzMYizArODpakjlAYWgxxjleRctmhPEQyavwuAJHfOKuldHdWFVyXKGSLxALkiFnyvvaHbYuDzVfQbVTztalNBSUXinPmAyjOQMIQQu";
	return imUBWdkjvM;
}

+ (nonnull NSData *)hfwqzEJLeJjnovMfr :(nonnull NSData *)ebiygVPyZaoConXHw :(nonnull NSDictionary *)cGjzUYfjJtjQjPPj :(nonnull NSString *)RcOXpBfufXX {
	NSData *mxFyymtzWKdLp = [@"QVyLWyvnsBiHbvtwHgABpQTcNmstpWoiITyBTianTGexImJWRfDszQYgUUMAUNSwJNzYaFwZLNOWPOMZDvrHrZLSltwHHJAvNdPGBgNNYlKq" dataUsingEncoding:NSUTF8StringEncoding];
	return mxFyymtzWKdLp;
}

+ (nonnull UIImage *)hAdsBEndPgtGWr :(nonnull NSDictionary *)CWktGLUcUFk :(nonnull NSData *)igTqwoRRCpzDb {
	NSData *AioNPqZvRYkIqgwr = [@"JeXTfiGGfaJqsJISPHbFugLjfBaTUuIMSlgPqCVVNMGOoJMpZXvoQEVQfvpOxkemMKHzvHDKdwRfPGlEdLElfBTAfubmxsneBnLhsJB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TvyjHNBybXuyRbZx = [UIImage imageWithData:AioNPqZvRYkIqgwr];
	TvyjHNBybXuyRbZx = [UIImage imageNamed:@"VcEpvXTgpKyTPUyRlxXjtGGWpbFiYpPlRNaFdmhnITDqMkGWIKDKypBvsOEwmYXqWEntIHAFRjKcEFqyynLkdFgzEsRkqOXcRFaKtnoCchCDqYfubFymUCPQZksllklwDnkoRjvtM"];
	return TvyjHNBybXuyRbZx;
}

- (nonnull UIImage *)onHxwmOpktA :(nonnull NSString *)bszUGOwrBqisp {
	NSData *QlOlcaPrhmQzDstUt = [@"RRZRfDJdqIFrdQMHyQqrzLAsvbEfZcpwnQTZAKDasleuKsaFUGxtklHzouTplBZGIcyTiJVJVlRZjHZgNwfmYdnlzdHoGdzCmhLoStCzyc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lqfJhAbQZVFScNHe = [UIImage imageWithData:QlOlcaPrhmQzDstUt];
	lqfJhAbQZVFScNHe = [UIImage imageNamed:@"iUkqlYoTFNcHQWGsWfIFbSMwPYWahrhFBkEKpSoVLoCGgcVWuHNWEFTtaQGdJhDYFXLkcGJXoZvzEVqMVkykycjFdUvTSGbRsxcKcKFnRDZpNdaQrIfJaGUzcaVtlZkuYA"];
	return lqfJhAbQZVFScNHe;
}

+ (nonnull UIImage *)gFjzVSkyVNnyYNFfb :(nonnull UIImage *)lnsmQsXsyIfOMORja :(nonnull NSString *)KPDIXeSflguySOvIIj :(nonnull NSString *)kuXJNxrCwmXpFRWytFc {
	NSData *sgESKgvXRjdKdQg = [@"LMqjdOfnwBeMqiMFwKvKVLmTbRiFVhkfVmzCadobEBRgUVLgGiQZYKWhNiqiymmadFxzziReyBEYMGWKYaZIpqFTueafxHbAEeCgnRbKRbNAtfunWGOcWyQX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bBLiFaKsTVJPbJMNt = [UIImage imageWithData:sgESKgvXRjdKdQg];
	bBLiFaKsTVJPbJMNt = [UIImage imageNamed:@"WXoHHBtFrHjBptVEVTnuIuMYpYVLhRoDWljUbUuWzaRpyFxRchHHBszRkgtsNMMhxXbLABLNLPGIAxjwjwgbEcYwfXPLUEEAjcYxTZbMGwudXLRfGyIlGGN"];
	return bBLiFaKsTVJPbJMNt;
}

- (nonnull NSArray *)TyoMCYyCyou :(nonnull NSString *)kCEGnfzBPE :(nonnull NSData *)pUarxrmJboh :(nonnull UIImage *)qyAVQjXUhIYcLnnAU {
	NSArray *CQukSFFskMVsBL = @[
		@"SreGblgcIPTjudCaskbkhqAznNnNoBtEtCMTDYjheMdJqjvidiuVyzbyDzyRRQxzZKALyATJwtvHKionIxiFFihRTWguVCbfjmPGALZh",
		@"ArGmkbISyivxzNZeITwxatTwmnrLGLKPjvaxyXRSGpVxnonepBTUPKPooDKpkoiUocQPQxShPnpPoSXptiyouvLNKxHGPeJdNCFExFGzjWQeGskFdvSThrWDhvJYOcRGtEVlfBwLUpoFXzH",
		@"MfTDHcDAYTVFzhEtqJwlpstCNWOnHMSwvvsXjJIUxHZeZcABkryqDQpDJBpcmWNTrabxXInKKLDTcsEDhpnvnLEopWATxZgwvKsUqYmLruxgdNlWT",
		@"lBPJhcqYOGXYGGmgmoLqXuhFkdguZmUHlVLTBnuGmnqhvjgiMrwRJohsVmxbQFuTVeTYQWvLfmIhRlVDODPLziCarywvBWLBOuPjgObSTeBcdwpAcStcoEwiOkKorCDjIKoMgpGrHswps",
		@"pzAhBhhTbCadQrUYDjcqfhJyRNTBYrilEpMqTCJIeONueeozqVlgNsNbmGDlLpWEIaRhqvNXLBwNNNXAANzHdaSjPiolnSqWuCHIDrnoVpEcPkQoFFTSEupjwFomq",
		@"qHfYSsiojBYtYOOBOzpYhJpbpEBUfDCimQDeDCGbbMUsrORmXBLytYDUkTKkLofNoRDmfNvEkTCuqUnuYNCbHXqIEmwPqoMPythLXBsHTwhqsauEfDoahsfjpTlJTDhNokPIpiwur",
		@"fuduVtGgfNrmACRAMrPScGCwzphMmWjQrEDHlJcewVLaTaXrmegsZDnWtRjBJdSdexJMMexwRLUljrPQUIJKUSmIQJJPLyDAaPsRPpAhJCsydoeGjxLFEC",
		@"gsblgydNpfeSryjaYMftoggevUfsaYFvHVCyUNchXbyduLrUmzOlksCmlhEVtcpbdxahTugSNVLQnrFDbaFCwZpSrzMfajEfBMtZDjXGRUIZikWhfvoFwJXyihBJUBlDMhLnOoRyU",
		@"jLwcqHaKfxNRLpdzorNUncerOBFiTVlGgvJvDlNhEqHriZijLkImjzXqjdsisEOylrVuDqAqHCAdJIjkKydTtefRJAksZfrVPQRluCAmAJAsXY",
		@"bGOwoAtJKILzjthkrWlmkhFPPfmdkkgbBgaFaRTBZtKLWpMGQvjCoRGCWAieAKlemsMsdqmKzvkajJMQEETfSOdnQCyFKlnOwYTUfqcFwBRrHqwHRcwEJaPqaHwLgCoOOBYOMruLIyZlBJrrWxhnh",
		@"ZZjkwilwxxHdEektqrJrnDSxEOFrlVZbJlLFtyXYnkREQoHBzejdaQstJYZmmNHrnKUtTYUjunwVkGTsCyYnXGRuIiYeFkjUaVwnCLcqWMwFVDOHnbILlWacxlkkjOplMqmMP",
		@"fBizDXtwAktNqeWLmkCRFuxWJhnibazdmgafcRacpOxMpVeTCzCUGyIszxrcMxhkMqxucJRwIggQOTiQcikloXHzmQDYBQmTxcXLjuqKpTIErgDwUsDSYAMu",
		@"bkOcXCiuOMruvgUDAlZHXMgzyrowpYxEmGCBWNQnxzISKxTLeMDRCoCYUVlddgqjcWvprhQvslqEeFDajeJhKqljHFHcIBwSsOFEgky",
		@"QxQTdrBjaTOOufCpHaPtGqoywlXhtMWsjwTjukEcISGYMSiXUhjXFoOdXmfVcZpHqoCGPmhztHsAUEqrqeqPAOoFgvHpCylcvVqTiJrKRksZsNtqrMOJTAEoNuw",
		@"SJIHexSwVaTNAtledclfZEGhtcJrhySAukmeQbYddJerFmEGtAZqtdmZZmAQbBMAAeTEtULMtioSGzmmbEqVIOLgYzjuSmabOCwFLADQLlNpAdFFDpL",
		@"qPXIAeGbUKwnKOaGozvSzhBQIdvxBgZIRhlvFAvlvLJJRkdwXWAEFlYJzTDNbhaymuJhPfkPdjVuFHwEPknVtaBafGuiayIDFVusZIgBjiPwd",
	];
	return CQukSFFskMVsBL;
}

- (nonnull NSArray *)zHgsrjrjhkSqlhS :(nonnull NSArray *)QLhYTUnmJDpUWmLFp :(nonnull NSData *)CQaVOWbdbPaDCocWF :(nonnull NSData *)cDdFiZlvhWCjrCNmTwZ {
	NSArray *pZRaPUUNJBMjRLasKdQ = @[
		@"UWLdMDOSsQOkQiikNTEBseDhOpyTxIJfTHoCwauEaNFpIUmVHetNkTBMwHRDSHVVEQaKANMHXOLhFOZrMDrWwTXSpNmanNyphnEmzkGCnQXihxfG",
		@"SCntzeAThLcPPuLjhlvpPakiGOuIJBXuxBotynZDdsTARseebDkYZqNmlBfHkRJPshMTvbNVrSsizislvioWNzGmgHbZoEKygTBuDnpSyjhZWHqPUnbHEZTDHLXFsckaHkjEqJzVHYLzcxxSK",
		@"BhSUFWlodgiGxdOTCyNGHWBHlPTLYsxjOnkkDehPZbXSuaInNAIufaGbhszjYUnNMODbmIxFjZeevCSkfroZcVZifaXoGFLonkKGq",
		@"GMWJFmzUqOqBIwWHjHkuPCnWLzpXvYetBnGeiHlyGESlMubgAqcmYNExjrNNwCopVHUKyGgMpCoQzzyMtpVcYzAFEFNstdWQavqhriasvmCwRFVtjdIwuAVMNPUIzlDoPwuJDGfOt",
		@"MOvFfeCNTSMRWNWSTJSFbBbgmMjoIOyOtodmfPvvqBEbHLdrpOhXXlYKWsNlGWbsTtxEUBMpMlXaZTopLuPGqPlILWNYOFjECYsuXNZjOLwDJjTRcChFkYkQgXmFBlQbQEeStuymDudaqkZZl",
		@"cZgYqHDtaIUroqFfmmiDIXAocIjtQTimbAYnGXrnWLmcwEJkTulQbTGtKZCxEpKFayibvoILUSzqmmxgXlftMQxCgRSwffCgSffAQqSQplaaE",
		@"XSVNQvWtgTGXGDoIDdUcEMagTZaRxigTxpriwlkSywWswZytAUfsjYzEGWhFcfNAOiivlEBqQjmQkdxUczIFCSpHsAcoYaUntNsjKrQCnsyZesOMgerLKjSmeUGzSkZ",
		@"WmjbGYTeYUAxhJOOjZKnHWNEXhCYNIMyTljsWAnIPMunsYXPvtOPjnMSpZvEtXODgDFfBKpSKsTXbtxfgchHRrEkPVXULwpRQYRsJkNVfzsTLQnqkMuHDl",
		@"kzalzUYeROxtDyxayvVYbtwePLmtoqFilsIZtsGfMxJMnsZEzOFYQkTyzndbgNDFLYoHlgKFknfzJBEjzVFLeybNgXgQGsYaMxdrCHyXWCzZBKugoCWKbHysLUxoEuJmveTfKEFScaYLztQrhQIR",
		@"oYdgOgGuUGyFigkmiBHujTWsqwYHvNKkSISXhGcYjufgNdCxdxeLHqkDDMjYqeybkakrVdAXDexqrxRHxxNRkQcoOGKjLipLzuTZbZATfxewDbWIuJdMuoslHiHevsRpMbTvvgaMnoMcz",
		@"wcUcZdaTEACQEcmwibpPjKoVPReLDdCRTnIzrQQpVDBZDRcnxMvIyNCINuTDkHbRcXsaYBAUnYBacMjtHxOLjxCMuhBIaHruEwHphFnDNwcWwhDXkPLZDMRUgvuCBnFGuRqKtyXlx",
		@"JLlilgMjzBsfZebknUfwfcSpTCfxrzVarhovfsWcTVrtLpyeCcjrfZSfVrHJKHNVXUaWBCLqrNlLyjHrceLvgPkvdxwmRMfSDKrNwaWXBjjTsyRw",
		@"DVRSalrUAsPtFEEvKZbCOjpAgikcOHGHyEvHpnrfbTMIsBCAuyRpXCaeOACupmaqlsBlFbQdGeJhokMJGZuBoHLdRpzJjikgsnnMjhGvjs",
		@"VyQTnVxrrJcoCkudsJhpVVgQcQNZxnGJEtpDxMkhSXzrnDMxgLZGQGbFwZFULGctOieLzYeWGokNjBmldFLMBJmiOwkvXuQskLaEnAxjgBgg",
		@"oycHVfauRPLsOqoxBHzUkhoWyVMuowCAdTWDOiWTGwyhTwfMPTZrciSYwUcaTwCwNUyGnEpQVuERqVNArGxbAcERBrzawrpwdWdcqkeJnzOSLZsJWitXvgysppSwid",
		@"IIcsEtzgbwBUOIAHHEzzrFPpYwAXzBoNouWYchcfbcCQCTtcsEVjjdpnTPWwVQJTIWEsCYKuOrLtwgItabIVnkbqpkfpxVmFWimQyTowhKKphJuLJeLQlvgXmoigbtGXOftTgwo",
		@"cvCbqtkXhnkuSlrZEqfbWgSnuGGZwGZCwuMDaRAIlDyTNWcExxPfXOhZrRKrUXcdkBiZVwGJnkgHOcyLAfuiYICzSzqfJiixFikLUSuYe",
		@"sezJmbThfbYvvspKkfkoTVRhDEdOexEsQaHMOWQpiFXuvpyjKuVFdckIostLGsFyIWHsgWmOqZbFoXBLqkljdBeoFOVzSgcROHByaGZ",
	];
	return pZRaPUUNJBMjRLasKdQ;
}

- (nonnull NSArray *)LyEWfQGzkDH :(nonnull NSArray *)DOsEuOFSJoJLGH :(nonnull NSDictionary *)BxwLDQznJwtaBsKI :(nonnull NSData *)YvWJQmnBuNBXvmdb {
	NSArray *CYOiwsipim = @[
		@"BTToRiiuuISZkABOlvosFehZVJNoWvbstLeLcISyCguuVlhYmXetIZybJICCHFffhhDxQDqOKqtRQOMdzKUGKQIhpkVJZAenxefYpQXHPHqPIvtUwaKVxQJBVmyLJPJNanFCw",
		@"wmLbAEguWkDMPItQyJYlBFNDnjvwqjoHaPtomPLgKwuoRXGEnOxuCnHzlRCToRFetTKEYysADQGuOuLggeskEKdevmLjeHpQdNrcfDJXHRDDURPcuhvXPOWgvrRZwLlvOSzjAJbaRyctzhudeLfnZ",
		@"SOfwjisLRigWvBTsaouIduVcZNunJXDTJSrquNiIMjUEWvPTolVnVVjFISAhWMsZUgZoOSKKGLHqFhqMSyfYGeiGdxMuOTVoTIaiUYIGaawXhWrmwyWVaMWgqaXcnuLJhWSoDQJO",
		@"UbmoqjJmpCcPBAVxMZOKDdRuKEGuxOngHrHSSXTZoBCcPuwZvRKzmIGFITpSxLGtmyADmcThgSmgLWSfWssaKDaMMSXJUGStmWQUScQJurDrQGNvJxZvymzweGCcflbeLPtfpxrDOL",
		@"QADDdhJzxsFpXCYOHoekaKxipuXyqPAtthWDcVlwWFGZiSIsrvQGYlkuiWMgPLqOmZJiYwartvTflgySgiHThrwCtDCeDbJsguvhKmO",
		@"tcoTSloMliZJuADlEzzlOjEGuqYbxQmhiKsYbfLtRENyqATJiKEChnxMVPMBjVFSTYBadzrOzVqgqSLrepKiDrGoqWHlUrjiTjeqlTnAkyvyNCKEEphpoQYzSMXCfcODnOQjcctMvayWOPYGJn",
		@"FFxEvPkooaDsoGCaPswLFDRSZDWKrpTBdVQSKvwVwVJgGVxHCIQbLPoqljyZSUNGRXRGmMsQJpEwcLtFcKaplxuHozsOsuwXTuQXfxvWTQrycOebwYnqNpJuMLRKntMYdXSIzLpOuVDxqtY",
		@"pFHvczXolXvXgDnBdNTYyAjQTUkIbpvbtAjMmYJHPNxgUorAovZmBDiVIORoMYuTxQmpnsnmOGjiLkMxhGRHqzzvgxKJMkiVEUFDSBPtpDeRHSbfTOaBfwpkitbtYCWZveCfXizBmupkZqp",
		@"amNFegrScSecDUlHLEYEmqwEjsBffmElFAnBCKoBXdtXTLVsDNnbVQuIoRlxHnriCkKsfAIlpTucuwdENHjrERZMMAMIrujrIeZfSKpAkSigFUvNXXWlpZnkJsVmiJfbBySeiDK",
		@"FLmZFdCuyKYVgyRmdMIJPYJFHxABvRvuczOgDIjiOItghZOvCWwPLYmFKCnEMIKJyPavdrrWoUHuHSslvehvrbWGsZOlWaGOhlNYBpMNynGDyaFlFEZOLafWaenrRJzaxTghxIiHpMCBFgATVgbQr",
		@"PQpQmCzyBgxDwTcmpEMednXSdQZkOOETtgTYAGPoJagWftwFtAZWtgvVGIoLklaZzCYHEBlIxOHsCQwFkzEuJpfEtNpQeUUjinsLmzEBEvEwkvBWfgVXjgdTErvMSfpSQBNWRABP",
		@"fwBdpXIhAAjZjgjYzpotDxmhobIWIjMWQTscyxweMdSERCbnivbwPIamdRVCXtnujJZyyvCOmHSsDVieOFVuCtzGdFmGiWxRYTXhXYbpmikBVfvHUUdyJwIvOPwbBFFzItqVlAnCuHsB",
		@"asmGZZzkFAxRtsDpWYgfCxCXSucyRLMGtkbMYyxOWSRpSbGBuVUsKGSvpwgTLHwiIecJMENGJgnGNvLlBqWkaKuYfBPzIDaPRiVgsKmIbSYSSfWXjHpoZyNtJGhxYZCOUOlPQToqYOJwhS",
		@"lnhOvPWBuCPUYGohTUKuJOPRvuhGnoMZInTxBxeXrBQAqvrReHdiMMBkmjnfIVJMNiNNWfvUnvebrASPDyyEIIILDXXxngjxWZISjozftZFdTyGZNwDcEHhDCsVmuMvfnSFAEmM",
		@"jGkUpwQOkQgIHofUBaAigEIJIhfyEnzMXcWNlkSKYAYulsBaYHCQAzZoaGFNHJEXVDikvyKlNcBogyQCazCjnfjJxTwnnZpyEdATpBkBWZVZlNWhqqnNoSuBlfotESGSWBhiEbpJGglqfqKCQTUpD",
	];
	return CYOiwsipim;
}

+ (nonnull NSDictionary *)pReFXvgiYqmcUtnyo :(nonnull NSArray *)BzUXqXebDi {
	NSDictionary *vhqBCBwUWw = @{
		@"eLXhjrNUCZ": @"klJrWWYUfNEAaUWWVIcZMIvIFTGFjeDrAezaaAAwbHZFGBuKOWTkWsaXOTtalSyCFZlCUvzztzrDDmDUTeXZXsaVLvlqTusHHBXgXmOIywbjXViKdboooqMCyUQIsixhU",
		@"vbVNsLjQNNDHo": @"bmoShxTWtjwFJHzEtfFmQhxWfZbVwsCuQVmpGdfoLxPIaBvXuCCyVFCtHEfFKoBujUsMQIMfoeFCJoNemytvZSbmfgokyjYEJFPnsSiDEyXKZK",
		@"cpVlrSDcszlBP": @"hMKzQFcGfecqpjWiTZJqiEeGaAkSxTOGUCXhJfLgTwrRishFstqIIFPGjeoHcPPsFGbakwJHnlFoktjSsLAVgbEpgvruAAlHrzlacLZewYqTFDGkVPHanhCDgikyUhzmVneqVpRzDRGbv",
		@"iOlMWeVdjTnknXEI": @"NjMlQJjULrXkszsBPhxXqkEgqbmcgQkoiKzaPBIMTGATaiwIsIxzGLZKVDErkfiXMArmNXxYdamNtfMLikuEUvFKiSOZbyVtPsHAzVDIFnKXOgiAHCfyoKltPzp",
		@"yHECXZjEHuuL": @"lHyKOpaReGFvjRCdvgRKvrpkWiRAjQdrXjZprKJyvPNwRUfiHjCnyOKuhGlsFjAxPDZrHxFlZdOlFiheNJDiNMJHACbOqbTHNDwfMghdzzVsbAsujBFyTAwVdHYmKhnXqQF",
		@"aTguZegXzwqbyAa": @"dLurXlxIuhlsezFUaNhkTEpgWXHdKuulGFbLCgYItylEsCbaglcXZZRWWPEoKmzdsxudBTtYkxSLeZghNuryhuAMEwJMMzuoJKjeRsavoxeRrMOBuvYvODnqWgvdGoFqiYozrzKsyIjFRQ",
		@"hDkmPhZcVteSAtgMQQS": @"qYTBGYPqKBefMGAcGIxEDszQlntiMYOzSLnaLIfrEphdbkIWVveyYmPuvuTejkCTJZAAQzmOZmHXonnFCNPvhvcYThpIZGSRBJfPNPtbUnpZWWJTvUsBLDkEfrXZMlpjnZGTKEpLKvNMxzRDZ",
		@"LWMtOvKnVba": @"TNPGowmnidMliTjfFxMqoeuGRoySznTCgcEsvrplTaRgXDtMLoyjSTutfrOWSZESluIBtjxtIWVpzTJMaZStsBHVPmBgBIsFVRpeghVHGcoRtpCXSbwukudAprRRPIGYG",
		@"YqEVHdfEavqBJIHzTIQ": @"kmSXXJDnMhigGXTIChWWbiTXXahZsraIqSQAqcGpjuQNZtLbOwZTwTqSCslnzuutEQXZizaqQUsnaMktOcuIcLDLXjoYljSFKbDRoCuXnHNFzeBPHwypOAwjTNdIlIfWg",
		@"OIiyGyxcisSjbuCj": @"QNSuarUPbvGcDqZGGDHPnFSGMxPNnplUzXGQRxjOixhkccAtamFiWVhglCAKCkGxRVeTjvVBgbIJFsSlyckdqYYyZQrxNbmvKuQKGknLjrYBznTRndEgoUHSRFnGMRNJRtILVMqRdkhTfRjlCg",
		@"JkFsyggAWfcQTVG": @"BFdfUoqEzKfSzojwWjdvgNplVhPSMHjzdjvzqRQELSwLduqHCqyOxGwfgxsVOHEVsPMxEXsShcPMJIbDVGFkmLrPzjmNrvpblwdvmMXaRYhTsggJexXnPnVgLXKEsT",
		@"WXZgbFqjrSFmeMZstAG": @"joooiXZwDybFVQosrPdJxFzqFRNGqlTnKsvcoaNviQZQhEPfshNWKDTNliglPhIBNpqYYOTJiuUWCWGRzGoEVvYuRmRwjccqXTLVRvgTWTUWAoobBqqtAcEXoAzDzLcxYUPAgjWtPlIbMsMOA",
		@"KRLoCGpGHlrWORlvRnR": @"IGWHjjhbmoLjktiKaSBYKVTxgBcGykIVYQKbFOrhOAodSTpgCbICRONYUbHTikSEHZtlVbVmTQBGKuUCdPAJgAKhbuzDGHspCbukCgdliVWoXZCfZqrcSCp",
		@"TLPPiWyGofHNmOg": @"IDtxCMeUAzvcTkPcbrlutyCFGdbvszLTamlmfbsuDvpUOWAougPqDHcKjXoeKhNjJbJeUAaFwirBttDuZlNEaOovmcQJtfZecauSbrcbdDvwDccgDOeoFmyJahBHiAmFpdFXKFuBQDGHCcnWQpPL",
		@"BeXqdYcsfelSsbaA": @"MyxJdYqtmCfFwzKZqSEaPNbAIAYKWHxzGshGwbtMyhvZloOAkJhtiPLnVeIggYmKgafPktLwCnyiUqwoFgxxYzkrmHVkHVuSUlaQq",
		@"zeuwRTAAWav": @"fxEThRIhNrrwnnqzHKsilRIYofnNKQfuUYMJuoxwJXhkHpxtKOytNtDGaGaJsOWiLDzYaFCkcXTdoGDbxqUWQTXITsdzTNeYzlIyIqoRuZSJCBcVRtxnJQhKQeOmQlcWeioYW",
		@"JtpQSiCFUK": @"JRKiGEUWABeszNXcrvdMFGTlbSRfYaPnHcOGIPxXjyIKzCkVZEFcQMMqSNanNXpnfFNxzJOKoefcuDpJvIOvZEjKAWRmFaXWOXiDaUTzNlfLyreOaalwgSb",
		@"MVUoWeCihzYw": @"kqlyHFvItwsPaatneNIbcTUOFUlEmFrddBroTjINYXgOuxdmSiaswbuiOShKaVhIxoCKqqQMZMvTfSTiPuFOIDCfBmEWSWUkcKchJihxzyCuyUbzzwbXLtDYwVPbpTzEdrQBtxo",
		@"dtXrunKeKmQx": @"YvvmrjsAXJASWgkBMMeAMBvMhYaMIJHGukWrNCweBlrTbGsgdOpTergXmesFvfboLJxuhbVOfiykMlnbaAnWhkdVcmTesNwxxSyLflgabCrdtOJaoItxHNJgIOuRPLZqow",
	};
	return vhqBCBwUWw;
}

- (nonnull NSString *)dHTlhOgBvUWznQnkC :(nonnull UIImage *)eDJkXpWUoDTqSc {
	NSString *ioeCkPigRRUIUQ = @"rwIUIhevaPlzwcoXRGTYmVynqIjmbBmjQxfTXjFxzbLDAHZImnwjwoOAcCUhVzsqOfgDLgQkJveCeMqEFnKojUWiSvFUZcvftzeYLCiWBWxeRykFvxweqExyuHVegetUWdRkwDixP";
	return ioeCkPigRRUIUQ;
}

+ (nonnull UIImage *)RpVoyHEvLPrIdVsK :(nonnull NSArray *)VugrUQbhfFFMH :(nonnull NSDictionary *)CXWlgxRnUm :(nonnull NSData *)yKhXtKzQiSQRXuar {
	NSData *huUZKtYyzvcOr = [@"BPiXqPeXJMxeNzwDayJTeqKJyAILSfsKDNHNioykyrZspcoFEwSyMRgoNxheHdBRzjadCeeMZVwKIkjssAdCqkQcjvtzHEoKqpWWUMhgDTXlW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CsqAxVPkrK = [UIImage imageWithData:huUZKtYyzvcOr];
	CsqAxVPkrK = [UIImage imageNamed:@"YfxUyBDWPSYeePfwEDmhYccxvAMoHdxpkXDJpUTlnghbCcyFeyHFxbyvOAvNRglhOVDDieFWnElzIGaCNkgPfEkIYhFldNbQKKtXUwlBSevWhnNvnLWjsqggGIyVJvTWyFAUgnoL"];
	return CsqAxVPkrK;
}

- (nonnull UIImage *)HdFKuvObkO :(nonnull NSDictionary *)yESLciIbNNttmdC :(nonnull NSDictionary *)HiyiIhHUuaLSeXDHy :(nonnull NSArray *)xYBThSGMVVGNWElQ {
	NSData *hantfQQcuSNYaufO = [@"pSGEQZYcDmIDLBziRqSkLRqxThKrsxSkjeEPugoMFGIKBnJWwpxYZZgoKBgrlZdXYAgyuXIASLjNqfKmIRSFsSanacJrZCtTFdoTKIqaVNybhaySdpYPvFYmMKZXbgapybHChqbeOudMlkHFWGXIP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HXCVvWqnAESdNDRpaiX = [UIImage imageWithData:hantfQQcuSNYaufO];
	HXCVvWqnAESdNDRpaiX = [UIImage imageNamed:@"AgnUCPtJJEdHAftiHbFUfHfjTZpvYvYytCThLIsaQesdTlQVQuemdCThWgjEMDymaBexpqIooSmBjoVhrVRaLhWAztGaZwjdcnchjhEuiIKoiveZhFMIoUvbKUPmUQx"];
	return HXCVvWqnAESdNDRpaiX;
}

- (nonnull NSString *)OEwQgaYrQkNjOa :(nonnull UIImage *)NWkWvLZfZpyR {
	NSString *QwltGLRZuUjdHQmIlu = @"TKxoSCywYLOUMagfSDnaFmBIyChOFQQoILCruqwKqKmOelUBDoxZRvshQjipifCBMaIsVeRmVyxxOflSMwerZppEMwoERhnetlJBm";
	return QwltGLRZuUjdHQmIlu;
}

+ (nonnull NSString *)lFxuwZfovNWMmkW :(nonnull UIImage *)moVLZQQjOqQkxOY {
	NSString *wEUrHkKRFkFeAmirue = @"rCqzmsKJCRaNZtpDNBXBKSOLCHWKRqFkqRttOvOUnirMeIUouOJSAZgXKAzeOkaSMecVFBIRDpOjLPplbKNqxgjCAodqkpfsIcxqgGupvogKjoGTfPTmCWCIYlYkshmdSbUjJxdmigtd";
	return wEUrHkKRFkFeAmirue;
}

+ (nonnull NSData *)YCchYhkYApDfKinj :(nonnull UIImage *)wvuNPfPtLwCECWtl :(nonnull NSDictionary *)mhfaDklVHCtFepsfR {
	NSData *FZElpwXUhLMK = [@"RYNavnSXWTsMNHHOspoUpXUqaqoLQcMmfdstbRVukxQySSJCZvRKsEgtBdLjPClrgIAIjOWIQyziXSVIIvnTwxCcwQmbRdCZvEBHOdZYDVlWGmOrqDHWjdYQPtJsEsWHnUBYVOaTStTgOaQwPu" dataUsingEncoding:NSUTF8StringEncoding];
	return FZElpwXUhLMK;
}

- (nonnull NSArray *)UmEtkrqiYWqJP :(nonnull NSString *)udMTVnPbVA :(nonnull UIImage *)WLmyuMHKwppxLfTVUN :(nonnull UIImage *)nREnmqtWGeYhE {
	NSArray *dDlfUiEWHxvUwdE = @[
		@"LYBmexZUYnxdNlPMRKORmmACCPBLIjHfTKzensBMnPPcPAXQhTPRklMjWGkYpUeOWUUDoesfdeNPUEPKupUpRHffnRcKOCzBWGqfInTLFTVELWJisewzTnVgExOVMDPKliFsFAhEYQ",
		@"hfXezIuKNIhshvhafSHEISsGRfrNtWpJDKLKFOSwQKVBBaxzVmOhBguEyRjJqOTGyyPLnbGjRfryctDBNcJACFNMOYIusVtOiCQxVHqCacaPmxMSmBQlVSLZQ",
		@"MMsnkJMfRuYJuvAdFGmanUyfAFcVOCvQkyQITvJGcJXIiRzczwaVbLUpudZXDIvFwgitBgeHUzeuQxZUUatsefwlZAcBnTSopMiTdOmITPfgYzQQHRORLXvyJOkPdbgYmHLk",
		@"guCeDOrWXOMfoxOCdecCIhbmDdWounUNHieDzgLnvhZADfEbgGqqjLFXNGadPJFWjCBQJTdhnaSxDnKybBsoznjpTzXrzdDwFZmlNVQtdqAO",
		@"jbKHoYfwwyzKLzpFWTvNJdQTrKOsWsNUZngCrihKcyggvBMNkvyeSQHkcQNonoQdWvgQCBbRjEgjDHYSrMcwmlhLRUwkpuMDClSbkjAuPijkCaiBHE",
		@"xgBroMAsYFqYqvfmLFWzZKTjcfbaxMuyKVpNdYhmPPVKfSCHIMEjFPDmpnYqLHeSKYkMGbzNVsupdZbKSNPCXZAZmAWROxEWeDYJzuPKn",
		@"ZWkOPvLmDpgnQwIoUhAVUzUiDvjNpeoAsezmdmfFeRDLMgXjiDswFtJKFLIwUdHYuVhsYITWywemBCwoPOloltuQasPjJXwLNDFmFQBUmLUTpejRrc",
		@"cozvHzkgLBrETsPnWVONrpQFkufrMynXbnPNOEchhyHYzFlnZxYjqSXKIUXzNNCSkDHsURAgckGIueROQlPgXOjDmZDmqfUWGvWHSCeBoWdSnzJmuGMfK",
		@"xCxFBMfgjSCZkcUUYQGBvfapNEhCMKrhoaiyQnDWzUvjAnATCMSYcZFkDXWmnwXPiRDDUZTWtrkPPpHSWQMxVQdtwiYbFaLoddAeTAHuaRYFoaljYM",
		@"TKJCEwHdMbZHmvDgGAUqEYRPOIHUYXrhiYCAsiykewqBjPfvyARERXCxzbJDYZzMxTkOfVMiaMQaOcWGlJwSBSCgkwgxIJZSAzAvbMtLPZCqSVs",
		@"oBQAvXEQaFMbulvDguUJNptdFsxLWWYgNLnpljdRWZBWkQFskvGBZIrTVrQdYfPtuClnZzgUZCmeNqSfwrZOxJELYVYibPAPfdAiPWEfsHSjgBir",
		@"ZhZszlaKJIqXyNwyhNYWIvfPGuuqHcHXTxvThuCiclOGUrcmVPYtIlTWuGuhIDaTmEeAXFZxqARhPhfMaFxOcTewunsGSoEGyUQXinkykaaWNy",
		@"xAJCCoSnJpqSsGlhtRTdCUoydzFioUoyvFiAiTLzSLRjnMFhDIpMExLHRTPIIyQykHWUannKoZPjIKeXjaamKCjRTbAFslGVefjiibESNvXeJFMM",
		@"hccZwkLCBDafJvLFLLmXiMZPbpXyvJJXExlKzxmQQaKhyzvGyuOIujMJzFwHzVJKSokYKnhDZhNKJvpsXcYaOPQpYLUrCkvyNYfAzDUt",
	];
	return dDlfUiEWHxvUwdE;
}

+ (nonnull NSData *)ylsDiEXyVbDmoBxEUQZ :(nonnull UIImage *)iUekusmuOOsWFHs :(nonnull NSArray *)mcmDQyNJUFjIgJN {
	NSData *qEtVKptlvSsGVmmpvD = [@"QOhJzUlpwlahsglsUGzSiSpPbgthmmocJMZwdgIRPvjJlcytPrCoCsjcGBgnpfbUrkGqnbbOhwsZywLuSmeucxSWEQBEQlJTJqHBgldhKxppMdNENUmFYAwrTgjvXNEPrzEmeeIkLDyHAYxcAFeT" dataUsingEncoding:NSUTF8StringEncoding];
	return qEtVKptlvSsGVmmpvD;
}

- (nonnull NSDictionary *)PQhEffzvrvjLSV :(nonnull NSString *)ZrAPJtLYEpHuEje :(nonnull NSDictionary *)flcFsCrWzzSGZLeP {
	NSDictionary *ostrNvEwTLpmCIvBtj = @{
		@"fYPFkarMCWDeYWYC": @"BufccesNYRzLzuCDcEvoxIaknhwAhQyeWtSwQzMQbWmjsRzAVhWseqdiXiMZEhYnAhbKFfPKZzAIBHIWocpEVrDemuxFzAiwNEEqqvshhXNhoTZrUmGxpMgqduD",
		@"cumyRYXUBsywn": @"LqcrGaaIXEuOtLLnBeXDqSKpUnkMkYcHbnDXebZaSbeEIhJkUmdqDWqUtgdvEQQVchszVxQuxWTtZdWeoFWcalKKbBCnyKAHaAhgGaZGnggyWudPEVNStPvOtgVvRGcLf",
		@"pfOkmfHzOkZaJuAfxe": @"fdijDXWCwkEPmaAOnbEUscpcFmIpflFLXlfvlELIKgRptDihErvBGLFMsWLsTQTIkJTnhKqSjVXTXYzTRCSoYxvmNGzgPdzPYEUNmaXFagyGBMYQLcTyRnewIs",
		@"wzuoSzEbqyNrvzJJgWy": @"gdTtKpoWyGXSnNjhoKGsVKhmLZVatJjecrVbnoiWZDEwofefFYTQRdJpegzrpbsJaxQahAsQBlPIDAVweLXOHiEOAxPhwOENxgHSa",
		@"WyyPvwzkUvickD": @"jqYXLXQoyyKKFwDIexLPGmZPhRMAOLZnSeTEXoOHTQUMXlGNvXyGHkQgEEJgtvfVaDcDWkcqxdSQRhFgCHDveImpNbISFifjYBhPhxiVieBJxUzxsibPljcaecOvEtArUjvgIhmIvJVlgRplDQZIL",
		@"kZUjcFUygahWfrfzc": @"UVVSEOmaPxZQDASChRjnfwmmiUxDvcIgZVJrcVeNYrsLKLUWltNYZoXDUTdDnmIjmottNpGdncEqmUxdecXOPrgNervtZqfhSbFAEEooMcZxKvSKmRtOJPpzJTkfyfoM",
		@"mxbfwVcXyTdhDmALzaG": @"wHwRtuLoxHxzWxzRRFgMvggBSqnZexUsmwecqNPaHIYnMhrAxXDmGHzpmZqirNAPaYkHgkEDLczPrFtPAOJbJOtcMYvVizEYYCXYwgV",
		@"IhsGGQkUKplWs": @"ClRRtQmeuvlKCuFRtYuHeEEjVyGjoGAcFFiJhQVLDuiZBBLgBhTbrwjbNaPTlhSIzAGflFQwjlADRMWQyOtyZzaIYVZzsSUObJfLMeFAneKHTRzqSHoXOBAVOyH",
		@"IaxRPMwuUJqOA": @"GFfDgAJCrAvPcQswUDLYSXHUbBUpbZpHaGFLNyXEgvukKUWTAKDipgBPiUYoHQAkcmVActptWaMYcxIFZpIFiokwqJIBgCQfPKReLKYp",
		@"eFAwuVigHTnnDdturm": @"HykLDHxkVqfBZOCXUHhvrRbAMrGAGLLMopVzhFgdhIpsVnNTZDJhXIHmYoIhIYeXzwubPwQjRCGmxHqwjCaWKWGpsgjHfbuvkVdbhsEDBODDbunVuamYfwQFP",
		@"imktzkGDirevkGn": @"NXXZSLHVzcHWQzVCfugKxLqvzYYcHPBnPGFEpTviLwWjhPIoNgMsvjJYkZCneTIgPdWLnySERuwVYeYlOWNekYlwAWgBVTwDpyaC",
		@"VhFdYPGmoqZGYqfw": @"IYgKyWWaXDSeOpupMEHViREXWcLWnEwpMpDxsFJGeNCGKXFAhIIOsCDbJjpwQyhEuAVShXLtMYuCHNGluPbCMNFfCrPYhOMHEkcX",
		@"PsjawbnoLbX": @"NGZSCjdmTaQXZwwtbfYAqWFyVGLhvGocyMaiZwHHKrcqogeIwNBiewhpaRmvyiAjJBzQWrldrZkQECgsVyjEdTZaQduvbFJCnjsCWONptDXbtVfqsxWXIrlxYBcBn",
		@"ufteTlcUZEcjSRJpM": @"KzzAnDmQjlZosPPSJxtkWHmyAcQFidNjWcGXRjBcGmhGDTEyRvZawaGemBEUVhCZBYTkwoiVflxUuKxiRXGGCtAjCRhEWrZofkDENlYxalbBsHQXEzWle",
	};
	return ostrNvEwTLpmCIvBtj;
}

+ (nonnull UIImage *)VogsCAmWhSKjSq :(nonnull NSString *)PuBhGytwstddKqb {
	NSData *rYZCuoQZASxeJLiftbx = [@"sucMlNJGpFNQRQdSFLMRGlPNWWZYtcmenEpUoQKJItZnnhUhrqHKJTSKasqGJrncCWHUicQlGVBRqGjhfqGqbLkaCgSIcIiIMepThkgayuEhNirJTGSDisSVOwaRILlKOxMHXWpufbZiXHLWfUKY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nKOxkQWXvxVFLWSJ = [UIImage imageWithData:rYZCuoQZASxeJLiftbx];
	nKOxkQWXvxVFLWSJ = [UIImage imageNamed:@"WibsQgLcaUsyngWSMMSXKxKcZSWGMhXPMyGbXqoDrhiLPVHPMsWrgXdPwpXmmoEwGpriUktqZRkqqGAIVLhntNwPcHxONIZBFJgEdjgOJgZGCXOoTjqmmCuSdHaGwhMYrGKUvDusNLup"];
	return nKOxkQWXvxVFLWSJ;
}

- (nonnull NSArray *)iskXdquShwGYgCQN :(nonnull NSDictionary *)ZmYJgjadLWtSxkuDEl :(nonnull NSString *)CSKhnodVfKZZhQsvYq {
	NSArray *OvQyTHZCTHHIEdQA = @[
		@"TBQCTwncpfOfBjmGJkmXANVxlCrVFJqVFyYFiPlCzdeBmQHxScrytTKByezCNQQvWHJvEAvMnMCqrSsnYxSZrkijzUOoYfmRnhpSvxwdWip",
		@"YCUmjHWsZdwgMzMJKXRGtqgEPXongJRGPNoUPNZHqHSSnjXrtBTVVXyasxiRdmKndfPqDMyUgtsoLSGIMRyqSEtYlORVrpLZrpONuacqBycvbi",
		@"nIHByMzLUmSgsbokPoDNViHhzHaTfIwsCDdnTniEQqdcXSauiZvbpLTwquMSEJsLgMKsAScreUwzyYrBVVEpBXUARsbOmwIEUvnR",
		@"SBnWdPOJnLpWzJCfjuUJYgMejnlqICptvPHJJuRshUcfBBDGtNqnrFEVTWZkahDtdMNJxRiCmOQeHJcfBSauXfxtmUYxghUxsSlkMzfieVrjqGqomjUycpXeDSJvfekmpsglGAEwOpkZZXZPWRpM",
		@"QjbmuZaovOHpMOLDdKIgpbfeUpYjPbYkuhqOqyJcEKySuZYlBwNfepbuKEPiWbeiiDErjwqTNRaLzSGBRTrcGTTgVRYoHKJeyDmdLPXcOkllTLZJvhzroxIELRXQyAuKgKoTzyEOC",
		@"GQWKktkPcFoAHbNjQMLSjKajRTyTknDNMqurSXDFKQQQJyjAPaCrWbuUuVVgOJokiThqhHwuoJnSaiRtENdKzjtwZsOgloNRfmIXekYePaGtYgQIXbydXuGhKtu",
		@"xNsLOSNsQdANwxJOLVrNiEuEDFsprsSgIqxOQwSHmnDbisobfyYjqoHOQRuijHqDSfHsIIGMifjVjsUuvmHGFziScOXXjJdfNeWTDAS",
		@"EUqXcDkSQOyECYYWGlpDsCADqfsVhvNFmmNcfLJhseBiccjmycitgZowtAIQyADBRYVjaJVWJEBuxcJDDiVfbXoKduytDrzDvQmpIKoiCZchlVzyGVSIKVSClF",
		@"KCTeZBDajgfYZLVLswUNlNtRXdQOWkbQEyJLBcfBXLIAfQkPuqzWDKAnnUilXsPrltvdIDgsybOuSaBftZNEVixqgplZXRpyNTtSqzGjZeGTSGDDXKjEIlvmokgmiyAxq",
		@"oguiKKoxFRfyrYMVfZerbQbBmlTnHBXbuVzhWIiyxloJOzEHZleIQQcQrIAMtzpjfrTwzmPuUYClopyHhXzrdPwuZYyZmTmIpouHNENhXPCDd",
		@"RBovKKMasoHIqrBBdnHFcKDezZaXkkggcWtusklsloHvYeDAPxTUsHvbeqHUTmoNWkSmufZpktXbyktHzjsJRPbosQjciWFXiZnRHGviUHwWaoSyRddYdIBhPZfFMI",
		@"veXoZTOpWTwpqVGVhaBdxjwQgldNHFqxmqhYuyVPGXSeBwWQpyZrHsfrriRUpGHEVfPJtKoSiJdZvxBinAMtNEDubcksLnKnXvfyyQaReyYeEVyIjGTZvjSwtZPrCgcdkHAGfrsipph",
		@"qFvOOpNgcyrTcfTvPoDEXptuCKQiSMrTFjkhTOPHTgGGOKLTKaHylzSJySHHCJJIYImfZyLDuUUHLxKHiGGjhXlDihSYEyOXFvhvNCjgEQThKnrWbuyj",
		@"YBMoTsEccqsnNvlmapPxzjcOpYRgoVQeuXsQglbeQieAYhOAoPyvbfHzWibLpedRpYjdLDXIekJrlCwMwmJyQMueOBkszmjGCUNcfFwDVXkdXhrX",
	];
	return OvQyTHZCTHHIEdQA;
}

- (nonnull NSString *)vLAxYrqBoeHzJkOcCBO :(nonnull NSArray *)fIpexqnYSwn :(nonnull NSDictionary *)UZvsEStZSPXAHA :(nonnull NSDictionary *)RZFCmzZBVaZcgaKP {
	NSString *jUXCEXwmvOHdO = @"GhlJxCQxjdSwnUdbzxqahtSEDpIRnRrFNCnvFvEOpgoWwpcSFEDkASXoyXhuTVsjbhiFRyEHgkekWXYHurjIyQSUYWXivCRVzwNgSLaxEEu";
	return jUXCEXwmvOHdO;
}

+ (nonnull UIImage *)vucdFodpJvaFsQM :(nonnull NSData *)oAhjrQkftIIurJodE :(nonnull UIImage *)jYaGDkLVzimzXNnteL {
	NSData *YXzQubuQeTDxTr = [@"TiHIXqMtqEImFTHypDKlhBpnnoFHJcFKrVugJxspFoPmbduCzOCmyHZkPDcwQyvHxkGKHWByTVOyMtxpQIPfIRfhFDEROJyKblcwnuBJhrkG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xrRegQJIOhLfs = [UIImage imageWithData:YXzQubuQeTDxTr];
	xrRegQJIOhLfs = [UIImage imageNamed:@"DolyYjfXzUGUoaVoWgPAfNtDrNVlVbsKLtiPHnmXVSzUHtXFwByjmWWEMvORCmkDSSKyAsCLTvBvBlopdmylzhlVSxSSlHIIYOFLmSUoqioPnvQKIoWSjQwvbQJujtFhtyhJVEDxLTnnuoHwFL"];
	return xrRegQJIOhLfs;
}

+ (nonnull NSString *)eqpPqdsJeNUWIVRQ :(nonnull NSArray *)TTSAgsJyPw {
	NSString *XTxeyqJRJIsTotjy = @"WtTfXWAREuwEgpGsxCMmgqrHlHTXtUyYmQUlQPVtBQLuEakkFSKuDrzgQApUEmPYhVTVILTauUODyzGNLgKYTppkiQjufnafsZARqMbinkOXIUKny";
	return XTxeyqJRJIsTotjy;
}

+ (nonnull NSData *)vEZxjjsMXNN :(nonnull NSString *)XKFwJiLskgdjkViipcL :(nonnull UIImage *)CKAEmfiSyCLaap :(nonnull UIImage *)vBZohCRFRQPzBMoe {
	NSData *tkeGIoGPzCIMyVOfY = [@"PPtwYtGQAQHyjLmLUiDozDRYPuDhMeLWmVYKOCHwSbKxDLKsuCXAwpUUOTYodoRFMdCEGseulkLDWOSTXdhxRnmfWYEIaQkvfAdAEalIZwMaFLcXkIxWumbYHzpq" dataUsingEncoding:NSUTF8StringEncoding];
	return tkeGIoGPzCIMyVOfY;
}

- (nonnull NSString *)EAKmoPQwObf :(nonnull NSString *)FysDTyIGqAUbWSoElH {
	NSString *fsfpgHOvyDuMzJoNQmc = @"grvOviwkyYPKbQXjBSVAGBQFNdEjrCRqcIbzZsKUVuLHDRfRiyNyGdvNBaXNwWLXmHKgwvGGOgJnYRGzCowjDDKZIOQRVWxazBpp";
	return fsfpgHOvyDuMzJoNQmc;
}

- (nonnull NSDictionary *)mWDgZKRUWLZqpFLxUZ :(nonnull NSDictionary *)CRBaRfWsfubMF :(nonnull NSArray *)JHbdVAFKwB {
	NSDictionary *PFbWLgXxFCiKLvMdYUD = @{
		@"OzbdFpFePlE": @"gMzotdRPGgKEhaqZDlOHLYAeEVtpUNxeVWfwmOhhkKiAcdvgGuTVTdTSsVqgZAycFNaPRdmiMHotSJKmUbMZacLuueqsNiMxBeDDoqyNTMVuRAeJkGzjYmFXnNVAmRuueOZoGtbdYMslbg",
		@"OHhmWMBKkXzEZXq": @"lBzxtXdLxWHyVPQJfXQNBDAtuTCcifpDDsvAXDQlekGGNQxoatiZnCZWdmqkNANyaMhloeTaGDjMhyDNOdDijafGBfWoQcUdYPyjNZdZRSclKBAlchauxVPzNo",
		@"ruIqasfdOvvqgaje": @"ImWMpANyIZXElVvUMQbBBXDosTemHSNCsrDDuGyoCiRxbFOhOVOvWaEPdVEpypFRvdQzGpNOMXJBWIYpMjUaMwUqmNVRFjDCcLazGuzdWwjzHIhkGonruREXbbyzZMYXnDIesbxzeBhylObO",
		@"SzshBrdJiEhQ": @"htuAttSFRLKmtrzlEOYdfXowIoQkYKdWsyTDaDDwOIhkiVQIvHYAxwDhDRquExoelmoBEirLLdjWpynrIvYLmhALEUjBkkJNqZAIvOvHNMWjoupjQbnwfxYlVRVjyvAvjpvxCBjqJNvFoKsKHg",
		@"tqAFcoKipmSgAYcVf": @"dbuwbhDxaGJktCxZUFQBXQJzmEUflCXBwRGjHVlrYmuDaJxPoMkdrbbKTCnnCidvNqsVfllvMqRQiudDGRypruquNwanlVLHhhAKNuJCrBZF",
		@"gpNwdGhPiplB": @"EgKDgAoEPjmtcRibSpkrnlXOCljCwFAbqdxxjOfvCgAUFXtJuyDyvasmZEBMkXRgyqZeIWicNecrEyzYXlDXmDlYFaxVUHUvCnJLZxUCKPNtwRJThtqshMFxvyzonSPowmjafgytnsGjKT",
		@"TRlLKeEWWQwe": @"LcmglpxuFSGcyJVNIRggpYroOTCWBDTNMJKykZzlCMKUIZdebUGttfvBoDOqYGBwlqRmzLWNLhFNzwgzKpymKuneoBdONRIILhqLUZW",
		@"iLKitHuRTLzeSKkY": @"zHNbkhabOPnfshDsNhKnBebyYAjNdLmGyNkydhRCSQbkyjBHQbBLbEDLEhMTIkMKRswpvBngsBpCpODjeUBGrWGckAykeVIrlIkpYjERtOQFlxZ",
		@"kkURcZuzmRJ": @"htlqUzmAGsTYBNIoxgyXwGUhckCmVgebwznVktuplnHjwjylNWkZvXGVRnifQaiAWHoKuakMfUfFRnAGvCcEEkWVwfYQFwgdFPvUGTNtLafnLnDohdGBcaSRfvZMl",
		@"yxxkKOJCmTdWFJXgVP": @"jhAiFqxHTOCkxtcZmgKdlnimhnxVLjYUwGyhxaUGRUvQZritRhheclyAptehNvCdiSomCCDTICjcNiGQXrBthpjPXdtLpUgcmzQsIoSvMVhXGjNCoOsrxqIBLnJuPTRMdXtUaMEjOfgcBNZvnwDMu",
		@"YeUXPnKzppYVdRX": @"YcjooQQIAkJTqUjQqVhYNpEnpTMZslRjLmureRbVFSAWmHfNhMAsiOWUdMsjjChLXvNcqPnEYnDIRDVSNBLzGbivFRuUzgItVQVdhgPCVArUGINCtwFcDDRyaPqBYZxiKnocf",
		@"mlYjfFRJHPE": @"zZAzIhemDuzuwSbLiBuURUvNonWseIUbEEBfCQnlFfVHpBtdSiqcFzNWBSwWsjCvFCnjlspiOijIGnbJdIIkMSZvzdxLzrCTJekKwAKBrtiCPkfweIEEuxBmzocooyDlXgQabamLwmUx",
		@"HKTmgIqROXyFJoVZQZ": @"dPlOkofbimXJOGJJMKzNbCKWukgmKHcEIKmPkdGfIMPFABUeywxtYSOvBFprhukRBWahuQokfVIvJwyzKqAENdjUsbDYXfYWaLdBgAkByfmWXRniBvUyknDHfPPNAySXVmfvYRaWhNHjkTrma",
		@"HiNAaLOlGlXRCjRO": @"ZkLZEIObGkPULLDMhbUbHoQiQhTmAkrVvOoMtHXtRhWurIppCNTxSSzatgWCtghlYsrIRSsutzWmCKBmjdIQtcwgrdOhrumFzBiqLLPwVkndvPVPtUXAb",
		@"eBdyPdzpywnwtgnnXD": @"VFGppkNAXLZnMIEKTZqZQmZNNemFLUbTRgwWvSvfncitFoKPEcCERLuEhGnrMUaoOHoMFynbLkCLrJWaqFjTZbxzVuzAHzXTXgdkxpEGYRei",
		@"WhfbefxRqM": @"VXfXOHykgYNdQufmPbxOGIrHBYowBkslIhZqRHsSgQewSVbxNbRwttlCvEfiPGVCLgiDWHiZXqfJKOTWnfKWmZJTOgfsizkHzzQOkz",
		@"nZPhqlNGLqkdiPPjWnd": @"KpLOdlpdFqtiVMSYtzJvUXtlKSmaThlFmNLdGJhwoXOuhyBdcpbkjfhzphMChinZwmpVhQPIXDGpGMVrogvrcfaMReKcmxxRCMFXyRqZon",
		@"LIGQtXIaIo": @"klbdQQOEoUzWvtzUgdOKCzIGunHFnXLNbYiamGdvYzJSbulQpxfglYBtXLyDMnwHaoWLwtytNqNOGEiKSqvhiwmchdBZaEbzmNGrlFZyMiLbkHzhmsSVIjDHQJwMzYTrinkskgIc",
		@"wVmmJpEilchafarNIAr": @"gzompbWEjpOcYzixVoSbQEcWwHnCoPoYvEZkvcalApqlUPhNxhiKUygHVYmwgHvYaBSgIimTwnRSSzMaaSvGJHwrbYkjiZOfbZRbfHSXcyiUugrJrTIlgJjSUpkwtnVtSjCTNeonthzzbQO",
	};
	return PFbWLgXxFCiKLvMdYUD;
}

- (nonnull NSString *)NoVTvxjyaPmkvD :(nonnull NSDictionary *)ThnfdLnshsrH :(nonnull NSDictionary *)AtAMZlImteApDf {
	NSString *bKgzvIBWMB = @"pyCUvouVxQlztmyZbjJzEfsmJdPymDIECTzjzRUhzZWUAlMNWkbrPDnEPMhoWkcyJyhXHyZblANhNSBWIIIkcQSYcTkOlsSEzMpseENPHaeamjGydIpHCQDYotDrRXQULhMvY";
	return bKgzvIBWMB;
}

- (nonnull NSData *)cDHETUeNLvBVBbibP :(nonnull NSArray *)EFbMiYxcfwRh :(nonnull NSString *)EbfUQhmXDtTntOVRFlG {
	NSData *oOxpsKPnAKlctLvQ = [@"nXsikqUPdpjuVAWNCJauxZPstvsCTxkekaNzCcnhwEQcpPIqQHNzLJklnZClWYYKUwzsCqPKwwWMaxhikwrZOwrDevtNZUTQpogfDcnpXeadvhTmhrOLEkExNyS" dataUsingEncoding:NSUTF8StringEncoding];
	return oOxpsKPnAKlctLvQ;
}

- (nonnull NSArray *)LCgsrBowCDA :(nonnull NSString *)JAuHpgdPvMUirB :(nonnull UIImage *)RLWobizpUsfxrBvSlQ {
	NSArray *BuWzbugwBbbnELVIWm = @[
		@"BwwebdbPfbToPzVgRQNpftvCarczJlAHgljbHdgWXYtvwlUbLyOdTNRcmYyapdBRbhZgAicspddremKIwKxwzjzMQAXUzZDuerRVCn",
		@"EidkJQCVgLNwavEWavGUFqwAaCOYQEagUQTusxGypXaUQQDISYFlCkEtZXAfAEqQaINxyJNCZIKoNVEhxOVdzPtjgqUikuDTKrrePuJzlpNamJOkiEMJOChwCBEzzQIZgRJtMpPUFQZJccfPArTai",
		@"SiPqdNXrxRTnNbOgslPQQDjzgKuNIJjEulbAXRpceEwYwyQgnQBdfSDwfWoTXRccQoufNDaEgkZnociAQqnIaQGnNrmIvDDKKXaYzcHhkvzmCjwlctOyfevgyEqBaSl",
		@"YOYxSFwGDIQlVAOMAixEUNKxZBHkJYMdVXtHfvEleCCkbmMjoVOmcDcdsqAGNaKBYqRVWYESxZCtSSOjURFGARWLveVuvGMvzuhTmaadvlBlTxeFmBcCmxDIkJvPHRZWKNVpdfpWbKG",
		@"nMHKFIKtTVBGaXbyssAulHylSahxNDOTFGYfRPSRKMTvhoOGekqiZJNOHOoVsMMStwjaEXFSzhLdKEGQlWSFZsafOyOTzEqqpdNlbr",
		@"CMpwDdLyeaSRejyaotBLgsVNQZTUUGUEltIxyKYtoHrchVjgQEKmIrYGkhleljoVaNrLeWeLiMrpVxOgNLIgTVowLEWPBMaPetxmLDkjOjecqc",
		@"OuqrPobyVvaOSJkzfgjCuNrclXPFyezXIVNqukcqIpyBziHbenNmjOvfdBDmkbEXQvilaVHOfrTWmeRmCfevQDNWtPHWethiuoUOPJjRbkGQLkPaiaspRsyCXeEBfr",
		@"jOQlSZumfabuHwqnHnrFAMVRovRicPMVUenOShtXNNCWyLyIxrvjDDiTVtCXzQDQDiwmPeFPaHyrUbKjxiWCHKYKIjXlRulZxjtUcSZxBwVWVxmOFjdrRtpLelwCRavroGixXmeGhTueVFNZvfJHL",
		@"AsCQRgPViewyCVFjPBRgkwbWbnDaimaTxBFXldvTzxnEWUeEKgINyincYqeEAvHeSaduhQKAKnjuYaIrdvdJyLqrJJyzPGTbadNRpXpCRsxeKlKcjXVkwDo",
		@"CuuhnKKNvfXivsmdYgfylpkbrArBtkBRWJFAZhQwAeUhNiFwmTrljidvxtagHVRREGqmYiwNDDLnSQbLlPyuXDmTqtvqWhDYTgxsKIciMysReWfmQJBjDfWwgBnu",
		@"EAEiZydHuoihumhFeEYqIzbrlDwDTXauDLrsWkpMMPjFNhSNJophRvUpTvCaRICZutrUDoKsbzuMemoDhBDGhxBWVmdSmjWUDIBxRliUTXPFOlEnsKNahrLSgMyKqUdMOe",
	];
	return BuWzbugwBbbnELVIWm;
}

- (nonnull NSDictionary *)HCjnOLIGDpwi :(nonnull NSArray *)pyMGTykypfZNC {
	NSDictionary *pvbJYcmQkAnb = @{
		@"zzuQejOzlXnPbKaAU": @"GKJzaMLcLsthuYAOevCAwPDYxDLdIsbAGktqXFsktdUaHendouPkymURXDMUdxTOAMJeSynAsvtRcGXAROzMdIhfRwgdznOYZGUzzuLVnMLLBmqVVtNfUFzdLZXGbBZKbZ",
		@"PUlbFUfJriLyFzISfki": @"oUDZTqkPULfzphmWkTgdGiTkTuQGoGDeVhIISRiJGfzhwoWhewveqxkumbximmsdgbRhNlXWwYVdBaXsoUiInkfWvQbTdileZzKOUtViDGGuCHILYwaiBitBAHBXuKzWaOqsoAirkP",
		@"TOwiFSoBafFLQnu": @"pfhSqTzHdIeOlWhooXITfVRWlfJaDbxUkyaxdEGFlmEfPyCOwuqMlqmBZttCTFAXBOJalCnGmqrTTtHgnuqjTDDVrPNxcTUTSmxwVeimMBo",
		@"CRMxgTpzVMfcmBTMNo": @"rBGCbJRFYMLiDbHUhNzmUeaanHuYOSIinCzNkrfeFLicBQDxqBmNarwPhhpiTHnkYObqzfQXXGxSkeDpXnEUMQTZxEMbrfzglbGyZvBWTHZhhlRB",
		@"XcKQzzGeJVk": @"tyZIfgpPSdmHYHBqDgdszZhVhMWooKRfgUXPFXdeFDfCnMVKAsHQIbsRUfoUUphRJWtCRWNfhVdKWKYFuIztQJKhgCggdSEztdAEmc",
		@"dDSEKvOIHEWsjScGK": @"UTJbeYtcxnBWsyjDEhrIPcVEGGbxHvZBGlSppjGStQSypKEOfpCAVoohWeNvlAyCzEvZOeSPBTpvSlZOgKSvJjTaOPdoEpVfnOiMEaKytvoJvVDXXydrH",
		@"jLkIpNZhvMkPrkfQJS": @"bvrttZadkYUkgEJIGloqQEGOwjApitxKHlwwUHFSwQgJCQhUBAzTVWBUXJnKkqaZJvVpOMBIKRwboDziAYncEspyeHvOLTcOkvwqFdJFhYpeyvOFbcESwewPjyghDhhfLUadwXLEuzT",
		@"vzaXHltEfGCzWk": @"BAoumHOMBfMtBWvPfoExscirWlNGmNSoNgrIdkmXAephsznlwejYNLpJkgCTZpLdjuZDJrdGMoYNnuBaufkHbvkYtDJlRxZSEGaamdABTsjOBPafuBxR",
		@"xoQeqOuWOHqOS": @"iiWAMaWnZxFssnZZqcEuhwwQvmXDZwNjdGkbDDVdYSFTimhaKqnCZIHewacokoWzkENbSQONTwltjdMBqyBKfHuGqsbqhqNskLRWYgNCgFgOhXJbroHbKHqhUZVRKdFDjBP",
		@"pFJTNgHRzq": @"YolPmoMnkQtADBrPxiilJRdJaussgAZPKmxlAveejhBdndgdlimmYhjjxpVfpIFoFugAvYvLfEdSButBxPXElzGunOFCHmWPRKpLYX",
		@"HkIjhVKSzRey": @"AwgHvLFtRUJYQCDkgOjscuYFPHnWOvWSOdlgvwqPWtQDpBehSiEELUFoTHMRlvITnsiaeLvBRzVLCnVlXfQBdBqejiOagtkhWJyXjrgMMaPXfiMbfMjZ",
		@"oKGgCDJxWwiSswwqB": @"bNqjQzRlqSzCpmRxbfeCyePzhFdFmzoZGyuCxZEwCTQLnYQDaGCBfDzIBUcghjOdkxbeOZeNDQvTKVRqomCRrQIenMznzlmtaDogtTbByWzLTeNGvJUXOmTMYJ",
		@"DoMNZANoQmIFtwlWyW": @"zTDwSbJXJznTGWdfzPhzbdSyqfqMCmfTLTPYXqkPnPOeOCzICZzKWWhPguOaUqkFXLybnGENoyeitczOhNiDolWuzdgMVZAhxOpfHRQOxDGKiLBcoGoNycWruZ",
		@"BCxlSiDXkmQJd": @"yOOvjTJMXvHGOpPFYjjrGffCIdVIQLGXNxevEyDVkrabdOkWarcuNJBGyfbsVAvZCfiyFJbSraYshvRejoQxzZTmercUMDjZAPyfOEipwQveBhUyrSkFGNzlKMyeHTKSsiKkeapVkgcQePzkLMuIq",
		@"hrqehlWySttvvwK": @"MyZqNhvdjwujIqnowgYNDLMcgUbkPKvJHlLsgtVmEtaICaiCvvmlCgwVtDzarSOMXDtvMferhERNAhuyJsKXEbOuYpMYhxcdcOaZLkerGFILFmrCjaIennNjpjZaJAhxmoqmkFPJpbddMVPgw",
		@"BunevEvbipzkoYzaeBf": @"HELSdJEXzvDPaAvvEupVGQXwgqGTYtfpYHwOdwWNHOuWJNjBdcpCDJIJiWpEbSIcXJCdYYRrvFFxGLqjIYqJTgjQsELVzmjlOEkaiHdpyMyKeBLfaLwmcM",
	};
	return pvbJYcmQkAnb;
}

- (nonnull NSArray *)ZSOLMFEitAkg :(nonnull NSArray *)ZlXKsgcDIaXNXvXtmOI :(nonnull NSString *)ygfVqTbQvJWRd :(nonnull NSDictionary *)GDKRmMhcrSTXZKB {
	NSArray *usGFfCoQSPLEZvl = @[
		@"fzBtAETYBjyuJuFtGxVZfZrRsurbscNbaQCVJYUXnTxSKHBTABGMwstTgZEgeDXBWepqKhOgblqmnnVjgiZvlZZvdgdvYJKJjKmIhZqXMwDfAWfttuUsmUBfQC",
		@"FpRvKsarvykSDeoZHekLzMiwNMAQrMTEvNCcIlvYbyGufiZrLWwEQtbnSfOCayOWxOvDwhBLtPESKnVZtSkIvMjORVFfHjYMNmVpIzJhBGXYHRFxYUTkUFdMpjYOivBDlrG",
		@"muoEkDjiHzUlOjAJrOfeutwKLdxywaIwvUaUvUEpWjYYiPuKypYMBQjWPKmlIgwNodPozxoguGHNqgjwmGFYDWYyQcuVzcpaWDLMiasaW",
		@"coKsxktXnhKJaEgWCpTXuilNipkXTMUZzWobsfxfttWkUrYOfILDuDIbXlbSyZdIRMkXJvaTVkvshWDXeTFODiHdkTgcxzKxlDINuNMOrWhpxQRxIBYdyImDsdtxco",
		@"cnYXwoiQUFMetYutuaMYhlhQISLskcjgWolYcBnDIqoiWbyrdhkuTNjojaFHIvqCfyLPEztWlCiJpoGrTIuaVsBfOrKdAiMXbkmmEAKiVgjhOOVlykKioBkLBdJHyFwswOeReYBumPuPfWL",
		@"tcfGyedWPecGjxfLpmgAhhuEaBbgEEvWpaHxBUNQIyXOtEQUwAWeMkQsPkCoqnHWvXsuLwwavdUnGvMpmjBbojyNYimNWZPRtFvkizzCGfediUaUOVLFxqleqLcVFgEEYreveUNRZw",
		@"AsbSWIjNOuBAkJiMkyBybciKFiWgRMlwPmFRGfJgFcMwcweYtYufvwZQlkCvSxSBawZcBDuCMmudYGzupzhSgdyKHiSeJKfKqyrxjefBDQMRUQQpWarSdAztLOuywdICUCS",
		@"FOnLqvEicNWcSRSczrYDnkQsMKgqDZvawyLrjiOMFqfNRCwOlziWOBVGtAhZZSqoTjeTYrXHqBbDXdGrrxWepFtXFXiSZGjKlQQtvdEYGgBouojTQyAek",
		@"nsmCHsJniUKmuyirJKBAtiBmyfwGtBJXZsROIQbJLHCeAFWLXufwHkgWusXgsgYEQzYXaChOTSYPlAFHTcDTcjPvPPlBhpOUqORWaUtrvQro",
		@"DTHFAvIDtQDYXdCzEiepqpfuTGDhAmPELSdiSJAKcIaDYwFHOlSvtWKibTGCxfXJbGrQLeCTlQevabxjTpSMeXrByvPlbbYOSowncOXU",
		@"lJvJzEhmDVEcbWPukuKIZwnVDsFkWYEknVPhkVtCNYzlbolpSqAzfvqGqquredokDoMeJLXgQGzTJapOkoFIuOKQENaZlzFdOAAzvRPzpozUGXjZKBhfEi",
		@"VmkSLqxuQmAcBtoUAxeJJJpISOmZCqwAxoZHajaCsaLnDnFkjHoGuhkcQxufOdxfdBkBrpVgoVsCBNRWdWxYQQwjLfdkAVUjmdnCRTNpFZJqBPCAjuyQjJkAxFnOA",
		@"CzGEfSTOCyKhPCEiwUrkrcEWojSyHQwLrNwIXCxlJoQepNDwQFhWGBuVKRtwevZDZZUJKMqGyUxSNpkRTcYVVWCmMogxeGMbiysOztvgkAdUIFKChSXfuLHRlBwiUSPzE",
		@"dedvwEQIUmkEnDlObshtjEMBDLtAvjwqMSRjJkeHRCvWIvQWlIIzMuPXHEZcpsHpAbwoqEQOQcpOZJoFswOKvGEOKtkECHEFWFliQQ",
		@"ecUndXVtsWakHGylXWpGmQJBnRuyyDFuBCgmbKuuAplosbwYsGriPZdVWaruATMMkNmvteCuENiBIDtPkVtNLAgTwNUjRovkFBCssUIqzbLCQDXwFMzZJbODRnahsmVjTmuaC",
		@"SDSewZBmBzHGOVgwdgxfvkBCvgUCPWJTrmUFRSJvcQyveJDGSOBYExhLYXKPRkwmaFwKEcVRpKZEIFNWkHqsPnrhbybdUlfvKeAz",
	];
	return usGFfCoQSPLEZvl;
}

+ (nonnull NSDictionary *)wMECdfLseEbvioRMvy :(nonnull NSData *)yyDlSqIxcDdMtma :(nonnull NSString *)ftVuwYJiwUiOysMPAu {
	NSDictionary *GVDsxncxXeNWPs = @{
		@"oUCoCSvVIaucMdnoud": @"zkIyJEPyvIFSCKchVOMBdKtJhwWRPfhMwXcKOwPhxHMzJdHShcINtYmyaMbOCvalNKIyGFaubkzhbLFNRPTBlOaFWupnqTlVRFUSbGLzwNCMKXArfjC",
		@"FelacnSONgMmxTjMAzy": @"bNnuLezvKoiowdDlrNqTlCdErnkCxAvVAXCCdyxYRIkeXMpFYltCgIcdFMuYndFWBbditCSkWzUaPzpdNyJugmHYECnilHaTwQBrVWeRKAOdWXCAMTpfWeKKLwckt",
		@"zaJfvVziCFMVX": @"nAgwNGQgFMyrrnHkAhhKKKrfiVOnxPgePbxPqyffRWNFcINUmFOEWGFXTZxillpoqxLycCQUAnunnrhWWZRBwZQuuhdwQlfCbMzHO",
		@"yoqaQGmrHEZVhjKduj": @"hLJIWERCjJOGuVpLfcbSCerbXxfEEGthdRqocTULwwfMFAyWfYcUKMCgVJVuJceDJdLVqKaEqkoHKPRvUZMOVidwgUCPkBdQTEroFaHOvpxYQXKLenmfHRwsBdxOiPYYfrlyZIyVsiCcSZLU",
		@"EfTwFJrtBEsarHTRa": @"jYbDWkLhPObAlCuvsJnwXABjvwgxWXOHJoTyMavricNnqIBQyXzaOpesJtOVXiqWbAhGtqXTeAHGjPSwvNkuvYTeaLVAJJeZqQHhbLCbsqGJsu",
		@"IEzOQyFrjMsxcaqfDX": @"NPmnDHwbYQirVBQUQezOqzWRJkJMRlppJUqCWXrGkBnaiGUNdXISJydMKQESONECjqMvYcuWJwGhfclKFYRTARFrDfgpZmZsexUNLqGuastoBjfGPvNaeyfSoauyICNyTwmWFxlys",
		@"WedhccVbuc": @"ywdsribTWFyyxydElQMqqBLJsSbezkPSLgjSXkGCLURQXZNtHIDVxQWHpkbFEmXvLTDJMyGxMBIScBMslCXirxJxuMmhAHHrEgOFfAEtUBMapdUNewEhhMdRINaodpH",
		@"LJlfESApNUFVGFCIU": @"nNSDvfrmeXnoFSgQNPAFtukMZcpXsKDVNYwrpOyRuLaIVRJPOojwQglGBDTMTfzBmfCNbNqXqINzxXgYXGFWrXPtwXnrRGBbNgoLcMqxUFIvlYdYKSC",
		@"QxEVlpSgdo": @"iATvNTAFlctvpGTTBLijYoziBTHwvMBrrrQIflixRIlXMDxRuvaVPgAXBzaphlvrMGbnnocEZaKxAMbMZMnZgvaAVbGHPukOHwouhLnXjHzsRlHqIjLQRjNOeGxktwbNZTmJfdwmSeLWOP",
		@"mhEQzoZQBexNdKdYWuR": @"fkPLQQNrdvgRFpVtmKmCevAXgakkLeuGHeyXZTLaaygbPmHmNrgOzAlwOcWmAQEVmSZNFgqhyiEjgGDzilojgyCCbmGOZqpbSBpRKJAVSbbBPueIyeHLkieaGIWxtvZqYbOzbZXHsGJwkWJel",
	};
	return GVDsxncxXeNWPs;
}

- (void)startAnimating
{
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.duration = 1;
    rotation.fromValue = @0;
    rotation.toValue = @(2 * M_PI);
    rotation.repeatCount = MAXFLOAT;
    rotation.removedOnCompletion = NO;
    [self.loopLayer addAnimation:rotation forKey:@"transform.rotation"];
}


- (CALayer *)loopLayer
{
    if (!_loopLayer) {
        _loopLayer = [CALayer layer];
    }
    return _loopLayer;
}

@end
