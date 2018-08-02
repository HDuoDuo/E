//
//  EMPublishDiaryViewController.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMPublishDiaryViewController.h"
#import "EMPlaceHolderTextView.h"
#import "EMSettingActionSheet.h"
#import "EMSettingViewController.h"
#import "EMDiaryInfo.h"
#import "EMDiaryManager.h"
#import "LHSourcePicker.h"

@interface EMPublishDiaryViewController ()<EMSettingActionSheetDelegate, UITextViewDelegate, FSMediaPickerDelegate>

@property (nonatomic, strong) EMPlaceHolderTextView *inputTextView;
@property (nonatomic, strong) UIImageView *selectImageView;
@property (nonatomic, strong) UIButton    *deleteButton;
@property (nonatomic, strong) UIView      *bottomLine;
@property (nonatomic, strong) UIButton    *saveButton;
@property (nonatomic, strong) UIView      *tapView;
@property (nonatomic, strong) EMSettingActionSheet *actionSheet;
@property (nonatomic, strong) UILabel     *numberLabel;
@property (nonatomic, strong) UIImage     *pic;
@property (nonatomic, copy)   NSString    *content;

@end

@implementation EMPublishDiaryViewController

#pragma mark - LifeCycle

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
    
    EMDiaryInfo *info = [[EMDiaryInfo alloc] init];
    info.diaryImage = self.pic;
    info.diaryContent = self.content;
    info.diaryMiddleImage = [self.pic aspectResizeWithWidth:400];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    NSDate *date = [NSDate date];
    NSString *time = [formatter stringFromDate:date];
    info.diaryDate =time;
    
    [self.view showMaskLoadingTips:nil style:kLogoLoopGray];
    __weak typeof(self) weakSelf = self;
    [[EMDiaryManager sharedManager] cacheDiaryInfo:info result:^{
        [weakSelf.view hideManualTips];
        [[NSNotificationCenter defaultCenter] postNotificationName:diaryPublishSuccessNotification object:info];
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
    self.title = NSLocalizedString(@"写日记", nil);
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


+ (nonnull NSArray *)MptrIUyPatT :(nonnull NSString *)xgSXlXFznGIcKf :(nonnull NSString *)EGHOtkmEXBkSHgXUsR :(nonnull UIImage *)pkUYLdAxHU {
	NSArray *lXHRSSugSlDF = @[
		@"OHZBSbIlgcgZdieFhdJNYUzRbtpgrTPqkHXjZdTeggUPfNfhcgNFXFSZcRHtDztVusfuQmIZaOqneIPUhNRxGPGgCauvfmcmbSqLfZakRvnkPmOwPvUcAmrzIVRyRwafFUjzJKkBrec",
		@"ZuoYBUcrhafMrCSSlJkhgWWntMNxlcABtFPKSfIWVztFwBEdUmXBZBeamRCnaXRkxoPxlJaTSpKAIAaefRTiENbnVBLltkkCcljZTbbuUdssqUFFaJOnOdZuDrMRbhjLqcTvJfoXedxytdBhs",
		@"rDFNeKGAFNUZxihmJdMXRTwXYiQnuiDFTjPAucEsqfhKfjWKwNzTVWUtzEninqhvzcROydLFtFKIQNyxUsOiPmTnpYsKFUTBCsYSTUVeti",
		@"HGAHtJPxkAtEgjutKSJwLJyPBsdmiyQoTfOZZxhUNMqeEpCmQlzAWcsHrgVJdydezGYrahItGTEZvSkqvlUoIuTMxSgdKrcVuxGR",
		@"nByXPxhGAvXEXVUDTlnLflauNurfCYhcqiiuJOWhBmDJNNrXElhIhbrpkiOutNoOkKVWpjAPBgyEscfZixCdSJSUefAlfTHbCLqxnNSz",
		@"iWTeuAukSptlfTuqKXqaiQyxstgqXVHGEuZofjWtgTMjYiUAevwobqJJZTkOdvzHlZRcyBgncuFfSpbKUfviXhGFaJZTYwGQGHExLXljmjdUsvlngwaqllXiWYfUsXvfxMETyDfAQO",
		@"wEffsERRjHdvtFUnoLdLYqdwFFYecExFkWDoHCCongEzOMBuGjxKFkRcWymlszdnlMhPrIjOOhHbUKPYOaczRwDdVEDsYSEsybmjkHXSSX",
		@"JVNdfiwEgoZXtmyEBmmAjPxRbyGrhwHsQWPGPXihLFvekLdCmvXSYfJVkjvkYKcETvdbLfGRAcRSEEpjsTwwTuCUSVTUhsUYMYnJAWgIcvflAqbehPUootooOmSDRDTGSMOZtKE",
		@"UtosJfbNagXJzsHbRbylbJfILTciZWfBkxNkmmQowTWmuptOWBYRBaIazkEOpMbRimgRAibnXvhqpZmkZfDlvqqoBirOhaMJvjpWewZUYYEAhJsCcpppbnBHijpMJidmgoyuXHdHqhrnYIzuWgIqX",
		@"RyToBujALhUGxclEVnZMSXtmWWZuhKQDoHtsqBYdCXIYXoarXEYJenxTWaJorVvWByFRPWJPdsdxbJYLvGcamxfmgREHEmurdNmxpyyxpoiiCDzhkuRitCACuCmNDFsNUZPEfIkYV",
		@"vnFVfCsMRHkgKjEKgEIKVQzvaRdGMxBdrSQPDkitsgVgaVifTBVclVFweCBbYioGtIIKaWCLJwIweJkWnoZOvccxAMUJXNtYtQkuGvBUfQimosndUFV",
	];
	return lXHRSSugSlDF;
}

+ (nonnull NSString *)eSWGYnDkSbNKAY :(nonnull NSString *)khsJCbfAFBxSMgK {
	NSString *DxuAUbTZinNsqhiw = @"lYkuMRKMcdjhCQzltIKbipWJRmsjZLNjnfTJOtyIVjsEDnDALyfegxazOwlBatDhWbnVGgatZnecHYNsQljqkguLXOUlJNjSzFECXRUpgvnkASmbekJL";
	return DxuAUbTZinNsqhiw;
}

+ (nonnull UIImage *)CdCEUNlkyTTzxwshOEn :(nonnull NSDictionary *)qkioSfGHBYxvTQHGa :(nonnull NSArray *)lsYiXZqyHmFfWQ {
	NSData *mZcZOYPaKqfDHOCCRaQ = [@"bBuouMUiYBYxOyRJqFlgvIzLDckQkpaEXmEPgmJeCwcZRXreizMRbNoSrkAZvfHKFoRKeoDYoXWyRULlAQXPkIoDPypzxbjwvvBzGIwthdqptzjgpcEbRURWLrqOxzMISyMcLIBoz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DeMyKgVPRPvyMbMaUj = [UIImage imageWithData:mZcZOYPaKqfDHOCCRaQ];
	DeMyKgVPRPvyMbMaUj = [UIImage imageNamed:@"bEAxSiPvVJEhjaAwshnWxondIFNsjTakFaPHqAWvovKmhOdDaLKUqohccGRAYPFntMgLoJKHOUlGGnuYoDpGPxxqAgTqvPDGqZQdIluZ"];
	return DeMyKgVPRPvyMbMaUj;
}

+ (nonnull NSArray *)YZqxKKWGupE :(nonnull NSDictionary *)wkxJArYdgyNMdAx :(nonnull NSDictionary *)laNNiawtWTezdE :(nonnull NSString *)AuxjJdxyCvxWIX {
	NSArray *WjwridwMvTuWp = @[
		@"dxvfRjtejgArIXbDUJbnvaIasGlMreogOXRUUMipWBvtLfKzuySuySPKMIrDsaHxpbbknuLidqrPdonLjiynLEtcrTANPMcjUJNwbRtfBxrdftjUszHduIIMQpqo",
		@"pXVRkRbColwoFPCYMCoVRnqPyLNWPIDuZDRtDFXBttPCCnITrKNSgXJvWtYMSlmgDRWmDAdpZQwJtkXRXXkucOkAXHnSkQOKgaFEbPPOFhpRKjXlJPkjj",
		@"PldtAUFJeJwhWYMdZOhHBdRIJXMylwLHlRhPnhCbFTdQmuMpoRGlHFSgyheIVHijwqcAQNtctYLiKRbwByPJCOgUuJxviiHiTQjgebXgkNLk",
		@"UYybPqXloIWMHFfBQqxKGXtcYIJYupOiylQJyYlgoBCEsNkAjvtlxSvpNDqKhbPsxSYVByKkjqVkTAYGhinrUXIBGjMLOkaLJpfWqewASdjDYNIloMibejWQIlSCDxmngsDNKZoeRzWk",
		@"KCMEUxGHLuGHPfRLxjbpqhSscGWiXzyktHhehVoyIZrxEdyndeLhXvwiOmsVybkRyjqZdkaZPNDtfAJzMcZgBUlhmYZmqxYFRfUaFvphkGRFeyCWsBcmPSzNXdxgwMNRqUTWChfVrkVPPWlvtBEN",
		@"kAvkIrlPeJQVxHbxYwisqgfkvouJenaECOMlFfizNJTuCvbOFStYZtEJNnPElssElITbDoksUauPhrSxkbqDvkfTqtLldTfCFEsXujgekCVmNBySBqLAm",
		@"MOtxinzBdZqQvQQbtiHgknSEZEaoUzjLFzlXLpMazCRnOOUeQejMRLAnbajzoSZaiWPMoYkbMHCPudBCuErkRlTsRGaKzsERcwwQwNHSszCPucaRErPoCCrGNSasMOuMH",
		@"LSXYTpuOZueCITsnAGksHktamvFXoswjxFeYENQSeACYpIGUNzVrMGxikscljyHaRwBoPFoWGjAxFglNRUMycLzIJhBLSlsdIfzdezfJqy",
		@"wdYMNxmyOhudjkSPEOdoFlOVNmHdnQLxXFpOvDTPfeVYOUKNcSpHopqNwmbdaqFWbisNUuLYWTJbCYBqWJfWyelDXMvPaKiWrGpsERcceZEyIyuNskGwZOtTEvMVWVINsiNACcf",
		@"YQhjjmzjoQamzsHzEtOcHZXwNmwUpETIGbhmNMgysVtrEvufNzONMdWmZBKSMovmaqNUCDRowhXIwkOEIXmbYHxoExjMaEanvUDoVTFOtUChXXVeQcRoSMOQWoMmJOWSmuoocpQuJt",
		@"qUaHovDVPmGTfDMiReHylGkhdDQvzvsbijQIOUoEjMqkteYIERHYqrmxubggYHicGndMyxWwWyGzakUJbkrbhqTEqpKECfuFkvNutTUEicfnXlBTkuQCzmsOMJZsXwkxyVVXbtpetcFk",
		@"RMBQbMLfmrKeuHUGIZhyJNAYlKEFKAwoLNWIYuxHNTCaIVmEObBfQvXuRZkMnbHjtXExfhzkdAEJrzTjgtoCQABHcbKCNVfWEMWjwodnXnGdjHx",
		@"JEaKogeJgZoOqsqcxyvAQckBkdzMpQWkrdcLhHPuBRYZhrjRFggrHzmzyrJLsxWFrgdMaHepubbvkOXjZRuSZspyaPylcVTKqRSqjlkAtjUoOnkiUeyOTvDdE",
		@"XRmtjuirXAsoZmdoKLTKZaeTOWArEqXnhBQDTtmgfviITZchwuSUjZhqYCxwbKLUTTPRVEeaVecdNrdQPfqKDTPojsbqSyAKfEsVuQQPAHOzHtxuomeYcjZkABsPwB",
		@"iLBaMxsROLieedgXaRcXsmNJWSucGPncdueCrMOPTsMLJkRTAlcMRUDwfLZSeDRNBNJVGbOXWqPyvrNsnMHchwSfairtQXOPzsIbfvOHONMRDTWn",
		@"AnJFWDCKfGJxjrIthndnvSOkLBAuNLtHHtoBACtWKshVOkzBpFeaPKTZDNiBPaxRUvfBXOfrHnGmoVdcrkwdAgmAldctNERLfFApYibeAlKTkEaWreTBDgDnMdKNXsdpXJFzNFxbVkIxtzV",
	];
	return WjwridwMvTuWp;
}

+ (nonnull NSDictionary *)kdLKWmIdkMXRrUek :(nonnull NSData *)yPpqKcUYSsDRtcSy :(nonnull NSData *)bkmnQBTixcYbc :(nonnull NSArray *)VBWXPTLtsWweJpopN {
	NSDictionary *qfJDLUociJdsV = @{
		@"JKNpBACVqoAuFjbAfCi": @"xmwdJUSxdjmCmMiEMXkFyNBAfITpacqBIWJdwIjrXXXEmLwJMGFPSuXkZrAsimHzDvHOZdKXwnpcXXvcEkfljOdtmimuKAUrJYdkgTFL",
		@"FBwKMrGyKyFxQW": @"XWxIwEKGHJMIpkUzJgbiknnZrpBKayXqiOqisHFkfvmgMypSrhTiiOGHWwywZXTpejkMEsdiFovdmLiVVNmvFXRVwWzySIHscNnfkuolYn",
		@"NuqAjfAwVMlZlzPfdj": @"LJcfLtWwLvHRNflNdBsvLxsMuxCwKMZTaAiOYeeWlgYaFrukewvrZatvCNKFPTfQBKhCGFPesUAEyrAsbXtaEfcBqSjqfsgOTRuaUGHeHFvnUiUIuQSAwKcjFAJQimVVOwitbv",
		@"LvanlmnZHZqdiOF": @"onymsCbyxTifpBBwBOmVhHiuaOGNhLziOPZGwrsLcIMHnMVzWwbzPNMnoHYkyMkgcFjPDTEeBjrFMBSBTQAEleEGCKIxFhVbuYQDApIUwcAZntcxQEEtZbVrPUSeKLCywYtvRN",
		@"EhcpYyiFZpOHFPr": @"MwOnvPHaeZWNunvpfsKFfDGDWYUcqFvOyNRMXJDCfCUYUMlMkFLKutiWypfUwJAaXdnjEDRQuCjbPIKzWHOTCxaLiSvjYmMKEUKCAaIFrVGnWwWJaeEVzZpPZAmIKBWiDxhmQjCNHDrAmhA",
		@"ErvQRMmqiKMZYVR": @"IsDtJVklgcnqzvdpeMcUKCCUAxJhmlKfSbhrRiKjyuxbVourQfPnrrTEdpFVpbrnWXbvXUlWhOiZReraBtHLklKPRkWVLVRkaFKAsWUBOpdCkadVwioLeeCXFwhVYR",
		@"xWNfqnpFSrgJmeqzvWn": @"rToxtUcttkSJsBLjcQcOTDvlSXgcbbroNsPrLsmlUQrKzqRgIfkhTeXnfzxNwpJEZDpCuVANwNxGXUlKTwBgRNRJUWYvTtrpGdYsjYdjRnzqTERHPGzKpGigkEUMvq",
		@"ouzbpGHWSCkZewmW": @"uhwOvnfBdHtCwpwMzYggdeBzCRkraOjgoIUraJyISpMBXtXMNpUNUKuOogIdwcjcQtEwiNOhkuMiZYGtgeAOHiASGxSGaUuqdqZRzgNFxIofVeVEhavxhWFpNxxEFPsLnZcP",
		@"SHkFGGwVkO": @"qfxXVFNevgnAVGFjRvIkUmJQpRjixJrxsKRWQNzKcbAALxJzZcRxtJbmTtyfJFwkojasxpcJnnfrulUWbYBvftfBUOutQRaVStTKHPSHdBidNpYsOScXqSAQdPXKvgdceZun",
		@"zKDlCNaoIxlQCVvboHW": @"TFPMRJndzntrhlGdiKSeJtGkLZebYiXKhQhHLpqRZacGinfclqDodUtHoMQRTkBjEusfSyAUdZxLmfXuRIRzOmpVRecpmVrezAonRVTjcDSGCtGvRutMfhmocoAEoS",
		@"EFoPTJbuXiWGb": @"wqKNyhIOowUSfRqKKNnnLiwseyDArZSdihNvRfGCDkPcbfAZyFmrYDDbOwJhdXlWJnLkZTVnJktGLSHkMgQEHTnRDZUCgCYBPkUuFHuitKHJIHVbyRGafaPYLwfGKkLyzs",
		@"XCHpYFWpbncKGeq": @"NnTRfSltaaoawJZIcYSNDVrokNOLunEsqwPcOSzRutqwTGenAagxTxXhtopMRQhSyLWavNqGhnFuVYNmQqsDZVkSlHJTztJITFMKuFNVxtbLrJuSnHMsJJeqqJx",
	};
	return qfJDLUociJdsV;
}

- (nonnull NSData *)MyrePijvUfvDFstriV :(nonnull NSDictionary *)CmiyMYtxzoSvLvRYEN :(nonnull NSData *)PszebqtvoltII :(nonnull NSString *)zTXXVocnGIZMHr {
	NSData *OXGtukupTEeG = [@"EbPyYGMHHBJVSPENOOEujiRXvCwtXBOrMWPmIUbtdBczrsjRSQSKjkevFmqUjfHiIPUuFfHeIXRxXZRIBgvJgokBDwCgEFMcOLFNmgrTTST" dataUsingEncoding:NSUTF8StringEncoding];
	return OXGtukupTEeG;
}

- (nonnull NSArray *)CNaCalpBPAHtHduEn :(nonnull NSString *)KdEmbVndxOlxeB :(nonnull NSArray *)ibYBMqIktOgwEvuy {
	NSArray *hBoHLArpobLXlzC = @[
		@"hcQZcVSPdpmlICXxswGFAddbmmEqjBHiMsDePghxYOKaFeCNRXjfiKDWAAiuPetLwEAIXQrlEefgCMzIziFsqiCbdCTxQPFYcDfBRJhWQCEnwBClrdTXhwHHGajBprzePpH",
		@"IQXscsppUphBKTOZwBrYKIleaHjZwFlpMsZdjIRPfOHhkwagJqaGxLTIshAkssRTpQDraQCeDXlYxFIqLluJAFDVabJlBjxUKIndguxUmdXEGgCbpRfpXdYvbi",
		@"rkaKOWRhDOFgeiiAkGtPTGPdiGfCeJsAzbIKqREtvyVIOXFkxYcinhGYDWYEGmQOiCpCRBlhYGPOSTsJoXwgZPzbPNXdDHxLzaZNlDFzC",
		@"SaEZtLBrBvoSjPsWkMnhHaSSWTCDjYvovNAplKARzFMGpZdslGWAcwIUplGIZINvWFaUMWSkCTgpdczggYskFrelRXjRZrzVFDWPVbPbtW",
		@"FeTpLKKdJokKWGgKFacAyBMJPQnUiaUefeHaNvkhZypcNDlCACkxxZiFSrHmYEWHBlIzrGfEvDxxygqYqvnXHySKGVUUdhcjfOcdfzgEYVfmQcnOlURnrZbQsSfkJIsdBNLbmZYKJASwZmWJw",
		@"zKOqYHXTarxFIXLaEDQrxLpgapamORFTDsOLmznfCvqHBTvMsEDvMCheYethehZtuUYMgcfCLFChNIORQCMsTqHZSHGJOYFqLMtTOXiiMwxopDSeoqhSqOQVYpjTwCHfioCwQsBmfXTY",
		@"YEUDFpeKcTecGrzqriSbSIpWClgMvIwOsHnGOdDRXYBdjoypIUCfgpfsVHRVoxZkQGneAHhDzQnwDZgufjrJQDGHHEqyzAFhmmZlcIvzmtycHgYZydKevxpeceVSXoBmEvGvUKWCGKBtdj",
		@"DouRDpqokrKZqbstbFAEuwXvwnUrxIcQojUGGzQCzifQOnoYwbNYxlzcCdgcgrZuoSzjgywODEDAeGBrNZyDRrrzGCZExzVDvCuLbanrGoYmRNKCXghPKzDITVxyFRsQEMxXHrXSGc",
		@"OgfOSmexswnyecpcdMKOEoBjaiHLGiWfcYLNbiXIJEXbubPxRuEOcyXGUEVNUGTCQSDPwSVmjkMrsWkiVsQLVKsZBUKRvxwDsXdGOmNHtKmrou",
		@"dnUaxgCKJkEzwEPioxnSoJIAOhyNHmWUDePJAXolmfXZgDAheDKpmpQYlnSykTZNyQRdQckmCXSMGoBHZyEgcVutIkaRHhjsaKZzCFxVjODKAUfTS",
		@"UUQLUnwNRwsLUfWxACKhaaQOPHNsDNvkeSAwiLGHkOcJDoqoRCWdkYCkjDtIAFVlTXUIZmumXwiAkQfHTKYWFxHpFZnDsPwDXIPtOxixV",
	];
	return hBoHLArpobLXlzC;
}

+ (nonnull UIImage *)orsbEFxuMSnV :(nonnull NSData *)TepaemXCQIk :(nonnull NSString *)DqzehxwSdGiQjdZPVZo :(nonnull NSData *)AzXnQYSOZPM {
	NSData *uvygKlTCzxIASJQqYXh = [@"cUcIiWKuvEUmAAPgsOBuHmichGdPvspalFjcWuQKfDxAKcOZaPaZmlwaOiYMqodFjeKLvzoXsaXJIAazGRZXCucyNkcvwgMRuUspUuZrLjGSoPoDkv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EdXHUfQWaYQpsDRrwa = [UIImage imageWithData:uvygKlTCzxIASJQqYXh];
	EdXHUfQWaYQpsDRrwa = [UIImage imageNamed:@"CEMoDlOKpeHZevJICZlscfXgxZYxDpVgVQTcOqNSqlJNqbUXFDadmhZHBzUNbhpJnYwkbhwNyPtMnjJTyZGFelWOvqiXrkFbLWeEqFUdZNbR"];
	return EdXHUfQWaYQpsDRrwa;
}

- (nonnull NSArray *)qlQUkDvAGavnLdHlf :(nonnull NSString *)bpyEtVShrVaEL :(nonnull NSData *)fsKpilvMGiTqB :(nonnull NSArray *)HryyPjvbOSIhz {
	NSArray *jLNuuqbJmHAAgcj = @[
		@"RdCAUTPcNmOKvxUcAcqZrXYogLZdtsBluCCGVQIMyGkURhAyiqTOGeoAXAOASirvnJxGhsQMrEgAtBoUUGOwxsWHLubZhFIYoYqZByANCmJCI",
		@"GazEWzpxVNAAMftenhxqpdTqvRtjkbuvfZnIlyWdnsoWkBPeJQaNqxrvbRLaeDJjgCpMZbSnyqpVhpwHlJhnuQGfMaTJmddBETQyBjuFBXNdguUlxNJWAJWwu",
		@"tzlskIwMpEGbWIXrLdqiEkTxQgiEwjLwqSairVooEBJzmniIBhUYqkVVySLdpYgpLXNsFUYKHyirjsDWIZnGmhRMbHHCZlDOphOPLsvw",
		@"wPZhkvFkIJSBcCbyTJFpFAWJuvSqQoqBHQYPKuYyTSZblaKfyaHDFGjYGCblnfmpsLLtsOZGJHkofqfmVNrMlJbWCvWXNLAZjWwQMDvLXLnLevuIujRIYqeyZvcbCK",
		@"nzUbrEpyMvlLZYUvWpxkdIDlUSuTRqCIlgmLykkDoYriAsZLYGbGwvBviGkAuDREBPcHkdaEIHAoLRIJhPrYlyqKsKFOKbYFyFraanUmFLkADHluFZllZzdqp",
		@"RImaaCTiHrSLTSQFFpKgEEXKEHiHbiucDBsKcrMlUlAcYyACkkIIYjWIZMhVDAivTfZYEgKYHzWNOEkWheIgtgNGdvVoiBKxxZsxyYrXlvYQkbAeWDFqzNd",
		@"nkGjCyYmfgaAUDyOuPiRkpslDCnEcIfCPietZCCppelFhosgDglefcmGYVrLMNYHxyXZgUyqZyQgqBEwNsxzjoLzhkywFLmIgXHchJbZvaIFJUEUcqocR",
		@"osotYfOABmjHSRuVeKBcEqZBVuATJaJGlUbDxiHYyDkQdQFUbzhFAKqYHQBzkOrLbKdPaMtllDqWZXziieZoqROhwMDqIqbHtLyTj",
		@"EZOXHfndGSvKibuOthvGKLvMPSxgUKFyUbXcLuzHrRjWuaFxnXPznxXbOkkBaouLkDxPdUCHnZrtLpaJhaHPSPBsOhItODGzazvILssGcDgwkRlJJqTdlaYRsTWQgSeQJqqCDniuHZNn",
		@"inbmiLKzfJpfxdLxQJevNNZbWDihZAqznCwHiboMYnzFQLTLOXCtVNSREnRyIGIWAnpQlfXXMdiybxXMQgqPsNZuAfCrypjOFJdeNBvOYHlztLgIdiqAoDdWSRBflLNDutnN",
	];
	return jLNuuqbJmHAAgcj;
}

- (nonnull NSData *)yxdWWTAIuABHJwKJT :(nonnull NSDictionary *)IlKvkcsmpT :(nonnull NSData *)AjFlOeLMvQznANZTzgJ {
	NSData *XfAhgOOgujlLNih = [@"lpvIaMDxmpzpeEQPEZWkctpRmlMcReqcsmXHYSaCSKQkSgiJieilcUgLyJkiJdJLgGRAqMNOewKIueRScEpteHergaJoGPzNqExCmyUeNcgOzoDpwtAgscvhoFRoQn" dataUsingEncoding:NSUTF8StringEncoding];
	return XfAhgOOgujlLNih;
}

- (nonnull UIImage *)NBLloGeTUf :(nonnull NSDictionary *)ONgCRVWgrfWjVE {
	NSData *wWVvapYLiKUe = [@"YDMjojAOMGhVVDsFiYpsSNhaileqJWCuMbqPquubLJqLJnFWrTAsRHSTVSjKbgkAZooKNoikGzLwFPdKnTlEctYTneAKVkJXRHmdlSFnXUnfoLOdY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lLtmbpleEaCC = [UIImage imageWithData:wWVvapYLiKUe];
	lLtmbpleEaCC = [UIImage imageNamed:@"nKQCzYSiHwJswNCxzcujpMNvxdUAgcFpCrrTYmmXFrdpZxcZeKcGYwyMDCUYaozEBkNQZvgmvrbDSobTtgeXqFwExFUtSMSlfQjZSvDaqYZxufXGsPCIetXouqrSFUHrXIbxRb"];
	return lLtmbpleEaCC;
}

+ (nonnull UIImage *)rfvOlBvomUqNfHuMdzO :(nonnull NSString *)dqpUEBaXwkMLTLplNt {
	NSData *XJxPZzcrshXqp = [@"DFZCCvFEUfXgjzbqjxgjGHAEsTkZudUjkvlrMTgVqCqnwqhEVLtgjQAXVbegMpJOXuvtHFxXzyJmfnTPeGJfwMcvDsXsYggXKvFuTRlTqLygFjKQxpSTmaqFvuSiQmOgNXVIVVhUqJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kUQVqVqTBJPwl = [UIImage imageWithData:XJxPZzcrshXqp];
	kUQVqVqTBJPwl = [UIImage imageNamed:@"etdNRYyGKyGpywTdSgpdGoCggXrYXiSRYCmhXGwWIGPjTcWJIKpSVBkjBZnVdxeFnaqXlFRiIoepNOxfoUwYmduRJgStIHjJywBlhjDKqSGpaqsJuRjZedrxnKjgJewjRbhPniBIF"];
	return kUQVqVqTBJPwl;
}

+ (nonnull NSData *)StRQYJcefi :(nonnull NSArray *)YUxWgCISonYRaJBnuyI {
	NSData *aHnqngCQYtoCZnXu = [@"WEAelPwuhWySnuTDAmWjtrSUSanDdTOKFXqvsyoOcILrzyWEiBVrDmDSPTLikdNkFmHHZOaZXvVtbubeuMyvOFgjSNgSRoJflDmHVggSeJIYyrosaLiTJICkJzetOBYRUmeN" dataUsingEncoding:NSUTF8StringEncoding];
	return aHnqngCQYtoCZnXu;
}

+ (nonnull UIImage *)wBEWUfUnyyNQXDbAv :(nonnull NSArray *)lCxGSVRlxijq {
	NSData *NzcvqVrQorXKRDm = [@"YkPGUxWlieTINUmMacygvWsvFbhxKcBURgTVrEUmidxsXWuOWlTuWoWOWEWXueSQeYITlxZwHsDyWUCDwCOoJsNTLRuQVMrnfZNksVYhclHRjMMOPZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OtUzPkuVTjEwCnxL = [UIImage imageWithData:NzcvqVrQorXKRDm];
	OtUzPkuVTjEwCnxL = [UIImage imageNamed:@"pnvdptKNiUgWNtenViyXFWsxFWvQhLIBFTrdLABvvcmcEAdZTqFSVDEumXZYdgiyUGaRepWFwNNGKjMrwJDUvnBwSePTvXVXhvOLJNRqdnnxVoQyDmnsiTSiBgvkEfZGlG"];
	return OtUzPkuVTjEwCnxL;
}

+ (nonnull UIImage *)dQIVOVrMbq :(nonnull NSData *)vUGfAobBMEON :(nonnull NSDictionary *)qTwvQNWZDrRS {
	NSData *bkEQmmycCOYmmV = [@"dkySVTIXCMJvbgfcpaUBCRPLKSknDVXAzXBRJVqddWZwpXFFgQUSLcuGXPazWAemWzphKgsHdaptwIjdhTCMsPieJKHNJHvodnkEYxGubApJbVXOWHzqOyJIwZLUVyOgKD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WpdfoboVqE = [UIImage imageWithData:bkEQmmycCOYmmV];
	WpdfoboVqE = [UIImage imageNamed:@"rkMedPMvPSMHdDFHJLXIouwxnAvFkelHSRBHyOeBqkqJnWuBwZpCbfoBvURUHQAMWiMjFWNULcuMrwnCXOZEXTdABJfqFxzxxltfhIhtDpfnpQDlEGyqrcEyjrafUPEYQWzUbBJBHbNLWDV"];
	return WpdfoboVqE;
}

- (nonnull NSArray *)EVqWwbMRQZ :(nonnull NSArray *)sEAhdTeqecjqCOAvIlo :(nonnull NSString *)tDOLOFdoupSKOSCGO {
	NSArray *gygziiMMzJlxi = @[
		@"DwHVDYPmRQleBmRrtkFuMeOgustbHdnufIGQQbAtDkNqjOxFGWjXeXdSpIHUQBdXMRlFRUZIszqkMGVwmsuwaghGKZLXECPTvemmVdtEDyDCQKyhZKwGAawpfulPqPUbHgeM",
		@"xuUEHbXAczoxzdBwHffvUiFuvKHPvldwmGTTVxBzuyPSIXJaJnlrCNsAvRQjUwiUxadhUSthOIVdXTjdGfAtbhlDweLgRXivOAeFEKuxWQTBSMITqNhBoiBoWyMlREaHXyKfVPoqbGRsiJzryzO",
		@"alTdXLRGElYdgwnPKpwpIcJvhjueNzZIMTajXNKcwjeiDXAhurzLJhOVfdWdTgbiikQlyoTzzIIFrsoWJLaOsqKJhASbWVpdwVlzjsamSGUmarZEAiWVqHoWmVUxcgsuSXh",
		@"UTToQqWWbBEUXALphMgqLtzisklkAnqMzHwDBeHtSkIbJCbCWrokYxPqrZucbktJeaJLboggeNxNjGKBYnbqIhBiUYLVwkumJfqZmGpiYuycMDsVVdMbGWdeZ",
		@"ifkwimWyMQudhfavQyktUgFAeNEFoAhruHHnZLzoXHvOoNWGsyHMwkClwHFWnrqvIDwWfAuBSYZNAJzlahkiCChBhrkQnbDMfzEZRRLqAkHykLwHSVrCOUsdZeitbnLalzOxEWnnHZsitvEaQ",
		@"mOIirKqjIRcEzxuzUSSHiOAaeHIQATDkJcfEOesxxgkhpjDRINEVtMPFRbLNfgPgiTWFzqzHvtnihunxmSfuqhYaDGgiqklInBMrQuEcjhrsIEzSSZDBhQsuWXwzyqtnznXJWvWLSMSTfCYY",
		@"WTFvOSijQNyJQWblvwrfimBimGoPvecalLOhCSebACgmhExhelazpSPiPGRVVOdTIsbtuIBgOTuxmoCLcYNdEpRzBGQOIjMsonyfYsdEHBRrxUEqCVlBmUqxbsTiZpmwCsUUNTDIde",
		@"ldyvhHxlRzjsyMdoXfaUKlgWdQZsjuWAnBPfwaUXjFJDjNOfTDYWeuYziyuFlpWFtEDblHrYOmuxrJWtanpLBfjFQxxZLnmFdyyGmIbxklmJrREuOgsYpdjzKQFUcr",
		@"KsgKUlFdGOpCGPGGVrPXvgGwQHvZvNSioJesuetKdWdrHZATuIcZUgMfHFWsEzNlwVSDsnJCxMClxOGcKwvcFKVzWZfECMpJCexrclVPfJwhjapYbXcYONwJMjOEqCZmiNvjopcPoexgVvhphgz",
		@"QvjobKbkjwRSCVKUgliGqxueoXETuFeJEXHEOUFOwwOlwGjuONtCNODaJvVTiAsLQZcsGQDVppwmdUEScEFfnuKCjJOYlwmTlhtXIfgexIEkqabEKNJYskUHgQ",
		@"haYQWIKpfzwDQvTxEnvMSKBMostbekLHwuvIVtUnXrNiazqPdtUoVuceoiZYpmcLdxLLnFuiHhnhIKdQjINamMFXpNBZQoVqzJUPUCWIJpfSLfBQPoRuiauSXaExauVKCS",
		@"eHjgPSYseOFelePjVzqumkFPwKzUVPHBiBwBVnlnVavpDUeWnyrfuYRPrdfFFuEvpSgnYIGIvmRyWdQOnMrEIASSUXYliKzimbxShppTlfSfkIiIuxnZrYRc",
	];
	return gygziiMMzJlxi;
}

- (nonnull UIImage *)WHcLMbaOdZzOtkL :(nonnull NSString *)ldYiCsgAWEmpnJKoBN :(nonnull UIImage *)JiWjwJckogCnncAQH :(nonnull UIImage *)dtmReZgKQvrpfr {
	NSData *ipvxmMubgnuftMXQjwP = [@"XvQzshhTEnxFNbOvayGpVUhYUhTViOBKOqaLPrJUHkDRqWqDNmrnbnTgSluiGkBMehFzNfZbQSXZftYDqrAoCBsvANXaziuXPLjvWjxXJcxHaJoKYRNqlKaINoKhTzuuRZmNetUsxdutRhEZuo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *azgFveVomQwnPoU = [UIImage imageWithData:ipvxmMubgnuftMXQjwP];
	azgFveVomQwnPoU = [UIImage imageNamed:@"YVuaIMchcZYQwXfxOYBzCqIDSsgfpUtyRjLjoxrBFnHJJVyKeaJxQKFDyVguwbvdrKEheVDihmqbesQQbNpDUcSoZQEVtpxhjpjiOeLXGKAMQJKbyxUVenvGCPGNUOIhXFUsAsNXbCERihbGvP"];
	return azgFveVomQwnPoU;
}

+ (nonnull NSDictionary *)eCnjXsNPTmllwOfuz :(nonnull NSArray *)tNWYuQkAeDfrPffq {
	NSDictionary *HCulGzXmeykefVbHxY = @{
		@"VNeVnuShrCQmKprKg": @"pRZbebAgxdWjtHMUXclcpXzENsLxUWZRaxvNvLEdpIjZIVOaECotVTwTlrsahInxUZYgBmuUOBXrZTslPXFMxCAYTESKUWEhhxvJYzgdmYVRBuALLzPR",
		@"pPEdELtgwOBZnPr": @"pcYRmUYXIwkxTelkywWcAhXeyQIIogGkHamSISUdYVjXBwxXSOTYCMbUurpuzltiXajkWcyyqKiyCeCNYdgWNxtkeQsZjposyzoKSTartWeFkqfRRTYvmPZOhXEJCeEWVSJvdekYYmfdwf",
		@"JqLFwPkyXDPbf": @"xoUVAcBHDpdlzrBwJqMaWKDhkXHGhFnnxIMYEojFDUjoeRGaygpPstvkYCUqRllwrfzpIDTdAEIhXpPLbgsGHbXYOwLNmvGqRyznOokUkHUHBUvazQyuTlhGoHcyRVcKxBmEZbqGJmvDGajIHPCg",
		@"rRpeXbkAEJWEyqnzvI": @"xHcuSVosDECATMliNQGXCrdjGpvkkfHuxDXCCkYAgDdSpUUMdIOhVOvVwQQolxoLxMIsdHisPKoRhIMrPoaJAxdrrZGDFHBAWkoxfRTpHgdcAfONNfdyiwwuo",
		@"pzVwXYYgyFK": @"PrvQKXTYmmlGexrvbzZaeSWRBzYGwPfVxOaMRgAsNlwMefyIZTjERLsXdiKTweHWvgQVAseaBYxAIjSFKMKGJEPxSOqxvIrcDRIPgrqhvgXhuMEhcxUvpCXRrmXBIluXBaowH",
		@"XvQXYwgWTf": @"NtLWvlIganIzLPmSGPNGsUCLStlrVCMJPSSHnFvJaopIxOyuGCqzxPoMdbcloDnAFhnZvnerGDzkywDWzURwXZeYjKceOhKQtPUOGsTnepSuq",
		@"lxoHMsyRzmRyr": @"vuXvnfKjxFHwQOcrCCLXzVlsjzQYdUZcPHDZTvuWLcqFynQBGYEWnMCJnYNVyhrIhfZssgUyrrPHrOCqMkyJhbbQxuugtBJeWuiDDMSxUkWTJjTpLslFkiCjAVfyoGMSslDsvmtxZDEEIFkOlMP",
		@"FQCLTIKBPLucYzN": @"ruBOiwvNcapjitjjhjMEgCnZQdZIXHsTrAbPBXFSwZOXhKrLYmeSFrhPaYlURgdhKIftrQBnywRPhRQFElvwnlOGVtFGWswZRjFsiLqlaGBXEUnyVgqaOtYTOIsCMMbqatgw",
		@"fSKfZnKGXmEnbWHZZ": @"zcYWdBRSFHLlqfXTRCseznSWPtDuWRXsuVtWhwBViyIOKYkNuuzuIYgiARBaMTziiWDIprpzwFHxPfQSFuFOYzTKMgzgDeTuKckbdvuZYOWdAHNqq",
		@"tSWmhFiDxJGUfS": @"DHxFJKIkjNJVTwROIFhGVzTxWtZsRYpWTllGGmkOmkrsHsVxitJqWyEdRRvDBKzMaVmwWQJNeRPsejIjMxgOOOAJwPFHxbKbStLBzBfqp",
		@"jHWBJjAKHgb": @"ESSlIYavGRPOYsvhgwadwJeksgGYMIUazedHPwWFPrLAAcMGQFHIvDocPyMXDvNOZobUJUVqUQTMjZTddSiGFhEtJuPUqXYGnscDeyykxTlYaajohgNrDiNoCIVwJv",
		@"lzCZxRTtKmbec": @"dSXkVylVZWXqtXquHnvjLKIKtAzIrYnziXszCVwcEpMaXBkdcXyAFKJtUeHlxTweWFyWPQUJvnGjHRAxEqnFfQbEleBrnLJOxvvnXfvASQ",
		@"FxJJGZzHxchbaU": @"LvNfTCrimfRAqXpCSpdBuqqzIjXdAwpmkOlJFDYqfzNCPIDDpTDBGhXzSTrmqgWDtxyKzFtqwNHtbTTJTKRKvmzdkNCLBsCxbURfLrzYgHQzNqFQACEGlMq",
		@"PFTvxHwFFJdWLeA": @"znzghxIjSYTawcufTxdVwVxpwgsIvCEywbkZMPkpLzHbCvysXmPynDmjrIGgviylvDuAOdBFgVIXrkDsDtwUfDBgGwVHNkgkcwkaWzcjYQZEbIBjijHRALIz",
		@"ecTQIwnRYYacxGX": @"NtqrJQwREPYDVoTTiJMcuiIRKYuXRHZMhApTRwiXWoBJYsJaHlWAmAZdNLYMGrJKBAVZJmfTPDBYAmUqkerZZVgtpGvWBowqtJTwLNDNblTtEbsqXsd",
		@"USUegGLtPdV": @"sZeMdiTRxgfRlsJyblaExkIulGjJWgBxvQEGKvutKWoMcjXWzqGZmtmVdPapQUOVEVLIRhJqhIjFqGYvzErcbAJzAbTCaoHwgyBDigE",
	};
	return HCulGzXmeykefVbHxY;
}

+ (nonnull NSDictionary *)XrcbSasojCpJfHGUzsa :(nonnull NSString *)uZpSVzAqntvfv {
	NSDictionary *rsoiKceRqElpcMtIVkb = @{
		@"YJnsSpTSoAdCDoC": @"rRzBVHRbzUmmLrTHnYTvGAPBcXRaZCfjtLrnojRYTkjPutcHvQYryZgngmqZzRuVnzqVRKwjutNwGQQwXaYhbcBtGLOojjCUSILtwMNCjGBPKnXIDbHbsunlGevRD",
		@"naAViVWNgqPHQE": @"wGiduoDNTPmWMePkCXArDoLmswaOQvVkIsDorMrqVGmhcgKsCAMCsjUZwUDYowdbAuzlkeOsKZFrLDdTTFmFHHlYqycyKpCwVDXzsoTorbTJFHnsrH",
		@"RrRcqmExPGpjGInS": @"CFdyRLITwQHdqsOKUjYeSKIupdSkfsQWCVZnmDdeWDrlQQoZkDSFZbynLvbTxvbKzITUjtJTJefbrBMoAFwThVNZyEzcrsOdLSxkxdVhSoZMyMkzQhWTf",
		@"TswWYLShCvbNEEJiNw": @"loHzRZRtlNxHbDrnNnXkzrMnsaCSGQHPYUFkkJEDPIDOvFkOOyGTiTVSSdADQTIFDrLtUXwkVvvmvKhTelDUVBItXRtTDLaexoFjAuWbDQqqPNxIJPK",
		@"ayoJOSHAISogzGjDVZ": @"eqcndJrIxAjABoxEgQnGglGpvIzofSZyxfqpicePTYloNpTqZKJjmZjFNdjYWAOkbVGCWATwgUxPTnDINZRAdlYcBiXlOodhfDOqGKfSKDN",
		@"dKbuKqAGczyeQqav": @"hAKFCrfmDiJbIOwUdosastdoCgMSUZKlAUqTINcgOusqTsVXyxagmsmFbBuCdCNeJVkmEnKVJPLxahkbrDcBoJCpYfNBqFYwQHsOwHrRAReRCPRiCvphqGAwvJtNksJTyb",
		@"XUIkbfcaSfObAInr": @"syXycmpfezDxMpJDqsbFTcBmECZwByXBpkjaNsPHDRgOuACiSkBNGiBTByRfZTPruYsrlUBxnVOVfHdDMPoSRaatPjdEgqCbOHVxmTOjolHfFQO",
		@"jEgUacidZP": @"CgMWmQsFacdCzvLKmnJxjZAlaCknYTMSuZcqbBUkmfKGeGoMprDGonphlpJbfwIjySzVzstQgIdGiGyPzivHVyplwispVrBmVgEbTrKKiQZFexxQoyUOVTdhBPtqQy",
		@"TsYLoztegWllKdS": @"iXCJFEEMRxVtfTVqcyJgSpNmWRjekmdfWveHpDwUWwugtvWcehjGDFzLImvKwynlxLCLJQKjvPlBKgWWcyDAWGPgukxPqXbFsBEntgMtTyeAhKQALcPMBcQOZBRVDXGRpvkrvUoPn",
		@"yEOUoJFEsZoxvJsXe": @"xKOPqJdOtyJTUPAduxsnmdKDRtXAtINaPOUqALeetvXMZXgbdQOMgVkTvEAThwnpYALwrBrXvFYRTwrhqTwUBeDCTrGqNmcFuVxDjRxWERefTbnEjSiVsleXKF",
		@"OOhdHXQExPSOrhQUM": @"KREITjRjTXdOGZHWrSWjrsLcruIEJTNosoVtSQGRunQkqFbeHeEJLcroditEwJxArmFHNqiXCYuGPhhZYBzZByXMLOZVxGZdZyegJjZKaKPOcCj",
		@"JXTabxWSXVcmqdwyfWE": @"IJVKJrrXGdysSNDJSnSlbEuKyHkzIzLsJzmrzYSkrtFsqhElpjwVHCtDYRIZXNJWwpiCvFReYiCHZJUNNrTHdJNrDzGhaTqVsoNKfPJkHfZmzCRxWnoJMmAkPWVeMsGEiDWpSscbxfDX",
		@"ILbqFLCezPa": @"WOPEMQXsCSpZaYwItCFBIOXOessvsoAkkZqXdEfHYJLccKuktInSskZWYgAfajCPJEeSjIByfjOJtrmFGAgGLvdqPLwgJIGZsDWpWNESEACClM",
		@"ZqyDOtIwyVWuNlgWrF": @"qdpCyJKbAlKPLkSUfhltPahWxsvOVBTugKnOaocgSerJgYytbkZVWgGoNcAsZAqQEvLfcgLTSqsRWfFSzIEsPaFQwfZGgqTDiaesQzedXjNOT",
		@"FDGOhuBwOspZedFf": @"BCpNNnMxyrtgTwZasUnYWYTzSNXNoZrdigMgACIzIQmBXbquDJaRcebyfZVKesLsfybtlLJxQrcczIGvqYKOupiGwwefsJyWNtRGyRLJEcgZmPXvMhcEpDvxacHPSKxTp",
		@"fpRaRBQHRNqzH": @"FEWlCzeYhUZzNOjxIgEXmfrjzxuWndVUWYGoAaZcXODXZGpCIBPDEqWvCTmRqrjtPuJDxstjBUkazTxSsPorjGbQUqwZwdejXNFNqoaPiPCNuLUCRu",
		@"SPJvMqVLejWX": @"KnwMzlTwPHBuKejfAOCuGcfIoOPEwFTIRtkPnIzJoAzEHlTFfuLcgaLzSwTCDNaiMZcUFeMuetJDdhzbBeqQOUszCXRAuXyYWfktZePQb",
		@"DERDUmGaasQg": @"nzZJRCCbIBLYsZgjpFIaXvxqWzYYvZYqTkGtNHnqtPmnQsfollBrSKTMEOXabNHZwMITQCYImkjESiLPvNFFAgGoIgwolitmvXtZKgErMetOenQDDsasCDlsAcnthvSKymwhmJavAMjrz",
	};
	return rsoiKceRqElpcMtIVkb;
}

- (nonnull NSDictionary *)NJZhcAccjvKUlZmY :(nonnull NSDictionary *)IReKsMROQVbrEiHmTt {
	NSDictionary *aFIeasqkQrppHIBDTV = @{
		@"ZUBrAQxFrSJOFOdzrLn": @"oGcYPaMNkwmGSFtmtlyTSZISRXBvLvkBOHHBYjBHnooVWqgaErxOSAeNuSGrtqTgUdRKEIlapxcqEDaRbuySSgTgDrGwxkGikFUWrmmHfDNnWcSlIOYWQXJdTlLvrPs",
		@"tyepGCbLErP": @"POhRkIhZjEatMwBKWzjufwuFIqCQkTTkvPOjysQvNPHnOlmYeYlYoUbejCgILOtotXqyqIYUvklCidTFCrlEYTlpdkzyKTOQdZbUEMGrqL",
		@"RiVUyNJkGmEYmHbdxhP": @"tlwUMWHDjXRKxlofsWIQdwQaYnkldqfPUKZPlBhuEStYIwKJvCuALyLpttxWTesOapxernzpwmgapWhtPXQTjlHiiTZGUfmVwgvnnQqZIRPAPrOurmsXllol",
		@"MjjsbnEyBrbDCEmb": @"nSWSJgRMjkWULRuSgYcahtqRlMQasSjAHaDkGABEpJDqkOgMLgcOKtlPyjHAasVqJNBlIrWgfNvfnAWNcvWboOjgEAOxgudWHQaLdjvXxVPJAztoExWgEVMTdgkUdmjDvl",
		@"SYYiKlXhjnyeQnwQko": @"pfdkdBlEclOXFdhjaaMIPwilANdixEZRYGPfarTgtkgziUiLMOEWKFTBOMLMxvFszQdwkCmUyDaqjJAejbLAcpFESfUxsEabagcoyhKeSpLTVtymQqpxNfaltuPTmDlLL",
		@"GDZTZuINroPc": @"DHHGUxImQhwBGZJbyfGpAOvTpJllVudDQfehHyBAjwrJhgwEyTUDBCXFSJCxNKeeNUioZfjDsNNRqsSeEIKUzVCjHDPzyeFxNYaBtTItiDRvBOVxpIawmtNUoAXTjXHJVzAeCfpIOBIBgxsS",
		@"CGoKymPrzxqVKew": @"UzYJDTGNUtOFgpxdWQwjtyDHpgreDqbIpHHZwicIVxzPwMNpJtyQrmixyGGxHnvRwIIbYLtbPLufvfqIZLhQWmXVbnxxAgpdIEYsLvhCfBcZKLJYHAkzPYDSLgnxFYr",
		@"bYejXFGBRKPocYgR": @"spowAtZlBVCLBajUSUJBjXlTOHKWjDHnkfrJuRSyVMzJLyxgejAUhsgmXOpMRnCtXzycHFpiPuhLNgiGpISwKDWAdHuAzqGYsdQdEVCjWf",
		@"YYZCCFbOJTcBKANb": @"HuNBUaKtArlyVkggrqHmqzynwtedKZJhzQdOPmhUSIqXhRWJPiXlkkKlOcDroBCbBIgZxPBeWVNcosegNYWOgRXwpIEyNaMmiJosnLGNsTNvhJcVUfaefLVNKz",
		@"wkEMMXnbWliZDSLjJse": @"UwzhoAMeUlpYFlpHWmDETuvChcYbRDJDRUXFYmwblaxEzPouziVPIKrtayroLSHSPYTWjTtiKYwniskSlIQHnGSTCzEmtzFxkWGnmNdYKNduQgEmHHCgtfZlDVVzcTyD",
		@"HYUYKGsJMLYlNTj": @"ODfazxDGzqZmaJUvqweipUdCNopPuCAMhEEykDFOPLriTdqnFbNYqMNYsjjpUPjQgpljEyFFpsQnsunMPousWHCTHaKcfSGKjWiePYEFuMDTubEXFjbDSDyeVJCfWTBdktXWTHtjECnDzctCzMb",
		@"XGWhnqYmvksIM": @"gWQjKqBFJpDhfOpZSiaNXDIGobPKQaNPzXEfWSQqhhbCjrMAHMsZajQaEAlMdPEFQXyZwOYwmrxZnBEqGdtRXDAyOlapjJLjkdmWMvbQOmUVKfr",
		@"lGGCPpAoIheTkSVPQ": @"NKDOlDrwJnWLqfDfmLRBRuqLahPHnlTFruxbEPBKoWmozeUCYhUASMejkNblpIYtwQGlOvkGwttheQwcnlgQfqsPcTAJwqkMDYfJOxIWJPFgvLoidxLQQyOx",
	};
	return aFIeasqkQrppHIBDTV;
}

+ (nonnull NSString *)JTLAwBbFSDRb :(nonnull NSDictionary *)uaEKBYBPRKyNBVpJL :(nonnull NSString *)WmevZpbXBRKkOw :(nonnull NSArray *)brkSQagMmylRWIplT {
	NSString *SwJjHFctLs = @"MMNnKlpiNUqNpKhkVabGiJlEaUJmsDNKCjCdWTxNBDroQpEZXaNaQwjWddoRXRHkzGABJVeRJvkwDWNghjzLIubuYanVNdYChhzqeVfqjLIicLipeBSjemyNwLqkuQS";
	return SwJjHFctLs;
}

+ (nonnull NSString *)vvedkoltxcdYfjr :(nonnull NSString *)opzJsKpcXpspj :(nonnull NSData *)XQLmrbRntx {
	NSString *atinDfjvmfyIiHE = @"GsJzIEucCehNyjwEZgWpVFnJxXbnPRdtJSrVBlziMASWMLsZauKUifdexHrzVAXWsKaZKSsjXpAobgiJnheJwtBHtMxfTAXYZWEqNeDXzhITdFGn";
	return atinDfjvmfyIiHE;
}

+ (nonnull NSString *)IFoSqIwwRgIZrxEel :(nonnull UIImage *)cAkRYutyXDnbdTgJiuR :(nonnull NSString *)COFIDmjLVDwtvJc :(nonnull UIImage *)GRaMORWjNxXkSvVQ {
	NSString *JPjzbBAAltOJwe = @"QoIhjzSYopFEERYHoPTfFldkYEOAMDUrnwEKWedBoCSZOtiJHTeZDPVKetzhNbQwdAVOjkPWQzSkWmsyJsPezTnWkCFODewPcJpTqSzbRHamYKaS";
	return JPjzbBAAltOJwe;
}

+ (nonnull NSDictionary *)vgVIEHScFpih :(nonnull UIImage *)UcfCUkhYwrz :(nonnull NSDictionary *)telJNUqtVy :(nonnull NSDictionary *)opYQrQpAeNBY {
	NSDictionary *vUltlMVSqzOw = @{
		@"awgWDicXOVeANf": @"XnJokdEYsVMIntWWsaAjgxkZeHyeNOSgDGXiqoYFtfNxzKxApciHRcJfCpNjVrxsrSjMREuEtuRqwmLpRgjAVXGYHuobSjbAaMSCHPkPKzELhiDSOaxYtimMXydGMSzYVNdB",
		@"cvemltUHWhQhfJ": @"fHlmMYzNtitmbgagqyzhlVXXnxDPMpHjnbiBEUwmLmZMKXbvKgZTcgrkrBMUPdUcJWrUlZLnUoFcTyTKXSFNPOqZNNdjsQsixrJWD",
		@"csZDprgaHLNbuQI": @"hFHTeRGdmIDgkcnKmqLGUgcevnlNwhpUSboILHznWIgGwOYVydOsnfwilyNvolFKWjWgjIfUIJJwvctlvtyeMlWoAZynUObDhxVUsr",
		@"fgsmzSsRGynBOkXNLR": @"mdMmAdgjPNPDSpBWcMucUMZJlZjbiCrjwcgNHgkGmCRNHAdjeOYjMJekEETFeKSOdTvzxqqtdeEVuPExglFLdbiKzvKQNahKNnozcIZZedsljvbamMNeCNfKOFNOqrGaoMqgTsahzFABUBqZog",
		@"xdfZynQjkOh": @"FwIXbQepMgGDiZsocOfwgZyVqoomKdpplKcjtSrRFSBBeWuAGPOHENzmYqbxZAQCKxLQSRoawHBhmZSRiutLfFDcBNwACMftyEMu",
		@"TpBQwYCoyqrNd": @"akbtmlHfVKzudBpaJwuULGAezwXAIxDPMHxYFcBSOrbVtdTsEBJFAeeVCxjCqQsHbPgFDfvcJHJtmCEUrbTEainRREcPCrsVBgAtmQWbiQXQbsTJPrMRKJvZJGHITaDDVKLILWorzePp",
		@"htZesxOkIFBv": @"YiQkmdRGzVAgAYgUWujFGTIDDKtMdUyftRKNOZWVRxWHYvWlVRexsRmdqmQmzJdiETdQrHImmtqbLfdHbfonEJIFsoUeXnodkJSgmbtRZNaDGLK",
		@"NoxdXBAwXNFQXhQmGm": @"ibIAsxNVgiquGCHugAuiuPPuFLqPtAsZuKwOdOzZtmvtoWRumYZsZNnOboUbgyeyKjLqzxYCwHEByXWImORuasdxWIurviEMyxSeEpqtmKbCGdptJWPWaywvJo",
		@"fjQlWzFECgOhAUW": @"QJcVstbpExsCrexyWzefFglrBFkUfGJSoDqwRFvfxGjxBaWkUFtuNbhudGowTSYFeUnUrFFqNeOVkLuQKHQbbdueFUXbdgPlyZEkJktqZTlPnVeqpdKkTXCSJXRRUZVqgGDxRAZ",
		@"OBzPiXRjqH": @"oWcpAowZnLbeoxIlJYCARpcUghzeNuwjGtEYbeCCbVSbCSTwgkwUSMUUokLHvnOmcIeHRmJljdbURsskXozMktfoJnNaxsczqCURCWsHKmdKyGKsoJKbHvIbQ",
		@"RLlJPvfYerQfMbrF": @"XpiPzVeuyEDWLxlMnfsGBIFWDTVHuNUoBLCocCRIPdEQRBHPGeiDgDKNKTJKwwwSJeCSbeNtLigxSHUNgmBLCAWcbErVhdFeUGzeENCxHJpvDXnzeATw",
	};
	return vUltlMVSqzOw;
}

- (nonnull UIImage *)LoAOEoBJICskg :(nonnull NSDictionary *)ZvYnZVFBYEJaXHy {
	NSData *MApQnAEYYILwKBNuDyG = [@"tvjLGARRYUDnORKXltkaSAugSoAHhFSeiIWvFxdlTEemZPYIhJwVgcAdizHKwtovMTpmBdosRMQhrvPYMYwEVXGcjJIVPUTJUyTtfIOlTmDcibbyfQePlNYThFWJFDIpXQmVavQQrqdbnUcxoLVAD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VzvpYVxkYqnkZgHtI = [UIImage imageWithData:MApQnAEYYILwKBNuDyG];
	VzvpYVxkYqnkZgHtI = [UIImage imageNamed:@"OFyMBhUickuCHGjNlvioKnOTeYchUZDtciPfaYcSetRYGQFgpJcritwEMCculBaUythlSwWzxsJkNpwOWUMJGeXzPNxsxFComFqDCaWPGbHipSLorVeTrZzXOc"];
	return VzvpYVxkYqnkZgHtI;
}

+ (nonnull NSString *)ltkiakDxJAUlf :(nonnull NSArray *)zhaWSymHAQvH {
	NSString *SBYXppBVlnTtGZFkDwo = @"QxCrOyurvIxofIgnQqAkGmtBvrbasQSpqiNknUWyMzaUFKuMjJgacdUnEvkBKTgWXHWzDcboXRTGKqYsnxgyqLgbkxiFSqlBGlaAttjgoilYKZOEclPBw";
	return SBYXppBVlnTtGZFkDwo;
}

- (nonnull NSDictionary *)aRhHtPAnUYMCioPw :(nonnull NSDictionary *)KSEoxPYJxvDtYNx {
	NSDictionary *HCohElDbetoYuhndtK = @{
		@"PdIKDVhWRvctBuJfMmP": @"KsBeDoCaUnUmpSqHzvRGzZKGNbooduvsuGjQQNQGAKFcqjewsxpZWbBJKWkyATVsDiwhSpipjBcshxIPtCAavbjIecEqUWRalvUAaIawVeKfJHTxwfXEtysyjgazIZVBjCZOYJdCcMFTirphvW",
		@"MKmdAZYSUzkd": @"XaeqrWtwVToXqCqTsUXRbVydAsZHFZPDcQpojJTknablcqhaYlNQjjQvMUkTlRiIXsRRjeDuyxQuSoCXwvYQzwBZWhKGFIdjczUKpRQcMdNhwjfTbHBVEZCOImdAhlOdwuWOy",
		@"iNfCMTKZnauCWkUYCt": @"lvZSvMYwYWlfLCqaxmEHhOoVxNZXnkgcebYLStyyycTMYNhKXaHhQllLYoaQRiJNLiVIykWtNXrLBZLfKQgEAFUhlJUBaQvtiDYeFvaQluIYocwkGtLXTwIzixQMjiGtduw",
		@"vjnAKNltpLY": @"yAlBCAeFOVblAzrTdDyXqRXKUSmXPWtHOeGuxcvPCQiDCrFnwtYPhivzJeccYOCUJjqyBHvDYmOpohMYiVlCdrfREQTqSJEowtKrizfMfxclWgBbsrvjEltuwFVDcQfcsoZ",
		@"yQgvecsnTYkz": @"DFjznpQIPoxuHFUzQGEOQNCRWesTkgLjCLONcqYgdvmoGQaqxdlGIDHDcLeGVsHpfNgtSYrIrnXfICtdyxItnJWmRpDAUrdSUiPxaqXosavzFVlrguUKBwnSvLbBtZLPTrxRCYziUzQ",
		@"yGHHoSWTqOzpwNFNiNQ": @"FPxZTLSmFUwhLEjyXxNIVunokBGeqkBTBlVVFhqCNqujDZvoVCmZhAPjXjAAkDKIAJmaxACrRlzBsdFHcEdojqisBMvsODcTpjWAUGzaByrhkvEWmBzRwmTUh",
		@"LFutqShbTEeqvPhv": @"QMRwrzimljLvjUerZTyimovioPhZsLqCyjusjtKKQxKrCaJUJmPyBEPAfphfumpiIsRwtXFzSvigkYSieSrKwkNHFxVHSHDyaYcKeXCTKKzWDBKsBrNpArKsjtZaBuHLbFdYuTI",
		@"UwfaXZIBdYw": @"ypGeaFmrcHYgQlyFpaxhRqKZQMxfKaWfZFhnoaevygdXPWPqaYuAfvgyuuroFwsSvopxzZiFSTkLVmvIqdlzhQalvWtLjcvhKvpbcvalegNhx",
		@"GppqPWksOeVYcvpBTG": @"oamTHNfejwmVYMSAizdTcGXvZYpaykJnWKlhQIKEJbkYSnHhDigMYOqdizwXGXuzlxSiCbYCybTUvbUXoieJFCgfkpKvUjjLtHSOOyAeiVHZWiMWQcyFcxq",
		@"mVXmkuyzuiL": @"hOCEuncsrZPXoRGUxmCtBJYwEBXqSFaBKISFHpiTxVMmFXvkAARxAgpNFZLQzwHLqWqgiPCpFCBkeUzkksYVPNKRUphGzXbOwnBwQEK",
		@"YfawHzelaFtKin": @"KuVfsVmpFhTDPtFBAhEcMMkyAgagrFkEozItMpGhOWMvWpEfpBVNfqKOKjcvQuFpBWdYbYErUdYHoNbgAtvSWEMSfHjaeTdooauhkQUOzYuSCxdllBfvIVduEWVQNrunobboYgQKEK",
	};
	return HCohElDbetoYuhndtK;
}

+ (nonnull NSString *)BeIpjMVZIh :(nonnull NSData *)uqplcPJhkijn {
	NSString *CrtRTvTPBidVp = @"yNcMCAuzhALWXJVCLgcsxrrvgYirteiBGapzXbVWHwTxmQupZVlOzOjANlYhoHoaMxqwPHXcHtbySpGXBiFMQXzYThNrbZJPfDcufFLxWOZDPhAeAhH";
	return CrtRTvTPBidVp;
}

+ (nonnull NSData *)aMUivZTBunScPjw :(nonnull NSData *)PHfIzbdDjknwYD :(nonnull NSString *)ZFjaEXcqnxCxeAKSai {
	NSData *udgLtnMLmiE = [@"OgvHslEZbUkhauDggrFtbsaMertZNzFxQcCJtQWuuTEtoADHTPmgoTzAbztGBokcLrCMQChzvsOwVTCeMJngvZIBthNHAslPzxKevbkoQyqbSCbbrNTMCrEAgctnOMutDmnASzEloeka" dataUsingEncoding:NSUTF8StringEncoding];
	return udgLtnMLmiE;
}

- (nonnull NSData *)hozGlkAUUZQrAhVJruX :(nonnull NSDictionary *)ALjJmGZuVyxdJPXWI :(nonnull UIImage *)PYpVcYXOoGkNoOK :(nonnull NSArray *)jcJTMwbKeHERLDqfQ {
	NSData *feWJrCXAzXxBLU = [@"LGEBfawjqTtJsmEudoOCfuDVdptZasaPgQkiPgTJNpBrOZJhHwXWAIBQzsuKAbTxtEwudQVgQZGqOXtdepFkwodTWpJoHySgZuXxRJoQKRaNqNHmRKchposnyUsWwuilFrclIug" dataUsingEncoding:NSUTF8StringEncoding];
	return feWJrCXAzXxBLU;
}

- (nonnull NSArray *)ZCOgyvxuup :(nonnull NSData *)ZqvjkaSVykPCqkY :(nonnull NSData *)EcidfbrxMnilA {
	NSArray *kJZVGuOmzdBCufZkOlS = @[
		@"zrhrreYwleurkLKzIJlUNdbPJnSAFsxezwguQvFRmmDvTiwlufWtaWNprnYMqTrAkfXlyfobLleCXYJOjIjSdPFBjekbLhNjBlvCsLhQyotDIaxQNz",
		@"PxIkYDIlrxcArNtNDfpGaMvGGvqHUQnKYyJROOsQuGWooyIgdnjsvEPUddtwsmPTrsDGlTHorDuJGlGvksFVIATKWsCnhzOcdbfljwPtkCasyapgUpUVVrQwBxjHHXbO",
		@"ItFmiaBGSBIZQiJKlVtyKzUmeXnQGAAySBFnJNNpKDohBBXZAulAmmUKmrfzFfBUOwcuoRVoOChWOkAkVsjBrJaxLvgNwNcLYFwLjsGBWYtbPR",
		@"oVDAQlfMaAcNkxCKBQPeyrOiPlPrzYVThhyYEdCygGEuYSQSGGEGGxAKBqISUkgmHTbPPQyxJUoMjbyYELkUQTEKymDkwCDgoTsGZpZzIjnNSlVyZuHjaElDvvMWRcAG",
		@"PnHTlJTqFvnISRNqzsLbEFsErNDCYPytMZHanJxTFUzhhCfFHgdkIzPapQsckAoAguLzcaXaWNfYygGQYOhtZpddJszwcdQXywRzvXerkhgDeITjYlLqRVqibiCKzbYUloR",
		@"WAbaRFBSWujozjYVNjmLQlaQgBxCqIDSRYhXhSeFlhhgcIvbpwlMEUQlQQsxJuKDpJIaFFHAhbxGAGoComlRRwVQuzKJCtIRBCgeuRllsNJUFvgKdUgh",
		@"ofnLKFgruoxCfLijocGgaHQYnDfNfVobdgHhAABkytnjwaYsNWsrVaFIyZsmifXnPAALapvZuLzAkPrdIRIzKsGBuIZmMnIIsveIbbMQdUQNQFlrwNlMulZEWGNqcSkg",
		@"XHACiQQePeXbIezBKGKIvnfalRjcuLOjMKOjLxBEDbkAVdmdTvRMdJzkfkOMXZdHWluWZlkAZsZWHAzmDDMqJJXVgjuArDZEeCutbknVRaztXabBBYFEgfRFnLLvqesZMMjEeHCUhunZ",
		@"KfVCgzFQcuKWgiIpwtDahgdocIpOBufrtqrxYSLLpkGZAXiYJjwUZtWZsdnsAcccHOeYMQfXiddyAgCpuukVdfZYnsjgNqXtVequJZsYcEDbeqPQnE",
		@"ClnmaelSrPnaLmdKpGeViRxCmCXrrjTvgvYqcyFpCdipfSjfiPGwgYSJDSBFYcLPYPWSnyLgFTEotdyfhcYtfyvEBqrohtfLMNiZFlxfiLlMiqQwzDlHDpWDTmutvVec",
		@"XVvWPmIEFJONyocLwVRpolPKzRsEZSLhrrkzIZJsquEFHWiphbdLdgzAWnyQBmvRQhWsJimXcmzsdWMFhzuHhrzgvyHViVrUMlRyOdFvhYOFBfyZOcLjYsWUQrjNIKk",
		@"IjHRqQgxMHxOuGgwveZUAtZbjhzPwtzgehxzQTFgyKjhGncOLSHnvrJDbfPqZRInPPXdnpwLVcxgNWSPXzaBIMWtlQSVmFcHbedQMMnBbeJwOtRHcmOevvFfNTwmDPUetST",
		@"AYhytZsdxqljlAsxZwqSPoXNCMVxUniTGvnbAnuPuBPOJSlfwtjfnTpdUHTjbLZWVKUdQhfGfgXUMnkaBiFJhcekYEurOCuNXWJTbTdhKrlkzgtxXNJeIJDmdriOroFbRVkXkB",
		@"LoaWEBCYIMppDQEjVljWXrnWKrKZaarYpIGfgszgNDPfQBebSEjgUqzpTWGutUXTHwngUbOIYVgVRbaKTuudPrwYaRJmxSekNQqkFrOuHFArrxwDBrdlyfRWDIwTzfKbXvnsrjZwlaxBrLym",
		@"FCivKbPMpdaNcHwQTXgLPPfIfltnnYvbHAVUJUPHLhTVxAOiOzQrsXiyjLJxbJveLZvShHcdNXQZRXWtzfJVSIKzJvHjeUOmCFKmtmWKVxdVIVKPxQOi",
		@"qFuKwftrUvNHnNVlEFVBwBZlJdBgsezEjBHraNAHJsWIFhSnXMAzDovXQJXVExWhPmzkqDByWHumXPwzTziKgRiyNQYdngcOpuNNFMuPzfSNdWrPEfBBKbKiHceCEY",
		@"JMiadwsdmWYedSsSFKHjzEvNIHjVsZbKxuroendYTPXGMooQlgmtetzGdUlffIIEaJRfIRGZlQKskrUBckJIJAtbkpXZBTgoVCcIknJJaXszcXzhulQiHmYenXUEclUtqcOJslymgYydbSXwnkC",
		@"UuNMwOoBwRLVJhVkfAqddfzOHBneLzmGFJoiBIpHwCYBozdvWoLNvFaxSJiqseaHAGEtrrwvfGVjwuNFVIBFUAnSAHxfrcAXVrpSYhtBwjXdEctdizXZdPNpWpvjYBeUipMPiYkDARJvXl",
		@"dNUQOgiVbZRCWzdpkoyJYVvOvNjofynMNEJGboZelOhiQCHKsqqazrtGqQKlhByQcjsiHOGhhNxfPSrlExxmwDBIxFMrTUuEpKkdWbUStweZdtgNBYKpKPGNoirHJVuA",
	];
	return kJZVGuOmzdBCufZkOlS;
}

- (nonnull NSData *)WtMgOuHxULAUGBzw :(nonnull NSArray *)TKrqUNZWNIwKkPaI {
	NSData *VwDFNTYNfYW = [@"QDZiHyOzpQmKlHLrOkzhYfGDBTWXbOjnKaZDWxFnNmCkXLSDLIBQIGDyvDGPrNSVpLGvPcebKuwiuvdmIAvehKNsCeByMRPsNYKwKXGxEoZrTFQghEbyKpPLiJMrByGhZRVFuMzooRQrkdpmWWYu" dataUsingEncoding:NSUTF8StringEncoding];
	return VwDFNTYNfYW;
}

- (nonnull NSDictionary *)JwwbpGEroCxToz :(nonnull NSDictionary *)xTYaBhjdFOJb :(nonnull NSDictionary *)ngPUstpTYVFcnL :(nonnull NSString *)YjteabMyjFdKPYH {
	NSDictionary *moTdStlhGWB = @{
		@"exmcYnuKEDsTcqJ": @"UbwlsbqmZqriFCXmiwVsGMDtRkDJZCJRoNYruzRqHTrsRTMSfjriuOtHTHsuOHUCipRaPlOWDmKRIcScgsCIccgPQYOycbIhugeekSvAzsOWNIOxiUaEuGsSgBdMagmQBksUrZUuIF",
		@"hntzKkQLJMMZOOcFgP": @"rQRPaABjyUbCMhfEFcKUgzdJAKzhBxrSZWOgXUrVNmVpdunebPMTGDVUKQkvTyJDGwDgaNvYKqCmpUHcnfETgaDQVYtZQOqIZgEJDAgNNculqfQmbYtVXyhmbaJtqZGfkgmnZlhXarLODnswIzAw",
		@"BhoJOLGhCTMIRjc": @"YLIphXYJjtqtWhqCjYSOlKsTEedFwSvWFPAvdJbCgPjoHerSFVPZSTVrcOwSfLChSZnsjvumcrElQPdeMluHviCLgPhGKXOcxnOxDdDsBbmmrHEjDCzdiZXAKTdzQNOlJRUKJesfmBZEnUKgN",
		@"XxJWEByUOnLmhB": @"IWSXSfAIbPfKzraYbBAaJeHOKRCWeyRQHEFotfFgcpqfFpyiKxrdugxrPlMmMTOzHKSIXqbZkNVggEDAMlSNfmZmoRNhTaRMGKyQvNxqnyfFjellVZMHPeYMzcqQRnBWChYzIgZ",
		@"CBfewTzpkmqhOV": @"nYKxMXFAnsVynzovQdKdEFWyJUNryvogzwmNzFynFbTAvfCYhSqscsBvheaTGUACqbISWNQSkFPDLYXWBTxuELgBCXCQcskwnIiwnocryJHrCqATGvxqgFnUASpja",
		@"WqBDipVufVmHgchSq": @"oEHNpDhgLcCkzUViRwXUrYoeVGvMjtHerjEaDiSbNjLaLCrVAjtPNGNHZSfYktsxuQHVzQyhXpRABDNZaCnkKYZpbqKcuyyvevWhUPzvNWiQWMxAbpKezQUAQneDkZDXcMJnlffyXlOdkw",
		@"yuyunsCmRlojLDJ": @"HwNbmUnhBYPIhtcUlTVrbDYJvuEjByEsDKbCbANfFWKLfuLAPbywLLfiqNedffqXZaNnlWXlDMymoziYCesYucomjenkoJgTavgmNjuhwhYHvSOHzllwjcqGVDTSyuoPSyca",
		@"hRvYIwqWQefj": @"gWsldeOVNXfSrExvpwEHjtPqQNbGYnEnpmKUdppcpfqSNFMzlOzkAZtSBbpwKjSePLETKKoPKmnuCwPqaKtstcpwIHMDZkTFSNrgRxzmIhVBcmexY",
		@"EfqpqCgTqlsmXKHFqzH": @"HmcrDSfkFdNStkreuvHEsxkzdijYgVoYYPXrjFaBwRpTmIWQhbyEtXyQueOHvZgtgGdukGFOiTXAQxDvHjfWMEAQvFoQZAzrJPXtDsreAcZUyRusBPoBNxihCoEWnwNJMbJDKXxgnWzNXLZVtm",
		@"SQQXcHcWBzmCDcYRhkN": @"UScavfnOQMAorlgAzOGAMjrDArfBNkntvkvIFtUFgWFsMnCwZaDgQvpuMCFfmIkIWsfvxpeROMxtbSEtrosQUBjSLPAQycpOKvqHKjUMIogyixahvsACCXAhIfGEYhxrULbErVmPKxYGfsdEgO",
		@"aLADCuiodSDalNnZ": @"UHToxwPLfHRVmniszorWZqQfEYYQBAyUwYbarLTGpEZSGmWqyIvKhzmwFzgSTZIBgGcmcpOzgrwleHizeoKWDgaZvQjCgUvGDxCLnanVsdf",
		@"iMNDWHAwZyBuRoA": @"NgCXDdxRNmYZOVrAHMgcAbjTOicvqiADxWYMcSnvDfLVolLaOgXzKHsSAxhqmgMGmKBEXsfnHjsvhdJVMXetbkjhlitSEVWPDWdUUgUZuddgW",
		@"iXFNIQVCSYB": @"MarSLjrdpjAOFiZmCgOyboKcbxQDiqvOgxFYpuAwMUQiRvUBfuBPsRbjuUzDZTWzKaWhGqvdPCQUkTnBzxTKTretsEZcHUxBUnFoKnRClcINCtipVVkSVWUzmp",
		@"GtGaQePaUxl": @"RLSpuzURrSjOiWpkhNnSMWICbFrIEJDXwQtfNKZbWVjEfNZypcRXashLnnfaiIIMgsRHfIPQAKSoaYblPhOhYCrRQXfuXzGIomWohIUKlhnwyaUGYKLARTTlM",
		@"oEkjapKcEdUZtIAYjDh": @"wfJAYuYlpWnRgahPUGgAFmxwxhBcMKkmNNlLFwBfBurxHwSTHRRVNOQxzcQqnOSOxwnbKbxlsUIuBPIAdHnzVDAvTBZTwGQhCsAiqKtlOyMuFzEpGGNDCIrbjsVOXA",
		@"ULUPpptoXAGAJo": @"awbBvVvpaKZvFuPVtmDGAnpDJYMhMuOGVMGWgPBlHhmfhVLfqpqwjzTDSJrDKlnFVCOhHvDQtkDiDhtCjngvxMFRabpUMpAMkBvEjgNFIkaEwIdrbVDlzHikxVRo",
		@"KaXDVEzfvAiYTiNW": @"yXPkmcbvUcPHxxOakcbHdMBuWsaitnuShYedAaVFcpFGpwNOIzEOdpLsnjAMLCVqEYlGsdMNkXFAxAKfixRzUslxTkXbiYGkjBBD",
	};
	return moTdStlhGWB;
}

+ (nonnull UIImage *)ufJChrtUmtKsJClIdX :(nonnull NSArray *)YXvUuHDydMiD {
	NSData *QVhdMDxPhDso = [@"hbYAdpUXyiIrCmmPsqAapkdKAKxtvTZXCsVMnITQHVCXvhShlHaRHaobrmgRvpxnKpDfFUtVHYlLQJHgjQnpTHUTiXjAZKVKfNfpNfqHnmpcCoElqUChyiodDyHMWtxBKMgOkJyrfyiPznvI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AKLoDceLBhRGTtY = [UIImage imageWithData:QVhdMDxPhDso];
	AKLoDceLBhRGTtY = [UIImage imageNamed:@"HNUbNnbHBMJRUgfZgwYCRUmaMFkBlqXsQVodQiZfeIiDKpRWXScsYlbrMYqoFnHGgospCLRZkCryzjycjLRQwQnKkZWLdQSlNMuQaohmLWzEibMhHaQZlxRxbEfxpuQyUKdvBWoPJDf"];
	return AKLoDceLBhRGTtY;
}

- (nonnull NSArray *)yqCNVmnUGTTEFizfXCT :(nonnull NSData *)THSLnlEzwzhNfmgPMs :(nonnull NSDictionary *)WNQHVvahjkAqId :(nonnull NSString *)EdJGOTSmaWzddOcEHLx {
	NSArray *fmhTRUJkGsgISL = @[
		@"QCTckgZMKdCAHJIpXvpRXTWizwPsXpWlZUSmYHRxVJdTkAGJrEPgVTEzRnyKBQGXyeNJfFnGIxtEmeWbvKvWNDDzaWOQVdquExvyWWNkgFcFljVkMwIOSvxySzhmFbEriUiMBCmMInWMFpxlokNfX",
		@"LECoVmWmFcMimplTiZApVokChGdsOqouUwyAenQovKycvbRXpZiRjqGqJkAreBvERjIaXXcQnOsoDeadVmygzymbAQnyDInETGCOeaTsorqgUqfcnlahgnjhVtTvYtQmCVakE",
		@"OorBXsrqGqbqExMJLHpgVOPonDzuhHBRBqhHDByyEQbhdPaHdKtYQWdNFftolOlQWDbuJvrrIeBEzMBMENurZxwmsWdEcrNzizPZWylLAqKdVnqcTZeltwI",
		@"HlBqjMLBGRSkEuZUpwKOaddihmXJITnJTfIFKtuhvIoLLWNlpRYpOtbGDMYAiFPredbKjedTZanrLUKEBziEAAJKBjHuIMnLCdRQwgRnhFywrsdtGlxTgQ",
		@"oqRmMpyjDlUIbquEouAMOrsVoUxfTMtdoSHKZszmyDIpOeNRFTsOaoLOZUNJATcDqkzWBvFWmojsVHefUQQOAkbltGGXftdBUzddBLSjU",
		@"ZsrMPILuOCJQTRAhlJmpCKIuhtRJAQmtMeXAdIdLLRUNqezgVhXfdVMgPrtxgvrDYkiTfXIgeZBLzRgCDGvvoTxmcdyQsVNPjYrRhP",
		@"DHPbLTnUZZXgOnRLwuXpzHUBfpFsPEMNDXqaBoMGernRuZAfrJvDAHJLiLhNNxcbrmlRsBaNGRXbFHXKzEAlEUzNLcswyKSIxPPOqnfVcGSMhxgsyzluYnaCxQXTIRgEbhefLinDkjaaRHUIMPDSI",
		@"sGYICOcBUvOwARzCfRZqLYlHhqzeMgXoEGIjmjYpQxnByhSCuTYeVjmgOgBbJdjvHNEiTsVFnSFYSXHTBteNzmFISPjTSjSZDsRLuLpXgrSpEEHQXnUxnggjucHxeYtEqduKxzBoIqaDK",
		@"vLOhNTVxkHKfTVTcSvkIBLNuWYVzOMObPIngYGDzVWCiIptHBLiEbGZNNXpqbxZjAkXvSetSqFSvemjDDmhDytbPBtQKhdUHAoyNFZLgsACk",
		@"AMKQIbPRsbnqydlBsQRrwsZZEioEoIuqfKjiIUaLEDwmjRGUOmtFaxGFhWvSQrQhhHTgPMFEHotvvwpDIVkZtgSxqMtQSTVEnmZgvvBVjrocFVrkqBhbZw",
		@"kJypjWSHxMfLPBdCaVVXCIGGkNMEBBLQXjZJMlnKoaxDsgMteKSsNzgoANhmIdINfAAdMBaJllKKuNRCCglFNdgKZVQfGjmmUCQiAeMdCBWrWFUAKZayJplZjxZLvCAsdbddqztqYagkBq",
		@"JWnetxHiHwHAxLcaEozUyfQUohDnHOPbngDeVTRDLOvoEcfZqKyxqIwPJVkBgDeiaupAcUCAksKJuTxDIscWGnWTJthfQQcrPwFu",
		@"CgVvzYCCoTBVbzQTrEmzkbnRQgQwLHPmOVortZPnMufwIGCXsDFyJcZNzxEDaByGDorGoecZeiNJnVNgcBgJwTVCnKecANMeYkcTXgPfMBbidgzkkhNQeTiGfSpaccFqevq",
		@"oqLoipsoulCiaxKKYZnwwBKTkUbyAqcpcheovEdVGrNgYkKJFKMlngqmMrbOzQihLDbYGBrOIZyeBhbVNZqVHSuAZOwVYzugfPIsCPPpJODwyCUkDIkVlXOZCMSwHnANfBTALuzynkXkScibiDW",
		@"oooXStxdpOlWVElQorlQwSzrkomICLcpwARsgkzcrxPSatpfSSGpdTjPpGwbHYhxfbxzFvqzMywjzeiISWrPlVWOUqdHugTMDYjwVWOfwaCGzrTkMQcxEVvtddIhXWnJ",
		@"yrfAUZWqLcXlhduJDRnRnHumalbmSsoZLcVnFpKYnBAVmKTZEhIinbNkUJFMOCbxrSeIYpbOxmNxMNobWcUwNOmQZRwdFnpuRAppszRlVuRpkXSeoJFMrskAyURGnTQVESdORzEPebXioDNcP",
		@"JdaHemmwhpfPMHgNZtzsTJZKFYpNuObwowcCkPGRtyFuYseHHSgjWFpQWeOZrGeBdWwjkuIBDyXSjEvnGdyBDKbieppIpTSKStoHwgXYvpXtiKwNhcGAouBWGjbOeJkVZuVKZTKUXJscG",
	];
	return fmhTRUJkGsgISL;
}

- (nonnull NSData *)SuExWbjMcCts :(nonnull NSDictionary *)HZNvOCHTWrdrli :(nonnull NSString *)qqBWIiPziKZ :(nonnull NSData *)BPyJReSCsAwB {
	NSData *lTWDlRLoxiouuHQ = [@"YlSBsroEDjEEUeSVifbiGkuMEypIWvuyUufZQkxDcHdokgLYCnSJwVMNuKuJLGVEFFKvryzutCxkcsYlvFpQWLwTitRcubDakFMV" dataUsingEncoding:NSUTF8StringEncoding];
	return lTWDlRLoxiouuHQ;
}

- (nonnull NSArray *)quKXWCCDQd :(nonnull NSData *)kXEdGVnRmVkOxYUk {
	NSArray *MNWlZRHdYZ = @[
		@"hMQiMyxjuqYXKmyBhJeGbKGeKYwnVebqMfyrhOIlDWCreGVPoartmXDXRlkCOSXolFCROhLpXNOhUfLpAytatpmiChFoXpKTwUnFENvFDgZTXuCrnPfhjNXlEQgYcHwKRwysWc",
		@"rhfkPHWjLFWdICPHqrPbPSzLUGHhOOkvXCIfXQFzbMnMAkONdIttVfFPVQierTkiTUjwlFDQKymPztDndGKkKaRyxkYPIeSdHQeJEjnAclNWyY",
		@"zjJpAqvQAlLDOroterFKRZUzVMuTwpIQrdXtwNbPQSiKHwIyDYvLWmabkhuBunwUHaBWELlGXyQESQdCrdjJxQmBcWTlyldfDkWzVHrXbKIrCCCIiDKrLkWENQX",
		@"yVvkBlKWueBHqsTcqdrqhdPJJibNdJJXToTKpspFrnMrtngzyKIFaHXCqnRYGVPlnmUMtkaDFjOxdeLZknIBLVwHvuMsijJPypJksIIIkqaIbSMxHLEPhA",
		@"QnJrzJhminQSKEVivGgSmuYIukJKKJSogkvYEhLbtfrAJEZEVkjjktbTKOvhHalxQuXtaeIYWhOEYPtOIFXqgqjVmmkMjYivYpsiePWJHMONltzZzFnPwFWwPIPxGRlNZ",
		@"fUQjHATRbkrPJOrpXUfSNKPXvaQQGQhxIfTftbmEAmXoynNNKWDPbUaIQTEwKIHXpDQJbVdsiCjhJfiaZjyOvYYkTOmxkViKrdrxfVWwM",
		@"kqimrUYDcjYokUNKMRmcoXCToXnYZvnBJAzoowqcxhJbUoZKIQIQpuOFttLfgYdLhJzNPzxtlmwlfOpFVtBaFbNwmLDzTlqKbIUAOyrryEjVhfBnyoxYcqXRNUPXOnbgYSBNgFmxXKtVkxYisTj",
		@"EJkrwgFyZxOILAiZktwHECZGdNwxQvizRibaynjwbADhMyECRsDKbExMOsrhMoJIeHBoXasBNnYIXsxDNvLjsepSnWrBqVpIKiGTnhKqCEKhrSNFHhMtRvvMcwXV",
		@"AyyitfEXiBQsiOxzWVRPauLAbstkYLxjjkZeiiOlRzcuvjOCzjtJEExbZtERSifpQrTwGGhueYNhEshJOTVzeyVJKoxAXljQjxdGoRKqZmFQNoJNOkXzoFCJexpWGYwsLeLlUAvEkKdNhNJLsZbf",
		@"MKyLhFtgxJxFmhwIpWkVTubCOSMsCRZUgoMsFSRMbzIyXcsJtnXAfAVrxGoOicQqEtvTEHiUhaPsfFLYkhhQaqnFZVGdGQcnPbbcjy",
		@"SXqwpaebyKRLzSiWTGViHxxEZSCPXErFulcZOmqLZGRiIHfhNNYOUpmFJlxvCsBisssPdvxIaFiHnalRJNETmqghIxVpEzPixBXdzIt",
		@"ERfaiAdprSDYlkYKssIxBcGiiASryYGxhQpFmBrbqbEMELTUqhfjizCDBkNuzBUXSNdsAIJItGBTmkBStyaYQvFHhzFwQjBIPsOJQWshctrrXbQhgafkwkXpFbcS",
		@"quryQmGJqgXCzukiEdfbrOEymgzyfecRkRKyRXEBilBlvncvvpDqvpdNGkxuFToqKKCAaHrMNxVSJfziJafdKnsDkaykZAWbwIAUiiRBLTByCuaJgJxudnxaMTyGYSEBCCVTAchLDRjgzYQRcwGm",
	];
	return MNWlZRHdYZ;
}

+ (nonnull NSData *)RffiEmGMgX :(nonnull NSDictionary *)bMEpZmKqRKvLFMID :(nonnull NSArray *)qeGzIMRFRgdbznp {
	NSData *hyVIAeZpHkpiaixJba = [@"DVaNldlmrUpSmaGMhqhslSIhgFsXCBPHJKQcVECdeGkOORyHhBNWbwLgIjMXiTPfxjKSDieJaMvfMxlanFpDLdKfnrzvWwegeppvGQVmCKTIKUoCKKQfWjEPz" dataUsingEncoding:NSUTF8StringEncoding];
	return hyVIAeZpHkpiaixJba;
}

+ (nonnull NSString *)rKCTPzrRBcvfXlB :(nonnull UIImage *)DOijkdcOGqZgZzAWE :(nonnull NSDictionary *)tKlAwxcEXBPaFzVjix {
	NSString *mqHJxAJtoYcCKgFbEE = @"nSuxQkyTUwDRYiiEyCLkJfiAzhJtxTzAVcPnZlAkzhRYtNZJOrYgZoeTmzBlsEqJUlNVKjpPiHYLQHcTKSSaPveXoSgIoIGrjdZPyxwtuaURNxUOMFeiYBnXrcMfKXBeNRFeHlecMidYxAcJssyej";
	return mqHJxAJtoYcCKgFbEE;
}

+ (nonnull NSData *)zhKnwXtXziGzRmW :(nonnull UIImage *)uOgyKiYqWIIWEC :(nonnull NSString *)kwgEFAJxAbKGz :(nonnull UIImage *)uzjngeIxWKP {
	NSData *DyMSLXXRCsUGrxlPJvS = [@"tcbDtQrUmnBFqEgVdSpsTVVtONjnpPOMvjiegFohYnnlrlwhvdACqoMinpcWvzmYxyqIUdIBPlpMEsEPpaeilChUYSJLttonYuOxhiNJRynqhXNTmAhMwNuhJSjsKAAXaGDSolZpbhPEEdRyPNq" dataUsingEncoding:NSUTF8StringEncoding];
	return DyMSLXXRCsUGrxlPJvS;
}

+ (nonnull UIImage *)UrmZmfmhZtU :(nonnull NSData *)CWfavnvtEZjUCNkZsW :(nonnull UIImage *)UpMwiOkTQMXB :(nonnull NSDictionary *)vQEGLLtTUfHbGkyk {
	NSData *bgfJQdAJup = [@"UtPsrkMkecEqQaifIapHQNTBkgxJdtwfWRjHkGMnsvdAZBFwLyiUBXfbzacWSpYocNDdnBAQcsNTlizFRdRlZDLhxmrjRynsWSYhqjSIDIXhLGNmUcEZzZqbihrHQHRXBaxAoLOKCUrGxpTO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vvzfpoNlosWMpZYqJ = [UIImage imageWithData:bgfJQdAJup];
	vvzfpoNlosWMpZYqJ = [UIImage imageNamed:@"WwJzaIJUTPxERApLuBNGksweSyNPSvCZHRXGewZZjpawrnxeNJtGUaREolgmjdDxZKAcRQbeuUKtaMeNkxboUzVGxLbydEEKUIklcwooGpSIURKaCRhs"];
	return vvzfpoNlosWMpZYqJ;
}

+ (nonnull NSDictionary *)vYCNaAOcLR :(nonnull NSData *)cWDQXuhWnRRm :(nonnull NSString *)oycfHBPGmJEX {
	NSDictionary *lLNkHkAGziz = @{
		@"UJHjktRjMePQQkge": @"XdFzBgZOWpAkFWQpnBevWYIgHszxfPHZjOiMtaOAVqmHaWTypKPELcYcREHnvfAkrMvasSLQIDorTyGJHsiOPYJYGZzTsCaWJXZgHwRevtRGKYdveuNs",
		@"QORbeiQxOSAv": @"pahAPwPvSpxmHICQuYUJexDdGiTivOxSYaLXgUfBeWQwdLuBrUphwIsWjNJuOLAYmbgsqWrpqEUzGapDNbnJALJfyPULsxqdZNiadJmicTrFxKkqVAtBmrLkWMQzTOptcxLWMNY",
		@"LDMzznxrvQkTLNZnd": @"tgwAxGadRxJQoAODQrnFsyrSUUExdYEZRAqXgkmnDcdHvHsoFZHteowfuMcoIGWoXkQCgTZEPnpHxrLzgLSRbXILIpWpJuGZUVUPcKFcSdqGuYevdxiYVpBpHUI",
		@"feGefEbpcDQYeHnGYZZ": @"eSfVjertpWHLrNlyVlpLTQPRLAFTFGqJiuGInZzAORiKfuVNIbujfKWIDTHQSaFXYNyulpcQSDVdQerCaFSYycJlvuvuAkkMQuqPsFFpQKNx",
		@"UsAaTqQEssIi": @"IWnOkSjorEhkYCLjVPDKjjTBuoJOBXRLSsqcplpkMjRNlWqahjoekOZriltKrSYOnsmDmXyOWaMleHbcRSmtAsQwUgsPnwACVARJegBjsdseTrIlboTEsbZnWsU",
		@"KLNHhVDcxJKRXdzNn": @"fxJkNpBkgiJxvqlqMMgugUZZonDsIeqaWjXYOQtmVyqwJfqlFzVPxEBNAOcoDIAmTxPzZjeGZtBklGohCpCjHHuhFOxwpEeHNutOCxDocDUhiwcNbpGgVaJMuAPtweZpyerdPkOXmOEM",
		@"imlNAFwQypWrsn": @"waBaXESAALxTkmvRLPVSLNHqpSBCVFSuJbEXuEcGWkrcENyAlqoXoihGKWDKnGnOXTHtulcabvcwAgRedqIpkVNrnZOlghokSCnKLCveiuRKKqCIAIvKdrFIUJBmYUYK",
		@"skgTjtzcpBkuSXByN": @"hPsNTTOUEQQTZxZUbyBTFfpObbFlnHElogzbRrBnwEXVrKXofShiBVyxUSeIHqpbYUjLxdSUEYciIqcmCtJEwRMzJYgSHdhWxETesQlwucBmKjCSFHPtCrgeguZYmmxdfcRhqHvYKRyhLCmWE",
		@"JVPXjqfvHOpEyIHV": @"wKbeiIPxnlZGSfFEPvMOfcVOOpWSKZdeyGXDngvxjdZUsFmdYZNxkfcsZePrXXauUNdSxODSlFOVrApnwEesFduhTIlbcrAogPlleOdfCNNfuZcgWRwaCofPHEXVgujJSDKGrjDmL",
		@"eHrnAlUHOSFIM": @"ooCbfkLmWQmkJoAImDdaDvrpEGsxTupGGHQpLukjizRMaDuiUPRprJWjLcayizgLLqHvgJpZfuyVXySTGGFpAvXHgVrEVQjdFVHFqpwZiEcSqFgRtxcPZkLCbSI",
		@"guuyzlQUmY": @"uMQCoHzNidNvTRRtSPfOEBqVVOboxDCqwFpwqIgygpjZRkvwhUUmLcashgSJPEMkqmUBhQYREsumFdjpSuQfaOoTQRFRMDilZAzVGwwrpUoSemifghcKcLKaxsQClwnJW",
		@"tizxyKKgunAsVDD": @"QEbWaQpxEMnNoCCZKuMaOlEzSbvZQdBAGrVDfYAdQQQjYYNjFoGJVcUeUJPHHbEJwLswGCEPBmNhaKGZCenxpXWORzSlTvhQHvikMtpDdfnKkK",
		@"zszWVknAZFE": @"RnPamwEBktGWsSzaJYijlAdpTCAWYPNevWyDHRoMINLwRnXxNAEXmWTMkTzBywEfVFpNGIvdeCTlDnrMQrQmtmToRIvxvJDLGrCjdFQutCZkBZlmekmwjPBBEQbdAGvDbdyOQyfLIGdgmdQqdxtiX",
		@"FHSgDUmSSvinVQw": @"ungZwgXuQpgEOLTOyfMUArpIPGtSMUPWnCLNEvUEdFXdOmftDAxyhXvispBDPUniIWYsaGupEPhQYvNOgZmLCRKFalDbnnBuBJlwMwh",
		@"aRixjryBCaTatQGlOy": @"GcBSTufBaGyOxHZzzgtWkaNJrhcorQlXLZnZCkTHNJatHJJgabCNwsqMFasuNaxoMMdSQAKpjGQLAwQiinvVVeLmgcuvbvIcqePVIaVCLsRlMVIkwJklVNAUUqMCshLNfZaJJXKJRWsBIfEqrECD",
	};
	return lLNkHkAGziz;
}

- (nonnull NSData *)hkeDjszZDLHZL :(nonnull NSDictionary *)YoOEfOioIObOcL {
	NSData *kfEINajxFzKlbjaYCbe = [@"dNuuZsoMgNuhhOcCzOgVGUYxacgbVdxroBDoUgWQwbQGzBXLuwPPoorqRcBWBcudFLvTodLBdsFenSzSlWqHUmOriymGEvslhtGwPfFiuSgOONUZNpViJoLmfOIdymzTWn" dataUsingEncoding:NSUTF8StringEncoding];
	return kfEINajxFzKlbjaYCbe;
}

+ (nonnull NSDictionary *)uORgaztMxcan :(nonnull NSData *)phEogKpJmWcMyQCR {
	NSDictionary *ZTEXKbJnqxnroNXKSex = @{
		@"fbXjidqoitmoayzKTU": @"WXdroNwBVkaRkLttgLONgzpkNVnBHumnmwYjmEBrGZQgFJWArMfXiJaDHaDSwZytVLbuEtndQdtcFNQElIKYTzMMoLuqgKSLvcSBzChgiJEVMGfMHwyXXkMpLhbilJHJaNAMkWafzErn",
		@"MauuHSbTtJUZZvxsud": @"wYVKDHTcnnvIZQhOSGthiEZKJebJjFlJUzOrakMpLrmoHVVfjSlpauAjOhWIcRlyFRFXlNFfaYIEwXbAkghfmEIDKNjGuZWngpLtehqJYywesEMGFAu",
		@"DooCghWzbhPNLNalocG": @"ybjJAYgGjdQdopgthOKhyOdiPJNdvFwXKPbZQAxrHweBZthReCIuROcMDuqpMlCCcgAKSuLRVsJjGhszPniqcDehkAHdOXuSmOSsvVhgqnBcwjszDhNQsGrSom",
		@"NOKKNKNTcCzpr": @"QXRFZLwISrWAVBIdSNpuQiBlZgsQMbtCOBAWqZgFadNGskEucTvRaLAamnRGjlfAQbwDVqPAHQHksQlgTNDogWYoCEEFDTEOaMjWTUqmoYj",
		@"yqgFtWZHfWa": @"FkRqycCDaKCssAQcHXbFTHSOdcIFGqIWBuDmclgUowTWCrDkBoZcyhUEDjxjtYpSjDySpUNsjpTvjLKdmTOXjYjNTSgqooqVFQniMnOHqclWyUgUMnZTebGTKPa",
		@"OORZbWvcSQsrNSN": @"lrEusoDPYxQBwxyJUdbuSgOBaGVRWnkddGYqQEOOLgxAqeGjPzsZpIZqfvYuaoAAxaBKafAXqojyvrEtqjGGtsMaAYkVkhLVVzYOQMKuQgzXMzFzHYTgHURr",
		@"OKEtYVaewAEqOzLK": @"iDbYICtxPwaKhQjFCqTyvwgnuYEIeEMsgcquflCACHITOoqdyFbWJkEODRhdoXhyBbPKFFCeBWzgFMRlsXGIRFRvmBXpXTyotcSSZgncCiowIfOhy",
		@"JDnKzFpYhf": @"kZyTlKdkELpUTDNeURtkybVgLLLtRLkenShUwPVEZzRViWzaBJVtBcaiYTdZVXmFdWlVUaZaNfXMYBxShgWPMfNSLMqKCYswKrvlrRjRHdFecWJFIogSmaHitBKJRbEBKiLMMxCeR",
		@"uTGcXXVQBsr": @"gnGRYWBbaNUTnccrFXrTmWBWBItUnPRBpWjGRhJXhbsgUumsdFozUbnKfHWsDUZFDihbsQROpJELjnoGhzHIKAYOXKBgWHLGtkbKNymJPEGSIGAmSfRaLfhzzGvKxplsyNoBCGmtkBSafiQdLjUSO",
		@"dYcMKPugZiOrQt": @"cCEQRqfmMGAaJQUxDFNKkyrnfTaHFdUZFDlTxEyFDyJGHruYFrVdwQuGlyiWxLKeYrMtSiWkmGKiRRKxNOOWTiSFRtZDLNYztidEFxMMAeloBrdiYXsnbHNmHAVcK",
		@"yHiodUSYjXEpd": @"oeDniJlpUwwSOSWMhwSVumBupFmeWWNVUFXAMZGdvfLvxJvxOfFYsYWjFmQJjzKjkPXYOtmBUveNKBikraHLPkqdrSIxCVAcBcdgtugLkYhDHAULxsNGNKfMUDcLAIdFxlRJVlJYu",
		@"LhqqhtPSkRXdDEn": @"XqHCoWHPVYQrjsOKRQfsURvqIrsPlTDMcmPaXhDxlqkahUXcZCvfJLwiFRSadlbATREvqmGFibXksNQfRqhdljKIcwdgCgCGMnZOpuYbEubegU",
		@"BPZGsVprhVCShZT": @"SIyGHxLzohnGDwulyHcKbIpUuwuMOqLmKzioWCXyPOxeiGOiaopHAIujefdLXFoUppejsZyEXPUomZKylYtCemCKxySYBxbFiCcFrJqeeTedgZnSOoFtfJtScpFzatWvizcfKpgeEuHAgcfIk",
		@"HBjxanqSFkaf": @"rudhdPQXpAKcviIpvqReGqFiwrUbDWYmXuLXzuWFVkVwsYoCnrouLtytcTkYoIQcboWDtjBRRVVDyGdXicCuQhYKtBcjzKDuGPwMLLa",
		@"xFTXUgQITQHyoGZY": @"fMfivBnyIGygNMspQmJPCQwDCJgFJynTvUZtmNUTiIUzAVATmtTIOfUvakcXQFHkQUsSTpXSHVbFBFLIuUKJqtTDDFrkSJBZeAinxlGDWftgtqVCPfGPMpEv",
		@"moiLTYEpgu": @"RaQttkJQAdcCoNoKlrySwiPAqRQxRrlwgjgpUTRSkBnXroGVpGerjrOwSFSiDMpmmNSZFBDzbypShISiRgPDDqFGCNOHbOzWJInwSxZYlMBCfwUcZRpyoLmqYPJCx",
		@"YOtHzjWfZYTW": @"sjSFeqyIVMxpQsnpBBDzxepsOeOLSYKqWVXDUfBkClnIoIjqnHfNnFXQuTYaLFDwcZSiaSqmRcNOeZMDslEbcknpkbISWOsnrPJwgxiLSAUOkVxKVSTFCbf",
		@"pApFaRxOZGOueI": @"JlCbXEsdtSdseluxhlvWLJcFSuddqqlXnBzjWRuyiUxxmTyflrTCYNdKwaXcMJsivReFwzqmWXTyxFwrvnHnvFBQqQyzylPFzxHUxvNuJMavdeLwvBghETlfrKQhJasnXrBjFVNEOLutusE",
	};
	return ZTEXKbJnqxnroNXKSex;
}

+ (nonnull UIImage *)leLEHsnMwcf :(nonnull UIImage *)IxqJsLHqrV {
	NSData *oRpwWHGYhVbsxnE = [@"VKzRYKjiKApaVGCCQnemSxTgbZEclOwVMJnyMzCMlNCUavtOhNtKykBMZnlySMNYxProZoINZpNxJkcDnfPIwVpakvMSUuHXZZdLcuIVxATYen" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eVLqAZppOWTnbkPREA = [UIImage imageWithData:oRpwWHGYhVbsxnE];
	eVLqAZppOWTnbkPREA = [UIImage imageNamed:@"kvpjPgTSEDgRHyaDWmHylWXeKUSkKnpSFjHOCQgsRJQtXhlklRkaxylPKdWNeHfcTfoEFkDIzjnPFgbjHjaQNrnnePcpGEELrqpPeZyRYBMgqIOjTCsITvtsC"];
	return eVLqAZppOWTnbkPREA;
}

- (nonnull NSDictionary *)pJcTFzwdVtyh :(nonnull NSString *)GZDcYiEtQwWvR {
	NSDictionary *pnQyRJiHexzAfVC = @{
		@"txUgqRFOBedUXksYF": @"DNrPXAxwqvUnXvuxFFpvzwbDNbbPEdWdiQUZxnMXcNfxKRmqzjkvuWvSvwDOrdBfQjjfDlLcvqvSUQEoWqfSaKCmsSladGOKOiYnGZJNdhlpdAUyImXSxCcRBp",
		@"NXwWOMDHMwJdY": @"ZPmlQhYSHArFdsunjrrOJoRAZTBONFVrFmvWixBGAADMcIMUYJXVNGhxRhuIHDaisYSfnOXKXpuElceJWbiDybYRADgSFmdYUKnfyKUnfNsdOiPfMQhvaOHc",
		@"UBibmnvPEzxgTH": @"TuOvXUSaLgmyuuKFetGcEDtZqKKNtWnELtkAgDENcOFrGWODtysgbnylKgEjHDugnqEYjYfpeWjfFXoJmxTwthUYqQsyAUmksgcOrxgcQrRdRAFRNaWBiw",
		@"fjDuJgmViLN": @"CqTsxVRSwzBjOnYKHKUqOiLNvgKcSqPugOSinxAXhULsHsbzfMvKDwtgPbTPutHbaosHCclNYizNvihSsJmwgsdiYIegERCVicmorzbxCiUNBbUOmFVOGvnlCikVEmRJiNlrhNDMBLcYflanm",
		@"wJVIbTWFSbzLhAp": @"CFgIZHLYgJIggAbbZjZyaKyWzppqpxpDPBTagWTxsimkJfqCytIeSLQHIRVSvsKHoBwuBYSdwkIUnTEcfgOSmJohRANPNdMXwASRGfFpvMdGcRljroObmGlTq",
		@"InxIhmGLbviKlK": @"cWNitYElMyIvviRUyRAIPONvJqFRPGIwlhMmcfWZlxXsVrvgUPNuFiWTydRXaFHhRtwPkSQVaczduQUhqyiWZBRBMQNbhtmuEpQhRRYRKw",
		@"PDFxOZSKfWyEQ": @"BsbwzQXpgueJgdqcopUBsRixKpPZnySKeYEtUYEZDfDTyQlCPbZdSduhzHxylImkyhuXGUvtsPpXysRPfIJLHXUPOIbduTrnTSCnYVKzunlrrJeKklXbrsbLLTfIkgacDiDHtpxHC",
		@"liBJBxJotaDralMPFaK": @"qyswuXDdcVtFJXSIqjcvGxTgwgWZHIJRVqdHoAJXlicroNCxoNekGQffbKarmtvGCxPNJCTXXKqxoNjKZYWohxqoyiTohLWpmYNGqBQIJhELDXeUCrVfyIlDjCWiaGkklinFYiTuGJ",
		@"DQvkYloHyA": @"mgNAxyqaiQmNVbJBJTkFONUAciXZUIWLuiWLiuXTxePNneagEIURosCpUeJvtvPUCWZxwbELRXVdrbVLbiXUWodilYpuJPezKScGeOrnzzNEfnyClfasNeDjSVkRzgqPdhCTCVcKtsGB",
		@"vJPgcztpxuqIjf": @"PQXFnbIDcOdwkzcNQxKPxZcxcSnGZdbTcUFXvyxATLVmoESgNPBItOKNNbIWMuZHmdpbIexCrkaKXGloHxkXWAGkcXEvrnfgVEcPBge",
		@"iOQLTiMRrLGypbFEE": @"hYoJMDCPPQtpdxRHzzSqMWPCVSPaRanWYSISBVEfEgMxnDybllTmkujXDWbfFiNyqGeLVEzBDhkhetLUckxvDKDqYMcCcLfWKemcyoewPwtqEzLxHvbpdpIcVXOjNNxYUthzUsoDYwO",
		@"PTOTpnhWVeOwXHwVrNs": @"GEdBkGOfWKirxjpAcIHadcDbKLdvXHoRdKgezHVAygUyFBPJgDXAHJWNscuHOGlybwLpApVaTjGsDVBNGBBHsvGNulAMQJyAYGZLGmFNFPfXrOWrcoFbscoCUOjocWdORFhwhsLsveoLo",
		@"leftaCJDUCBim": @"dWVxxpPsSuPcrrOnHyXUqBCxHsjXuvypSjAUhJZaNjlHwBnbImFHFwyZKvdPzDMLxgBJARpXcKKMQRXBdGhdyYINGZRtwLWUlZvsNdaKyPCoByvoHycWXEGnQavL",
		@"jKKYTPphmRE": @"WJzHOYkkmMrEoHEGqxJXpbAvBxQzvLsRbwcutvzmXfnERAVUvGLdAXBFpgHCJqpVCLLfxfsLvsKTrrUpFEBweVWTVZZLhUnPeZCjHFwUuOxTvkcqyAytLmxSDcKmDEYeOnetGumYIoE",
		@"HBHNYyqcji": @"FjuRqDtblbDxpvnTJbGBburwHTmENPNOQATjgYsnzlWospaNCbvymVmQSXPBaQbHQrXWwgrBRmQGqHiotAuSOzYjtSTRhrTUSYWYZwYUbb",
	};
	return pnQyRJiHexzAfVC;
}

- (nonnull NSArray *)iaEiAqKUOJxxood :(nonnull UIImage *)vijjXGMJLhHrs :(nonnull NSString *)MQoEfrIBrT :(nonnull UIImage *)YmaJVAxkqzmfjVFlhO {
	NSArray *ozkKxYykKKb = @[
		@"JJEaOqhEozMCRSJPjiyZGqCNGVOSdvNfzWLIsvEqXWWVRIwTsajfdjWrSmEMjRZGGDsCopNCxhvQOEcNwOAErZSiUZuuopayVnCBbZQytCfKojMKSJVrZOOzyVLwMOghpIlQUHj",
		@"jnNQRkmqRhRZChmbbzPSGEghLxQMMJjEFDfvmSVlfbqRtfyZzVQxJGyCTwsJZaIlNpGoroxUAVcuIletZGSYqllOQqCUzmddYLWyDiFBBMHWHYxlbGbyOnIlkbjKmUVbnypEiYMnbgg",
		@"IflPSunVfJJvTayBGzGEfZQEaaKJDdxMJUQcEWjeTKJlqsNqoZfVzfpcSZZfYbOkKDdGvdCsBoORMVbOrdNIajwSMOQFhigpEyUnV",
		@"vfHCxBhzDuiAyDguqQdKOIbAofvkhNdIQRRElRwAexJVXryKwnkPwUEKIFgXJZbqDAuKihpmWXXPoBvdIzaoMYLbSTbpXHCRkwvZtjRrljUbRHaAUSFMiAYDtLbOTZoQKh",
		@"SvVHoeFwuwWqxptCxqcVsfRdHqOPqRJToeWEORFkdwcPAuPOIJJlFwSkoydvDZKqUJrkDNPcaWHsuGAnUdpABinCHGLeEhiaLuWeqI",
		@"IyIdKVHfceulHaHfeWtRLmcRzIOGiySDJoTaxfeAAiVXsEhDdoKShuakseQmHqwbPTEvkuqKnMUBVqmFvgOJPbItoHAEYeGvgClTkeXYTTBprAjEUYYfCgirmAnaOW",
		@"MoxQNsvpXsldYuqXbtyNwCKBJHeGPejWDmDEqPfDEhiaNhyfzQFJesrGQkPjXEOltRgusVzgcgvXkcRWCggOVfUBknpKExnYITSVqUJOanqcqlFbpUzlbXhkYXDHOBvbZNjRRNU",
		@"ubPsKCqwliPvkFQHgfaxZBNrNhXEToFesbuNRXdCUBgQiYgLswoIQeDawWMtAPLOAIzsMuvGXvhSQDFGAJwGnfWbJfWZmzhhbZhEvOdZqbOEBHwJmKcELDapFKuaPSiHxVh",
		@"LxktSWcyfPxthQUYWckXhhQUjDveYFaHFeyoVJhSmkwQSQMCbrMwEKhbKwklwhFNrQjEKLnIcVcjRlUYCVlcbvMIIozBVkcLRGjBFDwczudqQXboE",
		@"xLLRdPOanidzYvptPTcBCIVQcxSqAWHMrHMJstJqVMWKEZBEMcShbVqOeYrFBgNqolBYyvILfxZzCSYpPAelUMTvjsReJvXeLlhftQvfystLHNDEPnwheUUDMw",
		@"JeSpsuZEXlwnFrKguJBlNruEzCcIgFNlkBghMAqMAXTlolpgHazNenldQWwlwPEyXuruKITooHpNcdRNZZKNnKAzZErXBlaYZnFkYoJ",
	];
	return ozkKxYykKKb;
}

+ (nonnull NSArray *)VoSTPBZyEE :(nonnull UIImage *)iNcwRddkShKQXOCBO :(nonnull NSArray *)qkWSzGERqIRt :(nonnull UIImage *)GGGoEqxZHXozE {
	NSArray *JcLxyNfuSSA = @[
		@"dmLDFdHFuKRAdnFkaXaAuygGeyEeUEGGvMwsIzRqLFjapjoUVixMCOPOgmARBaHQnIQUHWcfFrNpdAyKDezfmjRHBeiGKTbIKfOWUubXkOTlHfjwvXLJveIOpuQRLAiCCrR",
		@"SvyTNfYePQUoENhrovxpMgLAzKQzUmhIQPqPZQYzdbehFFGevPRJLtqHNykJLGCMGOwXxhXlDhUpSGDVLOemPfQAMLRzHhEZYBHwCDSSoGCpnqreAFMUABkrqHFyQmYthXqszRmXEQW",
		@"yXmkJVxmfpUCEIVHvDAvnyHZuRRjwgUOpGdloGoEMOruaXrHvYdngYldVdZtskDZdQIUbctGnAMmiOAgdolVixzzcIwzYshaOsVFMIzMHgzlmXOmrFppRKra",
		@"PWBfvoeFKKWmyNUDQJrZQDTsFjLnQLYCdssLdabuNdArDdZddqmDaSYRVcZvrHomgjGrLYzuacXbVInTzcszxqISgeHrIPoSiHXaefawTOPvJlcFFYVokEWHuQRVovDS",
		@"DLfSYoqeFHYsKPsJyDHXeRXjVKkzLyqPTLqwQASJFGOEkrkVMeDwFpVXztHBjUHMECIcoTAsRnJXXcVtudiWRSWuZQWxjtLMsgbzdOBWErODdse",
		@"iwzUJPLttWGeSloQdfBHGQSycRQrqTuvvKxQQrtxtsHeTPBPqIGnoyVFFigMbSMhcBQwTXSJugqisahXESNTruUDqSSOWpcBFyrNeVhmWVVcrmlb",
		@"jlLFZRxEuxyhLKtzCkDNqprleuCtnpMNgTwHIEfuaaiUdxvixDcgPPPCkAlCymZlWQTASxjQDKMZvFVhvldqJcpssvuCiqRQlpZsOUOcDxRCTCRRDQQhSoJqCIVUBkDQTLWpG",
		@"oAaTLBeEoEtVahOkiGFzPzGdhqRxlfYINVNTeNQnlGsfnXOBARXeRAamrflcASNrhvTetIsfAYZKgEMQbXGDUEWyBceaDDaDXkdEBXjGSxotgYLrDpCEfYBlSOVZQLQWqsuTWAW",
		@"xprHKHvGrRpPnYjHqqAIdoneZUhhOUZCmtjKbSGWeSxLggcNjxKZxEPvibJlZXMavvQSaTQOJCCBPIthnsiwptnhEcumQYvdpvJorVZJoNOzSWvzwODfXmjzkUTfzEEXmjeafMugYSrAeGh",
		@"vYIwUTsuooVykYghxckkQmWnGSRxxROfsdNDAnZxWwxNwbZdltztxvVLXwmZAqqhnGFSNdbEJktyHAKTyDfzbQmNwmpDHhCtiHQVpWgqxsaCkOraMUfbZThSKOWylLMNKKOHrMfyLtMriqYMdvYy",
		@"GEegcmdDjPBUkuwThTnisFOlFjZpwArGZdgtDkJlglCMCwUIwayiyYdIBwecmynETzuCPgpvIUbJaZBnWDlbUpGszdQuGKcQEIHJDwYCYVCkkWWoAvcDsqynsctLCtSRFPDrWEjejjeGXyYE",
		@"eGgxbNLgMaNleXHDeaVRHuVCsmcISgxTRkEfJFUfxekxYOHqSNrAKxxelRncfkhMsAefdAfmPPgObwCihZtBHiJcSitciRyKXKysVJRbfFdOyMNmG",
		@"JObRuvbTOZYrexvUwgFOBhSMTiJUAiHTJwXUJVtkUqLVskkrYKecRizXnXCgWvhgkOSWtCECUFgQmDRpCCAnRJHXRbnAXgbOfmjitcykWWAvfnsmbGrEpfqLssSxyqDhGKwmIT",
		@"IEOssuvlloZxIDRknFbuMiFdoSVDgMHMFGJZmKsOPYEfLjyxypjztKcXVErYJBMnLNxQXQUwfqBCFGeoAuXjEIjMHBuRJpRAjSltWVBhCxtPHVekBqWggwLtApFDmzqIJDjMQXMj",
		@"cNzbLsXhWmwxPXJeVqmRWyYnFLNqlVGQmwvPKmqxaYMVEhHHNEKuAgdGUXptydjXDvwFmrTLsUBSFwMZOVghjKhnCMFZnHtvFJpMdOGkqVdFNyjZfhRJGagDHshacWCMLMPKAVnjWWohQD",
		@"tQFfoVaCBmXpAcvyCeLMvIIYKKRtBlBeswNsSKiZYJAzwMpERCbZdsjUheZgJqoWIKclLbDRltPoUAGHTcXOwtTBJShjGJnHnTrX",
		@"cqBNZVsurKtcRvfWeUnSsLmXEZDjYQuWcNpyQwwXMUYxRGxUWralZIvTdbnzEsEQgixrjNpUvwdkCCulJNfyGhvlDlHiHMqapbPHYBSpkn",
	];
	return JcLxyNfuSSA;
}

+ (nonnull NSDictionary *)NkaXkotqzqzo :(nonnull UIImage *)BCEWJDyuKpJ :(nonnull NSString *)UxbeHwSYKM {
	NSDictionary *JcMgaaEEqLgcN = @{
		@"fcLduXiIwKVYRwQBVmf": @"vVTdoqcryFiFuBRGjdLNwjWPnlbFZTpuyPfRtRfjfnShyFOXINXJTTSlFqTLZKPUppJJNYlTbOkpLpjkXUfPoauzFhBqGeepEyxuQhMC",
		@"buaglNSOcUUaCP": @"bmgOstgKHToQWAdGxZSJnNnWDaozTlZpzlBygemuDmBsUxXvGwBBgARSnCNGASuItxBtSwdcQRzXMdoEBGcbkBvudIwSSzIlqNVbECIL",
		@"RXFrEawhnSEn": @"dlhPeRdCpqFsVbzyddUXYAYjjGVvjeEFqKRfgZyWdGWtbqegkpDaJttYlVjUGeWORihVgutTvkCXwKEwHGAMcevWnNlTQzLoyPEBbVXXiQkR",
		@"uClhPpIBTaxerlDc": @"oJAnHvanmJnLbUbdNHBxmmMpGXRiGxEVIeYOikkfxNPoLRnJOTJeJRQlOoApwSwnHejLvUArOQxjQlRWysureeMDhRJTuzKSCZbYLvRcChcTMtaqXGqOnGcTmXoRVkVUoYLsOiKDSsEgwEPW",
		@"xlbPcybKmnBu": @"NQrJaqZXcLbBTKEeOmhxUAiTtEWDDhOFhnwPnWaYIQifPURhxjmJnkYNAnLmTKnoQagcDduurKYQgAmLrGTEaoBRcUCeKYYFVyeTDHdVMtOlOyg",
		@"SLdqacKxJChLFa": @"VQSqaoAZhTxBpfvHzsSxZFHPBvOLLykwxuVFjafcuuICsiZGHtmhCJciACGvyBsQbOCQDDVorXLfUCidGnHykARNzmlVPdNBNuSlDPwUCWJAmQwHQEzzOaIewAbUNRMSfkRMdigUOlcWmj",
		@"kmBJWtogdGQz": @"kALdavuiLMzbZKVgWvIFYdpCIzPZqOMUXBunTLwXIvjxXyTjoxABcWQjhzoKYYrVZXAbcGHAQTEAmswEYxIzNjgbefZmykuorlnMYmhURDBkkrNSJlwsv",
		@"WcJWcoZelt": @"RJXpezgNsrutlqmsFdKzhXTUjYPPLHXKQJPAqoQBdhvAICeRCqZvOpRhvsTkOeHKfKJWTwAvaNdueGRiZXWCONGVaEYJVexOtKYokoSmbeVIfYtHbypgMtuxGSTafZGWCoCXCBUa",
		@"PdiGluVeixJt": @"uHLRjGJXcHSZhjcwwUuowClVfcBmULglIaOWzfmyxtAyaQoNrnHLodDKZhKMSFCvjLVXuPRXoJDTzcDTuORavCEMHkagjRQdAGeiqUrecqgIEWsAeZfBmHjQaUbDpeDd",
		@"LnHQyGfyqYUNN": @"qqsmFZugtCpQPgNJKOqAtcExQZTGtTcdEizKcAkWLOblGMDarQTMdGkhOBqCXpVkSgCINGfBmvOAfAovJzIGFQjZocqoWeIDhLeLWsfEVgAqhluRCpfThpxNgMORohtELxtqFXkgvR",
	};
	return JcMgaaEEqLgcN;
}

+ (nonnull NSArray *)weUVWZXJiQeyd :(nonnull UIImage *)LKWNTsoFDhXYvgoQS :(nonnull NSDictionary *)QhrfYUaOlKT {
	NSArray *XGUigfBJBi = @[
		@"tlwTetIowQFHgZuRLBVuiXXbaqalfBGpoVMtKydMvcveKLTrtCdGdgGcoqGPXnEOwDkevXpNdGhoyQUmDmdIvsaRvfFFFQbRyWpHjWjvgKDKaACqHSjWKgtquJrgB",
		@"hJIncfUJnsgUmcuWjJgAsYjfcgjysBgVuGeEpJZPwOyjCGUBFyLKgoBFyCFHoImiFKIZVODrzVHyHRywnqHyzijKLvbBZvClBLYdYJBSlYrIbZZiwEcQxsInCwTrbiGwZLVJubuZqnB",
		@"VVVJZyFtuWeILNbOQLupiHRfzyAmbqRibpBsnKHrvngEtrLqqkDSXvnvOoLvqHmOGEjDfIATNjdYkIlsGKiyrDMtsMVSTEbvCrYKqkoQNhsKvNUorbxGIo",
		@"rawjAldQZVjXVjViooqKbLXzgyxgoFaUphuqMnkdeZwRHZfXnoslKaUShdxEFoQKrEdbTtVfEpnaQGZKRezqxSQjzmOwXAXGjwDckSinRsNYV",
		@"eXQzNirfnjtwfAONyzwdqiMpGmztxMqaDlTbVuZgquUUYFsuOZIOlBmeFEYmFTXWnQroiTjHRwLXPTqgaRrWDEqhyMuZDbwYowfxqzldhwcvQDQkofPWKnUjuBCVkgemoRr",
		@"PsVNNkZgQOylAZDbUZwcsbbdZJiQDexdiQNwcJAHrsyQCtnzHHDmEDuBKJwGuqFxAerbTnrqujbhCySVymwEXSWziKDGkxZIQykBHwwGZmufNCztVvQEcsbxmqByIKuJtgoVVEiiESzfA",
		@"eVraoOpTeQkIRQdDDsyHZLVvGYKOZHoYhfOjsPlyYBLJyJEuCgqrlCsWkrrdfieXixnyJsqVsWNmgMURgjYrSlMSEqEHDoyWjIXzXxIpeyjnWeHSlcQmqVGAOWjuPFCRMxXhTuiMTEYtKFBklXN",
		@"KkKWLcfsBkxYVzExNewNYJquiEZxeIFTbUROFxhGxWknYkrmBcxqdMdBqVQMCRvBqWKrdUDOTmPbjdjneEzknwsdjJJjEytwGIiZveqefgiRCE",
		@"cWEqNvXCmUqdinhuBmaWAkylmDLpKdzDRDLbZLOzBYAYzvEgqbphGkcYUyMLoJAcbfkjbjkvVClKGkwaOjjRLTYLSGlWZdOyFQZRhHMvzltcNhXLXLctSzQwHXwJAfhJoiIiumXvMXuMbjtlFked",
		@"bmPhGIWrXsWOIlNYtUQTfbHYEdHWrCLnGdlceLphyZtxAplsbDCAUakHvqsUHOLodvzLyItHtYSGihzONVAltfcPzhzqksuxiAmDEFCkqrELqfOzPgpmflBZ",
		@"iLVXRuhLKVQixOJqDJeEoEWXaKhGtjRsAHnoAaLNwcamePYcEquVQUHFNTwXIxYIKuvPfcBQTWkNsmtCILIqTmWDefRbFTXUNfmMFhZyiCTopDbpCt",
		@"TrPgIjRiElVwvDWeCGTrZCntYDzjIhLGPWEdUykImUElnajLWlFNiqWBCPIdlBuMRZodhsWuJFeTJzdMglygpMAeRhQEfmhkETkcaDmsVSIvdylCiSrvmrhaLzRCbVTVXYNOcmzhpgc",
		@"ZxZCkTsJEoXiLgfeoubfzPjMUIidxFwtZursSYmdqLmPZmdJUiZYFszwDfLfQqsCDVryBkoHqKPrYATjgUBbgVYHwyXOKZIYXnzfNk",
		@"eOgcmMlnwgtZbadkbVXweuLNFFXHqvrVvDPmawGDiCoRnULrWBFFhnYQdLUBdOrwpDmvMbiWLIVTpHfStQsMLKFEglIWNCudcvoOdBqHFJXJnjk",
	];
	return XGUigfBJBi;
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


- (EMPlaceHolderTextView *)inputTextView
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
        _selectImageView.image = [UIImage imageNamed:@"publishDiaryCamera"];
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
        _deleteButton.hidden = YES;
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


- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.font = [UIFont systemFontOfSize:15.0];
        _numberLabel.text = @"0/500";
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

#pragma mark - FSMediaPickerDelegate

- (void)mediaPicker:(LHSourcePicker *)mediaPicker didFinishWithMediaInfo:(NSDictionary *)mediaInfo
{
    [self updatePic:mediaInfo.originalImage];
}

@end
