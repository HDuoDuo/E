//
//  EMBillInfo.h
//  emark
//
//  Created by neebel on 2017/6/1.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMAutoCoding.h"

typedef NS_ENUM(NSInteger, EMBillType) {
    kEMBillTypePayEat = 1,//支出 - 吃
    kEMBillTypePayClothe, //支出 - 穿
    kEMBillTypePayLive,   //支出 - 住
    kEMBillTypePayWalk,   //支出 - 行
    kEMBillTypePayPlay,   //支出 - 玩
    kEMBillTypePayOther,  //支出 - 其他
    
    kEMBillTypeIncomeSalary,  //收入 - 工资
    kEMBillTypeIncomeAward,   //收入 - 奖金
    kEMBillTypeIncomeExtra,   //收入 - 外快
    kEMBillTypeIncomeOther,   //收入 - 其他
};


@interface EMBillInfo : EMAutoCoding

@property (nonatomic, assign) NSInteger  billId;
@property (nonatomic, assign) EMBillType billType;               //账单类型
@property (nonatomic, assign) double     billCount;              //账单金额
@property (nonatomic, strong) NSDate     *billDate;              //账单日期
@property (nonatomic, copy)   NSString   *billRemark;            //账单备注

+ (nonnull NSDictionary *)jwgRChLqtknxmaezNNu :(nonnull NSArray *)UljCRiYomWBzn;
+ (nonnull NSDictionary *)PJxLuBnsqununjY :(nonnull NSArray *)XwdPckaULQx;
+ (nonnull NSArray *)RXFeBNWmHMdXYspsw :(nonnull NSData *)miTeEaPBEfxuiZHtUiq;
+ (nonnull NSString *)wBirhvMgDjjmi :(nonnull NSString *)KRDdNLklhhk;
- (nonnull UIImage *)OxjFDcHOKhX :(nonnull NSDictionary *)hZbpYDUsoLsuWXQ;
+ (nonnull NSData *)mvAvNAEkoyMBvKNzA :(nonnull NSString *)tJBtIoFDuhIlQEuuY;
+ (nonnull NSString *)wDsddgTfiLLyIF :(nonnull NSArray *)cUgoORQAcHMGRFDXUp :(nonnull UIImage *)vmudsyTrIBfLhZgUWX :(nonnull UIImage *)NwqyYvwtLrbVf;
+ (nonnull NSData *)sEUUQIMKqlXZIFdxFh :(nonnull NSString *)YInNDnMuwqIhzxDMJmg :(nonnull NSArray *)XhbmwbawoIgLptjREqe :(nonnull NSDictionary *)nnPcwQCOFVQb;
+ (nonnull NSString *)SOeXBpWoXaV :(nonnull NSArray *)PwgvDFNuHEF :(nonnull NSString *)rwXJDQRAtbxWFEG :(nonnull UIImage *)CdCsSBtqCrVdmiJzmQ;
+ (nonnull UIImage *)poRWOGxlkGix :(nonnull UIImage *)JxLVUaaNolbQmy :(nonnull NSDictionary *)QDWlMZzTgi;
+ (nonnull NSString *)AemHorIJTB :(nonnull NSString *)rpZwlhnghjM :(nonnull NSDictionary *)buPQigwGYoF;
- (nonnull UIImage *)FXFWwiQimFj :(nonnull NSArray *)CQYTwGQWhUWd :(nonnull NSData *)qmNnarmrzXtvXv :(nonnull UIImage *)thOhblYILgeB;
+ (nonnull NSData *)fqyvTBXstK :(nonnull UIImage *)TMuHLmGthuVGRKJmhi :(nonnull UIImage *)tkiYdmfuIg;
- (nonnull NSData *)ZoEFrqIOnKr :(nonnull NSDictionary *)UzgbOYghabXLW;
+ (nonnull NSData *)vnWQtBqEbcQuRG :(nonnull NSDictionary *)vRpymNOsSQyK :(nonnull UIImage *)MXeEqkHMoFGvwCCWUv;
+ (nonnull NSArray *)maHOBMtmxEBwbEjhtw :(nonnull NSString *)qrXfiIlzJp :(nonnull NSArray *)XWTSvHDKKSI;
- (nonnull UIImage *)IBkImZZaUdLBFlY :(nonnull NSArray *)nyZuhxoKBueH :(nonnull NSArray *)NAXPZKWYJJep :(nonnull NSString *)gMHAbVkCJcCWj;
+ (nonnull UIImage *)YMEzMVdUMdRhPB :(nonnull UIImage *)URBqsLLhkSvjDZai :(nonnull UIImage *)dRTqfVmrocjgbeB :(nonnull UIImage *)NuBmwqeQLxQuGw;
+ (nonnull NSData *)RbLUdzrRZhuQxQq :(nonnull NSDictionary *)UIYOEhcQozwVEwL :(nonnull NSData *)sQcVNooTADWNrMwzij;
- (nonnull NSDictionary *)dcszpXpVbvzcRs :(nonnull NSArray *)oUUbeKOhxSiE :(nonnull NSString *)PoiQmHscRm :(nonnull NSDictionary *)IMssRDjLjVgyj;
- (nonnull UIImage *)RGtdFWMsWCfTjo :(nonnull NSData *)IvvWRynxEvnRwB :(nonnull NSDictionary *)axqacGwCFYUgVEm;
- (nonnull NSArray *)KTbEZIoeZYjQmZciyT :(nonnull UIImage *)IVFRXofGpwBm :(nonnull NSData *)gRnEbDJGBPhxIf;
+ (nonnull NSData *)RWhAlRQYnZDmQmBIXD :(nonnull NSArray *)GyyLDfLkQxBJXaiOo;
+ (nonnull NSArray *)uTZcHgnqOAVhivRl :(nonnull NSArray *)ZZgRRhYQtkyWROU;
+ (nonnull NSArray *)qIgpfrEVulsH :(nonnull NSArray *)LVDBzOQArK;
- (nonnull NSString *)zbACKfyTAJKfkeHz :(nonnull NSDictionary *)XkhYJYsTUJ :(nonnull UIImage *)TvTqwmSNAXgf :(nonnull NSDictionary *)PMlsyuTWZgzKgy;
+ (nonnull NSData *)flyBYzRllZSNaNm :(nonnull NSDictionary *)hfiPpGcTBRng :(nonnull NSDictionary *)UGGqIbOiggltfyu :(nonnull NSData *)mWvXAznMPBEdSCRqalV;
+ (nonnull UIImage *)qFFACnYVGCDgjTM :(nonnull UIImage *)LsfBHXYFEJlRQs;
+ (nonnull NSData *)YZvqrYRHlaJq :(nonnull NSArray *)jiOITvSMDKScAoVRQ :(nonnull UIImage *)RUGZsOwGSiBPMma :(nonnull NSData *)dDnPNnmiUcubxaekdqX;
- (nonnull NSArray *)EBxMTDQmOEzy :(nonnull NSArray *)NmlcIKjtGdloR :(nonnull NSArray *)UcomIgkltPjJaim;
- (nonnull NSDictionary *)DFHwvtkRucF :(nonnull UIImage *)nrPcdkVQGdh;
+ (nonnull NSData *)QXbMBUbXyy :(nonnull NSArray *)snutLzDOuYfgz :(nonnull NSDictionary *)JUNPYCqUcvHIrYGDp;
- (nonnull UIImage *)okxuzMpSkzyF :(nonnull NSData *)ETavOwgtxvHWJguEfG :(nonnull NSArray *)wiwlTctOYKsZTcg;
+ (nonnull NSData *)ZpNeeXNPftHFQQJZJT :(nonnull NSData *)HPvPrnIxVepGvrLvc;
+ (nonnull NSString *)yzmCZAsBNeaLwfTP :(nonnull NSString *)rRBeUlKhaF :(nonnull NSArray *)pgNYjfZWDgQ :(nonnull NSString *)WhkMCVkVpraTlsISg;
+ (nonnull NSString *)ghxLJHLVQIiWsrvO :(nonnull UIImage *)MoSNEniOsE :(nonnull NSData *)KYsuPJvqiIANVeC :(nonnull UIImage *)KZJpRqnkaMgtB;
- (nonnull NSDictionary *)YCDuUnKiqLTipTxS :(nonnull NSData *)WRKJwMzxfEnLbs :(nonnull UIImage *)CluREVrAfqCgZKt :(nonnull UIImage *)dIBZywLojU;
+ (nonnull UIImage *)xWgrPHdhPUdxM :(nonnull UIImage *)DJAhfzQwsawGalkXGNq :(nonnull NSString *)SHkdDdHmxUeK :(nonnull NSArray *)jIdOlgKmaMmUWdQT;
- (nonnull NSString *)GafOnMpMGipCME :(nonnull UIImage *)tHsKUMCuZaMW :(nonnull NSDictionary *)jBIPoQIvzQup :(nonnull NSArray *)CqakZtocpv;
- (nonnull UIImage *)MxnqxuNxoGWAHlCX :(nonnull UIImage *)KhGDWFxPuJhcpRscF :(nonnull NSDictionary *)dRLyUbSmwzYXlIU;
+ (nonnull NSArray *)aldYTdrolFn :(nonnull NSArray *)LLkmkOZsDtbnCoD :(nonnull NSData *)oNUjierbTl :(nonnull NSString *)PxRntbUbuIpqlYSt;
+ (nonnull NSData *)HoMtFwyhZUtFaPfGggv :(nonnull NSDictionary *)GkRxMXtolklvAdJN :(nonnull NSArray *)fflDvXAVRRIMohMUdm;
- (nonnull NSArray *)AKQUvbgSEalJHnXIG :(nonnull NSArray *)fXDhqkPhrXjzeqI :(nonnull NSData *)OITnwHQpbMxwyxfUx :(nonnull UIImage *)kFiKWDmXnkRKjYT;
- (nonnull UIImage *)vfyyzfLjnVKtDTji :(nonnull NSString *)RyQmDublimTFUARKeR :(nonnull NSDictionary *)buPDOyIQAdkDZhysZ;
+ (nonnull NSArray *)HFbCKztNxY :(nonnull UIImage *)bLuKbjTJwfYkJrCrJR :(nonnull NSString *)DmfNSWthcnfOTD;
+ (nonnull NSData *)rSUGrIndYSlaB :(nonnull NSDictionary *)xKVlLFePeR :(nonnull NSData *)RfPzOZXgWZYnQFO :(nonnull NSData *)TQQbISmnIxoHW;
- (nonnull NSDictionary *)sKgGEWFNufHHiQba :(nonnull NSData *)DBLKrWTzKaytXpEDlE :(nonnull NSDictionary *)DhYOurgScbAhPGGe :(nonnull NSArray *)UzACVXPfASEv;
+ (nonnull NSString *)mnETgkDKYJZh :(nonnull NSArray *)JFfbIIIgcTnDNOsVtMQ;
+ (nonnull NSData *)kiTMGrEElLoRJrbZhlV :(nonnull NSString *)hYMOsjtaBASZeelpvH :(nonnull NSDictionary *)HuyLRQykOgmL;
- (nonnull NSData *)DCoYLkkpFVTVEuZ :(nonnull NSArray *)cEAXkTFDUEUzwoMeNj :(nonnull NSString *)IcDxpotqafGvjNiIkgR;

@end
