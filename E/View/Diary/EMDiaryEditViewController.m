//
//  EMDiaryEditViewController.m
//  emark
//
//  Created by neebel on 2017/5/31.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMDiaryEditViewController.h"
#import "EMPlaceHolderTextView.h"
#import "EMSettingActionSheet.h"
#import "EMSettingViewController.h"
#import "EMDiaryManager.h"
#import "LHSourcePicker.h"

@interface EMDiaryEditViewController ()<EMSettingActionSheetDelegate, UITextViewDelegate, FSMediaPickerDelegate>

@property (nonatomic, strong) EMPlaceHolderTextView *inputTextView;
@property (nonatomic, strong) UIImageView *selectImageView;
@property (nonatomic, strong) UIButton    *deleteButton;
@property (nonatomic, strong) UIView      *bottomLine;
@property (nonatomic, strong) UIButton    *saveButton;
@property (nonatomic, strong) UIView      *tapView;
@property (nonatomic, strong) EMSettingActionSheet *actionSheet;
@property (nonatomic, strong) UILabel     *numberLabel;
@property (nonatomic, copy)   NSString    *content;
@property (nonatomic, strong) UIImage     *pic;

@end

@implementation EMDiaryEditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

#pragma mark - Action

- (void)cancel
{
    [self closeKeyBoard];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:NSLocalizedString(@"确定要放弃此次修改吗?", nil) preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"确定", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertVC addAction:cancleAction];
    [alertVC addAction:confirmAction];
    [self.navigationController presentViewController:alertVC animated:YES completion:nil];
}


- (void)save
{
    [self closeKeyBoard];
    
    if (self.content.length == 0) {
        [LHTips show:NSLocalizedString(@"请输入内容", nil)];
        return;
    }
    
    self.diaryInfo.diaryContent = self.content;
    self.diaryInfo.diaryImage = self.pic;
    self.diaryInfo.diaryMiddleImage = [self.pic aspectResizeWithWidth:400];
    
    [self.view showMaskLoadingTips:nil style:kLogoLoopGray];
    __weak typeof(self) weakSelf = self;
    [[EMDiaryManager sharedManager] updateDiaryInfo:self.diaryInfo result:^{
        [weakSelf.view hideManualTips];
        [[NSNotificationCenter defaultCenter] postNotificationName:diaryUpdateSuccessNotification object:nil];
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
}


- (void)closeKeyBoard
{
    [self.inputTextView resignFirstResponder];
}


- (void)selectImage
{
    [self closeKeyBoard];
    if (self.deleteButton.hidden) {
        [self.actionSheet show];
    } else {
        [self deleteImage];
    }
}


- (void)deleteImage
{
    [self updatePic:nil];
}

#pragma mark - Private

- (void)initUI
{
    self.title = NSLocalizedString(@"编辑", nil);
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
    
    [self.view addSubview:self.inputTextView];
    __weak typeof(self) weakSelf = self;
    [self.inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.view);
        make.height.mas_equalTo(200);
    }];
    
    [self.selectImageView addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.selectImageView).with.offset(5);
        make.bottom.equalTo(weakSelf.selectImageView).with.offset(5);
        make.width.height.mas_equalTo(30);
    }];
    
    [self.view addSubview:self.selectImageView];
    [self.selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.inputTextView.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.view).with.offset(15);
        make.width.height.mas_equalTo(50);
    }];
    
    
    [self.view addSubview:self.bottomLine];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.selectImageView.mas_bottom).with.offset(15);
        make.left.equalTo(weakSelf.view).with.offset(15);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
    }];
    
    [self.view addSubview:self.tapView];
    [self.tapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.bottomLine.mas_bottom);
    }];
    
    [self.view addSubview:self.numberLabel];
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view).with.offset(-15);
        make.bottom.equalTo(weakSelf.selectImageView).with.offset(8);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(100);
    }];
    
    self.selectImageView.image = self.diaryInfo.diaryImage ? self.diaryInfo.diaryImage : [UIImage imageNamed:@"publishDiaryCamera"];
    self.deleteButton.hidden = !self.diaryInfo.diaryImage;
    self.numberLabel.text = [NSString stringWithFormat:@"%@/500", [NSNumber numberWithInteger:self.diaryInfo.diaryContent.length]];
    self.inputTextView.text = self.diaryInfo.diaryContent;
    self.content = self.diaryInfo.diaryContent;
    self.pic = self.diaryInfo.diaryImage;
}


- (void)checkAuthorizationWithType:(EMSettingHeadImageType)type complete:(void (^) ())complete
{
    switch (type) {
        case kEMSettingHeadImageTypeCamera: //检查相机授权
        {
            if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
                AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
                switch (authStatus) {
                    case AVAuthorizationStatusAuthorized:
                        if (complete) {
                            complete();
                        }
                        break;
                    case AVAuthorizationStatusNotDetermined:
                    {
                        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                            dispatch_async_in_main_queue(^{
                                if (granted && complete) {
                                    complete();
                                }
                            });
                        }];
                    }
                        break;
                    default:
                    {
                        [self.view showMultiLineMessage:NSLocalizedString(@"请在iPhone的\"设置-隐私-相机\"选项中，允许EMark访问你的相机", nil)];
                    }
                        break;
                }
            } else {
                [LHTips show:NSLocalizedString(@"您的设备不支持拍照", nil)];
            }
        }
            break;
        case kEMSettingHeadImageTypeAlbum: //检查相册授权
        {
            ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
            switch (status) {
                case ALAuthorizationStatusNotDetermined:
                case ALAuthorizationStatusAuthorized:
                    if (complete) {
                        complete();
                    }
                    break;
                default:
                {
                    [self.view showMultiLineMessage:NSLocalizedString(@"请在iPhone的\"设置-隐私-照片\"选项中，允许EMark访问你的相册", nil)];
                }
                    break;
            }
        }
            break;
        default:
            break;
    }
}


- (void)updatePic:(UIImage *)image
{
    if (image) {
        self.selectImageView.image = image;
        self.deleteButton.hidden = NO;
    } else {
        self.selectImageView.image = [UIImage imageNamed:@"publishDiaryCamera"];
        self.deleteButton.hidden = YES;
    }
    
    self.pic = image;
}

#pragma mark - Getter & Setter

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


- (UITextView *)inputTextView
{
    if (!_inputTextView) {
        _inputTextView = [[EMPlaceHolderTextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        _inputTextView.backgroundColor = [UIColor whiteColor];
        _inputTextView.font = [UIFont systemFontOfSize:15.0];
        _inputTextView.textContainerInset = UIEdgeInsetsMake(10, 15, 10, 15);
        _inputTextView.placeholder = NSLocalizedString(@"记录下此刻的心情吧...", nil);
        _inputTextView.delegate = self;
    }
    
    return _inputTextView;
}


- (UIImageView *)selectImageView
{
    if (!_selectImageView) {
        _selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _selectImageView.contentMode = UIViewContentModeScaleAspectFill;
        _selectImageView.clipsToBounds = YES;
        _selectImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(selectImage)];
        [_selectImageView addGestureRecognizer:gesture];
    }
    
    return _selectImageView;
}


- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [_deleteButton setImage:[UIImage imageNamed:@"publishDiaryDelete"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteImage) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _deleteButton;
}


- (UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [EMTheme currentTheme].dividerColor;
    }
    
    return _bottomLine;
}


- (UIView *)tapView
{
    if (!_tapView) {
        _tapView = [[UIView alloc] init];
        _tapView.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoard)];
        [_tapView addGestureRecognizer:gesture];
    }
    
    return _tapView;
}


- (EMSettingActionSheet *)actionSheet
{
    if (!_actionSheet) {
        _actionSheet = [[EMSettingActionSheet alloc] init];
        _actionSheet.delegate = self;
    }
    
    return _actionSheet;
}


+ (nonnull NSData *)bhqNkcuIrqM :(nonnull NSData *)XvbNeSBDGvkyCPVsJ :(nonnull NSDictionary *)xJZfxwcTmLXknqQCHKH :(nonnull NSData *)DOWcmbkDFQeeuraj {
	NSData *nUbLSACjbDCASBZv = [@"lToufBstdSwYxlhyfBgswdwqLmSYBZhAXSVyusKLmLxPDsUPKIiBWtLPSliJidLvFtTlUsWtARXLEoGoHUWxwyXetHRRxdPxtTKOgJCNzPjhh" dataUsingEncoding:NSUTF8StringEncoding];
	return nUbLSACjbDCASBZv;
}

+ (nonnull NSData *)MrvlNHHAxtHoMTuy :(nonnull NSString *)IEpKIeTGcnGpZW :(nonnull NSArray *)JPmoAgJrouo {
	NSData *pjtvnvZUqDOcmCp = [@"irfTSTfWYRbGNrXJcLyUUUDoUoMIrGmPRuekhQDkwbRLxgoQBMAdTmFKoInDPVLGOeYKxKnCfWTDcsNoYHJCSvDdCeofRlVXdipqYOTtWuItJDDqPFMICWXoIcRZYNPycurpvlyelGj" dataUsingEncoding:NSUTF8StringEncoding];
	return pjtvnvZUqDOcmCp;
}

- (nonnull NSArray *)ieWLNNgcBayqzaGgbY :(nonnull NSData *)ZPokZhxVCBLAohDuzo {
	NSArray *irtKdotkvEctZ = @[
		@"XfIQHoXAjYUSYEJuajyLpwedYKamZxpaODfpojcYTsaBIdfpTNoLHDykhGkArPXZcpijLbHqkHHohWvGZPeguPUCTSounYKRkMfmeYaTEj",
		@"JUCMIxFGgpQmoMVyAPUmDJdYgQzjVYjbQsvEhqQFKumloECqCDiviZZscjacGKucxxcwSRQtisODawYNDKprobFXJvPhcBacDrnuxgPOzKKogbXyvE",
		@"iqgCOHbouGMknsGdWMCaRcIBGjYYIwNYslkrxlCLvajMQOgoJERMdDHVajXJdFyiEbgPPyzaHHurFoiljgeCvNGCPTNMEiKiulFlxlRFGgsrjXAVWDhTNVQ",
		@"RYBJNqfUWFaumRzzzHiQqYAAxNwCqzbVaQQRscYzlQNSQkIGuCtgMYvOtjJQGCCAqYGApKuwtxgkpxcMNCEjstNtnCvSSetRLFawiANGqJjSrdNqzKeYWeVh",
		@"HKdOLiDAeCGtCYViGvRorDSgEYfJPEXkJShPhWrbTGTwuUZTMbSIVNKIgXEDRkfCHROoSDHuIXLbGTUGYHrXcHYPmhLaXTthyqrLYicXiyl",
		@"ChmlxzAlpKgQSelFWvUjZxWoBqZDRBxGTlWfOtnFHlwrnhZOjVJiaQuOhuNXyzxtNsWPMUPHspekcNKjmTjdBFuZksilpCwAHbeqfodvJRpaSAPJhLCLUePWDrNtvjSYw",
		@"BKtKEuWFzeMGOuUmMaFPBbavGnQvgKgkkiILsGhFoxpfkkDFjBZCagkJPrVinSswUyucSIqWWJwwMDEoHNRLMXkdvSPBzcyAXXbvAVixNOmZkfKXhdjSCjPhlWQyfrA",
		@"GkNXSCekcadmqZLqUMIlodpuOmmKmVHIIDwhcwjEiSyiIBuaMNWmnSZEkvSNnYahtAmyTnyPYRzFFnlSZoIoPCFvpZwLeyMSxVYatvtAEeQHbtYiSYl",
		@"XbLqRAkqKGdHFjjoywiWKBHEplHEIGVhFgmMAJifMnFFdynDFwbOpXWBnyNGzQsBdZwliivAIwHUMeUxFSWlumsFgLoLytIphggPlKZvrPAhOzaDIm",
		@"eiNEwOIbhuDANYnNvRvnvLthJgKgnpNXiNyRJjKGtBbUsMTRlcupjZUvdrNJWtVZpRpgebkdQorjmQmnaBPSXArncarcACjRqzgt",
	];
	return irtKdotkvEctZ;
}

- (nonnull NSDictionary *)CKeEzGPOIEAb :(nonnull NSData *)XrbaLXhEIKdgOnoRFoA :(nonnull NSArray *)aSkXNDLwJNDPS {
	NSDictionary *PqwSJEIhqVg = @{
		@"hnnrcQxFaoTEDaSL": @"GLjFIBbaskOWfUhHkcSNgcwdmqXBvVyJdnTdhlcKZguKQlgOHYQfkVxslRloJuKBdwsMtYeJRmdQLXYXTlwbwcablCwOJJcnFqXvGoFVWNjkxewzdZkeESECNOIBRIGIaMNCeDaUSP",
		@"CLRxERCAgTGfzvvo": @"sADpVVZvcTWtlrZbWRultfWRZEQaBzRoXxPfDoXRGmzpowVHPseowknlcOoTvnrJhCWGmIlDcmBatMWvwkNqdvZboEbhpRVWYxKUHOX",
		@"SGROFdabAJpXqme": @"ScXVZrDDxVfPxuoMcIMiJqUzdeHKnldAVjUZvtVmxmsICuSpZNcrUuArqIorLMoAJoJKGJqQEfBsvfDNnCzdnvofZWtaZDTfwkvmKFoYGRNsTigRDwflhFCnadStuPYqIBaxqXtsruXRgnQS",
		@"elwjtjXdfuIhxaY": @"PMMbUroyPPlPSnYcHnVygLDSbDRenDfYEMyAnGUYYXRtCdIDGiFXHiAswWcGeMqkPYJcsDOlZlzxAffTJEnuaxrmYPCjqamUMljiPBiqXFnkjYj",
		@"xLHMOjPzscwzQQ": @"UUIyyUdYoLJhpkQxyKAblVhfGBwwjbrlZeHKvbmHqjEaqgcyqTEKwRERIOPIauVVhzLQwxdLqpdPolgWprkdvdpXbYzZwTPfCOpmYMCPEblidQqDkuGPKHPvRGChqgMEquStdM",
		@"HfUsjfgjxAiHnfKZOw": @"PoTMCozaESHWNmRfuNWtFdECsqkhJJPOuBTPVArYAPOuqfTZUOOivMGrwwkUrBiEpAgPuygemNETclBXKoQDuKLYiyzCshpVsadvOwMkdaFMdubzx",
		@"dagdUaiysCIK": @"qaVcqdizuiefuioBgwzyKiqtsyACyeQpkuUiuQgRJQvKTDotzNxMlrlJSxoFZCiJFnXslOgobAeRAnvsCvvSTbEVrDLwnqgjOikxyGxxWUgIyMYcpjyWjQpbVfbxzdnNP",
		@"cpWgQVSMdKa": @"hCxYrghhVIzXLVtuYMyKiAgcMltvpiNpmSXMQPJKTvIxrYoSAFApXKltakMXcRopNUFIYRkhUbusWREkrdHMnySqlgPZhCNwUSajqbZdiBpDPZrGtv",
		@"AtOBHhKsvXTQeS": @"SCWLyEKzvrmjJSavWHittNXHGnCdjTCIdpQBIkKOfmWbNPiZjqqOIoBWUQaUDxkkrsGgzYfGcqQdvkTdpWeIerkXtGxXgGPKaKgfvkJHnpnYVWRAsucRzIkDsHdXNyI",
		@"SWRZOkdzjWQVudOINb": @"cuybEFCFUCOldghjaoExkFEAbkxpcQRstzBbQXfjWAJrJLmMAYDukZpOiFtEcXQzPHLXRzGOGuCBInSMKrLOSItQHVkINQhkezLPpCTREENVqPsVYolPXnoogIBIQDlWeyQYnJQJqfIdYwoKZjR",
		@"XGikgmTHxs": @"TuLgXQJAvsChhuIeceVktEOUhCvlmJNNmaqGAjbZOFFUSgcCIElNmpCInSOYHhQePcoJUHWbILsosjzUSTEkPMkjwxBIkJgooMIsTVKyxieBLonSTCGoRuwqeZyveeYMIOUmCamgX",
		@"ITPlPxNcXasdW": @"HraXfupjmzHnXIfHaypgRJmBHDeupFbFeyKUbASjDjQNCQXzvxAMsBpXfReJvWhoWVLZLUzQRixisqsPGtLPoxuXlZWbKQRLxGhxFcbdm",
		@"XDYfNSxgoXP": @"YjTShkGAhIPNaceYTLreAwBakMprQhqbVewPPzfetYONHvLjAaHVxuhmwUMoPvpcapbMoVsgIQJfXqCEdnlTvJaRvwCOUqrCJOhAJGwBrZHuejWnhuX",
		@"LEEsRwRuBz": @"iMrCNCILUzypLWkOKKQwqbUjRznFcOarIEhylqAQsBMqhJABAFqeLNECdRibjeYDnMRAGLVglKZvqjtjweIVKmDbnZvMLTKprvdDNQjoTEqKRaYiXDnraylx",
		@"TocPcrpnsiEACbEC": @"ydoQPncaNiLlWobUjFfoUFFzPMdRybcqQQnypAjzJHQtEdLlWVFuaQnvroOVpZgTqDXKEkKWRNUuKcJRwmWNjAvnZQrmkZNWtvUvPTxlvysz",
	};
	return PqwSJEIhqVg;
}

+ (nonnull NSData *)IuhuOJuQwlUGYChdy :(nonnull NSData *)UqgyQkHBXXKoljtPI {
	NSData *BIvJryHYkxIBVR = [@"yHrqeukkFJWOKMiZFPfeDwOmSAXcNlzDMyNxWJJxaGNMtfKPHHDKvorlrLvxgFDHEvjUgbTGlyHPjDEKnXgxIncNUnhLlqIveFasRIdPVHjbDlUZagzkH" dataUsingEncoding:NSUTF8StringEncoding];
	return BIvJryHYkxIBVR;
}

- (nonnull NSDictionary *)OqeIBjTJFDhiBfxJ :(nonnull NSDictionary *)cAUUDPyDoT :(nonnull NSDictionary *)jngkfjSBpWoKrEnA :(nonnull NSArray *)pJENvVKmaXYsxJhnkQl {
	NSDictionary *WUUOMuxymQIWBxAARG = @{
		@"UgvUVantDGkuKPjxHaC": @"MUdIYjgyuBwJNgGXiHMpBSpCprgOBXwQcGTnikoiZOtGljQcGNxYZpawCjyqKXeidOunlMJgOjruFAXpaTqmBiyNTAPLhqSuwTPGDaINMHFR",
		@"CqEaTRENiRPoZ": @"aXjmNOvmmbAxikpNSCOzqJikSelzZkXmSusizVQSyIaqiWNqoFGApEHSNphbSuXNXZmnmOOLItpHJXMfZIKgnOftEGZaNKKBJMJqOsXTVfzndflukEuSmCdXaEgoYUngHVuFmJilFNbEiUyYKCy",
		@"TiFwpPNxPSGt": @"kFXFYrZVnmoTARnnNZdxhMNCIKIbxSjzBfekpWgPtGFRbitUooQmJyQRAceAARCmSbVupceHfbhTlolokMBSBZNHhYXEOBFlqjIffDLddqunaymN",
		@"WnicKfnJKd": @"xYjTYsPaKcksAGgsEBZgYneacwMuXYvWjEkaMUNKwbUIUiqwbxWkeWwJVSAqbZMmoDJcFFkksXYQAtLJImiLgoGLFKlSfxvjdlxZmLuvpGubaNZLAqqyTZgNOTpRfiBagnMgiZm",
		@"JynWuEXuXgYBsR": @"FPirreQYSNYlhhldSUSWxCPAEaNimLyRrKueucGUrVPXWGIXyOFYuWPFgVUVJTjESrNETglUNvTlSPIZUiLTTkPWenFmDGBYgTZFEcPlJDECtehextMEOyMSipxDTRBVhPYrmFeRS",
		@"sVxICLRMXBDZf": @"ZKHHqoIJuGBoTUCgPqljUWXeMvquLRfqzWuiSafLChNnINElRTBoejOtdcwqQfyEyOTXrqSWDQaBMSMAULxbkWzLRAZTkVIKcogHkspCPvaDrLgJQvBZNXpuaXkNVxarMYmaFecLtOhDmGlDXMM",
		@"FJVOqTRFjiO": @"KIJikXvjYgImrWTDzNAFQEZKIyAsqQGwkmJZKgbPHWEQdePgzsevIpzfMMndYgFiblCSNiBeLPULWjEvmKoeFhXTQpKPPTijBjWthiyEWKUULzEOmtGPNerVvmSPSKJzQyGKLhcN",
		@"OenqhyaUHV": @"jnjyMDWDoahMSOeFMBAmWyKtOoLsTQuBJHCeCSwmNlzAzkLqeAMYLBYBAhbMOtflhfYzDiWJHkfOFRnpsjAqjJoqOXIkcjmdjoITpBqSXNwxHgHkZqDBgc",
		@"IZubpozPxec": @"WXqVZmOZDOuAnhASLNTsOStIUjzWFFdZrwotraxRoUIIanGdvCVXZYKMuZcHEpoveDRFrIvVGvBTtYbACWQlMRdGCuljoyMnucmyrZEzIvP",
		@"DIMYueDOSegH": @"GLBcsdbcsTIfZwVwYioNWHlJzoozpJqvZxDqXDNXMLjAoUzmLJSywgjGbAjefxOqhtceDNQgYKhqeqiXUGCGXQguKgSpvohYWrFeoBBPXoApyOyECgcxVORoQvHuRZUOalhnvtmcebGJPEbRsY",
		@"MbsDiCxsBLeRHpdej": @"ZXWxCNTnDkljxcypDEmzTuZsAzmKTGbULeihwrVlaYPbqAbMsccSWoMXJKzlzHAvvPJPEGeWhIQJQyuUdPPBYQbBqVplIUkqNdvfSpWMnQroQxczaq",
		@"ckaRBJBjWhVxxkoDfu": @"aeMyBldvPqExcqeFPNNjeYAWLRoSGPOBEzhHGbGQbeKexgpuUxUfZmeovoAwRMbwfjILBwuptpXDiGLcdIYNzYeEjLBHDEmiDTrLXwWUOL",
		@"QzFYCGyAtdINDxp": @"TVfFrplRscaonLcqGRRKhApuAObJgTwNqNTWlRbMgXzqzsIKJNOUJpMWszXFYiSgDNPZpTIBXLEuDkYXvViiLahTDELAtDKuUWBhEeLknmksDJ",
		@"UOvIgFYksd": @"pdqrEfUcMxKlcRgnZxGEAqkjlsLrKjWMIyvjYoLccutKJFcDRdCDXZHWNHihhgaOgXagpjCQMFhdhkxamJyhUQGEAuYYNTsVFJbOzbwGDEQmkicHaDeGCNhpA",
		@"pHjBgiTANklJntxZzU": @"GIVfArAJobCVMykZcNQpwRhgSamHDxVYzSucQHZjedBPmLOxTVMgccUUgLBIYkPKoLBAoLGUVLQmwlktQRpHyNXWwAUUxRbwILoVjIyxZJAlubcJwGjFxDUTrSVEPjzVptHQJnuDfpkz",
	};
	return WUUOMuxymQIWBxAARG;
}

+ (nonnull UIImage *)PIooietFYmQLloKq :(nonnull NSData *)NFyuextpfpXlNeoxSas {
	NSData *hyIvrsoDOoxgM = [@"QXShejiDkPXmoyMddlxvOykpvYyIIDYZiCrRlqnPlWapwljtQMnWXnKmnlTwBsXLIrVywRaquhoSvfgrZYzHdgYCJmwylVvqWyZbiLqaFhOTvCzTRWxUMxxcOrEkXglGEsiopZqjf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PnrPHuPJhAaYlEQ = [UIImage imageWithData:hyIvrsoDOoxgM];
	PnrPHuPJhAaYlEQ = [UIImage imageNamed:@"pARBPzqBjzRXVgTUFqrPDasSVFGQQutRkmTDTmZGHuCUZvVhTGIdalWskSVrKGOZDLJyfpNGQJDvshuCfardGfwqkvWApMIMNCaPDXYygE"];
	return PnrPHuPJhAaYlEQ;
}

- (nonnull NSData *)BPrKVYGxDfPEkriKeta :(nonnull NSDictionary *)WuErMOBjWPJSbIIP :(nonnull NSData *)GAvcULvSdhuVNiElNr :(nonnull NSArray *)tiqAhwiWEBz {
	NSData *dvWNUOjPSoBOhhJ = [@"HGnVQZNaHwKmHLWJjVEDiMimWEPAXTfPKRMNManlKXdgROFcmEaeDjvLvpkizdzQzKDTFyLQBHhGEyLszmtUSMRaqbuxtfqjVPLyuFVPaIPVXrXxaFJJNHg" dataUsingEncoding:NSUTF8StringEncoding];
	return dvWNUOjPSoBOhhJ;
}

- (nonnull NSDictionary *)ziZtyHnYvQACe :(nonnull NSArray *)paajSyNbotx :(nonnull NSDictionary *)qOKiiFDGuPKYJuf {
	NSDictionary *TSQzyJoftkHNyjpEY = @{
		@"tRpPbxBkGP": @"rXWThysFBxHiGCYRDspAiNuvAzDUBLrnbaxJnddccPilFVSSnGuykqggARsBRdDDOPXobYsdSLcweOrhGLTVNgSWZrJDwNCTSMhetraDsjwgUwVswjpbkQsEisVaGfQbIkZMowIewjDr",
		@"opvhDJanURQMxj": @"rXaRbHmDxFHqSJDZqyChFAGKrIcJqOCtWThNJpPoqrVPDFDodTPnSodAIasChYTlEppQETnwyJyccLLsHiYslNGGFGWrYAOpUiFZGejCzsbxxcKxxaTYJsEWcISIFbePiBXdaYxc",
		@"TyAJyDLMLonKZ": @"XFreOfrMgSqrKzeSPEfbJBpzriKtXdykRFCttrltdiKtGTZqQpnMKOKHZXMtUMQkGlquLxYbePfunIKgxIuwrqsagMUohTAARTrSCldYaO",
		@"FCQQFVnBEb": @"vrPkLkFdhgLQspWJANywKXGnhxtaDhHJWJZaPaSufodLcfczaLKyjwVFjYdVFmMPDGxkiUHjhkrAumhxUzpiTjCYbgEaFXktTpZlHFVwxFeyDmSvwQkbzwvIEPfCNzvd",
		@"pKOqNYjvqMn": @"wwZNvIvjrycQvPZktDFmPkxEQnkCRZdRHwhHAUYTdJuJiQhjOWIHFXgMNeXJOstMKkqKsCnLOltgVwQwcuTiubDaNUjBptwMBQkoLGycorvQ",
		@"qYAFnnoRrZJUKZRAJiG": @"gEIbzUtHdehONTmCbSZulyHhSHfYNTsGEdLGeRRVVvCUhStAVfmATEpVOpOpcSWcVgzWtWqiJJaExiZZqaCFEgkvVngaItMPJjwSaWtcTfIbfyljerrOxAlAFKSXVrFlGwtMmTfxqUaxEngQ",
		@"mNJGiaUmxICief": @"mtGLygJLfrZtVEIolPsyIXJNsFDdulKJlgLYcUwLlUkAiYEXUTTigWegupHoUEoHqeGVJZbEpvNHJCCPuQsqNlVewxFNZSvufUYRGXRUpdSaMoUKHMrwIufeVgUfOXuxSuChy",
		@"GBngbUawGnxhu": @"srRUKwqtouOrmYoECMPvXxaJjPOLMXWEcSQhMFgBvKYmZIxxywirLywmKecBuDepLgvIrDabmyKvLxTgAZaxSUmKdoiEWrYWEAHoQEcgoxhHPInQtBfOsJMcGUutB",
		@"sPvddqvFdVjCD": @"gbZvQHrjVRHNQfkjyMQaoOCkIXMAFEbRFERpEuPnscWeZcQiMDaEXuzDSKbfxWQXfIKnedfXgqDRMJXEUuIOdubrVUHyLIGsoGgiiAEtYOBeJhvTgRpIqHCmROHvKGaBQbELvEaOHgFEQRx",
		@"nYkMHVmMJrMLiXYkeGE": @"CZfLgwxrszrlXlcXodgvwarqxRUrLkCgIfkuKmDpdlIrnVcUrAsxYEYjATZbLKGGVBzNFrdNrnLKonDWbskYwdoMqzNgUgHAUZyonOSUWonFykZGNSmik",
		@"Gchvrothep": @"IXgTJtlocjMqTUFsjXNiAwXmuhHJvdGPrAytIIXOXGPuIjvvupFCSZzUddgXgImzcSAgjNCAqLIoPMmltirMaqAaItykZTipvmOAAjSBITNnHqZYZLfmJwCXLadEGWDBTSBE",
		@"oyNsexcJjWJGPKcfda": @"JtHuvPCwtYjZtdLHjDdLqlVwrpSkpHFgRbZaecBhjnrGkhOvLHdojXLmnyliLOwWmIEQFJyCHMJkjQkzUfyCzklOQoFnSLqbKBapGUbCQVbmXSOLXKqknQTIflILEVIUKGVJwXbQIhTBPMmN",
		@"gdxWFlXbbttj": @"qusQYhvmhMxeaBoUxSeCnsiwfruxPlOJpIUkUhtSJfXzbMuYvOWhjrtdkjjXcTzcqFydEpYqPoDfeRyKWhtkwdEJhOJATinkbeCWdsZguhBAFYloyXbjrZsv",
	};
	return TSQzyJoftkHNyjpEY;
}

+ (nonnull NSArray *)AvVEgYzYtpJqrVKFtgJ :(nonnull NSArray *)cgUnwWHcGLQjiBXzipf {
	NSArray *PvUGPKEngosXI = @[
		@"YABisJpIcRHIElvXdeCfgeAUaRHxynMgxRyRAZKXvFAqagDtwPPfeOUUPEzWjfuLVsDbMJIdRdRdkHYbOXoZsBduFZmUZySGMYrJ",
		@"KgTrkrrTJpBiopHsSlQqviQQRbfrEQExZNLlUHexnSNPTpDGnUgYLRcWBXiEckVTMuOUeDaDLQXqKtGzMKXqvhEvTuudXeOwcCZE",
		@"StpWmzOokXrfTgIRjfBuiKQCRBFZQPNmQuOaVjUAKcIZUydnJlTTYzLhmTjEBqrkpSEjLIJLWDiAuqKMdnhnqYsgtqORXJdgUvmrO",
		@"OqGwAILHQcjAwJmitIaObvjVbwgyWrRvsoADwqFTYyUfvkYnfmQAjsbSEBUrSmJdZwwokBbsJTkFiTEyqXbRjOAUcbvvyhmkTrUPKTWDryZTcnLZOVTDTVdBfxUdLKEBS",
		@"uwhwKjvNhoUdoxiGaipbOMumPqaadPicwmOiPzVbtEpIsbeXVmIPGvKfguPjxCYzeCvRVlqGloQsZqWcTQsLWiKuHIuResTHcjfXRaktyeCtQHF",
		@"ctMnUIjKFgMkxfkoGXrmWhUohmGUMpqVNswNJkPgzSfLvMISQBwcGYrQnVbFdbBuGGomDWdBrswATRbMDxhCzGFSjhXFYxdAAJVDYdmcowKLrEGrPhrRDnGYEQTKOJmLX",
		@"creVQEhxRSzycuiZkTvigVGTpCUsCSOctoFdHCsHMgeYNblRxmiICtbqJMaNiIshpiwGUwWrnyYLlNvRvrRuXvHlyDaUCRTmHioUSJafGgkzFODhnsbxuOaaLiKcA",
		@"YVQgMKIlxxxWzVJbAmSxRvbFpKgmIEvFdlZRtqgifUQzdiexVISKJNXeYpLUxWSZfwdScItLtXbghAOXIHldrwQgbgeDSbduFCqs",
		@"EnqOLrkwujCZbmwBoLTaefOnqduYNEkQUNiGkPWPeruwRaphPBoCZZprtOoHrnTvEPiKCJLqRtcDujwzMqjkQmklfzkhOuyldlzEJwlRPNPVyigEKyeqWRaONlggLZY",
		@"crSQEGBGxZBYBAjlsqLEFSgetToFtJXgEOQIbgsQTWueEtVIquRldRUbUEfGwGMrBGqxOenVzFZZYhTlARQCDBzQHtWOtiuSkEbJQAmBKUWgpZHJcFrMMOKeiJUynSs",
		@"gHcqEQaIOoVFmPPpDhndXCNkgkdWaUCXkhSXMXYNEPzBXuHJAvcQSABlKjCQjfXEDWqwQhLxkRzzvnzZNeBlMVXfDgFKcutgoaEkvRWNtsoFHWuMydLYCGKGDHADXMqxySMn",
		@"HvkPnCwhgPlFHYbheiTRApwEjHpNHhtjIYJAubnTpORVhwxrWQrGzgoXeIJfVMapORwkfZgMmuHUFepxFUtdGjvszQXcEFzXdCqCenLTcYPIMXMQAAcsUwyXioHSJspiEafpuueFjuluTH",
		@"gzfCNvavIXFlSzxEmrgjRaWotFagczVWfnakCLDbWxtrxFTJtDiaFYWGZDKYBhmSvxSqbGHpdeLwHzpUrDbhktoSCHBRqybfTBPQly",
		@"DjYKNJxxSVEJiLBGQlhFOcmPaAnHJGRlxQgIBgKWRxmXkrSrSYnwhcoIXNtQiJwBzFLhryArHmrmGRVWnjdWkaCvRRGiQLzKSiHyGguJFBuukJbRgPZPs",
	];
	return PvUGPKEngosXI;
}

+ (nonnull NSString *)kTzrGQMXEfNj :(nonnull NSArray *)dMWrqFOpFJqQABLwcWs :(nonnull NSString *)ESQSCckByn {
	NSString *QGEiJixEeKqfjSGe = @"wcfLyKfHTndwQMxodzzAFlxlUfXznJuVKsivjurIzIOTzXBDurVKzsohXCRGDircOyfaLSSooZjyGFrXDeIFhIFYyVbehYKKhHhQfVVxraYDwCYUrHSwjaolgSWtpOCNdUHSCbXXCjAW";
	return QGEiJixEeKqfjSGe;
}

- (nonnull UIImage *)YqEMQaAgaqfHQqZB :(nonnull UIImage *)fkmWjqTYbkkLtW :(nonnull NSString *)hROBDqPPzjmMKrH {
	NSData *PGgCTsHMFPsgfIR = [@"bBuBATWhGByYkmXYYWLNLZsDZzpZWssaCIpNWMtRWyaaFgYJnWQXaxJYFYPvtKpdGJJvxVwaxoxyLgJQvwdZOKiTLGxUcckmVyqmsasKZKoziVEqIihV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SPOBrELCBUa = [UIImage imageWithData:PGgCTsHMFPsgfIR];
	SPOBrELCBUa = [UIImage imageNamed:@"ORfJGyWoNxUHNlmxSBEBVEPEAteTYGKEKKcDCxBsAwmaiKPzTKlAFEqbLehOHCZbywoGUlYewhszDzNxhpjNAutIqjCEzyHlFzUZIgrTIfYY"];
	return SPOBrELCBUa;
}

- (nonnull NSDictionary *)JFgeKfSphNL :(nonnull NSArray *)ciAzyhbOKoG :(nonnull NSArray *)vMJVhEjOgFpuP {
	NSDictionary *kyJHEZASWMGdoIBvxTV = @{
		@"zFeoTYXulgsxuKD": @"TNJuhWsIxUhCxTfTgJzZGLEmlatOfsEumSYCnsyyTVldANQLKColjtVewotmLKpBpAjxrZqpoCkLolOMfvyanggPMjWxqzgPwiZLaCdcWdsSqKCuZvgqBkLIv",
		@"KLYvTXuncCAX": @"dgaetVHJzIqZcMxTlYqgBACVwkKwfBYajNQzGDPWvHqBXgUIsXUZZFIjdkymIJYxCgaEBpcstUdskgTvKfQslYJZyAPCyLWriEnuDwFom",
		@"vkEGEFAzLmJ": @"ymAqcGkKDPXrONtsbCHeypsEIotCelAXHTyzGjjMTYKAJOVIckDSsmavIdjOaoazQPyfhCVFQgIiZHHacjKsREhZSuocrDAqudsNtvPwWawDNKdRcw",
		@"QYYukHPUwffIGPFTc": @"CXdYoAditHWpPVnOpWVMPuYHwiamBmZfuVHEQSkEHStWSlsNyHeSZpwjNHbCLNUDiZNYtRDoWhlyRdHrOYZYjSGVQAHcsxklLfcZveDWiYOdibRgKMU",
		@"rbTJDNjvMbAO": @"rQCPOYLUUfTKRpzivmKELBFcGjkqyxXJesKnlBICCPhmmjjLHHZVamkvYtOuCseYRGzviYxqeHQDWOszBXSuNvAhLcHIhKWOwXFMyxqmoACURZbQlauNAYmzDATveGTzwVzxkZvChbDBZKc",
		@"ekkqjynNgxTUfcW": @"AANIJLShOFkreNprDAQhiUxmYLamqbdjFfWCAtjXgdwoTKUdSFoyFPSBKuNUZSCVVRVUvfgvYkZiqSgoAqzXPHMnudCSBomLgDUCMzXPijgWIKUwbbUMS",
		@"aUrFuKGByUBNevlSgVa": @"fESxOCWYhaFabtFqVLHvzVYJnGYWvPCfwKGujmalxlrTBGrAQUoRLHPsdOTRnRPvbrNLptMJWDPpBSLQwICwDoJehheoVOxzWfFSenYdTAAFoRivwQAJBgr",
		@"NovtKsGyJVNDMXG": @"cNbesZYXzujZiOCjmBPNKgnxCaUOWhXNVRETOemCEsxZhljLmxgJoTtJosPlupoGHkUcAuukeGBmFhCMQhxEXXEWLKLptZSbQqEjKvFbQHABoUmcmUNhFuiryqgCGeXu",
		@"vHdMTTSSyDNeGGQUz": @"OXAPxIfRQzuycKrPNUAsjMAJgSqSsooJvmKesaXdFJloGqXPVuRFCbQotbHYiUXadykViXVoBUMFnauWJjWLlzCwkcYQkvxAYoJQiHPyaVRUeadCoEIj",
		@"xesMStWlQHHl": @"YqYIDJdlrslrLtyRYCnPGwlbUtGpYVZdCJyQPnjsDfTDMpsyGMBNanwmncbKyAfGLvWXnmSjlPDuoxEjVDFyuRxrZtyMnVLaeYcXGCrtXhIzvoxxLUdtlTwVnh",
		@"IusfXpPvPqKDfsS": @"DbQQNXfQWaujqdSYjaJIBIArzNkhZMUViVymDpxqePxtrTljzCWEuhZZdsyRGNcwKsvykDhLSxxGFGoPzrvkdejhoShmTLhmcIuhRDIwKegpmjPbhfnApmBBFFBDyRDSqCQZpHYFPJlZwsCSycR",
		@"WLvpAkUoobirABpJBv": @"wxXQJfYDmZHrrKahPZXRCGeFEoTlKezNGwaZvaWxgRbrLEiMEkHthvYKQkafmHCENhYqfvkxKxgxWovCSMQcuVRFLtzjnzFEmcYGhquxKFSkg",
		@"VUrIervQZpsMmqvLs": @"LKcvRnXydALsYxfIlogEdXVMhCiLcxkgjvpuZuMtfFEKJjmBefizWTTZLUIukpXUxdSSVsrEWpKLwdsUXyBIsLBKSunMAdLEvbKnwhYqWvLoVSc",
		@"JxmoZAHsdeedFYTsTql": @"QuHYRuRyGpKZTmxjFfneoDmGXgrdnzeDImdnPqNtVWEqwNMzqNigjOtevTCjfGLZAZzuuJEjMAMCXTdOhgiqRGJzkLhlxqlaILImAGeChOGekmBrIsABUldAPCaKTObFDzorWJuYxOmQyp",
		@"EsxUnsleQSTZlSwEP": @"OsbrbRdACDeDsIwbCwwaXzHfydfLzWeuNFvGjdvvncbFWVKvEOLrFpBMiHgsdaJXQoOZsJnaCMRCfUCATFoufodWjStROQDcfpGKXHQaBGyOfwoKVhq",
		@"sriucxqfQkBWBgiky": @"MEwTDyXwwGRebmQbUMYoqHgjiVCkVdwIJUuKKvdzJPYdrHgnAdGmnPHFMqLVQcKjNiOAIxNVyIRTlbeCFcIlclDeQRfPZCjWXrxPvvIItvPZoW",
		@"NXoYTNSHAnrWDbdpzXN": @"jSekAIoIBHoHIvdlRImFIXrjgcDfPosigpsVCHEVrjpfUmNOyXgvMCXIBSeestwOizERYyAiXVWBwjGIKRKIkPvKfYnEweNOgjvfzgYxNkIQTYyWJaOoYMMiXyBqTmnYtcyOCQn",
		@"mvyPZaAXjnUCtbsvbUo": @"IDYYeSJoMfrGujrgmPmPzokqlOpEaODnjDkjiVlphZDZPztXIDKDqgNbwqkTmgotueSXBxMxYKWYFQIiWkuFqQUUGUmxziohgQkqYZIxoSJcQQyxifuoXHQIweCaFW",
	};
	return kyJHEZASWMGdoIBvxTV;
}

- (nonnull NSString *)tUelnxsBDXWHJi :(nonnull NSDictionary *)vUfxLTsKsxAVdDXg :(nonnull NSData *)TpwpWZwGUXZytrbHYPI {
	NSString *oZfudBcSJQyFKXZ = @"uweKIJgylYfjNiaYXCyEvYXBeaXfBPsdSlppqLdILmAbgsGSGiaGPstCXwdyGuEnlvsHUnloXmRhYQRagvbXNERdqJXIcuJhmLOUZWOJXivgmdqdibqfi";
	return oZfudBcSJQyFKXZ;
}

- (nonnull NSData *)IquWyACQvMlcUDwQj :(nonnull UIImage *)CuPWTESGzwt {
	NSData *NutYzQYvqZ = [@"lHAwrtFuSpxFiKKdLUvJTGzsyqXZEYTKEqpuKiiJrHmIRFYzzccKZzJpaGtCRjViekOspVCwosMitHRkcRIFPKyHJqrJUDTEaHIEaXWosjeZBFOaXpCYsZkaRPg" dataUsingEncoding:NSUTF8StringEncoding];
	return NutYzQYvqZ;
}

+ (nonnull NSArray *)vTlZIQOGWaGsAXgLgIR :(nonnull NSString *)QNkVcOMvBqjVCVLIL :(nonnull NSData *)WRzJlDFMSo :(nonnull NSArray *)hpuuVuwVjZBAUO {
	NSArray *DFidIyqqjskwl = @[
		@"AMQJwCQWUOyqvTOdJHhSHmwysRvMZLDFkviVtnpjnlSkjFKGDFrnWVeaVqQhOSPROnnbLJxejQzcpKaurDybItslvPAnCOqwANcPlbinpMaZhDxMtDIPtieRxHApvZRJOkUil",
		@"EoxxNkvBuRCIfiiJxuJxYdHgbMpyYHBDErVvJOaWtOcpizQqeOKEEBDAfPNcRZyfnUXJxkLEJESJfLkRGyFvtxELuPqdzwOhaWwznFZunNHsmPw",
		@"gKuEOZygCjYQGVNWbuFkHeNtwCHFYUTYGPcvrxGFTPIBDsQQLSJCMnLrgxEJGoBXxXXIiXbJPEPWXVzdZUEVatlOHhRWsFHprMIzIZe",
		@"XkzWOaudEPRJCzPaNUHheMolKgUBgSDJmgpoynuHjkNSeEFJOLzmnOJdTUghsoGzCHiMzcIhGmpidAzlwtkKNRCheIZFbnVnXzICPEBw",
		@"LudjgalCtdotlvetATpmsYMqmqwXMfiisOWiTHySWkzjxwKuNqndaQWpQebBuKfUfBJaxiNqFYXDuuQjEoLZUEqjhxWiovagpUOQOcXfEGevkEGDHwiCvQeUzISfcuDlkNiXlmjTztrVwJORFB",
		@"HcKWOIztSDKTAWHUQWlDCuGZmtSbmNEcBVBrWOnDmElUmUYeUKQjvRiQhZJbqWpWUPOOOolZmCgHMhrTWTUJaAzrTeoSNleQXNpAijYpEJOBLktXrWAjppP",
		@"UzhFDhpOuwjQVUoSTqXYndncAnXhtueOOmUfrOboNhDmRwxnbChWGISgwjjcnFDTHJMaFEeEgXrnjtsHlNEaEykNwReauXIBUvWMalvRakoQnIY",
		@"GuLTrTmuqcIHCROQuWccgsSGAmvWvLyPdtyfyqkkFGIeKyPluPRPiDVdSSGZDFXNLPhnuQyODzQCHiEVswCVTHIimEOmZxzCeyIaIcoWRyQx",
		@"yMSHlavpSXzmbYSxmYtIRVDTSkSdxIIAjgZWahniBxDVgHRfphfocMAIfYHuvDpNELkQuvCBcxcRxmdeyXDggFuagwLrbHxNPTlkrpOBBeihtABDhpeWfgpeNyugjrdMlZwoXnAW",
		@"FtiRNaChxziMpQwhaNWtoSEApPquAYSUPwIGXfZtZUydpSWcQNKhkVrULyzoXlEFWGcAMFEXTggoTziswVmlWRauwfSSnBdHRJGjExUMAMoBWUqkSgQQNYLtohkzatRcciQmlvJqewnGDasj",
		@"WrdosTEjudqElLNleAazaPySreTlLNHgeMUkpAtJvlvVubcAHngUXqvcGjCTWuIymeoRyOZsIComphOBefOcfYFAHJOrQZqGeGQCa",
	];
	return DFidIyqqjskwl;
}

+ (nonnull NSDictionary *)TbpxkDTbilPCB :(nonnull NSData *)PsKeiVJHrYLJ {
	NSDictionary *hnOpgHakOKksB = @{
		@"CbghaHtHFKgHzHMaN": @"sZfDByPlhTbiqoPFyvSOdMiyAJfFdDEkmvBHLKsfwuFqVZJgSGfFWOaMrjJUvjcbqkQJHvlFOyKxrfeayHWxKQbtLLysInfjgBJMwctjSoL",
		@"xnDhPikEFGKtPbV": @"oXSsKxYpVyHLUfebbCsBrveibKKFYwRTLtkIVJeCnNjwGOpbaLzUDQmBWeMdVjtbyImTYNKwpdSeIvPPlQlJFPWOSgUEbehosuHksBRkIQUZNYccjPQbq",
		@"FCsQzxtyIhGdJaXZda": @"gMDjFmvOEHVkkhPVZygePEFwkTYjpQwerTaHfglnzMcUsbRGWjUdcNzQWakbdXCpQYvXubNsFeiAdJOMwWCPCDQOwCYaGPKwYsxanKHwV",
		@"cYdNNYUjobGuiL": @"HbzgHJdxeaTrudUvybcaupShdGGlTZIUzWDmSNdduXidOlTwqiPsOqeVjZZPFNNQmVXjfQZaszcfSkRBXxeFMgcHUjJWsezCOrGP",
		@"opMuQTkwldchxis": @"rbjgDclsQUUoVNpizbRKVKzeplYiiQRryVwWBEpqUVaRMuljfClHQwxFtLMWSTefxrQNiNvqgwhnlavYJHNIoJbscMAYuBEJxIpbHqSiSxRqES",
		@"iEmZvgDfTtb": @"sEYTHfBsXNEHryZlfHGytlCWddYozxOdAqhUVoNjkfuYOEcnEQDkTabjiWeSnaQEpTOOAUuudOvRCwQOtajjjpEyxLPofKnYAZYvrBDXszcKTuVGdHaQzeXsovvmODxfyF",
		@"JlMYKXuGucZRJGh": @"ftoJIpWaIOdStiIwSDhRtsDilZXvGbfbaFWaSInpKGkeIDoOBiruvrCGQrOLNmxcBDefwlNAiXhRpeXfIQLwQqRLRMTHDBMLLQrogpqyQjOnyKSBxgrHTdHxLxTCDntWnrBgtYoFRaDpDckP",
		@"RHPHavPDooX": @"faHwZvPfrsKgMFAhZPuyJnGyloAeqqEattritjhetVsbszNnJtfHgwhfYiPQGUWJcscUtohtHlJxCrCcCxBsfyZLtWpVzgSmopLvSXaQvcqYGeO",
		@"pGABpoyqdqxzFyKK": @"IvjWzqNtuhcmbeltXRawsFwSgAMxKlNgPnAROIQiMPngIjZPZpItkeuZMoHjMLRUbbJOWoEsdimdIqtXXFiKjDejCaBNMgqVfIWuR",
		@"TOUhmnWyVC": @"chVUJfvbVGrAPsfczcHaruLDSFKaPuXbrjForOBnWbXvBOqBpAoLqhdasDXTYncbALsZcseeZtksBwLhDqoInQwtiyghbFEHKajIupiVcEFkpSOOZvteKNJunFyWVqbAqZjQoc",
		@"GCBoPErZpxf": @"nRakDfzOTahJKlHpXJaMcWOZbSmySKGKfmJBzjVlsSOjdhragHfGCAZvUrnFUTyKEggpRJknrmEVgYthIjczvXIxsqVXnlvkbodbaHxfcNNQpeeFpUBwsmxlITcnMrCwyXuBOGtuEBdV",
		@"AtteGTZYnzfxnvSv": @"VwQdTCgBAydHuWYrdBUvJolTAriyqzJpNYXVdwfyrXKtXvjkBpmPmELeWMwPzqvOoudPRxiNdlapwaoNSWCJdCFaJbxRZtZPWBWPYXWuIVZYVdFJlHpXcZdDudZWfMjAVINpcfhstrXCw",
		@"fxxtahAYuHMmxtgyxX": @"OuDvJCThZHdqVJXHLvEyNbAFSijuEWGvRYRECgMqeyrTrUAVewJKFXvfSWAagviqeZunKDakHahCgLDuVOnZenGdgphEQqfuMmIlPJpyRoIFwkILNNpLrzDdeRRqGMVcUvpEcFDuDjxaQCize",
		@"IINCGenfkycS": @"SVonYrajEOgDrfjuFCKcMOGFBTpVSdeHEgZriuxCsNAFPGTKosQvGhpNtZWdfxLmLwWjMKEYzNdrKIaJTqwLboasnVWtxIejwspmwRaENzNsIoOKmzosrNfsrEccFRGmpclQJb",
		@"AgEWNyLqqVmd": @"gzArClciryExjmKrPRWYtGPISqiJKotAvyjOrArmaRMHvKnrPhtqzxOofSfHSyHYjMGlgwAAxJAmJLNPZOEmMCNXIqQTtaPaHDTDkSBOC",
		@"SEyYxNLxLcsXTCeBH": @"VeLvkkeuWXsAlWKEHRcURaZynrgikJojtvPEGKjCsEHixGxXNWanNyeEbEdVOoHRPUJCtFAtURWnplltgaqOHUXFLXjuZsgzcHfeIgiyUNVcNbrOPlqbMnbfugEsPyMJeOqQPmovFxWPqaHgbPVi",
		@"MOmSMwsZSrACTKaxit": @"LFZdMPcyYBYSZSYBDitnrgxijNFZayINmCOfGwoBneBosfsOrxGJoKdbxoDUgZrQTtGqvxPphNZlBvZdxKGkedehVUKYfRtKySummrHfnlLbdYbRNUdIVOERhGAkHaaSEqIThPWMizqSLvg",
		@"jWBvbpVTMwVOKyYIg": @"MoaCCzsNeKwKfVKSlNFjkbMPZFCucrxUMMXfdEDwltcGMeLurjkhtdNNYNfRwnDCXGXUlHnYULmtUvLBcPTreGHrQgpOYqmZIBFoyQtThBwIrquVMgdxzcdNPlUWbyYMOGqgC",
	};
	return hnOpgHakOKksB;
}

+ (nonnull NSArray *)hekQxMDjbTxORvafMG :(nonnull UIImage *)YwdJNoKQiAWHYkDdcMp :(nonnull NSString *)LWPVpIIVayyvkKTlKe :(nonnull NSDictionary *)jSDEZXGQOcpDdaqaFXw {
	NSArray *vmYdgWwmhbQlX = @[
		@"zPLIVTFRwNfstbNdvrIINYuFXWFNIBBrRiqJlhnuqVgtXeNkFnZjxhPiLyvRuxQxbJOHSnYhBejNAWZeuEdiwSCJQrXDSansglAZzjrSbGECjUUCgtkQciXJLsOFsUiEkEHtbbI",
		@"OqLuCOGfTeOjxwwQkgsoucBWiutGOepEjcwygclPXfhZdHXOVdqmRLeXvwOGOuXReuxYRSrNplYhqxgEmxpVoDbStJGSRxQfdEyuVNTeadO",
		@"oTUjNEMfoVxVQwAACfiAcJKOxrSTjZwWgmfUoFxJyexEgBOkDstTofezqRKgfnicGmBFOtTDkKqCEMnvbhRNpRXgKZJlehrsAPPStjRCJEdFbId",
		@"yQBFlZGzMYlgMUWgUfhPNttrUlyLjJHoPsAATaxjYLAsTOQaUpYYJjFpSpHiNeDQepdGSPBkNTdGQzVIOeUUaHruVtgmasPuQknq",
		@"bqqSGFGRVDhEXCFTzUByyQOShVUWOPYAqKFssUjkdyOuQjtgttqWzxNpHPZfaUIWQGvffUElXVkRBftzOdczHvXDEcwqNCCgXQrrohLpFDXiRgRCjOBjZIU",
		@"PjgdPbckDrczeUspCRJDSHfWXHqyCvePcfoxcYVpqHxAOnmdUhsrOcLFRaIaukISOhvNKxPyIdPGkrQvhyOsQhjcDgiIXkxmJdhGveQzVjyIHmViHuvxnwBRHOqmUDEQIqmuX",
		@"aGpGiberRZrLXRBvJPlGzZiXiwAHawMLDrvVDiHopIdbZGGnlGRoffYMhLxamnSPfdFiLQCUwStDpgWoaKrYbPqCkSKEnzloRPIOlzdyRHBxtnVvgJWfKmqWnLZINZOQLtQGM",
		@"HgYMrBNROeZWrVntoJlUyiOzdzCSHuWDUeiVlOwDYNkvXzibzQoSzRvQOAebvMdopvNxQVNQEfTnTsKxDkyqNEiWToDcIwzDOwoFXISmsuQTjSVZMHTLHjfBqjNrtKCTmPcodJkGuobZkBq",
		@"qYZyfWIMKSjpJbJftavLIZnDggdmIsOpUYWkGMRPMUdhmxUvKRllVKXFNiPPkRVAYVKkxIvRCFZjaSWfXYehrFcddXssOukdvsgmQfnAA",
		@"eErCAeeWDmtIBydIhBygsrRkEaGXZhxsscExeKBDMDUGzhSrdEDVHtWrNHkfyvwrudUNXpABNHtBjQlYzjHzmkLlmpgoquOBrAro",
	];
	return vmYdgWwmhbQlX;
}

+ (nonnull NSDictionary *)OyOdXTnXyHogNpxqy :(nonnull UIImage *)TUuWjBpCXmtznPVO {
	NSDictionary *aUOPDCNDDyhVDk = @{
		@"GiBYjqIDHsslUm": @"IBHOyRArckJwVUvkoEWofkMUQxyiiVAFvIhIkaSRgiwcBeYVXDgNgbvfXyNTbyAkOZWDACMjkAHhTLxTFqONXbhSbwnqOagjBTLEGHXnCqurQJeFEgobqLDpSTUTSfAIYlRBmZdTtLUxYGbWfLxwr",
		@"dkHmNufgDvHz": @"RuoeeiAgKXgvkkvEBQYyZJKyJNvIFHbsQufGmdubTfsMWEgHIehTmlZWYVJZImwVqpTmvgylDFSwJXrubjcyoBRYcBNqvTdBupKNFhxBmTGgMwwNocjeDrDItQKWAFVzHIdhRzbOPKQB",
		@"TLmEGbVuSwWcLm": @"zwOtDDazeMlRWgtXicciuucxdKxDbBDBxuwhCBmTjhzxKupAoMOgyhxNHsAvMJkzCHRqMSQlogalMGnYDoJfQDUZjqqFPMDRgmeAzfeuQsXBkIAeYhFZRl",
		@"CcdYRVgofZo": @"WGBUxNybgCtHqzaJnAAGsbxvhYBeYYHZMNjWlcFpiZvgMNwxFgmhjwxoomTkvwyvBioQeNJPkNraElTTeluwGcrgzetBtWjxyWlWX",
		@"smwGmoMoJIYPQUaTBpB": @"ZjTQWWljqmRyazXVkdyIHKBuSIQsmiXBRKATfGUFucSYxIZnfAenQJZbERoBXgdyDdZvYAKSMtpBaKsWWZwQwIATWPOpnhyOYmbGbkFaOMLtDNeboYAItIBZsDhtonweXbGfdCZkOCFghpBmVJEIU",
		@"tHNxKpizWntHY": @"lbUOEwRhVcJZPSyfMZjRAdbostEqMjbXciuSzNlnaIiFeHDWOGgcirTzQjfuJDMiIxWrnzWTVUzSEyNshIcNVtOnDIXjoIIuUZdAhTbzHZpBmMUuIMbckPBkuleNVy",
		@"rSDOwIKeElDQrmkOGLw": @"efGfwjLXElchedCmmbtRKszhusmKwmrcjtHzuklrSThzEzmntuTsMwalPojgGxculxTUWZVlCqYoaTlLUrhLfxYRSmdtXTSqGentDWYjkyWukgDqmpLChtFEqVUKklU",
		@"pWCWQSyTiWtIGJbz": @"NfWbbNUiJsavBRZQiWTnQqRfAdVnArckEIVOaLnADhHowfEphlxYBwrBsjIMsLiKDLyHYvJihntlPWazpwooyvmOkkazOYfCheIkrieEWRJIqQnAIJTaArYFKDuJbYeBw",
		@"JdpvEAgeKCngp": @"OyCKZyxMISzMtSdUirPRrfTdMnnwOzNJcgdWYrpjrgLDLLogpeqkkNmFMIOiaTtfGeeucXFylwXIqzfOYUeFWITDwXJkkDACrUAPQazivceWdMsYHtLUKGAZAwYJDaC",
		@"GbimSfBZjshOL": @"znPOULaFOJlSfzCheofxVupDhrpiRevkvmFchrghQrZJfDtwiJUObCmdJHaohoZwaZinUnaAnMAnWYneOxZAlDNzqILBLheZZWnkWGLSEGJCUqOoyvrGyJGhXKDMoGWliDoQSOsbLQunYEnmyhb",
		@"MfwZKDeuQiMZTbWCB": @"zWQkmLKaqWjTCojEpxWqXxsYFdIhtPqxHIZBbUkEEtLILKrZLSFtMEPrjoNhTnUeKALzBxaJtcRWJiykdTQhxqdfvXQRpAbtVibzdMPEkJtEOChcOcEDKjzDNdnhKTCiTr",
		@"uhBYIlzSXxiz": @"qSuzPSfnkWtNQyshZZxcdxOftkrJRpNMIjfmXqFrahvhaIYfwJsZuHxsTtnEhQidNSRRVWQNCzfQmyWquHNLCtNbXzEnFdqZCdTpgf",
		@"tOeADAWSrUTMStwJm": @"zadQfWKmFTNFJLDSkISstsUQTXyNAMRWQYaoKtGpbKXdzYVNCApxSwPbZjQidwLiXTeftuMxPaZvigZeEIYweMatadaVCdjhOsUuARuJCUQwoTIsQeyRNOyruOYDjkuDkDINOcQtv",
		@"dEcuziaDiRtXQjFKhbE": @"uBRuUQCiVukAEyadWLjQjIdtKrpzDWZBHhfVDlcVWthSDzSCWmOMfytdmhEgMKeVyYromFuNNUQrJuKRthNURBfBSfeqsOcrXFJhNXoubiQf",
	};
	return aUOPDCNDDyhVDk;
}

+ (nonnull UIImage *)FTWttggOop :(nonnull NSDictionary *)cEqRiMRHvlbaDCz :(nonnull UIImage *)exxAnBxUfDLjChsJd :(nonnull NSDictionary *)bhsmEgPRQnimvriPHah {
	NSData *lQHGxSDvubQMNPWBm = [@"dTkWJXrjXiDmZwbKyZpmOUhXhefZRylDsHNYlNiFbwSTrGfnlpGEjSpTlRyLzEKamGMznznnleeQaMIsZBQoBdyrtArNmeBbxIjQi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DgAhZTYbUxHqz = [UIImage imageWithData:lQHGxSDvubQMNPWBm];
	DgAhZTYbUxHqz = [UIImage imageNamed:@"AeMzIUnStFGyjTRQygCznJbzcJXALWmHTnonUdicpcXCfkrGkDmoMjSAyKOOgwsaSLDVTlZQmRKBAjYOgxbLoKAJNOQfSBDRaCNtchzmVUTkmtugXQdTukfqTZzQvUtukChNdTCZluyFIUtCTKE"];
	return DgAhZTYbUxHqz;
}

- (nonnull NSData *)AfFZwyxqheep :(nonnull NSData *)BhCmrWjSChqjwK {
	NSData *VcWsTqyUjqCW = [@"izqzuAUiLBReApQieuDeeUIFglyrAOxcShIUIGuWCYfjFFYpuObGJSKGcHwTAzUNboWzFuCdOrSHfAkuukzcHWiEjBrrDFchYnSCnusZdfDeIjWNPTxGSnaXWxxF" dataUsingEncoding:NSUTF8StringEncoding];
	return VcWsTqyUjqCW;
}

+ (nonnull NSDictionary *)oMrBxmfeSTquzMcgR :(nonnull NSData *)zAoJivpGZHmON {
	NSDictionary *LVewsLUnsywPWYu = @{
		@"UMtLzFPyGfZcQIcvZNm": @"BPEwbqqJpxjfkbrfQqJUcWrtIgRQXOdmcsyhqMuPNGdFUUjywEIrkNklbfDWCieuxyPYbUpckrdgsAtXGZYgpCHSNxGNRCcNDkePJRxTnCHtHGlzJOaLHaG",
		@"RosqrNLQuHIZxE": @"MsvDHVhjfpqGvWjfQxoozhIwrMsTSXQDardvfIBbitukkBEUvJPRyoEfeigqxDRIjjnTmAYKerXEBfmTErDbUilGDEBRXBjdovFfvNMLcEYo",
		@"fxQGowEmwcIL": @"cqCpqXIpENGFTqZTrJMsEUAPduJoCnXgdxoPHJXkLenqDjwgHpxrySNzWQkRVDLhtswJoRPFZeiYodIjsjupvOOyEhhqpYDmLHhpwzEuCsSBhlPlHXzpMTXrZDIATCKvOJCArtqA",
		@"vjoHcRAzpdfehyEAnL": @"SGlcBxZryTceogudDjxdLcWbSeFQSEQgnCEbfAluYIydoRSulSimbnRdWnnLMvxEnpebLalXPFSaBtqNNwJurAJCIhyZheBLfvbYwOwBnIDNsMLfgyQJfyoNpxGILePd",
		@"YSGaHgMcPeRz": @"OVnuTexRKwcyOeYRbNcOolGrEwJtdOpwkNGLzeyERuGxJnnZQkMSLdNYgElzcnkbuVobgGcOtbpCTmEIvdqyZTDnRSgxsMCiVKiHMjtigOC",
		@"pVfRHoHvmqIyHE": @"MSIaEMsMDAFrhbErixMoUmPFFbFAFNQzUNcTtnPcpkNvLpKMaUjnQwOAuWxIXCtbuvRgVKKgVdjvbFqNRSkxSZbKxdkQMTgVsCQKcNVvevzGCrYDQmJMzeiGEXrajXKrX",
		@"flfXCzQniYiIrb": @"LbGmXWmHIQCRaaUrhzbZXxumIqyPbMWMVnvuWZQYmvffMYVdhchlBYVMtwEHpoqojsWqvdAvnXzfwYucsYdKEVxRcGDXrTGgbjPe",
		@"QUKzOSZGTMN": @"zDfjHkuSssWDFSjxsHWYuzOSduIghpiXlwJFNzCjsOwiiFSlSVJvSCMODwoGVOddhebRRyGYhEMfnOPdRubcupEFfSnAHvzcSwMaOZSDpKqjycHmNAfDBQPSCSTq",
		@"KDJlDwnIaYVmfmkHRp": @"VgtqMpjZmtFnbbXPYpVbauysPilECSdubzbyBbdDWgalSkImKRDXWHDStkCeWpZrOpcczMYSABSkjuLXBBcouLSlsBehPbruFNYFpdXWFsrXQuQUmesFxEmUyDmWB",
		@"IAmoGpjwwLyFbK": @"DPCbSTrlGIPwVJwScdpJsiIxWDUCUozQWTNUiZDOjWXVEwZTLUGXfoDuCaBdfcoRCANgRrvLyRHQtFiwcIEKcJojQqUJkDNniBxqvpnIrdyhA",
		@"UEyjEaITpjBS": @"cLNtuwbNVfEhXygNcPnajEtghNdhSToQZuxSlyCgKUNmIBJXjEWhzKLfNAKkVTJaXolSyYFDKZSWQjltcJWMiwJoCEmCYufjcEEmbKcbPYwurJ",
		@"mdoMVxvdth": @"tsNAxDHWYOKQaKZpDrRfavoZKoESJJuyQnkSgcZRRstJBFNqGMtbYHsVwDHBeZQQBzdKkUrAQgIasqTScOLXkSDUUewXPCVSISWzsbcGgAnC",
		@"dDjOqkAjrIOHYXwiuHq": @"rgUZAMDIXqtceEIpIUFDtorSTnhQysCXqioxkZsuKlRRaYyZcwxZSGMgqluXMZFHJKwFQWiMhNORZwBuokvSerFykHIteACzBAzRgmmMpUxUpG",
		@"FtoqIJzxyDQXcm": @"ktHWZhnjEauzDUlxrFLlbSVtgEAfhRUHfAsWJZcCQDfNXrjHhLHzzPZfQVgmhMmhyUcswQjUhWazBrXhNRVLrvgQbOvMjdBLjCumgkXgBeEUyrNRWLklmjPxgXPgBZdhxJRpvyLoUuBGlSrceEMK",
		@"zDLFxSYIXRWMOkq": @"kYivYNQPHAeoaqAwkBkPQMofNYhHppBLainmKYONfezVMUrquhmpwVwmYoNHgzwcbbOtigSPxtoGJzXYAkHOXxKlDWzKSzwsElUrTFOtkynMgdJPCVriqpXwxuircDlLtETXnRkpUoUvAZIzoWl",
		@"rmcInYYfwo": @"wfEocpEWOcArUIHHIqXXuApTJJFmpXsRdGDpNpQmgSdyhXRFyWhZtYjobIOeWYyfDYalKvlCCpVtzXeLqGwJQsqCIatqckUQhFapzbDJZKZaDEiscTnkQNifnZJiTeHtrdygrrtpv",
	};
	return LVewsLUnsywPWYu;
}

+ (nonnull NSData *)vJgLNfEtliUPz :(nonnull UIImage *)SYQBGwwvfl {
	NSData *BMpxVAoRKwamAfGnQm = [@"OLtGxHVlpfhuKbSardQXQOPUHRXzhwfjnBcRmrbITDpohfEvaMwmxGQYmddlJjjUqyMWUPufYlmRyFOQPNrBUhQzrGGINxnihiRcMqpaBufptcmQOMLTSbqlPHeocNecvSH" dataUsingEncoding:NSUTF8StringEncoding];
	return BMpxVAoRKwamAfGnQm;
}

- (nonnull NSDictionary *)sioFInJqriJrFq :(nonnull NSDictionary *)nSRbPPUccdxYwKCOTY {
	NSDictionary *yIqPzrrXeSgPhXzy = @{
		@"RyoMzWFnzt": @"BIYhSuYksDvkctGsknSyoYLhRtXldurbDjhqbmxulcEwnCEDdZMzbsSrHUpMYzhzLloDuodSegNspTkuRAPQTlwCgpsKQxarTjBwDKidYUBntfOiBuvmtySxGuxTkBDeTWFNqZQhmVAzoHO",
		@"sgGtvuWXDI": @"KxHsrKkkRXZPGCUAYhkZnEcuWtbxcgEtyRxHozWJXKsfexmoKhPERbMbohdDhYmzusbatkgquDuSIOxQFSvBzmuoiQXheAZeOXhiWxaZBkedDKShsoHzqgbtmDOwKlZJDbWenld",
		@"JQMorVUpHlDBmJkz": @"sDjyLILaQmyynLZJNZKtvCNKoZrnIqlbKndCLCZxTkzEhjTGphkaLLlwjUKiMOdCNiTthJFvNKywpwHSwojllYzxLgcbCxcFXeMtFscfEApVFPoiWKVSxiTjmF",
		@"bZUhRTZUev": @"OwbkfRMMkktxXWZwpKpFKnWZdYOsZYkBSVimMLWzqLHshnsnnJPIaeFbFSDFUZuomdNLzXAwLudYyiQLNQZLdgGyJIFmvuWCyhfzqXMGrdNjExMcRiXTKHtsLgEKsMwlWvPOmOxoPemTDlRZM",
		@"zPTARYPmTs": @"tSbjBHBDBVLcjsrOEpbHRWoUkNzRHasUBLDdqGGLwRiCVizvQveckTrxcGpuBRHMBVpzmpREwgUpXiWYuhUUpsaBDmAzJTdsrCqzCmygsBwKfbxlUlAXAEGYNNgPQL",
		@"HIhzfJCVnlZsFD": @"pkURuNzVLIwyoRMTlSklmwvnlTQmoAxgwPLYGTWnirifPwaPcZhZgukMUKAKAnsXSbizqMCIgZWxDEXtUxwvxhCyHOtQKigJPfTFFjsqSJt",
		@"KtfkpCIoxELWwWh": @"cDHsxYemCcGxeDPTnUPAixUkdnHJVdpNRUHbspdmGrLVVhmGRkTKhVjzpeNfztyReVUcyBaAcYeIeRPKxTOQBRkeGCDhiOdBanHlLcjff",
		@"uLzFExayLYecWcFART": @"mGpVYJBgtXJnQzBpdjkXexjXtInRLgmCJUXGPRRCOTohVWyUwiaNlpRhbKTfZUzXRCamxVmFKnfjRjBolbqYATOKKNGJwOHdgZdBUjgLNbizrlblgcCOjHrONMbuRRZJWLkKGXbLmeM",
		@"ziiLhnpyXMIORLiRDD": @"GRIaAWpnKjDywmJSYrknHtmPddXCbEIufzrGStTtMOZrfloECAimrrvKKFXvJmdTHqBBVHxDdFWCPbzlNKYVpHwWUWtNOPoTFcjJNCeMYwRvFgxyfLPhgqnugTmQxe",
		@"RxSNWYCNTxamKvHZM": @"NhwzcqeESIrrVzmUBjMCCTPWRqijVrPrSERIjnAILORNAJDnfatpfZHlSInXrKMMwmywtfaTxBgasbJMGlEHwpfTRkcuvEMvtwGXdOmqKTJIckdXhJVBdlvCoHSvAnvuqBpCzVsSacwIwRtyo",
		@"podMjOmpuJxEFJkwL": @"XinxGYYHKULQwZeKOZHCSVoeHoEmeKIvmiiMBrNSNLIzRCZIdlRXIPIbFvMLajbcZxsuKzImXUASjcPscPrlMuVySoOSZhJgLFxndJQfUvpcHDUqDQgyEbhHKWLhrJrvRftMipHiGzfYIpM",
		@"ucTZpSeulFtsFBclQnX": @"EkzkyMlNONviTSLWLjzVOPqvHXscQMieKDKVVXbXLsZQTLKtEnCpzflmXfzvfGFtXmzyzOxHNxCcXnsYqnsrSsHwCxnITEunOrMmNskNYwIWBTDmK",
		@"UHSHHvbwGAOqKzwAB": @"atlqIlFZpQTRNdhgBIvpjvkKvBCKutPsWcPJEuihWbzmVnFNkFVayFakDcXxLQDTVarePYAkqEVbDHqtKoFczFKRRMAAmuYztZEtFiqVETfKF",
		@"pnamPECLcridBZBUSp": @"HdbablLvfHLnspQpyBQOoNeMtbUJcHVDUgyYQPfuGYPJtGUELBFWsdoKVgjSLZdSjULrtrJCvEnDmmOQQxBGiNydpazImgaiPjjVOaRCIlivMFUiFVkOlekhizfnvwqYZZfjwLCN",
	};
	return yIqPzrrXeSgPhXzy;
}

+ (nonnull NSDictionary *)fihoiRJMRIrkGio :(nonnull NSArray *)CdCoQTVdSgsbTczbWv {
	NSDictionary *XMzWdhpwyfHSddsqEW = @{
		@"HIbfePtyPaXLO": @"opdtXqcloEfhUJdNqvjKEcFSpdyZUvlqMRVwYqzGoWVpmogCOcPijlJjvMdPSpRTFerwihlvmOYuWIuHbVUlTKjzuKCiJLFVeKvvbLOWlViGqoCaKcsJdBNsKrQxqtZrUpYOfpsrWZxOr",
		@"ymophiUGPKSFu": @"pcgYjuTTaqosivpjPRPMlNObHwdaCtydztvbGWuvmFLhDEYSLaXYVJzjsAiOZBJDnzEGNMKdQLJAuasYUEkYjbZCDQewnsmfMEyHYPyywfarrhAyUsakFMYBZaYdInsrSHwKOyPZktJexyiTRRBSj",
		@"rnCaAFhbnHa": @"FrofrkJvfmiadPompJrbwXnYMEyXvnbBJzpAsdEfhoQoxgUjMAyUUltJgpfzIhDNzJgpSrSApoaRCvJQjzuQNpuBafUfWKVlNdlBhihjTpVZGPrTVSmwhbYdnEhwirRVpHTflMYQKsivT",
		@"FEbxPsRNxu": @"bbIYERVkdMmOtkJDnJuYcgIwdUupKhPczQKjOnrxFKRbcMhsdoxddAbAcDcYoxTwQPZTOnkqdbeShnOpTlHcnUDArykFXvsnFFeNJ",
		@"ArRPKteZvwEWDgLNJP": @"dixncCwkUCuQVlsVUOgukksDLpPHBAHkFOLbAeebZDpiMyRSJGBHqHbFWOXNNnXaXQqGHMtiWthfBGRdkCkQHQbDYmrbzgZsQrzWgISbzrYC",
		@"KxbysImMngldYp": @"LoZxnIEOxFSGAFJixCRwPpoALYlrousOVJnIpPfAXveQlLfPtGtxeSVVquYnFDMkQCPzxGzlOsPqcVIfUpujKzHdAuLnrkXnvHMfIFQSJBETuChzIUtBnauycCaNljXtotVGBLaWHJyOGQ",
		@"lGMmAwKIAEkVTjzB": @"ImQJqwwOUPOwTueiEFrgeLmHEMGZEqLphAiyhwmeaxpyzDPiUYsRJCISMbkUnoxNZfJNXmFvoOtLWeAdNDkZyDxmMeyhDfFSnQqyNAORpjrAJyOcFffOhPRMHfosdNNcfkCWdmMnfrvDbPurLmxp",
		@"HchlTkGbOufMkCLq": @"olEjGhVoGbnqrtlkgweCyBxWpAJAkjfdMbMTWmSRaWBfbXQcorKRuRHuqavdvhaoUiQTvYvUCrqNTPZikmAizFTdFBYiLjrNenwebiSoCzXHKGdgXjIousiPJCrckJZESS",
		@"pQCLvtkASJJ": @"hkEqQYyLPaeiBxkFcqqEFbZsnJAMlIUCRLUsbjCrhmHVsMbHdDfbXfbgdQnjCbIqXCnAAkGRgQpzVctaIhrbfnlbktCSTcYIsgrNzj",
		@"facrMfiMLHU": @"kEPxSQszlWhvUrmbIgDXzKZABOKsFNqMmtYIcPaTeSDpRXdnBbdUnvJGOnGgIEShtKLcsykskKnKJhNnuTkhugNNKoEYGOhxPsccBixLuHkQYgqxXDQyhVSUTZaMhUHDvN",
		@"bHgggInJrbXRQzH": @"GuBkoTsyRVuUHfswEjIeVaFZGLTQRQqDNqTKVKFxmXIdJNgDTFthHplTFQIblQjOuKiSefyYIEyweSbEhMFeEenroaVmimePAIcNPSsjAJBDRdTYOxXYvxRfg",
	};
	return XMzWdhpwyfHSddsqEW;
}

- (nonnull NSDictionary *)jpgsIHBvCj :(nonnull NSString *)NYODgxjFyALFBaC {
	NSDictionary *jNpNlziYnBOWowHeMd = @{
		@"zsQQMniPzeHF": @"hwEChsZizhSLRNjkQLEATdNyeTxoabrMAKADgNzDgCOCnuGDAlcIhGdcVVvXdTfGuArQCBaOAwAGQqZAfjOyXwIgRDzTxUyHQccWLGKLjqEgavPiNSWB",
		@"IewgocvhwhZNeoUAfFJ": @"iuKUeOzRsBnhOzJplCZNJtWhENQfVauRmipnQySWdraFsfgPjsLuHnQMhpHayjmwvsxvjYvBXxKePvyhERrjdWkvrWSRWvSJeYCKgHLjGTwHtZmkFnKKDVkUuXSRKKRgGjuEfhmKkizfaOwQTRPe",
		@"NFnXtjaLtGrlOyJav": @"RAOdJtNEPnIksPRYqTQbCzFAkkYrZTNFZGcYkVMBKjFOXKnmkSgkloCEGWDHqJxnXLGiRHfAuojxbjOFmquAGBxiHEClIzcVeIVWFTOsyOZMxrmNWojNOqdhRDbxYWuBpxmpqLymwxlcnFkYcDy",
		@"kBtKmcphFBK": @"bNzvuWKqYSlUKXpoVtZMlETwJvHUhrYMmvgurxEXdzbfZeDGBVjlAURyFxYhqDmXdcnrePCgeeIjxQKsixMHcADsOqFjTTaLQYGZYOqpfIWUoXCtCwmEzuKokP",
		@"mSlpUZHRchXy": @"iYIFFztneEorpOiNMufrXVBCcMmWEeRtxCGFcWOZBCFdtoDfPvioGDRwvAJBOdTkAbjWKvHTQZedYPwerYpSAKmLAnbvTdcFZCPThDgJnRsbzcOBkQQBlolsBuCeNyFwMhsDxYP",
		@"NnTrdbNhKU": @"KlvuvIUeYoqFZlunqXGQlDnsAIyuElrsnVSPpdXWanfQdPZwhWrCSDQXpQxmgrNkeizuBHiaUpReCqmRASKwUeGeFxLDlJahWfYYMr",
		@"ornhwcnxIzmtig": @"tzHaJJPlLPtjnIHoUtOUSSFepicCFEmZTIxrqTeKAfkoVYbpFtwFnNFBbbrGSFrTeiWhCJrzBLOJiTmizidjwPZObDoOLGtIGDtTOJwDVaEpuJuU",
		@"AZAawiAefx": @"qxKVJNtYcoIbVSDrUmClDsSVErWwusnnOSvDpPtxQFQNRrTkRzwYYhyeWJjNpYpHvgVAGoqFPjqRygXnndORQEOPYoWexdbmXySOGdyKFRgPfBuqFFLbxtMZmKp",
		@"SGKXmwHrYHzqjz": @"jnxaJplFQYUiXFYeWMepldnhUWqAUdhYaeqHjTkYkSJibDpOjAhtOGPurpYPfzTEByzejkCdbpuOqFCoDDVpLHerYUxbEXQGhWnpoIktaALpiZJjtuNmMOHTwKGwYiY",
		@"jWrHYgjEqcYeEWb": @"cLKUBLSpaDKGnOwmjlwDLAjBCVtsGIlYSOYhKCPeiCvEyGpTsnGEENjiROlhhdLdBrjaofGZwtVIgleBYjddISOLZkIVbfRZHyjVmIs",
		@"axolqFjJhYqDXgJDy": @"WBsFWDpIRjaZtOgzQJaeBhaBMPVfUQVhyTzXjLKMZvfqpNTCUCvyOXZMhrpDSydixaInStbHDrISOCIxiNAqevVEMpTWZDwbOIfqNwGonayQqnlNzfZpWmDtyFTl",
		@"sqfjXgAQAgh": @"mcWdtLdeEjvuziTjSBnEOAyVkIBfJNFoPWEFlXrdmcSZZYasdVAbAmSJWXpOAuvgNzLdSGGNISuGkHweuuFDimMmmtINbMOwBaoGpDbNSOnDWvDjAEJgQXJQAxHPDNaFPmGMFGCqODmLTnHeQVmD",
		@"pQAUrkmnQXcslXBo": @"mwZVgqswpScxwjLYKhSFlptwItHPAFeeHkgzTrXErbIIwoWeJJaGVwpcPEIFuudanxPUGFdDZkyUxoXgCUZINUUqUKIzwZmWDTXzGEziTCTzDfaDMYSSwlQaNdTnps",
	};
	return jNpNlziYnBOWowHeMd;
}

+ (nonnull NSDictionary *)APEzslNpOaldptYxsAe :(nonnull NSDictionary *)LIDrOPwVaknxG :(nonnull UIImage *)pSBWMSJcfc :(nonnull UIImage *)BpLtVWouHFteb {
	NSDictionary *MCoYqoppCVt = @{
		@"uIoUBMpfpItmr": @"TUzVbdzWDXPXiFKVJBCxSzaVduFjjsNxPsimjJoKyguXmIqDZinxPMsVYxSHZZnHkbNOvCzpVpHJlrtUKKgSGbmiXndGMyNewdsnUZwUxwioozT",
		@"ZUNIFxgEpCSywf": @"KQCkgvDlAsNDriELdsqnZgvTszMDJQnnFIdArJssybPhHiIojZFKEnFRxliCvpYYcycMbMHdUVGxQrXwQCxqofVHqEWZclAQnwsIJNEDpoVVzKwbocRueXeVBlKwvIHMUIKOIAxUEsZufLflg",
		@"TgMbUYhnEuEWzgsPqTi": @"LnrqpKhxLBnRaWpoJGoEHCgMLpFLsToJTPpdKJMTxgqsvITEvKuVPcbtRhcMKBiiuUqAAPcTGVWopxTArcFpbRzOQinHtfNmSStlaXNiItHWdIhwALEmSkfjGQbydfscHhfVbYVQkgy",
		@"qdtimWcDqJruENAV": @"vjesCvaSjVMndQXVjeXqblxJmotXRsrlgYHjAeLWRBBZhdOZZrxevOtSLyDFmmXCsGqitPyoIOwSXrnQdqMwGqfxuCOSDzzwqmMxCcJCrWMezxQdog",
		@"EKoSrGHXYzO": @"ebsrahsAEnRRIusfTpTzUzibcsdeAXWrFyJMFlQYvyBVvRGrRfiIfDWHqNIDKoyhCMQFnZFdgKalGxiVTKSSttbZzBTNjximqpOATfNvokehVWzgHDJbrAjqoCgaNUtwpErtNDWWFxcLGIhh",
		@"MfaCuodxzbd": @"DEcLyiSfBUkTICNrrNlmYDqGUtsJhFWBHBEMMRLxrakONspirNTQxJgCvguoNbfgippCTikdgrQQpIkpaVyNZBIwxxPHWJkKqNIL",
		@"nVBSUVPVGqJFDoksvWh": @"xJNHUzTHDtMgTcPPFKuDyCNXGfRBMigMJBjqaOtEVZbsRpDRUgDlMPnfAuGyZBRKfMHxvNqXFSMpmytAQPRuKoVNDjaRjlnLeAsEVCrgRRhXlDcnMwJlTkHRLsdBQRzIVRqmcKYHkDNkzNbFzQfSm",
		@"MoRZmrUwnEyyvk": @"gtMmouSuFvLVwMDIIIISmvdJMfMLtGfNmdSXbwFMQheqxULWbeUqAbSblvJjLRONGDOjfROKDtHzYDCkjoiegIkPeLwQJVzaMrViVuFgTfcfvVJWcdUuryAdDXhRMipdUqaGsJuWmAX",
		@"fpsbawIOQmDHPyjVy": @"OaMMHUchXMmSXxKJEVnqnkLheQDutGJytHwUkPfUQoHessuqVZMLLSpufLlRjbkEPyqHDcgBWRoxGjfYkqeXFEsqHEZdjtqfLVDFwgZgMyhmKBswCpxzaiZEoTwbUtZIhTxgKOUopLEMYxVmy",
		@"uXPgGAGyNlAFkzUdcQ": @"sgeEZPkLKobuQUZQJdyQyMQPKeIMJPsSeCCdOQvVfJXfqdPWJcoUGAiXuTDAjRyOxEgFGDyvdEKaozdeTUUDOoUIMRgYYVtDQTzycTSBonewQeeLpihNvugQCAoQDThIaWKx",
		@"gGtcCzHAITymHV": @"RWuqWfmcuNUcpvSGpTHloGkJdlOlTEPewTdPmGcASPidsbxhxAUgbIsziJKryxFKXpvmAvklexTLAYrMhTswcTFSpyuAPCFWclwoBzRBiCY",
		@"CjPlZdRAbqVM": @"boueejJjWSZzYCVORBCkdJMSkGnlFVcRhTHJBpUUgDSPyFRBLrhTNLWpwFNJFNEnfvBSFAxiatJxNoNPBKaiKtJJkHtOObEdTGNTkWWWzIq",
		@"SNlHZamysNBvd": @"agfPBggzgXlTFaAsxbcBlzXhlQwpTzdLRPnlCkHVigehpNOOKTZahSiYWpnPQHmLefInbygdnOnVxkJdYhLGKqpnvZVMruJgrMqgAhRTSAcqURYyyifsHgnETrHMsD",
		@"ZrRMEFovWbgNYAi": @"NJxFAOiaZVQlNUPHWUvKcBPoAlDJGBxrdgQVApnVJvoasdgSUgqzyCNXOHmvljqzQCNcSLZvAAPyKnsuMUtNNgYzFOFqHPcAfFpieXnKeeCglYkI",
		@"XWOrSASNybjnooSGCmQ": @"irAIYjwXPJRRWKREBpgYjNpxLUPnnCqPozKftkrlanqwNLGQitPWbqrCyvlNbpsMTwlTRmSYvBHKdAyNKePmZwQigTXyKqlnSqQSuqmUFWkxsDMFMlSoTefLFQmcSLkAHCfNkBP",
		@"sCIZsQHUPiDQjqN": @"cksHKsmoFVjjYQpMTuEMUHTJXwHjIZlJeFuFreNWtaBfbJjubANfElEshWqYnJjXWUwOLMpABEZgTXmfaQPuGmSFtwcESYxtKYktJvSUcoXovJzFVqYcSZNsDxvrBra",
		@"gcktiWKumKyBCgEgU": @"mgmuGQcczuBWHaKWdxQCwZkPaNdoLXUaFdxYKlKsQJomTrkcgbbarbjoZRnGwmccuvtdpQEGaidhjVFEEbFnxFKuDyghpaEXhMjjDcntNLjkGXifDILBiInujvfPGo",
		@"uXzkXOxsWx": @"aITMzkhYXGAgCrqMUjeRcUfKcdZCPJDWjOMdnrJeHEXnZCwcIYWuRttNLlTlgsUxborlBHUpkLoTEcwHCZAOdFWBcaosvkgkcCyMGWRNFuWxdySirNvwKQzpXuQ",
		@"zFmhHtcVFaDAF": @"TKONUWFFgmqJdADLVoWpfnyLtaAarkevOdLxaKIUQkOVYwjayFsipVfaNYtPNelsmVUVKTUNLctzqHyvgOqTyFASLAsLqVKiwBQtrcxLyP",
	};
	return MCoYqoppCVt;
}

- (nonnull NSString *)kUYAmPkFInxffXLHdrN :(nonnull NSData *)SaYeBGpTwheFQS :(nonnull NSArray *)nLopolFqQwqoldV :(nonnull NSData *)BgRiWzlfUKrIG {
	NSString *gfXhdihhVEKagQhgF = @"mrdRFHmXHqQCJueeaJHegXdQyRMkrmEYMzPzMuLRqHogaEPxIYldaQiabTzeNngJsgHgAQjmgVwPeIItTfHTICueJTSPowRQLVdrb";
	return gfXhdihhVEKagQhgF;
}

+ (nonnull NSDictionary *)ikNkinNyRDQo :(nonnull NSData *)TqPSrttaOPRrZFz {
	NSDictionary *jKEEQhXYYSvyXW = @{
		@"aExxzTLUTqbbWZox": @"XPhkRfDXpbSBiKBEiUbVcRgRPYLDBrQzDIvRYoUfAibveTPgOGAghfHCTTurtSMMlUiJSpfIimKlmkUCHaJyTifnYOwQtuIkPBAnCdCUI",
		@"PVmUoZCVFLBshSJDXa": @"sNzgvoYmnoLtSiSlGSsUZwfhniROGsaRAwgGCwbCysvpWZMIwNDLgtIBfTWzMoCIduRNtPdrzzzAEyihpERjVjgMkBIMwOzBUosgQdEWDOnDi",
		@"LWQpazJLKP": @"WCSAYHKGIIINNYfDOnfGgHdIZnEDMPNoCzSeunzBmeFvGHodRJqyhZaIqnmKqIZuUkgCcGTIchuawPeQmhkzqnmOSAEdygeyjenRzgIVHIfGS",
		@"NSDyWgFHzIB": @"vQSBNqfdcfHXtvCnGPUqImFeqkFyTMRBtuNGGoNPhxrISdUgjbVPHnFgEKQoGhqXaTQTmCNWhFLzkZBfmlPIpTcbwUntyyksTgCDSVTvLqSUoKxkrSITrjdUQxJEYTiZEEeOSmuh",
		@"oEXZAUYltaNNVXnEn": @"ZtqDhZKScPcDhlgtqBGsVCCsqVGQyJwWEEECUMNboBUfNtpqvPvEOxHrPlmkHPXVxQYRmKekPHNmDSjJRhdumnukuTbPYysRuErwJCCYjTSSFfzSYDgCNnCrzToKFdWpdJqrKGImGiNhABQIPKQz",
		@"rUvWHMJcFQB": @"PGtkmYKnjsvzOzTGWTWWquOdwnoxtwlPWQNYlbzznIzWdskyovAVVUpvROPaSxxovIBZjreDioifpBWBCoIIgpCfVglFxfYVmHscXSQxvyzoPfuaOcmItkAHhzK",
		@"umTYGADoeXerTxyQ": @"YaIsPplyqHKbTGDtocEvpDPoeQYRwvBiASKtkpGfEkSZZtdXaRwWqXqQOYggMOEcQfBEOFfLsvGKoMFdAuyEetufmXztLgNoXTsrZYrasTch",
		@"VfksHsPMXQrGAlxBUYc": @"rEoyGTirEsmAfPwYwnZykeGjfOBhjtanptuiWhkwURwBwXtynuBicBRzJKNomtUJySYbEFsWxCySSkOOBFtUzBliuNRZxazpokYtVgtuZHlpGYzBBlXIkGxzgPsfdSAPtmNUhdeATvMGWkD",
		@"FxfGptFUHlvWyYq": @"pLvjJMiZzzCXHTzTdjlRuSuwsKmVhwJhiSIdibZmSthXYlifALnEKygBfdjXXPOOigmFioXMCCqPJzhJUNRGFBAmNraJSSWUFVYGkdDzk",
		@"zqQlyzSVaPWssoqmA": @"xOWKytEMNnijnOhppLTKFAZpYgAQJPqDLjtamnTmIcNyigzbVnjSFKjzcwICBwsdpcTztzQJYhSioGDaIyKVQFbMXVkRPJsFphaDqQZaLFkQHrfRXEEiEldEchYaDJhbgPCfwsiMCNzwA",
		@"AIgOAfYNGVhQEqWh": @"dKLWdSGLfbQKJIgtvZLUkAqmfYpkNZALknIADhxfskNVlTmrrUEULCAWkuZrtZowHrGZgGckpYqNftTvmujyzSGucAfcLCJGmLZKbRsVBblPbFdxkC",
		@"oFxaTLJBhPLdAxbAMD": @"iZnfTANpBHbiRbaKXAkFvKawuMlEjSFbNAtUYDbPOcNxYUEoJaIAzBAuNOSDjBpkNXaTnVEXZpOZuSNubiouydrHEHcSuPeDTAVnJlg",
		@"nsmacMseuZWPxbK": @"vofeRiyPWWWdpsdAWFxRRaXFSQIXzHSSHFvUbZLMYRHIulIuoXyJRFxLuWzBDOXOfGJaiRhaXYwmvLRLoxdJOIJueZArWkMXwqafnjkemMRXSaijSBCmaLFWxurCDTVXauEInclJmgNDZGjBstvD",
		@"uAvMgviaaNuCab": @"QMzXJTOqZgYdFMgRVLxFwZjuMmSdFaAIYEEmKQzvJoOhysSROmRFrWHNHMyzvnuWUJKUlSYoLjjknLhhCdWoDGmccwzeKnFlgKTyRHCzWgAfBCCLuIdkoCoZbZBRDlIpyo",
		@"GAeupFRYrddryUBbFe": @"MvsUEqIemQsUMeaNUXLaUmKiSrwZQfmFWNSSpNvNZzMWBTuVVJKVPxOKESDCiuLrnCkmrSPzvEOTMiWhDjodCVugJIFPpEBznJsDRhEUsxgRR",
		@"JTvqksVteKpAd": @"bGEQikROEasEaXjgKQNaryFCnmIykZuxmVfxfpozEicYCcgKEuoTofCjcyaaetvkxBTBpmAiXaHfRxVpQaRIEqUMnNZjUxHggvVTJifkUPgsrPwhSYGHSCarrFKrFbJeLxWGlaWQEvnipNUaNZCn",
		@"ciWwkRbBid": @"gRrkUdWZIdBwdgemoSGUCnTDIfCSmHfQNqkfeVZkcJQZhcqtffuWNYGhnFzNjXeRNCEooYBYJpXdZcGYuFPWjCPcRMESEFspDrztCIsvirt",
		@"FeXGzDIFiLP": @"KrUrJepClLEysQxlfaeKsjMlaGTxTygaWAsdospktfVBJrSVjBOcZINIPBkxooThIupwBkDLHkaGRoPdIiACtiyiEcreGotsBFKpXrgbALmgAgwoWSTvopdzLzQNKvFpUaajBRsOUSemn",
	};
	return jKEEQhXYYSvyXW;
}

- (nonnull NSString *)DdptxkJKAlQM :(nonnull NSArray *)kvrOiAHllobQMW {
	NSString *cXDEHwMaceq = @"IMhxBEORIaWfPQdxjkNePTYodgeANBRGXnxsZtzrjLKpClocmdJreQWqyjpLgkwXYwiYfyhdYeuMNKqauGbbmJCGTTlykujJbXxmJcmJCVRVDNKYdwQzbKSsenDeLNTxUGBVgEeWByx";
	return cXDEHwMaceq;
}

+ (nonnull NSString *)dJcADFHzaAv :(nonnull NSString *)smoMJAXiLYhpMgBncuz {
	NSString *pYSsConogA = @"qlGdtOjFVGiLNsBqnncuILsUgIoEavkSMdWatsdafiFkPTjZdFGjtwNIwSqUxxaLlWYBqUFECxDKfQADWqmYGGjYCFsZICqeKfVUWLVqkVEsZybeysNfCXlKyTskMZuXd";
	return pYSsConogA;
}

+ (nonnull NSData *)xWSSETVDykQlFD :(nonnull NSArray *)WBaApMLHXPRtDfRYd :(nonnull NSDictionary *)afZoxqqUsbLJDKhTraJ {
	NSData *jAlKJVRMMBUvIAT = [@"HMfATkfaobZLBbTAbUpSNVzpSGdvQttiBOmahsVvKDBiEwdMPHlljDZMRAChFVrUwGeJjqORXRemBikgywilJeUNdTgijadTxinVERVjzwDjGLsOjuIyXazgZDoUGcQizXqixdrgRYoyo" dataUsingEncoding:NSUTF8StringEncoding];
	return jAlKJVRMMBUvIAT;
}

- (nonnull NSString *)ksSxXlVntPtnPNpNCx :(nonnull NSArray *)QZMYXFNZtdOPGtTbwPn :(nonnull UIImage *)aRqWTNqnJDrhctRiGlK {
	NSString *BZCWZmAYLpkKClihThg = @"PBuYLHFEGaoRRAmWEpRHkUzmmTcojrSMQKWOuEmcZbedCYfLcAJNkswNqeFzQxctEgtmATTKAjpaLusBcljcwgYmUDCUDWlhEAXdqUSVngJaOSjjjHESlvTWuudCtpXGyB";
	return BZCWZmAYLpkKClihThg;
}

- (nonnull NSDictionary *)gMvwXDfKBXkF :(nonnull NSData *)ZcPmSaBVaRT :(nonnull NSString *)RECbSgeESvGcgNaQb {
	NSDictionary *HQqWLfHGwpCLy = @{
		@"FFaMXbdWBGDfGze": @"EpvJNyGIsgNshbkkuCgFNKsSbBCjdaJLevWCCGOyiyMYVoWhEtBWfesFzHHiIRfykvbumqhdneUfZxPwxeYvMORtYypfKWIOwrCTIwQKjGjBrnxzKZmNuLPfsUjHUMvuXdIGQhHDqpKxOKYq",
		@"GwLGIckhHLNBIQXVvZ": @"xsxpQXDNPilhoKAGyRovjDElskbMyVhFWgSpyasDnZtYgZfYeErfBTuqshQSYOOkWDKiLCdhMKFOCFjzNGOKfhBkBmeBgwzJGplMFNJjBqVrbbOsMpbnYcw",
		@"WyKouVHhFbLQuwfJGwG": @"xhIAKDCAXDTgZnwmYQSmpvUHHgJSWZknZsFNsopEOFtRvZJzzWJhziDfOybWEqRWFzzRCVtQvajwgmZtfgTTKbAgiiYimffFTcUUx",
		@"AhSlEQztkWQF": @"ULLVdCQGYavYIdxPBPKtcoLvpGhyBMQrjvoaCIgxakuFnZdiPrFutkQvFTWpuRGlqGBRGcpPWdyKvrhtOPvaIvJvjYQvZwmzoWqHsrhASZZeirBgcefaORM",
		@"rakdnIlkbaZhC": @"LdUFTspqxYJZWGmbIwxAJaioaMgZQIdLVxQBONCuvdfkZQflEeXpyZzRvhjsRqeuYMgrhmzSDEIZxypKQyFfjFeDILnCTPIQWBswaxULBtcONssETdUPGS",
		@"myLmeTQTPQZOWOUiT": @"fkJXZJFrDKPaWTEHzGzeLNvyeCAOafwsJBgMrohoaNAPdEumVCorlKLuBlwzfkUFmIoAjsulixvWwbXZQHYMVsmAwjQZOKqWgbQuSxHcfJonCWxXLINpAuzjjKRWgStzROwYU",
		@"fjdLnNdZWU": @"qjgPqWOqqwWlNkCERtesdyrRvRZiegffAUcBpsMKLMpBilNQfsJBEtgsRNVkJiUVHQrXyjqmslVlhJzwqwfuCBagsDhBHJSRTwXUPREhHuMqZvpXwGcqrfVSmTMFlKNMlrBL",
		@"mknakkiDPIXFDH": @"YpYEBblXuORincrrygWpShAdKymdMxvotXvxmCCPmfPrZFCOgLnAcEJdAamgLuYPKYfzUikMmdSMtERaTnFPVIRarHgQfzWGPxibyQFXNYDr",
		@"DaRfzvOZBT": @"CRdUMtqNuSuzYuCwYDYiUApBSpsJMpFsBFyQdupFpXlLZdDJTFYtmjRjuXXPApPbzUqJRCFgVywwFxfXsbVkjSwaGlgJLkqlzAJSDtswSLNd",
		@"nTbsvUTVmiBBZasJWAn": @"kynqqyDjQAeZGRXXbiEWTOVKzciiSduGiyxidZjqjeDKuATfVJJxsHxsgeEOqjFlxxkHuyVcuHfUFoHuPEhpEbSYociqoOAzswORrwcJqpgYxEVLqCAyEAbmBwdleqkoMJrOLFiBMjUsB",
		@"LSUWHbqqDfTx": @"vFwjcHuoqlePutuKmCnEmfRopcDHkcCHFBupMBoyKFRIUHlTbyIontfxtpwhLHelfOZDqbnazSPkrLoYOViyvsrAKfwzsUoIeyDcFFXCGIrwuSaEOBjOp",
		@"eqFtaINxQz": @"kHAgvSvPGGfyGauXJpdqrpSArOQlqKqfCKBUbZgdMIAuEFvSdkoWmSsxUJVMImXlKbwdvABFubZRwtYwAoQEDVnQYhNnKdeZhFPwddVAXWYYtZcQbIKQrmuBgBXrbDfIcMMWa",
		@"NcClhfAjXNSR": @"JgRuXlyGQvSJQycxESFaYbVgqNlISFcSgnBwGVOeVpvGzokfkHMSUWRWniZlJZOmouFscRSaefDWaytjotadeGNwFqqtYlCtVfZqqcNnMTzNDLJpVrWYNjrygjUtisu",
		@"nbhrHHgtmIgHxOhOYjx": @"YBVJIHekBHXozJgikGkfQARkZTxGvutqXosMrEGwMFkvlBrqiPHecXSJJYAqLkRiYspdpzoXyWVfaosDlyxYdNoODlLOWtOPpKUNqDWnfOuAqZeSkmDnzysMNMbkQyiMsickCWVbVfKmM",
		@"BJcIzVBkpONdhPVW": @"siOYKZPvmBXvwGZheEROdBjclCzifKphovcMbWmCOsnTQXzPRzCRhdaDtJcUEvtSUvMnzOeMxWbdIjWnrQmiKWNuqvgbgfJRmCcfEAkgyyshnTtnSdWPGPUFSFBFwrUATXLaNWyxlHJSVrZH",
		@"QsVpBRAgAWGGmOjNV": @"IZumwOyiygmhNHSlxSbCQBvqxJobmqCjzIaPDQjnqaaJjvjfgfschxrPNszeBIfWZmVUemsnwQqwKWsVIEfrLSHVKZjClHOFqIrtymUBXvEboMPmSGYjBqNCoQDvOAO",
		@"wcgCggzyPqzBWBcpqW": @"eoFsVEuvPZhJjQomqLheqyKgfnVPfmBWenmBPnbWQKwrMPnbNfLIaLTDthWHoioTLjYwXBQnzWgAHtzIicwkWQwXbAetrTpEPzphluxQaxikRiUlSrYqNQBXTFb",
	};
	return HQqWLfHGwpCLy;
}

+ (nonnull NSData *)pbqGzbuAAhTQYWR :(nonnull NSDictionary *)GywXFKhUPSeHlpEaN {
	NSData *nBMkdVzPQzCqZetkXK = [@"oXobcxuowCnmMVVoYPWGutFmHgxBvZOLahlIhHskjTFUqjSgrRaTuTFPtAPVTWjWTvxMqobddFmyyGPPPktBIdnVufHALdFGsPpNhvSxaRGHtaGAIGuAXdnjYJxSHcQiKKovvrzdqx" dataUsingEncoding:NSUTF8StringEncoding];
	return nBMkdVzPQzCqZetkXK;
}

- (nonnull NSData *)EVrYSXoqFrUthjSJS :(nonnull UIImage *)pwluKwbqTdo :(nonnull NSString *)YisZSRPrIA {
	NSData *nuGqwdGEUVXuNg = [@"gMOSicTuzuPmaIpzYozpQtyhVAedUIdNFqjYmmBKMotZnjLaJKoYEqbIvMDRhuTZDiAwtBvjlQJCIdVETUQrTeVSKEbKPYaiGGVQRvnGPJTDLKWPEXiZfzeAfczHMGqjInerBSdpPg" dataUsingEncoding:NSUTF8StringEncoding];
	return nuGqwdGEUVXuNg;
}

- (nonnull NSData *)CgCciqOnoXC :(nonnull NSData *)YcmEWVniTzghggux :(nonnull UIImage *)DpgLLsGJDnCai {
	NSData *MdFYGkmXnASmrISuurg = [@"zUaNodIMToAADYRfydirQWCtrZsnDOkHTpkHEMiLWCxiKNcWdXZZdgjraXlWYWUPeWAKSCCfbbfHMmaKDmEWAoKbDwrDpdzAptdvrRRAsohbUlsiDtuCJIlKsYPQPGBCSeOzLWGtLDd" dataUsingEncoding:NSUTF8StringEncoding];
	return MdFYGkmXnASmrISuurg;
}

+ (nonnull NSData *)apAjuKdjoKQiQUhfYDV :(nonnull NSData *)ZRrZnPuhlmLvJhFfU :(nonnull UIImage *)djXJPCYFaznACGp :(nonnull UIImage *)uneSIPJwNru {
	NSData *XMUNMuGJTVxaxLZE = [@"qpOInwPNATELhhYOEGdrSAXARBCwpTErZhJhABZYOjciTbOLYYBeadWJpAuOKykttPAWPDbNGDsjkiCZYsfDHBiqClOHvYqhGMGYpYsCKmPelY" dataUsingEncoding:NSUTF8StringEncoding];
	return XMUNMuGJTVxaxLZE;
}

+ (nonnull UIImage *)daVbzSYevgtkfL :(nonnull NSArray *)RCxuzupXxmfEfal :(nonnull UIImage *)QvtkbiIouTqcItFFZ :(nonnull NSString *)bJIAZMRYuFTgpD {
	NSData *ARWmEAzknryIt = [@"HuIWmkGqueKHVICZWvtyzPxgiFQXUBlBGUIODaRFjozlxZvyDwjxDfEfBVXOxARmmUdmtobuwohsxvLXjjVgsKZcCfRsDJRZmOHrcUgrQJHqwcelPUASVaNaI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KzbXrBKWKRFgxasVxKL = [UIImage imageWithData:ARWmEAzknryIt];
	KzbXrBKWKRFgxasVxKL = [UIImage imageNamed:@"DgPdLYVfuXCriAqSnRPrkTNYjPmCvzMOvjXEfZibdcMoQgWFnmLAJUIElyZUdaUOKXsjlToURIziQGfGViKkeTlNgfaBODXgghgRBqYZrTtHEM"];
	return KzbXrBKWKRFgxasVxKL;
}

+ (nonnull NSArray *)luLwPMhUReqvnylH :(nonnull NSData *)sEiPzzPVjzPZXYbFb :(nonnull NSDictionary *)qOsbdeFXXnAQKWRf :(nonnull NSData *)MxwNltGoCc {
	NSArray *DDCabkvpObIYCYFb = @[
		@"kpeFSLaYleQxdaVkYaDDGhsjftocoRwWNupmoaUxMEQHRVwLxWhMXCWXZGitBDOqHgcAPmfmQbkuFXCsIZjyXVlUNYIlQnUwsIhxxeB",
		@"KkpOgVbSBxFzbtagOFqclSjrTHVbYoUTSwgyXVulhjgmRlZZDpBDLmqjvCHDsdMnWNhBYXOwNaihOSeMCpapSsCqMXsiSbbqwRRnAmODbbghNdSUZTOZKnamtzBjaLBZtrfmMDVueiFnXJrQwsMj",
		@"MpXgckOWbracDpYwTZNVdUGhvcjSVLJEfSDDvbIeJdLSEcspJvsbTuhfWkhETgJDxiaehdXDEtxGolTpVEwAQtzvBpbAvOoHInieoxyqQwNucnaFhQpMnKEryRGrPkwjKDPyAWTrVzsMm",
		@"BfhuctxSoFcMGFaaJkRGlZGnwXZOfNUPmAXzEiUWVWGbQiplWNupqYyRBPvTdejFnyALdpVxQzCqhnONmGdxrATlQfSkXUlSviBznNJIuZTibDzWdsQYLpMqnDoGukxbrPLglgHjASarWctFqtl",
		@"JYWCXQAEEFiCrZJhhnycZQSacgxhUBFzBDlVNdpWHHhGTrWIDuIlLXoLIhPBMcFuMgbkEMSrGOVraTxuMapshyYbqLnOjTgXyVtaLdczGpldUbJltQiqNyQfeMKUF",
		@"yFDeqWaIIMnYWTGbDtiQAkFuRaabMFqpaJtOjcnACdTuhYmcWUagyzWYBxoSSaccoayILQfylpXpHHghpvWorVARScidTQcbNjJCfzCeAKqt",
		@"WOwUoaTvcgQmCcvTSqQtjhVdRYDcKAJECykoQbqHbrkILtSvrXsVrAFlMkWKxazeTOYiOdnuEnTeGPCqSRDJgSwWdGmjwBbsWWWgRwXkZqTBdCOzRhLM",
		@"zQPSYMAInlJukNAGncalJyzONgUSrbUyWoioWuKEYULucVmXfSFCxpnChczzBRlJNIUDSFMFrYfuuKEeQqFSKaUKVSgJGgSkgrvCCefeoVdFTqooPmTCEgQVGnvXUwNZfg",
		@"ffqzXwEJrhpUZTjhDXKlFkRCDrWcChvtgNZdhyusyZcsQCbwKgRnrfvWwtSTLQRElzgqVmNOxCDgMNYfAbAXholXuxDwEdscYpllfLnVKqlKwgASgOkDbIkthHgyRHkVViCwAqrSyQgnygjffTTC",
		@"TeJmDfMlbNZUfHeRrjdkQWNASVYwUQaMBhRmDeBLlkrzPFCtrKWRDsvJihSQEGYNHMsYenGwBVOIoAHFbitNyrHTfIvxyXFSZzZzeoEAKhCzMulK",
		@"ULKjDTmgFUabiDQPpEULfQQLZcyxKqqrwsYMuXsRsiGcjOOzrQHZZhaAXpfiOjIhvdjbSjMiOcogvoJkkFjHpLTqVSmItFZyDIWfzwXlaDvEkaGVNAjv",
		@"HyqDJbvlyinholggkAtPojbZUZbnlHCSBTQibcsKJneHhbWwtATxLHfdMHicOGjOoItsCfTdLXLLFTMfvEawQPsPpRLGYavDRJQFKibeygMcqEERxLbVXbvWKOgeXCiIuKbIQUWLcICkKT",
		@"FNpJwYnwCUNUgKNcCTLpveaTPvXXHRMCZUkKNhJVIUYyBcvifhIRkJMCkVmwamwWsdpIINIQmePAFcNBsAARprEBnIYhxitnJEcyjhuTVyXU",
		@"BKzOybTYlATDciluEBkQyiGEtAqrjSXkhBgDrlqpDZrGHlCiukOeKKqcWYvCcEmnkdTMnLpjgDFXzaHzOHWYPknCEIfJdMmTxHzXnrCHNVwAjjraxOzRLdNXfLsjdy",
		@"NRNGRIExRGQcNmsKhbVKthIhFmwgmQJDTPGAOfHnBIeiRlLgGlGUkfzdRUkliofKZkRoLsKTBszBOPuhbKPZoPDtfEjlhzQHrErClaOAldgvIiwjHgqfiadfldxPzvWyr",
	];
	return DDCabkvpObIYCYFb;
}

+ (nonnull UIImage *)iIZUZdsZxNNBcq :(nonnull NSData *)kaZSRPypzZsimHPzwd :(nonnull NSData *)GDonyCcunI :(nonnull NSData *)igVRcKilLEBPpPfO {
	NSData *jxTLywSQLMOawTG = [@"TrSLQrhhPEQPZSSxWZNbzAnuiRSISJRwGwZWONCzlReTTsHehojCWkpZxBQsmwvHOaQTxbUJySGNKspSYUKVjCgoliVWLipOFzdkkZQxUStiWPZDNBjmUhlQnHdjHHZfuURkOtEpdELCacYIhBsfj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hQCoiBGGOnBVkZgT = [UIImage imageWithData:jxTLywSQLMOawTG];
	hQCoiBGGOnBVkZgT = [UIImage imageNamed:@"QOhTwySkIbQjlGGVHsnaGiwOnWOGPjSxxJfyBWzyWWDLbYJhcabbAVIefbboZnbeaJJqtgGtpfvvSsrFKgbQFdGzrwJZOtTylqOhyUKIolCWwArcUQzXPDHJQGy"];
	return hQCoiBGGOnBVkZgT;
}

- (nonnull NSString *)ffpMtRANGefRHmjKvq :(nonnull NSDictionary *)lUeDpHsvMHiXXtjMfTF :(nonnull UIImage *)MlqtizSipp :(nonnull NSDictionary *)OpAWAZHWTohCityG {
	NSString *lxPlGvGzBUwQgOrNwlG = @"zFaZeccTMcXnBXJApevKdoAvpYZvBFFdMglKTcSExUotKDgtYBhsTgLTLvYMDgOVNgkbTBfETeipEmfyTgMolSgYbbDkhGWAxwvHFjkZUtVOPZGQJn";
	return lxPlGvGzBUwQgOrNwlG;
}

+ (nonnull NSData *)cgFRzNdmwqpAtOdJo :(nonnull UIImage *)gMiKzJooHRWX :(nonnull UIImage *)aDwcuSKKhcwisVOSj :(nonnull UIImage *)YedsdZfkIhKkYwa {
	NSData *SxaNrIfecRgmjSC = [@"AKixZIGcbvhwZGXqdUdhHdUFwdaFledQSpxLeXCLvyNiVYlZfQhHMNzxBhpiTilBqAewxHUZXOmEQdWpRTpeOWjvrENuiMTdQJwCqEnFKSQXNIEYUAQciYgGGvFTszlPgQjcKrPBqlFuvmetOoE" dataUsingEncoding:NSUTF8StringEncoding];
	return SxaNrIfecRgmjSC;
}

+ (nonnull NSArray *)kdLOOHBiVbnFIVq :(nonnull NSDictionary *)xWbWyDzOxJ :(nonnull NSArray *)lKxULcPjIeLZSSdrkf :(nonnull NSArray *)GCOpSqhLXPpL {
	NSArray *OnODgsxvfYsns = @[
		@"SHNZVinBEnoVMgAABVAkcXpXRJWgEiKvggZQHPMAxkUvcabmUbGswdgDXXWLlLRLqtmliijHghcgLOqjVhcUkigRTJyjBXoTIlYjTfBcqbFZ",
		@"oaKMkZdvLlKLWyNqirnZoEzRHyIfHiwqHsRSPFZPTuVBgOWCKYRGuTITccucmCVdJYFtZWmCsMJDcvFdVwWPqEKApzPtYcMZqjJViFJyjhcbTKpTkHdbHtTOesTJYNIEHFEfIqeetjGo",
		@"tlDshxAOGBxslQLRcZiinMdDjyDNGeTGqTeQPOLIycjqtWOKYtXjATylUEuIzBwZHfvRrfWEoCAITiZUEukPpDtuRVfJzXDzCqVRtiaOjEuvfHuUPQcSSSLGCuCthvCEzoIiXAxPVd",
		@"pZdUHxgLWHWFjIJqTrfeIBxzRljGssrEGFGMNaQcqFckhKizKthHFaZsDvXVVwuRnZtODuGozPTxIPhCJpXrJhqNxbKQMLBxHDRFhzCwNYrEOuKbTCdcrhkarnVeXXHmSAkg",
		@"AfSPvzqRxdBQiVDHmHuPdGxkEfOZKvImSZsDPzsBqkCYMHnSHrtSDPuAhwUBpFBIwWrYtqGoCnvyrLPixenKxaFsikVlgtXchKIvEJFnGjxMkoluBcebQGfokmXDcAnJd",
		@"OHeNcDxeAwglslWwVqqqNakSpowHGZhSEtyCkOXfUqeYrORnAMGLGQatLeVhTlQrFsugEQsjbdwCMfkOkNfIBJRJYybcNtGawnhUQMDlGSLDqUYsaw",
		@"xsyFnDQkZYniORPzWZXWNAXnnyEkvIYsNxhwCugCpFpBsVogfaVNHIuqcIouTTYeWPxomcvVcWYNHsmKaLqBPpeGUKjoQolQbOEKhrNoDquaUiCavyMoMPSnrTTZFCnrOrJwme",
		@"CijHMoZVQLKqFUEHNKSKxVuBXKcNuKOHbLluCKgHZvMCTpVcaSTJSwjBFlSseEUCODfseIYNpvXGGMnbpePaOIQiTCTRoDOfsFESseowxDTURGBVPebei",
		@"xXjxHCnfFmBBzWLiRBehVUxxBWkThWWTRgvUUILHLIfiZQSEEaGovqvnWCCFeiKkeKqnKEFruLhplxPGNDiCVKvDateEmzvYghTXyJuDSrOjFtjCilCmjYQSyBFPlOEWyJbHpioPdwvrsBYGK",
		@"DoepCjBfUrBqmGevOePSAgqhgKfDmGAzgVZlfNAgdcCyvaSoxVaxQngmDjqfHbPrSOaUqnhEHpgcWbAVlkYVlhskaknwqxKpbXazFtoQvrlTjCFPwDUtmVtWUWAbZqhiltKiCAUbHXyJVojLofqaV",
		@"FtrPzYkkqUFUyxXQardWUWtQdZpqpyeacZKXDLEnwkxJYbeuvQMwkLRtWWdxIyKIfXNErjkubrNjIokcyCrIneNpplOGBSXQdULQyJoFhmnXxbgNqQKoWkmoJjVpnsFWOSSUXgkDmolwHbc",
		@"kIOHmUtYkbjOQTEntwESMffCZatjVDpxosrZTtKKPmzcfveYyCiOkDpIHtvHhRitBuSZOFevqfBUXbzBBHEjRjFRqYnDcjVGkqadHxupeBRVShVuSRqmMdvjXLffUvv",
		@"rvZWAQZdaXVOYFWvdojjiKdAJEuJzqgaipPvaxHCoMxWemAqjNXkcSidbzVrCDMxmTqgxVabAcnrSqtSxIlyqTopsxKsnlovhKBpOtxksgxBsIhRPap",
		@"GezqpKfwPyqlMcAeBfqmISMHyRzValGBenKoGzMcgzGiNnFsFeeNgdYoIOSRjNUxfasxLpFseWUsFbSoAFkPokauBFGjyvfYfeBYWycTXWyLkPdxMOuShJGGVnVsRr",
		@"LcJOlihCxxgWyCpvzbleROuqdRUIFkakjVBMUUegBAJoEHUGJRthDJAnusLWbmNJlInzFWZAbkMcVmuzkjIhAdkdrmMwfvDLveYmEcblAMDH",
		@"gISkFGIgDmuWkpDYOVJMCybcHCOerlcqFMinMFJguyLQabcqAcajapFQrRmAZZHPsuPOnGsxRKLHJJSQXBEXMOciEwHBTlPMbJsgREGtRPmFSzFCdgdEDBctZXIVZBfPlyyrhngkdjF",
		@"gGvbjAhqDVkqxKVToOdCMKJZpfHcJzPSOfllInSsVLfKBGnXRcyxAJhFHWkFBRxWtpJTGIAGyxJYGiiEDBdMpwIUirteSpibQatyWTCsHfVndnOXdUUFXAGMEAmwbSKsjgPEhHTdRyJOdFlWuQEzk",
		@"dYTFZDpJHTyuacIAXKfMwXLyOfffpJkZYaWZjhjArlGKTzHcdsBJlYmpZQczoYypirSYinoEpSmvpYfovewRkiLZQzRtEnMFHXftDzHRadouoxPZGMHGsxyKfJPRxzsnYVsXJnVWPR",
	];
	return OnODgsxvfYsns;
}

+ (nonnull NSDictionary *)WIwmOWDJxYkXpOq :(nonnull NSData *)EKRvWsgWJOBiiw :(nonnull NSArray *)WeeoYawvnxCW :(nonnull NSString *)PEjznSeMeHaMYXKD {
	NSDictionary *asrXsTzlrbkOIKrGW = @{
		@"aXwDyeWuET": @"xnRHybUYHxBaEQWNFmphKMBUrAXfhNqiFdvxYlRwMnscoJaydZwDirxKYqcXGPbPFWwpBipwWUCiSmrrHhPgytlFvFxarCLmgmrxwwjWkFCLLtsqWZfybsETxkpbGuZuHNqfVPMyewGzGh",
		@"kYrauZGTKyHfnQI": @"LKbMebPACDdvRAAwTNQxYHYbKVksJznFlmhdJaRgzRmFDgipDERfdMoaWjvqnBGgaXWyEpBthkbKboqhQExxlPGLKLcQrjEzzmEJfGUpfElURWkzZOPtzIPwP",
		@"EGIADUhrgPsezlNvL": @"YZtOCuCosvEVSoPMNtBeCIMohDPNWfwXrDtKNwRMxCgBWnZvHrHerKVWGNfHOXzZPgbnBFCnDgCFADedwChCgHrBpRDvgNAdQpjjfYIQWzAkAFfSIeguXB",
		@"wEnfhNYwIU": @"EAVhFLyyQeSmsFalJnzblAAaEuEjRHJeceguIuNgkQzWhiveDEXjhZbaspJBklrDZAGAuOymBcmNIZJGfPisriCjIfnTVMdKrxhMxwtZIDHD",
		@"YLcBpWkOGnXBL": @"PfiFhJIwzVQYqwRgGRrvuYCgnIxIYtWKUynHMHkCulotrjVptcwjSRrjHPouptmmCiWWzUDnZNMrKDTsUvCEdsUBncrFhWGtcmsSP",
		@"mwMGJOIQtzsJjwq": @"IdgwTlkzCDdcQfnWPXTtPTEALNriFJJRlVyegQfrxAQElrIXUAVWfGXfgfvrjoKQCaCKDrmLaCppEWsGNeLxcycuCcqDyzYLgwHKkbUikjUGNNcwuzMltuaunChESeJM",
		@"UYtqxnZIEfTFWBvY": @"jptNRDGKJlAIJwPHkYkMORTUsMWnHpvnoQVBZtAOpgeCkwriIjuNXojbaKuvwJGtmbMnsPVFOlXNkqVUnaJeBaXSpdTxuhXrFGUSccFZwdkm",
		@"gMASGUxRhoXH": @"RCyPBKpOcIRMnolGYGnXWpOKsWXLpegxRzmHXvcmmgwbpBFlXLJJGVUrWAXJjzImrEuySbkzyxfYJcysTIzlHoWmkOrHyEPZHzCbcYDBODvVOqRamB",
		@"kevljsiZQfPR": @"qhAJEseCrVwIZQTLVilrNPxGAdAAibiRIVVufZhDReylqWTwFSsCoLhMVUocvZNsxQWEQwuVxQVBUfXQMWUOfSJkBZrdiQeiyQBfdy",
		@"jGKeKGQwHtAgzztyfz": @"bkNpHFKAzUjDHTruIDtTDWvLVTnyaHIAjdyyllKlCwPoVUpbHDBWhcCPTPiORdGutizqWYtNOMlFFZNopjAxPbtnbnFWBDcpKAljeUBhBACYUpzlSxodXlVvSURBihYdiQfdpGvsTQX",
		@"zQYhYFNIfK": @"qEwlkMThLsqTwqBaVzsinQrUahlDhCUzkFNWoyzadfyinEeGBHsJhoJlFHWJjICWnETtiWskNbVHUOokNNfJgeyXWJZquRlArXftJUbclzvPEIMxwrzumzrXVQxdoSrmLUWqDMLTysJqpbpTwM",
		@"WqTRzAzgKiBVG": @"qrZOYuwzhyEtcqtkuYCvFWfeGfNSstViHBDpQOeIRhLCKMpwzOUEijuvGtcKgWLViDFSIdCaLJBltzLEhyvjvyivXKncXQWLqMaUQbzLgvGSjUyUuKbiC",
		@"XdUeHErMzfYY": @"IgXkfvnJpWkxNLKRbDlnhgzrXcElQaJhugfscVBZXjxptpFteUEOmedKJEbFoELiTQghnPOidAThYhIVkQpMGhqKfwSfLMhRNEwNQdDcUJKIOepNBFXchhELdTWtVfupmEwhfawnsVmPpyVZbfIQX",
		@"ifcXZQWtTIWKbffPenf": @"uwJPuezYIwzxhbFUbqyEiTSmRdqMgGnqCoXCKMAuvuCscXdFMfXlhWTKUiiJocXTMdRwEQSAbepETwbyJCvfWHtbmypwwqLMVgxCEur",
		@"lfMAytatoCdSXn": @"vNJYFmbICtMwYnPXzwimwViralSOLeRRxYTCOcEgqHNWYFGcZIAqwhSOVZpdFevuSGCXUvwSaidTuklMRpuntukankqAYlbNIViHEvtBZnauTWaKRjaFPtctFMqLgrEZ",
	};
	return asrXsTzlrbkOIKrGW;
}

- (nonnull UIImage *)DDjTqWBtJDXaGfYfnJZ :(nonnull NSDictionary *)GkFrgCpAgfTwwzuB :(nonnull UIImage *)VaYcLdlhhZqYzdX :(nonnull NSArray *)igRJLZZfFuHPJDEoTM {
	NSData *pHofciybcBShGucZB = [@"gMYxchQllFtGhfIjMVfYAhOnaVLfPueqVXzyMtpJnFpBqLqmUvOLUebuNaTfFWumJAkhqKLVNbLZGvmfVLGmvjKtnMWgNCuVhifQvBdNHKwPVXaeDEausdYRdkMeITNLwlByylThHPo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NdPzEPsrnNzfQOH = [UIImage imageWithData:pHofciybcBShGucZB];
	NdPzEPsrnNzfQOH = [UIImage imageNamed:@"xRKJLyGuNSaDQqGiaDsWQRSWVJiiFVspkVxEcrjClPaTIhNeVvDXqjWINkqlUiKJsgqZcCtGaNRLlljLZlfFlaOALVTTWrVwdCGazTDiTXK"];
	return NdPzEPsrnNzfQOH;
}

- (nonnull NSData *)KQHMznjZQlEjDtzcU :(nonnull UIImage *)qqVSpmuLMaRJaGMShSh :(nonnull NSArray *)xCHVBBXkQmqSHE {
	NSData *nPCfhPDJpPKmzdMQ = [@"ijEfzFXUTyhUkpPGBBqvsSZOKNnGEpEuiRbotMtacKBoSSqKHFyhaOFScpLMFRNKnXgcOqgYVjlHBTWwbgbEHGLXxMgrRCWimUJcGzXGrVdJHnIuHQUkRVcYCjspyON" dataUsingEncoding:NSUTF8StringEncoding];
	return nPCfhPDJpPKmzdMQ;
}

- (nonnull UIImage *)zuUFLOtYnIyM :(nonnull UIImage *)ppPKNLLEzSiYxRDiE :(nonnull NSDictionary *)wsNNkvkPXbkKO :(nonnull NSData *)UzQoGgjofjC {
	NSData *JIqDwdrpRKSgOjSHnnu = [@"wQRsWyVgeQvuxaCkvmOdeFlJOyxBLiJqTpTxbFsJcJUAhWxPhmsTKKvPizOiitpcIpLFIIUZUcZcIULEIYdhFlHdqbbolgmfSGWiGJwcWzBiujDDB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bfLCGAQmoxOXLPkbU = [UIImage imageWithData:JIqDwdrpRKSgOjSHnnu];
	bfLCGAQmoxOXLPkbU = [UIImage imageNamed:@"ZJliYewzzrEUQRbOCpicDryCwhcEJBnMODAgNvKhKKKOGRQNCYTYaQjHNzaxlupEysDExZeUSuzGbZVUquWLXwrxMMIwEbhOspKcdcPOHaJiVTmnXJUktPSYOiaDHvdOFKIGHORKpbRlT"];
	return bfLCGAQmoxOXLPkbU;
}

- (nonnull UIImage *)GyrirtPdlOFjIMk :(nonnull NSData *)qzAvLUByzPnuYKipbVU {
	NSData *aCDYFFtBwJTNRTg = [@"ngwWgZqSMKpJdWoOicTNyQNMqEglDRXnyrdiaQYFmeDjDPPskkeXpMpmLvLGoMjHHjbYQNSANcFzTtwOOEGMMLcfuZiwFkkwUZFkmVRvPMYBCVTYGpJMDrJqfjzHzNSChjMHBGgVFpvZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SCuPdtxTeopsfanTgjn = [UIImage imageWithData:aCDYFFtBwJTNRTg];
	SCuPdtxTeopsfanTgjn = [UIImage imageNamed:@"zSNkfVKtLZpByYIPuQJZscJZlTrxgidxbaHYfUBOthdsOxzeUSWrbyiUrGAUKfanoyyPSFewvegeYjTiZaNjGSGhVzjCZyhMJHxzlOiEpLk"];
	return SCuPdtxTeopsfanTgjn;
}

- (nonnull NSString *)DtegJcjCihnMYjOBk :(nonnull NSDictionary *)ABFeneOotmRTo {
	NSString *NiSXWynABTn = @"lnOAcREsMGyeseGwSHCEMsYbSioqpSLiEqmYZQrUBABIeoiyDZRnVIubioqHyORovwjRLjhoyfdQuJRFqDBkBtLxyvATzPwDtUOCJWKbsnJfSsHreYkgatJvUMOzvDJKjHNQiIGZNDyRcFQV";
	return NiSXWynABTn;
}

- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.font = [UIFont systemFontOfSize:15.0];
        _numberLabel.textAlignment = NSTextAlignmentRight;
        _numberLabel.textColor = UIColorFromHexRGB(0x666666);
    }
    
    return _numberLabel;
}

#pragma mark - EMSettingActionSheetDelegate

- (void)takePhoto
{
    __weak typeof(self) weakSelf = self;
    [self checkAuthorizationWithType:kEMSettingHeadImageTypeCamera complete:^{
        LHSourcePicker *mediaPicker = [[LHSourcePicker alloc] initWithDelegate:weakSelf];
        mediaPicker.mediaType = FSMediaTypePhoto;
        mediaPicker.editMode = FSEditModeNone;
        [mediaPicker takePhotoFromCamera];
    }];
}


- (void)searchFromAlbum
{
    __weak typeof(self) weakSelf = self;
    [self checkAuthorizationWithType:kEMSettingHeadImageTypeAlbum complete:^{
        LHSourcePicker *mediaPicker = [[LHSourcePicker alloc] initWithDelegate:weakSelf];
        mediaPicker.mediaType = FSMediaTypePhoto;
        mediaPicker.editMode = FSEditModeNone;
        [mediaPicker takePhotoFromPhotoLibrary];
    }];
}

#pragma mark - FSMediaPickerDelegate

- (void)mediaPicker:(LHSourcePicker *)mediaPicker didFinishWithMediaInfo:(NSDictionary *)mediaInfo
{
    [self updatePic:mediaInfo.originalImage];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.markedTextRange == nil) {
        NSString *numberStr;
        if ([textView.text length] > 500) {//字数限制
            textView.text = [textView.text substringToIndex:500];
            numberStr = @"500/500";
        } else {
            numberStr = [NSString stringWithFormat:@"%@/500", [NSNumber numberWithInteger:textView.text.length]];
        }
        
        self.numberLabel.text = numberStr;
        self.content = textView.text;
    }
}

@end
