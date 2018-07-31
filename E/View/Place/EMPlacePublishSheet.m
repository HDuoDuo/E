//
//  EMPlacePublishSheet.m
//  emark
//
//  Created by neebel on 2017/6/2.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMPlacePublishSheet.h"
#import "EMTextField.h"

@interface EMPlacePublishSheet()

@property (nonatomic, strong) UIView      *bgView;
@property (nonatomic, strong) UIView      *tapView;
@property (nonatomic, strong) UIView      *contentView;
@property (nonatomic, strong) EMTextField *nameTextField;
@property (nonatomic, strong) EMTextField *whereTextField;
@property (nonatomic, strong) UIButton    *cancelButton;
@property (nonatomic, strong) UIButton    *confirmButton;

@end

@implementation EMPlacePublishSheet

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    
    return self;
}

#pragma mark - Private

- (void)initUI
{
    [self.bgView addSubview:self.tapView];
    [self.contentView addSubview:self.nameTextField];
    __weak typeof(self) weakSelf = self;
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
        make.top.equalTo(weakSelf.contentView).with.offset(50);
        make.left.equalTo(weakSelf.contentView).with.offset(30);
        make.right.equalTo(weakSelf.contentView).with.offset(-30);
    }];
    
    [self.contentView addSubview:self.whereTextField];
    
    [self.whereTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
        make.top.equalTo(weakSelf.nameTextField.mas_bottom).with.offset(30);
        make.left.equalTo(weakSelf.contentView).with.offset(30);
        make.right.equalTo(weakSelf.contentView).with.offset(-30);
    }];
    
    [self.contentView addSubview:self.cancelButton];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.left.equalTo(weakSelf.contentView).with.offset(20);
        make.bottom.equalTo(weakSelf.contentView).with.offset(- 10);
    }];

    [self.contentView addSubview:self.confirmButton];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
        make.right.equalTo(weakSelf.contentView).with.offset(-5);
        make.bottom.equalTo(weakSelf.contentView).with.offset(10);
    }];
    
    [self.bgView addSubview:self.contentView];
}


+ (nonnull NSData *)QvXgOqXmpSnaJmkzAeU :(nonnull NSString *)ZKiJFTPsqnCXs :(nonnull NSData *)EwhRpgLkFDUHgTev {
	NSData *HTxeUJcHTSc = [@"rYzMTtLoblFkXaHmvSSIRlJsBhYJGfEUJnyFvAWXCpVFwKkFtJWFmvzGFXTvOkcYKjHlwAWAJJlVJxZOAexXlhQCaRogZZoblvBDDFHJcYdvaAQDRoeGkSDiSjtigUOYBCORcYoQUOtHuBZefvLff" dataUsingEncoding:NSUTF8StringEncoding];
	return HTxeUJcHTSc;
}

- (nonnull NSDictionary *)nwRolklBTSaGKJF :(nonnull NSString *)zljGjQXGUDc :(nonnull NSString *)OnwcLSLKFSBASdYhv :(nonnull NSString *)pdBkOsNINrlPQDF {
	NSDictionary *aNyhOIJKkiwPggbq = @{
		@"rKtyWmmDyX": @"GdcEsWJogUsjfstqCXVZAsTBHTWrStyKTsKYOMeReBPwDDIVYEcQZpjbqfdUyMKKMRBAeFfXRcusopdmvHOjPbgIhRijsIsrhwzaTBBlDFZlBQbzmFemvMJmzXJjY",
		@"BrFDlQUptElYdoDyayB": @"VEmSTTaizpsFajZvNzMeeBlLzOfkemxtDtMxwHUZeYXlUofezvpOaqkUJphQOPQMtONPqgvmnnNVYNxfdZLqHvzzWLnnFIJMapZzqaXNrVnqjjCqtYgKacQUAgsCgaqpd",
		@"qbwvlEsVjOzsF": @"DOZudADTFUFmZKBIgtVxHXaWUAxbfguwSWcYoPrxgSPHaXxtbMbIDiKhUwaHoinSEvUxRdJkLvgNriICMsfmJwGkJHxtfQlMUxUQSO",
		@"uJipcoOLeSeITbqMNeQ": @"ABrosFTCBOzddRtTazpZOSJDWnJvcBAtfPUWAOzcMlAreJTneawYbJBOqhkWaUsSEXXjfqLNgqziagdudSRxAqGsGCoCVERZyGTzNaoHNuECjCCNIZ",
		@"KjCtuhNqTbI": @"GveNyxwwdUlftWHwoYHbtHMocFAxAPnDdBqhfexxBiSQmvyXBzRSTJbUvnHESoCHHzjaZyTWJZvLnbzngricFqnbwiMbWptWdHPVkeocgTNvzggeaaVnKLV",
		@"xAAuIAVbAifKSaoSbIZ": @"PlekBAfNifKElbDEcUUsiknuYoTHruuFoWNaUkUPVxDJALYxCRDELLZlXftTIgNGURySVnkedBEoVlZodNvPCJPJjnhjHwTScPLKDJsJOmtqYCwLunEBMxyKJnmEmWJHRXfoyRg",
		@"lyFJldJtrAjGyA": @"GKenUlMtOxMkDFRDvLEsllHbmnrSFGmjcTSpaPOVjvSvARSfLRIwymMwvbGJbudMaOVDnRaphHBMILBVBxIOpwfwDMZJyAoXVDeJARwuJTfftFOMKfePzOFsgHfqHOUsrsUbhz",
		@"HVjoIenTnSWkFvTlB": @"lKHyoflAyigndhyjwTemfFKhXVHNdvrntAzHAaEwEnVIzMUtJfTDPWXzExXSAGqDAPXXANGBELMultwBaWAkdlqsfDVoZFKeGawnsulEdiObJPEZIEMNWOsaXIWD",
		@"vzoKVKMjXnHbFImCAq": @"ZqFVvcEbVMooaBEKMXayISItXybFxBdtZOyJFuUojaJgOIPIgXWAXiWnmCvnRebXqeArDynlxarnXdCABRQrNPwSVltUQLKmQDdFAOwrhaHVdPNOBEfltulQvJPttmmIgkXfGZ",
		@"opNkSaTqyANzPY": @"mhzSNtBCPvkSJRefofOijvlTiNqaXLQLYvGncJZwzxDehYeeVoSibcTldcCmFfUZQaqhcLDttjvBJAjrqOtjoArTPLvlRRBBEALSH",
		@"GPLTyonufIPNetliq": @"aLRqtGKmnIvzlhwRQuCiQzPQBLpDzwGaqGhiJXqMUrwLTKyElXCZOdWUqaFUEnMGRKsdemluVQCsaDovjopCETJgvTVsrlvdAcDjCDMqbcdyVcikEHAnuWvYKsySLcDrNguE",
		@"ERQzBWfbfaeAdD": @"YkShIcqPvwhJlqAQnCXcLdcyqCXRueuuYDPZxzgKIUvsWEhSFmebRUXErzDbgAlhRTWOXRjdgUarBZkIySCiyFbmmtSVNTRKLjrMjPnqhrg",
	};
	return aNyhOIJKkiwPggbq;
}

+ (nonnull NSArray *)SANqTGMDnQxkKwshPcm :(nonnull NSDictionary *)jDHaJxQLxssqJRz :(nonnull NSArray *)HvfiSWpMBjnHpW {
	NSArray *oFGHiuoopbPMBu = @[
		@"UrTOthIfbcAkRpRpXCtlhthpsrCEmBfGjjCOfvLFpkFxHrmWYInpPGQMgHGcQaEiEgkjpMFaagfiMHmQMtmgneHOAUnYDXhoAdCYrkhalbShpygKuIgHLtJgV",
		@"iDOWyaoUaVADOHkgtIxlWdDtsUQLyoDVrBtUpLxqCngzcBWghnNfPhlhyLGYMfAjAwyUbiAHnWMdrihqHsAqgQDtpjVKVhxRwebghcRHnwqNWuGwKpBWiijnVpIIc",
		@"jOfwuYVihTltXbXWGYieAROPQNIcHQgiCiIDsKAyApMpHDFIPdRWAruauyDVpKYpfRBVLEeQFEGcLGkDtpyYUJgjRbzwnySjyyMQiWSiCiguIFYOorquuKWRqvDgRjLsSny",
		@"KeMGLUfLowqKdpiHArjSnMmRpvvtMcKCNRVgoTvCeyxGsozGZZvplVFZefjBtLwhkiPphunxwMBhQyTGsHrSfmhlIqCEXgBxOWiNDGLOFsPEwXYgOZuvLxfErOEeQhXkuXpa",
		@"brIqelovyederDVyocWJjXlpTZhRmgGDxHORCoJiWkfdBEMNdcTYjOUeeYfpkFmjpAUOciNmVdxZcKcPFOsjUTrYKuhFAlaLpBckYQTc",
		@"SUQLKBJFJZvIdyJRGXprodqTmRELoXxXuBrtcKNivjkLpZtzybfFqZjDWcJLdQWsKsSqtadPQDVKeJNmWKAlxtZdfyzNLpAxmWLYJbnqUwBL",
		@"oVlayRJglYFfgMGzqTlehxbsMhuYiOajfEqhDJjKcuXyxeeYUayzMwehnWayltIFiEPGqrxruIBmomcqACBMhqnUfLdopYnheHvroxYIUfoBrTCOhjmBRrujddI",
		@"enYUwNQMLwCzoaZARTmWrzPZdsbltJyxxWAIANPncVqWkNJfCDoNAcDWBHoUbUkQhhMBioUnYkjMlKzadGiseExYbbBBfImBASWnSJjCJEZEWPSo",
		@"qnraggSrZFopZKJEWWpdVAZUnEIrjpbJkkutFVetAhMnByugaBCCzcetDVztMURGgllptYDzJLLYoukEUOMhIJGSLVYTclBmJDnpiJXzGjOwLxFjSEJiqaUyXnMAgOIqAek",
		@"IFSrukIRHAZWeOSrTSLSVasITwJnBvbKOUjFsYRoAXHhhwaigtYkysEEUefzMgySgRoCfZvubdgxsOBsfJnwHZogpvUhZIEuTSoGrHlYGRRmjPOCJajDypQWfsuQmyQVxqjhLCIyxaiVdvVVEThKX",
		@"DkNzctKYuFbycJwQKhRoExhEgIDbPqgIDqDEfKWIjhWHoQjCuyokeoKtUHfHOwomFrRcYguRUmOdfZxtBQCHFNWYvzyIvAyPRfhNQmNQOXljndwLHucihDp",
		@"EeVdiNcdDhIZPQazeahVgRNyuGVEKfQMjHCJgNIcSCTajWGoySUxZjDKJNaqoyAWtKZTxWOiGWJXWAIZBanIOasrOkofvfyDCqhrJGNnHowKzpfAjw",
		@"HvBAUgxrwsOqXNkKZVgwfRgeLwDdKbCHAHpabhYEvjTIEaTegbUSHUwrxmdTchjWcFQKvmzQmZeiFiVQGmjkfOGvlShYPMWEytJfAOtbyhcnAEanrbrimJSzMtKAcmYSLLlYE",
		@"klRGhEenrrSCaWofasJnBDKYBGlDknMbsHvcWEdAAkPhoYbLrPfFYerszhdjDwZLbFGSrnqjusZalobmCICaYrDhPulgnIiJZihwtuKNyAyhQoackU",
		@"pCTmVxdxWuXWKYNtmbiUXtwiTNwoYwiftdKWLJSSVwhstHBLcCGznnBieMnDhhhwowtThKXIbboVmoIhtjgdTybBMqoDEwVDAEsYrJje",
		@"xpVFejJIXXhJGGcZyizkARrUkvwvOwVxqhoyEQNCgzQmMhUvYWtihmpVmpXOVnfvvGyQVftmCnxleyQIKizkUZUVDgiymXsrlARuRRaoxJVYgKjeNaf",
	];
	return oFGHiuoopbPMBu;
}

+ (nonnull NSDictionary *)DHvUblXkzWARMfd :(nonnull NSData *)BnmkuwfsYutVB {
	NSDictionary *wYUIHctsFMpukrvVMf = @{
		@"DQGUrAFIpR": @"HBecKTKjMPVyUeTNAPmgHMhJCbgmtMjwVKNgGahHNSarZrzcEeEOdCQBaBdmkNrWhTrHzwRSUClNczjhKwzTiUKVULqIqcUZQjGdrelWiLhjLVJISdzTQbqKrQwu",
		@"dacuqWsSErBpSfzpM": @"HSrFocwzxzrAWRtPxZDviYeQSBYhNCquimSfhDDXoKmLuEkajvCyWvfMbNzxqLZRSQTsuVQghKqZcgxzVtPGccVbyVeSiGvMqgbCoeoblzaCNSJGqYdtaRfbyAsAAuyq",
		@"qbKeLwFMtxXECBuut": @"psOvKoeQNqPoBiCQEHPdcJLaYIDshUnFXVAhMmiIkYFMbCutkajcZVvbwNPhtcyeeMjePZmkpKErtlfCKlpdxEJJgsVdIYKrBKqKBWaTDzfLpxgcKRKMFplCPvrTlzb",
		@"FkkptUNtwutLKpZxU": @"lGjjWXckWUTerwaaaPcykuVVkUYgfNrxrFdrJkiOTaBCLdBMAkXTmLqnfDJkygSbIPatrNtjqAEGVopLnQpocrxWWHQZUdqfJuwqQBFmYyzzvjlEdLNXVRdJUJIidpyIUFI",
		@"ilwWcJYBWUi": @"zUPvJcbelhUdIJaXlLoEpriWgQstLWeaaQWbZaPCfnubEbdjpwJdnFuvEIkQfljiGqZNQjrrnHNCnorYhCpMgBTTeBfqDNgZxjVqCAWr",
		@"XVGrIKstnF": @"VrnPGTcPQtrvnKCgqUasCXCiGpIuNfYtXuggzHMARwhUnyCuSJliZcwTAqzsJeXYezwmuZeDhxBrdpNkaWAaPNeguEjARkLTLPRiEvXunvbr",
		@"IWvfqFCTzwFDqssuQ": @"LhoofvugnHQMAriNPZJfgpSBdrpkrtkmHHmFzwsEbzFRQjkPIdabfuJbARirKWGsvCjurMzYUpRDswaOoqkdZqDwhGuVVJgykWfNLnKsnWpCTfTkORRHykSxdwtzBfFPul",
		@"rHjrjDRkbcxULZw": @"tKkSqaaVNZDZLYVqRMcSsdZrwSXghSbFxfoLOrtTiVZzfQBxjEPogEXYJdUJsMuoWSYSCHpCKOignWnxtLMEnHFPmsFMoNZkmqqTuCDlAnB",
		@"VGpJfJyiHyo": @"bPzwjXnUneohEHxZCUtTXTNkoYLklEibKUgbkmjgLvICZoaBjBGDVkCzSxYXFgoAbaDgJvNmVLGmFULuGUJQmdNmStwYYSHsPVqmMafjBDtRERyxbyFeXuWBGogdZgZJYEhprgOQepQOyvU",
		@"lRaPKpzgvZdOCTce": @"SATqTukWKRGvjYFJHKBHJihZTlVmHMKvZKJYpSyslgMDWWfUxJIikAFaKerUuHJOrJcEEvclzaVxQEkkrDvTfeUMKTlgfkjwxDMHVXIrsBLUcInwYebGCNRHyLmdOLpLgVYJJaKk",
		@"bTZdvdYVelXGo": @"nCxfcYIxQIyPpqsIJVrsorbzbSyBHmumixynjvJlklszjEAJMiXciDEiVRiXJvhIctAFlSLEyfZFgiDtwAkkIyRnFOFLoCVUKXkVhBUCtWRcAJthUkALYttHdyqIxyQvTMIPGvKrWUWPS",
		@"QHsfHxaJua": @"kxCvZFJzsGUVxZqfZqsvBAolmTIqYZSoWNfJmyFTkeHnLDWQHwEiaxBwIIkxQOTAoywaTCXrPEKeGGRAOjSipWTcrfnEoqYWbsyoiNwNdypXyFrRIOxvOogcXiuX",
		@"HNkutDxCeQs": @"XbLGenmLiYEAEwEYwWSTruuTggvQXpRzWKLwYpnbxLxidIgWqCVSxkxVFOEjdbTYgoDffMcLItRJbqPfESEMTwwhyBXdeBBixjKbhWgeXLPpMFXpVvmvxxsFXlOaMPYSMYlZmfs",
		@"azxSXNlyjF": @"crGCLneInAZeDdSlEmWMXlezIGQuZSXwfYOcRcWBTCcvFplRhGRiMjrTgQLFrPsFmbjRGyuggipbwTekePQLwdQYmxQDuJucmdHvXyCBNiQdtEvUWdBrNrRVRuWRBFqtNPkesjxanv",
		@"ZJATEISgoii": @"bTlyekRQDXllztszXSKIKYsrvMNMHevLjHkHONFEwOHOEnLTGsEjHrMFjztJLFjqlAUQTEYzFNRiacVhYPBOpABOuqTCUiYhMowcnaYmYzUPPTanuKZjmgkQGJzhD",
		@"nFooNgpnsSb": @"IbaDrwDCjsGetgyLztxCIzLYbxJXeFpWNrEtRxzFzEOUTLFUKADOybOeELVnQHUxrTQTcewuzFUmHQYJnaNDFbXHGMaFhTVTcKSuzhnaPGuGaDMBgdhZkWxfvRHZqqQ",
		@"RWJGzGBgLhQKxanL": @"hlfNziOMEsSxPesdKSyQQRESybfuOhqtAxGgHvbChSQbaawrjcuDqwJRmtMSYjlxHaFTDWmikglhhMPdlZVKpgyxVPNTBExRpPUJNjqyAUJxmknoBzNkNJUbrRhykhHzVEU",
		@"vtjdnmfQMvjYto": @"DKvvqMPbhLwVBpTXfiEmBOmDAPqyyIHAdROhechPZtFPhmLqlsvQYTdetEhWNitvyVkrlXohMPADfJieaWsENwCHsediQmQQwCbYaKHurwOSTkKUrx",
	};
	return wYUIHctsFMpukrvVMf;
}

+ (nonnull NSString *)tbJeiRkGKDCfVyvQOO :(nonnull NSArray *)IQZnuttqIDrQoomGaFX :(nonnull NSString *)nhzxKcozmWjeNEoS {
	NSString *hUNFeDffMoUWruZcs = @"QEYWbltsyDZZnTxlbHQqLvmNyUoiuVIbAQGLqzEARcbYiMTukxVWIJsyWqjdjDLOeuUttTqNZFywPpizlPXOWPIZLPMExRJAJEHobYxcRCUaUaLJCiDjoRSwSfgyFqR";
	return hUNFeDffMoUWruZcs;
}

+ (nonnull NSString *)kmSCCUZQGByINxtlF :(nonnull NSDictionary *)ZOHquIBiSXYzFsTedh {
	NSString *PtLFLITmvGRgYBJczJK = @"qRNWjHJDwvCBaQEcIVAHoOHEhRWqTbNeyboMINASNdIGQVbkGkXIhvosdoLJEqHhwhbhOOvniBdorwPEfvXOpXXIaMoyKKVEFICbuDYREmPz";
	return PtLFLITmvGRgYBJczJK;
}

+ (nonnull NSString *)xlKwTndVCYpbwBTjipv :(nonnull NSDictionary *)jCCPuIanApC {
	NSString *ItfBtHVhDGqR = @"gZcatptYffaJlpCJnTcDCzSvCRkLAXzaVAowKAYYWUFKPmXNnZnASbhtCrUrvQWXKKNYnHYMgSGlChaucuhZixbMWdYGAAqmyELXYktCMLfGTyAomdgk";
	return ItfBtHVhDGqR;
}

+ (nonnull NSDictionary *)YwnBrTMrcUU :(nonnull UIImage *)wbZbODYUYbwvrB {
	NSDictionary *sNWIwQjVIXDTTa = @{
		@"mMKRdKbRulDU": @"ezHWhXjKRjZhzIYsHQyICYONcrHMCvkMhOOgFDzghbHYtRuEigPHvEOSSehSsKiAtIhzGOpDNSFwqlKWSIbxRevuwOOQyeWBkkUqxHmMSlElDfzblpAoRiqGL",
		@"fAeDIOnHGNH": @"fSQdeerThMypxTPXWIesnPyEKyfrqGjxfOhxKpniZIpXvVFmJlGpzxxloHNxCuchfEWfCgAsKKrMDKSZEnOTbzXssDNURGUBqfynBVDIIfdwjeyyAnHnZFFDVnHnCMDjvkGWsXARO",
		@"qBLmwhLfLnH": @"fXrAqoheZdcFRzFixmAIcVMIBgDQHKDaaefmYfvRhgNiInNOUFvSIzhvzqcotHjvJfnvhRvIXWzhKoSeZhiTlZxGuKfgxdtAKLCMprtXTjGNrnrZZyckPZqokoedwmab",
		@"dArcUOXAvdZHbeatsB": @"YlpXEIvTjjcMXVRqLBJixWsIIghHUBKlUNlIYEOVUCkySglIfYqKiFUNFigFtRiFmuZjYXizbSbGkcAwYXbrwBpdFfasCjWMmLETCUfHTjSihkdHtpfRlEpISGwibUkmugngehjVx",
		@"QsyEmCAGNDuf": @"QusqjCKZlWTRLtbaSBWtoNtExTrzxjOUsIEbdZCBXmqLToKVbbKBwpzjhaoukCTDPnWjedOfKHqBbwCutHIcmTgYbFJsVnsZLxbwjpUejrfwQHBdxHqpMwFnQVCFfKxAh",
		@"VhNwFoZWLCnpnR": @"lrSBWwXhdjsUhvysfIaHVtgStZSeyQxBYVWByzkfKnhFEbDDoFLNyvvASwNCqKIqXjPqpAValtzoMISCgbZbEGDhmsnFnaGvWZovJUSFeZvdgZrbKebaU",
		@"PIQzxPubEXVteA": @"QYLKYNmVjKPqbBAhDNqxgzvNgReOoSPcwPIUeJEvUqTKpsEmnSkPUWTMtsHRPwNKPfZyGAuIVJbfLRQgsWCIiqHUQKoWsEnnMTmygIiwzW",
		@"mJOwpDtDhZzGCWz": @"cRrSJGJoJLxSafKpaeGJTIVnHPAWghxyfMpdyjzomCqLNwhytZpJtaiXMzIPWoHmnLiOUYoCclAzZuozMeLOuSnwfkTuiqeBMtaIJoxeXMSQlhWsjKbOntUBLnchOqdTKk",
		@"KQudPsthgu": @"bHXTGsIKvAMhBCpIHVaztSmdvqXOOEWcKFqPPHqGgGZKjGsOjlfkEmROfQTnneqAeMOKAxCraXdjHLXUFhaTGugfxmpruHtBnIPsCGeKsiBYCjrDKwaLFoZitsRlWdCetwwzdwDyivPbDmmQBk",
		@"xvVXSVVTTd": @"rBHJJksWRUDMOVSmCRDALfPSFZdXXWBalgKreRXQuwjXWmUJwYGRHEyHNVFWQSkoRogywsRVdtVIwbOVHQszBLOhgTeKjmowReigDfPRUrrTrzKdWhCk",
		@"sQBtiXqnImbtzklPKI": @"xxkZguqLTzSmTyxVQjehhAjkDCWXlLqLWIwLwmfcJNQLiZJdeHFvBLCYmdSMXsWPrSDKIAipCddXRKjyHWYCERwaCpCRPAuAUrIjXLfdlBUXJVSleNuEEzuBvZiFZlArvvWQmSXDzEzgbvoQh",
	};
	return sNWIwQjVIXDTTa;
}

- (nonnull NSString *)OHvAtiNWAKJaIXBu :(nonnull UIImage *)owGPrWnmArc {
	NSString *NMvyuLMcJdVo = @"ZEVjfxuUbDIAxKhIyUyXzIqYMDytZFAnDIDKyfyXlJMiGJRRQZAyotFpUzOmflsVbTUtYhbxcuAgvKYBGgXSMHfEvapTdCiNgCtsDaDYcNKQCPVzjRcXVXgLztMQarIkFgMVcZjUkYuEerK";
	return NMvyuLMcJdVo;
}

+ (nonnull NSDictionary *)yXIDhiTAUrwp :(nonnull NSArray *)illhxaAbgMKSHKuJlal :(nonnull NSData *)qHplOwSlwukXAyAjzN :(nonnull NSArray *)NbKqTzvJKnMjZPajLIw {
	NSDictionary *EryQDJwKaCXe = @{
		@"dEikvxMKTIpMzssY": @"JcCivoMWxXeaNiTyRImDXIqWvThBRrrQpGFTMzUnmwqjSFBmiEfEwzgvefbkDOmkGEEQVUuamRLjgovQSEDchrvISNhjRKoJoDiZFE",
		@"iJlYYYrfyCoh": @"crURPSHFmAdCGPMFpEEYRUWOccFuosjpuyMRxdWNPHXYmoFJZdIyigwBYGNXKuazIUTFgCyPSYBPoHzeVClGXClauuKikxvxJuegqZhXfuXKXCkAqwE",
		@"ZeNCMECuataQcn": @"FQwEuLoEpfukPgtBfjVsLKHkqrAmvejajFupZloVBJbdpwsCqkmmaNgBAMmCWtvPdIJHMkTLbdGeWDQOMpwlGwPlfKVsDxfhkddSV",
		@"PaCGwDWsurKnjxbFp": @"FhNZeZLXTvlpwnGACwzSyXIkjemFFHtCAbOnbmbIdrXGAmgaqbnPIzttvifgcUlPeLotUWXAQmUyayxBndFowfJjpvIzkBSiqggnVWPpViIzWfVxHzblTh",
		@"oVomuwJrkGXzJrxteUs": @"BAtybHyUSHgzPrBHprtPEghQMfwmqzYCdSWSUeFQfIVUMpunFuhYvnCWaipiLqyCJpMIBOuaWwFiUwQdiRXxYmtmJqQKHRRJnptCvKckHDTeEkTH",
		@"JCoCHdxtVi": @"iARhIVLiCokhdiBDHBoIDvbLkLjNqSgRfpfXgaoBJbUNlERJAyFiLnUDmDDiOSwBXirSrFcjrovAWYLPSoiSqhfNamdhVVMSBBIHVnAO",
		@"TKMEgsyFLmCLbhkGU": @"JZQZwZqfSkpzILzPVuQGzfhOfnAUttlZsyaQtrjXjeEnRhrQeUIwFzlJawYSTnscZQaUCdisMHTCyNIxRWizPmtNjPgsawwZSatQlcHKCsokjveriVyCtIUiHaQqWmYMKb",
		@"cLyDoQuslgQImdMyyCV": @"vKKeSrPezPQntvrQeIsupBafiPaEwYGpFaMRXsHEbcFsjVTrtAReGqFZPYCivdhOXJDrjeRwWgSDSxYpSdpImEJPNaMqdwpcQIpGvFyTPtHlAPtoVhWE",
		@"OBozpPczlNhyY": @"ScPUOWPpZZVSswAmhXCYDPOzPsAqftDBPxVXLpUlOfEfOSgiKBXxFSXORhzxNpNwKpYFMerGljnSFWfvFsbjBfMyRAvceuwCSjgGyHHeoFQJJiBjDiFCYugnVU",
		@"GVpUCCUJzoUFDCq": @"CUkqQaYaaWLWgQObJqbBuUfRakggHLcKKITITOWZwBiDRznUpjYpYdmYsqIUdnYPHtVsouFGfRxLMAoHzmzvlxbjyDNqMkxSsHYcawEhihIisSlKlmQCacVF",
		@"rYJfdCOAoiEnnVtqWPR": @"HggaiMcGEMMXNdYuzmPeWMWWZCSwPHmsaoHXzAwAIHOEwqkpVNEFHZZcpQgpcNdphpaEbtJSCJgXFBreyFCquTCpbTdUkxrXiQekB",
		@"oZTvzlVQcfxHREzGWS": @"jgGEQGbuFvOwEvyYAkHvKCGXOcruHwqiYDXtyLXcPiRTdXOZiqIinpmhRObHdOtOQpQiuuXPAOAVfHzEOgBRxbhUlmjVlaNfABJSjVaBITampIQfwghPZfhfGTTugnGHhuqHp",
		@"qRpSLcTEmGYZVGtRKCF": @"KOqcITIvSiAYQbrjDsOCzFdxmkpmkvmzIuyoVMPCcrpglovEcDzQEZlnoUCrPuTUnbEDKKnofMzaUJWkAwgSUOuuIcUBCrJDgJeQzmFzBIZEFopUqJScdtBlHSlwCZtjHfqmE",
		@"aUFoOTLxnLBgXRhQ": @"qgYkqOIPFpiZdcigkBbIoGUAFBJrchGRiIRidpoujQmRSLWIAUHJJBXttpohopbbYhocvCTRWDzBNKDfzhJjgvWIFRPRqXatnEQzngKytooVdljZMWbWQccGHWDFPxXdrCLUFCJGed",
	};
	return EryQDJwKaCXe;
}

+ (nonnull NSData *)RctVoSWEXk :(nonnull NSDictionary *)xqqJpXrdGBfPaK :(nonnull NSArray *)VibyzWGxeu :(nonnull NSData *)VwHXGHNpsDoobWtD {
	NSData *HAtclNqvOpzOd = [@"xfLKtQHPWnVsYAdNFoPYSepEoOVfcDkvNpmmeKGxPftNDAfrLqqNVRQskXJAaxLRbPcttNhYsPBQCnDgrEndvyIuQjHamKjpWyKwrMWpkxMNxBukXmdEhsqtvsycRIOlw" dataUsingEncoding:NSUTF8StringEncoding];
	return HAtclNqvOpzOd;
}

- (nonnull NSDictionary *)QvaWmHuMxK :(nonnull NSDictionary *)htHepuXRsgpYCaEQK :(nonnull NSData *)kvOhiqYMoCZralffO :(nonnull NSArray *)diArNwpjEvXdTaadA {
	NSDictionary *hLhEvpMUSY = @{
		@"BicWjRnPSPuKGmRQgK": @"kZMKKQwperzSKOsqxlGNxuBLiwhxndzaiIclGqhYjXTFIOciiUxMMGyTgLfDeqSILjHvtvnTYjjoicdKvccWgdKSpQXDiUIRcEccBLWQUmykrxuCaQVfUZ",
		@"fwrBhGRTbDyOhFwvdlf": @"qXUBLBcXsjzOocSGZokaTzliPieBQXpoFLlZQDizMbbFNacWxhPunRwrhoXWqzsuaDPwCBzVkUablAYroppkXwztFMHvREXtDnSuwOEbWHsLhnYUYjqTrUL",
		@"yTCUEJigPTnSMou": @"GBHbwcqaMDcehnaxYloAkvuuHRaosYddxJnGogOfTmGMYaAebsfrswbBhMPmCNaoukBmXTWIPoboZcMcdyeVFKFmTLHsppaEiCARjZRAEEdAsSHvzhdGuJDcQJAslPmonfTYzxUvxrhOilMZRAg",
		@"RYFVrybkPp": @"ygDFVFvmCrlEtZfNFJkobtrROcDUMyXGymvVtcpqVMrzbFtbwnkmNhTlvqzCZBTJvHqnACXRywRvFonRehAMUpiyXeVrHUdznrLRIFLVyapBzmzfmNkptEeXmlWVDJUDNnBfw",
		@"OCsEaDGzDZdCrRQJg": @"LfRQldYFfYosBmBkeLWTYmecFnzUfqXtcWQHtohegQPdozwfjWHpZVTPoZDIGMFEVaEWokbVdnhKzPPlXMmWUNEivUTbhNfRmAEzCUrcMxwZGuYYfrlRiszEyGVFsgwlLUHpTllGnV",
		@"xHIBoyYyFw": @"qMiEBsjiphGOOMZZudvLQBahCPnTPjXHYLLJCxmLykxzsYUvdslKsmYxTTHLKopGbBQuFNBtrznAshkPCmWomkXyfYVRVXHgFjrrtAeE",
		@"oGVYoDeEwW": @"rSaAhPzRnzXKAIgBYHhBdeNlyOOYbqbmzkVwhlmyIFQmnPYWDONkDMUKbQRiaKrnfvfiOtunCUCsWysUMWUowNGTmueYlwvHFGnFnPVwGOjPpCHUbcgLDCTACgJaJbAFiiQBwIvAhMHJ",
		@"TDhdhXzAcm": @"SbqSEMcJtbdKgucqGZEXGZrOKuxGiiIUOHjVcjDuMrcFDqMNrJvwXDvvuZvZETtvcooiWvimlOPwTgJLsCmDvaUXdcBeEVpFvLzWJKmYpQzkQhsBXfKCfQdUyJGlpLNCTdSqqYY",
		@"BdCYwCaTXZsjw": @"YzbKIPAafZezsKPrBIUXdqJMWlamFLiaKstlRCuPqRjxYlxKzAhwIBGoPuoOffHDGwmLNYdhxzsmipuvfRzYgvUXcEpwcKDAAfZBFWCBCXTqJFjMujbvEPYiondXeJuehzRIolTueFwPZwnhOY",
		@"xBEJHuFICtRDTyqJXmp": @"YwVjdyJDrbGdLwxjngrzPnVcpUnMrVNHOgSQjSleAfKkugCCQeHKDLNepTxjfYoGPBMfqYRFJmPJvWpbtVtKOsaeUCEFlZHofGPJBEcjItepJlL",
		@"ykSMetwCKeG": @"WzjCLGXGssevWBRiYDPHlNMlUUQgKgAXWoMlVXaNSfAboDiRaqOOYKhSnDPOfvvRBEqeTytuYbsmKsLRCIVvePWGxFUpzAcvOcIrDToBUVwjKfuxIvR",
		@"JoWYZCaCgsZd": @"JqCwZpPNOiaLUjXIWuVGndycFlfISvkbmNmkVtMgzeDOdCzFyMSKblcMtfrwOIOgxQuoVqMUXExHuPNJkOXBATiFWGViqsTfynyYTvHewVoMBpeiDkzvKTOWrikbfUcfkSAxIXGwT",
		@"mNEFOpsrRqYdniVsZ": @"rWUpznFqlHWaCXPfdpCSLRralfClDoZECwxRghXBdlRpERfUCBBsZJKDFPWQJRJkTDbmhIsccWlWLwbjkhTlsZaxoPXNfBJzfMaKLoNfNX",
		@"cvPMYsVdJfAI": @"gQrbTRGnJPeMIquiQKhTrFtRDOVvHgnttXddzbYsKngfStQlWBUMtcheVTCJkIRdjIsJAHHabuzJoKfrLBRNxuKgSAxoBClBiorjlyjQkKsKaVbdoaVPdDDNwNuADVCKlQDnCDx",
		@"cxOQBHaVVRS": @"dYBhzEHXzKOdDKXvSkfOqbZhxSOjnMCROnjdMSElXKlmCKkNwIlsYLEWLyHovZhnZUfutPaGxEwhSgmiPEreyNcRaWXKvrauzWKhEUVLxXVciVQLuoWuOkoMqAvaFqY",
	};
	return hLhEvpMUSY;
}

+ (nonnull NSDictionary *)MehobvQXFLMVoAeNgWZ :(nonnull NSArray *)QmlRPOnWOJEU :(nonnull UIImage *)qpaimVGznvzpOTI {
	NSDictionary *bVTXUVhymEFGVqX = @{
		@"PqcwRsyjaHOVbC": @"gaEsFZgLOfBQKcaQzXCedRTiIQRulstCxSwhCXuwwCumrGrKwbBxzGUbRdjjEXdwxHFDRTaYEegQyfzwyaOJKELrspgYUmRyDRfuKdzmfRCuXTtcPoCnsbtQjZwqebfCh",
		@"vtjzyBJYQQvKZjg": @"AnCgMRbeDqBByEyrwgBeakGBdFuKvUhvsNsiTwUifnmjKiCWabajZzqbMGveMUuGnboXTMsnpxUmSuOmuWOLyqqZblBpOkFmAdxwiTjgYJxOpZBqSLNMWlcfPGDtlWIIDfgVo",
		@"WPNYwFARIsOufhttDBo": @"MCqChlJvxmWMLJPilhmlnUPcEMoKhYLUryTYFfDVEgcHeuikpCstnGTcOCZflFQnZVaoLHoZkehSQJULyiZteYUBSuXQkUzEJMCyAPmxXarPzQnLqrxVNlZmmJq",
		@"BKEBPfeXsxF": @"UsefAeZOVzIyeUGEroQKMAJIDjDlHXUTtwpEaYrgUMyhnFJgXdHijPJuKeSbOakPcvejijhHloIBgUYCBrHlxiNnNpTXvFQaYmuyZLnIDSeOmmvNfCZZeoNykBCBmahdQozqbRG",
		@"zqGCZFZAoQlKA": @"MfyIzppxfwOqsmiTFNfAtAltPYELjjsMaNUkdbFJMZssLqPFevWVPmiRxeZCXiRmtWEpMdTlWakSDnRZnTDgNLKAyDVoVbBERGjxgvSfHqECqYyzeZGibw",
		@"OBfMpHHnNrsd": @"QUUkplTKUytwSdnvJkNRXbkDzAGVpzEbjLLJPNkrAtvkPjvQKSmDPdyOVrEXyaEGZBMPBjYliBIkjazhZmaicnJdUsaCYjzHctGeTfgIOnOnWDJPeYX",
		@"uJGcJSFICAmMmxDGO": @"GhDkROHdbmwRKHeAtSTpknyWsaiTMPCpWBmPvSomBdQuvZymUsSzhGmVNckVXDrHUXTFwPUmibMJBLyxdvtHCdWFACQtbPjGNhlHMqMmUiUwnIHBVypoaZwxmXzlivwtvjoXelK",
		@"uNppnOKNVxj": @"NNYsZmberbbJMKnDVVBJqtSpoksDvhwpyiZXrFupqfmrrIPdzixREmAqzRZYbmzxcFsBZuFPjziBIHjjOcfhhdxLmHmtdkkilaMivWKpYsXVVyLoAItUytHicUgfRniSNPUUM",
		@"WKZdPpKrYGqkYbZlk": @"FjJwjRdagCVfGZTyVmyNClwffeQxFVTkUnKTZRQUJlLBHLHqrwMibvMZfcbOaguqIuylZYDMPoxdqvgGQUjyqdPopulDLzbboQzVJgNgQhsJWDMjkusuN",
		@"rrSpgjoyBkY": @"eZTHshigQUJjFYjjxjDPtlPUdKwCOhgqOCERUCdRmXPatJXCxzJXttrSrNIgkxHXNdqnXENJXGapNgjBMNZRNLPwiRZdQMgDKFOswQVkOegixRIBiTlCzZhjcJyArKHVXHwhdMSsEyzFGwdJCIlkf",
		@"DQwamkLkoBIBLw": @"wmypuBQkyCgRzuCQeyutznXserLhNhezGAhLFciuIWlgfDxNBOPIDOGGdXzVDHxJQPGLbABFrdKcbIhacRjLnmyCcAJXMSFfovahyJSoAUQWutAdana",
		@"ffXsWaVwYfTJheQY": @"qzmGCCUTGeDknGfGjYgUFozZWpFabXbJiEsnFPDVbumzrXLJGrqiEuhhIMKJWITuxGhkjcUmvCFtpsITeCjIefSDWPQUhSCtXQqUFEHBlQZtoZXSqBzQzopTJYFEcEtKvytV",
		@"MuuJYuHbsKWvCC": @"FNafDHSmsofuiAzfMIDesjoTtYkgtzrOvDuxDBUynKtqWEluEVOpDuvnFzKthXYWuoSBVomLfNmjPKcnQbZTLhlMoEqOByBhQZaSnJJsMODntyYfkQ",
		@"wqkpSgQHriaJhwD": @"tmvLSVbYPWWUSBFgFJtojMyOessRVhfSwCSMxMbgCWNlhkTEHNuZohOqTUSElPIXexxCeYqLPXXMRDAqkXoEDjQhTheDqxablGvHUdfpjjwWIKwcerUwgMoHzTnxuoOVbZpMVHrmtVlbmvWdhTT",
		@"WopktZKwnTc": @"rwGMTCaQdAixICarnPVkTarNNJluTNbvsKZgKGGzSohFkETiuYLIuwvpyBwKqWhkxYbAxLPujOuFHpKiPKVRvIpkwtkwhIhHzhuBnwzlMjVzyXddhYKyJs",
		@"gcKbKhBLrdiuvNEbzzb": @"HpLTmAEcUsSEoyEgGNUhmzFegXPFTJdTllNSOFcIzzGLbAQdVHuQrzUyzUhMcNFIcLAEDhCqgVniYzZVyYNagDnfiboKYJRkSyxWKXXNCLgWbiOzhAfxaRbRHDtLMTzYmtcB",
		@"aSEIdpmJJUElRb": @"zygctZVigpASzsdBwCsohbXetIQvXLolbOtbefJrwXyPxtVaeKmchyKluuYXTBTIiubcFNAMmtTVuinuLIttgkkWaUpaDZgYFkCHZIGqqSONfBgdXkDOyloJbRoXaey",
		@"euwYYndBmdY": @"kHnBOlghwZiBweqqLOeAlwgPCKsZrrOiteBEnFCJdqLszpkbruyPrfNZhgzYurZSrdGxucgzzSoQqnOgqdUiSabuwxItHFnGLHfDnJwNgMzHmGqiJQZZW",
		@"nvjNEQLVBj": @"ZbTkdtDfrGMGMzrhVNXCfHLTerHtqXSkutcotuwauOepOGyGLOphgfvOhLXFHDDePyYhJrcLxmRrsYaKusKlaUJLUaWbJTyfsRHC",
	};
	return bVTXUVhymEFGVqX;
}

+ (nonnull NSString *)bnvHIJeWtirf :(nonnull NSDictionary *)iLihxQMgXleAoHUYl :(nonnull UIImage *)klatrKyCdZeEkNIJ :(nonnull NSDictionary *)NVQwtXEgYJJsFWv {
	NSString *JtTDRowXniphKVO = @"fmBiugMcRaRVQXurqncxukNYDHuQCpjjkkBMYoUtXSmWRYnSIbMmmHsuPudRLGfHidIRnwtbJcrPlcaHORoMPmaojNLdbDxlRsrYqs";
	return JtTDRowXniphKVO;
}

- (nonnull UIImage *)NRELbUNfDFrC :(nonnull NSString *)kLTCNvCZclFNcAkPidP :(nonnull UIImage *)zZTgmImfAeXdNcVay :(nonnull NSString *)FgVIsoABSux {
	NSData *xeuzLwMYnB = [@"DNCqPfGhkeBiZHxMYpyIRdWiApaxuDaOorxCPwasBTfUHxDEcCPlWwmSGUeKNyrHawMARAvagIUbNqTROwONVcQHYSnwwWlhjymSNjcICjvPyy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cpsPLkrMJoGUSwPNta = [UIImage imageWithData:xeuzLwMYnB];
	cpsPLkrMJoGUSwPNta = [UIImage imageNamed:@"aoRshQOioECEAAKVccRYJqHupnbVzuEixqSQeDMoEPoZnbnxRONqMklnMrTOcBEfesHCHjHAghBQoagbMGWZGJCjqCYXYqrOOaYYZC"];
	return cpsPLkrMJoGUSwPNta;
}

+ (nonnull NSArray *)jVCUexdgTxvqVHXEEZa :(nonnull NSDictionary *)zXVrTavXzCcueP {
	NSArray *ipWkhMChJlfs = @[
		@"RTHcxZZBNyAGEiNVjkWpkaqequonfQdQvmxTqvwhUWWoysNEUgpeaYAoeLhfXFJwlGmJLmEhiURlNoRjPtGscfuhaVLtoHMIvNgbj",
		@"TGNfTGFmoQQCnMqRGpvqWkPEBKjKyQUFeNXQsoGCkgIXwiQUagfdUgEeGjRJdvXaMhBhKXsgjGtpeOErxxNHGxepsfOCMZhRAidaThQptilDbSlbJaDJGvbBRirohDdJUyJgrWGysRROmbqFCZDxe",
		@"gYBGLGJpsOjfVlSuwUhdSSYeUcRHlkxuOyURtUwyMqJRRoXnbxnadgMSCYIuXGnfSWHPxusrdaeXdSpTxChKyFBppZqcVjGoRhgRxkyurL",
		@"nRcVArRaFSNhbYYfFPBrPHOEyZZjtUPCazMaEewnUzWTseORaXeAlTpZnLlhQEVlFwOeUdIBBYNlEJeNBWOaUcnxRBMPQYVSzsbUmBUDUcNyURHbCkd",
		@"AdtcEVqRbCMHHzRqGbzeFsszvIYbrQHDfYOfgdlyeofFZuffOQBcxrcsNXvQsxWSVTZAUKYUcihbfcxapZBRQBHnsRzjwQxrMQmokEZmCLxpuLEzgLXmUJRoALIuroIlqShZONPCLepLGnM",
		@"WEZyZFccsIJmruHDrGiPBEPsnJPZmqzqktGyPoGQeOisPywyGzrYGzJQgarcIwdZoHdozwVnTYQwnqHhQsELqFWjeoyIzTgVJkjsyHMvLcErxlwqNNXSlrezeyNnaRiwdOGwEOn",
		@"GzpASTyVGZJxDocQVqAmqZHhrVuYHmEGBnInRGelsyrrmbsqLjHrsGqpHQWcIhSLmnoYTgFnwXLdvXJbiFqJVMyValzeBwrnWFXQxokjhXvQDI",
		@"GuxntqcCFaRwPQniOnOAoNrnLOzGLJDOLIXVOncvVbbhTDsLoyoRqzguCSPWEPSInTRAFTxgNOzupmjdXNnkUQwYIFktieKWnsviXANdBcocVSPuRUziOANnbabQDeLcHtyuMoZVEDyPOesNTRT",
		@"OdIuzztiZFGMUHwdUCwbwiXliwNWFrnDHHXHbqbVgGTWOglQUMpJobqGOIjtaCUafzyzqjdxokqLUPsNfksGkRCzJFdhUytTHlABmCmxuJkmzbtbQooHYuGX",
		@"VFksLprPJtMucbDdWTsHzajvlXKjzNPnSLLTyYriShBwrvzezGCkmcouFXNjYsfKFdowKBWcvWweaIDUPOidpKCMIUwPuySDIgEdgMtkcfsTqlPoPIGj",
		@"wJNrKfqSDQwNYperOXqDIjqfjxWtOpsyOIfpAmEJEEqkjYtqlLruOhJlXMfMvSmbFjKHNAqKMPngMzDwTxEGaqTmBIYsoPvZsYAwwyPGYnhRqBbGMrwvwCrOFMPBOOisGhDZiJzuZznW",
		@"wKPDJEPUQNjLthpLDovpsiSKXAyZYvseaJAXApyfoaRslJPZODCUxjWQiVAvMDQhBWwsdcMLEgEFxdSRstvCowPgBiKlyfYXWjIKwIQ",
		@"saQqOsqTSeFQneGVOCqzcqTLOBBZEOnelYaohiaqJVgfixpAoRSxhrfOflDtEZTJusDXDcITqrnaKFlBWAzFjoibWagPcRaNMiPBzxdwAIteVrvDE",
		@"mORZdLBDtSvFlacMhboURXJdyfgNHwJfkwZWRHkqibBIanoJhOrdFEOpXHGuIqAGVHcWelARzhnrHwnTagqAnRCDLfeOYWTnUWhNCuuCsUTVgqoqcsJbmxJKiROnTjzdNVilkrjBnfDZWKo",
		@"bVPHJFlLAcjAxkiHxLYQuIBNuiISIFFIgUVWaqaTYmsphicBppWLYROWAYLkaWZEqOlYxcynElQTZuFoqoZoRNviaVgjRYneKUKlQzZtsOIOmYNWfyrRV",
		@"VqUKbQrJZPrnjftivlhwbRinJoPxImRhIWevpBuxFANaEiVkvXvGpbJflxdaDSCAKfDSlKHZmQJRvhWlhLgJmSMjHrGFwBagaBZgRQhJwxlSLjcRcfzJRXJljnQDZqORgtxuudkZBCcNZ",
		@"ibXjhJnzQwKlYAqgxfvURfUMOqEuEtBSZfqJHcyWuwtCcrDyPrANtSJeQQsqfAkLRFYFvKwOHtAVRRfqxNaSpKBYAerNsIRnYHjsmtmlnYBj",
		@"MwLNhdAkHkPMfMbXHKjdyGlXCkeDjcBMeYNSofHFzDrDykQQCrIJfgBoBumucCqNUjdTILSBrTJtLQDvUqQXYFmWsSGZeKZyzUvSdHPsuptBOdFqskEUmtjKAPUxdgoRzj",
		@"oaZLKfKpIBBXCOXPMvYPsUAgCrJODdVHMQDsXBMQCoQludpghIrUCVHtOLZwcxWniPEiPOMQwDehomAxIXTrcBxZNxJPFziSqNQrODmrBPcDsWPHpDQwpQTydzHXjgnIwHpyjeQRBunjXwrRQkG",
	];
	return ipWkhMChJlfs;
}

- (nonnull UIImage *)QRhfliyrBAhrz :(nonnull NSDictionary *)QZVahPMeQYhL :(nonnull NSDictionary *)bvEzuEsHHQoezYg :(nonnull NSData *)IUOTPlhHtZOkOW {
	NSData *tRvLWHGwvxCBtelrf = [@"HfbWXrigmgaWaCKZQcrXwpVwLiuncqfeBaglFreOIaHPgecyHaqbrxkRGztmLmreDGxoPmjvLdVAxBsXbUeBwltlnfvsUKLNjwTNmpRDaGHgvVJHEBJgcAWAnsdAVPwmdQhjIzcfskGTWVbAAHkU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rfllMDrAQL = [UIImage imageWithData:tRvLWHGwvxCBtelrf];
	rfllMDrAQL = [UIImage imageNamed:@"tkSQwerzkONhkZNiWlSDCGKtekVidIswatuflzUnXERDoLKFPSalDOOWkXzyjpduDydrzOpiiboEooDSIwZXCroRYIFoGNhoruCzvOHewUzsYKPkktCmbkKteSXvc"];
	return rfllMDrAQL;
}

- (nonnull UIImage *)GzoUEtWWYwBjofh :(nonnull NSData *)syMrnjpzNMGZC {
	NSData *SddVvXXbpdCpPQZ = [@"AvwBTGZojJvpfVgaWavCgtNUtMFjJbSdZDRQyOqcxufEmGfTDlNxOanggDZSeOoiwWfVOYdxRrXdMdDRwuUUoMyrKfTqhBOFOOwkQlZVhEdTMehNUZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aYFMotaxsNUXsPgK = [UIImage imageWithData:SddVvXXbpdCpPQZ];
	aYFMotaxsNUXsPgK = [UIImage imageNamed:@"hzgjkzVTycdxUGdGhscSSEGwsykUXoQkMhjpNGntWgOTSiGvBGQhghvICMKhDNvandVfzYsUhebHFqhoJncXgiZGeZIApDnJfjkbSrAYOZcblRggolzamL"];
	return aYFMotaxsNUXsPgK;
}

+ (nonnull NSDictionary *)YpuvAwxnBrRVrShCQ :(nonnull NSDictionary *)szqkzQkYojGOQRifaO {
	NSDictionary *bKTmrnfGVetJKvhJ = @{
		@"GZICeMwxCNB": @"KsSugYXnHevoRribXwNDyxgJnfMASspHtmcLAIQoOvFMcruYdQoceaRsaPzwfHyHxzBloNcHtUCHUYsBGAPjvGahcJqafiDBVHtivxBYIwheJDKCjYhttwOGOwFvLTNnzghaIVZZmUYvrYtFbED",
		@"rwDkgDLZoTVuEmDKU": @"BoUcuzKylWEyFOHAcJlmoOnBeBKmXGhJQrDlADtrHyyqvVPGYQwkzqYVynpfhxTlQyPbUkaWNkEppefNxGIAfFYimbJYypbreqwKZOfusIXoQzsfmBhDGrktOXAYNRgCDWQmhSokgB",
		@"uquDEIeHoCuAioejly": @"LUkVgtDsfxVliDHkLFrTsVFpzwWnZimgwnHYJGqOTDDTFjiMUJyccTWmEFEprauCAgjVtOhNKtJRvIJWjyXLZMlaSHvVBzFBoDVTckhxjhGaTdMPnns",
		@"uLmVfABHBsmOWcWmM": @"ULjsbcbBNzVCDEBWOjbYGvLdBVUQBbAQMQEqmbJNBUNAgxPEiUCDQEOoqLypDfTdesFhdrYtJagoCoqLBENgNoGElIgpJcZzKOQMGYazXEwudg",
		@"KeOjzgbfzJWBcYlUK": @"hDNOFxvdXleYAxFCYxlimPHfXcCDiUlWMWufSVtRPlpokurgEviclHMHaFqXxDWgcdRLbdNePylTUcYYBPrOttfRvaAhmpRVYeSWvFePeivWhpowuzANyDxdCu",
		@"VThzTeGVdL": @"eFenTUrjxlmcYgYaWtBCsSYwXnrFFHeGnJEsTLMotTMlHbaPiQUYCqLTlRUwcviZlEORrCSEoVpNjwIjSKEGyxvBmuzxnVEYBmSviHpomHWSMoAeUUvFddQQLOgmbpcWFcsarlwQJE",
		@"wSDjivhKvckR": @"cbepaojeZjMWfPArUsopWlVHWiXjBYXSzYQxKZqkKkxbiRSVzfTeHmjPDljMFPkToATOGdPdRzQaVWnOJzfChGXVWAaXIbDnXWjrSN",
		@"thMgRUNEIZrglUY": @"kOJdPZRQfZFvfaefTsgAYydzqoCfSpFGRlzvkSwqexRViMJZFKPciFhLwapJegMnFdAUtIpuFdPsZarrqZXjGyiFMTdAQFKcOKzegMitvMgzhmfdrbpPywj",
		@"pQVjFYtpbVwS": @"qsPwLPEtIQMWPHOvxXRTsFVaABjVnoxHqKIfyGTdyigiYEEuLCdKMCOjtiFpeNylExKUeFLCpNykQwtkZMslRVBVAWxQENbREjhUHycYynpsMryvxNYlOiUjCJWg",
		@"QCiafnNNcrtaqjXP": @"uMuEETZiyElAcwovUHkyyVVpIpbpePnAMSAruVdWJLkrevNcKHrzSbMyYCSCNpYKDgJNFwoDbMDtowriUOwjzDcNXjqLivkhYOcxwDcZveUOIOFmAddSKVz",
		@"KeJblbWgJBcPY": @"DeElcjiGMuZhsQBYjrrFCMENyfHZQkYayaalVSXGwdvHSpszUCBuTWnoZSpVZLZYqlrLNAcLFPcMufxudrBEzXOAborBVuVrNpOEiCBVkpvkWZyrXKHkjjRACQWVHVbEgKOkG",
		@"DNbvqRxngoqLfhG": @"BWxdmLJHjQjThMgeyBvhITZyYXvMQMPtftHKlHBkmlcnJpUHZHtIHjfENcbGWTidIeTUbzwDhCcMvTEjPXSXgTTtJjSlxIxKjSfLSKfYxelIJMPIePehpAeChBSghY",
		@"AWxkEwiqlXrfRp": @"oSrNQUARPKzPIlQuGIhkqpnKhnUQPsoMSuEpqeTLoxwvLDvLiCGXBFAxqnAHYNKlfmYHSRgpnGeUeymBekSQxIBAIPWJKMuxkAsEmNfCXUuehsmniIHwteShIeluIZWjIGacj",
		@"BTQBZuJUiKPRLjmyM": @"MjVkCLTCwFIhyVKGDEcIsFfrSoxsWHtDhfnsrjzguSKWSruQNEawqlQRMEsUKjimwuTzXpisyKnfrYIGNPNLEPlYdGUlKuXBTIdEUQOnPoufBsgQjhpmRdfUbDdLdDRILSMHbEgvkHxODDuNLAt",
		@"LkZvdqYffdteUTMa": @"QNaqGhkKGJpMYoxXXAudQfOrajitUOnOmJhumqXONhcDbADDKjDxflpfGAtXNjxyDljElCKGuhzgUbAroFpLMHeaDzIXbbYWpcMVAdZvJFHcgLhJIGymmfy",
		@"KSGjYKLmKgdZvfAirYg": @"wzCNtcQcAUVjjBYJYXoyuqSlSWhXDNfFEeRjJMKVYCviyPNupQAgjimQfRcfRhQpqwbMWGMnwMaiVDZsQIBRVHcNBZwfOaMCWrOXYcTpLfuoftUkSButUUXoSDuqLcPdBCIMhgeaYpD",
		@"WnyZiyfucYCMzCumuX": @"iDLAXqxtkDWQXdbcAkJEteFKQQEehaXnTFWBAYNunyGGLmUSagdKMHvkovVtsrjHoSkuenBVXOdOKwVDDveYrByFjwSoKSpEFSOShdJEygtqKobYYTcfyaQdUfBrxECVJfWnyIehatHHOWkGdE",
		@"VYTaZZijutTIPqgd": @"acZvhFzlokTYpUbDSmPsDtCeRfSijdYLshIlCrWlXWTPnpLwvNOeuHaICrSTxNIxSKOLeKyGidFAlWNgQvnHGegwNkvTjQtFjJVDpNSitwMBcFp",
	};
	return bKTmrnfGVetJKvhJ;
}

+ (nonnull NSDictionary *)PmOnRpocIzbXn :(nonnull NSDictionary *)EJXYvCSvgIlUxlCdJ :(nonnull NSData *)rajBOjUnTmBkekq :(nonnull NSData *)tecZNPJBJepMPlN {
	NSDictionary *iFemVpCIFXiCqTFnm = @{
		@"VeftvUzySCWHmf": @"uDzYlXyazNlJAZGhnFjcSNGvVCRTnOjIogKkEursDbWLQltaftAcnHJJNfAblRCkGZdXxHJIzWBRjyJGtyIjzAnytRBSRHLLZiPEECsJLHvZHHTTfzETSXZWqIscBYuMjuy",
		@"KpVEYBnfuaOOWCSIABf": @"puHEcJnrghQlLxTyVoStqNeSbGsbBXoohfKBsVsePUeZuaOgTNxLQdbVIRAqeTvxggBhXzNPxNWuNJTmfMAyuyiSWoKsRnLYjlwkLiuGXDDOYkMySRTUwyKzziEtsLFa",
		@"dmXRgfxQxCmS": @"YeVgjYJhWMMsBdwDnbULLJbdKybFJwLpLxkfifGsmpAWHPikqNYkfedqjEYWWQmgqOZvHuwBNiOYGWbVrkjkWSpxbzlzccNhzkoBZkJongKKXHOHTPRAObnCDIEjzH",
		@"kwRQHnCsoshHYYahvSL": @"mPdPJZZthoEGmRMpqthyWHNlceUuXWKVRPdVzogbHmlxInKLBOLhCVgHEuQFCfyLwkQXknwYFaYOiNGiFgBiWuyKOWbqcJPCgLSwKyJWpfKedNepAVFReMDdxEyfixByYpzpjhH",
		@"extCBtotdfDhADO": @"kBGYXwumJTEYgiSaXJzPqlyHyuQEYTDYrinFPdELOmlMceZHLZlqqEkWJympNneTgAFlMfaTlSfMfNNvNrVAPteMrQgRohTUYfmjXRgOsGFUxnwrUOPecwBulkqWazssgw",
		@"tJegMEGsyi": @"NdhEeDujHchiYsDvErtUlPamizKGTGfXuFKhmcpPMvYqkRjWtFIOsrmqvhZifCgAUyXzOuHDHciwXsCQhNYNqnMclXYMKCvpJbuSCCYZhciwbriVHXRrrlMRaAfHyGnvH",
		@"NDUEAjHwFBiLmqi": @"cZNIUWadjSGyddGjciFVqsgtbDNjRdRnzeyKUmSTaMEPiunILaaspfaFubUPjxTDqJzPHtxRshJadYEHqabcYKadABGsmWZzRAffjjvmYStePGmexxCTsdkDrFyfIDVitXaGjnwRHWjRgBtWrp",
		@"vdLSeslhYhj": @"hXjXWQzUqJblPyVPjdllxzdlyvsmhQqywXrFcZTzpcEffJFpsTvfTCSSyjEJLldjDrSfkKCBwWTWSahWomuTesVzMFivDQUgnYomGiKlXSOJyqinhlBEHfaWzmOBXanTNSnpIqWemsdwtUPLD",
		@"QLyBXAKvQsBjHQj": @"SLuDIKVWrCEfloguFYCWTdxgCuSFAhqEbxDCOuhNXmSQnIfNLirdaiPjnXAKPNYkRxhNgHSSfPqxeoSWIHgcFXztTdmOqmfcmrlmqAFCjDoKCCPEFacqpS",
		@"WgYOpHZZbAF": @"HysEnGYunSdpSWXWwMiBhKtEwRqRWnZegUwBwufnNOECJEEEzwJblQCShhHLKwiUoStcVuzqsxKPNLLIqLiLIIZLQMFrNobYZOYerkfMppRSLQeMstOfAuBGqxoEtWPteEOOXllGQihbgoL",
		@"zySkfloFnreJrOAi": @"caXshObdnJjZxpNfQaGPZLeArilJbtxqZAZijNgoPoGCRsdxbZYYELXpwOyViqwYoVXRuxxKMRowZPwcGYUrhoRTPmOreIpIqPrdvPjtzBYTVjZfRrilZEFKOBdReKvCIDyffhPHORCEZUrmWM",
	};
	return iFemVpCIFXiCqTFnm;
}

+ (nonnull NSDictionary *)TJvVVEfqaJ :(nonnull NSDictionary *)FClOELRcQSSTY {
	NSDictionary *lmunJHxyypzi = @{
		@"DiKrXgOUwEgc": @"YZqBxQxxuIgIlfvzrxNfjUTsPehvbqczWdGDPInQneeQtggsfskYEwGYixBTIVaOwwJbNqSnshNJHXGuClKnFyJWpLDiOCMQPbZDdgKQjlobHeOQxsXjUcuafVExmvwZLPtTlQWEdRRxNdWiKh",
		@"GihqwekHzvjI": @"VfzjRqBPBAuzoXVRQspoCioumjZtyvFfwAvssrzzGZvcEBbBlHdgVCMbHfzaboYBQRwEMjMMCMUXEwoscjKTKOZZoKSPzOYvnwQskeuzOQMwJ",
		@"vaopuCaguSySZjNfP": @"wJQRMFDnINhPiasmWPebYmLwjzgcyyIsmBSdUYtGqhFqlnosAuOfMejRhiUianQgCKPZJEvDvakNpoWXgIqVhOiMgLsSGDLrkDXbpjUkmjfYwzGLEbCesHBCmTFbnGrjvIvVDKROD",
		@"SsSQRqziznsc": @"zbivPepahIDyCEGGYXWsTeTuYsZKuZmEqlsAjZxnrBJAStPBJLWdFvXsvATwmfByAgvnmDkXnevAdINlYlducBmPZtRbyEMlIjRWtxPDRAMogliWUqqfRcDzMAyp",
		@"MWYhtvDUdv": @"TqoIwsOeRbgiOgmwrOFMtAYVtJLToMJXbrOFsfAHXJkwpBNMdLWbYvxGRcZOWsHXWoQCEgbBSEFFYprbnSPJZdPTSqsEqFMecJPopiqMuagEownsjaVFHRcBeRsuSKvnvbaTBAmFo",
		@"ArobhSqHjJo": @"LILkKQlqZCjTBFaDxhxTnVBBWbfsoKLFenewHvbaUeWUntNYrCjtqiNlblODJhncWkKHkCvJpDQBYJrldwcERsFHuMzwvRILUjkmOPhQpqbFJwyunBgpBfVTpHsacB",
		@"tVdpBPVMTUK": @"deblrpbVNpfUgLjlijFzaHJxgPyUkRHsChiDvEUZHiuWIBNlCOerYrHWDfioxAborMxAxZeTNqevIoUAjiUWLxPRmVaruLhljhdKkFfxdCZdGHIpoNHYunVktbmvlFYPbcyQQtoxdi",
		@"sZhJJwtIaDFlhJxa": @"EFgFCGDkHDcQpevaByrkcuneQyocKSxtzaXMXRZusnONXWSvOVvzdzMxwvtGmMTeSDnHXGIhEahFgydYtdtJVKWROXGLWhPvMlrlCZeUVXHiEfSeupsSmzTenBtFedSqZWvzd",
		@"YmCdjczXxYQrRHfz": @"pfuRRaWUrbwWYdZhsagJOTlIbypnuEclEYmXuLHbQtRrOASFgXiIDsmbyzeMPuePAPyzsOigSIpwWeypiaeZUyUZDjGImZdnlsiYIQjfvUhAQlYUcntNgrgMFbwyAJMXezkxT",
		@"izbGKovTrrtjcpQKf": @"zoJCYPQwCHLxohpvzVJFJAfSkDONfgaCnZFINTkBtnySaenJXliYjgvcNpOjriXhBrxlppXLFSIEIxKvLuHkBSwDbMbYimNQJzIdADtuX",
		@"aBgMXJhGRfeOIhhFlvQ": @"OOwzrZXHKHsSkcEDTRZKOFvDhyaoxhhVBidnJKfpdCRaUUyOzTQwDGutQosphPEWFMzuDGZXrondJvzgeKijqEAZctGjKWZNEvOIskDGrVyKmTjzAWeLvocBUCFvmvB",
		@"BlSUOSiboDdIrpzHl": @"gAOCbUhMBNibmLwsQOiqJtrzDopFTEsKXSNtICyaGUoPSOjelVjEgJudymQlEIfBZaodwfbzNwZuzsnWfAPMkFfLXGBItMIdeGHeHlGBoqhA",
		@"nDUXcKefVZiGJtNM": @"iPZKRieqvBnNoiWlouiEHloBGbEcmmBRNlhlidbQmmREBqzQfZtnbRYzdbUPUVyeOSVnSeVBXFBGVeknqMODusBXEFsVMBTSaiLuRHMhFvZipfomjUiDtamwFPiwNjFJLIjrIIwbYiqDUoSac",
		@"TinweWAIuBc": @"XiKoHFokaUlJmgsYmDsDCRRNJaaektrWOxpaXChcdeQRgIyWUgmdTaYaUYXZRqLKxhWEEMBNPmICyKemOhBjgVUGzjLZfvpjYKXHpOJfBHfOjKeVYjwdlMhhPsEyNYKzDDzwpqJCxhamKqA",
		@"dtEBazRDjVtAyMudWm": @"eUBwhQSHQOHrbbeCbQVDXLBEXgOBXVpPldLTxEYQrFLKtkTiHrEUtdZHbXmQCcZnDZTPXKCvTWiLrIylfkpAJZkbqdtNwewiOigvYFwGIzJrsNFlPhrEDafFaQTcNFgWedQcgWdVdk",
		@"YfqOMgUJDKfvG": @"XQFXUmkNrCXoduphkRuvNKQKhvEPQCrIxqidWhlymkdopkJCeGGyLvlcHIpOUXFdxOcUsMIfAuWeXjEqlxDCijCGEBQogzXlqnxdZIXrPccvdfnLnuKrMwGGgLIzSfAUbjLcicwmT",
		@"rzEgNZPgEFkfUQ": @"FPIaopCFYbbpQayPibVuJQWNnqJNJQmXjNECNGLFeBwPfHIqUmOsPHVnOdawadIQzYXAtoxecHmGEEUKgLIUiAzDfSSJKetetTPbJOwypf",
		@"RgIdUGKjGeh": @"IbaZmjUStDOPOVQlWnSDoZrxvjEwZnrITSouIsFEUYHkFLhkmWuEqKiYbSHkRNNXBllxjyNIDeYuwEJzQAFHdaVmOMvKZJkgAlljEaYlKc",
		@"jmFZLqNDZec": @"ZVtMIUEbMIhirBBvsAfwIZgBNWOjXtctbKHCIsrRQogWPXaXFnwvrxdDrHSFiUeVgZAMABHIuOJSeVFmYOdBBJMhFJKxEUOqLSefSzvbCuFLqbwBNjdISK",
	};
	return lmunJHxyypzi;
}

+ (nonnull NSArray *)QqnfqMvGYSG :(nonnull UIImage *)RxmEsshElFr :(nonnull NSArray *)KdnskPNBlWpVlQMwYwS :(nonnull NSArray *)xlNVeCevSRTd {
	NSArray *LISiPfztamniXTzbba = @[
		@"VIfveAnrxaSzVmkMllGenzlBHUWhjIIrATCdufRlBOaURlnxOSiKCQuzcLKErMlRImPYUhuURsVRoksLFgnmQoPjbeIXmvcpEUrFHqQwPftBYUjUdSMLgLeqFlkRwTu",
		@"AbGeyZnCSHwMHofczuoaZEKycNcURtpwhxFmmviBXLgWiwYngLMfrwiNRLQhWjUJiynKJxnORzQoPqoivYeBeAfkkiAUXISmJKUUNRF",
		@"uumwilEDkdGhPIcUEmhVFuZXgqtfxvEeHHkJAXDAJrPeQuCApkjXWvyTAaHtENXowyngessdxjVHihgQSPRxfMdNSCEWkxgSjYXGgleUVLVTmVexcQkHpGaXgGZfrHOdnEKXmikrcOA",
		@"YIEyzYFOAJsNGDMMmyRCorEPtCioDIYRPpXJJpuFZjnyDNZqoNEqsgtTAofGrZDjVPYSnQWkaDCNeovmJQXZChYNTixoyhaYPvdyJOKZlczkiWTWBCnoBU",
		@"JgCFsDghdNxgfZrOLrLPVQDEhhgsqGdevzwymOTFRDqhEaNDTBHWtCbmeQVDhkbjdpzcnhXwBqnnhQffGftZyYlPTVDRurJlldtoLqBvfcPuBGZyrFfvwcsUFHOAhGB",
		@"VHLadhgXAaZMfxjdqxGCIELgucxexAJlLhlnHZRbRcZeDtZTadEHUndTqtTNcWOijzvbHoSZGlYdTgMBXrvMRWbuBtyGIUwkWFvOH",
		@"BiuqdeJJbykfjKCxknCqbxjxIxVTVhGuZoWRgRBsDgPFrkIkOvvrpgBagvYXIaKwdsySoKrCHMMrQPjnHsWLtlmyQJxrxuZNxykzLOJqPtiWufdvfEZEVTfEXNqKD",
		@"JHARLpCWXBboQEYbRuQvLSxUoOyDiEUKvDSReslmGnwyYocUusMvHFXBUNKdXBuLpmmNUvulIAkpVKlUqkUENePBdpmKYJolnkgRpCQYXqUgBwHvxs",
		@"qnGADUFFaxeYaTcMSHlrBUNdQgSVKOLdhKhiMKrfTHjbaDfRYwUiWCkUogdNkuTkNkxHqAsGFvGXlCEHgRpfZTHUWbvGZMAozvjajubJwzzDhWBrhV",
		@"BGTlHLmdviivFyynnKJwZVHkeyMgJOiJWcsDBtoSmgSBYNwvmTknVvkURzupRTbuFMbORGrxiAtZahXyXvVnvbzVGQXDhpmdAKMoZrEpEfrKgsJHCERZtyBEfuCvAiQmbHRPfeUpioNOfYZ",
		@"ksnGazknQgJoHUyhiEHkzUOOrRUsXtzUHkWpkvcWwbLWwTLvWtoJuFimmlsQMaknLgDlCYYGIYlMvIYebezAUuMMgoWOYRIhyeWHjAflHuRbqhGOpCJJbYSeTckRmKRxIpAGgnKQXCyY",
	];
	return LISiPfztamniXTzbba;
}

- (nonnull NSDictionary *)TPGPnQvShXNdBtIkaOE :(nonnull NSData *)BXdrDNZwxJY :(nonnull NSData *)xTiUChcVjVFrkZw {
	NSDictionary *QukYHELtYeVEIOkSm = @{
		@"MKuCcAYTuITWBNQD": @"InhLkozrymArGCypDNsVbJAAmymkTlqViHEknVhmSHlSmKaIVJSMGwtKxnnJuGViFmPCIQOiBbNxNXzjmdWfqtKeGzwwqDupejdCHJlrJLQypwMZASKMXFKbskRRexoBN",
		@"YlKUHCSfaKyGg": @"YFKYlbyAjmihDsGTKejHxGZptrCwqOJvldGRvfDLGWdRDGxludQEPWvBcfgSYsaZwWJiAYpQCmEzUGkWkcAbjfyFnpCwPTjqNSBKTMjjvCtgFDPNFgklYhnf",
		@"VNWdLyIROXI": @"bVZmppsyJXgxbjhYRHPqCzePCGWnRHgBWubuCGhmvnHAAtkZoLFzaItIwOjbWfqkmzkKcOKuQPjrTKhAWaTdMYEaZgcHvRQCLvjEP",
		@"TifEvwdlBTCeH": @"yZHJUKRhAwOwsuUvBBqlcaqRVxmGNLdThtyRapLRLghrzVKrcsnQUuQQAKwiGhftnxhDQNqAzhyKXIROckeGSWiOQRtacsrDwjUemDHuyLLklywwcav",
		@"kGqEGamLwfliux": @"ZQPKgjEUXqhOFRMQfZNjzuXVkhynnsrGNfBSGdVALNGMWDugNKfnjAzRlILLnxXuOxjscDDtDdiTvaYeOLEEhkuOzyEXZBBKkQPiuqDUAdnIaPAVehwvAPHhNT",
		@"lzRdvThgTwP": @"IRovWOmUuPuaxstXffOsSaWSvtdEWlIMBpVSFAUNfZRVpkDKROlpMdKNbGnJRTMPeFELnWrSVvlbctqrLpXZrkKBmTJKZRAoGgjBTwIgdk",
		@"mWIPkbPtAs": @"NDroxcbEsVxhQsayoxPNtvIceTdFLHhERFMdCOZblZTPCdSCdpNNJdzIkGeUVYPILqAWslIhyGlkvVRFUUjqmPCowNQifQzmKRRauhxJEdNIiMKLRrxQoIXJhdTrgVcDmuqeXztRoMQybSozkUGVS",
		@"yxmjGHIOWNxfRVQmCq": @"sAOJdkDUCLjZbOiugNOPASSlNBUIsXvnInKDYBScegcYbrSRlegIhZiZnaKUXrtpcOpHEXvAYZVuEeWhoBKWBCMOfjSrPGzxJdwbHDfNHbegCEdptWZXlzAKNlpkLUcpoBW",
		@"ELovdNjWjFBEWz": @"JSXEnEdGkUINwYSpFqZuymuNQcxcgaUzqnkBVRbDckoVItrPVykFFEsHGZMEimqkFpUrWCWzrrynjTkhPYUfHnjwocTpsTabSsYq",
		@"SXKUJfjuroqjrWnB": @"bICCOQSDilyBQIlFShJQKjWklxVKZLWxcxkBkdZMlBTCNfEcwAptQPjNQGEfYqoZZJrYrLrlkrRdQSJWrIlzNnvpCMMgcSdJnRDHlosGyleqcJNjWhiweGRx",
		@"sTnVyCcgQQelV": @"ZgGeaZEjeesYSFUQXVFQHulDwIeSkWVXaSSPteOTIiliFEnkqhdOsaSLsMdUXvPAOGouaNENAlYkUntrGKQNfhhUloDRDHgEMUpLHFpINbygVUbmFVvijzKFSfxuLxFd",
		@"QYcLMhDbmxCPkQikeU": @"EpFPQVSNSyaBsYoKSGUVRrjBynKQbFzjwfhgfKFWpbpIPgVZWQORVOSxYJvzIfGxIjTyXHswJUPtWaQhEjKsdEGfDcgMiTxOwGQClIiKOjuPUHmhSEKpvXKkxwdiWZzJjJXoyWwWRzMB",
		@"VFQIdCqcJdDIDhJWiaD": @"QXSHMiBLMDBqsUeLOLXCdebmWmuVvUjyVEyOpTUMKCUIkeNcKxDRXMpYBMMVBNziyAJtXXsLEgGpFjTivNEURTUQJoUJXnYxyDDEaFEYHcGWbHUPqMFhFSsbwSQfuCblcsWjlzO",
		@"PedBShrKeytAYKsMqC": @"RtJfyDzJRzGgLrglcPjDbMzahyMxGtTEfLjFwhJUlACsmouBUZucPCqMemwrgGoGJOHRgujgyVeLMRrRVUOKJIwPWvuSvstijCSsoxzrGjyYz",
		@"GcALsBRNWSFqkFJti": @"BMjzPescuZPfbsGtosdHcNQeWxzHEllOlEOfaGNUnTbdMTRfHBibWdQxvXaBKHRVCBNIdbOHISkGDIEtLPBSFEERsqibtheGjIAIHsMKtYUOvyWJOJFGiuxxhLfmGBqrslZT",
	};
	return QukYHELtYeVEIOkSm;
}

- (nonnull UIImage *)kPVAURtIMHBA :(nonnull NSDictionary *)ncilbnqlOwEbZ {
	NSData *TWWmZlxYHHvaN = [@"aGtKfwzWbWKWPPmGQDnVMKhubBBnHpnxjodLwDbzzcUkDNpAzagQqRIkoJnpXrYWgPTCQcZLnoiUilSzJniSJFRAMJnJbxKUPPUGwavodUpzkKmTjb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dExlRgEByczIeAF = [UIImage imageWithData:TWWmZlxYHHvaN];
	dExlRgEByczIeAF = [UIImage imageNamed:@"IOCFzFREMiwkxFpKJoLhoXArTJHybgeUbnzinXugBalqGBuWbKbIsfVsMrghitSCofyKjkfbJGSHUsSqnvqumKUNUjuNxqDwZmfZ"];
	return dExlRgEByczIeAF;
}

- (nonnull NSArray *)sHbeTSPbNJESDwjs :(nonnull NSDictionary *)XDJQNEuXZNndm :(nonnull NSData *)CaaQDtoXtIGlANDRCc :(nonnull NSDictionary *)naZvwLiLqg {
	NSArray *GZtKKZNmSSv = @[
		@"fzZJNDlZYxpPTjhmKZvrULVmPJxGsOwYfHYIPoZfRpOKZJFpMdFdulagTEgLgiyRxbenulswEHuXDsDlUBnkwazxeXCDedQcapWpvNro",
		@"imcXUvAaqvNFRZtsiSFZCdUzwbMgOgnqsgwWLVTueHbevQPDkaOIjIfIFNDJBhGViLMIWwbxekkGyxKrgQoIjQpRQzxefZrEUKJFxDFOufzAmzeLfhLuZMl",
		@"novAFxVxaxBLtWoGQGlMoYZVCEyDUibJgbIMYrvIMCEsBIZOIceBMjntIpRiamvnMalaNaJpfSbkwBLRHqiDGBOpudCmvxpDGAVypvalUDIOvwyEUNLOcEcRVrhaKTkzqMWxRxgMjqrZlrZrZw",
		@"ipaEUEqsxPEZfdaoKIeDuAGwzuamVhoNpqVowwwOXBUZddWhaElrDvLrrkIjIMIUvYehvSQVHqyUOoMvFwukHGLDrexjQssDvRatTQAtdnnGLnpGYFwvPafPsiRTmZEtuTa",
		@"mUmGuqNjcQRkLxImuGhJEJUuKeBpIkureTzkUImHCsDaQWIKfVZgpXWPvhCxbhaGhMyXdGlUtjpRVdwCpkkFMqAegRUmUXgWJeutzXmFqMmSWJiWusCTPNTjFThTDJTZmVQuL",
		@"CCGCUnTBGeDLbWczbeVzyzdfxgbZyLzOpOezHXLqkQjTrpWCpQUvqBDRVEQZtZidgzNDwCmStXniefsWaZKYmKIRIfxwQVrnBWLWUVSaeDuCezUNBYfyhunJlJC",
		@"mWjzcvAyMdSkjaLIgeuhHnIPjoaLEOXStDKisIvHpdSWoqDAJVjJOLSaSvddTPUnYazZUffFrLIcgpaJFIbmwJuMDLjrcWaZXTKQoJODEVITbGonQJy",
		@"TzjimZYNBeGNwLDfFqpSeTCFftoIzYFOtUklXVlkIeOYWDimIsharSEPYRqEZALuhpqiRJyDgxyFTjYnuqJlHZoYUcgxTeaaFyIGgUMKjNbBtsTgsyMZY",
		@"kNXfmJlGOfIYLSyzIcEMVnRaHONiTYwlLgFrwbPZjZAwUpArgqNCqaNSvSumGDknGtPMrejzFeTWMzjNzKXejyXVhMwDqdaNKCwKSAoAPeJzckJbWsDgyvGLzPdXtpoLJPgtpQWTcFatT",
		@"VRohApTSInXmvkOBZxDvDwCYbmhjRFErUCTLxEMaltAKzqMJrHkeoYtourEPFafCvKXjRRRhnCivroDJHyKSEquEdClMFIrzHWtdFSHVCetjodrSMAPVgxCLApgbZEJEHb",
		@"fclkaTdVrQIcPJhEIXdfJTVyMNIlJFoiDKLDyaYgHLmLoAwZmtMMpFIYSABELkhfgCxHHudKyqFhsMlBDDPTjyBiJXgENpHoNSZfBuWzwaeTcysaiTMwJYeDKromIxhpFuusOcaeNkrwlrig",
		@"PSHcrzFotCwfxOWgjOkUglDGvbpthtjlSpXWGnQUdydTYjZEHLpRAEmuirxWWPPzukgtsjkgHZtFzkCMvVDHjpesLyHBUPgMCVVPbgAbVeudzsJQvRLBNCkcMkLaLFMpuWWqx",
		@"KNoDRJDpxENrKZTvNGTIOZdDBtrpwBmiDupADBOEMhsJwAjIISFeBkieHEFqQLWphOtumqEmTZkveKzeeATndnmuVQYFTXqBGChOtlsTmQpPmzPPlFRuZCSRjsmLhye",
	];
	return GZtKKZNmSSv;
}

+ (nonnull NSDictionary *)gpEqxFvwOf :(nonnull NSDictionary *)YaNSZNrEAlQ {
	NSDictionary *HWEuGrSLdwRyaW = @{
		@"dxEWPgJSYjVHuGvbKiF": @"PdFonVtDSWDdhuQzTjVNIZoMsUPiVDDRzqXWpEGNBWiEQFLJMKAaokOCisEfSbCegXaqNvhcWRwBTQABvTUDxDAkwVOPcRajYLERmgfnhTRKRhDpNOTOEYbVCFpzHRBuuwLFYb",
		@"LLZOjPHzqEd": @"eHSYmqktswFxzTUnIPiwIlnOcNjtSBlWjeEpfBZGSljRfbxGXtqfjtRQYgHfrlltXmJhtcKakBuybSWPDveYjAZDuzlDIuuxFjGmJDVMJZOgaNKGMgIIvXhzBGNvgBoyQO",
		@"HTVXnfwKPJbnsiwnBXA": @"EDvrsecXmdhqNIQCtWwthylmDHByvPRTBYGiTvTwfRJRLSrOTWsVFmWGBwFcSWvKFgdQthQbbZoyUoWaZkFQglwBSkDiLZTXqyfbdjopjIaJwAiBMLgN",
		@"xqzcRlOJcJT": @"EpBLMEbDIlVfcVOsBpwpgxBxVsmdTuhrEVMIwOywnSELHTKkrBjlFInZGEZIgsFJZLFlqVhdOTXVTMdeLgSRbrNZydqmjgexKCfpAxlhbcxk",
		@"lzLtnLglQXhxqqMVy": @"oIImMVtEIKyMqbbvhseElhMNvxdXXvGumjmANAPChsdnKUsBGGNSFnsSnihDWZPaScGRLjgsDkYpcQSrqLDKEfnuUrqvZGtokkgYOBuyiZYQVd",
		@"fGbmKTAmQGEd": @"AuEgzYTusZWQNYwExgSeQRUkwzZvbSHnFHuWjSDbzjJxbXKIfoDxSiOgVJpizaCKNTQgobsFDIkmuYJPmphLeCsLmiYvLENSciApmzBDNSHAJwtfnpopsUCilrEEuhnsKP",
		@"wqyKFwkHfUjXZuSVl": @"gcumVAEtioPfKNVuxlEBqfQRBebpmJXKHTKyljfOKcQLFFCpqBtMwYquJtAffvItMCjQnTXgWxvDOYYBIQTaZPPYcSIVavuGBwftWAuzpWUvG",
		@"xeipTZdlzRkCw": @"LRSOGQJssOjqvvmfEZwkZCffwQIoRmsfsVPcOpBrgfKLtzvFCeOafEffhpkJKVzRXXRYIdEyxiIlAHkRGefPZbDKgDEZBDHrJfOZRfzytxcYvEmtWoapYHLphYPAtvagPVvIowX",
		@"uQhEbUICvjZ": @"VjWhEONDzdLbrXEOLqIpAwsGTjAseZdmyHutvASSzwZiKIggCfvkluAXubFnIBKpCRvDqdDLTPvYBeKKgDJawjpUwJtWEwFYGywvaPeJzBqDLQyJyVMsoXqBSXSGkPFsHvnAi",
		@"qJwtZLJTWIuEoCp": @"TpopiuvJnEvWOhbmNgAdHtwLVnpfhYDzmYXCJvzIEbPffdRzmGHCSwdlvoWWNVQZNwceWGNGZHKdChcrnRlBNCUVSXZOHAyaLdkl",
		@"WedtAgBbdHAv": @"soDxxsKkZUfgWWLYEJtBxwAgjXtzAhRJWcJhpMlutsqboCuvgoAQzdTlIIpWCRJkthPxEHMhrdyJxxLDcPejEqCdKkXWJmlrkIhvnmcY",
	};
	return HWEuGrSLdwRyaW;
}

+ (nonnull NSDictionary *)hJXoXQoyzkU :(nonnull UIImage *)aLgBFsPVDg {
	NSDictionary *nGQStcPaxUvfna = @{
		@"HMyZNietJbkD": @"dqmNQhogFVtDPeDJlwyixBhZcumVHHmVgahMLThITKBuDbYZwokyGjPeaSZpycWAoFOWWnImOcmZvhBiohCIPSbsKOWhgHYRiiIUZOgLJRpgtKShHTkDUeDmrGrJhhEkBqbUgtX",
		@"TLwFNaMWjnSaceoc": @"ONFKHhnsANDLjsIZEespYBxrXOvUIogyHLLCwrjDyVuInjnzZwdeJIoTfNnBrdoICpQLGEoGDIMGNDCraQMkAUzKKWDkIkhQiuGLsAtZPGyPdZHeFYGWBXdnNfrXcdJUcpPUHZflDpSgzZCntrJo",
		@"iNPWSlbzFlwVLMI": @"MHWgMDarLRFAmHolfuRYzvSVfpLdWcvPSGYXKokqdRTnuoYGQhejjrTQlGlJTcabvrpyOXLKWcDyWSYzjvWQQhJxRVPSjdCfmvgEnamuHVHivjDIkWkoWrcOiuzVhrKzP",
		@"fJfvfYqImOeK": @"ZZFMjsYmphjsPznWKjyxGZblKXhPcEnpiPctrwzKXCxLGITkINfEgOFoJJZtxvpBNPFzMIAEpVWjKwvydgwIKtIkuBSnEgDDwRuv",
		@"EHWRojOPSpJ": @"vQnWqrBlewwwPAmFhhcLcxwfriLiOhxYhQNXuPSnwRiiAAdmKMFjxVnCWjUGeyWKrwsQnANUGAZWwFFZYJhOMIfvzQCCFQvjniTCCZTnlmYFdZYGhVxYNJDLgtPQO",
		@"gqkYwcuoyxhgJjpOsyj": @"aywWoRSRUoBYTMcjYAjDyoofWgVXGFMxBVTWbVWabMGfMGZwJlvxzatNjFxdUvCBOFPzmxBwOzDZMxsQESJTqEAofzvotEsLObMaxUkHRVEVTpKHGcOClUKlvZoSJHoOufUskveIX",
		@"lmtaIktPlgL": @"LUKLNOqKtYuKdUHRuOgOGqCJIGpSgxmHoZxYNelLJFAQMrJtkyqtYvWVYmujWCudtaQIiWZpRXWyLWgxKoqbfYdhZcFmxtkAzpzMxGCxavLflzlXlRRTDCtCxsKzjugzRntjtTZgMfljTiYwcv",
		@"nwWhxwwIeUxKRnTyrN": @"ZyJMotlRuzpCCPjEGuTMuieYCTNQnLlneCeZVvTcIcFxXLEOVRAlYfQccNpjhACtLNNFGLpqQoZCDhWXVGqbZnZJopAOlFLscpDNhTuvGosUooEkemMloSE",
		@"yYVvDAYNZVANEfOt": @"TZNBvJlSUWmzrxgUTdkWHgKTclLFGamejxCAWsNHeRNunnEEmCpbIAmauGQxUiOwoEXzSjkPDYMwIACwyzRzoGVTLcSlSXDecUYsfqBhvirHoqOweitMFDNUMjroNIlfxZSjOsQ",
		@"MfnBqaYoWCGqnGglW": @"SEpbOyoruDtjupNRoiThFhwYLfOVHaxxseYKBSivmYPHDNeSovjiXbnpQKDetIJKaAmbjnkjNqkaCHsBgnjlzgEPTayfLYfLsTHdESkppebABmHOTJoZrsYZFkHEExKrFGtgRKwvqCVk",
		@"JpjNONvlLUavGLPUTI": @"zOfQFpXtCTWkTgondHMnwxfCMnAYFCWAAYRvGhAaIpuZVGYxpvqeAnbijyKCYAzTpPiWKcnhrYwGUYkMcspdxzKIbGgyYaYZDmfYfkmJMeAFMKMaaYKWIESGN",
		@"zTXrxibNoVWWphMwP": @"MTVgorxQeClIjSUBbFEqXuIqIQnsVsIluYYWvMFzvisQdHLVZqXsAnHbEKNthwNxYlMmyYsCiSLZkzpQtWWCdmNvffgmvKBYJoiiABDelEquSQauFfKy",
		@"lSrUrqxJWMpAohPgQT": @"KCmLxmQWdarNVcqHeaFGeRrNiQxDNahlOsgBcHFUGhnOgiLEtwPHCuULQOHJlEzPyHuhnkVHMdSjKzLhcOPFkZKRPoYIewgRYIDtjSbnbzJLFnxhlZafqqrwKQxuiDLbcrZvCYPUaUpSib",
		@"uGkGhdHELtJEZVOBLNA": @"zXDPmWasNxFDFLfAXnpJviFBadAxTRXmidiTmmUMpsgkfJNUPuORXedIfJMYpvbdzMfKKaQPkOQLXlCBhIbpEZCHqXUzMQuUhibjLqA",
		@"gqUxPWMDpuZTD": @"HadVOqkUVzmIpBHLxcCmYptMnHwiNMSSaJbgzCqIrxNCDHdyzvCpuNMNEWgQsgjciVFMfNHDxssmBzNQNncMoAAfGBSdMWWpDXZwXoJvYHGmAevITGWw",
		@"bLoWBnhCmml": @"LuMbDzBulwKRxkSBLgfFdwTxyzBpKSxXQkLbebAYSnifxMVeitkEeKhznwAfubZMOwKvamsDJIWJfseOJWzLnwajtNIHckUbiVkAmDquCoXeobqsUtqzdbdBoDkbEKBKAXU",
		@"DbhxmnWBSczrsUuea": @"SFvfzRRcvVqufEDvlszzjxALdvuClukspEIwcbQTKnZgJAtPhOiJNRjdQZoqCjyVVtktYbvDbPzxuofaJoADtXkNqwaCADThfkcMhlXUBJKaRspbNkcmfUbhEZGLFNStNfiCnW",
	};
	return nGQStcPaxUvfna;
}

+ (nonnull UIImage *)PBRjgHSIszyArCcLO :(nonnull NSArray *)RawtYsziOppQBUbzfkt :(nonnull NSArray *)rudMTGUToVjGYgtVdL {
	NSData *sIzYegVKBQbCAmrR = [@"bXZghroMDpVZHReenCzrTtvrfuyMrHiZyRpaMqfqrXAHWvRSkfFRYXoqLkVLKWeSzmOarLZwEiXBXyrYzVRQnYDteMJriHbFAgCQJGCMpnLrceuEqCflLOYYfiPk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tLWobAnFSHWz = [UIImage imageWithData:sIzYegVKBQbCAmrR];
	tLWobAnFSHWz = [UIImage imageNamed:@"ptGgaEbEMDeMUuFvcbpRZWfPhDtsjywUTmpevzRsGTEpxJbfycetwehCNDLDkAjlRoZwTeQmyueLYNemLTJGvszruvcGoMiRevtxdYD"];
	return tLWobAnFSHWz;
}

- (nonnull UIImage *)qrDsrTLDBliWu :(nonnull NSArray *)vcoFdhvbGfq :(nonnull NSArray *)lluUNoUCDBNMYaK :(nonnull NSData *)uRjLFFVzBnq {
	NSData *zuUTrjDTJAXQ = [@"fEXqNoKfenXDHUFzoMywjuieENeRjbgNYUwbQfQhNhZldIFHqZMJfsVUJsJsIgAEmzadlmEuozMvZUWLluSCFhEqKykQuIdMnzaFKDuATtrttCcyxMF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ADSJeOGkJIhWXcu = [UIImage imageWithData:zuUTrjDTJAXQ];
	ADSJeOGkJIhWXcu = [UIImage imageNamed:@"EkrjAHKMOEpfACSEgkYyMwAkWcHVyvOEpjieopHyrgpHfZkwRSMlkZhBdInStlCfKxcZkEeCzfnUZlDRbaXqwgbQKuUGdLbhFLjiBfcFkcr"];
	return ADSJeOGkJIhWXcu;
}

- (nonnull NSString *)PyXkdSTxwV :(nonnull NSString *)tydLWtpgkgO :(nonnull NSData *)oOqdwUZtni {
	NSString *LYHrVZzDypADjigLA = @"hEOSAZMzRUDsjRbRfmalaryFQjcGOGxMhxZxRlccWKLjSrjuMMjggViAUrKLtEWCezCMBOiiYvpvtYPTZxaokZpjOzedbjYuuPXMAXZfbAkBiRttComvcGioaS";
	return LYHrVZzDypADjigLA;
}

- (nonnull NSData *)dqcpuamUcG :(nonnull NSArray *)qrMWsaAWeUY {
	NSData *pXcBSVMbPjgJ = [@"OMPAZfNAbDYBeYXEggVHqjYmEOWDBAYThFJVcurfZaXcMLCPbnEbvVbobQmTvjNcdzzojIVRVXeIYuwZqzmvSJswLoUQsZDNJiXrqWqTdjROkquehXrmCs" dataUsingEncoding:NSUTF8StringEncoding];
	return pXcBSVMbPjgJ;
}

+ (nonnull NSData *)IhAOnFhuKAFHECKFPg :(nonnull NSData *)EQwLyuXrYxDNCiLsC :(nonnull NSDictionary *)iHLIesehMNobN {
	NSData *scIiPPNuMXIG = [@"qBqKiGTKEojNdTEfrjoBBBAPAXcQOSrLrLKHgpKZgEegiVrqXVrRTcYfBNEhWOkPSLduOQeJTRMFKSPAQSCMeHpxxzffiymzEBGVNNwywKRneOyIbxviDkcT" dataUsingEncoding:NSUTF8StringEncoding];
	return scIiPPNuMXIG;
}

- (nonnull NSDictionary *)LgZGlKwHCHhwZHnnf :(nonnull NSArray *)aWFjCzyKQmVrvmbvl {
	NSDictionary *nGHVvjFenxhnk = @{
		@"ilCFbXhxtRfgHHm": @"smoFiaqcOJFOLGFlbjTNeaDfJSNAXpbmKgqovMTqwYfwJjSJHpApblhgMzeVJaftWlXFSodvJXWbIuqucyOsyRHnQeCUzSIWJgeTOdsbjixqcepFwZGAFQJrnLyGU",
		@"hnaXLWxuUp": @"MssxPFGXCAoefxkbpXjWwjeAmmwdeOKlBqHGwkfTVZGGfzlTXnBpSIZaadLLuycFfYwovFYynbIIwWiJtEOdgtRBMjcWmRdPCjzZjHFRgyySPfwzmpNmyQuZDtkirCTZwuAXQpCiXKTcodW",
		@"tSqLyKuprttHq": @"RYDMXmPpWDKRtEJCgirJvkQQSEUfswPTcqAnjQbewjDDKcARWuVrIdZFjjtRpOgOGGMfFoxOHSYGDxWYRrFEuQuyQjUWBMDUZFvkqElDfRAShLdfQTxjlJYVnSfwCyphnibCKBAzinSYrqPzk",
		@"HdoHWEzgrPkQsALqTDt": @"DYRdlpmbRGXEHydekXDPENJjCEpcKUULLInQpJIjxOUZfcSFLgvjcbagZEULbAFEcemiHKGuatwBDOhfhUhAABswAbRXmjomblQqgvaUuUmQgiNrgtURSTdbAyQIDmQBnSgIKxik",
		@"OjqriEypRSMeAi": @"WzRyfonlwSYkjTRbXzaZKlrAWrlkoimQktyYkFpmpqfGkkGRxbaeiSUnkhEDiSwjOEXKYtUrwfckFYZaficlsiYXJIQHihmRqIxt",
		@"tUcASmnQmbR": @"hHOoSTSsWOXFpqPeCjQpxGjDBKjkAmAgFuZKEVsFVtjKteZYhahOtEhRbdnvjDvpJhuoeNZbVXbcCrBCVJnfDVbLdUwWYWtgqRcJJQsvjybS",
		@"xPsunBViOQIeuseEa": @"xNjBnuBWbPLxMvTtChHibPrLCxWDrihlrqxkCVhZxoPhnMKbsVffbUKjbhhTnllIywqYWLVYvbUYyASZaKAivZOaYHDMtNnYHcPULJHXTliKhaddqicdSwCvfHdmfedErb",
		@"EzMkQryxYLXuvO": @"xGwxqMloyJmWGWzcMDrTFBZhjduXvWtrPsaAVYtLlgZKZBvlXMsBGfmHIyxgdfUdFLjpFlEfFbxtJbWJBzmTcJPGIQkaJbroWnLqDnYFPuLQHkgjNnQzmTSV",
		@"hmWTisEZTV": @"ZDxELHYMQeuNQgkGeFyLVzJrtBUaFjLPNkvwjrLiiCPtqhJctXSBOMfISorPKCqRVHZeUeLbqYTLtsoBQFpupfoAibFogUQAwyUFxxMYvFChXcbFtLFmziFVtxSjptfhVdbvtlITsAB",
		@"bpFVGEqAxzB": @"JqvHQhDBYPuZEwdCZYVqsXUwTXRwovSZrsyNDdRUuocNwgxSdeLTYMWQWYiFsvQicChfMaCHilCLGPldWweCJuBKvMYVICSRQZiGTrLwDUgolJivXLdxnf",
		@"AizgbAmBluth": @"wnLFaTwAEnhSzfZBzdjRaqyUXdgRAvsvfsFrEzmNEpbljiOxMttFKRZZYOKhsDffYVWKAsKjYvZceuzmaBmhIbQOQYkuKGaszVkJiIgKFCHNwxcnVskNllVHzbFeTwCtacauQFsmFUwZeH",
		@"nKJXbXshxqRJbYRtC": @"OtbVauRxcuKBdNkSdqXBnDcCkpVESvvDftmunilZONtdhWxAtVfuMQeIVeyFCdHwKtfvZeakaTnmaoRmfsWEubTrQCGzJpSrzPRNCtkoPAfiFFFPMvSaLTiuifGycfJoFirpbanPzfrgBhOfYuI",
		@"QphvyGdWjATOI": @"mnmFANaQeqeWMqbOcSLCivGwqeoqUfzeYlapVbFumrMOuKIqNSxmDAgfUzdVMVmkFfqgkSpZQOpVIOAPeqbQfnZeWfFKMOkHxlifRjoWPOxJxGlvMJUz",
		@"HbxwwxduFaOt": @"QpwMxqqGAfDWKtyRocujpXtvMPIJaCummkocRiGArfaSKPCoObjycJOcTLnjucRQiexJRdwtclfPVOzJeftDfDhJVFeCSKYUdwkszQuhXaatpkAVVJUmHmeK",
	};
	return nGHVvjFenxhnk;
}

+ (nonnull NSData *)qKJnFZiGOKJZX :(nonnull NSString *)WfkwPaRhEGdDhN {
	NSData *lLYOASDqYkZv = [@"YjnLrcZuaVGOPqSgkzXctASwqeZMaPxQPMOHaiFyILMfacwLEsVhcFFpTxnIghHXzVfRaoIorSnfiPSBZPKZZZZRDjTCHuUAvAKSeETRsgbPxByGtfBdiofkqWvgLkNXnjHYuM" dataUsingEncoding:NSUTF8StringEncoding];
	return lLYOASDqYkZv;
}

- (nonnull NSData *)wezgnaevUJxxG :(nonnull NSArray *)hNtHeWhzNjQHUKar :(nonnull NSData *)ncEPxeyLvhiVVW {
	NSData *PnmCCXnqHkFaPQtJar = [@"bmgtASbIudYaZbolcULEFhUqjJPYMxUZlBDVwPeiiHMUjoTWBeqtEnIhAViyhaIhNiiOEXFczcytYUEMbZmUDKoZysHhDUheshvjKNdjp" dataUsingEncoding:NSUTF8StringEncoding];
	return PnmCCXnqHkFaPQtJar;
}

- (nonnull NSDictionary *)HUyHSbsHeXg :(nonnull UIImage *)elYJYbGbUXGJB :(nonnull NSString *)MRBgwOWYiZuDtHuzy :(nonnull NSArray *)uUBASaRNEIPpUCPF {
	NSDictionary *sZTBfGqBMSyPiYOxT = @{
		@"PORIeAmLBgAhitX": @"NrMSUWMBPTneWRsKXLFTpkPjzBtMpZeLgJEIQfKvTizqDteGogxhzfjPRsHZrxrohbcqGyWYnVOxVzZvDHcQIeVjDiTZqBpWfKhmdFaHgimgwcIgWkrFrBhochcor",
		@"oobiJyJkOrcqSCPEYnS": @"hSvKkSLClptXNjXsNjDZLZkSmZSGpffUNkFqtKzMNMaChAViBzpGBVVxleVNahuLbivmFkBvLLkPwyeUfHomVqqnNDjNncQkFjkdV",
		@"FcuYZwoTHEChd": @"UqubaVClRSqcpvHaBvpblfEgennauWEEgjyFgybqeJcIMOcDWnFIFymiLjyctytJfdYJkJOLMUgYNXiAYHeayOuNixfKhlUYeTqwGyjnMHCLgGHXd",
		@"OjqxKHJZBDOqJy": @"YzuaUWeXEHouMBuHSsViavuSFSFtBfHtlkZreEYqQoeWTrJeJsTbueTjMLssmuHHJwbjTVNeYXhTBlMKdZkPPNclJbsSNzKLUuJfqsQzr",
		@"zFTTiiMapciGjqmM": @"cqJkbKHygobkFyvKPOWhadNBiqTuUvVTACwMZsSfiZeMnSCTncVOAEnzHNjTSXMFmCyrjdZGLCimwRGXxjePGHTaqtisMtbSbZsKeEotrDhQqKJncEQhYulMjTOJQbRrLutSeQFHik",
		@"euOUJeULeatiazik": @"ZYgtJaiDBGgxilysIffDMFMozxlsmhYOWWOfscuPaVGabchcODgROkrFbGxwDYYUXmQSjoWAJsHqdRuUoXfQjSoGUidwKKHcPIMywEEZEtFAyKrfxZdCvuzKaWdECwaZdpqQTebjhi",
		@"MvZlFTbCNPwSp": @"HhCZlkzUCbpVtyHQhtDLCKWAfWHRHgvvubTEdGVDaOJVeJiKSYMOmNtwrGpVnhDluThiDRoomWwDAuZcBBhnTRLIlrneMbNqXtLqyeABXxltFLgqekitnvYCdXnsSYJaiWmnPps",
		@"rGLAFlVhZEKQm": @"wQXkhbxnCNwTqOluybzAyhjgMPoLhCubxTLPBIqGDDRRuTqKAtaNYXjOhvcUiCUELaTbuGXjDhPMNBQEGOJRoDKaJZFwegIsftoCbTXIkrGI",
		@"upeeREenEc": @"bUGFfOxtlAEzbesLNxDucnkyOKDqGpwipHwyXGXTlTmKWestTIKdXVEnOuYLRTIsHtNEfwmIoYuwxpyFjPiSgzJCjDCYmIriZAaWFAVxDputoTTiQbTkteOuSmzxCSzzrHkhQK",
		@"DOPWlwVnHiQ": @"YRnDFPcshJyOEDfrgRwqBwzdpVBxrTfHlfycHYOTNduUACKEVcLxyztIQbEoGurXGzzdOddOrSCRHVvHASLmXhWUKPGOiojDCBBHhvVcdwuypNVdlcuAskbrFoNUrgbTaOFYPyn",
	};
	return sZTBfGqBMSyPiYOxT;
}

+ (nonnull NSDictionary *)KkIIapeopTs :(nonnull UIImage *)oAJZSYccdj {
	NSDictionary *HhXZrjQNEFps = @{
		@"vLVmWOBVvVQsuzTbG": @"PbRorHmyUOnNfzsbUnFkGHXnnbKyZHWFTxsKBcJYyAjybFyQZNSYBWieCjAkUbosYiRoopspALnDtPkgJuQTrPEtFABYxWtQKrXwZGmEAhcfanTQKBRT",
		@"dtKHkZdiYh": @"HIIfmcaASqDtBVALFvtjXlEPtMVYbIDjqkBySrrNcRcWqrxLNVdMNnCpxspuuItJfHRujAyJxACslipdNsTRJWDzmaoydjoSHItEAbDLdwHXaRxFKibTTRTsoPhaaWncbwjxAFUjQ",
		@"uAsdipUxKTKavLwr": @"VFoUCtpFzYeaZatKfxbywmICKTrvnYStYtwUcsuDzkGtCxAtsSWApxRcOwPNMFeHenkjgmThbAivLQekHKYjDBRKtYjAqqbZcwtEGpiwnHrhb",
		@"PSvHwNQRQjVOTZu": @"YEPxHducpDPmIFmbIatDqTTNhDlpFZbAkmThzXjjURAAttGyImFWebRqcKSeWvBZmCMuOQSAZNNfmsGKCYfGTFwXUKnVShQkHbiJnaCj",
		@"SHGasCCIjLT": @"rFAkfDUpckNbVvshydTtkEzveAVAwgVqKRJjdlcJdoBFUGBXfrDZCePJmYunAsVFPHqDTzyfsMcTasZlRScAZLbWemlZwgnNLVPXGzhCIyqJIKlDVs",
		@"HpPADGsNLCtuEwcHYAK": @"qTPvIDCFcYbDSLHjsoUaIMtNvPsPWsNEzlJFItyCwFhFIzAPmBVlZhmCidbNBnmdLKjvzJlXjVSInHANeHvsEmAhEZulRLCFeDbvTlyrdfHaADptGcdTN",
		@"LoKGLlkVQlMdNoDZM": @"vaUbADRNysVXlfmgJEWdKjwfTBEgdcyvFVpyHvlPkZaWZnQyczpIdgxGNcpqPSJjjBqKzvmrZJVcBgzqZwMHaBClUuiHEDhqssfAXMhakwuAvbygxGiostVvCeZCNIALYyoGnsixdMyP",
		@"fVynWPqDenigpnDA": @"bNGyaTrBjxqohwqjODxHnNgpYqYLtGiaGcDQNleKKbtYvanIauajwodErZRTVGgCCABLVqhUTKpgRpvXwuAFQJvdxquZQZibmfecBjsuOwyakNAuYLh",
		@"MqzokKrBxXrpA": @"brVvAWzDzgiNDvuHkwGJsUOROhuQdZmZYDkEJxqzIMRXlIijnkZVPlbCWsVzREtOmiWgtWAOgmSFnWWMkHXttWeebCIUdLFUnWVNnVwkhAZgUjRcUzXfoNsGPoRmopLiYMHRIEfulSmCjKgLAhW",
		@"EezIFsUpVVFTpvTCLCl": @"QotfvTKWHZDaenGMyrZtcFfwaOLwNmQvPJbfRuGQsTERVwVOHeTWeluSXfRaFgkWUiUbHTOcbimKlZCjuAjhuSNukbyKyzwdqIExTeLFkvTfTXSKvHRNuNXVKUGlePfUnTVAMbiLfp",
		@"RHbyKJqCsom": @"eyYNzqLKyIQsecfIiEVIUyIqHADaRKcVJHUirQhGjHPLPBMUrKjywOYZdiVflWTCiWJtAVhGTuPSjpMrOnTteYwanzwNFLBxMGGaCEfUHOYKMdOTluGMImQGqVRbINesHriepxHFOQai",
		@"UQnwuAaKCQayOoYqy": @"HgIjiKLSsczTfImLPWwjeXwWDojvrBrKSyQmGmsbEWHNGyVwKFlFdgTDSfShKPchheeVeZlIxHfQEExtlrdKfjaBitXPuWgESmiCh",
		@"EYTgkAbrVs": @"mGcdNjwzGumsxZWVUUxydgTlKOAMjjUCbqUtiHmmSdquMRtaWWWWNDuMSgbmAvMpRpTMmrbtoiAHvHkoxFWvdNwKfIeUYBdIprlWOgbtMhiJV",
		@"gWuskDThYPSUsDE": @"UnmLljnJRPQYPTOAYMgJKHwvoIrdZDBCAaYmWBNHiKhDyvkpRhtlEDmWuIiuGODinUHFOjOYNmzRcOweqlkNgLIsGlnXMansbwEIvFVAGvHXVIyk",
	};
	return HhXZrjQNEFps;
}

- (nonnull NSString *)dswShTDXBX :(nonnull UIImage *)cJyCxyjNIvhyVJd :(nonnull NSData *)mxGpavuJOTUu :(nonnull NSArray *)OpDVJMNfjsLKvZD {
	NSString *EaZtABsidTGx = @"QOXeHfyHwOenPMrIQsmSkulBAOvHlbNmHZtnvYvJdjgncVfOrzDdnTHhIaFWgKkwbuejkCZIHWllFqLhviJOxhjchUVfcUHGceCDHkoXOTmxmG";
	return EaZtABsidTGx;
}

- (nonnull UIImage *)fwZBlnLWJVyb :(nonnull NSData *)sLAhzwYZqKFTJ {
	NSData *IZzsgIGpllctmK = [@"lydqVUgPuwcfQZWXFMQyfpRZBUMGeCubpMcTYoPnmnlQDonaMkIoUHYaZNMaNdkWWgZHNGkURvgjHqXRjUHYdghZvLNqyKWGDWcvRtOQJAbqhDsBYuyueGuHvntzAwjRmJUVPYvlvvLZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SBjmrCSgxrIsDF = [UIImage imageWithData:IZzsgIGpllctmK];
	SBjmrCSgxrIsDF = [UIImage imageNamed:@"BpNgKwuWvlitvMwNNCfYyqDsOOhvPJRGQdWJiAFKKgeUqxoWrRpiaxzoczzbNHvDveZLxyaEcnUxzxZjpnFlMGgPxeIUaGBNyhRuyzJJBoVvYZRPqoPXPUYOirLOkAJUGVDLwscBDNkZjumqpN"];
	return SBjmrCSgxrIsDF;
}

+ (nonnull NSArray *)fjYUJhMOqBAGNxlRG :(nonnull NSString *)zivpSxRnpCH :(nonnull NSString *)KjHxJNNpiCnvggVS {
	NSArray *XmjWkTnpCnJWvFPP = @[
		@"DKMJoNAouvKAXXrfCdEjhwIxeySldNGcDybbDdQORtUQCWUtEDmQkWDPBFjKjcCWwrVTjUzmEhjaAoWZLMXdFMNdAGQxXtyXjmZVdzbEkoSRqZWpsIJiu",
		@"GLRsCCPaIJPrlFzvQUmXXWFHYNPKlFSCcQVWiDRYxNaojQSuHXpnktZHvdvIfmDuEMhLHnkgFKYHrEggdWrmybBDHkfGhKTyabYvYOXEJSXuhAjSFXykQnMVMBvPXsDBAudhg",
		@"KUshAqEFFfCcdMMaUCRJYAdeNyrMnbXOTDFkIJsBigVZYNcbCzsZVJcsVrwqFzPuoVmXrOWBUTgmlRdSiZJukoMzlTJoKNrksEzJJXGWhZYjizWCCCfctLP",
		@"fZalKVnIdbOjTZmgTuZilHZAwAcQaoyAWcXjYDtZvWMZocUSsXOKyPhguvwDzKiCOHwGJToKyCYRhUGllphYjhxlcsIqoaFnYHMXxpgueJFGeTkyReOzsOZtGEkiClk",
		@"HBcMcAIgVvNQdVepUiCIFQKkOSgEWRioGnrjRTsubEDgWeTVeohrnTYKXPsHyMrGpMbZTkZyXgFtnEHQnJkVpovULaeTdnRsluGUNcPnfCVeBqaXGgeAuIyGKQvFXLffUVSGEjcQWZHpATig",
		@"vIMwPPyqtFndJdTpWHdMWJFbnaBfohzefBmraWoCcRAaEjqgVEBRLwIOPUkPTRfIOUTZQgsxEMbgbyNmlwcBpoXEJDRBtqRsbFIPRvRYZATEQYWtmFRvcgPMfBhChmlMnqQqaNYTLBbqujT",
		@"lOtOEKRSMcWNhaHuqtWMTUvXoPihNtyOGmnMnTDseqcddpSMlrgikTMRvMwmPKiABGBMtxWJCvZnwvJmaCmOdwlrRFYKvWZXTDmcfPHNOMUwfMIhlhsqElEV",
		@"GLuMYADpCegzBiXnpPcDVAuBOnxgUuiPCabGPPoYaiVfLvwDTfWlsQHVurQKnIoGXHZphIrDlpwVbepVPiaPKEEtSDBiAthMdKgFKLKeItKNDZCdJFCEJqEXAnhNf",
		@"RDxWqblKMlnUyAJwVOHnzDcXXeZQftorETuhqUhCaBYsDKbaQKmzzMQTiTimpcrOfmwFWSELtYxQDsMHayFUvlQZqwetQVrZbgOexoMordUMbHLRMrcgLgRhKwmsLBMOpnonzra",
		@"GVzzppFBKLJIgNFqnjJNmmzLaNKcswWgXCTcDtvUNwurWSfSxugZWrPUQVEoaEnMZSKCzApjGmFQYSFnCLXzGymKwPAtRXTRCNYuRJJqGXxrwiXIAhhVWZFwecyXhtrMiuLcUiXkRcXwmeJVKbvkS",
		@"pqfIfwmRgeYuwBZAMygyNhKnyrxUamaIuykPWkHFmLOoOWbUlMeNNMjyaZpqPonVEBEKOZBHGdcgeIprlzygsVVdHGdSkSjwiCHqZiXogRWASRGJttcfr",
		@"cgvqKXNIVrTSgGFmiRydIjgjyCehnDSyotzwTPnklwFTIJvjuFjltQHkaDzcuFzfYGEeZUfxvDVziznCsGBrnTkHFYLObAFckTIFVREezGTWdztdnHQWiUWzXfStCwusQszTa",
	];
	return XmjWkTnpCnJWvFPP;
}

+ (nonnull NSString *)JfvTJodIgTCFxG :(nonnull NSData *)SjVifddfJqMJ {
	NSString *RVlYuBIAPJuVX = @"jYQPpjbOlPxCUTucDGQZtZDnvCBkDkeDqQXQgYhAvRTQTUwnlOvtNTuemuCWNJHLANVCoPBwerYQVwqoupVWtAiBRzkSGEcBRRBRxSFdxPjNechoIEDSdRkMZljKqeqAjaQahNpBdyKapmHD";
	return RVlYuBIAPJuVX;
}

- (nonnull NSDictionary *)EXlENDaGotIy :(nonnull NSArray *)OcnpVeqfCkGDhsKMPo {
	NSDictionary *kJnsrTGenyT = @{
		@"iuNidhNwxLY": @"HhQEIlaVkEVVGnyPCoTFbYmTjHXZiIdAYeYjKrWSqLqZExsqmXDUyXORwrrBOyaQpCNUpOaJCSnOmTWUbNAcPIrxPWvQkMGVAIuQBevKMvzf",
		@"EilHVDWLCsSDCQynGXi": @"kYGBeBoERcNOfzRhHrHWtIWWCjxrssYuvwhbsDPHagqKFRRHXIEyLfVJfquZXILgCwYsOYJXUDPwwOdQqfTvJjBxSMLXIFRAdIllovZPylNjfqLVyY",
		@"mInscTlSkzgc": @"CuKIxinSphZEZgenxJUXvvOChtQbUsklVqVpvThTUXUzDcKVgbxBjyqzCklalzUANeDHRqZfGfPnyUlNspeQWEWFGjGDqPPrICdbuLgNExyleoHSIJLBHXhOSiiYLakKNzzgjypZvoEopRGEkjGoA",
		@"GPWiBBIRHTCOSyRHPx": @"SmClLAvLjGCSXEpsULRcvRYkhSvDdGMPBXormesQgxQBmVeshksTXHCaBtxqQJDVqMOVTzYdaGfuQAUxyGuCLfXhvQLinlygKaVRUjjgZZrNYNWdTHSoJbbup",
		@"enwAunyDorHIYdZHMjJ": @"XYFnFGOJjrhztJDlhjLJrYstiwPJznxrpIjSbFKlImvPAuYCgtTleqitSaTlsIVagQPozUJkaAMlFPIjFWWXIyWhDmEHbJQtIqbSgMJmPbUZmcJCNomLhAJawRrRzprbtR",
		@"sibYbBJFLtUlDcpN": @"XDMhdZEQFvvXqTWCFhGXXLciWyAVYMMhwJjIFxKWNDXGPttBZggIryMrxpDSvcwGWqygqJOGxtfAaywJujStIvzyBRVfNpzgrYpYNbUhZfIiVPLwnGJRtwaWQobdVEXRIA",
		@"EbXBXarNBeheHsv": @"YONHyEzeIQImxuaoKELnfEQuBfbWRLcbOGGNTySvbpCnSPpdLyUWXooLCqTcEwzEgLpuDaHyRKTiueQkCznoNCNPCZffFAmUfVlITiWKggFoBoMauJHAxyPgU",
		@"lLAoeVbjOqTiqHvTdcw": @"iUALDnMWuMutfSFrIXyLwcQDJSwscofMpzFecIRMxGWikfvdQCAfygfoIoRLAwwPYyLfeKazxjGzgHvqKzMvmSvpGqxJxigohQLvjfJJUkrnmJJBfFXu",
		@"lpSPLslpPkhkKpzvY": @"eYYuxXNOVsyFAnJNiiTucNTjepyEqysyHQUvPaqdnsrvnUyIGQKGFOFpXRwqtLnqrowJFQxKcMKEzIGzcCgsezuXyMqRtuyrCMsTynIGCXFxrmpfVASTGXqmrWAcGMBiCyzqLCgJmpZHHrnh",
		@"BYgmhZcJqcuBe": @"TQklcKTrCLmrQLDvKGKOjVUGJreNnkonumzvJNUODDXkjZnnYbVDdXxvBBJfHTjmkxhRXCzDtFQUYNYMMQKKjNMwgGnYabPVHZTvjAcQoqjRiRlUNZaDTrDcsQZtofplsyCKWikhyIHCv",
		@"SfelpYXZqLR": @"MzkxfqAKEndzgltYEYItACkIyyFfCtYVqQOVJWKwlzCtGcWwPHYexggcogALuipWrDcoPJXlIZTwJVYdFyllPhHseXDAhqXboUztWfeuuzrBoxMYY",
	};
	return kJnsrTGenyT;
}

- (nonnull NSString *)TiCpzxJtCpIdmHNMz :(nonnull UIImage *)NCIXVGAsilfVoj {
	NSString *UNPbyhuBmcrffEZuSD = @"BKtJNfzcrolFzhoWEBTQUrQCLEIfFUPgaIjZgDTtkQIizqFbZbNBIHuNEXzrsHbJyMLrEqJhgLqcCLuhWGlVFQYrsGuHRNzufJjBSyivHsGsADDHEfbZNWJMlaSzEsEtLGBqGbzpHXjMMB";
	return UNPbyhuBmcrffEZuSD;
}

- (nonnull NSDictionary *)ahbmjVLhIktoDs :(nonnull UIImage *)XHpwJxqthMDsRL :(nonnull UIImage *)DsehyrNeUiqwW :(nonnull NSString *)fSlLKwDOVCHFeqxbqbn {
	NSDictionary *pVwJRrzCOIhBQliLRs = @{
		@"LWUBLHajrVvimtx": @"DdSWtSZpxNzDvMEQxzDddFIBVMrzVpMafwGWwnioHZwQjsWLuXLxCIJPNevACQhzgUsMnilgfswaycMnzmRKljagIWuPGvvTjngl",
		@"sOKdgHmvhXOIreW": @"ljrqJMfHvsRocAIBCNGmbpAcRZOSdbfxRmTowHYqqfFcESDjjsMfluIrzVleLvcfLcTClfPZvWkbbXzGXuqggPuIQIuxADDSeKcuyVitVVGTBfrowsgoFixXYfJVLjwjvLlkVifoRvUWNMufBH",
		@"DXbBtNonAwIfaT": @"HvxEytzPyNEaRgKwwtrAHftMgxsiRpVkpwxtGWhBpPliBpcpkfkSAnQWDmowVCtvINcpsWRtTndjradAsQZpfUlVBhokhkFgUOkibF",
		@"RksUSPJAyzzyfAy": @"jcmTGAumMwMTgNqlLncZoabchENreSAsSzSPCUaaSrWESdaATHgHJLdYDwSbgbmNgxMPnYFrxRDwQzzJyNSNHXHHVMtBFFSlgdUGpVNAivvTYSxkhzRWYqgSMXHkEWsztxjrNoupiZxH",
		@"CgSbxnTRMFHonh": @"FyuWLtVrBThgyzFfuXuNhCXWnKmEIDARuxdqLqykmHcxnncVOcSIgEPIarqUZiXFPAyMrJvZiYuZQrluzASrSFuZblafMfZhaDCEnMzlDSDwPiDaDaLBnTVQWPpmNneCQGOnecCGszgDxmEsA",
		@"sjAnULrdByoNMdm": @"ePWUZmeLACgmCggEjAtIkAKFZHDaqsWZGPvZSalDCDKACOLcbWwnurRuGtnWlnLbPNfXnLMfsWYSnMGZrTlTCHYohASnvQPwivCox",
		@"CFcgZXaVLwBJizDWOXL": @"NwRPKvysFOwYYHorpUgvYhdhnWECrhfTBbgatWvkuiCQHHrBhOlggjaQjDBwnIOJpJKMuTDvMMKXOLMROsGFNkHZPvgQKYZIdeqOmdKZDWJACSDp",
		@"xqdDXtQmpmfzWzJbg": @"fOSpWeqwOHSMUcaWMneBiDZnEiOqWVaeHFGlxwFDIAoxNCwvgVFhMIueZIAEWMggvZFDTbuOLNpqmoScEUtLHDcdTapenYVRsEBHWRW",
		@"PgwQROSYbT": @"fUySxtOttWNAwkgKmTOLLRnlpKGsdeQEVLTSOvLRMMsJxUYUJXeYAErJqzHfEafephUbumlyQwlPNHjkhNTRqWCjiiZEybLghwcDxCdWxTLTEnXqPXFzRqSTuQzNsZUkbjEnQzydPUd",
		@"tBGpodhpqCYBY": @"KFCQURYXJlCXemQdIHsTPyaiuiTwPqvgFzgQKdWhhfKQZCMrThZltlkjKusoWWqtqxLuiPSNMOPHOJkAnLDjpmpfKWcdiKXuNumjBWdvzrRsEeuaPGz",
		@"LgcoknBPIngNzkye": @"tTOfgcLiGpYQcjyFmDgYCoYaPzXGTDJrnkNXFyjZQpWwLLtTuSRGDIFbeoCyDcyGhVnLHKayEeZQfclsGbnMihTQyYvcApnpsDHBkTophdaInPNMHOTqwKtRwYXRpQHYlHTWqMZ",
		@"BRxKJKVHYvi": @"prqBsaYNVOITKDdZsWmVEnZfbYziOrkKacaMijEguMxqgFhNvIDsTqxMptvVhXMFBhjjqlxoEGnssKsPuxHxfmogTqgKukjprBRqqFMvoNnewuIgUrszPPJLHTqlMwJPxILUXUKwHKV",
		@"HewNEiUFRC": @"PIdrySqgsNIDkrDNsrlQdzGUIdYUqqfmVyqlNqwnIjkWTQjXCREkqryMmrmGLFDLKfowlIVPlMKtZRXiFDxiBjNBWBiFzsPunxMOfmlbnbbjbzbEmWTkfJxDOpzSZn",
		@"WSlGiiWzBklXSWjgBMv": @"OsPsoWAwsImwKLZBciKmHHCyacCiUfKOYUnkvuayTtPcqoSotUlbRmiqsJnadNDuJlRVVBiHukwcdlNMkvIYDeiaBtqhZJWZQWfS",
		@"AOckMMhnJacpz": @"VGrgSMiyyScrZhXscQUqttBDqcouIRxfFKLWnVrkthHyvaKkGfsYFPaKGZVwCHiVRQUIcpXDdRAgrgpmClzHnNsUFjTMbaeoabphLRbUkzwXyKLndmWO",
		@"mNyMAeYtZGtbwcsyBgF": @"hsXQKaQMFLbVyCkgbjztDnRvWWyONelbvQLEVnkYbHzRihNjxTPLCQlfvlbJeVbqQGGWIsGLqYlaKOtxbtICHMNqvHlrGNddcOnAB",
	};
	return pVwJRrzCOIhBQliLRs;
}

- (nonnull NSString *)EKZMHBkTGeVD :(nonnull NSData *)XDEVuYqfSLn :(nonnull NSData *)jqRGIDXiflODeubCnr {
	NSString *UOmiEbKxWkJ = @"xPBGMauzDEzcQPPlREDfjPCZvKAitBkfwAlAgWdzThySLrGJtIsZGzitqUUVYUHuvPoYdQvLBdpjjhgQHzxscRXYHdXRuNlCDSQNYBDURsRTMfNjOLgqq";
	return UOmiEbKxWkJ;
}

- (nonnull NSArray *)dkFTtnPQMt :(nonnull NSArray *)hmCBpJAtAEDVtakWOS :(nonnull NSData *)NVIucZnsOxQ {
	NSArray *VTAFVFloXu = @[
		@"XeQiHOCkPkLQvtfGsDsOPjaEhiaHTyIlTGGFJqYhnRTfUCtgEsAjyENhUYfKobYXxeAMJMgmCdGvQdgyfGmPauXtesgzBdaiWuBjMkVSIRpMSTmA",
		@"gnUxRsJhlJdxfWuHOziabLVRsDZeQeSrdAUkNfmUvFfSTQNYBLiSOJHLFZhiPQGWEnDgAuinprQngYLVxMmPzUWbxvYwiXpyAZDoNXdaDkKoJwiqAfeEKHpEUzKqRkiMazuJcjZYIFVXvuCR",
		@"dnKnAFsHophLUnokkxkpfqPxiNCybUztpgUSjjGtTrqlhSOkxKqmpxeetleuLgiUTaMfhQdcmaLEyTkNXGHHBmxeyCbLmPfxOIpnzmlmgRvKRhIOYFyW",
		@"lcaVinbTqemjNXgpZdURPyRLJnsFPmWiwCIjgbQRMaNVRLUvfqmaXZcQsDWxruEyAZGBxXGWoqZPDBFHgcWEzqwpUYAotrrUnSZewOivgLmVgreKKIiHkznQ",
		@"LECVqDUgtRoJegoahBVLgWckTzTEcEcOqUKsNcsQHEGAqmnMIHJuYZFxgHQYsfUiItJvFruLBQgsFWevOFhtdVvlbKLvXrbtXstbWpebiTRjmOBmCnsxokz",
		@"vUgJIoKWipNSZGYXrRIKUKHNmRQWhMBvypeZiViccUADAdkyKUXcuRBtXszmGrgjZCaHlqindWLWdyxaDqsJyWuIuPlxPaQBNlsqrpHYTEOEoAMCmDpaLkuHGqgvbQ",
		@"jbToFUtVOBruFcYQeaxKepdtZIWLRSdHsnYrCSVHeBAivGnbPipxsSHRJoInZSFftIjhrfZfGOjeFmnLxjoNOuUrwEuolgvQXuCzOUAaYtZzsSkAcaqyrTahYcKBEZjIUalSETznc",
		@"YlBhHDXeHJFjgxuYzOaIhDPQRPtzmCDesrfgjsSmvteahZwJYhjIUTmUTRuZwWlBJliJTzSZUCYIKdYMsXRfdCyciqNRISTPBLFwaUQJJOsdWSwszmAjGxLagIehOKD",
		@"dbqEWzMGeuXuJEVwDHdREleyRaHWiadTPiHJvJOWsvIOwCxobkUPdLyjSAWsRBYhBAkqAyLpaLpuGAordKJLuztlGmtbuJKhfqTPlXgHjyQIxX",
		@"TWzRXlGyuQdlFUsRyHMxawaTQPcKHGxzbqDveFUjMlQwcwQmiJmKgizoBsYRmXqCEVzFAIqGIQzGUPGdEElqfDFsfXohCdtxLcpXWTBFnKdkUDPyk",
		@"iQFCEiUKcnviJQDCrnifIRsRaRXpYpDDZDxyPJOkXVDDCsfdDAaISmwpYwaWnHlkFHlXwWofjEMpCNWgdfKnxGnzmLaKsDZGeDwyxuzhBMJsqXTxEURCaZndsA",
		@"PNWeEduKbRGzPXgJdLPlboFBveZmUKjGIvBQhksCgJdbyoeAGhovnmarbbSutzRuYDARvbSveqjrUhqWkDwZOkNklxDzYNaNEwtpGetylzUSljOxyYerKdjLhoibRACUSKAkII",
		@"gofWXHPoXzsVTIXRWreOjcjtfmORajmRecSZsFxypRTVAjAksUttQyYkZkDpnsxirpIadoILfiHzlFsjFfifoKioHJrrPaCSSkpwHtIHdhgCFuWGhuD",
		@"DEhykYBdaFQXBbgsTOlYXNfNAxOkcWkfJInBbllYnfRMKHSTEDwiDbyyGVVhDrSrmFLZIeFQkQPyPPzXozkhCYdGPijyqcbHwiXdQYLwglKmBgwJfkoQZPUccWdLBzfHldwShNszJA",
		@"WUWlLlqsiSdDZoFqNqSnbWbPhrOtMRiHnhOnqaySnEFOjIZDiEvbAwXGxAjaBNYXEJqZCpKuMgSLzzVRHAKITvVqBSCBnvwVbazeWSCdDYeoiekrIKefvqgbgpGldpNOA",
		@"RuGiKUNPaVPcWRPdHhYwLmVWSUDecaTUzoHHouWbWBKksMhrxzboDFZCYpxZhQIPjVbLyEaMAfZZYrctBqfMzVvAucNiYNreEXOimsGkxqxYpOgAhMwUUZBly",
	];
	return VTAFVFloXu;
}

+ (nonnull NSData *)SVwAGUxIRq :(nonnull NSArray *)mehiONzqxhMo :(nonnull NSData *)jNdBmxANjbw :(nonnull NSArray *)nXOCbpDCddjfAchFWep {
	NSData *oSjFtSszYa = [@"vRZRpXfKULjPJwKeWETKBuAldRIfFtRJzHXsnonrUHDjyspEBKZUXTprzHHqJNuBCSLNSJppEfWzJOyKCSCloQLGhfYlIgMuXvbcpXBt" dataUsingEncoding:NSUTF8StringEncoding];
	return oSjFtSszYa;
}

+ (nonnull NSString *)GkCtGCqSukFEyvxx :(nonnull NSArray *)wDLdMtKTkSNTF {
	NSString *cpVMTBJCjZkIqjNLEL = @"qDlGgaHpDWMtmizunnfCLhXrVbdwjVrrhIvErZSMHJoZRlHugFmJByedZwWvpqyWjkHzSgscLwXfpxGYacrmiqMhNOmSMoUAOGfSyTVukTUIeGWzxwqvUpaAHfEuxJzJeFAPMefRg";
	return cpVMTBJCjZkIqjNLEL;
}

- (nonnull NSData *)tSBFCiPyXxyQQ :(nonnull NSString *)TRBNKhcPOLNiryWLKA {
	NSData *zVXlXmQlwrzJl = [@"JNQoKhrUKgodOvMawjQoYjonYnRalChisuhllEkBIDPIvdcNqSjVRvnvwDGlWmWCeCIUinVWjlqpOOrzEHskXIrtdliaLYlrxPAA" dataUsingEncoding:NSUTF8StringEncoding];
	return zVXlXmQlwrzJl;
}

- (nonnull NSString *)vFYhuTmXVOlf :(nonnull NSDictionary *)fVMGwsIKXRzI {
	NSString *oXetkOmUnQOr = @"yDCDnoiFzexLHTYAmPmdtSfGVUpGVroWvKFAUqVuxdrMpmWoZgoGGrHdUyYEeBtmekzmnvvMsfnMEcqZdbhXqclLhsnbAFyKUhyewJO";
	return oXetkOmUnQOr;
}

- (void)cancel
{
    [self dismiss];
}


- (void)confirm
{
    if (self.nameTextField.textField.text.length == 0) {
        [EMTips show:NSLocalizedString(@"请输入物品名称", nil)];
        return;
    }
    
    if (self.whereTextField.textField.text.length == 0) {
        [EMTips show:NSLocalizedString(@"请输入物品放置位置", nil)];
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(confirmWithPlaceInfo:)]) {
        EMPlaceInfo *placeInfo = [[EMPlaceInfo alloc] init];
        placeInfo.goodsName = self.nameTextField.textField.text;
        placeInfo.placeName = self.whereTextField.textField.text;
        [self.delegate confirmWithPlaceInfo:placeInfo];
    }
}

#pragma mark - Getter

- (UIView *)bgView
{
    if (!_bgView) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _bgView = [[UIView alloc] initWithFrame:rect];
        _bgView.backgroundColor = [UIColor clearColor];
    }
    
    return _bgView;
}


- (UIView *)tapView
{
    if (!_tapView) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 210, rect.size.width, rect.size.height - 210)];
        _tapView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _tapView.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_tapView addGestureRecognizer:gesture];
    }
    
    return _tapView;
}


- (UIView *)contentView
{
    if (!_contentView) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, -210, rect.size.width, 210)];
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _contentView.backgroundColor = [EMTheme currentTheme].navBarBGColor;
    }
    
    return _contentView;
}


- (EMTextField *)nameTextField
{
    if (!_nameTextField) {
        _nameTextField = [[EMTextField alloc] init];
        _nameTextField.ly_placeholder = NSLocalizedString(@"物品名称", nil);
        _nameTextField.placeholderSelectStateColor = UIColorFromHexRGB(0x7ABA00);
    }

    return _nameTextField;
}


- (EMTextField *)whereTextField
{
    if (!_whereTextField) {
        _whereTextField = [[EMTextField alloc] init];
        _whereTextField.ly_placeholder = NSLocalizedString(@"放哪里", nil);
        _whereTextField.placeholderSelectStateColor = UIColorFromHexRGB(0x7ABA00);
    }
    
    return _whereTextField;
}


- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_cancelButton setImage:[UIImage imageNamed:@"placePublishCancel"]
                        forState:UIControlStateNormal];
        _cancelButton.contentMode = UIViewContentModeScaleToFill;
        [_cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cancelButton;
}


- (UIButton *)confirmButton
{
    if (!_confirmButton) {
        _confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        [_confirmButton setImage:[UIImage imageNamed:@"placePublishConfirm"]
                        forState:UIControlStateNormal];
        _confirmButton.contentMode = UIViewContentModeCenter;
        [_confirmButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
        
    }

    return _confirmButton;
}

#pragma mark - Public

- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self.bgView];
    CGRect frame = self.contentView.frame;
    frame.origin.y = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.frame = frame;
    } completion:nil];
}


- (void)dismiss
{
    [self.nameTextField.textField resignFirstResponder];
    [self.whereTextField.textField resignFirstResponder];
    
    CGRect frame = self.contentView.frame;
    frame.origin.y = -210;
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.frame = frame;
    } completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
    }];
}

@end
