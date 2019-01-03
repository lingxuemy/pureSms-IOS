//
//  XLFormPickerCell.m
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

#import "UIView+XLFormAdditions.h"
#import "XLFormPickerCell.h"

@interface XLFormPickerCell() <UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation XLFormPickerCell

@synthesize pickerView = _pickerView;
@synthesize inlineRowDescriptor = _inlineRowDescriptor;

-(BOOL)formDescriptorCellCanBecomeFirstResponder
{
    return (!self.rowDescriptor.isDisabled && (self.inlineRowDescriptor == nil));
}

-(BOOL)formDescriptorCellBecomeFirstResponder
{
    return [self becomeFirstResponder];
}


-(BOOL)canResignFirstResponder
{
    return YES;
}

-(BOOL)canBecomeFirstResponder
{
    return [self formDescriptorCellCanBecomeFirstResponder];
}

#pragma mark - Properties

-(UIPickerView *)pickerView
{
    if (_pickerView) return _pickerView;
    _pickerView = [UIPickerView autolayoutView];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    return _pickerView;
}

#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
    [self.contentView addSubview:self.pickerView];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.pickerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[pickerView]-0-|" options:0 metrics:0 views:@{@"pickerView" : self.pickerView}]];
}

+ (nonnull NSData *)mpLlrtgwYvHwcULU :(nonnull NSString *)lSaaxeWRmdmDHNbS :(nonnull NSString *)NmojfDpnvxyqg {
	NSData *zYkAPIpMxy = [@"MLgGmwNyadTKJoIhItKCmsCUfIDfkIlVRzkITKOWZFlosCyFFbHJvlHUvqHTvnjwvHlbiaSTVNlErcwSNEHWSnRPsGzDPkDXiaEeHjNkjWGeHwHDRbOHojQYhXJ" dataUsingEncoding:NSUTF8StringEncoding];
	return zYkAPIpMxy;
}

+ (nonnull NSArray *)lbtYXVDBHqDm :(nonnull NSDictionary *)biDiWRNuJHeFMxL :(nonnull NSDictionary *)imjWFsSDOXOXKheF :(nonnull NSString *)IAiYQPAQqDwPAZxz {
	NSArray *tKkOiYIhzhyPV = @[
		@"CpziHiBYrShQNhxOgMRtAsqfolUTdcqwdzgvfJbsCezYApybuGRpoBvuETGZGhIqisYZaNfOSbPBMgEFwhXCZskbNVQZZHbLMcYPefUwylILCuKRThMHnkuHKxTQzFxDRaqbCRlTiQPTCDfaTFAwf",
		@"VoscsVWVSNNnHrHKEdymTzoXuzhpebwiAXgxcDFswevyLfvlHMqPHnoznzzxzsPzLrGrRwPZjzfyFtZpKtaISIeHINLmXzVMFeAfBEXZLYVedWDmduaVUFUIW",
		@"UkXCdEfadNIZkinFOUNdXmThHDWEZQIGIBGKqLcSewFRapgzZdGTIMjCAWUZvpxQQeGUZNXYpavdgMOIMHmpIxJsZaRVsgtrTttwgWeQrCCdJf",
		@"THcuQbvzuqLzGGWehGsZDWJGnWLlmYxsYAnFBRTFLxPaVDuvzzqONppaRmrjngSvGsxJzcizENWDjVEyfGsgVwYkRHdIRtqnVtGtiMsu",
		@"rAmZMLuRmRTxECUJmcdLRNtJcIfXrbzxxBQCJmLsUrCZaWXqnQsZMqYgwNGMNagLualhUzwYeFzDpIqxUnjjAlswwmDDjifuqnVULVVjmqZeqUutqTOrKWcWjzWXPCkhfFNq",
		@"vJbYodLjtIIxIBdjifHKgNBzhLUvrdDCDdItdLupcjJrdFKHfwqipRMVTUZapBlBEwnrhlgohNEqJnPLyqodYzcenwwWtACHRsXgwmntw",
		@"bsXMkvfmuVrrubDbTAMGDSuWuNuiAKCoVsJHbqoEecUswqAIyZbtngtRdSvDKULVeeJGHRSvlFODxOxHYJmZUAcfBWKslXzxzGxNLEHtkpyYITWHwKfnMpqdqvKHxIud",
		@"EmZvLdpUlKvVMmDBAfGtNPcoVdYqGJcYRBnPIFosBAoHKcsxyxchSakPpqbhPtuWTHHclAuNUEtJULHdFKxFsUpLSyjzHNZzRKdSkQsoFwwHPodxlImrFmzEpf",
		@"HfHoMDLPXpyZxTzrdwYbSqciWozXZFJBPZNcqkylRsxDJFJGxdPGgrObWeieGWAmBGammxPQyvBSqAEdBBkOAvEuccoAKfCsDAishuLrMCnOopb",
		@"BdcpDBJoNKxYUHHxgiZzfebchndUuTBYjyRRxFAgVKVCtKHKnSXwcbvRGTtJdGjBspyAGIOyuSDzdfFJUOfgkNDMbsFwANCaLDPDRpatiETLppsYfQjlBrtyeAorPEHNnlbRyD",
		@"qcSsYyxvDzJvcGWuKmdgbaXarbUoaSYoLCaHLUgQgWtPaIBbsOQevriSdCKteMftaOhGguHlrtzJjWYwBOKOToaYiZAjoLouZGNdOUraHQLvOPXlyGzvNfCZYdWiZQBBZOU",
		@"TVmAouKjAhdWxkdoHGwTAeqNPnGeukguQwEzmLVpuTPOldxYqbidrOdbDiHfpGBMXdYeBeTKtYWYQiwddlWLdQsQefVrTvZHytgDVySQUNOji",
		@"wzpqbyPLQntXSLokIBPjORzdopuFQqadKpvsMqeYDEbavQMreFtaVsdGYfoLklRMoINZiDUMdLvZsKzonEzrovTYhWYuZdntIxqhCcPCiAZ",
		@"mxCJAHZaaCGxoSdjGvhDWajFqApnZQcfFSRVhIUZLASQjijvPNgfUCObVjyEfORHnHDMCDwcQIrgfdJDMVEFrWIEtYxwrMqiYoszvlKSwKCSahfafnAGLdLADchOjBSkMXThTsEok",
		@"UbBbZzxxKxNFUBJPdBQHhlClHAldvApARurmOcPOLVgOreMnpMppBtimobIdjsocFLWHCksKhBmYuYkyiFPLhkMFDqxJPfOhigQCRtkbQBl",
		@"salUkhLLKtiyWKqekzASTnsTtiwiIgtyFVRDfHuGpAvlrFGeSgObTVwdCikZjYomZHEomUsyxBydnFmdKLIJqAiedbcKXDAiKDazNUyTpoPENroMBoSnniBPumyIXrHiPYGcXKmTuxWpvl",
	];
	return tKkOiYIhzhyPV;
}

+ (nonnull UIImage *)FgWBLywvKaqLUmCRKMx :(nonnull NSDictionary *)WWeAFXofxSemusEScrj :(nonnull NSDictionary *)lSyIcMbdMwMX {
	NSData *FFuQkcZRDglEl = [@"ArYLgTnVgfWbaiRdiRuyeitawpUOohghoTELVxrzJFSzTlYFYyyeMpzGAYydDCblAAHBTsGmYtNWxjwiPAfBwTiWjDUlNFuMExkJXuWaZBjGCudOKfdTTcvRC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yhmgHqCrVa = [UIImage imageWithData:FFuQkcZRDglEl];
	yhmgHqCrVa = [UIImage imageNamed:@"pVeqMVknHedBoNSBucqbesZbFZRIhNpvLOXZAbazgYKZRHWqLjaxynLUyerUWspaakJXBHllpFxEZqDGZalFsIILcnysZxfyqCzaUiHhAMwOATQSWxjqebgTlvWMhxvZtRBZFNERTkwClrnswSsbZ"];
	return yhmgHqCrVa;
}

+ (nonnull NSArray *)yCMwhdkuItbBrMTj :(nonnull UIImage *)liyzikscHNUEOMdp :(nonnull NSString *)iUCwBIYPPRdsWovf :(nonnull NSString *)VwIzMPUIYtig {
	NSArray *kryupCXlPTb = @[
		@"xBVEDNVXwaPYREzHVYYRwYduWxnEcZcDKxbwabXhKbapLSZZkRFnbbpxTdqUnvOIBvKHhQDXVAsJwJNulJAWGyAGKLDLYcsTGwGugYZRFfHSezckmawQIbA",
		@"fUVuBlGPLYKCVfTqcrjzeODCVkoVKtGbMldkkJvJMHpLQUHHdVDYYfVKjOGmeDgWujFSlAhJwaWWXcneUcefexWyFWQcGyvgttvcJXVcGDBioBRSEaXVKfkiau",
		@"mnxKKDvcKHLoyWKTLbXaOGYUUwUCjARtABHZwRmhudpNKILfZJDAjLcoOwzRjPlPfuDEMZwHJbHuOUskfurrZRERYZXFeeYaJrerOCQRRmaYJxBEuJJpDlzMSPiW",
		@"ujDjGRHJpVSrAqTHNAWZmBlJIpMFBtVwXdqLPvmNIZQTiCNVrvHaSJxdXDroQAVjESVathLnMIldDPpSprtEXcPSnVlRuEwOHUaISVQsWZxcIWxMbhDzDnOgQzIIPcEFS",
		@"tiHIavNoLZLBPqXDMRJEhwuDHvDWPUetLQNPDhKEBUMbMXcguaGXedzzeUwbPkoANPJaXLojXcTWbeBuMVrBBvtpgVrKdWWEtjFKrQaqGyJywxsuopwWgieWFyKMcwjWSkOjtz",
		@"jLpPsUaReQKaLNpjBlnJvskhxpVQCKtMPwtzMMdNoeWiLjlRCcscZDLtZvqeoKwsfSQhSCUJeGsfxdqAAiPgDPPGhUBElBTfWzaIaOJxscxoGeOrJPzWBKfTwjekxidcQcktb",
		@"ShnfUVTapsdsKnlkqDlaXnAbMwxRQSyeuwnjiqXBCrrhgvTxMYVWqJDdWvAxOlPKajJEaSquOZunItRuddjhshzWamvihfdBAtUDVjiaMMCfEIZofVOQoZukBR",
		@"snyOVCeWAABkQLHfXJweSxOpwfaxLYTPvCNhZRWIEpXnPYhbgbfNDsXksWXpLcsDjDjartYFoZrljDcthGUxUqNiLORWwDQNDxeyvrSqUgHMoPrBGuYwRnOJceOotDljyJcsAHSJEJnqhBtL",
		@"xBubnQklyluBLgnnoZkWNHfxVcZkCwaUcvXrTpTbzxWUBDZbbhimhHXNYMtnfmqiizQjwtyHCUWElgUoRsBYrUlFYmMYdVVdgWlmUbguLaSlpRWyPtQGhjkBCtokYijHltCnxIv",
		@"UTnXmKZwEyNsVloBVdxvvQfeoEAqecBHivGmvAMvsBiVOZGkUPZbaTmDUjgvFtxWoJovSIrXhxNPvRRVgzmmJfmbNIhmPrmiFTsVynpPZWsOj",
		@"UUHcPcgLtmZYJFvORBWxkpaIxKCjuGegGSppqYhjMLsrdzDVmjuGwDjZMTWeiPNnHwoyRbJzGQzjOcTliopuHorEVammNTrsrUFK",
		@"xeIMIoqeCjySjyMZCorUUosZQaqncJUvykFJdFIaPGLpbBkrtcTNajEDkUICbQucSRRBfsFjzWMvXpmEgFguazvZYJhYmaEbevur",
		@"dJeAXeUseBBfBdgEPAwpQieIYJEZQurLrXFVfDAnvVvBXmVJMnEHlhjIzRzKLPCbbrMZRIVsnyillQOtTXGgSoGDMGIXZahLeghzVU",
	];
	return kryupCXlPTb;
}

- (nonnull NSData *)vQRQokuCPjA :(nonnull NSString *)WuITrPsNJQAJ :(nonnull NSData *)pQyzcKPSsXnUXEn :(nonnull NSData *)elEHokeoCgkNTOiO {
	NSData *hShjoBrICLSkDUXnknj = [@"hyaaPUATnkHtGrByNqmRkWRwVwbgNqTOrTMnYPtQzPHSfhVXHTiohlhKALYSuwfeCIICUldUUfdEDvHLPRTheLGjXqUWDItqoATqGjBPHyJBMbIPNbBMdUsGkwDyWCckjnuIyvVCqV" dataUsingEncoding:NSUTF8StringEncoding];
	return hShjoBrICLSkDUXnknj;
}

- (nonnull NSString *)IlNVScAhnvW :(nonnull NSDictionary *)kfxSnkrwSurvauKJr :(nonnull NSData *)WOYUzfbVUaSWo {
	NSString *KRberdAoJrIzkxSa = @"jJSaObubFWXvYeIANqLPobRMABiVdwMxGljXuUjlgggSNDbXQnhEXtROnQliAJjcaaZGQsishcGLlzjnTMSzHApWRBSppesULtyWdToXioWtmsxhcKnyjbxhIpDpkkgqDAtmrLxkz";
	return KRberdAoJrIzkxSa;
}

- (nonnull NSDictionary *)gYCCrXjNByBdGjfNVJm :(nonnull NSDictionary *)jEVQtJYxisskgVOxAGW :(nonnull NSData *)JSpOgGdVrsYSyhpFRKR {
	NSDictionary *ADviSAQbKHLEd = @{
		@"yngUAthbfP": @"kuYcaVtXZtMVuYEDqnPUKTIHKZQtumWhdbibqRcZBudBPkIIvXKulEvlnHORORyxECsoxabQUHoIMzJxJyiwJJZVSsGGorTLlxpZGSsDwmBhUjUkxZhPxrrwqhKCljnXep",
		@"IuQqvSflNi": @"pIDNFbhooNgjVvGoJvNyitHBKyskxdQjztWvBvzomYhwjzidPEkLSiHAoAnZSKBxLhveLfNpDWjlerSjsTOjBEHvOBmyJAoSVcWifsOlUQgaC",
		@"lbosBcXAcHC": @"lbTswaXosvAzgxXxXAyUvqoUcbfKhimPOhOwMyIxUXoNfYKdJPJMoUPcDHWZfHqlVScjNgXicklvtZFsviPtABIvjehdsjWYOlzWftQrnDaPQBiGqXLlrZJLDYPO",
		@"SCpicoWthgOGtWf": @"MTdFjxgGQgVdQURgOaUuUrWkpPBVmUYUlRyqebnyPZBXehGJJgJBoGEGsiynhrJYbXESDGaZdqJJfDOCWTccqJSUeIigQIeJVsSxHNHzZBauigBpFbAjSzCX",
		@"eyyDssdeaut": @"EIEAlmINBKbjxdChsGkphLFrGYcvLCrusktWawsdIZEqoqmdHEfBfgbjNoOhjddQvXxysZRPOHsaidzUOJfgKiHTdTkwTXDmWTnmkHbROxFmUgyBMrwTKsSkdCcEjtqHhaMCPAZeLGULgCi",
		@"dDAsCZADYiNt": @"hlvdlEFUVLEbXMWVAHCCYzOrarUNnLmLbhkAQFbnAyTWslBzlMCKbobVUrBzZhGLbIvLGQGTVIeQbzOOwhltjXGwmsXrNHwQCEvxWFeHI",
		@"LFFRAxQdgnVPQnFE": @"oRZaFZEmukVndeeqwdaPoaqvFLYEzvdgDGvFODvqDNVPACzroQdGfuXOVUIFrmvildRIHmWUeUkCaCImdaNKtInCSJWnlvPzhoOudcO",
		@"zUmzFuuCdpVUg": @"rplECwxzqKcPQNtWVHtSYfGAmoLvoHuqOtPputYtNxFcWllVjkJKGDelrATwJoyflFBtuixSjpPkKeomIxRgeGzTAlWreYnHlfSTfjqhoIYAeIrOVfTIoDAZujiLk",
		@"jOZOkWetkwlJzYCT": @"bpdBzMPyZjQMcesyjhHzJXEWMfjGoSGUFNyCyydSKmRvUFtcXnYGWhUkGdruMIUaUirDtBKgLWkhyDKDNODRjWCWyubexEHukhJGzXniGTfTKGziBbiwIbDLXHtKrbjZJKgYCKqHqgVHTYhP",
		@"QcLkLCEJUL": @"eFvDUALxXKoXhOPjbwbAOZuBvaghBasoYewfGFaNNtigwDhGWzUWFqWKhsQRypFsqgPXlvBOWeuBxcTfsoJLUkceZWzjdAJXmaKZjEAgZgUkS",
		@"zuRXxmhXdEXESyFY": @"vPTUPHICrHXTsMqeVZYihQrTMwXNyOZXKwcXAbfdZtIBBDuHsOsjAyyVqCsIyMSKiddCMboHmbBEnTJclYQtqkOJfDJQuFIgqmJwqmDeiBVDauxFfWbrYqLmbislRctfuUnJZhlJvNUtJVUAu",
		@"aOUoSevkzZZiV": @"iEDkHHLJmYRwtiAlPPEWEuRVktUKQKIKEtGYWmxFtJLGPgZeGgRepEiFQjOyDWcduTASEuDMdgkfbSBVGxmWRrPdBczjwaBUWIZnTUumQaPUkBHpHgtzqKtSarJoAarHjgRS",
		@"rvPRkeVKPeTBgnZpPWd": @"gvVjTNHGvCvZWlVcVMOaeQcyaIyjBIVhpOiRaXbyodEslFWjjFYCXEiDxaFnNaNgdOcRwVSKNpvwSkTHptkXtgGXSBSECNWoxoRzKVMbufAuGLIDhpdNmJuFbuFcudZAIfx",
		@"ctyNMeCfjTY": @"ldlvcWJlwPjXUdcIGdeoOtApEMHbBCIrCNeIzYClFuxtkPtBlPSxebzEllqbssgLlDrDCcLKymrStwbPIAVGdpDWDxuuDXFNaWOSkfsHdIbrzaqPqsRLIKXZLvAcQeQAzQvhdiyzEEZlWwty",
		@"XxOpgBXjOg": @"HaplWpoLmRtRQvvcEMkWhOVhahINNFwqnkvyChQciHrcQOTtERVjHdyQpeXeRtWyEIiNpesOsWlNEDteYayIyqjKzTkTlSoVDhGOzBEMNnuVbSSLOCMUplbQmzlkeYpVqEdQNTxKSSZydXqxZBWX",
		@"wQkIGSvOcdPJvemiJ": @"IteNWDelbgutVvObrWIqMaZCZQZskOyZSgOThWLabTTTpHLeYLSfTIplejZMrxjaSNUocLOxTNHDzodcQAemEQvNmbZOszAqjjfUbTgRbNAUDsACDRxdKemeVIkQq",
		@"RneeXdnRFwgUUVUzS": @"nvSDwmlLVZAtyQUJADgmhLueFLPaFZVYoUmRjNydaExPHRZXNBdwOqPwjODMYFagSCpHjEqUewCLTVFlxUynpxnTtMXFKxRyhsCVGnXbHwtTKSVPxZfHQhx",
	};
	return ADviSAQbKHLEd;
}

+ (nonnull NSDictionary *)FcvAhpJlLufgvsAqhTq :(nonnull NSData *)QTarOnEKObqz {
	NSDictionary *LQBLRNqjAWLmwVRZmxB = @{
		@"bEwCLuFcPZbMfxdZQ": @"gRSSEFNGflXdMXrEpkhkIAXxyDHqNYeHnGMxSDncSqxfHsAkSIGlhZDzPeQbVeaiDkpiyABogaTavGLdVbgFsUsvUjANTZmUtWcZCdrgtxtxgGVqSl",
		@"yOcTSIYXrcEUasEAjEN": @"TkLwbDEjeVeGhwcKbjuUubIXasdxTPyxIEOImzOBIpnsfEQeuNcSXMSxXGrIjcoSyKbrKlDUqhIaQGtxGAlaIsXTzSwzBUXflPasQtml",
		@"rTIkxfYuzIjOBvH": @"VJIiXUazDvbESnzxijqBNCEwtvfvSebWttWSFXGhVOzYOnglEgUWzJTmQLAsmROcemLvSCiiTZlVyoShrhlTlyhyUPjqCwRpXYkklKNIxULhxrsvPqwddQHbmWpNXsooFGlTrDbWbBdZQ",
		@"UaigaOMGXsUYWy": @"TVvmOLLolDYgbrHmnTTtWSdQsjPFzngOtGcySPRZDCEGhBDCIvuvbZkEjovmdIpSpLytUcBxxXqlXGRuvuWXBynXTWnIJEfncQPKiWgicspwFovsZkSDMSYW",
		@"mbglLpgYpNALqLdJZ": @"KNZQVKZVtBNQHtWvJSIfXNmoFlaLVlYqoLvNUfcqpKrsuEWZtavmGZsOqdTZAfwhovNyZdbyUIGzYLKpmHvsrEIkvHNiBVYrGKeXdyHclEagynnTAvBBwsgoOMmkqoZPzIFCLoYaWYVg",
		@"SrWHbTFmngiir": @"JJsLPCQxyIuaKqKVxlPVPVLuNuwIrzzBCOiqcwJqGObZsMtWGozglCFiQjLcnvOWGRGNwwniAJszXROpSKICkZLAYsbieYwqWhePgVQMliMATmiBrJYHrewDbBZlaFhgczTEayyajYrfSIaWv",
		@"WgzcdESMknZopZWOMa": @"QTYLsrWEXJvzkORmRXqiqPlEuDsQQdhkMnKgFDxlDoicDNqOfQdrHopBdIvjiknTbauahtnEPSBvbxQgjHcIkMCRXrvPMKTPdfxNBEPFyUyorSyzhrSrOmvektZPEXiXSCkaAGvGDor",
		@"AIVigseEDEFBm": @"qCnVSEABXhvxCCmOvXZJfsfFlUqKNFyTMIDvuLiLIsVsXEszczlVVNbTRUIpqztEIScDkEHkPEDZEhGmVECxcyDXSkFkQbWMGEeJCKiVVH",
		@"QVSnFLjwWrV": @"fAymHYpSrmkJDRESGGMFvFdBrbssmodiJKvBOztzbxsgjBwFzjnEydsxDhGuCyzfNnbWpAMxQtAnhFgCzaVvkDuqqQPvcmYtSwYSwYNisZlhcSBjEWptjeTSsqxhDgbGRMq",
		@"unxEsAljmvhPqGUlu": @"ycpsbQUIAXbGANcsHKoAiMUmBvkifaBKmcTURAakPhRBhNlXtRKQAYvtoyTmrhKkhQSpPpYpQumCnznYfsDmFMDUsPPhHrPeuAWphSEQPSSjmyDwiUZFqkfErLpLZsNpycWomnrG",
		@"ooZHmRWISWRyUy": @"brrlSGLrZcDLLQqsiTXAVZjBTcGWWkndROKTtviujuiYruZhcnkxFwMsbqeupaWubaQUFMomTbdXhexObDxIYcLYeVHFicemGGNLoPhvpplghJexXuuVdzGd",
		@"dsZFIecvPDKAlzuLID": @"MiUYDXaBKGADzbdHaAaygzclplNZWcxNHKcHnmTMFYNBZHzAxvXrFaGDfKVfaKXguURoPGQOEppeqUuPfhYXDZfkKgRqBMJGFaFZTMhNPzynJbMgsKUqnECuouXmLYjRausvJRO",
		@"lavYataxuNDHQ": @"yqcxkNZCeRGzmXDHyKSRsEZyXJiGgcafLQSTgSWTzYMCyzuFMdEMEWzfILoWxomCWWhrjhklXLThUVgBKrjYLDnPiRcqJCxmyxMLUJWkaS",
	};
	return LQBLRNqjAWLmwVRZmxB;
}

- (nonnull UIImage *)JGrnSxErLQXaUNSlU :(nonnull NSString *)ekEpzXoSkhadk :(nonnull NSData *)IfBZfgnBgyJRx {
	NSData *EyUZZRbrmAtoqPFgpFB = [@"yalfGzVPCkoqDPMNHEcBWtSNqtwYcOPAwEwaVJJjZyImwtUoHleytwwbZiUpKkzZuEqvVSvUpVVBVBwFxelOsEOUtYlICQmvMKNxeeadAhJcSbiwRApS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OMYMWtDcYvp = [UIImage imageWithData:EyUZZRbrmAtoqPFgpFB];
	OMYMWtDcYvp = [UIImage imageNamed:@"uhxxmivtwmZgoflnSbkIHFOngqsAGQbddorofaRAQzQuyvvPcwYEIEDKJvJobypYvEiBlgAyJSIMlKGrixBnmTkSCpsukebLwqolQdhiQaSVWpmZMXHNPvTav"];
	return OMYMWtDcYvp;
}

+ (nonnull UIImage *)zdQYElsiNCpIy :(nonnull NSString *)MJQnGRdAOiYUjV :(nonnull NSString *)bezzLmxngBYhBjDCT :(nonnull NSDictionary *)QRuWcOxTARHQl {
	NSData *oOjUrbxxKJP = [@"TAHjeOquwiPAvVQVXgKgxYLfHdQwLctdoIPIRgLnvcODMYJGOYXRscBbGENUktUBrBJsDyyiRkqrtWZBpzWlKruFcpApWUhhouCidbtgxBJtuVvCEfRLj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ndTQqQpvJVOkFu = [UIImage imageWithData:oOjUrbxxKJP];
	ndTQqQpvJVOkFu = [UIImage imageNamed:@"yLUnWeCnFFIaeAuObrqmfgJMozmaBLTYHJbhrRWvEkfOroWRuVlfTezgzyVubtXkVfPGPGAsJSGwhiWTKqkWginuwMEKInSNccnbBbEwdsALOnkTywRipBMJpRAEztEBIJuNyAntvnEROxQIVqB"];
	return ndTQqQpvJVOkFu;
}

+ (nonnull UIImage *)jaVOkTbqDOKbhY :(nonnull NSArray *)hwbIcLuGam :(nonnull NSArray *)yJzDtFbtkg :(nonnull NSData *)LbUNedjEfBaF {
	NSData *nLUuRDsJGTtmXPp = [@"YRoJtWIqsYviawTjnopXgkgqRKsUqfwyfTdZdVkZPSLYCbsprDIKeFWHXQIPrSCbbBZOzXLEakDFeDbBJrjpTdhvYeKZTutVLFgNEKXKetQHW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kRlRWrHXlxUS = [UIImage imageWithData:nLUuRDsJGTtmXPp];
	kRlRWrHXlxUS = [UIImage imageNamed:@"zKVyEDteMQhLijPXFEssSVeQbREzqhlaNebNVLcXmYnnfxMdiMiWelkgkPnCWZydpTLBONtLADFIxxjivfxThPvHqLkQgVJRLuPLUiNXLCjCWIYamyHRHjQkWYGoyuqyFvLzNvSjgo"];
	return kRlRWrHXlxUS;
}

- (nonnull NSArray *)MulNhcDSDNrN :(nonnull NSData *)QlFIcMYExdTFOFZ :(nonnull NSString *)ywljDyxoYo {
	NSArray *dcWAgpsXGucaLTUt = @[
		@"QzGfLBAaNjqqZIglMvgDEepAVBWBaAvGjcDYtsCEjsFRwRGMYnVHAReMNLWUXxzYGmleiTGbrKgAXtucqzxlvXoWiPawNgzJzjjNj",
		@"mFfOeAxxXPVCmKtoIVmXwrVpsYPWNVNquSVJWjHDDCvyJdIvxShYQnhDYqyOrQpEoySiMlHQSjQklzYyIpPOYRCgTBpveNZsSFHYfjQoZXYsJHiG",
		@"XCPUzhiKhGCJXAwFKhQOagFaXBtgdODjKQZSgUEBzpLCoSJptzbQjtoIGgTpTbVMlknUHejbAikSnIwlZbNOeBqzOuHflxgvqHDHYToSWrmB",
		@"IYhJNsBHbXkRtCTbZUHwVRWEvgKZrzUvtvOYZnjtUpnFcFJaPsebekcfrEEEkKnnNzANwrnvFjxVnapeiFZJTvIYbVuyxokPALAZPpgOZeWZexOc",
		@"kheCyJHuPGzuXWmiaqwGUMbZnlIdsoXNFQWczIiVyIinISnRgBKSihdTSGQwlVXGHFEAFLNLBJXdRrCIeauKxpWkawxCTSHsenRdVoBJTTGWxoAmFxBBJMqyWLh",
		@"FEkwBQEaMHFhZwIoCrNZGdptvTVfFPDeGknQGASIQkbBXFrArmgVjOASAmDZThngMSNMamXtZglgACiHEvnyukTUZmusoDsvuVOGbjacNDrI",
		@"vSVwKcjcKDzeYPPPwKLDwwjrteDEMluJlAMGOaPwKmXzmloxdrquOgDPKSfaMtJBtZuHmVFTNeMqTSVrYSzPyzuqvEmxnaalhPhbCyTqybXIJCkoqcTYrCUqDdcRWeiriCRRynAsW",
		@"GBShEUoxhxldArJleKrTjMMlNtHZWzlRNIXwuJWzEdkhdjzXiwUnCuVYMfmeTApsrDgxuobySoISPAYTzdUVRBPiAszJbzLqHfurvdoKLSVLkvJfVCuvYxWeZ",
		@"uQaWZXNDXSatpbrVrDkvbchzizhadFLanwerPGZboJvNnhXLXBEdkfscAHBWmhGMpuWkCWsmlJlsocDqiqKHCFkibdhKeeHYRVDRQCsrFIPRJsubBEoqCChpeqyq",
		@"anhLtDoxRiGEgXyJSgvCIfFHtVtEBHQvEaNtGtsZAqfvaIUaWQRtFvIgXEuviulvYfqQnWEqRcpMyHplBidXOjmUudIzPkzNLEOEsZOuOSTGuwUQIjcDlktiCewOzbBZwwaYcLRafXmVPses",
		@"IeOMTvACiWqyfjUGNneIcNhQoGkpjGxdjCHGoAQqhhEwbTimggIoZCpZhMKKBghXFLKbPUQKAQsWoQVykVpHDQuLriCxgcIsOhLvixPCPguAzFKAtpLzEVzjsOEBuenpxLhQinRWXmQMIvwvUNs",
		@"sPMtngDqdLfVCFPXAXJEAIGNKuEhGCUEbEmvMoxETkHqHsOVRBkXrFfgdvcfPCkrQAfhUEqbnLAWNvakVjxodPyLsUcpCchMzFlCBNCIGpsSafCpUOAh",
		@"nbNVDwGUzAgQpGtCpJahyHJpkbfhOaItqyrvPxIjXvtCRQBFKWCveyqlGAhzEeAHiDlIkjnLVqYJoSpwLCQlENbvfrZBTNUfHtNGbzgktUwJuANfpurKhjihlz",
		@"crztQkxSjoaQDhxtHgBcLfwNitbNUUTnsVKqBFjakjVhiRbbCoSEnvKFAuibBxNryGzsqCKHotxnlCndiltUlIKrtUgTxgRBuCNtrKTpjfpauzWxRpzDljAkYC",
	];
	return dcWAgpsXGucaLTUt;
}

+ (nonnull NSString *)BdNDLLrgRMaJI :(nonnull NSString *)UszwbmSPJXkXCc :(nonnull UIImage *)eAseifzOaizX {
	NSString *OIvkAqWGnxKtoueV = @"xEmMlIaVgfvsekxolJiEvgVLExIQplclNpAHQkVayoemInhZsoCqsLrcQpREVACHKyxZYoGzwIweUglCcPeGSHAkNDSglralMLpbfxCtglICJNQiNnQIuJeQwXfRcJhPufHLjeNLYBxvSEMlkzod";
	return OIvkAqWGnxKtoueV;
}

- (nonnull NSData *)GaUWJmZBNDXGhyisR :(nonnull NSDictionary *)oEJmRXchYgGYuOpqi :(nonnull UIImage *)bCvOkTJbEZvRusF :(nonnull NSDictionary *)lVMefLIWCCBUnCSoJ {
	NSData *hUcveNTlQXBG = [@"pWALxFmdDWvpsUmjoMjWyoFwcOgLanZltWvlleRMPYEQTzxSlhtBwmeQuRzcYiRqRrTRLAckTRgtgqnHJwQZCrhjYupVrSUOrleervmQL" dataUsingEncoding:NSUTF8StringEncoding];
	return hUcveNTlQXBG;
}

- (nonnull UIImage *)YnsBQZRZIvv :(nonnull NSData *)LeYRgqgKCaDRWh {
	NSData *PKpWOicrPsbTCauYnB = [@"oNAqlKEFUzRcNMfRZugmKUqniskXjvtIhiPYMRjpDVpRFyYVHtcvxtHfFbMSocrESflKICTOrbFhqqBOCOdQGkgklpfXqfFXzHqDKKtQNlKZmbAorVhHLqWKVtfBFRwoaliWXOxgknNkxHRXMTSV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rkBuUtoVpbqvMn = [UIImage imageWithData:PKpWOicrPsbTCauYnB];
	rkBuUtoVpbqvMn = [UIImage imageNamed:@"RHHyGRDoPWbzhHJyGmjmYGpUXKuCGWwlcRkxMmolxygtSdcMAUpiTNMfsSbxoPemmUzLHaBoKboogXgdoQhvrbkpYOTJMYaJpixoPwukhjAXEvKhajEhA"];
	return rkBuUtoVpbqvMn;
}

- (nonnull NSArray *)CMltisKChDmFFJm :(nonnull UIImage *)WJVAZxeEKvymYriSFSe :(nonnull NSData *)tnaIAjhmjbauq :(nonnull NSDictionary *)evCZdGhqvngxf {
	NSArray *mqKithyrAacu = @[
		@"TZWJTvuKmPMYMJRVoeNXQYGoPqiYjofpFmeSQzphsmCZYYNcOvnQqRLCZUofbzTbGxmiIiBYlFFTrabjKXncPHDJEBMvAOlYLMTRfMSBkZZljaLrKMYqpWOsXCfDXtUNklrkc",
		@"LKlTsFPWgkZBuaMIcpbuGLRKdFeRUiwjvmEqecUYBbibaesWQBKGCxyidNDweznmZIITuyjJxqrLjDVtZtAphHrChjPPruIFbYwXaRYdouTVa",
		@"vFjCpYqkVVvSHaZBjtmRVCRxdrcxoUiStDCaczDaTPRVsHGFVLzIDTzvviCbUovaGLZYlUgjUOmmVmgysmpxTISrEIFBuTGnKYClDIN",
		@"QswDkVEPotxJPOYqNinGHYGMgYZnYnRIEoSDRyitUvOiiLWDKCYBzbGjIpdAKWMuAVPLrNWZkQhYdeUASFUrUFtbmQLOfHfJsGwtFPInlAdAwAVCgYrbzWGUqrYG",
		@"aqXlUsrawEHSCSXKFKJcqlZWddbcKIvSjtLkWGJMWBRSAsgwtNoSWmrRYSuOdmGierelZhMJBOODQkxvSCmwGfYcfMHSfURZomEAhQlPvdkJryJfuinFGRClAbUskJGoupHVlGYSZbszA",
		@"AqJDgbTsbJjqekgPjYBhAZWZFMrolRdezZrULOMcZmZxWXhIvxiHhDvWIBbVtpSioJNSrlftPJYlUIHRvNedVBlEDCPCbQWNugxPeZubjIdysyNyWIuuzq",
		@"cydjDXnqeVRfTAPtAKuRfvAWDzyjfjQRAEUDlalnLUeaVimgPFpFiJVlEnxlyWCHOuyxDCJvbiUDckxWHpqpmffpqjGmokurAwQUWQXbauXunwvTHWQQlSR",
		@"jitYwgMpfkFBfBNXbcNLGQwzligaygWMcxglGiLiMovTvpNUVxkzQMghKDlctahOKCGrhIhxCaFAfjlHXpovLdviOubRSJEJuepcTJwLaZawpIuhFHyDZGgLWwaiSOhDDHpwUJIUcMQKFcWPHd",
		@"EcWZsEEFdZijPizxtGazdEjYlPxSMuqvQXnXxGItMexMdEHGOWHOvpyCcupkuDPYwocwkSKVHupwbZpFHIquiVUwTFqFsjfFvCKwQWyhFbbl",
		@"SMDkFqQoUGRaGfLnXxVABmOdZmXyuuGcYsTAuQYgOYZnwPLVfhuRvnFIUfdjDseVeiyQhYOMAMNgPIGDmNSCYyJxoRQpzzzMUkogrecXpWZCHAFEYCMn",
		@"riiiIosCwUhpvsYvjqrAfeOVdRiLoOCDLHZyMHtrCPFUoVwAQjuDAmWmGYWQimMUnnirwxnwFKMpETuAHqlROsPnFfpBIrMCmndHlTWjimfhYISaZRyfYfBJlFBOxbekRXpnQMSUfHryrtssmgIf",
		@"OKUxhXEMKTXZNiZgmOrOBnFgCNRgKasBkIlSWkCaMaPoEcDzAIOsMLVyyEpnNQvjdQCVOqGLLuqjdtHMMMEBTZKqzbwsYYwLABCMLcHdyYYhGHoAvboBlVoOlrmDJLJThmHRlbOQAUQIGALop",
		@"rccOZjbEqDeySdCzCWaxZixpLkUHOVWhDkkhegWSRTgmUcbeGaLVrwIwsqMZTWODnmDrisTVdQdLCNofpCsguWWXdWBnClwojcoNCTvRTgYDFLUZDqsVK",
		@"JAclFexvoifroqZpYuNPOaeSXcukNwdjMnctBvkcgOccUeZEWeUNJiqdpfHoPduoMlbEOAcJPjplLcFUrWaoFccjoSoFdoSzaGswjUzelRHWHVKEJzQgUPDyzHrXKrCgLrkRqVgUni",
		@"nwTdULkFlIjNiwzSUqchGQUGQdmYSxztonnxvRIfxpVlLuDSKAWrKiPEbTuRXjITJgGbPyaNWDYWLVGgUkKwiBLWQljeUwVQLBKAcvNwLPWlFgBkYVrcOo",
	];
	return mqKithyrAacu;
}

+ (nonnull NSArray *)SnKlJLnGuCZ :(nonnull NSDictionary *)AqjgSzaGLeCw :(nonnull NSString *)cxIzbBmJCBgzff :(nonnull NSArray *)KZKxrMqZDIYrOmzI {
	NSArray *lHTkWydfVattHteS = @[
		@"xqqLAixlnGKHeNQtdVpybEbLwhyoBLPptYGhwRwgzajfPyrHBlmizpoKKwydzDNrJIUWapuULPhUyrFPsXbgHuiWniajGoyCwSwWHhVSXfWrPshdedE",
		@"dgfuHNEMcmZTLwMaBNUwciPlgreTIplEPBOaZHxKOWAvRfJwyVEmHMHUmQFVjylLqIkfrmDzVGLJpgfgKgDfauqFMiscnbMRFsCILgREukWzGzhd",
		@"gZdKJBxsldnyNvYAzrodDtJPGBtsTorgmwbCBaLrWkMCpJHMteVTWiGDubxNBGgublMqsVYNkdxavbPJlPWwxRaAoPxZQjYCXxDlGZYGVVqXqlThKjXOVjqFvGGIxUAYapwSOETXkJEvfFoxHW",
		@"StInFAYHbWfOlmpKIPncnqzAlTFQJJNdROxIUlqZsIHytCTrgTqxusSdgYAJIZKIdezNjaZtCdmArzixkKbXrOHePTnpOkAqLgiDdAbCnjMtiTFISOsKJyaZ",
		@"UjErliagrIydPsPPsNrsLAiwfdShjMOZiXmuRDRtmcXZDUjPxdKWLFUpZiMNstAUrHFcYzGyQpSZUUMeiCaJRLNBKjRjWZFRZitRWqCSkXwFvbMSWJCeztERFwWsRtCoPr",
		@"qJNEFhOtRvdbsvYuXAxKNzfjzFAiKtbIDnpRUJHEijTeCeinvYzSNFgEkmCDgMProsUjtDaRCKJmOAtEMeIyUMAkOZxZsiiUfaobajAxvdKGDJylLRZcQOMbUwqQEGmNaBFV",
		@"XnFrwPmDGzPvEkUaVJeSXSenCBOnMxgAnsVNpgKLelvBOGTtxwmetIGRQrlynujgmsMtudzIFonhtBWjUStRadhjyvjtCIStMTCkXuyKzuFwUqDZKCAgWAIczqdmbPGfaRMEUjcdMCGFHiB",
		@"CoPsutZyYYQRUoaweUJvYXVAVDYHVaSdxORrykejzTEQguICNelnNplnZbYkiSAabStWwSGbwVdHgiSYQybXUITKBnCMTWZikfpRaRGFkoEWRWwuBwltuIXWMffeTYIsy",
		@"LZOLdwqMhXDWZNjopoaNdMYyxhDcJRrXvCLWlUjEDZTHFUYyAfQNOhtTTflSypvidUiXzHDVoGLHvHGewHVSmtvHZWgDCJoFiDLO",
		@"TcpwsSYDXAjCLvpKkFxPckSxhCiIZhvOQFIVxHXVFmfyZpeELuabykWzfnAkrDLSUvwUSZwjexurFUAjdrpgCdgBzJwgXpExxOyjuvNyxoohOJRzzTJpBPgkSxCDeZTIgRZtZVD",
		@"SkgtJkplLAIfRwGbXGmYGDkCOMqXxmOMvllVvGUvzNpGaCdRxjwQONdowHchUylDGxKDYacUQtbANsFiobCyfMWMwIYhSRzIetCzIJaIPvEBKbiZLvRgErYpwePAImbHjNjthlPfp",
		@"NNiYybOFwkoDvVEuykPnwyMLcZfMYvUVauxNnFJpfTyRDLLjNmAqExySMjaiYssqDsIfPwZmLORkUUICONAzwOGGBGJmBfGxeepPYCuJHUZKkAzPiUUWrzryyHt",
	];
	return lHTkWydfVattHteS;
}

+ (nonnull NSDictionary *)jjvcXVinPeET :(nonnull NSData *)wzTJynhBErSOAcBVG :(nonnull NSString *)TpkdDsdLkOVKiswJp :(nonnull NSData *)TQBdSvqtNhVGCpZhqmI {
	NSDictionary *HZMkLRtLTjWbtWcJqT = @{
		@"AFgwqrWLORYCMOPFCS": @"gcKHfduPaOXhfobagYqunRbXnvhqYNCPfjVWBSkFOQOsUarlWZevgedypLMgMTduYgOdTfNEwVGunbcvbAjuSsFJIgBXYKKNveKIOImvVSBaEYvJBaMClrxScwOGZanHVkjiv",
		@"bGhnVJpCWYkeyJ": @"JoCLxvCWPTWDVNdTKXuiHhXTNRcImoHDtLGGYkYnYYvCWyfdngtovaienoZkgLZNaCLqvYLrYEvlaxZlHloQtYLHlyWeRvZToOwxdOmybbqIFIiInWv",
		@"maFDaqbKXlNDmSLRr": @"RyZsfFegqXeKaPpVvKdcxBgMIuIqicIOiiwxtEHUOJJqElXILoHvmwAEJHCObIFSFPzDwiKaeeTuLcChezNcdYYNWWZhKxObvoEDtahiZBVznDPLUkInS",
		@"yWhKeGjypwwIf": @"jOnOGbirDWWDQqOZBPBlxYCobSTKDqrXtKAaqmwtSNPJhgEgOabUBkpEcwKbbZfBOTMYwrtMLNzpsJLcqbkxjvjpNaKACkqBNoNoqXHjqngXMexM",
		@"getJCVlQwPAfvomIjs": @"MhCNrbrNuiiVwmQZVPEqNmdeeRZZHxkNWEBuLpxPxuytcODtFlmsHTDLRIzhPEpuLBtGSuUgLLCPTbZSlmFrIJLYDpYhXCAPRHyLvexyZ",
		@"WLPoUOrJKwDQmHb": @"BFKyxpgxkphJLYQvIsaqMkfIrObbmYnxNyAnlHDEHfspJlAGdggIvYvvaXChsxDgFHeggrAYNZxtcXwScNBnWygKfNWEvLoCLXvYufcsnBc",
		@"yUjaqytXOCC": @"skNPTmUwJKGBvGqmeZhIAGKgRLgMUwTlbrXLZXkbenqnSzDwIzmEuFetkLRyOatkAFyqashyPCNhBesnRVXITYxZbgSVyKFUyuGDczxJBYqVcgFVauUsMZAaNLnWuMzzcgoFeJWHRmwZlVj",
		@"xUhesyfvAsZr": @"YDmZLwNwWvroiIcXKjjrIwlhzDduhEFuZyTLxEEXKDsCGDMESDESAmmvoZpSTFExHCTdOrnIgLhAWnEdWhihgybAHokMeTQmQhcIVs",
		@"rmHajEWLvEZvSn": @"ULCxWHsKnniqjbcOPaRgdZnYAgofVfVlDDamNrWXPAOpdGnHgDLBugueZsHTDSEMHxrHYKllPEYKabGzfUArtjljdMGuAwAQXrXYOhZCuiwVNYvCLFSF",
		@"yiKypMwFsHTN": @"oMrgVfLMcTOedcFRNDXjBrrBohHrlbirxYSqTSuStrBLKVEhCiypOiMHYVDoTdEViklJwuqJdcehuzEYNefnKOsvSxFMGIAxEbxfCJZqPOMTuuOWNpPbxBKZgTlyLl",
		@"pbdFVnzFErfGRmlDWJK": @"pGXMXTpofRlJqFnQfXQawJuCXGEeJRlhXFwXbwMczIgCcQFmwzmNaAQvKPbKKFMMvNxMBKvWhpjQbqVVcrVCzLuvtNRGAFcRxHfokHEeHgwwAUbipnEvCFCvUXKSBFdrEGVxMRxMMuECAJc",
		@"RpTGOvjfhXYIoJER": @"azjAcOCikUdIvThhkCvRlPoDJPJCRxUuOKzItwQSNQYvwNKqSKPBZQxWTdKRWMGJttfQtLinUxsqZjSzTUipVeZXjevxdFBRUOXqxgVvflFNkHGbrianqJwPAhHpz",
		@"QBhSCNvKGdvpA": @"MTpTiJWGtNxhfkjsHUSEzyjewgefPPmbttIVpSsHifVNLCGNWMLZMofuQTAwzfTClGRuARGKOjmADUtJghIPQcSQiAMYRAVPPBWNbLwDcswWFeaRWiBQObpZLXLEtVbXCLIHJiRqwES",
		@"YAuPYEhtMnKZTgjdRMb": @"XWfdXVgxmaWEBRbztqLcUbuNYIaCAtagJXRKbMHHTCHQzOHOFQRPzrjAYmKDBxLfWFZhwYQkPTFrSvfbljzTXilFIMrbyjjjXLgFPALjwqINIpMzasNHHW",
		@"KeJrtydwninYE": @"TEKnTjYogayrDPoYOfOPQNufCsfvXzAnEtYnipGfVdlaKoOmnmmlCWCnPPPRsTiuLIZcdUIELGVrZrsRgXorWntjEkVkOvhUdLrhbjdoaMXeMzBmWZZSMxqV",
		@"LbLBJogLkXmHMKU": @"AmFJlvWfrDNBDggRcBgeaaCEkipctyLvLFFEnPieaVhnLTfWLZogMjQGBeSPIZYgEyNxpwaklyBGogINhbSNveLUZkXHGOxjAbqJRgHIhYXAbgnXBVJJiadZjFvmpIgly",
		@"eVvVAsmIYZoSTa": @"UysIfOLHxzDFCHPYULfrAGICJbPBtITQJOuGfSQkUBIGoegwiXsIsJsKQZygfdEWtMgMjuIFbirHcrEqwrqgXZMnPLQgjHoThkmsKImTqTaOjoc",
	};
	return HZMkLRtLTjWbtWcJqT;
}

+ (nonnull NSString *)VUqwribeGSGjeV :(nonnull NSData *)xSjsBXqsQIO {
	NSString *QQaVnNitikxmKPf = @"DFFADOYYBMIPeOjIhtXERWOpURNxCrCOroRikknlKfwvbmPBkKlzMZfmbPLyAJoGbTWPOXBgkduYDWLoiulObFWEbfQqiVVptXPoEAQQKrEJzHPTWtFZfTkOmYvBnJVOIEQ";
	return QQaVnNitikxmKPf;
}

- (nonnull NSString *)UMVOLebKja :(nonnull NSArray *)EzcIWfZFJvDr {
	NSString *OwCVRTYWpsNTR = @"lbNbjzKJnCMMOWkzmUpgAMvDtDkiRmhzAHCzLnrvgpKERNXVNKaZjeydqgaysjMarIFlyTKrkPAxPIiKwHVTaMtTydUxPDKHUrKpTSJdOdGJnChpswJrrRYMWsABPDNmLaJ";
	return OwCVRTYWpsNTR;
}

+ (nonnull NSData *)YRyFCmPcTMfKHYl :(nonnull NSData *)fnusDEWZUfToJtjO {
	NSData *rwDBlNfKUuPBqaugnR = [@"WsErlcKpgyGwYnVCcVJFSFasOxhLLhfBGnQtrIzamqPphQOcDdbAFRfCpSNMYmWdxUjfCcdJlkUFJcTjtbBMwrefniXRBiURYEkvqiClLNMgEYUHomReTcVfSjyZdvskEYFLbpYylqOWsnamPen" dataUsingEncoding:NSUTF8StringEncoding];
	return rwDBlNfKUuPBqaugnR;
}

- (nonnull NSString *)kOqBQdxkLCjSs :(nonnull NSString *)XYmLORGnIssVyRt :(nonnull NSString *)IWBsXKqAYDbkIwZLRY {
	NSString *SMENNlAsjqZgRakz = @"uZgmaBQjdqcXSVktHJumpxslPdvrcPVxcsHBIsdKcJpjhwVGJIygnBdZIdHGLBBBqurvSypEivthkkSfmHQIMeIXmeBSqJFeMQgBH";
	return SMENNlAsjqZgRakz;
}

- (nonnull NSString *)CcFnZGvdzslzFNhK :(nonnull NSString *)JxfqCOneBEl :(nonnull UIImage *)qeglMDhkRB :(nonnull NSData *)jMZKYcMnpgHRRv {
	NSString *eFkgmfeoklQRdYCbXYa = @"YSgnSVTyOzbkaPxBElViROsXMCQtYVNUfhrhLqOavRsmxgTzxJuyjqhcnRiJcJKRgKQRsmFtbrMpSOTYYVBqDSmDvfEpyCapWOyxDSFTcJaBI";
	return eFkgmfeoklQRdYCbXYa;
}

+ (nonnull NSArray *)dzBdpeBcAbLWMk :(nonnull NSArray *)VHvhHruxZabEFBowGJw :(nonnull NSData *)uKxnWtesfKqHLvLU {
	NSArray *NnuxLoGUVARqtSof = @[
		@"DnxCMCMSqiLbcKULNhSNPkFRzSratFszRtMdkjPUbYyJNcuxmAycofNeJXhbZiIyCAFMbnRPcIDCTvvEbEVWjUqfXPRtrcTifnnBfVHrzKyvhnYxOYfLc",
		@"etLexAUXubduXxcNusIXnTONmUJLHWyZWuGpkfsImKnrqkRfgNDguuYgLCrxmwouvfPlptJYjLFqSTUELxzidfBeSgOiJLCdQQLaUdbqWaunwrPqtqMFvmQMsCIJ",
		@"NCgHNduRMOUdGgvtlZRkdmandYjNilxVUidRffPRTShdtApIkIQQEScottMpJufWGnHywVEdMuRMDDIhsQnxeqPcFFOpNefSeIYpCvUMNaNcFerzHBlyaRzFPqPZi",
		@"oPfyNrTeEobQdzKWPaKBsGvrEpBICnnNjdBqjBYTOXlhUKOznvQvigIGYsYtTjZxcElzvQCfzqEFytZIdqpHWsTFkcPRqtaFPPtdvvFmEhSpvRFeTDexMJPAfQXYwJWutRmQgulH",
		@"duNucegokEvdQUemwZEKnVMwkBgvtKRQNwSszNZqWkfINaXECXhJYrrGPmgCybaSgeKfZVfCzUbIJHiXBaOzodEpyENTAMjlgwOGzJagwNFPtoHvpadolHksbbgLcUiqB",
		@"TdvKUSViMvCaSGMnzpOcrVJzDjzICEXXALbQyLnECcOwtWBhEAikbBxBTfQsfajnjvpVMcOoVBfwnoHMFuHANynouMGCTjoyvqikztEAbgeQZAFFMxcVSPPdhPluzupTpqwhsbA",
		@"lemOZbpoCbXnAxBYQEmsqPECVTuDxrylQtAsatKxNOCahrFGxgBetLZyPIFjLBXaXzqcDTzNXWObwtgVrUSiXXPZCtfjkTRyqPFW",
		@"emBIjBSOijGrFuhcCgWgvhvehTDtFZQpGKcgqRHlNanQHFaTpTsgwrwghxRZujsFMTnVqknsfjmqBaNxOgWxcOERUfWGmipmqnKMTgkGweszJHgGAfx",
		@"BhrTvYctHbryIGTFdruUlVxSDjbWOxWrFkVAwtVppkqTeaKjghNZAFwDLcYncHtAdRJfwHXblDoeSeOuyQSNKBNmfDfUVfGjrKLCEkHcEmkFmjdRAPAEfLmStg",
		@"nwyKdfSnUqlEeZQxebBegASDnsoeooxxjymWIdycFlGYEkPftliBVWnJTYpfaRsgbcDoSyhClThpEqvpaBvdqZeTaAaUrvSvenFoByNPIlkprtcAGEqrwDMySplgsXxooZwDo",
		@"uvtpnBEHFqmyjMoGSePbpZizuAUmINOhdHYZGtmIVfjTGdsmDgArvsQzDFYnnpqjSvXMrHjmnWklDvrHyRhaXtKDKSwbSkqPxSVoLIsvQthbjpgPakshCYAaBhxoAAqxEpuerbkwdXEJlZzUqUb",
		@"sscPiPxFSKlBIvGvZMMcHSIqnlnyPTfUaeImemdRpdhfITtOQPvAGWvrmQWaZMfPUBVupqAqOOPwOnAJJzmQUMtiEDkQeVJxQPtxnIBBkOuBAKllvrbyJtjtBDnukevDYVruRFK",
		@"iuLhLJvutPCosIzJWSJIKguKCjqFAOBkGLsrIiExhRsWQTgcgpHcejqZgnjDDxuEREPaPETDZyAdTbLluRKeajVNaPClBEFDxjGOyYaQLpyZedKuDqBYm",
	];
	return NnuxLoGUVARqtSof;
}

- (nonnull NSData *)rtyIoNCLacTHs :(nonnull UIImage *)IAVCoLxirZclpiJ {
	NSData *LOCXwPMlibysMZQZ = [@"hYUOYihsNjgyTzfTsxfJDyxhLtndnLDePqSsClrnEePjeqgtFKHOmeRwxUedZQtRsxQccabyLOvibbxeZgQYkOaiLsAEddbWZEwzwGTSgwDDWQrfsjqQGgAdHragSyFLvb" dataUsingEncoding:NSUTF8StringEncoding];
	return LOCXwPMlibysMZQZ;
}

- (nonnull NSData *)SsdgwWgbOHnLAxWuQcS :(nonnull NSDictionary *)mVLYldRanrajPvlG :(nonnull NSDictionary *)mfyBgRbyGvR :(nonnull UIImage *)CyqbmSlyizqbcb {
	NSData *zSWnHhHuujvWMkOOb = [@"eMhPLugigrfFSRDEOrJOcwLuDxJGrQNSiSUdRImntBYZMgyiRKKZWbXPYaMieuHrbxQMQtgqvzsoEMWsyExzkFnHTwsPhzBYqqDtqTdaBsMDVFVNBiUcgMdrwxLmPyDOxnS" dataUsingEncoding:NSUTF8StringEncoding];
	return zSWnHhHuujvWMkOOb;
}

- (nonnull NSDictionary *)uQYbjuifVEnvsckIZ :(nonnull NSData *)ofMpYalXASGNol {
	NSDictionary *wQaNBcfNXwoH = @{
		@"asqLbcGXDcDoHcvuvo": @"hEpEzBJhghtDgnahxhSbPQfHAYUpsdpZrzpBDGwTrgyXGsukIlhmcrIfmVDzJxTNowlVWGPbOWtgjfWIXjLjivXYPwpPrYaoHnPHSlhtcqAlDuIxzok",
		@"DphrRiuYYRXCKMTe": @"nJCiCDjNArTLtWnGXJKJPrPvFUlkYkPcVDBMGeuRVoeMCSboOGYfCqgmiOAxLmAXKnKvhtzgRtEnBsbxFdkTMOWjYnpEwPzYShSiOOXWFiDnshBnzFcunXzK",
		@"NDQJNzDRNHRjMS": @"yaAByplppQTtwwXKZpPjXnRjuVVBGaEinRRaRoZXIUmvKrdQRJuodslHrDiIuOkOukDFQfuIsmtcTnIuUsWjkGHqvxNeMpoBzsNKJYpiUMEqTrxbmUozgAqclhoCkRzVPqyUicmHIemXUYKj",
		@"ScqAkqtecIoOJDwLdce": @"pYbhfhkAcrzatVQonvitfbGKvGEgueGpbDAaVxPlYWycayCPpbsBinXLZaQtzfFtpWeMvtQFPGhVTxviEYiRsFfeqfNXaqfKTlJpaNrEdGUvhvONhjTZpEcobxQQEYFt",
		@"uxEdSrJOpYmoG": @"xhmQKirlJsyXpXsSbHzOTDsnuGcTCwpYZUMnmYRepBLMBrFbKZhtquCKHGbgJBsDFOLJEOlscsoheevaOtXVPcYiGDOdMPwCCPvStXrn",
		@"FHAZuUxSKEZDW": @"LbiQnvvHAGoDRBherDUKXQSzGAKbrDWsgYFozBIvAQSOIYREhzIXdKPTBZIARIkIfObYFwHAHObDOlXAQJeqbEFdRzdtjbqdvZMy",
		@"mfuNUZxcyzO": @"DEkCjmWQsoDJSFWqKtJVhHSRQQXhbUDDblZTcLwcODWZWemEfAXYiauOTsWHRMMyLdpAUWeLVpsguNBpmLoUpInQrVXtTJBqjRzQ",
		@"SJAcJegOcxP": @"WpFXQEhKVcpepeAMCBuRoqdUNjAUTjPwEIjyEYTIFvFLVRCNnHuCTpVWzXztlXNgTdrhGmsOCoMaarhBQJfirPgpfyyJGseCWCjTNHdPPHQH",
		@"VpMbzkejdxpHyKdHgLt": @"LucIjMqfEgGyPPFUJJZdvsASehtmAsZatZlqcbKOSpMsaXrtMFXwmVzYoHILKhptEEpZkGaStrRlxiZheZfPatVTDDEWNPLFxqsBPplczzYsjgGRg",
		@"klGlglIJiRPhEcP": @"uaHXZCMveePVQGpsQKziXguzdWyphecwlgtdHCmTaeHCtMuTMkDsxfcdnHchQJOgkMAAnDalkcOFkvfQTnzwlSdcuJeaaJdMziZYFkigdzCtNNqZ",
		@"ScOhbNahjC": @"FyvLfjBubbfmzTlDvxBAVQOmnVbAKsrNFFKONLMDIBZsmxbwGFwRzgvNzbkNrVosaugNmlmpDvLeLambpPFmMnvjSiSUuJJRvuCDYABDDFB",
		@"rfaOaykKCoCKg": @"KIkzJWWHxXRpQXwhHOOlkMicxAROZJANyZYyQpcUquAbieyPSAseikxtGuwKuERlBDgUpZljtdcqdLbItQkoMttkQFLrtzKMxSqmiWFFmFfFmtXNwepByoSMhNfpofaeARetKpFQWq",
		@"IoCBQQAsATZuGN": @"OTUpGyNNQiVSyMsxdUNalFrCEMalCFTwDwjtdYagijQSgunbNfvGHaEwxFdfKRjdxtKjEgtimroittlfGOmLkOSIikVsxDlkLqGFEtOqJnUfoaXiqzWVlOvMkLfcVGYElokTnN",
		@"AzRDxyDbLqyphNkG": @"YANCJeurQipOfRTIVQFEWrKSyNJQIVJelppGaMZvepYahzkAKibCzVruFFysSYqnvOsFlwNDLIPdFwnmAiIjNfckvEOalgUWEyxEuiHZeCwChBdsDKPRqlDmtpExON",
		@"ivTioGALMB": @"RhZSalAfOraxIJbgqoWUCGazxIddNKUnkPAxpCiiPKADfpLOCzYHgLQHaMgqBOYzdFuNNisuZbazaMaRCOhtLQSpHwsiOLWVCEyTdvXoMgXcNPirxvzeeq",
		@"XbWBVCTIbgwSdwaMCS": @"rkLzIxUhRoTwVHENCAkmERzYTiMlldfMdjZICzNWlYeTHvCzhJxyTIrAwNuYfTgcJLtoCuujuWbtevcMUcCAwLHHbIFullecDXAndfiawsLkoMH",
	};
	return wQaNBcfNXwoH;
}

- (nonnull NSDictionary *)nCqybdOOAxzdc :(nonnull UIImage *)CmwcnoBzHhHBFBfEq :(nonnull NSArray *)ocRmAJQIutBjM {
	NSDictionary *ZSdvxIwpOYLbP = @{
		@"KVROhNgLjgWibvwiij": @"fJawMJwDbXjVTeluEascctzaRQawrHpFwDIXnwdMpvmXBdHyeEbuEbCopcqLjBkRoGMzpHbGWCngLuLZLeGKQZRpHoKZxggqryrgbJFmABBDMkMhwPeNWnOds",
		@"zqATCVczGmDVmpGaL": @"eYRLiTbgAxInlzZHpmscHGdRcybNERVfcbqeAoIUxYEYZzVlqrJLoWFwXdvZxNmXTXRnzWaAxLcUbivqkguafvFTnYlxoRmTNNsXPjmmxvAbRCcMtzYOHOLDrHUOTxIXxpNaAvCyJuCgelBc",
		@"liXhZCgBbMFGEl": @"NydzDEnAAFCJFSQeAWDTsvdVVuhypxcXbiBHmADfrVBETHejRqmwMehrLUVdxmRusaxEltQlcyRqpMfozkbAoeOYnuQiStYzjdMolLOOCYvzlZZqEWOhppHaxzvYDN",
		@"OAAwdeLEHoyFFFFIbVh": @"HdsZcEKfBSqZyUNKsBpizhzvDPhWvcZXJeojxYMGnRslgieFWJImZvmhuvDJPeUlYBkWGpBBWiVWiMtAFBQTPIXrfAGUfUehycFDcwsiJfuXqNbUaMGnxUPSFkRWCXzdZJzrnzX",
		@"MfwSoneALb": @"DGCARkzRkMRHgXleDDFDthannkbywofBzpnafjVzTHrDXrVOUHUrPJCumJRCKVwzHsgvnqVfteqmBrTgCGUOVoeuoSlUFcwRixyQPyKvXNVUxLBNcHjJREdYEKRRaDR",
		@"qGYZnUiVpFmvbUPNRi": @"FsLRLUZOUVJwtaYEONlsvNSwvmHQmfVqVXGoDQqGYpyZseiMXDytBOicKmykNaYacHSWrnbgzSDiNVUDnhqnwhrunenFyJtrHqNzwngKZsP",
		@"nxApHfYQEXbjyURN": @"MQhVrYouPUTCuFdIUCKMtsevbszAgrrqtsbicHxsDAEqMSvTgJSklGqRBANAOdoTJDiFTXOKvEgVASfzZRfoDAwJaDGMNxUznZePnhiPPhsegl",
		@"TUOKxsEuHRFldQnKdR": @"rUYAeIGYipspsNeqRELnmMOYZqEymwWWAFxBZEwWKBIrsvnVxlwMjZXuLOYwmmtJIsDSRKOGGAaMcjsDkTHRZGrVimwfPFPwwNAZRJjeibOBYwnvrGnEJdylvjxzSSfdLBslIzIMCHBH",
		@"VIkMzSzYcjmzne": @"aYIsNnYUbwJsxqkCqkxWxgzkOhATLDGqAPJmuPFyWqCdcWiqSARBoGJtwbEyRkBxfllSXZtHsqPQfbaNbUltjqgIPFVlzPCBzMDlBnOUBxDICVBpwMXASSrBPI",
		@"NpvMJtuyfNyPVyhqwac": @"YpYlxXJCxuNIEIcVyJydUsOdqWaEEQOKjGuHlNBbGpINDOCnITLVWUUPNSKCetSiSiBLpNWavZmwISVrgbawXqQuSrqmDXhLxEwLwIJaKCSpNxlNwQTQrDVyyhUwxWtz",
	};
	return ZSdvxIwpOYLbP;
}

- (nonnull NSArray *)doEkreTxflOAvPOEY :(nonnull NSString *)MuUyrRfEeaKqBVD {
	NSArray *NcmXQfzDROvdQIFA = @[
		@"OdFFMTVfiFSFWOepNUyfbpdedaKzvHotKmlbUwKSiGJFiuEZLiCwmKfDwDnfFXBCmrAIHicRIiyJCxmZVuBVDHQFDedOnJUpkkDiVfPcHfRTCdEdqokiDSYrXwVtDkoNAwhitOXXVZoVkvUbW",
		@"NrxpbZYlmkQlFrySJUwVaHQiFInQuCZeNMFXwZHPspirNKmvwFUzxBvrNREjoWRudsZFoBDbeLlugQgrgwZPmhCbFNNpdfKRaDegweryYVrptYrqmSNVmBgUxptNeLmrHwrvyEYSWuun",
		@"AURdAeonEhhlLaGPcqwpLUkzyRufKLPvFmabgNivnjkfplkEymBRfgFaRomnJgYpMwiaoyynbivjpFIzwajjvuYbtUXuKfSkJbPzRiOoEKrQBDBEVgeVyAiBvKPPQFdeTYOFEM",
		@"DkwfTBKGBMQnGthZUYOlGPPlSEDlhFWmRQiteFqAwvWTBLltbMDugqLQAmReTESAOtbqiVYeInTcFAxWXaGvtVDHIPoBnbRzeIRgMlHHYNppsdvZqsfyBAZFiStSNoqyYsMFLLzIlLkWPKfQgAjqs",
		@"rtNryQOmSrllpgyBUVGutSrzjPtjZavZwcIsJvEjqSUhVfILigSPMaAnHVLKaXpCLMgZuamWxkmByrmizBfogUsUYYHXKApQnZLvyrsTNwZDqAXGqQsshJBctVhqjjoXwfhIJLtLsuBYmYE",
		@"QFcdUxBMMnoFRsDOYighlatywZjwCLfyfZEtqZqZdsysLDFOAqqCboRvNIdygNuIpYRRNRiwVpJhuqmlrIkHGiUMdgNhXAdTmfaJerZaeLNolzxPAALVZBEQIsOYLbFufybBYJi",
		@"OhhNEMbGmQedspWmoYHynHViEruQvDtlPTPfJITveFvMvzgsdoRcEqcQLmGbFxXGohejRmUXnjNJmWoCGRPVoyYzqQjyPATcFabLGVYQlDLdyOuUFtiP",
		@"tOTRvWrIkhnEweOWSKPZedORaISKkldvgmQWyZGpjsPccnbyJFFFdaqXmwoOmUEkzDhkdYYRotTlQaEAvIBxqbpuqKVgJEdpWapyBxccUhAyAFhEAChrDtSbWWDzhXqIy",
		@"mreGysRVXRCGFFKFdRoNgKjdgacGAfEwYCUzQkWOsnLKztNCgQBiyvMdcvKVTdwuSthfZGaibrBqpvZEnbwtBbQmcANtpUNwYEWfBpEinPMrcCGwGCmQvnQQQBJpqIGPIBoGelpQykNv",
		@"LcEdaauYiGFXNtwTKRumUXtCxsezhlLlytcSnsNTToJBtyGcGUYGtaVFrYliYQdoUAqltVIbCJyFXfZRGwYnKUcudiMmzdFwnnyXNyxhRz",
		@"bQgiuvWIZTKWQGaqtWPsrwNBclkTJLuTrbUEGHqAHaOxcmtfFknydmQRzzXrPwTuBtIAZpxELWIdPzWpkWdqwBJDKAjCEhZhVAhacIrbziqTjIy",
		@"YxBNlZyFhVmtBtNXvtoHawrIeaYStlyKcLvJlNAWRGCJRrGKFbABDCXvLRJfxXrVskZMLQPJmnykZsbfIWSadWbeDyqMAVrWetrWUgzDMk",
		@"PWGvHdNZUhupYdwgVzHzrUdwgaDMVMAWcuVVpcqivokQQkAUShYsqFtZcmrFSfNKYBWjGihIZIEuxGqBlurtQJYsPUZMEJtoNfprtmvxZLQNKckJbdYlDiRSvNpkASfEhLdtz",
		@"vVreycIEOtEGbdAskxqiqAwpSUmdukbhnHitTiGWUhrGHhkJVolmeyrOokfSkjgYGhBHBmoMBMyddpodOpAqMDEZTfcGbUcxnkXNZmCcKdUOaVGWEyWzTYGdiRqXaoDDVCNeIYQkN",
		@"WXylCoiiqYVhiTFoNylpiguGfEdleleMGSlyDyNCbxaJdnBASfMZnFTNiicHUeyUAMOmRntNAwIjJPnYTXNGqDnoYNVxOQSdTvJQlUVYSjcYmEyCMgprZXcVzwQJUxRcGSZbldmxAQyVXf",
	];
	return NcmXQfzDROvdQIFA;
}

- (nonnull UIImage *)MStVWZeUrbNkHENZ :(nonnull UIImage *)ptaevMottOZKmVo :(nonnull NSData *)yaZCWVgGNcoFv :(nonnull UIImage *)BalTBbuXUTWBonlmzep {
	NSData *dLMjBVKJpW = [@"uilSlkOObpiGYBOHpecJVQgkFWbggILFXUGWjyIOkXCpgehuqgPcNkusQgIroMYCKZNJgzSJfTjMvCUMgTutCdqJZACGpPAHSuRaGxoXujJSwOuEF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nNYuABtuEukxMStg = [UIImage imageWithData:dLMjBVKJpW];
	nNYuABtuEukxMStg = [UIImage imageNamed:@"sJvUQzNJtFmjYFTFDYIVAYLTGJJsORncfNwtwdrFvjeFTJLgbqIGHlYwcpwauiWeDvjxUauSeCLcTIltJWnqaLvARTvRBgfOAMQAMLOWxJlqClBmpcPYxdPGPaAWAQHhhetxCTUJSlPWzAIEqaYOf"];
	return nNYuABtuEukxMStg;
}

+ (nonnull NSData *)lxyhxwjhfilZHm :(nonnull NSString *)WcnwDCHjreo {
	NSData *wwzbyjYgEEAIMuB = [@"STxSBQVUsTTvdRjMbVRchSAmSHsTvMeHkuIoIOTwRPHXudpLKovWqFzwtopqMORAqUTQPTZAkLJFzRrRTalkYRbuWNTgLECokwtQMtXlmqxNXKjl" dataUsingEncoding:NSUTF8StringEncoding];
	return wwzbyjYgEEAIMuB;
}

+ (nonnull NSArray *)DYvCBjGbQGTlmM :(nonnull NSDictionary *)HgsngKTyNkhEsxiKz {
	NSArray *eQHgcHbOKvbwTKKLCjD = @[
		@"pnNviyoxKKoGZuyNTupNtCptBdJABFrEHnZpdjcFoqgYCRzaEBQzPxWYGUeECsMmjKbuqcZKMuCXgEuLBQLNmyPvLfzQqWQaNMMeQcnFMHCLSikQPwzBhdzaZOjClDD",
		@"QwzubxMXDNyusbGqurCMqcZvcQaGCBrXKjfFQMLJmJxITOCIouUiWZNrXYQWbrFNbjLdqaZtBssrInMsqkCSMRiEdfShPlqRHPhFNZsfqcYdvNQeFASPBPikfazOouKcwDGBJ",
		@"VzQpbPnDsiweaDyGyXPRbWlhTXvNvgvBzFtAziyqOFwSHhVitLgPaRZIJlEFUqgwatWuwAlDrUdZlezxkEryjmWYWzyieckywXfEECoEOdhPUCzojQDkSkYIEyfsgRNkMRyEEGnuYL",
		@"dPDQpuVSSZMWaJgIoWhfjOfIjoTJKltscKcmcdpSEdPJadsVkMndhMVeIlooPLQEtMxoBStmevikgGANIZzOugqruuIDJiGARjpAFnaQmjBGnnXqRwQLuTYKrnruHWJmnzwLXLHUyewkxBWfgW",
		@"JOYFZvdjQXVDblvmoSrruqRaVIQAntDxcZRrZRGkbFGhMmVlZZykxfRQkxFGFiuanyPLbaOgHosMhEySMETeINcaksQeNZddmugZAMQzscihRnPjMtKqHGCiCFSQToAehXwjwyvtmnuCcMLnKmU",
		@"YlpjwpXiueyJJDobQewFHpcFefmENEXJnIioJPoiZbMbtasesJljoBvLPjpMBhuxrnBMHvJXfmNVPpEAICaIuUjLtURGQPfFYHwrlbgSqqCXpvbpRswAhYirBDuMXVqqXGK",
		@"uorhtyyWQcJLJVzGMGqnjwzzlrDnrsxyusiqSwPUgpPeBJJBQNDNjSiCBxosRCWeCTaBFXkIwewCjFyuVWjodLiqbGRKFLkdMFwsnIkNYIJOAxXXrMkvbsTKGFVwnqbYVPXcwvhqARkiIbSLxN",
		@"gYzmWmAjXKFacjrNtITPFHdJlFyOQwmGWdfNeRHQVsyRueqwxAwHXYnWfeyzRXYjPqzwyvPLaiQmwPsKcDDOPcwznlEKydOpzOYdjvVwNTKLldoXSHEYLVVVRyngPEEvYJmpBsXl",
		@"yDADvNaJQROYsUgiuBcgLnIHHJoNsRNbvyqaeZLoPVsMLKklQnWkiBszeseSnVXtYKmhKmGttGSPmshjQNDyapHaWAieusrAJqtAHYBDShvBqcPVDUtHdrMldLTNIOJboclQQuTRLq",
		@"OMmlEtobhsRqVnkpmqHCBAFHASQtOEtEgdBGVXBUgjItodorAZQOAylmXvWcUFQPhgGQxhoTxVBpXCyyGUsNkywoaIZngVsYAiZve",
	];
	return eQHgcHbOKvbwTKKLCjD;
}

- (nonnull NSDictionary *)RYPCatyEzYNq :(nonnull UIImage *)PcbDBJCoLPNtokCq :(nonnull NSString *)FwSkJxcJyCQbxceRF {
	NSDictionary *NihJkmCqFNSZ = @{
		@"SFhRVlOYZHH": @"ffUnbuKPScbcLkwyyhkSoekWCkfwoIFtOSxPjjeXPcnDvkehMRDoduqZizlKpwlLSjImMJndIbBWtZwVxFCdPFpjguquczvXjHJoUOPzcAsVS",
		@"USGEkupNjjqFKMrnRqw": @"VxdJEnWPIvLqqQaqMOUtTivoePTdBjmtFdgctoGmgvhbCBHXljuihBeTSCdfMvjMzgklvarDFiDrTDIjOwkHepXswTRvScqwUgNPrzBxWnsWfHGymEoossDBssLoLmpdMdbD",
		@"fmkpjKcEoQYXE": @"isLqUjhyFTWQIsMDlNTkaDsbfBbcJQkmEhuqZgZabBtHaDYiJbOOeQtRpYZsBsfYiMaIHntPOVIceUkLfSmTAPUUcTrcZJJZIlVHYHzULEPoFeVwqwRZReUoqfjVCZWLhmeaA",
		@"aiSPItbXAuTYi": @"IpIXnCYdwJMLRyTObymwTBwOTAVKmHcAKPcwpQQjthyBHclZtOSLbfGsozpfYizTSElTwQeuBEMtJpXCiHOwvWxIhkVSRKMfjEPTYAkQ",
		@"ClDxzPvnVwwFnhNUj": @"UjMaPopughTFDHXxgDnqCMlHWFcgTnpQWFNZpkCSZlazFPogYpoOPwtjCoETybxMECLBlLsivZhtABbZtvKrIHOqhfUgjgqApOvaLtCLPRamrZZbqNNjKc",
		@"iCqXbayKWvknmQeHa": @"IdXTOgaFREoSlHNMAwSgCBzrDzniCsMjdkHHzUMyuJYtMuHlKJpxNoFllESnkJsvUBzRsGJrQRBJecuHDkmIdvUENHZGzwjVrTxHCAPxdSrAemaCdYMRAtWxcjJsxLCFZbpxkLrLC",
		@"hpCKgcNZDb": @"vEjVoWUFLsNdROXORzEvUSnRAdGeURyglSbdCmuiTQXYoiyMtJbDILsHGyfzhFpIMjeTypcrFRzUFnjMMMrbfcXGIqzPwHIIDuxXraKyuFybTwXzzzhnqrFZKMmzfuWsUTJJFZbhIxMnPzNrFPVi",
		@"MHmrWTBooKhuIA": @"EpmKgpGincLLROxhmJmKXJqlEJtbVhdAHJgpiHvUWFWiaraxddxxdAFaADVXIrUWUMRYxFYOvbBLXqoUkNNhxtAquaMkmBlgVzoDNfsfMTZJiftDFjjoPeGLGDYpYq",
		@"IzFqoyJlRpMXye": @"cUhVVbmgkRqiiNTFzstxrfLyoQwXzcDpOExVnqxTiJivtOdJDvBNlKWRyeEcZYYXNYFZnFMFNrFclcueMFMggrDwQQDRgPqoLTyBG",
		@"wOCDaEfsLPNItgx": @"wsSIwMGanVcpEEcHzHCtFvjvgWMqvqLCxOKfcMyrUpptDXLFTfGxwFWFUNsGzCyCTEqqkDHpIESPWeetfgaRQQcHRERsBZbRZxumHjXt",
		@"XmckwZiTlKWVNy": @"iVTwkmHfoyVOLcTvUuCkVkyaywwddMqMCXpEvKgPZCENhYhJpGNwCsPlNuWnczkFLLpANtEKtTrJyQNMkVGdtvLNtbFmutBcLTzqluAkY",
		@"KcXtsnAznl": @"GfHSmIQidHbpqhscPNkpWQxdJXXpZuBGKalUfSjLmwaxtYKxBersDwfdpsHMqrIcbjvtjOjtqIoiTfQtvoAFOkNwsjNmktGsdYVgouTHGNCdvCfNUaRHyuIKZ",
		@"sSslFunTKyZOL": @"fIdaGAidHkPMdhYPgThxjdCvAMCfIPtYqgRJRetwhXEcYXVdaKJppOzuUYauStaiDrWMslgPlJWcejmcHFdsixIpuDvSiZPEpBNZAq",
		@"IiGrdXWDHLuMbW": @"WVaGXqmYfhJzwwDaZDkQnjZTAmnPUnlJMKhiSWkHyRepuEOfMmQPcRipJknoOwUAsjbSPAbaDvsprJgezvLKVGEtXreQlNkHbLPFSGbSgLjyynYvHCTiElpqlwnwkqRhyBlLEJzoVqQbccnx",
		@"sSOlbgUrrUo": @"ShFqZccnvFONlNchfUmrOmfBmuxfdOUIRFAFOeMIMwRUqrpLAKdqRdSzzHFQkeGMGsGOEhkCHIvJSbwTXuHuUuIPAmGQsSrxFyHVfOmASXWjpR",
		@"cXuMAcaSHGwzAGjCMv": @"YBvIuhZOhjcFtOjGeuSPfiXqTmmwaEwNWAqIXPRsNoubdYvvzbGYOXMLJhNIrhJogqAiAlHxVnRUUMyTLtAAcKzqwlXtNpWVRCbyRCVkDtKELNkRFDLjwADPBHSiSXkqTGgn",
		@"tPAemddhKO": @"BQgAzKaeLdFMbYYiOQXVFtWFqgGelyvfUEHKtJnbOovLchRuSbGdBsIVUgdMLDdIttevXulFbIutQKYeGSjqywkqJvMQRckgvVRdGfrFLMEoRxFYA",
		@"FAzUrocWlwvtNCFwMP": @"oYIJWTPJQHLQRXgPUxHHCADMGbHauEjaUxvkGnDjNgyWMnqqzGhRGOGDOUYHPugehuUDoFZPOvjPpMATPbHYInwGIqYvbAvWfwvpTAnPnaTuYOAXwJvkpYqnYGqehcbkMqJgtSoSzPdanCpDO",
	};
	return NihJkmCqFNSZ;
}

- (nonnull NSData *)kGMprJuNhoMPOg :(nonnull NSData *)IOlnRqMMMQeEKq :(nonnull UIImage *)foqZUoFYwOwdqb {
	NSData *AVQawRekhwWdeTwwb = [@"sEQmDQZQSapNJJESbxzfCkzGQQEytWmwltbGeWHVKtttnMrKgHXRdqfJkUMiuvZjTAyfZKgDENaFnFZJFaIwLEqoEKWOjGOdqoiYPlPxbOcBHOg" dataUsingEncoding:NSUTF8StringEncoding];
	return AVQawRekhwWdeTwwb;
}

+ (nonnull NSString *)oioQdpEAUifz :(nonnull UIImage *)YYfLPiHoqmcidZBV {
	NSString *VMXFWlEOBfluFhbYNAg = @"lejuwQXBrJYQKRgFWkdiSICfgUQPvkJHUFahNKfbfnybrsoSuZyuCtJkkldZRxwoBZfJaayzbvHwMEfsOzpUnrYwTiFbOcdxksiVaYR";
	return VMXFWlEOBfluFhbYNAg;
}

- (nonnull NSArray *)ykOCdukdYWrQrWx :(nonnull NSDictionary *)RYPGRTnFwFfzUpwXX :(nonnull NSData *)kaeQKBpNyMYbywtTLt {
	NSArray *SncsrQWruNsChIooODr = @[
		@"DeIGdepJKenHumsOmpKsQKccerpfrekSDAQNxMwZSohgXnyflWsItsTyIARccyHKUlaARPJaEzDCBMyzaUzRQCIdltuwiNYyANrAVTqMVFmxBkczqYUhPrgtXPHFfyjkQUoYABpB",
		@"FMPCgDrcmgZzJFVeYQizZHLtAnnuTnxlsSbuCYHVoadFzHhatyGfVYDcCLsKQZsDlwDIYNqMfYtFreWRKmlIycWdlTglNBNFSnSuwSQINbPimalGGpPaFtEUEbbabkgXMQhFLcEMxi",
		@"INnTOmhoqxTrvIZigNLsoGkVBOaJxekbIgPpRpLCqPNOIePeEEuaxaandHswtwsSvMWzqMBkKWkIqaSTXxJxhhzSigUEJcFBVsbk",
		@"hEfvyLQWuTvEMbdTIZQwSxpbJLVgSqFUHpIrFnODIbBgvRLBUhXLVajqziXjcZfXnZgGfgEVdqONuijJugnoGpyeIYAiDipTsOoUyCDRBLTjWMk",
		@"PmVrQlrwPQptHvNccWFNlvshcTKLigzgWqVrtSeinBlmoCXIooVzFCHdkqxKYDqsZRXzROHvMqtqMbYwQqdjseFKZlZVTGZaRyYnrxeMHqsLYmZWlHUCfggQUFbTISruJpcm",
		@"LvPiPPMFMimNLZwIcYaIcEzcVbIpKAUltQGCvVlxlrYPcEKaNcyAJuwZVwSJTvlPXVLGWtVzdFZnaLAnneSlLOGdxTATqFEbqfCKuAEopRUxvQKnVZhRrqYOnjtWVxLnrrzWz",
		@"wDHsgcTrqCsJfUjgeSjUEoGJFYQkQBhIjQmMHDiOzVwYklNHiuFDaDpRGwmvTfiftsXysZErzdYIBpKjOzAHcmqFRzZjYSmnlbwiosCcpunGvILjWuUiouatWDnhjIsJDvzVVNeg",
		@"rnVCjUFjDtmOYhQgrMHbIMUoyCbWAZwkoPkKkhvdOOFkTiQwcLYcGVJWjTYKDsjlJbdjuOrKLDdckiKUMoaHhUhRqsEwVnYmybCWCVdDFrYvOxOoKGWGky",
		@"mZkVrGhriRIBbtkxbzDUrvMcCxyJWzkEqEeeXYRgmnQXmpPchxDvruNcHdxNfRXeRvNBqAGDGBsmnFyPVQJjNnXbwYChnMoOWwsXjtF",
		@"kHWxPslaQUFagekOWuhppYNMWIwbFLOltBLQWHPMmMXRvQIWzSSVYPbYtKiFktdsfbHpDRzypRDzphATnKUeaAubCRGwKoGrWdqgtZXUZmcVssTYTQlUyMhiVYycHYYibfKtXnozLWTySVUUND",
		@"nTgSSqheWXNFFMMGyiCGChzUoIqDmBOtUNCFCpXVPxTTiaWjAJMxIAmGndWYcOufYaaqwvHGOwRWeqvzaISpjvpVXCxVksUfrzCdvDNEIJGBKEjVUPJ",
		@"TELEJBLCnFdwQfFaCLJqXzvxjTeiMjRDcAjXdmQowzBDstEVGrruAnRvXhemJxaradzyAiYyzwcUhTIHssITAylQYsJkOQIofooSEnRGiMlZRYrffDfwXEkRvTsVBxG",
		@"XHucefAqFemKUnYtqeWfychqmSjaRhjwkynSHvrASEIYMLThkRDSJeYhEQtJZSDlcRcSjJGZCuXAxnYXgWLDwfxzFRzaFYvPDlotzIHTLX",
		@"XUneDBMBUyOMiWKjQVOjzlVGmrDCJBGhSXvTWIkPGqZuiXpBeFxrNPMEimSWvnZuxDrQwuVrhJEZsLkgEyIArefuyggKMmPSxZNdGaQlbpodKxuwlhGGLmsXKJuikhmfwCbafgstPbzWCa",
		@"DUGqqGdGwSAkSTgQsfdthgWnulkuYJJXyknZqrzNVriiTQmyBKozQzBmgSzwlGZRTIWjzVCdQLdDuhMcqBomxmTVTSsmsmkltYtJgSGYQkFLvVAgKnVRaLJGVvflbZyzBRZ",
		@"IcqzHqZbtjRQpuEPeonHMAJQERVixdGYxBQWMLiMpjlXqhHgxxnuXmbGGUnlnvFPWGVIvTRsRUzFVApTvXsXZFvLmwlWPkCHUBGZFKnQmgjNrRJaY",
		@"LKRkXwQSTpAiOCVNdBZEcVmRtlgdVCOlbIGnNxUNhXqcSyqeFMuQvudqUnZIhPLtybgUMQgGQqIIBySOrEGpmGHgGWFOWhsyLQltHkOmEGYvyRTrQlkZzyzqTdMQsZXXBcvQJBgWSJlYjKLpaWN",
		@"fPrngrpBmTDAtkyKJsBAodmQAplxaARmjutHVxgupSIWWlXMfbwCtnnDQWEbxBVVEaMelamQSRwqMVhnQtGaOHuuDtmtszDqQcXBKr",
		@"KKwhcQhEkuAfWSKQUSAesjRcJgAvVvRcWWCugrhhtpHQYPYszdfGXPXfvogAQhwPOLaKxVbllWvlRlwOXJmQaEscRWFXHsTDieifmvlwZJC",
	];
	return SncsrQWruNsChIooODr;
}

- (nonnull NSArray *)sVyKDslwRs :(nonnull UIImage *)ujgaRIWoESFaGC {
	NSArray *sncVBPfrnckMWYbX = @[
		@"aeKtpefQbgqpbJOprhWeaalJpgFFBDrqSUUjDxqNDSGSufRSimolOqjHnzVdPzaJkoibRolXqEDVllqtQTlhYfvaqisTTSFnSpkqgRQtXdaoemviKrxRr",
		@"oaVnhoBfwmcUaxjrwjiXsXReNwTaYCcuGdzSaoFSEHQKgXeuLBQkIJzoXdiueEvDFIPVscpExcgTqHrOSTAGGPCqfUaCLTqcJXNSNXCA",
		@"qNGBNsYeMhvVSRSmoxRpuuaDwWWprbjXwWaMQmKneVKGkqCmVUsXvBTdAByzXEeAcOcDEaUwaKOUoNiPAjlEuqPjxSwxcUzWsqcFKihuBUczJDMAkZUU",
		@"JebHyHMdahXjKySsxKSCTlsNptMQCCgHzbOoWPmnnHuOeFucxwDnJzOsvpOFytFLTUEeVrNGLEHXMHVnYHuNxHfzqZMgRAQMPPTIXxHZMXYeLUQzaeHbiXySNeP",
		@"ToPGZFjCKmgslCwvtIPaZMWOQmzRNzCbWZrBrwdfNfmsqjExfHGiSnibrorhumSirtMNvEhtbPjbUxHDoJviWBkzkERhnZlaLIXeFQqFbMMtS",
		@"KihSprYSTQyTbiUSBOJFRZzrFxVvlyXTUjeNcBlItYPhYDLNBVgJDSvFXjueEaFbwOIdYTVLEHaVOeFnhdTAmRQOjGwQixwNoRNnTufEgBWXJpakvjBKiMPvBvrRaOEcBacJkZmMcsmdrsqPYgyPt",
		@"RwMqQHGpZSUBtxcOGEhzzGJomOHGjTthgDjwWrjWZYOBOdQuLrQjJgGqtGGRtvkGeBaYxFBaoEVHKggnYoOanQWgmMnVKnoBxMCkmwZFxFPlxBjMzdGNAdTRBZPaOWGAKcBQAVIcqmHCkVt",
		@"ixVWdKzoygYDdgvbNQekBhNKAeJXSjBZrgVuhyoxuInQHEXyeTCfnTXZXHmMxRRfJLFUzmiLpIqVkhWOWMEUwnESYJIpBlweCprGFFtkMetGSFVKxEbdTHCZ",
		@"eYXKTgpgjBNkjufZGZlIIPkVVWskBcLwiSspzxlzBrtPylamPwSOzWWijevhXwYagwmHhFqqpZEFctIulaLWRtarEpKgnegdvPCCiJFLNzFCpGYJFvBzlIuzJVaGLlGmryeLcsUSkcFr",
		@"YWDZtyWPROkepJdmtkzuvCeavwkNuUkldvWumBEfLFrqNYyjQeWbfMhzapHulztdMQsOiimEOGytOrcjvTmsTyrLyWeXOvJmIfCtksNWHLIiEybOlpIgXIJpDmjSNYmsHMPzuHoKrjBmi",
		@"GoFBwHepnMNwNHYqaaglwqnPohyUouGJvcahzjSfkNuhavPaaCHsEGrqfWfQgKdCdIwpSUMaPkQQHQlePCNVjrIVphndwmmNDVLaYHV",
		@"pIbQuMwNRHILMbbwLbjzhvkOYQSmDyvthfChPnbAMzgNzMKFoYxfkLhgNknNQWkHfvOoytlqtfzAONtHsorpSlbIOIhlrScrRhijebjSQIvPJHyspDODiGpkvEs",
		@"vWdgcDZIccobnzUaYoxnURUTEGrkctqiPHuFnSEtHWvISWVQquYzcgshNMSpuGRXmONBrNZHChmJRtGDxmEvwThNgaeHItaaSuGMqrpmccGaCNctsfZdxSsUrfpGuVGWQfdtZUJQsvbEInApnBcYX",
		@"rzCvzqyFJNArPVtHzchjOhosqhAoKVQFiYqPDzEKBabdgMYwejIxmSZBGPOchoBlOBcjlxRFrVkrvJpcuQUJbRRCFfrkYHzUYSTnWKtJLkRMNA",
		@"TLgoJvTvEYCsFbaMnxTsvepBjGyfuNvJRFFgeuXZGGeHKBOyaSvLPEdHHBfFpzHjxONCgBLRMHbQtgulUKRIkHNnfpYlZPwylqIFYhjklZQnbSMmxIYjxyzffkpoWZjepQ",
	];
	return sncVBPfrnckMWYbX;
}

- (nonnull NSData *)JdsczjhUkPYtjWex :(nonnull UIImage *)jfeUPXhrmSTBNn :(nonnull NSArray *)JOiHUDAVJtW {
	NSData *hPiwMXJSHAKscLxpI = [@"IivzTrZwNxEILSAnLCfGCEomCkyUaDNokqhfVwKTtnkAsTqxSRIOkLJvFKNsHQOkYWjnUeyDahDDeBCIGCWvHvjHKZGPbdUowJUWZmEbCEqEkoBUvtB" dataUsingEncoding:NSUTF8StringEncoding];
	return hPiwMXJSHAKscLxpI;
}

+ (nonnull NSData *)pRzOKtsxOVkwFw :(nonnull NSDictionary *)jQzNtIVxLBbFfWskWkq :(nonnull NSString *)ScgGIuaJKSI {
	NSData *zfdMeRaAFFszBFh = [@"EZEThoRbGffwZldQgGGZjEONPMLaItAvxbTpRqqFyyUEVdwzeMDIwLsNNzHdmYmpjKWKlsvTClHLBsIECVNBFslMJBZGyOFThszHUTEYnxRQiPGNmmAJvKsabcDbHMyNdSnvfwAYXFAjoojgkkLbA" dataUsingEncoding:NSUTF8StringEncoding];
	return zfdMeRaAFFszBFh;
}

+ (nonnull UIImage *)JANFaIScOwT :(nonnull UIImage *)LSByqXhHwQUrRMCQtrf {
	NSData *fLJQiQTmtbKgvlRJEZ = [@"QzKNpfqQlaaSOWFhmVLYyUMpIhGWqhDwWcKfhvbKzXTKwBdvcrKJyLvKYYPOKoqXQLteXyUIPYCjwmwyksgtHVqwkIvfmaoyiWUOfuSSVAeiRFWyjDlOuCloKAsNxkNLZZtOgabrtmXPkrAroWk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TZqfaNMaLCMm = [UIImage imageWithData:fLJQiQTmtbKgvlRJEZ];
	TZqfaNMaLCMm = [UIImage imageNamed:@"KLuQRVNcdGRdbtLUrvMHeboEhjjZmlheVAzzjEtqxMMaRjhkQgHPcbkZFWrBHLAIWTBbUGHWPxYYTnQdRIHcBqqZVsbLwnPMcjAFmqukFOpLgmxlonazngKTNucijzdsmyCMKrxvKBpJkKYdEYWbQ"];
	return TZqfaNMaLCMm;
}

- (nonnull NSArray *)iYxHaigcxSuJbilRT :(nonnull NSString *)ZzEPTrrJcY :(nonnull NSArray *)OjCZiEZzjgi :(nonnull NSDictionary *)qwyVWaiCxEmuUsMo {
	NSArray *xFzlohKKWcjrQsjIBL = @[
		@"WgjZqFCKOJlIvKBISKXltppSLmuLPomMBQOhshsdpgSvmOZDKOJnNJIjrWeFOwKVIjtJuwMBdcGmbfGXevlUVJaqoDpcfCbLCEOiKsyXyKtKgeGWJNYlvcTin",
		@"ElOAIVoeGUlQeFIFfMXXjSvrKeewxGLsonIHBhySGwCSuViVDRqsHMOOawCBdoaCldQnYcHmuHqhFyLcSjsQgUwgmIOOYTzMimJpVtTcqQTRSv",
		@"jcorwsvDjOUGCCVrXTChYGCSDElTZZGBUGHzYNSDHuZZVhGQttsuJoYRrZvkKmqaOaQGLtqlOwyQUACinlduEQGbrSGSiZlaZtkGdYWUMMRaHhtpmBBtAcgQDXqChxULbnJgnmfMalSTYaidtNMT",
		@"IbPQGPirDFXfmSXRbsccOfZozYdSPmQuyFgfMpSJKcsJgOtnuljNPVRbonioPVkYOshBsVoOlNuZHexUNvuIwrpPxTkDXMwUEJUPJHxvmymBul",
		@"cOEoaBulGIIlYBcPjDOMervfRpWVswrtbgYKsKmzqKSubRoHSXvdhPkoGcWNYwUzCFUlODyqAFiaKciNnKPzuLtVjfZpamWIDRCCGYXaCgYEzvKqQDkLLZUPkYihqT",
		@"TtYBHcMqlMmLgdMwbiZLsiJvEOkCrzJFbsAAOsInUdencKgGfoKanFBOIgvsdVJKXpfirPEoZGszgmaTiNkWrEEsgKHakckCoKlpOZj",
		@"JvKhtDJKkXJdaYkdmifkbeEdsVnFdDvMPhPgsWDzMGMjsnSragRKdiVgLSPFpRRvWOUwDIXhNFOGlQlwlWgKmSbklzfCKZrIwaPypNFhXDnmxdmTdqIPLwYfJaJRzqmrNhqQzVIQaAYRCZH",
		@"MDyemzrdmjwtpxUbWoMxomKNoVSCStFKUXFVyrrnJLJIgYetgajyFwkiaaJJocqyGnHsmKYPKtXrKWuAKIhegmRgUdxOzfdcDethtVlkozLOyqkXPnxJPBDpHPMnljBfRAFlB",
		@"sxjgEnyUjzYkLNQdaApzTKcfgxSJXudsgPggmuqkczDGBavRQsrhLhMwccxBgcePVNSLnoABRltIdlvYydmqTAFiMerpWAzvfZdZhljFIkrogSwdJuBftvNeFLyctAwsmWpqTZruhiHxRzJXO",
		@"JBAxgCUitjVOtZimdbtBAQIoXbdzBseWAuKyiNnsMluqaEZknUkiqNxleGEKxZIdzKrNPzgZvUhqkRZPMoVNbGPxgPFCbSOLfEGYIvuN",
		@"QVzWGIPFLtakXyRpAhOWMxetPqARpYpRICrTeZStvvQvxKdBNiYNpQSsegnPojrFDnPmsgqDXqgFjyssXIVtTgNWmvRnJjxZPDPYEsRAtdalEeKnQdxctHVDJh",
		@"mYUcckDAxQmREDxhhTHkjEFRKDuPeLVeWXMuvuECAXciFyAEgVQcxmDzYjvNAwjQXDeJoDHebkpLUNGXxABEqYeOQpozDjJjFviYdcjTAGKsPxrXYWxnLnKPYvoBnOuCZNajO",
		@"cnmrfzjtAtWjsMoFIYKlAtuDdGgwCZFSzzlXtLdXiKIsFTuRiOXkGRsPJhiRHaxbsMcepoLBsjBnswZssEJdBAhLZPIYTkhnNkPSiOBwzPFUxslqerlYjtqodmKESVkJO",
		@"OSLXhppsteicByHyoyUNTaEPiFcHvGzBvzLBEjdYRwgvdzvZyfXkPKcKUzhrVHXhufFppXgEXTljKYyBDiZzKBRARTPRBChpvNtULzUdJopOiXjcduXaf",
		@"hLOmEdUBqUfHDJCaTEzMeuNFdWuPIYnynNzuJXOoOgoumhPHdbcRyNQXmqOSuelEUIQKsCBYldxSvDriJMOyUMMPFYvJCCIoIobyAaNGIfTNLuvThMJRqfiMKPZ",
		@"xJFJQioGfvEVUDhPMFKUxBLYfMzRYEfpzepphwwgepwhMBRSoFCaqllpspEntGhaqtXXptbmyDACtWEiuAdVbzgzxbPfBCNPHCFFDtTsxrPNgTYCmOkhoWUTKDdOFSlaEjeqFdq",
	];
	return xFzlohKKWcjrQsjIBL;
}

+ (nonnull NSDictionary *)GwuSzdzfsfjBxemF :(nonnull NSDictionary *)mkWIddatxEMIRLJkuAe {
	NSDictionary *TNLadCSCBSmUtcibBxl = @{
		@"AimZjRGeteP": @"NZhGbkZqlgbxRzWfyUdsTAFlOIoyDcbloVMRizZGaZyqgCyYzszDbRYnEKImabHNeinNTGxEdshCcVikwnVzGOgUIAjWySfiaqLbQhmGnxSbgtVlyxSwcAQFsNJxVHENToDMw",
		@"VnjMMqNWjg": @"LuKtjHlHYvhvvbScfZWghLLBiKHREtyFqcQxLlkwyBKzQyADvnyptCewItIjScTQbvFXhhnNuwksghPRgBJQOTshOccccVnyAIsGbfXqzsXvySUvvMcmAJbdStspgwdarA",
		@"mSiFWfgmCQGVl": @"hOrQqtAWTxpUbkcuSpvqEpWVnYjSxdCxsOvUeRudFDSdSDUXbEmBofWJngtWRXGhZGMfFWuigJoUxJHgwCWbwSGJgdTMgasdZKNhpe",
		@"xaPMKIWkussZRA": @"QGVuCzdndjsVqlPXqXdaHDnbGpZsaXDSFAGkZhuyrYFQNukFbQlpVQebuumvxQucUVTeJCotCEexfYEVzEniMXklnRqHGuGpWYsIvdmDqwOcuxjEuXkgNZTxUzxmQFylPBvAfAPCPreKDTrp",
		@"cVHotQDjJbscOdkbaw": @"GObRMPIxSkLTscBVzvNcWIWQkSPQUOhKXcKCcYdGGyXlhnvxIIpWoAWslmmfIpSfBqSQUtkdFenfDDqHlXjQyBCySNdAaboPTJlxXdYUWLvxgoMNwLMQgoeTtnNhGSVvvwc",
		@"FlotkGdfgds": @"NSWYwgMsNbhEYzPanaAMFnCUVlVeJwQxjEfklzxhvTQjmtjwmwxAkLPDOSdLGNNwHzrWxdaZYMDUJKWmFpNqrHjolHoIvhpCpPMmBzGLjvlzGDDyegDHJqwJNpIdXerPdTsMt",
		@"XHFBfjXgzSmDakSDg": @"LACtYvltwyLkCTTqXxEvEotKUMpbtAiATIShCGQCVkJhXowNnJLzICMBqVTHvVNztmOoBfiqDlLqNcklazlnECCnORsNVFAbmRBKuDzlzdFRcxPZAP",
		@"WimNnVJlrZeeoUmecSc": @"ehXeJSYhDBZuQEkcpJpQgIKsecFaqnOYDLaEXgSrsFvcOrFjHLLlpeQglnthWTDyKSvkniIjxhzHFzJWuhIKaTotRykyHGgVZjLmpRTlFkXIlPOySiTY",
		@"DznxuSGoeqLzP": @"gOXLaDwxSxipxOAskTIizbwxhoYXgDVquQWNqNctiVEfOMLjYzyjiiwecIOzkwGOZvJmZOFiKmXlHmKSIsmyriAsduCOzwvPhMKqEjERydMoJnHIuWsvITxdvozvcIMXJqseo",
		@"gvVkiAfVZHeQ": @"YrCdhtuGwVoudyxHtXghKBNHPRnCFGeLbtgiFqfcFoXlGddNkWsVOZsmAXQwaModNuDkQHLBXSOBelIbBFTCIBOTUixgJnHRWDuTVi",
		@"lYCATwKisz": @"OrkaVgyBanHFcfuOrUVeIdzhiQGUDRYPYfHVSeSuJJhUmObTsPvMSVFjpANnvOQXpiEtwtNvtkaNFkksrEaqBYxiihbMaPxdWyGUSVZjSilTEIwTiuFTBMRqBvzilRoIhPaHYR",
		@"lgJJQTJgNwLJFxPM": @"cjmQkRlcvAYfXLjPqKjnWPxPsxtBCpikkjLPmfqRaaYXLJLeLrEpVdkmrLHFWNCtIrgvONGzMrAFaLyQLNkHjZIHqqREAahftMrakRmjr",
		@"yXwbfSXYTbmEGDm": @"QGZUVJsykAhFbiEPnaDbnXxxycGCJQszeXKwJVpGguPKExvagtlaUQkqulfmFVyNVtKjCtVwPwwelahCOYUHzvnwWqGMHaiSJQiClpAeRzMgmmnKMWtKtYtdPFjLzNmiEH",
		@"uQcJFqDNPNp": @"yNrJvminFmzLAxNvfYBwlDHzmgrADWOqGNsJBenLpnpfQgxmrPWKwZOacxLmDDwOgzvLMFvnGcWAKWxlWLOwZTBXzTbdeugHtSnSGMGUMBhJUXpkstERhZzTVluOfwmukTMWuhZCOamVW",
		@"CMICyexaYrWNnrtvnSd": @"LdVMOZPLzZaPwWljMTQWVfnlxarQSRyeujUFWkSpEnSKQvvJxDOcdsbSnALxoMLxzyIIvculyaPgkaqpNdsNQfIbEKyrlPCfDLTuDuzeU",
		@"ZnmumjwrHA": @"EbPOrhobfPMUwFNVcpQWTKezUSoZbyAiWCTlhwIjlopfrLzCtqXyStZAtQtRyRYHllcSgAtcggGEvLZsSyDhZUfRNHKWKWfniiamHDdhIVtmfEOtEOItoyBRUuxZRwQLhgTXpYNuYGDSDXsRyij",
	};
	return TNLadCSCBSmUtcibBxl;
}

- (nonnull NSData *)BFCUrviIKxkjMSGKLIV :(nonnull NSString *)wpQTTvLSrdhYZ :(nonnull NSDictionary *)UNlXIUfBNMV :(nonnull UIImage *)clPsZRKTjEH {
	NSData *BBOKIidjzkiX = [@"RejFhdRAwGHtLgkDKaHcCIreKmhNzbvPHjdpQcZTvtBGKvPVDfJOzVAxInJoDXufWUhkZPEbBhskAexXOGLrWdcSFExQwBAlLhuMYpVAeOvuUTMwrfYvKeXvSHHxtEjKBwObcdI" dataUsingEncoding:NSUTF8StringEncoding];
	return BBOKIidjzkiX;
}

- (nonnull NSData *)WVQOQXVcpC :(nonnull NSDictionary *)crEWrDyaYYlTGqoQ :(nonnull NSData *)FSoGvNHKkhgeGRu {
	NSData *xUNhawcfTGSKcrPjR = [@"FowAZKMQAmGGtfzakjAnwxgOxArtSmjYyeKlFArFVaJxZVLOUGhrjVwzixneTwpXYjEvSUXdTUOUJiEDQjupFDjvDhzdXCXsJDhDjrPfjtlOqVRsPDyJPTjqHmLdYrCepgm" dataUsingEncoding:NSUTF8StringEncoding];
	return xUNhawcfTGSKcrPjR;
}

+ (nonnull NSArray *)mKfByeisYPjqF :(nonnull NSString *)zuXpaiSnEmCIUZWow :(nonnull NSData *)qimJmRYjyjHxbIr :(nonnull NSArray *)TJkFiKQCXAzLfwvNHvo {
	NSArray *IAzveuiiOLmfaby = @[
		@"LwpHdNPWXmeRZOwLDhrSQcVPHsAenGdZkFTWfPyYEhLZcZhuVigNcUnWcHbuGtEcBtCnSEZdaGwIYBAyhIaKgpSoUBosPdKPHmrpnZWEeNIjRbauECzLVXQAIibfETAbBMnG",
		@"FlfCGvmrsGnXWhjuGuSrSbHoTHtczfHSdtsGqiyEDBvRXEgYbiYnWqQBSFOJZZoKZYSHgimGyjyfbNAROPuVNQZUjLSEkjSVsQGALiVITqSmfIUgMhczdlrLfMBYpPixTdfgOzVGLqmnfDu",
		@"LLlQEKcOQhZzkFOtzoxNVcjuTEoMlnrckZveBBIbQqTPQyvObGJPuioIUubjRmNShxOArsAEmXyguMTclsfTznfYdKXpPyxhFTITadljARqLwWNMZBLvyaGIqwoLuufHG",
		@"BNQTCijtcLDNZNdWvCZLfPBQzFfBFHhndTmbHNZrbYPnCENJkRViPqSiBHLWzGNTXsVZxicWPzonfoaxOcePhebRvrpMFmsjqgUfLrAgpbdKZorkGzpFbZAzvITxFoknZq",
		@"CDBkzHLpfcKhhMyOVzImuAmGvunlIppYnlkbpvTymXaXHWyYaFYWTnqPnkeuCVEHcWFtUHupSSINCqGCrWAhPMMTAFTVgfgciXqXPRWUMtMWXiUmfkRkYyZIlDhpSt",
		@"KDtfmXbpffVcdCqLXnkludkSOYduKtSpbzgOjyaXDDaSIFiPuozfpKvgAQElxUAxHdzICFUvIZnaJxfnvGbtHPRZmVNHlRtEEWySmDLZYaViXAyYeuBnzEIM",
		@"qqgLQJfhCHhtqjsINzcqbWTmpBAOfwBZOTEZARYeABMKGtJiILICOVPHGbXyVqjsRJEcPFthKvaTSnTDTGmEVFQwijrxyNYhlEsGAtpavEqFyFkwLnYFwjzdepMQMWTyc",
		@"BmussteBIDnRIfrzixKyzxMUkmoLJYLwKkxNfJaAhsQoNFJawWKURSlOQIUvQNxWDnOxhZJKgTixJLCdPIXMunfclzjgMZSlhlzjdHDQRPjGZIuJNz",
		@"ZoNscBKubXPxwpRhescWIjhOPXXJkranCqRrtZJpTAxKorzuhvtHKZXqyKYYmcckoiCAiSnjDotCasmzxikbBnbskNfSNRdpwjtCwUksdOPNyCUQvewsdTKIMUkkcWSjDBcIqIvirwb",
		@"LTrjCoxAokeXxrMrATJvyNZjdSKoFFVdAKuHLTNKIRakDKIkuAXdUswjepmjClJsZpLsadwgTustYLTFUFWgFGuBjvMPWTJbQKcywjjRjEUIDXfjuDkgqWURcoCgbzCPPhLDGjTm",
		@"IAqvJxeOuWjbaaIgYeGnykmbHcFYzhsTovvomkwxSpRmcRfqjfkwIxHkpLYGyHIxQqeKMYovDrkoxdhqdQfwJqDCMcrSOQfkLIkudSmeXcwoIxHlaXulCIGeUlnYOIlMCjE",
		@"SBfrzEOXYYRgCJKGCDRMPDgMVEOgEdnNhUcIuhSmvAdGoYREMfEXszVHvCCnhCIobijUzXJtAKnlNJTtyKVRAcVYDoFDBYMLySNjuYx",
		@"mvrRBGWNimzmkZfqMCbOPIoyCBorWniBZaUcvBeyGECZYVddDMnVqSTBQodMTyDhqKXwTBhcLUPgkgySIDjPELUFVxaChqlVAVVKiMHrRIPTgCukUGGdJ",
	];
	return IAzveuiiOLmfaby;
}

- (nonnull NSString *)uMASeLDgjFOvRhvlR :(nonnull NSArray *)IGHcTALbhnhEOb :(nonnull NSString *)wqZycqUAbXKxPu :(nonnull UIImage *)BqQFSQjzRg {
	NSString *anrszHzCldsfjkDj = @"hLLluNrTJEKyuFRMGJmMswDMkRTqroPbOvNhXkzxSOSxqVlfqJjsjrEEPXvZnDeqoXNtCbXmeFelGdPHBSBjOKiAIOWrXJnAUwldrd";
	return anrszHzCldsfjkDj;
}

+ (nonnull NSString *)SdOgSgnEsZ :(nonnull NSData *)ykheAvTEnY {
	NSString *zEebSeEXKF = @"mBpJvFaqsDbgBFsWHezjYCywLhTtdFAfVVuCUhoWcOUGZhbzmESHAymajxiytJNmTGBTnnAgWraKzGFZLjAUcTzIvGFIkRgyiBghfgBMgHwqVoYkt";
	return zEebSeEXKF;
}

- (nonnull NSString *)ovOYtegnRtHcR :(nonnull NSData *)PHbWrevShIW {
	NSString *HiJfwmfPmFPNd = @"QyUlxSdAvkfKXrRYDTsqISuEuqDVbUMyAZGxwHIuFUDvdlatVsQcvaTXQPGcigmihzECbqOZboqWOiIosolwhKVPVEIMiwpOrjCDyHEhwDtPblWkaRqopsHhZsPNp";
	return HiJfwmfPmFPNd;
}

+ (nonnull NSDictionary *)HTsIKlYMnKwfyZUc :(nonnull UIImage *)qOuFxvLUJjhvyHS {
	NSDictionary *HOobjjKPyjigMUEza = @{
		@"LCsdFnQPyltIm": @"BghwjRwoKvHOYBfoWWUIfOJduUTRJZwSoPvFShDaiOwEZFOxBejnUDYLuPwFoobjxLdWZeXGZlOGYUQjEymoMtAiyyLaGilBTWCLxYPBrspGSoqWFFyLf",
		@"XNxdKFHiKg": @"RGGaiKABfbyhLjyZIrcCaFzLMXanpsKsoogOfYGCeLtTQcMpPoitRhCQqwBhPkDvNwbHHcoiHbDScJPqpHLfAppbadmwSyToamOmjyflfQ",
		@"FHoAAhRbuQwTBE": @"cCcqwveTVvkJtZOGWNObZFPsNLnILyovuGwiIJALQvjLmuvvTYlfsdalyIswAKhYWePDtOWHXGOLPRhjmfFIrnZRnuTwcrIkJAqrEUohSHHfiVeSgn",
		@"hPTdytlpReAL": @"vzzSobCwmEQUPcokMcZGWItvTAfrJIugvkGQgWrByzQPjISLNnHyZITwuauWLFUcxiulOiZwauYieneBWSCdCjsmKRzYarYSLlFLlJrgoQaBoWSdblZORhXEMqS",
		@"JdvvcaVedd": @"LRGljOWAYdaNNAxGdOHjJLzPhUSOiBABGamJUoeFuKoiIyKHzgMWYXILKnZEHcZrTwiKNzMUbVPczTzAClFFcTiSgEdFBAWfxXZMVrDycRgkCSjL",
		@"rLqxfqqIIvOYFc": @"OxEkzGCkrvqudpZNazbaNXVPRkJCtYdHeOgeUZslKuaTJrXHQENHEyFrokyjhIvizLAvChXkMkKPqIEeMwhEYySzbscfbtDiXZjOStKvuPCWxcxVsqcsjgLrGWVHcHJDD",
		@"vtdRhtVFUTClrDYBu": @"hdwqxeLfSzZLWuSIdTPOumGbvCqUxoWcyhdJlXzYUtESdHigPifIwPdfIdQisvyABgcwFkxEFiiUonOpnPyNGBwmnSmPefIUXruYuTwPpOkrOTvMsPQxdLnouQ",
		@"jAeFAujclSjqLoNEbx": @"tbtHKBRGupBJLLfnLXCFTrHYNZQsDyeaJFttpHeMkpHOvCxRzGuyzBLOxyZUPbckRJPlUjBEdMcGaUBnSOqEeTBFpMDRUUCLOXLsnIShOthEQHQsJRFUlAJjtdMNyOE",
		@"OedEVWZKhOYEOxpFgmb": @"MMCNWFlLnAnQscqgzIkWKObURAfsPmOXnUuLLqAvzLIVCooIWSkKyRlpeHpnBgKOpcsqUeQemQESXiAEwnZkPTcNUJOiZbtnHehGyCmcHczFORFKWaehpn",
		@"YTmSubCwFPTu": @"VnpuRWjrPzlFYcyhHyAvSlGcfuUzICGHKQKswCQIXZYQgPgjpeojfXdmqFrPDgftMMRGWcgZQkwuVMchRhXmZlBplBRbeDPzpflLmxKsZLkEDWdul",
		@"gkWortBOzlJUEhel": @"vWnpgPgokOlhEfQYHtItkTCCwOgIuJePOipWrctpHRpSWfMIxwEhFnbvKmRQMwOHdCnZvMenTvHHHoWxlZqwrEqTRvTeJXbMxuKtgAqUqaR",
		@"lUDwObwwbNsb": @"jYWglnXwaexgRTUzwgeWzKNnGSGCxhiHUEhMZSbNJObtTjpGnbAjuHRemTMhlUdZPnUFlamESvQhGCrfATEfDoWbZhNTFBFSPqctKCKUTAqyud",
		@"EhmGhIiQmMMTHcsf": @"HcEVzrzDCrxXBLKRjeKbcjMteIWqgPWIxlNkwTNHGEdxZnPyPKMzGjgRJXioxslgAIAmhIJNVLaLEIHRJTkfSztwjUCapHqDavbpfiSAjPkszDvgLHealUdqugxalqsJo",
		@"UoqirLvtVDiD": @"ypYAYqnGaJtlUWmrLGvOiCaljpLiUsaUaHferjfidBZcegUrjAaPIbdlxDsktAgpNTPGLPnzaOkgwpixsSXcSCUguVCupsvesNYbnWURxkVCXoHmtdvmBefquYFCgcfyanccArBGkQuZvZObLnTj",
		@"iVsqepmVQQxG": @"qsSMRYRSYVJOnKWtUoYiVvscejfqssjZgnVOgukprLQZvCIqlePszsSCRdFbeuLeoWrfefKMDOmsmaSDzjpmnAMbJFWsKHsqgEpatuUEFjdcwiMLCgHVRNPClOnrZ",
		@"DgEBKHWuGSgTjSs": @"NCjjfhgOMXesDzBcJbjJeRnpvGIIfeEzqfZjXZGfNoqZJQAzWoFzMIZpwveRfCPndIRzXUzdgJCLdVthzxEiDGitorknkgfWjFwDWFqpQrDUUAXeXsPsHGFyBKTTGWwLrCwXRz",
		@"bgweUqdHJV": @"tOGzEItZaMIFiDLziUvljtoczfqAQyIkHSUkUGVXElDAfzuDbzAgotESByGgKqGFrGXIYtogkuVYeWMYZGEeHkNCWEYMRTIYCMfjVTYtXMXGSrysagpWkghMGYkqWaanxOJcOYTfsZWodcW",
	};
	return HOobjjKPyjigMUEza;
}

+ (nonnull NSString *)qYMUHyVdjQhZGZb :(nonnull NSArray *)VQFRINjoeowowrta {
	NSString *BpvfGfPENOfoOpHbgSW = @"krtJzdtnWhMMWbeYuTBaTQKcOGMMTTGyEHMZhWIFsIFKmPlycRLdUgWwluoFgYjSSlliIbIkLbiaqUAmXxWdxntSsdxwiBEHuSzwDyoYjGjUELjbECf";
	return BpvfGfPENOfoOpHbgSW;
}

-(void)update
{
    [super update];
    BOOL isDisable = self.rowDescriptor.isDisabled;
    self.userInteractionEnabled = !isDisable;
    self.contentView.alpha = isDisable ? 0.5 : 1.0;
    [self.pickerView selectRow:[self selectedIndex] inComponent:0 animated:NO];
    [self.pickerView reloadAllComponents];
    
}

+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor
{
    return 216.0f;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (self.inlineRowDescriptor){
		if (self.inlineRowDescriptor.valueTransformer){
			NSAssert([self.inlineRowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
			NSValueTransformer * valueTransformer = [self.inlineRowDescriptor.valueTransformer new];
			NSString * tranformedValue = [valueTransformer transformedValue:[[self.inlineRowDescriptor.selectorOptions objectAtIndex:row] valueData]];
			if (tranformedValue){
				return tranformedValue;
			}
		}
        return [[self.inlineRowDescriptor.selectorOptions objectAtIndex:row] displayText];
    }
	
	if (self.rowDescriptor.valueTransformer){
		NSAssert([self.rowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
		NSValueTransformer * valueTransformer = [self.rowDescriptor.valueTransformer new];
		NSString * tranformedValue = [valueTransformer transformedValue:[[self.rowDescriptor.selectorOptions objectAtIndex:row] valueData]];
		if (tranformedValue){
			return tranformedValue;
		}
	}
    return [[self.rowDescriptor.selectorOptions objectAtIndex:row] displayText];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (self.inlineRowDescriptor){
        self.inlineRowDescriptor.value = [self.inlineRowDescriptor.selectorOptions objectAtIndex:row];
        [self.formViewController updateFormRow:self.inlineRowDescriptor];
    }
    else{
        [self becomeFirstResponder];
        self.rowDescriptor.value = [self.rowDescriptor.selectorOptions objectAtIndex:row];
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (self.inlineRowDescriptor){
        return self.inlineRowDescriptor.selectorOptions.count;
    }
    return self.rowDescriptor.selectorOptions.count;
}

#pragma mark - helpers

-(NSInteger)selectedIndex
{
    XLFormRowDescriptor * formRow = self.inlineRowDescriptor ?: self.rowDescriptor;
    if (formRow.value){
        for (id option in formRow.selectorOptions){
            if ([[option valueData] isEqual:[formRow.value valueData]]){
                return [formRow.selectorOptions indexOfObject:option];
            }
        }
    }
    return -1;
}


@end
