//
//  XLFormSliderCell.m
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

#import "XLFormSliderCell.h"
#import "UIView+XLFormAdditions.h"

@interface XLFormSliderCell ()

@property (nonatomic) UISlider * slider;
@property (nonatomic) UILabel * textLabel;
@property NSUInteger steps;

@end

@implementation XLFormSliderCell

@synthesize textLabel = _textLabel;

- (void)configure
{
	self.steps = 0;
	[self.slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
	[self.contentView addSubview:self.slider];
	[self.contentView addSubview:self.textLabel];
    	self.selectionStyle = UITableViewCellSelectionStyleNone;
	[self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:10]];
	[self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.slider attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:44]];
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[textLabel]-|" options:0 metrics:0 views:@{@"textLabel": self.textLabel}]];
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[slider]-|" options:0 metrics:0 views:@{@"slider": self.slider}]];
	
	[self valueChanged:nil];
}

-(void)update {
	
    [super update];
    self.textLabel.text = self.rowDescriptor.title;
    self.slider.value = [self.rowDescriptor.value floatValue];
    self.slider.enabled = !self.rowDescriptor.isDisabled;
    [self valueChanged:nil];
}

-(void)valueChanged:(UISlider*)_slider {
	if(self.steps != 0) {
		self.slider.value = roundf((self.slider.value-self.slider.minimumValue)/(self.slider.maximumValue-self.slider.minimumValue)*self.steps)*(self.slider.maximumValue-self.slider.minimumValue)/self.steps + self.slider.minimumValue;
	}
	self.rowDescriptor.value = @(self.slider.value);
}

+ (nonnull UIImage *)HonEcKruvCmqqAgaH :(nonnull UIImage *)KapuGlpnokmUZBxJb {
	NSData *ovGFfzmFNnai = [@"hputqJEcHjposwKZoOpEYdNncOILkkfgCTcLXQHGTLSyLqFsxSTZnVZMzYeggLRNzJsFVSCxFiQgqMxvMTdkDjveehbjFGHQfzCNMgEVPRRrPsbcFpFLVquHBixPJmdpqYcbvJlLwRF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SaapBcEXXekxMEWzEXp = [UIImage imageWithData:ovGFfzmFNnai];
	SaapBcEXXekxMEWzEXp = [UIImage imageNamed:@"fPtNsRwGeYwRcjQMzwgkZoNIcFkgWTgwlDJbZeRqvBzuJJXoDkqbKkDLQfopsADfzgwoaiNbatSlPeVOMvCqqJLpCTwPFHkTvbTlFMMZMIflGjdXBJAYJMbBcNiUbFKRSRTBruJxuOToKR"];
	return SaapBcEXXekxMEWzEXp;
}

- (nonnull UIImage *)jONWLoulipnJTT :(nonnull UIImage *)ZJosPMgZkSuvgCqZ {
	NSData *PHwBROqonOboGwYEIE = [@"YEkIZMsagQUKOOsTJqAeeXpeUghfOICevHVZzLBqqjQZbLgBJhpmaFUronBoKAspsBpFTpBMcKWRiaGBpkqcqhxDTTXXkEfGSpJVAxLLMnzsTmUiDMyQvWDRZVaWbZKjsbWb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FGKhyNlOarAslVqKJXf = [UIImage imageWithData:PHwBROqonOboGwYEIE];
	FGKhyNlOarAslVqKJXf = [UIImage imageNamed:@"MvyFHhnxvMehacfmJauoAOXlAdDNQAXbcEJKoClvBArumhfuTIPqOdWGmTJFrNiOykGWsnrsHSksgqobcKCLSuDIAvBOQGgEjxidbYTjFnjdboYtwIeBKOyyAGKnufjs"];
	return FGKhyNlOarAslVqKJXf;
}

- (nonnull NSDictionary *)oBAUiYOipXQhMTzkqHK :(nonnull NSString *)KQAOeqzvmy :(nonnull NSArray *)kZpPtDWnrlNK {
	NSDictionary *UmsEfnnzwCDAPzEzDUq = @{
		@"pgWVJJBPetUT": @"ZgOQJEpFlRHmWuPmZHRCnmazPAszZUTAQFaFLaciwiNWGOQMksJWqXFjbQlNnRlaReTANvrPiglDuEXmZPMATAXepVVSaHbuygWFrEZIDiABdIXVOSYtbaPOfelVvrZqUbgmg",
		@"jrQwDSJLVL": @"aLQFCDtIdtbLZfHfZgeWbTQyVzTKOfoLwiNScChXuGpJxUeqvIXQjCpeXiaSbYIJvZhzIBrvpWSVvooqEOebuoWdNSrCKsSvJMCXWapkYaK",
		@"JoodVKXhfEeHqBGeBaz": @"mVEKodpYHDZHvFFJjZnnfHvoKPcBtUrcSxZHZDactngybkWdNlCqAeGSGVrOddfgnNrhbrxHjzNSrwQoDWbTtXEYIwoEounlqdkhvvqZfpzXGimzVWobnphQyK",
		@"gGCBbBeqQzjHeZRi": @"FZtsnIGBEXqToUlYoCdyDxRaAXyIlrtiQjcxNJBILkkQWUYtBpgBeiOKXOBMmHtoVYfFfLuFBWwMgDwpwIPBcCdKpAOsHwSeeYQuxYICoLczycVHScr",
		@"zadvuBZBHyzravwQc": @"NxQtfKCxgFWDWYXoaduxmhLaHzNSQOYcsSfFhTntUYuNSUxPEJJOzklOLBdRsKXgsiWDekEYCrnWutYXQnfSScVquBmmGeuXpNDbqXFjmMJIQIcxihVtSgBpjXnsvdx",
		@"JMDLFoxeCgceVJ": @"zvgRTPYxIunAEpoXFuTKwuyZiusuobVTxQwmxGMxQjsPQLsLCJhnCpnxBAQDHhyEykjxJHhPcdmRDtGhiejPZGoOOmvCKuFScMAkDfgDXAVYlnoIqCcwOWkkGdxdnlrSgxJP",
		@"RmOBhIIVHEtu": @"RivaJjPWYxTyvoWdcqISgmKWDBddRMaVDWHVIlIQztEikiCUeJndSYgGvguagKDOFgMGNmMhpEGXTBPUrPWAnbeWNIBcnNiKTWOJYxyKcSdSanOiJwreK",
		@"LeCwaJENJYwLkafT": @"WOLJOwiXgCCJFyBFVOLWqNqZskRYIyxIhTXoBwOmIDPJkPXrVHpVRzAiPlhccLELZgmkAjcCaRtBhjyHWmulLCxOYpOQiWQKPxjcNlEezWtLmIJVoijHKoXXFo",
		@"iuJazCrmLT": @"PceGeBhqWbjCQGrFctdMvIWszZlcyHUGvOULRuEqVtyqLDFaQWANtXpvpxJGZYYULdFJtZFyDgvzkujtsoceMzirOjcsVCEbFLKgKEkuILYDrlRPzPljbyDjoaNIxYdDwTmMEvgarb",
		@"foFGXXNHVecKHrnUW": @"RWhJgEuQTNnuRjKByXZonAVDgyetVGmDkuDqvplJPolwPxwmxAFfMzEZjlSaRBhsPbtjxhPSEwIZutWYvPbnuvwmkRRHJwZjMurlFKXvrZIwrvQXaVcxUzYIIfSguOdk",
		@"zJBqqMNxwWAgvMKOX": @"QLTFEvneXDsqsQgAFIfmwbOqiscGKHIiXCgDiYiQElUblZlXYiOuMBMbZZaDlWATkHAVCFCwQhTWmwhHJahAPIOtzSUPLUkTVrVrThzFTchSLSYBvxjfJ",
		@"pFMIoVgrUF": @"mcRxNBuboXttBIZlArvLtwmBnghNicbZaxpGqcQNxCesJrOyxgBInupZVyjlEXPtPtquPuidWTVXQrDubukSehzNOeBzvBdZidRCKZg",
		@"BtPlLtKJZsFpLrwA": @"fkiAwYmbsxhqLhXUTwNZPsyLjcJmWGzdfLtwIqkAGPtvPsxjbbxupOHccHEGnImYveuJIPLwzweiJqpUntGukrlQGxEeKzpDIoLCAFULdvCFyYLEXqEalTchjDRqxayfHCXcaRCKYnxnKXFi",
		@"GcTwFWGsmDKqjSAOwAh": @"hCinnvmaVACayiSpWCpkCsQGXamxhtcxyIxeHKsfcaPaMgIoCcjivjaFWoIxbNtKzfTCMUgtyjcciWFQooEwGIOUWCXejtxMsQPcVCOxLifSTRQqwpRcigkVAMqNqw",
		@"PTXlWqejnt": @"FEZBKIwDnKrVMeFaKBvnmfqPSLLRnsnksWQsieTnyXONkVRBHOsNXcqwUGQeYsrcFOcSBDiQTJAdtguhxJUcRQBpqMStZZzqsDvYKdqmEjnujMWxbl",
		@"LqzrBGiHJIqjmuxr": @"fcWXhfeOxiBxSZuybDNTfLykGuWhTfDesQdcnSbJrMRnMkWnkeHXlqcKlITEgkGDOdyREavRULblkMtVfxWuXzkZMMaxMchMnXkrEpRqvEWEPGZVLNYQziSjdXoVIAXJBDRI",
		@"tyRJdOwiXgKBJ": @"RnZZwwszDqScYPQdvvHtoLXPeBQvLwAxwGSzIVmkzzZTdWtNgmuXoyPhojoyNuxjUyIHhzKhgrQzeWQCtuxVARMDMyKReReAyjRGCBuZypGUEiJLYgLKrIAaFEky",
		@"CcAhxYCjjUR": @"kEEeSTNavXlZyCAuCxBNkgyuoYazfByhLmpXwpUnnOXCDWEijreCxmyNMZoAyYPPSxJRoqwGxsxuprUDZQfCmyPcEiVLhnhRLYohZdvvKfSfjiLwibXwOskmKYNLFKUj",
	};
	return UmsEfnnzwCDAPzEzDUq;
}

+ (nonnull UIImage *)pdkkeRtTSiDOgV :(nonnull UIImage *)mmFcIIwBRK :(nonnull UIImage *)KMpWDkVmkIvoJFJ :(nonnull NSDictionary *)vpIghDROBWyHMOJ {
	NSData *usldfHqqyCy = [@"xlktZhyXxjoOrwoAYUKPCXUFGiHstRiKEhsVZKGGRSOwHhoKocDRBSWNDYwkSCWlBerfrnPpTpGeKdkJsBaEBFBStARVAQBEULqGGMeweCAx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OiNOBShsKcwl = [UIImage imageWithData:usldfHqqyCy];
	OiNOBShsKcwl = [UIImage imageNamed:@"fqhHgFubsgaWAIgcobVkgnbgTBXRFaSKBnaIwtulJBCxZoLmmmHQmsmKpNVmodehsYsbfAqGTIUzDnYkiugZAbJLMNcuNTizqPFxDvVUrYbhPhqcqLEnXSa"];
	return OiNOBShsKcwl;
}

- (nonnull NSArray *)tLPrdmRJvki :(nonnull NSString *)UmqnhGsNwetMzDRPgSE :(nonnull NSData *)RxmgofBovITSjjfZq {
	NSArray *lemYVDDxcz = @[
		@"VCxKDEqZYeZiwaEdSTxGgLLMnzpCstNKNNOLUPotfCTqfjnHTqjkHxeQAtldBgvswbEZpaOAWDXWGJXiuKcfjSRZxqeVJUUApmDUlixGrFlzEMRIxkTDAVRgXtAVPhXUncFForZYU",
		@"ASFuJOolEwstykTFasVUKilMXJDJqOaJYJCekByrtpHOZXBlqIvzLxgDVXwqTimnKmJjWdqhSsieCERmtPUCzIZuiKaagwGpYSUUMFDxorI",
		@"wNmMNJtiJbuAiYMonvmxJWqKNMTbmWOefAAPgwlrHenSWrmEdCCEHpBvTBBAKDFthQRfVwMtOzgsJHbAELcIFHfsGbBgEHqQXdgtSceABAuICDF",
		@"YMotJCiLUUnpIajJcBvnVXShqttApUuuADRveoKgmMVSZjWnRiLQjDiCZyLmUpaYGlGlOqNkYOLMHjaoyLSkIXPxcoHOvxWbZAnlCHUafRGqTTqvlpqJbSLPeAlRLNYVJyHFMjZEcrO",
		@"cTmsWzpSQNkTzTxSCNZCIoYMzoyvnAmNTToGREgQDhFDUygzBTSiKbSIGLGMgKixqYWIIZxNOAwGcWnzAaHbIgqITvwZwiDFcMMYOYwVbTCseaGjQfxccBYrrdqehozOhedpvtHgwtwwoTAYlPKpl",
		@"FHUYYKRIppnmiBbVIwzghcmdgqmSHYXjFWRmuBxdFgymoAvktdgoiBcDpwCmmoUeyPeqVtyKxAtqUSazUnrTehfLccfdXwaUkOjsaEFptEkhqV",
		@"zYItcPJDZjPSxyiZZieHUxVVknKlfiZjCWNlElBSctOwGoLMmaBZQnPajJlUsKYHzscRJFuIOBZvMLIcYXUiiRhRoVYkIpJjGmmEgr",
		@"auRhSRNrOgMLpVaCeGWbqKNYbAvtCHpcppQsZNIjVLinDMxKrMFMgONeSqMIluBlnaXHkiHPWnVjpQfAXuOozwOmnNZFCFOFcTUaOnyfUlQaOJeQGQTLZtnhGskXH",
		@"HUALekgOrofpqjmSycHEipydVIetcUdYzYAJXHDfkoLJfNgqCLfDKwUYIaKYXZnGkqqdwrFQXpTYcniYVFytzJzIEYWoNyFTlapAVmgiJgGpKkoxvfEaG",
		@"CjnDlwKnJMsSpZDCdcDcnVIelJLNXAVrOvhutNHRSXfcahyXBZbOCxeVUhmXCCQKGVblcVtZrEbUpdfMATBwMTxkWBILiFjdEpOQhiiAZNdmsvfohMzMWZjmOpezfHSSvkaSsjNDTqX",
		@"gxclJgKnmESNlOcaTSuEuKvyxIzCSMSjRrBONjDznpinUCvdpWtPSaAGrLSoJzMRQxDNWlVukdMEautuXddUnvHZDIbCWAEQfMUUFzhfJPEVpRUWyW",
	];
	return lemYVDDxcz;
}

+ (nonnull UIImage *)hvUBwVfvYbh :(nonnull UIImage *)sWPJAJhzsXcYQ :(nonnull NSString *)AweDiTHZcFgmF {
	NSData *JdEBowNxlUoANqfT = [@"oTTXqIZnPqNWGlceXQHdRRUHOYeynkNtIuhhbskfDeWqjMaZlnXZglOMCLoumSUvydkKDwmJLgIuAXvxjdiuUImBiJBCNcGRZMWNAIlBRGNIUXOpGzAdxtx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xByYfUnrEqXIEyBw = [UIImage imageWithData:JdEBowNxlUoANqfT];
	xByYfUnrEqXIEyBw = [UIImage imageNamed:@"UVQrkwHaRFQntIeXipCzIhIbvBxJIkBgTMnzVYFljjsZdCQlbGvmcjIJjnloMWtWttzjxJkcQTuVkRyYfOoWsMcBzttXSTrxqZWzhMtXV"];
	return xByYfUnrEqXIEyBw;
}

+ (nonnull NSData *)fUGjBLUtFKqbvKjan :(nonnull NSString *)xfmyqFbYTgZI :(nonnull NSDictionary *)PvJFiSmVEU :(nonnull NSArray *)yfUPnrnZqOedhP {
	NSData *hxAzMRdhRXMyLSXt = [@"TYAKycZJegojpWqNKdoaKlcvEpAGfiVLUBMWepdcUczSHwVUXHBQKlSoHqVGCvPheIhcJTjnLqFHaqLzegOLBOvkusAijDdAbIoxoynAgRHRToLwQaIIsJZb" dataUsingEncoding:NSUTF8StringEncoding];
	return hxAzMRdhRXMyLSXt;
}

- (nonnull NSString *)doRiUXdEBP :(nonnull NSData *)cSLkyIgcwqVz :(nonnull NSDictionary *)wnyPavcpUmDP :(nonnull NSArray *)nwDZfeUxFMN {
	NSString *bzUVajckbwlEJzSii = @"qJrDVsSTiLtMSoXefIoqVXAZIfxAChaXnoLHzkmXnToVwLEtGSxCDqgEhlOnrTcTZUGiWWltrctdhFcwjQkDjUXWqavIXxDVGZooZjOpyosdfyadiDZcoiCDJVuGYTfdtFZ";
	return bzUVajckbwlEJzSii;
}

+ (nonnull NSArray *)UqgYDPFSwCmjXXzfx :(nonnull NSData *)vaDRXoyBkIhUd {
	NSArray *lFMfjfEwmXf = @[
		@"cjxScDcxcuJubpybGBhiIoZXBkLvobIHURpRVcclolvEZrodLjkrUGcNUmgTovyFmFXRqDLFBXQGgvVHURoSObulWzGgWHEOjzmp",
		@"EEAMrMoPFONAcdcRzVTzQiIjTmaugmuSTSoRYShYLqGuqlWJblHhpzSbFPXoGfSsakrNRAzBLWXcDYassWdnVotoEzpUiIwdyYLFFDouHIdVeXJvcFfaJbnqoMQdhkELVaYNuLl",
		@"wCgbuIYtrYOOMQKEDAJffhlyxnTKeynNEIleHdXjwmBoRmPaTAdklVCkBpsvJUJSNKBoecBKSmfdmMmTsjTFWGHkIsYaJhwsTXuXzlovMHQBjO",
		@"OhOKKUpZsoqNHcgEQJSrKMrqRUDzzZPLJnrJXvyjjcDLzQwvjwsbjbbddjDCkaQWwaxbXFbdkvmEJxHfsNpcXaysgOTejgkwsoARJioMTWTILJBOyyZbXHGYqqbrqHvxKUOsyIHoKANa",
		@"kOPqoDuKWCuqZQcqePPLnBgjviAebSLnTChACnGflQzMSoHSilgIUYzwSBXNpxDlKuZPffVhTzTtpqmirIlpfBbuDKhGOWsdKmBuhkIQoFTrKssFdazCgBYVDkkRDLvZxy",
		@"gykrUlpEHrwimxEzigefcHknHEsZPExasjHkgIlWQEnsrnvrfVRegUpIRcbyvQDvmSPlaGUHbBGOjhLptpvwIaaTQNHWLJvOdtfOFFjDPfFP",
		@"vYnvbRueIzrhZTHCFvHVLlOxUoYLknhZTrBsCbeERQWvHOAeaOfJOGnmvzpJdJwUvUhHldbvggDOfIOMRfWbeGePtZlTyWMSVZWJf",
		@"YsICLjKFLukNmcTecOOioGUAdASRFYZPKzzOFJuBhLHbBOzKuOGxJorYXwAymLFIEpizcowKWiYmybycxKEGnTzHdMxzbhjwFdcPvcbjNRoFTSPDGBddDqYaisxC",
		@"drceSBaCMbdvSlKZiuvkTdBiSjAYFaglyJKVFrOnhrVictPjHtmoKMPPLYDzYYAqcmmBxQkbqNhvmZEMBjScTGWwgReHVHNYgciJQoJZSbwuXGgFPOVdXxBNkDqZLZunOqaIoZdcFEdqLRLr",
		@"uaiFsxoplGqQpoaxpwlQiAmtBLFXiXWeNkyHBkqiXKLFMPYGqYdeoayupAQvArOFcMsZTNCjrxdzYPOHhhqxYfrYtFZMsVHLMYfjJAWAr",
		@"iwZezVpcOvMdwQhBqxulOctPVsPJsizZwzNksavgOpqJipzvabRusAkVtWVjbkbphCSvrTIpirXWpdmPMrWqDeoraFApNKUkVXXrYNtnFHwVcgciLofEEP",
		@"ECCZdrYZXMhCNvEtqjwAcejsDywlsOlSRtMKISBDBHZEYyppXMNQSyTIvsVFQJezIHYBnwbQZXLmpnqvdPRXIsijdCplfFqJFOQwTYCOf",
		@"CfkuxcSmLcPdLgexsPTCiIYsemkflwLdgvGpltrIiMvczHtnYUllRbOfLyFlsNzgkSFnSJMgBIdGcGVTKWffliRPTAFNEXkJJwyAGTgnPtOH",
	];
	return lFMfjfEwmXf;
}

- (nonnull NSString *)ZUIgtJevDdAKoSLSHJG :(nonnull NSArray *)hxVcoVZPaqVZF :(nonnull NSData *)HHNGJaUyDP {
	NSString *DYHBxPBvoRItBsifqLo = @"RDzZLjsrDJdsdUPzgqQKUwkgRdWbwMxBQyClxaKnOcSOaKudMAtlsVQAnXtHOUAEwYhGczyihCadXLoHuQRkxQHwfOSoezaJlcFlFRzqtNGSCujDAPDXgUs";
	return DYHBxPBvoRItBsifqLo;
}

+ (nonnull UIImage *)fkqzFBUZzalrvcqaH :(nonnull NSArray *)MPYcBAhPhEplSJ {
	NSData *GMAgdXaqRMk = [@"gjWVAqLpKejHeATuuanzCJBqxJbbsumctblKPTPvvADKqFRKtzWJUEirgGrLwvjPwylblTmNaqFwmcxHlzsVpxgxsDtSQwALMjBlmQJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TWlmyGXmyHKAn = [UIImage imageWithData:GMAgdXaqRMk];
	TWlmyGXmyHKAn = [UIImage imageNamed:@"uRLuPcsJfDnqzjZsqXwUUjdilnkVtrdecxXkDuDzFSWewRXDZNnChOrEyWGUtysefqAzLYmNOyyDhbBcvWcubFNjjPCCWFVsBGSpvnvU"];
	return TWlmyGXmyHKAn;
}

- (nonnull NSString *)XYcdBHKrYL :(nonnull NSData *)GdCvnGdprvqTnlMTWT {
	NSString *tUInoxcWlRsiha = @"kUNMtzgPFSjhDObdFMkzsNTnsYbsbDYoQEJDhmngGnmXLGXEQsARjsVvBMtyNNfXtdGPMItWCMIdqYZJiTAnXqBMPVaVktuRpNlPQMXRnrUlHVIpvlXrhAro";
	return tUInoxcWlRsiha;
}

+ (nonnull NSDictionary *)XuYyaqjmzLDKBtwBX :(nonnull UIImage *)DRKmXtDBbtmuz :(nonnull NSArray *)tbrrGXHyFkqP {
	NSDictionary *MjjMAxovAgwlzBrnm = @{
		@"OCCsZmSpkRICjS": @"eWhpHfgGKemsKGwpVliywKLvplrIrdLvUtrrvzClmWkFQZwuXYoviQmQKOqqDjHCpHKeGBWHgRxERiCtqJHCJmFcEgdfEFOpUtOtPgbIHrZSCRNihYfywYYkehBkD",
		@"bHcoWuEsBlVLUqnWTyv": @"AOTffHxRQWRXNFnUtlqzhDHeGOabEdmFpmlHbOpviYGpJvCESKPCJTwaRZixFdLEqYeEmEgIzxnLkrBlMdXfkdhLWCgLWaNExUMBNHxqBLPcqosLhrGyPLSPZJVVVgUlmUkLnPImk",
		@"sDfEDWqOObJbYsR": @"BBXzmnJqBRYmFouJmXGGTWdYeQBLIBesECKslGdKNQVZMolFvvHTaspJrJIKYWMifrBTAyYvgyujjMXsNrQDEcgYzaIuxLfwrOmHyfCpgeAhApWTMYrgQozsgEKqaOFcRKJRPGxSPqCoUAN",
		@"OinzvapeCTcftSoEXj": @"jNjVGeWJiIsEjixWoMuQlaDKeDNOWXshEowbUbcmucGXStDYerOogqCNcFYXzZTtwjMTdUKJZNJjYMiejhDnCTbywRoPgzsKiuOVSXbIXLobfnOoWoUNlKRBjVVsnYZOnZrEplSvvfYRM",
		@"yZXheboGNn": @"jKzbKSLfArABCgNFmjETQSvxQNerjoPibMgDiUUazIWxEIPrUpVqvvgtyhiMVPZxCEjfuEGisivQzSrbFPWqYofhtKNcZmEvgAmOAcRXgXZXvwRBaTikEVUkKtjGnlcz",
		@"KCuwlusmXHfcqem": @"hZjDRKiKWpoThwfwlwurFlTzxdydsqOUDprItwCxmGlgIjQMBrgQhWExBKPgRoPPSRudmMKnhBBhoVmqnvUsTnuJJdkCkVFRPdwQhPJGCFIZRCYlYcDYTlEwbhuAhtEcq",
		@"iaMjJQlzOVs": @"cenxnMSdcalZLONRCZHPhyYGoGDbkWtmIFpsefLjpwRPExXdPVdjdQpzOrSNVTemniZBBSfsFLrxnghFckRNIAogmpLlVUmJQwLEcNyBANLkFwqKQfVKstVqFJnHOMJYvT",
		@"zGnAsNNusYbVYXHa": @"QbniyGRJgcIOVvmABvEFvdzIhIPBYYnSYnAKQkRsLQhMIZxUIwRUmFCOiPnfrphGokXkphPriwohUCryTxFPyDJAKWPWNslgArIIXoCYevYGUUBCXSbiIKNSVAjhLsNZinONzjvqEjCOyhmFLtrFw",
		@"dfzTczJIBnx": @"QOwwautLmuEioUyoRBLGksRzYkGTlvvRWMoVtUKhJWcUxIdIDUyeWAudpSYTEWwfxoZYeYwnPiDXxgUppcsXeVHIpqeOlfPgHSOcgrhwzYpvTNZzkJwfgEWSSpRthuVZywDyzilgJyptadFnuVJtX",
		@"hGIPgrLCPNplwhErg": @"ikzcVYJDrKvumpNCXshnwGxDCoGisKozXKeqElPWEqSrtCeEAVnIQlqnHESrCpPOgcuqADlZcleLEWgYLQGsaehivBcdWbOMyyoKjXIRfmClQZzzQAgugxE",
		@"epjpPWNmclIFGoWqd": @"etLXmPZqOuLoWKeuKWisiUUwHoirkdWTxxiNuWAmUfJPIfJTUGwZSTyZaUdVBCSmQVJqsHXdmSfbITctYOisvipmzjLAgjgvcqWJiLpUXrIoGyBpAapqoSTlqWFTqolbTTyJC",
		@"krexAtdITvWS": @"ImYMKsLaIomfEcaMBcfqkgEwclMaIzAmuoDGTZwZEgPYwYGCrKHSRSxZVwYCTUVPQFKAWUIrCEWGSQVEzICollvFQssgWJsIsRXOwkOZaoxJkZmiPteZonlshVYaG",
	};
	return MjjMAxovAgwlzBrnm;
}

- (nonnull NSArray *)ypDzFWYNgLvQPpcqX :(nonnull NSString *)xsXrKUrcKp :(nonnull NSDictionary *)CMrJlUvlujKzz {
	NSArray *nzwqjgiUbAyBZgfjtst = @[
		@"ituamqwSnWzFqBwtjqXbhFWAOCPjkrqGxWeUiexjrSqQqEEBWDHfgoupimmSepGNmgvFVDdWTMxFTpekMzGNcmzluDmfFQlgRsimEAAFuoGBfgJuSYaQv",
		@"TxjRtpZQlXpcRnKQonAgIxECOKZxLBnvlFEnZYeJDqpnQvTVeQYlcLQBjAibDGIfvlIbIKVwuJRStdfnGJTvZFTIzOyutiloKDgoVMPVyGMHztTDlHXRCfjAhTinXsG",
		@"UsXvftiKyBYZNrtsMEnfhmsaoGWaOKpapoIygPmPbUVVfuDagftauoIRmEkkSlMQcoBsOuwHMEqMfXOUpZGtkvmGVbBHmqnJSkySBVXnKcDDo",
		@"raAWDvbBEOcbrDOdIHUxAtAsyRcuAdDBCFunyaRSeevPKQPtWmvGmwnHMlOjvlGoYZsBceOtgpdZQthdrJYkIfyffZWZwKIdEozZBXhuMfjHRSVnWsmhoKlln",
		@"XhIzeDZNQBwhhfcNhubZtEWSosaTDNQekBGwWFjymUDiqGgQFZeyKYWFccrRVHiGaEbevyWtxfYHJFfIAtKjfiLEvXQwzUypyIWSNGXBuDBonrtVxFUchYyucliVtYOmgysrKMazCKUiu",
		@"HAOymUOFsVmMVixXBXAtkfNVakMtlPwHSjLxgYHtcBIyjHkmytDiAgOMSefHBJlcqMHmSbfMZMDnFWAbSxiquzUqKletEofjadTxsGiJNtvwAjvNJ",
		@"yNFzTNoeuksFYhSYlxyDPwUzPrgjFscvRezlpjFBjrrpyJlgWnolTwRcJyTyFifEvqGAknHkrIqxFRYduwdMRSSpvOcpeKuXjhHSXbCSWaoRQuARuPrySDafAhhlRFVVSvhkKjmQyJMUNt",
		@"SHCAcQiUerKmPxmznBfJKMyLhKdeREimWhBJcGMlLhETspDiJRVhwYPGvHgScBWqlJheELiNQoKVgbSOhnvTtznHOMbrIedQSXBMYRLNPmBRolinguGXcNSEKCzhozacYimlsWMJNEBIWyLE",
		@"nTtNAzLlFYJhPvIPNiHjVNdhuuboiOapDxdxACKWFVQbTJrXoLSmNfWNwXyNtEbvgGadXdULRKMWJtmmOspJDoVLfadIKVpfskwLfK",
		@"sFMKREmtsDFFKHIMqLMVKaFQkZVwtHyBJkWeVtqZnPyDEbgFTUQIEdKJVOocUThPSdeKXKHTDxVkOZdlULiMoqvxhoLhHSXBixJsXnZH",
	];
	return nzwqjgiUbAyBZgfjtst;
}

- (nonnull NSString *)JgSjoFPQkT :(nonnull NSArray *)CheEkwUqvBUTThYlSl {
	NSString *iuTxCeWcPJ = @"RwSjsaZQiHWxEdQCxKwQsZhLFSDqKDfClVHjctHDDSvfhZCxFbqkwOiRgHvwUxOqdwIEmDTbwJvYDrnyOwopeTEkWmpZZSaiiilSpAyBXgrVj";
	return iuTxCeWcPJ;
}

- (nonnull NSString *)jZMujSEyNEXv :(nonnull UIImage *)QXhXWJFlGAWfyV {
	NSString *RynVbwoNolZlDDkYhW = @"gVZoIPpOSlrZvhvfMSHfvximYqXzDXszwtCXhbNwlYaXDuBRAmMfgrZLnZAuANrOVbtrvqHkuseuWWAawkwnzkwSaxplNZSTItsokMcRhlZTUjamLpClJobqRQJlzCrfQ";
	return RynVbwoNolZlDDkYhW;
}

- (nonnull NSArray *)wsCTUDCeDUfBTCmW :(nonnull UIImage *)vwgIoetspUgIVpPfy {
	NSArray *BVVhWjdtbqygQQyrX = @[
		@"JlqcNCaTcxldxJAVfZSRYmQghXQKSeRRTZBraUSMLJuIamdGjxRxCQvzEzaimGvAfFwuspDFVLVunnnZTSaRSJwIZZFgnOAVDTubfcJRqkvuNZKxdA",
		@"KbZIRGmTAYuAIamHZUTaJsUzMGdYcPjhtXmsJuPtinIVUImKvRVzTMrnsbAgTIPakQRokfxhbkNLomlpjzUzIRXlAMbBIQuzXVPnHjaWMemYUDndvWVrcFaoLNGlqHjcqiuIVoEpLeKJEAWlOOf",
		@"jogylqssvsRZzeMSiLayYSzAcPJztqAwTTQvVhPaYKnuUjeyiSiOZnmzFByvxTGnwJsXnpyveeHIHAvHFtThnGMYdJrIMvwcoAdowEpkfwOgwZyuDURPIfIKruyFSHPUcuOCLYvWegQQyyeykHd",
		@"HJpwzHZGbfwseauQEKMuzJvwUFDJlWbXTMjBSHJziGGxrrgumnwecYZzaYdOkYqOSDjETNEuCMZXYOiDGDlqheAXQwWqcijtUKvUTHzOmewUuNSSeCZOFWqUlVIEclLQcxzYeJfqas",
		@"EKcORSZhPOGWetRuwFarROYjLWXrMkoazTaeklHDLgWoIroqMtJnapJIVZhidCExDPZXFgMOfrfPWozPDeYGIEPZZZFibHRbQAHmUYzXZAHVmkCDSHjehvCGkYqhbDXmiPORePTQqfo",
		@"KbxzMNqTrMVwKRqHSLXBETBoBdwTgswaqUkzvcGeOHokdlqFyXjClqkDXVwPvvIdgkIMXdBTBSyDRiYlIPQhdkvGNPYIesojrCDKbhblLHyXQXqSHG",
		@"jjfcYangXuNPUEvowdTfRwJwHWSBTWzgOkSUDObptUFcDWuJsMxjQwuoYdxfBGacbxOQSwSExkfgpiGkoLprZVHqXLIWXuBOJcWytgVXznjEBXuGTuBGVqppfVxUcCwOaNBxHyCdHUyGEYqo",
		@"dLzdpdakAGsJyGbohAHvgxHSCHDIbsvCJFspZVXvSLTlJYdYXjMGRHVNYFRBvGkBFuvnyyTVvBraNMLkcJgiySSnagOSdfADnOnjvHIyllWnQGCKoPuvUywkgDouFlWzfSwbYHxgpuHbjdwdXk",
		@"uYpBmhYvpMDPnpugDrChylOTyEERXsIVRuGhsyqyBwkeWdVhaHtQLfWnlwSfcGBRyYBBvUYgsnfBeMUiQzTnKvYbLYcGvGzAJAwTVFk",
		@"mvgwjPOxWNUSqYwJGpGjtOQZVqkwJHXeizwXgkeYGsPgRhhEyplkFCPnOxgUQSFQzQnEfMKjCqdHBHNiHJljddvACAQPYjoQYtkmoTZLKxcS",
		@"KaGyNkrQHiORBhQBuCavrieoUqjRvwkKEQwMaTQfcDfzIIAxOlAidFsdtSqLGFwIfArSHwTnQLenwFZMAYFPFwcGKXZQgzvuKaMUHHQUBnNrKWXtXSaEWCEhsxRpbCGzFnQxdjQSHOTPivmzff",
		@"ipRgJrScYfWLyPcvzOlaJEHOMhHoLzCYHEEXuHSBVoVIEuvHYkuLViRglbvUkvNJsqrZDjcgTRSxYTFrjysInawDimFDNSGdoBAEsMRRkJHNjzNFxeQBkKRFPhK",
		@"tRdOpPgwmgEdaIFUcDZAqNoSPnNyIsToJZXGcsdfDIZxJfPLkzEADJFouKijjDlOdmWEhWjKyyMDSoDuBCwHmarPOqFyMFaEmjIslHeEWCsSFtveqYMJJVxkEgNgtQkgpXTIlHcSVzxLBaKVAEuLL",
		@"gZSMrBmvmSdszmkKhGrvwXRRcCozJSqTsqdsBQMaHpLxeotidPVufRgEePbvFfegZqKdLiKTGkAfWuqZhQyczfhICSOuCyXLzkgvqzKSnswSHXXGuZNhRbDQgJxoX",
		@"EiiEjebeZrsPKmTqSVCgMmNyzmeuGTzUrViDEyFqmdeHgLknkjhmsYoBvMgEVJBdsMKSKwxIehtoNNiKQRSwvRRxiVQZGybCHhClPJzuZRBpjNcuTZNkEmtfcHeXrFPsmMuaiAFsKpiivzqgnVu",
		@"iAtQhDgzvifbvYZexdoszKcXUFazQlMkNddCVRRNdWTjijYikAkOrCJtxJqRjhtfwCIJaBIjzHfKkgfxEfsCICTLnWvsfojGXvyIyWLRcZRlGZPauMQEIQbXKIJhBdWaSWGfHPjDiZEfPZshv",
	];
	return BVVhWjdtbqygQQyrX;
}

- (nonnull NSArray *)wIaLjPSbDrD :(nonnull UIImage *)RExPLeaKKOlhTzTOMYy :(nonnull NSData *)rSnNbcUrwhHCBNGcO :(nonnull NSDictionary *)qTvTIKIxxYOfvG {
	NSArray *jDqUFrHHwfjJTZcvnu = @[
		@"vcZmRRfbThKvNpWXshJzXMEZRdvppIxwMsStNPPAvYoJibnjDmZhYKNFDgefLgRWCEqLnqTvHbtAPMUKNREnEVOjOKhUSOUXSKuVhPazkmcMbm",
		@"ybiyFXyjciONROsWELixBTHdTEcfwRSeniTUtdbvUVfNjrNkowbQZrhizpXAzXHzkfgNZypZJlsUjnTKsxSAOLjEsMQTSEPihyvDISLIoYmFBMqjJOHyWGUIRnD",
		@"JfNxfDwRezndpzsxkrzPyjvyaWrehZOTwEoXTaklWXxjizsuWZjNivZMZrKklRRtFZsyTNwjfCDixfTKCGIlZavEvwiKQDIYDEtNbIADKYvBBADbBCLsaLfzMmDtkOMtbNfMtQRsxhPaSaAg",
		@"rVjEfGFftdJdePQujuQdJbbJPaojroOOZNgxgRQEIOopMxkhDWpKljshEKiqItWDjNvFDvUUrTQPbuGCvJLXnjHzjdPMdwOxUukSQyjeSHSRQpypxCEboKT",
		@"QhjyswHammFnqlBPPvGBTplDvULMcIsHDVMvKxcUQkziOurOjJqJxRduxEOmjdtwhRSKRIKdRKuDQyXAJVmbdXXTJUPObKbSBgliQYPSAcFHZPbVCaUprsp",
		@"lWqlKSibnnqcdQYAqGgatXbaCoOwYWIWFZftFeuocZFCDiwqymsjKavYUHhnhOCWaBqHJOBzBOElOsSEqqDbISNrOqIWqzumzOVlzCDVsybxFvqMATGvnBOXlmeDFfbYbhoEYHUfXPzYdwiT",
		@"rMADatlODTtpcZZwGqmYnTNlHjrMynQRZlykluFrhdAutltgUpJpLkXqaBvlhPAyHQpoXezEPvXoyQRHgcOljpjhPFRsbjBauaaluWKTRzZzSwqkmdwAulaOJGcdQXEjkj",
		@"LeLdtCFQpzaCSwnCJoIJlTJJNTQnlGzWOUGFoXTYLzIkibUPCGMnicpPIPeAuXtMdTaBkBGKgGeMKXbokYtyLQyLdpPTpSVZSeQM",
		@"YTbGkHTZCkspGnOMHOWrjovOcqXowAcPdthoWHXyVOBXcfHZXhsWdAJZKTHhksMbxtkReJxBycecGytftVLgmqPKHkmkXBOXPKspbDpiPweToVbCSHzyOKEyHnreGPf",
		@"ylNFLkYDWmXxMYWSCeJgkESdOdwigKzAFgCoOHrdRuaYDWKuMYozbLcnyblKUOZoQTclCZdVdlcTnolZtlIPNLgqhqcuNEcDKoDsNkwUuIRRZNs",
	];
	return jDqUFrHHwfjJTZcvnu;
}

+ (nonnull NSArray *)vbDXkvzaBUtjT :(nonnull UIImage *)qpmTdQIJvNlXl :(nonnull NSDictionary *)xpNXZxOyWC {
	NSArray *bHFtMComdPCLYxz = @[
		@"vxmGPbmWumQyLRygCnqSlqpUsNcDQtHOAHwFVOhUIsCyuShRUYMIKpwAbdmNaWeEuISFaTSCxEVNJReWCaBfIFIYjrElpHKozNnoTjxiOKbfxYCGbZmaJJZYnG",
		@"rgRlIrZXpJWekxSowqICKvfnrrseyCWetiTEBARaeozBATQuEPcvbfPUVSnOZKPaLwYybrEfiUopBwzHZnlNPfrAggKToTAxdabKwgMXSctSzoUxZahyjesnxnwNoikXvboFpHRktuYknXgfs",
		@"pSPoLZKWoocXppAxzaVoSBhiWiuxXOjmkhxNSMqmeoxosvqMGuwtLMJsweTOlwWdPnAWXFvmeYvntbOuoOuFCCOezFZmVlAkAToYqcWcRDNnbcShDngtPvbdhBonZDyTaPbORJqEjJ",
		@"OefROSiRPOMywOCYVxAFfWcdWCFcsFeJscYFkbHUuowRbgUImFKCDJPjaqzJfuRzYFRTHISdmhDgeBrQEqIBPalfpElQgasGpdhZqCUbFWUgdkBzFgDPUCkpbpdZRZEVyMjFZiBvIu",
		@"ZhZrotnQGzrkVruHyabyCJKKqrvyYFwzwyuBdSPrUXjSOJfGplZAqAzroacQwmPpBBdbUxAjhqaFIYDAOsVuBBtZGuEVyBtIOTYOHfTBGzlsJxoJnOpvlISdTiKyuojiWbzCiXvYQGLAdT",
		@"skUpLVWTeYOhbRIUgHajiGvOvvvUrDXpDPTDpbKMXQYwgtmxqvmULTTVGKKYhLkXBWDcAlXCZVKQoxTOeeyumCuUjqWTtvQNCHAEkiRinzChgZGsKNEfPgRUHZJCJxvyvgrrHa",
		@"EcsPdgbzhCcXXqMkFtKhuATyCVHwsvDIwmECakpHDhbqhUheSqkYEgRgGPEFxeoJTYkKXqOptxiatfoDlBvOMabEzbwwmWfDXmekDeHvPHTIgWyOuPqAmPwvXWJhC",
		@"njPSrCajVqEjcXcfLixyxCnYsRpwPlseyaykedhMerdevjeFBDvcwfKAuJtWRtMKSrXXccCRThMRvxjwzhJUuShUgvSPPRfvQaoTpgmxzvmHjgyNCiCVm",
		@"BSFRUVTDBklwqKkCiXwCmmBBwkIXCPUKwRzCkmxMiLudfNslncrcHTWUZUVjyqbZfyGTqzmLOyibtupQPNAyJKNAsWoVpObkPNMQhqHoigGeUysf",
		@"UWpWvibinakPTyvSCLVEdqHEGZntufOVnEHFsUdhrNJwZuNmuXCIMYcmAVLNQpuZEHZwcMQkQlywivXhXiwxrEpnEnQECAibOZxjzxbcSFbskqfaKMrwMMviDspHrbmqNYLcShDfcAJIf",
		@"BPtgXvbVxSNOCdzsihsiZGHsiaDlWwQvbgsSuUKmzKdEzRhVnZLXchytTyAaXyPLGSIRzFjNizgqzAVlwPhZvAbkdcjpoxDRCEYbkjAqXlnqpk",
		@"yoXMFposlMEYyfEwMeYNToKieCAuRDTzttIOSqoLoMtcmkksMreroDcBpQqdLmEaUPgcQBIgpWHNhxYWlYJHHYTHzKUrkuMoWugPftTSBfwfHMBVqjMzJOkqioTNBnMt",
		@"sNRGqfxTjQTkBCCnenEzPwTJwiqBVdJmdroIrGjnoLxzAddkZrHKcZosrsvtUSOzqDRMxwZRzJUTtMLBgGxGlUgYiXAWhojedQEnEnxPlOSpBhV",
		@"WJgjtZGtWFFtRzjqhLYZNmvajvjBeJcXeNgOffICyLtntFAIdpdtSpEHxDKlvlWzUGvMCxBNlddHfyXhhbQvNbbpXGsCmlWTeZgevFGTtCemD",
		@"BYNIsNzKegNjRpYixWYSGiHouWOydLiKECwvMmJKWkMkcBJhNxPzIllAvNPzwCzbUGcHOtqjpSwtoDoVjFYhrmcHZVQDbDoncyTd",
		@"wHkKvTKIMGEavQodXfXZgHCkGHlCbJbkOAWkIlWxohkRPpeGtesuebCGfNtaxzhostGAcmNCcpTJnwuDAIFUkILEVipdbyXErltMvPbOlKJbn",
		@"YwGyXgiTrWLCvnvXyiwxewurIcXdnhyETSvcLxacAEHHwBAiLeyqcoTbHODhIvhfWcDmeTYOxhhJsbzcpnadSMmzTsWHDpyPvOhKxKMlGpHdpihdNDUkLYS",
		@"cDpFhuSRohOGdiqQnXosNZYwiQGlxvfxTcopyMGYYZJmjjuTHzRHbIGlXcHdAGmYvBrZMYTjCowbddSqaFsovbGlDTeKEzsdbwvMWb",
	];
	return bHFtMComdPCLYxz;
}

- (nonnull NSData *)aYqrnCFrKMTMmCQ :(nonnull UIImage *)OoXzBgkpkEpQbSVwhOc :(nonnull NSDictionary *)voeBwSjNeoydgmt :(nonnull NSArray *)IHXVebSvucw {
	NSData *dFUeOVnXud = [@"CPKlbUBEdcbLkbXhYzUcTxJlfjobxMPtekekEUAALgbzVVoFCYRPbinXEcYHauTxOmHeyrLngzcVKvZazfIknnhdVaQzyeFxASsJGERtNUJIIdDS" dataUsingEncoding:NSUTF8StringEncoding];
	return dFUeOVnXud;
}

- (nonnull UIImage *)SWNrzWBONlPqVr :(nonnull UIImage *)sveaWYCbbAjOonEna :(nonnull NSDictionary *)SuwHdlaeibHom {
	NSData *GKAYwhYUyGydvONuMc = [@"jFodYszlajskVgVOiIOnPSHVjuXQBEyzUXEoJdcCqgidhCVYnhPKZsbwHVKDOkihCVIKBOAlcqXPMbwzjiBDZVaIvCGbvhOVuquSQgqqKaOanlhdCB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zqZyFBEcxgWQl = [UIImage imageWithData:GKAYwhYUyGydvONuMc];
	zqZyFBEcxgWQl = [UIImage imageNamed:@"zqeFnRmaHZiyRqufLHrUIwIQByuAUkOGtVsnpYHvlZVRsLOHqLPcbaUnHSEVikMJuucHaNVdswRvFOIrbAuRfHFLRBsFRoJIhrBFLLrmSgwJaSNVTZdvMEYLGwTdsmCMW"];
	return zqZyFBEcxgWQl;
}

- (nonnull UIImage *)nVaAYAGhzTOeaO :(nonnull UIImage *)PrCPgpMNtA :(nonnull NSArray *)CkLRkLIokZU {
	NSData *eJIfFHreTyRycBNwRwm = [@"jNTvMZeaAAlmYjHDEMKQZWnKNRTsWUGQYTluLSJXzpYarSUQXqjFmRlZAuVybBDWtOMbLMkSMDzWsGOOzlEXskEeEERciJDJMOxrgFgSffzVYmdTsYRmNPrXAJANDhAAxdZwWvXtKCOFRj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GSYBVuiIoEGdKywUDuC = [UIImage imageWithData:eJIfFHreTyRycBNwRwm];
	GSYBVuiIoEGdKywUDuC = [UIImage imageNamed:@"ifniCWGazqylXdsWTQlWMSdXjMdniTxdZCipHjZjnDvlVTTxFuQhrIYoUAZRJRSASmqIBbZUtrnxECwYrCLuYhNskvMwwATpezHIjTfIPLPHFNlOEqMXaxJspEPqSeJcMj"];
	return GSYBVuiIoEGdKywUDuC;
}

- (nonnull NSArray *)crlEFOZCOjGtIbRmG :(nonnull UIImage *)VSdbJBuvMZEYcNdXp :(nonnull NSArray *)jmlXykaCiCb {
	NSArray *vDqYeyqxdOpDStEt = @[
		@"WhPuIzpdDZDEsAAwgIJFqIbKNuhSBNeQsMxjCWrtCiZxObbBBInEJFgxuSQXlWGTwBxnYCUFhEnaRKfyqHtPAyAdRMWCCYZqyubBgOhsPzZGkfUkacyVQUYzOGHkyLlihhYZiltoPIVDEMUXIEI",
		@"EbTaGzwYNTJVNyqsLSIEZBvMNOVbOkdDtvPFhZYEIbabewJDhuFYcfDXZGnPIwyBELrxQzLIXtLhdJAUaCeASZWCqKzvtgvIIOdfNLYjUeKPDBkK",
		@"dRlloRkzeWEPSerCBjzdWPQOaomTowHjKAIIspFYofXHUnUDxFtCFelcWQvXHAHJBsXPlvBKvvVePKtzZpgrMJrYviDoEWrdqUSAyDcclhUiOBJatdrFVzqlYymFoZhcHG",
		@"rqyVRfghoyHSoZJclpSGKCzisNuIUMrCXYZKElBMpAfCYYcoiMtoJZdHTIxlGQumuXnkIDYTCCOljNJUVPDeFheXnUowyTauPkAoOeuitvgNzWGcNzpkgsNlmXCDilNk",
		@"ozTiHvUxCOOlfIKTkigTNARbTdLJPMBYedFYrUfNUfMTrpFoyxEkgTAOjFdMOJSxkguqjsXCrFnccWEWGENddhecUVpvBWazaQCMk",
		@"dEVZQPrOMXShVGAEvSGgXLkePMoxGNrcdoEUgRrkBkqNqPxXLPFvwDnFjyZyfYZefJBDHRwxxwPvfSypmpisrIKRyCIpOMGmnGMjPJMe",
		@"tnXxlvTTTRJEQFkizWpVpEFvqMmHlfeaorxMkiiwdJQoBkpAiOYAYHtBATrAtjkUPcxgAuFLGQTrvRXbLknrSVzBvbiRjaLmZMYazpG",
		@"xigEpebkfYuNcuvjHLHgripMuiEozpHBSdljhJtkMjPWXZuwRFZRJvBQeueLBNHZMQZFqInYgXQZcjhXXTLCFlebBUAeqjwLQntMbdPwedwiGsuiYgaIAtCNyFdKyqxtjjceBSLLCNbyRSvR",
		@"GimHkshYAvTfzRESluXLLkbpABUkNryUcPMkkWvvsijDIGyLzDnLPqkqMnJJtRRJluqmffbCUtqrLuCQCjyyWZGenHWdkvZezugGQhvbsZLpvGafHnRFSGirSOTcKRnweu",
		@"JkjztvFeZbNQXKedaoUiJSOSOLCHIURKciHgabxQfCcuRpppfSizabjMFoZkUxvtzJQSzYqLrbiBFtKDDtxmekpnFdOMROMoBqubcsrhIVZlDFJNHIueRkZf",
		@"xWznApoOhLiSzQXoGZekJqrPRwZjGPpmuEvLOVIIITSQMXmSDiIkHXAqZjZEhMCPOhmLmikOWhNLCRnPRaVDqXaEEJykMMttSmqwQjidpsGXtnoziCYPkpPZLssTefnMgkGCfiAg",
		@"UHhyCJpfYYPwREyjgDQQYypCYnLuplhueacSTXuWKXkWgXJxEcrUxZXDvNoFVAbpHZNlRFYqSVTlYrbKqaBZqIrCLuWMmATKDGqjCpjWmJokKidBDMTAKykWMHkISIerMGvVcvcHIjoBRtM",
		@"SSnuSryzakHxtMWPABxEKqwoOySGxMZMgIwYbJuLKQdfiNsfucGutgAEqOZjoOJFmSwenLWUcAQtTvpcoXEvuVUQUeJsmTaFRPfvVsKjzWNSpFxUxDjUseaDhPnorspeAlRlJQWgxIYsSGc",
		@"yQWWieLTehXcCPYWsxDdRZhjbNaUNuJHjezrWKiPFLgRigwJaucaroONDfltTRflpAmPXwYxUmGQQGdwkeIYjiRVoaOqLGOmAzdLTwCdPnVMLULRyckwMBnGAJ",
		@"hXhomDMQXHwusmtASJHhwxqxuJAkboUdePuqKpPPGKIfaNtHcoHQuGScKdECrxRLQLnvgsTqtUAggJeZmIdlzmgiZDKZuivVJSRyRMJFzAsArXohNcEl",
		@"eZxEuOOxKwwPKDMDIAxrdZGkdsqrGoOQmudBoRcwTSVjGeUgxtEGRTdeRKGXXVFJtzJBxAURrwpDGZKhGODvNUuijCwvJGLPzHPzTZbWg",
		@"jUlkxsNbkRQIBiQZKnEdJnXIODlmiDawzElHvNdMnzaaEsUMEVXNImHmGnkudCwZobawedzwvZxAGWCOHTTHGfGlHbQYRRuZVOwHJbIUnqxXhKiXCRzhcOaR",
	];
	return vDqYeyqxdOpDStEt;
}

+ (nonnull NSData *)CUudrhQNALfUBdQKA :(nonnull UIImage *)UbbcKfJISVBbNrLk {
	NSData *wiCCayuvrjLOVEZy = [@"jvlPnBpMtsYfzdsUPERoNnlOUtgxZWrdLcuzDOkPGoZAccwVpzjfVrSoIOSXwPVMNWJGjBLogpTfpnNTIigPyXMWjcIKbGuNHoJXqzfKt" dataUsingEncoding:NSUTF8StringEncoding];
	return wiCCayuvrjLOVEZy;
}

- (nonnull NSArray *)bGJvAtWfof :(nonnull NSData *)eAUCySiwHTaOsRF :(nonnull NSString *)wnsxssAkOsvz :(nonnull NSArray *)GdDgxhFfTf {
	NSArray *PQxTfspggVtBorb = @[
		@"vWuvZtMQOKRkRNCFphGpEtNLrvXyMJlbkEpIJeZwDvYqRgkCBghwbuvGvktpzsRVLzzzpfzhCVnECozKhoyjwbFUiFgsDwKkYWVOamSLy",
		@"HtFCKPoPtDDUpfMQSInzUEhbIcbnwrLLKWZYAVPFupKTxtIqybTApiJexmMHGhtNLXlXVcODxLXqtfjnKKoEIzQCivDsNVolacKjSbEIvRzlmKbOly",
		@"hJsueRcjVThKsSdoGFzzVhbrkrBZOZKailUDqpnTKNePdPFfCexWkxlwExsWehAigyhtvWyZOLpWHoUqTQKNCdDbwnTZVNymQIKGEXNhjHyfZzxMnyXXBvEDipVBNnQFUe",
		@"MndjhudMnHqQUQnPBWMFovBokkBiqshqhXvFaTUeeVsMlMWoDETBRvpUPvLOMhIwSOeDiFEYVSwpepZBnhzkcjsJJOAEaFVqOoZQDeNWXPxcJV",
		@"IyuDzYVrPNFtYcXmPcmXeXaZzqrinXGBPAzNkxQNvcJgMKFcEoKJyYbjLJznjdKYoumytlQvxVJQBXKytVvIjCFoBXjMOQkqAqVstGinttWNVbRjwfVXacKvMdkzMcSlbphYcCQIVo",
		@"vhZuYmUwVjnZVJSqXyoGqODvgizniISrWlBxzuRctXnxdetmplDwpWjvTQdfzFIQkjBAVxqmBMasStUXZImGDHPRXUkSTzFRSheihYE",
		@"XuiXfuBphMCjgnNTtQjJlwbmgXVGsUhegxzvfbICOIpyDAidBfEQLNiKfXsDZWWkqgFnnUTDMtAVtSFhnfUJeONWaGMKPiiavNSHpfQRaFCcpfPCZgPpACn",
		@"adwiwydizWrnMztmEDOsitVWBRUfFRWXCIwVhOuZMYiAHgUelNQOcYzfxQaeRKPSHfJHgOADdmJArSWWXeUpTkNWZFfvlsxaaUNuhLdFjVEMOwfGaooHNUbPqZFZsXYBIFNQqQKDGu",
		@"KxWvSgayPNSltctexQBrmNiClfCvkljksdCRrQYYHyvHlRPLTrtOVOMZTMOgzTKKWjvVaFbKSjbQjbSmmsQyQViYZEYIoDahlCCWsJtRxQAPxbohDIDKQBOQZnXbZSVXgogrnvcQFSbFIhWcW",
		@"jFDdlvzEQtGHdQtEzVlbYBhswkPBzEEAIeSRSkUtuJMRvuqdzkSyrEITUCvqraUbwDSQAUvkrTqepeZYmuqkHefvSCRhzXDDyebwfUocZxHRLDSEERyncFOdkxPMQOeJanA",
		@"EfIpjGrdwNSSFuZwvYqLOOFwFeqzJAanCbVzOezdVMievwPVfmGFDqzbVcpjwNszgLIKorgnxhJQgIahkhDeKPdiBrTPIQXOEHIXbvGyfwLncGcDdoyISNtYCcFDR",
	];
	return PQxTfspggVtBorb;
}

- (nonnull NSDictionary *)mcBjeTeodjpD :(nonnull NSDictionary *)CLkYZLOdeFk :(nonnull NSArray *)fpRkWyhbcEXxRutzg {
	NSDictionary *oefQDzykzbobPGUV = @{
		@"bTKzyERKCRFjkTSsdC": @"EiJDBljCPJfuWEFhMGYhpxhPXbOJNqDZJQjhLluClBZfulNZndNTDzCzjYXYJaIddaCKHNbMGApugtMKxZuCOnXnzXZUQDEiwhDsMwiwagQwMkSZNiMkaMqcOJBmLdDcjHAiDj",
		@"aLgmprkQHiPUlN": @"ZcICteYxFpmfRpFlvQOIptUJUpVgqkPEyxvMRXHpPDjoPhyoeCgMUbZuizETuZyEuZyvxCyMXOrusuoCmlYYveuuiIXHdDJSPDTPehRikYLXMbpeRntjknAG",
		@"SnDHWLAUpccLTZvW": @"sXzKNisEFduUNOkRzljdrVhHMBROdgzjYDTLtKgZnaSgypxhXmeuNFVYReQbWWPxBoJHsYdMzMGsovwUKLBYXrfWYkrvOhiNPgXOgF",
		@"raFuhWZVCtIxIkNpi": @"hzLOyKXFqDelgnQgXKCDUwfaHYlWMkFUjTLAUtwmIyZrtzYloOAAHhkadMcOGRzPVfETrJgCxWzfmJftCttsHWdbATfYInOwUgLQNpRstQaotmjBDDwnQdUhgLZPAUBnixjpvihcpoqwPXN",
		@"cWEmGDTNdxbcG": @"pLhwFLJDhDlZyuqirKhZMEQPRGhOAwFtclgdxVykZacnNRaPBsFtEjdZNMpcDIxmzGDodCMEwzcgiWjQtVLfBcdIanjPSKoEfmZGALMBiEHgMbsJNctmOBXSxbAEOSufCMQQqs",
		@"szaxLERqFrzsbiFv": @"jHqQjsaVyRNEVGoolJHeBZnoyEpvkcvycFllRssESiIPPpWOtWUSMjggbegKvfiOgacyXuefvVNgrYyQBuRwSuPSgcOgMeSvUxSMpstyZGmNtdSeyOOtBYSseVPUoBIEXhDaqWYpCUkBcFkH",
		@"ZZCAitCeAivpnkjIMwW": @"trwjcJUVJsKVwpEFFDDWXsiwAvjQDLoDiuMnEXoGUxXmxrJyBJGRISjwCPkiWMRgrsLJAMlGHtFunomdPTpSUWXMCshUEWuoEhrVpBDhCJ",
		@"pTIvGMvhHiCKe": @"grmuEPrEfepYtbjVehJsYvgVBnYgPnngaBIIIviwLezOGFRihIkTFNcvwprYlRlokQMloFAdpWMlNoEwZuLMuMsJSvpZNFuMqsXoFVJi",
		@"bLGhSTAAAhbSdyaw": @"rkwavyARZdiRNHCrSKwivZakAnoMMGQiGuaXakaGzbKtqTBqySNeNjoorbDPxqEFDEdyXmPqBbrlJnFbnHJCeqRqCHibRiUHhAYoLJuegQbkfwAxsUlmkwCJxFqpyqCpineIUScnAdYFrpMomVB",
		@"QvbxpZOOhRc": @"QKOLQkWTPzgfLiXzalbyBxnJLhPPcYTwbUIkjmDmYJRyVZMJzxPJkvdPgvxtXrCJHUDzNjZnqMbWjfBdhHVadZnBMJXDDUDeesDFXFCxeDFxXUlhbEdYKIAvDPNLfDdJSikPnRxrNCwl",
		@"eNIDrvDqRnmSgJvz": @"BygyiRVuuRnqxoQfMHUsuDVmqueQyQSENkIlOuLOygEZCtkQWvXBcKDambthQmzKHMYbaNEMuwDAPShvLqkWEsLIPftyywYWWNogjYpEIOySIGwpdeKpHiDazhwfKeisY",
		@"KIWeLheaIWflJ": @"CPsFbUyEIctUQNBpjNsJniPRJRHBZJyaNHgfKiVLWOkPHmSrLFvwTGBTpEyyaZDFMysKlvBuhMTtnVJcaxJOCXarIuCZrOFYQEGANsqgTGFnRshgzfplWHpzAoprrPpnXMmHJwJWrEQzxnBFhvURN",
		@"uasMJjaoSP": @"ZgnhNQXzuKZUuPhLjZOabwkJuNcItQSBQqtqCCbtbUQpgQvjHTWWkrmOJBFuVohFPthzcvsBIuRNSjZMDQbuqUvrcnrcQnDwmkXWIllNEjtsuXmuIYLIWpMncfqngQsI",
		@"bWFLFQawokxnWa": @"oLnTOKeUfwBGtHBconxAwEPnTMVJkBUiykkCSyQOPlUDrkCmxYVTlWIeaZwzyScwDvjzZWSOtPwLzrEPbuqskYCKuNprIOJeAUGZoYvUIVijftrpZtupgmNXOVACVHV",
		@"apDUZzMWWBIMhEt": @"aXFptNprYIpuUymRQsRjcaQAcPKHYhrXOqguvbmxBgcIstivynnaxKALzDCqzdDgIhXUTONfBQgXExdnQoRZkPjfZPhoINqDyCkHWglScKbOpuuzgpty",
		@"PZiykshCkbAkwJWy": @"jkxWotiaGydEdSSxXuvUBWvgyZGqvVuTIcaKbzWcWlGvnomhKeVNAACtvOQLtVjgtReXSKKwRqsCyiWOoutmsnquQvtNAUWvoLHILzZyPGWuLxYIcodLxpWVCFHjICtICAcGCXFJIADxiXc",
		@"kFOOoHgUcZefpOM": @"AZUmvrNzDqZnDGwNGgybtIvLNGcnrrqvjhXnmlnnaTfijZRAEhPfLSpNXlwmZTUQNackhqlMYVNfCNvkfrGbSpEfZzXyBHvKgXgTtiNWzWCOIgSzxbdeyxYLmhBEOomxEeVjedWNLEscBSa",
		@"pwzPfSElzZzntQuepjT": @"YEsfHMqZyrTOUHXEfQdFiLmEMpaIcrqfvOFDQUNiDpJWpLiqYlHwMAmghzIVxriQKPrOlgZQoLitLilSXhWJlCZTwvJysNIQscecwOuISafbPxAW",
	};
	return oefQDzykzbobPGUV;
}

- (nonnull NSString *)LWQDIVtALpvb :(nonnull NSString *)NxcXNyyEEmX {
	NSString *dASWSUyYrsrlhjQhia = @"WrWLVJAjirBbzfcVCnltbyKRDlMrWmlQUgpsaclizQjKUwcAlKLasQJQBptpgfySQHcARIeEEloSLkSwQHXkplNSLVwNdmswZIWJcSWaRtVJyPTlvNRefZzsWZmARWUEIhcDhxiZNrLSNMb";
	return dASWSUyYrsrlhjQhia;
}

+ (nonnull NSArray *)jdLMoPPWSOji :(nonnull NSArray *)jqVFeCWcpESPOM :(nonnull NSString *)AcePBUJGHf :(nonnull NSArray *)uIYDVeUXJGv {
	NSArray *ooirFvyyPDedsOQNpz = @[
		@"jmjJKiNSETSrljrwAxFbjkVIExoMstCNZkqmqNFPeNzFFYZKpoYxnHBGFWqOwOgtWOnWWYKErrsxdyvCZEylNKzGqjnxIDKkuwscDKiaVzbSbYXNySzlZOniASPLQtuZKgaOxyXRyMjEArVZ",
		@"MqCQzXyYsXpyZnvrerEcFMubjSbvFXezXTdEJvqlSbRJkfoxgGryFWfJYtCYwyaeISCJnlxgLcpYrJNCzNDwtGOZaNyeiMnCsoDukrzrfoFpVAUOjK",
		@"OroddYQWmOKCDJIAhjbNjvqwynnUlcNRqrGflRhbZSbUZoXljRqWGHWixuKxDHOynwmBnGYQWaDWfuaTjuRUpguNQBsnWusvgJclrQLvMgHqe",
		@"oyZPcVyGiJDplrhTDeqcNUVrIhYWksPfCLzDyZyZZziQOdecDNidKuMlQnlIlqGpKyvoIzXummYAzVNxnKHDZqJChcRIbtDMrvRQXYRDKJZZXKKjrRBZcnEfENhANlTiQuGjYUJg",
		@"ikbIVFkLkuioMHqwLtpdlEElVzIsrijxttqIJwTDCIxZJwSoUnXLfjYIkomvjQhQQntNtXzBwTuYhRVpyhUfvyLLUhnqNEcfDhkDArhoUEEaPGjPooMjlkBrGJQU",
		@"kkEJBunUonYooRMCzRrxuGXhhbgFkTQhOPlUpLQtZWpJHocKgzTxTceohJoxUzjVTZlRZDskYHupyDQBwDWLcrofKcNddOnHVnpKsGlgZxrppzguJgmLzkgAREFaf",
		@"MqDyCiGlkLMozVttLAaSZTYgCNnMEKTsjGXJlZYqzZWZFfVAQffkUEGtjvsblIWcMHDudCmhraPVlfqpzqGUopmgeFLkQNcbUfHNidAqOgAvRJdZoGjGiYWIWEXiFdI",
		@"NQouriZfePnTwRbKCJOcgdROwRrIxkMXrqvRVBMBpidXxzaxaMRKokFxJGGrAvSVSELTXafYfgxIUKHofVJEvLNOZYbejPDUDbSEDaIohbTuBloWnZfMPchZMtljTNeUdkPihOlskUxRlqNlWtXkA",
		@"CsffrBcAmLUFEHpkFLQnffgAJJrsciNuzyeVJorDEmHQAhxYDDYQefCihKEfuFivLzlKjgXhfWgUxwGVYiywkjzQVFzAODafzZpmvCMjeolZHHHdpMIFndbPessBCnU",
		@"idHmrOSukUBOZtwOdWEMujliZZUxfAQKYgbkcYbCAQypTRtGfSxkyTIXbHWuUJKyVbOTtETGZkiUoRTVUDSuLgHZpHJYHslOwMlN",
		@"heGwEaMCTVFrYTLpSqzuMvvSkREkrKSbWVDMqiNHhNTBCdYAyuexCStXMjtDYNJFdxnMRPqJMvvGpwuhYSNoOWiPTpgvUzalWGIjgckBasznEfwtrtflYrAFSSxlysdvLEsZTzsIWdLftiEqrFho",
		@"bRqnkEYadOHkrGQBEwuaPxogINsIanighdrQWTErKkwOqhjjTHwiBbtRcciWSOHobfpkEIrZJlTDhybvClOAsWuKZOPdGQgjlGFWc",
		@"AYJSufEIVLLiwJgXGOTWKefzHPToUNvtBArjLgPBNeyTNiSdzXAODckfIlPNlFpfCkaZipzuDEMgBHnUuRRMONfQgPfRLJZKFJsPDCVmln",
	];
	return ooirFvyyPDedsOQNpz;
}

+ (nonnull NSDictionary *)PweeaHphMezF :(nonnull NSData *)oIkAJtiCzReiJxZx {
	NSDictionary *ZWyxnvHxilRut = @{
		@"KCrrTvrHoWc": @"jJZgXSxdwLgiGXbhsCITeuUhfArRVceSfbhPAEWQGntfqVYBammSzjOyKyZDzbjhufCzIZSCrFzuGRqeECKwjBNuJQWgYjtGEMZZGWNMambbMHaHtEVKPxgnrrihdiTPsuATeh",
		@"MmZwXosVHwIDnNj": @"uevLEKlhvtIzykLBrynoXrfWDbdaMLrlyZiDZoVIXYmXGnoXBwPrLgEZFzYWrTsVFwPJlhItqavPNZtCksCAcqRNGHykqxSPzelQYKJBYWsLi",
		@"qGQmIwnxYRgRQOn": @"gveaNakYztcetDWqgEjfzLVtDfZArUhacTWldWDVUeXYCxmQGwRdtFdQhifGXCWelFUtySHeoKuqfBgNBYBHmmAhKxDkfjITCexnIXQEbCHUKwlTcrGsbgihetneZSixTUGMIXyYglcY",
		@"oXgtcYqpRtEdwi": @"cFwjLFzTsKfMZFGchHUQggzjvQeOPUajTLawQEUzxGyXrjGUzbkYaAKGBnjrpwAOwelwOBHsQwyzpokimseDXiYCwIjfNdsBtACQQBAfKQRmJyTbEKkWdnWGPkvneYDLUXZBlcxlrnCjKjRrRu",
		@"wrssGptdNw": @"zvmkczBidFaKuEuNtNWDVpZImKzKoyStSfgSrLyvsOddCMYrCsMtOuJJEerqWPenbsQagQOkruxtmtZZLcvBDHEVFOzjYZWQoPelSYKjaQTTlUtVNfhjRqTYZMPedTTNsTigcxPHBZqKURsAiGqze",
		@"KdjJFIUzhWtgvfqFQ": @"gwSLgrflPLsEGBaYqpxsEfoAXgRxtGKHNvwpbdxeRlplBEssupKsitByixejYPKlFGdtOHYSbygXdkQmzwrdcFjJTirRKhjIauYbgKCjZXCbwfPfUCZPaztIYFpGmlHTtuGPxCEiTLqvcjXqEdBcf",
		@"BVnyKiYniQ": @"irHDGNHAXokuOnxmvXmQPGkyaysPCUcrFttQDoqwvpmpSPyFngkfYesYVcwiXswdXcyHdhmoOSmHMlhLqINIVZeajhxRObxrfLKzFtY",
		@"OVXRIbqueP": @"MQDOaeXzRcdayjQVQBvVpUfbPoDklNUhzaSAMTnbTqgIjElSDFfFjSoikRlqeLylVRZBltoUxIcjKqJyHihYsFYbJiZkUsKpRTstLQls",
		@"oLReXgvSzBvYQ": @"GwMpxXokhWVSogulvBCyLySRsmYfaPqBhtLhnsrXZOMXkWQbyNhRTwGFhXXPIKpBHSOzvFYhIxgaaQfPnxqGSONaLmOzsOhmdavfptgwUCyWOUk",
		@"hFlFevkRGlBilUw": @"flvJwBrIdXkpohFjOcliWoXZecHSryhjUNCeThlriCCHzwTkkYHkUiEFEMotDyTUuqpOtJhjuevfldYZpsCWmQJMOPPEKNTEGQqVSBuAUvkqiROWmX",
		@"pWHwTOrHIFqzWaJAHdu": @"BUWaqkhnATykgEQJzQoCeUxPLKSXlfGzTFHUGlaLBDNezrCdiWdRDtZvfdzXEMSWVtFhWEwoLnxUiRJgEEbrTWpTsRVAWaOcjwGsJsThOifFZgMntqgPFHQQkZHzTPdiTDlyj",
		@"LyZmIUzIXX": @"rIZBWYKEDSysTuzdQDbFtVBeGINDRKmeqFVksJBjAzMbtLEpLhGOYCxAHRhnTVclSumWqqREVVlUePfzpJBjCTcRlIJaSKnsVMlmeiHhHsSXfMAV",
	};
	return ZWyxnvHxilRut;
}

+ (nonnull UIImage *)YgaGzpLnkM :(nonnull NSArray *)lqaeDdkEpRUuFuE :(nonnull NSArray *)oXfziQvNkAywyW {
	NSData *BHDvlQzTcgeFdgxO = [@"PnxiDFyiWqysnBxLZZJZKPdCFuMlavngjjvgFGVlDFkQZxiSMkxUNpRzmIcZYacWhCqEwRNNSvPXnaTlpBjWinJhbfrCUkGJJMljDYHMKc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wkNEZrrDjfhw = [UIImage imageWithData:BHDvlQzTcgeFdgxO];
	wkNEZrrDjfhw = [UIImage imageNamed:@"RPFWSfLqnJXUYBtnROJhkJpkWFTTsDlauAicoCGJlbAXIUluYgDECRxszSxIgnWjPNxPyarDefyipupXxHiqBLGcUSfldhnMrTVb"];
	return wkNEZrrDjfhw;
}

+ (nonnull UIImage *)hvnIGwulUDOxWMFHRE :(nonnull NSData *)meRDQVJMifEcqbIXnT {
	NSData *PXDFWiplVoNZDKfnobu = [@"OTgbrMIuGUHPPRsHdcfNyshZXibuEJfnqSICMncKonuQIZyQNzOKxDPJsZqdnjvIdWkrtrERdgLTbAShATigUJAlYccUeeiPZOVZTJWYmkENTGyynlMCU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XvOQZCaKjmxFEeLwEln = [UIImage imageWithData:PXDFWiplVoNZDKfnobu];
	XvOQZCaKjmxFEeLwEln = [UIImage imageNamed:@"NZufWxGwsRCAITvCqpgzmCOVIgciQyqKsRGKShXjepOlYaalSCIIZzPIkipVarpJuMCYYduzNzzAhuDiATUcNkyceKdwKNXAqggpasakeYZhHDEsoWURYNTGkqSFG"];
	return XvOQZCaKjmxFEeLwEln;
}

- (nonnull NSString *)flNwtmtltgxA :(nonnull NSArray *)aKqgzLWULqPIGohGq :(nonnull NSData *)glqdBWrxWLHQlg :(nonnull NSArray *)wySJThzZOEomerkU {
	NSString *uYdgnTPZGfP = @"MQMChCatcyuDwTEITdWCRuWoTIKnOHXHTiUyUGBfpxPXUzDcPwlnmDjCERHukiBXNRMXAXByCanDJChYHsHMugjsKnCrljORdFuraF";
	return uYdgnTPZGfP;
}

- (nonnull UIImage *)vBZBlDksnueiIpt :(nonnull NSData *)WKDAyQtGJvIWVPIvP :(nonnull NSString *)qUgeMxXMiUdxRaOAyMT {
	NSData *vzaFPydVauvmj = [@"tTOHuZjkrHgfUKxIOgOqFmyrBtNKyNznglFqQlAzCAHmgPZryGEaNKQwPcjMfBGkgSDzWPufYCEBWCkkPMlOEwcxCutDeEiXUTEXMKXRvwiotgAFjvJwGxcjCXUVAWMaB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NaoRAnJxugDg = [UIImage imageWithData:vzaFPydVauvmj];
	NaoRAnJxugDg = [UIImage imageNamed:@"fffzpXsVbQitSpPFQfRXZlFsBetIybHTcjGYzaIqZvjTyEVIXwxZqyxozmcFLowmMlrhlPBxJoreihScIGPJirsdGbXyUAJvNwOnjjejKvePMhGYSHzANHmcgguWAG"];
	return NaoRAnJxugDg;
}

+ (nonnull NSDictionary *)YjUHzSsefAOlfx :(nonnull NSData *)sMFbFIvwjO {
	NSDictionary *xCjuyqcGSrCcftwfj = @{
		@"FNbJMKnwXSiwPNpDHTy": @"sWMAmoloZMsuopBDpkDmesAKkUGUvJYLMOIanScjInnocJusevNLZZtbquaGJhAiBAZWyTCiTKEuVYKgXfpbtfGEnWYlIcFqVxsBmeYSzVUE",
		@"cpGQQfqoJD": @"EpLGWsjsmfrzjtQYOZfmtgmsmpMrUxXXQiaZVSwgTmPfUFKByLFQkmMCJsuuWHtZuQleLybZMHeNHizQUmLZoOPypJKvsPZugwgipCmPUowevCSSeGUZhqwZqYEcjHUqrYktedArETSeydHSe",
		@"hNzeXhExjrkMSVbaR": @"BKUOYcgXmmAsbIfHpceWFmblXUuBRuauRUWcGtfxaKMRrJttKpuSQjkFJcRvEBsIZbOQHKDsZGDQzJHRujobkDECzFDVKsddKkJrXzSvDSRFmKDUXrUvbzPeFCNlRSwjsCWcRZMKAx",
		@"aXQtvTMRTpbBSE": @"hjDVSbqeYkCEUONszioSbDOTBxOnkYoRPzCgCurRZYKWoaYigpyFwPsAeYHqrZLzGDXphqYpnMtrYkFYdPTweIzddRkStlfUTwOZWAxMFVvGUnIObrRikwPQQnVYJpFFSUJISbBnbgeyNGBUdKx",
		@"eUdnWZAfmCPR": @"YeTLINsvHOWtlCOIUOxPnLYepFbZeTnbgpmiLgcrbCNOzKNbPMXCnDekBAhrVxqZGlUQhpspDvmEsjKGzgEIGSVdnhLcQgHtOcfMOxIK",
		@"BPgFlBwHQJudpX": @"BbJuTKAiBKEXHbCxMZtwMvOcZWFnaXYuObJQnTKdgWOMjXnEYnHJYReBYAeAiVEWEkOJJMQugxkJwQzzjZHYySFtAUMAEWSXKhWzcWsnqnYDzlWAZDlVOPFGpbEueAVkbwOC",
		@"eQuwbqGSzSHwMLXqcg": @"wsUSPHSeIwGzVnATtkBJUBIsPstHIqzVofGlZWydiaxhkIniEVeseWEBjSdxhrQruSrauMreycIreZfJzVxnEbAEkJjrRdXbNAazHTIirJIzKclmxlRfUxPmKoqPuEpagkP",
		@"vXylwmEjAgNCOXqA": @"yMhXuDznPYouWwkHVkyAZjUSchJBnEoXFGsTXEzkcsQxNNwkEnoYxtqprDrQuvIlbLIgzqZpEUJwLpCYnwqNORUygDCEhiwhilrGIGqvzpPtlnzxqbScDyFrDcsAxqAjBNlvpUWmb",
		@"rEEhZrBkpRzUFMpnkI": @"bHdJgIkmVfERIGlouHyQfGFxJzFoFoPpzvVtQoMKpZXCqkRmQxmEkJTpOIoYYAIUmneRlxJKwoLdbcpzDzPLQKnjKLootojnNsaUZoHOcIySZaxGPQAIefccUhsci",
		@"QdQksXyJFicKH": @"kUwGUJtHgXGpOWgugswtFWfexWsnuzBUPrqnppGJnMZhWXISWVbfgWjDsJBiLEwRMwuaXPxsqgFGVYglLmsZdIKRWkRjsTRWoBkKgy",
		@"hxbNkaAOkswhcqpIUyW": @"EWktpXEgCudLRrYdperpcoFYDzreItleSajbjRJxSGpKbJBdciImJLzWIjxtedlTrqKHveVEwRVliEmkGVRglDIkpCmSvvdTRAbtGBzlzWpvd",
		@"qeyiZsmFZAe": @"seKiYIWkNLzccAMkOmglNQhlYSFsicLlDhqFpLsVFLYDglAgPkypGekmFZpFNLtewvpLqzrltvufmumEpqeZqrIJfmVcmmLMSPWMtZadJIIYyPdMtbSMxnOaiZLPquaEOIiaMGGgcVrPb",
	};
	return xCjuyqcGSrCcftwfj;
}

+ (nonnull NSDictionary *)amkoytWEfORZpFkMk :(nonnull NSData *)TOOkKmIiqE :(nonnull NSDictionary *)THhrZjBGsiBI :(nonnull NSString *)hfGQYwMqAiKeYEnH {
	NSDictionary *cfTrTWkIEiTiNmyxA = @{
		@"gaoHdWeOKW": @"fiUJDRPLhfJtzMSxcplarCWeQJOJfYAKciPWhJCZMQRxmFARtCueGyQLCbGxVULwrDkBJAswUojIGhuxSRBGgsEbkuoloKdGiOKWcmHoGXMARsVTp",
		@"jOGtJxgXUhZWQhXod": @"lDSJueftljoJigMxeyIWtPAAWLGmsEXBimsrJVJHKEAoibwKkQvYNPtjjMRCwVGwKJzHoiiYfvMIlRxWoHmliACyNFuMXnFrjGURKdyUjelRQHdfhvDB",
		@"XkLMkfOabSN": @"pCcCIyXvrVsYbPRFpeQVAmJKfiusmjlwFzArQXSLMscirFhfSuCMQofikCTRayCCoFsAzlVLnGZvfYjoFerdZLbpjnaNOHUVQRcWjNHwswju",
		@"SYfXENRdVjW": @"hKDDgoYIZYQcktfkblWZCNNttZXBOOecXvdhUsmDRrIXpQpMuVMnpzDAkUjKTPPJFkeoUpchPUZCOFXcVtBfxgWHpmBoNSYQtCknJULZsnSHvCoKWVmNOmuRFcdBwuxKACjbHmCivqvdOwSG",
		@"ajXihOejEqKzbg": @"IHxWEWjVvAYLIHGDBmcxYUfkeZcEwSvLpxwyriQsKspELIRdFCdBlITNOjjAhFyFuuORxXQoQkMPRPuXIMsaSTwNdZEgclgYAdikUdBVvVwKVNvcE",
		@"raHYAbVmMJalOpnzXrg": @"meoqeiwKsCXWNUJgQESWgGuesoIGujcQGYYueeSJGxvRxJROjcaVwEbAmGfygdNbzQYQMlayfcPeVvhCBkUbJYIloZQZruwHrIhObRuxsMePePPUVUfJYfDYQhvkSwxWCh",
		@"UxNwxIMqPaQNd": @"XABbIRatWKeplycfuZsxXODPvcNQIEQhBUtobWubnVhOIAeEkdRtPKPMbqFJJDgLpKpnWvDIKCChUeTUFviSnIwcsUsBpQHwpipLRGFZNXAoUviSremvwfMb",
		@"AhcTwzTcuRuvU": @"dLcuCybQusNXqcLsNTCXbhfXSGvyHyUqXQbfBdthbBfYkMQuYAUdxyaExervWtqlvcaBORVYvJkwvChjxTOGanOJfuIRjUDCqffemwTIpqAnrOTSQLOuPTzxTm",
		@"otitgXFtBayOltc": @"RinIwokDczsZgBasgqrJzdGHgAOOCpeCUUCPqRPJZcATZCYnSdsPGpyhiGyWxYuXKwqletRMCZnLXguHFucVawGKLBsklnLPBqhPXGojQVSsqDHwRPNITRNhlqs",
		@"dRBfQSRseZoMYUds": @"HvYFQwAeVQvowxVtlukJgObdAIWtjmxAvRWgEPcSSvrnOCPsjsdlZYAzpCkBUiQyApEBKcHQoNKJtfJuUugfkXkstLfFhlDipJUTpJlF",
		@"PAloAmykxHGzRomrv": @"FJSocQePSxLFJnHOzUlDrObyxfRmNwEsHpURThITGHJJxSaRzutyjPycZlmLEtWOkSaIjWCMIDWUxsVrZLWKZTBFENcXlIGsKTGjhWEyNupsWgKgKkQMBIthItCGmmXmOWQPKjRV",
		@"PwZkrmVrljAl": @"YQTvRIVuTyWvwXkiXNLMlkIpFSxctjwmnsZCtjfoRkuLFEPkKDJgXyinPsDFnlPsHsAqyJqxyrlgUujBdQFSwUggPjIdGcOStkbsajeJSDySmRh",
		@"NDeMHUoMDVQ": @"gQFvgpIpJSlfCSwMRKaeBpggmkvbRiPASbzZsiukclhrVfazRXfPkXFFwkkXILzpyjkqmUNxWgqyEEsBYElJOuZNsBxhjrIBGzHXZuiLGivMYVJHodPcGinBoqNbrfXqcyDBkR",
		@"SXtwgRrtmgRWiJD": @"QxihWtHimjZlqSUKCuEqiWrvZNMPgpjRTrXoblwYCroElLyJadNPEiiMWiAWIYwNBbptEALKRDkwAdzJIamkvpgqvAGENrtDbRslQhIXSreSNAtyRfeiekqTUkYiOstfRTP",
		@"YbggzfaJoJj": @"uEmQtCviuqyMlwbdbouUWFyhnXlnNOSdNaEJIljnddPhfShMGVRXMExeFmEvJhcaOmfCnIlCbqYMlfikLchFHJQYsuqNLRIaxYOSLFIJauWbhxFnNYfFQzGlAnwqIubviPGqlYrcBIftMxnlLPYxk",
		@"BWuNKfYiDB": @"nrlAZPumFsPFAwxOwefnNWuUIwTdRtskZamFXkMYZJHtcaRCKoLivBHPexmTFfOENVJvMdAynhAxwhRusqbhZmdWjHwkBRsiZXHqkjZPhmWQeICYSPnTLfaNsUn",
		@"blxrlvYhVcVjTqo": @"aznkiLodxjgYEHEyLoaTRNCNdGQeBAiWsnpXFxsRpokyCmsbQmjAyyczvDIsOrhAppsuJIyasqIPYdCpFoQklzEzKtaNeldyAiUYIohucXSuYcvExdIGqncYEEvjxnuPkzNWxVXH",
		@"QpqNnYnSNXLXyyyrXTt": @"uQauOLkGWbqGfpmYXCwsynNtzHLgLoHCItJauoibjAgHdVAmZBjTqZokVLxOfMKMQUBGKEBxZVJaDxpKLFYJKweAjSdzorfXBlembbuo",
	};
	return cfTrTWkIEiTiNmyxA;
}

- (nonnull NSDictionary *)bmpzdfjghejDLg :(nonnull NSString *)UURBiWTsIB :(nonnull UIImage *)KDvyIljGyCpDPEa {
	NSDictionary *PiTfouOgOdgW = @{
		@"pUgGQOBvou": @"QanlwetfOhcwiCjNajHoAWiFLKcDlmJVpTEjOXaQjsQNmMjpahCEPPBfeJYYDkjpvOpWIZvmmrSWfQTLGzTBVUnySQYMIcdgyvJYqusSNPyEVqJJeTdSxnuXrtorEQYgGr",
		@"ZgCerAVjPNATHQLm": @"IsEIRKgoVzLklVwCjZdSEboqZTkYfZzmSyYsAOTwdyTWzxdhsWzcxfKxWPAVeeOhkniPacpHGMtDgGuDuoublLZwIjBVfGpymwQHLSzIUBuPSmL",
		@"hvIIHdIGrwHUqJHJ": @"csaWVofPxsgQsyEleuCKJjWgqiBpMqxhzFYrhjZmoHOAUeWQtJpQSOJpVTAtRjwtqATyYzGirMFXBaLrTPXbFFeNuLgRRxPImbvScsMsaputkBysWidiptBkFxaaLAawwbljVkh",
		@"zPylbIefFji": @"hPGFwFPjLbXgmRoNUAUlXmOGXDbfwfwBoxUDXwqYureVsWtAmSDcqvtTdVHkPxWXKugCIsyGKmLoGDsRIrSALxcdPUxlpeETLuTuSKMqPzLzjDdtoOABikiemoWAEqRZDoo",
		@"AiEYRZXymluLc": @"HFGNSPnzVFVvDPKGUubvFuPRlpQxTwDRNBeysVBPddBSTmmJCiEgJVBtkrmKIrjHqVoNdXrZImpbSBqBlQTHBdxsgLjflqGkCGLZxOZUXUGUkRssQbhhFVLYXmOJoJntYIuWxRedKOqQxSwj",
		@"CYIzqwmbhE": @"HmmYgxrgrxQDEyDEOBNQonXoKiRyDLQMEoJfEDkNRQipJBtWCnqBRsptbJfgrxbTXthNCNgRgRexASheAGVwqwzKOyEIXQWopKKZDSDmALMHQbSLmryE",
		@"TXkxcoDObGQuhNPHROw": @"KidJLhKfYOWmbHsmCKcAhBQZtjQTftRyeVKrNInwQOSifPFSjwuVIhgZcTEvLrwNHOCmiJOQzDbAvzAmuqTZsoUCOdsUZAtxjLCSPXHLNJlchpvufKIFgFPPxvat",
		@"wjijKwhVVUaYZVO": @"bICqNDuSQlYtPXspLGMKHeOeIqHEGkNPJsLGmvhtvsLdwBCxTEqgqPMvERtpKVaecIuVaJnYDpYRDTRApOMvsKuRxKePuotkhKsYCHKwYkluueCDMqRZP",
		@"nGWVXpNrWEPQmamQxzC": @"AVhKYLMvbnbnNBsRzKifnOhZFyqHLpMXepWfVUoSUITqqqtUNlZTUtNldDEHUFpNnDEifXfVctKJKCxNmlSVGVpGkeHpPUXVSJNxKHogZtsebrupaALVZxkYwNdBtcZwjlaKDYlSEpAHdzU",
		@"kpcbLaWPgwneM": @"MvToJkpcXlVCvBzHoqreDxSatGXFLZHtEylVNTgVhpkFIbJjeoPAlvAXlSmftxLFTACCWKKyjNtPRnmyeAIiaCoBoFcFaTAsrJBhVOvnAJBGqpiVLqj",
		@"wsnXisHDUELnPdXMbO": @"efItqSfAGvPSEsnEYthrsFAezJkhrWkKdatCEsUfZKNSGrzXtkuWHPsVsziAObKfeYOqRFEpxsUypiIiKwpgxViCnQSDoxBKfsKGPIdhxfLEWRN",
		@"uRxxOeKzCOnaQZKQA": @"AYBCZnwwxppZhCpyUnQcXjwsSMjMJJcoErUElSAyJQYbXAYPHSMzOaeTVCIYysCrpzXzRyKSqkMBaMtYNBbljXHMGDieHOQmcSWOcHSweCCfiWiEBWPWlFhyNcxpxUm",
		@"pYmXAijEyDa": @"wKXPQoQOtrSNnxSzLLqlfxTZgoCitPFcGOmCwSNvITgzqLOCXbsgnBiRuXCZHZJTFXtOpPIcTWtvvfAyBPYbbHaVqSNChvFvtMYhlbtFMAyFNdYCtXBlPWDdyyIHUhJGpBhOTfoKqaiFh",
		@"nvnGBoCGfpCDEgcXEEN": @"PNUUdzpzQCIyWEQzGCXfaJOTvIcbHsIXgexNCcYovmJPxFOoZgENYMyCklvBlLzixWdgucthaUdPHxTcErYOlhJOvVQlERceMRytdtCbJKakefabEwqt",
		@"BXgNMScGgZvLNr": @"XAPFOUrPgUOiWpmcdJyYWuUDuLRgxNPuYJVrlZoPIQKSSEzQwzdiiFyrdMbdohIQhGYQuGHMFCHrCmMWnIGgkZNaeHuOzODwfMFXg",
		@"BdGHCNamqcUUqWzmb": @"wrYQCKCMaYVArbWIZldoWfWzdEWTZVkTrNuVYBNvWgfSBkWgzolBvgoIAUgpTlCMQteJFkXKbwCkDpVMSqZfLQzfMVyBmNnWCsgliGsSkKJLkocTMo",
		@"LjEzUIauvaDMSgFZ": @"oCClLvpEqNPDsTZUieyvyEDPbEtOtOFlUWIOvPpOKQmqYrPwwLTgdUuwDdwVhkudPrcSMTDkoDqUiRtzheuRIDihMcJNGeEuXDUjNLTpYhsqSHKPcUyKWcbMiXHRIOLQNsladZxVDXkbSueoddE",
		@"GakJznormrpTYWOXeK": @"mZGOpLkuInROwgBWNJeUakgnUuYsiNsJbXzEvRlrzOQKhEGIlKbFflmhrSaoJVCxlvLEcZnvAkfOyVxeNUOLnstMutWHAbAdVRAv",
		@"CYHuUZpIWGIog": @"PgOvwVOaICXryFeZhBcfBWFZnuHHvlVfERfnKfSLpUmPlLgTBLUklTxaoCXPHxlxeLTEzYEnUzgIONJpffpXbsWTMFlMiwYWCilPCbDlYoYaabEppzFrLLESyeCILxNvbCaBmKOtpKppam",
	};
	return PiTfouOgOdgW;
}

- (nonnull NSDictionary *)lsQmafwcHVMx :(nonnull NSArray *)hfjBXQxLREmpsvhXcy :(nonnull NSString *)vOXxcFNmhpGhqjcnTN :(nonnull UIImage *)GUNudChtyQd {
	NSDictionary *iPsaHxQkvCxMLbN = @{
		@"NaDOIlQClSJXvo": @"KTLFpitEJhXeWUaLmwPONjBslyfPtLnDWzzjaTRYJBbFyuyRkMFHchzuhmIVhyqkHCUqtXZeUIBlQSulXvWLggJGzOSJXHbPyasuXdFJSJHDamglxfhlWgFmXDykhfpDBrZBTuqZNuTnJqNc",
		@"kSKKhAHsbWKWRZ": @"DERNLufeXuvojvIGXLBkwCVANTOzPqhTbbVPrLHkiAmzMwjUyBwUfTmeaWaVpUWIqJzQKYBsDrlYtdqonkdmPFHtXrSAjjSEGTRgafAV",
		@"bqnNDBdvPfBkdVYdBjj": @"HxYqLZHwJGIpsnKFJZlDuRqWKRtQOIyXmzLrLCwCcHvsfWkgTOpanWjXatjudMMgbNUPYgiwyUpwcNfQVBkREAmynZTsYhhmjIVcsTjxjUKjtOHbggsLoRNNBbnbIpClWWvJFjtUYefhJkzS",
		@"qLBQGBmSYwXbhz": @"zUKzRYzJCHCZccgSbgUFbzwXwfquqdyUrKJQfYDOeMqYxfGykGCzStqYALKzAYXinRYywmqZSkxQmvvlICnaoiYnGRQhFSJFeRnTVhXTTunQcGUfAxNPYjDFTSD",
		@"SHWSOyzoYimchqFx": @"QpQtmeNdcpzPSalpfigfzmWpArJqVEiSNUHhAubNToVoiUFxuieikEfdWdOaZvUdSlLnwAkGLHOuidqTJPQGngjeanjKGkzsiJdbLQjio",
		@"dCtiNvxzzVVXq": @"bLLbeHJKNxqqMQTUkDFeBOwWrCYMqToybZBVgehUjzmPrORIVEbbSteOcfIZQwADZZxwqprhPfBkLNwZwjYkLMYOLRfgUrdeDUHvBVSIvPyrQpVHmTlVAiYbDOA",
		@"OzyuffygKLfoZm": @"SsROuHtBmXjZXekrTsofgHETyancKDZBokYIemKlqwHHowvFTsFNOFSRsxqGeBpMCgiQmqRmlBHphDEWaEVfxyDLdGHTBpgVlLrcXEpDKQDhYNlSArwzxIGnMYoYQPnKuusHlf",
		@"YXQWhmLGbXXI": @"JlgwimUBuOSakwdeVTYJcBLZbGwbaaTJATsMKyuFafVwKqyuZiNwsyYlfbwoyGNmXPMXSxERwmyHdpeUrPLgWBaqwQEPUsDyDQrjPNSovpkcATQ",
		@"yjwLHsxKtSc": @"rfOyGETugrZiDGrbaexlHjINvzfmwcMLEVgsywQCRDFetnxsFTzVfcHGQZEwrRlJFmXIRCJIKuTDjjwflVdxttIRpBppukwfwqveNTgbleRLoDgrYwYV",
		@"BpfZWRaLRVMHaIaOJ": @"RWwgTnuRmifvvUitmwjSpLIsplSMnISqnQGvcbThcOZzbuUYonaDjddtdxFkmpqbalLFOnzYsbcGCQUrziwmlthdWQfeCpGBzZPvVHmDULOdyYmidqFGtpHFfutSubCpqLyUuSjDompFdJBNle",
		@"FNpuQimIuGgZgHyfopn": @"cKZHQospTwVUsDIYXDIJXabyqoHHqrlBxvgiyOsRYvVTTvXRSxRPOypiefHEArQugYXiJVdZgIEKdQOwshgzcJbCRxlamCZOizrhRGFGxFJSETfaQ",
		@"aeeZAreSSnivyOS": @"koouBWDQvHgQRYIjkoyGMvCwwyginnsJqLDieZJZGBibPzeHIGYxAAyOQynOgIqKuAyvifiTCeVxhMDnJgYiHLidjEyldMfgNGOfGHojwuZWRaiWAPtlLbPfxlfJYIeL",
		@"JnQsKiHJafDEhXVOK": @"MBlTLLiwlvecDjIBaaTqZsoVHOexrWZxcYvqHkQyKLyyHhQqMohyIKVBqMmBPvkwMSIqXdmvByelIZzXfBXQKrdFAezwCMMtdykowIHFntVytxmwAgouAUbcHOeQuiqGfOTVojWSjtAJE",
		@"LVxyjwRXuiIUxr": @"DdvmaqWUeScHkIjJqtsNnBDxSBnVYXEGonMDIzSJbffuMHlPEvTTGkTZDENHnYZeGdKsVIgplBBxGUBJSTAOldumNspFtirYfgIvxvEomVK",
		@"mOQKrqwXenS": @"ppKhKCaQezIETBijzgYyzjKnbMknOrcOrIvhMeRnTYOXUxpAuNoaZBBLriAgzRzeyHlllFgYeZCzDnyyQqnMqWSSuqqLjzlqLICEExtSlqyJeb",
		@"ClqtnFSpAt": @"MaWwMvYdEDdmaJNKpXKlykJvixnKHegNrHrEMOidkqZWNTtDmzXmlGMbROEYYhFVHSMWSkUkNFUoqJTznFCbZPDLonoHrFXBiHbRXdyjCVlQCF",
	};
	return iPsaHxQkvCxMLbN;
}

+ (nonnull NSArray *)IKCgyjyiitJVLImSBO :(nonnull NSString *)mjATCigboIGVCmu :(nonnull UIImage *)tKwnGpjUrHdypZlp :(nonnull NSData *)oIpwgcohPzZlO {
	NSArray *zimfmMgSyMqN = @[
		@"pYsINFhaAImDKKHWTcNilZgaHmmaHEIqWZhfqIhofjUdJNMFAAFEuHPPtXUdUbgeKXFgVQxLhjamKAWuSfWPePKGKgTCCPQQDFDjEhemqPzTGTuZmzemHCXlusiaitp",
		@"mqNydWYMucwGzbCkDLyVOCvqAsdMxsdUaJEhvkZukPbRcxnYcCmkUXQOsNjMRGLOCafSGAgKPjDDpyEyoBxrfPQpSdouEBhDyxeNjLAZCIMFHQiLlOyHUVcjYZnTdUvIdjDNOWuMfyaTZpM",
		@"qbyMBGjBsJRAAAlqedeLNMXqBsmCODEABizepMThDzlHFhJDNyDZVWOpVfOsNPIRiVeMEPLMwlQyaPIqxDDOoDWplNUPLAHlZjgGgoeTipDiJBNhtRtZPQPgHDVPXZGjb",
		@"wkZtSwJOIHEUtLaOHzhqgZUIuarMFYZORdlnzsOvhLwqnepYWpxYRUdYgDJJXSeWUrkSWvrvRdIzvqvrBgzgtpGugsrXPuQkEdCgtKjYbECCOhzsYJBhoAMRaRaxwVUHKsYdLNWZSytDeO",
		@"LjwymTVzPKgDgjxVFcUXNlsVebNWqDUGGBplRtcDGzhkZgxUGjmXuLklLlXWksQWnHUJHdNigDyMdMfKJvZyuYJCbtXzFzPhCzcfdjkcPyzbMsOUC",
		@"gceNTUoDvemRoyuCuCNAhiVfMxFLTxGbuUVzABXGzEcrIdVPwZkDyrsqSvvLJxTGwBTYRGFezRnbffronuiVprDZHxOtDrxCIeBMLWgpcICEjwkfRHdyjvdnQEe",
		@"IKniFFHQmkwPFJEpJVAbUVzgevbBrQEyqPOzvyzcYLtXAGzyHhFjwHONmGFnnEODOekOFDuLMPXgdfxCCDpZuCTaSGIbBGCyVfYRYndiERdmLGWvwc",
		@"KuDNZucHzWTutbXYFrYOYmgkMsXzByAzynbHvZdohZfSJEqFdVRpdkLXTBHyUAnIFToUaLAAeQAisqnkSOLYqssmoXSvQPKVXKfuhDlRnFpfSBQjL",
		@"QlMDJtVSSnrJdmcehKuiQDJVLrPbXtBxkPpsYvjVMKCCDsAHnEpVvrZczRMQqkFJmiCUTcNeqBFsQcPrDfXeFlCsvKWUTMQRaxeTIAgxApAQoShQmKvIyQIWMNEgqFMzjxuHagspJqoGyxpEtxk",
		@"LufOogFXuGqKCwarIjWgZeEIPzBeXLfaEGaguWzHRGvneyskbbVIuZgBBLRAbmEndsJTvOEglhIuuQZgFSlhkVtsALORSPHAwiKTTclgEBv",
		@"MxSBXIZJsGFwyQBevjxsaGJgMuOzkfeklBemSzKwDpBnnJoCQZmtkbtKlPLJxyekhIkerkzMFJNzumJCorJzxUPerEfcCpPaWnUejhlHsgKREkmQqJjkFseVfNF",
		@"WmIlvPJSITWKtJKnFBgCOiWtblWeeLhcVryoCOljJLkfnPxEQNlUEQETopKJcUcXrSjfCbdqlSQtTHsCcYskAxANGcwLsVACBSSPRMZGWEKnFnSEmtOwWYteQUGXilVbl",
		@"SGPAfpdfYltsedKyMetHjREMYxKPoFZVDleAbTnmUpGBlhbnGBdDcbjsmZTgZKZAlrnqplkxVWrGYtMxtogCzLhbCZPAtUubakmyyBuv",
		@"hFDnOlDRPLSQNCMqBprdcNcEZyqtOLATUqXxUGNWWOXTfRxIHQyGeGevUmBNSJrVpQjAtcVLCDHFHNOuNmfieUIhYnWywXDPtqsBMdrSDkxTrEGPuqoNwvCULzQrauLqiGHdQh",
	];
	return zimfmMgSyMqN;
}

- (nonnull UIImage *)XdnMqDEDPA :(nonnull UIImage *)qCcnMibXYspjSSsaVT {
	NSData *pgfZuAgICzyQSbWHR = [@"veqDQpcwFfFOZKvyMptRWdLHugWBfDXxIbavrZJldnvdrTgxDIfBoDQUJAsblqxWGxHGDsqYDjeymqCGzynBEVeEFGUPbzRdoslxzpqgnIOQfLxsVWKpKpsnrvDgjyF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zrqFCiiXBgJoeZWeYx = [UIImage imageWithData:pgfZuAgICzyQSbWHR];
	zrqFCiiXBgJoeZWeYx = [UIImage imageNamed:@"VskPpDtFExKQzFyTFbnhqqBOBFnRWzAAGIFXFdqLrqJDjvyfgJkzENsPWmSbJxFtXZkQZqutiYpCrdHNajiEwERwYqATRpsgmFHwbrJxhBqJgoPdQzNjFMEAgaDCZmcOwLLMBRkJRyijSURrT"];
	return zrqFCiiXBgJoeZWeYx;
}

+ (nonnull NSString *)wPKoWyEvnLLiZV :(nonnull UIImage *)GbxsNplmVffRYfvcS :(nonnull NSString *)kNtvhDzGgdifFcGQjS :(nonnull NSData *)TthSUzAlhcShDGd {
	NSString *qdbCZWbLzsKzNl = @"KdJOUvEDUKyVukumHNAFOHWLXznsbjuwYPmeuXczacpifjYeYbyiEQPsBOnGcRGLEwWLKUowVPcqSSIZaShtPJoJThtkOVBGpvQnftbjYyUIqhYqCWCxJVUCECNhEOWAyMMQEHSvULlBUTHWcgok";
	return qdbCZWbLzsKzNl;
}

+ (nonnull NSArray *)kohwOtHlUK :(nonnull NSData *)YBfnOADkDobWsRT :(nonnull NSArray *)FZKqYGhhuxKtnyqIwjX {
	NSArray *vBQYllJIBQr = @[
		@"OgoUurcDnstAijCdrlykGcZjZXluaFNTYyAoGukYHrFOFwjKWaWXQxaRVkVOHeysikFLXuzcGrAKfXhXEKczDkNbmUvfdWSkHFMaQiXJTJwBXxNjABVsBmgXqXeXlmaeFkHotgrfoopkCk",
		@"rvcswQrIAItWvcMMHrGpMnjDCHLlpdHDcbgwrxVbuEXWNkXpwyDkPkvEMShukyJvtpkzdxkNfIJyJzTDxSqXvZIuZenKbQiqUnjN",
		@"THADVNYeEqjVmEIqbEanwjNYeKMzKSsmyiMiNQqUCxMVuEdjcSJfYtFBgzrIgvzJStGYRcCkSNcYNiXKOMHpXZByeUbANzSQpsoLTJIpxy",
		@"bBrEtenZQPDESYCFHWcJofhxeAkMZxnpBXEarDsKdWklZgXUjyRjTVIANdOZrxhqPcdRGRiOeYECOcLzBuULTMOZaXEkyacluXVoKKgyloVIsWgiliNCm",
		@"bEysAPZxVvzZeaNcfRyNoHzNcVJodhoAPzChNAraTgUHeXEAVEBNNIefZqpVSLRVHWTVxflZXSnreShdVoIpkjLgIoFjazKIiRPkcbFqUQNZdRAIlaXksWEmgXXOhYZZxfaTf",
		@"eONQwUcesxnIuZEXheAbMeasbZZzgGETSFKQYekWLNzuygDuFmvxzSDUSucZfnrRLLYYokdKoRVPGPXvKkEQmifXBjENTWTfjxaONuKvYmNChdJLSkmEOJvRSOFAHgtcWkrXrDBxMykJkJq",
		@"TEsLymEnljHQzsoLKvmKRmwJclNRzxuwrFvMYFcahkMWvGcGwbiSxLXDEIwQBKNYbdWBTNyoSESkwOgivpCaWPHdHXpkUElhKIan",
		@"jVZYFTHzDBJLtZFZqhLPpeWRJwDxUTZabiFsalpqGtFygagIIoMNyESwwDVTKEuTEGQrVqRsBItuFxrcOhYuTdPXrjPIyfLYzqoyfzDUiAjvEBfGVTmjEVvlXxIyCgpgbQlj",
		@"UNAfIvTVTZjNDptDycBnfHmEeIIXeYkjUhjrDtIBquVeHXnCJVqyzgzFeJMGfyoesQVwxQGrgcUaQrNFrMnIeomyxawCVCmgBGQCeUjfgQssheDTXKzxULrdwDUdPRXYkskwFm",
		@"YIfODZnATlGrOqrNMvNAwRrHVlWYbXWEiZjhzKPPUAocUOpozdGHQcqDMYWdaNUsMgqXaMhkxuFTHXWjAJnRfdoqmkqrxDPAEMuKJUPuhC",
		@"dbSFmhtczxkLwnNFgtcaPJjFopsFjAosRNiSUznVnbWvmYHAglIqNeKCYzoqmwazRyUXucwAQtfpMYdJjZAnuGOQnulHOYTEStSjfoovyFrQCpQLJZzQ",
		@"YrnshbGthEoaOJDvmNYpwwwVcUBmSbRppATcbIMKXMTMkcWHEmQAFjdpFCcFgThRcCNKPbfdkxFRDKtbIpwZpkxfecqaZxDxdBBzNPECdSVXyYOAIKleiZUPe",
	];
	return vBQYllJIBQr;
}

- (nonnull NSData *)qrpTPPcHFRY :(nonnull NSData *)HsZgDTIMgwFlVtOzMQf :(nonnull NSDictionary *)koEaoJIbba {
	NSData *sgUwAPkcesmMCtk = [@"RlwoGyfqGvnIswAAFXBMdHWSoZBgDkwuYAeEXpRYOyuEupoASdPRVIbKfNuboALPEZDfjeHLzNZwRHqQyqfvavhkeWbwJSqZryxcmXdtVLGoNdruw" dataUsingEncoding:NSUTF8StringEncoding];
	return sgUwAPkcesmMCtk;
}

+ (nonnull NSArray *)bliQBnXZsfb :(nonnull NSDictionary *)GHmEPDYkehtuB :(nonnull NSDictionary *)dFtQtdXkcoZCnR :(nonnull NSData *)xrHbfIOujZLLPFrj {
	NSArray *UZLaAJeNMZ = @[
		@"fLRYDbLUwCotLJZDJlmffqxcgXbCufiUdgySfXodSZpDxGeyBPQJzWTaqjChbPDXbnoxLQVwvHUxXERnsuXMeNJMCTbNStqCshLoNWXFCddCUXWcJuNcinsTXuPdUnkHeomPT",
		@"JMKoGOzxzDyquyCKrjYRPibVXsyFixiXtEFlktCYFHtnvmjLkBUmWJJJUTKAFiQwgDlwaDJxSUwcXwQSLZPgTJfyMYBexnryZVCVBeTMYvYAvoxZRSVcgpFtJruosxzKXVVxrsiMhlbxMXyPvQn",
		@"aKOcBmMQIcwuBUzYgJvIXoroGtEArOOQbcDzbgKUrhYcvvUfmwOFfzecogwcoMjRAwghqpuQEQDjDwQRUBSLRQmlKWgYOFiEsvGSIjbMiNduuLfwo",
		@"DTFDvzvYhtYaGlYLITZmHnznfNVbVbnqxixBrAGCOYRnLxTwPosGYNNCNCMljPczJDFzHgZsFKbwtpszFAbMKyyZlKcDfCbiOmMLOGuWjgtOzqvZbqDzMNqiz",
		@"iJatiHlMYGGGDJnNyxCDGbBwoJsnpPrJbwqILepRhgxTOISoPUDdapWaayKLDqauKNMGvAcZAgzuGkpUYsAQpECRLYyuxCmaPPdohiqDzFCePGMgHfDaNLYP",
		@"DTlXOFMBfbUntnUUcHvElAOUmfNTmXhtfUVrrCVjCIrvcdXtAaUsGQpLcxZsAHOTegGjainaLQLesfHwjeAigLyfYVjkbhKXcIbMuniXOYZFoykangJkxWSfcKRmyplNpTZtLGkNEEuhONOop",
		@"woaiTUzKBxpDROvQSITvbGknJRhCjsHoFmmWmhUeklsxRYpCphmMSpTDVTpxyxNKqTZJwSZDZfAxjGIXdVQNmSjYDjOMwULthKVoMCjGnWTuVPtJebbiIGUmlKnrOqwsP",
		@"nmHlIyagOxBuDclRmwlSKeLWZvyHvQUoYEoKjDUJErdPsAXqbmGBNqmbWqDysJLiLGDZztxPFfHFVwaoLKggMuOmegCgFYUPPvTM",
		@"hNUlEpHDLIkhzCTARAlzbYXAdhrTYdmFYwCPcyxSxqGvXDwvXXoRULlEkTvghThSMkvjByqygYrnqLBZYiLVzwqSNrajwoJZizIzBOdZEGTOSsRbouAsbIOqoRoBhTv",
		@"aMZQNUSxGPMCvLlzBKrVVEnRITXcuPZDhVIAPGwHVrlHQwrdqmUIlvGFPINPJadgDWAURPaDJqRvVzCCvUzNAFYnyTIzedrfDJoURvknWyQBUdVuK",
		@"PfQZkdsAKBUbGTTxkRBcQEpVlNlLtQqnsKKzRWZHMdNPxHopKNAECticsAuyEoOPqViVjCtGeltwzEmMVQZjgAzCKoQfauGUnRwOwNklcXNqHXPMxGtLidXhjHsqWMaLswuORx",
		@"sVumYTBKMkEItgwzEqbxkxIZbodvcUWMJbXKYGbMwmRGFiOHxuIKAJhrTtOGkdAKykRoBwrvTkFWcxAGCCgfnkmRLbpMJWcuQzGZnptbM",
		@"yhjvCnldkaWhDYbFGBoroEbIjANpJWXleDMhWGFariaqVosoSkmfjpVosKebQpZetMPqBeVNtAbamWZXCPTRvVejLcvgASEkVheEopVnOlYZp",
		@"woyzjiToFQqcOTaFgsPKZbeNRkFOKyjdSeoNCuDlEtcUZWthsMnJFrymKyXNPTwbKgoYtjtBbZIqaUPsYDrjJcEICtavnTZEqypASlRwLTFgSCCVZatMMfgcIJcSoJMuBoEvigt",
		@"GEYqVLsdRlwLNphkuLMruSOnYGEPHsgfalTjLBOTlCoskhfyGyQPhRLFeQhyLYWooxnfVvGJutXNLSXFPpNGiqaKtPgFWohcQWNfPwNGbFJsQSjzGhKii",
	];
	return UZLaAJeNMZ;
}

- (nonnull NSArray *)mYfOTcaGhJESJ :(nonnull NSArray *)qeIewgTyhFd {
	NSArray *AGtbVuvaQYAgmYGiv = @[
		@"peFtyRlfWBJToWdXSCsfuCaEbzSJYFUpFQhNnOyxuaJNvMWscfsEbEWkLRfxmFfdwfuIdlNFhIzfbqeqxVkLDFfPHFLsCuIbIOIrtFGxKcHqaThKPfCPiRSSRHUCdGDGqqGHQcCXFjoqNTlkNhFNW",
		@"ZlnFjJjmhkaLSbbuLXesJxmsmSOfzhevqhgOOQpXPwKIGENcBflJkxhnjALWxhLGOfDEELTWmUgSXrDLKhjzjvMDaZdtJDdWSoyPdNlFpsaopoXDdKUGB",
		@"VvjCLmRluBWiPKgjWLaRrQteAxZYJICCcDwKzYOjBQImUgBXPQBFYMsyAGgXefHpBcCwFOaDGyaLQDTFmxovcXDCoYcxjwdWSNKZxJnGzhmvGjJDVqzfYxagfwhPcIndbdSFUxxixn",
		@"IXdGjXeADrOUlUKgtPWWIicEaGOucQrOcGAStHhROoAgFPBmYKEFllrbhZRtpqBAjIaxvpbpcVmaAOaxALUCnpwwaDQFjMBwWkjGWLqAU",
		@"oiEDGrUJhYqldbjBLUoXUXDdnVuRpTRLyvWwtATxGTEpmtRVRqeCvameaTpwbGycfnDLvONQscugIGoCflIDbgqyMlrzoUkkMqGQVlJWRPrHIXnzNlVoClweIDCM",
		@"xBXEbxIFPyOypcYAjaDnGCUNoIChUgdAruMVYrQRXrTlZMMVFhfmMKxKUvgzRtibkUCOKedrJZwPHoPeSufTCQWrfwRwSHiusVxljUMzBloRxWUVzptGnvSuSiWlnVEEvbNGobQodJuA",
		@"GxMQKjmhthUHJcuatEXyVxYVGxzqJuYfCwbxlHhEJVTQpuzgJsucCSPBHEcUWRdBdjfRCEGUrmzwchIqYpEKFOEIqaYtbwBhPYZtHuvEyKuOmUyR",
		@"uGCCvVWrmIcWJGnYgQTZEVwprjQOoocBWIRgRGlvYIxeuiyyWLqSzLWZmlPNdOYZrmmFZdbRSNYHLHppqjsHLDIrjetTjaiMnhfyUYDeYNXvioXqQOiCVsNyFaVkTKxU",
		@"BxaZXICErEsvZRqyavIFhhzQTNLXgLVhatOXmvfuXTdqHQlRUgYnCoEULYFORQXDmcgCRQAUIelfzAVdMnvysPLgkeCdPPKrITeig",
		@"xuYUMjypcnitQDYEkkgUfYZOLDKgYwgYmGzsTKYbieYjvqSzoxFOdmvhHgqnFJoOcPpqHGwSHValPYxlhkqaPvttAVyExYuSVuICLROsKAMpPIq",
		@"ofgJRnwuPXxDsZNTbSAMNHGayumOTtpOrfOOGAwKeOpIMkfcxGSbUPKcffDXgfCdyCaTqTFuRJUpiBIBlcsdrPaBhWgYkkMmTHQxFdrU",
		@"QOIBQakMvkjnjAhDfBaswnTBOOtDiVVAoQwAHNvkPpzexymzrErGpSTSWvUmCFPGqNWahHgEoEBdWpjENtudRgRekbCXhwRSqdjrQnXlrp",
	];
	return AGtbVuvaQYAgmYGiv;
}

- (nonnull NSString *)uyMmKNKdMMyucKw :(nonnull NSDictionary *)RoQAzPSTggGDZRoC :(nonnull NSString *)hHwThkQrZwhl :(nonnull NSString *)HgwgtubOYGweUnVTd {
	NSString *EoWJMMkTMIR = @"AbzZmxqqCeXKmkvPUHUkwJAtPRbpoGfDIRcjxuHMXStexgywNXUMWGDirYqOfbrgFtjzZZizVYanyIALyNuqTpHfmrzHhazHhAHTGjcjokHY";
	return EoWJMMkTMIR;
}

- (nonnull UIImage *)JaPSHVIgRCCsdfttQqG :(nonnull UIImage *)dHPmrwkbnQHvp :(nonnull NSArray *)VJaTbrcHbYc {
	NSData *mRodROJOCKIWCWo = [@"WSkfOUShPuWpnNeUGAJMKrYEfPXoshegbwxrkFVebqQEIwBUqdvmKVTtbTXEpNnFXajzSlsKwTBzxzBygEmhoFKHWLiCrVlWzErSImdvGDXIUvPrWjQweIMhTZIM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RoYuoeJFuQ = [UIImage imageWithData:mRodROJOCKIWCWo];
	RoYuoeJFuQ = [UIImage imageNamed:@"uCiQNDwvPqGuhwpTWjRDXfyugTQhFjBalhFmNsdajosJyKBCutifgiLiAuQIUrGgsVUzSFBfERMWjbWSVLTQhdxcrDanWvgLhszq"];
	return RoYuoeJFuQ;
}

- (nonnull UIImage *)MIDNyHrxbzb :(nonnull NSArray *)vfAGuqHuZWAaXmF :(nonnull NSDictionary *)KYFPVWPznKFYcLvE {
	NSData *xFLiahLoAuWtedR = [@"uoufjAinnuwAEGwKcYLGXUZqpFOvPKxTjExbzYxLhRXAhhCellWrORuhRhouoVFemCoQAVeDrqweULMOERIaICgvBzmaSvlVWWpETuygszk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yRqNJJlWlhNEpPsY = [UIImage imageWithData:xFLiahLoAuWtedR];
	yRqNJJlWlhNEpPsY = [UIImage imageNamed:@"oPYZwVdkjKcQncVNcTGMiIhMWqsOxAULJbGcIhwItKIDpEGdUAZSxzkGIrANjgbtZSIwSfnQNtfCwxbZjzMesgKprPBKFBBPNJrGWga"];
	return yRqNJJlWlhNEpPsY;
}

+ (nonnull NSString *)cAvHadofnYEl :(nonnull NSData *)OHijJTqNBcpJD {
	NSString *qmCarlUxSWLUrcgc = @"MUavtgQfraNZhvkBeEBzlfruLDeBzhVUSoIjcGzIbgzfATaUnYtjyESDfGBGWVkvgBjpfdtEZqHMJZAxCvNMJoSMgxvnhOgSgbzcCWMEthbUfQeYvORdWwQAsgbvaYgKx";
	return qmCarlUxSWLUrcgc;
}

- (nonnull UIImage *)tUnJtnXzNnWT :(nonnull NSArray *)ZCrgaJEfHpvaqAgUVA {
	NSData *eBhGaOrlzMePtgW = [@"jErXmkuFBIZkpQNxGzhXKHDlWQpgAwAneKvLGJnryGvRjufbAhKxdIHpxSyhnlsgCmIWvBbOSlkqfrnyLuJeBjuCEnWsHYFhuHBJlTcKpfqSshpUDPGOxrZdsnJRPUwUcKoVxjl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NflNAhIGHhHDSs = [UIImage imageWithData:eBhGaOrlzMePtgW];
	NflNAhIGHhHDSs = [UIImage imageNamed:@"qbbYUkfmxIaKraowPHJxdoabBwgHIWcgidFzdnlvuzgeJzhkbqTajybHTOHJRgmuBXEiQRmsJWVkmRnxKTrLMmbiFEhMygWnmYkjzmVrqSrHTJHUjgSrRzjvcdLNbkWShEWTIeqqGGIkQnH"];
	return NflNAhIGHhHDSs;
}

- (nonnull UIImage *)nCqQnNqlEFnZDlvBO :(nonnull UIImage *)NfRVIHPUBTXDhUl {
	NSData *GuFICrApIhfxwFDt = [@"KFLVsswceUsSIUcHvZFFbvTBMQeiUNszzmYwpvEpVxNXfMRvIADXFQPOJxsxLIeoCPGAakPlXSXVLLgClBeBaEtkASdSqPQavPbnrOyVCfiBD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TvFsUcACtXRuaM = [UIImage imageWithData:GuFICrApIhfxwFDt];
	TvFsUcACtXRuaM = [UIImage imageNamed:@"wUcsscoFALCPlxWbXgRERUKvPUMgDrSmnhLekwedOJWkDfxqfvIMGYramhenxYZXkxqdBhixGlkqGQQuNpygzevYczfbFLldwhLkkfpPWcvvHcVtADQIFPMjlxQsjFSMKscLll"];
	return TvFsUcACtXRuaM;
}

+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor {
	return 88;
}


-(UILabel *)textLabel
{
    if (_textLabel) return _textLabel;
    _textLabel = [UILabel autolayoutView];
    return _textLabel;
}

-(UISlider *)slider
{
    if (_slider) return _slider;
    _slider = [UISlider autolayoutView];
    return _slider;
}

@end
