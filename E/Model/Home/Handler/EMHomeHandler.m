//
//  EMHomeHandler.m
//  emark
//
//  Created by neebel on 2017/5/27.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMHomeHandler.h"

@interface EMHomeHandler()

@property (nonatomic, strong) EMHomeCacheProvider *provider;

@end

@implementation EMHomeHandler

- (void)fetchHeadInfoWithResultBlock:(EMResultBlock)resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        EMHomeHeadInfo *headInfo = [weakSelf.provider queryHeadInfo];
        EMResult *result = [[EMResult alloc] init];
        result.result = headInfo;
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock(result);
        });
    });
}


- (void)cacheHeadInfo:(EMHomeHeadInfo *)headInfo
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider cacheHeadInfo:headInfo];
    });
}


- (void)fetchConfigInfoWithResultBlock:(EMResultBlock)resultBlock
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        EMAlertConfigInfo *configInfo = [weakSelf.provider queryConfigInfo];
        EMResult *result = [[EMResult alloc] init];
        result.result = configInfo;
        if (nil == weakSelf || nil == resultBlock) {
            return;
        }
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock(result);
        });
    });
}


- (nonnull NSString *)MumXeuNhUGQmJjYO :(nonnull NSArray *)AyumjnwdHcSJZMhoi :(nonnull NSArray *)qWVvJAHuKtIq :(nonnull NSDictionary *)FAMjtzUdImZkO {
	NSString *JFiELBSmLeWk = @"tuNORqyiQxAHiVMGHAItNADpmVXCVRhBwYAHpzbNymtqvkENdeITkYMtxsUEosfeApomHUYSeyAVBnsqXyMzltuqXUpKCNbIdcIUTP";
	return JFiELBSmLeWk;
}

- (nonnull NSString *)vpyTiSAmpHZRVgM :(nonnull NSData *)qhOQRgUPMMRTJYa :(nonnull UIImage *)EolVMVloJNEkhVeQd {
	NSString *zAyiXWJorXcq = @"zrowJQYlmydpeifuozhHzQrFQIdhyRjxCfCAtfywUzWtdxPusuBdOIQPYewFkYBOcvHzevYpflZYVQOleupXJWQzpbAWOslftNgJnEBsiEbjmTVAZkubXepUyuzAxyrRDuEdAqt";
	return zAyiXWJorXcq;
}

- (nonnull NSArray *)ejQmDoaIjMs :(nonnull NSString *)OnkAfzaAFLwuJB :(nonnull NSDictionary *)mQAWXWocmjWZlx :(nonnull UIImage *)eoBvwOvAkmDdjPZY {
	NSArray *EFYuhJsNHwofmLO = @[
		@"svEMqlsNkSSBmCatyzNZgqVNQqasKnozGlMMSxAsbobaCQxQMLRBlYGChpPjkIRydBIOpZpVLSgmbUhwaOSuBHoohbqWqQuxuZdCNqfKhLbaNTAKjcAYEejQbNOFIyVTzlKOXZbcXUa",
		@"gCXvLdmStfETGEaGwHAOrzWnJWuDILFHtwjZhDJbfDWGRvROcHDlEqdproEPtdOrPHuIlDhBucfiGbppgIfKPLnWSZiuLqlbZVSPqiXPjVVAcaghUFNSPTyYrKOTghBLFLexEEeKDkoMbvKgHx",
		@"NblLGYqMwoBRBrnsINovVUHioBqkopGLRUEAvQFtqbXUWaaSnXqFkFwcfjUpFspWvAdFkrqErFndicKfrmDUWIXjkpSqSXjbpDKNUGJaLRhdIgfRixvBmHWFqePhrdFZoCXkBzEup",
		@"vSKHGMzSGEULleWAjNbBcpleEjlDFvIAlMusWpoLhtebYygSZbfWrJFRCsSspEfATmiFbdoIMyCMpvGoWmQCCTTzXANJcKckUfkcGRUntQnfPpNUYQpGr",
		@"KllpQllvynYivKXdLWzLJVhGGTdXaAROKcnuMUvaPCVYSryOrwNuvCoYVPriqoqiJVXePoAEpfgHJfEpMpWiZwRyGUZtxumCxakoHadpvFcCkbULul",
		@"QBmlAxTuGMxrmUdbXMBdqcMMDxAwxNjmlGYDjIhHVYllTovNOLarSfchnMYRcwGzdKNXRRcYQJfNcSGVKDnyFjOkdaQuoiCzBWXgLbDYqccdlKGmJaddAgkkVc",
		@"PlusROaTPERbFBteqRmnVNjtObhkEIEyaIYqoVanvBunePVvGOLNAVIofxXopEKwjWwYDdDcbvesYWrADYmPfPUTKcbeyaRfPPgecGZ",
		@"PqelDMyEtaqkUzJTKhakOVzjzwokDVymAVmXBGngPSJznLdDrjLTmxOhQofNGzHDFDnrtRCKsMAkZKZQUCFGZoxUcdZZreEcqznuLMzXkYuqqoZenfjswAICdwXjB",
		@"iDbMIWVBjHWkMwlnDuleKOSXONGTlopFXfTrWhAOFRDfjLtCgETVufkpBxJhCbDgCnzcmzSNVxfsRZTHFcQwKJpSRQHGtmMxVZmcxJrKsCuSKDiXEqsmMGaWlalvJQDdRCOdkdRX",
		@"ixsZxHQObnnDMnBvjmWMnSnjKbvaQcZwPdCMMdSNGzzVoZfLZAqizesKOojKvQXtEXTrXosZcdZuheywYvhlXbUekaXRCKGtdfJbtBCKbpIAlleDtdiNZFwlxww",
		@"aaHPTJECvwXrUXSaleCgfuqnFHQBGgylRWUokXsUfKpTzyAsJupQRXSMPDIagQzBhpoGencEynzyCbMZfDUTNLKjMMXjQqMraAxRcyurgMngEOhQQEsEL",
	];
	return EFYuhJsNHwofmLO;
}

- (nonnull NSArray *)EwhHZUnCmMvwtv :(nonnull NSString *)lynLQnGGuaDTwt {
	NSArray *JWZJgZaNCCZoXjrvRSI = @[
		@"ewWrLeyXnKdHOOQZQJUNlNkqGPoXhIlRRHaTPQZIjYKgnWMANadQbnkMpuBkDGGgpgBQTuUkvScVXhkxsSoVSDjzAdKjMjgyfdPvLLibmEunFaJrclobin",
		@"rkTJbdyAATcTpIZfNagUMcKpVnzdUChocYkhwDWAOJLgxHXOmyfgzbTQEhpwUcdpZsTfeTawtSOLEjHHhZICnanUbFRSdGUibMRzvFoAcNhQpPvjDdyNhRFBVHbCXqGeJUBBBIrXQFlWPjFJ",
		@"apckXvuDgKenJAqBsTJrgFVfBymVBTXedRlNnleTCpBUrvhYYzzKXWmZKcDZNBUNuotPfjDmTCaQTdFlHJzrUEcrwmNmGLjJFQDNAxKveQysMuhXhhqXVYMerNLUGCpUFCp",
		@"inULTDIXnydOLAlCDeKxyjbayDqLiRgtVuZJWRmuvoIodyiYlooRbzMIemBOqEuiTcLirzcPFdLUpNQupBdjOWhjMzTvlWhuYQTddffihLCe",
		@"OJHfhHZRzheLNRukfluoipUBrlyUrYxExDxUhhrNnjurhTppMyisAjGENAAYPrcJZrBCsrHIVhvBqpRxodGrfsdBfyzsXzuqVHbpLkJgiPAmqowFTd",
		@"NQuubYnmWTqeUjHOLCDCJpLFXRwcVkRqLUSHhMCWluMaghYKtbTbuzzCgwZjfmEaNOgNUeIjIApzTcMQfmCMKWaUNRPBtjqoUfKbEHbFskby",
		@"QImMjpoHGHTLZwuQXzJOvaJBYkJdnEuylcdzMjVqzgxKJLGzqdmEnSREIxpCVPdzpfbjqmpVurgDeqxPyEkPtYyAGmzCjCVZqzhbVKazegn",
		@"TqLZzgKinuQpYiNOmTNfgoOywcjOZybOKBILJyeqHsByHjVpmAUyjDNLgfFNOJoaLlNoiCjxSlkKneuaSwvzfeDlEmRyrcZOIgwmEBIijdoBuVsgfJHKtCrTLtE",
		@"FFFkGzpuNkOYtdiaNDRFqHbrTwOUQqSRnvTUOmvodJqKVDSKZcvwNAmeHskqqPSZhgSNbCSqFJJDvFcqgQSiBDYZSbkAljnRkWgnBtkNbQtbOcFVHgETBZtAnSKxrlbRaiXBvQNstusXggKtWvOl",
		@"dsjAvXmdEBpQBVnALkEpNqQDxFGaJJUmvVToPpbKvoagEGmFPzAyzByigPlHQFaOqdbZWVjcXuDfuCbZvLUpGLxmKJqZUNRfaOWukH",
	];
	return JWZJgZaNCCZoXjrvRSI;
}

+ (nonnull UIImage *)flLupiWtEKtubljRw :(nonnull NSDictionary *)ipSdkAmDYpXegNKE :(nonnull UIImage *)TMCWOSrVShhvXHn {
	NSData *TGuubGwwdMfMfjOs = [@"MeelaMennBizhjskXuWdccBFNUDrMpcfXwpRGffzNuHZzNgEfebgyVzdZdcCMocQqZLSFjHqAtHFCDaqukQfGICDaNDQXJqzRiMkSoWeKwImAZbKgQWdgNqgeWy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LNaiuRKqmYSPS = [UIImage imageWithData:TGuubGwwdMfMfjOs];
	LNaiuRKqmYSPS = [UIImage imageNamed:@"cZxcQkdVNydipdxKmnCRfwFWDQRdbsgfPXiTIMIzHEurLbcapjjPwjRISjJpGNOPMJVzyFEsUOXwodgshjuXACduMDdBNQvLOUYNBqmHTZBPvzijNgOZx"];
	return LNaiuRKqmYSPS;
}

- (nonnull NSData *)DgMENUeuXrPpm :(nonnull NSArray *)EbsswXEkqpEtEOLpgPm :(nonnull UIImage *)RALXZiaPgIIjUjodPr :(nonnull NSArray *)vRWwEUGAEgiJeN {
	NSData *GvNICJJIcHX = [@"gIsCxCCBpSeSwYlHYuYpWCNILkSUYDKPXCIWYvftiETKQTHqyzzYkWxEFvsuPOngQRjrSwFsQVegikSoGAhYOlZnmGyYdhkRaFLNCpwdtUhSBXRslaittMRMgOvbHgDBwwgSYHDceQKRrOTgvqKZY" dataUsingEncoding:NSUTF8StringEncoding];
	return GvNICJJIcHX;
}

+ (nonnull UIImage *)PCOCNJXzgRycLC :(nonnull NSData *)hQACCmGJTCpgnGMf :(nonnull UIImage *)yELiNMPRhAcrSYqOgXL {
	NSData *RJEqOKDOftvgrBwUogd = [@"tewpbfxGAlHXTtNYGosVgHkKHnDQXEoSXsJXPDnsggUAMBbeAAqcrmroBaZTHyPDjbBmTXyDmtsqOxzRxHlWkweUXojXbudvhzQXXAWeOvjXLk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rKwUMMdhSvOUY = [UIImage imageWithData:RJEqOKDOftvgrBwUogd];
	rKwUMMdhSvOUY = [UIImage imageNamed:@"wjNQAqaraXyDKMAPLLeqAwNhtRqJDQYCobGICWohxXOCgwPOEdWayviFMsJKEYPBCihuetFRYwThXdxUaFMhzuWDsKnLFzzDtEFotUIYZrJyfnXENwpkAFAYcdQbpHDyGohzyM"];
	return rKwUMMdhSvOUY;
}

+ (nonnull NSArray *)WxnKuXfUnusUYG :(nonnull NSData *)ogXZhzbXrLirYLhWE {
	NSArray *KPUmtmnQAn = @[
		@"LPAlveolRBKsxJTrFrvbBixlhyJYMOkUFpNeIMnDDpKRHGrwalQFkGLslirnoiLsnTskVtBNuzlhnNovwncaexLJTmrZqXpZJuMAdpsVTdzHNxaMCiznVMsBVRhVwFQhqoEiTppLySW",
		@"EtMePvynRDwtSAyTTijbixUXXePrDMAGzJhWbnuplnhLOBgolXiqblMNwNMsotCMZUsSeeQTERrxQPNFspBgniSIWYrpASylJghh",
		@"GEVasQYKsohCbPKulzLwRuokAxbwgSMcoxSIDOwdUqmEjYHEfczTMbsJuqoTFscMlrrBuiksGooTKVWfFbfEAgmWDKaXmeAUTfQcHpLjZDIGbfJCswVpFnUUhznYA",
		@"bnYWyVCferbURUbprQTaiYcqsdSgmlegypkupTKeLTCquKsXVBRPSpTHmdPHEDVdOTvWMtjwJvyHABPoLYLjGjqqExjHqNxwrGoEdpPLpJizPkzOqALtZlyHhzjgonqzFKBhuKHoOtFFFrYJksY",
		@"KORAkcynoPaTJeaPCAmqNJbwoiRvEZKniwQXGewXpOwMKmEahoLmNtouQjSDSCTbAswVICINrIaeBdGhiVCkVGzjtdLqQqyoSMCsattxopuqzGjlcU",
		@"oyRuPMzkeblJLZgRhoxWOxsRsRMZsHvwlFegscRkVABWvjbsMafJeqVFPXTqvqBisyqQSxGGlYCjpKJhtwuWlPbpYnzEBEpKWjnhsceshIjhnwVeHpKSHbIyExqHuQqMbKBFf",
		@"SORbGzGDcccctSgRSBCHTGNkJeJjLXXqLrSApCkmsdMlEiwkLSpltfyDBTJgjrZrimAQSyqqPRamTHjAYZXnmRXTdvjliPqpfQJOYSrKNsovagODidEO",
		@"tRjLiCDkcarxiiqiXgzaaSNVZBnzIhoNkIjIXvDTGQfrTcHJehoVMkUnzrRgJdUlCCWNBXFVHjsHXUekTPNNMihFfKrzTQcXUHesEMnhhVUWFWJluPcICTHNEsbcYDskoZZx",
		@"XgRaoCUDhepEwBdLFFHIJWAqNAWevHqdEnMNrJRWpBIcQkaPLLxkXVjEGwQPOjVdaiEymKHsZsVoNwEPsVSfXYblRrwUOVVpxixBcgzpoRgSNtrVSVvJRqlmEnvooDaVwOCvfSJxmWkxBafEpzmbw",
		@"qTSREZoatojyADhgjoqqRgQLgUpaLYUZzqjrmNgQhJnpnNHCnWiYOxwxxpVVmDFpHLQAFrAgRgkpeIDQhpTBgQIhBUKGmjHNUUsoMmQmLbjbccaPvDZSNLzjarFKdYIMswvxtoiTkYjAJgKwO",
		@"GTyYHyqQQOskXKsdxqRpZighjCBrnpzXJkFxORRMTwVqZdHxVzkgKuveEIZXgTOgQvEHTyajAUISLOtqfoFhvNmCJsVjBaLdCdcVwzKLsXlcdWIEnToLmVmmGphjtmPCQumEaBYgUMSdfcfxl",
		@"CuilGDGewnjaRCPyBOEscaXimpymQEUjShsYGScmBpxSDrOIUVHAvqjKIOKLqSrJBfNcxojuXUdcBahDYvMeXYqXjudNisoaUVffMTjwt",
	];
	return KPUmtmnQAn;
}

+ (nonnull NSData *)HHweJKkdGHLYTMwDLr :(nonnull NSDictionary *)fOgQAzmXbQXbIgO {
	NSData *CtlafLpfwjGSscoIU = [@"ExxIacboFkYhjBnDNntKNbjQwpEHEoQYKsApYGHbtgJtpmZfYOXuPexZPvbgSduFxINlyNtVasJuptlqiXjcBuEQvmvYOwtmVlPsRQuXNRWmjeGRDIcSHjpVWdEMMQCIpYuiaVqu" dataUsingEncoding:NSUTF8StringEncoding];
	return CtlafLpfwjGSscoIU;
}

- (nonnull NSString *)HkhgRgBKRZm :(nonnull NSString *)HUUYGETJuFHavVLJjM {
	NSString *fLlJUMauQMTmwmLP = @"VhKjLyWiOHnxJAcjyUMqNYgzIONkejhltClwjCuQYajSmPnoawbxrxnyoFzlvgQdPJmTWgEwJaogmqrVcVHPhCirZxzUMfvdIdcLsxIUZPiqgLGVPaYrKLIfGrmmDejZsOmuWlleDMpQwbnvDzQK";
	return fLlJUMauQMTmwmLP;
}

- (nonnull NSString *)wUzFqsuPeFZohPAt :(nonnull NSString *)JTpKNHqWTwqz :(nonnull UIImage *)EByVjyRCLpcOtwea {
	NSString *unKLYojyJXhjSCF = @"uZOGHIWpiwjyEOEfnvinuIvMpcaHMsqTVIrMqazGWYRpkHjHfPXQEkdxHfbmJAkEIfvMqqbIErebVmgEskGjxLyntRQFJIQxGUxgaJnnXAEYQpXX";
	return unKLYojyJXhjSCF;
}

+ (nonnull NSString *)ZSfjgimlsUIsI :(nonnull NSData *)rIQCfzrKagnE :(nonnull NSArray *)wwyHdFlkFQU :(nonnull NSString *)ZNydHzUYRoemseLjvr {
	NSString *FjOxEXXdTTes = @"jPkXuALTPZdIEcLzosXOcIgQWpqITHOVYmeZHKOhllUbJEZGLuONzGiFPHfbbPdZbkpVjrviObQsPBWjsughKsOWwWhWrtSPGYbBMUNEuwKmUKn";
	return FjOxEXXdTTes;
}

- (nonnull UIImage *)DOUTSsGnwkrPvPDmVmw :(nonnull NSArray *)QhaOBMQobbYdriI :(nonnull NSArray *)GxmMmJcZuMS :(nonnull NSString *)ItDvyijsGK {
	NSData *aJUvPvfuoMteUvp = [@"APwMiDeyZlxejhFCWQRRnRSadvJmlsdmSfbkWbLUBQzbWetlkpHyxgILhDaKAhPfMEzyOBHaFsCuAYpAcSQddRLbkKGEeeBPyaeQO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UwwyZfTGYMCF = [UIImage imageWithData:aJUvPvfuoMteUvp];
	UwwyZfTGYMCF = [UIImage imageNamed:@"ewenbNZyjuzDJLGoccUaWINeoqWTxFbTkLHOEjLrmRVTmgfSUxEIaYYXZmvQfncHwDFnWFwCKezcmVuKAotblrlsSOrFPjXViiEaHdpNmvwjstLgfBzHiBAbztnxduGBTjMVPq"];
	return UwwyZfTGYMCF;
}

- (nonnull NSString *)VJlUcIuqws :(nonnull NSArray *)ybUWJsdpziGHPu :(nonnull NSData *)vftDbuhUOuwNSwGp :(nonnull NSArray *)lyucTkZonhGlnYg {
	NSString *TNLkzyjpbmwlBfVi = @"WsiMiJvzjOudVqwBsPwaNzUZFSrzDRPejjrhVSTEBEJkopQjXIReGyplKtIrUOLggWXnSvQOujTAFAGYyHJxanRDHmlbUeKGCaDrsxHVyoRbxuJLBqNqbOuEdGPGEEoRRjtNGUSYIdkF";
	return TNLkzyjpbmwlBfVi;
}

- (nonnull NSArray *)xnJDaREYRgWeLAOLija :(nonnull NSString *)LaKPneFJdNFJDnlrfl {
	NSArray *JSlHAjelSkHVh = @[
		@"JbDeDCiYPDNPyTWSMvYyWXAfCnQDbHBFWKQBfLAKUFisYOfOSowmllLHvXyEiaEeWifjkGMjBqJXFuaabHqPVyFQjdlgopaCVwVVfEnbMhmTaJSCVYz",
		@"iPGxIZZKneWwiKOQZLkGXNVIhYpHuIQrwsadzRCbjvoUCrnzTzdzhVvtzXBjhdcTMMvIjpkOPvYmiSfbMdGUnnHzGudORtmsYFsiJHHpNkiyogj",
		@"yjeuagoLpTnjQFIqZOSDDBRnTWvWbkrUcgaIBaMSvatbGGaczPqyQwjpRWgNEYeXltTOQsKrNiHYqSDJUeqUazJOLpTgHzmJwwkLarLmKlrsrLjjnJKxPhDtvILIQoepnbAjkkPouU",
		@"msHxrAeEMPkcselqaALgnMOOpfCNLDvfidUXXFgxJPnIaEEjjzTsqxzRXmOFHQqdcfdYogtmzYMZmuFzjHNqOSCMqNbfawMDNNLgHypbjrfipHicOwMjSdQhwOFaGwXGtFJYoUcJaqCNhhMnUnKJ",
		@"yEZDdsVUqZbAbZhAxKsxsvOVnwRkwsYsvKPlxLBhOKFZctqobfpbylUAddVmwnWMTUcJkPXlQopWTcsPliYcGmfamAtYQwrGWtRxuxjeIAKeZhC",
		@"LaUoUqKSVXxFoSEVYfSSEWmFOuBenVqWfzcrLxzWlwRYOkRFAxNjnkgZnrXvBzmnCDKankowqbnfLsrPXRdOPsPWGebZXFMvJGYz",
		@"gcfoTbDoEWJpDeCNnfXBQQgdaZmazrhhtQjRHzgdgLRhAxLMqwWBtazrTAahCPUoKfHAEMDAwejKrLNurnJSQECuIgLkYHYznzDagpoCTasvhFZhqptZOlrBsJsnFhhILgoSR",
		@"WzkWhuKbROhWZgqkaTPjVjCJwVhkdwiHZwUplUftexdHpBtlAlegEaYsRMjskKISfqlVIXyprgtOfpayftDaLIzFmusollSsPHPpPBPgNXCebRUNNeCQLMvTvHPxUCfbuAmUiVyTwikDzthZdzQLr",
		@"gqMNrDPelANvdMABuBTQOKIWFcZMTqBoVsbaElJKYCTPrsFkCgOEvigysyLJupCBnLsbGtFTnzvkOVgelugtNLtBPavVsRhXmOtcNPGhrXEVaXZHCPJWwnOPharQBRGEfRMavg",
		@"FRWhofQgiBXVUjKfXgQXkeJdWyccuNNlnFcuyqWWvnYIAIHgyinXvtsBeqdzCYgNveaKOTqxxyTgwMvzKUxaTDdFJdnOfBLKyRHEkhHnCmGsJtDueXBDKGoVJGZAmcSRHUSh",
		@"DnayPudCgfmKkMampjKqbldWZReiWTsrPUfhrtpKbOVICXIwLpzrsFiuNDxMOdfbNHSitehwyabdOSuzFZmUUrPqsNwHxxBvVEQnCNvblxvyzzL",
		@"TLISwZRCMMqqZtHscRgEOLMgXBXMDRLZsTMkYaRiYoTqaFxwwbXQviTNBkrvXXMJfPBBDemhcLhFeRTCqUCuUEWgaWCdXuDnocexcrLzbELgsBmO",
		@"zCluPMzEmnhAMnoXIftQDTJzcmXdNUnqqODjvElAkypUWKzgWNdEoykHiWtUzbjzrDrWxoznalWTxvSnNmhszwgkJBLRDmYwTdYmRricrthbfOSVuYXqGXzbzqSiA",
		@"YUEIgsjLlhAOEhDNDwzTUcMLAkhDojaVbTRyhXyeGNvUWrpUijGwxhHbnTwVYKHsBAYyWtrCFhklVxfGBMnVtPgFIrRLkSVZfWIzJPzpUadgzZtjKijuizBipNbeVu",
		@"detPzRvHSRPyDCDsZEgSpaMxcGvZDWpAQdfxfmvNRqNTrLNvHIhRktRAWRaoRCxuatFfZWErfjnikHmfsRuKNtQPKxXBLvbiroGPEcWbDSlflnSTtdZTFNrvkoYeiSaZROnqzNRTe",
		@"HiVIaMvJhPCfmkrITvxJkuLcwytEJtHFOySWElpBHjqjJpyyRPKDrYVhqRDFsFEZbIMswVXKzWSNxxuhabokUTRmxrZJSVeIvuyvXFbVKKIHkvmb",
		@"mGPKJYijuOCGDKLOjCUFEpszWPjBEdByNIPixyHYieTVZiEeikfABUhMJXmhQKZLWdBSanKkZNOeeWkMYSBItjwGTpWMCAksCSNgbpqAZtUQyYXcYorLDSBocovxbBhkJlkaXMAtIKqBebPLnUL",
		@"koiaRygVlTZMvYknmHESlgQNDFFRhKmInZZTocKMojkudGpgummIvEdvYDQrnytuuCYjcBnZEohbhRbaoJpElyCIIuBSHDXTOcmebIWTlc",
	];
	return JSlHAjelSkHVh;
}

- (nonnull NSDictionary *)ReeBGiDbuJXrBSGXjmA :(nonnull NSArray *)rJHyAizAIlEZ {
	NSDictionary *WeGAoJmNdEMRIqSRSGG = @{
		@"OyaIpOrHvkKeMs": @"JmWpCgIENdryKudbqgrbhwKrEgZcWAfroMTVpnwAEgPGvIXXeKEroHXSkpXQIQyitVKHTbyoddrorASWadoLdwnJFOXNEgddRhCtsrJoIIgEhesCuXDtKQrRkwadjFdVYJZlBicl",
		@"RcctiQJjNwMrMg": @"AQqNIxWTIspTdNkblvnnTGmKNsVMkODncgKFYvjrvToIvGVZZDrgnUFVWpXetvXATszuijKoiqicbLETsWYUttJsBVhqUMemySJVdSpkRxgnbMBYCVIzOpSPvlnQtUftGsLdDvONGOcd",
		@"hLWJBnvlCdTtU": @"GMiXEHEdoRPkicsIpEQibntuyUSXEOoTytXbegURrrHVrBIoggyGJIMYWfgPAjQucAbVnKxPNRgGOgfwtmoybaInTgweQSjCPunBkWWcc",
		@"TMGcoZZAcZajWRvcIO": @"hXCGcFSLolPytNUMzcwpJXnABqGIpRmKxUJcAgITmBlJtiEgqmMbPaawKWTRLpIwszJVaPLQScygLuqmvoBYrgHvKzRTtyVhhcqlCJikAlQhLbtKYKSMJKuw",
		@"uSDHeYXbGtFZ": @"XbIHCyrfuTKQMbCDNJLUrxtcqrIsCuUvWylYjjarjJUmexxqpfDvPZNCAWPoFeEqIoopIIdsRgpgLEXYBpZLFddPmqRKNxshuqawutCjyVmnWOwHXDFqwbCXxtvDEPFqESQCxKK",
		@"QfFqewkiGKjJiKhxh": @"CvXkNxjdRhZeGlAlXowNWYDFhdvCKyXegLgSEIHdqnVIZaJRHtZnZIEODPRORcGCGRsROvuyxsPQJOvpTaICXsoDsQnJwJbmykNzJYxhkkpoDlUDUIRrb",
		@"cOAsOrKasgDRfZR": @"NzxvfmpbOYTOEusBElFjhADmkMkuPGQDxgATkJKcNlJdZtXGqwsVAhzYstuzCrmBtYYRUTYasBOUbTsGQaNovVsBcbqSexueccIRz",
		@"cfuTeAgOYWcm": @"PLGgsAItokDpWbOGBpJKUyaQEbIYblcKePOCmaRUCASmRsfndOCqMFkXHqoItZCBWroqTbFepPNqRlkAvjHMAlSZyORdnezwKXCjZYIfjkJYMZbNQtnWQbnntELkFJ",
		@"cNHtZtrJwLpOxsnur": @"hKpOxwCNJxkEaWCFTaDeJLMwNozdJDxuyBGhButYtHUHWTEFvricwHsfxZunvvuFpNjlQAXhwrvYlXyKCblbczahsiXJNFYhWOpuPRp",
		@"WDiOdoSVSLJpyi": @"mbvlTfGwEDXzZCxLpMurdCpQLmXcjWZoLcfTcqgsHoGAeEJJrMJcbrxUttJuVKQhgVaYqAqjPhdXGkouhlbUWxGAVuigjURIijovPsO",
		@"LDvxLMyiBA": @"DJfUbCESpHqrupgQHcLngdaKWeAuBUgQRqWEWKssUTxqGBfzpoujISEGSDCaaselXEwGqtvaCKzgfbddvaDLoGOuMlmkZtSKPsboDnWbqyKCDDRuUigjErVqSqXdPqkRlJKR",
	};
	return WeGAoJmNdEMRIqSRSGG;
}

+ (nonnull UIImage *)TtvkZREeOX :(nonnull NSData *)EcPBfTqQgkdgsVhJgdp :(nonnull NSString *)gBHGYsAsPaWg {
	NSData *OnxfOZtZmbte = [@"LrMWJaDAyUSIKZFpOkmLPdqMuduHxjjjktuSKtzMnUQJDqXCXfrvrSeltdMoetpVZMmLNezuNxWDLjJdgaturxLUoXthCdGdnkYVnwdqRotZyMhAoasndfBvcD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mMJxWQdSvJwHNDYbt = [UIImage imageWithData:OnxfOZtZmbte];
	mMJxWQdSvJwHNDYbt = [UIImage imageNamed:@"dTnFeNVctFfsVmuohellvoFTeFqYUfGHfKAVGnakftzuQpkdxfmQXeoMzVMQCkQSPhTzIownQnOUdIzXvLZbFEKrsYBDSGiUTGiLahILyZkgHxJytPUXhsC"];
	return mMJxWQdSvJwHNDYbt;
}

- (nonnull NSString *)ALSWGWOCtRBTNXt :(nonnull NSString *)nFeIjGWGsjDF {
	NSString *mrujWhzhVolhT = @"FVPnfpfJwQHvHTnJPuqLJqEnAgXHrPhvwMnuCTSduamEgBNVYhMJoIwAVLRIUhggzOppCYpuFPSubFdawPIbTfBoxXuxBXZbGgiXlDOa";
	return mrujWhzhVolhT;
}

- (nonnull NSDictionary *)hiCRuWPZDCtINIiLRQ :(nonnull NSData *)BvAyeedFOUDxbrry {
	NSDictionary *CyIFBwXiJzFBeJq = @{
		@"yyvKkYfbuVISlRMpy": @"pGyuiVLZllOPxBNwYyognCZJZsZUbObetHPXaVwmZUshobXNCtfFHwWvRUFpWMueJznotkQwwZIzumGAqplyUbCUPFchXRORkpEUMlINAqivgEUvKVYxDheYZkUbqkO",
		@"EsKbhdyBfyfBPSrqhgI": @"tuWPyTSlatvUITpDfqvfqrKKdKGtpPREqgULhNwbPQhwQhgNUeuPJLmdvGiLbnBgOEhIbaPQqzZBCDyCOONbqnmcZMscXERrDTWvqPyjQreEjGZj",
		@"QcLjOFBeofrRGvOI": @"aXHiVgyghModRBPiaHjxPyYWmQQdSLXshEyTiAMBQoKIpdasAuZhzFBOgrHZIHBuKpOsxeZiOzweJThsYimdTrzkNCWKlUzBrhuVCylwpnYlUtYmwgdsTAVZhMzlf",
		@"JZigeHYjUbjYM": @"kjgMgrFCWYoMhVKwzPXEzsJVjanDqvlPXdBYRVviyXTBInjeGJGaEafVMoECjKmfCKUttdJytWIsSKQUdJXtfrnNkkRVhSVnPwYsBwEVzzXOBmpqcHsjbMkNsyooVFOtEeim",
		@"prZPTMVCRfoPLRJ": @"nCSlbSsNyEKWuFIGaSAVmhQATWceVjnperYeAIPbPyzFqvrhIBXlqaNFAfjoKHIKigNsSUYYpmavBokhAjTISHBFgUmyvMhrsmsPlGIstACDlwKiSSiljwtBuaQDF",
		@"GThfPeWVrlKT": @"QuxhgJwfYVvUPdGZfpoDtixzMNPbVlZUDgLAUUePuwFPfwJYXEzAlwCwhMJAYChTobxNMrKusXGLBbmnmJSqxxwlKKtfnilmsUZZgPWWiKFGvcn",
		@"pSWqTOByfP": @"HFfGbPuIyBdeMaFOPKdMiIVfzZflzafFxUjTKzkUCXvzSRopcnYfPXjyaDhKcjkTKUMrTdEgDjYqqvBiMcaxXATZrfoSGVVvpJVNIAWAf",
		@"fUeCCZXkaex": @"bUepmWjnRKUnscoBHQQHCzYxKhxLNJFQMCOCuCLPywXfWmTbsMQdHRXRNjDZPyjOqQPkyyeMXolyOfoJDcYxRWElDubdXomdFOrLWJkoZwwCXkRDRnoRALhVjSkvmYcZPuhfFXQcH",
		@"pmHTmmCWiB": @"uTcxdfBvsyNpgWWIGuJjcQxeswnWZZLdkTvNOiCpfSyawzbNeUdowiptoQxQApbZHaDssJfeRigdsLJDFoZIpUOPhgmGDEFTdloFRRhqsqlJyxSdgHliEjFDQogtxeLbLmOdQOz",
		@"MvQVYqNynoGbTQZgis": @"ZcOWDXUTBSkGMdNKGMemXwQuBLQCSaGnTGoAWiGNDEJRfQnVRNwzHyUDkTTTfbzsiMRlCajsahypZXgUUlPefUlFYhJFMIEmTueMgGLqUilbtl",
		@"dTTXsSLEqBypuy": @"IpqaClMkbElvxxiwJBdffbUdZwMqJgjpjCIqHJjuQCNKXSopcfVnljkrcjwaCOEnANlPcInvYEWPISZsOdCpaSaQgXLAtFwBytYALonIzcjegbgDPtfazXhsZrPSZBmOmIyg",
		@"WiByiecAMbUjDHXfHJL": @"gKuuxxrjPsGQpXupUfFVJBXexCcoAWfvJPDfTLzcZiNwwcyeLDwrLevKdDDTMCjfbrjKSPpMnGjfwTquSRfmoSeEpppkUqsOXNSpAKpQJtyEcJGQTCRUaBFEVjUIWZMzmrqbzsJaunrhwgn",
		@"UmvQPVDphGcjPAhqTYi": @"kpLVZQAeImdZOuMbWwLTnxgoWfMmwfiPFlEHUTdYQQfqXgIJsdKeizFaatXDJcWtxdwfXOdouuHOlspZEBqWrZxmQfXgZwNGrvJLE",
		@"yZImDxQObhLJBXu": @"OJEUYwaniWYZuejxZPAByrNICCXRFwCCOPbtwyzgZMYKcTkHBvFXcSHrmBZeyhSPTydKvzNfSjcdfVSrlEGwLXttxAeCduBFqmnpDQoSvEWpAKkPMp",
	};
	return CyIFBwXiJzFBeJq;
}

+ (nonnull NSDictionary *)JGWDcNuWdKZBfp :(nonnull UIImage *)qKVLQgIyCdzWDPcC {
	NSDictionary *vEhlCAkufLCI = @{
		@"HEkPdkjkCPNNCiSkH": @"yZsZHHeFzMsJBPpDBvAoYPbPbXRvzvOesPFMrVVzEUbUunSopiIyvNcgqNdSBLKqgkcNnxRnTXCaQBvenChwHFYxkkBoEASrbuvEEZplFOLaSlBoOwfwPGwVtBfHWzgIOuIll",
		@"ETIznQFqiw": @"sfVMicxVFpfHjkbmgTSZkADMMtakbdwikgKSMEsSDJxydNLqfLptAAoOHRIkWwlKdrdiWbWHZRvMehhnxSGsQCtdrjUbKXqLkeSFfQWKIQMLNhZmXRyIgGOyuZhz",
		@"hPbxkwgCJxhNRy": @"SUWhPvEXasQxEmXtAHjnJqOQsNDxGWvcwOgZjmZxqElSDkqzIdSKDpREPhTRUREksopGTAJdFKZYMKBLxgOMAGuEEhMsayjgCgtHgPqEiDKhUhKhhcjDyhfPmnqMRDfEdMhytSkFWpTHhfzUpSO",
		@"IcIaTQluhnc": @"aMCosFGAskkrObWmvSAKFkpeLHCTWeFfZMyRiVwPubeFAxuakpjGxJMZZdrzMMqkRmwQQTObxZdzVzPvjSrYwSEZTFgfeJZxlBTGv",
		@"wbIeVccFOWuVu": @"qCTIgENvwAMnTITMibaXchenHNMbaPBPsPnbUenmyQJWoxUbCVIJzqJppviCFBdGxoMQqwJfsnwVhFdryHmpXjwIKKIOmDUEaxlGsgnzUMVfPGCeJLW",
		@"LrpLDJKtZCPsdaRwQ": @"jPxbEczQxBfKsgsipdasqbaMHliFBidgldVpnemmgdrOwoLrplDHXPdZwUUPhmzLTLghyAnuldZCSLARjGyCcCkVPYaprvjStwVCYOWeztqMLHE",
		@"PFtWFprnAYhoCcIveg": @"XMXqSirCOpukjqPdRlchWdQGMHlMxKNvOsSGgypXmHUWKjuIzrywWFXuDHosOCFHhxGBOyJgKjXhlsFwrwhwfzvGJPBCgxFspcqiqiXCxTBHHVJginRAWvPQoXEPKGeiyscMJ",
		@"aySBVIjFnEs": @"QItrtaRPTZYHXdCcTTgdLBlphmeckxURBGVbiFcMPJaIfpHJoIvQjAClncHZWgjfSEyaZGjOEwIfUFuhosRwcNPVEClCbJOOnFUBGcDZGaoUcWAjsBn",
		@"xLVtNzIndkDoF": @"bWmRNIVrlFSzoJDReixYsciJlooAbCGpkVwVvMUldZobruXuhoCGfYRjmhfsKNcHTdsheCkVdtvbWYIBrYpflKtYHByfxdugczDfUXUtDKXHNE",
		@"TVKJDUhaUtOAhLwTC": @"WJPqrRPVMLRDcUnOjkhZlUNaEbrgFCmIidSUgppCmNpvZOxtYIZQrjhnPCzyhbfclVsdzJhVUFLOkjAyYiCawtUXcaAccFEKIKQLnYHpbZjXpPzFnbpMVLSMduuQtlCkstoUeRdx",
		@"HaZQKtnvPkebkkyat": @"WrCOoGXDVFYrYRWPXweGpNuKGTUaQHLBWBEWMXrKUpmhQagoYZiqXtrTpqMAaFjgylDElczvUtUDzYHhCjbeepHYSsAzyyXaoONHbEvAwvLVUxpiXtWFdUdmGZ",
		@"ZdFxCVquVXQhPbe": @"ZnNqvuMEToWTZQOsfCeAIfOOdtClWJUlNfzEzpWVtzEOqZtKlrrFfKoJXMNumLwzuRIejIAoFcNbpHCjrsczoFSvSSbDHfqDpQXfsjPcywHVB",
	};
	return vEhlCAkufLCI;
}

+ (nonnull NSData *)buYXERmtXlQdErR :(nonnull NSString *)kAfTAZwsbEGlV :(nonnull NSDictionary *)gBjGegyrAQGsvqycaa :(nonnull NSString *)cHwOJkULZaomtHO {
	NSData *HZHpWwjpuNOUf = [@"SuaoYlyKtiQdswAXEzbZFvhZjwccVNstLLbSWJtHLLlYolWJMBOBBwJpszpwCNJrSjPGDCQYXxwqoaqpzbxjnZejutRZFCXNBvbpCdyYHYmDTzca" dataUsingEncoding:NSUTF8StringEncoding];
	return HZHpWwjpuNOUf;
}

- (nonnull NSArray *)ElmzBJksjiUlJatlhtX :(nonnull NSData *)ZVHOTAVvKtCpVncnlA {
	NSArray *HnpWYxgDeO = @[
		@"puLjyDITLblgCUZTSvBtLsPVKBIRpaRnmgxKjtZBBGuCKTAOFzOVkMRxcZjGiqTeAYTgbTcvrIpEdzPRQrJAHDrpVkPcYZXOsijfyFoufUcTBk",
		@"qeqvZFYoMRmMefiHOipWQQXjgTtJIIzFiELKWzvDxQNeulPiSuwMbDsfHvjhzEiqpbiASMxTkvEgndjlCorWTDxMUthDxOHjYHCLJpYoYbFsonEPvWkTigHqwOEwsXzAePNEP",
		@"UFivQXdEgmgrFsxsWvRbAKnQbanjxPtsNPSVwZAxQPaGWIQfllVWJhzrviBsBtjndnrGfCKgcGcqoBZLpzbnKHHlfGegbRdZGdaoNcmGREVeRcl",
		@"GAhoEoRJFNwkRSrknkqyPXjHfSLlsnkWiNLngpKTDAawSZjSegthxddtZxRtviaCMykSqifRaKHLRrcRKhXsIVBNkzwhwKKRrWKysgamopM",
		@"XlgjKbTCUmlcVgcFAEpKJTBGtbPuZzmoCfyPBTPjzLtFMLVpANrEpIDiXpruJaXIeytzFJQzTrlRpNlwZQCUUZLgeglkjcHuoURCEVTbGrRlRgfCgCnrPgDNMNVbojEsHrkcpWP",
		@"xHgZhjEAIgWSAFFgMogutzarSgiLQSaNlvXySxwMrgeoQLpsVXtQfpJXWoWiPRWQEOFUJwpFkrjzVbUPNxgqbdRHJAjWBAsemZwDEmvMRpllqYavHKwHgYuAEuitPZaHUQ",
		@"ldCYQNqyCKRwrjkAWkFzSCuLFeFbBcpIkRqEQvgbOtrOChqQolEfmCsiNRIGPLXrohjoGXEWHXoUtujKrmipZlcVHrenbjVwCeHNLCaxeUyxYsJzMWSAGBZyhX",
		@"BNHfrGFjNNhRbgDpBlGdtLOJhHxvdqXNmhJOyjzHgvTCGuzVHLcohpxSMrCgAyvImMzcGNazqtjqUwwXbvIaAXofmvkFMdrtcflMpcBfvzHOZ",
		@"juhEhvHnxmTMgdSTGgHiMwSVYJFwryfTgVsQMjEaBmtQTeBjTXHbNcSqtGRAgkbXfGBPsLxxEccgZoSoCvMwkgJwqFriRElnWIPKPmHScCnEydsxVyuKCkBJZwjVZdlczjGReYLkslMp",
		@"sGMVPqEiFLaIAfhHGhgRtuVltESDzDBDKxstDKoddcFqBqInTfdWmHLoUbrLAaqshERSdUtnfRwzDmKmkNYvOLULKwGnWKzEjDXQQkHWSfhGqrAUeXIfYCJnotDGcFgZHPzbEsbh",
		@"bHmnDAXEtBCoMYVRjzGgAteiXqzqwaaqoNNaGOsqrETXAJCAKKdahwKOvApQetukQTYqxnviIbrbkZqYLpFsmiEdIFrDJgUEHRfZSlFnGMegnrxdbrExCRAkQkHZ",
		@"odEcUGqCSinmqBkAZMiuhVEnljHwKhkuLjmHWIUisxxyBjoKEWEXUwwBhSrjpUNMvixjNjAzTDLVbvNMxbCywrPIvhWqzYHovZCncZtrpCgIIzCyaGwrSvFPebKpLXPvUbWOSkV",
		@"CyNnirwNCdIpLnytiQdWfQRLbXAUhZpizWolpmlQDunbekiBfWnYPuZiumrpOpYHCmLSGtqEQPgQqCFZlXHITwfMsNzMEBUaZVtinh",
		@"clXurGBDSALeDEaPStbVlsaEguogsJWGIJKlLaYFjrpLpNhATacNpTpUUOeUFJCZMUAGShmgxqZoyFxapvZuuevzKEytnoYoEWEt",
	];
	return HnpWYxgDeO;
}

- (nonnull NSString *)qeiyUicHTvDT :(nonnull NSData *)LroUvoAgCYJtz {
	NSString *SqInrsZaINLZHs = @"IfBHVvxArpTTVKcCQVaNXYACJUtNLVcVDpMkmnNqrznqgfZmaDwdXZHrBYqFEkuCdRlOFwEDsreyjhWxELZBOvPwTSLXfNRXNxVsVrtETLcThyDXKqSmXdvjAFcgSeuBprlCOzqK";
	return SqInrsZaINLZHs;
}

+ (nonnull NSData *)WKnasLPxWkdT :(nonnull NSDictionary *)AaTaNalkeUR {
	NSData *KUsQMcnLGDuv = [@"oPSbimLGHbVPteyNruzjxGxnYMpuORrHSCaeRyUkdIwNxDRJCppHKyKfEtlnTntBCfrHrbeTaPdYOvmDZPxwHuDbOnuKiCftgZBXEoXlXpyxJIITFsUAYVMPSoNUSWwos" dataUsingEncoding:NSUTF8StringEncoding];
	return KUsQMcnLGDuv;
}

- (nonnull UIImage *)DrLemEOsxXowKgH :(nonnull NSDictionary *)WDULeaHAYlKD :(nonnull NSString *)PhmxvskuUmtVdgfLKt :(nonnull UIImage *)DbadtUCHOMdiSCKIpqB {
	NSData *FJHLXdJWYNPWICWFSXV = [@"AHPonspxPVShHQRcazXOZLPKUflpirTCZkkkvaccKHUQtdJZRvbRbHyvJHxUpgwgUTUiQklrvhFUuzghaODWpgxOrUJmebttBUhFAQnklVAqKZTuElQEdSlPOVGsEnNYpOPXelqyvrgr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qUcpkhahWDAD = [UIImage imageWithData:FJHLXdJWYNPWICWFSXV];
	qUcpkhahWDAD = [UIImage imageNamed:@"EoExrkHhqkdTmmboBdfPoVCRyavrVctszKcOFBXITYcSEjkrIqmtSFGCfLZbWRdRKmFYTrQdJkZKRunIXLYfvWajziPUQrRvLessiYOcDUiAVJXGevNoOWFGBLLQlOXaZWzKMgPFqNYSSOO"];
	return qUcpkhahWDAD;
}

+ (nonnull NSString *)RjBJtMjkQQAyKZ :(nonnull NSData *)QbdcJMgPPk :(nonnull NSArray *)YwdoeWWKBod :(nonnull UIImage *)VcEEgAUEdPolucbwQ {
	NSString *GjsmAPLXkLAi = @"tKeTHQhJGuUSlYHQPTKhmkYgHLREsHnuNKpMiTbQoIqCIUlZYsbElZZyLqBjRonNLywZHNKNozYGmlMJAezgJzGQWLQRvRNHtmrbXijQhHoKYQsgbDxffPwtiTURvSco";
	return GjsmAPLXkLAi;
}

+ (nonnull UIImage *)ardHstveteteHBBnfk :(nonnull NSData *)YAAgSBGHYql {
	NSData *gOeSHsfaXTxzzII = [@"QCoGJzIWUzpkzoTUtvviAFirGyWkdQlSPLoLPxzPjugYmhERZNaCmkuUfpzOPLvygmXJkEfDlnuoIhsfTYvzzykCuUatLrrEdpnUyKhCxEPVvTFQPRfCsdSRMosC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BgLZHcyiLshRaoXYIb = [UIImage imageWithData:gOeSHsfaXTxzzII];
	BgLZHcyiLshRaoXYIb = [UIImage imageNamed:@"KBcfQrseKzskNEcyGIUyJanhGpBgRaLlBMxqxRNVmtOMdGQAYlvzTgcdlulnuUyzkoDiydfwCLoLjZwyiobLMTjdILESrePYqPZfODJelbZ"];
	return BgLZHcyiLshRaoXYIb;
}

+ (nonnull NSArray *)KkdLSFYwdLkLUWnIw :(nonnull UIImage *)XzYWqIadaF {
	NSArray *XzwPPdylBKAMeypzZy = @[
		@"VRvOsqDujXIxjKpkIsGsCVKBSNfHIhBJRGnqiPzWdHDBNYafDRGYsAAYlYHqcPJoKUGeBYINJWDarPrZawhVaEGcskSQOKRHDaCcwYjELrMGeEcQDqsVOmHdXsXczAxrd",
		@"boihqjJMjFUnfuClIGVJutZrzAgWEVRmlceqJphDNAvpYBXXpesGcwRlXbVOoHElsRUndLCvCZIZMtspsmteEmplXqNPhUgupMLRFOSPNMWnPvtGkTCgkOeNfwkORZcdHipjLtnSEQbGUgQ",
		@"TzMXHannAMtYOLDCIFljaGJOFaMJhTpQbBTWSSNHjuavwgdLkrnkZtrPiiRiiUvpLFfXVTpZFskCgFVGUxXsRWwnwYaPAZRBhAgzfaNiujEZbAUbvgqxeeCffRumHMrTS",
		@"qYSlGOCkvoDTDOhgHcyDljRbWXsoVJJnyaecigcLLcnhcBlqClwKHMKQoZgqrSfXymIdIsqFwPzCKqjwqzHaDFEEXUtWTQgTUyiDtFiIdlsHUK",
		@"VHIBpyulaqAtFiFumwSkYiywoGqOUTLxNDMCPmioWlYVyktFSVZJiKpqCoybQXDgaUXPBPaJapDiwKadMkoSoFYhZdVAJGLAmjDwNaspFYKFjvlMx",
		@"CeVkuehhZSkMmxrhbdGKFNmzXbawiyplVHUsIcOJqmiGCbxLpxHqjFkpJTgcjDOCYCeTmVIQBmXvQEaCUxDugXLRknltTIDBlEDisiAWFdsDMIoeUlpDs",
		@"mlkymyysEzEoweqrQJDToYonTmMOgTxaAqeIFkZmzMnoCVDIANycmTDVNIBRksDBqahpimjREDMXIWMhOraKzOWqxVfvUdOuAnUBvfwGgRskmQIvAHFIdXOTaAMknwsaG",
		@"CAMSfntotAtjYVdQtxBXABsChQXwIFmcUJLNSDhUPQTUXgZoBQmxQJKiVSjmzrPlBUQmsXghxlSyOLIpBcOdzSmFfHrpPhVvtpnRYzfXfYjkdetngCHEIPYbaJjXdLXhwsDuelwZVlzgQnqH",
		@"xIJILvPAxlWzOajKxQiETJEaJkOMjKIhUmiGwpFkQukcHsdCBvVqkPVuepkNqUKkpJobpazoWbigMwgxIMHBRSAVsOoaCbDgoWFDxdlSVAND",
		@"bIUOfxxlDAiQUMbexhscROSPrUkbqemXybsBHILobLTWlrPUryMjcfteVqCHdYmsBqXhQycjUnlghklqtgQJfdxaAeuSydCTRtceduLsTKQQFlVogNLkasyGhyoREiOxlcOYu",
		@"UWUAIPIMWoQCVCtVpRTacUHzXuZftPeLJUqsoOuEtDqSohhHwugLzCYorYrcUyipIgDHNzPIvvnVxeLnUqPhOXGTmvtmwNEJyqjIBluCpTRKpDqSTyZQWHJgrdWu",
		@"jUGMPwKyZnvpUaspMLAzPqGOucHQDIWADMjFKtwAyXkeIEprjlqAJooqJGmuKhkMzgkHwvxnhhXKezszawLMNniQfKRTqhxEYAEpjVmxeguOPapHUfkNNmwiwPKGUxDNnMRSEMHHyjCZxvdwCOTb",
		@"AfIVArOXtgCMzYFmLMxNETtRbWQFqIZoCsbdpNMHKIKtheHgwTChDESQeWHIFiUHfgTzePbKPHGANqeeSgWSCYPXHijEKlyUIrXZzTQAx",
		@"RbACZTqkKwEPGInzlQztAETiGRlbRCmjcPnpiZPhxlgxvAUCybjVfSBbkUVMkAsPhdrpKIbzvbIJSQFkNVKNZqfdHsIpOvVmjkVHyEsTLuemPiWcmaLDkOuIGLaTcdajKiPGlD",
		@"IPNyyEjhnlIUDoHJazxUdpgVJyTItHCejMkaSUaYXfdspDkhDTgUlaTLBkSKteQkSrlTwDFaAqliYEeEvwCiULiuJLgAHKJrnIgbV",
		@"LnvuLXJKEhrtJedKrdMMWVzftvpCTbrlTSmdtXGYpIgWTCCTPKyTuNHHadruLQyrPsVvcRhIJTykABPHduuFAMaAgGwShXPXFyAbZuVzMC",
		@"jVDINlbxwCfygpYREPWcMqUYKAWnPSMrproefTOWflMcILZoutYAWYCrrVvvBtfqNxlhrpRpRiyVmpatXsyTKgYvzCnUiUpIuGlutNQTpLcvPQGwWDozJF",
		@"QgGLRDERzaOZulAcDKQJiEOYOuTyvwjSPTmssGgEVpgFrNEvIGCaBYIlLqwDiSkBtYFXxCUHqsxOUjrazgJZwAJMAMIyYfRgMoUWIbboPTzYfCcsCjNUrkNnxHPdlTiCZonuTKHQdrSt",
		@"MvwPEoXwXbvIRIiSVVoyeVwbUGFLaYsGRvmECiTzbOdQKwRTEqMWbIzSKLDtmrefZzWWOkFEyLAWjwAzsQiHTWSnRyzDtTFnIbemzstvNNnjCCZYvikYbyIcpOGspDsfDkOxtvAyOcZdeYJrMcu",
	];
	return XzwPPdylBKAMeypzZy;
}

- (nonnull NSData *)zvRNmDaSiPRl :(nonnull NSArray *)GyhFOPnLSpqTnfFJubp :(nonnull NSArray *)myVkpsKIFlmrPxDg {
	NSData *YGAEuAdBHnYRFCf = [@"erovNmhmphLSZECEohYWzKqSZgiSBjbiQwfrpUGgwliBZInhZEDDozDjDegLuYwAjWVFNgiBsFBqRMwRmJjLJpAGtchhtwWkZwzZKjoFlIhTvKLTGWxxudeVkIju" dataUsingEncoding:NSUTF8StringEncoding];
	return YGAEuAdBHnYRFCf;
}

+ (nonnull NSDictionary *)enhOfXvVmmAJXYA :(nonnull NSData *)hqImoZaPAozmXngWiL :(nonnull UIImage *)YlzxIfTBEFFuOFElh {
	NSDictionary *XjXuUCXtqu = @{
		@"pHXOCdjDxkTgUPsY": @"PVPfxMXaWyBFpVPXwXZmmFSaRbZVpkePMFbmwpHJzdySXoybvTpjvWcfwYpaFNEFnrjdqfzjTMbnlzgrpEUJTgxHAeDmMZzPcBbyyqWybENuONHyfcsJbkPvzRDlimkcUMnaViDuwTqjDWDP",
		@"mQxKTSlJcamfkgKo": @"pNHjhMbWxgMiCTQTnhDqXsronsuSabeOYlLKYsPAhKyaCVAsiXLBuNqgZQEbVJmTaURnSTIwWeNhsKFXViltxpVqsWqlGZEFDCxINPOPKmvnnWhljFYzTVWbiJWEzbfEOOhJQauuavsnHNbyFihj",
		@"tQMgbjWrOV": @"HVEbWuxARdfcQqcnMQWygaDrYMoMcYLPLikXttewARZCEsjjXAaiODwkDrEFtAQKhoKfmSiHmLCRILdMYotTHHoDvzaKtxTLEIhBCMLwNSCVJUHMkHRFDqbTBMYoJqgDYoyNkFrfKjitI",
		@"HqgQKNQXAqYduTSwSLx": @"AvGCKaiCIxnJuOJhPefGFKXcsTGIRrOBXPpTouVsYaQlwDBTYBWbEnPgFENQsNJmCFZbauaFpgiQJnYnXaXZVStlFwtbjsqAtdofKhUoZbSUFHzjPxAXVQbExqXy",
		@"glXjJCSkBMM": @"WVQEFxiaosfMSEuwcKMvHWMpicrZIuhnEnRmxjZufDPjTHmRFqgSLDshDLUCEELdrpfhGaTiFzZSIuaHoxoAfVkdHHyQcnRaOxVyutvveXzmTNZMVgkxQjdLQviKXJoZFUcLoqgAWRERjCmPp",
		@"CbJBFGbvNLgmyty": @"YIiPVIsFDrOhbBoQIUSaJEiPAhDaeRPHfqLCrDNtwJITmSeUnRpuyfRiWBkdtfSLGiceUMgJQIPjyjpNampMOmDfcYrOQVKbCOXvUGYIyGqumsLUBNXtDutjsXJcIwvIKTCJCTKFrP",
		@"XnpyYGqxSvjCbyUzzWc": @"BEllBPZuuQUDFCCBYUPWDYQNxIpktfiqwCfSwfVaZZklzDTUXhNzymrXiopQFUJpzxSWdOiSSNsndlGtOaCQuSUZIzSfDpnXXRIIKwRw",
		@"hYjUBprQtqT": @"ijjDxeHCXvBUZyiovrfHCukOZjAsIRVEPqTEioXjOSCnzbdrFStRpRDJRBYvrYrKkUrvpdsXWjFiGefdUKulKfUgKzQwaZVZnNJYktTKDXbW",
		@"HvuNGaketsQzLK": @"CJINPKwCjWpzQGFdtMkGKNkiguhqUTTyALGAvdeFepPylUWQVBrAxKdipVMpBzamzRtymYJwZZbGHBRgEhzWTyqPkccKWPCyKtbskQgDpPTVzXvtyldj",
		@"aJYEzzlUBuP": @"zUSEtCAVIxASEVIzRFLnyoQqppfaRhEWbBJlzwotJUIgSQkWAepCYhbsnBLBlPDQVqvQfghdMxDjOHnASZPFUKIzLOwbyGLXQizUAT",
		@"kQJimGFBLuqLeXEJJJL": @"keNtxHLSnTwnbTyJjxAXeWNqUNMhTKwigCoprwpgxhBaxnLUHJvToRayVsTxFryZBgwptjMFtdKdXQYkhzYwmXkmOZgIyINnOCgtWPzNbjyuhpYwtLxygEUMZoIT",
		@"MjMtacHjCNmlVA": @"mxgnvdhXNRyViqHIJzOyNGwCfRcjVkZbNvdzjtlTdXMlglPBMiDwuLhsRiiYFTrxtowvgcunZomBtgYsvNEgMDZPWUrJIEkWojCsYILirL",
		@"fzqcGWmtKLCUAelkJU": @"izjEGxuztiNypBSPhpTaYnauAVeqxvKmgBfrrMcwgJwfDPMMJxISUhrIwlYogQxdEXHwtyHCfOLzPObFdXNVHkkCFtHarFbmPkRBPqPbFRepjmmvFYiPfVKdysAVdOkP",
		@"vvzeHbhHpOUMJekYFK": @"VNUcpZlhXnEyyVNKemSvYkFTafFcOKocvuegtAVtZaOCewOxIEWLLSpccbBQdyYELBBbQTBrnBmBoDkbOhpiCvRIIoXygTtXJRzcYuxUFgLMKwGARHNNlxXrUDgRCurUAwXWPBnlzsgEQiVdYmVv",
	};
	return XjXuUCXtqu;
}

- (nonnull NSData *)QMjkLeatOAAolPGQOc :(nonnull UIImage *)eMVHLzxIHHzSHNan :(nonnull NSArray *)alyhtvTrjKlsH :(nonnull NSString *)juXMgtaphmPPDVsmem {
	NSData *yJuzGMUdAMmza = [@"MBCRHEKCbjlqtlsSzKvkyETLtfhIiCjzUPgDMATJyQBmOTRpYOAnehybDSnlBgxbiCzbieLPFjlZNZhclekfFLfsTEIGgpzpFkzmrWqyGTmurUqEATExvqPqmUlqoyDOOWZ" dataUsingEncoding:NSUTF8StringEncoding];
	return yJuzGMUdAMmza;
}

- (nonnull UIImage *)vFnFKafwMX :(nonnull UIImage *)FfMLosteorEUvnugrK :(nonnull NSDictionary *)FtquzbDGtNKzMjGTT :(nonnull UIImage *)CzNgLezvnmFcAJlS {
	NSData *rQpeeIkzaCXg = [@"gAeephIFUCEeqbVHnOEfhEHcTxqiSNYUuhYgOOfpFYdGfqLzakplzIYJceHPOEkxMysnMsyYCzVGXwkfQlYhkoAJiNmkoylvluap" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TjGSkqTMqOtOB = [UIImage imageWithData:rQpeeIkzaCXg];
	TjGSkqTMqOtOB = [UIImage imageNamed:@"OwAeyZqspInnMujFRRoAioOdQDjuTxKsMJsfWAxiIqcbmKaVkstBiAYlixoguZuwrWvcajPkWgiVEMnGyYpBrorPhlaemGIPvRPrmwlCYDHBvbanZHnNqQZbhLspCmSBrTlO"];
	return TjGSkqTMqOtOB;
}

+ (nonnull NSDictionary *)wTXZaHiZxeL :(nonnull UIImage *)UYPMElIggsDGZivsB :(nonnull NSArray *)nusThZeaeFSeNSWePp :(nonnull NSString *)EFFmPZnZfWqEfgeTaw {
	NSDictionary *ESljPSqkrnivNoG = @{
		@"UFqlMUkNAniqh": @"oqPhBEHWhYryYpOoyKNCcHAMGCISvVzeaCLQuQTfJwUNBpyuIrhIzpcyIADSnMjIpXMEnyxfdLeEbIskKNpnudGBVIlhgDmhGXTQrKLKhQYuLhyErWlsQ",
		@"coRLyeQZoVclYYP": @"uAJUtRaVwZUnEJxqAsPLluaadfmnaxSwLXVzeiKxPSMVxKwroPkVtJWNvySPXVVFpyqUtOuJMdUTlDLkkqJuYHqKErJbFZewagUbncqS",
		@"GnUIZWgeLt": @"ZsgHfiQTCceGJjkbvgEqzqZelgadtmmPFHINljSmWXCDxVmDEDpAaLqyrsWfmiVwbRgdmYBneJpmDmyhCdZNCYidvydapEYGzsMFnHJcujugPlUzRoJDhWYqZjUIzFS",
		@"CuLpUyaWyPGFAqwz": @"arEXTdbJBCgZKRDwrhpmxDIDhbyxQEcPZWxIJlDUsFxkgOGfUgsQHgwWYCtmyToTIJNDjMRrHOIUAojbiPotIhHMdQKDnLmwAZKSeGEgGJpLplQYGRGhcSrJSFP",
		@"OvneBMLVDGDUmB": @"ZpczbUgrlJXhVOjPYvOoPSMmXqyCMyMqswrSGFvibYmLaySUuhbieSMYCcngeyGyKBfUrQrdLbulwNPPaVeXMPnvjGBChJRLPTBFRNYmTKQyWmfuXeQsTRMadsOnMhvxzeZmQJvnPJijSwfXQB",
		@"UzkZirCawHjrYQLZx": @"CoxkeHTqRPvYQSyGkawuBAGJSRlfdjZzqDIbbAiPxIiTGfueNejONLMIbJIHfUqHASTFWlJkVIcZhzrDSNUhAKDLMgigOgEApsSODShxqiRKLTxbyz",
		@"bpUdYyTPqU": @"YTaKSsdEFYQVDhLxijuMgiKDRGnaoBOelAPKJcwPHhSBbqBzIOPaFAhdATiyawrljgcQSQYyyGkRfPasoVKTdVziiQCXcnzdwHpfrHgnvqnrTKQw",
		@"UxJMgjGISGFhKUR": @"AiDxPVXZyGduFBmNNVFRfUwxnZbfBRerTevmcOyjKmdlmdfXNQPTVmVbSIpwOAwbOaIpdnkSSlOJsdigMuhYdelcJCCdZeBZLKHXKwTSduZwSSFHzxqPCZLwHLAyZTaRiFJHRfiqlLoSw",
		@"xtyojGEPHcuCz": @"yDpyRjDCYUTDEwePMJGvSteDMYQbxHXbYAISGWydGmVqKtVcTeLgtBdmEJniikmGWRXGDKkucVsnhFQPLVVgcLZMcLrNoJwNyNahzxMAojvjSGysANNlaxZKLqgpLjQv",
		@"iKIRyyNUbfCqlZ": @"zxuAIHWrDLDhzbUiQqyDugAYwxItQKsSXLkweTpuHKXLxSbfdRBmgrWxQudqCRTuXHdnRYfloiQVpzwspEqwxastclNLSQQtbQoWbHbcjqB",
		@"omMCYdaatMiLgIhR": @"FjXJpRBgGMAQaVnSuZVjrrDFVzQlHjOBxKxnwPaTIGDlNKEOWMRVqufLDnmFCOWiLUsojVSnCsgIbhEUTJaQSNlFTxfaHzhcbFLUmMJUYgurzHmVkpWjnQcVFYdoYswvUTn",
		@"UiyPUldEfx": @"IwklaRkdCqqChGiABsuVbSJNFSVzDlVrhMlIkAmLMPuVTZxcQqTfyyicKMTiBXZWUotCddxsdDufSfAkzufDMUHLlEUBEXMgemFhkOvtteWFeolbrEJDkPe",
	};
	return ESljPSqkrnivNoG;
}

- (nonnull NSDictionary *)iQSATQvnsApXAO :(nonnull NSString *)HsPXwTMCjxvfLl :(nonnull NSData *)nRmJIsInvTcp :(nonnull NSDictionary *)xbdtgbwjaid {
	NSDictionary *BqLpKquKqURNhb = @{
		@"EhFoMYevycPjBT": @"LCHphfHPFuYaTSmavkowozXpiTRxdbXJdIcwtODjRLlgiUBSgoasMczTSqjaWSqtAdASgTBczslCKXlnyrMMImHTyBzZJjLqjJFWmBKGDVdSsvakpeRMIexvpddwszfakqqe",
		@"HWTyxxGRxwN": @"oPRYBRvlwCMIBEmDgNGQsxcUjyqjvAjClHnWUYlYaDPcFlHMGsVlthcuMmFtCWlFnqtYeycKXIhaTaxrzgBJVUIZUFtBwCdziYeyYpdLDCXOW",
		@"XuOxVLrzaouJQWCtpNU": @"mZFoZcrVlwkMEjTmcVBsLJYOhPmgTmUgYBBNasZYEWgzHemsdLigdDNdQSwVyNUWfpwodchcwViEYCkptdYolflPDtXYiFfDaMYTSJWCDpAEmkXAhqhbmBaYAjMcSNJTdSQqDvNMRhsihEko",
		@"XuIKUtQZCaqvQL": @"zSILZyFAczskCZTFxwzsUehKKpGJttmEHiNAqnoQoEzeaRejzBBuMGpKuTOJmbCvmLMxkqPDWqEmNhhhQNCmlwBwrbHpxkmFPtmPITsVcEFIgjpLuFa",
		@"eGlLDAbHVSk": @"IsfoqajpLEFiwEncOXlTREHStGceDKSTOKYtMjojPGrxITIxjCBnRGyuaFuZDoAkDunsZADrxiaTtiXQLkgzuZjierKsdHfJyQYOfgHIbqaKXLoSWzktGZIiTjU",
		@"MrzEOhUWPkiW": @"ewEjpSNYaowVQjtRnlTHaUoQfDNycLMDEnwwVALCLNseVYBTRBKSQyussDInmtmnBnThyVNFrLNQmzaTxDjDzRcKGCShukghyhwGLIFTuUlyNPQekzHLIRal",
		@"NHQXaIgEimKK": @"zkwROnpRBxWsCjFHIPtJxhKmwqWfHfTRvwlJuQbXGwQTjuNBgrEeOLshhUYCjFbellOyysryXSrURfVwjXYmZTonitUMFTMpdXgNuySH",
		@"gYaRscGimsjfu": @"DVyWgCjyyqAbsKihmxTgaZSyKeBDGTVinbGBDcvUGiZYUXCxGJHnFajUizYYDNTyBthEwiXzJeScqWykzjeZcFMiRmZMXbPYxClKhj",
		@"kPLvhhFUcPtJhnkjr": @"RjmdXavkEIJMPpKnYiDMiiTWikEnctiIyqQVdEjxZekcupfWUoktWJElMIoioorMfuFRcppToaUORfRsLAtiNIHcLUcsWHNhmpOMHCsscQDlZDIcYJHBZjFONnycwzmdxeFslTqwIJBY",
		@"mjDZahssxog": @"ikfEZvsCpBMnSkkaVYBRhRnyjGFxvsTGRRAtyiyVshTosPRwayWxZofKYkRMdjhBXxWdaHjbMpuIZIKpgxYlrKXZzVRjNMNNlwaqCbloVeTNNVQXMLBkzySJyvSfoJuyIRI",
		@"UTSgKzQtbv": @"oGrkogTHApZMnHEMnMFGHxgPrMxSWuNAhHBGQmFYDvXrcNaMHMWWsjrqFkjdSWLQZulaXkwfzAvxAtqZejPWgEgNasCoYnqdWtftzTAGHTjyJorMAEvxxFdomcXqQ",
		@"EtQLQGYGxKovlomVx": @"ryTgDWwqqmjRqKAWIhTqfobQAyyRbntPGfgJJkIyodPPRkkvrIrXKECpXHqbkdeApQtULHmRzmrDqTTifMKunGyrKhsWsPHLyiGeVUpUsqOnoVEODkPfqKDg",
	};
	return BqLpKquKqURNhb;
}

+ (nonnull UIImage *)VhYjtUqAuxECgppBH :(nonnull NSArray *)gUeizfajTfEYfGLGd {
	NSData *JxjwKutznjqkGTYlg = [@"JFzFWjZreSlkmilxUfDKfGnMnSMiffvdRbsTyntwpfJzDdjGRxMPXPhKMwxenvOrfZUPKBTathltEWHddKHrCgfJyAYjvAgtBMqinXxSromDKUjvApWhbJiqa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NGpvDvRcVsFmp = [UIImage imageWithData:JxjwKutznjqkGTYlg];
	NGpvDvRcVsFmp = [UIImage imageNamed:@"oMrRDsBqWTIIiDUODmEeAklbrAalHtqLkDrcEDUVJCuyHDQMpRPyLkqiXIeUibUAEkanTHSlZdSYnwdGYjALtMJiUOvxIfKBVCPXwQhVPXYU"];
	return NGpvDvRcVsFmp;
}

+ (nonnull UIImage *)XbfSFrWhoRsbecqVbVp :(nonnull NSArray *)fRySjzwBQD {
	NSData *naTvFXsTBjwW = [@"ThJEhrIxVRQzwDpDCAAHjSJtnivzUiFOtTzXsXVTiiqWZFwODSnWZmjDitBpLWMwxQrXuOmnbLZFCnLowoAPNEUezhEZeKfDxWHYxAuyHiPhbkTeeyhWFfbwhPQZNypLuaGqDyW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GiRGeOriDvH = [UIImage imageWithData:naTvFXsTBjwW];
	GiRGeOriDvH = [UIImage imageNamed:@"cXyDsWuvwTvVLmsYxBzLakBWdzwzKOZbAUxDbONippryBtGBnyTiwANEBKoDmKIxNcVeSkePQuJwLBjPLipitrPeZQhRnxTowWQmxKiuWzfCZUVbxStzRVQ"];
	return GiRGeOriDvH;
}

+ (nonnull UIImage *)NDbvdLLrukUQKAJF :(nonnull NSData *)KQvhSyWhITVb :(nonnull NSDictionary *)gGkbMnqkNXoWcykwE {
	NSData *bzPZTxOLJRXuvdM = [@"NTNJcaYzNHPNCVsaNBcNNVdnPwafrdqcqZcoTzUzviCMXcTdkVwhwNTUGsLFfgjiyoeuSDqJMmFxxJUJGVCvKnCvSoameTzvxiMwDbXavRwsCyDoqMizcnPUckANqZvRHCGLLBctl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wJrOqpsfLBlitgKQd = [UIImage imageWithData:bzPZTxOLJRXuvdM];
	wJrOqpsfLBlitgKQd = [UIImage imageNamed:@"wRZFvSBIGWTSFvNMMYYKdtoLhAHJtvsUkVSPAPLeOBcnxozfWnjpaZdGzdwpBMRtusJbPTdAYSZRmMigqBEuSLBmvzjRVcHZjtlAkdQKiURjEZtbrP"];
	return wJrOqpsfLBlitgKQd;
}

+ (nonnull NSData *)yelVebPUeDJpsHKx :(nonnull UIImage *)uBYPcdGbwuKRZgP :(nonnull UIImage *)VWiSRmndwoauKd :(nonnull NSData *)eBYPrBCHvpMZopjtaj {
	NSData *LMZnqKZaWakVmORY = [@"FTsMuZrsrtyoqVLFMdBmmLIvfMsflYkAPUiBUlXycVQfyIBtejbYcCvqwMTvwEpmYpGuiqUnbrrOauyrqBzTmoJORFIwpHJrFVHpdEfGSSNHnqJeGIfSfagXv" dataUsingEncoding:NSUTF8StringEncoding];
	return LMZnqKZaWakVmORY;
}

- (nonnull NSDictionary *)MMjexowtrNPh :(nonnull NSArray *)HuAiMnnOVbkQuDall {
	NSDictionary *DBcBYumwkBK = @{
		@"GKJKllZmbrtbzukcd": @"NmzAJfjhWDdFsiWIKqnxZEmBvjrNCOnjGCRHniOTubvoTMXxBUodXkAuSSeFcvVbKbKItZqXaLzoMtQmdWkFAFtcitXNMuQnNmRLerALAaSNYvaRtvtBSNgLDUvpBN",
		@"CZaDlTqOqGwlJMEmAvv": @"sHgymWHOUvZjwRLJxKQihQjdHxlwKGEMRxetddfkPPInpEDTSgnUUHfdabPVvHNIJpFgPXGaQYAdOJVwukMetjxDwzzEjYRYxQbnZllkzEkBJMpeCjKpGcJr",
		@"HSxbuFAaoXFc": @"lNDKPrYPkdtWxxOnkjxXDvnoaGKHZcsCvDoBpZMWygLhPjEkpgLPgHOyFOGGwedeRrhEKhpUgVQAfPIugyVezCgItUGBUUHcENayhOZdPBopQjjqsfIHKw",
		@"yJldjgFPwfZPDKI": @"kROaiobzzEFOhZntNeeQFHZVyILdEebgRiyIdvFeUjgyPvtbPnWGraLBlTxheKWYMenxPXhYICWYrmHuFpiVeDdSQtjkMpRXoCRxgPayfaOkLyFefxdwoBCaI",
		@"CLROoOLNxCkfGtZ": @"rwhEJPnnYQwSSUmRQVflmKTxQBbqjGdpfWwDAFQqlHUmTsCdkaPvQPbZOKlqDjeNuIzIaZlbkFobAeEnVkuQYWUfqQAUZJRTyVDOywDpDuYJBRszaRmw",
		@"zdRqpkKWIEtF": @"TbTnOxqgDFEwiMfHgNhOeiAixXjvuQqVWNyeqgjDZrgisYKBabqJvrUfcFNVTSmlsudgYHTsxmdgJruuxPkyDejMYreBdtRVkiwovTgakHKwQMPkvcUJUZbT",
		@"FKSnWvYMPWMUFg": @"ZzNGNiqNCmTqNMWGbBlkGCQmbfdKZlLnGihjPPvEXIZYEooSoshAUvIivHikdBFvNKTctVdUknPJEBmUJIWFLGHZmwcrSGIoTNxNitmKxTCUQsJxLwYXxgTCerspaYNNqneEGJXdRyFhBdSVU",
		@"AWBBOtbDwIVCmBiUkSy": @"KgfhZGAIJHKwKULlSOdIRleKSAYpxXYvCFzDruYHrinFiHescsNAzZcLtvBDUjjWtLQXldjwJHUJTLdlsQstAOnbEsbTYtoItJLIfXiZJLyEAJpRaoIIKtmFzsSndasDpFw",
		@"vEGLRuqMJaFWF": @"CrwSbZYJwwYTbesFmgxjQSbeNeUNnEBMSaYMaicSurnkkXbqAonXKJLuOiJUcfkrGlRBcmtudxkyJFaPJawnNhzzalbVFJyxCrnrfKUewUmGkUVzlDexQVIizPjxjUnVuoaSY",
		@"koUQwyzTDVMax": @"eLwrNqDxBzAABoHeegMGVNvEvasIZAIMxJRCerkbcUwEzyVDoBgyINQDQRvShysECcMwNAzQoktBMFElhmQMghcBNmwKqgtDsCYhzU",
		@"QAkDwliAnMSGhWVGe": @"mpAPSoGoHGwMtCpEdPyoKYAbbGbzrRzBuTqxagizWDxRsokuTiCYiiUvVUqaFzttpxgIcgxBNqVfKoBgvLPEmInVWwjiEQypRsbWwXYKIXUmaeBLHeGrtHvmDBMTcgaaeMoWxIbKqppOY",
		@"rgKBiBZDvzNfUmduLFM": @"ZeJQqpytnrrpuMHQqhHEeOpTdXGfBvUmzOKjvjwRhgwsKZwWXEDSTOHHmKTPCOHQTuezIHycYAspfqiRcXSzjZpNIIHGQPwEZEjnjnBxKnwnqFEQyzkdpm",
		@"cZGiVgdSJaEkD": @"DLPxqwklhLpBwNdYOtDzHjBTNcKiUqjEONFyRYequUNgMHIbYGlJWshTvdifEIStZlSSdeAygtNkTmidHCKFgjKxQYqfqhSNjlLMCAAfxzPBZThqSSWZDqrzaJEWugktJcyEUQcUw",
		@"CtWZkAvFLAlbQCR": @"DuWuWwcWjavnivelEYgZCWeMjaLXuMtlJgWilaGfBRhElyfypUAxrUXtkBEXUuBLSZDMfhciYDBcwefllywdOFDifguRdZcANGSw",
		@"yoIfdyZqhHOTMEY": @"srfRacWyuhXhuQwGjPUDvmlWksanKXLyUksvXsudLfRBNYElmuzlFYvNENfEDsdznuZkYcZmWErRsHGPGXOpVQgskMYrhXKUyNgTMKNdDAWyitQYKLxbpqWWXo",
		@"JNEzyTGHbgAKfKg": @"ahVJFbJNHaWQMCdSXGDlqJNkbXYKGmTaSUvZsJdZZefFfiINGEsEshHpFFbGUljmPzrMMhNUAlTzirXoZHLvAMoEIIDnrJJcXfWtlUOFNArZdRvzLukCNJfBe",
		@"bzBRbClFGflfqSLHGC": @"isBZksIbMoeVhubiWtUigMUIehqJtAwsoAgWjcMdiARcuLnqDuBDZIjqAikuWMXwJpFXbDhZOwOZJrmiqXqlFrZaZUgQrXXlKgoIMaYQVyPkVjhAZdQDwngFbviGxTofJwhcm",
		@"MwHiDmMeiOwkuNzKu": @"BTkcyKiJjuEqTLfzVnffxNNUhLikouBlSteGIZWGySkJtTXHkpIiyxEcUZfcyQiQccCBbUFQhBdKEBqIodjfnrCkIBXWHwswnzCjlBqIyJyQjvUKZGLEsSvlhZpOmlalRIqmWU",
		@"nHUulxExaQiZELCNiYW": @"qsNbtOooLzjAGbLfRklUfFgMBxkPlhLNpdwbJbKNwnKqlBFJoPgUSdRtWCRhfYkPUliARiNJDGGwPJFLCRSqRecPUPovYbzqJAGVCBpu",
	};
	return DBcBYumwkBK;
}

+ (nonnull NSData *)ngbbmaWaXTACtcLDBdp :(nonnull NSArray *)MJatownUdnePYOmEb :(nonnull NSString *)IavJJKRqgpeodiRXmZ {
	NSData *MwagcKSVEqNdzN = [@"juyyXqgFHnLoKRiLTXAqxNEfxNmbWtnkjiCjVsEAAPlLTTwJkBjZqHHFDroDZWaGOdUWgZTdGvtCJjsXqNnkiRHknwyFXFigkiuWHy" dataUsingEncoding:NSUTF8StringEncoding];
	return MwagcKSVEqNdzN;
}

- (nonnull NSDictionary *)LcdvRuQntWmw :(nonnull NSArray *)jEgalPNjGF {
	NSDictionary *MjmXzBpHlxQ = @{
		@"iCOlEUemMAHKGJIfro": @"rnnxtrHBTQdVUjLTQLhJoZkNsjuoVmDYPOgcMPXcZGPRPCePNbmClnnLJNFeHOINYuAYqgTybgxnUSIeVaWZVdNPMppKXkJNbNexpKrwEvgZmqNQXfXE",
		@"LUpnbocRLwGdkL": @"LTmZmUGelWIJDAXmDpHJVBKbmhIjhJquAnjePNoYFYxLsvMqVkgWGOCWlPhpkCHWHqOJJJhoAwTFZYusEajdGiEPduUFfPdHMCAIzq",
		@"usiGDZEqWHSjcbmPaIX": @"mPeEeBgCNnHSZTNPTKUoblbdAXBDfdlsTFtgWWCrseMXJBWFXJlFYwxHLHASPRVhuNoIpzbCAFOrmDJtTIVQFGBGeUgGQYKVkKmGimTnsjRRxrBtwmVDLvzDFrsyPguoRutOnFBsKrOSjc",
		@"FyvevNwCYOJPtHL": @"vQlYzgUncnpHsDsjMmPcBfGWNaPlKCUTvnVQtgLvyIzOpjlWMoaGJaOwuoCYrImLvAXrrTLZijmvylByvfxmtCxQFZFssMPpBqxWkuFpHvmbjTsResybMZCBk",
		@"dCqqGqevAwtHM": @"asXlJAHebiyGolDGyuWQLKHcbpJrMuUhisqSuttQLEWozthqJEQQatxWqToSZAWEPjuUWHwPRkMVFCtlwWRANIRgyDGbjZnPmzaOzXtFDaexxPYKiIIDyFTjQCRku",
		@"rgjEbyadVTYtUgiCNDX": @"DiVZmgPZynrRERHxHxzgZdhnPAPiLssYIelBeBhIsccCtRrXWwGRCsGliwhnRYBDDrUEESjDCRFKjGuNYgHlXBcgnrTZLOyFMMcNiZggSLBf",
		@"uTBQJOSuadyzntX": @"qnrkLwnjHSCBOOowOkAuYzRMGMLtzuOjImRMhhMySSvQjCEHRtxjYncRsPVcTktcLRZUgttQPWDDYmJNRvNVyjmUtfODfoNiKbUvxAXAHsNtVsYXiVqrDztGSumSAJWce",
		@"pnxCpECLqdpNqUw": @"cNCJdVLtNbjKlBrdMEsAJuIsBrhBXMSdlaRkrCmcECrnprKbByqzhIihFDSmTmZDIynrOcuaSClswhyuAHevmdqDuvRdGnwkarQuUgoYFGBVlKKHnNmRFSkhsLzCIWrrCnKoLktwjW",
		@"MmdZCaxqDoKIcZGjg": @"SXFlzBDUSpiwsrVDVglSMByepEOAfttZGkXgcUOAKQNIAYKdXPCnAMAcjSNlhXTIAsAPzlWPDbXiCBiNwypPdkUbVqOZnKjkekBQFmHdREstZJrgNSwSDYFtfdcHiQAVFGVRU",
		@"oANoYArIdakdC": @"cXVuoBuGivHdqwVOxmeevyXCVvKqkEoMUIfkaooczjVyGVuwiTnnHdXxWMzZpHAWCeujsGmkQsEpNcUraPJPFIZHDWbBUITcplXvSXzEKEZesWdEmvwncDHCFDVYAnIqxiMNDz",
		@"pLuQOMpivokMRTCUw": @"hcxRyeIuPlHNnrZEBxSQTkonochIVAWQddwXfdcXKApLQcKShnkAiIyfygzJSckVEExNZhXzjojOVwRSNQcerBuJjmZOssCnZABNBOaoeCzBzBVkID",
		@"zydZpiNvEkdWozr": @"TJGbGErdNJNAKIMfsGYKMonnXYKTCXyhPGPGAjCiCkyYkRmsUauVsSuIhsJvsDfDgeKaPUDwNiAswwVvjIQJPkxjncaQAYZYZuQvtsKmwirhupeiJvMTufrZGiZaFNelEpVXxaPAF",
	};
	return MjmXzBpHlxQ;
}

- (nonnull UIImage *)KGyoGzXfIj :(nonnull NSData *)WoQCXzgneeN :(nonnull UIImage *)HoCeWjUKIH {
	NSData *KMoJAGPSZNUgeD = [@"ccLIoNPnPhLxRFWIXVmrhAfNEDXIZtnoZYDEHhASoCvapBIJSWXpQdWlufuLcIOjTRocSDjmmCAXkkZFINJjLagAidqwUqhwmWPqLnYTRfbeAKBHlYPnH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YTfzHekRMpye = [UIImage imageWithData:KMoJAGPSZNUgeD];
	YTfzHekRMpye = [UIImage imageNamed:@"QXEwmNajYqiNJvIqFiKWBdtJGKlankiKdWLQVjlBqmjUSjRCaeiicHHnGNmUSRyojieRdZifJvMIqUYCWVwPoueAYvwRRaYVenhXaPpPxPyQe"];
	return YTfzHekRMpye;
}

+ (nonnull NSDictionary *)OmSLQXgweropUTaYI :(nonnull NSArray *)bKQjcTqsbnkv :(nonnull NSData *)ssapFpKzhPZVFBnwKhl :(nonnull NSString *)hJloVpaRYOHI {
	NSDictionary *HxXcFUoMUqWRiZD = @{
		@"bXXRFdJAtileQ": @"EmtjiqZgjWQFjsRybDAfbUbgzrYjdIwkMyLMZpBqBPWPdbkJzTJwpqrygRLBMqeyIuCKTIxdcKveEYbWRxnheCDsrYDhhtmGVdOLYIQYEpBWxYQWYTMBTOJeacEzkhzciecoYwufxndphLS",
		@"kPaclkUVPdCpb": @"HPvGBUInFVHnXxhjmIREWBKQkcGngUmNLartFaSwRDTmFRfkXXMAjUTGuTznzMXySacqtaEkcizVlfzftZKJvuCvLhQJvnQbanslGxEvgtakiyyLj",
		@"bKklKyKRJJr": @"XfNWMqTgnURWKXmKrIrMgjUEmSksyvKLxeMzgBovZdpNJVBXNkhZcMugdluBUvXkOqjhOPEyMDtKJPygMukspzcQZqXTLewsvhlbeCgEYhPgcxCTMNXirwmHUrsEqH",
		@"BARCagijHhvrvVumjd": @"pBOOwfubULIsXcSdlYAYRdcASVoXuEBSMpysImMDwYWCMqdmQaXmhkBWZEhHaQmOAqeHrJEJpURHzAwaWqNBQdjiHaUmoByIOGnBltwSUuJepCJKxch",
		@"RGeUYAklrs": @"OWgrvSlGrQbVCaVmhLtvKJaSdjWXKvcOdxmVqSunLYuFORHZTEiqDumMrhjahTWLYHhMLFECjqpAbErFyCYAalwtgAxRsxLWyQczuhfRTOWXKTKkCQDlQrAlLZSZ",
		@"gHDIhMpKSNwtS": @"gajGvKQTUVjiGnTiisaRGFEPVbsOIEKKWiVnxcLuKJbfeGsGvIDaPgDkFelismHkkxzTpZsKfkaFEXlWjZymMXZhStAXpEsCWXHIYFREsDMxrioNqNrPHMjxnPUoKDxIDIkaoOQalzNENa",
		@"IbQhoJYUuGKOzsBs": @"xxyGdgoOMSistezGMtloIlUgFaOikxHwKnJrkjDoOwAJskDhSwZZsFeoDiOqgaLMShSnQQxwcAvhWrrdRLiGPQTgtGbUetSyLBGPCOEcXdxodrTVgXbNBHvDYinhYcWjokn",
		@"TqMjWqsQjaSPwXT": @"aXIBsImmpMmgMbsbYfPUgdArJiEUzojhXwQuzHOnCnqXDvDfMVEbBFoEMFCaVjgOUPdRYtTVmEqoTkAjcHsklpBljOhjQBbzICUHoVEtbUJomQIMsvWqwzLQFrJXwtrwoLWzPyiCYlyR",
		@"XWywAMzdNfUvTzkqgw": @"TNCmoOSBHIecNZTWpVMpcpMPfOQpNXfKodaIZHQRWXTIqnRRBVhOuhkiRRrFefncEEJAZMMeTYOmxHufkKCwJkelAdCMsEjYtaeEGOKiveSbqMxkMHxnUhXRwnxnleavMwn",
		@"vWHghGCiNviYPnbtHDX": @"qLzRnRsELfFgnwtOsjDFKpqVrCmueTPFqClJsAXMLWGHqeikdXhsNRqCUeitmhzTXjHauaLEoavSICDhHeLHkuQVtZYLktgQZXMpKJhVvLNOchoekFBtkorWMbjPzvhJyAvyAwnqUgu",
		@"ofIGEECBuzmmkP": @"SOxDXAyGUAaOXLbDVbwgkdMbLZQClGFsjOoYWIRPtJhGqWpzAcHbEpYuhokwcVhMnSvDDZlctoflIlGeBwrSQlHFOzpLpuCQCNnNBdEYZVC",
		@"frBeEJZfDvHUvVJyaMY": @"MKiWajhLPrjBRnKkEntzKsitqmiAoPePZjGrGnsPhJSbNsuWTdHBJIlYtLlKcfFJEcXzvtMoxelLwhsGgWfMCTplpXHbFAYnbhlYIAIzWfrBzKWdHTFNHJVOPjcJkyjpyIh",
		@"XgGYtZNDdpkmqagJTu": @"DYtaxHjKkBtwFehMdgHvEpBeGbNVHKtzJyyivrbTAasltoZkKWHiLpfvDlGtduiuJuoOZpOHuRpHvzSuswYcMtAzBkfvdFdgRgIHFqibspHRlGRhlfYOZXmtfrAawzNQBdReiHgqq",
	};
	return HxXcFUoMUqWRiZD;
}

- (nonnull NSArray *)oRUbWCZDHzfpwzL :(nonnull NSDictionary *)WHXswwpfMAeY {
	NSArray *eQSVacnkjIzGArT = @[
		@"OMLfpSxMoTXqeGqedawRsdgMfBlhGdaXIZCdRVgaOamHlYpnwpLNnNtvtarFJVCAEhJakzIEnVlPNjohDpVWlRfrXNhmIABPUXCDTQtZEWVpJBriwvfogbWIkoSuLaQF",
		@"RmSwUFNUQKCgFAFnoueUpOHdoKawjwghQASiJLkaRNfcbywKiqOylDNxloXlVRHoiQPwEFJdEZKpMyMmisNxMXNpgvHwdDSDCqPrsDiogQmXllyYCTzZSOsDwSBNIpZkabpzyqcnNFjbapqIFF",
		@"ymarqeFwjBqgzEYSZKdUKpbSWVyaTcQExjETSoHZZIrtSfoZhKdpMXeQYTBIiKxiqQGzjOpZDECDdrOhlpLPfLwEOWgdvoIWNLpgUHuuB",
		@"UwYkiDolwhGQrthrAUcvDZSUOcgwgFUcnmOjrHfQDgUjYYKFQbCmgcrwHcFbmJkCGXDMKTxiMWAJwVCfsypgoZscAGtOBXZPtRLqjJqYKkoEBIkdKjrCqjlqPeTBnnZWMjkYhJVhEBzTlqEp",
		@"fQLRGaSLKCOLzhWDqsyKgDYrfjfBaTqoWFWemFQmDYRZJZtZjxGkozbjlhZayxGbDdrMfkBNaiyrqYJWMXjTZRUUTpIALvFoIvDueALfEIkilwxQYHxLzkuUBrHkmdSplezNhmmrsnxxztZik",
		@"NijtWVZSxivIwurtSBHvkooOpdhMOUVaAfjUPYSwWpmQbAEkUHmMtfrsfHlFQOkUUwRaPWNryaDRVJQDllXbxNQlDFxfCwTxiRiphftvKSmLXOLJ",
		@"zkwOxJJvBgrPKWLPhSmVbLCSVxJyTqCJYGIRJbAMRRRDWaJUOvgqDShiViHWPfjlNMJBRsniaicHIeixXJeTlqhtuURoKrmybOUkUUmlEKxMuwscFJXebludfLYzuvGRptISeeUGKyjOqktUcsDP",
		@"jFwVuDNVmGHHyCPvzNnnnUQCzQMmTzXZtPDdLJQGQVndNLliZHrOvzVqBQNFizUEDacklCwFKYCvkpANErNzJdGnVJqNaAJlwpkomOaPLn",
		@"crmtJOjpbhFKUGDxmxdzpqXuzDUKGEhQpTfYGJThCMLuuPqmjeocGclrptNlqdLIxFJxdqakeLgUZRZnfHqBilwyDSnCukytssEVJNemDvqfSVOTYxWkttkAwaIyGJNTcazQVGEJ",
		@"gVuHbGqdUbsMfJlDXVHQnTvcOvUuAQjEcVJafMIFRmqiZxQNXvDdJAnMziPNiihaqjNINkOnIJXTrhWIFzeelYfuXjdYCuLrLIqqGySqZHmHqiejOGQDAFoEE",
		@"QyHHMjJFbizWJuUznMCWznGkVKXzxeUYsmMkNPZQkvoeMqGMxWypKWeptGMQJioXqbaxKdqVClhLVcKaTyEdoKvGtVdSlVGyDMoxbXGgJvvIqsayWVPmXJvJYrsdIlsuGaXoeJIehLnmQmZfgnEU",
		@"gGvRThmpgIaIgwMfneMDlsHNAUtRySdpIWHJEoHCYGreMniiswMFvlBJLCHAcHSiGYIfVnMUVILYXXlzisuQNAzidBCIBkzzZICqZHseVZKXIubqmCRFztbHmYQnizwJxO",
		@"pHANfBzMvegsxtuSWipENacMRFzyhLBhXAhvKBizXbpianlHBSIyhrlNihCloKbOGZbgGpLAPEAVYFrgcddFrDKzmzsinpKmKxNdjKOUldp",
		@"aXuMUmeqsZqAmWpSNFgKqAuzsYImCjndHCRKobjjnMfklIpPYoHMRzkBZoWxTqnUPpgelcAjrwqtFVGFasRgiVacHPBgHYYuENKCpucVfOMUHkJLjwSPVynOBrhpOeWr",
	];
	return eQSVacnkjIzGArT;
}

+ (nonnull UIImage *)UMMffdVayi :(nonnull UIImage *)svyFKnXjJDGCtW :(nonnull NSArray *)auUFPWQuzqBsPVlLdo {
	NSData *buZAABfScwGnV = [@"UrVfMwupjOEmyYYiSFRwQJfXoNOocVVlbJLQYxgaehCXseAajfvsZGsvSttuqqUjBrHzNuceSMmltkRqfyxXORgghniDJmuPivQDNdnfz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bdIkFAtIPpCpmB = [UIImage imageWithData:buZAABfScwGnV];
	bdIkFAtIPpCpmB = [UIImage imageNamed:@"lyetntAOIGbnAyHrUuRNqBmHfPdgtzlaNXnegpEtEbhmMynDbijHDUGWILQRcNiwKlNeLDemXgsrnuWMhIstqEMnXbxefyBPcGmXpoWVaLNFr"];
	return bdIkFAtIPpCpmB;
}

- (nonnull NSDictionary *)jgpBcTgNUNJgtNz :(nonnull NSData *)mXERVEENXLiNtyhiRk :(nonnull NSDictionary *)irSvjgceNQwyRXvu :(nonnull UIImage *)QeLdKMNPbhQMBReK {
	NSDictionary *fdQwQydXYAaQUEo = @{
		@"hoNWxvMaPEkYxJ": @"llRpyTqXHKGsQQlwgqtgVTfUPBxZwMkeCORlCmRUBpOmhKwZvSUyYBNRgenonuGaqBNAQAmLPXeNKtyqVtqWOpujLCRbcSieNMtUQturVrfnMCqCIWoLSBb",
		@"XCqQdfsncH": @"RGXBRJeAdHeDemMWaQlfzWOxLRejPBWYPPopaucaoQxlhfrRofEztjkgYKysyZkEqvFtSnHWKSTeobQYykUxCIZsnDiHqkRfBSnjTWKOWckCesDgsQ",
		@"TVronJbQiy": @"wKCmRvSAqGxMsYjzdnbGpUfDbnytMsVtQulYmoghnYinyOQpdPutvJHEGzSTGPhPXLJqBKGVDVLDFJfhgbQDiWMtxmFGkYqmxtqprEHOrenY",
		@"qNAKxBgfWi": @"sUwoACrsxCIwPIPugUKjDNhMdSZdGsPcDOhjKrmObDoDTBnFYfJVOVSBPdAPQADCmFxNFLBvAcsmjlXWJCslaGLIlufiveXwOtGGREwpebbOhXOcK",
		@"BAyHcXBVrAaXAJvw": @"xbbdLiTPCMsozGoXCcnKvyaQePdNAoSpTHgViUUabyRYHoFhNaXfNurpdUndoFhwWmqcguRmGYtXsLtElFQEaVwMyxwjSUdNmXWleFImbhGXxGjqnmhWDbHQlnnYsBr",
		@"tOfWgijjcxJuQ": @"fFtMgWBtzVQjIfxaeOriKWGIqfaTsOXQsrFbpOvDufjZckfhPksEaiwLMpkNrFcTUFAJWHisdDAEDMYoYfPPrJMTkJEiPePoigNEHCmCiSbNyDGYWAg",
		@"GdJCRqRNQWhIjNVbh": @"zpeKmpCbxSFjdLxNBzQAxnWJfnmLpHUtufBLrHEiEWFlLwbWRlXvMoatLgWpwoWDsirRLINvhWLbeeLZHQhxQFyFTngRcsUwZVHGfgcaDmZzlaiZPWTlUoTJLnwPJwO",
		@"xtyHPExkhHOc": @"ollkOANDnlImoapEPndfKRwYrMjebNrQRouboknBKXIKKfoRJpRbAsXcBSHMVZgqLPCmMEMegLXANgHHPRnNzEWzVhPtYDUWWHEbieBydzDFeCNmfSUnOkbfLdC",
		@"KTmYMTxeqfnmOBqbw": @"vkHdQuTrrByGxBYhrwtHUrnIzPpXKemPzDSesbkjWCKKNHsWHCCJqvYSQpYIKjxhrfVreDaawCPoEzhuVZSHWBrcKtUijseQyBQCaBaIsxroloRxOFuRLnnmuYRIyAZWrIbkhaecvWCoBqihWVa",
		@"YwLWSPeBQRnsZ": @"MPKVRYHxcsSMzYtIdQqBlPbbFbVKfjkILGiFGlIRgljkzlFiCzqqAaBfYeWvyNZsOQPyJdAVEcPhvTrDAMtTzjaEEezDoHtSZcaZoiUEAarZXyafvfPBsDTOxSNScSJWruXJceMkiub",
		@"pytXNThtRLrwcHFG": @"eWYRUEBsahgCEHyKvZjFwxGzbrgkkkQObyqAJEpycBIQbQVawGjtAyZCCCqcWzeVUtYtJbrWbTkCPDGycRTbwwDWhbUpGkdyZmvIiX",
		@"YALjSURJUDPgsrrbsyr": @"ZrNLIuSXCmaEnuCvisnCVGARIJHiIdeUeiKwKtHsgfWgwomOgMFlEXPTxHLnrnAUbXQsXxuekLGLqUYnLPUeeapDheIlxIlJVfFiFlaTzDRSqyEpToK",
		@"GsDUUjbuajpJQM": @"SOinqBMUrSuukNuHlPxQKCjwmKEtkGcYGBNhmWMvZVYgZhWczqnSfPpHAWokfPHVfsWfkrzhlOLSSwAxexGqSBZzmUUfxaakSPDlGPrxxvgSASiUseEDDXDHcSMgTxwMbKuaphiZjmv",
		@"qgnpDbrLnhWjZaCXJ": @"mUMLwBHUIPXcTbyjgDczeGaHSXVDBfZhGnuIFeRxtrsmfzwhSCzDmLVnAsQwKZBpfKdJNNcXBUwxlxcLGvsKWoaIQoxxSUBfJdSxreigppstMPKjGkOgXDczgywkIYwOSWDRCmiFhZRUkvIxZX",
		@"GRBpgxfJQlPpiX": @"dwoBgyKRXlEqBxWcGrnKnrPJfPLbFcwdrGUAfCWfBDSRZKCcINwDSINUveAbwnjBuXtwdtUQNdOGDeezIcDrMhoKTtEQbpaZQnSXncqmLYFvDdzEFPsstDElUEwYAKQ",
		@"HsxJwvGjxgfu": @"bKBeLTgSrOrCCUsUGOVoGnveHTWgAXDljwlGcQRkdoEtdVDkVrpADaSGhumoTbaliFHGrCPWGmUkpLnXgBcQXRJbyScTjvXZMTaGrwKaxIGiO",
		@"XNWGzbgRXbcaKTL": @"mUwwlcshyVLGoroMSwuAANYMFmREHJsvUwwFhqSHclBSaqZxrmAvwzmADunepTmOoDXFcKsBEiKhELvhCrSkcMTlQOXHdgFrixrMySvmIsQV",
		@"REvORUcedbVM": @"hDnlwiuZdeISsctaajjOXxsuARSZfaQGozSfWMOuQQtTJjtoFpWPBwFqquHbahZHlklPWcVNrjBRXAvzdEpxCyvRUTfdbTuoTRewcyFSawuACsSPqrbJTyDKFmedcaaaYaBvv",
	};
	return fdQwQydXYAaQUEo;
}

- (nonnull UIImage *)LEwOjmNYIkk :(nonnull NSArray *)rWkmWTOAFr {
	NSData *iABevLukditH = [@"JQijySjGTPMWmfDvyNZLakTFmBbhtAEBaReuyFhcKVDuVzjtKBaoztVZtyeBPMgSoIBzfoGltiCaKEfZyhMklZDFLYzFDNqowuOHdyueItGAFerQdayTjYaWFcFjGBzTnI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bMTxFLyfGdaQC = [UIImage imageWithData:iABevLukditH];
	bMTxFLyfGdaQC = [UIImage imageNamed:@"qGBIBkkhPtoFbKzZFKGuTfhgGPCOxzEbEAKSiUvcOSuOhDxWzEkfDLgzEefaFfNrnmYMdscUgFRffWIufyOQvQnjHeXyirXrXiicsFaqslp"];
	return bMTxFLyfGdaQC;
}

- (nonnull NSDictionary *)nWIvUkOGyzlAwrSpj :(nonnull NSString *)PvgqetVOWYEjKxRsLh :(nonnull NSArray *)DNgZvvhIjYwx :(nonnull NSString *)ZOkQjhuRPgw {
	NSDictionary *laafAhTHLcPqO = @{
		@"MZWkZkqCpbpeaJvMHHt": @"FjZxDpgwIUAiFNUjysKSKFBfvLnMUNyNtBmNkhNSdUvkyCsUaytERfyzBWFMKyyLIpajIgrrQUTGhRCEAJYbgxKpeFoPbChfRQKHIMLAzvNFfJlVtAwBAfByUdmlEz",
		@"ZpIDmOnQtPbtBwjN": @"XFFwjxPBAQtZMfXkkQyROeDjKgArCvNVNTTexaRTAchuOTFFSSgKsZPUPwlqeRnLgpHMrwhSOShACCZxxXIVoujjujwZgTqugNKUALFJdjLtlJSdmciwcnVWW",
		@"jrpgcYMLfaoy": @"XMEYfEWCWZXBtPBCDAcQPjRMTMnODCFJNbCPIkjyAKoceyMvZIVZHnBnxpzNwzWTRGedhZdgdwNRTRUsKcmVLMyieHynBtfLGqLXxC",
		@"PjCeFoYQReQWE": @"AaGKCkhMTQgzEajlHnMrTeYUlLFqKVTQemyZtuBFrEaotCbanOOfBNQeNFJjdDmivHhJKjThrkDBsDtZEkPrCGhKVqAMcdIZWiGiQqWNVU",
		@"GRMilJMUpKZekozyQaT": @"mUMcFfFRTVRIwVTcoSBjsorItIjWeUvnaGxxxpxrAbTbVBQYttxPukrPqWvyHtyAUPrkKyfSjSFJQuICtYMDEkTpfPXHdlWTwQaDlmqDbvwWqfvwABktHpynCyLXiuiETwKO",
		@"mVApsdCzdwZ": @"zQWOAZwYGgkRMVFoixpQgSxlljcqsnvRpSBJpANjotcFsDoZJOPNYCIPqPBeejRGnCTDiUdzwIJpMxDLVwDDkRvIiRLvHcBeCqLgkAqWUuJw",
		@"enLgNDczuVTdjN": @"bCsAhjOBxqSsmJIgaFQEMllyMNjvsykaXVyeErtnJMJtmsmTteaROvAswvXHQDPYeyfMXwlcFnrvRHjCQqZaekIoplIqpGyXvCnDIWJkafNOBXFqkJTKKwpMH",
		@"HBnDtvhjqqPoHwEYiuY": @"zNxVfEAFIVXrFToHQAeYMCXyfncgPMzAKQZMcOKZPMSAAUAoAtmcvKPaijjhcpsMkQMpODowtHFVXoJkKvAmmcQpNrZgRrEDlpBMEItgOkkdYAEsYQEczIOpgkWzWEIDlwuZclqmQjITDRRP",
		@"zpfAeTHQyH": @"yGulFsmkCClaGbFPMiLCLlmFcDzFybpJkGaRuJuHCcxzIooJQptnIthBPIHgoYmCzkMnxrdCHcOpFynQstKZHbnikvERFRrCYWdTRenVraHBGGpiAXETDYNWzXdEboQTJjtaljMkkMFAHkbdt",
		@"hyvpesqkDJ": @"YRUPBnzrESIpZfgpkZiJHGFjBvPIRRGKozjsytVsRNnldYRfcYXjLAyHWxGFqUDjTgDdgsYzJphxyoQoovdHAiJkdTpWISaZoOaJQsxYkxvUgpVCGTDCqfIRqXvydiJd",
		@"YAWDhvZTKfLTjgot": @"aEWJtyJBDFWGpekJPXHIADNgnXTYxZYkmzfFKGLRHgiZAnEiUBUGIKSDIQeSTNJeKCXneBDVAOraSBaWaCDatxNRZtgxOXqsAcbxZoqvSxLMfMIshlaTgyvNLeEYmq",
		@"TWiKcGjmtc": @"kBqGitoKwzCafUfOuQNJSQGxbmWfEUZbVbPDIVGDeKxVMlQNYyVXJjYARERvMaxMNAabbVLOcOCJRiReRMrnLcfYhbKRqkNuvHTmWCsdLBjFNkxSQceWXe",
		@"nmauuszYfKSltA": @"vDMcRnKmtQRifNkDEcrtAPYDJJrDiIODnTjDnxJgaOsSacWHwwhBNTldkCYXBMYDBGnzfkbdxurpZeDuMYzREpuuQywXqqYWSJoIpaTkyoeiEFNdZKHJHkYjB",
		@"MZvzhwaDSgR": @"GPkbOfaxCaoqZwEmmPGvLkbWzUTPSZtEuqXbPGUJuuiklhYuWAiBNCPvizqJlnQVwJjcafleXXJgcLicfKVpOZfmmMIkEkcVbfaAEfTbVQUfoGsppbEZqESflhkJuZhhDhCKnMjtv",
	};
	return laafAhTHLcPqO;
}

+ (nonnull NSArray *)OhdKYEqaCRWmUfMeZW :(nonnull NSData *)hncTaEnqIiX :(nonnull NSDictionary *)lAZAcOoABd {
	NSArray *gxYymNulxYatTRP = @[
		@"phubMewNYHIicWAsXlrEcGGDnsfmcVqusFYYZyDgjOFuROxhNKVRqKKKolUALTdPKMrVdGFidvWOiBUusHSGWbmFVMGCBEntGsoEyjYZJwbDLULModdURrHAaVCnXVQTvpu",
		@"SurVclICsVOxltXMJubGxoomlytgIoWihBXXtfuvYVyjyIskoMVZTJxCANLMnJfJWtRigUQDrYkBSQJheKltMuLEHKDsMLwmNYbvMNKbHPSeLnIWYJVPTOhvIJsvPkCsXUvTCwCqslgDjw",
		@"BNCFjciRtfSWDdxEobSpZbRPrVLDZDHzZkCqPRzkkrgvdxZCYgUcwZTwXCcMkGjBaxVmYtGzjjrtKakwiyJwBvAgENsoNtocCjedTKjvqTeBLICuyPsdYJfWPONIJoWbblbfPAtJPvLCZGyyBdf",
		@"QqopaBNyhnBkTSqHWUEasZsFECuWAxlaIfteAfGAuYKhNLdjtzrvAODFQqQYlmcFfzEIBkapQWbSqkxoxLqEgcxIrCoXgzCYjyIXrYEoaVmxxKSQKuqzFUoctKPQaHyUSjWShmDVgCklRpmPKkA",
		@"ZLdbKkbwazIZSishGRYMXjlIeEaqiCNeDphZvtpVyhRVgYYHcAoaZNwpNNsuIXiAvQPtymtTxXcFZiNAWPsBoHGdtlXLeOVBKwTnBVWnithEzXtVqrlGItJ",
		@"FVNjGzSxtDZBJTXVAoZyqOgkAaNENrBzOEuheKWSrEPsynyUUmSjsvAgoKFMaqwRejheemXMqfpBrBibbsyVzErxMozxYprEaleiBeONFOeLArGASckhp",
		@"uSEScrEMFmNcEpeGOrseSKmOBCiEmziUMrDSfZDBLFnLdgWrMIBqAzZLNWNkCNmgkstIxmiNezsQLQjODajJNpTuwqauHxFrHXhsNhSmTUbJWxFnSbNFZVTlARFjvCaQ",
		@"ApWLBlzKfFAPtKRrZRQuXXKBeNCvGjybhFyCTfSEOPrbfjIxskihdivLrcTqzwvqOENnYIsBQhrfPkywaerXOMoaxDSOPTbOuNdzDzXkGiXLtEUtoDRMNIikwVCbajswgZbKTJVFmNYqPHM",
		@"FzFpkqVmdEirQYStSiknRYxOiTPhyiINOhVwIEwHQDmljMwnPLAcokowQWVGfsGcVuYRvwoNbzzJBgMjFCMmjKScrxgHIPLGnTsZFvlhihEDkJVttsgKDiTxNEDLFra",
		@"hHjbkKWyFJIjQZhZXyVxzZvRrCMWPxEQWHLbNMNHJrtckRjSTzGkfhBaTOhXrQHIGxfqagMUXcsMRIhLZeakyNMTkGKQuKgSUMRSZFntz",
		@"AYMQMHmDDtjoeFlDaFQjdWUBtzbifUKkYVoJsuooqyWATUzlhHSlHjhestERPXvGlAgSKlGwBlbKAqRZALNGifZTAorBrTADYqUCHACksCdYlUspLc",
		@"MtKwpaXVJGQvDdaEfNFOjCDYUSVbSOfgynuQPrgosnkkhowzoEKjnsxDdhwmeNpSeQihQSwSxQFbrunsXuSIWkpHaEvXQndcGpYzvDReQAuecdI",
		@"xPQiZfILGIuCAQZYglqvIDNUepJlukoTlxVSoCVGywvlBpvyRYviUBhvYiFdvPOStbGxdtffDdUoaFHRnKEophGDHvVthKsNROYECXaMkyEmtYYDrTPmXaSXEIbd",
		@"CSdfXAoQzpsvaOJUEZRELaAXiPhZvXFdRZohiikRdPVtHkteNlBVHfWCABwxfKpqxDzvcMRBTZMSVZEfIdrFpZBJUHWRuCceFdEWQFABuxOtmbsbFMSLAhtUPVimVIqtEuV",
		@"WjMxNkKPEBoBDYdsHmryVzGjGOzXQZTCznwwZMAdelbYbGIxgLkuzZINkBTpUmQHWNJSiAAnWcoCAKjQeDBqtewRcvGUkEvyZAlEJQwjYSWoNJxQbOthIcmWyz",
		@"uzmfzMAVhoaKOJZYPjekZknuGBxBGNwfYqGZHHiPyYPQhLOmANCcNfuvLpIrtJVhXEXKOAmTMgklUOxJPRlJEwHDqGjoUfgcalVmRTZUvVspzjTlwLZBfHORvugCoOiPbmxtiWRRUnvt",
		@"ggFjGfnIoIyCQCPuiQXYQOlUWeQuzijIXSFTSKOWwJGDSHhVPjSmLpTGegCPxeJcnPFcNBjGIFYvYACXStUYvWQhUiDkARwEMgSNEDFOxQPTCqHBNqdXvxoGjZpIikTeTDLdDDrlKT",
		@"uhYRpIrifmJzmsYZAVgIdIiPkhQPXGUCNvnZjyyzgnmohsgyekDZOsHZCJYHHXAmLFHfmRSgzMNfDbOtnlwElzPXVYmFXobYDJNbtVUoU",
		@"WpKBDXEVEfvRjzbdfVnekAOEkdlgqmlxMMAPFJnVZLhhWSLAczfTLHsxVQLuRhdIIUwzyYjSQvqPVxHkvkxIxujWdaADbkKdnUcWzJiYTjQvsuoDeOPwfbytcgCUXTiFcRpzJ",
	];
	return gxYymNulxYatTRP;
}

+ (nonnull NSDictionary *)tQQgBjPMFybOVBB :(nonnull NSString *)nSfWguistOEsizd :(nonnull UIImage *)jwYInDoslDuIkPvYgt :(nonnull UIImage *)olsouLqBgi {
	NSDictionary *mDJEVFlGkFlXHUfyp = @{
		@"gtakeVgisBRELPE": @"oIAhKNOZpcsOWtmfFNHYczkRljiMraBiuTwZMWtHPVIANbxpwpUTxhcMKRyrzNtRPASjrSytSNfHgHOIuaSOouSSeFdCHxKcgzymrMHCjFxlSqOaaJqMwChouQaAbXeoBz",
		@"depIHSBPjAlzSg": @"MBxVIeuvSDaKFcpxAloIVYRbsjekQzAEPNzKIlabbZiPZfkHUqYzEggsrivfMnZmjvXLRWfzOmgLDNFiWIxYkeatBRBpnVgnNOkIGpVffhZGDCnEPHuFlfdvVLpEqTzaTYGhcAOal",
		@"rBcXUfDPeUxFjCX": @"xztPYuUIlTQlJugJooYAczhTmnwTNFvdLfMMlqfYoNWBBKvYeXMIObBYKXkguLNhsWNEZeJmmOZHKSHFfvKpmCifxuARiTRqUgDUognIlXtIPjELZNObkSbQtEIZYaXRmsTkQCLpHellhfNGJfim",
		@"foUnVybZsRhVaaGHgd": @"nEurgrirCuTxCUQFsDzevvIVjraCZITSQnURqBDWuZrkKIxBfNooJyoZZdShqxVPRYzhDNvFVcGyDyTGFVNzkbRKEpSbxMPVEzZSVezHdmYpwbemqkcbHTDvQc",
		@"jBWrwQZadB": @"bQLfNWwFfuijuqWRvNFNgtrThTeOlMRDYHVLTJUGEUoWUBdWCKRBcdIPQARAPAKYPBKPoguDSojGJpqAEwwFSswQxkxmGFXVDGFYDpQZfqZXnukWjBnESfQxsgzGmlh",
		@"IYCDblZCTFdv": @"XVwRlUWTHrWlGMFXaEiMNMhNQcjmYntoEZcKijQvkUUUHGbKkMzVKXEOdmMmrEyUojtoDCpfcSbarLpWZMkEqSfOdAPRCsdnOkMFhrhuhQMiNF",
		@"AupFQrTsofPSVNuxeEt": @"AgamuFPSWrgHwvgtkWMLfCDlIcIHnIHxCWiCHnsBDjSXzygXDPucCORWhnKaDGuKKquwzwIAQffpdCCLVrrnwlbkQgxsyVnVFrWCbhPcXzFcqBroTxSwHZOkzUeJSJqQhAN",
		@"SVFZoWYlVeH": @"hIYxuRkLrADbTaRIXSiIoZrNZNdWOlzXKUpHhiPtFgaZcsgvcKJacsdzYPwsbFDLTZPEBSjKtTYaJnGzKkhqogzNwYwIsjlFLEcvFKfxK",
		@"DGfWZZNkLYfPYdvWUP": @"bOqOmpodtlZZvxQdFMIuKjXTdGxXeAxFVjFJYhDZnFSDWsMJHrkpPOGTaljpAmlZCwmlFkrzXntYytZhVIOVuOFkNphSLgMxrrsSHTBcOxAwprYcMytcCEYlWHbCbOoIv",
		@"cvXRPbUTNBbzOfZ": @"YjwJeYhSLzWPTCbtlrllXMWojqExPJblFktetFhdMyPzLhFSJqgqwFASVBpQKGmFSqhbtEYByBWsAlNstUksNzDqYBbrMTZjiYdeDyKJKqxtgJ",
		@"NcRJcdnprKdnd": @"yqvhMZCzsEysyPOatKMzYJeGlPlycTPyXLZkrpnDdYoqCCVUvqqIBTNqqlixNakJpgVURkKEkFIcrrVLDlFVJZuabrTYuoFUHdZSFBisPpFMlUAKFKhvsNVyrQmCLnwfPLuyslghpyxcBWn",
	};
	return mDJEVFlGkFlXHUfyp;
}

- (void)cacheConfigInfo:(EMAlertConfigInfo *)configInfo
{
    __weak typeof(self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        [weakSelf.provider cacheConfigInfo:configInfo];
    });
}

#pragma mark - Getter

- (EMHomeCacheProvider *)provider
{
    if (!_provider) {
        _provider = [[EMHomeCacheProvider alloc] initWithName:@"EMark_HomeProvider"];
    }

    return _provider;
}

@end
