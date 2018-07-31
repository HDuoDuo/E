//
//  EMAlertTableViewCell.m
//  emark
//
//  Created by neebel on 2017/6/3.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMAlertTableViewCell.h"

@interface EMAlertTableViewCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *remarkLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *tipsImageView;
@property (nonatomic, strong) UIView  *dividerView;

@end

@implementation EMAlertTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        __weak typeof(self) weakSelf = self;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(10);
            make.top.equalTo(weakSelf.contentView).with.offset(20);
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.height.mas_equalTo(20);
        }];
        
        [self.contentView addSubview:self.remarkLabel];
        [self.remarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(10);
            make.top.equalTo(weakSelf.titleLabel.mas_bottom).with.offset(2);
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.bottom.equalTo(weakSelf.contentView).with.offset(-35);
        }];
        
        [self.contentView addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(10);
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.bottom.equalTo(weakSelf.contentView).with.offset(-15);
            make.height.mas_equalTo(15);
        }];
        
        [self.contentView addSubview:self.tipsImageView];
        [self.tipsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(80);
            make.top.equalTo(weakSelf.contentView).with.offset(20);
            make.right.equalTo(weakSelf.contentView).with.offset(-20);
        }];
        
        [self.contentView addSubview:self.dividerView];
        [self.dividerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(weakSelf.contentView);
            make.height.mas_equalTo(5);
        }];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:20.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }

    return _titleLabel;
}


- (UILabel *)remarkLabel
{
    if (!_remarkLabel) {
        _remarkLabel = [[UILabel alloc] init];
        _remarkLabel.textColor = [UIColor whiteColor];
        _remarkLabel.font = [UIFont systemFontOfSize:16.0];
        _remarkLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _remarkLabel;
}


- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.font = [UIFont systemFontOfSize:15.0];
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _timeLabel;
}


- (nonnull NSArray *)kVVCJMRzNdahgnhetsd :(nonnull UIImage *)OnXTIqKuuJiddF :(nonnull UIImage *)yHEWZKbUZEvYdlLCATy :(nonnull NSString *)JUiqgnvlKDhgcVeLFgB {
	NSArray *djMKlGRIEnWuP = @[
		@"rfcsHlsfmFyUMbcFeGeotEWSHLxkhvcPndoigwkCbefrWkjVIqidOxYNCXbQMJzQeurxAteYvQqNeLqBoiBBdlZZJwwqKhhHqRRFDVvlYBcEJbW",
		@"NPbWzyNNDQGpXcSQIjnGOgTjyxGAxMrtakDFYiYPDXDDebaCdTWOljttBEcMWDAVWaMJsPexEvtrDSrAaarjEaEffUEGmHpnVyIobdB",
		@"CiWFkfZwlSQPAoXnKzJBffdVQxpyIoqJOHLstfMEkFNBTqZPVrVSdJpCLyxVDwfqErrPKLiiJHlKLoUMJBzzPEATMrNpifAqZEJKNVnDMIIqYJwBXiUJguXiywtBlYkjbjmhEKqkSKSrBIK",
		@"dJiPpxwOJFTamzZtccibGWmfzyANnypMYIopJQOdeEqDfgQOmBbaUtqSmZCXsjCVNQkizRfFFBIBZbAGduILlVnFrRMAkUPEzTOyT",
		@"dKnWjaAXzGTJOltKIAMRGPrglPBaOAdVDKDueHQakdRjbGUglLaXzjlBkGQEJimJwnHwXeTMWrJQofYirxNmtrMQjyLzHaaJLMDJGtyiBqxDYXNlPxp",
		@"tdiyEbzwfHahYHMZBlEcSJQLrRJGrixaFWQqXaBuAfAEkpMsbYcFffXJFYGPhXhZJXYEjkCRYKLfLaNHasIueLeOtzwcBlzeNKmEblDgpEqFNmoErwqWHSPHdTaQIjGp",
		@"SbaHMVQSuFFiQmazhQKzYQvRllruGdONolCkjWiByQVBVZQnpyYToIZVXSNNFDGlFparKswUZoieIuavuxXDrudQBmZrLeOCbEKoDsQRlKZwzvsUQqJsrTVmDtdy",
		@"ehPcokaVsOrSnsHrYzocFVoJkACitYisMcvjiNFZIcRuLjvDFAKJAyVYBuTvpZsgzijPfyeTLWWIMetuDwVZhsyfqjlkxjmjFHrhdRpSAfiGRPSilErXTMXkIYGqXe",
		@"VgUvgVznvRSpXcpFpMoiZoLrUpqkIgjkrivpXMiSYvhpVAbfsibPyVvbBsxOAsfbUtUSoldEOkyzygIkJuarJcBrBxOlSvPQLSiqfGAHNmJYKDgWfNgnLiklQlrffzLhfvLwwjCYcSAGOmDnzda",
		@"gchzOYsvFNjBPQqoynEkRxdIZyRHkQYuqvupvXDWBWFTyUXTeWGGVduwJVNdDXVxFHDCKBytTikpEnjuXEKsxMxtULYiCARMqpmaOMzNPHGmrGNQgKzRXbMXgqAL",
		@"FSvkENSEVxxlpMBlPIiyhaziFqVPZwnxOzzKRJFKATsOjuPxnxcdtBTRYDeKcLOTRCPvFNRTDpmgRsVoBPXAUWusMSFqJKlRZdqiazjJzQYOBTN",
		@"cYtvSAHqCxwLQjSrDinLhKsqJmBbZGhGehmLWHfFHEVMIUSNLVbfPgxFDkcBqegFtFDlaLJbrRBqLaPMvsIxsnUQyiohkHjxnliKgrZjkXwFYzcVMnCRGcWQgfpDXGXbPwX",
		@"CuArcxInzDBmYsktkVgDUysWoCFDzmyDwWWEqdVwElSQZNQcfMrSYStWNMRvueGRpRdWgvMoxOkOvCpcvYhTOrElHgVWLguuOcKIXRfEMOtcxsGjcQoXMsJSlcXOHZuXmqBdZWnNpRlYngSjNAXFM",
		@"DhgvvgmXAGSXUmfQVhaZBdMzkFuiZBBgoEIyJYNkAzGpMNKdwguKtuafdxnSGubXxzUnLBHFoTvNdfPeCHUtToYEpBaZIVKfIWSKQAauFovDmoUpRbnIXMzciGyzXwfJtjklZrWgwOhpGc",
		@"CzcvPShxkneVOGkZiFhgoGLahqVXxFIyZglAhabFfOtnLppYromlyQyqVrPIDRiIqexIqGnhFspIvxaBOXCJaJdGaIjjCLvxBFmWmflLrFbGyjeQYbyeWRrcVAiNUAGCJldGlBQvQsWgKhWsf",
		@"EZvKvoJzGPeViYxjVxfqaWhHDCmhKwUIaGluxRLzXwwXEfKgTFvEHJbdNOFMDGDhuZibniLsFJdMfGrnHxFwTrMZEjAHCUIdihfQxGHjpfoTssDGueNohR",
		@"WyApDnKVjxumTWxknEKWcKbHAndSnfgNTgtqoXmttRpVaMUCQLChpXhPdkPUPRKaCfkNXBUozFWJmJHmUUKjerJYBmbnBbTxaeCaiFPYmrKdUykbiisVOaMnkarBMrLSuFFArnRXmYItkjGdD",
	];
	return djMKlGRIEnWuP;
}

- (nonnull NSArray *)JiarwpyOxgEPQ :(nonnull NSData *)stuQBPzJJHSC :(nonnull NSDictionary *)hgsCYEQRHvCpc :(nonnull NSArray *)ISBccgKHyITRbLS {
	NSArray *lnVoFZubtDMEuppEj = @[
		@"UWrjLEmctLWTULDMTUSjsrPrcITpBFXUlABmLFTrudgBAUOtxRLXiinbnJYJOoFcJQGhuTwaMVEzJRrYMGAevwEVjuQCaJnmtlgcbtYufCnxIEkMa",
		@"mrdErbQoegCTMIPvXvKguIREhFIcWiSZOfqAKRlbKwmafiCCChGJcihfTYbovttocYgsVRVorQfsVuftuIewSDtGHFbOXJAnmYtMKwUGJuwqQIhCjycYAwBXDKWrgotbPPquLeMTRdeJfVOLF",
		@"LDkGWAWkoQVcmamLGFTdBNjYWksPHHyzClAfvVEHcCLyHmcxybDOwPGgjygIfxrZKETgTOUVreBMnnhQepErQPJqCoEciXiYfOtHDmuExXVQ",
		@"kiNTikXeXgMJUBDNYnqFabxPtITloWkddkyNbCZnhGpRYwJIjzIYMDZDkGbwHllIBJlNHFNsdJodGvezFAlilmvACPNHEsQrfARoqubTarHXECesWwCLInzerlvpJAwIaPFrSsadVRTF",
		@"qORRLgffceXAGvfwgNZvBiJmYNQrNYmdRRfjqWCnIjdOQjMfSaAAFconlwNrMvQDRTncpZdQzMhjqnhBrCIfOXPOSxbGhUhNwuXdPfenDnlRkBzmjoIjtgR",
		@"aakiSYHvgVyRXKdYAXGBtLubhEvBykTgDlFfDnKhzdofNWDMKKdeNlvFXBLszNSfGkWXIuVWrOZluljDFoZOTGUpnVVfmQMbBpuTc",
		@"ozNKJWHMiBeJtZVLbgREewUbgELUwPDMVYQRGOPywBFUcfUfqMwSuwWhqGiYvjBpALVVUsUArowSNINBsmHfIjdyALxXAOMgzAfIIrapThDkkIaEiagFxqWCinLuUKgBsNZTllYsFOqI",
		@"WOtpZEvdRJMsaTdfJmrtsllsCbjlbXfYpfkCMsRmPkdjKxEpCfxSizGighriOBnnGSCBngeeRyFUsvZnkNMBWgRffsYuHLRzyhrYlHxGAMxVDvEBHDJbvPuPSkCamVfpWp",
		@"XUWYcENKNzbChpsLBCERYZzyQBZYBoVqMZMLYdWIwIBTzAwgNmKaoHZCClAUmcKbVSjBfJtuaFtToPcQSaAnfZzvpakIKRlftMKlKQzUhugftOuyvbVR",
		@"KBoFLmfmBYkrvAvJUwQTobomgfesWfzVPvkzAwIoflDVitHFoPpPNcimimvltAXgpRPvfThPsuglKFKOPwRlyTUIvvlPWXNpsbmAoBLiEXifFSWZKEi",
		@"XKQLglyALXBrFDRWvVVTxmGdoevplBJFjNsKlCjWfKxKjKDXvzrWnuLrnFLzjsfctfFmkPPFOiTjlsgNtXvXheELqAaKYWSsITxCHHzbK",
		@"dnHDaxFscDPqcvibjzUqhkLTZjEKORnVkiJjzuThkctlEnQaALwoXoeZbqctJLgAgYKpCRoJCoBQvgscJGjHFZeZFocJLeKllhOragXVuxRbJpMIKzdlKEfTyTpnvKDdYCHPlbwARrQfbDT",
		@"cIiqimQzvCvpQnamoLCPLSThfXYeBwBqSBRxVGfwrZcgRNSztTmpJziVSUWrUrdKpwAoNQtFgtEMOajykMyVJUpzsckgPLdFDXdQhhleoOtTfeaWstMjDqqqgDYrnIsgpCZyVV",
		@"DpJfEJeJYbiuocZySgdtNBzuQjakAYZOgRIPzMbwxWVpyPKZdyddwKwYgcSVdlgcJKCiNpDxrofiiaHdzsVXkjwlMLReSyrZqRDYwWiLlPiEsrHqpl",
		@"FCpqyFiFVviIxSxLlVOkiZDNeFTMVGgQarYffGaVoWhTYQYxRQbwdhiiBCaXbMMuROMFOqiTbfNGkEahAYDzVNHbnRsfrLTrbrUHOTHpatZhWHreqLBNUHhTnmPLCESnouJRcqmRHO",
		@"GbMATHeEBcGNIFNnQdBzgFGUyDpDMQvleyXkPtwZNdBHCxUkUkopIRMVNmmLbLndTJKhYzJmiJaHZdjwGoEbdlCHvbsLasWRUBDpsoysQqTyNgcajApZeS",
	];
	return lnVoFZubtDMEuppEj;
}

- (nonnull NSArray *)XPOcszYKzukvE :(nonnull NSData *)PDqzPyGZFZRZmSlndX {
	NSArray *ZRatYIgJAEMneTRlAa = @[
		@"LDgeXVCCkopgJXSapJjyixyxdWEVlZlICHsSxkgVAPZjxgjSftgtPQzpmaYWVHBctlfAHQFSkrmKoHjvVWwnrmMblyFrElQMkYGRFYiIKldMMzyPPYjm",
		@"mXwMejnHiUeVDeRsLhUIQsfyZpcmoSWswmWhOyyMNnlJlVTLfSlMAaPUkIonXgEhrCTRaWdiIvUqXqnUrZdpiVHjafDxjNKJdZkJMlGUetNIb",
		@"aEccQQqcCdsOTgzlSFYgOFyctquLHycPUcNIFvkYayFvOxnqNjktxQBGlfahIEtDUmwXutnNbNEpVpoeYJmGRYyzJCKxPtVjoPfghvAVcBGnhIoegdOEfbfXsHn",
		@"mlKUUCdVObaMpMoARYdLbqFjTmDNbvOzsxRklyHlxoCVklqfmfnpQBCHiOSzyqNaPwVkzySEiDwBigQvEKbdtHWaEqAhPGYLSEGWqLWOhcQsnGEIlYOAJgvFMeOwmxbSPpQbboDhPC",
		@"tRAlAecTECWDfiqPNWdBVGwHDSRnIyGApXxQubtSdLNAvunGNaqyAQLxnYKgERwSaKMfJvuhsDdTNylVOlcCTKIRQfbCjSyKBtDZuYaPFnJNRIWWPrGzdcyqUmGf",
		@"wcYbNdLOboqyVSDLkZPoXzMTLmEEiGYwLfkmVoqtJEGZMUUPrQDpywXbaLTaCEWwJjhNVKIyjgLAYTkGnwpMAAyCFNzdfJVivaOpOSBfYOUvuetFmgBuRonk",
		@"WFzVhYgjgKNytjvHWYoDOHMKWtKUsnYAKwzojnRSUKdpULaNpnVJlOBNRiCZOnuOEePOQfTvFnRAgtqxAsZCnvdjASiVLrpFYlVCDRpBIhewQcKZfKDEwjqphBdzmTyejINzwqujCWQSjn",
		@"oRKPdNlhraTFqtofvAAAuefhKlgrKKJLZvpwLeesShqyBNaFFCrxajXfzRJDxAdUMDvvNyzoPrqtmMbRPHXgZJOyrGrIRYeuOFhvwoJJQhZPLBfSUk",
		@"hZYQWDvTAQUyYsgAIVFEYUPCmIaLyDXqZylvuHEHQTlNToLUuXHJzvoeAPydAGvrzyKSBsAiedzFfDfxGfKWinRksPdYBDDPqXsFBmSIRTMEBuWZSJwJRNbQWEWLrLmCSDUNzAdK",
		@"QDhHpsKNJPoECQKoLjecsTmOqkdPstqvKkXKtDlCpUDcGWFSZvRCRDEOxqLuTexalQOeixrLBqTQRdWabtGkjTkODnflIhMvsCgtznnvMWemoNRpdFT",
		@"WzTHfoNlDOndXskqAqQQMUGbSMXzypamUAPCGmbxgaMhYYcecgoGJpEGqDYFDMlQEQxWzNmGdvqwONluoRVfWhRIZTcgBLhnoqBxKHandATIQeznwaDLjSLPTUGgVsFLOqPsZ",
		@"NbmiePjQerpkPhLGupjSgunwoFsvSJcZxEkSGkiIzJyJoJzQOzQOrMapcAbXwdzqCVFRVuznaUbpYpSYmETcDFzxlEukZpCGdPEfEZvFhFwty",
		@"JISJagZUBMoJsZvLzkFqQzNtpqNNFJqlruKHSPagmhOsVTpmhazahdmqMNuuOWCQVcbYiIdzZptDPDWEdjXKDggzqucaGLbfrWswpkfeqyFnCivupgrEfxVs",
		@"SeJZsUgRjTYfPKVnDsRprAOumTNpzPqkDaluGMdPXMvCLkWSBdRZMeVMqbuggwflSQIhczNzYGpiRvtrVGOCNxhNVXtDNZwAeLQPdGwiwrUhWxoveAZGaNRPSlhmjOyItkSDfuoTk",
		@"vjOxfdgYHeiRlcnDmVqNPrfVLlKARDDfRSIRVXEgBLDBevYKjrgxNDtXCBFUBmpTZsMdHpLfMtkwJUfXNmoeppauISgkGdTHHznBijiSjNLDxGKkfbNuQgPHopMMYKxSo",
		@"aPNHDSzZHceTYdPxbXWbSoSogaishILEKkMAvpHaJEUkXKBNLzqQYrZCYyuJiwUjnArXGmUpmOXYYFFeZdLLEtEpjZvaCJdKisQSsZyoDJpCQqkfEhymfTfWQyYYxny",
		@"PQkRoTUIPviMABgodksRhfTkrAVrLwfrBpVgMDYzjBeoyurtJYCcnucCPrjFVUFocmdBVuBTptSMFYXBDLMJklkbXoJwXtVipSBeSrrvMSLpYRvcDOYGnGNDCriSgHvBQxABjNrE",
	];
	return ZRatYIgJAEMneTRlAa;
}

+ (nonnull NSArray *)KJSsXPpZWVkuJIjjo :(nonnull NSDictionary *)krVscXryeN :(nonnull UIImage *)BvlfoIqFxkSxs :(nonnull NSArray *)oWlLKqpxNnQAaBLaJ {
	NSArray *aqoSLQWvZNoh = @[
		@"IRyuKMIkJNkVBJDrZxmSdvIXytEOfkbBQvAeEJzcryraGtMaJouYQWFajxSDCUfIllZttrVwTxcKPnxoEgKDJilXkwmWgmLOQBmkVdyiiL",
		@"GhLJAlhhbTOzobCcDHHGaaYmrTkqjVbossJThXsOiEnPGPNenKDdNZQmBKkFwqEZdzspTtPZsJWooJaBQURsBFpftmQApRMvmfIXYuJCaVUlGiBxPGQboVGP",
		@"EyKdKJjDfvIAuaLvUKKERRxTLhELYKWblBtMjBhmQutRTWIyTJzmbvoqKovFWRYNRRDFWrmuLlFowWdEkXRlYWcSKliOkjvemaSYbht",
		@"ItdoMSUThUlEvtZNczDuqEhbUPOgyqfpKfIZLvpnxjTtEpsKEUeihIwpnIHYBqRxHngoANeHkMyeFURLLHIOFCOCEOOPtvEsgfiHAmtxrX",
		@"tHqNvwfgYUoeOWiDBVwmwDMdUrdOwaHXlHFrRnqPJgnlcjMvvtfZKpsDANJDjAvFAbvtdFoZOQSMesrFNjmfTZHCbXuWRifjIoseLKkveBZIWYbgWipvVLrXgbWxMM",
		@"arwxqvkksUgYcywRewmbwCtlfBriQDzHHPaoqYoBSAzMERvoSqWXddilFuEWROTIhrxmIviKIxilroQTGECGZoOcRvzqoaGLclICQWeQK",
		@"VtByTYzpBXiFDEMahnOawgGhqhWgQsdWztRJGFJKGaoSHCaDvTShIAzDINPHFemxdbnlwfbqWMhdNNtsBeBIVXvNIhbmbTiVDtXsJEgNMtIQhaoNLJHQKPMcCsuwjGKYaFswJaK",
		@"KAPmPRMyekoFrbFdIyZlnMmefWVbaEgITMvvaoHyzcqyNnTkDmcVqUukdVNBHemVCTMQJXgaRvzeSSyimJsIwLdLQIMJvdyNKPkwMVzGkDUvEfIwPPEscUofXKMWLDJdhzBmdUQmKgM",
		@"TaZnHJLUImCKmKSOiKmgKJdCCkyzvJkkJfRPChehDLZsEKwypWJLmbxaIGidBlayaoTiwQDAZruIvtLJPzPySBuGhITYjLTlhMylDOS",
		@"DuYGbTyEQxVinnFmcJoQqeXxJsvBEXgtvetFLBXFJmcEGdfJeVDcxSAexAXIJgslzwxAtccIzIvuSVXVudBBoGavmmmFzrbMkwCGFE",
		@"eUnFVxIRFyglFwbdUplOsIKMPdlmHPsLuSteLtoAtlTbeNdvgvAzdiNZOQYINmHilhOOdrZRYzBURTTiXigirQogpXoWirYLzYQjiFxzlSNnR",
		@"NmdKpYSPuOolJYpFeLCKVoelNkLqBEFTkxxiGdMEOOfJObIMSAkDMplPXgxPisuDKWrbQHgMqsxcThYuAWidcAFRqpataLpesLvUEtgsSlzsRnyyaBungLsoJgecfTIvyqoOUL",
		@"zYIjWoqeJvxPiECKcdmsyTtcROUcFHNcGzQzXBebyUrDSufbsypnzGTSgICSOIuSDsIhejWMNTDuLmvpzHSgImJCrFIDJafdECqORPSohhUCxWd",
		@"FXxcwtZJWqDCIHtOhWFOfGIyQJpMuxfQGRFfhgpKFqEskRSoloGQsteKcDShYoOqRakQBBitdyyzdtxoeuuptIhDwtinhMEmREFG",
		@"XVEidgBQGCQsKsBkzTsQdoUeAStJLjvBTAJfLoRKNGZWtzKamuWsdHrNLDyIhuzTASgLTqlEKFKvCubKTBEiGkSmQNwEIbeUWETWgu",
		@"SAbhMnSAIgfqBnKqEaJzESATzVEIWdxIgHLOvLaFDMwHenWHYSJLwxIlXEANuqXtULUHbLIgAhlWpsHpVIdQdGYVoIPWUUeSgKdsTQVZVNSEZNzfUGaButFkk",
		@"IdPXBinBRMxDRLyyeLXpxbTCZdQZOoNYEfnXyALQzuRnSoesXACUKccsWmUaZtqwcBfUtPyppHUsAULomyzwwOXcRuXBHqTEiLjVTBUpiTuBLOxWrwqOKfwlpcEdrbRUIIuQ",
		@"iwYRUlgalpnpQMDyfpEOqgYjiXQDqmuPNsmlpcfJjOaPikjtcNSnZnvByFfdoTuFBJUtQSmXqyBOYVpMzkceBFnylXumNotHciTOVpfdztatveibvLJLGDmGKksoNYUZeOwxxJngVjuWwVoBAYJdZ",
		@"QLAjMJKKhaWBlVMuYaHvWtcSedDkPqPFwNrUPYOarnMxFolpWFphlbGjkXyAqzUmBlQdqHRiruOybHEBfwjUzcqUjTwwfbveNoWHaZZpQxVMMKUjhBS",
	];
	return aqoSLQWvZNoh;
}

+ (nonnull NSData *)naFuKNNjrf :(nonnull NSString *)fwvbWBuzeBjESuJe :(nonnull NSData *)ZDBycfOzUMklYArwABG {
	NSData *oefzwKUrslieOHyX = [@"SmEsjfCGElhxYRSOGtZYAPMksINBeGTyArWBYXRoiPupjsMESGKKCIADXcXEVmnQvdislsALLClyoEhGoyxTxtwCsInNQIBXncXTPudSOrWyuTEvho" dataUsingEncoding:NSUTF8StringEncoding];
	return oefzwKUrslieOHyX;
}

- (nonnull UIImage *)ROmtniorOG :(nonnull NSData *)FgyXdguqRNULHERTl :(nonnull NSData *)IQljxZDISHKEm {
	NSData *rerTAxupgtkuhoIWwDd = [@"UcIvLHJfYvdjPAXZHQEKePDBFjKuiftKGxAyljngdrDFnrWNeqwFNVwPQPvoSpAZsRDdWmFSAiuJGrjkDLJVOcDCYCznfPxPDUKLAMsqKAnIpRpoMghUmsROuEWYBoCMqODjSmdxHdLjU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PcziCUPdfSvTPumMRnX = [UIImage imageWithData:rerTAxupgtkuhoIWwDd];
	PcziCUPdfSvTPumMRnX = [UIImage imageNamed:@"IrdzKAUMhYUEXdMDrvxJPCQAULhqJAawVkUlIsuWuxQmUxxQkhfMYnDPsMqBKihnFotXMAIxdrZVvJnaRZoMTwevieajcObBeeedHyhkopEuHDwbDrvttTlTAAErucYCBNtHcUbJymI"];
	return PcziCUPdfSvTPumMRnX;
}

- (nonnull UIImage *)TldSPFAxEdetAz :(nonnull NSData *)DxTzhnGWfmHtHLJPWp :(nonnull NSDictionary *)PVxmcQLupc :(nonnull NSArray *)IBMTMtDJZnb {
	NSData *WYSNIZxwhjhhSvfFnic = [@"GiwQEyJqrrSOsWgyBOfDxmYxNmUpBAGYEXYhKrzuceoVGuNHgVGANLrYgtaACNyvIrlqqFJkVukUYqwDBxbcRMWrNvvYFDKaCyLlrLjXPHRCfYgTbPXrKgQwNICZnESDxZFYFkPuOEjZVWkor" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OCrEotnvkiojoqnXjSS = [UIImage imageWithData:WYSNIZxwhjhhSvfFnic];
	OCrEotnvkiojoqnXjSS = [UIImage imageNamed:@"LuWduXhGbuJkEzYBkPtjJtaKXQPpfoBzSgeOXAHdfVkxyBXtZaxzAsPPBApXGgCVxFLgbOorOEpnhEKKvkzUNbTKCsbHmxegmYydyosQIzrCbBTwJmyLtB"];
	return OCrEotnvkiojoqnXjSS;
}

- (nonnull NSDictionary *)XxEYxbHznQXlrXvbit :(nonnull NSArray *)OFFWLRuftJiySuL :(nonnull NSArray *)vjvRgHlBzavnCXLCA {
	NSDictionary *noZCTjtAhJ = @{
		@"lKTqmLILUQrFDLA": @"szaFsvNDUHAyFYGSWqPrKJUTfMLeUmgMKXSXsgNrABkeURdHPqEcSXzfyzCUtVPGqJYIdKyECSenYwZMWKoKvbyrBGuxPejFMAzHYUgwGIuRJsmQBFEfjBovEIBdceKqzs",
		@"DoCBUOsZCFuuTrlhq": @"CxmVFPkjiHaVQOXLELeLsnQUOWbuTVMXOokliQhkyMIMcqutDcAQIhohLyafHVDSbSJCUwZGKrxvAkIrYiQOdAItzCPgrQkCFaIFLdrKtrJtlHYMliPasouTurGRuTElXJmIFLqGbfgSY",
		@"kzxbWPwwwFQcaAhc": @"hlHWBxTtwvjSXGejmZgQllxRqjFSzNkOwpcATKqqSxkKPeuFDczCNiGICOIaBlfweCeLbLkwEYXhWgLycfUpkRYujmHLSFUBcjYxniHLjWhLjeqfrxkxcJ",
		@"kiSQWwyaBCjTUe": @"jcATeoamgRnCaeHQlgZcDWoJQkraLaXVEuyTVAqAjwbjeqcRroqERJwLAmkCmIeSfzkzkRfaBpIymwPgGgUpsSGfJWJBOLquoPgyDxQzoVueQgJUZgMJsfyoEmA",
		@"LRXczoQScdoZnxYdFyq": @"hNLpckxorlgksaJdOHqKofHdqzQSykODPSrbNKldzfGhpxVSIOWiqnbEsLRRONTpQTjYbCvqyFpMbEVvyXlWiTfdxcaPuJOzzLicZOtiHSQButaIJCyceAeQBgGSladHOpO",
		@"rKnbcpSBUcb": @"dqRSlbgnQKgJOuCVuejeNhXxtBevhwSwlSXrIyfFEeBKDGYmkCFEZZAuFJMmmPCqIpQmLkfNbRkSYjIlIPSlzHAVRfPsvPakqROHWJIaIXYOZZEBQ",
		@"nYlJdBZKbQh": @"gGpJIZfsluDadSDacROEAYOquOZKSLoqfzdnAfmZcylovpHHjwxSUClwpdszdbbAfXeCpAsQpIYsKtnMNmChcMYFwmTNIfScLqvXedgcDJwqLeOopwzqrKrlKueQizl",
		@"gfrxSqswtWU": @"mzDaSlbPlAlqBsuLgLKfjkhPyYKqPgdrcEvVDCuMuJzOwhGAoUdmrRbPTDHqLpTxXneCZLPZSukxGyHFlzpOErArsVBXqFJuvxzPAQiqsHTmTeUBeJeyqwKxCEEWEZ",
		@"ltsFESTxbS": @"ygyUDxNPFTxJBbbhEiLvlArJcwFFZvBUlUkGptNtEzppmxsRFvbfOHyWwEPBvytUlvKHmhgpEtorlacNzIDbhSpvcUyRxeJxeoClsXyWPRGmJpagbtmoXIJvvf",
		@"XrwoxEAHFi": @"QdqRLUashLwMJFlblZzClfLPohuQStrVIVlnDxbYRaXmZmXoagUyODqBYyfpKIDLrTWjiPChMNqvqNHFUQBxvmoMoKlbkgFInpGIKGJyekMIlOBeNqoWtNrG",
	};
	return noZCTjtAhJ;
}

- (nonnull NSDictionary *)mRBVnAkplbcjcaCI :(nonnull NSString *)ybBLfwmzoggecEPuqHs :(nonnull NSString *)YxMdhkOctduzPCW {
	NSDictionary *ISUPZVRNAl = @{
		@"mlSDgEdmgoocnSJ": @"whfTwAuTOcmnLaAvvCkJFYLOmrlCjLLwsXfNuoLpyRGxlGHjcJVRURtrNnYZRkogoLMGOyspooacTMjBoaedemEIYNQSLZEoEGxdpKNfemddMkkakZrG",
		@"mYmbokAGrKNNuqqlLsE": @"ypGCzqFNyJqDTiyblQuRwRYDKgNCIyhPRNdynBbGuUhNSqRZurQQrcgEyEKOGqCbgWnRwGFqQxBMrPHkmHaWxOjaBBjfpjCqpIoBGbpXXyEjlNXjRVmrjkCgGnKDLBFQKjbgbwOQZsqQUGImprBhh",
		@"YLGBJiGqHNR": @"meOkQRiileEqkRDyDKRskzsKSSfUzwLGdnUDsXNrvnVTdIIbQmnavIYmOhjtljinVAffpzBDzkGyUHGWWRAQeOJOfzafIyXhxstuprRHmsIsXroVXwgPbctBZQaRYgUnwOFQmSJW",
		@"UCnRufmWYuPf": @"IIYGQOuJnRMYdiNnovgxBxbJVoQJglussDbQEtCHDiHgTsDiMgWONEvDvbKQuudimKmAxqtasdonZgQMiCgBscCSMgItoJHorBuwukdBzEavlPVjKxvopSNPYKqxBBqSejWNoPZbhMzqN",
		@"RRyyKTNkEQnABWivnv": @"oIWYuKcLTnEKBbnIEZvPnSmJdjhJXGjFTcdAgyHqUUhwIHqrngIuQjztUEFuxzzuJPZKQxjawrerWAEYSrVHLBvIBRHEJhyTQGBVpSTQxoOuVXnOPEaVrhyqAAEQWNfrEhbb",
		@"UkeyeQGYzfgfZagxG": @"IVboxiVqmZmylIIrUSeFtHYJFpIqaiqSymbjjUDHukdUoTiLVmFPVQVpMxBiBfKJLvsYOvnQwHuPLsALedTvXbKEWWiDbMzwNoSaJsaCTjojXOApagGKHAVbWwzvCZmbkzCrdNuiyFBkse",
		@"QncYadqiwEfEcUH": @"VUrpcCHrTAipBKDmKQPRLKPjjjOQvumFvJXywOnevXvnFkFcmCbIPQHFqClbPNdATNQZPtPBCkMIFVmHekgFLYZLbrSWpSbQFXICrhiPsJZEGSTIGGVuqcuQEslqnjegXktR",
		@"xlkGLDzwSGnoi": @"UmyNFbUUbdfPyHfxxcjKQAkenOcZQFnmelVEEWkthfVlskATZbHDJOGmfuDZMZkyFiYzYkcrDLkwfmxyZssZLsnFKyKqwqarjiwIxDrQvtoxTeiqvkXg",
		@"BxmKLEPsQDJx": @"YnmmoQBdyzkilsIyjXjxIdgfsoywtolUdpCjsYUxnxNXNqIfnRiGsIyfQhbfgYSITDgvNfmZErvUzyxFqXCVVWxAuqAVrjkfnyqwlhcmAhOMJKp",
		@"nfsMTmkXyOYziUWCGsG": @"MLPrgCaoMuSXLhMCIipFozgxWGFbLWpbvhOBsHfrVsgpXDLQjvfKmlzuefvYeprHwFBhxfIFaSbZJzFDuKTTwqoXpkznvjpkdawFtKWLmwiG",
		@"ZqQZxOeNcruHKxZT": @"lIYuTqjrFDduRHpTgHiqBbccjnDmjZccDxutTXvAbPYuliCGwvkAhQOOYNmtcrUlsmeFvbCsVBeSMYlnAvKbbbNANsfcFiaPlofTEmXAHO",
		@"XIFcMCghFDUCMlVQyNI": @"TVJBguuWnvbcphEMqHNbwbpRQwpIkuRNTuIEnuKrKRNyffJtqONhJpOUDqvmIRcXbIYaalUtAMmGcrmHILkNpZzBcdPLXusfsmHCLNUBuBQsm",
		@"oZXLXdpClS": @"KYPoTqkLOGEUXTmISHpmKkLaRaOlxgOxGEaaVfPQxOejcEvmfjPsdHSNkJbUsxSxWRfIYgsGsKejHMrUrtViLtnKMuAEglBFsoKWXCNw",
		@"JkruExxQTcj": @"pATIASkWTsHAdXIfRfSdgyDKOzoJkUKCOSitKLgEpJXEaBxeYXpzTYXcjXjlWvbNcNFEYMDrdJpvYthxBrXJcGekdWgzqGhTLDxRPrjIiIAkWHuyHxbqYVVGYrNgghCg",
		@"irQRVIZLIORl": @"QnYFRSTNDqhNxsyjfMlZQDHJZtyPWnDXmxQykpDKMnNfXUJlNfJmLVpbRGIhwGVWEtdsVBxuDkitVwfUFyIKoHAUXWrMVPmraSKYBp",
	};
	return ISUPZVRNAl;
}

- (nonnull NSDictionary *)LbJyOWtXVtTYf :(nonnull NSArray *)iYgaMxywamxczLJTt :(nonnull NSDictionary *)htMzkdsBXC {
	NSDictionary *wmUFDGtDOuCasJS = @{
		@"rqlVIejvMQUrgioiXV": @"nChnIonSOjALoidAKSPukWhTfQIunEQvbhRtNCJnHmeyoglpdJryBYyUDfJrkbMYxLcquRzMmueAkwgJNlrzhfNvIjWJzrlBNOfiOagaUkUhJHjUMJZgstjSDMyclIxmyCqhdSjlOhxTKFF",
		@"aoDlZLESXPy": @"yZaBvPJijlZziJDVvkJcVgqMtkahcDCgQGGlkdIHGdqfXVyhhwOgbNGqZcQVejOmyAIfZwhwzvXyLGdBwMFLjsTlzYdElUuvSqxZVGXsTBtlhHHmBKWKVnCQAWvsTWaivGnvfTLpdR",
		@"OJipErXlSQndRBl": @"ZWuxLvoOGYosmAsjOACznhunsZFYXpUosvGMEuJdtAhSwRdWJdOHOtsBlpmLdqYTYpKSfNvMugsYdlYHjZGRMqGipMYjRstxrvIuhBSrUSEKWkhdjOzcURP",
		@"kVvnIxWTkWM": @"HAARbqnLECKuPAzMcvzijGKWyLqFLHpryORXJREgKyYUoffIsVIgfneDITioEyvIWAOKCdMxvRUFnhefbvzMVAYhCaeuOjjzwSbLRIMmsdKkUuvZuKhEOuBHxBpsboMkjyiCMjpuuXRARLwYIR",
		@"WTsFHQzcDGUZfPMeBo": @"NuglQzIMDTnHvLJjWUSjOhWubuoPUNqhuyqonrBUHxzHyhesFtkHqWeTVAtDvscRLbrHpvbPBMtMuPLXBrtNDlxfvIlBxuQzvgkBCiOqDjODfDRkJFMmBkAlFdMPqEvHXrvAoWKlpoqrBM",
		@"JiEolRuMiFWi": @"jhjgSqmxTTPNazvfEjyHgCNPLmpGPGApIjSpTEcdRxWrGuxRLjjFrzwZOjzMgAZDKBfsNUKWcfVbiNYebruTSBoifgnJbRpECAAbjMcTAhOrnTPnVMBtJahCFOvPrRlJkAfCs",
		@"jvqDtYJczc": @"DbzkCmeuaZVmyDrZbUdePsCeukBAOsGJyprRZwJdtHVYrzbkfembSCxrPQHSTbrhiaxGkYxnCQvWIvQVPCFyRICnbZwTpyKdxEypjiw",
		@"GGTxjdgNvnMnzsXn": @"KTBzIhIVOfjMCuvYzcMmBlgzvRBSqPAYxxoTImPcRsXOgbqOEfsbDnmYqXGAVZCpjNPbiEnDHcvyocpPHtiijDNnbsTthppgLZetkdgqOAxgxMetlNnQFChEpgOJmIgXwd",
		@"FociDrZpwkiqSYSg": @"HlcamGHFJdLvuRVqYxmsAedmXAjGFTMIYWvfPhBfvKHzMDtyahohlTRQgEXqWMqCroLvvOEPnCmBTGhaDxOvhQBmeEmTvbHFExlcUBCPShyEUVQhYKDIeOFPWbCxWdOJoYDM",
		@"pGdFdMkrktR": @"cOyugMxgeDOCLmgvsjuOjStYzPLywtWokYCevHuBEaNLWdTVpCxIvbfdPJAPBacdCjKKahYpGQgtOMDdqnWiVeTCrcvNnVxYZVrHBAQxNFOvZBRsMiNJIpUSMtEFF",
	};
	return wmUFDGtDOuCasJS;
}

- (nonnull NSDictionary *)fAGMgjihIISU :(nonnull UIImage *)ZkoBoOojeUuhbMHugZ {
	NSDictionary *HYPNqpdKKFx = @{
		@"gKSMJajvuQzkT": @"TuyLjimWcFfhtpLQzAZvTpBiNoXTXuPNQboiOnYylNRkAUEnDQUJGRizeHMoCDWZPMljVpfPWPIxkyKtjGpqZnbBFlxNWHrQBinoPymcTFUBykZudSFwWpIwQ",
		@"dUefLYakWZxMgshOcUh": @"RxXSUeMPDfxxJTdfltwQWWVLphPoGDewjoPXNwzVaUdqTjuuvRlaErsRjECHcPZlfhaEAuPACMnSSCFdBNZljshCgVsQRGuaCaYUGbIUxseZfwcDvwwze",
		@"UYmZiINMqrvMjSgDHLX": @"EZcjKxJZqpRuZriIiRrPxaSRRWBbPQCrGCRFPdAWpyJgurCFLjfDAXyvDfpLNYReIixkuhMBzjgrBixVXNrjibTMhNkbHabBQBbeddysdMWQlTfghoLUlZzWPXrNOGKtqoSDlcpGaNUaEwYgdFF",
		@"BNEgPRFKPuyGNc": @"BhriDhUYcWeaslGtEbVwuGTZWDKHLiNAmTkbKEeGmshtkTkRcGlBMTIaQFgZKIcAbIIpybddlJUgPtKZtlvxgFyhpbaETpsiVthvFlXjtxfNfbVOtcQqptHHdxgiJXBdz",
		@"qxQjzPExYboG": @"lnwERvdmtMmqiSvnkhfAdtyBPZcrJMPIwcXIcRKasSgbYswwbdarCRBhyldBhWozSVlrTtBovVVEoBTbJWhZahKOCmyINKgDyTyVmlmMZYbDlgd",
		@"HxHnfoOszRnfQvMl": @"qBRsSdUeGsdhVnDAJtZpyFylGGyjUjmFMxJaIDyJlXxDFEZVyiXNOYcxtLUxJNogtKUrrLYHYpARAQrnTTbLZTmmvodWEkKiBJnjntJJqJjHc",
		@"oCCATgYgwRKVL": @"xmeghnAuHqZtRXAQsziIyhCBdPerauudHhkSMskEDmFGpuThtYKgpTMGLVnWuEIpXtPohoHnQLYEpAHlOGwlOtKGTgMdrtWZeftCukbqgYmMIfwxSRpEqIRKAIed",
		@"NNXeOBgtEQylTW": @"EMZcFMjlqAmIfmjMYPqnLTUftyuniLhDQSNuhGiGTIayMvFbtddqUVRmIvHnJoFLjzeCTAvScVYhaseKSufpKuHLeBNpgnnQCwHpYfohhMTDDLM",
		@"aRsvcgQtEThLQlvM": @"uaKptGSvvMtegVselsDcktOJaoYPprcuUpsWrJzAlhaquauFNzxBQyvLfzyjkNyZpWkEOGSBzudQGyKukCLHIeHarrigLVenXCZIKUn",
		@"tRQqCVnylGvcPXG": @"VeZxzCelaQiexWaBpNrPlVlxkJNxcczCRkgMreWjAcuzJYknPHRrOumcIrFiHTvWOPlBZYRYgTSIGiukwPvBzMZziswoJuGhMASdvQln",
		@"wsIfeQjnCPQOJxv": @"StiWhbPvHmcFRmSBxbxKzvMkTIeTjqJLIhPzBkPkLpCnNAQGxYaoDRuinXNJLicZDYkfUVipQFIHdtMXCanbwKFMyXyStdVxPyYFdcincvzLFGKiELZKqNfKMLFGGBvMtXCYLaPf",
		@"MAkPWZDOYBANXOtp": @"vehuLwkrXvmdqZsJoDTbkbLAjUEQUWVbombbsTciLYgFpArnKLspkobGXBWbaPjpiJmMNItjhkJrTSuClvzRncLooxKdrCKyKQNEAYXvezNLyYUUJ",
		@"mMGkNVrIij": @"DoyVMrxzOYhWLHjBWSQERJJIErENHZybhhvYoTRQvijHQcRuzOnuPCypYFiinpPAWLYMpPmqMhftEYbbJcWvBTEAiHHQAZVyMFtQiuOhiaHTcSomKMQ",
	};
	return HYPNqpdKKFx;
}

- (nonnull NSDictionary *)SorpiLtlNymN :(nonnull NSDictionary *)mijSQwYJaNEQIMZuj {
	NSDictionary *dYsCOpjiDAbX = @{
		@"dPLUVtFwhRm": @"CrimKmEhDKjTUhEBYlAgbxCSOerrggYHwYabAPayZpeYpYgIEvOctsTigLXnHGBUzFzjtKYQBXHokumZrSafcfSQiqkGueIUgqURLDZbKgvPDcxjljcOM",
		@"uAzkPcYYitB": @"rvnWCftdKxQHEtLPIdrCHwfbPcQDOjTdBAcCCQmNCvGYQKIHAdEJJZiezPqRoYiwUHTTTwQIZExBvzaRDoUtfidwWuzfRdDfRfHiBLiTmvnsmNWfBwgo",
		@"fBXkknTSMjhirNf": @"IjPbiTEWwKgUgpOLAHneQQuLPfwVLoDLNSZuzoeAxHKxjXPKRkBQCYEctFeeUnxfPTLORrZqSfIWfWqWKsluVuLawAKnmgBiHIzHDeUoKbqOWLyXXai",
		@"WTFGYiJAYSPnPdxQ": @"JFlhveNFxovKSPEIgRznGYoVarOtunZzIMmeVVNmDBznPUJpMKfQnXTThblTXnOhuosEEEJFQCiAZskxMfJXqiGtMkZAQxFXKzOcuWVQuErIYaSnfSmmPctorKKUr",
		@"bwRquPdBfAGOhKzG": @"uHvmHbPqQoGIqTnaSzAymNtucQePJeceJYcyqIIqGJJzUgITQWgVPTgJRBHzohrWFjdqoCMaPjiUizLFOLcjIsQzYfsUjWqUtvbLHAaWYcFzWyRFyvwIKdDZQUVVAussuNIjtxGsSltKu",
		@"dYTOnuamXTvgNOoeTC": @"tldbowOJmdUvKznnhepJKfoCRZAbftYsmmhahHFntzhOomcgbfklfXBoMNqAaSfcUzsnZxxuttFHyJuezpnmMagoxWADDyIfyMhFIuEPIvVuPLOSPSLFyxtDgvUayT",
		@"PoEgGPYZcv": @"sDvfsxtXzZdmEhJoIrOPJuCnoYxTVzYoPFtcvwNjUpVuystqTHSwkhPfLlOEBEFHiktiZQIHJQGGlXygEobWggPQuibUGTdOzLbGbCXolzsAibkbKGAPOuV",
		@"nnNfhldBnwcYwJPXBi": @"cvYPLwjXrCYXoLYSzmXdofQbPeXNBUrghOzeVlNTbocVTgHcjmoCHpmbVfFzErYgJGrcgCayiTqdddojDAbxhdsWHiCJylrFSsdzpMiqMeNQqcpCTsGaQbgYewFVUzyeUaxhdpZgdcYgN",
		@"KuLEKnRuCs": @"VzydvBYYpnnMMyaRpQzRBlKUNvoQLkZqXJYukYuCIhFWsxJnomGkYDHbhLaayYmujyrZoigaDbvTGwhbsQFvzaQmYBYhWmEirSrPcIQfPARKMDOQuKHJNo",
		@"RPcfdLYSFVaJ": @"iVADArJbgzluIlmHTngdhgTjsuliBGmZwKMhULOXfZrBiWjHEJKKxuvxDpgSmZewPRmHuRXBVqRdGbmmayNaENssCUhcCIXJTinKPwnLLNlrWBvXpjhkThkdAzXhKlULXXXXIDR",
		@"MMzgQDmUmUV": @"gQTTXaByLotzhXKnuWCLFTtjUjvWDFKDXTcsGOrrpcPOrXGmjMlUhYKwSQIcEDdwswRGWkrVFUfIEIoqHlnBEyHtzzkZsUgGFHRkFoXoojpXGSVIFoIwKdCKyfxlLHELfcPWirE",
		@"POYFFbOyYeZZPvl": @"EIDJThnaUZjgHFjPyFXkRouusgoAbhndlaMTkeVAMcDPlwLnjeQWVWPTdpZQOvHreoOkEXZQXxuMnAUdqxpmfMZXCLGMpPoPrinwiYKqPelgZRpwEkzoXXJonsEasNJgM",
		@"PzBhJmlvgLC": @"kLdliSaoDcARCtMgEIhgITaiIBdaVoBeLuBkJnaDEownCDYIgVsbnGOClPODjjXDFuTrflEgXHMGIyLmIbQVUwTiXhOdHcOHMaljmiEPrumkjmbrtcDtrRvJare",
		@"hmSthAeuARkfrd": @"PaVBfwwnrucMDnFUVmEoRMWMTPshYFadIdIhUPBffGenWAIpgtoFziuSROeuNMIcTQhbxKdeziosjpusZVLSuJbdhUgQSVJikCmXcxIlUTjXWbzqcLMXHNzutzkZmoWnbABWlBiwLDZCi",
		@"ddxjZdVQVwCBKf": @"bsVnuBjFRwsjdWmHmDcowSUtZcqBUFljCqKwJuoQriThSlxqQFvAqZTafkLETpfRCGeUysLpgQGWAxAujzcjvrShbUirryuIHMjwtgciJubM",
		@"glbPkJPdMcJU": @"kZWyCeqqcNfUbjnljCPGAFOidrhCePZOXAWstNzkGRyWKUAOAbfpvQlFRltRSZEMJyIAEMdaxRKvgXctDbTVSFZKmLHBCCnezuODlaTnDeyMBuGwNmAJUctHWZJYNHIroFT",
		@"EVjiUVVMYPprfFtV": @"KGkbBOQlBsjJyDOgxXxEQSRgDGyAUJwbBWHuslxtcGmEzILdPHBakInUmQDHdgRQbbnKtGyQciflHGcVLxoPCkblZoNlihfmMSNeTuwqQWrzaPMwZsUPpVzXL",
		@"EynaHVmGWyZPr": @"YPoHlhzfbqmmAfDmcKOcaMYxZruUqUzzpmJEbgXHZCFlFqfmyNkUolOJYASkrheAmrLFkNQuFdHSayEOTTExfGrtCeaxOiGehVLnF",
		@"quGOCbmvuLmic": @"EOYhXMvsTWtLDHzUSPmUXzjQzAsueWFXwLPZnztXnjLMZszZshVxHiLWqfLUjPUanvwacQXutlGXxexoMaovHXeOIgQjtCbofuTbzedvWgAoQgAUgTripvejoZGF",
	};
	return dYsCOpjiDAbX;
}

- (nonnull NSDictionary *)AndojEOYvSfTlVl :(nonnull NSArray *)QkYgLyRgulTYe :(nonnull UIImage *)CRQEiYyDBSYRuKcDZG :(nonnull NSArray *)QEhcnMMUcbiu {
	NSDictionary *DwomXMmmgqsn = @{
		@"farZoZuzECYlB": @"EeXGNMYlwEzkjOibcLzXFVnLwBEfYQIZWwSzyObAYElKzwGUdsvYWNnBoIWHiUJnTsxExxyKMURpqDavwaXGRrnnWppcxUnifKmoyWnjonsF",
		@"dlLwXwdjvYvujqDLDjX": @"hxgVrwzSxDKnYqiuKHWprCsgwrBLAgmsdymzmDsdFAVjFKwRfoVcMCQjXHFPjGWCYtfNwyaKZbjkPdRijuhLhtNLZuRxpNzCEHkwpd",
		@"MJiUnYshJajaMzP": @"hRouNunxBMbPTLNNyWSDnTgTYTUpYKxOimhVJyQNuNvfiPxyQpjkVkYwVDXGKfmQGdDGWcWCsRlQpAFYpwgCKhAguPVAdWUGAtckiwgJKXTWhvoHBCydLbOQprEoCIQJUAwLbQ",
		@"npsfjcTUcW": @"oNZrxcNAfADifLGFwKfvVRrZGNUWtTMxuhklkUXZwZIhSUUsmrnjUfPKuAKIocEGYlQXalyfawffGBVaalCvBbGhKnUJbaKZwNlUSibvcuLWmyZOmXbLbmNZxvaXTJcwPvAyvFXOkWJlbUnBOfYv",
		@"fNYfCSXqkE": @"sqnLwlkQlVAvfznLptsrdguynFUbRIuJTYwSVTVowAiGjQEwvgmlONGhTLnPBAyDFGpTMbgdEDMkHpezESMfjoldJqUUczTmyRFJEXyibppxjovSLUTW",
		@"tsQnCJqQrTHLmKbTEIM": @"ANroBHLMyePnDiaKorTxGSFSrBwLkHLsjhPrBLMvbyCZUtSjKnuXSofuFmBKUEnrvrOzusHmdJJpaZUMEbjqbWogVIzsTJlJJmfSMLjvLbyJmizjYrMnZj",
		@"kiMCTZwiLCERXMeBuFP": @"dAmgDlkiZnOQeIcNIGFEEvgWTfPmSEBTCToPbTrCGGCiArspcKjqoanWBZKJylLhJwoDBejGaazrQSTrugkmyeeEpGgcsWUaLedeFGdBT",
		@"TEvQFlUahEvprEMIMZX": @"ebFbueqXmcBldDNWGIYBBZPJLwhhavsbWFrDTyxdnbDUFSXxRpSdIsNNFKiTNKBMIRwReoKmHXuddPoLgQXBjqknCJoLQbMPzXGyexrpTzWDCwHSPZibdAlaSpFFJkWpbMePsMGSg",
		@"VeUVIgaXXwDaUVk": @"zjHMnDiQplCMMbpjborzSsVwSkKNZKglaEuAcfHSkYuXklNAHYWXfkXKJOnynLLeKkijxItmDOAHJlqqMGxdUORqsdyxRjhCdUoNbRHJMntdJSsyiLGpHfPs",
		@"kZwKMJYVEiHGfFO": @"bGGplocTBBxoDGeGblkUSbCFZggXHVWTqAHXdrOiEUnfTFfTSUSTsNmtkTRZWpNblsIeUqfZUOnBmsebfIKFHKGxSTdjbSFjmWGYahSIRucgVtOQNHBnvFZErGZ",
		@"PuNdLlseZZNwxOvtON": @"YUDuwdKhaYQSGsIEUdfYuLFTJJCuvZwctKRENjOPuNsUpaaKkHNyqRbaTcfDISRHkSiftPlNvqeAwkDzTkfEbhCyHWNKcsTIbZWrpWxzaxyWogQmvQfOexyAeegoKZDqYtOUPRaq",
		@"ioMrUnKOEB": @"ZdyhtEQqfjZBQqzScgTlCbMSoYbhOHRvLNhEVwklAJCQjsUNkeiVPdfRuGlEyZzdCMsxGWBphYcTTndKEmymgExgXPMGxUGnGPytRlptutmMOpfJOjZEwYNkqzykXETQOBAXWtDZQwQbHVxDP",
		@"ihdvOayFdOGuRo": @"FueHNZNWdBkoJxCjxxLQqDnwKveQLwfCxANswxiSpbdhRboxwOAkcUgbpyckBTsBeeYBpHdgCwAPNQXkzUhYVsqOKHXNJkQPwqSs",
		@"mzMQGaukscqaKT": @"rebCdUhClYleZpLPXJanLowXTGIAiYIHyxxmpWhYRzlplbNiJoeaQRIdCVFaHKcyQvTbjtvCHpwRJsItZJtbVyjrdAbPBjUKQhYMzDjtYRcCFaCCHI",
	};
	return DwomXMmmgqsn;
}

- (nonnull UIImage *)UxPcBlrVcNOFNf :(nonnull UIImage *)UEZdfKsnKKTYmP :(nonnull NSString *)pxAKxhcUHYmcelHNb :(nonnull NSData *)qjAQFNhkczaMcdJ {
	NSData *RioJgqygJnECpmn = [@"zAIARPetQijjxBQDEZkoERpMZqBejPIMmIYBkqPzFRpsfXWfuyoKGplalGAZKIGFqROVDSenefYsoRNMMzharOHxdsCaMlwrfdCgdKllzaSIPfQyOZacZJyaocydFoNsRdkqKzOtjET" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GZzPsUaySa = [UIImage imageWithData:RioJgqygJnECpmn];
	GZzPsUaySa = [UIImage imageNamed:@"UQQUYxuCLsIfdEYXTgXZTTwaWjdzZaYNUVqKMgDBdvCVptKupvaGDlcMrPNDlUnBxvWseOeELTQxwhBnROPwrKJVorBYqEEiPywRlvAMwEVIttxAjRLSluApLubYUGjrhqgCNxcklrRLOU"];
	return GZzPsUaySa;
}

- (nonnull NSArray *)hclTFbxHYKYgzx :(nonnull NSString *)xUnQxiPnSpMWjBRlh {
	NSArray *KblTNjakOEHtkKtxB = @[
		@"sPuFLBYabBgJktDolLVMQBnylaMuMjyPLumjmMrQPdoIjuQfrFrvYSKcTosLOYwJAerdmiIrHxeNwEvuFHvTScyRvVWMpQiPNCwqmXJbJmJdTiaxCMYMe",
		@"lRWolguNDgJnqTQkNPqnVFIcTtEtqxueXJyAopYcGUjAsUGVAhXraUjunviPfzAeEEIPFlMMJWVDTUMCtSxACqYsILFTReDZuirbWlyNuKBAgDmGiLCXeDekGmqwXQwTnkuOLoILmyHn",
		@"GndAMZSEbZGNfNnmqjcyCWRkxCldtvtyuSsPYQZSWFdOHVgCEDaXavLdqqLYjUOYedYsnxVGeyzPXLgIeWAvvifWgJTwFCuzeXUayIUEBfjkoxjMFObpvY",
		@"BUkFoJmqmEdMFCPyGWDKxjefuSVZVlIDMdVfULmGPDjogQGhXWZbDVzXGfeEfjoJKsusNRrFMGsvaEFEFCsINiKAOFVsaSreiCezyyZEqpRxyMGozzTfRMUAJyunLeUtcwPjthKTk",
		@"gzuTovnIcvCVbQVINtRzOCTJEusjblOtMIGsQPrzhzsinGCaDEyfpznsnlvuiorRWprVrhfUMmybeBtxHVUhLoqLAsfIdrWeTGQezhUkmAfLzRXDDXumkUcyAQU",
		@"jZTEHRQIYOaCSfdPEiVqqxXMhfsiJnszSHxnJvOjXRtBszZUesAJrfRNxxcjMAVeNZBlgSFgcCmnajQsdpcJNhtQQKVWmNDwKwcATvuJfVDxLgDvrceFwzMibukXPcYohjfFWZKhR",
		@"mBGqOGwtDEbReCRLxtKIjSgQvcWaycVYxHtFzdpttYZOuJKqTNpgQCJIrTrBaWGxjRXfGSwahFqvJdBeXKreSgBQWXpbzPbUkcHvaSlvRCLeWgEBiGBKCiJsakhliJGbQwx",
		@"xPteMECwWDmvEMfoTYCpaAqMSxdUNusGscCGmmLsXGhotknvMsqYyiqBZCVrqZRbpuLPGFlQfFxyitInhweKTYRiOthSGfDRTgjUzEFNkTDKnyLqBhvaAT",
		@"OThlfpQNExIzTEaKjFgBjYJaJwlSkpNFEUFIEhOhWdwWCGmVozwcEJqlzxbGdMyBKFNJpiBvFmsgdtarEtTvYARNYgYZvkiXuGstVTmEcoYJWYJUpCwWYrjzQuLLLhjQVMCRKKVrDgIwktJYNkEz",
		@"irkhdePOMmcYWVZVwpiksHVrKPIGkAnTjPHRWEAkISxXdJmsnjJeAugSjauRDzwFqDxDBIxRwQaVtjQNRAqXBEkyBEZeFSRZgJvIbOtDIbSbOLIXbjpLLuwS",
		@"ncPJIERBcQHANarMdRjjaTsTKZAdMgsiodbyHdpCZijGdokxqQFLjIKoUQJHXkKBWXGGrFetZKTGdHkjIjYdeWEgDMEMgRkcUFLKJkbaOJhuIB",
		@"bDnHHwTzzcBtCldAlKoYYCUwcCUtBFJNwQPxYfbYuzOtySOrpMILBNbCiZsivVEPCovrATYTCykwZhSGvkWrUGqahvIAcyCWLZSspZYusgEPezEryqsFRlSbVMaFqfGDeYRvPienrhrZuTeC",
		@"zsCjnhnuqwNgLrhtEqxIotqvRJeVJzfeSPJruCffhrAvEJzLyMPaBaWBwqhSjmUqrxsKLyMtmDcQriCuXFQmrRyWSGWWSQtlczVwwwfOjgFrzcAfjovxBVRbpvLfwWLUFrflILpiD",
		@"HRuhTgprpiRiYqjRGctqnjtyGHsUDCuEnlSLZOYUeimznTCqGJNtxPqUvOMlYpBURRcpxldOIDlXfsChrWkziYoKMtDnVicZdDtkNFTyk",
		@"EcSLFREpftIQJksATvLrbOyeHxoWRIIvZSPopMdMdESZvqGYrEqKexoqPguXmzubIkMypKYCHGrvBwrvLOvsRVndPPMvRWXHcIhUtTcQHY",
		@"GWMpWxjYhOZYsedNHIiwCbLsfSPmxHowMrPONVJlLViNjrrfGFuhwxnOouphnnupdlUzmIXkcCdDtcWdGnsiIqiANfQjidbpcswhpQHfVyGTkLetkIZhzkDHhBpgJKwGBCQN",
		@"xncVuZLJLjbzeKOizTOWOUmGthlCisYJGSlptDRKqXlqUketaQjNTMeCWZjotGzcYNhZZslHuyJJUHlfKAnAdDUSfvgiAWkYiuBvBqPexNoYgdkRamPUXFD",
	];
	return KblTNjakOEHtkKtxB;
}

- (nonnull UIImage *)HwSCsJeuPuy :(nonnull NSDictionary *)ICCIIWpqmXVb {
	NSData *slVJVeihTOlcKW = [@"IJYuOFmMKnTNIAndXofkbWnasxSllzatcvjAUEjhfZHRyABBYfiZuDjwgYAEhwUbgXMXxNpCiszoZqKaitMPZBtxDKCnCrTfkWPoyHMCEIaDDRmfrwciYGXuzJbvzcngMImPAdG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vhyuoEGjrW = [UIImage imageWithData:slVJVeihTOlcKW];
	vhyuoEGjrW = [UIImage imageNamed:@"ZbqflmIqOyCGbYegrrOHHmwzNIQhJApFxFIFphixWCXzbDAYYCFsFtmIkIOorzeYFxzhhaYMVjlbxphiClEenJNZutNxhqYSJjbUIoS"];
	return vhyuoEGjrW;
}

+ (nonnull NSString *)hIFWZzwXZD :(nonnull UIImage *)eoABYDzTrnZcufAS {
	NSString *eSNuieTSuxOJUzEdEA = @"DQUEOGcOMrDJbmSUiTocRHiCMXqrigeOIdAEcWLRtBxANhBqVgtFBNgOENUBMMiHShSmXzGPMwUkPHSouZzDebwAFEPlwOpeelmtLAaOh";
	return eSNuieTSuxOJUzEdEA;
}

+ (nonnull NSArray *)qpPscCMXxISir :(nonnull NSString *)yNOrtTIYFPonk {
	NSArray *ikxMPkmymUJf = @[
		@"DNHsqfceJCUaLzOccqyBJbGuuktqdfZWQKzRfinkSoAaxRzVluLFIDojzjydvkMeuevYJBlVdYpLnrVBEBDwIbxHaroiVAqIPmMvKLsoRknwhCUsCZgSJ",
		@"uxohUlYXcFgUaHTnfjlSUYCsXufuFngETOTkDEAoBfTjmipjOosEiXSIlESnNffuFTRZGOmNomAjIzIDuglTlatSTlhtJcwVKthZLzBVEQuXpUwlpCBtnYLozxJUTvnpI",
		@"DUtRHgkMAhPxQGdaFkgKbeDsszvoYtehZXSYyUvVRFxwrpoHvfMaxaCJrCDfBnAMfuXbMcejcQgYZcBpfgqAqhICVtvVRXvZRczWJnA",
		@"HqJhxzSOtQgDBdPXZCYqemhuXZDdGNNSvxneskbiqLXeGlBqgZsulLlWKanQVBoqzbAoYqIvhfJYrzTudNsRSQuDwJihEQquDuFzUXdrbBosmTchDoakuGnKikYKtzUxoo",
		@"ulTeKsNxrzLvdkWoNtHMEgPebbuGQWvDQNfSdjqzmkUQDLRkgBjzlhZaLWqeqcNvnnJuAhbOiXYqKSwWCIzkGBvlFDGXflucNmxBLzxwGKBSRLjGHHUIUzHWoMiGwkbQOAnXMGIFHYsQrZhwm",
		@"rvNtykOdwupsCOMYgufWkcjUxsJZJAGKLBQikFOENVMrwzixmIPNKMLtDESAxAePLkyTnGtigkeDstiXVttItbpUOgTNCTdrQSDTEsk",
		@"wmHGmlftewKgWKnUvmDhSxIkuBeEaAUTiGObpUsKDBUZQNwpaSfzabzhEhArwvVthLzsycyyFMEjOSxmAEDJMQktOtWwMiitPiAstLn",
		@"aXWExPpNqLgFJhChUJmhDDqpTvHRCcYAyzZwDqngDAQBNBHWjRdQZdckpCjXJyrfwFwEGoFXjPojMerqoQETXrLtIQjSyUWCQZIqYBJUGcMmODNZo",
		@"cJxxIFNtVThQitdfPMcngMIJiubEAowWNVGbgIzxrmuDfnJkvhJJDlYDABVegIOBNKDLAzoDyvxDutGUcKYBrxgsWtIzOfgcNgrSkqqdABOXSZEFKnWqHaDyHnPyAAiZaoMcu",
		@"WQrENePGDfpWhvEAkCAbUMWGbOMnHNidVaRhezblPLHbdXoXAAWjGuxUFDmKZNupZCmxFJgnvuGjUtQJmJfBOYvngCGjovxWnLsqDrwnCySWcvykhKOAJSnkZKoNoAuZInRvYhopru",
		@"dftxQSvOQhgFlQynasiZAVKJItxAModhboJXQDjjLQafGEXurKqKXMGhycxLfLNAXYFneBAdfwYroKBKiwzAujpBLktPewwiUbbKMLwCBqD",
		@"UrdktaCpDAXQMKEeAydWlbnIPZGrvfqqgrtGcoVdPhwUybjMMzZthKxJnPHzxbbOaLpxpmNaKIqFDhjVcvjQPmgcAHVCgzuIsLZjAFcvTGrgNmAjTtwxDUuZvEVtxYxPBgnlNQbtzAeftvcj",
		@"nKrhLTjvUeTnInWyEmuwJqsESLzNGnFbGCvbekxVKUiwPhbocNbOkpAecFwAVYJekSzJfYKmovIxvueBEUGdEGaotLlENGzNKPxoJuslTWkpQjoIFuPyDrvOHEwuRcNopZJJxXbPYhtIHJOxpX",
		@"caTEwPHzQTQIJqipFwbgDbcPcFafoJFQUfQpdciDQsjVdoAKxHRFfOaeVPUtkLhfpExmSksKgfQkNLThyhlMZJUZnDcPpOrKBIQKyQfbmyIDZlEqDXaRDxVWvZWoiZvhApkHvzXgBJrx",
	];
	return ikxMPkmymUJf;
}

- (nonnull NSString *)TUGZYiiclR :(nonnull NSData *)rslCSelgBSQW {
	NSString *yPZfOuhNAImD = @"AksPQUlBjRkMoNHLaOThFnMTIJajJRCoGddkHXRcsBhDbZJOdYcdLDWiLmYYMsWvYdYnxdLOygNPramGWJFZrmoiclGMoXnQcwgvLoONgAFSFxdXHYNRsUWcvXBzGL";
	return yPZfOuhNAImD;
}

+ (nonnull NSString *)FBxScpBznpFnJE :(nonnull NSData *)wuWVKZtZUmWtOQICB {
	NSString *SZJagGOIdyUVgERwU = @"fOIbVWWYAEOsycdUSzPKfJjooLqDfxqyOzNBpNOJVVEzaSAoTTeOULEjFWnQgLAOnpaFPsBUrKtfIQDlDasgfgTGfflpMxGTURkFCjoXznsIPspDeIvzGbHZILbhiaAsLCuejUodou";
	return SZJagGOIdyUVgERwU;
}

+ (nonnull NSDictionary *)dTRGXzQXlcuWXxabY :(nonnull NSString *)HmslnnJdFp :(nonnull UIImage *)eufJHUekiVnxMqyBU :(nonnull UIImage *)KUELpACKGNloDGZzz {
	NSDictionary *RijBWoSXERFjrqi = @{
		@"opiBAwAVqiykEaNYH": @"YDiDmyiMwxtWjbICfPeaQhYRBVgJUTQQFOlgCGUdsyJtpTmeMhHITedlgoitomBVEEOpHYLuhQveauZxsYarXHEczMDkULCCuhTKttNJmJpEHWfZFZqLSMETfrVVVBpWnfKUpZAqAVDTVBiasG",
		@"VyyTKLgobra": @"aHEyMfGQShIduaLshYMqpgjblchCHchVhixzsAIjiiPrtDgiGXSbbmelnmcAiZFnZhDEpLQLKOCQnXeIwshclQkqFeOGPRpBhoUhyPMBIIrJkLnNr",
		@"tvWAhIkRyMwzYCWH": @"ewPbnumnYSyRaFPNjjlEeuWJhTsdwSWkvnVQSrmSpZElmsGpvUyssJDZeBHMKELjmYTwHjfrQFEzqjJzBHNYEucqgkadaGlXyEwiSGJvysYc",
		@"PhjBgrdZFHw": @"UVsNzNTLGGkeQydJXwhgJzQCLcgluLGQWqaZGGhltCegzIVglPbglwIkUcpLYuIIfVlgZXheDCljoKXUajXpdLNTToMrPxqaAyACFsDwSuqsPTaMNZQDejzJMQrMKpMvS",
		@"iEBNWBnDiUXx": @"YaRjlaihokSEsBzCHfEyDTFSHJPiyjgibMgTwkuYWhgNkICjhEJwuxocoNrMqyDNZoYVcMIKtmYZARCgeogvcJGkoUSjUgHfUyhzAZZTFAvURyMKFaQbYxQlaKCUeyM",
		@"GzcnAPSILdAwNYC": @"dBTlkogGdXWgHNvcbKCUKvBxMrpZAvPHPEgkFLZovzMnFHqUHfAbvpkbuhtbJQGOBYzHzyOuCICTKZCRwGNaqnYktKbkMiYQFIDVqkPKSMlzQLvRONBtGUcpUvKlNKTn",
		@"vWTFFIJLGNOJjtQO": @"xJHKvPyEgfWIVxbFduvuaxWtCXhEiSkhfrRvvkMQjfgJOImVuXAbbUAVWfSXhtWHNzBQFBeQetEEyJCWhMFqgQmJfiGZrmBBwHgxAHIUKxNsek",
		@"VioMYFjphsu": @"yuSgKWccvEZaYsUvKiyjMfCAkKJENmDvzmcTnBMnxyonynhZcFaojIgzdOVKuYNtsprbwGlyklxMcUmJoKdlicbVhTTiDXYaxCRQbgytCCeotRyzqSvOSWvNIfxWZXACmRMsAOClQCntQhedophV",
		@"txBKPbZOzqHkZRqOANL": @"ttOkfzQrIthzqHYaXGgFhUxnOsfeCEKAyAiYZyVbfIQyOMrQqBnajyNnWHUJEOPRrcjoYbrfQfJsAZXhBnfkYfmhlLkSuihlMCMbZyjGKpaZCNJaDZsAkWMxXLajJt",
		@"uJyrLbbvlJIOvcA": @"iJmaOJlHJiFjtProoOOPYgiXOcNeRBWgzHsUwkEXmxMqtVgxquIeiHvYjxueYTxHdunYTNTNJfliUyeLkJOyFVUJUQKxMBZPllUsKmxAusXcdTmsnBhbRWOYxceU",
		@"qikKRqZBWUwJz": @"SroXpWUVGSJZKVumMECMXCNPfnDEYsNRkblBURwtcfiUKWaphONQfnCUNGfyFDjbpxxqcqMGUWXuzPWtdNaWvGdyBpMKDzRpwNqX",
		@"uFkdlytDkngU": @"MCtRiyGTHThXpjFKqmnSVMJQarngXlczyFfCsOfOBrBrenxBPNOrTAakaYjPSEgQenARpIWeaWURKcqSHeDlGCbKThIHUjDTdiQrnVQqlyrGuBmaYdxEfpevnkjkYmAiPdHdGjTjJPIcskJ",
		@"papJXXyPEqwHmQbSgMf": @"iSHJnlSrdPDrMsLjPReHLLGXqNctvTSILKDKWutouNqEmoKhLOHzpQMcIjNwaStSiuYIMmDAMBdjLfzJrMJEpuTzVaCCUkvMwFFHFyLntzypbtzmwxOPKuSdnDD",
		@"dlftwuaGRHR": @"YtJMdZUcjBIVxYXEJeBgwpXVcNnxvSTRJefFTyGqCynZzzvlvlMpOFAunVEHGnypwFPyhpeMgiSoolRTVqBzYJkTckyrJeWXUMYGvtZsnaFfRXePpyQVVcpEuQsUWcTXOMDKCgNxkUlstsUtJmjdN",
		@"mubOGuDFxO": @"vIGaiXQHZtjurKCGJAVQPflSZrMtuuZnasGuzjuQFSzMNyqgBWwfGKKUxkHtbfkCUSvCovoPEqIreQdkiXaFTwwgwgBgvnejSbsKHcxaWKtUSimf",
		@"MQxsYAoiISJZv": @"BrstHLObVLRntZaxAvrpEZRAQoIDcVIaebcJtifdUEJvaNhEIcdtXdMboLKXODubbgSGAasPOTAhWXCbOoDvRelUSoxGOSdAffRDAwMwzrKQGbUDraD",
	};
	return RijBWoSXERFjrqi;
}

+ (nonnull UIImage *)jnHEtfOtWkXBzhhw :(nonnull NSArray *)nxbYVLSVjgWwFVeW {
	NSData *MJZfpQGMueJ = [@"msEyGfrYUFHUeZsGFzZylQWxfleAuwbGAPGCmrzgjCSsvVTWQDqrIavnPbsCorznxLUIdiochoPowmGrjrVBxmKpJZzwgomokTdxiOizYKVlHdocbBksAcZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HXHXFJcTLuNPuBXEkwx = [UIImage imageWithData:MJZfpQGMueJ];
	HXHXFJcTLuNPuBXEkwx = [UIImage imageNamed:@"WihamosJTiIcAHqSpZcLwvMDQTcQcSNdQRAkgidydLxnIDZZTpHauBHcbGnxuMFEzyxufMYfokBRnbVnoWOfDOMfQmACpOAcCoPYrlqxZKvCFPMszdVNzFurUXs"];
	return HXHXFJcTLuNPuBXEkwx;
}

- (nonnull NSDictionary *)AkbFweMKEXsT :(nonnull NSString *)eaUVVGEbXmpIHNMzV {
	NSDictionary *TdcCYJYzgPuywCpNgI = @{
		@"emEbkLSIGhxit": @"RxXtXquDoQtXJNKvRLvxbefwCaThOlJxkttGYQPVKDXHPfNFBSRXQMrbIwJvrehCQDKLZhgylXUIHIWYraPRCZsnpCBemygTKgakJQGhStpGAEKHbTORiGZGDDWOpbbTgPXzLUxbFFSq",
		@"sUqILJhBNhucPWOCK": @"JRkvyfLlwQpTPhvaiLqLPxJpGPtNjmhmwfJMAzQTAFNjHJjxkOnybvniyVTOxUqYPqgsPpgHFOqZYnwiDLwxvqNochMguSXaUYecmRbgWCdnnqNMKkkPjnNTgwWOnaLopdwDdDLTuwkNmQwP",
		@"ymMJsxLYEEFGBKoRF": @"ZTFHIUcdPuyPXpDVSTdYAuJgTdqqfyzugsMULxTeCWpsgsnwuwKhemaISSYymwDAnotVCFYqEbGlonEGKaIZXQsFdithcrQUtpbfYZkWXEaHAHfTeJXyyKnvGxPbdNvrcusJ",
		@"LQrmwoVNuwgtifUpXv": @"gDtrHUFdKfsHeKAgyPdnngQykobTpeMUPURIqRMrHARYYleFzThMSbikNHDOBncoSWnoPYeKyZBNxksKFkbbeADanALYXQenDUefjJSSiqBTUWtYQQlpoFqLwcSANcuCur",
		@"cIUqOPvtbKcw": @"mqwQIiEepzyfRUbCtbuRxkFTtrsSNakfhDcRRAkEkjvErfsvFGPNuGlMTFWCKckVZRVoKsVPtWIxkkQSUovaFABKSSPwYxxfLLRdCdkSefzVdkfcpCuUECNDscbYyPCMBMT",
		@"GsRZxqzfvnT": @"EdRvIvCKkzcVhkIyJppfkZYUhYLMCCWeJNTgGADonyzSgiTSURrMZmCQJNgbQESvHHaAtjPgdpiAVtRsZIMXWLucEIEcKfRoYOdMgJGDvOFywWLAuXbcaYttRPbHnihievi",
		@"LXMOfxIjxYb": @"ztKjJTXAzLeAhhrlpyAlRaWcMqNsWBGnqhOPYHojMdSDxyaniodTyzFOXrUHIIyjrjzfeonVWRhfYecwmewkcSbxfZJROsWVElTtzgYoKusQCScxyzHWITHoyaRhYnoCubIKEcyBEhzrVeYGJ",
		@"AGlwKFQIDfNdoEijj": @"PhtENGQxUeAtZQzjcjxrRmBfOaASFvYcGsyNKKGFmjBxrnDMtGacqrNRLtsLCOThrAuPZaKqZnTmXhyRXWncKpLQKjtWxYwbBOWlQYMSAFUSXHOvLeEotqVkWtHylbUsgLszQsD",
		@"PnJlZEwLrjEfp": @"OXPyjjNdsoNunoHEedAoXlaAnOSPQglwqytODXoHVDmnarYhNNieaodsDcywpSZhEJjiKlozSotqlnBJpWoNxkXIWFxQxfJohsiELumNBQoZUIbhxohjaeVaVDkKFfvtOp",
		@"rXNvDuZUaAIusFzeL": @"GCqyQTljNkOVDURHrcPEatZmSSHyiKzKSDrTelxsgjBIpUwLwXDdNBSgJaeNmDSToJXHYNkXHFMlQUVFdfIUGRsDrAICyVccMdeFUBjvUiuTDHu",
	};
	return TdcCYJYzgPuywCpNgI;
}

+ (nonnull NSDictionary *)ibRqjEHbmzuaMTrIWt :(nonnull NSArray *)ezvjQjEZRVux :(nonnull UIImage *)WCWgCtmdeplyGpS :(nonnull UIImage *)WgWNGBYLuMX {
	NSDictionary *wtOPivHoZinFB = @{
		@"zvQLiNnGzDjUs": @"tzeffVgfdTFuajPxIalanWojSzmxtqzGaaRLRoGbELzQwJeBGZwJouqCAaeXspqLpEprWLNdFMzMuddUMSXsagwvETbkanPMbEsgedyAtf",
		@"coDBaEPKkgYDxqYK": @"tyyxgnrMkFcrlfVWvkAuEBLvvEaBSNPLHOCtrXfhMQYfQjesTVFuwZeQhQiomRaGZMMXeSSXtSbTZjIsqNxJJryuuurcxipuKtMPPYZOhtzpIjMQVrValZJlyQWDgOAxEgcdShyLWpZipCFd",
		@"ruPTBTtMPtGaXxLx": @"ggLCVeOTgYVoWJDbLxluKQHpAFGxmbvyZKhbjJYtZUDSxtHhLxlrFGxMJjTQmHLznlmGTInJmwdcKdOflHGpaoufBBleticyTDoXlXVhCrJAeXVXBGXufJaVcrIXLINW",
		@"OjiitxHgnzmV": @"tcPyGvXMYuzOwjLUtDnemIpXxDmBXCGivhxvBBUVYntoXJPqhoOBfAmqFyYgTeQWNlQqTLOQCetjOdsfewcjermWputQqyTBftWiwvHRpLHqNhyX",
		@"jwOlrUKMurOWNZ": @"OdjioVviJmVTjiMJHTMsVUTlFCMMfYnqwvAgIFQqacSbDVOVSoCGKjqBLUkXYsSWWNMzzmjnTNihQpzFbXqdQRXkzZyoInJwawtADmbHEulNZUasJBVvbYF",
		@"gQmjLFQsLUuywB": @"dlUQIVCwDaUHDSHuONHyapHAXWnIGphWIkgyVioJRHJlVYxYOPkpDHqnqPICbMzheRNFbTbppuFavzVPgSFRPcJeAMLCtYZfBMnAuEvzLNdV",
		@"YdqwlGpIxH": @"BxxGIIxVkEIOYtKdgJUFkNYFyHunxCoTBqpCfsauYLpMjnukvVUbFNiPbXIdhoPmvwgZRgxHIEHRgrgIlMpcZhmamWIqhnAWuafTaOkVOukvXDpKZXSHhgyyPPsLxqLRSIQeNLJhyjMfr",
		@"prokbYuMDhVFQ": @"YggadecLnBhpGXUtmvyvlXCDtVLmXXfxWUDPPnkSciXxswCgWlBIlVgreLmuFjWmVBaXbykflEzlEFvvJMRLuNLEHuRRDWzvwmCMXUQNvrb",
		@"bjxuQpCHkQD": @"dXFVMYzyAdUeTbJQeKxvlUoynwWIraAulwtzYUQXNlcBXYYMgFSBWBxChhyJKKzdWoOGXgezTJkNycwjwuYKYzNHKisFzttLllbhd",
		@"OojTTCqnwuWEvLgrG": @"BZtURgijpVhHDYuaArdaCwPlGcAdAFiUgKoIdYbIQPgIfdtGwMtzmitFNmuSrzTktQsZjQpGpsxaGVHvCPrGneerInkPIKVYMYCngzzwyNZEHyRkiZUlfaWwEXWcjiSJBn",
		@"SmmfeBBhNGRHfaCSZj": @"AaEFlnzkaOozWjkjFGYSQUxTMROQOdEoeHdjMiDOKykctwkgNMIIfYrhBJJLylYabXVyRLDJlpbuxRlVGKxBYTGfUAZYNuAFCtWetzwj",
		@"MfkKCJsJLmfcMGu": @"cphZZmKtlpqFbjWrFDAEbASFqdktkToRWdpsuRjJrDAhtQJEFnkTJkxLriBzbUKfpYGQspZwvIxxQceJoyDUQCXLUsSysaeroUiPXLRQuDkfGMPecslByMRIwgCJuhVNocIet",
		@"jjxGAcmgeWUt": @"aFYDNTBxamxnzfWGkoxwMRXyCyNrryeBuwjwDEpQnsxvwpXMbXmcdEemdFfZmjHUQgUYyFfuwyYcmzVGphbgdBRCiVogxZfDHkDoPotzsm",
	};
	return wtOPivHoZinFB;
}

+ (nonnull NSData *)OnQQYBHdivzuIDF :(nonnull NSArray *)DqBqAwAUIpdLEL :(nonnull NSString *)OWWIsGNZebDGDcuE :(nonnull UIImage *)mYRDVqBamr {
	NSData *OPagKvLYXJTqgO = [@"xJeTgWxKvYJcXvfkwOjyzYKUDeHfRVwwAiNhkQoHxmnmwbVppoPpbfwAMzAcHfGqXuvtfQuzMrBEigfWDePzHCBOPOhciqaYQCRruISXsSJftZaMqfZioDqDRKqz" dataUsingEncoding:NSUTF8StringEncoding];
	return OPagKvLYXJTqgO;
}

- (nonnull UIImage *)fGPhKVDNYLoOns :(nonnull NSDictionary *)BeIfajBRUtFuAMdY :(nonnull NSDictionary *)MNphOMUPyAJryZMnC :(nonnull NSString *)wvGImCvxjAhIFkc {
	NSData *RHAtBCGyha = [@"LXpEsKtvAauorLaqKZUdkWKomSPEllVRKcytFLzBXxvOZtGEKtiHaMRKgQpCQprglFtqdQLhFaewUYLarfCFPFtJCCQORRyfapfRWpWuaNwlXzOCHQZKXWmNNKUyaxzDKUVBHpaWZpmRvPAescuL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FjleRrvjUlKdIZegLb = [UIImage imageWithData:RHAtBCGyha];
	FjleRrvjUlKdIZegLb = [UIImage imageNamed:@"NIEmwtqnMsiFVExFjKQTLFSDMtkmDsDvQbmXXPIrcexhnNRGWTZKfqquSfPaQOxtFxATySlPksdtFednLuHSrMBecvSmmqAEpqVyoLErdQapdvvfSwRkwGuSJjiLicIclfqbjknDKSqvueWbo"];
	return FjleRrvjUlKdIZegLb;
}

- (nonnull NSString *)HWUuGgiaOXGeH :(nonnull NSData *)jYDrSIEpMX :(nonnull NSDictionary *)gBjHnQFQHUSdOcKPj {
	NSString *gqNlfilxosz = @"FsZcxeEgFKraYRtpICzOTSnYxvbeQQXHceQXydfJKrGTAkXzoRAroXdaTnFgAngpiZszSDRKUBBkaDLEMUkwlpOxtntfNJzmgNLUEgCNMpdvGNqQcoOBmwuQKKkysNLnGoLpfPlLDylYGWJWX";
	return gqNlfilxosz;
}

+ (nonnull UIImage *)sOotqzHhPQJsYayHJQi :(nonnull UIImage *)xqxiajQHhA :(nonnull NSDictionary *)qRtuPmXmHxlmQ :(nonnull NSData *)pCBKbjztxYZ {
	NSData *SnMemnSsHYDEPDWfl = [@"bYCZyiHLaqJkUUbTymSkZmltNlLzAKYANeDFsnZoNeiIleYkcHUARPmHEMYKeuaZiVhBSnyZmvjCyInAFZpmDxxwQKTByEIpjKedOciotUKMZBzOXKlbUsIJiVmvTIgQdeBFVSKllKXJiNcquB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ahzyVXAriVvlzrk = [UIImage imageWithData:SnMemnSsHYDEPDWfl];
	ahzyVXAriVvlzrk = [UIImage imageNamed:@"kUaXLQMmHIdqDMlUVSGCDvKhjquzPFgzxmtfpNQCqhNCSHARfaVmvUEwxpezpNbMqMSkuaimxuaKATLaSLxVdszKqMjzyBSWnkCPCcQqiUpD"];
	return ahzyVXAriVvlzrk;
}

- (nonnull UIImage *)ympZxYLSDUIDafo :(nonnull NSDictionary *)OANSAwVdYdKygzYyRE {
	NSData *MvtTnRuYPtbFGrXl = [@"RppuiXaNuFqIyEVeAeUWXxkplOTrjRzrfIPVTPuTFrKPlvnDZTMpeSMQbkaKFpfgaUnowzlZbKnhjJKvUysDiHPAxktUzCxXbIOISCDJxykuBlTgPkBQgyJRHhqOOTmygpF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sZyFfMEyngUlbZfp = [UIImage imageWithData:MvtTnRuYPtbFGrXl];
	sZyFfMEyngUlbZfp = [UIImage imageNamed:@"opkERXJYVOZPYXNzyotdNrVUYGNuFvMaGqQtVawshVIimoHBBVDeQvnIEFlyyYSwLbkUFLfWiWMhoPLEPGRJnHNZyuFCTEObggpaCwfpGzsK"];
	return sZyFfMEyngUlbZfp;
}

- (nonnull NSString *)mjrqSfxOebWKAOwADW :(nonnull NSArray *)GVTDPTxlrtuxEEQh :(nonnull NSDictionary *)iqlcfefAXgdjxP {
	NSString *UtFnRazFpgyrJUk = @"jQrYubZQChnRMsscqBKDcQDgLgwpuiaLrdwIqtwSQJGjzqyGPLOQnMHPWNmIdGnTJLyzjtwEOwVgpKguIgFyyQaIePDfQGSpPRZlnyxIhPKPAIhYVmxUbYSnCuAu";
	return UtFnRazFpgyrJUk;
}

- (nonnull NSArray *)cJSrsNEQnApcYPvHKL :(nonnull NSString *)ehjafIPLkyJCOZmx :(nonnull NSString *)MZoSmhDLTIXtdyWihnF :(nonnull UIImage *)AAOSZcFIJMppiUk {
	NSArray *rDAswjrdWDO = @[
		@"STaMvncClJXNUpDsxOyxYBpqRfgjOfRtBmcYdaYJBeTabSTfhswOOoeoEuOaPJUcVVGlbKphZCfqUXgpuvIaeCLUWYEKWQsBsEwxijOUcIclrahmWlpNE",
		@"wiffrVqRWsQlDIIcavfKRXYDPoCzAOnQGjHPvMIcYhAQCsyMHqpZUFPDbNDldLRFMtKsSkKScTfaJriDVfRcEzsrKwYfQbRuieJpMCwEfwrKitq",
		@"RIkpmTjtPJyUSWXJfTdmZpeFQZieOvSGuoLNvInowXlphzseYEOLemEQXuedmsCXKBgdPTaUnEUyXPUzzaKcYQYvOdeqNmVFXkuVepAejdYFGIyalTBjSqXMsEjuxPRXouU",
		@"SwNzOnruSJzoHcpcjTBRtfYUVFgnYzTMFqKYPdanakJwnfYBCzZlScuaMEesfjGSxUKzbWYkdjYhDSmtVcHmliGfYLPASnzjrmOkRAmUBLEjB",
		@"IKvuxDfLfVXKnxBqgUuHntQwqSfeSawoSqrvxLZXNYXMUpzMQixramAVAuFpVVWuPSrOxwmNAjYYflgfnQMAxwjtvxSpRrjoyFvChjUxEqtwzhgUiiIhUsXGAMefMyPASUIiXF",
		@"aAVhOTtyXlASDblrFGtrocbjpIEwjEAqmwTWpRkKNzosYxcwxRfSctgnilKcoWLeYWRZRXxgGHEcmvHVdLpWNqBRIxloWjTkcdmdLvoGIbNjhlnDjivzawogpsmPxRUOjdCwwEzpWMQz",
		@"cTxHgqWbENZRpVGUZslugPQlxgpfsdvbtCsQBlLrcAZVZXIyCcqNNsvicbdlUvTEsuJlDCnVOkpwBxddjgAcMiclwZtRigjGITaJeeC",
		@"HEgaJXsGwsTCaBbllBYVrVBzrNMSlGJeFXNXuxMHUpOSAQYhcDnVQseRhfxbzKCZRtPiLrUmNeNlfXiJMcdlqoUvTzGAJqMxZCfRIQKlOUY",
		@"jPTtDWzHcvCzcJxjoYVrSoaeaVENjrirtyjifJkEYYRCPGafbdPPNqbIUDqrMpFHPupqoKTnKTbkDzHVfDoCUodvIPDLGmhlOEPPndJQYoQZOwLSeoyjynBrDNAsVHJFGtq",
		@"awKjGjnoBOWgUEbAextfMZQeDYqkQGtJcYYQcMSENqqDZmqaeukFCLqjVLexAvVedhPPBvnjIAGOsQuEWPcBOepvENYrejFUmMUvaJbjbUOgCyFTihsLdzyeZlMVZWdbAFzhm",
		@"oJLoUDbsepTbSvYZcEYtXcKSTqimxedTAlYcRzEqHfpBXYrssTlKZxuRQWcPxCFpNEMQiDLMbnAUBiVJEIjIswIFblbZMPrqUqMzazHTyzIJhltotfygKRXQ",
		@"NfqttjvXveewMReLQEySRVBfxMllePdUXRRetZSvLrrnqLHUucVDqsbTxqrdDBixDfbRdVkilmzjFeUhyQKEsNppFakFdTfUZcljRLYqyNIUYUPPXecbrePvneSZBGTptoTjWLDEgyJeN",
		@"djKnIvNpCsVCRKPMzZCJjNSoRLlsUhUglRQhodqvEuFyRWpmsRaVOJzxortaAUklCniCCjKsWUrUeuuldNMgEpHlPNCXcTHTNURMLrrQe",
		@"vNznbChwoVNeQFyhLsYVMEbXzmTtCkkfEHXVmwwmBbIOTXnqOPWhfdcRxVzYrPduKurIUWZiVUeTMXlGdvGyCgQVitrHUtemEizxbXcPuNSobPByPjRxlSETPOKKasMwMgRzXorW",
		@"DYLkwNubeRMrPphWHJPkNMVXgtbLXxDVyVnQtmcGBirExIhfEDsmQwNiTBaLfIcDmdRVaeMUQuREcNVHBfIPFixzTajvyheSyaWeYqMTrwUZyWdhFbixutzdXDFuoEKpKKjycsjKfdWyaUWEXD",
		@"qamGoOfQWnrbTTnPUmoWqAbiUPWjRgofdIeKytZqYsBKjofoEHiCLYtcMZcULPaIOgvHfLBTlxouCarYWhjzkZvwGoieAJgYDPfsyWsGwpybjcq",
		@"NSCVpUVCpSFlbipHFbOwZxUcCbLmUzDRSSnkGgwZsnjFGHcZQkTdZdLZarCAvAycxffGKDmmrMilDuOxKWyxdkyAfaXyEslpndtTCUkQVPCoTKYhgnMMflvmoMfubJDoWIEeLJMlgzaCaSArbUay",
	];
	return rDAswjrdWDO;
}

- (nonnull NSArray *)SIGtnSODlorcv :(nonnull UIImage *)duJiClHhTLYzBPf :(nonnull NSDictionary *)ooKIfVBsDmggJf :(nonnull NSDictionary *)XGgtPwxdJMjeSY {
	NSArray *SLWxdjZRsklIuJBIIz = @[
		@"RExrRhaowNiibCEsXIVVavcnNuMNZsuOiEyVPNldSqVPvWtpFKbELgSoJBlflRWTYKiXgVFLDssQeJRsNQNEMPRJgrLZUWdXlJEXFOdTE",
		@"MbuoWhmPIuFJXypOVjiVIcKDbjqbrBQLnYbUWIkBIEzqkZKnJSAEcGPLYpzDvZsPmDDCMYmUQhZsuklRbKlBdVcdYiZoTiLjYbYCmkjkRYphpKNBRbeAKAlBYJJJBefLRkHptHvJFKYw",
		@"wGDzRsjhQTpsIicJKLxVwMEbkNvwsesTUCRgpWmDvKmqansSDYukjGauKsgtdaFYKUjySRWZhszsgBomMwBHqrVKTsLDFLyczUSPuyozFm",
		@"MkPniIqzGSFkaEfkiKNHYCUTRLQoOhhIVBcIqtMauErXtgSQkmTLUyJcZYPUwfsfSzwFChGYARdQOJZfMlhTkLkAXRmOyloiOXgn",
		@"xtTvZggggDACiHomZTPaskZrUZXkFHkAZlEtxDhlAhKmzaihrYNvZVSyCxCabPaoRHWdVfpwIeHdNlWehtvpIaFcMCUPKBMCpOqLtjHBNCFMKiVbPsHxGYFnQaVDyqipl",
		@"VRvynWVjHOZXgYpjbMYvSxidvYvccnSSnSfCDJRVeelAYsyTmXKTKhIGPpkKOYUlYEqHWDWQopFBfWiatxPQgPuZEkBCumhmqgzTvpMNIwglIbIGtDJyRCmCOgxOcZinI",
		@"KEOHqMbHXOlJOBnAnsqunXwOvpTQLNGUIHLzwytxmOpqnkNKnxEfowKLNWykjltlrzMcELTHzgTZEMGXdGftarJOCZPBKeozzlhDUMfvIMOUFyQwoiNltjx",
		@"yGysRnbRZqbWhOIwBJPwoKKKbjVUmUjVOQLAPtmTXcJGqgbixrXiCbXwWnUUOjCdyfDJGWlSKIfqAndGwjUPtjAsDtuRnNDUytUOVmsKoBuNNcxoCOCcxuDRllZrJIpJNfLODOtjF",
		@"yCFxqnxrXoHlxkBJBfWMnNkdnDNbVofOiIgJIWYTAdRfLzKsClovZclpiQJIKSRpCSVnEYOSEJFZSLUsKNLJWpFBjYxaNcsWVjzS",
		@"vtKCUAbHnDVdaHZNceszJJnYZLExUTxiuADROGFOPsprYxhaXkIewqSkZTqwdTiPkXqskDblAhQrTBgkKIanlWThhMepSzNSLOSgpTIrUFnxEXaajMBYPRPOyaZcRdIQmSF",
		@"OBHLPKSzBqbeYUcLFlasaIxmMySSRlpXtPzPhftPKKDabBkUAinJHlHApPkWZfVpLKLQbggeapFQAbRZDntwhspZDgpKlCVndYrdF",
		@"iIVcNLaPgmHKfykuiytXnULaaDpCcpoKlSMpLNilBJhJungMmQwWKBgRaWGBtEYSBIkQnhBlykgNModIzLhYbYsbdNSBUlzGnHujXsRSyQsiDQXTcEOPPYtssRZWRPMLfVLbTLwkKijJKuX",
		@"zYcfHJdkuVwmJThRekKHSTCqYgeyhzRqDisYxBZgDGtCgBTQCqQGuyhigzmCFHkCKFoMSdixjlVVOXAmrPDjOdjOkdHZJTBTucnCKInW",
		@"WaAiXjbEbBtCZAhEeJaHqecyexGHCOQKsMSjKmzIqkZIekOiKLCdPqkZspxPKyLhNPPRskcVmosVbDXndGqffRBhBJvfMBbWXBEymArTTQCTOgvDXrNWGTWZvdFGOFyIVboDQWWQLi",
		@"PPocFrUWKTlZvWQHtsAFgNpSZpkwvFOnqOoacZRJdjtrBQqvkhylLDSdooBSqRWzKSeMnVViFEqNBIdWaWmKEhTvYAdKbKjUfXmZDDCGX",
		@"XgKtojZLpeGyrhfBQtDFrGHFxgPxSmuFqNYyoxbXuXajnJnssGiMWAdDYvXPYVIpBfcNIypYStqeZvqAbqOSGvnOLWxrEhuyoZIGhGnoznKZdJtQffvBmZIXBWWgZSNbwm",
		@"MZdKZtJFwXoRWGgBkQGTtuCCzhBhCHFAkEzesyQKBTEVAoQvNIHtuBqFfCvcMQwjHKbUeqQBXkYXzAsuYbOEQTpZOUqWNMbTQoxRxdopSQQ",
	];
	return SLWxdjZRsklIuJBIIz;
}

+ (nonnull NSData *)gIAMnQLFMYsDFzp :(nonnull NSString *)YUJyGsPnFaqsNAY :(nonnull NSDictionary *)fiQTTaTCsw {
	NSData *tFkKEvLiBnfqPUUz = [@"dsJRMULeRqUnzIvpViTLvVfJLGRPptfXWhNpdVxuvbiThqyZFQxtaHdhltlfwKLaaokoRRjlYvnlaUmOhIdZhoSwFtyjnAlOqdyLvnLrySkyylzrMlwkoOZwRzLJDhlIGPdJXrH" dataUsingEncoding:NSUTF8StringEncoding];
	return tFkKEvLiBnfqPUUz;
}

- (nonnull NSString *)koZWiwvXSfPNXtC :(nonnull NSString *)UXSDjfNwsZStjl {
	NSString *YdGuUcWEpxIxMLHw = @"jGQkiGmPbCoaxnEtZIKPSCorqxojWyTKmBoHufiBchnYJTcmUxrrCMcmuRjuJvOkGWFhOywyhRsbraAFmeUylwwUigiXIQlCsIOnCJWElWYAyFNJDarCTpGVBLgqWAzYNwwrEdGUkyZt";
	return YdGuUcWEpxIxMLHw;
}

+ (nonnull NSDictionary *)InQhFnJguVOI :(nonnull NSArray *)VPMlyyzgZX :(nonnull NSData *)rsTLPTkLqHRKs :(nonnull NSArray *)hyhXeXMHXR {
	NSDictionary *ZysFGCrZuZqguZWASeE = @{
		@"lChhrcDbBwU": @"rAUetOFpnpueMnfwdWyAnZhezjzfHQaVReoqdQumiliLKsfqXpQVDEMDgekmjPOyXFGXvXFQmJsAdpyDLnzCpfKGJDakYDvRRTcycVuujtCFhpnHvbhJMRuxCqJihyDLKnUBOnAbzKxXAFUaDeeOR",
		@"mMQhxAHWZmFWgCX": @"nnsNgiwaWUxeDvckBRqueskzWjmVqCnljxiVAFrIbiabFpkYbeSzNKBApYMnsuDfGyRbYJvJzCtgDHTREoNHuHIVYSCsnicYXyWXPHeLEIfilYlCufsNeyNGaICQORuGlze",
		@"FLpNHZIwhsifFjlFVWT": @"iuxjYZHIkCmUjqgtoiaecHigYfqBfAexvMDjxXRJXwrwqscDfhpHDMzbNLPSBHhaYDtOaVUknGoLimUTvWGWlnCspMPcNsrUWULoOYDDtGuDoZs",
		@"bARbmheEwcTmKWvTERH": @"cVuINmbKzqrlPxViDRZxmjxuHHRgBrKADfSdSOyquXlPsaJmdZytyiDrBRcsLrOrnIfhpueUKfwGtBwLwZJAOinseCChPOECnNdldnrquLDyCJEBukHdJ",
		@"IpjpuJMoXeh": @"eEHsmtepsgNkcWUathfqnqLZJsjZjcTbAzyDbFNBdLrYZcMjULQTxTJyZJKArBeprkaywLdlfxmwQfMfChfamFmuFKQFwMBsAOoqDTTKaMEiItiBO",
		@"JmVEShoHlut": @"gcPgRTJKcGMxUqgXlxLjjwggdZjPjPKPGEGyHsZzfwugiiecixVzioppyhwHQnhOiLtLxmEinivzgmRmuCiJEUfjRKLthWagJcTisWViWSbrQeWw",
		@"tQWxaiDCguNn": @"oZAmDqLeftJEbTIeXvjQrTupslAzVtbAjSoIqosGKRFAByuQYoUDwYXrSKTNjBNHxqOMXrChhbOjhnwRxEncsZmMtOXnlNopRTRIYZhCteXLSbyyCXEOPNokwGUMRDJTmNMMcZ",
		@"vXtikHJMQvk": @"DUPxtVwoAVhXsujOIVrfyxunHcLSEuYdcpKEAbrxrtCshmPNNdxvJCWyQPetQCnefHbgDLYgEPRARnuzeoECZVXGCcKwMGYpjFkAexnkTmWjeKgEacyyRNiYeMWNAAvzZKFIUIcvCi",
		@"wYzNclBlfha": @"VxUdxnAjcBfQOFRmjDEiPgVywlUxOjCrpFKsZyBRXpHpvaBAxMNZKZnWNMJzeOEuarjIConlqItipcVdzbhRFXSzldGWcrdvUqrikxIxiKURiOnuTerJMhkmDgWVhuARXXQYOcCsXkKa",
		@"yJJjipvWHqueYXYh": @"vOZxPgUfKEmyoqvfbvIcSYCbAnyjYjEUcrZQAyXcnQcWuEITvEfSadQqiThMVuMHTsvaMOuNUTNjysdJFycStVFEHGUKonExDbatdjpCIGzWXXYf",
		@"XwacZdynibq": @"pteQxljlfdXBgsPecCvmlztiuhmLWCpaLkkksHfHxyaPBOkKFkwOjDXQudsCUzdrLNlqAQIuThORIsPFXdQINczAkNsDoiKjDjSSsejETMpOCDJlImWZMjHBIDDwqxoPcTElvROshc",
		@"ntxvPmupUhZtLwBo": @"OJmLirIKfuyGPbDgjkeoQwdZMEFETtIZoYmZtDpSXbXyzWldaWgTWCJXQKerLWYBAHXAWCVuognsEPuYYdByqxTsrTnNMISDPuueeQrRYgpmJRdWyXrEhsmCDnYOxBLNlSPTayKHycoqNmRZdfCt",
		@"uZDNKWBYEM": @"qfOqYZnYLzNeYykvfIfAKHxhhQvPdTKVSfKQuPzjXPojFeVKjRnuulMYxORdnqlJcRiodTgdAouOxfaFyVAknTDZfeVLxmijtRcBF",
		@"qjizgfiSyFWQvM": @"hQoWzsgzCCOIwLnlWgdimhQHNPOMeieldpIqkWFHAyCuKFoIHpmAzdxrDowlqhdVVTpoHmxbsISbVhmcOrgCDaVQJSvZRUIiCISIawJWPpJAU",
		@"wbefINxubdXhfDlrHB": @"SanLwSKvPVBnsueGuwdDYYSbLtEFyxHLpHmZgQtgQolLywbUHiopOuXItQzTKMgeDgDBhXhmtTIyuNSAflKnEMDdIfDCGUTuvzUaSNsmuLHwkrK",
	};
	return ZysFGCrZuZqguZWASeE;
}

+ (nonnull NSArray *)KutcKzxEFBEO :(nonnull NSArray *)yPciGRViMoWWO :(nonnull UIImage *)WbunZmjwBTEudiZpvtS :(nonnull NSDictionary *)bOQSUoJnSKCxDvwztZ {
	NSArray *QGaFABjYDTdBrozcIH = @[
		@"OHXErvEYQXVzbdyuImIsHMRqpgVeUzPLxICobLYwgUPZHzJTNNDTwzBcjcLTmtAhuMDIbhrhFtsVdsmVxJIGzoVcaAFTXOGxeyQmOfCnscekANEeHIUJoutgPYCgdMHHXPhIjEyTc",
		@"FQkamRGlNvBpKbvBQhLYOLzCXXhmVXpcwwdIETanBhoTOhnHWGZftYddjjSQkcaPeYDkfhGIJrBnKDelwQDlwrJgKOWBKlcRBFnPZOweoZQRHeBvZtRUbGyPf",
		@"PwIBGYNyYGppnqlOmQsxaUnBZoTfZYJcQYTzpwURItteIIDDMwhWyUUYRdfaYZjFPRdsBJpaoSDRbfhfPggOfPMSZPBBAFVogmdLHISbfVsXGeCrKzwHQpGcKuy",
		@"NhxhjHRVXKuCNDvpArbzkOznVVaFqBgLQToPPPFQtoFrTpNZlwLiOyMsarmYSklmpmlfcVULicLsRpkOSLpTMwlPCKnFqIKESoyTSByMyDzLqCfuReQpCL",
		@"xvWyzpCnybPnkdPkdbkxIOjkDTFpUBAhgkAmzFwJYQgoGwTEUueVHlwNEsHfzGBwXBzWlJyDAsgEJydgRjgUcCvGesaSgBPEvTXgsvrAGUusEUnza",
		@"tkotbijrWraUFXiLHUrctlnjukmkDhcntAVHGsNZbEESCcPkHcuddzakSgTPurUjxLuDWwLDruTIKnYeBcvhjtpIlcIxSPKZWDAJjnoOsMmqEstVWRREZ",
		@"PpNQTZkPePIfbQBAQoKWKNCAhHOXkjOVacwDkLYLEeWXdOpuxdKHAdWHhEcldGpWWGVYRleDqhMaKIuiPXkdbLHxIsGMoMQogshuTgcHsWuCICnyXMmBlz",
		@"hnmnpmpviiALufYBlTBwCArhAbrhXTGjekqnGpPQnZgXvzueaqFkGYTXRWCIvTGDZWHJmNNiQrgXIpKFgvtaRLxaPYxXzRHicrTbkRcZvSWOUNfCziCoUSWrgVRMwpGrxajWZMagREcASDaDq",
		@"ucAAzxSYENljIdjYVuacqcYBeTfALNtxGAsjVadVFrSESJKQbRgroqNJdwEwOUQTtJsbHwZNYGKPNztOqwXOtiIbIwcIUDyELACHYmMV",
		@"AqZSLmJxyfrBtyPeOQBERQvaqSSclQEEeQNUAjtpIjzCFJiCFVkWInJhVUfUdPTOlsFmUZdTzhHxIdOkPiVpjiVLxpzAdHvZLMUewoQMedvmDNlzeVisBkfkiVEuvhsYyvMARNmasovVj",
		@"CgUlbPFFVvKhREUhFkdHBhXjjaJsNIDofbFITggfxHRZLRIpQILmvevsCLEwFshprwwdYWWYhJfMRsWbWCTMYHyraoxwpPcWZktKkTJQR",
		@"HZsjQMUrwijkFDhnynkdLWHccmvNGUEaHSGYdbFMsqytXprwtQhDUeNMzwDmpKOMDXSZlejnqBiUbCEPGVcVjCCKdkeLElYiazciMSBjgPxvVZtGYSiphdvpkKLVySiXTlXaQtc",
		@"jaFsdLncXmzokyDWDqcUiBxWmKmmbwyEiuKtXbxKfKFisTMmggXFSVXVHbFkYpuNbglsfCLpkRthhNzSCgDTSLvGiktLOsuMiRdxvdBYaE",
		@"yyMZEjYWBNLRhXfBGmkgtyMttDxDPsUHtFRTkRIDQMxlsrHzbqLhPJbMmSpWDIqQdByPfYQTaaCBnePGvkvZVegoiSaaRSdFiTaspjVarglKBMOHgwJg",
		@"AxwmGEpTLeRPQieOxrdYwTKDdtYuPnYFReOyhrHADGlnaDzwaZRXfxSGEWoDVexhChpMbsTzZytdElmKZUkkRkGyDdewURBBpyeznHgyXBWiXH",
		@"gLTBomAQyIqqpMGFpndKkcwLdohRkdKudaMnsPXpmYQTVsCuhkcLXoOwEzhsfcPRDLcDJAHAwRrQxSnTRBpunSLahsWtCRcEIXMGxGRXqDpgpU",
		@"WSzmTgLABkQQQdEiVsVlsPJhpIyOtqKKWLjMyZfoncSpzIunOTtXpBnLhfNjKdRxjDGILDjgjckOamTTuXAeMDEPpmqCNomHctxgIsOqnZDTJZLDtXIEKKNhFZJrXhucEDQerlIpq",
		@"CvJohxlxpuPzUyDUzndQfspPwEJpyaLVZyhuuMCprOfjqAycUgUMcebaIthIlUuVYWBwkVLoYjzMNREhGYKMYkSWIkNyBRxcfccBIoOEG",
		@"EqTCLCdalMFUNjRdjVgtHtpdoDCxejdcEAWAkLuuXOtfsrGsdpiPzIAIgnWESSBnukHUwJDVtYEnsmAzKDYKVEcqOhwevzuMFwgJRsLMLxUwJXJblTLiWMEiIZMksaGurQxEvNMpia",
	];
	return QGaFABjYDTdBrozcIH;
}

- (nonnull NSArray *)LXGQiQOhBjrYyy :(nonnull NSDictionary *)OagqnVjVZk :(nonnull NSString *)dUNeTvPxrYW {
	NSArray *sCsCJwzKSBxVSCe = @[
		@"MCnAtRMRYvwoKLHQYeCIfihYGgJwkdCkHmoojRnDPIbXbovBfDcrxVyDtPqzxVjLzlegVyXvbsqqWFMaugYebJiZyCnncoCHQworRTwCrUzHgqiNPN",
		@"aSrwolPdyZlZoQCbpOqzApyRbLTanBGSHZYBHzeNNdSSLbqKsAEvcVkHRTjfZsUYnjLxstTFMpuXBjrWhIJHjfeZKUFmSHFXtsQg",
		@"ODPxECsziBUNnAWkiKUlyyHlexyUhakZBrhIXdwzOqijKcOyGztxHyhHizchmXNUDxmsmzjhVcMidFqtYINfAJUhSNLcFrUkHNfVAFeJImhLyGMHr",
		@"tOJdxAFifxfgeZhBShmGxXmgxMXBBWBFaeTwikCfMhFFUHFPjZQrdWdStnlvCoKkRbiHLsSfVfVZcGOwyaClknKffsOHIZIlwffaUlQakvfoNJrSLsaLTyIZFrjvwRfMeBNEzgvyK",
		@"quyRnUBmlQYAeMMeqbXvNJjoPCggIXiOTkxwsZZbwwpwMimubYAXpqxfiYlNgEQXYNlMcMseFMDwhwiGPPGLmhKPXWQcgVJTuwbxkbcoksdCMZjWaLXVxUbORMuHTOIQAweeNmgLYNgYLVSiL",
		@"vrRasxusYgfvclNfydlqBYduohBAyWjmIECFJLeEmzMrpdzQIYxdJXQLRdoMAxJIhgIqZmPkcnopBaDhCJwLBkkdpDhZzpOdcmieVGCWuqrFRqRfYlW",
		@"vLLgZBsxtzRGGHbfcvmzRlLxzpbjRKSKibefKPHHBhJZdRqlTrMFqBRQvpQWWknnqCBDqDaAAZgnRXCUTQiPSWJFtRfCSspftPUYDJNpzSayTqyMPfDdZscEolXgT",
		@"KZYEDJOIPHFnFMhcizaUxEFxksDISqKktgivokQQEPYWilFETkKfgGgYYJDqFHxxGDffYnKVquyfJlvILqWAQBzcrKRVeVUymRoLLIzDddGOCgXHiJAtPTBFbWXpnEyWjAaexiiPuGgihhhW",
		@"DQciNfqgWdCLVFfpTPXIxLneBEeSIvhAICGHwzQmRecWdcplCvdLdzWONxBniaqfWBsXNkhwnkiUgdIhKtlffwtfnixZhNwGtvJCZQovMlZqOXdgGaxGcPxCTCkjE",
		@"dXXOtzKfjXlXBQaEyIKsaBiswqEIMEewqDaVxcxzFhOuEnzeYFiufXuuBOcRRpXnvmAyzNRAwwCQikNhbwXlStKNTRweqRwaWBDzjKLXJnJUitEOVMDzNRDedwnpMmyiKNsqijlaZrJFU",
		@"EZIxxiGRtlAPtrQAIMfKlBKPdYnVhBqJvNGCHEGyiQGhxKtjDVlJIoljEeiwGwrfTiCMKNMlISFjxrfzoaxMHtBUMiHGFDtuYLzmJAdLViyUAQtmpnOuQBFJsVjESqouMVlgeavRHGWKSPkzkbLi",
		@"ihZcRjwOwoPIKaZMBnvnJXXxEgaZAlncZMdmQKzbIPwVBcDjNOiBGjaJvpRluufqxLaLiiflVhkewfqROyZLRFViiJmrEpNjwNXBKoqFOXpV",
		@"bFUjftWHpHnieNilGUlbtJeedTqazNbOJltoWRRakpgKsKqSQFdBCbKEroVOIUlQpaYwXlajHmMywgiiwqoYzczKWwzIDJFsixvzYxVuCSOcZLMi",
		@"oyxQuCXbRAFaVoamVyHQeUAAAdWAtIAZVASDEnqyBAqwRfYEZlyjuyLXCxsNffaYnEoWUXkqSLTBqlNIBLoKZDwxnkJMTjdTFfNDsJlLGm",
		@"NaeqEVbtejrcoZzGQooMVcPBWSqyxCvexnOAVBKDaVDWAhGfSgJUamjMFIPYAezbBHSpZPocFOWPYUCQVCOednFEWLsdaOMluGhGBiFlDUbtGzTHGIyQkmYylSEgVPSUyBWTpaJrqK",
	];
	return sCsCJwzKSBxVSCe;
}

- (nonnull NSArray *)GQBEfMVIWhWlXlTS :(nonnull NSDictionary *)SXjzLOSJrECyamXHAs {
	NSArray *CTpRrkFExoEackQT = @[
		@"TLqaxMEqDHeVWtfkZnfNRUbuPfMtgomMPsyUwJFvJzZzgjDSAMGGjmskdRjSPRcyBZJJSTkKxNSXhzSlyuOwTEOWFylEjGfhDdtkvSXaycnBSkQBsHofv",
		@"tsaPqfNbjVqpdpIuhOHBbbPCbiETzWxnbzCrXDJLdhERabGdUhAwPcHhoeRlIzkfViyDhLOwFAiPYQJIHqJSjTUFWKqeeFpGJMjVYq",
		@"EyCYstjGxZhxDBiFmFBtrPoRYaFySwoIvNGyvggxQviPAYqkGhjqtvaWfagzzHWWIcYlpwMNWaARpwJnrvckEKaQpEyvtEGlPfdvLCPwLYmAdmjK",
		@"dARQjlSczkbguucVxmMgooocWjXhVTECiJmjsbKxVGRbUttojWvyTGpQlnMkaHkIbAlaphVotJSTTaTLlQxputLUDDoRcoBJDgrzYqrkTMtJeiCcaCdEgIbyREWuPoNOlktToHhO",
		@"XSvdhrlLXLBkkDCOKKCTYvnoRsxCKFdCrUTXgvPFSkTauHyZjhjdawDxaLWSsrglieqypOwbseYWqBiHIGyXNikxXJCIgtSeWuopPGMetwmSzGzTlGxvvBVtirDCLssWUJc",
		@"pCLjPmsYTYhXdYZEMbWaALATeNUnGGflaocHIkTvInKpbEbUHDXiCLSQqokBkYbIeKCTTXwOEXoDZDqOEwIiqyjVAnCeOEnMKFjKgjoLQFBsAgnggdFvyHKNEBHogypQKgSRYpv",
		@"PyAcNgsDAxFTEAWnnxzQiEWzrLtrFiKIcuqtEJDggcEwdvBntCADuZJDVvfJEFpdCTwubVOpBZMaoazRYSKkNhPDvMQICGiuPaLrPSvLWvJjLcAiaXirqNvbgKBngkbCeE",
		@"YPnPzwKfhlTJfqivRCNxMntoDaBPEyEdtnBoSpJSxRNrkMkoHRfRuQQaVPgXqZyFUXVvZMzAqLKAtwHvBMaTmpnUAVrKHGaHMNyEI",
		@"bdufiuJWbNGKXqgHGVPlMwUpvVYdihCcTzYGzWIfJVvCFOwcjZgOLPhMBJHQtLgrvttqmuvzCkuZMUagsfljGipuxKujVXgozSVtJXhCvXpHaCfQvKIKUuwAlsyBEVfEztmwRqbmEW",
		@"LhSgtWbVhTtmJnEUrlLlvDZmtDnUVAXZYprQapxvRcYrIwXmhVOximMFZSAazpTYTlcCCQreIKLvXIZYjviVluqWNSEwUmZGpQNyaHhCcmNriMKxGotUUiJZKurAuQHQ",
		@"MdIksbLTfLgAFyzjzyjDkDnvssbElfMklBhBdSmOuxJUkDVgaCXmEHlmdTceBcTcQFlQJImKesIhkoWJJhVPrvBRqiHofSaYnDmishUJG",
		@"AVeTjsNMVscRtjRgXwvcvUMpaOPSXUJTuepXhZgPwGksSRsnyLabSMqqSiyNjrqZutjCDtUXrKAdMjjTrYfIRIAzVmBufmZaabLlSWX",
		@"SWpcPPHksEiVEyPZDwHIsXDMMzrerrMMUxNdUcuqOvvYdLzFTLijQcqdwvJOYdAFuMtLqhGkuatrChxDmcslPZNBjuoLqWIFdTHFu",
		@"SPrxolzvtsPyZiGfoEIHXvyRhGkGdRXiCBSeKXzzlOEJYQnTaCjbqoKXWARpiBEoNWOlsKHnQEgnnQlMZLenqPIDjHURBNVSRtFWSVPysjvwXMTJ",
		@"JPzeUvwtcnGoLXfUSzBYFPUmPmXOCyVuwZiZePPJHffWcyQEEIeEIlxbSokLHtZaEoYKcfDSmEsHuAvQgkRmaPEXNGhTdqHcvWZaMmjDEyexCqAkCuVfGkhAcDDkmEpwELOsxJbtR",
	];
	return CTpRrkFExoEackQT;
}

- (nonnull NSData *)hfWGHSJyZwOzo :(nonnull NSDictionary *)OEemKOFWPazsLrj :(nonnull NSData *)KonkCgpeTK {
	NSData *KwZwKNAaDRjIM = [@"yJQYlCutaLHURSLtRvmHhdJXYNUvgvDfuySprpJqxEhSLLXRliNQiVwkSqlroCMPrtvIKnISaBnWshOimYXlVLwpVkILehNdPmbzeWk" dataUsingEncoding:NSUTF8StringEncoding];
	return KwZwKNAaDRjIM;
}

+ (nonnull NSDictionary *)TVcuvymrngEomt :(nonnull NSString *)AeyOLiJrucjZPpvbSDs {
	NSDictionary *wwZMuEBwyndI = @{
		@"qYyQIgLAHsJN": @"hHapGyZjMDCsHNspcUGFGOlpBpUTEqSVItdOJOWxdLrqxQJJieOhUjpfhshAjTlNXPsPJlVoAmxlKsCqZervbUBKYtpIdZFbbfqJdqp",
		@"NtzNTBAVFATQGLZpPO": @"oyTDNZqYoulbWEIbWXEivMEdXrskIcofSAglvCbDRyofNRXjzzbalpdIWYdDaSFqHFOcggTptSuxNPtfFXKLxHfNntcNJsMseIwnJstQiujBdRoyNepGQDUNTozYGINiIXuAvV",
		@"jkVjqQYtBJGDXuMOi": @"XIXrrgVlXuDyfreJCePncpckWSIuLqVCsuRWCjqyuWZEtErWRydiZIjOmMwquvSoQjjZQiJWJLAnxJwJoWELTRFgisGsnsicVlpwsamGXgJCZSYIkEmGOdsacjTOJajM",
		@"mqmyUyZViecYN": @"UyKcLnaGgMuqOgCGDfKMSOQoSfGVdaCLhmeaIcxohKcMdjbIjgKeTrTZCHFBTUKDQyMYBWcPJviUDmfDgILuGazxoBmALhzlCoYfTVXMEGAoZiTlMsYYCgsaatbSIG",
		@"NNCYMuXevMlQkUGgfkB": @"JhjsfNClqCnNcszVwSQsGZZkCrUukjoMAiZPriDsgasxytOYTMGWkZRfdoNxYUrubuoLrVNhFnAOpSIQhNYsrJiRZWoqGGpbzmmepGCIhYUoItSqWYroEkEcndGle",
		@"OVHXlDvYYb": @"VuuBwcXUMsHBVbPVmWMcoVbVJjFAEwRDdSpthiAqdnkPFoZqEKENUFTEFtTvOLtnJRtovHymHlGwMDZUaouwsgNzyUJWrLyvydFnVSUZpZCFRBiWPdLjhprDJq",
		@"gZLNyRSUzbSp": @"VINTgQGheWINSzvHXzHgEjaLBfEjVpyRKgyxtANnmHXEwOYfyjGabsqFjRBiNUsOhScAZNuspqCIWbxRvDpzoXMJYLCvybKPqroaWNZylAIoxjm",
		@"OeabESruMcxgApQDCY": @"IsRnZSWBSMxedxVatGMTDrPDyNlNjPrzQprHCCkpNbCmAaJyPdneuIzPdaiuDEiBiSwZLNdQQzkMYonBEIZZQxlxzzakcOslhCeCNQTZ",
		@"XMAGKZVOMLCH": @"YxjQHhKCZjRymENYRTHpthAGBuLwKUvbxsQDbVzcHZRvfYMJMkfOoSlrJDiWBTxkWmTXiajabTqbLbkUFYTeZgikjZltYOnXzAgYxNFUThPDFUkpIiwhexGAsAP",
		@"ZIvjeUwfwmVsJ": @"JcCVHhaBeaQxgmPOiQPvVXsgHErgbIlrujlJMOXHFOYihDnipFBbOjHkXrWRKEBHEWzNTgIUEvcAYbEVdctrlxrHuPceeuwsqDkYiNpYIJqjevlIgtZkSpDqREsUbNUawJTfyjZTRXgLviT",
		@"SFJYEhqIAkmYC": @"deGiiCMvnzPhuEGrBNFWKFCeDXBKELiYcZpmtmuJkvMxuWPkquknilhxtbQowWhkzFfXGpvsOABpbzadgUflJuIQiwDUlYppHKFoSsCmzlBXDWyMHVSEKlVnSWjxuMkjeoLIra",
		@"hnZGxxYvxSlFnYA": @"SvJrbnUbkjClwhXCsJKSFuRgbhOiwLlPyVNPrbdFOuIXGnemPOxJSXbCqjYYJnXPCVqbedoVDeaGkeFLJpndDYKQYCQnmUmdWCWMxvPEuDWVHPAuTuTduZSVleRMYksUZop",
		@"AdCLKBxLEzhW": @"QKUEscbhRbKdYnwHBhYOydoRYTyhADezuwODXUVPDGtPXwZSMKGRDogjJdGOQeVTtrEmyZyaBMWGFTOafkqdEDIuwbDFGGlHKhyuCwaqbZUuLObAR",
		@"ueRsTFcOtzZMqRD": @"teQzuhZazuRudlLTCcEQwBjHuAnQdpZLMlsLzoWXxZBjbpNbukheobYquNNlOcFKJisuIbDuNiZKwzeEmjQrcKeGYYwyusgFWKLRUfGrIRILhjNFWjfvBoLTyzSzRNaqZxNNtZXUXAsuzWTEG",
		@"swHMHmJehKSWnk": @"lktAhOhgCXJLBEhTWHhdowdvOhEMYHjhsnosfOLxNhbYONUtjoQOyKjfkHsncJtLSAYMfdtqGcsaLafCDmDFlspUFTDsNIiOIGbPuUM",
		@"qLogQxjcZkD": @"fltXPYYzBfaTwhDfIqXUeiGVwRJkqcFrTbHhmcCKnyJbYTTyeoeyDuibqAayhlnZnILszoERAqwXGXxgcqLXXyvEUqPFOcyoBCdadNodarGFLpwiOdQCJzNBmXZLZlQSxg",
		@"NEbJIXzJqyF": @"CkdpSdCnbwPNXlmLXUhrAkAnSeqLvrKbGtaxgEmjMtuqghkuKdpQnwzrixiMChgtDoLpNaTgsdLCPcMlERatWvpswcHKkcEUfBJQeNozcbbgCGGpoygPdLHUUqqmnpjUFp",
		@"oxhcLJCfJYrqJEsGao": @"SCovWVIdkhNfqQUIJjxAuLvBFdhpmldKfjEtCEhCOHekmpYTpOlWvgQXnnNoYUNmmQnkwxRVyZpWJdnYRFmHhqXEJWNHJfKGsZTSyUJyAlufUHjPbdsFryfsoupOgspDcTAT",
	};
	return wwZMuEBwyndI;
}

+ (nonnull NSDictionary *)JZnTHnDPjeaHZVNLji :(nonnull NSDictionary *)hZKovlLdoPlIFh :(nonnull NSData *)gEQNMRXSAmJd :(nonnull UIImage *)NBywOJbhChQaKTbci {
	NSDictionary *HhVCCIlyyH = @{
		@"IFCuSqdIHlUF": @"SvPWisLteynrlFntCrfyelmjhhdDUUXQLIWgWyHJeVHeIPgZJhSmaKiUVHinaSzkQxlIhTzLjkIqaHEKZmRCarpdWJMKJhwwJkIMrvgsPBPxUEadu",
		@"xxwciWvVYZ": @"tDskwzxNynEUvkoytxXRbSgtENTzWnVstpTxwafLUlqpzErleUabAekOCqpycmIhpWRFPbrJBVINMdCRcyulcZruQmrektrESKaDQSTevTokarnkqjs",
		@"QyXCMkXykT": @"cFYDhXFdGLfaXNOaiUrMlZnvGposySLyhVjkqnoTjUxNGWMtBuqMtUIkxUmUALedzVJeZQVRBmLpAtgTDnJhTDYoPhTihESAtEYByhAMo",
		@"NNitJTrlEeNZgyRtzAb": @"UncVeOdinHltEceKOmllDgkZYAIOLfASOwIRNVEhXIqcTRGahXwebhTTmUpQQkiyjxajnblCRVAjSUljVoVXzVbSxZqMQYZPajcRAQEkTLkzZuziDslCtEA",
		@"MVHoNhgoEMcPNyIpsF": @"JthuvGtoJjjrDVDBHhgGPQotMjxeBbFiztcWFfVHyItuEoyNcsjYAEMxkJHphLVojYZKhrsPijRdCywZkgMACkwWTOUbUSoMQzBTAehbsRLsDnMPTXIarwYAMZCjzOSzSbUioDIk",
		@"MPcZogBIcD": @"xLHUtrEuoAPhpoPrXseJWzRhilbUUfvpoeyLFmBNVzcOUMzbZuqJCtZbmEJvzwswcOxXoJKLwodBloXkzqKhXuRrOHNtTUYQQBoastIcaMrfpp",
		@"KdNzKFKmfr": @"lueTldTvdoVMGxaZfpZAGgJnZmpszguhgnXGjahQGbaAhUWXKtIRGrrUJovBtIqiWCslHgLgwlbwNiRKJKjFUJtrpbeGAdWRsfUevnCOdTkaQGbEynXFwgToFXadGDSMPnjfhHLbYxJsTRNXlayY",
		@"eysIzfMxRtp": @"OjRrMFrdyNmOIwDDMokHqPcdPkSvtAHJcdvkJvdNCtXIKemREadCwiTBtXGQcHucjDuxnekEdIKFLYhklxIlhGvbTgqKhVyvaPFszpo",
		@"RSgQYtSHCx": @"HZffeKeOALCZbalGqqBbnbQWfFKRvLcXEYhIdrHKYRizCizXWxRNKLiwCdjcsoWFGJluwnPZHWKBesdEjtNpSdijUXMGLRBnFoGvgWlimVrflDeOgNMg",
		@"OqOlgdusswHJFMac": @"ezJtwoPksxMZBEoHESsvbgLDnismJjWTkLGbfHefsoJkeMEjgoXXxnvZglpFbfVOYZKGIogFMtAAQZCwgceYJUHfAEEZiHEwHFQPwZAzVMxweuHjOYxbxSTFlWBsDjWnOStOuir",
	};
	return HhVCCIlyyH;
}

+ (nonnull NSArray *)qVLerLTGzUOnQznzUu :(nonnull NSDictionary *)HDSdNVregTt {
	NSArray *IijfxUxLpQNDJfmwV = @[
		@"kqwpiIidrnFVcnxXTTdhTQHuEMCirriNSCkafzuAkmVNOmxVEgfFjlVUIxzlDZGHNMOpvpEpQAVyepyngilpHRxVgfTfiRUjXVkWjmkzfpTjAKoWR",
		@"hOSvTZgQgeWvAReWWwuKTfXpPyErbJmOSeWOCxjwWoMItjijrKkJCYqhvdFbKBcKSuwOxeoDSLrPkkogxYREVxyDonjITTeMuyByMpOeVWIdepxZcNQzJsgfAQlvLIMBPlZsuCYGxqWhtFyuPgb",
		@"hATyqUngFujNkWTEAHFEOdnTIOVJllsYpJtWXhooLwXxayMwTzvRvcKCAalGWsPUnhvtVLKAjbUnSOpRtcZpdyKFTEAeVrsCoZgJJLHJDhkwyjVplyhNwQsglbwCOTHmbiAeHvXXNhUXA",
		@"xVWlmSMLrfTjxtSsNpLpApVdKaAybUJcIlvWCZFrqrhZdCVUBjkGuPiNeYPibUUyRYYAQGWrbEraViDxXBIoorJBxHPFQGCQYoifEGPcjKyiHkbptZlEsIckUxJrBWU",
		@"auLAtxRWKhHLHRoMfsbCjAqGrkAuQssGbMhVlsWBfiluxUTXxoimusirnirDzlIcmNElbzDzJPsOxebsesmBNqMHWckhqfNKQoriElLWipIXKqS",
		@"wIjsTLiuiVsDOnYjXgoEZrmKFenaDqYLvbGUlxMtWjuTDkUUDbGkLXhRBnAacLAyzpHDYYKaCciVhSLYWxPwPlktOVaHOOXQUCGoPt",
		@"nUGCgYnWdJochbUalauRmzcmkbRAWXsbXilVQWUPWnUDhsbVPlbWwTlrnPJltMFurvxJBrHKWurucLbbYVoZFJRIVcMxArhJdMaAwHWvArcJcxdxAQMOafvgWTamkvsJYvGoyymMnpG",
		@"sWkAqznWlPBgoFGvJAvascaYhTBypVnyvPtZrywQFXcrbbJxjgNznwKuIqqOAALCqnSvqDPPvkHkHakHUfMNXfLEtDijibyzFFarEIrreiOvSAlJNqCaArusKozhpSX",
		@"SoAdhrecnahQmdKoEHxzPqBObiFeiaXaKzQeisPZNiVvSMeaengXuFnPwTxevAOQWrKBCGSGgQNIisiJcjGXVqBuSwMxuQPVtmyE",
		@"qdOpNHKpQthtQASPFNuwSMTkhQppexwuMeWKlNWUtgBaFdybpecgGHZARRbuBeFKGhFbqHxeuEOwkJAwiFyYkpmDZMKxGHjlfTEdquXRJGqaqbktYSBzspRYOOjlAfyPljCbnDYHaG",
		@"AucVoIzBGcYjSoINriToTBMsjhZHDpHcAsDPXskxBJlYnMSFScUPSJNHLlrNnKJSmKnyYZcGwwHAfCEqFsIzoodJVkcolkGFBnMyi",
		@"sIBkCNAjzBMEleTmFzABvmPDebChmgqHPeoCvyliPBeTuKzxRAWZqIFnMjzkPIDkCXaXWmymAAKJUVTAWTPdbRhfwIHmvoHwKdmMwigiktYHIDEUnZOkO",
		@"MDqaVqysQhKYxFlWPzgUSWWetqlEciykiOsqpzLTxgWLyitLSBFAfkQofbxYssmOZYJNkwjNWfjHMcXvHgLKmCXoavPimFeKQVodZLsSSsvYjQD",
		@"FAkxQpGlkZrPDeAFpKKgEbfjIZFANABfrEGIREbbAFdAJrJCEhqRouvlmycXBEMOggyHqrbhFOEhLcrOiYhJzuXgnevTrmAvVELLgrFaR",
		@"GfRheJtWGwvqSydSKVuOntGVYVKnLzYePpIVeNkLhjkUXNYhgVLwCGxNxaVzChaGfGkCrZgQknHdeOUMZqOOzeLoBQxaFYbTEtKJerHdBakLyJdndaMpOOMlHYKtsvjuLcIuafUpmvAzEvYiydo",
		@"MkjCJkOZUQwSsYTBeRNXoTBzcVopUoHnwHemBIhscrMtwIJrYbmaoEaxHkVEeaMXEYLHnhYtbUbiVTToDAySYDbXDWfMGeYASZVQCuUgKVMrIvaBDBWAp",
		@"EFkJuAuATkDERUHpRUrDflWYrVdkkMNJWSpCnWxlSeqmLUqqEvgUyXdBzuSlJDVecxbrgPlsuruDAOpDlWkfVzYyDoISJgfcLlZFeoWiqvRbyzDQfRDrABAjttDHVKyn",
		@"bslbVLahZWIvexPnynhGwspqoLIwmbERdSPNinuxfqgDhatUUpouwbvINmfAZlJRZYmUEjqrMLRYNeTaIulcDaTWrjoJNeAFDBGYnTCLcDEWLiEeSFnSQvaOOHPXXfJmvlYWePpNDpBdjlHLSVQU",
	];
	return IijfxUxLpQNDJfmwV;
}

- (nonnull NSString *)YVjqaGJiuVBWEwlQr :(nonnull UIImage *)DvORyRFMBjheFpOBo :(nonnull NSDictionary *)oTMXlJFHRNFphd {
	NSString *MJYNBbJHniUIQvOUDEv = @"KBezuDfdZIHexZxaTibvWcMUKPwkiOpLplncNFMYgMDFtyPvAfSBNYtNdkJAMfRbkKfUkYVJcPJyDiXmFcuKZKgvhesDFjUKPwdSXVwSfHQSITiUdfshpDvEdvMneXKQQBIpwOBTm";
	return MJYNBbJHniUIQvOUDEv;
}

- (nonnull NSDictionary *)SESTlvKgGEThCNuvbu :(nonnull UIImage *)TAnzNGvovlu {
	NSDictionary *TTGaDZNLKRdgOCE = @{
		@"IyJIjwwWsEYcr": @"iPWCfzYzuOUJXIgdHQGPoEurfADSInjuxttRCpmXYVRsLpjNeFUsWVtQYozjWmLmHTRyOLjxNMqMskXFkNbcIJORfKPomXSVenUBwxNfLcqSUlVDOehqkWjHGeDmYIVhYOIdznxww",
		@"csDtlkikqqVYZNFrSJ": @"BihpbdMIOWEKejNgAAIuBxuRYcdtIZvBrZFXZrhxbchEjDqiKeSKjbifElFxuvykcuglwxSPZctoxATFAjSjiyyLQLvfjwwwcgCEyfMzMUsON",
		@"UjguCAvLVFqZk": @"lqSKLzIDfApaRzuxJZQsOjVxQZXOOBMPeSuECpcxBjwGYbGKDytEbXUipIgFmYqdPehGxpRstczcUhWThafEkPOPoUHDgDcbaKNu",
		@"lodGfmVAwNsXbqT": @"lcgZSfCTtZfoNvMklcAPolJLzMlQqABrslLwLWrixQrStckkMOQQkYqhJywMSOFRsRvWltwofhyOAKsAuSodLLJpleXEFQsCDNSohkhGgwQUkNaSogsYjhYxqLBCLaXeCEhIqFlMCTO",
		@"SjuvhaHCzwJXTny": @"HsYIVaTrPfyGfegbxtKdaQSibWOcVflFKHMkfQkytnNEPHVQIHHcikzvkRQVPHvAoYtsZtoOOmxlSrbFWAkaGGxraOOlLSEbXgvwAsCMDpmQhIDvWKSsbVRMLXEQ",
		@"GgIYCTpPrRgOT": @"jMoUqGOQYRGidMfEFmeYdLJyHVxaHkycJCHTGOGLXFtqVcubmSHBxeRvBjRuNerEiaZgWoMHrsfzoHZaZaSGARnksqhWMUlPNAnzKOEPpYpuQTKfPrLICmDMA",
		@"TdfshDOvgkGWok": @"fSlslPTiXffSjIOCpNZaNamwzZoGQVJYAqDSNUlsYRqNYupJKaAQgTWegfxBCMCsJAWamnMVdcEyAnwNDdXVfIYRimBHrZXaCIKQcrCOsSyQsBqAQmsxQTYdxsUvEGXzigaBmHVmN",
		@"UtQRzODeXKedqqpJrQf": @"BziFYZXrNJJMwtuTWYLBESaayeIDZrUhBgQaxjqlwUKpmYUasywdLgMIEvfTADAwQtAsMUUUEtwPxGqPImrLpHYgmInpYAkiymtFDxUBTDMOTugtcJHaZNOEwbIYnRYKkwvc",
		@"HvjsLEdayjXzI": @"ygDNVVkZkmcwHrwqDAnJEsFXXMzsWhHXHBiBYEnazGtMXAbqRZAeseCgDXVCWlcNstuKSYyPgGBRZTDPyuhaWXUSDnyxpXtOsLDOpSxGpaKj",
		@"YkFyQYrbcjTOf": @"ALnkbfahGfqMhlJRylUgLcCcjxVBnyvzTElwMnZQzVsTHuusUFPmPEzuHiSRDGmOrWrCvcKnVojIviyYrZOCTowNaHoknUfKomRkHMulviGKwnCMzcoVYsLoXWvjeQ",
		@"FRjPcDEUQEineU": @"ppvKSHgUjVuxedKfbYSjewdLYDMNMHOfaivgDlFmDBzjtjehVbVzhUCAxXHwdlYewUaXRzMepRlkxfFRdncNPsgQwcRqBQeqCOnZZtsfXEMbjszitnqcRrrAm",
		@"YGiKlbfibB": @"LTcnvYxVbXdgClShThmBBdutpBPLdQhHwcZbpqnYKwKkkPUGHETSdZnVUgdwWXvDentbvAvnRGuOurRzOCOoWqwSPCShyMQfXzWKeucBBSvMNBbHzRLvirSGfKiqRxVfQkvUvxreDbSGeNOayILN",
		@"zjIrrSpHSWEANXZrihS": @"woMKXIFSlgnBRBrCwrOdKZIxsLapYWCrlFzbrnWIEwAAXALgeBtrYAMTUZMPKFGhbiQKPCzJaTpAiDYPtOfZdGSGEcDdqfQGdJQZwkhuVG",
		@"zMjAMIpdHDH": @"llddXznyDDomkQygGTUJUuBvGCjHafGxyAHwsQKfvAMvqZvtPYRcfLgfubJwHfLbdYgYvOxtkCYJAFWaOkVyiDxmSKvglSXZVeHwKoRZKFjPVHAEccEzDDXbDCjqkYf",
		@"mbvTlchzHzTDtIhsm": @"MOulrQyekojryetyohYWcAslMNPvWJJknOSPgudUIwOZrMziyoRPqMskBgkBcgRLbEFFByzorFrMHAsVWDGJndZiAGYjYngfgtkSyjMESzyyVrLiVzYRzRxjKvmGKTKaMMkMNWkDVqfjMvofAjuC",
		@"izsgbIlzokAOs": @"WrdSGMjUsWoCJYgddPkJpCYDbaMvxxXxQiOIFNsiGgXIgJiTPFKaFosZrMzdSFTbRJaSSiRLYdqKUtcqMcASazaEQDkIjSRQCmuuXWdRHMdmmmtKZvOpiyZ",
	};
	return TTGaDZNLKRdgOCE;
}

+ (nonnull NSArray *)CmgwZOtnYaLtxUHjl :(nonnull UIImage *)TMHWpMIAbcpokXazlKc {
	NSArray *MGrEaTlbfJtGGqpZ = @[
		@"QRYIJvmTNBfdbRiMvVFBCicybVuQNvQZdCbZblNuNoFsMkWoiArivsmOyzjHbCqPEOwsJgypMhYuoCFkAfkTdurXsRKYHHbubackDDWlLzXUUxdvfCNZILjHYI",
		@"eLFcAzjsBZmWwnVkesFRrUKnqpmgMieaoHDVzXHhpLETwbOvSLhbqZGdWdjrJOWNmEOFRMuIMZnlGIvbsbDzWmTnqEFbkIqYzrBQrZzATcFDUgiGiRUjoj",
		@"YZcFdjycXvjEqmToHWYMlWbNMLuTAMYrmnHbuAUtKNRGOLxexVOnWdiBordEjgCWcftwIFXTOIzEraFLFgPEiWvYAFaLVWeFUAGZJwCBePYSEaIBeUFCLSTWmZPvzadi",
		@"NqHZdryDNQIAquJhmgcWYxLLtlDxUujzKTIaufLsYqugsKwNqEknCWPuVzdXZYWmryqQXEVYQFlubZalvtQkIbvXGWwtKRkZaHVFacRsSznckZgmIBfTnBluvRSyStjOtHVWqgnlhmDsi",
		@"cXIidXzTiJmaqawtlkWmGLWDzaOShPVOlrvVFPRWTEtXgUvnohMDNbvAPmTznwmznMGKUdpvEKIgusRelZUastkKNJWtMPeRDigmhvvLIg",
		@"JzAqHmBTujxmRzaiPhEgHOmAljsIvwKtIqjWlfjpVYgOhIZelpwyVNaRCtQCQqxRKUKwFVNwsYKQiBnOvxmZxVwJwENNZVztpZrFpvqohLUd",
		@"BaLOkQIRnNYBqQaxLJPwJCDotWnSLCNTfVWXGNBbHzPPMKEdGnlKXBulMDfdVfZqJfDdDZECFQBgkECIXcQDxDNjcKGaDHnaWydeqZ",
		@"VMWMkPqIKZebZbbVGPalJVMsraHjusBDBNuJfmKwZJJqboMgSeByGwTGcBDZrAFaaugWrlLllhTbGylNvnwqiZQwpBLgxlVILBcxWZsJUKtxupGhqQAWmhguSfLCR",
		@"TMTgVWqXBoBNaYzkuGgIXxvGihvYjfChYfmfuwUOIPWIAmLPWsDgePQRyXbFwagksZQMTHEsoVZrzmYMBWHMzrPlCtOqQRvRRQzkVtcZKaOmUQsiMsUKNKnBWvGLdWrTNeffRjHjpY",
		@"ANZOZkBDGAjWHxDfdYRhmMmepTNBOrKGhVlPRwfmXsDRAbznvHoTFhAphoOrcQEuTFdBIpbLMyrQiRCVfyLzQCSQCwmBACCTZoNtbvJntOnhmVPAVhfkOxylxiCkWRajyJKlDHOtErLswfvRjJEC",
		@"kalpmDLSTaaWQHftAQGXWyKACAqdxWBBiCnglzAgvohuZHXghGcvxAMzQdjzPYJhtdaiiyUPDQQHeklHuwHgogVLMvNAsfRSBNujLXljrDLQB",
		@"gtfXkSLiognRVDMniKCtMNKekbFOlvdiFxaEVyJiOZOEznqHhgaaZhPmKyRstSSGjwKAyNYETglbVojWxMLZlEqjyTcTWeSgBORtSozCxiWqyKVuawohJDewJrZFLRqcfY",
		@"cgdkGVBgIKrYZeeYpZvevYfDGjUqJwZqWWngAmdUEcSTUmRKeuRsqHsyXXPuPdQUxYXGHMGVyxGQqmClBdJREcTnMgPMeOoiFHrZAThoXvbaXHIMLJEhXXrHHMDVpxhDwtoayQZZxu",
		@"IiRtHFfOsJpsKTkIbHTgdOvDPxGmfXMsWpAIDkdVNEHSxoVUnXSlUsOZzvLoQdFAWPLLCzuWkbJoxLItsazzLcBWNLzQGHWCBmrAnUgQxceJkfbxRoIRwVDpdzzlfBInCYoMPgIaALFPraxzlySXK",
		@"PprAcmXtSItwYTWqjBnpbiSFnubFUjpEYNDGSakVAcBPQBMUkPkcJgbrWGmXvtxVFVzjPtvUqGgdIGnwoFhOIHLimtrKyfnMpEEgEuKTtQabjnQOQWWJa",
		@"QvxSJXjVkeoHBDWFBpGIoCthXNLENZIiDNPkSfpYZWrRDkFCUBaAdEnHMMgKZqUmXcQBqjNRPdTSmNELMRkUiNUbCVcVuUxNZERZarMwbOYWLTWdqLjuuwPhjOOlgtWoRaiuDVyvxwNJoW",
		@"cTjkwlfiAjSVltIhlEbkZaKOkjBMwcnhDOuasryfDwWufBZCYGDzAuyswTbumUJbOPjCcgfihjIjeFHzSoVwyKuTYTMbDxxHBrNlemfMbHMPDXhPoAzXQ",
	];
	return MGrEaTlbfJtGGqpZ;
}

+ (nonnull NSDictionary *)aIoKlMCScG :(nonnull NSData *)rhqwEfinXHAJvASeb :(nonnull NSDictionary *)PMfmcpOJuUnzoVOT :(nonnull NSData *)aVHLAvTXed {
	NSDictionary *zHQTqfHwxk = @{
		@"LRWVayyOjSNb": @"bRSKSGJwDOsIeDUoEIFiIBSZPeDEfrxRIejRGoKIxiMfRGKzGsYhtYdQhrjnYLFIlMVlRFJsEmzANsAdeBNhTEllFvVNsVgZhYHx",
		@"bLDewzWstEueALJ": @"aeYHTGvKUXZZBvBAwkEmvOOxrdFDRsNUCTmnrKFmalnqPdkMnthrJQIQwztYdSalxzWYIrxjhpHYIvKAvemevonjJYCtoqNZYDzTQahBRyLwvdoECutRvltGH",
		@"fsPVslOicS": @"HYArbBlNekiKGPEgdYPAATtyOXHUYExSchcfuQrzHWQFDouytEaRAeQkeCSstcSXAExHYSQZSIeALBWexlhCtMHXQrczdnEWZZmBUhFosslxAGnotwKLECtBoOSlATfWZZmfFvAnasXaZU",
		@"qNSOihtNBWaSLws": @"LeZMKVCjcBzqKJftTTJFLyTztGxllfFJquqMZEyIKZIEhmVtcwVMtggvxZwlUrjlXJSQCeAWbyTgBRjPinaObJqOlHAcQVMefuXwjpENpxFfgPFncqsfCnyoeIgjpxilUvqMgsdKplcYGV",
		@"xfNTVUqYwTJyNU": @"rRpRHepDBhFVcgwnefEPiHIJnxqmQkFuhFfjyOjMuIXiepqlakBQglAZYwQhyhQeayKRFXbhrENnCjVhlQSzQDdORMazkVqSlzxAxW",
		@"IHCQrqPYHCzyiloutE": @"ptYwDwkNRQXAMtpOzJCOJxXUJpoovstjBvWfLbbWKzdRCxEuZgGXtDkxIlUJEjzDStiHMEGVhzcjZwZaTUMXinRjiHMREdPUHgwevPocMJaXlKqNYArTXZmitaKNwRuxJSxbmLxdoBHgIeFVZN",
		@"tXlsaSRrvpYYwBXma": @"jSTdfAoCOxrmWgxfwlQNGXGyQVuEnnpQUdvHhkdNSlSjMwNYAlFnmZugYRNoHxBTAmYtixlKWqLpPLWYvjwOnUDZJGrjdByjsApNlASjn",
		@"kSeeAwmCHH": @"JKqXxXDHpUrzSRzKWIIYpPEqLDJrXrQCPBxvGHTlUPnOGxAAKGXtgretMKbeuGmFjWWlzxFrnTSMUIoUnMjYTmNxIrMEipaPwsApONPTRiuecDkMVnyQfIpZR",
		@"fzroWzTwwMtWMulyZ": @"LTTNiEGyDOmjROLHJbvNDGlbvztQamazWEdBkihpvywqAQfjqCScPZnJtbOAFrkplNClNutLELaWZBinjzuZEUXOtAorviGciOWFEnCLClhVQCwhMdclBUrbXxQsKUGKzKe",
		@"mUawGmGoVpLhol": @"sMJuypYOPKUnuVfOaJjsCwTeUjVWTMvxQEaLyhQTBhvBlmOYeQxspDXRxUpqEyUxFPDMLTDWgTtLygtFknTUEkJqzSdVGMnrsmbaKZNDojcbzSuOqWLaFuGXBGjWdNaCAWQMgUCHpxnX",
		@"QgYgKtpKrICf": @"uSplywVGHKMhbGBsOdaRRAFXZzBfVOgaUSeQjdgDLfeSpwKVktiPOvBRMguwxCpZxlKAusrbxaRekAAzUBhbBhMGNxbWtIbIsjVoTYoyKTDfqacMKUFDDsxLfng",
		@"YPqEVeMXJr": @"KUsAlvfmEhMqitEIVPWmOxDrOaABCJYQHPLWRtjJJfJjDgBFSWsidTUzxZchoSGwVjhaDQkNcDkQblTgWdtfZqqwTRVVpRgNzqTSJctlEObn",
		@"IiTjGcvDfHREdEX": @"bYqnnDPlWpsfPKDNOEzLbhKXfWudPJVjLyPRhYCtMGKxlExWZZkCpsZUEhmLCSyXLmtMXqBYpLEqexjBkhrraCGyENZhSPFUqKRvvtTIxhhELEFzjjMironGMGuRtsRYuBIRKYFnxkAC",
	};
	return zHQTqfHwxk;
}

+ (nonnull NSData *)pnMEWXJKJzlCOV :(nonnull NSString *)tABiGPEYDi :(nonnull UIImage *)qkUucXrHGCjYiAPQsx {
	NSData *pKWvkrIHyPWaEo = [@"pTnjqPOAfzxSiNIoanVBSrpnQUemCnSshknpyJdxijgOSreYpOgpdhCWpdZCcsYPtMMQFZvTmWaXkeeqYlntGHRKmCkwubXYUIeFIPzjlZzFhSPAUtsQCMVnR" dataUsingEncoding:NSUTF8StringEncoding];
	return pKWvkrIHyPWaEo;
}

+ (nonnull NSDictionary *)OizFtbVeZUA :(nonnull NSArray *)gPRDTcTwtPGQlIcS {
	NSDictionary *HwFKGbkuMa = @{
		@"EkEHeyeEbaDC": @"CrlanbmnwHKqJJAcOqzpYxVNZCWhqRHbGjcmOuzMcmqvMLdtOLqLFSCGKFVxMslBPyvTuWvEzIKyeycfXKMTSDhqsbULsqctvnOVpkKGAeUCJW",
		@"DgGHeAxMTCXwD": @"LcnKnYxUXWEJHFEGUnQhPJPVYkeOCSjaTRUFEKPzWoksmxAdMWWNHsQhnPPNmqfVtcLoyyaXXCVwvybqzGPLgsnywVNUHruUXNuSKgKfpnMZmpzhugwf",
		@"wYrEWRfUyShviZBrPyB": @"KjsVIKDXfupxUlFcmQkOIvqMkhOggzAybLudsTyhApUzPWBmOSeQLzUPeLPqFJznDJMXYHNtPhqLOJNluqLIwFqgxHURFBwfNtXBLzXGtNEiEfRBbS",
		@"ATYuuBXVePnM": @"STJewBcaaCGoRyEUeGcRyznNVROVQdLtzApMSIlolmtVRgbhQaVQIuPenZLjVGYkixLwTFdTiYJHlJQyyxdMZNrEybnEjAYxxwntbMephMHrTKfOLehflZklX",
		@"lLLOfNapVEbJYkOuzg": @"DsvgDFFWFSHgFQoiYKiaQQLvDCSJLZdkPbIKYKTNdDBNjikWmzejbXsUpMMsmezMPCIMMNUGsMPSQxrGoCpyPBJZVpjtRGnwdhWWEHQBHoLMqmxzimkLmeY",
		@"VhVhrJWGyaYzv": @"OeFhEbllStZiVXwFBEaVWOjtQbeebSTbzpVeXWgDFkRqEStLWWGVBSXGCIUPTNelayqcxHFYuMGJjHXbalxITXTZQxFCGZCQocfBTwhkJj",
		@"zadyuYriytChsK": @"RuyyvZWWajuCtqigxRlaFeWiWjqUOWlOXkBRoYrAlosWylcVVWwIRYnkVvlSFKGIqFFymxwZJcYvDMRblyALyExWsVbhaTQEPAybCYfvkIgVpwhHCbVKCqpU",
		@"kGbTZQDFvrYlxqy": @"cZPpURwvSQzpSePHmFrdmNjwkVDJmElkmRZYeXomtnNCsVVdUFhzIAwBAdwHOKExymPEjJkFROfhfhbIGiQUwVtbSVfvHFofEHRTlivPBdNPzRmDlD",
		@"fDlnwcNlsbw": @"joXViCQtnJdxMHijhrhUTOmhxWaEbMKYVdsWNgaFiQTnOrowNBxUMeSeYGZjbKwHWZxlXKnoTUGowQxteBCLqbpPcvaGoDUjDULXSwgZBbVrLNgKcyKoQzJDGqHmaTxlsETBVGrmYvzYhKX",
		@"khQXFMaibGd": @"SUyEuTjRvtDtPVmOTMFajCveMsDeYHfoBAGJBhWpGusCqtXaSRJhPqrYhfQNBJwlUAfSiBkAmodOujPJPZGUoFfbAketLStTZdGN",
		@"fEcTUqMcOCTxHU": @"JJqrmNpOwsxdcxvkTSWsBfzdUfKUEvLGzUQfTYRllZqpKNzZXbJgYHFTSMCeKWbnpGDKjnBaAohNIalwviRiKyxVbAaBlDzWIxyHKu",
		@"sqsbkWwQywxMk": @"sNDcnAsKzlsknKZzypzVOcyBhvdkmCCtOoxSAClRtlluIGeJrBgzyPVGRAKmPBykKhUTGqqKpKGtGVxRKmpSoHLRqmLgatBFOciouuCxKHxxVzyhqaOgtAIYTTTNqNmqbsRTQH",
		@"ZijooUZEeniqT": @"SFTQvfxNDXPpIYGiekDeClMaFBRhOjzXWSsTFMakXFDtOQsICaJDyzKrIvTHItXeWegxxvQnAuBcQgfaWnYanCeZQhzYKbslsUQrwylMwttDgrdzsvFPnkeDSgkTMJAGRiVo",
		@"zXlOhJRPsE": @"AausqMpmyXoqCZwQpaZTxtYCWAOIJvnCWDIRZoZQGWiTalbMYtacDrlTOpNoasUASMztSJxAJgkFBlKJDlwjxlAcRWwbQYkdGIllEmVHQmfhkKlNNveWhvESayTAbsdJzAQOUVARcbIR",
		@"sdeIFAPDBK": @"XQWZRgNmOmbHEwdOPuLEquhGKuIxtzmVOpeTRJkimWyvLfMnUhnLqTgrgsnyfJfxKkgTknHeiiiNNXgmiixSyONyXDPGlogLaqXJKitBTWjOn",
		@"EPPcgBcGQJgrHu": @"rMbmmJkugBXeaKOMMtyoSGdugdtqYFZzWyvKkshBUjspSNzExUbinCYbFTSCYeEXObnBkhoJZsdwiwabEIqmIjzRVeZmycjuSRbkFSs",
		@"qYoepAUPgNZ": @"FeBnGbkeHyPjmlNzCgzCiVvcoGLMuEljjJTQGUiPopyuzDnhTfXDLUzFvcljXaTGDvGtomLFbNurpnaFYUwmqGdoLniEnbyKjJGnFmHuypkolYtoXYRTOtHAHcdTkEvJvrYJwenedkZcD",
		@"oxBchHpjmISEU": @"EvxoTmlNldFUXoItgZbNgNtbjFAnGkHKamshNdLBYhjnLTjefWpcAQlRPRdSrGtouOAqHfQzOxtYNFNSMRUsJxovQPdBdompVUJJndCAjOmrztDUoCwUFI",
		@"wpBRcyYdBOkD": @"OfXHgEYFUtmXktrvkgbpizNvQTYqsFGpTsXZrslubMbnTPKAbfdnjbmlrqEbFzMPUOQBuJvqDeAPZkUJTqfHNTYCSsJvYoRwQxjtFkQnrdPieonIdyGdThkqJqZPHxiYzzdtfkDgmWaNCfTKzJelM",
	};
	return HwFKGbkuMa;
}

+ (nonnull NSArray *)WsMYmfOKCVkgL :(nonnull NSString *)wHkwimVKCuDmMcYXO {
	NSArray *JBfnhLdEJqVJ = @[
		@"TnfOpYPASGDZgpnQNgetZxirBQLDAntlPhCaSytWQHUhmXloPauFteqYfBMbJOjaWnTbtvHAcfmnSekgKsyfdzqnJHrKBFrFMTtRpXAFwccTJsppLjYQSRsJmhxzzFVbFwwl",
		@"PcCsjABxNoDkrcCZAEmYKiffwZqjnAaYpwGfSyAvvoSeYzhyNegZhEafsffvgKfkVWzoTPPgzQnxxFfaCCRGEizptEvQGOsSJFFkjxeTSLSeXxrVakeLfTVTijxKu",
		@"QVaAARQyDQXgAfEuiWSdulpWbqoetzhNevgHqbndfoxKaMEOMrtdgfGaEOEsTGXjHhQnCcIVHXqcLmdHLLwgfOEkZpBXwkEWGeZHyiSDkkzBOLxuLIIdtMugFCFQaJJycVlriJCUK",
		@"GPkpVeyhoqQztcOBPMFVkuEagoSzKdtVCXzMHVccoRvdJXlrqBjyMGUQSpWwhZbLPlEFyXVtVCMsipzFISYLOLyxmszetUiriOsecdRirYXmWl",
		@"VSjnzSTwjajtqqKBmfrjyJUVopdZReLIMPAJaHlhSwFasKLQlSgqPKWGWkzoSkpxxpiQZRZrmxbMEzIVYCaBxlqEFuaQANMtesVbnPzhJbAQNmWCSkJKuexmzjgCr",
		@"INfOMhuACqBqXdNEsonNlbilnlWQApHwatdYKUauTaPoZGroVuvTNrtzPNMkyiGnBAkuKwYgKuRMniiRBEkLyWqkKNAQjwaKcCHDyCVKOhnMMbfhfcxmZRxpAjbinEpCwankaJDpW",
		@"tddLDgyhEpbvCXFmKwfAqOLdgARpfJmmHcpofJMecaDpnhuFsmspKWABeKDsfDdnpebCKOnRfSJlTpFOfogRaJwDtXHNywjTvSjjuiTmpXrNwfkcpJuwESs",
		@"pqnRwqjevUIWaYJqbdXvnZCgtwrJvQBvcDGYZXynzhdRMmTGsFGDIrHOKBjFOHpjXjEHaSCwZHlqGpkUpjjnpFuDLXmWuCWuIudWrcYdKmfHWEtriK",
		@"MirTGfzGNYVVCXMJkGVDLbMkPxQnAOHjRcpqPGGvOgNLFxqodpfDwnZcEcpaIKpgnJoYziDczoPEEaaFHUTdTwspDHJUafrWJVhFxmEccPaVeBhqV",
		@"xgmpwFNIbYEyVsiXBmtRIWARVOtRUnoFyCxCyDKHmJNMAzZFKdRCIQtylWFTuvcIGccNoUiHSmkuVJEYDmHiNuSzswvZzlWUcDiJDwdSvpttRVDvlXirNQCsQXsrOQISgWpNiIf",
		@"LPtHxSCNIwJEaYWKNXNWVMDeznhDcRbBVjERATKqPpvYBoDpJRQoERmHMwsWSOQnleAygPictiZjvJyMxJqyCNmjIwdLPzVSZfHlz",
	];
	return JBfnhLdEJqVJ;
}

+ (nonnull UIImage *)FSHaYZdZevXvv :(nonnull NSString *)iuklibVXQyyeF :(nonnull NSDictionary *)blbyifXbevhwUcgh :(nonnull NSArray *)YfWEcPtxMelTBszAmI {
	NSData *hqyTTqpwiIrnNs = [@"sHqbrGapgBlTvXWEUHSKpjniQTYPUcypefJAohagdWlkNqZfNQOwuaAKcrORVDDjqJNMuxlUHobKAdgFvKNQXadDnsJhapoNNTxrrmcrnvMKqyAMFeEGzv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pBMprSXKyYVGxGoWdlx = [UIImage imageWithData:hqyTTqpwiIrnNs];
	pBMprSXKyYVGxGoWdlx = [UIImage imageNamed:@"ZgWjFRcfzKcVNAzeYBDOynbEcCdUStjDYxjWOfzkSMAymEAsPwucCNWGTwdEkMmvmeWHmlIWABEHGfUfewzIQDTNfbPIesYnzOEMZqKVpnICGosRGiZhCIldDUgjMMVQ"];
	return pBMprSXKyYVGxGoWdlx;
}

- (void)updateCellWithAlertInfo:(EMAlertInfo *)alertInfo color:(UIColor *)color
{
    self.contentView.backgroundColor = color;
    self.titleLabel.text = alertInfo.alertName;
    self.remarkLabel.text = alertInfo.alertRemark;
    NSString *dateStr = [self formateDate:alertInfo.alertDate];
    NSString *resultStr = nil;
    switch (alertInfo.alertRepeatType) {
        case kEMAlertRepeatTypeNever:
            resultStr = dateStr;
            break;
            
        case kEMAlertRepeatTypeDay:
            resultStr = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"每天", nil),  [dateStr substringWithRange:NSMakeRange(6, 5)]];
            break;
    
        case kEMAlertRepeatTypeWeekday:
            resultStr = [NSString stringWithFormat:@"%@ %@ %@", NSLocalizedString(@"每周", nil), [self weekdayStringFromDate:alertInfo.alertDate], [dateStr substringWithRange:NSMakeRange(6, 5)]];
            break;
            
        case kEMAlertRepeatTypeMonth:
            resultStr = [NSString stringWithFormat:@"%@ %@ %@", NSLocalizedString(@"每月", nil), [dateStr substringWithRange:NSMakeRange(3, 2)], [dateStr substringWithRange:NSMakeRange(6, 5)]];
            break;
            
        default:
            break;
    }
    
    self.timeLabel.text = resultStr;
    
    if (alertInfo.isFinish) {
        self.tipsImageView.hidden = NO;
        if (alertInfo.isComplete) {
            self.tipsImageView.image = [UIImage imageNamed:@"alertComplete"];
        } else {
            self.tipsImageView.image = [UIImage imageNamed:@"alertFinish"];
        }
    } else {
        self.tipsImageView.hidden = YES;
    }
}


- (UIImageView *)tipsImageView
{
    if (!_tipsImageView) {
        _tipsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 42)];
        _tipsImageView.contentMode = UIViewContentModeScaleToFill;
    }

    return _tipsImageView;
}


- (UIView *)dividerView
{
    if (!_dividerView) {
        _dividerView = [[UIView alloc] init];
        _dividerView.backgroundColor = [EMTheme currentTheme].navBarBGColor;
    }

    return _dividerView;
}


- (NSString *)formateDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd HH:mm"];
    return [formatter stringFromDate:date];
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

@end
