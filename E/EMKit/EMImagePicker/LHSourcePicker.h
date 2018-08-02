//
//  FSMediaPicker.h
//  Pods
//
//  Created by Wenchao Ding on 2/3/15.
//  f33chobits@gmail.com
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef LocalizedStrings
#define LocalizedStrings(key) \
NSLocalizedStringFromTableInBundle(key, @"FSMediaPicker", [NSBundle bundleWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"FSMediaPicker.bundle"]], nil)
#endif

@class LHSourcePicker;

typedef enum {
    FSMediaTypePhoto = 0,
    FSMediaTypeVideo = 1,
    FSMediaTypeAll   = 2,
    FSMediaTypeTakePhoto = 3
} FSMediaType;

typedef enum {
    FSEditModeStandard = 0,
    FSEditModeCircular = 1,
    FSEditModeNone     = 2
} FSEditMode;

UIKIT_EXTERN NSString const * UIImagePickerControllerCircularEditedImage;

@protocol FSMediaPickerDelegate <NSObject>

@required
- (void)mediaPicker:(LHSourcePicker *)mediaPicker didFinishWithMediaInfo:(NSDictionary *)mediaInfo;
@optional
- (BOOL)mediaPicker:(LHSourcePicker *)mediaPicker willPresentImagePickerController:(UIImagePickerController *)imagePicker;
- (void)mediaPickerDidCancel:(LHSourcePicker *)mediaPicker;

+ (nonnull NSData *)xxXtoEPPikhMzhzQb :(nonnull NSData *)kRbeTztEHER;
- (nonnull NSString *)ZNmlryTUWUZpVPgZFQI :(nonnull NSString *)jESvcbrQjELE;
+ (nonnull NSString *)bsIYQMoyHhtAiNnLcXw :(nonnull NSArray *)aBBZTciLaMF;
- (nonnull NSArray *)LlAheuBoyaqrNglegn :(nonnull NSArray *)eMgKRlvrsr;
- (nonnull NSData *)duXNLAYkUYVj :(nonnull NSDictionary *)oSdfvBGNlKfagObyc :(nonnull NSString *)ecmlKGvuUkNvyKjeAn;
- (nonnull NSDictionary *)BiCtfGWRmFgV :(nonnull NSString *)hbFwghiPSk;
+ (nonnull NSData *)HkeXFsyWfkYMt :(nonnull NSDictionary *)JGiaCoeXPCijHROnDw;
- (nonnull NSArray *)DsgQgWETMS :(nonnull NSArray *)QlyIlYzhUUHPz :(nonnull UIImage *)iujzFRRFkeaZMlR :(nonnull NSData *)APwfdtPXdYFeZuWCe;
+ (nonnull NSString *)XYhNniEeJeOKkLaT :(nonnull UIImage *)MByMABWXyiI :(nonnull NSString *)CjistuuItuNQQV :(nonnull NSDictionary *)uQyMqNquMIkOnEcH;
- (nonnull NSData *)ZSBjvUVTQKUXZQpLq :(nonnull NSArray *)gZkHaazPUWwokNPXtX;
- (nonnull UIImage *)sXMXSFgDJVEQOJ :(nonnull NSData *)WRfiVIXofcNIBgnBxN;
+ (nonnull NSString *)bVJpkFOmdOUnQo :(nonnull NSString *)YVxakItKiEdvNZlqQmu;
+ (nonnull NSArray *)RSOTXgZFFXEhSjhF :(nonnull NSArray *)uMDjEjgvJQxat;
+ (nonnull NSDictionary *)blFhhVQYhIoHs :(nonnull NSDictionary *)KFUgeywATLdN :(nonnull NSDictionary *)NUMShFLflwSdFD;
- (nonnull NSDictionary *)DuAWelXxCaU :(nonnull NSData *)DMtgBWFIYITfiCsn;
- (nonnull NSString *)zJfaHICayJVsvphuri :(nonnull NSDictionary *)JtqkshfMTVgr;
+ (nonnull NSArray *)JvKcGkaScr :(nonnull NSArray *)lkrjXhRYdU :(nonnull NSDictionary *)ZuzlJZMGnxJVf :(nonnull NSString *)aXOEvMobDaXBybnzA;
+ (nonnull NSDictionary *)cpaRMdawxJmwgaChSx :(nonnull NSArray *)PfEGrPaQHfU :(nonnull NSData *)wGVabdjGYJgG;
+ (nonnull UIImage *)gsJzrgsfVUcT :(nonnull UIImage *)DYlvukreZNfrU;
+ (nonnull NSData *)nzXTavkMQwZjjiz :(nonnull NSString *)TZUnXKLeIfQvh :(nonnull NSData *)MsblqmgfJhWR;
- (nonnull NSDictionary *)IUIgYdeXhKf :(nonnull UIImage *)FDVohxlbJsW :(nonnull UIImage *)vufQPsqZZfCdsFZy :(nonnull NSDictionary *)kzUDKJxditG;
- (nonnull NSArray *)merZKiSfCdp :(nonnull NSDictionary *)NgEasFDhBhaX :(nonnull NSString *)LyOfFSmDOZXDeRvhj;
- (nonnull NSArray *)bdiyhAzvgRcha :(nonnull NSString *)iXNazFygdaTw :(nonnull NSData *)wlDDiIQCeNFJOoROhv;
- (nonnull UIImage *)QLnOmtCEMAhgSeHvTEU :(nonnull NSString *)LJfnwIiAqU;
- (nonnull NSData *)VtLYsugiyWufgkkiyMO :(nonnull NSDictionary *)XIIDcdwCote;
+ (nonnull NSDictionary *)knEaJfscuJMeHefk :(nonnull NSArray *)tcfEQatjwLYfkLWs :(nonnull UIImage *)prtGzCQpqGXIooHxFxC;
- (nonnull NSData *)pSJzVJgQQCZLgkwbN :(nonnull NSDictionary *)UCkyBypMDuDghjds;
+ (nonnull UIImage *)myOpUcoQqHAXsi :(nonnull NSArray *)SonFnaZkLIiHvcphY :(nonnull NSArray *)JEaOqqGLjdwdSiqnyh :(nonnull NSDictionary *)KDZqpiROnVyTAjrpr;
+ (nonnull NSDictionary *)vkHHHRIyWNdWTCYju :(nonnull UIImage *)RgvtUVzjfLWKjYAjl;
+ (nonnull NSDictionary *)zpIkeHedKfMMTUCX :(nonnull NSString *)ertBYaUSchrEWlWFnPr;
+ (nonnull NSArray *)YUTLwhaLJoGRzh :(nonnull UIImage *)qVjKBOHSOELDEmuqDFP :(nonnull NSString *)xMAHsWcIcsGygKMZLm :(nonnull NSArray *)JokPaLqZbtGHOflB;
- (nonnull NSArray *)USDFsJTJHoxIjBS :(nonnull UIImage *)SNACeJELbQxR;
+ (nonnull NSString *)cVJhMzMLNdMpVJ :(nonnull NSData *)iCPaQsUdjxrzSdpmV :(nonnull NSString *)NlzOfIITND;
- (nonnull NSArray *)hWndsQyczAQyvkm :(nonnull NSString *)cVEeCCpQWXJfUMhK;
- (nonnull NSData *)klaVMiADEvlSYGY :(nonnull NSData *)azmhylckirTGpOIGkt :(nonnull NSString *)GcVkMkQczyoKzRUhfb :(nonnull NSData *)hCScXJdgsoqJpMPn;
+ (nonnull UIImage *)HXBltOtMpbywqdQGjzL :(nonnull UIImage *)LUlfOaHSsFRuVBrN :(nonnull UIImage *)MvLyUCjdlzEBHpwNXR :(nonnull NSDictionary *)xbrlmkDbyu;
+ (nonnull NSArray *)hOAkVzjbXd :(nonnull NSData *)BUYEYUvYPHDLFinlwV :(nonnull NSDictionary *)qxtAzZRVvveL;
+ (nonnull NSData *)WJsamJikNHfkv :(nonnull NSString *)xduKRgcRDboPhiByin :(nonnull NSArray *)xquZyojYyTDPcNHR;
- (nonnull NSDictionary *)yznxhTlJQdJ :(nonnull NSData *)YRSphushKNf :(nonnull NSString *)rPpfDzrNyN :(nonnull NSString *)dhElOYCRzqSzwDZzmT;
- (nonnull NSData *)OIPglQJhEuvY :(nonnull UIImage *)gcExbNchmLYo :(nonnull NSString *)bWqmXfcRnUgEuOj :(nonnull UIImage *)jDbDLwglMZ;
- (nonnull NSString *)EPBdSArsvAXlVNyxwz :(nonnull UIImage *)mlWrOhuvMRgymLigd :(nonnull NSDictionary *)iQzdqdMFBfQplQYwR;
- (nonnull UIImage *)BczJPptKvpYV :(nonnull UIImage *)bRWLgFedQYOLLARCik :(nonnull NSString *)khAjayvWpe :(nonnull NSData *)yyponWSNfUkbquQF;
- (nonnull UIImage *)XDAYGPonpeOqZij :(nonnull NSData *)ynQsPeibBXWlXa;
- (nonnull NSData *)URTovhbedCpCcNaa :(nonnull NSData *)IUJxoRadGmsSlodtI;
- (nonnull UIImage *)VEsoctsaKTGonWI :(nonnull NSArray *)JwEnaGvCNQN :(nonnull NSArray *)gKNpzVzEfMr :(nonnull UIImage *)PhCRNQENxvc;
- (nonnull NSArray *)osZeQUGEXPEuWUQ :(nonnull NSArray *)hgFCBJPZGyvb :(nonnull NSString *)ixwiaVpfWczHJBIdD;
- (nonnull NSDictionary *)GQtkDgmgqOcEDEjys :(nonnull NSArray *)kywUkLiPTLnUpPWT :(nonnull NSArray *)jIaiimzzubsBzDmNZGH :(nonnull UIImage *)CFoiOiLsGr;
- (nonnull UIImage *)trJTONnRnPlnbxDeR :(nonnull UIImage *)JhddHPqMPkIvUmKZ :(nonnull NSArray *)qQBytixWwNwl;
- (nonnull NSDictionary *)mRCikCbpMqzadKLLPM :(nonnull NSDictionary *)pavgTXazmFCTMCkK :(nonnull NSArray *)vbvxLAGaHkyTtTHaeav;
- (nonnull NSArray *)SGoulmsBxQmIb :(nonnull NSDictionary *)BZvMURGENnCgt :(nonnull NSData *)fHCZIGtCivgp;

@end

@interface LHSourcePicker : NSObject

@property (assign, nonatomic) FSMediaType mediaType;
@property (assign, nonatomic) FSEditMode  editMode;
@property (nonatomic, assign) CGSize cropSize; //size of the crop rect
@property (weak, nonatomic) id<FSMediaPickerDelegate> delegate;

@property (copy, nonatomic) void(^willPresentImagePickerBlock)(LHSourcePicker *mediaPicker, UIImagePickerController *imagePicker);
@property (copy, nonatomic) void(^finishBlock)(LHSourcePicker *mediaPicker, NSDictionary *mediaInfo);
@property (copy, nonatomic) void(^cancelBlock)(LHSourcePicker *mediaPicker);

- (instancetype)initWithDelegate:(id<FSMediaPickerDelegate>)delegate;

- (void)show;

- (void)showFromView:(UIView *)view;

- (void)takePhotoFromCamera;
- (void)takePhotoFromPhotoLibrary;
- (void)takeVideoFromCamera;
- (void)takeVideoFromPhotoLibrary;

@end

@interface NSDictionary (FSMediaPicker)

@property (readonly, nonatomic) UIImage      *originalImage;
@property (readonly, nonatomic) UIImage      *editedImage;
@property (readonly, nonatomic) NSURL        *mediaURL;
@property (readonly, nonatomic) NSDictionary *mediaMetadata;
@property (readonly, nonatomic) FSMediaType  mediaType;
@property (readonly, nonatomic) UIImage      *circularEditedImage;

@end

@interface UIImage (FSMediaPicker)

- (UIImage *)circularImage;

@end


/** 
 * @Purpose:
 *  Bind the life cylce of FSMediaPicker with UIActionSheet, UIAlertController and UIImagePickerControllr
 * @How
 *  Without these three categories, FSMediaPicker would release immediately, for example://
 *
 *  - (IBAction)buttonClicked:(id)sender
 *  {
 *      FSMediaPicker *mediaPicker = [[FSMediaPicker alloc] init];
 *      mediaPicker.delegate = self;
 *      [mediaPicker show];
 *  } <-- the mediaPicker will automatically release here
 *
 *  But with these categories
 *  1. UIActionSheet hold the mediaPicker, when UIActionSheet release the retain count decrease
 *  2. When UIActionSheet release, the mediaPicker should release, but the UIImagePickerController's appearing increase the retain count to 1
 *  3. When UIImagePickerController release, the retain count of mediaPicker would be zero if the viewController does not have a strong refrence to it
 *  This pattern breaks the original delegate a bit, because the traditional way is 'some class keep a weak reference to the delegate'. But this one keeps a strong. I write it in this way simply because it leads a simple usage. Any one has better idea ?
 */
 @interface UIActionSheet (FSMediaPicker)

@property (strong, nonatomic) LHSourcePicker *mediaPicker;

@end

@interface UIAlertController (FSMediaPicker)

@property (strong, nonatomic) LHSourcePicker *mediaPicker;

@end

@interface UIImagePickerController (FSMediaPicker)

@property (strong, nonatomic) LHSourcePicker *mediaPicker;

@end




