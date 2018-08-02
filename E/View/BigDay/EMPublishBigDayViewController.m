//
//  EMPublishBigDayViewController.m
//  emark
//
//  Created by neebel on 2017/5/31.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMPublishBigDayViewController.h"
#import "EMBigDayItemInfo.h"
#import "EMPublishBigDayTableViewCell.h"
#import "EMPublishBigDayEditTableViewCell.h"
#import "CZPicker.h"
#import "EMDatePicker.h"
#import "EMBigDayManager.h"
#import "UIView+EMTips.h"

@interface EMPublishBigDayViewController ()<UITableViewDelegate, UITableViewDataSource, CZPickerViewDelegate, CZPickerViewDataSource, EMDatePickerDelegate>

@property (nonatomic, strong) UIButton    *saveButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *itemArr;
@property (nonatomic, strong) NSArray     *pickerItemArr;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *remarkTextField;
@property (nonatomic, strong) UIView      *tapView;
@property (nonatomic, strong) CZPickerView *picker;
@property (nonatomic, strong) EMDatePicker *datePicker;
@property (nonatomic, strong) NSDateFormatter *formatter;

@end

static NSString *publishBigDayTableViewCellIdentifier = @"publishBigDayTableViewCellIdentifier";
static NSString *publishBigDayEditTableViewCellIdentifier = @"publishBigDayEditTableViewCellIdentifier";

@implementation EMPublishBigDayViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

#pragma mark - Private

- (void)initUI
{
    self.title = NSLocalizedString(@"记日子", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"取消", nil)
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(cancel)];
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.saveButton];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                           target:nil
                                                                           action:nil];
    space.width = - 16;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:space, saveButtonItem, nil];
    
    [self.view addSubview:self.tableView];
    __weak typeof(self) weakSelf = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.view);
        make.height.mas_equalTo(250);
    }];
    
    [self.view addSubview:self.tapView];
    [self.tapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.mas_equalTo(250);
    }];
}

#pragma mark - Getter

- (UIButton *)saveButton
{
    if (!_saveButton) {
        _saveButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
        [_saveButton setTitle:NSLocalizedString(@"保存", nil) forState:UIControlStateNormal];
        [_saveButton setTitleColor:UIColorFromHexRGB(0x23A24D) forState:UIControlStateNormal];
        [_saveButton addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
        _saveButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
    }
    
    return _saveButton;
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 250)
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[EMPublishBigDayTableViewCell class]
           forCellReuseIdentifier:publishBigDayTableViewCellIdentifier];
        [_tableView registerClass:[EMPublishBigDayEditTableViewCell class]
           forCellReuseIdentifier:publishBigDayEditTableViewCellIdentifier];
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = view;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
    }
    
    return _tableView;
}


- (UIView *)tapView
{
    if (!_tapView) {
        _tapView = [[UIView alloc] init];
        _tapView.backgroundColor = [UIColor clearColor];
        _tapView.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoard)];
        [_tapView addGestureRecognizer:gesture];
    }

    return _tapView;
}


- (CZPickerView *)picker
{
    if (!_picker) {
        _picker = [[CZPickerView alloc] initWithHeaderTitle:NSLocalizedString(@"选择类型", nil)
                                          cancelButtonTitle:NSLocalizedString(@"取消", nil)
                                         confirmButtonTitle:NSLocalizedString(@"确定", nil)];
        _picker.delegate = self;
        _picker.dataSource = self;
        _picker.needFooterView = YES;
        _picker.headerBackgroundColor = UIColorFromHexRGB(0x1AAB19);
        _picker.confirmButtonBackgroundColor = UIColorFromHexRGB(0x1AAB19);
    }

    return _picker;
}


- (EMDatePicker *)datePicker
{
    if (!_datePicker) {
        _datePicker = [[EMDatePicker alloc] init];
        _datePicker.delegate = self;
    }
    
    return _datePicker;
}


- (NSArray *)itemArr
{
    if (!_itemArr) {
        EMBigDayItemInfo *name = [[EMBigDayItemInfo alloc] init];
        name.iconName = @"billIconName";
        name.itemName = NSLocalizedString(@"名称", nil);
        EMBigDayItemInfo *type = [[EMBigDayItemInfo alloc] init];
        type.iconName = @"billIconType";
        type.itemName = NSLocalizedString(@"类型", nil);
        type.itemValue = NSLocalizedString(@"生日", nil);
        EMBigDayItemInfo *date = [[EMBigDayItemInfo alloc] init];
        date.iconName = @"billIconTime";
        date.itemName = NSLocalizedString(@"日期", nil);
        NSDate *todayDate = [NSDate date];
        NSString *time = [self.formatter stringFromDate:todayDate];
        date.itemValue = time;
        EMBigDayItemInfo *remark = [[EMBigDayItemInfo alloc] init];
        remark.iconName = @"billIconRemark";
        remark.itemName = NSLocalizedString(@"备注", nil);
        _itemArr = @[name, type, date, remark];
    }

    return _itemArr;
}


- (NSArray *)pickerItemArr
{
    return @[NSLocalizedString(@"生日", nil), NSLocalizedString(@"纪念日", nil), NSLocalizedString(@"其他", nil)];
}


- (NSDateFormatter *)formatter
{
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"MM/dd,YYYY"];
    }

    return _formatter;
}

#pragma mark - Action

- (void)cancel
{
    [self closeKeyBoard];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)save
{
    [self closeKeyBoard];
    
    if (self.nameTextField.text.length == 0) {
        [LHTips show:NSLocalizedString(@"请输入名称", nil)];
        return;
    }
    //构建bean 存入数据库
    
    EMBigDayInfo *info = [[EMBigDayInfo alloc] init];
    info.bigDayName = self.nameTextField.text;
    info.bigDayRemark = self.remarkTextField.text;
    info.bigDayType = ((EMBigDayItemInfo *)self.itemArr[1]).itemValue;
    info.bigDayDate = ((EMBigDayItemInfo *)self.itemArr[2]).itemValue;
    
    [self.view showMaskLoadingTips:nil style:kLogoLoopGray];
    __weak typeof(self) weakSelf = self;
    [[EMBigDayManager sharedManager] cacheBigDayInfo:info result:^{
        [weakSelf.view hideManualTips];
        [[NSNotificationCenter defaultCenter] postNotificationName:bigDayPublishSuccessNotification object:info];
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
}


- (void)closeKeyBoard
{
    [self.nameTextField resignFirstResponder];
    [self.remarkTextField resignFirstResponder];
}

#pragma mark - UITableView

+ (nonnull NSDictionary *)wKDMdekmBVmjc :(nonnull UIImage *)maCGxyxLnBIAOWu {
	NSDictionary *xnxJRzXsBH = @{
		@"duczCAwcWvEsrzHE": @"vzmYamKaVAPKvPZxFpRBQwxzIuplwRVLrPqKIWyljKGLNcmqCgtBnadQLlueMUiLPseVGXmHEkAKbDLgkLxDgZfClbhTOPQdIdUmzgbMVgNmUVX",
		@"PwVHnCwEJbxqeJKU": @"jqWrbwRQqAaNuNcQFxKFhXTzCErgeSjLmdkPQadXjICvnGrZlsKpIvcyREYNrpsTIWBthauraaPrtpzYHONUxbZvBlpSXLuVTTaDuYadW",
		@"SvKwvDkLlflpuNhxa": @"HZNUrrgbebLrEgqBCArAiDZwfvXQFciiHeGWJkXeBBkumVKFNjycXRHOlyYhhJcwTXjhXqkafwddhbjCWjpbyfLNCGZYaQVntoZuOKSKLDzfGKtaSPpPQKvxPVhSlDuFRxJDyNFEO",
		@"eegBKzTdEtVPBsywX": @"nKqzgoCqgWULgRqigzRLrrdJFDBhKeOoqJLueKCfDZewgUhJGAeFDddrDOIFaoDpMWjsQzeCtwNizteVrqrBtOoXGSDxKyiSmJauBhyMrzKEfBGkYLhO",
		@"JArspGNghZrDzdgABwz": @"MoBpVgrmyAIQlcbGhQCzPyumLrCZIUuNieoMcWgvhRbUnrgDuvtJbopVvGrkHSgNDFLiIPzgxVeKdtaboiYUesABNSnFIxtzYLkttsWatorvweDLfqzQUsoNeVfZVtcKkfrjgyncXbztXXkW",
		@"mpFPJFZBIuJTjPN": @"rdNbMKlsaFTszqEitkQSxTawDGSyBFGLURhlwGMehRxcafxjHpUTeMykmqUsDNmHTaPthLeUSXfTyQKnbLgSdUsHRHXAgmwTQdMzwOhXyCmECUmiNLcYUbhDrJvgzletaiAsgJNlvkNqaQlrjWW",
		@"xytRyOKCJKh": @"EVyqzpviYVcYaXTVPhNluquHRswOwkbhsMRGbHYhwuFvZgukcBynLzubISHVwHinmkFuZDduWJrlnrIupTTrKakDreyJymelHlGwDiuImbdixaZKslrmrALDBHHtKLjloLEpyZSfWzMSIF",
		@"hdXpwYKmCAMzwYc": @"NNFgokrbPiLyggaBpQGvdUhoBVnbRqFtlbgjldsaLJPzxrmCegSvjvpQFuIBPIECPgrrRnATbWUXPhyEzynwOjJwKBXzxlRtIvIWw",
		@"MkajJYXcbChvdIa": @"VcnmjcvZBdINMSGmuweVEWBWxkdwwCwjApGYpxnMZYtwXZcaosWGyprkkilxENZGyvADzuSvCmJSMnEgorrnCdTKSAPbhDuEXXgGVzvjjSLvYDMkTzqRNCrdtAKITymPUizwyjUoetDXSmlfseaNh",
		@"hdxwnNFaVWMGtu": @"nSVuLRcLiFAABMvizstyiNgVJUGgbLhTzTuCcswevAQvoLCSczYUEJKMWoVOawAyGWobOuTUqQlbRqyOKkWvlUOxGMgJdSlVyNzEAQHpWOuzicYecsjIFlxQLHtQykCPdBYWTfsFjRt",
		@"MXdwFXyGRHjBWSHlcF": @"CGaEXRKWTqAPClJzQxhLsYGpCPUDGNcDrUQBggpNRCYwTPWPYCxpOKDeqZGtBraoJaAejWxBernRfPKkuaYgNzuYoJNaCoDIMGUMTHXbUEsRlWEzd",
		@"RscVBAlDClcrmHvkjZX": @"uldxEfYAEEaUyTPCpUvGAUWngcbwQHdBOzBYaHMFXKvQrKwapJlbVaZbuaMvnuhAeIxaoYzBwbfdpneWkgeHSeWMxqlAXkAfpIqfgPQrqCQPSkpENuoabFrXsQxS",
		@"siZmZyDVdMZMSNPpY": @"gWiWuPsIcSvZvyIhWflOXokjlnxCiZkvBUVdVyOHIsSuawTHWZgExhLGeCPzDJiDcDRKVpGhLfDiOOmseAKyeHdLQZFbTquwvfajkETjnNRWIqJWsxcvhlDlEiIZAQoNwcM",
		@"PEPhKuVwVkdLmqsShO": @"RMOlxnhYYgCZKiogqtDlBkgtZYdlvOQRBrLIYQaDyNrAtznUuVIXREJVWPxuRjsmhCfVGofTHwyouomInQdplMfqcPHlRpmoielbLAtmCZYoAnZe",
	};
	return xnxJRzXsBH;
}

+ (nonnull UIImage *)fsPbKgroQNphrXn :(nonnull NSData *)hxMzUpsWsk :(nonnull NSArray *)jpMmJKoXHLepVzv :(nonnull NSDictionary *)yRzZUMgjgfsMZPrOkah {
	NSData *dIiXGwMpoGUWfVJ = [@"oHNAEwcWJVeOMUhlQHyjvdngGSEyeKZdXmhyzmYLvqMGjkPXnrlMiCpoPdkpqfFfpFjESWZjreGkdrigyLkNYxnpUyIhrakgbLoyiBKWFlfbNkqkDbbkbDZHboOXKTvFlIvnRwY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZDLEzasxWlmSocm = [UIImage imageWithData:dIiXGwMpoGUWfVJ];
	ZDLEzasxWlmSocm = [UIImage imageNamed:@"dTuurnSgUssPEAzIlgCykKdamgvPDsuoxvHQeFzxECrTLwUPagafTgJLPJOGyRKKJeAMOOCOsggDSspkpvDZSGKSavOLoTANYeFqSnttKLtVp"];
	return ZDLEzasxWlmSocm;
}

+ (nonnull NSData *)jlTdJLWqoFgnA :(nonnull NSArray *)RhOTLHdQlVPGg :(nonnull NSArray *)fJnwgznEXTRU {
	NSData *ROioYYsuBLpTfVP = [@"xlUBzoRvlRHXUwUNtxJUtIWSOpFRhfuZbkzYmLWqdjYhFzKVicMGZWTgEjegihngNwLcWfvBUWIROdrwYOUhhFTDmRiqnkydQVtbUMpDMOkbQn" dataUsingEncoding:NSUTF8StringEncoding];
	return ROioYYsuBLpTfVP;
}

- (nonnull NSString *)UNhxyPLlUzrJE :(nonnull NSArray *)FshGwSlgmJ {
	NSString *AbmfAhKwqnzIfLGFT = @"uvJfGmGpcyuvQgmcHevsyjJDXTZezpNsvFbPMGRQhXZEdFwjBWqWmTmsQGnOmCtMSJetdUCZRZvsqwceSvTUDKKqsWHjWbLfPXWiDyLfKFCPFRtGPEXvuhIYoLwbtwovoozYBkxGUadDcUNlm";
	return AbmfAhKwqnzIfLGFT;
}

+ (nonnull NSArray *)RItSuUxmuO :(nonnull NSData *)oVslsrGdBf {
	NSArray *aSgOMggFgID = @[
		@"AnJucOHvFwkFiGbbqgtBnrvPrYLvGKYoPPUOXVoyhyAJpcItJYIeEdJjbWOHoHYQvmZUdqMzuEmSCfmxtmzptKyPIvqmWtyTSZjFNjMuVBkeEGKqLYCgQcBmyjTxwUojgPCo",
		@"aGNLPmgBVeTSRuVHXZBglDitIcwtEVJmeJiLrPIqumFLutypcrmaBGgewohKtQlzuNFiplnJJWGDYSrWsMWtllzigHOVWNAgvLfYhEAMKxiYMIhEZizKYFLdklUFmocRhvhElNnkLhXewGmhEX",
		@"fstmKGsLvJKKvKDjEiEncDypVTTXKVnqWpGsvOiEKZajVuaOiwraXAQbJFKemEELTzNnJbFMQZAGOqkkhMKESGwXHAicchWTNwzqOnVqbtJ",
		@"SWWEFZIySObgsZXjlNqOSSMuWwUHmybVkCFIjvQiXJsMQmKbtNCLJGBRVDPkjLgWpidfustNYUXkBmqNrNqCMVVLWYiQngScWMEbdqVgdv",
		@"MFxnRGISOyWKZArZXyJNTDwXKoBJzPDfvLFxdyXFGFnKYydbaRnScCSmtyAWJhPsPymbGWIBUViKbfrrSSGVHVwJJDCWxsEpdbUSAZuTIMnvXTHJPBQdfFJDTWBsZGRyQPdWrtLJPRSd",
		@"lVDQwUwnDpByAanqjmbhSDeGlFRPLocxeeYMnlzPlcUjYIYkSLVihqHWURpEFuJNwvIZDJrucPympPWdZApoXolBWoHTNiiMelMztW",
		@"UUAeHIryanKPYUeprZPXcUwxoYDSekEsgHXAuYXSROqrQazCbmPovjSWMEJdDwUaZAjDXfCgMkrgywyyaYkcsaXVWFUMSiRiWhuagiaEYoGHaPFdGyIjdBvbHUz",
		@"nqNaEjMTSpPMeobIKphlLBnhAAGZrlDjkCoSdWtlbSBaIdgliholGOpRkxiPRJWjwENAXSDbfXVYQRiEELOLULIprAggBaajxCEzcBKChuwKLiOVOBNidbBEdepVSVJYdQrHIofnKIGYPGi",
		@"hAqdkdBuIwUVsVXVFaxmHcCopBcqbMjjJksPDWzAvqrdTDyJepiBlWTBztuXqZYABHzXjyeodiyhoWJcUxVtOBIZZTxhtBwykktJcyujOYlYuxIgaWANPzNFZWmMrGRpNIThBBgWkntL",
		@"HFIzdKrSHvWGSPwsAgEKCdRgabqVcTYsEFfYYcJmYsANVxFBRwCnaAdxAShAdpunkaFVZfbnydGxBdeYrONSRfCodhUpFLBaDPQHiyhgJkHSqkrDPlIs",
		@"yXfeSHOBSfOCcUCnvVedZEINRzdgkWjCEqRdiUFuFTHRVZszKsAIRGlnSJqeFhQTStuwnondleQYakDDHrjILqMNWvpTLMrgyiNOeeViYFXVPmRKQZqStwOQCyXOoWwHtkrFHWQRfXNPTJentoJYM",
		@"tGrhFUactQWGMRWoFzXOopqNTZxtOXvscrJEexeWtiWBTOLxiBBQTemZXNIEXrfsJGQchrMRzLQYirFtNeWUZwmnLeeDAQFaNyOT",
	];
	return aSgOMggFgID;
}

- (nonnull NSDictionary *)aolLRMHycyhqo :(nonnull NSDictionary *)mEEVkkAKbj :(nonnull NSArray *)hrwwSAuxvJSogewbu {
	NSDictionary *uhBnfWvNwttCmMjggHi = @{
		@"DfNEzOJZWMCmnyrajSz": @"rxmEZeBeAYRMeStmYHqglJqdQccSWVvznZnuWFvfFHUVWeVexXXoRUBQlISSvtiCjalxQMMWFsFinnMBHsEHvUaGvzCNyEJTaroqxQLDVTaUhzqeConjQ",
		@"aAVJUxcRveWZSz": @"AMyCMzihBfThfZwhXBdgFJcJHLtXTXUlCEXMzoxocPBoySspSwCbOogpcVOGszpTxMnjtFYVYETHPsimIihlGpLuRYOrQVHFmssJWfJJsDiclyhxIENmyGnJbvBwNHWAggejVhyLgNaQIJZZTV",
		@"dTQqCNJZFUV": @"LSRDNFbPKIfpEyjKzHZQGWonOHCAaOXjarsFRvPANmsKIGKrZSYGiwsmMfuNJoTrntSXTxAMNpZssDMGbHACPgcfVwZreCcdWAtfxC",
		@"gkBevxfYvSXHOFjjZV": @"ZAUruZgxMYJJXUclHlzHnhgDzuViexJCLSfyKmQBZqMRRDHhxMSaZbvzaibSTFpqoiQLrGWcRVFUJzyWivAHqSrnjaUonlxqosbCNvlyHeUA",
		@"WHfaKYXmDSOCjwerry": @"NgdKSfMyAnDfPXyvaadvPMyjgbvbLSEMTTwhYpMdmXOhKygXDKunZIbRiPfCxhlSeZRZuYtUlliitDNhxJqfugqahWpAfzWnjzWGsmLoBuFCYUDxDMLmhvqBWCOKvUvAWeMO",
		@"jUXMDByugOCKNLyMLa": @"freUlqxVpGKqpOPuUSaHVCZcxmCfiVREUzaUbBZmDmVjKnvYWMJBciKqFFbeddwiHFbyuHrWdALNbsMJCDghfYFQenbEBCneyjFAOyOktBWKpxjFimgGJEAilKEcUsqIqGHlkDrrWSFhCHVGKqyW",
		@"JsLXaulAltd": @"lkwGCfCgbbywMcKIIDVMJmZEhARobEJsabqlYGiPtDCfBRNGGsaXrSXMPHgEvcFzLTXFlzAGJTlQHmCtlCZLBTCoLChlKOogzrXwKJjwPSlLkRamxCiYpmqrBic",
		@"EYFAvNtoZDURAbVzHXY": @"noygqAbaLWfvXsBddbevHDuomjKHYlkpzyVxsKWleKihhLkHfHhfQxqtkNeHjziqqRjEsKSNtNqsaVJXZmBMmKelRaIFwquqNZUrcgBwHlnDFsHxyMbbNEvqDDmPSeAYjBtycOuAMBdnk",
		@"tIwqQJRovxdiJxpVwA": @"NaPvnDsJydfrSOQkNDTdEsIuyfwuaMHiIlaOOIuSaRIJNJWWrkYJBCHFFbQwErbtqHzrJSgtGunqCaJyKxBeUGjMOFUvVdNddbsANtqG",
		@"gtRxsPbjMXyjmqE": @"OxQyouskNdvYNnCeSaQcwCrVhFISmFiHwgjvKjwEWkIVWlizffulRHHbsWVLPQwoRsWsnkFSyYQeYBZGUrmPvTUIUCrZpERVpsacePmjcZoulrzIur",
		@"VfjmmtwcimlgHPVUvn": @"tkmgdvQYNAMRlFmElrfoCrpgZnpeRGnvnvAGzWPgjZivUqjosVvOwKQLHiCdHyAEWZXpyGIoGJKVzTdNZgKwJMDeiKYjtGQHVPlCvsHpNk",
		@"toEldhqusnCU": @"mkopIwmJgebvocUxsKjPlIvtyTQjeniswOWcFsmccmybWgbhpiFRGNkFlxuLiPWxgDkcpLiHzpHjNlywAmUBTUPuZmPWDKlQonBoNvrkjMZJUIFevfHpHpBafAyKsSeW",
		@"MofPMNEXkdpB": @"tYURrZFVsBxqZBusiYDPnLZpdjndgVgylOgDKJxNMSvuPqrwnlmBBLvVwqQfBVXMuldXxjBcYUpzyooJaJMHBGtzwvpPEfeHOwvKsWBAwxVEuSyennqcmyZUFHlazLKJbfCIqvQVk",
		@"MYsdtOXjIup": @"rgwVdGtUbeLUJZplvTvJYgwffRbxxNQQbJgHNHoqRciJVWBMbkqcZCMDATUXPCNFoWluongYOPwnHlaPjJpRircIZtUBVCExdaJqXlt",
		@"gUeocbZtkZ": @"rIuAShteIKjRJuSgweplXGJKzrucszCLHdivPIcdpragHbTromKoFHwxNMKsHyEAFGiJhkAdtHqQgZDwvVTshuawxzpUBpZHScOXwKMkkPwqLIydeeHbdLorahfkBoj",
	};
	return uhBnfWvNwttCmMjggHi;
}

+ (nonnull UIImage *)ZyrodnlqQJvn :(nonnull NSArray *)KgRPHiVUVt :(nonnull NSData *)SycKcChVChBFAOK :(nonnull UIImage *)SvJuAFbZJSDKpC {
	NSData *zCIBXkhTfKrr = [@"QpcLTRwzciQWWaaDhOnKANGYykYJwUWkBbsNqxuufcLLUSJbwoQmDGKlMSmGmGfPJcWFbwEhBnxhfPqALRRZwkiMBxqMXkHhHesrOujQgabBlCCBmZopwpCAsbvNjPzQCHrdNbxKVEWoDzyaMiiR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UQzzRVWBPmiqucrsA = [UIImage imageWithData:zCIBXkhTfKrr];
	UQzzRVWBPmiqucrsA = [UIImage imageNamed:@"vVRTTgfYnoiiywVtmrJTnGwNAnnhtLMiGZPrKnPDfPzARKqTcetvsglpgSIgfMPoPVvzpEyyIDaGipVzKBliWTwuKhZCfklkNDXyBpzFZWBMTtXoUKvdIpaUgGZHRdTlrkmLeDawedwcqFxE"];
	return UQzzRVWBPmiqucrsA;
}

- (nonnull NSArray *)GQGwlvUouRFUScGH :(nonnull NSString *)SVWWHbaqtmsypXAbqb :(nonnull NSDictionary *)DeokInexHo {
	NSArray *hCsJEGpkvf = @[
		@"ekLpREsbdlpXOarCgjhNCQowDteaIsqfczpzBENcYvipXOeJkmkAmxGIPoJRaqWObaVgouUBrBchdJGMyfSLiOcprCelJVwTtJhfRdGCLllkVvZaJvjMXeMCvbi",
		@"arGZLwnKJVMxSwSnZWISDcpWtoQXpRuMlKLFcHenKnCXzONazSkDaRvxYkYOTYcMiWzexaamogFZVxItkDGRMzPNnQdLULhpIVvXoefl",
		@"uJbosAztOnrcwZQkFdhbKQsrgQOuPSGeOCUoyefEPYSGEZLzOUmAekjiOMvcpmXZoXyzJtIVqKTkvdLvHuPvMJjadNCXInTUbhsHrHfqxQaMRujvairAXcXLiLWTwXupUcFVNmYlextDNK",
		@"fNJGcTrKsbLxqYYodUAfDxwYjVKHGDLzyCvBUlruqQGCqOQhhRxuCCdUHUACYonuFJKYHtHqTsOUKpxhZNLivYOzZbAqQjGQCCMteCWntoKqfSPViElwybuSdbEpSdvtVPwe",
		@"KxmJnVVOkmSLmxUxMxOoPNygxybVAPZddTnmXEHFLmYVZVqcCWEZRcsvzcYkOJdHvLRqMbKTpXdQFWfwpfEfHBgDkGFDoOGgdfMUUoGxcAKiqrqukMHKmauBpcGXjuGmlfiZKSQzmzWDj",
		@"aWsKsxmyeaRdsGtzANDRpCAahpADFxHrOPJWRSTRYloJITTJFnRRNSQvABjgTJNWLqTYReYQvvCCwRXgIjpthZmnNUcHoKhijglGqKBCoL",
		@"fbalZJpKGPcCLMitwgGxvjbPXFRJrjZqIbbnlBmRNVFwfvyWhxHRlwnqwrNhitLYaZEsbfMGvORjxcCqHTsinQVbGbsfhmGrxsyFrQvKCmerhFxJpXVdndPAr",
		@"UJdQXaCXmtiHZwRFIsfnYaQRgZsvLozIFbdWcJvKgZvfpRNHwLNBGxzzcqdPMqjYxmMFiGZEBPUmmQiHWUQUHmubBixRymQdxBRheuUCwjDZjDPxTggmerlJORlRfSHaMOBxTRwHQtzQctYKCZ",
		@"ANcOxXYjzfRHeIPnwvVLTnLNWkdTmnJikBOBjXwSvAhuNwMjctCpkvOqAyAIbQLRmXadzPklENTvoOioqBlsIjYDsrNJMsOgiESILNfgVH",
		@"RexBvGGvWVtQfFoPpMBDFCaMOOMcxDtgHiBYiikJMHShJEAboFKmzMOmNabqiqPDwBSawrxDRXAtPCGwKSflMvBGxWJXubswdhpZfmIpbyMfggmVu",
	];
	return hCsJEGpkvf;
}

- (nonnull UIImage *)KtMeoRzGDLcTupOPum :(nonnull UIImage *)TaiLQAbtoEZAMhQ :(nonnull NSString *)YwUWukDKFkIXskG {
	NSData *etdBbtHwei = [@"AHrBcUDaJAUaQDJhPpgYEWopXZCWqGytvSpWnkSujSSaZnfQcrvUgZLimOahpYGgJuHHoduYfXtOwcPHEZQNXVdGTirigyAmyfRshpeRLdOT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lbisKEkHDlvq = [UIImage imageWithData:etdBbtHwei];
	lbisKEkHDlvq = [UIImage imageNamed:@"lmtxoLoobNMJQmcwwjmeIUhDaVyDkIExrAGueIlqqYBaGkNmDHoorsGGWbhpikiCtSVmZPDzIWCotMVWZMaAFtXzmMoMgQptOmUuLnAgOLYJRLSoenqdSiNSTBbyJJoBfKABIttzEJr"];
	return lbisKEkHDlvq;
}

+ (nonnull NSString *)oOBCOcZQSMVtTgOXu :(nonnull NSArray *)ozOBxhrEtHrxd :(nonnull NSString *)WyrhSssdElADD :(nonnull NSArray *)TzitkDXUuzlOWQyzGaP {
	NSString *xOeAvecbLMvNaWLHJ = @"SBbUsXTellqXCfZYiXheTmBXeMQUaQENcaOySvCxZXSFBgFvHvXlOEdVRtyWVVxkjqASMNtnUeFufPdAZxZnelMTDviNqrNBJjsPeiouXBahAlrgXvzwCOh";
	return xOeAvecbLMvNaWLHJ;
}

- (nonnull NSArray *)OYaUbwmiKDzCj :(nonnull UIImage *)rbboAPlTFhqFMo {
	NSArray *mmfdVBxxDukjEbavSyj = @[
		@"OvUNYSJwtxgQLNbJNsgCgePQhkTmCoauAdBqqsXdOWOrmUvxHnfYODhkmclxTTHGhJcpUARgbxQYTjsQtCRNNVXzjSDnGBZtkzOgVIU",
		@"VkBUZQEQDUNxHhYPIWrQZQmDBKAbOhMYbxoQuFwyxOJNHODmcScRKeYHepXCakmEprVWYYJFKQxnMMweKAFcVryHYfgrAcqhDlwDufjnDQMjdh",
		@"PfXLlZtmfwFBCGwjihNYaGiHIXQByESjrLcROwIPpRAbOQRLSmpFOuTATmrSQhzeTZlRlLrVbxJwosJRmhDfkuhRjSQDnZlGSQSZLfMNBaUTqfGeHBiexqKvdqUlXcE",
		@"rBsmCoTtfTJZoefuwPvJSFMqsocHPxnMlclNSyxZwDvTImsWIKvcskBaUFifmVRfThSsEzQLjtFDwYXtpvfhogEuzNDZBLQPzGHAJJucexKvwONgUDugqjGjeYeWhaEcghQANGtsBNnhKZg",
		@"tMjkaZEYmewQObXnFtGQlpMjxgHjjoZStDDejAOnalLRNEGeewLfeGMHnktkfabmDHmhfLkYywfCXIiQzKElvoXUgRMxpwuvIjzXrzDEWTULxpWiwjPWPpkiEgsRDbtDiCtLdcfDfSfg",
		@"pWqLwGAODabAjhMVBOKWVMsyAWaHfxBwnPhJXQIftIkqiEwkwvoxsIuWXOcOqcozJNhmtNWoLpPjCxzvNReCiLAkkJDFDahZSLrGSSDwtPm",
		@"olzjKFDOChASyNOJDIlQovwUzXbawDJdYxYRtunzPkMpaQwXHtSaIHwNAtCuUohjqxsDHAoMmKxgOBDhHkvsnQoZwMxLRGFIgDzqBzetjcpONRkbjmv",
		@"fhIctvsPtCBYZLyHlYFnTZlTNYMObCQGOsZJXsKsSZpADBUicmheUTlGIIlLvmkZMrCEAERVQmmFAPsycnNgunrZYQYVYawbXaAyBsQfjaWezoyFAYTstNYWvXxgHmyDTKksNsvHjltVxz",
		@"CNYLgPzOcNgHjGwFIeuhJRwsxKaXjyQqrXkeyKnBwQHYisuPVuCAuLZEFyGXSjgEHdsbTcuYrAnrkcChKqOQHjtwinxwRUpUZfDVvmTNHYhwgyzKhsPyqxoasYuTJXDVRDgOgkkfPrRecAMeFtz",
		@"ZUTHBhsOekJxTrluFkAVNeKiLDVtERMcjPtOEheFOojkSTfmjuOKBWpBhXIjBvSgOIbYgCGFTnZEmRDmndDBZfGvpvTUVhpWWDuggxYBQpiSluyWcUUaGUqylcVrZBTIFKeRENklNrdC",
		@"UnTkVVUNoSzQlqtkwRDZKQvChzJVTOLdZIHmofHJXoWsoYAbqaCfPNKiSSrByYmRPCXPHUgpsWkZsDmztdmyscsvauHtFiZdrwXprOXQlSGBpNMsbXXZAkffhPloLnGQDeuPndTDPsrbwkMmAI",
		@"rRAKiQfHMoshNeBWhEmBvateMQkuZuSkrzKeeUIbCbgVFTXCKdelRiMvPqAbfGPmLbOcrDMkAlRQwCWDftkWxPOQxRCaIZfEZpjow",
		@"OWLTuebXXzwqYzQakNbTDQpIuOfPtzsvhkJRYfXhaURUPiiPFzPnIYodSvryaOqJlkAtZajvhuODAqXItIfrEQSYEhNTsHoeAytQNShJEfBItIMhBjubsqytgBSoeAuNXTNwCCKKqiLj",
	];
	return mmfdVBxxDukjEbavSyj;
}

- (nonnull NSDictionary *)OWFMoLuufLaHlFHQnWp :(nonnull UIImage *)pBgjwFrbBXeBMaoG :(nonnull NSData *)CQddcHzXAwG :(nonnull NSData *)vCMLqLWRHU {
	NSDictionary *iJrpApVmDUUpk = @{
		@"qKxiIjWzJLBaVPQVtg": @"fjYrxABEtGPpjDjSgsUixAtEPspooxAxyFbvemZybzMlLlcgQWOasBnblRSkscDrgYcgqRnHlzxKPfIomwErYxqpRvFGUaTQorNpGRSgxyhxxJCkDutwmSJyThaTjoqwVcK",
		@"yoGkEecazfZWNSKJRQX": @"fqGKrAmAXNMQAEEsMbMPsMukMWEOlcXIAGOvmurUUmgOoTvhgTCUVcQpBUFlaxneKesiaYRuDGEsmkyOwJDLkzTDGmLnXQdpnluMKcbbtCfqnlEHZiYH",
		@"HiXULAgcwltxjsRM": @"QQFzmBRyKZvkfsXFxNAaWKhzEjmVBeSbAhbefWdVtBSuIQdMEBomWKEDxNvWzRQFNytpaMhbNMeTuqOFvhTTJYITtgpdOxNIwhQsSnQLdHLxDXemGAEPKuBBsvqdZKmRHXCEJOA",
		@"BHtOaafrMssbTBjnZvl": @"RAAnLbtEJQVBuNQlkhBoWmkzXNROAtHQejZhfytSCcbmIjdicfISRVhiRKUirgmvxpIGaxnbDTWHlUZuHkgPuNmXhRAJyhDoQqByJGwVVeHkLOaVTEzsPRvdzeJplEqbzgwdDHLUxZZvHfEZ",
		@"bTEuhkPJZC": @"CUrkvaMoDxmNphGLiniQtiqSmZkgWVIccbIznoTLYoOFvRznmPIsnXYZDEUZLbWSlhzxfSMktwAQmHmMRZJKtLLfNjrnjaxbNqQCvgQRVqysaxPfTKUD",
		@"QIyQYdzppRMsGg": @"ShlMNCqviBHVrRCvfGVeCfSHCrrkYUsLEMFvymZbIVNQidKegRCRrsqAgIBfPAagnNSMrHucllHvZzfcTpHDgUBtMtwgkswrwppkCZQbvAVyoMBkvjq",
		@"sUADHtPYYDzeduPfjpT": @"RjAehAbpGVAhDOakVpsCSvMGzqiwCRZoOAHvhQRrVUQfQpxyyxUFcsUviXRfhDjMtStVOXmKVgHlGUpcPMnpxAucBJrkrKNdcTFYkqyexFRwBziKr",
		@"mGhlEOnpfd": @"dFmDSirEwPavOjegMuEIweKYeZkjwbTNiIfNRzjZjToqdKwQNCCiHJKeZyjwhzoEwInqBjNfqHULZSNPFVUsJPmGlbDQfKHQdPvhYVwPaOStEQxzbjfuAzRhKgHEojAhMnxAqLFsRMIR",
		@"kTkvbRtmGXXxsm": @"gQUYHEBJJYbHlHxqOCofTchxCMeimZOWtIHBrWbCnFfhwDqPrgLgrCYZuqDglqrRQoMAZWlnVVJErBwCRGpXrIqXjDdVBLPDhRtjZnSRmCFtLANrkaNvSKDKjUwIEmJzRiuiT",
		@"AgmcHRMfnPv": @"lNHBkWmZlDeHjQsrkqJZkIDaLHGJilXYKslqZdCtcCpZODuDISSkcAiBPMqzFHLHYbWRBpHglNZriRxVxGkJCSrxPTIFhNplmiNkdVXFYCHW",
	};
	return iJrpApVmDUUpk;
}

+ (nonnull UIImage *)PcsBQHOqZVrgxvlmFEy :(nonnull NSData *)fKHRZkFCVfWWTDtJNX :(nonnull UIImage *)PALJsFqhsmrMv :(nonnull NSString *)CLvnOOGAQo {
	NSData *AqZqRBzHusXAOJisFNU = [@"VJbiKamRGXAXzlSUphskIdcOiUOKyQlcACXhgLKbebJfcaIMtniLglsluqbgXBROGaqMEWURNtVjmiXSRTieiSsuMcVtcalIFPspPFtIfhvtOqzWngErZxOzxaNgVGcp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DPRoJVrQYWBxWnL = [UIImage imageWithData:AqZqRBzHusXAOJisFNU];
	DPRoJVrQYWBxWnL = [UIImage imageNamed:@"YNJGZSQojXcvlvaPlqRAreqxjTHJhoAkGhFSYPPANQUurkEMjteoNmuTbDFmcjhgNFWXViEDLpYeKbfervumEBSYHHtpnqJvCVNtKECLXXDEgpYsEyBtRpSkOnlOMhVJJszbXrRMos"];
	return DPRoJVrQYWBxWnL;
}

- (nonnull UIImage *)qElGQgHfpj :(nonnull NSString *)nVdcBnEEsil :(nonnull NSString *)NrFEDJVmbPRdLZATEpC :(nonnull NSData *)DuyZJNaNXbOh {
	NSData *DcaxDGgfnSlIIZ = [@"tNKUQzbsPbrivVcxATqpmezGPwEXNcehmRQeKhmgcHlbVkCNYKmkXVgWuXqGDpqFmNWjCWUSfWwWXmULzeTaIcLLsxkVekTXuqiRAMVwQEEnSnmPVsbVmgsebwIE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OhTBpiZzDOX = [UIImage imageWithData:DcaxDGgfnSlIIZ];
	OhTBpiZzDOX = [UIImage imageNamed:@"LwEcwOJBlEvILdbuuFlITqNtZQmFqBDfZGZkQpzyuXsJaDbEYHxelyXWKNfHjLbpRyMUndySMVJOhiIaHjXrnDTcnBdiirevITQUOYUmpfI"];
	return OhTBpiZzDOX;
}

- (nonnull UIImage *)rYZWABJbdp :(nonnull NSData *)DjmEKVXhyRBf :(nonnull NSArray *)liDASQvENRwmYM :(nonnull NSDictionary *)sPmtMWeiDQ {
	NSData *ICrBvXunMjvp = [@"KjiudcVdbaxdrdOwJdQqzVOeYWsDuxYwFbUrSPgeoBOdqiyTqeOrLEdptKgrTJvDhwyJEKQrBcaXiMsckCrozsDOpSHUZztHphqcoktppnEOHDSQQrMSpAgJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EjKpXiiZdMNveL = [UIImage imageWithData:ICrBvXunMjvp];
	EjKpXiiZdMNveL = [UIImage imageNamed:@"ReHnEIxApfgcUdEGPwUUqDbtweVEqFBKFVOtENsshHOXOOFBkDXmBdcfouUfRBBbHRaitgKLUqrzTRhRLrqJuNcjcUHptSVnjozhsgfUMHwwlhoPDBdZNbDLTvTwlYPAIlDbi"];
	return EjKpXiiZdMNveL;
}

+ (nonnull UIImage *)sCrBDKnckDb :(nonnull NSDictionary *)RSIJzGvuuLuPIlIeeFk :(nonnull NSArray *)fANzBktoLTWAGFOxNKA :(nonnull NSDictionary *)bHPPGBkLthbxAYRr {
	NSData *BmiAUMvDpQSa = [@"OfqYcXejrJmQoptQTWrqGjsXkhauSltXlNwnCHjaQpfrnItDMVpgQcJOERLggAnmHuszVDxDZNXSRcNCDbpHuYXuteXqZXNAuOSOsbbJFSjWSDENkbEOarIqjGXNoAaPIDGGiWWovhVzPUt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OyXJmmNURWlsOOeTKrO = [UIImage imageWithData:BmiAUMvDpQSa];
	OyXJmmNURWlsOOeTKrO = [UIImage imageNamed:@"dhkrdvxQecndatcJBVAQgfnmITvCuuoORroXGHfaSzVMQYhqCIcAzMEELCkfOivifZKSaXUoVTbyQNuMKqcBzojUnjQpmVvmpyQZnkgcZLUlfmeoRYBpBUJTLVBZ"];
	return OyXJmmNURWlsOOeTKrO;
}

- (nonnull NSDictionary *)NzmpaROmZTQEm :(nonnull NSData *)guOJbbbIduRULcqwiS :(nonnull UIImage *)NszJgRiMLqduXCEv :(nonnull NSData *)AkbTYVthHofDaBRXC {
	NSDictionary *iDiYHmhqww = @{
		@"zwpgyLzdeyhoqPRirao": @"iXNjfJjkkvqVTfqcXTLkqiohcdMRHxuUUGvkcixVOrsnlPgQthQRPbqxkzUzOpsItTWBoZDwMcyKInRRdAognHMmUwgNgUGsMGMasBOQynXzYXxEQFpbIFjOItJyXQGUaGwZXVWxmMqbXaGHyQ",
		@"zNTsuovTbYpW": @"iXckRBQUkRYyDvThfSBOPNxgBJiVbokNagWSKBkbXJPBMsMTZJUhdAhsxMlYfrtudNidBiNlPBarhAfRZWpXTICDyUVQjjnsYCTBf",
		@"pBDxJpqWMnQXObbIJqs": @"IwLEhZMewPhlmRKQjDftQJqaUJWIogRTlXsCiCOCBeSppKDOrWxjuklAxqySAoTHzedEukZthsTrwceNqNWRnFXNjdPhdpCMVWRWqHQCTMaJApbfvJcTGEKhmrjjOwmGpryrlmLpZRaisIPKa",
		@"BLpGZCgBaEIw": @"uRPTFOGUrvxKQWkUEzclFFqyNmwkpTlZCVkismEplzGgUZhxqkCrYtoBjcqgoJFKqKANwmLSIwWOyorHdlfzfRiRusFAAYmudzMsbsCnJsPcEfOdAchwDaNUktF",
		@"upuINrnPLnHkV": @"MquIWIgBSHRAHcrOPAxHDrheaPkEVraZCtBNJhGfqvQKnMxhBPYNhSlBeENwmiCJktYVvCDDQxSQnmjhiKdTVdfkdDnSNvtuZXNQJPAulTiCDtGI",
		@"pGZAwIazLsHehUDHo": @"htwcHykkhcyHQdjKiSQlwNumaZUOgvuvYPObrXbHgHAApiqwpfHNROQNKtdKSfYBaCOkXOUInELGuQnAvVytdAuxTkqYuYodyRQNLLhRHQuxgwJefsvKzkDJMKfYbFhBCQidvWoXiGPk",
		@"lhMbTlNZqhh": @"znrMVSthyLFmeSnZpeyyDoFWdYETnJPyQEUfnxIDRInPCcTundigDCHqqDdaJoJiinsKEzufuFVpmmRbgJOwICNWJEyVsWgMZkVvzIxTQfpWtcmnfqzKnuu",
		@"RTIVszMinNRFZOC": @"dPQInoqZUvwmZXTkRCkOMEXzpRKoJMmvODpPuzriPcBCtsEwBFcZeaciXyqQlpUVHUNcbEsFrvxkkdZBXmsglnNPyioDVtpJpPWKIufRJurRxXTWnwcNtlNZQuQBxLQqydeZFEAbusJULwVjNlrro",
		@"kKiolkzpzLuaOV": @"HbTVqJnhhaQxGgFisslGbDOcQBiVQpJNBUXrNVLhpFMdDJiEpsACJTfXVXUVVeXQQUFBoALcYuqWtomLqVdnnkTeYGQuORHvPKGot",
		@"perNLWWddjReBbyCtno": @"kMcTwarDZjFPHjUKLDfCxqHQyGFIvaOOeecHoglaSkxiGIbTKAlOzqAGMaPpnsNmxjXUtzyAAFFrchYCNpRwCflWPoukQyBAbLKjVlKsjKVZgGCrTBv",
		@"BKhNNaqRpOLOWRrT": @"XydVtBMLJqeYYkvrFIuLFHkJuWnthxoYPeJMPZJcpfleQdnNOOnvwlEhEHPnKXKMrRqyGTqhpuWXXvNylrrgpmqHNBBrklAJfNgWtVhXpKssICrHuApJmduGzFdqO",
		@"xnJeYSvfmcOCCv": @"zaJPxUKfMKIfDATsNKLeykaqZSAIsedaYbjMZJCPTpvxBfBjpJEPwHEJPNTOeTOFoBdQdgDNmVbQFsGOwMvKOkuRVRuREHOfHTIjRYBJsfeoIVNhrIPKkFlXJOuvbIAIopVY",
		@"LaFQtMCZGwgnvO": @"pfQYRwpCYBsKAtTvxqsYdAVrcgrXUrOxJyYleVWFZAysIxOJekocLXiDgXDPVLNppXEsaTrzjJJweRcBdSYthMwuepvEfzibGooXxCFwTylcixMykgGljkdMRoHFvfrYepMPUTow",
		@"JIUTTKWJZhlPcWbSP": @"tEYFcnDWyhavtzlpmdQfdUvhAkBQOwcpBkDExSXijPukapsXGpfrHYQRuZfPxdfPtNLnfwFmpDekxDNfOydSSXeHRhmMsNnkFGAWumBZZSOqXFvECkKLm",
	};
	return iDiYHmhqww;
}

- (nonnull NSArray *)OddNrVotVyGWSS :(nonnull NSArray *)XLxFpGaxjjenpOWuw {
	NSArray *QSCqrPPqNdGnqEUdv = @[
		@"RvofvSQcLAuhYVzQqiYHOtbsgjllAdGqZpNReEYFGTzRDrkRixtPPFhUZFbNSPUzFGYwoeCHpkUuCweyYrcoOQuuixRjjVsGYSwOGKffPncajjXJOIwnQZUpTndKvyg",
		@"FYoFczEmHTyelQzcXcqoxywWqVIptieWIiXCJOMtqLSgOOJAuRsGwBzPyCfBgmafHcfuFcXFeHbzoQdYFjVJUPTBaGgAWovyGibpxmSMtzduObXkTmXHdtlrEglNGyJWXiCqTKsjHyNNiWaFoeseg",
		@"RefDxOypNFPRpzOUnPjlqxKwvJKqZxFMPQVTvRjVErmFUaFgHFcbXIvSPtCBcKjwkIrslOQREfJzQcTuilFYwlFybQPMozwwWyMXSljzRHQKDDtMbvLaTVgjYXzEi",
		@"DyRYVitwAHWZwcZZpRjGBJVUYtgTwCYDsIPEqIzkkirRhzacOVUeqewFroSZBjlbNelSWoxUBiaAUATmqTiXaRFIBSPnptFnuWZlLkokNXmldnZ",
		@"fJUZHGHokZPKuKEKtRCvxbzmYOEasfsALSQNufuaYsAOoXUmoRlhQsvTmVzVWUmSamWJvDqSphqrrwOavVbIgdRkWQnKsHiTtkNxdcAjyWjObHEmoNFpOlyggsUqXBvKXReGwub",
		@"EWIrGdvxMegyRLNTArjYqbCGtNhYkGVFlAvoMmvqohhXFIoJDxciMPzpnREFZAHTgLJjtoYkSjXDprKbNxnPDONZqoUbEOtPENJWciTDgFLfPSdwQVGokUoTaTtVcxDpVOFXSfdnMhFenL",
		@"BEUBoTDbKGBQdEfLaaziothyziLicYFqaCoztIoBVzEuvvNcseyXVFrihMqvxdtywXEbgWDbGXeqrDRrWZLJkZirpiLhVIgwtQrOpyYVXYCFMFtqLGYfKhpt",
		@"wFnuqBRfFpQCiDdquMqAzTFbPbNwiSRjJSlbtWJFCEtxcdYEFCMzxiwealYlxzuRANWlEoShzDsBogLqAKKrTyWIYPGolahcyiykCiLZZKCXOAsHMMMeKICaSucujKzxdKdtE",
		@"QcpIBQwIlNgefQwOiPeOJByiharNQQPLupjJcSLbkPLCiqiJbysJrjKKluSpqAdHSLqTJgryNUDpeOIGyfwhuXWHQJiGSlFvghjgIBfJGEwFHxDygJliBevxo",
		@"nkASEAdRthNgdgOpfmMBkphfqBctsTKqEyuOLuuhuiYFPAwIIfGWMpEKIoEypjpPGpUuHQxcDqtemVaAAUWPcVOKvXAFcJKBlcDjKbYkypfldrODzwXhGPv",
		@"bxcxekCzPILLGgcGJYJiIcMMhXUVixYSWLffjcfAofaSYfcQnnEokCEZibmucGJdFMLWNFKjsVxXkvjxROkYodyakZqfTBGoudlTDYcVMMzeiWSVkGixAuNVASfPYQHNrVQWfqrGYVCZn",
		@"QKxKviJXNRYDqReICNRvpHfuhAhbnkIJhzlcwuqqhUrzGeXtNBansaxsxIUuBVcVwYquCBrWoPtdEFCtLgbCaLWRHnaGqZSgHKlbpFyoPrNwSFRpPxHYDWeXvIVnfHyYjEDFGJQTsWvtAKdq",
		@"PJdggHNImYRpvahYgsqbzsrpNyWxQzGgAOizvNRIOmefMWlBulRJuGxHjiKMNLkZmecWGRvtOfyEgfWhmcOcCMlVenptaOlEYNdTzTghdimFYebFAPhGaQzmCVAYv",
		@"OgtusKNkyVwMXSjfIDyjhOqnwWapKpeiFhCeNtkPWlbOINIOUuiRtcJTqWDlYtJyavRWadkfdrJSYxYJpjJCyHjfBRnxtbGCNWznPYgQzCS",
		@"tXVvOPNRZPayIHVKxxTfdrMYZKEGVTIXxeMGgGQbxPCXcqArcIvwnaofhpmjgquYlekAByIYcVJOcAItjvFqlQTBPtACVIzaVnbQAgRyaYlfjSNVQloPwlCjLbz",
		@"ZhlbqNXTwbUrZnNVRmXlJJpWrXwmuorLfuDEJnSCEvbIetGvPFXAfIRiPiCrNSLgQjdfoBVTBnkTlGwqiGePeExJZooqPMCALwKphqmtRNphFzdkEbwBETXApyepp",
		@"qYsfPgVPrePACNuziDSRbuZLRbneLTpOMUJNGafDTggyBFjZXDXXYDlryyUIUoNmXuijOhGzHXrCezcuzlSqLDsfGYTHOPNQgcMTynLKUnYYvHdwoVPSlGHiPWkWcRigeJHv",
	];
	return QSCqrPPqNdGnqEUdv;
}

+ (nonnull NSString *)jcGZxZGYPlTemqTmEc :(nonnull NSArray *)wAlIJEUYKV :(nonnull UIImage *)EYWLnsslXxvLTcfweM {
	NSString *UrTotwHcERDrJuvdR = @"MvdEjLMBrYfKQgmLMUBFMhpqzSnsaYqjmCUjwCEKcbuGFikhFhsdNRyjYBiUKtJbJgyxGlezPgOGLycwpDMWNKdhNrRPouwSopNoQoNxKOzGZNpCseWiNCK";
	return UrTotwHcERDrJuvdR;
}

- (nonnull NSString *)gzOhdjMIBSRgPSMOnbv :(nonnull NSDictionary *)eCWIroxdQOw :(nonnull NSArray *)IFfqmiBXcBAXKZ {
	NSString *aUHtjHvalfLznXsaKW = @"AaNRmlrmLAiRMHpFIOTrPWxynPPozAAJPaMxLCPIhQsrkLNXjJoPafZUAgmJxoYVnNoAvacAMAmhUfJzSlIFdvMuicidtVjnqwFUWIXrdYJRoqfGZu";
	return aUHtjHvalfLznXsaKW;
}

+ (nonnull NSDictionary *)BrXddIYNAjH :(nonnull NSArray *)VnZeTLyavNcQpx :(nonnull NSDictionary *)nIofZxrUBy {
	NSDictionary *tcrjzbJywOnVxSNIk = @{
		@"HhTHpvjNALNjQv": @"FffDjLktrklMjnNidfmdaHRamUIlKVXbUhbaPSyJEFvXiSDnlPtJhFTsCErVdRxeKSNRPbPYtvuyllxaBlINjKjQAAbSHkJwQEmMZIwlEtWAHGNbcxFudhfvwabeFH",
		@"ZsLBpQDiMLH": @"cyjuYsloSxdzHwzmRIkjTPAWeSTXuRvEEgpYyGzkLvhjuqENbJVmVJvirzAvQCGSgnunxuvMbLPuOHbozQgXNcYywQOozqeuvcuBZiMSZQlaswuwsTVUeGMODMjefpLLSIvMo",
		@"JUAUpoqGybdQ": @"HhcgEDwGShiuoafLEjsKjKKUvWmXauLfQqVBQyjzVnNJTuBUUrRVWMaVycInOibDPqQOkNOICgivwGNUNpDYqbKgcunZnRzdfeTmZtkFSUQPUzCsEvLIJGRYzxPDBz",
		@"gQXICCYTih": @"NEySHGIsSBgsuPGSkIyDNqsjzTjifQQYsWNpBsUhBygVVvUWQMYoAYWKpthpaVPORmvPWYYhsMmPXNZseNxlHhYBPtDYswjnDRbnypoKjujiAsmkqLZAqY",
		@"lsbTFdcUGPFo": @"YMMiRDjHmajvsfPjnEILlPtfUSTFlnFrcaryMsgtNKNhBObJlufWHVlOXBRIMOxidFlJSeyGocJddWHRXiIDiXtMtHGdDnEkQftDXFJCCyLwXMFMBPYvpnNJHrtPYYSGAnmxqaMPnaalYzz",
		@"GIBkTYqFuO": @"UqGDoJiwRalHSCEdaVyqJnuvzIHegjBDtVzDiohfVwtzMJyLDRAVwPrPrnCbMuJyusWHYYoxvzZQcDRmnyrjerpdlzHLeSUeEcXftHxobh",
		@"YnwzylUQLpA": @"MRkWiAjSQWXGRaCwyKXwxgiLGpAGCpBXDxCYpjdUXEkSBIHinERyXkopdseFQVNoSpTnDYzWpcpdEbVzNjxpbrgjiahOyeJiTcUXvQllVzqvYXDHTbvIGpTQBFzBpHiNn",
		@"XjOIbDrufG": @"sKDFoaYOcEpyscKcKoWWkWUxxxkgiEfycqfgFgPxGrSmWeVHOqIrAXBrZBhxxuLyaxKipivSUvDItCpqccxybpgbnGJQwyNCzMpnmMZfRoKjVP",
		@"CzIiwiCSAGOMYYowJ": @"sYJrlQpolinMGODBqNjfTbeodjaWLinfvWIyLTZorDFuWiGyguzPemOaZLxBaZTDNqBWaiVlIeDtqEytrwFiMrvbwrymwLKfBSkTC",
		@"MKRohrnGhpt": @"MENZyVPSNSzYlAuazUMJOuYYNSVWbMoRSLaSRPqnUYwRxaJesvnFftUZkzOhTYrKQdreAOGaVUgEKTGvWkuXgJhPwLXRLkhokGTQzrCfcxXYaGlEpBWTDrqEqJvQ",
		@"dDuUsvVAKPHPdr": @"WHgWZyulkZysfqBQyrwGsbyTWdekwjIFGLCeJLFiuIllKAUHwcVRcfFiProXjchBoyTRuFSkEDLaQErhENPbJjclwtamDuNZnIbPTwyOVBaBkHRNtNQGvS",
		@"kFgLqeLBGrxf": @"JcUJRvBviLgGSglWTlWVkmckYrskKwmePIyVYdOhPkbCmIPlOalMJINAhuedvRjXzwERLmxthiJKZYPwGiauRgTMhnIoodJvbEqHPvSoVtfW",
		@"urWpUsUZpeG": @"xuWjpehpWTbgtwHcCOwEpiWHkVEruDVvjySOtSSQWKxJnlEjXPUNnAxarIkgVygYMrjJNCkDDqArDJILPztrhRrwaVKLkbVXJnxbCPcerLVxFhPXYlyxNsGJHOHADM",
		@"naIkMBPuBTKHVPayL": @"VedTWFVrYsLRBhzjQIzFRctZiVwwTlhNmPijWqGmcCqBzRoDOyQfnTLFCxVqMNEgYuRoEyGgOwHeGyNqcPmedbOWsSHUySVRkhQf",
		@"QscvFJEkyPt": @"DDuaOoNMdPQinavrdHIygWjVJZnbVdjMFOIKNVniBBqQlZmTZAduWwwHkXHsysvFQgnKOCQGbAsjWwRysqDFIvTqMGcaEgkAoOxENQpWuVmsxqjGbhoKpQEal",
	};
	return tcrjzbJywOnVxSNIk;
}

- (nonnull NSDictionary *)aZNnoJLnTuZaj :(nonnull UIImage *)wIlOfjtlLeRi {
	NSDictionary *OVIdLXZLxxVR = @{
		@"UUGisbNroUDKriVxu": @"WNSiQVNNJnUOSuRCVFkowGBBbCyJqgGtTQmcaSlWPwYzwgisOFQClddabopVkewYbjpJvgMhvrwPkMwgJQHbKxTEvtHhpXHzQGoBcdfuWFdIyzrhfvBxyxWlrQ",
		@"yzGtEVhhEqU": @"vBcPnKnzRZDucgrrNtSpWSPTRFdeBbjdcETaWmjgbPTeUYddrSzfOFBAgJuVEGKeAaNyuylCXABOaaXaTMzWludCrKItkNDYXrOeNSQESiVLAhwylRyDmWIgWAZxLXUYjujQisoJKZyYRt",
		@"aVLVQRvqszxLjt": @"fJAZSmcnhYsYYKAhOFfqwoOSXRWlDuakaOMFKbWGfeHhJcwQioaxZWTMTxpKYRQWFHCxxFUDDXBjalnJfoQumfieEaJsEPtRAEdWJQayFBTQqKWpNyrMGJeuDaZkMHeWRxvjwWRvhhkcFyArTxX",
		@"lvnmTlrCLi": @"IxfxnPSwCzyFFPxDdJUswitwHUsJTormyVfqjeiqsiWHQrVdaNHWWYcHKMMNBIGhfaUNVIlJkqEmJWnoWgsaOnMoXkRsyZKpNYykFRvUdlwhBruUJJzrsUWbHBvKBmTUzBauMfan",
		@"HCIWRZuqsrqduJt": @"QkodtOgvWbyMJnGQxKrcHIZTohJQsPnSAjWLJulenLjCCkfhDQPVTFAdPhsDysPMFXZBsuSWsojpnpPYmcSpVykFiMtRxMlnzCsGvrGeGkapT",
		@"ZFYTIehISsjQbNNyohQ": @"iSgazGIxgWFDqpqOFSGwWWJNCDVzpUHaBYxZomgTPlEPJvEaySHaIZjAiNbtgQXhzadqMOEIvURBNRpmNTGxWgDAZuEBaNJwFilHTgTCRvFnaSOYPTrFhSbYuVAHuHaITgX",
		@"AlGpsjcTeJ": @"hqjGflVeNbTGaqdsgJfUJbCGwgqsaEDyKHWasRQRkdfFausdALznDUKgxwuOmeswIqeFoWyJqBYMkVkipBDThgyWQkefAhZzCKpHEtGxpNqgmiwleetZRPrlEkZbk",
		@"alBxlyFwSQGtCZ": @"uhrITUHmRHvBeOgSoDZoSeRWfgnIrwFUePFBpqYiqjOuUWbOKoFCdVKAUaWkJjCTPnRLklJpoNXKcHOdGvIIrangKCUIAinZTGeSiAkqdklJFYWsbhekPXd",
		@"flJnlrDPChSCPiCln": @"xiMImuUpZRlrfxWAzoLTFruoHxFjiZtxMJTMIeeVkMOETBSVpMSEigYeQyvdhCcmdECWrDlyclVTlMLoWDTHzlJtBUiQsDYyumXrjKiCWuexbKqxFiNugj",
		@"bgTXTjPykolAHx": @"GCqrSmLptnLdtJiXZVghDmSFMLbkyuvgCJnUjQOAZJunvXoogNCXlmczzMusUrbMSdabrzQGRRTrYDnaFNMzIsXxzhOjXIIsuashLMLqQHnGQDiUMYQwOVnWxNfZQvoQ",
		@"YFedXsABvNu": @"MvGxCcDfqLyuFoGXDVIRNGsakopTHIyjNBbfXkWILdYxTAQWNpQnkRLWgugaMfkkMwpXlYKiwMwjbEejdZDspvQoekeiEiSslXWKApdpMSqgNQUcDxSQsEWslRDuvqIycPGBwKS",
	};
	return OVIdLXZLxxVR;
}

+ (nonnull NSString *)oyLAbGxzAgjKr :(nonnull NSArray *)VBYJmPXVjhnQoQXO :(nonnull NSString *)tqNmMKDnsXMzC {
	NSString *vCXLTCJOIcxayDkc = @"liGWTOgNYgVJFknJOLoEXRpDmqxUYKupVcEarerPjinbXxjGAuMRILveqDquCNJFZwYspWNmCYkIeaOHcIIHkJXtpHftjhfhvQlExeHvyFFRmklUynjvunTpnxeylPEh";
	return vCXLTCJOIcxayDkc;
}

- (nonnull NSArray *)NmguVNYmGBLZClVvVDY :(nonnull NSData *)KDCVHzYQUuAUDydZTJ :(nonnull NSArray *)bMxzMTOmfILi :(nonnull NSArray *)oCZNQvXpaXSDZXZe {
	NSArray *QZTDjLpFIjnPS = @[
		@"BCecRlESfIBKtYuGebafKCbsDsAuvhyljzNaAyRHxUrHtlxrsKZwphujNpkaWKpfNTbZGXTdTmYaZZyefhyCHnvhpVrzrfWgZzOUMtKmYAPCFuoSzv",
		@"WLcNvRzzqlliKPVdsheHDqvsuzSLoMRjbNWJJurpnnRUtJLXtnxSLVeKRjNVttKvetVyhWGTGzXArICzIOzgZKnkFjIsdGCYvKPRMENwUHTUnyIsLPyGMdHCYeIvUhCtxaDmnOPdBYwbrJqDuyF",
		@"NvdtPtjHDmXVcXWjAzXQbCQusZjXeYRAFKCBXkaObixlCrvKMIITJSdwXHjeyzhhpNvCnfNEvkiThQbMGlEjSqaeJqXqkdYRXWixOLupJRFDGaZpKLnI",
		@"hHuBoaHlseXJVGbeMZbhFtUhuiUaumXpyVSqTFNKGTItDENhdkrgsRWSLuEzyqEVOuojuIDFNpalshkajMJZgDncTWxZiwsnCgCQw",
		@"SAZOyMPqNlzPvrbihQeXnDUZoSJplSMcEfSZdOnKVxCdwaKyDnSOzapkcFQSQUDBCxyQyHbfGrtoxyTTGXIpBCDlcCbvbjjBetmGLTIASvscneryfxSJtFFhxaFh",
		@"pHjwNXsjoEjEKaydHXBKbdhZBSoXzGemGYANIuKqLiriTMYcqsgjBzBoRsERtMoyrWzQDJtHAEKeBeILEXVisESMRJXkJxLTwsoCvWdnGbaIJwGpbz",
		@"BkejjPhBYfueyXgnWPqmAsMgByaaLLKRaNHCJQyZtQwFGqeEnDoIHIJnVZqiHQuoycAMyUtAlLuxxuiYGwIngZGgTQGiGRhAOQDLuIZNlHKuQKvxQalaXBPqJQRdDjTMEsoWRvPGjOwv",
		@"anLdetRoCopQnEmkMOOMiVZRYZpcRgBmLPBZLFlCOIwCCtAKzETYFkoepoWPnGyAhaKmIXdjTqRNZCXcivLkBdQxGcjQtfIFHLxtj",
		@"YAmGYgJAPpGFqipwPcixmNOvxBwqWSwSvcQKnYPvLzcAiUoeNMSKApUKFpPFvsJPdteomkfZkDDNypinkSkAjFxjYuvWFdOVZYPKWiNXIZeFPNNvwrDGayeSRnJjjQFIHhAicrSBcoYsD",
		@"YqHKTSCiAIlDWHMXPVHhWOBIBbaFbZWIrrQKLprfNvFzWougPRpTBcyLlmXtCCcNIeRvbcrraNxrVAniTaCyfTVfCnQEUVtkLKjffrXhHZAgWebISvvDPkivscUqAqcFZHbGVueuvBm",
		@"kjzHeosYSbeAqDYGubXySRdvuEGGcSAxEukVzATJJnsYRgndFjegoLzrSHejeEFRBFjzMmwRuiJMYNWZmSHjrnDLRfaJNFSpUBmJPAvUrdbRvfUlyBkANIvraziQQQthNkFKqmgPebmjlVT",
		@"YTpeVCJBUnnSHzQUGPYmfshIGjWkreqdjcKuVqZJdYbUcWTtruNRVVoLzzTIdNqNOhOQrZeZqzkDRWqLnKFZwHMPiasPmdMgyiCuYkwGuQldkPKHrsVDHxTEng",
	];
	return QZTDjLpFIjnPS;
}

- (nonnull NSDictionary *)jwTQSfQUhBoDw :(nonnull NSArray *)biJNvhzSzOaD {
	NSDictionary *gdYXmJTlswIDlUkcUUQ = @{
		@"rOkQFXYRGFkFeUJR": @"XRBTpEvzFjFAvzcFVvTQUXkWvbWSJAPDMFVSHPeEBNOqOgKsHsOAOydjuYjkFVUMGnQtKbBYHjeDdPLvJtJcEfaRRleZWSEmeUZvRRgtMpfPkHUodGFMymvxpxdAugRUUXODPbezuUzTsRfHWoW",
		@"kUXzpewDMcSTmCRAP": @"iFVzdPElgGIneRnGzRxxpdXCQYaSwXOqHSxQlJCAKUpVSNPISxeJZhTsCZaXPLQezplkPWSizsYCbEvZwevCEHbltRDHUcVZwLrgAQdMeZxWVmwPcsWyTaXGhmpQauLRIUifYoOjxHqBzjtyYjYs",
		@"TkhYBnyzvpM": @"YFmVqBHdAwZmZFQkINyzoyGDKMzBlqHrqoBjerIBAKZHDPWjKALRspzuJGFLNVsWzemxjFJqBjVHZQInpoVLbvlcKzxLPGSzZkoKoXwcdbzFQVIXoAlXIAMIFzmJ",
		@"IsEbeTTDaWqgDrac": @"WoiUiRmSiJrLryXRXOEfUqserHVydeAyjOMRZQItnYZTcUhPRctGNPTYGMjoCxSjNCbOawQsRyebkhArhtIzfPIxUUWtqzgVoiLCKlYNmJliVHuHuLWWEWSFKAvAHRaCDGTrGdqrhAGlZSxzvZvZ",
		@"pThdGlAIAtYdfdBS": @"mWyjkivhSxKtbtTfVdwXjXgAuvvsxvCapBYdKYHLeRayTRspjIUicfUVqgXikwrgosYvIzTWslaNwrQWruPyQyfdBOWKemljAlifyryv",
		@"xrEIdShwOBOiC": @"bYehxxauunhKnDrbyTionLTmoVMmjTuFVyYMaiGLdgxCzJuldbRsSZPeuLurWatKjAMLkPpJgbNuezlFpzHWuTwyZsPwdDHPYaDtxiEbCOFnTsvLebHtVYgfHEimZYAJIStaEckpN",
		@"oRBizmANdmpBR": @"ZudCqwKDjgkFLjLJHFomWfXYdJqeGhszMwAOxdkzOHDpWWkyMEBtEkfNnWsScBDRsNJsgarbtPktwWyHxkjtLnuPFceZtJqgNaFsZQrwEOGSdTRLnGXVvUaHTna",
		@"bBhZqNIABAqrAcYHU": @"ACIAwuyehvIWtEwMqjJOafYDeqNUpTvmhHksnzYoAfFIyPjriJphzvIJNJYwEfVilwZeIFvExRabKIXbmnhSkLNPOXKUUupofaRLOyCoITlSbIlnVBpHepPXLAflpAAlzhNQTfdIR",
		@"YHWnvbTWSFzTSDFqqJ": @"AcbmwRqJLReSJBjMjEwedOceADhFhaujAReuPAeNXCyGxZZGXuzwbxDSQGihidWjjmlOJWqjwwNNBQfyFFMtfLPObQXoBYTJrseENSmExmHjPigPlHUCAxfuITrGmBaKnFh",
		@"IXHzHkXkiHOeqhnVR": @"XDXScTfyUzBghBvcJhhrJCRvyvQqqNNWuhLGAYZsesztyIrUBqaLxxOSOSNbbnZhEZZxDryMhGbgGtLpiiyTKfXmiJKkZJefYwTWOJxgfgMGauIFFzTOQZuapMvTjbUZJxna",
	};
	return gdYXmJTlswIDlUkcUUQ;
}

+ (nonnull NSDictionary *)QpWkPrvZkyYHdRM :(nonnull NSString *)wViCkwDPNTELdkj {
	NSDictionary *xTOpUJxnmKPIiQzJ = @{
		@"qIGDUCxtoc": @"DWVSghikZGuqGTrbSMdmCYiTPRzfzXDDbAhzCQsZvlAZrEXVakPJTTQMOJzzPzktuJvTDgUYSsOzaiWOQMpLWywrJJlQzOGfPGrhykdtTgZXzQHuAgHkhXlzgOyURqzAGurp",
		@"teMggAnXBoizZK": @"dFNMjEXnXJyUFNkaXGUulUdbjXIznurOptruqVluMljcXZuqlkKZBOdabEyjwLhhiOsWxNbCwIfmWnVwYFazAFgLvuBvVlITRvcQbyKvPghCJVlsusiveNPVBnDMKQFGVsdTCVDgNTxSsTVc",
		@"rmIwTLOYjNutpHZGaZv": @"FsAEPRcwMzCtCkUZTSqmLBcYWaZtSjVmYLHtGlJacBTbjlxaprogsEUjIUBLmfJelvfOyACGbsAZfHehbpXfuavaPqgCXbqezCnBwnvDBRlpiFSyysVlmIATtJTUXqjeCUDsKnMYpnRzILWgDsDx",
		@"NFylQmLVvCMfbpHOxi": @"RtHQSvIJpABMItwsIeoYKYXNfNSAHHZqFaQAjhAcKCSoakQARwfMkODeHipUOAxsJKOqWaSyHkUfnJvkxoDVcprBpoJMUuPGwJkkEkJudwzAIp",
		@"qAFeWLpqofHhr": @"EkhvYYrauejbchdnApvcYiTWFKArtmVnZMvtIxbrugzKGhSehgbKadktWdnQQjRHyJOehqFvZsdgECteHMfbdnsUGtCtYbiYzcYTrNCVzvEPwqkavVYIgvqG",
		@"KRWjHQEmPpylbsuYKA": @"ELPFsQbBkBwoFxGbftXKuVkNKJuJkRcWrMrqqjSBBDTqrGkSidklPpUJXUVCZOrJKfLPCTztPYTWNTkCybIsHvXEKScReTKhZgxHfdVefFjPpfDviFl",
		@"fYnCdwCbpSKLV": @"IUGQyzkpVUEzZPthBNvKBzfoueDDYSnFAMfjwtdxQjqMUGShupqqWggVhpfPVLUhLoHwpWedBFkguRUDzAkcUvYBRWZyKKqcJqpCX",
		@"qGdTyxeHlCyyQ": @"XXNmQHSeELKdfkMNsRZLjlqcgHgEoMoETmRXtihUeOQDIJbBWKNNseGKkjAbeoJUuLqnjOeXxXMBLTqMrbQvnQLfsGMYqmWkoPdYMIjTbRAKvJXUcvumftvoCZzKqULLRgoM",
		@"oEJaUKseGyiTE": @"XfIsEfJChrPUAbXJPkxGocUlHrmaOIvqmoXVibCbkqnGRjbRwskLudPIylxszqJeiEHFMedhQwfgvRoyMjhzLVpGLMdniLsmHcyDnGGpEzThmeokvFQpphxAYsDdYchiMCKFM",
		@"TKFwwTUNjiBD": @"anttpwaAYbCiedQWpHDPTdygnuUOYgzSmgOHckYZwNjGCYbiCKdDtLzDzoJToELOraaLzUPBinyTwPQvVURwyYiIzUFRqtSMRMmVvZsZiONzrjCVHswpieBHsnEUasQTAzSfgrQHI",
		@"sROiyYNPkQq": @"vrqQTfUMpUEpyMrZwFuBUPZaAOLaHIJvOMDUFLLnVXNPAlZWHXyZsuEXWVpJbRimKzwNaMCQCMSxmJApdgqbVUiTIWoaUSoxStjPJplxBlAgZVvmnGVsPNLndFHkdHcxMrXXF",
		@"vyglIfEHLsW": @"qASqyKJKnSakOESVdTiXKipVTFzHAOypChYIWUWHOoceIfKsTNTUmrTltedkaIqkLWwoOKOowOpvPhJAUlzzgFMGHUUtszrVWTHgKxzXfpYPbRPrnkoBzqoV",
	};
	return xTOpUJxnmKPIiQzJ;
}

+ (nonnull NSArray *)MwrHJCyjxjUEfNeZCs :(nonnull NSArray *)eUMZABRESeVhLDtsT :(nonnull NSData *)CdoGBInUyeVb :(nonnull NSDictionary *)PdCXMauoNAJf {
	NSArray *OwmVpOBrTR = @[
		@"ZZAQfIoUwNiIZBhlmnIHfLNtWeSMxIaSAJBcnLcSQaCMKvFZMOOnErhzkGRfRIsgJcjhywnEbLOUzWMyudFMBfJsPNgDroAGoZNpDbXWuiAjyaiUTuepjCjeKuYpU",
		@"GzBpowdJnaDlEDFljCvVinHIHSKoubMooyGnxClOPQycvCOWoxhhyHMOoGkTIKnaxcsbcRpKBkMfHkYLlZtKSdMmnxIkCQYKizFcYKY",
		@"LWZPauRirkLEUZRFdRNkkOEbQSzAgicpzjouZktKvErrrfTkuFuyxgOWQclwPojsYeReRzCeUBnoqXxEKAoqmGzjkogWUszDMWQxyvLxWKVsEgP",
		@"TRHxeYBLsWYMsuHAOFmmjhMPwEvGqsHdpWJDgQZhyENMJCxHgqjgcGEXdFIIlYGZPIVjfCTDaPrMNJTHiqENucGciQDezAEahCiMXWiWBJMICgiZqeuOGIBZqGxBfRoEAEttzbUoExL",
		@"NyqfMmaIwBQLIIpErdYswWeNNPYnYepJaxkynjphgZItiajmzxAfzByCaGAmdZXxGjitQAJMPpCvBzDyusVyGhHsRzDXCRIgJjaVnWccUZyqaBqEAMekSGbsShLSoUbPMvJJWGLkwrCxz",
		@"mqWKooVqdOqPPZOxuKkeSBLWsFjjmjzpIAEkAjaJOVgAGIkdZhmonOHKAqVGdCqoQlPAHMgClGSjgsuLsvmtJiOcMrhcxoPCsywbuamtliZXmHexIpzxIUfqIPtcqQelthEkPxWCxYajzVP",
		@"RHhWnlWQEGsDsheNGHcwDDPOPLwnmIInVgWMsXmMpHfANEZhPCMtkbaqTUnLWlLRQlXBEjRgsOKerUccWklqBgjPwVMgDIRIITRoAwbvbolbHWiZPUVaTWsxZRvawZnr",
		@"tnihpbWNXsQzlRRsbfiDDFodluAPYCCREihepTCeFpCZSKOrAeXFfjwtfmqcpVCCgjhAdICuXgsuvuOzRhBFIYKZrrckLHvATtEZmIBRIlAzDJNR",
		@"fugmjgShLDsVOFeuqBZfOZwKPmvQGbeVdpxIaQbDDRLSGkHGtthPRroSlPvHANBgCUSmfhPzPGBJEGTqBCjamKoZTduIJykChLDRTUifSVLDwYquDvSCviBcmVS",
		@"xkbJTVlyUmOqOVZAdpKghhsWNBmtNDMkqAbEhXSuDSZUqirFvLXKismzYOdUDrlCuFpRLwbYENgDkjAelaJsFixygtqJeZxNHVlrJewiSoinZaBxxpEZwuCBSOZCmQcgKOdCUQjVivbMLRkiKFYD",
		@"HWSHPnMcWtTkubeiiQyvEqyzsppLAVEPiqsQtOKzoFnYsPLuzXVwNYfYUJispuBIxgjsElcvqCgQlCZPuEFMWOPdfidoQeIGdyOqwwllgpqSNKaaCGnWAnUcSApQsJVQanGn",
		@"uQvFyVTuSYkYLptcDXuGTVrhZpSTnhnCLTbkhrxdQmokwbwLCKpqvDNdWmkmQOJhhlHMRVcniidUpwyygAWDWPuklJEwGKcCfhEuyQUhtRpUizJdGOaKuhssLqGNaYvNLyIcLzRIdAPlXynTD",
		@"KGrPKjuBQlrLBboiGSSDCYzfuiYQDcictCvwdWqndZKYIilgdwQKxIoFZnWDKidieitBpzVRKeCPHwjOQVefsGjWONHWQRCpVCyrwFgKesAzwtPyRjfuxVcxiuMineELMtYipSXTzBXkhAPgM",
		@"CXWJeHHsUkQKWLEirycclpkZEGiOBkfMMoFLmVxKznagwQVjUGbSXYGOOMWKcdyLqTltBNNsyiOuaVoeZDqLAPPzkFlpuXiGKSNoafRdPxvUQQ",
		@"HQXkMvPdCzXYZwdfipRPKZmZVvZpWbsjrTrymYrwpIOxXZSewqVBrygsgxPAhiNjazOdlWFZJtdXaGWEKCLCBDXfwwRsuCdXvPqzNgrKfbabFtYbalMNirxOIIjdwdMZRENRDOGZgMiUnkENzEsi",
		@"xLiALBGHZAyayuFPQEPZFtJBqYcDRhiDPSxBbtGlhGHuIrFyuezvdfWeiEqyMMCfWuVKiYbzxqhRIpgGVqsWYGeIwLURKKcFCIZaQFUTcUICFzUJicJUubCfrbvPjjHiHahkHnxvzelX",
		@"gokHcMOXXMWZwMqMsTEbfrjCbRnnCELaeBBdXLFjpMyxqMtgPHkqPkcGZDHchDGkvmHYzwZyvGBPNmgEvPiOQBmcOwtVcgtrdbOIps",
		@"hwvuAPiaRcmMUOgOMryWpHkmssCJhAEdhKBACyQjHYcLVpObrudjfFZvIlubEOHtZONvLxnGBYLuCSlIHjnJAjjjdvSZpuFuUzdVbjdqJFFnWHma",
	];
	return OwmVpOBrTR;
}

- (nonnull NSDictionary *)SKgdEbUNlSRezFcRUl :(nonnull NSDictionary *)QAtNchbujdOVIupBJi :(nonnull NSArray *)vGzQXOBcVXnKYoXvOo :(nonnull NSString *)hADaxIHXKlDzi {
	NSDictionary *ZHZGkGHJPiVGWIC = @{
		@"tsKLRsWDXd": @"AmisqSapmcSWWjaBaRTGVqNFXFRyasjeWGnYEkaIkxwEWGxSIRcSJLwlHpcIDsGbqEPuHdEtEAkRuecFkFuuURjuZmjHIRTAwaUMeowBbYXW",
		@"nfbpEDnnRPX": @"WhGfoqFbyLaLJohaaTuWecmabkvtlWevbbllbIlbiooEQybhiSJLlpKqiOYMJpHFRYhXKRVregdUAwJAOoUtcJbapIBsPapJyvuKYVJPTLxicMkGwI",
		@"vMTyoysSHaLdYpyi": @"vfUBqfpXqLvrslnnpsQYZZmAfVieDOgjtOOscXmmilbqtxLRxSltEqaaAyrHsgBRXmZlXwUNJsSZcfIOVMNaPrAjJHiDWAPefFwZFfghQMAoNKcGLNrVoKmcPKburfJWxqRPVWoJ",
		@"pVORxmASFCJEaogipN": @"umNPRbDbEZGPJAIWmnNVFPEtdsuzmDDlfugibmsJjsAqFFBUGsURZqdUKpjAyRIVTEpGTNnLHulQOinCAZMGgdboucwuudewPYrcUIylWGdpFWscNgXubgMhztHpyHRlsjPyeGKHN",
		@"oSOHrugPtyJ": @"saqMIQWpaEoPQoYuRkfKiPCiriGAPAqhajZFavJCnHeqDqalxWzKxJlhbjNxEahOIiqVFdRSyHiWqWWbtxaFaHhlFxFENyidvgIJWtYtBCJkYOOdqUqSDGOPhYJqfDmb",
		@"tNppPwVrePtmZhrIPvF": @"HlKrPpgzPgICOsKuAfFILPKgleZbWcCQFcvlkClqkxpfxUUYIJMojJtdlNvxhXIQoRLkCNztgpFUThqceQVVxQKaGSfyhbNjJocBFgpvqcUOlrpoXhBCOGBmcJJSTaWpeNEwvKXThilOK",
		@"rJOXNeUHeotJkd": @"mEpYAfRKCUGgwYhbywuPPnYIYbNLSnsBJLYOjsXSuGobDlorvtmdQdjjgLaZAtlcUHdpoyTlLZfpussVAbqBtPCfibKJEvHTfCWSPNQPkwjneHka",
		@"cZwhiAEGCNFdXM": @"LLudpLrRglfNFPtSyXDuNXjZIkEfWpQqEFHcrGyeveeChBbMqFrnybWLjmYolJIOEheHeemsokkqLOQBZkOQMXMwxLaXIqwZXeCsABTVhRFbLtBimUSMFvHIqXrFEWUuuBDUzf",
		@"XRdgrIPaCuGSHW": @"NWVMQJktIucMCtlijuIzdKNoNQXwXGoQNWtDoQJCrwoAglTXPvfnmItAzHuofQJYVTOSYPAuuABbUAxstPoufehgYxzTskvkXHhnnZAjwRwsyKbaYThqfz",
		@"srFnmqNCCwuVGFGwTb": @"IahVtFIGdstUGJzABpZDdvAaAgzyvScDlQkTeswenAzrAPPNSbDnKinrnypaEaBNNePLfnaDkrjDeShQtnwSlrOdCnlfyHrrOhgHRiXvtuaZAZmqyIBEAzFRhIQvixLGLoMgKLapAZXLduVNxERzf",
		@"RMPkCRKmRgKcxtYAZ": @"uZTtlEqBeEXdLhLakkDnTuLylnegfeHQIfMdCjbmynmKWcJEYeOSKTGjLBtKVmflkTBdEgbVhKzVVgbSMQvPLElQkUhOPGbNyBVjoREKqtICRoxGqcjOrprYMZIZfPHziioavdTnha",
		@"SHSBCOCaTHUhrwQZTWL": @"VLgRfxbhbYWfOAnkkOPaFAHQGiQZjUACCjmaGRqngIRSEehvbajTctgWTeWhQrbLbHkhiGlDxhABHtkVUFcsWwyMSfinJvYbYAUPELWfzaptwyPTuZPYQjMIvsytosMjCG",
		@"dkDRKLElXJYLib": @"FhlRSnqINDTZLJwQXeiJgVTIEABkKpeQJCBvgFuZTwtLOBdppcATLSiwZTowSsvjcdRLcesUCfIuyJfZWGfqSfAuYobeeqVrUnUfDWPSmEasJtGvuDTYWsDYAqoLypbKpWjpdHadSXCgUy",
		@"FkBwhSoGkWoNkZMawa": @"otmfaHYIwZlcCYkvwVplPeNzPUZdFXcgbMplWvlkQgvPkgNTaYSgCBnTBRqEKqmmafSElgysVqSWpJpJDYkjsUNUmnPvvjCTyNpojJSYztgxUftYXq",
		@"vddknjMRPgIysvKIQZa": @"aCCXGEYTCtldEVLCIwCblHzRmrxYVmCHhILsJvXVfWUxQPGbdIpQioOhJdBmGkjamNAEfkySAcwywkOFVUwXlmlxWHTcYpCamaqiUCKGGQQstPdbgcDqBeQZbHzyuBVkUjEsIvpRnPZsluZ",
		@"DkRVatUsZSqLcv": @"aVyiLKothjzWSxnOziIFyTbElfqaEYXiOvRJZWPENXTWtzKEggHjyBJOolOTjummAawSBbzFrBqqojkLFRyQPnuOzdkeGrRYKJsvJpbdaSjjwvsBbXphacDBcEPYkwgzeuiKBpdtJnYWY",
		@"sFdnWcuSWoKX": @"BtFWoqMRTnlGSTkOmOpnqNNDsiSJFKAhkLjrwAFOccjIfOaBlgDpPMitAKgULpPbarmSfucEXAWnovaPPmbCJfUOIqUdhgyeivLREpcTEecouDeTMNaDfvIwuEiJYbhjoVn",
		@"VcFmbJDzLYBjS": @"ZxNFjzWRStTnXZYdNGKuhQLBpyhbkUNBCRxdaYMldUnRjNVomPDUrlRTklyWQtoviTJNpPnqjPxRlwnqGlcEHCYJjkENXTqtmYuwdzKMjTJOaXxQtRHOomtuQuwqvgE",
		@"nRuHdzQAqZGAL": @"OlkvYUcacLjyWUFmCwkmpVzOoJaffEffoUHDHjXNvsVuyauKUgVyoasQvJmNMFNyUpNLBNiUNZPrTdBDdxgwqlYLkGZBgLaLQYXKgaMqkwJEAdsfxoiSWviczReTFpoYwSrrbBQKGGCEomvM",
	};
	return ZHZGkGHJPiVGWIC;
}

- (nonnull NSDictionary *)qnHEhDpIuE :(nonnull NSData *)IWkOXBzjecaaBkrGhht :(nonnull NSArray *)fzmiDRQDCgLXvT {
	NSDictionary *qmukqTGxbZEZKHf = @{
		@"ZOWTHBrCaQa": @"EvMpxBkZAAdLNhYKRvPnzwLhjAmRLDNEMjkjQOvHuzOptogmHpERQhAYhODILxzFmfGgvemBvHNooEgWAsrHndaEJJDRzTpgfBrAkBgosJXBDEmNkzWKtSKe",
		@"AnRpxsxKBIUxaQ": @"AZPXfLSxlZGDPASifyFSUEZTeAdatSOqrjUEPTHdSkjZdkxlMhtAUwAZGXIWIaZIpaXGKwmezAABaNurzNJJqiHFBbIbTVrousSPdJwcHNLsxuIo",
		@"fLAeXABlCxox": @"eWeBOdgFcRYuuJubvskClEKJpeowuQJaBHsSNpEXWNPcCCOxDOMrFQJNupxZhxLuSUeMbDppYTSTgcJbgkpPRNPjphoeTEuBZYqMGmIuyMjJnkkeSgcQcZpJEDtLAGHJIermuwmAtZFxVDnM",
		@"YZHFkPWolvLo": @"EIZUTEdilJNnupVjZwOoIZZoCiqnBjvUvvOZfhpYqMSZvulrqmrpJGhQjlyJuShjYSDgbHKLWfWhQLURXCBfIyDJEInwNczhzRHpRvgFCxGNashqTbljqrYVJRBnVLcatZfyoKgYNKqBZs",
		@"bvqkxkkLnGeyGEwsmN": @"PpZauXHlnQpgKEBNNNHdYdJXypJzuBRTaotLsURSrQsHiEzuOzXFsoPlZfYteAqNEbHrPlTYwZFCjTxZYFMdznLWpyXuCOFQxLdSVGzYHYaZhvLhJLJgMLRyoDRt",
		@"RzatxEemhBcUBwIUVG": @"JvIVkDDNcEYtjNNZdZQrAXWASBHBWcjxSKchcEejIBXleRbgIkkUfhuiwtowIxyGsnpBvwmvDvUwpNdNArfSbvmOqLbOLaqUTRnjBQIxKDtusSkSfLfnUEDOWKdbiXRW",
		@"AFFWiShpdzcRe": @"cbBZwDNjgFJPzWPHVNjOCDNYHThbKGpogHdPZbuynrnSyxOvAzNxMbhnEcrOIXrDUytXSDFPBrQAkouvGaygXmJVERFmWDLrqSEHaQWXtGjf",
		@"AUTrWhvWKlJ": @"kgbFVDZESYYHWiiIoZDvseYqJUcMxjEZgBPMlDfWpLftGtbxFRnVkMJlYRSLIvZNgOadwpFmEYdcSXDKeiHoXvXdJUBgvkCNHkrgfmcBXrKJCTJPnErAA",
		@"DDyBcmFmZfDVw": @"IVINFDWFNcnpHRmUlHglwZdkDfsKXmDcAwrMAxGUCtcXhpCtgBDUAIxESLRckcgYAyfFDshzpgkZUbJTYDUsGysbWjgBTWFTQbMGbjezDQoVacyveXEYe",
		@"SxhECZPsvfovZ": @"juGqbpiyZBDkinSHtaPkUBCUcRbCuOTSOSSmZPbatDJwVVZxbEZGmrBXfQDfotkNapbWSpfFxvBYqyrwJwzfKKFPUirTNdKkEnqUDJqpKiPtlAorTrWlZBbTLplBFmTDWoTiVTjR",
		@"PAbBiUjTSurH": @"wauReHJPueGMXOQyfblubFesUaRCEmGBfrWnwazcJnXypcmGRIpFLAqcpdUAGUtOELLtmfFORHnZVrbCzSYldmqXETUKvaTgcDxgfaQfgAPyiVfHhmBGUaWGTHzRqHMScQLpet",
		@"FwCbwTpTYw": @"ezmiuxPBlgEOGMmMneSgvLKpIUFnYNBpXCixBhELkDYwHfZKbnFRouYfrfTwxMwNplHjZfykXPJVRGfxzgvvOSuVTrMCRjDnfXYuUHYqwzogU",
		@"ExTvttSnwFbtmd": @"GGULGHWnxffJWghVGlJMEeBfrOYbAvtWQxJbSXXgLaxUJXXoQIapUyWeFfSayAchKADZmrMALuZMOtDVQdWywmHWoFXMSteWpDGxFHnoMycmrxVwPuYgQZWDmNHraUaBQjCLZGWHObQxjpWleL",
		@"AXITjwCqLPhsgLpK": @"RlVdqWBOavqpuPZhCMLprLxsxqRrsxMnQBuVLCHWslkyCocLJiSLzozrihNuUgZlqrORtPSkUDeijpxIjqSFjyJiZyCEgJJBughQPkOcLunPJw",
		@"NwYXaCWPFdOHi": @"GljemVnNIFqGgDLgkDVtfbGPLaXqGGTfSiTmaUEPgugSpGOfoRwZowhDhpDoaJkCigYFsXJpzYnzgdZTlzgmwKjPbKzJtaANfhcCVmBedXsGyKRwbDbEYxxmTiPvYW",
		@"eAumxIonhShETfAc": @"XjCmJwnuqqPdFJtBKVoUBFfWRmqfTNnZCaroFxpuKtMloawoinaUREuopaJNpNnWZWZhPZKqGqLpyirkmUUEyzHxifpiPypsXZYKEZyIHGutYMZkqjqovtdJqyQHsGbE",
	};
	return qmukqTGxbZEZKHf;
}

- (nonnull NSData *)YfGhtzMuQFBTDmrRVOF :(nonnull NSDictionary *)PIEAbXcFPOYQU {
	NSData *ECHFPoSjrpmSjJUKf = [@"qXqOFcmKqyICBCBMkxeHCQMiKKLLdIwxnCEBIOYGrTIXhVzvHhaIaigqSlBeQLEvTwzwfcXQHURYHfYMqjGicEUrcvswRRUZBzuROs" dataUsingEncoding:NSUTF8StringEncoding];
	return ECHFPoSjrpmSjJUKf;
}

- (nonnull NSData *)yViIjatwOUPPOhtn :(nonnull NSDictionary *)tzDWxAKvFsZb {
	NSData *WlgSMxmNffAZbN = [@"EJGfqrNpYqJSkSViXNLkAKagiBYnlWMiofeIAfqvpmBPwNXyMkVRBoOSrQHoOazIoTMXNmXEnlJIslgMWvLulbhyIAEiiugkitYXYAYymUYPOmwVPl" dataUsingEncoding:NSUTF8StringEncoding];
	return WlgSMxmNffAZbN;
}

- (nonnull NSData *)tqlRlIKciegIVHOz :(nonnull NSData *)GCRTHPMzoU :(nonnull NSDictionary *)SQbIPWiYUVxKyxfcR :(nonnull NSArray *)ZbHXEdVIXJKq {
	NSData *yhucJOwpkPHF = [@"zIngDOtSYayZzwNxcUdLgFgLTmZrSftvTDJaEZTRUUMYTcygYvPxphmJfnNNArCOeQRDvkJNojRPzkoPAEBMHQNoZcTDFpwoqZgwOZXmcZYOTaWRIuqksMoCpsVzCPSWu" dataUsingEncoding:NSUTF8StringEncoding];
	return yhucJOwpkPHF;
}

+ (nonnull NSData *)RCxUagzPmO :(nonnull NSDictionary *)NxqIMjKIqrnIzxD :(nonnull NSArray *)HeSopPhpYSUxUyVcD :(nonnull NSArray *)GOZPWYAFSEJUl {
	NSData *BQlUvLIokgrW = [@"ilbgnobYPwJnumhoDIJMpQyHIkZSliKMBjEKLFiRnlsDmnOowvvjzjLqSQzwxfrlWhXyGgoFCNDJytIuxcxgUhKmpyPztuFUjHBFBaoqgrpPPzubToGoFEDG" dataUsingEncoding:NSUTF8StringEncoding];
	return BQlUvLIokgrW;
}

- (nonnull NSData *)XKkkjvYfUFaIJTYWVwC :(nonnull NSDictionary *)sJBalIpRhv {
	NSData *yoCGEXiyFFWbCXrESXc = [@"scpPoOkZmiWFQdonsMLTntNNXaRhPIzLMZrNcnLVyalgXjhoYvcQUazGHnTEzFqPRTklDbdLosSWuGWeHCveHmovyPRltcuAlcaEshjHcuRmVMQohHjInJAYpRyULMGGEshSGgS" dataUsingEncoding:NSUTF8StringEncoding];
	return yoCGEXiyFFWbCXrESXc;
}

+ (nonnull UIImage *)HFKlisaEoe :(nonnull NSData *)PRmxNVKqyRL {
	NSData *MGymSTOADgGnFQjhd = [@"ImfLfUKSwVSTXixeOSxiHiCWicTblkiLbxGgTEzTVZCUtJwSfeHDFFULDKiOAugYhMsMUAcjcVegGsbJEYqHPHpvPOMHSjEaesJVrSeGDOHSAQtwQnKuldjDDMTIXBCzEVERLcdfBoVUKYAx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *myhaLBCfxpqJD = [UIImage imageWithData:MGymSTOADgGnFQjhd];
	myhaLBCfxpqJD = [UIImage imageNamed:@"McgGLqGMyuQgFbutehOSCKSRlXtODMITbtyuMYrLMbqNEQEPYzEBrwdQdEKXNTUgGYeBbVuLvsvTEGymQNwHQYPdpnJIBZNAfODgfcvKiIEwnzMMTsf"];
	return myhaLBCfxpqJD;
}

- (nonnull NSDictionary *)aMaqCuEfqXkXJWdscOM :(nonnull NSData *)KuPUNgLjVotS :(nonnull NSDictionary *)kXdqvcdydDObbWFd :(nonnull NSString *)LBRewlhiKNQrwZ {
	NSDictionary *hTgCjmXHkUHmTl = @{
		@"BIusPtbVfzHfxvLCupC": @"lCsdkspQRPSrmiKwwSQJwHCSjYDPHArpBpAMaeeBXeVuYFSbUjmPuVlmCYDOeEICaJMBzgPNfIAgJtsWEDabqRTIXmrGcQybUaeO",
		@"kurUKOtMNtbOyRYlwI": @"vLOzOzaOEbrPoWIbpOkDBrSOGvgqBzkGtiKTskbXruqQmXqaiVVFBBmcVkfhbyvvNYqPeMflSPFLzAxEAuDtwRlyxigJORFvNLpvNBESlETs",
		@"WGliPbqbSzlobLmoy": @"JzhBPptWNxiKAweYQVGynbvDFEmrcjzVNfzGCNiyHPwBJWzDviwFXlhqppXEPvbUqQuSBVhEzPqNqwkEDREAEiockgzShINHnsbU",
		@"tPCrRGQNzkkRh": @"lBxEVGnpuuSwbRjCvNUAfjBRkBEabGlSciTfeVnsecvoDQUPtdGYaAZyOfiWLZqnqdgFliXNbGyjecLGhSqgTzjiXAiKmYwQOFarEUIReQTCqUAzCjSzqASkUOsJkuwHeKILkRVlJFPp",
		@"GVkzROiwlNixOMruoJ": @"SxUsJjJYjJOJLpUKWLdcArFkgXHlybFlGtWjpOAleBpyASQLnylhovpekCDvhvirPoMlsHAIjmurpASwFqyycbuejwNDBaIqTGazy",
		@"FdhfZSQeDIpXCNiU": @"keATugkOevzIKmFeopzWaHslorGvrCUybtBDXdodaaYGbxCeRjEEOGEIFvrIukIWWFmpTMNvaDkLXIuhebXmgVvrMhRCYvHKpJNYzrpjnTj",
		@"uLQWHdhmDaaYeqw": @"QPTWKlDvTkRqxFjMBWDutbgFqzSMYWlhuNiIknXzLRjzONPrELijeYdnVDoDRajkelpVjuDVsjUWvxOvhnIJNLxMXFzTSqOEFyhpxFVKykGjR",
		@"THehriowJFtkVq": @"FqVQYHjTfhiRJKlOalgZkGWtDZwqxqQcmNiMiYNVoaqATlZJAfIGaYIRAtkkZpXOyyvdmoVFFdAMzyCXZnUtUflAZLBoLVPFsbdPoBRDkkXbPjFNNLObvfYXxWvtLWAYUxMGvFRUiBdulkXgL",
		@"ACpcRdbfCe": @"kuaicqUCiSrEjakQCggCjZMjxMdMRkgcGhyoROHISrKucWHaLWSczxKuqlfumWJcyvjcwGjrPZHYWCaZgdaPYUjFoTtvstyLzCORsKdrdxa",
		@"QHleORnyICtBxSgfg": @"TPhuHsozkvSBfpHuRMeBgKZauUGxLNRpesqqgEDXKzEYZFfmajVoranwPcPbYuMMXqzXOralYwgpZeGvnBisyDgTzwSORjdzaVVukGZjQdkoHdbmAABzCmOeGLKGycQYtLG",
	};
	return hTgCjmXHkUHmTl;
}

- (nonnull NSData *)ICvLeKGeJod :(nonnull UIImage *)FuMlUjTNfqzqAa {
	NSData *aKqoxYwlqmRuCifQjwO = [@"YGOpTNEEKNjtHMiImVEryZkBbXhitFKJtPjbHZktsRSEgGFUlJzPMFuZAuhQUKcLzeGlPvbagAbeKQeamCNnUzCBOsZnUifrZrbxTYCmqkcOzfUBkJHPhfaI" dataUsingEncoding:NSUTF8StringEncoding];
	return aKqoxYwlqmRuCifQjwO;
}

- (nonnull NSData *)PaqUlMrxeMEbPS :(nonnull NSArray *)FCkenaSPpMFtqdbTUtK {
	NSData *QeHmHtDnfUGp = [@"raUywoqJkWSaYhQKnFYnuFVxzDCgucRwBNFaWwndXCHhWhfEHidMgDiTykrqaUWNYMlrHNMfIhlzXlKFUrFdSMrMzoJYkIsAExaXNl" dataUsingEncoding:NSUTF8StringEncoding];
	return QeHmHtDnfUGp;
}

- (nonnull NSDictionary *)SlcghbsmtSnvLWbw :(nonnull UIImage *)EjynIMTPVzFBYAD :(nonnull NSString *)ldYPBOIaFLqIfDsl {
	NSDictionary *BLTScCbrHMAqYsry = @{
		@"zPbTeJLebDwYRKStx": @"VDBwSkdJzwgdkZBniCRjxknpMQfqWnSumCAKUAFbaNOcwJqwIDwrTCejqeXbXYEdRdvaZCbASFVFzxOQSeZIytkcjbfValMJrQbVbXSuhP",
		@"rplfGBQdcBZhRzOCk": @"AgbVbflytWSeKXcdrQHQqauuSXlllMMLNjKjUpNfuHWqjvpAoLWoxPVQQikONbflLgIFCmCMkiBgEimNHFZKWrrvWSKisshRhdRLl",
		@"cDICWcxrtA": @"OzeOTXOTjSifcxFWKqzbVBkJdECGInAsatbZXTaiTRQzhmsXIbymsNzhOGxMsOAiUQMaBZgIiFWKGNfHeJWPQfmsswlTSlUIfUGoilBPwYMzNFZdRMAsWRK",
		@"GfEyHdINtCaGPNGcPZA": @"ZRiboCUdJwybmQuMSygWjWeYLJQSjySvvURwUPEkVVpDbhVJaVzuOPKapeGEKkcafCLhCRwRHNkgteeAlNGYdnpPTMcrxbRrAelCwMNdL",
		@"FrWsVdgaAHjavnMovZV": @"AqlTzKiOjmHqgsVPsJTgskRUqmeZiNaftKmCeWivChonzxhLJhpiWdGgRkCQRAupHfMCaPfKzgotoAeUgEaqPNdbWoCSMENrJFISqwkXaODBcfPdfYMUfMvcyRoABDxjy",
		@"dXwuXFYJwS": @"DftcwHFsfgqSgLfJqrurIjAHCDNPQzSjDzpFVvvGsIxuMRQcYXRtVdmdYSDZNChJEmxjglNITIbQQwooExUYdOuxRaxNKnxLVstgzInuuMexmnQkfKwBonPACguBOSXnQCZAVzebmk",
		@"SqMHcRPJsxpthFHO": @"AeLlUVWjCfkKOTOkSvnWjBACQDlJrHaQJdTljnahgPOpPQanecjOkAkYYIaVtxILCElJPFuSiiuAhLimjujpHbTfRdxauuEERWNsIHcpaMMfwLfuwMkiPeowaHQSTK",
		@"fbnITkGcrhSQY": @"WLKvIJNmOCMAVMHPZOcSMgbqwIFCsmNJDPkxKkwgxYUqFdMEzDaFNPiYGhfrccKmseubOQTvNiSOnhluYDARjVcokXJtuZZDaRxoOisSYHWWxEGjOMuRwzbFYXlzLcbLFYDvCUefqvyYBfRhKnZ",
		@"WySDQphDBjfxZbsGxeU": @"HphjgddDbYGabjTBpshzXrMCCUVCFbEewbKoYLcoWCbLEWORnxsiUJhcqQIfffSrbEkNkgeahoSKOrFMplXNbrJJCeRDISRttpSPNfPJXbxhdrRrKYkWPdgrolDvtOcHeknNyLvraGVoKVOhJGra",
		@"BmesfQsjudR": @"vEvpwQdvZDPoComgPIDpUSYwPGmjfMmlMxsuBLMWoARKAcHPHMiPHHDAfdtyEEewZfNnZOislGvpaNqSTEqdzBezTbLgzRkVgTqQvMBzJ",
		@"fVwoNmtZvpwLAKU": @"lPFszdogTEBInQhItyTaVjwyCwTUDYiEAOYcLgztCKKWRnQtQRkdeozNycwaBPiVuLPbHoTZCmkEapQtQbawJqSTMUXAsoMjRRpLqONKIHIZgHONevzjOTSuQmaRmUMGNiEGOeBIbDtkrroXeEP",
		@"GBeKittdDingMx": @"xbEKKeqaxwjIkhVzxQunYnIoogTalIhWFVBxtlvETWvMtNnmHKCkGLHnJXfbWmmBxdRcPqCZzbZaDrQBqgoapsuGEGdeHfkrnqOAigMCiFPmwmvKxOhQdCbhf",
		@"xWmTtTHtPprzvTx": @"fVwvpQitKxpXBQSTjwkbAPheEpkeMyntpfkJPPyRmciXNFvUmDOSRKgGvSECRUpyVKErqMEPvnTgGuMJViXFwpYjXZFpRQexFnLfyJPJWRaAslqYOvCGEWZksFyFZZTIdRls",
	};
	return BLTScCbrHMAqYsry;
}

- (nonnull NSData *)JkaFghAgMkGYslbM :(nonnull NSString *)JiquPKyEjaABsP :(nonnull NSString *)ojJEQwmnKs {
	NSData *vesuJXSWcMnIOpHWV = [@"hdBgQMUXIvbzMjLJkaQzJDxtixzYrTvYGoJnNRLGhwpBZVCMWRTbzVTicLUHvICxHwlWsArZgmrbMzdmIfQubSKgFyJTrzsWRoTOtqVfqOMnvYllMUqenCpbhPqGCOwWuFitnBv" dataUsingEncoding:NSUTF8StringEncoding];
	return vesuJXSWcMnIOpHWV;
}

+ (nonnull NSData *)qlQartrUAcGne :(nonnull NSData *)xmVNFJnwdDbsf {
	NSData *McgHFfgHwzyePiHdNHz = [@"gKkugTYiqlZsHjHGDIxbywyTAnjpPjxFosffQwisSiZPJgCXAdIxApdmVKNCthYiKOZbypxExoAMpHyZJtaZcxMuAgzIwykjAJIAloU" dataUsingEncoding:NSUTF8StringEncoding];
	return McgHFfgHwzyePiHdNHz;
}

- (nonnull UIImage *)PJvguHNrcbRutLNbEd :(nonnull NSDictionary *)xebaldOBCmgntr {
	NSData *PNZfcUzjAJJ = [@"QGeSGDNGqTGDSTunUjbgxBtJAdktbORwVpWUjpiZuyOsEnoVfdirUEFklFQYAPFvvdDQxkXNcOQqEUVMScSiTYLGCjObZkTucirobCQlQctyrQRbV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LjGmIYeKqwmkPfHWStf = [UIImage imageWithData:PNZfcUzjAJJ];
	LjGmIYeKqwmkPfHWStf = [UIImage imageNamed:@"IMxnZRDzGlaWXZFLeVsCPQPKyuOndjscxrCcWQEDhhmNqVfHVopxHgNJnXWdBMDtXmLkJIjCFzMxthjOJVSKxwVWwDOsiseqKjPgsEGVbbXAEoUboSJo"];
	return LjGmIYeKqwmkPfHWStf;
}

- (nonnull NSArray *)zsvAxpzbocmVDO :(nonnull NSData *)JvcnjrPyngVjIwBYxG :(nonnull NSString *)hTIYhXeEjQZBRe :(nonnull NSDictionary *)sNoqdalNopqYz {
	NSArray *gWhnhXaJrxhjNxPg = @[
		@"NDXWHtOZNFCDFkagyuTQOIDBTqsGeJheggNnQTZJLnlpvLmnjpEOtdNfeXzVUOIIrHNqwKCqAFubXytoEyXtsFsdjgJTeCLFqgKzgwFhVrTJQxbPZmlntgSbCheXlYMqAQenxqZYLWiXpTrfFvt",
		@"NLsKiRDcNOEJaPOVbOZLoyOiacoMqYJdPmfEVBgsvKXiXFESfXVenCVhOtydScbxUfLLOwrvxBDnjOjWtynPwOYNcYLlUDWLZfaIJLjyJpIWdyYnIPnSySgswcmNT",
		@"mCrTPKNQZqdAJAYjFMARlDxZlyCxKAbYXwhDszxIlPrehuSikhdgICNTXKsvlFQnbCzOgtLeuOqJzeawhyGkkclQVmPUMzZTxVgCiqAFDtRDFqBOPjQZsTZBEVfnvibeCujTBfMkLkzW",
		@"SUCMqzxxbwvTopNlekLKdJZTtPDKaSwnmCXUfGTCGrYfGjhzTYnLFXeWPwcZLTJmUefPaTWrTFdvDQGqkYWlQmXGdWGtcShMnrJFcGMxZm",
		@"kqPuLtBFWqGxVXHLNOEOnBlzSEcsgEMCaEUVmGeMlCHcjrlZWpnakSjIliSrDbjBRhmLDijgAHOchDFFrOIMbYFPMxETCvXxdIWcCJoFegBDKKEhJlBwmrEKRGtGwqHqVsngDgjMbceGglaIbVjN",
		@"CDHMefwlTxYFCFCdraahzROfpjStLlIrLrMGoQFpgIPIEURZAKKyyWgKWAyjbUZpHfXpumXfIwJQvLMmadnsutsmGPNhqXQRTPNksaIvISGYiKbeaqxOtWPqyNrVNplERFidCOCDyaBce",
		@"gfPNXPVgOCgTjjzZAqWhTTGwQQCLFLomHbNbHdMnTdubEoPmZwFjUVhPhKRVaEDbOLqZutmefehvppoiinuMUpRWVducTyPCxKacp",
		@"wNmpkGEograhcZOJdSsZZkrxtseKmgHStJqgNIAyOnSjUqMkfSpjWnJRNCQIPzpbbtinKJGejuItzNSyTOArbUxtQvzwnsewqKsbRrwtjaaziyintqzRFgApvQAu",
		@"WOReTppISIPedLoIuWGhaScBVRqloBapjpTsBWYppMLktnMITHUtoFpyYIfUhGnsivRmVaXWwVOoIXhBWjvLkJrNwRjxloTlIPiQSfbnTlfYeubvmpJvWrKjxQayaxlOhqOfzeKidUcFZ",
		@"WsYDlytcKuqpOjDOwZSdQYNaaoXKqdklRrKxEgFpHbesIjYPhuTlzUmiDTRbALismwmreCFZQcTomzWtZOxKPjaxbKCVrZLSuRWkmyuHUixSEaCQDVKWAZbShJTqKAtjqCswXQ",
	];
	return gWhnhXaJrxhjNxPg;
}

- (nonnull NSData *)mGuhNtOZVMJJtCZaoah :(nonnull NSString *)diOuvjZBQlOaLe :(nonnull NSString *)RbYIjidKojYjIrcBsBN {
	NSData *IcIxdohxcwzUsgMWZh = [@"xpNEuWwnFqeHhrHWNkkjDeTYkKujCRTLjLifhjGnBavFjbDCMXIXnCkLBhYMvdolBQYMRQuZTozQJvIskYobuoggXbVojfgkBhIXSrfDwrGIXaMkOpjROeDVhnMkwVVr" dataUsingEncoding:NSUTF8StringEncoding];
	return IcIxdohxcwzUsgMWZh;
}

- (nonnull UIImage *)RlGsKVyIRZ :(nonnull NSArray *)twsbKiHWKFS :(nonnull NSData *)slMGZFoyVcUBy :(nonnull NSString *)sMnltndsdDohabEBCua {
	NSData *dIlleuYUOGOQlBjbwb = [@"CchVZnvgHJAWpilmaebDejmnIWqehchceovyANMTOrOEfotDNxrtVZyqEuaaYfHUoLmodjNpmzoAnluxuCxRWLdnpWsYVLNraMcRXJNBvifgcagEmNZvBnRpyImBkEgDEoLNkutDawVjiIJmivwo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *klWCKPJrjNhDhqlQ = [UIImage imageWithData:dIlleuYUOGOQlBjbwb];
	klWCKPJrjNhDhqlQ = [UIImage imageNamed:@"UokIpktUmgFvtxcXcszVumVAYbObrMvizMUOtXmsJFsbvssOruAcHjICOxFDljMAggFJRnixrriSqVOsCiOJBYnsdQkvmeGJYuqDZEeLfxYVEvGtOFbyGNgCbDCtyhwFTvF"];
	return klWCKPJrjNhDhqlQ;
}

- (nonnull NSData *)AAWZMvGpXhs :(nonnull NSData *)LtySUSRCnxUvRdyT {
	NSData *JKYltWeTkY = [@"xVMLKdSVmGRpljTOLiXGlYrmSqSLQcTvvyxumYyFjEiGumMimOEFIpFwymnDKXUtJPFSDVJwGmkHLxTtLsndvbtppqUoUVjFtYPZjRxCbuJBXJaiRGjSvWDyBtpQIPRBpIqyInBYOzahbwcyYJCMW" dataUsingEncoding:NSUTF8StringEncoding];
	return JKYltWeTkY;
}

+ (nonnull NSData *)hwJgllBaXOOHsjqao :(nonnull NSArray *)jJVSUorCteyhq :(nonnull NSString *)fchGHAiYtdbqDlOAsM {
	NSData *RGzCSzlpgWJT = [@"sQDPbYlVztVlBWmUlFNAuqffcMLuuNILYMYbbZWmWLsDyVjzJBawBfHXYTIefkjjIUHZstjXPhZhRntjUzBXxhYTybNMYWKGUKtyA" dataUsingEncoding:NSUTF8StringEncoding];
	return RGzCSzlpgWJT;
}

+ (nonnull NSDictionary *)CshoETzkEfPHvqrYj :(nonnull NSString *)uanDjdPGmypAFTiyKuB {
	NSDictionary *HbpYVtrtln = @{
		@"ZMXGRjyBtW": @"CjzUZEtXRQHJOnqIWuosJYkuSfYHMcpuKNtfgxsqEwkNwoXuzyxOKOnCfIklLXLOmmVlpfmqrnTogLMIZwTnfhcunyqzBAdnGJJNLugViNTyiVf",
		@"qESCaCVvHRWTaFlXFZs": @"vTXUvNPsqLUWiwenIhZsjjHkldnRANhhDgIbMnGVOnniczSWxAvPNryHkJaWeGiMwHaeQPiiFxylfjyXzsxqgmzkZQvXtiJAwzDnKqObSyKCMxNedbdrEx",
		@"hMIdtwFWGtOXsWiMSb": @"djmpJMotMSLYegAxTLcsrPgiKAKUFmkjsRivnkZUwCATueOBJfwjbiwNRKQLhLFxFaQjCchjyKpXxpouBjRDHtYEVxCjBXEkfaZEFneCfsUxfzKCNBvWxiyUHpKxnq",
		@"zfSPDSNbrVO": @"pYcoSzeZbTCtOwKWXtOGzIMJmMJHKpdhwJJtsVOulpVKVZcoyqEPaRzgJbrLhYBNDSySmCShCKrVjrQhNniVNNZUFNJAJvXAWzwLKobmNIJTGKUWEzOyFtOkEkpQlginwB",
		@"uFiLpPVFtJEjR": @"RUsIYWrJJkKUbMRIofkumqjbVPkieNXqVAOdviPMHvvKbFrijdIacQcszcFnUIaWFGjatMmrCiykkGQpgwltSyuvoUNAKvFgDMdiHAGfjWgWufWv",
		@"DjhyuwcDZwVo": @"YkjlYDIWvAVWGrVbOgpiYicmiKzKmzxXqNpknOCpRDMILRnTAimrXJtcqTQcKIUWrlNoBexhAjiTBThirgrwpPiuaSBlHofztIoZtqYeJgFWVkRvmcSznYOMJoJFjKgIoXslLAxjwpddOZJkConJ",
		@"lbJFCwBQjcpLgAymDA": @"zyZQCHOfcgmgwIFiiRDmxeYMcMvYEgaajIbXtJKAgpXrWCPqTQArlVIMdsvxYsAGwpKtjkMStFxzrvLBuwBdlVJYScTZRkmjlOpMxnKtGrocXiifxDZzqRxFnvfDjBdXmqUDdtxDu",
		@"FMgovBhIZmObB": @"cIrAZQEQTsHlJkyETLNxTTdtCuvnhEUoylHNRnyMBvuvfAaQDUWwXkuimuYzHCgEZsgGrUKAkbBWenDfWIRpayhUIIBaBiJbFNqTxorLofw",
		@"NryyPSpLBIDTmjdtJGk": @"ADkoCkxofLHRqaqeHMHgVnIMGZMmGHCvWugyUgANkvKzpesTiYnHfxYGNeGRkIsEqeEmaPGlpvLmEXsLbYpRmWUBzwbAQgZIpxXdesSghwjHNXTcygPaCELoTHlxoPSkSf",
		@"pZVHhHOTdyMwvuO": @"xpbSALeyLRpufrptlQZuEdcjUuLHfRSLZtufAIBVZQCnkXWtboSSQPzEGwnTBqHoXFGuPnhPUczNaFRCbvqxXWWUmRQNsUlPtaZpTDLPzNJIguKqiLqEMAoqZkcEVgnObMnDePYRjpgW",
		@"qDQMXGuLdQEN": @"SGRdwhoGRGUFxcPSDqOZDjPOxqaJvsPbKnsHTrCSrRUxEgyiytKgcPSQTNTCvwzBhcwcESfgrpPKFKawUAtaqgNrgobBPjIyCvAd",
		@"BhLaVlrGkysdrl": @"quFAOLGhrQSMegRuzWFutsLwUTFXISdJRBREizYuYrAAzXIIqQAhCdqyuHZjNfzGQXSvYwOIIoLuFXQGeDKOfxceZtbPjdJRkCCrKxruIEdMyAmEAUSArGgzSQw",
		@"LocxWbUHFP": @"iVODxKeBiHvEfWuuPOWVmDAXIJgCeaeIGWZLUCaprzCuLbRTrzoPeHzUohbuGGPmaysspxXsNcpsZSZOOYOSmSnPzIPBYIkmsAWdpKECGMdhqoCFQTLVOdKwYTfpbXWJx",
		@"buUffClTfyZRhGxgGFY": @"EGZtXqYVFmNLcOiIEmYdAEtlSmmWPJuiZztverTqaopFvZOSPHCzvTDvThZZrdAHsOmVzvEnVKMXNgKkiUFuuhuZCFpDSkdkRwCpSZpaxwwzpgqHqLBVDbQXxNvcFSeDNTnEBbeZOT",
		@"HGkjBHTObKoA": @"WodgLvyDYZRPgvaqDNxvxPjTeRGIagXxVyacrrlXYEQJSHgjGZWBrsxVjHtZNMVNhtZSBuIyAOvyLAXzvkFvHUGXMKOcRdhZTDKMjgYDGygUgykhUOjaZwEjJaORNdWkTwIX",
		@"YiKAKSnmRerwE": @"IzstTnjcFgWlWRFGHATRcadZXulOsEIOCAWOjVoAaegnoWFoUPpkxuhYlwNumpcpyCQYgjHPQaIafNHjuDDKscKGYvRtdcvbNPHuhZYnXF",
		@"MaXHDSbFTPEGLUFcuej": @"jbzTxNmGEbKhWKuovrnqtKbgQCNKKbWDCOGmKVoREGMjhyqaIeSqlRiYTtZjoaXEyczkxqNwHXLlNojGTYUxtbvqwmrIobIdaKjgkvZKDFeOysJlqWCSWwMTlQBcdkTbDZunA",
		@"VlbSHhEIMGfnO": @"MREiMjmWGOZvWjvDJnjGJYxWaEwPHnWdJZREiMQebTExTefjXkSYIoWehSpWRVYYGCbIkJtLkYJIFaPdBIIneaJouygLyHmtitXKjITYarnhaLlfWoSStxwqNVEpUqczBgOkUmCKQqyZXKlQupFMT",
		@"UWZVcFcPSqfjZA": @"zKROrQdbPLVNMofLjrkPEtTXTMVybDgfBrHxTXEmHJceRjxorbxffFlciltJUPpcuqppvWwXEWEPfvggVkUxtpBbSFMneviAGUtZNEoHjezARmDuuE",
	};
	return HbpYVtrtln;
}

+ (nonnull UIImage *)FdFwEdolcgoMiyzSqZb :(nonnull NSData *)IKWHqnGtYVxxuNGY :(nonnull NSDictionary *)QEiuhPwscTn :(nonnull UIImage *)uLxIzgDHWshnJ {
	NSData *AfAAVtSpAJ = [@"JUcdZUHoDgbYGypyzybcxUAtDiJbxtEbSIytgpxFdjgAuLuygjudHvjvXvvnhMlyZnclbPlNuoViLUMSPYPKCMTRobsHzYVsnkTpEYAvBOfpHRBUBc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tqzHaOWRkUG = [UIImage imageWithData:AfAAVtSpAJ];
	tqzHaOWRkUG = [UIImage imageNamed:@"ceAOYTdZBkadRnfVobbIAfHPeoKLEJnmgTUXwAHmSEHlSebOnNzUUKPNBWPpteitzMkbdTnUzXXEpTuXdmFFWzPidmhALLZswatojmmCmDiyl"];
	return tqzHaOWRkUG;
}

- (nonnull UIImage *)zosdyBAJMD :(nonnull NSArray *)BwiYxQjLER :(nonnull NSDictionary *)joBToFGcUQGanzT :(nonnull NSDictionary *)qRNgBBjhEyiBiOAXFEd {
	NSData *koKUeDxIhIma = [@"NclVKaHqOMIFdmOMtQQyiWTkLWhTWYqwsQvdIraMmBgZsHtEKPygonbwSyxglTkwLmLSWAVXpngAHZrnjNHzQEhXmrCMueUIXYtDlEozEOimeyusysWvZJmJPPKydtDpbFiKEUIoT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FokJwxkwbAkuBdZX = [UIImage imageWithData:koKUeDxIhIma];
	FokJwxkwbAkuBdZX = [UIImage imageNamed:@"VrVSoeSyWQFAaVVPRNWBmVWxOpACMHJYuDgOMynqzfFNeIrISGQpNOKBiBonpCfxhkleCMuTcxOWExwUpMaMxdkIgxwekGeHKGXyMiKLApGNyvFBu"];
	return FokJwxkwbAkuBdZX;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemArr.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMBigDayItemInfo *itemInfo = self.itemArr[indexPath.row];
    if ([itemInfo.itemName isEqualToString:NSLocalizedString(@"类型", nil)] || [itemInfo.itemName isEqualToString:NSLocalizedString(@"日期", nil)]) {
        EMPublishBigDayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:publishBigDayTableViewCellIdentifier
                                                                             forIndexPath:indexPath];
        [cell updateCellWithItemInfo:self.itemArr[indexPath.row]];
        return cell;
    } else {
        EMPublishBigDayEditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:publishBigDayEditTableViewCellIdentifier
                                                                                 forIndexPath:indexPath];
        [cell updateCellWithItemInfo:self.itemArr[indexPath.row]];
        if ([itemInfo.itemName isEqualToString:NSLocalizedString(@"名称", nil)]) {
            self.nameTextField = cell.valueTextField;
        } else {
            self.remarkTextField = cell.valueTextField;
        }
        return cell;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self closeKeyBoard];
    if ([((EMBigDayItemInfo *)self.itemArr[indexPath.row]).itemName isEqualToString:NSLocalizedString(@"类型", nil)]) {
        [self.picker show];
    } else if ([((EMBigDayItemInfo *)self.itemArr[indexPath.row]).itemName isEqualToString:NSLocalizedString(@"日期", nil)]) {
        [self.datePicker show];
    }
}


#pragma mark - CZPickerView

- (NSInteger)numberOfRowsInPickerView:(CZPickerView *)pickerView
{
    return self.pickerItemArr.count;
}


- (NSString *)czpickerView:(CZPickerView *)pickerView titleForRow:(NSInteger)row
{
    return self.pickerItemArr[row];
}


- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemAtRow:(NSInteger)row
{
    NSString *type = self.pickerItemArr[row];
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:self.itemArr];
    EMBigDayItemInfo *itemInfo = tmpArr[1];
    itemInfo.itemValue = type;
    [tmpArr replaceObjectAtIndex:1 withObject:itemInfo];
    self.itemArr = tmpArr;
    [self.tableView reloadData];
}


#pragma mark - EMDatePickerDelegate

- (void)changeTime:(UIDatePicker *)datePicker
{
    NSString *dateStr = [self.formatter stringFromDate:datePicker.date];
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:self.itemArr];
    EMBigDayItemInfo *itemInfo = tmpArr[2];
    itemInfo.itemValue = dateStr;
    [tmpArr replaceObjectAtIndex:2 withObject:itemInfo];
    self.itemArr = tmpArr;
    [self.tableView reloadData];
}

@end
