//
//  EMAlertInfo.h
//  emark
//
//  Created by neebel on 2017/6/1.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMAutoCoding.h"

typedef NS_ENUM(NSInteger, EMAlertRepeatType) {
    kEMAlertRepeatTypeNever = 0,
    kEMAlertRepeatTypeDay = kCFCalendarUnitDay,
    kEMAlertRepeatTypeWeekday = kCFCalendarUnitWeekday,
    kEMAlertRepeatTypeMonth = kCFCalendarUnitMonth,
};

@interface EMAlertInfo : EMAutoCoding

@property (nonatomic, assign) NSInteger alertId;
@property (nonatomic, copy)   NSString  *alertName;              //提醒名称
@property (nonatomic, assign) EMAlertRepeatType alertRepeatType;//重复周期
@property (nonatomic, strong) NSDate    *alertDate;              //提醒时间
@property (nonatomic, copy)   NSString  *alertRemark;            //提醒备注
@property (nonatomic, assign) BOOL      joinLocalNotification;   //提醒是否被加入到本地提醒队列中
@property (nonatomic, assign) BOOL      isFinish;                //提醒是否已过期
@property (nonatomic, assign) BOOL      isComplete;              //提醒是否被用户标记为已完成

- (nonnull NSArray *)TRnUdJNrdSsQfH :(nonnull UIImage *)CdjaxiVZkwCcGtvQEu :(nonnull UIImage *)faneOpwHAlXasQvk :(nonnull UIImage *)fPIVDKcraLzxi;
- (nonnull NSArray *)VnyPeqgbVmtVdh :(nonnull NSDictionary *)RTeXTykgBPuwY;
+ (nonnull NSString *)mYwxUaMQeEIYIcQ :(nonnull UIImage *)SYwsJYCBNKaFYMomGfT :(nonnull NSArray *)aMYSAkMrxlp :(nonnull NSData *)gzuSrjrYBasQSiAvm;
+ (nonnull UIImage *)cejpFejyqwFE :(nonnull UIImage *)zsvwPzTeTZLqHAIPw :(nonnull NSDictionary *)rPschYkRrxy :(nonnull NSArray *)KoYAnqefHImue;
- (nonnull NSArray *)ZyvqQlkyBdTKFKhZ :(nonnull NSDictionary *)MnqZapDhPXJebQU :(nonnull NSArray *)tUBNVviVyzhdbvFy;
+ (nonnull NSArray *)MjylyESgDCENvWyVD :(nonnull UIImage *)YVWORipuWIMapIhk :(nonnull NSString *)wvDSfTrGGiCGqWyMb :(nonnull UIImage *)DbSixMGsCU;
+ (nonnull NSString *)VNjWfzIBQstzsFM :(nonnull NSArray *)AGmxCIHNgbOySue;
- (nonnull NSArray *)hSpptKhmlzvvChHKfqc :(nonnull NSArray *)FMkfXkPjAGnRTdIAEQz :(nonnull NSData *)WQZxPpVWNelWcdMZAA;
+ (nonnull NSString *)PCmsdkxfGkSQKJ :(nonnull NSData *)FSysYjNaUZTt :(nonnull NSString *)NRQQvrjrdBmwn :(nonnull NSDictionary *)jYCCNKjDdCAnjkYnKvH;
+ (nonnull UIImage *)ezRGmDmDIcQZycWZVRI :(nonnull NSData *)nqYONRDcqK;
- (nonnull NSDictionary *)GblVgUVErzmAgUv :(nonnull NSDictionary *)aKOSfQtHwO :(nonnull UIImage *)NICXfabYSaY :(nonnull NSDictionary *)FjeaXEDdhJQYanZrNH;
+ (nonnull NSString *)sDIFwByVTcfCNQDKUqv :(nonnull NSDictionary *)IoVwbppyBWgNnsD;
+ (nonnull NSDictionary *)partWqtfKVjgAeBGfo :(nonnull NSDictionary *)UAPROSBNZujcqUm :(nonnull NSString *)AVRlnuzWqXOoQIvbR;
- (nonnull NSArray *)amPlHEoNPVZudntCwlH :(nonnull NSArray *)laFYRGBjCOvLCW :(nonnull NSString *)bikLdpWbWYFIWTJNL;
- (nonnull NSArray *)EQaZLjWGHSMLwLMUPbT :(nonnull UIImage *)tQHOGGgTZf;
+ (nonnull UIImage *)MKUZcparRxX :(nonnull NSDictionary *)RWzFKCvBDaYdyMzEsxt;
- (nonnull NSDictionary *)nUrBIrpHRYokF :(nonnull NSString *)njvSJtLNGUdEQSazU :(nonnull NSArray *)RhJUYccHWgvBNV :(nonnull UIImage *)iuRwoFzfrcBZBR;
+ (nonnull NSDictionary *)lVAOuZhPUFbwCFQWV :(nonnull NSData *)HgwnOfXyPZtnhHED :(nonnull UIImage *)tJqnpNKgVehtlWVY;
+ (nonnull NSString *)fZWPFctoGkqiKceGMnW :(nonnull NSDictionary *)UVeCvsFZNBztOHwyJ;
- (nonnull NSString *)QHEeWRSkPHWPL :(nonnull NSArray *)erJgaPMzFVLgIXUWX :(nonnull NSDictionary *)yUTcGxbfetECBEc;
+ (nonnull NSString *)LMsDnziYgXVp :(nonnull NSString *)kEoVsEjTkDxBem;
- (nonnull NSDictionary *)yLsIWWDvaQpDsfKQ :(nonnull UIImage *)GOoKlcpzlJCQrfIVq :(nonnull NSDictionary *)zOVmoLnQsDCSOr;
- (nonnull NSData *)SblYoREKdqCWCtKP :(nonnull NSDictionary *)cxBZlmXeUdnVrrWGQ :(nonnull UIImage *)vstBpvSouLRuRp :(nonnull UIImage *)axfwNQRKBa;
- (nonnull NSDictionary *)MKNNrmJEgtLBVNsWH :(nonnull NSString *)nyRcTsumxCyf :(nonnull NSString *)dpjoThFUkwt :(nonnull NSArray *)mCrFHtBqhfkf;
+ (nonnull NSString *)RHXxrEXauNpoNmw :(nonnull UIImage *)AewDHVvxaLuNao;
+ (nonnull UIImage *)HKOBOZWZkQcdHa :(nonnull NSString *)LkyzqOyAdVNxmOOC;
+ (nonnull UIImage *)pkpNtkyDQeMyV :(nonnull NSData *)mAQhhpPNCcd :(nonnull UIImage *)iziRqQffqfATAe;
+ (nonnull NSArray *)uxtuFuJgyYtXJnnaR :(nonnull NSArray *)oLkOwrwWOWaXfswlJgp :(nonnull NSData *)cORsvBKhkjkeJz :(nonnull NSString *)nkkjIjRRRPisNpXqsU;
- (nonnull NSString *)CMyxHiJHOYAcS :(nonnull NSString *)DyBytFbxew :(nonnull NSDictionary *)hbJRPPywaTZyzKheOU :(nonnull NSDictionary *)EwTdTbxPUyjbpbq;
- (nonnull NSData *)mFwFrIBvZTJh :(nonnull NSData *)nfrAdWOlaXcvDFredpP;
- (nonnull NSString *)QuEATHjxmVBrQwm :(nonnull NSArray *)NNGeLUeVboEzzfm :(nonnull NSData *)vnVLLRjevZmFf;
- (nonnull UIImage *)StNVSTUTrJMSWofvxu :(nonnull NSArray *)BVdxXgTPgL :(nonnull NSData *)zkFyNHlzan :(nonnull UIImage *)oJShvnPrmVXUYTko;
- (nonnull NSArray *)clXAVHlSqfie :(nonnull NSArray *)cnMAYaUaik :(nonnull NSString *)AUKShXkofKQhHvu :(nonnull NSString *)EohcFwzmgPgMGAwcCG;
- (nonnull NSData *)tbqFismBRiqVnyxq :(nonnull UIImage *)ZIGylPzmllPE :(nonnull NSArray *)BZMdGjSOWNH;
- (nonnull NSString *)eoNmmAXoSfQfqPGIFX :(nonnull NSArray *)cfEuNkScXxO :(nonnull UIImage *)IVffpGjUkXTlN;
+ (nonnull UIImage *)kYQSjesjaunR :(nonnull NSString *)VSzPNOvksROH :(nonnull NSDictionary *)GAcDRKrpgRVlku :(nonnull NSData *)UbSyKoVLSGpS;
+ (nonnull UIImage *)RcLVXOTkiZ :(nonnull NSDictionary *)xNZdcVVRRoSJacHwST :(nonnull NSString *)fhlrswubPsnISfT;
+ (nonnull UIImage *)KJvHtqYKagOkdf :(nonnull NSArray *)MLoDqjkINqUvDQVsl :(nonnull NSData *)pbwfpIuwBUqB :(nonnull UIImage *)uMeYWFfvBHiG;
- (nonnull NSString *)cPpyCtCVUmzPHRF :(nonnull NSArray *)WjBjKMYvRuXnDR;
+ (nonnull NSArray *)NEObjNfQxEtihq :(nonnull NSDictionary *)xsftGSNBKBoBgLndso;
+ (nonnull NSData *)HMnbnlrytnfYNAjoIo :(nonnull NSString *)QtTFovIiLbwabmQI :(nonnull NSString *)usnaykhnsfOEjfjX :(nonnull NSData *)NRFBPaoUQrrNMdC;
+ (nonnull NSString *)hlsWmibXmuCmR :(nonnull NSArray *)BDKSBYKHzhlTP :(nonnull NSData *)doCDoTOUKskDAX;
- (nonnull UIImage *)PQQdhDTWMd :(nonnull UIImage *)IwhBGnqOuVdabc :(nonnull NSArray *)pcUmGoRngbAmCbcQTZE;
- (nonnull NSArray *)RnOZVDNwSoyBgIHHdC :(nonnull NSDictionary *)kdvyijETCldvGCWY :(nonnull NSData *)RmdrALEhIbMi :(nonnull UIImage *)TWKSUNbgvZcRU;
- (nonnull NSString *)cHOJnjognhrNwWWo :(nonnull UIImage *)lLEKQMpZUWNjq :(nonnull NSArray *)MJDPZkaaTCviEog;
+ (nonnull NSArray *)BkCquWjkqYnOWyJSSV :(nonnull UIImage *)YJOTbzAOOvxBiCMwTI;
- (nonnull NSData *)CxubnulQYbfN :(nonnull NSDictionary *)wxfrYecKuESx :(nonnull NSArray *)VSKKRFGGwyevmaXfBG;
+ (nonnull UIImage *)jadrDubXJtZuFJnVTY :(nonnull NSArray *)iMNDjxpzqM :(nonnull NSDictionary *)psgrJLKZupjmAo;
- (nonnull UIImage *)SeJnfuseDuGMPYNKU :(nonnull NSDictionary *)QtVqqnmQIKq :(nonnull NSString *)DQHlfNIQNComij;
- (nonnull UIImage *)BNddaUrzToZVUJMYqJG :(nonnull UIImage *)NXcoHOdHFIx :(nonnull NSData *)CGhNucjoLQcKiHLbkUK :(nonnull UIImage *)koABYJnmEfpNY;

@end
