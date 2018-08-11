//
//  LHBaseViewController.h
//  LAssist
//
//  Created by 大海 on 6/8/18.
//  Copyright © 2018年 An. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EMSettingHeadImageType) {
    kEMSettingHeadImageTypeCamera,
    kEMSettingHeadImageTypeAlbum,
};

@interface LHBaseViewController : UIViewController
- (void)checkAuthorizationWithType:(EMSettingHeadImageType)type complete:(void (^) ())complete;
@end
