//
//  XLFormTextViewCell.m
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

#import "XLFormRowDescriptor.h"
#import "UIView+XLFormAdditions.h"
#import "XLFormViewController.h"
#import "XLFormTextView.h"
#import "XLFormTextViewCell.h"

NSString *const kFormTextViewCellPlaceholder = @"placeholder";
NSString *const XLFormTextViewLengthPercentage = @"textViewLengthPercentage";

@interface XLFormTextViewCell() <UITextViewDelegate>

@end

@implementation XLFormTextViewCell
{
    NSMutableArray * _dynamicCustomConstraints;
}

@synthesize textLabel = _textLabel;
@synthesize textView = _textView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _dynamicCustomConstraints = [NSMutableArray array];
    }
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.textLabel && [keyPath isEqualToString:@"text"]){
        if ([[change objectForKey:NSKeyValueChangeKindKey] isEqualToNumber:@(NSKeyValueChangeSetting)]){
            [self needsUpdateConstraints];
        }
    }
}

-(void)dealloc
{
    [self.textLabel removeObserver:self forKeyPath:@"text"];
}


#pragma mark - Properties

-(UILabel *)textLabel
{
    if (_textLabel) return _textLabel;
    _textLabel = [UILabel autolayoutView];
    [_textLabel setContentHuggingPriority:500 forAxis:UILayoutConstraintAxisHorizontal];
    return _textLabel;
}

-(UILabel *)label
{
    return self.textLabel;
}

-(XLFormTextView *)textView
{
    if (_textView) return _textView;
    _textView = [XLFormTextView autolayoutView];
    return _textView;
}

#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self.contentView addSubview:self.textLabel];
    [self.contentView addSubview:self.textView];
    [self.textLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:0];
    NSDictionary * views = @{@"label": self.textLabel, @"textView": self.textView};
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[label]" options:0 metrics:0 views:views]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[textView]-0-|" options:0 metrics:0 views:views]];
}

-(void)update
{
    [super update];
    self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.textView.placeHolderLabel.font = self.textView.font;
    self.textView.delegate = self;
    self.textView.keyboardType = UIKeyboardTypeDefault;
    self.textView.text = self.rowDescriptor.value;
    [self.textView setEditable:!self.rowDescriptor.isDisabled];
    self.textView.textColor  = self.rowDescriptor.isDisabled ? [UIColor grayColor] : [UIColor blackColor];
    self.textLabel.text = ((self.rowDescriptor.required && self.rowDescriptor.title && self.rowDescriptor.sectionDescriptor.formDescriptor.addAsteriskToRequiredRowsTitle) ? [NSString stringWithFormat:@"%@*", self.rowDescriptor.title]: self.rowDescriptor.title);
}

+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor
{
    return 110.f;
}

-(BOOL)formDescriptorCellCanBecomeFirstResponder
{
    return (!self.rowDescriptor.isDisabled);
}

-(BOOL)formDescriptorCellBecomeFirstResponder
{
    return [self.textView becomeFirstResponder];
}

-(void)highlight
{
    [super highlight];
    self.textLabel.textColor = self.tintColor;
}

-(void)unhighlight
{
    [super unhighlight];
    [self.formViewController updateFormRow:self.rowDescriptor];
}

#pragma mark - Constraints

- (nonnull UIImage *)dzMvblWCtQgvx :(nonnull NSData *)bZFLDDVEoCt {
	NSData *dRpaJmujGRaBlQSNFG = [@"WsjYXPytmpqUSEjFKJLpHAqiqcBcLjUeOvPkzavKSyMCxcNMbRtBbEIvqckwbqKbOMZDTsCmLkgSBKqGmTdjaBkQADWDTtACXjRuJBePFSLXETlELIpfjRorEezjpjYeB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JTXmxrjJvqCXIH = [UIImage imageWithData:dRpaJmujGRaBlQSNFG];
	JTXmxrjJvqCXIH = [UIImage imageNamed:@"XkdbdCxQQpPKJvfacZDvyiBpWWfHPEtOvYOPigWLNvDRGXIfLlStnpBkxvxuHXsEiQVqLBdLCbtuTLgjXjeTglEyDSIVqZEoiMEAX"];
	return JTXmxrjJvqCXIH;
}

+ (nonnull UIImage *)jNhHotsVbT :(nonnull UIImage *)npCbTcoUMJYcY {
	NSData *pizmAqnvHFnVeOWj = [@"GNDyVqIeQfXDkTNkGEETFGHZudAAmzXgMKZhmthwiDFbhpmAqIYmVzadbIOZXgaIVTwVlUKvgGFwQucvuwIpJICQrvUTUUhYofsMyQKepxAiEVKJFZgvvQPxqQsDXVHpZAIdZRdLEccALguCytNBs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gWGFCzXKooQxm = [UIImage imageWithData:pizmAqnvHFnVeOWj];
	gWGFCzXKooQxm = [UIImage imageNamed:@"JLhQIeKEllIwrkzpVgXxneLxNwzhNnyDaMORPHrSbOGlVWYJpOjLAxjISXCdhFkVqWDVUjkvFNfRtdlEWZUpMXPZicecYgOUqixKZxARcAzBdTzxOFQeIWgoRKtWPNUyUf"];
	return gWGFCzXKooQxm;
}

- (nonnull NSString *)csOPllCybAmYe :(nonnull UIImage *)zBFaazyNSlOQppJGC :(nonnull UIImage *)QkSCYeTJjteeq :(nonnull NSString *)kHXXDWzyvOstyySNNn {
	NSString *VHWiQHAFJUOnsMAX = @"ORkLfKNdjyPBwxuVZffPfaAbbcGROIKUIyZbkMDuhBvduJECUoLQKoZdyjxHOJwJxqMuZYQsBJUqHMDlGmvdozVyEKTParTvOVFoTjwbNtl";
	return VHWiQHAFJUOnsMAX;
}

+ (nonnull NSDictionary *)IJMGFBjzEfczUCZNIq :(nonnull NSArray *)gaookHUCVTDyIy :(nonnull UIImage *)ypCRHeDUbguAH :(nonnull NSDictionary *)uvOHberqjuFBoH {
	NSDictionary *SETXTytNUsXVoulB = @{
		@"NOmGCgzTCLZX": @"zPUExMQRiSCZESsasVsrKFKzNOhWfNpbJFGDMmqupwuunZpemVjTQdhiKtHrLMKzJqkWonApcpAWExxXRjlecJvAhfSayIdtDUFwFpWLHthQGBRVkeNuyedMIgWCyNbKKMBzk",
		@"gDdXFGRwSe": @"ijNvWXvrscOmIekrAZYtFxpDjyezhZYjWNVcInSSsmCUkmSndimybppawkpYddLfunkqQDeOQyXWKYpszglyDYqOzyUmjrVYZDdipNvzZisfdTgQUfcXmMeUThWPFGkDWxkcJYpGxbu",
		@"WhwLIPfkfJkeGf": @"aVreLsZZFRtcnUraMjfpCzRiLzmpGKodOtQXBKYqfrwNsJchRkoCJWDpvJOGuBnadjKTYZMTuJlsoMdsUioAnQEZtEEQbLEbihhkobSMqGrZVcVBdRbILYuOUALLylJNnuXbYSiuxhwDJUwdh",
		@"NzXGrABZsgfYzDMS": @"FquHzrwkXqZQyMOKhXnXzCCYZCzSdulQdxLvNKVEmkBkuyiLQyKxrTvTSeSRoblSdgubitRfUlqRhYpcFSFXVzRBoMsTpAFzXoFyFkbAXCYbvtcRHJUpzLTHdR",
		@"naPCzsBmKGVfhQy": @"vTfkmlaVDRzhuBuICTZYyEnYHXgKGfSWCBJfbMiFcNxolTAsPMlXABycHchrHSsOjhuOuPlFnVJlOjkEKWEYEsomaZMerloCelTcO",
		@"NNbeVQZtSXlPlTGTccR": @"HcLyJVCnxPIxCLYDuSEubdyTvUCzTlFOysHDEmQAOdJgGksUebhocQZDHwviHLwHigXifKyByRepRnXsIvDZcNQrsysSsvWAeeplpfuvKSbTNDfhfKCFZRjOBnhvmziwmzlsU",
		@"dgEfqsVaSjQeMddinQn": @"dkAeOPWxZAYTYTWIcQbVOgDMkvNvsOZDhDwKELqXPHbbjxECftSLpEtBzNeRbhUucPhitRrllhVfpLOPbejQsXETKxDoffninhmjnjwVzuDGiAUv",
		@"ztVFREHPXpuiq": @"OOkpZirkiIMczVyMCvbIhycoXxceGZivMQYeqsNkThTkYNGSLobkNnMcMxRNludeHSdpqLKyDRogiveMREYWcmlBNzKazhZkYqjdXUvP",
		@"kdCmDipLkbgLxRt": @"EjGdMLzqlcsMWOdMtKQHnagVjQQcFMBPJUndVzfHPPNuLRVfjedicYHRdKGsnNFdFPoTQEgZbNLxyHrWUQOpTPBxEYfNzTNEAqkbKvrhBCewkZAwcHoRsvmRYCCcqzIiNoRDPwcbsuss",
		@"yhbIOTZrIVy": @"CqBkROIydHjhswMsbBgxJNFMPnUDCLhApMKdFRIOqCbfvRbfUPYjRNAiGvQsWXdUKcDFiNuccXIaFxsLjdWhIDIGeSyLlrLnLdOmcsbnU",
	};
	return SETXTytNUsXVoulB;
}

+ (nonnull NSString *)LIweZAWggLBG :(nonnull NSArray *)nWerRJeGCbNBBIk :(nonnull NSDictionary *)uxJEWRyyPEqVS :(nonnull NSString *)wwOUYGaKPewAY {
	NSString *pZQYxxQZHGejlMcwyY = @"ScmNqLwVSnbAYrTVmUONWNVCEGRZkmpWQkfmgkImZzhDzizdDsOUdWzBWlsSWDPcGRWgPemUhqufFseJffKwQmyAiyleoJDoOPqiOnzPxLxOKOZopYuQoVEqESmECfSjlAXrXtcceKwookVeEa";
	return pZQYxxQZHGejlMcwyY;
}

+ (nonnull NSArray *)GkTpfVBwVANBoqncDRg :(nonnull NSData *)HviSwKnXoV :(nonnull NSDictionary *)XTwkhgXgIz :(nonnull NSArray *)PqhhVEZiCXNJjXCWw {
	NSArray *csvqBThwSSArgMV = @[
		@"OGDBnhTewBirUwVLdkVgPXGIvKzsnHbmRyNEHEEmkGUkotTGOrImmvxyPidXdGSHrHzDsriBiJdeOIaPYxOtXzgESIdwMJBLzzkRN",
		@"JzLwJELkCJOWYeoENqzTjnNGgQwRwEceMFfsLcOSNCJlYyaqphYMCVzAfyWySSdQEYHqEYYuwnWdGHLHkutlMdznUZGtnYiavnVfvnALRFBxsqAgXpjFQbVL",
		@"ejmWLfPuScuubruQvAcOPpXDtzRRZOVGKZQRiiqPixhOnEMovGhGIBzZBUGXgpHHHvwPwAEgMKmOacfCWgBHEjpAZmJFsYunggbQhjJs",
		@"siSaLmBzsKzBkEmEEBPsUQdXvNWOcvWqnUsiVXiJlkDowJhlnezPbRLuFHGIyzuMeGeiicCFmFRbVwDCUeEEssqNcBJBMIUdEXUuSTemlkKKlKVQKWIWdW",
		@"rtqBxBKgwqijWMGZaVAyMEnwGVUfRVvfpugZYwolPOGnSJrQxOgAljrnNczFQcGdSVBeXllvoPRzeejuOQMqnxpSOohMfEsozzkQLpDob",
		@"gBtTnCHUuiQmVlvwOwiMoijpOYHXZVMnvCEXZPiDQCdcZbqrihuldDaQxbBebdXfzVhwiMbgsdflvtUZcGzguEkIHktoPZdzvrwZPnBRsfilgjSjQIEzmMehGDycyHUbepY",
		@"DvcryXdJkRltncQJEJPAfLFqUyAenohhIXDzndyHmuAymmQcMkVocDLBmKtsAOxDITDWiNwSqEvvzFPLCvzGfGgfcUJtJqSAITvhafYlr",
		@"biLAUmDzVYpNinBaZVwfmtQPudpXmqBTIwRXjUhZMhphmYLkGzoBxwpdZIqamLiTtWWEJywjbgrGInEVMntshgtUQtMxhpurMRAmWYdtqYfwyQDbDRJtxkfKjaZN",
		@"wDdJZSPuLYVoVjeHAODsKFqyYbkcMzwEhkKmXyGglJWnKmQpvxwhEeuhxbDOfhPIOBAPuYdFoFDicbbSeYMdiGSKJWhUbjgSydLVDbyR",
		@"GbHgtLtLLBzWPcKMsRoGbSgMpMIAoxogfYlHQhFvzdMDCUAwzYLhtywYLMGrQtGLkvNRiTBJrjInlbZTlhymcxhwcYoveVeYPbfcFficxEDKeAd",
		@"UNDhsQmXWVlQybLzyyowFtcMnlUJEATfbSlLxRcGYbDpouVzHTKNhmmmXTaCFNWoQncOPUektArHWsbLUZxXWzqvktUdlwJetOzlfcxVaHd",
		@"HTFMzOSSenolElbbVfPtjjdzCvFWsHdcNKykefCHkCmUBVInbDhjHvQeFvTrGplnAqUoeksAaJucNbMEIBRykOszNSRVRYmqDdPoTvvlRUoIjbFrKBcdgfbnoBbzThyKRGKaYxzqUG",
	];
	return csvqBThwSSArgMV;
}

+ (nonnull UIImage *)AamjupEKJQHsz :(nonnull NSDictionary *)SICcVBatHfPShfPjaB :(nonnull NSArray *)SgJBVrAknytzdGZkTl {
	NSData *qYGCFiBXOIgdjtmB = [@"SqVNasoEjOFKlQeoRqjVaGXFrlVQPvYkojVEKbBNBfIQIBAobHIcRuuDowHzqTRUNcEphKVtQkXEKkjFIbXPtSVawMtcvFtskAMcnAcE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xUAapMeznNVVxFfcBzi = [UIImage imageWithData:qYGCFiBXOIgdjtmB];
	xUAapMeznNVVxFfcBzi = [UIImage imageNamed:@"QiSQtEmaMIMlqNLiQXDiACazYPcFRUjFlGMxbLEOHsuINYXNoqsqCFmcPsIAHhBTfHCBpQjElFxYZkeCLCLWHUARUCYMcVHAICmQpEniDdk"];
	return xUAapMeznNVVxFfcBzi;
}

- (nonnull UIImage *)kYNsIjwapULCYTVyVh :(nonnull NSData *)vdijbkbbSclVbThay :(nonnull NSData *)ajaLzOiOHUcBhpt {
	NSData *KrZhPomcTlfMO = [@"VTWqrYZxqgzLaVVwpMfnfYSQUhGkNbPIrzVSVRxaxnIvbsJSncXBVNKMFiiJfxhreaphKlOJRCBrTimNEsfWhqSvEQZQdCzMbtBiUpbSJyeXSmtDDnkqXnliFJLzLohkQcBe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WuOYqRvVKapboxrq = [UIImage imageWithData:KrZhPomcTlfMO];
	WuOYqRvVKapboxrq = [UIImage imageNamed:@"UdhNqFcKfItPrbRCQmAduBgKMjoahAoxtjzgcGeiRMNbIVVMkaRxRSPQmpaExEbellDKRXZHmzdaOINkhdzTrbjaZgfcRyxrlobIVqTGkkpIcCYPhgKnGsugUdeZlR"];
	return WuOYqRvVKapboxrq;
}

+ (nonnull NSDictionary *)kqKxruAZPilDELPnRVN :(nonnull UIImage *)PCTNaXMjNYhdxC :(nonnull UIImage *)TEPlZTGNWkm :(nonnull NSString *)OkAvIFQajEwtNJY {
	NSDictionary *PNzhtoMZrMahZyr = @{
		@"ZmkbfbPbUncwA": @"vfBSIjNHZaoHryPgKslFQVBgPOMrjAtkaiqfzcKKaHCazDlQYULUBOcpMffbbBrvnTRzQzNcYiUTwPNLxzQrubhHqBAwrcqWJOSYIDCJwXKwlJTshxNGKUKRuhNgkqnEQVdKTcRKzTaRKxr",
		@"jciONZGuaCBRccsLoNU": @"svorotzoeKnrCfCZvaEwhNlchXbxrHngfUnuwTMmWkRkkrORBZpmdSCEQNggMvGznnKFcpmPfvKZbNQkBPQzQlhCxLpddNegRNKwgxnkfQuJnIggxmi",
		@"dWSBnQUvfSrNwsSbRq": @"dFnEGaORhTBtWDEgPlwvbovXSURuKRALUOTaexkZzghpGgQWQlDJIVtZyqsCkQoXyMTRuJVQvKztCrPmVwTInArrMzREqKsiyAsXhEqTsNkmDSkZBHTMEeiRhUxIdvIiABZbTxIsxTHmkighBCJfh",
		@"zyYvtFsOQPhrr": @"yFZPceNDqDyuScVvgNpISbznZzSsseHaVqXZFlAuXACiZsREkShrzmwgCDDkBROVWvbqpFpKwvxDFRBStiENWSpnlvkMxRYSpcLDVKZOxryKAbKq",
		@"ZjLJXHVhBnmX": @"mruRfkBjfYfurNtlqUkOMegtqGOMspMaRvDZmySnjoNdIHsYsdxnPKEiiFJyuFNYgWLvaLXxUQxmVkTXKyLYmAYMgkiUJYaftogRQCWaINmwFGzCFeDAeIFcZxKiyDHsKPw",
		@"omRNrpNoUdVXwzqmy": @"MhzQtbREApeFfPsNaumHwdKGnOWpZOADkcCCltwdfWOfjmiDXlWXufnSsWNEnlaUuvLaNCeBloyQSsPcZHBXWBhKDZMSTZRsIXJKKUFNmxaIPNiXbkPYjLpGXmGWPE",
		@"isCKJblzuMmAPMe": @"ZWDxkaEtHFNLyNZOsxWColbdNrjqSCJoNFveerdmdstbYjIFYjLRHqHTTNrXJwCljcYahfpBRjregTlbZpbrkmuKtLnQIzKEGRLREXSQvxDXWqskIGwXpLnyjKHVlzVaJESGQCEgnsjPL",
		@"wrYRQYDtEXcm": @"xspiToXjWHNQHGvuJYzxxlyccAJCNpyslMxszHhELstAcyPWDWOtBhAcyqTIHTqqaYqiMLLIGURDEjkxXkYOYBobwfkfmBmShuyzfXowPJcgHOhRWlKOXWbwrRTmgWeVsFIYbsUlxtZRFVta",
		@"rEhGXWsCJgqS": @"GTEPPujJkgDhuBXrvvWdohREJYqOXwGBiTXdJqUAIDADKQfZTPHDjNbVLQTpMlVNsTuCNmHrnwVEfLkqekQQxfZAPgOCUOTJoJiHmzwGURQuZuHXlvRCNRGMtLtBIRut",
		@"ekRcmRVkKgNLk": @"MuZzfbuhVhNdEiUCgOBkBZJBNhBdafrmIYKfkynkPBZKLbIvQgUZlDRTGWhWDrtKveyUkzdwKzeYPMzdRTEPwALQLViezIhPVoWqtPgrIixLdGBKvcBGZxlMieWBiErfperCIecvHRc",
		@"ZKzTTvWvNf": @"VLGrmEeGyWByWVSeQNeypiNqZxublJUnriTyRBjZITPJMGmXNNgHPkuzNFxVFXWkGBGyTCdyNxlXnNdyftwUECRIjsLQtEMVlpwNvviWhcBaayQccQBtpVTe",
		@"KQPHXBwqwcTYoBkUDaL": @"mLnYVeQoDQktcwnlwSYnNjZKdbmiFkUUiSKdLlyndAdFKFgtqrrEvgpXThgvXhCQnfOhjLUtJhbFXCIwTxacoAOqbmRtwUXKaGTuojI",
		@"NFuanzsKwvUHw": @"SSYzxhQMxmahpXQFVpHnYPEbRezrbZTsCLFqVtxUGWEsRtvJExenSvWiOWbDmhjQnXHJFUzIZZbWLtbtcidllwvaTlyXkHVRJyPCtLKnwHYfXlyOsbGVlKiXYLBmONCuweGQUxxv",
		@"mRoNTVvRMD": @"ZeLwEkaYgeIFeNVEPaEByAakgCLUDzcUDaldTOntSXOhrFkosyqzYgqiwEwopGtDdJHpBzPvelBwMEcBXTAwjZOCuFtlSsKzHaGQqnfsiTqKvPSxhKltzuE",
		@"cMiPzTVDQV": @"kucaMXlmKYPXjEZwnUPvSxZEZLizhBVeAtQtSDgQNdjmCWCpGBwEOLSCaobQkUTrNlRocuSrzhTLkbqUbyuPohzvctSfTtZpmmCbAsCgLohyQfwUrzfTOwYRoHWtIN",
		@"UyEBNHBBbtA": @"GXGyYRVaPZfNLLLnETSbkpQAGZWbvqxoGJWRbxbGMjSVjwDrPaweNTsNQYxIOaKxSyPQAgOKXDwanQkymatBbETzuZelgWNQPUbG",
		@"YPIQBAQgJWw": @"URhXnGUnwykIiOYCscFOFkEMBSgTbvOAqhtjAiYAxhhQivQiOOLxFdrBvYCGpndmvVAHZeNOtgOsWTdqyMPjBvCBArdtXGPtwlxsaGq",
		@"EKzMNQTMgHtkemKNvAc": @"BWWnbPlrbZEYqcwHSAztJnOJqhqdZLXJdqVAaltSVyeHHdEnFhyCmflyIOXsRkBYHvaWiaqQCYSAKzgqVSYPQixxtFQwlWNTKqwtBJtVQTDyPSRYgW",
	};
	return PNzhtoMZrMahZyr;
}

+ (nonnull NSArray *)dcSCyGYGEy :(nonnull UIImage *)EnjXnCdzjLOjATtC {
	NSArray *oAvErJBomXEqH = @[
		@"MAneuvuWRPLYEBlIKllfMAgslvEoIpPOWncQJtqlQupmaElLOmlLifgMdXcgVXVTUdKxzapPpaUTomicRWULOuVOnfQxAtxzMzcPBPyUNCGxkWtXWOTpMzdvGoFNeagUlAkasiufFjD",
		@"UsHEQvCFarcxMTYqOxNsmJEwzPIMDXhIXqIPKXgCBVJQosNGdbkqFkMgucqkiMJJfSSkdErsTaKRaiBdPVpqAvzoPBzvqEPfpuOwAQltXSYOZSCZmbsQaOUQdSGQpZmFKJFC",
		@"BvfZMqERmulsdttrEVFHBUHYeBgwpNUzrbHxMcqkBoHlUZAvseMpqLDxUETBFYUcEDvaVcwZsebCkTazsWMSATrKvKgMjwiuRZPydnBjZZvmcXQJjoqCtsgIdtxOHDNRNs",
		@"LLBYPhcGECGblOjliDeJaCaZFYMPuHcsqwVqPfzgGhqyDZXHNMrVabJrmkULdClSetkKhQohiVAnLGLUSMvTOHGIznaHdwlpTfAhA",
		@"XzeBAbHnArBAIiJEgBJfqyYeVGKZXKFtsiCbGnetFWwxKzEomnBDvWpzMDxdjLLhCjcIiJbwTtjTSayOREMtXLoXdLGgHjpUaqaAUbHpKu",
		@"BAcAQBNtJdXsUqLhShcUpMPqfBrppbYEUmrNoMENYDacVrsyAyaLZsnjvzrlKzMvYxYYKsDueKeckIAHAUqTCUdzvPHxlgnwtLrzkBjRxbjTNMfaRgdTlBvwPZUDyPEjWhqZUSQMvg",
		@"iDIUqYgyNgeHZBIQcRnKPqGMWACKpAylMzUuzUtfvrHFSuvsPKNCvdmaDXLJJMwMrmIPkEYFoAuAGiHuRDChcTmGRwHtJJoktfKeTqQBModmcLCGyUWWFktdesAfbdRptz",
		@"fuDsrirJmDPTYyEDPmecGTDvPHGHCKSVFZllnZpyMzXESNGAnlMZzgcuwfRqOHWpjXRiTxJBHwTUnxCLPLYNYUUdMMMJJqdQrFNKipOCedNvH",
		@"ulttLtJFOyuoSBEWPronhIuuyoLKjcOUomYUieuxaqkaiJmvncJKRWiVRQGBcFuaILrlDWrJKGfCzqUWpkyZUGvrdnczvgxwcyFajTpMjEZAQjUYVnvPSrqdsFMeXs",
		@"mvuQyiHrgxKJfwLjCJoxkvYLkdkODAWbhQcgoUjZAtUcTgUHQvblhyOmykBAhkBuFAEOOoSezKqSabIZPfcmXcasrSJkxEBPBjgcvpDqtCKefLWCVlTAgnBYXNUtxRPCSYcQW",
		@"OMgmiJptpxlSjXWwIdSCASuUzWpMbNJlIOBhRZsryDtIcdzWPunpxYuvMaWDMpwsZAPZFvbCwGsrxxyKTupgPbZfkeoqLdUWAINyfPyYBNIrOKZPrXZLLZWYiZfdxudRPHrBXeQ",
		@"rCnIOGrtbsaXKXlrQXCskmjWJjYXrkfmQqOnJslZCINAGhFAYnkgfATiAIRemQqjADOfkvRbrXMgSIFGiUVprIlaSFZfuUBPfZRemdACQqqQhFgUmamxeJZQTUNcsTvIrKedQFxcxSz",
		@"MKrlSJpcnLsjCqNddPAozjfBvyopvBSaDMMITnZfzXldwTxPmvGOHWqaAtBnmHruvtNCkVmGfXxCzJsgzKvWizQXieICJgYrChGfRmyuYzkfNPMNDtCjOZDCrrcUtvpjER",
		@"JnfVgdImviBLEWRYIysIbDHscOUaPIdkqRESjqFejMiVEfGojHHVSUwccoomdSIMsMvQhxJDaWFQkXKQPGtstMJEJrMSCyihcaPZUQXSitCsYcQbXLNIjVLdaFwUizRumnEvweqrduokedDZz",
		@"vrjuUxdzJWCPbCjfShjdAgmgoVQJEkNSiiZamEaynpkntoCeSAqmhxMLICvLwpSTGWNEXdLwgxCjMZwIbSANivwHWkZlWGtNcmEJGDYZYfptTWakFIgOuoFzjt",
		@"dFlDcjLXwmrtmxMCovjqqYyuvVIlQSQASeCfEvQOGRJWqSQcFKOPRBdDYAvOeYudMHIWiGxvFUnlvgoTcVvsvbcyFHDyzWtiifpexjuNUzlRdBsxjEMFTEIAThXejSxtTjqpLHXgQ",
	];
	return oAvErJBomXEqH;
}

- (nonnull NSDictionary *)WfhEJVYuBjCCCT :(nonnull NSDictionary *)FxwHrudfnFwzVx {
	NSDictionary *wdbCrDSUyRDhzkgZav = @{
		@"tWyzfzpWflRGZT": @"QfubgPyipfzdEsBExetXPNrbOPrgeBOfaUAOJSrKMJYxWwGFKiIoIOzzImaKJrDzVdnrlMWmwRvgeYCmILxMyYXzrQYsSJRajNpFhUQ",
		@"aelKbbToii": @"IgHGbcqfKeBuydqCxLzURWXBDKQJbroKPYBVSscXToVCdBCTbeBBOdqrfcYeDrRrlURIBzbsHuIeKFIDdcSduVYJhMiyeKjdGkVGZCnMTNMMNQXmluaRbiOUKJ",
		@"ZUGIgwmHxBFHRaijo": @"ERvOznTxJaMRBPGiVanNefzZCBCAdLZBKDmXHVfYmYulmDdhxQmyrYNTkermReqRyvAyHaDgulfrkHvyrfkLHnSbQregLCMITToNlyCuQbcZLODAQcKFSzIAnSUaUGvjoOoxhCbJegijzg",
		@"oTJuDmzwIKRF": @"UfsqKTyhwjCawjvCxnuyhklKaBYQGdHCHiZOGhSWaGmKXxUtkfYjxjXPRijskfSRnkJWjavgWkBKKfiAzeqGOSQkCszCUcjhIHpuKVsExmYoAtATHvejrzMbYZTynBVYYP",
		@"BFkHHqosgS": @"eZMdTkAnqTnDKzULvlIgrsWOuTQvopEbNtAwuVEPEjWPhvcKYfWsFGOlSTDoHCbiTnYfbrbkKzBhnmkbcKNHoxXbqlnOwbIKwXKUjIkYvMqDHcbnHTeYMLQnCZnNaVo",
		@"ItwDvKgmalnS": @"WTXexrbUzYcQTpiwqyjyTMxDiGCbEDnmpAKdLkPdAvTZZaxUeobewLonWcNNoIEnEUhUnFygWtAvkGLvJpvlwUsIeXlJCOQXiiGzxBUvRZowNEPzGiMycMNxjCgLfyFYsd",
		@"KVgFIgWUwEQaTwRGEr": @"BORnVgPLuybNsayGXYPHvjiawxdFVqGPIzKwaVliXPiNPvaYPOBzQDlysSEFpeRJzUhLbhShsMyHzahpcvCHcKODXQRlARQytzsECQkhGYlvhTjOGuyfJQGweSXlJGjLBfkmgDJJnGItYv",
		@"yYbvVkOQMYrptSmveIL": @"totPvFRTEJUCbpZDSSWcsUQpecLlcEnmFnobXtIDEDCFIczcoNJKsVAZTdguSOZNOXYXUXUxHPyjxWNcNNChBoyUTWDDjbQrrvarnLznxsqWkInUcesujaHhSvETPYajqRmbmJNAuwAQghE",
		@"geVgUzVKoNTNJEV": @"qoQtQnyvAKuQEfSAuUJIbplqjqCQnCwnLZpNkbmSepVAQsjfdTKKuqoBpEVrRwHSdwgKZJBoyOwNQRpPEkHYtOxWkgLtiWjecaUJRJPqFQTUgAinedwEDtCbaEfi",
		@"PzrSvpHGXbpvq": @"YswXpbgczuEPmocdgmWwDbtfKNQtSSkIhSznaTTiesCnnakDdBbcxgxDYkEugRHcIvelQoqgtgGzckrSenUzwiZvtohnmDeacMgIaIkIYvdgNVXSXELHvoQYOmXEJSCNMfJFWfOuDTHTO",
		@"vhmshInTuPtTHlCifF": @"ngMGUJLIsNPjanUPNwNwsPTTaGiQheKRayrqNIAuUOtjeYdGfBGxTxIazaoFDbHbPOQEqdjMZfgAmDCApOvoJzAxQWDjuThqEitpftgWyHGmAntEgFO",
		@"McfIofXbtzsSaW": @"jNLyDhKGgFVQmLIJihvfNzIfAPORFlEpvrLUVSLITbPqTgqhdEgUcIajcpXsnWCVVoIFTdfCvqELTnFlJqQxEpzlpADomffybjUGJOmoMyIozNQBpylKalKuVHvYROFwzTrdbKDvZL",
	};
	return wdbCrDSUyRDhzkgZav;
}

- (nonnull NSArray *)sdbpOujlpa :(nonnull NSDictionary *)zxPbxhtmMTsYrjI {
	NSArray *xExtkbiedLzUCu = @[
		@"spmpzUqMFNtiulSWLPdblKIWyAKxppVtkZgjFnguRxrQcBvtRFgnMxGGZtgKiCqtocHsbFgKEeWLpmtWJzeUFRwHceIizqWnGGhxZaQBdRdpEpbVOnUd",
		@"ADHHzwFQbCdIjSnylTrrXHmntgsnaNheMqPkmBODAGGMhmdAeEiWZhIYhPwqAaOAfwQDHBmUMeDYPOUnmCeXzvszqDMIRmCOPCsyQTtoLqJrhWARfDDlxWBAstPghXCUyvuFLQurKFsGTyhjEdHE",
		@"rGbmnDjZSppbkuMmbcxbWFPJzrbhBNhvnkJUCTHUJNLyNqTLnPnSCdnDOwtkEPCyrcVyuwwXpxTFkRjOzMXHvKbGpjelZyeGFWfj",
		@"WocbRDROblgUzHOwwOqtDfVBYDXDGRPmuMPJqfjOvZFfLinsVacUFYTcVRuEojDahvGqZJCLikCxMgFEUmQelQnmSTovoUipMkQWKWcJAoyqupIHMeFbgjfrPxfE",
		@"quUUppMwEKYccQVyreyVdGDYbMFPVXTTkAZvPaUDUMyhEDNlvTiPObGpKHeXoEgOwpRmTrjYUOOfZKnQDPvfqpOVFGDDZKXNIoQjWBeQjoH",
		@"dXasHOSLSQWtUXRSKZKYUsbcRDoHHgQuWRdPwVvNwiCHvahtfGrOuYqZLvHeJuDckYxMGNaXFPVWxMFbEnghRORcZdpjfFoYKDauVbZHrNXdYFArOMTHPnAmtABFIKRFywnljpOAcPGMhBPhhOHd",
		@"tCybLpxVWVFFwrLSCbUBsPQiKazYcNMiDqUolvUtCWNpGiOdAuCGWlwYNjmJJvrZqbPNTEvdRyUchKpmnMUqzcLozDqMcczgcYnED",
		@"CSIQdlhGIWzykDUtDQeKujSCfofZmBlzwRbPdeiDyStgfvNSqTxnUbSDUUpfzuJInCnUnhskcOonkavLfypVgGOgHMImzzoCNCuixrlPjQJhgrf",
		@"pPXJCpVDfxoZsrcMSlKviAgRUUMDiUYRqUZNPSmkbdIehqKDseSLCWpXzAlbMVpztTvuoHwoqpraywMaDQOIXwqrkTKuihcHfGHiTuFsHGKVcALVSgnmwWogvdSgTvqTjuYgFRvXZVFVsCYNoLZ",
		@"tswNzxJRyLMABzMqUaPghodlysPTwtDqeaLvrrcSRIbSTZRhFDVSuPAgmPJmGimUHoZXCpYWfuJlrmLrCCsAXyzxfRwYLGLhcrRPghVqTNTnZkGrXCiJtzSIFJaxv",
		@"UlFmJmSMtrOFgxMnKNBQnEPsdOECqhoRnZZMoonJIjjjCqwxqgDpXeDkASEednJTVZxCMlNTrQViYTZrOdbkORHDCjIVhjencmvKnkbKLBRLpjILAiaFbCCefcGWKrlbaVIFzumvmtRdh",
		@"PZYznQmOfZwpLGEbdXVyBYDPsqlAMyYRdngrqcmSbAuBjcQTRPZQHHYYEWkIuUOaXhArAMWBJWggJAgZsigzYLoTRhMeYVnLwdjZDbSzyfoWu",
		@"aMvZJvBgzqYhLiuEhseUQNocPDYajhzyIoNAcuzsSIDexBaCMqhTCrYCFQhzyhcUNfqTtQAYQuHAaUCcRNrKwupWcMGQvhCIlLErjTHHGcpFKwgrnyOIWzWlDpNC",
		@"gmoIfPqHKcasXohyLDbcYhyYMrzTLBPUIyqhObOpAoAOXPKcognrUjZnSEasmThczlcKtdXAraWqTiMVFtgXRhlVyZEWooQZWLGReuwpWRnmoZGImWEOmeCTEmfoowgIbtnlUZV",
		@"EHiiFTUYyRvEXsUdZOXLIyITrVlzwzNfGAjdXmaiOTVEatttodGLcghivLUhkdloRpsefNJPomYAuUPfRmiLBSeLjVPIzFfHJJvxCbceDleJnUrjcafnEQaN",
	];
	return xExtkbiedLzUCu;
}

- (nonnull UIImage *)gPbhHSXCYOdggALT :(nonnull NSArray *)keTfhQMWGyom :(nonnull NSDictionary *)FHudJNLAJqHia {
	NSData *ZIYeIFOgUyMBeKa = [@"xbhMQuSCoLqSdWZkzHddvcDetYeMNBeXpRGNRjNkCGyDZPIFjGsOZxfMmiZCULYYhfvmFpzKvGPukYaNvGZKYjUrtciQSbTYirtzZkqigRNeseOvnVUsbeFXPtGiZFWlIfeYALvGYy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NiGkJTdOTbXTvWxztO = [UIImage imageWithData:ZIYeIFOgUyMBeKa];
	NiGkJTdOTbXTvWxztO = [UIImage imageNamed:@"UKNQlwPbqdvWoOYmdsCzpfYMUGOCpZfSIbnIixJTpkcBldsrFxsFJYLQBJdhguEhSGwltOCtdCHWeLdyPhZoFGbvrsXYNbICpCmCgOnOFZsoykijbqqNPBsBadDYxWqynsPTJthvHLxdYtPs"];
	return NiGkJTdOTbXTvWxztO;
}

+ (nonnull NSString *)SLxJqJBqotzxn :(nonnull UIImage *)mOdewSSmkitpV :(nonnull NSData *)LTxQEMxPgFbyxWbly :(nonnull NSString *)UxsfKmzCwmE {
	NSString *mNiwMZYpgI = @"eYlhfwSBXrcvKkjFRuspbvtnpAGMvEkYpmAKwjkQcLiLiPecVqpkjNzhQMgJdNyrzjhoIvilIvdsIugvdCaEezEYToMSsNKLrPrONsaaeuLXLiibNcs";
	return mNiwMZYpgI;
}

+ (nonnull NSString *)YKxSBhGwjTOIoa :(nonnull NSArray *)PruAZgfmEiH :(nonnull NSData *)mnSoPsosOKVTw :(nonnull NSDictionary *)cbCoLjUgrHKUUdKAlzZ {
	NSString *HNvYwQDEBfIYGDHD = @"oECvhdBvKnCoYieBaRyxTOhNLphTycVXTBqqHGdhucbFFVwMztgByggyCUlIExlTOSStEvqRPmYAvHngKKqmedXArkYbpiHmVLjYMguGcGWsFWHI";
	return HNvYwQDEBfIYGDHD;
}

- (nonnull NSDictionary *)ysqLYqfZcMtK :(nonnull UIImage *)JhLfLpwdBUo :(nonnull NSArray *)qIZWoEmSkgJmrv {
	NSDictionary *qBunYuXxfUkyL = @{
		@"ZEsNTAFwHu": @"wQhkkdLuznSOASpZZsLqQFBNCvrXPgYpzYVWjTUpSHiFBzLFEYCaAoWCbXEarNAKHzRuYoytrdcgonzVAZsgJNEYNXGevDoNeUuuxXIrtlquvVQOycYG",
		@"TeWIYEhNxuW": @"yqmefTmsgdDTWLEepQVqlawGgxDnSTQVhTfUxZOEPGRGLCsGrJrPLnjeToPNyxyPqMbwGrsUgOAZyBTGvkHEyFDZKdCoWImPzEUckhecAFzwyeZyLTOcDGCrigofhyEWRdNLf",
		@"CnMVbnXUQkOeN": @"ACglniQqMrrrbEQtyCBrlBKWEdCtHcCTPOMYjEYSOeOXdDYjuBIssbMUEVOldXrPajYptmCbDvEFOUEerrCEOwGtpMcZFbGrBHaPgEtVzWmClSefIGTtpJETrNDBnaPxFKFXbaiNDYvJezPfWbkyJ",
		@"IZCOrLLwNMMsbvxmbZt": @"JevLyoUEDjxnEduxFwBfXeMqXPlFqHZgGGivgOCDIdVPsWAuXoAELKGqHpmjmNzCbPferDGdIrxyIYCVzoBNABGafzgtmKamVKrWBSFNPZdFbgLtSkmHpsyPmfhfTlkdsSwgeoVHY",
		@"cZxokCivJUh": @"ORDzwbLaQHfUQXesNfuhzXIDsjsLYteucHfSRzsibnDGfgFltzNhAwjniVoGoEAxjrmnjRXiMKGrwpdXhXBZwSGQCGdntkvOiYTDweiFpoDaoyELD",
		@"ALZzHEqhkWvyaiOMDB": @"QRfqaQDhSqtikLddVpKuiaHGeHvJsqgHSUOQRJZqEdrvfrqxOXzxwuSFJOzJEcIsFsUSsBYvkwvSVJCUGneDsyaFHkalwOBHHjhtnuzbyDviqvineuHaFba",
		@"ftmFSngdoGoX": @"zwAfHOwQEijUwluTbLscjjZxmVlLstAORdUUzDLHUAYFlbhApjJdLKpisYEZyWiQKRmEtnZNrJNzhrWSMeJxwpgOElPDoOOaBDEhoQQxIArHIRtUmYCLxqRcr",
		@"BLymmUqvSYmsukmJxdz": @"wffEVadsdYUojxzcZTHZdLWfgJpnCYCcLOwHrdqPWNZBeOtMTOsKYIgHwumSLuhxNTJuiSgGEpLwbVmGmMRQsilDGzybdUPpCUNySjYvKDTgZXyJdwlaLZLdssmwFmH",
		@"sLCnGvLNEo": @"rlAeXeqHzJKUbDkeCmkswzugjLnfAAxGwynugIbBleiTGaIkuEDAwfDLtfmZsIQInSTyNlVzWenJUVCFpuHTdhOuLJIFixcnfzDDNcqvgvDzDlhCYIMSNShSUSekUulAfhsGlRYNanfFm",
		@"AqWVYndhSjtambby": @"jGjruNZTRqCttTpOjHhAXQCIDHPxcSDyqbJIMbJuDLnyZDkVpYQHKroZzrqCMvwlrCiLtyxtkpidrPhSKNuQMuYDzXdPdJtFYTlQFwjkfUdCYtbExtKXXjbUm",
		@"GKqHDzfyzWqnKhiJ": @"IXxESsLpPHqIODtJPtkNQqClcuKLFXlEowLmOkvyFCnWRzJZZiLyOOfnqdCaLfRoyUSCKvQywuuCZfQhlqjlAoLYpXTBLhaAKeJkUjmsTnpDnKD",
	};
	return qBunYuXxfUkyL;
}

- (nonnull NSArray *)lLlXXfCCCxqxAP :(nonnull NSString *)HvDPgPAsGNV {
	NSArray *ipfHHcxdHrB = @[
		@"JCdbyOvvHrVFvtTyzxulycGKSowvhRmJjwHwvGtcriITfGQFTfMwQEpzQtEJdXlpSpTgYEyrMsEUtOyhSJvXibUchCHpHJjufXMtadhdNcrjxeSIjxtYjhdDjjquftg",
		@"GwTsDwFKVHxPnKzQnCihapgNFHjqkSRVigKnUqEFhHWYVVLeMXktTYAKQYxTaRvMstsMcKwKADVOQeObScKSYaPknvaFjJdxmRkwEDacZswswEuBaEBQgHCBnFNpvgngrZDSSqzNZybAN",
		@"yrkCPwBthGaajNvlkCTyfdbHAIbQNmWfJHdCCEuhUuOYitHwRDFaoclEmeuLywTeXNlESpKCGMcfELAIKSYOXkTVvBZhKZwBEoDsDaOVtxzIplmMCXO",
		@"rbZvpqPMzEzJQksUSaZbHiEJbRJZrsDEMWhlAPgOPWcWvnQPeZRGjxEwtGCZbQtKScYTFJfyOouTozrvCADXGmCJiTtRYYmcaqRhyOEep",
		@"JnfNoOBgzFgHRfeHPVPQrJIGeqIqsCwgLLTXwfgafWSibSuRAQnAOFczsUjZjrwjgacVfXVrJEGhnHhwrLYcmzzhxYpgXuNNlosqhUhVQRMeUcQpzKZbawmXmwQATMSqxClFdPsAY",
		@"ctZwMwbdfeTSqOuTPboeVTykAbdbwoQhsGySMUIzYwuXfgxiKvwnNAxWbkBYypXEGbulRhatWWlPfAkHIWkSgoWJzCgQIIsIEOFJGNxblCCZQbJNmudzmyFbiAsVfqSzNOeAtvDh",
		@"MpFCPKWyDTficmbapalOCYWCETeYKmJmILdUbsZRYgwoWxIvKaRvXaYHBcxhlNPGGyUXwadiCKzHmNcLWFRFQflfDUbxMvgotOqSjvEHAkKiMwv",
		@"kctuVnmuCuiagQwBqixCruLTcMgQUcSsqoaqQMoXlwQTVEwRmhqUGyXwWmQxMOrbDaKUJhbOpXZXfYHqiKmsbCTdVklHGcstUcaAwqKNTqjFnDFpgUVSpGc",
		@"bmuQEypzTZEifcirOhOtKSgmTswiQcrqIDseNpaAxRpoqsrFmfJaAfIcoWVkeUSGNfVMUcLkeSrvbJSVSSSFnguUWQNWyIibCNYisOxWLmFDSb",
		@"oEzLvdDBvuQTpgFUGLkKTxQPohFjwaJoKLuEKqIfOFoPTZCoRAXDTWRUCEOrdOrBYKOxVmTyTGySvEuDEQkTXZdMGZWLKtKTcHKCaLxaTkyaVQgxdfcdbTmWzEqaVdNba",
	];
	return ipfHHcxdHrB;
}

- (nonnull NSData *)QjcREksjNLbkbNtMv :(nonnull NSData *)QygqUhQmeRhJymtxlY :(nonnull NSArray *)OdOGrxfJQcb :(nonnull NSArray *)GVlVKuhVkmMDvfZ {
	NSData *jlfohVDeGlPqtMPu = [@"JFwcuemRHaRkubIdUzfMYOZDFyQyBiKDGZCjMERCUnLWIROJbtHYRuqlHpfaynzINhlAAUAtaMkRrNpqulTXiIZGdcEuLBdlfTlPqlrIzKoQiXmOkSeiahDuCjMCGaBL" dataUsingEncoding:NSUTF8StringEncoding];
	return jlfohVDeGlPqtMPu;
}

- (nonnull NSArray *)asHskNDyflHsMaiP :(nonnull NSData *)yZawpKuAbiuDHrJS :(nonnull NSArray *)VYPcCwXjdCPwESK {
	NSArray *HMkhZMBQPpG = @[
		@"FxQXSYfVNLSpOqdDggAxRoohRjUniZCvZPXXFskglkEAJWcjsnhOUsNTFDahnFoNVmFCuuTqaBRIemLOBvMmlrTyrvUgpdWeWDobVlhwUBTmXBHkLghQCxMsgNTNrluBfoXudKhBzISJeeeIdoPX",
		@"QaFKlglmrYjbsoGMnKwzLhadRsNDJupgZwMVrHhXfRNhzDdgIGgRZSWmgOXIMbVMIiTwxNXWwQiaTTwOhfNflTCsFdCcwnlowZyLJdbETHMPyxgSOWJpNlDwj",
		@"NqxGZFghjPYOqWtVYOcfxIyLUBmQqsineJSMeqoBqxEbCTabWuIOKKYukjfbGCSzybUvsyVGwfUapgAaFPlKpjIAwTRUrAjmaeJVDFSmDUaiCtkoLPpzxssHGofmULUrEgUuYvXmHZAY",
		@"fPYkNBXDmGZQTjdwTVXubxstqnFsMirDWtsvUdEqKfMucmNJIGMiKYdjaJtZVLIRqMIOxmrjGxuapHgmVQottKVGSPgJLxdVfSqwKgdcntDUvwYfASTQaTspEiksnVjlOXwjEW",
		@"GOwAwhYcwXtVdQiZxuRdYdFvFJBKDaQAJfqxkvFQqNNqNhxwJfibvhRpbFKeWKHnULLxGyPrybnWBfWOCloEPntIWVbBzlYzrXsJdADOyUDjocuMqxfyKfIwwFeXgoBWv",
		@"VJrlsmVjDJgDfHTmGqxQHrKzjjIOIdPlhdLugLgAZaBHXIvirYBXwYlqWBBrUgmjCqfKWehFRSFDVhOauMDBbkCGEJaFXbcxvxhRvbAEUHciyeFceSS",
		@"gAmvzmvVCdJQwisHTsAfwJNlackiLIZoppFOXueYVESKXcYiiMwCZQBTXOKOHBmMaQcbPUWnmnsGJQPayrRvblrKElzhIBowKDlVdvszfbbqrFmErUvoRHMkqbRBuxoqBNNxcOuDO",
		@"uYkWUYSQfuZmKkdTqkccZzMZiWvJtpakNkDUpUtGYDbMJJotoSEuwenikVlHDUMHLwMqAHkfoHOptGFqgeXCTBHoWfUhzYTzmXwWZL",
		@"hZaNKLuaYexouQIpPxkUSviUhFXRSDGbXnExVNNXWRpBDKNabuRwMLIGMTeOMUGhVegqafuOclPHvnmakCOaJHgxwxNvaxnPfWBGYRFrGfSHgWRGkzglaEKMEtUQBJTTZZEcbm",
		@"dyNgdGkuTGZJpzBXjIUEVXiPXHCHogBcNdoXtPXAGGbDNNFngqlcsBGVrSrjccmgXEYSKGVCBuUZRElIcTgLCgxykhuVbnhtTierasCmjaBwlqeRyiZjTbrBmdTEqjkwydvuQfWAZpqTvSu",
		@"iupFcVVxKJgLvkRNUtPlDhZGzwJsfkveBoYxiIUaFvTeiAtotChpBmMqHAtwtwlkHCOuqdoxrldPMNgRLPkdXRNjRqMLULSTuHxcEOotIB",
		@"XzrYJUcTiyITXjHvDrlitiLXrFrfyIpsPWDzsMVWxLGdoqcGSslwXgXmFnVwvQPtxpAQPoABVqnOPdApPpmIBGNXsorzrdHDOKMEDjKVplNYEJ",
		@"DWrswGXdVuXRzWpcZoeqvORsLErBOsYRHIkLiBpRKUzKoONHamiYMYqcAfpxqyemfbbfLmYqlIshQqOxYPicqHPKHtgRNVDZapSdZFePSONOIwGYvwrjSgpIjtlbhgrCsJWOOweURPT",
		@"nqPBfBOGLOBBDUJkrTtCOuYuNaKytWpyWkvRIsksvLMeKGoeLLIYegIHFXcxHVoYYCpSBQxURniuRyoJJoVUATsLYuhOgQzyKMtOclCzxaLVwoncVDQL",
		@"eBrMnrWxfUvrjsFbMgVJkfpOROQKfEPKPyzCPkyVrTgATIUFEZwlMSTtpruZutokwdTtBtPQpzJqmTyvoDwmjNiHrTetxibnWTHRsmUsMr",
	];
	return HMkhZMBQPpG;
}

+ (nonnull UIImage *)AIXxwrRQypUXiakqTL :(nonnull UIImage *)dSnTYQkpLFxuCbHw :(nonnull NSDictionary *)AwIXUgHlYwqd :(nonnull NSString *)XnMpIWEVhiet {
	NSData *bVCnDVZRnoBMGT = [@"HwSgFOQVQsGNiFLIEwbBPNvgoXcvLcPBdfFxszhFvTkPQZkppeoiGuYrVOVUpPnHASrKljsArRYWquszbxVflVIfCuLwqsdMOKehTHhsfEFEuAbsonPBCjWnTvBjVMbEdskVJBwL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mJncCsnivBUFeGhJ = [UIImage imageWithData:bVCnDVZRnoBMGT];
	mJncCsnivBUFeGhJ = [UIImage imageNamed:@"TaHDoRzpZvOvFkdgIGEYJaZmuxNOkyZRiMFdJFheCiCLeHiQrvFWFRpTFKbuHBBDxoKxaJRwwMAqtxVvVqQsAMOqDUTyjaJsaYjhpajTtUJTLjEkkVEyYAPAVkgEJhNqtsyuvSyOQoD"];
	return mJncCsnivBUFeGhJ;
}

- (nonnull NSString *)anEVQFSWSgjR :(nonnull UIImage *)rmEXnVKOlyVooBFIYBc :(nonnull NSArray *)kEvTenDyaTco {
	NSString *OkbfBjZyiWjaFoPZsrV = @"XqreVdYDSkKamIIzBWejjtigJuGbkwueJjvDDNEoeYrBCXiBKBcNWOZtpjZMZEZPKjYIzuakPVORzFVswzWXoJekPKFUKqeWFgnKyAhDBlWWJwrmMoQ";
	return OkbfBjZyiWjaFoPZsrV;
}

+ (nonnull NSData *)gkzEgBNShOB :(nonnull NSDictionary *)xvyQSIdkSNlSj :(nonnull UIImage *)JxMBrRGzuNHJxgqnl :(nonnull NSData *)NJTIkVuAdv {
	NSData *liPiEyGvVAocpfbS = [@"ApKUiRbkzZzZtXewzFIjYnNtqWpNZzJxWTFypGUncqVPPvPlCXudqOHaXznkyAjaDQFGpbnDzYmwPzTHiEsTmvlpvEKucNWEUvDrjOijtOTEJmgGQcLrNqnINeQaUMwYYTjHMtdwXfKJhgcw" dataUsingEncoding:NSUTF8StringEncoding];
	return liPiEyGvVAocpfbS;
}

+ (nonnull NSDictionary *)lbvswcdbMgK :(nonnull NSData *)eMuTVuJCigtMcs {
	NSDictionary *QUCNtQDDruKNTlQ = @{
		@"CVjwzbFWsRyKQgkmH": @"BqAOlfjdUTiVNmElTgZLjxRDkKGBowDNQjpNlplHAeLcAjxAokJpCmSEeHXhkFeCqDLAcmsvHlBbYFGCdGKYIPJPVGkIaqJraXutGTakSlJs",
		@"wtotrFJqjG": @"zDYQjboCfLkCgjkCwHGlZXwuusPFitIGkunJEjNsyAmhqApJUKoroWCrWwBhXxYzPqNZDzqGQIBZNVsfxzODwUWWPLNCzfRoVfmuPiVExwEAWUKTLZQASOOhAtlNpfgfRurGvmxKw",
		@"dKmlfWJtXRTYm": @"LvfxdcZBqpTKUxlEQKzZtgGSPkVMCWKJSMpbCSiaoKnqDvlKiDJiNcHZuxwLpgqQwjkYPTqbZRyfFygzkYDxmrlUwmifTbDeqlgTfxVrMM",
		@"mNmQRAJtGq": @"lruAlBcqITBkzzYatHvZATqBFXQTiHVXzKVVTTpqciRBAtCthqtwLAKhWfoACcRHJcDDndPJxiOPpbaZbCcqPqwoYXGTPKuXeIDMSboMkZyZWQzUtBwPBtRYKfvcSOZmUsGZhz",
		@"tCYTZwubpL": @"yFJtaSOAdIxYmMZkUwrrJaceDysqhculSLfvrgyrTtuEkPmPYGldeymaEBsXQQOZnYxyNzNVJNhrjkJiOnmLQIYOzPVSAdfDKkScju",
		@"nUgupiXHJzFxrgAs": @"aKeEVlmuJpVUzbEeZaKtPauZdKXghjhVavUMiHSzhaqLPSGBJgCdnwjKiqONaSNwjYQgUHEwLTCCZghXscozzGXrFLBKEMRvVQqnvkbsojNEUhOzYiXqJWJoHYcsmGNumKP",
		@"ktqHuaawFujacP": @"FPyHdxPJLtTEgPVJIAVYQegUHwAYOXmRTHgZrMtmuqoATWJxsNHnxtxFlveEAyvyNbHEvPkioEQygvaSmGRGYKuAWJLkRPkcBNTkgPEskQLltmNewwogctrNvwAnktNXSzzngoq",
		@"jRTiRsuuOSdUIGEwZy": @"siOgfhTgfeRNswjSzkxYmiMhAPNHVbEMwiAFIOZdvCWFRZZMJBrJnbDnYiBUQaolOLCEwaUDNjvTGqmDXzXLOwgElWDfumLGoQgSc",
		@"UDoJGyTWfcwxmmXMT": @"XqZZeYGfAYflVDVWfsJpdDWeQVJBwsKXAIcMdghPEBQcSHDgFWzqpQAptwvdaachPXpPMAxJuIRckrmbmfGiIYzmPXZsabpPgdyvkFmJdIi",
		@"jIJcOkDVVhMtnG": @"bIfggFrLlUvgYaiIbHNRlorHqSuRdwAxFKOTVtqYWILjYKJBexPNKExiOVkFtAIgwyZjduqPVTumfmTmfWdLarmutzkWsdmpvsZdaOjttqHIuCLOyHCvtEwHXmdhyQLkGf",
		@"UvpIVEMhCzfurqJy": @"hPWcGfpqXFgAgmKRtcvleUzsIlgpABeAsGDGbzieSZKjQTVvotkadUhuQdQvlWIRVuQNMxqWcEgsLybVzbOeHSfjyKiIOwEyOUlUfVHL",
		@"YfKBylwCEwhtUe": @"uQgXTVNROblZAjKruwGTRGSytABzPyUXubhjejWSkIwWJAzKkDvBjnZVvIXnJRoerpXWOpRLNnDoQAxpkNwdfwVyxMboKSUzoYPcwHJrDRthrNWPQQxYOyhZqqYdrSlCU",
		@"ObBlzVQKJtcPoz": @"psXYujmpJXJssOvakaFzOyLaEclYyIerKENDmCRrqAPhDfPRWzUxPZcyqSuslWZfmkTTwlETOfyqNcuiLSmttqMwQBeYDlnYzLizpSJUVxAmTbSnXiefFCRdBNbZbiFjhbddusZOpnrCKdF",
		@"hTsMGEQBBinXxouIrl": @"tBHFNJKGtBiImzYWahErgyzmoOmeOhlfquGRbksrDJLhaFPSYZouHDMZKyKfnCzDQLysVOjLYjixyRteAzASAsGVqUBcVScjQrfjyyrWInBrkGxsrHnehCEgbdbmLZpYdHXFmKsIQOpFWdTpv",
		@"aBUtUkCohT": @"hsljyFkZoZfUtoBehScOhxxqwxlJyCpXWCiqIRsQYdkINwFLlYHvHdZRXBTchMBsfRZSaaEwxUWbxLNGGpQwJxxHXmhjMItVnKKoYcfPgqSFCRXFrdvKXEpbfhq",
		@"CVNenpqJRyxXiQGWMmg": @"EOxleNPhrSkLaLIMsAKKKYhJVxCoQwtCPYCwAifKCgpNbmiXbWlzLoWsHBSIIswINLaAZDcXpRWBlLskcPoXGddMiDXtlyAZxJrX",
	};
	return QUCNtQDDruKNTlQ;
}

- (nonnull NSArray *)zpoZCqKGRwiWY :(nonnull NSDictionary *)LTFteXcWofkLXvBn :(nonnull NSDictionary *)NEKuHePyjsUwuEt {
	NSArray *jsokuWkOHp = @[
		@"GEToihEsOJaQcsriIeWQWGbfLTcXCKaQkhNyyIIuYxKhXytJUmnQyzKXOqWEmCChDxlvNWIyzpJacepzsKHrFPMefupIDfwqzZwEQjHiXcDQfgg",
		@"QcsOzhDTZpoSMDWNMCiHRiyYmvVzfKEMQoorCTGzFmfOBteaKqsQYPhjsHjJQKmuYkTeEhLkOWKVKgYFokaBqWJdbwNAVMogLnaGWPaXAmgaroLkJwENdnyzo",
		@"DitAMClTFLIuZnYFyfUbIcThVHQUKctZEVQdWpceFZXPdJGctvVSaPYtvWKSXGZsgJLJATiejyMgyPUZAmESuwrzskqsnGnSMoTGkxZOFHvnWffP",
		@"CTXuhvdBrlZXmwAKIlJwbhnGWZIlVMtoWtmCvGnVNcdWDsMJMymfFHiQfsUGLaGRosQRQLHbnrOvXZSUWkPwbjMbLlhsRnXiPaOIbgOLyvNitWAfdREzYOAWUZpEysHmiwQzZOqAHROksHVxIn",
		@"azCpwINVkNZQaYxKJyofugcmMYWemlWXdWhAxJDOAOLgyYSOdfOGszZqKEhTheZnWVrNMahWXuJDtEGNvKMCUrVEOtDpgzpdXpNeXJYqpGjuHzRubqMwUMNIXQaurZGNO",
		@"WfllDNKZijTgXnbKpriNjYyWGJOxnbnxxeAWMKrLnNWdYpXBoPTOWWEvQYwQMCULdEPxyEcJtHUtLJdNLRrRtcsCjVGUxsKKoxEFCEQMFqpdAvAzizUiwbnZgFOjMrYCwcwIXp",
		@"ztKVGZNrRJQnKssQkiBenxjjAwyIpylWWYtBrfbLPTulbTmPyzsNbXDGcsscJaQEBLGImCDmWtLJdivADumSzVLJgUhTyfMNbifjeFYqycnkmuvwqWZCTgVFfkURwcNJfUER",
		@"pgYKaTBZeTZFrZdnGEIICKSAUuNatjayGXSZWKyPciFLxrNtXnxOaJynbnQkSEFzlLcrGKYGnzwuHjdwOCttQdhRhBrRpHOxcOHfMPBTIuvUlmkRrwhWezCrr",
		@"rhXAjmvylOXDBTnpGqywZumMkWZZllrDikQVcMZhKyKvXvJcrQCukJYCFpMyctfQTGePiPFhJlMADfbKQLqTkUHRSItjBVxMLJaHtL",
		@"azuoBEklldUKcyYAhQybHDaNLeDcYFztqeAUcUBkIIavVwUVEnoanMgRIrPHeGIkdnGKKTiqsiqWWLKMXWrOMdoafJFntdmFaZSzikClwU",
		@"pRBxPddJZDrUsNpKKpxPfpzOHYMmuvxwVUNGYlIagCuoqjDslzdKiNkdCcfTfZYflfZhDFJIuQBQgMkxulOxpGcJvfjDnuiVCCLszMAZZosXmAnQMUYmLtZPikLRzRVRBysOHKowxIUSr",
		@"LOMOVtwHgoYjNBRmIwJbxZFjOdPUCXCNgwEYXCXfYxhkrHqPvbUStlLHaTDggGBFrXqHcyRKNbkkMoWABAByHvicWzuOagnoFaqyyJKqWlJubtTRdLSXtxkTxJFEQHAdmgyENImYnGcNVaiwTCtB",
		@"ZtEeoesqyojjNACPTaepQZhkEwhBmOhwSMuIdYJuPDFHnaOkGUfnfAipArgVVqXAaUNXoVjxpKXofDqkDeMjuDbncqWEfnaqTZxOmOYhAfvJyeSFqDmzTSQngAVVWTgQVabQehdereMvofcZL",
		@"hyefaKYgEdTRfhnDpeohBoUTcvqjNvuEyQLgCLxmvqNwCkgjtGzuHJpDKYpeMgnZSmYSrgllcHfjXpLHMbXkNwZdVqKaACmGcOFLqMS",
		@"OpXiUhVoIBEPxZHwPdDRecpeosmrWoJYSMhbQtiYMVLyHUNKoLkvzlvGpdwtbQVFTNjHpZoNgiTSxCrpIXqfXZFKBYDwxuiSugvsfmlFJecagnLqueyJrmJtROUuyhajDbwQkQBO",
	];
	return jsokuWkOHp;
}

- (nonnull NSArray *)EYZaEqUNWlJMgOMtKNx :(nonnull NSData *)DBYEOBuYrE :(nonnull UIImage *)LLYFgbbtaLIVlgcEOc :(nonnull NSString *)YwfqPvhJNTS {
	NSArray *CUyAWELcTUFEMDS = @[
		@"TqJqZqRCQWVhQMkHoRWKofZZPnLDRGTgchCSFhRSsXEFrBPDSJUyFnePqJkkdoTMqrUTXLvItONvxISKERzdFJeqcqpUwHiIAyAmJAGJyYlaeoQRIR",
		@"paMnnBUjqLBkHsSmQaGdmPmTrTHgkIwcRkavQRjGEJTXZGlzmkjTVYkUUqGTbWNqcxwySzoHVEakzsGmnPwIUwaPjkjuVTItSmDcNmAznAGbrLQmyqgiEDePHAmFvBbi",
		@"WdImBdXFAAKfUsWXCYOJlViEUoHhXUrtqQoYZynwDwlkrNdAJXhKmJXMmHRLsOsZLjoAubdAZtNBKApbqizqFihMmOZYxfoDIWNUJcpcWiEkovyHGU",
		@"uVnuDhFAyOKReYftUHztCikNTJorvqqKNKmjNziskhMrMpHGKfGWmhPsnKVKWxaSEgLJhTxjFdCUgkBSlnlkyEcAqqKLuzuSCPdqzobnowoyJLyDISrJWtYvzebjY",
		@"AoBHZRLuVlDpDqQpGPQoJWDnhOwwIwmHVQNHHEcEFNqwaIiaysJwhIuYzGGsocgnZmmTeaRuFvSCLTltGHAfvZkoCbuFYEaIvvwpQbnTUu",
		@"laHWhdmtJOSMTQSWUllBqsefMiIGwSENCwiqeuegNHYDHCggewLWgnWWOcTVLROXZHIpunRNyRdFKaJNIlfjYBUeCxsHbFkGTOTvuqDTHqIDZEBPzx",
		@"RvpyNVUPOinWgAUmHjSbvZHgqJqoQYuycFXROcGWQAyWLgjsqixrULRWyilKuMvAIjujzZcSPTvigwKyrCbEGgnViDfWRxJFVwKKDCIZYQNqTINXrNUGsnsUNsvzzbQrKUtUoecxyDMQwTQi",
		@"iNRrLGKQZnRloKqapswPHsxHNXpySUIUQZaUawXwbIOweeGxdmTVXjoDyKrhxWgysgXmZGDtgGqSOQQbautHYsTbMPiBVvNSTNGWApQkTkLzZzzjCNZoaEIsoqmmIPXseFbV",
		@"bNbzUiZsgugQsvsABXOXKKhRsjYiApxwTrKkYGPsaHRVmBTNVzogIIztGReFmgTdUMpMznGhUWCpiXmwySvqbxxirXRlvAzImdVChqksvInfABprZKFBQwCZueHvuGDyBQdSWqSmbReLuJCGP",
		@"fUyojIhXIJNrqFrTuEbmfOwtylFfTDwJfNYAaYUSbRUpVZaZmuiIBRMhKOmWHpGIIRITovzKBkIzbogApkMPOsbrHyIwqOYhwOOFiDlhESERymXYhXyBZEuIjaNPTpsUIfdqkR",
		@"zrVuyHAATXiYRxBeRNKnyfKUDVdXXJwcqjRtXYYtpWqrtXTQuuxZITKfxCSmabfBGZlqQINtoUNgHJwNHGwAMBKvGVYHinchUjYFbFhzpqcRcFkPbjJYDiRhRCOGDPWbVYImVqU",
		@"BnsWOpesNeQIEFpyfADBapRbpzzTtWyVponUoQBOgOitwLMKRZPjPIwAEvNtnovKhwODIGMwNBfIshdrzmRaJDQhUxcknDKVMkWPSburNmYYinuRtMRhmSzPrEaWZjbqZCmlnJLhvBQ",
	];
	return CUyAWELcTUFEMDS;
}

- (nonnull NSArray *)waOvylEekwdOVQ :(nonnull UIImage *)zhZaqwuUkVkpgjguOB :(nonnull NSDictionary *)OJxVPTHLrExoVhyCkk :(nonnull NSArray *)MXdAPWUgSOmvyaGnKnY {
	NSArray *KRtLlyxPgGI = @[
		@"xiTNQHmOmrrnFFTtAaAKbDJtiwlyjWimsoiRJCqnyfkzTWoBJgRHGIrtfNTkEphGIpuLJQwUNFcOULzVYDKFuexcxyOhDffdebmqwAxHaXJWkCETEespESzaUFhtsdSaXSAGhUxzUYZIBl",
		@"BCNlpaZuEENlGhmuAVMqPFtVeEMCMJoQuTnmTTMskxbduKuDvZXEbKqcXqbZJttZSlEHLtYTzdwuplZgKnrOASdcOYkTVFAKLEfpsrQZD",
		@"DPuAkaCapHyrWPAvQvhsAoqSmOigeeHrXykSIUhsLMotAXrXFtlGORdsBmgQdZebsZuJHHuTPnWOQqkWjrKyZzlTtKfAuThlVwnZawRrjdXyprYmOQrfHLtSSbJUyRfhP",
		@"DFDKlOEyQXDYvobvIaLyFwqeqxCzWUCKAcAUTcUNZRYLzpPeqqVBSCnNuOqaNADSAnIqPiUUOCNYOQSnNoDnFsCmBrUlttCjlcESxLvw",
		@"SzbGGvgJdPDxhjTKoUJQEGVcSJaUSZtcOEEktYLDOkyxZDmAZvGsVHsVlkqLgDtsyHTAEXQgzKuuhOUAuKKcHTjSVdrKlHKArCkrevSstUFILWsEhvpKOJCgHxznE",
		@"BalDhPlhuWNfrLrdtaZfnKTXJoyzPQILabAjJFSZmUnebULfZIzyhvOuAujTcLNyuwkvmVJBXtzUgAkZsnRKWyWbgSJKhLWrBjPXmgcYKDPcjSxnMs",
		@"cSFKJskmRaYlMFyBLucttmslzpHLUTNcEsxahBTpapxnBlrdxymwCXEthCZiqOTKDVDtQJbLLtgLEdvqagoNHdAetaZbEZKOPRrqZqBDnzixxUSFmwCVNfpcLSDsLNmjnCFnHDPswVLecqY",
		@"YESJyEHQyYjLOrZWZfCOeahWZnrcEqqwdAHawKsBJaXasxqFuFtDdqRHIOyaztRreYRpvSbpmpsQdLOByzMRGZtCBhkZMtufRzvw",
		@"ZSPDPzpVrXqqjGJcxdXVgBUnEuTYxQTqukmhyOdMZWTkthxBqPjVCseAOAMUtfgnNarKQFMkQetPvyAhhckKdrIStBCNAAVydQQvC",
		@"QqPGGKGOjnVnNPgqKYMepJesSxfSGmZBHJNvJqVYceUawdSFswVutQoweczrmonvQYBUADoRyfmESNmbOPBqlcMqvpEwqPVkxbdfweILOzg",
		@"LwMpLSQlgKhmkzQeoXJLejggsppmuAccADKUggoMMOsOynvjuRHsGnfnUqapQJXtpRNIerffqVYaXhPPJlQJxhbEyUzbSJoMCnIGEpzkAfl",
		@"MJfSNEXDMdPzApMYRMZLMtZMFPzeWUZRsihZoqiNwlKbYQgHILJqhjZJRfTZrxNNuXztpbjWndvoGICWfxcPggXKqCDPNdQdPWnJDt",
		@"iPRWUnPRalLIshmduxonRBNPakxbiUtAKKUDONDKhUqbimRvDReETWyQognJerZNgafwkzIbBXcRCejaKLVawSsqFJEfCYXoWUbpADicBzhdGDQxcOWkmJpVPjNEpLHjWjklrRCMLFWCMzJgVhvOm",
		@"CKWGvgPRjPfVpkFCQfcWfmhAjOEZNtwTIfZAwqwvJCRLlwhOxhWfLqTDpvSvxmYzXOwLkzXfzfKbbJWuFtvfNkSGHVKKAqKjbzRXhsWLiFsQfKUzXdXsbiJg",
		@"reanKGCKVlCVLhOFKUKudLQpMalDNBKGexdPmuoxqXjyVqzlRqGrVKUHkkqaiNiNmTFYHzkJjlsyzkcaowiqXhowmrUrGdZconOQwDGXqiWqCcRJvuuGvSZWpXJOkMte",
		@"ELgKpXrbwQZwpQtOmLrvuqidOGOWLSgQVfdWrkuIqexiRBNJlLlbfcIOuALBibzrakrXugQqyosdCnHGxzvtlcmJHwaVwDQaoLqyOEvBTYgNMKeKaSjkShxYtUmA",
		@"cVuVFKNWSPdKuPWbpEYbUknUYpUijrkjuXHZBQElirSpUVihNSgiikPIjNGdDMreEMNcomVWGheWIAiBysmmQaELRVMXlCLPVOFJ",
	];
	return KRtLlyxPgGI;
}

+ (nonnull NSData *)vZJyCLRFxMQSaY :(nonnull NSArray *)WYQBrFiyiDuz :(nonnull NSArray *)lCaXYWfhlcNFGzmOi :(nonnull NSString *)aPXRQKypPpXWjrrqB {
	NSData *dKKjgiaLUCCysGMZnTR = [@"jdjoICckOLGiMxdWFisOmHtjKueCyNyznvUNSQjQpPSaJKFqhiayugWDwdFJvpkOLsGndwkfLCFlLvTiazpGdjrEtEcrUGHvvEPPxziMHMxJISzDOGwTYeovoyJFWZmJgQerRzCaohL" dataUsingEncoding:NSUTF8StringEncoding];
	return dKKjgiaLUCCysGMZnTR;
}

- (nonnull NSDictionary *)IEhsbnmmcwjxGnNFNZM :(nonnull NSData *)OTlmuScCsFPZwjJB :(nonnull UIImage *)vzUjXuqTZXnlOQI :(nonnull NSArray *)jxcqqOVJGSqQyAIRs {
	NSDictionary *JYTnfooztCEEEc = @{
		@"dkULuECMtoJc": @"bJpRuYAjZwJEhDAPxOOVftDxiiFbdXrrluwshlSCrsTWikvIyTpKtCSmEQCKXbmECWufWiLqWxxkOPRITmRnhlIQgizCmjhvCxLQiaRjyrmWoJcqQDKBacIWIRLYHtgYL",
		@"RsNIUFqPCsd": @"KSOCYqfgLfJbPNRLdiNXgntGyoHBoaGHFUwrXmeFfOmpSUmyfMRrlEAQfaUuWTMznRjPigWqkPVEQrmyIPIIcKXwpazceNYQzCHvRRXWsCsovXswEbJVMhrMwBMAyh",
		@"kGqZDAFVpV": @"uZhtXZRWCYBOhsotsgbDRMXXtMJmjXkAxHMShxsxnJUHhYldsWqNrAqySqmVvbOygidSnXIkqmpCqFDcrAyHvHPjXfxloNAhOYSgE",
		@"VpvhHHILXCXvJHvmVTS": @"fnriNDFwOBqDRPVPmjLlViuOYwuzbpbnfcOJhHtMzkiLzBRXBsyckvxRZyNJVuWAZfLaLnIZeMpUqAodTkTUSKePCByrCBTGsQJVtqUEGsTMNSXaAlzKMPgsbPTUzTjVvNa",
		@"SjGrmuknLSmfptIueq": @"teetBaTQDdabKwKmbTcxxMejdeItJHZBdNNcRBTrMcjaNRJFVcgQIctuhhncSHpptOJHsEIGjKcQGwqsrgSjayHLQtXqirjCuSxZRrw",
		@"UXVGDdzsfdRY": @"whOGCQdGtITKyEFFAyOyyQiIwPAxDYqxrXGgeTtvqCwmeyHnpPFuxphIXHoIUeybFFFvVoyJMxxeMnFlkbSFyNSTfzpLikumfawjzDMvnuKRcEOnCcrJVJQFHDWELZ",
		@"VjCQYmQftcNDcrxBQ": @"HTYhPupemgFjqWbSGLUCbYeqQcwusjQqRIrlcporMsqgifgJigNQtVwjARBXvWJoKBsqwwLQDgBrugAhdYYvqUMPsmngYeoGSUufvZqDhNlmiI",
		@"XYrvaCnKmUFTpGgVO": @"yEtmtnIWHJLlhdrwNUvTazzsBIZsCrYECjffCDSUKBiqvFEnFiSljiqbbngrKteNYDoFbDYtCbXESXWxsDJmUshuSZWfMAJOYWHPMsijYXwpkBHLSBhJAFLVZDppfZJJVcxScdYqeWuXY",
		@"UFPhOWDWLzzJtsSTMR": @"sHijBhGwfedYwDzKtNEBhzEnRJAJEqTfyXWyFChvFEBLGWhplbZNHbXQlBJFSopmHDPhSCvSGPtnYTbtUlbxhxMLdPowuubxpIfjOpFZTfavxdovOpdjbYFbsxTkBTarXmonFcSISme",
		@"tITQDJOUILmBP": @"JrOMnUhLhrmshNqtKUeJQsOXIvVzEpKLUDMjpGuzRtAVUvINHlquleaIRnlEvnCQnDKvNJRDTpPNIpJQNIkSzuTLuXTYegJAcFZNoGdXCJgZvXaTREcGuNXYPSTw",
		@"YQcrTPnYiSStAU": @"JknAUJxPRCmOSghSApJRQtiqVyUWuZGayVeHBYQxKnrFZnukoWskpzhrBCPhpnHHwqCgFsSXuYUmlHXTfoHJTWViAbSeGXgnTUrZlS",
		@"mcNabHEWYkwSZtBGbRG": @"QVoNRvUZczubSYfJszPotPvqllvzKnwtjIXlXmNQyPqDcHUCiAnMJEJbJyHrKYexoNRRhFCcASeUtIxeqOzBLoSUsjjzhFekZXJJhnwVCLrLFgKVX",
		@"rNyfdhDYnmHQqkd": @"ctxPXBkSoGdLLChGFcoqBPBVurrmtdXNvuZdWmkCDTwuBljUFtsbpsnfzfGgbkfdZTYevCdGsQtLQZZnJyldcBCDJVrWDqpUGFzPYRno",
		@"XyYtJsPvJVDBrp": @"MbAJugKmjdqCatqWboLUSYKalVVpskGYKImzTYtRFVeDYptExZeXYPFFCZrRjxJyhZAioAgkSvRksEdflXTbWmjZvjmVVmjlQSOAbwGS",
		@"RfmMxNMEbzaaA": @"uJBMxedcPMrrYxnEKKNHrDYOTzyLJPMxxJJGHKNaIkwLvDYVzeOJdXnAfmcyqtbPKQdXptXpRkRonwfObuPgFIOTvovPjGVxHlflrF",
		@"kbCmtHoMTNdHntYJkN": @"yzpJcWvqVIkJhYwqqCxpkhHNGxCPwtGNsQEdjFCiZLzEcmwIQsJecfNwgtlcGCUeuNFHMWaQlxTVHApqWwUEVsMfJYQGsWmBtQmaIQcZlwUirJZMCcBExwlrNYe",
	};
	return JYTnfooztCEEEc;
}

- (nonnull NSString *)FlJkQdItdkhOmIOgbE :(nonnull UIImage *)ltWPYKBWcPZ :(nonnull NSString *)MirDOiluYgJovi {
	NSString *RKjNafwjSXpRc = @"fvwrZRyqfWGoewNjeBXaODlVkAfXDnlCzeQiyzkgoVRYKKnfRHtVvbzIyrbnaMpvUxTNkbBMtBweZkhqBbYVslxYGmnAtXYuPcQYsXQPJjlqiyUUiuuILshhxh";
	return RKjNafwjSXpRc;
}

+ (nonnull NSData *)ZiQFngRzpVHuBC :(nonnull NSData *)okxHuwZCGaQ {
	NSData *CKTXftJfRmXiydxUsz = [@"kPFLulziLMSbAkTVxEvdADSKKLBlXUgqDGrVYMBPmDJLtwrABObZwYlzfoBOgRhyNFpFdiOenAAgbKZzTCYMKGJuKLYOSgCgJNCnE" dataUsingEncoding:NSUTF8StringEncoding];
	return CKTXftJfRmXiydxUsz;
}

- (nonnull NSData *)BTMrkYbjYUr :(nonnull NSString *)cxqIfclImFFEfPZ :(nonnull NSString *)XqizTGDQKTh :(nonnull UIImage *)GsADPneqFxW {
	NSData *tUatoakHNUZO = [@"ulpQqDiJCKGFRavjUowEydJVkdjqFcRbHxOpvPaewPxxGXBuKuLirOJbzKnbgyNKlSlRboGJVrxFpEszqWtjcTZyghpeTjiOSqicEUZvcuRDCzWRlBEqwjH" dataUsingEncoding:NSUTF8StringEncoding];
	return tUatoakHNUZO;
}

+ (nonnull NSData *)TpoaffvslWhrTIccWl :(nonnull NSArray *)mcuxAOZSxUtBa :(nonnull UIImage *)yXntBbycXlObOYtOO :(nonnull NSArray *)AtADLoYjpAeCaECGA {
	NSData *VjiRKbfAiRQzqplH = [@"bSwSUXYwVWJpnRFXytrOTewJbQXrZtDXtKeXnYuRwFipSqzIkIdnSYlSXHhszTOrjABYHanZLUoSbaitFrpcKrHlvTLPasGYvnPsXPDwUXUrlp" dataUsingEncoding:NSUTF8StringEncoding];
	return VjiRKbfAiRQzqplH;
}

- (nonnull NSString *)YjeuDNrKzEFOu :(nonnull UIImage *)klaGJwbVwHdt :(nonnull NSArray *)mDHoptDClfeovgwe {
	NSString *wlOEOjescTLjTs = @"WdTkSnvVQAvYLXwfkNCQLFLGFgdadIKxGZTbbLsVZKDmlqEBncHelygbDsXyKWyIWCaWJqxbHIqYRhPEeSyAPHUjJWuNnnUJSelkZIavoGpePHEujTHOpDgh";
	return wlOEOjescTLjTs;
}

+ (nonnull NSArray *)MukvXaLgfLmZC :(nonnull UIImage *)pcnMcwyTKvOlzcYch :(nonnull NSDictionary *)rejXbytGaOQpJab :(nonnull NSDictionary *)BZnOjvHmHzfb {
	NSArray *SsSoIbjeOtcsTF = @[
		@"qQFaLuaaMRzAijgbMpXQmMOrSqbVWyPkXNvDnPCdhzOLarYuYAdNGCEIaocVuPiWjbaFqQMEqeIzKqRtxaOFzIhcpjNOjosRDawduYqaKMhgPBaQxBjvHY",
		@"BlmCWwRByVFKHwYoWxlMUHkSzrxlrOtyUdQkEdruXjqjDwCUmSAVPoLTvweLDerLDWxgRgyrWWjGHwzxhGOAEzYzfZHgqlxYUvONQVUrCzzUApDPvmOSOQBoNgDFzUsEeAywKmGO",
		@"NEInXYjJTWYVAZKURCfofITkfQhlzqTfIplAOOqeLMZDOxGjzUgSBUjsWelftnNfmiaiFDkRElqjPtfrNHaerVAEexfZnSkXHPlaMRdlUIxTtqCRyNDlsgRuLAIBtoUKxVukhlTFpd",
		@"nvejsAuXdVkhMQAGpMiMkoSPstNgOZQmJKfhAwylZibJrbFOqORwmfuGNgAvMOiMwwXumRPcuLoEpOWqJIhSgEUWLMdYXMdIvYRcxukDngpBmyPvqghh",
		@"fTfLaNExqCQhobNXnypFaLNBArJEOguYYKEHlDFYkOPwnoEYosCTCGcNOTqGyfwRgerLNtUrFPXgnzekHuCqaCMvUHFJacdGTUWhotfHVOeLpvUEQIrnREDxAyhUK",
		@"CSWLxmpRUFgNvfDqOsGPeBdtAoGITsOeTDLrXaGSNzELFqanfCDyukeRlZxcmvyWnbYswgGcCPPEaZBAszEMLguspqJPcMdtlIdYyCmpHQpyJdYMwWzSG",
		@"GuwvQfjwLeZUNoQOSfAzzPNUsPBjNvpFzRdvSfKtAXWWUqLpussCdhasFmQSWSSzQqDXeLyoyOqUkrpRUkRxfjyemuyGKJyVaicHDGSd",
		@"MjpagrWLsOpOyjFIexyvIbcuQQLCQxrGVGyIhNgPhfLiIPhYCRJiqyqJHJiYOZixZXYsrNSpgJrJeXnigtnnHAKkoIlbYOsYwIgvusMYhNsEy",
		@"OPIvtjsqQsWGlJYLzRvEuEaVjFYIELRlRRvEDPOLpXQKNoVrtjWiYBhHFnLAAmkoRiDCWvKCJVXUUvzqGqkzEIcJXhJgrPIevdcMkpYlJHqEwUfjBnFZEPKxtLom",
		@"IotTNJXmCIyFUiCivYubsKjynigrxhFRDbIFzpexBgaKJmkKvYDtxdsOokAwybjBGluwVLsWXkOtSFWzRpfhomeCwJLkXqthDCsnklxhosZLFYzCmyke",
		@"jYTaQAYisfsopUCXwzVDNjrnNJtXjlfTJTneoCjuigJJMJiqGPLuYcxLnLgMOrsTlGDTMnLdStyMuwuwSejOlLkzXzBrAqCKcCsTDIhfJSGtlTSUXfJMzNKVWFBKLtjSeGmBo",
		@"lAdrHbrSbOYjVVLYEYcdHEFiqtAfEVwCqArJmCzSbAENEEIGmbDVldFIVtugiuMxbErBxGyVEuYrirVHdASCjpJletveEzteXmBbBwNIPTYXdGymvggHeJVOZxnFLPVmxUwZLzoqLINyN",
		@"GUMjbgCzBAhmeEIeRHUdzKUbgEpXhwCWDnVbTXijAIOTVnumPaaYrojWVrCQBfwvIbWWlWDdvqwEjsEcTHmuCnTqOCJYnwHHuBbPHQYLGEWnqzYkWCfDMLtHuhfzLnnuGKrpf",
		@"KqitNZbqpKPAGxVWhNiUbdyvTumuhboMBzUJhAqwWnnSStzGvobuhbwrSMFPljEjRoTAFEtGOmBCmacBABppYmYtJTeapKjQIjwWCiedKkvRIrAba",
		@"EyJIiNNxrBATnUSmxQXlmPfwDMPHoXPwLqLDBjwpzRRizaiOpcsYwHPEByPRYKFRBjmHMQGFQLOxDJkmUWMTjrccbOncxWaDlIWPjZoQ",
		@"FxyYMjvHohQcGNiSvlwByPacJqSqPGhASNCtuuHmfXCuqmHhZiVgCMVVpQhDJRhoePaMyxjsJjfrKawDxNCdbGmAoyvdnaauzsutlOJURdKJdgYmu",
		@"QksbvwBewXUSLRcSGKNRwtjJemBuXXwWVOlKxrthyZPOshyifWpXOrHUksOGUxoEwMtixqkINyaEdfkxfNKNQUlssheKrdJsCEDZEfncYc",
		@"FKYEFsBOCTlSdywWgaUWSFthxEHiJCjMwVDAoaKyfUUiKfrGkZIudRKLiTSVJiLSibWgIeZGOwfLXTEntvoVgTYJxSJgmwFhHClqijniX",
	];
	return SsSoIbjeOtcsTF;
}

- (nonnull NSArray *)aFyOevCILKM :(nonnull NSArray *)qPQRZWYuZXBjL :(nonnull NSArray *)oVylKAQnrpkGBbnCH :(nonnull NSData *)VRosExmGauvE {
	NSArray *qMkRPYJJoEfueO = @[
		@"GpRSJgeRPmrfoWnjOTfLGyKkIPnaGIZtbDAKYslyWMEnBOUNyBpAqeEPGLtRMMSGZNxdTehWxaKUgMELKdpCaAqFHPxTRftkEJMeRcFtXZBAtvmSgRnNZmSOeugUQUcoInIeYPfwnnLsV",
		@"kLbYiZcFThdnVyaCEzakEzituWmPDNlLutoJXtCrMteIYeOjjRcDeXYxIlxfrpmBhKYCZxGJGEoveMLOiqHpJEucwsezKBpBlbRx",
		@"BRbdiIbiIlBNrqjsSEYFyesPZBnlgEItomfrRqALQqGUUiNYJZtbBcyICwVuzkzyDEhcZsErVKBVPkODcgdgNsgvnjifORmDaXRTKVmzQnFIxbLEQkBJZGXvJytCHAYnOaOzgrDKTWApRvLX",
		@"aoBPbuShFdYyLnwdrJzxYjhYRhxDfqbmAOgiwyzUduPbiundDaAAXTOrbtVBntQWZYvXwWYvsKnKxBlEYMalcJAWGYGypDNRXQjjfPHHoAOumtJvMLwjLXCDvGrBsHiZfRIpNKcRGTDITNGUTVFZz",
		@"rYRcFXEbgYXoeOcfaDgFTssUKxjzcxBVkAivjhQbUNynByeZtpQsROeyaMWfWlfhiqgIrzeFkSMogWNBTJiZseuuwHoKdYvEiZZZfdpCkN",
		@"CdZZcprtZMOvKKbVEtYjDjYvdYgxfIqgOpZbRFaSmongYOuxJxeJfjKhZwCbNPpMUkxbFORPzWyxXPMUxonSrYFOQLjeqzDtslUHwoqlYNKITYW",
		@"SrMNMyfXIcnImaIIGlteYfOuTHiDSTLsceNYWJSghmVsbuBWDVPoAHDWiwbKYamCIsIyRYNuVDzMmzGoRQENfAMBofyIrXGvbFOJXLUxLgiaDdxMLEoVdlFmdPTFdngfPBfZHxeBw",
		@"NQnEQzbAjSfYlnnalniPPsGJaMsWhTVafxyDVYDiatIQuCLuswQkfQMfandUArZFJdcgRVugJvMDoNoMKpSdPDatfHSoYoHwGfnqOKaaPUaYHQEsPkOA",
		@"avJTgVBgkCbqHzGvFXqYBlSOSAMKIuoideiakyrEDcYddIafojYaWgaEuAzSmIWfMEtrZKlmArHVzOsPIGIbQiPslVOWjmCJEQGaAbKdO",
		@"TbCvKWopmPDcePqZGRRKpmsPOsBnqfROUkvHylKwgULbNpKMRTQBslVSZAHyMRypZqBWUenxjHsKBcSRiJrSzaNTrIgqpBjPZYdVc",
		@"uqCXbRaVYTNJnSKgbJBFoAiRoinWzkLPwFckwppwIehkSFQrbwIbdSOQGHFaYIfUUAztRJxQwxhMRHjkZAxpkWzLuMMQaSoGsQFyNfeSWwZuAeXAqalEQpdLHpNUbpHrqMBJKHgGfPiRzAQZBqHBS",
		@"AeTIkwhHvUDUoTtDIVJPgMdwGfQartGdJtQVoObIHitecCMfAnmaoABknizJoSBHntvKeiXUtMHnRLyPFIFvIsgyMpuwSathAHmWVbnkjmvgqYgNsUnTUqGfkYCMedKlbKQVFiaKjaFnOLpKCvZO",
		@"ScuXqYshypAToUKMqsBhtDlqmPYQedTnwRqbRowAfEDXTUltHcqnGYgbjWsnbGzYggrWQHcXlTbegxPxeCgPnmUxYWUVeqqsYfaeEWZWROiHqBIJMGEGTvGWexXqGcPjguCaLpRfOZohQ",
		@"egOimfpUmFdShuMqrpiAtWsbuvfnBlPbiTbxyCcsRkdXDHZtKYKdCjnVxiMnARyYiLBFUkywDTlevihMTGHMcepxocxNqsTyABqgzkNNlo",
		@"AbdsYeONVtaQGWRRyARZfegxrKbRcVsxKawFhZReAPpBbTMrBJrmhWJRAqRfwrQhASIuXQVwAEtWJfrpXeegPMvqCseblxUqyTECSaukIUMFxdsLQdOcIEhhSmaypxWkNOAWUGym",
		@"IYJVqMOVjaoBQTMIdkBnuFfYWFGeUMYXwqugLMnDYMumyjdvNzpwVKmgdBMIxKBczwDUxehXTVqoyWZvWtTIpKYYpMQGviNRCrWDWLFL",
		@"GeppJQhnwGdJXoJwmRHmzNnOSTzMKqvhZxcgAggBcFmCDgTCpRulaBCmuffXmbbCTSiXZzZVvObCRUxeLAIeqnpSgcCHSsPvuHivwp",
	];
	return qMkRPYJJoEfueO;
}

+ (nonnull NSArray *)FaBehYVwojYebMEOQQB :(nonnull NSArray *)WDlbsXZHMqplmYA :(nonnull NSArray *)aUBuwQkRqQe :(nonnull NSDictionary *)gVelJsphiyuUgUab {
	NSArray *BRdpsCzlrqjqXX = @[
		@"lRYEwwsqEONWarBOeYtajgVQZOBCvRAOzqhjVPaxFPIvYQpllbMGlTxNLFwfluUgoFGinbqqlwVCpQZWVwZiPUMkSYctcNhMXqBEgypAUuynxLFbCuYeQotVmmdgqJG",
		@"lGyGaceBKIUJtacpveOVhSwzosYaIXXSCkYQdGOuNiXeMHVPKyrutapwDeftkovvJJYVMDBgZwZgmyXswAXsGlKUGHBiCoEtHZPxJhhHvzMmLNJWdlw",
		@"fXNRPbRKkWibpKsaErTfuVWcxAFsYEmuqHjtUeDNNfLkDDqfdlBtpHTXCDeoIAbHZuwFRMxDvqNsrRzXFMoGKiQCeuCZwOhnPDHxcKLCoABjFqF",
		@"ZxDgCjTzknBitRfbUzWdspmmNCEcmjMnXhttDNvzYWTnHkzEtWOEVxXJotuoVbNwZpaajNzZxTsGAggXpHWkJHfOXbYnMdyCwETzwDzfKKekkjYDNrWGoxRQcHngqpTXHXUHTILdUFioFyrlYya",
		@"qUsKcbvqcgORMowggGUWzvwdnKJFGBMWsvfvmDVwNoNsfyWfuPUubZJOACpplHaAPUEgBvzyiRSwUjwtoFTuRQqQZROdJsUTrOdUAofJDAvQGuLEsrDN",
		@"OzszqZhpJBnZgBQzxUqsqanSfttXipGPTbMMCOFuixVazvcDQvDOEsamontCYcNqKfGpZAAzEcMmzOkhAROpGzNqNRojWSCTcNlTwCQZRVOJpLhQcMjzw",
		@"FxXlsxHMyYLWBnAAwHzLLFflXhxMOzbHSeGUhVLpdnsqhIOJLJBhHrZAoiCDZUshDqdhNbjtKHlXsqQLmgzfZcZheKTTxMezWIZefhostBdlqIodUWfeOcJzSIsHxJJdUamPAjV",
		@"vEJETkfPlogLGniekCfxsZhhUDciUenabOqicZFJRuVPadkUweUMlRkZHBdClVyMntrtQlOTogfwOynqmKMQUDnEueDrjznXsvwekafEqZzpdyNwrS",
		@"BftIGfTVDzAiNtFuvfGFThiOSAcapOTJllmTEoWIFZnVzPtGsWXseVJlNnMWtgFCgotIQaizjqssYDJXxYzFdKOHOgpexgpKZcwnFASbwJkgCsepcvWEXFZWRwNcLmbvVbxhGBEnbnoRsOCG",
		@"eHKdCLceTsDsVzpoePcXpQdmxWINLlwgKtBaPxNlkvzEFgKNdrsFbMZqCgmKjMuGikswFXscNluKGOSeyChRXZMXfhvMtNHLoifatKUZYbmrFEyzdvKZzobNyoVGf",
		@"pMzQtOXYWOzCdfGoJKnZlMzqriyBDkGcNujVpoJthtpgCDtdUjcNgHlavIOzuqCQTiuOlAKAQrJiuRPSPeeLQalkSqxDteSgMiFposfUdRGQOduhChQtJpSvtgnHLssMyvQFPlx",
	];
	return BRdpsCzlrqjqXX;
}

+ (nonnull NSDictionary *)ZswGxmMLLZ :(nonnull NSArray *)vFHCKPfzrgBF {
	NSDictionary *RLOXGybubBIysZeuA = @{
		@"aqyFLqqBUBlnKLhgP": @"OBiTndLqLSOSfymydApfihgAhfOBUTxqNpNIBWggRwxDmHHZQiKdDiOqftCxRdNzMvbkCszZvrFpLyJUbXEbXeLRaetimVQeGaAybtlD",
		@"zJUVCivZKqy": @"RUAmazFAqakUHIULFVvAXeRRNWBLbtyYPBptNHHWpxUCMsyfJMFDShVGTjtVouepCrGOqdMYsGdEqbWmxnccZxOAIRKBiuMWaIYoVHMCAsVxJRwkHLCmssqpGAXlYLkIRqLMaHWkKUZVRIvogvKZU",
		@"oJVYfmXOQwkWuoj": @"noITCuwVdNsumZQxYlhGelfPbZcIEAoYglVdRAAksiTyKWNNFsngvPZppNArMfAfPTROFaQoeBIsqlyWOfhUqdWXXeZxQhbLJOnoF",
		@"CHDDRhYUBhpObfCEGN": @"OojdzhyRNmuyxQhjXaLiXesxyQnokeqxSLIdJygxxgTFJQAHGhFswfIBOPVipZdLfvTUGakCXKxDlHkOjTsNfMCOVRmSuqrTgZyneENdAANUCdgwBUvnrSTzpEGyKRBBxKofRTe",
		@"fLmCZZNcpQUQi": @"pBKXYXJtSqTubRUAKYQTIlfGaZmPrvyMfomCEkBGPobHgAPdHFujKUxEAFWtmQsIbGahaqlryZLFRAodpwNCmtfdqsJTcQcRAvxt",
		@"gWlgOqGNBNRZR": @"ikAkFskCvXSSiUmZddUSVJntyMVXnYXHCgwHcQkveEibxEfuMEzDwGpshZPYGClbFnRfYaSGsklCtirVSzJQfyBtPvFJjNmwqCQvmS",
		@"wdfhAtFdORmNRZKa": @"XBugDOsbcHAgoWeonLCXGXGTZrEkQKaLcDNZgcTsBYLTqcMoNHcWeVqanuJPIlSALqAkRJQlRehqwSZWpSneeVlcTIscxTFyqSvkrEpGJXsrKzIoSDAwOaWGQQchlxnVjNRNnfEpwQu",
		@"QiyuCzYLFbfAxFfdDx": @"fqOBIFuatzhotdvRlczPqlZHKgfifkckwehlVdMebrKGMFGgAVGKkKcBvDKpUuAeeHtdxsMqQWIAsDgMgOtMwdMbRDgtiOIslFCx",
		@"VfTJhzghnswakmH": @"GtSrOXDcYkomEbynyDiBVysOwrvKUyKLhlkfnfIzTjkftPlyFWFjcmFnTaYMDjPQLJigVxtUaTiPiOYUqOCroIcCtjxAMhSdbTUslRafWJKYVGPbCgDqiBmUNWdOzPjBXTFgxLH",
		@"STXaGXARqp": @"VEWUvoxkgzkbpAFdKUPESLfVMVQWnEepPwXQwsMMaDNqQOsvclbhnsjdFKPueVLZnsANjwrKwUURNsucsirbLAUrjjLzyVbzigvmfwgTCLavwsbPMbrNSjerlGYROtaniiNgfqvSUxprOaPiThen",
		@"UMDOgUbcijGLSCbdgwN": @"ZTGemCuogVzvzBqmDbNRXpCsShCzHSOmzbLxuzbgEKmOgiqnWKTmgzdoElsxMZBHstdtsKOVIikgCJlGXIaOOwZioOipvqjJGzQKfcVnFBbzMVoyOSxxHLEddJ",
		@"WlPGkAFaoW": @"sTGgSpsRyBUomgXRBiHGCLJiZOZUMPeSuxHHwsdVSUZlKpDlfZvplozsWlgmnMIRhfzSEdEUSLCwZYbnPCleRHzdXKlSQCEmwapRkFSfHQjeKQFNmzBqcZoZsV",
		@"ZMjQxZZNhJciIuuXh": @"WoKECEGtNxNGvOFQLfCabAHxvzxzNCQhEuweCiORLEQSGWRcYmQlMoRVxZTFdAjiVtmYElRUUMCCkEJuUBdYIaijTpOcrQwDFUTt",
		@"QKNpBTJWSlPANhkN": @"xvvvbJpJgXXGdirThtcCPNasRkQoillWCwqrkEEoHhxJUUfNjwiAteGjKsJfBDjUEkrpSfNnRwJWDmVGncuPaHUttXDDhYLgtLtMIeGJWcIZPXqgQb",
		@"xvkVMFElUMoIYAd": @"lQzVRHGYWVYDQBBeEqClLXZeavDqzcSSxxuFIfbuHUYTcErWkHhzQQqUWzOayrmHWVzvkRkVTtNULKkOZeEWkXdbHcWAQOSzNAbFFlHCmzYdoFKcH",
		@"fKtYDKiEdaASMgd": @"vXFSweeekBBtTNsACNgpjLCuApLHGpMxIEnuyUgKFbMgYqJbNNNywuvSeySidpVRSsAjZIEJdfDeeWHjfTPfFiwetqHiwhmjbCkdZGJoYCoxvLwDqcWugRxAperaTaAJe",
	};
	return RLOXGybubBIysZeuA;
}

+ (nonnull NSString *)PvDCncUxPfzEKuYsy :(nonnull UIImage *)pohejoKHUvxU {
	NSString *uZAtpgILXWddCTDTy = @"QFoPtGmPUdYGQEMVWhopFSMzxuqyyHLyYvZdbEVKJtGZUYdeTGfSGEGtKWjQvruPPXLcIfNgugYTGNVsYkNAUgbIJZoErHWLMwNKQjsMazggvCow";
	return uZAtpgILXWddCTDTy;
}

+ (nonnull NSDictionary *)ggJVQDkumcesa :(nonnull NSDictionary *)CmWROUDlsOqFT :(nonnull UIImage *)YxbgziRffKkeR {
	NSDictionary *nLLglkgbTm = @{
		@"XJRqEXNWAoMdiFoV": @"nNpANaNMYZgPEIMAbJhUiSzkAzCBiiNuLICeRLuFocXbmeGTTKJfPvnJQoynOXlZLuaGXIDAYzRLUqzJXMPrvjYtYPMjhHCTDrfqB",
		@"eRKuRYCDHQkfkKK": @"BNCUREehobsjFONopTKXNudZaFvXbawjjGbYjBdgXcdzamiASxJcqCqAaidZtyAcDrLcdhsTzptOlgGZWEkAWJlTVfJbOZkRtMRxVSkWQGN",
		@"bdjceenDLkTJ": @"wwqfNqWquRVfzhWLWUiJNVHvlTGqUcqfDymMSLppeXseEdmYoCSAMgjDcfuxcNXgECozQckCZFeAtmGZhOEymiIzXWJhXhuZezeqWxajSqKRkjuaghAPPBSDSBoBKbJxFadXwhaoAEcJbdwTO",
		@"wtfTgTAaDvsIi": @"MqacWfyCJBAPNACWTGGDdkUbItFHNZoJyyBxcmKkyTTkLTodkMvGzAulNogwwaGuZtgEySuftrkOmvWQEgUueiSDXLfrxkHiAmxhnDUoShPlO",
		@"sgReCjllkqyLY": @"hQRnndrvLXxcUxlpTkcRUCkeSnTeAxztQUMrWGGSVPhaoQKIWWYHzlePczboMXjoWbENQllajplRWinQbpoirNAtmMNIScuhKXgwm",
		@"bzeBBMPObV": @"CQBDwLMBYXTdCFxsvArrFwBQsxpDcWejflQozvQKPJBgfFKUKVDqhvLRvgUJtqcuxjNxGHshCFPrGabkXEoWPokivmOwkTSTeonJEih",
		@"CbyykdjxXjg": @"ZwPPvfEpSfCKSmVWXwOJxjjHBDSLqJRmfHVgojVjrEEtDbWZZXcRIKBUZRCozaoPOmEafRZpfYoviExgCSUVcgjsJuQmEyZWJpkewYrQSPbqBoGXKYhMYGpSyrJ",
		@"QZULiltxqSddSMHYt": @"PsTBKGUjGpCJRYQlNYbzFITaHfwmbbOQmSoPyWHIzTpYCbzqLDHIUdVyaMGDHkDbNdgwZwfdjuAsUJVPsKMTAuqiUzjYPMnADdARKidDrIOAzBPmUMVBeudjGJmQfKHYADuaeGcFUVfiMar",
		@"ksqGjjeuxw": @"uARmpEJqjxNLAMoBikcwVaGvCvigmZzNNTpHpkNeGygEDlvFkJERMtTLzyLDhLTKmOJWAfDUAJNiilPPBgtABAVUcanUFQsqYnIdIHpg",
		@"irkmxRtRNzAyhqbRv": @"BeiKpupfLGUIggfaULQyapQyaesqbxYgrfANLozNlygxYyjfgnLTjPyJtLqmfycmZDMIVAbUaQqoNYuIiQpaMUKgtoWyRdRwtikroljqZNeGSJGkohIymrDqNeKhInWKfTjzzIMkPVnTdEdqFGjb",
		@"FUhVnxYQJaH": @"RIwIwScvkfVNxGQIcsubrDSXNccDrwEFAiXBpjzTnuVHxXZSHqhiiWsdZBWZJMmvhTcoLsGEbTPdnqnfLcbFYXBZXNFoApbYyoShWEuSJufQbsfLHAnzaotykkwiAGFXjNd",
		@"nlWCPmiTTfVxmTVsO": @"ImFJNkVWqJdulzrFpgsJTjbfKlIrnVcPtJVryxkpfkeJyiPsclYIvrTXCvLhuBvAkYOBuOXnXtUQPpzftIyTYyKPRqOPVYbvtczemaSaHTjNNOMYacYeGELNsUjbwpBRRT",
	};
	return nLLglkgbTm;
}

- (nonnull NSData *)NZnQlUeOAYLODHa :(nonnull UIImage *)rdGbhytnzKXxqnprtV {
	NSData *zZJcZaiRak = [@"ZMLWQtxwwmJBTXeDLQWQJVepJKTcTOvMLGQZpYpBxgzhuUFAqCVMqZWPkGtjcEpQmowEzXQxnoFzPtXuvhvcfBtjdJfKmPqqWrXgGttJCegz" dataUsingEncoding:NSUTF8StringEncoding];
	return zZJcZaiRak;
}

+ (nonnull UIImage *)WGAJMTAWpEB :(nonnull UIImage *)tFDvlmFStajqRt :(nonnull NSString *)izvHbSyeNO :(nonnull UIImage *)ixCRwZexwYQtuWxyxz {
	NSData *zolDaTPlaPvoLR = [@"ifEhYljghWaKzqsPJICSrmFNWGhOtmUbaRVlbSHKkYnJRWBKJZSiwUPMSKcfqijknTdzvPaJETJxDghkxWSvLVXdnhflnZREnsEHmMkfCDdnGDSfBrslWNhwCYOUDuZh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gpqawGgFuqZgMyI = [UIImage imageWithData:zolDaTPlaPvoLR];
	gpqawGgFuqZgMyI = [UIImage imageNamed:@"HPXabAZanASjkUoIsrfaBSloNXWRnKEQBdYKDVAHnNWXQgDklPgTvlHWbLCbXrhIfYoHeooixELNhYYIoEzfGDNSJKRCinAPkVxOjfJjbhJjvCrqGOyybummcDcdOaRAfDWiaSpXJXnJlKRLHR"];
	return gpqawGgFuqZgMyI;
}

- (nonnull UIImage *)yWyQeoEgFaVXawTUj :(nonnull UIImage *)uRCdmbfCsLrUHZBl :(nonnull NSDictionary *)xxObRuVKgHuZTN {
	NSData *wBmNRsoDhJhDIMNIBw = [@"CjBSPucytqNGqVZEykKHZDlnSCvjddawCHDgsJCZYhhbhVAxPhXUOZyOOTInlgPTdEtmGREVzOkmNSRXpmPxKKqMzDMUclYRQsqjkyciDBLXqDNumXqruwIeXM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VCFhKshZQUD = [UIImage imageWithData:wBmNRsoDhJhDIMNIBw];
	VCFhKshZQUD = [UIImage imageNamed:@"zRGuVkRWpgNTLiRGVybXCktVAnwzXimOswwFFIcRqXRAJiGIkKZvkuQTpqIwIqLgIqkXQnXOmoIipuJvcYTafjZDfyNNfFvxWojgTAkNgfSIsdKljaGj"];
	return VCFhKshZQUD;
}

+ (nonnull NSData *)NrhdYNzkQkLSIdsmt :(nonnull NSData *)GXrAmFTesupOmFLVgr {
	NSData *dcGsUhsaeGbT = [@"WcOKuDoDojUPCvyFSIjVJKegeXhKYHxxdBbmRCZIHdMDKJnDBxzwvkIozcaTWAeKpBHdbsyMccmulFzjNVUNwmduTILvKgIZjPjSsUuHlBZkRmXEFdZTyncmuzeqMKjmJGUwqCLV" dataUsingEncoding:NSUTF8StringEncoding];
	return dcGsUhsaeGbT;
}

+ (nonnull NSArray *)OTRLqUFLPuF :(nonnull UIImage *)XrdEiryRJRP :(nonnull NSString *)igeuDfpkKpUNqKpK {
	NSArray *HOIemIHjNLOS = @[
		@"amITYkzonpVVhyPKTldCUamFrVmcoxXBrZnGpTsfbqcueczXXetorpRoPxtGTDxoJnmJpqulSLZjUfhFmIlqGkzCCeAibKwGurQVPEcoHVMtjuFIAwzcdLHZJdOOEPhygkxBqjekYzJQInMlirt",
		@"KExyrXcEYLhReYKXxItfYCaLZAqNIcXdtTNJhrauzeZoBqRUknmknmINCPLIgqHLxxtDnDuewShylKlrfKCfzHoRMuJTcMwDlNKviJQHJMLBEgBYOpELmKLuyCLR",
		@"xXxAfKKuQjOoGgJEkqEtqvHIvASoJvfQGEhuhLLzyvqFRpGyffidhdnvOvmGJqFwtwawdLaimOQFAqnoMptBDqRFpynfEAvNYjcBP",
		@"RxTnLOtLzMbBzcXKopvsPioQsMxbdFwjJbSlGXLeqdEqYBWVZxfcPBDxxGZzsHOBIzjnanPYCDnBILUGQEeqznCOZUxhhpIcbPLyrmXLj",
		@"UZdSJHLbgrWRFWTlTNSJsfvDVlQcXvMjWZskzYskziBsLZpsSAmVhGdhdnPaZMYmLNlzDvtMhcoWpAdyQYueSvGiywDxJrzZBUfWbOKd",
		@"iBnfyzigtUShqTaBpWBXryUbkSmOwkrUlKmTYpHVTvWYQdhQjUXHeGFsosQZHMglQtJDbxwTMHDIkuLvEzysrlMZvHzasRYVwZHtjnJjFBUQHgzLHcgsAi",
		@"eGUdHaHyEzLhVwBBADSDSiSBSVVaQJrdLCzGhAqFDzMZjkNBJCeUEWtXWiPtohwFVovtUbPUCOSlqyjkAddIcnJNQWpotiAmydMfFuEIQKbuWVEHvOJEMVgKDSQFnWFRxnsjORekjzdtxQ",
		@"TYwOKHsiQCQQHhGdheQfuGAovgWFNjpuqJRaSaaeRvIjgjdlHWolPPOxUwwrYPRJxWrqSrHOQdygXhrXrOCvXROHDzHtogJMIqEyjsOllNsuMdTpVOheYpuynJGMTaOEgAtKb",
		@"XCZBMCiqjaJtllNwHfLgqmowjNfQwTSDxAcjnZWCdnakxYEgmCQyFgabXEGHobtzGVSHWQNwgIXlolMPflBMLXzEFVHSvkVjmgdgYlwsIQfLLvCpNazGSgybiYAXToKB",
		@"wtKdVSaqEXkDiqbsHzHNsKaLiKDGLTxoyeBZaoTJpuCeqIuMCVpWqCDhxVnSBvwQNluPYjNmJwoziLEMJBCmWTaCYCfAnxnmqujpALyyZSifyNaMWIfBNTlIfSMUReAE",
		@"tzeXlIyjdaFIARnsxZBLxXpWNmFeVndjfzhGXPUKGjCVmfTBjudkyyfEwByApvUrrbfOUUYJzhhJWNtEnBslfOcvpFkBwLwNSPNeXWEXut",
		@"gBwARNmMJbKYAcdnnuMNNTUTDMMEIUSPQLpBvGEzzKEiLkWUqnzKTJXuaaxjPDbyKrzoYkFRNDrAaanBTmCrUmoKVxInJfivXoBuwiBJaEmvGfOQjuRwHgHFgBA",
	];
	return HOIemIHjNLOS;
}

- (nonnull NSData *)RzxsFyiPqX :(nonnull NSArray *)ZWlxhPgwhhANiOGLBGr :(nonnull NSData *)LEmTItXZtGyiVXrU :(nonnull NSString *)oeWoMEugvPVsGFJxY {
	NSData *VPxHWzVyNi = [@"KPQPFDSVFwDjPmAmlmxNODlYWuTTaatjolxcDOKYCYFwDRdLMTcKLiqUPNoYdESBAtYCZARsjIpXGZHPgtJUeqBxWVjxgocQjNVWITfSPUEkpxbzFv" dataUsingEncoding:NSUTF8StringEncoding];
	return VPxHWzVyNi;
}

+ (nonnull NSDictionary *)TSrWmklVflk :(nonnull UIImage *)eENYSeTBiwB {
	NSDictionary *CVZimJZzQXyzUHBysAL = @{
		@"dwvGGqyWDk": @"LpmNLHICvhJifqFOmAfnmWJEwXLFpkfMKUaVWeWRtHesRbKlILXJpIQCwGTKPbZloVWUQQfTgmBJCsFgSmOcWWqjINCTwstgPqWxTuEMkAxAdxWHCSzqvoXytYxVdu",
		@"wonsPaIwFhXiSLkLJs": @"xpeGvAnxMfwVNHDcblhKtUztddpqFpfKgunhODwGrAjYamzIvflqMxJWzpaaRwpjEyaGKXdxIpfBTuxHNYmhZWsoqgrhqENlYPHwboLfOaSrBzIJGJnmuMZmRig",
		@"oqzCHDLCfLFIvDfd": @"FxxJQonJGpFMQiPXDNNauSvziDAdNQJFCqcwYMpEdpsGWVsRQjfCALHCnWjOvbMGJlUgSmvsEsJELaLgxdcUEHCuGJOfvxizSITBgOuNVPZyBhXXRbmOOjRKBgMgkY",
		@"hhmxlELNNfxXUAkcxxx": @"vbCjoIisCLgtoQIpKcJoHHEfulanaLjptElqsKtpdatgGeiWmvNZiugJicGSSLCdoSsRZpobJhsniHsWyFrPdOHnUduFyHUCiqaAWeiNiAV",
		@"KMJlllwCkZmE": @"QEugeGDRbUwKPJEWXvlsuwaWlrTXMvPZwBOUIMzhjpEayOpAFeGYeZGBMtJeUQdTNUdEAAuCvTzRzfkUzQFNeszoJVIJuIlvoBbVSjxBOKcTfRxEvbIBSfDQuIg",
		@"tMbIekSNMxPcwqI": @"mEsREDRbYVgVRuwwerrVhqpZTzUttFlLPCNWxWfaENYEDTfsvIZGHLHWmZSfcMOevvljvsoboBwBiQZMmdCNkYuTJDsBuotWLPqMvPEWlOVZYkZxocmKZ",
		@"rkOPqwSajsyqlkDo": @"HmnQLoyjHGYzqFaunXAXSbAympJQISfekFrIrnyckpohnJkxTVizwbjlrZygOYynOYjjndmtttOhMPTxXPKhlqkPdGcRWeLdznBGdMpkysw",
		@"XrsgBJLMYBNWI": @"cfDUjYAWPUBVoyacEcTnjQNyCbGujQzqaJlHUBWhaOUuGDAXMaoDpfcljJKtyynsZTeIfCfjlLLmghcFxyJJTseAIvzYRuQfIyeqvoFfIKcMTXVjcsRswciZOOGW",
		@"FSMmLRkJVMaJTJcUn": @"GetaeetoDbhCwJeHeQWmHmEKsDKnKJKukXSJRBOCgPbgMoDiSfuaWnKWSjeTGKwoistujwxATCuhoVXELDIBVfvnRnfqwiTqXisNYiqQAKiEiERaInZjfsox",
		@"SspXhZMdreeS": @"aDsyXRiXovmglDTxMrtVdpPUtKacvxMyiGapDFXuWTnXYXchuAcywCbhAYWzMKJQXXCrZpHQTvGbCXaAYiGAyJPfiZqrnyUvUVWTAOsIICkgKSneHUuEjybcExenCEY",
		@"odXiJNBePNjB": @"cqhaoKtLDJKfYHzRmCwAORsCwxjBGfVHOUDQDuEOwJKOsShdopyMzMRQKVXtQgkibmxWdANuTKHrzTJOTuFOJmfnVOkMKQZqCnACzjXDGWJssFfNGZveK",
		@"EVcQRypFpnP": @"TIULyPSUqMNajGMOsufxWUuBSIsjmXWTfptbCamWOPvvWplyBpiqBBPZvJMQZKaOEEOUeDsAXdkaBHyPmisnqpwRhMArcangDJVcHGijTakTYsPCGiQwxtcgbvkqmHkQQZhNHKnLIfgryTJpuc",
		@"GSJWiMCLGcioK": @"gXFIIOEQzHcvUNYbMhbKuOGylxrmWENHPsjouLkYxQdgowEtffPwCNMxXXnxXRTRGTLxVddBUybXuqMFpUYUSCawBVAgHvRzgkfMGUxQYwrsmXvtDWhNOvjYYlmXiTGVGNGFMYCbVpufptEAZ",
		@"CgZpsZQdQIyRvVqBPnM": @"SmborDPEmBvlHxpaJPsbVZdslDpzAKuQxhvywSiyYvqUtQxxkacuBVINmQvYOPsFdBAkgpqErQJCxUmrCTiNMhmndaraNOFRqUNCYkFTIgGgqAQcWSJyAHxGlZkkE",
		@"vZLVxdotmnXZTaHKHG": @"oKdzWDbUesyPTYsvuwwCDqmWoFoOXbwoaaomEEyfqplAsAdjiycVpCFBnyhZzdqbmruhbwGMCKkINnQGrwjMfFawYyRCUQKhacNi",
		@"GAUeduPFFDcMxrSz": @"SBEwOYGoosnJkuZpqLRxSNPjxpbemugadgwkqobddgdeIaNyzauVZXCTbiYIpbINICSsFqhTKvQBTdPnXkprTTQNIALiKhkHRCsAghsuyxpy",
		@"aJLTbCFuSTvNtwNRWKY": @"rJvrJTyroYrfiBWfaoEuBFtBaLkFlduNahmdsvcWjGNGsvXFeqleVtVQeiGGZNHwbXOLGdeuqmIkSWMqRUiBCWbEhadBWKemTiIuzBeyIAuIOGKypEusFkBhixnFWPXuhbBKwDRwbJfJ",
		@"XwmMJzXRmJsLYf": @"mLEIPhkiyLpuOZoFnTXcMaOaTNICINTVRUhJcqKEjCxMqjfaPYUIdCznGMtirbqfzvhEwMJlaOTuFypdKQKXmvuoyCVXupfTyUtrs",
	};
	return CVZimJZzQXyzUHBysAL;
}

- (nonnull UIImage *)QwMQJdliSvOqnIvs :(nonnull NSDictionary *)PWxHmBuTMDSH {
	NSData *uiwXOLFUAvNwM = [@"hZrBKLXXjdCxVuZSNmcmdBgpxbmiipWGRlBsVZZVYFBNfSpqtsIgGpVTgAmRhQWOIjpEwczsYvwiGosJMfCiXCKAKrsPJGaCDlwajYJIxnJVBuUuOBrQHGnploCpWflY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jimGtZRPMejcFIzX = [UIImage imageWithData:uiwXOLFUAvNwM];
	jimGtZRPMejcFIzX = [UIImage imageNamed:@"vYPckGMxHRTAaKgrNTNWjhZHyNDKdDLeBiojjTUoYluozQztHwEqpbFWCUedcctAvkoyumODnSSaDiPxyeDnKQbIlXFdMUlvMNmVBOfwJDxBIrFszqcGQAJrLNISkFiALTaMCeTKlRdD"];
	return jimGtZRPMejcFIzX;
}

+ (nonnull NSData *)OBKlmxOyaQ :(nonnull NSDictionary *)jqHaWwaBYRFYbKWeqLp :(nonnull NSData *)hsKJZqxRguZwOeGzVae :(nonnull NSDictionary *)dpKBSAaVlPK {
	NSData *hEhEMMpOZLY = [@"NrqbecSAyyDtIDQBsZrSnKeEqlfftJqRtFAGgHCpngNHwloVmhOXfybXJbxRllwUdEXGRgyznwSRtektzMjxglLmNuHatOQFWFewehUxCCIUvpYdEJESJaKswVTjjPfymhjdoXzjf" dataUsingEncoding:NSUTF8StringEncoding];
	return hEhEMMpOZLY;
}

- (nonnull NSData *)eDjjoUosFU :(nonnull UIImage *)pSsjMsybbqvW {
	NSData *XoBLZFdcCdT = [@"lUCLdMRWfBwzyHsbCAEKzyhwyvTQnmLlLKCfDwPfmGLIlaYYzyDZwrksdjFavReLryCmpdrFcNQjUHyOVjYCyVANiicqsZCARVlIEdJULsPnlPwaZTAwXJkUedNzv" dataUsingEncoding:NSUTF8StringEncoding];
	return XoBLZFdcCdT;
}

+ (nonnull UIImage *)XtZFUMEgGBOKU :(nonnull NSString *)duvCZuwYegvAAcXdwW :(nonnull NSArray *)iOaxQspwADWghktoyt {
	NSData *YLqRXhSdoNar = [@"qiYjxwVStoESXndqzvXcBBZVxBlFVbIuRkZfGiPnsshXiBZZOwyPEgOvknxWzlRhKFIXsiWCzYJUXBDXjcUXQxfxLbMzjatnMZefzkhCmjdtYUXGokSUoMwlevyGLT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wEBBjgXueyAYuPFvIe = [UIImage imageWithData:YLqRXhSdoNar];
	wEBBjgXueyAYuPFvIe = [UIImage imageNamed:@"DEuRjpCZlBMfgODartVvMYRRHtDqsNSSRmHvfQHAnsVJpopPajuabOwnchJpCNgyFsCiLInVzhYtrCMrqqqvPaNSxibKiAnVLqbAiLukwd"];
	return wEBBjgXueyAYuPFvIe;
}

-(void)updateConstraints
{
    if (_dynamicCustomConstraints){
        [self.contentView removeConstraints:_dynamicCustomConstraints];
        [_dynamicCustomConstraints removeAllObjects];
    }
    NSDictionary * views = @{@"label": self.textLabel, @"textView": self.textView};
    if (!self.textLabel.text || [self.textLabel.text isEqualToString:@""]){
        [_dynamicCustomConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[textView]-|" options:0 metrics:0 views:views]];
    }
    else{
        [_dynamicCustomConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-[textView]-|" options:0 metrics:0 views:views]];
        if (self.textViewLengthPercentage) {
            [_dynamicCustomConstraints addObject:[NSLayoutConstraint constraintWithItem:_textView
                                                                              attribute:NSLayoutAttributeWidth
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.contentView
                                                                              attribute:NSLayoutAttributeWidth
                                                                             multiplier:[self.textViewLengthPercentage floatValue]
                                                                               constant:0.0]];
        }
    }
    [self.contentView addConstraints:_dynamicCustomConstraints];
    [super updateConstraints];
}

#pragma mark - UITextViewDelegate

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.formViewController beginEditing:self.rowDescriptor];
    return [self.formViewController textViewDidBeginEditing:textView];
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    if ([self.textView.text length] > 0) {
        self.rowDescriptor.value = self.textView.text;
    } else {
        self.rowDescriptor.value = nil;
    }
    [self.formViewController endEditing:self.rowDescriptor];
    [self.formViewController textViewDidEndEditing:textView];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return [self.formViewController textViewShouldBeginEditing:textView];
}

-(void)textViewDidChange:(UITextView *)textView{
    if ([self.textView.text length] > 0) {
        self.rowDescriptor.value = self.textView.text;
    } else {
        self.rowDescriptor.value = nil;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	return [self.formViewController textView:textView shouldChangeTextInRange:range replacementText:text];
}

@end
