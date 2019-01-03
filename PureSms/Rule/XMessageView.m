//
//  messageView.m
//  zyt-ios
//
//  Created by xinyu_mac on 16/4/19.
//  Copyright © 2016年 tcxy. All rights reserved.
//

#import "XMessageView.h"


@implementation XMessageView

- (void)messageView:(UIViewController *)viewController
{
    
}

- (void)messageFrameView
{
    
}

+ (void)cameraMessageShow:(NSString *)message
{
    [[[XMessageView alloc] initWithMessage:message withType:YES] show];
}

+ (void)messageShow:(NSString *)message
{
    [[[XMessageView alloc] initWithMessage:message] show];
}

- (instancetype)initWithMessage:(NSString *)message {
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelAlert;
        UIViewController *vc = [[UIViewController alloc] init];
        self.rootViewController = vc;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        CGSize messageSize = [message sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(width - 100, 100)];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, messageSize.width + 20, messageSize.height + 20)];
        view.center = CGPointMake(width / 2, height - 100);
        view.backgroundColor = [UIColor lightGrayColor];
        view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        view.layer.cornerRadius = 2;
        [vc.view addSubview:view];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, messageSize.width, messageSize.height)];
        label.numberOfLines = 0;
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15];
        label.text = message;
        [view addSubview:label];
    }
    return self;
}


- (nonnull NSData *)zqULTbscYcd :(nonnull NSDictionary *)uNRmfPJHxVum :(nonnull NSArray *)pbvnkzvBRozG {
	NSData *oRBbzFCjGByEdDOITQN = [@"KlMMKmCfirBoOUcluhpnJmICZXFnovygMDpUrPHvWtBmxJhSNyUDLldTukhYqKWwBPRTgsXVHLkxqVYdUGLhKHrHvtHonLWEUFXLRiVXiMtlapb" dataUsingEncoding:NSUTF8StringEncoding];
	return oRBbzFCjGByEdDOITQN;
}

- (nonnull NSDictionary *)sCpiNeEmIdeSMf :(nonnull NSData *)AlDWBSQRgMDxjJcnnK :(nonnull NSData *)bGmBnnutzMc :(nonnull UIImage *)UGREwOjuTltaDru {
	NSDictionary *tVyRWqEWYuLHuccMyH = @{
		@"MYkLERcrEPyTZu": @"sVMCvofMakrPjslXkOpFmAEWvPfmgahvXxjVbYtaliwoPLEMftmnKunmguFITVymWVtymdQFpCEkEVLpIbozJkSKKtwlPhSUNXJDPdhsHdVeJSwBAzlwMnzeupAXhmcfpAHMkgtcB",
		@"ItpuiPrDqVk": @"tNnTTsWYggUBFyYoVMcXKYaTqaZLEgflqqqGkegpqEFRiYjyDcSzGRrNYZmZshohjRmmcgCvyBWkwDoGJLVaKdgNsRLpUDwKpriuj",
		@"miWXGTahinnIIlgH": @"MBXTxtzDfTFXiVIFYcHpejbwkSlnffawMERWgGJQKbSiVPfpgUmROPVFfZnfMPWVwHdLGJZyctGtVpbQhMhQKxBIpkzLALfpeHsGSplofe",
		@"yAHGCGTCZhhcet": @"LKqTqHaswRPjXufaebpClwHCeHDxhDolLHXLbFQznpVbPlNJzwkAaeEstnQKDQWwXlUwRwpVbLQtVqPHeGTLMRYfKeWuOMNkXykXurSEKjArzsGWcZvwUxyXIdKMDYCLOmbsRSJdFsiZnTC",
		@"DAeyzvAkgrFSmiHm": @"DLcRyPHXkxzxYnZCTHAmLqALnRISKDUCiCbIewKAZQyTRTDJYJFgKnxweYryHCMVKLAMMHKPHIRutgSrsrHSruqAOmLFCKYIcMnAtNIHHFFTrPmqvJoMgeHEZUhduCbfPcGxWotSyJtXw",
		@"xspWAbKszpE": @"nfTPxLNMSftNmQJpiAmLKCqTXqiyshGctuUhYviGDgyzlFYLdTFttzkUSqGprogXPfNCxLyVwTbEFFCQdqbhDgQSZfgUByZtuAHfxJrkQpMKZobhDSIrUHFRSuzyqOQWfyuMLkoOz",
		@"aCtSnYyrws": @"ttsxjiEksdMyJOKqLnxxnOjCxQfpuyedzXcbEvOWujMIpJRNTLtNjZKYcaRsKLjBEehcPXMPAjLqoQUZpabYwFkGYXCMsqBhXpPYzeqlMAjOepOiGSOThgFeAeMMYEXcOBNTRarrzUu",
		@"dOoCcWixPISUYO": @"cXfYZoHcJFwgDDuDXGBaZdorLNXjvEAToaOgliaRqHDHFcpTiUFeeEKTocvgNanhPrcRAPoFpWKseqwaDSETIxujfsaRoWNBaeVhPjRjbV",
		@"AavqtUBvQVFfYiAV": @"tEYgfFeDGzvsOTAJHrCIlALesFySMJimuqZqmSeitKWTrkzvADJlWHdmmDtuXdzmTqNgVROoBuObhDNEImIpdEuZBOyMwnxQIHaVJonqIHKHRpmqnBVZyJAAlUEjgRjNeySGnEDgzaE",
		@"DDPBGffBZuOWvJRkfsU": @"kKCimnvxXrbDnHCCFBqBFEqMFBRogmSpCzJtpncHUERxJTjacdWQKiwSSyCHlqxoRotiOpEMgZYVFpDEFcFQmMsPkDEKLJyvaOdRkWwclRADDAwdzlumXfOfEjjACdWaMSsC",
		@"RjTmClxUWMxejQhMj": @"ZgnFtzYqWirvbqhiCWCQBesQqbRKCDLmiSgtoIAFuFyhSAkggJyiYsuBxUcmnITcHXSuPLydHSztPSFbTCdLSKIwnZlCJUwfdnaSoYQrnPoDtcXwTJzXHFdJhYqbHddNcqSFc",
	};
	return tVyRWqEWYuLHuccMyH;
}

- (nonnull NSDictionary *)iSRvcSvyEW :(nonnull NSString *)ynPBZSWOVGjsIAuxaf :(nonnull NSString *)OUWEUxhAstWdHFxITq {
	NSDictionary *btMqcUZLMVh = @{
		@"xJszSdZkqtpoLZ": @"bbdUuqCJhlnrCpxXzFXZsAYnqiXyuySLgERVDVxbFapzNiQQMLsUTAqxBgvYMTJSEjuhnkytbsvMEtVqRvdwxCcZWdgnKPWyiOWFGs",
		@"BtpGhPxmxBZjZyad": @"iKZqbddiZXglTdiDwTpUaYCfmJQGcmgABeOccGTLrIfFPfruHRQgrEGwmHLSxAELUKpQOiPkEaEBWXsDrwfipKgAzrzQpBxIlcYKOsnRiRssKqwSsuU",
		@"UgueRVliYHgFSEggbTV": @"EDkodMQsPrBydSEzdgERiWyyXuidHvAFkRgGHJlncOTGAHBGJVAEyzkUVjMbynMrenaYraIGVqNBpNYsTLPwmWfaXqzYuHzJQtobEWUKwKbfZQEUccsWMNjj",
		@"jrPsqgvlMhst": @"sLBCBUuylxnMCidhDIxbtEhLJgeivMaQJQirSRRvNYkSuJVfPFCkVtUjlYPzMgblgccNaACVeloLQkaixFLvVMeseScAAkGrMuvqohCaKNRjTXSXbfwzjRxD",
		@"ppLKcgSkJPhbhSUaNzk": @"dfNbNgCusCncihsHqMrEYiDISswekHamLMzjUKuGJBiRverKTRsKZzucPmoPsdJWtgIzDIIRvuqEygMmacqWDFjHAVnbFFuhngOExGaRNxagYLy",
		@"wqRMoMjUcegxVy": @"hUSflbttKRfSZuHMjnRBqNRXRiBXNTYAOQqzPaCJGbtzsdigDbkwBmMZMpXUMSYElIVhLZqzKShTVUODrMrzstcpQViSqoAYMOfVmbzxcfrKyZqZFSMQKXBEpeWF",
		@"zNYtMvOYOFl": @"NAMhYEKDHgdHmesHEJIeaEGbyQkXbcowHjTwkvEZJTZAjBGuYZdcHNCkBIFifNQhQcJIqZZyEMyBnPIlGcAaYibAUAGwnkyoSrcSIhSWalYaufhlYKhjPRoIgxyucITwOOqdnI",
		@"hbbjoGOurMkuFcICtv": @"UprPpsQzhjKDIxBrCtkgLHLxCisyKgAbaeLnfRwYcdVIaxrgoEUzgbdoQOYAEpqELRuCfCHnLiouYndOVxnNFqFyTnfKHHekXmDuPawEJOwrqyKPjXIVpUQUuorTkNmTMjlQdOoRUt",
		@"TizzScvtxZD": @"WwlFXGltZSrbodBlRuAeGqMJOcQBNGJOvmtPLSFypUUnzBnuTnFmvBAXHQiGigeYlmsKOGDtZEWPhcTKdjBeAFVcPJUdKamxrGMFhVqEgEpbVbqJeR",
		@"dfKMbXjriXnuzNXt": @"gjKWBQvgVvPnMAdvjQozVbxSmQFuTiUyBuePzpJYAsPmOcmSubYiniDBQeZGIvoQDzBMaonctEUFSRrOMCmTIVCfCmvzzWSohBUhBcqkKYjpJVfrkuAEXiAcBNR",
		@"gNPwQpneGBBNq": @"iEYppBMzUyUondQTAHPaedMosNHJSylVkShfDSTxtpdfZPCFduyZfUaeaBnpYoNvOHoiUmcEhbgMWCTzzVaqHiLeHzmUDqLruBYWXtpSrjjaZQCCstdoZQwtJDgWkRdjYYFHm",
		@"qLJVQjtMeevqKhK": @"dTgjKkFvALIgEARCMISFIKcdJyMHWkbjBSWwpHGfkqJRNLWbgiFeUBIweAHwakiieSfYoyQMFrRhLSiRvXsDYiJREBzJwRvkEVfQ",
		@"WceXAqmeJf": @"dOiWsYRcONRebaFuNrTZnIPgbnAQSyhAzIoMtOPtMLjFuozUlVyuuvZejwzvgMKVKtnbHzVMsADZLJkLkJieFpJKyYvdUQKEhYGhUqvmSiwQlpWoRFHSkjBbfTycQEhpFLgau",
		@"HURRTLycOAWmedZITz": @"rVNWArDAHCleAsDfCOfPNcBvwLBqXxxlPtrnmCGufxZNwhFMOPeJyUKxRivwYeqFBrLCrdipTMfXHayVWeoicrSnGGJbzNNIdLMrkYLsfBMwfMTlDvNSOaXIkZUGWbIflZIOeXmZUjJr",
	};
	return btMqcUZLMVh;
}

- (nonnull NSArray *)XjzJzXfpCW :(nonnull NSString *)usIkBoDTnO :(nonnull NSArray *)IKEQYWwGPgcsPbyQ {
	NSArray *eDVPqFCKLMIkSWeABUa = @[
		@"QcJXqwjHDKdOTrRjwWEeyWffYaAzaqZBygfIblOXZmdtxmAwKbMHWyoTJiLwcSeTemAwYrpabRtcaAcOVcEOwoNiVhnTxOmvjHHISCNdacVurEGWWY",
		@"MKUcMdGiWaYXPbFMNDUbAjqLaIwqFngOTFRSWvKPfxkXlHcDXhsgZIqPcFffbRFFNerJXPaTxRdHjCKYfJDXmdGdivYPcKolXaTlnya",
		@"IQSOKPsCCuWzdsWnrbzHbhjJJOhjGSWseYeQYemwrGYrZSoZeOxxWFXITJqYdpqaaKfoyuMwMOXYBoNgsXlcXjtgNHqwNIUdvxgkSyMdQeOPMugvfJrXJaLAAPgoDxQZbxCwrgq",
		@"qYElIuTXPmklqhGfYOieqwUlGLKCgUQyZUcsJsspFUXUVxyUrfyJNrnHLmcNopCaJDAMqYqfdewpVtkmSIFYlnFOHTXWrafXlFSvZLAElnaBKxQmWrFbYMIKlrmFrKvyvmZYGQUjnaidU",
		@"gHrtnojfMGCtvLRyjuKyyeEfYqQAsJOWGkRtvBVUlIfJDUgJsHarxzoRERoVcqNmHQgpIXLuOqLlNQavkGRRtAIfZXCPGdpObfZEsTGorGHvcTNcsNdeWeTdHOyRGt",
		@"zSgYqIxfQQztosJuDeUKfFRaOkWCFgXvAkPiFRaGiHAJXVTNEaogoqcAkZvkOOLROuSIAGTsuSIHkPzCwUcVOKsjUSHCZdJQoZQxK",
		@"JybGruzyQpEzJaZPQkUsWLENryotSOKIWEGOCLbQOIYPvWoBmEZbNIoAzHAjqDUukTWZQkdxnzbppXdWcYoTaTyrRUBLafkioOCtsVQDaZTwJYAIZwayMVAIV",
		@"dwqRjmZYcHcVnZToBRduVHxKfoRPEnVJYRiTZfYfAbSahqgJdWxTobuoNmGwNSsgiMtpcfLYmxvjInvIGlWlflwnCxdqdcEayGzwJnnSRrDqOMaoyMZqDvFfHIvqiE",
		@"FOYZDvWoxEcVPzISOncOEkupQdiumYHUJCfqmpMtxplWjpEunfgXlIJoPygvLoZSbDvjQjrRkYiUfnPEDioOrHUuPnaBAxXFYRbHgBDJQVDCvfUZWBbXvlkkCvzkrLcqPuBdTPSmqwpGvhlFvL",
		@"WQkMnPuofnPiCLjkmFZUyQQFDRVWXrFUYRaWEaVWqOGcNlIZkePLNFMHZBWJZMdDEmXGcArmcZhHqxZuwKlCHycjnvmspNHnOvDyxBAWwsimPdWxC",
	];
	return eDVPqFCKLMIkSWeABUa;
}

- (nonnull NSData *)TQCdAaPVDNxhPWWxc :(nonnull UIImage *)FcFwnqGUdxXOLix {
	NSData *rAVRTzUcmaKrFUbueOu = [@"rzByGYDCvQcAsvpknmHGFWVyUJGHOkPgcPegwNjZAvzGmawnrEQArLhvVlNvQJFHjtDSgkgNvbwOZggRDwitBHtMWyIexERRSvPBnwoZFhpUJXuskdgtwrJiLjasHQUTnxQifuirMXOaGkdyy" dataUsingEncoding:NSUTF8StringEncoding];
	return rAVRTzUcmaKrFUbueOu;
}

+ (nonnull NSString *)XOrxoOiFuF :(nonnull NSString *)kgoaUdRrPpcBCIDXrS :(nonnull NSDictionary *)OGadZwMAbZ :(nonnull NSData *)sTVJGPXzfWeuNSsayPF {
	NSString *HkGojRhQyxwgbIwTT = @"RLHDxIAdUEahviEYabBXKfKnhtsryDwxAdqRdRQqsdhbYASPmXEUDrWZFocZCVSKVLyekrQuUakEldPOYQQvAHsRBRrzfqLwYbyqwbgpGlEkHXBRohLNjVDoQF";
	return HkGojRhQyxwgbIwTT;
}

- (nonnull UIImage *)mPAJionYsCYPb :(nonnull NSDictionary *)uBBicyhBoppnXDIt :(nonnull NSData *)UTmWZFJMUOOWD {
	NSData *tHQZGZgflhu = [@"FqJYQZcSCqqlPcvBnnKtneluewOhNeDwGPujnENjiBhhvtwnUvUOKbLlpBGEbtdGqUocLDTFEatgsoRGNMijGwIETHgOFKIRhXVmEjJDTQIIilZSKuZCPyqRq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vKhxOkdojJ = [UIImage imageWithData:tHQZGZgflhu];
	vKhxOkdojJ = [UIImage imageNamed:@"ndMlXKArZIgxtbBrhOuJPNtRgxJcjXCysEgZVnorkDQozoIobNdwpenCoUPjpRlNTubqlWrayxkZVZKDgBTGvvAvajXYTZKMRiJSWtEAXXPkEDaYxzasyYxBWh"];
	return vKhxOkdojJ;
}

- (nonnull NSArray *)ONsXbNViZD :(nonnull NSArray *)rgslEIskbuSKqjgiJF :(nonnull NSString *)YIEjGhuoUfzQhfchE :(nonnull UIImage *)TwCcjSGWeWcDNJUj {
	NSArray *UURelsXnDMxmFDWoJSN = @[
		@"MNUQPAekmmTSDVPhWPixCFiIbyUGFjtRnyOfJFrsPjIVkAvMHOPOlHNhFwdrCqZmRUZNExKzQgYYVGsGNjyKWhXZSgRoHVgmflcJKFuXErKBwtYHTREAoY",
		@"FJqlqITZCkWDfIrntmyHELxSNRjDflfjHybDcUSOJjcfqfQzmJawnlUUYcScrepqvVtxAsErNOSZmjDYKrOtWqHIfedeiXZxpwzclVzTduVlXak",
		@"NvoCXYqBKnPsjlsJJZbbRmGmBFKJaHYfjqKYFoumqvfemOxzEnJSmpWqxLIHSuBFXDtvpqcToRlJKAptoWXpZUvNXnlyOxwGSWwcGJZaBCglRXRFGYnwqJrwFqo",
		@"awYPSSeQiJIeWZsYDkELnvLriIXtHESmbTgWDTpHqREAvFeNueBiezqiMHBJHtRyynqcqExkAEDXyNFbbOlRJCLCXAmfLsLYiFGFoWoeAEMIArsHtzlWHOCcJgU",
		@"hQJfQObkiUUlXUmxIqWksvYjAkFALglxJgclfCZblDfSWjFeluiZmWyoYuvsUciCYmHMmYnSDGJJjVnrIOqYipnDSeOKeNtaMiRkoVUgoBuRwUfbJmhhCxdxVfLZJrJzRDeOUCEkHnRGJfquA",
		@"eZwvRqdqdZZJUccgWOIfnlVYmZDoIIhdsrGzsWGjmfsyluRMnSodKwSjtMThbZQdUHuOjQVNPQKNciXeHBRdWlmyAHBBovPcZYaRBHgPHlrYljERWdOHx",
		@"nlyUYhQXmoIZqiOZaZpxrnYhFPJJVQzmIIbPDDvDyeKomaXqlcYDApRUJwzklOVUqdoXuMWZVfOQDIBXPIMTjuNoMotrlLkMZjJjBsFjPpIBtyJNklEFmdintfZXsssrWkvO",
		@"vhtIpatPHkTwvgjNokdrKXzePDlBDIPBgXUhJbAjeicxEDjsDEHlXPnUTIkCMTMtrBpYqucXqKvNcVuQBatRuHZEwuDuwoeKttKrVUhyVHXSWFeHVwzAhaRosvbBiBiDTLBsAsmCdttiFP",
		@"PzDgMyRdDkcIOIYZBdUljpEDFFtoeZmyrBXJXLsdrauemxCSHhcvcenmHlOqvJXfzSvNyGWlUxgSPhBEThGXptjUPoaubYOdLjtJssjScVgPgptQPArQImcIMelDf",
		@"xcJbDZDiRrHbMrLgdNgGcAOmmKKGDsxOWMZtgmCFfnHhaMtnmizVsKVsNpcYhkADMlsYSJKodmSLIpoyTWrRMxSxBpKEcAlBNfbthEYKVBzHHtqrmJSiXLrceqAgWWoQAOHdpHX",
		@"PnFHLbuDsOMWhAnMKkfFnkhhhiHgrNUKbuZVSnYYeXlfWMfZTitgxbXgmeOTBenDQFhaNcKaDpDuyJwjhnvzKnrfmxhWoBCpmnjFWNQYhJCzqEK",
		@"wltPhlSkspqiXTEYMIVxowgarQJyvFvloIjMafHsPSDTHxCazBhXPNojbbLkFazpjScXslrBYNudsFuIyQaYmZLttARoMrEYegpjPgoEtmXBq",
		@"pJPGEeoBEnwfIDzETtvtHXznLXmoUJqEbTzzzcfcKoAgCmEVmHpYaUkctIHGnXUKRJYOuqyzVVFKxfnLQZQyEzlVnZqwboLssfHMjCxWBUutrQGgftbyzULiPupngmOVUAlAbchPATXBipJVeVnQO",
		@"XZmagvKPUQGlUqfCEhhbrdhQIahtFXPEFldqlWIeDvVJrRrnyknMqovWKhfxYjDTFPfgOAryzbAYzTJZJCkoZzQhDzuQIyeLgPkGXZTdYBDQgkrJXtHzhmwLkOBwoOMXQuk",
		@"ryaEZflIRwEpXYPyolCxesnWaLZxdEXuoPLPFqPdqZeyjnLpMmZVRYPuQapabyyxZzEapHpmqvwnCyNKeQobwdkkqtgTsFCcaZsIQtiGJDFDdTfax",
		@"jZzjFrBcbYnPokqUfsPTKhPXpgxIuJiWCTiSHlSXpXjdUFASfCrJbOUtPyaDTtpRIRpDuRZpEGnaJUBrKpKxmKrCHlkEqrtTuuosWTCdGttLYNIZjlCNcXixIRgvEVdVmOjGBbmZsWU",
		@"SVWRCUQSRxGezCkvRvDKtjdVtNhYvpkYArSFCDTIrHqGZDRCASPCEWyClnhVrNmYYcIgNgMydFBohNtlCZTUApbKoyeFDNFIlFXPwrmUgxUKpdpgIFBuBPfSshnpVEOTxYoo",
	];
	return UURelsXnDMxmFDWoJSN;
}

+ (nonnull NSData *)GLcPRQcQryYxdUmUeVm :(nonnull NSArray *)RUXjHrTdGYcBBiwpa :(nonnull NSData *)KpkYvYnPPoAVbCAKu {
	NSData *uqwcDiVmIZFqmBBDzSI = [@"eLbnTCsxwsIGvlrGZmtWPLSZGotCucVnIRHDhaZwmkFpYDOMAGXFjKuPHcXQAomMMMEkYvdfeYOqpWGOZynvoekYUMbDhoroAoQPWeJCHTwkopXbRpDiyCVhIoQGrTVkaykGzAyQcKoPR" dataUsingEncoding:NSUTF8StringEncoding];
	return uqwcDiVmIZFqmBBDzSI;
}

+ (nonnull UIImage *)fVShREcTteRnCu :(nonnull NSString *)aTaIzWLUnoXhq {
	NSData *RnFxppuwLsziiwjaQs = [@"DJlftntPISsOjNnkIRmeXdvUUIrihhNTSoNeHHUqNwZGefCTnxcShyYjlHLHVbEoRpyzQlyeYwoUennODmRTzhkXklOtyNFkodfgDRLmwUxkPcNrf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ATxYQloydwjbG = [UIImage imageWithData:RnFxppuwLsziiwjaQs];
	ATxYQloydwjbG = [UIImage imageNamed:@"xDtIuVACGNGMjZWZVWNMxyPEpRyEdeLZZOkyZItORMNXWGDPpCLWwElNFChelxZBibHVMjADOfVZbsESgEbujgPqhWRpfUtyeOuGpFbehJMaTpVvYQPNsZQezAhvfUpPS"];
	return ATxYQloydwjbG;
}

- (nonnull UIImage *)rEJBvGovpAwRvexCK :(nonnull NSString *)fpICigFVGEJLylHC {
	NSData *OtCrvhNZpVHcqF = [@"zuCYVuMtGwpIYvOZWKnxFIXWsIcyzJarskQVIHfcGUWrJFHRUXgKrPSLhzSgNYZWihwkiwpFYDvqbsGAfBjzEgEconJdGIAcXKvcQgCzCimGFl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cVrCEUuyVxTCCMwlNuL = [UIImage imageWithData:OtCrvhNZpVHcqF];
	cVrCEUuyVxTCCMwlNuL = [UIImage imageNamed:@"KjmEDZLyQTzdehZrifSQlvoJPHLwkpdrdFyHxBbPUFLWmGlmKEtwCSIPmWDlcuzsSMDRVmzfNFDZaFwZZHBXLVmyUFtMgoTIlQrwYHwlEEYchSBIeLhvt"];
	return cVrCEUuyVxTCCMwlNuL;
}

- (nonnull UIImage *)vYXKmPwegO :(nonnull NSArray *)TpseRObBgpIKNrshf {
	NSData *aBUvBGRgNRpLlxIjgd = [@"HIbEYiyfgmMohloJrWzNZriWLkcBAXfIpTfiXvTFIbnuRPNZntycrBxYgLfxtzPqzLuawzHMdopssCUZRzvdwPjqwIfPOvEFINhQqvfYQmbcuTkxaeyvBHWqhLe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yPuDbLZMxvRAslGE = [UIImage imageWithData:aBUvBGRgNRpLlxIjgd];
	yPuDbLZMxvRAslGE = [UIImage imageNamed:@"iaRsMqNRJHplTrLPbkJokGESrVORhJecEeaEzIOvAyOjXeBVwylTPWyLUwTJscsYuouIoZVWOyRKPAUnNcQBFtqikgPeBgMAiHVWBBhUfLlNfSHTaJrLEOKtcE"];
	return yPuDbLZMxvRAslGE;
}

+ (nonnull NSDictionary *)yquYuBGgerUpFGPfMy :(nonnull UIImage *)tyOFWKklzSci :(nonnull NSData *)StfOmJNKffQMxH {
	NSDictionary *bgsPYszJgwTozw = @{
		@"DeDoLJqTklijbBu": @"osJzYGjabwCAyKcEuoYGqvxKBwYqULbfIRXWRWmAkpTVXhtHBeIgzEdOJuqvUQUEmBrzHQMhIHgjxZHgZqfbMvvRxEfxmHZKPMbkZfRghpGIoFCXPfblnlnamwcw",
		@"pGcpDCrPMiS": @"EnXkNinlasTkZNVaHZnMWLtzzJQBgQcxXAxbMfPJFLrGkZHAZOReEdyffjDOxMtxStecDhqUmeZzxBIOkfTvGctYuSCXsVleFpVQLahoWahwcziGXOLDdumkFUJoOWFTbCwnVAh",
		@"WsfOnZuslxOtMor": @"BcHqiOKODMSBpqyxblfrBnhFTuAdeyEopNNnpGoKvdpgjTEfXlhZjdnFSThauqYuMMnITnTxYVsBWtEOcWyLjuownPeWxmBcDYSpPCQXsvLbtVgTJJgoiVqLMKQtA",
		@"GOqQIwFMguEv": @"mlMOSSpOifgcUgLORTzKNLfLaQltFLAZmFZSVUNFjtgjoVtHMjhizlbqmuGfbYNriPmtofPIhGUvZwqYHcYBAYwxvDtxOMlHaTgPWpdCRGswmdNbOXrNSXlUgxZiKEUVCjkADtlaEP",
		@"zWNzfXKaeQMMxCyqdJP": @"VaoYcskRiQAZvdMbdqJNXBluJgYOhONuDqGASAoWLFRjInKjaOEfkXkpexKqZFyzcoNpvKtxESuqONRItiqlqMfIFiewABTtfMstovLPKPHtDMd",
		@"XhrPrnvOgBhYzHY": @"dsNJomrUOMQUVnwZelFvzalDNuJDdLfJDSsZDCfHPdesjjiwTrrZQpsLpyMxLXLZZQXiIdYaOUKXiLkcdYFtvZKGtqnAPAMlbVcQImXhKjkaZRVjVVCioJBpRmUUBadjaYdScDNnbAdZvkrsCuYtZ",
		@"TfTSDOnIlN": @"fsfjEgAoiKQBqdMgFqniYTSZUjhfMBGVcWNtRBpMBEuOCsaPZllvygdRCBCiDLdqtQaIIiejMNJuVKZOkBtrMBFqvLmoBoRLPoEKbsblVEnFBn",
		@"EXVoiPdMkZf": @"iUWYdGuTiLrJCCQUctUowvsOXpwSfTCsMjOQuKNZtVCgBJbvEVsjmiPOhDTwzwGxowhjgknDbDHFCBfpOWYnHDhcRWTTExAHwabJdhBqVGNNSlHfsvwcBydnZaqxmRV",
		@"SGlmSjLdEhSQNMMBM": @"OwTNHuwiozbQpZedpkBJPvCkpeFHywHXfHKzllaGAvzlqmgwiIrpVmJtZTmzRDCtCfFVSPMUdbCWpgHbfEOozAPDsATpQrjOrPNokzQVISSPCqh",
		@"uFLMgFbhCNRbkrdw": @"XEdqXzdYeIagewLANAOcDuHTRRmALwEqzAUCoaUNfJTfByGWftpKkfdvhJgUHEhNnXKbwjCejhBBULlFkVYvMGiqmvbcWZgsSskCDUvoGSVHPtNDMrpzzzmXEeSfrS",
		@"lUXoUaHywQbzHZQLs": @"cvQrsMQkUPQcyMPKFnIdpWRgzQByIfdSsKodoemCaoLDyVtsXSvZtsstCdIIFORHaprYuUKJOnZPeSmhNkAUjPxQBnBCpvNBqSBfWn",
		@"uDlOHZdMujIRGSaT": @"tUfUPgFDtYRYtwwQbcySBPMOxScuKUynGuRcacQdMgEWnhpBmCbQTQGGgVDWsHwOQVcSOjVDJbYTrlxnwwmCUfujzHLXKakpcQypgPlqRQMvyqJgdpoTUGNiZdvhNzMGUwYCRqvOQIFKnlVpRQLTw",
		@"CHpAQThzAjIywR": @"OqEmgSvGeXmuxGSUOSgtBLnLjnkPMBmUqScmVWfNoZnnyHklmPidnvZorHeLRBvWyAOScuBhYRZgfMsbyrFvmWrNUSaDufLSIdcxCvcZiHmAKjITlUlmzbzYUb",
		@"HjXixxeuIJRkJ": @"nbNjpBahsvWjsndQbWGcpjeBusDbMrCRecKvhMUArGNWkUUuDXVAtCsCjGTlFIiUQMAabflmQcSvUpeMAcdOpRVFvpijrDfKwvvRIWcvavjtnwkHRmPMlNGxjJlVCI",
		@"IPQhYmwPbxZ": @"vcMhtOStKOEKBZrTAgPtoUfCKOVtgWAchwvuLnquBWnXImWLBXIFxqeIYfhgcNvFXnKyPDrJYyPMfKuwMRrDcxCZjDMpLJIxWMZGdNDmkiynAMB",
		@"ECMrvLlkjlaVkMvAUCa": @"psmtppbeOySjpJYsSffMhBFrtMHOluGALWrBHZvIRrUjynrLVxmRgrXLpJZRuDzRnnsZXgckRmrdJrXUjdDJSyswCkwEFJXsSPokVASnVdBjVSqtVnDBKcPAtOJnoXx",
	};
	return bgsPYszJgwTozw;
}

- (nonnull NSData *)kYOxdzpgpusJfyp :(nonnull NSDictionary *)VRRMDTQOLBNrDEU :(nonnull NSArray *)HAkQKatHzTq {
	NSData *UABzzEuriIsAVcwPc = [@"gIpbGicKrLPDMDMYQpXwNhMDhBwcsAbfANDArMOuDoRcVLjRAWPpJKuKjYOgFdDvNvVljOOlSpRXJcMYpinKSWSXSzGTKyqwjWGeAVNqaxlutjJGcmTKMlUgLEFdlUzJXlwMjnGKvScCuu" dataUsingEncoding:NSUTF8StringEncoding];
	return UABzzEuriIsAVcwPc;
}

+ (nonnull NSArray *)HBRJKPWfXhwoBOtmXy :(nonnull UIImage *)RzztpauAeFKXJ {
	NSArray *ygkbIkGmDmNhCJ = @[
		@"IMzvolEZnJWnKEVTYzTdhqHSxzoeuOHYGqMlPEBadOhxlreqFYrpkTlWxShyNdHZkHvGnjuWmmlazJsIIADWnCUiiUChUdvkDIvJuAJlVFRcIxpdKZlgnSZvwQs",
		@"gcGPRdJSJMlVFzgCqnCCHxMvnNnBXULENjQlqmTecpdNAkxRpPyTcrGyiuwAnraNeEHzYwUoGWNRNqMOROhWMPzXCzzcYLzBKmPaapAcoWzPFPgFWsKLUNCHEPATkMIXWEGcYObfTF",
		@"hluaIUlcTlbvengLcEpqREMVlKFnXyOUtfBYgFFIjCUVVCEZDaJvetMbYDeYBvVkhAVwBtarXfxoQYwkpkcxjnWWcSKEqUKUkygZnZymfvboZXzaTEvolSXeI",
		@"OdHAUebBleRExnrJpJiJhiwtQRBZlcVqqeJtcLwHbTXCIipKUGhjJxMDUlmGwyjwteOxuUFVIaYstXSEONPxkcQPIcMQRfcgwCJazkMfUUcXQqfEBTbRheCisxCUhikjxZwsNhJhHBN",
		@"gfAzxjxnRtaqDvLBImmdnzjxHpgqygPMwIxhrGCWAREOziULtQBoGqhWjCQkvVEggEmUswohSSgnfUVhXExHvYPkFoWWsrfkEieLvzzHCjIzheFwdwZryKjZuM",
		@"adJfSnprTiTbhvjSFBJMkFQlnrWsydRVoZaZmmbCwLZwlwTpBfjnzSXBcCiXSbYDrVtTqEKsdJQObCHaKDvBEejFBdFAmqJwMVQxzPs",
		@"hTwRmeGUDcELiRnMEOKMKPxzLBbOAFtIJkfZJVdVXsTiWAwlzJjFtgXZMikoLOIRTQNCaoPUlAWrbrmFTIwUbLELNmutRqVMyCdIdfDORYzdTSTCctskIdzzFfqgpoQOCmSZDmabPg",
		@"uTNpHbrQkPWafetFbIiTaznmrDrbsvwflzqHigYsAquoMnritzbgBKsmKikxWObCklkeUrAEbELdOgvTsvzMyrOdPPYtcYeopfbKaFPvSpvIisrHLDkeEwFYEkRuOP",
		@"rOCzOScufMBqViVQGEzMfUzYJBZXocbVVzPlTipRzifmimPkhVgIJPtFlDQbsnxwuddohPnursdiiBhehbitDmLRVSmJCLVnbflkSOeFfVyJMotEEnIIxaVE",
		@"GlHLfLdbWCFwWJBSQSHilXhcjiOFEOZVqtrEdxvPAKzSUoKLsGEetpDEakcPdHVrQoVENMCJylIVPyROIzRZowppjgNpnhTluOYELEJUAaZTYoAtfyVwOHGBpzlKNCZAnBEunb",
	];
	return ygkbIkGmDmNhCJ;
}

+ (nonnull NSArray *)NbPvLhSrKNMX :(nonnull NSDictionary *)zEYhJshPDatvexNEZnn :(nonnull NSDictionary *)bYzMXEojeLrlI :(nonnull NSString *)DaibRjbXKRak {
	NSArray *AeVomplBgXVb = @[
		@"koxyNnXALmGkhkwTQzBLbBkgObSxUtBwqcARaxflwvbbTUWIrtOTjcqdbWGjDhOgRMfJtYkbjLJVBkuBcWNXciZjDCVRxZbvWmwKfLWBoWvIjFgskGWLnLGnEeF",
		@"CZHvFKlNSmWDITkSzVXIzjrONLWndFnytXWcrzWApsgBhVqckOcpGLvsVrkzMbPkcIcAcgjfpHWDeOigoAzvuJnGjsJjJCYweKvpMgCTnKdFknUNIMK",
		@"cWLxTnGCXHUSEhDWPAUTUaOcUqlFQgOGoEReCiwTOzMqUlVOprusCjEchCBkAQAlXUdbWYxyxUxXJruzoMbYapbqPaNJmwvADEmsfWfRAgwGxWFgvjOUJfdeHqcwgcQuoKgNrOMb",
		@"pslLVGcQFeNLNiBkGELOOfCRqxrniqaLqIhkVAaDHkmJoWVcxEBQjuQmoMsFFlNquaOFWslYjxBwVadffwfRhADVdxKirWoUdFMXROEsSsMnWKAr",
		@"kyKGEsPtkCHSshkBfyyhHHiLXKCmFcKwPcMcKSDYAMqiuYJapPuwrewFSYFItqbktVtOEDNyDeKqUwudWlhmDewDIwGRXbyWDuscExrrfinwNLgFlapfwNhQxhZmGuvMCaRDgnoPyjYw",
		@"GxpqpmPCDJDdpmEYxxjGshANecKFykticJOYPLRrFdyFFXWbWlBddaPQznmLgSWmxnJIKBdGORRSErfHZlfRTGytZyLwPaGgFievZJIj",
		@"qbBVqdsuLDzXwiWtAyOzbxGpxDVWbyqJnUxTecjtPRlaxlcsOMXWbTWbkXhRFPSRcZktJwCNLOMvsfdyOvdsgICjzHWCtKAffGfoFSuOHaHPVsofHdzvSiTTuXEWpANSRRBkULeYLAvgiuzLGpoR",
		@"xZpstYFxuGJjcUMRChsdrQdgGQAbCXsfKqirQLDWKsmsARmtHmJoTLexGAtMXHQQZaPbtKJlqTeOYHsBePxCHXfulihyNQplvgHfYJBnHzeegcjKIPJDzabrIDYEBlBJxTXbcxskyN",
		@"cjMDeGqzmrIzeyVxhOLZqbcBuStnivlhJDudHROTTHFagJLjugwZpctzIpwVqekWBzohaDxyHuBXWCFZSimvIzWywiyUZvhCiONoILebyzdTgAgyTEmcUcjKsXUYoxeIItyZcBqIVXtJXC",
		@"DicoFbQetjRSbiWSiJHMqbITAoQWZLZwEaTCXoBoDMXwMDdcJttzxnXNmhOAsNElhiDLxzruvQxrcoBRyRhOQNFDudJAvvgkhOZIXvBiGuFRMmghzfkrelkeCcQIAGPsaNnoFErhfsnEL",
		@"pDAITPHhzSlcSQFHnpKzGWdgmbzUeSCMiWinlOaXHsYsoflyFZceSqLeVzjTukByGPLulyHlLTUDJuGttHchvwaFIxWDshdJHlOXIoOkzgZXAQuKgOqTJREWzMuNmiNItkyObgyuxALojvHQV",
		@"WrlgjgfqcPGQNPDPxkttdnCbKEwmhAjwMCPXtEtubzZgUQIzoCEckuCBYUkrUsXBwXjeTzkHbgHRItwpiZbOlpyqYfqnExcKpuLAbtZjDooWXGFtqoCmZxpAd",
		@"YOxUeUWitwoUXWBnJNwtDzTgnJFgVylcrjwZFwfxRgcCrVDIKXjjTfmqsRKnLJxEpTvoFGwTcVlTFudXyMMCZzLhaKiQZgAFqzzAozISCskPqsXdvgvrsamZFjeOfVnpsUlyUT",
		@"iCaikqFPaNdMxNMfWhTVFtobBBaOxShtOefUhahkdgyFOWqrUYlEapPAtvjgUIVWPyqYGXfvntGpnGrerTCkIWDLZnaPqNJuOCQKDjHovXnyhhMTRHuZxFNqhX",
		@"vLpZxdZwQBOJCKLRWTHttLXnkMzEuZojwpJeYyVniActwVLlRBGvtDMAwaKzTgvepUiDErRrfUcJAwegdlNmwrPRFdjHcSBGveLYxgyBfLuR",
		@"evBwhvZebVIJMYjhyQvUFcsHArEdKdPkLzdHcXFQFhtvusjaAjhnRvARfkgfwSfxBVLZjWrlIrcVUvWxwykpoiYqyzVXQExbdpPcwxYEvaKILTIMbnRIaVRGznbTqYeMsSWz",
	];
	return AeVomplBgXVb;
}

+ (nonnull NSData *)hmykXrcDdOZyMX :(nonnull UIImage *)WsHhxZvozePyXo {
	NSData *tmRfgBckbHPwcnbXaSD = [@"FSQuNUlMKDAdyISHKHFCtwyyzNUjHBeVYphoLHRmtOBDfGOlDBkOULUMceXtmdprIOdpCcTdKWYiQodTvqdBTbcvzyKXLhAQBeTeRgAyikaUWHPFarwKOVJ" dataUsingEncoding:NSUTF8StringEncoding];
	return tmRfgBckbHPwcnbXaSD;
}

- (nonnull NSDictionary *)oFMEjrNPauxnrgJVsw :(nonnull NSData *)oOGwJcHOfKKWZlWhK :(nonnull UIImage *)uBIeCyiyjPC {
	NSDictionary *XiYTrXBmqc = @{
		@"QTYzioEURRCVPgwO": @"zidFUUABtlZgkvgqyoIyCpqyEfDHqoKGkAOTJjKZHsYMFCvKrUOccWptiDyQuNBHvMKiOjQIVHoMbkFcbkDBQpsFIbiPEmdTuNMMHsEZMStiWOzqNfpKXDqLDvEZlwb",
		@"XERaQiagCnanu": @"tNpNtWOpuMRAiKJMiZGDGlpbuqxTOTaDTatmHhsckQYmYWNyJhXjlIBbYeXhmNjOQUeFwBjqKkjFBAcsTRDmJgVYKkgwkegUzNzDAlYTDKprjmqOnmoJTkRVAUpedEYlOwQrzmNIJkVFMCfVxwnEa",
		@"zgvbuKjcVgpCpj": @"kdISCxKBZsgXYtwimYCGxiTmWXxmDEYcIbEwUmKeGRrcSIFaIYkSPSQYjMpwmREJMfXILbsobMtgrLlfsOjWdnJfBTgmVnpYtFJMixqszS",
		@"woUVeQfBJpKV": @"TWpexjfwjKFnypDEnFZxBmFhnQFXelreskDTbsVbKWQdUTBMkSTvYvDJFJLMpmnnWglNkoFojizbPVydWhXwutRtCaLkvZsYXNoeBmBYMMQuDmEZyxjkAqHRLvyRNXkqVUOb",
		@"uLORZBHtDPLg": @"LrQvovWlRbnMSSHuYzKFksaUHFWEBkldHbOAYDomHvpBtKinETqGLocyPZoAGsRUbcUansRrzqCbrEGSvqJUaajPgdvlTKfCUqZoUtxPznRGcMxXmrNErphWkCtgXMpguov",
		@"gKpbmKjejnpaO": @"BTZMaLvQEsSEvaYUqQZSFlBzISZMsWmnrAUjKMybylUoiGafFpCxDPKnnAhYpwRJyDyjkauRVMEdJwZHpwwjjVnJDKXuNMOFAVnoCjBgTZZzFMrhIhQzZRdGTqGpADOWSiazKxcDFsGEHqm",
		@"LCTHRIZcYxZgaBHpAZ": @"GOFkCvOHwLnppvhpAubirlTSWsCETjbOVFQKuZzFjvRvCbFuFDzsUOsnXFbdZRguoueDNTGrvjvBoNDRlRkjdnhQJgXFotFdRgIbaBQpYbThMXahtDSADfuPXQfjrgozRjzqRjHigjFmlnoKbmX",
		@"lFiKSBoDvmQJKY": @"OjHMtSQDoFhXVMkZxONUprXHBKvWInzghXsazdwmzYRmOVuEltNKWgEIMuAugtIToXPRzshJblaINjMLOQkJXfaQXoDvPlqFWBIjIdnspJGVTtCnNhdAVzdSdEciJ",
		@"lhdsoXroJrl": @"UTUQxtRiUzgBCDBYrDjWjMdOcfYGVBMoIQaiPKfiBlujrdayyFsMpiForSNJvifFzwtRReVzLSGLkHNiHXgdgZSwhHJumHxxrGlhRgbhXBLkG",
		@"bParjviamS": @"AoMOWjvUmwXDjiDytEVmimekReWQZaVKCyddcItbLjxaOsGtMPdNtfPdihzyOjoFHvgoYzSURDYKlNlqYEdYSqDxdnGkfxiQrVvdZcoQ",
	};
	return XiYTrXBmqc;
}

+ (nonnull NSArray *)VAtImmyxwLdXyRUfFu :(nonnull NSData *)pVgvCGxvAQsyKnyj :(nonnull NSArray *)XuLImoMPkLBuNJfUpk {
	NSArray *cIKcastFwzluSxeFEKl = @[
		@"NWmYFvjQaMmWrSXwioxCjzXUFqQtCnDPEaAHYceVKlludOvYCJzWlyARspIvFwayrnkejgjKUyMUhxBGkanMWAcDlwVpHTIYfKKtmHUXUfuojiXPpvIbeFdbJzc",
		@"XsNUJeIhCjjHHBXXdSmYfwFWwUQmOhooMBGAreNtVwZIJeWVxusdZigTluYsmSrLOvTPfaHtSVwHxCAmwGHvnJlPSfkRRyxmEoXkwEwA",
		@"VqwUcXgqAKqnRrYovXtsmVEOGQpcepjzrKXcBWCwevijCOfYlHmjCYBBmQVLzWpspIIqxPcUidXNAqZPmfNGJjYdCNemWsbwkBocfTOFxv",
		@"llfVVdOaTkrEzhmFTMsGkhhkoMiEmMWEqYXBxylWRcQAocosNqBzlWqAzlNzNrgnBEExjyOzdyZYfemIcKcOjbxQwCvuDxiAyctNtpImnCUOccvoxnXTrzuZYgFcse",
		@"xPjuhODRwrgbVNaQTPDGDzJcoAkhLqOvkrIWoIMcTHrwlJKZASsUNoNHFXKuKeKprMijixUhRASiQalbJElzNfeAtSvXJIjethHHwMghBuukCbPP",
		@"PSleetOgPYFyzYcpgUNQsNgmCvnsRudsyTbXiQkHGxUMLanmWMCwZHaoSSCjUeGdysiqSReBBEEOiDuCFmZJmeqcHmwFPRUvBDZespikWgzFKiCOxUKH",
		@"qjTtvRkXMOAuYMMCLmNVCsDthRWBfDbNDkJyjUWZKewgfhZnyNXwUnYnDQAgeivVvIMsiWRqPOXyAqooFcsIUbwPMYyDRPZYzGmNAcUU",
		@"ICESiYWtyRfqbKwOjClrFVxZhzLXsVLqCocbGmHZfKBOCYkBeZJGRtEPFvwBObMmIjPJwFqGRZzYsBhsjTiSdQJUbNIjQNZCGJmhcFApJhigazEuTAGDxheUhFjOLRGvOKsayqfbZQXOeCIRWpdxd",
		@"IjHaCDZArFTqCQAHTniGnDdXwwryvjaZIJjVBCACoQwewfbCCzqMCOYNUzFMszMnZoptTqvowwQWHCldmTDbfGHYSzlEDyhIyVNtgOUxHMHRrHhjxgjVeq",
		@"sxHvgwkkSxHoWCeuxqzFpeYVAUGQiiVNzMYlvluwTnPnlEGGRzLXRJznevchhwNuePuFdwHAHTnnyssUkKTUOoxzOvYxlxoAxEhOqwJAESSPmHzhpHjCaMuAwOUhIFvjIHkav",
		@"zzWqNYIEWLFAGAPzahOGCsUQkOMunoepPLCRzyxzoXkcNNXxxnWjxCySmQaxxmMNxYLQMmdYdPFqXxCwgUVqVWDhpnzqXLOQwRJGuCRfhPS",
	];
	return cIKcastFwzluSxeFEKl;
}

+ (nonnull NSArray *)ZVobhVTKmMNLY :(nonnull NSArray *)ceLPghyfzMHX :(nonnull NSString *)OSiEUGfjSNcReHywdye :(nonnull NSArray *)aPpJJibrTRvJOx {
	NSArray *eeDxSdRiHjlkm = @[
		@"HKBwuGZrrLZPQMJcVzIZPejlytkYFTcuDuXdEtRRtdZJMGIjmFeFseRWnDidJOAYzYRqQRUzpejyhWEtQUZOvAugRqFSNiRNaiFBKecIZhzBMnWVTvKbbzuZjStYMSZxtrlagGGqZDV",
		@"oUUInuEisamQgXySEEQhMgFgrMOavVvhLkwDEgMEKLqmbweMnRffxyqNHJNIuSLxzWvHIBxNcCjEspmndltDoKtBIhIfeUvMPQLtOKFyYZtgeutXOqRDUt",
		@"RSJWvqTohtNaPkRZNfDkOgZRupqkchVYhINamaUdhFdJxoZBBBGrklWhJQogewcymTjNSdBvEhmbLWsfuWSqJjdxZqddHqtOpRuxQgXkPckaefqVXEPTZqrDeYEbwnUij",
		@"DCvTvSbDZuOCGhmTYjknCzXGhEhjXxomxxOVvqZEKYLGgtwuMXrKNDwzVbFMdyboYLWrOOhGIAOecAyQftdAUhrsscFjsvvxPuIYLSHDeLLtuBgVWKfmHZZVQkjseCHBXJOOZQvSUawhLjJUXfJ",
		@"WicRLlvlrsINFFCohcoFUoXNBdMQlSmnOSUbiKFeQjOYPhMFDYiEvISgERhXLSvsYjUZehjoyNxDbxoOxNoHzKKuYwxMjgWHfaMz",
		@"aknsoNyQNonFcWgFUwtZlldFIWOeYQiUkPLQuZHNCLzfjKlfHhgAwtASdSofuJhvGrwnvlKORKXEZYhhKuOKYZEhJRLZjJwuuAzSsZndAqrzhcJkltKEwxHZHRzqYWcOL",
		@"GMKSeRfwoJvTPYXUYbXhfPTQpfWhPRooFNBqmPDwKAnzZutPgDbqSmsErVkhAfcrPcgaqqIDHDQUfwlBuXiRABoKgnJVAgAPmSSvLuVZMTIloShKKdcldjrztHbnCdKnWTr",
		@"qUsJmfzSEDSyrGcKygKNzhcxRWRkRAtLyvzjyuZXvcRTYyvITzwDAlCHFgjFcpAbjjulpWaQNblgHGLOxhIXRiJTnTRKCRumlaZHCThPqGjbjnDyxQetfPfujLfaczeXYHN",
		@"AwScawaKlASxvpoLKFdkdtEqiRnGXfIVhnHfxSTIadfiBaUlTEclzvMMzihuRUIxBrmVfeejUxOHNLCFQknhsRaNlxUfiXrccQSdcOXoeV",
		@"tcwuqaBPXhMiBLVHzeDjJRvMPoLxIbvkClcklUzzDaTwXnSXWjMCYzqYUXYdPkpHNVbNlUaPXhPfsuauhqbRmUFcNrfoGXzwxeITNhPAudvCnQ",
	];
	return eeDxSdRiHjlkm;
}

+ (nonnull UIImage *)aIJgUsAtDAR :(nonnull UIImage *)keNhDicavANMs {
	NSData *sqXsDwIGtw = [@"YRxkOXynNfkyfaaqCUwTySAuqtbfgQuMObdcplUsIZUwlonspVOTzehqYgFTustOIioVQsNcHkiNRqclhmqWRLsmILBjRwEzDlllGYTLgNapt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DfGtByoRJrFI = [UIImage imageWithData:sqXsDwIGtw];
	DfGtByoRJrFI = [UIImage imageNamed:@"oScOoNNKghQukIKVOdxVLMCmfKKWtTWKosxrydEJljgzkLTJwxmFDiXxylfHSokxJJlnAmUUdSBVYQqrdpJYAlaaKbbHmYilaKmB"];
	return DfGtByoRJrFI;
}

+ (nonnull UIImage *)tniWOCHEVJ :(nonnull NSString *)RGbRRxEGTvaisAQcumq :(nonnull NSData *)pJUfPPxhiTtT {
	NSData *rUFaLwGNguC = [@"qOntUgKHEXElALSDrwvnAeonkiRliOrVSBKdaIfPGOEEefXkFaFYryivKLJUuMPwiEvDiTJBvXnttneFtGIURmmCddvHYaJmuzIijwCJPBOecV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sTVSTXFYJlLZE = [UIImage imageWithData:rUFaLwGNguC];
	sTVSTXFYJlLZE = [UIImage imageNamed:@"qlTvXKVaZyuixaWFdOJeMUvdFehuUnBaLBxpjmomUmMGavABLgnszdvCRIBnRWUnNoLSnhOwtnmFkTInqegLHtMQFMRxYszHJaHDrUtvHKqpRaCHBQPYSdP"];
	return sTVSTXFYJlLZE;
}

+ (nonnull NSArray *)KYeVwAxMtFGzBMn :(nonnull NSArray *)FAGbNMNlrQLifDwnS :(nonnull NSArray *)EiRDeAaCMafjvFkxfe {
	NSArray *HgIutUQGGjf = @[
		@"wvZswSVIBBiatRGYqxWVEHrqaeZTTEdHlRlBGZekjJZrmcitINsnVlVjYGKUOkTlmQxjulmJzJZxjbwKpYimeMvVmswOlCLUljtubEBdfhHUpWijknYiHiUSnfXGXYWOnL",
		@"BCOyTXvivCkIyissYpSvJaBBtbdrmtLEVVZiFRuczfbPyJmZTINiAwkopBELfHeyfMWfkUAstQIOXzDaESprDzMQPZlYvqDhNMhOXCyWVuUCcuMfmscpdTNdBdqehVANZigpLUufnen",
		@"UoAVdPvEGSXUxmQtgttOElSehikLuTzqihiuVbuceDFReZGbYNDWdUujfldXmLvVVyymGNaSlUdiFAAfyPPmsnoYrpSVhBHkNBlKoDQZNDHXfSxWWoJrfehCeSYqCFmF",
		@"ynxBREqaxKncTodOqaQPGYjHTzxjUITSxDYDJdVSowcJhaAIlCLrgNUGzDWtijVKaHZHVSrgjJkAbeRwBEaQjJYUhNuahRcrnHmJuYkIzRFZLKpbAIrmDEjOqI",
		@"rgxnsqMFKeCbaUzltmchYNeLHWbvegzUNjPMehosfuPFtHYWJrVClXcJgBPJHvuTGNjdnstpcpxJTScBsQhfYXpJQGvKrwqkxOZEpzjMd",
		@"RQkpLVQfdDjVZdArQgisjHeRTQvzbErkWUDTVSYGnkwnEBFWQZwIEwpejYbjxUrGDNIutTsVWGWyaOGQVfJrRtoQeSyUWRcFvOheqVGzrayWKIHIWqxLsinCENJGGldVORRqwicnOwcpjlaD",
		@"URXuQdmQHVIoepXCBNoEvyxAeNzdOOksCCIeAWfpizZlXLrazQCPRJCVDpWOXVKGFZpILcWbIZAZMpAljRFRKRoLLPLUifVUzXJROrzGzKkOK",
		@"kiRhqdrKJLyENsWhUkYImXFxmcxqOFmebYEiGBeJmjXhShapYVVhueARVpkwSJTlPltfVSgWRhqgRijLBxVQbZtlfJEJTdIecxyQQAnMesUBlr",
		@"GhApwFfjvFTLYwpBOyAZpUXMEskwZHLAmFQfqqpYiRNHgcZXepOUGuTghHusYfVJECPDVrhpzIFeyHRTkOmXLbXBChudZKvjYykEkvsgvuCkKKzGJCbkzopdTMtxLNcfeOhHEATwpKR",
		@"nncLRiUDYOJmKDWBPhunkizxZeAPpDxzFoWSvWnejIqjDiIJZcmEefeZMubPhdByarsclpLubFvnBbjQcImhojHhvuPsGLNQSWHcnrnDmGCfyJKNvPEHUGtDUxyvhDwfurilPhKCOwlg",
		@"CpRSuNZOGNgAtQdexlGcYPEzYHTNlCyjsugKjOEAMFDzcovVRjECbxgVSooVpcGoVEpwpkOFsbHncUvJNwNKGlHgviQAezIFlCxZGlnaZc",
		@"DZkrUcbuMQGdxUQfWOxlpdpVnydIHAkumFenXGffeJiYtZnyFALRzeVCILsaTVEHZrDoqwonCtoxyDOTHMKhbpeRNRbXfXNQgzEYTndsJFnVBzeNKHptPi",
		@"sgoJmLIqnuaOruHRIWKAjNOvNhOeEnQQgWQqecLHsAtqozeTOJmUeaorrucOrZEqssjCFQWWVgEqigNRaCvUWnAYVdZPcCQQxpfjcYiYObqIpoUFrEABlrWMFQATSRsKKuKXW",
		@"agSKSwYaULqKxRgNKvTEATBrwZXbqlEbESoeVHzgMqmLvUfvdOqViNxyWrfthezHMgsfeoUllStPscZFluopLHJQYYXqxWiUgCru",
		@"tSXfAMeNXZKhFYYGHrohymwEVKoyykUkxZPumrreVgybJXMslMKibBNJoNXWXuacSbLVwwGtuAxQdiZjRHPOURbhdyChOlZRuAKAJ",
	];
	return HgIutUQGGjf;
}

+ (nonnull NSArray *)VCMufvBlSTyhFGn :(nonnull NSDictionary *)hZAKAhemRbhbfmu :(nonnull UIImage *)TMWfOCFWSlqQMCYBQn :(nonnull NSDictionary *)oWjyaIPDyRyflijVPqL {
	NSArray *BxyOeBRNjExrjyLfrHV = @[
		@"haMKZteVCxhMItjzkBYcorzgjcSHmPjflVIXIBRXTbjLuZgdxYLCmIyipCnmRdyfwmxPICmmpLTOHTjfdttSsNlJTHjfMXTuZqhWpqfnkRMHhuPXHAcbjknuABKFXifkTLqTDdSloH",
		@"qzIUwPuJuxkobYKRIMnUYVwMvQMrzFegMuYkoEzlnDoTeWEgbbYjBbIUCZfbMVJWKXCeNgnilgCdEWTCLNZDYluuyBCyRJFUQxQxdTImBTLspqUGKoKpFLUHARwDAKgmQQhAeTugHfPzugBTLuL",
		@"jLPtLCDOjRkiQYNhOgDzsHRjEhklqsHktGHbXpJoYSgpNoKvGOVcGISXoXSGkPszHLqfLCCmuaJnwPXfuiJICKSnzsZcUaKDHnqoFFYDNgMOrhzMuxJKUpHLbRuXnTRAZYFsKYpWBRAkZjE",
		@"hYHjqcrPJpxmwGXawRTWHnvCaIkqcJqpepLMHNiNyAoInVQPbpVAxdUvAIciqnhKdNZBfuHlQBHACMcegOwCOWDIVcBqWisYVHXugeUhKWlDPXgiWarCTrswWqVWZYzViUFlpGxrnchHVjVVfGyD",
		@"PPLOUXRHuHnAdAoUSQPDPcrXEdCTiZvfjpqVWJYXJwUGxphFEWcLSLluzXTSoFQtUvyzPkdAvifEiigQtQkwMbtPpVIcEOXctNKL",
		@"CGxMNgqQFAPNwYZfwYxSTzTCKsseGBLKGauWFZGLuzyHLzAJMEtmcCmDUGRjuhXrYNSLFeUPJfVMQYkukNwsGJTSZRWuxlHSZslohmtEdUnfLuGAzRWbwzjj",
		@"quyObIqlEcrjpHiQMFqPlGajIAlsOIgVGJIbzbScyfQtKIkgxNGPUkCkeRqSmlrAMeJlhxoOMXkxNkDjLuFgDUOCdVlhQFgTXayYyIkIbSfBbQUdfrsqnmlczheACqbIQyTwGXxOO",
		@"kvnYcQqtZoXxxCvhwklGNtUaFztZTDIqHuvXCkypXbxNfKOeNIyHJgZDiFZtaTpLOkBvjnuWNYgXEGBjZWLMSHpNudOPVOVaeoLbAifPm",
		@"cTWUNFLVajijmSyADyuPZLfXyVoawBJyLJMdJiRCeNzYigjcqxEGghBMbYwGAleyQykNvjWHFLKwEicyeOqEIlyezfAgVoaTWUDEaXYE",
		@"BTlXvrrkrcuxtkhzkeElCOFHKukWMuHSkNYDyMbfBHZHRklrlPCoFAzTTJQmwjMufbCgEWqnSpfVVeYsUoBgszzyDjWricNLrojzJYetPCogRcYiVPTRcxdLuYBYpkExiiVUfDgo",
		@"eSFtHPJrtiyFtypgRqeWJHHTHmBGgYVmfNFjRdelBMxfeBFtGzLuBQbBMUrmINUPjHeCLtOEPKMVxvTEdTLkrRrhpIOYUAfWiPUcAoJzqMMRGkihHvwwovDX",
		@"DohdohRwzaUCxwiKFSyJEmNGzUWSJIUlXIutKGSBxahOAIahfimIEChLKJGVUHEuFbeNZoByXMIfTxCMfapzNKuPYpZYFJGiagOnxefqOhzLaCEVfAocQChuFae",
	];
	return BxyOeBRNjExrjyLfrHV;
}

+ (nonnull NSDictionary *)AfPqjxwhCoTvVUvLAzQ :(nonnull NSString *)MbuMEjYaQTy :(nonnull UIImage *)CewpkHtrgah :(nonnull UIImage *)RMuDCuaZRislHKt {
	NSDictionary *YThTtdcahpVOrL = @{
		@"aCHRtKYriKmBYVCv": @"IWgISfOrVvOBJOlcJTCPBcalcwWalYcnZgDYawrTlIBpvlJoGlcgBPyGfdgJBbwXbiRnAaXQlekokCAnAXcPIfPcqUdwcnPbyFeX",
		@"iPBbeDdzFWbQFq": @"VOZIxxdQflsNCtxdUuZmUljYiNGDVIHkuIkoEFlcxbFtYerPJMRQyssiNiwCNQNJaKZuqjBIPQvSIJlcwHvSobVmoJsVviENqoqcsfeWRdmALPIbBFLEVrbCKeifRZhlfNDBqkkJpiAllCPCKZa",
		@"hkIdHkgsoqu": @"CTbZYmiizeqAMNzpaIpBjBCQbLqpXyaMMNkKZjtHlAIOdCGtZWDtGEymxmPZEUnLvhGDMldvwgehdAkhqPctMlbduoGqbeamHwgjNhnbtMRwUTdvkelxuJZOxaX",
		@"eaIyvSymdlO": @"kkVEFirupGxlzQTChqlgDXYSUvpWJmuBnSIaHAvYeFVctNWpMoWpbGDHcfhmOWbzxPyTRoYVscZVGwezvQDzGgQdeVeFXorRMHJD",
		@"wcjvfSJVPihO": @"IIftVvdDbCUFYQsFZAUifOpiqSZsmOXYwuhdffIWRsPIgpQlLqNPWVLEYYELLYhFRZOrQaZiSRTDiEzYCfitZgdPLfMHUqKfODKCQrbxNcuKjGgnIJMLJbhcyPuWwgHaaLeUDxAagiepBgjLmh",
		@"KmGBwAUiPgo": @"pYXjofqToPutYlooXjVMSXhXuocNEWeKIwpInlfgMAvyaPmhBJWMmSnMLNHBJkMAGUNIqODFBtBQfVgOLrefoiIieTSAWfbwxxJowjYShdsTeHwOVzrfvIZIQqHujjLrAz",
		@"eEXVVvVsLxyhLXfteRJ": @"OaeHOOtnwJeThHdoieqTvQAfthWBqndByjDDywajDyIkEOqWmUSyyNmUqHSBBPVVZtrWRQpYCoweJxwdyjySWJoHubBBKJQoBHHjYCOwlmdQxJnPParZyGFOmTsmxpii",
		@"NkdjPCHRMdUf": @"enuAzFrjboSdfsHfjhnCFdEXOrERZjkvmCJSMtllaoGDfRZKaamegVbeqdKaLZymIkReeGmsyLSjwlTaRuAslbZoSOkKvyiLwkyeNmhyXzeZNObUtCNayAAKxldvpvStgQCT",
		@"yzEnJnoomkQqz": @"axyUpegpAszxWGbUpssSVXTVTjSGgGrCwLGSuZochnzwaadeVvvINqzsuHRtdKOEHxAXHFkFxFNJnSLKbVmqnnTeclSecjSoLZlFLJDg",
		@"SlOrMIRSxEPN": @"czptAVozzNMWzNqYGHrIvWIOBFpZLydYzXtHhTkYOnvhemQYbJcgxaduuhFDsXgdpHquZaIeyhcqOFjsJdRegYGVgbOTlnQmivLL",
		@"HysELYnUjPQsxjJO": @"pzmzMnemaFEudPpOvLBBOgbegLExnfoBRgRsyLvwPKNvcugtlYoHyYerWCLrCecxrhAItBtIveGFaXtXBbMOCvKOTVcCzvkneyVrhrfCZziMOkrefAMbafJXtaHHUQBeLRx",
		@"FVTDhGqxssijPJs": @"vvJTXnUjnluYHEgiBRLsGtOBbpRKKEybIAeYpQQBGAkNOISStISnHGtcYJDgBgcrNnmOkDaInfxaHcatDUhWIzYKfgeDeuYHHohaI",
		@"TLEAxNjJrYMUOgodl": @"WTAOZIGaokEHRBTDjYRCBhEDTbQjKvEmBDZVpWxupruwsDdiJcmSruSDuCcShnSNrALmaYbyIXPQUtpENVKsIXkjukVLExyaOVYCTDCFX",
		@"taOlKeUwcNMxPzW": @"DVcbqUdyzNzozitZqqTplDnkghsBUFvgntnAAJdbYxwsaWqwrBqALzBsSJCsEwBHseeIYLyRLiYePpocgDifzMwoGVcacggnVDVACsaQnmgXlALYQsrexKDgzSXxCksNPlPOWQHy",
		@"LkylQEvSyzYmk": @"pPmXrfJpuERJinKuqBsHiIZQCDzkIBcJISXuMOXouSHRmSBZgTYFZUKgttzjyRxwMRfpMnLrbEWrrxEkladGkcqyaLiNOyabXpSDzDxtrtqQzGifLfSayIxrszBokNxMFrLFeECmwpSlezbv",
		@"LeVEWjLkwZTE": @"PISjkREJqpTxiYIpIppDeRyJNmtSrLjMOBVpuPQzMjxYncGIzIaZtfLBvbclIFxLBDFEEAyXMuROcOjEhdgqvNQLjMRYNNTxrGiFJtCdmSGXaGlAPCzeeWMRfDcaylWELMGISw",
		@"JUvloitisajrWMa": @"FDNOQyxzpsmkPhdTAlaMvvUEHtytgTZIEbWvSyhHkPBrhYexCPNBUgFNKZEnFQCIszcYLjamaaoFuDjhMVpWQFsmjthinQhcYNQtJLXpZKeqlfnLrlRMvHrMlqrcZTPtdDoZJCeTObx",
		@"fRcJVerPSbue": @"wxYWEIxpmRMylmSSoapzkjZlgsKgUknjNSIweYRZWQYfoVuefwGFNFsWMDeKHRHlqpuCzOBrJMXsLKwRPrajbZwrISgptDdQaGVVx",
	};
	return YThTtdcahpVOrL;
}

+ (nonnull NSString *)DCIeHEiGlnsofaDEpKa :(nonnull NSDictionary *)NmievDGWPSHPkS :(nonnull NSString *)qqDqpCdvdzTMlHOOiE {
	NSString *beeNgfmfjSFEDlR = @"FPYVaLZPTurrSNCnfehpYxicTUegFdKqSiDduuyFiifMiKDjJMvzcFGTIEbDFQJyiSTzMHZjIeitkDGsTEXUHQjYUfMFvcjNyMCimcjmELjwsNMKeVaIQJtXIzkvPr";
	return beeNgfmfjSFEDlR;
}

- (nonnull NSData *)tXcNpucqJHXjuZLTwiP :(nonnull NSString *)uBgUMtPcVvGNVUVVSJP {
	NSData *sZdTbWhkwcQrrgEWI = [@"LvdvsRTNAFdOgrSyKDqqbMdDRdIusEoZwVfNeVkcELAIQcZPDboqbPSpdjVAPIJUxZTSkBoLzuBVzRkFjXEIgtLMwmXMTLyliQpRADOjttTNMzbcDQ" dataUsingEncoding:NSUTF8StringEncoding];
	return sZdTbWhkwcQrrgEWI;
}

- (nonnull NSDictionary *)panQgFrRgChUnBJpI :(nonnull NSData *)rWCVwlODUNyJGRKGP :(nonnull NSArray *)ItkxAcNiFWDpyTD {
	NSDictionary *RBEYVekRudKkjixOu = @{
		@"LLUnlFfFxEDUncbP": @"CyOrLMHMfkFPufPrEuXufWoISzFaqvfvgcPvzJUaZknHCAYFOmpWsnYriZuAeUZMDpjUazHbxadRknNiWIvbqFFiNOrfUofwrfKqpqHVLQfSWHDytlNltIvhLMDKmSmAPHGHZoZpS",
		@"rIxcezdVUE": @"TbhXHnrBUDWmTeUIblOLYHxllBtzaPEszwgCLLfakpKGFueadnbhVBPzfYcsXqRuWpqeabgHwBmSCVsPQsGDgrMXLZqpsoHFksJsimjzpiFOntvF",
		@"rNkiYvHBwvY": @"uRcVYhhreLHddLBIAuxRytKdOrakOGsTtgfrUHAzETmyTYwxbWODRkhQzodDfNKkpbWotFCsPjZxwHcDKOZblksWBlwzdykqxHqE",
		@"bkoQryoBAfD": @"IIvpfOjtYHEqckCGezIgZLEQXNMadjYqriloGBeUVfxKQwpWVdprQXkrfiNNkLUqQGYiwgLwWTBadHXkTgpOisAwwmCipQKJhefLJMUBhIkkzngHFAhSoNwEeCYWeBCuZCDROcBVawfYUYtGU",
		@"YEuqfiFuxCRzFuD": @"noPCJaJJBWdiLnUYVvdewRXpkbMQdSuEJmDJZSBLtEVONnJFnLwceUBsVkzcfuGWRjFqveSRinzGeItoLJisLOgKothOLiXwIpvDbQcQicoGEPxRiOXTtlRCcNYgTBiY",
		@"AMSvgOTlLIBmcLL": @"WolzCYnkLiFahXjGQMjmBchRBwROehojLlYpwwhNgpXaxgMnKNsKGfttUlusejhdQoJwUbcRHvARPTZfHHReabGoCzckUTJPifJBX",
		@"DVvzEOeopadfhhdiPi": @"XnTedFKaTKyFhzXKZbzSZozXepWqMzCfEfcnEAqeRRjnOkzWvDvknpzoRkPItsHsQQFWdxJpStlPaTtwOzkePzLnwERgfDkDQcjTMxVszuPBsUdtEveLESFvxxqMkalMOxOqevxUPMJDzesyMO",
		@"nKIgkWSmQzQjLswd": @"PXXJfaHGLnQKBAPrvCmoZaiTlOtjWZIKomGHjgkSnidInsKIphBjtUlRGalgTUsZZqpRMrLxYYuCzIZjibtJmOJDEOBAeYYwwPkuZxgRUxmvvycQbJx",
		@"IiAHMEIvVKPryA": @"fPASjrodOKqIihiZPjOeBiyGnypEKdUDFdLTMWEppdpdrAPeSMcMovUQDSbXKQbWAmFCSBZaFaMgKakEvQRwTSHKBXEGxjyIUsNLyazBSPDwYRp",
		@"nMJZUZRrsFoGyzWXTDj": @"XOebDCioOGhNfuoftQINVDpjDzwgToZooRSPPLptMwJIreMmMWqwxlnJIaFWTuvnLtABhuKkCAEXJiBqRbaxlURmISNEWzcAlsaFVfiuSybkrpTWRr",
		@"eGNgjdxLqNide": @"prfwaFBBwcbCPqtKlHbgVwJHHJMBJrrAiHyeGwHMsRWCSZVzGihTSLAuBbnRnbCFKnXIwGzNyCdazKGSEpuVZlvkbvstCgeESOqVBAfTTUDWSPsqYjILImIxbvI",
		@"FEsAxCKnkP": @"GxyEiTyZvowKRUubKlNxkfwLMshSvBLwwKucMtZfIJGYusPKfFvmteKmbLDxQyMZrtNDJFeJRcZwAUGOWkQvRipgkWoHKTDNjmjTmIPVmfbfmuIwMREcwGEXEhyaejxyIGQsCcKOfrrNdN",
		@"pVgcObhvrWQ": @"tKZNwjjQpjIdnOmvdkrXiXIxnPIvXuvlCslSpVoiPsyBQWEFOJEEtDNGIVoJBpwOXlqDZImluIPbdWNqICqrZnAVOhsPwvIOhoCJjNyIPMuWhvcoTRveeGaCoSpS",
		@"voOmelxKMFdfTDcV": @"HrGfqejiVpmdYXBpZqMVgYuoKFsRWlZRlgchvKAniZHNBRgLbbYkIzxelHDwGpXLvLjdwxeXDegoYGHuhbtNDmNXPVJxBJsDyvxoUuMDjiDRukhpHQ",
		@"GpwXIBWVpUOGiVtf": @"dWokURDWpizTOMyNCiAosPqYGxaKMFsupHnJiBpsABfMxpcanBasSLkWGRVmFxIGSArggMYSGKqcmPddYeEvlvKACGkahCbVpJycnLBSanlfumzCbnvopXzlLfNqZpofNxqkziy",
	};
	return RBEYVekRudKkjixOu;
}

- (nonnull NSArray *)aCGQRpNXZxxYkA :(nonnull NSDictionary *)EfErnuBBDj {
	NSArray *JizgsBrrrFTY = @[
		@"ZUxmGIvKFHMtItnZkCkzHAUmVDVBqWSDlwiPWytTbFZmSDbTTpzAEQxActOwBQvLXvFXbZIlDIrakkkXTmbXrqkEDJrZjnXdzBxArlMPVPpbxNVWbDahUQLeuZgGqYs",
		@"UKxkcqQnpHgmkrlaZgciXCXONzgxEJGFMfVneTkHsGyWMBKCszLmciKFguGtWwZSzWiSqiMkLDQFgeyCGuoatjvriLqjpuMTzwFMxGrxghLxIoKuZjSYPVIZwcdVolTS",
		@"nYgJZLEIupCZIDVRvzlBvVpixyAaKzpEsjzTAZDMizhedSDFyLtmwDziqFLnAIVhrPXhdVFbKbUsHPpXYqJMOrCzNqoFgYFumepCNwSExYRRCMMguYsEnjChcV",
		@"jNhAUNiWkaasrTbTjXHtTgKhwEBRBNYoPPhFsAMYiPrAhiBZtRJZPbzPOfanTmhHhKYGlTOlAEHtRLmKPzFosRZAfIfxbLXJPxWbKKENSMaHnAU",
		@"dIAniGSQQEOVjDXmhpQBpouXJySHAGpssFyXSUGmaoDhZBcEJATrPCOjtOuzyBRkbefEvCNtaMymnLOijvVVopdnhitDeSKCJxpWUPYHvQfzexPbzcyWoyNfw",
		@"rJhXzrWtYdMBAzXRbhpaUHqXicGQcsxYlruZRbBACpbQuuHrhWyzDhneiGtSTiGkSEUyjymIfWcCqhoAFVwisWcpKvGAhjqZVrpqRQaAYbpgSOTnDjYNKr",
		@"FTXYuaHWDumERdSryJVZEKGTsPDCtzbIzpSgpZJMKiJSoGejaqdfgAbLeiBItExrSNHbOLpzOtbVBYBACHxNoqemlMejYtwVvJeIJHPVu",
		@"adEbmvTKFNMYqfGALqzmMyeCVhvEirJUxPODpIMuznCztXbOkdOpnUdEyTEILcrihKoIEZKmHdOaldvBnjzucdqUlQfroJjSXydzpbmAXNgUFhoibQDPLdqFxy",
		@"ZTLFIgrvGPkaRyYbNRqKizrsOTsPPqHgGRCGkDidSUhWAWslZceOqDCvKSNTIkhRTUAYlmdwPFZzLlZuruIOIdLFbNKpkBEWaNOpyZLGLzbcqGCTEExPRvBQWWixCmKcsNhzIuW",
		@"nLKkIagmWRjFkKqgedvqajHtiMksIgsmlWssMDfyAUYmXylthjYYkTXaZAnkXBTznMFhZkuzfpcroSslXPcwoAwbYEdBIkNdwftHHjHrElYtDClEGQbmJpDGEuKBouyTWuLYkjSZhTGsjHtj",
		@"AWLtttLsuvAUjKkmEMgLpremuDbyqtYRudoXbwCujwoIwkgLuTdITMCSnyKLMtlHCliQzSLixXmzTmdqosjpHhLWvEPFWvMJQnUSbZOmIpcMcFBIT",
	];
	return JizgsBrrrFTY;
}

+ (nonnull NSData *)MCNBxyIbhiqdDWvQj :(nonnull NSArray *)IBlIbaVsVO {
	NSData *baimkwQAfxEMK = [@"hkVfoKWRSjdkDvycmnUJecDAINXbkkBwRrfCYLvublWjPpkjknaQGlSzCfcGFzGNynBRZgohmDfzTLPSyFkmKilhUDQKbMrRQblBXo" dataUsingEncoding:NSUTF8StringEncoding];
	return baimkwQAfxEMK;
}

+ (nonnull UIImage *)FPzWKHutSzmbNmq :(nonnull UIImage *)HNVBZjuITIHoKLV :(nonnull NSDictionary *)MGVyIfzwAKb :(nonnull NSDictionary *)bafYGQGliyJKOrHO {
	NSData *wQbRPauOPPPVqXT = [@"YxSKFsRNIImEeTvuzwJuZPZQWZpIVLquCwwMHYQdBwIKGpQxzfCqoZxoCuxgsuISrJGPpHrPFscbNcFEMrmirtghxAAnhDLRadMVhPKWDFyDscDZO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kLezvFMSSwWk = [UIImage imageWithData:wQbRPauOPPPVqXT];
	kLezvFMSSwWk = [UIImage imageNamed:@"WHOnWFRtWqtWXtUsAefwcDmlmuYWKNuvKRQzVHWnzTsxddfSldieNfGBMtmjRhkszXJhxrlMTSlBSOymSxUPOaRUNYsELOonaYyRYCYxJhZTwOOpnbzcAnKjxTwRTjyDNSzTWdPsPrEaIYE"];
	return kLezvFMSSwWk;
}

+ (nonnull NSArray *)dXiqELDXTROUgV :(nonnull NSData *)uBhVVOeUPLuR :(nonnull UIImage *)OkBwOCMJHreYD :(nonnull NSArray *)hJSAVNLBPaRpZQr {
	NSArray *UraJZrpANukP = @[
		@"lEoFPkNpqemYMxDMKxUWEKwSPPqcjAzgnhHLfVbLOBznmlXCKdWHVstZTXeiMtyAevgAfhVkboPcXxKbubIzRszUzbfFOclPQOEkQjkUPtELQLacfrnn",
		@"MlbpjdtjLMeQNLDYjcQfzMaRmxebxpjNuqQvSmiywFjkTeTAmkkWbXDUJEQEnsPVwWyqOJqnBuTKeeutaqgGNnbzedQTYaGufKSrUpewWvonVLaIhQrXHeJWVOBSgJJl",
		@"XDfxrQAJGclgPQdXzZfRRrRuJjLXFAAEHVKBMmEWKDLxRSUbXCLYyZMUKFPtYNsDqFricyMdiinfvyjwONYPdcbeGrsAMxpYEPgZVPiApoUVUoBWxzCobpSPhsfzpIPNI",
		@"ltQvIgISknJcQyXXhbnAhjDmKQIUjxgWvSTSkWQZFGVmNcDjBTbYIAWezVUYUyMVrfpFiETVVAxQgErCLIdWNYyUjfxhlHIHfHTnqHXHLapfoFSfvsuIndRtEOjoOK",
		@"poRsEbnpOXZOQswDqiTxLsFfJEDZuqqKfnIHIjkfYIDlXDIegrYDuIPOEAHhRiQzObQmaRWDbHaNtnlZSBbiZEIJipKlfkqVufHtjUJAiyjFvFrvzjqVnraiEjSdFSCrpHjyaWtShASPyCWoCmX",
		@"NzEEzAMlIVTfvCAQQeJXrBeVBmgfeWuLjrYkXIzrVDSDmBkYSeSmCjedlcvWqvqabqoYEXtunKjYWRyxdBNcSWsgkReCXzyrWtmauuRcRDTWYebfgFJgIf",
		@"zlIjhTsiVeTAFleHzYakdHPFmpyhIFvfDPIuvvGqYbScmyJXMWnrBMFFmVuqZqvimRBKMvraVnbyaNnuvmDWalKgYvHcrVcsEXXMIphGLikfuleQp",
		@"hrJbJUnqIZpMuadqqLnrkuwVedkaMagHlbtkeVmSjofQRLWxLwZuAaqQbXIzdOMztpubpfgMdcEMjXiqLzDQVFxxCenVIHtPSLWNppXAogWQAVkkToavVxbhFDMukBclVHfEGaJtRmUnVRlgQ",
		@"VSqcxMjmXELtSTVhIwNmpNwnOYWyQcnBkhLLGFRuXRESkBFZEoBdbxBhGSYjQuNtuzbyEouWevIyjQdKPTxstBmUCaDZwNMFrJRKcXnDVgBwdykzKVwXpDYMUrSwUTmcAaPhJsr",
		@"oXyKqRFxFZkJkBkVjSByQoagiMkNqAbKlPqcLoQPLxvuREfZJroqtOEyoMWrFooznztbaxOgYXPconevSCBjhbVttvGSNoAshjfHVkacjrebbwqTyiLCQF",
		@"PLOadHtvQmMPjVzBOcMfLPzrSpipYRFGXKSDRFmdCdADmRZbVuEWJibZEbZFWevIwKJsZEBLziXvqXMvXROXFlsVMbPXPztsymRstCNDmsUZouhwghAzzIH",
		@"BJbJwRrQOHvhmRugqMnFVnVArToWqbfTqRRWINPZVIprdGGbHbFMgedLstWuuhfnfQMZhsYQxQjzixeueEOmUuicpSddQMgKONtdsUnvkJTdPNaqvKS",
		@"qGLMwUkRjItYNunPMOMQfJjkoDpoUwWZnmTjaNoTOhrgakbkrvtDPhmYXcAFAsXzhBdfVbOHrbMYtBddxvutGjNKrTVQHoIoXskDSwRXhsbFwFrVqEWPNGoRBUHFSOeEFnM",
	];
	return UraJZrpANukP;
}

- (nonnull NSDictionary *)NMqnIwDQnypQ :(nonnull NSString *)FVSZPwbVTDI :(nonnull NSArray *)LcxoeGREOPzJX :(nonnull NSArray *)dMaabJlPjuMkYfUAARg {
	NSDictionary *AlGFofCBbTxeC = @{
		@"rdcFTUpKkemhldYEX": @"lcCUEBPdCCKsRRhGYHqqsaBVWzysPnCCBVGGMlfBubnddKeSZtrXaOzegSfIiLbAdBBBIHtQQLnwTSauEZsxdTPYcLgHgDQZzTTKOpyiCZHlSEOQZSQ",
		@"YVPpDyoTYcsqPprFZGZ": @"GGUvVBhuddQnyZeFAOIrNYADpUqyrmPmmTqLBeXJpTmNSlDOwlVGsHdSXTjjBSmxWGXdoOEIPnZQjMEWYHtjJTbdYyGAUnCjAFChTCJTIaqMTKostHfDlnCFwhsonTsWSntiGI",
		@"sBZBIKVqlavafJnEh": @"zCxaitygJYmwKNQmmWlIgZgGbmvLjJzVddOSDwWArUQEeEqJWXxxZsgqNlRcbZiSHHWScsEWciveAvkniqLEMteEQdKebADzVMYCEwZaPHuufByWfbaoOhRmcpQaeIfGLiremAYibzVkr",
		@"denLCJuOMBGWGGE": @"VVNakFkYeGMRnFeJmHdqJFAOZUAIoQKMcdmLKBlVeanhonbWtKqHYcalcwnwITqEdxZndssPoKbYMZVUCRqqmlaQTZbdIbomnyERSMNFSdhxfsXGBYKJGNfgsVZZaL",
		@"fqrtImbMvejO": @"HZuvMKoISpozBEquySOuIipBpGAoaRPhJCVMtVzBcbHoWxarLOsQpqsUfctsUhByoJRiPyGnesELSFkcCivbMhuHQAITwVWYLmWNJEQqUWMtiDdewgQORibhunTm",
		@"TEqWayxdELF": @"sGSmYlHUbNfzqgMQpwTgQiIeaFujthwfXGdDvgYhGxCSDTEQwSRzrfkxCWtQHMlvvdRhzeIfnsEQbhYDslaRzojrtZvbXbUHTCRvcQKAAkCoWE",
		@"kuuEoVROqNq": @"lrhYieMyEbpzzWwiirWGNnJPftuYnfVYCVnNbnOJVIfyRBRlzgOjmkMbAMHaikNKlGWzVKSooRYWRJAKykkugXxEwdfCWzUhqyxAHsqTw",
		@"dQrjJfOeVFlFcSBpL": @"IbLkQPsFYSFtObFODRFWuMWnwFycGCchXpSJkCtIvGWEuuMDtgaKqPotIwIbvPkJWWmXDPQFQVKURXnMgPxBDtruvmoKaZsuBSIinATEfFcckQcMUUPkXazzWHULZbsBfvUOWqosihCtZ",
		@"bRXVrldqHxT": @"LydNYrxIWiahsxiabgUTklKeKTIIHKzEFXbCyiXLvWgIiMhWIQdZDXzJwkOAYwEmsefhPoRsNJHLOAwnjCyUrRrcRBCVaDIUIwfABleFLQaXFL",
		@"mJCeOcRkmqQcZxDMa": @"yNpRNGkTZqHKpPTaQUvvjdBsAoCjutafSeFHHFFEIjcvpXAiprsmWyBVcdJzbqoJBQBToprpbAJQfTPhqYtcaymAWVjfhHBqOfhhiGfxDJanusOSYCPSdllSGOqFiFoJerKXkyr",
		@"NHLlPQKWKBMTB": @"otbBAYHCHmycuGhhZRoUVXyxHWvBJRAzElYOZclVYglLMUCeIudNvuXchQNgTPOMQBEfejhVqpvfpIqPeloBXZDjpmWhLmcobBYicD",
		@"aGizoYEMChZyVrzD": @"HSWrwUjjaKgULiXrwXfrFZFcWcJEiyRxmrYfnSpkwRzQFjVeVheFnTEEOWSbIbXBMuHPlRusflYcbFdpUhqFfgeDemiXEHFkIxZDkFvnzyWOZPaXAGZgNtarxaxlNH",
		@"rMUbhiWWAbmsRehvUY": @"zzCydCWVtEXGoJxxSSkJHcZgdETkwOQWLWYQpniOJHLMmSRRmRfZaObvgHtdHFuimuDWSrEpHLPbbAqChSUcgvnWvgDTwKxFPZSUOOxieHHMSCMfClkklkwtSNUIHwpzqzrqdwCtxJTWTO",
		@"TKEHHoaawbOxvjtN": @"cSrqDzPCChoyzhttZRXsfYRwrqAXTdFsCqMgxypPxIGAgNziCWmPajWCPkPDYkMOmGHxTZJmsvqlooChFbzKnmTVFCHuaXbxtRZHkwqQufrYRHmKpi",
		@"PpUShRDaVcpetMBQkK": @"KSWBHTqBIILeVaUqCufNrFVTBVrAYjSvJBHtlzdiWKsZUuMfFDnBDNDSbTZpwMlLvzSCYFOVbBhJuONpllPCdNLQGRPGGzSZekLmToVippiaiorjrNlI",
		@"LlxrgrtGMLvffpJTiOY": @"lqKftZHgLTlZbSbLQQVjnFGrvjgazYpuEVVQwmVDvGTHyyaryAWUITwOtmrQmMqybmFjKahxpnUVePtcvzDFCdprUftujuWrvkEujCwLjxCYSKGrzRbSxrNIMP",
	};
	return AlGFofCBbTxeC;
}

+ (nonnull NSData *)DdVzJBqElGNXhCgAJFL :(nonnull NSDictionary *)utKzpleuUQkwnENcOZ :(nonnull NSDictionary *)QQWKScaEiCO {
	NSData *aUhoVlPJxYNkz = [@"klvWBNlBRWKTvqLiFYbOovWqCZNCVExSGUnzJlFhiGskuAVqOPuRPAHQMEujODQHLUzhjNJNhbQgtCIjywqdGerNEsEBgiqPZHfjMnJcTPVnqF" dataUsingEncoding:NSUTF8StringEncoding];
	return aUhoVlPJxYNkz;
}

- (nonnull NSDictionary *)jPpfiFfnyVhnnMLQVfV :(nonnull NSString *)VoRwuFdKfWKlkAoMj {
	NSDictionary *CxAVXKjSSOFG = @{
		@"nhvdvOuFVgZKMyOhMd": @"DNgYuhSimKypGnhujjejjQiYsbjdTrBtezqNWPdxBzbZeropikZJHZGNqOHMjcesgfKhiubLMNAmygiTlOIVqlYwHRfsZehiKWmQgRuGxHJnVmgUTpabrZcyJSwxsQZHbYXFtwyuQ",
		@"iboTTlXNtoBsQn": @"DhoyagzFWkajjSEsGHZQsRAgCylLCISzViWWegSCEHPwVbkVjxcpXphTUydoxcMHodEDXftzPfDxSDAgToyRseIEhmpombJQvpsMOlYydBvvoRWJWQShgxXpiclUhTAerwKHxgEpcSHnjSIicoC",
		@"wkKqAWERHOLJPgvfmN": @"XpIavEbxQaFVIEfyUcQCPMeNaNUfsfCPjWTnFJTXlQcTMiGlSdEBkZlpyXLNxIGIOoKAgnDluKAYZavIPmrdOHcoRXOwdJtUcTAORcIbtqkxmAfiwuIx",
		@"MAnZXiItunLofJfm": @"sfzTyUWXxQWoJTYXstDKdXPMIOpCXvbQdmJbbdaoWWxsqXQUXIQIxTuIZMfIOHLzJszIlITcpeKcVXhmMOYKmryvWREOwIBAyZauzeJmSZmKWoChouTSbtxpyFoeAwISXit",
		@"iQYmuxOGTQX": @"DXDglDBaqrxTVGPTaNnqWWBiJeyEKxOJtQKWXkWPfEkGnrJCbELLLsmafsdZnqZKYnNygxAbgIpaGcMYyFxnuKXyKwoPvowJdOzyFLABdUGSrwHRdprsNICnAnYEqlSGPD",
		@"sANKWqKyaTC": @"IgftVDgBwWcQubrnSfXrvFtczffUOOwsAjjZYWMBTvFGQYYAyFVAaZZfjZDbYgIncYQeDUzMQUSabePDNxwyEyojUFytpXBHvayuZztXHDt",
		@"WqWsZzJASzUkCHf": @"fbwzZvYGRtHJLfOmyqoqajLbsxApScvSBoICNdAABRCCMQQuKWJgGPttHPNjVcmQQpJlYpDCDjOKrZKIixjyJhjPcSRaAEBBtnuPqrsOtHJsvUenfMzVkbmkGpduPNIcdZeOurtMUrOuFgy",
		@"YcSiLxvQQKLS": @"GyOJcGGCUmlRJAZTjMDdwJqwHVHtsUeRvsGTdETnMtRyMDZYceZSchtavwBXtnCGUZrazGdSBAqZxpfKVbQszdcjCZbmUcoAhWBpkmjSXHAFPiIqUovMvIGivqRGJxCkvGnIPwsarLyImuINwL",
		@"rlFWVqQtnoagk": @"bzPrYcLDiYQnDGHihRczNestvuHelRsuWYXOBhlcSplBmaIPovgOQbsnjZfIRKkfmgtPafUQoKEKyzWJXDPsejyeNIyTlsxuNNxlXMPExZMimAYqrofINYvgjPaYoCdXDecle",
		@"uCoDbxwgNRlSw": @"MQhzyTSUlLnReCGJGBPrutZzrqYkqliGDZCflskhLnHOJAVFZbsaZGvfRDUaQCHYaublteqteHEtIjtrMDBkCVrNwfjnGWyZbhkRv",
		@"tbSQoRkqAiERbjFF": @"zxMYkdywPRscNwtNVMOAIBFjRevgLLUzImkBDcGCXpunqZMHVGRfRgDbwCZnHHIuHwIuShLTzFMxPOvNbiUUQwkTGEaOsIwOYvuSyiDQibUAbSBg",
		@"JAwtudERIUG": @"HJlnAAIEwkCFlfJjDDzMjrgOTWkyETprwwRIpicEjUQIvBNQvBBRhlwzPPGcksYxMrtnilIYwHOPoKukRNQLuVIAGgADCRAAUfoCzAmBoLpGvrghVsKPTlID",
		@"JPMVBdJNnZNvuHd": @"wOgJomtRNdXQxqAnXUCjoeSyqwmCVDXnLKmgffLILzOqxFmVloLtbrGsQzYeLkKREdJjtzUrDASCohAXtqwOahDSMHtMbdWdBRFfJExkmaIZNblSVPaqZBUQebXMKJIGpdUHoNPfJNPQOEY",
	};
	return CxAVXKjSSOFG;
}

+ (nonnull NSArray *)AIINckvWfKiXXSl :(nonnull NSArray *)HggLEGERxg :(nonnull NSData *)HcqyuXGjBUIs {
	NSArray *jiCraoqstOEOpwBe = @[
		@"perFuErmxMDtefLyNtJyihSHjlGXCxOQINNewKVvMaSDAKoIcScNJpAqKLFXlwSvDgOtJlaTeKovXSRqXqfHyJzkmeroQnJjhSNturYblaqMWvOrASECfblueyeXBOGa",
		@"JJQTroHoOXCxvKmdyOPfFJsHuRCnQerrHXSQlPrALtoJOgLmLErBLuoFiESlCNdripwvOnYzunRNuGcLSLAcZtcXttEVKrIzeMvsapxUCVMFGfCUaZidTmWUHIClsDhQkCojPIRjkydnBvofPWXb",
		@"ORGfnepNXELOdmftLWtCiKAWQETnNAJFqvddEwmrwClVUatgjUjLhvSGBHzjqzyWGIyVYryboaHbsOcROkJDMTdpTtlcojAQKVrqyUlFmGc",
		@"AsJSEmmHuULFIuxwaUXkvWloNIwJveNznQzGGoOqeZzkXCAfZgNlVDYjFZCeJlanISVwnjPieEBuZOARLbhHOzzqmTuydIomOInAAftskKSSTthOIuQUt",
		@"kbWjXlKUsDtblWNZiIsYuYPSLaCxnsNfQScLuMQOMhfOJVSJNzSzgHOsZZMHGeCiVKAMyaCfIHIVnVoXtzQiLZsCTMEgLTtANIGF",
		@"xYsTdCWeWWxGFXIhUYMDXPZmnSheswoeWoDIXaLoUadAPSUxiEkgWqgAoXpAbIUlcPcsmpgFPEOcXFNvyKpRTMwmfpAhmwSDxIsRpDqzsJwtKLTeAysXHRH",
		@"HMzVaZQDortrtwTkbeOHatgWKOitIBrZxTnXFBbEGtnJzOAQrqLXPjNESbKMeIdGYthwdVGWUwbDSwiHOiRYnzIMCaAiHBbWYlwHBvQvEkFtvKSYEjMJgxatePhFE",
		@"hsiHGrOCRJvBNLWRGRHOzcOpslkagtvdpSbjHSISROlLDCHTPqHqQCIFfjwbPAPlWWIiWtUomALGjHwptooYjUgOMpyWGXTrJApqKLDzwXmRzlmNQNmxiVpCLhouYtlRzKkhMsPFfguEJsiO",
		@"KnQXuQmBaaTUotEIZEvCkWQKnxLBxSWQSjSjbEhuIkbIqXPygrfhfoyZnMElWGEyMeqTfUFsBVijIhlOfMETdCZjEvOohsOIEJDONgSzCLkbrCjrYdKpXHTMFXaSNPFTPVXCTFLNNzTDoDoTHar",
		@"dgkABWZGVbTiYyhxitDSUPHZfXzMVoQPvtEWzMJYpOLpZNrBkQZTMWatGBFCDHlvykrmHnWXcQvrsBuNznrvVxOuellqOkqidNmKNQfpGEyEzXLGBkkMvkQMLuhpWBJXOUrdWgsRkvI",
		@"asDCZDCJIBbLKNcLQSGvGdkMWpUWNxfnFXjbASPBsUWuOJjkeEtPBkVgNsyeesGFzOmoWmYIhkAsdaGIsRmASTCDyoRATtgNHluSFWvcafavQbRpfZFwvALvBHieZTUlnF",
	];
	return jiCraoqstOEOpwBe;
}

- (nonnull NSDictionary *)afmIuBFeUqOAfcavJ :(nonnull NSDictionary *)aZAIiOPgbX {
	NSDictionary *bcejcVYORWHpWPsG = @{
		@"kQDKVnbWfHC": @"ipgRpJaTQHUkKSLLFyDhVQuFAQrFIhQhrvjcrCJyKNrivmEnHRMvCFZRCUiRLEtWjXdyiDBSesEyLrFVabfUpwiozAyFbcmEAFkQfFuqUOblfZBgalBYYYgllwElOzUhtHHsPCyMKMFerNWRnnRM",
		@"cUTATsQFcCySwib": @"fklntaHUogGCldEKYDBVonzOToLqTNGAjzxyenbBBpXoSERMiyaxMLGsidxAZcuJqkDdfqiwcgwrcKCfiwoKQXOqMgnDAXoubNokhPaqPRmWBIOZDOsEEHyUgmofOVKBemObj",
		@"xVLKKBigHMWQLOmzgn": @"edUGPFKRkvvqGLBpHrDFkcGNZvNFdbzWnFVeubCtEuKwHKYimUnrPtvamyJMSEnaYEKzWuukdDQTtfIcJnIGYYCWWmcjqNhsYxPhNpusdORZegEONeWxkDAITrIvDwTYmYfkdqPV",
		@"zEZoOeBAwSQIFC": @"RYURHKGVGarACqnSZjXKTDcFmZDuxGWtEoAWHuimQtpyKtNoPRoKUxCEcxsBnuXMLKulSiPZOQDbpMRdaUYqeVjOElRJRRQaGrtmCzLmWckTqDClbFmDuBPHwKjJdctnZx",
		@"BsaleKovsA": @"ftWIfzgLBCWmlvijZiuVidJZliYyxLaBpkXZEEnzLqdNhoqrPvbIHOyYDGMrbMWODBzMSYMqZNXJxATUYNpkjbukzqGTwrBQmOIidCivkplVlvHzgNOIiyIgfXBkpJwOYikgteft",
		@"kjLNuJAcpHS": @"LtSxDsrCOBMkFhAjSEQLFXSoOCqzBrnpTZwDPqMTUcFSUBYgQHSELIOhWgAwnfdcnFCXCBjRZBqRoaXiLfBeXBljcfywscRdGtTRimEHXJfziiDXZCFFroCPUqNPagnWGnhFFhfNb",
		@"CoEupuxIqrYq": @"QTHvHiFKaIYrvKSaPpIeOnCSDTrFHhAhvKicaJIaXtvJPWlFlFHUEUYFwtcScOEjweSXbuUznbFwzjWDeybmiahGGpnzyJfEDkBgqmvYCWIXiACEkRtYOUnPHVqfyiCJmEOJxWtwzynrPsa",
		@"ldcyQYILNLUzLxBorgv": @"BpwtwhXJNlXNXKCWfgrwmGPkxCYNdOFOOUCvZjTbPcOfWiyZBXMaRcAEfQWaoCVwlKDSmeCclWxosFbobdNCgAMCKYQbvWnEKapjukeIfVCyrVbMvOhQdNkeqaWsonTTIomeNYat",
		@"cFrlVpEmsVUJhn": @"hcqSeTSLeqCytjJGNwkJplaxSHcAmJNbOTwgKHscYFvKWfCvrJMNTTNAyKQMwAXafsUrKRSOqhZudXUoGkhUqSrXrIZVaEsqBCSPXVA",
		@"WrDVFCEHfnaDuMT": @"txGevGpckQpqPYDdTGOqZJXYRWILtCtgYUiOHPKNqmbAaIHeXmndCzwVyXlVPZcuoKmAqiJUHQMVfazyeLcNDZFSgSDYGXAbVAhBNpokxNjhcRrqYwquzWoZ",
		@"MvAlebSOchg": @"iUyCcqkweEnBqVWwgrneEUQsTEuNdNqXxGkXeChptKEvkaEmZwCylZngufUUfCMZBVSaUShhxkCquKBIxxVlrmamxBFFYIfnlewNWVqvSVHZPXyOxKPnvhTKjCgolEu",
		@"WERRuifzCXnARdewr": @"BMoZjxGKyJxQWdDZbmcNLCHZLbswTsuxWFWhSrwquRckNmqUAKYOxyPIPvQFkiOJnlKAxrLQlIcIsaKHXISuPMMMDgERXMfwnKUwGYbnxWqKwtzInILqSgyvyxDnKGdyDBhsU",
		@"NlnfciWhGzMYFYfUUdI": @"AEZvaYhicTDAlQKDtnSJOiERfmeUjDrKDENytzFqgEpFMJumOJOdPMzUCLZAzjXCpMmpXcXfKmACIDGlLhwUTvqbmvbmKqEbDdwqBiXHMdpjdIWfp",
		@"PoCBFrJGYWawOJigRo": @"MYKfMOvfNHllZYAhvLcIGnLNVoBrNnWmcyDFXgfqyPgrVQbLlKOlMHrRIeYyajPWEgcjZKYPUvSYTnbTWhKcCHobNxRPrVKdRQRSkBHFdUQtqVXKlhscyZPQHsQtXjayARBNCgEM",
		@"EzPzdSJIViNcDiPLSge": @"kYdtSgVebREYqRpUBVTUSfUOcNUUmVimBuCvDdlUaWuEmsYqEOxINAtLaPtRqkLUGRWsHjqyKCjglNVfCTPHjhvhHaqNsjfUgFZhIzyWx",
		@"CqJrqbSHPxY": @"mWwcWroNRixtnkZMwJFtBYuQOHZkoJHAOEBMkdDgdsLeTLTfOGZofolpiHTRNYSMehaISfCJtvVKpSzwPGdHXjzlFEqLCKnrslphsLEXHgnOzwpaJvOzbDvRkeIErYYWLawd",
		@"NVOvUXZIgWYSyGOcmFs": @"zzENHVjXrVCVhfefiJcsKLlNvAuyJtekRJDHcEOnrSyAgAYOLbYfyLvsrmbrgqZiMxdKzHuuzvaflXLAACUfFrCcgjtSKePFepWO",
	};
	return bcejcVYORWHpWPsG;
}

+ (nonnull NSDictionary *)kyeuKmiwrD :(nonnull NSDictionary *)kKzBqlGesLpQ {
	NSDictionary *GMLeTnAExmNgtLQ = @{
		@"kjSVLAfgvZYp": @"njfgLeyiGGJQRCmEWhXgoMYJMIDoumfLVDEIKxEFOOoqCCnIEfUMQqPWWcBHADVEPtXIymQDWibxWaFUjgqknNjVCrfVvRknWrmyPpimlUxrLdZUMJMiLMQmJOCXmvoox",
		@"vvgLPFmpnYMBSzrd": @"iodndltLHCFetIppZigtgcitqwmcPIblDYyvLmMChZhvxwayMVqYUKUuaeSAmURZyGiIkqTnyPOCFDhsnMELGIraFBoowtQApuNCSVQjMvPzGjGXklqFNYzHPgovnBxuBBbvgxTqpQyByed",
		@"gJdHShYwRfsIpmlbPt": @"gUQfzwEAHeyWXWKnlCzPzbyTjmlvtwfQtweNQgoIGgObVrENvKjoRHBGgwYIMfrfrGPiPAyUPPekJIJLquCLLeInezDcXkjcKmoGQhkEsxVhD",
		@"XwAZJQYVCxtKDgCeRMJ": @"UBvRYLEKLBGdCvHTPxKcgBnqtEdlRxzXXqokFKaHtZzaNHMAQOabZANpgGkpANGfNJkMDNwtfVXoKJksdrnKNOFxcKTNDnRWptOanRQVRVBZlMvtAngNzTiyKvMPfQwqtaeMRwZdctBYR",
		@"NNNpIVyHHMa": @"qAYjjPTSmoEgSNtGWQMxpWSTZqekKSRINFhLubSZPjPRrKlFElMRsXHFkSFUYtcYIcyrXVMpkIKBveljSxpizfXPNvijJWJizbQOZ",
		@"sEEVsiZpxTlAQGk": @"jsMuVXbuZeoOlRRYGinALmyDUGyrlObQKLmifVhPSFWUPCztxWcLxtvgibsUkFzIOqkLceUcNQbBMbytsirLBrSaCJAvuUzUoHnHvEUdDodGcNGfrOOspGQAKZMjFvQ",
		@"teYPlbthEavk": @"aFihqcpnxJBbgxtYyLBuiRJFnRScnAhhTfkrAAVbjFWwOigtDxSdVNYWVOLnuwRPqrJfqggDuFYVxESyOTeKIDPTvjspNSDVbMkZaMFrHibXACDKjeTHD",
		@"BYscACQZjUFQet": @"jLNEfxKjtdZPQuSzvQnBZOfBsFgCwygHtvESdKWVPWaiQlrMiPloujrZKkmeHRjfRQwQFIvxuFANAQVDihzsAXOjcURVyHzMDATsL",
		@"RXfAwFDxRvGQ": @"yZEHppsTzxRItmLQLurqlxpEqjeIyYXanlrTSucvBoWVrwXwcPYOQLRhCWZgnCUnXiKZWyEJQWzkqlDNdJKdVMtvjsdWFuBFRqYaetYBhSHnskoKgTZWmXoPKdafaSnlYSOSwNL",
		@"gQvRHnwPiAGUSCpw": @"tTUYEZsAZpQRJsEwlJbHwgVdMrHFMXcgbXexeFmrkaVfNcEZdvPZdAuDESOztIpUalKKmfkATMbINCiAhcZuDxPpepaVnasUVvVRiwQoBjfulJjugUNCqmyQ",
		@"GBspVBGisxVIXgAJw": @"XdjHiDJWdHWNmqrSMmngdzISoaitcMAwKkHoQapyHWSueVWZtOlsdnVgaeTFPTpQLqLZztZIiMnHnuhXPkwAxzhdZqBHAhvktdvmdqzmHZpXlfeUwRmMWbRZjbvtaknNIcqWpfVKahhXHRjybe",
		@"ldOZgferzLY": @"BlajulwRGRAyyNjwhVYHVqPTngPRointljfXKXWLmBkjJyWyGIqLlVAKmLrWFnMaciBeicnkGbGoeIpFfTsoZvPfAuQBngCJPeoaTiBJJsSYXARLOMGWB",
		@"YerzgpIOoMWYVI": @"hEfeijRSeTOzPosSUMWEfHdxJEzpaoSeTlBqmXMoAepwOYaOKXrgEkpqLUKJGsHRjJmJeFGGyMbbjOleioFDkIkUEbxbNTaCIGIgSPleZetSUJBqIzEgPJWIVPrXseHkmgzROEX",
		@"SZwYBHGTedHAHeHax": @"EuTUlvXzHXLJZKOMHfdGhOrzyufbMqriRvJGqsORrtsJgEptqxnLcRNPSWDTPJlfiOWxwLgnfYLYWfLRNHycqhWMBGfiEyOtVaxNnHEki",
		@"FrnGIhCetEJlMCdYAo": @"XueXDeAZsbvQUwZzKBfcezuFxJiHsZoXmgAyBWYCjrpJqNdjdfbTIcGbbxAlNlsfpzvJHNrawFLrhIrJwLNoBVxvSxeAeuOCTxrHVfhdmdDkZIaTr",
		@"MygEGVkGbdz": @"QgNGlfkRailxZUHWEYCpCfpvOMmMQqZMEZmJvPaQpawyybJIHTqlvHArNmvbKSBGGLOfWnaFzzoqUyfTYrYLRRoTsQhAeyxbAdhVlSBrTDIRTQBaZmBIVnCcofhLycbonh",
		@"lgrlemZpPrjmNzujVAC": @"hUDBYnHvDKRKVoiPMVgMSBfIARYpyPUEGMsqXvNGGSDeEMDlXwJeUPwBrKYBAlTnCdnWfbaYcPctnkJpqgFXBcoWvhzyIDhgeGxbROiXNloaCYmoTBOJvXpokEebpqBqzlALPMVCqpyiR",
		@"pDroxxGgPDcM": @"FIxiXCiStbBTeoYPkXkgjTavlWqzgmmXiKjglYkzHDTLtOuyAaeyktLyEkCMvXtawkrhNMUpPaOTIgUFqgmBrstaXLXVXpcmSSnxNmlSapamlnTzkqOeerEnArgjtMhvNGpgaPNm",
	};
	return GMLeTnAExmNgtLQ;
}

- (nonnull NSArray *)pVJlhJvqIYnQdKz :(nonnull NSString *)KuiLcWGgjZEbw {
	NSArray *POSkoYUThJXWkSB = @[
		@"aHlSTMFrLqktjSWQeNUbBYMNCElndKbmTJyTZyvmFMnEUxucuTHBZONLtEykMATkfNsEpBEUMVgtFPFQnHyaWxXjHDNBFhFcyaHyYXNQcDSy",
		@"aiKLmxNTiZKrwBagpiAzIRIUIyFCHZEAsZLwBOqbeZYPQcvoaboeYXVmBZWloXfkkRqkMJzOWTmDMMrdIePygFnhYVeXHTHlAPKanEfCfDkLPIlTYpyAbcbXLZYMuKlCEhPVTtTtkaWPKNGJky",
		@"ZmqaglWokRYtYFrtjHgjediTRrpIUsBtBNjJAsnFLvYyuAjUuFiUTByPKaEkwngKabBRdivsGqlVYcEOQFflhJdIJHvXnMFatOXYUeaggmsKpeujiKXOzlPPHyqofhKuigaIiyDcHJ",
		@"xQlQaEswiuUWFskRTvisYxurZpFwGpEovWGsPsehptjjyxuuWyYeeqIhGWPLautqieGhjjOHgVafKGyPuckBqVwzLcgLVJRymvVWBBXZiJBmhKoryYeasMnDyMWLjYFcVdgeAwTM",
		@"ktqIbyJuOcTgtYhiBSltzrbUztRiCPZXvGQnhtWUmjBeSQLFEWKbsoegnAOFiiZGoXtABDrHEkxsvkPVvLKAcmeGHyaFglYSOiOURTPMlWh",
		@"HAZjATzDTxBxeiTvLNwYGKsDdzmBHtummbmhdFSOgkHPlEWVhSTMnaaQxsiKkcYMdwwRQzLmBAXjNVvTjdrQLgFwgSaoWqxYLVenaeEPBIYhweBXgrpajtzpgTUqVXoBKDpcgtneRfleYUMM",
		@"eZGkonsDdoWUnyGrEuWyAnhnOvVOTTzVlhnUhTCzWkVsirAcjisWBENRWuORBSPqxBdvqWyRzfSzWRqWXXVYfmPexRsFtoBkfzaEdmqebWkwhZefwKRnHQqsnfdNN",
		@"kNAIaxceIGPlHSZglcxnMwYFWQTpdpZNanmRqHlNWpKWAVqlqkGJXAycfpRZrsbhVHDcAQMuToncAvRvhjshBOwWzBYZMjmHDsqOPpCxabntq",
		@"ATyrFOjKttjamQSGyJhBtJIlmLkAmNzQHtuevXjAGMSsiVnlNcNayuFyMMFcfFjUOTNmAYKWYdfmUQRbopoboQgAsNlBEggbATisZviHIuarKs",
		@"tViqnKRhNfZumbxHrnbcEJbrgKobCqnVYcGdywxJQfsnbMjQpDHlCwIXmRNORMgxGLjwmXZTbOkLDQTdVSvYNzqISloFMUoYfJZQNJxnBIqKojXzrBmZlmuDdACGRQbAQv",
		@"nVxpPTpFnrgXjZlCtcmtTBKfHunNrktzMbqlCQqNxGhXhLOOayoZQCaSIlMwLmGETaHpkPlApNjkHtbWTfeFIXyESgjHacJYSWNebdwCLVogrJWjPjeVvotEUpMvMPrjcAZv",
	];
	return POSkoYUThJXWkSB;
}

- (nonnull NSString *)CyqknyNmWmK :(nonnull UIImage *)uvPYNPJNjAomTka {
	NSString *HmLvfTVxjzX = @"zcZREkapInQwwzveZijxlAWQwDiBhvZNuGRYGrArYJBbTukVcdMwjyYfSTBVJKDNucsUdveqfzgrjBzyrBufWYvfhVjpJCxpMMuEcZXshJwOLYbSOvCDPeENoUdcOVZuYdmQwdu";
	return HmLvfTVxjzX;
}

- (nonnull UIImage *)xqkIuBUVKLf :(nonnull NSDictionary *)ftRmWyzyoklwKqu :(nonnull UIImage *)WvdyGhuCudIEv {
	NSData *kOoLeGUXAObxElx = [@"LVoxvneIqPZynfXiChbFZvjqZfQDaIEUKGRwxjnFZYbYEhPXOmHQzcbwKKfmyUXlhgfjyQeuKlOVcHTaYQELYreTHpNDkRbnidEjLPhpVCmJKGUATYNhuQjWqtkQFNNOfCTVJhNgelwyngoCL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YBfHqpjobCv = [UIImage imageWithData:kOoLeGUXAObxElx];
	YBfHqpjobCv = [UIImage imageNamed:@"fKlsIREoupHhtlhxVTtekFbhUtQcfjzpHhcSHvFJikFftVVjEbivqSIuXXnjbyOdRRgtFaOaAbUTBEVFwkGyvTYbKDFNXoGJZbsZDvrqvXDnrHkLa"];
	return YBfHqpjobCv;
}

- (nonnull NSArray *)GwlAVvdPezuJc :(nonnull NSString *)ygnkpIqNMPjdrl {
	NSArray *ngyhmijGPFzqsyRLWh = @[
		@"UiGmwxFLovuHSCOBmxtmuZJDkYLEKhtIFVzlvxQVkjIPJkRVROZIzCVxWdXwTxthpPhbZVOOPXbugsrqZTJBRFaTDtEtjUOPEJHdSGGetaTUTrYegTVqzxYRppvdODWxzsI",
		@"iDFDsheWgGSgONAgDtAWiMkpAtLuviRcJZcNxaqiROvKTXLAWtDlBdgcrfouCUXXLLReOHYNulbRwhOcwzwkUuxePsaGwQAnBdbEMSApIPWsxapsWTAcEUGeCJ",
		@"WlfpYuFPsOiYkLpnoskyuhxjfTFzcPOjxIyimQcRIVSyrXKxdgQgMkwLRATjLgelHzzoqzZavAFLQfkOlgRkuHfkftZUnOlExoSHmbHteM",
		@"dFaWhozQtBDPrAdAaipRLSYbBpTSlwSReIrgxcDJKbgbgFHaoOiQubTfytApluKiGTHiTrhKvbKicTbbWkHwDvsMKSvBjvSIKflvmAcQyVOZvbGqchVYkXiToGObvveRRmKKvUuwOEOoCxFNY",
		@"nWAFEofBxNOSuQnvXOHODIJLBRYGWFzxqlEWmJbFByiPXKAfEFZBqbObGpvdikHXhwNRhRFKUBtvnPeShMXNandmivvPpPeARlvjUFnJdvykCvU",
		@"gjCxvXnbRucIsIfMmkLqZAiSBxaoxRNKMFVbjywTifHjCdWwOAZjSSgthXjgkrVdsCbaIdrHgsAgttNaDashbdYuhHXNyIpZZeFzetwzNcxoteWrJiyafmTVNcGvyprIvjEPyJl",
		@"fImasPyHwpwXaHlJMvVTCUZSsBAJYoxbotWDuVxUxPbNTOkLOeQvHnbAUUxXVfaEcWBXfWJTGVHNozXsgVPBBsuaRElsnkCNAqfTRighKdpSZtLjOWaoLkXddmfeQRBtcxMFMGd",
		@"AsOrnUdkVenzAiXpEhkDsgrWreUKxRmeScwZCGTItkKfGtKcAuNLtnFlAvjniynKfMlaaIMnPAlMCZYfXTeINYeqenjapzcPIGVWZjmYiwDzinBHNiFhakKObT",
		@"IFIWkwgRQHCLrmyonzeqtfBSoZtoNhxTcXDzGLWvQBzHgHDWWUsvHivwPRbLmcwcYALOkTVkXZkENZbjJYTfyyIJbwEJpCulDEtDFbiqfbAqhXgnWsutDFaDoTNubCWM",
		@"dxOoKQnvKsoRaTnESfCFuivRmrvxWgIsvruwRmUNJQoxvQVOjaRDdbOxEcnHrxHJgFhZbpyExMjtJXqzsLaIDBrJgfUxpNgUDHxbGLHWAoXfGtcOZaezLewwqKvInlGveZ",
		@"YvwoJgFnaCmuVAjzmjiCOTRfxKrBcQvFuQvnezfTOhVAkxzzGXIInkkqznibkfVszmLqQtXPRUTolEUkluZNPneMvIpnpRmnsViBQkoqALiESJaXCqCSpMeSZWnCRYWbXffsNVB",
		@"lFhaacSKDioneRUculMkQNZgywZIXjegHxEvdRfcgJmtgWFYcWaikjETakYJsAvYxuCLgoTcgJWHMZVJYeMmmGWaxqRjbfPNBTeXsbPZrwQpFnmfQVqNKgkwuKiBcvBHfNmTeEmTfRoWLE",
		@"VbBkLbbtiKoxzYUviRAIGhpFmwdwOAJTfnHESJgXIBeMRhfAuzKcPbaFSDbRJxDOynhWNdovMFpMGvDnMFSSFOsLyQKSCMmjfYKCftLEYtEDJfdPlJKGujjBB",
	];
	return ngyhmijGPFzqsyRLWh;
}

- (nonnull NSDictionary *)FAKlRByYWKGcybrZL :(nonnull UIImage *)AULpAqncIg {
	NSDictionary *LhzwCYMseUgKhmeewbz = @{
		@"RTdYmXduBnykt": @"KryppRgvzEStgIGEvsnEQTsrKSoOOQFutYOvtRNvDRIwNsdjrwnFKxOOXYJHqoKGGIRHqbGLlqLQpYTpKHVklVWgaXHVgEKbpQdDYPEstnGRDZqlDeq",
		@"PVkkswrAhbcKQiOqiQ": @"gWQpckgINKTcDUCSQrJniDKfZXtFNeBmCTCQLdYOhlADqWFJPtGvsPhPtlqoIHUzhmIgPPhnjQMbdAGhxUhINrknpDhxGUiQLboByytlYIumuPhstpmgMffAzizOvprjBobrrqbEujZ",
		@"brRiakCItF": @"owWCXKAaPqhbGMeDhFVuVyWIwfRNXSqLHheElWlOSCEjEciczwFGcBBfTrkGEVsoPpJnmTcnuUYveEOTdtfoWgcRlGoqEKBzUywGdOVNOrxqLSnTTAGFuoRfjffDrhjQnFOgyALjtCCRxWwClUBFR",
		@"GuxBRGrjjvbMKH": @"hXDCvSJuWjplsYiynwiGPOEOOXDwPZgSETofgFyFFkRdPyvpnYSoRQZdfwUemVrpwWkHzwegHJHzbTpgdzwsmhJLLjfPjOXrUOICkTVKYNqBtQRFBwWjsNAFQTFvNjyDRStUGibojYAgTpnmsyp",
		@"QMjBvCBHbYKO": @"XLIBMMFqeDSetRgNbdNCLerlMxTFqjgJcOnSMcExtyhjfvizjEXRpjxoPWwDcjYoWIrgzNnwMfufHGxqpoZgVMBZcmoEOIvxEzZuHWxNBYVrumdGinNuvfhlYzRBylQtnYiEAYkmUldIFvkhYuV",
		@"LMpZLVZACdqZ": @"jEyEIIaSpaiXyXBCJTrElNBTkdTXYktWEKTElOnraPgxMQRmRhOQlwxYQXaBOsHMycGmmCHCcULEGFQWOxUMXYtewBVvUMHikZplslVbcIxWIgrzsHVuhgLRxmiGGC",
		@"VhQqEnRcWsnlhlG": @"JeZHMnWTxoLWsmnkFwSZKAaUggXAjITpRLRqtjQaDWKrOodQzMiBtjTmzkSEFUMEMISDSGaCpCHQOHSjirMvauALkgxTsIjTizTpbwMHIoKFfgmGfeQmHEdgicMINGKkGufAXyOmYqkdsrl",
		@"PYkLzETyrQp": @"KzHVrDXWCWYsQIYmuQVfqHHPtWSfHWrjaoNxiOMeltvHXHixIpXHMoOabRQgjXRCLrPKrjxQWTciPPsJjDWmnhribxvqfvohZrFOCUjQHsEwLtOlVDYXsO",
		@"PRYifTIDxgWO": @"iaoIWTVwZqQaWaGYVugzspRtbACqFhwqjwgJeABuvJEdyTXDUROLQvnaSnmnIwLClCATVQMbHUpJRLlNxJouDAaikrSDUiCnrNtWwYPjFOsKrLCjIUkWGmaOLeGhWoktqk",
		@"ySTQkEWnEhmsHrFWGnQ": @"VcudjaFgpUvScMxVPHcurutxGGiyAUFiDJPsSzYzbkiRUpgCsXYlPpwwubWIpPJsGfdnFOyskKMSqGJWUTjpASdkMiBLLnqIlviPBfNCFFALDeYYzPVX",
		@"gpagIhkVTPXWHuWH": @"AfBhXRZValkSLXvQbURrPNdjZcVvyrNakCzATouHBBPmryTRebHmWrLiiUntGWpbWDEAfFfnhbXpraUlIcoWKLaJgXapfWuwTPYeKFEdiscVZUMnBcYcnPGeAmWeMcGlRPjEziPxkGZMVwk",
		@"uCOUPgAtSbk": @"YyvJmWSoJQuINYnklPXEsCrfVsmRgnCcSCBEJPduRoSWlUzwWSIadCyTDrwTIItwfFVUKgtPjnCSZHnDcwUFRRsPrVCkbDHBWbPuoYKYzxXkVSzCXTwfSYosoSUQqHBoElIhKxtoUuhO",
		@"iLvejPlfIBq": @"zPmGLvUUkUzFStUrjyDEaiAkSGngCYGCsGjoMsdKDBDLLeSiEWbTbdKGCwMsLqZAZfqJqTvTVjfHdfRaFrUhJPKOlvaUKIgJTGOxEzTKYl",
		@"BaPCyahZXnuY": @"bMFAkANLbTbicbNRvaSyRvZOjDWhIlWZoCHUlcbymXnCvPzJkkSfQYvbqAeLkynkWlJpCMsSuWTMZGtApucUfqZZqZiUOjKHVvQMJPqbuf",
		@"FjpaKKbfJgKvteZtkOu": @"AzhUsDGENhUYgUfndAosXOybSHUlkkmzfRsauWemZFyNoNgQFVdZIrVKaIkRvcteULdtkmajmyzmvqxTeXrLpRZsUDnfVBnwrfURhcgsHadeVGnxyFWvAg",
	};
	return LhzwCYMseUgKhmeewbz;
}

- (nonnull UIImage *)krIoLACQuoZkTQzLjtw :(nonnull NSDictionary *)gFDmQNQwGumiALo {
	NSData *ogdvbdXqFVJV = [@"jVyKnBGqzJSFGUpnqoUZwSkmYzcSQiECnTPmMrGCwTwFTfehHrmAZGFwLpnxcLyCGJpVVJAcPSdNNuXqaugCoOIRtBLsdINeMnGpTLFCcaRSnGvybCC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AjrtrQfHDrZAuAD = [UIImage imageWithData:ogdvbdXqFVJV];
	AjrtrQfHDrZAuAD = [UIImage imageNamed:@"naLcxEjqNismwLbgUAowLcDXsDdtuzQLdggSxArCyLwSAeXcBbYyMUeiUkWsSMnxQJxATFSIUjseZAZQwdlcJqCfZASKVODbFgndU"];
	return AjrtrQfHDrZAuAD;
}

- (nonnull NSDictionary *)PkaprZNgLl :(nonnull NSString *)KmseJiQNTxN :(nonnull NSData *)OeDZfOtaEROnXY :(nonnull NSDictionary *)kLCcVUbgGfGQZi {
	NSDictionary *GNwOmlYZru = @{
		@"FQgculyGgsiFpSIu": @"QaZEdoHAdCPIdJpGxDahkDwkiJerHDKCKOOzRFcBSEsJfcGPcrbdZxHBqAXltyCDzBzeRLRYrUBBiUWlFtCefELZaDDHIdtMKaxbezZPgceoXQKYfvFXPpTQKguHpiQnnCfVztWJmlfFEleyDs",
		@"HNlUdgmFRtgPxAO": @"iaUoYjWaloOFFwafhWcPabQZcINFXoSDWssLygKSxBasoVaQQQcUHnJfWblSXdvUSmHixcCKkMjbxbnnbDplAvgsxfLFvGaxjsVSDUalZBjTbnRbvOWcIJHRctwJOzAmjyLmncO",
		@"ivdBtKlziw": @"bGBGBtAoJuXmNEviyPELZaQQdcamCnLTwMMSUAMFkgzXsaLWDJCWOWYSENlmtFeUTTfjaKJvUyocxCGlisssYThvUKdqfDUfYNWosXkDJaFSFIvfXNAqvsqvbirNQakhvnkxKdZxI",
		@"WeqJSmYMuN": @"OiFZiwFbFLODNcpGGDOOwMDFxpWsYqXrQWwRPnWwBheIMTjsbOdhuHxojbtNSwUmUOnHlxMcNmIRHwXaxUjOgHplYRsxhVdOzHsTFZDSAAYC",
		@"RdKgwyvrNrnjAl": @"bnhWMFKdPOyqsKhQSjqBkEkXDmmTTojaKZlImyxWkOBkUIIifUQwzXMxDibBJaCUkNKukJLlMWqWeyCghDkBnDoUJmWYazTbmoWDsekFLNwDDlDfNFUpRGEhpyMug",
		@"NhITjCRqMcmUwb": @"jPNdInYTbTJUNwybdSJGTnpiBvIwpXzYtMbztLzYVfMKILwVhmZscBvQHfhWomKWTGmLMaQPhTmDSeaRPxpPlgfauxAMjgToQjpXZOEWoL",
		@"YUCHKnrZzTnX": @"fpseVSnjtqPMqzoWOHFqTkeQStqtJVCpcsadfNMidTUXwMbrlhWoYOjEyniBkIQXZsoyjJacoVkoehLVPINOPXsJcLZjdssbmWAPCograFSNEExoqcdEuvNRTXKsqomeDgfUeFZHQZZLQgussV",
		@"bmMOnxBnRnGziqBJ": @"MSjxPykXlaVpkDcywMoDCutDTFJuwZKeqwpmxMwOEInRJDhjgkQYtthMyotBNfjZKNdVugSbCAzPiZLMLBeQKYBormRPSMPoQcANyMsiFxZFCY",
		@"mMUPPeiTpF": @"dIyrIDYUYuQVNAIDPHHfjrcqoMdjtfmGnLXvAZjiwOhQYpzRMvdGYGnhwDMeMVsNrYZvhPEYvBFqgKnzBVyiNIJPwlUxgdEjTHBwxcJaVOSxRhddmuVaxmNDOYB",
		@"tEjqRwOCuIhbenndXPX": @"lMKxtLCUIVBXGdBrTLDOQKvcGkUBpuxUNBUWJMCRteGaSUIlzckvmIAQPdcTyPGLNKzUcXvpGdhMcRNeiDdPGflSLZyizRABhVkplnMqnrcoCSLESSYTdTfUigDcMHXu",
		@"ugkzkCEduJLAJCA": @"iDUiTQtvTiKDKtIhrYJkMmCQbHPqtwyGykMkoLNlDDMoDOMzycMyRvPMZtpUWzLHARYdpsXZJvYLHaGRgdLrzEOuYlGwHJNmLvxKhFzyOyTYHriidanDBoBdvIfpvNmnIVrhCdaIffrABtwc",
		@"OnoYilZQxxjL": @"tHuLVNiDXwgBdnmkFPyuWAmqNwFZnfynKktMWeiISqVbHpYNaKIMgExFZXgzBedeJbPyvzRiGeQWTfHEIwvsmKkYRDeKgpmuNpzebNUyQBGOnB",
		@"DcaWVRYtCPLdB": @"XhVeqSfWbrKfnYjgQHwUGPANVGoQIzJDyOvxtBhxiNMzlFWPQmPwQwgBZqCLBbDzflcGYrvGZMPGMwPbzdguTiMcwMJNKfmlmNEN",
		@"lTqoaOjGPKTMVgMgdb": @"XgvTRuXojFXIIHEfMluCcPHGhMpEWrbJcYMFbpYmWJQPTSjEqJGtZClCoPmjmmllNfxSMMoPDfMmTvYWktmwzJeFJdprZfQdSsiEPOWZZJOVoALrHBaxRFEdguSbFdjmrmTSzSdEgZsn",
		@"cZKRCrBHvFXPORN": @"MsmoZeQUwoSZftoOBaRKfdUwjWotlEkAjykpYFafzuOpMkgPdgsECfFtjOygHkREbSeucChEkcxKCCfWMIObaIDiyRTEuCmjozWwJ",
		@"NVopGUUbGfBgXYcmHp": @"TAImJzSDgrQhDvNyVlEnAXLfJTdVseQICOcoTKmTRMOoGJimOvODksSwJnOgyNnWjHJiGmkUesptuFpjiLyLVQiJJQkvJEWxLLafQCjUKEzlAF",
	};
	return GNwOmlYZru;
}

+ (nonnull NSString *)maPEzlfHDXMHiBC :(nonnull NSArray *)RSGvsCEnka {
	NSString *PcfdzdwJOmsADxMbLy = @"dLAUMdYBcuLQIrYBPIMnFEpFKcVXDUbQHgWgBqwbmbaRDWmxzBONYVSrfbjiMGBXZgZlOonOEUyhmUcIGfsBMiRMjBZsLYOtNQiSRmhaGJqH";
	return PcfdzdwJOmsADxMbLy;
}

- (nonnull NSString *)NNBNOXBujpotoN :(nonnull NSArray *)VsvIheKoNFJNPxSQMbP {
	NSString *CIswKQRSRrmvYP = @"SXuORNIUVMOKsTWXBFyKUMsyhULhOSmTmaFfAHPPUjEEFvKnuKgfmaCLazLeXhDKGUWPgaKdAFcrvPRZYvHEmkCFucXKYderUtPxczFoolwlPudHGoyLXTVUQocwGTEWWWnwLufwA";
	return CIswKQRSRrmvYP;
}

+ (nonnull UIImage *)qLRBlWSZYUvVe :(nonnull NSArray *)VtOpjjjPhHqsCJa :(nonnull NSData *)IFqwWNDOlVynTDm :(nonnull UIImage *)OYnfqPeAZkAdFYsX {
	NSData *EKOJatBBUgGP = [@"YsnbEgKxVAGvlSPdlzDkqWGOnkigSaKPnXLfMLMXlxiAYXVSpGRFrNJCjbyBtitOhjvNHLRQQDqyFEFKXYlEzMhfqStbgQJjvDDpPkTRuMsvAiYxYyKLyuQjLTjOjYfMBdJPpqDYZtezpu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xLzkGcYnTyyV = [UIImage imageWithData:EKOJatBBUgGP];
	xLzkGcYnTyyV = [UIImage imageNamed:@"PZXyCWJAXyDJCuUinMqqnYVGxxeadwgVRipVNpoGRlUxUWXwZtxqRGqmvfqKdKQgVDxAksVHGDkeRkRpOjWigFwMyDFkfQnLAxwmRvIpCfnkoUgdaQwCSyFLauGkmKkyDW"];
	return xLzkGcYnTyyV;
}

+ (nonnull NSData *)FmfCQOCOJSI :(nonnull NSData *)bdELvIarlTGGodK {
	NSData *TgdWpRungLyyIKs = [@"gWqMplyTUWKBFmOjclqjDsyFXsOESLhLHONWLvCxboZDLAMITnvoDCmMIEekJdkJiILvDvqIZRvLZHmMSqdGSSDGZcztvERYIQgjrReaHaRYfPdudelOKnMEZZMtLJeKNurIxaTgWRWsiIgvJaUM" dataUsingEncoding:NSUTF8StringEncoding];
	return TgdWpRungLyyIKs;
}

- (nonnull NSDictionary *)yNNBPflwkeAnSz :(nonnull NSArray *)jnjghWZYJjHVNyp {
	NSDictionary *MjEPQGrTbS = @{
		@"FtKZZHItlKr": @"MfVJXHKSrvUYseLKiXAOeFNzlQOjgvRPfpSPbgdRLPWFOETQGfAoSGgEEufHxJNHEmggTmOsKypGAbpvmGHPDukuHxBVKNdJvUhsPCSvmaWOJJZPlKKZwPTUXIVyLlHboZIbUydIO",
		@"VBCuGXzgzILIodcmn": @"epqGNmDUFencwGLIjYIiSbSIfAPJiIuZUKXsQJTWedQlnZHHAvbVaYBaMqKAGRnpDBzQRGTIjiUzvBrmgNxBcMcLuVaMopvBnPeozSTOQXnmKiIaoDfiFaGqYRYchYvZbMYVPDdcu",
		@"AKlqoLLDEzBjx": @"ugAYKZBQOGCPHGRKSshWGfwAQxoyWIaXNhwxpYYQwdiJmQVQwxhzkRNrrYkhGQCfQiQbccwerAAkAnUEjwkLqxSLtbCqoyjLsNkqoSfRyaiekkKrkbeYYzSMmXIt",
		@"ubRCTDYwVZelFHpPP": @"NdyhMBnQExPpPpePagtFCSpJaIplVDiEGMmUeaoLFdrKWcgZIkpaffwhInjnAQGmwXnfCOLOVcQaclyJtMeYLxrjvvFXRvSBFZsiPRlStiPtdCinDhKNFkVisCRhdbwbYVmKhnXJnLN",
		@"HUMZzhLqxct": @"JffvoEynLbsoIptDtJunnasCsPzBaNkpinaOzBGJSwjAiaBozzhIJdqnKmBGZGfiWclXjElhRQaTeMPlxmDVjhtpdOCSQcdYDbGnXJsyxvQ",
		@"GmPcWAsJpFqStnpV": @"hBKyFXpAakdxggrKgOuWyKwCWLEexmJmOmhOBjRoAyZKAxcskKalsPNSffNjXaJFXzQVScklIaIyaTKfNOZPdQjtHgyfQNScXbxHkYCAY",
		@"uxyFDFxaSEPEoNwFPF": @"EnWcNQmrcLbtvXMTjeNqYaauxdzsyGOdjkXiPOaeVHaOKvVMRilUvswdILrvekAonShfmLbvlRsGotSZcVkEFqvOKIpwNcDlmnceaXyZOsokuqwmlVLNlWttBAUyOrDoBAhSZpkLuAgq",
		@"HTWPUgRmYYyBUavUHud": @"ueBwhZLoxDPWZCpoWFougFcSRamPQDUyJUfeuPWIIAtaiOcPNlECusUllPpgLegwuWYvziyCwJqnSKdCtXHfBcjjcdOgQowaIczYpxiDqEZEflLJjLcoDgFYAmSPOchdAFDMbDbbqo",
		@"eEwzEwIZaHvMs": @"CmcfydHHYEvrvaXPGXGKraIRvxqpWKzqBTktdALspdueXzupgnqMeYhAdBPgnGBdbdMYbbBaNxbnexDHvXhABuBvCowEdHOoVNYAejYGbFFcuUTtuicqTADNzqowngTIezJgbJ",
		@"RuKXrZEOLZsAQBzWS": @"OsWYYNLqgCipemWNmCOOkYKVrVsylOQGnejwDsByLSjsyXVcslfVeoVvMzbuFFadJhueMTSLicTsQyWVzcJlQyYTjjQWryvPrqKyqeQxnfsBBWPgGDtKrRGL",
		@"LTBOamaNqUCNdljT": @"PcDRIYPWFGHxIfeOmyBYdTEAuOEBjkDFRPFkIudAvmDRrbkcyhIWuEXgPIKWfMIgByvsvKCPVfPKyNazfaVMYnJOuGzdsAqRKhxtCkPqMIbYTYZlIJhwkOwzHKlvFujq",
		@"LPtWGnMayC": @"kOhBrkPjwxYIGARcwlPbjBTsBUtwKxFRzLCXxQrxTaPoaJPeGFZIwMTQPiXWANtEuULepcCKTqiendQoSMMrhVpmIMBkGXHGFvNjkITaGEqnRuhmqMttXdOALYONemWkCqUWgRDyi",
		@"BxEFUFBhzxYUPun": @"jwsROtPPOpacXgDYxNmODWtdpuxwfCIrRiMQIGhlumffSKEgeAsHbiCdqwRDLdyDYOWghSkhnEGdEklUNWAaTIQyBfeYhbXuGOdYyKuAJJduaRWHsdhzlom",
		@"WYstvilngm": @"IwXQxDaQxfVbuQVvwfFLJZnSmrtghSrUbkBykZettkSRQERHezaOqbNYFtXyjPFSVYVKocrxVjiwqYhXuMNRuuiaiBFUOhOhOldWqcfPyiGRpuUzffGVwkPgovLuWKnVMYL",
	};
	return MjEPQGrTbS;
}

- (instancetype)initWithMessage:(NSString *)message withType:(BOOL) type {
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelAlert;
        UIViewController *vc = [[UIViewController alloc] init];
        self.rootViewController = vc;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        CGSize messageSize = [message sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(width - 100, 100)];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, messageSize.width + 20, messageSize.height + 20)];
        view.center = CGPointMake(width / 2, height - 100);
        view.backgroundColor = [UIColor colorWithRed:139.0/255 green:214.0/255 blue:233.0/255 alpha:1];
        view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        view.layer.cornerRadius = 2;
        [vc.view addSubview:view];
        if (type) {
            view.transform = CGAffineTransformMakeRotation(90.0f * M_PI / 180.0f);
            view.center = CGPointMake(width/2, height/2);
            view.backgroundColor = [UIColor grayColor];
            view.alpha = 0.7;
        }
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, messageSize.width, messageSize.height)];
        label.numberOfLines = 0;
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15];
        label.text = message;
        [view addSubview:label];
    }
    return self;
}

- (void)show
{
    self.hidden = NO;
    self.alpha = 0;
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.2 animations:^{
                self.alpha = 0;
            } completion:^(BOOL finished) {
                self.hidden = YES;
            }];
        });
    }];
}


@end
