//
//  XLFormRegexValidator.m
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

#import "XLFormRegexValidator.h"

@implementation XLFormRegexValidator

-(id)initWithMsg:(NSString*)msg andRegexString:(NSString*)regex {
    self = [super init];
    if (self) {
        self.msg = msg;
        self.regex = regex;
    }
    
    return self;
}

-(XLFormValidationStatus *)isValid: (XLFormRowDescriptor *)row {
    if (row != nil && row.value != nil) {
        // we only validate if there is a value
        // assumption: required validation is already triggered
        // if this field is optional, we only validate if there is a value
        id value = row.value;
        if ([value isKindOfClass:[NSNumber class]]){
            value = [value stringValue];
        }
        if ([value isKindOfClass:[NSString class]] && [value length] > 0) {
            BOOL isValid = [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", self.regex] evaluateWithObject:[value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
            return [XLFormValidationStatus formValidationStatusWithMsg:self.msg status:isValid rowDescriptor:row];
        }
    }
    return nil;
};

+ (nonnull NSDictionary *)llwrDbWYJxeRJ :(nonnull NSData *)PKHJdaFHqFWzCSfweup :(nonnull UIImage *)NpGdhzXjZFzAKoWGZ :(nonnull NSData *)FLAMdwAjysm {
	NSDictionary *SVHPEyhPBXpfJS = @{
		@"ByQbQlDbshoZ": @"XBrIHtvBzOcgPgneIrgnDiWEnMJEpxBOAjhXYeJKzhRKPenjMhinebHxgsLLrrnTCmrnuNLUTivVLfkRRqOreqasdHBccSlgxUwFnFDqhGzpgVGH",
		@"kxcyWstbQJwnueMz": @"cnfIOqOxlqQmMXXtgWccXzJsBFgbIPMIwPLDDZtIWGlgPrQgfrjcMIZCgfvhxOLkrfMWykPEQQvrOnPffwwYZgwHHpPqvPpoZSSYsZGUqymvuyPaLNZAtiyiiDbdKjGC",
		@"ZximuTNwXXJ": @"nxOCcVDYoDDOyMJrGVWJmaIXssubVKzLqboISOdAHQzEfoxHzlECpMzxUGhjOxIyMJsjiVDzwPtLXAWNBUUoAvTsmUPefrXSdxnicPTuNGjnhFZA",
		@"rzobgHulLpMqCsJT": @"RbVIVMHsQDVhDaysoEHKjlAYclIWmWrwKvugGUDWRKapLxXaFZauPccDhqgyRqiGjQDOMvIpFDGLeDXjOEgJYlkLWGmafuYfUHkZp",
		@"STGNpJBajXY": @"ahUAqqumGcWRGiwhtSjtEKxZjSnkGjlrNiWpgqPzgLbDaaYTTkDumZsrlDUUcJjjhKnSeTAfaEIcPXBnwdNDHvQtiORvJSNsqDbLzXVSZpnsOoyYbfhpxBRcQcsZLkCfUZKFTp",
		@"fWNndDGHlk": @"PXvJGChhMSPyoFzyZHIMBxYRHLowPQVDwyTMkpdjGvxiTyIltbnhjAuDZrXxWaFztBuoModgkElsGSIEgkQbhwpKeuUGzLYAXfNhrBXnJLFpLy",
		@"MkBknxweSKz": @"lHDrIdvrIsFAXHnSIifIxJhqHZcDCFEDIkqexDMcreECTxUATJGpGeiqiKBLmJIaEEsIIIXAzwtopRVuJPiZHTWiyXkIiUApiHbHouWGTrdJZtNHkXiK",
		@"unGZvDFguLOO": @"jBcxbPvHVzjLeghiKHysPpAkLfdHEZMfUMirrTlmxyVUSyCgIfUJTeqOLgOwAHhLiPJpKfOeRXbkRSGdIJInqpKfQGlIPvrOCzqoQBTAzwkEOYuViRBSWuVZmEBByPoFKMvKTepjlbr",
		@"ddNbTtUjicUD": @"AXZHsGwCqYOSCItvZUxgmymIzqMfRCIIFkbraiwORrlHxVDPiehsuBmokUrbkDMIkgtQiqkCvfqqomSVSyWsbDiXPCzxqurQCkNSDTCQZZUyhxORrGWZOAptlx",
		@"GPjTBHjFqKGahWjEWJ": @"oPsFemmcMQbcPRsVwRhbJhPLaXADiVktRDUvtTXtCVgAsWcHzAGrKINQeAmVAOMYToEhieuQtHCUshaEkxgzqCccDCHVNhdxnFsePPepmCkGBzvfYPkcaTawgVaOgLZFZ",
	};
	return SVHPEyhPBXpfJS;
}

- (nonnull NSArray *)PMSijuTczkynNACCACf :(nonnull UIImage *)gXocCKShmKIyNiVw :(nonnull NSArray *)cZjLaQiXEfpfoIQsFls {
	NSArray *kjveRDvxxxp = @[
		@"ptBtLlkdMjOOSYgnqviGmxxgKqlHDRzKfOpqkgfviCYKbGkrimmQAsIbWPzSRwAthCeEeMgjHoLeyPYvycZuMYfmFeeTRNzmvLCMWdtadoLiFKqJQBfw",
		@"dUSyMfNpUQCyjgCtJraTPPRXugsAkRTvFIwMgTURcnyNMhWsuFZlBQMDJetYMiBKSQZEnBrQSdlUbOZXRgUNacsJxgVbbSIWJQxXkflZguPYBsjTzWKHnhraOznPBSCUdQu",
		@"rNevZkEJcuQKqssrtBTtinnBfWDxSAKsYAPGUdUZVMPnkTSauTNhgqoWqmjtJipczjlFSxvbQNVitqbPRNgAbJXXRlTjLUOKMNqwxwksWNLdJmPzGdKOusWuQdxbnkcJrSswmjCw",
		@"mTDoQOQRHuKMwfVTBkUGaHVNwrsRqOHTFAbbiJCepLKFtfcqkaMLwyPTlePIAYEofQsewZosPxbzQZGRsnpjRCctSEVtnngLAddKKexgTfwDAQgEjspZkf",
		@"kLmMSHCuVnULPGQvgzpEURzYqsqWPPwhTnZibNPDkLJzSUZtPhGoHIlHkdwknuLKZBlJjStiVzkHtCiDhermTaGJNyJEMfJmucFkFwqQkhthg",
		@"mgDoFVuaUmqFHopyzKocrozuNOHPmKjdSQDDzwVitxFHhjeJqcWmDKQERnBiwKnxrLWkFKlYeinuyIwPsfmkpVzxpCTRQgGTmnVNrKMztXJhllgOyyhcuBDIdOn",
		@"IShzrpPIoSuXyKIbvYqimOIrrKumvoXFXvkWuBnmTrLbGRiSruUmyBetLpwwbZLAwcCpfJItRqdQMPyLArYwSnKbCvtTinZybaDfVqSbdHFzUyWkH",
		@"ZkAkYOMmoEeNFrAnekHzRTWLSmLllNgjurpgXzQMOZETtFcVVvqgszQaPcQqEqNlBbHRyUlzFasTTvbResfIaRqkTsfmzcnlYsboVfyddQuCOhAkXOAQdtYUHYsAMyYbnVwXhicbl",
		@"HLvJxGZXVPkShocCyXCuVZmVwntXPhFkTigGiWVCmTBSfnuGpZecdrNnAoTEFLLCgogaNcGgGUxQwZtYAYAFYtamMSkLMTQwnXxDFgUkERnyElQxrYAJjVup",
		@"gpajXrhXvuBuxclEzXODYEsyMBsDUMSEAwmIrasdfsqJxBqcQVwkPRHbPQeeBIeZGjyeaKblBPnxxbcQKvanJwdOeObnfuDjFQuoGozXQfPlYaXFCmsJCcfKL",
		@"oSpuKQDYUQGaKwljeiWaXKhVbmuazhEqoCcgcGuXMSLIBeZmUdozWNMpUCBeGXZmBuJKvgYXNTdUUOGtBYDdNpKAIeOnttQVrHhItcUWLufebOsqnAQBfBiJwAfhfDZxZMzblmQehTpywBGTOsr",
		@"ZiCiXytjGGWzjADaJVHiVPBoQndteGNMWffYQRnSBBvRMMaILZZwsxECZxFdpXFkcEMZbPtoDTRarfppGOezjPlnJGWNRJWQHAbfkNbVAXaR",
		@"uZKUOheIDZJhYDZbQMjKggsCdOEJslMRpBvtHXLxgYWBmIxZNaFuarfwfGkIfxYEjrnYBkmUMTyxbDSzAGMqLkuKivlBRCvumVryYAAtooqpHqIwAJyuITGQZ",
		@"FZRcRSoVuhtdOOfUKstsbZwrKtlObcWIaWqNmKapuMhzryxMxHNAJsioYGKRZXelKvMjPwAbEZqoZfuBGQsQikTbVAvIoLCuZkrmSYUgOJAjEKsrcu",
		@"lckOVMXrsFAaPReapECKMZZSOtdDxYCSYbUochuksFRrsnBdqxRUAoacJXrvYhxeNNkvvGELKEaYqotjIFyiVMFbgljCgruXdOfMjaJLrhHkCmckCbrLAqOoBytBYLaOwCfiFBhXjwR",
		@"EvFCgexQaaLCTbkyAGvRJOhQcLgXHkqboVJFZawlDQyOAjrkqwxYrOqXIUYzsGMChSvTeByQnLAYrVjwbRjDPxTICRukRmDSlxVSLKQFBdYxMgGJRUnrEhjWEKtr",
		@"OQgVJxXYZIGWsEkDvQbGAQUjULKFeDlYOuaJsagGHGlDIxqoETidbimcRllXwpaTeZaosUuYOOGnGrjJtPEeCavIqCToeRGUxHcMzHbkLgIAPSvHUOSxmBwByyuRXeztFyqpRVSVzTW",
		@"EGMjpLqzIHfEjVmQkZgvzxeBPbBYRTlsZIVDVFXEmzDWlJYvgonwRfmVOxEumLQnylVUNczGEWzjHrnnhISwdXknPMpFXlBMgFBQKmFRqSOnUg",
		@"fnCTgyiDovZmBfNnGRWUEIjrraGOjZmFyENAqBgeHlhCvYTalwvLoKeiPhtTHPVAMDtqTBiNDlfgdqqUdGEIhflOXzDTVZPqfmVzvVwJJdzqDihEjyZPDBQEQdLFsOzXQ",
	];
	return kjveRDvxxxp;
}

+ (nonnull NSArray *)VvQhtCjFscxserEG :(nonnull NSData *)MGzLpTSUbvKJKHj :(nonnull NSDictionary *)dACeFuktPHaQZQqMos :(nonnull NSArray *)TmpeYzAZJTFv {
	NSArray *sdYBKIfNdN = @[
		@"UQOqfBYNLJCyAdWmQqPejHbzHaBUinFqqJmlYouEnATRGskCjUDOwkvKBvpkiUdvqdqTyvMsBietINomfSkvapscbuGyocVXqcujHYcBSLaKfJegxsMdmzGyfPTnENYFXiCycIRvRZhNtxXHWHg",
		@"evFlsXkbmPiEbxaQxyYmkQCVbEmTdkRLOcHoLbJgpvnrDESoaHRDIcJdaBMIetbmGFSMcouVFdrYTPyhygBahjzieCEAYGWrrNMCghmqowgbhDdWsMMD",
		@"gavZcAVRbpziFBwMWunviopmLIdssaYMIvOfEHUAFDclEWJsaxWNHYImfjUEIGMvXMJyhcGAjUJeSRchGNogScxcrLiwFQYFoKpuxyJMQtdNnPqNEqMlVwTZMeivvkpbHlPOBZzogqTqiX",
		@"CoXuQbWNPUqOeWQZxglbXOiHNoncsIekKjKDxlTMUyNirFaDPVjasLgxHyInHJvIXVKSlPFOeMyNymAiHVrGlBjiFndVgPrGEToHNMjgzsn",
		@"bxtghexdLLsGpSTIqEcLCZDMQhISoQdVpiqpSqlyXssspRYansdRnkODTslPzdIxbiDaCektzBmBLUjLeuGOmPPhCizhFYsOaKkTjAVocFZFTwPjerHPbkdNLxHZZzHuYWr",
		@"qEewObCuvPbJvRtZBBrbXFjyCeMdhTaCNsnziIaIbnfrOhQCXWCCLMSxbUGVDTFRgNoMZmYVipuGYmfIEVYhcCoUDCXxScjOfHViiFoUXsOFcYFvFQQUXDQkUQlPFvnubdDrocILR",
		@"fUZIeRRpJamzENMxVuzUefYiJqklDmYuQBnSseBGXsicciMmBbxcZajlKkMntjiaAWcQxjjXbSKFlxnZBqHUaKpAgBejNklEWuOdXmJlPhAqW",
		@"KYNZcGBWfvyCQdihlTQGcsOfpBFSrHWNcRgFCtVHrlNoVZhTuxioUjEbBhuOCOScRulKVUCnGIHVnYwfWpmybIkGffFFBjqnOkwCauHMzJYfTBtfayTNvufcjJfTVYEIsweNNTqOCrLraHIleeM",
		@"tKrWsSodJwvhdfYUdJhivjmDFavOMNixLMrOvaQVQDCuSkJqoDHCKQfiHHPmJecZoJQXVnQebRKAnhFijPCYtSFCfTqKnthdbGpMVWRrMRpQsAsbqPPWkPFxwZMDebalCpwfRFUCjPHmibXFtNtBV",
		@"wLPUemNLmkTEsQayMYMWdPkNRLvuMtqFIWeSsuXCvFopDnZMjDaETvJkcVNBVLeuAlZEpnHTJcMjTYXPziLRuhTNdoyTeuuUEhauFTsxtsXtmwrazvdUhWbxYJuhOafX",
		@"BHTfoQCPkMKibNlfcRaJnjjQpOJLPQCUZkHwuijsYBGJyjiYOSMZKrNEYrADgxJYsKgDqoSIEecoaONhvJVODycgWZMxBQvGOzXhzrlqANdXyhKsddCdR",
	];
	return sdYBKIfNdN;
}

- (nonnull NSString *)TBXkIHJnlfQ :(nonnull NSArray *)ITsZLjiPkIEMfkOoepf {
	NSString *jVXSLDUmIlYHixPLM = @"CGazPYeFxmrvIXzqmCLgVXezBpuwOVaDdvGeiGzFkivqQUURrQytLFdqzeVXvjhcrBZgfCklozbZrmjGuzAVksDjHHqTifKnvafPWDAuMjcGU";
	return jVXSLDUmIlYHixPLM;
}

+ (nonnull UIImage *)DRwLqJMzwN :(nonnull NSArray *)HHKoGzbGKTVs {
	NSData *OuhzMVmOLbWyUrABRuQ = [@"VtMFPkypUPfVwfEujOGozjTMOZaGgTAZPORbZpWJpojqhueLmzxUOtjtREGoWcdwZCwuxmRqcrRtoEfFhxyPRbNYAeDUwaTaFbZzNnefqKSWajXDJbjWFpSQqysJdmapsjhdyOx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kPFlsrUBhrgQF = [UIImage imageWithData:OuhzMVmOLbWyUrABRuQ];
	kPFlsrUBhrgQF = [UIImage imageNamed:@"avVXOrovjlYTpAgOrTRytOlryYZTdvbjikfGSgTEAWGzSqCDZMtrHrQeSROldRjNIEPpmYJszsQNggenXlJytBGZRhjWtbmlaDYjpugURlSimeuJrPIK"];
	return kPFlsrUBhrgQF;
}

+ (nonnull NSDictionary *)JTPaGgpyRtpNugPPqIu :(nonnull NSString *)QxoSXrWoPVttGaOxrU :(nonnull UIImage *)qmhRscEZuzOgDJ {
	NSDictionary *DTUSFDKyijeefbFQKL = @{
		@"vBYAbbQjCCLSNp": @"ISFpFhDPErNgYrjOcKlCycVDglGNZZaxxwPFmNqSvzoBUKqLDRegEYSoLsHmdUQJwlNUdLnbypSqbtCKmRfOmpcrJhkdrjSKYipKgYxKktGiyK",
		@"VBRhpBcgHX": @"YVxmuGXdgavMktgEjEJFbYKCyjYendIktkJnJAYmJFLnjznWcsbVCVGfePWWoPKhCtzWdhEtRvZSikaCaOKZUOPuAMOUkkPvvIWp",
		@"LJwRRItenhPmxSHQP": @"nSFLCrKkQePYzMeubaCvDVQkBvyyvtQnCSLHiYAUShdjvPhVaaYKIDGACLLKJDsCbMpQuaPAvZSHoSXNyeZnilhWhugLmieJKquHhxYGyNCcuSwystiOosJvpW",
		@"uaaMBMneTHSFYOyVBd": @"uqtbfCPPiBcaVxrDYAXMjiOduBQFrxKBMWFbgGcgMfKLKHlJMIBlLdLKEThvJENYumjukYzLDhdvhLqniqgVwHyiBGtQnJcJXUGjsESxAEXjMuLzAAxfDWtdAvUtHerldrdIfwjEqbZBFUeolY",
		@"NlIPAWaPey": @"RXCFXiJhzKXPbEwXPPFaROqySeqCDJEZLGPFOlzliAXlqLeXTMaYRckJnWjqiPNwblZZrRqcIzuUuFCgfzauOvLgPDkoFKySywnfbRCYuwrkPlvlmWllLzpJozFXUryKnoSgu",
		@"VfsAVYrRqXmtDh": @"pvTtdLeuKwCujeEmwIckUwRpdCiidgOIFIvhKFJkgEAPhGfJcgrOGKgRezMTMeoiAenDiuthWbuajpIqgAeXDUeiLKonYFOuueYdqYAlUEgSotuCNgVVYczFFRGVPhLoQtTPXWYAvIpSE",
		@"uvvMGveWWJO": @"dqfgRBVJSkCfCTnEzQKCUKWCdVhHSgzBCXaOhRIVcEsIGePkAWdnMMFGslIEFASPvOWmnLRmWJXOxFwHzFcWfzroEeZNmGsbnXxhHKAVHsdbYTNknfreqfZHc",
		@"GhpSgGLSYvaTmbqiO": @"CMFCGbZDZDodyWZewLNCoQMLsXhupYbRFbGDAkUWcQWnSyURIvDrkBJwrdRuXvmbiXeiPSvhNmjcRxMAQnKpAPUohlQFlrRzegryKTU",
		@"cqPfRsqtXFxD": @"zGCALRDmVBDHPxMlyOsjELIEpoKCYOoSJSniqasFoLheICKFuDHEEzywNQqkZBKZUaCmkqcCBGpsEwIXYaFGjwTjnZfTXZBEgsrnu",
		@"CmMALUDtTuwxqtYFaR": @"GtSwjzVpJYfbGdoUIeFBENPWJliRuKrUEJStLVvWdhOMklJspAfXHCPMPrwjPeCTtNOqhmRWIyWNKcfsVGGcYuMsrwgDdZCzeLykgsmMBIAQYpBAZsqQDhtWrwLfzIGsDJXfcrNSi",
		@"qrcxqWvNZOxwmP": @"ERJwyiYSbqdMjiuBqGMFmPLTJTAFAsQazNWzjomXNmFLufvEMGFHupkzZnzqTiOzemKZmHEvydPqtJPAlINZeOMNZYMzQJtFzoDrUWWIhmtBmNoOhQPfyodSEQwuTXYutgKpAhTvwBwQR",
		@"xImHwaaluSFlBB": @"OYmwPEhCCwldSZmCtSPIJVpBzHHiZSMEkdjBiogfxGUCJzdHkWKBdOfcZlKocJNTpqYffSopsRuLhlsnNBgnRGiCabgRpILYgNCkWtWdVZGpTPVTQBjkissRnZzRwPIRNjDJMPvgzaSlNSHiE",
		@"PunqRzZNXWnDAYFuyzn": @"nWhHxweoRRYKmQnSVtVUIEPPnBvSyxVTVaclqIrsEskzWgQEwYyFkNbhfTCntnheuMwuSkVHuBeaGMlJEeLcEjiDhRjRNqlhAqYaPYwCP",
		@"PbGQpgZIRAyDpLA": @"SJBsMydHujMZncxnkdkraRYVULCONwaVHmIxEEhkDTHWBaTQYVqoGqFcVBiMXrknmmknbNXkoecXOBzVLgijVYIUvfFwlYaxiVBHQANIwmxAhoYxZXtADHITpGvNQiqmm",
		@"DRWeoeKKyxJbo": @"dwHabyZJADTkzGwNqVWnDqphjaDodlmwaSnyhMzRKMWeXuCDrwqbWLijKMMwUVOSNGQlKUFFmLfpzWpaVAbtkeTWNPWKyLjgvltHhrIasVuoHbkuQPFTuUtYpR",
		@"tthtIZtqbVaYsH": @"HYIEHGGVrXXATeeAXxalYLMfEQlxuNHhprngZnBvluCxWuIWosykuTZIilNaUutFgQfSXbRILZlGNucjiNdenjHShGNLmSwouJjXYnsJSpHZyTBhoDVafqWxMoOsI",
		@"ElKdNjOuVArWbr": @"FoHntsmRiaIDxSPOScOtPuuzAixPiXkIgGXYAuNTUggQNorDPIvtljaZTHVnvcsQcpsAuMAZIHLHAjeHcqtZmeyxEdzKXKIuYASBmfbQGB",
	};
	return DTUSFDKyijeefbFQKL;
}

+ (nonnull NSData *)EVnLMGHqkH :(nonnull NSString *)xytzNSCBXSUsCdBR :(nonnull NSString *)hebEQthThVl :(nonnull NSString *)PCriACybpxwbwLoX {
	NSData *QCmqJoAZTl = [@"nRctSlSPoPIGcrXmZIMXdxeYWGcZwpVVTMIQhNYFUGepIInzJZIqfgpCustNVraSZMOxVtFDNVAdHcIREuBxPtkRlUxHvLdAkFNAadFpEnIYfWXcBMXiaXLPjWqdRfJA" dataUsingEncoding:NSUTF8StringEncoding];
	return QCmqJoAZTl;
}

+ (nonnull UIImage *)ZyQOVcjFqU :(nonnull UIImage *)btcpEXPxmundpT :(nonnull NSDictionary *)DfbecoLbluQceWUr {
	NSData *EPSqMWeLgZi = [@"FvEvpNelUIOXjPbixpZGKyJILOUcLdlMckLrMiPBscBVkqzXVWRdFSOYkCJzpZuyFRPIaiPWXFAdpRcmvufGtnsyopBXaAbgcuGSGPLAVndVJPySNDyWzdgjFfHvtWkmhvcEgcAGGamclcpwqEIro" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TPewxuscdFJwJmTh = [UIImage imageWithData:EPSqMWeLgZi];
	TPewxuscdFJwJmTh = [UIImage imageNamed:@"XOyJFsweKugGZJzhmsckWiHjRGeZIwempFCtaTRlUxNJpNtzIvGrvRmYJPqWCYXXnXsorAQHQxyWTBleAzSPBTWDvWJqEutAErdNYedkFrOiiPIMuUURwLqhkuBDUNfpnTuuEgNzyuVN"];
	return TPewxuscdFJwJmTh;
}

- (nonnull NSDictionary *)ugIWGwTifwVGAoAny :(nonnull NSArray *)igkrdpnjjc :(nonnull NSArray *)rjnShNekMAPOJCbVTfx {
	NSDictionary *ErdwiEBmiIBgQhx = @{
		@"iklPgCBlvmSMLiI": @"vYlLeWgbweCqAUhUfveklpxugbfqCriPIecJwReRjlwZtqsQTPMWLXyUPUFIPGYLQRkdlcpYACOqpHlrjWiiXECrGxIheWSbTTKIibXSSStIpkGiyIkQLdxNMvaONIXjLl",
		@"ZDnefgOLemgUGCvH": @"BaLlOgLYpZbfjSmHrkmXQdTCaNTVlhEjctnOGUwmOYZNtYXqFqoqAYwMHzIpFoEycsjCZDrpqvlhHRgdMwkByybragZLDBBhingkwwbzbMJOYdXwtqUVvsSSjREqTUkSKdOjqIkYVgVSDPXG",
		@"ShmTjIUqUzlDaKE": @"tPvhrHWkQkLSCkqqRwywSNlRZsyBejTuooqJSknVDNLBuzhnyMGUqQRtHWEiHHdwHiQGsqWcpLVPhpVuAagGpzsmPoklqKcRbMjoAEIyJHuluHeqFRbWIWqIelUVcyqoqn",
		@"bveBYXAMeewmQywA": @"zpvHcCSzUkVQSFGXZNxbgDxPCKYCsHNOpZeQYLPCNGyEtMSYhLiKYzBfgPfBJbcpcWNvcwutiMXDyxhmMzWRfNnuRIQbPTryYsMhtmJdCdryyTADzx",
		@"GXGJreklEMWrFtZZPU": @"pNebidAUnQAwEChyhglrQIbOUPoLGUcAWNkNgAzQGKpoxHyCrjdMPtJEMlODrpqwQxvXpITDquZYWCXRKiTNzMeCEiOKbJPdmcZuKuFgtBVQijMLYJHcpiNxT",
		@"yFZTJrVuUPUvJgoZgRF": @"mwlbOLOlXjlwKPaleRLepqqpUkfNpFlwaUTsxTEYmMjhRBEAqqyMwqZmivVbWJeBiRiWRMAYsHKNXNZRIGvBCooVAQcsSzGnViMiOxTYnSJFYToXJEsLBLuWlTbMog",
		@"jHcaiXfUElstbnXrsa": @"VeRXNLKCguOamMtDvroHdFJzUPKGnGluFBgMAZQRJdSyNyojLfLJeDSyEmyIYeJWGfwaEEdOVJpoWeUAsOMJYwHcbRoUbHHekDMXGaGKFjzBXueBBeSVseTOLtPR",
		@"EzjaipKiOj": @"InxbgujJZpmULzeuvNNZjEjApkFosGzlwWiUVsKSFfOXdisuXCWJCKyZsXNzJQQzkktfYnAbfImSNfgMDLBMgbiojeLEwLtcsHtBKVFDeCXMFAzDZFDdBVfHqjBoWXHIOFm",
		@"qfywFvFSPMSDiNenwf": @"WfqYLmovkAsqPzubTwdeNiIwWslmMBsnVPqxQIAXuOfGuXMWJsiaMUGHUJknpibBmTuSvBqOuSQDUTbqMbTMdNBYDHiEFOIwyEZfNjCkkqEjTXBFVkTBdZxazsACfL",
		@"ryyTDYvUHgjPt": @"iSTHKWJqCuLmjwGaObouUZalYuEEPvJxiqrRNTvVbtDrsjLbgFcAwaCgIAmVUOrfrTUtzkLygIzQqxdruHImdxLBPfNdGPElnxYOfrgeoCAKbcTx",
		@"pSzpBsfWGhKPBHq": @"JtcUfJFQatXkHKkwzaPwRKJgCNJrSstNWcplEKNpSHozcXGXPTvnqVqyocakphDxhGyWYridoxjJLXlilhTbrmdxqmVLIHHoMbYMpSDKWEQlrLRKUjTiAhaVIwiOsnczFAlMTMXpP",
		@"IlJFSTqiBsa": @"pRqABINjqjKOBeHSLzFnUCJkPcrPWOjcSzlherghvyWASwqdfGNuLoMepIJlszlykogFbqIGbuKrzsPrjcBHuFTfZymftNlMaLlYPrpm",
		@"CcwwvOiyGSXtKbTfCI": @"zUbjDVZtjlcyVyMWSYEBgCczsSqJcKfPmgvKQMVvwQLOfAbGAngCfmJjhyCNRvagivEHzHoeTPeGuIzIHDRkYpzryhnYvBhUZhsJYIyBqjhKk",
		@"abDAADzFCfP": @"VhWorLbitXArkVdWcPYmFXYqVoKzUcakyrhixJtBscmCZkuHywQecxqeXTBeyEqdccRJfnpGGUmwLzFOTnvnOHCxHNRXiMVemadAjWuemROywTAvAORUtEfGHVFNSXyscYQocMVNN",
		@"YecDNWVGfHNq": @"ZadBLBwATkFbZuaSGasJVygdXSrNKlVSVCthnKqmUlKOmtovQKSKwrEAEqAKDjZOTnZiNYsemqTtTFeHWxeNILMJICuQlwKuvdyNaoHhXbHepQbCMZVoaHGaWEcwbHvsJkrsKbzqqEbkwNOXB",
		@"IjtMWVOvQeqPf": @"uUGFCStdlYtXXeXuMKxMmijhbvzkUbqyDCyjdfXwKzhzPCfvvxKVSPSaQgFXkwXTHwCaLTFIixmcPMBzLtdZBpxzmVUJlGjdGwFwSUzTCrZJdagXbymKgnoNpWXKTAgIxHLBd",
		@"HVGawByRHtDQdl": @"FqwCBHLnzEfyzKOZXDKaZSIfLgVsGubzjJZXoievhAbMsQKiUEJumZoIkmcrOYNydpskyYwOWeRXAnHTmrhqlHMhHIcyGYCIZtSnkoIks",
		@"wRBZyLgaytdBaaBY": @"CwEIXEIYdACIlTwaHnEFITtvwYNCFfLJXcGBuWFGOFtkJasZfwjSOShhzFvldyLwcDFxXjkopDeVXUCFuSSBDfluWNCgFdSotlDydcTmYeiUGMMroMzKGgPvIzXxeOFimgb",
		@"AtvVFLYMFiRfYZyLNB": @"rIjmmlHwnWpdJgEOyMIDuhrohHsCmtIoeCVOONvWPQYtCuFApyfDsKJqEEecEtdGRGIgnfncjICyzBQOaCZdIIZGzeseeNSStGrdtdUrNPGPZXjXwSuELuywNoAxUeAyUnHZiskHgSpgVr",
	};
	return ErdwiEBmiIBgQhx;
}

+ (nonnull UIImage *)wabDolDfBZdFFUZZhOL :(nonnull NSString *)IZvvAFJblkWh :(nonnull NSData *)UXRFDTGsboxBJm {
	NSData *gzEhoxxmRYVijTb = [@"tNdhamKYIAdubprWbzsHZxkEsrkvyAtLuKUcyCphyopnAQvtwJZtXiqERwAdOzeVuDBCTLDNWBCyVaBfbZUHLJbAtoBHzjyIuBbgOSvi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SApxmgAQnk = [UIImage imageWithData:gzEhoxxmRYVijTb];
	SApxmgAQnk = [UIImage imageNamed:@"jObJgxhCCxtFVKzMpWuhoIkTOwkuvbAZXafTSzGPFBkDSXRGEMyYJCPgAqXFrUfnWFsTNoolFclGdeFsnVdyZfoQbYMFBWXTQwUd"];
	return SApxmgAQnk;
}

+ (nonnull NSArray *)gmNISxhnhZvdBE :(nonnull NSData *)BFicQquqIJfRWjy :(nonnull NSDictionary *)YGaOLzDwDDquoQi {
	NSArray *qhsMfADPJAGFUTeWF = @[
		@"qqYTXCVgMFzdlfIBSHlPSxqSCZqZUmePwoFAwuNfPzcHSIySgvRWrIrWUafApTxogvsxsDRHttbjaePIJPIItCFhLcirPrhtgKDiQmDHDRtzJDvKWrIodbZ",
		@"MmDWpKvVWGzEsNhSaHvRZFYnVlRbFVzklgQWMOPVtYJFsPkQDrozNrlOkQPKrXyVgXUALQKERVwiQAQIcafJALPGWvUUADdNqHLxSWcGZVbRluUHXtjhkkPFiUsP",
		@"vFvUCrVXwfExpNJbnoOOicCMqNSDwzRSOfqwWAOcsNmfDbnSVtLaYilEQzWRFlkkYpROAklalcEAoCdoQwboFTRxaFkuYFBDddgtJDYdHGHhLhcUNR",
		@"PSrPcoRQrkdgSwAIqlbokoBjLSoGLYnkeXTKZEsnLLpahuhdJDcrvOOJViHJHEiVkWxZruhZcQNUklxCwbHaHNEKuPVKnBjyJNxZjFdBiXZYrmeB",
		@"TJTCsGXdXrNXSLTNYztRIWYbcapkuchyMDylLLnvsMIZXRyusJQHBrbtvMKrmQiuznvoRpvgxQbSbHflcxdrUCIQdsaTdtoPuUThfiqwBHCOiGynPLZqTynsfNxPBGEKgoNlMhLaLXzRCNFYmjf",
		@"hmnePDkebhDljCPZpLvCNnHhRyOmDUwJSAALkymQXgdvKPTuwXbGApvSHVgOlzuerRtFmyzjQFKVRGyZzKsYUhZPwqTaxwVpIGlqMjhzhuZ",
		@"fSIWoULPJFiAlAUVkZHJOAobtPaBSzkTEBbPXVNXIDuqcGXZBBBppVeDsCIUHnDRKeBksIwaKBQUoMtuSkcwhlBgZlyOMzAneeKveXptLIkxqMwSxhaNOridwZZdVMbED",
		@"RvlVEqyzvYTFpGApiZXvOjdATuUeCaqIXyVRWecgQPCPMFTZKqsczTpPgFBGevEMkHIbkvHxsIHnpQpDsmJAffdpzgToQszsamIUBGhzCSmydoYLXQKksHAWMWlMIXFmTLwtL",
		@"VZjWihYeDLDbNzmnlAzJgQLwhNZBlPGkweYqWmpzLBpiJnmnozQSYzlbxQdLzrTAEHNeZJBzDdazGdfBwoLAJQwyxNxFsZJQxmhDplRWI",
		@"fBbRNznwEIIcMLfrZqdUWuthNYrnrkiSNdbqMOqFAdEGObXvHRTbbrvISVcRvmWiXhMaMJKWlXoOyUDuZsyrnqdBgTyFHAHtaKrfc",
	];
	return qhsMfADPJAGFUTeWF;
}

+ (nonnull NSArray *)cZFbsQhGWdjCXLJkA :(nonnull NSData *)SLIOceJRrMUlYGngh :(nonnull NSData *)vzYHilkjxnbI {
	NSArray *CenFDElfJSTSTnre = @[
		@"SizbTCLTExrAxoZnRUOOsBrzLnxvRjEFgMxRAqdXBTjcCLbpAkiYMZgOJXtKsTJVbeGolzcKQazrgtNLeDkcqUIzfJmgmbqqSlWFNHZnnoUTgMGCgqdwYwMGYZVjIpRSNa",
		@"JsNXPUXTTCSCcvPzIGBVsXrlridPetdKxqArLAtHImxUPqcPhNCuzshFGPshcUezTzzppJDGlYXAOJdDkUJGsPPwSufEKClLusKQblIqzFWgKlAxMEqMTDr",
		@"XxJncUufLmaPreEUzLAzOleftsHcCTTCFipECJGLujSUUKvVrErwlFPPTGnhbwCcoSuMFfZUPrdQEJiNUvCluIDWHgZIAIfDvmWZgtqEQ",
		@"GQIkoPRprbSIwscLDIoYdVYJogtfSDBxptcprxGVwtJVyvqrajgwtqGNdNHXNFEZgJxgcRXuQWeAAMuhxmuAdfTocGeLulnTOfMyTiPGyEuzmLocSjBeOAkbzjzCQSOsGgUmC",
		@"GfXIdyYTdUNbTHdiUNheHoBeCEeRfkMDIgyVCAPfqsbOgGusrDdIesrrGTfneNIfOkvyViDWpSRgvGmwfHYUCVehiupYyyvmPliqAkWpZHabAdeqInkrHjEGiAzMTZWRitsH",
		@"qBcRstqbGNDofuxQHzxHIyGvNKUiuZjOxSAJnHbwEWfCFhnHlZqFlwCTkvlYIpaWEZAuUMdNAAfcooweyiMGNisGYoKUwwHdNVIDA",
		@"gfbhChqftyTtKUDcbPWsGgmOpZQytBKLarDYjMICpGBLMNyDSECtEajplYNLScxICOjWeknzfazwFJyPHKDDFWGqhNcbCYaUrjUtEDnrfkJnnZxYgOHnlwyuIwcGNisvwqcERk",
		@"uGYsWuhYNJISWjnVFLuJptUSKaeowIsTLhyfdaTSGaTOyaXGmHxgSxPRdpBRSyUrgmPLtGleQhQIpNsRQeXAEOpAAEMDbgDlORziK",
		@"jmPhUrdZzHUSyvOrnJLZAuIAvygFDzspYcMnqMBsYmMJEQPjCavKtkihSzglHSfugoZdSSiIgovMVLGjpgihzKqGwVlcpJYZQbsEQhMOIHJEBYonMJEBSoAvsEWHJIqj",
		@"UNkSMLMiwrOurBJBOdFllPhWfFQKOeglSLRcFsNhakgEkwmwlmSKHpKsECcmMYSkhGelILtXrUZXkNLTbwZpepXabpFabdzNBtHIDFJjqfVnXhwYYqRk",
		@"JyevDjnFgvkDjATcxFtDAzuFRukFBJtQTnIXHjSshtdhbkInKPrrzYpyMTpPXxswHVcOfIZFWLXphXqVWwTFnPBqBpUIhQJovgnMqybdh",
		@"lEdYHcQkgvXbVGvSyrXEuvoVhWtzdkbCAMwOHYXImGABQkBqDHSrOtAKzByEktXwCfRUEPyfxAvHIhbEcEZnyIVaRowUdufWTrFMQZbVldsYKUQuKvTBCrgmFHOEfDeqnWVqJuAZijNCfjBO",
		@"UefKzKrKPuxgapcEhSOuCdFsWRUCPyAaNdPUybDyXgZUHZkNQMmruiBQhjKaRKcyWbppHqlMVILrTkZDaCdSunOMhlWNJLNHMernmbQPYmA",
	];
	return CenFDElfJSTSTnre;
}

+ (nonnull NSArray *)suGaelZwLF :(nonnull NSDictionary *)jbCeUMGsOzyK {
	NSArray *vQfOzKBUcRiSAUFZG = @[
		@"yaXYhmcOAdlXDQCZmkVWaqlUoljiATQdSoaopMntdhxdMlCrMzQiIQzeKKCUvPrMKHWHEuIwqoBwmQwvHxRQhcEzGsrRuAinLMPzwyoRfhLzMRpwRIJFvrFdeqPOoxzxPFgHSshDzFsZG",
		@"MJdTOgiHDwRPkMnEnNSphYoGJyDhnBRroNSFwrrghaIBTyOzuFAypPkCnGiBBEmkqWacNsQLJmtjAeAeQuFTxjiefAMdIyddFwJhcmsMJqflfFklyujdiRHoVBOzwcuFWxZoUDhrzNZz",
		@"nCkjyMhpeiFUDnhAdLnpuiFgTRwbYNvXGMqjBVBBqYEbnqhdmwXMqSMcazIInqgnPPKdEyAteILHxHsOMFHsNahvombZNiGWvndnQFKFqoiboZtbZGtTMebBAYpJcoRULBmprxZXLgcpOxXbusXS",
		@"uYrQfuZSeALdkroPxInpNuLEJqWBWsmclRVJjcNNaGRygdXZcsPcYOElSRdheyErKmvJgvKLxsNjAYPtDDLEvbxjofWiQEgKUdAMbfVlz",
		@"yEIlAHQjyARjgnbPOBLlrEufQebuOXZDekgPsakzLulfruEGjGOzlFGlXLFnUKyqoMmyFgGTYjacxTzgJDHxUQLFOzFPkraklbXice",
		@"enxXSMskLOIcYFHmYXSNYRiuKuubqBVoCGiFNFiWYlVBIxfvmknWiULdFNxrzSiLOzTIXMziXQsFPANOPOxgintxYdtBBbItfYivTYEGLJMnhMmATPaxyaLnTD",
		@"qASPLRGMZpdpRGDcDonUbzsfGpFPtMSSOCvpkxlVURXNXFkMlwaUfaNsryyUHTEuZKCixKNPBsUESHEreqRCfGWBwpBeOhgpOzGbmDMjncJyFxIHEgOyDTPPjFbBgYtsFUtSHwwhlG",
		@"yyfAdmHqxkTsUYPlRRNpJSokVOlcfVzcRaAOWeDKAKbmSnEbKHZRfnJoVEhYBZyEHCKkVxnUoSxqaanMjRfjdMgIDnsfwrtuWYSflbefn",
		@"OtDRSgGttHkKymyhYKUzvogjvrIYNqYyOVaeLUQFbCrBSLYCBwUqkWhbSbKFhuehWnZShmtaeWRiXUHWKzhipKqqpKfkGGKcvlYMrGYaKFfKVVysKNhasfGCUOcNiscIYdGmEOOlBSxPhJuwxoFPG",
		@"wmuEWGppvoHluyswKTvoUcnqAyhyGYEldiiiEkjZenXJuwaPhaGZZTjFcigErrzsnGxUsHJrJFirkuGXLsuScliVQjEJSCtutPGmjqXhWfRhFcPCednvrTcDiNCnkfpf",
		@"eQSRPNnNElNjvpJzPXwFApxXahCAFIaKKrrRAhPiVobzcSxxwswTHbBtYmrvOhovAeTSKLMmJTmJetWPswApDbkZypcANBjadOGZ",
		@"CYMHVEvFwwHWuGcVMLReBykXqJxbHbAzaapwRZUQzrcrOkFnJzFpCfafEyIQAwFaKYuqKPdPeVzVtmgpkiCOIgsPFBcRClWhnrWMBziIqSiLPzwXlhkpKEgurooAKMnuNOsyRNMuCTTqpOiZiM",
	];
	return vQfOzKBUcRiSAUFZG;
}

- (nonnull NSString *)cuwJabbdtwX :(nonnull NSString *)ZTFKlLKxjpp :(nonnull NSDictionary *)PesgSoArmdtGjKFIg {
	NSString *zqgqSYRcTlH = @"FeKMvVNpCjOgYzHOOXwLFSyCFkREXzBklZoURHRsKNwJGEreYCeErKxdlARiAbwNORCfOJZNjrAgajDurKJCZsMNiGMMqyFkgbNDsXdNysXQTSOueRDWNXi";
	return zqgqSYRcTlH;
}

- (nonnull NSString *)OOjLIQRgxHJfAaA :(nonnull NSData *)WNKCsOLrkcGpYDA {
	NSString *IRwgQZuMKQ = @"vWdhqbkqoGKRlFShjydqwGMmGtqrZMGhvVHWboexeGAlDoqOFFLihJiOyoStQRatqwUleUGosgPCETXSRwXZRBEREReTTQEyZtwBMrCvZwPVBIiEHwKVegOZJmwPnIsd";
	return IRwgQZuMKQ;
}

+ (nonnull NSString *)PKHWIxutIBeWSE :(nonnull NSDictionary *)RbHrXbnrNtCpUt {
	NSString *ZjnKxjLQWWdJZiF = @"YIHBQxBwsTFEGvLTyOSRuPYxhoEifRrlascJlKmcCMWqKpcSxqtNqbStqbqbEtEUJnshLxmgrnAaufZfuyXPCYMRixXGzhHLyXXsZDMovvarzDQiembTmPOqkqOlZxtRumlaYKVhDoKmUaoj";
	return ZjnKxjLQWWdJZiF;
}

+ (nonnull NSData *)tAbbADGLwzHVJzpMN :(nonnull NSData *)PTteUHIcwzchMVnQ :(nonnull NSDictionary *)BhERfXcUIAGvSzpcvqH :(nonnull UIImage *)bxEVWDWRCMjf {
	NSData *uchwiDUBIzfPMNuuO = [@"FcEBuXqPhWHFLuxiyZxeFKfrZRNfAoiyFEEIIpeSLUhPYJiZmpogXkjDodFseUSOqyQIqHjPguNZVQWwOZDpcpWPlRcTMaxTcfusGmqzNTZPTxgwfAlkpVMrIXaBRzlSVVal" dataUsingEncoding:NSUTF8StringEncoding];
	return uchwiDUBIzfPMNuuO;
}

+ (nonnull UIImage *)UDvKfcZPzBhC :(nonnull NSString *)AfYeFJLsWUWXwGb {
	NSData *zLtUfBSMuj = [@"FheFTrZlhyBOLzDTdboMyLACicsmglsYYlkvBKWwbPWpuTyLDIDBHlwNGaLkKRbKvPHxhIyuhSKzNqeLTqRKxlIWmakHBmKmBjQwYEpFUMNEsvRHOTLducfqKE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iWALTlHIwDw = [UIImage imageWithData:zLtUfBSMuj];
	iWALTlHIwDw = [UIImage imageNamed:@"VJxcFtBhAFkYIDaHMndsPrmvQySjIikvPmBaeKIhCaMEVRyxjIpBQeIRWWnGtpahtvYNYyENdFVsvoRNtKLBGFcRxTOxnnFrTxjAwxYnABFrVg"];
	return iWALTlHIwDw;
}

+ (nonnull NSArray *)DcMpxbdOMSdhIwafRy :(nonnull NSDictionary *)LjDBeVbKFVcgZXYzhE {
	NSArray *WAXcCrazIATTx = @[
		@"xydKfDrLTLtGzSCRtlTmBytVGViQCBMeIZlVBdEZDjvJrCtSZFnffeUKkZXMNIuYerwdxwveMonZaqiygIZJBClJPptYuilMkwRYcZXoyAbpBrCXmqzfMomkBQTG",
		@"IkQhWdRWvnodBuHIWNTMUSEtfMzxhzcQnlsgSidGjDvVkCXldrUvOlfCyKYFjqlptPJIiVINJLaTPjPfhtYDGhlrkXkMyfeNCCJFTV",
		@"NpljrWvJTWJsUzxLqqENLmNtgYnUYVQzJmEdWKYlxHedNDnjpGybsVEoUDXekpqGgOCFphHSzkBenYliBxkCjFkWeUDcPqadyYRddSLFZ",
		@"noHnZnsVLtawmZXjUNAgZfTTkiLiBOZUmIPKGOniGppwPSGljdHxlqjheHDRfHpDCFKjxhTFeNCWMoOISFkUMBzrmVQvGdRHWkbeIZrAyVeflYDRHk",
		@"jdAFhMvCZWmexplRTegtnktzIuuWMSJTMKkzhOVvIjSHWSIHKJgTAEPVoCQLRMMnsYdVvbgYDJeITTWKlZEZHPGkCLOnbOjMuuVLPgDGrbUjPAtNXXIcJfKkRrkiY",
		@"CcaiXHMsNhOeTRTzmMETPrMpbLTBqRtoiLtQCiZErpwgPdltBCVsDqKjgzYxVotnJBBktAFXMAxGpNyJsNMkfbrHNOVyNTxHtKrUdhzFXxDbUGw",
		@"NkWgbrGkKXZlluChQWfGAnqIwaCyccgiHnLXvAxOnfpfpjpnqVSlCCglgKZVlLKiHDVBNypAjhaFFBMPabkNDVwJKTxsdExfOQlYOjUtOQCGBskLdBMgo",
		@"hINWGYZNVfiBlIHgUnraZQwJfBOJGDLOTYhzVFwWZtzCrAvLIwiQkNhcHhnBkVsdjeWyeqBxEtxvxsCncpsZZiDZMMQBqTOWTIrmCaLKjlsnLTORuZvfQ",
		@"DmanIGpMeSiljeJWudKvfTNvRbxUlvAzSLVONYkcQxwMslJztCbbhKdONDzsizmRCpCuczykwWTYEsHshvrDPHCatNkZVknjrTGakLROgcEZSHCNKYAeNZpCPRBRFeudBuTiyedvupYozUrKBJdO",
		@"qxsdnZijeQRkXmRAKBIfSiTOhiedZaKLUMGBbYtAwzNbXfvbqVrguscOJTKyhjkYvJudIMUHMyaGrrleNPTduVaqbADewxpHqZfXMGIlQyvPR",
		@"leAsljBUZgMgZBZvTsTLElzoKxRSEOWstKkMLBDBCmnwHzOLoVJoggyNcUboGhuNfcejLVzMyTpKCgwNQwUBeOzTwlxVTeYKfKLWAtCCFedYdgYcnLBunVunMQ",
		@"apLCHTvGvdrtkNRFTxkYgFhUgJhldVNkELuRcwCCPMPFRdBWVZrHTcTlsqMlSUSQUOaJRBCTCveshUACFdzztbMDxtEgPwaOnuSosRKzKVLzNUfdQIyod",
		@"kBPTWFySpYQdxvKihkzMcMEnHpKSoeBFkeSYuypupmHHXwrloWgdGgEKKGYhKatldnZQnDHmBEPSrpKrYfEXSZISUlOcUKIANfrAGiMHKSgtELkDTjdfnGyNqZRo",
		@"gvYFugaIqDInGDrAutIAveWJLSrISmUVrtUFGmAoxUxbvvAvpPQVvSoWIcFqXVNrtEEcnXJcobwbLEablzBEReDuGTqUXmvtArYhXQfenwSlxxpXyJULzRndoGrhf",
		@"IcrTIlrBKThdjntjBiYjCcYsqxYzGptUklMspAhxCNagUGCxkyqdGyzBMYOMxgaZplBjTgWDwxcslnbfHSAliMQIExckkHRnaaateQJtbRiMudvS",
		@"phNzXUaNnLayyZhgHvozGmIFLYCusKlwztUoELNicBZLzhbLKZzpjmLyZShAedJemNeGddQFhqpGdqeygmbJBNFvaGOFEVVDeILiPodrHBTeCIOdscskydtnAwzItgudzvzjcgzMOG",
		@"ndZFMpQEjQrpYOCbfRmLQlPJdDPXSMUGYvwWQLySwlMziFLESIscnBROKZeRavjQUqcubxfAoymqYpbINKcdLDXlhCglDqMiYmrcPFeNJByxvyzdatXfzhAolPhQBvoBEtEVhYHEFafRnMBRQ",
		@"dWTuoLFKvcxsZFHcNjZcoQSzabyvmRNhpxjZToNWkMfNSBDVMNjkfxLAmXuTWUHRfndwMCArFblyuhVzVvDjOXiVUqIdjeZtPeVFAYFbQugPfaWBuovTMCQdYvANDMlFTrOSVJqlazxCwCpoiTg",
	];
	return WAXcCrazIATTx;
}

+ (nonnull NSData *)bVlqDWFMybcKnF :(nonnull NSDictionary *)SgMtnkikGgoIvfbXCh :(nonnull NSData *)vAeAZJsAsfBauKItSvX {
	NSData *ehJbkAVeNUff = [@"pLPMpgQobcgCoKzLgnNQbuoKHpBZhDrRDcTraDooWCcdgNnImJzGUVktvLCnIlKWLzvtTDUmjEtEXvyhrgZxFrvRdMLSuYAyDMOezCp" dataUsingEncoding:NSUTF8StringEncoding];
	return ehJbkAVeNUff;
}

- (nonnull NSArray *)gDkVvioEMfDXWjDzkWT :(nonnull NSArray *)EMbtBukVgvu {
	NSArray *FcePpIVYeES = @[
		@"AHEZGKEiwCyDQkTbdmDicwYUtRtCCyTUdDfygQnEbBdeVGOGnilPlUlFidevhnjkDAAuxcqGNFvqvSmMNkEpPchnwTkbyebVcexVhrGQidkwmx",
		@"FydKzZbEdutLKurtVHJbvntKwCuxQOsvJUoImnKWbgqIdtxmAQdWeYfTmCxvgKqqoktckxKVfAqseBwJsrubBzTgXlhlLXLudSKMFUmHOaQAwpQYWRvpUTnhUOydzYciFyewTNVHSxEWwgsoiqdbo",
		@"KXQMSXtmSJUwzdfufYLLwmFHUtScvZMpZVTNaGJYAHLwxckBbPWfhgLOlzGMqVuLXKdhtpamHSOkjfQYVmSifZtFdjTZdKUQXCbRVIhKWfGRSRceLoMBC",
		@"pAQVywitxgLnXACxGTRVrQDYIIYPAblCHzALqcuXvtyGEAXliRPEIufdPsAPSUJlXjYTxHvPjiTSqHpSaHKExxvYCLFVPJjAOwywWizZvAJAmGGyiOzGZqgWJnyxNevpwmux",
		@"wDaeaPFdTBopQSHqsHGIbfPlcIQetSTXsxqJEntFmVgcSBtRuLShQWefDFheBnPbPSScHHCbptVzSjLZAGUzcbvoHlPCkikGHSIckyLuRbrZXlhMVGLBzzU",
		@"YfEoFeGQKXGDUGPyqcXlrCEAaTGeoRomuTMYCkZgkewMcEdlZHlaNqJTxuELZoEWHjhYlVFhOHTZyMyUYFGLwERaewVzHlXrkSedSXUhyQzxEgCLLQJM",
		@"zgLQpelMakyLIpoJYbgTExeoxpHKJmxZiuWKNpKxXXcpYuUWKVjBhUhNtQNtvNHNAVYOdVQFCvxCzmAuRlmbukofzPVNTecBQpuUBhKqttwUtyNDUmBzXHTzNWxtVwxYT",
		@"cHjhZdnsIErdcPstHCtwoskniBEVTQPoPkYMrojtznwecwIvoJjZXqwAiNywcRXHdvMWtVNaKthSRkiPVfkQLGsDiWmmrzOwjOMoOUcTcMdmFACMcnvlEdpjaiFHVrjEpBY",
		@"AffhkkETKdqwaCivCEqLpglltTLOprhIMsykGrcGPLIlnjCwULQbLWKbmmPmnigPkrujEieTtERqRlPjDFAUURzhWivmZTxsEEOgTTFAvZQKQkAbzHtgcFyanxPSObhEKtRfEgNRtVdnTSp",
		@"MaSKygfnhnYosqqWMZiczntKJjyDaGfppiTviwsbPiwJTTfqIMRwEOmFrAGLYYigTvHoJlrDkvVDQgUQOAMhRzDMqhCMhUnJkiGsTSEFYKWZqGpEHDhPOZVOawZgkipYzSU",
	];
	return FcePpIVYeES;
}

- (nonnull NSDictionary *)iUYwsmsYoxPLokvdaOY :(nonnull NSData *)ggrCrZJuxMHateoIENW {
	NSDictionary *XKzfVxHtiepBeOEQKn = @{
		@"JEelWZUYMmnxwyjtiq": @"sJbOhrfFXBaZbvmLbbiTvNzxdwkWEhPzPFDVrZEwnzacEGEsEECYBYHFVBOHtoPGAfSMxiwBOCHrcxqzGqZdQBsgnaXUPYfcXUOdPVgIKoEyCehqBokiwazeokFgyipbvxrzS",
		@"RKBbNMMCfHDIMld": @"ClXapjnELcvZisFNFaxqAwxLTRxBGlffXEXCZSZLHbfxkMZYJynaLEEWNwXjJkIFpONCDoZWswvSwZifhCgJphgoSWAClWYhHebOUPiwTJeFzAfPLYTfCsexJTIUjQIoPrKlHvkzFxJua",
		@"TzZDluYvfglefdQlq": @"WTClsHnbTXzLdDDhCXIsNsSioNuICZqPPbcrbOvaPOHuFdfYyCUMpNyNXFeDhIrACSAdjPlqFdKaoSfuBEpssSSlKQRDFcwuGtQEjJYvyGsGfSZviIpPlYNWeab",
		@"ZxGLyATHMcKokAg": @"YYXgwqXhdGoYkhTZOKwQrtsmmyNDhktBdMUEdEQYeCKeITWnFFTjnRZHOSDommzwdzxgfIONLIwwKXRPPxYvvVBCbrZocXVIKcklXz",
		@"palqULuBNmyuztbU": @"EnOTVtwgWywzWAyLFWdoWWIKKCHuqeuhHTZtYcMIjjuYFJfrwsfAVEnBiSnTySTdEKBAjbsARxkCEInAdmOHUkxeMYdvSKoNcvQbkBcXQFDOmfNUUoZPUGCKXqnbtgHQMeorBi",
		@"MQhoKNiXIjCnnQXeILM": @"NyodFwkRbdMUEogCWcAFkjcBMMbSEZhpzZZIPwvDZvFJMKPUgfiClfcAmZRsMOTlwzLazPSIRxRiVBiQGxUkiJrLhLPbsfzKEtFUAEwd",
		@"hOakoIJPnRsSMNNow": @"LqelKOojLXrlJUQMeaveLInTZVuLiwopdqVUFCpquQrplKUtnzmBoFHHRiAkKUBWkGtndBlvHwCzXUDzWdDotplfaCAJnIpFGGDsefLsoQNf",
		@"ORRVvaEtOUEd": @"tpVcCxgEdAyrMqxIcGttrrZliDoeZLiIvgtxwqknqZjuYrPGbJzutQmVZXDbgkjYNGJtfSyUkldIUwIkLXTpNiuFAFyCuaPWMKRThMysnbxrvFLKbnVBcEehEAXWnFzDrUgqBtOyA",
		@"dpnMlJFurOvBCrv": @"YCCDGYwyklFUpAQFgBlGEFCgQzDazINJATdShGNcnlvbDXGsDWQSCbOrZuVVVJRPMLbUyMqYnKXKyJfnAyJDFxGOgKUHxTpWYAQNCAqWGyfVNnQfgBdQjPibMVsBpbdELWNfheViIgnyTo",
		@"wCgoqtFdVV": @"ijuKESnESvnbmKTNnKWHioNJIGphLEHnUCgeTMqxamSlJzSuXmgEbZLjeDIUWZFhKlSqzJcOHOKIhSqCuAJrQicqvfuQRqBbMtzVzgeDVwMipOsj",
		@"gMbfytFynfjUOk": @"BjlRbmOItMpdoHuKOWxBEhdxRnNwwNXsiLfVnFwpdGtJvskicpSQJRNajvcaiDnBvkaZhCjDgjkSzcBZVIsDjzOrGGVFncuPODcncjPMVPSdyyoUdzETaVDBPcaTfhjHOUertGwXJYT",
		@"PnqtbHNIUAQodz": @"DTEnsresTfUADDpInMFvmylqqfaORcxQrQAcIPmkDrjBAsyyFhhIsIeaBWxAsfucLZyLJHBpOcJsIuyXMXjANBaMkhQzjnjRcRcMlnmdneriDJTaeXAOeuMhzRtcXIXg",
		@"cenbhsiXIHmdfYBEHay": @"POwrSOqUiwFsfNAXeFOLiuwXdhEPtveLBGPqErrZppgJAMXQXbIpqDRaSbuQAZaasPPwyCXwmKLBAVzMVcoikYJFMCVDxuaUqbFaIPSVcQasdOFMyNzWnEnvuGsSSyZUAL",
	};
	return XKzfVxHtiepBeOEQKn;
}

- (nonnull UIImage *)cGWQDSVzTzj :(nonnull NSDictionary *)eIxEqCzyTT {
	NSData *PLQWXVozjhNLzoqMbNJ = [@"PURaILLppSilczRFWLMVSpdcXjPfVvgQpmWNzZWSyYqRiNVuppgKYGMmTovqLAvKcbMWMWmjPwJMuOqFxzTaoMGizaXpgPXkmkIMpQvtKwSAFHUNmuW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IsufQGMIqjgOSU = [UIImage imageWithData:PLQWXVozjhNLzoqMbNJ];
	IsufQGMIqjgOSU = [UIImage imageNamed:@"fbLjcSxzLmZIKUmrclgpbjlLXNpHwydBJMyfKIoLKTqnoewekQwxRRVKghBxliMyUwsEhMJRCHKVhHznVSnZWLenBeuYOPzfxLfQSFCEKENKLToRQyVXarucUGNLHjLEt"];
	return IsufQGMIqjgOSU;
}

- (nonnull NSDictionary *)iOIpjvtFgErI :(nonnull NSDictionary *)qaLVTbgsjdW :(nonnull NSArray *)OLizoIURfaQGAud :(nonnull NSDictionary *)wBnBhrfRMlmB {
	NSDictionary *icNjfHlDYsDmCtCrlaD = @{
		@"WadtOEpeUTmcWm": @"fXuiECHhveiuYUwEOGsPLEbkvjUreaDbukgXViSpGlIvVSeArkMLGehivcPWwOnoKlSlRdnAqoWMLjrklTMilHATOvNtwJZQDoTTbWeEpUKacUnGTGeTBYmioDlucs",
		@"mBybQrjBbihaMwVz": @"JYNHZcDraPSYuiTeimQqpIAWdDopnDKBaBleZATnrgNNsTPEOVmSonfPNMVCXTWFcWWzyEiPlNFJLxfJDaNIjWClqwhWNkhbfadzMkpGHbVohcytAzAb",
		@"PAosauAhGKyLDKO": @"OWKRBeyRikUjWojIbbsnEAzuGlzFxxbliTlNEuIVxYmIYGbfcZvMlzWxOUihdNUQhGDBeCowzeykShLofZArgCvWfCVytIqtHZwpQcPLcaHpliAaSqLOuVswsBrDnXtUEMOgveMjvFEcGrsI",
		@"XFfMIYqgqitD": @"NzUNFvYatcNTGiPtEMTqoIRSdFEjtqChinESBBtdvtMZYUbAfEHwNhuPzGEWUxWTgmWcWNQqxMZWUZwBcXWzklCoebHVrKnxVZZGHBvTVlUtDJmmuSehZqAfISFE",
		@"mHYJnhsOlQxGFGWRLp": @"eYweEMfjhqCBUCTldrZLDPIXdzSLbyPjQsTJPIIgjgxCilXhZXMaieFSJaDKVFKUxeYoOyjBVPwlkFFdRuGRlGfhfCFGKEfYGISJTabNKuexwgmXSTpYqnYVFqGvVrMxugazuJXm",
		@"hIVsmNhPLSPMURDaEm": @"JydDSMtrNcjKmwctUKqHYfzFyDoHdOXsWqjyVJwbAzqZgdbPKiNKGbJYepRKMvdQdyxfvnTjkVHKNzorhxQArqXTYHAAWGyQYFxzEDgjuwamrqOIBmFVPwzTGDrhyJSvMNQXBRGPXHMV",
		@"oVEzJdMdORIStw": @"eRpKGujtbHCgZLGbhJOiMXWoOcPxEyLCFcDGPLMEFphYuxKoGgvynUbTGxlyQClmTtfMUcZiyUqUzOGDfbJfXYRblymQvVrsWQVlKgJNtjTRlSgnrurdGrrkjiUwtpIrB",
		@"YXUXKonyMIHsfGdee": @"olGwQLoaFgKDWsOcPJTrzeoZiKwaAVbELfakYOlijQgNfGvolPuOzAMsfcoFuTEuoWbeYGwUlAkOshrgNNckOeEmFeyQIRAlDbCEBejyBxfXfgBcvxC",
		@"uysazURmAWow": @"UrCDVxzWontAjzivPsoCdHBSVJIwkbmxKfpDIeBgvvjBfhFEVeYGEOBklXzrXMUaOpRERFGsrxUfZEYdgCTaYPjfIYtUPBePnIXwWgpUuCyVlQet",
		@"dGpWsIJthcqbGnAOXFu": @"hXVjryvdquoHtliBKUTXlWLZupQcxjDmkAKdguIeXxLRgjbyuMCQyuRBJVvwtHHhABMeBiiJjMyhtxTiakELVPCGRqEapNjMpdbCpHIbWwLDrEgQSlbZTsAfsSQuRbjVRraSawCFhOtrCwihPEHf",
		@"JrnrQrcUxDspWukneij": @"tZtwmzkZiLIXMSdAveQryUSlGfVXdpHmdtnOrUQiyLYOsATbEmsixSjhTdzAcGzWoZyUFpjAkxdBmzdcwOniYBYCLQygEbSAAQvUodwKLMj",
	};
	return icNjfHlDYsDmCtCrlaD;
}

- (nonnull NSArray *)XAiVOBodbNNMz :(nonnull NSDictionary *)YsTNbhPUbe :(nonnull NSData *)IXhDqBRjXeN :(nonnull NSDictionary *)PwAQdFSCCkFSBpX {
	NSArray *YabUcsohOIaGH = @[
		@"GOVJyGZSCzcLYzyEFZboTXoMTKIsgBuqDqVMcfwrrlhMbIqVBNmtlWEeahKBjNCdDBVrHTPJCqxmvqGDhHjObUyrtemQQPaqbhiBehIw",
		@"nVRPZSfupDupInAnyeTrXfholPIlfvMcKZpNbsGTYYvQjCfMHsNPtcUHDEkxltTyZPUCVALwHlQcXiblCrxTrSlVWYfKSKgwkWdcinNbsDTQSlcljfGXJJv",
		@"ABodLULLbmMOShuQaaIEExCSUhIDmfNjwABjOXJcQrJLxKtBaPkiDhrtEbCeoKWJRcTFBjRFehDGTKCThPjxmvxUdVLGZLXLnzrFnQVCXmylcxrInUwXmWcmaOG",
		@"heIlkLpTbLMpsqgpaHtBzLkWhdknSPIRpWHRtAnfCzXFPAwpQpZpqPbrKMflHfZyYKmsoEtCVKHhrBcCXHVQVTpSIwTfOLXZjnFjSlckesRYoJcjVfhEEhdVwAadAWDkmVYtNbnWCwvbhBCxudv",
		@"uAnckiuDhYqtEYaIKOcrpttzhtvUujbKvuEbFUqxIWuRJVxKZrmmYDFTcylHmBmjnOliEVzcENduOgtOzxVDhjBXcPGEzWlTwAPNjgVNLImiitbrWrfdmJLQhIl",
		@"WqWREGwWRCUrSLFhBOHwAhAUJjfLmHqNhaYTPAVQCFOCysfZSBuyJpAiPXjNoqqxLfhxZFvuFcarCUaouOVxdLQsmKUdBVLTIcqpMuYHqvVnhifgbCpvyLyfwYWxhOGHvCPwb",
		@"MQMlmnAbeOcEkZUULclicwxXqjtIkwjmAlpbgmAcbRFpDZmgUBbYyeAcCfZUCNNeFjaljiMZPBptjAGnwzjVEjjoUdJClyoESFAFpJXMmgjJZrHvjccZj",
		@"vudvTLVWZlpdSIWaoUQYuFsitXGpHXnHMgZuhWWYuCJZHFnHvzpvmrXAJWeTKPEpVZxsujICgiPHajoZqAEJcILDLmevoZYmaVHIdlePwWPtNrJnsCQeZr",
		@"bAyXpTYRiGkYjowWTnETGjiISSFlFQalwaOQudOZdYnnoQgmtIoYHCANXWjllyaHjGkqnwRNpvbjQcetJrHMrHXXkLbzATLwedPbbPSeiHIncSFtfzcmokEHhjBbDIgHxVmWNeFcFp",
		@"zSemvvmSoUKIWBbEzgEDJtHMMENSGibJtKOlxcavSDCaZvTyTBmtEjvcpbEbCnzJSEDInpaOmuNqkDlmiMAoUaZByWFLUTjCGWfYomDpBwnhLxdnFEDgWZqxlJsbojmoVhJCgce",
		@"nImLfNjiWnparRQdsNtEQAKtenISythYPknQTqZMAFGMzVYAzlPFvepbgrHOXGsFbzLBTkOaQpNTPVNuijNapEcarmyfkiphrHULYSnpxWhvAdRLTUXmf",
		@"FlIwGHSTqefgpkyMlTedgslelicmWSBlfgmabPyhNixEbDtnMrzPHvpSgsrMRWneyJqNxRoUReaZVEmuGgGYKNSohXmdGJzZLzsxUFHrzelsTxsIpRNVhhBXXZmTsEKUbXGrTiofZKb",
		@"lOqbIIbjDbrreBrfHaNxivuQtjBRzyJTRHrlwNulnWWFqNADpTXYMsVvzUHUetxGoyeUVkkzTcTYBfiqZXBpajCdfGVZdNCcUXVAINHfskhEavM",
		@"cZDMLCgonaVoOBVKOpfHMNawZgznVLwrwEYtfqhlLnRKNbKUYaqDufukRPBUvhqQOdhGnNTZuOTqyssrvQNMoRifmNQjykMhyvGPRxeYEog",
		@"ZdqQNFCwDpOdvzmqJODxZgVadPFIfIGqAVoJEQvYlotUdzSbUhZPUHCdEFHZWlFKDeIeaaylZdHdmsfJPjcpCvnwcGaqtvXXtEylwDdwkgJCVAMFeEzpWDenSzAMnWcTTrIGvsLIpN",
		@"gLmiVujRiqnGndTBXFXlWXVwzGCWuzVkPtGMbrPvFjLcsOcxAinwNOlLSdrwMalGGgkXJITxOCmdTMxUJlaNJDHjwFChyPgPslYLg",
		@"FJXQzeZJiBOebrMNpWxlRkwNDrrNKbxTWVgGTTIgCYYqkbaEaSIHQuXdCivOEzRxbpNbFDsQVJVaGSbiVRoXkgLhhHRmwIkdZIzHkFowrU",
		@"XXxkldhUBxleVJiEyYvLBsEqvUtlEAupLoLQyBgblcRtfsxYIFMoJWmBaIHCqnzVZuIrlVLMxaDmmODtOTahvivUONnWKUXSpFiroUCGWclmIPlPjIKfjaeQKIUCLGMxuXNDG",
	];
	return YabUcsohOIaGH;
}

- (nonnull NSData *)UebilNzsyViLPWqhV :(nonnull NSDictionary *)PTbWHozOuquEHFyE {
	NSData *WNEZKiPnkYYEXVv = [@"zrDNhrXCnwkVbIZrtJUTJAbnAkcmwrOPXVuogIhhXGZupwviSAuBoqFhoIZzlgXngGykdBPpSsurmWmEhJyVVQLIzDdptLKVutJRHLLNFpaReQGNhSsmJVFhHobSbCUneWQkYrzvgKLCHFcKQ" dataUsingEncoding:NSUTF8StringEncoding];
	return WNEZKiPnkYYEXVv;
}

+ (nonnull NSArray *)bJkJcEcSrvxnRUHslsD :(nonnull NSString *)YKXhAdCjBN :(nonnull UIImage *)HPLYrakiTTqf :(nonnull NSDictionary *)xZpUWUDTYBduOtgI {
	NSArray *XlVsXmBUvfYtsqL = @[
		@"BnMqPatcjYrSMriiTGkUGTLPCUkBYGNPRDHEyMOYSpmqjFcCEsaCjAWmrSLCKQYQyBDXZzvnGuJecPhExHkoyVfDJfHIRVChOOrlaoqWpekngAPMrPcvAjXkWWLrXtciFVdfH",
		@"LfVLnlQXdDeWIDFFEWPVDtbDqaabPlCWDulZZKHnPxOShklxHhrRvRLjMBcyAYmLajpZRRKnzlctwPkcRBAlZepskMXuUkXXBzJeH",
		@"qkAEbsBSMnmzGUsSoWmbNBKfGTJbQHCxItMWdSiatAKLiOBkdbZgyLVuYqaoXXvZOzwptHfXbgRNNFshhbASMnvZnUVAMKTuNaQJFcPNXRgSEafFtcmLSQmzsljQZhAQLUS",
		@"HdyQBExnbJKDNdoRxaLWimXxKXOLSPPIIPLcxhHIsUgbHxwsVpPGfKGDrhaRUUrXZSbTDPWaiPekDBYZpaJumSjiLIcLKSTnWlqKhtHHYcjTxKsFSQDUjbBoK",
		@"NlxSGtpDFCJLSAKdVLKMfDHatyomHqRmoquNeASnzKufoczBCBQyghFItvHVtTCwETqIQFbsAYUttQdVWHaFmoSDihwJxzBsyNGiDARzTOeDOZJMCtrZtvVlVgbBUlekXmfAuj",
		@"lizEnJGgEjzEjSggYordFbLEDlRONKlvwrjMPDXBxggLNHXdebXvtARMWgQTfADzNTLaIyjfvegZHBdUVEnhNbKqqJnJQQvxuLVLzKHVDtAPIbjRsbU",
		@"EMZXNVguYFAcwrEeEYouFHPsSJkYPNAFKoCbyITQtquwvufrVwwYqFkOgtJQNPgVvXaltjjtOVNYHyxfUWWeHdWeaIdnxigKrtXoSNBSdKuReoTjTrtBZaQbCRLupCuUyNSMfjCkvtZIGIgy",
		@"ncAPFixhvdHtSMqNQGxpHVSGlVUVTUinpkPdKYjysBqFZOILaZazBdTqOPdguZGfWEUdLCLlXlSuLrcjcLlCBbANefETGFZdDrlOr",
		@"vRDzyRHHTtWdGkFMxOKMInPaJFIfNsgckcjHyPalWyxCnYsWPEzwiHTKhnPrCsZjRMNkdkirqHXyFSuxEONdRceMAexjiujSOJNrQgCBYwcangiPfeIuGWTTmPsHJHjPOIddlUFvjNEYKe",
		@"CemYvBCZXpDbkKoGBLzfZhPXQTYXMnFfJXWLfgmswbqLJkXrtGLgeUmFteyKVUSotfpVIaldHKczDtUsqvOUgtHwLiiYfqkhMXgNGy",
		@"awwIfsiNebMaOEyIYhGQXQpxiCapJdGhsVWoPRGgcuEiyfeOfQZRSfyZohdXdrldTNoYdxhYXJTcxAJYAftRwHDzlWDbdpvqZiEPDveZyOumol",
	];
	return XlVsXmBUvfYtsqL;
}

- (nonnull NSData *)iuGtOzrevYEFrwfbba :(nonnull NSArray *)VNWnEvHPiGlTy :(nonnull NSString *)gTKNSYqgZFgZwvFyjhE :(nonnull NSData *)WTtfntqOTkqeXc {
	NSData *GoLUzHVICermQd = [@"NSGifwdXgozeGyWKRHqSXIRrAACelXNGlCDwiCwYFODaczWwmNKORiflxKOoaVwHPqOtLZnfMhyZUfyNfpLnuOSMXcvnUBpcFtgdsRDXEkvZMvlsbspQYuwrBZt" dataUsingEncoding:NSUTF8StringEncoding];
	return GoLUzHVICermQd;
}

- (nonnull NSString *)GLvYalxAlaZhhX :(nonnull UIImage *)BaUaDDXxFlxEjqt :(nonnull NSArray *)RurVVXQbbEzRopx {
	NSString *RdEaqKNULncc = @"dssTMZBPmjyWslqOLAqvaBKMEDQwBJNLmaouCHgltzsjfOTcxpTzRAoRunJOwxaxlFHJEuTFVacwduwzvWMgjMhCNjyyGCcxAAGQXJkmYGXh";
	return RdEaqKNULncc;
}

+ (nonnull NSData *)pzOeXYYtitaF :(nonnull NSData *)pJQPloGcyJgVrtEDd :(nonnull UIImage *)BJpkfxSmypzdwHFhhjK :(nonnull NSDictionary *)dIXZMZcIOZ {
	NSData *sWqgiPLBWLggLbrbP = [@"zhpvBboWNnvUeKkhtvorkQQsyxxmpqOwUtnmQkkOqXgkjdisPCOYRSqszPNyJWVBOcrQQwolNRuaKluSeSqtKBWLVOAIYasSiUDpgvBqBEasWAZpqfhR" dataUsingEncoding:NSUTF8StringEncoding];
	return sWqgiPLBWLggLbrbP;
}

- (nonnull UIImage *)TiIvqbRpai :(nonnull UIImage *)lhNteCcbXxM :(nonnull NSString *)CmkEkMlngr {
	NSData *BDchaAwCKQelWYk = [@"aNqSNmREcfOFlBbAHfTAQeaQDpeVOAJLBjBJfESrhCxyXZWscOeqvHJexEPYjuSIKObFKETUkMeDuSqDCoqakeCjsuNoMGTUsYCjxXnGg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HMtzQnqbcrc = [UIImage imageWithData:BDchaAwCKQelWYk];
	HMtzQnqbcrc = [UIImage imageNamed:@"iuuDqvtQcjbjjaArQDzeibGGNRDstQDIyxjouqQniqwdEjpeWwIvSHmxJFnnIrhqFgSRLNaymFVZbsaFnumvEpKnUdFqvYZplWEIkCSXnkJlXFJwgQLFlkPnp"];
	return HMtzQnqbcrc;
}

+ (nonnull NSDictionary *)dwKwsAInQWSHrlkXM :(nonnull NSData *)mZdAIpWjPYw :(nonnull NSDictionary *)UrKBOHkMHTmQEi :(nonnull NSArray *)uHhzDghGAaTJ {
	NSDictionary *ncWrIBGRGd = @{
		@"trLrkXoaSj": @"sllFBTpxYvbXepLrqHVpDpadhWznZxHHqTQBJBbxyYtxEMZmGutaejIUlalYYXUKjaRAqUPtmlbmSFunGUrBNHuxPJgsfZzuhMBZUQZq",
		@"tLoyGOKpleMWec": @"dlhyrjAwtxsAfHtOlOCCurjUNkJZgDZrxcvfkewTiPjVilSkacjYQhnsBMDJuSANZKwmpFSkzpRlmteFlLffbrpfAyodBstKIdOvWCkaEZFpXQLXdafKWRorVuMiiURjjYiphWyH",
		@"VTfUWfQqUdhQUD": @"sKmRsmHhqjVJSXxayAHsCcRjmuUeCbaEKNlaCjDVLKuukecbrtPSqWcfxkHhFIIQZCvmYNxqNOTgNPEkkSqmBwnRJTZKgWbJWGNVwrAbrQsLnoblNCZYBXAcZHWT",
		@"FIPHWhBmOnPzwBPh": @"wmKGfzSAKdiSciZXrZsCLJOPTPFPHzEOvsYVIvZjRVEnraZLuiDNfxGhmwQJXVFWAFLhfamZeWPkTbNOEIxZKUIfnESTalbqZZvfGh",
		@"FyDVFiSQQlFA": @"zbSPoeKIBEOqdInUWzDXgubfOamJIYFYtFJDmOgJaICXFbxVnWEefgPGqfRUkZNPXVsHnlIGZSWNMTfgoPdvQBrAyRkJiOLhPYALZUKpAOVVUkgpXQSGyoXGmWJbRfGcjRDJBOVhFC",
		@"rDHGJSkzEJmc": @"QDKQjDxIPVYWnRProTUztdGyOqYRvRMqAbQmRRwtgoxDctayJQuKIIZeGFvoWPRNhVcHOaTQheERHiPAwqpvhMczbfWMlFLZQleHaxFuoOuRkfguWbpt",
		@"kTztYDnAtNbMeCrSzAG": @"cTdiUPHLUzaIyEmHhPAkbToSkqVpcSemtwdEzKXVFOYpBtKanGRiqzGnZBYyMNQpWrUHXnizSNKVraImuIYoYbPyhDUyaUKWeuBlaNp",
		@"gaZwRMVPCzTYEyxunwM": @"kgpDtRdmWaQsCqRoDvaysTZNovVzzOUQiuHTMVMntngTUwOJlNcyTpEYXusPHXInVYQFRpzoyVEdzAUHmvXAYmawvoOlvTdRUBXpxTAWfuWyNYCXoBRucjMotVXgspYYMnlBuKiPh",
		@"wIruPEZzANdAtiB": @"UGRZkMjbJLXDutgzQwrpXJNcNbWKpRTnhIxhhFxifEkBGrEAmBNPlMhHujTpPCbwysVdZPJjmYpWZhTQbqJWkXKZCAhPtrLhdmHfqbhwnfERmSHXOAYbxXYDlfwSwp",
		@"jqUFcbxOfhyIVmaV": @"FvvLSELWbJAKiljzJcxuopxuhNyrcoZXGysDjmLegOoDzZdPVxwsdIzGRyfElLDzCmARZIfvCVVvYUtpztCjgMkrRrLbhaXjrUZFZUlASMFHL",
		@"BuVjKsaCBSPmTmmnM": @"IiGSAdQNEuRbdrOeHcZUoqDEHFcUjOwSxwVFdQYymgbcwvuPAASgIznipvHfjAkzGKHdYRexGWsisrHZekQeXuRPFhglMDLFLWmlCemwTWWnoYcXEjwE",
		@"KiUpEuBJKaVd": @"SNTpqkNLxFQIDwUcMGnhUZLMZzMeaScfgxsZGQOikjlMbYkQJirsFCRLEpaCojTluYLRwowlGPffhUHOtdcnzkAIjSiEUhksuwfelPbhlFNzoOuLIBdUyE",
		@"IvRsWjFxQAnPyufHG": @"XBXGBUtxZNEuDOQDLnGWZMqpFnUVoLBRQciiOhLYOjBSqSiNLLNqZmgArfaEnaXqdJUqbnTFCnmZzpUoMAajTOghzWAspIFQNoHrbDsscGZMJuYGkrKSoMBVtuGMDOf",
		@"jnBpwSGoblnLRL": @"ONKyhznKVTeOlsTWXRTDvXbEYskMsVFkscaqHvqluIROdQdChJrcebfZpHNjGXOjwqdGGnGqTtAGHSEiWmpHNFLsCYcTtQxiAnGZIRASDdjPNrKFEIMAKab",
		@"BFLtoDKrVGBs": @"GpQOOFRagKJQtNnnEpVXWBmNkElleCFxmlgMPkxVTjhgWaPucmQmZIeaipvqEYCWeEwzbJOeCCGsynIKfyMWoXWRolUmAJXvVYQvkQHWMkVyapj",
		@"StpvlfwvjxsoC": @"ARgIDFDQNbxItQBuWpzTNZNQxSHetjEUcoIMTmBVnufIaHxKdaNxYNJyKqesgCNipOcEkeLKKTTJbJlwexybXnISCMlYBZbxXuHJnpERBnNUOPJSjeiBKFc",
		@"yOLyzehVGnDWMpi": @"BoZloZegkLsRbYrwKfNSqBrHKWPaEymeEZQdBJWnsBrROzLZtMGkAdKFzccJWmcpydTiClRHwAVmjaQLBHHKZEsARQivVatSQStvoqdnoIcZBWKbmSnOuhyKhWzRQycwWLKhTNcpab",
		@"umWMguQjcVSJxEu": @"GdlpSmIfOqXOJdjyEPmmgUjbqgUUMrYGVWTNlfCwqeDDteftYmhgKNQMvWEyUfToesIyEzewfZDJNzQKSRKHuCzuHBMzXLfGhJbTfKwicePOWVCDcWPQdtAEcTVBLnGKzOPrLDraCmPFTJ",
		@"JrTIsSaxaHIsmupdN": @"ypSdokrqkgpooxRhGIIQDfOiwpnIMIgjzZEjRqnDgyoouOsjtxgGHOtqocunxUgYRLBTFFpUibwMrSXeZPFXBhebAZSytOlYlJKFTHQtcyxajIrHsChvliyZAXKGTKIBqlSfNjfoN",
	};
	return ncWrIBGRGd;
}

- (nonnull UIImage *)RGLAIyrzoNyETWHgKRe :(nonnull UIImage *)MCICeUbiFhzYUMlQF :(nonnull UIImage *)nQAXbWkZahDdyMWjWMh {
	NSData *zsOYmImvlCfeXzf = [@"yCEMJfcypHCmFtZXupZHcMRwQiIPTXhENfEcyiPGKdUDrzyAHtTmUQVyhGfMNOTYDydjzTAhaDpfGqKpVkUQGwitwBTKSZQQqFGsqXMKAoqifSgyYBZTCQwXygIPtGn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DrTzSGpTeWoi = [UIImage imageWithData:zsOYmImvlCfeXzf];
	DrTzSGpTeWoi = [UIImage imageNamed:@"nmTsDDKrmWxlSuSOUHfWuPhYdsjTjhaHiqbBwNcbQGihVjfHTXvEfmRzIGzhqNTdCEkyYCvqIFtkuChkobxHtujWwCPmIkSjYhipVqMyJbwJnQZCDUkPGrIGP"];
	return DrTzSGpTeWoi;
}

+ (nonnull UIImage *)SinPLvcrnxqVD :(nonnull NSArray *)yghVauUvlC :(nonnull NSArray *)WkSnrLOnzOb {
	NSData *EpUpcRhhuGvjveQG = [@"SbmJWXeLgjBrDEHAorbkQYlIZRNJfFYvuQkxoWoAYFIiTKmzEAIEYIRWgHzlTBOmCHIefgNHXGHNQMQLCzWOQnmfTODseIZIUgGZChweZZDfuUsFLdMxunLJXFCjwkizbZY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CtLytMkqoadXn = [UIImage imageWithData:EpUpcRhhuGvjveQG];
	CtLytMkqoadXn = [UIImage imageNamed:@"kKOKIEXTpXxIrTqsXcrbVWVgedgMScEvreHWLjamgsrOqdTFPFxrXpikdpupOlhtTxJqLFHRfzoroJNxhKqekMgFtmMiYUhggORLxATMMJXPvnJunUPNqIxVHBgLwYQfKOJW"];
	return CtLytMkqoadXn;
}

+ (nonnull UIImage *)vslBVurdMsAE :(nonnull UIImage *)IxPNFegAdRH :(nonnull NSData *)HQpOPNtBgosVPE :(nonnull NSDictionary *)pEWjEVHkdxFyZrjWB {
	NSData *xzDVUCATKRJEZvfje = [@"uRVjvCNTJznNQaLrisUHTEOXWFvqjhoWFeozINLqaPxyJGAxonFEGOLVWXAdQHmQmpabjidZmLvmoQacNjaHBfqnzEJcUslntwFEbIfgwoHLJbaBJsLLWQNfXtOPlpRJuNjKUXIYJqNgC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HjYQsxYZXLOqXP = [UIImage imageWithData:xzDVUCATKRJEZvfje];
	HjYQsxYZXLOqXP = [UIImage imageNamed:@"nRyJkmyTJRRjPdiFrAkxJtbtbbcokxzDifMYBhFaMfydRxvZjRhprOCEKlpDUMVKECidePtDqcatuTmJfVuClErVWpZvDRmHrMcevcvcfEcMGuqgMcLqoiduOmtsoCqAHYdzaninQPEiAtRSX"];
	return HjYQsxYZXLOqXP;
}

- (nonnull NSDictionary *)ctFZMSHpGYc :(nonnull NSDictionary *)ovFVIkMvlLWA {
	NSDictionary *RwoFECtpouTY = @{
		@"uiemLKKkOGjaPSlhUQ": @"ooYfWEgxJrnYRglKBNuWJGuxpCOPxLRgjAsSGjoWffKotZxqoiBuvJzTkjaCGTkvoXtOqmxrvayMhohQLEryDbSMGNNatmqUKaHSAgnGVtTWzksovU",
		@"TBSYfjWABooHmquBLVl": @"JFcqxhqgVmHVoVycbiGoJgYGpneDKVxHgQNnCgSCNAMqLueuPPLwNChSuwbBfGMnkwmhdJmEYhhOPApFbKnMamXUeTFyyQnwKXPdJFhvvcUDEXgLKiGKGCxCUGvFFiVjLGXjIWdpfCcp",
		@"VGjbSIaTcxmAcdvbUh": @"yyWJVzSKERWoigXXTmyOUyEAOfvvLsuqBvGEGbOTCvQHziCwrKYaSoDzizwuNSFFKqrDRQcftlomldadAiLVqkROvJyyLVviZnixIAsKAEqaJCrXfhgRlfJUNijIGSRscRFbFHdiYHSJ",
		@"IjinnvYOuqWDCKCbcQz": @"RELsaNCLOSOGDBpCUaqSYyzlzvbZRarPrDiXjWucEVrWVtmTnMtzAKZwlpmjoWHSIqtPMpHcLfQILXjBowvNffJUjesMlOTbrpCqfhwFdxCadKLiXQaeNRCnjMjErBIAfBzjlXdrVEvUxuDJbumv",
		@"UhvuzSkjyHxcb": @"uBEIUCdVYURnMyAnPkZpRLdZqOECUXLIUXGXNyuMJdFxTjZbVfGqKlSzDZtHAjwQktRlpiUxhmuHOQPuioZAyaNlFhYshirtgVWyRfvJTUpLdVHexNUyNcqhrDThhrBBejGdfTwQtpnYDEqji",
		@"GatVeqdTHzAaj": @"MwvcXiNPZKJcDbOVhaCVFQoaysOPiJXPtxuhPhSFYSLcXLdwxBXqsuFnjtczzQQtLluntMIxmbiFaCDUGDAkdDldqcSXDgFkblNlnabSXUXvhGQwhiavDjxExgBHkqdqcxQotLk",
		@"IvKfaSySFOCfNbehIUk": @"NiioBWfkgdliIwuMcZMFRoxPEsiIhaxCHFDASDPtFUbfavBvlJDRRLHNGNOzxCCzDoNgOhJMtiUhEvUFTjBNnBOEGfxdobbzGGWzZqqwyaBSMwjZOzOnnDZNTMmhAJZXtr",
		@"GruvOVEhTB": @"OhQhCDfhnobnjKwtwwWXzMbdySIoyxWXSstgbJLwzgUhlXkeFVbNrNReBonQlPmxBEJMfQoXwclSuloArfJjJgAVcczOPUkqoAmepFMIzDejlGodMNxGWtuQKsnXDQGiRa",
		@"vmsBsxVltluYeEavot": @"EXSBGetMQkJtEKHbQpHxRmxQKIIXcYOPiOqBIUumHijQsbhvISskQsNlvNLfcDfZpzWamcaicwvUSYjMfYbWcnhYzIyNMDBkbaWhrY",
		@"FnKbPXDQkJXo": @"OltqQwSDTOtQbtUEncqEUrwzREZLtevfhlndKlfGtWpXvChtEkuQxuReLVBuPsDMfWEPrnVLbHRzPSLaRRKhwkeiykdRmemueYflYWhckNaKmuRKbGafvfoLRtjKVGKaTDfVNZCXF",
		@"tUzPlPXpyiXy": @"SYuhTIQeOXVXqEpSWjeAHpMRQllZiTVvXHUanzyNHnpwVGIJamuFSNwsLmaSGHPYRmhUISypJAYjmKbMWkPULTcvTeeLHzQEUZVWOhoTqZnfZuTRKMObMmA",
		@"axeOUmxEMTv": @"sGbmtKDkHCsNLadYHoRVpIAWWWdRlWzjYOcuvlGydXPwHdBmUtEUVHMpKdvSzhroRcmwAmktzTBogFUIZJtjOBLhjSwrhQzXsEfCqKdQa",
		@"OlQASPumjOcxNp": @"cNDSHDdWkPpQILQbJdMwJKpbSZiobuTErFPQctItjMRWvSawFhUlakSPHHGqzbDyEOZCOUwxSWHWVcHFyXBvMgTdYLvkbULRWjepvxrbVdHPEOwiQPdidoRdTNnsAckoSrQraonrdYbDfXN",
		@"NjtvhKrByAjXONIuJNn": @"YQCynOxRsOmidtRAjWBBNHwtjVFszvyukruWosRHwdYzPPLHQzhzZHHBriAuYJMmwbnglHOPzfUgUoYFMYwKdJcjZNeAtUVsxfZHOA",
	};
	return RwoFECtpouTY;
}

+ (nonnull NSArray *)jqUxmtcrYcuyvwipM :(nonnull NSData *)nZNvrzuaXbAz :(nonnull NSData *)TuIaszophGdhK {
	NSArray *dWSHVvOOBEUo = @[
		@"JDsNTCmCcKOxHbQhVVaFTgRDJPQDOIfQLiOJxvxdIfPMIBjxfvuunpFXKwlzkOFfKenRVmwmzNEZoBixtcMTkxxvnCeErnNVrcBzChxhiDrDoVbbFLQAJilKsrbBKqLGhsOm",
		@"cPzEXbgleDsEpGzIgumimWnwNgtfZvsucnDMemCWHNmdwsuTUabyIrocMoOxoRTUMzpIVtvrxjqeMsnZaNNHJHbDqDKRcJpklWEjhNxIAiRM",
		@"eKeplyGkacbCzRszjytUXWsWvapeFKSHMgRRXKXrQMvqkogrTJbwHUAtYKtMdRJvfRMWdrChUuyGxDzlxPhVluchOQsrwKSdVlObgaqvflviJSVMZWHKvIhqXcsc",
		@"EHqBCLETNEEQlMxnQwzWNDQYpBtxUGjGtndZZfPLoBYlrrYvxcrZiePfUNnkgiBurJxUUOWdorYCpOzKktUVPTLtWYLtvfnqoYLQhwBzSiIpeiCkCcraYVkCV",
		@"batYFbCINJnwFOPyCFavjeVtTfmKkaTefwOVhFAlXkihUjRhjzKtUQuKVHTKoGfntGujBXMOenFAYexPDYojGOyrjRXUgBjOOllXunAEtqmUMPW",
		@"dnchsaGOKCGJVXKqVMISJjTAAzMXKxyltiiYAOGdWtIRokvXQQYyWwzEYPIdrcLZIZKKYHQKqKHcFjcJdxPulixduVVEIlAOSurZdsEWFcywDsEUoCI",
		@"tutQZnzdggFaIIHTLmCZSeGiiRdZQrmqOMuajcUlGRCKKTgtGyGJwbcqmIOSxwUuWvEORZgFXHrfoivlRjGqBTosoUIHOHaUznHGajap",
		@"HuODYckMimuIJfEPwYGzFRUFxzxTaBynppXBbtLOVkWQzkvAUBXnwFijPYjwBNunhOXRNQfHhbehIcHvjElWEQCGFbXoxTEGXhCYZVSPMVhOPZPlFufHrngAcbphNMUFaKnvLisDUuBOCEqz",
		@"wkrHsLijhuHNSDzIGZWfKeRMuRSxwJkOlnMTnCzArYtPVJBqrHXkFPBtUrDRTJvaeDyOjgDaFKbHOyqMdPwIWzAkFkxLLbKEnbDchzzyUFHbVwQhiNcAodqFHdEEFrZ",
		@"YpdMsNTcAKbkdODTAowEHsokhdhdZkggviLRvhfUWYWCdJqDZOMruzBwdRHdZvKBTLKzPSpOOigNfQeQlpXcjjDhtjYDuMmKrjCeeyvvVILR",
	];
	return dWSHVvOOBEUo;
}

- (nonnull NSDictionary *)OdfbFLCphgzlzaKvzw :(nonnull UIImage *)EaImpRoYNqoY {
	NSDictionary *sndmEYPuSeQlIfG = @{
		@"VaSztmfwjv": @"VPwTpDENdINUoQJXnswfwcTnVDoaYspCylihWJdrfZhtNKuSMfJQUFEMTMSgFnnXLilIIGLNBJDigEjQiImiyyiVvHjkkdKpuuqfWgtbyajoKxiNahgkTJszkhAkwbts",
		@"skNTUxDjhoS": @"dRJqyVcBHUbIZhPZXQDzMfuuklXupuaAnLAQpHNaIzyzPpdSNUtepMDCRanJQNkiwhxWQtSqRmhxxndLTylNPBlflysLXyleceEjBVPEAgeXLWkcmLMlOMZaNVCkkoBsLyNDOE",
		@"xpytkturMHkPYxv": @"qbLogtPPowJtnTlvdzNCKuBPLxipvBISCpqZNESeyWvMVhejtUkBKBLWaTMScyKeSgROePPHrwcxfdkiFIXjaIARTpbKQwjITwolHCvlYLOmccuwYoBMLAywGHXZwjpVqacRchNGM",
		@"ADRifwApHDZFEodM": @"LJzzldFzJCejNMsrlFDevlKEkbJCaWZIDUKoQOpXchuOdJefmFYjukxkdrpRGUNvxyTedJJPxwzSziinPyvqQGdYNkQpywRydbghMMepWWKdABeaNwWcEmzjSrsDIaXQHHAgv",
		@"omqIwJxNptWOa": @"WYuhAKSTRiKpeVgGkKSWzabVYHfXfUecNqEAxSCTtCjkxHYhQUKteAvNliJNkoqMRCmEEkXRETaJRxbEszYZiFEdNAcJthapCfTIJUCDsOmg",
		@"mdIfpNfzxez": @"RoyiYXmfJrCpmUisvesDsukfKflAduFVxWtegBGEqcbRzcPORZPGLcSxHvGZXZwkhtPfjsTTkpQisCaKmSTNtCHfJJyKUJmCreXzQPWoGsyBbtQEJqQDOmaAZQOfzZuMBmbqXHsTlUyDs",
		@"ycqYNdAhojen": @"rQJPELIFdkZVfNhjONNGWAijjiLLJJVrKGexYLfvjyJHbznnmzWHywAqfhImUDhtyZAcWIMZcloiLZDuKsewsPgIztefiuSTOUsJHSsGaIvqbXvksvAYaxuOQKuZHkRD",
		@"kXyPEUzltjcGbfI": @"WcRzrJwAHyCglcoxHmxdHXdOkQpBnDnepLrzicEJprXAFovnfwvqWCzFRIuRUsUEvJJYbVbwwMfDxXMMfbdjtOrENfWVwCqvaCfozYebdQNBiTHTiTMwWtTqBqTIfXEGZoCtRcMWkiArQYqXCy",
		@"QvpPmwfMeUKz": @"IhZLNCFzjeLLBceqcbWPMVVWFCTCEbebDIKlKqLuDAUDxeHjTyeSKXxEEYvBJrdHBscqohDSgIgMLjImGaeesxQTXOaPAuLpYhaXeckXYQMnxOULvKBLRcGtYNSDxRufzIb",
		@"UuadiYareeCjNpFSqff": @"mowDSzQlvpqsGAJCEgiRyOleJczRuInsPtYlHpVNHiXmSHgbqauJNRQbqWCirlaAmeglgLjfsbgVlWbwksikGltHGBGtbRqeMdrSBtjefErREIQbtHJZaBppuFMQbPpKLDEEZWZLSG",
		@"pCMAFvIOvebBDoOwz": @"WrvjYDyctrwfcjBrziYEumntlWpdJIzkkBHleTmmlmMNCbJQvupITjjtjygBwFFMpGxzOyfRoGYUKqgwXOnTtiJTDipcMuNVZnkfhSbsIWmlnfpiDC",
		@"CUcTFVyZZunnPPxDIGO": @"sKsjvAQGAWtQtLTBNXsmGClCDoJhmkSwixblKqqPqCNWRqLafmAeNceNrZpzdruYFbYsYGyTnjArsNPbjRIwDhvxnXbjXuVrrVGfPAAgnyyTM",
	};
	return sndmEYPuSeQlIfG;
}

- (nonnull UIImage *)OKkHVpQpYn :(nonnull NSDictionary *)NWyGHIQToZgZT {
	NSData *UJbYlnvkMpdHKLMG = [@"iQmceNswCsCzfDJHsbYGsPEagjcUXoimnEfjbioFKLSAmDbuuLtyNduXahyjOLXKwmxZWCxZYwRACKbLvKEiDMChYGbgGPFOXyWXISniGYUmve" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SpQQDYJjvcxPBu = [UIImage imageWithData:UJbYlnvkMpdHKLMG];
	SpQQDYJjvcxPBu = [UIImage imageNamed:@"RBSwoxTWuhYEWgCZMSIaOWoCaTfydHMBiQnXAntnZVIILPWhkaiBOzrLrzYESPBTsVtmCxbfORMrLNgCAgsgBUIyYVDmqASwTziVOqtdDnupxifqEzOtwJa"];
	return SpQQDYJjvcxPBu;
}

+ (nonnull NSArray *)jmYEfMDlgtDgUb :(nonnull NSString *)vpjAPdyLRWRpdjO :(nonnull NSString *)GJtMFclnCh {
	NSArray *ExNwCXjAROSb = @[
		@"YkEvvQyNOQOkSjHsTWSTEMMqxXVDivurxhgEbqfOcHcWzVFQstplfJpNkhgzvTPYBmLbyPLrEAsyCOpuLzoBcFgyCmGsUnmkwnCnmxXcIJLQVjxOZUYbYdBJKaELzqKyibjpSjEFVuR",
		@"JxPRzOQbvYHyTOLJyYvoGQgQkxEKREaovTpMbUBUUmAYYcYfwTSnOczEgLbSunZInjhXtNrKRErRbBwMziiHNHQAqeLMoclrkNKoJcZBhTHfdMsrqYvGLIJHeRVyTvIwmquFfWKxxSLHI",
		@"hwKUbsfIDijJuGROwIEVdRBhTsFiiIcuhEZlGnhMNayFwdGIenJOSSAHttNmHghfnzpgukBfUmmbAVRsoZwsirtVBIitXmmcwrXwrjRzgsgdmovBwiymuqPIOABsDQ",
		@"pUDYFHInsHqlBPkSfoHZliTXgFvMzgcfilpHNQLSkTNuGSZQsJQRetgKJmHyuKTkxutLRBValzlZnoEBznJKTyyOxIHZKYHttMKQwNrMbfvvpbNIirgIzZSAVMcjJuAnnTGSslWUZyTVOvGZzquI",
		@"SWMjCeZgtrnDMnyTGbodTJSVKnSEpwpmBqPVeHlVWMTPZwsOLwuilgcJrVKiuYOPbmzgfgLmydTxnutHmXLfigODEelYknnsRNbGjMOkrpvwnysiPKMFMt",
		@"nwqUPJigcptGpXmcfDRclVYXvudhzQICKzCBjGmgJRwNHKfQKFwjeZWKyUDhTLPGIKRPCXEJjbqnWRrBCnmRstBTfqQDLFOAuhRTOsmEijPEdsXIDfzHPhIpmedcjOkpolvmiLrbMUxyZS",
		@"cVkEOcKPDspoUicFVCXOUkYShbErtpBrEqeyFlplGEZwyWRxOoYCXxzVAbhTLeYMLUOdxiBBTnmYjsEgDaIyaLOiKmbBndyYjRsYEvwjcGLKFQdzfxjFVqfwqxfkusDIdkwiPhv",
		@"FbaTVgGqSzSmZmaXCBwFXQRybrYjljCOiKUaDZcbJFkYyVsYONHpPGISxoqQsrRVHWgluusBeeDBZPuTLUkmtWnywokLzUeCGdNaKHjJarqpQWlZHxoPABxaoViHhYuufrtWwqzRQaUkZSDQ",
		@"KHfCxTFEujmiBGVOfgRgdmHcuVdBMwOZzkMCQWvMXIHiTwwtyIHVlvFqrLqyXicYoWDTSFslzWbdHcxAIGIWynKbhfDWbpsaKkphUuoqFlDSEYwkCgeI",
		@"jawIfeezIkGaTRfVIdqtzavwmExpiMHVHmBgiwrOhIJZCjZQIGLAtaATEsXNzThGfEhMnHXlZMEGkkRTexYbKDQYABatyRtzAwcvHJefIxYejsELfzcbDzTltjOjQPTSBXLEEVdvkARwfGMkV",
		@"YFjjDhpAoaImMbpjZNvDhzUfFsRZhEuIQtxTpUguQydlMyHKJxfMxYDmnsItkIqtAlJfmJwqYiMAJepYZjFljTcSiSoONjBXbqMrMBxsDaLATxFUzhQETlOFTYwqjLMQbzgLJlvPKORXxACZTZow",
		@"gmqXIJosEVbesXZQuvRRAoEiGMmuOSkwFtrnfFheSZJNqLUrVhqwOLXyLEsTWPRVxaQuVMFgjNoHyJmextQzHGvWTgqXZnhNcjxBOkyFNJuDAqFGkbBEqQozdmRGXwhQnZGKjvYP",
		@"xdlGGqZqjOHhFJNUDrWRArvGJfwCJGwhykZMSCPWBsLYcNRjYGtEFSbPreAAJqzGJFshhNKvfqYHUreLLDadIoTbzShxNhnYOwFnVgjwkvgGmlGQAfNbCTPUftpHdD",
	];
	return ExNwCXjAROSb;
}

- (nonnull NSData *)PIqXtTYKZR :(nonnull NSArray *)EZqzOGDIYzyJTpGiCoO {
	NSData *UVSBifmqrtWz = [@"fXRzLNJmZlUjejkdQjKIclgvfbeeCIuEbBnrMZiHjDjtPJGREXZRiTUNetKXcixLXpKdbexwRfUYGKEzzAAnmzYuoMYAMDvBwoXJKcFAXqILWVGdfFjCeaWZZnHAjJnfjltjakGODuX" dataUsingEncoding:NSUTF8StringEncoding];
	return UVSBifmqrtWz;
}

- (nonnull NSDictionary *)iSSRUAasVVqtFRTaB :(nonnull NSArray *)QpgkwQfRSPdrPWwjbi :(nonnull NSArray *)KEmfNWAfIsJXtB :(nonnull NSDictionary *)DfQKQdZEEejCzFG {
	NSDictionary *jvHBaNSIpZNxZBvhASa = @{
		@"BbhJibFkODkxWRso": @"rKBsrDcgozVPGqZtambEQlvJFvsggXLRVPDIpahlhTbQvZHRWrkwkKCLYGEdFbrYnUqsFsewxhALKNiDYgpjEgXZXrntqMEQVqwsMXeKTKwRwgRPcFtDtEIQdkxILMNOHc",
		@"vdefbRnzCW": @"bokrLWRqGXVqeeOPbXrSmJaKUlYixomHIjzNVFKOaDphwxJdRNvzvKGnCaajZWWauIxmufPajCkUUzoVgMBTfIzoKgSSdHClNUbjMGjDfsEJPXpLLuAkOYVkvFVEYQHoLyWbCcjqrmQXyrbvrms",
		@"FGxHJZJOOvoM": @"iJOURoMocNNxvcnxprQmiBZtNUeuGcJFyvttyxQXnJedgXYtKczgBidDBiEvSkLrFfKDqCSoLwuKMeErPHEDkmoZfKMNtcMGHURtUGWiANCIn",
		@"QreACAMzzaqfPU": @"FSpXXaClGeljABlakuvaRwPERhuefbbLHsbAdXlfqqGlGTdbBZLSQsJyrpBzcoQfzurKjJZcWEqBgyPJBHyHkiBhuRQNOowFEcsqqrBqvEQsHLTbfNVo",
		@"ZYKTRjFgJTCePkrZGch": @"kOxZvBRmpBUEKyMtSbzrlwXJymeOgCGRVEXMWZlMJWOoeKoXTWbCQEsCixKsXOwbRpGilGKfQHaboshPyFJKvEmOqdzkLlfbszNDWDFWPvzzIvsytmiICGObKOAsaRD",
		@"KXjEougfdsQPyeIu": @"iqOsVUZwXGBIxNgqBmicNEXFbkzOdbVprOWqwiLCLoVsZZxUuhfMUcvawpxtaghDtvquiXyvgKdmurVtVXdGnxcPxhhfEaGZZuSCJZhjrKZCNEcOOBhoaRQsxmAAXakRgBxfudxTZYBbAfYTYztbo",
		@"SCwtYQfeuJcAjvJfnr": @"VOpuBlhmmUQiiGrYHAyuLFtDOsWoAznUZPvnGwSJePJYuYXHaAvVAJyFtBTIQEixkbkskePJmOnzCnRJlyIIkITyLruyUqGMkdeaiItNTsuZlugDgQ",
		@"bHHVWwjaTuhccGA": @"lqnwUtBgicBpOINIXUnjehxZTvTlvfvpCZzclxWyqMHDCKFPlGFsvqobOUKlbMaxzYGvxJdZmsIkjXbhYuRfNJgTuZlCgatPSQQrSX",
		@"SzmiojhKIpJP": @"SRGOhjZiRWcGTHDZHSThwrsfvnvBFFgwhfuPMioREFfiPhUBLSQCtCknpKHWDqWrPMpsYyLrynLgSCNtpyHFRpAbHAGyEDhSEXtpwupPHWaUMCs",
		@"QDobXoxtsFP": @"EpdrguCPQKjTlSEWsbBZHBNRbFFCTHjoRUwQYGdcfNZQetSbGzjVFrYBAdffRWrCdyOGRnNLuZWYvHwbznimLJkpPuDUiPkeogHwtZyIldAomeZVZtzsvHNGURBwtTgsLfDdbAQej",
		@"pJQDuQuLBdKK": @"BeZRnoxyHiUzmbBjOGrnkJnVPOTtzHZWIxImXbQzWafxMdxpacjdPeguZTYmiBZkAyIiOQUJfIIuKGNkPMNVHWiMNlfYpkzrUXAoLVFEVznKTJrssaXAofTMvIivb",
		@"iifTPPFLTTDYHV": @"gzoApofosuuVaUfaFWZHtIKtVrJGEhbgwMmJFhgLfQbWvQiDSCWkTQkINeuAJtoVzSxoipDluUaNYJlkgdYbGFxqiPPLUOrdcfIRXYsHUxFVpewKazoaTHswFBlolWaUxBxniZeARvgn",
		@"AXtKxuySkDOZNr": @"ckvqxCSPZNizcPvyPXGyxhIRYLhkhbKRsxwqIEbVQLJKeUwjUflUDmGKmDWtWIWZwUgMZDCrihujMUsljUJnsEKvUAOstdjdfyAOHgvGTBVutreuiOLebTnxpLHdvOPEHIHQzSdFfKfENHhyztcH",
		@"zwfUOwRYNxhIMUJMC": @"qySaelhvoNnEnoNgHBFMUQbsMpMzXImnEPyZPuuqRghpuPkxkoiDFIxINvUMUCgTENKPfTvvOtcAtWONWpgAuoMqnYyjIBrQuNqXtlavhhSGoPpamZhPxxRPgZhbs",
		@"iUjYjEGhcuemVnzHu": @"duFBpXwQqRpRPbFsZsWBHbGAUoKriMwIRIrHEhbtkEzaIMFMwOMrXPFwTsFsCHybbKMLQRBYVXjLDIkslGXiVDHjdVsiKfsBvbyYpAAjhsYYzsKPQFJssEXKIkVSy",
	};
	return jvHBaNSIpZNxZBvhASa;
}

- (nonnull NSDictionary *)CSZfggQqxJvsZGtGsqK :(nonnull NSData *)bwxxdEiaoQcsrOwl :(nonnull NSArray *)xgUdKxiuiLzGluKFGP {
	NSDictionary *oCeSMCHrBfuCQfQYQ = @{
		@"hrpmkhCfFgqGbfHuQc": @"NTeczlADJtwGaLFTIJtEzzyZRRTiiBfGFIcfWuVZhmXhVnElRiuPedVsmdRAmLLkqKBIIqfuMYQCNIWhJuJvCmAUDsirGHUPYJiSKBIxkStEIyVYhuCpkbChFHDksRencJWXvVGXmBACzdh",
		@"reIsVFlNhHX": @"BjUytpWJjteYohxmyYRicnaZEtRoiCVcbGyhGrYXDQrdvpnMPcvyMdrUXHnemIeZGvHkIBOAAnIBulFiJcPZiYTumiSwGowXFDBAELDrSEVyPhCKBCiosNwtadetfthCNgaBGsQTxdLQsAz",
		@"HlOrSjvwLzbJVRaQDa": @"xEmKLhwppsazCacmnCnCZomsWeAAPYBmsZZTdZmEKbHjTgDmHpwvbpJNYrDIBYQeuZbvWnhDXjNEORSrrKfbKgoqhJcedXNZBztBYOCNPcTgJmbYtQJtzsEexSii",
		@"YSOdtHBbvMF": @"OIljCNLCMcpruXOFlgHcuEnDpAXJtWzBZiVpUlixcqYBxIPtEfHaQjVDCxGnFCVAzpsKnUaOZLxQbqRHfZZfBmszbmQtyhponFKjJzwEUBFjAnsgEvwoKblMX",
		@"IaPfQYiqGlBOAKppKjH": @"ZDTkXblDKnweknoJTLVTmRbAYbIGqZtBOfWbDsvGqSzNJodHjFPuyxfRgaJTzDZpCpQSLQgkDdgxtHdyzyMbxPVYwoVKkuhsvzzrOqzPPP",
		@"xWTdgDffBqhm": @"SPawIjTHwHKCWSMySSTDpELQqcXJyAcvxQRfiXRMhDwQGlNynHLhjPiArjidEIbRtkGjDnXQUOSYdmOIeVcrYKrzfewLCfxbHFYGqVsmSOGAcOGStDdXHCXArDmdYjdCHThxszwPN",
		@"FlEBQrQhsqMgDBmJQWn": @"MglNeXpSUtIWBidAqmbVDzAczULZvyupFJGmgceGqGssDwEpnnEWTJdrdwNUScPibQVqIcIKsisNNJrXbVtASBnuskHpLbCQtaic",
		@"qBqZnupZTkIon": @"CpCpacLnEURAdcYGRGBRxZEhrztfXIeYrgHjfRSUzxJesoYQNsVGFpymmqrdeXfNHZOPMZlXndTQTjWwMlFwikwouEZScmhyRoUDyOGRNvRBZlfUMrGqerYqywaiCuHKnkarIB",
		@"TYMMOpDfwufqP": @"emiarvQLrfAkwhtCpqtfvNkCpSmWukpIugOukEquCNaTEEkLmGxeNtRAizpGENMLGYvrAizTmRAVMMuhraIKdqWSQOktHrZQFluCQbGBaCvfIesYCAAwFaktCclGjAdwOlzmSSNaBmGbWxopNU",
		@"XWlnBLNtPPIZWIhitFo": @"lrEkIiuVdmNatreXjWXygJUIwCwvWSpeVEeFQtWbRCsUfLRiyMqnMKCXamFyVbKsEVqOVRzQwEamxyGbBVqsEeruZsQARHCiTKurxFtUzjHQyntFW",
		@"PRIwdlWNYkFonJQofz": @"EHTuZHTBOXuzNrWkhIROxpWRJnaEkZDhSumgafsGLfNmRkHXjKaiqyssFvvDWNpsxAkzXxHiOIOBpdOayFAUbmbnvpJjVxxeqPcuYYDRGAJJAJeEURAweN",
	};
	return oCeSMCHrBfuCQfQYQ;
}

+ (nonnull NSData *)GFOZMuXjBQkmQMs :(nonnull NSArray *)IvuUrCLbNOCeP {
	NSData *NsIZtVDQCXvCTBoZmE = [@"mvWCOubLbPdItsmCpGVcUfGnDjMDykuTgEaKodrhCbtmPmwclixBtCabUmiIpgfwDOyboMDnRUqXXuubljhIezARsZcmUNnnaJjdRadGtnAJiTqgf" dataUsingEncoding:NSUTF8StringEncoding];
	return NsIZtVDQCXvCTBoZmE;
}

+ (nonnull NSData *)kWJRGbbEJKTpwLcefxO :(nonnull NSData *)CidLWuCkYZeFm :(nonnull NSString *)PsBDRjaeUkaVJxEYO {
	NSData *REvKktcBDlfWkOkLBCW = [@"sJRAlLwIDRDlIjXacdduUxoYoINkZyIXwpIaORJhhsiFsjEpLPkCLInJtlzvrTZhtJyGqzxxCxxXuxhYjvBDHrkMvQvTnvcvXpyAbAhqMjqpcdfqCrxBbDFpfb" dataUsingEncoding:NSUTF8StringEncoding];
	return REvKktcBDlfWkOkLBCW;
}

- (nonnull NSArray *)mtJXvMqCVhgKGfEO :(nonnull NSDictionary *)EirsVjxZPhDYofLYyg :(nonnull NSDictionary *)AFqzwAKgZKFkOo {
	NSArray *PHDCGkCnBOCmKR = @[
		@"YRLibsBLnJIwiRpLFOhjIbAhnWzAwxPgdTizFqUQZYxPoCObcIKkYhLFOhQboYnYIinAVmpxhjNLZajtomzTClIFJpUdjtBVYuDWeQSRzPUAnhHjNiJHuLLQkSMDtjw",
		@"FfhoiawfukKceBlEUFKQBbxqpBGDwCwbJBDzDUHKGYMRHIJIESDStaHliRyFEPysgpOLCNGSUTezLgBugnvJyzPXlDyHxAxMGNgTEfxHIhAtADStatHlYLvzwRZpnBYtpFDhquarfkDMfplmkX",
		@"TSwphnpsBpOMFdjHcXaXwsXgjCZuLeSCyaIyJAktYbRbvdcCyWbGxeoTuMhuJLgQkWxDXMZCrJWwLQWesnEXYRXIklcnYsUNXbLvFEkkkmZtmrUvKtzXhLqhoLFxJIvax",
		@"dFCbkknoDtxQkDddsIHBiZjWnxJQgdNupEcJBsTavJfXQJqaYbiodQbutEztQiVfJohhFippybuvDEvQZGHaoOmnzwZvHDtOvvydYxxQoFAntRmaGa",
		@"CedmpOABkTQiOnrkmkHmuhBLlJsNziwcEAAebpTvmceHUiTQnleTDXOZIzwehWontPpUIQsCmzverhyIcFabfsODeGYvZxhIPRVlkOBIxCJtwSuaXidHJdSxjrZjVatSRqdqsSxiTfnLsItCOD",
		@"EethDRtfJUUFcGiMnCyMJQPvSmkAzPRUOEpSuPkexUqIbGQNnanAssERByLLWvXnZNrlwCnMCHizlfrZfaFWOMPlVHSdgzlRNzOERArxi",
		@"LiryraPWwevKHrXITADURFnrVwSuZZesqCcLaanFjFAgGZHMDQhAlIVZyoZoRTTtxRnnhuyOjWoveEjBehWNBjjBQOMcxJveMonUWmKEIMWkeBdrfUQSqeheLJY",
		@"NNLOZhqEIHjNJlcHYCzOgvuBhzZQYnpOjAFNCkWyeYiYORWwoRrQyHnksQvTIVNFIEHyBtrSLLqksIMqLNbOUjDVHHUonEtRmbDjboXlYU",
		@"nVdsZxkvvVSMFlWqEOuVtKhzjrXJdgcomzxsGjDODCcVQlUUimBScPloeXiautVBWEhhpeRWcUOIrkbbNbiboVfXlINaJBeYxpLDJSkv",
		@"TXprbcqOJrMJwHkmsAFNDinnxIcecXoNTvBhdRwXUanwsafJTmZpSpgJpMVSVOrpFNxdNczTgdJuMdROQsaHdGpvhRqiHiMAZaHypouZQXkqSybZaAJHx",
		@"nBaczTTwoQyMLbqGkuTqHcBImnmkoDmaytWyjdHvpIvXBYeIiCQbjSytaqDPHXqUyUtWGhfTgNaMyebIlwgFYXPSgOefRYnaRqkCafpWFEpnvsARNJlDIlfsdZIkbVcwXWilWnEscZEHVlaw",
		@"vZtYYNIaOWQFoWwcoyjqcGlgemnhMtUvIdKmkKrLtWONhUFDzYRLdcANVhfhzpLOvleuPgWsCzZafGHkTjblntViaTKSibusEARbmJbZsBobVVXWz",
		@"danePXUyEBJyfFkQtGoPxGhQbtysvApGqfAbmoyWngpTvPWUiYrJfhMnYnxbCvtqtirBWHNrpNQnpcRfdhddtNUIRzswwRXuXvTwHLOvSaEbChCfgzoyKJDCINC",
		@"gfHRfMoWDKTkhLIWZuBwcyHnZcMSWdGdbfAowwPwRtQBnwzdCKRGjTemBwfeydkqmBiAqCUReImazMbfsuxCjPAVmgeHAzGcwZvPhYrTNT",
		@"LtkedQEOruzqEWkeoCOgRaFzzahNWFjUYcpKngUdaPgEBkMODePmcOACwUxkcMKjFfeLeTsxcqQUjVNaboAkuOuVTmsywjyoLcfuJFzw",
		@"ZcoejrwEXHAQuhcyBwBxTyohkRDHmPYjEmNRXKeCoDwcpnVJvgKyxoRZptIIXbMPzOyTjvpaLLYTuQZFFWSVBIpGVrjCblvnxblAvRSBPPLcRRzJOseVrpoRndOwNhkE",
	];
	return PHDCGkCnBOCmKR;
}

+ (nonnull NSArray *)NLhuCjHYUYWa :(nonnull NSString *)jpKWaVQgxyzgwcwm {
	NSArray *CXRzylWYCdbvrn = @[
		@"iprDkUzgJSCvgtqVWHiBHAAGuIGSHJqNbGmcdeEUvmgCrOpRzidCZfmShBmxdJfHijtcVYHYHIPoMwDmdSRZJVBBOHUJdmLeDJEaWVqRARxvMmayTk",
		@"MWQoicDnZKPGzAbTaHURpySWPQOGAVZvuYlrKHWpKYzeiUROAFJZTguPRYTOMFHbegsWqqcBmqDIlqOLGHZTQjdfUNTdKDpYegTPXpJShyBTEtfjrFHFDKVqmvubARbiavXfLWELOPyXFVeT",
		@"FgkFHiRUyvhHLwOAzjXpxDsuQLrjWnYXoIhnDKFrDVBXuxRQSUrSsYZPwZiRkNBsBkjvhNlYHQVkIQUoJBTPwttDrCHCsyhQguTFjIdAHMzecKAgsNURaxEHhWTGpw",
		@"YkSJZzsQpYRKtZJaQqOwNESjguxJNjHkRXIaZduJKGLozzTEApKhpbfdtvITXopMwXYXKLqSfXyHrfAgQzooPAQZFEsUOfrcGUJldDBUUZleoRkGfRPomDdRvNLpvBAVAykoEqpenEstzNAP",
		@"pKWMNbyQxcnHFHQVUCqCgUBMTvDhIwhLlHeRkFpiQQjeanpMAZWfwxyLnHIFYYPqOxMdmpLfuOCQAusmnJLwOdmtWdISIsgbIFRZvaOVOPDBdMbyUaCIodDxflHJHTawxDXZXzmRnOzU",
		@"JGdlQSMaWNMsUGvylKtxbagDNzTUFziRIgkCIRIthuZEzZbyFMnlgUJbemXEVJKyxrZPFmnOVhfygsKzYudKFqKcfAPLJTxURQwi",
		@"twzqHTGpCaiWhUzxgrwfvXkkoYCSYgAQifDBgCknhejoZGYXwlxIBUoYvMSbkXqyssibKvwpkzqNdBHtTWNZeqwuvdXaohCCuIbBtJyVeGcMdVEotZmeMLseVOfoXMwFylmYqRCZKYgyMiyXJqp",
		@"VBqUtHEkGcAuzlxSlOilPhxEiKkOopjVQqTMeUOyNcuvPovWqcEipmepPWJnWEXrmnFwpUZMohDvORsPjHgVaWCxifcPtDfWugKoEhcEsEQOSHexMEzviaLvJPGZkqzjbHNguusfTSyshRbGnuoE",
		@"RlYMJDnNkvFVTqVAeLwlJYfByRAaeeUvoiWguFfVJLUzgvQTjJjAyhdlzklLwpAYpGXBmwKqCLfskoquxSprUtPrYbOsnwltLDvVfmhIokD",
		@"DImlcQFWPbOTBzSmGqOrcFsXWZyMjaxzIGsRKSlxwJAsrGTQVhGsBbdlFQDhVeKRIYbhaPZkxkStoNPKwRcebLJcoODHuMGegxiLyPuqywHifLMaPcE",
		@"eodpoIZBfURdaoWMGAYMeApaeNWOVmkKJGxPImNnFMRGegioHabeUPofvQCWTnWKoKIyKeDawFoVsgLMETlbXwKQUpNJCNCEYkjwsjvJPDXtBGmdSQOjwtPPgxBrnEZiJwylSYd",
		@"YQVgeeycvKWypEJChbBatnzkQVVZWwBnChmqNocyEHKZtvKRQehNPFFAWtLnCWavIYZfMkLWzcqVFHDUthYNScmZsYIgRlVPKCxPJdUbLPYwAIVWIrSWogNmAnbDPKMhLNlIzoentN",
		@"hBeviRcYzQvPAptzTffJNNTHfkYdudrrscGPFBpzLJZGfDyJpdSMHbkYUyljwqdUWjpfqYBzWRVmPQvwwxNshAKkYppecDViRafodrOQ",
		@"wJgwPvKOYGhbouMuEbmWLfZEWezUAhKJHlGKgLttVBnnILvMSpHutITWQiRbGLcuoYMqXZQEBImDZRQKoEUOuWycDNJvKgnbpCEmnJX",
		@"wacnptpUPtvAoqwTdyIQIDsxldcCrDBHUeQhqGWJpLwVVBLgiRWHErvcHsJbJTkYhYLqSECiYevfcwVCSTttGolebsbyvWkKsaAGpNLwJaygogGUondlKijyFNxcDEVo",
		@"WjgtnxxhPxgaNUesUipHOdjjLAyxWSXGJZXTjOOMXYstQkkZeRsxjPbIgYNzzhiPYOpytQJkPbcLIjWFCcFFpMSTdpXmOQcBuUwoUJKtOYBjPyoelDmCXcErEiucs",
		@"EVKUOwPUkJEkAaDdTrjUNwPaIsiSPmlCSFcAwveBSNfVBslIvzfZsRTSVKsPEqGtiWvwnCUhRhIlQsJtjcVEelDjvMcQVhBbnqEENla",
		@"XAGybugFbyvwuaMOIykTfITkojQKMikrnvJezLXHWPyQFAHNKTxlGbByMdRIwuRNiAPymBksJtqBQfpKlDachgvrTdWJLPTApfbgVYCOeaRzqLMJHzy",
		@"BUdouaOlUgrFyvTyUIuWUoTIsuqnPbuTTkBOEQdCGYmyObGrLpQmMEJBLPsDouDxjBmleDKrVqzeNPaEvjuSHpkLljURcAhyQmTL",
	];
	return CXRzylWYCdbvrn;
}

- (nonnull UIImage *)WwoehwRFyy :(nonnull NSString *)oWhgnLfzcqJSgUh :(nonnull NSDictionary *)qUOTbyUlINlvOaCt {
	NSData *MSAcIATNbDvmjxegNuN = [@"pOACUjrpoPGmTJUuTEwgNnHcosnGhDzRfaubdZijqNMURFMJBzSjqAcBwnYTdGMRTkMvJWbiQrJNucgdrrtDswIdAdNgCEutfXQfqagybtRQAAcFtlnCLVtCJJtTVpLfvTXkmNtGVufyU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sFYFDZkdSbahkAlX = [UIImage imageWithData:MSAcIATNbDvmjxegNuN];
	sFYFDZkdSbahkAlX = [UIImage imageNamed:@"limEdExAnHSBSybpXHQnBamkgAgPgTBTfJilJeKAnvczsDDZIyfUqdybwBYVGHgzgcmXJLIaThAhfzaNYjIggrcKOBtdEmiXxBuafvXJtJQAXw"];
	return sFYFDZkdSbahkAlX;
}

+ (nonnull NSData *)HERINMOzpVklahLZmyU :(nonnull UIImage *)oYtCZyxawKFYYBp {
	NSData *nXBrUCGTsOUJ = [@"kGVbQEGnwLteUPiekkezEeEUaadgjzybcsVqaFMjnmgFhDTakjlhiMTFeiHVNacmRUKfNwagflFFxWrhdAXlEEZQjSwSWzaWpoQDjXNzhfjuOzJQkkMEmWaQUFSsCjOswBerddoLLYwFRIjyaMfU" dataUsingEncoding:NSUTF8StringEncoding];
	return nXBrUCGTsOUJ;
}

- (nonnull UIImage *)EaxNkXaEfDa :(nonnull NSArray *)anGWunzbUaU {
	NSData *owWIGievXKOADBX = [@"exNjFoEjYIWGjEtmbhKvWbMQdeBkJHkoKdvuMrwaQRouLQoZCUsoAhOYAziOamSYCmSHGzTKonCNQpwOhiWrPAtrANZOCdXwoyFomnKPbZZGCVjDGWWnoycHur" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wehqIvaneKjBWLe = [UIImage imageWithData:owWIGievXKOADBX];
	wehqIvaneKjBWLe = [UIImage imageNamed:@"aAKDkXwRYilwwKnhZWPGFreOISbxKPhGNWasTESJaiACBOWtUYKKRHCWFlxgFfPaXaNRKewnwQEyeZTCFicMngNlrILTYNTLGAXBWVUtkDSBQWWjVYxXnpQXaClPUPNvxriyoJQJMG"];
	return wehqIvaneKjBWLe;
}

+(XLFormRegexValidator *)formRegexValidatorWithMsg:(NSString *)msg regex:(NSString *)regex {
    return [[XLFormRegexValidator alloc] initWithMsg:msg andRegexString:regex];
}

@end
