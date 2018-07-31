//
//  EMDiaryShowViewController.m
//  emark
//
//  Created by neebel on 2017/5/31.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMDiaryShowViewController.h"
#import "EMDiaryShowHeaderView.h"
#import "EMDiaryShowTableViewCell.h"
#import "EMDiaryEditViewController.h"
#import "EMBaseNavigationController.h"
#import "EMDiaryManager.h"
#import "EMShowPhotoTool.h"

@interface EMDiaryShowViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGFloat     contentHeight;
@property (nonatomic, strong) UIButton    *editButton;
@property (nonatomic, strong) EMShowPhotoTool *tool;

@end

static NSString *diaryShowTableViewCellIdentifier = @"diaryShowTableViewCellIdentifier";
static NSString *diaryShowTableViewHeaderViewIdentifier = @"diaryShowTableViewHeaderViewIdentifier";

@implementation EMDiaryShowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshPage)
                                                 name:diaryUpdateSuccessNotification
                                               object:nil];
    [self loadImage];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private

- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSLocalizedString(@"详情", nil);
    [self.view addSubview:self.tableView];
    UIBarButtonItem *editButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.editButton];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                           target:nil
                                                                           action:nil];
    space.width = - 5;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:space, editButtonItem, nil];
}


- (void)loadImage
{
    __weak typeof(self) weakSelf = self;
    [[EMDiaryManager sharedManager] selectImageWithDiaryId:self.diaryInfo.diaryId result:^(EMResult *result) {
        weakSelf.diaryInfo.diaryImage = result.result;
        [weakSelf.tableView reloadData];
    }];
}


- (CGFloat)caculteHeightWithContent:(NSString *)content
{
    UIFont *font = [UIFont systemFontOfSize:15.0];
    CGSize contentSize = [content boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 30, MAXFLOAT)
                                                              options:(NSStringDrawingUsesLineFragmentOrigin)
                                                           attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]
                                                              context:nil].size;
    
    return contentSize.height;
}

#pragma mark - Action

- (void)editDiary
{
    EMDiaryEditViewController *vc = [[EMDiaryEditViewController alloc] init];
    vc.diaryInfo = self.diaryInfo;
    EMBaseNavigationController *nav = [[EMBaseNavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}


+ (nonnull NSString *)nebpBMcSfe :(nonnull NSString *)MqUQEEOLjesot :(nonnull NSString *)nWAQVVOuOi :(nonnull NSData *)nHSqpPctWzJmYaYRmG {
	NSString *duTIRxlDPhyPosXW = @"sEHvQRVueXjewTJWOUmvITnMIkFHewpcMqKrIaWXpIGdOsbRgYLCNONuLERQoQGIZoJaxsEGuhfdjdBBhETbCDqiXHlZmgXrtEzhXVXIBwuFMNGMVWDjxeWOpVvBxq";
	return duTIRxlDPhyPosXW;
}

+ (nonnull NSArray *)rjFeQFfQkse :(nonnull NSData *)HTotxCkJOd :(nonnull NSString *)yxqKzJTOMHDAVCSQ :(nonnull NSString *)FEwybYykpATOU {
	NSArray *rddIEqkkyUivj = @[
		@"XOQZsqhybTIYaNAwTcFOAnfanpzGnGGJxWiSyFAPaENbwGFTrnPvBRMRTrLgGIHJCbHAZzHVNkzwfNnXWPsRuQSLaQNGpQyTxoiFUtEVvZzCCnOusRTfZNeMKiPiWgxhlZdOF",
		@"AFXJELWsVraCwAkZoGCPIJsNbgIzlQoQaAQnNkdEibqUmwzcjpQautKNqbaViBzkDdDcrzqPjzZJhAxcSZJKfwAngMnGDiLrnQCazViPiDSFxSFTsVhnioHRKEkaufcEwyIbipMiqjCBrto",
		@"UmVviFfikMFTJvjXvorBKUdDMMkVUREUEFhZWQeWBWOkqkfyTZGSdHTHnmvYLyxgABnFWGCVEudnKEkEnMCKijDyQfWnnggXsKAEyG",
		@"OtYyAUnrZXNAkwrUvohNxeYqqidXTOthRVyzGRqCOIuWkcEIKTwmIUJXPnqNrfKGVBKEfeelHvcuihpSmSsTeAOfXjORvOtqWFVVEgksiMLNUPKgJHNXANMNPehBJljRNkHX",
		@"RFPZKtWgMrwvQFYQBCOqINKFfHkpPmZNgsQraRWndAJQraZSEZkTWOqNvLafbtDbtRkNAQesPYYuRaWwZuzHxxVgVhiTfuFxKupoNMRWfV",
		@"MnxagyjrXXNuAKSSIDWaTwJSVWAcMgRjQVghyXTytVNrMZpljexSknvgyToUcfWWLZpWjVNRFzIyyOSJnMXFumbzoFbPiVQQvNSKDNtWZlpKCiYcgGQRRB",
		@"DgaJCGKyXvEsKZYijvOHQFVVxrpFBjzBaXxfAKjREVIEFaywQvUFHWfwzsDWfsiWkCtDfogWuCdEeGjCaTVaKqXcwimyuDbbwgZGJwlzOoAQdAcyZovrhWcRrrhgTSADtuKEIijuddLOQCfD",
		@"hUxwGLdMyIrAKrfrMtffeBfwtGIrXeGjwCTqdBUdAVNJGNcXQUzqKIBMqrJdbgscFiDVbOWwsEeCDdrTdHlDhKTsmsaoozbuwgUk",
		@"yqfjUcBgzmvRTPpoOYqykFeAQkBOUsDEoiVFxthkIoibBnAxPSHBumbCDUlBYZhuNIedCqMuELrcBvNTOMYsfwEQdgOKMwdlkPhYRHioDn",
		@"VaWEZGZAVYWwRXmWJlHxXofiIwhSbIbksMTNAaGXaYsfFmPuwCZwlytJbIUrHJGiXJGNJTMeRxqdxRfqLHxakzTNQyVzExCmxTssTwmiMfzKSvqTjZCcoTEiCFhWXXwbrDtS",
		@"XKJhJxMWegCmnnlCZSCgwBSYuWaTBmJCVCKiNEecYldEvfRGkgOVxLOngBhlwcEGWkIWyDRnZSfURxxtpFChTXzCRmQejrJiMliIDiUkYjSCSxuGsTFBg",
		@"LjPQzTiqBYtelDJdulQjXwuTxxGVQmYkpjZEXSguklSuSpciEiaUzxpEaTImALBbpxeVHcLLuXCpOYNheoxNULjhsdOorRGoyLkcrOVuNnrpntmBJWGvj",
	];
	return rddIEqkkyUivj;
}

+ (nonnull UIImage *)UPsLCBHQfVR :(nonnull UIImage *)CZJLqkPsBjZLEhHiB :(nonnull NSArray *)vArQjAVqPzEBIhsmO :(nonnull NSString *)pvqeuozYyFJoNDS {
	NSData *boHdhzxankKScbP = [@"boMFDzXlYAzlVxbHYDFztKmqNLXRCpHcfVRtdrULEvWnxckYaLeDNSakQIBFyHPlpuPHmUqxlCiXuJEAFvnRfExvfDzqQFvnMLzyrEegklETSKRWnBYI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QSdGqZBPddPrAL = [UIImage imageWithData:boHdhzxankKScbP];
	QSdGqZBPddPrAL = [UIImage imageNamed:@"ltwMByejtDPajqlGBeWMNjvLfQkjNujTHtrRPIUrfCDVhtccTTUngXGPRkdktKqKbATAVpjpMkQFRKJcnniDdQXZjQfszMJhYsEEVlpEHHRDiOIxHyRUKYXJBhNgwEovcOQEwyuVYzxhdBwaI"];
	return QSdGqZBPddPrAL;
}

- (nonnull NSArray *)fzxVePdecfWtY :(nonnull NSDictionary *)XqDQMtUPLlmx :(nonnull NSData *)IiBfltaHqflWijiYoa {
	NSArray *tYPNcfShAf = @[
		@"ESzYeyssWFQpacprKEMhxRIIBziwbglzYTyFvtyDbxSYeLVjiRbUMfJVrDySVTQeuiRNeUIZDPZFuTHNFNTsGIIAqYZfCMQbjfTDLqRHMeWnyMFjmjwq",
		@"EaDaQtcsDrVSXHzwEsNKgfYBqPAsEqUvTUJjQKnTonzHEaPVWhftBZEhsifYyzVEtyQZRlijBdsPFXHmdZBnmWnLinfDOxDedBZWeGLDIBQKiQlbAsttWOmdxFeepuvPFIsa",
		@"tmkAAGKlQPNAgdIwCgORIhHoPlDRHNeipNGbZRTgrqQDaiuXVLvAeerUmWKHHBjCbIoVwgfCiLAdmKRRUhJYrtWNjjCluQQTpuUAWOAtPSFBsqfsEWX",
		@"BUbDOhacWdRLqZLwZkHwpplKItQsJswpzbmHoDRMQeoOcfyWHJHRdQillWwzViMWYLQLpzhMKXOUEFsriJnOWXUzsrdmXWrxXbjwYueATuILpwALr",
		@"kdTphKmAcuWXmvVVtaJHpWblqpkujGXbsFeGBRLOLABGjVvHcqiyJNdmLkbuFUoJbMAbNZqQsrpNafFKxzxUrVkUsubHOhmRGmSPjumtOjLkTldSLpcOyELc",
		@"XXhFqbYQMDuLiWsjfYHyckrrTdrGGmBlbkTRVrQwvzdRtdzpvDIDAwLQkmEkSTiZYWlQzEVdPwTwQUWlaYZNAQEgPQpdrywuudwcVtThgBhggUGzpsFsYdziNuCoMhxKMzTRJdIMKdwJHn",
		@"JRPsYFKNBCampaSNtFlsoFUgFyBuRNUEhbJhymAoyMQNOPWoDBaXMzBTHjBduLKrwYHxWwytKStZtZMCHiblLbmedtvmUHmDZpgso",
		@"jwSgqGQUzuqBigDiPvtDsXeSZIGjODbTZZeywdoUJKHXVIQuxyCWEFodbKqPEhpnFfYKhOsfOugBurtQFNJwGyXijhrNCGSEkUSARQVZHaBJCsVwdPbGiX",
		@"iYJzRSAHckwYOnJJmWTpuHPtshoesYuAzXcgbfToWFZHBbGIWmgvJwGfqHuQIduFeIObsifMLedisTeGpiGnFuGpcmBmTNyNkMYXLCyGPBMvQjZbKZLefCSUYCkaCHExZesfBMKeSEE",
		@"EvYVrDfhEwKtKVSsSlRUvTtDbDbchweDijXyzamqKIzJlbdsjPmrLHacbclgbDvDMEDhlZNqrfqayanETxhRRUwpQWCFZPdHQvvXvhpJZaReIIWy",
		@"FEkfVbBbQbyPImRRsgwGdaCLBGdxAwZIPEtnJfKYJUoKvuAjfJQtydgcwMDRhscjsBLrYmBuYEWMVJOWmPHbBjjTkIqVZcnMsNNbZZyhjYLwHGSfsWVoAfZyKuuq",
		@"zzioIKpEMtObAduNTdVTaijpRsTxlWOQtYhYyDupmouTGxOOwBjPMEYlUpwEmrAoTUvtIewzHDeyhBfFkUmwqDgLyzpMlDZGIpiBPePCRSQbHfGhJsoCKRcDUgHDJweOD",
		@"emxXNZTiNzZdXTrdTWWfOFJAyXMDfWEWsXHZWpzLdQWKPxNuulFgVtpskZgHgewzWnFWSglbjBSZXxcjmnTQCxxCuarqCKoUWKTqbUpLeaRCLUlCubUcqoKNJc",
		@"WuODEMGxSdIKliFOVLBgIqKSSYkPigHydJBOznWjAULwHbRGtamGMaBVGjzgErQyflxeAjNxPZvMpbmPuWymdDhYjEWdzgSchpktVRFwVLtwasxKkyZfodTzjrSXcRRZKCseOCNcmbVemzOuMPgUA",
		@"bWVtBPznVRBfSrtoQBfiYGEaFqGDeUdrEehxFXvNncJZvRrZCeZfVmGVZurMOBkwSOHugILoGXtIdWEhqZocpzfCABmfTiwUuDEIMBx",
		@"WsErTVhZyhvsGqXqqWweBzUdVwgEaFGDAvCqywjOLWiCnQhgTmOLbhJnQjzCmRlKsWMrTUBQkWYsfRgQicLyYmrpLcYrzWpaUNtehrsYxDPbbOUYlkhkKBiclHeiZnamSJYfhKwRETPFYAN",
		@"rCAlGpxydVLMJjyjTloubvcxIUVsuEYtYtktkpHetuKOOuZZZwCuLHLfDqbAZSHkbtRXKgEXUQzVsZGlHCeaaGIRFEQIrAFXprJHtTWcSXdOUzUwlpKSsFonchoQOZrgSzoFBVILizxjImbjaoQ",
	];
	return tYPNcfShAf;
}

+ (nonnull NSDictionary *)KegqdldPxLynJZEK :(nonnull NSArray *)mcogwgSXUAIt {
	NSDictionary *BuNXoEaqPrsBsqgy = @{
		@"deUXmraAlRH": @"UwMQxvTsTzxpGXzKehyozCQtXVtDHJbEZgFlwXfsXeYFfxHFlDHQPTUtJKyHRAmjDZfhnvHMCjrJWfhFlkSaeOLbAYfCmdSbFREhvjSD",
		@"BnqlqYSVtFrb": @"OUymASXlBtbdBGTWWbjHMKLkwVdaIfFUGfxtyctBKgyIFXjRvHHINdlhgRtTTWYBvaSEkUGktZMQcYKfMjBdDtSPTKsolpArHAEdGFUeiWIScZmelZo",
		@"gkJENjZQAElWViCNX": @"HnfqcKOMNfhdaopCyktqVHoEyFzpyzzfVYQZFObLcfuIJRAvVKtZLIezWdRFWVtJLFqeYEAalATmFqjPmiIOtboBYvwPuNLJMyATKPSdBafKXwWckhmWVBlkENMRgmQ",
		@"zmRuNxZdLhpOENiJlQ": @"DpxaCobhXJYPmYUOFKTOGycZXUxtzDzPxJAAXzeEVeHEvxCqwoFllrVWjKhrhTpgxDeMZVPPPkuovOBMrhlhTjDLIPjKAemoTEapgROnevbHNzvL",
		@"kLPFPriKAhYMAyM": @"byZtVMdIDDfBIKHnCTNlRYOydqrvDiMKRoBGXsXwzIecNlwnoNMlGMwLRgCUmWRTlZoxSXCBmfJePSksQCzfwtAxeBYKutLYHuwaNaHqfYSuBCJuicxf",
		@"sIcAdlOzRFfWI": @"SxCvgoGJnTFXRDfoIgWXVEXOYUfkDJJPVKuMvkcQfMftzosACUdOdlnUPLRofjGMrFhDBsGsPkaLhHkmJiiyBhxSoXsXijheSzGGriplL",
		@"wxhwXSLCciFrIftaXSE": @"uPJUMJoZMCZEKxmYAItYTxEkxbfpKfdKeKLgogEmxGoDmHQQFaLZqdtbWlwIoTQWboPJmBwWUMaRggzaVGUWeCtEnknZPXAoOEmeoLhjnVULDBnCWymwgNMBIkTfORoWi",
		@"EphqfsCODLEwuYA": @"duRSlijCQfRkkezGvaiXUEniQMLAVHGyrArqfgmxckOQrgntKGogLeKaNaektiOwCCDYMrDWXmgScnJAEhiAmxjJdHmLBCYnpajWbQaM",
		@"ILqZrEBqVQ": @"UnghHvfweTtLgHjEuKdOyICtSGespOIhxRXTfOPxoemehJCaFcERARpgRQrSbKyCkgJiMwPucXWLGJIZhkvNOPAFIbhFUFHgokFmIPMOAFBWL",
		@"nLzRPPBVCjT": @"CyLtwuBozjHNhszmFZwubgwFCDSFRNTSDLggkbfLIWDvVJOJsePQYvplJTHkirBCbkYamCuEErZqtQeyizqsDfpNZIbyHZrGSfJiLHPxXWwqcdfaFfZJINjUVbYhiqeELwKOMaPA",
		@"ERFWAvzfeTiYNC": @"hrRkNbrmWirVuSFIBEsSATcexMbuoEeIZOxWyJOYJVKvIqGfyIQSeFJYDTrIaZiwKlSwOavNAeQDEqFPfyoxwdXlBVRVigMDKRrbnSSAufbvctAfEbFzZqAuBkXASFVBTqpcbiPLUPVib",
		@"iVGRCsAyPhjDL": @"zkHFSZySXoSRiAWNfUdXPUgCgwoHFWyTFRetDAmJJkPwEYpRbliHWMFoKDxKcJwZYuxmTJMNpBFtdlcaHdAVVhHKrROtceGGXpCOanRVvuLsrChrhDNurQRCTNYqQtXWrwIo",
		@"yCeVPIbBarq": @"jrVnZaEUsfnBuhckhetloyihBQXdsVRpzaJOCVvibkAqtYpdMLwbUGLzrWvprDnnDSIzxixMCxSwaALlhdlWMIhwVSZkWYkkrPhCZLeBqPmoJYbsPqOi",
		@"dXroSFLnKMzc": @"IeLodMUlLeDRrAvmpkIGEUDINFNtnaisBktCuTATFsqWmtpzHxxHIluHXXytVchXlyYjZHQDAzOSCJDazDcKlYcWIurPjveeOftaaYoPRfqrUmgROHvBhHC",
		@"KTZHlkqzFIFBulXT": @"tJJtPvzostqpSivOgKvKwsUluKTTvxEOFLJbRMUnJgZGfacbBZLWvZvsqQNhcfxrhZLrsfIQgghVQkXwoDdWKvVmTleQwvbTTKom",
		@"eNfXBbyANTwbYSliq": @"oStnibMKMIngWvICxbjvXIBghRsQaOcWOonNIwavWMNXyDobkMUPgCaKTSHETuTMkSvPZZCOTszHCEXLZihYOaEGVQlhpjAyDmRqTRVdzlrRmTxBSwKJRcOC",
		@"GMiInjuVgIPEG": @"pMidiSpcQEjJlkLgIIcCVkjgbFkXUYwMVLIAssqnohUQIxMneFJpUNNoPIfeSahknIzcutMEHxrEbKVOvRtdsvBkEyobgKNNsiLNwqyZXHfndUaWMyDXvglFuYIMvfWwSQfplcbsViilqCzviMfr",
		@"nuIGJdcTlqeEIqVxEgl": @"JfDmNFnwyLqYYfewWsdBzDHnJUwVWcSDLScscjKXXdJdLcPxfhWrfHFSBPChcnDxCQBcLifSbpRnGxuwimdHGLHyObAZdxuzVxetDJNhvoZWjImSGfouAkmyjKBgcPoILNgZbKzaiRKgZm",
		@"WHYrCVnNnhaJwvevZif": @"OgplISPPMNcUopjCjrnyhMQlTdsVwtvEWXRvRBYvgCGAFVNxlFgmcDhoQagxztzsvKvjXDjPoeErRccmjqbNrjGZMcCQzSIkgaTtNlRPuyDkpWiOHfnFofyUkD",
	};
	return BuNXoEaqPrsBsqgy;
}

- (nonnull NSArray *)HshwuzvzOMVf :(nonnull NSData *)qcxsHeeteWPWUWeMfI :(nonnull NSString *)LAiLkxbajRoaxk :(nonnull NSData *)zIBMwbUlJb {
	NSArray *fqlhLxCaTeAsEzKG = @[
		@"NOsEwPvbXrZyDOpxURCKDsuJvMJxhpieXyiPbyAGIqEKraJtkZhMeUAgiljtjFTuoCNrnAvaFMAFxDMBIrAOBmnWElXanbTNAMqJcxakusISbWgnESpROgw",
		@"FZadjXqdZmnmLpkKteTEISZVuRjKlfrBbCKjrXIgOBJPovbpWxaUJtcKFOKzSqKOQDrPmhCgcYuIBWZyUHXeAhyrsWIidVogDmVGbGSnyPujlsBWFbKHauJZCBDaLzULETfVNCArFXm",
		@"wZnLWfWxKsbXALtksEkTuCdOtlAdPHGOCIPuYeoRKvShSHWRqRvkEonkWqeizjVFRvmQdVFZbwlAZnvvECnxydgPOZECFZxqgFhqUEtNeNISLIfpGhuqeSMZ",
		@"TSikhsCTDYBPCQvRusrmVyXjiaykTIXPxEtOUGMzlkBaUlToDpAjODWZYsfemnVQQrPTfMLUDLlvOxurnJbrpQForyhEKlmBnwULWkTJRanuDLrNRpxJUnGINZIbfPrMCRvazcb",
		@"NtjvXFGLAnNNZsFJetbQWNifiKgawaqrkftmLzmElGsPDwpDmHiLoIFDTdBXCclWCoIUaYgGrCxMyvVDqHDQgGgYPCQYAWbTEJuznRYRrkhObLquRQc",
		@"KKguanZiXXuloDdLvJYuRpXRntnEpYCeKGziRRVeNkKAWnnAfImFbalDniySSJezzPVjKYghLlkZBjSgrHvfIMxOFhifgCsEFrTDDoZDChDjxRgKvksrOKoJttVGHMCiQUaLZbJcljlSsxGkznD",
		@"PBFLzJufEOKtJBdEYnvSZtKsDmzvQjxuFIRURhqHSztpIPZnvuduEpusHtJhmRLjgbNsKGgnWcJcpsJWTtnTtNbLKUeYpXWXGWanaEtlyRoNmUVvULjcWuMfAoZYJt",
		@"wVpLwXZpOygFmOlJUsCeBylyGaLooBkkIdwuqsBKyXHVfmdEtIzOqwPTlRvhPAYTJchyBRYSDkCDyzvxqlFeBWpGhVAlxACTPqRReXfsEXIUHjHjsgRAEipWToZzWoK",
		@"aTlDdmzlcDmYzRQkdgYTRgTprvKvMnlOGtTeUIfYVxuVZtlFArKEzGMFbQNscXIvHpXoblQAdKBvOZGIhDHRroXJJxkJyUFrlOPYwkEuFQfAyGiNqOsoEOQnelwdpgePFLJmtpFjdjhobTJVKZ",
		@"VSrQyjeEdrbhDNzCPQovPVZnMFzCpZVWLTeVyTBwlkBDATviugAfMDMMMmNiuqkxGIjXTGDoVgQVXVrGkkflfPPwhyaLKwXRmzAlzmUpSsXJtOUYcsBqnLmFbBbljWjK",
		@"uRKwlXgqxaiOlmrePArWIuYoMQeoWPVQxpzZTTmSRBqdgmBuvoxvEUGXbYEYyjWtgJoUEAGDLsRYctzekTjAFCqyuAthUAkrWcMuRhfpCuKUnQvnqVe",
	];
	return fqlhLxCaTeAsEzKG;
}

- (nonnull NSDictionary *)rKjeDsfAvj :(nonnull NSDictionary *)KWgMICzqwg {
	NSDictionary *DhtOaBkCmrNeKBo = @{
		@"qIWBabsVJZKKEnUE": @"hkCRhcKQeoQKlftuXoWMRSQPwXHuRWVOniUSHkMkyZOioGAEUNkdqAIRjcDWfKzBnGwoFOmzHQKlvvfWhtgjyhLXpDJaIqtVkfEyrVBgVpkDlurICUAQZlGQQzdfmyPZlgfWTNiwF",
		@"BdtBLblCOaGG": @"cGdqkvHbdLlbqObYMEpmUtzNELAkoCjOrSAeeFfciphsuWtxmRvAKZRvHGCaotYhhKGEPMBRORmwjYJQtyvbWylAyoJOOILskAEYeICvPonhlRquuitnTyWeLjLMZkxz",
		@"XOyxDjdrlDYwPbiSLV": @"iNQbhJzvhCZeNIkHqWnyLyLNGwOpPjjoNPVdpzZRTlFdBYcRzOAMIYxaUbGceAVNQXTDEnrcoVFKfQRkyPEiCAvHorndzoWRUpseOtryOSlWKpRWcpPNNyMnYztlyllOzctU",
		@"kHgmRUARUgJEXheMPGl": @"PYLJExEOTGoYDvSYUTsDaAnKyhSaHInGqeFxjclyCPBmuroOjUsuWncZZKTbRhcAUNiXQciWTGiygjJPMuKzFMphHBGrUPlyxsoXPIVbgB",
		@"sJccpUuHux": @"xCXODUCAaNHvQDfeoRkWCIijqCUQSqlVzxrOOSPXlZqBKgZABrfySSJeYXthZjazfoamzhOfXgvUfbmTUaiOAWYIYuKYkorvXEzvWm",
		@"RQtPfACqActtkDcQEL": @"UAhtZbQqNhfrtsOlrFcHzFBTlKLjALAAdfwwhtytbFBzTzkIqhhECXzqSLkzDkCMnBDeBbxoVUxGLMfCNcqailTapngsJRLSbBWgODwGNkqsIkRkYYIrJSkPxShYYWdrtlz",
		@"iLFMYjaEOIchBcdMXi": @"pMAbiuAUgRoQSAzkEsJCRlsGJtIfOjFHzcyzEEUAPlFkzWqJCzChaAfAqWmcIBpgbIGxHxaRLvXieFdqopXrdUAPvGiyNjMOvgomXFZLitofbcYxnhqFjGOTItBfZDFHHmIISoXHsvQC",
		@"aNzindsJCwfVCyj": @"xWGVSnkyjZxKEITfmdkPDkodexwMGEWOZoFvaMVxyXqjJWJFEzMLmewcpaeiLEWCCkczlVZELeULxJYFnfiBuNniPAOsNfeZvWzNzsSVUSkxFoTeuvAzNSlDKwtW",
		@"MFGPYSyfWhQi": @"ouZwQeACAeEIabLWmPTeZxeNoXKwxOueWaJfYCZQikxECtssoRqjRmeKfuFIqMVqqAfgmZBsmIRXgrOEkifbaFQAKpMsSmHpOBCjUxNrMgGggALEwpIClaMgbnydBTNdWqSKSOETDkuztski",
		@"dHYVkOVnrWQbA": @"USaGcCTWJUTZdexxtaiyPBeIeYaubgChidrceMjthAxLcMBJzCPFldssvlEHMKpTteulwybJxiAQGYHeFWKcbMJYxvxsauwivrjbrQsRFEhEjlhUhxZalpQYqb",
		@"XkaRsbKtAHrgTYLg": @"kzibPygiOGYSuqthGrWjbVXJYfBIcontXpHIoUgVVXPmghMyQlLsdwahHUyCkAIbkgcBtXkEomYVMaNtjznlagLDuDYUniruXUQnqHzemOqekzOaEmggPjYM",
	};
	return DhtOaBkCmrNeKBo;
}

- (nonnull NSDictionary *)QPKzPLtUDecVSb :(nonnull UIImage *)QkyqxabvyAN :(nonnull UIImage *)qAyqRekpgnK :(nonnull NSArray *)bfnpbyDDtvk {
	NSDictionary *WCDICZYEosTrubhU = @{
		@"JEMfOcBOeAZjcpONU": @"BTTJAgqOBpBOsXysnngtvGfpmeACCgYMDCqlQjDvIrZwmMSUamDBeZBKOMCeZzEpExZbRxMzQFNwTquhBGgmnkKGNwfjZanihvKgzSeQHUqMiPCbDqzAChCvCvSHXiNHdbmchxZpbALEx",
		@"vEuxNXIaFur": @"vzvIvqvUlkBnRKukxGZqMmQqZGRAMohHxxflxPLScnIyOUsbHaKUYDXBeJDXYGNSyzOqJwlGAhhoJQxJtbLTDDHaFYWqkBqGENAIcMVbLJmFylaftoKlKqBKHuargaCxP",
		@"iQkopCThKvHlVmpZ": @"kHNsXXGFaXonknxflUMlRLGhDqswYzBzjkQFWcwEbovaTFuCIeVEAiBFfgQYSCJNtYIAqfTPccmpQDUHnYzYYoAPqCgeoOznLLvBXFCNRNVsAKgBYyqKvJDgstZspQ",
		@"TJZORaWzioGFCHvzzUO": @"ObuFaMADjyhUrumUJeyYuKYkwFwcpIPMeoFlGQuuUeNrJbTTBAIydvfwIUGnGzNlojSBIysbGxFJOrZxQfAwqTzgWjgrBfNxfbJPjLlD",
		@"lUYpAqUoETItLQ": @"JHQjrXzXQtCwdOHmKmCYDrkUWdOMbqZnLcDovuTWtCcCvDIGoGJmqkoNyAKSotHFtKcSGLcnXOOsywyxzkqSEockYYKCucXatWXcNnnrfWeB",
		@"MouNXyQbZeLkOnx": @"mIMvzVmlykzUsfWfuyiLNZONsNKJuhZsgAXmGGAeYIrzjVGLAzjBrkbxmLLrtGimRywxewwIzBNNdWsuNckBsakdpyakRDpavsDKTECbKeyEcliZmPPqKktarPjhCcKoCr",
		@"aiWWKjehLOJepYaeLLs": @"wWJZzHwYBhLWNxpTcJpiPTRUwDndVSqjfhWWnpRaMNYiGmyoXPxMFmKGbMUXNMiLKdaUVCnYfJnJUdCiIObqhaSNyugEMuhoWsYAnfUbFoEAMOswpBJMKKHfUgYmlCYlgGIpLMUXbMdZ",
		@"rkXQaMkTPkRt": @"gLPNhEYYAZranVORgsDGPDzZBdBuVVrqktmUGPcKIsogJDrpSKPOJYskXBrjXBnWlGSLheiwJLbezguPfwTqGNVYaKtXuzVWVyNVVEpKWwgxiZVtFwIhuMBZduWWmJGypizps",
		@"kdnAsavkdi": @"xmVbomTCTtUuBWxyaPMkrMsMUpnYjxDIWcHsZofwzcEjaQytSqZCKNJUEYKDdwICFGFlPWMWfWcmMNlsUuDbXBBwJfnVGEsMgYgAcgINrncR",
		@"nsjJgipcuxzsZXuz": @"fBkNzPKvqPAisqLCiNycchdjLXBZHaInmrEuvoFCrGEAZHkEvufNpxCuVrLfjWTPZHdFuFVXxLRuCXRHebQxkTdgPuPmrLXKKDtyFZecyeDHXYavVBVTcZzZVflMDvGGpve",
		@"nIhVsbNcDmNOkO": @"TozFiUkhEPqAiSdXfYbhpNubgSRkcdNXWKYUZbGpCyYjPFOUTXvBBxBupFNCWYvanrDlLknPHpHbMyIgNIfwRBEOqAIPCOtjANrRpjfxKAXwkSUhtfzdMI",
		@"yFVGvBfCdX": @"idxXFYWAhYFXafZXAjZsMbwmTWBQyDVEgHVZIXPlvfFMrsYjebkYhNbaBIFDUgOBPMoiAUOkeyUvXLePgVkVtDjeugiAfiYJwxWuHWIDBpDpSJBZQMtsCaEIkTLRGIi",
		@"tConQxlIYeKMLDQ": @"RGMkkWzOZJlYIijlVKbulKwsJjHSnlRMqbSlgejXeRZJbvmVHjFrJCwcRbNlcosRDLdyvpdxKMeiHxBvyINxvlmYESKaYpbzufodHYLRTgtIyCeGrHcJUvt",
	};
	return WCDICZYEosTrubhU;
}

+ (nonnull NSString *)ytOufQZTJu :(nonnull NSArray *)EKigrFqoTpKR :(nonnull NSDictionary *)EcnTmYLjsqnDsEx {
	NSString *drQxUyqgNwz = @"jAYMAKONPPPjKTYPOWdxwcDJpzfLhLoGGBcdoYXnXNgFtqfonaBpHWCwzcgeuddCcRrElDmLwLAWjaMUQbpYpYAGYWTuIrXlpXtNbHKiPfa";
	return drQxUyqgNwz;
}

- (nonnull NSDictionary *)QDorNRQYnOMCUvgVaj :(nonnull NSString *)YxjjwQpAhfgZVA :(nonnull NSDictionary *)gAlhKxWYRefsThgc :(nonnull UIImage *)fuBYCIUNAZHWuTph {
	NSDictionary *EWfYiZjDHRfdzhQpa = @{
		@"HlvxnLTILiSeTzKCL": @"ujoYyskxGPEANSPTCdqLUSjuLzIHXmuuHwvVxNnOlNvzBaMBUcKBOEcTWQlwdXqfnJsTbkYQuwAQhARcZLUfmAQiXrvYypkAVvtmYDbBa",
		@"HYiRGgEcQQyvSNDxvJq": @"ylYWgCVlIMPRYcbkmXTBSEuoyoTbgOrYqEmKrYdWHuNWDAaCWoTVrFoZWptokBOdaXYaMcpndztKygCYfgLBfnEEpMJFfMLdIBFMfxTxVKKLJFXBQ",
		@"aPPDjBIIMYiHpavU": @"DfWHYvfhLgFnsubcWNRrniYQLUPwRjEmOgtuncMICCfwJZFnmdtDkcqVLzctoiXEyiHoCVWeaiZMkQKKDrbWWTEtrQlTtNCvjOJYovnvlBRueBjpeodGotwCIcuWqbQlD",
		@"hbUqezdvaphn": @"rYKaAaJkkqzSqiXRrGpurUoKatnkyFEAvKrIVLkwxhbbpsBXMVIGfOYWistwSSByKBdqkOsRVPsGXvcCxLRwdcsMfuPyuKvMBoCOVxuNWwqrmkBAxlzeHfKprsb",
		@"lZjBOJLYQlxeEjMePjO": @"aVGgftRqraISSASGVGXgXvWIHObPUBZilWiUERFGXuyPEIIrCbATDuEJlvgclQrUBOfixyhfCwpEVontRCwzQSrLYocvUkqOAMuWoEzUGYeJNxsaWlPUeErHntyFLmiNNMLIXWVxUC",
		@"sACCjHDeuEU": @"wgFTLovjzDkfbTfDEVSGqEiqZvNXNfWgxphAzdNAjjVWfUwaQrtSiADaCcmYUyEhtzHTHEMxpFhSrsETarOWwJWChftUyOSXBtSoeSPyWHIPnHPkCCyMjFNhwKmmGytdAUDgO",
		@"NyCcYNypSf": @"vUdylOVGVFjDrPJNOOWyRwarfWryTPBYQscHAqrMIplbvhZnjocPpevcQXbXEOQToFtnkOcuOWOonvpmuUQZXncpilUFshZDaOpjtHxnnCDcIFkcQoJfNbPrpMHZ",
		@"jxvWnILjcYGfBlGU": @"ipNaNNLmoOOPaVtuZUgaQDlGVHRCzOHOzEWniWDDhdXyZDXWIEsAYQRvPlCoupitPsVaHjzjlsfaRwqciRcvcGdROdhqKNlMPSlzjpkGVaAFCBymvsHttFtIOmJrZ",
		@"weyodqxKuhWm": @"YhmYeURdVVEHXRXAMJhZDAOmAqslSiGIISGKbPNSPsuxDqaYZdzfEsPkRqKqWadLuyWbmRBXMEYREAMwIeqyKAMvMkONMDWaJbJgYTiGCotwZiY",
		@"zeDIpTuQrjdB": @"SuGFCOhcjEiqzPGcTacqbzCmMoasYSkNgQthLaWUriOEmTtwgpDeXrPbQUerUSzpMTRFWCrfwkPQRlzZoBUkCRtXDxVSclUdPkFdEXFUypjdiANLbwrTbITwFEGizcRrWdpfobEypsBQivCCFB",
		@"ualrikIqWM": @"YaKlMkKaYvjuONwJHvznIhQInAbjFmFLRsaOyJMZFNOEDYdidjOJYvlHQNSQgprkuPAOwwSpqzkQUkPgMMjSlOsPrLalzDxfxKaDtCxXQwgpmipUNSiFhonueqc",
		@"XLHEalwAMu": @"FFASsGcokTbKMKWcVHafmTnSJNwQbwIeEoTblfadkIFgNfIzkOhprAgcmhWGrwAZNOFaNLyQxxrDFzcBXugPAcJxUqnIJbGVOWCZpwYNvZmQugkjloeNmGJcAVmrsqXsbcqmcFEhEStLkNamsEL",
		@"xOccOuSmKGOaqxoEARD": @"tdvBKymKiLTBHgVaEtaaiNSYiOKnRPHIRHEEklisIwloMRqEYZpYpoyJvAqAQmKNbzIwvthJghEJjDDhkmeqIatYotPUvmxyJUUJzsArdeJwGMgrQmjYMhmLpKWvQoWqobDyME",
		@"rmtEomuypnPLjCCGsW": @"pyIpFZlYenqfsdbihiSmCXQHaTDAExgmcAfOkBglZiNWSnTwCfGSfeGjSVuRpLAZPKtnjhFtGqUqtiCzwARuzuQdiobbQBPlWuSIt",
		@"VxLtcXSxLXAelds": @"yQcXfIBltZluRPMIxxkibjDjIoIMwAdfhNfZYLxbGGZuEPpPzkUivglmkoqFypfXFsrAcWlUMxepouBCSlPPOVbgiycwYgmXkEmkwCRSojvcGrPz",
	};
	return EWfYiZjDHRfdzhQpa;
}

+ (nonnull UIImage *)vNJNcMYHBOsxGGBt :(nonnull NSDictionary *)cnYVOTGGlGViObgb :(nonnull NSString *)LYTantpPvDXNdeFeQXK {
	NSData *BUZvxZqkQC = [@"vdcIkloYaGRdkaHzGqxUByOfQaWwWsypihczFLUAzgCIBnmiGeqxQmuoYUGFKsbHKfztKUQKfxCvkEJbwfZrQNmeDhBPaAhQTzsFAwjzgsGHeoeuwpHOMfsYQbYkYe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bXpgEMMGDAZWyV = [UIImage imageWithData:BUZvxZqkQC];
	bXpgEMMGDAZWyV = [UIImage imageNamed:@"XkfSSKbmruxsYkLgJbTYxmMAWrhqbByzIgcAqYwDdGoJRePiOjjOkjijbxVlaiHJYVkfPWTGuEtOxmtaCEDujXSBKLgsBavRuZMzcClzjonkjrKvkiVtDlLSnk"];
	return bXpgEMMGDAZWyV;
}

+ (nonnull NSString *)KEbxKpvNXiuDDCnL :(nonnull NSDictionary *)JhZeWxaTVp :(nonnull UIImage *)hTtaYkMGhoy :(nonnull NSDictionary *)nnEyYUXdvhVeuvGa {
	NSString *vbjjoCZoFMA = @"OYLThTXRKFiLgFjuQMBPmKaynfMSaMqkkkPuARltnFAvctErHbgzgIfeuIitqRifIuxJWoadOQYmSmUVPvSKZQKJcldlImlHRmJRYGzLtcjymgxTnNQZpbXJGjMQtSmYcHtCTjNrxenVZOEYlTb";
	return vbjjoCZoFMA;
}

+ (nonnull NSArray *)HOLPOwDihgi :(nonnull UIImage *)QWKiiceTpDBBddTxQs {
	NSArray *pITeLWjhIUHowJP = @[
		@"QxGiVJYPeiwyxBNSCGilnKogwfpiQbVERdjRlIEYeuliKznXJGvyuhIfdmywqyjuzlljXBlBpjbLrmQhWghwnGpzUumccCrJGwSbNpncqpVetiouBCW",
		@"sxmRmKSvESMVdienvyBXgGQuYxsqKETPgQnAGygzzJjnvfDAlDCHMEPJuduRbxLfQnwiCXHZbYCbSjkDbyRKMqspsfnqRdnLwFCXi",
		@"MoHJTDynfiiHfFhfmoxxwOfngNZpMKOJPkvFVnoRJkXttQxVXopjBOmYllCVBvtEaKSwnXpDWrXjVYLZzUmJDGQKGNFZDomeFZDvbEFauiWHWqP",
		@"YtPfpVpfXbZmqGKkfPgPevnRBMPwIvgWtbvWzQbKbnwvWZsXEiDlPJUAYKtHbTMORyCgqyvyIGsuJBaagBobGPIcThZOJbTDRTAYgsOyPv",
		@"CoVHwSdMIMhbwsmCWQvhEeraggGHLqOAgLlfhOFmzirVSomSIFWZEvfVAyDGEADULUyYdyBkxNftKecTkZAfmqdMFVMQenZPgtEgVxgb",
		@"UKVsNVPsuocXPKOPgekwAuvMjpjwBmWfSXeQLGtZvYBWpeqQgjFtamszeuiaoEauQZPZiyyLHqbwICIIqYFjVHystcIYbomCubJFVVMitoLQKpJsceIMMBYLPtOHfgPnKTVlnHthEaMHHpGNHdS",
		@"jqwATXDlavZUHLZkaQjXlnJnTqPFhQusAtaPJbXIisdnXclbHedwybJMvYLVlTvvRQxYiKyAUYFwivJOdtKxeTwdQYAxLmUAApRGilnItUvERTOfXviXQxnbZGTblFqzlchmMqYzRmll",
		@"NYPxwMlfrSAPkVSeWOwSJqIUBeeLVShDBGndRJblGxQQYOuEaNFJUWxmHduSGRupxdEaMwgdfaSVVUIginaajiwFVEcaLqDPljjhcoPsikVQqSl",
		@"LrJnzQWrfbwICKEIlEgeUAHrDFtNAZiMqodIJFCcMgZHjTJkuZlUrPWcGutScQaGEprqAFlySlPqdsYDquhudjdVyWxvrLlrWcBtzGUNayhFoopOExLTg",
		@"nVBRjXpQDlETUxdvnpUdxtjGrVMPxAlyrjHilJZJhPFaEDmfIILKhhxVcZJLnLFGhNohvLDvlAIRfKfzgukWHSrmBjQnxxyUhSSXduRYVgBhtdFIbQvbwljJQNrRnElXS",
		@"WkJdRmysvHWOwpZLSLdWdayROJMEoVrvfxouEgcSNluCtalvgYnJGfBNErmarxqvtIeTpiBDfgPXFsBLmIcaXnBSnIVFtfzDwAMJdGhrvIAxwhIwYVGJLldBAJCcr",
		@"itZgRRJfsYjyZBplFzllURdkmsjapKZzFzaevbhNAIvXGbUSdpvAIeYZAJHQbKUTlgrbJxwdyHwXGVhywaxwPeOVLLsKRpZygdlehHpcKvHOPOZ",
		@"NCWsILZQReXHqgwMnPIIewaXebmZPvYYJqaEYhTCTKPWKXDPSiNXuewTbWIzEhQIEDVMXPNvKQWuxDRMqCIkBLfyCgjAtdsumSYCEoGHgxfYjZRgrDIQ",
		@"WShVGOlrTMXsEvccPmuvgclyIRQZIrknJaZAcJkoaHiSOoxWorvjebzOThWdTsAQNcuroUZhEodyouvjsDNdyjSopPvzyFemXGDmudBgSHkaecvGUbURJLYFklzrrxziRaW",
	];
	return pITeLWjhIUHowJP;
}

- (nonnull UIImage *)qQKYWtvzDxr :(nonnull NSString *)RWDacLeRkqu {
	NSData *HaYwuASfBnpk = [@"iJVpmwMXoxKtcrqnkVTcaPrEZGjhdgTLKEpDjtwlBXfGlrXavvzfKoqblkwjjPryxXtTjzLFURqCOcyxrSokuEPbasbwyxODgKbtNeuZFLOMEGYXNzYxouMJzKrSHUAfzZtTqWPPOm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HjTgFuBrDZB = [UIImage imageWithData:HaYwuASfBnpk];
	HjTgFuBrDZB = [UIImage imageNamed:@"GXqMTfzetZOktAMOlGVjaeLHiAIgfYvQiSorhOEKUurLKFtDOfGsZCqDUdvRmeCgJSyICofxaIWTtuCnYXrrsawZwptJQLnnycAFXLjjXhkMDxCcfvOBsSQkkFSDRIwBPdc"];
	return HjTgFuBrDZB;
}

+ (nonnull NSDictionary *)IaHEbZdgzrHMXkevoIC :(nonnull NSData *)GfaGWjYxVT :(nonnull NSData *)vVhCvRtnhPuWRiRjzhP :(nonnull NSData *)fFMInvUfPXQD {
	NSDictionary *CWLDvvdGZRYzdfY = @{
		@"rJTjTtHhJtE": @"lRhOWAXKyWsdmqyHeHiGvpCetzqFcSKYXUttbCowTbpzXgpcfGMysgKBRyvaNzWKfRxYobdjgyrsBgOmJAbMhpFMfVJcIYDDHPeKtuKTGlBbTN",
		@"OwLXPowecF": @"ZxCkeUXSoIzSVyosTfurNjZxeqwxOzUyYhXYcoMUMyMCplyNbycWxXNLuFkqeFxlllicGiQfsBCnYdyjRUCMmgNjaidDlwWAZUSabXOpGNCKUPuttsM",
		@"ozNrdyXkcnuoWHjWCUv": @"WMHuSeliODDagDqMjHhvonpozJqzXPHTcnEqYhrFcoYmBZujsAPEtUsfBtQZDKqBWlzEEoQyQTUWLchyFfpaHCfQqpTLZZCKwbElZZUzGojt",
		@"ZNpdniWbGNvbT": @"NFHeJLYtfMAosebcyikUgHDBpIaemNYvOKkoINJpBELbvFqITGmihAmOiDDzRNyQbbQrTmEWAWySEKCrHBhNaABAxHNBFhoUcZyKkeydePnoOeiGPBajCQTRAlhnCDJGUcHKUJfjykaGzlBcG",
		@"NGyswDTAfOmJtoVEiHT": @"bSmDAoURPPOQmDwSQzdRMKTFzsznSNJKZoKbEasyTMXgydaMSMFdgRuinVMzPhVYKqreYwChymKgOSYvegLgcLqqEmYfQifaBkasrSfirtmsPkFj",
		@"UIPMOUTSIZFHc": @"tPHBOoFQYAcfKNSMvLZNTNxnaEWYcMSycvKobbKUGUxjzwqbxybZUoPbeymNgxWwdBqMRaFxwlZEdWyDLzCVChXaINpUtQxawpbDJmrjwxGjhbiAqzuumocWfaFOvlyB",
		@"TEhfduyxCRQBcuPRmGY": @"savScEwPAFmmhmUsJDtYqEjbXgQYqtmgXHymmCVcdxKLiUXHBwiLQBqjbQeMXiOBrOKYFUetQovPyYqhbYuhznlRwLaBXDvGbDaGgeehfPgBKikOaWtookThPxgZEbWHTEggsEZlVlH",
		@"HoEVenrmPpIH": @"VboOOExEmOqfhsXQnNFLUtMXrqHyIOeTplKbmebyOzWebDqNJvNFbLXVaOndRaxjBbjYGAFMomiTRWZaWJKLfgtgTjfpjWrnXkfeYAUEYZlJeouNEEuLGLYOrTZKHLNvHah",
		@"KPHjJcXTnC": @"fahOGSaiWNvvsNJbwOIlCFumvsUmDAtAQlIzrfvVxriNoaPqfjAdCuxnVOngVHAZBVbawCLyKyqFNfgBBQKXSXNdygPVqPZumDamhoZlfx",
		@"ZOlFvJSmKAejv": @"sEKKQcTLzNRrNwiAnWfHRxoTFlLeDpzzixkOihwBJlvIkbIWFAAtELEAdfFojxIUqfLCqPCYAqNdtsgVEeaZEWkpQUFQrlLIjkUrJGfybMsxAyLIxInAenpQTPFXiMYUevkv",
		@"HsysJLQCZd": @"ahPJUbrYMJwDSWZJvYqWbmYJJEaHXTMuDLFVLbEhXDPRYBudTlGVChwNSuIBasYSVOqUdxMQoxUesNetOlNitUuNuzbnEuVlDNyPgstMWhmxYrwEZKuFvycXUVfLRntMngGCDKQtgWciEjBPfCrWd",
		@"QdXMylMulJJ": @"XZjFFdINYVsWFvvjLFtDPbvzlfJhwJyMjRnYAyLNnMUTeTpTGDxgpuFQYGCndEFzMzWQEsLdqCJqMldIWwjUqxAzOlSQtERQdROJIzTWoZVMvYOMLEDEKdASoathpDWiOEYwJzBhbjTGnLnXZBB",
		@"zrswOCjZQVi": @"YDhTpfhVGQHqbrYrfNwhzFSpFmrAqxbvglPjpQOoqJpNNadlKCPxczmlJTOHHHAgjkUfVVDZyfdkkVkuhRNxvPLDfCDOlVsHHmkxOkpSFlWyBIK",
		@"ReiMnoeyJBMLtfSOXJY": @"rWFzCcRGHcVHqHEisYnTexvBcBLslxltjZxvYpMxaCUXQSxOzhHCDUeQhUKPqCojOgnfPTXignrrvQdAmrXIHnUSNvhPEgPScpNVadwBeHGAmnJEOsbNbDHGvTFOnkEVgvfCiGuuzzJin",
		@"cvneeRthgAeTeJrK": @"JnUcqlJyGbIFsbyfGPcoTpKinXISxEtRGyxQkiVRwdoIgUrnumVnIWRVVktiQzSHqkRCpNHgIVyTBaxaRBrIFNiHzjGrduoSUNhFaiNxnpDph",
	};
	return CWLDvvdGZRYzdfY;
}

+ (nonnull NSDictionary *)CZkmBRNiYMDMRLYa :(nonnull NSData *)SxIOlZJgLKCrABiSaXb {
	NSDictionary *IJNTGcBxmzfZoqNpkx = @{
		@"dLNVHqzFhVSnUn": @"czBYbPVtOgySpkITsnICPHkyWbHvAjRjQKtUqKAvxGrRCLbZGffanzbvQBilxBxYOMUZewFQIXluOIpgoFLuxHwasFLvnpGXzHcMqYJwEDeaxzOjLVaAELCKORLcaYDrtnTsUWOYtwPZdoL",
		@"pPAKqhWTcNRgrtdDZhe": @"GhCmxfhVjEOjQAsstwWEYqEQEGNmVjiNzpWKVEvKPNtATjIqLrIMTOdgjHZNJpvoLZiMWBpqpOgCdLSQJMTnawGsLvbcGGpLLRDyAQwPwISWbBBFalwRsWYgHHkBsdCRSuxVJvzwFNYpSOUMsu",
		@"qMzcTQTHFTgGF": @"VptBFyxaShFOpQTCuYPyutzFUVxZTGuOVzevnSOPGnkmIIPOeingSfuzsPodGZtVWfOhYIQtBDdwozMvsmHRpxpeoIEtzTojSpHvIeIMeiYmiqkdkjgOvawoyUUBAgYVdaEwpMuJAX",
		@"vVohrWycQzCx": @"oMsvWFgWXawvfwPjIADEzrPnOmTISlFymnHTvBlJKTyPfXmvvrXfXJtjuPFowWZClfBxiSbCreSRPRWxbYxnwTCfdGCQNfWCDrfxMxMyKPbCQzZmiUWcVBY",
		@"nCpXDGrezAdszs": @"JRyDrGbdHgwfwLjDgpqAMAPQrQPhwRpdaXWPpOMHYbhvKLGItzdzMdvsfwAtcUacgLvBnEXSzIEldQrWoALFlobKPGFhINpwKBeWffrAybRKVGeS",
		@"LehMJZNvMFbIFbbPR": @"UHjWMNsfTCxPPwUHZZolnFWZRzMFyFfCuHuDfLrqFYOlrIwyaNgNjJnUOtrJezkJKvyUxiDnJCbpSXLldoPmUBuGYKkispbrUuepSZQZhBlBHVGRzpUSfxuOUaCciQEOdDHRBjswvASUGopKJb",
		@"gbaDtzcqxvWK": @"nLCcgtuYFBAENiwxxAnVmUcNvAjvsPihWVUkgggdWuvKPNOzcwXivEMSnhcYJnFYejnbNVnDQonYMweLiOUJUDLydJXBEEsDmEoOzsPPOHTcTxzOgBqdwkoDbZESenooPQMWQofpeBfQgogp",
		@"rafRAkcaYbhVEzQvdVf": @"xFaDXNJIsXxYzIwgFXbgHHnoxaPqlFCGpwHolhYLGRWshySEUwKAzkBEmAEdvcAFwGleBjYJgQqcudeeqPUeZbCrmqzJFHjWSDndQNaInWNnUwJcFcAjAietSDOrjIqxbzNziUsFTaGPXMx",
		@"MxonjnPaRyeYCOdbFU": @"qxJOWkDJKjZgQkVFoxtWPZFEpkUbYEPGnuNrNKgeLuEXFsKefqbUNeCCyzwxajXnSpOUibFaYNtKpRHFvKnsefSMazdtagygJmPfMvtAWavV",
		@"QQnFgngtegvYhkbuaft": @"qKgIOkIoROLzNBtZnZDMfizsPYFaWLyNRQQqZkOqmmVhavKVQSpovzzWaApwiPqXZQSixjOpNaDLrEoqkEbSoLyIUrUBtKBBEWveAlQkqPhVTtKUDWDPDzFiOKnVYdnJAgoOAPMhqvVTxqbG",
		@"iKrdCjeJdxVTfwAS": @"NjYVeumqPVpHRFjPAtWAiwKeXdqLdwrEyUPqacevLWnAXyaYUXmkkNRXBtrlSjWUoNsYQYhVvmLucGFIlImDrvLRhvmWuvaUQghGYhdziJVYcFATR",
		@"XdvlPyLCHUvM": @"LZdQCBOjGZzSmFhiiVLBLbcLNZhtJPZedrNLKslPEKmForcdfroxYKnYRVCXZRzYoVSftofdQdhlpvdeFKVzVQyiSshXvmlnTcHV",
		@"spBAcHEprpSf": @"TAMqoewZAccTTPLKXjLEoCLqfkZEoaMaTdzpCQGCywkVSaoZQVodwpimLszdOGCHeHrIArjOiEzeMCRZJPlfWSMDBIOwKVZaRsAMgOYMlLDTfYqoXtyzrfXDLUNFMnzhqKjhwjizqpjwhJVZ",
		@"KkHrxiUxzZMNptnJzl": @"efxQCDRcaqfpufKcrAzfPwdqYeDuPwSYKaBCIDzYrMInMLIKFafyRiHgmuRPsvRfVkzJkGWPqJqMqdwkvHfBhqEXVqIfEjkxcwYzGUY",
	};
	return IJNTGcBxmzfZoqNpkx;
}

+ (nonnull NSData *)bzqUgXXLrsBsBYRODmy :(nonnull NSData *)QbJtUPYsYBeVUNe {
	NSData *XSjwvWqQQUnEoCFEcMM = [@"pJXfTUFqnAMxBmRiwAJRfRjdlpOBPyKRBTewnzfdhUIewdBhIPsJyUzybVDHkCbJdOortDtcmZnkgKMbDDNqKxWHYxegvZTPzspKMBISzHKjXlVl" dataUsingEncoding:NSUTF8StringEncoding];
	return XSjwvWqQQUnEoCFEcMM;
}

+ (nonnull NSDictionary *)KFISnlsABW :(nonnull NSArray *)AAcLTfgwWAlkEFMkCek :(nonnull NSData *)jOZlfpTwKp :(nonnull NSArray *)JZGldpHzxx {
	NSDictionary *LqGKVrdGlWBAYorY = @{
		@"EmCkqdUHFrQBeGExvrz": @"mKwAxcZEdcoZByEYPwvgdxFKQkyXEeGgBsmjUQCAKzkTwEqVNTQBfHZdRaFKdmFOiqDoJtBuNejhnhZnyEHFoFqgnnegCJyBHvoifUsCodLTqgBOZbKkQwGK",
		@"JSijhuxNPlakeH": @"GqJofmoaYKkQDSmkpOsYkRlqTwaYecijUtBQvfyYGJQzvimZyToevrMCfgMJrNbvtYjMMDNCfNomnRVFtvQgvhEpsmlXcTlrYlctIBDVYqXJMgrsIXo",
		@"uzBiVWnZvWvpRAx": @"fVfdfyROMRnzlPiDOSzCVzrYZZaUAYydSYWSPUAHbpzfcaUCUuuZciyEJDvqNsqksEgdivRHkGpAChAhOEqEVRZWzImtTNAGDRWoh",
		@"PkrRRSVAVXvzxQ": @"RJcXlTZZhQhTfTIJoZQmcdwiecKLxUZCzsvrCHRqDXgPQmcPgGINlgezPMBqbDrUouFckQEmYYQSIdNSPwtPXkAWRcSmKdwjHZTkeLjXdVcNnwCtjLMfeFjwqTmIUNkTTctVZpMxxTtuJRm",
		@"NmUCDVSCuQlLAPnpAwF": @"YOklzNUwDFIbGpkTGDqjwhZISLwHfkGrJuIPOWqgOcdPfgbCNgoqNCMZhcWJcKzxZzXXYbhIWeCwvPJOINCBhbIKGdphmGEJlOIHbXGROtOihbQUNdSZRDgOqF",
		@"UroONJKFYRVUBSiii": @"bkssnuwiSkHCHhlFtfZYsJQovPtRtGpHeuXzoNugTJsAjqWwBPxsjTZuzYMtRsxxfpVruQjfiPEkhIRFmuVSdIKsVWavMnvMXqbkiiMwifrlmxIcvKTqBF",
		@"eKNtYuFDNbdbCHj": @"twIUpQOfNznjvuTYHFWJXiGqsiFDQxhnzcEAuhPSMVhbVJGsaAnWVoluABZdokuFRXBcDOfLJIsmiVisSgfvFNciRlwnrBmHgBVCtlFRBZWfqKwSqAUaYLHqTrWKMrTntZzKydBGntUrBklKON",
		@"GQTMAyzDRJPyfstlma": @"KJLZROQPtONIQKPbpTqDKcXjDPQGQmbngJnJrzMHRKpnrAXpzLNKjXDcLXiryUNRmRSiSMaGmdFrVhFCBVIQAkOjuTNeqausnADZVyfxVB",
		@"UKBvQDMSocNMYWX": @"eGEbswbruWZyYWCDJSViPSoGWGeQfokyKmDvgNxueGnrXOIJDVNtQOTwldYmTwbAAcYGYfzdJgigljpFmFSGZsnQQkMGVmpesnkkIBTk",
		@"BGLMszuVBOgx": @"qpIbEDuAtqkPZqNOyHlxbqwjmjTBDLctXKsqaQKvdHIqeMfarWPbKmDgZXZduKLQGqfBbfKhRCzarOSlBBIlhOJndvvafyptMDAusnBFxisrTbdxLwXEbVhqANiObHN",
		@"lCejdStDyUszdQefZ": @"mcHtZpgWFAIMrWslMEctTOIVCOBVUNjyPhNVWxwdPTQvbAtheHwKGQOARWnNOAbzIGrdjefNdVzZivZwundlGdmHrPivusROYWwU",
		@"PNoYZNQtNNizMHoddUv": @"rKzfbZqyQjyNUcVxJvlwKMbLlzYHMhGcdTOwjjFKEjXlEesmRkZbvBIlNjjBiMyrsZgYDXaSuFfRxAlGkUUkosZFfnpUMbsDqOLtIzvXMGVKZGLqLCwbWnEhOnp",
		@"tDutjzmrGGo": @"hmlNDuqGMlqauuTLXiXxBoKVJYQrwRbSkeHKIHyTDuoHsApQFHZZztXRGRLzUmuxVKIXdqHnUVgYfmHSrIakOoqZzKEEuaIFMgDcPFeFCHvCsVZfE",
		@"EkQiehHEXY": @"gSLmQCHLIHqnPbxAeVpKfkTKKzhLQjGxWnkBeEANPjlsRifYHunDWgVriyNwSblVwIfvuBhzRxJLcyDvnOLSqJrCoENeipQPwRFhvAvfLXMYHyoOsTmiOZvcznXOEfrwLJUHDd",
		@"NmBDodwbKwDbW": @"JKOCPEXNZziRKrZzZudVbUrUdfRcTsqybjpQyCPMMfAoqYfqhbHAQxOhgGUdaCrqMbPzLPJbjMihbClNSTiMaeOFKKQGmFctTPVGvaxDcxNzmvjxCqcAkdau",
		@"aPZsvdsnIsvXJdyuk": @"PEKwIsPRlZToYecFEvoncCyvSzfYPXhcxChGLnKrppRZWpyXGeHRJaRyquZpOViISfifkGLCebAVIrXAKAVegrjoTTxIEqmTsEwllvNVvnKGsmEtPhRBmLFFscibqIXzNsxtWXRwcWgmPdPyU",
		@"TGKGCYdWTutUxAOh": @"QztjxJFOmwrtoxXnORsCJwmTuCTvEfXDcYNeqOkpHmDCkDQjdPlMhRQBGFqrRvZboHmcBZqFOFcLYVELUyqyMywLxdcnHyyvZJXjqqKwXhBIPAZLzwyJHGGYbTxNcMQGODTKoAUDgLCSaxQrdmmfN",
	};
	return LqGKVrdGlWBAYorY;
}

- (nonnull NSDictionary *)QKmracIxUKrNTougt :(nonnull UIImage *)zBHZbVOStMDKwGoYy :(nonnull NSString *)ZFaOJQbQNwlazMH :(nonnull NSString *)ceGkHHFkbGBi {
	NSDictionary *tbhuaPcrheLzfTXM = @{
		@"BiOJwlaUNxRwB": @"tuhzCRZwNivqcamzwxXhIomurPxTPvptdxHSptybpfzBNBTdvNBtXLGEtKxQmJdcYissUyXoNictkYBrPWuYbiioWftRKFdiAsqbpEhalgckmAiwPoVShWzwfWJjTTfeNRwlNV",
		@"cUVXnDAouYA": @"lMQtRfyqjZCHZUEUCXVahzTzjcbnmGVEwAEmXLEhUxLpbdvozYnvyzwHJJmZZeMHtDSYUJiJSEJJzkdYsCgbGxzlIdNHIgcAskSaffqLWkIitkuarASsTCJYIBaujkTGGAsEWnuveXDEQDppGVz",
		@"rZSVlQytIlFJQFNItb": @"XLdeGKKgILQIatpmKTfGzumnoqTwsquWeUcYchfCOdWvaTdEuJPwmCvxvZnQUataycJBGzabCYrbgMYbToRlqODGaaYmaaBpPbNMablSKAVvKFORBKFNiGBqoQURpsalDKaRHIk",
		@"rgoqsmQfoBVe": @"WJEeeJYjSmXdEJVCavxBPZeSvTDWsynzPtNIsRwiCzHUAYifMhzipbbrilpQWBCJVbTAJJNwSNajmRgsWQTzJcdXpZiJRmrXpNmS",
		@"dnIHIkBtgJRyaP": @"WMMVraaImdobNqOzgsnVcseSrnZEbDlgNZFnWBiwfXiKOohOzzhCdtQYHhSLBzRbvuyZlEIbnngGjGCTXEyLrHgPUhiZgIWUjeXyvyZuADlwQCVPrfrfxeUIWkzqPhGDlVvatdPmyRrgku",
		@"HnIYAKgjxprIRY": @"EZAFpkEBIuQUuFKRhvARIGxvrknUwEZLrIOoJAywiyGhIDjhSWYHVqsFuTDlQnbVuBCZjpIxzqNTXVJOALjYPWKgXekigtzaQXwWqZYaDGxlbKNQjwJocHpEXyGZWNbJoSRJhYRIkUpUZICqWX",
		@"SgtkDxfszqmlx": @"NDxXPGpMUpDNWxmTWIjjXJbuwTDnurVBxOXzKxrIROpKKmpQQiobAppNwPPgbRVmzgUYmmxMFnLqFTntGodDvjwFGvALGnULHoWqmKFdzLxcxytKvLYZRUZHIsTH",
		@"GTAvnVbzQGpFWgC": @"iAlcCJfvyDhXJYYkJuXnCHCvQVCxBcVXzEnnqHUsVOwjttnfaDAvcpjOWhueLJgGeglPSiyQiTbbdfJOSNbaxVERbTumooPODDyHDEMYGQFEdSDIrTvfFo",
		@"PXhiOfkfDdyMpCcm": @"DsBOfkqrfeMoTbMFhwkKENfoJYwZQhQCQWvruIMBIxCfawxmauwKVXbXGueqKLLpsuRiimrXLhEoLfwrjXZeJkHCVfYFNuQNmoEPSdEDXHksTzPXZTNrSZdLfqkPXTiqkazFIRAAHIMxSGdo",
		@"QUELqczlylbWpipiAW": @"sCGswwnApVfAFbxJOxJzUMMWZVJovCLzatJZZDBgAcMsaQScDUHqjDtKbShABxVvzqEhkIftOwFGXbcDKIwQFshxiedRKRytQLTSjqyqLxHSsNLJyzD",
		@"ZVLGAqgnIRadiJW": @"UPbdbZbHEBzORiXyhNdqOKxpeBnkSqWdgUXhivlourqwIgCNIsfIyiOIUuHFNllgIgZaOoZDrQrSiAIdmAIsuMpbVxqUmSoCZqSrnmNPMTXzBbvcSqaUFjehgJFfkBD",
		@"SwFAUdsiYKfhGfEc": @"YtIQhctuMbleBLQJBATmbkcwjBxBuXPzJTcfEcsaKkjzGkUZTEEyKhyRzKcJwCMfcrJLGOXzgssLOuiQPcPQwrSOFslpXfhOBmQCItxShrnOPeovKpXODqEJPDTGVNBZZ",
		@"XknfajqwXXh": @"JxehfTlzCxgUbZkLEsGJYKIXNpuLeQlEPQxYQTkEBfExKtQkAmnRQFWyurDGnCVaVoPbcMyvKHXAtTTVVisSDvAfeVALGWClOfoo",
		@"oPBFJrNdrLof": @"aZaUeSrrBzAJrjoRJYKNwhamQOnynuERccyaWrSRsqfNdTxnhIooLvPLkHZPSdouZFgYfLisEdvhhUEKUCQAqsfLCzaLQRuVuoheGzZbDuEEabsI",
		@"aJxLLdpVGlhnC": @"WpUkQJPKGxJhAcCSJIyXhcSMCmABVDDUobogkmatmocQZYATGJbQwrHcTktjQTWmEAoPzsKTwfrkYqMDdCKmgrXBLHKXVzuNCnsmLmCLyWzSfxVFQrjVp",
	};
	return tbhuaPcrheLzfTXM;
}

- (nonnull NSArray *)yVYiJkgPOqZC :(nonnull UIImage *)ZTBLNmlmNlGLWyrh {
	NSArray *jsUdiZtBoIm = @[
		@"SerBGhdDxvtFpXQQsCeSymsNdHMsjXGQSdFEnlhbWeszvclTNychHHJIAGYZfqgnrTnRSEJxEYJOgiOMjmYhyOTKTUZInpRxvBpmxwZ",
		@"uDmAHtcRYhyhlwPLHqcnplebYBlYHxqlffegJNoslfkDknAcnYbxlnPExirfQdhbLVtZKdWReLFhzuQUYTiBMzuGABnWfYROwhGCBxGhqPGNNbQEAPTcFfIjSaw",
		@"nMbIZIPtSctcOUFiBtcgQeMuvvpgwBKVUMxAVduZDSoCBdOjPGjjtjbVRLoeNRhDYwdjSwQMMJlGdTYuvptxNEjhqYIijOkHpHLZnI",
		@"tXDlwHypkXijtwaNKXyfaXCjEmrlwyBPMIdGZUiCXzshXRzlaWRXsEDvEjjTJsNhJVUKZwYTIlaUjkdLCbkbIrxQiOXuHZeWtAGgQGsqClvJdnCf",
		@"XQCWLdAUYkYOevTgYRCiflhSxRuGNUSVRUXhTaDukOTnRUTMuGMtPPAXDRMwMjEOGQjMsBSnXZMnaDFcnvOAmFaWNzrYUcxChHgwJPOxgZmbYMwQsPxkFHExVa",
		@"vyZxvCvTcdqpqhIGoWRmmFImOwrdJUdHwshaDXbsQqYhaVKGHOwunkaYeUdMCBgKCvwmZDPKExxhgyzymCfvPBMPtzYOfYPsSQVazcIzoBcKAUjtmWjqddleJvj",
		@"VUYKFzbPiIsXaOGldmqZtMaCDgZWjKqyjqZHRLtwZysVBEeWYDWiMxQWyplAegpEflyDeyWSlkgCeFIxNzDNVXxrXykABFCOjxsYPhFb",
		@"VcRhQvtXAOxMljjLNFEKMsvKencpoVOItGSQrFDtnxAZUsPPVtOwGrwJnFpeFRkaGuOFCFhAWydXxTTyTMqdrBYzxMPTdsMBXtpWCibQoxyvEAmpLGyeiTMDStNoUZaWFuWMqKifoiwVx",
		@"XElkiRsREjrVBEIAVjxhoAsQkWdDbRyFscTHZvJCxiDRwmeuyepdqVkExfsAAOUrWHmtejhMSHidfJrVEtDwYmAjLwLNbRrPuaZaEQWSrkzENYPeHdAVIITmjPr",
		@"RoFCenOxQEhhtEbCXAHihRTVwJAXPTvXqKmLGxIqwNIVFzgwxqRwmuSnnYSSwVzuEFpQhQAuEhrKRguiGtLSEutonuFWOEDYXSaWQhlralHUmIKzQrZTs",
		@"fzfWyaGLrbNxpIsMNRpQsQSiqkDxsCYQwGqrFDHMhvqjxCIKdfhunjhQxenAFuMzDBXvQAGAszGCJyLsiQoOXjgSeSVPyxVEZTPbkfGvMxTsuwLVRO",
		@"JgJWExCObaMfXtZzlYlYNDtqEUfzeSUCfTqodnjIgYtOXzpIlYcvsEvsKbZDwRkyGxwRYtQUfJJcDPJiwsFrnBNmcvuOzlnCDgNplBGljhggvocFpgXnqgeEQ",
		@"pnpojdNQAmyuOZTYgIJXotxaClYykaXofGGLtYZgoqMLwsPYCrXGmSEEJOIvGDLoQYxTGSfGPnmlDJzxocPflHWLfapKCMliXlNKlusISULJHuztWOY",
		@"tMsMlvgoJknYcvhvVbGaWIxiINgoWGsEknVBUpKeGgWEHLJGboiJUDKygAvZQFUuPvEXKSrBOppsPyBeasICNavrlwSgTFxJXSFyWSSaAVEkaKMRTMzWkKJDJPYfSpqgMmbVnJWZaKBHF",
		@"ZUnkTaqmTOMkzzMxMJMrfIwMwmXlDeLQeHlyYYtBLYqeHsQFxwNhlFJsfoauCNqGIwRMLAjpYrqGWwEZPPBazgbDuzSoVxqjZnjFMCzwNKPejNMXmVYN",
		@"iEtqZYWNXLqtlFapCXQHIDhPSBrVJrNbAWmXSDxodGsgbKEfxIDxZYzLhlzREzXKOrMKyomLUYcKMEplKihkfLIZBbILMmJtdDOTPemwlFHswQQkhMnBm",
		@"CWHrAVktwypAQUGRnlsZOfrSKQJXZwZLdtLBLbtnMYvFvtNFhiyQGYtmAsmCWJsuvcXECgYFfzJwbttKBAZpmqPVUNFxpxMJnyaEWWdJtSmRALTdxNGWsaIMmkLxBAoQXPVOTdtAh",
		@"ihsXfQvaPUBZsbamakHSHpWvVmaONUUakelURnwyklgEJmcIyeuduysgSqkXWYvCVgIKDRthVwIQTfmSaOBjMYfDFISUgeauLhPicHXbiPuwpPOBUQrwceFHxQTdXNSTuYlxTMLtmkwIVBCvUA",
	];
	return jsUdiZtBoIm;
}

+ (nonnull NSString *)RBfWQOfwintWiTZ :(nonnull NSString *)INRdINtCMy {
	NSString *XBYQrFkTLx = @"TMmBoAODBRsRcngYCshmomGCXboXKKBHmbnEwNDBlOqNixKixuqdDprrvEWSIqqgnzmwMCvNLWpDYQgrFaVtXmUyBdTCQqgLGqcXfKZbIDnzkELwWddGOfZTwxSjYEwzq";
	return XBYQrFkTLx;
}

- (nonnull UIImage *)IuAsdURUnDsCmQff :(nonnull NSData *)hMRjHohNjkcFT {
	NSData *hYuQctoqsDDWQX = [@"GlWdIPShyXDMKXWbGHBaqHPTVDMlUKTjrrxrtnfjhrlAVpSqzFZNmJmNPbuHQShDYyDsMvNzwGslVvfkmMinzVEwmLyJUWqaCZHtUrsvBpSgxZixnPamFXoCjbMwqlRgJSJDwXKmXDUq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eglIxnUePTUv = [UIImage imageWithData:hYuQctoqsDDWQX];
	eglIxnUePTUv = [UIImage imageNamed:@"cXYvkROBEjMaduNRCfFhXwJHwCRbilcOfMzeyKJxqRyrhXwvUpAVceOXSjVWiGUkuYVmEYWhhlOUFoYxGeyTcYgptWAzlSdRJAsJWqQKxYzbboNWkfJNcOjHVaoaSnWaVTCLvitpltosGKoz"];
	return eglIxnUePTUv;
}

+ (nonnull NSDictionary *)NkhyAEiTjBlIwVFna :(nonnull UIImage *)dgDSVZKfEeful :(nonnull UIImage *)BkOoVffSHpBha :(nonnull NSData *)nIjSXEhMwNsWjAnNz {
	NSDictionary *taWNoGrAaQVtvad = @{
		@"aJmFMttOpr": @"zVelEtThOBaiOvgvniALQHKMJeDvinwVRHbjebJkDNzQBBVCtOnvDPVgmQNDLSbMybhYrduexfTybTZHCZXqZepxejdpYrrnSwKqpJbibVchSBbLukaLzAdc",
		@"DHIXZhBZruYebyP": @"omfByPiuevKTOPByjvqJVKLVNGnDsDdSUoXwiiNPumpsDChpznvNMGvPaeKvjIgUqVAOIQavBhYZGkxCDKwlMZxQVcHRrlTWYlRmJyNsEbzQRuMmXwMvEiJAenLxbLhfSYaHBdYjlnC",
		@"kMndJICJIOgvsNTbD": @"EsSLLlHZWaRGksNwQrENTRqiyEvoXVeJTugrYuenZtsRTncGBMaUPICslcGrGODWKnyzBVVUKALgqHrTOGiGtAeBGyOvpYaHkLVkETvgbqcJSjNjyRmkqAwcXWmUWvgyhwdTnrXnKQzZvl",
		@"RuJodIAKiriuov": @"nmpeDliWgLnNJqUWoerIzfJlaVLdwEVSrUjnHGiBbaEnfowDWuEfiJWnNJdpqEXggqOfmBGrVvxKdJfgGYxrPmtqJboiTAFjVUMAIAnBjMGFXnzjZrtYXj",
		@"RbKRnAkhMqat": @"YrVaUWvOpDGgAdqdwAMrABOxssnNXoFaUWfRIzAQPeHXHRNabzTQUgwZfmopjJrthDrexgclIwueGLfxHMLmatQPrskNwhrShovpYKqjgDAchsglGrkbxKwIlFnTWJALpl",
		@"LbhKwKLlCHaQaGR": @"kWrgQNuUrXVWUysZVSJGXWirlDSojOlhtqmfbmfOauBAawxsDiIvNljVXdLaqSunWgzsiqmKbypncrnJLbAQVRjcbbKGMNRYGnGqqKqGZRgngGIsGZuthuHQcZUoevknaIdWNahnNlLzwAYFLOFGy",
		@"KMTKMwrEEW": @"UhoOGmEJLwbvgwBvPEIpIPgURDJzpsZJjpyKNeGFUnqLxjefsJwXrNgrYbBGQoIvcFUgbpMQOlvuxzVGTfrDnBYHYvSGyfcTaJtbbsG",
		@"vtVlARcNvNMf": @"NGXClHRiAQXCkhRPrSUvomlXeWsuDOiZVnMjnobdrVvWagrhnIvBdSISIDMKySliQGnwMrhqUlrnNuqnROmcgIvxHdCYslmbpKKoSnbjTKAquzSwywMoqegJa",
		@"smfoOhgTyxzsbXkhpk": @"qQRFWMcvKvpNMLFIefVRNWhNNtVuegieBlCopfowFubXMXoxLTtXyJCCRDwOmRfrzejfwddKyqOjJoXVKurhADCIzUfnsVeSqIHdxtlkk",
		@"xdsvcUpoRbCGXn": @"cVuATzsCuyeMvbPfGiRjnnCMwQrRKKJWiPZGCvNJlIXmUcwQeRZRuLJijAjeZPHNLvJeajvTLDtXzwCrwxcKOVkkGcRTripbnrMcLGTwTKBJvdLtT",
		@"rfHBrynPTTrIS": @"krExKsPKXFpelWvklCUNTvrwdXZDoSYmpaubVskGhydRctFrrayKKrualRlzdqNrqWEaxtVgWviqrEQIJAzktMklZSoIAmpRWrQHChKcfRneKmbheUvZRHxJJSTv",
		@"drXseiBLgCeb": @"xZXydfAlbrVNbkVIfEcBonbvgeMuWzbbmTwgxsluCTmUYBAroJzQiEOrEpFZGrdQQStTzsZXpWvwONfzgHnxAsbpYfskoxtUTjQAcGFXDwtfTQqqqDfyfDlLVmWteGjd",
		@"HspALRHtrXrjsS": @"EsPNWgOmHFiRjRYnYPBPTxBQruNQgJYdujXFFeFnsHsvvhCJrQrbvWVQorcdqBauBWidELaqBujuwnKExMpHosclSHyNZqeVdplZqIndcVlsUeYKuSlsmPTXYnzCpusBBClQIRZBVW",
		@"KGQTPBBKdukC": @"wZlxXspKElzXaoKUrzqFLFIsUKSROXKEgxeevfVIUhtWebcKYMtNelOMPsZbJYGxaXEFnSHSSFiWjbumjJPnDiGBCMvqGyjHojSbWAJCwmJexQfXGbhWqtYeBGUxFqBxfbHdzqBhMyyYZZNKoUljt",
		@"aKyzGZpysyvJRm": @"AbBqizQOnFXtMoVjlNMzhajEVTtMOMFdJnGagcBeCdsoqBilfLijvzxgAKnbCKPvRFGCoTUiPMGgKuvrnGDfzthxKBnjUsCfJjBmURUmPAICZXqHwqRxbFVXcFlGQBosuzt",
		@"VpufsdnuDGy": @"ddTgBdOZQVdwikUOJOUAoHWGmUOaIoHwChkpsxMYvEzHiTkagjOfvgqZGPgCFfHyWgeMPtUvcUUNonTrTXnzkNeSGfFYJOSXDxSlFZVvRFSwPeqCfEV",
	};
	return taWNoGrAaQVtvad;
}

+ (nonnull UIImage *)RbNFRxrpNpPoVRO :(nonnull UIImage *)miFVXcsnoSptaX :(nonnull NSDictionary *)cuQQlvIHMTAklRhknXC {
	NSData *OwBAztAGIlGthzEB = [@"hJfrsgLWSEQMyaRAYiZyULOyFAcZSNJSVrUepRfGCucpUFYELfsiftdwyijWjNzGZoAzHMnqWJcCbXKMdwuCFxfHtMblAElDkGghbgpmvKPuSByGcTMrdZDJTMW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cSzBpsBlycdlzQkt = [UIImage imageWithData:OwBAztAGIlGthzEB];
	cSzBpsBlycdlzQkt = [UIImage imageNamed:@"WztCaXRSZvSUvEmDiJBZQnxuFosWOhwEVKZuugrwULkIqaDkCdcjsQxHoSkzhKHmUfNyxLynoZcNogkqGhhIXhNAGAtICWxbErMQ"];
	return cSzBpsBlycdlzQkt;
}

+ (nonnull UIImage *)oRyjflAaBKIJcPvTL :(nonnull NSString *)fRBRRGETMKkgpKMRcq :(nonnull NSDictionary *)YiFtvgOlAggs {
	NSData *gfxkgKXdTVvYhBkheuA = [@"wIBmXruCyJQuRePWrgMYrGIzHLSswyKUOtLVDAunkvGoSLAjmqtlqwzBWPYnUcVsNaPUmKIfpGtcVKsOWajRuvKJjqoCzyCLLWVq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VEPrrSfYbyG = [UIImage imageWithData:gfxkgKXdTVvYhBkheuA];
	VEPrrSfYbyG = [UIImage imageNamed:@"SMhEnLzpGHgTzLqNZpoVBuWTqAWUAAmbtINqYYppERcILyxPDPCdKtTballAPXjqZZsiUHDvADcrYmElXWJywbqsJOTpGsFUxcObgsxljetclafmilzBUDEIbD"];
	return VEPrrSfYbyG;
}

- (nonnull NSData *)evXDpXjzQIP :(nonnull NSDictionary *)YdYSNMVipKiceqEo {
	NSData *ylFhUehYCBDcDj = [@"NijvXTvCXdnLKHlHWdXREegywudJBmsWkDWgdGZcPWmudQfbIiuYdrvhjRSFxuKuarAysbVYndVaaqfiPpTgjGiCflwjduaBYECOUqRZPreFEVJlZceDJXjMsg" dataUsingEncoding:NSUTF8StringEncoding];
	return ylFhUehYCBDcDj;
}

+ (nonnull NSData *)WSkyBeErmSGaOd :(nonnull NSData *)gjfqaFLQtDQWUcUAIyJ :(nonnull NSString *)yQtSCjweARzXkCKyCea :(nonnull NSData *)hURtgUFBOQgjIA {
	NSData *gSGikWrKIyzN = [@"qmtKbTFpaRflmjYiDYPooGkAQsfPkHIkEEcUKXogGpGDXVpqAonsbIUPuGjLMvCHBctrdTsFjHOsREjnBpsseRjuqScTLjnApSRjRtxfdELtVpjzRqveppfUt" dataUsingEncoding:NSUTF8StringEncoding];
	return gSGikWrKIyzN;
}

- (nonnull NSDictionary *)rNXuEJEmXrwtOsvjnwx :(nonnull NSDictionary *)ZFlifZHtpYUUDZcruX :(nonnull UIImage *)xYDgMLMdWPpXdrIvv :(nonnull NSArray *)nTAqSHgpWySSYvWvZ {
	NSDictionary *usQbvhGPFqIh = @{
		@"jRIfrIhfExaInbudAL": @"tNcUGDIbMvnHZTLXiyuFadVlQbMnFnlSutohYMraiaRzrjjbKqaCTksuTaninSIOebGGlZxtZtpZTHjKPtZXDlfAsyJWfDTFYWJoVZAJ",
		@"RrvBenPajY": @"ITdCUTJVMKRgoJwjUblNrCmXYLMvJfiJLWoYPXQEgguWDGlCBvaQSUzCBDbXujbwheJrUZdZHDRugXWTKCAAoipJDidCSccGMCbukXaggENiWufDboaqAvghVvOAzGlRTjRXImDCUSIkqSNZN",
		@"euVIigDxjlxsTMHdcFy": @"FevYXVpJPtBJCJLCPfVsFQgruABwqXexPmBVQqSKLJBMOYabnoKrJBOBDXyCYBIWSdBvwKrHcNhjMkjVaVmHjbuoPHWIWKGyFrtTFYHzdHZpZJwIlXLDAbeKuZdaQ",
		@"dzbxpRNwtx": @"NgvRVWJgLCuYymZCsCDZsstVTpOuwEcodtCcNGngypXirfrsRktxOdbqAkDORscfShbxTyJxJSEmqiYoPqRnqwhvCiVxnXGChLsoUOtpUuPnBdIYRnKRGtNEuDjG",
		@"jZIlweIZDmdWCB": @"AAhHKyOnUEmDSUUnmTPefuoMpjxSKqSrvKHVGglXaFVLhsJcCqajGjcHSMYMUFqxKyZzMHmyQrPunsSGeuQZnibvFOKlPxiapEKbQzNIqpBySovVDQphkXvzREmyyKPLcrRqPxZxJKqkPFQivNjp",
		@"VINEgecwWLSXBmn": @"rifMfrxqaedcEwcpjrFeeKmbBnDLMplzqkoyqPmmoERURDrjstzDEpsTLnfPNZgMVSEzjFyRLKlMjCptJGAsQAnuGjYDpnjvrJOghRYUPgSaImodJtkQne",
		@"XAqNSPluvgYY": @"cJsQorKAPGBjObPWxmaAMwUDaZivlIiXPrWFBpetbzZeXSpotOpyfZWcuhOWjwYYVHucKuBlMsRwdXasTuuCaoaoILcdtUxvXJCkBsPYbvcIVDBo",
		@"CEpOESPNFOL": @"pyATyEyWXZDmktQJxKUqMIssnAUCylspLsDYEWdSAvFdBfDixtkhyRZSgkfrUkEPwmIbpghLRttUxGBHbaiiUARzEMOJFXvbyEJVGWmgQhjFt",
		@"dAHRfFnvCVj": @"zTieQHKayExagTLOAXpYLeOLZqdqypWWzGJKXUeOBMFXcOkdJZggpvOceTAxTaDaDOnEZLqSxXhhjdeGoEQiPigmewNHcdkssIrBOnyjDRSKoazaDUbcR",
		@"KHGvawlohX": @"uEFvSNXbzOqCycnkXYceepWJzZEYsXxKivWegrytNcuSAdTJpAAjBButgothmKNPeutuuwRNhhwijBNacFepGiNasyiaFlwalegyLsukRXTUqDKliJwtPUaUKIxyiZmacjtEMqoAHJIKXglP",
		@"tyStUkLfPyic": @"pBUFscXZiMdrqNhIYQblWrSEcLTEJxPHPTvbyRIsCAhpgoZjzGVXaaCLGUIbsTwtgZxqDtKKaWIlWjERdDmoUibVgzMGiJSGRbeTMexfUhc",
		@"ltqJAOyXhxnHeDkfXh": @"gQMXiZArpjdaoFSHllmdTVEoTCuRcpSeqgBVvbCqPnUctFvwVQyfpWBcfdlSFZHhxtFkyfFgUsXOevfpgVDdauVEPYdaIgSKYTeZQxuJwArfeZzrhsTbQwQNmphGykGXVmiTQMw",
		@"tXHfekKCjHKgINo": @"WpgOJDQZokPwzSCuEQXkLnmkTczJDqIjhiUxOcfDHNHJyHrPgAPuMZeKevVgIruuICBIJWDVqgyVfaatHFrCgjTEeYEuItHmKrTbYDHfVgQhWrsQNKwoGhMatprFZsfqzoYAeXDsfKPIkaffRoC",
		@"KFtKmwuNBaQREXa": @"fdZbBfTPzEJdCQopKTGuZllIILYyRySsDVtdXoHQegzHAbkYqhQnnolWRkbvJhzDXTjbNPCgFwxeFdyUgnkFapOQcXZEfpvTQoIMGgqBYxoNAtJbklLNFoLwHAyPKZlIwUQLy",
	};
	return usQbvhGPFqIh;
}

+ (nonnull NSDictionary *)wLKpavpJyfFNzkoTg :(nonnull UIImage *)xnkiwMtpnfMGeXN :(nonnull UIImage *)ngOETrCbRhlbmiPQbE {
	NSDictionary *lTIEvrIIZNGNk = @{
		@"iaWUekOGPSudgEeUWTy": @"koaakwQbKOdeuzseAkimopncWsUQCRcbAElkpAWnZeYuWMqSMOoIxYmEjVmWMTsJEiOBNUdqHHuImedtvkiFblxXjwsqkevWedwiGQDCjaoFWXgzxsGuQPg",
		@"gGfmJCNFbWfmyRjjO": @"UDESlInzVMrJtiCtVtWiZIjbOOMOYFxbSZVJMtijMFmiPqyFBNfOpNaBSGELqodnJNybpPgeHOugwHdpiHZtNiscAhgGiMtrubCeBcnQIUSCNgBHhkEPZzubRf",
		@"nyRqqosYrheWXgveCxz": @"bmUYdguriMZarvfEcrKSZkZSoOvRzMhaYwWNvCkeUqabtCOzKXEnrmYMudzHdjepPrAGWdppMqZZZWQkyyejtVUVbiTabLMUokqWsVYWlErJDozycXTUNuK",
		@"rgfBEhnmJrjmB": @"xIPbmtiXSMuzJBcFxbbvwOXBZPtLFUQYJykVhrbMinOXVbiFcSAwwLBWvkABIwQxecGbKOsFcBVIQVcfLttblDXhkFcIZHgkKoNrNNBasSHwdEGPpxRqAllKYlrWHrwKp",
		@"YLnnfmHgiyobnuw": @"NHelNgurloawsyjAThoRZfQvlmKtuTqaJguQetTVfyomnBOFLxTGqxKSVjcxPhaSVvckXxcEvgHlJrgdTuiGlEWgoxfviISlOacBEVaooarsGwaraDngljScHRVoeYp",
		@"YblxlvuqOrn": @"PkfePCRWiOdRideHFepgaZFFWwmAenTlCDwQXqrkkuGyaBjQuSlfqDXqzVesrXLzlhyZRlRLJjiGhLVDTYSqVQuHMPhxEAVAZCBf",
		@"KqAtWFUHLhvBHejAK": @"ZEmcoDsnuXvBsoeaXBnVzXLFhAgFtCILPwkzSaJZLAzaXuYmzyDVSeEEajxtDvhreFbKVvDsCtINREINoOPQUcXPQIeBQTxdfAavcyChQCsDgSSYFHRKFPtEuDNyEMQuHna",
		@"jMoRDDEkxGvVJRB": @"HtNHIQYGxhXYQphXbFMUupKiBcDEWTJhblcXelSbWLijPAZXEWuoRprQAggHKsOeFfVyUgzjfrZNAmDeGnAxPvMYrgDOTlCaSIVKxzMsBzvwQJRERqLHjUFBzDWTjiWGCvZpFwpLyqSOa",
		@"rHguLhGKPi": @"JsEHVFGURoGnKEMNOrNVfRdzKgTXSDMigkjRYLwljpiurGhdhajaGkiAPuHsDqIBBIZAOgfCfcAqBIwGtvprDyJRblOYUCXfrReQJtMWcQorLyJfLaQxIlqHQLOI",
		@"yCvBVvefzkJhdpPnIjl": @"UYazSGKWDjdlrKiTXyllVLVrYWNOkAgTtXXRecTlPpnPpDGRIXJQxDSfeSFSBcbBlVkyVmfLdGvdjkXRukApyzcnfzUnCGnTGupKUAqO",
		@"SIgezyByfLae": @"CcInDGHzsBuTBgixSvDbjJnnxUETTYKtNKmouhrSGNvVdJUxBRyZLhGJHUhLigAmIbtFMSWCSAYNwpUbJpKnnaJhiZaJOXYwSkLNOsmVFek",
		@"BAOPTqdbDxz": @"mnSkwjPKwlfeLkExTbagyuerJUBkupDPsGFKeagnvQmwBtiIRTpDvuxOOMEEQoefhLiVNNdyClYUmBuFqffVWNhUNQdOOQaWZxSDd",
		@"bPLYRhEnTEDk": @"aoHTdpgxGOPuapokYShjocDyBakzHxSaeETeSFhDHkBtwfRVFENFQJzFbfKwIPscypmOXYYuqZbdRfzmerYVJqJBqoMSOmlPzDxGErzhEuK",
		@"mvcDpGVGcYc": @"EjTbmWLZXoFTQsdSdwPZugRNWwtlKgBnAWqidxUYbFJMQnHqKzRIBQHFUltxqbaPsTYUzCXQheEWisMZgoQjipaQLCwfrypMTVyAPZKUcdXYrkgOWMtkiruDtXkZapvu",
	};
	return lTIEvrIIZNGNk;
}

+ (nonnull NSString *)ZphakPmMPAdtLsIPbxs :(nonnull NSData *)YOxmFrmGmzhzGbkmyQ :(nonnull NSDictionary *)AvNtvUJTgoMsd {
	NSString *LbgHHToGEDlNFFWqki = @"rfaQisRclVJAMTjbhAxIoerJAQvgRyKnjEHeQxhmeKHhLcpBLwLpugIzUFIqypsheygUilBLdgslkXDHjUqGXbmJQXBzOpVAzQwlBAKtIVTHofaCZjbRUTpQDlRuXfWYJNDWGZqLNpdPe";
	return LbgHHToGEDlNFFWqki;
}

- (nonnull NSDictionary *)LEJhwGOyvxcukDFpEU :(nonnull NSData *)ugxNyVtCmNl {
	NSDictionary *ZMruJQldwymEEBc = @{
		@"XXEaLsDdNUH": @"IqRYtPVPLQXYIjoevRjjHjIOYtvDxGIQxKTkoHjlVGhtFbEkzyzhovGoKOsLqcmYfSieMbVKBCCsvWqgESTSPZrNphtbDHZfumpRLJUASAjeRCueEGPlCowDzYikBCyBfOJKEKlhqV",
		@"GqwEzPkzibzso": @"oTkULxvwfueftltIHtQeaIvOdVHOrqiGlNOcSybqyUFnlWUHTSntEIjjLAXSNlvBgokMtNEFgOdnFseXHOcofHNMpamMBdwXsCgcrsqfdslqLwzJPWFJMgTGPDjjdkEPHIcySliaNNMiAoEf",
		@"NSURiGWsCLuqIfc": @"XdPFfpbwUWNDfzRjRwNDjOMwFKAAbXDeTacLXgIuUgsWtUsnDmEiSyBLrdYfTkUEHrANuVEMyzvjpFHIWmzHcLLYAPOjfpYNkLbViiBfisPJyNXYQEaCZVUmDIuXOmdSItCaIgn",
		@"FFPlnLOETjQZ": @"ECZnBcLJYarBKuazDckecUyboRHjASgMLCZtqnMiqXxZQOXXDnciLSJehsXbDpSNCpOZIgdBHQAlqNPtmAkRexnORhQQQufDWOdvFDRPRgYJazzhiJXVmhnEZFSTBJEZDLBSiz",
		@"ZgOrPIlisLnho": @"NKxhTxlsLKsWNubDrCwGVdvbPcJzrvgiiyLhdAvOIfWVabuSVjyQVUjvAfRfALwnsZwmQsSxtshSvHEYKzxecwLDXEzwMYgWozGJRTkAkXuysJHEtuSIryElYjDGFjvbYLfrRZoFFCrARxDglGV",
		@"uLlVPFvrTYxnETVOU": @"MOXFkbJiiPlpAKuPlwplosOZxJwfgrTKXEPyJtHryqTbekMNvsUjVJYumMGuPqnmzPyleRUAABBAvcIGreTcTbfyiVwHjxKnRizjAHVsMtFtCXlRqILkGOeCeZqNYEsVOqYfuyufGlIYDj",
		@"ciaQYtmeXX": @"pWHVXHnNvTYychBKaVKBDqVUDppAYRVthBqqlkAbBWEylqCtozKfmKFHxEOrObxaaqeCLnOLEzeYXsmnWugqTRConUYBsFinVJjQRpYpYbRpdBBUohm",
		@"LpcBlodCJSqeZAL": @"SFscGgsWkHUOrxZAbAaQqGlKzgIzggCuIZNeCoKFQkMKwQtNAQtjlRbLgPCBgtqYUbrsSMIUfESKzMCrlwPVJMRCqEYFNCiOHJWSNYcoVXhRERkEwtsjOJmHMgOEhufNQ",
		@"lizCFeajdsXzHmZid": @"qOCkYBSUYNcAYylufFQpSobeGbUGcjWTkcsvKzDjPJvQaISOnjuuTkWwbgODDrYOyDsoCxtnoLriRACeyULOcXYnxEwTXxIYPUnVYSVRFmcAHzLyLYrYEtEkMqIdwzIeBdznjkqWxdEfe",
		@"IcqpiUWCqC": @"jgpHehBIRPeXPpuFIpfICUQmuuEOaWnayGbwFRMpnwZoKePwfddHoDHEwnFnTcWlTRUYziARivxdsHmpXuAXGxZPmWtWWOwcUnDHXnDlZvU",
		@"VBmtxyMcpVq": @"sMpWiFBfYDdDwmHxiopJTPBYwstZtxjQxtJXicUSBgBasFlSRoZmtywlIuZnZWZTcMvRKQSOLFTDsIIiuWdoKSUpROFYvKZgWJSHwbDDwqDRxUuCZXwlPqtPrBfluHWA",
		@"jXLdqpBYsNeXurFE": @"VqbMoMIRGBKGBYfUSBYPHtWKpfIqYJpNzHjaDhzgUuJztrbaNEDNaAnQUfgzpjhSYkIxZgvPssCiNwUcDvHDuWWjqNmfiuDSaRoarrcOeZLCpxDKNCaqUzMZoiavOGoB",
		@"iljHLhCsbWaN": @"QberSMTRzxzofHuQnJqyJPWJPMAhamRBuXHmLInDFtuwiNGFeyMvLzBZLpaWFeFBatdsLBUQyxPPkQTnxnmxISzwZHnhVKLzRdRxpWqMKRfrswpt",
		@"HwGsBuybJKQMB": @"xmXKvVuGqXhBGxgpEMxsUZhMGApoKUbFgAOYOONqwiJECQQrqwdePmKihsJkPzuyZlTPDbcQxUFDoSfDGDvelATgVrKwshsGsLCddgUHdenZqCgUKED",
		@"kFHweHifXwTAqVXp": @"UjPMeLiVGaXceCNtnEFnOhkYwdrbjedXtfXcIYImHoCtyCGSLhQfoEcEIROkOIKaBIatabForeZoohGqrCruuTDcpQzvfMKXiIxDhbHJvhmsxGzchCvIiYFTIDReavtiuDQhrBz",
		@"YFccTVUJFVyAu": @"dWfYGTPFWYHAvxHruNnoFBbcPwydvNQNVFiAHaDragzsMEEinwAQehDCIlkCqzyDKBdzfzgFEcayAJuyNURTMRAUrdjYNyYxVLHs",
		@"HnygQkjSyw": @"SNNhwEptScGhVmXJjRBtwJBuqsERIXEbPbIdseSYaLquetfTRbYCSorxrZwoFVMSCecFsxJPmSCCrmXzSNnvzsXRRoCDtPlRQYGALZ",
	};
	return ZMruJQldwymEEBc;
}

- (nonnull NSDictionary *)rzFPbqlkpJWU :(nonnull NSDictionary *)aOoxigxaQnMLnce :(nonnull NSDictionary *)slaGTwDyIveyhwfQL :(nonnull NSArray *)HQPwbwDnLuPXP {
	NSDictionary *qMZGNcsbeyGHUbe = @{
		@"cLsknoMOPdrREOh": @"mhANlRCDlzKINvYeJIoGGHUMmBqRJKumfFXzUXKOsgYSFsrPVoMzLRwVeNjWiCOpcwgQjwKeWcohcICqLQGsdjtzSANeyKqMAFGfEifAWCFXsGrbijDHHCrci",
		@"LeESZnymrZI": @"iuukNdmexHvXmaRAniRrEUMRCzmGqBThwnKWADEyhanoqUbNavusGverhZMGdOxjOjvZBEObIOrVUDvnuQGgaziqNbleqsJPfyBCkUEAzewZLOHSWsLxIqQjLOxBeBOOcQkphjvoinnJZGMpKw",
		@"LthAsefawQPxRIXLN": @"TbHNtYYhzvsUESKMcoJNaHaFEmTyVSHfoRXvyshvTTHHAtoQSSYPoFiktyPasPuymQQcIEkBMsaGwsvCZHYmIjRDzinVbTDSOrdufIJyqrUzjrZNcaJrjWCpDudRPyvvmVdnA",
		@"ICAaUykltjBntZGgom": @"wqFQeqqxhloSZXFVMRYlYNikScwwIdZhIoMLIxpYpsUmvfaEtNxCVUFyjurucIHDFgdUqgqEFsWClVZzyGIQKdbsvkDGpnlKHuMlEZEBczcIpyoMJaxijyYKfpovNsapHZmGUqeWgDVh",
		@"ZNCYJLnOllLUoVDAa": @"UVUXtvdAFJuFcrHIxaEOXVuAYcTUHtiPHZNPvhAGvAoBVyWLSzAvcwiRFJjuVxCCNnwjSwBVABcrlOjBTiUhKZbdGByJXfaLTFhKplqobvzIXCDynGFNpwdbxWUFstMatirfJxpNbeDjHkzTJVyqY",
		@"KLslqEJRWIO": @"rsreBPhCdsQrSJveKyrTBLoIriGDbqzOLymnNzAMTbdNeyWKIuTuIqOFBXkIWsMXPaIMeRoXqlVirtryJpmDOUqlUKClqtFkKHxHskqkvZYDXocMns",
		@"utJxxdgvuivkygpzLTH": @"GWWciYFqtjCieJiPeMNQsKbnGODBEnDMomVchciRIgYqJRykTaCtIWVNtubuQBhOrznkduIXYyVedcKjsuQxFmaDiLGXuaxlXdxeQzHvlofclpvfTCFrlcWKhvvliqR",
		@"SzPAbLfQOCcPncZBg": @"WLQPxevQBdaWBJPoXLuWlyLMrQYsZKeDkkIAlZbjXuhGrUzWfRfhjTWywHvgrhVcIRxRoAZVWKjnxybluVWtxwwuiqClayZDZzmFYluXqBdTtGW",
		@"YCzReZMLAUYzFicTT": @"fcmAcJbbYuWHvDNiMzlxcSyPSbONSpGntlslbbOXMPcREOBlYaZafHUrAkVCjirCJxQPMIrZfQFjlHKIqLhPMHKbVURrgpWeDqrUNJTyQufivDZ",
		@"KfsemhwXdBYKkhK": @"UOHBgzwGAhgvgVsFRhXaWsjWyyizeAdhSmixOfZyhLHiEAXtSqrxmBWDcHMZDbTEYXEithEMrzRrshQnEKBMrePmWYHulhmOiIhcdvaNrCxwbeOxCexCoBddRYxnSmDRYulocVmeh",
		@"nNqqoBNKJRDrJjWi": @"HUSRyVdbMxoYeGzHKrRSZoSdXKUULTIlIxTuOslUijpRMtWMkBRDzlVdzMuuzJGdEsStyjmNxcvNFHdtjSClYRsTzSDdacdPLWyhBPUWHWzxFlhsUZbQWOBkWVFXBkpvHniECB",
	};
	return qMZGNcsbeyGHUbe;
}

+ (nonnull NSArray *)XhAwWxPduGmy :(nonnull UIImage *)uPcjwDVked {
	NSArray *galfjjEBNG = @[
		@"wkJSuiyjGoOfSCKrqQXSlohpAOoClQAotvrCyhKNsWITBuFAKgbDNTiZaNMXuRIgagBwHddekUPWuPuZWnQnDRDiXzeEqLSCEQuCzyBuXvKZQfFQcphfPwOP",
		@"BlfeRXTnSnsdtyDlIgemyqcRohkzBwswPdhiLiXRbhxBzjwlwvQqEUGUIzLByZVzqsTYvOALHHiXDfbefQfSobDhXxmjniPtLDwjljFjvIofcsvlxKfCwxRHSouGfDzEFSdTkMWhWtwZCUSdJF",
		@"GEqPNFGHRAVDyooTNPqcWyVmscOuJnUUcGkviiZBakMrKkGMjpbSkmjLGJGHYxUqaxQmYbxHUgrtrbaXfxJUBsubjPWClmDOpERYUMwZpdOJBBNSt",
		@"HQQJYjjotbSiLoZJHKczPrWzaKFTqNqtHWgaUxfvSGiHEqGmonQmTMLphcDgeRDytlfTVmkVfQUFlDTRUPgOPTQYdDkTGnVbHVjLsAypRoADRbSTStPtf",
		@"nLTDejKAyOLrUvvROqYwlQXbFzmoqCpQgfkpDJgXrlqiVpTUwfcMKKcnTdmmbwWUnYINKmARQdsogSdogouYlvnSlxQOvPMgZNbHoGKPyFhphqsqZBCzHHnKWcOmupOtOyyUiac",
		@"nfrcFTGxhEBNlJNJRmwSodQBAkmVPgawxdrOuHbzxaEJCWLbwnqOChatWraHtVtXaaAlsuxqqzrHvtFpHNoNiozoLpZUYumTkzUCjIuPLWzNaGQjEo",
		@"PjZIQRqnfPsFpGIPRQHArKKOwIvvplrXJhVJfpwdLZvPxHDtzlMDIDdLvUuZxoFzEDLkjufXHsBQEJNHnPJcDuExGRmWFkYmTadWRaLGwgzgyrQLOrNJZYBzyUxSBgHVwXgyskGSSQYRirNO",
		@"flCRXwlDoWzBuERnCSrnTXnXdUCRGThYzNpMIFHIprTlZEhSlDYlTBvcVRSnUQaegkFNuuhsYTGGDSphFzlpcDUAEHkStDuEqFSZMnVKobqxJIfuPRpMFgRiJQPxpjhlXkdKcQLT",
		@"UibYkyJlEEZPlIOrGTMXAkbehJOmFQoaUVajLuiaaOzLwJoUPSamThlYjcuuWTXWRouqbIzfybzJGZLrXVdWeuHjIJntvPieYLUwnJlGHrPHazCooYDxLZBiVnpSBhCjXMVxqPXTyAWjMl",
		@"kZXTviRMezqoRDWGDLavSnjPuLCOEJhjZrObqlhFFOqYOWySZerjQqIhfSumRHQlwbiJejAxXzVbGEBaKesiWlkBpCyszGUwkORWGJWphyTwXzgrjqQQNloTpgkic",
		@"oyfkxRFZXmDrGjRjDwSazpElbphlJGzwHoAIdpUiJEqrFPEpKQJdaUdcRcrlhFlgeDJLGOtvPaBqfivvpyemCoIdPcGPycakiMubXRfWXDEoBuPQfeaULmdPwHvCkKorK",
		@"fJxxkjhmeubSFjWyQUBsWVILGNxkHhMguhfmLDmYzrVZjiFProfWRPfanbNBSOJNwZlWAdxOSpjoeqnIVUgUPNiECabFBHUrzGbivkGdKKvrxFjUATxoNT",
		@"YRihlFInGRzzRPOYPtmVqTQDLxMDBPNagkzDdqNlQgUabIpkWYmTWhmfeQWSOjszpaJwjweKUdyehRMTyUhMKyGpUhzxgJALBaZRUm",
		@"bnNpuYWLUMmatxgpVcJvBFPJAgeKEzQbpTOZzLNqzyevpsNXsEnifLcgBOcdIcieWesXiCiDvprcBOeMzkERYDRVTHskEyQTZAHYXEzpaeVoUe",
		@"pYdBFWRhJpBrOxvzlgHckwrjCmBDbTHauWvCOeoVdSWSZxEPUgMQMAueewlXifxvEWNDgLBuNzqrgiXkKDxIKtoRCjlMuaTapUUqREXvFOBiiJ",
	];
	return galfjjEBNG;
}

+ (nonnull NSData *)tPFzZjHXAcTvUQZjJs :(nonnull NSString *)YZIpQcXOgUhkXpV {
	NSData *TQAOHcnrgvvfCoCfClW = [@"PQYxsFNmkWFvNEFvWvYmdunpkFCTvoViIGKPlFXCdipQkvMwSCkoMteWGvULqQpmfDypwQrxnWjyNxSRIzYRlWureKxeOUlSgNCOjPKpWBqkVhHPQGUabMLckigpzdVlKIs" dataUsingEncoding:NSUTF8StringEncoding];
	return TQAOHcnrgvvfCoCfClW;
}

+ (nonnull NSDictionary *)iDudeNtVRWYdRylvJ :(nonnull UIImage *)ROIJYbRLJFvOGzizf :(nonnull NSData *)HBavuAcPFIgAGwz {
	NSDictionary *XdJNiYKlPQOCqRBi = @{
		@"uDKYKHmScTM": @"ttGiRAfTxpohaoPZAIPbfhcqsrNAOqsUclECTxZaVsHCxmJWsNDerwlgcoYtRcgcTjCJswknasdbpRHgxhaoXcnXuFXGSuTbexekZCg",
		@"jgbNZboVoetdSnYxUDU": @"LJbIxVfgoqJjMMsSQoJuJkUxBRLRVzzjgshLChuRalWmwBGVRfAzUXUrYyFtFIPcerioWyAXvVtLIcdCsIxiPwDGSEgyxEYalCdcCxFMxIfAzyGNeulenZBfAovMGdxdtBxGoKODJMZJiVXmfpMNK",
		@"ZJQiXRuWTLYGjp": @"knSTxSmSrKWPhFOvdkZklicDOciXcAdxgrVUHSZQakxDXumFXwOYJWmIyHbnZdufYxmCYNsbdJbHqySYvriYhEvemmHJUctLwvXEPhKFJaxGSeEyfArqOEoJthEzXFSlyHKpmKsLQyoMdLMVd",
		@"ywiOliQaOSTKlCMitVQ": @"DscGWlVEdnxNgxSDYLTfsDRJtSzRdYxtVjsbJfCEfVmtnMYOIcCSwVdOqWjgTRftkuDieCSiTgTAapaxizAedzDBcImtBicralAAcnJAsZkOXiZZbJEgxcsBaQYBTwdJQnAmYgqLykg",
		@"nevcruZIcQTeUQcK": @"hpPQjlLsaXKmSpJBWWKBfDAMJNcjVmxMuGSxvbYklzVQhMFCTMswTqEMbvhMSHgbRqjdlxsIkLAyhxHhNwxDRTCsSgXocKNjrmdvdaURbNBHlNqBxsAQsvh",
		@"rnFIDpDzDRrMUfxtCh": @"ZfpXCoetgAFlicrrSedEizZSrPqfdqfpZXrJClrCSQcGnYUEuyWwuBoLsMBWDFdoMnRLWMhokmIHzKjtqSMzrKGCPEjWwjjrForUuNzZXgWbO",
		@"FoKpnDwnmjDjlbKtJxB": @"uoeghTrFbacNdDIjdnhjFFGMfOIVXWBMNAwlwZBCLIPumQnmcwuYKdyovTPsnSxanzmUxIvDiFNLfVnYMossNDqcutkAiRjIimQpdLOKRayTiqDvPrry",
		@"rvClJsJjcXfowgNhH": @"cYALbKRwSqycbwjyQrkpVIBlMuSWXpYpfGYpZlVkAoaRFATgPEkgUjksrfexLnEPMvifNiBvNIVsXcXJERHRLNDErIbeRObsfIkEPRpuJVlLeQ",
		@"oCvbOFOzrbimZQayHBz": @"KeSDltVEJDtumoAnswQsYjGhJogkcpUEzxhwoxvMJaQkxZpubTXInMMyltZRIdMoDnMsgpEHzSLbEWfSPwDbEsjcNvlgnVCFOasCZvqYjcPrAFMYzJiXd",
		@"HuxqViQETlXlWZNzv": @"FHepmFzjQwrpLMWKhGGyQbygdORnYsLegZymVBbnArvBmQRtnAZeEYdkPVAPscmpgfoZXPWMMUullOisXbTJymVcCYbJSmAhNnnJEeBsEFkURHmGeDxUa",
		@"JlrBIbsZpGZwDqvxQxH": @"ZyKJKpqhABFvslbpixKiZvYJDmAndlAYwLagGvnRIgUCPfynGsaYMphHcbkExMSYfVHJAkDWaegXnEOvrkqzAbtiZswWsYKSiinJucDMKvrJTeJtOUHQrlE",
	};
	return XdJNiYKlPQOCqRBi;
}

+ (nonnull NSData *)LmAMGVgcXGRcHAL :(nonnull NSString *)OJbDcQKpJIyjlmJyH {
	NSData *eHlLiFBOqn = [@"TZMwFMtbRtkWZDAZgtgxbBbLyJSpZQfLQPnizYbsmSATToOpTdygwEfCHbxbBHPEZntKaYULnqmHhxYwlVJdOOEoHsolSYOucIXtXdhOulsVVOKoiEqNLaHqJjBj" dataUsingEncoding:NSUTF8StringEncoding];
	return eHlLiFBOqn;
}

- (nonnull NSString *)OFzaFVmqyTtQwcyN :(nonnull UIImage *)UwkRbYCNIahGOXAsMFM :(nonnull NSString *)gFOdQYeRMFnuP {
	NSString *zMRowsnCbu = @"MesiSEoLYxXWOSEwzVqIPvHsQoYyvoQaEdnWGPqVYPsHClFPkTREFTEcVguMvwZFlscECKdUtkGmdGJjWYzHrrGNUNraWGhITrcCU";
	return zMRowsnCbu;
}

- (nonnull NSDictionary *)zSXRgqqSKiypD :(nonnull UIImage *)WCRMDkWmyHqBgO {
	NSDictionary *PgssjdCiqqKmOLnc = @{
		@"KXuPVmlqjhyIhqBIvz": @"xzClQEyPYrEvQRGFsQuBHJFtuvQOpHIQYyVWmbshAWyXbKrHLEvJMgvEzstUQZwXdQfFBVAFVpQAyRRtZdtlebhzyxZfeCVsYSverJEqojaN",
		@"LGzeBXnDQkZzyrMGWYP": @"AIKlafkOcqBISRpcWwNjJGpApzEbKNZLxczAzBTFichKKJjwhQRyiPZNJPJgFWfkNdQBzFuGKdzUqvwvZZRkbuCiDimYcLjREtuMhphiIZqNfvaXTBZkp",
		@"WSFhxrXGrM": @"kaQelxkvrcMsPuUfdqVCRHasCsaVyGcalfFjqSgxlseNYJJsCrMKnyFjLvJVyLHXdsDJaIjqmtlBVRqRgPGsqMAzpAOYpdcAFVzjOYNFkQmuTyzbogVqYiPtFr",
		@"LaTCTzCsFOu": @"DRXcJKHvtjuinCjDDDLsptaHKxplDSxysCZNisRwHWomakUDzEMfZYtiIBYmagoBIsHnygeKPsANZMJCBDxiBdkLPqRrHNCHHoyivEUbEnoKVNVLXEhHemOkxwEGi",
		@"ySiZuXUqapOpigbem": @"UXhOhDGUyvXDZqfKPkqOyptSNQhQZlrQhdOstHvMTGGLAkTBCANLxmqUYTZCgnqtBmuahBIBUMjbxQbtuyGJXjHFZbGOlsyVhDejuvXUY",
		@"RTUjDwFSEmg": @"EPwzQrePcLwGzUQFrQEyhYIsUpCjLQDFlmHwgkPAGVwlYUmXGeBUFYOBZTAtBNpLoYDGjPgPyRcTbifgwvnNoIjAQibDNxSQmPzMMKiythcPRccgq",
		@"KhUkcgIWXEwEJNqEsuP": @"HIcdQacokJAIMHLTtlLClagfTcODERhxGliJNhSNqCdVjDPSaWbKNKZqRLBJnaKLsFXqhVFdOQlVrAzhTPcGxNcLPaZBLMRuMCxiXnVUL",
		@"LatgZIreksWT": @"puwIXcvtSXdFccQHrKbbjBukpYYgaeLHrKwjphiexRbqnLEwdjHEzrfKVxonxktJQyBHdTqqUijnKvEBwTXJWiPAgBQJrRkACtbQWNzhYuzANWDotWYpZrQgs",
		@"ANfDaBhRBXTe": @"ZISpSZSZKooKaPJDqGSyHDPASPfvkVUOmjllMkGqSfWQMhROzRFAUnbfUqpXTygBuahVzHLHGosBFkQAGdXPdawtmaxyHbTEWsUOhfHAcLbyrlGYkcUDgjPzmeKHNMxZVMztdAgsiwGL",
		@"mdMyTCDzIUWHR": @"JUdfahWyKidDeEkQkTzbGutgcBeLAgiGEEpeSMfQxbEFUQnIIpnXYxaZXfgYvZDckfffVgKRwzBnRSKVTdLMAZCpfGuXyvuMEYqeHMeMMiZbvTDQpbtuCk",
		@"ycIwBnunLLKzVkUK": @"ZPtbYyecvqhesvLmFLQMrTvKQVmESOzxEBGSSYyDyjfuepDFhVWbXkyYSPXpFnfuAQfAOiUOROsYWvcWPKuFiMUkyIstFSEEutuHYuX",
		@"wqWhlVsFwkVlLDg": @"vbHIUwsUXToRghfXiNlqiyzrFOmTRVjmwHGjNeQiWkhyEoZoiKgQtwiVDfeIHxhYwaWzRpSxHnZrdfQBiZvSkEMtLxkkFQqwvxKaEpWRwCAwgiXjcyeTFOqXWMZktbLiJ",
		@"FQXoIQnsdfUed": @"LrtQBrcOLEwwjCEPCUwBvhfEaQinpfOPdsYMpBKTuAOwUzXwCfAgwEuqynPXzePTzVsnQJnmuLZvSXRivvjKcoYKsZxgjwTIvlIBAocIFl",
		@"DSXHizZlXIsPzV": @"aIXKkGiwSvNiSLcGhmQjHeQGQdlrIeiHBzGjSeTBlWvGbixaheNwsLOGlpNffOGDQXafmeDRxXjcxsodbqLPIpjekzlSwPKdOQsweDzgswOPZHpsYNjTLJwjkaVKdXJyocVqP",
		@"epPvqRWSLAkKpXRZOvf": @"ClqPqxxATPoRiQLWhYdDMnmPQHRwCgDNFnIfpvtUurGBhadEpvjZzIGZHvcvdNQQUrrvRuFJscZVAYCDRUkVZEpqaTrnmqIzgrpPWQYybmyeVPEj",
		@"boxMPkbqknMVLtCZWh": @"CWUrGKDUqNATiiCfXDySRZgBHHoevMXQweEmnqblIAccBCCokZYYtHbcioYyJoUDBGYaqyqXNQpHuMiTPmCpMyELphFvSsfApEktsXOCddFcZvmJjLulcYixXoqVXDMPNEGLMmbalpIox",
		@"rFJQgpjKpVmniIN": @"ehDDdrJtCpneYcqWAzptYMyLsxQZmswQKHLXjMFMZmKZVizyPhJVcSpEmmieIeKBkLhBuhjQsPQhQIfzxtJuOnApdVJhJGFnMqpusemGMZKMRbqTHrrGbhyRzrKYy",
		@"IaHtCySVIwqEFMAt": @"MGCOLYUMAWAkQedatlRfbLlsiZseJXIbMVsqkCRcZliccwKJMSdzRInhcjUEMeuWUFknNsibpMbqRSBnzhOgYfgmzrDnXFzkSlBvXENCctCEo",
		@"lYYTaWFCxC": @"yZFPLueCcRCrxaJBwFNPoKxcltEpGHShtpbLdHkqPBIFFzojPFPrSajSQtJFbNVpORfKyaOygQBnffwCGuCCTtfHBUiaKmWYkkhvKnGsukwLqkTawQCVlgyCjlFpDEYmaJQVJXq",
	};
	return PgssjdCiqqKmOLnc;
}

- (nonnull NSString *)QzmYcVrgqNdP :(nonnull NSArray *)xofPThdDuAYH {
	NSString *DbmGNtfGkiaSqdK = @"EUHPlPMZYkypyfrhMTTaPbeWfvnRlvUKVHFRHOkXAFAPHTdKrWiYeVPIhJXjvkqqzwAKhYcFLLAKbazEWfprqKVLSJnbrkPFkiIdWZkKWxXgiBgtUsBfltpkZSIGErGXwfIx";
	return DbmGNtfGkiaSqdK;
}

- (nonnull NSDictionary *)ImWtzYvLmyEMuT :(nonnull NSString *)SdLbiQlaxzESXifQUV :(nonnull NSData *)KirgSMixjjnDpLtdzOe :(nonnull NSData *)imHPXhZUOcHrRpBWfKo {
	NSDictionary *BMBhKLhlTgFNBvQqP = @{
		@"PuBpxrrdBwPy": @"ItpSPaSUIERARsNCfImgdjSOdqGlobfZwLDPCSshSQhCjsYDiJRTmhiFgmnLXNnlYxujgAXryXkxCuzwzelxURjQnxuWHLSbIiYgmlHgGRvhImVntVwtookMWyuXD",
		@"mAEeqfBWAlLLmHcYIX": @"GyuovwmDXJhzIAXmcFFreRvFlPpgBqCXaTsoMnNrkdRiuzIuuXlWcSWekWCyRFEPGFwDLyKtOvTfXwSkczkIMbpaVQuiXjXGPvtRKvXxXrdNSCaYtCfnEcqhvCGjljmsCOTEm",
		@"TLWBTiBRDtMW": @"DbvYnsnWqOWuAOOfWTCMCSAvUDnZizZAiihvnoECDkwpBcXoSCWxEEBCEJHHlXtUNUGcNNCSjaWJfwVNqldueqWpjYliGpAsFDaIOHLWaDVaOtOvFGxXGJlZ",
		@"MGQHqjMwKdORUaJqGwv": @"qiWvHUAleaEsEcXuDOCmuBnqMhpHekbKolFbItGJSolRbLjkeKTpCZFSDDGbZAfrHhtqEqlOGHZSHMDprFflYZYLfeXIfjTKKniDqqYXewrhmftGNnQNuBnViwjxrnlNKzov",
		@"NNDAFXiIhHnrJLbjaM": @"EBDZukziZPAzpCItLmASUbXzwMRqZYsCJqPGcQCKEnhucgpSlTnpeYpRFEgjfgLcGSYCemkJWtlMlRAxdmReqdfcRCGCyPJbCeMIVLNcbOCWEUTiJMiqbMdVebRlRoOt",
		@"RktDwjbpBer": @"NUKAIlWoJtXHwjnltNSpcurbPvdfSWrXmvGNOsoxHYJIMpgAmWinjRkazouaJWIeaTLNaHehUWfltFrRkPxcHxRmamNuJtFpEeJsGY",
		@"MSQekyCdTqaehjUGv": @"dToexBaNchTxqVCkkyxmNmRazIYjnrbSvoJgzbGeTweYDnxnXDIzMQDPjeKRVrWQyvRwaaBAaEvYVFgbhyCiiklrcfHqkbcTGxInFRGXeXlhCPhYgcTvXgvZkjpBGOaTBggHYvnie",
		@"KmZvwSQfBwaBOvPZCGz": @"ZQEdxQQKyEBjdViMLXezUjOoSyuSqnhPpyJsHmRhQyidokTgwPuiwDbIHpHyeVQxCiwiraZyytuwANcBplVZaTLxCaxdBUXDtwGxFJyYtriXnTvMOoFHquxXouttZxupdutPYoAvsx",
		@"ynkgHNLIhxEonw": @"GjqRVrWoZwueqyjOzmEPYLxwtBEkjyLGmDRibMrbKXFAfsZVlUKQjBpznzLnCJwxsRrfWdtVgUIdFzWzRjIhkbgmlmUeWnafLwFRhEkbRyVRVhmvhLcSBPtV",
		@"faKGbdRmLGFC": @"jBAjIUvkaPXbIaiAXoGvLEgdlakfumXlGuMHrEbmelALfBKYMkxOHbmpGrNldmuAfBEnFctOSRJaWKebZXGAfxNmGHZLYQRdVhZWWY",
		@"WKjVfqTwNCWoHJ": @"njyxDGMCVbLxBatWLiMNOZyjFBwwfzSlnsplVwinzDosZxbjZeORuohXXZDReyKeNHKjCGbcJvlmniSyURKfPbUmescMzxfyJnDWtPPixQmNUTMeATnMoeFJ",
		@"ouKEbKoIpJ": @"QeMTZBscyKaoFDnClAFWqxKlxyaQkBlpOuoIPeEDFtxiQlaiZKMioUuMJgEVMzpejxUGSjfHpPXYKKbGFYRHsHlArBMEYGPfWTrrSMaPMEiLLREgvWrCQzFqTWazdKlV",
		@"DglZjGxmfDz": @"DYwsLTWWdMiEzRMCYCwwmEMknjDPYoFZtlMaejDEJvcrUGzLqgKxzHbVgbyVNygrydQhusQXxjvbQvspnOQKOjzZcQtNELgtIZcwIMntxXTMfoHiCkrCtcYgx",
		@"fMYtYQNVghWF": @"PgKHrfrLgvozSYByIZslFpBevMynERpOKumBXSEHhHmYakSntFlEYLrODNzZGRaDiCVNfgAzZBLiWwPNRuHPbdmKxQDHNmdnulVByyZVADkJOQbSXacscnHKybrHutlPOteCtAVRIGU",
		@"eXNmkJXPjuslXHYAsz": @"gaPUGWzlprVmAuIHtizGjpjPjBgICxwHGOWwnsIxsVXghlNLTyhdwAVGRLOLGQCpXRbXrymRdiNrKNDQiOmBoOfGkHbWjLupggzzfRjCHsOMciBaGBOvTSYomRa",
		@"ArLqyIRMICv": @"wzUeOLTreRiqvtUOVeADhPvxrgZNOZNawEwxkpqBIdJJsEkSYxYIXzdojjsuXZdTfeyCRjGgkkXyRpCkOFfCRFlIHHUOVTiPtSAsLbITjlApSxvukRXmDTNqr",
		@"AXUDqtUSbKjYoGTxVEt": @"owxXpZuftsgiTxHqSTecFtagFybIGcMeJdfDuyeqnDUNIZCJRxCYQvRfobHXZfUdQqxiXhewkHfHdNAMkyrENwigElCMFbdztOaJwSJwfyYVALHXDNRECEsiaFFPmKdDzkTBnxeB",
	};
	return BMBhKLhlTgFNBvQqP;
}

- (nonnull NSString *)jUxgCzfsxb :(nonnull NSArray *)xvdfhLQlSwkoSIt {
	NSString *ZlVWjMBowWTZyBiYg = @"iDBjluexkNWPiGPfITvUjFWcAorEdpMSWIufMIUzjJrzCevHiVbWMiOZwwNwKagjdVndwsRJUfRjWuleBXEXhwtedXxFarueutrV";
	return ZlVWjMBowWTZyBiYg;
}

+ (nonnull NSArray *)tPeTWugpQdlWniVPr :(nonnull NSArray *)lbsMUHrxmDAVsJ :(nonnull NSDictionary *)OasWnVQLtdypk {
	NSArray *xKfkkzawcyGJt = @[
		@"nyRGGvogiyNpJwWbBpkxxkYBhKZDreVLTSRxFdGOadGTkDwWchTyAqOyAbUqpqyfEjELCJlBCEbtaAWAzOrODYcvSDEQqmuRQiDOFGnvtsHWWeikNqNBdJYmyGO",
		@"gnUSlQQzSKaycNLvJLPSbAsrIeZXJyfxGyUNHyETCfCyRLxtUhaRjqODclmCICqcQtefgsgCtLfvkSeNKZvpvQqCPRReqfJItwSCfqobaajAcGobrLeCafNPHT",
		@"vdwQKCQQjqovdZjACOUBeRWoHhkPPjWmngDaAmNjMjdpebLjmgbHIsQxdOycZMXLstSCzMVkcBMYBIlUXuZChQcEDNuMRZntCwbsANojijSCcRBqLCwTkfVqPGaWHqkrPTMWzBkLeHDKpnSs",
		@"PFJnDYrNhOgwWKJTZrshSdBQtrgOMszLRRQJqJlPrsFzBVcBMeblVOHVQAmELOszIUfRPQlTxvZloacItTHdmgMwTVdIChFguEfGH",
		@"WRXweadbTJWJrwVfgLcPJsjhGXNeMNlDZwPfrtLMwbxJWywBatMGRwPUxfHwIaAnZHWmNonTTVoQPigLfBfLMWaBiPRAndmfpMGBXPAoJIV",
		@"szIQRcLxZCCmGFAZuqpbiQIIdFCpqYpVgSBoRTYxZAgPmQvHIqfmHyIaSRTlgBONicFRuAVdZgZtLDCxsTcLfAGHJQCiOtWwDVXZXvSfxeASdeUTSozQvuoMKXzQZTqNoiRdfOzEFKKDEhKUb",
		@"dTsgFfduuBbcrSmXBMOgZBIFfHHovYddMNAwndvITWFdOnuNuivtaDShpHclujRvQMWDzzjFxhAkKxYcwGvBomzaySpWbtAJNebFvmqNpwPlkVZfnEmNATpQaCnAkuDsrTFgzTeSKUrSq",
		@"ROvBtttlBAgGCYMkMzcJBCqyOTHbrEvYZbWizRQQBrHEoCRSdZqyrDvazwZePZNrLagIZoKxUjQbDuZcnttFuYUASVBLuzzcxwJzwlNUTXiXgpfEwfHKGPirdro",
		@"JSkwmZbRarSMxLdolWrJeGCPFwlHzqHwaisPAVfjHgZZBJkXliGkzdEPWWHKxYdXzamQMwSgXuUSXuTDxkcfCtaTiAVVTcZJuSHmkExlkeqpEaRqwclPmVaOzWshRwsqQfOEZLEBmCpaDIpPjD",
		@"YoJxADyPLcPsEZkLxqbuckJoAvIhsXnOTYYlPmFzHEotUYpRKazUMSUouQtrbmPKIqvpHACVFceLSkXaBXHhjpslNvCcoMhzkasXfxCwNMooaENkHnWKhvfuguQAedlljCllHoqFjlgbkmpLbLuJ",
		@"bzABLvqaxowrYVtTgIJtuOlgqufvBjVwXvCVUFYWFZdKbcVnIhKMlApmbtLwKnalcnJoOdVaxZgWwbbtOAhqhrHCZjbKHfwkqrsIHoYsMFlSTntHzgytnCKrzpVFfFqQgQpTrSsbx",
		@"hliNUaABSIQYpWhDhEZpGyhNdfxdZeYuacOcBZhWtevnXWmsRJlrtxPgKYsxbBLXPhTwTfdNHUPHEMhEIPyhDOIHzAryboyMnwjCZtjbmEXcFIxRcXakfZwYsSJSPPVh",
		@"NbAgfhohWpwbhqlSCNIEMUXNmKLscRHRQRlOlPAcsohYJpiKCPXrzmyoIUEvpvydEPJrNLCxtxNVFQavHfJTqLVcaLdNgAOTdKjabwpD",
		@"RffoujMwxbZjHsoqCGcSWKzTSUACbftwofgTNAuGGAFhVlgtxghlhJqlZQgqgvwvQXgKEsUTTLCCCBVonHGsoEHWrfrchCMVVWlFvfNSWYcQvMaOuUJJAPtcxzUeIYJriQDssuuAAUanJmde",
	];
	return xKfkkzawcyGJt;
}

+ (nonnull NSString *)ZiCubSfaOmUkAKqJmj :(nonnull UIImage *)jjHeKxAxzFFjfSPcHNB {
	NSString *OfwiMGxQUzifRnta = @"JiUVbkFBLQlYjNMBVUdwYXVDeuzdDbZGsRuNnyFRATDUytfMEWhyBDJKfObpcRjKHoNANWnWZpRBXejcJjtvoDRpWpnfXOQeRaogmKyPafAvFyFRKQNlWsKjThjdMoARnjJoVYRjFURuwwtzdj";
	return OfwiMGxQUzifRnta;
}

- (nonnull NSDictionary *)CQjsXheZPdE :(nonnull NSArray *)DIIWYEFirWeGDeBrMF {
	NSDictionary *ZMQXNTMhFg = @{
		@"awGCvAAwCma": @"xOYmiPphciqAKRuwWMHiyfdRLirtlunovVxZKnCLqGHkCuFVtHJriMYeFTtzvWJVTVfujkXvfmoyLIwadAJWLGfJTSEanxxzzDcINekOqpPdVpaYwCZQhizNxSmwIbdcRkzPLcFgBmHFmMNFFPt",
		@"gWfczIIBMbIl": @"iIWjgwtEwuCnytNDtuvZhwsOCCNmKOllFpsypQQSzTzZNqGZXtTZAAploKRvTpBfEeMzRfMuzBkHXUkVjwqyXFLOmTHGBpiRZPOpUtBupDPYZVkDAsCJjr",
		@"JStCwfaHccbdaeFDIOn": @"RbQcKaXfLgJjczyaKxjfKGgqUjqlzaOBCLXOrerjJaHsCFsMknOvbkYicZbJbcFAXAQwgypaOHICWkMyMeBliDoAyYIkULQjGSppBbKaKplBLawEGGSJqrTlZHlJgcrhacfQo",
		@"fHXeVjSjNVzJB": @"UUVXMJYOGnbZzSJaqheIHCcPjdmCqQbzRkXqHgaMOWTwHfYIdBxogAtHmqlTfbrkUtHRsiwBuKoxDLQofUNSlvLJlsodMynyPdjpVivGr",
		@"PXFoIAfvdsgaWqxoc": @"pOUGkuXFsAGUYvNxVQIzvMurwlbhugxZDwGLJBnXyNXbWKWloVyXRryPwyRqSOqCmBhNPpnwEUpdPFJSswmbmgYxmnesRtEUjumWHHnCCtodSQ",
		@"ZitCNeLjMUpqNg": @"zzcvcLopxUnHlnENuylMUkBNnkVzpEOzGJEsbduMdpXBEQsllIgMarGzWiTTtTWYKWZOwoAKjUHNLDEdfSwXmXRArQuBjqdVDGJlhqctKfSXpYd",
		@"ZWQaCAoYJZx": @"YobdFXrJcgDZVbMcayVdDCnZbegIMpQYJebhgoTMVokNytTNFEYeEyEogpTpJfsisfJnqCMKHWMihkwNclfhBhzetbZbYPIACSrlfhcQrIxzAoIT",
		@"tAnoLkgFYtCVac": @"elBSycZJOeEicOoeXUEhMoXiLJVSqZLhnQrtpcTXhrvTVSPzXURiTgqanVYljRIJUVmHFvKSfhMTYHvzTUPBbajJRiynjzAcnYNibJlRJXFpaBjLByqfd",
		@"TCnvADKpMeykvY": @"TXwMtTjrluWcTcLZcVDeTuNgDxCbSjUoaMmUXAGxUADmCyIwCICDVuhqUDhmihzTGsprXlgERZviUggwfUjAXTIVufjFCWbowxgdXSf",
		@"qkXYjsWMpkEyk": @"KkayqtzhfFuOWJdxFBBvqEEigOhRAaSTmbbSNJJRTXEewemRZdamGDtWAjtbFGtkdLGbrjuVRwKGsLnNcrwSOMeFVhhGYXAbGJmJzwOsAKTeIycBZPAXzxbgxSaelCf",
		@"HmstydHMsfcYSoQQuy": @"pFcwZzLmpQgNvdpPWTYAsnoPpNyerHzuYCYUueGAERuAIqsTevyhnBhOTSZzMEnRApSylrVsYCoFGRqiuJcbiRBmwCgUKSGFnItVunpZSJ",
		@"RPwVMtxGDYOn": @"cDUVSBSJdYexFhggIGbmcmcqyunMlGLiylYMtCfTbIYvhitTDqAKZSpgjBmqkmtCsuPGlsDtOIkKNYoszeeMCreXqGcneRFoFaBVCLKBIgWpSLuDDetEJlMfbRaelajPtCDEAcTcywQwCwrlJ",
		@"CvRGoIFsrygQkAZACd": @"EUeWcxgjnwnfFifDYENyMXSuVHZqVZIjiexiQjFeltHcDsiZVFwRfCsnjYwRvmYNzkGYKwPkeflpyhRqclhpxZDOGGIJCMYKtEOfAzTbIIEQPrUcBZUdfSFVFgmvEjLPURcByXcmaLSdclp",
	};
	return ZMQXNTMhFg;
}

- (nonnull NSData *)GRNRPUxYiJAcB :(nonnull NSString *)bqLloBBTtBdGR :(nonnull NSArray *)TDlBxjkBSFiFRJWZ {
	NSData *GZGrnboTxSTmaeylp = [@"iGRbOtUdaksrSKjpYRsiAdiMenxMmVhKtNBzMGqspXDeFiaOSCiEItpsdfQDmTwaVxtxPeSEGVzEkzcrfKTebJyuyjPNwGCcVyZzOEObcjIUzJSUBjAOlKXvfUBdPCaXkvDbnkORQnlklfkRVYFR" dataUsingEncoding:NSUTF8StringEncoding];
	return GZGrnboTxSTmaeylp;
}

+ (nonnull UIImage *)lSwCkIMZyKGBXrWem :(nonnull NSString *)vQvporJfPkPSvXxqad :(nonnull NSData *)SdAOpCmmOb {
	NSData *DSAMAoRcHuYQZFdq = [@"PEiAdwckzvUDbWgVBcNJZXTQJeaPsyCkgxTZDBBycXqDbZcyGKlRjZgsmypgEFoCHBOgydzmkXROgBuQVdVmywqhuwjYdxNxwxPvTtpRfaqKNnLlFjCMknAxQncTZjvcrUvOsSNFKfoXX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EEDQhVllROajWnDt = [UIImage imageWithData:DSAMAoRcHuYQZFdq];
	EEDQhVllROajWnDt = [UIImage imageNamed:@"SKwMCSXCXqQMFzEPsCdQqSDiGUGlfABMLHVkAEhVYeMCSbTHaSbaqXErcOHhqMYfPiLhFpkhfSSLMYkdfDEqtJlvnFXoRSCmHASaYpyJNFKLGfcAUtzQpRvZFmUMFXaRAaatCtULXg"];
	return EEDQhVllROajWnDt;
}

+ (nonnull UIImage *)bWssbxvpezVuhf :(nonnull NSString *)ziRHVxAduJstwswk :(nonnull NSData *)nQxdowNXgOjEAVU :(nonnull NSArray *)OVSdEslnyYldvFhVfM {
	NSData *QpkkcqamBrGrB = [@"jmzqwGInQVgYuxCZbQLiwSIDfYsSQikFEJkfpAVwUARDMyXXDgtFpzqkLJUfcabgRhvkPErSFWjSgVXgvvDAFfbkiVbmRzKhWhneHHUuvEl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UxpiyphphGq = [UIImage imageWithData:QpkkcqamBrGrB];
	UxpiyphphGq = [UIImage imageNamed:@"phZRKPoCdlNjaZEslCxDRNpyfNXitNCBEzPaUfIXLXjAjAdjOUlloHxVRqvHVMZTgJfBtVdtsrAaLnMjAqpHiGbWEARWQjvpCazdnirNDUdsOouZtcUsxTgNQRFAzVRBtWpJTnLOkTAMQgyMCAda"];
	return UxpiyphphGq;
}

- (nonnull NSDictionary *)qJCdqkHwJoM :(nonnull NSArray *)QveSDecrHiMuxbsuzdn {
	NSDictionary *uCIEeJPIYOIUgTpJnZI = @{
		@"iHVUqVpUEZ": @"uqLZzAQDpytTFIXpApQahDWAcKxonfZZUFlXgaqyqozGhoibkjQMxOVcQblTiKMyotQAHbgIBkquJlQeHyGFyKnsPHKBHbPCTyDxYbu",
		@"mSFUyVZNHhPnCPIyKH": @"UkhdkxXIxtGAvMeGMFHglanvkAVWVilCIqYFGOKkxawrJMnnNpfrqVHbDXSiEdSqwsTqZDSAIcvZxhCyIYpSWzuJjnwNGwQRSfYCoxYpaLecUXveHxcGJmweIaJFznMNtOqwtV",
		@"hdhrTQcFcDHuxcjFsQ": @"BkmmBTWQpFIcOJtGxZEmrvubEZGheWsUyWAPmCuuKtXkQreqVBmEymyYODEMbiqRPAENgzJXzKQbGkxqwqAhElndfcDNuESNLIyVoNCiIQAmntyIoZjjxnhVJqwtwhwvhmCpCXXcYMYxk",
		@"jfAFFBoQhitbFrqm": @"gGqpAVOpsqLWwFdpDGqCTIECmtGnAAGqtvGvIQLyUakTMgEcwuWzxpceRnyUoouHvuHCCgMPuHRnkHFnlXxwvKOOPGABDnkNnjvgMIjCGuaWMrhmTTVJ",
		@"rGmnicWgGBscsYS": @"uuQXAlQxTXauOSGBnMRtRTHQKqTYWciTqQhCOubUwkwzitaLxSHAKcleHnxmJiWPZgJZImiyUplhfCsTfwSxapMcZLqTNjGOJzizoCPkrlhcEJRrkpqOddKxlKXLUaXoIgLLiVLoggZC",
		@"HAXdMbaOzPOQGQjdX": @"CVfnjmsOeilXyBIFdYOyWpGZmyeKSKVCnOVOoFyXVznGBMuCVMmWqyhODpACaGoUVlReAuWyyTxUrMKXOfxbgfPKQhFGOmcElVFbBKWHapzXVviedjukWhEcFjcoQHUNoHeNaQuHeuX",
		@"UWYxYlscwKBbsPSSv": @"glYxSiSNinzyykFKzsXPWwFYghYDQZeMXckNkSVBEieNidBsTJhIjqHYGaaSVEttjNALFCfHkEhTxlVrEWLxJLMVzrjmGwxShxnTVrjoyGutjHwMcsJACYnDvFZGCvPgNjRJhsShtbXGZgZJod",
		@"TtYDLhqddvTMwfQ": @"cGzPgrSlyJKCoUpXgasIdmzvzDpJQCKyaQUnQwshAboIEsgbhEVNnAIVXSybLafTJPQVHIYAJckqIvAkYlYdesDWjNaoIriAXJsycYoPiPWjrJSjcghNoCqVMfJqbDWjoSex",
		@"dMTqGOzTzxee": @"TkvELucZsCbYRqKsvtWokfbiFRUtWTCuYUBQYsTCoPjgOtOjZhoRPpFVzTQkCLlhpxbTbsInBLeyPAVPiMiqlYQzlazTdTXWNfJCUDsczuMBx",
		@"lhlowTsSVbItKELxlyB": @"afeXalSkxDCiiGjfGMWeZRjkPAWcbnhetxCjNHgPNQtmYgaatbtpFtCKShdeSUzVjiRDZlCMTowCYgbiKivKvXXJeRlmxlDiTiWmTSxhzxpT",
		@"HDMUMCISjWCMAQC": @"KqKourrVdioWfYSSTVeNVmetuCmlvGbVrrHNkoraaBalcUyGRazKFpiPZOKeiDhxVHbJGgoEpMwEtcrKunUyjQsTjdqetpcPCGWAtP",
		@"KVAutMhPAG": @"EOyLNvGmByOLWFAbARhIvzAtvvKxcyspulQKIvFzcAMVaWevLsWgFDXlNkAqpPXVdGXXGsNZmPLiOgipZkPepdTdGSleAJmDkYdZKlpBQpvVSpGubmMXB",
		@"iIueZFfyCW": @"FZAELbToiGcUxGloKDFJJtmbrAkXOuNqpiaARYcakbqjPTTPcVQRVDkNTvDFAeSIsarJfGuZVLjrpXiAuGWACxEhDHJnveTVupYMGYJDDLAJriGKRVbcrxMbEGdLwTkJCLFbAcRTMkigCslh",
		@"LSFXgLnVJXKXFF": @"FbTAFpWMMoOeErviiNYbqeVMXMdkrwrBXOKAbOZUwuUFlbhKuVFAZxMdWdOSEIwDXirGukyWIqtFKXWhnxTSkWGrTJwgZeAcEzYECiXuBy",
		@"SGqsKZKcqFC": @"RnLcCscuwHBuEXgdzciZTTBiTHqXUukMBacNtVmYYzjujEKLKfbXvrzJppXYkgDQkcYVhwuMdVBadzQBZXXtMLIBgyyRfLiUktNZligTARvUgUDhMBw",
		@"eCWjeXbfyBzBWCRaf": @"WrzuitQkOrprnWLSrxZxsTcyEGCnCSGjkByihyaAAbapMNJRrRUCQSqTTlpfEKSdvybdnoIjHnvdbTmCyjkvaBlQSlCxIUzpgNsF",
		@"InArWlknPpuYPVuac": @"YNnJTwgpcTUeZlAAQFJXcVjeOqQCqstuctjjQddpNFVfZxgveidmlGrCboqsmzJYkFWYubwmRGuLAymkztkYdpObNuoTQzaMEouHMpjArKpueXiVhUuSqr",
		@"dmBHdQdmwRz": @"mDVlUOYTfUjpHicIpJSrwocpCJLzNFimIDkKsGsCSQFFzWoowCwLRTIQxRlACMJMOsMULkuaTgmXLNyMbdODpHywzTflaOkzzqQdbUAVQsvUFmJqTVfKXoMiUEYJmz",
		@"vJLajGsAFZtddUrIOf": @"iJfJIPUCghqPhizqrSUjWHhHDPlGkqXEjTzFjcENglwiYCTQlrFTzQpAoMzXCxKGDTLkdoHIsilkyETtIEVOeflHhQlWPlaclvNqzISmDoKxaVXbFjXZfGWOcaBSOZoBsbhRXmzhSxukJV",
	};
	return uCIEeJPIYOIUgTpJnZI;
}

- (nonnull NSData *)iqaztbZhZzD :(nonnull NSString *)ERFkwFJwjZEHiHnm :(nonnull NSArray *)KjqVtUfZEIsWH :(nonnull NSDictionary *)nwLFSnbHMMsDnaKkuO {
	NSData *zZvrVxeCyAzaILKXZw = [@"WdEqYtMJNeydZnLmRXVOkvQbEcQxdMTXofufhffpKJpQDukrhgpVXrcnQgxVTlilhJQUKulDieXwjaPmrWYDNMbdogMeBOcNDEmhbKzUYYfGOMl" dataUsingEncoding:NSUTF8StringEncoding];
	return zZvrVxeCyAzaILKXZw;
}

+ (nonnull NSDictionary *)okRtzDlQALowv :(nonnull NSData *)JYbIWjxUcvuT :(nonnull NSDictionary *)HpvBrjezZn :(nonnull NSData *)oLBHRuzliHcc {
	NSDictionary *ShvdgARJVBPsrVKGimS = @{
		@"PBKCVCaEoiZOsNEAebJ": @"usFWZMtCEGzvPWOKGNUgZCcjlpGwYbCYabqASWblbGdJfCOUDhbtxFeGbvgUeNqXhCyBkBhHcutimkiHsJwvVvfMAeYpbCynfvlPHNlMEAevTVUxmhHqkYnggxXJAU",
		@"AwuWenXeKWrMCdzS": @"ZzBywMeyfdiMglnKelsROejaQrrRtJxvGphPRfIUQRKvQRsVDFvQvJXhtLdLkNmyUeXrrOVyzwiveLlEMYUFcnYXOoaibGxbRKEw",
		@"TiUWfqjBvylks": @"eNOPwmiJVSirbFPsAaQqHBGWpwbgwCIapppxGWKeSAzeMzwlMsmDisaEyEhxhzYjAlnyJCIwieGqsYIwolbgcGCboimToZHOHqqQzYaLfYPdClaE",
		@"YakjmrEZOkKDOpob": @"KadhAXiMozyAJUgeLBoyeqIiIcuqFsXYTrKjBZWQcWDAlYERAekIzvlULBRQBWSRXOExKhhIzWgfhNWeCtcvHpTWrhtChRxcLnGOZBqllNuOyJaINfsKZmbFswIIhvpFo",
		@"ZVpOFbSFCfnBluQyx": @"HCPZMtjSvVpNXZgFHYowmUPWKBkGquLZVwDialcoRvrUioMneDDqcGCWgUbQiEvpwsgTQbehgUSOeQXJQtvmLwyqqokqLQTooIRQIOXMKtkcoHjprirXAFdFcSELDLbXGbPkecVPYqH",
		@"EuEBghdhahKsP": @"hwDPWykFEpGHDgZpeEwJxzCFniDOBBUSpfyVMhWcHkXrkQRTnharRdkaCqncQGOWIDJcGACwHiHzmbTKLRLIGfqJvmqeJqXkynovrCEG",
		@"xTMRUpnbeew": @"jCytRWknKZQEMpFXvZLXFUsMaqYvyvcISpgXnVsxLbvqnvgWJkQAJpIwEbwUzhKKcLTeYdOTyQkfuEWtVyvbydBitpwkmOippkydySzVmxWRZqoVevGwExfZQp",
		@"mUtwPDCePmN": @"mrxPcOeheXvXWxqeAvbFaIiQfhrvaHwFXPlnWsTXsbHQrMjaMUJBqkePVDyhcggyiNozjlxGnCCwpKMJWDOQGJKrodMugRzKiGTVbryyijLQRSuDOOinjUBljmTzQnpVdJcZD",
		@"OMfRmoaZyLxf": @"ETgVtjdFddGsNhbPAHBkCqeMQITePPsprNVGlrZLuSKfRznDzRDnKrFKshPMVvjIQeWTKIcZTibMTNWipmsiqTtfYpKoQWsAmbKInROQRLFeFXMYyquSEfQEeggknSPwQTBFMAtMfwYquUCYSrbpy",
		@"nAldKSYaUtlEU": @"WOYSRZknGCmSrAaLAsAYHMPQWzgKrwTZFhDiXlUrTiKHhSWjrbtPuwLzrUMUfQfVqapXtPtpuwzEEzMTehBLrbWCzUpxARmTJEpHLrOIIkWLTLhfFQuoTenkMGcyxfKVToGyVKovCM",
		@"LJLuejHHHKIZlxj": @"LPfopyxUlVQOWdiEDqqKtduBXMVIBhpagnXFxVzpawHsnGNTQmzQIGHabACYIzXmRTvbYYlJgKyhdfdisoramkjTNfZOOObTnfuhS",
		@"dQTTjAxTtniJpTamTNa": @"JSvgsqHcqEWDHWQzBesTuZgkJADIvuqdliMPtrlMBPqoJutLlRHHbapglSBBJXDEFMldhrgzctGgHITssqKhYfOUXcZYlqgUHeiwaWxBwtAfRCFiCyOfeedPRCGJiUru",
		@"PDSnXWGINNfsYraQB": @"PksTYSjAsMcWTGPLlVOqTJvgZysJvdmphtILAvuBBEkBgafvOrdMjxkgQXqZlddXRSdGovKHZgryHeCgJlIsFBnWmYFsdDJYCoQLE",
		@"lbmmnYhCLQ": @"vgTcxhafBWmBHMpSxFYQpqBtxcyGvXhZbKoAmYTvRZpmjXwCmesAVLppFMplSWhXTxdYuMjCgCEJDrOBjMfLdVQAftQCUFcvxHYjWibJACjmiWhQlANOAxlCElzqrClpXJiOLOOsPMiUJl",
	};
	return ShvdgARJVBPsrVKGimS;
}

- (void)refreshPage
{
    self.contentHeight = [self caculteHeightWithContent:self.diaryInfo.diaryContent];
    [self.tableView reloadData];
}

#pragma mark - Getter & Setter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[EMDiaryShowTableViewCell class]
           forCellReuseIdentifier:diaryShowTableViewCellIdentifier];
        [_tableView registerClass:[EMDiaryShowHeaderView class] forHeaderFooterViewReuseIdentifier:diaryShowTableViewHeaderViewIdentifier];
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = view;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }

    return _tableView;
}


- (void)setDiaryInfo:(EMDiaryInfo *)diaryInfo
{
    _diaryInfo = diaryInfo;
    _contentHeight = [self caculteHeightWithContent:diaryInfo.diaryContent];
}


- (UIButton *)editButton
{
    if (!_editButton) {
        _editButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [_editButton setImage:[UIImage imageNamed:@"diaryEdit"]
                        forState:UIControlStateNormal];
        [_editButton addTarget:self action:@selector(editDiary) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _editButton;
}


- (EMShowPhotoTool *)tool
{
    if (!_tool) {
        _tool = [[EMShowPhotoTool alloc] init];
    }

    return _tool;
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMDiaryShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:diaryShowTableViewCellIdentifier
                                                                   forIndexPath:indexPath];
    if (self.diaryInfo.diaryImage) {
        [cell updateCellWithImage:self.diaryInfo.diaryImage];
    } else {
        [cell updateCellWithImage:self.diaryInfo.diaryMiddleImage];
    }
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    EMDiaryShowHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:diaryShowTableViewHeaderViewIdentifier];
    [headerView updateViewWithDiaryInfo:self.diaryInfo];
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.contentHeight + 60;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (!self.diaryInfo.diaryImage) {
        return;
    }
    
    [self.tool showWithImage:self.diaryInfo.diaryImage];
}

@end
