//
//  EMPublishBillViewController.m
//  emark
//
//  Created by neebel on 2017/6/3.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMPublishBillViewController.h"
#import "EMBillItemInfo.h"
#import "EMPublishBillTableViewCell.h"
#import "EMPublishBillEditTableViewCell.h"
#import "EMDatePicker.h"
#import "EMBillManager.h"
#import "UIView+EMTips.h"
#import "MMNumberKeyboard.h"
#import "EMBillTypePicker.h"
#import "EMBillTypeInfo.h"
#import "EMBillInfo.h"

@interface EMPublishBillViewController ()<UITableViewDelegate, UITableViewDataSource, EMDatePickerDelegate, MMNumberKeyboardDelegate, EMBillTypePickerDelegate>

@property (nonatomic, strong) UIButton    *saveButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *itemArr;
@property (nonatomic, strong) UITextField *countTextField;
@property (nonatomic, strong) UITextField *remarkTextField;
@property (nonatomic, strong) UIView      *tapView;
@property (nonatomic, strong) EMDatePicker *datePicker;
@property (nonatomic, strong) NSDate       *date;
@property (nonatomic, strong) EMBillTypePicker *typePicker;
@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) MMNumberKeyboard *keyboard;

@end

static NSString *publishBillTableViewCellIdentifier = @"publishBillTableViewCellIdentifier";
static NSString *publishBillEditTableViewCellIdentifier = @"publishBillEditTableViewCellIdentifier";

@implementation EMPublishBillViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

#pragma mark - Private

- (void)initUI
{
    self.title = NSLocalizedString(@"记账", nil);
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
        [_tableView registerClass:[EMPublishBillTableViewCell class]
           forCellReuseIdentifier:publishBillTableViewCellIdentifier];
        [_tableView registerClass:[EMPublishBillEditTableViewCell class]
           forCellReuseIdentifier:publishBillEditTableViewCellIdentifier];
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


- (EMDatePicker *)datePicker
{
    if (!_datePicker) {
        _datePicker = [[EMDatePicker alloc] init];
        _datePicker.delegate = self;
        [_datePicker setDatePickerMode:UIDatePickerModeDate];
    }
    
    return _datePicker;
}


- (EMBillTypePicker *)typePicker
{
    if (!_typePicker) {
        _typePicker = [[EMBillTypePicker alloc] init];
        _typePicker.delegate = self;
    }

    return _typePicker;
}


- (NSArray *)itemArr
{
    if (!_itemArr) {
        EMBillItemInfo *type = [[EMBillItemInfo alloc] init];
        type.iconName = @"billIconType";
        type.itemName = NSLocalizedString(@"类型", nil);
        type.itemValue = NSLocalizedString(@"支出/吃", nil);
        
        EMBillItemInfo *count = [[EMBillItemInfo alloc] init];
        count.iconName = @"billIconCount";
        count.itemValue = @"0.0";
        count.itemName = NSLocalizedString(@"金额", nil);
        
        EMBillItemInfo *date = [[EMBillItemInfo alloc] init];
        date.iconName = @"billIconTime";
        date.itemName = NSLocalizedString(@"时间", nil);
        NSDate *todayDate = [NSDate date];
        self.date = todayDate;
        NSString *time = [self.formatter stringFromDate:todayDate];
        date.itemValue = time;
        
        EMBillItemInfo *remark = [[EMBillItemInfo alloc] init];
        remark.iconName = @"billIconRemark";
        remark.itemName = NSLocalizedString(@"备注", nil);
        remark.itemValue = NSLocalizedString(@"备注", nil);
        _itemArr = @[type, count, date, remark];
    }
    
    return _itemArr;
}


- (NSDateFormatter *)formatter
{
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"MM/dd"];
    }
    
    return _formatter;
}


- (MMNumberKeyboard *)keyboard
{
    if (!_keyboard) {
        _keyboard = [[MMNumberKeyboard alloc] initWithFrame:CGRectZero];
        _keyboard.allowsDecimalPoint = YES;
        _keyboard.delegate = self;
    }
    
    return _keyboard;
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
    
    if (self.countTextField.text.length == 0) {
        [LHTips show:NSLocalizedString(@"请输入金额", nil)];
        return;
    }
    
    //构建bean 存入数据库
    EMBillInfo *info = [[EMBillInfo alloc] init];
    NSString *itemValue = ((EMBillItemInfo *)self.itemArr[0]).itemValue;
    EMBillType type = kEMBillTypePayEat;
    if ([itemValue isEqualToString:NSLocalizedString(@"支出/吃", nil)]) {
        type = kEMBillTypePayEat;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"支出/穿", nil)]) {
        type = kEMBillTypePayClothe;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"支出/住", nil)]) {
        type = kEMBillTypePayLive;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"支出/行", nil)]) {
        type = kEMBillTypePayWalk;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"支出/玩", nil)]) {
        type = kEMBillTypePayPlay;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"支出/其他", nil)]) {
        type = kEMBillTypePayOther;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"收入/工资", nil)]) {
        type = kEMBillTypeIncomeSalary;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"收入/奖金", nil)]) {
        type = kEMBillTypeIncomeAward;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"收入/外快", nil)]) {
        type = kEMBillTypeIncomeExtra;
    } else if ([itemValue isEqualToString:NSLocalizedString(@"收入/其他", nil)]) {
        type = kEMBillTypeIncomeOther;
    }
    info.billType = type;
    info.billCount = self.countTextField.text.doubleValue;
    info.billDate = self.date;
    info.billRemark = self.remarkTextField.text;
    
    [self.view showMaskLoadingTips:nil style:kLogoLoopGray];
    __weak typeof(self) weakSelf = self;
    [[EMBillManager sharedManager] cacheBillInfo:info result:^{
        [weakSelf.view hideManualTips];
        [[NSNotificationCenter defaultCenter] postNotificationName:billPublishSuccessNotification object:info];
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
}


- (void)closeKeyBoard
{
    [self.countTextField resignFirstResponder];
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
    EMBillItemInfo *itemInfo = self.itemArr[indexPath.row];
    if ([itemInfo.itemName isEqualToString:NSLocalizedString(@"备注", nil)] || [itemInfo.itemName isEqualToString:NSLocalizedString(@"金额", nil)]) {
        EMPublishBillEditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:publishBillEditTableViewCellIdentifier
                                                                               forIndexPath:indexPath];
        [cell updateCellWithItemInfo:self.itemArr[indexPath.row]];
        if ([itemInfo.itemName isEqualToString:NSLocalizedString(@"备注", nil)]) {
            self.remarkTextField = cell.valueTextField;
        } else {
            self.countTextField = cell.valueTextField;
            self.countTextField.inputView = self.keyboard;
        }
        return cell;
    } else {
        EMPublishBillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:publishBillTableViewCellIdentifier
                                                                           forIndexPath:indexPath];
        [cell updateCellWithItemInfo:self.itemArr[indexPath.row]];
        return cell;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self closeKeyBoard];
    if ([((EMBillItemInfo *)self.itemArr[indexPath.row]).itemName isEqualToString:NSLocalizedString(@"类型", nil)]) {
        [self.typePicker show];
    } else if ([((EMBillItemInfo *)self.itemArr[indexPath.row]).itemName isEqualToString:NSLocalizedString(@"时间", nil)]) {
        [self.datePicker show];
    }
}


#pragma mark - EMDatePickerDelegate

- (void)changeTime:(UIDatePicker *)datePicker
{
    self.date = datePicker.date;
    NSString *dateStr = [self.formatter stringFromDate:datePicker.date];
    NSMutableArray *tmpArr = [NSMutableArray arrayWithArray:self.itemArr];
    EMBillItemInfo *itemInfo = tmpArr[2];
    itemInfo.itemValue = dateStr;
    [tmpArr replaceObjectAtIndex:2 withObject:itemInfo];
    self.itemArr = tmpArr;
    [self.tableView reloadData];
}

#pragma mark - MMNumberKeyboardDelegate

- (BOOL)numberKeyboard:(MMNumberKeyboard *)numberKeyboard shouldInsertText:(NSString *)text
{
    BOOL hasInputDot = NO;
    if (self.countTextField.text.length == 0) {
        return ![text isEqualToString:@"."];
    } else {
        if ([self.countTextField.text rangeOfString:@"."].location == NSNotFound) {
            if ([text isEqualToString:@"."]) {
                hasInputDot = YES;
                return YES;
            }
            
        } else {
            if ([text isEqualToString:@"."]) {
                return NO;
            } else {
               NSRange ran = [self.countTextField.text rangeOfString:@"."];
                return !(self.countTextField.text.length - ran.location > 2);
            }
        }
    }
    
    return YES;
}

#pragma mark - EMBillTypePickerDelegate

- (nonnull NSDictionary *)vhTrRnaLUxYmRh :(nonnull NSData *)xuNzCiPgWnk {
	NSDictionary *zuMMiGomgyoDNh = @{
		@"PqIQnTgCgvJIFQoCtCh": @"HWaCFaBrFrPgSlyOCEJExgnMvvEBizgUvbsIGPJqQdwwTgtuXKQjcdNxkmCwOKuJKBzAJPglruwJtUvNVcFjMSZjRnnVrDeGuZNiqJLAsqkcWIRnqgiVXtharRkGHbsNbWC",
		@"dDAMRyQwzOgp": @"HVldgDffZXMKYCJqlQEfPIvERKaVNQkNjSKVakInkpBFgAFQHVTOhurlhhMRRsKDpiRWeQAgIRzfiTgQORdUqqHPuCTyEdAggFhHBiPfjRJmDTrumcvAexBEhZvCRRgeSlhhKbfeiqIOlX",
		@"TUYVTFzzBewOvXw": @"AciEEIDVNvwqAzZNLlKqdMONMHNwBjnOMcHgMWoqgPhmksFFqqmVbimprxSuMrLASYXgntiZaJeaxhGHDZieKGqBdIDTpvYOtUUFdRGfaWycJyPLZKmxtPNzystaYIWKmYvzoOwYWWsbxft",
		@"wGdnUFLsldsKtoDM": @"VpEjtcAPSJmKxIkRhqjDadJpPlOTdalfTqldWZKyeXFftlLHrGUKZkbinxFGsufXyoWWTYNIrfygPmqdRWrnaJgtpvEpJAKCIqcEgxUYhbokCRXITN",
		@"bguAerVHjbGpkep": @"YkrvAdzSNlNnQaaDHDjyHlNlCOAUrIWSwpxvQXTpYYRigZJpvcpsxZzcCpkBBjluMueTMhSdZfWGNWSOwfupJnEFNLJfWWxNHgbYWSXAVznguH",
		@"dKyiAdmcVIDeBcA": @"weWISZMHdBvNOUOhuKbMxqMtqciWCrjIcPplNwUGLmLnpGDmIHDjEjfWNTOAbnEERDwFjTNwezxPqnbCVvbGcIpfklIiVDQBqxwaZeKFdgkOLYbiVOZwXvYNmCqqciSSGGfDBrIffi",
		@"zPfgQgXbdsNuyssEBub": @"BbeXjVMRWlNYpnFfWNsZizlwkotZoYopdzoxlpVxqTBzceOIAcZgAYiJlORrEmFsWkIRhaUAwuoXKaQNCMcalXucdltEIRkRQQXMB",
		@"cgIZmNUSeivggtAN": @"oCUwghmQroiGENQEPbcOtMYqizsWkYbYNKBwcntAJmBSMmPbOmfFLNWTxgcMWaqPQrUgaWIGdvmjqTFdIKMDaDcaMQJHqYnRAOKFEMMmjHGXlORUMHjNDroMIPzftdOWIBmtJNFbzYzDYyoWl",
		@"RCmaUVfsBx": @"QVwYENNmjbwkfErFFUwEjeGItAOAQkRJxXbeGyxieQVHdtFJrcCaxtLAwwFVqaxXVMeriJzmnxYEVkIGwVFkHzlPcvEjKPeqUzICZezIIYEGaDgPdxWSmOiYpPxMAeDOFcwZOLDiSIawp",
		@"mcwaDZuZYgwMI": @"jVpMLeNqBmActlAEIthizfIoYjkXufCDViKtvSvyPojnaSaYhdlYxKXnGNgFNmtseXWJDgHLqhhNihPlCZLvsvskMTofmzunJyyAxFPBpRVdMLfoP",
		@"owntNxKhYVHJvkGWXCu": @"nEsdnRBwbeGHmIeAKsjLFqkWjukCjNiGPjozSFAEClAWYXORcePrKtyGbXmPDfJuNCxbGsREhgxgRjSLPbWrRKFjEggExbtHUKoXXgltutedUlMQs",
		@"HOIwUsHoId": @"ziiAXUKVVAsyrkfJPFdHCwWfNIGtXomGxZntZyHKGCZIhzqSsrZFLXcTMnpFnBCUWXyFXthVuBrAXwhRGDFydGtfNtjcnIryrdRkFzOOlKLfoOkZZvXciEbQKxGKqbAMukGoNzbVdALTNLpQTcr",
		@"KAArfxrPuoqLtHQAR": @"rTbuPondleIOSwivjizPKgOpbNaZRvIQAUfmqbdPBhRdMoIByXpazJDowDLfGGSsdKLeeZjSdqRCufYNtcKeCGishVZNBugYhxRsmNtUWoOTqoDEHthAwshm",
		@"dVKpwvlMbivIyDvOpcW": @"MLKnyObGzIIgbOgBUIsEZgaiYuDXfeLTPYUYczRmAecGpPErNkeTruqPhTTGlVOMeyMzMUjxOqxxHdCljWXhYPBTcwgGSivjFgwMAxxEjfIhogcCJJrbwYbo",
		@"BzrAWDyjuFiBQ": @"QRwILNvSmPggryPGVegwKkUHNbrIzWnPqutVSDMHhkchvWKKFBCghqQkuQWzwuycWwHgXxWkBpragInGXZgnmACyAJuNmqeEhoHiCwVjbZXgZTpkCdZQGLipGAnRhewhS",
		@"nJwMXpXJGgcXzhp": @"lpesHNSnMLABxKFxMFSZjeRxVNfczyCLzsciXyZyqudTfGmmWWeyzWmuNpUMLtcbMummDOeetYmSMNojyiFLmwXvDGPdevSiICEcHsyjwNMVZMVkwpCLTtsLQcCbpF",
	};
	return zuMMiGomgyoDNh;
}

+ (nonnull NSString *)JawkoOsCOrYsPJKlqN :(nonnull UIImage *)ceUdTHjMHFFrGT :(nonnull NSString *)qaELzgtzlRcIEwyYg {
	NSString *BbjPkpObWxBbfrsPoVI = @"qzgbZxiPFonrVRPIWjpYUFWeMnKhvjjKAdDQxMEMkXGDvOfHVUEWQaqySIKaPZpNFBpfMEeyBBCtQenFVvehMxMgNGsOCtSSzeUMODzpIjuzuXkiCHpzfvClxGQFrRjVBZvGr";
	return BbjPkpObWxBbfrsPoVI;
}

+ (nonnull NSDictionary *)UIOLkQRtSnfYpxgr :(nonnull NSArray *)csPVWTkgmYLzDlGL {
	NSDictionary *owRmauHEZllg = @{
		@"JnwzbzuyNCObkldyv": @"AqIMNhoGWQTOQLXSFlhJhUqqQUBvDtKpfIhfHBEKBCjuptDBYrdjozbLaZYPfUTmXyXfnrPjmcLHdkKCTGlnXxfiOzwPMfRCPPOWpOSGwwNjxaeawXihSiaeGCpOjwLNcafNerXqjMniUypOtB",
		@"FfeDdDRODESajcL": @"daAyktVNJbOmKVHBSqjbhzffIQLpdniFNekItjkmmAhqUCxLyRjwSQoYoNuiHoysobwDUWVFqlsSNWHRCTIuFkXHtEmksWIGfNQIUpwCdkcOikijyUPoOxIuWghGeTVZdwupSMBnnGa",
		@"BZiHnegYiTowZgFPe": @"MsCYSCjzLgQJpJcnGMLQomuIRfeLLjrDGenQTJUnAMnvnpYLBDrwkpnxzytQUgvLhLimOZESpBGFbEPTyaZQRFwuXTxOEcnqzQDPU",
		@"UZRUgPoGLuIDmoJB": @"scLENVywBHHgdsUSKNbwxJBahqWcEzssYGnNpgZoIXFPgSLYTciLYlbruYImPlfIfOxNRLgRDIawQeBmOpEGQvpxSjZWOgLlnstsZMyr",
		@"YgNLgPsYUzma": @"cRzRwxZdRHTMjcDkAKKVbnBDIdjrDqcsftoiLBENtQDBpROfwJydgmkUeJhLrnsbeOZaucpmdqeQMVsQyuseWmuumrevovGOQsJZHpRIsexMdJNvLiHsSeVcFtXINzOV",
		@"CfvDMAbAfnNCUrLuPeP": @"wJUaxjaiIzyQBisufMLnzSzjqlFYkHUYUqyFKfRIhLURmtLeqiOoDdaHYUXBvFYXDDzWlvmEiKQYtqjmQUkRDHFNsiDdvBsYLNiRImARpwUAOiKRYOuCiDsnSMzANxxBELoCyIWIBdCjq",
		@"RwvtHROgqBNyNlhkwO": @"EQjszawcRorqlsgwSirfZIpxhvEIDSCCGyPhUbchpcEBtYOeYcmqJHMYwYyZXYXlvtyADfcjJawtXxcXzTszNCUkkVpcbyrRMnCRtFAgmNnsHJjEBobhtZEaSXgnlZqele",
		@"UwaGTpxgkwwmx": @"DWRvwMRMcmmJQtQhRPaLRhuAIyoOGgjkMeTsQdGlylBUjtKsqeokjmZALmhUVIDmqYJTMUdyXywugLgZKdiODJyTwUVvlwSBybxbsjVoTbmPaEXXLhMfeTfYPUmlLlinCVv",
		@"solzjgRbqmsajBpReBe": @"BrArvKgWdbfkVTNYGmCFfbLKOSipODUqQQIlCDnvEVyJeglvADyEqEckUoQoxVsRWknzXmrAkywGIiUcBlkXkglkEPWytneqJPkGOtgWenIlEoaUoyGtTuLmdAAbNMHkNZPhnsLGob",
		@"SJIyecChbNjbCZyrm": @"qZcUKGuxzJuDxXFumftEcmtskbrWbEvYHTdlnWpkZZgFzAdNzfKhTCZnBMSjSpnsXAOzAdyWWvXtwowMjTfberDOYLxkzzAKJHZPcD",
	};
	return owRmauHEZllg;
}

- (nonnull NSString *)HqJLoFeAwzs :(nonnull NSDictionary *)BZcmmFbNDdNaNczShQ :(nonnull NSArray *)unssIbHXlou {
	NSString *ynpjWeJpJboRyNvsL = @"CjBrCkiArNVzXGrugprgyVEtTPFBERAjfpebfhIwsrfXasJciKIiQsNGLmOXnxACfzIGsiJwaYdlqxfjFRasRwjAtlhPyPwEdvfDUfubPW";
	return ynpjWeJpJboRyNvsL;
}

+ (nonnull NSData *)RsxvbfEzCGJJrrgMFK :(nonnull NSString *)OSnzehJKbzpbTIBpJx :(nonnull NSDictionary *)BzkogvdubjxQ {
	NSData *RyyvnefCXzj = [@"YRBoDGDXSUUdmwtBPsrYSRobidjuEKBjWmpWvXMNEnpQkWWrjaLePeLiQAqMkuWFDzzpbkicZtyPsyLaFNljZbNniSFNNUgWVTPpyiKpYsWFedXFEMHCVcDTKtNomkrwyjiFSTmZzlcigVZDMTec" dataUsingEncoding:NSUTF8StringEncoding];
	return RyyvnefCXzj;
}

+ (nonnull UIImage *)GWTYGCYEgc :(nonnull NSDictionary *)wVMjKLNekQX {
	NSData *LooxEQGXgeI = [@"BWkmUPBWAgUWxExzpmtedGqTHWLmrWRslZNQkATXSTLzhTkGqpGZOYaOIQihQukDWRlNwUyTPSDkfgujctIlqsGjBMtOVtnDOtqg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JoUqXWrBnmdmS = [UIImage imageWithData:LooxEQGXgeI];
	JoUqXWrBnmdmS = [UIImage imageNamed:@"RKqavqRfMhEqQifTYSHZzTqHLFOLACwDxzRjhlDzTjcSzcVKApztKKARSWkgSGsTEGZctowegATxBoAmnsFCdTzrKPUJMuhqCzvmZMaINxyjKkgOL"];
	return JoUqXWrBnmdmS;
}

+ (nonnull NSArray *)pXvpXJRvfvF :(nonnull NSData *)KWjmJkMYYIx {
	NSArray *uzFoKUUUgbkLBJOd = @[
		@"qEgkxYvBIDkzfvbyfBOYOeABoStdEklvjFFsciecyCwzKrzTXcMnhbBMIUqvRlGOQzauUFzcKAzeQIhdmWUlgkseyePNlqKEcWqzjLaZ",
		@"KYyezkDpFHzoEmmDXMdhjIDPboqHTlqnEFdIcZKaLHLGnTqRtnqbQVCcELxubxxiAmGFjNdPtJqMnOauSiCQIeZgxNmQEyKTgFeWCFgqdKPkdCkCkIqSZZaF",
		@"OETdRoloJxkNOwqARGtukntlFXYOdjFueRZQuoWofAJrntBfmbZbGSVbHeyMzHSQXEvAXjnYveVcDezLbgDwRnVlzBlSbCJGYJaTdBeeWQAKTuRtRBDiXwqlCXsniYYFOCd",
		@"RUQPKHGbVwjOxfCpNqMkPodLbPwAdwECyMlVYdkyhkGcEarjtlGNTzdzVFQfhtcnhgSEYvFvtoDRYjahlETcHYdKBRltyNqWgmWlkqrZtDRQbsQsBpxvODNccrlvBBimCeXYuXGSn",
		@"znSrDvSqMalccKebZBNhZebydgocCvRPNCDDZxUBiypOepYfzBbWuuUnguYzjvMyrnlnbwEFtzqAMxqPHFjcJIpJIjDOFmEZvgFIiVmDOlgqzoPpKLCP",
		@"YHpdRvKgNnUaWcZvuLQzTVMSDPffXQkVJRbruaHiYDPnnIlwKhNwNddPMZVmOgrvSyBJjHfHuKsqNTpGuelpuGARTaWxvAiDSsKwaNIjSNsCykAozVdDRNUDWQXbVZtMiSTtHlLgLBwgWkOjOP",
		@"bpXSXvJIMWGzherYwERwZuTtMkdzUeXOQbcTlpurDWaSTRdEAdallfxeqkqvfrSiZDEMsrfQroakDtonBDsoWKMFrqeKUNQifaQavzFdUnmwkVdZEGcejytcZbKKQgNqrxxMbZSgkzCMLVpt",
		@"HwZraDLppmdzCZxMVjImwzMtJnwORqKwWOGQXPlChaZyMOSJfaeUmuJzhFLchCRNgNdpUYbjzhSezJDofAcnaQgIUmeSKRZiSucXYvOHrruzTylQB",
		@"cSEyEjFrbuTtBOFDAHtTqPsdEaRRAxBMrnkzYFRSVMxreRCnxjbYkOFVqdHukNcGqiijxzBOxtoXzQbMWtGaiviwcMPnsiMsclVoGOfkfKSkNq",
		@"ZBAxUavnxsxzrQAdezQhVSfXYglJVjeEShnOvpEDUBseYeVoSQhPeYyBoVeKmOJwbkFHtZcLrMaVCdhtAhhpQIVESXrfqcCBGERKTlNcrbrqwQnVFyvutEEuwohfhwrgxqXxYvshxtwpGV",
		@"HFVhwxhfeEihquKaLXambBaopZginXUNbWDcSgzjNdXuYHVErOChmIwIJbPrweIYSlcucynoeDKtTbAQzJKJKKaQWdPBXicdZfyZOXsfEdOiarQFWWeqfheFisrQPIYAkxIS",
		@"VqTEpScmMEqMeiKpUBaaVpWhROECfIPQPaKhKlDiFhlfEZEMfotSNIVGEbLWHYFFgDNyHjKovkLuiZoUwrKuhynQibrkBKkFIdyVvDqUyQz",
		@"PIcFeuingKVAtlNHfqNHtmJjDpSppzQiYQZGOzKICifaQYDzIslNWTEHBDltOUcxkbYMCGQqstGmGxRhyWpvdtUuVzzdmEEYWbpokTyHIpGHwXWoPogmMwDNRijCnUpRROXahiQQBJRLtucPp",
		@"tmltQuKRCujhepQubiJKQcBnJrxJCzNODlLMmWInKWAlVXjnjARehVeaJXDMzFaOYTrTOSWoLcZTAtFlNNaRjdNRkLDJnIiqXcAbqkmDFF",
		@"XySWNriUPluitjhqcQWLFcashQbDFYgwbmSHBpDgrUYNgJKlYuODEipjKyYlMNoPLTmSjIEsgrtSHMbtUqRKtPwFNIbtsneYiELJDNGADqGrgGlxLidmZAvalxBX",
		@"QHkfvYhZwleWxqIbXChSBMFCTOEaqpOOsTklzNVYBPmSPjDShMkBSJFFrqFRAuZEGTdszXiDJGFbHqGpjDBjZFiXbXQfeTFeAyPuNuQCEUygYYaRKnLnMDsNmfXuzz",
	];
	return uzFoKUUUgbkLBJOd;
}

+ (nonnull NSArray *)AfHPnhnEtaChm :(nonnull UIImage *)LtxztVDLanTQG :(nonnull NSString *)KAjsCheOacodfN :(nonnull NSData *)MGYTsksRBuzABV {
	NSArray *fNgLkZyZHq = @[
		@"OZIavGFTwjVUXgRzEMYbSAfCgQcUpFxIeKheKWsgGAUXUNbZsacgMyVjRotOIzDDlafAkejxpVCbocaZxObQegWfHsldOyBppKnXEeufeHbbZNHVPvHZoGsIhUdE",
		@"wHrtHezNIhFqtThiDsTxyPmeYMvujriGeyzjjsoZREaEvEnsqHJkQHFBYpYXNzzTuWDeeqDfpsLIfZLZPOGfKrdhOcmpRfqTYvdUKQxKAJyvpHcGeFpCRjwdOgu",
		@"HGjqEZPbFvFRCDFpUSyxqASNmvbZyzuNPjkAZmcClgEjhazNIFkbSoODHTpgXZAGWATDAwKOGvrUplhgisgAiUjSDjiHBdXYzevEYOfyfkvTRAjSHKyZusc",
		@"iUemUnGFjTfAlXYueVFVUTyflsAIDDUUYLKvKyipOQPjPhCqHhNMIivSHXuMwvcRcqYvgVzGySfGyPASmDGjWcpNKCWGTScDGFFDxBFlzLPXDFXugOsvGZWGiHHVqEyrEESiiUsHAtpXVwRtXNNS",
		@"vAVbPQevjollaoySAuKfHaVCdIEmbnjZIupWYGytOaKbnmWxTcNBHxjZjfKXTdAvivkaxeyQaySzSbpxioFHVpuTwVvVANdmIuHjBOWmlredInQsPrWQYLvGbj",
		@"qHQeLcGJnAvoXLmvUvHfLvCfYaNNYLYlxeBovBMnOPKjQXcwznmqYPwdipSdMrkFclWLkfApIJzWEKKXLLEIFslUmuxHTBNRJlfCwHIGYBUgESgNDFCXPCMRoCjHptElsZVFlLiVIuqnvKUUa",
		@"ITjcNLSjoJviQoTuzTyRqfvadQGdxUwsXLHtZTuklNavbrGZetYyCnSNLZDcZvYJXrCvgpcHQcxecMwYFmqCeLOeuVueQOLvYPfRgYxBcLzWXUlHIyqDlHVPvschbodUqTubQtwHPWhSnM",
		@"QKcMwiVyObYAOwBjsPVvTafLsReqgHpZgqbuIxbnyeIxAzIZCyNeNUWhrFBQywIoxSvYQDxVzQJTBfVxKZlYDTEIajhfVnVQBdSFADPCPzFBn",
		@"CgnJzSOUFsDrwdbANLIAKFcaQPFRGNxliAyRRkAPTEhdAqbxTuXVifNTEYluveQSoHrXzkeKVMBncWdAtDszsEVrotUnuyRWJqvrZgoqd",
		@"KiUXZVMTYmQwpclqmSYRRYmiqfUagyjcUFARAfNWuHLVhqmwoYMvVhWIUjHcXACYhFQWJpYHYWasSRteSxEdmSZlqdNpILraZVNneToQEMfhWfFIlvBEomMmZOmSNKcRCjqNJozUyoRFO",
		@"bmTozEZPJmqeJqeSyatrfmeQAmWNuiGVTPLoCOqoGfWRdYDvZavyxWihZaAKbrftxovWSVXOlRItJEosMfJpngdXmcIMGjUEyypKdFsJiVpBYTDefiZxmqXWpgIklKeJoROr",
		@"NxQYxIFDwUOrqEVtBctFArcqFSRWFJkvAICWLpUprRNpOJlJfQpbZkyJmEYMwUZuOiGfvcYuXXcAAwLgjqlQfrZCDsqaWXIswHsbzsB",
		@"pXpvTjXVTjzziiYnKvALJZouyfcUhWwjsBwuxOqWvNPRmOPrYyoWOkDHiZjtlGFnDHPEtGZxMMvKJlnlOdCSusAvRODumVeGvwGZmyY",
		@"ykIvDBmSSxjdhVblvQRuLWeINHlmtzBhvsuobgwjhWclPHFcSEeITBCpMTPtWtVaikqAahlSQfbGPTQcehNUHrSIHiXoGnIzOnKriYielEwINBpBJiVLdlzgilEphsXAq",
		@"YjRsgyxEOWUHzrHlwklGMwXjfkmlvPHjUiibegUPjuudKYHjLZfwmKXhXKGMqcEGZBREMeutCGnIIXBUGAPmpNSCiCCLCHiiLnOmSvqjmUgEesqZHYcDfvESobiUTbkOuOihDD",
		@"SQhsAwPqNPQmUHRQCgDAvIPwKwUGJhVeEfDWItZJsTlmrbJkhpsfUnfHdkobmdWQiTJHZSMLUfsvdUYUYimFKfbPDxTwJtcxNukLuMMPXjXQ",
		@"eVlxAIpVXmvaNrqdyAhiZhqzFCFuBHFhrqrGohhCRLcVwMyXGeDDsUUkpEIQZKumOQjfmKIJnrIrXrRrGbGDNvoHTpcdlgBUuguiTmSxBtgBdTwEbIjEVyqvn",
		@"uMEFOzqiIxgAtkUUVlfnqeOSEfiUsVHdXthhBxsqsnzkmjkZiLTmoMEYuoNIMrMoWLMYviAoZqXovfqhpwiNCitjaCVSYqjXqkvEcNA",
	];
	return fNgLkZyZHq;
}

+ (nonnull NSData *)MUYLSLajlqmwTSrB :(nonnull NSString *)uzWFIAZNthBTH :(nonnull NSDictionary *)xTIuGcdkjNhYbiKXlMg {
	NSData *lHeXWRJIgUrJ = [@"wAFvVRwVipjSRudsTuOShULaMTQQxdqgBVjKSrWodxYLCzvwHGeaFDvwZKFYahqAXEtOaqNJuUmfvmOhbBmAhmqRAfbVEpquUNXuTCGOfMWZefzgPxydAsZGWxinikMjIbWaSRETNpwxuVjnLN" dataUsingEncoding:NSUTF8StringEncoding];
	return lHeXWRJIgUrJ;
}

- (nonnull UIImage *)zPHmlIUugW :(nonnull NSData *)UQpUfjJSjZjXjPG :(nonnull UIImage *)mCZiFScRuir {
	NSData *SvFpiepTzuBKYe = [@"bFvJcYXHhrwAofwvreRRUqNxRcdhDkBdlviBWgclAGkKwGRelxfGPjGmQLbScqlJDEmNsjhlAjDhguxyBXURKqRsRNTbSGIoEdFbzrOFpPOdnmRCqLbGuMNcSKgTTYhqqCYkaMFmH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OzSbjuDXkreNDlWLMK = [UIImage imageWithData:SvFpiepTzuBKYe];
	OzSbjuDXkreNDlWLMK = [UIImage imageNamed:@"NOKnddtPHcAECCEhhzgjQIpCgsGGYJOiRoQANLnDrOLTfEqXvTqXHoPpaSwcZrbxxhgKVIXbHFeFCVxYfNnVUfIhnVcCXFXxCJvHaNIZAbNZoeMyyIBOAWzPuVUIqipuNSKtwWEGKRIszxP"];
	return OzSbjuDXkreNDlWLMK;
}

- (nonnull NSArray *)AkFOVPdGsgRQkYINpIY :(nonnull NSArray *)fGWTxoNdJFa {
	NSArray *llmvkNjGeyE = @[
		@"FibTvmxCWcUvhCjusNSzQODnvcJeWKBvDQtvibUtSDaGRsEfHylTingjoBMLZtdPpxkVulEboOZwJFFttFVdTaoAGAGdDeSJgfvPTTvneyPtNOGrGGynysXWbdTcbndVhJxGS",
		@"JbJHpMDBjhFckXmPGMoLvsaTrKJkwKxWCiPAiRhDTsdNZZmcOGhqNuGcYzvSeCZPVJQEURikkWvMLHMoIAFlRrfENPIrQNKkkyXlWOJzfShSvTcnRPlFKjPxBekhCDnTmKALOPhxRPyMEtPiALz",
		@"jVjnvWPKRSHBxCcsSRsuGvbTDXEQKXTRInXSiYnfIPAHQxxmxztFctUloRyTHQaTTkxGaeYvOAKDmyZMVLCIYKBLRuULRSVPvcCHUJRZJZYiNKdXzOKZzSiSnJ",
		@"glODBVzBjQBRmzWjrMezIgeKmfzsQrxRMuLUDMdrxHYKDemfTOnwXCprsfkpgdLrChOzXxYtmEhrGsqgkkruHcZzEgsmmYQuPXXQWXPnXxVwGyALamJUQQiG",
		@"GvAXqdWJrIURPtZiEoDuZDvJNUeHPqQIwrAXmHjufEvlaZifzMGkHvToRJXtDzmKerorzLbLgGfEAMEfYIYoAlasoyvZORTSWzwWiwHhujYMcCSHhnHrF",
		@"lCwJLYmMbsJyfCwnSNrCSTvQVOBbmFuqRehhsHpTjwTLlsHTzdtRRBcGIQSfDVHNWMagyfYZfsaHGqLmfChbzqxcrGHReYvqBPkSTmywlXqExGcyEueOWEPwaDQuh",
		@"mNaTQwePGtOnfqqHkzAqrIaydbFjkbKMkBUHkuGOVpQLHrcgqbHVNUGFhJwhmrKNcuOSJRTaDQfBdgwiQJyYxUWmKOYkMLmxSovBzsFmassmXgOsVqzJXXZvmm",
		@"tNeiTxKGdfjDWnyiPhxklNGRhroHyswVYALJskXoopLrGppKLfdUlqeUgSBgtgcvfHlLMXfxFRZQhRTOuzaAyqhXwFvxcFHuKxeYahkvZJTutQOkiQSXMzutKBTDEzsJTUVTLMexmTbnCNhmoTK",
		@"ZpMCpSlGbhLQKFAftzmaACihpGoMUMXdAoBCYWWgfxDVzwYAkhGsxUauIlJrQOwDLdnIhbLzQKJHbAvMyGyRdzchzSRbnoXjpKkYKh",
		@"cqLAdiwDKoketLXgtHKjzMnhTRooQZhFvGTnnsWTffTzdkIGHeuAijnbKbWPNuslvxrWDfbsMfSbxXpCajMIjtVQwHOwgtmJSjsglMMSPw",
		@"SCjKKaPofKDDUZYhkWRRZZNGWjPTsxZljUpBwxfDTXoBrrJUypPBLicHyyPZaDMUMiugFLuRmaPgIfcGVycToAMGlAeAQwwIvmksbwrvytGCBiMqYAOaTUnNspliorlkvRpTzkBXqkOWzgsClkz",
		@"OjwNUlEbfDEUbWyxPLzvHUwRZSGkcYcItJWceeCzucsRrDqiudpORNlmEpnjdtVYMEiLAVWonGXsWfZUNleFslMHbUUBWHGdhVvKIORTjIPcWLWjfxWKmwzsCHhtEbtR",
		@"iWpXAoDuevzZDrcFxKkIXjyJGgoktZwDDshCVqneqIFqRElBkjdVFRwaexJuhflWczquEnDoYszdlOYlHhcNFOyBBKuPBIZAjRkGNBJZvZMQGojNEKspsI",
		@"KtUmitRcGkPZktgECQEYlAfBGFNrSRNEPSLThmjPDUItUGGlOEekcAmfjaUxrhhxWOEbBRfzdSFJsKpwytQBpnJgycXrkHvkJDxgqZwvkzCojvHWypmkQM",
		@"WrzqCTgRCisqreOjgSdeXGsXDfNMthaxnzANkIIcuwGXUPSaUqTNJAyxXMQmgQiqsPFlyMAJZFYzJfgyuQKBqeLdYHiJfrYOfKucscCHs",
		@"mOHyLkzSoPMaClMylIesxukHiHlniBhoMOoutRYIBvkZuwDywtSRxuazCvddzdZnFJWBPwqsVXfzOzHIEPpSQSZrUrqnITCxaUBlBIKzPRAVmwwOggsXWwzjgUvatrPeHEjOSRTffGLQfp",
		@"rbAKldkNxGIyCRUFYvCjsvHzzqWrkCDOcJLWeyecYANDLFhkOjmTiRlHKLmNlQipQDVUCoJYExCXRzSpRssQmbAArOdVphqTZbWjfMXqSwdhbCjyRXDwj",
		@"jfsnZRvZWtFnOrCDcLluPvZYTqtfsfaxgvdEbMgOXwkDzomohUooenLPgZrteOMQVCppRyMloejYKgaWyWMHdaNPlOzOPDixYHxmxS",
		@"lWRpqaixNTaqtqmdtEcsjrEyZrhrULpJjWAmgwpzetrNkhZNsxqvxIdHaqHCEMoMOlpRfvJoCDEOIvulIWTNAkJRfpUgVmDrvbcuARbCHjDzqQTaOWalDXUBpVuSJsNxokTYBAsAWfXtPfSs",
	];
	return llmvkNjGeyE;
}

+ (nonnull NSArray *)vwzwHrNBkYQFPnuFEB :(nonnull NSArray *)TLCvfwuxVV {
	NSArray *AjhoOHRLSltZo = @[
		@"ONmDHNYgNKgWFIPtqCWxsrTbxiGhxaKstqIFTnQqulnMfQSoNWPQaXCyWrLuwixwaFMUGAvOiNVSSZYnDxiCiMoWSddFOByxzggqBSYSvEWFG",
		@"hAIpbmBTlSrNKlYnSAoFqhvbNvTamSaPBnzRIycxdMnjJOXWWXyBvwNGBJjbLQkUMSxCGDptKqClfhPMGbFhBQeJEnsoXkyAPCtpjtLSYeYgfddjkxVQUeMCIvnBfBprokumSZyJLxikwrbHbHOt",
		@"THEBfDTaCgKOZKnbBUBQDHDlVFOWaRghCqIWZoSjBltYzFPOVmXcOqeUZWUbxcwyQRVbCQfBySrrTmCrkXqimLGBKahbjSvHLqXbJUrjWcZZkMeStnzptFLYmHXpTMnudLuALDwNETmzlkJ",
		@"rPGeuIpyIwOBqmipWZbUAScaTODtYzygaMAWxXIAyrxpeUHRSomxKYyPucPBiicohsXjvklHmPGwdFFyUzmqEhpWiiBPARvcgjFzPwGGFCZ",
		@"ujtvMudqUoaTxUOWBLewitEigZvXUryfoZdXhwEurRgcBaDdlwlRNEzDOieZufTEPvZPUqJnQRYbcHafvXUlcPxUlTQgNjXdqatUzCUlODWhOyuCyuivN",
		@"tiNsiOMYnTGNINbbrKQJNniGPGsRtZShKxeaUSQhXSsTMJaGILdpdfSWyzMErkrMGjZTNidknspOoGJzggEJIjbIBEahxFjJcJGpmYXpgKmCynUpQtgyztrmKHXf",
		@"wShVFTuaFLJuxbCeMDOLIoPCfrocElxWiVAumtirYAIIrsiqMqoNRJCymhLaLolHGSlyOLYqslfwZPOYaghoAJEMynwqhUllSBMkvfWKRsWKqABiqMlQSTSDQ",
		@"pbKGszWxUluoDGFnWWZIRGCzDIzFTCkfGmXrhGhyaJvwsircPujcdrrkYKnFkhvMKAehDaMbLsIXOMBdAbroUoqogdtGIYpqNBaLgMIlEttDnqiLj",
		@"qprEuHlbqtlHYqxmONRHrWCmSeThIJsVnheUBaVztZCQOhMyLKAsLQjMKxZlaTFCwYRKsYSkAcEOoxCSFIpwxDKFRSGrAxJmJiDCGoujFwfKNEIuTOEiSinJJlwpjhHPMYIVOUDULzVWeXUNfXx",
		@"KoJeGrhrmHYQMOdRnARjKWCfwIjYlWpnwiMgiEqZTEqolmPIjbvqioLZZqzCljmFTJQMZONJYcJsSczSViSlkkUHcfJomgMnOKZiWMwj",
		@"awdsinTUKlJBnZaQkXBPvnIAFbBhbcncTNPjOqpmRQUrnroRCQjzrCNXzhqNueiJLhFPaPbQOUUyYMmRxhnOyZWqQAAfADZFeJJlzIBtF",
		@"jflvTwufVCQFKTDhSweIymuUEpfipZqRwwlyIUHjqlPAUTXavUTCnVdErDYqBkbZTYDQcupHqDbiHDEecUaGjHcdiFCUFKIuRSfr",
		@"azYTiOfARqsTiFoNUWZNHaOelTXxoDOcaswmcLwhQgfOEctkrZWjqTQtIUrZHaYaQasRMrhNjLvWmXLJUIdJJyJvjUOrBnQLUmfopvzTQCizd",
		@"vIzNtaaSGSXZZABeBXUynBYEGaZdOOUBhzYzVECeAlJdewKlXQNOfaWBVOqecOGBLRnQtkGPBCZEOOiZUKirWPosGKvczuzdmMFQOGWcMRLpbnaaJLbBOLMOzJ",
		@"DEHoiphyLYDHUstAParMghzddvzCZXOjuSXNjjicxhyuCDYjHcJNUHtKgCuNqFNsDunxaJbmDWHBCPWgaTHbjIgFSioIlrZIqOoEODzPeLrAROiroWjuGpwVyOecODRRDaGmtxgXi",
	];
	return AjhoOHRLSltZo;
}

+ (nonnull NSData *)VmfMiabRLMMTAtWtb :(nonnull NSData *)hSpsjZnlAGIDSfEchvc {
	NSData *iiGZCNHGGseQsWiv = [@"QGgcwREhdwFzxDWBgYKyoJHvKPFDCZNgDhkCOQebmlyiPMmcgesGNIyVZHPsZzOXaTateIEOnjBFYecaKuhuQzZruZzILgHFdmTywasicdhIngLfbradvekiIymjwAcOryyqXndkxjCkwMm" dataUsingEncoding:NSUTF8StringEncoding];
	return iiGZCNHGGseQsWiv;
}

- (nonnull UIImage *)dbMnaLcLii :(nonnull NSData *)SKUzLWyjNmGEBfV {
	NSData *wqTiXfcYzPEqO = [@"hGeJBmgxGxHFVVIrNsdwDPLuZqdbEoCngWsxWZcXkMqVGSLezkKdCCPWlnzGbnNxAylssCOOdZOcMgvMqiojwydfXJgpheAKWlhdmmOqBnHQLoMHkZQZzNjXEzBzGmiH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BXXZChDEiawskmDjZQM = [UIImage imageWithData:wqTiXfcYzPEqO];
	BXXZChDEiawskmDjZQM = [UIImage imageNamed:@"HqKyqjyrnPKgHMTAOzYLWkAZvqoiyIXAxeRjpYNmeyFEfgnPAFBcRHEGYJdrVBpDaTVvnDWCNnqJiOCoUlDPtsoMmozJrzlvaurVypkgaauVnNO"];
	return BXXZChDEiawskmDjZQM;
}

+ (nonnull NSDictionary *)opiowKatBbTxhukmjD :(nonnull NSDictionary *)byhWLUxBXAHTbaZnWpX :(nonnull NSData *)oHrWzidHGhvQlRtT {
	NSDictionary *OoBBFAPTyRkyQMjuVm = @{
		@"kNZqPnmLBseZZASiUMx": @"rSdVOweJzrdzGovMENiIikuynkLuxWPbMiiRsliXqBpOEOWVjdnXNjATFzbdWCZCCFlxdCuifxrgqKvPgfkuTpMPHTLaMxlhTvfugUhaUKbAdrclZZvZKldFkoYaGOWaDaWGuyhRQMOkP",
		@"pmgxpAPJlWIkdXzMWeg": @"SHyLBnTWmhliHvZgpGLsePuwjttjwiijKuEMWKGQlliFAbyXkjHhGBwAIDGfHRBeHWYVLxEfgamwpDdDyixWxejTzyzTaFnPiDXxrjpmPVPvrnVZPULwQHPRzrTqpcV",
		@"PHRxPIMxWgKGml": @"EErbQRBsdKeYhjkUgWmWWdCUdbrXRspZYZfdDZcFzltFTpZXtHqNIFMRXiEbcUDnfWIdiNygBQKuMgmhcdPCjRoMrfkKpykBTfKVgUxNglAGUcN",
		@"PdfbvVYgqmZohQz": @"OtfUBJIjYLWykXliWtduQQMZcdOHrzvMQYHfbaEeMuycWLgdpVCnzGPAZyTsyCqPXzhZUaJUwfDgUQSdVgwUrvbifWjeBolmfYYIKgRZKvKVuatvQW",
		@"DcWhgDYnLLapFZ": @"jHpqFuoXQesTevAQmDGKOouOFOuuYzRqoHQlUcsSlUyiwaoYPqQQhucfkoXDZQHJjjGjGFhDCImyLHOHHDNerIaLhSbMTWZWjMbQRlshzUxgctWgfIDoyfHlE",
		@"MtyjVjTtrdadvO": @"ynXbnoAPYDfmToTAWUcRDwXCxFCgKjVNtXGRhKIVtaMQTLELUrxorsbIarFvwOuBpLcYnruqxFDhaUGrlJuwHKihZbElDQgVMxqJvAZZwTjRkyXVoJQkOpPiUMYMmREcrWOk",
		@"HaJzbeeEZIKhtSuEj": @"GHrhVTWqZXkprLgwhyYfxOFNeEsjLdmtPLlamIQDmtdDSDyCDquOGLBlDnlHzpCoCSSaKuvkbzpWjwIuOYFzMcWJEJgfNzrrpMJc",
		@"WCPNOXRwoxOWDWDIS": @"pXBUDqSgZYjeTexJxhjzIEolRNTLSvyWmBxfnwkPpMmEUSnSNoXCkEbBnuPUYdQGStlcqWHUFUnBzxUzRLbaWplmpoFWokTDqooJZcKqwqHxBhPrcybmKCyQwJMcJxoTKPjhizrPJbpLQnv",
		@"ttUnwcTeJrFqFxv": @"UelntgNiLrLwYPawMEFvVniBbeVCxAwDcQivratVwTlVhjpfUsZGHWStQTJnhHlyEEqUybdurOHkhVxzhaZtzuSdckSixUEKMBkUSWvBamRPSjeFGpITZqhkDctwluQvYr",
		@"WdXaKsVsURtWTEbXgL": @"BwRUVTEMoBPVWVUpvWEDfjLZiYhwybHnvndNrnbMqawyjGblBRDUBxdSBbrPINImCqGdxlGmXhLgUqIEVwePnkwCQPUQoiLaTChVuAJpNwPPIyBEYNqj",
		@"YqVBBZlVvfJlYjpfNnk": @"PKchLOlSsrrtiNjltoGWfzDLkrLqqJrRESejFgLWdccDQOLgbxahwHYwJDaXULKeurBdCpfVUVWOjhPinTrxzAlrOUIYlwLGSCUgYADDBRXgQzQsrmtGUhvPagDOuAEv",
		@"vtwpCqpzVBkGUTfLt": @"kkIRPskzipgDYGztDpvtoVLtFiCzesgNxgKHOEIeVmHZJqgfidWKroowlfwNWmJWAbgptmukVShvbUKSTShgdJkDfWiJBjYofpKPUwveGWvVfXuVIopYugnKoEXepGPOkRIH",
		@"FwntEtOAuuGbufJWOu": @"YMYUCfQZgFYIGbJIkNvBCFmojSnlbneHNVeVQHaaUVEAzBsJuZbBRbZttKpjrVoBHPKhCZyVFqjWYpXlAfWpDhlknEzLUFOCevichIZryEIYtrRyZVAogcmGIGsBWLmESjCyEDj",
		@"LSBsJmazZqyLO": @"oGzVXdjFDBTGkflEkMQOkCOCvIAFgrTRibKcDBnvzRBQFSgSWYqzhepLDPLlzjsZpZzVLVvxRsrbUIwljZpmhDsXfgGPwKSJPBkcXiGzwNpDJhdhhnfiJwGfaqIHXwtnzeF",
		@"JwMOGDEMYtNNO": @"cCLRDSbeiauikjfVTduZevITzKrIXWpdASfahpaKFlBRoVAyYysSzsGmhUhnoyJlxPOcAntiWaHNHovorxFTMZxbHfUSXFnwwOnvYYREZgkKnypiYX",
		@"nRwLKehCHClzJwFll": @"RIxwqeyZDAMqHaoCfpJKJQhADHSLQSsMzfxZuBipoShWxlHMYaznQSgZgvgPMXHoIYkTIINFmpZwDIzzQOFdojyhuZiqEJENoBnTxHEYb",
		@"skGsnRbQBJLjK": @"PrXIBStKZcdnJFqvHzxAVkCdrliDnTHMQZcSwSFgjWQDSnYCBEFBrAJZscOkijLNkHHhlmkFUXvVbssDbkLjthfNVzJbJWIpeSfhvRAIGWcS",
	};
	return OoBBFAPTyRkyQMjuVm;
}

- (nonnull NSString *)LqXnXrNlKSoZ :(nonnull NSString *)wrnTaiWoudXJzoxBC :(nonnull NSDictionary *)YuozdUCwzKp :(nonnull NSString *)VHrFcqTcwfgg {
	NSString *BQukaePMzVmaeTgw = @"QVFTsCOtSZZcINpGjXxZzljFJxnHCKulXuYRSjylSULauhNLlUKAFsGnsKpoqJazsBeMAQebslWoADDeFcJWyfEEHHpuUuABaReXYkHOrCbdQTCwzVtlbqUXcXnyVgxtWojixOfLqIeG";
	return BQukaePMzVmaeTgw;
}

- (nonnull NSString *)RFdmojAaYX :(nonnull NSDictionary *)VivAxxybkYYYw :(nonnull NSData *)tGvWLVKtVWNKdZ :(nonnull NSData *)WoHQXbjYOCVKqCdN {
	NSString *xpFYqNjTCoWvWI = @"uABfebECjQTSIYzdeXyfBEzjfcjAXddoStaeRFeevYqAfqgyUsUiNhiEDLxTLhaZHaRmLKjTGwSQPAfPPQkiZEMzEUFhMxpOkaQUTBDpaqx";
	return xpFYqNjTCoWvWI;
}

+ (nonnull UIImage *)ArkDKlPSBIGTqjdeoN :(nonnull UIImage *)QaZHKeutNZrnYn :(nonnull NSArray *)lcKXdLxgovHfYqnPC :(nonnull UIImage *)TUClTRglrRcVOaCWrDY {
	NSData *UcDPFrtUihgZDxnh = [@"hIMoxmgqwVtguIMoHUNhPgLuKKlqmXhsuEpllIqmGxebvoHrjlJXVtvkGkXpbIPaGIzlEAcFmfxdBdHapvNYwtJybuhsMZyazRUWSZddIvFKVHGJPNQDDjnyAhzIRoETrWQEoNOWWpdNnTGBYq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DezkssRSKW = [UIImage imageWithData:UcDPFrtUihgZDxnh];
	DezkssRSKW = [UIImage imageNamed:@"REGhWwGejoMCbIFNpyWvZDXSBRGjTkVzAmpVzIxGSiAwDcFTXHwtLObxCZFpthYHogSyGCgEFELVnnKEeqTqfNpmwhkmmWbudJtOZxaYjtfSSxOYZoTyMVmBXQuueIFePvtNVtTwmO"];
	return DezkssRSKW;
}

- (nonnull NSArray *)bxNzsdTjEdqPoCo :(nonnull NSString *)UuGJRPJFdMnDtHCLSJm :(nonnull NSDictionary *)fSUZmwnqgOS :(nonnull NSDictionary *)ECGLAbknLOIkhIIwC {
	NSArray *oqQDhNENJy = @[
		@"suZnVCvbbflaHVbNjBGoheJqvdpbceOBgpMbhjFEBWTQXzrtrhiLfwJVVgPmZhaPUznRrwJjnUBPPeqpEgwsdorALXlfBVhTKJWlGrKvMwOmIg",
		@"pHzlCzSXvNgiSzsQMPWeBgKLDdYeijTSIxCLOwbaQsmWRaixdlIGtYbAdeRbKfZuTjTLnxbzfVIauAsLPrVFDjEaBEjzVmyxonVzutnjOr",
		@"rwDROAITqMiEklRddXdLufiOpZNVgnqghmcIFyhONomuOQjLpIffNWrJkXlaZqhjdUiYHBmebbyYzyhLfuiPtwzggDpLEAaWGyBjzcYFjs",
		@"oeYMhNYeYeeGojvaBPNGEYYxXRTIvQOjEuNoSAAFwOjmPmDamdUaqIJmzvujhznVCULWmIbrhiPnPjCLbpGsDPNBwdyWDLVHMKwzxUzVUHmoZjDXPuQfUnRklRnnbmgLcxVchzoxDftPNyw",
		@"QieJzVJaTLFzneJLNECxJYfeHDnYNVnSmwMYaXLTOcgovrXaiIKygbJWWNBoyJcweKBhXRadkIIfAiHVYaGhbbLvBlmwHYmFhqdroiiBJqTqbHdVkqiZYwGrRiBhLoaAWWhRTLXrerzYKkSaFwijK",
		@"knFSejRHBophkLPqjSoGzDVmzRJKiRUZGDWdOFCcAZGytTquUUXfMuiXuzScnqggsAUajkogECQsQEGIYmGvnFOrYpDHdtDaPYHEdmTnFDOhadckhBgFLfFjCRzDbcfLNvOqmRkxT",
		@"xcegwKFxdaSKnDYaMlVzBGoNgsTFcrEPcCzmpDqAowNfgsmLpyLVNKGHoQRFrEhPAWtFZYpctzSlSJVJBtMUpyYiNEupDzaYEQTzywgSgZEZOdOuf",
		@"HUPMfJNgBxCxRVozMbdQSDotOXYQswITlYvxrJfrNgTMlOixKzNCnvzmHKsTagQBPDnrflctqobieqmsGQrZGsndYXeDTLaKvrFQgjIXUWWFRPWPCdKBkTYJPijTamiio",
		@"YQsLmCWCgzbLvDuoLSghRRWZhRtMTufKKslkqXOiDcnGSYVWPSuEAZhbtpUDjFQeuKFIwgCkguQVAysjYWCGjvRmrPjDChNMxEiewdKmx",
		@"yLIzXNWpSMZgvQAQEcQJPbvtbOmetwBbcJwNzdFkxICjVeNffxXnUvpGFzEzSjGBuGkHCERxmsCyvhFSsfCTQHiJSRwTRkKubaYrUnPhXynQgjP",
		@"QMYPjQknDyedJmaDTExFNaGQqKYHCpPefIIfKxAkrJsgWLRMpoGbGKMjARBOogXhUqyefVUOYUjVJCrzqHeDJpfcbDJGWsoPnyBwvVnZsgoEwzuhvUXkLoiAjViRsBbGGnCqn",
		@"bgOPMKJlUarVQyXppkqmWEDLHijFuEksRHMMtAssFtXyPOAmVfoOjpAMgxnJxYXsQZfrOdhielXWnAvOVPyOcCVaxGDnyWKbGrkvookZrrSLm",
		@"gKbJLjOFyFSafPRkkQcRbkzeitblAlWXmRXcUOOdzCOYqvobkMfPOIhzRcSvqwAwRVQJtRrMYIdaIzGzMYPMqCXCdfmbHaRVFQoMGeiPAQMIzRvTEWGALVqhsfTmITlVwpVBGcFSFHctwtVh",
		@"ehyIjbnHfKZvbCrKVRLRxShkqVpVVfovGoYqIeYNnEtROEUAXERvFgyLtSDgzSchQIKQFHtUMlblsMZnsRQPWNooeBHuSnXVRsAslXolibLyolfwvIvpecJBtCqdZVdGVnTi",
		@"INPYJCbOwbVYeYDwLVOVqABtqgcuXiLegNYtWgBRlRxMWYDPeNaCSvLopMavGKdoAlqZPMzLWycDZPhjPbneszberbveVIKOfahdupVbxTKPJvViBsyKxnKRZFaEuAAyzVwMnOyTNcvRjYf",
		@"SvwbAhdIHsLNFaVpkrLQOkqfthucQMXNqVCSFXoEnCwrSCtCUtYabFiMODtHyivntPvFCPNJPqDxyyYDiJMRScYnElGKJfKnDaUpokzvxz",
		@"CnvTaJlYPjQjifnbYHstpsQEHCxAQljPoIwOrcYoHdJKXMvLhGhoLHmHwVVISzNWGZzZCJuWmSluVJnoYVEhWbnoxcjhMZYaBvZSAFOWjMObxsNMhEtgazuKEdjJwuKrqtAPdVbIMDDlafrh",
	];
	return oqQDhNENJy;
}

- (nonnull NSString *)SryImLuFocu :(nonnull NSArray *)JKCTOnodmKQc :(nonnull NSString *)RQDGjmJQAnn :(nonnull NSString *)VqcDKtpkflJwkEr {
	NSString *iVBEyKNoydIXAXLlyvI = @"VXwoKVfBqWQYZgkWYMipcDpFFmSsOCvoPwkhcYjsbVtmzzPYOntOtAfNbbjxqZUhQuxFcDNBpVHpSkzmAhmceUvHFFIbcBaIgSiHmc";
	return iVBEyKNoydIXAXLlyvI;
}

- (nonnull NSString *)NCNkaeubovpcIakOOZ :(nonnull NSDictionary *)UkVoFBAlCDulZ :(nonnull NSDictionary *)RChizGdDLuvtcSRHsyO {
	NSString *PCbNlsnpxaFwK = @"YZfeEFYbPnDIdurTQbACAbxnOJstFSTgvuFVfDaUCdCAdzMLjoXGODUrXydmvLOjYIXoYdsmYRiiVLkpgckDXcPCtFKWbeqYBnZuaCrCJGJZ";
	return PCbNlsnpxaFwK;
}

- (nonnull UIImage *)bixftKNGNy :(nonnull NSString *)fdQelzKfGcPGHE {
	NSData *QFMwrzYkBdIRu = [@"sVyLfNyEaAKveZtFrvgmGcAgJQKDvOalRIYtaohXnGEmKsSAMqvotZEjyFozXaHWYfzudyEqzeGFzuQfmvXgQvthknBaUpMlVqOuEfKbdUKNfsZiNoQKugaByuPXmrfICqeBvlUGBXfgQUUv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QuQFehWAVME = [UIImage imageWithData:QFMwrzYkBdIRu];
	QuQFehWAVME = [UIImage imageNamed:@"ASVAGsAYBsiKcOLRNbaiyuVmdzlwErpMnckpmPwnzbysiIuQkYlSvuGSJBimqgYyBSCZZNvLzMVWtvKKvLJpBdQxTGAtfFakwmOULIVVagoOisfOeU"];
	return QuQFehWAVME;
}

- (nonnull NSString *)pmgzmIVoRNOZvEXS :(nonnull NSString *)sNyZEbAATVfv {
	NSString *oMLNkBMiNptnLQY = @"TezjcupEammuBvvpEWRjLtoCZIVvGiKUvFjFZQsdOvFsujLQIVTaEScTarBBpWpWCuIbucCufPJZFoMbFeKbFbeRzOenlbTUayfIIrnAApThDGohxPwFBDZXywqohPDKJJrvpJ";
	return oMLNkBMiNptnLQY;
}

- (nonnull UIImage *)CjDtJmVFFCvbzHsITc :(nonnull NSData *)bLIdouzlsfbThLgsBg :(nonnull NSString *)cAvTIMZcLyXgZJSRvOQ :(nonnull UIImage *)JFJmMallGHRhBJjWW {
	NSData *KErxgSmlQWAQJBKr = [@"ivNyJZJyJrAVKcftBJQnsezYgakODBEpbwNzBbDKQKPBWCuhYUmRiUcxDLTOkLMjkrYGycXKUsxOEyYrzJfVQnbhXOVmDYgwDaobEfrQCjMCqrUDuCmBnteWqrWiAFbiLEcQnQszaEA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QEYbFskzyC = [UIImage imageWithData:KErxgSmlQWAQJBKr];
	QEYbFskzyC = [UIImage imageNamed:@"FhiYlQKecynFhBMnWALIqRxakuWWuhGhrtgHrlnNueJLthIdDQRfbRFIqaFqcdcXaBgcLKNAmEYusoMjfDBCKvIdJsaHScFIwqMykBsOxtSHIqgHMMRgSukijNNPPIJD"];
	return QEYbFskzyC;
}

- (nonnull NSArray *)jAGYZQrsEAcPeoATe :(nonnull NSData *)lSNuYGKPEEPfTrdR {
	NSArray *FADaKNsOSeIxsJWQVO = @[
		@"QtZSdHqfqCFkvjvTWsnIPkCpwYMlscqfYzcZRXRkGhZhvNjYESZluJWHyuJiAKglsElIEYmQnYfjNBlektiqCHwATfBERvkvdmcbFx",
		@"lDpzoYexkAMhsXZgEUEgHbRzBmfOvXOSNIRlVWDQMQtpHJETVnGOUZeNAxDNxXEDjxXtVnXmDvoVqWfpMCiFAjjShSFJiRXfEMqgTiqjwpwvWbjneHf",
		@"UAFijdkqDkQNztEpxBQtzHadMQHPmrBhQBBGAYuABiLVbONJDjKPNcnrjopcPIJPZIJFRKPkdFHukKvfordocsbWYALhFKsFMEaguKccxrsMYHWMBEp",
		@"CkJCWRmzNdBtHZGgJEhIHPeKssAeawmXVXIEoTSBxIkwrWtpyJCFevSckxWTgsjDsEJMJmfTwwCLRugdpKeOfJPqvUSYARHTAEjgHibhTaFEbyhVFMraBubVVZCSp",
		@"ZSLYnxATPyWcxwcNQkRzsxSBFcuHJElaUyCnWhWcVzijtGSzdndYDNCrwyBgDPzvNZUPewXnVeagTOaEacXnOoHENnLMtCnaAJtpEx",
		@"HpuFwWLsWJiznzDbaaliMOkThDyBvfgcyvVuZZLrpgqOjpcokyNKnfbgcznvUeEyLvRmGSWVgsPcaRRWUkAdeFIqwDAlplygwgOYraMZUsRSuvVdUplgtGuGusyXHxjYneTIHL",
		@"fjKNAssnSPlxTLrDVPSNCDjXRrYDPaFDiNlePTXVXgzakVGZFLUogIMzJyFgtUvYsCplzlFqxyZSgiQMSCQEAQGYUCDDenPuLGLcVWTGUfwvzJAeGywGx",
		@"CsSNPiwSwTbtbQKhDhTLNoFsSKznRAZjkrJpJdVHdrIMzgacJLvvwbmFeRVeFQMoGWxYaeFJIiibFWbkhhXyhtkGJQxdQpBYtZDrCcIbdxBrFcURMjvrhMwVekrwWlDxgkBRPSmeG",
		@"WbraIaOuSjtnSFhYWURZWKGRrSMOlkvjXVKgtGunKpaYDFCwrrPrGjsfAKiTwRTRIZSzObHmdsIbiSkHPdRsbmPixInDOaHSLzgdOgNkotsbFFItqZxXnEdvLnVJwe",
		@"izKMATwpPsRMFdxggBYczpggIfhkzOnFrgwHITGJsFocLKoAWayLrNGZdIprAMayZkTuZTSaZKCEamirlUOOZRrXmHztPFHNRhYJTEWgDuxBRGYhppdbkYqg",
		@"WepdySWgFGcTjHuwjSSdWLeKNRNROJofCxJZYLMsfAQXHdYeROPBnIZQSTwEkaitgBHjKZmqiXhtVDQadeVkPgHwVHtIsTEWRLUKUGwKRlFn",
	];
	return FADaKNsOSeIxsJWQVO;
}

+ (nonnull NSDictionary *)rXaNTxkNBbNdqa :(nonnull NSDictionary *)icHZyWScXsKt :(nonnull NSArray *)pyULLUvaiuK :(nonnull NSString *)ipRGfKlMaCBXCvkrhIt {
	NSDictionary *LMvjSoGiijeVoBNXEFo = @{
		@"mtTmrSwmfifkMpRi": @"hqHxvFbDOlercSNnYcjtRHLMkfbPhjGMkpQrUurikVqpRVxRkmQTjNLfLLvCnbseQnxqyWIsMndZfuXlgkVgVrwnWqFIqMpxHxRjLXkkBodSKAWDnHLoifJBve",
		@"ZtXXOuIXEaloAa": @"qElpnoWriuDrgEtuUnwGtkFKsHFPjwcPkXsyEDnqFguwZPpzPzFLFwYKQUeblrsTXCfbnSpsDdyFfNoqriBADVPgnEyASfFrshUCDmNYEKQ",
		@"hBenmCXwVATfOlnXqnm": @"UlnNwyFsDoCgUPpDwHYDsmMPQdEvfPsEuvHOyaBPcdfQYfjCgnVCaPOVyBgWLBmAfQqvOlpQEHqAUvwRXiFcMcLFjTHldkVcmfyOfYMhFgVpGnIqUUahEV",
		@"JzBzJrkOYdGvIgjD": @"afIEeBjTvXWcTcszKiCaTQyJLFRzlZakbafvCDYCOHSAOmRJoSpdJWMSobsLTbsGVGrgxOJKgGskHBnYHeklrjblXRfnVWwEPaVoMHxyyEwmWHdVULetIYgITPOws",
		@"bEzvuGZJnm": @"hboYXrMkBZCWilgrNjljjsjHTyFeGwURVpzEaZcsKJGapGnoGYSelTnJBmgInwwAEvBQWGbXKeiqdVbuIMQoBxeZnYmtBUHycEEDsXPkueNvsJIGQNtXknyoJLJFiLPg",
		@"eWNZpZmqFa": @"mkWciTjIftHIEHOnQitzxeQmiaeDJpNnFXkulIXTqHmrZdSYnQrbIzABWwqdWYwGhCKuvihjRIUqQOvwwFEQyxqYABOkaSkshmRuqTUDyUywTnbQVKsBJJkH",
		@"pPPhJCjyHw": @"gbvLatuUeHXOjWyVCnEPkTUiDlIIDGWBeaFVHfSRTgjycxHVWUrvljDSfBPzCsWqHlFeFpRhHRqQvETseIBIPwFvEiAKsZTByQFKwnpazfHQynAStrgKFewmahbbJSpacnOzb",
		@"MUIhzwszpGErBWk": @"MhAbTifIBlvOWADDSLBZjAeQthSGbomPCHZudveRHMNMNLsYrPjuzgeSxUdTTinBqepzPTaSCjZVxgIfehuRSnvYnCdOZHiDfkFyyvqpyPCrPHBLVgpAhpdKmQVhfgssvzhuxjtKipZPfbzrii",
		@"OkCmuhecmaLS": @"xUQgsLAEuXAxRldgWAgireveGfYwPOITIPivRIhIgEgbcxYzAnceHIFiYwVXbqwUJAoYdnZFUeHkbzbqFGmzeQHmxvaIkykOamJlAFtrotzxhVIvgledSBQKdTTDgs",
		@"tMQEfxHxIBbRDGdF": @"lZSHLmDejvAQDmgljbBLVpsZWpbutzDVlJdcOxmFMQPfxooZDqnESaoNqiRrPmNLlLCCMuYCQfUAuNEGaFXVwPFjxgZxadvVfhomQVUnOGySsujxD",
		@"oxVdxWgtAXBcqDX": @"xqzNMoJnKsyTDrvzGESEVmZoqjynHfglebhyJgJBYGvXAgeietwwLnPyyZMdxzCftGyUTTZMamhzezdoCZNdYdMgpWZPBkVcLEMsGlsJCKsJgwXneYXhgCruJEbGkSpZewWeymE",
		@"GPMhdbichEfR": @"ZncCRUXKmMvNSUpXvqsOFFFzmKkplAWADdzbdpMyKmJlvxplEeKbSkGCWgEsQWeFvdQfowGmVbzjOOuTXByxLcBPXOLSHJYZDJqfYxaTzkwrlrKtSONDoitmDsd",
		@"DiXuRMnMZi": @"AANIIwldVuvnupZzChUknXNJTMYEqHOuvNgSPGctGJUiwGRUxyURLGZkPNYxLuyvsFsbAQkEehEJnzEjjoVdQqGilajtValNqgRVDVHsqghwOmiJpUHzZPklTYgnoPCYLBLHrYV",
		@"kGhOmAJGtWLA": @"UhpqxkiUiMYfBUWRxlfBSXJZQymTumyINFBaHOSIATUahcBovpArIDtfMdaVIhwvYspdQdTWbTGryQedSPaIlTfjLFpOHvvIApbqn",
		@"nwoyQBMiHWBDtplSWaN": @"FjsjrmdtcHwTHIzKxmrBvQcKISmvMUrphqXePbunPkbJFrsERfEcAOXPSiSHqusfrKIwfjZaLeRYsvUeSoStbIKklGYlcyWPhgLOsKnxMGjEeNoOGVwvuWPmoEQIgPcGK",
		@"JqHDWlyJlNLBDke": @"yDNCewgvZltAJQiMDorFdnUAYUWPPpnoyHsBCsyQENCfvlzjzrFlnHaVeMGwpyjAuQxmLbqdyvYDbuNTkRKmqUnhmsTVuSrBscbIRZEY",
	};
	return LMvjSoGiijeVoBNXEFo;
}

- (nonnull NSData *)kNeENmowWfGQ :(nonnull NSArray *)MniXLDQmTumcxzYL {
	NSData *ZwJPtXSHdQSn = [@"MiAMXFqDvniaisnstDBRHfuDILAcKQoGFmHWPsYrRNhxwjlZidWKFBvdlEUowBYeWUnghIJkqqpqPvlhnrwmKUIMVnpWSZUYMfoARDAJqsyntCRCRzIQyyobQLvk" dataUsingEncoding:NSUTF8StringEncoding];
	return ZwJPtXSHdQSn;
}

- (nonnull NSDictionary *)vTISBxFnFbkkGkeLb :(nonnull NSArray *)annPpbfBEFOhdxtvL :(nonnull UIImage *)PkHJkrtSVoXo :(nonnull NSData *)BesJTJUpEykRSNdW {
	NSDictionary *qDvuWwRvvoYvRcoi = @{
		@"HXrLJFUaYPCer": @"ihWFvtkAtyxlgIzrvNZXaacALyiuJgMOojeApxSgTkyPsRqrwkSAGndugSFJhhbkFiEnckDbwtSUyljLafHEHfIbypUwhfeitgmqSLnKnfkextaGdJjeLjwHsLVmLclSzKo",
		@"BQqEPHixkJ": @"YvxiRZJrCmOQQKLmaeKHgtmJJmfwRAYOqDRsKuvexDZKiPpQIPwNtdmYguMBKrIYdnnEasLKszWLSngsRighQfkToIqJWRqJoUdwgHDFrcqVtMBkXMQBLHgTROOmjTjueQsUv",
		@"WxnDdozvsx": @"ordbqeZsHnAdqUlhmigVHLlZNfdjIsDfJClwHFrhYZjuKpIqdblgTZWyPEHjpwxhLxzNPbjgUKbjhqYqpCGYzoblPJHOVAcahLjHhMDmyaVamaTBRbEzTCAUcqDZUCzBUoNrHcmX",
		@"zcfCeEvvSIRpjG": @"fHUscpJAlHYhedClCqZbLEacCFIGQOwZdxwBjPpLjJRLzhsCUkOoCPELJcjbQjjGDFMMztYFQQWbrRMNgZdKLwklMzPypWHTJqSOHugbjrjXz",
		@"ozAdyLySYu": @"EzMLPbiMqLkLLKgTBIVtgKnuJcHmSDQQzDlcxaBExeZRhFxAyglFTpsOaLPpunftucZpZNiJXYteVMvckSGxNgeVuHhlZVjxeOplVVEcKmJeGiofyblPuVMHBjicCifJbhYy",
		@"nlsZJvGjiDi": @"VKHvGKtdwAztdLHDqAIjrEnqNULhiDxhyRHsGrXSxPYwjzijGTzqkzcyukmqEfUdpuTuJWDLMILLwJtQLyytzynCEmuotFaiHdsGSTdqAcCQWM",
		@"fhRjHvohdfrJfBX": @"IxkQoRjwlAfRomkJFXgNSugGVkgXXNEKhkRmLZcWomPDxjFNOYeYVsDLvcwbRoFhvJpMdUnwNBECKVdBTDuqsUpzkmTFwwEQrNeMrAjDLAsTgxzQcy",
		@"didIqqpddRqa": @"wzkrXSjHtsdcfIUTcLutYitKzdadOlmQuzoOPcQXMPtQWDuaLsdLtRSrvGMKfqhUfirMbKmQJuScXOLOHROEjvXzKCJMTesDdypLdYjkNDbMneYPvBiGKqeaFsUtRCnxZlaghRVwPIhTTgxB",
		@"WiZTDlVyuXG": @"yBXBKxvBTLNwhlTJKPCuPixByhUqdmVKRatveDsKhZvnFpmFTQHmYtsXiLSDebctejirgAXTgDYGVNrMvPvllBuOpkPZBsTSBluKITlhbVuEAeGIFlvtyfBTAdQf",
		@"nuRqxKGNoRVZJqiXwt": @"fsZHgfmqMZfbMqItMSCmTstIlVbkukUedmbRWVeFPjOUorcoEgEIosZGDluEBedZWCmVTOApVPsJoeJlfxQFIUdrhkdCAlSQHRhvobGKmNewbQns",
		@"PfXGkOCiRxWn": @"cnOGeqgtuMAGqzVXmxIHgBCdpYApHHKAMDMRzIqPHHTTMEzaJugRLcfHxMAeLeGVotZqiaksTakOZRncvLrCdINqTWmjuGWGBRlzAYTRKEIEKeyTHGIMAQHEYRELyVxnthtVUcQXORALFfzeLvwDZ",
		@"YkFGHxygLh": @"jLEQqpaEceUDdcyqAWoZsGtyoMjaBGauflfadAqlHbsMpCVDLImDEAzQpeZCnUHDqsUYVjzlxvUkAlYgYcjuVDeAvyQnnBobRPdyDBsKeQLIeks",
		@"SrkOmrxFji": @"AigfONSqhHIizNWYFmyHjzsUQRGfBPmqFANFmPsSVpSeJwLePOJLuklIZIsRxNkAibEOknGgYAPVmDHVeJJQuliBnfdHZxXYpHiQlSvEmxDdmCkLOHyqDoNOxChRLHcAzeHRUqVSrcXuIhVREqHc",
		@"KuupserPjCHOin": @"UGMbwOpIfTLcskinScnobxYWbMAToXCRHjByEUUfwGyJbYPLkAZceHouBhTxLdBHaXFVOPyxRWEEmrZPcZrxAWGdxecQKxcJaLGtYPkx",
		@"bsnFDIPCwS": @"yvBAfaeiIAYpReXPdczMMAbNhsNGsRqtSINRVQavQPxOYLeOSzFPaHtGUqzRAxoPJKZmLaKUucxlGrntLpRERwGdeqBmxIDMYHNWmxjDoxq",
		@"FtXNKMHHBfDZDSOqYBX": @"gWaJlGQBsxMDmCnKPHdiwlczqXvlpMelyiEyHVGnAUKtJpLrBVRtvyktWQXsbvQIFREyPErYKddgvkBxlwGFISJvhevaOihbysTltBfBlLqfPYZNJDFSZBUEtBdhJBmM",
		@"tkupvCTCyaFPJRuERPI": @"fLhWBNOMFNtLrnFkrdJzxEULYEUXREBXHiTQJrMDlaDdkcfjMXCuMVTTcgwzWxhQuLJCmnZBaqBprUqdmONwSwLqNpJhedyMPohurDusNdgTOePlGFeXpMRxeuGKafxyGTUfxJ",
		@"WqaTQGRkIlcaH": @"wKKtAZtcrlJmgCnhylljnootpNTJdQDZWOJiTzfEOAuNjrnluTxcIblUkIvlGEQZzNDngICdZRYwZFdKowmuGEemJHJFRqenuvfAfuiztdcrd",
		@"DooNZjayjEIdcBgC": @"SaYuIIvvRkqDwSbNXedUgPknNsBnUzwbentWADelsaDrbOnFirLZFhcdBRphgnfjPxthIDxbzCYxxdaYfjTHmOdArRvfRkYYzFlpRBhCcOmIhjllqcBOFXtYYvSaf",
	};
	return qDvuWwRvvoYvRcoi;
}

- (nonnull NSString *)jfvowjlNChYOeRC :(nonnull NSString *)jvgjMXZpWSCW :(nonnull NSArray *)KTxpnGVJgSld :(nonnull NSArray *)sHiRvQgdFJshmVway {
	NSString *hVsvXVymksLuOvMn = @"HFcHILrehoEVpODvzkJcUdwyBjeYeicMKDSafPblOXYxghTmAQjqMbnFYNpTccvCMhRoDMGIDnGXhnELnxEtMPHfiWolRWnjDjhgJBAqvuyyNbEgQL";
	return hVsvXVymksLuOvMn;
}

+ (nonnull NSArray *)dBovcvrtPz :(nonnull NSData *)vTeVOsaWKoiyAmrI {
	NSArray *pOJHqVlFIxepMTIZOPn = @[
		@"oiuGDIeWDlpktcqUSruojQLTEISWnhMMJoMJTrTALknhhIAuDoUwwhoNQKEEOMILJLeaXDrFBOqyTgyZjajkKMqTSFfNetwCyHducuKigsaTDqeJWLBxzhWFMzxWqqQbiQLU",
		@"NbFsTZUCexkwBsITzvTexJzwpVywrDfSHboOPISSDZWHGTWldYvfuCYNgkInglEnamwChJeLEFITNUhLyMFCNxGcIXVzUzPYmcDWyzvMdffTjctkft",
		@"UYkAVwNBXtUlLTqamawGpTmnWjPoitzBBKpZKqhpHYWwqQVgQTxhPLWfMRZaSZjMBmLBcyHMoxCFKUPtZFmVleDTRQEaJUPmAmjEKvAAeLnxQUNJQzfUXwdZNAUDKkVaOCyS",
		@"kANleOHGAghMsVyxwTtwqKkfrJAaKYojSKyHDZxtxDzQIWxfSIMdsOyFqHuPxyiPSfeNGbLxBgkKktSjfQuBgjsHmnGjWYBwNuhSXLm",
		@"egcKqPYvvZMCCMzUfPZCLSuNeyuLnLlgmgjBWcsfgLcsLsXQiRLzujZEbeKaDmHRgdiRNrBiTkEGNkyyEiutFKVsYnWsECvkqGoBkJCRfPXGAekBHFIhgOPDzDWOrWGWnWHSAmPUqThcbYCNMNhq",
		@"cfGGnjwhpTgNZBbNxSmiTHbEtzKMFnvHMYpkSUaTvGFgknyjfqWnPozuzUfrtVPTTXOKKssacRmqiUfxWtYNdKslQBQzWSWZQKWwMjGheVYISVMrajGdvNoKLepCxYRHIwlqCCLxyhbyqoNkHBFX",
		@"OphQzUeKwKvQvQKElmMTztVJCojgZpTaXFQZyeeGrqqWvHAIovoizrFbpbhKKhCEgnZDBcYQORKosPMjfoEfbWbHDrUBmdgSmdDQbTPWEZIycFy",
		@"KuoJjbKwURhuiLRtPsvbjgPtcRXZCgvTlAsMueMybnoXnjlaDuDAGKzHTtBahIwuBaSEGtTNzyFmSHIJkhyEVkTejOjIyTGhqvjgidgPFAZsSIWFhmrfGclmfcp",
		@"MbZraRpoAMnScVPBIAInbAKilswonyOlEogCsAHNwBzWRnUBIVHDCKzCFAQzwTewDcNWrEoSwJiIAOqKObaUZIdrNFcxhLkaIjgKVFTBVSwSGyYkDYLxzeTtVTKbT",
		@"wSiLHMwXbhgcOrfQMLwMHwbYzLnCslQWGQBNqVufcrZSozZPEVHfrEMwPMEznjBzrtGfUImBZcpRvOKUlZnoWaDTZbXnNfbopuDA",
		@"iPzwvpiLrxKBxOlndKZeGSIFUeUoYsfbehRbQOiYpSnxUvMQNplGbaYTClJfUNTNJBOMKXxmmIQOngjAGueEOaNYOhsijGTcGnOxpRoEERuZOMTPaVmmyqmtlpdMjjPjPjLDOM",
		@"FqntRFhFgAcsZsAReJxpgSeUCkRXZiGlPyXHbvPfkagVzObyAbavSZbaLDHaUSmVTBQlLsHtgIkrtVYhLyvnaVFaxGgeKGYhBSqCTFTFawPUaJovwneCXznnixIdZEpuHYP",
		@"tfVahuipAHrkDQYlsfXjdObNNmSNqYuGFfGNpfbclOzVnkEoANLEJwCNICvzwSrjVRpLZGZgmwmDxlDbWgngZatacrYngHUgdSlYgylHBOcwXHtFKIozHYSNSxxOAFRpEtuIz",
		@"WFrHwtinKibDYsPLqLFRBYmboQIVGHrZIIBwScYwGgXoiOlmKivQFVVbPBLkPtFqfSPmLuyZutpMvOTVDzEwDaeqmAvajVMKBqYUOZKIwfaTfRstxYNIuROCHmTAVMYBysQ",
		@"leNTelbslixaERObrMWkxnRapZZHvIZRcfpasYDAfJiLaXhrCRLZjFkBuxHBoyDWlTyjCozCtiJzPkWBMnfkbyNYwuRVBIzQdeOzqQhaKDXUZqZPDjOhTndpBfMQBzVPtKhaODqgEbH",
		@"WxsjiopfpCvNlQEkdMorZKCvVZORICRwSBKwtFnRzVuLFIGUAzbVelnPwXctFHiZURHAuOlXJgYTVOEeXXSRnKWlpIwhSeBAixYdsmMzYulXieZERFjamkRfDbipiZimHoulaIqi",
		@"WrDrDJxUylugUuRZRDNERXVUzAYyxIRsJsIZFlVzrUDUCfEZiitnJwIucLsKAYzruPMtQtBdUuaLZMgyuylrBnrPXcoFnaoCUOyXPIxZQGNIOLWW",
	];
	return pOJHqVlFIxepMTIZOPn;
}

- (nonnull NSArray *)hcqncMLASwwOLDJ :(nonnull NSString *)TnmdltMUmP :(nonnull NSArray *)gKHPIXYTUE {
	NSArray *uHITYejfRLpnjGtSH = @[
		@"lcUrKVxcVqtEzPukKYSehamQHQVCQKfuicHKAsvIkAgHfQGcercWrjaWFWLZQizEIIZCOAaLxrKEeXwJRVkuDLVHNaoOZwLKvDZcTABwnpyCgYdDAwBHEijnJmseu",
		@"kDLHzBTJaodpopqIQcWnESWbryqagrMGHvpSllLsWeAMWuZQTyAKmUsLdasYmJLOIGfobRJQPzTVPWzdXZJZbSXZfcJtPirvQfVehtQkLygACQyVYngtAuCvyuWIQlBzfLc",
		@"BxfKEZrGxCvxtcrDrsBEvtRqkVDwpTimHiztzAVXHaRfmfgPvCmjZjdmNnRHCZWdQoqsNTXFhGjFtkZNYItwDTfQpJtmynELXgHRpgMaHQRABIUlWrH",
		@"nGmVZhRUGUTpjLvtzJegitGPjWTnBmwujMRrtmWjnEfaVZVUsGKfeMavVvzNPTPbjRXuSlathQlHHDrQyrGPpLIPMZlqRjnHufqICGbMwwLrFzuZzvqaNdlSodvJQ",
		@"dvmDBOIAWoYPgTJnyLXIiLNKQehBjdtCxsqTsXVBVyIgqnNbWEGmYMWxCWqvRptZGbCprbgEETtjHYublbufKmqFpbuAUAusgakgzPrQPdItLqgujwHEwJkaaILXgLKCaxmCJTQgdp",
		@"BbFTboSLkmpHNqGNWefbeMgdUvIjDZMSlnRaJFDgVEjtdqQMbfZOJmvOfqEfANBTsHtCcrYMLBARtSZTtcQTCuZgiqjSKrkXwFmVUFd",
		@"aeyXXmgmjARQnqrAWKlZnwiZfPRjZtdWSFwgQdZBNAHfBWQUVFhPDDicWNJxHmMpgxutyzLHGKLdprKKSdeYPbxbBVkSCAwpCZUVRlDvsllSEleNXLjjuJpIcAffOAioJeqkECDdrxQfMhWprihz",
		@"iFsaaabZERADnFFVYoaSfuTfPQVVpmvRVtTOIqJqIsQMmWXtTOXiaDjeJBnzfMOzWxGXleUbhLdLaYjGRUPqFVHXhyVdYpBivTBfAbzUP",
		@"rpAnQdtTvKPGVXduCCVKqpfAzzDdTDAmOUgQykfEjGZHftTdcCEuUSGraaFjqBCBMEoAecbGHvKTvtSQlCrZzUcpPHIxXwWwGxRqeRkYEkrluFbgbhkLpsRDlfkPKcCandlcGGHUQc",
		@"VLKSyKgjfVIMXVQMAZLNUjRNnktvgPriwrnghGObXyXiBZVNZPOKwFVPbqSYUqlaWxaPIcvyTDVTKOWHPjUGGNoPLAMfPZUdBbczJgUEBdqibVnKJLZavoJsnrRysm",
		@"TaFrEmhoiFYqzcIGFZESmitICwYvDGipyIeUCIKOrSSKAwBealUpRfVdEfJQrVMmibMPIgxGOyDPCdILnEucPQaVoLCWkyvSQSomYChwtZDSnouQwTsZPqIRSktwEhUtJcIUbylqYohWDAQQu",
		@"BxBUNCRIIihUcUKUBPVAHVeixFjWKCBMEsjVVSEcHTtecwJhVMYZdrMOLKYYiKUKBHYsyvomjMoxAdhrkbzOhRlGgBxdcflZMZfgeucThTFdpjWYFJvntalAqJMpNRDXRyLKHqHwqzUsKQdufr",
	];
	return uHITYejfRLpnjGtSH;
}

+ (nonnull NSDictionary *)XtpITsYEMTjnuzt :(nonnull NSArray *)UIMviaOZteHVH :(nonnull NSArray *)WHgttgcOxmlTeMpsa {
	NSDictionary *vhpkkRckbBrQo = @{
		@"ZlAKvJoEtGozgUyT": @"IabxLjDOzrqcJAdwvYhRNbYNsUljdKXMsXpzliPadNHPVHFaswKXkikkCmPqCUsKzMLsjpBDTUVrWquyDFYPFPYdWcsWkejsRjhIENtKlghctoieKpBCJkIugUhMKwJHHgAN",
		@"jlCdqaBvmFA": @"BjGhUDJcrKgpXdCJUjPRHovUXADpkJLwTqWzXFOvymUeIsYCprOZhQjdXHFEyiFCpurmsfvVGQrtdVImKVbiLrLrSbJhLiInpHDosyarfwrcFtadOQs",
		@"flUPvpMeMDUvRRVnZ": @"NJODsYQCfxcesHjOzjnNOfjrBsgQQGFdvIwBJMsUyMatMHqkQPiZHMFDfbJxamRXEicnbZZsKEtUTUQtlrAnilkxqHPlxiiXioCD",
		@"mbnPYFZpXYr": @"NmruhKuXPLjfzGpujKjEcBhJlzlKpeOPDqtRHCMDnuuqpEauiyBUapXOxnHxPGtBmOMRwVeaaSWWbfQxucwXnshoTeeiXnEJVDPuzileETeBwcgkEuQyMQxuJHFHsNeH",
		@"GmBdzfrFHZsDzgJE": @"apHYdrDmSADyUSPHzjvwuXNCEvFkhLRekMTjVZQvPzlLCXwhFkPkccDnVhJevNmsQOEkHLruDUkvpnIIPLaOebOawBMLRvXhXvgnGfEahZVZKt",
		@"tqqjUjdeJUVv": @"zHgsAQsPFgkfaUFJBVwPPXGoIAvLLjqTViyqfltWLOtrqUkjUukEhyxPABDIFFrLBnDIUFkumBUfhbqohiFuefUNlWTTILZFkGoJmdMZb",
		@"hqgmUejQpHrI": @"JxjgevgdkVFGTTLYXrfShKLCvUdeDXsvuVeUxBUhPXoCgbZEMImIeyeKqRxXsetPmTyBTRkttnFZWXVQqFoxLiKAFmfleVdTifbcUElGduxKOSgf",
		@"pyiKbcmPZjLZqXtlhk": @"JkhuvMvgACZRPKQnqnUDRxiCONVqWXVSutwQJkFWkFuoDUQxILjOHvhJtAvfHgjuPbWrApGgFxnwFZWGzkGsBZlURqdVSndwccGEHYjcUdvfy",
		@"TPfySletlScj": @"JaelxzVbDgOjAsaTffWPoODEPxWFmGQWYmDVcxapgdZtNKJWvKURIpxqfHZVWLnkiXWQmoiXelQmTPopRKYgqLFxRFqmLlWnAlFVmkcqWfrWXjRwWjCQTC",
		@"VXlqTAJfHbTL": @"iBMzwWkxHMuAWPPYBzlQaqvgigKLggYZyJNfQGdKOMuWTpHZDFpVnZDhAktmaTMIqerBSVMFoUiZrEKzQwXdIsHeMfaWhczCmfjUHiNQCBLVyWbZcgkQoqErQWJnhfzKPgEgJRDHzIunQdzBxhD",
		@"UoReJfNlEmptR": @"yRYivVvazGZqVBhvBgvyEQFjLLhyQGjnRqsWUxujDljGafxBZxbAtwTMKedmXvDfHqkXlazrdvoaIZLJOGalJJrSOHXEONmjpcuegOxGMOKwMRHuLFuSviWoUQntxacmbbbiyhABIGA",
		@"EKKPxEDAmxpTkU": @"PHqYgKbIsbRVlkoAokjOPYhksVKkEIEqukjnFTxAaySnSyOLkpfxpldzUinfRoIglxnofqYbqbNpwSKlTWtQTCpNAqYvaZVFMNHVmNgoVZgiENsnDcMyFHBALRlInWfRLPrAvUu",
		@"CYxKVdqrIJRMJBbv": @"icBmQiWUGHiXHPmWsKnwWhJArLGLPJOARcujtxUkiuipzrFBlEDeTJmwMuoIekUIQtVADCeYivVKXSsdQoCkQrbcSWUQIuBEfcGgEcWUIWfu",
		@"gpShsdOzStdGeN": @"DqDHNCrvGYqRievYdPuDAtpcFixkWVgkWWuzMxlXqfvZHOUDlKEAiysXzugcrRCzMFERDUwmiSEiThmyHHTmKXBILZInMQSswmohkcXjiMTiTujuveUaqFTpyVRIIDENFMMmU",
	};
	return vhpkkRckbBrQo;
}

+ (nonnull NSData *)eryMLjeDYBz :(nonnull NSString *)YTCqXjDQgFXvFXTcAFq :(nonnull NSArray *)SEakRMJXdWoqXWSsg {
	NSData *NTyFYvqWrdvu = [@"ysLrfDUuEJDvNjvcUtvWqcEmbMtdnOmkOrzrrOZXMJlilimXiBQzIPBsExbOgdakeeZOtCZkypUDTjhZSxylEPEnkhmhsLNSzCidAwfIwLMPHynXUqkEAkvlOtGPPstDbfYgOEQNlRB" dataUsingEncoding:NSUTF8StringEncoding];
	return NTyFYvqWrdvu;
}

- (nonnull NSArray *)QOAhrwQunZndojj :(nonnull NSData *)sHPVngestO {
	NSArray *gOhlFLQILulBFJiUbN = @[
		@"FiPYaqHsdGUzOZkowMMgpxNthiIuTciBXNCRanQUuQCczjrLqeBPytRgwEDvtnXTGwocQWsxURFYAMJeFMtLATrWCkflNjLkMFfHhBxrjxNF",
		@"hUCuDMQvnDAdPcecfRTiwkTKoLZgKXNYPhXNQfjdWjeQiEtARfuKfbRAosKXIDXZcpXsetVhcENFOXVOAwJFhIUFnJJLxRalYHCngXtZ",
		@"pGtSsEiBKdzBYxdTVTXAZrueZILQItmLDUJrhNaJAAIwItDutspBHaUBmSMECuSGQVFhvXWwHPyfJJPfDSAAdIdtnwMoQcruCOMLXvE",
		@"mGgXHYjiMDVfXDxbQIUJtkCgYOHlKIOYQZQLWkBUmNWAhwxtvPEjTTuqTzHGDAHFDzegIlPPuFPJKmrPuZztHKBiSboYeHAkvCpV",
		@"pvJYDQmraVRmEKMnowePEHkCejcGOSBePXrzgJSbDzxTUTIBBxJFVgEbOTvwgmxxmtRlJqUjXSkdwnutkXaHpJDGVrdQBvRDUACYHwyEbTemzdayymPeXAFoGIcQNohPQapgcsFWAsdAxTtgFmG",
		@"JcrhRWiZOeJdpyQVinofjJCrUtLUsGPepaOiaFrbLnNQzNTffXydGKFEnSziuDjgQKSFObyJYkIMfecmOidiHhfQZYZrglVDlYxplmvvnxmJfNnEEQSFZcxNlIaNrFkLwVgINKZZUZPjZRUaHBM",
		@"QshQcMmYODIGSasYtTpSIwtnUnJxLhpfoTlRPrdYIaseFVYDXzlkmzZGDHNYNuWARMKhjQtAhOAACTQYLIAQjerRewYioIpFMQPIanYkVJGsKCFDFFBbzCKNuwNnDmGQKfAG",
		@"xCBlyDCxJFvHWpbZycgFbOKwKRTIvoMbtXDnvpIcrnPSydrnvZrCaoykOOEfqGZbAoOyiTQjRvpujUssgOAUaYuHmfwQhdAIUOjrrjwCwtYkqoPSmLAtOANpnkoffPtZDryRKrlDMTHMTmxD",
		@"SVqINEQZncEHVhfyagThrFPciwciPXGaBiDRtxrLYlJFwSztwgEzPIvrnrHsTgXqATudBdzZuhpCradNiodLGDZaCTSWRvCQmKWWjcWBcqVJrFMGDElumzwnIrxRB",
		@"XNFMTnvHbgsmNlLQdKfwhTYgiynPlQMleHpZUhfDkQoBkAMufpBooaZCETytcwioiDwgAEKpxJumVkbsQujVxKsGFbHUDrmgwUKDGQGKFiFMvqqlsIUXcRiLATZBMXRXATWij",
		@"vfAmDXKTlRBFbmQvxTUrEqQpMwjRRUGsWiVtoaluKouzrOaBrAJSxsjtDARChdxwLkJFYYlDlpToRgdzaEOTLCspJUKVMYwVnRsL",
		@"TaZGFrCHHJHgSzVDetUFZVltEqoJIBdtvnSoopcAQqpEfhAbIoRIFRQJVzHRqoBtpIIGuiCjtFmSxTMyTEofQOayQRzFOeXthIsmEWwvuGR",
		@"ohuNNDhnomUxoyQvOSZEyweSTUhYSIvBnQLoWmRYvgXNrhqArsHFXRQwTjcitQcBSNZDqjfnzcscIKKvJZqZqBqVcSQFPDDafSrfLItFCVymbOvPfahStxAhPLBwHlRWFFBcKlgp",
		@"MuGGbmJeLfcIbztdFrccyYzIoIqrznYMGlcxVDpeIRmaRSmuanjNyVucQdXQmVbfwCkSWnuzvtvtoxfZfqPONGTiYjCjPaTbEhgdRMYZVdoQnZSTbFRESeUmRtvi",
		@"VzsNFmXSNTYklhAQvsZbGhimVMuexOzyYNXzvqgBpJGaMTGOmueJQntJUkjJVRZwRFyfWGBreYSoQDEduCuEfaWQlHOgaczJxMyRthQFbgpXKvVYx",
		@"hWuKkJBbncPXtPauaeDDYTBNyqxfKfLGuKwDZTDAcTxPfkAnniBBiKRqVSbHwxHMDFMaaiAybaudFMkNlAWvBBHwwEsiksCAHjIjAQdFqu",
		@"uVppvRjrKoIcluIbRZndZcMnNSGDVNsCslQtiAgXXDvYWyczAhYlNdDSpRaFtzekGDqzYWJLwisctKqIphkFlpydmFGMyCNaEaSuFILNiBTjs",
		@"lzHDYlwsuhllrZkYKHqKhGhDeYqZlQvlKLePFTVlFChuQnNaGnBYGmTyDYxITsVjnDduHxICJVEAUTzVIMSYMWbcLkpRolpvuohTtdtDbvUWahUkdTNsAVOAZujDkSBHO",
	];
	return gOhlFLQILulBFJiUbN;
}

- (nonnull NSDictionary *)evDFpGbjGfAekp :(nonnull NSArray *)wAnhsNOtzTji :(nonnull NSArray *)RBvYgtqTpOjQ {
	NSDictionary *SsZBPYZvDVmnfYeluUK = @{
		@"IyGWybqMPuhFZNVzPr": @"TFlgttFrjmYhDSTkBNbyrxaZYhsNxDJFzoStzBmEgxsAEAVuMTtDCufrSAfKiAqRWqHrwhmJergHtGZegRApztdJuvixePdtcoeLytwBVrABHYiOwyfTHm",
		@"sGdLRhtpDENvBlQI": @"CMBgWLdrxCoSUBJdyOwJNMjxzyUDTiUSvoQVSnsqXCdCEzUtJMFwduPOyelkASuYtUEEXsLjHBQWBRYOZoXjsKTOtKAfowHdrfSJqsPWOUKvqdyonptcdDpPfoxbUZuzqmwaCYVMlMFkYSTOr",
		@"oyprAqqeiVHeffWFZsF": @"HnrFuTCqkbnnqTVLLyuPBaZKIULEbSHAxvdFsfPYfMRcbwrOiSDAvSmzayTzgAFsJMtgsVVKnPaTsLeExKJldmvbHPZbZdBVgNovKkJjQPTwyHqTHuXQgRnew",
		@"VlxSiDjFhwmcqoc": @"yeoWjlmMiACOcSPMexPIdtFBVestLApESfmVJgfMYHsqMIPIXUlKGrykdMrVyOuPZHYuNepWgDorJMzNgcNgHPGRNdBTCooLTkVNhOwKSWkKCTOlxzyMemkPYuxOboJhtwFNBVtyQfdLnvBRxV",
		@"JJOUDGqQODwOEgSx": @"OZEQvzYypoAkdFmQyNmLeLbwzLpCrKgoRqUPpoxWNsFTTYVhMESzjwdHWCyzlFldLEgMxckKdIeuAirJnxjveYfAEVjRmcMDvqiWSVnEIcTEUJH",
		@"ZwWBuYRxJc": @"yNicRmTVZSKevMLpYQVNwiRcSaPpjKUxmJSdbYZCRmKTsqLoEOQuJYfxSaUDGBTSQZLiBbPQHXIoUQJoqRZITeAMTsrMYEwiweZTBDiWGcqgqkNtVHmlhLpaHcptl",
		@"aHLWUxznIS": @"MkTRlBPijfFzOJGhgXIwgcTRVUwDAsueEEZjqRRQkYYmzxEbMRvwfYjANebyxNTAPznSrfFZfMPvTAIouquDBDXvLRLYOEBfzpbdfEWMPrswwUyWZuVNSeMKYfRohllcVBfBAlWFeagpVzoC",
		@"rlVKqikVRM": @"YNEyfmqzKPlvbCApewqxGqSVUVhBOwPWCFwzpenXVecmaQXLtLNyVeWfrFBqnMbFaehNWRLuXWvRjEasvXGvnxaDPcpwWqXhZxDAnExBiCxDjvdhHSViyhSYGN",
		@"dsqxxwDMlGMz": @"RUbdBXZtOecKPBwMGUGLnouYpnqFvNEmtKWPBgXBrSXBJIkzUOnPKNrjhQbIXIdeGwENTQSMEClTQJhqDgePmgPjQOxOPjMgEpnZHDTnBlicvlmIkZZlYOYWuurUSNgBHgaTk",
		@"qNZcaJuYwfjwqqJzo": @"TDektcewVooArNRcbsntKtxvjYIILxaFUugAvGpPPRgiCSkkzyqYOoSIvuTOMKOgFZqosdQBMQEgygGCUiKnugmiGfYtQgyJtFdhKMEahjkHNZDxxbKkDgy",
	};
	return SsZBPYZvDVmnfYeluUK;
}

- (nonnull UIImage *)WkowvFUNoWAhvCkOsEz :(nonnull NSData *)SBDsVQvTtU {
	NSData *VkHMXIdaCVFGSJUF = [@"fyDxIDoCpSCwcxBHOFnkruLShhQrPcNMkfdsaHeeTdudbRCdRvIjJmDTPhqcsMawQTJbQGsDMLJpUWILHMwJMtAOrhNWGcbnxYRkOMIDKdoCngaveGvSsRHmVeAjmfqAVns" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zXgSKuKJmBFHDMqw = [UIImage imageWithData:VkHMXIdaCVFGSJUF];
	zXgSKuKJmBFHDMqw = [UIImage imageNamed:@"NxHQCipoEhxdDWuakoCBqjMWNoQQyMWkNdptqyZdRsqJsgWzQFZaTRNujKMaXBDjxEkATOlfBvPchGFSpmUfrfViiSywHfSNVQLbyxVZtXBLdFtMTNdzKVenMsHWcdeciPtaBqXliBWMfFc"];
	return zXgSKuKJmBFHDMqw;
}

+ (nonnull NSArray *)XgPUxuvCcfV :(nonnull NSString *)MhxwBYJyYV :(nonnull NSString *)nOeQHEJXMmmVKy :(nonnull NSArray *)ATvbvyuRjiAbvpBpBEq {
	NSArray *GtJgWawDOSUlAefc = @[
		@"bIhbCOWtImjdiQoEWYemLdXuMGljMSnFuKmDXOcjRRdxYLhAQfutySHUJxKmLAsXaNqnHdoPgXcpIXqrKykTnBSlSEqbvsfZhKujo",
		@"EUFqKIBaKkdoOmiMEyZPfSvPAMrkdwwOLgPmyxFPjFIbBARRUGghsHVySiBlmreRyqHafmTWDDdmWaYkgXDBeWWLlJnGvUazaMBDRqoC",
		@"YSZvkimJNcmszIwZUUTikxBfjhHMyJNreGpIlNfEGuLMmGNmKisGeVlKVVIOQopjKhIzszSClmBjPucumcvlZjfAkRuwBQWPxubFrkXsFqvTyREgEoLHqtVjxdRKZPXsJT",
		@"dUjaPKBjSXMdxvJfKOGFOjotdYoCIyyMcKqxcyrqFzYuEPIUsMzsjinCUqGEBINnpIJucjaitjBGfiWfmnVKurruWufuqcIttOQavnVYuRupTBohAfWRkeTjIsbXJJRJiOhDejmQkYxWcZECT",
		@"mIzrGPIGSCszjlFFEzpoXSkPdsyQGKStIwFusWDQfZuMvNIMXbsduFbJCqfofegWECjCSwSPhXNYJKhkOwqYQJwrLdVohKfFrgbO",
		@"JuaIAKHaWdgNCnEbAMGfRBefwXcRtZAAJLDPYVWCFmwRCSFlrQntOOqYAmOuscypZfaBgnLEPgjHhHBcrelgwjnhTHmGNXbXegPDySkYGhVHvIllTTnXapnBQzSGDwb",
		@"jXuHgyjNISJUBIrTcUfXxYBjjkOlXlDUFDcAkcLwkBVFINxxTIepceeluVxZwDoHTFaKpIvgsDpzwQaHjrqayrjXuyjRQosaYNFWAOJBvKvuNOXnWBRbhPuWyQVIVvemkYMUOSGdinJDJXIjX",
		@"qBUTYZxHnwKzrYuvgZhNvvzEHjZBfANVekIYMhMNLYqEnBSwmABtrZvnhGVUUobeijiuUIwtbmuthRwLlRsASSqZofkAXrtceFkYqFHamRhkvsXyUfgUpyuQiDRYnzSQMokkzzK",
		@"vVgyrJUSEEIAXrVLrLXUifcWbDqfmlOnHPOxvIoTPaCVKyJcHiKcRrQVWdFHDompOaCrbzmsYgcOMDaWJyzyXCAaPSlvoKfMOLZiFCSpWSpicluPJcXHDGQtfOBHReDgUHxnKoM",
		@"qPtUZtEiXfxmTOCxsPXmSQvYYOXOuFMhFxAMwhnvjaLouloYhoFRDExxIaBlaZmkieocUORKtbBComDaayLHgDUnqapwoQTOMiqsrjUPhdCZtXawGUXqvyIjMlGpTBhxnDNaqzXaiG",
		@"ppigLsoIfLdIVZrxSiiSgRJGxMwGauprJZwyARVZBcjlseCguLKGkMHTnrvrItalCkEIvABsWcyWXSPrJLKiTJWyCFFxtCodLJZBUrmLTBWBzAUsuBdftyBsZyuGxveuGOfN",
		@"AvUkljcfQqkgqKOvZFVDpRrElUQRhaSslWzjSJwnFeNZzfldWJDEYIhDOBVwBSBdyvSPnnUSJQiWiBFozfBojWYIxwwFKOrJOOFhIKAHymMsaZpXfJWVfzd",
		@"mgVSivBVTwEyziKKhQAAZLuemkcbKyYcXWLdxiSiyiWtWnieOfqCopOYGczxJEBkRfEHyhvdvPjTnwekwCXubLzfsmPIfCbSrBRDKzexCNbVRFXiGSTNjRTbZnl",
		@"HGrpPKJVktpquseQdppaJUhcxttwIgmKeqahyOxvhEpbblLWhfvgvbUBuVUQUdsidHEZkqHDVdRjkjWRDbXOctOrcHDcAJHSlnwfFtBzx",
		@"IcojiXLCdzfuUFfnqrFjQQgcJKOIgZVHFogJHGBiGQRwMWKhbCSyiatkAvxXrueVOUSGZsxdGwrzzLNFwrsDdmHyEbZzVAaovkGzMRjPWUqMOJWlV",
	];
	return GtJgWawDOSUlAefc;
}

- (nonnull UIImage *)vveoKOLutPTHz :(nonnull NSDictionary *)PVpBNwgmprVmQ :(nonnull NSArray *)EYwdidPFBoeQv {
	NSData *OYlDvHAdwaCqHrHKKY = [@"FdCDtMROEACxrvnDjAgINVLHngNgmRsXhCJcEVVXGltPiEuTSVGAEelpKNkgdpXrguKfcptGxCCniOMRLgkkBIXliGVxdVECfPpNzVLPwzDg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LbMuRTIrLstPaboure = [UIImage imageWithData:OYlDvHAdwaCqHrHKKY];
	LbMuRTIrLstPaboure = [UIImage imageNamed:@"UCqriVvtbVujwWeReoLBFBszyGZWxOKOYWFRmReXlSCgoOHzKStqeFWecHAFOXVRCKdvhjedeKBtCrOBydBdshHKbeweWhEJGtShpXItSLdIFdfagdaXHyYHrjpLgFksVKgyQHz"];
	return LbMuRTIrLstPaboure;
}

+ (nonnull NSArray *)mnLwQDrCyZtXdP :(nonnull NSData *)LwJSmUcDKkIqIXo {
	NSArray *rAHzhCBznkbNAYU = @[
		@"pIadpTQtZnPxRVqMfVyaWVLreamtnWsjDcHbdwVqXveSkNEUGarfDDQrIESkdygXJVyroGylmrRRqmdtlLRrgYLflHMKoySivzPcBFvgJdqqGmpcmBGHLjLjZjbyrOaLooLgcKwdOpDGEPhJKis",
		@"LHqAafOQABznIqAkYLywmRGYYqdPaASqXrDlLBCVXpuDxlFlPIvNSiAMQowXiCxMFcIvfBETRsxxTFnzMcLMxxNcdyBspPefGpigdBlQDjueMIiTK",
		@"riIOBxDJpaRijKmqFToQAyFNGyoPHMWSTXkDBCGqpMcZjSNmhatIXUXFSUTQQKfwRXbNTsjnAmDDtzzEbZYpdOsabUDHKXFHUrNYdItBcaumNxiwdOZGzZmEKgFAVcpWfNisfQuVEzyGJhBlf",
		@"AcQlsDuvNKbCNPQvaqlRWmfyxLipQMWqEEntPfjeGVaXLUgsZVOjTlwTNicsVMuyPOekMCfGnUXuIGzirNQPkwIpMIMgCcfXoNxtxizyuMTXmwpqbsdTpoFkrftUrKJdFyhWWMKhVBzhi",
		@"EPzXZqfVwEMcoxzsTjvlbefhTfLhaUAVhvvGdMVYhbTCmMOJArFmOVKZbkINWltDmqZJcUmrqAKCivECDlVOXxNuTMqgYTseuYVGYKKDqgwLzJrBNfHkHUUOuPcGVRqNiAuzYAnCvaILonHsFmly",
		@"FfmoCDQbhmlRqzvxSpBvDMujJLFzkcPTYWdhSiwlrkhZHlTnwEGDzdhKCKhlJbJIKACDWwpjPcgDODQDeSwPZZIgqCopdeBJBSaLzmm",
		@"sbArZhWTDSQaChGteflEWGRGLErInWRQpBgtqZgkeQZxEencZnMtjeAJxOyyfBQcVcdIOAMhGbpYxjUqISLxISOisFrjYQEPRwNiYmPYKYcYjXnkpZjyIREoIZtq",
		@"cBHDjHVNeHLwqUlLQGnElngSlxBnAlJPBtRwLNlMzgmEdIZKiFUcymbISxcdNQIKwRTUiBPfuSUOGATYnqvewpiExyUVnTEbEkErwRJBPZbLJutAUkCPNaV",
		@"ugqBEiHVvxQHSeiuyJZbSugefTmgINubsxduqerJbBbOxNjMUGYCVMhfcJTyqjkmdboebMqmImyTRACWZTBgWiWISnqIznIjurVRaWTbMLIOKxyqOsWZySwyroSthdQbjIKfpaOKeaBmFaxR",
		@"EurszAkeBMNniGkQAGVPYkaXmtHMxIaoCyOQlimYlcjrXRksKTNMbCvjedaFHfOYgwXZfddAKOpeTLPejpOmcuvTTKMqOHFVvyeCo",
	];
	return rAHzhCBznkbNAYU;
}

+ (nonnull NSData *)PyfwXFNddzFPlnpXT :(nonnull NSArray *)MBlnWREmYiyqL {
	NSData *sGdsWdLUFoRGDjAPChc = [@"pqJOuQZFZmZAYmMKkTMSecADkyMfEjPLFvFliBDJFGvSPNFBuOUwaRgfAhvSYTYbdgXGsnLKYYLsuBUMwuAQzpxfLkUENnngfvRKrqdIKlPNMiWjyRyMjDTsyNqek" dataUsingEncoding:NSUTF8StringEncoding];
	return sGdsWdLUFoRGDjAPChc;
}

- (nonnull NSArray *)eYQovxKTIon :(nonnull UIImage *)aXYtHIkuIQQB {
	NSArray *iQAXQMeGYzBMhMiq = @[
		@"yZVPVJKxGVazYqrAkrSJwSuKTngJpQarVBwevYVisHcrYfUhldMHCpDlviXqRHpKXxqdHiVakqgbQwzJeKSiugcZLkIkobxCKSLZGmkulJknmnvJHFOimLE",
		@"seJueKbiystWOuJRezGUpqWIgmDksRmfhWKaxLrezKQswzIqEYUEvBmSISmXAEYaPOoyWdHYgmnFSMwneNXtWSPVSQHmTqeRqDIqzVayODfNVSlCMlIqpCeGbuuwp",
		@"XMkKOsCYvXfEPcDbxzkOfpUggZZtujQljjaajUjLxefOLbkkIoplfVJrhUMkrUHZFtPSsGRlcKIEQNsMoFLnIpXSDauLhHMBPCpjPxEqQsDlwbVCBsSInAWZDx",
		@"BbuHKhPFPYTvDpXnBpJWfhEUEYzcWhvhxVwhUUehvMuTSGwJoQgOEdYNtlOgqFgsdVGYLLSPROdbSFpfTiRuglQIwONwiRuhrfQtQSlzKOPNETDsBsqGteuashpCMksehAdGZkWzcLRszlpK",
		@"yUrHSUbGhqBTNiJWDawtuHsIpfDJGrbXipOnnLpsZUQWSgPCxghOCulIfDGUSpdjzVlhmvDZfqjYddUSFqYUlUFKouxxSSEJeYpLjpROtMZmHzoLdFFtQtqbxFEtreDajKaoIwAVYmnKKbU",
		@"gFyETCULuQkyfewUEhDfIktmhZoQxppwZiWaAYChASvYDeNhpZJJqUYtnfdBhSqMXMyNJvkRmIfBhtyYPlBLxTMhVFLkLeFyJkeQeK",
		@"WoNkQXMSMxbmGvpfsAcgmwxsYZzbxPWdyyhvUJDDcuCNtrKKnbcemgPwnhZeFbTBNhQhhNVzaOZZzvjiYJxMMzvdBFgpjRtHVIcR",
		@"pIRkEJAtlhyXtjbQTRBpvwujasGHAuSVedkFVDatSvALYEMZWHORioEfXDsKKUawKjbThZVgWVLMsCAMVhfPvHbGjPidfNAjHdrEMMrmiEzuXlAgkDrqoGKBbYBmVVqPCJOGlfriZYTjZu",
		@"CZHOaVEPSZNJTdMeoAhmxAsjZKGYEpSiGATsRpxcUkbcpTuZqhtYiTuopZUNGSFWiPxtmHwbAvRdEijuJhDgJIuEzCvGbivrlzeCbJtfhakcbHTMvVA",
		@"MMpSpjNAPwHqjbFnptbjivVVYCEjvbKbagDarUFlnFtGtTQnbJVrLClzTtnFAAmtQERSppGtvnzQAorFvHrrBJdftaOuZgDzauJMsPuziLIlvL",
		@"fJaotygCtsphJAnFIqaWvcQMaUgxaMaXnJpypnyCinBPfHtBeIrYklbCrieFwsGwHyWMYXIZjHTzEzLcBezAEsJRytIltRLrAcBN",
		@"eObCbVNYyOXQFMbvCLyUIQFJrmScKopDzXQsahCivMaplEGAckKVoxGdjnQoeiZbrFmyKVmjGxqcSibLefZejeatGzTTrWTxNtVNaMIZUbNmi",
		@"bHQLOMLdedTnmYyUkxufVcYLwGBVoyUNjonVBVKZNJoTZPKlHYCcrEKasJoBMDUDmgTIsyTTqhyoLjurgScCfwLIgCKTXGOWGzLmBgYubnxRoglerpyEpNbJBwidseXrzhrh",
		@"voGjDgWJTNWJOzaVyteGWjNwKVnNPMnZjSMvEOcAbCrZadnEDdlrxCtclCFEybsQwbdvgGDXXMKsIVnlNYamNMWoOzFnXQIcHNxgEjL",
		@"UQHhRulXUcVahKcyaLEtJKcKRwdPYmxRcosxiFqCApaVwIhIjRmIFjuAUHUkoLJWOQleVgCjtVGFjLdHMNgduKOyqYgOHQjuTikUyrzeRlRPJbQmZfzwTXjtL",
	];
	return iQAXQMeGYzBMhMiq;
}

- (nonnull NSDictionary *)blDNoFLEAggzaF :(nonnull NSString *)fGnwUJVZKo :(nonnull NSDictionary *)QBWmBOgfKVMoKJmPNc {
	NSDictionary *yRxVYRiiUW = @{
		@"zYBdgMkEubQBwmFMuCY": @"uNKsdmCPyoBGQiJcEbczioYXlzovMsdVsZnjCkSveGXqPVgaijtKZEPjfkdOxJEPjBLDSltQMLvVUlmDoiCGDkkueQQBwkDmkHuhOjsktddgOapWykajlyBHaZCDhgmRNKy",
		@"TfZacLqbIDBfhxy": @"ljqKMzPVvaJIxDlGLXIoglDbKxvGLuezbshrBYSeqiovjvfEoJMAWYHkbiucqJkyZDxxAWrdESvHKzGiSsTxxeJVQwXdTCWLcRHXBP",
		@"GYrbniHitZBpJAo": @"IyZVVNlqfyQMmhaNoRqeNOUIaBCtinmnfMUeBcDzuTanjnfGfAZlCgTmpHxTZOjvrRqOjnpIxOyZKiNeXVtbateTLraFPvESsDpYLhszOBklfxrDWoBQomYsQnkjAWAuWIP",
		@"HwjHxoFPbi": @"LDifAWkmwJEtXEtbhoVolsBbyxZzxWAjfbbpPeXjIYNyrfZClOJmMUnxHOYFrzrVCsEhiLDYSdjMZpdzDlOUUqFzffbaOSEppvueNVKXDmibuOWWZuirwTGTTZJwGnZPxGdn",
		@"TeeSjLOQntrIbxCWXF": @"yTMyiKIopqezuEvZmzVZLKjNDCmvXdEEJPVPpCYnvhLxfzWwzVRiuaeDZVszuWSlbOlSShumOJpVvUGiPiJeuQSIgfOckQLrNRLbQMFVDvuCkfMVBBLfkbsVJVVKVwGiTRpqzpYpmwBacefkRn",
		@"dGKsRGHZtgbrBat": @"JDdsUgRIcgcVDjxGfFYbZLAWzZOZlvocNCYbBYbVTpELRtQgWrpgvyYpXdOcmuoyFURRSmPMrwqULHaeOiadIETISTOaoUZglNJawiJLJiZZAVJvSgwZMXfhIpO",
		@"heKmNfQfPlEM": @"fUUCaMnjLkmznllYHoRyiAQFmgLMowDDAlSZpKGVipvtZgCKOAcrzAduQZmIBjsqgHVgWtFCxukvRBJbXxobcHNJDBjoQObnqpvahsmoqHyFUGQsL",
		@"kmgyBSHqyZntyoze": @"VDqvfbdWgEcjfnxhTuJUpOSBKGEKSsIbVzzQHJcZJiSqvbKRcsKYzTnghdLcDRAHEoXJrnsEXZWpbBYLNferpROKyQtDoHUnyQLHihpKngNECfmPlHwGCsceNBKrRPUyKfABGfsGNyFjYMMi",
		@"QTyzjqCWrWXwao": @"gNYwBJSmJHXfiwmLXSNdfiLAtfOjCilRYdBPNDgwJtWWuupHfrjaaDmRTaLArqhTlsmtBqZaJVrCVhQlVYSvbTyCnphWuxsWmPhsXwnhnbhqAMQjkaVhOoTv",
		@"MloDKpfPjMbfiWQyd": @"febzhLeXLxKliDGoAthUolEAZfgmeTBOIvZWRhkoXcZUlGLdqdzBguDBtNDKZcxoqCKEJldJtzHgagZgbvvANMlTdsoznGVGpEkpZjsXdOMYmHMDNPsloCrvr",
		@"UGrJkeheeJvbhXkc": @"zEXAlIjgIMwpCLUaOKiTjwgxeyxtWpkSXvCRTzanQsSvkPlJVATAiYIHUnJHYZusQbiMnelLJVNbOlsZyjUrhsHTLJzGELuQBUsXeHHKQFOqgsGvOkfkgFerFwefcCUFXpHjZK",
		@"mgmrcTUzMucYAQl": @"NJRgxQALckzYzJtbODtRnInICgYnyoyDpIcExBHhszxFFKXtxrjhcOUOUBVtGRRBBFjMPkCFHjyulugxMrbbXniOYWIAJYmCZIPDeWwyat",
		@"SWjaCGWCIUHnqKq": @"fXmgfCbzLETxgipqPeNEXtyhroBhblEAyDgmdREGZATdrLYXhqEUgLlLXLatMAwdHYTcRYpXAyImPVzTCzTRujlBRWLNpXuqEaFXOfXsbtuBasMoGBaXgRTSGaLqJTycvUAQjY",
		@"nCCTobXwfKVLWWW": @"tgzHpWYrRtaGryzSsyBefoYtlcWZMSpnXnpnbSxPwCCiaAGGcluprjALFpQSByyFauKJfaHQyrLWuwEEPITMBufmeOBBoZhANpWonSdMjGEYJtTeHcmbLZV",
		@"ldTkGBaNVahlkEUm": @"jbmZQMDxDlVXETvsDBXsovLIMbklFBzQzjyHcTsJhGRsXywuFEfNEcDhtDymPzYnZPBPKJpyyZccnkjtrCFOysziqiQIeKxHuXMIJlOASmJdRfqt",
	};
	return yRxVYRiiUW;
}

+ (nonnull NSString *)CiJLYuAyMrObwcryUH :(nonnull NSDictionary *)usCphzJjvR {
	NSString *AZWIoJMnpHRRM = @"zEPfzKoeNDAVpniBDEJXFjVWCFvSpZElnWujJuTxnDqBLddWXhTfZWMDaefnmWPBthDpMbIkECMhXBeexXfaLaaeFXLkpPhWwushJLukCiKRIpAWFCDWUdVQeQVSxClYvGHOlpxkewgKCPsUV";
	return AZWIoJMnpHRRM;
}

- (nonnull NSArray *)loiKxXrckI :(nonnull NSString *)PUloRoGYeiimuVZ :(nonnull NSArray *)gLbOBgtkRvZ :(nonnull UIImage *)nfZZTmfbpuODaV {
	NSArray *cFrxCNAswrGKaL = @[
		@"mNGPfnXocDuhqKzuNPjZAGLzthPfNMcSyZuYjOahmgLQeAfrsSxxmmLqABafXVJPKVZRjVGJUASmusIxxGoAmhccUJkXBxmSyBRnkkrdoIovsNxVgiS",
		@"UqxDfdHfrQVSxzFDzULzmAfLgqDSxxQWdUGJdBqpgXChPwjoHhNVyybrOiRncrbmnDWnwcYWDGSymHyFzYqeyeMrGUrADXmCLxCjti",
		@"TEYEdnnPrSSrKLiDltiGwHBszMsBVvBglbvvbDddIXgBWHEoATFwfLktkzgboNyTvTDLqHCUcmncmRNpxrrxWVqBufIluWTOnDQeCQ",
		@"KGpYhIuNLAzyMhnaDhKSQeIIfneanxulLoPYlkITwwifPwlkxAtfaqhTWpqarHvxNxUAVuRQpYhhEAoMbyulpJbssoVCXQgXkxkqEgTAvxBDMGgoyBzKUm",
		@"eCThsoeSozKdHPAyZHPkwoTnnJsITeHxDkzqcmSSFdODuatjBFGzUeuWuoRseZTDaKTfzRPJCRAAePYlkAQvnsVrwIKUgnPaDamZBhKEzlAIFlIXmaOPDTZwOZPG",
		@"NocLSXpbEvmKXWvmOtAzrSvIfMFkXCxFBLOtQkdjUjunOHcGTfKNTJrKrSKFziCaXgvingohxEjZzszAwaBevKPzdSREgzNLAQMzrBcgKr",
		@"vvsgdTDTbFtnBCNVCXeaoEKepNOLtLVMLirFetxDtBLSEufMrXQwfFUJNvwcwxSovuleoDNMsLFDueVbBAhcEUbDEWbZSiXSdTpXgZqWdGTLjOQSQBnJbMQyAybwXmyyvBgcWPV",
		@"msroOywOJrFaBFgJjdBoGFdrWvgfExtgrnnRKEtdWErpQiYCsBxQdhVgrTkqEduapMosWkPPVeQozxkUJwBRyzqKQhQZmjfFyGfeJvukhANCjWzXYVNpTHnB",
		@"XJAhOiMdxHcwNKLpecpKGhxUTAwoWYmBwlNSsXOmMMIaKlEKnHZgeysaercvVAarzXxQzzXHAWtFRJCWmBqVWDPDWMmGlmOsinxyPykxjcCCXZmaJSwXNuzzHVyMRXEe",
		@"bXkQNjMKEBaSIHNbzWTKiiEhfdZkkFCYpfftRgTXYFFULYjPNzvGXqJzYrKzHUnrHqJHkNuIcaJeEGvXYzNwVrWyacDqLWBJmGVNHTZKanYJkQyWJqZcEHyxOhdqKySsYyjg",
		@"jrNVhdazaBnYxicujmswgcHNsGGqkiIPXvYXPiPBEFvzGKfkkZarVakewwAuUEQsrtXaQheMpZszLzLBsBiYnYzdWhfmNXmWJaXyXvDBNMwVqhniss",
		@"kfxzdJLlXLZUQUBKWufmFFqzCFqZUfOdJavsUQBdLicaUqwYStPeUPWqOLIuBmjfhxbSnLqOwZpnYMRdCNqKzDBHKkJNCkUPPCQvqfrDNfFqhUmlllONIOfMHLXcupOQcOPsb",
	];
	return cFrxCNAswrGKaL;
}

- (nonnull NSDictionary *)IcdyiXbRzkDBlDiG :(nonnull NSString *)KvVUizvxxUqcQnj :(nonnull NSArray *)jZdrxdlGUSnKYTSCgOd {
	NSDictionary *JSAqXUKwwaKm = @{
		@"IxSeyeRTUaLE": @"ruvgxwSOdrDUqKLmTNMloxKIRawTYaDOLxDvAruSKJCraZAiPsZDRnmjLBXUYxznFrHVVQxBmlITiwuhDEkOlvRzEheztmqIzHwC",
		@"xSBDUwjZNcer": @"lHDtidEFJxOoGTeNBeokKTEtJbVPYGfsAkdSLuSkWLSLiyJccDmyvEQIovZQjAWiyEPpSAHpidzPnJfzWkctqpwDXPMoPZgmjOpJytHIvoafdaVHk",
		@"GWcYpZOoaN": @"FZMFXxcpJBqlZtBYaXrOheKZWzAaKZiXkihuvuqOIbyhAFyclpvQGyAdQXNBTCQlbSiHEQfOUdeZXIIxKhMkZLJlitDjEUkOXXTQkjscbxSF",
		@"mwfZZkyRHaCveQSpXQE": @"RUELpRSuHJZSPGUdKVqXZSCJPUypkScgxiNFJlUqZXSBsIErbRkljYKcfvFASUwMTvELepOZdJySNSfKXoHJqNlPbjJEmnzjRMquEIqmDOXuhXg",
		@"GktMRXGQyYxqoRkHAkN": @"uVhIajvLrtKmIAZRyedrvVdbRrTGFcPVIxyPzZDgMbfuAkYwqCpsUlxUyRrdRggyTfagyeIFZUUgWlGKNAgVdcczqcPEgvASzKULeMUPDLtOGiFFAAiMPsYSKOzmaR",
		@"RBQKyscmzjdRVE": @"zQGpLfZMlDxkaRSayewJKatYJfJJhLzVXvrKLOmQJgUxFFzukHYyoIXxRsXeKNdXKuRinnXqWOcuqqkJfJBTYehBhIYYaJVtrkGhtljLpRQYtxtqYNaExqTIyKzQzwirSdirEKLJlqgOzZewogpZ",
		@"OpCxrTZadTI": @"NsIdhfSbrjLGSYtobJqXfUTPpfMVXtWhcmEadPeJiqjovsUtnYvcpXJluSaLPyjRxYyLNQgFDtzAyXjQdtHcdtWnogyXpVHfpAtmjYZCChqkBk",
		@"gJcUjAOYhnkPDoXzYTb": @"qRBYrIYmNBZpplKExlxOExUXgfVsXmrBooUJJeXLVStvopyvayIrIXuvnqksulEToWoJZRewzItKkcgIlkvIudNfFUgYwbwumfQHMGWlBunppXiEPsXxP",
		@"gqeQOHNDKerTB": @"XXaaNRgpwHCdssOmCAUBuLrjFzYzaleoMTJSCtnFqagYqgfMIlEprIDfYAixOehlQFTjzQSUtSAJrPoTNdhswomBtoADeaBsjmHwYgkGRoeisKlnvhvdsoJPwCsAYDAgZmaqsBVhnXdJVQR",
		@"wpesNyxdNXdtLUY": @"JQoWYuAzshyiDyGfZSkUedDMoChTdkAFMmNfKNhmbZrOLHJNMscfGMcTBWXcFzgtoGrmomKadvTRuEDsdpHdhbBjwizedKuZPVBlchKOZzHaoLRlDEOapokPDwWHDHbeVZkr",
		@"ozgdgWqbMjbgQhLxv": @"QvfGjVpQeIDwrSqMDKGEgLZedZvQNzTILpArIlMpTKDijVbQeOlKfngAgzRYSdbgABpivaEHkjZZDiqfCBDaXzsWBfTfrNGFJrUMvSPdOoZG",
		@"niFxxAoJrBjzgtLKDY": @"BMwccFARtXsXGIsTnIbezXuviHIHvuEtXaryAJlcJtQkoNAsfzKKxVGdYDmACPUQGjVAtJGUqGdTSwCSqzZSarzthGbISEuuUTfTN",
	};
	return JSAqXUKwwaKm;
}

- (nonnull NSDictionary *)vbsfvXExooNjwmtcjy :(nonnull NSDictionary *)uobrClsXqljqglaSUd :(nonnull NSArray *)KmGYsdypIeTm {
	NSDictionary *VOYuxkRnlSXO = @{
		@"IKDAJCbZUiUxvl": @"vaYTjSEGKodpwaNTnmcJciZrnEWXOxoxvUGDkqQevPJIcvYSjKiwXSDFmxOXRWikxobjsffCfBIQOTprJItEdLPyXQFMpRjpUvtncbnwyrzswfiibyzHFnFkyVogHjLeRVLQxSfPlDXoRLnfzmI",
		@"OoyVmJrwgpTr": @"hPvrYBAdTlXieXTyauMqpxKpwswoURSvQqDrhyTUoICbuFjJXpYRjVmoiaElncgunhUUotRrCtlKZzCWVLMJQWnGpFdjDUPGmkUCaqoESOWBICbDDzCAkpbpQKOre",
		@"EsHzofRXJmPaN": @"PoIkCmaQdjUesHAwDkUjoTnpmLZmTEHNGbzgwIuqrEUwUAJkednJaASRRtJRiuuTsiOvmNsWjfszHZXcaRdIeIrGcvITBglQqDyWRIVSQoUwEHwccFXjXAKPNPZsmNYhLtxtUkMKtenyYlGWRz",
		@"IJZICGfLlizYrMdGQI": @"uVOAsHanSRHgqYUdduMTYBlmmSrFpUKxOobnyiKBkYQLBjcpInPWplgcPNEXBXPsaifuYqLueLHbPvjGnhrSigUKrhAKnFDQpOoNmHbPUlRbNYNMlKCcvhzCtGsDUZVWSSLTTXfOqDTzFPuna",
		@"CYcjiodyGEhua": @"PyiKZJyAYeRogYicqJXNCenHShMcCVcasEHVJcusvFIehDVeGMxpzgzlAHshRIPYxkkKFyXGbBLiWdDejENpXXxvTLZFRPNDumSeofwTP",
		@"VvHHCkvHktbESuUE": @"ofmNYsMIXbLlyRchtsBYHQbzRTYWJmDFoNEEGJofEdFtcelWDAfXZZqYvsZHpHoEAYxRsRXQgDpDYjYRkKjSfzAVgQYWczBPgkpEpO",
		@"TZZWNvPpxFvradNWTZK": @"AqQKXbJalgCcWoiReyGuCRQFwmqUxHGcIdhzrJTLLlTCEMWtteBCQsdDnIRvKOvHHxbNdwHmnOgRYcKGRGoLaDjtWyeFCazssgWphUQteYrLsCUPikTDbmywWwzNOrb",
		@"lSeaSlkJAN": @"ZcTfLXasojhEjRskLesbpaLkEotkDSLUCYIxifyKQvsIIOYWYOmkFYaNbmRHLOKTQYxhlwvTsqhVjdYQvQNqxsrCDtVtlBROGaekkkc",
		@"aLlxTaTUPsiMiuLNmZ": @"ssfsdvNNUixQeqKQmPBrrxSISXRvtcpWTsKhzmWyjJmwPrWSYVYGnoWbQFVpknrZEEPVCYsmkjjHwdTuJTcrRsHaQKBHMrxoLpiOn",
		@"VmYSLTMaxMLsuiVd": @"HjgPUfmsViweFXPSXCejWGEEiXnSuRKeOOdgnsVEKLZFtxIytOSTxmsgrCmheGOpomBdQCwxSiXyRnxOdBMmWTzbVVjONeNshMptSZZSaDLp",
		@"oTdlVTkCyoF": @"ajDcJHuxZvCUMGlVlhKTFltudIXDrIcvWTlmBTnQUgrCKOYCamBwiUbuRydDXHIKHNWXBinNYVUEbqsZAqcftPdIIDUyFiYuqjbLKkRUxWKaGyKdTOSVHNweGezVnH",
		@"XyiztnBJFul": @"eZAdAVFqWwqXkIKjdQbkkASYDGYSZvkOxmZtKUBRNaxhqmskHnsZVJYqRwjzoIJVkVBToREsCeAOxbkNTzpAJXVBtdOaQBjsqnUYiPOrAbEKnvMaQvpNmSrMJxYKPJGRcaUzWApbQTPCyFiC",
		@"moeUecoLqPjx": @"NmqqTxKLZHWZkihfNeqOXNAXfHhozPaXULxGnIOLlCZolPacCTnusPZXntJKdGYwfMGIHFuhwvZGaWJKugabhUXQOkRmJnyhXitfhomxGuVdLNmSLWqfzvmttRypcVeKwtpvlFfNwSCqnbs",
		@"zSdGKvgEmrIohOyFJGx": @"lHUopUZHBKkydbgUwzfrnFYTUXGvgwFpnRRCXIQqySLnCdCGgydGhUBVdtNVyxTcfDAhjcZWPbArmERugQHPYkSpNMswkjTzTYTO",
	};
	return VOYuxkRnlSXO;
}

- (nonnull NSString *)heccfDGaQKSfnXi :(nonnull NSData *)JosOpMreXto :(nonnull NSArray *)HWQTnkFKmOu :(nonnull NSDictionary *)uQtiTbJrMnRkie {
	NSString *mzpzLiCLXXDbcABfgdv = @"TgATjYrqZdhgOIQwonUJNJLYYIjLbitmsxqlMBBflpBSoLlIiOkygLJSPcYZVMifOgYrTCKQQypsRXrCtnJYnVcyAKkfpQZYQEVCDcEvednSxkFeNJTwjW";
	return mzpzLiCLXXDbcABfgdv;
}

- (nonnull NSArray *)DYMqnBaZbLBDGv :(nonnull NSString *)ncxgQPNTVurImkC :(nonnull NSDictionary *)tFblviPpYIMxeFtTT {
	NSArray *ETjRZDCOYmJbpHfYb = @[
		@"ZjrFiDMouKAkeVGQfWqIEUbTqZqlKoymtsidVjFulXundKeHpQmJFVsYSZUXHZBjxbiaeNgXIHNKequYVptSdLWnsxoYiDlHjDTCIrXJjdhzCpUuMrpJE",
		@"iMOhbGqtgKRJwNBTvPcgqsszHqEPxKCyqdHBZwJUKbxOYFOkNoCelvztzsfPqchvfFtMYmJJxhLtdszujwISWCGojeCGHAvspmJOeUuxeahhaqVBkOhzhZRasGUZycFypF",
		@"hhTkzNXsGFDUlXqDrOaCMBlboyoHboKILqTxCaUpPhwiebupmYMstqzuUkGHUoAANbAPFsnLQlSIYLCyugMQENmlNlnUruUtdSBYcVyYafNeRBQhoDr",
		@"pnHysNMpgFcQHgTSEcAdcObIgIYXBCCtyCohFPbCTzjbKCsepLxZUPxgshhHdeYoIwJkGDfmOmmWBPwhFwvxrDTWdixktXPXWclCU",
		@"hpbCEvAWDVflZPSENyQTBoZkfvoxmBJmuuaersFSUJIHhfNXHvBQStHljOVNnwaXlViDUMGJuqEZWHSNLXgQfKUruourQZYKzJCmbeVkCUmGYaOYxquVSQAOAjqq",
		@"uLsXPGIxPYcxNsFapttHUDhsuezaquXTpFcTOZCHtnfyPfqDkjgKROMwyXavCmZgTWvkDINoKuJxmVzFLpppeymdAQQkjpvntEiowdywhNGZSzOCHeDDUZgmNmogOK",
		@"fbjJeFmOPDdplJAIRiRsOQSHjdqjZCVWHSeScHUWicCZyUPgJnPGIMcaFIihllwfCpUPLtfEoVKLqGnJFUYumTDTOazSEIzyURaLtfPTZXQOCtEVFriyYprsLFSEMvQaGqGxbegBhcOoZVmgvnaH",
		@"PKDgxPDHFgorjBFPgRhiAStgqXtauhpvgVjnqiLzNFhRSaOCJxcKwfHRhXSgnnwzKNQSshKFouVhkSwCVelASIHnFVMkSYvdrgpYTAEIrizKOYTLiZjBmlcI",
		@"tcwnUefurrQVapbKIGDoDhctjmyCcFdujFXbTuaLtmxRIICyiiHZhFRmofEuRnImQbGYieoIXoNpFQNhecOSJZAwXahLbbtBfRCPmyxocpWlILxXZcKrEYJbEECNdbxZlLhdU",
		@"DVtJHqwPpVBmvrWMyAMkeoaktfecGTozQENyiwGXfKmucGzXGNXTaCbWeUMIGytLYHPDTRoPmGNACbxWltWaCMmnlBFnxCbiOFRNRlsVYM",
	];
	return ETjRZDCOYmJbpHfYb;
}

- (nonnull NSData *)tJjkufCJRZ :(nonnull UIImage *)FfDESxOOKXvNHH :(nonnull NSData *)SkOMcjUsgSaHjpocCJ {
	NSData *rexZPpOJPjZv = [@"wwKrNrfXoMOcNhVUBVRvGddsCFqzWUVzHIDLFsaqwBAAsxkIiMGDfGKZeUkDyLberaPQrCxXQAWVSYyPlnYzvnoxPZsRijcwDQDShygdCbDMqcdkaXCKALJxhuZtDrFxHLmjsrcrqQMRruebNp" dataUsingEncoding:NSUTF8StringEncoding];
	return rexZPpOJPjZv;
}

+ (nonnull NSDictionary *)KUQYAyxheltgyI :(nonnull NSDictionary *)jhKDxBTQHWEz {
	NSDictionary *xgjoSBFhGDdEf = @{
		@"VAoNwFcLJiRSluqM": @"ZzwmsLNPbRfaVwOWjZeOUtdfnvsgZmiQGtcgyVeHgfLgXhlhVrWinrnbKAWGqgduylOWvtNIhgnzLmRcnlCrwPEbDgZLnxEQHJoHvZ",
		@"VSaPihwlJNk": @"DEFjxsBilHgxrNFdTAqlQzmlapjQENtfUfxVIryXDMneArwfiutSrmjjFOfnnmOKtwclvsuNnwRndcqcnaxrSbSPBLmTKthddMLM",
		@"KNtaydqLRAlVAv": @"fGOuZLnpOxveTYLibrhvWcWmJjlmQZQLPUpJaIxFjmIkGvnvUIFiyuyxzcszNOafywCrzBjMkihrnGrojklaFiVDjhksbxZJmUalJoTeofspFasuFEGQTzZSAbYhLbkRIPqxZ",
		@"iAwetqrSUqRniujQ": @"ILLiHNpGgNmDDhknLfukunPERGTOYlaKExTmnBNSYaVBZFKnfMmtOfnEyxbGSpbClOzXCQEXWRHzEwiQTGeJkjnbBYVEUQYcAeKxoCEdDkGzZKhRskXWbFYZTJGaIemxDDqHoaWpEgrcToDK",
		@"oUnDXFExCTrHO": @"TfJjCEFPthzojgqhNEnNuRvvgYqkbPNsXZHfjTcFsvUeQFrBjbJEvEljYorTeAcRVCOElqZGFPxAHameZdQWTxRzcaWgESETXTfAyuMYpOZ",
		@"zhXOGvpgQzbl": @"WxguiqYrkQqExPIGZHIZPqyGPLGDnnRjrilwvlAMXZvXdwycqgcxyTrtzzFSYTmPIQSFpbaCulNjSOGsHIRRhlWKwVmOLpvDxRFLuaVtUGmo",
		@"UhcTuZGGKFoKACGsgj": @"GueyVcsvxnyrrUGkyBfvZqJwuzaSMeaBmKbmdyJghApFGyOOzFLrZtpKtoEBVOUyzeFZFHNILgYjRSPJxFvXdGlHOAdjhqhoXZugUYsyiXoGVQTsqUVX",
		@"BosqbyKRseukVFxzsF": @"jFnFjnReLlyoVBVDTHVJGiFeXHnSdYZiaZXRwukWqAWHlnUIbcGYMfWKpcXgvCNlWuRjPhUbDSWBASETSlegEbrnfVxoJLjrFVZDULvdWSKxOEIYu",
		@"NPMRYMwqZOSCkK": @"jsejoWGwESQilYOGwtloHmlNiAXYoHjVsVjcHpIBSdYYdcoGcfkTRCQJPpyLaXmPYDzbhilsAIvfIaNnwBhfcWcRVOPxmlTlcTZOuBeskHXaOM",
		@"lwjMdpBqTOCBDCYOdZ": @"GlLTsQRenaPgbenmWiCwMPVCLCyTrzBHqWpdWRDRPeOyRjPdUzAKsXoJthMrBJHtlvIdvDnKdDFlvRQSefgOgxkWLkyhzeaqvyZpoHRFXwLzbPtwBTrmJMvEHFWSegDuHkWnAufgVzNXpNv",
	};
	return xgjoSBFhGDdEf;
}

- (void)pickerViewDidSelectType:(NSString *)type subType:(NSString *)subType
{
    NSString *typeStr = [NSString stringWithFormat:@"%@/%@", type, subType];
    EMBillItemInfo *itemInfo = self.itemArr[0];
    itemInfo.itemValue = typeStr;
    [self.tableView reloadData];
}

@end
