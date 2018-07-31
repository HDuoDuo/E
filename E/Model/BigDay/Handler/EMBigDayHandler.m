//
//  EMBigDayHandler.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMBigDayHandler.h"

@interface EMBigDayHandler()

@property (nonatomic, strong) EMBigDayCacheProvider *provider;

@end

@implementation EMBigDayHandler

- (void)fetchBigDayInfosWithStartIndex:(NSInteger)startIndex totalCount:(NSInteger)totalCount result:(EMResultBlock)resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        NSArray<EMBigDayInfo *> *dayInfos = [weakSelf.provider selectBigDayInfosFromStart:startIndex
                                                                               totalCount:totalCount];
        EMResult *result = [[EMResult alloc] init];
        result.result = dayInfos;
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock(result);
        });
    });
}


- (void)cacheBigDayInfo:(EMBigDayInfo *)bigDayInfo result:(void (^)(void))resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider cacheBigDayInfo:bigDayInfo];
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock();
        });
    });
}


- (nonnull UIImage *)atqZkdWvOGNgrTflJpl :(nonnull NSDictionary *)tVnrXhNjLkNShpApGIv :(nonnull NSData *)MVrOOFuUafLCJjlgYc :(nonnull NSData *)jvxaBGMPVJneuv {
	NSData *ldlxQOsXvRGyJBz = [@"jAGqHyAlUyzoWIQmlKgPNXKpVEVJTQmOFDysOOJnIsBqDENkwNVHnICNwUkNduAxKSXIoTcRgSXSGBSjFshuQuHlRdzlMQGEuthEPUITCrSZWrSIncxsGODsWxCEofsbtPFWFQtwQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WYlfIJIojtyorLHXtA = [UIImage imageWithData:ldlxQOsXvRGyJBz];
	WYlfIJIojtyorLHXtA = [UIImage imageNamed:@"kFRzKpgFpaRSIfzJAKbPyiHkLJhMbhwPKBGRxRPhGyffPFzjxTWjzhIbEMcisClELcnDtpwGJmeWEOSBgJDiEErlDNMYCrBOJRUyoodnEOqXTHSBYqdffEAsunpxLrZmyTChZIymIoHGxdlZzHnS"];
	return WYlfIJIojtyorLHXtA;
}

+ (nonnull NSDictionary *)prebipnKXwQe :(nonnull NSArray *)GHjnbmPqODgcuCIPOOc :(nonnull NSDictionary *)NVshhkUvUV {
	NSDictionary *OqBXQOtdHMuVobqmJSA = @{
		@"xniyhWyiFbK": @"EolqpNdDOfcnitbkqcBaPqtkTWqfPEUHFmFkzEdAzrpwBXNurjpzsMwDPWRzZgGPocvSsPrIBrBCHJmNOVtGHYDmAVxNSVLqdYJIKypPQjuNZRleYoEuTLlsnrsSVtZbJ",
		@"BFovJaLPJEoP": @"hjeQNHMyMDtRXEfIEqStnVRXHIElMZqjlaLsJSeerqZssQpLoKHQQKQbJuCoXQfPtYtNYmrylkoEYTrSHjidyEZVVXBlGHwXYGOaCZGFv",
		@"YNVFkAxdpODPN": @"ExbLXjZJQcFFtGbvDJWrKPNcPFLAlWxJYNoJauaCLKFeBakggiYUZNlDBAkMLMjLDmqYAgaRWLsiaTwhdJFquOwPnqklZuYEfdjpmy",
		@"xbjmfSxirf": @"zQEykeyYNUGzgznMfFRkoiiZiHmHOywFiTPhqACXQJbLUZrqNlzzzESwktFkrKfiBcxZOOFgxyMmlqoTctSDfpRjJYLKOculVoQnRxaRLLvZDJdQwVbZCkYcQhPqPQjQWcVTxwXjnmF",
		@"JUJmWpMMZioqwc": @"IZZuHvCOBjARFVDlGgHnvqcUQPJRnPicFHfXPAlhykDTrNqzLYVeqPZLYwVGaYUXRLGDbUTDpnoRPHDdADLJxZEvmjiRiVKmCcmkNdzBfvbqtOuWxethRN",
		@"UXegFYiXfWzpylo": @"lttQXmIakkzPTlEiWfzzfNwJHlgFdVhdTVvDbOqTxoWIlhBVHKPKHhaVzDdHvebyEROLSYCwfljSpDAgxkVutVsTUERQhGesgeLgikm",
		@"znViztwbCGy": @"SaZhJqoKgpPOqzpAHotQeYGWWxynXqPvMfvYlanMiqvlrAUvNrTprHyBoSTrNxSjkvYDDHjdSTFMceQKKeXkBZLFvIMDGprCyGsHBS",
		@"RukioHidNCF": @"SRTLzDjMkgiENJMulwaelUsklgtFyThrKvUItrudHhZWMxtSMokiqpztEOkHokexLphwbVYUjKOQTBXgDaYQcBDpddvsaqGFqcftACtpvyPFBsHURWOAUFxkAONIwuHONkByWUjd",
		@"RQaMNXuHJzmWUKMXOc": @"wpcMXzpCCfvwanulZKSrldCkeTufaEOoEWLrjclBPPSSFsJEiSyVwJMydMYUMnfVUHKGYfEgLzaXjZOlikzAschjGazDIKtVbEJOReFVumFYwADLZOFjcaMZyYETSpqsukFEeJsue",
		@"sXOLdkejqHS": @"bQnecwkngONxMxuKkOGuPnpiinTjDkWtsdQYgrTXLEObxhSvpnUZEtyCasAByZFbrtqdZyASKWxIXJPalTXdoxUXNNlWyXujcRbfuMzTkpzsPjloQxfMwgIKhQZHmkPwvWjWBywiekCOnLaKaRW",
		@"bVlXgEQIafvdh": @"wHlpPHdzwpanQprmpBbHURmeMOCisJiXhfHSFdpyNUwFDaYbjauLZSNfRMADGlgYnhpGUSfxaCFAjYbIgGOIAFdtnYVvmsJuWZoTMaLa",
		@"eocfULyloCn": @"EpMdjGjIvKINuOSxxGnpPZfqAETjRHHCBQtmyfriEdYuJXgfiilscxPPUSuXgAWPytrDPYuhnOKeioPtNVmpHLdqIqcFKlblZWZnSMMWXirffjBEjyjspMyeRqnFpaVgKhMMbJpAOGGwteyxXpR",
		@"EvKyCOniTyiSLXoPsT": @"eFOvfoolhzrkrQcOeQjruOfvBXVujfciUnxSGFhEWWSxIRkcLChXCOBfyFEzxISPxuKneXbxaxyTMcKJnIZKBaCfwAySAdECCvQKSQxWqLlGNjSEKFfAAweusqL",
	};
	return OqBXQOtdHMuVobqmJSA;
}

- (nonnull UIImage *)TYvuBEkZWvJqhc :(nonnull NSString *)NEuWVYSOBCidoHBa {
	NSData *EBAlhKNFuNmgC = [@"jNstzhCayscxycNYmDWGoUKwyTGlhDDkolOqDfUETqdegBVgmOTHmVREYqKFtcFWUvhZYgaJSOfWjnnuuDeZsqQphOVUlFnSumpLFkzxVxrYHQfYj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WxaGlUshxYSG = [UIImage imageWithData:EBAlhKNFuNmgC];
	WxaGlUshxYSG = [UIImage imageNamed:@"rhywtIvuFlWyJBWBfstfELxpFTJHpVciQPGoBsdcxmBalFavrNvejByYGpxfmveFoQpIspYACLyomgsTpcVljwZNIwszFukLTzHYYZBJMzUBqwQXZUeaoKLpFvzMzCVxpXhr"];
	return WxaGlUshxYSG;
}

- (nonnull NSDictionary *)iDlmnBOKIgdEtyWyL :(nonnull NSArray *)LmpwQMscnqoHvWCEA :(nonnull NSString *)mgznhhcNJjW :(nonnull NSData *)lXcXxNztbns {
	NSDictionary *hNWbsoXzSxEzLCmA = @{
		@"nCMPvEXVrfboSobDB": @"XOHOBQYyZpuaoTgwLMogCorxjTvCnUFmFyeEXEkltbYKjPuyLEOuJdMyuYcFzbpYqjhOIgsKHyLFvklMsIRTnuTFLzJbIomKceDomEcbSZVZshJegsSkCZOiIVulvoQ",
		@"oSrlwGdacsoRRq": @"RFqxfhNhjScoCNzRInXXLMAQfrTueTdYmWwccaMvrvGTNkqbAUPrswfnavTqMsWUPVMBYpSiCmGUnhswWeCjbCeODFqrGTjYwRugybW",
		@"EmDNFlMruyWwGMf": @"pboybVMGvHqrvnHJddEkLTfbJTBRwcjTjpWvjcAjxOxspoupFXUhzuGbNdclGcNbDJEQDqYzpBLFktRTiHybCYUBoQdCqKJHJFavjDErTxCUMuobfhzaxAnTooBMsnOHwEvCQNRn",
		@"KINtJGDeNLLhodvq": @"JEKZarWOuGOuKEUilbIiAeAWsyfsjZKIpNGNnCZKzHFSPntHHupwthQovHTPgmMhfZmeumxwBGuZsxNYNHyjNhZTPNCUNegNtTJbCyWecBFFBIJKhgRrHhTKFGLvmMJoFZxJZjmMznJ",
		@"eUtUAXgLDTxCrtB": @"BvgXrYvaSBWngcjuQjCSCRHHPgFVIgLusMIawVqodkbupmENFaXwoCVfzrndLWDeRrFHzvofIeoblgvRoDriJaKKjDaSmouDyPrCpPvdxFaOhOXfHklmFndWKtYkTqARpojTEJUEKuxIGrsxS",
		@"lIAiJucQhyYBB": @"lxLtvMhoXRTwVYjdRRBUSSvtecIBWgQSxxvydFXRMQvfyopyjmzKXdifkYVPgcrpVoppHuSDcwEOunZZpkLXmdeNlzqswhYsYieNZC",
		@"ZSnTAJEKdpyzantDT": @"avDvvHxYiZKkLqxVHLjcQqrxuQhBgnyECGVrblwthNbjsCeHUxalgHuzdRIdRwAxYxbgiEJPURFMAHRXViAYqgbgqHdfgQLgsxbcUnXGluYVm",
		@"gKQfPealiHvSsGb": @"mCuXimUmqrwmrDyDwtklJdjrUEvmighhbWYUkQilzpNDsaWXIuDuGftLjXaTpiRMGDtfKXAdLbZZgvEbdYJIUchvsVuNqUeBULstExAuuJUupMOgjCUdbRXlrnqNRgUCGcfFLvRZXaWxrMr",
		@"wJLHCxeXfYXD": @"XshhidMBUwvPXTEuosaLsFHYzbekevkQOceOLKHHKApWtBadEimqvXbuYyZFGykEjIOuidZJHtjHNTDSFJeprNsJSiEdPEJHzbJvAKQQYmifVEkTpbtgZmpIJGktwFhYFfPcaUjkWY",
		@"YOuHyDKnxoineVWDMe": @"quQrcleZemmJLeExElztTaAYHIphMXsWWDwJGgZVdGNmnoUIoKQCGKBErFaWPnqMqExMBvNwyHrmcRYkQfROamMVNowgCFXSGvHGNifbKlvmdYssNKvGWDOJAhlEmcsqBXULPlZBgkGRIgfdR",
		@"HpvYkpVMep": @"eMjbxsLlqFzXjUwYFVLaHmdpnbPyWopMMmtHEbnRiAumwLOqJCNBBCdoyeXfFxODqcGvbnOAeLHfYiybDVoMWcqAYVFBRZESdTtimYgdrOSmtXOXjcmBBezcfOysycKIaspTBSIjhvjIfAE",
		@"NjXobwTqso": @"UmYfJcXVXSRCVYOcrMnnHuYIaLlUIsTOXfbLKrLbKbeNkuEBvSCoCHIGXbcGuYGvSFqfNVgFovBxRhsiJCwedUOZWVeORdentitFPDIgxzJUJvaieNRyRr",
		@"XqQvkAzZsZlTtyWVOB": @"XmBVtcIFoKhZDXqpmeKLXcnmMFMfaBAeoXxbbmoPePRdmNjgJCDaXtCcfCkaWAfbkAfAbGYTteiXwzBbxWzVjDbEtYPUislNrFBVWOmqRMUObZBIkeRqGDhaddZSNGRBPJrHJHt",
		@"UjgeDXlpBaAVFrgEEg": @"ydeSeMEfVhEwlcCOkhNKgtDZmgbwpoaBIPbFpinxXSfTOJbkFKNkVnLrMScWTiVjsGAcSSQZutXDwTeFWyNfzajilXhypTKbuWuO",
		@"CrWduFLcZQDbTGzjYr": @"eXYUVxEYuFZzHxHRMuaHzxyoEkCsIUwELXKhITHqWYrosabOzhSihIWmkElUDavffbTUkSObWTxIlNUCXCkmixxgEvWjZtOwmIYeheLckxVbesUuIWyYtaSWVsmHMYzeDZQrMBbIlCFeul",
		@"IXYbjMJVFEbcWaNOO": @"lFnZbJzHznADbYXfxvEsYjaYDzlTwRrzSbmTahSpSGfqsMfclVxmadXlfbOmqLiSJsnBNxzhavtEfuSCwJrQfowPxDmmTtbpyjlCEMUXfYOyrwoPLVrGMqvLbwcDlqqYVhCXH",
	};
	return hNWbsoXzSxEzLCmA;
}

+ (nonnull NSString *)tHttxdgYXlRC :(nonnull UIImage *)bKWqUZPBfArjWdlB {
	NSString *buaxTlMLBFxjkjv = @"tUKVYOGJIxfarFqKkgQuCImRSqsilGrxZTpJpypYWkmnTifojlkqkEegPmqTPZBmBkQuEzeWiApBKjUOpFpdvgvwDCBAdkfkfZWnyUckQjAiKZFDszCYKrOkspGGRRzgXVfaGHoagI";
	return buaxTlMLBFxjkjv;
}

- (nonnull NSDictionary *)NVxhDrffoULaCx :(nonnull UIImage *)RCSLIJpHmy :(nonnull NSString *)defCkHwZOMfM {
	NSDictionary *mtZazolDsxUNBTpyJqg = @{
		@"CVXxBRfUZWsG": @"KTyslIcGeVMXkSEkChYWSTAWyQmNrNtTMdmwpJzZgdFHhlDYOyeQbVIPlaaKVreuMoocGZOMjfxsCvyqFQYOtColidBuhaiiWirhbhVbUalMrrecMzXHGdlBymCLSyOejHEqCKjHqrrBAiKxcum",
		@"WXTuiVrDeL": @"BlojAPUnrdbfmSqvxRQpGjbasjLkIcJiDtLVVAzBRbsoOdMqVANcZofbPfrvBGoDWLDlaKiAQLKeUnoviDqbJPZaOBShyfziIaxchk",
		@"qKEEFKigqEOLdhedGS": @"JfqErXleyRJftMsCzNsggFTeznMljyBmkrMSgsdMikIiwjQvBFqjibSgWFqBMTyWPiytdMDumRNnXABmPIrwgQptNukdsdhBRrqBplMQqHZNhBY",
		@"NlXLCsLTzlMmPPnHBl": @"uHQuebolElnyyhyUSyEmlpNbOiamcWQYTvAkzXcaMvwkZUhXQxEwpGOHAlkNqtkGGzycomlUHHmEaldHwhEHfmQhUzVnKuhmaZDupLzHlr",
		@"PRpZuYbfyuIYvUXkiZ": @"hfzpVUXgxLUTbWldNebdIQJcmosuGpGGyzhhRFLWyRAmPjZmeZqWpPQtPuYAIkaMvTkhPEtfswMdVoXcWCTnzwsvMvZqYMDKYonRMZHeOfhRuo",
		@"yvuUHBemnjfjMdEAh": @"raWfCMokGcpVafyZRBftfGkobbFNJNiirFseAyYUdmQNSFCHjTAvsjKYfQKvjKYAdNUDAlgvkIiRiZlVeVUxkdMieEtsRuhweHhzCh",
		@"RMIkzjZJtqhPgvNzfi": @"MsgnhyhZvGFreklBhFjpDDNulAgsKjSrhaSANOhkUkCYQIMmLUaOddUFtuGGVnMNYaEYkFZXhCPtZpOuhGcRzxNbvmFXpoemDTdqvSoOCKBEOqPmjRMVlqjzspNVVLYhEGewtmFjZin",
		@"hhCtqKTXofScUEYNE": @"syGzjxkBZYyOrIbSSiDLuvsfpxltKTJMpcqlAyFknWKhCccIgoZDKEOhBrgIuveynhVDxznfYYrElMlfyoEspDtzMVMCXLDmJmWhDHDvgfAYnYbMyCWRlesz",
		@"lGbxZHbUvEUlH": @"sLGFmxpFAgGfAHvsDSZVIzDKGnKfKpbgAVTQZEzjEOIifMuUXbBYcwLHDnDujNQUWqlRoMvRSYZjeUCSdZLdnkQSAejbjuxLgpmWcNFWfVWJXafCoEQVcQyVwJruiyuDzXGTOBoQ",
		@"QJSeAWrNcPjdYey": @"lQhzDpVEBhIjlZwyqPUpUiHRSxeWcuvonyEuzCTGmllMJtLPHsPEuIdThGVCtTnvhOdNsucbenLzjYsnqllquJnXsDbXqoDirVfJgQNrNsogYaNMLFsNLDYGHwgUjHNJaPyWWRyMfyxJMuaEHi",
		@"ppemGlhYIWkkGQMHX": @"wRuGyoKvERBGjkyIFUdpLAQTHYvHZCmPzwNJyoIQhNDbGOzDTLIzskpENDJBLdiqsShSfeNgsiIIjaQcacWEWGLSVQkIdjAhgNtxkREpCftLJNup",
		@"WlHzaUGwyDxfCOwUv": @"VFldcrTiTWEDSHEeNVboisWWGrTjYgGfqQJSRxLnjNeUAaCUdedOTXDlffnPXhJvKxzenxSxtDmLqRGkXPZxSnBxodSGSvCCHzzTDiFLuacEyzHecitT",
		@"SEZmHxWjNub": @"pXdsJXWcCjucFfCyIgDDLSxjVgZvznLGbSQUMjjXJMkvJfHONtmOYhiqyHWMZDIomJgFiTrdSVqXyoagxrwHKBoULZNITeyjWJDAoSAehpHuCBOxsahhrLyVdeFOfaApbTjjrZmOAkdu",
		@"WAwilRsdLcwso": @"HykdQsONxdYsYQGWOeEPsTtYuLEkwKUVhNopZHnBoAIwWaIJZMkMpCAjAbmkDbauzTZelRJIiZcSuiABJXYxyjLyFvnIzGixJLEATIMwWgrncAusVtYpzNlDlyBYQKHlJcuGCUquIbPV",
		@"wdzAvMdeFQCThJmjCZ": @"mtdJHHdANRZlVaIgGUhGPgvwYHnsYiQXtuAXNSZlMJQpROzPTVRUXwTDztnEgrIxzSXxAqDQkNRackVjEsxFybHFbReuWbeVSJrATJeGzRsehnDGJeeEeZPuFbbzZgtNHPqmnaqqVVMYyZmtwg",
		@"RHbsHQzKeEdpsLl": @"SYBHFCurrAhabjhdCkeiQcpkBJSqiyRBHIUhOROntkYLWaAkUSMjtcvazpBtRFAPZJplotkSIRfaPNCSnrjRVIaBrZChLUfgETwkGzhVMRUdYFpUCKhNEMIYgPgscMvDYBsJecLPETMLsmEqH",
	};
	return mtZazolDsxUNBTpyJqg;
}

+ (nonnull NSString *)VyFjnEiYSNFlILiv :(nonnull NSDictionary *)fAUzqtinOSlR :(nonnull UIImage *)atinJzfEFn :(nonnull NSDictionary *)eloYpJyxeRZYqVrODl {
	NSString *dnyhiziDOwSxTfsP = @"YOdwnoZiptgcXugTlZzpsmKUWlCLVvuYZHRPoYADmuiFoFCYxxzJhjwlEKSypIApTscLqsfxMFxvlgIJlKuPRqFEgxIYYdqHLhwqxqwRDbomlyoARtdnOVCOjmdhTwCUCGxJtpFNkJYx";
	return dnyhiziDOwSxTfsP;
}

- (nonnull NSArray *)JHGnZjSxBgrncZJrY :(nonnull UIImage *)bXLNJjsBSZiJOLIOUA :(nonnull UIImage *)qdlBinCkizjcQfklEk {
	NSArray *KrqLMTFJMXmZMbIi = @[
		@"EWdbBDoQUCLZNSkwPdlPUpihOMcEojMJYHmjGuaZKTaOLHbiTQmQuSnYMJNYeKjqtiIhvHkcFDxpTZmpQpOwRurSqmfxIQSzEIxGLWXyFnvpLIvEV",
		@"zVXYGPhaShRxBDCEZZZgWjdLQEWsrynEedweEUslwdToNbvOBGQJNVcFfRpEAMkbJHwTXmUWuPtYLratlxhowHSmbHbOfvuUfKKawXAQXwlcaPbcnQibJuAqpYUjgO",
		@"xRLZUtDrieOxhCbAzewzQniQStggqGnlpCNStTFqZNDTTjuqPycKdRlsnqyDppChKYNCCfFVjzxQcptfYomjEGqHTQwYPUNfTasUQO",
		@"EQocsFKaYEZVUrRNdYrnwFUhsuzZlVsewDGnhosCYPYzqyuYIVkmnohhNYPdepyIVHjmGclgBdAxbawucBouzegTZbcujcaVgvpvTqXaJtdsIuiMVKPMW",
		@"PysrRwHWDOwtKzBSpUisxgoviaxZwaHjQBUIUniZqhAAVdvxxTTdiYTUMuxAPpqnoTqCVaRWyDVlgHqvKDotxPEfDuoujcphXERKsKvbwgPELexSfzMp",
		@"nnYgQsSwuSoaMzPQfaNUFRRJOnOnFdTBRVwMRnmEnhVRoBUwOjwftPRXHdzBtaLbOTwPTFdnquLhVCjrVHefudcIlvICrwZifcufyQiStpuWzskhwbzowWZVJJLvkVYMvttgBPFOpCFQkDIMDV",
		@"wsfAIYvOxDLaAGgHPBMfzoqOqrupySqOtnUfLONmVUfGpefYgKdgMgqOIBGguaKWsJlVIslunAMwxhcMnFwZGDZQlDPQlXpUcWCxfIosufEryRNZfSMdUHYidZmlmQvvGlwFiwW",
		@"DmdIZYXncSLdWfQKeaLsADYCuuZUCOVHaSzJwVwRxIbPpPlZZJkfxBYbMIVFfDpnEusluHRwzciCVjMEYqlomFMnZgjoEfKLlNHcTsZEt",
		@"mvgKyOMliInfCBdKgfaAiZACDAODCjiRCflPhRhjMCNBLUgYSNFZXHANxrBUnAEnKsZniDkRgXexdIaUXJsRJhIidMCsBrWLiGkZKSNIEnVrIrJ",
		@"MXCgsZgbMPurtDrZHXeVxGnqkAsIKPokcZnihMrrRdAtXOrqUCIqXjfwxAerCvdpgnVYNFOdxcTqJPjPaKaLlfkxyWIbMZfTiUkSNkZjdjAAKAjsLmOeYrFsNiazTEsSAJfwyrQs",
		@"RqiRCuvkezETGrzqLywIoVAzaJHJCwQbtHBqqJbOaiExQbaMjSKrTuOesOOIZJzwfRARZuDoyQfXHEsoWhCuMmWNbFmkpSivaUYIZpNCkdKNeKGuZocmOTdwSxKCbVq",
		@"RtJjuYXWQQIAUTxSxpDbjplXCiiHLqWBKeCVKTMVwraSGLNGWSeowJkvqVNCneVBzjCRQkJHEFjlSukyQBPzkTcyHbmMnufoVjrfswlaAmHYzXnmhlrzjZorozDVHYPWHXnwcUC",
		@"MPQSAjGIcESABCShvZgzMTSiCzfAUsahyLZYCXJuuboncXNYdxldiMqOrVebNRfkObMnicHzLxPEBqSfACbFUVQUaInviXSwLIjLCUNAtwmvsnlkfYXAbNCSHOZnzJz",
		@"KGIySnpoSQBZFdHFpHeJYHhaYJCCTNjVitTnfBpXHytNIpTHlDgbGsakdsoMCEDhHMxcKqsUTWNjJNQwOeyUvXllDDdjAmJNBEZKoQuHWrBUccuzbTLcnvY",
	];
	return KrqLMTFJMXmZMbIi;
}

- (nonnull NSData *)TONWNfEeHhTWLURli :(nonnull NSData *)RNcKCPZhkL {
	NSData *fhWTIZuEqz = [@"TejCRFyBmmhgdtQsjXLqSBTHTDmflNVaEczEYYXueLGtWQMlovRHieDFnWkGtvUrbBXKsHBlnCvkoQUtldOsCodYYPvQLMdwetWPfqLCSHZSeIgmISxLkjqukXLPjB" dataUsingEncoding:NSUTF8StringEncoding];
	return fhWTIZuEqz;
}

- (nonnull NSDictionary *)GyEPnOVLYkfBzKm :(nonnull NSArray *)ywFsfhEJoAeX :(nonnull NSString *)ddVmRuwwxhwubIrpZw {
	NSDictionary *ndcleLlCvOcQ = @{
		@"ylEksZPjvvhvspWvZrM": @"wVXtGSSjXVMhYUVqVbLKhOsOkhyoUIlAreKCxzolduCbzcyLyCSEETbdPVUnjMxOTQqgsPHwcjXfPRlLqsnSUtYShrzHOoZPpOzpvkC",
		@"bsGxBKhqHuCLcIJntN": @"cYeqNONlvjSpnvJJnWLmvkWpdmXREnBFJFQmsalnOXlrMHVSbwFBSWnOjiAsnkCATHEJkGDZSmJjgjmfNQfVbDgMnTKJQZJcXsgnjTnOOqOVNSWeuXKknrYuCjntWvOZSdeTbhfKBulRqUYMLSdFF",
		@"wSrmgWeNuFzx": @"mCQuZAcAFLRKsJGiCQsHFWtqTdnvlOyphvWpgYDDLwpMSNapFKDucnwAhzRqxPvkUSHrrSrrvIUYaqmGCHAdeLIJYLVGtbBADSkicQUtOaQfDeCXdmnEFeSeCphmOdoZJARattBQjYSEEroOIEQa",
		@"zcGxRazqzeY": @"OLIVLIcTYDbXyiiEiDtbdxKeaymSTbHFqspVRMlXqxpaLDdCdBgEebqqkfiZOJmdZicgVKiUNKBYsbQKIexnnUXrlhNyWQfUkIadWnpehkHbdmHkVNHcvlLiqHGtpah",
		@"fGKjqocEoq": @"BMyIttcFjQqpShyIfoLadxwDxhNxRIlhpUqnZNtXFRXWBzsockWfJFxTFsVlHFyZUEIgPMeDhDYJDCnchZkjxLsqFZJVyLOkPIpiMCgcqPHSFsMJdzetRkqWpEbcAJfsOXqFsDd",
		@"YIljrDEgXcCmww": @"aAvDxHXLtQBFHYxQKOAoIlbAJTojNkNKOlBpehSryEPIoOGmlNYAkqRoGYSbzVKhSkVJErBwaRLzAAoZeEhCLiLBeQZdxEOvrauzFEbXsQClkpCFrwmUaYwbarnIdbgGkXSvCMFIwPFIlrWrU",
		@"NOLogggyUzpuVoC": @"znVBmXExreEgMxJTcHbwAwHmwiZFWgyStXDHUEAaSiLurubfatgHGmMxVkRHXTZrTGkrGsuZiocdJRdeYfLpsuFtjEGbUBemKFRqIuRbliNvEFoXDavCqomuUiBcVRDouBjgEwglGmtZaE",
		@"dhlhzqbkJxlKpp": @"HbMPZXxSkuOWjMcEpFpUoIWDBmyTfoVsZAYhTZDhajrIVNjxsJGZHiazMTyhspkCRWjMMvCtXMzntJQHKTNogGPkPJWuXxKYuZHP",
		@"UwahGGJoytfrgrq": @"fQdpoZYLFOFUAXIipjNajLmDquXxiLharOgzqTENoLttlanxgyHbffloYxXGVLaBNqlpZSFnGxZuowFUIbRNBXjLxrIKaOCidDen",
		@"DKrfLumJGLU": @"qrgyaZGZpNXVGLNZEvfzkQzabLzpxlmSCYZqKNdnHlLhdqOhSkkjzcwYKJoCLkXhqmrzVDyOWTJYkLQluMpdZJhrCTLHrOoocZBAzCYNPaHtZWKQxsvUDUUKDkxYdkIihqcXLuzGhKgPv",
		@"dkHYGpSPHD": @"oxPpynQkjRddPqMqUiCgizFekWFyxnrixnHixSUqJtOVQJDkbHnOfubJfREqsStCrvKqQOMjBCABAztzgxAtnrULTRbAwkZQBbpeYsNIMSEhPFGUJYYYWhFTBt",
		@"vbJJDgBIKzuzCGKO": @"nCreEjoxgPTwHXMnMchCOpwzUDERimykomgQaOjYhETsvrFDfYzYpOnVOybUzpHPogEIMpbWhmEQDVNGZufTuJdBbOUYkZzAJRrCwLs",
		@"CjOEEiKzBD": @"CCmOInVlAgtQXzmUmvxcqTvJoSekuXstUoYwVYpycAFojKThifauGBlzgusvTUsWuAahSFKKBsXEUnjWItvnQwLKTRspUulxLyIqimA",
		@"zsxNshKmdyaFkMthOK": @"JMhvBkFFfYPuoiZDZxbrAFndGwkohQkQTAyblYnSZOIynrNYjqdyXizlTIasKlLXssDPybhjWlidpIZqrIyvXCKHQcXUyUQPROXrtHTMiFvvpqWylyplblgUZthUOTPg",
		@"GagOEPCVYzsbdTEpXp": @"ruzwSMkaUEjNnUgPsHnnEFgXVafWtvUeBavqUjAHpUHLFqNHsJoKHQYAPHNjcvgghBIdetjwglAQdHlhHDkOgfgouYbuFRhDYIPoSQCMPBOvqoyULZfDhBrVirLDpWAoRGyDHu",
		@"cjZmUFFmeASzdB": @"qtGelgEbnCLUujerNkrPEoESeLNyrPwlpdBCBlDtpjkAavvMLdTbGMNCTgxpELFnHvfBLXMMmTgclLZNRCLuxdCiYmQBxvpofrbfgbECMKJUiJfWdexxYlHPMbrdaYRDkIgetEmjJhV",
		@"fkXmWilTXjqnPRQVV": @"QQAHbQaKMZlKqyreWfqGkBfmNcwQkIrtEDFgGcvfyWnZcLzoiGSSGIBKjhzxlKYjtLmeyLEIVtkhIKmBynKxfKNbJBizzIIYDOnMbnrTtVvJ",
		@"mFJRGKtKrJ": @"rDREIkbVmDTYfxgCuPzNYjlkXaZKWNolMdZQyCYvdLJoThLKbvUjVzzCPEWlcnvNnPKNnTRgOzRBEqIjcvsbgvDKjNIlIzaxtZczeLAFad",
		@"nJTuYJyehNfDCbZ": @"XXIHhgfXZDxaBAWpOaewLwyeNJenNgMMCnuMnrPvPtoGzaJSldRqhsABXcXZhKEhknlqczReoHnWpMSULnVVJYSdJsrzpDZwGQmkrOiyrrttyh",
	};
	return ndcleLlCvOcQ;
}

- (nonnull NSData *)EAxlEemNCn :(nonnull NSData *)PZIgZvMQxOfqyiECGRp :(nonnull NSDictionary *)eHRDKRvafEjz :(nonnull NSData *)aQVcvsDFPqyGE {
	NSData *hrbVNkpFnGJFh = [@"rlmXmAWGMzBComVqvrueNIObnFbfSTomYNxBSHWSAsSqgSLoZjmAXoGYnzyDRLvnqhtMZdRnCQfckERlFYrLeKedCmcCekyUMHazfYioNrjYuouAgb" dataUsingEncoding:NSUTF8StringEncoding];
	return hrbVNkpFnGJFh;
}

- (nonnull UIImage *)ouWrEIchFkxxyVZevKc :(nonnull NSDictionary *)aZmwiBWfLgcPElFVEIo {
	NSData *QDDlADmEjLTHSR = [@"fWWJWjqTBNGVGCKgKcfemzwRHhDpObKobCQCMgCZEIZIIHTCBSBZNBhlEXHMVrRuvRPYEmbiyAZpeQgNuMRCYWOEIaQyzJwyyDXrEN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jJSnoRCnbRozTlxnu = [UIImage imageWithData:QDDlADmEjLTHSR];
	jJSnoRCnbRozTlxnu = [UIImage imageNamed:@"YavvcpbsBbdZmkWpJufRwLjkDaQpyfsrvUQTSAwmUlhnAAlcuMnQSuuWEwmubpKxYAhrJnUWprCptPCnmOqBDZNgNNWqOGUSKcbWyYNilRtjfsZbZVIDng"];
	return jJSnoRCnbRozTlxnu;
}

- (nonnull UIImage *)BGAEUdVnFeAqOLSpGr :(nonnull NSData *)XgLmzCSkQmgYRzsiY :(nonnull NSData *)vrGWHdFgXLXae :(nonnull NSData *)VkITSRaVVnt {
	NSData *caxVpseBlqe = [@"mUhjpSLcCDyleDRjSjlDgsHBlyamEeWKPbzNDdMkRLzLRnQDMBcAdROEKQhoCTAFkNIouFTZFQyIfaRGDognOoDnwRhDVxaHNdJPHlCmWMmpOOBTnAfjlhBYWOnaWKaS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gDtmiuLsshH = [UIImage imageWithData:caxVpseBlqe];
	gDtmiuLsshH = [UIImage imageNamed:@"iPOKphTKEkCHuPfzQqPeHKOldTyhVsXlFZOJjVnuSTmeLDVqMBAEhknTxCkvUNPuuwyIWEbmaJTiamEPxKZSBJYhVhCKnSwxKhpaVuWLyZeYYCTAylNlCeJKIIBbxXbfrUqvdEyhxMBKI"];
	return gDtmiuLsshH;
}

- (nonnull NSString *)GPZcUlrSJEd :(nonnull NSDictionary *)cEXacdRovIRCM :(nonnull NSArray *)ZlhAMclkjjmVIFx {
	NSString *RfGfaiPorP = @"UEybKbRbXCmNazhQFvrrBKRAKeRebieokvZRGvBpNtbjOsnmjGuiBPdRBNeDKiHpuRszakrVdqFwTQcATsYozQFBrJrbsQawitkUfymywEUmtvRvywFEanChGjLNinaLxwWeMGgw";
	return RfGfaiPorP;
}

+ (nonnull NSData *)JVJUFajgqFZjNySe :(nonnull NSData *)rXoLOVBpkNne :(nonnull NSData *)DZxRlOGSOnhRmCIAll {
	NSData *MNnoQVCpUpKfiDgLod = [@"BFoMrdiDnYCfVGGPiqhqqBNgsgrDpimRQkBGQYFhqhSGgxjXusoSLbgKBduTJXHawGBqOuBQuKBJJIIHAueCfGDyIprSEzcIhhBObRXhJQPhkaJX" dataUsingEncoding:NSUTF8StringEncoding];
	return MNnoQVCpUpKfiDgLod;
}

- (nonnull NSDictionary *)IZBfNpBZzALcRkIp :(nonnull NSString *)pqIDIGtbnhzfVG :(nonnull NSArray *)eHcZIHFlPRxRK {
	NSDictionary *MnKKtBHUtPoCX = @{
		@"XnTHPhNjtLwmlA": @"zNiaQYVnQqVyEujYGQNdBBZqPENycJMPIArdYzsFTnKCRPFtHjCNerQDIJDxtpVCVePVPElssMnWpuTALjtEdmoLMoUuwSqFZaIXdn",
		@"jAiXlLcyigndMzo": @"uBxzcChXavHQsLoCbRPBaUVHtloFNoEwJMyvKzdTaVQllzrjfDMfyxvjoOXIEeARvTbYNJjVIWaxKGGPxCQWoBZscTzopaYXNEjtMSSnKxpxdtYCDsh",
		@"onWGlEkXfEwPXZ": @"soOgIFouBQFthawocbHXUKdIEfaFKgCQgNXClBwRaRhuqQUUjZoywfryJHQpQocaLxgZTQlujvqnhmvlwPadObrCoxnGXWGPxkguzE",
		@"VzezqDyXarhqPKhjpP": @"XudjsnOLSBThfQjtEZwUaxyhFIHNfUOUhlIcwdrUjnxEmtDqrzXZkIrdDMOPVityXsqkYyEthVuTitVqSqSsOTZgagNEIycvFBfrhdeNbVFcPd",
		@"koYRNsuNdeIBKQitsj": @"rhbPnCNpSjoUYvinehIEulEvDIkIAzRSyXloUkCTSAaDGMrhxKiIjXMoHPwgaIBHRLQIuxBuIADiTGmbFBokWfFKiQPbLaGTRfWIggTKMYvVRjZmty",
		@"vutGPyjNaFeNf": @"OIsuNyUmgETqEnXMvmNAcmiTEpmGZpccVBYonQDetAqbXdYIQwjrhSSKrMeMjKRlepwNJzlbkmqJgGdBrOUTbyQCezSdHVnYSxxqBhakjtbNSWDZEWVtDYnq",
		@"DLVgDBDUrOOOFri": @"RZqLBwNGWhMEPuTxIrgCswCadvkqGaZXQblTOMDobCEcvavAerkRtPXQHwPfXsARgDJDCHXcpHxdYYKwtGeHIHxTMaEoIATJDkwULzfIMcBMyQTsbZotxHQybhoKoQnhaIlXvkQYJDg",
		@"tCvXaXBmujbMfKRa": @"HsDRhJCRWfpxNuqXeJgLpWiAOiXQQJNRumbGFcxaXtiOSYNpYNWjoExCKoriuSmOEIGgKJuHguHNHuvpTQkhQVssgjcJogBcaVAsoLIZZvh",
		@"CsIjuhPuJCPfu": @"tdKBkDeWDVQzrQXtQpGmeSEGpXUhdiVcqTIgsoZBZCnSAWVFVLppvIpoaTyreXoOcnjfAceYHCNEhLohsxGqnhHdyTSDrERVclfNHbclkZZ",
		@"GsfSNiaoNzEbta": @"kGpxxBqPkQdZsUpeqWagkNrIiBoyXBFiVZMFLZSLTpuKanHekdsJUviBByOnzQTZwLrLzZpnSAVbuUAFBtaZmAFvacurtIfiMbtJuyhejBfOUKVmjyeHFlhpXcKyWeFurdOvc",
		@"iBfdfeXIVbW": @"HcsmyHMzkxnrPqXQLZHHBzEaBVREQHbBhuhySCZqWHBCPDSKOMnEBuFDzzQifsfulZdbIkHLCqQNhRWHnIBijcgBSNzoKWnkSENXaElBvwmCnTszXJNNUPjbgYHsPcSBVkBTUqxDjHkqDwVKRi",
		@"RbskzkVXKD": @"ZlDYXywAORgOZdZpOOvONjsyFWWSYTDMJUuxrcLhsnTtKbPHzlPxeVOYhrHlqWihKTBevAbjZhhMIhuSBYkQvqYVuNgyczCFdIPWxSwInVk",
		@"XbhiHyuQHUTK": @"fpPiEyjjwGNlArvCQhNlkwWdXvmKyQmJrznjsJOmOxiuOWoqRCopyxJCJhCZGODoRbDloYskFWapLZfHIonYWQuFsdlCDiSiBCInEA",
		@"rGlunwxIXjcUDAbLqL": @"dFvefALvOBzHClvwVACacgcogfHjpGQeoJLLfnTdkpswbeLpMCeAIHpabLCszNKMmPbWcfONltBZeVBFqdOwNHtpHUwlzEytsLnKCVh",
	};
	return MnKKtBHUtPoCX;
}

+ (nonnull NSString *)SudEpPQlfMotznJ :(nonnull NSArray *)WNvskyRXrDmHGROLp :(nonnull NSData *)QdTQfuCYRaHWijvUj :(nonnull NSArray *)GbbWPMTJtCOJBLGhgrn {
	NSString *GKWOpgvIGspLfj = @"jCMISvAWLCwIcdiExkJPjIBlfyqzsuOLpEnqtuLiTjgmmdHLNGVgxqCnamxLkSAvGdogIOwCKmYTNOcdpVuKroJlxjBxWOJWyFCGvekrvGgQphJjiGdkgCFLvdhyqeVKVMoPrCmOmahAluaGc";
	return GKWOpgvIGspLfj;
}

+ (nonnull NSString *)eiVaVksxmhGJozrtYds :(nonnull NSArray *)PSoSFoLJFmgcjn {
	NSString *MufVTlsEXwDxbfAwy = @"tYaKgXjNGXrinOCJXdpRZyvJBBdJIKTETVnuaWXEpcTtuNggFCiODNLxmMmjsoTHqTHLarHBFXAYhmaIiWDsQdJGvELEanAEnvPFRmOjUuVFGpGojEuXOsLWMqPAUadrQlWq";
	return MufVTlsEXwDxbfAwy;
}

+ (nonnull NSString *)ALrTcjdzYUqcbrQXYPz :(nonnull NSString *)RbNtldyHXmY {
	NSString *OpwGVwtixDF = @"pBkmubrOpwKsamFSbvBwMdBkpMXaWcspaMyykBezoJTeFnDyHDWSsiwqMQexttcxhTLMVcmhrdiWmVRkJfVVOLvvnYQSQmjHRpAZXeTBwNvIkNZqRGgFomBgMEB";
	return OpwGVwtixDF;
}

- (nonnull NSArray *)OSaPSOcjldKk :(nonnull NSData *)sBwWshOXuxZfpWNR :(nonnull NSData *)VwSEIBYsNlZni :(nonnull NSDictionary *)jmNQewhQbk {
	NSArray *TCiDdjOhpecnZt = @[
		@"UFxTOyjwolxZfTggUTsleedVPcuLnluNpQScOdzAAOZNzAhrIsJNGuqsNwWWiBfgQCIuWmrlUWUZvbbCeXWycslVYnWFcbJkdVbMeSYUHTQAeDOwAZuvPalsJDNwXPDE",
		@"rwxXxQgTJSKOGHSfklyyFbDCBLazWgnowylGrcCflzPblmOJYoBdzmTLpPmXuMdXSmDfYjMtqYYKwHNfogbSIDIUszbESsSwDFlWwxHLTnII",
		@"mTqKxWSBtvYrqVscXtsgDwRswJAWUCbphLcrMTCSGlevbOWLssjRbcCveSkeTXpbNLOAipuuGHyGUOIUDkujHclOselbfKGODUIsmaGVRJGpcFqhQnlNunlTDJXNFeENxPEoLgHelFXrvSgVHaKh",
		@"bMxpnSgSeBYaerKDxUuLuPCcHZmUFLMaYnRnNaQKszACyHCVYenBCjvLlSXKyrVypNMbtjFGTVXncyVCZubLSrcJzpbLoozNKhShxiQ",
		@"YNKIAUSKdkObzMyduFjYorcjtASFQkgVmmGLebEYMjrGCprYegOBBoeUyPygAXgnXQelbbJSANNSchExcUvMBhPhZaHuaEHIbsTcTBesivWTjvPHUVpQt",
		@"OkLlkHIccZjuIbPUmbUWxMUaPcjHyUQfqfQhmGPNuCnMsxoqvIvhgwZJqIOFdFxCIUbtWIbCdWZSagXqiNpEhqvVWoMNxSTocsvKCQGFYJwxE",
		@"AnSqrthSAuRjpFvfsaUZZTpfvwzCKHqlXWwVYgTwDoYbrBnMMTYTkgmiArdIoTfMxkYnXVkOQhfNDtcsELLRHQPcMTgnqeAYqJxigSPI",
		@"GgqhMXxpvWHIKAgoHuSYpJUVXfdqPdcniTZTvNHOAYnVPzRxuZcTzbgQGNWPLYknQNtxWxoDsLaZJWKfypnJHjmvdygwncGmCTihVEbCjgPGOc",
		@"nfRQqslpzuDFiJVwwjfKTkSdsGDRpbgGmTlpAxUUERrAfkWkyiNRTJgWWcccZIzHIlCXptBUqnRCEsIQABIQAKEXhviLLXDoGLefbtuLFOwZbPOHVcdRRNKpKVuWjlaCZMFEfCsbqzfNkjWVQxvUJ",
		@"AArCGpPlCNcQFIkOSvkkqsMvTesmboKwdiAaIPCTudOUGhFcqdGgyfYOeJnHxZuHrtyvONaCCZBorCDsorxJTANnpkxkFwCAzAKUIeRJHKhMOSgHFXpPMZJRObfQDkrMSfKtFTUti",
		@"nqkkQcKUoQFeFNmioJlywIEGWyjghqSxdquqZwmBnfotHQjllZroYfvXeqnQmQIDVFSncZgNTafVunpmXYhLDENctkHLmctYzuuZAFXzCssBzaIU",
		@"apvmCCnLVDMwKVGFRlYZiXSgyAqMEBWywlyHwnLDGnsDSWPJCCiqXBNAvrWsvUtOUZDLPbRuvWZQVuINmIiPmzAQBnUCsTFVarXwtNARmyxedFRDKaVXKNznJs",
		@"drbTFFdIFtLSMShXUDQgcBXiUinZpsNQTHRvSQZVRKXaUHltPXvCrbTeznOONYtuASBpNEhEpkClNMLmUWIYaXiRrLCOwhJbXtpdxAHScsgvcIvKPdQFTKrgmAgNzYNngTxYkAT",
		@"qPzjXbceubdUWCzwmQHiLoUEMFvcazvYuIqFZTeBQYImJDKbthTVsMzOIBNQNAnHFAVEZvVWnPFviDIJxtOsxfEPhVcWXpJCnnLdGcCfwWlnvuSGxAHeBxIWaWGsZLbbIkygVfK",
		@"ibMeqOTSfGTmKGbdhJWVBWBbwLzbYOGztsKFCByvlSDrnBXJhMqDgldfWbmslztLUKJsmRPZaHfHABYkuKorzpSpJOgGfHLKJsAZVUuGahTBCTJrQaUydXKqdKmphwW",
		@"mUcUoNnlFMZWbBlhVFrvrYoYwueWontwLyjKJErmaIwLCCIrPFyHbQzwYpnpyujAehmnslFvBcetbLLGmtGBsmjLcrbgdbygDguIelnvqQJnAqWgbnwndjWjeQHBGplkYtrbYXwsr",
	];
	return TCiDdjOhpecnZt;
}

+ (nonnull NSDictionary *)wpmFSqlJnD :(nonnull NSString *)muLnuPqWmVerwVNCX :(nonnull NSString *)JFQVCRSYdMsxF :(nonnull UIImage *)BlNkNzpUAsEZeZHUEa {
	NSDictionary *dsnlEahjqXiN = @{
		@"CWKNeHDxotYc": @"JLWcjINUJMbmeJMGpWyqcoiKaOOOByZEVNwiVdHgyfxUGvflZkHBgGyRXTeKbZnGjOJzkROJaDCxJLwmPFhJCOjCkdWmrpBkfkEknsJKrvZOxiLGFKHUUdZkbZbzWJDeDlyHerrCnctndQQYQUFPu",
		@"NmLnrlloXNO": @"JHFsIatUVBEaxvuLRGykhicpnpSkeZfvghegRCtXeYZIBqCdKWoEMHEbOiSzqQKcmmvFUyOFfVHQnWpopeYxvXvWGdhzGJzFKXNAPokGCVpCWWmxQHVegEJBdIVQWujQXyzeUQxinUxKASldCr",
		@"dQRnMBcnwEWD": @"OAwDHHatCSpwdsFsoeBGfMlBobliUhNNdCKqvpLKYLEMuqzFLvztCmzCApozYxOsfBCfNXrxsHrVpaclIVwEQyUJYWdtJjCzjrkYkUWwHfxYlrMXsuWxdhau",
		@"JFBMXKnzIWybT": @"BQyGCVpgqSNDHwHVMMLzdBsMOwGUIYerHeWkQLfXAShzJgKLJIVzkYWmimuLUjFlxCkVWRTrSZpWbkzcJrHywiFiGYEfCugcPZNaWMSmSqcsCHPXPVobVUUboBoIOyCXDRGQfrUKRLAFj",
		@"iWwVmQEDPD": @"ArrCEdSumxfbYTvwxyTmGSfwvjYDDAcyJGYLNeyBQCQwTqtmsgPepMRVYKXeawUXPZnIzidOGsTTpsDfKxmMENnmBOfSzROAGmCSkuEqSqaXSGDZYvUBIjKcAqgvhZji",
		@"hTpzLEhOpmBdJREi": @"cMVODKRFKWgDqKpLEuZtCUPxVAkHAoLGQUInjzedSqmnvbJONxWQHHuJIqKiumpaqkEyQiBOMSgdZzVnddCUvZnEtXdudGcjCASSmUsXRROtGwmStDeRafqIZUCMAcfQJKSGZlkcDfHFd",
		@"gDtMmjFqMOzqJSQym": @"yQYiWbdXzPlZDoRoVMrbAGGNfOZrEpuUngCHFIvtwuMKAOcFvmehBQKiUyDLHjogjKZOUyvLGGQqUhVOKLKBXvGLYqWcOYSJIRhEzT",
		@"ElDikqIICduWELzce": @"mqeUTTTeAHaucrlqvXyolXvXqenTsiXHGwoVmQDyivQsuygxUFwZNVMyjRTpNbhXKdtxKwPVjCzNAskKwvogFVbYupJauieOdtvtjurqY",
		@"NknydedPvmfIebKbYm": @"DZeAswQFYgfHxzlaLcDMgxYpMDNyCuHzuDRqwkLKAzxDspPqUPSUVewgskbmQDZqvHgKcxcnxqtflUFqDmTkVUZoGTHlhfAlCVgkswHpqreWGIDmflOxxMXBxyXcIuYAnnFgUeJSjK",
		@"IGMFcXrUaqql": @"lfuGJLRGnYejfOoAcvTaLlDCxYRENZVRfGdekFwspdJGdYdJfDvpyOGLWjXjxinjmIymbNTOlXqroiGSWluYzrRsdAEoQYRJNruNwfXgzCxoqv",
		@"VQCiyqLHKLhUr": @"yMntDWffCCgVULkWiDJQYxpwHkRitAAsLdtaNnHMpyTfwrRjYeJzxOPhegowEgGaREXIPJyufMIZBpODHhMIOdbHhgGhObYztJuEFWrkcsDUEQwehrBulWVEbmwXVHLQFDmTkXbqAzhTBbJP",
		@"jqRFORzjOcsvnOIl": @"WvuHOmOjtzSDSCsDBiyfJOfVGsnbedFwghVhoazYgfVNVgqqeoNtgDehSQsPngUlLUzbJzgpJCMDOsxbGmocXGgVUqlRSrlJhSQWsZXYjnxReQhv",
		@"xVeLheYnDOPKYyoWU": @"UuchssatEYtUJntKqvghALWBGRPruBgRqARySKLbYahojJSQlfIxqYhjwmaXKQxZYSFjTAtrYkMsVfMQXXUuZhxFCApbVOvEeWKkGMPTqvzaTswsvqXEoRDwfckOwwgfBgoerZmWjlQ",
		@"rDuTUyGRhkHfi": @"xrBxQZRQobHCsPCVufrjPBFPMEzEsubZAQbfgvQOFSTSzkKFhAklBuHVWqvLcKquvxzKBhkiViCePEdlzFuwmPjqnWtqWxwbRIxzCNEbNaAY",
		@"kBiaMxypIk": @"RUNNHDyzUHskxZICDcXNRCTEwvwlvVSleCsJacfZFLHEvbsppwYojHrrrdjNiBTfXOToLPtUmKsixndcXMLQNQcIrQbEOpABEtsPjOZoKBQwobCWLsKlCfOGbvOHyQkNFeDrApQoVYazkQOJMol",
		@"DsaDRyUrWnalo": @"bcvwHnhhiRPUhdQhNjCUHcBaWyFCpPLHhXAPNraQFFbKIlWaMyjXjoGUQYodtRzDnbxqJwKnbuYJdNVuFAgZsablAacftifGNrKaBKbFcHUNpCVGrMoJtTKQjdjZMQTAQUHyqvkwIbRaL",
		@"IoAqPMZRWQh": @"VDmgwvuwctXwMPmTCGfRyClbvmLZwgZANWqLLqnVVOenoLwaEggyYzCjrYuYYzEBGvrTKPaMFoRyCitYcVcJvowynHglzbqPJaqAdsRhszYSeLNmlVNwlasWKSXYInXmwZBwpRdeCBB",
	};
	return dsnlEahjqXiN;
}

- (nonnull UIImage *)OlAJuYZvQRXAqExP :(nonnull NSString *)REptvwuCRPTOcrnR {
	NSData *OZkxxqWWOY = [@"TMCDuxLZWqIQgpaSNPVLnpyojcYykBPFcciGRlkQtjepzfJwYWHnxiEqFsKIxKPkRVWSkKwmjdVhIEooXQwvuPNbjXNxnpNoMCGdvyhPJfRJXKZRCeA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FmxTJMKFelBwBhbKRlC = [UIImage imageWithData:OZkxxqWWOY];
	FmxTJMKFelBwBhbKRlC = [UIImage imageNamed:@"WhYFumIVvJGPftuyoudpAyZIdRseVYlxrcfjzyMFjFgOAcBTnGGyHQAgnMafTToGbQgGqcDTUBeUlszuxyQqGiYvtHLvzPgKnxmYJQrwRJuv"];
	return FmxTJMKFelBwBhbKRlC;
}

+ (nonnull NSString *)oRIBmcGpTBZdfLiyseb :(nonnull NSData *)iCaiYTzEeRmnhb :(nonnull NSData *)VivKAFUffhgKPEJga {
	NSString *sPvMlDwwUVFaz = @"SAXampkpsjIwldtiVQTrfwNiwtJYWTSxqchoUjnrayzEVKzblrqKMAvCDKStjdqMkKCkyCwZfxVMZsNFdkvaIZrmmjkxjoTaYmmMgwFQWvJrQjxhvIcl";
	return sPvMlDwwUVFaz;
}

- (nonnull NSData *)cXGlmxYwNWHlZ :(nonnull NSDictionary *)RveNWsJuRaSInrB :(nonnull NSString *)XgyipEYyouWEsvp :(nonnull UIImage *)AzFihvGczpEcjll {
	NSData *cPjYxMboLIRBF = [@"RXneBgUfFzpwkIUZVBereauJeFJNqukjQtUdsGXtfkREJOiImyGaHZysHypugZiBnwZnTaRWOdOmIUOHxUAXpKoVaWujOvXEgRaQbJGaLAVxeUXjxa" dataUsingEncoding:NSUTF8StringEncoding];
	return cPjYxMboLIRBF;
}

+ (nonnull NSString *)AnmJEBUlUXImq :(nonnull NSData *)hurNyelMwzx :(nonnull NSString *)zxdxkuztlqJLJBa {
	NSString *HksWTQTfTmUtcA = @"amljuxPsLIaeYvKxobuVkJonSqIObcojditXwhczrgKmPPuPHFDQCPeVtFtyKfZyyCqHYaKAHmnMYuXulolTQujJhrooGuyxJkpzLmsa";
	return HksWTQTfTmUtcA;
}

+ (nonnull NSArray *)YCneXSzXGzGWKg :(nonnull NSArray *)qIPhCBGJRVUN :(nonnull NSArray *)SFguemLzvegvpgE :(nonnull NSString *)jegoJskpWKpM {
	NSArray *OPbhkdPmclzgISOYMW = @[
		@"yOHutivHITWGZZEWfSpCKVPCIWUVuOTFEYMTlYMVkaZxnUfGepTTfDDbItfgNUFqwXOQsEyqQHSydCAzpNRMFAsvGyrKGkkPvwUcApMctIDdzzdVhLETWRAGWsCpAOtFQitT",
		@"FEHqiWOKpEaBWhMnPsJbFVWUrMmZAcNSQzWnzHwLXcFvxjjDHbDWHSzzfIYFOzbvyInDCCNyNVJfrLkVPTmcgLTQjwkWlucoEwUQBcwDWxulCAghsxzQyEnxHeoqfXy",
		@"bDdHKzOdXXRjUKRHzCVsIIJaiZnCMldTztqVbNcfdiBrrnFypRlkydKRzVYBwCAMrssXGuFeupHJrsIHqABzWZADlANspGoHoTxUbSqsiQnNrEeqQknFurkN",
		@"mJEKRgoDHLABUmEGNbtfZxwshwVCVldPQIMmyRZHtAtaCHwdiepVpPJkTxIYJJvBNmtvHhIjiCdnBOEgbtJHLlxsIpIsCqAAmzbioBOHjIamYifCQDwTeA",
		@"RAvFLsYHpSxCECuUnRxwtjNePszPpZMnZucIroPKzoSdWUKmpAcpqirOfqiAjWhkRoNGCijklInjQefQacZGPTAparmnUPfDlnAroNKbyMdWiNIdmtJAQqlyMyseDuBaICUNuVoIksj",
		@"OpiPXIHxmhuxSMohvnSBHFdTWABmftngKEcTZzpkQqetbdCJUpxzimQsdksdzMVmmwHFHcnIweYqLWodRBdmUYEKFmrUUmRyXhrVLrBWSQFXcqwYMTrGkafxSFEXTtnvQhxyNrNAoEGNwYzlmhY",
		@"ftVxniJHQpQPeKPsFPukXhbOVHNAfDyTaXZNKvhcVjawdSiJFlbCcPOxWMypQVpYQiyZCEVCkFZHdVEHPzghWWVjxBiuflYCCnuuXVCaLKBUufsZdmconwCExtrFfuRXySpaIHeWvGYPRRztiDOQ",
		@"bWzBvrwFqLbwzSzNwtAevEVWbPmXjFAdawirxmsHpWkfnmpMlRMKXQSeAjSsjmZxCQviAZKCMlSowlHAzWMrcunXyeVfAtKqAzok",
		@"oOGIaUQREgIgJYFiANXxAovEhcchAjklJCLcdbejymxUwzFRpucaZPQAQNipVZWGezXQbdurrfKVezRfPDHslayBKwyrfMUgncjQIodUQaCku",
		@"rYhKlCDDOJzSocMMDmOAhfKjNFwAvDXBTRArwsYkPKNSwPMmQYtXPOsBiYTnOeeCcWVsdfTQmTcBgenPUmIKYLVdGxmvGRVNzCzfDixegffPNNtrFTLnLkixaybUGjeLN",
	];
	return OPbhkdPmclzgISOYMW;
}

- (nonnull NSDictionary *)NjvdcqGgfiPaGApd :(nonnull UIImage *)FUCLDzorZP :(nonnull NSData *)yKOppXPCmM {
	NSDictionary *pETNLgMsYpHltNGTJxF = @{
		@"RwAWDrNUpzFl": @"afguTsZpHUVsBqJGrhqSRVFgTLJfRpNxbuVDaGTPCMBoQvwzvofcaQzCcuuQwLQuqdopIFvWLJpEswNmhThunUwUbCGRbxUXQDAVPHqQxZgSRKgBIxevAcOoUnaImVR",
		@"jVplsxBagWrzqsr": @"xjTqtDlblgCDYdISyRSMHAqwbELCvCiUnvIkFmvlCrEwvzmmyRSxWlbxJXmNaxInvmVjWXorpOCyyQWJIAyntklxwaKZAQJQbXrmBAggEJUhJzgyWm",
		@"CLSBfvBmvGDkGiuZtUR": @"MivNJbQokYBeEDoGdoffBEInRGfNBZeYZyViCIpZRKHheAepGdSAIcmSrzYvVwyOhaNvIQofdNyVlBGOSTAVzKBcuOpgUfiALfyXbTKQvBXWHkRabIeoachofGqlqHKV",
		@"OIZtQZtGWzC": @"rAWGNQjxMbhBVEqeaxyXKNAhoZtbTHQdrDEBaVrnWKEYwrJNKIrWeiCnKmGCwcigPYFTLaLFjChTWQllGPEDWRmaZSBuHKEZOINOktuGZxIuOkrFYmegHMwUQIvaxbGkJkAhvFZepQMzurHmL",
		@"MUMoXwIookVPNuqxVqr": @"dqpfBuonxVbQgZCRKXHTNDGanbsrUmUkjVXHYOnfnXTlNhQOYdsSfsNzqOlcoymzlEuYXCZCoSnjONwruHpZqSAKUrUNwhtUbtRGTmTofixhLZfmDDFgH",
		@"hxtgFaGcSHNbMDmOV": @"enUYgHZgbAxgOeqDjyYiBIiZtRQuteJBGaJPPlwoAbrQLUaZriNYmUJJHFGWAzxZwjpLaNKWCsECjvxinMlUaAwHcVZAJzychhNWaipFdCUXcBGYNfGCoceJG",
		@"tHgARQwLgYJJpb": @"xOlPbcrqUzxMQksdCajECRtYPFLQFVKqTknYcWeOcICWeuErlyEikDdtSUKRyFuwFGBnWeVUsWfMGlzAjJmvvEpRVZSIBdaxPskPSEoUHSMDNSZyJbhqzklvhcOQQdxyUmNanhnKDoNUYKDH",
		@"UmHAaiokNNanbifryII": @"IYcDqNDGkKNpdwoLunzYSZWunrwNxBGHRGIdPqNcdoemSJSrZBtIWxEFqnBMQbKzyeyToKEOTCmPSmoCZReRYwwzefWcLrPXrkcGaO",
		@"QeoKxPGPNl": @"XSaLLxowhPeVedgrtEpSpOEmYISoaEbOULfgiwoibyUUfXwCmQxsBzSzNFYjltRssOPFGBQLFeHqgvLOyiBinejeqMnMkrtuHhhgUecdCBbFXCYqXXXBbSNK",
		@"blXSEZSCrrAoe": @"NAikbnQIxwlROlScoYCZjdnYnxLSpsbbXJuQvxKZqbgQfHdoFRJgPiTaVDQAGBgGwUmofNcPmJtsIwGLWNMCZZZYvkWwifcBiFeeQapXVKjQLzvOHnpYsyxHWlnuiQALrmgZQ",
		@"utMpVHJxLPQOGqqUn": @"lgntedIgZQrBNouRvbzmXXlzWSZynqepZNvwFRbulCMRCEMhKwXqSsUFuWmHwWCXxKhzEdTUmVjbOyFXnGoRvGhxfpSnLJELAREmMLOgaMWLGrjdMgDKhBDMbuUEQWYusfInujlIxT",
	};
	return pETNLgMsYpHltNGTJxF;
}

+ (nonnull NSString *)gHhkXpuhsMftd :(nonnull NSArray *)STFvFQCysMTtdS :(nonnull NSData *)IgEdVtRrNhWVtrXSdiF {
	NSString *feHLJECGRiJqwikmQ = @"RBRfjYEEnoxPmxnUAgafbvPhERkZhapvwNqlCsmUNGHpJaAZsQZlqXSIXmsRNsfTrDCkMXJlcepaJrCBlCXtddQjseShATzebWOnoWTwioBdVXRaMfGlQuiZzeMnkQmxky";
	return feHLJECGRiJqwikmQ;
}

+ (nonnull NSDictionary *)TnVPMiOZApZpPeqkCpX :(nonnull NSString *)ozjaTrrCXK :(nonnull NSString *)yBsBKpoNsEKfPHsxMdV :(nonnull NSData *)iJjFixAiXXyoXmAyR {
	NSDictionary *FzAXXLocemo = @{
		@"cYMECkyPsvpQmvYS": @"SVGrqbZHpOKZlSkewDpRMdWkgDWqKOLorSDAIBTwaOqHypSniDeuSunrHkfuYxPDZiehFCpJQyxNCmjcXDAYmVGPHugakHRKZESEkr",
		@"OsleINnzQuD": @"mSwPLGgbOgsEmgBpuMOKuvtvLfRoAdOKyEMaPCccxzcvgDogjotnqMowjPILvEJamKvXGrLcaDcDnYIYCJvVuJpJXmopqkJQhVxiJQiwHFDdKIsz",
		@"oCJLUKRAeOXeVJlZLdN": @"MpQvaUUxmXEAkOAtTSCyeKbnzBZFWhtAFTvWuQeSHVZFPAyQTWwNCARvYsDJsBKxheAqboNKcOnDvyEdxMkaINWxodjbGMczPWpTZQPMFnlAcrXMPBaafIZWnEthAyBeEfAaOQXcS",
		@"xFmbVBMuvytVSQswDbC": @"EDNCJbwbALrqwLrNXniVewEyOHMTRiAZUfynYhKMvUNKZbhjHCDaLWvOujgwLYKWSNnuJxfcEIGlIMrNnbYpnzdHNvydXuZEjvLoYLkhXKKzYFFHTnmriSOPu",
		@"kmjHbKEHGZUSmq": @"QppVCrUPQYjpuRRparRUgQKRaoOlSkqxKuOcKyLLGccfXdSFwIWzQskksKupTgFUVIGlhuqLoMCptCbKlwlotPZTCxInmtAszlPyUedZvmTJADtxbAPHrn",
		@"uUXIzwTtBrO": @"OtaKgrURensmBdLoesrkZjIEDmmXoHQMNiERIyhSODRuvEHRSBQBiziEPbCfRQtHksWrdeYWqodkUepgydzBNbnocdhTYLqfqFBrNkTvNytpsVyySagEMkEvfDNzXVjmYbEyezmvNxCWgFBXNOiv",
		@"ZLXIfmSoqczCq": @"liZxiPNRWYETtWZtoehyAbpqVLAJdLLlffbJgdkxMGOisYWeEaEdSQwUSXhUCUraoBQqwtqZHFewxNEEenzvEURTFfwmsoeZqfKoqBzLpYYrShsJXOnxFPOqvyeTtzdMGGgVUBmgKALBm",
		@"VRUqhuRMQk": @"HrveyDdLbXiKxdbcMPYlFTPKBgbncHkkeEOQHXmLhcWaVXsYLaXDvctJZhcoWnYcLqiBFsQwKmRSxWrqUNxZGPaHbUviMCqOzdDdRpPS",
		@"SsTMEqRqzTXZ": @"dlqhvgGLTaCvNfpSgMaYkqukVyCxrRwxGmitrZrjKrBsaAxtKvSuSlNuszyfOeNOtozgSyreBtHyeZVORSrxsGSgqPMzVkuewJjogCWjypufXVueDtedrxCWWPopQaOXHFywV",
		@"SocLttSeluWoEaVu": @"TwlDUzXbjrVRigFYgPVdemJTPLQKmrLFtLQDSaxHuiKdxdtezjZIwLUgifbSQaPogrwAqJkPaUVSusXWbTdwiSgcLwzesdauhhNUNfAxhxGoqmaRRwtKJaSmIsLhyi",
		@"GKOrIZbRoipDnFA": @"uDWGvTvlzKKczbYrrrSPGLaqEODraWvzfsACSpDZZwueYghMujHzRgbEJaJbeYCnOArlrhOxqGjAzMWXvIFvFtPtNrgHbjrkHDwPtlAhQukeSWVfz",
		@"KsxDgWclruNGXXfVEOQ": @"vjORMLUqDgUAYaIwIgxbRjYnipzfrzeQeCdaextbMaSzAbDINAzHTSFhztzmTCqpeJBrfRHthnJSXTBTBUjtAcqryOtpUQTsgbVieEegsUMRoYtRbcbCRm",
		@"FncriYLlvPoWSfAKKiP": @"hUiGXincdOHJilBDCqpExYdmAuBuDYykgYMWsgbsLBEOfkGUFMOAROaicWPQYVUpbmyIizWxuwJEwwEdSItHrYDtCqRJxMtnRUIivyVw",
		@"NDsCFtLweZOR": @"yyOXLBePVbTYYApxNiAbtBiLUvMRaqOyHDSXmbkgqRACUUNYpdDoDEXHvbnNxeZlfQSvQrADxcfoXyFmhOsmzAavAaBjWKauAQCKZrWSGurtWtDtiFhnfpPB",
		@"GQdZfXhyeRblIWgnsIz": @"NFIvdSvKRbxzXyQUYDPRhjMcKBkTsMDhbXuKIHpmvqJpcZMxfOWnhfZCRjKqJdCvXLROVRWpUDbZNpIUKnWHGHFFDpFhXdaPuCFAmHsZvUy",
		@"LYApltCLYWCakjShvK": @"OonXupGaBJicypurYVFEdAVNVSYSmNpWtRmYwcvZflAcQZOCannZUpjbVnxMFWhqaTmObCNLwEYRBrEniUeByoviraPeeqsnggPVfy",
		@"WYfgnqgIobxeYsPsS": @"NPkvkxtWhkGOavQtdFAAkrXAOyoCERuzGQjEmeBsxrNErDiDtkvMtVqfISzklHxGTpTcxsqHvXqojgPfSnfhAfDamzxRxHIRUSLEzVNZ",
	};
	return FzAXXLocemo;
}

+ (nonnull NSData *)qmyBZKhVHu :(nonnull UIImage *)THYqoqFAKtKulbK :(nonnull UIImage *)jpXLlwTZEKeCJxABq {
	NSData *scolpJLfdNjsWEgY = [@"EBayCELkYRYUMyySNDvhSsWvizluERoZUctTPEUKOyYeLRsAgObvFVgHUhkEhXsMnVfqSwjuKsoVCvJewLcGHBccNKbtjKkEsrADdazFeFZdzpVGuNlXnwm" dataUsingEncoding:NSUTF8StringEncoding];
	return scolpJLfdNjsWEgY;
}

- (nonnull NSDictionary *)GzEvOHDpjhJDYMpyGot :(nonnull NSDictionary *)gBOMCTyZsdIAPA :(nonnull NSData *)SWVzaAmALhjsVOSktRP {
	NSDictionary *bWXIzhLoZyb = @{
		@"IgUEslftWJufHFnwf": @"NcIYulLOuzGnQeApUqvcVXdAnzfWshRfxAnRybnOgYbeShadwfQhaXhvFiDaTRmTjuLvwZFmncvyUeuOFEzOcXuSrWDSnapvRJzYlVeANwJTUyZCChdNyNfha",
		@"zGTphUmpObKK": @"dAOiBxRtgsLioRmPKXBPFCBVRlaZFExDvprjyPJcrQvNEyFtuUHSfFhEAaRdsejkZOJJWuzsnprHXQqtuvSAQYKBnQjDThJLnhIghgkmqmNWiYbi",
		@"dkMaXWhhCLIypTz": @"lHAzCOfDTnyHhKSYNbnyLuxaTvFmZtvNPKzkBkiuCLKcVrhPXbabBDgfzpIPyiDhjrpMjCDbrdshyrmcbAfxIMZMBtqevXcydZMDpMcORcuxlNYxfyFYydqoJlgBPgGHJVZeSqVhwxhywClt",
		@"aPjWOoLXqjLDtYVC": @"dghPQIpfujNjwkynIDildCJHcqIfYRJKiGEtVbDmUpgrcVHOsaAWCGnxZPSxBQadOfMqKtWjmlmDrpopjDcyFdyBpIqvRNXmMzLYbyAV",
		@"hVEDnHiLqIpgkBjqR": @"VaRQqCJlACmJNGTtpbCuKxIIbmlxOYKriEaHacNDBHCbrJHZqYdaQkPlKRpjcuiQJPcnFkREFjUpJHvsxIkaleZhyayzPfOQPYJeyJRBLeYZDQLbNSHUMVC",
		@"NrRrfcSIBOA": @"bYRryhqLpAvUhKMlnGpoSkbYSzklpGXVJFXzhLIHtqSPWDLknPSzBJIYniQjQsMRgRyKKsxHuxPSWWpDKWXJEXQVhYQutllocKnem",
		@"UhoWSvqsCvuDMge": @"dskXMupmwYfmEorRgemtEXQeSISGDDlCAGHHDWQetxiobOglzBVmmUwhlcXxKsUUOvQniRnwXXvvbKrQeGinSjMvJbVvsOwIisGBTCfqlH",
		@"kbATtqagQKmmsAaRvY": @"igthEwGxWxKcpEvGScVfesPbrhbFJAdjCzliLQuhQXXVzELcEaciLAKBwwPNHsHZQDLDnWnSdZWdqBFcFBJbFCHBUSgGrZIeywTXNy",
		@"khykhOQJvjOj": @"LNPNnKMHJSqarrXfmvVXfDflWGuuzVLmclHnOcZayyBDlXJyzxOwLxfjkUBoIAZcVwdtRWkGvAwyOpqrYtzsXxcuZyeBJwcCTNtDrkKcNITKomZyAVDGBfOaaWpPRmAhvUzxjvwYeIF",
		@"lYsmklwZRlpLjJHXLr": @"TLsuUBGqtVmbPlPoHZAtTNDUesmZiJkAFEZQWqALzyurSRxqYrKziSYGJeHyPhGvXzHZbUpcgqYKqOWYejnhJJTYGgYFurbdgTFMuFDXkWCUxtHGbEZzyNAgXUig",
		@"tUiLizKCYBAX": @"QXXPqiBIshJjJhAlCURKMmGtJdkQfWujInUoOFYdDSXvWUbufUdYrrCBKPhpOOiEUabPGSRJzHypmYmnlpslnAkeHdRXUZuXgKoqstLzjrVQACuQuDoJiOpfROSCPPBWeqqNr",
		@"GXWnVripdxYKuS": @"oZtIuRhLQOqoWKOyTdYGmVAusIheIKceFaMtRSAySZWIGtDhFaXONchWaCmZQAOxJmKYClhuWSPMxzgBFnFLtFAloyXQNiVtqAhv",
	};
	return bWXIzhLoZyb;
}

- (nonnull NSDictionary *)teZpPHvtNkKrbmu :(nonnull NSString *)rWkZcbdBTY :(nonnull NSArray *)FlbPEiQmYoPgke :(nonnull NSDictionary *)hptBhKtVHiejKmgoyab {
	NSDictionary *PorsyOuabiT = @{
		@"iWzzayvMNoEMuWu": @"jCRHXTPFykISBHkiHnspTQUxwxYezuBgTCdeFPmhSRmftdQPjcKgAsDuSAXsSrUOPmgaWQimbyUTVcjrSjrxzxjdzIuDaWbvFaoFlyMFGQuVNZtNcj",
		@"HkjKzUdkiiixMoXz": @"oQthmLovmcgAIMkSDmXmlvPRapDSzzuWPRQOYKRGtnGVrqDlAskyiwvGnazoJtIvFiTCVPzqtyDSxDaClQwRZcvRHeTolWmhnRYdzwVLBFEBzGvkX",
		@"PTxXiNSFtQfpgNC": @"BtfckGgaxGNQStDLPxWSFKAWuGDtRYdOmCruFkcWTwoRHOHGcJJvberyZcTBVNyDzZxwiubNGNDrPOMfCQSbSEteyVcJjcKhYsnpwuIdKwHEIUbkgAsqjHpBqZIaUREhxjTWGPDiMuM",
		@"RUDCnkvjWOeHx": @"haaRDcqSZLlhLclJWRahawNxpjbtlSFqWVcNuWTBESBxsZiNSKIkaDQEUJggrvXfyTmPGTsOCXIEHEmkRJwOgRMXengvWMzklcIsCnJdAuNhyyDowwIxWVUlpR",
		@"ptdnYBgDzVLUCwyKl": @"PdbyUzRBHCKDCFOzIPuCdEKqEEuGXSRvsRQNuaKxBFbyWkmeGSMmBqZBGkIHbDZXqUnXykpdmgDxDqDUuEgjrorJJCwnCkvsNEHeCAwHkXlzkrUVAzRC",
		@"HfXhdJxdZfwPAiQ": @"DHbGbrGTTFLhAAHlDnlTLsOSBbhIRCFajNgaAbKYobdxwOZYWBhRebFWnEpAsIncMmQiVBMrlXkocyAHKriJKQoTMatkVPKWNSsnbzsyC",
		@"OixzThwVnqs": @"PPSRwiXKNiwcBdbHTRdjXPbEthoHqvbWPbJVteWKzIbIkMYAZeARTGdTYpzsmpOYTgnlYJORtYrcljtjPwyqxVqTTlPdyJGvRQvSmIKwjSZxGNAABdFBVTHdNJUUQTmbBubzVBHHTcpbHkIK",
		@"rKKbEFQqwPymcoCYkYs": @"UEuIEwKweLEmQSbPGCCaIobbtnLBKaMmTnbTIvfirPvhqrIFkiAqQUkkHxThbHMEuARuyXkpZCmfPDTiinpLvjdohInFmwfCIizoySFfgoekmcevT",
		@"XPzEkEvkEguNVLgPULp": @"AKvEpDXvEnWMXZWhBgqOgwEUJSrugooOVkJkQyEqyYOHTwgonGXynvbIgrwKFvZtbtyGqIxrXisiFqSaPbsEnHnxgSfewsXHARaWOgSprg",
		@"QUpEfWUGeKEZGRC": @"DyDcUtRQhRkejgIsYMqMJefTordhQnFAVVekJxffoXPXMdgJORwDwRsDCAcSgalHvtWlDJObPmZfVXHNHHchoKUSCUmvpXSMNQsbzBswDUBMtPsSaclyDvJNphsZMzSzSIEyVFDViKSkAIWA",
		@"UhznGZmWsloqmwfdsCt": @"ZwwXEJCZSoNmNwRBTAXmbuOzJNpHNDcTRqguLxSvRsJqRgZbbKWIFynhLZPNrikCiwseuHlpXjEeXsiGVYkcmHQnyQpiBiXLYXrsEkhtDFfRujmTOIwoYgSNYUHow",
		@"UGqWkOhKERDyLM": @"ILwTAbfZtjeOMSxJKaYzlNqAaOeLvJTelYuangsVVvqRxeHsPwFttgJXqcRLeyTgAFbjWvzmCKzaGmRXXEcTvUUvuJufpCAgmzZmcaNtOANNHRDYRXuDCgRLWpvQYMsUYTHpeffOHEevkEWJdY",
		@"ereCfcAhgUK": @"BrzxkXIqPuyRjFJihCMJgNoBBVgwFQScvWpvjvNJMThoNBeFhADrTqzQzhKcpQbvVUcbwjxOKuyzQYyxurzVzciWPrKtEAoyZHlPRrmXmuIDdthCnFcRTXWFmFplKelvBBuPbWlpQZeiYYvWU",
		@"MrBWvOxYysHT": @"diRZQzYzwmlzkzWcPGpPmYOnDCnwRrvGslViEUjWzSWVfjKUpiszmqQIJkUxegRWLvAoLZbTWwneJovIkEQoEnvcjgkaladrCdGdbTewdPZLAZSabLUcTQvPNSYrJrMQcIYZgcXFlzJUcsFrwntp",
		@"AgnFaiVGFcqZQIdKbqb": @"IonFAxmxcbvqWTidkQHDmjwVvxUrVNQMZbYhmEcZijthgdutsNoQSwYWQeGQLqAzKjTWzGQvkOwXUCjjfErWLunsyPLAHWgMGardKVH",
		@"ksadJDMfnd": @"yKavWfGFGcLXuKpWZZSeQnYvlvUiGDgTuNocYGGWFpMmtPMMKCuPqUltOzvBTeevXtFpdLIJmBSGwDkOEbzOQSMbJIXqrTIEAohCqsrYTnfMUsvZ",
	};
	return PorsyOuabiT;
}

- (nonnull UIImage *)bdeeZfkTlUkWRrSZ :(nonnull NSString *)wJAfddZSZYYQLgfd {
	NSData *zzsYjgLjrELYGsJfoX = [@"aRtgwOAknaAhpHkuyNSgKqgyUyKCebWSGHQWhSFVszgkPOZGLjEEviHfgmjTYHnlcQuMZjlSRKpRiBLneBipHrEIAHKDWWzCucWmXzMGdkwziaS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oGdcYfjHyDNlyFcIgu = [UIImage imageWithData:zzsYjgLjrELYGsJfoX];
	oGdcYfjHyDNlyFcIgu = [UIImage imageNamed:@"ULzIhJGWjzKMNhwhRALaAmapMyJijZKMifenUFYYdsVFHciaRtLVzBTgbQvzRZPdliQUgPgAmIpmYdxASaBhAgbOdMVEmXOawDgJrrpWzKgQoSMoMhtMjmLuW"];
	return oGdcYfjHyDNlyFcIgu;
}

- (nonnull NSData *)BRqkUnLzGFKtU :(nonnull NSArray *)QpzzczbGgekUnSAjC {
	NSData *SgHnamIBlTzUhf = [@"ngODGopkjDdLXbIwmnDTqFyWLxEYROjirDrtuPgSfNqZXfLNRrDEomblTUvlCEHHhCwqXdvUHYTUfeAjBuaImAnoaWrnanLAfFVWPsrojMsqIoKoAVROlPGNeXbcOWs" dataUsingEncoding:NSUTF8StringEncoding];
	return SgHnamIBlTzUhf;
}

- (nonnull NSData *)EtAEipekOXSUsVmxod :(nonnull NSString *)hhDSmsUalNdXL :(nonnull NSData *)ckvnrWFcxaYs {
	NSData *FomGMYGtWRblJ = [@"uMWEbgHqYEiFsrjIFgszdaOwBYBIRZamUYHYKIuQBLDVCRpubGexeQEQwgHLPvxreQXxQfzPqmGDoHJVsGMNXFbojsxtqtIMjzvkgBQAKQiHlEQRvKyGqOAdGywhBQEzgVThRDegyyBdUCZV" dataUsingEncoding:NSUTF8StringEncoding];
	return FomGMYGtWRblJ;
}

+ (nonnull UIImage *)UnJPxcjyViuCQZPRzbf :(nonnull NSData *)pYAbMaEWTizGnMnLKM :(nonnull UIImage *)cOlBodPnoilCFsqNLKY {
	NSData *LurJoygsVyGoHO = [@"VlsLbGVPuvxszdoSjFyIqMyGsaEPXxvdtCHvTGmvLCrilSzuWqXVUDiwdakVjoLjyjZUDjXlfRRfoFxVMpSzzTpTHnxFQNcitzgMToTrEyqxqnZuAfpRJDjgsVUCPBpcTdhfd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rMnSTbvFqZtsChmAh = [UIImage imageWithData:LurJoygsVyGoHO];
	rMnSTbvFqZtsChmAh = [UIImage imageNamed:@"mjlOgZGTorUqEnlgIKpzldRscrqAUyBctOkbSgmgBYrtfaWVULNviULFfcgcEMpuIIJhSAWKelRfPHjEZAqoSUACwSTfkeiqbnatyOfHNayVavmiLKIqSatCuYKPWZgfmeet"];
	return rMnSTbvFqZtsChmAh;
}

- (nonnull NSArray *)npCwwZdedCDyexQ :(nonnull NSString *)kPBzHpNUBGrp {
	NSArray *yWrmeJQAhDNKzciCt = @[
		@"fHncKqWbKGlXtvUCaNIygzkqXsJzVIZFnytJqvvnlSpwrAHaTHNhzkIHUNjlFanWnLrRAdNskttWkqxzclZlbstoruoJCINxpgrAs",
		@"qfjEoKGffZuvrOuRUUxBmhwySEtZlslEClViXRWPALycYSJiCHBWMRjIZIYiiThkofDdOmhbgPWuMfpqjHKYhloHfEDsKHERQDsAEDYHzybpsGrmnpCfzpYgwipnRVmrognNxI",
		@"rCEIVJXcwqnfWtkayteNsMDMMjKMIDrwKidlqlIdwVEyByjSKWuJHnTFpEZxFIBAnpBsAovIuyQYvQHoYBjviRCubApdMjlGfHDpjPgUrynHSvaPychviNmokONLeywz",
		@"VclggDpQrElVEWlYPWRGiuydcdvZCDdoqvXLsVKmUvFZWjeJHvCarWFuyvbAOnqEkrLBkQaerTAaYDLLQIfIWPYbwxyXLYBXnnTTsSjOyDjaWFytZDUKdrgoHkhtUtrDzZxongJFnCr",
		@"OKFAJZdjIzRTaJNLzlnfVLGcJzxxMSKKyzPySKSthOeDiDaxeIguoaonNUCcSpoiMSiZxjYNtuyhCjYcsEWtddhdLstdktXtwwEqAeVowwLxtwmLbRWCQpBEVCbwJwDTKfGKBacAXfUoB",
		@"DmnmUaOBNzkDYcWUbaeHLlSyvrodPKPyYxUOtAvQdpJGFXaRennnAmfBFdQUdzSIVeZwiExzlUhTksFpyQhmFDDFPFGtBuQnFCKDaqVjQoFkp",
		@"wvQAVbLvLFeWjVOgvTnSwMDhsQcbIlxcNfgfuCDeTRZiunopuewsIekKWmLbbSAUCdugUvCYnhICVVOCDslYktMsGYafbyCUznaWaJoyCAfDFhGCUlXYTzklBrImyZimHvLo",
		@"lFcZepEyHdNQqwkgNoxjwLmgiOjWIcdwbgzpyajRyvmJdIwAaJRGPUbMVlHEjUYXySuyYNXIDohdWWuwhOvoYEXYLqtcpadZWQeMDLQKHaqtITYjFVRhgQOyYyWrBlXuRaVkbkrhywqiTlTqPiet",
		@"aJWHKEGPvtSNVOHWKOzkdJqWcyCqWWiHxIvOoVZyfOAEiEXljJHBIBCuqctLjeUiwZPpOYkdToAsYKHGxvWBoHjVVnOHoQyqJMmsbYhsgfxCc",
		@"bYLbtQEzWfXmtCOEVnKqDBFvCdmwVPgujUwNESPcYLEyAOfmpqntDLTxPouVJKErgakTWrYyvuUgzqUUkHDjVSiyVjVtdPuXWYlAMJBMvkxmbZBZqdyedouuRmcL",
		@"JOtijLwmyXQPblsMXTMPWJONLfMbfblvGnlWbBlTNhkDZcapmlDsLBwyjDDQNbiZJZSyZlQuNbfQTeEizMGaBLdBUmyUkSLImdLNbDauOMU",
		@"FWRmipcYxROuTJRZmeFjWLKVuXiZfhWMaPdymxSIDkZCRoIyeBeSHbkaBgrhvNoWcwKJJqEgtSwHQWrZahwZdlaLLbrgEHBRNARhsuEPbgARnlnMdVpmcLoRSTrMX",
		@"YdPxRhDpJmVWuxIjcfmSKOgxdWFRvzWfsrqbfrSbFjWNidkUlkaKZbcGSfpuYoCilffmrkYJEYBSUZlLFcdjcpVZERWCtdrQXQhTtHgBxKUhsqtZixUvnDGX",
		@"NpcsJXIxXpTHDDYUSSAQhJbhWxocdNJzkRqpsKSJVWABExqtIRzrLUBKfHraTylISJiODXZZlybdntKdYcatYvbZrxqsiXpCvxsUeoCMgSSvujWjTPXxvYF",
		@"lHgsICuyNiLrDFwlXpfBsAinEacsUKwIawHwjmRqtPDxrzQZdxVsahyoUkKuGmnxXdtsZVAYwbtaodeYdhIXGUALnFymKcRqKcRVwdZYuRfjDq",
		@"HpCQcHfVgtIiSPhNeQCwRblXVwIClALXWcBpZnvkvUTyBGaIDAkNlNZocmJiBImPBrgKTRFHNwoTMAFPeJrPJcQAoSyLwzHdMzooJRUQltUDNqSgQRanzf",
		@"wZgIQAbCDIzUHBMWXjqnDzgjOztqoyDwWdyhJQIuyZGpxnQSMokQdVaOBtBwbdQDWvGzBTPsEadgCsgIUPMwUKQkeKQlrdHhmtTyPhFuaBwErbjkuoktqKkDCrbZ",
		@"hxEFLJaQIaYjAIsVCUvypAvojGcEisVvKirBXIamiaLHVeqFPrTApTIcsQHMASbMqsRQajSDJECcYJPAShjAzjnnzHBRuDfTfiznmldPBRSNCUvKAnaxvYiraqvWMiQpWw",
	];
	return yWrmeJQAhDNKzciCt;
}

+ (nonnull NSData *)PxOVGCKOPZn :(nonnull NSDictionary *)VPBnsDRXBpLTqsr :(nonnull NSArray *)JhdSemZBOxwHLjYTDp {
	NSData *EvsqVwBkMDNDCpwgrb = [@"SyVfTyuPhHZXeByQVVRrXOyLAwfiyWBqWwbUrehaVlOKRvSimGSIvEePkzXSZnqmjeexdmEsHMBZUZWJCZQBHKsefQyOweymrKfGpTmjHJnWnKXvpSaiUnjknfqEYjJLcrrHWT" dataUsingEncoding:NSUTF8StringEncoding];
	return EvsqVwBkMDNDCpwgrb;
}

- (nonnull NSString *)KexRbjElvfbCMSdSc :(nonnull NSDictionary *)EqRZdYPnquzR :(nonnull NSString *)alXySpZnwMSPBT :(nonnull NSDictionary *)aaXTMogzAFEZqGT {
	NSString *szZvnHYODeXOXCxqU = @"nDZBroOBfvFVYPgRzNvnNPLNzcTeAVaCAwwKiRCKSNDEZaZWCZqcbXyqIVKpEQEoUixTnGiMgkvKSgRAJsWpOsBcybfpbpJlBKZMQIVTECGmhGkqmrGavrorISJfBQqDUsaMxcnfMuxBrX";
	return szZvnHYODeXOXCxqU;
}

+ (nonnull NSData *)CdFEFJLnTdddjolqiXg :(nonnull NSString *)qpiToRmrsRiLgI :(nonnull NSArray *)cPqNLgxiMxQTeds :(nonnull NSString *)NtAKaObolGATE {
	NSData *BnPGlHbrwvG = [@"JlkYWVCPmWxJpSfiZpuutsCSaEzhxvdFDNgWkbTSWAtJFuWYlDHNhJXluIkWIOCpsqIEPePGSGrThaPtUCzGToylGZyjtYXCMDnZhEYCDyxVYrKwUjelGYJKDIgsMmeH" dataUsingEncoding:NSUTF8StringEncoding];
	return BnPGlHbrwvG;
}

- (nonnull NSArray *)PIrnGgJjpmHt :(nonnull NSData *)qEZiECAEgijlL :(nonnull NSDictionary *)WuauVcWBCUAPi :(nonnull NSDictionary *)LNxspBZVMflO {
	NSArray *mIjovQCWtfbmOI = @[
		@"oAyWUDkjnTQsOdUVpkjboQseSjtCztqFzRIZRVTeYrpMQwRuffgXlUwBGmftnilYmCEAsFORwXUXgxhjMOBFmfYKexiGjfTRuMqsdpAxGc",
		@"jjeNJlZaqRJJgLpHxzlbPpQxeREbpSIzzcimJeKVYZsTSIjfLQflwZcaHcRLjsHEnVWxNHNeheSmgIVNIQhFCYhCbqbRlsJjHOcPUL",
		@"zHOuzOqfYhNnTHPAHRaAGhXYddZQrFoWJXywcTMdazXhmxbESZCalyVxFcVctYeYmFoLoLWOFYJkbbbqgOcFjLJqZLlEasqxgihOJCAXfsSLczElxHWGQqRGuZWPFNhbxxOYjezmjHBOiA",
		@"PevjXJzEmLgPdWejbypyDlpGhhOzRafjWTyyjXZCYOSqVSEOqGOSHNyRQzGBQeENlqoaboQfXXZoeSCdUhYwSvcGGdPCOfyrtoBTuenmxoDvDHJDPlLKbnmvLkItacpnKmalaQIb",
		@"KtQIpMAQkXhmSTeFdSPJKunllyQCofYAqYphgKJNdQNloVnnxXjOfOtjXpNROuQwyJNKkLUUjryXairfYpkYxnmuLcRgdinatMIVKjBwHkHZyyViuNiJLeNHEulClVOrXtHGVo",
		@"ifAPtNzUhyCndAkYbJGIegMFLFPNkrYPAmgaNVbMtrolGhEvqJXUbKmDbPMZcLbeDqJxWAytBbUeaMCxIvwwtRAbjgqJNLelOPSDyNZgLolLybrl",
		@"rTWpDWurdMbacusfZAMcAxWLjZVmSCoVcmtgTjFZfZhIUqBbpBptrAwOvZjkRanRSxjaicgHcGfJCXMKLJEanPaprPDRUIQQFOrKZ",
		@"lYooHHEOLLPXmAOakICujhwZYDMlnvkPlqCfsUyROBNMfIFYoMnGMxsJXORWMqjGYQfnciAhNjZMbZtanwQbEBlWCeZBgGmZyKsNdpDulwdIsDRGOGBvtbJnHBlKpOqFEzATpuCxNbOYdgmPNnKs",
		@"AgEkmhJlEzFgdqVaxZesBWcIiTlOcAZRKKwGevRYkQOfhAIvLUIySbBQLVFOgKwfhbzcVzqAEJLxNevCKUGDdHmpHzGGUCpdGIxUzHWOJqRKftJdjFeBOrTcGQe",
		@"rLCLkOVKKCCqhPLJfkAvquJZfZSzOBfuwNzuDyxGsTAikuTMUYQpCOzQlLcmWAWFiqjCpawfcACdcAAFvBtNEVUgbsYLMDyNmnoighx",
		@"VucpxPpbsCcluCVCimnHWmRAEBbxuVbscsMTsQgYErhVySbTubsEkWzpJGEZJukHnaGnJualKcTUCRSdiZvXDCAuWnEWzhmwPVHWupEKapJIDMcjPwywszewFgBRhmIGjpNjZHTYdt",
		@"TxfnfgbLAyQirMAJqMoudLfRnKSQouaDTOlBAgHfGyExjyyNvueRbOGTmeimZXTVwUGucvHRjQLWEAHfVvjaPgfqjJvGDyehtrJGdkAhBOJbtjBTrMoBAG",
		@"XmbTuupPMIoBNEwNaMafqgowGZAkyQctDcWSYgEXtExFpsUilBQpiFNTQMJAvKTMdwkyGVRBQUTUrSPwWhcilijOTMFsQQOxBoYwxFCFT",
		@"SpwNbxqyEeSzREGLdXkXFuZkKLESnuXKAOWpIhEqTRuYhUAJVSozbKuhaCHfWPaeOONJnPVEGgTtnIFYpQjejkvNZwhuPoQUSaNEEAQWwugAopQ",
		@"aMlyWVDQXtsqQuKMgdSUVVbZvTrFqgETuDoffIZblkpVpZzbSPfcFFShUlLExIPRlCnSkSNZNfCPQEjzfuNsOTlcNpJxTzLlUbBKPMpkZcvBswEQOZPfFkfxplKPinfCdlvS",
		@"boiZFhCjDvBPSHeWHIbUSdcQHnHcziMPZlIBaUqZicypmPBtyKdDfzaqLcQxkcZkedYWulvQobgnUAHzIKvRTzlJXnwJyvVufiPvEtEztIBiXtpiNRnDlKhqixEKwcnLsuRpeGOOSHVOlpTV",
		@"eLEZVffyicVKvXhsJHEzLZBPavepMNhbpgfKsnqMeqjcdsYibfYmrYJQFmtZxkcmmIRUSBJuCyViFjoKBNahrzHSfEbRxFrBoqBkbZGxEgKxIXgpYEfQrpNfeZxJdzEgPAzVrTSnbppeumnWv",
	];
	return mIjovQCWtfbmOI;
}

+ (nonnull NSData *)yTAMlWrtngfNC :(nonnull NSArray *)exrAJrGukBfGdAY {
	NSData *foMrKtMEDiuBzP = [@"uuRXPZyysrBKsCEAdbDvIfrHOkgwuXrLgTFHvtbsZpLNjUGMArkSmTwfduGUWfmJQYLzyABRagrDOFITUPCltOXpxuSzNgXqDgRcKplDCrYpcMcweYnNodNff" dataUsingEncoding:NSUTF8StringEncoding];
	return foMrKtMEDiuBzP;
}

- (nonnull NSArray *)StOGRkNJGlNGUEMqiBp :(nonnull NSString *)KOpPlgPYCBXhq :(nonnull NSArray *)gvZrSvRsLlWqrg :(nonnull NSData *)CsJcmLRwyZTRdF {
	NSArray *wJOCZsOShX = @[
		@"SSeCBJpdBQVVAvDreBOYgHEZGphywUFLbbPmMuzRvfuqJsluebgnZpoxXCSAiGmMcODpGxoRWAqoACcoasIaeryTOdhwOHmHWbcZOjiVNZHoWVi",
		@"UaauacYfIfdEqOIlgcVKhLXkFzcltSlenPLdpxQNEAnRGCCUlWaXvDQOMDwqnkSbxUlZgCSXeszPdepaBRJlGThmrsshkDhRSXFeBxNvtsCpnhVH",
		@"UopZtrPjtaegLJGmWqZtfkBexQealQMLTJjuZGCeQubWZGjcyIXVTYZnzbGWixgnTKbZcLjqldaLFhiKKFWovXfovDTAbGJILJhQLhYBGPXRyEshodPqAydhcylxBPvtJArsBqSlhtqGEPXyy",
		@"juMyTLHyvhgIMmLApSfMjYLqdjPTdmPUrFsyNUBsibxBWWYCWNKYFBmcWckllDzWJwfjbWrwbtsjLhsXnQetAKvWOyNHddKhQFULmicKWXpEqSiTlKIrtJsBJGab",
		@"aLHAJtyjORpYpPxAZccsAwvjiqABWegEWsQSzhzIJfwKwDGmQduPEKVqJGFrVgkVqjHfzlIooRJKOeCcwrCAgNXPwrDLCQYkbfSejaFbKcnTRFtolAPutNxJxkCuM",
		@"xvIcLrekYVPTEqLsdYqsWehmeEUGISqAtcCdCNlIJKtFxgpEhZAvnmZiFsEtzGZgBvLuMgTvSgbmLmBSoWsWyibWUDESJAoCxXrPNnJvHeTUMCgPtalZQHVdsfHBVqFI",
		@"YAVSGJXrFwHrkVtbxvynOyrUfBChHYlEmLiBNLlVjucryClXqHoiHKDxctgegFESgkvFUjFLuJFcQPffhaKHxDGdnDKBcyALmsdMIH",
		@"lWTOYLbnypuPqkFQtmNxhXgyIWskKJcxSbzUkFkZnExnVtWZzlbIbfqLMpEuHupvrJoUOcpFfKNeDuWsEDTonsiSmurtXCRzntdwXHijtiQzZJyvfPXVgifmHwIBthO",
		@"LPKeWehNFJJrDdrRhQBwFaedIcoieBCWoboTjMnzqdPjASWLcpNFOJUbiTogzbzKvNvbJFwOyBpMMuwrnhdDPMvSsdYKyOZLXYYzuerMaXENtOWIdhxcomsTRFcBSykGzMAbLYIHcKbpQZlsZ",
		@"jdzlBmDJpWpPuqxdMbfOqKAPYmECggcBxnROzcPXmZuDrcYkGrcRaNFCzwFNxmIsyDBZrJChDHjyYWmrhSGKMFdBlQqRwwBKLZVIpwmLUXFykFlVBVrhqyJmxyDTXFWRwcjsIYRpsnwnbAgwD",
		@"JGAkUouRIveNJHwRMYapeVmjlnlZNymRapggDiTeYTizGqumzzHznPEMsqoIitLsLjZcHfqLRAybluHYFWMWVnhiAFWCIZWujnkJNgtEXkZpzBTSJYkEFjMUDgTSvVZkPBKfTGpUpvNTbh",
		@"ogCkGrxYojLsBRxhXMhXYDwHIdwWrLKHwluFwviMFkTODmADgLpcRELGzXFUZmSrkphHkOfrdGGTINesNOBItsZlqvFqgaBLazsUccSpSReJNqqrbJ",
		@"pJiCGRZcVRYrCMrQKWuxNOjJJHktyULEqnXblpXsfIkkonDYknSLrOcblGgMFCydPmQtXQYExPymiCekqEgdeOVRFHSRPpXHUlULYxRirWJGjVHNFleDJnkfQKZPduS",
		@"ErPaGrxkfFQGEbkTKQROdElLfFpjZsquIrxHWUTUStMmclVPbAlLgaKcGrCyxjSsIwZawxuLqozlyYQlCvJUTOfkDNEwCFFZCEUeqiurNSHFzaosbEvrigeWCmysEFVDXQZD",
		@"MTYzqUwmprYEuUbSgswvQyiMyXqZlaPYPdPaUxAKFFXhtdRBlXLqjUpRHjgERSGEPnQXjeYavPVzBTHoEqzlxKIDkbxqhzJoJWyVCqSELKettCsLLHMfKTCkHKzhJmTKeiXcYGisCNR",
		@"wGzkVBTOgvakORKQjqwEVYlBLuhYXorlPGwcMTliMjGSHhLqaIfEomwaepiNptulMZSgEdaPTVIcBLxpOJoKkrDrLGOAeQwbNRKDcUwnyV",
		@"crulKuCFlZTYMamWojCerWQoNsDsTxDqoYcxkFjbisuYLevxCKJXiCcoXVRyaIJdwcfCKBbkePeyPlYWVuLAYvsfGAQWrACdcbvQZFIXBwQZzJRE",
		@"zqSUgoxuLfrpJyhEVALNwTrdHFAamhoxszqwipENPeOMDsQhGEvdELJpnVljBdIsxtyyyQejQVAiQSCfcbxpmjHrfFiZVFdmfPQDqYBTlIGKOmgDTFrnbeLOKHzD",
		@"DtDMQqyXhzBTXQzBgnhSKCTEuRJnDmLTXxhXHEqlUkFIaOGtVKgjufXmSUVBTpGmAfGqSudotYaOvStfiMADjTxPYokhQLnvkucBvcLzjDyAlA",
	];
	return wJOCZsOShX;
}

+ (nonnull NSArray *)KFVOgyXprdzY :(nonnull NSString *)QFBmPmfhEoUt :(nonnull UIImage *)XOexBqNRcpLqSHZ :(nonnull NSString *)CzFGPYaCzsTQImuB {
	NSArray *etsaIxAfwUctPZVOnv = @[
		@"SyacZHHMzIforOTqQwIKJduJgKGPbjlLJyuQcHtknFRGPZWdONlYxRRmSAihVkwdGBsjHRPRMytMUhtkjmhXwBYJfgrWgWBAXqgdIxYmbzvfhoGz",
		@"YvDzOeOdEzKUbijziBfefRAEBxuYdATEFXwTIuBiJWQrTagsPVRbfjHEpWftxIxddeoqeRkFldqPNPZKjAqnZWOUSBBnRLywLqNdeUoOO",
		@"SmnGTNnqtHHuiRypfKIXSLPeYeWppQSDZXJwnhqoPqpyWnsHzdjTKjXNHmgtebdzCIbAXqoyOVapKSMpjEBCOiXNeqmSnyVjVAzZUIUSgkRHyKGnOIHYoorhIBPtVDknBgIKpvgXjYwVFcLL",
		@"TqkgcfoZmZGFjtPrAEGqkSTfzQjTDhvqSVSuwmptEbOyoWpvwBbjqAeDbyCoZLwEroANIAkpvmgEdiIOcussQRhVLgPhyNydanIlaIDhoNLgETzgmZksN",
		@"dArVnMyukZMQmjEwPghiEIgPdRPuoTHPzoTcWqEHguJdEQdFTMjewWOPNxIARMfUqygcWNOEASoXAvpUKowEZWypIUjxThSZDhQMVYOkqdGNeVkJttYDndiKiEwIJYzftZajUSsfqLkznj",
		@"yHRpRIZchQsbzcvraQygOixdVhQRhoxoEqDiokCnikqvSMJRhRtiWFXwuRyHecFWtMePCWcvpCzMWdUNEwHWOZffHBScAupJuxFHtedIeRSWHfiiNnLHSzAwznz",
		@"NNEqbZTkrbwdyqYGsUNynlQRYNngtioxFAIhownAfsfFlIyuoSFnnmMkrELdWapuQcSxOFkvJHtzjnjNdddyHYfuzilGCxKiBCNhwJPIDyRidfhnyjzameULJqw",
		@"sDdoJmNDUySNBRncbNuxWCctPiBADnSEpVDhCBrRBzxwVKogentnbTLRvMmrZLEVDWugbnHVdYYZGoKToVpieNrlMLbxobESwpNrOcdf",
		@"KliTfLcGNiYRLulTougAizlCrvTfPLnYpTcdXnqZXFmKCxQspAZpaNSupNyfwOWpROMCUZvmBCACMrlBQyJDHqQRabcKicrTPBgOTsPrLXScJNLkarTLjsFpxRYiEZiCMPcKGKWYG",
		@"UAFMFQOZbFCjCmYFXtLHHvFYoqsHIPKQedUYzDewFNjRKURctZUEatcyCYLychAWWKDClefPQniHVqYttSfrKgjcaOjejwSPWGeNfQhWCwhTYNcIuFXWDJi",
		@"LamjiOryMRZGcnEhxYuMJRInCrDPomuspnvKYygmdxfJwmWJCzQtxlCnXRVkpiHWtNOooadrFCbuvnBkfHuSUjANOboHiqbVBgepIPTUHCyNnYYVZDpQwCBcyDTamJD",
	];
	return etsaIxAfwUctPZVOnv;
}

+ (nonnull NSString *)CsnckltVuKiTGTIyQvG :(nonnull NSString *)DfCkObJOcDEqpP :(nonnull NSData *)pDVnhTLgGDyZkO {
	NSString *EcDDwdFhoGJVPMWBns = @"ifbuHKvucvWBoYVkhxqxGsIVNmDAFlKSPWJqQkgIjlQQJTSzTusODVtZYAPxSkDvoIqSUiJTgbMMlMdddefiqsyhTlDwLSSthBysJRYwzNsPsCHEfGokIntzlsPFykLzWEQhQOqpYFruyXtjPTe";
	return EcDDwdFhoGJVPMWBns;
}

- (nonnull NSDictionary *)nQbILmHOKsTVC :(nonnull NSString *)gRTxOXnMCrmyq :(nonnull NSString *)SeDcoIctNjnoVHx {
	NSDictionary *IWfgEGQHlfsBY = @{
		@"rjRmDsTpBFjNnGwoj": @"btrvkCkSCdhyxqptRnHERNummTvXBMvINFzHiszwWgDopRSIqnFjeOjDwWoziRMdxrglokISYSGhZkuQDSFTTinaSgKJFUExlauCPahOVg",
		@"kSggwmsDGUYZZggG": @"zjTOptypWfIKeIqHywtRljsRGzEkulPqMpuUlIyMFAeyDuzpYwThqXFnxhtnETjcBmEWcqhSffjXpHCUZNzbYBDwvQwlrpfHSFchnaJtXItPwqB",
		@"NqrZrvbiEaM": @"JZSrApHQOsctluHyPbgCWbLNCxyHnngThDvALDcHhitnKfNcaReveCRcGibGitlnluxEdQRKpawKWyxGhYnSfOHlfCumKhmAQJcyXfWZvcizQWnzbFsDEkreRiUNDzjejAZadnN",
		@"HlHGlZrFEL": @"ZOOCbHOqSalylAeAIdIHXwUnvxiDaIdbKiIOcTaOZtFoGRKPqwMMarUtRqDiKeeUwibokusbBDIXFMEiSBtzIndOAfBMsAVfuFLxtmUqHRQPrGGVBXyCwSOocjClVqbQNKcjPIXkijJLCdzhRIfY",
		@"hGnCayQfIhwyqUAC": @"gQZJSvlmNygKUOFlbgOmPjoDMduAYTizqhwcBnTdfdimaSkAyIvVYkRjXSbOsyQuYHOIoACXpUyMTzFbhfycRgIqGpTEctomVgONHAJiOtrrkMYd",
		@"yHnHgaeMEZkGtYaGt": @"AismRKVaQLBvSYbeBVVOuieZCGWRmfgWQvoeRvqMXocagzojxJvKsOonjaUSlVYBLUqckSRewphcRdChabBpjDgFEUUBdUVRzWvMwgKZcblfXYpfjXpbmiMTOKqjpEVoryVKZnayfpvqTHWNSBA",
		@"GlEOCJfXUNJ": @"JFUToNnTMtzOIEqZOlemhiUgCMJniftstqnOszeLTtqkpuUqDsoLAswhPsEFLtOlXKBnmYdwjvEVGPSsfrXmttNNfjqcYSZBRQvA",
		@"FcNIwdDisATHhXtRgi": @"lJhypWgqXnWslPiUTJJzlMDzdJYxnNhKuXlTVWMkyvzBCMQVkjuIniGCdxWmrlfqGAYIqNbwboayKVwFTCtPATjjTdqgWPupPMKefneyWXErXxFnDKyazRtwQdlgT",
		@"XyTMImaUjoMxTodz": @"IpbFUQQSBGrRrxpflbnRQEuWPzvWZOZgwBhipRitXFezKRAcjJHronXpgERjFHHdDgfBahFTaWrHojlsgreqeuAvyfEepIfPkfYkabSedhyWal",
		@"DGlcMAYJylsfQXZ": @"MWhuPtTWJBIfoohdWXywtTWvzNMTHoqREwqizdDcROFjlGDDDmwKXOrXKARprunNzvOWjiYoqsfAIsGAoswPZXiyMCElmgvcGRfrMuVLaMSSINCDZhrqvfDsGLefUUX",
		@"znxdHBRlTfVHK": @"MmZVBoXtpUmYePvpeELhyivvTMBuvmblUWSBVzJEvSsscGgnUiUZXsMdUoiTYtrpzUsnGgMbWaEnijmRiuodxKIEIwQZvUqkQbLmUAk",
		@"vFkRasByKi": @"PoKXACFWILSEvcVJUVxhFEKafvimJfBlCoJIxZTyrSIzrJbbuDBOOgvjWXOSHOMqaXYkKQQmaBUVWHpQOqBPTqDdezSFxoVmMgpBrhiwVdahANeu",
		@"vNJAgcvNSLXNAsEuvWN": @"gUpLfprZgRPdvQvuXtCVOCqesMLEyaznQCijULquUoDxgXYykSnHWLTANuPSBurFGgBbEFHBEHtfSfdHTQxcxojjVEZttFvfejbyTzAmrqSgK",
		@"guAdWwfQhxofL": @"JbFGqlqYQHyvYCkrQWHXOIxjBSKynyNCynmzanTNAyzANyxnJSCWdCMWqeIiAjPtAgFnFUUNbkwKFNEowoCaTfRxsSefCpKOquroOJ",
		@"cjRXyObHXKDLHiprGy": @"efrJKGzwgrEfGBZIheQhdhfjTCkTTnxGDGGSClGwwqCSXarRBukyNeRXFMewoWPwTgJAkJbjvIdBUYzNdlJioQcOZtiVNmXIWiCtYdaXnsFKuDgK",
		@"dLfHLvxSPYw": @"ZhJRqzbWwYpZHJIjkUxkpjREHYJJICaMYsgFDTNzdwvzSaGXVeTxnBlVTRlzaNmjUiUGMpPBCMWCUxhooAPEHIprfXeEIVgRjzPGJMtBCBl",
		@"uQZYurCpsa": @"PaEKdCGEzmVEQWpxsTLKGeodbKOBVOugGnuItLIkxoNCscSfDBkppnupYcZYAvNNjmIKWuTXXgohxOfQjLkDjXjbYEwmqljkxeaAOUCrSobyJCKvoAT",
		@"TnGVyENqjrTvtZOmI": @"OKKzoSFzYaCyhHhJYywmyIywjiXJpOdDlOVNUQkoMtTsigyVrGoGBlqnROmHwGkUoRvjhMaBxJphmOLcriPsLjWzjNlNECxuVBwzOjLjaYrGagzfDLOEdmVGKt",
	};
	return IWfgEGQHlfsBY;
}

- (nonnull NSDictionary *)FHKnjKpNTXJVm :(nonnull NSDictionary *)LqRjeZfHpgZwBdXnDb :(nonnull NSDictionary *)jRHaEkXIgmE :(nonnull NSData *)ACFSNoRiUXBKC {
	NSDictionary *xRNTZTywMEiam = @{
		@"PQEMpgbPmmiNqZvfj": @"NxxlaVNpTnLkiOjEYYufOXpRAdSExSryqlLXZgFXQsJDbniQAlBRwqjWjDKeWbCbuvyyAvcCpusBSunxPMLzPWyrDbEiRNMzJOUcDPIxSv",
		@"HtlAVMagEbcjsCbRWL": @"YqzYLvUOyPehstVJOEdhjHedlbpSObEzeJSKmNwprgVbssUGSNiprByaoinohHDfKdZTrfjzvlUhOLiqlGqUQvAtoOmIgqfZQdbKtdubNSbJutsjvONvvoSNTOUsmPDxzyZheMwPYofjgo",
		@"ZEzuVeNvfV": @"rcSSDmMGJlokkGEEUFvwKXXthBKsZaNNBjJXVFpmXFWpDgWhpuzfCTuOlWaTxNcjnsVSKuUZxxoRHFLUZMpctEkIfirdfjbSULlgcXlbTHlxXWVGcxhnbCThwijbUXlOifeTyjngvWVKtEBNRT",
		@"zQXuFKJsorMj": @"IrPJvVjvQmTFVutKMsBEDsFjPTzeLIgvxdUitspdgzyNcrdWQNwGCfYqeFQWhaSBrmwUnNQIeDlfuFvBIvwAjuiwcwMGiPvcjgUClvwzRrzZmBryhsmGnKRFotpLnMckrqYin",
		@"ckjeeWwJeVboMxblR": @"mAWPZxKAatCRZzIhFzvrBDPoJHOeYXfROkmwDnbEhsoEHiYayUUnsUJbGClJCPvzLchYYremlgCuwHrIILCCFfSmomAgriMAAGlrzIyKKcnEzNMirsG",
		@"jnGBdvYXqaJF": @"fNoNVjsbXDusQFxGnciXHLCnwjelZecWMuKpKISrPuBCmOhYluNvuqsLItJwjtBHGXOigjIskgbtsFYYBdyLQYyeXDaKJhzzaEepNDwcJTPnaTcnBr",
		@"gcqvAWGyGbW": @"TPaTCxeXmIazrhyAtYMaChgkiEEGHebNgCjygNzylrGLvBNdKgqhkaGSYWPkWHAsqWSvkrEifFmFDPLfBYZCgIPEwuufGIdiNcnUdCgXqHUtQkiusLjjfFnEcfCLZIguoMWUsLe",
		@"MDjDldXPYPLaShgpUeq": @"VawPpOTkqjTZgHCdBeTxwckQkKPYYPnXqctZESUmaFseMgTiajtxCnCIIVGTjXpWEKUuDModVHddTLXcTRMJQkxLclRgEYZxFjSdlfmbmYusZdEWTIAPHuyUvhVlfglqYvQsGv",
		@"TPaUugOrFIankFSHEED": @"MjJpkdiIadZjAJSteSondXpXUMQeYnqJcaPUOpZVzGYRcLnFQAyrrvAnnPrVmUnUEeyvinYJHjuXLwoePatBxafXKIjzAeVbuCcRWVLtyeEkZPhtONMKQgfsAnsYDuICRFTEtzXV",
		@"wmlHBSmewsghqIs": @"WMALdWhONHKemrvnVUENnHQMriaIAXCOvadzIbWIFlVtytrqtyrkPZokVlzNwGFoyAFwlZuluYgivOWfViMAlferflAtHOpnaZZMUyaVskybgqcBLCKDpOkRnjbopWzELLUfoSF",
		@"PAjtzTilxyJnEF": @"juHPynHMQCHIPggdsALrzRhvhIUtxckZklYiyjOHYNckPgEQJUaFNolPVTpGhTjAwjeYbTCaiIbWyaxgToFNDUuaCqsunYxstnGCPXqaAUsvkzKgFCWcfE",
		@"UYEOmAEjfRUcptKh": @"QFzvbmSvxaaxGqJZioJUVmwdTZGHBPJHrhAyWQenskPhwHAakVJxVdiAgSkEWeXmSUXuuZHEyQbTUgcqSwgRkqniAQEkVofknBtnHKsUrpNYinLuIqMVATHlyBonRZWnPvHvUDwePBdrtXjtLbUP",
		@"lmNcnNQYlJsdlSW": @"tiKMeUilgWBipDldQUmCffLWfJxYzTtQsYoxZYYFskvfGDoJqNYTSnSbBoDdYaFyfpOtKYJfLDUajBbEJDfOiPQmGkuYlKZnjPfIZKxCdVOdZhUyhaA",
	};
	return xRNTZTywMEiam;
}

+ (nonnull UIImage *)WWXZypqpUXTiEYQrEzL :(nonnull NSData *)LVDxxzNtZRjAxaomtR :(nonnull NSDictionary *)yOElLXTzANiabqy :(nonnull NSString *)lUOgDBZVYeckCoXyR {
	NSData *oiKfzchOlZYpQ = [@"MzieJjuzzUAHppvaPoqPKxmOBNHUOWHRrelrsGCWwRdZpJGRPpKADrFkAoCrkyXoFILPOFUrgHKzWmNRujOupQMqsdSKZptCSVBFGdbVRUOvJFnPzVqBZEOzUvmWYGUahEqzSVyQKrwYDvdxEWiPn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qJiikNPqUSWLvNnwht = [UIImage imageWithData:oiKfzchOlZYpQ];
	qJiikNPqUSWLvNnwht = [UIImage imageNamed:@"igYiFKdcgoKJxRVoLdNSwLLRqDfxgsdJAhKjcPWAkTDWloHDkXStIVqYfmwrDpGHBoAupQunllWVYDRsNBAJpVHBrJvcsiSMdtmkxlbsWtyqFGIhpsF"];
	return qJiikNPqUSWLvNnwht;
}

+ (nonnull NSDictionary *)DhbHELaawQuOtx :(nonnull NSArray *)sbsasQHUwhBazOsdIZ :(nonnull UIImage *)JysVyvLdhZ :(nonnull NSData *)ZBeQIODDMpEMNTvaKXn {
	NSDictionary *AIKitkEQNCKw = @{
		@"znGaFOcgRwUWqFAl": @"CpnZuKEWqMFpVfsECesWzEjeTPoOeuqYtFKVlXHNxSYvjqrYeyLZdqNYgZDVojyvwRiKpeyJicYlisdjLimWVFQzOhWiIXsimjVLcfoJTDuZJEcC",
		@"kXFOVYSCniLjzm": @"AKoZFQlpkzzsqNtcmQdIHfuoibXmAHczraRpsbaNnWsDDovmnfGCJAxICEZSinxqlNPnAmyksikGOOAVFjSRyHTuWRNmJQavfFmFrYAqdvj",
		@"sZnshmeuvqvNljm": @"usjFkCjugmsLEGXzxLEPTcypGDYhyFPdbFliExAtSwaVElvnevYlApIzBZMUqUreHpdFsXAMVCqexgvmwYswnptaoDoCAmKPmYUKawtRuegUiMmGgoXOQfJxKhNYrVMCXdkKaUlTPzXw",
		@"mYgZKVhzWmiwCfL": @"uQlOQEZaQITcKzWLIWbBBivdNFSAaepuHdPvwTwIZXJvfjQxVKEaNudPcoElKJITQPLFfcuLxyzoseJIUEQbKedCBtMBQLYMfaZLAE",
		@"mStstoonXPmBsTwY": @"zDkDvAAKtSrDJLCZDwbKrmdLWoTdOlRfYSKoUCJaiEiVvaxMiHwOOpLJCctrYVEKydZqHQLENcbvzAkPYdBoHrpThiOalAEjLwmEdZfDwPuSsLVeeBAzvGuwAUkSjcALCaJDqMChCrBNzULwL",
		@"PCvpJSDdgdcq": @"mvwJjVIvZzezFKwzQHRbkqsQaoxOsWuyyJhDDsJEgUoqFCAfuNRuiEFwBbiAWTLHZBrNDYnwymiDGBwKQyaHvccECVJqdXPwbpsWNQcgAlwYXWuEMJsFSTUFwkxmfaULIlcmMI",
		@"vAkiNKuYFylttSsP": @"pHroeRfpAwRkkBELLKFeAcwwepcEGMfBDChCONpEIQZEUnYcsUCHYcUgVzKoypvZcJpNzlxrwyMmgtdoSRkbKITobKGnUQZNxQUMadHMmeyZVhpCURsBEoRjvKLsMPuFnihXRRK",
		@"oqejyviSGY": @"wnCivzlQnQGtPYzFpzzKkEkDavmuSTUuwmKTsBhCsXVgkRWLlXZzkLiisYUOFMtKJRdjkItLyTbGJvxgxWPWoMRrECgvCxOxNNfUL",
		@"ZyByBlGUyQ": @"VPRWfUjBpxCBrQoYFYtCjTnRGFnaRTWbOGDqmicdupfZlPZXmruZpqoDHbFWqjqZmhfwRmZiqOmuUWStnqEWTFNUmTpWdQHgAVXHlnnKxSCwafGCnhnKraiaNRIraGvgfutHq",
		@"LIeRRkJeDWR": @"nuihmzlRxVYIXfciQddRmQbYbUKYLhOxSEUmTGWqePLofDcmOIOhjWfGxnAbwHoSxWFLpxQxtyWFeBKmGYHmThhlfukCBKFEcoGPEzpxQLDSgGfUkcxqXEBDZFjlRrf",
		@"XGcMFXsDUirGdmOQv": @"ooyoWSInPkRHbamrpdYfcWxgGNvnqiPfdKVuUiMJkScjqXaSciAeqTILoheeWYRXcimukOGsNXulZxDinkHHcQQNkKIuRafBdezuDZwnkvdfygzkFDVhBaRwqxjhvXqGO",
		@"FRueBaCHfuefL": @"RkiMPOdSauxHHmQYBkCjAwFnwjtAtwWEACTbJIGEcQEkTLpDJKAdqmomXOklClEQMxdbKcAyarQKBaiAOVwMWSLEMxMlKweakDLsUoswuCVepFxpUXDiktPOyXsGCzWmVzoW",
		@"vIhsGiMgynyj": @"rfUaxfwzmngcGoelWCbcZtcUDhEdWlTqLQaqXGkePAchbHPTJxQDJlInHDPHESBmFIjEIHjCUvLgQuFglzMASJdPCMrArSushFZUStJLCxVYgOWciXXHWTRsLmMkuQDOmktkWSVmaBS",
		@"PiCSWKirPCTljB": @"RJojxvCOPgrEZKyVLewvaZxJTRKmiiBLhBUwRTnUABHBZnEKneyxUiYcwgNlzPsoTDnlJxiQYeNdtfIIbpNVsFaZNfdVDndnWRzXiA",
		@"TPTBhCOTYuaHgCxFm": @"mnymQKdJkaLBHUsjzayENAFiiQahlhhjJNrRJOgYZjCIifszjzcKAeeILlsBirZnRXsYlfvlNPKhmslMOLRlJvAvUPqCjGdhFHoaKTJGcQFPqlmmRqsxNuURgJsPqDNADb",
		@"uBxNBtWIZD": @"hZqfPEvYtuMwXcpWhAyJVXqLXxnwzWwkXlbxMmGUOHwRNePeGGyRLadHMBzbJxIRbCGEMSqlDZJHbQkTVuaJxCEaSyogUZvQLyWeMkQQRnGHNEgnVouxL",
	};
	return AIKitkEQNCKw;
}

- (nonnull UIImage *)CnsuapDzUQmUrKk :(nonnull UIImage *)qKyLlwmUQVB :(nonnull UIImage *)FZlOrBZaYgWqdx :(nonnull UIImage *)ZMeQUutdjxGgGzQ {
	NSData *bfgliRLCsfB = [@"NfHfMrwGshNpUseMiwiqTNvSjTTpNfQpZYSkiAXAmEwvqdYFVqpBKPJFFEJfMiwdSZMIxHRHacmlQpFDLoFJlVObTFmqzxsMDHGoQJVOhmP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sYNjsFdmEViYAwk = [UIImage imageWithData:bfgliRLCsfB];
	sYNjsFdmEViYAwk = [UIImage imageNamed:@"eKyZlaeheNMFzAyQZyIYojBxukDLWcGphTTbqIIUdfxJXVXyzGHLDpRGdCjBojfjQnFNslLItIybGssRhBopMyonHPDtxZlmYUPsYybAIvBDYrVsBOnVBAvAyxizk"];
	return sYNjsFdmEViYAwk;
}

- (void)deleteBigDayInfo:(EMBigDayInfo *)bigDayInfo result:(void (^)(void))resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider deleteBigDayInfo:bigDayInfo];
        
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock();
        });
    });
}


#pragma mark - Getter

- (EMBigDayCacheProvider *)provider
{
    if (!_provider) {
        _provider = [[EMBigDayCacheProvider alloc] init];
    }
    
    return _provider;
}

@end
