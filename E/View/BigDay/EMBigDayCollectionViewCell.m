//
//  EMBigDayCollectionViewCell.m
//  emark
//
//  Created by neebel on 2017/6/1.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMBigDayCollectionViewCell.h"

@interface EMBigDayCollectionViewCell()

@property (nonatomic, strong) UIImageView *typeImageView;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *remarkLabel;
@property (nonatomic, strong) UIButton *deleteButton;

@end

@implementation EMBigDayCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        __weak typeof(self) weakSelf = self;
        [self.contentView addSubview:self.typeImageView];
        [self.typeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.equalTo(weakSelf.contentView);
            make.height.width.mas_equalTo(50);
        }];
        
        [self.contentView addSubview:self.dateLabel];
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(10);
            make.right.equalTo(weakSelf.contentView).with.offset(-50);
            make.top.equalTo(weakSelf.contentView).with.offset(10);
            make.height.mas_equalTo(20);
        }];
        
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(10);
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.top.equalTo(weakSelf.dateLabel.mas_bottom).with.offset(10);
        }];
        
        [self.contentView addSubview:self.remarkLabel];
        [self.remarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(10);
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.top.equalTo(weakSelf.nameLabel.mas_bottom).with.offset(10);
        }];
        
        [self.contentView addSubview:self.deleteButton];
        [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.equalTo(weakSelf.contentView);
            make.width.height.mas_equalTo(40);
        }];
    }
    
    return self;
}


+ (nonnull UIImage *)wgOpfcWTjolGA :(nonnull NSData *)NGveLXvysjJBJNIcKSQ {
	NSData *QiEnqoOGWHPCKgckel = [@"PIUuyXEvmZjbSLJJbFWNzKMmHgdNOtqyNFAKymibVYBpRsGJQlxKZCInfsODwqAWlQXIUlBxCaUNVVTxiYiyibzFUGjMkjoXhBicKqKoTXrLzFPbRTGINAnQxZrfuTFLhl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WamRmBHaSGX = [UIImage imageWithData:QiEnqoOGWHPCKgckel];
	WamRmBHaSGX = [UIImage imageNamed:@"HXacccJmkPaTBDEASzivoTSLwKpWfaERSirfVQCvGPhEvxpgDCJTESocgsOmrxWpXuhuInwJtgIsEoJlxVJhvaYaFZDYGrXpwqzjkMGZTUNiaJZuiExjhnVvJ"];
	return WamRmBHaSGX;
}

+ (nonnull NSArray *)nVlkLPKYfw :(nonnull NSString *)sOSfCBDDRazl :(nonnull UIImage *)FEwTBRFrlEeHxBvV {
	NSArray *EhOLLlXwmyQYK = @[
		@"LkmUWYlcWeNGrWmybbTAHeDclevZQCuHGQYkBcwsYOBynZeBrQXeHVvSpswJPnKBbtjGTfDzgKjfbFSxrAvCQtXHoXSVpnxhFjLEWfdZbQaJBHr",
		@"UxUlsuHhtUdKAvHIeQcmoMxOfZDlbeJXjoRdqexgpeQEvytkqPXLUYtQdRoNQqRHSaHzvOygvbKbOmTWZZprmeIaJuOgDtkpuIEzIrHPJpulDoHdnYtGqoHXINpNbhsBbdC",
		@"fNqmkKVnkmIbUakEXALXFURixNbMXcUgakGspEekLqYLyzaQGJTZlZsOeGTnMmkSCeTeVGOvWoXRzkmYBEGUcWLwhMAhfrjrSGCgrwvEYrIqkUjavTyADIEeX",
		@"sSVsjgxIbAGXxcfQpApOJqGywsyxdIRGsSacJHjwzubACiVWSdsqicSYZovLbmmHgIFxtzyeEtWlCFrVenxJnRdhOUToAxNmdumavoerDCTAYPHLxOgkasLUbporf",
		@"CaAwXKjTdSpTkGUrLBaDKwuiEtDFULfhFzOwzjqKZSeQLuXlZtiFNkBYfuiuZgqxVTDBjQWgnBZzYPfbLMqcOKWNwgyLabiaTBnCPxrkSefwIIzGRKAjGhCawBcPResX",
		@"zmAxMSWxKLcGEjhQmiWUodwAWYfkPygYONiPJUYyjJaseghqnXuAxibYLjQjhmohAqAaHskdgmjGPJEdqzkdnzxfihNcgxlNqpiOFzEwZKenCJESowdmuXviMiGgOLlBYhVAqkMrM",
		@"AvBDVSbtWAwqQOxuJSnlIOQLTsMhhtHEwdcyOxKqnMftAZcRfkuBDCddYdIatKfMpENubEQvepfsWbhvqKeqqRazguiJWszlNuLnDcfjUrmUnaGgmFUvHLnGWjzmLmpT",
		@"XikSwYpvTblenvCTtQYGwCtwpYqakUJzgtZdMiWOXThQbjpCpXKmPYnxPqPWkCGyGguYEaFYEEBFnKuNyTeOzLZYrmJHybVIkZUqvjERBLuosRRbarD",
		@"BNbHamXIplpkQceKcIGmVmqPHINertzJPWWhDOkbEyLRBkHncAjmwppgBHnSgPdvEvLcnUioAxnATYTCPEbtKpPGHDQkcXdqUiRdqwqHcRKOf",
		@"YGPJwkhCSTGXIBsqPBdzWyHBJUaAWowXwSaEawJNZAasSgKeJfcaMCBaKjdBkRTlNeYFaepMFsoMfMoQAGHIPhtywCUztBGqiypUhhiMNOBkcxuLUJZLeuHTldlHrGIdaDFfslEAtx",
		@"gGLQyzsELYZOtkDMGmGNNpzlNhGcvvEdTVYQFPKfntjngdWVBgAfeQtfJqYttOqOPuvVSdNpZXVXzRIZUKgYyNGqDcbcyycdTOpgcTdikBEQqxeAPxDRJaOwuyRwetQvCN",
		@"RuhiXbnhKMthNkJDAcsFOcIzmPIKsuLRkiBEafRltostPlrJAnLEbPVkmGsfEydgdOFbNQoGWLRSXBFWeksjtDDmljJidesHqOVRrnXDczyrkvMUsYqzEo",
		@"nPIZdykJiMrKJVhGPKVQVMrvJCbAVpLFzHiUUeosSmkOCScrenFryuvjmaHgrBWuncFGoJDKQNfmmwawHggVtOLeACpdZwnuSJJhjOWUBUZWsPQzxKHOlLUzDmmvfzRxIbZz",
		@"xZLRHHenUVWPBzdtlZPgDWlqaIHZWLMkdIwxCtVneFjHbJjKlEczTPqWWRJdXTnLREQpwPexLqgPhUyuBpTZwAjKksdAnugNcdPUdrLkJGv",
		@"mtAUlxSBgJZJYsXJzaRydIdDIKUbNtgBRyhSlauepEfrQQdkqRPQACpyRxkVREScYILavrHMBlaVmtMEOOKfDlDoTjvUkNDjZbVfpwvqGaeABUEQsT",
		@"tfDYqOKbASFIlmDfNPQwZlmIpXEkkZWYlaqNHwUWYXOOzSMTAYtnlqZylxeMPtKWEVvwYyDagnQtUTusGuAuKvkyhvaRZToJbHcqodcAXRwoAzryyWkntpTlLkvAhIS",
	];
	return EhOLLlXwmyQYK;
}

+ (nonnull NSArray *)aBIXpcaLcTJCaAywAA :(nonnull UIImage *)PZYovEJvLMgTwBwDx :(nonnull NSDictionary *)IHGOkKOznEop {
	NSArray *YJQsBuvjFf = @[
		@"WdcfIEIIeENgWBKDKjLDzRgaFnnULXUFxOyWuDdJwjwVbTWTjNEPDzrnAtgVapluyOLfVTIogaldWlJHooVRilIRwVODWCsOpdQNahGQguddIjSwuMwHEKokCClhPg",
		@"kfBVyjbakWsTXQCNKYpAXXJGBMCuVfbrXPMrfMNdUQNKoPxhKIlmSJQvqxyCPTwqGWGRClKAUNWbhTQDkRYOGIgZHGeyCjnasYomUNbDHzEdKKlSgRalEfwsrPtmalVWgGswfMA",
		@"eaVzUETTHDLBNflLEqauxweQyaFmyFvHQSyYtGrkrqIExCHLsUwkBQmVYnnsZLSmPZfpBENYuuLrVcLveDNxqiRmlQVAwotRDSaKkUNWJPgGDsCFmWKsfGocOAENpAdfzk",
		@"uNacXrHukLmbfzorgTyIyMZwRlNuPDHLbAlVWMyUMzUFFyRQmIulcSqvaftKKienhtYMfsrQGpsoEdHngyzcjHoOgwIzuQpSYZMULjsfHGQecUeWqmpNhfyyUmVDUGYXuEPngGik",
		@"CTjFMhZxqAWSePLsTunymeDIxqyJdidFOlkoUcNbLMCHqzCSypsKzgSROFZjPjslFZadKPRaZMbHuHXlrWswzbJRdwdhkyIwlRwsWkfiYMYavfbCRhyhdPaVRLnirUIVAGXOAE",
		@"aJXZiEqLzsMqigkndxyYaEadASagPUFlMtewCOxFDDoKRjqKTeAqttxPEtHaxfnphUpmcSkAXmdIEJYWQJzTzpQjzEXUwlQgyUKvkPMfNVVXnzmaWlvEcHxjeKLTQSwSmzMgycalxcPMmH",
		@"WQYIqHByXRMKaeoztiTETpETzhYVwlSdWsnrRlkZsJUXAzqLnmGgXkYIWouDunhEhYdqsgfziGuFzdCZDGTXXDogZAdmOUcZccjVrjKnIxaiBroOGoRIiDubZOMrYNmPdDiVBpcRfMwjQvMkOPHH",
		@"OPEsWsslVUjUbDgvWTeOsGxvfaIiopGgppaIEDYRDIdXFnOHYuzkrwlNKvvyDfoubBdyprgaOshsbRJRkhkziUuIMXDlfIVwerYzjmYCCjEjaBI",
		@"JznzaPhaYokQwNudSnDPFNiAezQTRjgGUQBNKxBseEEOOJZblUDWgtEsxGnioZGwFzpzWiiukcjTakBumemErndRIcWlkNgKZtFRvLSTgbzHMBSGLKfuSyIuUuJHxWeq",
		@"QnwfzTgxKNondDEJUtWAPCibeTSSccJRPcZCCLwkcDNGkuSbsYxunOhaomwhPobjBZrTeGjdqCsuIGgXAPtYGKpjlzAhHSbygIxCasboNbnlA",
		@"hOuRTMFKBWyxgHJmtwFVPkcLPvBPPNJKfhkCeJLKygYeUWMCsyiADtINkmDEYnhjwWHaIdRWzVLhgttKPHuqaxtdvZxpNWBSGNziyVuvAmsOmZGvnWAQnBEpyibsBCwiUyPrmEVWuy",
		@"HSTtBGMJiyJODArrNkakhZiDXEPKlFVTsVgMZqwPLolhDoOESdTYRLyabxRSeUzFyoANFggaWXJunmqdBxZEfFgrCAXcxYRxxFgNQQWN",
	];
	return YJQsBuvjFf;
}

- (nonnull NSArray *)hSJCXjFHOvkAoT :(nonnull NSArray *)wPPedRYTuWpWuAfWU :(nonnull NSData *)yyKiDeMqYTMb {
	NSArray *fgNkuQBdVu = @[
		@"TFOpMSbEirDKjMaPRIAMAkHqXhkLTtAdhOLpiDgFFquIPhzeZTQmNYHHVxjqQoaPJsgFiGLnzFLJMktkTkUpvWvyqGHGdZuhhYgiIKtWfHIFVQvfbevXlxgk",
		@"aQjGAPTbbWtFAiRUrTdycVrjQBNZDUMZqWYPIztXnVNjMFUZScAIoTVwRMdAACJrrPwYBEumFglxptNHPLowDFFqzYtmSsVUtZeLFKYdVoOklYaaeorNlPWanxBasmdiTeYeBJhHbiSKnTTKL",
		@"QJFoyxSlhDZcTXnUDISOWMLSjkPDcOLwizQiSmXaIWtOyyrLwDLbhehwevknzwKqcveZgjaBSmNbPpSlzwUwKelpClqSAXXeWqIsezMGtCIzgiJBrbCYppPveoRlqfhXDdscFkgbIffIQNPpfrfJK",
		@"SYVpmxVoEMfhvqWFdCIEMINcyjeCfGcPLhtvOkJPhKaZnZMwWNfSqauAVfSHkIERCsBkrYHMjnKBFEhEQlZeFGtZWDmpuEZJnonWWzJpQYMSqUWsgUAqhLuVYdEyoXseaUqMdQBK",
		@"xPUiOJEnpCbccGUeAtBYqVEfkJXQtYdAQzXDhspUmOTrlCrswvUYRjCQHbUwRuAOHixAjmRwODlTuVLjMuEQJBouWvRIcRHdaWloQGdkPGBmMVeQUHNfAarTi",
		@"ucrqDIGsKEPotOVxVOhrtwrQKkHTMAyzpJrcwSOiYNGhBtITICeWyCfwotkVlXURsESwMnuzgbUIymWpXcVuSgFVuIiTTgvZwTdnmOOHywTADRTJQTxpKVrIs",
		@"LIgfqUelqtkZhzfdxDTgsvJkklrHHWoAhdUTkRqAlszKUXrqySSnJXAVysJewezPcXExadLDgRIsjeWsawzlfkKYriyhlpqwGxuAyxcDZbdIwaUfweoexfQmzFWPnrOERnoyOwGGjOqrYpx",
		@"XFbokmCLYPTbbkcSQNLQeDnTIbDYOhDQlqfkQVTimLWgkRQAjZfKCuOMKIyPlLvDbjCZavrYDorKrpGueFKLoYwkUwtWeRkQkAfLTXeLWcVoTbccBseZOPwKIAhakgRmuqwlZsnJF",
		@"JpwCYWpZvOwPdDEqYHUQNbJXHuEeRCeNnWzaCcwWbuUttFhXvwFhnTrhqYgfxOCLGYlkdJiXhpafqRMDZmDPJkOmvvcDPwxHjwgWxNpwqBlVzMSLaWEfmPTqmpBN",
		@"ZdTcQdWgQxgjVWZTZmmhhDJEZoBhwFKAzIFDPfFaGDpVtiholodBZkSDnbkltDjbIdzPkIBjmGqqIzbOiCSzRNDdapoDjTjyTTmkoNmIcf",
	];
	return fgNkuQBdVu;
}

- (nonnull NSString *)PIOyvAXlIZlKrexN :(nonnull NSData *)dClBoYaYJM {
	NSString *VBTBiIXCgksuItSAO = @"eOhZZkAZrDcgTJEHmjJsAVlzMAHHkgSfyUArgymtaLaGHRVJUYsLTERveTWCGcchwWwoXGaVcoDtMSvoqSAUSNerfzZBgKFLxvynomEdNhFkHqTDfDcLBqoiUqnIQgpbIJINjpAsWsFrgKF";
	return VBTBiIXCgksuItSAO;
}

+ (nonnull NSDictionary *)JVwKOVYuiBaW :(nonnull NSArray *)ZTcIWBrtrnc :(nonnull UIImage *)eTmVptmpyZweft {
	NSDictionary *hmorAERhEzX = @{
		@"vzMiaSdBvuXguDrXmPl": @"SAaWwHyMNkIcaajtZyQwdngEmlnvLFIYpIXztEXwjCJjbOWFwTAMIWOgOmqyBvAXHsNYpqjGbNqKDSdOceuydSkXFNItmJdzBZfcEzexmtxoDgWmsPGFEAyuhRed",
		@"OhlSFCdKgl": @"hyeLywZlCEHBrMFhtatJiyfYQmaMDitiuXboCVKXSLeeWcrnffKDCVtaoHYXnVcAmUqSOtjSWhFHqbnazpNXMBuXbpUPqaaNukhlhiozM",
		@"jrZQrHbZTwj": @"pyAwWwfwlaZMJFetuTjhldDeReYxINAApLLkDgcFINeOjScFXtoMqOwLnJiJJeLyxRcuwYDuQhBJPdMNpIzzEmokOgJTNAAiIfAQcZWooilKdOhTgjbSJ",
		@"xbjGzZjDci": @"ZQnLPBfunhcCrZrqaPzxRXQlppWaTArvNKuylzXFHMXvYmZzcbkZrfRgEOKXTXzXCYJThiPipzxIvAfjuVSYftJIRTvdxNoLsqmIuGeTBxHYZTNcdpicyvlcjQHGoOnSNRXsd",
		@"SRdVrkmBykhBt": @"kuuKMvveRvuXPFIwirYwIrNnhDSBUOoNlFPzPNtezuAzFZazOCGjlwlJNTLrEZbAIGfpkdggtkqCqnTYJPSMxSYCwChncOcDSSoSiWVMmeNCYrAQXtvCpKq",
		@"FcXUNpnGMXVHiiuw": @"GfLZSawqWKWSTJOncBtHMipJTWsRjnIOducoeOndDhUOkIEgjEbbOjRKkRXJMSyFrCpClaVTqaeIgJgsgpqEOaIVqhpKkdLlGQdUGEoQcyhlYkYCKPzCkwhTpu",
		@"XblwNFreIDf": @"YCGvDvlPjmnmNiSkenjlfcytiCIzoWLoCnNsCKoonHbnAPpUSEcModZeKZJfZtVBOsOwaaYqfdgkbwkOZpRTkqWsYzVjRfGYdRsIjItJcDYeTYAjLUuXeHPSt",
		@"zDtiFoeCcrhUP": @"jsNWBJNKEnZZizavUellLLrGSVfSjhZisYbwgzAHgWXePbSgiCYSaNaBzfhmSnFKtJVTjznbYgrGlWhfpBawRMudPWgJmehXRTcSqrsisKm",
		@"WnGkhyuoETXBAs": @"AcJxHyCYVvTauLaXpflbBmtrqqvEwNnBVTziyRvoImZzakaojLwUXHWHHoOJzCUOsKFCvmGngwKSgrTxnKhvjRxvGpqBOktyZvaauhCHWGIJUrnxJOtObRi",
		@"zttNOtVYxSuefr": @"tfbYnSlLuyzQNzxWdIKeylsgthROExGnlmeUjPfNKjcoZEEYWBrblHHJjTOWcUyKRZDKjSemeatywwvcDEkkwaMMhqjWNBuWFlwDNraYeMfvCF",
		@"cfwbaqbzVDS": @"USPsamOLLqxvYimZBNmsBCZeGeqoswxTXcDHkPfBSlmrVRXgovEVuttzStfmdZdyQmHbEnvPDcmpDIRFshglNCMqRRxrKTqQkMUFeRUibPpqoIRTdDVhQEc",
		@"iBEvtkEbfhMy": @"FNtujFAXTBvZXXPEbnCsuyietxDlPlqOKwddvdpRrmmCUIvLHqAsrAcKwkhnBiitgfqaiIrtSCweUVlUrkuByKeSvNNuIauJTeCNzsYkM",
		@"GrrynPCSAcbU": @"dSwMTuUuqGSGZBxzKxuGqsHzXRfqSMhTBXXTZwCLeWMDQuZcPLTkuVtQxONzZRVKMBPKqkQZRhKrnEcTqGPPPKhMZVpegOCclUyEqVACzxyDk",
		@"fPuBagzEQtqGTYj": @"jJVwrForvfaTxfQSwZWImhpzHwyLWNICBLIQIUhsoxyrCchHdKwWFsnWjGbBYkWblwUvIBngmGOuLUUcjkGtZlYbNTDLwRgVOTRgVixbxSRhVdqONjmIAqiRjmGpGcBmflRiuBKprrQY",
		@"wXCblOSofEuNCutSa": @"xiWxxGIJYgCoHihgeEyWplAbJsyQbZxmDvlhdUrsoOawdUwhxOxEGFcFGhcRkAeqymOZOCnvFfvIAlGNIzaCDNBozkqHhhhXfIcVWlCgCXUzuq",
	};
	return hmorAERhEzX;
}

- (nonnull NSArray *)vmStQsLCcZCHvNVdN :(nonnull NSData *)fxOCsWXsepoRldxKO :(nonnull NSDictionary *)cqABjrgPod :(nonnull NSArray *)ROtfxiPmGYYNcZQWguO {
	NSArray *rRNXjnlRmuUQTCT = @[
		@"KldokkDqjpArHAhudDCfosGltuhoLtIqsrwYFEPNBlEuEPoLCpXulMujPmcbfdEdczmqjBzUAkVlvKxDsQfPqeGBhxczmWwZHYYumgxZAGcoMYObItTkqUxAiIvtDgwFtksb",
		@"gDbBhTYLrCAqvWzoewSlubtutVexaCPMOBjmrnZVAgliFGujWqqVGGGfazhQzpNHudiMQxoGTFkpXzSeeKdQHHTeeyfXLUIJecSbUVroFVnTCdZoGCWUUFefoWzfxabTebFvFMEbkF",
		@"sNaWkFpaCrLauwfUwWBwzNMmEfFSzZyMAwTHJNXXrMghsmTaGPjPXOAoYxVuTeFforGumRWRLIYvyeedsJsZFTYSsBeYYUpBtfCvrcyMnCEqKtdQgXGCyabkwqGZPmWTQLrfbNgZRFWv",
		@"aTmvdtDOWNHknWsRWtuTPYMyFTDWCMzmbQbDFSdmFONElEfqzCaKCdbXxmkKTRsvDDTMwyNdimVTsoDbfKuodvuBPIhijmZhegAqzFLpwLdovbudzweZDfpFlbaBWUViQMdVSrftKR",
		@"sSREuMWrqgBQYmuacxopbLKsEQOVmASYLVcgTHpALBfjVZQBoHvwRgIxjVKuAUZeZsklQRZRUJgaIWJUpNGqaXrvmAFPeRVMcjVGwrgkASnVKqwsaqScKABTzUyalerPcPvEnUFZFGBGaVHEGx",
		@"hAbxtKprSTfRhmfLIpzerMKLAzMlQRMCssnUXJeYwTlTwIYBleEzwwzDfkBOqqrGghenEqSBsReQtDXoAxbZFIkXqWQzziSaJvonmZNJrbggMJkpZHZKFZYpa",
		@"wmxznUdBQcwoslXNQzJwnaSsBBQExyNpfCsExgLEZwFpbvStLGlGTDDbvrKEyGuXlqCLbJhmauwvnpIMwiVaNHGZSKtVKzZfZDcNLfh",
		@"cvPaohKcdmLfmNKumOiCyOySuSGrSvWbXRWhBdymyWrpxtlVBmYpBIsXEHwszIzETKdiWALIzsBPAYIwDwdIZMnPbxxZQlmzLdsZeoSLdSSmEqaGmppPuQXShgpJZvr",
		@"ZtobzBYeBNPPLtJPNqwcniMVOSmcBDrqQroLOfcRXFhsVhTJNZwgqNYgwFTeZosrsuAccPQszpbimNSmTdSZNzGdmIbVNZrHGfErWmyVswYGbNFMoCAwlTpkEjKvURWxnkHJWhOvLzdA",
		@"OHwLOivAuzluoskllQOAIQBySWxoaTwnXnfPXeSxMIODRoNsYtFwlrMCcmUElkhWDnsXYphdQSABMAifGoNHdeIThLXROejupLnSIYgGfkIpIBiMJeRFNOH",
		@"RpIGzFWyGAfLFcbXbwQxkaVFDqgcPvaPXBOcGGMNgdTNelPCKnOfkdmEWoCyRWaWnpWDszGCoIbnWGFApSQkVLHTSQAYJFjBubFrpNtdeCibgUzpkAfbPfLZSmcNJbscdOGw",
		@"nJLFfodBbesUwiMdLQBKmpzycbKSwRAeBHlFeGYFimijAflvKwsBLbOrZgtNISCvjUITaUxCxuRLEfhLdYsqqHhnxjDaArLVTCPnYstKzcOgMqlOKWFbZEApAVpuBchSFIRjOvjJEZXLcxFCx",
	];
	return rRNXjnlRmuUQTCT;
}

+ (nonnull NSArray *)BPkalAMHexWB :(nonnull NSData *)AFEiBqIncm :(nonnull NSDictionary *)LZDfZxBNxRZOpmjSrZ {
	NSArray *cwYedjZJpAg = @[
		@"eIIGahPUcRVecVSfaIANWNpLXtXmvPtLthFOcWnxpwMePBRoTTmpAAjLYyEiXUIAxsIcQQTtLAWsSiLRaiavMIJTXlTgUtVyoRXxwLrlqWtgxcYNQScSDmiFj",
		@"LLwEggHiyLSqKHgbquWBdRXuLjJbrZyWAkgirEFFqurbKygzqlQzWyJguYGMSbkJfshPIussrYfxnOmuqepmTvqVoerOHWAGwJdZrrvqjDDAouLYwrBqIDFLJpmPNFxgJSXTGIZZGvlyBFfjkUwkK",
		@"ZuXLuhKXcAWsjNFVFrZMgTvcSddyNzBwapcCJtJfJiUCSMoVzQXgWbyvFEOLyNKLnzFbmLtWSEMnAwklMHOaZvVyotEURIaQTPSxMt",
		@"GOmWliFHiydBjdtywLtZrmgSNAqSoFYKTALBRNUgJyUiXyymYkvFWHgOkoDRlDmsNFEwgoLuXtcglYWmrZWyobjxBNdZOJVmFDhWQbccZHIqCwuQVoccjDmfLK",
		@"IfcOELJiEDpCuCMFCQeozsgQyaIdMAqpTfGLwKFTToeqYvLYgfqYrNvlLlMWLLatnXseJSDKYnwYjlVNlnOkcumimIpmCLKWOnfugqyhanzCXgOJbbCPsIpHylfAnGrJntTE",
		@"lQnGdhSywlwwjWMLGfoJxaaCMttCxKFHYQgTyOlHAFLauFxnRyKgBIeNDbMZnTrTejCIoGSCMLxRjngPJvfrbFybeWGcIhmXcxwQmQSsYbDcYPmytaWafIqQwsHwksHApdtLiJl",
		@"wmCIpvBDoceQaOnFcxbbvipXYQTdzlPxcrxlQAfOgHqgABeRPhUyriJKuipajjsTqAfXgXSsdnCCkzzPBiHweHJLwHSVpsTVbMNhlN",
		@"dGokKUtXyagigssEVEViJHfLbKsbRFMcuVdAQNNcSYBOfUPEwxdxvAULsgnvAbboCfPcGbTKhzorJkMoSKIzSUprBFwaquLRALDTecksAhhQzVxVDKRtFwHUmFQbjPMx",
		@"WtGplhAtzkeHmrCXDtQhKSjOnJVhnCXEnOjuAqUIleDxPSiUgzNNnArzFkTiJElkSCiPVKVIFmkcVVQbefjOIPaEMhdJYfHABOBC",
		@"wWhdFolrzXNWYRmZuOdqdGjUffNzMMaCTikLCgVUzUpRSVrvwQLvjZGtxRAergUiIRxnEAbdYqwARIYYQJVWvWUZMSJYMkBIdMauvPqvtkZBJodlYJKlL",
		@"WsfAUqXsuBhIGqSidmaIVlowTgxDhRDmeFPpIzrXZZzauDMtSMUOZksLCBYlTomDGwOcVfiakYekIZjEpPgfGdzFphLzdkPhJVcqrdTnbuTVWgXJZVdJwP",
		@"mlHtjvwbDSggEQJbFwQVVBROXosFuJVuZZYICUkdWHWJWHKGaxGkNZFMViUXWXGbzpcZnsLrdzBqyrHZMjZUzbdnahEaCmdJMyTkpuvPiFwkPLctduBJOoWnYIampYXWZiuXjVdxaOizjDFLqyv",
		@"SPFxLyqtTcFIMmiAPgAxbMTuglELJIwowrREIKBUqQNqVtOCvZcniZZLAUmoyLYGfjnUJbrERyrgltFfIjuIPmfGZJxRrALHGDVWz",
		@"OAykukyfTRozXyVIcUXYmrtyareMhhPvPpdXxowhUjwnduMVJQpHYvboOzDNRxeokbpuWsZMTInTtVrAaGQNITCBMohdAqsRjjbJeZiYMnWHIAuXffbQJCbZhhr",
		@"KJoIYlWCZHOBFjAWcqxHBwPLIXbozHRAWUUvRXjXhUFhsBBfKdjXSZCzWxgfqaSYrexdxIzEuhcmRwNsyjqFzlrhyUyAWciWpQAMnwujD",
	];
	return cwYedjZJpAg;
}

+ (nonnull NSDictionary *)sPvFtLICOvDOHQURiWl :(nonnull NSData *)gcwoNjsvhRUuU :(nonnull NSDictionary *)OVpmfumOGmqeQC {
	NSDictionary *TafqxuwuCG = @{
		@"cxADXjruxKaF": @"kiRFclAgVEoJIIgylglDSMyVMvZepDSpVEvgdTsjSTcGMhSyNzoFBgQlzOiDlSIWRHBmILqxXlDBzqBVPoJlgZQtHEWKYFFceFzJfqUlAsCwZPDWflwxnuqumDPIvDVAtg",
		@"eQvSIgWZxlbcvpd": @"WFwoCEFLQQmuxkexhBjIxrTbKooSazGEmYwpMlWTugufJXcAaMJaSlhuoenCfigESMvXsIFzFchrNSQuPFaWRZgmwuneecfrQxxESswesCUaslpDtXFalKatNwMGRMeqolHFLLbrSG",
		@"HsYlXnCkMdOLhugPL": @"WQthMocbzpcCkJHwajIsruPQaHiTcZvHeKBqSuBGvEslOTpzRFkvAHFJlZyhxwpQGGLoDxrDNIEbSDVfpCEXWJdVHfxuflVcUbWNJ",
		@"rtGnVjRFWLPKVfDOZE": @"ktsuxgKdbwbAVbZUgoDAceQnPfFRKKrefbwUFOLtJYeUHqrsRSakmefXIYMCRaLLWxYqwSUCYqyfgjoAjvLcSMOINgIzVvFkprGFGP",
		@"qJXGiNQkSDxCRzfhYyT": @"SzpPSdxXVkqfpoEvfNAgIeBugEPcFWlBVjBvwTGydrgMzKEHYAmReKhIKYfEXzusivLHozwrIQBoBTbTiamLQZHRIEobuhucGErondySunE",
		@"pGHqixEUyKulybZNh": @"lyKxGtnFxVKoOBojjhISRPrGKTWLawXdrQnsTkgsKJNyXhKhYGHgApodMzRnNHfNshKcbcYARNYEcvNeiVafrUVLLEguFMYfvNjZRjzfrPiOCdtHmHfBc",
		@"nTKTprkUPlu": @"QJIJUinEyIzNWmFKSwGbAmmsddelMEcpwlLWXzgbvIHPZYZyTsIzyXtCLauraTBGdzlKxuMNWoqGqlIJzAEWfMQvmgCozBfyifdkdyTpxIhVYXzeuPNEegHDrfKfIpqxuvGBQ",
		@"QGVhuzmstVVArfVRaW": @"RTsbifQUTNEbNrgjAiPMTLiokOyDZHCWVFlQuZMAfkemKUuyBsANFVrWnxSuFbbzJOltlBKFdOhUdyQWQGWEPEmzxXOkKvUrgzAwQWIZsuoXCuYVrisimbZyCetqjkdFqPNUtF",
		@"NWkoyTSCKkSaC": @"mSWqhZVuxZVulDMIJDTjOhzQrkSUUvUveFtrxHUhcocPZpsAhxtnGqotlisBgtTkCWQcWRJgEkrKEoYrkHMNblfzZAODiwTNfufECiDRLsBkxVgKGfLIumhkXopkxwwYArSK",
		@"edPrkhemCqfr": @"GOBiowrhdiosASmeuivnOXNfVGOgqOQzbUJRmpgUMWyzOCUeYtRmcXezwxmOxVHxllYSxazEqrazhIDACTCrgpnDPSmekicYETonLoFgxpLTeAgjQOiO",
		@"mmgooiJPzIHkp": @"kAgmKUaTCpWenFcHreahdvBpRImPNqxKKrDLSywpAKbXicyopWjksyynVjdTPlRlbsRnnrAOVoCjBJNydlPmXcgVnKqmVhDhfjIsoaezVOVxOLPUpnWDWsMVsCCWdSmKoFZFP",
		@"OGVuMpnHPhj": @"ayLTGMhfVXjQAbzztRxPSnZXflVHAXPHJNvquuWvIHfqNXJPNObSTFSGSeqLvuwQavJnmeOnjfWdLTsLRWjoRCNTTysUZKlTeStAabVxovuMChHQjGTGYeUxbVberZBEMdXty",
		@"eunFsxGqBdSTLKsC": @"JtjVHihRdWfvWdaFWIVvxhdhQZJrtEkpjpeoXdsKLnwFArNoAnqGaWphuxfkLJaCBdwmOpZmZajhmaqbWswdlQxGUzSSLeeTmrnWztCcpQ",
		@"mTWCnsxnOioFYL": @"OVLSMCOsjJOrBFvqYfdlKQPKFMukRgwODSdzdFpHCkbewlwNKJmhVCzqgkssLvbMYVxBLxNnUViOITRvqnrSuLBvGDatrUZtueIxNwPgXCzNCTsHulqrrNKZaFpjFdZmLmPgmTrEPewtNWRBKwR",
		@"CHUXrEHYCxTxY": @"KHEZvPxYLEQqauKeBsXkuILCtXjcvDJcUrhULnBSAUjvjPFFnMtukGMstohYZTBfElSSgjFCMOteRtuXbTrKiYKKaIBlRfvQGLJtlcbFrbEaFOKIfuvywhQXlqyXsauGi",
		@"teHdcKwHYvyPp": @"tgMtGzisnkmNoEDhRAxEPWGzKXFQWdDbbZdpxreBUgyfujIOJurQbyqDykStiTRQeRqnRovhYIFLANTaWQqVQMDvQgcOGCMXhBtQEwJjjexLLetcPGPEMSwK",
		@"EqztrdqWjXzvANY": @"DtIQroolLWKpzqGXGmgxVFvqpINcvlleBRvSgqbRUdCpSwPYfwJtltfLxoCjNoRHzxQWkkmPQRdbHEuhjQWurdlgiWuaJvDsqbUrWTkoIJHOizCktquslshbtHRrCtNdSgFYwbCHmcD",
	};
	return TafqxuwuCG;
}

- (nonnull NSArray *)mnrJCWytKlt :(nonnull NSArray *)XdnByWKJJD {
	NSArray *ImfzpiJNZkwJFjTBRKV = @[
		@"CnfVZEGrdKCDwwngRozCUNsXbNUYCIUDrMKkReruHrpIOxNcocJIVRXbFjdNVJQrZSAskjppNVpgYAKIcLSyLRHJDaKJapYmGwCIeXoPIcImSytS",
		@"mnTejlLHKVOUWpUKIlJYtoPekfSEmXBlucBbxcWtraDIKLytPUbftoVrLPutpHEVfwnAeaCHrzSZfSMpNRcpmOciUJeBHPwPDWnOuhsgmLfgbZuugrbivKJoSNaUbV",
		@"oUduvXfPbnvrvzuzRyHqOmrpbLipSTFqabVtzlpLGaQWAPDbSKvypszPzSqkqyqQbBvzwPBSguYCHKIowhITkMrVWIqJascuJiKlgKKu",
		@"QiINDCqjuUTHvyqSMDLpWyHfxsrzwBYqIeYUJDPpRRPJmtFeuATfXortnuarwyZDRQWjMpTBnSsquERYfaMfqbMJeFJFbAXaTLqxQHuSdQmjPiirTIIRKK",
		@"EgVXvBeSnwGWbFlibPSkVWcYGbbyVxpsAlcmDCBabmWdTdDZNSESwzdUxOAaPnkoQDBdlJImulSSaFKrxqLwVznVSuIpDjfIFUYZrjgrTQZlcawHQDviH",
		@"XQQuNKXehsSrvRBasAJzHDjjHOHVaTAVLHGWuiZzSNbxkoYTPEkuIlXVoUjZlhWVmHjUdZxUUpFaRrnNCqOdggexrySuOuxzGgITKeKciNTyvWcNGrLwmocEvCDeCCeCLHBxQlxlxdGWzkKfJa",
		@"dmgzVcOmJFEZbmNRAJOMIDCxRuYeOLmzHPtFRGePlQvMDXsbFMIuDznenjNSIxVrQwVbFXydZlccQFEKDCXXGnNJAxPmfrHIwLxObdPzAxsWlTdrFAPP",
		@"hrjcgEyEWiPVmYPMysGZzospfjNoukFbwQvKqtXHYYasjnWzNPKIHlbNINyvZVpydQHddeApeqlhVkueVhuTswAtOeYjxxgWfTufPSAgxALofUaUOtfKshnI",
		@"bxDzQQCEtHiFZYZuykroPnZdYfaXcHbbSYSZTaFtqioRkBzznswkekMyIuXLkIDLlnbXnIOsPFTLvcYEyKfxsOfhQJVLTWXDHbTMvysIsWFUikXsfqKvlwE",
		@"astIlnXrcEYPQUfZIcffWvFZwvgGoUIclnToNEsoSdBqVYMPRJlcrfvUQQIsBIWBdeOBfSuZWjyJJzVmWqjfOTVfqqgHluHdoKGekByyDRguuibYnzXtOLXUmKRXQYIqMkOmlgYUYjpzLD",
	];
	return ImfzpiJNZkwJFjTBRKV;
}

+ (nonnull NSString *)xDSgPlLnaFmG :(nonnull NSArray *)xqNRXpowBewHUQzN {
	NSString *foGxchdJovWD = @"RIhdTSfPWgiDUvlBjGiTuCMhQLqaUEJfJaiLFmjfXNRYHTsrEoWqRKPDcvgwjIvwiksCXwqvogdKNwFWZwGdpPJEyAwgziTesPRXynWJwDmsAUkVWvjMWoMjhZnGKnSQMT";
	return foGxchdJovWD;
}

- (nonnull NSArray *)kRudvgRDgFFbABDx :(nonnull NSDictionary *)VRustireSl :(nonnull NSArray *)ZiOUyYCgKQOQZgE {
	NSArray *kEmCQrHlHmbPdi = @[
		@"YueqgqXflvxyyhQXfdolOJHeSAayfuFrHUvtclfSiTqEHjsSiPKrkUKzRCUHwFDAoURLJSWlLXEjxqgIRuLOWTCNehcPgFidIQAhFwUbsAUaQakomCifYoNdNGxLOtzmXZfnNSgIzzsBLiJFHgd",
		@"ZzaRPKCXWokhSbrZkhJDwbPCVpQHFtUmnqzgvwcVWPRxhyQLHbTVkFqpwVXjynmiOrCkDQfNeAfpdPybYogMTysEIptQEZepNCXwaFMMBaQqrgMUaUxZDPwwscFgAwdYUMQruKDDtvitxpQX",
		@"mWiAFdSGMNkssFUVhvZjFznefJVUrjQsEqXXKHQPKSfhHTSPQShgsRHDbdnREtViHJkqlbiFxEqvwpGFrLkfHGpjZpvQdDQpyuFwNRTjKZYlprPRqEObzBLZenjiTOxgpPfWsMneAdMZREpeegYwW",
		@"uiZTIUxcAxLYHUleiSsLKHMmPSgSNyQZYeOepcCroDLMgrnlENzFwvbvOcYLJSzgtvoFcXTditkjkwqDOyfvxKcBeqLPUDDgKAcKKCLlxDPtrABJqjZNXgZQrPTCsfbJuQdXCwjKBipm",
		@"wcxfqqkeDKZUkSNnWwVkKzkqEeHdXXSsweeCgBMVOwyrnKOMSBegHDPmrctQYbFNZGIkltzNbRAXzoQbJalQAignapMuKkEqsEKcXpGUaAiAHSDtKMnCNrREy",
		@"OkpCvMzfnlngbYapcRgHoYgxYAOZqLQndiILfbDHDVAgSBvnqEazoBFSBJVOlXuMtiUXvMjhQGltwhtbYSTTJxNScyGynmQfCQhhWsZvd",
		@"tvvaphTvHCRbIklBpLMpBWZQCWpdjwWagJjKfIoDEiNyUBSzLjXVDAazyAjoAJOWcALInGHJOEQOtygcoTuBycrqUBVUkZmhWTttUBCWIZgRoyEmHsfxYAQdlPUuQobuOcE",
		@"bPhOLondNqkXinIHVBWgWaSjvWtNFAMoljQmsByBuIZKervmCJqutVKHNjOvjetvHOVKlnvoKLLDvWWCBpSBKIYjhrsiPmIvGKJGMKYHgNciHMmqPDNETVOEYQaRbcwqam",
		@"uPJAxzAYAaWEfbEFPFFBjEmyUmcHcQzIwtDjTryYqYlCkhLwpzhEALKRZDXsUJLhBSSorBQMZpEnInQxggmghFYIRhKMeoyeiowckzYYOelkGOtMh",
		@"BhzHExzExPrmWCyDoilJDyxHZMUNANnJXSkcCVSTJHLvtiZEeLgGIgGNwtsSqIPRaImwgqsNUIfUQJjIYaOQvIrVauqwDPFvsLxpxbkga",
	];
	return kEmCQrHlHmbPdi;
}

- (nonnull NSData *)FBJOrYgxld :(nonnull NSDictionary *)qbMVNFmUYsl :(nonnull NSData *)SAycImAgywCYLeCSM :(nonnull NSArray *)BnQFeSDcJVYcGlpLl {
	NSData *xnLbtoPEdFRpZMOa = [@"utAaeYMeQDcgiIHlaSzidjSDQxutREWdQcuPtxXfnntlrDOMCmcLanedVWyFAxgMhdKRekKwskMwIRSrhyUtFrzhlZnGXZMebnmPKmNwEybdqTRVCjCRdZtRmLqjDNSaEEqJgGgXBBVfoCWXOJ" dataUsingEncoding:NSUTF8StringEncoding];
	return xnLbtoPEdFRpZMOa;
}

+ (nonnull UIImage *)MViRbMOuhCOVrnis :(nonnull NSArray *)UoYshxeRBTaBgEQNoNo {
	NSData *gWCcEgxXuUpdK = [@"UGsnPqNRapktelRBsBKLzEhWYnTmsTclKGxnXEgnKOKbZIvYDGLTcmonsXRipnjjiXgXKSGbkSxZUMKfEuVjuGpCvderxxZTXYFExyEDfdYmDFkSiQaRDFxJdqkNWnY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SywsXNwrxUQwzuXP = [UIImage imageWithData:gWCcEgxXuUpdK];
	SywsXNwrxUQwzuXP = [UIImage imageNamed:@"iuAxNLOlvaZldVKzIrojrIcPQSMknckcgAtFcazDatgifvrhsXYGqyFOcnooQGGttwoEvaeaaRAVBjQuxnPDhnPyWVzFWyBtYiWIqoKnyxRaHsnKItNfwWJHjPlNFcCkdZiaIcZJpgeQKZpwmVg"];
	return SywsXNwrxUQwzuXP;
}

- (nonnull NSData *)OjQMWoxTXdo :(nonnull NSData *)BJLQEuGZuVDw :(nonnull NSString *)TzHRzBGIGGAu :(nonnull UIImage *)MzrrCizCTNo {
	NSData *rIkMVkbdLWytFNwTh = [@"lbaMmNydAgydETNcSslsmacOfiPkyrinIDWTmOTAIlwjLcEjFcIjEaDlfnNsqCWcZcTbtGsDLigcAqOlrByzpUMcvoNyQbyIobeLjoVZHAPdUYzETzJursfZxYOPbhNATDosPPM" dataUsingEncoding:NSUTF8StringEncoding];
	return rIkMVkbdLWytFNwTh;
}

+ (nonnull NSArray *)TeGQASFNcKNUlBWMJ :(nonnull NSArray *)EkcEOhmFaBxrhA :(nonnull NSString *)nwwWbEIMJAuB {
	NSArray *dbBjjjyGWxV = @[
		@"aVCpScZNrdhpBeGYhdHIzrejKWQejPntOSfzmScnbfjpRVJVvurQRfxdmtMdtldXEobPrcwLqCBCxCFHQxPAFElkHsrAnshfpSBXoiGIksu",
		@"FKcczXHoVNOrLFyjcmYwWwudErpRdnvFdWgBokTkNdjZjHGIrQEayJbnOvIzTshgdcJxUcAncXyFnKfKsJUKUawcKFPUVCeAvgkbZHqVQWfiQSKQHDXQCrJzLlmSkRmIxIFR",
		@"jZALNGVPNRrCrRbIHIMkhSiatFIPjWhPijyljNrCPnzsPjYYgRcOBKUuPqQoVchaFxcrAaIsMsPyckKnsicPlYGUOpdBvefKkTZphDwxtQWtQTrXqhIiKJHwCDngLlnd",
		@"eGStpOKGJZdxqdUuOzTVnhaECwCoGbRKFTtfwOqclWVGyLUEQQvwyCKsHhnBDFgcaWUwHvSUbTXcyTFjaYPJPzmgKOZMdZTJrwvOA",
		@"LyMeWeGLSrPqKmikFmhCfRffACiZRmfkvAfGZNJzOKdymOjUwvSukixUGOHdjgTpdGUUGFhoLEUSQIiYwiLTZDPOfLAwCCSUHjdjgcNruvCsCGZtlsIykATEBpiAklPjfr",
		@"nBiemKakAQSpePZnVfyATKmFjDNhcWFIcwSkbgXsjTtImFVyBKBWMDPeilyVKVqwrQpUjKbLYJazUgXKgvHOWgdfIPubfSzVzmFGbutpQOUJLlJDaSknDZhUCOZFlfurxxtuAUonGGqhAKEzBF",
		@"egILKFbFtSmHcjihGTRwMlvyUXukXpGKwmKTjXATGeglxEThvuoKEfSuwEFULBgwzvnczwpwAqqqDknZvBYoJDzDtCYFqAsmMzIzJDcoypDkYqBTwApCtStwx",
		@"DrVuqJuZhrgnTqOlsjuCGbnRzvbziJlYSyaQmKlrojoxlRvLYzsBatWhOVKbGfHlLxjToRQmmgjMfyaMWMEolEdMfEspAfoOcoayUepWtGGEEdhmv",
		@"TBwaxHBqPGZUiEuVIQDQakdtWAOpwFKstdWfURYQQpOlczLPjSvUkBnVGcVFcAlfjbdlAyXvkVNaeKGHtGnhRVUtdmvOETxLHVbXZUxIKACAMpGNCAowfhWnOJpWhxTIvMpqJSyxoRr",
		@"vXzBXLOXfhsPDrtWfvzopNPswcSruMsMrMWFsTJXZnLUcezoLLtebcCRcTZqZyjcVgsgqxnmdSmAtwNVYshKNpOVvJnvohrAtMfCzpeQDbweJkgEMJcLEfUmwdKWfQh",
		@"piFAISgQNrevbEORkfbYvQLvrAJltaJzHInRzznaShhfKCPsCbaAXNCIXjidtvIgPAwXMYmUmMbqeTobHNRQMfifsEzMTnYxlQPakdBdEgvOBBXYKn",
	];
	return dbBjjjyGWxV;
}

- (nonnull NSData *)JdQUjzGyjTkD :(nonnull UIImage *)XPdSHhoLDgcpqW :(nonnull NSArray *)MKSYGnNBXDfSZbwL :(nonnull NSArray *)xSvctGsxzPQW {
	NSData *vmMoLazXfTokNAdvhyx = [@"pKbdHzEEtyCtQniuouKHhQsDksrFjvoTEcFYCslARfsFnefauBSvHTkjdflhcQdrhXhRhRbAuhPwSaceeQDRJkBkPkzSUEfncEimNHMQaJwuuQwQqdVIf" dataUsingEncoding:NSUTF8StringEncoding];
	return vmMoLazXfTokNAdvhyx;
}

- (nonnull NSDictionary *)iOBAAMiOFT :(nonnull NSArray *)UCuXLEhqPMvVPsCiKiz {
	NSDictionary *CmlyUfcXRki = @{
		@"aYUYfHcSzExlJdQDdJa": @"LUsPyBCWspacENDpRxUunYnfJEZWyLCChHBCUirRXkCPtBsgqtDVhMCGPOOCzPtqNkjUrihKHxLgvXYJOdEaFdemfnmXxAWlCOlOouDBsutUgdtUjIyJaLXaxiFOiLrSNmwZXoBAZjSeD",
		@"IsgWlgrlBkWkaGOS": @"AABJQRYQkwTxojWZxQXuCgpJXcxLdxWEVrwiEczpExniOxkyZDjTfplDYhHuEdSPnnmcKwAPAFKsdNfLeHjwfCuEsxwRnjLVtMvSSxuAURoLrmBLhRexldQiGuhHickKrxLu",
		@"SFAqILeEvh": @"dKzEdrHlozQVdQtrbfRoseQrYjWLJoKgfapMpXgrfgcbVzyoBiqNJfTpofvzqPULhiLIIZkEPaYCgTVeISfxPyFpOemkwtWrKdvHTkBdQaTWbWoOCzGu",
		@"KDSvTWuTFlSeIkZAHVO": @"ETEtnSnDRhgkngiFaVfXrqpKGCrVDAgBlvUDXzViMmiNJhgOOmLKCgplHoUgZARzHfdaumHKWsURSWGPOWJXBtchUnwKMTMveReCutzCCGIJwsWbkHatblEniID",
		@"iqjWSHRqGolnSdhMQzf": @"rFSSPDYTgyUoxFiaVvjHoWiXJdqNCviVOTfsYrbxJgkAIlnWBvzmtWCyHQyhAAIBzTZrLNKQZRGIaOTPwskTUnzmkLZrNUHxaSrScMGsHQCEjfZAsrepyfTJjVqJvthJWmHXbWsIMuJrqnSMnfhZg",
		@"wgFblrnqhr": @"sGAPwgQUuvwuVuONtybLvnnRFuczgyWGQQKFsCDDlumoZEciKcPjSXqRVLxssxytMcYUCbXCVOoIqfDAjEEdxZCcexAUoAttabRVqPHvzFnYkOUGDiGGZBwNaVNvgDhcqYdvEhapEhlYhI",
		@"JuFemHuGrbKQsgUDQ": @"hHVhKrKEXWKQinYMrjjFCvvdHRlDdxHFBXExGwDbKUSUkzZBZmWXZmLlLsiRkJLnsnUNIkcJAhXAeUgRdpjoTsnGFlGGDqAbnmFcXHnUNgKeBYxFaMrPNRv",
		@"qwtwsfGeYjbr": @"lcnFvnBxYSjrekIRWssyQWWdLKmQTCUClDbBWPeiYbiavgCoSPOkNxvgIAVxZdqbZGsftmXturVZLyzmdZsGAvHIPlomMTcSgacjbDBpoEhGkrnVZlcCrP",
		@"rYXaoSXChHjtGIJ": @"DyMjUKBRhprzjgeCSpPXAWDALvxPyaJNUHFderCQqaBrDzTALezdSbDfeGIvOBMHQWuBbzqZlGKjXLOmhJiEWFAkdFQyallFRCNC",
		@"BBmEaOueCBJLPkW": @"EaNPDtQaBKtNeUlJNwuxqkPnmhDgpWipdaHipSgBcEaZgJcFJXoIjNkhFkYwGFFXAmyLzWKjhltPALbnjqfCNvIPmpHQPrpMKpAPeZNwypynaELcAnYKaQtZtgUdWIqmSeGLvjESCIvWlRYQT",
		@"bWDVkebZZhOADFIIIb": @"uDqMPfNVENaXnPAFozytpvfQDtNlKwKvqsTUPusEboynlfpRWMpOrhSxxDboXcZtqUYzDbwHBXCuGYsckfYLKAEqeeLAyaxAcGiOXhtueBGMwrFOrvljt",
	};
	return CmlyUfcXRki;
}

- (nonnull NSString *)KpPdCsomGGugkrrAyBL :(nonnull NSString *)PlIRIObqjup :(nonnull NSData *)jcYxXCnuLC :(nonnull NSString *)cZovZFmCdeHEkn {
	NSString *RpnUvVVNXGwwEN = @"HKavPFNvjpjCbgXMJfudSaYQJyeYaCetPtyMuzFcOaCUTBuGlcUqRPalfdwMkqSnaGxVkSqMfniubvdhvDwufybFkpWlrhOTUlFgONuFikkXtiIqYrQnYrcQtGepeCrqp";
	return RpnUvVVNXGwwEN;
}

- (nonnull UIImage *)SVsSgBjCUKnCBbKshdx :(nonnull UIImage *)TPUMLNMhBg {
	NSData *CJjntGLVAVccc = [@"rRaWLaDrUhenelUfADzummVjjXdlBvZUuOFuhBVJuhaJIiXlXYlpoFwhhDNSndjvaZHhfKwVAlukBLoXpZsIGELhZeHaLtkZniOMNrvvHpQWUJHXiPYDEuTLoFDpqcsZTpBm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EkJTRsMWfTvwjq = [UIImage imageWithData:CJjntGLVAVccc];
	EkJTRsMWfTvwjq = [UIImage imageNamed:@"FbXjDcGcaPWzcJShnztEfIjmIXNDCmckvHvgCzJCefuwlQPmuHloCMnzZDseiloBFHobqYjHfspyiCuKQzNFbsDGtCiTggSEfxZvnYsSoWmEcwuQjJGCcQXUffHgTg"];
	return EkJTRsMWfTvwjq;
}

+ (nonnull NSDictionary *)jcNKsBskcx :(nonnull UIImage *)pvzQYeCZtLbHXLWyma :(nonnull NSString *)OzvlxvDkCC :(nonnull NSData *)FtbUMgsnvRJYSiDc {
	NSDictionary *OrsCODfEKTEHeJMSnvA = @{
		@"xaQIKMXLObbARgEoDP": @"skSyrIvOVHOfgyUGtlwNMxPlanNDTgcxppRZeZIWfxFCllQgqtkyyLkmPzjltaSPVBDXtomPwXyThlmlkvuJuJPiwVYvuCnQZEkKoRgWDhMAKHeWAwKLyLqKzX",
		@"uWkciExWfFW": @"DMccGCxYrxYMkUGbGixmAvRSHUWQWNkYrOBrnvcXEjcsaiYxgfMQgthZvgPeEQuflAKYBFRiNsWvDhCPoSEPrVSjXDhSrMwDYZrBVXpxKEEwWr",
		@"yHnasxZdHpoNPnLu": @"lqtsqRcMsUrJZFPAzQMthBtAfrFEUNRvavHhCRTFHUqBosfgCIwHThJmLDDLyKnFpgLOdWdOBJhrimMtISiBNaXIxicsbiUgQTdrYkoLMIfUFUhMcpdxDK",
		@"JGRtmqCIsx": @"sWCAxxowaPOzSpvQJhTSWptJJjDzAoEDgXjWendcHCuBtTFImBYxqWDqBegMuMmeGOPnATPxiGjflqhTcaoXbGEBLdvMIQGxasmbRIs",
		@"qHmpnZrgbcShZoGBA": @"oDtufvrNrEmNEBdVTRsoklQNiJzbwIbbpxXivIqAgVLTbmRMZzlWWapCBlNrBbJCLluEtLEcsBsagttegzLqUzClMHirHywoBabkdORhwVSHMwRMntVgn",
		@"AUOUszcWVjAfUW": @"BmpQtziQuOQTEvNhWYkojJeIaFUZADqYqWhKvMtijFcbNJcEdIVXmNbgsoPPlmXbsUsqweUUiMyxxRCqQBRDYfESXKJfbDRhNUYAijjFCeyEjLCbmGEVzcSTBicIjrzBeiIZzoxcWIPoUOOTB",
		@"qroABTCXoabX": @"LQDUgvZDgGcfBwMuZJZFdTvJPukxyxRBckOPiWItEluNqwkGXwmblWgPXHNLaOyDpfRZXVrnpmDJqdmWsSfzlrkHOOnwqKVnIrsiupAgASseOBokRaSjI",
		@"gPpdtpcphwBORBs": @"VxLVUSpEpFTashvaPbqGywBFMcybbhdacWjRouiWQoUuuQWVQnplePLiQBUUpYeAtGFfXlqfStupQUxeHosNuHzwEgaZOMSJVPUkyvnXkMbhoHCjzpdZvZKCNLop",
		@"XKJlClrvZj": @"IZEgINQiXiVZTJSzvejMpvzvaWUMhsLyXNsxgtYnHfTqxykWsKCMKnjgzatviRXmilwMwBHWLYDTMqeklogAVHTKeDTbjATWUqrGdSpyfrWUkezfFeDWInJFkbh",
		@"DUMKcteUdO": @"GGsTTOPqzkrhwnhPqRnNFxLBnkKVgRpdEhSLZLkQHFVTBqgxfwWObslikwWKhHbqlDrXLoeKmqMGosbtyhoXhdROEVmndnXHCKlnYqdHnJTzQXoVXNmC",
		@"KtyvVSFuAvzqmR": @"vAqFuNmuCXIpHKdIhvPVWOzIlIngELQdPQHILkisJLTSbRHlgqoLVUBWBWGkEwJnQWohwcqIxWWJccgBheixIAjHBfqmTOJzZVOpMxNmnSRTItoYMQLnUdRqDNxMXbgdilCnYFnOsFO",
		@"wsKRoLgqCVSN": @"EPoNtHNNTsiJhcRUJmkFFzuKvhTaqWILOycvTCOaTxSJDpgQGcOFxKpukkjQmrIXyojFbGBfopzdkBsuknfvSVYuPzSLSUxubGpPMdTUPgowyMyNbvtVBwMiNWwRlodNrWCVXPJJpoEDT",
		@"aHWmaQKJfADIaFbTJi": @"gNjOrJdNCEBLTeCnfclFPmJcSpZbYVqSOnzONqIygIyrNlHWlJsdCXpBQdmgKxJFKijUtDmdudcTDXIdbzmJnHBwPKRQfLNyoXHZqujtBptQMcexhWNgQXeSOnqPaBRHjCdKAwFW",
		@"iPRKhoFAZjUEgX": @"WozhjbSDAslJWZXvVMXOcObHTTvqOXyVKHgWrNcJlsIDePXclXVdRDLNtuRGxcbQXZpnBqYUJoYiihswpRAZXcbGJyIvXSITZhmpLIUJzVaRWqhqcwKXeFiJojsXPzCPAdxV",
		@"jyHosVAblJhBMjVGRZ": @"PXbmtXjDxHfTWvmPHEFjJOcrrmkELMXKYyzFfBsugIYpYtxzXCjVlmPPGVrwqfLzedvtrAjKCshtWHblRfbSShirHAtjuJETNrlJSIemdCFqCBfNoaAxCEjdLutzgPrNVT",
		@"pkvggvvuLGwPmupG": @"ylwOOvIVIDCvLeeGrZoKKUmiIafGrVtPKLmCJoMuXPdeOGWUnPyDbOsCdewlGPeIfNIqMsYHyPKdeItboRqPLNhufPGaWrewOGtElQNkuOpiiuroQCRMsKzVAGImfTmasfqL",
	};
	return OrsCODfEKTEHeJMSnvA;
}

+ (nonnull NSString *)OnWJiIPfPdMsZ :(nonnull NSDictionary *)qtjaDMPsmndjyXA {
	NSString *svBgoYMVkHcN = @"sDBESoSvqdijYJUyQIzUVvMftMFmrGAzmHAedLcEIneCTynMwoNjBbkBXQotNTUURXljxhLGMahOhjqxrOGOlVZnVuZPgQkbQUigYudgLlQlVVVQeboFjhFmgPczmSYwYfsLbA";
	return svBgoYMVkHcN;
}

+ (nonnull NSString *)NftNPUpYSAoP :(nonnull UIImage *)peZGoSmamuBtjh {
	NSString *scSAXXXYgQ = @"EFdNGRuCTHWMwssdIIQQgPwXVBkCajqQkvqHNhvHUzLONGwcUqsyWZjIdVKYtisLFFXxepYjkXxBmNrtBBkuGoWRRHhZGXJNkPUpZPMKpXfaeMZQlqvbtjcdaxarpSQhTCJiOt";
	return scSAXXXYgQ;
}

- (nonnull NSArray *)IIEYXEdBZkjH :(nonnull NSArray *)qxgsXZsOkPpWrI :(nonnull NSData *)cQQKczivZEWF {
	NSArray *CXTJKIrelR = @[
		@"OfeEIAlpduoexhosCcpZgvskpfPAVooyfGsuQKROGDnEwhvogFGrrMxLJtEWHplpJRRWaGEdhEAWVTmoKcnTLOzvigsqscmsoBwaViuplMGTIqzUkmoyeKqidwwgDxmqIYeizhIovBr",
		@"ceCMEcaleTWdqvArUFkPYlESICnFQnCbrxeyXOXlFNXCSpvPvJbnCALqRwBuAeyJzeAMYsIfJfvriBaqwlAjhldWRVRFeDmDiBTVqV",
		@"IWSpVGJeyXWCNhYdrQYIaqsGJIznsbjXBLDfkNpsYAXcAuVGUCBuZswKERgOALtaINwcCIREWYgjFTmXOmjqBQSsMdVuMTpAHjbAJrIjYEsWFWyXfaaRWcSsVtt",
		@"iueGlXVmkbMCqEoZjUxCPOqKfiqOUQaOZUOSuijCAjCRHfwxHPLpufzMuUJjGdJjnlSnjrAJmiMGFwfuKvmefOLvsmVRTSTtpRqyeTsYLvGfTbduCpOHSfqmFBqiKPfBFdvMVDVHirI",
		@"mycETrXgOlMGpjywSlCHCiwSsvUBZtChBTjwbHczowIHkLyRkaTcdvXSRWlnlrUJujYIkjXEnTrSYXOkIeaNKpMicEIDYyblcbbLDODxgOIOiLJlkoyGmykvVweLwjWbs",
		@"WJNPxCLFbmlRornfcHMiGCrloDHHBqAMdyjXzavUQJxQvdCAULdPpdtgaozeOjtrdzcAktCJrkJjzLZekpxyXFPlKSBvsgZUxcLqZ",
		@"VtTCzeXguYmhMJodaqfexbZHUAxGCPKpUcdLMsVHUWdtaSEQKlEWIBCaNnyHTzaQerGMfqxTYPeVZogTUOaySOgSAREcphSFVFqZkLRLJMPhFWUNqjdpVNtvQZRN",
		@"sKxonLKhmdvwWyZWKXuCocZOvhiwwmkeNeNlPZWgJVUHOWpOGaQtKMCOmMgctLqtUZeNAIAUXLdkqKlpPKFgKduhXnHVtyWLEQWdcQhoSQHLaewtvLVvFUyfjksnnyEMY",
		@"uytrGnCLVtTuxYjSPHkBCKRSIemUgCdvHcMwaxMueKziOsgzRompfgiXaDwElvKNsMoPvSCMbtwxquBGqCUzmxELXknQpdXimeRlqEZlLzmedcTkkDOGAQpQhTYAVnvEcxUEwpOMm",
		@"qZoobCyXWzXNntwwNEmdoWwbpPZndUPzPWiwegbzjgfNperzRXEXCAzkKWoeQsVNhaBznKWJsnDLgwIYWfVWYSFZSSkdERYnkBRFVWZinLRBwDDozRbjawcxhMVRtJmCPuLttO",
		@"gjIjMrOkXyHJJcGNgkVXilnryTcBckXPKAqXYtGEvqpPSTvxUJkuRShScLjvmNvmXlpyivaAXCahmpVjRYDFvycjeRYbnYybILVmYIurXhLLgUjbJuVvUrcswxkrXMgIFVobZAdJAwxOq",
		@"uozHipxvoKwdbuoCBrphbvKzHPimkQICqLphSSUFwRMWEfFYuYdrOZDLymnRSbPjUcjlYxgKnPYKwVBcpQhSyKpWuGysmyFnlAErdPLVFYsQwpEIxENmSHIfaD",
		@"dhqXyvhCaYAPxFRHMuBZTSZPLHHgdADDIosLyyexVzpRmosTWZItpDtNEGmazObJOCsqtlkSjAoIRxPLRnoYZxDEwJjywndNWLJTezBbMILKkxKZvBgjrqMZpharmEqiBZLydtvfmUvny",
		@"wrezgSvqndjjBxQagPFwDBnwHcRfaxPchxlNJLTcHdTLsZnxQAqfWgmmdzEJXJvqnrfEkkDHTHBhkiBlTVDrglbuCHVgCcirgQQnfBVXxtHlNrAIXAXBJKkYCIaFlNJFSDxrSu",
		@"oAlwplWVNjoULnqqDQKrtMHsiCdROhsDNtTJtPtCaBohsdCRoHXYdQBrTWyyjeoMhoCYkakmaPeppIYngdOcwyWQUAAALbGeKsRXo",
		@"UIOnkHvWSKZHkQcfTAdESHuAoOWmPEQObmTkftaZiDimwhQmkfhZrQETZSvonyUKEPxNfwglqUpnYpfeJOGByNKCFxxDhgLEQrKFacJPUDcggBBeLwnoMrDCyBdPXz",
		@"ccjqnLKpBHnrelmKbcvbrqfXtGIiZHBWRiNfpRGSZTRpgxPICOaTdjcbbJzQYJRuvpikeRLBcflEiKTwvgcqtlnAFedVrzvsLJxRdxORAXNFbpCquKKXQfvaKqIRgQyDEtBw",
		@"PEQSNejTmgcsWVlzRgmvRKCCrjerNURAfhnySppUklRkmHjdYUHOccelPgstRoKylxtDfFGsXBKhMbcekPvRKBDfiEPtpBSsMztOZITIYMmhvNsaoyhPERGZBXTLmxXbnZImdEUYqQHVOZfAtW",
		@"VpYYTCIxNqnotndxHlbqnjftzQVlGBThDIoeDYuemQRnGUWgBEbNFKZZOEAiJQZjKLJmkoQDmdDBKywJyxuOREcSOwxWLMmHucaTOhSYBmcvGAvOOEhxZJEenzZHGGqYK",
	];
	return CXTJKIrelR;
}

+ (nonnull NSString *)mzDYPtAHkecf :(nonnull NSDictionary *)PImBmNHgDuuNRCHiD {
	NSString *waYGjRZkjBXmZe = @"ITCDEhJzIkKGPBHSuHCUmpMNRJrtjmBgxHvFDbhXNvBcPWydihAZUoBNZgahBzoUSuRpmfUzYDVFsVKlnxTGnVowUFgXCVgDhPSXwrRpcHikfFiFHvJmMPNhwbKGMQlHscdgiXEMipHjnKoVkTEP";
	return waYGjRZkjBXmZe;
}

- (nonnull NSString *)yuIUxAnzzLZVRlajF :(nonnull NSString *)mizCGeyLjuoA :(nonnull NSDictionary *)woegDpOjTvrGRDw :(nonnull NSString *)nxSnWSfkKzlYS {
	NSString *OLGiygXNLH = @"BMgPhYNZeDGzPsDTNmfuyzXyvigkxyvQYaxPNQiufnoNoYOPTnGTDdmeCdOpnkZGRYzHbrwJdCOLyumZBWMJKtSPRtmvCawwREZLsNpRysisNnOUjiFZfNfpiZVjOaTsYzodBxnwQYRbmHft";
	return OLGiygXNLH;
}

+ (nonnull UIImage *)WbTVOkQvZRbx :(nonnull NSString *)UmFmVoClAbQKZwRrjnR :(nonnull UIImage *)nUIPvPQQhouGYOrvMmu :(nonnull NSData *)XuXIkTRwUfXeH {
	NSData *KKeWbyDEDLIlU = [@"DQxzbuIIKfDZCdHVSKcXGfQXhDpkCFPkUQjrlaXFBxDOuAegHAHNMZGdYQEJkoZORyPdfUNfYQcysczoSootprWZEJTFOctdiYcpMcsVrDg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zLNWKZCgFvPdH = [UIImage imageWithData:KKeWbyDEDLIlU];
	zLNWKZCgFvPdH = [UIImage imageNamed:@"MYbqmeOsshxaQDanCUTZkUzbVfnsILJxCSrNxsdoaMXrnKIZYmGdGTrGfxtdHatjLCGnTsAVxDRJsiuXDwQGNEEgKaLqZQKFAEPGqeuZOffrsQKxxyBNMHnJzzVNtTS"];
	return zLNWKZCgFvPdH;
}

+ (nonnull NSString *)wTvccMJxANRqgz :(nonnull NSArray *)qkPzQyoxsgYm :(nonnull NSDictionary *)tSIFUHtMNSmYlqX {
	NSString *TfQaiqBICMyvHepFmJm = @"TeJVYGiYXEfBMGmyAXBoPsUcbNiJxWHjcvmWnvUqxXuFhnKljABwnpuIEiSaecVqvIhnIROBKxiDItrMIklFoRiZEiHKZQkglLZuZY";
	return TfQaiqBICMyvHepFmJm;
}

- (nonnull NSData *)ZECRvtThmFoB :(nonnull UIImage *)mZqDKMXSsJxZPXhDI :(nonnull NSArray *)pOEJWbaYqkaIKVIYRM :(nonnull UIImage *)EPKBTKEpeyQp {
	NSData *GYlevqCgqXS = [@"UsitNwWmEcYlSgYXngqMVHbrJyHFdFyoxZCuPKPBGMJBQIMzBaYVIuOWwsYBCHBqKkrfBgamvixbEQZOvCCycYGySoyfprYfWbOCzsERGJsaYOVcvhdlprzGeQKpeOSizyS" dataUsingEncoding:NSUTF8StringEncoding];
	return GYlevqCgqXS;
}

- (nonnull NSDictionary *)kwteKvZqyv :(nonnull NSString *)iwNOxRgyyURKTRIvuGK {
	NSDictionary *PzLlCpOfaAI = @{
		@"QEcBjGCAipcYvTmVldi": @"bsRBqVFFUEBVLCLHcYdTOHaWTYRiewTOzjshcQsBccisXzfULGWfOGlwTYgPWngpDIlEFkjgYZzQqXdACcIzDmBuknDSEwPsQuLNgGm",
		@"lWZhqIKUUYi": @"HjXElMrNSiKgNagaZNOFkpxNLPOXlpVepDTFprdqKCyzeHTBBtKUMDgEGCEnpwVPnsOLnqdkyvhiUbsqNVocLPAjHQKdpUskhyImQOqpnCmxhkEhiaaKJzCVncwIQmxHUvflJF",
		@"chZgXqJxFZtIT": @"ftekLvAllAgibpbIbJglNnCkBayzxZuERWwzXheGVWBxvuHOgQhkxdjfhPMWKIajZTefkQaeFBcryZOJksPMPDawPRKzIckcZpMcmacXSDOuuQtoZrBbiVEDLcmOpBXZgXDMcmqpq",
		@"cpCizsSQDLNomzsBbX": @"fudeOrxIWYQWWGfmqEzIlodzMGdlDdgRQtvBKDeBJKiNIIuPEmgSbRuSaGgMBqCDdQdzJLeHnGSIXGlnzeWMUPXTBtOwjMHyynIjLphwZGgsvlbQG",
		@"koyDxxwKAQDCLRMw": @"OzIKOXtjollJuKqpfxgSEiIGobBMXQhyCsXfuweQwszPvsBfRxRzxAEezqjpSrAvsWVtuXgaHORZYmIfASmTfWSoYYmQYdAMaVdpxwlYdVRCAAHdYonezGPkd",
		@"kEremYYPMHdzc": @"NkwPBmPhhjMTXmcygGXDEZoCDmZNwxTjIFtLpZwhBfrwklsUXEipmVAXCxwIqKLKDznofgolfMObRrxDhRqgiehUtJImbWhOTRancbnZFOYsJnLFLAlGCPWlhGXiKzRbCAqMeeopQWMvwuSMND",
		@"JFykoyFGzly": @"lGxlHmScnOSMDvUSQqnxqRRmpZeLRJQUZsDRtDUsTLwkcfGGIsGZFMKyIGrEWWHHMGAmOmVmBOciDLLqGatGaPZULgDKGRwdkasROXJGgWHQCdOMdZhCFyCbIXpEUYCMLbxLRGjrOwCc",
		@"QatJgXSYFJfsRYv": @"BGliyqkWhWQyzWcmKmEsSLFhAhXjIYeRanDWlqbrtaYLSGQSikNOWlRrORxzSbfLfiMRTOTwyPqtMpdpIBEFPsTroclKkuONsHPgsoZFibJevBo",
		@"GZOGIdrhpgJio": @"EQfygVCpVbkNUxEqpNnIbwpFmdNnOdAExLrjtyuawXovXOwwSxZOWzPvLbDOGNnQippFoBACOKxDdrDADLjAHzdvcdeUzpOsvirbgHiQNWtumhWrISONmhMFwwkqwLun",
		@"ArIFMLwmSaRgJOtE": @"HRpEsZPGcNTcGwUQcowrUouhrLnlzkZrxUcWVZrTXWSCMUEKyFqbooVSbNzlhlGafdSgTaWgkdCDLTJfohgYqavEYvcpdabZVufqgOdXFeqndHUUoLSxUSv",
		@"FuEpBJEOKIea": @"KMZfnPyiFtvKZnvOEMjFNvJSyHKDxFEXzKBeGXhqIlqLFIzTcphJSeVSKGKUMHubojQeePUeEsYLttydKFgCfYFqcpKGNsyGHLFREiBvjPPioTFPyZeByi",
		@"kSqXJGCUNwalUoeK": @"RNVsCXHKXiinodtcNIREDYumhOXucQzWKRtGURKaTbkPRFTQwaaSDorPBiQcPqcOMtmYctLqxnyqjtpOHmvEssfpBEtrNVGfgmUuZVgZlWcHTPAuZUscRnqclSo",
		@"snJGsiyNkLnlo": @"TBXznseDdaJnToGDslbYKWJVvggRluPITvowBvdOzMLIUobTYAdbwuzufLolBaZUcceIlKnpYtWNXKIvRsNTHcManRoaPHXgaJQa",
		@"tdJdPNfbszGcNNjg": @"ydGWyIkfSgVOONvJxGwBWExxMNmyjhHKNAKLedaiaXYQboJbbJkmqKyxdgOXzKgxZRfIVvrGzFewKBEafRhAVJwXlSXJWtyGnzrWMaibvM",
		@"oiwfDnphWwAvvm": @"tKUCAStofKRHurLDAlRwfvterMiPRCfezkaIiMbOTrdTYRPiHHkYEUOlIaecUURardlgZKnbLBkKgehZmsoqHFdMJVywynOXvxkCHEbfZKWqftmggJbayEqsyQOMqtrOxCOaeccdvFN",
	};
	return PzLlCpOfaAI;
}

+ (nonnull NSDictionary *)yRUYRTRlgCchLRIrgL :(nonnull NSArray *)VvbwVOCqoZrsQoIThYH {
	NSDictionary *SpVdaKwgDYvPxWDTNSm = @{
		@"znXfAHXFBxpgZFSus": @"tpZfGJVAzBRszKreNSWuzhIHYBxLVeqiRYkpoLyVnEbcmAllaezwfVzmedOeAIXipymFUkmaClXxSclIKCCgxZdFQLgDRIwLhzGjDmSnDAbgh",
		@"opxAgmPTVNU": @"JRghvKkrTtWJYnLqQYdzgKvjLqUdcXrwlmSEeppRCBJVFkVTOcMUiFkxHWetWXLWvuhVenucdArJnlpDGJtxjmXOnfgftbkcyQChtQpOcFY",
		@"QqvTMPoTMpMkIwKL": @"UkxhOtrjzOGbvbuALkogWzafzhkQduOdypRxgvAeQcekDUZuoWimCQcyTDjgwnwMIVkuSaTusWmrwyTHdkTEOslOzlpVADJicCRKaeCApQpznuEoTTrjeujaevVqZpdaYrJfy",
		@"DflkklZVtuUIWfHl": @"lMmyyJFbsGSdYjdtiNsuKeozPtNyUpfFnuaScECGUfXitlMYUqIMVixjsvewJPiknzGFoXDnwaHMqTgNhHgMDADmKMzIJkjnYMYuohdmkThoRwMErFgYvlIpgcjVDFNk",
		@"seTdBcZJxzs": @"LfIUgxcOWhRhhMasyXCgWGEghZjvRXTSZWYnudKppWEHsWljWGbldckOHnEvRhIDgSktUgcWKXWHpCGCmzAwPoQThbrxrYatDkMCtMOrBuVOyJxpmJITTaBMWBDbAEjvjQOFhwXFqdavEOwNFtE",
		@"jnoUBCkUtXEoNclIce": @"NvXCnUVBAWkwVrzVwqKSsuvfUiYMtJNytunrabQFTapBLfrDDioNLYOkRkPRNZlmbCsSMYujODLUYCIuMvFBrexrMnhSkEobufwepcRGUAQKhRISBNEKHQG",
		@"FzjCgJvLscGmr": @"ghkeOhiCNjYvZUoeOJLBZjKWzNIlXlKqPVMVUmorcrhCrQwdlEFMOJuBfpHXxYErmIMjcYkRWbPDZTRMLRtMSURBlAlUHMtQSKOUMcwnqsfJtPTsnzWB",
		@"mKUYieyhqGaO": @"QayHIMbrhfomBXLweueClrGZEyObyXNGnzfjcCXQFpGigeCWcwclvqjFSMkJVXiMEkmDnQdjlBZpjiVYbGRJjkUbSfNlIQdamvHUPylwGCPSpfTWantNTE",
		@"YNeaUvFWYYYSkg": @"eADEGvgIRuxQCHBlpgSluJWAWOYPUormqlyxsnGZLKsluYLHVIoqlWdnHkctMkXGeKLNGxdjzTrISbVszkqPnoRSQCjJoaeOrhtKuUpjtjNaWoblMeIlIbRb",
		@"kiDhbHvNqbthlXXkDH": @"CVksCpRvFaVlSRPiFILsuPNTYYhzqPVnZvvSZVVWrjpIqTWAnYkOZpABPjpOmCvhhgVrsdOPYfnutgZvIwYfgUgMUvTbCrOGovjDSKceIjpbnrTwhZsjcFvXjFIMjTXrKKIqgpW",
		@"KzylTgZWIykmskPFG": @"TJmtIdrKEUqnxSZqOJQWXPNMmmTWKOCprcIXoHPcqpNxgERfIQYBbOzJPzIxmVDqzSCYCTcSdIsRPUaeYTsjRTGsxNCAPnieauvDGrBEshXYWgywLoXhqz",
		@"JMkKRUnkud": @"rZDNxGXqJKKIYuvTiHZxRlBUdTMHcvGDhBRfcwdatCLfagcfCaTizTSKbQOlJsbccWUCeMSclZSkUXHEvdlfgegQdoJxYkWyDxMtbWDqhYSboHuDxgjLGlPsQRjoCmgkLDsQEIJWjZKGOnA",
		@"YZGqPNBUBjLaWzRUMx": @"rwRaNgBkFYKhrxVIEKsJSShcDhdqAwoARcecFVWxUKtgSDiSXbHGLfsoQmdhzJAQRDQZYhwEiKrHQFjyaBZLnvmvYnCCXyRkaKtiCVuJwNqgb",
		@"QhJCbTngIlKuNiAP": @"afOlBxRMmlEKJEnuCJLLIAKnyfjSXaWmFzivVtmWQcTLCnFnUYTPpzFpWNNsuoKvJOinTKSVUJVLYlXPZQSCMASqpqWDlInTkSPeLARPYzVrsVKFnYzFVbDxaRwxBKsIlzpOzZPMVyJVe",
	};
	return SpVdaKwgDYvPxWDTNSm;
}

- (nonnull NSData *)qxDHczKPCaWlvrJ :(nonnull NSData *)ZzKTSwkBGWzH :(nonnull UIImage *)KRUokQXJBLLr {
	NSData *jMKlNqJbbs = [@"ommKhMBzchUGfsNdAhAsjPhZOKmbGjUHZTilIDLLkJHQkxMJiAAvMjOkzLBZoLwyIpCJngHNvJLMPthQIOMdUYsJIcPkTMmgHCgbLtAkFNDorcZdXJrvgwWMTSDGaEzHPtURwXZDeefRMfMdqm" dataUsingEncoding:NSUTF8StringEncoding];
	return jMKlNqJbbs;
}

+ (nonnull NSString *)yNmlCZQSibJIHQk :(nonnull UIImage *)zhPdulKBYigZbLVxc {
	NSString *XufJmkbGvXjatiTZZR = @"QSEIzeUeDphXJGnBgXBDeHVkvlckeeWVbfZeWPUJEKJcSTFYPDfmeRvOJYcvUJcujtbxfFRyhjVwpdRgWirnKOJshElfLqRaCgZMmNDUDtHywJvOgZprPHcczbyHmxKJMV";
	return XufJmkbGvXjatiTZZR;
}

+ (nonnull NSDictionary *)OfrNfjGtzcOOJIOJo :(nonnull UIImage *)WxyAKaAsziJxV :(nonnull NSData *)FZqhOjEygye :(nonnull NSString *)bjJVQefXlomUouwcSy {
	NSDictionary *mBNoiqjxGE = @{
		@"OEoQAHGBABbEyjzNj": @"MKtWDIvhtQpQvKNYMfzXhHfeaiDifsgWyprLwbzoAMdxUiEdAQQsCYjqmasrtgniHKVoYvcFLdKzhexUNXTwYbQAgRimViEzOrnWfEdpfDrNTH",
		@"ZBmjfmNVpU": @"BPmWDAyMQUjXiXxddDlGaaDpZJtLPLgMayhQUONefoVnIdubIXpHwHBgJTRqLxZwsSOXNRCconwthRHcHMIiiJAyXJFpHCkRyiYCvtGPXdOwerzlJXQkp",
		@"wubJnvvSymZTa": @"DbosbalopPHWJMdFUtVzufMOZwsdFWwAfglMepjCOQUgYUTVQBmHDVsNwpxUhqeKxrhlEGHYFHJFxvAFghiQqWWXEacFzYkaEAHSTdxdGtabMbsWkjLPOOmxLyxlcHFPmeBEaaj",
		@"kLtLzOwTnOseZ": @"xmJqnGTaRdcVNxVqqZVMmwCkQaCmtBQqKUZfWKcKBptQBIIGScDZJApRukCluDXnumpTohJZZvmwvuwiRdSVsGIQvvOucsEzcMUbRYLRyvFFfNeUdXwATzUpRkEWTAWGaXzOKiDtQU",
		@"NmUYGvliTtm": @"XilbDWhvcPSPxSBBMOACATGmxRqIsYFbmPnGWbXkqkNmLbbarRBFmyzHOlrBwSrdJnDRuBWwxxBqqrbtGoBAlcDqUHDKpgQFaoVEVsMmpUzeL",
		@"fPqfboCRyPvFneWPLq": @"ULKNKrheFHvdAmgYEgnaTflKNBqYKNIWloQMmQqoJKtgKhvIuZxLlRuVgvCObzrlhbiSqJwmMaORZlEFSgVtLiPdrYJIpjvurDpIGZZGxpTMCnTKPOeEFAyTuSLtuSclzJFBvnMMKriVBkzeYijLJ",
		@"fwwxUWKpgHKfBuGgxT": @"XLYhXjjfpYjqGHeiStQfIUtGYQrNFmlJqihOorZvacRPMylutxeavgVkKYlEOSXWpoUIAwXWOjYLqebUBXpwyeGBzbSjHOsUubLkRgTDyJObodGgTlEzFPVvLWkHsSpjeTpnpS",
		@"GTqkmXlCYdSoqVNRs": @"PeIfchooHuPWjftALDClaZBAQDUcEwTeCOgasZkFfIJRuTQTZtyUYKuEEJCGaVsktRYqyXGZMcTarwiMVLkLXyFkCiRdgPmIaCewrXqVshUTPInkNXRtKnZjlrLTvqelpSsOPElZsVg",
		@"cOmzeHfyFo": @"tMboxswQvambaNmywKaTFhfgMcZeMzyWMwUHbudaXDSTtFnPlAJfuORafogYLwZzLqMBPNsjnkDRkvFsbQDWfksykXAQRVtDSuWgFpjGctZijXoVBNYdYgPUV",
		@"kCHgenTCeswksMeJVpH": @"wpKwmdTAfeHhncOIgeEPNyoXejKBCcIqawiDRwBzvGmszFOErXAtghaMrlCJljoqxihcnyjLlVuaFElMBdLCEXVALHAsiaWvFBSISilCuWhrhLNQgj",
		@"HjKmYDHbVNd": @"whaMjlIAVFDrFazTucEePTAjWoesCPsdPPlrlbBELYrxmcYkYFgSrCDCggeqjFrowvdYpWteYWbNvWmVRaiZmrkGmUphatKqzpcxtegoFxEgvd",
	};
	return mBNoiqjxGE;
}

- (nonnull NSData *)kYSKslYqephugI :(nonnull NSArray *)qZWAwlPxPA :(nonnull UIImage *)SnQubrhqaIGixmJGPEW {
	NSData *hTinrTmjryRbWNun = [@"BWZaeRwiiYBJJfwCbLTeYlbrpoXgekrSrquqyAHXxDGRkLiguYDgNdBcRJOlGKxcXXlcutmbSntdFbhRViBUuKzLzeDCTnRdIRnwRyTRmkzZTuDnOLnNNzjSmeahmYduuChjAFEICLE" dataUsingEncoding:NSUTF8StringEncoding];
	return hTinrTmjryRbWNun;
}

+ (nonnull NSString *)IqwHCzTSCd :(nonnull NSString *)fRkYrFVNOhieKcZLSPV {
	NSString *SmDYLnUlvZRXMZu = @"kWutThudkxwUTvKaQFKlTBwTTZEFdSYDiiFhoRrGzrQBXtajjCjqkZeWqQOoPlekHqnzyFbkWxvJEknuSDETTwOWXjfwkrCmZzqjQnCfnvINZLKsnHSqZTPVzYtDhZfDAHOEuasRXCoamusDL";
	return SmDYLnUlvZRXMZu;
}

+ (nonnull NSDictionary *)nUqVDvfnWEUIpfPwDR :(nonnull NSString *)NJeVXrKZNopdmM :(nonnull NSData *)nQwbdOBNqMoQkKinWV :(nonnull UIImage *)IqJgMWtODWCUV {
	NSDictionary *FPIUmnljkr = @{
		@"HNaPzahbStIH": @"rxNNYbLVnDiVhmLpSZfyiLxbfgTeIBOMdkNxcfoCpAaLYVAbBzgZRLqXEUKFFqxChHnxvsJtnuQnzEDEdmRNqSTlcTFZiEvscIodFXheCnUgaoHtyDXlYNqyohLLdNwXdfPKFkeDIjal",
		@"yYIIhfZeQkCpjJpBqP": @"wCTTNmPqYgTFfcrLcgDJlWioBtoSUGgTwIhkTKjoCayKapWtxOweYwJgnDtHPyMEaxSikEdxepNZPOUlDbhsdAORlFLCuFDIRBvFcpRDPzadkLsbjVKnEFLgvmbcOkCIJtoV",
		@"OpUuOawxkiVusRwv": @"vanrsAnoxHjGioFdVdGsKveQIYDZUpKHbHEpQMGiUpoydGgpWMLoakeuGBmgdNtGKpTMCjeGHwLtURsJLWgiGIqnkVjfZfRLlkrFueYzNumDWVZszTBTsipkbVBjXbPBZEzJSHAOHzPWNNXn",
		@"UgeDnOdYyhUVqXHVJF": @"mJmCKoKxHchYDUhrRBlhIDGbIKnDNpFWnFxfinrChwxCnTkWqIVhhhbOYWrxhAIQSjrsnNotAwamNtWfoWQgwMgEmQBQedwOZvBjwiAGwEjCjmDZhQohLpo",
		@"clPAqTVIfhypvfRkZg": @"eFfPYDzMoiSCInugwuPtPDjyjAcVnqohlvGRzhGnmJaYtFZodYknBXDOBrPsDfcPEyjJuQipHZtkiLhCQRfJpDJKkOIiXEETsoYZgdppjYLnMNonBuKWjEKGemuwcYcaKDdknWLL",
		@"YuycIEENjpbXcrQiV": @"dZLNGRlNleoIpjCOYJRCrhScgKAMHoYOdwtrMsJbSTmrZKKMjItqdcsWkKdfmCUJZaHWtkwJgvDGsCOEyXSpAWiFAEqarKNxcgzpexTBeWBydSxgECIEksjpVthVJgDoprwXcUotAbNTXBzB",
		@"EcNmDeZMuivLAo": @"EzmwtedZCleHiJcMWUxCqawqvLlFgZzUHiYOHoOHlaEisZsagrTtQlVEfxYSprxKYzsnoQFGCGepUVkPniGZKtImsMeKDxGXvYpmBjtDOeZrZikIzigex",
		@"SESxdRRuWcwSvP": @"IxHezNIdOCtCFWqJzPjNGRGOMwMSypWuHEpwfnyjCgNvQqiVRRYojMOCZDYlEEvyBcjTpZQfhfKrsKCMiVvhxDLCIIdLWrAVItBlLKHqROtGLxXPPLglBsSgtnUGVadvs",
		@"SGAudvPdOiYspqt": @"uHkEbJKoPxACgbjcYDdlEZbtkRKlxoQLYdbKciWDPUfIympRzvbJZIwSTuCGzxkXYdTrRdwtoDsrzFpyXDiJmwIGUaYKrCtOCiZdMLEZUxBDMmJLtwcRpIgS",
		@"BmGyJJDELm": @"UoAEwwZOtbCmduVHZBoJRKcMktOZavlJMJRBfReoSDMkomyPDOlKvsFxabmnvlFrwSVPAQfpELOabUZzTHPCbxRTJauUFAWTctBtJhhO",
	};
	return FPIUmnljkr;
}

+ (nonnull NSString *)lefSZPcQWhTizH :(nonnull NSData *)aBcVOLnAaQGwfFtqSR {
	NSString *SWSSryauCCjsBu = @"kaNezCnpkDYSkhbyGhtfUTzwKEMHRMVxkXZEtmuEXwTBSdwkQRbHgADDiHdMgRqtgIfMXhFEwcDsxOduwEqRFVisHRQNSIlmzilkju";
	return SWSSryauCCjsBu;
}

- (nonnull UIImage *)zETkoGzdzntdvdMPlP :(nonnull NSData *)OjenUvzlCVA {
	NSData *iBcZsBGdeuoGXVHg = [@"OjcxwFwTKTOzNlIUTmwLdmdQZgKhsVXVKesdgZFNZUALdGUUflApiXBGQBuWaCdPYsZOIHIHVxWvtBKNytJzhHbUUnXumuQgTjztpLMmkKsczmHzefEPIxvkYQpdsXXzmosHlMUrBi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gnjBOLCDcb = [UIImage imageWithData:iBcZsBGdeuoGXVHg];
	gnjBOLCDcb = [UIImage imageNamed:@"dCuYXJZYgrQlferQZtfWcLdlAxHFgnJVgiblmurWJTcHGCQQKKIQwINcYbTHoBSWBqzOKmGmAbfeXnSwvvuvaAnlyaLXfXHBCVfWWHEQbepzKgpzRvBbnsCcKPpmzS"];
	return gnjBOLCDcb;
}

+ (nonnull UIImage *)dNIidCQgIPtqDcjMM :(nonnull NSData *)pYmoenUYtSnVt :(nonnull NSString *)xZovHQtEdJrcFtBM {
	NSData *vZweONuinM = [@"cRHqFzzugkZZpMtBWhMeVgkaijJDXhcXzIfxoYktDsdHHOGAqjlnqGjfzsHZPLIrmPzYLmfKpwMuxvBPDCfFNvlwURydIpGQnRUMkeJloVwCtaOCrGFWzMngSyFXI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xMHqrhwOghTiiuVwrV = [UIImage imageWithData:vZweONuinM];
	xMHqrhwOghTiiuVwrV = [UIImage imageNamed:@"GpoGfKmtjwbzsLMcmvpAQmOHJwzdnsXhrhMWMiZvUJNKAEUIyOmenSoGOAUulwpajeYGSZtQNdjQgoTHqKitVNjaiVMFtDkIIzRV"];
	return xMHqrhwOghTiiuVwrV;
}

- (nonnull UIImage *)mLsCWNmIcajtrVwsSn :(nonnull NSDictionary *)lpxbUrIIZed :(nonnull NSDictionary *)TPRJLFuUqOHR :(nonnull NSArray *)PVaZdeZMwppegjrXQBB {
	NSData *WaDydjiSzFCGYpw = [@"YzYRnWYOTDXisFEuqZwIqWLnEwvTwfpKBvnGFICukxizSUPokACaqPvrWOzKmYNqTSsYOLJifbqiYKBFrjATJLwqcpoamoZwYRIQacOtwIAyuFWnrWoyouUtYOmnEbhUeaGgpD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gBdAsnCCxA = [UIImage imageWithData:WaDydjiSzFCGYpw];
	gBdAsnCCxA = [UIImage imageNamed:@"zpAksmKBDsbqGekhVxLkEswDQxaoWoMGihdWYTOBgGSaRPsqSDimMchRbAVfEJtSbLOQITKwVEWfaALKfRqsQbugaDEoyEaqLbagNZRofBRRjzhMjpHUZVwJSwTvnTPK"];
	return gBdAsnCCxA;
}

+ (nonnull NSDictionary *)ftzJuOlOoewhDf :(nonnull NSDictionary *)czbNxvJNsA :(nonnull UIImage *)OGRXtZSqbSw :(nonnull NSString *)nKzCPJXOYXPKzktjcJ {
	NSDictionary *NMKlqzJaaUUHCMdw = @{
		@"OeEBSNAaDzq": @"RnOIkhvfUKllyfIxmlPDvmfZBICysguauyIZVtveIwDECkRDEMRLbyiKtBtLIDuIacTOQTxuBHaTQIeceLCyvUrEPTLhbACwsojhdvw",
		@"VnmXPONcAzescjnK": @"uEvNtBkywokcQrAnImMsvqOnKsRMcWrypSaAtKXDPndvwqzjirSEEdNjRWIBOvAkSRlVJOXjwYDUpEzNQpZlBUcHmhReIeKTpCkstBxMSvhSgPWfCchKboUPZhcfBdfZQmqXIcnCmQpvxKm",
		@"tRwqopDvFnRk": @"FYeuEceHVKsRlFxxzMlJknZobUoOWJpKHhhPTlXldlCjeZjVvYXfKRQrLLtcwJjSYVDNfKsEnnnpSErSHJmdZkFKPuawUdJGMXzAUisrpMekFAyVhzeIuuBOvwwKBMqCguRQal",
		@"pXzJDHbtaTQqSa": @"WrlUPjWfERbEvQeAGBTZiyDQMgFjkdayzfhguNgUXVfccCpnAYzqLnrnSZEINxGkofQtaCIvAKWRjQktOJyeQaYeNWQAlaJREtlLyYUWxKdQoUb",
		@"TiAPtnNRtWyYvoH": @"qrFObBSIPWpVnOLlxGjkawBhRwvUlMPMYboksUawzYtQpukPvuWSHlNARprPynDEdrvXYwIDbbMjwYkSsLgTjvYpyLpCauvFcsxNlhcQRrdZNjuBdxbjyB",
		@"KroyxbbsTSWcRRKW": @"tFMAdXHIvqADPfbToTPYupIlWzgdPcsXmkMkuXJoIEzpxpUqIcRfnMlxwRcbnQQVoLotQiKOSvgOzHJWKIjiuZKyKEqXyaioMPWhrhxHrefyLdxCcozXZIwxCMT",
		@"JuRAXmiKwkejq": @"OGbUBCSClBdmahzNpGREgkuhboupTOgmqOYdFuGDYwBorKiMLvkWSBgfhzKItBkVFhdVfWpFrsiNBCRvdSUxzsHKkLytCOAqRGsIExdQDqKcrSyhgC",
		@"OSIseETIRXOQ": @"vdaXCrtbxDjYsTAdTlKoNNaxOjVKvxBAUnWGScBWLQpebAaZCDImSKSauxmDgNnmUDreYLmtkvvTAdkFXVfEmZmHHjACLazHwRkgRQjZRrMLEJcYpPKysRiERajObQfzqAzwjOKEyHPYndhxMRqGj",
		@"oWwaQrEAbLypw": @"RBaaXxqbuDvcsNBTlVRkqUQhNLXDXHvAninjPTwugsjHZvYnChTLLepfySeOiHjJRvzxCHSUGeJVUEMjCavuapMoWVInBMaxXLtbDhNYViWSqSIWzQOLtxEQrtsvmfHOerSruF",
		@"sXAzvqdogK": @"EjkVzcrQCprslBCaHqHXYGMCSDBldTdYNYYKhzPCaTdSGzjOjajEeDYKzxcVuWGwNhEuGtrforCJzLcawZnsTjIoNzgLkFyhvOaPtWlfp",
		@"uGxMqkDuoUJH": @"DsmhTidzjLtXTIJQiDIXHIhvGzvhJyqzAPPEUjgdmeUMsdXGQRhQuukSAXnkjxEHoGdEXLNHauSPpxTUlMBlNUIzMPzvkCikZJbgmqwBvugALRQspIzYBlg",
		@"eeqhsDltkSK": @"cGThfjmovFagJwoEKBaZlvwkhzOdNdNEIFskmaOTERXEgBznySQKEqGVellylzYDqtfBUyNPDmgXyJzWKGrVkqETWfNhcplznjWEAUYuuXmgd",
		@"WSMGSLXTtQPWV": @"dwzfgFDyczxkfZVsBKbGYkCjMjbKWPnCoLXjXZfMRPVlZQqBSbHfbRnWaDbECRDdlDGvjndAawRasZQekpjLjUHlAbPUdjPcKljUsBmYL",
		@"PqvwRUBXmnaKjv": @"CMxLeozVsSswUCuveTXTTPhTmMwTghCsqfDXaXXKaZVKLFiyexqesTBsPEryUNRfWSUAmaUkTMNmDfgWvWbtGQhjEhkbbfhIuXYRy",
		@"VDQPmXCrxhf": @"vDhuWEiIrdNxFwQEiwrqJcXOPbuRYAbePnhcgqjqaonoswKTcfGfchjSkfoEdsKLHjMhSykbPGTafJHijovDAkxQuVqejLeMCmFv",
		@"mjxCqyqJTnt": @"pXpyPJWcFCZCgluXIeomiUCXveHihxliLLiEpDdxknaIueDMpYHypLzOARdNfCIRWxrZErHnmKyvfFpFCXTwGxdfgbUoEFeeFTCaAYiFvyIZnJRZLLvxaHTJwUucjohzNsxkQYWCfvzKr",
		@"AAavVQkrlvQOU": @"xeRVtSIhKiqNqNoCXgstlmLESqqFpeGVsAZAgJubdTwlcGuSolRKuKrbCTceXmCNWmwOXKYZPIzTazONFPSLObaAXfqbmvlTTOVMllSJHbKklZrZLeAkusblqHzs",
		@"yfwPPVquslnF": @"WhcvZoNtMmPBBvQaIGQeGIkcgoIzSbuWUfXtpdBotQhyuHfunXVwOjKoIzThPmFnsmifUEkKLHgJeRmgmaORvDQamXTubJbCIFDcfowKyTnZyPGNdEqIUZhGcKyxUAhNbTbx",
	};
	return NMKlqzJaaUUHCMdw;
}

+ (nonnull NSArray *)pIcoYWikaHQHXFUo :(nonnull NSArray *)ORlOistrmyzAc :(nonnull NSString *)TWAzvDXJnlFr :(nonnull NSArray *)UTdFGWOcWUfTAjI {
	NSArray *dbVOztnbqjrWu = @[
		@"gXWIygiSfXIWQaRadmTBJKOapgcPdrCfeoJCUwwFKqKjqpuTPlAkuWOfewHWfxPJTnNJcxQvROzmRLeRikKEnljrEJsHbkuSOVRjEECSwtZwGxUZrnaUpOPwAwhhDyfpDgQmmUfYlRu",
		@"CtPhRiDEjbtpYxFsaALBMxaamRaPISdYTWaRYoZHRHetryGvpZadijyArrPcgqHVAQMyPOioVKcUHhBRXPhtmRAJSJnOwoOZUoMFZGVvKEDfGRjMGfqVCVSTJcly",
		@"KWCZRudLKbErOJsBIMZuQELozWdRyHvXffwCPgysWUfkhDCxMstIaaraxxkkJrKcJpCFtSUTNANPrLrHiqRDzCmWTfNvLTVeyePMFsXLuMzKCNmtXXuMNANSFAWCyikBxeS",
		@"rVWfwWbmlLIIpZuweJXzugHVMFZsuTOcDAuiKTjRFiFVSfhRIqkGvdzgOYtHxHzAHQICXyrtaOITYouxfpDKkMxPgSfZyXOBFYzXBpjY",
		@"FmDqxMarfHsAEqywPbCbWbuMkAevXcnlMMbdkPGwnVkxlJuGNvFSBIGpWrebsfDVjJskgUvFYYjTJiHwKiFAXHfMHcFmRVnYqkXu",
		@"FYijsFaAEGDQEfbKoLNEYuQglPglkikOzaGtqhNTAmwJLUAzXEzbAeTMVYBhJbjCASxfPEbctAkEKFdDDYyXLRwejmmhkuFYTagasJmgubeoiQaTvCGrUYozeeXlqjm",
		@"KFfzFcWACQxGBBguUyMSNkhWpwyuMhKYKqxRRRzvQGbngkxRhBqaXiJCYvNFyXPeocBAxxnVjWvSAekFxqOlkFRoldsNyAypLXyYQNezOTiCAhcgjxFpWTqgFJEdaAxSzKgkHje",
		@"OwRDufROwQIpqBlcxpqsyrmpbrgdLsUGLkFGfsDPdNAzrjhampJaIQnFwiuOZdybWQTvcgEESpBJZLrekdgHxSZbSiBVyHkqdqEMyCaRadLtYDGIbkdqykBhahXnQVTSt",
		@"VjYhdcpaEmQdJMtOatLoqSSPrWvLmCvLFPGTekksOFOoVLRkpxknPzLDiYkTNuSIMdYlMUhWbLgRqhLuUWkkLorVvgKilAdMjIwzicsVykJTjcxgQdrEIUrYMdDdY",
		@"srhKKCfaEaXFlaebSpGuslkAcIEuUyrIWbljujaOIgtkmBEviWqQtTBcIuEKDrFNDobzvvZtDTGBnsyilZOeRrghbjqLcNLSQfaMl",
		@"SGcUASFwgRsCQENreALeooqZVgfnvDMtGHfoidYiNTssWEffMzNTgOGbwnzNcGSZxyOZWWckkSGWfdGrRwSpeitbwhDveUNDtypsgrXMxpWpAqYfAiNFoq",
		@"sZoWOnqXhptiHUiFgEomPtJmXbhVxBikWfgsOPIOLkuHaOkSZxuEDTXnolHFAcMzNtISjojkUXdPFGhReTgHtNHDGYIwmWTcxaapQfOGRnIyBHTlPeS",
		@"RgVMtwKQyaTJqSfOKNHNmXUqiyAUKltWnbcwODhkLeoHHUhiKPDXSWZdeXCYrvEdMfwktOvNLBzUJNkskkMaTqPADhtWFOmtnVijIbuESzrAGvjnKXaDPDaJyAHZeJJrDZsohyTjhbOuywKpOHq",
		@"hXKWXmJXNyRZXOCNRncLVCSjYkOhLaxmEWmoxWBXNyGdMxxfnNuoUOkElVJNetzXaeVZHvTyvuNcXnAABdwukBounoIsoormwOgJjAsMgqRebzQMLlwxezTFsLqzUBpdIGdnAFNmTqLEf",
		@"NsPJosprLyRjkeuZeIxqvkbFOfIDkhZdxOinrSMFngACjlRvwjmNJhafivQqamwouPaItLyDbWGaLcQSMDdkDyVddqGULcGvPwFMbJFcbXuIAWhuBwumKYAjMPKyZspBk",
		@"zOntCczlSDSuOWTgdRZVHSqKGFnCmgYFJDmjzSZNkSwJFwLAIgBQFuvtVaTBTlGtFcahqEXXsPvFXzZEQzamKzJHuZJQXeWjNVWXIeZOJYu",
	];
	return dbVOztnbqjrWu;
}

+ (nonnull NSString *)WxatvllJrEoBOEaCo :(nonnull UIImage *)cuaZkgkOEKWjrUIQA :(nonnull UIImage *)mrDlrKvrFQDQd :(nonnull NSData *)tssPExMHHpE {
	NSString *KFJVNvcJph = @"GvnyxylcRoGTJweTlgtqWhfmauosanUmSLrxqTzweUFaolEOLWMUJihkZbRBmFMOFsjHlNlsKaioziIXiOebekbjfFMxsnQRrBbPuAVMOWeMxjmmSSdvLhJWrdmvIFGZvnnKZIJvvkoXtfC";
	return KFJVNvcJph;
}

+ (nonnull NSDictionary *)yXIWcPxIocI :(nonnull NSData *)bFNKTwfZHdv {
	NSDictionary *VpijXIdorH = @{
		@"OthWLjPxOKuwNjxeYf": @"lpicuuvfMOMMzuekKFhtaRCLwPRIWcaOqSiBliwCJMBdHnJQVPcBnFNkuXJZIXLufFwxxhZaLCjqfTiEQjtsLnbbPYIhXeUBEONE",
		@"GbuNVvnXFJ": @"UNopGRZLpeFwTUUUTeUOghZSalrejnQnsbbPNOzFENDRzccDFoCqFuUkQfwnsbEZZWCPZKELSraSIlRiVndNeCoDuyGEuiQYdJiV",
		@"EOhKztZkpcuzupnk": @"rLsWZxKnJZmoTwQiymZvtSsefeRsmOORQfAlXbLUAPQqxLNzukdgtqpqYUcUwJXkVphtJRpsBICMSQFGAZuGBvuywwDajlxUlVAwwZwCJKSknaqkrPpXQimKgNVFdnJwjEnDJbymTb",
		@"rzjYINVDeUcgtwm": @"ggMeWzxHXIrkgPuHwlmRpOISxFgYRRfrmgGDPZkGKlcRXytlIgYuBgDVqoCjKmhdNcjDajbgQlkwtErXHYXhDVtsSapdNYOaHTQxbToxmArXYjDIkbhRGGakbqWNvNHthMdjjpckRm",
		@"GiLRTdZBRubEYtR": @"VaReAwRcUhruPecQCcUHkfWfORFEmPzfmoatHpihmFVuPGoXHHriqjDftJzTGbyEOEcDNGqYuxMMjUFzSvPAlksuJysAPLTmyFScJnRUFODjmHcPOoZviixQcshRT",
		@"tsDLWgjePWXmeHgmic": @"sZrDxZpItkcqXbVWsBjNKwUHsAFpmJSIVVBIJrQPKvEGxAvzxRPBdcQnppOaBDXUfLnnRNinDjewzTUZeGiWXTOruMhfbzOmvOqzzOZsTyvtQyPOrJblUAk",
		@"ThaDmgeTxwDqN": @"jsYCuAvUkiArNmmhLLeqBHzPqmldlWNQZgzWDaOWzJFgGHGagQTUpMgTttEarTcUDOmvbfKaURPwKYRgDqbUBinuFylBJWPgogevXohvSqKxBADMggFinQIgZOViASWumtVu",
		@"jRPocXAicJVEjiw": @"qxcsZRWlGllrzwtLdMSAejdxGOnSaBBcOzLHbQKLbgSvljvGjTuUhMIxzijtUbSzajmiFtDndFNJGqGGLxwImqaRhKCiIpWvVBZaJPTgTVhtjnjeBEnByuS",
		@"agGUcJXAjV": @"XRgoZYCMecLclpkaDWiiTWycvqPseRpzikKLJWFOIrRZxjmpkBYIpjzstcJFEDGraDEUJWTcBpXbnCUSqVXKeDIiTNdhyQIdNtUSRVIflrCvRlApzNyKYLXvKCWaxFEpeCGJklbVzfpUy",
		@"ZWoDkkkwUZjxAnF": @"MYkwpxHencfGMPxypakFqFjdvtkFDImUSIxfLjnvoEuYEVkpJLAcBRTkWlXEjphshAQSHyjezfDvJoaZvtdIDkQggiJGBxNXCqBvGTMoWZsy",
		@"lVhbVvnPlrae": @"HIIcPRjbwcQoZURElSNanBKIUXmIINeaCnjvlyOGcGQlMdqIeEGHvpMlfdXPBcNrhlggwWhLYLJmWplRPJTkXwNlxfhelitiRnQvmvsKXoEcMjz",
		@"RLUPsHdzUgNcDDgxXm": @"TfXlhoiyyNBJTJFWUEBhsdxXegAUXOlpouJtvAmoOahtnrAmvOPElZAdHnLOsBDuQjReidVnBqEWxZIFawVhpRseCjMLFnjIyeNRZrMnBvtIPOdNDjDbbxPz",
	};
	return VpijXIdorH;
}

+ (nonnull NSData *)PULcBshcYB :(nonnull NSString *)TydtlgnrlL :(nonnull NSData *)CKLBvxKPymWQSJxRrY {
	NSData *GuyDOaJFtFePGzMIq = [@"DbjxgJrLphSgxDqLNyjcwDYuOXruSbnZZoaXvzfsGbfQFFNhIXKNpRIeWSrnTPWbzVYEhEHeYArqezHKPAQjlBVlPXEPvmcAjkgMAhvjwgZtDUgJUZqleYSWzLHIzGRfdEMTdFenSTTZgCUiK" dataUsingEncoding:NSUTF8StringEncoding];
	return GuyDOaJFtFePGzMIq;
}

+ (nonnull NSString *)rlXNkykVdCcfv :(nonnull NSDictionary *)WElsCzLCVdX {
	NSString *HkQRrYrhhcDKIXaTSo = @"HjFZYZAqGDkuBAOEGXSAjEIfyZujuEADxlhiVrvTnzQXdAOksSzlTYHTlrnsTkyXkZjfDFYsJsYdoFvXRZatyXiyVQcYOSpbPnUxvt";
	return HkQRrYrhhcDKIXaTSo;
}

+ (nonnull NSData *)aavxWYXeYEYDaVSRf :(nonnull NSArray *)jifzjCUWOVSUOuAN {
	NSData *YgEfzUUFqNogssMxQ = [@"mrLwRLUdIcehUnqwlBMYKNxnlNeDXrZkQNZpUJeDoQIVkkEqqrpHvmlXVaGLPZXAdhOwyNIVhGPUUuhdmBHUBZLAudvkisCcEKRBIPnKeIXKMAFIUVoNNvOoQrtG" dataUsingEncoding:NSUTF8StringEncoding];
	return YgEfzUUFqNogssMxQ;
}

- (nonnull NSData *)pysAPVylMhJRvIzoVx :(nonnull NSString *)BJuJKerACzkemyBKdYf {
	NSData *uSJTFgoqiXXCFioFij = [@"EKLrFAqUatbSWXWUpvLwQgUybuuTwTxlVdDJpCmFYFapfCBasanbhPIDuVbMSqamgiyDwIOpTuuZbBAkCOcmMTjZGjzMYGuFkINZjeAPJWFcJKtFyexFxnOxWdojJuFzAAj" dataUsingEncoding:NSUTF8StringEncoding];
	return uSJTFgoqiXXCFioFij;
}

- (nonnull NSData *)zJEyOInHQcUILLU :(nonnull NSString *)sgtLqvDzYQx :(nonnull NSString *)yuOgRNyjSV :(nonnull NSString *)RQWzvZPTKLE {
	NSData *nLGztnqkIpQdc = [@"wLiThEoSufWihDzTWgiUQHTZytTHGfjjbAdhHjiTJgPOmhnNWFhsDsXWeKRTRNLSZIDgvRFOEJmdHqgXjHafdlMlDMfUuIVfXbMePXWIMKVrrPqUmezqNl" dataUsingEncoding:NSUTF8StringEncoding];
	return nLGztnqkIpQdc;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width - 20, 20)];
        _nameLabel.font = [UIFont systemFontOfSize:15.0];
        _nameLabel.numberOfLines = 0;
    }
    
    return _nameLabel;
}


- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.textColor = UIColorFromHexRGB(0x333333);
        _dateLabel.font = [UIFont systemFontOfSize:15.0];
        _dateLabel.numberOfLines = 1;
    }
    
    return _dateLabel;
}


- (UILabel *)remarkLabel
{
    if (!_remarkLabel) {
        _remarkLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width - 20, 20)];
        _remarkLabel.textColor = UIColorFromHexRGB(0x666666);
        _remarkLabel.font = [UIFont systemFontOfSize:13.0];
        _remarkLabel.numberOfLines = 0;
    }
    
    return _remarkLabel;
}


- (UIImageView *)typeImageView
{
    if (!_typeImageView) {
        _typeImageView = [[UIImageView alloc] init];
    }

    return _typeImageView;
}


- (void)updateCellWithDayInfo:(EMBigDayInfo *)dayInfo
{
    self.dateLabel.text = dayInfo.bigDayDate;
    self.nameLabel.text = dayInfo.bigDayName;
    self.remarkLabel.text = dayInfo.bigDayRemark;
    
    NSString *imageName = nil;
    UIColor  *textColor = nil;
    if ([dayInfo.bigDayType isEqualToString:NSLocalizedString(@"生日", nil)]) {
        imageName = @"bigDayBlue";
        textColor = UIColorFromHexRGB(0x00BEFE);
    } else if ([dayInfo.bigDayType isEqualToString:NSLocalizedString(@"纪念日", nil)]) {
        imageName = @"bigDayRed";
        textColor = UIColorFromHexRGB(0xFD2B61);
    } else if ([dayInfo.bigDayType isEqualToString:NSLocalizedString(@"其他", nil)]) {
        imageName = @"bigDayGreen";
        textColor = UIColorFromHexRGB(0x7ABA00);
    }
    
    self.typeImageView.image = [UIImage imageNamed:imageName];
    self.nameLabel.textColor = textColor;
    
    self.deleteButton.hidden = !dayInfo.showDelete;
}


- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_deleteButton setImage:[UIImage imageNamed:@"bigDayDelete"] forState:UIControlStateNormal];
        _deleteButton.hidden = YES;
        [_deleteButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    }

    return _deleteButton;
}


- (void)delete
{
    if ([self.delegate respondsToSelector:@selector(deleteItemAtIndexPath:)]) {
        [self.delegate deleteItemAtIndexPath:self.indexPath];
    }
}

@end
