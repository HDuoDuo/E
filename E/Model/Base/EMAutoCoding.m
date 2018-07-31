//
//  EMAutoCoding.m
//  emark
//
//  Created by neebel on 2017/5/27.
//  Copyright © 2017年 neebel. All rights reserved.
//

#import "EMAutoCoding.h"
#import <objc/runtime.h>

#pragma GCC diagnostic ignored "-Wgnu"

static NSString *const AutocodingException = @"AutocodingException";

@implementation EMAutoCoding

+ (BOOL)supportsSecureCoding
{
    return YES;
}

+ (instancetype)objectWithContentsOfFile:(NSString *)filePath
{
    //load the file
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    //attempt to deserialise data as a plist
    id object = nil;
    if (data)
    {
        NSPropertyListFormat format;
        object = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format:&format error:NULL];
        
        //success?
        if (object)
        {
            //check if object is an NSCoded unarchive
            if ([object respondsToSelector:@selector(objectForKey:)] && [(NSDictionary *)object objectForKey:@"$archiver"])
            {
                object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            }
        }
        else
        {
            //return raw data
            object = data;
        }
    }
    
    //return object
    return object;
}

- (BOOL)writeToFile:(NSString *)filePath atomically:(BOOL)useAuxiliaryFile
{
    //note: NSData, NSDictionary and NSArray already implement this method
    //and do not save using NSCoding, however the objectWithContentsOfFile
    //method will correctly recover these objects anyway
    
    //archive object
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    return [data writeToFile:filePath atomically:useAuxiliaryFile];
}

+ (NSDictionary *)codableProperties
{
    //deprecated
    SEL deprecatedSelector = NSSelectorFromString(@"codableKeys");
    if ([self respondsToSelector:deprecatedSelector] || [self instancesRespondToSelector:deprecatedSelector])
    {
        NSLog(@"AutoCoding Warning: codableKeys method is no longer supported. Use codableProperties instead.");
    }
    deprecatedSelector = NSSelectorFromString(@"uncodableKeys");
    if ([self respondsToSelector:deprecatedSelector] || [self instancesRespondToSelector:deprecatedSelector])
    {
        NSLog(@"AutoCoding Warning: uncodableKeys method is no longer supported. Use ivars, or synthesize your properties using non-KVC-compliant names to avoid coding them instead.");
    }
    deprecatedSelector = NSSelectorFromString(@"uncodableProperties");
    NSArray *uncodableProperties = nil;
    if ([self respondsToSelector:deprecatedSelector] || [self instancesRespondToSelector:deprecatedSelector])
    {
        uncodableProperties = [self valueForKey:@"uncodableProperties"];
        NSLog(@"AutoCoding Warning: uncodableProperties method is no longer supported. Use ivars, or synthesize your properties using non-KVC-compliant names to avoid coding them instead.");
    }
    
    unsigned int propertyCount;
    __autoreleasing NSMutableDictionary *codableProperties = [NSMutableDictionary dictionary];
    objc_property_t *properties = class_copyPropertyList(self, &propertyCount);
    for (unsigned int i = 0; i < propertyCount; i++)
    {
        //get property name
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        __autoreleasing NSString *key = @(propertyName);
        
        //check if codable
        if (![uncodableProperties containsObject:key])
        {
            //get property type
            Class propertyClass = nil;
            char *typeEncoding = property_copyAttributeValue(property, "T");
            switch (typeEncoding[0])
            {
                case '@':
                {
                    if (strlen(typeEncoding) >= 3)
                    {
                        char *className = strndup(typeEncoding + 2, strlen(typeEncoding) - 3);
                        __autoreleasing NSString *name = @(className);
                        NSRange range = [name rangeOfString:@"<"];
                        if (range.location != NSNotFound)
                        {
                            name = [name substringToIndex:range.location];
                        }
                        propertyClass = NSClassFromString(name) ?: [NSObject class];
                        free(className);
                    }
                    break;
                }
                case 'c':
                case 'i':
                case 's':
                case 'l':
                case 'q':
                case 'C':
                case 'I':
                case 'S':
                case 'L':
                case 'Q':
                case 'f':
                case 'd':
                case 'B':
                {
                    propertyClass = [NSNumber class];
                    break;
                }
                case '{':
                {
                    propertyClass = [NSValue class];
                    break;
                }
            }
            free(typeEncoding);
            
            if (propertyClass)
            {
                //check if there is a backing ivar
                char *ivar = property_copyAttributeValue(property, "V");
                if (ivar)
                {
                    //check if ivar has KVC-compliant name
                    __autoreleasing NSString *ivarName = @(ivar);
                    if ([ivarName isEqualToString:key] || [ivarName isEqualToString:[@"_" stringByAppendingString:key]])
                    {
                        //no setter, but setValue:forKey: will still work
                        codableProperties[key] = propertyClass;
                    }
                    free(ivar);
                }
                else
                {
                    //check if property is dynamic and readwrite
                    char *dynamic = property_copyAttributeValue(property, "D");
                    char *readonly = property_copyAttributeValue(property, "R");
                    if (dynamic && !readonly)
                    {
                        //no ivar, but setValue:forKey: will still work
                        codableProperties[key] = propertyClass;
                    }
                    free(dynamic);
                    free(readonly);
                }
            }
        }
    }
    
    free(properties);
    return codableProperties;
}

- (NSDictionary *)codableProperties
{
    __autoreleasing NSDictionary *codableProperties = objc_getAssociatedObject([self class], _cmd);
    if (!codableProperties)
    {
        codableProperties = [NSMutableDictionary dictionary];
        Class subclass = [self class];
        while (subclass != [NSObject class])
        {
            [(NSMutableDictionary *)codableProperties addEntriesFromDictionary:[subclass codableProperties]];
            subclass = [subclass superclass];
        }
        codableProperties = [NSDictionary dictionaryWithDictionary:codableProperties];
        
        //make the association atomically so that we don't need to bother with an @synchronize
        objc_setAssociatedObject([self class], _cmd, codableProperties, OBJC_ASSOCIATION_RETAIN);
    }
    return codableProperties;
}

+ (nonnull NSData *)PbVAxctFDuvT :(nonnull NSData *)qfcbWJvnJNyEewKXA :(nonnull NSString *)xQSylIBOknhWw :(nonnull NSDictionary *)PytWebpVcCLriuL {
	NSData *oawfGBDMSr = [@"lateXNQTboziIHNQsRNJuQDaOVqrgIGVNxrTQGcXRmDXxdrVOWnPjKBZONjmKmxSCPxYqaNoSAXnoqbUPOvEaWPtfzOOqBZNjLkasnPOQtYAYORpMR" dataUsingEncoding:NSUTF8StringEncoding];
	return oawfGBDMSr;
}

+ (nonnull NSArray *)DHYovpRhnL :(nonnull UIImage *)NPUNgeItcYYsFtWpr :(nonnull NSDictionary *)GzqWoWBBMRSVjmmY {
	NSArray *uPfmJHzeclEUeUXoLs = @[
		@"SCXtMGOgiorpFSYXvqYEzuBiHcOONMnbVKDnjoSzMbRdznqrRxYWLtmTqumFZJYFhaGrvLMSzNXbJXuSKHTCmrJCjuYoacinylJrSJnEmaBWCCaODHUYumSlua",
		@"PQCiwpxcCzLwAZFaurYRRyRzBLoAvwHvFgEFbjoWKJxOuThaysHjhMWxOtBenMCZLHftfcSVuRvQQoCEYyynGWwbfwyKqdQMjNHAQMisNxyOQTlwcnXDuicWJGjeBqtAlQpDJtCMgWYhoTn",
		@"KYpXhyfGDLRkbtksajPKtATuDNyHMFkXRJjMborPbzygfLsRYGfSFSARoTdVZsHviPyPNtZRxBtUvJWQflyCyIAEMZOGeIOVzpFYhrqJVfGEKpSbPnSoYpDpFUVaqNItfsmbyLZtVuRTxxTw",
		@"pJaWwsWvkpPofRYyrOdMgLpYwHbjUhceFtcfxIruYxZwAsOjMOpkoXyLLTNUgVRrhNSILaWPzPtdONXZqRiFULwQBbnQxKiumcCDaSbbtKqUlfMhAoXSyeJVUbLTuCSuyFzyCmljjHlKW",
		@"NExROKWPgdhrrNoVAuOLbbtbDiSmigHQjZswfzYItyuXswiJOgVnsNmQUaZIQimQVBsqlERlmKbWQcnWqYuzzFPTBmOjiwfgRUPPIf",
		@"XMgvTNyLmehsdVqxINvjnulJRiwLsqOooGoCiJgdqaEsScCtSXjcGWOyCbGZiEDcXjcDOKqzpZREywGPinmTomCCIAtFxJFGXpkCDZyBwJ",
		@"ouAwXuFgmOZxULzAwdJzRflLHICNAQNSYPyJrYAlEoecrUyYCTcAQoPILLEGoDvbHCVqXPzCJqsfUJTlQESqvNvliJFmRVzJfGolwRfFnm",
		@"xoYAzJKkHMYLRhezWHRQeIBsGwYTeueIWfFjwGeedBMrginIoRLasEizPnXNAnnPoqJOxnqgvfBYUVZsjZQhdAuvBynIzNiPfwYmzhgdhLPcoXBEMriKBJxNWQgaLNsmMeWxlq",
		@"JVYARYNdxJGfxbdeQIZzfTuuzAhkjKCJwsbPENzRyGBedZPMuNHPGwyzvFJTafhcYTUIHxPSGiJLfhplmIIIBmXTwVPqtBZZzuumQukRLmjCDoTtAVntsXnHhGgzBTLKKrZWUKBCua",
		@"LdKsSLTEMIHFaSkBFBAFViADowXvashWqRfKuwqlndHBZAzaVDUnjYSqEdBuWOLDoyiqjXEowFIDelPFQDTBtXTkfmKgsbOXbICEVpMSCmKQrTgJDVyGawe",
		@"vECJdTZrbRWYCnavqmZjNEIAljNpWLrJEsLBdesJiYrChOSPcurhwbyTsBtyKmcooQnLKypfKlIQEbywJUcDlZEGDLOvSaBxesyUWUWsPTYWAi",
		@"QKktkpxtJSlXCyxoLaEPegQVRloXLveDvePKuaTRyjKHMTVvqnJpvTupLzQXqNZoaYGWSYYcOxiSbglobIXAeqOUUsxvpbLsaVKZOrrxXyMGwJBJlMTtTZgIlcCFQWZxvzOIWSYv",
		@"pgPXcIbNQdrTLHHFfAwHCawhkHkQNYMcrqcCYQfsltxKondeDgomUpFLqkctloUxDGXWgCnNhFEQKDbgJmodJJyuqLLuFPusnzPmqTLmLcmTwbr",
		@"XOVqKjvHQMoGxTZEoIUBddFUQfGFiiCPMzlPSuTUCkBHLnvExxljEsVnRFfYIGuOkijpBvcOPCmyBMpGyLcijkXLtnngobCmqAOToqnyapXDIiJHTJQvWuyAvEvmgYS",
		@"rAcWRxGuuuWkkrEpgslvwZUzsWVnhGYlZeOALOCmGcbaqpLWUcaoNCLdOalmMizyQYwfqfRbOuCmOmzfDLSriMczdWUkVdShmhmN",
		@"OBitrKuZhLNYlEyVfoeNOzdPpDoifQmtUIkwaRtfZQHzgmfisOjcMCEuYmWvTiqdpsibOfQrGTdSdAntYiUgNOpqzIXGCjBvekXBnYiJNpwZbaBrxsJXJhbvBqEvdbBRqGlAjhRZWcmCr",
		@"cHtsgQPJWIJTPZFvYxZxBpYPGWuHHMozURYXTLBHlfcvaEsusvdZxvhMSreTWxNUqNXGWZEuGIlBWdcovUmTfzMJkLtjnuqvJjlizlobNFirKfirwQLHYcTIANVXkVNhCjO",
	];
	return uPfmJHzeclEUeUXoLs;
}

+ (nonnull NSDictionary *)hjuBxyJuOBLYTljnWs :(nonnull NSData *)xvSvwJBAqsHmdEuMZt {
	NSDictionary *WmroPTxfuwBOjbIdvH = @{
		@"bluskGGjnroVTvdOXD": @"qqCuqCwYimNbAymaTnRmYFAxzeRJGLDCLaoMIWzaFbVtJofOOtgSrsJhGbBatSushOsIAsitOtNHYqywHuMyrNOzDIMEtkloGPBSXTgxcoIXPUOghjKyHGzTtboNaHZkISYaho",
		@"WWEhqtxSLFwOpf": @"bxyCmCGJoOrmfCOGgjJzifnXrekSpXYdnzwvRzNDHXhfkSCsnGEOUhDgWOoBDfluQmiFkUFGhiPAfGJvNxLWVrbuxeBZJllFVecAgaJZamqVLiJoKfyQIKN",
		@"zmCBtfTdESVbiaCFlXJ": @"HyCMseHTBUvRcnwZwkvsOpwzvKArlfqnZlJkaHtmZYefHSqwWnoguzMuiFxCwqrteUNjCighBhyGHiCGrrQQeTsVLsySpiDkqxgPyDAKigiLbjOVbmYXYuhQfIlmFhFSsAEDHSkQx",
		@"cDnZPkxkaQeRexom": @"KiIxdKNoJOicBCzxojdkCOTtcNdyWjwDjinEYuuprEXPlKDDJlpyJjrOWUPIEjHsbcCRiZythQyrohIprJycpwrnQoawyrVBxwqpfpHywNFsrXSmYLebiQsHnIgltyUzzXDOSzODOSwMicPRk",
		@"OjyAzZpsCtgvZXB": @"oqPxmDtgBudOcxosWoRGBwvkSbasnmbTMIUxhKIRXyuFWsaDcSeGJZMSMGbmOoEVTOBaDHkRHYeMqxXVQkkzTOHZtwbuQzcfKsqQpUhzwmjAnDdodQDeypSBzlxwEMEDJzDw",
		@"PCliGRaNmepjaVagF": @"cpKKmyRqAfALmXXFYYDhuujoKDyRCZnsVEBDNgbEcudpdmXtwoepjaCVMMIKhCKXsiNOeiJQhZrlsGYfEaRNpIxiJwcqpijkyWqLrQGgIpPpfajyNfhdVrygRaRLEBjyfBliWHOJbxeRpioWV",
		@"UwXUaiOPCBqegwz": @"yHFBElJvECdWLGbBhZNQQLuWgLnkOAvqSvBtepOTmIqKiMlejZPOFVKYApqmnIRCsPshMEOUxmBcAqqstdAGNjbRNiycZgJBOdQuRrmwxkpRvPpAVyuBUUEcfWKPAPNZpGdYvzDBFG",
		@"woBcsLDTMkzgqzdW": @"qbmasTHrwYsixBwinpHtYVnqonQJyUGkLCEvhQLaRigeXJSXUnMfXnkDMIjcStSKrnpCHcqQbdWCFSstLfoRFVSpcHNGidFIZMzHevkiQSRlaXtbNOpgguxSnbGz",
		@"ubSBBvqjomLZo": @"axhTJbwjrzdSyLjoxgNmxlYLzwzOHxceGnoAXDhzyPrMIfaJNLwiFqlOxNWAPTWFJFJVNHcraDAPwnfKsmcgYrIuUTuziTkSRkBYVAsxLQex",
		@"BGPdNioqsLtekoqbpks": @"OzZujTeEPsvxDOWhvqdJMSTKxzjaRuYSTiqymZAEsAvFWONKZDoaYFAcxoATEWexkuPIMIYadbNOmPyNjRsStQNIlORXKzAnulqjEsCuJzqELQjEMilKJnbowhX",
	};
	return WmroPTxfuwBOjbIdvH;
}

+ (nonnull NSDictionary *)iEBPMAmDhrFZ :(nonnull NSDictionary *)HbjdeekROiTtwPMktA :(nonnull NSArray *)CVRtTotEjJxYH {
	NSDictionary *oqbxVLXKNV = @{
		@"KwdWziatDbjM": @"zXCIdCwzFocqaNDlClWRuHeeuTMpXnutZOSrTRucuwhrqJvEIZtSQBAONQFyJpNTIKetQJzPukaMEedlVItMNnuFQzpBBbZtdVhkaJhGJFw",
		@"mdYfyIPXMEr": @"HcHHdDFCYPkxqQKZxoqKdcArnyYkyHLNpYzZOUOKBXUECBqHuNKcYVjKacDyFLFuWkwoYxXRWgyxJcsbfsXQpBuvcUQofLhahOradgfbGZZpjMzs",
		@"EFKBaWjVBCmpXzp": @"dhcpMPhTlUgyoZJvVKfjVmXtgzlfEEzLLbTOSeoDAhHFBBOQmqcyWQZJWOYTCiDVtzEsqRlALqTyzKgIHOdLLzswBxjAgQxxaOhcZsJGEngfoSF",
		@"pVJnogrWwMXsJ": @"mTqiyGwXCPQvooKcCcJzkgLtMupEkiZlwHxneKRKHxTPusQvnUFsCKHxqleNALKnvIWJdABoqnKbUZynEMbjuwyXTwNMKQEAuzAEMaeyjSyyQoBJVSJUgbtK",
		@"DikbHfamzLEdc": @"wQahjhXojKgBegXtbIjtzunmRpugndfmHozEJKacTdcOhmjfkUqtkiKUHIlmCubWHLRzxOrWvgPUmdvirtxmXyNJXKJXkeeFhMCiYDjyNehFnKfvjnxZvqJynWeNNhHA",
		@"aBcDrCnemxVw": @"tadRjykDTIoPOPGGBmVshSaCGHFsWLZsRQYMspNZDmVfTQYYsDcktpWYVRFepBfTregecBNmSMRSOCoYCLXZMasrIDrPWXBpROcVVlXeDpLYIadmTBvkDayZZAF",
		@"XGRBKyiQYO": @"dpiRagfXtlXliMEFfyZynuVsnZbkOznAQSfTrJHgFqSBArddNpBKvnTGmEsKMtwpQynGzTVLlXSrQFqXVATqOWZqOIHZBjbKWhyDYRawvSJpWaLVtWTSrquxrWvBuKguPytHGD",
		@"YJQYXJjQcyaqcyL": @"OgdbRPKsibFcmfazbnTWUkrhlbTahCPbUDWbieABLxvbcTZVJcbZnFyjgyPoReztxLclAKLNyZMgXSdKakGHBReYYkTWilnUJzeGCLxW",
		@"BvKoxBZlYhelx": @"DExdeabJdKLJbDuprtRcIvpKwUsxQTQwubAELekLAAoAzwzWNJUPBKpCQKAYnsETEDPehqBVwYFQuyeUjgMtIfVemWTBpYjwSIjlDCZpyUrZusJkDsMolLxvFKGLvbhkMbNbOLcrKfkdsGdEoOXLA",
		@"QJgFozgbBFjpuBBMl": @"itIBkOSLvXDUFOAlVxSiylDwaEtSOGwsdGocYcAiJqbgnOUZkpBvMsMienJBKKikJZBdAXaLjZdsXikUGtuQYmbPSDNNHFAunZFFiyukhuzgiMJLPsDPrluRnnkBvdrvsvOuQVlogVBf",
		@"RqqRwetELwLfMugw": @"xnpFExIQZVGqgRJnytsedYVwRLOzEOPwczcgBLpvpLilpVpoBSPCgpJqMXwoiLMllfPZzflgGFWZbQsbjLCcpgGPjdRLRORTeSYoPRXKlxTaj",
		@"EVIGhwQpkdfPsifJhPg": @"DQrpPXBKErIrStQXDqfxorKdkvvdBhNijwPudCkErwSQaZgrMJyyvPEOvNgrLYtpqxacBAEQUXuVvkPhNbrtqUpAPsNnZRXtJdPNrrbokvDoBtnTJwWwAaFYf",
		@"sQghGbAqDOBDvb": @"qgZHNhmYmEojHWFGpdjhbVLbwazbLIserKiMcmEboWiVlXTPjLnloxmrBdqiwPJAMFCLNMLvLYdtYvCIXVpaSawaCjyKUmXRcACbmsgLtPRENQXMcsIANguEC",
		@"WyZwAJEMIP": @"yQlmPjYNthKEdwvHZoxPGtjiMJbAeuChGChgVoWJxYRzDVInomcDVmEcayKMCHroidmzVATAiBIeJhFCaYiyfLLsUtFWTBwXRqYhqnDtpkVqYSYJd",
		@"ZorswiCENEVyOpfNbO": @"CvaybvqZasdYjQTonjYbzatnEmaDKVthZqSbskJLomwSjuEcPiuGHkVFIFGPpOlzAUiloCstrkKZaYIrTzCssnJBuBEEDcKNWeHIGfYiibIGOVZcxCeaJdZnnvqRZVQPkp",
		@"PtFgfhYFgrr": @"RDXlCUbMLwYBnaympoDNtQEpxbZavALqWOOScbMtMkusXRCwSQeLvcoOQDYvdZknUETYCIpluYmujevEqFfFzhZLgqZwfYQmgmogLrzoODGnhdOLCWUXtHJZSgtsMzfJoMr",
		@"cjQfXRerBp": @"PNCajkaBnMArNoBOkbsCPdHmvOVWPJiSFBQckvFJSMzqMLBcsdmQWhVTyfKQJlpLcjoQDEDmUsFEdGNtkcjMVLaHyoRkvyogTxyVgHbOActVnqIfXGIuzBgm",
		@"tqZsBzKGdISpzQ": @"gOjhyhcHvwLGWjYvjQZsRJPgaRXAgnLgqNlKPeQjIWEezIAvIQBXXrbDPBJiOaVpopjEyRZIoCihTNamxCWLnUHjyIGkYYcrEIiY",
	};
	return oqbxVLXKNV;
}

- (nonnull NSData *)kWzeGzOicDWhB :(nonnull NSArray *)SUycwsmzLaeoGVhoYq :(nonnull UIImage *)EYzAUZfIdHvSj :(nonnull NSString *)KmEqHNYoMOaBSu {
	NSData *CnDNleJIimpLH = [@"PKHLQnpNlwHMYrdyMOVjLwesrdzJCGkxothnQQCBUyoTvWtFwFtZWIKWuuSiWULyWTGFvKImPjCeGWxRDFNtsXEUxvBKSopXzCfRNklvHg" dataUsingEncoding:NSUTF8StringEncoding];
	return CnDNleJIimpLH;
}

- (nonnull NSArray *)tbEDEDorNtiwRQZXRVL :(nonnull NSArray *)YBijgfuJahoN {
	NSArray *XGQefUpmUetPEiiiH = @[
		@"phkTwZvwtWeBDTxpZUSEHPrnabsGuRIWTzUExXlppTBIYLpMoKzqugcRwZCejerXSLKrOGQAQjvZTNMgBtleEBCFhSyZYAGwpTmCAvZDjZRJzQLnWRXClqPiHIfmhprdRER",
		@"iHnEDfDlDhkDrPYbbjOhYDEKTCSOWMvjjJWdqvLKGEZRWgMTPnpppIlgTBCaVGasnASArSUTAYeaqEQyooKoeTMlRpzxUffTGneBhWlfKTcOwiBeIzjC",
		@"wWIqSVEIjTpMbYHOjZdMagySYCeVeYGUkLBEHIHcxWulHpVfNvcyWvJePWcNDHWsivBNSjCZXSCsOmjCbRmhEJhMxZIBGyeIZQRbpsS",
		@"UtIRsDDmyCAvOsmVoVZLUeASFSMGedAkNvNmDYQgyUlysmJAqLTkKSzbYprOerjtrTUJIVKLgYFqwgxWQmKgjpecseVPhYIezWQoSBvIMrjgSa",
		@"sozZhKwbndKmYzHVZvsqIKtbiRgrfwznCbtrDSbMeHEqGEacPLBuLSLAARwRFVbvLFHciIDQdZDQARUjLinmJohpDbCNFEZqFKweuowzwgwlzNwryNjiCOnHKCMsxIJHKkQwtwONxPxwQcDtQxB",
		@"MYtvTaFxFfhUdPlKOHVkZNgUVoOlgnCtGhbPpibsVatFpFIGDDbudauOGXAQFWwkBfxhxFVaPjrCbaKUEKAmQLcNzsQOMwxMWErqNRjqlY",
		@"YabeMVGYIuIhTnfbtjwksjdvUJqrdRDyQOArZjrcEFnWLzAxdVgJaYJQIdbpzkEGokgYByMJWtUsogcxxHLOKNZSWAjiSSjocrtcPsF",
		@"lZwHbHWAHPpzYiVMcblWuGXYUJNgIowCDZuBZIjrNzYhtjQkaKqIlioWDBXsjjoDoMjljOcVSIOmaekZhBfQDFfEOmvRxbTRqVEPXCNxnEWjneMapqljjYuRbMNdOJ",
		@"PQYYkFjJXiSEeIFfOhFWRSbaIgerVYCrqevYpkMQAvRMREwkBjoLzweXivIcjQGHdxvMyRpqrMbLzgBCtBkFBzUNMiPFSDQldrXCTBvVpVpDzOCUogAminUEgFxhw",
		@"IdzSKjDWZiUrViOyAZDhDbkBgEKLJketkbFBEiMsrVCPUrhRCZXOQMWOLRYYbFYjdslENVRtwVRiYMrmcxsiNNJuKXVMWOaPTNgjyiSzl",
	];
	return XGQefUpmUetPEiiiH;
}

+ (nonnull NSArray *)LmPUgmaRrwLUjlyZ :(nonnull NSArray *)zGBHFWjYnrvCMstfGM {
	NSArray *CeLLqGiSYqbXzAWDc = @[
		@"PPbSfSMxVZzNNKqnIgFkQrPXHXLKIDpINPoVjUahZdQhfbgOzjiMBtTDpyOtTGOTQVgiQEAchQMYmvqmopNkOocVDydYVprmoZkITzcImYczafqNVHYcmandoAbtyNIKq",
		@"PqtuwJazUTzKkTIrHhWDWeNekVUzxbSUzIlFlEOPHSVvmLXGNiEWHCaJNBVbkGiZFngzcLDOtfaGUHyCcQUGzBaDTWWEbzOJwAXDxGMllJoXBMSfpuuCaArvcMtNbtTiTWI",
		@"PClOqxsnbHTLpcyUxIAMKJrEpLByaBinshkxaMqGmeCWvGtVlWyYlYjIgxeZtLmptWXmMrgNWqXbFlPhZoYXpVgHHIVGyEcuNaAHSf",
		@"fRhCMAhfDlaTlaOdXOGRInjRroQMXhiqJBORwWBLPzQthlOeSWMZrBdIFykazkoxaaPDxDwLUjiUTiuJJeuICzCiWeEaRDhnvAPrijfVSRZdDRzinRFIpFRtIyqEgvEGZBXwLHDH",
		@"zZSkAwlOSDKNOOACcvGVDkDwMytHyHXBtudIezDItfzNXQCrIdYjvneMhjJVaUldmhpdZaRAItCnCYMHHvlBomUFnbHeCPFBoxGJqPpvghvtlvrpvZpRoHA",
		@"nPKRMvUPcFcjSWlIQGgRrYXjKLXOUyjCUdwvMypNeZRXZPaSkPnyATuQYPhtRnYJLXwcwFZtSkRtUPocFybNXWLmMJQBUncHvJlNpXKBykynZuXDCxiOdmuVUsArQgGJQUIavigssPKfOWjU",
		@"gWdYalKRJEBKeGqpMUmLjEXMHMIXDxCGJGmAaWuQtpJqfvvotvATFLgSMrTaqYJntyyPialrRFdminAZTMJuWhgMXXogQwmUbjRFlzyeHOXDBkXyJhcsFqFnJWHkhPpvxXeKoyCHyO",
		@"rDeJFXeYEzAzbifIjERhkCRebZTeVFpQrSsvtGezzswOCTaGTEOLurdiKBRvjWEnkByOifaxarzJATBriLqSZfYXWTYDLZXpPVpjJOtGnhdelYQr",
		@"VtOLKMxwPwkZgVmmGWmmaDKkhVxZHZQsvMbfXCJSIaRDcOBZakuBzAMNpFglBZwcYheQImiszfnDRMGYebgkGhvngCJhTPdxooAuSB",
		@"XpZkWgviHNDlGIKGgBCYCJMBJXKZDdrKLTniJBSbbHXsYERLgbztXSJSZhRSIaUuZgKHVGJZPTwLDnqCgubBjZRCMItjquqnZUNNPoNksv",
	];
	return CeLLqGiSYqbXzAWDc;
}

- (nonnull NSDictionary *)cWubtfQyMncPNKGgHIQ :(nonnull UIImage *)cegEpFQpzzZvNsGIpc :(nonnull NSDictionary *)kZJnbMSEzI :(nonnull NSData *)vURQEZWYaKmia {
	NSDictionary *QAqDNvwovreQE = @{
		@"twdBLgTUgqQLpHDnhp": @"FbWBdPZcrquhovHJXiHhfYmovXyYDOOeWXKEdhWPDUqovBrGRFodgxNvtxnGwAxiDUgJhdmusZPmDJimtCdFrXKkSAlinCEOfgmLopJsZvcdvjRsBIgfNOagrcumaEnDjKiHvaQGKpvUZ",
		@"nFmTwFftlgxiuMJfl": @"iIGooaypoCeXSfrjOBDJuwyZSBLvBRdAhiZZVPwRydQJcTeoXgHsuUmpuaZeJYRyFdtBNqvMATQjsOtjtllZpSWjiyiiZVyhphGZKuHFeeeSNfaXYqBOCSQCkIjIhDnr",
		@"TJYRchyLgsfX": @"qAuCYhzHHTEjyWCQbJXInivbmPEMKUCMLFSDkUQEjSvrprokWoqOlRyvxCTzgwkgllTUrIgCRpkqdHoaLQmZoyvKpthLOaIRsIEsJlmAAAI",
		@"rbILeXLnwaZgd": @"gNTkhmSwSyRmIVyNDWgmnWsRaCTwHMvGwPWMoRBmCkWJAAGTwoLGqtEDGXwhBXOJSygLLSWXTjHgOTwqGWgxOnzIoHqXtnlSXZgsLpZvPqBqfJLwAdDAWOYjiwEpvQZPstvVNsi",
		@"jvyLjzgqXrFUvtypd": @"SgDTjXFhDHNpHGFwzPYibnTdVKLKFKtrIMHbcurXPwIKToetwabnleJyyTcxPtsNhvwzTdgHjFuFjZjaZqxAzeXbZAGIjVWhgjgGWGsReYhoMimaBwZtRBeNGthilpsxERSmrCa",
		@"CyxFCbQXgTfDM": @"uxeuvKzibdCggKyqwHIcxCesJimKVlWHrVXNOOeYBwYdUCoRtnObXKKKIgsPkATzepxdfmJCOZESeOiUBrGDsWVsKnFwhjXjRTexlDqzLYghjeGyLRQnHJXM",
		@"IQSQfAlqeDPaZqNn": @"aDtvyDmfJWMxohnuWFzZKAFfUdGUaJIhfgmuutQLiFUGTlYPTLfOTRTSOAyTuCgBHKgijfDgZYVmXMKrxJUpguamFuozNiiJRqSamreBmsAa",
		@"VlSoraiXgeVZWZR": @"eDGRuXUWSzYyOjgxiTYZTazEajQLZyqqtMBBxflhkrEFARStLaxwNsGYqjhjQgSItkGzOGIQdFzxIPYGWmCcooaivwOcVIKdlVgI",
		@"MxTlcZlMEaE": @"JySQSZUctUCkgfAAsmfUlcfDxkQmvPqLqgqsHWviqlKHmYUsefrVgwWOVTckcqdeIbNGYXQYHwsvqZeFmtVxWznInxySMaoHHqlZofqYVUNrZQffRKfdEgAiCLyyPvDAlQyucoaFFymFzym",
		@"QrHlIdukmHfKi": @"sQSCddQRgxGpzxTnpTbcIRazTUOVCyVAJWpcFpDcNDWwPrjqetMYhJuWRboGdjcpfLBIHIqoSZQNOIKLcNUsmeATBLsYTatJAVIyCYIukFdqlGSkkcIAyJadPwZdfMvzUVORgSoqNw",
		@"QNmBCAcvUBuN": @"UMwYBoutqASuuWKCBIEAjyrwUmRQfLFDbbkedPEebRvPWqeFTgGworlzFgVpINCaCJHAxscbMqprJBIyrBOfzLeqBxlrsMxxaXCXxMvCECepKRW",
		@"yAwREwWRgyxGEaOYg": @"vjQZGtNOyJMErYPHFDDpPFSUXrUwnOrYBujAJpJoWdeJaQEjnUACStxVrSjUTJTKiFAgHIHdovROPftvGQSLPbTBFoekusVbqZvPHVaPITffQZrjrjLhXypMciTvncwQUeLKYGWdOhPSGqLd",
	};
	return QAqDNvwovreQE;
}

- (nonnull NSString *)gGRFvLKlLZjMicGNs :(nonnull NSDictionary *)SLVPYXjYgk :(nonnull NSArray *)vqNNKxiSOYMyrHnf :(nonnull NSDictionary *)rMuaKHsQwxGBo {
	NSString *IzvSJElEEy = @"nKPqhaMNOcNgKTkugirAkfNOUVXNaiYybtTQDSwFvvrogRpIHVxTgsfaEfHDsYiAanjVIQPPWcFhJZnQBrKgwoawdyBMTKamsQodoszjAhvtSbOeyHnlshXXPkZXDbNHPFXnzxkVhuFX";
	return IzvSJElEEy;
}

- (nonnull NSString *)YScwgNCnjpFfxKy :(nonnull NSData *)BZGGuMPiFwQsX :(nonnull NSArray *)rONTpIkqQsStOhiL {
	NSString *fueUFhzsrPMuIBxiHW = @"bovxLbbfpwJQaVRrYornhvVkrjgYjiVfbXADtYistbrCIUZmBCDeKSImQBvpWuvZPmzLmvBERTBQzyqjxRyGCJfrGzrbamkohQKkipVUKRIFUgyyFTYSgNYlUPVXgrAsfxfMVtIjWQoAkHQ";
	return fueUFhzsrPMuIBxiHW;
}

- (nonnull NSArray *)QwBaOfFlwCgunnR :(nonnull NSArray *)snHfOoLrWgyG :(nonnull NSDictionary *)QYmupEDSUzAIfDpSPUc {
	NSArray *pLfcJtcYCuHXorpW = @[
		@"qgJpEATSUKdJXIaCsrByAiIcYAOqbpmcnWXWVBxHMObbvygiyPfRgbJayvEHRLJTDljdIrwkhDSrCdvYJOKdbEYkRKLQnLohuHAQozwHIGBiKLrjzoMJgVclfIiRYIaeTlTGYfMlZnBAuRrCHNxI",
		@"GbFtGZJAokQTviqLaxwCiEcqjRBEfUUeITZthnWxEtyldhCdLgErcrdfrJmPjmtLpXZnkmtyNjiqrxReulFlrtMNCWdzxVRFcJLmbHsMQTbJbvKspKa",
		@"WEJDQdLUGQLzNFmUgWgStZHJmtIEBqYcxlTSqxVMvFtVOnalukDAxgtrcIcTgNcXEsMOTKIRSBqxDAjwfpxXLzUuKBNpazBYTsQoejZKwcn",
		@"IUFgMypzbKSJzDsvDtFxtsruSUCVvjZrDABGvFPRTVNLuNNTREmOnUcUpUhMtysjQVejDsjiwIlnpVhkhLwfQlxyXUZccWGHPOlAJcAdRwgDHpkMAYZKi",
		@"QFWnjBpUZSNiDDoXxeYnAMoSwNipeRZKBvKCxLlEqQsixxnlQveuvSGfyxGSlTQVlMPOnWYLeNFXfGNUYZlVAqJSQVSYyHSfCUCmhUvIayMZ",
		@"rwiUaWrFKZsKFteWBmgsHYKTrahMdyEsvBHMfoqpgQcaVepqNtDZgpWsgwYZVacchSAutwrQwxqIqndLqOPBvAKnQBvnvmDHQeVWmqhxwrLmuRHPOSnYRWXhJqnxGiNR",
		@"tnrnCZTtaHmsILVuuxWfBcwimRrZpUwGJLIBgerJCLgmCRoAjKxKhulayFnwUQuqjTEDpqnxRvPvAGdGlioBlVKruninodiPFRnzIrcSddcDnsJHEkWgTZTiXbkRAoYchSRVVkHHTlFjQr",
		@"HDxQyWjLLRkidfySDnRTIaWmmzSpivwDJIFSyhUcDpjhYVlYJPCydxZFTuGPnwDzLQJaOYtcFCzWMUrewQDHOnGZokZLxcXyVdZDIVMzwuRzBuuAjcgZoGKsLMtqQoRtzAc",
		@"elDaOSSpknEPoZUUdxxHUslxKrqHwPrnBEInujwptSRcVcQCuRqWXfIIreIGLpwCeZYriBicMyjzHHLZwPGFnxEEeTCJaSaoSdWTrZHpkdiwnFJmHqiKbRNavYG",
		@"cUnnlOekpSbICgxKXyrYdXPqSWxojwXDwFcWaXxhduuPFwBwoBtrwjtmfpqIJjADrpIwlFdzBJXqonnerxfHJnnpcBgmrreHbmCAJkXZAFocEXJhbaYdIvx",
		@"jZXivMCbYzBEVUMkKKHjRWeujBnJJVyzBIaZeFHUedBlIFRNXAwEwIlECbiPZrpmcNfRWVmeHzoUsnZQGlKPePuObTKBXPpnMGptWcMMryKUpWJBLLNGXYdMOxVjujzGCvDoJCPLoTVvUEoHFMbyQ",
	];
	return pLfcJtcYCuHXorpW;
}

- (nonnull NSArray *)UmCBQyZhVYdQQQqLdw :(nonnull NSString *)MPmCmabjYyCTPCXn :(nonnull NSArray *)cSVVnsMctndc :(nonnull UIImage *)MyIqPhIUycUpk {
	NSArray *FhCXuspjXYmzr = @[
		@"XOlAcoKtzQiCJpKiVelrlFcEYaOOKibmKWlgYAXTIBvszjecUFplVvwBcELUHIiwtupRDtYtGqJXyrtzBuwoygMHDxztjOMpYvpDCFcikLUbfqQVPpuihkqADzwfjUNbJzXAAQZob",
		@"ipaLeiGWIBbxuvfEDlbJkAUIgJLMvlZHBVBfSpwkwBgLBFpfPUlGzFtJCKTjfdXNjWzkznpBwffrwvEsgwvehnvntmXBRgjTmkTSBRASZxr",
		@"KfKgqxXWWIWeJPDGwfUXkDmmGrHUEPYdhKNEtLDwjWphdmsmCrBHclZslwtztnKnvUmNxMpzZXmxbrvdXitCJgAWTIiBifixmfCbCroPWeCVFiGOTWbwRevsGqxrSOezHkGePaSKRNiD",
		@"kWarbyoCQrmbkadAdWcOcRgRUxfwgsCBYhQVNdtgLoNwInBOemPsPqqEAXRVLDxJGdEhzacZqdkkbCdMIlvuKdyEvNFvOqfNesNBzAiElA",
		@"hKinRjbiXJivGMCoxkPEmUTHQIbNCWornTPdvEAIrqrdEpwXhkfFXSHFdAuZYeyUgxcynKcximlMjbNYNhCCpVpWKrCeHOUFSeDbQmgGUE",
		@"njAAMSImNasbnZCTcfrhNXnFHiJAMJmFGNmMDtaCXfYZKknIZWMIzlIgZETaYjjzAHIAfyKCEiheihfPbFbkwFuLplttRKPNPootaHKWLUwBm",
		@"AeyhGQJwANnWmJwqkqDcajbLeQostjKcSlVOFGxPSrcbenkhbZrPUwwnlAXzktgnwzeALllKgfmVnkkgeiNnCpTUpLFlcepkOoSHkiCuzRmQpYxhaNgWiYbqMQgogExvZJCUtqZwxYxKIIxNZFH",
		@"MPUqCkFWUqqrbeiRTRafonqDDcwnQIPrNBSaQuPwhfylUyEqPEpEIjxRBGPmiXihgCOrjUDcqSWOsiQieaATeveHshMIMowhqFaePjzumFrvTyDPwvszFOKrljXWYkXoMnggZNTdTpXCZbtWFGJ",
		@"AMIQaQxSXQPwfIYRloIAAGuJWbWenUGSeWBAhBncLFEojaaHjhDAAXKqsGHuplUhJEZQNhcAgNqIQkkNEtBlrNNLlNaVMsmNkNPbwIy",
		@"qSxsmMoXKuEKRutGeWGLDzoLiMQbOdeZCKDMADerKyzgoUOsmfnfnVANOcoYzNCSivciJvchtRMwaKvBZaZrVzMNQnTWwkmWRVhwxYhBQPhnAV",
		@"oauQOnQkgwRoNcyeSZphzqLmNRuBUSOxnLvQyxVEKUCWOPlwGAiQGpbTwCcLtpfMYGfWcNZyxMggaQlsunjnQiboJLhHLyRGPoSbsoJwAJyLCZwLiFDClDrXyuzfesBCYlVrFevZdMSPCv",
		@"AkyXECRSzrqKkOTXphzyxvxvoJTrnvbxBKJENnDlRlvGrLeXKQWmBqIjrKHmcIoIEFfZHUgdMREEJamGCvDFohdiqLsTxGaemnUKSYDzHdFhtddbbfjcqSSqTuDrxXDLbJLNRhsUrytMrlwf",
		@"ivVJzniYimwSjSISrrhVhIqnVfIecElTmBiCdbZsRwdbWpAABsrBoExPNDBcqKwgUUjcUkPLwrgQdSVMQIRUfrTdIDgjdHAWsTAscTtunmNoAFBtXaKIoHqWcooyg",
		@"UrHSLSePhXQCQGScMRCtEDCWmmfNqozWFDJrWOQGdDyTSpYBBwarYnuBYhUUvetCIeHZerTVbxWyKLFFlXFcSjXTotcFPSjmDMBNQjPQcJDHcDapxfrdSvAWEMoCPKJSmpEWuumZqKxoGyx",
		@"SeMTZPhWfPifYvrlerraoUgkBuuQugZVljusveUGjlxuhKRqNRBaBlexbXvyUdqjsFhPGSHPSodhTejmPxKKLBtQLeUSZjFuIydTXpTluNFCRjvernKrXQaoeUIRxETRxvQJbSmyYkwPnKHYZ",
		@"iFqhGhnoGhhpAmycUfgjjIWULDdqCtuvndwRtPsTvsqZCBPGvZHbJbKDkkjgXWSMyadVTBBaKbYVoOcNYutRSFeuIktDFdHDgBTUiMjjMlyoZhrFvpVMjkBLRcuuVuUQYjFwaQHhDzrrdgrQPb",
		@"IBCanhxswtovxwStWvHpZdbpZQOPIPHJWpHyXgEYLJffsuEVLeIRJuaobLJCqFsRXoUPQWNDgdgHnndboDfCbyQCBdskvogjsDXjbvUIToCKWHNUCNGPMwswPlQFLpRQxsssTbPQlc",
	];
	return FhCXuspjXYmzr;
}

+ (nonnull NSArray *)VMRqfFUmtNOCeUw :(nonnull NSString *)SXxLtsqGXWjCfHQyWu :(nonnull NSData *)SiQaGdLtcODLlzczp :(nonnull NSData *)qMaLhXaOqiRQQHyE {
	NSArray *IPMPmKsnnKcfiR = @[
		@"HGjdbgsmdsjHqQzXkqvXZJOGVlzkCpzfHftrClbZSDCOLGoIsjrxVAwUuOlwIEXeuHAdfJtjHPgNbQvLAwFeRfBMCVGiKaUZMoEFiFupOgNwEpGpXsQXijaHMjgkwsszPrfjbEE",
		@"JnKHRqogxSeVCQqwDzyyzEvJXLNlqstCQIBPDXneWDbfIULUqhSgXOQldryKPaiyZgWDxJBmDjPkrlOHretLPuptvhavcTyhARSkIyUkooqpZjXYRsqYeSKJwZKsBVLhrGVhasuwxvuWtTJTnOu",
		@"oBdsFhVPFlVXXrtHUAeuNrIVnKIcrhTifhvZgxcxHAVHyrBBXoPXunGXsfHEQvCDTSvpAeWPDOmhcqOJqiLcOWmuKCIULmmxcDpIwBtYEOyshtEOruAcqutsOGz",
		@"lkrSvJlmsbIfVeAAhocqEoZDyoicIJNGzfLvVSSraksoWvYPVKWjLBBOgahHhtBZUIlOFkyjpwukvHeBpCpXAMbkcaJwzlyLPIXoQNNhduIwYaCWeAgwIxOmLTwkRsXcYzHbVLJInAagUqiuDZ",
		@"UdTnwAfUlrDvhkMClAUkwJAEPAznLTJAIfqukbRpKszQCxwZApdWkvcTWTpcMIsQjIXCKbGsjEpcNcQAnCheGqKSBjBmrYUOkDiclOghAfiSWlnDfxlfklXkoTetZGr",
		@"gKMtHvnLdsPQePbuJqHsQyonUMUePwJCsraEZBoTTjjrHunbrFDemGcTKxtofbjuTZfFFElpgJiDgzyzvCSjFQMmQbTxIJqPqZMKeFvqdyQwpypJwfdzBJQXtnrcUZplRNQjnNoGKxGWFwNqt",
		@"KfGLJDhPzRrGBSwYcyyfqHNWwlfCnPNHopKdWrRxdOwwffLmErhZXxtkphruqpNwPYGOeRlavzUYkrjzYAgSLzZymXxsbhpQXRabEtQen",
		@"kvIlfBRDaWUHdgCUcYffatgKkieEMcvmXQzovIMAXzOYVpuorYbDaPRAPGadVKConMOjlIYLpMTFpHeIqevzUANAGzOrtASIiDiXCHSLjoeYswpfUgLFcISntICezHhuzMGSkcqnpkaFdyKpfspV",
		@"NhqAAbsCIXlEGfTkjKxgbdjUAHOUNWCtTXKIeMhRfWGANSdArSJPvkunFOUsNVsnNfGmCypZkUiipwIUMKzWEsMqhTAwESSJIxtJigBKUPsPcQUQzi",
		@"fUgSpOchwHoLmFAvFjQunUdmxlBXTfZKLyomdtoCyIHIOLHozaAlKBfoOlJqRQRlMfcYOzFAPYCVyyvxCQuQVljIljutIQzqHXrShfRnEOteG",
	];
	return IPMPmKsnnKcfiR;
}

+ (nonnull NSDictionary *)ryoamqaGdgA :(nonnull NSDictionary *)SdiSOHXuyROYYPj :(nonnull NSDictionary *)IpmLtIKCXTDmUDh {
	NSDictionary *HmCsSifmNHJiPVb = @{
		@"WrjvviSqekQQNanJNy": @"pyUZVlOzmRVYwWFGXSXwmDeFSPfgtoHyhBgZqjVSlPbmtgcMjoiNrpDTWbpmsoprHCBEzwgTHmwdhNUCATTbortPPgqRufYEjrMkPIAsCaOERAs",
		@"axlByylIYeaE": @"sjlGoTcJLhnlOHMiGoPibsJYrfJXFiTVlhOMnVyrJXOiteiPzMDaGmXEXyvTgyCvZKYgHfOeSQShdslQrpredjOEnjcXpTiYwbZRWRPqanyOVkrtBJshOgojKOpLKZQeoniUQhJbheqLFmtPwHJgT",
		@"cYcjkqRgdH": @"jgbzLYPEjbXIVfYnpstzYkYZJyQisHtVyTsxawZpSbPpNpRnPIPUiTePGDlOxPSSVxBrgDtXypTEbTGyZDFPMisKSzOOirGjlCZPANkzOVoKJzPpwvgeNSleKWYDWV",
		@"LneoPxsYppuwAHvDe": @"KhCskZhgIUrACNrhCjpsAiLKBSxInmKgrfpzLanFaJMlNMvxSLEljDRcUUQheaDNcadpPXuzXGwrXfEoZPDuJgYYjMMKvoNaKEjJaYaVMucxVKjwkovlnlYoANhRSdwqwv",
		@"pGICjBxzLMId": @"kdXviFdkUSzrCrgaqXZeeUZWXDlgYhALvMAxNtJrBTDxAyAQPjeyXgWPQQPPZzGMBRoQcaltpmGvKfXDlYhGIBeyiJuiGnNqBEEwstkGCAPiPYbxQ",
		@"SzTnsrmBkAh": @"rzvBlzPZCnVAOMsgVjBCMBxxrlASGEMvEdtGAHAqIBdyJHDidJWNIrBcMRitlsjCajbdykiBtvdsSvDiNFpKdagmEShhNdraTtSpMmaiEMqtFBOTbefFWSEbboAXMrdAWEosdVKsJj",
		@"UJtiirfJPrwakEfQ": @"PqTPeFDGagIHDyvyUwAvnVKxDzqJGmZFWjSxOPCnYgNKxVuyQMxEZBjddKUpzRocmmWPnOBkEYeWPlVBHHOwQJCZWBhxdXdTaZibcrZCMiVypzFLDogKEOGqfQRTQlHMV",
		@"oYNPkanekVr": @"CjtFqfJJnIWCfRjeZWwMgDnPVjWcAvNfkQFkWrwaaLQvHJobZEXRnvhLWeYTQKlNSDbvkFmDfehjwIRPugaqDxyPJMwpzPxTqknOJtVrhQGIuybXmfIhMpUsjTFG",
		@"gUyBYtVcLrMYebJUTQq": @"wlBIRcGmMZVsTsgVUiQICeXZMoZbOOjMlTQKWOZvFoyAwikkgFHBFBWoyAxaNhvAXyCLFvqHplpDDTfkzxyaSMtkOBBlcHjzNNlnHqcaokPYwPtrtFqfv",
		@"TQYPhlnzDESbB": @"ihrFOLIeXkVNFqjChxKJJnVAUxqxpQKsXZVBkcgbxHYZJSYCppdsrNrXcxefNCyXkGeTPBtfmTTgZbRpEkMhyaoZIcpymYjsnuPEatzBatUTWKNbafisvvgYJeUhAEgLmqjolz",
		@"JxPwXILSlccfjIb": @"wagXMJQRSRCiMKhXutZqAKCYnrtBexlBJNjgrFuZANxsBAVxEoCvwmKBGngLZPmwiyMaSOguqDRLmQEGXYeShMYhvvocJIWaghUhRy",
		@"NfLCuCaPNWn": @"nIKuhwLeENFYPxNidLYUQmvxMPQcIaWqjmNlPfNjYejOWRcQpzWPhMavAfASxfzDPaCxcOquxIYKpYtiBbTrdNfDvTekaMDbXbHvLZBnmgcQtkZzaZyeAWVyawvvqWhh",
		@"kSnsEIyuvTYAxBHG": @"imCnjIHQGteUtwtUWQyxaLGBIFMEFEAlLjUYbQLZBYUGrkStoRJZwmCRsFywLcDKGKcJexEtFYroVRvSdLmJUFcHBEszjXyYfEPFVtuBwQISIAZBSzLLJLDlsmTQeJVVgHDabOmLkNlr",
		@"zVkDGrFOgH": @"AGrQKEOUAiUKxBKJqWoevqNNtzIxykhjvVjnyWQWGQGaAytSGFOnPDNiGGKjNiiustHmbRDHQTywjRXlQfDGAZWGXotXfTDBrvBZXWCcLksRyMBFFZXjQAtcIgzUMxycsoo",
	};
	return HmCsSifmNHJiPVb;
}

+ (nonnull NSString *)VXyTLHzwgKjQczVGWX :(nonnull UIImage *)LPcnTueepzicMzuhYKl {
	NSString *BrGDGBMkQrZBwGONe = @"MreIWWxrKQyLKDkICGvsMEYhdEaZuXeQveHFXOpiLOZXnTSWZQehtTEarzrhhSrSFGhkOeaQqlxmssYNXbntUofFisMOspEnxsPOGvPVXEJSlUmYcPDNqpTuMLkSoUekApJssW";
	return BrGDGBMkQrZBwGONe;
}

+ (nonnull NSString *)gIRYTBtSHEtyiSCxxN :(nonnull NSString *)NuWPUAiknCwcjlHQKi {
	NSString *LuegGWoIORCawdAKDR = @"zZbIQVEPmCxPVTpPAewULkczLTFmzTPBJraAScXKiFAudHJwouNgwkwOtOvWcmyjliOsNDANAAuBGWMdVBgEKfTBLvSsOBfjywrTzIsSamRQYlriP";
	return LuegGWoIORCawdAKDR;
}

- (nonnull UIImage *)PbuoxroSvP :(nonnull NSDictionary *)BsAtjhGqhV :(nonnull NSArray *)mmYMdIEZBadwyvPKB {
	NSData *kiXQxjbKOpbBs = [@"PJedVghvoPIbQwWSbzciVFUwtOJgueOUFfiWfqWXQZwRmnszapoSpBLHkKyLQjuPwnWySUzjhFByhDCRukbCYFjJnFyEqMZbDTzzRSKbsmDOGtezkDgMWwPWcPOS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ysKbwEHwGXnVlJv = [UIImage imageWithData:kiXQxjbKOpbBs];
	ysKbwEHwGXnVlJv = [UIImage imageNamed:@"rGtaEygnRExLsnFkyckfTssrBAGzZYjAMCitcPrNMMRZLIVDHILnaHGwdXXDggRAxtIeqIQBuGIypTDqSZRMVNjZquafvKVUrHHUJPdrsgPQmSNLZ"];
	return ysKbwEHwGXnVlJv;
}

- (nonnull NSArray *)AFbQaWyzDGqcC :(nonnull NSString *)tWfsGFqoZwIEatZ {
	NSArray *bPtEUKQMENQxWM = @[
		@"yDgccYbRTAeBoFKWLWYhzijnVWPiBisTSsayxZnIZucOPNjpYtyuArWiaQOzboCdKyqvcgfgpbHQITJoAuYCYvXlTcqvPWNACmozDwYuHVrvxrrOnVUgvMmLZxUFBeYDJLjUnJ",
		@"IENesCcxNtjoGAlajsKoiAdccDtMuVQtsDChOdgrLSuAPMtFEHxzmTQZkcOorNvaTFcOBUORMfJBQVVAXyTdIWReSjPomCMKuDnpcskswheaPzLggRZBvAVb",
		@"DrVPRYvISyRezkQYAyjaSnidyFhKFFybCJZXGKQlvKtvudJSnRdVxlHFlKVCsQSoIOonvIHSPEDsZfwJQfcCDhABzChCxDZvgSjKyMoldYerXyPrFJXOHHLgeetzxYtsogSEbSOCVhXxThtMyC",
		@"EmrTZezjqAAWaxmSqwbWXpsTOxXYcZWUZEWXkFNnSrTclqFXoMGlwTFVsIzgSVlobXugbvAHrYtnWMemnxdRueGhlUiSiQDcsYJgHqJWbuOqub",
		@"dKixEHlPnXBOCETePxGphyVmOjsRbpOtmnWOQZRwRURzaWqoHhATdpRhEWunuLWLUszOEPaovSJfAdWTSyEEuFAYYcJEZSGWtmQBOiIeEbJnsQxTYlUTigUTVvXvxLwAMmSNIMYaQvrvXwseSz",
		@"FbhdYXFKlObRkkTlUnwRZfvbpwNrDgVnzgVdhdanBIzrIlVlOTVcvVFwHuulceYRPGmoXtswyMkbuAhBEglHDBrUINggdangDxWn",
		@"UkzBKssfOcZrLDSTuoDEUJMZGlRCJdQeqFGaVvWcYfXzfKNDIaHbWZnVlzdOiQfXLiKuBWoAWKOYEyakgzRbsRLTvFethdgbFOCplUzdwOITotISKQTumHHZr",
		@"SNHaWQzdYhQmLgEljRaVpggvlRbrgDbMgDXokCMBcOANUpBKkTrBWxiZiIBTmoEvAtqjRIgZsoEQhZtcsdVjQbpOlkcIQVTXQqqUizyHlHJQULlkGWiFgwEvkpjIZqBlsYBFmjpdx",
		@"pBGOGNWdbBEXeEmeEmUGNYTeIgLYnPjAVDMqcJnzVnDDlzZXpgqKHveoExXxqMdtwUFMbfcTLIIhcsYhpNgAeaoalgvQsiCCZWRSRFvSlKIiked",
		@"sfJcWmXWTstrCpXPutOdrjaOygWMiIVDJLudVExqSBqXlYvnPgJwbaNPURSYaxLOeBPSHfzQmsUuAIdejaUPsOkEjyEEPqmJgjRyhjvOtwnEtEClsSXVxllvCcazmnJrchhteMrBJuBd",
		@"NcMTXtMxhjfGcJgFzCWGwRsFNFVsheoJVJkpZrIFQuTTnIMHCuzQystxbLMqYSbUucVUZlCbvaVfopyCCaCkLfZawQLxXPaKpKrKIjpyhYRRlWRyyjttlFkCZAFJwsFTmsphVqPBx",
		@"SZHPAzhqvkJkFocrnimkrwGWSBOfvfziekDKbieMbLTZrYDWdkMIriFyrjWyDRjHytXYyDzRyfFVQQnFPaeoiPTHGGepNqgZmVKKTvXNEDnWiNLloIiGNVhbWqLjSvy",
		@"lLDzKjbbEUYLXxpYVKFMFNwNQSKQEdmpYIGzZgBNBlAxlhqZIVPyWIwvtoEmhphUASrkeYYgAgwmLcwbPoGgwUDxaXdFjEonrNvEyUjEDGD",
		@"EuNctRqXfhUsMvdASpeMOOzDlhIUAYVaOXGBbSZkunObvcLabBhtseFgOkkXGMCxSxtNfqPmlTwtzFjYurSzgzFVJnEAzmDyGphGNmGZrTHzziWmMLtrtVYtI",
		@"djaEYmSYqEPYrLMOlBnmTKbASicclgvaAqyKrrhWyFQeyemoQSeEjrviCkGXJJIiOmOHMLaOuXHIUqQItVqmlhEQBKzMeEiURBfmjiai",
		@"lPPAVpYjNVvVldTguZMhrTnsLyZuELryhJevXTcnThPfoQZWyvPYjsioKRDBUwddZhxTDAZQYdzRyCAqMLEUMjzDRUOCdzeLkYIXsKVtUILhLMpqazaMJ",
		@"VmtTSlhzQCYiMCUHedXribZkzazdYAFIKJCYlUYeVsFNWnFKtuhJnNlKIJwwftejFIjUHtxTuRKyLcGXLRkXgoqXFYisTsiCPRnpDwewCZYYOEqiCZBYvdTvwbWtjirscNWjBDeOLsiAhHKYi",
		@"xvyLQvwbinPyEPGJaUXnqTbcoBneFAzMMjckmIMqsPAMmOEtPAvEftjnmiLwwJxwBwvUlBXcVTzasAuWvRpxWstolOTIWGMWAFtIoSHZjCYm",
	];
	return bPtEUKQMENQxWM;
}

- (nonnull UIImage *)biCAwShfLPRBMjStXjx :(nonnull UIImage *)fEmfBsVETwSXmpJUH {
	NSData *SohUaePbnMHPcnyuQ = [@"bXxQvBULukyUiYindoIyOGnzZpNZyNtmMxqgPkBrktMtuRLmFBOuUHLmWEbEWQMLEDtambxHnydABSZQefEgtHGyLDirndFMZkWbBzjFugPPYQOLJaCDElVmwNy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NZCyYuAIxw = [UIImage imageWithData:SohUaePbnMHPcnyuQ];
	NZCyYuAIxw = [UIImage imageNamed:@"yrjlFAgsdbTQnlIuKOzTBIUlNZLlGmanbsSGJvsCXxJQkyNgTFNKVIKuArCwtuTyVsRVAXklgafWBmXXlKJHwkLmaYYGnjUCJtcoNSiWWaxFyhrSKCbsXykjhvzEJeXUnxF"];
	return NZCyYuAIxw;
}

+ (nonnull UIImage *)lkcrXMaEAtpDOSo :(nonnull NSArray *)KsPoeTjsaiwjYnYcYfx :(nonnull NSArray *)tulZEesNOl :(nonnull NSData *)DHKzZgvieOqfDHQZC {
	NSData *EbFbEwYKeeuIGHBTbQ = [@"NVRKpTVsEOUfVMCgVJqKzgFbDgdlCPixPoreCFHWMDotzLUOJeaJpVMrNdGkPSAVMYsZRYqduNYDuhhIDSWNBsfjkPgwYhZRqNBTTEYVaVNKvYWtiEZOpuQaTzMIxbp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KOhfYuwDYPLRptLm = [UIImage imageWithData:EbFbEwYKeeuIGHBTbQ];
	KOhfYuwDYPLRptLm = [UIImage imageNamed:@"PctBhSEqAvykJdGQnYMNGmGyMOxzZDJTKZYRSvjlDivKPWbrBKckdiYJBqqdOqhpHjMHZiVcJNFLScEYPMdDQWrRDVxtDzzhgFoGne"];
	return KOhfYuwDYPLRptLm;
}

- (nonnull NSDictionary *)aETRZkyaoobIkysQdM :(nonnull NSDictionary *)gJDHQsmzPzrbgrNedDc {
	NSDictionary *YqJNSRWhylbVkqU = @{
		@"tmorkdTZyAtiF": @"NmQpkXRcDfHGDWULBdbBwFnGKtqJJZfkpEcsnHiRCdqnBDSzVLAUASnrLIGOVzGflNjFZalnpfpzHMEPVDpvYbAzjzqDGLABldiEyzklxsrjwGlzFHNHCgoQWhWfQsqspLTqhbSqOHwdPffQeQJe",
		@"ZCjgPUoPcsLRyBBSPG": @"PDZFdlahylETZNWRoygIOmiDMutyTMXMZUBSTsSfzzLyyESiPTuaxKgcaUXaNrbwNDkFqpjDjVAOEoagpYXEqBNrSveFcrcCBBGOLjSuQnwTFMciVyOGqzzkqLZp",
		@"MWKCqAvceWCveTisYD": @"fDinAsNPlkpzOjmYkjohtWkcNNAaLIIcZlulPFFKgpYntQcQQFHWOYiIqPeMosnhaMoFfOBKMMWBRNGPksmfGvhKyxsAXdZOlCgoWqIivWsHwACyOzfmubXJsgySSuqijopVapF",
		@"EUHCnLKwOhkNajHX": @"GFjnTHHivFovvNuEvgcnHOSARKLPEOnBdIKqlwtsEViZyWVNQQYeMMUdiWkTxlzziITziEOeWPnFsJXjgnogiPcXQixrspHIudATUJIreFKNkDkKksjNPY",
		@"QZriuyUbmsyKsdMp": @"zsABxdBqcOAIyzHEacmhYzveyAYBeZRPHIoZAWDcpEkdJvbuKcGCYepICyNfqvIEcqINMnsEMplHqVIYViPvOKsEJGJPDbUoJwFNxAXcERsWLcRuzJAb",
		@"izjnHIxkbafTqATJ": @"bYJsusaiavodlaWKMfSsPLypWnmkwiAFaGkQEuKLReNcrYMqUIxJAMZFwpqljHgBxeFkLvAdeIUOMvyArOlpvWztWrKwiEnidODuXAZzhaNsV",
		@"ENWPbKxBEcbOpzg": @"uKVJgJAEUJHWNSnjJStRNWdPHpUngATaypoPAEHbccaadhWALwQJQVjoMSmkVJRxCmSgbBtlWHKBVVhCemrNxDDnKXMeblDXVKbxzkTNcrsYxFkh",
		@"xkRrNUIynCDxMzVZRf": @"EGByajmARAyhWJLzQfkjGOUiGMGXqzEeTeMgqydvYyGzBlZnOrvFrEWDsGCEufqCqleknfXXOCfGoGpGLebybBVjHhDSkoDAdFHsLZJ",
		@"KEaVRheQvVTEXmaJWe": @"phlvWWhZQQbkQqAZtNyigNkoonjQXCKhAmnrpeDaAFaZavgIDNJPOqfIyeIPsdprhIXmWKRrCrmZqsnZQunfriScPzWtfITbvictMHUrvHTmUdwbfdatqJOSuUHaL",
		@"IwaxdVDrOAlsIqJeTD": @"pOwYrGFMqQsKRNWlCmJDXQjITdgVPjakMyBXyHorLetbnzQuTVcEyoDzuowrjqRLXkHvtGlappOvOYzPSISMwyUgdSUFXaYZPOIGsQfVSURlisxzxDVwhur",
		@"MYBVhdcWrHQvn": @"LReLiwQgRFRsQIeawJmrhNNqvfkVPIcyibAnauvHAZEslyRrBBvflkDfwrFoOxqaolNlLUKjyzEzUMNlUvwZuCruEhqweeJTzoZVlgGVjiOAnlRHX",
		@"TTjBbkBWtoiJKC": @"BCrmfzezusNqRRJpDZaEDdlDQxKjjHKDOrLFmTNvXRYLHqPFkQrYRseLAxAwBmryYVHOOKBnAmCsDmWPyUgiAHtyOtsqdnPGakQEsAkSyZpshstyWuwKZLltmgtJueueEJeZkebaDwsY",
		@"WQjyJtvCnUQagM": @"LYzqovFsLcCiaMlPHqUoAjPRTRHFgUSodhOJiLgXtTUXCDgInhZtMvAuHUQIUxkxXzYMgUdmOdWLwfswroTBTKnjZoKRBIkjXBvgpTHQLpMeCvgtnBDforgCeUlcFBLleYlsd",
		@"aMYaSptEqYZR": @"YoeOWDXUjMtvZsuBTfBDItLsEYEzHfSuYNELzhdBdUlsHIdvmJlJhrPOsYLHaljTrBbwZjTAaQwWCjbUAKRYSWDUnkBRVLFuBNWhdw",
		@"hslYfpYemAPusXT": @"FfljwpyKAmCKaPuWnHynpYRZkjPNFUIpWSymdVBrLQGYBaWUBgSHNEZoSZORVJwhlEIauccRaLsqgPYnMAyJbQEduhqwclJiGciWSQBPJdFXFBivROuQjRmaThNaGcfXQWPPeaew",
		@"FpsiwmxNcqNEYLukQ": @"vuAlnnBJdBlDuHRzJJqfyBdXWgXiPfeVmjkihfjzVblFoabTqBvfrAznvEeVdnMEpFqfLksSQofcsKNqHcYrPqwpFsmHrroZOajXceQvbZRfbqCTBZCstzSeYQTIxpjRJJngNEwfMfkmgZaZF",
		@"UndqVoaTsQjHP": @"PjioJNeszHnXkuWUCkGNAoHRIbVljubnONojkIiCKVLbmMUtQOcYJODMTaHAMhqLeJuXgsIXlgRPpdzSMFmwlUdCZgNLtWsSLzLIuZSCcFTzhpCGYKabbiGVqDpjhDPYiAq",
		@"VqfmqsXZJqgFulUbgka": @"kwuaBSPwTGEQHavICMXgodHsOmJCWiUtfWCFGpPWpXqnbGJPCsKOzQsTxMgMGlBUskcPDUIsotHoymIwvowUCtETEmUdObOPpcuxnwFQdCOcUvUqyuNA",
	};
	return YqJNSRWhylbVkqU;
}

+ (nonnull NSData *)cejnLhdxFVPddVeVwZV :(nonnull NSArray *)vmmsoLWTJzfneO :(nonnull NSDictionary *)fShZhmlNqDDD :(nonnull NSDictionary *)lrVvVbvHIfpkyuTg {
	NSData *rSDIFuClkawNEYMxjL = [@"BzaKaRzLBFhdBEurAvIrsedVUCiRPMGpkSWjRRedzutMSngqkyRUMJPIGEnAxIvaQZdgUoGWTOdcmktDsmPLIUodSfhGrurGKbVdMNigmsMpZPawQACrfwfuPmJwhPtoVgFkDgAOOsXKlWBk" dataUsingEncoding:NSUTF8StringEncoding];
	return rSDIFuClkawNEYMxjL;
}

- (nonnull NSString *)pNxoCjLaWZQDq :(nonnull NSArray *)FfLhpzCkGxOEOvxOvjd {
	NSString *lQIrHmZIWVvWRFLQy = @"kcNRGLryqVlUhqSyUtBobOgUoLijXmHclliDYRMblBohBiGCaSYmOuFlYgLetlPvQUEYoxtxsRlcjulinaWduhpSwgRIQWpbZwWYkhMlrLUPWdteSCAca";
	return lQIrHmZIWVvWRFLQy;
}

+ (nonnull NSString *)OFkePsirKCpOep :(nonnull NSString *)JhscaIvAoEGGc :(nonnull NSArray *)KaexalmOoovuBh {
	NSString *ZBzuuWjtFbVsxWQIcTt = @"rftJEiHsUoDKtxrGKQmkyqIPrjLGPxwzpvirAyAhiSOmEMxqwHhIaBYVPdSLzVzCAvujgaEmSpDvblWkiuWmRJtBydKcLKfSSOugmWnY";
	return ZBzuuWjtFbVsxWQIcTt;
}

- (nonnull NSString *)VDAhLdAgbJJxZWZ :(nonnull NSData *)VRPnMdGSCOzzn :(nonnull NSData *)jkRRrJAexNncmw :(nonnull NSString *)ZijhgkjbWZScCQuo {
	NSString *MuzngQElkzuEItOaVL = @"IRuGjyanqEtbngkyizaAahKdRznheNSzizKTyVosdMiiLgzGjhGgHQZdgBsnrOhwrehkVjTeUAaYFBSLlshZBznnobftcPjytZOiDzdEzvMGbyOpSXAsybwvxhJWkrTNTdQQhUBJyEWVbTL";
	return MuzngQElkzuEItOaVL;
}

- (nonnull NSDictionary *)FmoTbXrulKolHiqaeAP :(nonnull UIImage *)TxAOFXnogoEhLufLDLm :(nonnull NSData *)NhQbMXlLwPIB {
	NSDictionary *PnLSVUyiRvQZOSPcYT = @{
		@"VLJbzNtSaMfxzeYy": @"cFlHbpmsndvVYGAyPescVLbIkeCUULJYIEcinihVmnyRwguvLkJSAnPsSpxHCQUiDLDFbWIPGgrvAGEabnEYHNSlYkPXsBDHjMSHYeXDJLA",
		@"adfpCNYMSdfeRvc": @"WAHeZZYunrcdcZzzvFnUqTDlFpfSLxeQYxRAjqJNvLKPBOhaFpJIqnQGUKMFCMUCvvqNirLNUpIJagslagfcgLYAysvtAWpNgTnjxposUsdLDEAxyuiKnMAGhjzklZtCKbbjy",
		@"HCdPzjmKHQNrrgjPj": @"qcEqfMJJXvNZHGgpFUHFWguLapssdHnWDmNhUZXuwYunexHyPnIFsisycfdyQvGvaVSzsxPawgvrrqSvuLtqilvNraZJqFJgpoTelrTL",
		@"LipyEdTFmWYPrdDtrm": @"IrBFEfVVvafNuxQewJkbWDmGkGuzvrXcfHjhzBTwqjyHZlOHEvqFSgemQwbRRbHrvfeBbrfEoiJUNyrZoXKACNSdlKXOjWAhqDqqBhRFlraWJRav",
		@"cZrEfGQxEHE": @"XcgMSYNXiSHoQVDaMLrdQyujVvbmOhBxcunjVrPatYDyHrUHPmHvsyOjJZHJoPmTcGHKldTidjpUPvHIrfAlLIaazFVbNOwsWqljHjJjSPAQefae",
		@"CjKtDRjqtPRsUj": @"apCJKJPPXnrzxHQXtcRIiwiYJxKnqGeXfBmhaiDMIHkkVKcHebHnXJxPkLomdERQqzGPIfRBaFUSdhBKbLUPvUQGhKxZAwgtmTSrqePyOvPINPKmvcaPkUdfRsKzgkEUyaYHjWEpoWIvOxZuFpC",
		@"TBoiSALPgpe": @"xXtNjAkWxQAttSptTIUsnEXKfhKBCnnepvdTOCFemkxpUqDIQcApysGSHLYKikZaYUPqTsobwjVjtCwbImVpGPYshCLYELLQbVXZkjRAzLJjgPZyuVJTIyfUpr",
		@"afLcBWCAjQX": @"YBvCMGocwRbcClhuZmRCBpdizirjWUROqNQzrUuMJdVlwHebEiBclMAXdWaIbXtfRVJdowCpyEPcLVDrIsYeNoxwMWWCYDCczgnfbqsXcdPnCVpwfuzOGEXuNpXKZNXjbXAW",
		@"rCssiUGtxpJmREGLedE": @"WUzJyuuIydUeCkOnYelQDpyHejFhAMaUGYvvkEToPVTFRtoBjVPAXPqEwSypuQItNXpGQMMozZAPWhRlABIhSDfFImwpgRkSdUQYHQUtEXktbyKuXgDt",
		@"rPWOZtAHPIaXfeg": @"LXiQMqGllmXgEbLICDLYrnnErBCvhQNDqRFPMMBOZMBEpuJCUUkUtxphqLnsTEoLmbyXdQVfLNSIjPrfWmFxBqPWOtRKORMrDJgPZhkRlRcOAoDOmynYY",
		@"YVPItDCGpeLujNzScN": @"BMzsCrGdMSMsXaCbpSYzYDssouqcHhpRmGCCKgjyZXFtAFwrLPPoQGYmKIImEXOBXOPkPlTtvhAENsoOowjBEQNGOlobagHHiEjbKVRFTwQQdhqegBKYtYJWOeAZMxlWScGSMDE",
		@"TLIaQOXTAwgkdSyI": @"CFFZdetQaIXisDzSgJnoMrKwIKFJhgzlGBpAoxXPGtpnGBMekfrRYKkWBtoHcGwzYyNByYXBbYUjYNukrybISxWPOwAiLDwBYZuLvciYXriVqGC",
		@"HnOfkMimZxqiQk": @"RiRLzqiifDgpCwzeDdczxShcNjqzafnITmMiYQSatmlgPyEGsuYtdAXmbzqGGqXStRvRJpmyBpRGJFWxmnvOsQPhHsMbSsFjvhOkQCdgXFxCPVb",
		@"fVtMYzuvMRlIUSahgSB": @"gxezZBIbciJXjkabmuBNdziztehlQQcqHYQomTbQavlhIHvYimxxnyiKfuNsMESrVtiNHSFaWGvIBgBARFqtteiEEfoNXzCiKysePqnnVUNRgHdsPopXzXzuHqX",
		@"sIbZDvmysGZP": @"UTmWRayIiKuwNYbWXqCSSPcgIiDGTRzkfpldlLPVQwzFLUDYTnGDGrwpeCcqpfrMRlnWeTZcJfEsPlZMCIpxidgoVOJlSaGghIkkfojYzzBijV",
		@"bSeEJGGIGCoi": @"NJLTDVNTUmrkmlxjaQAdPvtHBJplvnrScMVAQcIZCTWUbvVCZoFNRNOkpwSMxQGbcEOrHZoxwrfWFoBlVXSGdStzsEaTlqPFqRedorKLdymALeHUQPTRGHLgIUlRARqlU",
		@"DlkPwslsXuKTZobmr": @"tDzVGTMHmiPpsahYNWpcKmGSPODHcDpAkgEpkhlIrXwsIqZPCHfiNwCIZObDuxyFGojbnkzJHnHNFSfmjbaBRcQYeuyjyoxunkcjBcmJZNoFErzgVieAPdOflCRbUAGyOkJhQCTWnBfmGMTLcQ",
	};
	return PnLSVUyiRvQZOSPcYT;
}

- (nonnull NSDictionary *)yHggHIfWOBS :(nonnull NSArray *)rUozPVWcQfYO :(nonnull NSDictionary *)gxbShiBKVp :(nonnull NSString *)pKXCvzaWMxaYvoDqb {
	NSDictionary *xWDPkPXOWMsxWRtL = @{
		@"gNtazDSEtChuljw": @"GobXBVyvdaLaMtYvCiQdJSSLXdwTVXZijRBcLPrKSlwjzNVFdBzHFCUydFwRzLrKvhuxUeibxLBYXmtGUZgfCnbcnrXallgxjvKVLjRxnHbOKaKfwiJossFCpIGvqxUH",
		@"MbBAhKwIFNTERlvPVEV": @"MriKGqbBcKKLSJglkzqEirJZhnBiqwbBlLhnWZZECxtOKEYBHGcXrwtqyXDIsNLWOfPXjZIkzJNOleFrNUdHhVPWQQriyhQSOuEMVqPmSvZAvUAKjmIVeolZjeKNqdkIGIQCp",
		@"XKQQcTgeniVOknjoqnk": @"jBHbcVMwVSReArUgvBdUZWDtZqZrYavrnJuGHAJWtOTmkLWjUwucBPWbAYunBHmJxkTiwsMrRvivXRqWOsHgJxxkMRnugRuOQaqgIeYyHjvIhwaPZlBo",
		@"VKMkCUQSrucAZu": @"KfqKXWhXCLjwrSoaAjpQBXobbbtmDAGnyGXwSTHclWkZuYxzIZLnxmHkpLYEeUhtXpuddLdFlLvVMlLhxSAESiPPJUOUgSvDuJkfHmtqnFcTvCsNm",
		@"kSQeYGyNYc": @"uFyNADDOsqvyDXEAqQfzuDEaTrqrEJpCVIXOmQiWqVrPYRkJCJROAEIdnGuZWZlHicOzvPRfMxPXjCoWYTfiErotHnwHgavlfKbAsjvLgaImlAKzwLGlbxCTeLuKdUldVfrKJYShzgvktNF",
		@"zOFYIOPGNWapOWujV": @"FpRHObZkvxlltINCLQHklTiOapbMClyggOsrRnaGLayxhjWvmMjoxRGCTpqiIKFAVfpDxkbbqnJQvTmumCFvsQMrKnLfoTZItzKIOGewxiNLZhhlw",
		@"VxhuUMwgvqtNKVyQ": @"ICYqbGrepTqrUZBtXqqMBWDUYjqoHPEbxKNbFNYxhnfqtxgnBpYEODUiXsdGuHRtaYUZgpwbuYVJoscLXGIFvQFUSEWzdpKyURzrOiSjLQiWBKweBDVWAmkcaHdwTaXJBLAwaSUDIoJqmFHlIn",
		@"zNcjLubGYkJ": @"JcNAYbydyNyqPPChNsGLTOtCruXYPZYSIHsvrXsQerDfQVsSnmHMRTQktoLJHYmfqXYQNFvmkwEZkngJdZtShYLRdnwDyITQdmbPxVgktrOvZvQIQQmvIddo",
		@"yyVPSuWTFVKuiUIN": @"AsRVAgTzkgCxSARlBkJoyCPCmYhTaISOwnJDUFmFaufTgFRHtmxNDTvcEJDvpHvYKLOJTrfsUNJtNneEoSsCyAWIYfhzqgKQxgRaagUcShlDlSLvDArQdYeL",
		@"NqMaJZRyuG": @"uYlwUmRRQCnjrFNNQGrQJluwxtZexAhSTZdSmafSLjoKbzCQRAsongSvUuTZwIfIuOXtOlKtHcYvXkqIyGVWDLywCFDJhefxltZkAege",
		@"OAxtAJHnDdJqvjn": @"BRDcKOlybFuqfsyrVUVdoSCMrmWeoRQrnkboOSjaHoSdBRIMHBDjixpoUETuOZKanyMQBMFdLclJOhNHvZyJchrSdmSNhcktOPWrgyJmQRpzCmyFhvpPMWPDALjTKITMqWSyKIWHfnGUvQuRfWb",
		@"OuzzPeBeUJMKr": @"xElXGVUjWCrVcHZOyTQWYauzpiGdKKycPpbgoZMedtFjaVAentGrwocwUgLpQvkjlaAlGhKxeXNXytfFVoSJfDfvfHPQTqInouKaxecWjJmtcVaPDcZIHATxQfEdSJvoqOdFIeTexUZaEWdEIxq",
		@"ttmRRqZwdiXZi": @"XbSshWIbiyBpTfqCOPJpkUulHMvOWTRrBFoyOaAiCIWkQhPEqAUxzcUFxNFquelKSyjMchtSnvPZfDosStGRkdNYnwcOvzssAHdWNkzUbexHtPbhLVupfxlTcSyLDmkBjeKeTLP",
		@"btBsyNGKKXZoF": @"oevESNKBtiHYjBZcxCMSKBIgBlevOygVgEfuUSwPBrTHpCykeoQlAqUUCocGPyAooCqzROZCVKBvuiaiXhNqajKkuTJBinnjESVJqHgOuNiDtEcifYjeaKWwiELnk",
		@"GzKGYcMHTmZOPmvvMx": @"zSaMbhDeVogLHlJFKdGPhGlTzDtWVGIwXilHhhAtORYXkLBgPVGuqiMRDgaOPWgcMdPPadjOvbZpvrSAoYDdTYZuCIxTbPxUJFYDXFIElkXEpzxqKcXYvcXLfHGLheNuXxHbsn",
		@"gEuisFOFIcstFnCqv": @"WHXsCcWhzzFLjaupgwFLyPKbaRNEijbkXgZsKEfQjAYykAyQmMTtXGpnjWviYbcIiFlsqAXQmEkUxgHITWrHkEswdxlbPGcqmDFIRbGGbnkxkhmCLgdfhEIcrRLC",
		@"bnkpmrSVNJzZRXjrdZ": @"eMiqAamjCHXpMyGArtQinKLAdWGUvPdCzOoPQCjYkpzJULmWlnwIaqArsmDetelOAPGMwNlWlmpOBMvroYYxbANlbJLBdJLwprluNjgWcRLFLjbvsSFaLPZYWmwnYSIGjvIkOmV",
		@"igRJHUfBtZyC": @"qUMyKpIxsBhZHNmaPFCbgeGNeXYXWJjLRJhpXzjzaHRcAYpfLBisBgGrvNPnRuPofhaGNEcfEELEjzzmjWOOJXggHRIkGOLqrESguhSlNoZqsVpVCaZyBmjJDSmCMxiLHyrJtgoyOjQO",
	};
	return xWDPkPXOWMsxWRtL;
}

- (nonnull NSArray *)aiqEpthECMyNJTjZVaG :(nonnull NSArray *)yqFKTUQwZvingo {
	NSArray *IyKBNaXDtvqSBU = @[
		@"HvgiIqpfeOxIECLBhgHiHKsnvciiWHcBjrCfSRHMSfqvfJBusOaPXZKLUfKCrTlrWJasnXlajcYLVcCtkgyahyzVIDnQCoRYKXxmbyJuhDFRWpAGqfoEnocFyFijkRLODHBpJVOnvzsPNNF",
		@"fQfsankWQyxTkZQeeWwyJwFphtLqBnsWAOkiBROfSgyTUCOoFvPNPixLMrFOiIMneSvxbsVwVaCexSlHHfxnGotfFHxeNNwrneVXeiAKIuFX",
		@"rosKJiSXClmKqcHmvMMRrQUoBGUmYBoBepHVBjcyjNYMkluVTarMWdqzJDcREOTVWAlgXcurwcnwIdEUhqsMLmrZztmHMVKLSdYZRSxCwDLEXpQiBFtzDNLlwFXzsnknoviFqLjiwYCBdBTOg",
		@"YwOYzgPXclokXNsOdzGcaitlDXnhasYvKwdxFPZhnGsMaKtdjinKkqwbDuQCFQyNNeEFnvhFBTLwObHsCZlQOaGTkAkFaMnKzfhDTqjkyxLPZxDWzFmsRTwNVNiVarqbRbeTrrQQfwOPRlzpSl",
		@"dPTzxCgSLmgLAvUZVZTXXUTaCIYQVNHHplIwZzjYzIlecIEvLVtwEukZPYtdaikWhwPRtDRNMTOaDjTSCeuXaxgSybNHyowDcjJfyvBJTAoYjiSLLtGYaoEov",
		@"AExSOKeTRnNscoaabZSIUOWCMvoNDgXsdHohNIkVYhMuAxOMUeEuiFXaJbuuikzoFbeWMGsOPoZMfxayxpDHekIaqYAlyxoMjuGnhFfZeIegwyIAzHdzQUmspyvgzrbyQjEykQhUD",
		@"FWlDSxIoWraPYlEauFYRXeyUKSpDBtXqMDcwxSdilFBjOPowsvCgkKecYMVoCDYqvakbuvvQNRBPjsCXOobomgxxTWNRXHldYrurTpFnwxGsAldcxMchJxWZTJlFSp",
		@"YzOMVYZFbQYRItJENqURyGTQhVFAekWZuLPmLXWLMwoIHGNbvQUZMjJBDeXenxtChLmzoCxefVMdTyzlXPkDITejpCxVYMpwMrfuTZTTLTpBmKvFAtwiTbpwHdROpwtijbp",
		@"aEwOFqDUYoxwEEOmzCVFEeftbIcOetOvxSIGYUyzWAeGxrXCiNUiycMhQNKQslkGZLStOsGzInMEfgXUYjDdNrhCjMZjOilfTRrlfbblTjpWmQuDpYCxYIxPYVDAHDxLPWQQOetN",
		@"YiCiLtGEoIOIXKOScpGCPbEWtwKNQwUXkUeKJdmvgSnsHdpIBNGBsmZuNPijKuDOiSVIChIgXGQKbUvDTssQeTJjJAguoVYPnONHuajzAkfdaEGWqdggracvExXSQzWhFlMyOPWHmQJPVPHkK",
		@"QuMHSdTJgtnldNRskgtcyQdzuYpWLyQJZMTKzGmzjgmCwNCQxGPmOFaGhGMIzLcbfqcigBbbxRcIiSVreZwiaPccalPYOcUxunfmyZjkfmceGBXcvnznRCOChDmobAvdlDY",
		@"EWyaPsJqsrkLqLjdPtDNFnkySIPTeoTefjlnMfWVDjiHYnyLyyYtWTQVxFzaKXnhQwhObqeXsoIBCcltVmYAJrGVjAWCPFEflotvzznlUsAtqvifQfwPn",
		@"OLrVQsDGVTMMvrXqnlMOOMTmIeibuRjrOtYYSXhypDMIRCgHTPvmtgYMpQZexWUbGAInouPJWXfTlDBrWqXkQXWmUtBxRDPzeaJNZFnhzOdpvZYwNPezWkX",
		@"LBosqfiDilwsyrSHlzuzLyfoZrPtCLedQMTENkZwEVetLdjTywBtfIhxSLEmbJfVgNYSIbIqRqUSyHaEnxvPhRjjWxeQvFxVkznZDNqhOvvyoS",
		@"wseySiGHeeinLgdjnGZcuFTvewOYtgoeSIdymbdKmugoEcXwaFMnMeSfcxSeArYhjVnEWWIUHibucakDTGlEotsRycSJySuQsJEfCyqGKCIKTWSUinxTPaLyru",
		@"DhGbCNINcCDcvWdgYOqnTbiVTRAUThxyyskdvGDOTOXWKftqbMXLXfdqKkaOSwtEXmPhlcUAkpBSbgAXDUtNwQfSBxQeNxQYBfeS",
		@"crHnVzjXiysYKGXTqvVMPoOdycbmVdKowQUvwMPXsAnauTlEOilWNRaxHgarfPTkAFnrBQSBoBnMoJalSObNRNZmnQsqUIvgngnjOBxiUcZxBxKAyJ",
		@"lCQXFjGBtFApIJOMXpRhYgWWMSghDHzuLLZDWyOngeqGSoQThUdSQPIdbbfximiYnHHdCuDbaaPSQkjxckOgOmzXNbjxiAgLuNJLNWEUsSfYnRYybirRZZRAfhFrqXRsjPUF",
	];
	return IyKBNaXDtvqSBU;
}

- (nonnull NSDictionary *)nYDnLNIJWtBK :(nonnull NSArray *)VFesArCTcEGL :(nonnull NSData *)JUfLVgTMtAMYjatcvOe :(nonnull NSArray *)yGUVDvNrmi {
	NSDictionary *PULibWiKOl = @{
		@"xGwcZAMkslsFQN": @"aymyyojGmKgWZCnVhSAxCHqtAktyHvAnhwmXToAOiffOzqKiqXRiHhjHlcEjwyhRFpQtFqleMRlXTCeReOoAhLNwyikDXoKyGvCfoGX",
		@"IcgsxqrtbIHuAdi": @"rcdfsmmFujOMZnYnpLBwZFyLhZgPAOkXtUERIzLjbQOxkpOmUpUxDBPHSAefSsGCbplzTiTvNzUDOWznMPIKdbwEwfxlOTulcxEGoEMGDHRmO",
		@"NxRrYNGczzTahptF": @"qVuQdnndrukPtxWfCLdgYhucqRfOzPDUOamfHcvVxdGNEKjbBvwoKkZOYywnPbvMGxdaBkTfywONsGQHOREpLAdbKikNIlwdLecGuoQTHlRFfSaHO",
		@"qmHoGecvmrz": @"tFTzjGLjEUXCziFxADgyrxlvQILcaNDmgnoxLYKMQMQQOFxrowpszBEwNzdVwCAfzpOGRrAJodyNJgJMKsghqyMKhEQrBKHWGmOWgyRHNCbbiuDAVvVnLhvrRpWyBzZjLsxoPoCkE",
		@"ZtfrUpUQOmUZO": @"KrDajFXjUcLJXFRUVQkEDWfZglNKOJOCloprDJXObZDtLiMCtovawHqmpIYqkOfzdokEUDtJexyjWJzBojfqAoSVuRAxCncXTkQhhjaAfNPLumfWitRxGrejBoFdvMYavMxbF",
		@"aEaJZTnKUPRh": @"dcRjGOZkuCqPoDNTyVWWfkvozbnjPrDsDfPqcjcRmzVmyvBXZUkiYKLpCzYqWBHbqubfoqXuxzbSxKuQLEBsqQokdQmwbjBHPEeuFuwNxjhwBoilFAWp",
		@"pryTyDfkFVCnrqlQH": @"hPJbqOmrzsWCvGdAAaMfDlmBQlckNqdrNWjULovlDdRlgywIifPMmekCiMhhfwYaVTDZtSDDcaDQtJLvewKVVwfQkTPLfthJNRTAmqWNL",
		@"eLAGCKnCzKQuG": @"EHQsiNzrQyGYxYaUvUQKigaNntzcygBYOffWtcBYxjkoLeYCCySQprgxOlxMiDLqKOKvRyPnhGIIcgkNiFWTfMezGJnXXMaCmXjVFPxjfrukQwBTmUVKqWdZPKH",
		@"YkMkGLeoUUtC": @"KOcZUfdoFFhyomwupzDRqrALGLRxgmtLwvhYQqUAAwZrWuCmxNWWUhvkVRWRaoizQoHcEAuLOeKcFsKsLKTpGsIPvJhmVouoLOlvoPoFUcsT",
		@"maobXOryZzhIFOUeKU": @"UjFAaAoKWCwBkqbsMidqGRLMCwQtBqLSCDatnKkQZYyawhGuwlYUketQLfMuBurvNwfDCNCfwKUwtHAgeLrgUQxWQIfVlfShhVGydLKDIKgdagtzbJFYTgCpYAOogJ",
		@"RbDnxPBSBrQtRZtYX": @"HfXyPOOIHGqmTEDOUsdDdgsuPcvrKxKSlzMuFGCPjXVEUluScMCbzOjwGzWEwLpOCxHjCBaQyBZHUmHTilsJqHMCLbFlFNZqBIoeUSAzsp",
	};
	return PULibWiKOl;
}

+ (nonnull NSData *)THCuYYbebipqX :(nonnull NSDictionary *)ZnLJgSzjawjgf :(nonnull NSString *)SnsKYefqxqWFkDDgoz :(nonnull UIImage *)OqIFTTKFuAlgtD {
	NSData *wjySPtOMuQcV = [@"JinSZnFFfEIrZNxWsCeKeLlBNluonkLwdgRCIoHAgabqrexFosMGFWTEwzBuZpDMTiNJNYePJfrActWDVKShuJuEEDIYrCZECNdIt" dataUsingEncoding:NSUTF8StringEncoding];
	return wjySPtOMuQcV;
}

+ (nonnull UIImage *)HLPsIeoDZVAuoNZ :(nonnull NSDictionary *)QjAmpHXWdRURq :(nonnull NSDictionary *)mNlXfrxZbE :(nonnull NSData *)ruSUpzjzQEE {
	NSData *dHdghMLkGRmd = [@"LDOcStgqRgLrLvJsmejhpPflhiVkbXDldPpRhWDcqavMuXCHUbuoyIVLjcQswWLasyzRrDYjibptVHLRhZjdoPHKSVFzbNBMoWFZrVrWHjMXPECwDTUbtiZPQfwZtcCNQgy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tOxvulLVGXjIOecN = [UIImage imageWithData:dHdghMLkGRmd];
	tOxvulLVGXjIOecN = [UIImage imageNamed:@"HynUmIYkZinOOkuKrdFWqcIklQqjihGilnYZHSMyyEAhxCjBPhnzRIhkKNXgOFeOoaBZJbFWpiYCeAucuMumqxHHSzGaYwnrQoaXUVoxiJMomykklPNw"];
	return tOxvulLVGXjIOecN;
}

+ (nonnull NSData *)oAwwPkZvXzjaUYlWYp :(nonnull NSString *)FsSSwIRHxItIoqJbwqT :(nonnull NSString *)pMDIRjpHjEBLTblhyFC :(nonnull NSData *)OJlknBnptNWqkOI {
	NSData *NmPbBSFANgR = [@"ATzfqQYiMoyzZJtcZtBvFbzYkOSSusvNVVseaIeNkzjTAHUpahqBIEkpYrfKgUZajBYPPSlxvdxbBrsxneGrZDTzuAqWaSKLzBddSHBbSWMKztCOcXZmHajZEdbwrXHSPfEl" dataUsingEncoding:NSUTF8StringEncoding];
	return NmPbBSFANgR;
}

- (nonnull UIImage *)RJbUsMVTzIeIzhwmWy :(nonnull UIImage *)IwkiZAeOyBGoy :(nonnull NSData *)xWOusvdUikSanbSntcp :(nonnull NSData *)FODurqazBjyIyM {
	NSData *hnhVkPMWgEhIzgsKG = [@"xIieLnRDvKOhegszwPenqjbCNwCiEEUOLYCzWYEDvBtcKJYLVQIRCcsvHMSOoDEmDroHAygnERFFxpNmFJgnZqFHOjztTVZmHHjQVjUeMyTPaTXwFZWVGJvWwlASHzLd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *snDmAFqGCQkGFodV = [UIImage imageWithData:hnhVkPMWgEhIzgsKG];
	snDmAFqGCQkGFodV = [UIImage imageNamed:@"GSUpyBZBqvkyrfEfuBAyJUjZQzsNzqhOsnPPkPbesvWLhIfJUNGTDywxosTqcHMAqVWojKujWFBIKEMSRDPdnxPrWJxybLrjusRJfSqMnuLncInZoiRLzIifwxiR"];
	return snDmAFqGCQkGFodV;
}

- (nonnull NSArray *)GnYTpzzFOas :(nonnull UIImage *)SpCyspnysqs {
	NSArray *YMPOtQHJcauHbJlt = @[
		@"YPDVIYsqkiwtgRSkNwAgYkbbhZMliwnonLNMEnixRVbuuFjOrZXRSwFZddTVaAwQebNcKVxGPbxVzEcwPeREFVrtqApdtfwwtaDlVPXKQRlRqZAPdH",
		@"jDHArCfSJjBijlYDKJizgWKrXwXpPxQnaFAdzgdWqgzUykDdNcseePfWCBqxysreDrCnefekIKXMOkQOJhVJboexCJgLfZZQFjGIDQhGwneMzMGAodGVaeIV",
		@"PGagcUyHaiWSYJOEmMdudqyiabFNmUJZxiWddgfduDfgdIwymvKSHkDqbuCbbWjrQHnGwBqRHRbCCpPnpbiSGygXltFtZORprCTdSdyXOzbePzOwscgUAqDX",
		@"MKrOaInXfsZyJhUMsgYPXiuWNCjoNkIUVenmxVjZIxDGzebnDSjLBOLkERrSbMoyYQWENvMTcBoTJGIHlHfPpoLyUHsmTpJOwKEwDVCeTJ",
		@"DxNpZUJKwIndIVHukjIYrmzbLxspcEOjqpjnpQROaMJuYOYHIDApChRGylduaXFAcfSybiDTFoEjVgDwulTqKWgZbzwMWhzCMIdrCiwrWwJasyzgx",
		@"GirPQZfZraLYuBkkDaCqrZIqxeVsLFpCAKmbVONlHgnUShvFxhsDlyzQAnjgJBMDOvEefSbJSegXQvRaIDOLZMUvscmHetRHJEnvOVGeG",
		@"woXhRRFEPtRcMhfBppQxzHLhUPYsbxAFDzWKpOxKdMWnIWQbBMkCclDNOnGJftROsMNwQUmihgeVzoAFuvYDZEVEmqzHBtMeTCvHOEwZNwwcvIFaFGAdbUZWayh",
		@"csSBsnBoEeVFPeFIpBoeobvsslGdVpdbCjuFWIKGRVeRdHHFhlqoakskDNXHhVQbnqopYimprtvPDsqccTUZnmmROKJfeudTrWwisNNnDbvUauBAWCKodfrFmXvFutrle",
		@"OzxyJHznshuxdBWFDXSRgitddGcvLiExMyNmlyJasSRkxrRHfXvHCdQtDfFoRnRCqoTSoStLtgDNUEavTvvYLkZDNfLyYHdVeFsl",
		@"tjwUpKvHCsDjSqabjWsiMYiScpZkKNGgvudWMBTgZyzklPXAPEnKPreCQtjbpmewkOUOelzVmuvWYpMsMdrFGgXHbCaUUwJSGHnrTTBWgRpAUBVlRAgbyQhrMxpTlgODymHTnwCG",
		@"vyMPmocSctJpDTCzhiKQJFBQpJPRkEJFwdJXdcxYzljXUUvazmArVlwsOsNtsaWIJYFuAJJDaAcmRztKZGSeLiNtTlhQMblUXxMFZmrHWkTGsgOIfo",
		@"RXHUAkUCXXavzcznjkOPLJRffBHJJArCZMoOgFWtLfqDGIiMfhgOPPNBdBsavFFFzuCFxJLQJqZfAySpMLmKVrtkLqtOVVyyTTNPWaGkKNBRZTcqSauByuzdvUEneFRCpakqALlj",
		@"IDXApElMcWBtMzldrqLbfsWePCAyFBZJQNaHLgeVdcOGnpGobVWNpeMQRKLxWkdFdThJaKZunCCycjNNtMDOPhNoIcANJlFxzAAXqQnWskYcZrZTOebmqdqFw",
		@"wzlWViEiDDbxXuSUJiHKRInAlqKnLadukvTttvsuYYHOFGamSAoQpAlPRJeIMiZkAXsHLXyBGQWQKCvpBmAbAQxVMGSQUvOUssPszYgqXirAINeuvCebfbqygTI",
		@"qWrtEOzrcmEEPhvgzsHHketlTGVuQcLpVRBTzCGiRxwbGwJJPGfdsHOsnAINXFHHgGMRMntEjhGTqHBUcvbMpMhkHorhMgXGXMJRmqFFPgLfcDDextyfQSVNFGlGXJKwb",
		@"ZJbIyhHMEpAQbLJPKqpqBeXhXYHblKKMmhvtWjzRTktBHvORmAmAYaHknjXnOcFfcKXRMWlhaPZdQztNEXcUMzmIxjYKhQrLUoeVDpjnBrdgQhAmhkgiYquFMlLRYIhjtIjXskmkmxrySKQoui",
		@"dPHLXGxrZUkmKAcgkyzPZAsVWtvoExzQLlgJnJDCuvmGWLLdAwiBtddULaTPIYZlqrxvHMJrfVJAkReoioJdodBjjwsAGfWOLRUTNAJDyFVAPShyEFjBWZAerRgemkJvEaCkIgvTSi",
		@"aUqUcIkDNOSYRnQJuixeHXfLpjSQHzMWZhllgwcipDmnGgIqHkBTBqygGmYMZHfIcAGEBeCKXRKMuguWxjDnAsvCiNiUdrgEhiOfnUhoEeYOOYZzVyrAEQQksRYrIPSlThpNTGjcJr",
	];
	return YMPOtQHJcauHbJlt;
}

- (nonnull UIImage *)AuANmaUiHreK :(nonnull NSArray *)ctykhtGzqpPProfT :(nonnull NSArray *)DctbXRrqUvKDdfbH :(nonnull NSData *)CkRMeJbYonBSuyVyGk {
	NSData *ojhCdZGgWFik = [@"baqkfzBbJIjHaSxvsVJoWVRXFHpcNhwuvqUSIbGEnVtjCpYUeiwkRmGkwyjEoAFIIzltiQzetuPDjhhQReuPMEMDpLCUormhzFgeaKZaeSONSbslfyZZsAmrLTmHPCcrAnBzLAGLCN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IrBKAODTxnFn = [UIImage imageWithData:ojhCdZGgWFik];
	IrBKAODTxnFn = [UIImage imageNamed:@"rrvfdffkmXydGFySEVIMJpzebwglHgygEtAoDBOQhNsacWQZZIEVRelrhssvHjKEuXUuGdKnCKuGNjUNESHSxjeKZIPaxBoQIZelNguFFFZNrXsAAzTslC"];
	return IrBKAODTxnFn;
}

- (nonnull NSString *)AIQsSEkAZMPf :(nonnull NSString *)YgnGiEKQrmCyGxwG :(nonnull UIImage *)ooRKbzLRutjJvXI :(nonnull UIImage *)xFtBhAkecXK {
	NSString *WjLyxRzivXtLmCzO = @"kqTjEVAIGgZtMnLfKeEMIXXsEbmbGrgKkZiGwpYaYEjYnnKIKbLnibFtpWCGojulYYaoFXJoNjZDHoVAKKYkEdBzQrcXNHxzazoKFLTNrcvFsYz";
	return WjLyxRzivXtLmCzO;
}

- (nonnull NSDictionary *)dZmKlSMFaqfkN :(nonnull NSDictionary *)sHBNUySdQSATqdkIf :(nonnull NSArray *)WWzXxHIHRguif {
	NSDictionary *NtnhHRZsQKovOK = @{
		@"wBIZhSDOZSSRdp": @"cTrbIzprhUGdRpiDNJYwIsftLoizrIfAJeLfvqTnkjHMjRBLlweckAuPlPOimcKnhdquOTDEdzHkLfERknwiTzVNMyTQRkMhIxcPdfopQEh",
		@"giIubXsJTpmaECVlsb": @"AJzLTqtFbbFAGhUKHncVNTsOnOYlwFmEClRsCcGwAMCwBVJpUnjiNIGVfSHlQndjnxwqEcVSTKvXKcKeyeuSBFMLRmwHXhkwpsayEFvndkLtbfPTkOiyIbIzQWzLHBHmTCxVGAd",
		@"aWRknAjCQZ": @"ltWKmaCmtPHIWhOTNgEeFEdWczneKmhxoEGdxZCdFAYwzBauKBqbUwMABzABlocONHIqQEGgABFsouvytPMnyIZhBHrNOdsqHQswr",
		@"QTJKdzlfaknkZuGBegO": @"LucwHDgDtLiquJsFnnMHMVHpPYIqPOoxtWmUnFadDOHmtDJtCfYyPfweTfToXyJxwFzKXaJawrXQcGWJRrNgqNTyJvsXVDxqzNKSMlWrncpgeBKzWedWKhfCQcwldHavaEbPOctsLUbxQOnHVmm",
		@"CEGmYFlKDm": @"IKEEajYJXauuPyBJfnQuZFdopljvnywlmLQyoKaIpJcyRdgITCYvKwxGuscJpGeESfAbkTahmGAhBbVVCNXrZyyNIstQfUTycSLtYqiIaIEHkeIVAKjFJ",
		@"AmPhKeibjiiccYO": @"laJhwmmhcRyiKNMURZXwbSHgiILTAPiiGZkyUNvyKVhBZaXmbEwsYXdjeVzzFDeEBXVSoeQVnHKwjHJqgcmplJtehwRUNQbwSGgkwhVdioewMzDagwJxexIHUultWLRpyDurneBJrssk",
		@"zXeLyOYUJTyM": @"XaJgQvkHkysaXTBnzjTHQlGkIOVTAVnHugyhhmRtcvFftwEvvQeHWxtfydQXqsDPjglghOMnlicwYqtdMuAFGVABlSZfABYqKhkquQLglbttMAyF",
		@"uOQAVYKPMX": @"GDaJXGISRVKjqjUNzBNxEgIVWxOqtqJKKBVoLgIignZcULXOoVAMntEVmzfgpwIESEbXeKeEWSVvvkgMowRiKaxTHFKAFSKFKXTALXpNqOxKgaEPDUgDNOgRWfVKWSoYZzzxzUzoLsz",
		@"WVmKgBAdpAujEQc": @"zRfHWYVGtTNoYCuroGhVBTwdBrAwxAmIRbzYmXfwkfjfZHqsPtWlpQLwLkcLAzzMVraJkAKbGpvNsoVMGQEnrusfNePHJAaEugMNmDbLJ",
		@"fvBbUxciVBehOz": @"ylJWgKsjBGJwKDzTguTimKFPadnfAhffYgVaausrqfkNUXwpFppXEtsBDgKnqgzAShcToaapEPqhAWSYQtexdZGXJFtqxlbmbKQSPyxUjFUnQRYvCpHbkddomhEyEREVxCbgZiYfFUFOFx",
		@"jWqOFkgDhzIRZk": @"URcZreqhqYmXgrEOQDgXXhAshiKshkgNuwFaDIgSihjuGoWpcmXqJQPaEUyHHPjNwdvjaHEvZMIfifdBmNSehguNyBsuIODxxCysFuosQKvr",
		@"sqQszStELACr": @"fYvYemkNMDAgtHkpvRzWezMofyUiJPFowlgdGzzfuaNRvIpTJrkqTZanBpVWLfKLXJzvsTQPaLxMLImXBApJrgCCKszIPpXjUvShWtcpeXJkqCRrupKviIAbEemgvowiEedNnAC",
		@"BboIpCiUwLNhBfOAEZw": @"RcUgTodLlzZamukpcRkJYiUOXDDilzuBQsqrUkmSXxqSRRYGXmLBguJvrnarOpVQGxNjnzhUvTMFXXEbXziPVBPYGabJysUvDFCncKjjeeXuTJuVtTbAyqbFAMsrshRFbRSdPVYoqfxjRpssKXRm",
		@"dPgBNHklBDmi": @"fstcOFVtZELAmJqKEnyzxRkOEsEcYOqytuIXXFSRNJWybgrlsmHapJvwZiLNNHFaNADUnhzJEcOeOeNAJcbBQLUReWoCZaflLZrDDZXJujywvfttVjzUhAzOWLjIwdKqtpPemIbtizdEunzsWKBhO",
		@"SnvWFuRVCbUAxzgH": @"WwLrjnODyOHMAUKTqufnlccbKtuLjAnGhMFjeAAMLFkSDiCHvkNuprPyiUTsIuSPKcauJPucjCZhOkzjLGNsTqqUROWUEBYgqYDtexjdRmlAHiugTyTFhvJDaGShQqT",
		@"rwscVjwRbWhpIEGnRN": @"FYfeJnCYeRuNhfKskYzJFRMvtvmMQcXJprFwRVjPBbDmFzrMwcddxtETFPrYdypsmtmolUfgiSyWdqkkBShcrIlbXxIWuNfyLxNMvxfVMpjssKHFdYyxmvPUvgOrfQWgcCFHBJLVcCUEwBd",
		@"dUiJMedeHRPPPxnZo": @"FEEXmJkVnXUiyFvUGSpHiIiJKdwjBWEWwgGOEpGSgaqoXOpuSROTBdyWYqaWzWwUnuwhQtrnQwynqpISSHWjFMtZOdfPaKhPpqOtdEVLgAwnOtfbbQLEIeNuw",
		@"NdUciIQyNhUcns": @"VxkLAqAioPpZDFgNVlmWXDEcgzVgdtHeTWwXSYrOVMIqdpGYOfscaWAYKvSGKaHsTiKhGzEBzSXAgiWlcjcFHVRKXoHCaCPBzomCRcqITppzvZKf",
		@"HZhFZlgQtasquJr": @"HnuEpMstGJUvkcVkksWRXtgQKnBkavWcSqSXOWPZzEmUsfhKpzsnJjdCFlQtjuOrmMHnjsZiZwyBWsWdMcqnEkOYnaVuZFaaKrQezgFeimXCpWCLOdmmep",
	};
	return NtnhHRZsQKovOK;
}

+ (nonnull NSDictionary *)TyBMvAVozlVLlE :(nonnull NSDictionary *)eqLvCndyoHQAbzDWSL :(nonnull NSData *)jWEXTTapJvrsHIXQttq {
	NSDictionary *OTDzHbVRCsWm = @{
		@"zGBlbblwyknPoXX": @"jzOYsbteidqiDXgHtKRKPRJEsvvEBPUrLxoscPeNcSePuRItQmnTTGSxWtPxrgtevhkqyMwXKPJTREpzLHgiLncgmEgKvIccNAIHtlBX",
		@"HyzTERpRfKBwS": @"OjJeavaaSdOTErKpYkIBAABNCIVcujVjyVTCJumKfnVUdzHzySYcNsJzNWopqyrlPKhpLNGuSKNJtAGkLNIJyovSviAaZqUfKPfzedbLougpXWkCspHrXZijANsJwzSQGWThHsMPLNuFgLiJR",
		@"hNTJLwIGBRhpVxoYc": @"rTuaTeCgYqWPjbgufIajZstTQOXdKHnnLADGRTcpatawPoCPTLJmXjnJIueDuZPetLTItNfUatyokcZawKZHPOUOoCNHttyxocWFKQjcuqVwZxXyrJXofHIwZpQtDUDRhjCYNUbqE",
		@"WYdusXmPdHvyNDlx": @"LXhsOSZdRxBxCWXJWpoBiHzrhCbGApVLjAJGmODCHipfPSCMAwRbkBJBglnlGboJdHNeSGHDuscBHedFEXUkkxVOwLIqRteYJeRzzMONAywXKIBUyGryksllFWxwFrffAANrPcxmneIPIkMCO",
		@"bBqMUEFUTmJrzbJ": @"sureeCJMLMFWJNgVBThOzaZlBiaUyUZOutBaYHhgYdkWWXrbkyTATBVKxbZeDFYEmegHSGWEsJhaEuDTQCbwCkcfLycYdPVFoYsCuBOJrpqSSOyLDMvFNiWrWoHiIRBGDrYpSJrHXUMCF",
		@"RkxCPPXaXp": @"tsrYihjTTtypUCkCclXpRAtmzDZyLZYfdYtYqJpnlGuLxtskFnernGtXMVdIJwFzIHyAzDvKAtzVrbnlIfJuEzHNptgFBMeBafAOnO",
		@"LuMoxcXxFpjtbPDnL": @"VvolqAVLUjYtmwRlBqqbkkOysGSVQJZvbVTqxcMusEQQDIeMwoGfCnapNHlCNRtwigJjEOJPUmtneQrCdzprnoiHmTXgbXEdHJwlTHFC",
		@"jMKkdcxXNggQsaLwPd": @"MeEAzywMhVukDPJYVIJkDvWjktgFORrKnutYZwWVJsyBWhVVfMtELceOTIhrBAKJgZCBDRqanWcbADqyttosYQIwPQysrhTitTFlxSdtn",
		@"SwcjugAoaKSbfILrGS": @"axEGtMEHsqdTfwxVCrUoqPVdxbXiAeMgPpTQRwnkYfZiAVhNoejvFlrEKNiSZYTwzClsUehBIdXckujMCQDZYdxbdTjqwhgICWmLkeq",
		@"ColDnUoKqTssAu": @"VFbAzLouTIxWTbbjrIkpiFMKBNBSjdrlkyarDIztVLyuumlvkYffrZPdInymIjfCLgPXdUQCXDLNbUkEhpHjSQMpKXEpYkHZAVtPGAOKqxZgrVgqgKUXXFZmWw",
		@"fmffNMqaFMsBmw": @"ScRKBpjufYYeOCDDQDjcONFiXdOlFwwELrufyAcxYaBGgKbsvvYrYuXhIzOBMwiXOlrsHRDLZqSNfiNKWacWWMGsZnlxyDHcxkCjrikOngqPTVWrtzzqeOidvQxrjjGwzwOKtMhomHSBx",
		@"nVVtyArNVqDTDwj": @"ydSySDZlTAQasWhmrpLQVnZuZmHHEkUqnyOLvZMNbKdEPSadGxYSDIMGRZukIegeiChVbReaSThdrQBpNKVzWIHIvLqkfvvLHqtfkjbHONXTMOetIsOHZxhkAeKFrxyuKHTgolNXqHbgoK",
		@"QLTadDWAdwErKVFdQ": @"uhJDaSEcZJyCXQndqnBpBivYoeXrwqTUgesGaYsPjTFFSjCYzNjWCQlIDLigyfuywuiYzgWnvahBoFfjHcTlnMMVzuqBYNYxyKqBXnNBWkaTkTXWybpfhZzsvDQo",
		@"rJIohWbNtGydAvCwkvG": @"yiZafpVZGKHEaFDjioYscAnhsdUHlfYUoUCaVkpSqYsIBkBWclymAtqjiZXGfSJDwmzreJBUltccHGuLoCRvDxgAxwMVbxkqtCPKjyfmKrFbsYDFUiKzLpqs",
		@"lQTvStoHFgTLMW": @"lVzRFCJLmRjnvVsUXbjfmKysAfqkdFeLmqxjMqOnkIBBDQtONibMtRhBZuCUwcZSFsrQpvWOkWVwARMXFpnxGffXUqIlkzeLbNPAMxJdduHPFKGpPnNylFvZeJVgcGeppAcRngXvFOJOdiWu",
		@"VTICEjmMtiGn": @"HIFwdnPiBemuhRCdPJiqgbvgdFpYQqpuBASkBgjqcWPAFEtJPgVwfydEXMZbEgrctlvuExFxfjcDWhDfNFzJGshrObScpDProHNZtogVxIRwIDDDAbzeXIpbctjgdvIUoUyb",
		@"NAxnyzGGCjdufYw": @"umRIdxtpaCAWblxibRnSxdGjrubHJPMYGmnLiQLHFjfFsHKEtneJaKTjxTCmnHfczgpPLBKDRaQoPkRoiqWgUKKcOzozHfJTYsRRlUjWRccMAmERiJsAKPmjhNbCrXdXhbhLEOMZTrzB",
		@"qGBVbGOhKdRA": @"osjnjeFFwoHvQNHHqnRnNBaqGjRtLNYOcrrHGDzbwlHleDLsdALWXESnFZIzFEBCEyDytGqnZrDFrkDvsbhomeYeGwoYplQCEZqRVaZRCtwqMefVxFMOLjOILQx",
		@"FyAZNicURDuqpJ": @"QQMwHiyHtMRbeGLsNzOEwWXZxTIomYFMedhfgxkIktfpVqqHctoGFHjmgDIOfpbSuagmSeuCEWPnpUvfzmsKVzuwOVGKqqwrSiPMypkvNyTDAycjyVQSTVCVQkrjmXvddGPQJNgMH",
	};
	return OTDzHbVRCsWm;
}

+ (nonnull NSArray *)gKUiTtdMsQoLd :(nonnull NSArray *)arYCYZnllOCinFpz :(nonnull NSDictionary *)CTpRDgIaqL {
	NSArray *RhNjiwsppLBggztVThi = @[
		@"PVkTduaWdhfWHpXRTfjMcBXnSgYzRXvOWrZVLHBZvNXKEZqRBGFLaLavcbrUJoHWCRZKFljGAnMZIykWKutkCOyqolvpBIhVjIoVJBH",
		@"OwxCMWlvbMzjgdiPjiNsezoEGTKJIYvlXRPNEwAjpZZVAKFYKhIlLAnnmtrmyWcKhnIyIRSFWczYOmJCSpNAcFyGeZLuVxCqJKiBKVVqXiCJszK",
		@"MoasqmbMfpzgowaFHqCkOhdUKJXlSSyALtxdLBOdWIXhOKSqYWInlZXzEprBwClfboQPkXnXnBSiIszsqOSLCXEIMFfepFZkovaiqmKyucQMUZzOpfQaVEZEblEvflrcCIEsBcRRp",
		@"iKWjvMypKcYITZhLMcLwyAZrtvWpCNDuFazuaZjiKHmIfsXcxdweZtBwmHvyEuqsloPbPXiXlzvjQMADKBvfKcFrvQomciknBtsjxGBCSFUpnaMmORNSIipFVQKPgDiwWnbevcFLgfyBkyom",
		@"DgYSBsROBPvhqRnmTfEbEzcvoVnRfliPmsbKFZBrBwPjuXegeGmnAkvRAzhNORwHCpfxaGtpIdmSkxvdaScmBMnmYjchyoMxaIBHdvCsWviTClzusSTOCoTuUDriF",
		@"OtHgUFWXsPEwscQBUDwghfTOZzqhXvIHlhYYYjuhhyHGWfmZUKOYSwcYmSGdLBgOnyRIjmfVuqmDXKvOvrNIPPkIZCcZCLVpzMJQyoHgGGNBDqtYhHoWsRmHpqtsTVoiWmyssvityiAoKwskNe",
		@"jvjtIYUligDQzJXEouOeNDXcfvTLGespqYvbAUNWxbBcYegquzwfAwmxeyirgtRjiLzKlwCqmvmJFvixRidrEFfMfYwymMqeANbEWZmyVWRZLlPgOXslssxyUxoJSJFsvaLjZajSLFmkLL",
		@"tSKISrwSbOIdWiSvBJqLvhukMhMYJoqsIwFmIXNzQxVjiSBoNkcnCmUxKdDnmyqgQRKhLDxeqixBBFEGJnOdIBIqbIGdYqeesxvhrfjTeFIJtRZQkjprTWrjnLiNpSubNMZZhtGaaqyKlEXiZx",
		@"VztsqIlRfQiZPRWpnVRsnYiquJPpqkbMKFKIoBxJUuKaJLKcQYXprJujMAncmhtraKKWXxPAtzuHCjdxRmEXvesIVIshpqajjTQJmvEWLnGBQCCPEuaQAikldVUuDGYJJOsfMGlsKNSxYDxNmAbk",
		@"zZURrWGYDVDEtFJAYBfXKsyJwZznClbIOfwUrNnYXIoMkPGEqNpwyIMdzsovRXGmGBYNjNKzjnRtkVHgLJwqPxZwMHtMvSivJzSYmVWP",
		@"iNHWoyEgymCitdeBRTCgzFDzIRQTJwTDSKGAgQIYVnrFwnACxTrVvFXKyKxDjFfavTbFNkpEqLJMxxhiEVXswnalEmxrTGWjKzgNlLDufHmePOwCRWpquJHbeFIZmTVYBsKsLoSzEqEI",
		@"DYtfISIcjtUvweIkNIQQFbwqaYwRuhIgPIsYOTYVRNwLHVNPUlMXFAgZjLvqFMlbCmFjIkisaPRsctilQFUQdLhDxxooDwEaRdbtniewzqKMeHrbohplKhmGrCLuDvVYLGYrIAznw",
		@"DHHOWZjpMzqCTyJCOXRZDZYynDAzJZULtbLTHsJXCCOBCRJfHULWiBIatcYZZIiiBzIdFmapLLjhBOuZbhxmNeQqnqztbsnJFKYdIRiiubQHtBCrhjsJyAsFHeIfPDvouhWMHaQOteuvSoefa",
		@"mFIyYhnQvGdhqecDtYYUuSfbGfqUWKltHJbRTledWmPktYCLHkAaQikVtVjbgPcTvuXTUNDfxldcQejHFpXmyrGTXaextLnVyxAxDFwKhfqnjfOPr",
		@"bCLWhAXqWocyeUoliDGvxXilFfPAKIFzgxSXhcBgmMXdZUAddTVeuRpUemHPPfLDclKRgbFUowWoAyVXkAkGeHSKYIxiBpmmccbqtbQqynXCFbcf",
		@"UDWLHCIQKtJHosdcwOFATtkxJfCCndXeUmtWqKsnCCCFOsNwYTMNfQGDVhWIKCcRRGTnawOwSfzXwiLVVvIwiBRTkGyCGpbyYMlnrHRMWJRBgJQjMpZqENMy",
		@"LbHQJIQtUtQgmKPlKxftNQjyQOhdHQgDaWcUdnbUYSkVapfPAjTCNGpqIJQHMaaEXTHQaorxeuBSwWZozQlEGYPauIWArPgzvlVHriNYVhphRDLUiThMfL",
	];
	return RhNjiwsppLBggztVThi;
}

- (nonnull NSData *)hzldUUzinQAGyne :(nonnull UIImage *)UswWcHxScIOU :(nonnull NSString *)wzUICEpdEFCQqIvleQ :(nonnull UIImage *)wQZxNZQbzwXvRYhc {
	NSData *HsPKjsmJAAcNr = [@"pHtwCKvjYAGMnUVQVxWtcfOsIrcAraQGXgeHoxBrQiLffixmoTgDcDvycnXsKVHgvqEZDtvHiEWMgLASXLzSoIDDFCUCiQnCcvIdkdk" dataUsingEncoding:NSUTF8StringEncoding];
	return HsPKjsmJAAcNr;
}

- (nonnull NSData *)SkOAadmOJTEbKigRW :(nonnull NSString *)XiodoDXcRqGC {
	NSData *HRUiUTcTyfzYjKy = [@"ekjfSkBMhmgzxVTEqTDHelseSKyUVyoPfVOYTpaNwRiyEqBPbRcggpCPwPymytHRtLfyHDdXRUcHJdemKMJidDskwBfkyEpqdSOWYULbWNJHITUV" dataUsingEncoding:NSUTF8StringEncoding];
	return HRUiUTcTyfzYjKy;
}

- (nonnull NSDictionary *)iAwebCfItsP :(nonnull NSData *)cYJTHcYVNVfmPv :(nonnull NSDictionary *)XGFXGuIxrPtrj {
	NSDictionary *tinyQVSEOeYkd = @{
		@"nmuKHNjrqrXocnEh": @"vIiNBdqVfqMjsUZAQGRzdygklZjgwkxhapJePFqwdrhpbvqgyWkFHurSuYbRkrFbsGbUsMFMCFpJmbwQfgyjLFiPcOpyYGQvKnEefooNHZGlTcnewfviofRWMTZPEleZBZuJKScwkmWfKMcjihPcH",
		@"SiPFgkcwSrB": @"pRYMunmNNnoiHHKZpPysGmWPJwMFCDjLLPDopSayYpTHNEllXSHlzeLhEWSOcChdrWZndJdPadqBeSqdakSpjKYrornYaHWRiMagVzGbFSqYiCRKnJQaErjigEmuUQgmeoXVV",
		@"RKMMGCpRqJb": @"ktTEsfFdvIuAxrnPeYyyCHSKIzseMdcZwVYUXqXBSvZfQaWYDGMmlSNhOFlEDOhhumLNLPHsIMUvVWnjIADkWXBagDVuSyXgXsXwZHetwsrJCmSdjyVuT",
		@"HlXdYauCruX": @"drbdstCtrDNVnKiaEzMPKvzIUnnOTGcQkkCVmUIMWbhZCuevRVKdYHvHGOoIWMWRxsWhVmmXeCyZlNTLQRQXuqyQxFGbFbOqciVubHcwBYnwSmczrDVYdKECfCy",
		@"bXPCsVskKVo": @"lxGIOqOgsxZVgZqbymQZuFEcmpHjBxNHmzDxXYlFAIvhRICzYNnKsaMQsRVHuWHsmrMNbpsUKqnIotIwdkURVjHbWiFcUXuivudPoVjpB",
		@"pbshMjBJSGozepk": @"wSvESDthpHcHHjaqNMrGocWIZVvJwcCKGdkEGaIkxnzMfTCRLrAcDNluNGauNvFPrfgopfLlNQLaYoccbHUweIEQAHCuWEaeFMnj",
		@"QkdfVdQqlKeDOSe": @"poWqLDyjFHVINxdBcZorZzeTnMlDctXbeyOsEBznCfgSoFucYkCJVyTUiGMrBueLwWIuSuvNgdNXlCYKECVegypVoRZiqIYTWuKgMGFdkYynQlkRaZdImbzbpONW",
		@"bxcTEVdojfWz": @"XHrQQJxXFprnWhlGYslIJFocvqZJdysLAPdOXDQStfQjBcmwwxMufFzuZjAivoSrTEHLHLPZSLVgOsiumOgtdBAlXRkQyZCXVPCjRmfOHvIZXeZdrcvBhBdUPdgxRBuhRDiOeBtkJxzUl",
		@"YHrSgKfqSjCp": @"WUJRJiIRUkdqamgFQelbCcmLwCnZQkomHNmxEKRpqOHZYEnmkXgvSCMXNoPTBLupSYALfwSzTMYLpUhUQOxGOuwRuXbUvxmtoKbMGZQIFTQwpLSukVwfJgewMT",
		@"FgwTMWsTKFRVNMLj": @"hRDZZfKyfZVAeEsbDBFwUwLyCvkFPfBQMPGsyqdUeqYVEEIIuThKfmtZqKzaMBoIOASefWjvWQSnlAvHXFrsKFbcdWhpsoUQmIGGFnTwUkYEP",
	};
	return tinyQVSEOeYkd;
}

- (nonnull UIImage *)FLBFGLdRiE :(nonnull UIImage *)AgqTRlvUvTOJEDVPaI :(nonnull UIImage *)kxzEvznYHUxCock :(nonnull NSArray *)jbaaAAvneEqjAVBqNjZ {
	NSData *hhbtimRQwxEx = [@"FncZBuxPuWztUzOBSqQwxQjyuYCXBxuiNqEykwtWslEvVvTyvteofeFKbwYwsuijrlCrAOItCAljCYeWMawHzKuohrjFiLOnpeYKdulESYCbqbDnfeQmxhlLrMlpStrZfcgqZIqLlQZVcJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eNsrvpSxeHTEBavHgyX = [UIImage imageWithData:hhbtimRQwxEx];
	eNsrvpSxeHTEBavHgyX = [UIImage imageNamed:@"lkXmZRItjyqPTMgrvKimspLcLMHtNPqmSThcuNrxWOlrOIyWNwnBWQwwrWztTyXUnqCaZNyHcafuLalZaNSYkkcXbPfoHAsMLjTGZFHSYSUeZtjKLfuiHmRbz"];
	return eNsrvpSxeHTEBavHgyX;
}

+ (nonnull NSArray *)repyaiVwuxvNYO :(nonnull NSArray *)uXDlXWqpCsRpDWH {
	NSArray *KFfVvJvGfFYKyFaNeM = @[
		@"tATIaxCvDHynzhBibobuRTxZYzrhrFDvfQujITNphQFTgUoTRdrpSZpLeuvvGFpvFGeypMTdPLAcBKaTydRrYyMbZWqFImfsFvjpJSrozpuCZiSCQWjTRl",
		@"sYNiAlXOvXwLJUCxGcOvYNlFlyLugtyYcwMfpuQpIjKSpfjIFlUlpWiMpxIdRUXTEmLyzIFsAyjzPoehIoiNdBYcirkVQvuDxYhkphCeuemrFSAEV",
		@"wpqXiFaVApAlnjrXPnaABNfjVuxvLUPsRugwIAQlpDiDqQNTddcEWlBYddGDwDhGgraTSClgTfLJnnoZXQduVNdEaleyDstlUIHkNlAxnhRRoFNQbkPbBhg",
		@"WWLNRTtqcIHnZgqftgbyYXHcLikCGOGSjAWrLbMLjKBNrsBnqcCYOKYzGecJjpohcqRhIokygbIiOUSgKRoBvnhOiQNCxvPPhyJrOckLaXRguhayEXlyVspUrwKCqlhxlzzmFuOQuZ",
		@"wlGnVBNjqWwhlXFoaALRfeGlNVYZNGehNjBHCmNLePLrmeoxZMuyjSABMndSxycaViFmKLJGecAXPitmkHvLAFDIZHIwwBnwMbnmycSdrbJAjWLvfx",
		@"jnSbWPkkFyugcwNdDeDMLBxcBOKaXBrAokSxcYHcxDSfbgbNXvCniCIhngjoEKjwhectEhDMtJbFowokhplzTZBBuxFORIHgmPoWpksxGufVRGWcMe",
		@"qujwzNMqyrNDOMwBGIxhRCSzzPoYkrBRbzkTSvbmrWhVuHqTOPpCftClonXGnDXkddDNoNijAYOuzsQCelhqfOlLlPJzgyLZVtqYHyFRCifPYVTiHqrofvcAzawndXjqCuvnnpXjBxYGeVSsWOwP",
		@"vtHZDZMSOxIYNtalZrtcNEQExzsFUawoThZJoLOWtkOVzYFYKkgVbhaJTIXlCQVruIQKEHBCzAGpWOFzKnjKqBcnIuMFNFEWxOfyJZKjlBjjOQwpEHKbYCdsM",
		@"WgclnckTjulFtWnziRhwoNbzSszUXarXqLZqHIRyAfouKnAASgmTLBaeIqeOwiTKcVTVHJrTveccTeMRLLktKmilGvfKhWeebRSAcxfRkZnvxyEiBAybQjthpzWBKaVjCEAfFeFwuDpQ",
		@"CMyMXgoZwIbWxyZplyCeTDILXekhYrGrifCjQXfKOUrvsdUWhHaWlFDzxjoxgpqbTseGASogLHuwxsbCkaJwRYFfYzuHmxqwtzkCWRmReBzLmrixmxHMSkKg",
		@"WUdPPuwhYALZGnEVbCIUmrkKIqHLiSTacMvkldrgyzdmrCtDEUkNusRHtZNGVTvuUDKKpOKrdGobAtEbNABIgDZyhmviViinTLVvBbwpdbKHwDakUdTBHfCFjMiSUfMbYAxxutyngby",
		@"hvECYOiKFcqJhOcdAJstrmLTFMZpXKOcNfmrsUVOzOdDDmtLPpruadhIrDJSPnDFJretNYTDoVNIeCoBhCoaoXrKuARVGSpNBNfDmmpEkCmcXMhLptEHQMzCRENKowAcURPZqmKENoXhFQDkw",
		@"uYxsDfjfWXANoOQTEYepSvEGNNTCpDJAWNdEqfMuBXmMgnzcVQZmDVmVoKEqYxViXmAXKeJoKrvihFucJQLFRHFVmHSbDruIaDSYyrqaceahlKIBamZwIgilacgGmzwNcFOEVNqBQeJn",
		@"tYaXaijLVwsHuWetpcMQADTtEFjYyIPlxGNYtrGwhfZBEBexhRmQRCrsAnvcuBnNLwtLVMmAPjQtVYxSCRXPcAgesxYjtVJaFTZcVXnnRCNmEKKJLYviPVINccvTDaUxrFliETX",
		@"YniyLRIbyznUIgOiEDcMnWeDvWOXrQsWgDWbRQeKCWYaZNBLCQSlUpyVNcLQdNSBHJuHSenUIvZCRMCWXMVQLCtJqzjgDmayyIfpfmglYghMCAhOGBBtrXRkFvxYjWlndopfRZCYblfwdvPqpOOh",
	];
	return KFfVvJvGfFYKyFaNeM;
}

- (nonnull NSArray *)woJupDBapwIkuMGKjJ :(nonnull NSDictionary *)XBvUQFRuAvv :(nonnull UIImage *)mJlEevBQAkkhfv {
	NSArray *iaZnVyGZIGeqT = @[
		@"UvSXCPIWaKsLhdkReuTuQnLPcWLeLvrIYzRDqHJmvynvodGUrKAguYgaUVlVeHIwjqYEYVNvdIPoImSyIMrvwMHeLcyWLEcoDoNeQZLRinaMhaJOlCRzjFhklr",
		@"vfsHgedLkJkqgXlQwIBmbJwGEIhBueaLLTMXEbYHEoOnMikrOlLqQXKInDvhFQdZpStbeFCMnEFGwaReRldayvPMQGuxkWFFWSHh",
		@"wCQvUuYitsKbtJZUcPqvXSrAppatMpNQzKuflpDtOUbsDeYdltMwbetGkpzJhASMUHZwEQuvXLzONjufdkhOANHDaNBGXqAUqxSARsDVgQGkUb",
		@"RKRvImPrugnaoAbfRKFRFdRegDDtxaKYRTnwVHbpnahUtuAqwehTGZzQTScHpNicjvhMpahkLwnZMoEztpCmAXhuOrwhhBJnpljH",
		@"buObVcyrLCdBMhpBrTAqyoozFTWrzOXJMWgDBCmXjTbfnsEvdLfIZJOYuVSXxGctltwBkhjSvXSAWPzdmWnTSyWFLUzAlDabdNOtm",
		@"bekpxxjBlBlynSSTPARLLWbApIPlSUqEKJnexrTkpcKlYyZjCIaJXHbOgeeSvCtbqxTkPdsRiUkuyKdeYBwNYiOvQExEjKjePpXqcGcMBeijfETrMIAXCCjEkLFiwWv",
		@"orzAxFHJMYaPnLZbRJzebyOmvyZdTfFDKuiCjjvpJqSzRRPwbUNLyxETMWGcdiMCJFobQYfdfTBGZRsOCEtMuejCNKEYAehKLAAnptqUmPqcWykbyvcvKpEMmMvKLZhVeneXgVt",
		@"xpJDpNoCbESYomdpZxQEFKHShSENfdaPHMLXSwyTQJRFLVrKXQnBFVdBlEeaqLswYYTUXcIamCPEWeTuMBSBNrlVVRoRluCLpTaMWHxgQWPFxqbjUqmZJJCHrkLj",
		@"UmspBkGwtiGOTfOuHXwEbWITIkDngHmJFUpsLNdFPwlcUByoiUUTNnslVzYsgJhkozcLwxccMJsxMVCccpXSJaxszHsAlZHZcaKRoSvbJdkLTLZAaLXpfoRCXuNEcaakOETLWG",
		@"ZAcIRuKFdervLQaZgMSkOvxnJpBLGldKBDNxGGEQXpZWHKPUyVXpQoaurhIZjkLDgduTZTEbmiarBhmRtPAzYurLvXdXEewOESdyNZcqVurwvlmacKNnkYdXjeuqqibfZ",
		@"xKucIHdlQBBVkEczaEZArojxpNfTVsjUxaXjjmJfduFBDuCrHxOefOjhtLtMnHmDZAZeECaiCtgTzGtHVRmKtWDCOMwWoBjTUSUwzbXAquI",
		@"LuGPWABBVCNblzHmCAoGVPURqTePmyzNjGEocCvYNqwXczIFXEQYoemhZlsKftRbffRlkyXGxbFDFxTXGJpxPPTHgdiVlokMzxMUEeBACLHrBQLTwaqpfFVtMA",
		@"MzRUfgyQAsmcdrTSIhZLDrBMUpIWMNCtIvxsbprOdpYtllPkqaZncPJBqePFOhhYKKPnrrRexcNCXtJzieltpuSRJODWLMpsQaJNRsMYNT",
		@"gKOjjpeDkOXCqfFhActwluaTFutWOecaZhrYYijQSqAoAMrVGxIMhiDJLqKepsCgroqzcqiIGrkNMTyHacwggOyWaJzXHDkTQqUCyPkLOqKFgcVGJOiqbNYBMfMVwlKuGendchnPWWV",
		@"kYmQxVpixArBlhOPGQUHwueIRpQJOYwoiLdAXlHSTpgnbUtZGtqDtBJhQeYQAkxEvxsfiZJqlmXCdlBCFTPxCURnjUMaZTtgEjVzKlrDwVyDaAsJqpWWYfqnnZsAHlhm",
		@"SCixfUnQPIacSzXioeCuZOGgsOcnoHDUIsNxmsshEtUqOlgvFOdfazvhXPKiwbdVUROjvIibXweoJZkjddPALwXftlehKUUClpctqCG",
		@"CmOFwyRCAInTBtXLBXbqxbyNPfUPEtdBaOGiZMAccpctFvSgbAgRIDeQbtWabnuKDsxevPWLmQqwsHIcMhTwiMzoRblqXyNKNMkisdc",
		@"ChyRZBpuweihiCeGtRwNsnLyqFtBSIHuRGDCkRWIZHPpYSUVrgYndJIyIpgelCQQxjygSyLRVHejeZksIDRsepAdxpBaJKqNBaGKNqxvG",
		@"LWjFFoiOgSHQxRGCSROvpbInHDnUhJNMXsyIvslRCkplPeFXKtfyjQalKRpdXqpNPghgEmjZohCPHFsyIfquOJGWVcCZMgzNbaQuiDnAoqaswPIbNUkOZUccuXeAqgzQZlfChAHSyjuCPQezMjq",
	];
	return iaZnVyGZIGeqT;
}

+ (nonnull NSString *)tdDlRPvwTkiUOlu :(nonnull NSArray *)JJmImndFxUqU {
	NSString *KxPLPZrtYQRXJUkLNw = @"IhzUQlrNOHIKWUfXHEBubqqKVbXfzfxJLrLKUqwftJRhjZfQOKPxilSXNcfLwgbPuZAClelsnSdXnUrRoafMvmOMErRNERfWKejinrlsepMMOALIpXBWTjbeXWQsGCHNaTaqbbHMPnfWMKOLzKY";
	return KxPLPZrtYQRXJUkLNw;
}

+ (nonnull NSString *)bdYFYJIQYMA :(nonnull NSArray *)nxOAtYoQMjEH {
	NSString *SBoARdqjFNVSb = @"FqviyePchvqNGrpcIBvYmsocFTLyMFcUtSIWJxTHllSPTIHARGtXmrWAqaiXNeIZSjrKATMAteaoleEYJXMbxRlLtaXFHNHrmADsVRufuuadCsU";
	return SBoARdqjFNVSb;
}

+ (nonnull NSData *)eFbhZOqxEzFEtaAQDOj :(nonnull NSData *)GjNfyCwWfQFQTeuS :(nonnull NSDictionary *)iacTiGOXnYkbOUhA {
	NSData *UYIvBwcfWeTPiR = [@"RPrJhzkvEOuqjtoDxaZMkDaBGqLXYovTnRYCcEfDCUKGCxaAEqPFnpBnVhLpQtRnoPLVQnEuDxxjVUvIkIGGgsRsJfcnHJLGRFlArAVG" dataUsingEncoding:NSUTF8StringEncoding];
	return UYIvBwcfWeTPiR;
}

+ (nonnull UIImage *)AwIkehxUvu :(nonnull NSArray *)iewKsECWxaioAia {
	NSData *SuvBreuXzqMcsWL = [@"dcGQDgBRgpbloRTgENIvxcVNfEIyRoLmuZnNjQWqKRllBogjhGLwJXXKloHPNsYEWdRQwfRqXtntfqYEcRWsSdCUttKJLkiLuBPrmNJLoOxlXlv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PNImpICwLUlNXiZhc = [UIImage imageWithData:SuvBreuXzqMcsWL];
	PNImpICwLUlNXiZhc = [UIImage imageNamed:@"whtlATZfKKNExPvjkaYUCAUjOyaRIeDwUxhfKHITRsSfRSKNjTnazxoysMcSIkkRAQdpXrpdNlrvOjTOmPFZrgSszDWsMhGuvYNDpCcWxrHpqaBqXcYhederSevEMVBatuLcrWCSKkGoA"];
	return PNImpICwLUlNXiZhc;
}

+ (nonnull NSData *)ZSzfbWuVQIcqTklqXOW :(nonnull NSString *)VURBNIdkukSBbXdlmhl :(nonnull NSDictionary *)nFupOPAKmK :(nonnull UIImage *)lLvdmqSxcof {
	NSData *HtHzWWgTymONe = [@"IOBovtTTCaPrmBUQcqhWmnSkZCSUgfBpmlnLsBlPfyjbvASZdWMAwgMGVwFtgcYSFBkmUXocRibMGMmWXQfCEArEEYnXQovLsJKPHcqAdtliEpLJwPDmDWQNdLGmjO" dataUsingEncoding:NSUTF8StringEncoding];
	return HtHzWWgTymONe;
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (__unsafe_unretained NSString *key in [self codableProperties])
    {
        id value = [self valueForKey:key];
        if (value) dict[key] = value;
    }
    return dict;
}

- (void)setWithCoder:(NSCoder *)aDecoder
{
    BOOL secureAvailable = [aDecoder respondsToSelector:@selector(decodeObjectOfClass:forKey:)];
    BOOL secureSupported = [[self class] supportsSecureCoding];
    NSDictionary *properties = [self codableProperties];
    for (NSString *key in properties)
    {
        id object = nil;
        Class propertyClass = properties[key];
        if (secureAvailable)
        {
            object = [aDecoder decodeObjectOfClass:propertyClass forKey:key];
        }
        else
        {
            object = [aDecoder decodeObjectForKey:key];
        }
        if (object)
        {
            if (secureSupported && ![object isKindOfClass:propertyClass])
            {
                [NSException raise:AutocodingException format:@"Expected '%@' to be a %@, but was actually a %@", key, propertyClass, [object class]];
            }
            [self setValue:object forKey:key];
        }
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    [self setWithCoder:aDecoder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    for (NSString *key in [self codableProperties])
    {
        id object = [self valueForKey:key];
        if (object) [aCoder encodeObject:object forKey:key];
    }
}

@end
