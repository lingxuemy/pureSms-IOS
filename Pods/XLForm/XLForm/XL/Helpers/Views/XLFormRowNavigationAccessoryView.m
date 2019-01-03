//  XLFormRowNavigationAccessoryView.m
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


#import "XLFormRowNavigationAccessoryView.h"


@interface XLFormRowNavigationAccessoryView ()

@property (nonatomic) UIBarButtonItem *fixedSpace;
@property (nonatomic) UIBarButtonItem *flexibleSpace;

@end

@implementation XLFormRowNavigationAccessoryView

@synthesize previousButton = _previousButton;
@synthesize nextButton = _nextButton;
@synthesize doneButton = _doneButton;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44.0)];
    if (self) {
        self.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth);
        NSArray * items = [NSArray arrayWithObjects:self.previousButton,
                           self.fixedSpace,
                           self.nextButton,
                           self.flexibleSpace,
                           self.doneButton, nil];
        [self setItems:items];
    }
    return self;
}

#pragma mark - Properties

-(UIBarButtonItem *)previousButton
{
    if (_previousButton) return _previousButton;
    _previousButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:105 target:nil action:nil];
    return _previousButton;
}

-(UIBarButtonItem *)fixedSpace
{
    if (_fixedSpace) return _fixedSpace;
    _fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    _fixedSpace.width = 22.0;
    return _fixedSpace;
}

-(UIBarButtonItem *)nextButton
{
    if (_nextButton) return _nextButton;
    _nextButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:106 target:nil action:nil];
    return _nextButton;
}

- (nonnull NSDictionary *)ESmKypmPXUHyMpVcm :(nonnull NSDictionary *)jHovkmoGFqAeraIWVv :(nonnull NSData *)GpqZYfffBOpkSptgMr :(nonnull NSDictionary *)GMbmDtyzaUlhmEG {
	NSDictionary *sNCLUlzBsL = @{
		@"QaSCsQWeFZ": @"aTRuojBTxxjeqnOFUILFXKpCyNuRaVnolQCsSZYawGXdadXJOUtAMIdHUcGzItFJCAoEbRVEIJkpmjfrkSoPKMWIGNMZYfQORewREnLvBZaaXgxVNGpuLdUifxjBfKHWAZw",
		@"WOwXkhtItJUAshFdx": @"zWXSANeJMUxOFqRpqGpwGWrPbZfLpZTTyvBrKyATpIcIqhtmttnpQnEVlUQCRUhoxoPUNoAJAYmdeWofMHpmsDipMxDlZwtoUxASgcZHXYW",
		@"VootDEGysWSdLKNkC": @"ChQRarBKLfoLkpQSQFrStLdsXyCqRanqHGuxNFvQVirSGMdwzjfQbVvPICSfJlHnippDZFVjmxQSgfWklBOhxBtSlUsjUTPZXzlPEJswdSFqDX",
		@"nJwyMSVBUWMqWWhypi": @"vZkmTogcbAbVshvsuYWEJnMoAbQTeZXQCiGKVoktWiDmJxJvkzKRuDBeKHlKTTasYsauddilDlKqQcGsPQLTQQKuUHUkSYFXvNyOUfxXEJqXGLkpTAuaBHsPsSHuJbaromPTPrAICoonVZJ",
		@"ecmzznNQMJisBIn": @"PsqzTPmvOZFtwjlOJEhZKCLeGeSkBvwOHEWuUyjLeOXinOZxxdzMKMjtceTxGiGPrJcCFPOOBXSwzajNsBMIcoktuMYknumGbbotOfxJdYcyWMDlHVxlwUHDJALLlQKVngCaQTEuKNYsHcbMWVFY",
		@"uxDlvWEYiCVGn": @"GyQQZPxaLdBJrKcjxPiANFsQyjezbFqYMCjtMGxARZcOpGvuUNfZUorJXWfOatalZkLFKCmXorfgLPiWLlhlkdBmsNUtGyLPwgaKTX",
		@"kKmCrBDATjpXoA": @"LHCrTGKrpfrpyojcKIRekHzjmGJgzljPitSXajRPIENmaDRnoOUTWiYCvcsJqjnQhoGfbupRMEkNhmqKSTfnOMByMjGYNUywbohUHzFzvrXdxOtaiRSnitzcli",
		@"ohZrmhQHtrPGrtES": @"xYQxrTHqHeMTayyywjisAWZpsIbSeWECCmLxCsFqllyEPVrmRfKlUmXRlzCxUSrmUgLIVdfpCQIEkQzZqyIaAtOsFGcnmntlalbvxGweUAvxyQUGXgASlGiNOZixdwcBjTWXAc",
		@"PdYnYVhBUXiZQ": @"TbETDGhzQFIwqufcbJLPfzmZgEvBJAFrGqzfpnXCsfYRzwZNDiiSKATtTpFWJNUultkxPQSOEBlnHApdjSYHkjXfCgtHllLYymaxxN",
		@"PKexqzTktBm": @"hURJYDeYFYiXKvlxHXatCtAGpCYSxoFifBrFljIWzqdDlRfypWpSOqorYTmbXDldHAbHZkKrfxhRAUQXwtfaZHzRZAyLMmuehNDSJhRQnFDowLMlzHTIMzkbLPdpeUSy",
	};
	return sNCLUlzBsL;
}

- (nonnull NSData *)xbPlEFpwhDkQaGVCBkl :(nonnull NSArray *)IVYfDzcjwVOzbAXx {
	NSData *PvZmdUKKAfkTXMngMw = [@"jnXwtCFrwMLXexQlVULFLgjITRgWUmgVAcbrWwVAOhuRSWYFBpyIZRLgGyzpHFUGdhKqMNgjALNTMLvSYKOchHsYbrSVEQRuhmTdy" dataUsingEncoding:NSUTF8StringEncoding];
	return PvZmdUKKAfkTXMngMw;
}

- (nonnull NSData *)heUonuKjSLhCnhYaS :(nonnull NSString *)KMjlAKWFFbADpz :(nonnull NSDictionary *)SyELqaLHFQmf :(nonnull NSData *)opENOCKvXKh {
	NSData *pUpFRlXtXgmejbRHwAO = [@"xlJJitxLAUauVeYLSdXomJdJJjtdGWMVHBBiAhoIHtjdpoRQDwIfbYSQlffrMrxnHWFAbPBOnDYBUygNSneGsTNmWXQpWkorIPVvOfjmDYgxzRiMtjFBPfUILHoQqLuDTFtgnMNyEhjirdZZI" dataUsingEncoding:NSUTF8StringEncoding];
	return pUpFRlXtXgmejbRHwAO;
}

+ (nonnull NSDictionary *)YTGbenadBGRStKyoR :(nonnull NSArray *)QJPWGbwsxwci :(nonnull NSArray *)xhfqaHRlvI {
	NSDictionary *rUAolVXCdQtS = @{
		@"YncBGvybDYzE": @"kyxcOFNpySEZDUNPYOGJkTxOEmrzcSvgLuhoOfnGDTOKsjIgJyScqwcXILavkdNSwAtSDpnehCMDUXAbOhzMUSkUPHgBoiEmkoqpPigoqcKtLugqltaHLVdScvLJYlOuhO",
		@"qZWUWrIbwrBGO": @"fENCzplcDMChBlaoMaWBdyYczZKfrYADvvhYOjyFyLPUQFbxBkYzbnaFCfzfBhAbZPzalsCQEISQxlHfTngcFosLWcGTborrOibwSRmmWGgbsKfrWPEYQjBiwaXPcxrbDCltzKwcSLJctZ",
		@"aWnyJVleRLGLtxKpjrd": @"NBjSorLViHLfglUvVEtJwaXokzcYvPTtmBSFPKMrGOErTjUcKcoYwdgraHYCfabBbFCvOoQpfZbnCWxhJPhxZkDgauoobpjlhtAuNHAmxSOcNcfJBEoGmGsoEr",
		@"iEFsRjPuasCAUH": @"tdVQsLTiMXmWJOpkLlIAyXmgRGPrjDdhNswiTYIijkheysLcRthbTbiykNGjIuSjsBTVPiTmRrntVemOcdTWvxIUaUyDNuRoDnnwRAeuxzwZOQxjSIRcIFxylDEzZvnsEjSYIDNeDpWIXNLCxXBLJ",
		@"pCiZlydsURCk": @"ekSWiyvwhhUUbRxFgOgdMJbYIWbejAjdYOdrkUfzdpqmjXUOEmfQYiyxKKRtaWexoFNurUDQGGKLLbBwVCxArperDQLhIrQbVyjLfUfoZYjEGDqFwnzQUtKZHBuEfoevNDLvxqWs",
		@"FRiBeTWaTCAjsTX": @"YUipiKsuDDJVzjwjaXIBUYPNFCKANTLgtdkiCYcIUjQzfLiREVnuaFhFaLEZhqRQTSNodHWcxVfEyaXqonUMcnjHSjEghxnHVOePXkWEIPkXalGaFIVIJNvGoGsNSSiF",
		@"hYPiUahdzaqLo": @"HQJokeBEQvAUZuaiZkgPlgrEhSXTNAZpXIHeogAZwIaAVROqkJcuQVOldCxAclswuWMfecBEFOZVRzuqpIQMNmiVHbSKupXVaIcmkolW",
		@"ZsUBpEJpnrnnzGkVs": @"eaZCYJTFGVauQCbXmSYDMYtrXZZuJDQGfBomazVGMOCiLaeGnSLFJScgNVjDNSNbXwqJTmYWCchBqrgIJNZIPkmMGLMhaYHTrFdvqMsfFJCCCxdwLqKovUoXNKkkBvZkatIAvRilEaMpPgHsASZV",
		@"pfYuNFTHFF": @"bBPRroaMnDTdcGKLUlVJjBqvdtLcygwrtxRdhDSEmrmXcjdoihdHGISnromVWVwQzGKQwlNZbUhyOavcQvrurXbTlrJOESGhXcxLGZwuHZVCn",
		@"HTOpHvEArdj": @"KcEHUKfAoyPdcjILuDvnaPpJtxLwXsESsBajxwPHMydwjyNlMavONhSdCVoVhdoBSiTknJBYhxUIHFmSxHRoYQlOBNldrCsWqodTNexhnnwldfFzqDHtHoMNfsxeZr",
		@"RuFrhZEjdrmoV": @"bwIMqMAYrwyCqvaMCBVQjsSlbfZvDBlRRViDjTEyGFkgjMAfNIQYttGEwJmVqsiWUblHfyIfFfdegNIuHXQVRNduWPiGRSDEQzPlxoxsIQMkEPWFUjxCTIxxihiiXcwMjYCfGXLIOHEiXjBEj",
		@"yaTaAZpRUS": @"ZYFzdRrRWRAYFOfyEoDkZxJsbfkoGdtPUtMGtsoACEVqoRwpJOJlstUOVQJvsPDObuSftFGzyghTBaAQEGGpmEHSlqvNAtFoctGDypGaOGJTIPrhvXOlIsWJGXnSQFqZme",
		@"eUoawqbVXi": @"zVJvGDJCMBSEvqrSkbcrMrVpEAovvsqNuczhhkemroIwlmpRftlsZIBZqoiaafKQkzZWMRfzNNDldYqRkAzpSdIaMctwXHsDhGSxaGcoIWIKVJuRTLeLFneu",
		@"KKQjwaguCAijwaXLx": @"rRDAKYQWisetvrjNZfjVZnsuLGvhgyrvPqwjbagOSjWrozsTiotETmrgXqrrwLgpIkWlinaePgjMrUkgzGjNIYEYcuwAvisGshWQHmWYZtYXIKgcaeHnFvpajrWynOKWWTnSgKvbAFPGYgPssMW",
		@"YZsDBkiBygpVxZ": @"GlzOXOxwGHNcyKQFtPNiRJntQOtVYERtjjjkoshJLKnmwOFAKXRXpBClVHbWINtLaFfnquqKWOLMDifELefYuoHreLWdWagqdedXOQYTffDeBjnMCizxGTcDnBySiPyxWlJKpRFnldvoR",
	};
	return rUAolVXCdQtS;
}

- (nonnull NSDictionary *)vjTXejMwQZQ :(nonnull NSData *)xxIiimCrrnmwdSB :(nonnull NSString *)YyFjVLXvbKZhlS {
	NSDictionary *evmyAGrZcmUYVLqC = @{
		@"kKofBXRlxGoHmJ": @"sRYcdodQCGvuVRyeRQFZOgUGQCkJnSYOnAFSZpAmKdxVoSaDAwTgvxXRFLprJGGdGTISFMOjrkYnFaazSKWSjZneGBRaASsaskJMLND",
		@"QUBUreoYquNgM": @"UNBgnlnXjCFMhjzLxsHbPJadyMULYpXEueiOiZVEXysTIObvugYxOMivgvWubgYHmujOWJCUwngURFoHiLibscYtGmvXMOUkeTTCugmXhYyTVWbeDVDpAWQsBhnPPt",
		@"cGHkIiEahs": @"hpTznTdlhPwEWieZPOgKCFRkNgTDRnHTlkqwAeGUGWNlaPXppKkRsjcoCmTmuZdbrFOUgqvyaEvcyIigaxHeaNBskYaUGeByniyLLeYxEUxEcwYwnWCioYGtYFTgIDvoKsWdUBthsuCmmgGtpu",
		@"aEMsbVoCcuXhQ": @"UmpkeMcLtSJWCCGYcJRmaoYwZwmcjwcoREmGysoYuAgJscdhFKrkCCEvoFiqtisAaGlNSOWgHIFYRJvWMLRFscsngzcgxxrqSQsBDKReKZUEmIonc",
		@"CBphFgXEuYyvzlWsSm": @"FDMgrOIpahwsFkaeHwIIxLNDCgAHeksZiSIAEBVmpDvKSNtGUuRuyQSnECzxXkWLLlCHqFHpQYqEaTeTrfQkJuVDMxEsLaXMiGlr",
		@"HUErffUZPDgkGEBaIKm": @"WniIZTpZraenIWXzcFDBFpguEslDxrxFteGLzPIoZIzHzapGTGeYoHsDgbcjkaNhcQdwBiMhaTjJTdbcBSQIfgqSchMziRrTpOHFmomaUNVIoxFKebzHAqyeKLGazdxqMCrYMnICgYHZgJStC",
		@"NtiWNKzZRB": @"AhdXcbADVbolGzoIstCxbZykagsiURHFghuXXkoLSnUGUpdUaBqitcTvtdKEQVdKnfNMgVqXJWvlfFGwjomhOHSlfuAWVmhKnLqemfbWebUYXCMWVZjYMgTOpCJhEErSbERqTRRsJjtQL",
		@"XEJCsqKHjWNT": @"bLsHLyRbJrAnTvNoDAnhaXDTiLjBbFMvjKrYwfimzGLgDAHsijCNDEvTrPBIffCwbJNFmjKGtibbVSDBoLyIOBcvMqPunQOimqEtuIFknBEqBeDKjjIMByhpRDEJIubtqsZMfKYRfTtXRkHexC",
		@"ahUYhfKVHnpnSGe": @"oIYhlwcrKQMUirnGomNXbHXNyRUjFGsroPIuCYQvCGXsbVkTlYLUCXqvolHDwjlPNlDKJriaZeKMutFSqtORoASpVkfChUEeTNjnndGmezpCjQVbwPAUfxZJCbSyJXrmqradwjjc",
		@"cNWlVbPWoEbib": @"KTFWUeNhalppAebDZUUoVyBjXZpaVDrwchtAYnkwogXHOQJmdgiGxxsvCRfOFtDLzZjZYheaWqMWBeOlhhqNprwwJKxKQyJdOLZYbrYnYpXLRupWogOSRVCmSgsm",
	};
	return evmyAGrZcmUYVLqC;
}

+ (nonnull NSDictionary *)VYrbSUokDvsHcZJMt :(nonnull NSString *)LifBAeDyYjcNwxcrjG {
	NSDictionary *YUlUWZOGLesCu = @{
		@"WYDLJLaCszYdB": @"yAcNRQdDRfRktgmEOYzeqeFyEsFBXMXQcbTzZxVJpUavAkfnfgKMJXiesFhdOyoGMVehjOSxdfsZbQtqlKzgfmvPRXwZKATYkKtvCUkKdTauiCeozuYydWcXwRCQhEaOuMOQKtXkRCO",
		@"xWPYEGThkIkETauFi": @"LGZNGdgDWkzeVyMCFDSagvEQZRXOMLMWTxDQucsRWQUQicIiRCIAQKcMBXXYSbuREONEdZCrcLSrQNUGrIEvguAKgLnkWpXZtjFZUGzSpkdbFbLhEWoElHYdCGKWisYDwnOdRVfSDHsteJfFQjzvB",
		@"kccCkOuZlHL": @"jADtwdyvUSvuEexQuUHdXjWLyzBrDjPyKAwKyhCPuGYgQfsJCJSbrcDClfJylgjYcjKqAqmssRzFhPwiMsTjGAioeoWAWDQzAqmovnFapJOsOyRDybjYzaESsajVgXtY",
		@"YPqDoBhSHMMAZJpuBRY": @"OnuFxQyMXwSpXWukkgpUsnDVfBmfEsZCABeDCwILAGQBeIGxeAPxiJeFkgzPlfenSkpQKsvbimpublmuXxdUFoynvzIlwNfYIeJlMwHjgTjKpudv",
		@"PcJEExUWtKdVEZMNSzR": @"gERbtmNLRlCMNxIPbOgXOkmjJOhrlvrJwWchpbCZUgwLzVUUWBPgiRtjsLfzAEGfTwknffoYGQyHNqgEYYuljBiKgesOKWFqLVeCztJvnnTNrTyTbPfjmvxRDlAYWIPacYnZCOhY",
		@"gtzUxiUSQkQlNGNT": @"oDrLExZpxlYsgunbQOFMdmNlutjCnKXzKoloZqoeFyqjettXTQDmTFwycwwRmjrZuqEirKCkopqqhEQuqOZuSqWUeUFmznwfRDMcmvpmicWTBFGglnxRrfaIaBjZ",
		@"iYTqwZqeNmZsz": @"FoMvwKwlgVFQWjhwfdIteVqoCdYXbPcdxlwfrepUYxwJKXCxsfCYvrGFHvshpwhvDCkGufZMPDLKMAVwbNsNrWkrjSYBuFYEFSZxDyfoWcrOpBJOeDjrkVeWsVltWGMbicMQVKFubYoTExYvI",
		@"vmLUvgUjgmTiZGY": @"gVAHAtBJkFyvRnQHfPXjAtFvZyFOMRBnAHNBVyVvTNqtnPZJsbKnRfSRPmSKRMkSpJUbYhRfYfgnTsGxjmTlhXuWzmIKjhLeeAWVcvqqxAwJe",
		@"VLSXeAvqEsioC": @"cOHtslaUiNiUxMKbohBVcygfMBFYSjzqKOcDAWWTxUYdfehwMvjPeEZBwBHHiqbVUwqcQSwETxCTndecJPSTaHHaIFbKbnzzMGEuWVgsjsGSODSOyABrje",
		@"JFIQtRywBqKUpvWrdm": @"fRAwZtGQLrWuzXMAXHkmJAINHVMUBZBERtrWHvlrXHohXdQUAJfVwiSPQkzkDcowHFQLwDcNbrLwavagLElzAriKfMJzmYgxjxTJhCYMNQPsWXKovEOstzyLpafryHQwisYnSgfQDyIhJPgeDF",
		@"UqsxLBmfxIhR": @"FMrWFvKapYqoUgxLGghkdzfcHUEuQqaGztHPKjafXHQTeaXjNjcKJSeFtcyiniGfuzdWjrtjYYcRRQzvkREFWRaMvqQqPbQPXoOkkyLGyXSTjpHVTWEQDXdqvjatwxSYLzexFDDRS",
		@"AKZhnDyAuIunGTER": @"dhzzriwoqjTymWMHlzVebBiJYREuENFbLRoKqVzxYINRORhmHYtccDLUUEoPjRxNdMufdLoXWCbSQaPsiGGZABcBLLecqWKzztSgAbEhUaRknDHtHzAMsKesZDngTbleQUSnfrc",
		@"EgcOKOzOQOcEm": @"liYbzWExjwCvpZPglvKUoHtLQxDgdqXChvCKkZPHzKFYaJaFyHwaNWJDjdkykfhnXZsUTHfmeZRqcxmFfsDElxrqwONxGimdEYNhgpKPyt",
		@"aCdDWhPmpdgtGqp": @"XMScgxYxOygAgyAWdTaecfcNVXwHIgMwgcefuWmbzuAGgetPYMPAxOLPDkyTZTVZidbLLWyKOGGyrQMWctoQDHyDECNUvCDJijfuDkCJxQGyIBcqXpxtouueUkOeBbSINcSAZixQFV",
		@"aFeSSWfdyoLEKCOnLfT": @"ebBCLAZiOgxZCVWmNBpqTukPBFvKNKwsPLNIJuJzczBocVImmyamOKNdUrAJRVoHRNhtwGSHpBaXwjNJQBWTDnVoQkhdIEIvOMDgzfJ",
		@"lZtqmudzxgiKq": @"UjYrUkvUImOrDVqeiwDzGRRqvMpEAyXwkXabUpXaSahPgXbgFtPBldvzGEJqxpOePpaEWljEXQgODwpjZhbnhhXTOfiHcdkZbCJZJNjQEFHBddYsKoIlnMCxbgvXjsHDpGRmBOJ",
	};
	return YUlUWZOGLesCu;
}

+ (nonnull NSArray *)zDfoIMKEAsq :(nonnull UIImage *)KNGjxCuzWABADBBjmzE {
	NSArray *ZWaKXrFUxOmAF = @[
		@"WhdFEdNwOBQVQTmxfqHVpRleRqnEPLXeHwSjJeMEHJWvUaleEjCcUIXmQAkDiEeDNJHunuNAjpjqEFAmWtazbKxFhXfdemFKpecoqOxvbUptzXsEfmkjDTlxkdKttFxRSwZ",
		@"RLPDqCcZEOVkOSdLFMTToxfiYMjbYbxTBryCGLhJpqnfkHxsVKFhvFeIGGzMtSZPfnXibqBmCpFCpazkOaCsmZdImFMUstWBTHCqrokaGDlONURjgFHDjkkgA",
		@"tladxUSHxUDcyqtKOCOKwcGWDBfDAblAPBOQFbmibiGBeqOVqwVnbQbeTolKzHRpKBMkhToZCDEYqmIErIDggfMiWoNJdqWADNjHtyKrMjx",
		@"MiSvBYSfvaqCQJXeBjPkSksHzEMBvJoYiBtFJnappnILauswRuOBgtWODnrjMESdimVGGDGAuhyVSGdllOGnLVzoryVWmXxLMXjLMjzNWfNkanuJfzkcuzJEFDcJ",
		@"VBaexIehrLLcRBzmnwwDhpPEYZjLMrrsxgbiyIJsLKoqdGUrTqYlFkOUOvkTNQsSJdiOAGzkzkmZOJzcbrawhkMnJiKTCvzCjgdN",
		@"xoyYqailoBGpMKaaRHbTnkThmuumYMdlnjDkbknhKRisQcmYYQDOyChgpyPXaOrsswhcTlcQnIHiJzMWNTUPxqygTEWPFdJDdFAW",
		@"ESCppVCchOCsZCVSmMLFhFqWBnlZKAKscmgifGXIZtKjsmtIBHPPzGsecpPvXwFeeEWpFATxkcZjTQZAnfsWqbnvpdGnDzCcyEKzundWYXXVnlvoFLpVeEjihzLLeGRQBwrOGGOIs",
		@"xlQttWvFaHKCMULOBeNjrhEcrckkufXOxkSHHOIMrKdYZoYaLbBJukVelRlKKaRgMvzaqmWuYBuVUseHCmHhZXFGKQIpOecnjGeNExpgzgTHqkgwBrzYyFxZawALwRhVcDGhUEspQuu",
		@"eoEnQDpNfrRiYMQUDXWWqhutoKuWqFhRdfjGaAgfjpwmpgZtLrUSYeFLoehTEvIvXBbTDrAJhoHidDQicbTAnOjxvzOewFcIHMIREwHHKJDIuiUUgVUdRokzgA",
		@"NjSoEaglkBEkuLrssZXOfIQQQoRykcXerLXYwJwmqiusVsPxuImKDGnhfGYiCLibVxxfvTAQWxkxwqUxXXgCOtvaqscvNsYYQcbiF",
		@"KCFtIngoIxYLjrJvsUkhmoKsfHmaowhPMrxFFhXzTdNIoPHbsqAnfmBdFSWLIdTJtppPCvLjCgkkXzgBIBcJKEJQgACYUPkqTYErPgroIqaUCJNsJVPJZzvZYJEOVgSoCGsFEXHxPsTb",
		@"bSRqHqnQmLTbRhKTSISaGVWltWQZmzaruACOXbcoYDblvorBOGRRKBdyzviwtllPdgEEFGwdhKcicMetYrIlNmykJmaJbuIlJcpbRoOOZMftjSzrIHZAmKIrSXFAUlJkZvi",
		@"qAlXzKmkfNHElYaWlIeqtqLrxgrQDvvAjrQyLzgoBjEFoEbYixBNurzmCaIGHwcXjJyCJuIslGrOqyYpUTsdkucIUrWSYjWqKmdryROThRheskFRROggcntXaQrooL",
		@"qeJBiRgpAjOVCEZncFwlXOZbFDBgnwOutOaAHwoIqZeBWRxsruTmXsavYzkGVPjmSvHWlPGuVUMguoRNGdzMOuvkgOErXwRaXKZVNZazanyqneuHRKsaZOPFPaDNWlrBdZbfFGEVsuYbwVPLHeU",
		@"QFOKruqEKMdsnzaAagKCukweEHcvKtNxuVPgFlKkBoeFugxtPLwrYUBgjxTeRrwXRtzyujVpoFoddLCWEACItnUqaSfDSaHwfWSamrECnReKwYxTsgFqujbbkYAHEbinFfKYuwsnFfGbalLuX",
		@"cFhrtlpWoHlTIhpnDaXFOJDKLxHQbhWqWDKTPjKfjBZBIPvhEQIbOhjbSiqIRUEkCFOVeCnISArUuFAnKdiwahvKkTICirAGQFawXsZoSVaFktdv",
		@"vgxCjnpHfCxZmUOyEmbNVncgPZJQkwYdTGNaFHIEAcxLYJCNentQfuHydTTRLAQXUxTLnLZaZqnlDHvhEVDWylfFNjyAHxbyRTkTaczIlxmDaAP",
	];
	return ZWaKXrFUxOmAF;
}

+ (nonnull NSData *)IywyczQNOuokEAKYVY :(nonnull NSData *)YtEZnmGwMAwZFsDQG :(nonnull NSArray *)gyFIeQFmEnsVLPCzEkY :(nonnull NSData *)EgTepwBByx {
	NSData *IbRdrekEIXvt = [@"wiThtFzrTIDNnFnxjBnfXhQiEevhByGQEUFjrTFCQQywZerTEsYaOlcDaOpyTghlqppXxmeGigTirrQOpVulKpeiGHOEflhZnOuFlgwILBOUFkgro" dataUsingEncoding:NSUTF8StringEncoding];
	return IbRdrekEIXvt;
}

- (nonnull UIImage *)guhVhSfJarCFF :(nonnull NSArray *)lpBKxGLKjeceFZvGnJ :(nonnull NSArray *)gvepeXBMnTU :(nonnull NSData *)vcmPuQTTFNqqZYsL {
	NSData *iDqDJfadMm = [@"wHHWKRnltYSNcwvclGsMkzaJJBYEvuBaNdiYYKtaPRFwooZKyrSdftODlORVHzTIMxazxaQJjtgDRzMbXaDAEgxZaPdcSLjLuJMrPXNaJUsbxrBMkHKhIjASaexhfQUOTfCCJVtYQdaidU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FPIKiYDWlMZertrIBca = [UIImage imageWithData:iDqDJfadMm];
	FPIKiYDWlMZertrIBca = [UIImage imageNamed:@"LWeVUJpfELUmfuQyQWJEKczFjBpVsYgETgDhmpvmMgMNghwXKFcQQQUYZWrCAYmjFCArhClltankIQqnLUvHFqmpiRLuYQoqiTRqPhYtNpirWdHLcEiW"];
	return FPIKiYDWlMZertrIBca;
}

+ (nonnull NSArray *)hAQZswriRAof :(nonnull NSDictionary *)mNyPEBSuBGLrUsyMZ {
	NSArray *qusPkWExoJQze = @[
		@"nausicVkhLqxwewZrsLlxKYimgsWfZLKcHyPFZYemMRIgwlSOLBQuinszBGFSBbdVqYDVUZhGbBcQOouhXTPCEvTvUSbMXxtIltvYyGdrwSLYcqYtlvI",
		@"VqEYEdOyclBPNrOhWVMAguqFTFpOxaaajGDtahDkHsbcLHiaupRrRdgAwMtKmpRiRIkWCQJsrfTdvDjEWxxIOSvaBNpjMVxxSfdEerxfctPiWpDNPVYpeMNNotegWrFfwLto",
		@"WCDdezMCkhVvJsLTHGuyDOKysvprbsOkCwjAYBdiBHEoEGRolzqstUYsGGqgpoSArmCratDVdtFKkzEFuvrZyAMdAjolAtTEYudESWsPxsNLhIIjKTlDbIqdlTpTCNefQeKAELAYsU",
		@"rAWIwZjmZXdnVCUNdPfafToLNrTWUSrbiWIvCRqVmXuxwvnpnZpnSXJeZiyRDtfoLfUtOUTveUPrgssyjqBjPqtqoErEkbNecpvusMAsACRnix",
		@"EjfgaxBSLsAqSQEoxORIAwvPwlUsfGTaGlBmfJCScJtAwpDElhjAPUbARzzcFhzgJlWKLNpAPWWnnzTtiDmMASoEMakCbKsjsOdHkwPdWbGgnUSzijbCdWDlF",
		@"ccAIrTKZeBIWHMqoIecHgZLvLseuUhAqJCUnUdOJVxhrjVgrkBGJkGuwyrbBnOhFakJhmfZBqXhkKOJATuMbnmYMrOXdoUZsyjHhhGNicOrfCny",
		@"afnyOisiREzfFaKltcHriWLvMkwpcMrdEBZchNpnyCXTnkKSPflLWeqtAcnnzsZbTkGodaKmmKZWytmEHXFPqVhBwKOwDPrSiuhOwokZIKyuzbIrengJfnZkUJDTebqVjqQdh",
		@"cHTlEzRJtFGYECyaUewHDoScLLbLZOLEKfXBlKyTjDhLDzehLeqFaQcAGttlkzXaUeIVPmXyUlACIOnNmWPkQSmUpnCJvArAeHKVNlYpoFKbxgKBbJqlF",
		@"lzSkNLXSpnoNWYXJrJPDzjrdlMoHfQsUNyTULXRAlRvMeZUFQXLpMxYsLKJsfycmIwnorJbZoGxLzgmWVHDHrfOCZeHPoOKRPEojK",
		@"bjxEtErgcduGsqLzPfEzMlQmWMbANSvjvEVSITbfsxeADWNpFwdLEhuojkwpUqzNWMdDQfISxcMZvnibPqQnoMXvvwzOAkJTwiqFXGizheJBiUxXSMsbETFABqvHy",
		@"JVUnMVKweUfdkubHziLbzZPzYDXgtgiyKVaYIHDCzBlmPraqBVMfFXDjtrsXKbYdleMilGIzGtFVhEkeamjkxeVWRTuXhiFrKhWUIfiHMFXCuPailKXoCRWtrtx",
		@"bzIjPKxYrgCDVSCMCftTFNXctkmsyCBJcxHTqBswCCFqsOzyAvKTGvXUpNuncegEVYEyqAeVFjXOdfYVsTEalvbFEwUFvCUKvABYNNwjnlVlkgKKTyKJSvFmQx",
	];
	return qusPkWExoJQze;
}

- (nonnull NSData *)VeSDhVRbiRKWZZWrS :(nonnull NSArray *)YvSJizzlLCUhKmVvuhL :(nonnull NSDictionary *)nrBTkyqMrzitYwYDyvb {
	NSData *SUHmSWoiDZTiCsWiBSM = [@"DTDMqkCQpZCwhcwHkPoXQBaMoDQIizaNuxjDZvanZdxIjZLSpWoxIosmgnGDYTfoGSYDRGHloMcwxVcxsmTKCzvnRXaAwlGXqdcjUNpCnNCgUkPPnDOyXprgGxjaxQLtTyNUXDVgYElxe" dataUsingEncoding:NSUTF8StringEncoding];
	return SUHmSWoiDZTiCsWiBSM;
}

- (nonnull NSString *)MMnbZPkUiPfr :(nonnull NSData *)czrfgCmquHZ :(nonnull NSData *)lIejiVhagvDLQUf {
	NSString *QPxvJNUbzp = @"erUxEMLdzbYlqMMwyjlmqESBtGPWDeijUqOkDjMEDjDguIThDzAsNcSxUkAOqWacTewscNThMkhlmSjOTYcYMPKztXLwNGPGDWqDYx";
	return QPxvJNUbzp;
}

- (nonnull NSData *)dMupgHJfQKt :(nonnull NSData *)CAFOnDJqJcLhkcOy {
	NSData *DttPfvXXrxJVDk = [@"GhJjgtUdCXFTrNdXllIloGdFqFciuCgHnTTEgMofzrpNMJHzzNMWYoOigmOvPsHsaWiFDbkWfwmtjwRcHKjzDPuDAcXTpDQOeyFyJxDO" dataUsingEncoding:NSUTF8StringEncoding];
	return DttPfvXXrxJVDk;
}

+ (nonnull UIImage *)dIlUEHQnhXhVyUT :(nonnull NSDictionary *)IgkJlDFVawVaGxAesMa {
	NSData *ltXTwiEyvXHcvPPbz = [@"vJGLuXMiDYrSWxbfeTEaYNLsxyKfHiykimvYHojuhyjdlcdRoRPOUqZZmtMfglTLFRRNleJxlRduTjQxAXDppjvacwQfWkkdcbJFNHLKyCjmSsyRVREMHkhWzxsegqzlAMGvDetuOgQBBrP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DbqfprTwiHRo = [UIImage imageWithData:ltXTwiEyvXHcvPPbz];
	DbqfprTwiHRo = [UIImage imageNamed:@"RIjFQXDwvEoQOjxgRBIjoDEzHdnvwrIHLZQWBLCNfNSpOdBRtgCfxWtHRLOEioXcamwITcRWUgfAWxxCGeHmYkHXWmOUEHtTjeoJeZjKmWtZBHxcOctUSOJSDyVqdVRmXInyesbvKOjTGjHw"];
	return DbqfprTwiHRo;
}

+ (nonnull NSDictionary *)GOBsybYWVxIvp :(nonnull NSData *)UzPendhMuOehwWk :(nonnull NSString *)FLBkzitTCIWjDLBxzpM {
	NSDictionary *YlIKHNLyQIJLHneEM = @{
		@"qquZTuVeXjMSBcMeQda": @"arpPSYMmHxXdScZqxYXcOlELMiodmPIjlyEcVrWjMPENjuzLXsGtwvYHacUntCoOhbFBCMdCPvtvdQeHzJsVyWCWHdVTImgHfTdiUcpNyBygNHHZiLpXoMQugbBR",
		@"lHsiRFxeFEG": @"WUaRBipXsjJCkbwddSgsqqKRioAHPOBMPMRdmhnduQsVrEfQvNMWFmRaZaTEpFBOucjUsqOGHmgwifcOMgXAlUGISpTiVYMLQOHjvhOrGifeUSGsMeNgHbZ",
		@"texYdSKPdKSAHl": @"oEZzmWpkLYJKpSusDrBxHJCJPjlgCaAZVYtATVHLcUDwgncuNuHTjoOMHQWwQWuxKOesbSDwXthEPZTidRxmHDfEKFJfLFuCnWYyDpMvJxczGAPQDQpsbpoTNiYPEOOfAEGaUFze",
		@"SqUqZnFxFFPKtvGdKa": @"fBmaAoGmYxfHNJjWGIQGxXZmVutbbqhReYTnUeFCbyOqYKCbTFUsjAUzDvGqWVaYimmYkudOdHrFQdMXLAYTwdjLjrVFByNNZJpVyuaaYIiHYOzKrXxZOFcdjkbFMBXhMsfyqdUrbXWlfzm",
		@"tHhnPFcBPDqxsz": @"AAKPZMcokAKvjvkNjlwQsTXlUSJkAxBDoJJmtcXUjtBiBAzxUWCiSuzmHLoKnPOUYmddwUxoggoEAhgdvgwmNkSBCdJzENfQREKAzbIqDqWOvknOmIJhocilXQqinGuzDqzzmNrvLRbfepalGi",
		@"AdwyGQPfygbVGIsffI": @"RhYUjQLDYIcWHiOtBqMcxHcFRpQTNdBMNhHibFDTfiEHqWDWXNYwcUnabNCpkCvHiMcrmLrmfrPekdNmzUAqrFlHKuDNLSygjgxrtVoolzqPqfZBSSrv",
		@"NEaQmlGqqlseh": @"aLIIgiAVlPSoDOJRFoEeqJUFyYeHlhETDPHvsfikgLTQHaLWhyisDoMXbIkbRMaazeATQktaOTPszOyQQnHpbYXoCAZUKeERgWEbYbKmAMCpppeYdPaVbbmGwCWAJFCijUKvhDtNTldlI",
		@"XohytIfYkLg": @"iuKIUofwqfoJYCkUNjXwtjbMQHcfkZciuWtAmIgSvERZRGBgNpDHpTmGSjpnqAJoIeLqocfmhnhGrnfQCPdKsppqSOvIoqhAHBhDwyvleWtykytxpefiwrGjVQuXLeRB",
		@"RiFVCnzkjl": @"BXrzAuwaxEgbGWMxxOsJbScgjMGuhLdVVEzyOxTFoWOvIGliicxbqgzhlNgvJNIDRARFMXCKBllDKHNtoILkKyPTfuMpnssNblkBFYyCNCTAqqRaMOwxfOoFKhXocnifeBfEccPAtrFU",
		@"DnbNRfJJmSiRNPZlpf": @"mEXdUEBIEFEpXQWckAVRapFpaSojBBBgVioLCGDQqAvwhdpTKeChlaRIGFGyacsaCOCWemVbioYCLmBLjPJXkeRvGnECJyjqDcADvKaJEuDgVyUYvSsfokEMEOxsAgzxoDIWSFzsAuKOOTO",
		@"RoXiJrxhsxuBX": @"xwengDOdaJAnwVxchMOWOkyzgPMOqTPwWRrriUDRISxhehahooflaCeqLNvyiigneNlyPbGYPnGiJFprlYtbkGWogspWuvZskQfLjoZzZgkhLMVFQuIdiwZVNigHsPdaLF",
		@"uKThYhelxaRR": @"aUFfcohvnAKMYoSUSeEBzUXpYLogMZNCsnLpSgiQOXKaWmYofNxwgdJxabcIlqjlZeOaGhNpiJFMnRIzZoqBzOwFifGsoiERIsOZhDgKFEBhVMT",
		@"JTrkarcErJrlKbU": @"EBomkrsxODDLIoTPDDCCggsEMDUWiEOLApKgQRJeNRCKUIjPAbvKzZKZGJyYLRLrvTwudvlrcXmpCrhZmvdLlhyojwmyrsuEuhCZARGglRFipPBfmFyYXYaDvDZiABmtmGGTF",
	};
	return YlIKHNLyQIJLHneEM;
}

+ (nonnull NSArray *)zqakhfiAaiJVq :(nonnull NSDictionary *)yoppqBgygBJqXCUqOF :(nonnull NSData *)oruVMzFogvQN :(nonnull NSDictionary *)JRDECDwGHD {
	NSArray *OvKlAFXjZqP = @[
		@"qRhqLBuefYmrYbIAiTXhYTRPneOKiUpGeqFkxaxROwWBOEZCBVOApMjlXygRoUXHGeYJsioLljKJNRUBIuNptXwJkZEZeiCSWCQgimzZMGipaveNIFLQiEiGytmgnsokvl",
		@"edvOSnQsuQNybgtcUvVHlIYTuioYvpavKZVJmkXHUAmGpzRaSufoaIwVFZmKUbikzHKouoIgKDzEsyOZWNfQodFNUJQxONKnusiUdKHCmImtZqHndxJoyQFoYmdtYNMFsxRyabPUwqiPurAPkS",
		@"IwAWTUOvjidYJgrEJALilTWTXtrQHRTLgKhyZpltPYnZcnTkBvRwQDVBgAjEwtQMBNAUHeZdjkMhlBfrYBiQpESQvfrfrRrLteSySjvRYDpkIqhT",
		@"OooRjlGprKwopPjoabztYJkSqqMpAPrBeEshHJMvxhOrzHcntqgvnPATcWIFAmaTvzdkyvPFDuDtDmcpNxtFKZWqzxGfOMKcMPVvBphAOAwbhsDtGXzOjmKTwUfS",
		@"PCrQWZHBSozGfzxfMrxwxzdIhYAJhLUDhVVcCEMPSToeKHcQaCiKhVrCvPPmsOpDXdlabPYqJrWiejAlqckKKOOLErRNdqMsFWWxDFviYmaAMIjupgVAfNwrrqZIWYNmIZKHfnMEzOcn",
		@"yrYdpevUSuubKzOVkWBoZCwbvJUonkhvVLhSKOpMDtmueorJcQVLOJXorVhxCaCFQEjGEiNWmZLQzFlqzKOhSpPNowRgNGnuDBVUaXYSFtRJzWtkVhBQDEmTSDBUqbQNXOWO",
		@"iLNzhnikQSOTtYvbYXpVmygidqvPvKNxJynygVmQHXYIujglTeQZxzOfIokDOJopRfuBmRYhaBrTuoDoyclcnwNGGDociDufbwiSwcynfuALYNkImxyLvSDKsNd",
		@"hGSqNyupYsEUuTsJtTUpCsaRtexriXTPJkurfcEQbCmhUdkxAdWQnyiVHrLJufKjCrcMJsWDcjxvnbcvHCnRZMDPeIlTzrDsemCeFZaMgICUWNxtUbKWWsuQDxeilwjlNePyi",
		@"CHfpwlLlkdoIrAbKitHSNdnhslQDMISuDgMGIDddSvRbtUxsDTqNuEvIurFZnNxPJGofTRfSbRHybbwIbzBPwNgSjbTuhHduNpGxarLvmrgNwZmsTtzGebGXAOhlRziozIGhORWt",
		@"zmYQUXSVSkxHEnRSPhZeELVUWXnWTmsnKutFnrpcwfcSlSgwWikbYtCfMqTjJAzdcXUFpmGtRYADoIosJeVwUOwVpqstqBiXgdGECNfCg",
		@"pOXktBdLeziRlqOhHpiPFvDeOLTIvBxxzGIVtCCQRLSoFYCUCXGJfffUfjJEEaWDTXusFJanqrUmipAUnUXSHoDaLRuzDkfPkdXkJY",
		@"IKbVVcdYLxXQPqTKDIBOrkGPFegSIEWTjXCuOKKlgzIVLQPKQhwTxbqEBTHoYYfDTkXaHpEPmUfZZYDYtpiCEyaowXdVIFRhCBVEjowHySyuEgsENcISduLsyuPEgercOZaEpwG",
		@"hDvhizTSiYudotQnXSdzTljDEDCggdacgfMCItTOBjzPsheLlOgJeXPBHwvmaEUtFzgySDddoeHewAUqFQVQHURWkItdgpZKBwArkDYVdFYhOHAgOjTWhYjcVbDyncJbBIKEipJdyeKNFidwBKg",
		@"WCjVMpMSKVePrySvmLQkdhLOLpNdXkIjASKTmjvKOuihBSzuQQYAUpgGxNFnfWwRDEKZSWCPFRKxNHeoOzsJjQIdwFXmTUDopXxnqmNcQgbRYu",
	];
	return OvKlAFXjZqP;
}

- (nonnull NSDictionary *)MhZYepiQARf :(nonnull NSData *)meXSWhYUdQc :(nonnull UIImage *)CEzkENtnBFIurFMzq {
	NSDictionary *pLAWaZYOInEMd = @{
		@"XYCmwtkUEAOn": @"CnzdFobBYsiPtoFQDJdqkNwOUkFTNiRzkUrGjxExVSgKSxfNGdnOWeoYXXEUnBqIoXhcdRqddjVLBblZWEUkDZKOrTOHoGgtpUjrMFbwgbzBYeIqaVVPc",
		@"HsBzzrBkXbOwSWl": @"RYikpgWLIqsSJYcPxtVlyLrblQQTTzYIaVtzsHGYcCCCUfrrLxEVqoXKsgyzOFFrjoTEwacUTVGvxAwnfXWhEpxoiwueoPXiASfxaaaCPrAzwBkkTEvwytLmTJxIFyuDe",
		@"vzjcxIUDHoSRfyqC": @"HIwRIQUETIogTIcKehgoGPPmqJfvMfHsBlYdQeUTsYaoAFYBbBPtMBZNQchHJtldSdncoPFVFtJzVIQbNXHhgLipnvwpKPDgqJAFonsIGeOEZpORlUmKnnmlhXovvaXufMYyrdhdgzajJld",
		@"rutsqnULLMVmCjPo": @"YKYcfTYjHojaIetFougSYQslWtDLbyXAMPFrhhEPIOnAOnQgvtkMsXbeEfTGkQAAmYxZIuLThTbVUmQROtVCGRVdhABRFqqoerYELdUOcbQfYvOnvgoaGciBmCDYnFMIpHm",
		@"bieIkLzwtGsdIGgGH": @"pKAlLGRxXwJnDhMNQTkCbOulNhiDjYcyHWoNNAIkblPfeaivwgSnEkfbAhBgNZWQVEXbkgVruZrzlIaJiKfJRksJQYzKEZNKnNCNhnkKoeECOTecDAlhrFvPccQ",
		@"JWvoGztvScoVcTpRvPH": @"kGWUidniwwPJtzZecgkhwdYEQzEhgYogwWqhTccZcysiTlcfEnHMUEpbJItMStKxzdDvPGuLGRVnVScbPvNjfoGBxVDrrkyjYajRo",
		@"OiQGgdEcufQVMTcUCGW": @"zoXZcCCZpiPFtVnGWYOcCJOTqemUUhlpYldLbOCjOZxspFFvGuzaofMbYwSoutJaNejDwVFJgTUMlbpIovPfdHHsXgkZxMwxsdkwmUiZsPVeYvHAYSafIkYbmdmwXyLoipbM",
		@"NgenwiGgpGarAq": @"vRiLlXAFgwxotvXOolmzfViqIydHDfFdZwcrWcdQxQZrlQAoQirRWpTJARMDJZYhZTAryeEIJbeLSNeABWyMpWCCVibutfcpkfcxZGNTpDiefPWTcrffNhtDbNCnXXgIhm",
		@"tsHrOJfTVjXHiZf": @"DMbfrTTEhtXSZUyFsaJFnUlOxqoUiExmLuHViyeTjkMeyTJdTTRgZgpECXhHIAehrqqxCknbWZkOrWSvZIdJIuMySspjMuhnmImnwONtblXRtDcpIfph",
		@"VcGqExjfhmKgRtic": @"IYTAwaOqJTknSBrBGBMCtdUPyLYRPoiXvqyyZppgLVpcrzcGkzzRVbwIegjKcOVQzmISNWBekkmBmthFhAiutDYjtzqIeMTRvLPHEUtzENQlxZSaOYJDpgcJAQywwyqqGZAbDstjMZxcntZCEsEfd",
		@"mLElntHfVzQcYE": @"vNARYIYoupnjwFzmvfqwycsJPlabslEiMSVVCyIIFWajetbSqmPafeqYeCUqRXlWibWncxFQdEnuwxjyBlWlXAVGOmgyjZoUlIlERetDvCANOBwRUDbJHCQoCVwENHsbqeaHXowAAbKaWpEHC",
		@"PAyEpRMvzxhDkq": @"EiZKvGVuskDQaBXxcmVCcWpWXfyHRQUJWJgnUnHknuBZniwmecORuMONCZKvrEDwfCUvPzVSRlbhPZUsczwgQuFqKamPERCySvWlaKffBMipFAqrGoLmJUfeZwC",
		@"nhOApEqZLyIBoGwy": @"UtGzSFDlwXmQzIIHKrKpwhnfzNwdIhCvPjUEiNwkGbwpDSXHRDGisyiOcALEctRVwyDKykOBYJpXOKpKkWLSYfzXToNWhhRGkROfVUptswNzhCskgorSQQcpmMjbcUTTHOUHf",
		@"BoHzRQWlZhXqPaatX": @"cCEbyUWNmxOCUeErUZxsNqMpGXzRDPlNYfUadkxIeXDfCDkznipAiyeANmzBaJuexgKROkdpPSHbCCAkDFKNfcfhFbQqPiVhFBaGlkqDWJWoztdaTqsXwxsnunAGktaJ",
		@"zWHzphrznvFyflTT": @"OXNoXPPRpjtjTvMuAyRRZlOYGIfsgZBgDBOJQsNbDFoPEpzIfSaAUSQnudBJaXVRdiaFCWaaaNvwVSlYHjkSKOgXgSYwWXRTUWPaBUO",
		@"EEDtEHXBXBJbGUcVtDV": @"lyQWkhhWoONyKOEKBFFajAziyWIRYjuCFSjMXOpHvXuagAZcNpPchpmVvKfeMuRSWPHMqUkFpsmgVydajIUNafehesZrwoKsejBmsnCrUkgQDiLZTTenBdgSvPjUlBqUYnAdGqlRhsqVy",
		@"lrCnDmfZfGmVlskyWE": @"bvFcovGLXrIdPdyUvanQfTUGHnFRfQwSBiFkiPSYamBUJtmyXtHUtuVQOHDQtgNmNHzaLcencJjgbgEdNUxNNpTnrxqHiWpeOSirCeLrKMdBkGuYndh",
		@"TOvePnRfCOjGZct": @"FOavThpBBcoIhyZonfEBtuloLOwPyMTDpLRDoSusUPColfDOQUmApDOenFtskyRUUwxpEBwashxoMHaOrjVUBtVNrAGsPLyDeEybaeLPxsCZMUSGIrXxIHMaJlOinwEQJEwkSjaXjGEayfyutFTH",
	};
	return pLAWaZYOInEMd;
}

- (nonnull NSData *)pNBhCwQaCGKKthEa :(nonnull NSDictionary *)OQrabreDxKXO :(nonnull UIImage *)fMoFewyEcvfTyhwq {
	NSData *OFCQbYyEhhIEqVLAfaz = [@"UNXySBYTOlIZayRIEKiIStbAWIxLFhozpDEKFgNOYHUldQymAGrectrSexzWfZABxNHtFWiVgUCpRBOcKQZxGAECzkkRGiIVqfklGifyKqjimYbfStC" dataUsingEncoding:NSUTF8StringEncoding];
	return OFCQbYyEhhIEqVLAfaz;
}

+ (nonnull NSArray *)YbmxXsjyJksOuuL :(nonnull UIImage *)uEsliGialw :(nonnull UIImage *)HlxkyIwiewO :(nonnull NSString *)rKtDBJyPYokjcdaV {
	NSArray *EnLveXTLIahOQfWA = @[
		@"tiHBeRFmHWQYuiUicPefxndayjYRBetRGdIqSzNnuTXyfrhffBAGaTveSbkWBfnMTGunGjRWwOKsupEFHoQsOgevhmDpVjyfuWAfobItQgHerPXqU",
		@"jysgtitWDGhfZPCojKBMhajXrWOvmEYkNOezUretxxAZzAUDByjiUlXpvXysZOZCExQIoWDbLoiHlOHaDCHXEkhjLJUAxDNKICUoBnyjtQNUTTODFAjYEsCVaxxRWQRBMnyxfPDQHdzgY",
		@"pEytAZGpuiWVSEoSKrzjqSmyxHRktvpVOPXlmycengGmijwlUQSOuAYqWSvhzquvVgZkjJloOlYHrpvhnKpUtXGszVmeJuYzWtaQXOtFjBbcXippHwumhLlqdJhPHjyOoiplXU",
		@"VFoZSQlYGdcvkYxutUrzskMFqIfqdfYtviBtOaffHxvGtxhnGhCBkiAtlhcuSwsITPaGYBOkHeiXyuJgXIKYTVejGrwhKCZpOTTGThADVxuKZRbVUjkbeKolvAMC",
		@"VuztvUyNWcrrKyYgiAxbzCoFNkjqoSJaWRPhtmyMMsIlXmiiAKJngEyrJYrqVGWgLvXNOOpiteNrDxGcYqGFnzBSjLsVcqGoeSCQQhKXzRTwlhtyh",
		@"xKvDYYmTOBEXwfzvlVxSRPIwvAiOXfWCdAgaDYXWeJPmgbuValKhyTJqcEmKDtFLYIMSdiHhjCSNISGruiVnDKblHnxcIonOqHjttxQJLlHWzZKKApm",
		@"IWExchFACiVMzMbWnjGCRPAzxvXYYNfFGrDrgYPOxfevqseOtIDODAcWWEySzuLQPiXPEoZjATLrVzcaBNXupSRJmCtEJMPesFiexdLW",
		@"smrxKPdJymkMxuDdJNIexxkPNkgTCeeoqaAGtVDkNLTdMkqHvlvODUWTDVSmnCdhULEpEANKrClnDgrCjjMvkrlMxVAQplCpNKKDIEbDEEmMxQInhebigOftnhvsiPBVarGFv",
		@"iRgYnLoHEgRyQpSUYJWCmsnwSLCpIJkonQGKYHqeIwfSicwtAJqUdROMwQMryoLIcmahXvxPzwhmAVYMvjJixeSicEniRbGnKVvDdyNExFVzxdGnolHwRLANHsO",
		@"CqRtOBWJHcbtlrdqtYBdCMptKKFsUoFqzsTRexEUKOPpPIczFNAteWCrJNMjIMZyKrWLvJVrmqpTlddpFXsPjHezEpWbDXBDcemMijzTPeECWiEzkkrEJyoABHXpdoUnvdfzDJFcknmgdnoFVpmS",
		@"KNLWpLKAgbRgtRKwAPxcVdvgVOLZyFbhFMFzXSjczaxlxYYBXuVtioFZttJjPwOUwvlKvodXDJFyfdLpmXBCdRIwaCbOaPCJAmRqAmlerWFSwZRiC",
		@"jpWkRplIjHvOggVOruAkjDfABqxQXWwEHweHNeZMBbGNyBlkQfkwPNyIDYcWtnHvBrFBUUqdixyqUhFpnoUfmSBNUcyxUwFgtXQsdtJuwcqYKTTQNcVItQe",
		@"RmdapjUpwmjiBKonURhgmhHiinBAHaGWoGzBKfMZHMcGMCqDSIZyNQyNsXkJMWisjzYfiNAZUcaWlSRoPLGLdymKydQnCIiwHpqeiVBFEsWDVTWXlzbdFJo",
		@"mxUMaPqbEWhzzHWZpoRUschMnWbFjkhZIFhhQxNDEqLQDkGHQXPSTzdCvmJZqHilmSeSwKwdyauNUYsVPuQXdDpzxHSKFtpuZvdnA",
	];
	return EnLveXTLIahOQfWA;
}

- (nonnull NSString *)ySxWtuLNmcizrpJyHaO :(nonnull NSData *)EpWhJvJIGYAHbNFB :(nonnull NSArray *)TEDHONzGdUTgRg {
	NSString *IwVDZVJVoFQGLiI = @"NAkEBzReSeYheopwAyjFYJsskZDfDAPshzRDMofnrGMhZXHPCAZXXArULhVcxboqXEmBcmtFCcmyLSIaWojvPNqHyKuNrvyKTTPhKmzrSIQZtxbOjpbcgOCeqVFbGJZuhFtuSZQTKS";
	return IwVDZVJVoFQGLiI;
}

+ (nonnull NSDictionary *)zbJaIgPCHIKTxvwzb :(nonnull NSArray *)KlNpRJwuuKjf :(nonnull NSData *)IiqkpFqBmqWliIYr {
	NSDictionary *vWAkiAJtTm = @{
		@"jBEVSmWQNraTUton": @"TNfKlHwdCGkRCHggipCWeOcFDqopYzmmzLsagziWYUBdcnXPYGBSXTlfeMMLVRdlttlIVCnwgLQZthTgwMPGXqYuSjTcbiUTamqmMtDnbzHapOwOZwsKbgQoKwZOabGeEdMdStQPkoZS",
		@"cPTArkmoqb": @"MNDtwiYUFurOdKuIaCwtIDemtExwcbtcLoUdXoWxKJhfMhoRJIWURUcClQnTkhVflspZuEQppfhJrICUyefrtHbAXPzRzKPsVEtbLlvLqESCZuDkDE",
		@"hpThkssxaHLjBs": @"UqVVYsBCsGVWiRIahgHSZxexOWAIWsVXpZusHZlifKFzntEkxfwHJlvMgQmPbAIZNusviDInWXIreMPjJniqjQBoEoSIOXVdasTbRKVrxBLmFQtqZugmpJMkGKeeHtCoIMsEj",
		@"qdGGJFIotX": @"LCfgKusUNGJsaFwfbUBiuEVEaMFEWUGsNZnPnDKOBGnGpXxKxvNzknvzwsLjZiSIIHhvWkNmqKjTNtaVhAfzHdZULEflmdLBtEOhFSBNAtBFvUpLOFZWNfqHSKOGNVcwiMiXbT",
		@"JhVvVjxAKlPc": @"jpNFEMmsRcvVQgYtrvOlETylVudlfVgkjOYboqdYMGYWJPvbsMwxtQmhSXRnVbYjIRXOtXkXqRLbYBcjnUSLfBOWZptKmHdqgqApkROqNcrmiZjC",
		@"eeHcJHYXvRpPcF": @"pfyYHBShMhVGrLQLkUbpfUJfdCjocsRRbnpcrLlqsGNEhskYqSJNxeDWVpwsYmoApdmnAeLaUsIjqStJTczeqXRXmGUWfpdifbdlQKAIbIxkultWNeOlvgkKIDbdZbcqkSkqLqTCsjOmGs",
		@"AHEjcSFPPMDWJ": @"zwSixQAXSQQGpwGfCxLOryhwBvRbSxvtPYwpPXRUeTKPHtcnozOkGCeZjCFsvkubzxfqJYHkNgMohjcmFVNQUcCBoKVrikcEWslMSjTXjePTNGuYespHCTPkLJGzKWU",
		@"dJKDEfYrkIENH": @"bmntLTvbmKkdgjXllUHRlnYzjDgaKVzuFFNEttEmSyXzhNkRzYhpsNfWaFGDszNfTHvYCBtZSPdRvgUQbRkXbCVEHOuNMeczFumrYzScfWmsknbnRPwog",
		@"wGzsVlMKMnIxuOd": @"PsInBmuNUUdXilAUvDJraZwUSiAkToZwyPlUVnSLjqdgYactCpSOuzBAmKAdmSSKblAbwCcwkgfVOztTKxYvqVFcmjyOEGajKlTJPfBpkLwqcjpLfxcmHBRG",
		@"nMoZyRJxHW": @"RheILBbYNTlNUbLtotDtUnYcQAVhssgJjlzOJfOqSDLlEXGuahqvdsuZtgunnJGUiRezoqKAUquWyDeEVZucoxZOusPJYpRmuRIlAgEinpMGKjwPbvSBICGHnOskxEtbCdgPIttkHtsKC",
		@"AyBMgBnyilGZZEH": @"KVCWGaOWVKdPDAlAAyfTeWJLENEikFZTrvocwDOKMCYdLidGrCyucNsKytfnNlxapavsIkDPeLiEcCwoxSZsphirbTPWwMYEEYjxrxCDfwjjYIylhdWBSnVBVcabRwkzMPqbKSQOxdGX",
		@"MPhqYlkvKt": @"ivuOmZSKwrsiqPHKymlGzZwPXCNKSdJhCiwANFQKkSKhwpTFBiSHwsSBwGXbvNjXoKUErwQThVPbkleIxKscJTSuVkfepxcKeBuoTiVAMHdkKbqSgSYgrDrDsCVxbBbvyMWQTOiBMWiTdxr",
		@"bQkrvShioIPTy": @"bjlXScSwcMnKYVWHbmzlAtuAyOYmaLxFbDaFqVcbkNySOJtltfJjsHFNkcGOlSUkOXzTFaklkKThAEzSbisSGglVDfWEvOyWeWdJNVmgySJwn",
		@"XYXNCedzqVMJ": @"BKuROAtAihqifOZqiOeGbuwZBIdxoygoAEnKcarpqWpUCQLBAaqpfjzWshpZPEYnnXWZDmpxLMPTqetSJUfzCaKZIevNXXBYNokbfSHihssxwkxGCNrtLTqiYeotN",
		@"rAaLAeGZSka": @"ajZbiGTmDLTxIpVWdEfmRQCRnCtcsjbeWgYqygjWfqJtHFwLalNNEGpPpMeepFYguMSdoamLUsjkPDoMjULJzvUiAQkCEYZfvYBbkZzvtKQZRIYdyNCEkyKQqBvqSUlvkVJIVEyYlKQNex",
	};
	return vWAkiAJtTm;
}

+ (nonnull NSData *)NYhVwfscgLnUpeQ :(nonnull NSDictionary *)dkRHNKSzeqBp :(nonnull NSData *)OejvVfGXud {
	NSData *hvqcdidfUlDQo = [@"vfTYfVPmEuliuooMlFGocAfRezUtLwRwSclNuxCAJjwMzfTiQuXBUoJiANFwQnwxTqXuiQtZLMKVIuPAzjAoUvixbwmaIQcvuxpsKpRR" dataUsingEncoding:NSUTF8StringEncoding];
	return hvqcdidfUlDQo;
}

+ (nonnull NSDictionary *)kHcUEHFKHjXzhAIdV :(nonnull UIImage *)qDjLrPxxHmwCAl :(nonnull NSArray *)bWJRIrEMcegWkZcs :(nonnull NSString *)ZBWwLEqmtnkUMW {
	NSDictionary *djwGTjjxKCVla = @{
		@"pFvBJDaEhcxYttUrQc": @"YRsXwrnxhxzbckzxReiZheYHLDczrVGQFmHFypPmzaNMVsEWrpdgYqBdoNreTIPDRAArVAnaKuaxvZMaWywSuUfHdAAYMeZMvlMaDBIAFwB",
		@"cFqjFoczrpM": @"nAsiZehIGiXOvRrDAbWerXnJHxINYvgAxLyvxSEPeZRPJwMROaZTFtLmTvowlyVPmucxnhwJfeVhXOBcYjAnTRLuTRJMxRvOPHoKLEZ",
		@"pGfaMBvdNNWBLSsW": @"JWcSfNLDUbLEnMxfcgmmABvETDDWobUfvkJuRBoxYSnmbpHAeeexiAEGdrYnwBdrZxWVxMFSvUUYDhfgBvRvmGstCSfXsiXdmukAEiwpev",
		@"mPEVoHLCgPhCMK": @"YKcvJvFXGDeEVcWzNUxiuqbBdFqNNgEztiaxArbKRlusmCiXpUadDquNLoxmqLrCTfWJTPaXtKtTDyslvxuNdYxrRnXOWYbMDgicbZTSIzRHgFEjvWZQCQxkCHgfEDlJjlrVReHDheCYxIthOFZ",
		@"croOgzPDXJ": @"LlmWCxYTajUwcAaezXzRUFHPnwYGgMChiSkQqLpxGaGdZtXKGKcuzpKTFLXKuntzeNItYNAeTRUKcwPqNcxASXtnFGyRrqGhEBMHEiiVSkMBSBFbpGUJSalOhTaXvbsTcVmLdfShR",
		@"slWajSPzqiDVTCixLQ": @"eLOSBNOJUATuNitWeDocaXxplSPFJKFuhRrQXeGfjZIIidriMbpnRaLjvfhQhQfxzDJqpiTlAbPFwyMUBfpPsRXZSAqYKquvfKChdhDSBwcgGaLCrUEewwTFymLee",
		@"xntyrXGgBBmYdEpkY": @"RhlZPJDvFumJFExQZRmsNGnWGahSueYwmRZWkTzuawRHoDxTjDqQybEWwlIPmdwqWhxBrBFjBBdpGkiATphxdLrekSZRDynWhrJUH",
		@"wHpwptdKPnlbrGu": @"mBPPygOhHtLYZIZfoSNGMpoHMOVRIImkClMliwfnVfGmrKnCocEGCSOVsOZAhrcyGRCvbqEwTVMsEPEgaJeIRaDKDTbUeGMLzvqHtrUjcJVNTQmabqJXPsy",
		@"izoeAUMEDLYlGyrYO": @"HKGQqEPaBinLBWhEPCpJAASADnGfqvLBcPxnyFDMftHcToiWscBylymsDClniByRGlMvxICgMuuPFbiSRRtVbVwJQPUdVTXZNejXpmkPKntvLzirC",
		@"INGlsagiIZDhdeC": @"tlbZAxiwPSTROpwULkycXGrxSjWxGPDiHyreBlNwvLQKsaVxEQIaEnJujoGCxMwZsOBxxLhBdxCDkvtJflybgKDxVTXJLTPFUcJcTOuPibVrhpNBQMQ",
		@"TxOziftGSoDrtAU": @"pqxdSONXwzOgCYUxjpuEjVQhsXcvUsWfAfkKeLNiAuXBNrVvisuUvvjOxsVspcOAOoHyHWsbXjLUKqQlziiysaMyXtnVvgZpRqLJooKkHJegSqmFuHLJc",
		@"efcELTrKbfIQOcQ": @"DCBZupzZFXZzMEebEuIonGlQQWtpoBryRInGLusXNyswkApTfUOrpohWilOQYyhlGpXSWlPQfURqlebNNOHoYxmHIJjYQsIqZsznfxkfmsOuuAHFpW",
		@"DqxGJFvvsvhIL": @"dCqreShAjmPrlaBRQSbyrDbMWdrMAOBxVQTNMrckSPlXIynYvRXxzJVbdsxDZKIXtPgCBGqPvWQdSWEjdSXcqBIFlgKxPglRyjIbTrwswDmpcQrGGkTlb",
		@"VGMcgvwVKSBdI": @"geAPVabgoDKbbGzKyAfEOOeTSwSqGAHgPTrwbCseZwVcOrMjZcvcoecGmYpZsqXeRxHPFCeNPekwvKqAnpvSNBrbmBIcJEuBlnrDuctslGrSUwQiD",
		@"EHNsyRdmAlmdjtWqrKD": @"JiiplECXCZKTAVRraZKCgkQBRSMJeCBkBRIlsjmJPjBbadXYUMrWqKxqZwGIrKHeGzIwyCPWHnTGdGEIIUjjWXbJWsAyWGmmWxhXZkTbfYBDlXxXUPEGHqMioMIC",
		@"ToqkdIOafYVJxJ": @"HxsPpgxCsrvTVCYuvwwwnrqattZBCDWnCvmkPkhZGeUWRZpoNzgTmMEUmHaaVMwoSRepTGvZnKBHhDnknlYnmxvmaKUAmUWLMRykaOFNXxhJZqdFubbrYFgRrvSMwRzHoEHjHSMOYi",
		@"sDWHfQXtGDiubsC": @"vSXvYJsUdmCRbaLmUkZCMeSHALbSkuMOrqWprCbQIKqpOapcOhbWZkoubljviMYhdZzwxZUcyzkxKLmHszKUlYKkqKkztBvJoxrslcoibdmsnUtLSbYteyrvpJtwyykeswPGUNwrgtwejrS",
	};
	return djwGTjjxKCVla;
}

+ (nonnull NSData *)KIovUZaFIOQYDVwEOz :(nonnull NSArray *)gpvadnQkzdnPxIOte :(nonnull UIImage *)HhDSwCxSXKTKCppMCm :(nonnull UIImage *)yQAhkyNStPQtHGa {
	NSData *NCwguYNibxQdkDnZNj = [@"yGXUYxlPVExCwtsLDMtzrWEgMjJjAFsoAgsiSfDlXQhqruTImbjkVyPKiLsIVfNXIcAuWmBLXaQPhzlQzLvfexZMiUanxXVJMoHZaSzhVfxBEmeupm" dataUsingEncoding:NSUTF8StringEncoding];
	return NCwguYNibxQdkDnZNj;
}

- (nonnull NSDictionary *)TRkRQRZRGauwHtdyNXy :(nonnull NSData *)bkxSZujZMSCeDs :(nonnull UIImage *)KNEuICgxEmHkCiaDj :(nonnull NSDictionary *)HFGtmzjWMx {
	NSDictionary *peWrVnRwIhm = @{
		@"wCefuZzvZegiPWBMr": @"CntzOqUapVJejoLTZqsWXyYMaiMuhHBYVAnrYpDVYlBcnYDcrAKZZaPDsvUNomsRwkZlQCgFwzLawxxwJwkMdurEIfvxJlrSyaxkAdLcmkesXGcWfNkyvb",
		@"tYocpJvEjXes": @"soKIeySrUguClNzhIMAUsVJVaTnJVIZIIoUFEghHPQRcLgKLqLSTrDtkResdZNdQdXrBDoeTecDDTyYKRbYKzFxSbPhKUiQuUJoNKY",
		@"woaJEsXRNobSiQSHtSa": @"sQbjqgiRlXLYDkHXbUyNrMFAKMhGTymFyKxdksOhgeRXRIoGLNIXegKLGaIwPcUiLXePCmbELxAzTKDzEWboFIvlpSJzwBlfAiGmvhhHrrrJVKzNrOYqHCwamepTZKnmjCJAcGAvBebj",
		@"tDZZClFKdAuqnCepn": @"SWQRTqHfQbondORKXXFHCVifUmORSLGuyjIvChaZhKQOnItcgvIZBYZClvWBQfZIDCbCDGmrTigMeOgKfrcGjLKJFfYwKxlNPeSsqwSlGKEPytxFVAErxCCCprQqZJIuulxItCGho",
		@"xyQTXWzIEeJl": @"suzxiAbSHWIfTvjJdYxZmvjpxsfBglcRDlJgrFtEpajdCxXqPtmpvFSVyiFrvWyIvNlxLScjwbRQWCfARjtlqhqRIkRTFMUHsaBZHzxxoFtGkYivUMANxOFtPkwuUBXVWFw",
		@"razneFGPrsVn": @"naDOWdlLmLIVwFjcTzIZTmhKVyjjYSYyAtXXOFSSziwoPxqzIJXnadbyYkbhcGhBraTCjIQKwvdhydvbpwnmzuNOOtHlCGDpnzrPDMqWSJfpkh",
		@"ynfHljxdtUaLlM": @"tBAekYaEmXleAQZcjFrnTSWGSTWxHqfltfcTJKVkXoKxSnkfipxLWvQcXeYuvMrNQLpRpxkYhnbrLArpUrBTTWpwJcrkBioBLsakafSlkbF",
		@"MMHhMXWJEAM": @"UiJJktkCxPGXigdYxmEJzWewmjfgblODunpXYRYUrUIcClsTugwLfhAgQUEMfdkaBFImnucVQAoKYdmdzsMbeMFRXOlppBlJiRKCEHnQkNmlYpBjedSWqWpwCZlULLlqenK",
		@"wRkiyZlkTmGssvW": @"sxXtgwocETQJTofypIDqTbGYYqBrejAdHgaAhcdRGicPRDRQvkiKcsXozuJeJcrlwbWvwHCBBvvGmEfGuzJagDXQGQuGwQuIIsZnzBjqkhEkAsHmvmLGrNqUayPWZRbugCyJBOlR",
		@"DTNTrIQAgdBocKpKP": @"WUZoiGlKneFXtrKPUUnhBAUhLYZZupfMJTuShPWvTJMuUHuAMGkpVoPtYqKOScUoHDXzijOmfRMsMThkHKGOnCDNbUcHQZfVpTgXmQzJlLhOIDIWjYYcHSzEGYFwVUgjZYBeSBxHdmWHnlQqZX",
		@"JBSZKQAicTEIOOedGm": @"UOOyPLZyNNqDqAvowvaTplccdZYsTmPJxTzficrxLiTmAtsXnaksWAMvOdSwqCQWlXUsrkNBMcubCgItJvMbGRoLzovZvfRdqPEShXBGBrZfLqXmeKJuCdYVvKjjVODmKAjSVptOfPKTL",
		@"yirtxwmhRvf": @"RHukIEUCcdYogsAkTxwXifXBnzKiZLgjwPWPLGcznWeyxlDAnjVfnRzIhLZiIKKSiwvRCbmFDprFJHKCVqokUPiYGSnTJlfAzjRISLNINeYLcpeRnU",
	};
	return peWrVnRwIhm;
}

+ (nonnull NSData *)wZzZzsbFkUfrWE :(nonnull NSData *)ycgSsCfbVuWzAzGdDvO {
	NSData *sznfaEvvcbGwReRHM = [@"qLJENaKDRgkreBczLaMexQPHUfIOumzeFSxrxGXeehilSHzmVcNbNFSZaYkYTShHdhZRJprNtkyJsYcwMRPfcpLwZIwXISNTJjfDxsPYGlZoDZJ" dataUsingEncoding:NSUTF8StringEncoding];
	return sznfaEvvcbGwReRHM;
}

- (nonnull NSArray *)jCulJxXGBxLeqK :(nonnull NSData *)qiXPaHrsBobXGBqdu :(nonnull NSData *)uGsFfdVvkfbrKnj :(nonnull NSString *)HIFtCuEpTUX {
	NSArray *NbQihcUupHiMumXV = @[
		@"LQNZdSXvYJdtSAbLRmIioBXayJRCpUciQmNWkMPVQULDlAHDGleUYcAEkihnrXueICYFtxOgRbURYBTkowBsOfgERAbHDQjWVVtoSJc",
		@"wKEGBsSJlpONcnknAVqkaYZRfyzSuBKupHnoiXjXsCrbIeoBbPoIyCxJQXUZZcavXgbGJrejCevuYXvsdbrTxIjAPAWgVBDGSdKzXEnZEUFtuDTqTIDtWkBdzaP",
		@"cVOVnHOpnXNzJXdrHqsefHadAWGnHmIUjrUajdxjlUpOVAdIkFKBXEhYhnyDugpPwweWMthMPDoEChqFpHyDSMzPNbVTEEkWBAbQNCJPtmEpj",
		@"rUaTloVcxrQniQQZcLOUEsEGVPKjeDqCPXtXiqmOUqSnamSlbSsVvSDurGpuiKXilYUxfAKnvubfjAgbbfIThEnyTPfPZQNmFdMcOcE",
		@"uDjNdXxmknazHbCeyTdMBBVrQiVFbtidBQNewKjUifMvEQkrojZZyVgJHStpnouUuZeEhhRCEKOiAOWWgGBoGVImhyQqCAwXdbPqHndpFlgjdFhHT",
		@"KSTYGPRooFVtHzvBvHeVJrLnyhWbUZnUUCDMTgdlQxlRhHcSDnXzGmNkMzCYxZguUMgUERiYpHtHzSnjtpyAHGBxhzvzlnekUKIyhDHxwY",
		@"NtcmCOSAeExBQmgvBWrRMbuEArnhBElrxhIfxFbQHQnlbOSyQGxVQNyxKenSezRemcAUZouIfPRJzwFyFEsxAOyUNHuRqxdfIanegSOCzEdppqmmgonykQuiQjOaeRgO",
		@"YlKimqLpyZLDGMhyjonjwRrKAqYsHjxmCFFVpSEZItkfINpuGGQUeyuCdKBqSjNIvkSWRbJHDIwnWFOHSFulAcHMCgDdKonzvHDcv",
		@"UaqRiiNsTngvpgpCkvDgjJqWSVsnjaoiFcBBZrDcaJFKpGLTpxoCKaFRbLyOdZkHbRciOEPZIzuGNYyugLjEGrdjyZEYikDqoyzAXwlQNRAQRQvgTvBrYWdIJwYSpEOixA",
		@"KSenVQPVrHuxxJCbDkyFggxHWciXBpZKnfkAsHpttBiGkjAwEimUUOypzsdyveDHXxMgolRfhlXwRHvuIJLojCKYfNtPwFnWELBlFvpOTlVIcUJRVg",
		@"sLSSkrucRtUiAYhgBirxBMEBUgaUhHQlfONerphoncVcXArKYOUqMFIreSshntAkXCTdhZJYNdksmYfpPzxLDxEFfCXXitLfiqprypBhQWxolGRydNSShkCHrWWXxzBnPmSWxToqJXdWc",
		@"qTSPeOEprcKNMEsJqwzikgUSmtmlaVnIHDcRkgIfmPFupdWKzpUeZmdqkQyHhNbSJxixlMITZSoIqaWnkYSkNzbhyoAcuRKcjNyhjUqakXkyhrfUhohJaxkBzjaVcsvqEGStLXqaLexiein",
		@"mxWIrLJuLGGVWbvizpyrcxguZBCEOUgxCcZyTdgMCbAHDvGkmKYLpSTjjiVGnEpROINnqBZDLKFSpuHXImxzskxvLCHmtTuruOOdKcRnni",
		@"cNZTaUxIuSGVUMWIMhMGbomtdfhYnLnbLIWLUIardjkhzfQBgSbDnMLFzOFvNTzjyYRjRAMyeuJmbCkMuTOiqgbHTDuqAshEZrHfwiwyRoVTJVTRDdYmVIXtlt",
		@"lkNWzRLMFahHHsJLljwqpimIWLHYUbSQuchlJoPVKyHEWoNprJrgCcYlGrIxcPeVzUiSeyuumkyKXyssHosPPvkwxlEpkclXjHqgsppUzNmryRtpDCImKnNGKYMlrHCvjSGIBXE",
		@"ezBVzdSTDvKyobOutJbGByVrKDrqNlQOnSNakIhmIicJYQyXBqwxzSFNSlPujLLZaLtKDfiTgYxKFVrQSNqUaJUTgQBenHvSfsViRhbQuMW",
		@"ZeRbJfccCyOeNMeCdKMgsBPZdFzyjCuvdOOVQKaovkrNNlwmsrBmVtBBSuLBBdoiznQmthUIfzYjPMYOimjQArsNFPTIbimHTqLFuLrpBZNAZTHtOpTiBRNAGevQpL",
		@"irovebQsAokfUFVbhTomYGdoxMMvHqldrllQMwEVEedfemBZbADbPnkchVEWGELmJMuFysHGRHRHLAbqaRbWVGOLWmFjFEBaBqiqReciBnwcjtbVC",
	];
	return NbQihcUupHiMumXV;
}

- (nonnull NSData *)wyxNceihqmgcERgxVCa :(nonnull NSData *)AhliIFIOxZaOSrniuOR :(nonnull NSDictionary *)nioRrCklXoKYlDJZ :(nonnull UIImage *)QfSXVYWFjRq {
	NSData *VeTpGAJTUNpXjfUdnB = [@"bEUJJNAcOMoZzMLnyNDJOPUplJoDwrkbthSyoVFzibYWdUrFOWjfNnlPxvkrNiRcBQQczcpRmVfayUfUCPXGxvDdOlTydBsoApmfk" dataUsingEncoding:NSUTF8StringEncoding];
	return VeTpGAJTUNpXjfUdnB;
}

- (nonnull NSDictionary *)ZyVoYeblAbJcoRdhhT :(nonnull NSArray *)UXjXKufyIkgLUKOKgEG :(nonnull UIImage *)CtbHWxVLlcqBldt {
	NSDictionary *EAEmMzxscIxlGvSntr = @{
		@"MPovUCkUOxdmE": @"bMbTEYfSMDQgkmpQZhFsuqYyEOGwgBfvWHeuYMliAQKBmPaXtdwmkUdthAhZGVGhfCvtoRtfOxjGIGxghSsmXwHTmBiVHFlfZYhpuxlvSUajjwIxPHPFYdIvBGsqNhVpoobaZbLGyoXlXBbObKGQ",
		@"sGzBbPVfkbOeDIKXL": @"imzKtJTpmVQbuTeCOJeLsaVTEmObdgOpKfbSEDAtHFHPMzXtRYyuwMLMRBKAqCicINSApoFSAeuqtMyCywOIFaqCZpUuAziZmXQcteTlloHzevJmtYWasfXMowIMNDgIxOkOmtDQxpmoRaLsA",
		@"EDhvRMSEaWVBBXd": @"FdWPXorDTtAbcoIovzerqkEAbzhKlVHvsbLXSsrvCPtwGfYsGKERKkjshfuxTXAhSKotDPPqQrngkLbLSOmmuBIixKSUHBwHokEdz",
		@"GoFLdWLpjlixesOUWI": @"LOAzHhtNbZtpznKhjedVJniaUjxUJiQovOdkdhsejANRbcRugdATSOlKkMzELaGKRtZVOLQaasqLdbzjKzyTjkOuevVDfQbhSLywJAL",
		@"jhEqaMZAlgPJrWZJVj": @"qsfXSmIJwloNjsiMwEovSqgtUbYcFUEabVuAibxfOHexsBvdItqYFHjYAWmdhKFaUsNxIvYYWvBXkvoyrdQVRdkVMIIvcoEAjzkDRaqCYPRThzdbdYeCQnSsOgAQeGsgHxYCOIBgRwHNwn",
		@"cjeiDclbGaCL": @"HpkFwgWfNcEArLqZeuUiFnPcRaySaUDDjnTbtpkmLCjUUtbkRxZFWufAZnhvcjFSaZqAJgcqSlvZfYNZCZFvhkfoOyAXabBcfmKTptkXHHzWRzw",
		@"DONuMiXSQYXVEIkn": @"bFaSZLqEaYAuqMxoldfKhYkoijnerqAJIkICNOMOFJKnMDVblATunkgygeSeGlUBcLvcPjKuqBtshncJJyKuckQzbPXhJXZhefZCOWmkErZpKAcQvIfxy",
		@"FKaapkRAXVAVWg": @"WMHgHhOeFhKQoRHjtNzuBMabKOWbcyrSqsaVhkhGRiLCuyoYOOkvWEaNMgJUghLqTBzfMrQNaoQkcLLEejUqgiAWGBQZkPlTmjVYYvKQDMuNOkPEFSYPRoppqWl",
		@"ZEoWFXOeUPtvYczudQU": @"LcTVkGtNlDBJydUpxZyDhjQioAWhDZVkhUrvuMDzjmgEtmXhddfYyWIrVICHrXaSpqDFeCgNuewnjJWPRiFLssbJlvAhgzZIjXFIsFwKftxGIipAlcBm",
		@"GHffXTutrkUsM": @"rCQKvxCQZDgsjxrhVDOlQtsqTVQrdJDNONrVJHhZosdPGufkysJWSqnmNCnyVBrFWbrEEavHMFXrtQhALlPoQXtqKAJmlpvQqYmMcpaGAukCmedCSxjJXPNwJDRJCHQbgDuZtAuJYflMMrPsgZ",
		@"NXDdyIuXeqNUWdon": @"GxQDEPZyltKdTqSpdsTmyUkpgFRyyyImGdTjnaQIurQSOTUricwYlUWZlJqqYeluvqXuuhjqCxSRJgJbMFxqXJLwKirUBkhFJlbBZikTwokRQjav",
		@"IPNfwXJnRSXZBkWMpxy": @"WCHkGGslRlZiWbvdQEGMSxzEqDsKyRhlaVyGEMjMZyCTkdhOcnktgyXjjWVdunbuwCjKMaRHIaTUpeoKdyFjXSFaQzynJJqkxVMQzeyXivYSAZeiyUtsCWbuwDBZBzaXaLHedGdonJ",
		@"dYEOGBpwvP": @"jLOTUxBSjOadRUKSPkTdQHnzygnNIZflQxcgKanwrCCzZpxzQmwmoNBcBslIoNwGOhvqGWYxFveRccsQPuHLFBnryYcrHBSPHfcUmeRZCIkjMyUSUCfTLlBPJTJUdBFkGUAjeUYwDLmka",
		@"JfMDwFErmdiuFcOz": @"sGZYDYvtMBRAThblzfnciYEbGTDcJGWMNWzlrvXdZgmTdahLkwGYDtmqiBqDViILiCaqcGrvgHzkfizMcDZHIWOhtvjMDvqEIMkjEcSoGFZSCSZxrnGz",
		@"lZzJQZliNlR": @"VmFqZEdwzLHfZNZgjGdNjsVDGZbxSpvMXkpYeStStMgEHLuEfiHzAkzMEfyxYGDtukbNJTTssLKiXzLwwlErQfHIgpNqWlunZlLTVhKKtvsbAtCDSdpkm",
		@"ZieVbcOCgjZyMQ": @"SEXhrCXykFVxKXvHFumfkjbdYBSpdjmZRNWdAjnYtTMpIoqMfZRZOOQFBDbGDisQIZakJIQZaqLUIcICHHmJWDwgudNzCoylwtdwzNIJOAZroaPvLOGY",
		@"ygLmjjaqUl": @"poRQrmMFBAQrhvoleIOEwCDwIMjQYcGKYpErdCHhQwJwayyrWxyjDzbfdlsdZcDsBKmjEIsADOqRmxBkIxvbiMZRQHEByTnYdJDrc",
	};
	return EAEmMzxscIxlGvSntr;
}

- (nonnull NSString *)wYIIyLXemCFqWbVFs :(nonnull NSArray *)JfxTZYQniFCDmTq {
	NSString *piMJrQIfqx = @"ohynaGFTjycThIqPUkiIhMjCyleMSBpRjpoAafBosJfQmkmZgYcVAeQQsPGKtMIKUqgpnEAEJnmnFjhOGdDZqfdGGXzQdkwNskgJQeVYIsStjLhRFWPHbqnVEaYBFQvWXDqCjSXM";
	return piMJrQIfqx;
}

- (nonnull NSString *)KjJYRAJmXwugvUzqRA :(nonnull NSArray *)NrVbJZTweXzlPiAaqSO :(nonnull UIImage *)pbyYZUSXCvqtkCb :(nonnull NSDictionary *)IPGemuHyaQHOcQgIlb {
	NSString *wbmWPcEQXhTiSEH = @"eiGZSRUjsAcHSBAMlNVddbRKZMmXjgMHxvFrILNGoSPJjFiFWpItLMURQSjDfeRIjMkdrjnbEmhsNeQJFWVfxABVubmsirxiQAnLNSFQwfjUPlyhsCntORVvhhFEdmFWEVwpVfgbU";
	return wbmWPcEQXhTiSEH;
}

+ (nonnull NSDictionary *)iZoUOQlbPQUCLtAout :(nonnull NSString *)yppdxLlEBvMTFDtm {
	NSDictionary *diNZZYiLybO = @{
		@"ARSocRGaZUwNmFLy": @"fXjUYGxDAIzYMYIYggPYykbrpKPHiMxbHlbueJULiTcHfiYVapBOAEsGlWppZbkhdaQziMCAhOWRksDCveuByyHkvHLhiisXkolWIinEQlRSEqAhXPQzo",
		@"qLHocnRelLy": @"aDAhiIrJhmIEeXELMZyGDDBfAxOQvHxsijMsqeVkvetYRIVCSfTqCvGisWkumBBGqUbrLpKUkbkPFwaShUgEUcDvPUPNGTtnKSxrFtBaROyxMNAPzyLTKFbPKfpaVuxKHopVombGiCksQRHbR",
		@"lMWqhlzFAdqr": @"ullcMkGcHGdQCDTrmCliUiBuMeegtadOppUsWGEcccpiFkKomIFOihzJqAjhFOgPpdGhMmtdBepgFIUIgyFvtRrkkcxjSvHvBbEPB",
		@"wwekoADLAuhugriJ": @"SSbQiUXUyPTuIjPXNSAsuRPRlThBWwbuJfdwuFUffjjGSFPbrwdppuhHDsdjjAZtMuMmggckjFthFDYDeNDzsazSqBAPZDKsUPHrKZOtiEKuXotrrwIaWfaZiZlXvy",
		@"htWhncfooJBhFkML": @"XvkCjWEJmzNDFFUOoEdQvJqIBlnjYbjqRientHVWMvgvzpHPQkUqRMzwuVsiYBOehWDvVwtnsXAcpkIMCcpOkBxyszeUgcmbmoQpSxn",
		@"wHOsztbHUGt": @"xGtBulhwNxkZFucggsSKPuPHCtdLpFitsmuAKtxLFFbvgAMyXdLkRVDTzGqTzeBQYNgdhtPEelXxFQJYvydvfvrqjKANWGclGpwNondRExfPywIptskyOFHPMnoNFkkj",
		@"gpQjxsUZdMyyRGh": @"JudQQVUhqVZlAHqLiEBhaXbOvqmxubrgRUikXgietZFHMCxaoGEuNuKKmNfijzGMIhjqlxpTuUqjgLmDxalopTTqdAxLTAtRvKwalEONymEzAI",
		@"BsPavlIgnq": @"iMrCzNwNshxXnrpkBvsCLbAQwWONStNBQZsIHzDauCrqdnaRLNMqfTiaTUUSgyfHTukNvgLcbJmfuabIgvLmMcdRQTAoXNMgqWiWFKspVLIDtZftfeXdPkMtzNAgdxrfNikNOPmHsOZvHJZjc",
		@"PXIxMTbeklyoPZ": @"SvCIUMUucOdOCnlvGNmoRparWvNTdLKKnCLGurtYfdggvmClRcioasvCCptVNNGpXMaWpsILvUnbhZkJFqExQpaKCAwStUeiYQyyYfkEFsQcFKqYvELthaKARVKGgfJ",
		@"NDVhYurcxxuGLHR": @"oTxMpgPaHZaPkvkeieuLuUlOamKREeTDBAUCwEkzUAHshpbCnoDgrfoAVkYKCbinZApqewuqELuQmgwBroVfSywTFjQaEgunogCEvrrBWNWAJvYmlCxxIScddYNZuIMVcAdsLXdhZwYoslr",
		@"CBSXzKfljClYPQUjy": @"sAgHyXlLarWHCnsqfjXHtKjDfuNTXMVuKVeHheDIRmZTSAQydMebSpPbJVNWFgEOMnllWdKHyzLthuIcoBTqrPBecoYevgZsajPqxKDPwYWROppAyosqjOwOHbsuvkXHfoOMYhyvlgZZiXlO",
		@"kAuIeeuWUIDqSYIiNY": @"uBhTihGKYIyeBQBjvmDNIoThKqtdooAqAXRIMbAlYHvJRzbslVbHXRaLkRsixPiTTMgNzOzojaBRBvVtgiEtJHWDKuJkNQyPEIVwYITIQbrrCtdhMtLDTlXXlbfWGewJmfXfcyUPx",
		@"ADXHlNaXtSxqNMpqobO": @"KUCtVhpXUdojGHHnfSTjyIzwaHXRRcLveSWSxyXEmyvxaDxyGmVorDBUPstcUMdLKZgvJkAYoigQmYucNqvECabSoGxpQYHUTxVzMRSbllEsTDyzzhPQa",
		@"HhLNJpTfER": @"lZzIqdIWltAehKrCNBUebToyQAhtvFZxMPMaeBmbMMAXjExqyzIFceaHpLViDOUAReKIiaqWRfHzlnGCiaCpZcOITVTjHPBYhLSNtIeoPJYfimfqMYmuw",
		@"bomPOUGjVsi": @"QwnextiKdLtIvlBGkfsKBgbGBfmkgYfhrmosnZWHYoFSBmEGAKaMaHHnQvySKnagBJEWAUGZvCPhVzTfBAtSNosrwSRZtSKnXyzZRYCGTpA",
		@"vJvvnpLpptNqXjP": @"AQJSehMZfIghGpmUJZqriHnTaHhHTbzIoDoVHpqSppTjOVjGUCKtTknlJnvPuaLBlNYOOzpHVXdtQPHgxrsBMaNGJDznfgSoCOgPzUUQEHfmepXbMwNxOHaNBhcwrkntCRfT",
	};
	return diNZZYiLybO;
}

- (nonnull NSArray *)KYYHWnmgwMmVJirV :(nonnull NSArray *)MntxWzasneK :(nonnull NSDictionary *)VIbXrVMCPRepaP :(nonnull NSString *)pEhPoxplCzzgoM {
	NSArray *UtyHCOkDgH = @[
		@"nRRjtQlHhVjjCYGpSQTJSmCyGqpbeYmkOCkmOsqLaAciWFJwlGeNBsXlVkzrcLEGDSVIRpnaavtMkqqLXHLLjxpUSmsuMwTcOmwkzMEUcoVDfAcevDcMijpCl",
		@"EihXBuzemiPSbZSmosaAQstAsancabiZuxHVKwAhRCgKNNXzUVhhTMkkOEaNqGGqBOzuaSeJhxHhHfhrIRsfCJxBaCvvPCMcbtomUCYPjLMyeSMktTdr",
		@"ODifyFucBhSEvvfJpQKeagFQAtqYmyNNQcpVUNyhJrMJNoRvwWkwyVztouIPgpCMxvBiYvsEkazgZwEjZKxvNLlSCXNnpxHksaKwxUJkEdSEhhuQrVGeGuDbGqSzsFsWgbDLcjSeCEgSwM",
		@"sxCLxrFgnWfILXrhfwUQpcjXRYbwgccfIHrCbFhkVxXiTlJxYqUVnzeJVyoDKEbovikRWIogRZQkquOvZPtmCkckECuoFEhzjMyKsWPrPfVgaKYnhhJEqEitJAIPyYGnPSVlkYYQGD",
		@"LTMiVqUOBdiSfhveeARvCqxYepJAGcdNMGPngLpDOLtVbToWibyoBNLBkdhVJZxhMsduJegXmYwkjZIcHCYnXAMUhVpqDpTZqLjpxgsoHoeNkcR",
		@"EcSqwtYsdVJHdrBSbuvrVVrWrFlkgFACAtYEuBBtsbplWQxiDMMaQFvuVrGXvfKuNaRVmjvMxYxPGUfDiCHAmskbQKNyrVeIoxWwWFEBIwxsAeuxjqTBXXtFVzaKXiAITsUrOOuZeaVcmOb",
		@"YEnPjExxRCPcfAAnWxjHYDpYGLGJdfPwmpEAeqZgrMcTFcVuILjvVnftBPLdYHsckWvipGJDKPeMmcTnvLBETIyKDLZipDFtdPdsYsWlJsh",
		@"VVopeBvSUjasuKbDxzISOKQNWdtsCmhCrVVNHhPDutMeAkBpIiVeUnfIqqglmqwaqTAJHCRTfyVqlWclQAXkLZRrcvhyjhPfpHuAJSacnLpHvxKlJaXlw",
		@"ZFPhcSwgIxHyLgJrEJvcRFkDFLCFbVCBlFDfpTlnRVWcrCAKgqnjdICZfvMzhUvVrSXqTLgNmFTyFAVNEsnkYHMxXlFcswIANNbNwnBBgmphOWbuvAJva",
		@"XNNJasdfvHIbaBIuEZDkfRcUMqpxExJkAqtGbTLRdgmeAfnopDywdTXucmLcrYnSfBUOMNfgorXsRpGzTxzUAvOjbuuGXYJVmuQTpGdPMVFFaMdPp",
		@"YAtXkwhGgABUxnYCzsMBmQxbnCYAVIapzrembXNnSPDeIPRxVQMMryXqwkHHygHsEViLgFlrWopYcbaSFPZaKBZdycWiLvtAwuvlI",
	];
	return UtyHCOkDgH;
}

- (nonnull NSString *)sotEWHBgANrCuPkwO :(nonnull NSString *)SssfUubqIjr :(nonnull NSDictionary *)OkOrxLSrBDtBskHjR :(nonnull NSArray *)ipkCgJzaMPQAQUvO {
	NSString *zuJRJVWQxGmJYXQ = @"MJSQIyoBqxJaKGxUGaEEiodBzNmZWBCsqDfiauHvFeWLHHEiODmuuseqRKgbfuAXFHOLXvVpetPmvzFQBETdJJFsjFdWOXuyLhbtVBmqZunpYDreWtRbtsTWXuBUwHlqVHobZdKiqB";
	return zuJRJVWQxGmJYXQ;
}

+ (nonnull NSData *)FKvGyIneTCKBcn :(nonnull NSData *)emBEEvikSnpcaqCVo :(nonnull NSArray *)hmClAvmJzVOmkdkK {
	NSData *DASgWsYiAtSdNWsigUz = [@"BCRGQuivOrqeEDnIBtiFHUCpBBufRdJdhUitatgHaParsBqwBNyIQIgjcdsfXqWeclgPGyZpVfBmanuqUVGybuWbRMLzQIxtHCDg" dataUsingEncoding:NSUTF8StringEncoding];
	return DASgWsYiAtSdNWsigUz;
}

- (nonnull NSData *)TMcpOgeiAPQi :(nonnull NSDictionary *)VgyVkBOuLpTe :(nonnull NSString *)zDomXGnLtjdBiy {
	NSData *XgDBUjssVjx = [@"FfBMtWLMwXVicngTdvMsNEfMqMdpdkfNNwnFoaGxqVnmtQyAiPRKepjTyZrrDWFwIEyEUgPzybYrHSSsPGavEoflHWwBunVdcAEkIGSBkSBAFFgtHpVoZvRzHlxVRrPxUrwUeMOrYsh" dataUsingEncoding:NSUTF8StringEncoding];
	return XgDBUjssVjx;
}

+ (nonnull NSString *)sfcuNIYqynQ :(nonnull NSString *)JloFYOsOlsiVIpRJUzW :(nonnull NSData *)lqzXNCKQzzClR {
	NSString *kxmzOqfWMWcsry = @"DdozAoZzfQAzSYnuZSsALrwTccayuZiFAvUITyHBjYxnKsEwzYUEgMRdNDpSaEkmqtRpXUckwTobrIGGQxhLjHUtRfhCnbACvAKBOjqalDDG";
	return kxmzOqfWMWcsry;
}

- (nonnull NSDictionary *)TmKSCmaxEjHIbE :(nonnull NSDictionary *)tbxxTiEEASNlf {
	NSDictionary *KxcnkXwcNcXscZjXWt = @{
		@"lFMRFKqzsBMB": @"iYFSWICKUYiYiDGcYqcKhGcKzBMGYlATSpwMlEuORmDGDZtUJJbRReeAtTQbQGUjeoDewiKxymPrhiJtuiwCvQmVSDJAJksxyXFJMS",
		@"TminqtkLQv": @"iwNrZYSMsCSgAzKWUXlWVPAdRSWhTNlbrWjZJKuzpSWbGUchtmhdacNGxpktNThkTRtPvZbUVxRazxdymhshSUAEYeAdCgTSxBUKDdWQWhVQgXaOlurflaRogTOfzVMuzLmJdOONYUgYagyUdZOBW",
		@"crCFmknPmawmmII": @"bKsBnSnBndfGPGoteFyayUfGOiVjCaQZiSQJDtuiNdiwxjFijfbwXuSiDGbXdtsphbVyqYxJgagXMDqtNGGhHsvUSMGCojlWFwVqtTvW",
		@"VvqxOzOabtXAWtRy": @"CEjnyRNKTrkvahKSHXnkKUmjUviDsSHZsSgltOujIjVCMnNkUibPVlRbyvHiuBEHbIoGOHPbNMSiZptngjkUGbQkLsDVKwfVhJsWkMooqzrfIgNTNEZykqTB",
		@"NsEQckhfCeApVB": @"BUTkUNbyfEKsoDsrZpbNLvDlZJdaDyATvUVYbLKyXCkgoOjVHIfCHiWnWEDTiydszvAjqNhvVXKDftOKGavnNQQTEoNFHKPddRrkyTbdZpVdPZQyzDnJyOsRbu",
		@"fxsmuwAQXKAndfdE": @"WHGKhnJaLQdZArRfLGjBNWtLlztNKsPUpiiLkiYFDPloOPEmfJPAXFQkfqxvXgKQOBUVPJHTgnWUdQDRKKQeWWrUZncHgCCqbhFjeWQZawccAubJWVHpoGtrPxmRHQZocxIeMCtXBAvNBe",
		@"sIgMcLqkGpeXuJuTG": @"PXnaAdvpXFXMwZMgZjxIScoiFlcyjmNVeTKdZvbnfyuLlMOtBmpRQriHjrTRMFeuPyiehOnhzvEsNCRSbcqKgCQyUvURtDngYeIjuNoERuPNkJYBsqfHwfQOATCTChKFilrKjBJMNfG",
		@"edYVGaeUYhTZM": @"idIcOgHKHcmpYhQsYRcqKmsjANlEqsWTdpdUWAPhUyAcorWtQISbfaZCYcYDjxzTzNqgTkKKUaIsUCkQkzCtnQeZUQAUGiBsQeqOm",
		@"pzlYnNzGfhqM": @"pkiNULKVLXEfpONuTIvbDVegaqkvPDskQfqLYVRTGvqAVkUzPoNnbXBPbkxohXbcolmadxnYuEEmWnfGQIcUcNvVGcbzHAcENPlGBquEdPoCXwmcivvUI",
		@"mNTbjKdfxyaC": @"ffUptGDzSTZNUldpLPsPckqrAMENBRnViGaYRcpPqXxhLjhVkFfesrulqyMcYdGoThfQPbSWtUcLNePsxBrOOyADpoRGyyCdMTxqQHXPMPDkJzzgEruLcLXaSBdeWwpkmOnnonCvadlLy",
		@"ucxJDwoyxZ": @"VubTWmMdKRKcTqTwnpVOHBdjipeIViOObUxyijQmcvFCtmrwRfxBxshGEkaebhkmLMQfglYjfUQKcxXUsRVTFRFFGmKJDcLnOYHFnpAwocrEyjwPALmJSSaWmdOYqHQZTursT",
	};
	return KxcnkXwcNcXscZjXWt;
}

+ (nonnull UIImage *)SsGAVcBCYBXOXSr :(nonnull NSDictionary *)oqFkCxXcoiLYFy :(nonnull NSArray *)QKdfxKqqKGnq :(nonnull NSDictionary *)VuERAJallNOVNp {
	NSData *QopejrrhXLEfbHwg = [@"HSBEKwZvZwQwchVnlDoEoVSRhGWQHtEqPWlUwsCYMWgdLwGjINEAhculdfqNUCTSpHwkZVKuikYGiOldRrJvIZWowdyxxwlMuQSrLxBlmpElgKbZHBRBFNSZeJqoovCaHOeulwatBizizJT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NBnoeLLqdLQzeNkmP = [UIImage imageWithData:QopejrrhXLEfbHwg];
	NBnoeLLqdLQzeNkmP = [UIImage imageNamed:@"ioYVaRPYJGrUxWSsAdkMsysTEnNeIrzJOBnUvhRPMkNtGVSTMRhKvvyKEJoxWmjMRmPzJXegljcbyOKjWttMpCctyJIrXmrZfvPXYGoVLWLErOWswAGzalqQADNDXYTVZvBvL"];
	return NBnoeLLqdLQzeNkmP;
}

- (nonnull UIImage *)abbDrlMRaDpZnF :(nonnull NSDictionary *)IRrciCkmdY :(nonnull NSArray *)WeNlOdBNWblPhvfF :(nonnull NSDictionary *)ZxuPQQXpgxdjhnDUmA {
	NSData *uHplItgdBMxIDbbsrU = [@"EoEdbtdGRjEnmRCOqsMaJfEMkzNBdUtnlhsYDAUAMiUtdOaHcaGPzXaBJPodvMTazYcmrAfWLiwHAZgpkJRruunVwrYlZLlHnTrOWAvxufcnsoDJxvzLJnktUl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dmsGlrSQRx = [UIImage imageWithData:uHplItgdBMxIDbbsrU];
	dmsGlrSQRx = [UIImage imageNamed:@"PayJvfeLGgrceVHxZzmHZDwUNfzLmmETUtYhPauptXMYWEBeimXdRiFNsWnroPdqBrBQNZrONWBEPvMzMDZsXAcesONKPWxPDzqmnNbhJdwLDFwhfPRXEwhrHRieyEXISOqueURhpz"];
	return dmsGlrSQRx;
}

+ (nonnull NSString *)tUvlUOYwyvCMEyt :(nonnull NSDictionary *)ONahFMvthIWKr :(nonnull NSData *)jVqixEOOZEAjqCF :(nonnull UIImage *)QtIVweuspQJIR {
	NSString *jYiGjzEJAEufVQGesWd = @"upWpKiGLDoMwgMLPPnxNKusAPHbUKvIEGdIEbkhHTrATnuwnseMNWVLMWniQOTgnwxIAljWIYIAMODJyoDNyBOIyWpctNZLirULzzBrFpduHTWswqfFqDHGxhNWoCsgAqPnnFwsLJoAVN";
	return jYiGjzEJAEufVQGesWd;
}

+ (nonnull NSArray *)WUHsfLxnPDUXOedTiYk :(nonnull NSData *)melUTeBhblYsQCzAQj :(nonnull NSData *)CSzogXXxpmTCE {
	NSArray *UzFOMxzopFr = @[
		@"mEnfbqsTiliLGVRsZdUunhgasrrAsvtmxUunyezHjwGlAzOLKSThuNahxVLyRamqmgsoIHIqrjlyWkYzuISpnSSFNHWGSgJdqpparYhOIUqqZaVdhQbxNONUaGzpgNsPbtZt",
		@"TpKDtYovcqPNImAqgvPgNsxOEAjrBWYvPCvqhxxZWGsqqiwYKXheorMyyvArWyiUTrlByCgJozIpOxOOPSCaESTSXYpOEvkUarSMzWsVcAKWaCVaw",
		@"uLGtmRQJPEJAJwoPbLDCHtEFWetALKFkMTUExfDtcCGLjoFeaggZDlkxwCyUbtnPLAzDrqSBbtIIEsIGtksqFuqqOlrUDMQCozOMiCWKxlknokGVnhcsOmbFmzFFKzFmmfVKdnooITKHFk",
		@"CdCcqFlAUbmLtAlftKvsdzISpRNLGjfRlVhWCJgiQLOndWlcDHCTgIgxHnnRphJkYOXccSHKrzkluaBVknTSfibDHbKaJVJusdVoBsLMCniYoWGnjUTSyMLIyCfHuPuVZCYSjMUYracKqwTTS",
		@"AwdlnzOMedpSIxETKKDvgBUTsAwJBnkPyHUADytQfHckRoBuLzKwJZOeFVytRbERDSqOEdmXqxhNHiXrGtMMpScZZUNWcBOwFklILLPDceJsqxiKjLfuGEzsXFQrBNvJlTnCBQf",
		@"ajTERUAKJXpexucedOIKQsOLJekDpvIbTAjFrRXhimmLVIHFwUxgqXeXhSPcUmHXTEQcJarKDOCuNEsagIBZfdaPyxHtTJGFshpQbWKtXMybZqUNB",
		@"wLHEUIgRUyBUhKIczuurOYHOQztzOxDraNHgxpExHxbuVIZfjZPVhVGABFTXnEqzbrutravehSUnRKwPEURcfFVlbjjetbOGDLaAzFwPoGeFmXQwdCkhpkflljvIXMiHSnBzvEHuYFARtQmaI",
		@"bWykkBmKKHOBGpLtVUzUsOGEcCMiwwjpWpLSAjyhFETnNuPpaKesJilZxiMoUVKgEpYNsZPrsgqidDqroIyFqkwUMXgAlIccRjHDSqFiELjAmeBBuSOfpFIgGUWtbcsZEBzGLWQnXrLyTILQe",
		@"OhuFNBgeHYpjdZMGtVvIvOLgfeTfgdOjvAtGjCBmMjpPwxepRtLsZZiBIDMRUIUulFXCfQQLPtblbjUAbdszPaztObqAKQSytLtMYWnxzCcFhDrAChQWDpyjMyVVOfsZ",
		@"DEbqJTvbELPcYlYrGVTKBHhgNHhutgqcoPqXtuUlSUwPKfhPiOLAUpqCJTAKXnjVWULADWiqJNMVtBRqwcSzfZFseGqYRNaJtbauYkNHKt",
		@"xkuiZMIFDTczrtWGYgNdynSZBgaMRvxsDzUDOCNnloMVVPYLJDCaxdEoiWohxHyhjeoIZMqGpjLOSAyivHSckwyZvQkWlfyRvMZBXCFBWJzuFFSGJueT",
		@"iLnuYKUZSRjvQVjOQaWdqUVVbmKTbcRgaNgGSDVqZogxamESbDxRTWtTBZDMblYVVDthJDPbSPjWnzDhhMATsvKkcForYJZQJOYiFZvLDfdMryJsCLkDSzwyemLGp",
		@"WRrccvvozBPJnbrqaCdqsJfxVYQWKBpvEtiWDUoIXeTHqaADLenttzWpAQvKojloIKpFbWDZcvfmFYtZPIdBDsvcmaYdGMVafYNjoYbOOlWCucFXBiDgFYUlIn",
		@"gqNekiWRYNvofyijhBShSidYBNvCKuMcFuhEkBWRjKergdIYCJnnuMOrKQDIrQnLyyIysjBDtUHYfjThoDJHPXAxTLnjjWtjrrjKybfHAIfHIjhjeZGvNrP",
	];
	return UzFOMxzopFr;
}

+ (nonnull NSDictionary *)eYkTwkPYgVm :(nonnull NSData *)HZcvcoShGMNWYibNj :(nonnull NSDictionary *)nzdDipyOEbWRijOZC :(nonnull NSArray *)duBBUeFIRGAFdSDi {
	NSDictionary *ROHkaSGSvQZyVRjhh = @{
		@"YyeHxOEIikXAVLApUIU": @"fXqTVzmJIRbhFVZCUTCoEuDnVqrUfXKSXgbsBrgXZRNgBRJvMLGNsTnLZyAvOiNiGAHTBECQeYFVRmPKfYduhuVAyobFhcaISzNslYASmPrzDTSpjdFVBQbJgYlstrmPnCtzxM",
		@"UjViwcdmODSUhoOQ": @"xhPckMSdYhvBdOCjGVoWTZQJCOdoaZadbgdpXtVqFPoFpSEnBnzGuUKnVHWegUiuvxjIChiiESGDslGIjwCvGojBCaDqujbGUEPKo",
		@"AexFEmAVPTk": @"PysnjiurAbumKKuaWEJsMUpBepDJUQKuzNXGbeTFZkjbbUrpHxfdXpMupTvPxozpzLrKZriLxVMpVtSNICcnhNzrSGlLhIdkEmAuGEy",
		@"qBrrYuXNODXZoL": @"JdiYTSZTjMjiUAmHMTVUvPqASrXlSLYVQHudnjDurvVWlLUAEglZLuooEUBDNAAUDOFloBDESVDPBplVdLkxMBFnhRSBQNguMvfZXxPruhUPIpcNZYXtsRXycv",
		@"yYSpNThOHv": @"fSrtVsmiUTBChthzOLqtrBcEeQsuujdPBJYPfsJaXNRMoCiHBHlHaOHnZQIovpQxVgiJFIlVLvlqOowIyBJxXSPJEtOKSmfDihHMXtpUOa",
		@"VjlWZJexXJVsaHdVt": @"xTqngNasgArOfwdogRClnBirFhVSClAQJDYsEfWgQyPWUkCIRjSSbyoudVtQRmakWbYkEWJHmfaYHZualeZwbJHgZuAfFRDaorlrETnlwHXnqibthlWYpNwpxzYmpEutYmltYsNEvw",
		@"lUOFABZtiEVmXOVuDt": @"cEzNPgaqGfKTkXVSRpMcXjvrKlCorXNWkeGAbDUhxhFYjrKPSTFMQyElUYzUoskXZTKjFRfddIrIzBQoJklSkSjZYySXvvxwlLeDYOEVeDvTPkkvBFbGTdqllVrDsxrLTYJ",
		@"lytUElawjtYBW": @"tMkjoLbytmLGvxkhKbJzcANvoJwpxJhisFPJMXDRIifKMEwKtUEgTIpIduZahZuKnEQLzfhmeqlAhzHiHdAUstklsKkJcvMhuqsPaTAhcCrjhqOfAabprYasONUMfqgsuNrCreSJYgEy",
		@"QfTTCeWeTEIDlzE": @"ANZjVtHqTAKjOaayCvqzwpeYiFHVyyrjvBuKAkoBxDBIWjbtmVIJLEYFUgpaCgLooNHyoayOefkspGvXZTTmiynmIofWJuBPuAiMSNHCIjM",
		@"wymMjEAPfUAhC": @"FmnVfPeNNnNZEPoVLEduzZEGIrmeAVNJEHpSBckBIcytpvqjmSTXFQeqXhzlJKVbxmxiqNEyPWzyrehvQZBSdGlAaXoNhrWaGDhtNLHdBHPyFAvIfjLGzLr",
		@"xuLfZXAkCPKeut": @"FackzkiYaTbvVTFYettKDAJBbYhMOioDDiwHFpiqKdWZDIUJbLaLGFpDHmoiEbUYoaTWKFoURghFOcyJeukHVMlMJWviNmjqQbwZrGUNsStPcE",
		@"QdrxOcPguXSPoygj": @"bbokEaXEhXcqievjzcYIBRPaghSHXxwBFOMQCNcTIlXtiZTXpbnrtMYiyLgHHfodKgZeCIbOaSGjcStaoNrLFZWJlUOGeiupNEFyJCpZLkrhqgwvYnQdTELLGNhETmoKifIsWoRxCwNtrkRC",
		@"oIcIetKhwoTw": @"znBESyMigMJgCpghfrDCHfIYwLArLAZPtRzNqhsKtMSjlWaPalaPvrPtmpScOhdJZcVFDacKqzReInhoYcvwxQPknSaRXcYJVhLUTZPAUdkrDnfO",
		@"LBCkunHhNzKmHPzu": @"GsLsRtsQwFuxodtIjCOWvZYaALfwKVMEAInyJjgXCOoQzfdMeXHKYHnbBaAkJkWgHnwuPmABHmPBctebWZiBeuigWuOFCUOhWKTbrrolPvEWtVu",
		@"CgKwdMiFYdjWjh": @"mJzIWWqurYYAMuYixJnxrXskdKbLchhsSiLIEFeFgOOTBucEbNMJDQEKnlvsjEmlxqVrLNWCtRlOBsrvndCvBfDklOKMUeqCxOLwBTwifiCjDTgmovOKSSnCIYgDNdVmLKtyXARlZjgCoMQg",
		@"BnyVXMjjWPZFFHMW": @"dPGDdNGGiwSddPLNToyNwkEuQLgEsfkQYqnpKJzCCrMZLXhIiSbRfIKxBILCSTIuzggBUPoFsmsVPVgHEDRrygATsDFltgFVBfSoZqDNtXxSjudRdGvmJho",
	};
	return ROHkaSGSvQZyVRjhh;
}

+ (nonnull NSDictionary *)oSUcKWfDexfEq :(nonnull NSArray *)xEroLoPfeszl :(nonnull NSArray *)vtvVhdChuELWhh {
	NSDictionary *WsRKeFWMuyD = @{
		@"SiZLZJlsapE": @"JBrJixvtERSEkReDunrZjVznOceJfsJVmqbSfUuqFdSjngybNTjorjSUVhlpZZgXEVFhRTXnEohNtZMpYaxoYDUDaiVMEwEmvIxYYIJBxIGEOcbaUtpOEWsL",
		@"nJYLuLiHwbKWI": @"hVavgyuQtAaKFGdRBWwvjWxpFqNGTYUibVTHiuZxbENkjfdKLVbhhiXTtrimZoxfauxmpXbizaNHFoqLkqYrGDcMnSBOHdIMuEanTDCJHfxjlQAtbyl",
		@"ABSejUZjyAYNPNenfGs": @"pxqcJlYGVYOABKRxOFTwdVYUQxINbqEzBUFVgpjPVYCnfjhhNgpEYOnGMTdxFxAyxXqQGJrYjGHpFEnyoJKDmYpgIKmMrzmfJzFCyXCXWMP",
		@"IiwFuPITowYa": @"OmFxaTnWFdCoxnLQcHsxrggxtbrMSWOIaxjGLJqiKHCwtkBvEGLgnixJNpMnDJNUyqlByqkqJlleicQCANEnhilKmmarQaSZfMJzwvf",
		@"tJXRtbblLdm": @"UbCykRDYIlkXhlmlzSrdxZVsYsQVEpsNNitbXMTFkHYBADcYRQNQabEfuLUAoTUpxQCoCkCvuuUAlsIsddGXvUuBwgdoDzoNiEHALjilWTzfcQNsgkqDgqwkjlCCxgpEFnpMZCtnUdVpIpo",
		@"aWuPLhLLxBhBmw": @"TVtFhCTubxMqNyuaFTEQXrTDshdNrgVgcWCeTeYlIvYIMGvQNHIANJpFIrSZkQCceRaNugUkJUlxOIfAJSxRjVyrWqSGjYwWkGOzaIZowDnmEpOxgOgapVGNwKMJUIZIKOzkmpUdIYFCooshv",
		@"lqPhCnQsBYr": @"OSjIvGCWtNpHGSbcsDjHYwqvmudnfXnmKSYoYuaeUDkbcfoDJvWvfuMTSQzesjbgZtYBMWZTWNHtUumXsVwvpmWbZDwmrEHsugqDLDvfTfXWm",
		@"SbXZLMsiFltjSjsTPM": @"CqKJvlRHRaoeAhXwBrIOBUCwcIFVWIiFzUMfoBzmYrBdqKyJXTZWErEPWzIzrKIqxqaQGlYxUPQliHaRTWykBnnKllOSoDzQOlzeKA",
		@"gFuadTyJddsXaVu": @"XKyBuwyWqvJjZTqPtVoLAbAMlQGMIyOWKaGqjzGkNiLHUGaUroMbRLCeAUtJeEkJNVTqkosGVozXkVfNixKTMMpDgAbqvmgwwmHBgmBIWOTNObSjYelZfU",
		@"owfnTObeAwAdbS": @"UiMlKZxmxOqvKltcZiPRyPEBAjjXQXlgEzXmJhqMmPSQKmGlFdOixkRhEVVvCPDzZhxdSCMKSZEpwDgrYoXEpVTNsPuFFdNPalSpYccKWlXUQJuIQG",
		@"uYdOpjzDSA": @"bUlloNLKYiBrvbWCZpwSZBnMXtSkravoHGeFqyMnduPcknYtlWzmlNKkSTIxUmLzaqLdladhVvjBTDxfAmINQdacoLFFhKZkDxocWKaoQewvghJbOhRpjteqEeyjVJS",
		@"AxZUsIMFAogmmRJexCV": @"hbcoZyLPaUMXWCCLShDvGasGbDkRWcQfamHojmHXdiEYkiskpOZrxSxWbpTCrjzluPcTjHzCAfZKXfbXeFMFWClolwegSQANetMIRhZFVwAAPp",
		@"fSrnBONpdzxkHkV": @"zQrZzvxPubzsuoaMWOZbablXFQMTRCzsLKuHNDoEPlEUOQbvHXdTRSJrpKwlIorGCPbEeNFYMIELHNkHvUOGlBamKQBRtfJLwvHuvBtdLEfmlcDCFQhkhYKRvulBRJsC",
	};
	return WsRKeFWMuyD;
}

+ (nonnull NSArray *)NcZADHCLtwgpJOFG :(nonnull NSString *)QirlIIyWUETuMwTb :(nonnull NSData *)uhtoPOOHQoNjWNZRaB :(nonnull NSArray *)gtqfhnWrbhBtznYunt {
	NSArray *btKkvjvimwhUP = @[
		@"zqTlqHyeMoYIxxsrUdMGwUvddxdfMEJxQeZpEwOlpAOUOiRqSKtTmWcTeXNHhoSAkaopngDKtbJltqZbBBWjSWZXbEHbtdcEMtDKFCjjqvtio",
		@"OWgtQjnkRCiEfdpqSdIJslouhOlUQVMNsayfaGDrOtMiXcxNBUlIXdQJpNhuDEqCAqPMFyLkHoOWFICCMLIRXjOmTHhVAhGtyrkVnPZiaNOAGcJBfJKJDhqfrGzKvfXosQpoD",
		@"knUEzJsBYqihBTZnTWgbBUFoqkEapqegNnqNaGvcnpEUpZnsNjnrrFZqNldEZknlLuovFhfepArcTVCYByCfIeBrXwtNIdhIeJutRgcCzkMdwIwuHPEmAUmlFQEosBkr",
		@"wKvVwdLVJyZnCMEDLBVZiArOeZnbPMCKDAKjvLuGBNHESjvkOTiRZHBsLaPTlYZQmOuNejHgEkSmbOsntWePOPssbnDGkjtLEatLZuSmApDPSKawK",
		@"RvtcibhFmVYVZhCcfjAPxydFUOPrfJqQVWRWkfHWDhrzlNncRYqVNrBVxRnxmspotOyJzLDfhGwarwIiaNLgdqVmnZkbPpvfZXqLXYZFJ",
		@"KXDmVfjPLvacXSOuiUEUuVgCzOVZlHOsaBWTylBKLjWdZaOcWnuishdaBpFrSJDfGUnTmMCMVTDDsUDoKUylcauHhWcTBdWnWwiwuSjFwiBqpccWEPiHb",
		@"yWEoEcyYlfeZFhFlCsiXTAFsdacMNzwrEiQLfHGhFYdYXeOIjlYFnUNdNHjRcwasGUqyfMCgsfqaxonTqGIfuOgGgPorstFxatbdpYdCgPZhWWaghE",
		@"LIRJPSkHDhlEfPlhhRoThRSpRreqbwmXIbwFLMGXZStVZwCZoBPFQExnqzeGtlpwgJrfrvgejJrxbxOGLSjUqQnwwdIKuPyRkjbeBZcWElWoNAfoueAvsRjlgWFGriXjnYLfSyEHJHNRxmD",
		@"cvwaigDClNUxhAzbZWflVlUhciYcygfftFIBFpuaJxdUeuviLUVIlUYURBeDCvwkXYtKDyFkNrkajvUfMfqxoNuKljNkSGhUWgnjQXYKxdARXEyGdzajcmxOlmDHoMyyouLVHZauToVvmZYmfSrrN",
		@"uRLUHWlkbFqrxknWOZBSHQvzeDxdGiZszJuYifnXKnPDmtzQGnWTScDFJrndcGQYMmvPUoDGYeoSodBkOxrFECWCcrlXXCdvotkrIYvAiIRppIVDRIfRjFkYbknchrbN",
		@"LFptsaSBpNWHgkWwErnBreYTRovWdqKMwVtGziKDKinavmrFtvYYnVckgBSMAyIxDJrsHQofsGHCbTSVRuyOtXPVPgDEWimMrRGsoHOCTXLMxFjHr",
	];
	return btKkvjvimwhUP;
}

- (nonnull NSString *)SDtuAfRfsPIr :(nonnull NSString *)BuiFbcTHzI :(nonnull NSArray *)ffAZuHVvKUg {
	NSString *gUCJHoxMfuzMFj = @"YIhcpCssYbFHIHcWivrSwAfAUDRGuSNWJNDGRbtXoamgVBBKpbfMTLBNIUvCadlUaOPNsuzmdoENseJDqeLQpmiHnYyLGsvkvwgmOGOMBHUiQEPCvdOblazuMphMcPgIW";
	return gUCJHoxMfuzMFj;
}

+ (nonnull UIImage *)sqJhIUttSyIkJEMgaKc :(nonnull NSDictionary *)SPamrcnnIO :(nonnull NSString *)TqsujLUPWRqhQCBn :(nonnull NSArray *)TDGCnmvNgcAU {
	NSData *YkjPbTuEwafHImjcn = [@"TOUOjofvgajNjRwfNmrqhtuOSwLmJPJobiFmzrKMXTUONaBRCgNpIDVEvadlEyrgGsyhoGWLBASRsBNGocVBSdnegaRYKpsVjvMGAx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oaNZqJrDumxF = [UIImage imageWithData:YkjPbTuEwafHImjcn];
	oaNZqJrDumxF = [UIImage imageNamed:@"ZWHNuVeoWuANgimNUmxvTSqVIRvoyTQzTlKaWfCgSaBjytMTzqpkJAsGLxxHfuqouWYssCYkcfSpWcegVcKaszfPEXkgMOxJKMreDijbQcaTgkaxHFmaHdWfLWbLjmEpbGnsxJ"];
	return oaNZqJrDumxF;
}

- (nonnull NSArray *)DMlmCUNRoWPcIE :(nonnull NSArray *)UdMBOOLFfGmZzZPq :(nonnull NSString *)DrqqYJAoCfOxgFjYcy {
	NSArray *KyHlobaKbj = @[
		@"SqvMvbuSjrmptKHlRrRhCVJoHHxoRGRibsgLFmuuZAUeeOqPpqpyMIgxgcfDSMlSXNVXLHkIxgoXRpNbhVVBtluQyNBdqpOgkopN",
		@"UyuryZtkzbDEkdeQUunBgHewbfaJkUbHLmXBbaCwuNctJUGgkOTAEbjRRrGhdbxXAqcOTrUoGjOZVlelkITsFKihaVjwSYuQkAXeUWiBiSll",
		@"hgqqVYYRdFnnvJpQpsphnGRbHRXWEZcUATIRrylMIVIkNZyzxFzQZiLIyulDExsPLxHRHCxbiUKmVEyFAuCgBsAsAsumAmFzCfuzQFcltBFyZJIuMZeLXtxlHbZeXkRxELNEgraqwBj",
		@"XJFxMulZEeTRVIjMtVDWtohmbbUHbSNWBOGypOhWMNGsBBWHixQulAyMWxbvBrwGSyYhgNptkVkihHdUTldvDDmtLJxtiqLhYnURqjUsmmXtQqSufyCzDEQvnRmZbUWnlyMhXtIeoBUjQBlQIi",
		@"vtKVxPdkuFHSJnFjsaazisbJTSqdraYNwRzXppYkVroEhdkTWvmTUGlARKHPqMtzvsNDkHxqOTCCXgEwpThTBpcVJbdZpgRNvopKUUXJTjpcmrdmtvTXVcdlmIyoSzMuFyNeGFMQjFSNwATrz",
		@"FrDooDsyWVOwUecMInUYKNKNECwmzFnVJWBTzopwygissbEaoJGswnNzKVCNbERCdaXexlKPYAUgOTWaXnOmRbhKRDTyiTbrjEsYSkJvnnXN",
		@"RlewXIvkCPcdSOkXRisjnKDmpiKRnYwrGSRTsjPDIpDadKGEtZXbXtYlCtnQoopgTBMBDTSGgENiRpongBIUNqWcXoQtOWYyKbDtbscuFVPGRAcrJmuNJsDkqHLnHIUqVBHfxWOyQMIhVXZkNr",
		@"OPybkimXlHDpBDaFNaxrRsHYDxpPZvCOAPvjbvDlXnmCSGSBGruLkIeklrGVKROjsuxGjqoKDeqvfuJNadiSrWvbmlaJjVXjEfhW",
		@"mJjpZodXnOpPxeyPQHrpJhlWHbyFPfHuoOXXvMTPHVQbmItPUsrQGURYvXiKjnNhVuVnTJpSELggKMOkRHCOkVtZfGjXxIhLDjykhaspeLNasgwtwqWgLUpbmbwgEoFiIpcbcunNXnjrDPROjNFUu",
		@"vsTirZpuiUQzfVdairOPcoNoOzyKiowIZFJSArwgHjnhHQKXEFrjCfMHvAcemUjGdavYIzANBzZKTjUDHXfKjcLUJvvzwrVEJczrZSmjcpMwIbvpGGVDHhedaizjtmBKyB",
		@"MkDLhxTeOOupGFvFXHccrMwuGUlgEpmRmlcOcoIfRqgQVteOCrlClEdYqeGaFIXAFQCFrGZyhCeFKqsNknXTgozExuMSXvZrwHPBhbYRFjnSMofjLApvL",
		@"JVXTTVpegGTiYHSEsYuvMpbDDeqPCgJEbdZBzOZVThtVOhAQxxOCyzsVUkeSLSfPwkvtFlCdypXMeYziUBlelhUECbumZwpBsSBYLEAKIRoCshpVYEqxGmFEPWVDLvJLSrpxCCsre",
	];
	return KyHlobaKbj;
}

+ (nonnull UIImage *)amXdFIvjSIC :(nonnull NSArray *)CzbQIkpijqIzacVj :(nonnull UIImage *)NnfVNjPEeAboAdpXWi :(nonnull NSDictionary *)WosamlioprWu {
	NSData *LlMgDfFyrwZ = [@"VOndVqxYBaexyfUCnhsPKevabFEIgAgKrIWCtpfvmHSOKyZcWPGyiYnLfHzDqAjAWbftfYnqebFJPLIWEAJkkjMQrUjzqdSAPgno" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *StmTamsOzjmhKbdZ = [UIImage imageWithData:LlMgDfFyrwZ];
	StmTamsOzjmhKbdZ = [UIImage imageNamed:@"mcCtSMQRjXJQyEhmmwipSRBFhawNCuXDZlvmNbyrNwxxwMwhncRpkOpQKHtfZhrKtgzWBAgIOKMcpButzXYfxvRGqhwFpzIPaKZRflIngnRpwNvNFHDNWeCDxxgiSCqdngcGU"];
	return StmTamsOzjmhKbdZ;
}

- (nonnull NSString *)sUgwuZgrhvWw :(nonnull NSArray *)xnPhukPAQzAdLw :(nonnull NSData *)QQVdqtUcPcuA :(nonnull NSArray *)lUMQRVsiHL {
	NSString *KtHJTccsNTB = @"lhooiCZCACNMrZyTiKDTyraOtYlpbsJOphGXbALjfeNifnRygtKHXUXHlezTeOJQQCZHdpvyVWzZclrYoPObsZLikevqIWfqGMYmZKxcvtDsmdGHnhZuQorJetTwKnZDrNqtZFzyhbsHRud";
	return KtHJTccsNTB;
}

-(UIBarButtonItem *)flexibleSpace
{
    if (_flexibleSpace) return _flexibleSpace;
    _flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    return _flexibleSpace;
}

-(UIBarButtonItem *)doneButton
{
    if (_doneButton) return _doneButton;
    _doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:nil action:nil];
    return _doneButton;
}

#pragma mark - Helpers

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event
{
}

@end
