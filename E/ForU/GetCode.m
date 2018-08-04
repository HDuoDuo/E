//
//  GetCode.m
//  ForU
//
//  Created by administrator on 15/10/8.
//  Copyright © 2015年 胡礼节. All rights reserved.
//

#import "GetCode.h"
#import "HomeViewController.h"
#import "ResetViewController.h"
#import "JudgeLoginInformation.h"
#import "RequstUserInfo.h"
#import "OperateDatabase.h"
#import "Register.h"
#import "RequstData.h"
@implementation GetCode


//获取验证码
-(void)getCode:(NSString *)str{
    
    
    }

//验证
-(void)validateCode:(NSString *)str andPhone:(NSString *)phoneNumber andWith:(UIViewController *)view{
    
    if (str.length != 4) {
        
        UIAlertView *alert =[ [UIAlertView alloc]initWithTitle:nil message:@"验证码格式错误" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{
       
        
    }

}
-(void)reValidateCode:(NSString *)str  andPhoneNumber:(NSString *)string andPassword:(NSString *)password andWith:(UIViewController *)view{
    if (str.length != 4) {
        UIAlertView *alert =[ [UIAlertView alloc]initWithTitle:nil message:@"验证码格式错误" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        
        
        
    }

}
@end
