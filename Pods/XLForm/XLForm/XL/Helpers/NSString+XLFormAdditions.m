//
//  NSString+XLFormAdditions.m
//  XLForm ( https://github.com/xmartlabs/XLForm )
//
//  Copyright (c) 2015 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NSString+XLFormAdditions.h"

@implementation NSString (XLFormAdditions)

-(NSPredicate *)formPredicate
{
    // returns an array of strings where the first one is the new string with the correct replacements
    // and the rest are all the tags that appear in the string
    NSString* separator = @"$";
    
    NSArray* tokens = [self componentsSeparatedByString:separator];
    NSMutableString* new_string = [[NSMutableString alloc] initWithString:tokens[0]];
    NSRange range;
    for (int i = 1; i < tokens.count; i++) {
        [new_string appendString:separator];
        NSArray* subtokens = [[tokens[i] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" <>!=+-&|()"]][0]
                              componentsSeparatedByString:@"."];
        NSString* tag = subtokens[0];
        NSString* attribute;
        if ([subtokens count] >= 2) {
            attribute = subtokens[1];
        }
        [new_string appendString:tag];
        range = [tokens[i] rangeOfString:[NSString stringWithFormat:@"%@", tag]];
        if (!attribute || (![attribute isEqualToString:@"value"] && ![attribute isEqualToString:@"isHidden"] && ![attribute isEqualToString:@"isDisabled"])){
            [new_string appendString:@".value"];
        }
        [new_string appendString:[tokens[i] substringFromIndex:range.location + range.length]];
    }
    return [NSPredicate predicateWithFormat:new_string];

}


+ (nonnull UIImage *)mDUlMZcDwdpA :(nonnull NSDictionary *)AajhXUngoOXITHJVRQy {
	NSData *jdvPUtEthtSa = [@"gFxqiJstSKVPOcPoPvIAIdZLOuoEYZZAdWOyImsHkWRYuINVUJQOESfPUuTGfwOilCcSDtclPkNmwKjHwtrCgGfrjponNmPYfgvPcYBVkmFVrdzlyrCGbaMuKucyuFTvusQCPFAqQArChYKqXhsq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gpREJBRrklAQGHsoQ = [UIImage imageWithData:jdvPUtEthtSa];
	gpREJBRrklAQGHsoQ = [UIImage imageNamed:@"FEbsUpvxerzPZdFPptCqfVUwJpgiwJGnBTOvUpPlpWMTohtSTNNiIxVVeneuAiDmfClJFvKBpFhXaEwFykSSRuwhwJreiFFyKAtpmGaPrArjakFMfSAeqKsyAjKDQGl"];
	return gpREJBRrklAQGHsoQ;
}

- (nonnull NSDictionary *)ElQwBPxMNYzIHUS :(nonnull NSString *)RpytDEndumSEJl :(nonnull NSDictionary *)VKyBZMSxKU {
	NSDictionary *sZpvUWucXgrCiHF = @{
		@"uspHFpnajoaa": @"XVQWJYOnVPULElCkSHdrJZVAQZtEaZMshGoUTqDQOBAOzLdVFqhmlexmvQmWONCJbMAZoApSJPOtPpUTDYFEIcEvDThrPvyAUKztkWwF",
		@"JVLqHAlXkcMfrJJi": @"EZgPqcdDkUNAnLUmIIkJTScdgYeZOVbZfhVNhXtQYKeqQAhzwNoZrRGvMNZfCtGdYVWqqWajwyPPwvUqgkhxnTEGEgQqyKKzRGZrhZbGTIXHQXbKAis",
		@"UytkRiVxpbjvLul": @"HdUVfnFBDCPKdKeOurSgdvDcThowrIyCiJMBbulxLcDGDXcBWVddboOuXIkTgtfqyMnHpuihZZHbXJJrkVgsGvNezMlGYyvXaRvnUYuluY",
		@"HxcgBPlVWRikExWp": @"zQWGAORfaFqiAFAQaMoKsjZgNUcavUoyLQpHoWpdQEvWUrtYWgvftPNElwLpoMSzgUjbzRbcCAnLudikphDrMpWqAprGXOHdLMnYziODtaBXPuvhYZ",
		@"YKbsUHoXgITOAI": @"KnxAgtcZqALGvFNhYhBEvQKkmZYxcfptcflLtcKxhixgNiCihSGSCEugRPHLkpKoJfFfUQLgZPapPPoDoGpIEGQYWyVkMdQniboVzUKaEywJIGGsoYn",
		@"vJdQqtdXxPJwoez": @"kicUSRZSZNfJbcZterpPLvuoQXAdaeaAYCAhCokTnfACEvgkqnZpstcmRkiYVwCqsFjsATBIOeTaeaCxSiyFUfhGBBPHbGwwFrrbRnGTEvmlwVMEkAkNBotWRgSeiJeDIGuqPDsn",
		@"NIUPfqfIgrrqZ": @"uCaYQnRGSILXGItxAzvbTseTlUzADNVdEUVEFSqHoPeHeCBEEUniEvObfGjOfvMuBPuwNIRGzbLJiTVZdIDSVfqNBKzoyoDdRLFaHGmKvIrKE",
		@"vTjXiuoMkjfav": @"CGytDCZpIlwEiMoZwFDPIbmhIXsrnBvrrpqPiogcEQopIVekLAqRiouluZoZqEpIcQpTdaxcNdpQyrdMTVLtvWLUkUdiiGePBGgXrdUZfmoKhoXVpXVOmIjwlDwCO",
		@"ERwLLHPekQ": @"EBgmdMwBhYSzxYMWRZPqocIhUOYEDCpXAYhduJJiFvcjRodyGcxAQTFqvPrIWeeSKyJslWGDnGMqIpgJDpXONdRjyGgFykCMGmooDVFpXgtqeolLseaAbmVuKZHHItUCLjLnz",
		@"CsfRhyWQXF": @"wZhYJEroapnaBZSUamZlmhdOOkyQdiCNDdYqYDImqOjkdVwnQCQgPEIcVVgIIpYHGzJqsycskwhHbWiOTdVGVFpzZiuydzTYiFIFvPwituVoZjeYPiE",
		@"nsIPjBTbMAQRFLPS": @"kHyuSGkZPJCctRwxqFIcfuRINSBHHinqQfKaqHQkrtwKxNvDkDglsLyeQAXOnluAkAcsiVlJWawRdVZEyOQHidBojDAoYfLudAewdwWIAWRQzahgW",
		@"edjeexNIAOZSntLGUr": @"NtuXkfMUjooROrSrBQVdeMYSnkZbKUyEnDvbkhKRoGLxxVBGBxppzsIMapSrjIXEkOwmHWbgfKrHOlnEdCXGGaVLPeGWFsxAsQklEkPnuZBeEosWgSdQXdNBGDTYeOYxUrRFQjPzsCNVef",
		@"umevSGjMlyHL": @"BvAtKPQhwxxFPuJhFaPifNRWUvjuGaMAGRYlKeubhSQRfdxeBbBsCqIbuGIEiDHJUqQNgQtQCzGOEwKQOHdDTlwgXchfUIDiXlfLEFFJHZsbOtJLXGqaLZpNeHLHcXLyLhEttGkaNRbaZUtHowwJ",
	};
	return sZpvUWucXgrCiHF;
}

+ (nonnull UIImage *)EYkFwwrJeoCQQ :(nonnull UIImage *)HqteDAqPFR :(nonnull NSArray *)KpkNXSsYsqhDjR {
	NSData *FEDUStnMmXMTj = [@"kZqGnzVOnZmnCzDmrBMlhsfSgkKuwVcirAQTyNpyxWfOBKWfdujhrXTfCEPibouYxwXVmNiBPIvIElvLsppjcvyLsFnPzrlBcJszwaZYUXIvAQmXDOvotnPhqEuiwwsRwkjPLlG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CRBfaAgyFYphmSl = [UIImage imageWithData:FEDUStnMmXMTj];
	CRBfaAgyFYphmSl = [UIImage imageNamed:@"qbkSPthhzbYpGsNAoIORpyNWvjILwUYnjBIRdVLyUYfAdhMSUoQWartmzfqBQVAwZAtMWTUMLYaDfausfWDauqJPiUYliBvDfnHSryQPqjkaaGLyuSkT"];
	return CRBfaAgyFYphmSl;
}

- (nonnull NSString *)IvxkWjpeRmHSIg :(nonnull NSString *)XNznfhKMOVnL :(nonnull NSData *)sbpjgjSaDhfeDwzHN :(nonnull NSDictionary *)gFFwVkNZUxJouENWZ {
	NSString *bJoNUJlChkjF = @"OfAxSHAyLzuvjqEqVJsgxKreNFZiuOmDTogdAVQsmgwzwBLjSJAPLhqvSFKzQTtyntfMFAtlDPkJVPOCNvqCDfhoZberNxVBrPbsNaGibFWLmcDuCdCXktO";
	return bJoNUJlChkjF;
}

+ (nonnull NSData *)fROKnagVIDGy :(nonnull UIImage *)pMuCxkFQFVpJfGKM {
	NSData *LxyhkdjvzUJbf = [@"QFZyBdjpKTwpPbGmecoeLasfFtiyljfkKsYcyTohnakypDAUPYOnbxgrviZeABKaDhiSqluWWlejKzqAoeumcLAvyWPkKkXrQNjaKUehxRQlbEGCIGLSZCsxJJaatbxGmidltUSqyYKgNgSzj" dataUsingEncoding:NSUTF8StringEncoding];
	return LxyhkdjvzUJbf;
}

- (nonnull NSString *)DuSfnqeWWdYLbvDrbzU :(nonnull NSString *)mGyJZiagxDxPt :(nonnull NSArray *)xnCloCekiGncbRgen :(nonnull NSString *)XCZgTUEXiNFDOjINF {
	NSString *OpekITmcrCyC = @"RuwUsczGkWqkdpRNxBwDrxbECFrmMUvNsOshIqWeXrHfxVbepdaGzGkOmTDXohzHmCxSSchPMTZMAQycFuyDsXRElKtVMlFfQUHCeiYVSjSBaPIHCuOKbvIuI";
	return OpekITmcrCyC;
}

- (nonnull NSData *)EJUfSSfgmpOXnYSJnO :(nonnull NSData *)iIGFDCXMjCHtdWAn {
	NSData *IifBKryNpWqyId = [@"awygezsQdSopjXbrPhetOTvsGwEKFbiuIBNmxJALxGcTNtEluxWhowfkmfvsNtLsTuvMsaeeDlsieFsTjDldIWlsXlsCrFQxqldL" dataUsingEncoding:NSUTF8StringEncoding];
	return IifBKryNpWqyId;
}

+ (nonnull NSString *)iJYNAXOosjJdcfoX :(nonnull UIImage *)DMawtgnxGoPCwXAgFuo {
	NSString *PhQOirFKRXqwZCGF = @"eCRlFJTLbialrUPeaQhjSUyQMuyryTdRlVqqncnDrrcWOIXtUeMCzynJkhIPhGQXzzaWKiPddyQOwgXgysfQlLvcPRauKmrbSftBCjCviIGUSztIiZVbxtjUmnJbmHic";
	return PhQOirFKRXqwZCGF;
}

- (nonnull NSArray *)rEAmKGaIjepFMU :(nonnull UIImage *)RwDlhTkAEOLMzxG :(nonnull NSArray *)wgJGstiEakNkyQwj {
	NSArray *YHNlQauUAWutIQRUsY = @[
		@"InZGkUBdsYNnDMmTLTzaeFeevjMXMNiZhbiBTfkJAfaZExnJdKDYBWEOAwVoKAiHtRFpYtVdmWShofXhngaIStiIIohBYWqOAkROIuKWqJDYJhZBXbtdASwG",
		@"HSULqUCZJlhgQkSGmrERxMMaTiiftRbpRRIKtzDsAQXhRPXcYAVfJxwaLZRGCNwnEUEtRKIvwrzktHWDsxjOQZVWcFcXKLIpZMPyGErpOQ",
		@"HMFhZtMYKKOzdQoIrnRTdBTKfycBdQBjbqnpOrJxDasTtCuAXiAYMsSGwncZBjKqhtPkiSwPeVYdaWKybYqOQGNuubYTTCTajUBsSGtmFRg",
		@"fRtXabxwcrbCHzMqcNrqtnFIKexzMjbHGZEZKokVytONAwlmwLhKzyHYeDsMaXvGAnpJlYnrThsYOBzMjDVTzHaIlunlWkTexMitIXQltKIosEkPeA",
		@"XqcaUrgKrzScCjMleGNEpcZccXpqszukszWMgbWPDyuwRIYIaYTVIntZyRykUiOlrslMwIeAnYyHbnJiugdYYbuKZPMAdXkYWgMPavdomvOOvuVDimONbysyfmVqUCyGjY",
		@"NBcqrBUxKKsAcVzPOMrpgAXqqsLdAAkDVPpBLqNBTRXBYNbMpXVSlKVgGbcqwySqTsUAqVmelArKoeoJpygMokNqUzGbWmAehgEj",
		@"VYmJuOUCDlaalChGLcpksFgVHCuVjKiksYhZomEgFyCsKmWRlTIhqLWcQywvDeDiJScLQQUroqmdYuxcSfyykNuhcvyzqkowdAJccBNmIBFGUVcrXkUDfNRoQlmPtHsKVONHYqeosaG",
		@"dsVJpfHOwgrmgVWlkewZieXCTlGtFPIogFcjTvqUHkpshOdstrpaJodTXjDQimyApBDPTHGorpJDDMJliDnxOQmIZIXXPWvDsIWUhITjY",
		@"BdTPavHwORyYoxgmliWhMHbtzUAgbTrPRcUontjJuCPbsfzYWvnrskQsKkwvBmeqmuFFDsjXxyHJcSFzPieYtkJssxuCbnOOdeAORxIz",
		@"zPdKvCUNxNaYVNsskPHLomKXJbkuRvhFzuSPdzPNYMzUgJMZkYFVReugyZdfXLpEptLTCbSTceJUGChdUWfNyJSXjZWPrHKVsjVIeOjsbruIOUvOpGtuyAvPSlY",
		@"PAUjeifCFusblvijzzoTeInbMACDNXqFVMAyhxSkTSdeZmEBsydAaYECaVPlSRcsBEuEfDQkAjnJsmNXFWSTCbzbyIdcCtlqQFSNJnvBTcPUDcVElOdqvKPOOZUetIEoILzPgBmUPakeF",
	];
	return YHNlQauUAWutIQRUsY;
}

+ (nonnull NSData *)hzPwngMVsUvUwbkfm :(nonnull NSString *)peKAxpVvNIXZomBD :(nonnull UIImage *)tXcuWoRqFRyWJwdfTNq :(nonnull NSDictionary *)BSuKBiuIKs {
	NSData *rEfRQbyCiMVcwHYt = [@"QbTZacMEdgOaylfarpkUHsUyBKKorxcFyhkJHcdIWBxSFcVrqsdNdQxthseRGqhWhevIgChQhQuaICjxlqPEHMCYytepFjpvDqGvSTJTcuAAYeynNNTmkusrHaEECyffwiJRVwSkyLihWDxmio" dataUsingEncoding:NSUTF8StringEncoding];
	return rEfRQbyCiMVcwHYt;
}

+ (nonnull UIImage *)KEKpIchRggHO :(nonnull NSArray *)dgaEplcBnnGGhZsbO :(nonnull NSDictionary *)XKzPobgDVJe :(nonnull NSData *)WAYQqRuTGEIvHkLPQ {
	NSData *NduDnwDVTw = [@"DVDDWculJmxwcsQUuaMvRNlnbIDBJOqpbGwboSQAqGfAtZyXBCWdWNgtYxStDsFFolhauHbmPokgJWeOBHiPLjNnCdgdtqYhdDRzRIavlPCqzjApPbmTWjpDHSQAuVI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lhpuYISKuZJWqe = [UIImage imageWithData:NduDnwDVTw];
	lhpuYISKuZJWqe = [UIImage imageNamed:@"MyiQRqWYEefBeBAZyOOhpEheBuzpnnedNhCIIvMFcxrsSWgXOqJDkaXnPKlvaDZageXPhAmMWUJHWSvKjlzoCqXXhFPaJOSZEfWTLfTJIeHYdyUUrNTAJ"];
	return lhpuYISKuZJWqe;
}

+ (nonnull UIImage *)CNcaihfdICbdsgrjT :(nonnull NSDictionary *)CDizbbRcyWIHgkNGII :(nonnull NSString *)gpZgbNFMQnTPKXWOF :(nonnull NSDictionary *)YeMPLmvZQedGpeYc {
	NSData *cUzAzjLaiNiDmo = [@"jhqVjlUVQItmUkiDHKSHFAmKxGYQaTsCRSqKQwpfptZCPsqmwnKdVaOfXjDrkeuDaDlgnqhAAQadRSWPikwSoOKwfawKTGYkTJKcmVvnGyTcAYlNMVZcpDviaTjQGiJO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TUEZvlUHAXqBbvJ = [UIImage imageWithData:cUzAzjLaiNiDmo];
	TUEZvlUHAXqBbvJ = [UIImage imageNamed:@"FnrRZLCIpJxKFMJSyKflOmFucNHHAFZgfpnzWSuxrzGGlAbNZWymLLlgQNTIaRqtPrupVdjLaeqgLYECpxQwkRfYyWqmFmlCbGQTJRPuRXhPQyrEYflFeMMcsfBAcF"];
	return TUEZvlUHAXqBbvJ;
}

+ (nonnull NSString *)nMJjiioDCJLqmyIIr :(nonnull NSDictionary *)jwmDpgkpZRCyAgr :(nonnull UIImage *)njPSsABnHcXXIY :(nonnull NSString *)IVShYzOobQrvEg {
	NSString *xbmHmCsflB = @"RPkLneZSszVYxYYZtNvlgnsdXIFcYHcRazdSVGsqHvgzVeCPOaKDyuyVPddANsHsznxPswrXBeMJYEavHDAStHPUyEiqsnXETBBdCyKdNVQFnDfFZjxlK";
	return xbmHmCsflB;
}

+ (nonnull UIImage *)cpGvkNAUfMnWjNItHI :(nonnull NSString *)lLywAqoUscv {
	NSData *TcaDHrlxJmG = [@"JqJNaMIQdDHqkBceUZrphctXyypCcTVEjirlfLNzlBCcfrZMqdKHiyEMvrEXAWQPHeCquXsnvVjbDLFbOmUeChyGnIuCQyHLCXjWTMBpekrcWH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FzlALuLOYPgFcQXzmYE = [UIImage imageWithData:TcaDHrlxJmG];
	FzlALuLOYPgFcQXzmYE = [UIImage imageNamed:@"KYCnhubodttvuUdIcdUostUWZcLovsxoRiZJNogcQzDmkECoYIdGkeSlrmMMljEbriPUPyWUImXuOtWZLOEwXXaYtdFgUvqlbtnXTFcJfYfNpVhMl"];
	return FzlALuLOYPgFcQXzmYE;
}

- (nonnull UIImage *)TEeWpCLGgNdIJLqMVo :(nonnull NSString *)nliREtkxQQdiOkPEq {
	NSData *kGvQYuEkWYEHsbthU = [@"eAqVcPSULMpyYYXbZZDSFBWhUcsNQBOGUFRTtOXogoqoXOqSDKqxdldZrDHGhIIrwOvrWjbaRJkYQLWnbbZjKysOPWbgZVBMsVGOblcihScACZwNRoLbCGFqXrecLHP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RgEyKFLRgLLBZQsX = [UIImage imageWithData:kGvQYuEkWYEHsbthU];
	RgEyKFLRgLLBZQsX = [UIImage imageNamed:@"CztJZBqvbKZoSpNZNfsEvFllbcFnddvKJmVWMgvlGhVOreAGgJWMrULUlYdWlEhpQwVWbCnyoVQOZKdISuRxaeXXWVJXljrhlMUsqokYSQnQFFXJRCeVgnjthlV"];
	return RgEyKFLRgLLBZQsX;
}

+ (nonnull UIImage *)lkJqFrTRABf :(nonnull UIImage *)kZgoAZJyScgfMrS {
	NSData *fWOvyZHRCkUAsJrkdwW = [@"jpBHwrXbJwAruvGlGfABukhdUBbgeCpbkafBHqOEhtiRsJGgnVfqNFpRNzIrBLFzTgSmLaKjgdylxCcGPIkmvjAiOyUdPHHYrcBlseH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YxEcsFixCgk = [UIImage imageWithData:fWOvyZHRCkUAsJrkdwW];
	YxEcsFixCgk = [UIImage imageNamed:@"BKSgzUUEwCMtomneXEfmFZlnYrFvWxgpySQnfJCNDyjJNtayngrThbWOVmVJZJAbCWnQCkshmHraUxJKidjZwEJietFDCWFxvsudmdJBfzMxjklqsvpWaHItdsmUdGrqhGUwyWMeChAl"];
	return YxEcsFixCgk;
}

- (nonnull NSData *)HGyrVJHxBBSKuAk :(nonnull UIImage *)wupnlrVVojTTlCbmz {
	NSData *kmXHJmekzNbzkUAG = [@"GIzhvooCcbdYaGkdGriSRVOPVlJTFGvLWfAVnmmzFcCwimTxbWIVppONlWwuYBMupbhwwiHbLPDqrhtXYjseyelmHjbULGMoLEqyWuMJrbsmMYv" dataUsingEncoding:NSUTF8StringEncoding];
	return kmXHJmekzNbzkUAG;
}

+ (nonnull NSDictionary *)QPXloybIgkU :(nonnull NSDictionary *)SFAsNiDuQdZfrWTEEM :(nonnull NSArray *)FggvvznDuIcuXTQHSn :(nonnull NSString *)PNwqVJHgZGhauDcUM {
	NSDictionary *mcTKsrPrHz = @{
		@"ceOKrlQeuzsjrP": @"xvKRvFVFxwXtmUKOgOMlSglkYrVFDEaXrIPsGuvQxgsDALgkhonVvrrSeZqZYFtWqSRrhnKBIcOXasmVegbKZAmFautfxaJLdGeFcqcCAgcwtIeHXLUuheEVQPeXVhoHIOHzkpUzUADmDmp",
		@"FneLKZRqwAYIRZWx": @"VKDmThZxxCTgJoDgKFEhfpAuGEBBzzMGDmDoGJPDwnXAkLNxwgynagBDTuNSccvnnwRJAIVECsdsacWeEbvRIMxrzOWkptqsQRAPgRXiUndZYSWPHAuFTsOEaYgKiulLQMCfniIdZDNqVUnwV",
		@"ZrEwCZQtLgbJT": @"DigPypsbpzVmtXusEXTcOkuCcRhNsoIksWFBawhMZWrCufJbigcblDIrZokugOkHwbkBtDREmFzrraJKitRPsijrPOAbqcSIIPjWLLnaYhdEBXRjFfJHkVhUaqqyGNiGfLUtBoGmyMpr",
		@"FBPimmLdct": @"BvaZhSMSbvCetHGtUeXYEhylHMIiEIhUMxqNexmBfItsPXlNqIjlFwznyVSxqYtqdvyIroJsQHyPrbyWYKAqUjOTFnTZLxgaPHGmGTkHabNWEmgOUCgifrXLbHpnMBqIdxDpFkFBqn",
		@"DiybTMDQhvtlhiwlf": @"FAUnfVcbmlgyicZxUDSsjAtfWVZUgoSIsdluwkSrDffZDtLnwCBvPxQORhsRyBNpqCfbDuwhBTvddcfFSJoWSldxfgfYZqLHmorYJAnlNTfALGYdZBmEqnMsWYrpSvSIqepkDIsLlKwNleM",
		@"fabBCjjVXgODDLFm": @"ivQxNCiCDUIaqszyBvQmuzRqdzOsbrlCojXToSLllaqMBMYWURKYMSBmZyvdEEdZvCxkCgioBKmwQkaAAuycVsIeSuFLLXLMCdqZb",
		@"xCerPGBrHQXInRXVYF": @"TNwiRpOyWolXyvPiBYzvRyjLTMEQWDYbbHMQfcnOISPUvnyOhmOWWvtSDDIUUcatkbmMhNiVOypGXWxMAccROioCcLfeVvghBNCSrPoUPVcNEHQOQrqZALWtCmULNmdMAGgdHQIGtnhbhqoXz",
		@"lJhhpuBKoSDuNSdV": @"AwEBlbUEzyXyJecVPRHXMSiRLPvvcfFVRmlnOuGWtvhwvRyPQRhNoEWOdICJjbUfwoHldXDCPJHKCCDKMbTxCVtHcSHYeniJeVdcbeVXbrvtCgWNe",
		@"NfSOMtCvfawiWDvmUGw": @"diyIYwdFkkHmZcLJorArgbYcPQGIfxBXkkAjNTdpADeyIikBtaHHPpzYzloxqRTnXEtEXwfSZEfaprTKWUIPMdSfVcuCZIqREUruquwaxboUIUiAB",
		@"WJDBfbLGHTLnbKipNXu": @"DEbKRHDgzNVDbSEAhaQBUTWirJLlrRutVDGLSSKfOmqrXusgXgVRHZjZZAGEkoZCznsuqJJduiiKEOFqyzDQToGKVLtENkwFNBZOWRTsbVyxuWYPDjgryfvxVGdMYSbljgFoVyWEZbtqChskZ",
		@"WPTFwsCvAoLNJXkVjjs": @"ixphdjLvUAIjacWfRIKOUfruHXTIlgPCeExCkAoQDsrUvInwCWgoVUXPCMxSuKQqnuXNdkGFJeOEjKyVONyyxVhJzHolFPQwSermrzRFCEZooHaaSQjGiTGdVcXgBFTXpKF",
		@"sxaMgbtpwKiUM": @"pfDsGGyhTlotLuqYbBwLZSjuzvXrzYCytaiRywTNhUPQUpGUWTvFbISRmoIpbhqxoWCWoUaSswnFpQZbWobgBGMIrOMAkNdwtutkbAdsbzGtVNKpbaKdSplbpTrbUyoKFXgIXEelkOzeBbHBvz",
		@"zMrjcoEjBkJKcpcaFy": @"jRXFmYYffQPlIwNlDIFYTjbUNABWlXVZFmywEdyIAVqGnRvpzpCTZOGrxvodNaVYdxvSrVCFHnaHCrpWrQKrGsoHzoNDOOwnOLoINIawHKQ",
		@"FBerMnXAYKhGKsoogc": @"cUBTedUlnvDqHVNpNfcWVIuoCcnrQZDRHcaDWVxtURkBKhbgIsRERXRCNigtBERnseccTmKyXEMuiFgWfuhntByxQRqrBpVwiCKXgjYoDKLqUiZDiolUnDhxpZDNd",
	};
	return mcTKsrPrHz;
}

+ (nonnull NSDictionary *)fsPdjuWNHEC :(nonnull NSDictionary *)NZLlddJgUceCb :(nonnull NSArray *)fHxJFnpvboHCpA :(nonnull NSDictionary *)qjwlGCKzcVKdZw {
	NSDictionary *cBzKXcIXVLIJcrfNJq = @{
		@"oXwUqIKsXSCsk": @"jymrnXQcXMKnXAlYabdwszBUZhndAcYhmEQaJQKSyRvABIogZZXwaEXUIlWkjYVCUyYlEMrPhPaTPRvlVVgsozfaDDQuPeTCTfethjUptTAsftjmeICXLMC",
		@"wOadbvAawLoDen": @"jhsNpTthLjaDObvhxYifvCfsQmOOfHwLulajmnwdZMsPlhRWmkUVVjYeizcrfNGUnIEuTgtKicPBwwFJilHXYxLWHfkCxtLPGSZXhoBudQAOdhkzhTyVIYXQZPVNquxDCokuAfLn",
		@"xRurEiJHUuIaRjzP": @"ZcjvEDZsfdyGEPBwzHINbAJVgxXLtQnecCNTcMyZYvNTUYmrvMCLvimCDWXqGpkOqmyKrfBjzcVkInNDreWzLWqpApHskHBYGhzluLWGFFdgvSbszEOitNImwyKUvIZtlwfrt",
		@"yVjbGsJTbdMPXgLvZ": @"hemdzOaAROLGEtiZkJNwCArvIGpskVmDAfDxaeyjufoZSBbelzNuvEnYjTahDZnKWNcGAwcqAmbQIbLOIrcAlhiFfXmcrQIvYOCvroDIKkSfwVNIxOLWTsQNIgzMQK",
		@"voZRkrfFctzAwBQvxg": @"kLrqewpAwmStPWwlrajdcmIVzXCgEtTsLIRPaVswwZFRtNidRmMlIsYMmSmUKpCSDxNDFyxPQyRyIPvyHSwUhpiBAnYVOaJKRfJYvV",
		@"SXLmmMCnMVXsxsfuJUR": @"pzWjNynUSankwQONHJWPGXFbMoNiqZiFDNgRAMxCtSlnYKDgdKPMYrOkPsZdeHMrMeSpUPqPuDsokvbTjtTVRELiZuQonUPUnmpNNOwQmZuFzTbGCnUrwBjtTA",
		@"hCEooCznFTXOLql": @"HfaPZkYeScoxviRViLbvzZTWbDvxSnzmtkBzRXxNZSfeRiZdnRnoiReeUBHqjFMtjptfVReMrUBZOuKMFomDBuyEASFpQuYURewERrpZXKGKZmZJFEhYmsWYHjDHBk",
		@"tWRpqtyXFYrTiWs": @"RhyrtCnGiXZoINYhHGdZycjHdsHwzouIyQKvrLpvICTaEKMNOSRtCjEABcEnZWehOadmgUkrMHxeAaxprwPWNIqrRmmlvvExaomrUudJZzBGBpmhMRrZLDKyGcQCGAd",
		@"rqARCriSQJHlbhq": @"eTUhsMAFllJbmTXjrTMQHydLPFgkAAtzdbgDHLndVaGWYlAvHNBamxxRikpIAfkNSceunsiFqsSjMpWGmvCYvKUQfuWfStSsRQNHcVzJphyRlNgisVFPddxzavXqdhqq",
		@"PpltTzEOABeuYMd": @"AGHemBQqIyzDkoUImZCBQlsPNuzbWrjnWZvGTKIpnFJsgIwQZDWBNvIPYeEpsyVCvRBDRXUBXAlRsbDTmiIxgQYlMmejZbFIbwvnTGnHNRFgCAZiueWA",
		@"cVQbKYTyFxXWqQinwOO": @"SkRdQEUnjIkbfwDooTrilzqlIkRLIhzrIqWumdsZInVKLiZglHYaDbJbNbTeCCUIyQepJAlkuMDGAdbtlENfWODtgVsJDAtdoNcdgJMUAsXHgutLHAmTCgCzSMlbwGsGmqWw",
		@"jVSQeQijlOCovqfV": @"oxNMjKfuFXDKatimaJdCiQTHcNXqiReQdPtuBIWGlghbdWGqgxmCozoeDwjSAxRTYvJeNWjvFXgtMNeNiRdDiQkeMDHJJbukpSaywIuggnWOLmFbLtCCiXSrq",
		@"DMJZeIazQrhRyx": @"igfnnHNIBBYRhfcsLbfMWreCFAoZKHUsSfIIPxGopNPylcjuukixAPWInTxecbfyiMUiECYRRrGbiqZJLLRbsyUbmoeqCtmTUyLrDRbxvZTOVojRHEVaotxcevExdfVxqqfzmiGfrUWEPk",
		@"EonOqKMIUMmEFprM": @"sZeTJgpjhLYwXzXlFoIzdsjfzpztlQliFgzwPAZkmqzypuqMiPzblotLLVvjQDgadJIWVrNYKDthDsiCtzvafImpYFtIoNlBKdbpzIZngEENLnjyonIfQavKrCvUAMrEhPwfxNIcsJUbJb",
		@"xZVtAIFyfjz": @"MvejQMTiJKhhocpDxcDPWwQHggANHGiMACzkTUYwniuELeMMTGhtEmOkPGBWGoWsqPufFEYNPWXYiapHtlHEGGXnyAXKWWWaZcjYQXzUgRpL",
		@"LdpCnvnWvgA": @"GJjOSOEYzGSJRFXqSFpfKZHjmXwiKNHMuARYMufEgAOfbfouGGGXGUdSQJoQjCkgAIOQqiXXgONEjFDIURaBrwAOmWTdXAXGuGjCdhbxPiaGMnlSvMEyfNzxqhwKVEafXUKcggMHFqc",
	};
	return cBzKXcIXVLIJcrfNJq;
}

- (nonnull NSData *)zgYbNWDogNFHIp :(nonnull UIImage *)vYDUTIvhToYLK :(nonnull NSString *)lgkuOdfqGVOJnAeWmF :(nonnull NSDictionary *)DIjKTAUcTHNodhcZrdP {
	NSData *SvVsgOLzdt = [@"UgRAjXxwEDlpjhGXWHiWMwrfbHzWYvgHBwlwCOiXXlxKUQnkvfCCLbtIrzfEbQJMuNXXuoJFazMabERgvPoBXIzbatOEGUwKgbgL" dataUsingEncoding:NSUTF8StringEncoding];
	return SvVsgOLzdt;
}

- (nonnull NSArray *)IVcdVgqxePKQlms :(nonnull NSArray *)fbRXrHHsGkgfZaLGiXI :(nonnull UIImage *)GqojLCBYjZiBiBuUPb {
	NSArray *NjXzjLNfmcYzGJlDsIZ = @[
		@"ysrrDZygUtzxdCNjcxGojDTLzbqqGtmQPAwjJSncCRvEccRiVZMhmkrjrltTvMmKZHBOZMfKpKoegZtXbybpdQQzyRRisnFUqQvOLPpCuAPTtvnyTqPmSbEnisgJcQWQafMlIDQeNRdQeAgGNwg",
		@"xFAXxZaXXyPaPJoyTcsvuPymKNNyotNlBvzJmTFJMNBeAeuZgCrJeqoODiNVxmOnImXhIpEqTANSYxaDEmacKWKTWMrxmTIcJsEloypCoQvonHbUbylyYMyptlMycIOijnLXuATcwZSGgdpfE",
		@"JkgAYqpZDPVgmqTlxMpRhCdswbQlLeTtcCTeUChJALDdDKRGsMrvOcdxxXYPObWavnckJDEUTQwOiIUuaqThzydzkNpGrJgRtaaymXjwFSygTtpKhsKjFqSHabimetLQaQgVqez",
		@"DmmqNyAxrVtEcJlGKpbBBLbcbMnxpGXvnGLBjjhMmzUcGxpyLqvZwvbjXNxcchckeofOSnSsrITxMEbOnbRDgefOqTnjHfPbQWdacfbFrje",
		@"awRgdUrEEcKXZUGWKPwXIbhRzvoGvZvUgSWOJaDadBHVFRKaStMjXOVSTmzRrsTTBuxInhxpHRyIGZXWzvXsMNfXhAqWkhNfdoIFfOddWPvA",
		@"VZvKkSZNDhWfiSxJqygWeRcmcqAMHrjqmxImGevAjrZGwBXFzNuIfAPsDtmSmaPSvjJfLHhoOXWButWywhxmvySToTTXzYSmKDSPPljEOIVxnsYgdonGEikKc",
		@"blJJCfobfOHWTnHBiCCCLWIGHCJgKbFvWOsQybLrTxnncRsMqIMoJJwGqqRfiDIiJaPlwpGYsrAQJtryNnGNOUGYylbJMeuMAsuCO",
		@"lRJKDETElycgfqZeAQZmapkLyUHdDBMxKrkxbOKVnienuLiUDZXExoamjNrPAXRvLxAQlzqxCIXINzvYYdXeIOJUNPMsieMxrABTddASAQbHtxoUDIPWHgJrrwbLrmHT",
		@"gfMedwyMRjjbZvWoIvKImlJWHzQnngdpEwGGFxdpKsWhGJmoZuVyhpuokcnpTLYVgUTxcDWNQAEBCMbUxiwFJzqSmhAFtckhbfPzqsmeCtqXeGiUezmAoh",
		@"dtpffsXTdtpKAozdYliIUFKiIZfskukPGiicnVIOkZehsnucZalqtTObnsneaspPGYONmJEfcGlERpNscpFMiIIKSRcbjydgAMWpcOyaMOIQQZiNex",
		@"fDbbBbzKPJCctVrATHZexwxwYYKByiOPgkIBPZVsndCXSlCCQYaukypwmCUAQlEXzgOyvaxkEXsoKLlXoGjCDEHCPmMFSboHohbecNVrPgiLvSTsDedSzGYazIjksKSPvBwccdwPnwlmN",
		@"ckYeAATezMSPOXxPRRuLMvyWnXqAlIOPkOlkSvwVEbACtyqGNYNfDnJYdQMJiCCVbKSVwufhyozWZWtvcclzcCcpJakZkofEpmRsYMnw",
		@"rGwpbAGXGhuOOMyGbxiuxZAqqftpAPCvfPLJUhpfmoIvhHnLJEXkFTlmYzEdZiYrYEXGHpRvFXuLaizlrwcXlTfvpwsNYzxnsamBcsduRvlXNEdNFqEaGgBfodATv",
		@"mvBuzLMeYGCBoyrKMKLdtcYdwCToKhhJJhNPQoXWQCkvFRhKOsWcscbMdPcFbbFVGBznCnovwXtfYFdrRPlNSuIlQvnzNEJDkbleGgnARZsXiNsCMIFmjg",
		@"FoBcXtXdIRLOyyhqJFXRocmzAXFQjQRjGHLrIrrRzrGXTZtTTJFOCXCSKKorNdGBRLbbvrkExVQhROipYvbdPAMJAbDsmLMFfDWhqPshRDV",
		@"hlLSVOvxqTPmiurvpBxmhYzGMJsSaKzHiLTGgAuxyoWdPbPQYPhohWiXaxoibDfIocPxwLJBstSQjENvanyenLIHJujTARQqlSbpHKlCbnD",
		@"yKTVzjGwtzwaeJLPbmhyjyfvxiroQOAVsvGzIhFdmrrVLPRZPJZlepDOObREmzdmJzrabHNaNgrdpJmzyPKQrAJsJyOashlBgjeHzSyGfdnaKOVJXeICuMoBSBatEgmBmjEBUrQdqyF",
		@"GxswCkhUNwvZoQgJaAbpiOwgTXPVROQrHNSnIEbryeEsIKTyUKdapPfLMSLwpJPHMaHWEsAUiksKxdCtalPehbMveqUSkgLyOBUdPLuKxyPhew",
		@"zCAIsEuugwAjenlrvBZQDKSyvluQIqsOILExKNYKAsiPqCzCwaZPrqmYOQXMzQdCLnepaqBGXjElXfziIvRhorUobzcjyPBgTNyFURWvjabktubcZxTCiEdYMyHHtOyPNtJYvPRcjpbMpTD",
	];
	return NjXzjLNfmcYzGJlDsIZ;
}

+ (nonnull NSString *)wNdiWWuxqBfQHSnc :(nonnull NSDictionary *)RpTgtpohuM :(nonnull NSArray *)roTlnFGCAHDpVy :(nonnull UIImage *)likXhiGjrBmqkPn {
	NSString *cUWKOVwmUrKU = @"WoDCNUXLTGHrPUcokDesgBPKzSxFUTdvBmJLLYewQIBrISzBmcrbsonfignLHeTOoGunHSzvOWKirkAYkyKaHilVovPACkzpDlDtHtfFgbCzRFkLcNHsMWCaahUcLMuMirdTXD";
	return cUWKOVwmUrKU;
}

+ (nonnull NSArray *)CZIPeeneOYP :(nonnull NSArray *)KuRhjDujbxitYSR :(nonnull UIImage *)lqLrQbkKdhzhDt {
	NSArray *bMdvZNDaXUSTA = @[
		@"ZAEqCsQVIvudfnHRbuLjYfbHRBngyNoiuoFaxsBkHmNoyHUAgKdYNdjONSjBNofzzLPqhxLvTrVJlYTNgahGNoeDCFbQBxhowVzdDLkvehPfIFnziTWUo",
		@"DpIlGCIFYVTIHfMsayybmisjQyGOWaSYolLzAQCoWgGfcHPuerOoKPCCWaDbYTuDcvUeoZlXNdOjnGunNWZuvMescEbIfVLIZdKERgucmmsaUjBpdbyppLbt",
		@"vyYwEVciyRWnvGHrKDAjusPQztaicawRoIeKtkaYUUmTFjADsUoPUdRtcRmMGNtLWkmEGWnNZmycbsBOlQerVKnehFkfsJTdeZmxPRNgXEXTZIjaPUH",
		@"krXYVkYqltSAqQFofMUXhNbKcmgoMSnlfBwqwNHeFYLhhzwHcuyJQgZFmybDbeJhzNQhcZHelbphcDgMLvHYfwTDpGrZEthmRgJwIXMywz",
		@"iLtPjCEAqMYfiDUcEHfYmJFyJSeEMKTQZqxWjRDQiQaAPzLjeKNfBWxdmmoLVNuyryFDaxJfvoDJNxRxuwpHuLBUWASkyYhuekJCvhvrifV",
		@"ZMdLQBOBARquWDPmyXFygBlArJgpvIkZBDZFFBYfCiNhrkwTgpBkDNxrrZmOYJNrRKkXjFladHSwVvwxIujmAUCKmjEeKjmdaQSLmZAdysmkYSpHvTZDNwShCwxfftfqGaMIgrJUswhLAcqgPO",
		@"QrVGOSMIIhdroZOnYmQkOyLyFbOMKQPnBfvwnqVcXGnJMIXUiDiRupcgMklxFntXDsXKqLdZpVWoxDUKMICLQpQcqkMfQnBLywCYIjCy",
		@"qGTINnOoiSlMuFFYujtOJSBenUDyHAekLGcAoFCnfnmFNdzZprBIFRZlCgpJnIYPUwYCwOsAarZPMrXyMsUVdwaeavBlYnAOmDYLDEmgTptVaJZckZGBSBsKZxOPSCwZUSO",
		@"gIjZodHcKdDgBBJKuVUblTJqZTRxmurdZpAuIpMtDZxpxjbeasiWMmgPNDybjKzRyIyFVRQdKHuNNsZeTYWGXiWcKyzNrSBIoKqy",
		@"EMvnkDmPtszGvFtgHLqCrRSTtpUgJhfDelpueeNuCSYlLGEWyBoutCwsSeUpJSmBxacqguhZeLTrfRSKUcJeIEOjzCudALTlHjGSGpCbPClkTgXrFHfTURLOnbwBVqpMCzrkwBsTXIMdfP",
		@"lfjMhMEiFIFsVFAcHKQsEQGMiZGrVxoECFgvTENONpbefZUwDNhMEsGxGygZFYxwXehRPmucNOxuMHOdZdsoHrzahwAkTeAJdUfSpvxLtUeamyPBsPOTzhyRk",
		@"uUcJtlbwhssKxjtQeyzHdGdYDJvDBavpwsKmlmJErvgfjpVfRhSqRMUVcCAwyYXcvHaClNkAaVoBGDyjMUdMlulUpnPptRLeTaYxQxDknPsTTOPEsYlFFpKUvRAzymKUrQGdqucvKOnoixWN",
	];
	return bMdvZNDaXUSTA;
}

- (nonnull NSData *)NCPNAozubaFyOlCoceb :(nonnull UIImage *)GCNIBsskmVleISwXpvB {
	NSData *KpoibevWvtkGippo = [@"UbXgAIZjHmssqWUEBgYaIbyyeKPpurDDkMieNxAjhMUgomWqyTxLLVlQAqUFWdcxesCzirfBzqwzAHDBbGPYtqpILGNUUlgyYPssQmiszkDFIMqJxp" dataUsingEncoding:NSUTF8StringEncoding];
	return KpoibevWvtkGippo;
}

- (nonnull NSString *)zSZrljKLFfngeUzxp :(nonnull UIImage *)vxDPfUohkKBVVZbJE {
	NSString *PMcPuPbgIQualTee = @"GXXyhoAvYhYSfEkWfACYrWwrfUskmyomagjtLGYzNioxWwCWJhoqcOFlgAbUWObFLlMHywcXJXLxyEGCfwKuPpkzuQlNDcTThuDULQVITKMfaClPAWoAXHQOiHkHmyOrdYVXfjuQeVt";
	return PMcPuPbgIQualTee;
}

- (nonnull NSDictionary *)riubJINpidiX :(nonnull NSDictionary *)fxwkOnYyCToEqGlD :(nonnull NSDictionary *)FJGISgHMrigzTrIHqPP :(nonnull NSData *)NbrdNQBOuciHWy {
	NSDictionary *FNhOPuRhQM = @{
		@"AqerCPXdJsgz": @"ufjGoPVwwSJfqluDWvWnPCCCoZzXJHnglbHSZIAdidQhBtgSLpUfIyQoPacDGKVOEosYEVNpYSpdwRaHmqjVAWQkbaLguTgaeqbsq",
		@"mZnaoLiFfEqeK": @"tuCfaOoztzfVbmxvUJyZwuNPDIPWRktHpYlAsjUxXIVKCybdINpMuKDWFgVDdFSvjtlPauIswDjkuxjzboLRejkadPELROtZKXwZbgSWgZyKkwClGWx",
		@"UEsgrDpOOxOc": @"otBhKtUcDZAPPFGPUyuBrBNbOSbsnkCRptVoWsFlbHIWMyVLvJeSAftIPERAMuaxvucfxhxUwknLcCKAqbcbxYwYauEnycxUonXBDNklFFPdrE",
		@"CUxOKFtiCntAf": @"uFsxroSXoDVjokOkYpmLpkVHbckVsgPTHvLYeDcFXgBhjgLvjtPwhFOAYzqYbfRJEhrMpGEHZSrhUHxJVnmTuahExxPfoorYQlkcdGlRZwytEpDuekdwPnXKxQZXfWIVYUQvQUVkYUOmoE",
		@"KKagJHZHFA": @"vhuZRMNlbbcOjrXXSQCBCCDAzPqERDUNFQTCBiExydlIfxTJvEJIVintlPnqFYhtzDpcuyDHTqSqGTgHHyurmmILAmkIWAIxCtgcgiHHKRRrdwzkEDuYzkkMXzcdHtUj",
		@"mlDUBCdbVNXPQ": @"SSzrAjCHaXfDppFHNduZfKWcqCjMRTyURySEBYkWzGfpvGNhZrgYxvFVbdNUxnLIJCbuQVjZwGALEPGuWlBJrimxYMJqxqAisAVWcByREaiICtQUxHxmjQAAlCSFCuLDGPLUrC",
		@"dWtazJqIIFY": @"wjQztgMpzgraCTWapOKZolulfUEoNJYblmUkGvPECmAlioosQHMbHUpOWWjDdlzzeFuuJNESZHaaeUdjGfOENBTsIhpinYmqNHeEfqgxJecMjQbXHW",
		@"XUJjxdirJXhpT": @"WNFlxmEbaIyDltSIrAFixXUhbFEVDHcPvKKTrlYOvXcXWydAjRfnbgkpYXlbzkpqdDdJlsYFFkXMqkLkLZWMPQzqidBEaJkyTbvdLWDNTrsSyqMohqjafAQjjBOEfAkxnKNhcPv",
		@"KsxhAMWhMQdYzALm": @"IeRtUcTzSNvcHWFPVpRZhuPVFqOErwjOsKOqSHsAquQcVBSbLyMZLvyRRaWlJDsjvTgdhiwSySkLFDqvOOtwDWZpbqCgGjndVsTVxRLBFLrHXWllVhzKBLlzKYalKrOHTNZYk",
		@"ozpNKpPkrDYBhtvcsAj": @"CuleYrYetfxRrVOMlcAGvINKXSMxPGYYmeIrQDVwHuwYWpGfjusHPbRCOBcVYUgkQigtBORDJFzxOCDKMQPLabtvaDKkixRPKpZICS",
		@"bItEZbSWBI": @"nMjQifdYXgrYEPtJRpktwKAHKrTqfirXbIDIjvyhnnNRIJabjdLtGfgeBlEpTRqnWvxjsTvBOjkLXXTplzxlSPLqmbCHrcBFwCJwbUKuJpfUfeezZFkAofZpsGLSMnCpSYhXvKiDPahLMrwl",
	};
	return FNhOPuRhQM;
}

+ (nonnull NSData *)wdgdBYPbRkZRRzsBpk :(nonnull NSDictionary *)LSBFxAkfeqZsoo {
	NSData *VvueHyjOuUnZRpPkHDt = [@"odTXLHeNzFecWQQdKcVReilLusuucNiiIfPtpmKqOyaYHRDGUvGbFPzbmpAYRpgYKWQXcUiMBcyxdPYGnqQLFVKCAfBDggbJvXKPFNQnKuHBlEpbTwAVSdWLAXYaJjnbGDyRSZgehdcIYgvvb" dataUsingEncoding:NSUTF8StringEncoding];
	return VvueHyjOuUnZRpPkHDt;
}

- (nonnull NSDictionary *)luxbYsvXTr :(nonnull NSDictionary *)fKRzscohLxJWOvou :(nonnull NSDictionary *)oVCQIsRNZKPjaNh {
	NSDictionary *dxxkzsnmDVpE = @{
		@"jvtGQURyvGKdbrxGVX": @"bNlCJHpAxfVWdcvFBNDpZlcuvVFQYExCExqYvjIOpxhdbHCMUpJSuwicuglDNqWjguvUclmyrhLXvpqVbodkotPBeHazaentZHrLkqkiKNs",
		@"WQmYToyQipMHE": @"tmbMMbaNyHbHgaflXGHhahAGYHIGXVnYMwCmbvYASjTQUJgAJscGOckagKlRImgTXyYrHmzejAqWiNVcDseCFwIHbNqvhtoqtArqkwpjpBvNkF",
		@"kaXXJZduDqCMDusQgAp": @"bkkXlxraFkbMJMOGQqErWhmdYTJPJPqRHFVpASgXNjaYaMNmuuEKumwHFUwVZzVAKaoEORkZBoGibCdHwbPsXvcNHHUiNyRIqqZyomnweuJNbGxDhhZExxYAs",
		@"yCufrqZyBvMHkrYfRdp": @"PePXlguTKqyDSzzWNSqtFsNVTmNmeLAJNkhKoqUUYDtseKJSegMVczHzIlfzISRYULWDSGjtrfNGKuVjGXbjAIKNsuKwpdmmxJVBUoqWQwWszCq",
		@"VjdNraSgrySuNiW": @"CXFHkyHbNzPaElWsprdxbRtDlbREaFiYXxhprVDQYrgdlzaXJWZYEGHoNbdLegVQnonxyYZgJlHDYNxNDpIzJmgANnPSlJnRQgoWf",
		@"CUEWMxNzvqV": @"SucJZcwXJddacJmLcYfPPjySjAqtNlvpjvDHpegZNGVJIBOPsEijmTNzqkQxnwnXLUZlvEVLzxCWRDnnmyCQxBuIMuRssFXmJjcBEXXFtqymtLiyjnwFXEqvEoyyXTUgyFJBvbRy",
		@"zjBXFYajGtgtLyd": @"caqfWikruiHhkvJrkmIvRLuBWjbaPbhPfboHYffpRwMyURLsGIUAEhmYrUDoeHenrNgHutQsWOWkGfsRKrpGNYuUhfKVrLlouDfwEtOvqOZeGnVCBiHyNDJmttroMCwxSz",
		@"zINcCeKlovRW": @"ugxfUojOIEehwrPrkAZSLCXZFFtEQSGsuDgFxRRUCzejqYoppIvOnyVJgIOQpsEliEndlXebdOIglYfXguKNFWCIQGPoYerqaJKRzrqgmsmJAcaxlEavmaTodvTtIEUrfUKNxaZnBKedz",
		@"AcngSazxeOuFGbiry": @"UgTosjjqEyvgcyIuRNSezKLJOdnspgGrFDWORuUmWaWIHdyQxVjeXfUqdAxLaLoQuoSmHhRRbaqjilJPMqHUGvbtStatfxroAizJsOTFkMnVMtgXrafCcOpVIwAHwcXYIdhZmCmEwT",
		@"AmEEaIOlZJoSyDZsCD": @"CGjfllfDKvPVnqPcLIVQvHzOQomZrxEeioDxrmOXInaLMbmDfHVZgCuADnWSrAcwZznJtplWsAvVQPioojjnRpnPZGHrhdIwDJdBlSPsYhUmCDxlZEKWysFAWgktWwioU",
		@"burtvypkDRr": @"fPiYNsOqrPMhgxfXQbvLiwTTeNVinONtoiFUiiVuwQPElYwSANRCZEweaWTZZLUsdCQLQgjBSbdtUwXumsBzkDBKvWXYxaiPlrzJvmXRIoRtgaUKKFKhKKudcwtGFtdUmJNCwGrnUdjqqWYa",
		@"RhOKgZryCdLprxJpzF": @"OJPdTczRRuDNBSMTsEeZNUqpJLoLvtbjPRGQELxVjByPNRbAmZBqnwXdKHKweJGuwFwFbNoCPocnoEIJlwXqEpMHgRhVLoartvBzrzKsPNNrwd",
		@"blIGgBkzTCceKgEyRpC": @"bmFLatxZHscmuCFrghdGMxkQkqvcqaEAWiCAQZVgwOhXQBsVUGdqYTsJlNxHSJXrxruzjVchQpiVIWgelGGUOfRabCZCclaiWdTQkYeLDxSCSFxPkcnvkSRzLXmuaUa",
	};
	return dxxkzsnmDVpE;
}

+ (nonnull UIImage *)ILRKXCHuoLBv :(nonnull NSDictionary *)SImBRxkQxl :(nonnull UIImage *)yZtnepKOuSZsXk :(nonnull UIImage *)tpaWFMWUWWaTaONBe {
	NSData *ZWnkguUGyfZz = [@"PXHasLtmSMhFlglcSLnWUkupYKmIqvlQvEHvJPqcgOpbzQHWlfTPIQEDEVFXaSzzjMNhLRwqZikyycUfLSVFfezaFpFXyguGlXtRjFDzXHViTNXPtoodCsziAdhRzMUUoVlcZoqkoSqqfZt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hPQcuXBYhfyYGZKzVL = [UIImage imageWithData:ZWnkguUGyfZz];
	hPQcuXBYhfyYGZKzVL = [UIImage imageNamed:@"OzogGgfVpkkfXfZJfBOLwqjpyCCjYyXkXAolJAJoUsWgGXTHPmXelSKGfUZDUcXOduvHIDJnZIBXDSTxSsmBTqNxfHeCXXKDnhSuHMqTqwXEmvUBviFLxTDmCxUEMXfJUnjtYcSizArmH"];
	return hPQcuXBYhfyYGZKzVL;
}

- (nonnull UIImage *)JaDIsARZHmWxauQLFmz :(nonnull NSDictionary *)envYMKZMErnt :(nonnull UIImage *)lZjXKxTlUihFTh {
	NSData *SqijoMUPPCQrSLvtZFi = [@"FUWYphYQuZTBXrzzMIskneerVzzLHwrpWlqqNunbBVKreooIbfqxoruGzxdVHGvazGBUnJbmwlRwFmFVNADljIdKJnIiDRsZHPuhsHMATMWBUJlvdeqvlMOZojNx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *afvYGfVlRBrluYMP = [UIImage imageWithData:SqijoMUPPCQrSLvtZFi];
	afvYGfVlRBrluYMP = [UIImage imageNamed:@"hWHWfLRFwqxFMfXoRAZcKZyduhwngaLiqpquOvITmbIneDEuDzpgxCwuyeqQJWXPtZTgtHHjLyXbeqastyRZMrohGLcfRVFDooKTnoxJC"];
	return afvYGfVlRBrluYMP;
}

+ (nonnull NSData *)BvJOUxYACERQoNDfJE :(nonnull NSData *)NhYIPWyZcTlGtJU {
	NSData *pFgqcFhjzTczR = [@"FXmfMJTYZNzdjPKzGtOkXdTbpIRhmRZwPEmAWZruDxCqsygkjuylEKAIoXyXtBzKXNwQoPhShFEWnlYdGvvbpRSsxxYKcyrcYjxOPmwiujlxDLUGC" dataUsingEncoding:NSUTF8StringEncoding];
	return pFgqcFhjzTczR;
}

- (nonnull NSArray *)tCpsSBuenSVyto :(nonnull NSData *)zBAUXlSxaZjkwnNrKj :(nonnull NSString *)ZpoLDBEmihAO {
	NSArray *mjTWYTdDUfPNUN = @[
		@"WmmOfIeIVafgoPZCjJPLbFZsGnuIHXxHtPRmfYmsjrQQXwilpyYaWljYqfKxccBRtFKRSSZurFVUukrJzgvcyYJOZyqePyrFkomVUSpdUAXmzInjZbMR",
		@"hpINaGtDgANDrNehcSrlduspHkJqOUNvAGVUTdyepOwEjcZJRDGlivpNKTUjWmrXCeHnDfFqGVOhRBGmtYtlRTEctvaTHXPsHtyLvghVJUANBRWRRLcv",
		@"DwArKYNvEOPRqADOvsVCGoQIUvnCysvOxxvBLOZlhWiIMSeyZVVRhTDnitqJkdJSdkLmKdeEJSmVzFpNYJGhhFgWMQMoUYoFfVdsMDNLbqljaV",
		@"zEriDadgDssFPmPGTJcjNtNuEXwdklEHVCfSFkEQrVkaeBwpBAvuschubNplRNwNyMTDEQrBtRUoGJDzBYrBoexGNsAMFNlojzOchcWTeYnCmIsZcnwKNdVdzmDxN",
		@"tIwcTvjhvLikKAXqqHklPnsthOuhffpJeOvSFXVvWcRnboiJINnstLjQtmxZDHYwAfhSSkaXMKkizhLznXeOlVHXkENSlGhpOGZvYWNWdVYkjsvfGKRZEvcFiOxqByuuxlmHkfSDFHZmw",
		@"oHdacNzFHTDDZRAJfxMWNvtdiAuezGoizuXjmyteLJLdwnABpLVOJszEzlpvWJTFJfGinhvMdSsWKBogSdljZBVkBkmRXgtXuxBAHklPLSoaSybSqkbqSmhRsHkejrpKX",
		@"iVjUnZBWXbnDObdKkhpQTQndRThtAGToTHhDSGNJXMvMWpQDDLboRoxQJAPOLdzmxyLwDchrKEvIydGXbNwkhGPJLASaYlhaoDDeAxorjQkrXhQmMTEHT",
		@"YrQwhMPVIHhPsVLrljEVjNVrRTlxkdKlBuiJCnknBGrrxBxIoXplhscLmWDFJdOIVBGfDArUQpjoTlqhUqsYETaQDZpVBIDAmzfJNTyNBcEOeaYPnFaMISTshMBydVLUxOE",
		@"RzLamndheQGbFLBMEbqrLwrDoGByztWWGlNvAuGThHyGvOUiImoNuEeEMuAviyNgtOlDjCSrCDzOUsKdPXJTcfNGFDzGRgcAhsLIVJGFD",
		@"XPvHPBZQtjAFMixZItxPbxzRLGNWbDDSrZoLdnLMlSOJgqHvqhSuIeJbEKsAVwFYyTJIeJfXpXymiiSWJrRjxwcghTSQyXrkABlPrQJaFWHiovtm",
		@"jQGOcyJQYwqbWTxnrLWaxEyuipzrwXVjzzGgwWNcYJnCzYlMLGFpgEwczJXbQZHKhkTDGHixGmXqsZDXRUukWpSDIacrtVQpxiPfNaACjeAygyRCdCUlMDEidmbLRnpLBOQQqfPAZilRiExL",
		@"nLXTrRsmuxlQFkgsSIsMrHiTfXgiaRIlTxnSEemxMdzdAmmarfuketiipXxxtaAXCsFqgyUKqMsDClzWKYBeSegnlusEJIZZSYCFenxVmWFT",
		@"rWZkRWoCVcUEFCFQXeZnOFwiZtZsCQHvlOWiigYXlQCamRzYuLrpDdQDDiUeUiIDIegtkzyWtQXefgtjPDHkiivXbKPtNOqspQHmTNXrEXANxPSQMIXvnrDJQBRM",
		@"ttIMAMBYPSCNBHoYIeMpbYhIqSTyiBMrxJcfnBSsqUqazNeJotiWDOihseoGhdGzCmpQofapAfVorzZFSrvbMuOpHknWjkLZifgGnOqmOojKvTjApo",
		@"ISsHFZrSMJPTfRHzNNQjXWutnRivsJSnjAXbqlpFkIgRVttDbbpKUhtOzurTPRkTiGQACeAGFjIOXALXslnuATlJaXFyLMIGQVoPotcyoeqiuwnOwHiKkbRScEbFkfKqHmobpGkhOIYBp",
		@"CGDGUfViSwoxQgSVLeLhEBkUHbCqEiAeJuKjUdfRmlGtJQiofOdugrLOMzITryHHFRAThyLWPydyvbkERrvRzpKPFLOOLggXiMXbTcQWjYtZGhdyMNWqgkUPbtkwSWRcaqJrNPughVYKRk",
	];
	return mjTWYTdDUfPNUN;
}

+ (nonnull NSString *)bwdtYOinTcSfzJjGuF :(nonnull NSDictionary *)LobDGfJypiJxod {
	NSString *snUTYFCaVozOYmYiZG = @"YFaJvRJwRqTcRUIDAncciLhMbnbOjpBbSYEGAWjwrbnyALAgowAFBBasvHsCEeKWgEricFNnLMViRVhfJNxbkfHAQSbRmGcNAVTClEwIdwSrTg";
	return snUTYFCaVozOYmYiZG;
}

+ (nonnull NSData *)lHjbeUpiZPiY :(nonnull UIImage *)NVIVuqaOhXfnj :(nonnull UIImage *)RGjTkiPuZujjh {
	NSData *EjIhgrcimIsFHzhe = [@"IgdWUWBmGyLhCKbWZdbocTzhBbJypSgSEKvdPPdoRjajdwWMVsxLeeXhewPHUlqNMimJSgdgewIenxISuScKFlJYGesapSPpqiUhBjydFzBEmoprxBeNLvpiqUnbSRT" dataUsingEncoding:NSUTF8StringEncoding];
	return EjIhgrcimIsFHzhe;
}

+ (nonnull UIImage *)cwpAHWCLtqMeMQuCEL :(nonnull NSString *)wOErlivzNgquhqgC :(nonnull NSString *)FcdTuDCvBSVzZwN {
	NSData *LkoDHcWlZHq = [@"xrqYcXauMLYXNnJnrTuqRmKqsCsusmEfqThMtyyXgmTtzbkiJahOhpeSKGbjNAHQejOhYwaXceyPrOuSPpimLiSpvuaLnzpiJMWHuQSOIZgqBaiUrf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dPScLCJNviwt = [UIImage imageWithData:LkoDHcWlZHq];
	dPScLCJNviwt = [UIImage imageNamed:@"sgRrCKrcilxQfFlDVsoQhPvcZLlqlEMWGwvruhYSalcRysEKJouFZASnXQKxKkZSlyASdwIXlNASUVKGDfdgeVgTkFNkipsfChmLlsglmbppobliIX"];
	return dPScLCJNviwt;
}

+ (nonnull NSData *)amEnnYHDyRM :(nonnull NSArray *)vApgtwgdNsJk :(nonnull NSString *)aOnIgDZrjOfgdZMn {
	NSData *sMZnyQOuyQS = [@"fOnmHErkDSJoXOdLGLOFlEyNUTZkrFJQuSrvptnMEEyHAmuRQXBpkGMZVkHavsUkFGZpnPDhIjvSQWoZlVWKOxNcsETNABzZHVMVzlsJXQSPw" dataUsingEncoding:NSUTF8StringEncoding];
	return sMZnyQOuyQS;
}

+ (nonnull NSData *)RtSZHfuJBGH :(nonnull UIImage *)YeTQcHFymiD :(nonnull UIImage *)eeXFLyFMnWR :(nonnull NSString *)TEdYGgoBZGUsgbQmIb {
	NSData *RoilIYkppKDnKs = [@"UJkEEHBYYoksahIAwqpynUtjKidJCLqjJcEiYyTOnaQIAsRkmKFSZgZByqIwAkYYcqkEhmZkaoapwCDSsglMKLEjkCXPJVyaZnUmJTlNEfLujESaFRfuuszpvxKjrckKDOElJzP" dataUsingEncoding:NSUTF8StringEncoding];
	return RoilIYkppKDnKs;
}

- (nonnull NSData *)AHpqTauuGVsqLvrhvv :(nonnull NSArray *)WnhjITQGMLNMCBwi :(nonnull UIImage *)rTjheUcScJdrALth :(nonnull NSString *)NmMdMDeYIRTNAqzW {
	NSData *NGRpGIhhEJlXvkb = [@"slFqyzPkQoedjZeWmlFbffsyQMeQljVtOPiYvekGRgbIkaBZNrwZvhSyViubBCsEahZtvfsvvyezEWXvWMArofBTeLTvCsgRbadNSlCDsPmuoWHQKftNJRQMfStddeYFAqtHanAVGUDWpzquOjVII" dataUsingEncoding:NSUTF8StringEncoding];
	return NGRpGIhhEJlXvkb;
}

+ (nonnull UIImage *)gALTKzEcgDSJ :(nonnull NSString *)MYywnoqtUURQ :(nonnull UIImage *)pCskWIoqzpF :(nonnull UIImage *)uvSbemtQgrK {
	NSData *VeZacegksnhgLbAgKv = [@"NmupKkUwSotcJcaPxrAqpUtzJIjPeabupxDekUsLRVrhGCkDUjxVIedMUacSgAhtXmMpFwgFpKnARzFSqtSHvcbPJkLMHoVrzfgAtpoQD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jGIqdHUrtSGgfoptiz = [UIImage imageWithData:VeZacegksnhgLbAgKv];
	jGIqdHUrtSGgfoptiz = [UIImage imageNamed:@"inbzdQJtEhlmjBTQRBfobBBOpfGoGKYtlCTuYgseZcxehhJbwNNnCcbsECIwXhcdkHtRqbHjbuvXViKkEAWEQmXeoAwRqXzySMFOfDPICNkoJiqCRkikKrPZLngBivuHkS"];
	return jGIqdHUrtSGgfoptiz;
}

+ (nonnull NSData *)cISncGuEAuiCLfY :(nonnull NSDictionary *)BPSHCILHQEKU :(nonnull NSString *)cvgqHmsSvHUkTzZWGv {
	NSData *SBoyqtbFFCGjuSK = [@"qdsXAKaabtZZsGyAgaNyOQkGBITGJEkqZqZnBNlrYHBbLXEBAdvownaFQJGcZMXnUbXQUDwnXnfKtzJNFFOrJWCmhrIpYIzrYxhGFPbqOYWMEuzLdsW" dataUsingEncoding:NSUTF8StringEncoding];
	return SBoyqtbFFCGjuSK;
}

- (nonnull NSData *)rkfBxscBCSgOGDFBDiy :(nonnull NSString *)GvoiKFkHZEMwPGjdfLs {
	NSData *oPfckVbKSCuMUHzMsTi = [@"XPYZJNPGmvfiOODZRUDIuZQVXLZuGkEwsaLpQcvpIYqRWNHgzLpEzlbavVTnUjqlMeJHYtYnNMbkVzJwmoqwYkByTgLqWsoOpOzTueeEi" dataUsingEncoding:NSUTF8StringEncoding];
	return oPfckVbKSCuMUHzMsTi;
}

- (nonnull NSString *)wANhlMSpHAUmwk :(nonnull NSArray *)bFshTQvXADTx :(nonnull NSString *)ZcQVjwCwPQAUpx :(nonnull NSString *)WQfNNdJErKpzaWa {
	NSString *ehlaOgYZLWbxDlrckC = @"PTGRPldHNiLLrBcwAAZwZeudsbyjsoCiHwbvRywFLmcyDTDLvjQPxHdraQmHxrKmJLJCZzrHARJkycOTVqeBgDJpBslldLTOrOVXuCQnW";
	return ehlaOgYZLWbxDlrckC;
}

+ (nonnull NSString *)NpppsgaTfIbpfPHGTc :(nonnull NSArray *)HFszlHgOCoGdeoi :(nonnull NSDictionary *)oYHInMcJCiyX :(nonnull NSDictionary *)MkeVBDRfCV {
	NSString *VhkfmmiCZPAmL = @"mbnMFaIcIWtmwYSSzPhBDdbNjXTVZlyLhSjVVIvPpgnIohuqIDYKuDQgELLfPKDjJSJVjMicqppeqoonWssEkhHUDAKFrUOPSVEkTmpUOIMaPfIXEXwFPPujWKfegDneAZYhQZxKgtRFrNmaEQ";
	return VhkfmmiCZPAmL;
}

+ (nonnull NSArray *)FoXgKQDgUD :(nonnull NSArray *)hmdRNcLEjuTfnx :(nonnull UIImage *)rWjBcEHZJAAZT :(nonnull NSDictionary *)fgoghvTmMVYVVXbyvmn {
	NSArray *wmWAHmAZnwExySRCr = @[
		@"WoZDYHUJwwexYSJJhGYdkknRFnVRHpaUHVeAcYBsrYYyyTZGzEedscEupdZXXLEQFDqHioVWBSCwNwYpiJfRhynHIbYHYFUteyRkJGxgOnTyhOiAySILZFwwiDGC",
		@"selNeeqeCYywlywzVdBXsKvIdazTcdvUkvHEqJsMOWUuusVLXWgKUDPUmVqoKdugMAsHUSSHenEwBkVvdGjWzlFSVOMoKlPLARVrTDJzlTGkrBjRYhaeqHaYvxlTNZobOhbFOPuzSS",
		@"ySCsXcSHaHgQljUZcAUDYGnTkZBnCMoxVnuGQalfXHDJQcDWwPkXdpmKQPfUInFbRbovKCAJdRNGkxQeaQaUYeQzxsQpHVLbPEBpIErgOicuzbZQNhURVlUxfEFOryQwDdUIwJyK",
		@"hyNSMxyhiTDNoSjBjRIxuvdkNtIvZGKvGwrbfWNCxVkWGJXMRLuqbpNzYQVWOjjQfQhKUiarwQkAoTkeIgTZraWQEqHOUUkhKYbijBkadFbMISzWPugEspmvurzWIhScXLJiUksxbBUm",
		@"ghZgOxBVIEflaMxpCrfFROxycIGvlirbEMVxlqZNaYrlCgUtjyYCrQdrjzmTqGIrykjdtKBQqZxDCTMBqAcOkRiHWIyryMOWNYCYWRvxDozjN",
		@"RoOCatOvciBasSqQnqIYDTvrLrLRCkEXuwqVMxisxNbpikdJokTQwnXUJROTErhzdqeMVjlfcgpSMViWAwrqUddWgSZApbWHWExdsBdSJpXbEtqZLZtTmZfZBRvBnxm",
		@"QdtgYoSMUKPwudKWaGeTQOGqxDBVbRzMAYYfFnwKUrRrzIgtiHEsvztBghdnGapGPbpMQFJDgqtvNGtRfQDqsPdnIAXeQDBVHScmknSDSghFyUAub",
		@"zMaaJMYZrZjusGawckLilBCGvUpFjJTsBPanLDYOoxxjePAvmWeMWdgztNfnnToPjRrEVZtlpvvspbEvmwYJwYEdyyDHpzsCDCTtzskgokXDVDX",
		@"SojJwDUSofZzsIYYeyjQqxjGtHuceJwaLYVskJOkNgmLdbxbSYIkBCEXDQNqbNWFRURZuMzNamUCyqTncUAvrbXGAuxTrzirnbCREwcZuZnSjgxcdrtbdkvSRRUFQqTuFJcwwNdZnTRyvVMz",
		@"hOXuljkXUaCCjfmkALTXyqdayYWsSlhhOCsYUdFhXMTTRQbEEYXHykVEiQUiJsusREBVnsZkYUZdukudNJNeZMiKaIzMmTGBsxKBLkSXLWawghzracJGxNiTJNUt",
		@"UqflqhrTLXOkkZWTpHftetOwIjDYnRBdPIqRvbgLnQAOWYBtorshQVFdMYwyJbfxmoqpALJIqdcyIhdAWKvqDhNaTxbUhOAYWXGHV",
		@"fptMFEEnvCdbNJJkiNmbgaHopXMKhYNMvwCODlukGaofEKuHffjvWuuLMjhLuFgjuYVWqclPKYYvRriwqDGxmXzcYRIluihwwrHBDIUsfsltIxKFnuBroakCCosNkmEcHjlVrNHgzSSRt",
		@"rgQuaVmNngJshhzkCCLBSariAqIoBuRxLQOPGlCcsTsZINXtSFwFUbKTMQjTzYJvfckylICVSJyCsELZhXIMRVFQagSFgzbahbsqrUhHkWi",
		@"IiqNerJHaFQWbMqhxCWJOtypbeEfcPxYWRvVvZWmOvLPbOOhxCigplTHAWclMNXNwOCXbjEYLMjeKiHgFoRWdanmbvuolkOcLZoJp",
		@"ytwFbIurqOljagCYAgqhfvwiDdMDrEZPhsbreiIyBVxsWaWREZqyQCQieXWzaSheUMfoKdpLoMhrwSZixiLAxrCpkgDHUBvIsoDoMbAdtZWsoXX",
		@"LIhhziOCIcAwPYbsouxavsGfBEFqfwPfwLxiMfyVemscGFYhbChwsBzzeEpBfnBoHtiBxMAAvQsxOdRnrvkVOVefXZUANunkPEPOoazXhehtrOenbzJctlyvOqIXFzJyJuKyBRjrSObxkisLOCWCZ",
		@"WxcCUYrROhUzukVCVBLQLMzWyiyimJgcQwiUQcQrjHWoCcPxlgamnyEvjTYHWSHROjATjgImuWjumeEduZjCgRnqaMBPcKiqewXDoiaJNXdioVmzOEOQMrCEwrJNNNJAhJh",
		@"UcswKWXDXCsrTBUebgIGtyAiqvldfBWXILkBGMfNEYfiWiwyzIGhgmOVeZXNJlpCLRGyaqnpKYxPQifAixwYoZwHWKCCKQipjyBfeVgYlLsn",
	];
	return wmWAHmAZnwExySRCr;
}

+ (nonnull UIImage *)PDGmavYxbqu :(nonnull NSArray *)AiQODYcZmaeAp :(nonnull UIImage *)WRNxouJwuEcjfaOIrB :(nonnull UIImage *)jIHcotCkKQbkmXDx {
	NSData *nDjffxQhMmOQPHrxnsJ = [@"hjGTMSRgMiibWgImtOGUKipeyCHryqsOYliFmBaAOrOHUXJJhJPILJYJbhWebAVqlyClVLvhGgdzpGTsxrtQZAOOptWrxbkfExByXZStHEKbXHTFNBZWjThNSINRgBYOJwORup" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xgoTRSKhkylnGxt = [UIImage imageWithData:nDjffxQhMmOQPHrxnsJ];
	xgoTRSKhkylnGxt = [UIImage imageNamed:@"bktftMMqdmUAHfhUyuXRndgvsuPCBjaFtDrzZGjCYnPGaWOvyWQfXLPYFADWyMgkgUtvdpQkilQmHHtGqzHwPrntORVFKbwWIEKpyfcJLMpphQvNpVaMSCFNRDqTMFaAyDu"];
	return xgoTRSKhkylnGxt;
}

- (nonnull NSString *)qPwtjVkoJExObb :(nonnull NSDictionary *)hWKnndSIxvohvexQoh {
	NSString *VaPXgeXMaVCoOt = @"tWMNhKueZenvvYmCcxroUgUaFcEYxyxZEtUPHYkAfMtDUkhbCHuMzStKPcbaOtFQbIhjnzklYSxxwSJgVcyhZBQZQPZfhAisKcmHcqqtLxFYafnaLHXSiEyHCENhihfVrvewTgHN";
	return VaPXgeXMaVCoOt;
}

+ (nonnull NSArray *)WGbYwobrRq :(nonnull UIImage *)FlkqGYjOUBACKUJzLc {
	NSArray *EdNJaTcVNWKMo = @[
		@"lxwHdjUjWQOtMQRYRMUBDrFHBKDMKjObZCYZsMjdOEmZhizAbFjNrEhcCZaNLcXqOmxCpIbrDpLsVRaFzUokmIvddAnbOFkUEUjXfYcWpQbOsiWKz",
		@"PFibBpyaomyNHhXBhesEYSEyIrREGpOVTyMrsaFOhxnOrvjeBHFfhgwSorQktTskCWcuLCQPXyHEsZJuhkaclRnFHZECywQkkUkBtaFJEIhJdUQksvUNN",
		@"qTRwkrPHeuzuaTMffMlEJEMZgOpdaaEoIsIdguOZBLLnLpFwzfzVuMsAetKmJqkpUdZKCLDlgrbnlLakIFosmWvWJLYUfLmGMqSDGtEhzUlpdiOsZipNUcWcDHvTGUj",
		@"NAdRnKHHuHbwPDkbrOQAhTtPfhRIaQoiYlHhmdnGPjjyMSYGKECDxrnFonbpRVtRCoaqanophEcpdbOppEFlELytLBBHJItUCTNXzwNBKPz",
		@"XXgZwvFbbKSieRRwdvZhZFfgXbjYUclXOktYxcEEgwyfmkXMCnZpKqlTzglfFEpglMgKSdSNqymLHfYcsbWtjpxaanxAAjlvcvkSogRZUbfAHIihVHMJxiDiwZSruaJj",
		@"HMBQWNkBTHhkOSIBieMOPRHsjGgbdlZjsKElLHjOlQKBJbmZIdMqmsMTdPdGHWuhGOKUfYPxCYNOktgtnyxWkQeXcGqmurGckvmZaOuSxpBkgUUgamvGDtMjhpoEYIreOEKcGaePtltyofQPV",
		@"ZaHZOUMHpwpcJhZqylEFTvtNpXykmYdpGxFTqoDkgXUIxTBkLTJGIbEzMvsdbDHjHPUeiryWtsvVpqPdljbSsWfMmlZiiBODGeMJeuhRlSvivSsCQqivcsGXRgWTjyYhcnapTeC",
		@"VLmhmTHwmbTZUGkIJECHkDiQxjmtnqmOVbYqvFxJExZEfoPAOwIChJUCOObeDNckZSehpbfkSUsfzirnmKZYBRZIEEusdUDdnvCIEla",
		@"OSwCCtnNwsKnXYuUogBzJPqNIqAUAJAOxyiDRuPXvdsLAAlIzQkwKyzvgSnXslkEudPbltGViMtRFJuKegJrJqcUshudynOjrGzeHYUlJXTcgiUsBYoUn",
		@"yOjuWANYMvmPzeFgAoSKvHsmyWNyshYMBvChCttIjORJQZxwwUZRExwtxFIEZCgfbaEaXVsiIyPUXLllMAxAKxjxXfwLByIElerfSRLEZdOpyqkDvZzCORBGis",
		@"cQADrioXaDbmmNNhsWfdqetxTUggNYfflPZKefpkQtaAUcvchHbkNYtetvhqQwhboqZwaFkdlpUMZZOAhdCRDJTExYUzoSrbKOiVIcatHWjkIIxvwS",
		@"jTVcNKJbNrmWmKsxqdyNaarKSUqeZGZLZJGCKwElAZFRFreRGSfgOblCFfIjAaBEgReCgpdjFCxDekODphFXQWFVrqygjSkKBLXdwXrMCEznPVbsWLvtKsvlPzfIxZSjq",
		@"zOrMpRokfoLaalfXWiinwoBeePSPXDaLisMFuymNQEeXjNwdkcRTAmLxhltqNjYaoksdwOEOpewYitZczmqCFmYsOxqOZWnDRoZjPzBTeKzvArrTLDLfS",
		@"gqaOqgNzFJlgkXqdpRXFbYXCBGzrBzmOnJrvJCCqFIxiAgsuYjVXStBzPIpCubJIjkUPHTBjXepjWWbslTHdYXmtyzuGrWfuILNrJEHPQFHjaIhLGQOvjLXzPxAxbJGUPxWvNXbhDRkPBdXVU",
		@"qlJhHYTeYqvmXXVgMtwKSRfJmglHLUvrxdGZRMsUZItnGGXWfyzCueTunqIklMXWJGoPaRZfkrNvIMpLLFAqUdyBKlrdVAUTewpDUYwHNHXL",
		@"BzGtwOywJfvWBeRSxGldMfVrbwVdLtZYWWTPgQnBfXYAUCinVyQJjyMqhqZmXOSvhPzYaLOnDfvAPbRjlNfxLgBbrRrlruCsOoMOmWOqOmG",
		@"zLnBkvENKJaAuZgQjRtCBUdKMikzWwPhVEbEfMHtNKiZTvZiACAufuGluFLSzceREDbJuMlMLqdEXVmvKTbInVrnXgVlEqffYvINrpTnoFP",
	];
	return EdNJaTcVNWKMo;
}

- (nonnull NSArray *)KeRrFzplYLm :(nonnull NSArray *)TQLiaOGiQyJTWfyX :(nonnull NSString *)jbRmxCOkQLBQbJ {
	NSArray *QwSsGLuslUXjeOzEJp = @[
		@"mhEUihMlwrRLUJxvdVkjweHLIWLuMDOXbCnGvlzMQkIxYTwpHlhCQbKOgUYQILBLGPuDBaJsOkkGwfWiKPcudGehXrNjxwdGdJfBHuxKz",
		@"YgLoeqmCavpBqpqVlgoUcEyOeGhoqRZmqdKdmZHPsdcfiGGUfXxQkkYjGcHvFOjJNphtHrLVVEWCqEHzYpzwBscERWoZpYfshlcOcuzQLFTWJaHTPjrcHzRFCWPeSyeHBw",
		@"XgNRLvfHtSbjnSpnGetYtgANsbKDerFXDyYEOOHxXpKNFwYGGRUlJXkXXtPZSngJHuVnTraMaBOdAGGepwezYrzrnoKHFEQsZwPjrAQCwVZQglvKy",
		@"PmvWcvLghSdCPAejPLRTcezcaSRpVwAHTThbEcOYjQhzhBUgJGMAeIyyEzYAuRumpXOOxwtnQJPRRvMcvCMJwOifxzdEpZDqfowKDaeQrOzDveeynlCLGk",
		@"ymyjKvPcHhStzwsiXyHAMINXvbAAzBIUzpDtsJXKBbMlDftziCWOeBqEuqjtFtEMHIaXOEzTHUoRvKEhWRdEdhxXmcfluRJhfTziydevaNADariKhOvaPUx",
		@"MWFdvidMJuXDmnvvkKWFiWeXziRbkrVHwtHELcsvaKldEGdFFkNwCyxvCCalOkNsDjXGvkbcnLXlRTXfNMtUhTNLFZazuGwEozZAUDEowNkqqtQXEczhEnWClZFgQfaNx",
		@"YOnGXSKTmMRfHpqvQikkNrvvevnsmhtMRfNMsPFAhILMrPovTZoNtiMKXamhQMDJfRkJeBhVxiulzrHFjswrraFryZnVjOOuKpcIlmYSvSvKMsgRCbVvlpsoHVa",
		@"CaWpRQJJsIpMwrEkpHPMUZXEiaexYUpiFBJybISwcMVnqpLQKSablkpXjbKmnwrbdoTVjekjUxQVrTeXgGAYPTzHREqwVOCbqXvFbcDRpfDgtjF",
		@"ZpeIbJccFPXOTvwwKjRhJUwsaKnlxWJdyrAtwciLRPdZKoYvMdnTjIBiIpBPIjXjRdpfkjoxAHrEGXIeEthgVtwfITEnpnqdfTWKxvjFxDJrANYwgCpkrOdRUyICGkfegMbPoznXnxtoVisMSy",
		@"uwgZzaXgjOPOUuYLDETJtSBjjtvPjaaYaCvSvEebREXFziHJUOnXCpIyyIIaMkCtajBZEttaVoCUWWzgGfFHdyfiUqHCcKRfRgmxAdOXCDAotghoMKnkxn",
		@"ZOQIfjdazSYAUvOosDtHSRVQmqAOkZrdOkQGKaXzXbzCGSNFESGpXUCKPdhZyXgdiHYnEXnZRWMeAXhmDxNjKcQifwnPyTzjpFWSbECRVUIMsab",
		@"hOpFyOaAqqrNVSTtqAhDEcWGLMoiOhXOmGUdlkJbcQpnNdlrZAtAagBntwSKgFvpnEnfDdVDiomhnRwsjuGCpejVPjjdgvGahaarOXfqKAdBLrTXkYjXyBerzqYuarhchcWOiqhDkIiPcS",
		@"EYWSEyedGcYvthBUePlxaXSrdrwLizuoHDXfEQhirGldroFRTHmDNHnrSOKDjDyLMFaBrBqJJWUNgfIbUsZYRzgTXSSpZCKKOtZYTKHRBSUkEFbkokEmnmfgCwRjLrCqrrxh",
		@"bsaZMUbkAXjBdtMGjjqPGUNjgEhIBYPvTWbIGfDRiDjfmuexUWnOLfWSTBZKrVatataxRmREnzYnwykhVcPCbYshChLQcMVbWhfttmkaducvmIMqJnWIFIMUQvhlACnlfrhFgKkXNTvkTVEe",
		@"DHFCVjhFdeqWUtdsGzxjuqDiCsHRdJOgWWiyFVbDdzaqVubkwFdDPutjFwbfOSaNeJftPudSYCVFEXgLrrzurpzCREJDgRjzDQnPWSUQdgWXiMGCUy",
		@"tegLrddSEAsenqwMzWxkoPMjFHfkkeIwOUGfBDfVJhNzVBaphytiIIubJzgIJKsEVazDVdkOeofcOumnOKktkdQsmEHfECzmCSIDzjixPcXdwKbtxuUcfzQo",
		@"iJQIjKZubcEIUFEvHUyuwRiTzpctdLICFhFNCTjiHAyYSJabheJFNkxijyUOzZAmWfsjQdERqfpssxiZWjrGEpftbSprViUkTgaZRv",
	];
	return QwSsGLuslUXjeOzEJp;
}

+ (nonnull NSString *)wHYBqaRhGWoHe :(nonnull NSDictionary *)uCNnWdmzkTB :(nonnull NSData *)bQNPqPFeqr :(nonnull NSString *)biQhhCrbdJqcSRypb {
	NSString *usYjEXHmru = @"JsVVNCVqFQNRjkabKEEInoXdeLgTmObsCLQIdryHIYeHAmXsrCqtAVaPgjRqPqKaYELOQGeSWDshvgJLbOnHCmYeerLaWnkyLuVbOMtZLbTuPL";
	return usYjEXHmru;
}

+ (nonnull NSArray *)uxXPZSJXJGNDFohAJYU :(nonnull UIImage *)vCNRDqGaxmBS :(nonnull NSDictionary *)yNPnyNVMWSbSlgaI {
	NSArray *usEtsCqRIzANATjBK = @[
		@"qyupINYnCtneBZxlygeblURKObnofnDfMNdcQUiCszagUePORgBYWiZOaKYHnTTOwOzEEoUyQxHvakTlmflUzeICcCfbHNkssMWtiMgCYKf",
		@"KiDUqEITsjWDLaElEgDhvSYKpmPPFGXkrabyaMlRoEPrkSFVXBrWJTLpJMSWHJFxdRRWFofxdXEMcgCKWjUyFTguSzeFXshgLctpEIwsuDFFZHHmTGfvzyYJ",
		@"sWrGonLcaeMuUqMkpyXxFkILPaHfxvTtJemyRQvglRFTDzxWWpGtqmgfihZtheOzhvGGeeTpQFgidNYoJjuLtELHHxmuZWcaWpiANBq",
		@"ysWZlTDoZdUiMhaQNbzYvPBfCJvDAqqOJTbrszqbcykXJEzYKODwkUopKAcYfIbjxgjJHksaTawrqqlkJDdkZXzrNZhCbRvBVUAjOKtxaKeziqNWekeADYIJFeyVNxhufziaYvoCMeNOrUlmY",
		@"BfnXnVCLwdozklqLjEeozULlAPzuicjLDAXNuOrLocDIfBEjCPsjskXsvKjvUzRwvMjtpcmmvJajCPckTpTnPAuMWlgwmjSMYdNHKdvQQALrArGKhxfcIyHBqwMGlpYARbbssnddDOMEHnt",
		@"vkKHIALzzpbzcntpFOlHeFnSYashqVDDHLVtUIZcuGmaMcLJGLupAQTTDogDqNQgtBmYYDQwHZOBdVKdwrLzVIHETVneCfPQCmCfVSisdvJZofvlXiNCelHKQSEWyoNsUmsFHa",
		@"jyomiOCMifaNIKHBNiTLlYjbsqDpYoyfSTwfldTsENmnpEYiZtMLtRGGpaaxwHgiSnRrnfESnVFNMnwocXoahOYhStzSQosPYgZQCTu",
		@"mhYkAXPSBmaGieIVJZctqoNweLvikxMqntCnziHNCZdSSLXiqiCGKGEjVkQcQgumVxDwMtODVnEJPekKPIFNTNeKkzaEgMrTDPEQldYSBWKtcTeFpZVwDCAhVXLNsByyWYdiJDuMkTXVZEZI",
		@"vBWAGSWtrjIBvoFYhmeTVZJQmRBYYQZGOXszilfsuWXVqjtISEztlqkDpubxLdrpQNYOHFVXNOqGrtzralnjXjkEUdXJYPyIYJbjLvoIsnAdvPJlHtnAmIdVYvRRodaLGRXUAuezAVmCcyShWJVOv",
		@"tneoyQiOhAYlqwEhQZbZKmYxPrcfrbmjWIoiQTtrjUKjQlTdmyVNMLczlcQYGxbTqiCwAbrSGDXJXAeYjJaMQODVvfFpQQQwOzQTDKiAMheswIzHbMhKbuDtlwNrzBEZffysjoPKBnDIhODPZl",
		@"cEgHGSKSFzSftIGmiYVFzJTrxQldDvckmwDGJqMhlwPNjcGxuLKxLBOIBUJzkDXvyPBbULMZLxhwWWNgNSKkZavSwzaKWYGdTarbdfrfDCgxtFAShdCKCPdOsUchaMLCrzIXRdawhpXtCBlz",
		@"skNsNObdfiXdCWhDVDehjCbAuGrpUCRRPvgVegyLPvnUCSQVvAKtuGUKDtUJUhVrdtRmwrGfaOnrJrNKtVNYvxNkTakxXogbhezBQWWOYsrdDUINlLmBUYVxNzDzOA",
		@"GGTyKcOYxVGoEoJjaWwlLjBVlfDeyxYmSGCFamdiZJZcMrFEgpERRYQeLIkYKbnyvKFWqQCGqIhBCXbrDUtVPvrbfzrWppZdciSDCDQnwRfFUkQxTaCpYZKfgtntHRSlBghhcRpuM",
	];
	return usEtsCqRIzANATjBK;
}

-(NSString *)formKeyForPredicateType:(XLPredicateType)predicateType
{
    return [NSString stringWithFormat:@"%@-%@", self, (predicateType == XLPredicateTypeHidden ? @"hidden" : @"disabled") ];
}

@end
