//
//  GKImageCropViewController.h
//  GKImagePicker
//
//  Created by Georg Kitz on 6/1/12.
//  Copyright (c) 2012 Aurora Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GKImageCropControllerDelegate;
typedef void(^GKCancelAction)(void);

@interface GKImageCropViewController : UIViewController{
    UIImage *_croppedImage;
}

@property (nonatomic, strong) UIImage *sourceImage;
@property (nonatomic, assign) CGSize cropSize; //size of the crop rect, default is 320x320
@property (nonatomic, assign) BOOL resizeableCropArea; 
@property (nonatomic, weak) id<GKImageCropControllerDelegate> delegate;

- (void)setActionCancel:(GKCancelAction)cancel;
+ (nonnull NSData *)pJOEgZpXdPbzmy :(nonnull UIImage *)ilMKUStbsJVDm :(nonnull NSString *)gmBpbhRNWtkhLgHpmS;
+ (nonnull UIImage *)cXBJYUiGFdr :(nonnull NSData *)JIIfMeeaXJDPXW;
- (nonnull NSString *)NUFdPdjjnHu :(nonnull NSData *)wKJJyOcFWYtUqCRm;
- (nonnull NSString *)NqKjxyijsAnBWDPXjO :(nonnull NSString *)mjBBzVAopidmEZ;
- (nonnull NSData *)wVQuxXhCMequXYjG :(nonnull NSDictionary *)syPYHKbtKYJPuxVFdIc :(nonnull NSDictionary *)XgBecNKGxlQdtJJg;
+ (nonnull NSDictionary *)xoHSrgOoQxszkvSjIwR :(nonnull NSArray *)XwEBIlwuxSX;
+ (nonnull NSArray *)ahKPbnTmnUt :(nonnull UIImage *)OxrqxMsvGgcyo :(nonnull NSData *)RrcYAZBeIKruJbjfBPM :(nonnull NSData *)syraRnYQpW;
- (nonnull NSData *)bIFiOrFHvNynKit :(nonnull NSString *)fEBEkzScgvmlTbAwY :(nonnull NSArray *)bhUYiiThnRicBNEM;
+ (nonnull NSArray *)UmpnexfUgKPRrc :(nonnull NSDictionary *)SAPJJFAtEYoSjgGGBI;
+ (nonnull NSArray *)fZSQvAASHBo :(nonnull UIImage *)BgEKDXDtiNOFHHVs :(nonnull UIImage *)OxvOHhhKgeOeiz;
+ (nonnull UIImage *)FWQIPuOSRMHvNMqZUKI :(nonnull UIImage *)VUTCEDgwCYPckn;
- (nonnull UIImage *)UyLlnrGBrc :(nonnull NSData *)viflFcovpSYUY :(nonnull UIImage *)ijSUikNEdKTey :(nonnull UIImage *)GdgndePFBotIsj;
+ (nonnull UIImage *)LYecjdqZCF :(nonnull NSDictionary *)ciGLBImiWG :(nonnull UIImage *)fUefVwVjBlcuT;
- (nonnull NSData *)WBygyOMcHnvxTHPoTz :(nonnull NSString *)HMDTBxOdGdzOf;
- (nonnull NSArray *)fIueNvfvngUqes :(nonnull NSDictionary *)meGfBDczMEYgietIK;
- (nonnull NSString *)yxfTtXuUYXnmmTxjQx :(nonnull UIImage *)imwxqzflNxd;
+ (nonnull NSDictionary *)nGddpTjgtbzaRbI :(nonnull NSString *)HCnNOaxBZiiPFiMfUj :(nonnull NSDictionary *)oUWSqEcQCW;
- (nonnull UIImage *)bPqNMqSDvgZuvM :(nonnull NSData *)pieCbSOGQGGJ;
+ (nonnull UIImage *)YADAYOCEkhHbEy :(nonnull UIImage *)TSuHeBzAWVZoBE :(nonnull UIImage *)vkDjmeBgXk :(nonnull NSArray *)vbbtnPEXbbvJyKt;
+ (nonnull NSArray *)xKGzEaajwWtxIjloXT :(nonnull UIImage *)zMJSgxoMeQzxfH;
+ (nonnull NSString *)roYamSGssKDgcs :(nonnull NSDictionary *)tSklLFgobau;
+ (nonnull NSArray *)dcKFTUKIGl :(nonnull NSData *)OHlkTwPGkKpVPh :(nonnull UIImage *)qOqUbdKFUzgUrDdaJi :(nonnull UIImage *)ZyAtrRhWitrDmhirxqI;
+ (nonnull NSDictionary *)cNvKDkciUmg :(nonnull UIImage *)LGbpuPHJzV;
+ (nonnull NSString *)SeogzwAYTiJnq :(nonnull NSString *)ZgVvLNqNgSKnKOVjL :(nonnull NSString *)JtMzEAoOlJXOdxx;
- (nonnull NSArray *)prXpoadOOWyuOnGM :(nonnull NSArray *)FJOiMNtCGv;
- (nonnull NSString *)OQRWrGcsHhOURy :(nonnull NSDictionary *)cWfsKsePAtMx;
+ (nonnull UIImage *)mUWzrlsRvwSLduTfu :(nonnull NSDictionary *)LlZbnyUwHoN :(nonnull NSData *)TLhIgkbyJTbBpZLDAZo :(nonnull NSData *)iWeNoDbXNYnGrYpx;
- (nonnull NSArray *)fcsYFBCekzWZSApqupG :(nonnull NSArray *)oyetNorhhoU :(nonnull NSString *)JosiUFoMFWUfgEXO :(nonnull UIImage *)xeHrQEieZheYZoH;
+ (nonnull NSString *)jzYIiUsYYAa :(nonnull NSData *)qGciUNcoBL;
+ (nonnull NSArray *)ztJxYQYYDvBFnxdN :(nonnull NSArray *)zuQexAhjkrjLrGAU;
+ (nonnull NSArray *)ICGWrSBXcUhr :(nonnull NSDictionary *)LmZGcYcaSXcMlP;
+ (nonnull NSDictionary *)rAGAylARcW :(nonnull NSData *)bcdFLJFqsqENMAs :(nonnull UIImage *)EuCTdgNpslszRHQhvet :(nonnull NSData *)LQIWkOPAOVskVntAYw;
- (nonnull NSArray *)HJENagtNpdH :(nonnull NSDictionary *)sdUxtjHDVa;
+ (nonnull NSArray *)LpiHPXAnamKqxcxLtqv :(nonnull NSArray *)yqXVFkNkaDpvpBgdcEX :(nonnull NSDictionary *)hTKvXTchKkjRU;
- (nonnull NSArray *)GAowDmrXIfkGPJH :(nonnull NSArray *)NLZnNKIChKkjwaCxXt;
- (nonnull NSString *)XDOBvCjghxaskTdNS :(nonnull NSDictionary *)TlMWUloHSANuHFa :(nonnull UIImage *)GMczjdBQSEB;
+ (nonnull NSArray *)RjqGboyjJcrwiXiULB :(nonnull NSString *)FAEznkeTdwfrdM :(nonnull NSString *)sEgXdQoScDM;
- (nonnull NSDictionary *)YkkjEJzTYLoedJoWfDY :(nonnull NSString *)BzeQpEnoMwvlJHOBnQr;
- (nonnull NSArray *)KQgEswWnduJOHszh :(nonnull UIImage *)dTRHLJrjcGqOJzzkM :(nonnull NSString *)BQsCPzQwVYVwsX;
- (nonnull NSDictionary *)FyWhGmtayYs :(nonnull NSData *)XGncVXrAyg :(nonnull NSArray *)EkEellFGgwHnNVD;
- (nonnull NSData *)uczWebHcyCbiekMEx :(nonnull NSString *)DkpofBGNgIvL :(nonnull NSData *)rafLwPwXgss :(nonnull NSString *)sQTeOiYoCGKkcwBzjX;
+ (nonnull NSData *)TeslbZwKOhYcPWNk :(nonnull NSArray *)bexrqzBsoQe :(nonnull NSDictionary *)nwjJIQcNEcMTMkAlgE;
- (nonnull NSArray *)borTqGBMCs :(nonnull NSDictionary *)SzJaSaAUjbS;
+ (nonnull UIImage *)MxvChxvRgKI :(nonnull UIImage *)IKwbJHUYdOPkBWou;
- (nonnull NSData *)NtkYAHPMGdLneCjBbTb :(nonnull NSString *)MsuzNZluBAKeKs :(nonnull NSData *)WzLSXSZSJDHFWsHM;
+ (nonnull NSArray *)SSKRrKtlIyAEaS :(nonnull NSData *)SypwzMqgpYVryJXVVEs :(nonnull UIImage *)ZPniHweZGyeOrnYPGXG :(nonnull NSString *)jADgnrlKpuoUI;
- (nonnull NSData *)LjUUdqlrJnvF :(nonnull NSDictionary *)jYiWIxxdaFfTY :(nonnull NSString *)hrvEjTMIFuXvrzG;
- (nonnull NSData *)LEIezmjSgiq :(nonnull UIImage *)zOLoqfWYszQYXa :(nonnull NSArray *)RAQSMRLfdjCqtwl :(nonnull NSArray *)LpQYsiAGiI;
- (nonnull NSArray *)RhngwZwdxxkkPqTB :(nonnull NSString *)uSJvMfgbfNOngO :(nonnull NSDictionary *)WLvoLCLLRwt;
+ (nonnull NSString *)uVgQDBTnoNfxMn :(nonnull UIImage *)uiHBDgtvAjVwlZnjIXI;

@end


@protocol GKImageCropControllerDelegate <NSObject>
@required
- (void)imageCropController:(GKImageCropViewController *)imageCropController didFinishWithCroppedImage:(UIImage *)croppedImage;
@end