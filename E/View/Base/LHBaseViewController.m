//
//  LHBaseViewController.m
//  LAssist
//
//  Created by 大海 on 6/8/18.
//  Copyright © 2018年 An. All rights reserved.
//

#import "LHBaseViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "UIView+EMTips.h"
#import <Photos/PHPhotoLibrary.h>
@interface LHBaseViewController ()

@end

@implementation LHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
                        [self.view showMultiLineMessage:NSLocalizedString(@"请在iPhone的\"设置-隐私-相机\"选项中，允许LAssist访问你的相机", nil)];
                    }
                        break;
                }
            } else {
                [self.view showMultiLineMessage:NSLocalizedString(@"您的设备不支持拍照", nil)];
            }
        }
            break;
        case kEMSettingHeadImageTypeAlbum: //检查相册授权
        {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                switch (status) {
                    case PHAuthorizationStatusAuthorized:
                        if (complete) {
                            complete();
                        }
                        break;
                    default:
                    {
                        [self.view showMultiLineMessage:NSLocalizedString(@"请在iPhone的\"设置-隐私-照片\"选项中，允许LAssist访问你的相册", nil)];
                    }
                        break;
                }
            }];
        }
            break;
        default:
            break;
    }
}

@end
