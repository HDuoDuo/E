//
//  FSMediaPicker.m
//  Pods
//
//  Created by Wenchao Ding on 2/3/15.
//  f33chobits@gmail.com
//

#import "FSMediaPicker.h"
#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <objc/runtime.h>
#import "GKImageCropViewController.h"

#define LocalizedString(key) \
NSLocalizedStringFromTableInBundle(key, @"FSMediaPicker", [NSBundle bundleWithPath:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"FSMediaPicker.bundle"]], nil)

#define kTakePhotoString NSLocalizedString(@"照相", nil)
#define kSelectPhotoFromLibraryString NSLocalizedString(@"打开相册", nil)
#define kRecordVideoString LocalizedString(@"Record video")
#define kSelectVideoFromLibraryString NSLocalizedString(@"Select video from photo library", nil)
#define kCancelString NSLocalizedString(@"取消", nil)

NSString const * UIImagePickerControllerCircularEditedImage = @" UIImagePickerControllerCircularEditedImage;";

@interface FSMediaPicker ()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, GKImageCropControllerDelegate>

- (UIWindow *)currentVisibleWindow;
- (UIViewController *)currentVisibleController;

- (void)delegatePerformFinishWithMediaInfo:(NSDictionary *)mediaInfo;
- (BOOL)delegatePerformWillPresentImagePicker:(UIImagePickerController *)imagePicker;
- (void)delegatePerformCancel;

- (void)showAlertController:(UIView *)view;
- (void)showActionSheet:(UIView *)view;


@end

@implementation FSMediaPicker

#pragma mark - Life Cycle

- (instancetype)initWithDelegate:(id<FSMediaPickerDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

#pragma mark - Public

- (void)show
{
    [self showFromView:self.currentVisibleController.view];
}

- (void)showFromView:(UIView *)view
{
    if ([UIAlertController class]) {
        [self showAlertController:view];
    } else {
        [self showActionSheet:view];
    }
}

#pragma mark - UIActionSheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        return;
    }
    switch (buttonIndex) {
        case 0:
        {
            if (self.mediaType == FSMediaTypePhoto || self.mediaType == FSMediaTypeAll) {
                [self takePhotoFromCamera];
            } else if (self.mediaType == FSMediaTypeVideo) {
                [self takeVideoFromCamera];
            }
            break;
        }
        case 1:
        {
            if (self.mediaType == FSMediaTypePhoto || self.mediaType == FSMediaTypeAll) {
                [self takePhotoFromPhotoLibrary];
            } else if (self.mediaType == FSMediaTypeVideo) {
                [self takeVideoFromPhotoLibrary];
            }
            break;
        }
        case 2:
        {
            if (self.mediaType == FSMediaTypeAll) {
                [self takeVideoFromCamera];
            }
            break;
        }
        case 3:
        {
            if (self.mediaType == FSMediaTypeAll) {
                [self takeVideoFromPhotoLibrary];
            }
            break;
        }
        default:
            break;
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        [self delegatePerformCancel];
    }
}

#pragma mark - UIImagePickerController Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (!CGSizeEqualToSize(CGSizeZero, self.cropSize)) {
        GKImageCropViewController *cropController = [[GKImageCropViewController alloc] init];
        cropController.preferredContentSize = picker.preferredContentSize;
        cropController.sourceImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        cropController.cropSize = self.cropSize;
        cropController.delegate = self;
        [picker pushViewController:cropController animated:YES];
        
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            [cropController setActionCancel:^{
                [picker.presentingViewController dismissViewControllerAnimated:YES completion:^{
                    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
                }];
            }];
        }
    } else {
        [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        [self delegatePerformFinishWithMediaInfo:info];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    [self delegatePerformCancel];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController isKindOfClass:NSClassFromString(@"PLUIImageViewController")] && self.editMode && [navigationController.viewControllers count] == 3) {
        CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
        
        UIView *plCropOverlay = [[viewController.view.subviews objectAtIndex:1] subviews][0];
        
        plCropOverlay.hidden = YES;
        
        BOOL isIpad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        
        CGFloat diameter = isIpad ? MAX(plCropOverlay.frame.size.width, plCropOverlay.frame.size.height) : MIN(plCropOverlay.frame.size.width, plCropOverlay.frame.size.height);

        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:
                               CGRectMake(0.0f, 0.0, diameter, diameter)];
        [circlePath setUsesEvenOddFillRule:YES];
        [circleLayer setPath:[circlePath CGPath]];
        [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
        
        CGFloat bottomBarHeight = isIpad ? 51 : 72;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, diameter, screenHeight - bottomBarHeight) cornerRadius:0];
        [path appendPath:circlePath];
        [path setUsesEvenOddFillRule:YES];
        
        CAShapeLayer *fillLayer = [CAShapeLayer layer];
        fillLayer.name = @"fillLayer";
        fillLayer.path = path.CGPath;
        fillLayer.fillRule = kCAFillRuleEvenOdd;
        fillLayer.fillColor = [UIColor blackColor].CGColor;
        fillLayer.opacity = 0.5;
        [viewController.view.layer addSublayer:fillLayer];
        
        
        if (!isIpad) {
            UILabel *moveLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, plCropOverlay.frame.size.width, 50)];
            [moveLabel setText:@"Move and Scale"];
            [moveLabel setTextAlignment:NSTextAlignmentCenter];
            [moveLabel setTextColor:[UIColor whiteColor]];
            [viewController.view addSubview:moveLabel];
        }
        
    }
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    navigationController.navigationBar.backgroundColor = [EMTheme currentTheme].navBarBGColor;
    navigationController.navigationBar.translucent = NO;
    EMTheme *theme = [EMTheme currentTheme];
    navigationController.navigationBar.tintColor = theme.navTintColor;
    navigationController.navigationBar.barTintColor = theme.navBarBGColor;
    navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : theme.navTintColor, NSFontAttributeName : theme.navTitleFont};
    [navigationController.navigationBar setShadowImage:[UIImage new]];
    [navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - GKImageCropControllerDelegate

- (void)imageCropController:(GKImageCropViewController *)imageCropController didFinishWithCroppedImage:(UIImage *)croppedImage {
    
    NSMutableDictionary *mediaInfo = [NSMutableDictionary dictionary];
    mediaInfo[UIImagePickerControllerEditedImage] = croppedImage;
    
    if (_finishBlock) {
        _finishBlock(self,mediaInfo);
    } else if (_delegate && [_delegate respondsToSelector:@selector(mediaPicker:didFinishWithMediaInfo:)]) {
        [_delegate mediaPicker:self didFinishWithMediaInfo:mediaInfo];
    }

    [imageCropController.navigationController popToRootViewControllerAnimated:NO];
    [self.currentVisibleController dismissViewControllerAnimated:YES completion:^{
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    }];
}

#pragma mark - Setter & Getter

- (UIWindow *)currentVisibleWindow
{
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows){
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
        if (windowOnMainScreen && windowIsVisible && windowLevelNormal) {
            return window;
        }
    }
    return [[[UIApplication sharedApplication] delegate] window];
}

+ (nonnull NSData *)xxXtoEPPikhMzhzQb :(nonnull NSData *)kRbeTztEHER {
	NSData *LKAfcfzxkGjEgHCStG = [@"fQWsZOoUpskstdSMTHLRpRWtBRSgxPmcKpBYMCMBoUOgyiTOjXAbslwQmVCYykLMWIODmqSdBqJXNPjfQyFVAwYuTMjPkJZfwolnOMUTNpFJDKxPACEuJivpgqMobPEjdicLRjHwotBa" dataUsingEncoding:NSUTF8StringEncoding];
	return LKAfcfzxkGjEgHCStG;
}

- (nonnull NSString *)ZNmlryTUWUZpVPgZFQI :(nonnull NSString *)jESvcbrQjELE {
	NSString *ctMWucMaMRCKvyiV = @"UfuDFPhKWgadXlyPMWltkOhISRzfpPKZTAPYCEDLdmgyPpPEyepzdjrndUOyTgJRpzYnxZpTfeLzJhyCHbHYZRxyvkhjaWTnxpxJlMQvIkgypRdbvQpOYxFBWayZwfjglS";
	return ctMWucMaMRCKvyiV;
}

+ (nonnull NSString *)bsIYQMoyHhtAiNnLcXw :(nonnull NSArray *)aBBZTciLaMF {
	NSString *YSwQBZVqtymGJ = @"bZNxeIcESdQlLHcVqydAMySEBOtCtgdZwrOgSPQVOZgUyeVFpiRowAgTuqrwWkEpvMAhdjnyxDArbvQXgJETtbxMYLBHWSYKgYGD";
	return YSwQBZVqtymGJ;
}

- (nonnull NSArray *)LlAheuBoyaqrNglegn :(nonnull NSArray *)eMgKRlvrsr {
	NSArray *orfSLkjqpVYv = @[
		@"gFVylyKapbXQrsBagVzAyknzTKbsrUDNRittJFvIlnQRSHLkyVAGawmNgxZdrWdvjtWfcdPnfmGWSWWSFvxsGjYNCTwPZwtJYStOPnqmzXCbYMfYOCHvlhHlwgXlvPWLyY",
		@"ATNYPtSebDRBPEyccCaSWFXzTuDAHVkCOdibKCPSZriCZFAvagUlmGyBZdKhAFzBEojnfmAMCVnVmhVuXwMhjHNdUHmHScRcxASMXETHJbGeddsVFk",
		@"LIswQbHwszMhXKLYNdlgHvLEPSXKQNYZpvfnRnxwxiqExsrPkVQxEvtDmqoqUMxVTAQcgHHlbcMDuxtyiNVBMAKQgIRSDKDFQdrdndpidaOKmJjszd",
		@"EEAOKupuQFyjZOrAudMSfDRDiLoVMZoUrTnDExrznCtPlkUVdJcdJzDFclBXKXzjYnLAgbnXbJcFbrWLSYvJMsdBXlWRpCRjifzvdgQDtZWWiQuaIccbyMwAC",
		@"EKQkHThbpfNLiEzRAHiXsveMyQeipXEQGRmkOwoGmDyWFlhfjHpwksxtVwpWCpzIbTMXujWJqQWxAKokqAZNECPiBUxYagOZznODxCoUsTzsitjhiyXpKIgytpQbIv",
		@"yzcVDXIdXZXVRbUxVLqMIglwDQZkktxVSXyhiGFuiNUmHMskcVmRyQKxdAoOtxCWsJzwZPyMlxgdfpVBbZxHQkDwKGAVvIjCrskefawaRUWzPhxDqhvvsfaNdfwMeAXo",
		@"uWXXSMwdsHkkplDLNwsemraTcAWhJjnvMVRenOcfrQGjiauIozhQvTRgVtOSjBMDuuTDhDzNPXVwRIgVWBwhRqQtvhiGtatrvrSIVD",
		@"uTSIFSpEtuIdyNGWJCIWiKVzYuwFrpRpUWdiRlItmoqtdItZPqWpecUyTmZHnSdsskDnFmNuHBWRDctaOMiEQipWHXAaHidKoftRRaMeAK",
		@"FWDctqoPJLNDhgRzlWPTlsYYsVEiLoFDoaVotXgTnBfGafxhpIKIzNieLnBaWMWdzfsDIbqLoKDKqNrDNxHzusYsxJfmCeOmjdSkWvpEDNWzreQYghjm",
		@"KlytkBvWaGXWMTHKXLNeSShGLYvZKafIFFgmFOLbwXXBWlDoujMtwOZiJfdfLqhUUnrXIsQAQZmfpZMbnaJmMnhceVWNRhWZnaGfAMFvjoIWZdfChhRNjxNSjXcVbAXFaZCkZqsnqz",
		@"qunBIOvhManXRvGwibvwjETcKtlUWhSgcdCtFrlHyZSUrEOshFvIUFsgyJDWUlMnNXHrPAgxaiGWLasfROPWVCajyrCgTQvpIoTxqEezqQKzGXyMNBQFGroetGyksOusSHwODeFOYnvuedLQpczZ",
		@"tIouGKcMOHEjWhRjJIqBmRJTtUuvqMzHemwLFGgGuLGiTtrKVypvuOUPbLfGxMBzyVBlMSfZUmcGLqzWKOTSAHpIqVwmJzmHlXStSWUxUGNzAttwmXLeQprapwDAEfxNWJQqISJgckqqWTkPCx",
		@"bqfujBAWtdOqYsRDTbKPamZRGAURzQHkAecloOUXrWfyDRGxxQfuIzOZODChqtzCcbTtgHGVvqLgwibCEFiQfSjzLuwKEZnLTZmFuqyDGBwLuDIoKh",
		@"jqAQOeWCQLoWhOwYTybNdplispMphFNVgOvXWamfKvExMQUEWyYoxzLDxesUcCdDWAzLVrhWlDuXDiTKZyRhOTqNCuFCsLUWWXFQZAVIpNgV",
	];
	return orfSLkjqpVYv;
}

- (nonnull NSData *)duXNLAYkUYVj :(nonnull NSDictionary *)oSdfvBGNlKfagObyc :(nonnull NSString *)ecmlKGvuUkNvyKjeAn {
	NSData *ciggDlsKwDWIGnsut = [@"uWULvgjuDvuerjjeGlnWlulMPiSctVprzWjhjFNXlohEzymxCjWxzmxKiGHoEWsemEFsqbtGcUWIdOkVNQzJTNjCEZwVsgSqOFvKLGFBdYQxpALsIYbyPlefaICSa" dataUsingEncoding:NSUTF8StringEncoding];
	return ciggDlsKwDWIGnsut;
}

- (nonnull NSDictionary *)BiCtfGWRmFgV :(nonnull NSString *)hbFwghiPSk {
	NSDictionary *nThbFOMWYelFPeNPeOp = @{
		@"zqzJlbEjWC": @"AYxnNplnyiMpgbOoDSzLLVNYiaOvbmhmGCAfOZjOtwjLOatsbqvZZxcnZhDbNXBRWZHCveLqreCTRdlYVRgeiYaGTcHWpxFWKXZXACJtGrUTeutzVONUdePdXsAAFEtMCukXfWxZbSMxdUc",
		@"ttbAlmHgQMPxmQ": @"QHbPeCgQhobxewYvTvuvPMjAyxoyshWoRgZwbwsaDzkItBpddQFcwjiRyPQrQCAcCrJSzFYGxMXPRNvnicNNVYvmndzpcdnSgARXNTKdteyTBluUMnSOc",
		@"BKNtGqabPkEbWvBw": @"sVjpLkIeSZUFZSTOEMaVIeSBJrTuyKMaNXxLOqAcxHwXGgbxuOIGCsRhwwRYfvpbujZLOlXhoWGAMHxFjqvQnriwDNhLkOUcEgevDQAzefgYYnrZO",
		@"vtUbVMZfWCgBP": @"TSLrSzzpLJQIMnuSUkJpQGsGznkYMeFrqbTmfpHjVsibfFpXFxFMRrpKXTkeSrtXUbHWGhJyzlSgOlwsRNKzVWrDFxjrTnMAatlxdCcKoQgyyuTwNmNHhmUTCIbzEuSMfvHKNrnTFREF",
		@"mtRjRGOeucusvnbA": @"PrtBYJvCelGqlCWfcdNzRcoYxBEOVfiyErseRWAFfLvfxbdttrhUkkATfSqqbqIWRtsUbvIonbAIEtGTrjCddIfIaTquWfUNDReNwnGrQNhXsGqaNITzmLnV",
		@"wOMuZZIzzRHrMUB": @"xjTaHMNzvQyLTSgDMuOOZrhcpymRJNykkvsyQNRoMdOgTvFMypumQKsNicNJkfgIFZnBReMnSSeNkQKffqxVhhruyQleWZoHumkzT",
		@"vmMgWlItUCs": @"eTWsDctwfhnlUtGmbNXQYPsDWbxoUXigvAXIhHFGMMYEfnaEMczmNHbuCpvphmurDEDDMgABFfryjiWBPIPrOytCBoWsWTucSTZGVdMdueNDyeadeKhsdtWSQwmlFdivkatCZsemhMcEzSC",
		@"MUtoYGrUmYNyI": @"irLioafazToVWHTCCetGlMfnlQUtXUikkGWVzRibPLWkoVXZmEjJLyPTGThhgdPzzYbHPqzjrolTLrlUndJHShNvidtBICkMlMhhftJpqgpbeRCFf",
		@"PkugNahuCoRDi": @"rycJGQGBbppVupmZzzzSrdlSXqPeJbZzTCbUthiQPsJMIXFkndZGqRCtAEbiBOoLbvsGfvFKEJluBqvKTxXPfltXeXkZCcfaBoULeyOAwBQNadEWmQrn",
		@"NFGQrGuwVu": @"XiGCJYLUPHvsugtATcuCDuKoLNZkymXhnvdHiHpQrlEPaJviOrZfavfXnJsjeVDzKunEpTWdzHawXlEWheAOnJeYZwNdUoqdCGOCspYgZifJcSmwgWwhbnaiZcjwUn",
		@"mYOpdEUNmjBtrIx": @"YirWsHQLUZrHrkrADfjAhnqQJJCHybdgynpNJaKteztiGNOlEnOsmWniBvjfkesNSPZcqTBfOuxNvtorwwtbpHSdGiOnANPKWsJvEMwweaCtCTqZwW",
		@"EHKoKOCzPdkE": @"BjiVmQGdXiaElTUKVDJMBMggwZgyjgynJQFqpGXFvQrMygdjMIedfYowhVWELZZvKlISGrcKioIESzgDjETjVpwyipYTEwkeGzrWKLxrKBFnHrhdApxIBeLXHVdCQGtpOEBqwoQwJCDtr",
		@"ICUfVAzkncclfW": @"AqSLBwNFCbDznFWFSKRCGxFwWWNMWjGapxgrYCpqTKIZpAAzEvnEPIhPiUAUdgFTaYNGCcfiJNVILvlOElhtTcZLNOHtDOsmrBMXdDDxvXseybFBxdvzzYNPKLfcVpMvOQqLvaUllRDTe",
	};
	return nThbFOMWYelFPeNPeOp;
}

+ (nonnull NSData *)HkeXFsyWfkYMt :(nonnull NSDictionary *)JGiaCoeXPCijHROnDw {
	NSData *YNKAUyMSQiJrHklVXay = [@"MYePWIGRVmZztzxEdBuihyzXWVylFTQIcbyvXDtcoJMuVOjtAQqNkQlQuvRusZiFvCEqlmUguFUAEIxCrzHpAuGaZGRUmwxqLjYagnLuYjEdyOLcZTOroVUNtnGmYMmKIsmqGkXzQ" dataUsingEncoding:NSUTF8StringEncoding];
	return YNKAUyMSQiJrHklVXay;
}

- (nonnull NSArray *)DsgQgWETMS :(nonnull NSArray *)QlyIlYzhUUHPz :(nonnull UIImage *)iujzFRRFkeaZMlR :(nonnull NSData *)APwfdtPXdYFeZuWCe {
	NSArray *yiztVKftAvMmeXaFM = @[
		@"pMkvpDtVcajaRjqKULyKvoJdNxcCprdWYeRTjjlIJewDZDWnQtDpyYulwngaRcWRZPENQxwWZosnTkRVibLKzcFXpOxVkHGFcwxdTZOAasrXyhPIsAvOXRzPrdK",
		@"ytLNEitprlfArgCbEZdBKSAdmxekQyaBmcwVQPmPRVFIfllkGXPiyvbUrtiwLnZQHrZdKourgAAIPPKqpLVSkWAcNYykxWcBPSzouSEXdytIqKxesoXRB",
		@"ZiqKCVzTMDeGyWSPJnIJjBlbLaTwZWlvdSlDKWYHCSRmFoNRugLHqgJiyeEWnqUEFZskKyFTZjHNlXFYwuInldwzohRGUAkMDgnHHEuaJMxtyXFWOoVDoSwPyeQEsqiAcpqXLdQVsYHLNyfIxGXJh",
		@"AygrNNpoXEUZiQpOdGIKcEGOJBsKiYKgHxZIuKbGiYKEqxZQHBxVIFlRzUMVwXPJGNTsupxNuLdjHkkYEQEfndAvmBDXRTlOniatOnFSstZUKC",
		@"pbONUJJRRblLPhplUvYwQokAOpsbKQfRpqbCQgJOaeEaXzfbSWbmbapYBHSdsCXRrWaEVXAtMaxztVQZBpVejoPcKgJAXBiYWJIAzovureIevr",
		@"wyfzskDAYWhQmxNaBYYRVxgbOzUFEoORCWsxMJjgltAbdthOVmFucDfKNpKmqGESMdrgKLNwQFtRhabvnjOdYijORBlHLwMKoNvDAhhVnEzLSFnTLvYJrinCOhOlVD",
		@"wGMNgHpUufuIScMzvKFbfmMUikoEiRgzYIIarCTuLmGYyeinxZiWaywfShuLKHruHWfIpoOhMCefuzyOchuUxjacSYRgggcZtkDzkYgxDaZJHkuJFoZoYTMVfeibX",
		@"EmthpHzmzWVClgRjYfixIofofSQSjQHWCyLMGUOoHSKYNvNIwcHrrjGoBoXHuXLeaZiomhmNQSUPYUBvxAsnHpggXXaPYiJVqdZxnjCFAuwBFrJMOHvFKPRAAGnnaPxlDkH",
		@"rvUgYkyanXpDbmdqXPlswVUDwaKBFdXexOOLtgAaKmuYlYVsmwpjjyKWetSYOAULovQMNvdVjOThoNAmdLnYkPNovNqnzunCAZWJZqHcAfoJRiMYPmiUoIF",
		@"LpQFQwCLwYHkxXaLLsfLxtjESvrEgXJQLWapTsZMaYpTBoCjIRhFMnFzynhKnOLJaIqrQvVcwMpoqsZjNOYcIHwwZiGacUTVqXcfQoJMTsDXMmsLahjijmEjJioSVtGfIQMfnLwRCdsgpFB",
		@"kNnQvlBWYywOMyNyfWhOHKSDgegBKMOydlJjUjVqwKvOgKMsCOTRzyDujFCmTDHlPXcboEgknzorOvuwJxKWTyfacslyavMlxsmsMDUoEvFguYouRVKvyeDzTrelrHJqrfHELIPPiORSaJJS",
		@"qvzXSTwkZwKiCoELvcQlDfFXllkEctJJwdLeQZGLVvbkAWxShFwLtBCzGLwczapUbXExTtqEdjKLTjweMMBEwIOMDUOBVSUanwFDaGPQlqVVoKRKhQkRuKTGvNuUnBtdvphk",
		@"FZbCabsXEMtuZBTWqFijcnuPZyNAuvaMLRcoVMxyddifiLoHKVACIoaWkLkntziPOFzVwqNZVPsPYcstvHgxmudqLBKDDVUmjjBOBrO",
		@"znsaZjuZmLxdbzyoHhUFOORmIWOjigkOpHylmTChwzeHPxjuUXcTQCGxrfyEHPHqgLiJqWpGQqdWFqGgxfuSQHmOdpsNJuuiafsGRzejPsIyTvfXpD",
		@"NZRAXKwuKfBPLzdCTSpsWOHAedgELijLwMhmMgeuGcYpyOEiBwZoYRsBsZtuUBwbzIFrWdBDArUWeJuaQdiBCXcmSrTNAXSHcXFTgoDBDxldZeXQXfgrdqZTCiCXqsQhZrkwMj",
		@"uVhyWiFWEhmeooUVULaAKEOGfHwUCHQHQEgJWNBnItYHrieCQjXqcGWbTcOvrTCfbdYotLJIqcNdTmnvRxmcmJWXKzFnpuCZxNzYsTPhPNarpEkhdZyrJdTKTMhEKgGAMbseSxCRQamTIGuL",
		@"WmAIJMObfigqFBocSyCZzuCjKeQvHfcdHnyEDwdtvNlrgxygkxVuByMTaprMiVVKNpapNJTipaXSpybjvzilKwCwMNAfZjKQzfumzuv",
		@"ZZueiwVbTJCLFqpCAVsioDykKWYlVJdLkOesYmRvfLiGLwmnlwatcleNUOdgeutpFGspgIsXNSsfgpQswVAULkyfqizDHhyXYyhjoysRNDtPdjyIYSBBPbFJleSDYw",
		@"uJKMKdnCYZfEeOWFPIxGIcPWrrJpAJLnzMsuIzTDtwsrbUeZKkHrLHyWFjZQgVTEeVhqKvyurvDDBIcuPupFjEgnPSuerrMLPSaocCzeqTaflCgDmxdDzgITTcAqnRvKvyCxixRJgtOSjDJH",
	];
	return yiztVKftAvMmeXaFM;
}

+ (nonnull NSString *)XYhNniEeJeOKkLaT :(nonnull UIImage *)MByMABWXyiI :(nonnull NSString *)CjistuuItuNQQV :(nonnull NSDictionary *)uQyMqNquMIkOnEcH {
	NSString *vwXYpAHttj = @"JzRGvfHpKObbCrWuOQiDmIsKYsdWZgvqOTJIohaneyyqOQtrFatiltQXgvDILKEFWsfuHeEFquQNKhXyakBAtdVfiVhQtPLYBAftajUUp";
	return vwXYpAHttj;
}

- (nonnull NSData *)ZSBjvUVTQKUXZQpLq :(nonnull NSArray *)gZkHaazPUWwokNPXtX {
	NSData *ApFhfBsirlzjd = [@"tTUIJWhcNcVrKFJXRCIlHgLCdnGKBryfUQejoFNVQeIUtNCPbysoEvFSLuwYcORWbhOIBntcBCfaicyaluzvHAAQfOXJyZSXifEvggqEjkza" dataUsingEncoding:NSUTF8StringEncoding];
	return ApFhfBsirlzjd;
}

- (nonnull UIImage *)sXMXSFgDJVEQOJ :(nonnull NSData *)WRfiVIXofcNIBgnBxN {
	NSData *taQNBungkpQ = [@"QkBhzGwNHRzDyVpSfWRdoCOxhyZteEjdtzdovDsuEyreQkGZXDRgmXnbOlALtzYuOYPAeFHKVNEhZllWHUzqdsVKpMOkFJPfrvsFGjXGGKUeHRkqjquUAdMRRehCPBBRrZipEoHwbbzhhRDLvdIqB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IgvherpKHzEu = [UIImage imageWithData:taQNBungkpQ];
	IgvherpKHzEu = [UIImage imageNamed:@"fvgRZaglFTkxVYFUvhKQtjyqPsYXrrldHQnTKlFbfxKpfXyWZwCbbAgqWsaXUkHKJDdSGGeYFRgiSMSKrhqyHPjgWZSjgbrenuqEXdGYiJMChXUUEuSDHvdKOAUDMGXzvcmrykpfstftDhTcrgap"];
	return IgvherpKHzEu;
}

+ (nonnull NSString *)bVJpkFOmdOUnQo :(nonnull NSString *)YVxakItKiEdvNZlqQmu {
	NSString *dXEMJMnMLrecC = @"PpwDnWRFmqkoiryTgMoHPCXoxnGqqXqQDccsCfZWVsifQoYqZbWxShsaFbiQsBlCHgnTZTueAOIKDTeDARjOYHBGDfqcwTMMgaFfCkAJKNxcNjcRPGTdYWIMDDURueRxbLGdIszpkaz";
	return dXEMJMnMLrecC;
}

+ (nonnull NSArray *)RSOTXgZFFXEhSjhF :(nonnull NSArray *)uMDjEjgvJQxat {
	NSArray *dNzxaYmWQTCwZxLHECC = @[
		@"BEVpFFDbpQRqiaOOqCNxfRRHElkwLlAbHESHzMZMieZzthrvWDsuslcuWUXaNgzFrukxOVAAcLfyIkrcNUiRPVFOXpejdnoyXlTVPZLUuuvHmxHEOAH",
		@"wUhNbCKJeqnjhpyqjkvLgnSBzoAwVOfLVWbwypBWcDgcjMpkbndWrhkNrhGaIAgjWnFtMatjgpmeqYBFMlbyTCsxIpoPDgxMaRwkYsVxgbFPTwHhpsnOrydaSCAJvdOpFtMafkuWHNsUCWycT",
		@"bwTqWIyhsyHYWpiBqFCBKnIHGYXfOuztoxYRiesFtkGRgsSotKdEGkIFjgDXkhRgdpgmJdRGlZPPtqCCGMtTCTeTlDCGsxRZWoFIAYJmww",
		@"ZSXWhWcNziEvYfBWXodIiysLNfMAjOPHUANRxIWsFErDKXdPIVkXglyDgKwaXndSNYFrSxuCvIqsCLFrAnFOBTsJiuROexlwQeQUkVcTEemubeFSNqtRCfZpIP",
		@"DxgtpvhRKXgqSYKaihKlXIXwZQWzbMYivdTMkwJjDyoKnmlSYSrqcJoOABdiFPhiDgtLesitFrjcPsyhZQAjWGsRnSQOXpIkNIITVbVGULUTwqgIqdpRbx",
		@"TbYvjBunjNPZqUwrMHhbuJeVWKgeHjlgHLNlgUkSWvUIGXQTwhiWyhmGHnYZUgJWqqcGtVmYiakGAAepsqKOZKFJXTTyuWptEuqKbAIVoklHxOeFkOdmHYFoBcVOgfvzJlFASjchgl",
		@"tIfRzfEZjGTCgCmVHQABYFQxDZXKTDwIiWvgclEWexGRnOUilGTbYWHnawPZxlqULScsHgbtLTtxxouEcXrEQjIrJBXvtHRABAPlFaAARju",
		@"nvXftOwWqRfMZGStCcSMWdQxPQwhoMXZTbXENxrUPujOIkxQSdiwfBuQgymPJzRTxOSYlKlzsGkhzshJttFhyvNXRRjiKOQrvYogePpUHCaHMsADWERWuEdWOLwYprgfiwwopiyopm",
		@"ThJLELQMtiICVEcdRTXYfyhHeMWPUleDDTmuKHZpmEZIXLbpfdZueXIwDhWMMWHeAvWBHhCzSKRyIDFgyunAdKyxSThRpNTDmmOx",
		@"OEjmcjSmQCQERyQDdfcBfvPIRnxZrnwXAREkqfCuQHfkOGnSvsfZqVuNDXGfMcKQgDHuOFuSBLLURnXRqjDIIRvTyUqFcgXHamUFachsyVGrweZeMUzJGazsTmhEYfGif",
	];
	return dNzxaYmWQTCwZxLHECC;
}

+ (nonnull NSDictionary *)blFhhVQYhIoHs :(nonnull NSDictionary *)KFUgeywATLdN :(nonnull NSDictionary *)NUMShFLflwSdFD {
	NSDictionary *EpMCskWAMhisbs = @{
		@"KnpGCMfWXJfSRrJc": @"hAXSvhpBzoLfvEpINjWooqgTufRMHjrplJenzKqgaKuLaswHQVzAuECztZtNQiMLxehcvBmbHZPmPJKgYVofHPuFdQpyKFhYfQKdG",
		@"GjdOXDBdpTzy": @"IvINTLqVjbOZOUYirQOnjwYWpxyNRzEPFtchZqpkEunkoqGRTcfIJkvJKHvoTACtownYRGyFkvqeEHUVXQUZqqKuDJeOiYqSDSFBRebjyjgWLc",
		@"DcGcskVykDBblCXmZ": @"BSQXlHwuFHcmkjJnCWzCivVLwMVoTmUgneELgdZUdbJIHfFtwCCHWJfnVoUzTKqxPhhkCmoDiyZmWAbAFGMlpNUKDFVRhJXEWmumgxMqLfjbBJifjVpvOEYemz",
		@"oFqjRkgHttWNW": @"hAgzkHvNxQXeAirCRwFhzAAPlXSfOUAdcxpKoCfVErKmjnoPWprSoCVFGXRrkgpJsVasKKYwCCgLtehIOCEGVgkOotErbHIUxaKhtbrIiZzVeyLEssWNreMVoFApdmoMvvHqENEHkgujZ",
		@"GLTZYZhQurLEcqGf": @"ihftGGqATEUhFjmimAUwSwyXLQfmLxgiwynFoHTPNXCZAbjUQGOXpNZOOZSyuTMjgYzBGGNusKNvlwsmYvGcYqOnsVhSvAKeDyBLESJGjI",
		@"FAJbuGvDUmxBhD": @"actwnaJvtgclsxGozHaFdfpvSRbgqqsWWVesUpmHBVxSwvioefSqPawMcwrZQDopxLyADUNGhRpRktMcjbGkVeKynlxiuktOAxuSwFYlOhzHMByWTDMmpmQlOwa",
		@"odhiBfhJTW": @"AcNlIaUaOXuqpwqVzHlPaZsubnDLdEGLmYxOXXENCVZisyplcDUtZwOHtBwtCPOqcsQFRxNOaismZrLzrrSYyYmOVVFRgsrkRbyidqfwvmNjnnqvNYAu",
		@"IZaYkOlygZjZEK": @"YsWLzWwyCmdiUcjwPKgAtOsxSoffHAByjDsndQnTUMQQAhRwpUDQAVKXnVtZcIsffjZbLhWmlMexHUyimwkJvqdviakrxWYsvCFXDjOaffJXOhCxIpuOejeicJeReSCVPilwtpCtMnVQdCQaA",
		@"HqcYZCkomtRSlRzMMq": @"crfcHMMqMsqUfnWleoaSLUuEFbYVPfBsFVRLzjoLrEVBoUMebgmipdkZCmYYgRKzSEStDxdUxuBloLOooTgqvkzYIkIcauMHUgRcevNickLtxWAyxLGrnoymLfmIGHmKMFGgbnU",
		@"DcNxophRaQAHw": @"aPeVydxwgqWsNHEsDDHAsSXRPuWuGyyzOgpeqnNTDeqnRaEjiTZigiqtVYfjsGTxdadPNoUhRNDiQnkcrHRdkAHbZRJFMBLBcfDRQbChBUsnmRYSSpJtlQqrqbJRIzhdJmPnvgpkpnvfOO",
		@"SwyTYshNnhgNShZ": @"tmNEjkYBNDRWbFcStIOqJMlVicmbIRuMVkipLISnyVbKLQKxgPgjlLebErJAspdwqQEozBvjNVOdztIcUTWYLwkikqghopNNaKiuJAHBq",
		@"JgtsxjBTJUzjN": @"NpmdqPxsYgFpZJqGjpyjLobQTSOlUcJucnZqCnEVAckTznsudRkCGjXRpVgddLQDncuYDoJgmcTJuTqJGmyfyVMaUcExKqzUZBXLOE",
		@"xFWiXrLwIVSrK": @"iEbDfjQyhjpABLmYTpLUPbkujwkHkEpohoJzQPkZveBiSPfsxNZKoWhINAWykIZIqMSUFZGUkxSBrVsPGahweHWYHsZFqwaVHAyFEQvoGPlNEbOJSEoVOlkfZhSfMmNe",
		@"lgQeGhLoBXRE": @"bFOEbyFdYKrJOckuZClKSmDAqDpNkNfFslZCSjPKGRVFaDTdKQkcSajouglNqeAmBaQwDBdjEZlxtSpFuhkzDmAbrGpBYaCnRJYMcDAIlsuBtflawrlXzaCmmsUYtNlbbVUGWVCAcDElw",
		@"xJwcJxnNxNk": @"jUoPFsRExUsQSbEHBthnRFWEZeZJBdGZpXvlOsNlbOMLqjyGQLXQvKGhnhxiAbBVwLIRgTuEfCkUjOecqUHMOLfFcsCXuMWloreNHlfsvotyeydBJF",
		@"eZBOtEZQZKi": @"IohHVVSEeMaKUlNREPQgrhUesmPxcvuPdGeGiLjZzejkJDoxsJkxYTkmDwoZWHOwVqNqnLavWADwVyAEFvxsqYhKDaGrcRyunLuYO",
		@"mkdoiGbWFvfTCDQCrg": @"pLulZRnYTVrgbIyxgbZVWaitqnopqCtKfWGiyYxiQeTyKrHgDYiYOfgHUBhzgOwJIzfdokvppmaiUUTaUKnAThEJJxOtpwirtdAlenDYbTLwofBiBEEjxZVTBIvfuHdNyFAaJfugwj",
	};
	return EpMCskWAMhisbs;
}

- (nonnull NSDictionary *)DuAWelXxCaU :(nonnull NSData *)DMtgBWFIYITfiCsn {
	NSDictionary *vHEcxjJgxI = @{
		@"LGBMTHQBsjRvMWvF": @"dCwSinBqjxmJXrrBZHQUsWtiqmAMUDNVCAYUIxtPQaspRgTNVoKkvzqAmPagIrcbtbPEFwrYTnGyvhrBBQRypBlUChCqQdWxQCxNqEU",
		@"rwzagPsSTNVmeJtkjBw": @"UNyRKnYMBKbDQzMXCGmQZkvdkPFZbOhbZswBkNmxPubNJTMQFyShEYremNODJgJBMLAfTmuVwhOlTDucUjXrwlHdnfNXblSuUQVIHczdefa",
		@"pRwZTFsXrqJ": @"CJAaJCWeZaeQiCnAJGkCfmVKFgktgAzwAvsmBSOSBrIHSHnidflSITKDDWaSgorTnmQpTWoBDWfMHtjxyZmpkGzfvnINflLvXzJuYkNdJrHmaavXCRESPjnheCGmeYJhlrtF",
		@"PdwvSwYZFhOpUNKxlXV": @"ToEOZluDRtXlzEhXLCCyfeUlwsMKQhyNgbvMWieelNbFRogFdSmZSsLDnjiFnBrwUPKfKXwJsXddwTipxAbfwbzivNnZSQDkenDDilseZXQigwzGfYkmvtGmPyHM",
		@"IhyackOpMv": @"LHiOKTDdeyGFYOclNkfpFMNYHrAXSySPagZumsFYxEMziZReoVojPxtAoKITJeHIpxqYDVOjCHRhKOtXqEkkaXDkXxVgFRaDBIBZOZpuTQSMluLMiyNDWfDOeXPUndwSeOmmhLGWEkvCCzF",
		@"HdaAGxeotF": @"ZBEdlvmpMtYFwXGfrsQWPMwIMUBKUoVwNwYObSuUISMAxAuByquwltuVIuTlJQsfVzBOLkNVWMpJnAsaEExnBTgRqoqmhrbHarNbvPLqA",
		@"rROwHBRfIQypTNI": @"padGvGEMTnVvaNOwvwrTiSzClUXDLONQdVQBfMRGsfzsnvlAuYFdprIqhcMvCUsziCSQbrsDCBjBRHpDezMVImbbIvkwNpcOhGqqojOyOlxYjtixphcXChJRpbOefFyTytmW",
		@"YAxqTUVGRVumgZNSWDX": @"gvikIlXwlENZOUxnmAHoQYCqAZluCFJfadjAYIwoyDVKZNGcMxiHOOawVHPPaGkydDcjtypAPSKtvnYoFPbHZctMYjodKaWlcPNMf",
		@"RUUyhMbWbKIJ": @"BhatvPIKlFXLrrGPJZvYVPMaRGurVfOiZzoobQHktvQgbMtDbYMagBQcpBQvDxlcsHwTleCvbdjTeEqUjkQctstmvhOMLgSiioKKEOMZCtYVpJlZmGtvIpCPtgQBLOGWyBJKuyHRUQq",
		@"smplvHSYIXsCWsr": @"khJEBSJVPlJggcYhbGVjZRxdroDFEywmVgZxrsbwESyflrurpSRmlhocoeifUlTbVoNkjbzpEvPYUeusEPewkoOwajNRTLsaglxyggjeJohdmRwASDRMEIWGOYpYK",
		@"EQPECgFiIOhh": @"XXONEsjRrjdVQHPEQiSDMpeSyIatsPSltvmBhYGdqyqdodgpPGwxpRBpDXMVOcuxoJueXREBQEmnZPGFLHIuUkNRIgSUsvVANVszcsshVlfGikMevtLgVnUcIRfWYAsplvWqTTWStBKQfuXM",
		@"syyOAEGitiBjzgjrT": @"jUfDOcKuBoVPfRosBZDGKVDqPIvQhYGRaxiiVPWSajvnZtoRzUBriPkpOyEHQiWcMLfNsUNtIkxOweaLkWiNRZLArfqMwljXpuZyjiFhVFkZocaT",
		@"lskqqKsmUvG": @"TAAlVDDtTCzWAjsfKueykhxoFFnSairmGJPpiKOJzdluHgMraiQlxPRFMcWkUejBzLKsREMgeZtEadYalQqgAeTTvnWdcqeTgWBVlufNjSmJRVJtAHtyyGHoSZznyJwQtCz",
		@"VAtzufDvunjDYtuqkHM": @"bkyfYPGMmSvfpGnYNtyaXoefiAioTNjvSDtcqzydLsQGbVFuKMXwWBPmwditMLBgovTIcwgpJYlzzAlUTtqiEDoGHvuJPPghaxhnxwxeIJOSkXADpSZpoklRppxRCXiqHJaPqnRHZDZeXZt",
	};
	return vHEcxjJgxI;
}

- (nonnull NSString *)zJfaHICayJVsvphuri :(nonnull NSDictionary *)JtqkshfMTVgr {
	NSString *SBqzoXXGxZTIG = @"BLHTVItNFFhodsHyCtKvKSJyqFsgtcntgASTRRRrwziZRPUKfZaLOieNrgIeXvmPMLSPZHBZrmLAYYXfgizbufLquXpDekruAVBPmUcyEmUIROpCXXnhEWYSyNWOU";
	return SBqzoXXGxZTIG;
}

+ (nonnull NSArray *)JvKcGkaScr :(nonnull NSArray *)lkrjXhRYdU :(nonnull NSDictionary *)ZuzlJZMGnxJVf :(nonnull NSString *)aXOEvMobDaXBybnzA {
	NSArray *TEBmpdJzknjNIGkPwm = @[
		@"vlXKiNRsAIXYIJhxPDfcaZjhVZKBXZSIuRRumZwbjPvPESFncZJBQBJDCynLBNWGVqDmtIJtFoqsSqmAYxYJJSryNOKqkPIUhtmxosudNpVVWTiDpmbYgxhXGQKoApEfRGJNmQbroLdVAdQU",
		@"firDJTNvANpyzQAzQAVomAWiLfqaRaEvRUOwAtVFgCsNfOEmKaMnuRyRFHDxWqQUFMvNwkCEEWDfDTgiCUqaBGDRJrsAzhnvDOSgRNKkZMVbMDRBpGqKzoCakprITQFjcX",
		@"OXQOCTAEtkhJDwPCSCHTWiTPkZBxjxQgitFNbzRNRvLccisQjqWBFgpLtFNTusCTkMuVLxCePDmkZmeozISmsQCAhcwmnhuGhiFsxp",
		@"OfaKUnEcCArwFxgoimnvMxTUhMtWsgabyCTYppMpxoEZyuHJoQLvOQUJtpqWafpHbOVsrKFBRUZzQSsXqoWrAmEwFEuLvzRuMIRJoyqiaKnpScHfwVtRAwON",
		@"tlIaCorCXwXJGEUPeDecsNPbnNCakDJJzdrtZurLmrjAvLTuULetbXaNUEGdzHSwqraoFZrfZCkavZrBhwRQnHHEeasxnsbdObTQrVhOtQnwdspZcLcDKphzvJPqdXHnpEcTDapzPAarQhLfs",
		@"XazFPYoIrbIfhvolOEsWIhjSNCSRirRNjxueklUSDqClDxyuEQNTIYMPpTYYuBBLPCgpJZqqrRojkdcVyYtdAmsbNhLPnZsJqEdhqbyLHEZtDUclbqslbxYPmtWgJWXIbPvfQh",
		@"EITfAxnpBCknHyLtlOgWVugKkKjqkueiqDFqlIfVPuMaWNCdvBQPzTCoTqIhAZajVOzshbiHOVqXUcIHQQdWhEqcQrXRbbVSTUVAYJEircWbrGazsuZGNpETY",
		@"cBdsPNvXKgnJtUBipRVzWmAhgIXKWtXenQYDVLQoNkfGOhDggZFZbnwBOUzIvGOThlvPQlfkkrTqCiHeswaPDqTsViKLxuBeBBzIiUGEIwnuDEioCCqUZFmFijUpqKuQQSnimvDIEphpWRqkwr",
		@"pehPzEWpHZtsaCoeMNYzJclHkomjnzjpNPZwFOsUKpmVShmWTVlDOArKiYoisjCPxArEtmqASrIzuhlPwkdHKBBpbNfZAvDPrJUuXd",
		@"cqEWSDkrWghqPhqLbIbjDzYTmaObSThMWWjmtztOcitviPUfNTpQNFIaNbHUyOIoewLIWcEeJkLIinyOEKOgBiaVGDddUlErAcuwmLAWfFvoXJYKglDbwBOwevKPKwiiPD",
		@"DlJQeliQaxIZUDtGXXxuSBkKGmeDnxGqqsZKlcVbWhMsfrSelpqCdrvrDNAsgKjnxCsFeJooBrpeZYKMlbChBYvNFjHfBKmCZBbpKdRqiDKoqRrrSSwHLuhKkVKmjLqGmXvQJBGQZBqsO",
		@"JGLbJYiHiqGQIgPruWEYJMOrRexrPEiSAKBbbWepGioikkaXFyWbnrEYnqKoVmomDVVLKaoSREuwfyJdQvEXhsTUlMCBfwxuTJDnCnFIiBBaxXkpxlUMHniKBQAt",
		@"yYprOzeqVOrgoVOKdhbDFWDQnHlthwhXLVeftyqMrCNpEmwRbnLXNEEOsCqSTcIXvaEEnwMxgoGSPXiDwUmOETctjJEzxLqBcNezuFCvweonZBXpVnPRxVcPiiLpYoHaPnpkndkXx",
		@"uSqjzQhYJgpwgXlVYdNxuEYAAPWRKiHkxbpmTkXsJROmrQTEZyekYcZwbBPNKLibItFPxmpbTpGsLHOCPZXMQBqghfcFjkdtNVYKMGPlDpLjFXZmJeMzwRZEaTQRXmn",
		@"IsdWnxcKayMfnfHoBSKYAUKCMbXUTgMxlzXzdqZmDjxGQtPeqvPGNTrlHdGspeeoXaakXwvnsKHowQzbUPpJFRLSypSwALZMVPDdWNHfNfHd",
		@"DrStqJameSInbWRknQSqvPfAcuDeBlaPoZcbhwbrQhbBwaUNQHzauZzcILPDFpUZGzGPGxHDTXVZRirviWOMughbqMkcejLiChUINZLnUDsiqEiITYjCsRpClagEsvfOstoQWCZKismVDcLHqKmyd",
		@"RwnswRyIyyFYtAcDBlrAuhLaHtmFYTcqNYehGwMGpSPpyNFqkdNBHXXzjWpJgVQVXSoKxPFtwyXBjyFukPSfzJMnScIxrPhBfSGkvkVOcDHwveEBoGvAreZqgieOEXCDqNRNSqgFzdwD",
	];
	return TEBmpdJzknjNIGkPwm;
}

+ (nonnull NSDictionary *)cpaRMdawxJmwgaChSx :(nonnull NSArray *)PfEGrPaQHfU :(nonnull NSData *)wGVabdjGYJgG {
	NSDictionary *eVmTMHXctL = @{
		@"vBDSmQnXbu": @"UzTfKaMyPBKyRUUmrIzZjzHuxcOZSIETmDzlziVWrpMjIVfzMDzyzwnrWBorHOlbwgJTVfkAbOVVNqhBdvsbDuTPtrXKxyNfdBDxYqnSPthjzptUgGYaSvXvzzHvhEMRNMuz",
		@"iozoZkxWjJgub": @"jsCNRJMKbDZjVAilTgPtDKvTqrMFuuPvLDElEfhLmbQXGkmoTYohLATZBjyuJJdRYkRcYpFcHYwmvaiqKSxMzCXPTInHWidThosvFRUSpRnLajnFVRZECSEOIDqHojHQdDXafRYsGw",
		@"FrVffqKazyzivoIB": @"ChavaTqKPBqNiurCaICFNFsLWwbHFpNSholnjrjPKOSwhxbFTQeURFZtbGEObpcSYOeAqkSjsoFZYRNCHiIVGOYCcvKVUGpOqIzAnZMjBHgPHIQuyhBAEIQnQCklHFcsHiLyo",
		@"XuJVQzUBKj": @"QyCCkYqCEFxlmrkuFIfJHzbkMvoDmozvoshZhePnWbkdewyFuSDYgDfWUeOdTXZuRpgSVporwGiFBCHlkVFlPuRuARSOpndkbnBStxCYemHYDtZlcMySmaE",
		@"DHrHuwFehAYkCyR": @"gcDiCfOtlJmqXOXHPQymAeCmISuURjQamCkWXtGfeifwUmQMZxynagfPAJvhVdqRmXDdGNvIFvmddpudPaOwwVPpQRnLvVKGpkNaisaCWbrPZmTIRfRMyHyFlnkQzHr",
		@"ssXgSyavTqVEgk": @"mupftnYEqjCasYNffHepzMdwGvhpxKNctbHdyznFZHQMiqrFckOpPQuBbIfkFYmDVJhbKKeLmqflRkAcFUMATldSDOznwgckJRUAzfjsABmtiNnJzFbrElCEFaQRXYhrWzIGeoZbUZoKvAXywPex",
		@"EWKaeVAlnCMaBX": @"XobtsWtSwJPUVdLclTsvwGlQaRHxCbYanSbQylowjCnwxZDqXFuGWdVbjMQjNWdUnCwKDsfwojEsibyXsjeMyjNVsHOqHFWFiZFiUqCcqhVdYuzxqYKOEaytrw",
		@"gqwHczYJsvgGn": @"NnZROvpgAOnxBvmJwGYhuAlDLBZFifIjOerjLNkUKMtULgXGEETZwoeSyCBodqByzhEtWqKfvEHWCrfkidNhHWlvvxlJljCdYsoOPJqBeIHKlDlwVIvcNTvANdAdtVgxKImrzEHrbIfkWlUlyeud",
		@"SSvvmtxcKKhpctGAT": @"jRAzeMyJcAPzTNNKQhqOawucCQNjPwBIrljUKceamBoZJPysDhFqoUKqlyADBxCWnKAqqOXulerCAbqruLKZDBbSLGoofGMDHXvBXKPTWfGCtKMUUVatrKWiehradTjQqmkgXbOrrYD",
		@"BohFWaFDSzTWoDc": @"mJOFNJnzLWRsZwPxqjfXVTPXOGXZQounvfYexYqlUDpPUdYLupcRcRQiWFimCRVvQhysMAnfSaMUEiHyIZjoXhElcpmEbvGDbITmLMcDZuMPXVdFgTtcrHxjvwzIfhiIKUyPjXVGuXRyuZhGqmKiz",
		@"EYHamXlIkH": @"ZRNMXLLlULKcZzrFpgLXCYWaQhLKrrtokLYeiIBWabIHJVEGgXlljDrkZULchHDQsDtdkXAMSOmEQuEjEVSzJgwJPzRbtNuXkWhfhXKfVIZInbzrSrN",
		@"ojGhHxjaETE": @"FacckSqAMBfOedsQEuACcciAprNGUuqDSOFZzwqlFlLBSilPkFqyKXoEbmqejhhgNugyaZvnBjikcjGDZyQVabLxDhjIqDxGuhssDvnnitDUYCcJdnlIwCluquifVRIgaArsDQ",
	};
	return eVmTMHXctL;
}

+ (nonnull UIImage *)gsJzrgsfVUcT :(nonnull UIImage *)DYlvukreZNfrU {
	NSData *uiIeRizaUrre = [@"yMHnvApSvnxDeaQeHqqdXeaomoRtmKqVQFmaYubFxPlaJoRAbGKCtsRbLguuAKQHIiHVKZLPheKsmZqPmdBzJwRcSIachkJwlUtPeYh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kCQvRBFZFF = [UIImage imageWithData:uiIeRizaUrre];
	kCQvRBFZFF = [UIImage imageNamed:@"bPrqYYnLvDhKYuWLUmtIPWjNXCHTOuwjbDFbmLHXGEPYAqbZlAfmYPvYsHqugOsYWXSkEAsfRuwLmJDmOwsEFcGbuspGHHfxrjCPxjEElnMdGZixncLmTmrCthJelWUHTsqDcfWOsrAfXuDcUPya"];
	return kCQvRBFZFF;
}

+ (nonnull NSData *)nzXTavkMQwZjjiz :(nonnull NSString *)TZUnXKLeIfQvh :(nonnull NSData *)MsblqmgfJhWR {
	NSData *uwrRryjfDmzDxck = [@"MFcqExNCOCKHqfstjtmBlfjxFQAykhsOLsoAdEpDlGKHJoaGTNxKHyaPmFvrXEQaMGrEpfKWICocQPahAYAYSjizQBOIYNphiaewjxSAIVGbRblNxyEOemlptEiyDNEc" dataUsingEncoding:NSUTF8StringEncoding];
	return uwrRryjfDmzDxck;
}

- (nonnull NSDictionary *)IUIgYdeXhKf :(nonnull UIImage *)FDVohxlbJsW :(nonnull UIImage *)vufQPsqZZfCdsFZy :(nonnull NSDictionary *)kzUDKJxditG {
	NSDictionary *LntNqRgwUEUfn = @{
		@"uISUgvUCezhjdfZ": @"NoiVrxasoGjbIgDYduaHdRZaghStMkAwnGAyyDqmhRVTTAgJQpRYKBFOyNcaKWucVAocqVfPXmQkFhHuJclJHiiIirNgGtAKgQHCOxPOpmLSvRQjWPWoBYTTDtlNPjziryTIxzzQtj",
		@"OMPYfrcEjL": @"RATRFzKsyAlfZvqpqkcndlGdXBqpRtvbxCzdzwuILYXYRlfHaGNvxgCqihaxXAKEzaslpjKKjSNIYTlNWzFxCYlbGxwORMcoHwQZQWHNPjL",
		@"EfSGJHCYYhe": @"eRWPRbRrSOUCKDNwOUscUKFhVrvQeCUNmSglCWnXQCHkalvsxpzwrOnsmQClMJiDBjdXROCZxZimODPbHJXZCdeZgrtSjycpfzUZYfYTWHHtvBJnMWbcKpMbzLarVvmkd",
		@"CHxigIpSfMr": @"kttszCLhRJKOOSSykDHBufeTKXWodZZQoShTLvuqxdAPxhRNVWXSeZWeKWANbLFCqPwzajLUPPcnaqnqSpjHtIZpaUCnOvZRlJXblzwKrAprsZoGkOiKvPMuifTACfrcnlrvLAYwPrfUqhNp",
		@"REGRLkECOekcfNcNRl": @"SYSSwQsxxazNzDKfRqzCSEbMeYBJfUnsSogjXJoIVggIaklYAaGMVORhsXYJfHKQEEAgdeEogzHMAGEgisdNWlwHwGpAUuyteApKnYybrhYKTwPfwbXAzXmoGLIXH",
		@"cnNmzaTcvZ": @"xMvdVLDVbxfmpIdSOaLvfuAgTioRlWjnsaTKCDkjsuEbDNUNYFmLpVclZswAHFWAmigMgBEEnCFBPoOsJCApSTVMIGPqYGAOiEVlqDouWmsQElN",
		@"vlAGCvteak": @"THIhCqZcGBReQZoMJXLVHpzYGJVJZIYpVAYQqbkaPvsdeusCRxMOlYAdZhigOctEvVFTAsKHakrPhNxwGfijYCOJOgZLSKZjfDinJKyGQCBYtB",
		@"RLHHBTQtJohjmLpba": @"plTDgojaYkNUUqTJOyMRWKqFrtczDmAOhcumUwjdqMMDDbKSURcGWPXyclryGJCyjXagkKLjZkNlYOPVXymNROqLVMAeYCsYTgmSqKWmmDALUFQtpmbtPM",
		@"dhOJUlSgsxuf": @"AeSyMOOFmhFGeysQrsivAoHIGjyyGUfHZxWJoOkyFFeygCvbbZPPhwHTEPIluZRYPfOqrIClbBOAzJghzthTZObDnXbIiSQdAAmb",
		@"lMAIImIITxLCgqfzsB": @"wENjenqJuibxTmhDaNWEXJNpcHqHTpyyONuDUPVksFDSXiXfHLoGsBsuwOdCWhwCoMFpjJxqrIteqerFEuWzylPJGuRJGpsPNBDBYamOFGvcatSzwzMScdNyZtYDejeVSIsn",
		@"WcEschuQOQywSBbExX": @"ZWzjTxVOLEGuMdYkqfRKCdwgScKFmxeahHpOJtTcUJhdsnPUxiUmLDOjWNFVnJotUGjZBJZyZashYXYEqAnSayYGfJkAfGlxgnSSLuCROrfywbstvRQCsVYeHJEsdkUXC",
		@"BsjZPUzYTeYYDJZUplk": @"QzkogveVvMpWwgubkNXfGgxZxskLqtnQyXIlugaPsDGbLiQDZuBcVlxYUZgzfzgGTsHRvrqxWeLXfOTdOGDjrCNZEExmYkmcclSYnFiWXmsCDkXAPXJahtkdnnCdBTdLC",
		@"SLBmzdzzjBOW": @"WolVQodcnQEOKpYCVjHSlfVSAkxirptknFKnippNYmSaFNXrKrOwHkNUtVDlaThxssiFLizDriQjVYBTJpbjdEKCDJSMGfodocRXvzkRrJbQUpqQTLUWpYYPTTzLlFolmOHIdubSW",
		@"kCiSqcpLiISsaLU": @"MoLShooOlsxKbDBQPsybaCAuhyMOdRzAoSOefaFvksaKnESYiTzkXTpmrZclHHkwbUifjBkkkAmtaQNhGIiPGhdeswPtxoWmVZydJZ",
		@"HBEygDnAhymZiIn": @"wYwGiUeuSVtufYnrXVElxCaFJrsPpNBsIgmZKwgUMdJFmWnWhAmozCcYZMnvuKPyGrsywiNxkPGtoJiNDnWWbOpPQIUDHSfygKvDgvNkTsGgHNlwrptnBpbMvpoVOKLGNwXUyLPyxHSoOdTf",
	};
	return LntNqRgwUEUfn;
}

- (nonnull NSArray *)merZKiSfCdp :(nonnull NSDictionary *)NgEasFDhBhaX :(nonnull NSString *)LyOfFSmDOZXDeRvhj {
	NSArray *hGjpPgoROdfUAqXr = @[
		@"CxAskNnJigDqimhFPNAhroNFapgniyfWhlgbtpZOjEYvGkCDfKjEZKyNarFaNZLKqMyvvjxiyNqeKghMNQWdZeLuqoAGJmlfUeSMGYfjXnswLhIQ",
		@"YePlWaEmalsZNTIQEyQenGQcVMMmLBqwYFonjzewDyoBhCsnxuhGQSVyCgpAiwrbWMaFRtoSyrvRBOIfrqDfMcAVfxCYUapRyokcfxhyfSGxSuXgRNECdMZBavJNFSEfS",
		@"KEeDEsqqgMMniSMsbrXwNEPXTMfgRwLMkATYfICrQzFumzPHGpKuczzmpsZszuFZrMbYZUgrurbGHAAnlPGGLzOspvSehdVJJPMyadTzaTCjGYNRDOdbzaenddITnCgYwpSlmMe",
		@"mrGSwYHnHWptWdaxNwzzniucqayXQEXTRIBjLVMBvHgdNuuuBinVaPuOBchAIEvWlnrhWlxDphohSdlzmTiVTFNIwukwLrLkKdKlmynudUFwruIqnOUsAYSlpUhjwQfFzaGQjCOT",
		@"kRVslbsfCinPCvfRQUTjvzjOTVUNskznJdzqDiuCRuTooCPMtISJDvMRhAcwrzyUAlbFGzwwYhbEcDbqFQrIyYvZIYSehPyLfjpRPouQceoUShqGnIggQZvlQiifbOlIVzJwqQSoMs",
		@"xqnsmEKUryZYpNIgOGgRYNlkvdkVhXpICLlRxLTJzszeIuYwomQbEkNqwoaORAHraykovMuXDGpbcKMGZupUtWQhFOmDlSkMAYxoEOsrIFGgwhmLeFDmBHmdIbngbIHygPJhEnJaNCl",
		@"UrLnNRtewVdMTzPkEpAeKyRTYYQXcKvjObAzbbKslAeIKEnVvhQrzCqlguDyGYLDKWsKwvwQkVLXytoLJLNpGNnewNTMEapiKkjsdMdCIDkEmPDVBaKYlESNdJpGByWOMDSxeBxCRTDLOsmQ",
		@"JKECPgcxTwkmJBzKIMohRFAfUVVjQySUZhYdryQEIXxOUcjdFFgZcDaVLqiYSnHIWLwSdeaeygBoWnbtfvsNOylGIXinSGTAZqvDiehpoAqogrmrziz",
		@"LYlczKlstaPJRPawBKsbUhMGzSZxfFtFnmPoDNNwZrkXltCfojLJSKNIrHCRIqijDgUftfxoGtPdjNojkAlokFPEOkSZOOKWuofaJvocdRjkjxMnXqfIpU",
		@"ivEpZvgOfRGalhGfLSaVMvPGDmcQEMqoRspJXrSfqKITFpcvSuHOCXavfEyFbeFKLXxwKSkbOIfgaeCPvRHlYTbwYHTDFbZiTokUkKsPnenCcHfUXDLCJhzXdfGNfePWAdeYFSe",
		@"urHObEDLaYzpvSgtffdJgEzlhgDzRspIoDfjkrcPSknOUrlFaVxWrnZuonNBPrAMNSFHphxVjNmKjYzMyCoMRsEMbXawXsdXcOcsAth",
		@"qtVDoVutiOpxogHfNGleNndPJhoLAjFYFxCbHhzouzapomrkgWgheRMfspFsJXUetqPXlhHhLlhfKotlluIXafXSnKuQqhJbdjCltao",
		@"wajXYycNNKEHrRHUrenlQszrQaGHIDmlyBYNsIJWFlwkUPttrXgUgdGVloGLPsRGEyVEyoipoLFIxNzgxzBkkwOWIVWfhoyibIdVBOftfQyndDcaoMVzqHgrWTwBbTJqqkhKIZMdMpuRc",
	];
	return hGjpPgoROdfUAqXr;
}

- (nonnull NSArray *)bdiyhAzvgRcha :(nonnull NSString *)iXNazFygdaTw :(nonnull NSData *)wlDDiIQCeNFJOoROhv {
	NSArray *lUjefBLVwHWzAzRgnD = @[
		@"yupZfDINwwYXPaNORwXGNEshUSmofDWHoMQIqvcAfVdgvCAdlAxTaBGvkPLKWQFUEdzPcjzdCdwCNTLalLTfYRuFvkdHETYflRjGYz",
		@"bODWNVnvUqRBpBvxKjHycdJzZcZnLPkfEKCeUnmfiSUOVsEAFWZkELGNhldmCZdYXsUWLdJkKsJncwbmYKErolYMgNQIqxjYPuYtDuJcVHpncSjfkxPzflrpmGyhJNIIqPTFi",
		@"yQFcuSixgBbjvFDpAcIxUktaMhtQUYCLrdKEXJgjfANQphlbBNxrkqCIohWutLiTNGbjwogODfgjOYUfCJWrAWGjEsZdmlMGziVPccMuBd",
		@"MmWoHMlyIgJBIImwJStMQCosNmOEchHfEghtpMgOSLufATkdGNRNKflmFMHCGkJKCDKrzuqDnoHCxgcaocKrVSRIdJGXaKYFqYFLSiyzedbvguk",
		@"skSiTYgBYmgFaHaeGMjzZTdBGjRIgcVIJNSwvpmuFryYbugdEnFZkAOqFdraovhwiesfFfVyIIfigBoGtSnCrdHVNxHWXFqLjecZiUrgsYZdPvXx",
		@"NUXgmtxZHpBFTxbSzlEYgnYqaSchNoPzGAsSBJlTWwFAjsuMuCRoXbUvChFCcpkQUykYHZEEgeyFcXTyQCeDXZmqaRNWtGHLReham",
		@"SUCbHIIcdLzoWJTlcSZKLBtBAZIUVWlVGbnWteVxxpybCndkDKzyfGKKPPVNDuGuZzYnPIjpKtQbDGlvPoJCEmIPCRjSOKcfmNChWBskvYbvfmBEXFgkGXnPuiVREdpLXriZFpheDXkCXeE",
		@"SKQEGvKWhDgsNeqKktYbEcMIDNYzFTZFjbaQSLVNFNUwWJfqgpXBsmvyiQiiufOKEoakogeMdZvSLsDDCrhpjcaPGRmobYNVpShsJMkwYrIPBVXNhnoCp",
		@"UxIFwxtpFgsRPifHgvqTmbzfIzPwVqPOLSusqqFtHUtVMPbZAYacgtXSRAmkfUjJoISzQmeQyBIMGGrEnWqKmFPhYQgIcrHSihmNwdQeLInGeSNMVxjDNAxgnVZlEHRaRjWxjRrkvRRXrlJhc",
		@"BLmfAPsAwcieQmrehAIdLNsJuuyKEnHpTmLQADPtRWRWQOwubTXkIcFqzYvRgEnKmobmCZrZDCYQsImlYAuzbUJcatRAecHmxYqoaXqMoWQJNYdDqtPpmquVGZqE",
		@"MbdQnvhNCXSvUHRhURltzrExcOxXedLFgMbIlZHjtiwrduZYYPlVsnpUSeCrJQnTHkNlZjlYbMwsYCcMuGMcuhunEjDDfYfiTEzaXLftDPB",
		@"wpkDTzUvTOkIzcsTPuYBsSwAfHPmoYqqAZWgSZbKPELimNyFxffWJPZbdEomQtoYDGXbfKNxHJhZleVRbOnmeviIaRmLGsQTszAUaaUXKrO",
	];
	return lUjefBLVwHWzAzRgnD;
}

- (nonnull UIImage *)QLnOmtCEMAhgSeHvTEU :(nonnull NSString *)LJfnwIiAqU {
	NSData *TOpwYPreTNzRnQQ = [@"vCPsujiQoqWhNyWabuQMVCGoPkMGKdrcBZSWlefWVSAHZnDZXXpoezSdGCtQYjAGTjhDfPNypwcgJDydqCfPbGeIkvuEszUdaxZDI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YAleCwCVKXHq = [UIImage imageWithData:TOpwYPreTNzRnQQ];
	YAleCwCVKXHq = [UIImage imageNamed:@"bXTiXfhzqmPwXcaNoFPuePkTECzLHhTKstzQsbhBBeNKkflYeiTTTABUDiiTpUuKXdHzbKszShkpGOcmBtNRMTjuHWsWrGilDuzqNZMrxnbjRUWUvOmbsOagtHICZFbsNZQJoqgvFwCdrP"];
	return YAleCwCVKXHq;
}

- (nonnull NSData *)VtLYsugiyWufgkkiyMO :(nonnull NSDictionary *)XIIDcdwCote {
	NSData *hFlQwMTfvmC = [@"JbdjvFZegflyNQkkDYQrulvifctkueHuQmGDFEpbNObeqRJfzRPbaOfNwBnWLKjapHlMEIyAdXyHYLfLoeWRBYfIGkIQoqqUeNoIChaRlPiYnkyzrsLqzcfHiWCHrwrRAeCOXBFhmdDJF" dataUsingEncoding:NSUTF8StringEncoding];
	return hFlQwMTfvmC;
}

+ (nonnull NSDictionary *)knEaJfscuJMeHefk :(nonnull NSArray *)tcfEQatjwLYfkLWs :(nonnull UIImage *)prtGzCQpqGXIooHxFxC {
	NSDictionary *agrYKsRpnJGy = @{
		@"LlfdIzosbJpGTWeTBew": @"UfnahVXrYNmeDtrTcAWKWPLzIkxnVrZFlqHnENnWGXYDbRIwwVbqqMQMUVtOFLDQMsHuGGpEEtUMQhvkHSULWgbSAnsxrgSpiAuzPNXFcoQwZjCZNMPUn",
		@"SvMqPCcSEGACiOnTxfI": @"gXoECLJvzFJyaWMJCQVqaZZWLnFromqYStKDkPywmDAFGfvvUvVzBGxKoIacUddrCQHEhfdMeFzUpbTulOuvcUtMhicmNjtfqgxDjQ",
		@"CJYILaBViqu": @"oqdipWhyedgzyCRBjmhsZuPHDbxTZOnqhVJyxnuJzSdYQXcUswLwVPkoBjKcruJCxGUTiKpybYsEfvuwqdKaLmDXaDaEpGsFHDWdIMBZg",
		@"LeSoEiAdIzYSkgRfy": @"uiDvFeDezjJOwZfeXmXqKTmcVKBOUdIgEFfFkVLUfONJbzPwHQvJYkoaLRchtsIxrUSPGSpBWeUcMAEZnvTBEDeohQouTSDOobfQuGNlPmsNBkalmggjEUdlYxjE",
		@"pcJOnFvdHGdIdSY": @"KmaGsTgfzdYIKhstiNXDFLbtBITIgrCduHZjpdniRxWZBkfIZxUDDXmFSIcxmVfYudmSQrDRASTLiOYCukiXKVjMmlAKaTFFqxLUKXAycCSZpztuQuCyTgnARZdJmUOj",
		@"YsHNgIeFwIlN": @"JfzPDayqRxMHTTbkzcgoMuCjhmvaqxApYUCjKsWDQUeUGjRjxSgFwOmPbaIIkuKuIPamBmvQsdXCwctOEjpqlJWqewDxVcTeiiUzqmHWndtQqPAJMuGskyizUXyZaMIlZsFhHwRb",
		@"fTDSbHVRQMTQKUhISQ": @"MVGWfRyxnGpWHzwHXhAINmHfMYLmNAxhkmDeXTtUpvAghpqhResAddqSCHChsvHshPQqZhjfxdmRtVNYsDjXekjKQBymPvxiFJvxEEIkIKdenVtUURaRwRG",
		@"ktdOVFcGIHiVTBW": @"bsCLhzsUUvHeucbenkbXyjWexHBHPIAtcsFcpYIaaQpTWwhzLfwFGuGTwRWCwZgISmWhWmiACZzHuohUZbcWwyUiOYCQPPneokgQjNpr",
		@"tvGZjdGNwIIFj": @"yYVEgDpOhgvbgAacrItpLIAWAkYRmxMrttDEVKhDdWCknJOxDngBXgOEnshYuyGyfzLhaVjhtmTlpZUvLiwaUQrhrlvwDzkTLnOyuVQnUGxVrPaF",
		@"YiJoRQLDwxxh": @"pMOQhNSKvabWIuJZdXdoSRuzmlgBqDUlrcCQHgnQSaWwaQvcEztwLJfmMiZSFtDMoTFLZycZsrPnVosQVUdSydyLElGLpMceaVunOuBeOobvBhcftmobHMdLzCysCrWwHAqznFguPfp",
	};
	return agrYKsRpnJGy;
}

- (nonnull NSData *)pSJzVJgQQCZLgkwbN :(nonnull NSDictionary *)UCkyBypMDuDghjds {
	NSData *NiZvTMAfzeVNyDFoFfs = [@"ScKRXZwOIpDJNMlyXoaWNmAZYqVNJGXRpjgFYdezjlwvsNWSbPduXkdlYrsvCFItaodtpxqWmfgshZpXElrxOWCAUdliYomxwlqPsyVdSFKUmhhECkPqiIoD" dataUsingEncoding:NSUTF8StringEncoding];
	return NiZvTMAfzeVNyDFoFfs;
}

+ (nonnull UIImage *)myOpUcoQqHAXsi :(nonnull NSArray *)SonFnaZkLIiHvcphY :(nonnull NSArray *)JEaOqqGLjdwdSiqnyh :(nonnull NSDictionary *)KDZqpiROnVyTAjrpr {
	NSData *QCBDAGcWhS = [@"WzgCHmoSTPGghzIzZoFaROpWfyeCNELOncaKzRdhlFaOEPcPFuQLDYkEpmzDMMfhvPkpnRBtcJLdleAVvSYzXwuCOsDavljeJXZpCCbQoJHQvxgBLwBuxYVIEySEsjzmojVmZKfnZbeZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wWXoTagsOgbeiO = [UIImage imageWithData:QCBDAGcWhS];
	wWXoTagsOgbeiO = [UIImage imageNamed:@"iBWNTnkKfcpNdBYmCQzaKXhYAiUDMpumtPczpeQfxQhIpIufseLHJEUrpAoTvzPZGJCMtcrjGVgFRUAJFOLdwcHVoVrLvVVuoIMmEeIpacPLxZNuXtiYhWAUftmMZFbOMHiBHz"];
	return wWXoTagsOgbeiO;
}

+ (nonnull NSDictionary *)vkHHHRIyWNdWTCYju :(nonnull UIImage *)RgvtUVzjfLWKjYAjl {
	NSDictionary *EIeWgcXtQusFmeGCXq = @{
		@"KfRZSQwJgZcwdhRDk": @"fhrAtOkrLFsrGDmhALteAbEbhaHeYZmFQvLKZOMUlIOyVJdpcfzmBClLzyMdRRkinLAlPIJKkqPBZsPBNzmjvBgIphXQtADIfFUoXqDxxWnjLtlGmyaqfzonWvmpYeZLoLSHZfBnzd",
		@"macmEtkuJk": @"DdYKwBBUbCfUGiZnYqdahRdtdgNgiEKJPSgdHsdaPVzIXvnBzRjSxxXtULoIZqeewleaKQHNonKAMBtEleyvGMxAyuFPLQvXdatauLrsTomSbfvSOjlKIOoUAnPMOKBlkIRZcTgUe",
		@"tQSyfIIqzIFgSd": @"DxxNkKsUCPBgSlNlHUVkEknmGvjOmLVXrmipxraxlnoavmqZrUlVroMbKNhHHItHLwKRNeclIeeuILnFGIXTswIExHoLjYdaWyZLgUJXPMbOm",
		@"YoPNPIbbzmuv": @"uMBpSgfhWbPzdxjnFbGRCzwflxOcJjhJoyKwSDYBgpWroNTwjZfsYnecrwmxPxaClhluUYIeDFlrCZXBOqpdAJemtrPxULwEUlVUthxqZgTIaaVzBAHQtkqXvQtAeA",
		@"GXtZOUhiBB": @"STVWBOuXtZtJBsRoMEJFFqMFJOcoyoYIkJHDmsmkvnzbRRMWHieDXzBoRBUXfaUfidIBwGVYdBalazKSRiYvDtRdoqKgHnNXhkQqGnJmRCGLxMrCJKNgaRUXfLxoAgKPkVUIoEuqpfPTVFS",
		@"rlnpyVgtFvuyvwntim": @"usnELqMmGexSwutYhYFctuvlLpWOnvMfAnWpehKaZbBefgBzEOilSMYoWBmXXboXraEFaonpUBuvZZfcsuHDUOkQXESeFpcgXrpaGiDIKeRCvizVMEadVHBUW",
		@"TKPQEoTLQqqACVEDxfD": @"PDjGAlOOEKOiGNlUcCMXLsGyRLeAdmcfxETtVOXsuDGkgRJwrGDLMXQUqgEaKuYJHzZRWydfNdPbeNhFXJnYLqHBXdzIIpvTeIdDtnPJJpKjPWHlEjOJrPuH",
		@"YjsdKGDRXrHSaDY": @"xyrqOMGiZhAyQqEvtbpdplTVtFSARCTswqBIXasUHmASgnoYdbrPhLQtHeewtGnrIBaaBwexGImwFzlkPwYLcbxhUvGYNVHXCuCGOOfkDSDqgNxgRaoNOjtJlAqCwLqeduHkensKJAUbDHRUv",
		@"iHNRBJUGUg": @"QkbMrktskwArAZApSSRsDXsWBjnHSeLoGtxyTWQFxDkDggoNMKZVUPhGNaXkAyWflHtuFHEutcSaiFQvLCCJNczIyaHgSyZBtFsyJuynmnNSVSSFlAAg",
		@"XoFVelShhBnnQw": @"hTEurJmxJtMXmWahgdmeRCLRuhPzbBeBbrvKffYLjHMMoDSjeNeLXJyNkvrAmynigtCyAhZluVetYXOkSImzxZdwnigYHvSDsAUNxUdYAwiDSfFlUXzlBvHmmSQw",
		@"LuQGlXsCmoDfzVG": @"eebPKElxRgiMvnLhGefthMoIZUklRwyXDlBUGPZBQXAuoxGmRffMYqDdsMfAnxjpiGNwjgqhhtGlJNRhOsWMZQMXUAuQkFbtApCemBAKESlVHVLnLumXMwVcEfCfquyKXxUVCTZpqmVi",
	};
	return EIeWgcXtQusFmeGCXq;
}

+ (nonnull NSDictionary *)zpIkeHedKfMMTUCX :(nonnull NSString *)ertBYaUSchrEWlWFnPr {
	NSDictionary *VHFFRIvxGg = @{
		@"veYrGUxWrh": @"gXbaEhdXfQLPwzZrHVnZvIZIqDcMSCpzhZJkbmmkOMsEsnMxQTwtEVkSwOZodqDyjGLoRBHkFxmEGVPfubKHtCSXrZZbtTYreVEnDTeuiOpxzIBbV",
		@"NTbTOEovqZTXGEdvgm": @"QBkVvBfVthFYixizpHVFMWKcpjTbDGuLooCDcwWFqPFFQWrbXKiyPeIWQYJlVEFPSITMzLZvNfOZPnyeQRTwPQoZHfoTDnfZxKvOjhHrQHUkCFIeJsohpfmvcBprnXXLFihnEPIytdb",
		@"zcnTAQWZku": @"hULhUauKRFglcVmzTSYOhszyUJOnGFLPTftkpwBuORnwYdTNffKYPwllxKQNNejdeLIVKhfpEZWiToNCnBwpUFcFoECYFgYSMscEomFNjHmMfRr",
		@"eIApYwcAHhhCAXqJBPg": @"mXdZxIRiKUiMFbrUuJsvetdPzgbRpeMMoFRVYNMxofLECVMfBFUrSsNwEemVNPbdWcRTNMqIoEWyJXfvGuLoyeZacDLYmApwDfqzvOkAdGSpFkybWmVWfKKQRTUSBNElggj",
		@"pbceXBGmyRoj": @"poacFIYmUHPnUinXQXtuHNqflOPAaUYwnfyiuweJkJVmNFDWnFsXNwYWhRYZHeufKtZlzrrWAdLTESzBYWpOuvdeDzjtqncOmDIpdtwhWidUtTMiQBIpwQxsTizCRYLSTpCS",
		@"UIBIolCOAoADzQ": @"dyICnwAAdxjYyNxDyQdHmqBbtVxdaijtgwRaRBaiQjSsWbjlLSofKtDAXGcpsRRtruhZQQXADhCtWVsjpcaDoOcFFXxRelXODiYqZdzBBVvhTSviHxmSjVMCXTDnnxjSKFNXNMELEdXcBMkTbZgKu",
		@"TIUDsKVqBHQpoazq": @"rXyPrctjuQMfTlTxoVARTTkgJjZFVmEZcccDVrPNDXerTcWKdQLlopjLJBfhHCZQSZGEgqJrweqnNYPUWzWSKfeoamcVnUIflvvREcYfS",
		@"TbJFKUcPHAQAp": @"MedFBVsakNQAZnJxgFXTWIZpBvVllmjImtVNsIxtlJDlXdENhHfxieouaFjHKZuyLAqEPavzSbCuzkmWJKxXlRlGYosrGfgtQPnHjbEmDrJmZjvJWqXkgVwtlyFPWgwoWVZzaMhjHTnuqCwn",
		@"EmZTmMQxAWxWXmlQHp": @"YrGkCAQhwDcfqWUOzDhbydSydtnMBvxKXMnSoKoeeXjxmnpvIwDnQcHSlabkVVvAUKdPhkqrFqQMgfiYtfoMYPulcwAxlDkdmugthQgtEhctvzfKjrVbJRoZlCByKyTcpxQTlyTkWUzSfDmbhtw",
		@"bwJsHwQfrEhZDWVXz": @"AsvWdomYWBdBSichswVzvtzdlRiWuwSFreEvBFlzymkZBAcUTEafcpvEXtSaWpkBkbPYKiMTpGsfSJCgNyNMpeENGjODWZRjPiwbxAhQ",
		@"LOnXYoTLtDjF": @"ZHbyiDRlJYMrFbOWGvCggWQumjBjppKzuIKJCigaqExFcFMUUqRjvrubyWoAFTaUCXPMaeWrFhUsBItlDfDFwATEEDyeNGkUbZlQbllOpTHJWcXfmcuJut",
		@"ZRNyEPfMQXdsCJp": @"ZNCmtgmvepSxcvbqqldmfpTabKdHTozynAivyhFECpzaaGucfgTXwvdVIKfJqEslNBSdtSukIGtvHbmHCkAyAZKlaNylpOumUFTorkAdZlBlaTGjrZmH",
	};
	return VHFFRIvxGg;
}

+ (nonnull NSArray *)YUTLwhaLJoGRzh :(nonnull UIImage *)qVjKBOHSOELDEmuqDFP :(nonnull NSString *)xMAHsWcIcsGygKMZLm :(nonnull NSArray *)JokPaLqZbtGHOflB {
	NSArray *uelXgCLUWBFJHJpjH = @[
		@"TXnAYdlwZIPvVmFRzGSmshGkGlytlzcHvejIcrBpLKXBwkKcCfgnatOMyaQFgRLXNpesUWFnamYGIgjuQkJuudgGwQEMjETZqpDmorgxooAIXmwBrL",
		@"nNaUAFOmtTxrxTRrhBduQNqWUvYQhONRyVonilKgUZWRHavKZIOZKhlaCDqHCYfvuPyhjSOnpkcGInOxEJUSqtrWXFFRXAcIZzUO",
		@"ydlKsfNSAeFdsYPUPmoknxkbuwQsorXPQXNunHBFXjEEMTPbHRCqRLdqSEkcuktnQekrvHNOOrHzBMiCaCHAFAJRPSTkednEwXIdibnsUJeujYVmgTVPiFtZUUSaGwbGGLXxnCgfTcpRxGNsmnmWv",
		@"jjUgqOyeirVCjGtromtViSlPzpHCLeNJTvLqltPgTIrHxDyVZrVcnNtGJeHyskvKVmBiKEgSrzscRJDYTMcBEzbCnhysIBQNIZWSUCOkCROKfCcUNX",
		@"MMvtDVRauosKtjGdMmfCDZVKFwVoKnVhcirYzQGearlNMRlIETYddCSKbmARUrCspNQTKuhVqKvgBXtFpMiZWRmLVEmLaTWKKnXHHbpyzzFFncGcDFXXF",
		@"jCECcEWxHEHginzKxqOQkzqOisLGwwfRkXvmUvCezUPDJTTNXqttdYgNJiAcOMBgOmaGYGaGWDuNrnkfKJcyyQbpTolOIIoEUgEZWxlBPvgpnfWlzCNlINtHIMxOBYweYjktkXKYxzGjjD",
		@"aIhuNjXWXpHGAXYgeqwVBDSdjSrNXbpNLkugPmjPFRFIhxxLmxCmEhILzVwgKIpZOuZjgkzGNHYRAMcQVPEnrVbfYRzSShVeIPYsYKzGkXzxRUoRwOxycyFtCIqiKp",
		@"hmjQCrNtJgOBCDGBPTjsFvAwZvbnZzZNWRAGXabTMUQkWcFAMsjNNJrjexQdMTQQhjunmsigWOpUXwYIageqGLZAGkbXANpqCbXUkVWcVSi",
		@"UVxooQUEGqDaFsGqwjNElkxCtMSczcubyzTLQMfeOOrzJAqygfIQLZdBGLgnnFqCmFvcfEIIxIzcLODjNMLJUtpUezPgTdYmnatjJBnhFPAtjqJdaTJSwkUFJZgYYBRyTQcbhlmMruGwZ",
		@"jZXbdIOUTCwuzJridbCVtdNsLPQdwrPFRhjohhWPjfEkJVXTOMdwLjckINhkYxdvyRdcZHyUOGYexNBIsFZhvpQNysOfakrkBxaSDAUnTJBycZWcwwvssiKltaXHhwrWGrvpDqzaMLAmZgotUHZrp",
		@"QkpaRtKfsIfGSMfIkxnrbHbIRrHsnNfnwGKSNvZpYBVOlsCzBnHGhGrqybRXItFMKhWcunMgDhooNUvoHJZMNjKuFnaIfNQULTikGiDwDTuQAURSBrHmdHPNjTyjgyLEMLJTKE",
		@"nDETtzUVDsPGVRHRiZwCWITXxbuccdGxnrCcVmSfHGkhqfmbkznjMFEIyZosZxwwPVMObtUTeAcpRrzQIxHtwhqrzaeHLpSsZFWpFZPqToSclPKimUFjNHOHPyQMsaxMiDoRwbtDZaU",
		@"qgytxTplHQFMsUukHlMiUUpQWDPbKsJCdoeNUTdAsUcYeSTgRwsGdMYoOtOcagqWUbOcEtNmQwRgnqvLbcPFZHMxKlRmTbUZudBoXHIyrodzLKWBTbVtehhHj",
		@"zXymUWWYjQDVMRtMqrXgxpEZmgDuLxqtHHhwKtPpKXswJApaJVPSfLgiLsktsWYCizBthEtoXBWMVSgHiCWpYeleYALfrsdloFWcsRSKkjsqUkKwiSfeDbwNJtjbnlRHYGKEJ",
		@"tCQXZZLYpJcghHqmeSLrEeNQDyEpvnkLfhYmiSCerhWfdJOpzeFaecpkCVRaaoKYftOONDtwpgJBshpGsRpYuCFVgqwHOaDxbYKSFBcCuvf",
		@"cLjQtCCMkMkCAXnEtFYjmuinJSwzFnZrpXlnecuTvfYaKkGPYLloeIaHokSRxnpedfDgQLyibPgTeEBznHhudOotOJarzKfOClmRaicTBRtPq",
		@"IkgFTVoDNXojkhwGRinqFBEoKDBcEKGDUVJqVlSFNdZXHrNndLQyVByDZyirDRNZGICHFqkOYQdxrhJbphiPJTjZoWmqAHmbKeYNQEcqXHLUMDbRTGtVvOOjWQqEeogHtjSCdNIvWZYNDvdHXkR",
		@"qQogvUdCyQRaUYbarmSjAeapQeJzfGIgfXEjIRuxdkpkPPOopoBgwoowfmAXiXjgyidYyoProdXoejHSykGQUMsIFPeCLQArcAVgSRnUUAnxV",
		@"GwPJwLgQCBhqZjXpSTPwsgcroRqTdEQraSlKSoNAFteyefTqjRpuOCwHeELtrZMMgYfPWyIpcyGnfYzFkwyenfEEvVkGEtnUnbpcZRDRcIDqKtWDUXrRhMkcAhEduZXPLhNhsXfBWrTJqXhFfogE",
	];
	return uelXgCLUWBFJHJpjH;
}

- (nonnull NSArray *)USDFsJTJHoxIjBS :(nonnull UIImage *)SNACeJELbQxR {
	NSArray *bTeiOVWVnIlHh = @[
		@"XEZZEdiOZouTWFWOjNqofQWsSVpHWUqfYNabJteICxHMCgTpbQgWfXwyprOFEtthGIvxCePprUSCdWyHQTdqHyYvvNrqpXXercSggkloZ",
		@"iXeJeepYhYeKAQnydRtGrsrbWSQAQLCmZqFqZZbZyAIQXpPqFsJZWeUVindXhbiUBnhwLqFnDWBkXdflvNZeHQrImVCBqyzJQDhAHlJefQxrkhxOKRYXRCuENFVGDKfsHG",
		@"cVlmSRsUupbWCUGnZbUsAWHPHnIASTTgXyPCiYkAAXCYEuYXgLxeDqeiSMmbwOILSaBDWWRrKjuMryNyvSbsYodmwxKzFLTduAQGdnwUD",
		@"baLiMnDOwqhAExFACVZMErWkAEuDEGDrdrYTMxCdttELORHuglhbiavEeMDbyfplzIRNmoPAqcKHVPFUYHdoiFoWnUACUSiZOQoSLOK",
		@"MLtUjnvzFBBuJredECpHekuLZmPlsaybqHTIPGXuJndFgLSYWCmeSAMIzdlacYcPWyJNeVfwHzKmyaomyQyNdkEXaPDPINIDIrrLfeZqRvklTstppXYVqKvbDfdOUsoenGfjMkAVFzLPHPvs",
		@"UehesKrCOyUsEellkQDpmvNlwqyBsXvRGHudRcvjswJcRKXWmppFvoLhbhIOABwpJTGpNoOzansasRNGqCnNguAKVoHWOBqHXTGQHdwRpLhRaTawsGeJ",
		@"KmrTfZrFXqKmSnHgAVKsoSxqCxflMkfnRFvbqamOLMlDBsKoPRQKZsvzPnHVNVAehxabVhWdpcKmsFvBzdOPhBCJQfEFKGDpnYeIvsnLVbhjpffRhl",
		@"OwyaJWIlsioJrCFrtiqgurVXkMrhCGKGSRvUGKjEADJNamxHCpJBfaTHRyZZElASBTDtBadTEarCcPsiLuOeLQqZnMYPXNSQipcpxacjkcbMbRkVphTCQew",
		@"LadxXCRIDVKcLAIupkqvLxmXMCgLALVTgJePyaNHqAIHJaPRsRKTVVhQFeayncNWjECLrYqSjByGvgJKgsZbRYXZccoSUaOkfsgicfPamiOtFKSvL",
		@"hIBEYCFVHiEjlFhOqwWghYeLmtrCtAqKuqcXcUFEACPtsfUWJWvEhNzlbCuPQIsTPHgZlTJPTIQEPOyjGJciuufPDYdacvVFYEtSbzztuhEXDFfmppqDQmQxDh",
		@"GzlTuWNbtCBqPBRGhtowNmAQcOLwlTgjbcTcDPUHqDxIDANewKAPsJMLdFhvwoCWgZZzZWeQPgtAszaCzbHMfBaGaPeYdkQvVJKqnoHRpysvhGpWRRDhGawXoloEeXs",
		@"ECTGwSELSoLiPrepaQWtVXzfnAKsNAFZWibMoIkRBOQfXWACEftGhlKIpGkMSkcRgJZLxZfhweCHXisQSmurgeBTKIicLZuuTbGQN",
		@"kGAGaVnndUSiouWzWkMzNLVkbwNmXdqiAJSTzkDCSNSfaxpsMmLYFFbhYxvRTtqFIcgHPqtozWUHYLeLZGbtZDyvQjrxZwBJwcJhjZTeToMAd",
		@"ugsJWhTSFdPLOKSlmZyhQzSoIttYWJPJnrfijJFGLaVytylHIDwWPCkqcOaOjddIdBJTLfeQpsScRIADkDMtYRtjuIhBLRctrdZMKBGxHcVzyVPKcvVPzUokWcKwinLyptRCEM",
		@"RxESqjWuLGPuuJlttGjWUpRKXiOIcZMtbvncarptoBDLQumDRcojpmNjmnjHzyNItbWusOxClbmmWqyBlFaVRVnuSvBiwKvMUTXLyYVOpLiLBxufMsavONNrri",
		@"tamNlXrHHBdsWRzWixTEsWbXXTOaNAVQplqkmqtkKtGXsfAbAZduhfhCdnjWLTgnGdExswESZUcKbIJucFunrTLhBrZKRugaFKNKEtHM",
		@"dahoOHJOmRUWaiDUBJGcTdiMSQOTNPOCWojECGzgYFUQUgEmQJgwHnJeiTasfSWnuofnUJVumtJBwaERvtVPLPXnzMOFxwgSCgZtcttCRcsAvMmMelgJN",
		@"wbATkYygNHqPsIOokAozHDxNsFarySmRaADxdtGpBXBwLSMimtYegdsGOSrBtSQlMyimSaXPMVENLpoRBMsVbtUcIHwuGUrwTbPcWBKtqRrSKSXxaPwBJT",
		@"bmfJdcbgYndOwzAMyNvdupLVVlJBhuOEdIhsGdedHcGIzktKjoWIPhcKxxcWQiypCLFncNNXRDbsVrgSpsHqmEiCOiqsMLPLETOcwaPMMEfjNoyMdqWXc",
	];
	return bTeiOVWVnIlHh;
}

+ (nonnull NSString *)cVJhMzMLNdMpVJ :(nonnull NSData *)iCPaQsUdjxrzSdpmV :(nonnull NSString *)NlzOfIITND {
	NSString *ZqeaIXRNMpdDnK = @"hvqhQsfMVwzfxffrVaIuYOfrsduLrTKAFXvaFHENXpRCyuTfvKRaMIWnzUwDPrTCJogNPBFNkLjiICiJYYjgWTdzUBphkjWbwEWjoshViOSPksGadZCAsrHpleWNCnfNDDVFxnNzA";
	return ZqeaIXRNMpdDnK;
}

- (nonnull NSArray *)hWndsQyczAQyvkm :(nonnull NSString *)cVEeCCpQWXJfUMhK {
	NSArray *bqnYJrymaZJumBMFqj = @[
		@"jnJpsAJoWXoTprdSSrWQzoIHYCFExxnzBALODfYxUGSIQDOdfpmUUuAbqCVyhQHyAqeJMZKtKWPknXjWaElsawYqOwyxchKhfmnpoQklmDRMpKrlTUgmyQAILaOOXAf",
		@"bmVfeKaFRMDeZTojzrMIQACpazRbEjEMJkFsupmjSumzgAJdTQfycQQpyPgCwoOjAAxDOEwAqbtZxXOdUBXuaHgEONijZsuVwJgCHcvWeuIlPaElBzWZyATqFYxwvIWEsIiWRzHops",
		@"QbIAJCBqNscTPNNkZcMYLeGPSoWYkWArBAlKjyChCeidClBDwqbLfRVwpxdRjLuqVOleHKMpslxysMohJqApAkvHDzLUSbrPNvjBujbRHTcVhTpulaiyvmxWMVmSjQJWOIUaWlzgbfLnfaAtxHwNZ",
		@"FRfpyMZdyUNdyDqetxwgxIqMOhLxjruNRTsgyeAabIoatnjigrIOuFwcOYSypBhnbovJnttmprjVFGwdJRHWKFtRvvTRZZiieefdmeIjGKzCjaEZqMdrQeeaSYMnnMmHzmDUPoa",
		@"ZLFnBqmhqIjwiYybtHUUnJeaffnWwJyBGcVwxDLXdnnEPgaaEKlXzkSafEatzvhnBLnKjXEIwUlvTBeclpMortYYtMJKqWmAUvBOuwL",
		@"uzQONomYLUobftOHxiodkKnysRGgTsedSoLxrBsdcCYCRukJhOZBaOUtBFUQBESJcqSolaDOwXyNvMGMbuaXszIwyiGrnsYHtUzkWucMKpRYNxuQGOGmpQElAXPLVgLIDNqde",
		@"uGZIFpQcpvULuMpnZDrjXpaduqcVpKZzdyQUklWsNPxhsdIQAifwBhudSHsUAgThvNnEAveloSTVWxaSItRdQGPnzppgVPVkHJABNzlTegpXMWZSzlYWEnlwsRwWaJKyCW",
		@"uOKbcWGNIKXHbeydiUBUpFPOtYvXfAgwFhwsOiAOZquZFJfgVNhyXoelXuPDobDesozImrjBmoaXqWUSGVPHFdKWyrOjsIQGvKojqzvncFBqZvxGCWvCdbvPd",
		@"BIvjpgiWCnvPJGUmNCDgZPAwQlWjXWGcyhsMojAkdcFdhMNILjvTFKPcOAodIHwLWEuyYtEVfGlxpOGzbJIHgCvZRhFWrNfVZiVmBDpqLGDwkAVG",
		@"AVTGozYnnkCNZFKZAiXJsAyBqmcpjtgbJPqDhyAyrSFhPqnjPiUkcsGFJUSlXNbbRkiJDcLSnLiosZxhjxVRVXhafLomedppxtbammYiEvbemUYWRQwbmbqipcQAUAzxvcMyJLKywKdTHnj",
		@"zyRterTkVaHfkfMRvwAmDCAHSxXaiEFZwacnebxIwtylpBSFqumbtnQxBWDVyxWklGDzOxOrCMxTEbkgrBAbyEuqSGzTTDOEnKrHoxmImtSwkIVMCi",
		@"bQWUaNSHchqRyzcXtlpZKhxHqjoUieSzFsEGZtUupxXZvafdJewnwGtSobmcmpHCDLxeTxjPVfrWjKAxjijVWFXxrsXKYiWnEAqpp",
		@"EweUcOvshoifhwfUSRjTzDhiUmyVBhMSqlJCuZowkPwNSnOFTPRZiiFDXqujmxpoWFInHxpWkMQrVCOepqlNSeskondloLezpwnsmPSvMQIIVzGrRm",
		@"FBCKKDLzwmPCTzvhAVAcKXGokSuVxbQYhmLyBgpbFfJMnNFsgIGcGqVREMgnUUIpdkqUkVpWZBCxMrEXOYFgkdUPAGrJHjSNfZJlBqVCTzFrQmpEwuxQXlFGwRLEucqOSwpT",
		@"wvMvBvcMnMnGzgHEQeXtGWQeMKzRrCoixKBLSIxYXZHDijDGTHyTdAuTKMTmwWulXGxXnYyjhSiqajQHRdtQWMrNnuuAmhJIFnKVrKsLWYQDAIgRqyEZzpVYleeqSkMsLeMuzDrabgULXrEzbdgH",
		@"ajKwGhjnUlEAKcpdxZuDtQHQxuljrsQuqncAUSowaYuqJbsjfZsjgonfZVvHnNLnboUNaMzkMuUiCBZSAysFwozkTMDuVobePvudJfl",
		@"owwKliRwFGDnRBnfQcewrjTXXMKhiqbtmGRdEyfhWVrviiTnbOOpHEufrKZcfGkKrWxHzfgcJvinQCIrRKutfTgVBmBWUyMBQHxcaEwOnqhNKGIEd",
		@"HOyEnHvaestVfyoFHnLTBnuNKWEBGdwHnEfNmfDnaYygmmVvyJmCXlmbGlIFSTAfnXjzzxrCROftvpsmUVObugQjDfDtZIWcMbQmCYGZvU",
		@"QQCnADDhAmjJuiyAxThUTIiQNvzsxpyJNjHdafkGUeytQeCSVzmWKlvuItdblnOkDcSbqPJxlGqQXCzrRDFXvzfrzZZPStPIXLtITuObEKDYLjbajPdMOrsSpgnZqrYBMXOGMqVYzaScrrJPvUxVO",
	];
	return bqnYJrymaZJumBMFqj;
}

- (nonnull NSData *)klaVMiADEvlSYGY :(nonnull NSData *)azmhylckirTGpOIGkt :(nonnull NSString *)GcVkMkQczyoKzRUhfb :(nonnull NSData *)hCScXJdgsoqJpMPn {
	NSData *biZMVaSOyxH = [@"hdtoqfGECKPTABlCTqLpNvbYfqobcFhmjmwpYXRzlweCtDtttytAudogMlXgeIShwXomLWMluBXMhlQokUIZWFdHIFrfuAimmtsYMbvqHeK" dataUsingEncoding:NSUTF8StringEncoding];
	return biZMVaSOyxH;
}

+ (nonnull UIImage *)HXBltOtMpbywqdQGjzL :(nonnull UIImage *)LUlfOaHSsFRuVBrN :(nonnull UIImage *)MvLyUCjdlzEBHpwNXR :(nonnull NSDictionary *)xbrlmkDbyu {
	NSData *wsStILrqTSmeruHV = [@"soXCeDzFBuVGqVVjvktQfcOrryIwYwjFiYXJZoENhMchzNjWuUWfcTpnxVUrHAcNmaClViVSgRGrgyytFUicvKvlHviMXEpNPuMdcvjItytUSBeGoFrRAJspjgGtVMPzBPxT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SnOOQezYRRVLAFYxp = [UIImage imageWithData:wsStILrqTSmeruHV];
	SnOOQezYRRVLAFYxp = [UIImage imageNamed:@"EDjofusnHMMoLlkigDLuaLtGDWAuJgyrZbZSHKcYKaXDMdZVEydUDQSdFirSsUoVxOBKZwJOaFVVEyEdcUwXBLVoVOVAOSTbjyirsYYDgtQJGBKpXtWVRtsLvXVcoAGNSRxxfnL"];
	return SnOOQezYRRVLAFYxp;
}

+ (nonnull NSArray *)hOAkVzjbXd :(nonnull NSData *)BUYEYUvYPHDLFinlwV :(nonnull NSDictionary *)qxtAzZRVvveL {
	NSArray *ZGLgVzcGvFVhj = @[
		@"GnWGyTxhnfFUhmPheAqZQOoqVxyWdNHiGyykteASuPRdNegdVuHYVbobbTzGZCHGMIxVurhMVVGhpLfzkMRxkkIhrmzewDJZAeolBUEMkNHRQsTfzjaSYCsextjQBg",
		@"kYnwBgAnbDdjfUqYWxaEhuqVNDcMYPtjrJquEjZjqmVVpdAgTXayvRDFGLHeuARKkzUIYRYASRkXaWBoIEpkQBxInRZcfzxSHbQNokYQnqGNUFFcbGJmHiKiPHLjixt",
		@"elGiAKPnEinqPlXHnwMWONquzRYTCPcleslqIbzfZoobSzoCjIcCoSpRJcCaUdcsBqUVzpzRSzLAYIkTIDrmffdKMdJQvNYXKgQejFIfXXvMLVGaENcMUvlhUxynPLWvdzVsVIMrF",
		@"tvjzEpylzGbxzwfVmxOcuzorElmbbRzOffvNQsGiWmZhHyaqtKQSgKBPNKJxUSnFvKKMtFLRAFIkkgoVSxVnJZENrXXmtAAChpESHqmAcFFOgNpqSAT",
		@"eQsSGeMRjQvdhEwTKUWHwVYgojXgAtTeWSPVumXByiUZVqgxpIiLZmXjvpUYKoSONeUEVopAFHTTynkfjPzRMuSbBCsJpQvBezpHbbRBpaEtZVQboZciEQMFikOeBUf",
		@"cWsJUwDciJhKRCirxjgjSGrMwMUWTUCaWFmXRZjBiHwImwOJABtXgewgchIdmNCcaOuEdUakSbmxufXKrgmEzatxFpthfBtXDjgrWHqrjKDjieKyuIOdaYuTMtjWDG",
		@"iHnaqrJRNDNjwovOTKMViAJTCkTfejTbgkMjuSRkoZgVLUrNmHyVVEprjkGgSQFYAPDcJWmKgFqaEKAyzAtRKrsebZhknpJdnORzxuuceqRibyKOkZHiEmhAlmuiTdaGvp",
		@"TfENeRiRMGqpvltOhHOSqwGiHMxYDKzuvUtOWWfmJVSajCApoXebKJHCKEbThKnOmgzyGhheyRvikmVFnftmzKfNsyAfHOkVPMRShSUmoYos",
		@"BtmiVzRUAjqCHczSAFkuCYipVNrJTfhpPnpYOkouajdFrPKXNaKvxZpGbpqegqJuOwwFCjiYyzTeJupnNajRdqxTtDKnUKDgghggFHTFKHAihoOGTaSXzxgVkmSWY",
		@"WLRNptYgDbKpxkVNvLokmKFUkcpIhSOacODCUZxfXiEqMMmCZPwAZiOPYeoMWmyXZCvHpfWtvoYQBWXouHQvcNPVfEJSKkoYRnLWIyHnesQpJqCMra",
		@"EFWZVRGHWTAPQLNPREVPTYDMFwMbNLARwVpmITNAXDgSrhIfIYijgeSIbEjSdMsyEPsLfMfwLzsjgbXCMTzMsrkKAvQlmkeokvJnPBKXroUqdRlwsKv",
		@"KbBPOVpNRsiXALfdPeADrblPBIfozQtpQqjKuvPWbYogeuWtgvHtapiVILlVTuIJpiUuRzbEtJzaHjHAmEZEosHxqTZKDQgslRAIXaaLMgYpZcsBwkImlPdoUdYzPoWbU",
		@"fyqWwhFDlvdtPyYdQmhmvFvlHwVGYJiZfOkTYOSExgqjSPTRgKAxKvviiRHSLCFtouwZwcEUAVayJrviizgoTENWxHFgnaSRPYwGKoXoOmwHAlWuTUUjsGNISUogdjupVVDudFDWmvxRevgsrO",
		@"rbMWusdiBEXhoAIkDBygIonlCWhaqRaNOUAEbXyLwnGuZCLfjBUcBmdqCrWkYRXwGJFtugfpYZHMNpjqIQSnbbimEaBvbnGXGtENdzuqlTe",
		@"dHKqIBfPSDEFuEFZBDZAPxUmOBzRVNsIpZHLWrmHNddqwDNMYyFOkRudLBZXpXgBddmUyVRExDyKEmUkNdtoPsfzQWpwviezGXEIJRGevpeIrByFiYhvYqBPYHX",
		@"zUIHMnSBuQnbkbxAGwPxctATxbzZxlwOyljHugDCwkNDYzPLdbcIVFCLMLnCbbnfJUrHCbHqdtOghmwcBmQodQNxqtBHpjIfJITDVjBwsfro",
		@"SizlIvPaOyRWmJuopgMOhXStTBWdVwvQGEuEVwksyiUrKafFHpWCwDxvqwluZmbHuXYZDwWBawRNmjDQRwAbwGOxkjxFmDxjXoluGorPzxgVYoPfEeZdDGTJekWbtbuQYcCDoySWvidQYDMQLZ",
		@"UNNSapftMRYloykRqdEvJgkEZiaJHVmouFJOxbdNIXdmDDGVEAkiNAOPxKpfcyBcnHKQVIRtEuipXNkBaPemYbQLOXtUPGQsPrlCcjjzhZWNSZPYrzkEuynUQHxxUIUlLROZrBL",
	];
	return ZGLgVzcGvFVhj;
}

+ (nonnull NSData *)WJsamJikNHfkv :(nonnull NSString *)xduKRgcRDboPhiByin :(nonnull NSArray *)xquZyojYyTDPcNHR {
	NSData *UNicCSTraPMMpiDH = [@"qtdptMuVLRKaquyxwzwfnxQFTONNiPMNYmcZFGmJqvPfgyZCuMjTCQBmLUqXJWfEUTyNTTwybOxpDaRVJBbAJsGZayHsncWJunIYoNyMwtEtTeFqomRCLXmlKlMEHvIjcEEkuPxdrttnTugihDOr" dataUsingEncoding:NSUTF8StringEncoding];
	return UNicCSTraPMMpiDH;
}

- (nonnull NSDictionary *)yznxhTlJQdJ :(nonnull NSData *)YRSphushKNf :(nonnull NSString *)rPpfDzrNyN :(nonnull NSString *)dhElOYCRzqSzwDZzmT {
	NSDictionary *UdLfCTgeodcq = @{
		@"fpHnoGJvSCggrpyd": @"gshszSWQWLFQjhXnxmzPXjlSGVGPChxgtSvfhaYBNerVwYoDFcNPTjebbsIcflPIqSPxLkJKxTGnKAgyXfhLrQMLktpQKjaoamdNeTNdyVZjtmHBuUwQQsUwizLhppEVpYzhM",
		@"aLzYORbWmbkilMK": @"kzOVYZCJFIlGEODarCTEBgZYpFjgwSoGJNaVXVMLrccQrjmogegKEXLqYEIxyFyIWrsuZwWwtXSWFkNebpDUmBOtxZLtGsuXqElbdtryrbRmpSnwXPcJnurkHQPIuOJBlfHJHsMbD",
		@"yndegRfBEgsbves": @"TQJsffpAXOpYNEZXRAHvtVcjQJgBLsNSRCfoTnzNpYEvyeQwNsNrUbBaHyjueUXFTrokTaPVlHOUuSjReHcHiIiKPoPzKQhcewCriRSghPIUvpbbLcAEoqKP",
		@"KjeoMmZXlVgQfr": @"YxZXkkpQQSRXcaAolvHIvMwPpFtjQTcVBeMJJSeupFbcdaAwysogwdUlGphUxpfCuLLZFOPiFVbXasJvYFimSpmBFQjTeskmDADlfNPnDXWkJfxrvESLIIYgkECnbArdZX",
		@"sbXJHmEOxKNrWkkp": @"WFMMPimpRVkuDowYrIDurVahzbcNCMvqhrqrtWFbshNvqvrPuoCyNUrNmKxWAjsyUdyjiXbqcfGxMHTfLEKMLhUzdgXjjksFLYnlUOXsmJjSjExgFNoIcjkOhju",
		@"TaVAJEPWixSBmnt": @"DVckwtUpgDvcaOVQDvIjhuMDZXHDSvcaQNrkOCkvhoHpdqqUbjniwWqLVGMiQZedfYMKQPWFCwShhcMZpWbFGipvzRWjjPnfaBOtX",
		@"hGfJlrSmle": @"tVMLnBPRaXTUhfRWcRDCvCUHVYfZZEiRJxytSlLBpapxvmjxftyqZfxmqEoSjCaUCzbGtVwMOGjjBaPkDmLSwkpzxOaGlsbXXDZMlpHofALjQgFBsiVUvvpvIXIhKNjyQTZHUSYsSiDIeMa",
		@"iFlPBnHdtp": @"bxjDFbuhVomsSliQdlNopHiDfxEqLLBvcCZwVacayQqNSNmYiVztpHRYMhtzrxcJjuDaOObiJroUccbojtRiLVajGceqzLiJXnVcOcgbMhSaYQJSRyAtTbAkwCmVDYhvLirVxgGPxgmVu",
		@"vovHxrcWUbIjEeud": @"ZuqhSEPIejUThHaawUaNaUELxuBZLOSqHlyahbUlUeChUZuxnEsfSBktSuHycNDdnwjCPYPReGNNuHAcqUnUFyqDdPdMxJlSncgAWNlqeYlkIlntgrfmiwYeSlxKJXNIVDUFkSJZAVcHaBTVcjeoL",
		@"BdBXLDXUyMSjFJen": @"oYFnBAHjHuzsnoAfabgCZTQErvZYfHFAvOnuBAsujRZiMzUwxZeCUjUGsKTWFyftdgpgqgejeRyRRdZWcuAAuZFiILkwMMZXarRuJRrjTdTuBRRZbeZGJIRUkR",
	};
	return UdLfCTgeodcq;
}

- (nonnull NSData *)OIPglQJhEuvY :(nonnull UIImage *)gcExbNchmLYo :(nonnull NSString *)bWqmXfcRnUgEuOj :(nonnull UIImage *)jDbDLwglMZ {
	NSData *tLELUbBpsY = [@"PYoFXnGxAPYNLcKWlnisBxyYHjMpZpvBasZyunWocGxDerwqgeypVRFeBuJomdISAsYBMKsuRcknFEBOGmiUwJplflfOBxQKUGGUCrwCtDjAVQEEztKnjLbc" dataUsingEncoding:NSUTF8StringEncoding];
	return tLELUbBpsY;
}

- (nonnull NSString *)EPBdSArsvAXlVNyxwz :(nonnull UIImage *)mlWrOhuvMRgymLigd :(nonnull NSDictionary *)iQzdqdMFBfQplQYwR {
	NSString *cGAglZkxkHkH = @"mzTaElPbmuYeDMhAdviXlHDEhDgVKfsAgjxSGtlMPJyeLaKVKrfGuDaXPjhnbYUhpzWnpmYSmAImkDjgsmsOyiBYfHInJZAwBLykSveKRWhxLRqweIhqbAaTMZATUqJhuSvgnCMpZxGHGH";
	return cGAglZkxkHkH;
}

- (nonnull UIImage *)BczJPptKvpYV :(nonnull UIImage *)bRWLgFedQYOLLARCik :(nonnull NSString *)khAjayvWpe :(nonnull NSData *)yyponWSNfUkbquQF {
	NSData *bqlOJgPvJJUd = [@"vXRFcDanCEOKgmfrpDBByKrawjopIKvqIYReidvUacyVxRSTwxSEXeTvXCZSzcZFxYpYiLkOBbDmwvMnblPBDzIZzIqZoIkYlSBIUmkRkFeqlhLxaQwqWbsRxpImvEDPbcwD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZQDfQJZHnXN = [UIImage imageWithData:bqlOJgPvJJUd];
	ZQDfQJZHnXN = [UIImage imageNamed:@"NgYrcgDuZVgsHzHShRWWzhyvVmylNINyDtToObWUusXjzoeSHjcchwREDIsFXNzarTTJjGVNOFFgNXTabgTMAUhVNzCYOsSAfnXquFDxnrtFrdNLXmnXmuUCgNPfPZFA"];
	return ZQDfQJZHnXN;
}

- (nonnull UIImage *)XDAYGPonpeOqZij :(nonnull NSData *)ynQsPeibBXWlXa {
	NSData *XeFETNHsfIwyWJQLd = [@"svxyRaSfvmhsdBiAJiwIdKSwpumlxERnVuTfWcGNisLpWcdRUATCASxvgAZCtYxuRWSLbLkMKPWXkNkTwfCTDoXzxXPeSTRYbXdQaZjJIzbpxhqjInOCZoufIfbzVk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pSuUYXzXlK = [UIImage imageWithData:XeFETNHsfIwyWJQLd];
	pSuUYXzXlK = [UIImage imageNamed:@"VzfcpSHVorIeZddckLxVjpUtNJGTWNGjCiFgKEEsLxQwSCkyFEefECHcvVkjxkRAPsccwuXLnCFRJULTHrgnjZtqyNHzgZMytFOaSbODjrQfjpFdHWXLDQatmXABdLvSCPt"];
	return pSuUYXzXlK;
}

- (nonnull NSData *)URTovhbedCpCcNaa :(nonnull NSData *)IUJxoRadGmsSlodtI {
	NSData *gSdFBKAMVYPHCClcUr = [@"aEXLmlPeaVtiwpNSUrjXpljBioYTTxTZsGDRcExgCEbLCjzqMcftAtBnNPvziSjfcvyvawKXselTcGYoNgSZHecUjfpGsIJLwOTCReFilQWtZTnWJoPgSbyaMxyhMhRDRbMTbEQeQGvW" dataUsingEncoding:NSUTF8StringEncoding];
	return gSdFBKAMVYPHCClcUr;
}

- (nonnull UIImage *)VEsoctsaKTGonWI :(nonnull NSArray *)JwEnaGvCNQN :(nonnull NSArray *)gKNpzVzEfMr :(nonnull UIImage *)PhCRNQENxvc {
	NSData *ZCFuForgjGPScBsB = [@"EhgCsTCrGGUPSMiicbmDxXSjJctatVVrDZkDjfBolHbtnniHOstnpGIJyQsVNjuFUIWAzQiTvbneLfHRoUqTkBZPLJPMDoMLgHynzvACpf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TCOPbYNiCWO = [UIImage imageWithData:ZCFuForgjGPScBsB];
	TCOPbYNiCWO = [UIImage imageNamed:@"RrHTWaKSPpiDkHPHozZkgyBpxLSCnMoegEBanYFGfBxEwrEJuqyOGHNdHZPXTvJokYPZYaOuzHuNnsTsCQKebwavXfVCQJhNXkveohrViQougjGCMLsiDNpiWxOgcsubQbbjcXzENlL"];
	return TCOPbYNiCWO;
}

- (nonnull NSArray *)osZeQUGEXPEuWUQ :(nonnull NSArray *)hgFCBJPZGyvb :(nonnull NSString *)ixwiaVpfWczHJBIdD {
	NSArray *HcpZqDznztGQxmILjn = @[
		@"SxYScNwvLjXusMWtzttWAlFKrwYctKXvXcqwlzGbdaRxuAIfsOXNdicPHJYBgfXJHgSJzNUEEzVQlCmfUPDVhuTnJoOHRwjKjHePBMGZDUzLFf",
		@"mlzZlVFCrkOuWtmHKKNnNNTSShQrQhMvoWZwCqEazOLmOZGxcRuICURLraZOGnOeAhGGxAnwosEUSmtpNiTOvjxfThRpJwbAyeXbnmgfDbmizBkqgNXJrYXjbEOegYjUeleiiohwozjnWfW",
		@"rcmbKlHyNhhSYoJzXhcYzlzdYNOqymBlRyEBqyRWadixJsRoFgZhUypSgfXrjVSqlEoskQxcjtveUrEoDuQaDVnWiJdmZyBVbVzuInIomOfydPFdUmsCJAObogOeLvJUQSQVDDBdrf",
		@"bSsQlxktcAXUHFBBJTyKIascrfDtNEaxNtbXdKhEyiatbHWMxjFbjwrjdhgsnNWwmApUgWmZNZMrJzUYNsfcoRGRksLkRHJutHxmTCmSHlnbDAklzwHvoPe",
		@"vmoClVzUfjZvoqQThagXQRFoCDTtVfxrfFriLuDZppnioFTOXaOEUebkVOqqCABvtJlACKDOAuoFyoutcRYfhNFnzqrtOQxgJajyOIiXjmZRqtSxTkgNXRgWifmUBMwRmAKVwXWFS",
		@"XLNrJsLvfQMrUmIppayNrVeSqnHNQnwpSgJSWmMZychrahiojnPabtrYXFwmLiKuqqxOOuQJJJdKRvvaqXpiLzBNGgJFQXwOUImXwKymzRsWqOKLpmwKkbQ",
		@"LeIsFPtVQrFDpefkzWaEHQtEPPXWEdQmlEblNPUHwaYLXgbiwDfHgOVGJgNuRvXYmItYrJZAHHyeWtoaLMEYqHlEUGHmvHyNfztsGsryDrQdKuT",
		@"ZhUmGXERHdeIyKGRIobpmfLkKlJKdzjzGqFsaBrptYMDFixyPryHAbcRdReQarwbiQicMUEpsjHjSaCfnDnqgbttrVmkpYvvVwChfZOQKCSmiKKVpPYvoHWuKQgxkoDopBCxaGeIHVWNqljvY",
		@"xsEKTWKHFFxwtwjDnvZFezSsrUIQGypXIighOHgLNFJmbwQxfgRTxxEhOUWTKWgaHcqUiqzBgceiisMGbaULttGpAPDeWUSHRevRCuVnwLJBjlHoXQZRKTkCQFuZonyaqcJFGfZODZCTkO",
		@"qCBsdorcxIUOqvbbzXxorsfdJCyQykfqHrgzKlAKjhgwhjgCtkeUTAmfmHvcbrGEgBIXQUZsCTvxglvbznooknygSZQqYVKQgIcwPZDiEJCDbLrSqrWAfNsNgGwbHHUtPAkltRLBSS",
		@"rfsIlnzuZlCutbWcaJuUBzQbtcQKEhqlglXjdmiZnYpvternJdGcjiRiNUhVXmfsftfBNToOezZkCKSjTfIzTgyywccwiUAAcZcGMWJJIdJMIIUpremnvufRdzYvIVWQrYWfLP",
		@"vjvvHUhhBFavvhRtMQlyCXSubOkViPdakKhnBbweuaGVENJTXltZuzPjdSLJuLbfHPUTkEOucUennUmliwAIfxLpyDSrAxFbxJTwIWDVwLEyxWvbJ",
		@"cCqLkYzdBGVwsTpvosoxKKLuaDmqNUxCnafWWyIYvMVaudgROuwWFToARwRDmNeZLwTrPRBlBIBONICJQkkqKDEGfuolNjJuAFxuKuliqHkFuRLlleuPVhBedVtMdIPtgoxQsvzdmvAXXHmxGQ",
		@"FEjXoaMxIWYoVJRXGYPNzONMzdpeaqjpccvlqbhgZizDLHapAFcuyPhNizsYzsLZLujPsnnUrXmSkZNKyRSMFNVISTNTEVjjakrqRejlDZFPrlfAsJP",
		@"JhJKyblDgGPfyMDcGYcsyVmyFQyOgqhlxgSjwxQRdpSjagqCMzIqQpNGAUVITxdutMJxPnAdzAtMeQxjmQLUoQnwMxmFeLTGZQZymvgiplQvesgQIcXAABeJRyxhdBcEAYevApNauKmMyBc",
		@"XYSwzgmOBHXpJwvynThhaKDqfqsQIuFUhdwJmZZFlkPqCiyhWFmVIIPcyPdIlKmmONnBrTRaROgmzVNilRmjnxunpInrrnwsLYqppPNAASZgjRAJTIJXtCQZYLnHCbNsiGeE",
		@"EAbSpprxcWYyfGiMTjSICVJtJtGwzGkEZwrEQKzjftweblykHwnzjnQBfuePkyLSrWHCacyzKhvQHqBCzlDvDqTeRGGOlwAVeKXGujZrVXtLFhSFgfn",
		@"ZEfMmRYtsCDtupAZmrtfjiWNHCbtTbKKMZuuCRRYxsWJmfPckgpHkXZqhMTPESLWFoMIPCnyikkZbdXuGbZGajDzjoYqXSNzgLdVDQiyyeC",
		@"RlEvGGRElXHDVhEGrRczpTyQUXCxbJjGXkscgaJOxeEFcVbmmQmGEqPVKXipXwaOKtwdQLKUNbHJZaImWdfwErVzukLESItsiKDkQvWornVBKhkDTwjoUvTKoPjXBObyeRNEIWUWtOicwvg",
	];
	return HcpZqDznztGQxmILjn;
}

- (nonnull NSDictionary *)GQtkDgmgqOcEDEjys :(nonnull NSArray *)kywUkLiPTLnUpPWT :(nonnull NSArray *)jIaiimzzubsBzDmNZGH :(nonnull UIImage *)CFoiOiLsGr {
	NSDictionary *eJYYEpZGocd = @{
		@"aSLKUsehrFMPbr": @"QSAsLTkpPRTnBqOGSRDqCVabLFwpoeRgoHMOdgxDLiABaDQGbKgoqubwfwOsoHUjGgowwpDJhLugKdarLSMcUXZxYFBLVXjgoIFJamV",
		@"xJlcdNBQUL": @"uLWmNteQRBjCnVgUYiCjSMIDFQxUlKuNSoImrppAEqnIIZTBCuKGSkLRZQuVLbxnFRhNIpFGaEkuaevLLYtEjUMUPKHbciGmEMZtpIHlRrchjmqFimAGkqpPwwSjIvXp",
		@"fiRLaZgxAiloEoV": @"QtFrigIBhXSslILAZlOFLdNoAmLqvNIPSprRXSPKSTeEgoIVKzRciAEiydlihXevEVneWcrpVunNGNWCjXoUAszwtFkaWHvQQLKqutTLCpIQNDKb",
		@"IBLGPBBuKYSfsOTe": @"WzkmzSORvSOtrjsGFCJrHovATXLqlOmgbJPxCkbumrdXpZHdUpzAsczGbRNyPqRrVAhJhIIgSKAkEWYZaBhZqQdNXYpBRSrXKRLdKzEncKHiEI",
		@"vKShzywFHBQKllWsHwe": @"zEtxUjfWQiLuBfuUhAoJRGhVklHZqurXQrnfeVSoNpzUWDsvYMTMapjbddsFYPzAgFnbSOwPzAzdchgNtqxIwznbdJxQrWJBNXUUePJWEtIChfCoh",
		@"GoacliNDqgWvMH": @"jcbItgmXfboKhzUKJMmMoQFNFTYXYXNvHSdzebEFQWtmZLRMeqakKKeFGJwawXqXpoOfWwJyjtutbxPuizAuMDkBCGftnOenyfQhK",
		@"xTzTUioGGgHbwnNFd": @"itXoxXiCIdrwCwGvYSiutVmPUTkUgJMcRGCnZZiOeFqNDbqTAicLOSpNOkhgFKzWzGsbBJMBcRfMHQFYGSQMtiWrLIfFNKpJjjHHPitoMSuyFnRbAqxpVFhNDlcGpvA",
		@"ttXESZCBDZ": @"sUbHTEPxzqQPNJAmyCbiqWpDcpRGqBkxZciGgSVErbZXfIvXWMBXKZRgLfRddCzldrzyKGQzYpfNpNvmuMUZoJregkwHOewMwLVhUyOXvRVJFbuyn",
		@"RDvWqibKguekLmisJ": @"cgDAcwXSQqqWKvRPqyeTJwKkHcAppkrSdOtPQYobZaXvqErftMTlfcPLKbqnFNcUmrAwwHRLouPEESYLiEqZgoCENLQwztUaqdCQXBqdurEljUZrqRUBpRXpQlsfKJhTkHYstXEMoRIZWtcAMOeh",
		@"qOPPMEismnAuYe": @"UAhjlxZJyzCyUoVTqhhPUQUiQkopDVNrqFGXgmQyoRBLxswKHfhPiQgpCjVExuzaQXxYYwtngtmiBFhkZsVHDHlzpsyWbjAmcfVmTdudBsZsFRxHgoGTezwrQOhoFdmvp",
		@"YZWpxBQXlXhoFltM": @"KYOCmBttwSfVNbETJgnGspJUUDXihzLYOsZVHdkUgxcSMbOCRkBVdWMmzhjqmbGXzgxnDzooKcgkrYNvvWIIvnOQvfyUfgrDWpNXKACvCGdjZyczvmFlRATHRLgGJngrwNlhLaSPg",
		@"pTUBIiNYgQts": @"TVpCXxZHuLZMbeQFdQHutsnJqIInxccARfkDgoNXmeRzzlpmwiEuScBCYKqLoOSMnHCTRebjrbooIhtjNqBdzpxlEyLXYGxPnzYyEhRVzszoOQDMsbLalorgM",
		@"MASXuGTWzKXPVB": @"bPTZNkmRyrhnZpcJFpIsIIHpReIbfvdBWtLlIcFQfQNACQeilQftwTkGnBmuZhqverpDztDxAIpztfXDldhYGLkBBmYEsDCfZFKwMzFRRjOzWd",
		@"AmBrRyxvaiH": @"toKwyLMGuitTAImnJPYLNsppxkJXudpBEqcjsJbxhKlORQIGCqsNTxCAjYLqeuFsIZdzPxIhSovdAMoZkrUbQGlbvMPyANYUPLSmKCRMyhaoysYVoWvNm",
		@"fnCzTfTYnORrVPPLWaP": @"DZiVnrJHCnOUEWuTjkkvivBmOKfMGtPRpNoCxNVkpXAmRxCqDQoEbbkkgZoEuWJrLvXMzzthrgteZOfelEWvcxIwBBQohKYFTAckjcFRuPlnitxSQJqUsFQsNrQy",
		@"cuxOfeQlceXKrrMw": @"wOeYAdqLJhtDIawEwSfSwcUwrNPTFNjkaxQyWCZTaEbCtQiwsMGAvnowKfUwZitmgmqIxBHUCKYelPNDrECMUBFGIoQrfHkUtibWGWcoDxS",
		@"XERJKQKxgisZagSrJRk": @"HeGwgbMFbWCrcMJEfeCCYPnosxfLXlVTiMpTacfUyGXqSqgtSNzfBAQgfoCjnCBBEngXWUIAmluLGyBnLQnIQbtCZyfcFIRhFqZCmbhzblaHKRyJMxLxMOcqRtUkAkdXjGIXXaIViBGKwNeZNUZVl",
		@"QbPdScfIdxrh": @"gqdmpZNjXQimcwfWcaNCYxAqwjUaTUiHwbNkarYaagHWlMZaZVOkkmbnWYnLoBPuwyLgAeuGpBlbPPRDTelIlOzCegCPHEtadvrzvlFmOIEZZiiiQUckuMGjYTHXa",
		@"bqrdpIpHyrXJwP": @"sdXSPDEdBYhCVVeVMemlwzAjhZhJcqLYWBYwFBopwNxtuBsVUmRFTdlgEROpOSfsZfDzZWAHtzoOHTROZDxOrIjPNLPBoaVhNQejaFddSkohfUrnAQLihmFuIHnuwodYbdBvat",
	};
	return eJYYEpZGocd;
}

- (nonnull UIImage *)trJTONnRnPlnbxDeR :(nonnull UIImage *)JhddHPqMPkIvUmKZ :(nonnull NSArray *)qQBytixWwNwl {
	NSData *jpwdyLhZmoN = [@"UchICKAOcbxTapBdvsbUiwZRTQYHJCHplRVBSHzYtyFKjVPpSqPWMmrYSbIlJFXLKIxgbQqkkFJNCIWfEFCYThZvkgImnhwErhDkrjJsbmAODJicEkEm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xdjplsskMvFgupBF = [UIImage imageWithData:jpwdyLhZmoN];
	xdjplsskMvFgupBF = [UIImage imageNamed:@"QJTOBffnJqEgkPTAWBSCHGzNTmBXnInvKdwecPWEeMiJNLopmVlfBwjZFdspvoYrpebmkqtuenGVTDWKSxAYmloiiBgoGtPWCARtCjyZUCxpQxuQctzvFBjeQeEMcntXNwjCrjWkxOda"];
	return xdjplsskMvFgupBF;
}

- (nonnull NSDictionary *)mRCikCbpMqzadKLLPM :(nonnull NSDictionary *)pavgTXazmFCTMCkK :(nonnull NSArray *)vbvxLAGaHkyTtTHaeav {
	NSDictionary *SvEZLGPWDjp = @{
		@"GhLAnNEzwCKtiYaqyHZ": @"dZNiMuFaNedHSEzbgxCtoKXArxMylndpAIcSwrdgbpYmBXbJAcaSdtnQCOWaOjapqaIJDYMOrjQIHCtoipGQKYEinWtuwpTKayMHBnAocjRfdGQxuchKhuhTnhXBpwkhpQuZxirrvhAQH",
		@"ajbFVAxIounn": @"MHENQggDGjiyWhLkKYArSyImoeKhXiLDjEKueZDWrEqPoXmaCSfrpcZlUGJTsFTuNJAnQRXNZYXoHGgpsyxXHFhzPlfASqPOeIHtBTIciOPXexQr",
		@"wWoeoCAbePHCVfOFsMt": @"pKKtXunUhKevKZKoYCVLVLVAxiZUBQNgZrEXvVFDmUupBxOkJLLfGBsDexfceKDPbEnOySVnxlqawIkJuWqBAKHblsrNMVZRoPUsXImOeBmJqotevvTa",
		@"zIgNUWwkpK": @"aMansHRLivrbtZzpQsXPKPYUUReHlslpjkdDxfHpDGZGbFMMXCNhDrOiqJWOCBjYBYIADIRUMwhXuTyDxXgxVqOGYKBHbuRXuswzpbzTYEsiNzUalyxLKtLLKTdJzDJoOGLTeoMFxgJgVt",
		@"VhDwpCLZkRinHg": @"JIVySHzKeWzyLRDzFsOYVzKIiXjqHQfSrFPiyLfipeEDTOYXbSVTxTZJgkjJhsPMZIqYBBnDpsRwgwZiEksXdRWSxoBDyEjswZcAHFUZVMMsQBfBxjjyOGjwwwuPd",
		@"DfdfeKjexmSGnfuVlbs": @"YUapqdREDUfjLxFWZXITuUnXCnrCeyqjzYfYNXQHijpnPDCuGBSxtzyVEVbwvCYpybkylzvTHBbNxFAWuggtyqBMBQsWbtNPWTZGpRaRzlOHFyXzGUxcmbBj",
		@"GazluOncbUnqLdMW": @"GaIqEnKkKaQkCErWaPwxeLDBShbXfNirZlWjpEwqBQBpWajCzJqXSUlTiULWzYKySyLDWjjGuluvnCpCLKNTggvBoMVDgsmyojmgSATKbtVnBvpqxOCSJlVwUQDSMo",
		@"JGnavyQrkENrlVEYo": @"VjiuoBxJCPgFnIljhFQLXwVGSbjBeObQMBkipegWtjqEgLVMCFmRUyOgEgnUkEniJzzkyQQOjGadLCAZBOBAPCsPhoDsvQfTsgGBPKrocZzzHzDiMzCbzS",
		@"sodJrPEPzkppwWu": @"oyrwUdFphMLpKBLMXfzSknzRbgllTYGZKesaSjiNFIMmnDphvPWjJrlYXFjJJvRCPPUDCTKEzdtVitTKewYqRzqowUdBzevWMRMVbmbcaxcvQved",
		@"qlwYKKOBVHO": @"qAfMSmUSMfbOwQmUKLhqUhIwGopCViGlgPeKUzxYmgJesvMtVAmjTqRecAklNaqWBkQVxYUZyGRixAunwkIycfPArvIAZkEsHcNNOvsHhYfvypTogPVMVKmXCfVMJibk",
		@"zebiUbQNkTpsCHDHwYr": @"FzRNJuAeIvhfwbCUyTFvHprjFnbucDxdWAktmNkoXtSLBflzrHgaQJwqamVavWxhjzbbJMlpvoUudUCzIwiXMcJCGZPhAUqXvrLBPWCyGLAAXUKffGLmBkUBJobFfDPECkQcOo",
		@"cztznmaLBvJlXnkwg": @"xfWerHSLAYkOXcIeGmkQnckGFOmUNAjUdMcURClvFvXQHNcwSuCdcklvImZGtdPiiLBOnLUaCNgHZpNgagarVBasGJgiAIOhoIAWhoPRntTwWzjLiYxPzGXAnfA",
		@"ExjUymvDPLYyr": @"iocvabdcDgtoICZMPziQEHTBbwBgVVoFLqXYQsVPUIjuiuAxPmprirlqyiDPlzSVqZCskZKEBEPjzwEokylUVAppHugmUzpnBpInIWneuVun",
		@"ARQtVCCsCyuTFuCS": @"oPDfwUTGOXLZTMRzSYuXCBEYQrWaNkfUwWOCkCinAJxyXHdUNfPCQXBpluCMvejgVCDVBAwAeQrSHZGZdcMEnmwRdYIUUoKJRNRfvNGQiSa",
		@"lAUNlKyycOktQhl": @"kLIOBaAJowJIzORtsvziYZerFXFGvWaFbLDBHtIttvbIGmDYnpSlDjsfxWXTEqgbccZULhvNgRkpbBQkzBcNYVCpKJYJdxRHfnxPmZsDjKbyBoliAKfJxzZwLwejTSFItH",
		@"rAtGYPmZSvfRWTqdPC": @"clgBnQixXHOvLpnFOnSiSexwCCuJNfSrfNObwyEtbqFkotxtPkQIrXcsIZQXoohVrYPQpNeWJFIcvociLjfNahySzhXVMZTHvnmqbgQWFDVJQFmqaqnTLtxmKbIIQSyrUKAuRaodtTtJldsAUE",
		@"DyLcciSfJNA": @"ZcPByxUnqVnAGeotjmNMuHPozbhKplhvAsnQqYtWBHPXKhIvcWKxxMxLftRuGHILJKgGzvVRAnZvjXWcFycSXxfwudeqwKwdUFBymmzkwBdGbMVxGVLk",
	};
	return SvEZLGPWDjp;
}

- (nonnull NSArray *)SGoulmsBxQmIb :(nonnull NSDictionary *)BZvMURGENnCgt :(nonnull NSData *)fHCZIGtCivgp {
	NSArray *tPnygPhIgTUxf = @[
		@"RIODeqqOmjXAcGLXOLuiirPmyQkDKshAwZtiepQSePpgqTOBITgLfsVQLmHVszxOnMWztPJtSQWbTlJDYUpGsiLXiVVhqReaRJSHGaVoLcYQtiOik",
		@"NIiabEMoXosWLZwunehYFHAiSOkRvXjXGbokYfukUJwDlbcwoGwkxDrUuErNzkVnKXUDMrAspgbRuUwypCrJSPlHitUURGsKEAmDkHOaVxvYvatzfepQaxVIJNDDRzPxRs",
		@"wydaQJNiepvEkrRZcjMtmQCoQXOTNgUYwnbihkhqucePUOctXzyLAUpaZnMhLwDLIztzqoCOCOlizSgDtqLokabMNnWWWyMWovFjGivSwoqB",
		@"MeGYeUNtaiMqcVBkpAwTBPZkHTeHpOjJsjPipsOclBWXsMemhQzTjaGRAngHHJhDVXrSgGQoeYHIATytlFwHddrckMHvMrFHzpYPJXiZEgDMfdg",
		@"KSpAFUYMBRbsGPkfXFYLstvvOeajjRjkDDmrsdiPlAEMtyKkPfFknHMUjVypGLJAkXjzxsNdfIUivwEzMSOjxbmIHQEgOMgJrqNvSrzAgmVrgjATxRUnOyOlalAfTbUXhkmclyAuMOrmGd",
		@"tehtKwmhmKLebZWnkblFieAQCfbXNgjrCAqiiJXmALgJCoDIRSnobbKgDwTXzvOqfhLCPeIYbOuyrmCTzXQVFkMfDbfmRFXrwdKTqrNEjIEpZQWUuMdZ",
		@"jeivUSfJJWMnfSUzLSRCffxRWulbTXwohKLmKwLQtbaKKTkkupSXzJURDweNnwdZvINndYNESaDsAIWxddPnmZADoVRuHdwIeJKgxuRPzH",
		@"SEMNjVGFrWPZgwhYxbFiRQJJkoyjuRdzMxpETehmdUhfhcpfiYKOZMfJybxcNLjPmgotDdffYNpsIesjidKqqydwbykzJrGsjpbAvSLMtwLE",
		@"GHeDXVFwqVnxgwlhmmaJmPDrJAjGWTHwspotrPDkThaUuwebyesUTmkqRYrUnMjxAIvpJIhIgJuCgjQmxrqWVzMrBUYZOdDdUlgpqMfLFuQdUYlFJsdHvPomArTaJNfu",
		@"vAwtKaoaglNpgVeabpBaWIpuOFdPKKWGcleBYiMenXAQVEKDUUhyxtVogboKdGOTSwDsAlARvuzTyIPeIfhqSvuInyzQgutaxxZxBUKJPsVmPboXcRFMMPxujBSMnAUoPGpzNhAtHTLMPmHdGUPgJ",
		@"LgsWafgJyYRJpCErLJTUJuxWiImwRoetUvdzpHxbirrJvMlzJyQPOByXDUIyRgHbGyGEStLkwSTOfzYEGcdOiBvPIMPVJRdParXTsKDJXUiDGXR",
	];
	return tPnygPhIgTUxf;
}

- (UIViewController *)currentVisibleController
{
    UIViewController *topController = self.currentVisibleWindow.rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    return topController;
}

#pragma mark - Private

- (void)delegatePerformFinishWithMediaInfo:(NSDictionary *)mediaInfo
{
    if ([[mediaInfo allKeys] containsObject:UIImagePickerControllerEditedImage]) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:mediaInfo];
        dic[UIImagePickerControllerCircularEditedImage] = [dic[UIImagePickerControllerEditedImage] circularImage];
        mediaInfo = [NSDictionary dictionaryWithDictionary:dic];
    }
    if (_finishBlock) {
        _finishBlock(self,mediaInfo);
    } else if (_delegate && [_delegate respondsToSelector:@selector(mediaPicker:didFinishWithMediaInfo:)]) {
        [_delegate mediaPicker:self didFinishWithMediaInfo:mediaInfo];
    }
}

- (BOOL)delegatePerformWillPresentImagePicker:(UIImagePickerController *)imagePicker
{
    if (_willPresentImagePickerBlock) {
        _willPresentImagePickerBlock(self,imagePicker);
    } else if (_delegate && [_delegate respondsToSelector:@selector(mediaPicker:willPresentImagePickerController:)]) {
        return [_delegate mediaPicker:self willPresentImagePickerController:imagePicker];
    }
    return YES;
}

- (void)delegatePerformCancel
{
    if (_cancelBlock) {
        _cancelBlock(self);
    } else if (_delegate && [_delegate respondsToSelector:@selector(mediaPickerDidCancel:)]) {
        [_delegate mediaPickerDidCancel:self];
    }
}

- (void)showActionSheet:(UIView *)view
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
    actionSheet.mediaPicker = self;
    switch (self.mediaType) {
        case FSMediaTypePhoto:
        {
            [actionSheet addButtonWithTitle:kTakePhotoString];
            [actionSheet addButtonWithTitle:kSelectPhotoFromLibraryString];
            [actionSheet addButtonWithTitle:kCancelString];
            actionSheet.cancelButtonIndex = 2;
            break;
        }
        case FSMediaTypeVideo:
        {
            [actionSheet addButtonWithTitle:kRecordVideoString];
            [actionSheet addButtonWithTitle:kSelectVideoFromLibraryString];
            [actionSheet addButtonWithTitle:kCancelString];
            actionSheet.cancelButtonIndex = 2;
            break;
        }
        case FSMediaTypeAll:
        {
            [actionSheet addButtonWithTitle:kTakePhotoString];
            [actionSheet addButtonWithTitle:kSelectPhotoFromLibraryString];
            [actionSheet addButtonWithTitle:kRecordVideoString];
            [actionSheet addButtonWithTitle:kSelectVideoFromLibraryString];
            [actionSheet addButtonWithTitle:kCancelString];
            actionSheet.cancelButtonIndex = 4;
            break;
        }
        case FSMediaTypeTakePhoto:
        {
            [actionSheet addButtonWithTitle:kTakePhotoString];
            [actionSheet addButtonWithTitle:kCancelString];
            actionSheet.cancelButtonIndex = 1;
        }
        default:
            break;
    }
    actionSheet.delegate = self;
    [actionSheet showFromRect:view.bounds inView:view animated:YES];
}

- (void)showAlertController:(UIView *)view
{
    UIAlertController *alertController = [[UIAlertController alloc] init];
    alertController.mediaPicker = self;
    switch (self.mediaType) {
        case FSMediaTypePhoto:
        {
            [alertController addAction:[UIAlertAction actionWithTitle:kTakePhotoString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self takePhotoFromCamera];
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:kSelectPhotoFromLibraryString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self takePhotoFromPhotoLibrary];
            }]];
            break;
        }
        case FSMediaTypeVideo:
        {
            [alertController addAction:[UIAlertAction actionWithTitle:kRecordVideoString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self takeVideoFromCamera];
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:kSelectVideoFromLibraryString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self takeVideoFromPhotoLibrary];
            }]];
            break;
        }
        case FSMediaTypeAll:
        {
            [alertController addAction:[UIAlertAction actionWithTitle:kTakePhotoString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self takePhotoFromCamera];
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:kSelectPhotoFromLibraryString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self takePhotoFromPhotoLibrary];
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:kRecordVideoString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self takeVideoFromCamera];
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:kSelectVideoFromLibraryString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self takeVideoFromPhotoLibrary];
            }]];
            break;
        }
        case FSMediaTypeTakePhoto:
        {
            [alertController addAction:[UIAlertAction actionWithTitle:kTakePhotoString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self takePhotoFromCamera];
            }]];
        }
        default:
            break;
    }
    [alertController addAction:[UIAlertAction actionWithTitle:kCancelString style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self delegatePerformCancel];
    }]];
    alertController.popoverPresentationController.sourceView = view;
    alertController.popoverPresentationController.sourceRect = view.bounds;
    [self.currentVisibleController presentViewController:alertController animated:YES completion:nil];
}

- (void)takePhotoFromCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [UIImagePickerController new];
        imagePicker.allowsEditing = _editMode != FSEditModeNone;
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
        imagePicker.mediaPicker = self;
        BOOL reuslt = [self delegatePerformWillPresentImagePicker:imagePicker];
        if (reuslt) {
            [self.currentVisibleController presentViewController:imagePicker animated:YES completion:nil];
        }
    }
}

- (void)takePhotoFromPhotoLibrary
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *imagePicker = [UIImagePickerController new];
        imagePicker.allowsEditing = _editMode != FSEditModeNone;
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
        imagePicker.mediaPicker = self;
        [self delegatePerformWillPresentImagePicker:imagePicker];
        [self.currentVisibleController presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (void)takeVideoFromCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [UIImagePickerController new];
        imagePicker.allowsEditing = _editMode != FSEditModeNone;
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *)kUTTypeMovie];
        imagePicker.mediaPicker = self;
        [self delegatePerformWillPresentImagePicker:imagePicker];
        [self.currentVisibleController presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (void)takeVideoFromPhotoLibrary
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *imagePicker = [UIImagePickerController new];
        imagePicker.allowsEditing = _editMode != FSEditModeNone;
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *)kUTTypeMovie];
        imagePicker.mediaPicker = self;
        [self delegatePerformWillPresentImagePicker:imagePicker];
        [self.currentVisibleController presentViewController:imagePicker animated:YES completion:nil];
    }
}

@end

@implementation NSDictionary (FSMediaPicker)

- (UIImage *)originalImage
{
    if ([self.allKeys containsObject:UIImagePickerControllerOriginalImage]) {
        return self[UIImagePickerControllerOriginalImage];
    }
    return nil;
}

- (UIImage *)editedImage
{
    if ([self.allKeys containsObject:UIImagePickerControllerEditedImage]) {
        return self[UIImagePickerControllerEditedImage];
    }
    return nil;
}

- (UIImage *)circularEditedImage
{
    if ([self.allKeys containsObject:UIImagePickerControllerCircularEditedImage]) {
        return self[UIImagePickerControllerCircularEditedImage];
    }
    return nil;
}

- (NSURL *)mediaURL
{
    if ([self.allKeys containsObject:UIImagePickerControllerMediaURL]) {
        return self[UIImagePickerControllerMediaURL];
    }
    return nil;
}

- (NSDictionary *)mediaMetadata
{
    if ([self.allKeys containsObject:UIImagePickerControllerMediaMetadata]) {
        return self[UIImagePickerControllerMediaMetadata];
    }
    return nil;
}

- (FSMediaType)mediaType
{
    if ([self.allKeys containsObject:UIImagePickerControllerMediaType]) {
        NSString *type = self[UIImagePickerControllerMediaType];
        if ([type isEqualToString:(NSString *)kUTTypeImage]) {
            return FSMediaTypePhoto;
        } else if ([type isEqualToString:(NSString *)kUTTypeMovie]) {
            return FSMediaTypeVideo;
        }
    }
    return FSMediaTypePhoto;
}

@end


@implementation UIImage (FSMediaPicker)

- (UIImage *)circularImage
{
    // This function returns a newImage, based on image, that has been:
    // - scaled to fit in (CGRect) rect
    // - and cropped within a circle of radius: rectWidth/2
    
    //Create the bitmap graphics context
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width, self.size.height), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Get the width and heights
    CGFloat imageWidth = self.size.width;
    CGFloat imageHeight = self.size.height;
    CGFloat rectWidth = self.size.width;
    CGFloat rectHeight = self.size.height;
    
    //Calculate the scale factor
    CGFloat scaleFactorX = rectWidth/imageWidth;
    CGFloat scaleFactorY = rectHeight/imageHeight;
    
    //Calculate the centre of the circle
    CGFloat imageCentreX = rectWidth/2;
    CGFloat imageCentreY = rectHeight/2;
    
    // Create and CLIP to a CIRCULAR Path
    // (This could be replaced with any closed path if you want a different shaped clip)
    CGFloat radius = rectWidth/2;
    CGContextBeginPath (context);
    CGContextAddArc (context, imageCentreX, imageCentreY, radius, 0, 2*M_PI, 0);
    CGContextClosePath (context);
    CGContextClip (context);
    
    //Set the SCALE factor for the graphics context
    //All future draw calls will be scaled by this factor
    CGContextScaleCTM (context, scaleFactorX, scaleFactorY);
    
    // Draw the IMAGE
    CGRect myRect = CGRectMake(0, 0, imageWidth, imageHeight);
    [self drawInRect:myRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end

const char * mediaPickerKey;

@implementation UIActionSheet (FSMediaPicker)

- (void)setMediaPicker:(FSMediaPicker *)mediaPicker
{
    objc_setAssociatedObject(self, &mediaPickerKey, mediaPicker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FSMediaPicker *)mediaPicker
{
    return objc_getAssociatedObject(self, &mediaPickerKey);
}

@end

@implementation UIAlertController (FSMediaPicker)

- (void)setMediaPicker:(FSMediaPicker *)mediaPicker
{
    objc_setAssociatedObject(self, &mediaPickerKey, mediaPicker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FSMediaPicker *)mediaPicker
{
    return objc_getAssociatedObject(self, &mediaPickerKey);
}


@end

@implementation UIImagePickerController (FSMediaPicker)

- (void)setMediaPicker:(FSMediaPicker *)mediaPicker
{
    objc_setAssociatedObject(self, &mediaPickerKey, mediaPicker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FSMediaPicker *)mediaPicker
{
    return objc_getAssociatedObject(self, &mediaPickerKey);
}


@end

