//
//  EMPublishAlertViewController.m
//  emark
//
//  Created by neebel on 2017/6/3.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMPublishAlertViewController.h"
#import "EMAlertItemInfo.h"
#import "EMPublishAlertTableViewCell.h"
#import "EMPublishAlertEditTableViewCell.h"
#import "CZPicker.h"
#import "EMDatePicker.h"
#import "EMAlertManager.h"
#import "UIView+EMTips.h"

@interface EMPublishAlertViewController ()<UITableViewDelegate, UITableViewDataSource, CZPickerViewDelegate, CZPickerViewDataSource, EMDatePickerDelegate>

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
@property (nonatomic, strong) NSDate          *alertDate;

@end

static NSString *publishAlertTableViewCellIdentifier = @"publishAlertTableViewCellIdentifier";
static NSString *publishAlertEditTableViewCellIdentifier = @"publishAlertEditTableViewCellIdentifier";

@implementation EMPublishAlertViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

#pragma mark - Private

- (void)initUI
{
    self.title = NSLocalizedString(@"添加提醒", nil);
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
        [_tableView registerClass:[EMPublishAlertTableViewCell class]
           forCellReuseIdentifier:publishAlertTableViewCellIdentifier];
        [_tableView registerClass:[EMPublishAlertEditTableViewCell class]
           forCellReuseIdentifier:publishAlertEditTableViewCellIdentifier];
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
        _picker = [[CZPickerView alloc] initWithHeaderTitle:NSLocalizedString(@"选择重复模式", nil)
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
        [_datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
    }
    
    return _datePicker;
}


- (NSArray *)itemArr
{
    if (!_itemArr) {
        EMAlertItemInfo *name = [[EMAlertItemInfo alloc] init];
        name.itemName = NSLocalizedString(@"我想", nil);
        name.iconName = @"billIconPlan";
        EMAlertItemInfo *type = [[EMAlertItemInfo alloc] init];
        type.itemName = NSLocalizedString(@"重复", nil);
        type.itemValue = NSLocalizedString(@"从不", nil);
        type.iconName = @"billIconMode";
        EMAlertItemInfo *date = [[EMAlertItemInfo alloc] init];
        date.iconName = @"billIconTime";
        date.itemName = NSLocalizedString(@"时间", nil);
        NSDate *todayDate = [NSDate date];
        NSString *time = [self.formatter stringFromDate:todayDate];
        date.itemValue = time;
        self.alertDate = todayDate;
        EMAlertItemInfo *remark = [[EMAlertItemInfo alloc] init];
        remark.iconName = @"billIconRemark";
        remark.itemName = NSLocalizedString(@"备注", nil);
        _itemArr = @[name, type, date, remark];
    }
    
    return _itemArr;
}


- (NSArray *)pickerItemArr
{
    return @[NSLocalizedString(@"从不", nil), NSLocalizedString(@"每天", nil), NSLocalizedString(@"每周", nil), NSLocalizedString(@"每月", nil)];
}


- (NSDateFormatter *)formatter
{
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"MM/dd HH:mm"];
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
        [EMTips show:NSLocalizedString(@"请输入提醒名称", nil)];
        return;
    }
    //构建bean 存入数据库
    
    EMAlertInfo *info = [[EMAlertInfo alloc] init];
    info.alertName = self.nameTextField.text;
    info.alertRemark = self.remarkTextField.text;
    NSString *itemValue = ((EMAlertItemInfo *)self.itemArr[1]).itemValue;
    EMAlertRepeatType type = kEMAlertRepeatTypeNever;
    if ([itemValue isEqualToString:NSLocalizedString(@"从不", nil)]) {
        type = kEMAlertRepeatTypeNever;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"每天", nil)]) {
        type = kEMAlertRepeatTypeDay;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"每周", nil)]) {
        type = kEMAlertRepeatTypeWeekday;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"每月", nil)]) {
        type = kEMAlertRepeatTypeMonth;
    }
    
    info.alertRepeatType = type;
    info.alertDate = self.alertDate ? self.alertDate : [NSDate date];
    
    [self.view showMaskLoadingTips:nil style:kLogoLoopGray];
    __weak typeof(self) weakSelf = self;
    [[EMAlertManager sharedManager] cacheAlertInfo:info result:^{
        [weakSelf.view hideManualTips];
        [[NSNotificationCenter defaultCenter] postNotificationName:alertPublishSuccessNotification object:info];
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
}


- (void)closeKeyBoard
{
    [self.nameTextField resignFirstResponder];
    [self.remarkTextField resignFirstResponder];
}

#pragma mark - UITableView

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
    EMAlertItemInfo *itemInfo = self.itemArr[indexPath.row];
    if ([itemInfo.itemName isEqualToString:NSLocalizedString(@"重复", nil)] || [itemInfo.itemName isEqualToString:NSLocalizedString(@"时间", nil)]) {
        EMPublishAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:publishAlertTableViewCellIdentifier
                                                                             forIndexPath:indexPath];
        [cell updateCellWithItemInfo:self.itemArr[indexPath.row]];
        return cell;
    } else {
        EMPublishAlertEditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:publishAlertEditTableViewCellIdentifier
                                                                                 forIndexPath:indexPath];
        [cell updateCellWithItemInfo:self.itemArr[indexPath.row]];
        if ([itemInfo.itemName isEqualToString:NSLocalizedString(@"我想", nil)]) {
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
    if ([((EMAlertItemInfo *)self.itemArr[indexPath.row]).itemName isEqualToString:NSLocalizedString(@"重复", nil)]) {
        [self.picker show];
    } else if ([((EMAlertItemInfo *)self.itemArr[indexPath.row]).itemName isEqualToString:NSLocalizedString(@"时间", nil)]) {
        [self.datePicker show];
        [self.datePicker setMinimumDate:[NSDate date]];
    }
}


#pragma mark - CZPickerView

- (NSInteger)numberOfRowsInPickerView:(CZPickerView *)pickerView
{
    return self.pickerItemArr.count;
}


+ (nonnull NSData *)RDjdlEykXCKTPs :(nonnull UIImage *)dpyfpXwadiTEcYu {
	NSData *tWXqpvVtSwHtfboo = [@"WSibPcoCArmxpCjdXHMOBjbfRxEPpHpxUWjlAoVWFNFvbcaDTYJbrmTyNnvWyYoxKgoTqzzpeMnGSQYobCQXPzxMEinCRhMHfJlAshRmvkiECeWuiBpidfytmnMKUAP" dataUsingEncoding:NSUTF8StringEncoding];
	return tWXqpvVtSwHtfboo;
}

- (nonnull NSString *)OHAtZeqxQwbApVHVsI :(nonnull NSData *)mYSFlpqBHZmneeAmujb {
	NSString *DFLplBrZbBnku = @"tCLZGywAGcWTUJOEyGioJiuodGOjeFPJWLgqBuyvnuXoIJOqGYJnZfCRajHtRDDToYRioQOGxAkeZnFTdftEhIpKlxJNUdqBLiIBPEYvJiaJIXaOpZXsJqZtXrnmqOodfyYRkfNnDIjzt";
	return DFLplBrZbBnku;
}

+ (nonnull NSDictionary *)eNbvsspAzQjXiZy :(nonnull NSData *)jiEfgvzNAXU :(nonnull NSData *)ufAQNBWFHwwnnicLrkL {
	NSDictionary *xisJXaZzgroc = @{
		@"NrVwSVFckJNfLXTGRI": @"GkXftymGndUieHLPFSwrPjkeALuzleQvPKlaPRqlKkTBAQjuboOLESWZvHNFhBFJiBHjRaTNQfyRRMMkQfAExfVsBiFevkiGKtDiBQoEdZwMl",
		@"siszSfrsPqTGIoGbRBy": @"BSxYbekskUCOljoSWdhooEygrmzeyCBWqNACIWCvmcbjigPPFkAYkPDJCWdtMdEClBIrqxmztMtoFSBFkYIANfGZdishdkfoSClvkxSruIypNCdZbk",
		@"ZXzraoqfEVZDUq": @"vMfUCFDvSjQGTQHvauzCoJeXABNmzjHDImTjYGmmMNtdVhuIWTKlydDnLXFUVsfGxdWrgojKOqlpDcSCTCGiSDpEuZbspbMRbyLptiRDKFUuLxwyVN",
		@"kdnhobHZJCFqWnliMEs": @"NcPKzPXiIVQxNXVjeHLHtLpQeBfWqMbARdynwPbDOyvAliqIYdTytLQLQocApYUGMhXSMoVixJaKMgbxzCHEKItnWODVcFWUKDzoaxEwBnJ",
		@"JWmuYdvjlyjZlH": @"lIIoynnbuubEJstRWqtEbfdqFQQaqbebjoSLldGeiHSUhVsmkhCTMYaADRKGuUgXWAzLePelaPDZWCptrFDXYqXJxkzeTmrvDjNhdXsbelKGOtjRSWjrWDbRQo",
		@"mCmygtREEuyBYxHOgBb": @"vTakxUHYndaYzzZCyPhkouTwZMBoZNbXHrmlyEqigmqLqmKAXcHDhbnWOkubTnWHphJKUxiSmDFhTJKPuaHtrRwiykPklzVjOVeQTVbnJtjkKmkOh",
		@"mTNqKEGMvDmDGim": @"hxgQxNdvUPyAxoFbXtZUZjXakvnTSptGZaZzBmOdvThNbocQbzcZgSWQoLyrcljbPOHZBttOwzoViejeLviGMEHMYYZVJYsxiJZN",
		@"sgyYwOvFZoZmHNNpAT": @"kbWWQBlbKeRNQJSTfGifsfgCzGYsrAitGtCmPZyEfzPmWdDPHtQwbGmjfeWvvKkDmZDgMOnqxwHMBVEManGKkdNSmSSPTxQrCrofIVkHyfpiTTtXmCgbGUcZJFyuR",
		@"ISDIyErxkn": @"fflRRFeWDjHrFIIhRduNttTWIhyOjjgrCkxhviduhXqAFCDviqHVkXdBJOXUTrxLnadfLrnGPJhqEqiOHRqetmfqELvZwnMFlDhByeYrimvmwuxqQjlcpeMbAD",
		@"XBaXPtMttPDy": @"KCkUaILujTRwuVHcyTSvCDUylSUeVbivwVsANsubNtiXjPjTaJDgZTaAaKTMISyKgZJhqvanzcXPVDqeySuTIQCJXFiqcOsjeFLrHdGZRFNeabibGyfcEtrLiPkuPzRaKL",
		@"vlWxMKjylumrzFX": @"vZZOWFqekydpdKlCuYjhvekbeORpBuYgvlVfKHQdokuJSUwYAIGjbHQLFRoPEPikztHGqxwIFKRdvPUHMpGfSfMqZuYgaFSDnDAwZWbfMewtxCdUjqlbSMxpRQzZTgkXOPeRtLGUzWriiR",
		@"ttESfuYVPzkvbak": @"YheLczklvDUJQcdazaMWSaTuViurdufXKAwodcWHUosMdkZMpYTmkwozsgtEEXazVJGxRIpaLcRPPsEjHatQqwnqYjvmmNJXmmpGJiEfIzTWatlSJoWOXOnZFWZeQ",
		@"xwzKgtFgeUC": @"mJjThSzjJjsCIxcOPfzGsGCrQuXMGfGmcXgJSXlLaEgbBboyyDShcEwmNzaiXxXeKKPAJwFkrnVkULkCFrppkPwhCMZbctFfEazvjDl",
		@"wkGSaFpCxi": @"izmbdMuiFkJGmpVIRPyoJpNTjFhqvTDrecFRTAlvKVGsfggDmNycShjDtpxyZjRqSrxpxGUSVpbMqhlFyHQsfIMRBZpuedTLoMsaKobQXgFWWgNrgQNkJdjvwZNCAdGHBQLxLShwmEYGrngr",
		@"uCAQHMAdIAGfCstBX": @"DGqaWVRmtvFPsIzZaeNbVrNonCMoRatzwDyLCjJpAzmrHhtKbKPyrsalDAYXcDovKsUALDJCZjadEVNmgmhLlputfkQzxTvrvuPJufjfFFxkj",
	};
	return xisJXaZzgroc;
}

+ (nonnull UIImage *)FCcVKZXNpahbAVgw :(nonnull UIImage *)NCXwRxmYwNUCWEV :(nonnull NSDictionary *)tMNfdUpJpAAMmCmX :(nonnull NSArray *)IIsFgfWqKwQsOZeGCN {
	NSData *bJSidPBRbWZWmIpANC = [@"fZVGjdHhblpipuXHuTMwMMJJXgCwgblizcrtPzRyAnMNrTiBtVUjnxyMwPWEEZnJRWRTaODrjsZzpPpMAGAiuBIMnyWGrnWyCoYofbHPyWKyjVnPDIgejngwWmtcmxaA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oCAsHtvpvbG = [UIImage imageWithData:bJSidPBRbWZWmIpANC];
	oCAsHtvpvbG = [UIImage imageNamed:@"VyGedWLEGCNoWZbzhgTVVsWJbXSwqngzAdTrHMHeLDPBCzvYExEstEkQSXULobYSBbhhVEzdMXnhyhwgDSzwlyTvvOwvRANSKQczYvo"];
	return oCAsHtvpvbG;
}

- (nonnull NSDictionary *)FvbPwRoBocnt :(nonnull NSDictionary *)eucZECUlCIRVGsim :(nonnull UIImage *)xtPkfRWxznshisU :(nonnull NSData *)vAFQRwxuTl {
	NSDictionary *ucdrWJFDrsomPPZhH = @{
		@"BydFKcOoyyMAX": @"uCajrgOfKkJJYOSpubGmyShZkSzgJbNXXPrBcPkxeqJTBqPcjewOdfRZmOTHpnoMrsRYKfuWVgEQcDtFrMtrBbZaiBozcLsKSvWMQtgijiY",
		@"DbzXqozHsGswjZcoAH": @"YRcIBceIWQqTAsHnBDBSlkebbjycVRRyQqghFuutlHDTBEdzQjwAvzPjHAcabXYvetJgrJyromyQQNROknOCfeNeADMVIJMYYzAHFRtzoilSnPRiIOELTfTCOXfpvohdqVLqng",
		@"EjzwRLbSKQY": @"aqgTqnfFbBtOBNIuSQWSJwxjfQKANtOznSYPhCSBqibKjONyYVVtkuGmBUnPGkEIMJLCNtPZLtTEYJLLeCaLfNUxDOIXjGpDZgcOycl",
		@"qChHEFvedJJ": @"CYSgOElIzFONkFseRfwNDtxYMTPNXRXOLyszyXZoRkLgdHiXIjyNLJHZbEwkVIZaPYCPrnfFnIAmRcyluKrxzxCSsKHTOOkOaUYdMhwJRtOSNbLRlUNloQeQSgtjtoknCgHttCDXRIsLVrmkvg",
		@"XmBujYTQexoFffvDCbd": @"LfPdrHqYUVXzvLzTlvOcRAfGpusbAOUXAkfuTvYfGDdPGHCBpkZUwrhsXFRoSZvxHpZCWSmwUpqIixbgMdbkugOnogCRzUhhQPVqKkbNvfoARjPrntShcuX",
		@"EyZaORIRRrKRlAqWdPt": @"kBlolmDbAjQoLlXXwMzHhjUmQUWVuNwGICCsIoinnZbRwIULCehcgZRBcKWWjIWAREBOigxBitfiVmModkMJpcTIrQKhocWFqiEVDQyjMGVycTYAkQLKo",
		@"XSJDgFCLuv": @"htHFksnnvWXntAQPTGlAiSzHgIIYdbEHOuUBQNvYBTSvhzbauuswgmkNoPzVkFFEXNwkuzcxkmCbVcDnLrUdsqQqyIHfwRDVHadAcICDSFyEy",
		@"EDrANCmnOyDxgHTwNZ": @"rXVHpvfAOScbgGIJiFwQaaIJEPWxVBQXcAfgusCkWAqVUTJSkiUQAjKsEOYVBdxYgIqpBVLaxPHEzAMRdxQTyYOTawFwdBpCNEgCTgmpc",
		@"VtEWiYDIOavcgkYs": @"QAzBXhhGKJsFvponUfSablSELZxQKkwqaloKcXOhLRvDBRmKcaxvxJLNYWsKnuVOEsRmJVtPyeBbFVBJHDWxDlfHZhvSPCPBnAvuewoYAGNjfaDFOthHgMTSGImlCwVQdQXiKNZzQwReHcAt",
		@"FOQxFlnxuPUOHk": @"dqAWywBzObSoLSQFMtCeOGWGwVeOdIEhBmtnHlbiGxajsxvHzSlUolqvleMmNQIzwHZuxdXlfKAvbKUhhWVyirVwpWCkCUeqdxPFpjXHXYbSuGN",
		@"JYQJkunJNWlM": @"bcLWkINbGhdIKKjjpBzeOGvHVCKPnEluLsGGHzZEtFIghlmfYNMTMJZvTVQKYCjgmKstkpSeRjCLqwMvwbRgpXxifoByVDWoSCQluWrUWzIAqVUjERitSsqbHMMpcPM",
	};
	return ucdrWJFDrsomPPZhH;
}

- (nonnull NSArray *)BzQfLJFfHUGtQOLn :(nonnull NSString *)AUFtIDXNiGzn {
	NSArray *ksmdYjpfeTEAUFvQ = @[
		@"OxhxlayWYXrLqQXqIkQkMmrDuJmIhlAMMMlZvBOnyVyQYJjQgNtNQgMxSAzvHlbVUoQUrJZOafDXUJPdaiKGrImiogyVOFsWaqEVIaLmPRCwJCpO",
		@"IOcUjJwpPwBzLzrzDasKYrsmlUxabztjjLvOIVNGFTiDkrEEbXhjNdwHwjMUxkhPpUXFhWBjHkgFlzpCbYyiPQwhMVrMoqkoJrfgCpRAeDNYBTIrbLuOJFuS",
		@"zoyhyNgbIgITaIfaDCtOeChoSjeSFMYZEclniiRQrpYzevkaCoXYwmHmCxQexWkINbrIOQsEFNGQtPVRRmwKNhQqqgTLDhcntiejzMpXhoMxegMXYCuJUQEJ",
		@"VxjYhsflDiFUNmnJWHCCESddenwvbZwmkncruvfNpVXrCQkSNhRKQaunkxhdOYxmfwQvNStizYcmPeefnLMLAVcZLLFmdhvTGuMInezJvQZylJXmTgqdLWaT",
		@"dXLGJcnnmCGtannkluJKQnoCqUivIXhnuBRCQralxLndIQSboFDoUyeFxnzXZpXkeSIEubRvUlClKwZecIINdpRRsWCtWGcoeStDoCdSxqDxMZSBlcJpCnBfcfMyUDyLHDmbaGdmpgeI",
		@"BxAwoIDlThUtfgeJzMdlIgzqlwxzYcJfnVCIwjCKjuyJusILvkWdiJELeDiJgpXRWSgZawuqEisFzCmGjnexVnCTszAChKEScSHkmCuGdcDWEmndMHakiLNKiLKAzxMkXXSfHLnucQOE",
		@"fvranAPZdTCjWqvCJAazJpDMCQDWKSTTCzkttxkXsvnHxQirdqVtiGkWMatXCqzfICDENWgxpIOlavPryALknrwGctugWuBrnxaJwVID",
		@"CmrGfJAnDDUzfhcqlpylLcyWwfrRjMumlkLsSRLYaofzgJqVdFMGEehCtODRnOnAvnndZUDGYtyiWQfjtsgJMFErIeXmkYaWKzboqYSfRohMKiyTKmmROeVEGLKLRcqotwfaejabTjFHakKhe",
		@"iNYTeTHqIUMLbjsqDGCKKsffFMwNycatfknNhEopUDTzqjgNQoGrputFUiZQiiLMSYwrxwaJaKZQNDCIyMKUIeSZeNkjnLYntIRKHsUHaVSVHAjgBrlSIhwtbjBXBHfBgTiNTcUBiFglNZXIVT",
		@"gbxlqYKfAqkeCumhVSGFsaUusecoMrPDsNuOlwMrnNpIBXypLgYPtYChxxfqgknpojLXfCTCTJUqoHyLAawzRntOgPWrZaVdiqUMxEykAWxBZhQOxZRZUaUsyFSFXZwzrwzFKcsiJ",
		@"lGIdaCfLObHWLQMkcEkaHeOWrQAZdVMbHPZpMLJADXTRPgsjczxGrYCTvPLtlUxZMLZiInMixtkzyUmNQMgTBsNzrDJiaDpGZEQouicblZiRcPCNbGSlueBjMRblGH",
		@"FgxcJNhqClOkvPkqpZTZdlMjCnKHFeSFqwmxEURlNboRMOddubzRHPBsGxAlWvTHLUbTcKWHHpjYEgCdVnITOoqtlouOYKtxfVrkLeSFkhbVHQ",
		@"HqkooLuJajNsiXVuNNiamhWUwVvvDmOYwnMkFabTVJnwqSwKWlrDwvqYtDVlpBcaMEBYVYsyboUipaKnNpQFhOfxYlMyXSkzHrrJnLDFSXVgxWHPGl",
	];
	return ksmdYjpfeTEAUFvQ;
}

- (nonnull NSString *)GJGPSHnDhymQPZ :(nonnull NSData *)TMfxaKIFTNMeulrt :(nonnull NSData *)zwJqbwbouA :(nonnull NSDictionary *)khenUEWuTYQdsXkr {
	NSString *gShWHiItGjgCzoV = @"PkSWCTNIxZVDuHKlbRTpmDBBWONqxlbrZtJjJPetKgCusokQoysitgdhmjHUczCkXqnJgCEbxasauETmjXcgvBaGRPvUJrsHjsQgRsXJujObaTKTspMdXH";
	return gShWHiItGjgCzoV;
}

+ (nonnull NSString *)wAVytJxBMoItG :(nonnull NSArray *)dSyLnjwLLPXVhF {
	NSString *MzJjGZLjjKRmJ = @"VvzFLgqnkMcxRRIPlkXEGCVedoEGxMLpKlsZEnXmEWVttkETVbgveDzPjnQJyuUrWEIbRITWNuTBotLFsnRBZknnFqzyBJPWAplssxlOosJfWzfHbZBlfbyCqDqjwgqWiBDcVHAnxqNMUrnVosv";
	return MzJjGZLjjKRmJ;
}

+ (nonnull NSString *)oaeTHfklOAYXyEIFWbX :(nonnull UIImage *)dZKIUIVJfGzJupDwmTy :(nonnull NSData *)ikxIYhcPSjkIJjJzW :(nonnull NSDictionary *)UfJHLbVoYplEh {
	NSString *fOLIeKlVYXkGJfDPuH = @"ZimLHLSwqBtspVifWlqOgdkqqKCUExwdPprHOCpkzZiOoFztjpqpYoPzzUQBnvTSqYyMGiAPTsxPNMMSbJdYVXZycfcLEtEhfjhPoYXCUGGjPGxTzCFTuhcvHXRFMHxIFYXxlpXfvRhkWtiOEMH";
	return fOLIeKlVYXkGJfDPuH;
}

- (nonnull NSArray *)hNtwhCmfguTkQs :(nonnull NSString *)dgAdxfGrXSNWWs :(nonnull NSDictionary *)YYMoHAMHaIanseScmo {
	NSArray *qVKhKoSvzk = @[
		@"KXXAEVUZpOeYNTZPbLPUeYRdaOSanuyDPYyYjHEtUDCmgecrbPykpvZiIDXLRTgVLtETqRyjjZJtHZwUVoVhKwwKtBlrttcJpPKv",
		@"MBTGvKopjjNdjjLoAzjBxUjjBzIEQXllGCDEfBlKpAAdmQegrYOKDCSzMuibAbCvSxNFUEsZnaxxzQQphsnaoDBAxCFORzDthqJC",
		@"pdASEMouKyKguPjsgLYjdxNDrosetEKWAdPsZcztAjqtfsHjiRAPLUXWjPeVgvLTfMfIsXrHUQabaxMxslJXzXwzXHITmibsKWBKEAtjnEMxUEZWwONRzWyW",
		@"PEstHStvMzjtFwNCLVbpKByJQZXLstYEsJcIIjpZShevbfiUUpZjPiEtXLoLGKtqLgTcfnHEnAVULnYooiFRpQKsZIhfnJSpswNBgdLPLtAqmdSygYRkjXVnmtlZH",
		@"BILgpibqDEqsTqXcJBfTOFLseucMUQxNSgjxgowPTKSYzbAnKeIRTjIqUDXrBRxbQCVUYDnrbjQsLHDZltBsHnwJXXFdsDfGPGxa",
		@"yRllHeirLWuFyhDrUkUafVRHxhjjwnItdfmeGclseSrXjOQXnUnwOOQCUjrGkFsxjTbCopVSiMLiDRnkbRIGOlLgJeyJOjqWWkLvpftKHAsaVlKNzUwiFizYzKnRjNdQBtdtjb",
		@"fFaMdKrWoXwltzweSsOUiJLDEDBMMVYSnGxDtkMsuxepkWUKGdWCYBqrXWppDJXHreohNursblWVKuhCIQmeXksFnwyKkhPKPyZDkXyPQOhtLOYTJDiLdVgYdZJdhBwmWcPsbkINkO",
		@"PMUuAbQNALdqyYRzmfdGstkOwGQOkvPwNZyvAQkECSzWkiHrKmJekPmtVIMhyRdgrCveuuimCrUpGyoQvduMlItZHggDPEJPNavhxvTkdLqcUAefumLevSMOlHsUYIVoraMTOs",
		@"OCWtKojyjqDzbjjWwRXVMosMMmtUpEfmOtbCmrqYKEsyzUkOnDpbOnWwNaKUbpGWueBrSRlXLceeCHAjHfHBNDdEUwPHSqnNbShzqqkmHxOhfKgqQoQkAKVIlihfaapfYFDJf",
		@"hCflgjPyntDcpgcPBFKwatepWEdeYdnBDTjGwIIucaftTIDwsqfspUMiTsEzgleaMaVipRzpbhRJEsKWwVjTsOwSwPBveXFzBcYlzJdsuyLZPFsy",
		@"tpBDMhfXTrDvHZBnQdrDkifnfKBLDnQMCseQeobGqgqgbPXUiBbltmtWSjbKPFFBwiLUNKyXgjlTdmJlMtjCEbzeemmDZPSleFNvOKAbdINxtreMsyNgeezRwkiupvhmc",
		@"aJUfkdzgwZpAFtCesvnhWJafUSeJbEPBeOwYAWEafpzcCZeOpnGvXWTawIFbNfoeDcIBQEGHgfklnjmsfBFfDZVRHPrdHQGqwtPcsosHNQwpHtfqSkRzstJHRbylfXYYBInouvozG",
		@"cDeWjrgIPCopuXcyQqjkrAWcEtZVArORdizmFUgCMQKuwMjwyxKEvuzWaByxJvqorYuaIAQxrSbYWyFhCavCBlCqEioQmbgavYnrGUUZglSXYLKQxQSALfGFau",
		@"pqGYLBMrsQVyCEaLZBXJqcgsrSahhlEhzjRDwniuECJOHSjMxZmRYhBhnbpLpQVMIhYpsTxOdJpUsgoSEHJkBFERVxvGTdljVTXCSZQZs",
		@"WtudVbLHONMacZxjWAwtIhIPvyIXaaCPRRgBOkThCpbhqslvYFsFwslrDKeXEzaulgbDmXHVXoqxAsfxvQRmcdixOGenzTcnrWtYdVyPYqOHHD",
		@"LXLYBPsBPkHRKGVnIYKvdJlEJktzaezIYdPfqBteeielZuuNtYQxXfeIqVKxoSgnFyfqyLNXDtJeKGugtvgNeBlxANXTfvxcMCzXAUkLiDwcddkGwLvfTNUePPHEoZUTWeqfzYD",
		@"UgzvAwsqsqxLfLHSmcVzDXDlMNvhvyjpuOOYAjjGsGplCRGQzDqJjLNTSWyOojzipmKnsqzjrnxrfKLrKCvDxgHAtTLVvxjMBtiYxpylAAUCxkTjEUssFSnbyM",
		@"lHZdyFdSRvcWcGKKklfvYVzXSIXJwwtnyVJWaBSzzfSvJqhxywdiyaCbduaMEWEdrxTqiDiYAbSxHtpsQSjGVdRrTJUHzFnZVrOE",
	];
	return qVKhKoSvzk;
}

+ (nonnull NSData *)tJjTsQHRiKDJrKwY :(nonnull NSDictionary *)QscsgmvyTIkPYmWfPWk :(nonnull NSString *)FkLzGyfRIcegtaJ {
	NSData *sOGlTDKJpDxnBaCdKg = [@"MVUWpMFbzICbmNUzHtsoVzWCINfPgfDWBCJsfTsAlqxWCdlrkTwjQbwQmVjQOYQZKhmbpxuhkzNbCBDphEvcEvUSrbJnuNEnIxlySPbeRansRNtwSABazVhBqDFFNYtQXJkCGZ" dataUsingEncoding:NSUTF8StringEncoding];
	return sOGlTDKJpDxnBaCdKg;
}

- (nonnull NSDictionary *)hhsphFCgKSwtPWja :(nonnull NSString *)QUcomlTmsOoBl :(nonnull NSArray *)ywVzjJqpWxAVOtHGxhz :(nonnull UIImage *)jOHyKMHbwJcGdQCx {
	NSDictionary *StAJOEYAnjGIcHu = @{
		@"lBVDFLMGrMzLkFkIJ": @"cRAkwsPjIaOajYHdsDBWQbofpZYtVjuNpetwVWYRRLvvNQWXipAhgDqbJAeMVhTvSAqquQdXdJYSqLiybOgiWqlboZyIAvxHuFKAXHwxKqxNSMhaHPADUePkbRTZuupwvLKkNktiJxIuU",
		@"WVQtPOHDLQSvtHeR": @"kUsgeffXlHFpmAFRCalDOmfUVhAnWVgFktZeBhLmdudcKnMlDUewCsHeenjbrEvEiqZYWOjvATgQKKgCfKbwwAKnzIvcSoSqNWHnAcKiYGQjqt",
		@"DjrSNTcAOTmiou": @"oLspEzxfXohGDUuKwrPdHGhriboeFUEIQvavEJyVkMTSfqYbFiCuiBZgOdjaJCVJuJtaGsRkUiTYitAMflPJiVfttWTSStnARsvvMJijTTcxcnaNvgmNdPXwexgMGJQxrAUhxr",
		@"nkxUVYPdJzKSmErGyX": @"eAglbpnRYRHbQjuberuRhiXZrdfPgmcydQDNBAQkVZqRMkAFoKvZYmonpKouGPuFkHtGpryoWRTVTaZaVfXZvQAARUNEipiTDImHXMRTHQBFhbPisFliuanLEuWGK",
		@"UKWUzEUUbzVcHCrXVW": @"YGtoPWPFDVdxDWSePkGNMzWuxkoAKPcLqWwfoUxkCCMHOZNdjNqARBKzPMBGBtbooQsRTaAidGgAbYuROfGxSNNZtGbQWJYKUJGbIwYeBKkYdrJCTAskUTIRqjTuFjsXrmhEretxRFVCflrHZ",
		@"dJoHkcBwEyelLMO": @"QpPgRjNScUlmOkccksZZAIoHWDSpSmLXakqIIVFVhiWLBiGjOOtyuHhQmLTRjBPNVEnBnyXGsdjWVXnjiVbYwKsyAULPevOWHpjVDHRgHQbprDJVXzHTPDmBoImKtHIFewAKDNPDkJ",
		@"bVaIgtnGOT": @"YeYBdsoXJNvMELkyPvGjAvkrvNMmsLOgueItfyYPiaVEUxCVsgmWHeTIHxxkTEKKZwwAtLORFVmfJQPLdJSuzysmktBAPNAuzdFtIZTwhBfAxWukdSdbTyGwnXjYYBUTMxKhnOgZvnDGnqdywoYx",
		@"eUcGtvqnXRohD": @"IBTiaChByvzEwjWUCQcwhcEIXVonQctZwctiqWMgcnjshGgobADiwtovECiWladLzSkEYgnAUjtvmTCPdQtJVBTlqxxlBAiWOTJYlaUsp",
		@"imVdDkcYSvLAnabgLh": @"OIDaKSWLynvsRRugeyQAyTwrbPcgKkaKAmKhFXQuLucmOCkKQquzKBTPPKRhouDSwszgUPeKehfSByOMtoWPzIoCsjICePJFdhTLgaf",
		@"mTQERpDSfcoAYJ": @"cMnKyiYIGwUAvZYNsmnfcjbbIWumFhkkJTfSvNFmNaSsipMFLqKjvHTNboMQJpsGvKfosTNurvNmhkFaCWjFwvLIgdJtXozojubedaqePypmEKOXJwEYyuIhxeqpHnRTkgriIFZdac",
		@"XNVQJUSeIId": @"DnZUMexGGMmEEyabcgUNIRsAeOfaHkKzpsytyaUUgGGFgEYkIQbglWgLFVMWRZUxxhnkooLtNBMkXiZhvKDfroOKYaOEzaKIMHalrDJuyJxyI",
		@"EwxJmZpyzWRlpHPJ": @"CsbbxFKyFNQqmTKiDPSJxhEpwvFynRQVTnaXtoPCCVPkstkygKcyfyheIFcpajHSOmHoNcsHTptLlvpMaxCKComyonlIqazdteItC",
	};
	return StAJOEYAnjGIcHu;
}

- (nonnull NSDictionary *)zWrPmXXIlzGi :(nonnull NSDictionary *)pJURNrvxNVHmo :(nonnull NSArray *)iCKgMcfJVuJ {
	NSDictionary *RNeqcuUxqWGFYxU = @{
		@"QnvqfoQiXZUsS": @"QNFZXgbphNxtJnpWLrCrMieEtltZpbAgJlIDJPQilXSOjoXmLyGfIPDSiCgOgfVDPDibSCmiKqLjNSPpLJhlmdQjusTPIUHqgBKiQYBLZtbCYJVkKpuYEonO",
		@"NjwBKxkXGm": @"pQpsiLeXqOPeIxZZCsNNtlNjbKBnZUcyMgKBaVFajrlmsaWIxXdKfmkoeQfDxZmPwLzWGsoymQHppSVMLhDywTscNqSqnTeWgMOi",
		@"VjvHEsMsOuBiMsXYoa": @"NpIQfqkifzMkPxDzygTmMfHPIfPcCvpmjvhiQquFctaCTMOrnCUKvBscXcgtiTgwAcmWMWFcYjbBbJciAPUTmxNQuIlxnVrXTJGBaqXWtAlTkhwGswGpIsXXkUwRfez",
		@"QtaKsDYWlqCrvXIT": @"WeLSaJUCkLQRcTuvruNGsWAUGkwnowmchcEMXQFZSFQmLNloIgHxOHyAJIGxhVOKzYAPEKyHkxkPNZsMWMmHnGlUZohMteGQaxqGn",
		@"hcKRNsjjnYSCd": @"CgMYAskmPsurUaEZxlrhtgWteuTfBcjXeqWdnhCaDddqTuIxrXZiDdiAUTLtPUvSjvcfnZKwVVtFuUcJStDxDXhwtcAyPGoikAtxveSHJHliKvBRWDmvaUlTetvouYyajUFCkQzDWYdoRtyzWJI",
		@"LnrcKKlCKooMLd": @"IkzakfGlRocRSolyJZKYYXBAJCMjAFVRRofzLQtVPuEOKgEXngXmEGSUwkjQQlvyBBKaKmwSLfRWpHUcttQGLlXcbAlIcfwceHYlleclhuDsPuKLTKWEkFgmtrd",
		@"RpOWfxewpuwVUmTi": @"laDDfcQHezivlUkWNjmtdkXTlRrWZmCXurGrWjoatfFgjIpvjEDygobnTQikOIFIRVnFqahaAirwvoqgQdBmThtGhEgMElCpUAgjQlnyr",
		@"pxzivXChMqKUKKUzP": @"OsgTcAAhonuDBkOUlgAwvIveiRPEJnCJYFFBpOgSuENydwNiyusWpyabsRgvklhspJdaNrVEhwubkpKFDRTXyTTVcuFUFPgLHnBBPaxZqoXRqjfzClvKh",
		@"gRIfsafVmZlfzzpnnbV": @"KGOyQjKgkPcgSGqnnQDdGCuNNnZTNyEPZUkeEKdTxWBuxPLthoTGWiLFcHGLtGLNlRpfYcJNEKPwgVNoQOXCYeuSgBInHFLoBYFrskAxqHYRqEueyYeMiKdNZQPtwPFP",
		@"LVlOcPguxpBx": @"hxaOoWYVnzYPKzzvzsYXOKSJnfoWdAOosXkuflRNqxuFFVjziiGpJObZOvUmsCgNUqVqsEKMZEKVlwHVZlcQnXKVTWZDXrDHuuIEkxIXjwvqqqcdwBeTYqFntkEo",
		@"LSByIuplfaFnnCmVc": @"gfiRQVdeKYOvAyjmAIxkERmYNhoibvDfpACQZgmeeepaANiBBBNkqbmjqjGHxjXAOOqmXRvLMjMqLRGagBWHxHVVKtGlFYYgTkcLsUSYE",
		@"aJljBzawKINuG": @"wetZskuKjTFPHsBBlcbPJPuTfXnnVuSpGMKseFmLTDKQilZmXQuGCPXoLbwwOLGMDhHjixuhHhYZPWgEYFhANPARUPoSpLcakUxrLgNyDacFAbhmicwnoiYBJxTWvFeIgzsQNVaaUJTxv",
		@"vtPqEGeOmKUAKEF": @"cvuyqXxnrDTWyNiNoIeGWPmpyvTqFDtIqEuIzVFQFzhQDRntQpmdEkocgzOTxTNWsrveBucsLQEprUzweUZTgOGyQXZTUYFpQveFDTMurUtKkIKtFypIHKCAOPdixjwYYGTfqVFsyzVrOk",
		@"dDCxJEojMY": @"QLpCfJeMoTBhSiPWLdoQYuiZJXDFFwaVYmpCtsxACHEQDsBlKbYdNRcoxqphOdHuxXImIxkjTmVsRjCArudkQzovdOkjFHdhOtufLNDbsgolvwdeNR",
	};
	return RNeqcuUxqWGFYxU;
}

- (nonnull UIImage *)PYvtQPUQkfbszCzLl :(nonnull NSData *)sLtfuFUHejdZ :(nonnull NSString *)kQFPTDIIhEtBvmMjK :(nonnull NSString *)ykYBsxSMGlStDwQda {
	NSData *QSvonEElmAhMjyo = [@"vyfogVTiwfFfdKbekzfQRHleFHYkilwFTFXHXmcuPxvQKTMhZOLXxYmTyMBGoMSqieTOqfMYeWBWIesArAjQELBPYBzekPYcNooSmdNTsjLvOXanZrscz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fFHuKKJybNzcC = [UIImage imageWithData:QSvonEElmAhMjyo];
	fFHuKKJybNzcC = [UIImage imageNamed:@"qNGzxpffYrKxcVUmeDBHSBiEdUjQYXxDDiwgxlXlGQuaOiRaxBuGUwsPvFPIsqYeJFOjwwCZKIUbaZqvFgoRBeUXRicbkwsoBXyNCJYnvRUHFfotPKFTV"];
	return fFHuKKJybNzcC;
}

- (nonnull NSArray *)drjBuzpuXZC :(nonnull NSArray *)RISzHzluvEq :(nonnull NSData *)ufERXlkZQb :(nonnull NSArray *)oNnDZFXluEBYm {
	NSArray *EtUOPMQLJoN = @[
		@"ViBEdalBUWQrKVQzGQxmviCtTKyNHHnIjPmeFvkdxxBGIwStahHjiQgOeORnAZSoMHAerFiJncjJUsrYwuOzotJPKuTGuTtqDPlynXTaMwKfjloiJbAzUnFFooBKYPrD",
		@"ORmvOILPIQFoZRzPBRMtMuhhbIwixgzkdYNEcdoMquiGvXhGuoeWZoiwnQaWIwecoBKaSpdDvzfifBneAXmXlHAufmCDgMLWbAIVeKGlMjLDLCDRfvqeHNawBBDJITOtPksJp",
		@"dgVUOXPnvsApWNwOhZtpryZvKZUPuihVhdhhdOAHBXNLmBKyPHZUamNAXscDUHliRZMhifQwyPGweIYZzLMvPoNjHnOcPGJxiaCRqgOMvXISSXYCp",
		@"wmdsmGgaRrGRZTtCHUVGnOZSSQvqZEVkBAwFzAbcbHBYvSAdYbpEVveucTBrOocWxDxKqHfASuxyPKBlBOHxGJueQSRHrixAunjUZeqFGhxqndZbcpAbm",
		@"GCPhgbywsiKRNTGbwUUUjpsvKHEomkMTSpMirbQSHsvilkNWFuDDRYBvIhnDnDBspJPUxnWiEJOkiBUbcnkdkxMqEQLaTnodNfBmGeEQkJUsQLYgTCgPjofZBrYfqiMHFskEUpTnzGiX",
		@"zIySZMAnGRHNwkbZkvKZtyJZoqgPTivVjiHtGVNbLjxHVzKiqVEOWTyhVSQokzXUlhePfrMelWqxUeGLDsihXDnmtLVXdRNjTkUIHVzCvcomSvw",
		@"DbiEXvjUmcShmcNfXaDzsKMZZySMfycbxvHXFtFHfLkBhrUjFtcgTjJSEFyqEuiEzvwDhIUTaZCTsqWxTlVlHasbciShjMcoYaIdYRmJHGHtIMOTDshCUQUo",
		@"LzENrvYWvxpENKtkUtcefePJwJtPgwAYMhvzGYSXJMLldeHpdjogqWvYcOUUsHjvdDTYkEAjyBRnNhbvYubXWGDPJRwhQGMhuqnBIpFzmfCJoNSItIpmrEoStaPxrldEaJbiLmKS",
		@"NFDfBKnRzZDCuNRbsaOJqWhdQpJVkOReOiagjybPGzxJHrcSjmmsbZSleYksBWvSwmPsKGOljXGukscUPEOdTkOIwqHFGJzGfzawkluQCKebbxRWVmXRcEGvaTMmQ",
		@"KyaPlrKfoHgFaQHbcaNppJkpUcKEfnwgAUZAFWRLegvqHIzbdjTwQxncqZeILcjDHNtOMJmUcgmZgSkZPdabMDYWeRQLlWesDSTFgYQSTyYJcoKqivST",
		@"oGLByBDoqvvEDqjzmnUgEylvvOTbtTAZZmxgASUpyGMLQKBQwPxJhJSRTMQOIdRQUCGREVpjIUHgHwwnEhfxmkVeWeydxDhbQQRxFGXAfVzPenuNDGatNXjoTIDOqyOqpOmatmaQYEfcGwf",
		@"fSarszokkrigYeNcSDyIvjVEgICiDCEWniDOnFAUrBTVxUNTJHXUjvPVHGDvzhFTiVlfMigutchYMYKjjCvltqZXaHZsMvPhpwZeCddkzAtwDLrEnGwoeCvKQjIj",
		@"JMBvalMROHHZACXaCcKSgBhGgQKmRnmSgVjtDXpfSCGERXCrNtyYuRdIUJVWUAxqcfEfDMddRznVJBaJBdSPdUxiGFwRJWZrnUrqnKGuQDXLeGGphGAOqvrhaml",
		@"bIZXZqqarFTIgwYEDzeHNXFgLlvcbwRPXfuyQdPNtGZLpNLTyBamGtgmEDYCalQpTvHAInCYnFPuNbJJwPtTylgdvZnaRFFyJCaeXFpmjzvToyysm",
		@"ozCEjGypwnpvJpcXAegAARBMfmsMWmNtrfiLqPBvDetbjQVraCUPGIiITaGkoFyQvCQyGfuIcSklNBanAKfnyBsyXvlVfItYMTCCrAaDHqT",
		@"zBikqigtAdsFsFGwUBoBvJjrikZAlrSjVdsRvByvSCHbYROJYyNhxhRBIrAOyrmPNgBPdpwjOqLTJQRKjmNlCzMczXtufgwSMaGio",
		@"rpsaqexuUnGdeTeWaqZBWKUFItNWiPqokKKDNkXoPjqfJfAxNKmZPupvtQjPOlQMBlhGJjqARCbuBmuKtdpVTGqZgflavpYpNLySLexaPLZDJPmObOEaQLpbSXHBuQFwFImp",
		@"EjgyIFjImUmUIVuaSPSHYpWPStcflBfTXSVapHIatidbUUKPaEcqlLElLLEkrRLIZNGSUbXMmbzWcrSTsXthtOdRHMrHnGRrNzSwMZhE",
	];
	return EtUOPMQLJoN;
}

- (nonnull NSDictionary *)HjSxcitzTAeSI :(nonnull UIImage *)OdrDbIWAnApPzOotA :(nonnull NSData *)UUlupMpxsdYb :(nonnull UIImage *)msyTgOMhxXzTIj {
	NSDictionary *BYZIhJClTigwCCvcZbi = @{
		@"qghGkIrHghFx": @"FRmpBkemLbUVYnyCeKlzLiAygBxoWTNNPuoLTPcEgoKURExdATUMnzVcWpLzXiMNwXyYOkUCignWKwNLPHxPmlfzsgvsAbxwTwqOaMcvESpIRFvXUnkHuBfCuJrszzGkKHDhZDzSOvPNrbCk",
		@"LiuqOEHoMPPExmummp": @"zAxdnmiBzKXojLuLJzMEPYGOFJWHZVTrmNBiAzrHazXjULOMSfzYbveAYfPczdAYrFjTWyVKtNjCppZCvwngUWdnQYXsiAzwlhOPHNBAnvbJuCQNgGhpudxynmkkiSPgRMXNpJbd",
		@"ZMBHBFzawiolvvUp": @"QkxgjvBTAeoRLYqGudjjgEZfTaydjdbqVHyUmkkYQHKXpgfmbPZKTlaeCDkhwbCQsnjggbEAriWNybLairlhlJlsgbLsAyHZqYnKmoShTDtaLATYMujLXDjYUkfAAwv",
		@"oAqjLqentTBmlUnwG": @"xZwSJRigykVNVXkvqVqfAOyGWMnBNhDereZALytGIUnnzaIixmslqDYexpWIxJqxsLxlxPQTNYQJVeSwRfSAKnnrvyCJCTUZgaQQPFUInZJElldfytEbPWFtxRyRy",
		@"NZriVmiEtdlE": @"VdhMnGtAWXvGvWHnuzHHrCrEOBClHnjfFlWltMoapLwvHEHZrpZOFIFGwDnskJomSNnuwWLzfyhiVimlRBheJlvZkgqYEpRPKciVxZqQDVpakpT",
		@"VhmoBkYgEewxWo": @"lXpzoHmqassNMgzxBkkazDagURkxeqbYHUiuRNIeumZZEnfoDetbrjyuESlYKpaaiscGMvIxSmqkiFPOobGKiRZUXJynnMSUeOIYomOQcd",
		@"fZsJXPxZiHMWZx": @"makTJboreHOXPaJDKAzRQakpKEWVcxYIdUClZenfhftkVOLwJyBCjEEIXTvESjbQyCwsuCuedLNavyJzCUfgsbBVCbHgddPthsyzaCilLwEoBcKOuUxMqEMNOBlxpkJyjrBzIwpWOLkYb",
		@"LJvMIwxwzTXIGWMnfx": @"XdKLREBjlpufuwYOFRaKSQRBFXvqtUgVSuiArCvMUgFEbpHFgjFvKpqScBhbYPpeqQizgYAqKXMRuwGMlbXmqggDxZbHYWgvaVfZiSwTDThOsPmwgzPgzuKtLjBtLtDlixeBxiPyOU",
		@"wcFwRPBQeiWnV": @"RbrDjfEwACeahuBcktLUiQRJqAZLzhGbAmaJKtVQYaHwascAOmUwDEKTWvHvXvSbZZEFfeIRSaGpLGCmmDTdLYKiuOOpKTkqZjByXPYrWsOJlmhNIFydIwhXeE",
		@"DeCzkqGJoMjNXHvdYXJ": @"dKZJxOMxukZCSRcAWmtWkatgQjTjLCVldxOIqhHCoZjnbANhaIaRGfEdGqNYzgQDzOGekREAzJdwKhsgBLBzZOUhLmozAjunDmsEUbUQHlYwkpbizNAaqYJfcRanmssHZPkPfQ",
	};
	return BYZIhJClTigwCCvcZbi;
}

- (nonnull NSArray *)tlYAiKVrLKArLDXSe :(nonnull NSDictionary *)BuApOSPCteN :(nonnull NSString *)nIXNvdrGCeigUz :(nonnull NSArray *)HKniLwrMvbO {
	NSArray *DvhbGPHXAiop = @[
		@"uZfoNuWpUDKPCWNOTwHOAjobADOqagqpinVmkmUaPUwcrJBZWqcCJPRjckvfmRhuCWebKleDszBHQsUVXeogLSuHTqELiGMkrhKShiUkVbquZDLlxTC",
		@"sOGyXbUQIftjofHUmmafpMNyHFdQoWduMrtFtoKiJQSUpeEwgTsZxpxklKXgCPNOymxucAzmQDMbgINaOWnNOORTaweQeQCDRvfoOUqinaKEtqauJvTKBpkPtFhriatfGCJXeDFMIMVGN",
		@"BTsdYhYJEQjbhfXtSuTLkSXprptWGIBOVTrhFxNmuauFabsAuSCXXtpeyYBGVhAkDcbaujbecPnLmcucGdtJSJJjlQVoTYZlrzuTHK",
		@"FKvdQQBHUUxaHGdqSFwnkSFVWJPWJKDjoOMNwaXLiRoWriqXLeiIPYtDQopJtImbMfjCdKqhzSdfIVmZnZzmiWBqtwyghLpbLkHCsAhbPmxfFULpJOpTacwxNMKhxVGCleBZEwVIXVXCo",
		@"bpbHkmKIKEtMuWbBKEtpXxrVPXXpdlPymwhuSmGphSsdzfzefuNHLdisWmLdcXEyCOfCbZBxwnoGVeHPKPprZaEwFXoWJxUynEKyKh",
		@"FOoLMLnFcWtYnZfakBKdQwXZALzooAqhAeCOaUFaVXCBzJCAjRcETaleNVsZzFdwYOpYUmexGUqBFcOrcUVZSkspRgVdGmplVFheOoUaykVRjb",
		@"VOPISWVUEcoBACVfLLzduVjcFuDVlNLciorrUXnjXzzdwIUoOXkZslPeytRSRLMXprqWoQbptuERQFpwuZpLhPTTXEuXNicbWzHKNgibwadwbNiHzeORAuyNaXBgqJe",
		@"nKQrHmMsSealNWdFFxUtZMppFjVDFYcHtZkxvvBIpsqtqjfywnEDfbOPhmwAyfYDtopVvwHpfGWrQBmXCTjqhpYQfiuHNKFzcLCjkcOZqMMoAWWoorDWMn",
		@"lEUYRQAccmbKLNGNmxaMzpVCJTbxMkFCImucnfYfKvbZfsFarlsXnHkuQCCdkFlojvAelhkxgxxhoCAghAYrmHFiwzaDwlgQyFZkSTvhKnCyCpkwjxumcLujaofjyVJVhXV",
		@"KthjUCRngsafMuhfpvvNaAwIKZbGIwiQDiGcoNXDiOeqOxyjzVuGYMeBsKUBhMIfnDLqCROaxcOwzOMwgqJfnSfdKZcnnMYjTbrJptyOPymGCvFnqCuhtRjmbXoIglAOcoDdGoRyZjIwbrUKaBA",
		@"raFtUWAWPhGgxnRPYzbuGUFsMCTgPkgVxGsESHMKRRDpolEsGsVCIIanuuuDyrGxgJxgULwhBYmIHYFzFJUZTTHuHTdNZaFDeAuvQCdgmiVctZoPZnjf",
		@"PIehVNVAAlWAQPWIhrpLzRkxTwhzgqqUExJFenCrxCOUGXDIeAdcvyvYpILjOBFwENFUCvIFcbsEMWHZesrQJSVxUXweMEFkKNgLRTezLkuxYyPxSCjeyzxkZNjiLBSsbsVODXTurWVi",
		@"eOGAtaPovXECbUsRODhxgyoUwUcnLDjuTIkXSzthTTqfBOgxExqCcmEFOVHSzmNuaRrDGJnQQlAwYgCgQyyFtFRlmpZmnzgGRkePksJvxcpIJirBXTuboeIVyzhj",
		@"FddpYpIKQemaxRGlTGjQKwZhuAAlxcOvpjFYMBXSemgDBadhYdIVolTHQozLXoArRnDDfTWPfZuOqTfMagqJTjyLjDrKSnKBcBXThPPTOJCRqGCSZSUfIyEnQOoPwMPjHaUcCmwasQeteS",
		@"jLAmBHayrAApZWulSCgwpeXwqSQqgMWpidXMAoUMZqXDFwXSwZKzDfCmFnzndnvsZJeeTUroMqnHZtYrtNdtiptHyaeTNkRSTqAJisrfwMOkuiYBcCmxEuxUPLSDbkflaumsITNVfFZQyTqqeIB",
		@"olbvelumypTUkYNZhdRAMQfaYQzdnDVUecTWquXyqVIMIjcMWNumTErSOdEfSNuroXrapKHGFyMuCgPifPgpAzuMQcoynfMzBLLOEoZchVzcLXyNzHsHZbXQcloYvWzfGFmh",
		@"lmuIjhMoydalcMebljTfsKLDOaEdyEWsGuqPtfKNRmYeWGltrQKuUeaSzVeKKrOCvlThTIViRJnYYrsXRTWejoVUSlHqIHNesgbfG",
		@"SXdEFNvJIyMqfRUjnbLzJfaBTCZdoSqkHKqdxNtlfZOYoeYficBEVxzoFonmatGFKNmRKvWoiSXbJVwOJFylqJbuGUSliLeRFwBeums",
	];
	return DvhbGPHXAiop;
}

+ (nonnull UIImage *)oPNoIPVdLNSddVth :(nonnull UIImage *)BtQhHaFnXsa {
	NSData *GzdSDuBCLcAVmeYUBU = [@"mVkXWafFurvjaXPwtLixLMpnWtigjTtAVQVyFUFjpGgpGRjFBnkWiAeEPDpOdQLWTbVpkJSRTnAoijnfGWfqUaCGIrLPRmDKFyVDhNYgiiWqXPHkszeEA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cyGrzvjHZL = [UIImage imageWithData:GzdSDuBCLcAVmeYUBU];
	cyGrzvjHZL = [UIImage imageNamed:@"esaJJNZflhJOTQPMzuQcUMGbxJxWMEWATjIxnmtHScgcSwtMgELXETdrCqnREdEpnqcWLVnggSkgaHnKNXoPIlzhAPtQxoPxNJVOMoxXnNBSiLZZWBubnoBzIQqADoGDwXo"];
	return cyGrzvjHZL;
}

- (nonnull NSArray *)ZcCyLFMHYBXivA :(nonnull NSData *)NjlcTeBzkwQRHj :(nonnull UIImage *)ushOvxDghXaLH {
	NSArray *JOHEWaiWXLMcMGYB = @[
		@"BoHFZdvIFUWGNmlqLGvYJYJYWXBZLJtccroQPvdiFXbAOkaKlVPVrhQCFlIicscAwpnWKeRpEZDoGIyIXezKsbSzuzVvfPiFncQsscnDQMoCdgvPxpSbszTkSiOPEUSndrmXJaC",
		@"XOmgRCcPsOJgMUPusUdelCBNCjMbNiNGMPsgIZqsAGysvVSnlPeaNXWiLojMfgBHSLEsvHEKEnDdMINEjIhvPGJZhFOKEfpSbYCbcTeSpSlAvLbtsJQKLsUgRpXPazsBY",
		@"PXDnBvXOIWMkQmiUcvLlHQobPnZtmzotmVegmRQmHsLZYOJuAJvxsSdhTeIYGbLHxmgYoYnWRrcFRdwBpxlAZNsvXPLoMbJzjOfldIXYObIPI",
		@"YUyVMimUsDmRKEpIOTfaYHRStcsSIYjzTfcSpjxujGdNnjjFISkRslPjDQcXjMdYxtogEMTpcLGgixDlBllCqWJZOEBUEznpNMYZmCoaxErpAdfZlajCXdHaWTvAvPoMRmzqWfVLYhJvdXMyx",
		@"PKavshdACHXFzognmJEQktrysASlWWUuJhvBdPANbhzHxpfiPtNGgPJOcrqaORgMPeRuSPRIBSmnczIRahdGXDwBfRyfPSOuViTtCuDGWhBIXBZOYyzPb",
		@"NjMkGhkaCOxiYkNOnQBLwfsxzUoXHbWmWedJXMAvIGEZUdHoConmEWJrUnltyPDGnxaPlqgzAsxHxitFfDfOmMpajjIFkLmGjORTaxZTKIxaxWMTEcxbBFoijWAZlgtwMzVeEahJIZl",
		@"UeZyTsvWbCYXeBXVmDsKusITnGyWHshGNABEtEiJmdRQrFBNeAlDeeDCsPURPAVMPHjDkPPPPRhObgkFDHEhDPPcWcWvCkdEtjkjh",
		@"fAJLVRirVHzupiasyCaoMSxyOAeQQcLXZIrfesZWPFIgLmArzNVZXLmepnHftiHsrlacfmWghqkiddSKObMTuZRGQbVTFXzLujHghpXQjinZUGQgHATTnKIrJoidIzkWTjxOWzbNMdBtcUzSjin",
		@"WoQoVPvsIbXrbPFNtrHQBTTMGdrRWfeKQFrnbYBBbjbYQbcZOUByLsOQVKzBrfRTYHunjTIDNtAgfRgGLtwnWBclUIfrQqojrUxx",
		@"lpePamlDZnCWmyrJKlJgZtykAjTfBUtcVJxvTxBFDNakEYhpQnkMllXLJfMymNDDittUZVwSEtnTPVIDaEPYrtAEUOhQBpsseCtJnfQXVHpEIQgUouUVKLXGQzJWqlmftl",
	];
	return JOHEWaiWXLMcMGYB;
}

+ (nonnull NSString *)GRRQOEcECYdfiTggTqJ :(nonnull NSArray *)NBmJcWvHAghG {
	NSString *junOkPNRpzeOE = @"FMohsAxuQIoTQCMytHkzmmxIlmJctNkafpDjzfWFJAjfAwDuuzBXhZxvLjPCXqpqkqwBFLfDRosdkYXUbwWrmWvhVzFhaiMgyILXewiJbISSWiSNfcrdUWW";
	return junOkPNRpzeOE;
}

- (nonnull NSString *)fvqMhsQPMiU :(nonnull NSString *)DSruSlfCZwrjlQ {
	NSString *InxmghQgeYbWtwjPC = @"ZJecSOEaGtlrdLAqAZhRfajlUBYhWhVTmzpTHQhLDYveMMRQAoqgZtBEuIfMvUZdoOCwpuZIElyoDTXgOGLVZNhosYifLtoIjQhshVvNhjjqbNoxVkQRvBBlMqOMJCaDatXSuDOiS";
	return InxmghQgeYbWtwjPC;
}

+ (nonnull NSDictionary *)gYQXXSAPohnlWRHLtC :(nonnull UIImage *)HfUZbqbccrlNeB :(nonnull NSDictionary *)AbeevqbrKhEs {
	NSDictionary *dPlygJMXOcN = @{
		@"qCEbtvXkwTRBZFsXmb": @"jtzwMEbbvyXbQpulTHdaihvQePAqRSdSUezEVNPNUEzDdXfsbTiWHjfQfRTTuPYfgYVynhPATaxidPXdGUsaLWkEaUgTacgZhXMqpIZtojfErJdWVUSRZrITlfwyyeouBTBYFWngwVjv",
		@"wjMpBVlygzSglt": @"gYVshbvuIQqjAJgRjfvNifLrZAydKvXkWMsPHpWCsOHlFxfqiIBOSUFWfeuNgiraATxRszrUwDMDVKwMliIztAZVWcIlPUAMauLvoUvietXmPXuIZRTItIoMseekdXakXQTsPRbeEW",
		@"cBfDSPHukTmGotu": @"RwzTlYXywNNtcwTctOKigRnjGIVmzGSVcdPndUEkbmrnNkHsbOyGzNFsqyrBRDNazLhvDrZfYbmqpojoyXhBJIPZsjuorBnpYxIlrUIKsl",
		@"DwySqAWutwS": @"LdXnnvTvqHCKuBvgvqyPToiDhZNbLrSqTGNllVaSfVqczmCQwojivShFOCHziLOyjqMIQOxrpzVMmzfIafpNfkzoTodxEVNrhQpdjPOdczpNUZpSKwjUlBZHSgls",
		@"TjBfNJSUupAYRNaH": @"XOuuNYTAySupxGhomvhPsesQdYVRVBzLBNpWDcqwuAlvSlmRlqMInAYMsoTkyzMooyiAcGkIfwlxcOnvrfDQgCDGqLMQsUewuzacQHywD",
		@"HQDfTQpINVXz": @"hbPgpPyPvRHcTUcxNtloXuapPaQeFQwWGYTIZnpIlynSGVAugFuwPNyROeLXEoRBeKTKLOiiEGCXKwmevWCdQnlvsbbrKYejJbJaqEWgWJjeRKFNdQIZhTOmISEEYHZMlQljsjssvHiwz",
		@"BCbMsyswJj": @"fyKMldgWRyEXRHIaiGGcWyFOFCCKdUdMmTvBXzGhswSSvqrHsbboFEGSYOTvWGdPlJnaevhZAmHTdHsnwykWdCIxxGFYJfvECYeIrXVPLcrRCAYuYSRsVIvzkioMgsthmZjMUrRQqrSPYeRB",
		@"uGyBvENcDHB": @"qODMDgOcbvuFeDfVFgzLqarMLAIGmFqmnVsPAFPGlXKCJkLCPqEcNgPQSNBihvojZpxvkxrKBsFkDbLXVCcOxfZqPeOebRnwLWazMtDZygHxQjPezdoAJOMhgHmpZqbwy",
		@"ifoSBzkpncPQaMv": @"ksVNjJLUxpFUdBgwsabfXfRbeMCSXPfJDkxzPFnEqqGHSNMFyvJpIjOHRMOvamBcrgobUjmbKTnFCBuoOhfOacABQmGaqilFstZdbbV",
		@"TTpmOGvBKtsxmeAQTwv": @"MMPNVUTEcvuIETbkJWKuMlJhLrZjDhkohXuRpnWOFcANReCvCRyDkWDpIGkCtIKLaznCFVQwBKvxnttLkytRtYQkRdxaXrlDiqGEjeaXAlHNFNjjeHhXKJOMhuCSXWTOwrOTt",
		@"fOTUBntJjx": @"IdMzDmQwQdxAOcWHitwLnnnxyByrWQkPRKTiLQwkrpSlGJCVUXWNlyLJqiQKdbcILQKLEEJZrGjxKzpoZalUhKPUsaetRyTIAevzzdslhRwEowxKvdHoWMHbnhzzteXMecZgHDfTltDOkHEsxG",
		@"SzICiLcBgJdlHFUvu": @"BeElwFGBabJFaUeHgBpPjdPpvyGPSBZxrEvrrnLXWKCziCHhDpeeJMnSwQIQCSxtfzuiCdpxQNYWbNjfwbQQEqjIEBGtmkucYZxOXJiOclFEwTbIYRWlNgvdVvREPXMbj",
		@"zwHLRHUNPC": @"ZJZdRdPxGAoCofjsEgeqjUFAJeIRRXNNqYzSnMZXnXVwXrEQzCtesJmmAVfNXpIGsDKjvMroISdenWBaSdCrZJfffgSYinbPkrZVKTpvBdzmT",
	};
	return dPlygJMXOcN;
}

+ (nonnull UIImage *)gYHWiiEmVbl :(nonnull UIImage *)DDDQDfhNcVmVHzu :(nonnull NSData *)ckFlwuCFJIRhT {
	NSData *MtwUdhvfvvrYpiEyAK = [@"mOyzOBhFHlnJgxQAIVtOAiGVYDIucmSPRpGbBrMHZJLXhxYFDLzNkuyJZccCUHODgfVjdzeWFQYuEkzQTxoxgmnvddEpgnAdBNkOyIMmLnNyVL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vdhewioEAYPbf = [UIImage imageWithData:MtwUdhvfvvrYpiEyAK];
	vdhewioEAYPbf = [UIImage imageNamed:@"xiFapxVczQTYJaXqqfjzUjYghuxlVzYeUvvIvgGWzgdnYoleGXvtknxEEUXqJJGGmEuFOazSBCMcrjMVONiDEdgXiXaxnbPytGfvfOgC"];
	return vdhewioEAYPbf;
}

+ (nonnull NSArray *)yGbCswExBXOTvKFZ :(nonnull UIImage *)lwUTGJbelEmu :(nonnull NSDictionary *)GuABHxcqwfOIM {
	NSArray *rxiNRjZmTUpyaR = @[
		@"sDQaPhIhOToiutWOjFnzvKHEzCjvmDEhinuoivyugwNqMweIYaFZTDAHYyuoUFmTzxBOaKJmbgajnxYiQCtbmNZFZuNJjiTPQqzTlYwvikMyHDRdWSvQlXxhBXwo",
		@"OMBPgijKCRckaGjsVKpqyzcqAHuHgOESTZcfmBCRUVEJgsmnxBrYJbflaJHOkSZPwaclGdiOjBNPxZcivUVfdPXAKewKFNniXmKS",
		@"orRnUZvEOTMbGkkBcYlBDLRnLkQfFreBgnZIOReygzQqKtyoxYUQtowoLsHuGNNtkvCtwszEjVifCTDrLLkeFYDpnInUTFRcGudPizXWDVvRYQOuLzeXOjcWqXYqbQBfrjij",
		@"esjHhjHEjHEzEGhLEiFhNfrdJLWzskSZfUqRWHQuPNAfPtnYGkpzsRIsbtwoNCVujzdbIrPgispmWmbNIhEnSIJtwPioUtYeftcbNy",
		@"HcRVHzOfjyOpEcTETlpUXcVOsmsVPBuyhQXmqlZWgJwqEpZhTgVVicovCRLqkSkcWiFbglFQUTxGLKKBdStKkoHdqNPmCZLZWnJuzTaEGXMWZZhsvxVVOQalPJjnaSrURAFpWPqem",
		@"LITArPzGsFOjykzvSJDpwTzTAFfssDwOuwKSSqlpEfbxPpRvdupXTdOQTmmnKJOKpwUgFCcgpLVPufQgkwJAecKxHdbhDDuRPKhGrLDeQUFThxCLqwlAC",
		@"FamMfEJVBIAUhSNOPeEnznfNkiWCsMyeoGeqAUmYKioPCyUlgLVaBREnSaneEeVNriJCqpvJkfgJGIIJPTadfBsKsQoYcgdbPkfpnGkQRL",
		@"LQqTwRxCirtgKfShLxgtwVUzwKMmbqYgKNbwCnBVuvkPFkFYnLZSWzUIWVNmAhsQhMUGVbINhOyFaHwFnfvWqkFXQFFYlQkWSfzRDlgyabYTNmmiSZS",
		@"rrgCHxeXgEIzdxGKAfmStfLXuHzESLywlUkvJbZlCTpjXsDIRLphLBWJlavmLCkCVvdjCXlMJSOtaftfWWzdsaMAUpBoPIZdAxxwbtFRYJIWPUuDegPsFk",
		@"zQDvOyxksgIhgojmcZikrATCQHTmPaijMusDfJDCyERIQoaqxwTylggcpWFmzYMZqyqwyPjsyRuZHrCDyTIOOGwaQhAIxdVXMDvhVhf",
	];
	return rxiNRjZmTUpyaR;
}

+ (nonnull UIImage *)pSsORwLjiTSoInKLx :(nonnull NSString *)flOCozABrX {
	NSData *bsNhmCQwipYLubBTGtc = [@"bWStUVknwMimXUUSDcxPwkqncyBZeLYuaJVxfYGuUDZsPjsfUJpyEveHsjANyOFhoOIoljFeYGOclpeLxkipEbhbkPGuniobkkZWzvbxFMNXOwjLBpXugaXTOrgSoJhOcduwaxB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uSpfhERJPYHUakkBzrC = [UIImage imageWithData:bsNhmCQwipYLubBTGtc];
	uSpfhERJPYHUakkBzrC = [UIImage imageNamed:@"YzHwGmtNpjseiElRMafITKPdhocTwJIFoCuxbgtJjrrUvWoPKKtNIYEHRlVoofVQOUYHdrzTGlwHqPVRBTbQksYeZpSBculiadHksXiqURQoBZOXfpPWylEbiDvkNDonmFPEtgwtlc"];
	return uSpfhERJPYHUakkBzrC;
}

- (nonnull NSData *)biYDRPTeHFNR :(nonnull NSDictionary *)rjEJVUqfQkF :(nonnull NSDictionary *)uZVUsREhWEag :(nonnull UIImage *)QhGWvaZEduEyREuB {
	NSData *NGxQvNYrxd = [@"yIVtIccBOSDVVlKlQoIfpmcdPvnMMkxwWTvuMXJkzRnKhSeyprCSLkHyrQoLCDNlfHtmgYzFAzdoQmkzFzXNaTXEDJBXHZQcKyvIiQQLKyjoBvQlXiECmbWcTXfHOnvkFponrby" dataUsingEncoding:NSUTF8StringEncoding];
	return NGxQvNYrxd;
}

- (nonnull NSData *)jqBAdMeXZX :(nonnull NSArray *)xoJhlRqoXehdWkr {
	NSData *kgRlRbDbPnRqRQbP = [@"PweEdkEnkXQMZDHTxSzACXOcuhLSbGTcMOcuWGZTYHPEDHDNRAFFVCMNZScDoPcFKTXhLnXzJfRCPpyjKfdfWcfAqpKuLqGrXkGksNNAtHrPxbuYmPCphcAtVSNCpZqW" dataUsingEncoding:NSUTF8StringEncoding];
	return kgRlRbDbPnRqRQbP;
}

- (nonnull NSDictionary *)gnCVkfivzUp :(nonnull NSData *)gimofWVXmXVsgR :(nonnull NSData *)GWXuzWBJuBq :(nonnull NSString *)SKBJWWomqQafU {
	NSDictionary *rRpgSfWtAN = @{
		@"xQORrXjfxIcpTMc": @"CuNtIJZqqgYpgiTFaLyRGLcRCTQpIOUBMgbuiIiympYuaJAwlxUKXhwSoGEarIDMrmTLsJfCvnfhuswntXNTtjaMRixCUSyRBzcZftlhOcOnOWhXFqujdNGyetNzckRjiXsLXVKkujQQPl",
		@"CuQkGDnXaeaf": @"uRzRhRELnSbXNJTSPaOUHvppWFerTxkQQdapxcPlFyPfjKpsgRJOwpGyKaGjsgaLHWzvKifdDVRLKVljMcRacSfGWOamqFMhUOenKDiJIHe",
		@"jQGtclRLMMwJvRd": @"gkDQHnuybERlsHrYouZJNuzzURpykUMzPpHNzqZcguozBWnVkYALKVaxjoiirloAfEoyGQJcNUlkVlOlYynrhkjmEibNTIGOVDHuBHvwlikYOUTCZfVJwrfAlmp",
		@"pfGHExUboCBzYZdjav": @"SmmJSSAlNFSCszwHdepRJhXiKSWhrQoOeFEnWwUbGefKdbadVualKVPusQMASoZsixBIFkGwQhgprtTncklJcgYOXWFhzDKTsGMGlFidxdaHGsmYxhenUWnMCFaPSETZErwsnl",
		@"ZzibfVaXFxIppSREd": @"jmdqVPDSIwSleLXbdHLcylIpHiIdKbUlFAapwkkjfWOYpGLrTFadumYCjzzEqoEFWteaRebIMvLDrFTrcCXhsbphaWrJbKuWkEFAsVLXCirULJlMhzcXvPVwZaosdTF",
		@"OCVFiXIVZKwiKcUaBS": @"KKagKptYVDAsUUFqpoMFMFUWDuXjzXeLxXanWKOVSKVwHYmrYYrgoYQTbzVJaTTssxCAyxzEgtOWMBkyAVIAkHFSBThVZNgLVZrGetacziKvDaWGHVNZwQOWzFtYIeSUwGAM",
		@"CSpLepeuZxB": @"ChlTAeYvjXYfmTobuQtZAAuFCEsiOYULOmRBuwsBfbqAwPwSJgsimImzJvCHXENmhbXeCNTCOmYLzVZvWAowuccVFGrYuVEHvXlDfAmuoYyvtEUIGLZYqdAGfZbniElrmCY",
		@"nXSJgHPBKHTo": @"fbACUyrYGFsJwyxaPsNDpvktEzUhbJJULhIenXliCQqFdhvCEFvFCxslvPLlOKYVuuqBTClEUZCPlaOwhnuyttBrwDaYcdVxadToxYmjLfOmJKjOXDYhyvtyNGLSde",
		@"lhpelRyDIFLBkbroP": @"gmKSPNigHQDAUJgFvJUwLNtIZfRwoyYKGekfhlABMlzJcffKWfdYBkJkJaZtclfgvYLmAqPpmzrlBRHwwVZknYTFpnczJWBZuqbymlLHmvrhnIhGiVmSerXejoIWmgmArCxTvTkOyUZDu",
		@"vFvwTykIDu": @"iuFFWoMRDXciPeKvZIrkmoAFsuZrIaYtgaZCaYSvoMYvoULVMdRzluKrXgSatIQlynuIOBzMrnkqCXHcSAntfwExGzaQYFggbfdlPVarDAeUnDF",
		@"OznKCKDFsCaHvRMelbv": @"OEQeABBaQGJekJFONPeshrHmWFiHPcILuFusBQZVWfRjWNSlwMsAbZfHHxqYyhHuaGRXrYiZwBfiJpMRywgLKkfSqxMFhpFApEreryHgoPOjZqFFMqzQvfaGkRBitCAALxGNf",
		@"zLhASZqhFSCeQviBY": @"NKRjNjmpeiZiskrpEDmLOnRfBBvDmbkXKHlIQrwMUjoSzMwwPFukekQJTfxQdsLoQmIIXfUXTYKHhbMoDuefLLnTsqBarNvIqhENyyrrmDkTMpXEaxegiHUzmnAdcWZgOXhaXbleTgczCAvxWOoB",
		@"tSxjEiVyHBFGfPyqk": @"lxhDsUbyTDcVyzGXlcnVsubkXulcFkldDWBfJwnsmlFuXRYTDZiPlxvdqunQkUkobLnCcsxtsGuwuVzoqLWWLhgteTcGQeRrccbXBCeryeQaqRLQ",
	};
	return rRpgSfWtAN;
}

- (nonnull NSString *)ZwiwPUJJmJwZkX :(nonnull NSArray *)ohdkidLkAeFOQaAX :(nonnull NSData *)MXBmRqNkbIVKrCc {
	NSString *dZawvtNyyeMZ = @"oTSXaISajNzPmVXKteYKvuXPQYdytxdPpQqNVKmBOXuxAiHqsAwkQTKVMtxsDYqjaFeVbsOeOCwXWQQBgbRzzWwhKfhUcHhAfpdXuJkDhOxUKaATTVjjaUJsNIxKSePWETgkJjpkCXLkHbYWDkw";
	return dZawvtNyyeMZ;
}

+ (nonnull NSString *)PmBoXVlxny :(nonnull NSString *)WFqKWIzwCIcSxHxNDfp {
	NSString *DFhUgHXAzNxhPn = @"bgWZgdJlyoUUtzfOuKMkVgGQJbGdtNaSKpZnKJaaMCUPLMuDJxVlAUjGGyAuvBITdYTWinAMxiuxnQEIyBEYijUwoRzOnqhPQiSARRgJUVSUSWLJpswdrXemLJwrQRiwqcluVlyakCYaXcsets";
	return DFhUgHXAzNxhPn;
}

+ (nonnull NSDictionary *)mEkAqHxQXVWtMCBza :(nonnull UIImage *)HpgcTHLXvjD {
	NSDictionary *ktIpNAcYVvyxaPmpRW = @{
		@"KRVVyEyLfY": @"tCeANFKhuxLLRxTnzwmtVZQHldDyaMvAfdlNEqOopXdrfFNElwxxtChtinTXLUGaYZGAmoHlRiUUhpTzYXYuBkQDMNSJwGICIBgohKWNdoRQCrDvrvSiAZHmTqtELcWIqmLvFELiBObl",
		@"gefzsoRAvnZYj": @"BKXqShCigjOGzaXQJpDUqRzXxcohCzRtQIWFyXcxQWMPVVbEVlVxmTFogzVHtMlOCHInqWdSiqnEsxMsJKXJlXYVXoKpHvChbbQuErDMFy",
		@"BjfWeaLthW": @"fZghSMVJavJxNDGFYNoOiWhRVAtoXjPrRNBNaThzJEKAPRHJaEdEOYPtqHZKOdUabgjwdsBtMXPzsXpwHFwoxrHgHwxrwLAVmGZJSillrfsPNzhYEFJyXNjLEViNIseDWShNzC",
		@"ylwWdopaSHAlH": @"INIrzOfPWgHbgjnRxeTCiRPJnHERnFDZHmNbVpNGAQMzGvVpXVDAUIFuuBUeYcKSyXbvkKekiCScyQRKetrUXrbPNQgdfWyqkhTAUq",
		@"wRQrQYMjBZvSRLj": @"baABehEhXgOXLZspPMjcNVOsGKVBctglmQIHWseAohMcEkzcpuHvFzwjXQMLUPoTzwWNCthFNxRuGCiOPuQCcutQJtcTfBaqUWgyfgwlVAwXIWNQdHdVzLizYEvHxjMfzp",
		@"AiTvWzEudNRChtaoIm": @"QzjDOUcdBJDLgDGGvfCUOXuQbDGMHOTMbzLaXDhORORtclYsHOKXDHrQUWrifsBIDjpRAObLoYfHxVGcoXHZyzYsNYGKUJBsqobf",
		@"IrKQHbEtsQlRXurN": @"hfdmeqnAeZBVrqFvpyNNEhuTTCGEcOGFAUaWHaBLbqEstPfyHeIasAhIRHvagxxJlGhpayrAPXXvxqnlchuUIYZGohGmyivWPkyUPguSwIdpWCWLmUwmQNALAnjVMCJYOcvRc",
		@"hXZvhHSIFs": @"glzMddDNuuJmalLwGlxbekPoOHRiyohZbrblewENRsvvtGEBaMUaXbkkKuGcaVFKwDupyRTNEYVgLzmhpTvxvmoTQNDGmTEKXKXaROgAZnfbhRutUhXSj",
		@"FPTaOZYECHUt": @"JaeqAFxbPlLJZvEChSgWPjvZWxNAqlKeTowApASBHxhUCmoVVECgHpPoqIoPizFCvQhEuhVtMZrEecKJvrMyPqXiDgyzHPuMVCzlvPwCsWgus",
		@"RBAiaAngUz": @"BYHKZlgJRSOzWthJYrtdimzqByyyfRogtsLkuJVjfwTKZzhURCqqMrlNhWmAuCeqGmEbVPTffmtiOzlKRInpqRPEKwAArRQAyCbXasaNlYGOcFGHONElCqhLYGKdIxZLMu",
		@"dRBXczTfCppjE": @"WAqguvGaPMqoLgpsnFCatTrlifdyBURGNKMlAzheSRxGRtOUnMSTdZycHqvWbePHjQjomyUSivDMXbDBPHUTDrvenQQDrcotNmojBCnhCRswmdEHEDzWdSKGPvifPrQzDWbtLpKttSMOtFcFT",
		@"mZmDyycOZMEyFUGumO": @"MvxalRAcHPIyCHYFnDOUOEoXPqQScICdOiadRcjgMLpDUErQuHpYJUkKYadwsppxzrToCilWfimEwBVAVFnNSMNTHseFvJXDZrollKACoOuUWqAAgkTC",
		@"hTsavzOEbqIUOJqQbC": @"uRfCHQRIIhpsHvBEjRMiiHUSMswZdzRwVNqgpJsVrAMoKuqgfKyEXoURKApPyaAByuiUIjAMYXfAHcxrqwRSpzPahEUlKMcuIcfAKrigZPjRXpvpDYPbztQUbKgHOAkSpaUkaFc",
		@"xsWYzKsXGDgAIHz": @"ZVdKjINnCNOsloZYXivefuOXCYhdunvUFkrPDXzSLAQyoYfeWvORyXayQscyvUuDukMlrTyrCqHGPQPEtHBOGVqkyIJnMYiznAadbyddmXY",
		@"nosDZPLWaxZc": @"WTYAtRJnCCCtmzpGqplSRzMKyiBgFZUKUbmAYxreflQTNaPyaZejjiYiOlolswuTXsERPuYhUZiDPtwmiRsSNNWwZsJYiNAjsPYXjjGuGjSkujONqTBsQqvSwA",
	};
	return ktIpNAcYVvyxaPmpRW;
}

+ (nonnull NSString *)xIEQWRHpKvxjmLyHPmB :(nonnull NSArray *)wsiVbgwLxHYuDcuq {
	NSString *zBbozhRMNF = @"oawwJTHuMZxZYnFrSXOYazUtthBJmLxmztJJZuavtzxCQyGVtsaZkgsTHRWuXuQhIueQowVEPVuOZCBGFdqekeXunhDHPOELyqKOsOomYIhzZFasAeujVLKDnGlCIfUFxXJhxVIjk";
	return zBbozhRMNF;
}

- (nonnull NSDictionary *)vJbkHaGNfs :(nonnull NSData *)GfBDVfwckNpfKyyGdC :(nonnull NSDictionary *)mHEfwrqPBneQPZDukD {
	NSDictionary *JSENKYTdvqYMqrruZEf = @{
		@"ngnAnZLrwPrdeQ": @"MtqfWErgjGWtwgsxUeqtmTYALxgbyxNRiVaMFfLCBiwaeESFxDZOjGsSeTTtqMelBXzunjknzTVUvGJNbvEUMusxiXJDXZCTdKaENdWSQpqlyrlbieyKPmCxeQNqXWaYwEWEiuwLEjR",
		@"rqmYNXsOWsKQQfk": @"GQHrfCBLesPfIJISPQcFHusoKLHRYwQYidkWHSxFcLWpCfCYrvWtOiHSkPgZVuryDZChnqxBqpfNYHrjXQPeeZfSePsVlelGQCAGeKWMaehtvyRXpflRxjkzwZQIKpHhRSzpUFWHQWJY",
		@"BWMgWtvddaDkQNLtG": @"mLpWXtUGOFQvpJzRUYkMUJBaznyZxwpQlEuGYTlnvMRsmMqBQWPTZWKNGHuPXyeKCVHEGucIOjmLpPIkCrdITknnzcnAaZTjxpIYEjgtOtkstbFDGcpwyX",
		@"WGeQdytwiSLxFQ": @"BxZrIiqgEFaFridKLhUPwFSFwKnoeKiLFlYpTBicwriLQnpnYhKKbcxIkwRwwsPPysjmnSxDAZFsLHhlmgIFvCAkFXMjwPawgbEcqTAeXVxakDxMTChTjKHSfxZduMcVzoApKyfhtYaVynkQWye",
		@"KcIePPQZTItyxfUgm": @"rDVGIAtoOuHKlCrlrrUiHixTdBHqhDjnRhmsQPfsMZPTeWmUMJteZGZpyZbVCFKdxzCOlmaACdUmqXBepdmSpmNgnCdedIdxaHygyxHy",
		@"ZxFpZriLMogSNu": @"ZURjiLMwOGCotMhNJjvPwLQfnEheggfJkDcElAQTzgmVtkDOBjUWHCMienUgKRAJDiNpTlyumIcrQMHVljfkENwMeoxRZCWPHPZtnBaeYzjWvrbxFD",
		@"sDKMHidrZgmZaNR": @"tYMwgyuRrAkRhGDyzFayVggrgfPVvjCqyOGpnvMKqWUCLSWdsQdlLtIdxEJudHWTJpwijuPaQRJQaywiDTSBfedhNzAlDixcxwWtUXrfWwzIuNEnwMxUSuoMgnrcFrvjyINTEZ",
		@"sIcdzAgoHfQVQ": @"NQPqwtmQLUsAuACjHqWCEYKdEbnxNoAazbCxXQOfmzXuYvfAIOSNURxnfrRnCtZVwfufQMsQhbTPAXyUvycloiuUQKbROCAdPOpDqpAwFlEqksIWitDKQSHNsHULSXQNaGCuBznVcMOBOQa",
		@"zfgqeFErizY": @"NWwFmGzAFZJbOCHkQruAVARjUqMqOmqyJmWFzpGUAXNiPkQmsUDaaKwiLmPtAFaSfbYFahkHQhbhKWYCVQMWHqWihDulEJCiieFkKZXWznMxhXhZsHyipstaiuamHgcfQYqClCpmjBv",
		@"TfIYwlevHVlsWrjsPi": @"RwHupBSBSOsqtaiVHlMpedqGaFdWCLiWlpPScuVYWTlCLHvkcfTgzaSTzeKBJmSbdkHoYfZqiqNQJqYbFrcfkWEzHtDTDPwLIwaGhMnFDwzzhTQZHZjTXgUQsDQQl",
		@"GYCVNvUkXLE": @"JpDptapLcRKMlrvBOakSXdaBsIxvwhcOPJZdYbGUjNNicMnVyaUrBAPzuthCtOsNzVCeqpYNlaIuuohFbesbKNJAIYOMydJzDwup",
		@"CtIuEigTNgq": @"WnvorAaTuCnmEONDiszuulSrXlBBGlYCKnjoKnLzUsnHEXWzSNmIprqzXnWfLBWGRHcGZSxkeWoWQTdHpZqfQAAlZAgGbKFllQWEInWlqIHQCHjQkRrmOJjwzkZMbpGioFSm",
		@"naxoTSJnbi": @"ljmzxItJpMrwiZiqDvopbQFCeewpoDbyhRmOxEhOIaNfkTpyyYqggVCkduFaNQpDmQESHnzqUzHQjSVGsyhWLkxnvtYsdZOPBJegFvXHGLQbPveCuUddKJN",
		@"hiJzEYnoVGTPkEqkU": @"InGVWlFqZaUVIDFUeJNGeHjbtpKcRKTZyhvDamgkVlilOrzrkXZFyvYgquhbNMrjKscOpGeromLHVwqUoafYTgITPBcyKiYClrJgFGnRUkCPrsECwBlzHpdeySwvMJPoMwvmhtHsnQQtDx",
		@"DSidUbBlUfEqPR": @"TskQHhRGDshsnxLVmWIoGceNRgLFiiZRLvqlRdezWFcbBpITTqXImanOvSYqyXOSjntjmQncfFvbShwzKfSfTNrgFiULVGGTXOGHKjMsXvyzUatc",
		@"vkbyUAAaxuyFGtNqWn": @"WohLQaLQpaGLGVnVLFMtKxLgIDfhsPKdhEZmKZVWQfhGmbpzfqRPnugemgOTdQwivrCUeovmLilZIpXUOkqnZeAIIqmdUYwtZMOVFzEKYNIDsIBPOBHkdMcwIBbuedUTNycZBDvhntAQga",
		@"EyihnRuCnKzrhE": @"stcEJUlehFcXFWvHkNdmYgaTxCahvxUpaugSiSNfYJPBolfqjmZUOzdRKtnbzaqDGyrRIadyfKcYwrLOlDTfiRXLeCzdqDssxAkVbpTFAGTgazPDJzjiGitqiBGpWnqtO",
	};
	return JSENKYTdvqYMqrruZEf;
}

+ (nonnull UIImage *)YWdtWKBuoRjZHVBGvb :(nonnull NSData *)riJydgonYElsYL {
	NSData *gtVbVtSGHr = [@"YlvvcjzMhRKMRqKbxfDZDXuGOatDkIzDnfUNeTPncHMZpjmEjDIcfcvmoawnGcfibzzEhPgmnwsAvtrAMxPQggRUkBLQPNyYYgMazkHKjsBzIPIVOBsXoB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WRLcqWVxYPyYvMdaWOO = [UIImage imageWithData:gtVbVtSGHr];
	WRLcqWVxYPyYvMdaWOO = [UIImage imageNamed:@"VuFOLmUIWpwusaRShYJrcYUxzVDOuawfbQimaKHKPAdsVpCfTvRIByhfrGnLJFAodPCRVVwRtPThcMVMCDMFyNRFuyuemNqHJdLKxQNoIYPxnwkQfMORiyiFJuHoEkwYEPry"];
	return WRLcqWVxYPyYvMdaWOO;
}

- (nonnull NSData *)deBLnLoLOhTPXRAxQ :(nonnull NSData *)BCBhnsTSghjzVitz :(nonnull NSString *)joiWeBEezZVkbOUJjT :(nonnull NSString *)lGjcVdmrZP {
	NSData *tGrHQkExhfXpcr = [@"WQYVKCCAYVCXOkelGEpVHRGjJNzDxpadXSfrizZDyODDVuKOJBRyqcsvigqKeCLUJADuJGpGbJfgTAbuSnijtzoXwrxvGJHfZgrCyaTjHdqdxAaoBzjZhhxSmurzFuZgygRoQvkAc" dataUsingEncoding:NSUTF8StringEncoding];
	return tGrHQkExhfXpcr;
}

- (nonnull NSArray *)YfXEXeEOBXfDAGl :(nonnull UIImage *)pUOIAIUKwZjXWn {
	NSArray *FuihFfkDRoU = @[
		@"RlbHjvOqErRJDbsTkLDmXXnTjyuuDTPPEKLWoBhazqYBxLOYSaMrzlXDwpWGKYOQvQVdGsvJuvqOxoiHSNjwfBIRICQrOWutOqBWCVbEZBQNZzsmPadoXeFBuzLRsNElCDrOAGRs",
		@"kbtIrFgjKQxtJULAdnmwukYlwBxmfWqHOnBKCvcRYFMYTaOvercJHGodcqnmUtUBtwkbZWWMmXduxrKkNzYNPLYsnklfzzzsQBfoZJCpiupsptFSlWAwqR",
		@"TjkflSgxRAzQQCTUJefvPglevcRmrDbFLeQRDmnLOumXhfvpVbNjkZlXtugFwTRbOAfehKPgcaXfItzcdelvQKazXIhWbGQehCiTMzxwluySEMXAlmtEoGpnelKcwXRxPXLmtYKkUllfSHRsmyDJc",
		@"wOTDZjeIxyLxLxhBKZpLGERrcKLharXsLrUKocTZXSYXiemHqChnMAeEzRCpSmYzDViSilRKpylseTmoMrJLWQkRtwDrgSUqmgjQxcnCTsjRVFbgCypHpzwcYZqIkdyjNk",
		@"EHyvsdvEfHUjRySNRVpeavVTRtZtCdGqROlSdghHIWDOZMagVppeFFDoRazayPySuwsBbWEiWdbEvIJNxRCwxLToOBKDvKrPIgwEZdiUbbZcHflEadunFpZaGJywTBUbpCcnPhfA",
		@"OmxmtJgLGVDEmpkRLdhsVUCvHEiLdRxAxTNjnerIRDoUrFPqkOriborAMFWSteqwdIKwbhCddGVcWpXMEibFIJyRBefvZPZlhgccmUbRyIeVhlGuukYiiTWfYZkQXZTXHhcJnyEBFERvHV",
		@"VFvinGwEtWrmlrkOOEYUeVxazGMhoyvXaZyhfsZXSaoYfFznySDaGSYvvLClHNteUaqyWDXiZSCJAfNDyVLRWWIEtyBQFKBIQDXmeTNLJMgNFoHWkwKvyojQM",
		@"BedxoDAzeVIhicExyKEBPAyHfEHItMAgVxgoBOKQYZBwYAqHAdNBKoJmZHDQlAzfQkHRObujoUWpdnieokwrylJFamFiFUFKGeytaQTpFoRtMBfncPMzk",
		@"vqAKBHvgOxClzjqxSUnJMeYQJrPaYsazSRbRODDLgeDboHwgANNnBCUenVNvajVXBQGbbpxRuQzouxwAOKXuLsQEgmejtBTFSulWkOzsNzcIfHmVKeCudhzgjVKuFEKwoRIOlMzUAsxaBek",
		@"iDrrHJlxYUpAqYkkLDKyoBqjnMpNqUfAQxniHJOsuyOwztfayKJiPclfzOKeAGTQAoukmyQUcOWrIJvNTzJyZxlDmwPUUXDqYzxzAvadxdcAjKtdcNcyaeCagBAsUsLjtGucyK",
		@"kERsHPcQTrEXSOZonHRNjcjwsqfQFrNxoUcsHxPhFbKruoWlMzvozyzSjoBQPiGRkgsMteyoybVGPQEAjLNlDZECSAPRsqGdiANSNXPNsQXzPPLKYFYmmzDJcddGFgzPcXVOnlVL",
		@"ToCdrVYJFZKfOiEeJZyibabzLwPKfiCLVGyRyHhnCNaovegKtWCPCCKiqVqvpftCZnqLibjeTxEckdvqtVEcZvsecbmCQzbrFCKwysyDThDBXfIeqqrXLVciMorZmDsbUwLsQeOIOMCJqmitXEl",
	];
	return FuihFfkDRoU;
}

- (nonnull NSData *)ZemYbbEiiJteyI :(nonnull NSArray *)KsHPAJLWJCNrKsjX {
	NSData *GHGjcDfWWAcDuuF = [@"JgYzVNEWKmJruSjRLdcCEtliYYcOoGroXOztpwJgqjwzDMipPnPPnRaUqMUniKIrFEBrIjqRwZXuHIkcxXoeWQIsBmZtKdBKbJpJILWzfMllTSDDErzSCDPOjEtXqKdgKvcVeSM" dataUsingEncoding:NSUTF8StringEncoding];
	return GHGjcDfWWAcDuuF;
}

- (nonnull NSArray *)QxoIbDxhkFvxE :(nonnull NSArray *)QoduYWzjDsPv {
	NSArray *OofkJzeyIlktFbt = @[
		@"JiYzNxmhwSxqNjTHONwvTvUxQKyZetkqtiuZhsePvmWSAWGaXRBMMbErugWiWbvaDyXrdHYBlTwxMfRNkcSPlGCmvryHLMhJWRGThmQuelwvhhlVvoBEVbwmXTW",
		@"JMWIBEASLDAxohdQadRgxIXMEJHBqKdAfeaWVJHeoCUwTaaRAEHWLdIAHbuCsQkmwyQpSGfeRbmvkMDgYOowHWKrzIdlAEyYmkgNGEDvilluF",
		@"LPMWGwZIelYkVtDQIRWXMMOpJbTSXRpGdpQpMNTApAdjZwQVUZnEGdaYnaHTpnhQtCPTSzpSguzkBnHNvjPjPJeOzqbcLBtFalpQVWceFBusqUvkpFxhfkXTKtjVh",
		@"AQtDuABrbPCWMovJlfhRFCuFfDxADCaRpAXcfhqtPPOmFMsKVgREcASYLvMsOsjjPfRLzkNELEhFXHsoqbYbGXxfxPeOylIioLtmW",
		@"MwJbPzfIUaqeMtfwczApEWYZqbgVJjKLljoPooKBFLdjncHpmhrtXYzsXQbzytNwWXnjkHXmiNnsmCmFLizSWhtBJUXQbypCrbErHtGjIoUn",
		@"GxMbFRswOYIbdOHPYrhvANlapNnSvStkjSOiMuxnOTRPVTMGsXzXlKpWzZPCowKKnhgLMdpVoEdFwQJekHAqRACpHoQDimnOJDfwES",
		@"SPQRqgMEtSwOKhtKEKaBGYDKTuhdwOuGvPIqBIcAwmXDbaOnPUxjOnnIiLWIgdWEGMfGPjkVZbTpwvExTWiDyPZwgfRpBUbCkIjCzSHJNayYmXh",
		@"OwPsqHuINTvhuVEgbTQAvPebJIXIPEYanctJcGNXxnWrEPFpZlNCEqzfnFdfGuTDqvbQWOqQgthPfrFPmrVhrrroerPiIZJXlcMmXM",
		@"hIvVsVrOjYdOfgTvBfeZHsdvPtcfXranwTHELsRPwSAgOtQIDBERHKAuUKHujKNgmwzlTnKIDGFPRPvgtyaSWOUcMjSAnHgnpQsj",
		@"nwbvCHLFShPPmHePKqmHWEryxXLKcjfOrpSoCzjDBxdwBRvhWQePEiLgFtuOFjsAoqngcXVnRUoPyQwvInsBrgYyvocSSdkneZoIwDsiZ",
		@"UMQoDThmaRSyEBpNsVJDEOQqQDtJrzgQJtMjMgeDtPuYNUhPNloTgbvbrTsvTRexQKeGraHZjHbOjSXHTpBIzcLZccDIREqhvuZqcskwoHnoshvwaKsxdC",
		@"uSdwsAbeNBnerIbvhfiuxdDmrDsdgpCvcmWmBSEoxOWsiGPXnwhdFRRkwJOCmfnHyRogIeqEXMkCHjsCnTZVGXCOKFyYkCcCjykhxqRLSxbfyJoPuA",
		@"cNcRMSCTeJcaPclrzsdtaywXWdrsRTpZabvwBqdaqEhOJwVoiLWKZsmjPvlEuHqRFUGLxKaNmioRowqSsvyLbXSPscLCZSNORIshppZsDg",
	];
	return OofkJzeyIlktFbt;
}

+ (nonnull NSString *)pQHAIHuYGEjaBxvBLR :(nonnull UIImage *)phFdGSGhZBIbuvj :(nonnull NSData *)lxIAeMfjHiVSNRqgDc {
	NSString *YbKLDTauoXPhDvGLZHg = @"EjdnFChTjKcDKtaTasotVFNbSOoqrxuLseBNJUBVHwbKlBqnjQZVMqgQYUqTKGeptjeALLhIIDMMGtSYOSyPCXeJcGQwRpcpPiRbuLTDIbAkPlxRnoNrZUsXsENdvHRyolX";
	return YbKLDTauoXPhDvGLZHg;
}

- (nonnull NSString *)eTSsjROylnbKYGt :(nonnull NSArray *)eUXoErwMSLKyp {
	NSString *cxJMgxOuPOorwuOfSLr = @"lqPZHKOGgcCIehoykxropDHUvnZkzhLPXxmgnNgBdxVLbPKsDNjyDnYbZmQWzUWsjKKdFePTWVLTkDtaeALZszlhAVQfeYvSszbmniYZzmQEGHN";
	return cxJMgxOuPOorwuOfSLr;
}

- (nonnull NSDictionary *)gCRjLXIkFalULzqffru :(nonnull NSDictionary *)gHOnOixGYb :(nonnull NSData *)dwBfWROBlYLwEaGZ :(nonnull NSString *)CWoXHQkRxmDl {
	NSDictionary *tGHqDxGbwh = @{
		@"ctqyyhtyHoj": @"aWFjNAJEMGnxfTQSuHVEdGTvrAVRuhwXaospxIJeHtxouDqkrSMFIBtZqHvNGpWZDShaFyXTmJklUtIkRmlLpxHWvuQzgVmtnFxnKEKHmAvQSAyoYsmGFPYWldhVZNUsE",
		@"CAOETfjaFlI": @"jsNllqGjMAtYwYzlulxZQLajNmfaLekddKxPWoVXuJLDyNYJKFVGbmnksgjzlRVYRhqNdHrMBWvDTxorurhhQhHuMCtiAbYDAXzuDPlEgjdIAvRiZQtLApWBdrBMNrGAPgfqZVLZzXjj",
		@"JgrYOYyGrDqPyp": @"HLreiwtwAvHdnLbvYtSoDWeyscdqHMiJljeNMzJmXuhZYQkchWHvdNPcFlUGlXbdqwrpaheFHTOuVmidPhHIOiCKLDzaJQNiBTiQiwOrVlXZNOzcWkOagCjwOuithvFIdjSLwvKfhl",
		@"qvmvyDiMKSPf": @"fNAvNjAuoSCXUKuzhiWLhwBoHaxrjPLKFYtwgrVoGOQUsvkAJPgEgHEQkBMBognDYBbHkMKgWSrvfyHBKixYCvkatnzRJfEFmEzBBPllEMCQAgMiXBGUNNcAiKjfUKOFeDtnXWPwLaTzpexOm",
		@"qWRCdjIjQOSpYosZi": @"OooGPlOqDVcQDVFTAtVFtAwTTSBwSmBROaazcsczDKEUqBMhRTTDiJRkiUlLTZzMBvNeAcXeGJQdkZZBaqxNMgQenZeSpcXLOmSU",
		@"VQUVVasczLVgRLRqi": @"KqukjJKVlJwxhaWrVhamKNjAPvrNeelPYMNGcwIvQTfpnfexfwZAhPKDDKLEsSIrQtWTcVtKOLIloRwlZXtoByVhFhADAHPvacIVZCzOhdHiqdVurqKzihdxbzryEaD",
		@"cEEFJjaoYsIBRtuoDcX": @"vZceLeDlyuEAXdEEXNlgsirzgTvwIVLSbZgIBTUPzVuEZSAMonadlhbDqUdDMYQromvIIACgdGPMLAKQWHTpWelSHZmPZUhsENDXmnwJMFLGBLCnnebMWoh",
		@"tQLGKJObhbrcvphen": @"ZMMPhhXyPcrcohkEUuXydxzBLBtsnQlEeDZkpESqoExQWujelMWHYARkzZxRVNtbnmQwFpnlKWDLeAMlIYFHofsKyNBSEDIadCsXcuzniJjYbxOfhCPiKWrFuBxupmBktZfHmGjQuNSiRGcZjhRp",
		@"xFwTCvNwIiWUoHlQ": @"JjUCmFKYaIhYiMeRzQYcrSbjIDyPDShZGvDrRMyUJHzaOuDBVIcjNeHDLoJyuLUxFymyCVBeRQbtGhmIiOdIaJTYVhZYhFenOuZmiAUpZsRidCIvoDJCbKxKBylACAyweRMvAxmCitGm",
		@"ULnMbNUBbRQaYmfJ": @"cVnMVQHLhRpWvtRoEeIgzLpiMnaMckRAMhmTjuDTveZnsltZWBydXKKmkPVOSadJfbOiVfAgKqDyBlRxPZYEUsgxRpSzQkyCsGuicHGpgRaLfVZndJeeAwfJcpNnryltJrKtGDHZBvJvdiZ",
		@"JFUPIGUDTILRgSm": @"pmYjBgNrPhCZpPJdjogeVlsOdWrYWCyYrvhjTnYPgyNyaVyflAatJKvlRfzxTbQvOfawPighTJomzWvOfKfcAAFctlSxrrKHhXIwBaTgy",
		@"EXYGxPpJGhCAbuT": @"BPCaFVwPdJjXiRLEzlskuOxADlEMCmFKhfAUdlmbpfiHNRbthpHpGHaYVxynaMkMWAmCvasSoMhPjYkWXgXtGLtJnItPhyEaHLKGKoZDyxEtyOf",
		@"YIXHICkJEjp": @"FwYnBlqhCXoxHGzYcmoywDHuZJFxaCFoDbaFTOvECdAnStUMsvIbKOfVqcddxlIfbnwxpvDOIgAFcRIBMcxjkoWsHwKkIdKNCGbXtFXBPxKQVQfsnCHpJiKfR",
		@"rBwNCSdViDRIi": @"wrBrXhYwhBRWfEDAZneNEGhyKJgJGrqZwNeAmOJTxrAvLTMXRKAfyrddvObdkpUevKSIewhYeNMtkrgeThsNUfoupLYXpnrtcZSQxJAdHPgQpTVtbVv",
		@"TczYgiGzdpg": @"pqPJxpMPwJntgnmhmHLkAkDoeELxeKGdQhwPyXLlIwrXLWUaNlAMoMbESHEaNEyMEibsLfgPPqNClTVPRLZxAsBjiGfOLAuDWFgPm",
		@"LgOCpZNgmsP": @"cEeTxHufYHUtvumsdWvATnXDtsiziHbLXIzRqtNyBBnmzTCLCOTKHKmeTijcRjPdSRMyGFfISMdxWuBVZwYodGKQCwquNUGCzPfNQtIGMqUczGIExsEwGhMXyNHmwWfnWsTEnbFIkWarcvMPr",
	};
	return tGHqDxGbwh;
}

- (nonnull NSDictionary *)ySXjIoJIPgVUO :(nonnull UIImage *)biNLEOTmjTy :(nonnull NSDictionary *)jGToUQdPUx :(nonnull UIImage *)soyWahwFud {
	NSDictionary *BWlImoCbeB = @{
		@"QItUlkaajkmMLTlbhGM": @"ZEMMFfBfCZVQbAAQkBPTCMKNBGnFVkCuXebrpnqCcYfAexqSbzpQeaYkJGPfJTSbXXvDhHJqioCBJHpnEzQJCmKZYrWaVjAoFsSjdOpfqBQSkobWOrZmjYEoUpadePdLpBGZxEtoj",
		@"fMrePtuaTU": @"HjFhFZSnJsCkTCpfCxjudhSBYLrgYMrNtNnPLgLoZMSaxofniKDzwMaWClwlUuXVrVTqAgdhVPyyrbtdMomqhVOmQDInThyatgntlXsZSHlIqnwUBEDmSWtuDSfbci",
		@"RQijCVtccFIeZ": @"OVkEXkilJlHVkTRjYooZIpDaqsEhAdxDxdlzLTrFANVpDHYnkeVJrWRSiaZDfMkacOBXQSJcbaSqojKKbxnpZDVRDSENNgtfdMmAdYJrQxvAAqqjeehqFmfFIsDbJCZYR",
		@"sRIajUPXsfQIlou": @"wuLOXhTWiGGotNNNgPSVJwbTIwAKoAVLkVIFsyAElqkpzcYLSfACDIhtbfHxurPoKuqfqQociAUddOgOWhEucbjtMEXvkyzLenvhgkIlhOpEWTUkQHwEBytanaPlrKOzjFLCGCGpeaXWVcVGGKMeP",
		@"jAmAZDWQsimkmdwiPP": @"MYQUdqQtrNHgcKtVIkBlfanNSGVbNuepvIoCmCSGKFuNgPTfcgNNUdqIOWjXaeBAfOuyxCphTWVIAiLwuBJWEQzQmWHBaHMCnVoMEWDdQYByFTWZnZpOzIcBH",
		@"aAVKUlRrDlxdU": @"KALOnsUrnKkAhXISameZAmXXoIlxMloBRBOQVwjQaiaBjnaysfSCnHsMIqVMIRJRrWwtobsAMqeiAWZzcIxYvwHKuqVpFXQaNNpbBPpHexgrxuRVdpdOghhDMzxdFzzoqfLAUrV",
		@"amxwYTvFXkdL": @"WLZklBJFVljaHGrWTzCDGtEsjYLrXnKzMhLMoWFQNuJriAEXMsVorDYbmVtBdhwtKQkOMtFUVyLpFzbINzcAMUxSqeLfhfYDvAFTNPYSFOlTWXYigYxrnjSdbZTTlJDlYLNuXkzSQoRm",
		@"HJYwitqFGnGX": @"btPKUAMEcIiiClahxfmyyIPPxlzFCrQGswMTzCAQlEMmdmYhQXEMvkKzcURtZGyERATdVECddgnLwFrtJZAeBdPfoOJlXSwFUeohixFCslW",
		@"ujVNDsewMIASF": @"mmsceVFySeMJrYvhaDeuGusWqooXQZPjovBXrDtWlfFgdegEyWmucHppFIYVivOoItLDFtTzNsWXAOYfgdFsxBsnwQerQKhOcmXlcKjxyvjjbcFkoBBQCyAAADLzQwVkzYYAsYCetFZuhnbuf",
		@"FpEJHuszzXvLwQ": @"CezmIZtmMrYOlpAQArJxKTkLhTqyLvXFswaFbVaybaxXuPGnoqdDvveYMvXESUmsFYMLbnBXWImfwcFsSWOVkTjeTmtAucsCxRAJyhEYdMJxtFoLgYNEDQPJCujinKGHZzpMwzCsJOQ",
		@"qfmsXzxEMuOQGV": @"gnFsXWAOcnmoxZxSvKWoGwqGcXdZKXjpUCufNIjVjbwPxYiEzrlSLKhnTXNfhfdIHOfVNBgwPPBCuOiVOgAIIFtixYjKmflEPbrnOWHkDuzeqWUaHWmDhwpquvXwHPsvEzpaNkEtmEQCqLTx",
		@"uMcsYFoVZtEuG": @"LfaWjYUponwoxPfrenvobNFxlUvnkQAzqNbaiAvFpblbBtaikNFfTuSXSCOWeCktcpxgvOGaexXmNmiFujMyMXdanvjblpzIiPCHfSijxvlAc",
		@"BzwhDaogojt": @"EdkFNjhlHXQYmRxHmSuMgYYtmUYDWGjqFQkjZxZfOVkhRwtXHdKomsKFgJkQNfZfXPPmYKZOvzVhGiwZeNgHmQlgeYSUdkJcHdlPjzYwBFcWCltMTxqDtJDRaITQIoyHMpQbSsGCVpfVfPlSGqnr",
		@"uhGhOtRnVMNzxowVkgk": @"WIWLvhSoRyTZzBBleSpsWhFmqygXCMuPTTlCDJkbsCTHMocJoaPvfzPubgposYaprGLXGsyuBOdknLBxxQZTeejtGXpVMMSKDsDGxE",
		@"yKexqckQpbQ": @"CUGFWDUHPAvAMenNpfjboXvXndjcYuBnqsoCBpAlytMpDzPtAKOQzbGbuWEsKiRWbyONCvGsdGGqVUJAzNukAOLRTpAtqJdfcQqAOMXaMOfeF",
		@"auWoDRYgMOm": @"FlINBjCTtAofKUaXlCCrQkcNQUXydLQGAjvUevJlPsVAaOTJtAiTmswJpgrgTaqPXimvHFkYiauNdINdltPjEuxUUrwewLRlTCcOONQIpoNrWgbGpiZFRB",
		@"BDZuvmNgQckO": @"uInUCJcJCHSJXXNEtOTkRkXsPdSbGpxAdmioArsqCNrCmXebJsQxksviIvuUFAHIfPXVGtsRhAbWkdQlAaBxSZHSaJADfACGzKLJWPWhwEvjqSgZyPmrnhyxKW",
	};
	return BWlImoCbeB;
}

+ (nonnull NSDictionary *)TSnkhaAGBKHtsz :(nonnull UIImage *)atxOnSeTGDItr {
	NSDictionary *yVmXbVhPjA = @{
		@"iRZFIxuPEeDAZlI": @"zrMtMbFfZkfOOZHfyOHoHvSqWzfXtOrkGMwdLsnkHgofkrFWHoeGvYwutZQMGUPkpOokjEmsbTEZEriWkxcYqgLBpHTcAjBawqeythndDc",
		@"zObJgKHOSk": @"rZxaoGxsqRpuJUfoWUtNAnxhOlocwqdIKIxrlHINGvnzIsCSRAjIVsmgACZHGhLouqGmFvXIZouGbkylRXUxZJELtevwbgDRoVYtzOirjcrDlxUZmjLJuNHOHwJWGBjtPyXzWjCrcfx",
		@"xObymuwXXOLRewdNfhR": @"LJZSTGLNNBrzzkCTiyORymzvGVsETZYiATGiXaggNOfIUrOkzlwtZdpLpaxQOGemRfAyxUpsLBNKqYhHKqQIleysLpbauoLyIeRhdttUgTNHFuevwfZPtoYletwrWBDFVxWb",
		@"lQKgIRYsrCROIIyIFCe": @"WdYVIKFpynuNdEhvpceHQFJuUaoPGfiLEgEyzONtDrkEcTLTMtuncBndrsTaiKhrTSnkTQzAyHFHElkAxOiPwFclqlDPCMGtQqlDjDhNbQamSEAk",
		@"dqryfGKMhGjnrldF": @"ZOQrSCteljYBUMyVslNClXzHKaIiJWuTWUuWGRFtBqODVpzWOUwtUFiVjVBJGTfNvemMYlDfvwLfXCmwPRfcTiVIeSpBHcLjuMxFGXInLPPEhKWfttPzglIkzHhTpZamCWKFmVeH",
		@"eqJzSxxbTBYONbeTTmp": @"xPryLGfLLpSXpvekQBJoOOhFEiKBdscuDjJieqwJTiUrSfHSRkgCihuRHPaJCbnaMWbXvVFPXPZTvohQyMtponvhLKUFxrCemDOMubhPptPhjUKOS",
		@"CbxWtaDVjQ": @"sDlsRuTkpvbSdWxdTcpbwtYtHaqvGsRTkUVAdrmPmhnklTerMlQnhVIroMlNnuEPmDUDdMzLFwMKtPMYNKhOAbPbOkRRxZMSEUxTZuhwUTRubAIlx",
		@"CwWbncXPAglbHr": @"nFvyEuQfwrHJnrSgytnIzCijWmsSxSDalvHtMDvnngSAZZMOoAlcQyiciiLKuJudfFlkuKlPahjLjFRbnsjAxESwDvIHEJSASGyzvZyBaC",
		@"QpuQqhKNZAvhB": @"envsODWhKquOqNGLEMgNIsTAEqHVnweSiqpVBuNKqHKYfYFOEgOYeXWbFAeidExqXMEHAOQZoOitPbjlsAArMRIdSifoFcvsTeFQFzAZwHjjchlMNOtgWMakYdkQpgiOuWLywB",
		@"rakcVbICSGBNAlP": @"tXrrefBOTDINYMnPuYSxtKKHMqQiDzVjSxJjYkenPnPEJAbwDBKvtWBPsoGZYWVyrUGJdQnFxtvpIFuTiIuFxJadvXaOrEfVEipfrKDBlSMLoZYLvqYZKbmbAEJGWnFuFmdfIpFDYWiNvX",
		@"dTlzBUWtRSCHhbV": @"cMSlNHKRammzhGpBkUsRiYkXqOkixMPrsdLdYtLxHQdMZslKuQtUJGvKUeyYujUkrKZLDAcUnqlIqYhRjOKiNfbDIwvqgARWFOIMBAzvlJNjLtPo",
		@"VjElRaBiMnoSl": @"cnuauwggWzKbvXJMdmDKQuwuXBuxfRvykcjtKPCeoesnAqFHlxMkquvjnHQaLAFjVEmrjmsqUxCGVWqSJDXzNtMYyQVsyttTAhmGhnOvfLinmzYdpCsBs",
		@"ueYxgonpHsnj": @"RcfHrjkxWFZmfytoUDQZWLIbQDzhHwdRdLBsaIygxzPWcQoYzeuyDjdalAvcHXxCAtxSmXepiclNiAFcNZLjCnITzHzqPEBdtekfisVfUTdVQzMCjMKSKkPfbbLWhXUA",
		@"GfzULVuPuykEeu": @"cKzUeoMNJBFDDPmhsEFIOmyakvRTymCMKqbsZAwYFmLRtFSHodleTkmujzJsEdQbbssLCInuecGIpoKEGQVWvAsVwHHynJAodzMZWforppkDTQIUTBPae",
		@"yLiBBYPuVVeCSLX": @"RIcERKkmQGYrWrLfriuNqKwFPlUfvRyKJrhpvgjMarvnREdfDzTejvyGfpRkDsfnjVfAimRrTixSmcbZEfvSHCMYsdHBRJtlEieqeMVNwVeCNxyqWjYkXBKBLBcZZXuqoiIoGVWZEflbzPHs",
	};
	return yVmXbVhPjA;
}

- (nonnull NSArray *)fgxoSiNnBrE :(nonnull NSArray *)RzfEQrNwOIStlVPYlU {
	NSArray *wtmbafXXNzUxIWR = @[
		@"VWWPsHLrHjVsymwInYxNzKHDTKuoMAscGNqTAXsxrwxVggmDZKWiKlfhRbZhlhRYPnytPpFEPFBntbFPhLHnqPyBRDvnmhowhEqVIhlYrye",
		@"PKFEXuQQubZPIWwuhLLUJRWWKOxYuqfbQvIZEGEJGDXgBLCSvQoMPpybHzKVxBpBvUkdVHzqnEWVQvpjogAmxVeChewqNilxTJhSHRjKIPBSUZizLB",
		@"XHTrgupTaJBrALsfpHvVAyaiKpKEQVHLsGIWcDCAWOKTiOsoKoNvvZZGKDKAnNYSvgobnEteysMufFXqrJebBixenknqJrtqZTDWoBRxlchWpiuoRDQjDxIjNcdcaSxXYbNkgXJEByiAbCge",
		@"EKsHVJiietFmXFbnLfGEHQsJIEVBdjRyiFrxmZBGnqeEjkVrehPSpCTDsctlhIumHXZoIzPOTPtrYjUThGzNgmgeROutTdVWgJECvlQOpGQhLy",
		@"oaGNugmvFqUqAUgSqgXknxPmmcTuFoVCmpixEifnNzdDiSZkOEHOrGfgpJrqdTQnwZzNCvtfFsVujpPvarKVKlvwLnOWtHRAqNnMfNuP",
		@"xAvoqgjfIiQFMnxrSWCoPTkwhsZjlGNsElwmJHdimiRgTPyglVFMpothBDpWaTkCzSSEnGmWLjGixLiwOZNWzAZHDiXJJrPdoGGnBJURQskIVsGYNC",
		@"gSeCkfXvxSnXrUhqmVEGQvTEaQOSyRaJUlqYWxzqITMttXTliWywjYNLDJtLAsPKofbzUNmzJvUWuzJzcRRDMLDtyupxDjwbsmaUPwAdIhHCXvfaaxijPBgQTwrcWmj",
		@"UZHcDZpKKyXlDrNgmqaxzHCqMqXJeXgCggMwXNzLqkOFzNQZbXEPVOnbQDJvoZJnZtPhyirsHgsqYyGvbyrxKjvqAWTyihsouacHmeEnwEgGKkLo",
		@"zvUvuZArWZaAcFQPmvRpERgBXdMZhIqIsKFktXeQLrgUXhmWFTGvrTzyLxUXrRUJGCcyGSXCASZCFGaoaHXqlzIujLmWepFHxeuvtAiHXfagkdBrCqoVyqNNkqNUbuIxfazWKZmBMlGRBKzXNlrZ",
		@"ZuiRVFCqWWMSRdOEpdLOnCWGVdeTgwXrMuIFFMtuHwkxhmwvhRxqEAxlTiJwHyWtbjlNtulqZVHLVskTlCGOAZMusKcZKBsljzuHadfPG",
		@"ymdkaDjxQPlZqdsZJCwiSMDrhXeOFGFaAKyMVgaAcsOJNRHjYOXYWQjNOzrDHvNafdgKouaTswiGRBwDtRJPOqgojnHHnhCZCZBcAaenIpbEyzYwIweTqXaDxzXiVh",
	];
	return wtmbafXXNzUxIWR;
}

- (nonnull UIImage *)ZDrGboUofMNftU :(nonnull UIImage *)JkNdtUgxjOkL {
	NSData *NlyTYtUTXKOKnxAsEG = [@"STSOBsyUZpHbkyQbsVCjDQwMnhcjWUZVobkkHiULLAKKHRDCEPpyKTRZsUnMZOnQqwEzSaUkFbLVKVWZWMdiOLRFyTJwyAiFlIVoPflbwIYiSSObLUeApNhq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *brAZpvRkXo = [UIImage imageWithData:NlyTYtUTXKOKnxAsEG];
	brAZpvRkXo = [UIImage imageNamed:@"afUSAwGyHMvONQOYOGpAkDCrWGnfxGYhPWXEpIGkcHTpYEdCURekbNScdNanTMtGnHGIKOVosWVFnSFegiuQutAhUlCyeWWXMZHEcDycCByQkzGfJYT"];
	return brAZpvRkXo;
}

- (nonnull UIImage *)osrnXLeCxOUFfkF :(nonnull NSData *)kOVdAwKoHCVeCKgtP :(nonnull NSString *)rXslRlBbggTYSzVKW :(nonnull NSString *)WBOQESAhDEbao {
	NSData *XVXhyaIxQDdqUkMP = [@"yByrpzlmhmuQKXugHUooHKlunLOiVTwFfuXipOdtmldIPhOHmbEfqicZmmCtCISjXiFMSZvLUvpdXIDFLdDndUNeHXWhdkRGNJdjqJIvsEGOZufYVwkCoEWNMDqKziNIOGt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lRrpEFznuNBxjcnma = [UIImage imageWithData:XVXhyaIxQDdqUkMP];
	lRrpEFznuNBxjcnma = [UIImage imageNamed:@"xxrVxKIQedjttAQxTXIrDfZIuqKTcGRllkUatpFrsIFBpJiCeuJWVzITgijWqsPFzHeRootrcySDTVedyhkLMHCjzFWYKrqHDFLpinEtrRGnelBosIDiuvBHyWXVshfLqMLSdbda"];
	return lRrpEFznuNBxjcnma;
}

- (nonnull NSData *)aGGcgcgGboHI :(nonnull NSString *)aGqhEEeESMt :(nonnull NSData *)GOiOBbUNeBTFCOXfH {
	NSData *msAYDuuCupJbCQUllp = [@"uFpEUhpQfWrPladxRQiEggtmpazamodqKeVPYafounuXpRDiDeNwoaJbHCyCMICOzotnzSnDHLpYGBKnZgFkvxkkhDghbrWgeYUFXGbhWGYGe" dataUsingEncoding:NSUTF8StringEncoding];
	return msAYDuuCupJbCQUllp;
}

- (nonnull UIImage *)zyEeRnQdHJGHn :(nonnull NSDictionary *)nIhpOExwxivlu :(nonnull NSDictionary *)MkuNegTvzRD {
	NSData *wwQuKHhckEDNXXkXN = [@"gnJZqofsIYVVIxrHandHImFpeaysCMQQMPRJFKmzaaNqLumQdZBOWgbdMpZXkJqSZZCwLOLopZxsPZGZJUhpLlYWYGQuwHXtkkEHdspvbQUNlxjfxUbXeSIqtcAXUnSmEEnrSHkqK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RlztVfqhXx = [UIImage imageWithData:wwQuKHhckEDNXXkXN];
	RlztVfqhXx = [UIImage imageNamed:@"BEVPjHtkFKRLWAyUbfxedtgGcBrUqWBXDjAJfMauEHCMypxYzDKMFVzOspcpDFNFybyYZzkpBfQKLtBJDtnYkSnYjxUYsYnSdWbpRWfgKuhlKvwfKgonjht"];
	return RlztVfqhXx;
}

- (nonnull NSData *)oxWRBQAHJxgQCjpbF :(nonnull NSString *)nfKOgimCwqBMxcwHupJ {
	NSData *pHGKtwzfbfJbrOOYT = [@"EXKOmnUaPnLDSBpKnLzWfoxsbCIOXygJfCXMJOZvOnBUlvuaPkdWOdLgWSNCXVMVpIVlPRpRYaqPstpcvIQCTQtiOhWLvmuuvMTBFPYVeTTzZKpoQtSNx" dataUsingEncoding:NSUTF8StringEncoding];
	return pHGKtwzfbfJbrOOYT;
}

- (nonnull NSArray *)GQGVTLsSPxI :(nonnull NSArray *)LKivBqxBNVEjayEzm {
	NSArray *ZYmIfPcMMOsKHmMHL = @[
		@"QauzCfhpHMLfghSiamXpYbXvtHSAMBcRypXJGanyghwqGjdXFChwLbqCWMRUayKieALjhlekAYWGMxfhcmjtrMzsVKvXTCgKyYvOOmkiXgfHvsZevrSNEdqGkxhnCqxabAgyvmfxWBSuiMYw",
		@"TiklenlpnWGMPWtsoUHqrZQJZVQmoHISGfWJcSfDXfRaRZpSTOEDXutGIJsCewGUDgPYojpgNxOUCWZNtRLqlJzPCaYZzQcJmxVRuUxQjILPZaunJjbmexYIBbPAMUda",
		@"iVMpGXqkcsjYXCHPimiswMWSOshHLCfWfaofRQUbwueEgJuyNVnCsJdVbznjtySFQrmBscpqfziXpwlYEqqxuHdZhFJawBpBxZfOSoccqEwvGZhGKGNkQuaKdP",
		@"hwIFeTYfjHyprKsSpXkehjOcAQcSjRlYOPVNsTQTstPcQUzJZFKPyBeqjdMnsKWdJcraHcjkjLyZuCDJeeMSSSxQZanTJRwyTfRqSZMaG",
		@"CRdkNNjhnLBVUFLkjPSxCfVCrFYamCNOMzSqaJOskdHLqCNwSMJzbepVCypbjZcmBzTDJXDcanUHFrqzfyybfJbbcWplnJJsFGedJxvyUdICassfzWh",
		@"eewxlOMFYIEBOiiqVfwowlOFVcdqPcUCHeySllIfgBCOupyLqzWtXqNqxbJMtWRPttlqRtbLRqEZiwFzRgMOjiDgZzBiqILvRwcEPKvdGJYRxPGdRvxkJYSdLqr",
		@"SRUpWtyxCWkOTFRumFzYCgnuAiUaGpiCGuGCnQCrgLvSqVgFuBzdDYfNiGSLimJireWmgPuZAmtzdWSpJsipPfuZJEsNZqYiOJuwWAejmYoZVBhVjZdOnGlDTnhslnXFDhmroCrpnZ",
		@"azUkUjoCHLIEEXSukVBCKhTuuovqBcNMmzrKvTBxZxdSgzsjHhkHqJQIpSEfrmssLXvehAlUqxpklTRJtJeimVuNLimmjlTKOgigHqSDZTVAuTkqCYilwdvyAYNYmMTw",
		@"oozsTUsjeswCLLAsNldBxEdAQvDzZHONBoKPbkYOVDTWAhzgvOgpCqpnwrwIQpBZDSHYilSOcFGaOyIHzpIKWzxzyvflHdXxQaCjNcxPbQALQxjXh",
		@"tpgnDEzxxxsaIzPCpCxeJmcmdSWEBhafPIbHkqdplERyytJHcslYiWZVSDKLqqQritPRTsslcQGkMOzvsHLnyJWsPFNFhLEWTFwKZtuemGxGGVMxNvBsTkiboZDcAm",
	];
	return ZYmIfPcMMOsKHmMHL;
}

- (NSString *)czpickerView:(CZPickerView *)pickerView titleForRow:(NSInteger)row
{
    return self.pickerItemArr[row];
}


- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemAtRow:(NSInteger)row
{
    NSString *type = self.pickerItemArr[row];
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:self.itemArr];
    EMAlertItemInfo *itemInfo = tmpArr[1];
    itemInfo.itemValue = type;
    [tmpArr replaceObjectAtIndex:1 withObject:itemInfo];
    self.itemArr = tmpArr;
    [self.tableView reloadData];
}


#pragma mark - EMDatePickerDelegate

- (void)changeTime:(UIDatePicker *)datePicker
{
    self.alertDate = datePicker.date;
    NSString *dateStr = [self.formatter stringFromDate:datePicker.date];
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:self.itemArr];
    EMAlertItemInfo *itemInfo = tmpArr[2];
    itemInfo.itemValue = dateStr;
    [tmpArr replaceObjectAtIndex:2 withObject:itemInfo];
    self.itemArr = tmpArr;
    [self.tableView reloadData];
}

@end
