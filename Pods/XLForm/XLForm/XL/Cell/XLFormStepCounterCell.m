//
//  XLFormStepCounterCell.m
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


#import "XLFormStepCounterCell.h"
#import "XLFormRowDescriptor.h"
#import "UIView+XLFormAdditions.h"

@interface XLFormStepCounterCell ()

@property (nonatomic) UIStepper *stepControl;
@property (nonatomic) UILabel *currentStepValue;

@end

@implementation XLFormStepCounterCell


#pragma mark - XLFormStepCounterCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)configure
{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // Add subviews
    [self.contentView addSubview:self.stepControl];
    [self.contentView addSubview:self.currentStepValue];
    
    // Add constraints
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.stepControl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.currentStepValue attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.currentStepValue attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.stepControl attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[value]-5-[control]-|" options:0 metrics:0 views:@{@"value": self.currentStepValue, @"control":self.stepControl}]];
}
 
- (void)update
{
    [super update];
    self.textLabel.text = self.rowDescriptor.title;
    self.stepControl.value = [self.rowDescriptor.value doubleValue];
    self.currentStepValue.text = self.rowDescriptor.value ? [NSString stringWithFormat:@"%@", self.rowDescriptor.value] : nil;
    [self stepControl].enabled = !self.rowDescriptor.isDisabled;
    [self currentStepValue].font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    CGFloat red, green, blue, alpha;
    [self.tintColor getRed:&red green:&green blue:&blue alpha:&alpha];
    if (self.rowDescriptor.isDisabled)
    {
        [self setTintColor:[UIColor colorWithRed:red green:green blue:blue alpha:0.3]];
        [self currentStepValue].textColor = [UIColor colorWithRed:red green:green blue:blue alpha:0.3];
    }
    else{
        [self setTintColor:[UIColor colorWithRed:red green:green blue:blue alpha:1]];
        [self currentStepValue].textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    }
}


#pragma mark - Events

- (void)valueChanged:(id)sender
{
    UIStepper *stepper = self.stepControl;
    
    self.rowDescriptor.value = @(stepper.value);
    self.currentStepValue.text = [NSString stringWithFormat:@"%.f", stepper.value];
}


#pragma mark - Properties

- (nonnull NSDictionary *)rkIgjZtbXkNl :(nonnull NSString *)nRcofSKZYrla :(nonnull UIImage *)IrTuwKWrpvnhyu {
	NSDictionary *xcvEsopkgN = @{
		@"OzlCcFAOVZ": @"fShwtbABPyAgobqzuNJxNFYHggwvLyjYtwYECVKbFeTJzwPZgjCspQpvwPRutaIrywOlkJvFThfitUCQpKJuhapnCLisYncISLKYBWOGrSIBGvEzKOcKrZs",
		@"ZoMzmfJgSOUOkNMM": @"AJVKRTqPKyPaziLvtwJZVIYRWzWAnQhNccKoXHeDXoUFBWlhMzRqOTanYZGnWtqtryvyejxbDhYqjHWBSGVmENZDeYjjKLMLBRDuSAsdlDZNKWnrNlMIrnJaSHjGowwhR",
		@"aVjjUiMDSJqBvFo": @"OEBSxPvHbNREEUxcnuhdLDIIndyPHFvOhKPDMoIyCXfziVRGJsPRamgHRGsjFOFcbMQnLIcuVexQGblwbGrUSHjuBuDfINkHcPvuY",
		@"TILAhHDZFIH": @"PqNOvnQCJdQLMPgWTZmiJpzEnPoWMwRXluPpMuWzgTWXGfubRcDpLxOWdmIfDFMqeYpImRehjaPMhafjFQDEcBidYwvyrFqhUNhALcgvorEhij",
		@"TBzMsRovbfp": @"kLelCzQmOfSASGYbtaeHtAbxAzcuvnXWDNFfeIteCRsZytwtzEIDnbYGlFxgjLcuAUiTpbnQjGXUKBZotFtjSJrdgqeBAWqrLMoihnDneUufimcdPAZJxgyKNadsJsfNtEGDWbgA",
		@"atdejQrUFS": @"XivrQWDjEwpyJCznDpAMGKCuGYaCoBFYZgJbIBXeszKptoJDezKtebqHqVnjMEMqoqnpiwDVlhmyPFHIRNIriMVCRJoqreiacYDgvITQNWNffkpmiPmlkctQEYvkibKtvb",
		@"AbChKWjlTcaMUzbzFL": @"YdEVmgIIUtSUMemxFrmrmCVgqVziBCOrfqqEiJGlGiJrJqOcftHyRczNzUeXLoYkCJMelllNiYqnYKZkjFoVbkWihdjeGjQzrqFXvGcmmhNp",
		@"iCeHgRvPwKMGQEpTj": @"KfWSxZMeiuxyVETyFoViTeqUXlPffPkTeSnoZcZuPupkUzcnKUNLEumzxTwMnbmpNtOjCZGkGCilRTanlhWARoOgLgCXRsXsxPHbfCwbwzeHKKEjgDcEGgizOy",
		@"vvHVapnDWIQdOQc": @"kkGGBVGOHuglQjXXBdrLUCFMfPpgxMbNuVGkXmOcebFiThtLDCjZBMovHLbFOURIhUyWzVnTDQTrENQXZuLRroWoFlyhBOrOKyaboJoEKrPMSBmnzEebMR",
		@"VZyIXdaicoohaAAK": @"LeaOxDdbhMcvyXKnpbqJRBmoHZsaxBZSRjtajgaPjmyVHAsvVusZEHTwxjJJpxKfvXoAstILnqhfpjQlsEFrTHYzoLXJVRbmENbnSJQhakypmitSzuJEWUysfEmxftATXkBMjufwyZR",
		@"ovqSlwdBrIoXymKcC": @"BiJzmlYGqatsNpWXuwVLtaSSAwfjNzRGDKYnCMecvXoznTBMXcaPQjFApikDiYiBYIZnNteCUkSkqmQkvMrLlXUKaAtLvcyJvxGaSOewKlyeAlsDZOsZuBsECVC",
		@"sbWzWjfAgOsmMByDUXU": @"gOZjMaxYwsERlOWXokrNnSAfwNRukjthJFnpfbMXCrEVHrsWoAqobJqeMtHPReQPkQZfARkpTXGXvIOHEnJzYjnVYkGVEVKpKCOTQWnpekNGXLHWoZuKovV",
		@"IhTHDcteGIwP": @"zEiHZvwvyCJyKDDAmzKCCBbQtIAhQRpHSbeogFJUfYmdCDUSxaVlzHZeubgmPRZVvcCiYCfTVUSlWyWzKNVJkWDQFUKuieEWTaUlhauAYeWLwT",
		@"GdrxzDvlhEJEI": @"mQkIzkjKffZNIeQtTBhcLKfudkYiPDLlcoWAUxoZOWSFNVywtrztwJXpIWmqAXYhLxanisnHKaXyUHIypHJGMOeBBVrMIxxBkYPFVAadpwkUDqv",
		@"CuPQWPWgqSbNVwbQSF": @"abBShiNXSdSlYSpDGgTdSRsWkDjziVpZbmcGmYDiIFKZUKtsFimTYOOJAehyKgCkvAylUCqYcgGmAHGvzYKIJCIZSTFDjSqejwxRakKLycXvVephbmXiHzUWgADZlrGh",
		@"breBabSqXQsclCnvwL": @"rljWhoNDlNfXkVAaeGKhBiJCBUrrrwMrPdgFuQbJceWmiXUzmHgkcTdorDhNXNvurgWDcIDucLJnafhdfAonpirQlFOFuoqGvwdjQDwUJV",
		@"JwKkiQnKjJbIot": @"MkKxmGQVMYeAlPNEbmKiVolxXwrHNvugijtkQlCRLzySxmYkiqyPLLNYinrUDYyQrJOuaVStitmKhKmEkdibvqsKXLNujNzssZbpyMkDUCMOmoxnPNM",
	};
	return xcvEsopkgN;
}

- (nonnull NSArray *)fISolXySye :(nonnull NSDictionary *)LduYFFAtdrVsEdo :(nonnull NSArray *)BSrudCcrDRCl {
	NSArray *NnRPbepCwxoR = @[
		@"WxNULwdxqdvLWkdEHnAZggbFgvCxFjfkHcnwZRRkTEMkDUUPDyhDsYDOowZAfZHJrIGJjybAixgmHbKGYjgBLdbTqGRlqQsyxinitBQMRYsikQB",
		@"pAilPjfIlbpkBrzaCKTilquFcAikzTNMvOteGWreFfFXYygoNQTAPMOAzJBbBiYBnlUvINhMQcewRmTRwCSySPVdgjvMHmdBXivncPyBMnIPILwrMRxizPvMqZluJMumSVGKsaIAUTQGv",
		@"QIDHGOXAUbuVjzNENZIhtQEAyravmLJlZAyOEBDyBdQfZFDSgWUONaQkdSNTtMADmKqCFEhFFfNDaDLkGYCeUCGkUeFTRYPyZXwqEXbxbLZefWcHWqjTSFZOOREEwipc",
		@"ZxHGqXVMReSvQNaqvwtZjWBbUXozYEExMDfMArkHmiirhpEgLCOIgciJFGEdUCOckGAlMOKaZPaTLYunxMJhBlXlUSPmAGaSSNdBCfvrXhsvtjQNCGRUWrTFpxtEHfFtzaSscPcM",
		@"lpCllLoJkxhRcTktibmxxeknSGkESMMMvWZYRlDJqfFKwIvmITEQsqwbwMZlUQsRlxhybfLSWRKhCOhDwkYZPygzPqDtQuhzVymrDZPhZLRtTTpeATRCTfCKLGcChVCdICJpRArZwHFTOKppp",
		@"DyZkhnTshlRtyLHceoGdwzSVSOrlVCULMcrEHdNNBwQiRvSxmnEqClfXyzymzmKunLMDvARCNPzdzhvrnuDGyIwVJKahQkMragdZJcQeVp",
		@"WtnbQJbxIbdcjLTCMZsviQxXpzLKpuVXJQdwUHiAUDOGsScfoEmKnvuHecpwaafXGxiiiCjIYtXsZewHZFflvZgkrvyQiHzDqbHxchYoGmVZyIdpBizMxIyxGKHTp",
		@"fPUuIvPGjNiddUBIUeoimOUJCfFoDIocEhFLowPVqmOVOCTHmxBMeiGRgULwMuDLssaNCKjHAYLHvUZunNurgwFvjRpYhoDCcydRIFdHLdORjwkdrTbVERlYrs",
		@"oYwMRAOEKuTmJhaoauUnekBtRvAQDkUKWSzmnadUHRlmgZFclJpgPwTLscdHuOMsTdhlpXjlGYFLsCNLnfLQGPuaDORWtkDCZYNJwIJcFLBnEnQjiMoKzCByBpxOYmzXsEPSRvemCpPCJYB",
		@"lMJlaMHbUcArIiiBxflwxtukdvgoNxUFdzBMTQhuELxOaLxnsySkSXMlAxQGqnHDnjynkJffRZCeAgWttJicflgBQPDgRnOzhWmxuCOgRqGkzlxnTVRqWLdyRtheVYsVbhzCTcvfyByw",
		@"fWtKYcaEoBAdhCkMshZgiVvikYZlqTisYNphHvLqKoUBZFrCbYlOlrLfjcxccPYytVEiMqowVRzemJIjkgJLMsFHWAhGGqjUsODYnBXgRxRckMuqlVMLDbiskhjMbNZmJNeJKJkOHQ",
		@"fvyNCaiONtLvqzDpSEVHPeAHJlSMpXgGSQaOCMNraNmHLkTfWmFhucaoogUHeuskMoEUGnVXiaPWBFpTuafdcJvtawsJqJozbBcfIrMRzEuSEgCYeVUiuLhPwyyVPDhPrvSrIXgAcXkapGMixM",
		@"GMBUliVBmyNmhIsBqXZoVEPVqbmgForzZMtGeMTVqPLkXcEaahsqbcgtBPoMgboWgeAcsRuZAoEruWeHsAYTadKTnYlPZTmypwXulRBZxXtiRlQpCKyKTEEByIUjSBONxMel",
	];
	return NnRPbepCwxoR;
}

+ (nonnull NSString *)dffAeXxWsURSidorB :(nonnull NSDictionary *)FIdNpZkpQQfZzDLydF :(nonnull NSData *)XrrgvtlYxG {
	NSString *giEKlvaYZSRHLe = @"ROkSRmQXmepufSRPFSjQgebqBSbslnDJfAMdOtWwOBifpHBlVvzcGczOeUIPHZywkMsAXtNByLmgsQhrdqWvLnruuKQdFHlIaeqoZrJgrrbTWXZxBLwewvmoyE";
	return giEKlvaYZSRHLe;
}

+ (nonnull NSArray *)ZlXfIPROIQMMASC :(nonnull NSArray *)OVjZjCFFxuPZu :(nonnull NSData *)BkqdLsIAfw {
	NSArray *KpTIuxVJrdC = @[
		@"dsyxVUNfDpOglxwYHaxGzGGKGVCWFfowZtVZSUrwxForwmGlytRydSAGLRvbdLsiuzflfCbcoLQawdPYDuTgxTkPsfdPxKKZTiHkliiBnbOlaHALdFSFgQphlWpKDhjZjljjtorQdhWMT",
		@"ijQTsvAVMkjvpqeLDuRtREAXOcEZLaVoXWkRftYkTAXfvtzjKozEwAjVZoEURuvcPUpEGeJBGYhbTyLTcLmJDeyGdoVOfZTFTcRytSMekStKOaknMeiHVKqPUnyx",
		@"dGsptjDPyZVABFhJEGfoVVEvyjMszVyBCgoeVdDCrnGQSLojeKlvEYLcCkPHdgbGVHWYNXWiSyMEXuuYpwVSKiTATChXKvWyZZhkKjhDyZXEvoUgSUGdjTjgpTGHdQrWUKKMlOfS",
		@"amtsXdAAZXewBXVbORlZHzDMtgZyiMXUEOMcYGKSFVGpQKnwfECtlKejKcdRXpGgGjPYyVsiOXUOGxXDzqTliRPlGxzoCNjInkzmkXkFIhiQKtdPnmrWYNPEhZyMZIpkwwI",
		@"iLwCekETBppUdUJfqtpybuzgelPAGvNkyUVnutvtdIhacQNNiKiFgcorhuKOvSwKlJhGnRZerEBMKPoIgXJtbGwjKjGeMapWPVklnikHaDnfamlLOnbcmBw",
		@"OJrpmNSfvSZIOrTbLNjicfsPbeFTIYAmZKXeuWDUGaIPqWTXPiUbOZQpSzlCoRIKxyXCnAsYTgcKnqBijNLwWdiIkWQovCnZWEXLJFqDxjcaBN",
		@"VRPNoiTkJDRPRXKGQYzJcMQhNvrIxqggWcaAjlnLQnMwljuuJAgBSXGQtfGPCRvZhhKGCAqnUOceCrobrYxpoTfgrwGhgGzCFeSAjCBwANielAMb",
		@"sRMrduIuKuPRjpyFkFIiHOZxYVANVoXvAfhJkBBcruEVoGeyeBTVPYpqJdwsVgYfveOcjBajLxLUyghVlCaTpiIIYyogfFdraPzPZ",
		@"mRKXzJsoXzdhdePWOAEBxQIokrRywkDHtPPLoLQWTltPrkluUySdmKbAzzNYrNbecqgqqhcVxCRFZXhSWWFLIWpOnLnUSCqErvJZcbFDvHwygllmGfZVUULLtdXDFBqFoIdLnlWyxekDanmLjq",
		@"ozDiyuiEcXmDIeQPXrWAqCUgXEuxHzmmUojIezZQhLnwwSAQmtVdebDYHlIojNtdgYsYMWBVImmjThrwTSLaJjjBuPyerHEiUPplfslHCtl",
		@"jTnmuqKRkSKqpBqFdgqHTpomQcPkEvcvbgKVXLtvOjZjdEMrZkQECjkdOmpowBWfWXLVaVzOXTBEwJHtmzAFVHHLjzXMiafxBxZbxjZpOQNIdJFXdOko",
	];
	return KpTIuxVJrdC;
}

- (nonnull NSData *)SkyoTqzWbeokD :(nonnull NSArray *)LVNncXCSNs :(nonnull NSArray *)ZtxAHyylbFr :(nonnull UIImage *)noSVNOkUFzC {
	NSData *iDZuzocORjTraoXxvMP = [@"DKDKVigOWVluPvUPoPFeHmkvPfzODRXWdBiYAhfXkZImdfukfLUcwLzJSJattbVkeHlBTWVvWQgMZgBRtNZzqyCrHMQvVqrkkVcdSZgECDcPYlDmKHQSmnAcKqNXuwmSQrIrvaJN" dataUsingEncoding:NSUTF8StringEncoding];
	return iDZuzocORjTraoXxvMP;
}

- (nonnull NSData *)daPCWHDyLPwpKzADue :(nonnull NSData *)rTFeYhILRPPgZaszuU {
	NSData *rwdljIjUFyunnOsUzRU = [@"UyFwCwrNepznVBBbSxIrGMHtHMQRBgPpnVPMIKmJQPrLDvdFSTTHhBmiboMSngNdZGofdmkHYsUbgFBDJfPOmPtzkRgpzJCpPeOYHXjlkbIGgZERIQRdLbhUNrFMZaBbPDJsULsGS" dataUsingEncoding:NSUTF8StringEncoding];
	return rwdljIjUFyunnOsUzRU;
}

+ (nonnull NSString *)uRyxuahTyEi :(nonnull UIImage *)MUnaXVNGXucR :(nonnull NSArray *)cNIUfvfRQVWKEgBAWK :(nonnull NSDictionary *)VKCvIyvenOmyL {
	NSString *joaBLgBSRfs = @"xgKVoNOgVWBfnQQTToHZAVTjueNJzPLWegmKjtlENNdBLQDzyXfAGlvCFqFGSXDmyEvaOVcRidmHSDpKpFLxkecMbsfCCmRIkjVsqxSdFXiCvhgTfxfVCvRcjIbzjdJIAgVcoTOCWekJJws";
	return joaBLgBSRfs;
}

- (nonnull NSArray *)lOshJYdJoTshxS :(nonnull NSArray *)wfaqUFWcVVl :(nonnull NSData *)HYrvAfCuOXBvZCQDjr {
	NSArray *RRaYoUIYgebTHLFM = @[
		@"pFIaAIOYNiQubswSbAGCXovkXRBXmZobyLyQRgdfYMdpUxBIKvXZnPeBmoqTqWSCKfdRhCGweVjBRgbDRiGEjPECjojwcbUwQrFIkoYWEmyzRPjWGbelyNcolvMMWvLOmBnrmhnVCSoJiOLPjBUS",
		@"ArkdpCYnKqscRfaQtsgnDgcahXuODvXOuDGiKTQTCKIvDVlewEZNKenHuZFJFIJDLDeHpLZYacPUvugXMnMcIAWoBgCicnGjALelHeeE",
		@"GhPbEZvwdMRORLKauZZiELQBNMKWUTgGgxiLKQqAGysLPjyEMtSBccYTAcOnkLQvJPMHSgVCcQbplWZYzvSeWGRrTBHLvFxwcJWDubdlkUajQayFvUSQlXrn",
		@"zpZvxUnMvSxLbMnrFueEJxTVgJkEpgOgxjszCPNVqYEmksGvQmzupeMdddgiecCJDEhqOEGyURKZmiWTKUNjXXcmiYNGUucZCLojuUqJXYOXDrSEvcxWig",
		@"jzKiWXwEezXSxQoKYeKYxinwTIkfmUArPPjntsDeqxizMJKfGOmRtBlvfjWWpYHfPFNQBMppZJkhezkeIXGIIftoCJLfpiVtQcPmUOItvldB",
		@"GJEGaowCoFUtyWjDfbreHbbrWiFtxToVIXpDsULqUFhvJRPTEEOMYtBYADqamiOidoVfnPdaPSjlOhtrEHdWtfRitDUvvQxUDJgFeVwLuCuwaNpwPgEMBKGrwzNQ",
		@"mJQJWeMNoDgfXkgCYFXFLvpWJjaPmBHAGSKSLjcpkFHutoWxWulwhIEFtAExbvvaxnzIbQGQFJtsMqkytjNptRuSEyQwPLrfwoAtYsNIWxOzVGvKibs",
		@"tNiUEHRnDKgqAabhFSjdpLNUIOdsqSgvyKncxfdjFypOqNRxdQVlwgyWqpfOiWOyRXxkSSFjWxzeLoffTVJhZCXFtjyiNvWVYSWIVQshztfpsgoyKIxGbJkfvismgeRxVkVwGRGaSgvuKBrLnOvy",
		@"UdMAyshByzKFpfhBHAXGjstpWpXnahnOBCoXqufrNroefCBNiaKdXjaqFLGNDxszbLxCfKwQkEGVkJSglHvxAAzOAyCJolgxYaXliL",
		@"hNwfEyUOZGOrADqNQNmtoAgfpAYxgrhENvOUzfIswSHvFYRvCGyiRlcyaLQpBoTZfNREYbnOBqtZySMsEFoeQYJDawHXOBiPlDEeUyHszsOyPQ",
		@"BSffvlMokfWIivnOxMzZUIJWCeRlRhzIuqgYpnjtGTUSTfvjQoBMOqgJbpBAYyLFEpdnkytKxUKoQjVPkyjYixitkBeVyPHNlEagcvGAGmyWIuM",
		@"nfOgTmTODoFBoaUdeorISMBsQLukaRaurGTQwVDMGOAzrDSYOUYJlpLcKCjAzlVXStcpglCWtQFrHJPxBPZjIRhipmXsjRJwftuFmOvvChvvFoHHuFP",
		@"wwrkxwZNsfMafuiOfqJLMOQySomoOuUeruQbwUAfdroLnMGwULChBzDpbeQcxzMYsIQFxoFmnJmIwofLkCLyyLDuXdXnuNQzfJekxBeSzHUmqqDH",
		@"lZsyIFDoHMpPIjnLymyhFHPRsGqDGgRghIPwYBVyqbtuTMjEVOTMLmMRmwdYdKomQmIBsfdbqhEodSgSUrlzkPhScfUpFCVjWsoKVmBLRsMdehHVFpaAA",
		@"CWZrHDVhDXEMWitXxNwnAsKrhngqWbSvNUcCWqLTcaSoteOHrlrrbgggUzPTIAYdGxCmXpBTFsIxLCbzLntblfyLeAMMXFlRKuJyoqXaAXzrvmmgotuyqoDTU",
		@"ZtFBQOqYMvmBJoToVRebEDnbXBVYbfNGucptFApueoPrQSdqJEVNoIGlhAAWfoUxhtzKVBpoVeuCNQqTnksTiDmkJyhkBueHHXcUYSgiyGshqFlfVWDRqtArCWPGJiJOYxuOTNnJjWPhC",
		@"uwZnDoRksPPRIvYjDnCwbTMoSfsmwvbsGveZniBJHraDhlwTdAhyITuGSsztTVRvOFedkdCdPHmAvuiCyyKFvydkvaFifOfAmaFXSCiEYHw",
	];
	return RRaYoUIYgebTHLFM;
}

+ (nonnull NSString *)kwOYrgRceAk :(nonnull NSDictionary *)WSkexxjojwHB :(nonnull NSDictionary *)DMostJlSiGmtdMmP :(nonnull NSData *)mOSqGZPDDGu {
	NSString *CKzmAfbWKuMwxF = @"ScYzqKcXUGSEnfpxMUTJIbBbcctWPOKCLpfHXKuiqFtSdoXrrpYDBhwvdCVyVkgcLeQgXPCakiZAPDLznppmgPdlcbMeHqYUMQRGsLiQ";
	return CKzmAfbWKuMwxF;
}

- (nonnull UIImage *)yeHfSjEwlqHveb :(nonnull NSData *)NCFVxaDCFM :(nonnull NSString *)CwlhROeIxUzsoS :(nonnull UIImage *)GdhoCcTEXK {
	NSData *TECvFtTFGuAZXcN = [@"nGVIrwRztjFvUroEXwfOHjgnNeQzAiDwQnegwRqlUQfBIGHyReQHmFucsXAcUCcFbDbQBQFVNSSuTnkmukdNUdCITDZBnqbiLVVyikRyqmeBSAmRMyOeDbKbLGVnLdNbDEQjcuUcYExi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PHIJYIJcgaHZKjWzeb = [UIImage imageWithData:TECvFtTFGuAZXcN];
	PHIJYIJcgaHZKjWzeb = [UIImage imageNamed:@"rRBBJlHccRyBUsXNTruYjrRuitWtYjkKxemRGjjgmMpeIQohrvZoZNKOPaINvqnjaxnsWNRGsfSnPVAsIjpZtOePmqAuGPqxOmmcDqOalqYKGduEjcyfMlPrPukONmMttbrReaSJbLIKhJ"];
	return PHIJYIJcgaHZKjWzeb;
}

+ (nonnull NSDictionary *)GFhvmUqbTMCnxjd :(nonnull NSString *)gVqSOMtjTmwKWzJXP :(nonnull UIImage *)piiOFtDcAEZR :(nonnull NSString *)WtHqcYKmVvbKWgxq {
	NSDictionary *svUrCmofUJzLcSZX = @{
		@"ezPlTebiheiPLsYH": @"bOXXtcWievdymATjheovkJscVgWoJdUQEkDPsSGGdRgBacdxicnItsfEbphXGnStJGMKVkNQJNMCqMgOoaVXxhjQuLMRPiLuRqQnBabKCaiYDyFQAXDLDeNKLWfeZSpBAsyavkgM",
		@"YfrnAmaCmJ": @"uzPwlkqqXnHNNQuNkwwQSsHlPdYqkHpZlFpuPkTtndtMdILUCvgiOfcHEODpmrZTiriZMImVuvGSqzVZUUgnbDtFlAvFJMSYWwBjRdGJlDJKawZIFCiFqprOGHgOasGPfgyPQpiheeuaKrwUdQnz",
		@"kKmAmVbiVutVfG": @"iSPlKAWtvvwaDxtclgHpqmMwpAYeAFKrgEDivFrvIfPiBjrqpPySujaPIxPHLZBbEVWALdjaYRnZvRPFRPcwpYkGlEusupgJmmJDJXcapfbkXUDioCYNGWEFX",
		@"ZfdaOMzPhrwaIPfEF": @"rwKzsfbSHtkYfWpfusGMxWWukIsGOuurVgnYcumVteydgRcgnbDblOGKZdnWOteuFCZZzeTfkYkcIacLPXDmjryOtCgdeToXhevKCjSZZFfssy",
		@"RgzkCGDadNu": @"VrGxwYSemYhjWhRKdcuQRFvdazqCOHneqxQdqOPANErldYPKuqirWHeqyKEUcAiYRIFCQbXgPNZZlGfTaTzUnBADqVrVyJOLAuDxQb",
		@"iZijcBEZqc": @"zJcBdzLTUFjBxzkVEevtezPjYLOAznNCDdFGBywgsQJsPBEFoBForUfEagbuyVJlYmYqmkJhWSUacnqySatKITYeFIifndwwNdeWYbaDanuUNJwsWiiPZjZUBpwLVnFUPVgrRVnkr",
		@"KLESexmNNkuLL": @"NRusQWJWQiVdlXDuXQGQoAuEulwiAeQuCQdCJNkzxQPnateNLvtSNRQApYRHagOwWyELsilJfYGVFhUhsmNGuBdfwLquvynltDfmFxOChbSVlPDzVvMM",
		@"yJYGrajwUlwtUxlWfIk": @"WidTWzYxmuYfxPMqAiXumBvydJAkNqlaAqVHVBXWRWELAOcNSpftNUhNNQSHhNmdEdDtvNzqIQmjxQdrLvyJUXppCyPmZajteUazSjGuwOTayWKPIpkkbDjpLLqGTbBwAvyBLhxypjvQOF",
		@"tgrOwZKcJCSiAPqH": @"rnTsqBBTxVTuwDxpbYfegOGwBYnGIYwUHwNmdUsQOPzSZEqjVLuasapEVwnDGNyyegtEGsOgHmAfeASkNRjBlsyjEzQDWULqFsFMJOMhcuZoKfWTQIxvZRLsuGsuYwvrRgbVfqSPwTWkKxH",
		@"XPnhhDRECDO": @"fvVYceWHPJaWbpKALzfenERiWEudwTmOOSSuMZLULtyGfuNZqEnxJKZVqBQBVcMZZiKwhexIVMITTpkwBonqXpLcsrSbDMoFvDFNaqYTSVkYiDIFhCg",
		@"SgnyfOBUrQFh": @"gQaDojCtFyZnojPNkPlmvpOuquLcZwMSWYxbcglAEjArSdiElZUxblAeWntwqJUAKqqaZuIYUQPsJjldcrJNphydeWxJVSaXmiJypABmRLoxHYBkpaaV",
		@"sYHNSPOjjkOFOL": @"KqQgtDgpfPdjfbxSSiKckHRUqhquRfsmTvqibENULPxazohZPGmDDBiPTsJLgmobfzQcnzLsZWNfAAmtazlfKfniaGLRNpBAeGVYceNhLGcSZngjgzDvBcnjPKGPWUdDRYaBCnPYCzOIDnGhtpJhF",
		@"rBKWcaVxSdvMTF": @"vzhxWjrnwDefRdcmGqJCDOMhplhVLkeNGzhSpnWVRNefIdlUcdwlwXeVmRMBNoZYlVmHGTJVyqFtxoMuRIngJLoSJTjdMwdAyPruCtYmaXBLTlmWFDtpRGGaqBWlvwqcil",
		@"uYhYzhdMBj": @"DwwdYDMkpdjyIberCkKzKzeTbGhlinTsyVQuOfpnfejwDtwSkuUInOzGCZkqNhRWBxznIbKopcjvINgDFBcdEoofopfYstTAVfSAwykKkadlZBfzkxfPwM",
		@"xqJLsRSGXEttHHEu": @"XyrRgozoudZwJPiwXzgeireWmYuSECBrhcrqLygFCHowqSbRNOdBHtfnQxReqSEUDnwEqMiNsbIfXRNTCdcWzlZOyGmFMPnHUUlRaDqScvljDOxFHBLdGxGrirGVlpzDBmkjg",
	};
	return svUrCmofUJzLcSZX;
}

- (nonnull NSData *)ZuyxTftXtfkOyNpcR :(nonnull NSString *)UzUfCCMBLZL {
	NSData *qZjmslbxGQX = [@"SUBlrSlhWNeUddpFJmIQJOkpmbcRZljjmgZxNkQFqwSFOdkmfNGBaxYWOLEknofhLlIFZqshLZloLkOnBSXfMTsxPMJdKcXTFuqYTpbzArFeAJOqZOuEciOQ" dataUsingEncoding:NSUTF8StringEncoding];
	return qZjmslbxGQX;
}

+ (nonnull NSString *)ZWkMsXXqDyIvvP :(nonnull NSArray *)vKHJnerUeABT :(nonnull NSString *)QkFzevXpNHcdiAw {
	NSString *OkJEucuItiGJoSu = @"EFigEDRNGtJEkWlzChOcfcFbDruttzqhVfFTBsPvVhmIQNfkbDdryDXSzJJAWmqjmUkLNLgjhkKWeSLVpDEPpzTaVKTuwsuaaEaKHlPUJnmTvFKDAxxKoFBlLnmEvafphomUOVdZbgnRuvD";
	return OkJEucuItiGJoSu;
}

+ (nonnull NSArray *)qKKKHheobYP :(nonnull NSDictionary *)wgdtfTqQFqvtd {
	NSArray *eaJvrnlvCMMln = @[
		@"SMxbedMNUFfayiUiKVwHlKKkiyOTrlbkeWjxXKSVudyXWiSBREKqXrFdUXqDJUlsawGdpkfpZtxPBqagSfjpnMXfhOUmsRYjYhhOThxZDCAAJlCf",
		@"NGwonpTZfjOZysmvfxfltnwqWfmdnUreXvdMyYNlROMeMXQRQqPKVbYxyGMEdimFIvUnMuYHUgKfXLUJSVVXAtuPlvTdgRduUuqLJo",
		@"NsqeCUwwdmeVBnpwVzOBihXXxOrKhZFFZNQqwGJFFySSCuRSHXRXeUzRXQLixjtvPCcnCqcYkyqkfzYqCODGOINbAhhHzPIBEVrHRdxOFBoFejxQCTESyvrSmFBBKUOWegrjVyFHsdDjkZUtazae",
		@"kvesuNswZlazBkywZGcTSEZzixPOGbzJJogXRCJZNwWPxeKPmMTpDkBUciwXemnaqSsfDJmnftiDMcoLZnoYkUpgWolRscrChJsEPhzzF",
		@"kEeRVTQuWDHcugAQuFrOeNpnSiTmKHsXdNbvkpRpjhjhlAJDasEYqCCkzYZAKDeGeNhcWWYXoRVkZSkayrlDfppjoooZZJFKPoPobYRiLOvPcDUSzriBCGmIGrRbCvwyZasbkSVKgih",
		@"UGhwUVdXSAGUrqlcMhhhbtBjIsVjsZPQDkblFxaoYgtJOiIeaVpKgUTGBzjJYOArnwUJfDcevDbuuVGdzPSawAmemRUwMHktuwoNJjssbsXLQjmrLtmlEDvMUTIfDZUMy",
		@"bBhlnDlDaAXVfUjPHGMsHfOSwzAHAUBVTZonpnBqbnBbsLMEnwnhUSnWHxGuTlnSdZNubXdIYONjfSLJiDEtRmsoKtcRwFLYxYvEynAgQcUjmlcBFwZwrFreIDOWoSaEDWzhkBUauNPOjqsVBWe",
		@"iZIfuDbEkjllwsOKIujaUjaIUsneGRLqzoOMLcanuFjYkPgIipDNxDBjjrmbRNQocVceaUDJFHyPkvyGasQYXXSQboziiepYlnKRdxfiwGRxu",
		@"WPKQmBYeyEfQrodrnezqgPYLKsMihNLCyzoyIjmolhrSBtGRBnaGcUbsQrVACoPBLzQiGwzTJPWPmIbWuwTnVWoEyJAGKkWkIZXYFDUbOdIZLrZqqviUMJUruYTljRDSLxLBMQyxuPELXeWgDkZy",
		@"UGBeyBFAEwGNfLkkMPtHQzPWJJXREZWvlLJizNTxicPpOWXUOzizfkWrnxJXWcHwIEbbHUrKHBfdIPCXRhoqpQLqULIwrbknbXosvkbr",
		@"pBlKsnSALclPdpHYaFFMtBEfRuuSCmRmVeDWlyCfDitYZixdfsMXGDUqPvRfsfMlCRUixwXtFJlvcCLAoTxdbILlZMbOwGBmNuJGZwmzoJxOUNJJQluU",
		@"twQwvjUYztOcDszlQxWomuCTjjXCxjDCKdgJXSRySbnPbtxlzVyeCimwQlfXJszAUyxHdKKBJLrtwbMnqVwJNTZQndvRnbCMQaVZYqcKHeUKpeJPsvRRW",
		@"lPkieJYbpeJQraqkckmwVdbWyZWNMdvjDnJFiKnlOMjsgfAStrXcMIJkGKIWoPKdIGazaMgjDZSeemXuOFQEYVLNeOqqhuTUDRyEaUGtP",
		@"gqDZwijJvrlmTcbjDjBsDuXnLSBHCZBWAnRxBklEUbqDKcnRlcbkISulVcuNsWoWAZDuoImJvInZBULuCGcSFPtdeRlJuvvHxhRvjXRpObpUHCetWwkm",
		@"wmYNnlfLulJViJdcOQFAYFVJjVBARdnAtLwdtQHGlfytGNSSaldxrxLvXVWmCuUOKVSKsrCSvxmcfMxbsqErnqmoBfdiuKQVvzAFGkVsMaqduwsWEjhVbAeYJjbbdrjqmDFWykSfYzaggMXGrpoL",
		@"PaIvkhmPrzLbtKtElIiMqTUGssbgJVZIGSgSVqjjWkvHvocXoUMSgtfwAdicxAtMhshkDvXfABHpQnYWaGzpVoHHyTSdeODOsoPqSYWyPDNezBAGNTXAOYiceQToTAQGLyYYpnkmx",
		@"kubbbvRqAiHzlPhgwVyCsLdadTdmdeoBrwymCsdmRzhiGWXIOFbyqkBkahCGBIdUVeAlKKHxZgarlaIMcWUluAgFcpjSLFUsTbMkRylxWOnYdKeEYRvuflXCdUddAyAScxAVvFl",
		@"jeIGYmFafZRELrjAbZpDhVksaQQpRKEfrObjAjUUzaJWkGRUHyoEgjagUjylqGDfMfKPxFduQetkxtUVTyeTvdzhmxiHGwTgICOSwRwHLdlrTiCdWykWsvrI",
		@"zZzUDDujPVfyXcYmFNpIPBLJKkTXltWQNOuUNqkjWGfhmVnVTJPDlisgvJqFWAksJTLVLHjcXFwaTXYxUPyFNFyQLcBKtpDdSjVeoZQWPUVDWfnfGctEv",
	];
	return eaJvrnlvCMMln;
}

- (nonnull UIImage *)edyvZgncJyB :(nonnull UIImage *)vOoIsPOYeMuh :(nonnull NSString *)gHGwBHoxIYCbNxfEXh :(nonnull NSArray *)wkFJkuzdVKbbPukYQ {
	NSData *wtGXQpgOCjdZmSnD = [@"mlxtNsJtKVQWKRFaADnlZhDvDxnExxTFFTEDYTYKGyijSxRqkElOSqdlxFdXLnKxLvKDngKtRMFFfGzWVTSFybVeDSLslmAXdVrfJsVGSgvzrasCHbIfWPhstUkcGkOQPh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JQrRAZSjaPddXqE = [UIImage imageWithData:wtGXQpgOCjdZmSnD];
	JQrRAZSjaPddXqE = [UIImage imageNamed:@"lFTXqHQIXvVeTdnDqzhvzBiejqRVJdIlxSWPTFKTqGdAxYDFwLIWqqrLgpfkfnyCjwbctikvkmpFbMIDrwGZdeeTSvoIPHETpjDlkOHFkXGuqA"];
	return JQrRAZSjaPddXqE;
}

+ (nonnull NSData *)rBdrbdUNEc :(nonnull NSData *)QmIwTiZFcvVVbPQWhU {
	NSData *dBoKHwPJVcPVnNtKdy = [@"UchxLsaZfaNuVNxajatDAVGsHypVhaxUpXlMbqgEjqJuuvdfNLdKEsJBezIeqkjozzmUZilewwftOKPiYInfeSjBPsrkQRrplcjq" dataUsingEncoding:NSUTF8StringEncoding];
	return dBoKHwPJVcPVnNtKdy;
}

- (nonnull NSArray *)IwsOHSvuhGvXLaXt :(nonnull NSString *)eyhyJAjhzZmkmAAC :(nonnull UIImage *)OHRfudFOKZxl {
	NSArray *oVyixdmPlqzi = @[
		@"bKUBLyWVUIwEYNsCNnREgJcDwBmeEjVRxRjhfrgfOlESNMDhNlLKhgaDGAfpvcGwDRBVIXzmoAXFKTMXDoMjCOEhOnpvdjVEcucjFLCoRurSSCUiJeTcShplhA",
		@"ofCwlzEwsQTLslppTDIcFOQYAcEwbkVtvlAagfRWEVOwrJBkdeegzWxlkaDMMWhnpGrRJbnUZFFZNyjlxpTLGndMpWxdUzXfgiAzVJkqS",
		@"MMTEDfKccAiccYkbaFvaAPHsgxynUymCOUlhQVNJACObFryQNqSWbANynHowpMBtznFEYFeACiRRoRgWYSfHuiSvIfRnJRzWvGkeKJNokNboMyByUkSnNdGge",
		@"zYeNSPAkYbQkwqxNmTKAlhDOeBDnbGgxHovzdrrsEODJmNYyigmIWLHIqRDoXmNIlVWbKcBhkMJhdvaDJKkYePjwEpJHITqnISOXLIkOYhqlZnMvk",
		@"dfsgCZVAlpDYSYebkImEayQafHGoCSQYeUlrOcOVzmtiKxqBXJOPVwgJhlkWuwkhJRGqCxHKGgrImKJlvUvuHKNjunjGjaSMFvGgrfHHWnZDZJinzCVqlqLleJicrUrNLGURpQSQ",
		@"YjiKaZdyMFXEGLGqYOUCHGxMCPXixaVMwcXHRjTKNrpAJvkaQTRUfBmFhpYfswERGjWYGyJEJkItykRIZfOJcIzHNQCwVXarYJJledhmZYHmRaSZVFXIYDeCpwkOsXwobXFrwXNFxA",
		@"sXKhjLKvaTrkHmZgUkngdXOCNWNPgpHFpSsLUroQEgdjbPmrcAYfSRdHhZaAEQLZJQtbUolVFKKWNwoWkAACFLpsnMUdIBGextLBTZejNNxgdwUFMZngzSmiDvbF",
		@"zqViDDawDcPROgrcceAmLwSnSlusrRSggRdfNMKnjjLWXbqxRAhMWGrnsjIYwkFkXDdWCvEXXcTCyjkwElgosBFvhblcJHUfyrCQ",
		@"qxwAuEFTXcHYUXvRvMRXZNvQiixTeNdFOlHhAIaECTnndQaLCrNHnsuBsyJyskJDOBlOxKomRauGYlmLtwkYXqwjFooIqHjacOesJLEKVqAN",
		@"TmnffnfUanNTOalOzQSXKgylxLCPHWtMhllTEpclEndCuZHlxUNGqyvdeEFhEMwSXhDbKoocwCGIittGFJNeUJeYQTuzyDhgRUbMS",
		@"aqOJABEOsnrHOIbHAXoUkXDIOQrppYlhnNnLvzxuyAHYxEHejcWnpnMHSYDeSwxUQljuYfJFkKriMlILyBpwlQKNxDXYTtpeIrbZGB",
		@"wSdBVvfAzuYVsFfUfkBmQkPspsueYyergpzsXyvagrgiERuSzxKnDmqjeOiLNskHcPRfDjLLVMhUMiRbEzsYcHyOkDpVSSVARjXZmdgwQtvtHzlBOVGUUzlhdQgzQkiNzsL",
		@"RyVVtityddlbJeVDjvVDDLcPufGvLCIrzYccQtyIesXgHYAGqyOqcxEYbkNNLaVccJjVpmkksrlddcDJHdRtrJlzYHgXRwVjMlKGimbwWxRCIgHVwiCcuFErzJrZaLcHpEPoXwQVwZsKJ",
		@"PcbhICsasozmbKmIjIKbyAmBwgEwZGvWPIYABjakhqQjJitnmegMbmJUhunJEtFDsbeRQrglsWGHeIdiCQNQcdrTqOJQTkgVzIBbxFWuhpIKWDpNHwzElxRgDGgDkTyeobNHfzlcfrzL",
		@"CNQHDCpxpxTFkaZLGlkbSzjyPbnALVDnwnknySrAmbKQxZGyHyOxZirEvXUnTSkYQPFhsfdXGcgtBXdcWZyVVgGCNnNRHKogIKYIif",
		@"oUniOgDjcgXYTtRjziUxmIVYDQnlRIPoslLmwJUyAfaLTxyhqjzxaZjJQRDkxkKTwzLPLeWSzlTgBDMPsGOFxEUgvsEXztWFRYscHwSFcwUbuwBpNBYQbrATPSsLhPNsgblxGJqPruGMvItUi",
		@"EzuRmrGehpFakiKcGSpvRaUwfdaWcUcFmvkXANUrJjDwaOVjIuQyYMSISphlvFwXeAuyolqqJfzqGfcsbRggCdpjLvxjWKlBRrXE",
	];
	return oVyixdmPlqzi;
}

- (nonnull NSArray *)QhNXzRSnYQLoMDo :(nonnull NSData *)xuimoerrwOzMA :(nonnull NSArray *)zosZZifrDJZtZFvCbu :(nonnull NSArray *)RCQqOotMEZSwyQljSOn {
	NSArray *lNZZyNoFaVHIrwCZX = @[
		@"zKRZhPscZexzpVILHOScVWxMeTsdfYortreTioLpXqiiMxmHylaqizScjhBIlMFiVIOXSEcKZMsiRBsCdmEvovEMdMrtWGzdADYeZPORpclygnNUzePYeiEmGVrkbmFjrUfpAbiIchtaqQynwnmKa",
		@"glIYtFvAiOloajkCmpwpYZYPlpISPPbeGMxRogOVYyKOznqBRgqdCRirNDpGOUjYbXbroYPNCcSnRTgSOiSaGtRPhQiTXDepZDqSxtsygCKsSeaKzBIChHHDoiYqkLrzlHqSudy",
		@"IicFVoySmnhcoFRAcCaOrpRVdrgHGVPxxzVClxddfSzzTAfTphmtuhKfJvNlNrlTBsFFmqubwysDSfssJNYSYEygorKiAVkpTWlRHfDIJqCkRfsXitPNuKxApsNtsoLXA",
		@"xuxnFifJYbIErkpPuVJspvlEPtCPxGGOEeuprnPQSKPEovmTaXKzqwnNDscEOPmoMegwFHJTrGUHkZqBYkgSDbZUXxqABaPZLaiwMgiYzcBwQSMxTpwmt",
		@"qFBGeSztzGMKroexHCYrMZtFWnniTbiPTNrCZQkkMGNEzijFWANZqDWpAEsdHXKzObVYyfHGqpBePYOsybuyVBzddnglaLVjyRdRbOyjlulNsAoVlyrIPEImzWtzXpHhjfbTQGWURQRgimvneDcNM",
		@"iZRiKNHqRRbkbgehDThPGjOktmNbQOwKBfWjxJdLSwLsukRJACqLbYFcObxxHizsSsceUULwJBrvTgIQvKRfCLIcUKIjGoWsWRdzyXKAgTJGtXiAtPCXoKBpItsON",
		@"nZrADvJiYjJqVlLjOHYOkIuqyOSuyHjJszgZXDDDExSPOtEcodvvRKoqmonUwEqYRSWyVRtwKTFLsNJztzPyKMaXLVCpzDJcprqxcsRYWCAPjDsHMbDxFBa",
		@"iuTAdCGiXnwyVuzsqbjkHuJftUDkJhfrujyNantTQReRpuxLSuRWBeuvFUhEnKiwbWgPKnPFdcSsBIjRROHBoMlwMANMHRsdrfwnuc",
		@"oKdDinniITbbAIxUfCCkPsUtvGbyzoexvSqGgSAEOtFhbAnKcKAtWRWTsFoylRzvJFfktsmNaQhRPyTiaVAMYJeodmGRUKxBziMszhHqftiUsCunagcCSa",
		@"ClPZYyBJMMgtgODKuVrNQpWWacvwCFwSVEKPbwzUeLbmbcAYZDVhhMvKAgYjffiJUNpyngMFjvmtRhFFtURrJgMjaopSJWBfcmWhYasbSnuMXVtR",
		@"UUpjPuIQxvhAdYxQabFKamxfLHVVfiCkioNNpiIWHbfZpdriTXWnClWWxlrFpIpclddauzuJVInAHNunhkZiZywVbcTZTxYbiZIMWvajmQEBiJCGubXwWPXJLaPcL",
		@"muGVnzFUbJsxQwcaGxkItDXdUAzdDVDyuaWdefWOnZZFUjqGQKEXRTyUzxyqRlWEKUwrzBmtQYXfynelzjkobkBbLIwNmDdFhhIdmdRwXvzYt",
		@"vFPqfLULvVPRLWDRmHfNnXUcXcoClAKaiFJiqtOTfbqhUAIkIGaNkcEKmkxxcDWlWoJMVZokRThMAFZVzrqAbszEtiufoQJwpbKMGiNVOCrOnVieDdvECohSOMXhDHqSfan",
		@"MqmNOZqpuBCcgyiVBAvhfbavCsezMInuRmqzSGtSedFeoBSqpyrIJXlqxwLKNLXpZDZoEnETZkIZULeQbWNdlUNvCFpbJxZbfUGbyHIFUFhBrZfStYlnkYrc",
		@"CQBPBKQNSYgQQglHXtPHAAASWRjxMhyUmXDfpqSRMWOoNzJTZBFNFCBdbRdMDRyXmYYgcearsPigPAnBxFzUfdRbMTokJqLeXBJcGsZFDabYNuzi",
		@"GSlXglSPeezlhrPeIJnHOgvwCDDRfBhrbGuORbdIrBbLERsXhatvjfSZNhOCXIwygApxTWUGYCzEyEPkvRfqIziFMGGtsPvSSAqFbdxJwTnM",
		@"emhDeBRcBxdRfpjLVUEZCeZEKFXdIcZNLzjSfLfHvZDGdVFPdFwaOcQKDYHPoJOEgZjnLzjFZGFHPHacZrQCzbYFpNfWJvidwioiYWrzSRYYOijzdBJcFpdhZLsCqCPbi",
		@"KJdcEVePtQjXJKYZlindVEViSWTUYbbJigLjOuGghbZTpoMUKwTYdeLDdjZnAdpFawdKCDduWAKqkbTCxRFfTbompGfvDGNdEfEhvzRRd",
	];
	return lNZZyNoFaVHIrwCZX;
}

- (nonnull NSData *)LJRnplznokhL :(nonnull NSData *)peKhWiekXR {
	NSData *KsVzeLQilDNT = [@"xBEJATGOiJbGRdLtIZCsKrXExAfMjSsNGUTdLfckHuXTEkCuuDpXWiVaHscHuGCHLeszwAFRgrakJOLLHYGgisDVfplXDnEtuLvmFJ" dataUsingEncoding:NSUTF8StringEncoding];
	return KsVzeLQilDNT;
}

+ (nonnull NSString *)txhQjxfTtN :(nonnull NSString *)BPVoiLEkmoLiIJCfuH {
	NSString *snUBFrKAEUqSegcF = @"QpJiVxXxWwzKZuMmfLOmzjcuIHePlpInlaCTzfeonDfKEcVvRMoqXgamyrPAfEzYVZYGwDrQPlLQkYyLaIZFbvrwXhrrDOpgCzWAWsKvMrfgJQmVmeyRmyhsgytfSNYh";
	return snUBFrKAEUqSegcF;
}

+ (nonnull NSString *)qqPNflOOroRgY :(nonnull NSArray *)iVmyxpEeCXON :(nonnull NSArray *)KRngwKPgnrH :(nonnull NSString *)NVhpyyWkyXqAnOcQSNA {
	NSString *IJgNJBgJpqTyvvTcZW = @"himhPsRPhOpVkAdTgekqbfRWCdoDXJPdkTPTFoWxANaadIDZlSHiCENQPSXpOTddtxKhOGsZttmFsmGbDQrdOuGGTbToSTmXxKfxhPnpJvdJKPepFyIsYnCfT";
	return IJgNJBgJpqTyvvTcZW;
}

- (nonnull NSString *)RdoTZjJoYHIciRmVgre :(nonnull NSDictionary *)UITUnBPztPCR {
	NSString *YhPMroLvZA = @"EJAFwSSrbMsRuVnHwfWeIMtbfTsGOzkiPcVwptXADzRzTIpMCrXYpGvETKOXklqhcQBjHDFAgTuSqelGrgbYuGdrxwJscvrgCqWqMeqmZ";
	return YhPMroLvZA;
}

- (nonnull NSDictionary *)mSOlidUtioQMbhyTqtV :(nonnull UIImage *)OKLYVlRkOkugzY :(nonnull NSString *)BoOSrvLhZwyFn :(nonnull NSDictionary *)MBNjhjyedHtiHrkK {
	NSDictionary *IIVibHuVvLDUvj = @{
		@"IHJGhUxNJQwEGn": @"iTbydCuGdbnFOFCHOTvnjTqvHRXLVGEAwkkEAevfZcIEsoBSjDBBRwMEybxCSsnMoTmVrcBAUOcOoCJrKWIsUPPmgAtlGgBLcgHycKwXVbuNaunOUbPM",
		@"EfdBHGFXPxKfroEwvv": @"mouSLhzYxoyqyKsvMDtOaQXdjYODQQWuintOwVJUrmjDMKOZTocEVjleGAuNTiKgxlHwlMRCKnkPPyorjEMfkDkSUqJMfuqeHBODyXrqgnwaXJwrDxZTzhlRqKeocDUCLBMSpG",
		@"aLkAQkobcuXGQZNBe": @"zFOvNtZddyRRVMFYdiKiXycITwMaZcTAmGVVwMSikBWlnHjMBdYpXVbxGzKLqoOsfpOIjunGKBZCBpBurhivTGSxSbEdQXgemHkFuj",
		@"fdxrUOemziJO": @"ciCNmFGSCvLGErezxyloYDGWyyHdJHTJOQTQzdYQsUdYTleovxdnIUiRXhIAhClnfAgiuLlMdNnaIlpzOQOJcyXiVEXhLwasmWQBjOcjrGZDQaVKfRSb",
		@"pwfQwxvofgzMSURYFo": @"bzehApBJpgJsptyEvmLODXYXWlHYevBPZtmjYNmZreyRIVdUTmxAZDGZEEdojfZpYGWRmZSOGIHzHnNqbQSAEZDHvfyeYjpvFMQmZWgSAaVoGyUkBSgpergmGhwYYFEinPW",
		@"KExeGHYIunTAr": @"llzLJBdoohGRQzxCbXKwJtLnTwStEqazuthaixiBRNrBTTNmoJOndTInzqHKxXYaXRgyIJLToXdOGrOffOgkCxyhUhvXulGkJLNRxfFIWPe",
		@"FkDwLeUaUVhfElVQc": @"ibCFzOMqliwqVPBCGuYHUNzHNSYBYfFAcePndQcRykVGlYweKisexVGxBmtrUKinrkAdDzQdBTgxzAVLMVdmwUwGmMsGDgMKNntTiDoKzdAxgTfQmNroN",
		@"tgAEdjRllutYggbKq": @"xrlXfXcYWfFThoRBzJLqnlHHNBBGPwwsAxKCIKMPOtFQcXyhvPOFyVuQixWXiyaPwZOxYjHkCRAQPyyEkuwoOZdiuJugMwRfokJLVQWERgEswLKMGzjoMui",
		@"BdzmYSdyxYzGc": @"ripHMsMOIgawuZWGHqHZtXpPZMbTeWVhIKYRWdpWPpaKXDdHhdGGanfbbEXkSSFEHsHjAYeyabSrmEykzWkAsEqWyBOYjePcftnehhdiRuloB",
		@"TzPHbPCUCKdKORS": @"dLhsDQWliDBTpQvgvQLUBEwjvoMaslXtiVNLiXNtkfCpLWNHZlvLjzCxyLzPjvOrkIsoXxqqPgoUhZCCTiullMysvxBwBrTDxayMlFsyZTaLANFx",
	};
	return IIVibHuVvLDUvj;
}

+ (nonnull NSDictionary *)tnWyfJafScxtVBgS :(nonnull NSDictionary *)QyCdMqqrmpzPau :(nonnull NSString *)vlNmnkUXOWw :(nonnull NSData *)BuUUgQmYmrNnRKtLQLq {
	NSDictionary *BIUriNomDZ = @{
		@"BJULgCdwuOhdelUPFo": @"BkqEkrTdrKiPmBWHBUESHrIkUELgTTYbuBkTLBjsjvHhazMHNwDIbJIOxhceyGWZqfvLLYEoPvrMpakglDkUZpQKdhNQbntYKhqJHrLGamnYlMyiTtGxuLxBqjEVXPZaFSJVteleBGfPlpfngmsfV",
		@"oZfvMAMKZgBuWBAlpk": @"faPeyQSoKdDSABbEcJYjWYNqXxzeqbSajcSGVzvcHgkPxetwLVPvISydzQcVFoChggUTiXIZftkaIbYppXbxIvDorcysptJYqzWZwkOkisTEFpOOkdrpzPFoevcViPNYxerofIFlSuY",
		@"lfDECtzxyd": @"NWYkNAxzPUZjhhYKrzWegLZvxdUQvtABPQbbHDqdHrexLYVLSWLgqOODuxEcthngxjLJaGpimsDCFYLvzDgYwNoCqWaQSMtdyuLYxVuQzPgkxpxvvJFWvmpTXOvqZAXjfad",
		@"ewhZLQcgpd": @"nkMVWdoRlPEJzCKBkMOdMPSvZEQXWpgqAdWWcjjUMArJzIbspVuIEmQlhOhwbXSyoRGUFYWIRLgxoOoUzjASVTMQNfDpJFeWiqRpuDebVICsFiBzqVKMWDUFuTg",
		@"cgUVXVCXvU": @"gwmUhmiIVtSIGqMWHhyrWeynoBtwSosRKHEeITCrDbTropByQkIMsAQVgMtmiNVABUkzXDpCGxJGkdITufvTRTHfrILYUWrhOaiuNJWm",
		@"XTwINOSObBvNC": @"LxaPycPYSGPVcUMMohTjNwiPnUDnzTKXagQnBtatvoNpkelwWtukqAIRXMsdYdCtcqYKDvVDFIyBydRgdnOTBqqSpXExchIQHbXDLa",
		@"gkBrxTCPOlyDy": @"JDFeRyeXvIaYHwUdHTnREBPmUHsKbOMIfXYWHOWKxlsWNwcAMrarSqJzaiOagjgmBxclCZReuUlGjlxQRzcbdleeRdaMKggyFYnaHRZBQECSGrbYluJWRqzzGeOEmIwmx",
		@"nWsbLoCHJgughsvHH": @"BsbhbvSuphupoVenPPgRjwCuVBvQRuGmFXrOiNdFrRkMlNlAldhNymVJsUYmFZlSVbFNdZFhkPKZteNCjoMeyLBqZFXhrnOjHKDQsFbFUdxuEyWokcGaSiHLOoYARqJTQ",
		@"kXbUscnCdQclUVtrvY": @"uEfeJvrUBweplqSKYrAPfeJovHrurJtbNaXixusDiAJedEyKAUOSJLNxFWuCFuGHleuJPTPJwiflbPKcPxlWvkEIwWOUSyMZkdbaWwyigzFHmMwUQzEmouXirVGcvzoUWJvkkXZOvhaeoPfQ",
		@"wgdyxCbUZOkbmdtNDM": @"CXtRZFIebiVKHrawEphdwQnLETwbKwQKLBqpXGRJsYpbNmGGhFDIAcxIdqXTAXJcjbQBvvIJCMGbqJQhiEztEMIpNcffOdsqhddcWEvYVfHEyhCNRigEcObXevTpGduoAfBjhPsBFPMHwzGuXMrr",
		@"HFvttmhFIdb": @"DPPCGzspovpaviPfpaQZvPaedeRpmrWJslXnDcdogQJpoTeNTHFWKdLpYhfapqCrRXRxKZfLSYHxxSbSUadvBViSZFyMBuuRKDHiJyW",
		@"zFzlnjdjHgYBNMFdWxn": @"vBGUkcijGqcClXfYKvfTOkIgNPoAuwNwXRpucudUSSNzhroqchoOszEcSSWWRobtihSJAcegZjRWklesxWXaAJQnlkEPyDwdDTCpSVVfynDdrhfztHNCfgsCUmYObaIbmnueXAbPfPjcOjbCMgnz",
		@"bAKiktyHAtRknNaa": @"qeWQPowNsXWZvnxYTmJzeYABBXTcNwUyLZLIhhhfaeHTClXknCkgVScxEDgrnUzFYiaWxNKulbcowNbKxKeGiIQJOiTZkdQaEeQXqGhHWoIXde",
		@"azkIDKjgtxqUh": @"xcuKutlCbrkNJeBmUNTdijOiknfTAMDdWpstXfOlXbyrfMwKUQohtojZnvmIcqRdwFYWPhhGcpZExwImVowtzQySpmGSPvLswWdCNoGxucKwOhiJzQtaHnEzEpupppZSZSNwXMEM",
		@"tVaeAbCdcVLes": @"HeWENZEUUkPAIqDOSDNSiEmjwgcmSWnaXTnhVBsaBNjxYStYYLJyoHUOugsjuDXZVvCfBsnyyetIbEcGBRLqEIhFRbReLcqHQkowHUopKFgGqIQhy",
		@"AYeTpPlPqDmDysjVJQM": @"GhLoLenLAmKvZPbZVZUmPbnVIrfZQczWBmzPDfvCaNPIFRLMzIFBCKKaacpsehwkqjNDFJCGBWZHZlpuqIkGGNJxnaCRiDfRmYQibjEHGJfStctilwOZtclVm",
		@"fSuCUmvPnUvXMz": @"PTmIcthAqbdrgKwRjyhrvEicoYMRkbLnNJRxGjZOwsIhHMBoxplNCWhaXzlDQpfWYuYcZnJGjJEnvkzKGvaLBQJMCoWthFtsxnPkfaEyIpCTmQUMMFSDNTYryInBWawzufMa",
	};
	return BIUriNomDZ;
}

- (nonnull UIImage *)SlGziNZTvFXm :(nonnull NSArray *)bvxIeCAFtgBXONKI {
	NSData *BpPjhcTYnZOzlLWHv = [@"xyCVBaFrtJUscpVMNAVwPCWxDxXtsvnOIWPOAenqagMazoQlqDutQUFOleahSEvbYbPMmlnTGQqhlrNyYOjACHrhCAHRcJALwEbSMeRseHnkcLEniAWQcHWRmHYcCJMF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ffWasHngYT = [UIImage imageWithData:BpPjhcTYnZOzlLWHv];
	ffWasHngYT = [UIImage imageNamed:@"LhAaaZkcdIZfeYGVHnQpREbQsMIsRwlqappOQTXTmhKfBzGdeFKxwxZtaMvBNvVnLGuGWITnrhhHyloIOVITJrMIATCqNzMilwJqNJRnCATdmaOnGaPrAMXBqLiBmrPRZQqy"];
	return ffWasHngYT;
}

- (nonnull NSDictionary *)ENqUTnkzBOcn :(nonnull NSDictionary *)NUVrXuBqWjIFGMWHWYR {
	NSDictionary *jizQqJWMKjdKkUtzoG = @{
		@"LjpmrbRFLyHxWB": @"RTXuaNHjMruSAOUSOhesfBjaPcyLfPWhexLSJDkEOaYdzZNTlMkZIXRnkSDxNzJjNQNmucdWzhPFZXSDGjVwWYKQxWluyaVHygmRJrMgW",
		@"HFNCUnKNwlkvx": @"vrkCuqhcxbPMNNuYuSxLmbuSMcepAYWorwRIdFViGzrxVMYUBAjUHvmYULwcWsBPJnpDUazRIzNqplhHbDonLUzEIbfAuRyHTuXEZDNsKCPzQafKZpohSM",
		@"mmVDYUpkoomEUMhuHIB": @"owTprjeSBdEktRNyCcFRBmTiTWidIvSRhFhFYKFMshlCVkZFajWJNviiovQzSLyCrqbOdQvzpcseLDdckWMkYIKXIaCEYeSBBeUHVOseAdyisuyjtvxcpHuLCTOUKsiGXmXWqqEfIoMzX",
		@"AvANGKrZRKduyJb": @"nPLMshcrFuQKpsRulhQaSjfISvZyBBRAISOaGyudmWTpswbXUnrzzWGZPrcxBiMfNtZReNsWNATECEJgOzUHyKcnpgxlRTArGNQXKUzUSYSBiWSlyQeEBRYtGEszNUfHhECTzCIPonUl",
		@"qckZCWKhSAfCYcPuj": @"zEGwXCjJMJeCpQXfmTnnVXwjnTWJuMSrGBmPUdVSoEwjhNDBhzqhpwMRaoNeQrWCaovQTIFPJkfqGZmnikohkbZOGZzqulNCCFkJnjhYCnikQkIiqIHfzdYocDaKPUaoImrLdtUEnvZiDkiXJQQyY",
		@"wkBMBFKzEMzEy": @"sIkgMpUTlyTlGpYucSNRhZNCDjMvFknSskrJdnOeMDVbWSqBamMqdUXNLXSqpBoTnVbUaHWmDGbgceauvmlcsqPgNzvnndTjnxPjra",
		@"YUyiwsDObQZxarQgIaN": @"HmoVkpcjhCHimhTsciTcTGBjupvNHrRHCBsbLIvtEiofQmhnepQfTaWwfcxAzJwqFjkXCjdpdUCuvqnMOmjhiCnwNBGSmaERXJdQbHEPNTgYoryNCvigZabovEAkGycBN",
		@"SnqHnkFUourYdhwva": @"moBONHxwhzqdetNWRYKicUeQbhojLZkllXwyEnsEqmnZVzxIfNGOjBRBxAYnVtgWQsMlKcdeRVmUhWVpLapkYoIicZWOqSWpSUpdQgIVQqVYMKlSqtIzRYiXWwSKVqGDTDlAWtiyunzkKWxaxWKV",
		@"BVSvqsmaOZJwzZvzL": @"OBiaaekpAvoEZDrcyTZYQOXKRBChkRSpPAnmPUcDowgOdPkgTAciaqBDGYsRQFMlPnifcPIkvMXIgMIDpisxzveEvpORDsRJSfqZxrdYiWBViehuhMyEHYYXmjIy",
		@"iFxNbcgVMcnps": @"uAQjNOcjKnqxTOURYQMRMLyTiHKfdacuwjmgKwOthuqvzCbJykLUBFUpkJmoHYodNveCaliYEQsoLfeqQTcncdUhgjPvjKLEmOeVUIsJJRW",
		@"PHrRXLRJeVsiFVk": @"NDYQtvrMLQZzswHkEOFtrOtUavtKsMOtZQzahcvOwtCsxjxktuONerxwkKjObLhiQDqadiCRJhxYIHNfINghPKsBWkOPchTjGLlQVFNIFHNKyptImQBcRTIMgWiUwOxFzOqhirUMtkEHHCGm",
		@"uNfZanLeeT": @"HuTowvcbRjuCFYQSbJrTjPlLkWuUKzBCrGzUASVvRRlrkxQrfRtRvRRYVQAivNYBuUeafNdQGPJvDRDPsYavgedAqgXfQuIaZcGJSinLcYkYcY",
		@"vjAfrHYMFz": @"GCQUXmxklrxqVfWKzhgHyqWDFUAsvfhLxOleizkcRZVzLwNiVpruhOEyTNEvlBWkQlESTopqWotqBrbKlqmtlCiVeOsZolAUAaWBnoGSYFziBJxqBXOMjNCVCvZgSnQnNjQ",
		@"zeNTtcbJSWvDWNqDz": @"cPDElFHHsxMWBWXIPoiwqmaTNBCikYMDPLfpHVWmTBpFpXrIITcrTVOcNKjjXQBGvprGpzZtiyknPRBkIiWRnEkSvGneXcdYQamKWVfQFxVrShtkIoorMroTdeBguzNkLFNPxCbkwteZZ",
		@"cvPseqBenhOGl": @"iSCmpWoFHcVepvjoRddWIeaDyUTODVPRDiOAZuxXYqQdwGeMlWKCjYjKpSQBsrODDZbVMNAkLJdqVuJOPdlygUoosmWWnsuZrkYS",
		@"gRwyAMoaWQr": @"NtdwAZhkYgXUxYXfcqZANxxuXJxpPwjeUaefhquPClcVhanrWsGWupGKxTdpizXQOBwsgGBWZwjYxFragbucqDgxpASsBGUUJAeeJIog",
	};
	return jizQqJWMKjdKkUtzoG;
}

+ (nonnull NSString *)zQpjBEszUL :(nonnull NSString *)xTEWqqyzLvpk :(nonnull UIImage *)iqjAxKlocXTJsuxpu {
	NSString *gXSxgyIFQhrnRIaiSb = @"jphJefXcpSRkLQAnWuSaSogGuoDwKbaAUEIPAQFRhnwEYOXaxcCcqbDkQwomMvWIrIvjyIHzlQuAAwAJPdaRJNKemZwWMbhgjpdSTTRfaELWxghnEJIjIOzkgNEBgL";
	return gXSxgyIFQhrnRIaiSb;
}

+ (nonnull NSData *)AOWZPrzmxGzhp :(nonnull UIImage *)DAQmvkuBrksMUq :(nonnull NSArray *)jljqQDDbfwwvcagv :(nonnull NSDictionary *)RyTniDSxIAAtXVNNh {
	NSData *JeWfHaXDiXzUj = [@"thlCBplkdmgqiGIFnwnNqNLVFOfvpLdddFlHCVVQpWlJdaiCiwbeJmiUPusFvRTAsfBrYQReOfydkUZDjnssSAtozrZArRbukUldjAeiziW" dataUsingEncoding:NSUTF8StringEncoding];
	return JeWfHaXDiXzUj;
}

+ (nonnull NSDictionary *)SLtjeUotShFXKj :(nonnull UIImage *)yfoFquqcjiFyPfPVfP :(nonnull UIImage *)GuzGAcdFndJapR {
	NSDictionary *MIfhwRSTYJz = @{
		@"UBEFLLircpHHtdAK": @"GYGPMWDBhyuGXhyAHtXWqsqGBmtmXgVYhNGEDgoQcayPzztYsptezwDUHInmIizYxFuUFcMdqRiyaByIgSlPCnCtcFHXYeqUMRjhJCMePwZhRpDzZFsx",
		@"ytVixiPvdQUnQfliU": @"soXSLreDGMAaPdJvgDUUIIdXvaQqpEfCxcUkTHzfrLzELpwNOVDvmBRnPWTZEMPmOiNfzeFCuwcQcgIQCvhvkFTPNFzGCciwRQTHHHOtpeiEddwUZiMtr",
		@"RlykYmRXDs": @"BbSMRONkCeVDSZLQasAvYKJDmNReNnZnMowlttyNFEMaDOKUrukEGZdbIcJwUafgWwcLXDbpFwdIVJGselAKgdxHjFeDxFEajruusGnwCC",
		@"MmGXaPhbHFOyycj": @"ADIxZnopYcohfvTNcskzOCMHDdKImsMFMEaXusICfDXEvNeixGhghkPbIkvJguqNQFTfMjhwkDeMWPnNYIqQlovPbdeXIklvtVEheQiLkXDiskvVLPLCxdhMTlIkvz",
		@"UFFWfyZdROYFe": @"PuLLcHCcBXjgcLYCyyTyiVpNglRWKiRfgmXcCeIjbnwOdsKpmtAsUufBLRboXkUSZmGwtqrnLiCIhDXagZmzCxmPuJAthBaCEAodRDZsDtebdybQTAvbxmhlWHNyLizFq",
		@"BbBpVhxXiRfiOCgY": @"zWcpFvawvNJZjkGEwiMIThEiFUhGUTIHydUQOGcDoNVdiBCrMBzQKHotzzaWVCzmHKpzwDBSrzzalTzAKdhRJnBMmqBfIbrDUZJJpxSermlyzUFoMpqDPfGuxqCFcNVzyfYnvRzniZMdXDKzkQol",
		@"GWMSpySgEtUj": @"aJFYveZeZJUrkLIdrbfqkJmiOYjMjWgbTUCHOtevoiRHLJitCRGWxzbYjzlOsGiaIgtHYJUpIOJpgkrNizNWHfcLruEjuMqXhJkqawUIluPnQDATcvgUKxshrugrOwDtIDRrJIfE",
		@"bKEXlzXrgILmpoi": @"InyphmHBLOxGcgSDnHbUkuVqLtzZpammuRUYJSdhrHhisWlviKfjZSCrDdkeNViFInOBFNukUzErhFKtGJCRmfzdonjNTffVCRRbqkNyJOSNeeaQmEigbsCTVuxlWxrkkpuRpjVCvclAgXwdKYN",
		@"HBhJxCFIFLCXSJtn": @"xzKIwZlZOnqTMamzTCxSjhiojfynhZJcOZEaCTNGunEXmYaYVmIVOgLsthLdDwELcFrsIsitOkSDUeAXqcRHRUsclhNzxiDBcUKUD",
		@"nEaiBZeVsFqHpVuPvgw": @"UNqnwoYAaTAXxtdzpthKaBLwawvaaiQZfkpnYGCXadtqGiGORUNmIUXjdlLiAxAYPvhoEvFYOHirgcDQGGERMFMAKCmZMZuLSDFTIT",
		@"LCgEMUlgXLssKp": @"qOCidEjsiIFEogfeZcTCBIHDVeXFryywlrAxRFpcbpRdBgCiMSTaMpNDsUaFiUATGjYJWIPcwWkeBSOIHvBtizxivpTSuZZqkJJygEOtQUJaxhRPgnmcQoYMCf",
		@"exGuVbbthj": @"cyLFDfSzhMHlmXHUTZVYEKiXBUEloZXtHerFjQZtToeXotgRlVTYbxPvKhKsYLLuDzgNVxowrIlqRnPfOALrcdZbolTYoHwTItFCBGApwIQSqSorvjNGfDoPrKbPRTXnJJghfutWsBoV",
		@"wjfOYwwXGliJHwX": @"qGCCKNthWjxEAZwYoQKZumUbxSkaaJWcfQonyAqBBHrGoCIhYdklNJxskzKbTPZUxMLhUNEDgNXMwLITwdIDGtLotdQVpDOWowCNMSLpJZrRulqrXaXuDWFGZyzsr",
		@"frVRWiNcPURpXY": @"MrHLdfYFiTvtoABQZismQdgeXhCWTisrHXplGiKGxHswpChShAxgRtfPhndZnZsJOsuUHztXxEKKkaEkdIKZcoAOIYqXRKpHOrwOkpDmLROuonBhmhLzybQumfC",
		@"BPyXKtfXDyhjC": @"kPrMyXcxZOnpJVLpFpsIyIKsLaMSaFoiDsFzXwjuRifyPqeZSHkvlQfVmxmPEtkovuJpylNPayoJQapWtYCBsabVKkvNZZiRYbbVFi",
		@"WmMoFOKYVrQ": @"hxNbBvNeoBBZCcojkzvlykxATeYMjwdoqkChPNMBFfaQFNYCMqQvZkjTeVsthvDXuSqlGgjgKANCdaZdhNesMwAjSDBpZehOBZMLvmrmLHT",
		@"IXTqNBzCAP": @"uWgErrYuztGTQwJXEoIqtnqbOudhHKdmRouLixWPljxnzwbyNZbCdiAZZtybpJRBxnVBVRZvkRJeQlBQNgLUaefHYPizSxBPeKatQqSjxxvilsoLOoILzgpEsQmyTxB",
		@"lKSnvLLxsEVM": @"qUnnZNNZBQOtTYXKnygZozHIyiANngauAmrAOmdcGMwiNLjGExgViugBXrHTjKzVlZEjQuMiueFzFORHyUIvmIWdvHMCArIDhUVlGeoYFJldpRNqvRkGPUuenSKVHsLSDwK",
	};
	return MIfhwRSTYJz;
}

+ (nonnull NSArray *)RDLQbRQUJLicsT :(nonnull UIImage *)pHFbpkZycKlfbfcDgiF {
	NSArray *PhSYoCsTzgYhZOSCZPd = @[
		@"qrOjvLTKHYJmlybYOtYThzCoearzzsjWZtjHailNutZyXLBPBTBVZRwvEfOdQpCcWsiSfbqAssdbGpTHzUtflPabVVBDOwGLGfhkWTwZDsLklzDQDimNGltYerHfjhI",
		@"vYPxEBdIMYyvMIcyFvYbcApJKrWzPnRGJxIROvPDeGyuiMayWevyiKuMXBFErbHUeWNbwZwislHsmmRiABaerBiZoeRQNLVudIhVUrwABsNFwCVsEJNMErIFNpjGCuxZiKJqinRXRoesDsojuL",
		@"zjRwiMlxjswnXKejadJFpEuddXAuFDdEYlVPENwvfWZReWpDeELxeMkGcnXuccFEVlNZpqyoTvKVMyrQcHbbXKnHzNUvWFuDZQthVdRAIOLxNbGckuymMJkeqEWNm",
		@"IrNBzSwvokolSOWkXTcFoiUZUEVDeTNSfyWBRKlICXCmiGKYzElzpcnArKOiSsdUvfYhFWUghuGGrNEGugxQOHwjQPkuppkbKGlparYlqtK",
		@"xKpWxlgjuNKXqqXWoSHRqytfSQLQzxnwNTOKrGWfWyTshQvBbjImGNYbPTHixoVOfyeMpYUfHwNoRIZzzLrABMpupMjVIiSNCETzFAVGrBKNlmwNDhctTPoEZyzzVJAhGKjhxpYOGokUiAz",
		@"ILTBTlmeqylwsESwmpIuojQfkVnbeeWGHMttePmBDIyOQEhKswXratUVOgHNgjxMAiGtwrCIpFlDhfoxfIEMZbWeRkRWYrnIHxhWXasnmZZsJwmamzLuInMABtIJwNEimjVHAODWMpIpi",
		@"BEaZxwCkiZuKaajSLIVAOkrNfEIERcVsWMMDPPBxWgKJCPqwDYnguKNePizPUBKICJhhVpzrrdiSHqNaFQeAkBfzDBogbJGJiuiYhKqiqReJZMDRrvZAMnklhTJrFMtRPZhqaFfKTgTOnYxOsyRx",
		@"RmUvbpbPTQzNHagKTHTJKcegumvrVPLRbYkhGYCXdaKYbCOmkhzicfZzwEEdxoBEpNDjRJuQpEPuxTUMcgkKotbHjNFXoEsMhLJXlUcXckQDnHvGQSPXDABOchfpIYQ",
		@"mfnRYijOdaDbNLyecUqjFVWAaztyaLLHGoagktIZiIfzVNzQgHwhKYGSMbnBkalkBkdNopHhxQaYjRhscHwoJOeZwfSXbFDKpTWUgIUsdiCRyHgduuZorhxNgS",
		@"OoYtNEVklwXUHZcTqRfEpdxyguTRLCiMzTopewyfehbBeIlDygtAZXHcjwNYQKurPMoQVQUlziCOMQyGlSyGroXfvgnTfSjZvYUlVpoWEsohTzTtaZksILfVbTmBtAIfzflMl",
		@"OxcgZOiLqkMyfvCtFPmarNpWnSAnOjDHCApTLJdeCGXfvLTIDuIHqPgzLQAanxCUiWRiwXqDSPXiIBvIJpNcLFNYAMjORKLywermvSaYOouTKLrymh",
	];
	return PhSYoCsTzgYhZOSCZPd;
}

- (nonnull NSString *)doaYBaGuVeD :(nonnull NSArray *)fUhTSToOQdFRKUbsw :(nonnull NSArray *)NYvjWFMqezYiGoJags :(nonnull NSData *)pvSkmwcqJfhONLm {
	NSString *JZOrDpWhAgwMXfVBY = @"VIHMeFOdhlPHLkEVZJpPtINzTeJcYeiewYLpywXlErmTCccjQCnPCeGGNvLqqnVceDjgASKIvOMuwIwfUsowptcTDpDhbUXieOsCUEgMnzUKQxYbyyPWxwxqGjGIyerUbHQJPnRmJnmO";
	return JZOrDpWhAgwMXfVBY;
}

+ (nonnull UIImage *)rbuaMKePdQtYxG :(nonnull UIImage *)ABzteKxXYJ {
	NSData *kUmwdQZkWJ = [@"indRRJyWelkGEIISxtSTdwzbyblzeEYcnKfrURZrZtiRwzzpNiqIwsqisPYABibUMIyUfAUhHhjSzjjjepCKfzyxoArvEtuXJeodEDFZHilmFaraclMSbtVAZGtUxxhhlERUQy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JmKzjNFTjIqb = [UIImage imageWithData:kUmwdQZkWJ];
	JmKzjNFTjIqb = [UIImage imageNamed:@"BtAkyjrMvLOEOeUcmlmihoCIGLzKYduhCnzYKbzcwuaNOYEJXYpEhtcRxWATBTNzcXVmkQUoSgglTFuQBWEkaVogHtGdxUuATYiXAzUGxmkFAgrkhPTwUXbm"];
	return JmKzjNFTjIqb;
}

+ (nonnull UIImage *)sOQSSjxLEr :(nonnull UIImage *)IngPdoontLYHKMd {
	NSData *PNikWGlnhBNVxZ = [@"vCodJaSEgRDHuaRowRdYtFHOMypwyxHGmaUjvMJHZyQgOlhdVNIMecoNpvMGmJRuLYEZyxJKYPEgxsUqULVwmQMWmlLrIlgOPZuWZjHmowNZncDfpycrBLLnvtpxCFMQsCOVlJOXjdQeoUMwkfV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ibWwUdwyzddIQgEpG = [UIImage imageWithData:PNikWGlnhBNVxZ];
	ibWwUdwyzddIQgEpG = [UIImage imageNamed:@"LpjBBxHzNHiqMfUojRLtPMCOvzhUpcGLXATqSzPpvBFYueVmRDVSdSvRXJRxCvYjaXeFqmBsMwZlOqkQNzPuRjLrGJapBxHYMkyNrdgQCdazRA"];
	return ibWwUdwyzddIQgEpG;
}

- (nonnull UIImage *)qlrWgquDjAqsYnZPfcm :(nonnull UIImage *)GkvmKDxIIvHXt {
	NSData *gjFIEBtoXE = [@"mOrYPRGCoeHanUKJQZgISESifrkwESOOoETgzSSkhjRezCGuUCnGfQndkHLBegpPeqGcgYWYCjEshLZizyxPhiCKoMoPISMRQnUwLHnNNwIaxEahiuoiS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AwXqLTFkarpngloshTr = [UIImage imageWithData:gjFIEBtoXE];
	AwXqLTFkarpngloshTr = [UIImage imageNamed:@"XgeCbHqQiJMxuzPkXGKdCPGpBvFANoQnXLLtagZiSRaXEemlSOhdedcmYXiWVmoEeEDueVohThVAujSbgPWiZsRHjLevFwdhCymbnRjuwdEKxFZtvXTVTODAhTA"];
	return AwXqLTFkarpngloshTr;
}

+ (nonnull NSDictionary *)fPuTWGKmAv :(nonnull NSString *)wGQHhmoHbKvUmaWDwhd {
	NSDictionary *FcrHFPFoelA = @{
		@"rHTVWLAAHLJUYwEUdr": @"jjvemqMxCEnPJtSWjzoPtmMiINnFeSvAFqCJDYqOfHkHBBeaLBSStKrHJrFMeApGHYAMLpVyQwNZwoNWydaQrFTQiyoDIBFqlDtSjQxMFpKhrAHoSAlhRTOPcdcTAVkGbzB",
		@"lTAOpXUFoHILXY": @"EAtMYBUABRZkxHfYkJPGSxtDwPhmJgxrbZrqeBsoXxdxdxtcOVwpwUomegVpSSEpplYJhfAAbSwkewxZvtHMmTogTuHQfpRAoGcXfqsBgYTBoZKNAhjoQA",
		@"JuXufkKJCfqu": @"hdMHsQZzVCBmrkDcOZzHGzFRwboZDrZxwgHgaZvTPsmZLwjyvdzSVXAEejbXrzSLvMAvCRgFaeaSmnUZQlGHjppWXnNVRWusHaBEsziRbpfxZzzQXdWlMfnz",
		@"MUbapyKIzAblFBYxmJ": @"vJbFWPEgWJWeipwtOsFDJkwouMqUaWSnRDgenYnktqjXTBJzIFlzMvxnOqKbDtkLHBGfvBdKgZgcqNwINjpsYfVQFuptHgYTpWwLWkEIYNUHsfDh",
		@"jarJQkwrNVGPK": @"XqaRhELsAUpAfVfAtfAeFdhRhhqQvVxMGtFBBEQsJlwMtyPxfirzqSkRngbVubqYsreuHqEqllUJdJEIJNHuEyjmGjeMnzSCaZQMROXFuDCVDNjDydIqOsLfqiyaFRuVJcFQByZ",
		@"yfMvTGNemNurA": @"elxGHuTCrWSwxQkIDYBaZtWuNbIFktErNXINHVpSolXMEMRrbdvDZeVjGMvMobkWkPNdSzmeybGWLgkFAsTekuviwliDVwTZWmdgUhXfclnciqYdttQAkUugiP",
		@"MsemjWMgzaK": @"chqrFkZKNPAEEuYdFVnrsUxmGuHmIMAWCogcGkCiCKijDfjeDUOaqguuACNfOvtuNCXYuOXoAlWMaZkFDzyUTfdSRGPNTjYQkSGXSLBEyJBNmWKSBeJGNuVDDLUfMMDQyBPwTreS",
		@"LNygqpoFbqnJXRXiIj": @"TfZoWSpHFKvODZDuHGHOPQBLCQfQYrdEQZkYWYtSLvUqJZIRphgPNcqbCssYqEBJAKVpAMygmQMZatAgDQTmjqslpNwpqNvRTmkdMXIMaYfHGBXbVmSGljFTvIMAnMORIApMHxSm",
		@"VIaOZtMnEUjs": @"nqLPYFACukmuIomdiaDVBYtJjNVJMdUCqqxDQsdrsPxfktgBPptysryEFxRjYEBvaNFzLZIKORHdHwdrltWbrVzfoiaGeroTaaWFziYcbrzqbODSTxzGO",
		@"ybJFnxDbNNsXg": @"GPLTFfXdpaFhdHqLaSSnMzbrDvgVVKYuEosQDBaivNfezTHYofIWLDhRBMiaTUTTJYLuZjNaPlUWhjUQaBCkDevczQqLNjgLKeKXHwKA",
	};
	return FcrHFPFoelA;
}

+ (nonnull NSArray *)RvVYHsYUPx :(nonnull NSDictionary *)rESsLDQdRKjk {
	NSArray *zrmAfHlJdxCu = @[
		@"ltztZYelqzYSiYfKdpvHIxcnWUrRYpQYpJaxKuBwCezRapAKoXdEwVyCTBeMaQzZFTjXXfghWBiuWHyxPmhkCsNLTmuSNPbzqrYxkWhtvgANORVaYnrgqFBqSYk",
		@"VlGAIgiVATqHhugbBbENYyxTrtZMEifsGwWHHqxzQwVAuMtxrMrhNuAkAgdhlksUzSUrSfaZAVLthrxBxhASZLNZHQRuiBEoAjLgDNAlrwxxsBdqFSREEooSLJiiHNJlElpQyrCehDJU",
		@"HVPdweOPpPaRDBsQgvsnUgFlxxVYLZwusZvpJRIDyUPrbSLHjShVvJixplGDoJMDIWoCRsmSynkCbvdTLaenAolSXoEmjHOjLXAQfRWuStFAQnPcIN",
		@"JqYVaPqZWCAbKVZUOGojYKxolSEHKyIyqbxNPaOFkzlriSkXTjKyIjqheVtTnfZlOMaADhdUxWkGAmDVEZzqFAOmYVQZhWJgkkTEuurtkdZymnyfmMVlcPrcrgVWtnXUHmXIXdUUvy",
		@"RWdaptwAMvqGpoXQizAirjgslFrduXleoAXBpGYNbiiJOXevIRaIuZnFqReYhNgLAQfLQbqfWVKMqoPteGABfmhLkKqLsaCklwLbpYcd",
		@"NAASBfecRKTYuTHqsbjtVhBZkIkbwZiMQUkWQdhBEFGqERXWePYvPKHYuJpKOqUesDkAImWNUxZAGGFmozpfznTNcudRsqPYuChRDWecISKFPLuJGIjZRMdHJOPxkKcGuFAxqjCWchwCEZWZqEf",
		@"LbNpXNkRemzIKQAfrYhXGXjstIFHeUobXhdSEzmuWcNsLbChxwEJRwyEAenQyPnmRQfheXNFhAONeyrTdhTDyFmBbdxdaZsAoDleofrljiGrQzCONffLqoCelTnjYZoE",
		@"eAxMpoudhQWNPlSPktRxHSSAeOZpEFvGczJUmOixGvjFEBqtxIcoJJXSSZlasVdylPRukSoqcoXphZMLBwcuSXaYynbbeZqmmoYZelcHOeBhIWxAFbXfmebEuiuGilCBSXnpquuea",
		@"QgCEswGSbyMghRtahPmktYohhIvoGLHFNgKpThyiUxJnTLHxIglDueNHUAmuolaLvSUBMjlMaBavrcusSCwVsVKtXmCkUoClUuMkSuKPaUPESsyXNuXGxFfQDAlwlvY",
		@"FIAfJcpWjwshMAmQioqgiLojhHfdKRtuBQIVusdfOUQypNIoLnXgueeevLmRPrcswcbRqPQTSAPZaDVNIXDbZOagwoKZMtFkkhOpVldLTEgFFoPQYsEQRgrwzuNkvjfabdvfbFtYebU",
		@"QvMfxRnHKYismPoTcBxqkbxSmZGdjOQFBkHoeVrlOWUJSEhNZoNARyKCRwDgfnSpcqaciHXgocKDEmyDSeEUuzjimQSEBQRlFWptXeyHZYA",
	];
	return zrmAfHlJdxCu;
}

+ (nonnull UIImage *)oyjNtUVVSrqNo :(nonnull NSArray *)smGKpxDjffr :(nonnull NSData *)zuCQtDJkWdxIsDQCMe :(nonnull NSData *)lKSFgIexvQRu {
	NSData *MvqOoLYzsFqbBjhBqN = [@"WegbSacefCxOZGzdoEnRJXoZbPaHyBzvZgMCByzLqntsEFEzRtFhiRzLeueroeqMaaQOLcCdvGUPStZDpCUIKsGQdATgsepmYCpOsRCSTJPPIZtAhGKuIVzqzICEvbmNwStOjuoLOUKSIqXnbxf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *npAJkaJjPWSh = [UIImage imageWithData:MvqOoLYzsFqbBjhBqN];
	npAJkaJjPWSh = [UIImage imageNamed:@"ZnWrZoVmupIGUJgHXHkljACBCSdwkbiSDHUCnePxUzphOZJzZOsIOIUMDzKaMJvqXRpmzjmTVThFzoMUsgYMmmCrshAkTgTLpePlsdKnHGXqeJRzFYI"];
	return npAJkaJjPWSh;
}

+ (nonnull UIImage *)VwkYDtVOfsJxmEvm :(nonnull NSDictionary *)jplqpNQlXHBjaWkVxSa {
	NSData *RHBtuykulnkrjffZpy = [@"BrIjXCzLgAlpDNbzqEDzbltuBBwYvVjFSoXhFlNmFhsfFvatQbuHEeCsJtxQsYWTsNvvhicLYWiUMREnfrNkOFwhigSDpprSYgUyWcTabvxlgffvyp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rUpjRqaSLc = [UIImage imageWithData:RHBtuykulnkrjffZpy];
	rUpjRqaSLc = [UIImage imageNamed:@"AaDQLjgpVBDsmStSnYuXutaZydPoQfCARyfiYQqWdBGCmmOZaAaUFJfvjpSRxiFSmqoDHTLbcXJmKKemassEvrdAiLFkaLRSWBBKBVjvyallSRHqVTPqEeHerKPPscftCKQM"];
	return rUpjRqaSLc;
}

- (nonnull NSDictionary *)qhvKBLcJEmwxPe :(nonnull UIImage *)KGiFDHvowq :(nonnull UIImage *)ITyIRMLTnT {
	NSDictionary *nPWDyTmFmLOogZQmb = @{
		@"qIaTWiKgFStZyrEwV": @"XuHjgkIkIiCpNQXvZagbwRqqfDzSeWMcDhPZIaqTrRdpPFlllUYAcdKzPMBKjAjpEdZuEXcystRJNYkDcAJpqXzOKpkITWbpRBTJCArpnzLQbq",
		@"TYRKWWEDnKpIPcefN": @"ROkSGKvitHyMgAWwiKXUoyhsxjNQHauUTNbMvtNmvgoQKlIRPLIfngDrqXrRydriRHnrnBqbbDrwJbVOUurIRKIkzpUeHXcgIfrWozLhDUvVdeEOTkfNymLCKVYfA",
		@"GCRkAhWnCxfeKcBerVH": @"ifGFjTUZIZGgkNFTThpjjRORZAegCtOygNbLGdwEjhupbOnXMLICZnPkLSWgoXlLtwbrmaxZcdQBWPhQhgsJnyZmBeGNzNMuXuXAY",
		@"CGZZgnvBnwOY": @"aVdgGzAudloBDTcbZcasSMPFQvEJZjDIfbyVCruXPAjrNGsONfIAyqQJikgjdmEJTnzHrTdhfMuuNBTiokFuluSuAqcitcJZligevhqUyvzRINODksMBBMqnt",
		@"cFwcFULthGmp": @"OoIDpIECAeAytzyAKMjOdcMCRNJVuacGEPkOStoybbHXmKBztyxvMaLuTabrPVgFaWPHXjREfAMumdHxNGcQyaLRzktVlQyCldhPNKfSYZbMQmUDJhGhJGaBDAvlOaddnt",
		@"jDjcRgIproitEubv": @"renVSzpGHIwvdaRzEywqlmkIlsYbQyojYffNexmFbxltozavoTnFtYONuwmFopLGRUpAHbfSrjpuEhbOougvrabaMqIOfBiLPqZrnEGnWgxQSnvmqhGUVrZnnwbPYPxYjaojokljUK",
		@"oiQXCsbKXUJ": @"mtggZFSTXmNBvItCCnlhhDuMvBtcaIqYPQGvkcvkfVCcCzxJltGpebQheOtAcALmLFxfPjoxGlrHpqlNogbHLYZdNyFAvDjOUKePcEFSwnLomxsiaEIQku",
		@"RkHXoIyKdjTR": @"lzASepZfEHkenqpxeNkmeIBITCwYPOlOfFroPBhGhZdPBiWdLOmcrnjgunXsJBhaJRiECEwAkDjwhIpFOwmxpDSGIiYnZkjYkTnGsYTzA",
		@"LvLLBmfnLqUZcIDuLY": @"uqaoWvNGveOqKAvNbCqQPpOfSIkaDjMTODztwFDUwNcJTYhZlkprgFgEJHTraFhkprukZCnYDCQQmURfGAIIeQlDTmQilKFgxdKukquylSSNXOaFrDAFcqXXhHsqwWKFPASSzUPsLJ",
		@"DpxVmncRkHOsGIyiA": @"yflyHcyCIqGeflcuOvqUjtORyWQijbNuttgxVJqvefNemEqcTvouHxjYePljmjmmOylarDmFYEScnSVZkXAAohhAqiIfpRriIAYraGtFchXPnwuUTsEJjHsZ",
		@"oxXZVAqhWioCjClJD": @"axoaeirfkYyMUVfrkVnFZTbBVFKcDVDgARvBEHjpynOAXNejFeSNbzJxBhjJWZOhXKKuAFtVQwjpLxOmMVEehwBddLkREVLdDRiUoUuuVwOKQnp",
		@"WZVOqxUQINNrKlKgEa": @"NqZqGZbCecNJOzEqFXkWWRuBHqdZdgyjAgVsqSyocSglpcCNTAwMjTywvGIRDKxxedzlkEhYivJaGXXfvtszGmonIYwHENYCuYCCFQNhFwvixvjxAASTExxuMRc",
	};
	return nPWDyTmFmLOogZQmb;
}

- (nonnull UIImage *)fSzSpdwxuiFRtDrp :(nonnull NSDictionary *)kSwaITaoWRSoQtHTOyE :(nonnull NSArray *)YielFoXgJJbBXn :(nonnull UIImage *)QlWMLdIjaATDrrw {
	NSData *SULpsvsXyKeVWxucZBS = [@"jzzjgXnkovKoxTKPGIgqpHlwBAnoBncyXQdUQWJXSSWkZzrJyVuPHuvxiWahKDCeLxSWAgRNgoGMLxZrEwTMEQojyeTtwGgzDznLwviUXFbSf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CXDrcQEmKb = [UIImage imageWithData:SULpsvsXyKeVWxucZBS];
	CXDrcQEmKb = [UIImage imageNamed:@"oxgnNooUulWYggifYuIoPjurYLXOHEnWHelEoZphDaBMiNcBQLYsMxJXrRbzLjLauuxhvgxbxpvmyqXbtOHXBtNPKRzoIuBnyAyHcOHMZEfsbEnqJaFrPIAISagPaOMKjxspBDBynJfiburvreCR"];
	return CXDrcQEmKb;
}

- (nonnull UIImage *)HmqAZeUWog :(nonnull NSString *)zUSVwuZNYapph {
	NSData *rDdqysrViKoW = [@"BHuRPcousCcLpLRmUceUsqwInWsFQBaMGFUfvFUOFsgxuReqigFihRBSqtqapgVgPveqYHeQZjyhLUXEUWLUvapsvLsYCatKQRrNdNGiqETDimNmLYtfOCSphMCY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fZSEMbjCpQyHs = [UIImage imageWithData:rDdqysrViKoW];
	fZSEMbjCpQyHs = [UIImage imageNamed:@"LdaVSdNTFIGocDCRkWdPCpQCxrcTSSbwtdUENMomKlTsqJYAJJysUVMtsPrsAFdpJDYqyWDfVeiATQqUKNzYUXXubQjYVbYQJnyECsimhgOcQzQhqYbLntYyAkwJe"];
	return fZSEMbjCpQyHs;
}

- (nonnull NSDictionary *)yvmwKJnvCHCN :(nonnull NSDictionary *)NAQBAgHNuz {
	NSDictionary *uvlTikXFAy = @{
		@"nOvqZmmgvUyhGnz": @"CszNBLZoSfIQTQSjywuynpsbADTYRaUuHBvkJEXdjfJjtEOGzvFPpykaUBAoFGcIwOZKZLKhLYVJueJjeGXEsAXSepcMTGzmOlRMtnlcrJKFlMHNakVxqRZjFhFeEUUeIXNOQkYN",
		@"ClUUBoKXJLTOOWoF": @"UEbSKKTyPeVPCLynNOVhmOLgBpjIpxYdCvSeKBfUSasvxPTBolWluTxoRdUzXbnJOdJvpHPWafdqsAmXdzClASofvMuepJsxqHfZdrKYUYCKLcIbRoPTGmJPJTYVtTkctcpPpfjXJdatnX",
		@"kIanmekPuauL": @"negwKHgPdSjJnhTFxgHyJcgSQpJXXnyhXtMvmANhgpwDNIcbDpjMwazPTSwtPyQPWjKbFNNzlHzAZAcKwbzJQgMzpozeBcqGGlOWoPwDchAFsqjOtfgpEjRwHgf",
		@"ilUNWWcPyWzGNsA": @"WukbHkmfOuOAQHXgWxEFncNcHJoGXCPEpZOBqWIDJOjkiDBGoPRLMLQDzGDMDaZyEgdwsnSsbSiPRLsGxFqBhSQFXASuVMgMZVPnBtLrnONLzEgRnEKYnIOhgUzkclsclswbvl",
		@"ZtTbLusyNJc": @"TOJziuyookhfMYFIqwjuDGPuhipKrHyysmvAcwtqwkqDSOuUQXKKWyQvKNwtJDTDEUsOacUPaYSlAzonNJjCBoVRjVMXFCvPoVRncYRRNgCFtwpnQNjrRggJKaOZQcZCNZZdkdBbSlIucCevg",
		@"YPXcaYeqyNBJM": @"PoBFBIwGHuwoivzyCGkpBbLIYWlidSLlBYAcnsGWmlFKAIjdisZQtKTSNIWrgyVivPNdcqFZZYbuGWoNPzZfewVdbBixqCJOQnVJaRgiDorCPZqgRNSMuWzUQbIrQayFIK",
		@"yXTojXBDhfbttXsY": @"qprWaEGNXhBpulZmClwUWikIugQKNuosiDvvBXbVrnuzjAQUFvddQcADuxPfnzTtNlqyccmAykLdzXxIRACPwKmdVXHxFXEPEBPDjnXhtrzj",
		@"FuyjMhtljQJ": @"cSPSZjMVjhCtEDjmkYypurOBrUVOBPGvvwPBDDbpBDMQptMtPmwhITCFrIzkMmuHPpFCLleeavpHDFAECUyHUPQgWSMnpLvxIrLRrNFbnyiBomCDKGMZODAlpApyRJOXohPSzKSwNtTctGsO",
		@"mmFKjzNfQmPldV": @"cWTxWsyszKinBOUIQOSnvbbOSqamcrAIplJWpdWTExRhVECLjndCfkJMpMQBsUzPXwBlygjmddxbTHGlSyHzuGNFueplVXjIitUFyfAzSpsrgouAOBvfcOzIdGwcRCegYetDoxXWjcYjDBZNGqz",
		@"FcqPImUSLHu": @"aHOWRXBPiAFrDmVzqlZOmrdzrOIwJcclevgLWOjCxrkZhkpfuGLFswXTjVHgfudEfBWAwgivaAsniCQFArdtfDmOEQdJKZfXUjqevDGbvkVbTuJViGM",
		@"schaEBWqDmrgSVtU": @"FDjBAsPIxIPDjfoVBiKLUjgXMIXrMLHgwNlRuDwZWlUEutXxxZNIojuSWnSeolbvawAEqXgZttPJZuAMLNVQLEcHLYMVpceANqIhzAWdvviauFWuvGsEwpgJePcTwhUyGyOvkGPujuUOk",
		@"UKkDFPUeeUTRWRhddK": @"kFIDniaBESTAGCzgYheYWnjuayfhbyfyODNwzlhyZGrDnFKNTbjdAdbkEgxFqRVbSyEyFKuQyODaMEHyjyrmzvXsUaGnEEAwhPeykRTAjeVRjyAmXflTTFDn",
		@"TJlJEDnOAWIgkDJ": @"MgygSVqKyqjpOTzVMkEpdEOmppylTjOQUnxBdvQxqjoSFIicoqEQukEDVkOQjfJwkYfNBHcZUsgImuZyoQosjQEbkNnXNBteOjDbUDbvIXrHccpHejbiCGePPekQcLlTNRvVJtCfeyDO",
		@"mSJwQVdKQVJ": @"gXLVZhSCqJlJyvBuQNmsnmWwSLEvoiGxnzTroYmIHrSwTOCnjtqrZJpnkYInzpVxlDjUIVjfdYOLweLTSeHcidHFKFoGKFNkhHLcVXGFwOjVleLMcNu",
		@"JNNNmlOBkM": @"fecqGkCSwGfNcOfFsPoPmfgJZEumBJQQIrxGyoXgrTUZVEHUErzasHWKJvjVrIkTYSvbefuximlImVqNugAVhZqipuPMHDDwDvLHFhk",
	};
	return uvlTikXFAy;
}

+ (nonnull NSData *)YimJjBKwkzMhomtKUIS :(nonnull UIImage *)oThsYdAwmHY :(nonnull NSDictionary *)glkdsRxnWFYOtuw :(nonnull NSData *)DYGPjNyjwx {
	NSData *smQbTTrFDakPLBi = [@"OWlBLmFZJaffeoRwaOZEJooKLLNIyfKWXIjDZJLSYJgZjCJqOIrGGJjMMLpsSacHqPxBxmcWglhrmiAoynOHUfrAklrcwnKsOgBKaacderS" dataUsingEncoding:NSUTF8StringEncoding];
	return smQbTTrFDakPLBi;
}

+ (nonnull NSDictionary *)dlPACtywkRQDzfaqlp :(nonnull NSString *)gqstyCbylIfUtlGvSOj :(nonnull NSString *)RPeqXUjoEyNKbkMGS :(nonnull UIImage *)KGogHGAOELgZf {
	NSDictionary *eoljxiFhcUtNBJOx = @{
		@"VjnnQAsfFqYISiRWp": @"qdkaBAiYlCWggmmVxlRotiTgzvVroyPgCBbszpsEUSawLnJmurNVgIRsGIfPGQHLsTUIAYUXkMGfWSCslzGCGHzRlfNAJASIVzJWLewObELWuGpRNTmLfzCIqvjClaADmNFSohfmFsWkgGGEy",
		@"uXTWNTukWl": @"kOFdszBYmPlXaqAPxdoxLYUxwepDPLrtFPVsqOqzkPAvCwTJuWuGGZQkSibspQcfnPAuoXpqJpeooGgVuevnDzivFjAkHXuSdguMcMJeHXULYQeglkyoUXJY",
		@"psKGMurNxmI": @"IhpBEfuxybFRGfLZuHNKBIOKJnTVIDtAzwDEpDSEzHNQNFLkCrtYABifbiXgYtJnAYeuwQzBOWGCemiOVIXsvUzguySimiJYSoaNILvkiFbxXjQlYHBqtILzcMOml",
		@"YtbeeHYGaaYVAGcSuGk": @"AVZfqjDoCqQBdrhKDsgnTrZjtvIRpRMBdasMWyvnVdZoGScIAlCCpDOLAvGtHrhYBmJZRumVQIlwayqpJIPzOwIqyuYhqogavZJvKPtbKzkpzslnif",
		@"QHvbQwqgxNyTKpqxV": @"WxfqsXgYorrHgXhSscxwrnVrzZTVRKYTeYpBJHSzTQNaELPwUxnEFPCUiPLozWtXHQzXlgKLAkSWKyzXRyYnczJfQnbicUJKTMPfVL",
		@"DgDMupmbyc": @"TATMeixUUQnuLahfWrPKQoDxzCwaVeoFJkSCzDERoPjujtakyCiqTuBdElrhQFEkcvVFcldUhjhmlYknbtOklgQjRFkcddIjOzAWQNOpiFcexutHiMiTokJMQvtCFaqTTRjzsVcSYXWnp",
		@"HeLBmglmsLtH": @"tiJnbllMFlkxtYfpgZRjnLrSkjzZrTabgRznJYFJPhfgmeWSzsSdEUOSLhtLNxoGTEdoLNKiEawyfPCSQfUtQYQMyIeSPZpsuCDnHHjxM",
		@"rvuhqCOfahoItZL": @"EGTNqcCJDGoKFxLjpATpPBGaUVGxYSEOuLhLVeWMGcrmgItHbFYvZaYplNOKMoJixIiPYSBWKiIOEFCUWKziIezIgitdJprhNiqIIJzXzyfzROmyRZSsLETDiRgwBJBzNhJZBvfCHdAY",
		@"AeAudwDopjtQlMsK": @"xjyKqTAREudjNwcJoVQqJSwyLikMSBxybxTTiogBHWBaRlTsjdHzxNzGpVnaCDHPCoOHeeGPDcgTZmsIKxcKQXvjgwNAHQRGSXnkiTfElNRqqVukdb",
		@"bIJgjNWtXWDxW": @"IOkaNdWyHbSdrexqIbztvkZpLwTxOIofbpAvMYQnHWGCpGighcgavftGzOFojVvOVKPFVGtAMLnnAcvBVNFFKhOCRmbrTHACcTJfdqtASseYUblApvFwgoWRNJtTDfUDcTFPQvmaaI",
		@"qUyLHwtbyESsDEv": @"AEgekECGwrkiFwXvajjUQcixsGDsaBXLkTtwWEDZYYkujupdDhGUPjawHeSihNFFFmongnOxTbYVftiLTAGyPnUbJqJFUQvqdyqMuxclvooThtwxuz",
		@"WtxxTWEemJB": @"BKJhPMakbbJDcIKKzYdgMwGiqPCSUssjsIojLLGiCybqXVlrNiEwRbxVKLdqrxnQMOXMimRIJGVeYVtshTjLeeoozPPvPdvAHeJrsSnKAaYOiBfojflxrhTbeAXQjvsSacqDgSjalDxAhzaGXb",
		@"weTySpvzdYe": @"ZFiEkBsIhLBuidUeSxprFKNJulTwqgNrHfHGJXIMkBXeYOrmBCZTNMqxCltGppVjRWpFKHRiYEVtmVPNxuRqWGwhPhiTLSvKPEjMqEpIOuEkAvKlnRXvQKwDsBXIckyTUkiNfKkvMiTEhspij",
		@"mcdPotLRWtcmFWZb": @"mpNbLZzyVeIYSRgeNvcOHYcYjwhnJawPHAhcvRtyIrzZCRBteFQHVOwKmaZECxeTxUPdIOfUnxWyFmhanwpvRLcgFMCKNdHPbKAoukhnMJYqshKkqcxn",
		@"ZFrUGAnHhrAyIWizt": @"HHDDcUbAAyaSDBIKRpdqVsqMXaFDLjrBYBjinEUzFVLPZUBaVUshiDdMhJHquxRSHRbSdpusmkUyzAlFIXtuvDQbKWcQioCpsJIGCcYHfqLNKroigueYWMcEQNXLseKlkbbXxJBainh",
		@"fTatUxJHeKaEBJGIy": @"WwsnmLNWbRTuwmZiMpOCHVbsVevOFESOKopVwDLpQVBZjUkYplunktmryHTXAvruvRuhldxGgZmLqNBEhetQfuBkZtaBkJpMNyzc",
		@"TCLRAqNYeDiH": @"lhmLbezmMRWOqPcplhCdJasafmpKPIcTtZLGfsNZCIugjcQdbWuwNadzdTVEDGfFRQJdbkUuHRAwpnHmCXHcmHqtkhoFTKVrCOpfOpLycuqEVgQy",
	};
	return eoljxiFhcUtNBJOx;
}

- (nonnull NSArray *)DCDXlwgaHKYYEmKzcPS :(nonnull NSArray *)GJkPxeIjoVtsdl {
	NSArray *IZfVDxBSmSPwf = @[
		@"OdumeXBVGCCPpyJCkLwiueKGeLThfqCYotgCeLcMdJaooZOMFkeNYwsTTmUjpWYyAqhUgieOCVZIxDSbCUpBZTaHEbxyAvFbCLuVuaSskfcyZJHGqNrUKjagqYo",
		@"EEdCgrfWJRaWpfwlCxDdMDljSZSIqtzNcqqjQcqRKDTQETZCUzFoRvAzBxXDpwLLwYwnqeSnSeTZVHXahoeHddSrExxJSddlzpgyAkhPSzzTsweDzDfWx",
		@"cJqaSSxTTpRbjMXAdUGJQwkRcpqYBFPazAgyPPkiGwondDgqFhiBBSIWKsBHrLqTgYtLIZwaYFQLtDNZNhxbDwwqInOsBhLIQoiRjsg",
		@"cObWGZVmYXtYTPFBgoHiGuDCgyatYevOshJqyPOXuXbhEKKsgplGFZbcLqeOiERuodLIgMMjrGMfFPkNdCTcyEzRBlJEwYSEjrnLctPgnbWHtYgKpejbpGdIULVt",
		@"XFKmFMVbhJFsZqfDBeUJYKNJsxvTsEQghcTuHEirZeMqMhaUizzLSxzefeUZbcwTUIqyWFzRqyfKUHmWSkevCvMRCIJwioUzlNuxJOXYXHzcxcvRMtNfbXPOSkpxED",
		@"ZspWlcfcDWjVUHEPKFdjbkovAbfjsaRUrUvBdusRUBSPsxvHTvoBMqTYxkzGRTbHMOuwqVtdvEfalujfhbHXKwDJuAnLxZFphZxpEWWPOfxvdxDezOhZMYpLyPAxjGxYVTWwfVsZdBponVgTVsoQ",
		@"LVwZTbKpzfnktRXbqsjeDouHJqbrLOQeAPdYTOlrLPAOtjcNtRokiewWUZolxBxwjXalvbXSFffMVaBrAIDkwwjKefkSphAcdJjwcHzUGxYvKuwkhuZeBJpbeA",
		@"MXUqYUukXyDrskTsNcWGpkfAVABRJKImoioFDhdQFSnAyWDnakrGYrRuYGDmLjcuNPUUKTordzEKMRKxsCHhkEtIqTMCkKSgzaYUTlAEJkUWnrBtPNydiWcgnlRaLDL",
		@"acsXikJKVOuwjephrkZbhfDieYMRLMQMULoOPreVmvivsrcDlxljkKELcogXGZgSAKUMZkPjIWpdowLBqzptDMxXmdvdFicXbqyEnllYArsXPJBPODRLCDcbV",
		@"pjWJLOOmGIANpbWBimmCmUnKqJgqBQgNObvghkHXAnJLhTdTBDmmFCEpHEIWlJxXfEtJYMRwVSQmPpOSLLOESDxLNDnMophMRnydslqQMMyeAWUaSONwLFOPXHCNsmTxciCaGK",
		@"QxOMOyXnxjCbMiJVTKIZnYLslzzmKbfawYwBqWlFslevloldkDrrFwAXjWvHIagvlvCMnXVmXsgKjXuCFLnxoHHYeiRGFNbZAHKOQemgRnqDuLDWgXQExYFRtB",
	];
	return IZfVDxBSmSPwf;
}

+ (nonnull NSArray *)FrGuEFlXTSjEsJEp :(nonnull UIImage *)nViyPSMrwCScZ :(nonnull NSString *)npaGLlzrqPbja {
	NSArray *ftyjtVLSOXTKLI = @[
		@"CMclektEUjnTHbXwZqvFcHmKgBvLsfWQlfYXDobmWKvslRrQWiqmarUKDDEgeJoFaxwfVbUMLBEereoGbwOipBRNYrHzHbQtyTfUlYhzQqiTFnk",
		@"joLdwhnOIrJaoNswqSTFmHQdjoMNlxbUVsxxDjoSsOwcIRlKNTfmjHMruIkzBnKKOupqyyZFisWthTxvSQkNdCfyrXkVykLglOZymViE",
		@"ynTpJJouWdVnNdVkpMvflorpcuzquLmqOpNxyxydMCkLGGQhaJAugIMAAfzAxKVeYJQJfBLxLBhklWmCtxDBnTMirRCqlthFVXMUxmtplEbrTIrWZLUPTLqhvXjGKkFHgAxVSm",
		@"XvHgemLDKeEvoSTJVgaVWGZfFtcyuuRIbWYxBSqCFHUWGOQYKPUVhWuNOatxrOtAZUHWKoUqEpxclhvfJUEkokzhkwEwbnURbCkcuYsmCrIScYBKUEZTIcXdYpzsbkixDzUzjQAJibvbKbHJSlE",
		@"uGYFrBDiwjsGauEhqtcmTxBZxVWPrSZWPmwvMpWFFaLlkFVpUnaqAvuZxGCsPtzNqERukPWlbyzrVFgbSxhqSwNUzpzPIdsrOlxVBVJYLamFjUdpTDwqSZtAARlY",
		@"HwGfBhfbxhfKxsQzfjyNpiJmiIWnJndVScWIQkszInynRNNHqLEnaduLPlmWcaPdOUMjXtpNTvowJliSoZtFlhgsKgFUyXEXTrdKJ",
		@"XxlndmtkRiJUccNoWWacGZIpVyVsLRwJizZMJRUazNThWUsXORFMtbiHtvWjxealCveCXipndwxPAKxjSQGcbzydqRKJrPwlxvhjWMYVePJPjPVEFVAPVGuaEjYBtocQqhzhggFisWc",
		@"cyXyDzcjLVyLQBPehIdfNLRtRwwYKYNJWEgDSmpNMAoeFRDJERajlPiGrmIQswHoFGYibdZrysENNOLjxzQAKQDVhJumZpFIyPcJijTPeVOTjwLoVlgrGajerbWseMdLWGnwUFqudbfZNtNzcU",
		@"aHSiJGJQJVmWGQhXFgcRczfkALcogYUTohvlJxIccOzvhYlXXCoLZtJwHlMBDEigZLrrTlYwlIwJrwtWfmKhLNLIDhJFsLqKkArPGzuBNeRgbyWLig",
		@"QgfhroeBwdQziqbquaTPPlTbkwchHjdRAPVoHaPkSGTwSDsaisUvHPWvIPafJiYjaxeehDPtVrrMvdCVTjcuxLgOQhHvSMHPWvDsTTjxbrFkxfKATDvfBWbiT",
		@"JkBKqwoIirZcsyzGIDdPkIYJJBQnndEDjNlxGLGUNOhrarVPMDdtnwtSxiufobQKWvVFQKxJwemxOYIgfzYyJmocbeNSQnLZbVMlIfntErZC",
		@"bOjXjCMOBdYuWkhGxJkrekEzXWkDPfrRRbpBRULROJmDGCUVYvNCOEtdtHphLVYGdvizlyFQNUafwvCPOmYYNcssNxsvYfFgWqZGsUAtNEZIaWfbKoHJwoXCwrRxpCHhjMdR",
		@"bBNPgVjnNViLMCWwgNemxGFKjxQvRZfHtcDyBiqAAKLNlwynvpJjSzRxYZofOciLhTPvenhoCwgauquwTnPvOiWaazkVTaioksOAAIkeZcJRArywKubiqiXBtHv",
		@"WWcMLHTJuJTNczxaHYwboLbgWxKEafgnIVYRLIPCuRjtLchidWgWvuwufVLjqPamshaqgWdASRbkRDJFNjoqRXjJiHLQDNtAOVQSWzhPhSlrZhHPgjXiQwczMDcjjXESkKzTelTSl",
		@"DDPruZkvbPNfmvpapwxfebxFjdtHicBygyRekxReryjgHWVgsmchjLSVmESwTasgMvytTWaZaxbkrvVdekAwabqAaOSxBdXhnTHAPeqDyJwYiGWccEVnTDhjwyhgKReHFOPXYdYS",
		@"bRxORRyqyvmtcUsHuTVADpoAyrYGwDWgDLLinSbWrtHkOaiOAkgKVnaElGRkLNRcphjJsadaxglwboJtJZmUyKmhQEAneowebxvbQnau",
		@"obFfxrpShxtyzrhMVZKWZcNVwcXncluFXjplruZSxRDfgCMplaGgvpaZZUxcHlhFNhYsdZgaqkedRKrRniGiZZjeKTLfCHqaNrzoQisijyCiZxJewLmH",
	];
	return ftyjtVLSOXTKLI;
}

- (nonnull NSData *)USgOQuHCbKQEwdVL :(nonnull UIImage *)uUBxwoWulnPeEvy {
	NSData *bxucBJdtze = [@"LRbXSkpedOIbmqaDeBLtRJXpKPrdsofudOZsdYimZPzxDxpITjnBytYobMIEhrvjTwKCUEyvPVrQuHjOqZzJtDmDyjzKEQjEgMeSGZyPIHKifyByBGukKwXxuGbXDDkbhGpWGnFHLbLAeWkhHe" dataUsingEncoding:NSUTF8StringEncoding];
	return bxucBJdtze;
}

+ (nonnull NSString *)iuwqCfYZwTQIET :(nonnull UIImage *)oquNZrVxzBal :(nonnull UIImage *)kFcIotPOixmucPVFJ :(nonnull NSData *)pHbrAfQuXla {
	NSString *jbJhipmIIKJLxWXSFz = @"ZHycsZHcorcqaMmQcfFIpewxbZesHOAGZeBltKnIjqBfvBcKrYcWhuTZQpGjNvfOfiWqcZmKLjFBTIbwgntxjRdMkwWEgNbGQJhvathWbjAiUlAZveXzhIsPHHnazEldIlMfQ";
	return jbJhipmIIKJLxWXSFz;
}

- (nonnull NSString *)ZQcmAucWJYmBwrjr :(nonnull NSArray *)HvHdSFBfhketl :(nonnull UIImage *)HFNsLYaexZdxQJffR {
	NSString *VBuwUrwmMhZXofILDBv = @"cJXnJlkSJPlRwrxYKeAzYikANSjztTXhvnsoQDyzXThWfftfwfhRvKiOsxcLUUwUeuTqeSSXcSsBciHUmmTlYAqQymvqOkrKSSaJGDJTDprqofIHJKDjtneJddgGqlN";
	return VBuwUrwmMhZXofILDBv;
}

- (nonnull NSData *)jkCuYyraOon :(nonnull NSDictionary *)EMlZBvtasHlgTYxDiwu {
	NSData *zyVUhYOykcgxJ = [@"ikDablMgXMXgpVeexlDqgpgJLZCgglkloULJzxefdmjaXjgbFiNkngRDwZVBjLKMssBdzzBDizDPNyZPelfKhyaLEIhLbchbkDeZWpCptMHovBnmk" dataUsingEncoding:NSUTF8StringEncoding];
	return zyVUhYOykcgxJ;
}

- (UIStepper *)stepControl
{
    if (!_stepControl) {
        _stepControl = [UIStepper autolayoutView];
        [_stepControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _stepControl;
}

-(UILabel *)currentStepValue
{
    if (!_currentStepValue) {
        _currentStepValue = [UILabel autolayoutView];
    }
    return _currentStepValue;
}

@end


