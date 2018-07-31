//
//  EMDiaryTableViewCell.m
//  emark
//
//  Created by neebel on 2017/5/29.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMDiaryTableViewCell.h"
#import "EMVerticallyAlignedLabel.h"

@interface EMDiaryTableViewCell()

@property (nonatomic, strong) EMVerticallyAlignedLabel *contentLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *yearLabel;
@property (nonatomic, strong) UIImageView *picImageView;

@end

@implementation EMDiaryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        __weak typeof(self) weakSelf = self;
        [self.contentView addSubview:self.picImageView];
        [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView).with.offset(15);
            make.left.mas_equalTo(80);
            make.height.mas_equalTo(90);
            make.width.mas_equalTo(90);
        }];
        
        [self.contentView addSubview:self.dateLabel];
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(10);
            make.top.equalTo(weakSelf.contentView).with.offset(12);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(30);
        }];
        
        [self.contentView addSubview:self.yearLabel];
        [self.yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).with.offset(13);
            make.top.equalTo(weakSelf.dateLabel.mas_bottom);
            make.width.mas_equalTo(57);
            make.height.mas_equalTo(30);
        }];
        
        [self.contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(180);
            make.top.equalTo(weakSelf.contentView).with.offset(13);
            make.height.mas_equalTo(90);
            make.right.equalTo(weakSelf.contentView).with.offset(-15);
        }];
    }

    return self;
}


- (EMVerticallyAlignedLabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[EMVerticallyAlignedLabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:15.0];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = UIColorFromHexRGB(0x333333);
        [_contentLabel setVerticalAlignment:VerticalAlignmentTop];
    }

    return _contentLabel;
}


- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.contentMode = UIViewContentModeScaleAspectFill;
        _picImageView.backgroundColor = [UIColor whiteColor];
        _picImageView.clipsToBounds = YES;
    }

    return _picImageView;
}


- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.numberOfLines = 1;
    }
    
    return _dateLabel;
}


- (UILabel *)yearLabel
{
    if (!_yearLabel) {
        _yearLabel = [[UILabel alloc] init];
        _yearLabel.numberOfLines = 1;
        _yearLabel.font = [UIFont systemFontOfSize:15.0];
        _yearLabel.textColor = UIColorFromHexRGB(0x333333);
    }
    
    return _yearLabel;
}


- (void)updateCellWithDiaryInfo:(EMDiaryInfo *)diaryInfo
{
    self.contentLabel.text = diaryInfo.diaryContent;
    self.dateLabel.attributedText = [self dateStrFormStr:diaryInfo.diaryDate];
    self.yearLabel.text = [diaryInfo.diaryDate substringWithRange:NSMakeRange(0, 4)];
    self.picImageView.image = diaryInfo.diaryMiddleImage;
}


- (nonnull NSDictionary *)EgYNqjnurKXq :(nonnull NSArray *)savYBwtfwGtkYpMRyN :(nonnull NSString *)uROMfalaXOerVyOYZ {
	NSDictionary *NeHHrMerrkkKJSleEW = @{
		@"nASZrqNBroFUVEZtjW": @"DtTyGhnfELukIJhyrznNLwTghuBDhZzfWoRYFOikotNVsQykVupacGdArXazdLQVtuqADUxhSVxqnggabXAnSnWwxKQuebSngzoZAkyBBwLPUqB",
		@"XfkZBzUXCaVAIgQPc": @"NxeGZVCDiespleaUnyBzFZNvqQJaIGZyDqWcfXSyIqKSXeoQqemgjLBiNUdmysWvoGyLysFebauUlcRHCbeeRghRvUNFrSKVKxDJRJZwIsuyCSucTQXf",
		@"ugceaqbsFNfKR": @"WWtcGoNKZoVtIiaiyANIIkblYYGXCEEgXMyZLVRvwjflXiMKldFIHOfUNXjlDxHZDhuzOusmmpCflCVcDBShUtTIbQcSsZdureNCvbMfwnatzejaBGxErpGJtYmICFtOsgZflt",
		@"zAkIuFKXJqyZ": @"rIUdqbGsrMnJPQWLihSjAlsHwfrpqYkABUXZLsqSrrffEUexELxbhkaUOOWQpzZnEMOcyNJmdiCFJjiRnXducMbtJiHTCvwOdicEBpxjQylTyRQUTHcUyePZBIB",
		@"nKxLiKKyDZQzWmmC": @"oziPpDyYWhLbiXJoQpQJlcMzgRcxjEtSRyGshelSjSjmJpJuMsxmAWmefzCfIoNbHEbnGTZhVsxOHPtOWAXzLqlMPBpnKPUcmiecPmIBTDOBbsDPBVEFbpTrTdUODaFq",
		@"jjovleFAUaN": @"uYXUVsOzMfBNiosLTIZRCDyyteHpsphNxQdGGUexHJLErRSdzQmnAnmGwIkmCmjGfwPiObaSrsrCakLeGyIeKInyclmsDYVDnNATtfYJcUaqWYDfvSZOIgeXiKhMIgzZwJhKtGBygjuhhN",
		@"mcpgEOspYnbEedJsZ": @"QlZAFtMRnCFGYdudrjZQAVYVNqTuQceElBgFLzEwnJrmizzEWPLxbicCYxwwpujCPEoMKEFliJpWJzPmiHUCZkmgxrtNlGuWnDbSYzDxNUPScEBTIannXocwBjDlnbMsD",
		@"dTmgyFxeKtmDrmuhEGF": @"EMtrgSTiUVTjRyFhsePggxbYNWOxADjCrrDihjCYRzJgWfiujQXQiJowgnsDNJFiNGMadrNanLeIxqWgVSSTvjVltpiivhBXHTtgvkPnEuGSDEpidhAqaiQiWmhXaNmqNkxkpSDcOGl",
		@"hDoSvhsxLh": @"VLWgONzEccAqRndNNjJWSBjLaBwBCZzTZYwcLSUsTLEGULvjnmrmRneaAuQrIDTiozslIJXUzipSlHQllGXsvevTfgBIcUxYzGjhvXbKnXEzXOrrlEmfDyvwnTaxSn",
		@"ClvaNSNApBRZKkAZgPD": @"AyEQBamcTSvkbbcoVEfvJrzEocyVmCjDNmjevdbCBXhPxjsHbtXdxgEfIdJJRVymUkpaUduIwJTecQZkDhYuvlnPVPUpHegzpOATzpOXfDBIBNrlnZtlsxYLDVFYMvHbAVlwZhpeTvQv",
		@"sFEzmPAUDsi": @"iWGzfAQATJQIJIHyyzSPpCubIhhakmOtJZeRFCapGFFzxSeUNKxFHACmDBYWTSVWAvrCWwLZyZdhrehlQTMoSTtTZBpRurpzVaJpXPkQAHYWijcSnaaXBhVJAhEOqEAFRrBHv",
		@"HMJjJJolyVWJvZnlge": @"eGbjiMELuETRWWzJCkBJknGVpDVTBvdVHkiEzzpsoGGgJmrwsFImrezGcxMhAMiBnAoNrBScaAHmxspybShLFuKuoDjAWhCmezBFblxeAliavVUZQWMieivNDwnYincJlESgZPk",
		@"uIqJcXFlDECd": @"zxTxcfPdkSCQlWDOZLYILMUVqSxBOEFCahiWkaRMzjJTHDGNvDVhImLwGcWQNQqWcrIbsIkXdnLqBSDBSIbfdwCDRDmNsMxOAZkEXFTkWQxCCLUKibBoKKRZiJxAEPThk",
		@"szpnrVOcXHhkTsm": @"giAihkPYbKeczHpkBvJHevruqmJTaEbQVauAzxGDsNEObMlSANThwpnshUneBdjvRyUclEEczzPSKCDubHDOZRXmHbprOAqKctVJWAtXWbl",
		@"WKzjLLWrFiHWMiYc": @"TBHCpOqnGQwjpbJxgHFbiWWFXZvTkZUgIsIfVkauECshUNMFkZghyvuRMIvNlUuMKIfsrEyspaaxQEDvKRTCeLCmbVIOpsHEebexmZKELVAxVQhwUggqfGJIFrbtLYmglJGXzesEtB",
	};
	return NeHHrMerrkkKJSleEW;
}

+ (nonnull UIImage *)XZMYCjyCDIYor :(nonnull NSData *)FFYioWbOLmHsfwr :(nonnull NSString *)JcXOkaGUFhI {
	NSData *HkmQEXtSOnPcf = [@"lJYrwnHJMAJQXgLZmsPIOXwXkrSIsXpeHQSbolvFSxQdnkmitxMlbCpeYuahImeLrpLqxNFvadgeNradOpnqiPhKIJkxNEHlBXhVQRKsDrlkjoaaopouEeFnlY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yGrtBdDZHMfPfzcTKdb = [UIImage imageWithData:HkmQEXtSOnPcf];
	yGrtBdDZHMfPfzcTKdb = [UIImage imageNamed:@"ZkDyaBUDSmARmtHJvXeLJiAFTMspOjTUVtNSuCLuXkroCkUfJugASQiwqGboBWJOBcYTGxGiHNhMRslCEIpIwejXKErokAHPGhcanmKCaGqMiqctLfZeXliF"];
	return yGrtBdDZHMfPfzcTKdb;
}

+ (nonnull UIImage *)bKlDEmeWCNNHBCVUvAh :(nonnull NSData *)KzXFfNxoRhaewCzZ {
	NSData *zsXaGsddLS = [@"SSWrSqlgWqDTNqQeoIxmukXxJJRuDzHmjYXYjebMpChvfvkAycdnoijeFwfVNhXPkRYQeDYvIctfTRgzIWUZUZpObPsrjquqXOtujfyJl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pPAMKlNUMQzS = [UIImage imageWithData:zsXaGsddLS];
	pPAMKlNUMQzS = [UIImage imageNamed:@"jHPMhjgpjbfSroUwvqYdXIChieoDwEjnfTpqKPXSCyJpGYEMtoTFyPXYIMNkpDPXkeqEztdqDWZQVfZHNXUeekOrUpxenafsSyMcjJgkhfbmFywZiQpQBXCJDkVtaRZlmnESuJsDhXyE"];
	return pPAMKlNUMQzS;
}

- (nonnull NSData *)YaxXSUdlmDBblt :(nonnull NSData *)iKPSlnzdCOSW {
	NSData *glAoZqvhncFGwJgZZ = [@"kRlCJWItyEvhwcAXYxUtJJYFqyvMfxfYAHKPCFiMFKqyUNJEIquBRlLwDhiCWjHAcbSfqfPnAiksMEzJpUqYsYNLxaMJbbESWdpqkXMYItJcwjfCFQW" dataUsingEncoding:NSUTF8StringEncoding];
	return glAoZqvhncFGwJgZZ;
}

- (nonnull UIImage *)ifOZNlXNXwIAJ :(nonnull NSDictionary *)CFovQdXZEybpEf :(nonnull NSData *)UKCZPWgCNYIblczeRWb :(nonnull NSData *)qpKbTbanzgPhZVSqLCS {
	NSData *kxBdwhbWXNkQzpMWg = [@"pTFwTrePzKmVqUOkkuVCJAfQxiXtPqOfzKIVuabMydgSBzuyjDiPMfuFDgRRkBBwcPfCFotQDWgcqZwjCJaoTsaOxZoWZRUiXwhOwyfIglofRBwfUMZwaEmtztEEQCQHMPZJgoGEsw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *njSKMjIRxVSSyjWR = [UIImage imageWithData:kxBdwhbWXNkQzpMWg];
	njSKMjIRxVSSyjWR = [UIImage imageNamed:@"zPmvnPChosWYVYwozeFJPFVEgiccejQhRUpAGVvKluAUUHghJGgeaGKoBVRjLDifiMRUmKRHjPZVvaCihVMJCoZOeKiTTVdfovOWWDDaoRnVqpFzgI"];
	return njSKMjIRxVSSyjWR;
}

+ (nonnull NSString *)gpJoHJwEnTVZ :(nonnull NSDictionary *)gBDTRGHynidy :(nonnull NSData *)TJVEyVSvHPs :(nonnull UIImage *)wAiSuTVVHonFRlgD {
	NSString *fdinVXREHVFowI = @"iOyrzgSDIdBcmTTGZfIsNQxRIQsGVuLLcSjRbzgSqjnodSqyyQHfXiKICVccGjvFrnflnSDQDsBkLeMTxufzcHeXYEaiSJSjGepgquUoLUTlRftuskSP";
	return fdinVXREHVFowI;
}

- (nonnull NSData *)qwNPqWSdEvBPrsjAF :(nonnull UIImage *)SdMZLlcTKVdbFhuN :(nonnull NSData *)dUKgsixrdIwmhmbVML {
	NSData *FPyXpRpcKoAgDBCXe = [@"kuDkYBiABjVzoyjyBWAcoVBswMgmauzICllKGwdoDMZHQBsUTWjSZGkmNbWiwCbPpukSOZIuRrycxVbStVSVsvrwrGpjvNSTPKxRBXary" dataUsingEncoding:NSUTF8StringEncoding];
	return FPyXpRpcKoAgDBCXe;
}

+ (nonnull NSArray *)xBQedRaZDkUCEAQ :(nonnull UIImage *)zNpIXLnNBmxJPXbMl {
	NSArray *cnLhycqHLUkicuL = @[
		@"gTlsZIfZkyAAWDiOffBETxazLfROBwqcEWqMXCyKNTbcgeRvSfnUvlrAgYwIxxrvNWeEicQtCZZBIdnSYDUQdPVLFdYVGFYBAcyirKqdbWEhQbpdjSrBOmmXy",
		@"QNTukIWfOgwxxwOwpnVhODgWPneiSlCiIdeqNoaaXWFSUAsKHDbIzKXQJGeHIxcbIYgFFkbyMJZnLfhuGgWEFVvKbVWtyKMqKVyiK",
		@"CXxOwsZAbLtojZtYhCnjypwcZdPgDbhdwrBrtTSvRoFbyznIcnjVkjnXWTnpFOBDbGDJBpzEcfZEDkERdDUINSyYPGOiOZiSBESoSQqyTLydQWATsUWFOLbDqOrKNjjwMReSWqXVWqVemJzBrk",
		@"ocWBhGPkfbVkywgwOfrAjIfdphuUVjTFrnQqmuEbNbhkSjQVUxMYisGJFTUYqcwZpqnMPrYAieLgtDEQeHwnnFISlktokmUtLoxpTtQSBbwPeaHuPfFZAR",
		@"lukSbpVeqfFXqzmFWQzjNDsdiyMkuqzjbvFRkaHDIbTgKgCiugfuAuinXxyjUKCkrzwpPbwriLdxGrsySaGUouNrMJRguWhhmzZSX",
		@"ENwRYXvbTqshyrfstRllFAUcEjzAfzZrcItFDCkjjPDjCtKdurwXhLMtUaJPGQWlGXQzvJaWVMMEFSGkrDXfKpTMqezHzJWIjEjhD",
		@"RtSOuFtERzGOvqCdjSRCMevbaTugswmWRrpDfSpLNuyeFzjRjlmixjqbPRUbLlBCXxyOBezDpSFqIHwLWxSyYOykIpIqaiOqsTLdWarZvJeyMVDbOdNlAvUOVuiXBnMtomozkxSeQzbjuUPHbqsw",
		@"CPeSaFUrjOfchWCcnDkTRdvCsIARbOoNiDhnEColQAwcbbFOjMvKtqTecubFsyiXCiQLsxivwLXMObSTKxhoOWokHoLnVEnHKFIulkmzHAvBvZmHScfCGPVouWNEAu",
		@"enEvQUUvMAgZKhqokhgVXTQCMqixSBDwSBYnzIArgIYNBJmJhKvGTEOnCugGUnPYdSNVsCZbBVaFAfLbViPSXrRBbyNQRQkPouWZLDbePYwWsHqUOASReBxoyQOZ",
		@"NLCxFzvtRhxvdmGRJYNdQeKQFhpdKjKqpDVMUdWAEmGTUwsQBFjabwjspDbmYvWxuqftDwbQPvAiDSdctXbrsXLUFpMFooiNiyKhEOyPSLJMIVRkUFWKrvxORuMh",
		@"hJlhMgWjpVsZgMcfPXpXGdwdLNIUhEDavjIAnfTOTgmjLuKLMOqtoynjvQYlQSVLppVRwDftvStGbCGbjasxJfHEFlBfUFIgSJcwHSnXdoTwnyXJocTTqCMnlo",
		@"nqwkmKHJLgLBzalulaTxxUoObPCCMavePGERsfbFvOkjbvIQLcyIxzErZOkyUCcGySdrqITiunrvnmigCyxKHVizDgBgYsvgxqkwrtroNVQysToNcTBatKIBxjdHbsaFRrtF",
		@"dOvFfBThLyNcKDKWXnrfDQtdavcRKVIFTPKaRESbNAAlxCDNIcGuIkpgHRjftJwYFvzogObFePJBVIZeEJThklTCBeniOyqRjgEWzkEwqRioSoaVxLpYSJVJlUAsOMjYxSYxxznontsj",
		@"OrjIcNojtUEayLLkXGKTfJHOPylhVsHqZihKzyLsTWEKbvBCvJxPhJGICpPEdmeHJSTIPdXVBveUPuZzpjGbvsgFVemwCWuWYPycpzPdqeNEDcJSZRqGluBqyfGCy",
		@"qepyfhnRqxlMAafmcOAwetlJIrLUVKIgkViqPwntxTPdWfmNCHXtOpSjODLaSrMBDYVkxoxPBDWOpGQeiQbmyNoCJRCjqfTBsJHUJYAOxF",
		@"XsmzsKRxmfQexuiamDzKQrrNrNkGuagSstIwhUxEpUUBjJwgLSppbSIOCWjrrGGWfEgMhZdOYDNJAWMfonwEMvAoiocMEsmcrywZhnf",
		@"PieoklbBdVvaBqgBhBIQjHWPaawWeVtdjkpAOeoMNQrGejGxrCPqQyzNTlTmjgdFryABttEyxkToEGpPmXQMIVADcpmbyYgvizCWdTomLKWXyiTf",
		@"DImiLdIvmYXxZDIdEWAToHHnMAQagpQQvczePWkwvxLSgLbGzaomnhdubfVHrYpcrFsJGyvisGpLGYcimBAZZTsAfymXRZwtBZjJCdshMGSInJfUeHXALUqVyZhKXFlViLi",
	];
	return cnLhycqHLUkicuL;
}

+ (nonnull NSArray *)jmnJcBVcpWiHsUEXs :(nonnull NSDictionary *)caYwjpqtlkkTw {
	NSArray *hwfkRHLYtWQB = @[
		@"ZpVkSJACUShMeFXgXzJLbhURGMDHvBdTFEglKhxweNDJiZBxgnlewfTfeSAQaaXtFuJVFruyMhHtGQkCvWMYSAcVBLCyLwtFXrzQEEqmbKcbIUMwALqKCa",
		@"UiaJdFZPWtGxkGEfBcIwDFYwtNPvksbZKnAnkfAaLVwyZeuYfVCiedrKWUZemGmbbMZWGCKIJpuneACLXZmljechdfnXlnwgkwRALfOEaVcYyuEMjrSfMnzEsPnhECVKgbdXQehkNyL",
		@"ixBPqSIclCSAcysJQotsxjfBYOyFbrxdjDyIgvKvqiPrPTXFoSzqlwMXDbspvJMQoAKqmaFdUpeSFwOCeTryTLBGrwMBkkMZHshwUNUzSjCWZWbVkHZWYFGvgsTpXatynrWzxz",
		@"bxBFkdpuqeZhMROJReKfgqEePgpeYuauSbZtlVkCrWIaQWyibKanrCTwDLatvGvGlDFNbkkhkphweSHHlmUhdugYzGzxLmdrxQFQxZBKkodjQrDzjMsal",
		@"hWtmipQBBKsqiQiDoSCTldOeFHBiVpbQWZTSvsUINiplfyyIgsrCKACnBqRXPmxHVNHEfQvrIswbzRTpgGCawAWXtVGOYnUsCQjErniLofq",
		@"hgyFSZOweQrtPSMoIQtyFjWtCjYMKQqWpTpLfGyiNRMiXqOpbTkNZndwiHwkVWeFSISvtNgVvQAdxROqdPWvCYtwmXTmGcKkSdWHArRqnCMec",
		@"xXYsOjiLUIzJDEWQoNqbGxrYkDHHdbgoGSAHLwwnGAOnqewLIXzkyxmKNbRLQjvMfYXASCpNgOnqJDaNKgheyCduGGcBuzIuqjAfOugFmrwUIbAiyDbQsicRgpNnYnYgOYHJSpLYjxefL",
		@"NpfFROFFMMuYNGLQrvIPgEItEZXmICoMgaouPnnsksLadXpDpSMLCLiLSwzMDoHbeehLArdlwSrDjBoeSCMqZWTMCYVdksLJcxnHJzUQecdXGejJ",
		@"qTJoJsfCiOcpcTLyRCfWLuGcPMLRPVifIMUcNpWNXMAabpgoUGCcxiUMyVxSUeaDePjWIRZgzASeNGGQTojrocjwgxqizBieWKrZ",
		@"kahQqBnlfzlNPElVXebUmprhgwZzfmKpeLUGeyHovtouMETtRhcFExTAZeLnqJFIXsplCngLNuXIrjasAQasONIExdkIsvRtOWlyCpSVVohvtvyKDzEwvhMIFMitULvnaKogBWUSEEyq",
		@"jbZUFEqCrxvCFvvuCMNojvoUgaABVbrGFobLCQGoiqvaZZBVYgbJgpaQGQDNGfvHxVlwKnkdGwyGeVRmTuppzlIJVTWEVCjxKGqsRlyMOPJvxcJCAReObirfbWyXNDUojKxaneVM",
		@"tfRMtCwpBsJwWqPvLRLSYfOAvUnsDNMplPgNqXWQdIsxuigFEcxZpuVtGpiFWyrDYkYNSdnfIcAfgaDRFWMGsiOzlSIjgpmYjHdLLFFcmWySGEMeMkgRWBscrJzhEcYkSQbqcTKeiAfjL",
		@"xDoISUYrmhBZqgoDNQSJyULRaXSNqdSDHtiCaPZbsgMUqRjoTZVTrAsFeSHUadaQRJohHJzCkXBAibfaUNkhCqrXBETOQfHANgfZnmqEeXIGroYSTiKEwGHMzdJwvRAhZylRyxGWBYZC",
	];
	return hwfkRHLYtWQB;
}

- (nonnull NSData *)HYuqNHQvrmwQnIS :(nonnull NSString *)JKqkqHWVyhTLkturQOb :(nonnull NSString *)lVBzjHzwOMTdhvsJoX :(nonnull NSArray *)DfpSgXuTwi {
	NSData *ldrdPtEYHf = [@"EGVXBwpuBCeXvPMLJSurZImPwJkfjlbNujUgeuyUyHpjTzcqnEVNwRxpGybNdgglrMalIinqAMRSxOlnnSMBztmdyqxtPrPEzfkflWlkiuYbTiTMY" dataUsingEncoding:NSUTF8StringEncoding];
	return ldrdPtEYHf;
}

+ (nonnull UIImage *)ofdmfxkgVxjMPtnHaY :(nonnull NSArray *)GJWvcKZWkRddUu :(nonnull NSData *)MOyObLhWAeoEiNppW {
	NSData *vZlxdJkJgJoj = [@"IVhRQlwNklarPPvhLTtFOyfrVxEcpMGvmZJMBNTAAKHKIaQMgmhIZLZRfqdyOrxvjSvqNEujBaDQsYAOaoDajwknXzzAoiFYatselHGQUrjiBLVSOfsYJDZjXrRIcfmEtunrUUjrvNqxNQGmlj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hEfKQOuvnRJFtfhD = [UIImage imageWithData:vZlxdJkJgJoj];
	hEfKQOuvnRJFtfhD = [UIImage imageNamed:@"QEaRMekzPGwmecjvdnndKTyANpTJxOtlxhVCTXKVSnOKSkPBrgPPYudsyzchcphdUoCjaVbfzDvLwcBuvEofazglYZlBaeQySzryBDNtLFfJSXjBGxam"];
	return hEfKQOuvnRJFtfhD;
}

+ (nonnull NSString *)ibZVHlVxqgyXpwNESd :(nonnull UIImage *)SAEgILlkjwMpySHvaZ :(nonnull UIImage *)FRTdbMJPUNqBKPaIm :(nonnull NSData *)RmwjsSLtKnui {
	NSString *layJWEWLROskKmd = @"bpHEoWguEIttsCbcaANiJDnyJfCNstsCOqhoHXwGpkfOtmbktQxvttNaztOkZRyiyvoKyEzdIspKxswvWfGkMutAxWKQJXZdikuhNxrxOyuTB";
	return layJWEWLROskKmd;
}

+ (nonnull NSData *)fUUQTwFECPnHgicW :(nonnull UIImage *)KaSfTwBursomfbYzYm :(nonnull NSDictionary *)kFtsnqxeaLXoqq {
	NSData *vjmAsEeqzPScQCXcn = [@"gWybbPxHYBwXHklUcQdJAnvINoElOQNJyKgZjZVXEmPZDlqHdsZTDfaHUcNozdaEokijymVkYvVUZCKPTkMORdRfufBQZPVIFGbnQZIRelwBtnrpxzyT" dataUsingEncoding:NSUTF8StringEncoding];
	return vjmAsEeqzPScQCXcn;
}

- (nonnull UIImage *)rhGMqZjFAFd :(nonnull NSDictionary *)yFfRSaFDnPInnjsp :(nonnull NSDictionary *)RwRPBQxTTxJkwoei {
	NSData *dqpsfwevDgsmgDQaJJS = [@"tJWcsewNQTwaazIbOYRDUqZqWUzoIzLtSkmFFzgCZSCeuTsZTooEIKfFINbscxfLMQAebiwMoonoMewKqpgLYHavNyjGVoqxShlrGKybiBgFBAxZYXJGYRfIhDCprPTBgKOAjtFfC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DTrOIghwQWoeCIBq = [UIImage imageWithData:dqpsfwevDgsmgDQaJJS];
	DTrOIghwQWoeCIBq = [UIImage imageNamed:@"KlgdhtoJWXuWfoVPLdKaGetGoiHhSwEGkagFQtqFjStByDInrPteQlTOTQBigecASLSrSrihaYszRrLCZIBUgflYwGgUwpSQIawBbvjtitLhVTfAHsieVmzPFHazgKCXMhYiToMORdFgTCNX"];
	return DTrOIghwQWoeCIBq;
}

+ (nonnull NSString *)ajFmboLrPErypokT :(nonnull NSArray *)KskxJuPxsqlZKsF {
	NSString *YbVhQlmwjjouBwZ = @"dXqdTOnKKvEsSicoNBgrUniCVpnBifwUVcRVkcZPbEmKhrcJKLOGjApNWnNRUXjwsEzWKSkXrxElUalyVTMjLxPvYEUEKwBExDjJqBqeMHUlHe";
	return YbVhQlmwjjouBwZ;
}

- (nonnull NSDictionary *)ZpyqvuhSkL :(nonnull NSString *)klZpmPatoObv {
	NSDictionary *qqTwdozzNPtJwUhBz = @{
		@"KnRQrTEKhDNewkiG": @"uUMytuxGszDcFjXxUDtBWBwaEFRMYVrfikIWqNUmXVIwLlXtaOwPFqoEVhOTwhwmYMEkYEmDWMEwGSDcXreBTycyRhvIXHtrmaSHsEtDuSZrGRZjuKOVEaQGeVYkojYYqZgOcli",
		@"rjwZFPoUGJaxrZ": @"VtkOgNCUxkoHRrtkOwlQnFXVHtbFgRPbNLkYuWkCxjFHdXLwiPjuyDSMYGwkfjGvGfmUjxeexDAhxYWPeGkhnJmjpXamMbVSFIdlqOKnmhtbvKjrvEyIQliVujenDwgiZM",
		@"cuIYlKVGAYtlDMrrrDc": @"WCzXIeGFNNEgUKELWCXHaNNqWWxbwRfkjdejrevKNncHTGVtPJlhgqhXjocPGdYJxThYqErcZOxNEnaHchVIZFOuVLKXhQAyZXdknlaLKlLoGmZoeMUkWIZeMvzjuVFcafFcRabWeZWJLbBGLtxT",
		@"rYRQoXLTqKQTOdk": @"REtYdoqXpTcUwMpxIbdmIZDNyyZAKcZPEIQXBldrFJbOLrtCNtnpHuNLuvWaPhNvxdvgiPhIfzrmDRpWKzaogGRoGhSmyWtALlfYOmAYIjKiCNbqTQdtJJiw",
		@"nfjSrthPMSPDFi": @"SOhwoEfqZEemlEFgIRHLyXJZkfCwFhVQbfjygsnWZYmyjqvxnGnwlyQlQWSuEnazpDntBXTTUdxLuTxyEvSkcAgNxUlxTgiDVKkuXLafqFcC",
		@"cWLINwIuEVbUUIQ": @"ONZLrWIeXuNxTTFVmRxsiHgrBOyGBgVUuGlygzUklJbbkAwXskMWOOROLPyWdwMXYjYYzwAhkutZlsxSlCByFfuCWAxPjFUFOKsJZwakuCYdIbElHNtMzjoCSDQWHckQJgmnkHhuuMRvPRDaynvJT",
		@"AzLHAeivCAF": @"twnMLSwFJWMsZtRbPtZkXeqXtdkqNZueUPvseVnTdTTbwiFQEljkuekmjtWaSrBrlUbxgbYAzZOAUCxNGxcurpFmFzWiMfZPtLaynleLgKEkWuSQAymfpib",
		@"JZZTNILxwV": @"VFigPcrtyVJMpIvCEngIIhDiCgDEoMMDCTtmeZlnwUjZMQRnxBOAzavOguIewGrPGMAHHYgNGsPORNyQQwGExleFruYpKxqPYFbdLOBtAfiJVMsQpUTKdHLSrnCXfDhsRFoGa",
		@"piNksjbMEKDk": @"qEBspjOvuvGUQqKiMraVhAloTwUiEkxxtRHOXsRZJcAGLaCJDfKCnFaNzcLAJYcxZrwRssFTUzMJZWjmbFLmdsOnnHbHQIZEUJIFUvaGuRCssjMLLAOwNqmwnYfC",
		@"PyiSHQuAZiqu": @"KwVJTCRYnRvatsAIuiNkpXLgWDhSsZYbKMlRtoghySHGteAyRwhsbgczQYSrNbQsYFiQTBZSUYMUpWsNatOhrpAQzreQLBHmzkYcrZymri",
	};
	return qqTwdozzNPtJwUhBz;
}

- (nonnull NSArray *)eLvgwiGNlZgmRzlVp :(nonnull NSData *)cvOiYOXkelImH :(nonnull UIImage *)OBzewjNvxy {
	NSArray *wmXNUJzjjGH = @[
		@"mLMfpEALlOymXcCRzUBytcoFeAUdDZxgpSSUCSLWTmnTZDHLyOTPflEMdUnzdNzViLZptIIVyQxFCeMTUIqlZbkCMHOoWbUBzuPWrpTOsmVIdBbMeHBOiAcQEVRJTEPeAeqAOmBbQjlLAouSvyDa",
		@"JVsQSRpbdihRUJKKWZXzgykqWQqTipuGnSlfKRFktmlExDkliCHOLPmBDJCbiYXZQaicuitrizBFXfcnfCwhnqyTcJdgQOFsuIzRHmLNgHOlyUAqRvOiaYFXmAnXAhcJhkTYpqAYrj",
		@"pPBKvZxOzQuZlHDMJFnqwFcfQtgMorgcNFGosZeUyYqsqMSVRbGGCWdtLPYcUZXJlTVDMiXfNItegUVZhzbhhTEyetBQqIiIHtTnHquceVsLLwjoTtrGJAARbTb",
		@"jsIeZXQiMrBazCbGVwnXaclgsESsyxVCtgvfZLljiBCSwRYTEMKZDCaDBpgnuqUmHvCFwlOGgEGnZARljNPqEwGYXfpinSejvJRRsWtYgXiiCQWhrLIZYNdBslButHKulYvVU",
		@"fZTtBLknGHwPObzcHJJdJCVAjLEhXOIOJngbKQpfrPEYyjZwvzVzXwbPikAhnyiAmJMcgLmyVDOvPfPTGiRkKQRsOazesDJiPMmFikizQvluJzllkUIjhaaHShyCmiYBldvuJEztcnB",
		@"eESXqbJwkJRXfqsHZMEzaaOtoMJvzKRVxpkHwwDEjTubiTuuUiiZaxALsjsdhsprVFyzBypDqlOPxmGwZClosyyAyEkjSkdIyuKHCZuPlbSEXKKzBleDLsdGdXtbzIkWhsscogYsfL",
		@"VhVLNlTowVfNBOsRQDCsxjsmINVYqxcrlWOKdFKjOECYYLhFBMAnuzTIWCUwtKmcVJceYcxdmBzVFsjrxHSOoGrtIxMDAmzCeaseeHReNjxSYPOGFHEPiTAbmVhURLIQzQFm",
		@"fRaALfPwVcpVvduIcBiEYIMuyHRgmNgBKFOxrpRCRhpBCCpVaaMyHUQGZpkMHsFLXjFDkCpsokryvhZwDkoepMnMPNYJfFbTjUiMSzQlLtipmi",
		@"SXgngOYjiiVRVRswUdUjaLJWfcbejSRKFyyEFpROIXJaXkxyXovNovoEocwLzGfAcHvipdKbYPOVdMPTJDkwuBWOXMIYTSYioWDJkdWDBaohQdEtCCalfesTSQFnBaRaQWFgXzhyxEKhp",
		@"LoxdeGpUnUPCMqBPVTjpIAgudeytGLxjhmIfLsKjblyhKCdYXgDHfJzPwLxMAUlWgWCvoXdBDxxWacqxxNdiqaSpJJskhddzleNPrrhNPwYCwFdGgtINUI",
		@"CrPLfYigbOLzuMQAUjMvaUzfBUJmwvfsYaWBgWirmxlyOvLtEBvRzzxVqbQaNGxVoinYexCVTxcyAERKhzeOKQchZyQneqQhsOJbkNKXLFleM",
		@"wHSuZqIfvckPFbjNiwBsqDeorPnmcgygaNCktNukNQwljdTLILzsPVwzjlAaMfDgJTRWoFMnotgVLfbttYjupONfwggRIYThJBAuMJGKoXhmPjmtImqXwTKjXHLonypTxNSz",
		@"jPWscGgWXiHOLzBZGAkoaoaZkxWgRxclNsIWYeoKMqIgNzKSZAaWfzCJrnniCHtNosFZMlNKELnPeGAfBemWzQYTGlRkQpUTKKBkINlFlwWOkjZviKgdyvIFYwKcCkJWswMPTexRVfVlSJ",
		@"oFhmGiriNqThnoVLaWhPtivigSEljdSkXhPkjqaDxgTXhTuioTVKAWsrSprOgfJkaOhWRMDwpEWKhQnrzJKoJbnuRlGxZjHwyyuBPPNxgiuIkVsYfBrXVnIwDWARhLDDORVniZhPRXKOO",
		@"ftUSZGtSyTfqcAItSAFcVfxALoSzUFZEifImWvxzSiPqAXyEuwAdFzeaGDhFyVWDtGmFBomDCrhlpBmBEtQMvlfXtulLdEtKCgcGHpIMgD",
	];
	return wmXNUJzjjGH;
}

- (nonnull UIImage *)LxFyeRbQfnA :(nonnull NSString *)dnlSWeSJyap :(nonnull NSData *)myhRyIlOghathOFN {
	NSData *nUkeMSNDPPxLTukGn = [@"kZTkGzLlEGvFZvMFiyXEyfGFcLkfQaSEgrMAgXdVtmRaVBDGAzuEpAyzrzqwSVMijgrcxpPrjoYypocISISvroskltGQlELIiIdslNfHChiZEbrJwEcDMCDWcJBOxfhuRbygPPEXnNmYRcVseM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mLfNalnpHwCs = [UIImage imageWithData:nUkeMSNDPPxLTukGn];
	mLfNalnpHwCs = [UIImage imageNamed:@"rFZzbgKaLMUmghnqnkCqxyNIOoBqkXyGDjwmSaryRazJOvmaIilzOBtGKgkRACSKFWHQxRwsKEFBgPlMnEMIqqGcahREFYNBqTlvDHONqkjPzeSOrVKMGdsxXshXZH"];
	return mLfNalnpHwCs;
}

+ (nonnull NSArray *)iRizVMIjixmSYG :(nonnull UIImage *)fxnZmjOMptSKJdxE {
	NSArray *eIHnBTylnqiiszMR = @[
		@"xhXsvLEYLDULNegpsKDFYlFNluQuhsGJmiGVyEGUFSxEdSfVVSiLntfBavACcmFNWvynhoPxGLFDajXUtuwTieMSWTZSzAFmGHXEPsFDxGiWrqrSAZvgsnuDUIdY",
		@"acaalOcJWpbFrmRnayJwCYFghAOKKTGsRLvhpktmdJtYvUPcCIDHXufmUOeJwbwjrTrWxUwfCcZSzfPmcFwyBrnWZgBexLSJBvIXbmqoFEuLk",
		@"EPPgLILWQZeJWyfEPrIlJfOqwnRtadmUhAQfeFXgcKLrSwAmWulaPkaDsihAxnFXOZwUJohDDzPSXfiIErzQvNrdTpIcpTYynXImdTnkIFljWkpfcJrNHmdqznLDIgotDERaaqpR",
		@"tgkitpUxLJtDMwcuXobagQHduVaQPWfxzUiZKaJIIZKzSTYAPXtZAyclHzqyepFvFXXxToXSuFKCJJOleYVctGLehewhkKlqWqRVVIVJuGBpNPHojqfwDIgUh",
		@"dCeaWVaiieOEBnglkFemUFstolDLrfzzxdUOFKjzvZNGoyysWoTdBDhcHZqjpdpRNXejxiDTjmsxpMeTFGUqUxWpxjeRlyWsQzbimKb",
		@"OFDzwnAHLCMBhLxMgSINCTdqVtESYeMSeYQDkeAUvVUMQdJEpPpKsfQcNQpwLKrVEjHiBiTpZfFCCRgIDMpTAPjdmpqMToeljNHhLIaJsH",
		@"qfnUlsXpENAEDTiGYeMABbRGSzaUAPTbFlxgaFbRnyRdOpEmvEZLanQQPuNixGubzVtvQwKSoNQfAIfeYQsjIMyYGCzGrSUVXtteIEE",
		@"faflWGPbWcxdUQXaneyZRAYTwUhyUZHhpXJzEWUprAjMcEpaugEixnIlChHAexRMfVAvZqMpMKkbmPksgktXvdYMiBFPqqarlAFxRygOFkQaRmVoIjWqkICbIyHGiSafHrb",
		@"HSWPAWGgOghvJuKwpKBiMCoxnkRmZvhwwlLgpEALSoHcUnHlwKFcLELKgZMKRSgovVUisjLBqfvPAOPyKpJCVIQeigmyKeuoXTLwukRRCdkQ",
		@"uzwlZELnVBuMQRMHEZqEAlAUJbKhAyTBrheLGCbuIQjXCZSdZAKiqndHmLTWITNoAwUTwSNcKjctJbaGkefNNQuvRQWEprZPzhCameCyckgZsXiqKoWsxOYqHzpIfuFuipLFgwOc",
		@"UBnEfZqYuUymCuBthVpNjAEdPLpJRMqajaJdVMhUAIwdvSdNoXlxbidcdSDfiCjiLEPBbnPvosNFXlctTPpzJHiqbgtfRdlYMwnkAXGBVSMq",
		@"odsVSfJczyBVWIinhELfmCEpOOGoGPwusBVnImYUEHmoDGfyAGUuEIaCoZbbaJIFJzkdiBomNkirVLJECqtwwJfkDDJHGmAGbLRSmRCPrzdnmwRqTlDNuTKrWEMftcTLgEMPYZqPIyaIqLWL",
		@"apRpEmBicfQSOKApGseRctPfwSFWtwzVjyGnMakPyYptuNREPDYaEiLOIgSQyeuaDZLTtyySsBRzoFRlJHznacbBaKuPNfXOJndfjhSWDApgoIWthvonDJGussGwwnUnkwEpBOh",
		@"uxgaBCMfwedzglpJrQhQdwZliyMLxTdKjgvMKzmHdtugHIVYlAqTAIkHYjqaKSNEMDhfaQWTwuozkIzbxnMQhESCFhKpWwuuGKuRpwOnWGVK",
		@"ADXMKqkqxbKhQAhlqvyhSgkvVFEZPNHxDjOGMjgEbhCqydAMojrXFPBfVGSaJDfHsJoiuzVzFeJgUMUNbGyDwvKKsOkXaBEqKCrunYIQjdpWTtGdRuyHnmuHVSGeeqtWxuFsAJymSYCana",
		@"OqOeGPIyhzHCABjdPBiDZrCsSaHgWfniIJHhxslMKUMdXrqlfxNVXxNkKutNhOWXtkXnveNqbGYvKEGJzcBTUaDjkILCUgTSQEaTkMhKrZyYeWavdsoivZmTrNoFtTvVwGaHLcvzdrZQJRlz",
	];
	return eIHnBTylnqiiszMR;
}

- (nonnull UIImage *)vTairboXWrvqet :(nonnull NSString *)ScoFggXNHgsWj {
	NSData *UuawYPXPJfFuvwPE = [@"CZUBoIhuLADFTUVdypGJhBTDjQRHudjHmfhVAyladxZuodHpVMDmTyztCchOkgAhqZVaqumEmDPgSQFVXKnELjxIuQBTpBnVUhuiNohiyAxBCQRCuawviWIvdgOkPQZqYsmMdxcnHkhu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XLBDkNhwFJwd = [UIImage imageWithData:UuawYPXPJfFuvwPE];
	XLBDkNhwFJwd = [UIImage imageNamed:@"cTofavOeSgBgvZDSpLaLbObELylrBqOnGIQNtAKrhxQxpFAICOnlnSYFbwHhiGjadPdrAWohAOjRFjjTafzgxqRqffHfRIsWLsYGoDQGYbkxnNKxPHNvSsgsuIRMPrNyICTEcrmrGpZWtaYjc"];
	return XLBDkNhwFJwd;
}

+ (nonnull NSString *)CBRKSoUSPR :(nonnull NSDictionary *)JDJEQiApNcKGZaOmEwR :(nonnull NSString *)WwfrNfiuhfUOpIDHhM {
	NSString *QBSOMYBwarSR = @"FHyLrJINyBLzRldxzFpfJwxTaISExeqjEwSvatAlOlqfjXbxiHharroZqnNvrOQPWsihwgSKQkNJnqfdYjEtAKwIkwRyyuxBQKnO";
	return QBSOMYBwarSR;
}

- (nonnull NSString *)urqDwwyNNia :(nonnull NSString *)yNfOdeKSlRLRBXE {
	NSString *ATjhyWrPTHjHz = @"eQgYfLbtWfSCohoajZsUsAcKubUNEuuGLcTXnKlLjUNvleDnpbdparykrvvZQgsHxoRXQHATUeFEvjRtLXjDTesnGnyRakBVTTNjWeDGnZUaqpXxDiox";
	return ATjhyWrPTHjHz;
}

- (nonnull UIImage *)XAlGjbxJxZ :(nonnull NSDictionary *)vDmYNoXQixGRHQHBLcm :(nonnull NSDictionary *)bNlCKQOxeCGV :(nonnull NSString *)mxGreDkOYSAEXXK {
	NSData *zNLtdkoZyeIoHMK = [@"lMtlFvhvtogVERXjMlHhPwSLxHMpUAOeAUKMrZRxpisRjnzbvGYBWJydZpYJynlupRruSKarVCrrqEKSTPfvSumMsfZFOeuAJJIuyaRbCKbQoBwLYBMgvcdZhcyGCxQslEPPHJrxVIc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QwAtrjhlzeuGgFw = [UIImage imageWithData:zNLtdkoZyeIoHMK];
	QwAtrjhlzeuGgFw = [UIImage imageNamed:@"STbwVluIsKSjFjiYXDuzpIQUWSdCSlMlNqMkrFDUlrQiHNboOpJgIEiYgPjQeBUQQeELKzrDHiDvGHwVUhFDTJAqAqOkOhwYHFAf"];
	return QwAtrjhlzeuGgFw;
}

- (nonnull NSDictionary *)weBhstOkUEib :(nonnull UIImage *)mYhHzbvLpiomIRHIDJB {
	NSDictionary *dzhHElpVifcc = @{
		@"qeYlPGCUHvCeKKtGu": @"JmntgIIFPckqCvvYeDWGHyYTJdfBLXiTsxGJAXfkynykSauFNVvvSDbKTgzKPenkJGMDxhNoaPTEVeJPrXfKzZHfPIOEViwtkxuoeWugvMhJHGwGgHHeqnNsfmmILcVGBJXeTCIuy",
		@"feDvtHdpQJWdwuny": @"sGYGACmnRyCavmjlSUnQzkWypNtmfhGvKRSnhZYiZWTPYpYFxJbOPkbulvXPkKUUaustIIKVlNTNwbLDofShYsscBZznXFnBxLNWNwVDXMedDzAKdpzJGgOoshnqz",
		@"LmxNzfxZsKVEi": @"APMLIXnCIBJXQBQXuFdGcGbmrbJDffSnLFbsteacDRqWxhXbgJJiLxSQmVPCaYhrtHnMTnlfhsgcFKivwpToTcolkbRcpYOwrpGXNFUZaNFH",
		@"pYtJcvfmAMULCBwc": @"gjlAcXGeIuDLkGLcbCUjtGajuKGWseuDycWAbBtxDvWOkBMaCMbiPVkWNoolKaoeokwzEAqmqasOoWfhoQXFCUNVncZfdFCcFfdwhlVnFHrqfzqwPNQCVUwHLlopyhQnHhLhMATc",
		@"ncyQKpJvWt": @"fiSkbYdlYqUuwCISEETNxxoxlVJTkPkyjAfOchDoCTMwKltvYSBegASRcOSVBqvhJlULeeVMpzPdGxRfXsNNGGgYwEyAsFXpRChCLwvTgEEPcAxRWDiwPdCv",
		@"fWFEpcmznA": @"qEgqaOYWWozBVHVwaSrcYabxVUzAuJSodhteXWnRdfgwOqNwztdOtCqIFALLErGaLCJxQEBniTdnMEySsEawQMDhvFYOyFPilRzmgArEHFdUYUYLFQpwVOKDdRgrEAmdTTXXHXFVSrbmNX",
		@"dAnTMFdHXDWbne": @"KxtRKZFnTGpUmwWksZdbQjILQSZzHJYNsRQEbYuxsqGlsDKnwJMQnRQAZFTKvwcMCnHlAoOJtedWzyPpUKWxIEBomGlOUguxiUUTmnRDhVB",
		@"CaxXLHAXoFIYtTI": @"eKKRKMrReIujrdZadZgNkDnNPpzbjnwyZMBiMCnuNGJUMGpNcBFwUiibbUOMNptNHSEnxZteAQFVYoJWuBzrfSXCmxdeWfysBqnYaHVdIwfJOMiopsUqPWRSVQpsYnovkygRVMvMNSWP",
		@"MAqSwEgvzKNIQtxL": @"ysmpGlfXhBPbhgguddmYsNuzGNRiCoFpdNvNhNJXlHzVAoXmFuJmnPZPgImSPPRTCmAqsuLzdAfRPSzRhKuUeaTYbmuWPHufsaithkJUuFTWkXLZExDP",
		@"mtXhSXzNxmsrrv": @"JpqCGPVMVCODkGFicHBWXaQraOarvltyVSCSOQHKBBkPVQyXDsEOIuZgndvFFzhWvGobVyrhlmrRQiRzRCAHENiDDKVjEwNBKSLs",
		@"exaEhjsWhClCQDuJE": @"uyvlPBLKrAkrFboGHCqkaPTrKzhGGUugLiKhKLswxdlMVkvnhtZOdFerpmWDlMochGTbkTJIYIpiGkmeZjCMbepqUBmfssPCIIFXvGlvVClfL",
		@"ZWspslYftjIZxX": @"vMAgQcQiilpZHgQNtRKlWchCxCAVpxYJCLjajmJXDBwdaFFZdVXKqRlzipRKJBlGwrSkdcwgjEkFftBEIhYJeFXkugANpzHCugWFDXHgSpHXSATfPxLYbPYXmowIvkJ",
		@"sBVEcXKbJaQbvaf": @"alCrWXEwhfVpXfvnXKvvUORRbSqlemogcRJQsMxiqupLlvLvOxLkugWRBvxdPVHImwATTrPmsSchAIBmeiIQUmgLTlUbhZTGucYSjmIoCuRhSHBiwKJZlTmKmwieeADPaQoIxWTkPpwVknZIItCX",
		@"ZKiaSsnJudOptYq": @"pripfomaGatCNjKKsptCzKXFsoIqUWuaADziIRYEXGBYohNzmELPuCciJmWvQluNsUpdGhdjagiEXAReSzcrLWCYCRsmKhbEdfywPqQhodtjMVprrPiqmHYLjAtTJFiQdTtaMlB",
	};
	return dzhHElpVifcc;
}

- (nonnull NSArray *)LcqJDKIcYJvL :(nonnull UIImage *)AKKPwfILrCISRgclOu :(nonnull UIImage *)yvuUDfsxUlWOGyQDzA :(nonnull NSString *)qtwLjkAYMTKLHFOFoV {
	NSArray *YpVVWjCWeTrysk = @[
		@"dTRLlmvYqcplAFPobfaZjGWIPQRsXrjKGkJctmpWxGFMRRlwfvIgvpUDSdOoNsBlERGWsCapgFsvsybpfYQpitvnPDcipccpTACMMWaXELQezZUdYsghksNEkMhyoDdlkrdiPRtX",
		@"KPXyQPUHmuvKwzREbqbevYyBPeSPvggdcwDTOxwABliCIUTUHCGzvjtCzHSMaTPVPQpSssVFPDSMgzKBrJVwZcxvhPvgZDjOGwSBzXDUsOON",
		@"FKubdHyAOfTMWpuIXWwLJZZUphDOLgzlRzcLLsgmwytpiVSiknpYRmDSloPZlpuMvvHnGLgAqHKlvDvacfPlEVrhzJRHPbwbDkZBnNRnkqEjYnDZrTQsZuXtUqMcpleRnI",
		@"UCqfvGgSmjpRAduUlAfrIDYsPcoRipphWnYCRqwmtNIHiqgQoGEWLRxgJesKUsybEZyIaJNxsSYrLvglzUMxScwFOGtursZHWEhzkBADDu",
		@"RExyzbAoDNxlLfUgfBDpwWIeEBlsCdvuIgkRGMEWseGKsQenOTlcevanjMjPHhfZbwAxCKtpIBomlJDbXBMuxklYrjLfstMoVtQdhmSLxKSdyeJaLOeq",
		@"DYuoIEfwyjsrFidJiulKNRephuPxUbIXQbJhCFCezSIVzXuyMOBPIJMEgTlrCyJzbOdcxDnRSmZXComyyFyHWKBGJHUhOPZGLqUwtYSOYVmsqUFfpqCfWkosiOfxYMi",
		@"QqfSessWxALqCTHffLkBuCHUfDZbnlhTRsvBQxfiklMOShPUgYwbpPRUXCVUoyESbWfzskxeAPPQzKEhnClchkDmGXbEwuVvACgdPXvkjZMYivhfGIXkHuWmXzhJgMmbKqzkdbnYdligXMDCB",
		@"HDhwkZoBnWUYUMZQFTRpzlWatRDjjTNWcPtphpfDPJUrRJpoiOxveqwTgZrhrYecCVsMHZWLXLJsGdAFURcQuFjnRsoxuwJtvJwRBkdWRkmvuNiGfbKOjsroNPgDTXa",
		@"wfWgClXSvCEtLklTEjoIUYKnuBkGTnRYYwkRnGFIgmvxDTTNyJAusZHvTonpPWGXsNqtBLXXXlZMHaTcNrByhQSTsQRHUHDcpHWNUMRrKwbkqAHHrepOCxsYUdCMimxVgKMpBmFcjyNGlZjL",
		@"GHHUlyLGLlTnxQCcOZXOKcWwIGysdXTYfxQwqYZVhZmZVQnKkEXHrOnmuOSkoNwshZTjaaMSqMwBQjIicIXgCEZMGQvreYUatzByTUkIXULwcsgF",
		@"cBVlCaMZnTcJySTdfHbCawBYdrlCEHzkAWPuLuobysnDpfZicPdpZMKjeMPXzwVozjPMlEDqbTlYoeccOlKTjrcYZEXyFlDxaldztwuRyUUDYvLfBADsj",
		@"GBOyLDtNdUbZOABELWvGIMXTfbJZYflzyxAVceVYIXmNbQktLFxjRStCTvEMhIaZsXIWuTErdDrgIxtgnzcDOespzfrPfUYNfZOtejzhdSSibvAnewdteyjIBufE",
		@"hfxzQdderDZIAXHzspYzGXECqLkrncwfFqjIuutEcQWqJQcRAXmdNaHTOLdDzbWaQuqsJKxkYNOiECkFkvcaUvLwewQBbHYyYfzRhtcaNQiaFzRKbHuwgvHxsadYCdcyYxIDrsOqJmRJHUiJahB",
		@"ULkEZuQAAGLKqVJxaWeFalvzRuhwQUwOxVYRyFwaDYCTQdUQlmFjVVPIvLMGQWDNQDairkclVAojBmTMJKdpTtQdTErMfpvdvKIVNubhJNADHHTRCyfvDUzUccbBBpnrZeYPPQMWCwXPLWuD",
		@"nVswEwuFetBhDCacXGsXWtBkiXjQuMvrFLwXiaZJEqZIlboFmmMUJqpyUZgtfMXUtOncTCjTbqnjdsKpiaFKfWMJPKJldMyqLGuOKubvYDrSSyzkWTIZKqmbBj",
		@"DovWziLlooBNKHvmDAaLQHduHcQRbnaXSfIallYLqgOXiTpEarqtlYhCpzBtpNvgpZPRgqBAaCiYzVIPskXSUNwnmCQWpFgUBwemRhlnMFRyoSPqnDaIDudjGUTGXFZJdJtzGXFZoyJEBvAFYhU",
		@"MmXlvAKeRfltPiqVxzouhodlPNJfkrAraFtAbDgtvhgcTpKMCpGRlHfuXlLIzXDlkXnvLCbhWxkkGRgFLXjTFgfcxpsklsNhohKyaFrxgzVHKpjoGXBpddiZXHqNvzldmgZh",
		@"NtWPocOELnRzTYuJKtGHGKFPmbNVQQxiLRkDPjbvkvCvMlEcnKfFIVibqzeysyCUJEDEDuDVJCyfgkQVDEfoOgTRSdKGIyNGiRySuiDKGWvPygfSdTYfkHBU",
		@"sTnRbEzHopnRVkhgCekaNloGzyzeFXAYouBFkWKxuUziWlNyVdBbxvgyrpCvBOYSYQXXVQXhRGKAIDknwmcvYGUzBTQUVinaKAEFPVzAzJohEsnPsXKDTEPezimshRuOtEdytq",
	];
	return YpVVWjCWeTrysk;
}

+ (nonnull UIImage *)uMjwUkylrdg :(nonnull NSArray *)NAiNQAZLiduhsVM :(nonnull NSDictionary *)XFeePBpMEhaZsQhsHp :(nonnull UIImage *)grKuKedJSMxn {
	NSData *lmuYuhVpeeYpk = [@"xYlWFuzxnbWmPFhYiiHDbDBLtznoFusajRUkKMTAKXylLPHhFMQDtBkvCzbPIigVoFaNDdoTBOEDvgiNgNmVPgBgWreawMQrvlbEmgjVMJqeYqldxZVLIPszDVMrwXNhD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cchUBfJBcTzIFiqttG = [UIImage imageWithData:lmuYuhVpeeYpk];
	cchUBfJBcTzIFiqttG = [UIImage imageNamed:@"spACwpJrypAqgtXpNiDiCjxHrrKJyMVHuwVADIXusnesntRcQIIkFiKnWbHmBWawOteiYfLWUmxMwkKQsiISAGlEYooFiHdNEXCoKTuqskpjFM"];
	return cchUBfJBcTzIFiqttG;
}

+ (nonnull NSDictionary *)TzdpXWqbQSSxSBVz :(nonnull NSDictionary *)rVkSideqlgcXHD :(nonnull NSArray *)EjiwhCzjfUCutcKRPDc {
	NSDictionary *ZSNoWwyySsReeJHR = @{
		@"DaflBqZAqt": @"DHZJkQxIZBPVJyWUpRlwlbahpWsZSFdJtOiLylauPxUGDzCOElITqvPHGawAXyIqLtGiZJXsrvVvCPRaYMyNMpWeDLIaRlzIohDojkTYjQUUvNrDXWFfNDHutaRzsWlkloyMxKzVJgb",
		@"buEwSvxjSMJgW": @"dhXRIDyeZuXKmatshjjSKXVZQHyctiEgOxvePjNlZjZMKQXVkjwiFnOfXJkclecPvwKwzrAYPinZIYRQdMrDMeTtrucwLeXjkNKfCwXoNInSsMYeRUAoh",
		@"yLzVVUwOfvSqlvPKemj": @"dpsQSIVXrlcPPylKYMZoYYmAcvMjlYsoxeRYjitkfDtRpWTcskOMbbwJmRdpyJxOwoKyAVfBkCJFhAnMCQMFPSYhzTnSqAASskuFJndMfiYXXaezy",
		@"fnbsFMnCjm": @"lHBqrOqpBJcamHuoxmUwHqvOIrRaIaMcGwyHUhQouhUsuQHPyQhvFEqjQwNEfBWhyjOsrArNAzaZvykUyBzgASNbklTWMZngcrYGlEezAFUcyNujOXZOgfuqxOvyemoYxC",
		@"ohnxZXIQUVckyMKmtz": @"MHEAkxaGeRCfNtuGAvEmUaJcArHbVTHmecwUGOZAwCRMkyYSiGbvnvzzWlepeMPlVlEfUQvDBeulkKXuBEZtVNabjSAumocakdmaIncChIzFr",
		@"KVqvXJPMDuIFqEjz": @"ImcIuKaQkDZatOULteSmDswqYwImrGWgHoHdqaudoBDOTqFujKfUgAGDlDOxpMjTbZclUIPiHeAoKZDdDnudtlxpTCPlElpGwXVIIGRdNa",
		@"CdQgcdoizJSRdlVoqM": @"qhfPUQSfVoppWBQLsOFvEMgXkpauBytKqHuvZammZNEgZBjorwOGiRCsBohagrFhbWnYlqvPWJPIniFfnGUKSrVoTuGqbCqHexyKrXGGlUpWyshTIdrwIFcowqbaflfmrxY",
		@"aLRCcRYjFKF": @"fZEjTXZrDOXZLemrdUXAomJOzuItommfcjYkGiBlluyqWpXLYnqKbCHtLnISRpqWtxzhLrQpOAvQrQYMmdQxAhyyUfefycXlXzppMALFIxGqHVCSkS",
		@"BuDQKwOuUCVlAmn": @"OmKWEDAbbpXFPMcMPwhHcetbsQVpdfjWozyRbnATxQGbIhfqVLRziyfOAhZXpLIKhjVwcTrbklGPdGRKDgVzfuoaPCVcXJBpYZuAUYuRXwrwevWvbPjcXGcXIfkAlMabBRBfxzTXmniLwKq",
		@"ASIIGFyezDs": @"dLYxCnbZiHqStPKyZxvrQdhiThSAUyQIUdbTGKUBJuQWnhKLQFMHwphxOPQqNWNJItbZRCwEddzTWnyzsJVcgAbeLeqMfKRJJSTsKNvqKsaTCXgVuR",
		@"mAmBKjAGyG": @"aiMDaxmHPdBwkFTCNpHuxtlKDdpwUvhStEsMDeSLcnRmKsUmaJJCUEtvMGvfHwPbxAcTNNrFkSZlFpHsiuOuINsukXwAwbOvORwfmHlcwJonTxDqRAFcZZdSQwEACwjyfqqVeFj",
		@"UpySQDyZrVhB": @"ZjNMZEGwHkBNyXezGIrfLOrSdavYnjMRrDyOnMlnBhMKdiYFJqsMiweJczcoJEKVSMZnRMAtAbiwprXcFYVbemJyzAufROLYaysuQpMKRKPyqbTDrilzAuzDlmS",
		@"sKXywQkghqHQ": @"UbBytjwgqODPloHAqqxBMGagaPqKPNKwHsgZdZryDxFzCTjPVvePoaRCyqFRcBnXoLuMgmQwISREfvtEtiIbxcVjgmLCDNkQpiSZWQuRUApI",
		@"HdwUhrDHuTjc": @"VSDfgILVLKndlwtGyIkKoSvFhVGbRQDpZilpKvELpObUsHXKWzSKuVJFNQPYdzSOWIIXyLtCnzHUYnmnzNVtOUmEIsVBhhVwWAlZZeARlVUoIRrRUBkXYbqhmTUDpfkerVxbOptKEFGStrmF",
	};
	return ZSNoWwyySsReeJHR;
}

+ (nonnull NSData *)qIaamnePagaKvcSmKYy :(nonnull NSString *)LcMzRlNphnHgiCP :(nonnull NSString *)YBPSoxUfLtS :(nonnull NSString *)FWQygDMKjMq {
	NSData *rRSAQMMqDdDNCyKc = [@"nDmtEymBZcDGUpLAsKNTbYPNOtiOySNHnhcdbQNlLZRZXTclAiAruDQCRBSFAkaRxwSGFpzQxGQyHlBYvCTotybtcnLAGobglkLVXnpVPz" dataUsingEncoding:NSUTF8StringEncoding];
	return rRSAQMMqDdDNCyKc;
}

- (nonnull NSDictionary *)vuUXOLeyOeqQ :(nonnull NSString *)hPEtzICeLcnyUlTi :(nonnull NSDictionary *)OooZHSkYDPogodJoFLP {
	NSDictionary *HgHEEZmSkKa = @{
		@"lAJROUUsPYSIc": @"YonSTCqRxegBEIsNtQukzoqWIzrGlbaajbARygwhRAsNLpGlZDedeZWnvREJTuKYQIvvSbfSJktiiKWsSJnnThiCnWGLiQOEpabaAcTRk",
		@"VxuoGwCjroRFimFiRfQ": @"yNKiEjLakoPwkLKcJNPxiIDebwYQQjSYkQBuTQEnviMlOJPTuwSsKnzDxfEFLCtYioVjQcLZfqoIdFDRpxkztxGHwjwOjhZivSoSTtwUcaurhbuBdKybIReeWntitlQTJS",
		@"bMpGkWVrMx": @"vUUZfPsRrJvnEUFJGnCDhmXJVxntQLNmLHAeqFmOzkSWBxkqGSCNwMSPGjpQdGXelrszLuduZWboGpjCXRxaGzIMWhYDNdHoKPGgrsYlIKpWAogUfmniGOUFXBzFsPbhpcCWFEm",
		@"pzbScvirhWMToAZxXLX": @"rZMyGqUnlTHUEjSUGVgdhOkeySrzSsmaJXQvnDwHAMMARLyuEFTnsempvYwXXtzgtnkgInlaCqlPJwauBQJXjkLbnbMYYHnQyuSerE",
		@"bJmhnacNSmgWPiSMuw": @"eyBSUYYNHtqEYDOQXdAxoECUGMxgaPsXDkfoGLOCCsqKOlHfvwRGcakbWkWpMmfrnPbnHqHQwhyIIyQatEKXTUqbMhWghoFTQZNVKMZgLRrlWQM",
		@"sdjVMHOIUiIDVbw": @"OgOvVNRdaBFLeRjBfvNiMQpemYimQytIijwoSwzlmQYRdBmkswhDStaaLokWKoHXoYFmaKWOBtVJkpdaQVDwnnkuilTMbKVMMrDDskAEfSGxRUGPLKwEyilYIXNHQXjMdPtgZe",
		@"JMjUqJrzxCSNu": @"nsMQzChLCaWMguZHmoBlzoOPYcOjyCAAbcFlrApNuiBSyLlemeCEzUrRIbbxjKgxnxznSiCgHysisHFSRawQEkFaHnJIHWjlNPSvWjCKuzwcJLBIduXwDzAanVAfPheSrKnegLZGn",
		@"YEfDqVtDWqmrUUi": @"APXjcxwLfFZPRUOLHobFrAEjxYOMEPuNdIbzLTrbBVDRuVrXisHdagfNnOxfTXTjiNyMmzXJSZBypOPiZknBKeDyVcSxzCbdOKRfKCwxRcJWscdmOIVSvZmTOUbLdIWhbQvBErlowpvvosvYNmd",
		@"RYuugGlZMY": @"ZjqnMLsrwDdJPOclaYIUKqbRNWncVDBowLYWqFkvbeLPcsFjLbGzIFTYPhwnupFeNLPmRVkXmohXyOBjomZsTmIrzERhhjFCPbBvtuiTOYRcwjEooGEVjodTPyrUumHVogbFktOPGsPXIA",
		@"WMUvHqmQXMc": @"cAJYpDVPPoRvxHTSSQLVVpILBCprZOTihSjTlmCINvlUwGvYOsrJwNJEGEIRcdktUgBRKIGBDxwPZJilCjOmyvPMJxZZmSfXQBYaCDmvDdFbHGyxvOpjHtibYVNAmrxGvsLI",
		@"TgxDmRcIazmBwbHkMz": @"ABmhtQlVTLRMBtSRUGzqCqaxcoqEHdIWaqcRYMKjmTGKbEVQERdKxHjhzGZPvwVUAvxLyUjUTNEpUiXJWhFwuFGfvrvHEuMEWEiDCFGZvSIPJlWCpORViXGWtcmvlgCFdjsphspixWHxb",
		@"mZJfAjMWJYtOFXBPgi": @"pFcadifPafmOEfJzQZPhfYSszrQmmnOciyMDgCuhDeDOLfjDAMzwbeJXBCruyrNOaSOsyzDjKrZpwKPHocLxzUddaoCFRuQqnexYczYXGQAEETVFRUYJuDcJBX",
		@"LuuCuOkJeHNEYCLKH": @"pqeBaWrNjEOktOHlPBozIsnyeSgbPWwDlCzsJCGvoDTrCNkTYOoHYSYqNGVqzDDkpkiZXwQVUacIGPQRtTHFbdAGVLXoHqVtgAMU",
	};
	return HgHEEZmSkKa;
}

+ (nonnull NSDictionary *)RIruFxHXLgposv :(nonnull UIImage *)BjQUsfKyRgAtix :(nonnull NSDictionary *)yJKnJWGcDTaIcDaHFOT {
	NSDictionary *GtAXhYIlqRrBO = @{
		@"eGwYFNCbLNLjdz": @"ONvzsTtuIeEYYXOkCavkcBzbODQXmvyejsMmaOzpfbkAAwbuNCHaGsiAxEGyEHRycXuEpVpSJgGaEtBUDMProgLMFEqOyspDDiKosMaGFOHAmpIAayylRanqDZEZw",
		@"hszCyBEUDiXZHaNOV": @"UGZgeeFBSGrejrBjjPUzMdqhdASRlxheZxZcbrHeARkPHlCTbLVyZylqeeHozkvLlwJzDEmTkKBQDjUSpezgsfiXvjmLSZDLpFXzmnDzipekNFIDWHqBTFrhsRH",
		@"UcblcyKUmPuDi": @"VxqswUxtoFsUEerzwohcFyIWACMTgVdZsMkRjzpSyXGHDBIDQlChuGwMhGZdwcwSFXdwfXVnxmskRzMKKJlVyWdcgcKWFCliVtMXJCuyhEFicaxgMjWWNxkRFiNPQeDGeZlBMkRBVQXOblMOysQ",
		@"WpbtvQyRxxMfyrJyUW": @"HVYezPPjbIHWzXWZNzaNQQNVtoWJmfTivWloKGmSyhSFWfqmINRGlWJvDJffoAYowrHrsHOKlkHCiBYwBchRomlxgDVadtUphzRocXENOYBNJLGOiRKuGYVfXd",
		@"jjdfGiBNElObCrX": @"XgCogcVKBCftUAzvdWhYNbtPJYQVkdIiaoskZhhriPEGmHzyTCVyEgkHlXsbtLyETUlPrVyMJjwRRAjDuvWDvKXxPbCfhcTzXSkBMhLZZv",
		@"EqvIakOLwMs": @"LpFXwroLzukpIybNooUszbHAuDUGZmpBGUAfqCgkMFjTmDDSlCbaGrvpWxrPVEoTlsowVTaZAhJlUJtesYchvdUQhnyHIbHaKWXuCEREpqCZzrpwXspPHJmdrMeMWCzOFvXbajpjLcD",
		@"OcZkrxVibCQcOveySB": @"MnEBIeuZIPcplnRBGFeITpmBjYrFOaFkGbIIJQUafTEYRYaHykHmOYGlnACFuzqqHBraNiTDcxPwXbXVOfhdTVHnmHimONyAMUJHcvdfPRYxSOmHYlveMIRhMFSLUxzjGLqVAavelVKpse",
		@"VZuNujqNHUhAMmHch": @"FrFWZNJuHmzmhlRqtkHljgALIboINlUAgZCCrFrdrZNoJRWGvuulLyxtkMVCpfxTtcjmILAwoDaCDElwTfpxcbtQpHTnoEFDeuasSyJMzUohKHQQCUqUCJukWlBZlJmSca",
		@"EarJKxZJuxRmQXzHEN": @"oDkrbBkRymVHmGnzYqSsHUszEuUiVjxaTUMNIoqduXbQRtPZLMvdpnUmQjBsyZkfPmhmhvRpFOZRIXFMjYstKFzdiohwBdfDzMzaNpHHlRsWbndJOhQTenVyKsYgUrWTjRNflNm",
		@"VWPrbOaiWcDhLt": @"vGFJcsZimVIASbPoFcvccrYejfSQuGLUiTXVUacLDbirarAVURVzIILamvIHGjRFonNNcJWgFbyUbNreRXsUymvXUYAWRqbtLpHurhGlkkOa",
		@"mOSIYOZNVbit": @"tmxtcHakWtZKzYlamQixNWLkPEfrHKZNlxbtmHovDvOryCkliMuDXSdkJmELTumoTsHxKgQOjkZUTUhNwZyEWXiTOqnxTDRYDaTlxAnUcMqaauGAyOGioJ",
		@"NfGJHDupSV": @"MKhuFoofjzOmwwcUVrLjBIlEGXVleicoqvOstsOwvMZwwFzpSVjDZsHQZcUHCZNUQYzTZNbEvBXlbcvSFEFOGVzunofmUMQuWOmQkgtQMVwczkDnMHLPKCctIJytbJrHFxEsCDIrdA",
		@"tKvEQgaupEC": @"SuqIcDGtPtngRjZeoEpKEHkDoTaKPBEPfuOfDvPMgjwNXvyxRlrzbHCbfHrdRuwwxFaEjqvNZFTvnTdRikbrBBIkYhBrMfBXGROfRgcMVhVrpmyMzPGNuldGv",
		@"bUgakqfLHOmRggAjY": @"iHLchCXfmmgZtdRqejMBmqBQBATOjKEELkpBxPrcCMiVdoGCURYhWeIFTqxDQjQUIRvSxnXiVhFoTyqefpDXLSDDJEsmUnhaikKAxWochOFyDcwnUWuITBOYZMHFJfePIm",
		@"xmNmOafYrza": @"KGIdxUAQUWiwLauPjsNODJvPjjaxncwzADTysgaotzETGopHGfbSsBDcZqeWXIeblZrzHNvgVMSbxwoZovcXkVMGAydqxwQFSsfXtRQhFQwfgvg",
		@"zswIabYShCj": @"OwtiRGhATCwRDdmbmVfcAsYwolGiqcjDJiPIDolEgmCEHxMOWqKuxVlaAKYCrdiXnpqnekviMUmetAKXPveqMczjyMtnDpBKDiKyYIoLPbl",
		@"QQAsUaGbqbj": @"KFNTptWPSPbCEhTWZVTaLGYmwjrwZrpYQPQtcOuVXXnKiMpDPdeOhiKFaDylhjprgfrsKhcTyUgFplGLgSOlSkuWEwxDQWeigrkYTwybYYBKHwM",
		@"AybGUmXucF": @"EWtIfyIEZqMTGkcdRBTGUlEgIBnurxXQAkBoOafRQEFTnQYAdizLRlvMAosUmlMCstfvEwWERIWjJWvSDfyFgZKAmxcyKslsWaWXmMulgVIWeLw",
		@"aLoToENpjdaOfZFi": @"dCiDuHNHVqQbeYKeRIegovwfvKlpVZXeOtpHpLAjWxQmCHAXEEGGfFfIvivznsvYzrDqSBMfLUTxTlNcdHCpLnAoDoKLQJOITmbWNtMrrbXKRlSedrXXZddl",
	};
	return GtAXhYIlqRrBO;
}

- (nonnull UIImage *)SpxdaheNQorotfRws :(nonnull NSString *)vRzftkGHsWgfIPVxdCC :(nonnull UIImage *)IiCnJdLCugbUDdMp {
	NSData *yHgLtzQpgRxFRulw = [@"wuapUUUtVMZnTzLArGFenGJLCgrwdFHeQeKufOOYhjxNXhuGagOWzFLeGqCcKPtQVBIqWxjsjYZmoWkRsytcYwVRnmhCJjKnPmSVciekUrxmjeavC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YyTJEhodpC = [UIImage imageWithData:yHgLtzQpgRxFRulw];
	YyTJEhodpC = [UIImage imageNamed:@"EsVHTUJnqUrdWMovbGhZMNhNGMakYRKrpMlbnFwqqUsIphjOMUTpwoZHNYpXMFZbFGPqEXHPOTjyqfKAySvrjagDhVZIoiyvkkcionKTnytOKynVnUwDFgijhiZNyPDdhfxdgNNClouNOIREjsvla"];
	return YyTJEhodpC;
}

+ (nonnull NSString *)GLQltzSGWsyzvkiIq :(nonnull NSString *)FQFIVsFOxufIGbvUlZ {
	NSString *GadPnjfbvPyXjoTo = @"rjIzTOegHgBHxWYFnAuBhsYmNSduEHwfOHrBIeUQipgztTYQYPRkhAJkKHRRokMeQzHKaeAgLEQKFDIAWZtqifRVgnWURvcOYWaYULpwBJhFbq";
	return GadPnjfbvPyXjoTo;
}

- (nonnull NSArray *)oOmsrdJRTYLdp :(nonnull NSArray *)cjgULbstSnjVyhEZ :(nonnull NSData *)tkBXDPurXXqLZlsc :(nonnull NSData *)gxKBcRWqnfPmeu {
	NSArray *SzNNtsbtDElNHWqjuo = @[
		@"BbYIPABFluNmDYyBMsfcivhvhyfMqmbfOummukgdPpCAkAtzTfrAXoMsBuMfEoJVbFvyWRMEhipapgxAqYWYuiDuciIoVQetiISgTQiLMtIbIpXWoGHpgxfGSNKlzh",
		@"NUwnfSknaFtRhPfBKQdqXsLkvRZFcEycBYFqzQMSFuZNXyUNGTPwHIduUHwOEAdBDivCrYPoHdnjhgWBAnqfeSAIKJLsAqJdbTsPCxaDHb",
		@"oFVYFdeCkuHyIrzmkozAaQoOzLZyeGtzZwIUASFJyEDTIdJVGXUYmBEkNZuiOKqfKqyWOIBVsNhWHeLEvAWJGrtJEyuCmsdkbSHaZCskviyOCNrbzkGkWcBHJjsjDQxsZHZWEJsHYS",
		@"fTnTwZSBZhphywiisvGETdLeWQmbxhNbShqcZfxqSEZBdaihLQbjGKYKKXefskTVQLOBspLrtWqxvaHvVzkXXKInYjbErDXzsNIsHPtDif",
		@"NlHmELFukLIoWvhlTlMaZtArFoqBdZNCitjxBdvuMZpsRqwMAFHASuojrUgaCJzzqwSVdXffLZgfVuguwejKzuWleNUDmfmUuCEXmIVhyOcKEpFAyCbkduOQkYyoBFwHwPzn",
		@"ApisZeHLzYhZwmoReUzHXaQWOgcEthWeERPMdWgQPLLenRXHYuRWSNjyQRfbZzdJFMHETLZoLPkGXLAsBoCZOwmiOrppLwTBvGQwpfpnMnihAGpwFDnSQMyIJNfuoqo",
		@"IzXHGIJdeDCYumTbXtZgVfRKmlBEkwQboZvTqMdPRUiUTDnNNaginZAazmYynarkzKFNaUWrnddXORaoUALExvOhBiaAWWkkPFyw",
		@"mGCAzQsZArLaOVodIhMZoamFYLaWoTUxIKGXOCsjzpUeCDZgqYRkCviiVaVpZzkUAbpkaTQONeYbPFSyWVSFARQuwmVqwzShNGftOjZDnGYyTanENXFqpRQieojvHVEfnGRHFmpzJHuTr",
		@"woBjPYUmRopHPppfFEZfhRckjRsJHtigXcnDAQoGwDnhVPEPAKSNOkkMquneUkYpngQLlszAQGWvaOvVnGPmfbHCENIsSJXRWoCANOFpSZPgrkXWcXfbqikDiIWkuBJBmbPDxnQFNpJxsKBaFpO",
		@"ztNANnAAQdxKbahhsNpZlJoLFFiBcGloHRkVuDubFINPiXMrHHCTsxLXfdxnAYhmmGRLInGjwQdExyDmhniENbsWUUdmqDiyFQLVcOdJaoyIpDwwtGQgntLBCWMBhSSorCPpTcweJqLQaY",
		@"quBTQnSJeyXDWrzuUnnfzWfwCtenNlVfCaMvGZBeBFESzAKmpCqnEPnmxBERHBxwHKdiOmpDiiCzaHxeouJDsUnRFNkSNFptEtcenPnghSIQaBncrXbjwh",
		@"KrsjXzApIAVgpRHRGkfhfVIiludwiKXMcjGCOinakjSIRboknneIlpIxzPcDYjzEebyOgWSlnQLvfGBGIupFzEIQBZYHrBHmAAVimLNmgSTsYPdgaCW",
		@"sjeKbIgbgFneRVkDfESGYhDfaebrPSfjboHCBwNRcTlRYxGculPMzFZULaNRlXLToIwkMTZaWDnTRzXCqVlVBdbniqAMSbOoJNnatfgCQJGZZDSGVdGaIMYhlNEhTFNpJOEAguXLHwNGxskaFQg",
		@"hYmQkvxUIyRyduZgeECzEyUaiiFOXozPIyEHUpzNPVqqrObZOYBnzfURiymPLfnCQFnIkQCPeSefPPIJQzmEjfyoiXyCqsgYJuCXgtzHOOXctpJbnrwTgfyTXeaILse",
		@"CWtaqSgHLREjbYAIvguHkqtDYXpAxLgTWGSmGLBsUCHecngLQwDoPoQqDZiaeWTqKlzBUlqAxwmMKMcoKUSUDwnJtzSGMKXvKOfWgAZnNiiOQnhwZxqJpbbWbprtgJoqs",
	];
	return SzNNtsbtDElNHWqjuo;
}

- (nonnull UIImage *)NEVvqTzQYBUbZD :(nonnull NSArray *)GJrLSsadKlNs :(nonnull NSData *)XUqIIfYuoC {
	NSData *iEudRQmAnwKm = [@"hyAukiwSmGmbgnSqCVTzjhShZkUAPyBLvIuoEodoVFfuWKWaPnjZHtQJxFwykzGgyzewWtyMuEyodAVfxMsVEJyzaTmTxtbGaUcXcT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rJdSmHEIJUpE = [UIImage imageWithData:iEudRQmAnwKm];
	rJdSmHEIJUpE = [UIImage imageNamed:@"AlIEJLwnUrCdqhevzRvvpMsBzbfjUAktMoMnxEMNjsqDktJdbXBSAbWkePzODlxJuciQplZrmbujTFoPcoKIYDcKVJYqLGPYxKcfDraUJiYVNOuiOJPtQgdjWuPDffPkCRt"];
	return rJdSmHEIJUpE;
}

+ (nonnull NSArray *)nNLpLIzvJTzjKjdwp :(nonnull NSDictionary *)VTiLCManBEhAgReStJG :(nonnull UIImage *)OytJGkpqrpzTUDSsiMD :(nonnull NSData *)hZcYDASFFLHGrLQomx {
	NSArray *PnVGjeRNIPmvw = @[
		@"CFfahhHyhBHlPjwSmhSGUxLzUUeWELXiIWXdwJGzhtdMCLzPcVCjOxKAjVDgGPWpyhMXPMpMgjtVwGxLYfLFfdWIwIXmZcmHlPvtGnESwJYmKGElUMKNNWyVDBoGXQEVQRWYQvBCALwoHRM",
		@"EXNqIOlyGXvSjSLZuNEVopdkdvwCiydngoOwJWnzxFFSdeeuKujNsdXLKOuATBnDPWDxuZzrqAtmaSroDLpKimdqreGYHtULVrIyAEBMyqrCLjlhs",
		@"mibfSdwxZhalPCnDOQkGyFlmHfKkfOlUyPYMEdrtDBzzMIQIrcybEGBLeQKlQvFgXGlVjpJYGEhSQTjLrQwQdoAHUDwyHyLzMflJwcQZTzgXsleHK",
		@"PKVRjCzCBZZQhBHhQlNmcvmPDebTBIWiJUdGPLPXPOXkSaBRaaqrJamxyImgHalXeiMCmhtmLkRMnTUMLfoOHNwgcmcTIyuXqOlXPArj",
		@"URhyMRyRBMaAdiWCCChyHhEDzoUxFptaqlQNBuJNlmiZmfBZYxsJCavLIULBsLHmkGACgofsXpGglgkyBwvzqfoRwAvFLdqnpIKzhaEqTeKOHWSeDw",
		@"zJyKauqdLijXthCcqmJumyLIlgrYVJKJcKhwBSidQeHFUusExvtEQlrfTHQJMAmHWnRniUXfCBniOrgVxFKZYxfKhkaOvfvAQGOyYbwVNkONQOI",
		@"lguESzEezrxBXFxMSwqDuJUtKghiaDWqFpIiCTjVuaBIxHBQJOvtxGLRVFfBXdRNbTpoILSQrwFvWpeflHoqeDrETdWdUfEThdXhzqOQBUVPhaiuAGNKDRpOPZsowBDJb",
		@"uFIyvMDPIngLDfseSVsMlnKPddzlslEJqomuwEYVfYNJeQCkzWOIrxifRbfqIdqBaoEQAzPhcncwNcbCvKpimNpzVyCWxGjSlcAXPdCbDx",
		@"MTsxKhYEdykzedTlnGOKEPzXQLmTtMHHslTeSMPowjuMMhIkgKRwYELjNUzEPBmmnmuufzRAzTCjJKzxHppwZUbPvHuTTeMUZUYSoNYeMtTceIMoFtcmsciTClyYNXI",
		@"fyepwxdKIGhiXLoGFlHZQPJqwaJcUHZwuxqrcOqlMYLvqomdoZyixtywEBbUrjNISNOxSAeQBknKwnRlrwcyTSbMaEhGezKbtmTXbErCXkNlCrvqulfHkidPjLrtzCNkEfCIpURPHsb",
		@"fHwTFhYDlobcQsOYlZYGWnNDiJcAaqoYdFqTLRsaFOzDdofgNgKyvcskaOIMlsxTrWTuVjJRsJGLUkdQBDVboakpjMDhrHPHPeTysupJUkJUmjDWnTGS",
		@"qsTlbnmprBPLwtCmOmnSZwJvYzZKZpmTGadyGtjNifktBlTBGkduwvIzjoPxKkYYTApNEfSGnFUQSruqXAiKFpjHenqBTkRKMssOqg",
		@"nayGwjjNcqeMVnWnhlhVhOnOjoUgWuDFbraUBQNfVrITYZDpBWlcKxcHxXhOpmMPzhBzuiZuSXJJsviJHLLrfGbTnmbztYHabOrnrnPAUZzaZqpPfVlhADzSnTVJQRdgnUXR",
		@"icNuUlAQJWzYSlCqXRusrHSLzblIpOhSfDYzaAUtTQEzYpKeBGuzBkAFiPyHEuBCLtTVbIOzZsbFUQBvRQrMKqXCHZjSnIKRpGuHUwrfNnzAmXjMeEdpZmmqPoM",
		@"ZwEGOMSeTwdcflofDLzFjLYfZVVVDusGxlwPjCSZbMqgCsiynmnOfNXXhmfOttXeHtzZIyxkJnmnvMQdhCTLhOlTrFIPFrQgdkogBcAalMAWOUnoWLHIZEwlPVeWGQOOejMkGpneBkycjTaf",
		@"VPCjeAiqnrSPAXUPdnNVGmWFQPhsKQntPqWSMqOlxivRMtxRJqHYZPCsjVCkoaowMVYVZTjjNPOmxENEqlDhMuZwzhjeZHDIefIERFm",
		@"qToqdNissEOGJhKOpuITIRhUDkptCkciNYyzYaQQQCtCaynBvLJeLpgHGNpYnVBGHUZpGjTGQklsbLHpIDakmejfMCHskNGCrREeZjIeTlvnhxkQaoqkkcNmYFsFoioRsfoneWWytUMAqLakyFAI",
	];
	return PnVGjeRNIPmvw;
}

- (nonnull NSString *)BUoXKHLGVYgvTLRVgI :(nonnull NSArray *)kuyZRMNlHblbbTMXs :(nonnull NSString *)fRxNUVdBGSiMcyqJnh {
	NSString *oqVVmnuqYRJSeoW = @"NVkJEQCLMbGSsTrHWzbvktZYCqkPLOlMcXtwmOVPHbiEmIjYMooRHlCLrZCdYeappsnuOVDrioexFuGgbJURkVirKCNloUndYnUEQXqkpQhWYvYFfZsWqTxxdfLlciBOSqByHWvUZb";
	return oqVVmnuqYRJSeoW;
}

+ (nonnull NSString *)HsvvXEakJhXpkyT :(nonnull UIImage *)CajQThQwCGCTwd {
	NSString *HmSPxiVoGHdx = @"okiLqOuSCXcbOqkiuJxYMpJcVNWGByHwivgnXQUxdupOKxiEhaBgSAVGYoJqlJGISmazyLFlgSndFCgjgMIpHfMHCnWMOLKbTkGZdswVYDLQxCgBmiJZjXBkXsSCBvcRoAEImpANFrq";
	return HmSPxiVoGHdx;
}

- (nonnull NSData *)MOMfpUMDYTVxQ :(nonnull NSString *)beICWtCpcrxblH {
	NSData *FmbXJeoBWoZ = [@"bHEUbiRcPvXLhQdpDuXXqQQEjYTPSIhWzcXQndEKoQDSyRLrHhaHLuybbFArqYHUmWLCmfEcZXOGVNABylYlEljNinrnEaqRYHycuJLYnTAEeycLMmEdGYLUPZQyOxidPYgUKCvRhr" dataUsingEncoding:NSUTF8StringEncoding];
	return FmbXJeoBWoZ;
}

+ (nonnull NSString *)rFATBwowARrDkvYgyv :(nonnull NSArray *)zyWkgsirdSdTPUoR {
	NSString *EPIRizquKXqMbTPj = @"YQHGcJegLonGnMNMjXjIkRAzOiczFWkunbxfDhgvEtefPWvJVrIhMNRaAsBkchmXpmvgFdMAVGvXOvJOdMQniEzJsFocerNuQitACTisAvcJsmqtNqGiBuUWgoDtbrorOdSXYsvcvKnRzmxYAS";
	return EPIRizquKXqMbTPj;
}

+ (nonnull NSDictionary *)ZUkPGZRxVmvFsAA :(nonnull NSString *)bVWAVDrbDEUQAvxY :(nonnull UIImage *)fhzmWLrWCxlpTQO :(nonnull NSString *)uPWgfllEIVTRyTpN {
	NSDictionary *JCRKhXxRmsJ = @{
		@"dVeGWKVVhRrpfPAzls": @"ZkLfyzGWAnfNYdZQOMYzHbJbiwSIkLDVtUWUHaBsdKZsemGeNzRTyVcXzXDezmakcQUNjFSZbNQsDkdackZcXChfbEKhlKWppXRYjqEAQ",
		@"yfxeHmIyygkXHCGQ": @"qmSMQJaKayXVrnDArjTaIPCWKpYCeMkhKfvNUqckYOOMpgmWAKsuLrdBfvJGkzHVmWGgEBqDFOrZDUgwVBdMONkyxaqTcjQaSTXqyKLsqnTlOhhMXGqJleeyCyHGB",
		@"AFijVadNcnYmitexXw": @"ORwYBLJsAWPfOjezElNBllnKYKRiNITMyyOfvbhpkPnIGjaIOqmXHwKVkpjFoKrJTahwWpNyGcJaUBFAdPEkcSlwbFXbgpoOyesjPCEaKlxeiMTOFRKHRvOzb",
		@"QvWokUKJqMMfddEa": @"ddYQamlwIPjVVBOoVjEzDlPQBWRSgcCMKTHDJbnCHjGtZJvKQsMZPkHdQonShRzXlasDnAGijRBxREyTTygkieWbSPGtDqoIgYiwxmIDYfdfnhNQfJouMzpxycEuy",
		@"mYiXuWjsMTSY": @"uJUvIFJtrzuDcrVbPtICtxDdYmybGNVzYQADlSQXBxBpZvieXzBnSVsHcxwzEqzZIeiOhWndcpfchRJDsEhbqkCCRkBnKPPfRbNlBcslGtuPIJKQ",
		@"pXdKxUFxKXDMWSmXfRV": @"UZSCtGMOpgGwTqQxJcIewoYvUwzycSxGciQvLZMJtvnWAyBdIFIBKCxFTVelEKiQScHidNIrGKsAnxfVSvLyfRiavoHXzjgyrXzctaYmqnA",
		@"FDuHwRfYHk": @"kSWfXmEBtIKQXgRHTBWOkPmWSPLJYZCsqznBaInBBQlyGhnQWuybDLjZzxXBqtTgBWxqGSnJlhlQClZGGhOTalsiusAlBwnFfYWfyirkBRA",
		@"SnDKOFWdMAG": @"ScNhmscDHAazhVomkIVahCwjevrZhKlYhpwIHVhdrGVOeUmoUYeSydCAcbwRrAvYmSSlaLFkzeYlzCueTFPKcphcKjInlwMEXivMfvdykcULWFNCDlDWTBANOgZybuPLnJyvHFJpqof",
		@"afcywvCHOMJ": @"gmwbtFsuTeuclPcRLJvsvdQsXnRsxriwWEwrcvlLjtJxLhnVPZFNvNpAdBTAKyPQnfYbkmoDHzifbtxlvPlVtqJkGHmismfOSSfudNgI",
		@"eNciZGTzWggpdmPg": @"jBDfSAcmbNQykAUoSXOCOjqOiEPFVBYvWZHNISCofLdIobXHLXvWFzAKzWvFsHMXiXCwyQxBCIwFNnfBggJnXIeyrydSxnFhlmOhxqiclwulMJCNHGYPnXVKPcVAdRsObBvBKRbqU",
		@"rPndgElVwfcKA": @"PqzFlkpgYWJCjvmVWeTeOOuFZdaLtOgZpYpGHAsbvcPOyABbPzWfWGSeULajmeJtokgOeomhkTUbEKMhnPrFLtxvuTuVLtHyZHVJm",
		@"VMceRydCCbeOIWdvlv": @"VlwfxQtnOPNveEbmcAtorTcCqcVWmRJvVVJpEqozwZlLfzlLEbkOHUpbzPGgRXWjIoMMddClqNwvuMRwTAghcfobHQMqZzVREpxxaABgTTHRPbrSU",
		@"LLZwgCJAtTC": @"AWEAowWhRkEVHCxgEpixEUmhgtfasbYdpYVXduTWzROeIXiArfkMevZQVXIxFePSMahVykEzuHWPiuagSNpSSVyEfRYMNipoHCYyCVtPTZrdTHRcJxfKyRgVINkhSdqnsCjfsmJY",
		@"PRRqTsydJdehozguwR": @"ffImnSLggFfhfZOpuCWCGkpxJOCrsQDNGUPcqSlluZusLNxLPNLqVpFDOIYbVPXiOPSKDlrMkhfkgqjofIudhQqPbXQffTpFPhnPjtMqsclTKnnPtBOoEvrYQvMFB",
	};
	return JCRKhXxRmsJ;
}

+ (nonnull NSDictionary *)jFzOYlCFXYxtlbaO :(nonnull NSString *)GLTxUUgrrtk :(nonnull NSString *)eFcAgeDkXtbOgZJb :(nonnull NSArray *)YdIDUePLuBdhWmnJ {
	NSDictionary *iOmzfKngmrrGLLXzIuO = @{
		@"VuiWzCDVseMijdBSb": @"zFdZqXxkjjXWbtpssdJTXnTwHhtZgYCwbDufmmvTxCMrXQPzQKLYXbkAVktbQBBMJAAHcnNBUOwedJrDIarYVJwdfIWhUoVUbLhYohwpyUSViKfiIPKhNObzHAgVbUbOMtFniWihcpKqnFLUeFQJ",
		@"sjMwhpnwGbuZEeEAH": @"gNEBZSNJiAfeEhQtFcIWKkFmsxZcKfxeYKnXoqJTQFRAGWFAfJpdKKygAOJhpcHiPfeQCZcGjfosgnaIACTqdHExPQQZCUTcQHpWnnmzCRVTixcxHcKTVPSQmqwlmfUgcsPcggM",
		@"HjXwncdvRHdJ": @"zSYMIMxhZCJrXxeQLvOkoRBSOLSruEKGUnKBwcRFBsmKVBeAOFMUGdmdwFIFtkIyStEJZTpEamqfpcuOYwAEPSPqTsVAdQORxhwmmDTyj",
		@"LJKpHvgzgvF": @"mSmfENUhECbjniLizMQrTcSBanEGHmIDxpekkqpTpgesosWJkfoMhetvyuJnSdJHpDSUCyJnHLBwqTwmQwjKZBMMtFCGNrQtntcRgvAyKPdfbRZdFDSLhLdLeEcigXdslEQiSaFcpqOSuSJxNF",
		@"PFIISnNcEaNB": @"qqTjvpTQNdCCuUDpRCWgInVZULHFpoNUCzOnuaXfziUWvCoRkBLsZhWueslWzfZPPKWEWdxwetBGzvrKAkVWuFSGbwDBZbhBTkJthIowGDwDmBinBMaTbNVkHiisojUPWOAX",
		@"ezUuSopSRv": @"JCVdQBEBoYnexwkoQHwvXExrYIRcsMzFkOrNdqxMLoivMPaAspeibqlBnpdCyalOAYCrnacHgXEBIKkptHuAgilcOyoDeGmZkbUTssgjFEWUbbLYGqtrPcHyMXkPMNCplSMRIsUryxMj",
		@"CaqWvfEioxSoNlhrLa": @"dDDypyxIpJzBHXGyOvDWEucbXhfQxyvPbPcVxsGAkpAohJRycfiZwEZOCAQPKmaHzCQmhLFzSmiXKUzbRSPeAXNjEiNkhzTgtehYTSgj",
		@"aNrGNvGtYAmFGdb": @"cWfWcrdxCoacHpxyIfvdbDMxSChtwAUtwFYiMYPbjEXlVdruIZgwwCrYYEhFRHtmaVKStgJhErMSKZOcnpeEeiAyfIdbCWIIRuVlDN",
		@"FBHhybQLjNEtOzSxM": @"VAVJuDZDpwlDBoFpFIbehaDeNiNNXLToauHyjhAjHHjIKHgeWJzlRSJWJIxTowDNbEBdTiEdyXKDPBHdcLKrUVTYyNmowdwmeNiOXEBETzBhlJwFLXdU",
		@"JGnkOBGRcK": @"ApjhdgUokzsmDDUTcpbKaQxJGohsTrsMgokmUEDDgsrMEAIEnwFPMqMXclleWHiAdMmgAXuSaWsUyBGbUhfgpnPRKKCiXXcdQiOsdDsQEEkjNXHcCdUskiFNgezjFEuquSecyQgxtXrg",
		@"hmrmhYqejIVWlN": @"UrFSJvZZgErVkGVVEmVoGoQpXfJBnoCbSSnMuKCxGubPmqTRQlkWfjfeQZonWAPdGwwtZaCdPseWzAAgJnsiIssIaVtHDDsjibSWcOLETqpaqBaGjuSweZcMt",
		@"WJnEHzurqwHR": @"wPwRyjJeKnAifvdntsymeSZeZwhUIutYjbSdWnsSqnygFFrasvJlYygmukJfZwEXARWilOeVzJOngtVOdhfPSvxJsaXjXVBvHbeICdcfXoSyZbQAGNeCKFQmSAjlKGMnZoUytzBlIdsE",
		@"irOsVxupwwQQsQwc": @"XfxvKTQGSKpaSzZoRmrEiZUQMCBheYdljBGZuugRHCoazHLjdQXNJjOefvfgOMMvvjgFcOddRvTYNkkpTJMXfhaPoOnoFdolPvtbGRiqYbdUkwdYeMYXpYugG",
		@"jvRHyYcZnp": @"oUBeYVDDzGaKyHAMvPcvRKKKLFDtJlantywuyyurGbXvDXGuCUSGvgLKSFTwKAuuIZveJMFvAfiWrsMFeiWLakDYIqXefNwGqYHCqBvhnRqdiCaCotbhcOsatiyhU",
		@"kZcTvaAsqcIfuYjHPtN": @"mBcTfXGNxAkifDQBtOyiEGemJpzCJjfbNsgaBwyqGjbbmfziTtPGzVdxsXqwQqJWXMaupSUyrowoUecFQvJREDqBNApfiinzYCGzHpDYbewKJm",
		@"OvbmvKqtbULu": @"wqHuzOXNkoglxOlaKmUYCdxalqiWOqUTFvpIXaQJYZAHyPejxCvHZMUHELdcfryokcvXgYAorXxBSQifVrfnOOSGLFYHabsgzzwlsdcVyggHUJYGnWMVVtVvl",
		@"hpcLCsIgnaRxLB": @"TmxXLrSRJIBSTdHUOsBgvPpmZYdspWaBNZDzjnpwHZSNjDkeMwXcgrBITBUYbnAxBOiCUQNvizqANmSoMRpEYPMZBBDCQhVQmlINjWjuwqaCfqjzlqYlRhaRSudJKnAynxlp",
	};
	return iOmzfKngmrrGLLXzIuO;
}

+ (nonnull NSData *)eDTkIJqDIKy :(nonnull NSDictionary *)OwnwGPRhfbPkkHgV {
	NSData *QmRJAhiosj = [@"uMAtlRjHGVdYybpjSZZUAnIhoqxYHjGlmYPOofqewVCcMktjeLLUsxJIRENRADEOOEibWwkvrjRZbbfZSAbJqFieeogWbutfBNLdnSNKdAaAaQiACWAUqzqGHriOBIomiKFRCdekRjvLQCXpsn" dataUsingEncoding:NSUTF8StringEncoding];
	return QmRJAhiosj;
}

+ (nonnull UIImage *)TYzULFGGddlBbEa :(nonnull NSDictionary *)tSGHQNWxxw {
	NSData *IGRvZbvJeNRBHmsNG = [@"oPaShNQYlRACfimnKfhxIEYPyoHKGvzRscdqpjheMQqoNoYpKwSXYZcMpRwxpjkfDQwwRHHtXVWvzIUvVVzVeHzceaPOFotHgfdOpV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aGRExcsxIzGFVqbdZCg = [UIImage imageWithData:IGRvZbvJeNRBHmsNG];
	aGRExcsxIzGFVqbdZCg = [UIImage imageNamed:@"oqAIgkUJEMZsWHclyJmfFhjreXACKXicJEfnAcxdKmlvHALagmsvmmiAIpoXGpyZPPFtvoSvxQxLIEwrsMrfNWTpXvqBzUuvlBSTAYSNIOJtjIccQRwOlizfLgjoLXsNURwVnuUjUwpF"];
	return aGRExcsxIzGFVqbdZCg;
}

+ (nonnull NSDictionary *)hWjmlFHqcfOhRPaCv :(nonnull NSArray *)iTRmjAzgHpOe :(nonnull UIImage *)SfXkvXdOCyCORYPt {
	NSDictionary *KxKzwrcGosnJ = @{
		@"lmGlrPJDPIZE": @"yvbcPBUrOPRpZNtfEmCHioraoecnprbSysqoukSeRvpniwsMXeJuKKkdILAWAiBCmDqeBqYqCJRfHWjLKeaHBMrhxZpMovlJQxTffaTFIrySdOalgokTZfHCqdgCgBs",
		@"lBbhfeNaRgdxE": @"nteppGhUXReEuwCbODlDUaZZlYHfMIYAzsvmxvRImxOuhueXfPEarIiwHmYXhkHryTTFwXARFEfMkuwVTkKygCTgNnyUcmCetaRiAHKmkzke",
		@"utPueboIdMNuTe": @"pdIsYaTCnPTOAMgEyzEOfXGbKyjMhzakRVFoTxRoVWWwHJmTLeVjacdsiXsIFzhmRdbrhdFlnfaOLHKNbKZJWVRYzPpwbsZVbVLmKpPEdCkWHvBYZIrQPtkUcDwGFbtU",
		@"reRZkIZAQet": @"jKKnceTLRKblgxzzISlPHApYixvSlNGEwqqzdunZCtJgKwExLaZxsgTOLdEDSldbNrQABnsYkDVKyWzkFlgADiQtOzJPjlNuLiNl",
		@"tWpDAMsMDOC": @"izddqHNWUbTCufgNWmKpyJgYhJCpTfsCiarnxhOZgbJjagQlRyVhqdWrxtMJlCIwEXcLIGuCirZitVpStirtZSdGVvjRTQHfYZNDtlkvKHPDUKil",
		@"dwgOuMtaONUrUacMFX": @"TprKqenGZdxhfBMuRTzTkvuAeFDYuVxepqfTSdpQCWLHEtRcdCvoHqZmOlItBWqUYgekngbIFTebemvdsdvVwkofxfdgXoVhhpXVJLSNgesRzXYDavtgPHsrPnVlaJHpZVcLAkVOpTenNTvV",
		@"DVfLpLUmUao": @"lCiQdNfPVUVQxOVUDdWWgomZDSIuxHsRLzAqpjQISrfWVpsZqQkaGRNzlTSdkFdkMtTsiCbCnvPaoWInGRHkAZjuXcsRBIGBQScXWhSZxgnyjvIlUVKDjfClRWqjNmtFTOvF",
		@"ZJSiMlUoQd": @"lGDSqDgXKANZZAXMLpcBLFefhKLKYRAOzgQMMYojJxrohSfNGoluAncpAnIjgEMqoCRmLqZpoQbZKgPMrKnbQZAngujvFeRXThZVzKVDBOBwoqLZKiutDXYfczPWVtcUGYkUDklOyPSlFiddQYPQy",
		@"tJIBbiwDpFHZUhZOq": @"hvdtOhCIDAhoRPIujtqEcnpstfvzcjWMlOMzwHfdbQIbusDhYzLyIivmlKCPnnFUlNAnTMvLSxJhTxEfoUDFgOKDivlpGTwpGOthYCbkgxxKluekJDdXtKuNYsFPItuy",
		@"dRZuKGuxEvgTtOwn": @"koUxzBFzGTYQqhmBvGronUDcZvudXrSwyLOAwJfouvugKbrwzDKsFtgTzowcWUwdlGATvzDXIGRtJixPixXFmBpcXGlvMGzHeZmfPIqxHejtsL",
		@"eArDZNOPbpduQ": @"jESpHldNfhFUKoWfVboekIZDCkDMrSenoFEObkNokaRgFpyDjDxcyYrREhZcjRURbzqFFJdYJVPUCcWcNJzWhFBiMJSuUIFiZBzBCvFhYQVTOawYYfKwRuCZcdlZXOqCYhFsMEGwFuszuC",
		@"BuijoegpEZquTV": @"eajkHKlLOgmWTKnRNflQCusMQyrPuQfRAUArObsutUmdUmrdVoxlbxesVcBuJqZiBVDGofbBLbJCZqcnMjkQOFUwBKpOaxZeTIxEdL",
	};
	return KxKzwrcGosnJ;
}

- (nonnull NSDictionary *)NjSHinZbSzaSNa :(nonnull NSData *)LGrymTwXXOzLjLnLnX :(nonnull NSString *)dKGMdBClEipLd :(nonnull NSDictionary *)HZarDTzasaiTijcCxf {
	NSDictionary *XJCUIYluRULO = @{
		@"anplrXIBUginuZDB": @"GGDRjqavynSWleMTzVpUnlmNzwAZgAOZlBdbZWfxeGAXwhjCLeZpzrZIGEZMXJcPZBVRIWrdAFldjczNwPLccVPtBNmQrhixPQLOBqrheQY",
		@"YTAakeJvVeidxSE": @"MXIRWEsEXAjkHPLbHyKFlZDbGigLSusVksdbyxmzmCwjobvvsaWqzzBHfoNJCeShCyULddKCQjRZjiTRNZjRUmMkyZSAklapzmKkAT",
		@"tbKLcjwefgjeNJ": @"LWFBfbxyLuMRCmXgHMPDDtDfZmrsEKmUKmUNhMaUTpFovmlqAneluseHwxsWVIrsKihCFRUApFZlvnRgFTjjgVFbyhoygPPoHRvtqwxwfSclqdCiLeIEwZRZBmzWkPCqFDfXRMoWmHnIZ",
		@"nWEOSAUwSGLJgS": @"umetnCSEdDJrpwLwMdkWtXjFttYcTeMyPmnRflFNVeesBUPplTmsDBtYJpMGGbVdBivvhBgsBwMxbVFKSchcxDuDnRZazYCCszoudpbDHrWFchOETPObCMkbzoxHlKlHJHXGa",
		@"JUDlIZOVcgYYzokU": @"dFgHKgCPUHruSshsoaPXIuyOzoGoGOtjRIDwUGvqDpqGRIIjeylHuXQXeYtLNEfsXsZZrmrPVEBcCLzmUFunFZYvzEOAWujYdJbPgpasfBrDOnymw",
		@"IadGPffVuPhrKXK": @"vHyXXhHRiPInfWVcZCcZeRrTjqNYqqbUGnloCsHujHHHvnEeiXRktonTizEMkmhlMPqpnvjUQrAvheQqudwgGDITyrWPIcXyVgATNhndfhrdjLkrTmyTwObdSOjirSEaorkOVnYezgUxIb",
		@"tGrUOxqkhBkRZMBMA": @"wPbsMhJvTjDJOktHXWqjXfVmHerdhOGTwYDjCdkSNNChsiMqOwqtEaFTHstSDGBzuGoirnYXzivrHZEnUDDVGUqQrYvKjSuILSKVeaqffIJDILaCoYhVeBlZqqHRZHHPOgGpOSatrHrTACSz",
		@"xiKUDmkfSnTXltKHW": @"jfmnlcPDRNmJlkJPHWLZecCdmpbNemRBXPWwTXprDplsoNZYnDoUYWhIuuFfzpapJbBOxldjJWjOmalCsnLGZLApVgjIkYWQleFYoAcyVmYzjgeAblOkkf",
		@"yDARjDCdNgXOE": @"YJSkpCXuXtXQfLIeCjztlKNeXCzsNtXJskOclwAJnEmtChFzKnrOfvAQscfDhxGxlPbLzGpnXGXmBemuhlBpwZOfIrBdOxSxJxOf",
		@"IleChdScLwNptsiCd": @"vAysKHiUbrEgKZvoBCJbRkDbqbnZLcmANlegtFAfuVrUgomBxwkGFCNXDBQZbiJYIWZWuiFeWKAtlHpwSEpydIdtpkRLpRWrdhWgAOYBOmxhrytuNsSJjZutHAnzRTZBkrLYPVnRXrizGndb",
		@"siDWpjMbvYlWrnethY": @"MwEdjoGBmkCDYVRbQJGjSKdEXAOQkMvUJDKHIXflRIJyqJIOfwcQviDKmfdeEalbquIZDAGBZWbTjLlRSGLeDltFEqUMjxzKUjzOnHyLvpGdmIuLR",
	};
	return XJCUIYluRULO;
}

- (nonnull NSString *)bNCVEyTUaKQyVGxRTA :(nonnull UIImage *)RyQLtvTfZNeJCNmG :(nonnull NSData *)cRNKRCnEXJxxbMhLPK :(nonnull NSArray *)BAewxNVGGpAa {
	NSString *AdrizpUqPhAi = @"XpltdlbrLitgoyrNlsCeeagncLRgwxWQcNgNCiLbudIiwnsmhOeZfsqeaCPeoHkYHOPWVqVPPEVivCGLtFqRvKNHUFXyJKFNOnmOISuc";
	return AdrizpUqPhAi;
}

+ (nonnull NSDictionary *)USZHejODBKG :(nonnull NSString *)hDPunsAnrBOsyxV {
	NSDictionary *GQDwLEhqXkaSd = @{
		@"pUvOPDPNNyoisEiDYL": @"ZakvBXjfXLHEVOXCtazXUsUKlAPdZoEQpZNaZFQNqwHhkDQYxkTNabnJBuHZOekTcBnNapzTFBoieYjgDVTACbUhKFtqNxUowhqAQKFiAumUAzX",
		@"kyLPVvHfyXFh": @"LQumWexciFeLsjusruDwkvMMjwWBdWecLLKptbCNnMPbPACEejRsIBFBgImNFhsejAYwHdWghluVowKFTjAwklkGQXisoeJhFoYlMlRKLpOeCHIQUeokdqNoVUArAoZaYMQqfkhzrgCqbyhbqerzk",
		@"KoCVBGMhFxVtgUadgLS": @"JMfmCALSLOSjRNsckHZNMmPhkzIsWJBEdRrSfHsinipHpXVhmsQFWWLOjEYuIuGFBVhxExQSkgCXpmnqnpCEysloPNhstGuWtCHFAfHNzDZAQvdinBLwnHJ",
		@"aFGqriZHLTwNB": @"CXjYXXaeHaORdbvPHOIqeAKAqmBcTFCPEwMAJKpkJaduzlHSYBXHWyFfnJQxVKsoOCvTpTqdCEigdfdtidWcHAlXhRuNLxtZYUKggskYRYIqWpQtkV",
		@"XQDLtfZvFE": @"OnTrXbZhJYjOraTxXjXUixkypjmxNYVbuJvmaIMosqCKRsKFsQLyTcBEESfPJOSuhmvNFhuGATvDUteoyvZPBldouJsAOKEdJRCQWQTToRfsWcOGCPwNHsyCMhLEUJT",
		@"MwwqbRhfDcGqwyO": @"pRLCosOudAyhWwYPfmjWmSgFNddtJADKkeGXgpbQPBJlYweWxOQmhXetpZGtXXzParWbBmqMhdfyoLvwcZUTCuLbLfREHCuFFIplqqpGVxSGZbjZSsqJaU",
		@"QdITOfSrnsU": @"apdhAtGGeSLqdZLOhyopfgVijFCuaKzKXppTzYgoIKBVtNGPiFKaLxRYUFAjkMZKdVDlMcXpYTQbbJBGpcWqQnwAAgMmZNoelNKcpVBtccgFq",
		@"JNMzQOJxXTDNImi": @"yhfZhXbFSaECaPVtJugNXnwoPfyGlPatWjfzhWCsuCBdONoHqcsPTBRjZuvQVyJojDJcZEvXOMTYiASbnxHhCshAYZrxLKGUMmCtJfAWOpqnSUyqEOTnDU",
		@"prLkQHjxUWEQg": @"dyGZGjARnSxHcwpBptDEzLgvoGBajlVqjYYcrFySYONIRfLpcQREazEOOmcVczgWAzSFiKKsZmRWhZuKFMTsxPEEYdJguBBQIiIMsLsYnAWooRGsEEgjeAYIozCP",
		@"fFgdbnXQDBgFnvW": @"gUkvkcjGLEcNuMvvJWJurPhsvVwvFlHZciohfzPeYSYnHkezaOcZKArekAbrwDiETrLkwdZzsHXhRtjHwsUdSGMiWwjYXfKCGWojXsiyfJlKfmcLnMDlpkRrVEVvi",
	};
	return GQDwLEhqXkaSd;
}

- (nonnull NSDictionary *)PTqyMhoMiEIc :(nonnull NSString *)gPgwoBkrxfNXTIhT {
	NSDictionary *brGNNVdOdRY = @{
		@"HmKHNMxUxyGyTIs": @"ZYpxqUrdTWwrlUOhUnwbPrnkwlAqxSSWuqXQedGPHZehzIpVSXErkRhXETFWDzvfqQtzizlPyBZbelxZPmrJvjXYGsIpFXJgVFwBNZZSJVQrOZKKaHgySZNjpeGtMBgntkoRdKvauDFv",
		@"KxZzqOqkIZsGIrDBpy": @"fMcechBwwoDlkxtjcAVjBwPXHvsqVZuLpaAfNhHAaoKpgYiEIirLMyLxGmFrpKMZwkrVDIYMMVLXieWEvEqQVLZIKZZzKlfRmhGIlNHNaMyMZOFbfWJFywccGcxZVhCcuNGG",
		@"NezNhWgvcyFV": @"CaqePwCwJBzFMhnHZGPsIwBrNNYdaSDeZCgIuiaUtvRBTzUJJGYLHBLEmQZMMKWlXPDmERjHtJqmQdvfROjPhtjhabaHvCtiyboLRGEKonxxevirsYviuSQvYMNSXakDXvZfrJnhdfpzxhdq",
		@"OzJggMYamT": @"vyoQIbZYLZvhcgDvgMxjTMpQpEaZFTHhVldtejYiQgeKPfzgDzzczORKKfMUBAiIHHJQYDjsIpBrDroYybwQgyNidvRSmCNWKdqXzzmVVZbCVgpb",
		@"gGtuzXQLyrC": @"ayObTkHwbuKYDrdANqCIyGKgcPYAOVYZmdXhtlkiLMryTbDaBbsOAwWAzjbJdamalKyNZZhCYZWthdZyAqsBmRBSNrYthUniEsIeOfTdAKuE",
		@"kdCyfHyYMyq": @"bHTyxVRWNmVWvmGjhJHwtXdzrEIWCWdZtUWsofSGMRLxsvZEbuvCOfGFLqCRGrdcDPemSNrmqElghCdicynSIZhjOJlroSdEaKATdfZaSESSjdrcSjaDswrWCZzRMXpb",
		@"gYBuXDgGRWNMsjj": @"GfXRRiAZeeURRUdFpYrTAzcyiNrtrFZarKfNjlszJvLjYWlzvJtNOsrTOxeKILZEYOYGxlaeFYgTXKTtMOeTyYKirOdWDPObceXvpRR",
		@"sKLAmiDMVwdB": @"NzObBiaoLSGAoIGuqXaHUesOqEWBdJYvZQeGsPWiBzAUAtHpaNQrdYXNpacEZONSxmEtpqePpsVQyBbGKqCFroDWNFtmUbTGxrqySJdbkXpVY",
		@"GvjFJUbkkqJKnWTCvh": @"BYqWuplZgabHmZtatuTDqfVQgFqWAMeXwQVavkLOYkUNXfVyZIsYYvnVxCOWKffbbAknxgSitezzCjQWoqmDvAaAChDXUqNwWjpGCaBOoVErBvNavc",
		@"ryBWripelVz": @"MnSsVAtaJSoDDpXsiEVoftqOfzkykBpAzuOvhKtRaSSnVeRgMyaSyxElyzKYdFNbkXabqOTPcmMMviuEsTnWuZgqvoCuAEitKQuDYtupstrQkP",
		@"zbKtfpDyDLf": @"thKZoBhRObOxyVdpZLZrKICxsPuUVCWwDzBMSIzVtRwinkWqqIKnAzZtfBeKElBBhqLqgxamxXxlZuFyzVcesuQfZIjcAObcjUAfzDARZDBaPBLcHxJsjEyeHqhfcDquYbokIAcjlAJeChQVvwz",
	};
	return brGNNVdOdRY;
}

- (nonnull NSArray *)lMzXHNXxizSveuOo :(nonnull NSDictionary *)nfaNGrnTkkdeXywt {
	NSArray *vUWJOtDbxajXrezzBtE = @[
		@"AozomqkkSMJFPmdUIWpAAdWFhRgBhzoguHfzIJnYlzPeILyoxxGHuMCvEoYdouGvpqKEFKWENkKSLvCZVTWWqvxvCjrvmIRWDmUGmzIRqMgs",
		@"uungcvTcsvHKtNlNLDbQmDBxJaGwnpTJJFOKFWnfImhshRfLDxdTmAGUyHCWMetyGxrojihRYzflmptAHANSEKYvBEufZLSQRlRT",
		@"UqgzuzDENCBoVNoHMZdKPEiDxxdMPneLGqDSkNIJanJnLhDKYxqoYvGjnQgAoaMuzzLfiUwCLysOCHbPKyzRYmsxKomsbbtrfGjxuxQooycxrLxyJpIdYdgqtryIWci",
		@"CYKYMSvrSGCdXkvSTYisAXIzkPWSuTWeRcQVIqRovmpkeMBpNXsaKTXqrfoTWuwBeAWgHVYQqkNnYctTbcajCuCOrVkSPPTTjSMhCIappMnnkKfvbyhzY",
		@"aETbKTpSySqKteLqzmCQpDiKxFpNDakRWxYKKwwkaVJytlUKVHVPqkyiPZIZShxBAvToIeSiPahrxaJOrJmsJwnutJVoVRxPgDwfh",
		@"ZsCHzHkkDqFqIYmbKegPZiysKnzklnOVdhUAuKqoXTTkGgOVyVUBOiJLFEpUtVjycgsWjXYcBydVbFoLmfKjPllXAzPCmlZwyeogjQlMBdQZtQgkNRJExoWeHbyqKZnBKJvrSyXLbiVVYFu",
		@"OIghdfLzhLqxQMnGgQmPHPjbdTsIjQiKWxlUcRyuYlloMxNeHXVrZaeUDmBJwvixuseGQyhISTVVOUVbPxkUExAzgBnLedUUxQqYExhwBRYXHCCxOyNjwXnHWksthcpvoaVcNxRyphoJLf",
		@"cRsiwawFHgbaqpORtKIKZzwXnTKRLpEPosmizSGxPDtqWtuadiBAtYsjOwQCUVSXtLAlQQblWyEzmAXzAUZtWjEfotBVHhVVeMdMPeXFQIxlxfashPVXjWOphT",
		@"iknmmKQBlsHblComNuTEgtwDLyNxvPWAQiOjHZezmbDlZYfJIiSFwPpVVMdYswNwHxbmFsznsXEMDhCArHdwhdKizNqwitPTgykakTfpQfWXuVeS",
		@"wAhEpPjIMdZOzpKryPQCZTaCjLYTUljfxtXuMBQOuzSBeRoeOoAkFguvEuWHeLqmmEdxtKoeyuJMiZnEvsjWNqmGxCWeMsHYVclArKGEAhtdglPCknVRoiFodIVHdmMfWmJHIC",
		@"igcPSJUkMdeQxbwjYDgybzzmEMMgLbhwRhhPMQPbjxKvECqvNGadZxKZUGSKCKOVqeIgGDupnVmSCnnCqJsjiptSLIIoCvTUyoqyDcxJjXWkMiayQvJaIELghuxbsrnbaBSrAeqWormyqK",
		@"LatNzaszSMhLbNMbOBVkvBGvdbayOYNbjbwVlfQgeZdQTCZIQyZFxDoSUoWjTcOZlIvpWlaTeuCQutEyDvjBXrOSdqeLKwEzlZcMr",
		@"KiCyRDAlRCuqNZkOJakNkJXvvcEqTPsvoOuNhnKnYbMPOrGlCFGrlxdFHtjfyTrbmYRjbFdlvGphNPADHkHqxDUOZwpeooEnAPRKYjDQIjEQuWDCcLYw",
		@"GAYTjmOuMgXdWfgijmWZUUDJXAHGWPaspVVwPiGqYUEZXyKcqPfCMNhfLCmwcYrmMEaOUcqfjwIUjFhHpWpPiCFDnHlcZAcdEBFzaPWzQOsjiMFZPMSOdbJIA",
		@"QsAgoyPmjkSKJKZSPOMOYJGJHOHywvIRQxWoytOIPyfaCBhIdZptzVovlOVEGuDuPGcCIQvaCJAFIqafyrxVZOurXpKcakMMmWGyIWZMK",
		@"ugITMDxMMoBaDkslntQWKJIlEOJaUtHEMwosVPgSQMIGBaSqMcAYOESDZYQNgtefDjXaGwwzJJdVWMtftvFMKgTeWGpHtKtOmlTMvgtqskRXALBodHVuAPBMnllhkCgJJ",
	];
	return vUWJOtDbxajXrezzBtE;
}

- (nonnull UIImage *)kaPnRmOdkYcNKBVRO :(nonnull NSDictionary *)XiwGoNTUNKZIangf {
	NSData *PTNayTgiBuEmErd = [@"PamvGYgWeNSIzCIMlSAznmsaSORtireaEcWMaCmGQuzrmTaHZMaKuYRHGYsZuYjxGwodOFEzdAwccMySTktKVmSDhrurDCdoYuIIwuraExbqxGcZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iTAkXtPRVLuYi = [UIImage imageWithData:PTNayTgiBuEmErd];
	iTAkXtPRVLuYi = [UIImage imageNamed:@"IbGuOZLqIXMlLhRyeXvZqsEfJHvNDesNWkwpgQSOZjRmhiNjKxbjvOXakIuIhVJgcepRNtvhxMCyUqoqvoqaeasmqTMstVncrsznUFDxzXemBoPGjhEdFspMovqoBqvadhT"];
	return iTAkXtPRVLuYi;
}

- (NSAttributedString *)dateStrFormStr:(NSString *)dateStr
{
    NSString *dayStr = [dateStr substringWithRange:NSMakeRange(8, 2)];
    NSString *monthStr = [dateStr substringWithRange:NSMakeRange(5, 2)];
    NSMutableAttributedString *resultStr = [[NSMutableAttributedString alloc] initWithString:dayStr attributes:@{
                                                        NSFontAttributeName:[UIFont boldSystemFontOfSize:28]}];
    [resultStr appendAttributedString:[[NSAttributedString alloc] initWithString:monthStr attributes:@{
                                                                                                       NSFontAttributeName:[UIFont boldSystemFontOfSize:15]}]];
    return resultStr;
}

@end
