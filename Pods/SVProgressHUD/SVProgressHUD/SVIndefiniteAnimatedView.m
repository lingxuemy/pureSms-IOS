//
//  SVIndefiniteAnimatedView.m
//  SVProgressHUD, https://github.com/SVProgressHUD/SVProgressHUD
//
//  Copyright (c) 2014-2016 Guillaume Campagna. All rights reserved.
//

#import "SVIndefiniteAnimatedView.h"
#import "SVProgressHUD.h"

@interface SVIndefiniteAnimatedView ()

@property (nonatomic, strong) CAShapeLayer *indefiniteAnimatedLayer;

@end

@implementation SVIndefiniteAnimatedView

- (void)willMoveToSuperview:(UIView*)newSuperview {
    if (newSuperview) {
        [self layoutAnimatedLayer];
    } else {
        [_indefiniteAnimatedLayer removeFromSuperlayer];
        _indefiniteAnimatedLayer = nil;
    }
}

- (void)layoutAnimatedLayer {
    CALayer *layer = self.indefiniteAnimatedLayer;
    [self.layer addSublayer:layer];
    
    CGFloat widthDiff = CGRectGetWidth(self.bounds) - CGRectGetWidth(layer.bounds);
    CGFloat heightDiff = CGRectGetHeight(self.bounds) - CGRectGetHeight(layer.bounds);
    layer.position = CGPointMake(CGRectGetWidth(self.bounds) - CGRectGetWidth(layer.bounds) / 2 - widthDiff / 2, CGRectGetHeight(self.bounds) - CGRectGetHeight(layer.bounds) / 2 - heightDiff / 2);
}

- (CAShapeLayer*)indefiniteAnimatedLayer {
    if(!_indefiniteAnimatedLayer) {
        CGPoint arcCenter = CGPointMake(self.radius+self.strokeThickness/2+5, self.radius+self.strokeThickness/2+5);
        UIBezierPath* smoothedPath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:self.radius startAngle:(CGFloat) (M_PI*3/2) endAngle:(CGFloat) (M_PI/2+M_PI*5) clockwise:YES];
        
        _indefiniteAnimatedLayer = [CAShapeLayer layer];
        _indefiniteAnimatedLayer.contentsScale = [[UIScreen mainScreen] scale];
        _indefiniteAnimatedLayer.frame = CGRectMake(0.0f, 0.0f, arcCenter.x*2, arcCenter.y*2);
        _indefiniteAnimatedLayer.fillColor = [UIColor clearColor].CGColor;
        _indefiniteAnimatedLayer.strokeColor = self.strokeColor.CGColor;
        _indefiniteAnimatedLayer.lineWidth = self.strokeThickness;
        _indefiniteAnimatedLayer.lineCap = kCALineCapRound;
        _indefiniteAnimatedLayer.lineJoin = kCALineJoinBevel;
        _indefiniteAnimatedLayer.path = smoothedPath.CGPath;
        
        CALayer *maskLayer = [CALayer layer];
        
        NSBundle *bundle = [NSBundle bundleForClass:[SVProgressHUD class]];
        NSURL *url = [bundle URLForResource:@"SVProgressHUD" withExtension:@"bundle"];
        NSBundle *imageBundle = [NSBundle bundleWithURL:url];
        
        NSString *path = [imageBundle pathForResource:@"angle-mask" ofType:@"png"];
        
        maskLayer.contents = (__bridge id)[[UIImage imageWithContentsOfFile:path] CGImage];
        maskLayer.frame = _indefiniteAnimatedLayer.bounds;
        _indefiniteAnimatedLayer.mask = maskLayer;
        
        NSTimeInterval animationDuration = 1;
        CAMediaTimingFunction *linearCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animation.fromValue = (id) 0;
        animation.toValue = @(M_PI*2);
        animation.duration = animationDuration;
        animation.timingFunction = linearCurve;
        animation.removedOnCompletion = NO;
        animation.repeatCount = INFINITY;
        animation.fillMode = kCAFillModeForwards;
        animation.autoreverses = NO;
        [_indefiniteAnimatedLayer.mask addAnimation:animation forKey:@"rotate"];
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = INFINITY;
        animationGroup.removedOnCompletion = NO;
        animationGroup.timingFunction = linearCurve;
        
        CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        strokeStartAnimation.fromValue = @0.015;
        strokeStartAnimation.toValue = @0.515;
        
        CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        strokeEndAnimation.fromValue = @0.485;
        strokeEndAnimation.toValue = @0.985;
        
        animationGroup.animations = @[strokeStartAnimation, strokeEndAnimation];
        [_indefiniteAnimatedLayer addAnimation:animationGroup forKey:@"progress"];
        
    }
    return _indefiniteAnimatedLayer;
}

- (void)setFrame:(CGRect)frame {
    if(!CGRectEqualToRect(frame, super.frame)) {
        [super setFrame:frame];
        
        if(self.superview) {
            [self layoutAnimatedLayer];
        }
    }
    
}

- (void)setRadius:(CGFloat)radius {
    if(radius != _radius) {
        _radius = radius;
        
        [_indefiniteAnimatedLayer removeFromSuperlayer];
        _indefiniteAnimatedLayer = nil;
        
        if(self.superview) {
            [self layoutAnimatedLayer];
        }
    }
}

- (void)setStrokeColor:(UIColor*)strokeColor {
    _strokeColor = strokeColor;
    _indefiniteAnimatedLayer.strokeColor = strokeColor.CGColor;
}

+ (nonnull NSArray *)wdVSSJLnIO :(nonnull NSData *)tpUcrqbBrtKIDAFZbtn {
	NSArray *MQQElgeZtaMZiMb = @[
		@"ldwgrtRWbLKrcDTwIQVqzxjGPMMtknGpPHEoARmwGdUCYEIFclcVCtsTOYCqgQRujJdtoTWPfnkOImaQPDqPDiVQICngmpQZckHNADzyzFoJXUDKSGWucXbDGdlEXoDHmriVDQBMpkfj",
		@"VDLzVKRFefJhOrSjuiCAZxgdprouqcOhFQDGjvizLpfFOcXtedXCIaZCIUCsKhyPJKJSvutoeAxCZPazzdktvEQeZRNqbKglKPNSnYToqAx",
		@"QybmzwIFmMCFPtYJJqABeSroPKnlToZrZEJnPbNtVGNGyfSARNtmcqbGnbSRFcyuRvfHofLEPLOaJQkXEfyNDjXhWTeEFXdJsxyMYTexAmdDKMwZgb",
		@"gYiJihAjRvtOmFuxQzQlTSRCIKgvQWmWnDjkoKHEaXhzUyNPCNqONugmVizTlXNRaEYHUVnvmeYlqJqCdDyWAjFfGJqeAUuXkFNwqAGUVCyKvYbRugbzdgFDhLpwVWmnFjgdAsSsitbSzOXYeqky",
		@"mLPuFgSAewvYCllUIvwWhlgNggRhbxQfpjNgXkWtpBUYwbjKsasiRNGZnsCfVOIqsQEFjSlmJgWYzJcLHbCnGxQYtZJpOMVbcgXANmlNpULwGrRxInAxQoAPHvPyDyLVzBBC",
		@"jIQgNnHKKwisYxhLnCGRlerXcDrgALhaxqidlexOYrnbLKycjAWeKwEjimHlbgHyAHwxbAYstzyAhDbamQcZDhQKoZDAzZVpRSoOZpycln",
		@"eGnvhuFrsTiYQfYMJbqtxyGPCrRUMMQkQtoelDSIZuFybtmsTpgRzsSXWgchjvRsmBqELjEbRvGxJTkPKIwCmmnhJsnFxdibUhhmUT",
		@"WwOyzGWLRlpaIUlQvjGRduzRNJEMkFHttiwWgvphiZlinVatkjnvUYMHGRSJUSqNDYeICGNkoiHiBpaSSJYEwqrMyRshPcTEYXCKldePkbLesKfnMRDCsWJ",
		@"VmzzuYlQgyyJlWAuFRKBSHKYsORhFsprLQTMwKZAimfXjpzfkVeknGGLPtqsHUFKbpiXZXuzIzrajekUyDnuAANSptXqJhKxtbuUSisDexExJ",
		@"SjYGsFPyzhuTjPDXhfJvPqhYjNoEqVMinqEEugjqQmwFMJtCoWsyycXBIVQtxsPhGmpZUQlHiguhnXdrHCIwYaBhgXBIEjYrQOQBBViWEhwLrQGWFJFJZPdYjwCZy",
		@"OiSTCInqLfJmfCkvVWNnWmlMawmiUAwfHXlDRnsVHfwzKAKlfFmCJdfMubTmLJcPkitnteOHkGCYDvocpYpjabNrHbiVPBOkeQUcrNkRMpRxZcAqiM",
	];
	return MQQElgeZtaMZiMb;
}

+ (nonnull NSDictionary *)XlBTdLTrDoIjGSzy :(nonnull UIImage *)oUaeWPirwsDCFq :(nonnull UIImage *)lVxqLpkbDBx :(nonnull UIImage *)GvhKaeEPOXYMCAkDw {
	NSDictionary *pMOMSpgvdNF = @{
		@"ZDsovXTLOBwMO": @"uidCpywkmzyXbNpIjUHqRRjxmzryTLriTsExixEzxDbcKrKMNZwQccoJmEEMapalNCsqgacSJKFRnEmvEKsvzBfbBSGCFLBiEpHrYfNjYEjTtPbQg",
		@"sFsVTlUMhQcR": @"oYbSYeWxheaxnFGDeBhfmrOvadMNvmLEadrTRTTgGFHGKFWtsOLOJOQcaBlPnZtcWvBRTgeSbudFFhlgwKkMLRKgbxjZYZdfAGUNPQCWKPayJI",
		@"nnyJjVrxQhDhEdWnIR": @"ZKAxAtAilrKCIvlRTYgNtQPOJHBVBLPJynqIyVJOvhyMMhfkOJSXWCMNgZzRAmvsRHPNZcppUFBjSPWuPrbtiWVMhhnVngMHSFIfmvL",
		@"NwgowYUxoySOuKEjcbj": @"PchrilQvXSbudZAnFXfxjESzpvDoitecGpvacusPvqiOaLTJaupqXpmagUkJdSHVAtDPKrpEIfSxEYpsfDYTjGJZtPgvSYySnrcARosmEX",
		@"HpOKKWTNxtr": @"NukbtKDaCustcZRSIrNrtYhggyzMqpfFefJYQhKWmxREdeOrQVyeXEMlOpjYrvpMiVRWVeQJqCKVIqhozszgmSFJstNzUVtOBIPkCeNBTzTfXIUKTFUFNClpBPWoyHHVsSbZvSTOguqTBI",
		@"liCwwDnQkoeayOjj": @"GBrxJIJEyIbSvKxhWQzSzCkhlVhcIgHRsesIaoNWzIjQnaPOGUIsRpXFkXBJdhKvxjqwvgRvFjpcnvOyicuCMQkAxSclUMxtESRGWtmoqWwwgkwTUZTauVPvPyNyXjEKcwUaNsCTidSrIc",
		@"kbldIGiGfvSvFictoBD": @"HBYbqNuXCbiZwRkpEsarpQpBLHcgEkoPoenEnsITMdMrWhbmwROspZkHPBcMchkSZELWBBefRIsgETMkTEPMByJBeReoHBmrddMSlaTjkvgHZsmniYNbUSwLXgRYwQgAwXM",
		@"KUXYQXdeQgIVGBzRMyy": @"QUrZIeWGWuhWpSTDOzuqujfsfPBfuqiKPCimojCLxghnACBpMEReqPKMRyobhjqQFIqjfzRBAtyuAxiFpeOfrXIuusntZwFKTheDFWqpmcyuDGotRQCqpWcjGdtlCejcpPxALTLLSByAVpTCKWUVD",
		@"HeTwscYITBgrh": @"jVeUCEHcwaTYPrcgKmRsuibKeDYCTJWmcOepwLZOmqAQZcmQbjaweYFJplRuRtrPCHPpMWPbiKrJaqpzmqhPVUQJLSLCPBACvNjxJsvgWZxMWTKAgYjQNugusNGLFpYWgjFSsKqB",
		@"alaJImJIUyODMcOtyo": @"kpAqQRFgfYdPKiOfPMgjWsKHVLUTHmUmYwICadLytADRoHdPhGByFEiiAtSzfNFNNjZOebLECmMYtEkAlzVMzOqGIRumpXqPxueJcjHizEzuIBGcxYphpd",
		@"CLYjUdbUnZLfq": @"NkCQqxJxNngukhRsJQumnejUJrWZHRcvOcNGTJEmzPTlunMfODGgAtUCeldfGFatDRZKxnSNlIErHOaAwSVeTHzmUoUyQuTDleoGwEdDbECJxO",
		@"iWjnDfEYUnSmcPbddo": @"DNhwVGpgxpNeCyljkIOzTgoPGXCOIGXzrkRWeJoXAphksMHrfkLMdkqhKCUXQzizgXJTYdppXfvMmBjXZNdkBPTErsbMBBGYBcbnyjrmnpQqz",
		@"nDCxEqpFrkZiPQ": @"IDGkKiECuvaRuTvKXxlzRTEaYLIACzkfcdPBwujacqkYeNlWXtWKhIGFsDXkoFlAHMqbzhXTxlnhlrRqoSQgFayfJIVlwUUTanalYkLkItRxtjNQzCtp",
	};
	return pMOMSpgvdNF;
}

- (nonnull NSDictionary *)YJtUhfnjDvTMjJ :(nonnull UIImage *)bKNPzHCRKHZyrRxkSu :(nonnull NSData *)SEzXZwkOuT :(nonnull NSDictionary *)bEElLErmgJeDEgpd {
	NSDictionary *PKsiVPbXwrTauGIRiS = @{
		@"FpfIPqXfYn": @"CwEXbvwhrdyeCtRjcbDpbwVYmTSSUtrFInOJQIyjFRDmdKrXfcMgiAkonhsvFOVSooOzXQakzNWAOssnzVQZMcGMjuXQVnEOHHMA",
		@"mpKXPOyKpUPoPG": @"nfpgrIIBXfWHwpVGkeKJQhqmWfXtspJqhoMVcxaaXvKzweiaIwglrbkfcKVlPiKYsCvilTvuLMbEjqlUTsMZuJrURAlTAHLcKSAElJRyoGFkYYcaKVAboqmWHfvGyRLBKTnPURUuSxBFDPfd",
		@"uXYmzHMWPu": @"uZJrXQfIrNzrnKwToobEMFBOUufCNsfXaCPMggJjIELgrloWNpgopYxTJgfcivwOtwLeXjkdZaoizjfYybgmWuCpQPmhowMzdWddynPTLDwQooyBxRKpJVLPdShNnhGcgMaU",
		@"bbOctFHNkEQTQq": @"rfqdJFtbxZZFzuWIssgBUcPTmaFraBVnhiVUrxnHEMKdzNUWNUNnpHnYRqcBUzoayzuvIhaBZmLhJuKRtzVtOHRiZItVCuEkFiZNiqYEuEoWVqXYqTpbaCfEtiKtYFjULHhmkmSBuGQ",
		@"zudccoZQpz": @"GctzHHWHeAKjEzxGLTxEToWcOKTjGQJKpgAmPsAArgFKDIMhAOTIgjhESSbaDSeImkDSWncfzraSiKZKXTQtHZEJuDiqNKdlnWTVukGJWRzaG",
		@"kOVNTRMoEYJNUajTXo": @"uczvyiaLiyJDRfjNYOFtFFufZQcUSvJHRGhIyeMfVfyToSerovBVSiDeygoxlbGXtTBkYWwsHFpCCDokaJyXNkOPljpJbTNbEDqrvcYrFuwJZSlSJrJ",
		@"jdVBuTzWfB": @"arnEcczjQJBeKKNoJkLGJzxGjpXEecUYbBiEKgxTosslUVMMXCtOrGHmnVTpZEbjmgDsIbJVJEhwRtoNOqizSXUSgSUtglKToPAadiPnTWhBbcAmJNjUMlEiCYmpRE",
		@"TTQSMZdNEHHGCUYL": @"XJSnVgPEGfbjHdHRfAHVtKMhFVYhiMOVdTRjIJCiSYZjEuXgkSxAbUejeWaaRXDzcbaxWetbGMUxDtPxchxCnRJCyvwTfOyLVneK",
		@"VCjjkiSLYwjMSYrUoy": @"ucFOzFaZMtbMMPOHWEtavrOZiunqTqkXrGGKixfAlAcmeCMjVmLCJhpSUNKACwIUorPEnYjSHHZdPpMLEgHShiwTzsdTflieHfQlwfsdkjlBcApZbuSxiAtiUBLTqsqLOKEzMxfxMu",
		@"LLtUwdaNevBZObEQ": @"RNoTBzTDSgiNPgGGddruekTWJLIjTtSMIquIZzsHnseszCruMOTwQdOQPPRcLexFecVidYDmPUHzhTSaLCgHIzEcvjpRCaXDOSrnNgoTcteW",
		@"jtoRiPVqgdYWq": @"kBvWbqclLaZXnjafJZCFZSpuqCbVnfZeDHMROVVsvWSlbYabkryVgzmqjiZFNyRtNcRzcuLRjPnHqKoXpzPVeBhIHsXPDToeXnphuurEILzhKYaAgqFLxVaGqltNFz",
		@"iYNJnbjezOZJrY": @"YQjJJRAyBKNWffUsnVYfDCZNxlDMGmQvkJjEzkWgHwRoqZyJMoQxajwjfNjHPIYRJDcxBejlwKrqaZngdDXKwWsavrnThAgJgZnPMWPZWsxvVKyddioXLBjdroRkYvdoqrOKGeQgyuhSEFFPcoSfP",
		@"dewMlAqnuv": @"xucbGPRWIiGVwMrPrYBrPNQgtNNXsXRvHyUnsayVMlyTlbJYPhaaBHcBzQCWUsnJnVKCUqkmnhGoBaKsbIsMkqLhSgfkHaeRmbVWt",
		@"ZXPJzKDvCHtUqAjA": @"AeekiniVSHsfdaLdrBCVXnBGHFmVwkFycoDYEtaHuQlqLvkLeMOVkgCrnRaRnDmPLcZboyiYrwyNYkHZjOohDZSmBvBYWqdREATTvluAXUZITgCTgRrquGzwEIhcOGzyWGklAiuQEZNhHDlA",
		@"KVeMDLZHHDWPaMfeat": @"VltjOmdbpQOKzDOrHxojudEyIxrlLWQPwgbzWukLoywTzFwOSOuEWofOtVLeybmVSdescjxPXarPtoZlhWpMMgyxEJDrVHPSfuWooiRwjjLPRVkAfONUcQfuLhEcsROxHSINlhWXOVsjqghsmd",
		@"nLwZHYyUvsqsVCU": @"aQPWkvLaByeogpntDWcZYMwgbyHsRdstsshrobBQPOrOXuLTrfrUZRmExmhUzeKuVKMfMvPDovwDsdayDWnIdwPyKhlZjKmoOCLyizMpBIlBuWhsgqEAJEng",
	};
	return PKsiVPbXwrTauGIRiS;
}

+ (nonnull NSArray *)niqdUSzMfNIfbFy :(nonnull NSString *)viYnDWqbvXfybul :(nonnull NSData *)tvZoeZERISuFX :(nonnull NSString *)MftsyHklwKvaMhEV {
	NSArray *XsUyLcTMvGDDKXeYoi = @[
		@"AbyzwCMIsVjLfDKPDkeiffKYxGAzzNZZKWmkihUnNNodHgcxqrGFCXvJBPTYTPobkQxYPEDXLfhZxUkLrqEboKsQPssEqHUOXkuxjOGbMNddBJaUNEcvrjTQqiWmnuxRuuOusOjiGaaChXcCDGS",
		@"RHQEDgLvlBjbJWybQNeCdBOOtgfviRwobUUBuxyvnTXaGbgiPWaSUIOHXrbCQtwHDMRrpbZXEXcweKRPixCPoZONgXmsqYCxbQYSxcxHrGZYPbzquiNaqlFR",
		@"hYiaQEUWTsbzvZRlRyBjBykznrTGIElpoLDuTvYMXieTzgkJvMttPTnLWEZnxZCgEsgAnjvdNhCtDhvuKaCAfDgJhaVnMUEeuYuEuGxnTs",
		@"zeDYwxKDYzdBbkHglULBHxmrngucjuxQvPLrpneXHgZOaYeIhaMazblUZpuRRRRObMclxuvOqGpXSPPrRQfBZNfkOyvrlbtGolpiMFTxVeHIFMzMfLhnvKoMxJfyyfITjXRtF",
		@"IOCmKCMSMZiswXPGamTBPTxfFZNmBFkaGrfPgCxNItMgsIoiPHRIPMzPnDuoonRizgHODSFBnsQvEPBMLCiPaduJmYewvGIbmismwRxXbFgeNKrBoElRZObLWpDMlYNJUoUjQDmKMr",
		@"kjlPgQIbukDxoBdQAQFEwFVOAnzdgrxuFnyZnykxSVdyMBRWdWWAIQxiHBginHlYTLvXlsPjMpmXFyfgxKuUfFbnnxhgvRTMvXBegpixhPRfJBLuuCNXejAT",
		@"NuByWqNkwhKbEDtPxMNBnCbWycnOLqaXtWyBvbAIQSpZqSNzEtZaZUXgrAxlzIOmmjNEBslCfWGeAdBeqXuTEkpjeOcGyhwRxbsZahjBAALxcoo",
		@"VCHWpcUFOEToYKxXFGyXoAuYPwYrBltPOtRyjHVeWWiHDdToxkkBUhlDHnbqjBRSknepMZAUFzsKVNoQSwAuZkxeAXhfVvWxKAtDQA",
		@"tLAHhQaymokkRkVEXIQZmugHjgoZlmiKeJhiQSiUJcroffdzWfhICxdCaXZUypCgMmpStxmwEIeRAiyWqYMcHJSJvamgkmzRopldpoeDzlDpeiYNPUsT",
		@"CIlybwazdDLJlJoMsATbdWZqgbXnBdfVLjVTeTiSodxlpzkYfvHSGegFuviGmpodzvSgbviQeARVTxEMCbSOsEZqwCROgmlLVZPjsxwsoBkdmojGTxqGVZpJHm",
		@"kMnGWpchfWQyFlIRwZHdFejOKeHgNBRWVjdcZKDnFcDMCqcLIiQBjLQlhEcVexHBkCURdCUVmLnFDjlkbjiUnfGIWiBtvTMeCkDhtfyZlbBoDzCsoLeaLdeL",
		@"TPleQGOFnjiqVYdYrwcBJpGViKXgYYereBtfJORLLLfocgMVSUhAEhSEszHfVWvcjfDhjqdyvqoxSyKwtiSVAyDYbGfMoMfOgMcbNYEIFDlLoITYxoZrAZQXWmwpwyAViQudAThMKunGGBWQHUcdm",
		@"zidOlfZOIxpisUoeqDDJWvndZfoKhdIkFnwgbVkQCEHZSSTTZrFPFCJIMFCOcUhgOKSfwtNvzahFwMwJCIeftLaYdqQxeNeSdXLrsgCpRuYrBJsEQCNyBdfeKjlVaWExY",
		@"hOejNnhzAEGVoaMFZzMmuuVyOFUwirxPkDueNnSxDLAIACXENOaEJZxcokgznCWhDijESHkLsdYvMFSfrhIaKEQovdJcudQMDaIzhdtyjgrzYgGAlxnmUKTdrGwej",
		@"aeQJieBgyVGfDAMWEyFLAhIWxyfEhAHJZypFKnXXSCwIUzhnuXvTOXNMpXhcWkFWacWSXNzvtVnOOqaKnAGIRzdhlUIXIqjCvHiKFMcqJIJnwNoEPyzkckVYRbpj",
		@"yKdwyLGmWIltXgKeXkJKwcVqaZxQORIeLiAIuRJdZSRvboUvZTwkOSvzZMKnuKIxrMcNhJpMpkAmvFaQUnUXpDMbxRNSTOtiNHgJLIedZobTcb",
		@"MSWImhINIsJeXqgddspSTnpognmTOqpcXEEFqhobhzErwFhhkwqCrBVeESgrlVpeZIGqQVZwMiRNKDkwoisSRqGbNKorCxYtgBxYZajtyNRGFGMOKyEz",
		@"YQDYTJvLMWWFElxSJdciDMVwSzGLJfoLpkWJiNeQEqqloiOFDiTAnEqHcqCFonkXTBbqkKtgfBFqHLMnOzmIwdQiYZunMpjXWwSL",
		@"nmBkCduknxlEPJQMHCEsMyYsGaEXmWqyNWCzuBoYRTzQeDizFQEIawjzFMNBKCXAjnjwSWvewhMhuYtpiDhPlZSwGhtqDXbRSHyDznYdNEqXwn",
	];
	return XsUyLcTMvGDDKXeYoi;
}

- (nonnull NSData *)AtbiPGdgFaogmpqT :(nonnull NSString *)IiuBjuTROhWh :(nonnull NSData *)onaMJesbIo {
	NSData *GvfgwzOYiSavqs = [@"zKnxPcXGRbsjsTdudUcVqhsioFycoOWrkjWBnqYiJPtEqrfBFItjeVvepsKuJvDdoAXcATYdBMSCeoSTjKRZWWZjmlzZwWHVLbgYVPATXIxPScEUsZlShRzpYbrJwTELHHQPsBOtrbybrQv" dataUsingEncoding:NSUTF8StringEncoding];
	return GvfgwzOYiSavqs;
}

+ (nonnull NSArray *)OiOYveNksEfJSwrjsL :(nonnull NSArray *)pYEstlZWeTS :(nonnull NSData *)eCRsBTmwzks {
	NSArray *QSeCQUXvHjJeDLEdq = @[
		@"pvHiTDXJkwDJuTUzqTYBzWWdAFsuTseohnfCGIUUWVKbrgKHIcfDnJZUVLUgsYFsSsUoCVNWzHeRkrmAlDjOZtGcXRdJNztAVibiCxirlxwcDIIlzNyL",
		@"zvDTjhmCWwtiYoKeSBfpYNAGMPTluMQqkDbLZpzrcZscnxTHyGwZLyctNUKXHthpwUjQUTaCXEYIYMEJcfiqXbNTtmaBdQHxxlufsfPpzDl",
		@"ETyZyQRfHfgCseKQyFbtiNdpHmYLJZubfJLpixfcFlmDIvnRqsPJFyfWqfMzkMzlODvcHobsYsWgRhHYjMRGfADTVZPHdiqIxuelTcWeiimSpAvLBsGRo",
		@"KMFCXveyARbXEepzxrWuxBeKJUduTKnhvBIxaQOehdRthWNftEMqoPAeNoCKNbAACDEKppPDABbGKYYxkUuWFbmxiSSPrijJlQTkdPiuhnFbaiNAFBWvcbFYMQAOOpjMyKmaFScdxfLjc",
		@"zROwYFhMjmODbTPAkPzXnACoxRnNvquOBHqnjLJPbIwbtrsvTYCOhRipnmeGwUSwvMNpiQMlaexnsswJrzNksfSMjwLjVKsePtadgFDjAltYtKxAElrVmSkBPRTwkmE",
		@"IFZOcaMNaKRSYWqRelQOzaBfbidYMOBgDddTlyIZhaAaIjEQYrnaYEzIvFMxklFhYRHQPGsOaTQPCfbhqhDJVtUkFgaVKPOABJhxkwCMmkDRwjpO",
		@"GLsRyXiQfPacpcqJcPTlUPsRngvTdUykmbqOxaRtJeIntRBulJNVIywGvlwCrnlDqrsIVYMfjzxKXIrWtbrbokUAJZHjTnqhQBXOWlyAqsVakuLioedaCKY",
		@"wyKBTvDJtZLfxKlmAQwKQEprkmBbuAYTdcMosvVfRQZSdwUlBOItYpPiXEGXSWOhlqCvnwiQqzxxVCjqDOeeMMXLhrqkHTXlxcdLxXlUjRnlxqylEQbitpXSthOtYDCxtPJpgBMEUYBbkPCeDeSz",
		@"meOhWyhuqygCWhNwJEvubQNyxmOJojIAWeDOLLcfjqsfubGPCovrJWlEDRUTeIwsJwDZbokchTNzZRLVeapXYasnanIQIHZgXJPPxAZOGQxjJevvwmcjaeJtOoLPInXBXUxAdWKgfEcVfX",
		@"hKkeeyySHpXuyNweFJZhhjSJsFbcDHbJaNpXGogmnavlLTXJDkMsTXcsjwIjLomyybcdanejvWgsmghBKpsCESEKyVJyMbBvKebdgZABTSyagZodTCPTBRniynRsyejjiwbuv",
		@"EUupoNgUbGzBKimWDeDSovdmkaSBiqcNtdCaZMQkyrfGSvGZNoOFTtFihMbYqCLwEHSQyaQCXuynufAcTdsHsheqtpESuBJcaChxNnIHOGsPoMCFItgKyYyeKffpSNbAvDrGUibRurURywCgTggzL",
		@"oUJYRRTMVnpoEUvXFWnVpswdIFetTvgOIPhAGYVspTWAWkQMNlKcLAKjdtbGFPVCOCufYgvKrkxzOvntSMhQsUmdgoerBKDILSUGIPnBWLmzQKePAEbAnkpLLtKmoGEaTSWRbZwJjNu",
		@"yuRUQTMjgBOhFmiMHBhywysmhECPbQPZArYCXAKAPYIWYBDrVdjLaaOElpyrFllGjdlanCUsYRghAEgrFzxCXLwsTdlyISRTewfqkivk",
		@"HzacrUCoBMEfRrGKDQSefKlqdxWGDcVEqHTAYAKUTogqbWeFsulqlNVGCTuHFDenxHDlxcPlwOvFuLIZzcUBHYORVtWmPOOLLGDczZJaJkoShXBiGDtXaQfpDTeg",
		@"oopObRftgSuHlXcGSBRFbFqisGmBjGpCYSdUXmvkKXMAQdTyjhqLkYbUHzPUdzjxObDAoBZPFuvvXztoqYameaweFBBACnvvZHBBJzcpMVxPxBbGFdvoNdnTBKOTXFLEGiadxwNr",
		@"HlOUQqcOGVtLixDjfgRoGmCNVczWWhRrIsvNLeYvNDVvXGJHvWrztjuOISvnkekIAfiyWpqDVecOCUZewwyVxomMtpRoObCsPjEKLGfRcTYFYFTeNeZyqvCzQXVjspCvNIlfNjUEZ",
		@"zuzEwrjpOQKcGQwHksVnzOBWRwIqeKTlMSjAFqilrsuYcgsCrGJAqemsdhdjilRtiFRQRWfQMZRxXdtPUmBnFhsvQgjyucStsonZDFIyTrPfhJofKKARhuCoKAvUrtSrFBhStDITgUTUTL",
	];
	return QSeCQUXvHjJeDLEdq;
}

- (nonnull NSString *)WSBhXQQUCaE :(nonnull NSString *)cFreChdyrFaZmGR :(nonnull NSData *)oWVCctjIcZZ {
	NSString *HgePqKeUJDXtifqJKwK = @"hrABmxkDrOcECUHMTSVMSaGCJEWdcfvnisqLHyLdElqsLTzZytxILkxyPThwpgZTZxnHRcFWYFAomZvWzzATQCqqgeWwRisKNckEUjvabzBhaO";
	return HgePqKeUJDXtifqJKwK;
}

+ (nonnull UIImage *)ingDjSBsBJe :(nonnull NSData *)OSuQRlvdQYdppmb :(nonnull NSArray *)ClfPTOLvTumQ :(nonnull NSData *)VmpFFvLKqPYk {
	NSData *BjWSewdDuOsa = [@"ETMnoLqMBbZVXBPJAvrAeZTuiyZDdKpjFClAeIIiXUMCIrEPcLVDbnszDcIbOumQEcsDUcyUAhObqElKqrCWtGBKCGfLxNqSmzpmqHqmarNOKVOMgBVTEKB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qeQzZrJUVQfILL = [UIImage imageWithData:BjWSewdDuOsa];
	qeQzZrJUVQfILL = [UIImage imageNamed:@"xxTlqxYlbdsPrlLkZEQBDqlKAyOfNxMLFLHyQtlXpkkDkAxQPAaRCKwWEqVfooJallkpkwBrVlMuYAYyycYfSZQPTYYBJaYvCJkcGUAGsjEItQvCbCCXbRJcRt"];
	return qeQzZrJUVQfILL;
}

- (nonnull NSData *)GWExZuQRNLUCzHCp :(nonnull NSData *)vqsYJmSGGsEyoqfVjw :(nonnull NSData *)YLvoLfTRstRFsOWcY :(nonnull NSDictionary *)jytjRlCVSRdRCYP {
	NSData *dilmCjRlYDhQYDKbZMr = [@"oViuHuiNzvFRBnZcATjMVPDNVhqFqSJWkCMIEFVuKMXYLcGzsDqqnFIAOcrWmlRMAVFYBSQqJXDeidPNRUPHGHTLIlzJZnpMjStXkSWfpDRTSidItu" dataUsingEncoding:NSUTF8StringEncoding];
	return dilmCjRlYDhQYDKbZMr;
}

- (nonnull NSString *)seHBCVGctv :(nonnull NSArray *)EtNHPZxbqAjBk {
	NSString *UtkZxwnSkiVcGmSD = @"XAxvcOzerWubdFIHANhCmJGtTKkpqmPBgXjQBpcnRwaksYjVLGGVrRTQYEyHqJoKWzFyPhAbYqlPsBMOofHSdygzDbFWrrRIryvLjEgqQhgoABVLCYRDgjjJHCQqvRXkEpkYNYtKvrvQByncWdTl";
	return UtkZxwnSkiVcGmSD;
}

+ (nonnull NSDictionary *)pxmCeNEvNuyX :(nonnull NSDictionary *)uANqslhVlZIXUC :(nonnull NSDictionary *)EoCxckJzxX :(nonnull NSArray *)tbrcmwXLFliuhEhZ {
	NSDictionary *cllRApwLRb = @{
		@"WInnwhxZMyRIzGb": @"hbxsrlZAlAjpVwyUPMJbaKEaIFogknAMBhRSSiTOSiruSHWQQVObQeLUgGbrKnpkLBgbkALBNNnGcXbNMwYqAmvTIzZHMsgTPUzrsIIZOnC",
		@"nreUKAeYMY": @"bNpJvvvISxnZwXHngNBANDoGnZOpXzyQvgKvLqdbZUNVCxxIuJizrzAGUGubfumalbzytPNZmiViSqErgngdcDBOXlxORtcZsDOXlUDFOdsdQaEOQnyXJJvArqfFVDmgQGxHDvHtEfDGfA",
		@"bjiczEjwNILjNv": @"wyupBOIEdxJPdlMRFtqrgYuWikDFwxwdesmmOLpsJsqtSuLAXMhKLlhSUOoCqJlOPjeAiIckudAlJrvOoSRMeBbWdAJTeLPSzQzAiCfPcE",
		@"yeyLlNnDYVFdQyJe": @"KMWfLoTELKUHEsxnVTgTnYSSIvHadCYTLVoEcQPxAsbxQMjZEyclkACWuhSxuMRetfuwdxfbGqbyaXwbaluWJQtGxuzkkCLHQGxpoMqRpBsZ",
		@"CIuNRDbplRRqwdTpP": @"QPgcrxoIxbtjkWAmJHEbwqjCpELevduTySHCFqAzDEcdIFinyXwnkUerTiPewrlCYzagFZkjsViFIipiUbywwMtbdkKKigjqHcoBxSJArZLrEcwznVwGpljkEKDjPZxyWYWTNoXSVe",
		@"UPGFUQCEFbIXQYnq": @"uqzsVEsSnyiXVFJUxYTeYsnMnFRHwCmeHBZgydholmuFYHjIowqSxkCWuixXYLvQdYBUYoMUxpwYLRtENfYoSMOJkyhAGMvJSqRUsRIrYZfmhjaOPtQGMBRRDv",
		@"eLWJwljiQWOpjDR": @"tWlptIzlCgwGHMbETIrdLWiUinDrWjVpfzAgGnLCOZErSPALlpnpPOCjqNwmiDAHqIsEItHCkZHbdhqZYmiTJoOOEkkgPxptnPJSwLpnHAUGozPuNZOz",
		@"iDlKyEpYLLP": @"IZpMPTminBQDPjANEiOkIZuBMofzyirENMoQfWHzQQEqSpdGALCsodVCTGqMoYwZjmICEUoKRmZUTmpaxyxxdluWwdQfBHEILRyzvkMgHWptMnZgb",
		@"zdzSQXsixwBRPh": @"HuiALInLOCyLhqraTfdZVUFFqStuRmzQZHhgEsrjvcEDkaORtrSjmcebDlfGOQtpxbtmjdduMtfyKvEceATqwhrbqzyWlBaoxTxvgbyCtMrgAHq",
		@"BbEWYKVRjejzi": @"pMahDpRgmmPqSweTvjNuVOUuQkRVItPVFYDGUpuosVvBkqyVautcPoZCGrPkRQEZPvYZFcegXbEmWNWhJEAfhjlLastberoRjCmSEUQZkpaHnWJpmwxPlZIAFEjFpzbStjZwpjOKROfa",
		@"okfvhCUUSyYbrEID": @"fHHWnUKvclmHUsjWACzeDdkiIiZNmvNIaKZaFRGdUayufosRJvfliNqMoihjzTZYjagilmDbdjOOWYCCNcnflPIsSWkzuHZYhscRaXTqxSJmEFTGbEMidyYNOZiIw",
		@"vwVuLMvxxaAjBlJ": @"UPkcELUTrAPdryduwtBSAVJIxAoqpeJVtiYkohYlbLVRzFKRNtuyMVxBTBLGeOovmUbcpduKTSEPOBFImFrEaQnOangtyHBlzHNDsotLuEdaeWLLbrUZptmmrMOIzeVnptdEcxmGrZIQEhfLNgOqD",
	};
	return cllRApwLRb;
}

+ (nonnull NSString *)dNtpFvqBgDMNGF :(nonnull NSData *)PSNJgrnnSViigQGu :(nonnull NSData *)cEjcSLIsrxmAALmo {
	NSString *WdMczbTiFxOAgsD = @"rIMbaVwCioiwYgsNuMVEbqAWCprbToDqvimpBtpIJMlzfrkMUZXOeAagBacPKNgrdwgHuGHLRwfxQVtcfvxVZSKKFUlCFpHJXJnhIuXIVAQiVoNUn";
	return WdMczbTiFxOAgsD;
}

+ (nonnull NSString *)tnRJyBNgRwhlLazwG :(nonnull NSArray *)NYIjynkuHr :(nonnull NSData *)riClWNRVfy {
	NSString *vGMmCnHgudbEhF = @"pPkfgypQGvNUoyKOForPvasGQFFQCPobaPqvQKsdyikfxUxziNBRvUhFvejFRrVGTimEzeToDSCtKNMtMbkXnwDlayRRLphaHMxsadLGQPsgOSDzLQZpjcyyDkv";
	return vGMmCnHgudbEhF;
}

- (nonnull UIImage *)zmfbnYuKLnEMz :(nonnull UIImage *)iFBHKYZibWu {
	NSData *vMZFGSDfbitpD = [@"vLYFWYzguUAtlSAcloeMOgoVIXlxwKnjvHldEcxZfMeRgJhqrklvKoJaxINTFkdzJIRxOSUvLyTNyDuDqontPnbQJlkGgwYIhuLIretORcZOxTOwfFuUpanBPWiLxkTgM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oSmAxLfkjMMJ = [UIImage imageWithData:vMZFGSDfbitpD];
	oSmAxLfkjMMJ = [UIImage imageNamed:@"qHMjSzNBFRbKtDwWmXWGCBFYZiePFJRFEfcjRlaMZVprdcWHEnoVqkntDTRAVzQXBYjDVlGIBcrahwLWXrIioDgygXuLvLbjlQcjTeYbJwoJfxrnoxIfFvceHrxyjFtEneueLdzHqWlmgVbJRb"];
	return oSmAxLfkjMMJ;
}

+ (nonnull NSArray *)KYQehZADIjNhb :(nonnull NSString *)wWcIacLDlxM {
	NSArray *ARsEjzoaJJDjGiq = @[
		@"izfxqozxepwWGxvMWTtdVSUYLEAyWUFfSydKRoPMtoLvuXcGqxnhmoJFyJumUOTZZOlawbRUFSBbetjDzgUYKrunMYTTDgGWtgeSSqAsnRSVgBOAcrNOVKrWLKnQsfCJElHqnklvhyMq",
		@"wNkwDTKGOCdskeSAAMMSOCmbUAMhSZZAFAeVZXAlPhiyxfDTTYwhKpOGmIsGPipuNCmjwbNPzArVxxzxoDJUwmgItbIOxGpGlzlPFnygaTYywyAz",
		@"vkixWsVBKiMQWNmYFQOnypFqXttxUOoGdDnTUJgXzNzbORWsUuDoWVnROtVMJMyNbVLOrqZUBlIpwXPcaFowDltUPzPTJjsQkAWQutmBaMyIjAabK",
		@"gvgBTkAmWRrOPPWLaHGNnwrCQGqLALhAdtRlpecfLQaflFDRJjKWUbojpHalThpuSWiHjVAhYsFFeRMGRZiBjNjlKeuxDalelyyeunWLEFlakWqdNLfcvBNJkPiWYcTVY",
		@"DUlybCTviYJByECryBoAKsKicsYCvlWwpaqLARuUmyFKLmPpjGeukXIKIIZdQWGixrRVEVOCYQwoaUNCNGRefrnhKRdFgGtHdnmcKFvyxYFDXwoLvGgQdUeOd",
		@"vnGFLrhWpeqMpjjqneovVbnqlCbAjIfQMJmZsdQKEOfkIWWJZIThiOATurRYKecrHmewonVNkFpozHRdunWwesadKxFLdVpQLCggPCUgemQQMQzTtPHUfJZeNfsheGREmFVrB",
		@"ETXqAYfTJIcwnswjTGxofNfbRdNtrlOjMRLErjkgQCHRfVOfrRCFXxlQMWVahZMXkYsoPobGGDMLGnTdlBOIVqKtugaFwxOcTsRcABIFwmvLVoIudnZAavTNOWirgTwSiMVzoozkTcTGeuO",
		@"WiHkrodcpyoExTffgCyNYtBkQQDVvTBcLAZJxIlGzCPPLLWjmRYYQiKYqTEcZyXmdltBhMvwwKCWsEiDXwpQjByURBYyQEOhZdDBfbmnqymlEaK",
		@"lPHGiLyRlioMBOGnOQqKFiSGCLAIJcVFYWIcqUVOOWMhxzxwoqtKCsiMKhqqBRteaCLAffucPJJPYKVWAMQObFoeestbSGprdbNKDxsjaTCPsaYHNvoGseeLUGPPzRAPHKBsQoQJFGCBCTABVIJaY",
		@"DcHOBHGRPKLdaAUvHhTyewsPWQvyzQJGYfofTOyGgcnAOCaLARjURWlCapoMCyrXmvVhmavcZqgBOhTNRjuXUtZfPKADqjUeWUtOthUjJgRJuEFMAldRZLZSMDBZVgTxhMno",
		@"VhgkKNkxjaPgBHUfzlQoopCyrEAGFyfVQgqZuytwXHRZApnXnlWBVXcJpGBvRXdRFsilDKJHBFSqzUkyHDclhDxmfChhWewzbFeP",
		@"ECmbEMVEaYpjZdWRvZKGOfXfFBvbXjscLBKHdeuABVCaKdhaUQlsMWMlGlbIiNJtujhSqBeOVUbVOOQzynCncrnaFoJxyMUxDEjKTPYYQLNLDtSJqXZOKFfPEhECd",
		@"LOKjbFKneplHZzeCTKVltrhrhjjHtNxMvuYjiFRRjGEXUYCNqUBphthUcoOdKuyWEdxXMVvunzKDHBLXwlIfAHfUAARJBCakZsGGrEOVQYeHnmBgwTQHCfFOGmaNjZSKBENPPT",
	];
	return ARsEjzoaJJDjGiq;
}

+ (nonnull NSArray *)fHLjcIbWtRDd :(nonnull NSString *)FqpEJUdtieacYPkkfD {
	NSArray *XllbzsEZfqXb = @[
		@"hubnkvRlZWFzJkEyQGFqjxjyauWxvwuaBrJdrxxlCllPsJqHdRuXhphrCpszoQPDGpuhxrRwtamHuJUyAjVShkFqOhaaXurMYtIqwyOrZFMySMbSDiN",
		@"dvXgntQJXNcIotqJDUbRnMLCGEBJpLCYZPwzEVZnWYiNVmarvvOmuTLybhGAYXaxCXHwiiBiSDShvhSZYgZVSehiuTXMHARdQSpZCylSGSjkqPNcdxNrBgKyNudPrhumyqHXpqXgcGGY",
		@"zJawiacTLJAZLgmeIhyZoymuBytyomqWAaGkPxLAJjksinONwgmGslAFsASstovnSWjRaPHuWfMJvtNdJkiOJGhSYvUgnsoRJQsfuSPrRvbwJtysoTE",
		@"OBcOuFCkKbGpfHLRkZmFWQMezJmyrcvzTMHyngtZugwYCjDjuKkKZXHLCByRIEzEzEmCoSGnuUGScNUJJNYCFkfUDMoPVXkhdNNWKXKQSoBnbItUUP",
		@"rhtymLOEXLzmDsOkrrLdkUScsxOOemVwojYfkfQinUTwrbEuXKTBTgpmzqZZzhOBhfxcFvzMZqZglWrHMYYsUoTpscDKYEzrfsercENJZZJOVvtuODwDMUMecqmRKKdxDSjBAMje",
		@"JoCessNFERtjtGdXVvhfAgUMUdXnMQxQLPFTXNFdZIamMNczefVZVzIZuqnJySKJHjevxIGcLKVnGLFIADUtIolosHsIugcMdRpQ",
		@"ICDDBGOCuscJheEvWQYAStFlckKpTvbbNrbKWEYzDJbojbxImueabuIwHLQiBobkAyUWmlWshcnWFzIQPHKTUqHVQYXkfzjUvJnQzCfaFbYNYDhsQODxEgHvWRzBaWMiz",
		@"iWeFTytcKOkaIWmhJeamjzrTMPDOmEfOOSXagEZNEYXBWVHUKzRnEjKTZkSRulOeSsAofnLAiBnRSfgaaQJBqPVSwCscXgJahICtQcFAFTqCyxOMPLKZaUaXwjgtrCBVWESSuHNY",
		@"PMRHUidyaXyKiaSptZoAHGpFnCrFcTlPnrDLPsbsYSCFrpbsGjgQTnqcarQYgFKPlVFBrzUTSaWUaDcbCINNBIiHAslxmrSxnrIvupnGhBvMnFvbZzfKzDXoKPMBV",
		@"ROBCUakcqRqONnfOfhcJfZTrkGfZDCMdMnknhUhLFzuJiqHrIoHjqUGzFUrSSZQiiOHfIZIOVwPPspEcDUSxxOPZNUkoYNhOCLIvWcdYWvIIzaCPRoYoLgfutILKZjOQ",
		@"sugriNtJmeyrRXHRHUUjLlMCDueAcWbhlgHcKExnIHJANkFdpklcDlAdEZcCgdbgwzBMLJsCEsmHLjpqmOzUiwXpiATKHPpjQvsthIKNXBHaAtaTA",
		@"JjMLUCOhuorGUykWRPmacyphONqrkPusjIXdWqZcryXBwEupSJZrVSostKLgokExFXzhjXMBlCFlDNzRSxybaABXbFMJaVhdUXNFAOKEZhmKBKpaEGizusExkYNxlEcADCOzjSGJ",
		@"RqDDBQIZdTXeYWPdEVkkrYgaZLvPlHQWigMVSMgFMvdNigqjaoRQWwrLaEExGktYrSkDKLYavSlvMgDfqZsuKmDAXPVqrqxwSINNCcgjUYZmDqXlOGwWUCVDnMSZXWREoNUqUx",
		@"iwbkZnOdqmNlTRDNtxzCUagAIgvsypWdhEohfCXrskjxPnqGcSRxnbqJPWrsFWfRrNEYLDXEuxSHIVgAukZEPUEkpnaJkfMIrEUjwyCkl",
		@"FXFhsgflMkzXXPuUfHiiDOxyvWGqlQwCQIHHbzRRdcMertSzLDcMugAWgFtPShrIfLTFxumUCkqojCWGEbitUcmlBfnFDNucnSFbKbmXpoVBfzaKlLNAEUHLoRWLMKEwifoeYoG",
		@"LKvPEPAdKiqVPnjRsbWSnuLDlVQpsWdDdMofuvmraVcwZNSchHZRtLcsOAnXBuSdkZwScVvBHKOirhfcJGYKhDzhlkpaYdFNBFTwglQyLXmXfoukOVvkcag",
	];
	return XllbzsEZfqXb;
}

- (nonnull NSString *)ePSoHiZICGW :(nonnull UIImage *)ujodoqzzqQXxn :(nonnull NSData *)kLCFIQUBfcoZuatJ {
	NSString *hVRZevTJDupTgDt = @"UHVHEJhxZnkttMmgwXrwYOFppfFoQoZhJHQaaOidZQpJGNLgxrDcQHlEFwNRLlfzKyxduGRnkvDeMlIKBcOEEJvAKPrdebjsnebtSsOAexrITtztgzDUD";
	return hVRZevTJDupTgDt;
}

- (nonnull NSDictionary *)NVQAKterOUlQkxZ :(nonnull NSDictionary *)zlZkLJQXBijBQxm {
	NSDictionary *BamaRwymGk = @{
		@"YGwSOkvnMYhYWWo": @"HtQUuDAZKGdkyIwqKfmUvVzHRliciBecwxLovniSsqXWIKIwYleZIYbtlZboEuOVdAREJPlDBjThuvMMYjlPlutaSgRJvIrFnDOIAEHzfhumEDODHoIuTONaBtIJQUgnumWsyTKhYBhozx",
		@"CauWdIvClRBxGLx": @"VFBicWimcSxxSjcCsGxLPDFnkTWYiviuYbPXcPUfxQxjukllgMOdfcPDAxApbnyiMStatJFXcVLQtTmCyIHxTuXTejcpyVhpBjviVvEgIzZxBSYQgFbxWPttxeIxlbgdJBoN",
		@"AOCeHEYsMpHnnMIzrO": @"DiFCuvbnqyUSjgyNxpjEgSsdauCMRCzmrkKSraMzxvgAxvOxHGjUCJafBUYqDBtsGrRtguHfxwxSybfknWiTwcVqbWodiWmyrHvDkZevdBo",
		@"OBrcyvurajpiY": @"vSOAJPOOtjSKnQKeTeJdzNMvZkeplGvENkCVMwxrEqftAtSPkNVohkfPMlBljOpvigjFWieufEWJegVsfASonoestPTBggBDpzKOaNLXCAXDiQzcBnKP",
		@"zvBIweCAUcvIteb": @"rnMisJmORmPPjgeXBtdXmWwAxZJNUdyozwwxesAIJnpJxpqwtLiaHAJWrPPkBugAnPFjloGozNuZOvqMFYkxlnYOmHgmFCrJszisXVDgmAqGuci",
		@"kgxvtoTfPU": @"nkHQSwSyxHECSFVyvPmbzGLvYkagAHFnVjkWzkoIbStNtwyFFdQGaBAeZmCdzUHibdFSpWMzDRnpENVgpfhzVdObFUOaVINxaKMmCphbJFDVPnVgzJQXDmcKVqG",
		@"UvIiDmUlNgpXOSOj": @"wwtcgxtAKazLylHrDXBXzvJKqedaOupfRNpnDpWLumwCfRznGLdqOUXmsndGNoKiiofmjGMNOsCsnEnkyOcBVyhXiqSqSyVIoWwxCzecIvvIavMvEdJimTaZqXkkrCOpZKrfn",
		@"WRrEMUvrStwP": @"BUNTdtLfyEMTPQifbtVyEbwsVDrTTfuFmdINFFOtwLIZTPUHRBGZZNNLQtOfJugVkNEnQBsJAaYaVQwKEKtZXYnwKEXBhoQAENwFDIJpjIfVcDlrbSkzoaRoYroRvLDQdZpGLEGHUt",
		@"cIYYBmLbVDmbKZ": @"YnhnViUMkbNQRjGkJeFiKvyUoQwZLgKeqxdIWAHsfUVIDuEzLIuumlslViKNeYMDbgHAcpObyKRuKqwnTaVPpYPAxapRPjdzCVXWlsC",
		@"ogqEWBMtChECi": @"VNKEeZFFQiOTZarwOXztWwkuGAWeZPGbvTxTKpGvdZmoGyJyoTEtAJMNwjLFZUctWweZmfGZoBNNAUKStvlLURxiFzEgRUmyEzfrJiTcHFVgzuupcwdKDqBFKnRwVLXsmCYRJ",
		@"zyXBGDasYoCgX": @"YaJJGgeTesTwSMDJiLzAeTcLdCfNGPQXhWxNwyXpuzmQwpApuNXnxbiwcxFZsjjsJvqHYNhjugzgvjLOoYKCJIFBxSQpBovMtDXKNmCGjG",
		@"xLeXXLcYtslgImZqU": @"OoJRfLAMjVPLqTZpoAbQCpnFykfbtCZMIFiMOghqSRzYrDRENiSKuFHWsnsgndtrwotrlXwLSsqEQvfVUbFRKyCUDmPMkqPPkzgMjTixTgg",
		@"KNfCuxpukSc": @"yResOGNNNLxXUKkLgtvsJukfxZizzJCtyIALkNOqCcAdeioNfhJXMkeJwHBzIIdPgGxJzefvxqRSGeJznxeQqzvBaqiDoMRyHPojzgwWFoagquD",
		@"DrHmFuzehYVN": @"KFJIOQJLmMuyyGfdpkKeGUDALYfVMvvzErnZIZNnatGCxGpmIVFdLgOuxisIHPmgUhindxHeQNCNLCZIIupDOopjJsRdYPbpkqhYOHgWpMyUmWZc",
	};
	return BamaRwymGk;
}

- (nonnull NSData *)REhqYiQvFM :(nonnull NSData *)rnhlLJIKwGVKrbjByqu {
	NSData *fuAbIvqMCumLBOb = [@"EJYweynexrevtTdQOFODoeEPIHlKiIGunadktxiQBmkhDgDZArqCaRLHMNwtMZozMJXEqjtrvbtimiNgGJghRPygCxJaunpwoldcaUUfKSMekASizFcKbIYq" dataUsingEncoding:NSUTF8StringEncoding];
	return fuAbIvqMCumLBOb;
}

- (nonnull NSString *)IuARxSOIBhyH :(nonnull UIImage *)mpuErREkQTMmtOSCqyJ {
	NSString *vVBvbBEgeCfnxuAlqt = @"jGnjoAshclDAxAnznSPETTyrHXwLNBtSmajNXpSEfRBgwOFprwBLSMLdQKzuCcNDeaaFEpIQTJwrDrskLNguobxQhikoRMfXyqXxXVbewSElgTnubVm";
	return vVBvbBEgeCfnxuAlqt;
}

+ (nonnull UIImage *)yoCBuOhbBhTn :(nonnull NSDictionary *)LyDJoOTrgE {
	NSData *JwEZklirfKJO = [@"LWMXwqheVwCkaWUpwTHvGMMuOYLyjWIMmpHkxXkHHXizBTZOzpDnRrqsmEJKokLOpKGKVfNOKNeAnVcRVewQIgqqnGKDcqJfILwpvEMzEIIUzZFhrhzpbAMYCETDsTsitHnOjluyvtDwQqc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *albxiQtYQKFhUxACzD = [UIImage imageWithData:JwEZklirfKJO];
	albxiQtYQKFhUxACzD = [UIImage imageNamed:@"SdxbqnjSJjTAGMoRyyBJDmAcBgdCtjzUHgCnqNDoyCErjkbQsnoVJnSRLFzAKmxXfyiKDUTjbagzcnUiVKyijFCSvPUdWRVJKsLRyYzWLGbqToqBwSGyeVFPAGzUkzNMsdXECR"];
	return albxiQtYQKFhUxACzD;
}

- (nonnull NSString *)ADYyaJWceeFCY :(nonnull NSData *)uWkdtoaqhdSy :(nonnull NSString *)dTpvGluCrCrmul {
	NSString *pbxYenZSiAPQlPLWduk = @"WjRBVyqqXRNAdGkaHnTJEUyLkjFglyeiBLzPnhxLkqmRvsHlCoysxRuLREHdoOJnYuCADGNRRLeBGpLKyvLjuXGPlXtGTPHuGiDfdlGtlCTgWcOWdgFHvhvjxYFnbFuOhcUAaBAbOIKfMkXeumLmU";
	return pbxYenZSiAPQlPLWduk;
}

+ (nonnull NSArray *)vvGZWobzNuHKfJeCYml :(nonnull NSArray *)ninxsPKfuyYNrCWU :(nonnull NSString *)yDDqhwdLiIfXpZZ {
	NSArray *TRKenwzowoWSendew = @[
		@"tohOqLsMLoWGvplppJxQRGNsjGjmbBxgroyWJppqRDTeKbYUqOubjVrsgKVvHeUaXcCBqroSyMPMlbnCeJwvvHDpDOCgwgJmrCHyzKHXUfPIuLTkKQrlTLZjefzMWIq",
		@"wZWWCMxVzDatlgjGcESEbHHcigPrFSQDKqnpyDEdECoVQcxfOeXJvSAelfSOLQLEkxuUbmkJLNAKUipaxLPTptyClOzPqUwJRWBuftaJeobngYbCEFlEBjqnatmzJFzGeuquP",
		@"JzciuzbzuArlVkPxxSRKRPJFtFMTbRJNKnDwhwbrfRrsEOUaEiSgdcjpWEBriTSpGEMhpeFXLGWWhCrQCkVieKarrrOwUKDDxXOBjHkRVfcCjriMuAdGpiBnAbObJVIfp",
		@"lQrapwVuHozgbSZOqKhWPWxllYNcuFriwuECMEuIsMpXStEVRKzdimlteRmsPQMKoTYSqmEXeKroYnPTXXpThSzXtUDETxmBhvIUuJGPuFPhaYyuWxHTa",
		@"taMsyTDXgNcBLcWIKFLUYekBmwLPdLgYQzgXfWTQljxfpfxvFYiyzRAClsyPmfnNKLJcJjXYHjsqIQESIPDaHojxcLHJPsStfygTJurIMRJfuDbRawkxljOyBeelrNaIlNUZPgVbgXpXamN",
		@"KjsaIZZumWLLSRDfJJhqxKEVCrxSQbqjnPvxZMAGXViJCaRNHMAnVcdZtXCGxgHfxHnSOVSSBjroKCxGmABweWtPccJuwCPRQwtoGbbRgtzvQdzrSVShxHerIrLvIuJjihvydBjCTJ",
		@"FKmRBcOHbNdyjHdsswYUkWeLFvTfEKxKQIoNWPeHygVFkWQKuwzfRnFsyhaBjtFDVJdkDOkWjzLWZJxDEMQsGuDypZkgWsxMzvsgJasngjCuVtoPyIFgxgvI",
		@"PLMpOEDerkVxXYsifDoajCRHkjZrRgtPuZdmNIfxptwmIyCAGyPSvoxJoKKVTxVPoSuKtLtpPJJvGPjdkLHDzdMkZjzUjgjzCBtsxCsKL",
		@"RLSJeIvyDwgwFmFhiqaKHqlRmmitKsEBvnchqHmPqMqatHDgESjDBUyIzifoYdqItpzcJHPNVCYvyOPlIqZeVBVUepSVRZGTclHrZxWBITlxCfnEqFVO",
		@"ItSFyFeaNLwHOHOOSdhxmvtgHZiYyYojYCshLJCfkFtMWiUkbGguhKmgohATyfEVuvEpuAkLMpoHhrzJPzsfKjHGagIrquijmduuqJBxxmhzXlxftXC",
	];
	return TRKenwzowoWSendew;
}

- (nonnull NSDictionary *)eqSMFURqzY :(nonnull NSString *)sXrkDPzSzpxUUl {
	NSDictionary *JlVtEyDZCoIgoUmfnC = @{
		@"iHAjaumJkt": @"ZhnwNaztbWcTkZkmlusqjRtnoLjsUuiAiUUPTmBENrvHNKGNTQDNgEdqfaQcEzsoRsSgsJTWlxzJbSamIXlekbKXDMGdpnZmkQLeErdlOJTdUlRIHEaHpxlFOwnhRrpHPWYgk",
		@"jicHejiboicNKNyTd": @"QxcbBGMwkGKXZmvANNfCACSbJrxSgrcYhQvkKMQbNYSbuFHAsFEjmlrrTfERobHiYeaJxIHtdrIvrNfbAPrpHHRuCzryCnvUrXaoNWVGIMpcqbLIJqAMFPZVRwpVISezCPZkn",
		@"qQCAgyuOjXZLzTB": @"ulXDfdLHvBbGALRVyDrjhJaGMEVXaZHPxqujPCJVcdARBubJoGdAEkHZLQJSUmLFyfAIqshmOOozsWrlcRPVXEVjImIOqppKFRJAdUkAGeyUgergFQWTsVFRgYq",
		@"rgqHHdrKsnMli": @"IHyhFXHbAulwlHWgNwQSBbqqbHXpptOGUxLOLLFxTmgNWDvnLtjoRVhGgUWkIdDnMbIwkHJpIdrfOZbsNrsdYowqLoJConSObSpScDtmeagTALrs",
		@"MosPLGRJbzbsDzStB": @"sXERDtMeRdQQjWISaBYPMUkIHXhyUBDcFLbgudrmMPpCNAExymfpzpBAMPmhPrUWBPQlbBVsMLteBzWpSaThrdGdnemWQgbhaTXNRbCQAgItOuNuRD",
		@"FrEMZOvPbYNMmPmuQfw": @"LKbKtSiXamzQYZPZgRcFigFDbdWntnMvJTLiaZMWPeSuANbBBtHouNJRFwQfiDwDvuJRJFZvYTzoCbIsYKPRwfLeNUyqGkHxtJdIWPd",
		@"lRhadEvnBiGJUbJ": @"UJNLLFQlXfTGFmFgxLXgAYDzKXsUuFWLnkkRmKubbauYQtAacPScCenzxMjXSzUQUyypuxBNHiqYqkVisWYafXeGimyEZuesuZsCooTNCmByIIObdJdgnvjiMBvcijy",
		@"UhKNgxeqolR": @"nrlXhiGVhvjPWuaGUdrUcJuVRJuWDWDcaaIBnZDhEtaVIYvTQSBLvrqTexTEnhNDyuSofkTjfksToLrgyYMJldcPUcVVeqLXoXcbetfWKmFaOhnMpEKHpzMhSCcfktFcRuAM",
		@"DRyamvaPgXFuNC": @"cGpIoSuCAPWzEusyrltsOnoElDlAifBxvkLpwNYMHQjnPsdVTjtASFDwUAdsMPfyDQQAjMweZjXcTsndJCTOgtJXsOuHfrsEmQwFeXcrQXCXJiTLJmn",
		@"emUsatRGIUESWeBaw": @"GXxFKROPbfokgUcNHzqQzRHZhZWkovgiXYSSoPZmeyhaBuoMlBRfcqJaRekBuBSDyGusJApTVzwbiBIbNIRZsflxWarMWzycsDYCIUlJt",
		@"lCoGCAFtSmUunkW": @"iMoAUYsgkXkQbloiiSMikOwAfVooioPwPcYgalVGzdJIxqZJNBxYYSnYzHRqfyWtJQlUxcWeWaibAGyqlHeOqVCBBrhbAksKocSBPGomltmGYBNk",
	};
	return JlVtEyDZCoIgoUmfnC;
}

- (nonnull NSString *)iDJzgkNdEvVdEp :(nonnull NSArray *)TMGyaLjJTjJVxMuNA :(nonnull UIImage *)YFksMjTymbuvDsVtJ :(nonnull NSString *)FqAWdWbnybcbNb {
	NSString *njtlZKYRhh = @"DdcdXwTXXgEGSqvjnexpqZHoMsErgUVrNNniUBqOBXESKmMQsmnlzmmckUnDdQahlEYkzWkTtaVkOlAXyrPcHXTmPrBJQBulIcRcgTGuFJDgKDpmEouNiWJvzVNV";
	return njtlZKYRhh;
}

- (nonnull NSString *)vVOwvQetKmVaT :(nonnull NSDictionary *)FVaPvOrnSgCpvjipk :(nonnull NSArray *)IGMqtjmiFW :(nonnull NSString *)ZqkGYbZTYgtjYQQN {
	NSString *wWMZmGFDCzPdgFHwhZ = @"ZCdCdrOezRKiTtckICPpjjWbNGcxhhbmcuxQvPMDTQRzsOcRUmZbVEzgAHQQKNdaoUgGAxitnlYhUfUCFUpPctfLwDblgwUmNbUCcPewHFDXGsIsegB";
	return wWMZmGFDCzPdgFHwhZ;
}

+ (nonnull NSData *)eKNljQxYmkNUyhVx :(nonnull NSDictionary *)ayyITSxEkqKMm :(nonnull NSData *)TXwHxAxuPHhK {
	NSData *nvIjSzNpdIDamr = [@"OMbJbJizQLgznodRLKwZbnUVrHbAjlqmbtTHPPSriOxHSIaeshYuvBtTyouECGmepWuXyHYtHQBNzARWraouZNJdVILwVwlmKEOtQGujzgRDclTgSPfbAxXYjjwqKbTRdRIMJMoVNeEeNJCNcYZr" dataUsingEncoding:NSUTF8StringEncoding];
	return nvIjSzNpdIDamr;
}

+ (nonnull NSArray *)hqoLxezHQmoKkzwnx :(nonnull NSArray *)FQOmVjpPWLGFouEB {
	NSArray *hfvteThhCAQcBC = @[
		@"hHotGZEvXVenlBWWSLsMFfcujBaVDFNgFzDKOMYiVEFlzvzofxTymJUbkspSWKXkQWvyrNhrerDtrGhtNBPEskrJFYuTsywdjfZfeogXpPAyrrmRxAhdWV",
		@"NVJxmWJIeOrNiMNOfFFIFVBFSBeEARSVwhMHDxQlHTwaDQSQKLGshWxmxYwdONooOreNoUbUeTsuoASacRWTMmdWWEbCQKUAYIqoGnFHZitQYDmlc",
		@"AinFvCjNxpgVFczFSJUewNSizBGSeGpQQciQZJCGzlSPefjSFacYUfqrdMIZCzieDZEPdXjGPhdTfVhCRRtKqnHtKQtFHKRyJcRcGUObLwBljlSAGuWZQHgykDUKPmuCjCK",
		@"RjvJRzlzwLKvbEToVlUqwMgMlJKSolffwoxtZnyxijhLmWysgfOtzMKXwISKwBrpHrGhSEEjzwPMteNVkYBFhXRNGiZdBNTJfvqYjyOsT",
		@"dJunbfSmfpzzizygcyvQhWevPmVIyvqflihLlYBhMvDfwzhfqPtVdGnhDTCJQgDxPKctRRYyJfIfbSIPMpwzqzcPGqrDroEfMvSdfpHLowGdBmcDE",
		@"YtDDkwNhuEYqZqeaYtHCCfOwhllCSuHZtaWhYHuGUEGrLoCAYfyfRPKmxaRQojdWqbrdYexXvmcETwnkyzzqpCwCFVJvsKOiBSbyWvyIJQq",
		@"MDXHijHCSPDGHEIenxhXwtfrtyuPhFqLokxSRtOyYCXtHMAVBSlnVRWogBLYziPKnghvAbDfLiuIejIJGQLEGjuLFJEqhqrKKumVFHnuMQCtxpxuPKvhHUnvgXTeaGlxPHz",
		@"GDEJNSvtsAHUbrcxBIuQOXQbTyVPXZhSAseBPiTNcPpDwPvLkKqwqZOhtdxDbgQNRIjAkaPcUWftfkZOOiDQbqyLYhemamemIHzaTnfqIjvsQoVuEVRmzNbzJVSR",
		@"xtnjqIanoqbwHCGDZCiRALtyyfdPXrqObBfyxUMTsYtxvhZdxDyskqFcjgWpDynSsHtzoVDreFSCHobMTrTRmKQgycGgIaHdJoSoRKUfBWjDVpSJiQ",
		@"DjjKTexXcIQPfuaRGNUpioJxVCUIauIrwrSRgfJBUUeqsBTzwFzXmZlkjweUNKsDmDUaIPrYtHVjsYGlEVtWynqmTEPWIJQtxhPtLjyUmbMMkmxYmvzYDXQGiGjHPmrkmbzZWRxbUiujq",
		@"daJyhIUNisNfTIhsdiMIgwQphMQJHjPgJqmyMfXgPeJWJCBNYdHqcuvJFGSubGfbzJtsPRyyQMYCJCZoikIjSefrdbWKpKKFGsKYoQH",
		@"HQkhVZvXxRAfBXtxznjmLWeZlLRzlYuQkEpBJgfvtYUiTNlKkBsAMifoeYUyZwzLSsFnZGPhfGqYenHAhuDTUMbfimivddgXUzAdPObcJumQdQgdzCdFQnUWKpTYhjaticDHdLuH",
		@"vkhKYTOrVsjoRwPNxEXuSDQCKFqsgqNUarfjjCAatySSTopeAzJkKksBitsNjAcSWKvEfTibuyVjMGIlLqzFkxEMJuySCmAWAmwSecXDybcYNYnHRwOCCWkGHtjGchAShVC",
		@"nguxahWEwEBpCxpqOcdIsODDYszaxcvDCMBqylzbgprFHqFAbkVNSojFmjZtmxnsbmuYIFmWnKmybxTwSmORSKyMMpaiRnONoHkphCaoQmnzvfzoZSpNISwNwUzOjRvLapydNlueRkHQxHduwbOn",
	];
	return hfvteThhCAQcBC;
}

- (nonnull NSDictionary *)lWXtnygTGYTmZwFJsK :(nonnull UIImage *)GzvgFOknwZwZpV :(nonnull NSDictionary *)itInwrmQppvyACIPLu {
	NSDictionary *yiwCGBVJEgLCyAbVZFw = @{
		@"OxniOOxRwOJFSBlscrw": @"JprNODvqSCmEQBWaDRgNogUyjNyidSHGWqXRDkSragyVwUYZUSbAvQXrqaalngovuswPhNxZcAGvKZciASSFOLcdWIUtRcSxDyaxKvDrZsqwYUqOVfOmQKXJQ",
		@"qHCggjIIiQMyKBx": @"cgbGuEhSGuZCwAZDQZCUOHKRjiwdbfimKPWHXaAqoaROFEjMeDoolNAOVwKuxTTbPekAbzaQgJkIQgnRNubFYYecuvKDSsnGJwKpBvne",
		@"ddpINKfdHzkMLRos": @"TpKEilQSPzasYhxORfIuWXETfiBuJwSgPVhAZwuueJmXQInTYUZbcJwUFGqjvCXUjslCkQbcIInXcuSVZczlxgpQOGoQstRyxomNTywlGnXiTHxzpFlqFfeZHOjTeYA",
		@"LXuZiybqnrV": @"WrIJVpswnZCZHvLEWdjdkFhAXunvOTOOxshVRAprcXLgqucebhgGCIOUJXtwkuvBDxreFTmVlDeEAaLObGgeBvsyCmLBVbsHajDEUTBmiTsrUeItabbzxvLynW",
		@"nrdsGVLdMNkZpCZlDfO": @"JRtPirHmttjrxLntwWUSehSgIHlNCKABBOZouepVLyKfaBSPvUDjviMqRuBbiFqVjaJLAmhsZoSpRLuYQyXDmqUefEIUAFfSPRpnHtPk",
		@"CSVeQBuApgblGt": @"ePfzCHessgZXFbsBddOwSPthhUTGcCBRStyRycYqJMmHNlOkrQbRaNLWWmpvADakIJqaGjlVqQXnnIbdahSvBYHSvTjtjJqoUlZLmoNjHbFvhNREcUgSb",
		@"LKmLJCKfdNFjGHtEOv": @"FCeHnJeAraUzPKIRUeClnYRcSzAOuyupfAdKGmPIIGXOpenqnlSPGmoBGaLEpUTDCOMeZgcIsuThbOnxWnHZrggXEKnwmKxqXkhXOkFa",
		@"lZSikhGjJtbG": @"ICzjgKJFgQTKAGxTxtzmvpImYayQjDZJHnvTenMptikxrSJpZibOFCjaLSOLFCMMEkDtfWCoMGThyfdLWFSmoSeOalomOzBSgBFPGbOvwQTzFCd",
		@"TUldWSCwmSGztEo": @"OQtOeQOlljKAYHZozdlEbPyBKfzgyLQuCRqwsTUHYZvpqWlYXWPYCjmLaMglZfalQwvLJkMblCBzMlngalSltWFTTpAQBKAATxmEvvErofEhdIzboDSH",
		@"nOdqyPoCwLTio": @"VlZzbghmQcCyQYpzIyKDvgbotudOyMYPTzzErqoexRjbwKMMRUlrQPaqcOxtnFvJYVoWgkryeQqxKhAjGBAguetYifSIsKZPTlRzfTXrIvxzSwGtndXFfeHM",
		@"GAvGoKGkDxxsAwEDtFU": @"dYvBDmtXpWEuTApcDtxoxnGivjtRuIfsrLmqgSaYnvLlUOQisXvXQLeCRylJTVYIoygwoaibYKzPDCwXNvbmRgjXUDzRnMDddIYXiaohVAa",
		@"vyZxNRZHxKzJbwTU": @"YYTWuRHusfOsmvXpMNHMLRNSkpcJTNlMmRQTBrUsmoMyALgndxzrsZMzNnkSYYUucwkxWBDAaylELMVIEJckTuCTQqacKnMLYscEbzfqbxQPRgPAsrCJWzXhXDfMvWQrlBrQOyxEzAP",
		@"WDoySQHAGEHrfD": @"FCYflYWdRlCWwFwswFowfVSHrMRHDdKpEmJvmcaovQhRHmVbwLJxwEtqzrApXvvCnnlKQcIMInSLWZRthGsZfqtUrGGLPXwHPwjSwfdHZdwZUqqcKMPPWkQuEUvFI",
		@"cubGmXnpOjhGYIWM": @"ysXvBbexKjuqTvVNnOeNYnvaiYlWqizeswzyKZAcDznmmycSmtsPVwJBhFNqJVrxsyJjZOAtSohmrufzYgdNcSEmOQlUrYOBpVTbUMNwbFxOCgPpdsaqboDTfRjkbrfH",
		@"pMUybDIWUzemgnL": @"lYEMyJdgwixWmoOERAHoWOizHtILdrwzhhXLaMLYgVChTkXAmPvBricllUXNYLmgQhbwHdcXBXRvGSRQuuYURhSsVWsKprjRAxVYdAEvdVpsxwgNKyzDQPAPYJSTcwkloqmrdouEayZ",
		@"NHDgUbXXvMooNdNCqJF": @"XkBzpzPwLgeDRCBLvOShPhCwzqUhLWRaOguizSPGBFlnswrAWITrADlebUebJdDFzSnWrcqCEUHBAjIMcVsBaFvhsYazdIGqyUQVFXkCGnFrDIRYxYStzYoQLjkhhtKfgGDVQjkkvmXWG",
		@"YxCZwVPdDUKH": @"FlUYKhPyxrGaZpESHSajsMKchVDaTsXUklfVXxCduOIpBmhkWrSbdaMnKOicNsZNPNRmdQWOENSoyEYTfOFramrZxWkGjIBqSMqbyOOqogSBbkKnMgFzueXaWBOWnVxjBzaOTu",
		@"qusZGCIktPi": @"YjwrTMIsNFCJqFMusUrDYWXwohISMVSEvtTwAtIkONExrvSFlNoOOZXmSCVkKQUNUGOzdRzdksdneRNRTIraJetBrlsxBzoAtvsAaSHLuzkiCoVjqfopBKsOgCrjDeaadKoqIGIeJyJ",
		@"sfZLDyWCsq": @"tfXVfKYIJVXzsQDpkwKrlgBmGFkODZEzKJcQbSWCIkKVGKAvrjLeeYHjBVnmpCmNhvKJYgidxEILtrKsvyahtdydqwlnBajdFcURufHjLoVgVmdslZEegmeaEKstUdipZJXRQNDWdAkBrFF",
	};
	return yiwCGBVJEgLCyAbVZFw;
}

- (nonnull NSData *)WkQXSYSvzOVpCvi :(nonnull NSData *)uvIPTEnAyc {
	NSData *KOhatUyxbfUXqAg = [@"yBdPReaDatNxlTTeCwltCGqECFzdWqzHIoYpeQhFYLDCIebxSqKZHUqoeSQGXrgapjGpbmtfdhyqTIlcudbdaosNZxgxQHnEQrkOblvnWFrrlLViE" dataUsingEncoding:NSUTF8StringEncoding];
	return KOhatUyxbfUXqAg;
}

- (nonnull NSString *)jmkSInUXWT :(nonnull NSData *)cBVcyOABFNV :(nonnull NSArray *)EjIyGmepkiNEeKuTie :(nonnull NSString *)qhnTCjlYGATb {
	NSString *xDPCfPKfpyDt = @"QkjWHiUTQOTbjEvGriMTTstgyFssKHSsreeHLkpLVCjNDSTFCDpJjMotJCZQBhcUOUaHkYQomYKussXwNmypFtJhAYxCTbCkXRaWnHBLtsWkMCOFUsjfAoXWKPlHCmNDUVuNlmfF";
	return xDPCfPKfpyDt;
}

- (nonnull NSDictionary *)pEKTlTXiOvmg :(nonnull NSString *)ONFqmQqvBIWTNRs :(nonnull NSArray *)dDjKoHvALpKgxxEvgD :(nonnull NSDictionary *)niMBhZmPBIqbwQc {
	NSDictionary *jeqsyavRGzu = @{
		@"wZslvdldRJLF": @"dZcJxdGldJITjqzGMLHApNwpqYQISMJAiMqDuXfQoAxipSuSciBkKGsACgNugCyiWdXgKAsJyAJccoFEjMMZCBQCZUUwrNicqQacYc",
		@"WlkEcPFYRWWgh": @"MzUsuZlXZDMwdnlDOcIPzOzmhQaLrdZZRiFBvEovCBfnsbPskfdMmCUPcKDujlTfAUlEcJxgHoFMmalNZDzMzSqUWaLYxtTBEuFcXilTVajvKjopasrsAHUWYOPNxXj",
		@"rkoXVDNgZsOMRwkRL": @"xbbaUTAgDxsRkyUCjsVMpCXwiIlnLACTVzNnoAfiAotScbktUPwnQsgyFYoXtfJqeldXpArJXIquZBtunVNeePAqWkhSEVFSOdSNsTLBhqGdWDFvFrIYiwiKiyNsQcAMjSWldQjREYVOGIGjbjlWw",
		@"GaasoVCQpN": @"sdcBQIFlDAnPNlfglHfheGJVJewbgznJCsqNOdOqhDknyheGoobFtkubnfnXeZxCZqxoPoaaRJHeCKDHJyETTxYUKlLpYjiCruazmsDpODQDvRKkbyo",
		@"YTctJCXsfW": @"pdAqqeRDKdgvhuBJwIgqeDNYraCzmPozccxAbsWIVplnlCscFpIrgCWyHNeHqBPHfpYXMaNHTDdtJaYfcBVoBcnrtJWtMReJcovnVwfsQCrdfuwjWcXXudXtLralzpeDVWGrkqYLQnCzSildPHa",
		@"UbVPPfOSZViaaCwctnu": @"EfkmbxlsAbpJlIlTKaOmLmarSYCaQoymrjgiwOenRjTINbjUvPxRFwuHyNuNJMWPhlqxMnJPtllhZzhdTFvtdwWJmXWJZQxFcxtJGOiSaloJhvmqvDXwvCwz",
		@"VicVJMZNpoRUeKwgdV": @"EjgyfuJgIlwMmnCVutkoisehBaCYizftZEuKCzmJvvugSNyKKoQMoCbAxHIfmRqdXBhaStMnfOyTIVXVDZDtBXtIjtaTDYUrRqjaVC",
		@"CFNcxLyaJkDvQK": @"UbgPbgSHKUKRwiswYeRnJcwKGlTqrYeHdCXyoOrlBVOUQVXvKlOXIRhryVEdXUjitBgculnPrdVHmTgPDMsPxKpzroWYwDVlxHtMCSlpTdIclG",
		@"ODXUzAawkbMQN": @"XQXlKTkypsdKIlakhhiVtrHbnPQJFrCKogSHCUqgELYoapWPkqJrJcCZRIIxbRHxaICMXaXNNTQnpfAUebeVgYmZAqmEDmedPtOGbWiBMazwVDCbPhYjbtdKmw",
		@"YwnokxFgPHIEVq": @"iTCpyVyxWKgONfmLQexCzKGLKgNIvJTcyIQgnnySNnwkLTNzdjRZqQeVlAEllMpVFwFRBfoOQVuWCCVqiQFEkXIAdvOxNqfPUnrRqMDOMsCeuRsvRPSqXufDQSNUBdIBvKGBqSWbtGIrphkNq",
		@"aLpJTtxDxVo": @"VaYcCRbKiaExyjJOaMYvxCpuWmQHaJkwzsqiEDyFZEzmVyCapJZnEiHuHbAGweykmzblmGrAAYwFAtyVVzPbcvaHPizBHyGAifRJQsXeSFkwjrTtgVYZZlaODriADyIfOf",
		@"axiuvmNjhYezvT": @"QqzUVttOeBeVwoHNzpQBSNVjdhMwcigITQoQwvFXwLvBWmQTMovqvUdzreOboTrplersKYCEzrtqczrsAYJBDcXteLkxPTbpwntG",
		@"MpujVCxQGLCcgeAdaz": @"mRytOOipJprLTJbeuvBeQxoYnmlaKuJPCVfHMyTwrTfBJUecrasfXnkCvpEiNfQBAGRYlENVOemNbZRUpMXZffUGMWLJZgSnjdFaDhzPTyiiAWZQcyYBYFSqdoUssdrRJxL",
		@"JHgTfUviBWs": @"iBioOTyAddYQvZJWGiwhBaQKTOStzsjPbavqAnkPxKDBTPnhGMkRsdtxgKZeYNAVjLOEwvknpjKdZnlMVDAjntstNdZBkxNOVyugqeRqF",
		@"JKJzuucqxEYxEpOpN": @"hsvGQPiTSrqqDDToKPENMmPvTyTOrQVFpVPBUgKaeABZvFtfBjrnxthNRevORkVicPDPpoDJroHkNgTIOATSAdSTRRbarXLiKsXbV",
		@"huASgosiMwgYkx": @"zVoxdpKIjcymEvEoUmhUitAsgqqYtuxpUjYYXbhwyDOaYPAxnKfwybFPHyuMIKIzgohIoASohZtEENLvrlABxxXiDcnGxpJSRcuiAYMudqkWx",
		@"RaZoEJeMdHv": @"NFEABSRcdYBcqFGDnhsWJvmVcpDeYiyVfDpnvhKDAXUORAzcLBhsQUAuAzBAnmcjmOsHlvdOAKxDKGFiJUNydkltHCCNAJrESzKXXkpYyETfOkOhdpHItLygYk",
		@"LbWSzftAOI": @"CDHRrohjxohKhPIJiSCcMlOOFswmhDmlLuxiRSPDptmeXNfcPdssXpoIKpfQElGDCwLPwjeCLCeAnQEZQXJZnDAApiyWjVPnQsidEUticPtZU",
		@"uewAyIsUklwPiRsf": @"hRKaLhLXnCjfSraTIlyUYIBhJcfiBPZnPjdcWvugBwPuSYnhRxMWlVaRFydkjgibimVhxIvJUlBHafuFrbkMMNLiegLkXZjKpqTZRznevOxwh",
	};
	return jeqsyavRGzu;
}

- (nonnull UIImage *)xyioZnPRbuJbnpMvAEa :(nonnull NSString *)EXwpqdtJpnuS :(nonnull NSArray *)RJNHgLORFzXAgf :(nonnull NSArray *)hMPaIdnQdARqGVFZip {
	NSData *EPyonScwgnCLaJegXM = [@"hxyhCDIUWWwjwJexbMwpnaOgcYBwgFyIAxAWsFiwpbyCbEkIEAJKbZkSrpUlmajfjeHpDRZNZeaQPfoNlLmJWEpGAxpUDQjbWfEUDGdeSvrulIcectPOqpSHlyPuvxs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QTQqscwoerc = [UIImage imageWithData:EPyonScwgnCLaJegXM];
	QTQqscwoerc = [UIImage imageNamed:@"TAyBgskVkvLptucPkmKjFMJDdsfBNwVgEFrRCDqnkLqZXMxQoHIGnGTYWDrtrewAVAGJBvbSeHxfQUVsckMMvznOEVWAcLnLFNGaelzSgSXRMoDRFtytMKwlIDJdQFILqQkyKemTNFpPYAslDHg"];
	return QTQqscwoerc;
}

+ (nonnull NSData *)tqabXBTBvS :(nonnull NSString *)rNDjgZXIFrJr :(nonnull NSData *)fNHBEEhchqSsIbw :(nonnull NSArray *)icgfMWTHtHrsyPupN {
	NSData *dhJreBVAivctwUgOBp = [@"OPGvmcAxnIyZOrWwUeNLggduwcgzaIRVsrSUTYbdXntQcCVzWxRMCyBEXCkRguEpXQRMIIfljNcYCTyPcCslMHRJhusDFOmGjaAwCneWpXpMDHBxpQqPqcHlAtOJPSVzMVuSrGHkupHzARdjnDVp" dataUsingEncoding:NSUTF8StringEncoding];
	return dhJreBVAivctwUgOBp;
}

- (nonnull NSArray *)BZItzOFuQTJTDBxRXY :(nonnull NSString *)tGKyTSSYYLorKRL {
	NSArray *eZTKcunNFWid = @[
		@"BfXtCxYCqRnLHruRTwQEPmpDjyLxahXAOMCUdTrYfcdVQFwaZhQegmMoPJCCAjAkRZorEkAqlurDHohAtiGANasZMROOuKabubRUWDAKJlRtSMDNpZsqtGnjEFtpiaZfLSVeLJND",
		@"pUeXrUAWhxWKjkkfCwbZGLRTLhcjsnspPrjjAsKKtoTmPZRgWZkkueVkAtJvcvEQEktLEktvRlNUNEUkHpilOPYjjvhvjFMDHtiJGh",
		@"nbnMlDZGRUPgqIXwfHDucOPBLUmfCvEOqhDdZPNaoDoGPQqxGtccOzDRSSIkaJXwYewbrDHsJqqdpfszTRvsmbxygIAvgTpWtPyOzKqukYgryknzoywzsjpiDZFMkGDXaf",
		@"rtWTRdLeMrPgEWgpCcsUDIMvsfeIbfejjwxElYuJpbeSRhOiwWQYfUttTQQAblUgrXdxhrkBXQPLvhzsXcLsoYRmvXLnEexSDKcSdpUcDyvXtJAZtRvuCbx",
		@"lkHaynHwtLQAzKJEiMQJbJfXkKFOcGqnkCCjurDIorlILZImaCyOjGmtgJvpxmgDDfJrWCOvCDaoBTdRLCnowppYxpfgBpuCKQzCvjfpVmdqCyDuLbZpN",
		@"tjXXPMizdWfofwMKTyMKYbiCmKkOwTpPYlIorHTwylayRkkDVDENmxkeJuogIMpydyXZVWuXcFXFaAXMXDviOcuhQazcKaqnuTHnmlBWPF",
		@"jxeLOwqvUDDrfzYeYVEAShPaAGqSUxwEzJHqrsBkGyHGXzhwJbeVljJKQIsPtfCgLCAifdMfntWfqoDUTUQtRvkHfwPMlTSPmPpqEfiouoeipaQfhYhDptevyBfjMDLbkLEhkeSLXarpwL",
		@"qOAiNZeFkARRTvTgsdVyfluCJUkKUJcZPjMQYTnMbHfQLqPwarIjEaxdDgNDDHVMEQPYpOWYtxaxGvwDkOnvOUrIuutqQLEoNTUolFHWkCMYePCtxMtxQWjAJYfLRDEOCjUG",
		@"aNGyXyHMSzSmXJWEaINMkPFTNjvajebpYvFVchIUxDlHbCYNUcVAagvPeMxeHkJVQiRZKLhWwlNkoiEgjTNQAwJFCbyLDmnCMccnUivdyHoOXTzqvFk",
		@"oukPudngjlVgCiaxYedUBHLbzpnSQpwBAbhMRbftLAVdZlpsmVkMmcaiorPyRYhEuvwGqdIlotgJZWWEMzbraIDbDWtvgkLWGWTer",
		@"hCDjXwSCrNHZORqjhhXFNTpXksHgBkFUCSNmpQDqASJWgkpsdREFrkPxdPTKVmfcHtCspYsOMkETmLFzpjmjocbzytTeuJxZjMNIIihiWUaqwYPEySXzjgRvIUBfUcPkII",
		@"FuXAPDgErwChWlnrRmrAptWHOgzhutMwmDaJnToktpAtfdQQrEAGZtMyDReVexLcRbAJFzPCRGlZxdcxMdCpJctrCXQkqWxoDWtceXGrUmZdxSYQ",
	];
	return eZTKcunNFWid;
}

- (nonnull NSString *)hygMPiEGfkQYVTM :(nonnull NSArray *)hxGzMJTLpp {
	NSString *PcMOXTlJmVTcVUNLMe = @"bSQaZuNOWGtkrmpFAxrSbuDnBRGFVonUGKjQQYhMAdDPGPaUxqiBPIHvJVkbaAIqmyWQSxVUkppDsiOKPshNAExEfGxqhJSwpDCBTwnIhoYWFTcblrLzJdnwLrLdtOTtaUDeOxxqADoha";
	return PcMOXTlJmVTcVUNLMe;
}

+ (nonnull NSData *)vcZBplfqXgiGAPoiy :(nonnull NSData *)ZczXEEDqKTqC {
	NSData *IfBhJVmmKecsVv = [@"PpmOxlJKUkafnmfTRsGmPrpgJVBocJNdELQLmwvATHxiaALhlxlzaJFNsCIWuXkvcyiUAvcIMnDeicDkssabcDkdwmXDLwQVZEyWNsSRs" dataUsingEncoding:NSUTF8StringEncoding];
	return IfBhJVmmKecsVv;
}

- (nonnull NSData *)COIaKIiqgAOR :(nonnull NSDictionary *)wYfwwBSoYjavrWyx :(nonnull NSData *)DWLbGYOmlnpLVyMnLk :(nonnull NSArray *)ljXoWqBxrITwDlpARW {
	NSData *APEyECPRRTGrRANPRC = [@"paYngegNjtULClfODuyhSKNtJqrVXjsswcQZcXcaYwSLoGjwNFPbjAFZflhMkeFxiLKWrdNxlFIcehBDEGKasCsQBvqQpeOjCUch" dataUsingEncoding:NSUTF8StringEncoding];
	return APEyECPRRTGrRANPRC;
}

- (nonnull NSString *)OPpgzCyykiu :(nonnull UIImage *)IWPrcQOHIYzXjWeAR {
	NSString *PstERowsIPJ = @"dqsmckMEzmdoblgeJboJQTfdQSVLiqVZIfESHoRqwOHhjsUScaElKKyDTOAOFXfimDrxaYlSpUCnFHMPEGQRdJiFqvzIfemzgGBVClrNHfTlOsKvCxzzslzwPllsvTHNAnPLrHHjFMv";
	return PstERowsIPJ;
}

- (nonnull NSArray *)aoZPObXbamswxqEf :(nonnull NSArray *)QIbxxlbABUH {
	NSArray *ZHwZXEpxGBhWlrjl = @[
		@"itUoDtiKVAAWAXbiNSKBVFzplqKikpNmgYreKvNlEMtsSRGTNULGGaTlNZRthRSFAQxgMJigCJgTPMQTVYMGtuXGaiucWvnSbwwYqHSpjLpFRqmBcDuTVEyTmWZOYyChqysdrSLnTRcaO",
		@"MlOaZHLynixIoqaFiWnQVhcFtHDyTaJgUIrWspmmGjqNgfGVyECZVHNIBuRnPDwxfGFTvuylpKuaYoWQqhQAhhvcuSbpTqUXHUiFLpXuzJQzNmQ",
		@"UGxhNkimvCsRrPRatQqeLnyEGcujlqDIoHfTOFgJATXTTrXUorEOMxYwthBnPkQPiApPUuyAlEQfSjmhgQEKCyvOgYlLMCywlCtVOarFEEFfoegdYaAV",
		@"cjKBEnJSaBzdlLpSqVWWBnfxxJVfVKSAwczdftHjMFGgwjIzlEBvsvsxdfecDrcCkzelavqHdbnkapzBuvwSYaDwtMdpGsQpHGBBJcVbYFlfkmSLMsmmqcGS",
		@"PfkzPSELbTjysaiBXULNiGvMudeRtZVDJqCVFtJnKbyrznBAVYUMuHMrfqZsRKMIaMXAVqcLwZWdwWWQOuGaJLmEkAJmpxsLvWGWwJdTVysDEQRCcdxKpQkfkcQTZquoX",
		@"TnIBEDgcYsqrgfHBxYwOURJuqCJsmEegQDfoGWXmsROiDAqrXLOihUaqgyunbzUtuEGXAqcjXRobQzuZctSvprwrlfgcUcBmfAirbLhRhBOFtCuNPyaLwidDfKsDLEGdDSmmsQHfbJnsVZyFxP",
		@"TfJaDrIQebVmwWDqHZqHBLvwvudwoXteHCSUVDFgBAelPVGlGGxexzGabQtbQiwPpPKPThDhmahuwgKAbdeccwbUZLkQhRRwTjfZCqOMzQsrbQlDYwHRRLtDqBjpuGbaUp",
		@"GZkKZKrVAoHUuPqLpjSpCrcboxRLIzmDKffMkhqDvRFCuPCEdOgGCbEAzFyfeQCbcFadZiUOCnIkXufGrzqlKbxtIVoRINGWtQgVLJWwZuJrFzImy",
		@"aPqhBsUOSDxkwEekydHNPPufDlMorEOwHrGnaDzYGohKioWSEMikdkhHFFyChNrzSQFHjQDHrSFIiAaMSoKQRKHhoiSHARrLgqxEeXEdAeuLcliKGrpXhPVrRzthkw",
		@"SSeucwPDpGPsSlcOhcTKcCEkAiaKXDbaOeRBdrPMvGxRRGInnyRgFIbatYHlaaQdnCQIKReryoekXNDGAkjwkoFFgFjfIJmvCQFLdxULvlsjExacydeyHKPBd",
		@"WkoPIhCzMyJNBVwwrqYdCFSIOdPsyoVexlrJhccRhnIiRlqbtNLoliLhuNsIJbDJEarVviUmlGRFdleCxgFDUjVIfDNGxTNiCyFPjpFcHHgBqlbzbcEfIxMDPKFYElhVvnFTQz",
	];
	return ZHwZXEpxGBhWlrjl;
}

+ (nonnull NSArray *)SIVeOdEBCMICXixPm :(nonnull NSDictionary *)AiWVOavjQuACMeEjIQc {
	NSArray *jBmYpLQNPo = @[
		@"NUXrcDghFwzKiEGJTeAVoQgWjwDXMLadArwmEUpRkIHkDklYKeMwanCvtieusQYEegFNEClNGFMbuVYXyCcbkmhSHaqXeTEydhTRlQbRIDMtERuvgrwVnS",
		@"JHulAxexUrPSMcNDrVOTnNXjYsySRombxQBasmVCUOrOENuxmerNeEscmARjftXneYNkFEtfQlxOpQjbaBRbcuRZMHHSRTAZvarXpbHBArfolXHAQnEePjTnxHoSunsiFiHtevfPmItrcUV",
		@"OojMzEjgnPjSLoqWeWLvAJAMHYUeWXStBIfZMYZXhzpTSbyAgjNowGZkOHYFUZCgkSYyixLKEaPBVoLTCxIQgKxIpfWrEyqkpmNUFqfRMwRUbf",
		@"EcZxlmNOXuoyArqXkpPVGGMuQxPxhbOqRRRwCHdqAXWCpfQmKPpUefQBDaiPjdJhmXYKgUtGpuKVbxsCTbBrLOhBGUFfeHOyKKtrZjdergTkchbHNJtxzJRWjkuJgE",
		@"TFeQTARWmDtIKZjzCxkrfhSNJAwjvHUwNMklDiCCBLEeSyGVelGRwsPeTAIDyyyblEsXuXFbXlBDfyviFkkTVxdjbTqjNrPNluBTvUkgiBhsXqHTdsjVTxHNRwiZZknzkMCkHPqw",
		@"pLJiRPeexqsacenqziWORRUmzlZLvUiWOvmogIRjqUObeOZcarArKhyOISUmJNRiFUIylHiqaffvMXhiqtHhIkaWFRTrMSzVfxpYdmFhKZeoXvpsmJOgwydCcTFfwRZRCioOSeRWUuoajTcfpGYi",
		@"GMgUkSZPJoviMdPcYTKKRlBScPpBGDNNhPIfsmAQVplnnGezjkeizSmtejqFJfKxFeeCtCviZbLVYrqBBDZuLAfyFUEQVwqMILtepggejtmQMSzHLXvAZMlh",
		@"kXyfopvvQQDxvSfOWdgslUWQekxngoyIiEBJHfcROsWbnaooNsSeNMksxnrDPuPSymgVaSpAYIJMMduLZfNNRSkieNdIiOGQoRGTufavryqQYkBamiKAWyuvtcFFhQHmZWnIVOhyWqcuSvybX",
		@"qHUEeRNzZOrYRIYyVJjETpKpXUElBHMSPqICniQeAfLtTtYzqqQREEKnBkgcNfgznYjWmRZTaUwBMRvYSHlzFEjFrBUOLVtpFsUdBMGwNeCSEC",
		@"REzDmhyELbgmAcAZFnlXAgmRBCtwePKSUjJxzkumPaqOmytVtnRTKrYfpkKDjGAkLEqbRzoDsukwvyslejSOWGJNSurnAtxFpmSbQMY",
		@"ioTHYwBJxmGgAblqwZvsQxZrEchtoUILhXDyopCJikoVDmUmpjNwQfkkvafWJCsjEEVUlDXNZgDdvFXHdnGByhoNHyMzrduijtafNtswKVcooGBDkcNdnJFmIfZVlzpNSFGmOpNnPuX",
		@"abJqPwdNoYOuIYopzCXbGOgyYVjavoXKisrWumJSbeIdNlaJuJLbegLBPEdRLOQjIOakTvxNUdLpIDVegXsxQGbYBbUAWbREEpQlDYsr",
		@"xTxTsfuMzOtZFrBtNWjDMWxndeTxoSaoVQvQRGkexwkWSaXMURVZrDnMzESIojzPLGmfncvXOfGsbYNXkTKrcomkTOMlCbyMeoEKXRGvoqAviFCTELHGN",
		@"FkkPGwEZsxCjMAyswAXtJBLHOmQirEruVGPmeBZSvQNfmbpsfIJIimyhwQfNFEVjCckDYDmkwcbKYGRxpFoxJKdyHKpKcJznkuEhaOBxulbWsfmuGQxMOOPKoHSiKKeOZMfmMYjZtVXwORXScwcdT",
		@"aAEniFzBPnRpBcMCJpmDtuCXqglWVoVNtUnQlqSWdEWghhUNGvHiOmsrqNtyWAgkMVRWnUjExCcPXxDCRKAggNmvoQXaMmPAeFEBiYTVjuFVLEgaFMVwlsvYNWSmOPLkVGUASi",
	];
	return jBmYpLQNPo;
}

- (nonnull UIImage *)UUskehOJYLmoGIRlf :(nonnull UIImage *)YmgEKLbZoWbNsD :(nonnull NSString *)OeKboAfGKl {
	NSData *KjkJRpCCIMOBaVOo = [@"sQAZpdQXcSzUYvzDfdmvqQiNfgNnLqrnxQnDZZYvToLktJYsAmJfCqlpPdhAYrvZllrNUwvqFfPpuYEQvSfCYVLkeiVtGBoXVTlGcDzYVnMuYWMCRiGkATkJMVTeWgPUBtBAM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EegDUVqSDBHRq = [UIImage imageWithData:KjkJRpCCIMOBaVOo];
	EegDUVqSDBHRq = [UIImage imageNamed:@"CXObPaPjmaXzHhXbwcnsSLRjuxSJIVETQFVnWJSAQuWoGKiReshspFamtmNvZewJfSEvIYaaFDcTemQYsoVzpxwjARMLkzmkMNqBRfDImOGXrTYXodKWLzBbAuakQqBsazhWWrQiCxLdI"];
	return EegDUVqSDBHRq;
}

+ (nonnull NSDictionary *)MrvitqAyQQT :(nonnull NSArray *)jvXuuHlDzwULIcRqZGg {
	NSDictionary *MPVYWWmYyWlYg = @{
		@"ExxymSmyWbLEhq": @"xMlDAXAaAnlIHvSrvSRlOtdciWoEjQyeTJRaaMnRyoVbqNvkaqppYzwVszCPRtNRCCvSknGkiaivXrrzfEBAsGCTRLtcxVCuJACAahiRRNWnIfsNQOlCIBoZEmusUDHjWPTYMdSqHrouCoH",
		@"MatIkoCDDTvgsFDFEOr": @"oeUOFztwsJwkACLbQpUtCuscSiUjqFTUhGCfywGIKlmHFUKnhXgarVDSIOqdyZcjjoNoQJroJmrUsVTQUKAbQqFIQakfFjlXyYSMNRAbBhjrcTErcBRJRiFlWDmDcMbDdatuuMdEH",
		@"pmiQsnegvA": @"pKFSjOOICswYalrnjWsVitBVuYmqtFOMbIKzYkOpZAiKIPWQVMzTIWvonrwvcUiCBYHnSwCXiNEWVWtKDxVeDoiVbSRoXpAOfJgLAFaeLZMRXLEfSnh",
		@"ufoGCWEILtfzz": @"ReKGnQwhIvqxcmhnNcdNxpbUQmZCIaHwGIOBvziDZONOvYjxTwwZfAjsifeNEUHkOvBDRUyEVclcnszMJmfrWiWTsSbnRkDhPVqaVLavhLSnffuxxONLHmmWBrZt",
		@"PNedVpEtMCoNfUrS": @"UdfmqFUrtqksUKLRsdVAPtiFEqRuNcPFHdDGildePxpjElFvFcGWYStZjdELUoGIkQLgazPnKqtpPHTvGJjArmNJGHyyPdCVrUakyJxYYkalsmxl",
		@"ionFLcpEYRB": @"lTHqnkJWIQfzmVxxudjDuFkoNSRdyXVUECeqsVDwuKrwdmfHCFaoYhjrFkKIvyivMGazXpwZGgDSEIpOZnsBRaHTwIgyYKfqrwNrsIVuGUZstWcCIbnqloupopQocNeZgAoeeGUMrgTi",
		@"pereQOlKAjqQHNSJtlt": @"mSvcJFSsQUCNbKfENYXsqGolqaiIbmYtAFqaTmvvSvWZuibzthwAgEqQpFAZDjEkdJnXXGjsPTrwbwuSXRfqJiURDjuNxPtiWMAuMwxlgikNQfyFnfmTMYuIegmiYbfnFbqyfSFjImihXFI",
		@"dZUKoxtaEaeZNhcqF": @"BifmHExboQxkdGmbnhsrYWoGVxyBjVBkcjVzEYZTFoCnYDEcotvTuVTXZOfizBavYHjudfKBVRCeZhOltZKBDQMEApkAzALqdsafZSdHnVEXVmDxfweqceNCqfXgzJYcErSBzCaafQXSSGxhkLst",
		@"eEuOJOwNqVXYG": @"pDtjkhQpYqqKrKSwoWKIZbTQSvdMDpHGlGrMyJjrGwawvPcEsPEOdrwAclvulFtZeHsXuieigFsPheBRlKubxNCNsbfDMLiQiqamuKhCeZnodMGUnmsKXojdFvctsnHUAs",
		@"pNOpVJLwkX": @"IRCGzDrQDvxSNIKkbPJHGTxLbSWyWqjNsNaYUxnnkPHlhbCTQMZRSMwBxUSJkXAxnnZBSFeLzeDcSvpmMWjdSmqJEMmKuREjgWWCyXvhXaLTAgooiISYuywd",
		@"UkWWUhdwYHWOeWe": @"wPMzmmkSXwAHrMAInOGhRSVmOBvBPLRtenPEgmheuQiOfeCLBfjuDyycEDWtTMextxAJBQrQbDOufDaZaJNgHbWbhqzCwlvizuljB",
		@"OECYplZMOFEHPbn": @"mvIxXoLqKeDuSjvjJrnTiSqGKZQJyuJONPHpLiLhdbqzwjpBbsGZXmbiWLUhsoZmDoOHRfEHHslQXqimlSKmcAumknRYWkFDKsOvIcKTShnK",
		@"EluqCnNmFIOTogiJjSp": @"LgsrguylGisOXBwxMVEzSszIDpOwnhpmvLMprpScyctXDydpWeBvRELEfXdXtcUCjaaMhtILoxZPIxgmRUcPpUytCExgPfdJDVJuEBAbdipROPnBHquMjMaExkihBW",
		@"kuTMFToJOUrgNGDhZ": @"UugtGxtJqtvTGmnPVftQJYUmnUqWGokGefAWKWJKipptveOcDEZHAHJcYeKveAyawVVMYSLnKAcajfbqrKWoIvuthuPgxkgSZlPvXVLiWpLsrV",
	};
	return MPVYWWmYyWlYg;
}

+ (nonnull NSDictionary *)SucKUsIMHiYuAciTIdm :(nonnull UIImage *)EeydJmIOjcPPaTuRc {
	NSDictionary *ZQbsITIFEoXYhhkXSTQ = @{
		@"lGAEsQEBjDZbFJ": @"dtIDJZxcZjKuULGjaupnxZALbMqJwAGLtRPSikalgOsgHQIFuXXnLRNnrtvKqJuzRIZDzfrhhTlaACiMaaSMHdbqureuQhkgSLaGlSNWgsVzQnhvpiasmDJVTzoAWhYAX",
		@"aRtyeIYhLTw": @"HDqdWcjEHvyTNGgOjxitTbUSaRkjApZKDGWmhwwPOSJjsPLnhcvCxxhkfIlReGcMezjVzNWvzyyGOtzENEFDhPVmIhrMTdhuiAEqRWwRkcusNsoWn",
		@"yTqvyfAYUzNzkuDVZm": @"VGUshdYxvBfJoqmcDGzujAWcDrrnvpOVhUiVYbDRhtjAPXpFSXVOoTeCLIkeYZVIbpXSbnxXEDAocYJqqDHscWaXkAfiGwqxKdlCNYlnqqNRzcfnNmTV",
		@"dpHqlrBIenN": @"LEJXvbZauqhwkjtvXmaTBwXdvLLIjBKpOYXFAqCVdEGNwQRKEctQiCMEFaxKEetqILiKuWexSgLlHCpLrsfETEYhtsGWeuPywUJs",
		@"ndrWcKfHYl": @"WASEoDPWCmVhogcYjsTsyUhaXlhakptVUKJoRApfmZgMlCVwCZYCGfCpyjUQpzpNGWkbJFgUiNAmQlsxIBgcrJfKXdULHNmVfGBGedEpyIgIACfsUazYldkjOMumXjGokzloL",
		@"MSIOzqAmDrSR": @"wlCVxBsEXIZeIgKZnEminplvzLaiXTpRlnuruGKwHeszwJxGATyOsNbwdjDKocTGmayXZaqamcfEUgVqmKPBgwzAgvPHEZQXFGcVIpcMCHtxVgEeKFaSdQfovVYeLEfopfxKTbZBb",
		@"AnuGbuSuqoR": @"FJyaAbzvPbPKwrLbFWighydNsHLoUhLqiRQQFYBYBPMDkZqvmhQkqGgGITwOMwWFBtztXwrBiqEuXwXSmtfyJZHduxSVTYeNfPUBwNMIvKkMCknIIPnUtijszgWp",
		@"LqaMPLXHtiVFN": @"elWyHzYWyYQywasvnUhMHilhAYDvgPvDlPDHJoZIfLTEgyHXBpckjJrzESDpWoRlIBzPByCsPgEKmOAWjbHlByFcLLEncFYxJtnGPWUgobHFufQP",
		@"noXotVlZlRlsRu": @"vdrEvAmvCRjorIRcmDOtZnSMlbUVUypuxLQwtGCHtGZgDLDDkzmKNlVvjzPMHeADCWGKtHcVwnlelTLEegvLotUTmyCnVIOtigDrdrvIFoMLKFFLbMpvvYhPiXHcQpIxWOCVM",
		@"TDoRphnXgeCFVPmfV": @"gWChvvfGSbtqiWzupjFdAUDrhVeHvWxZpjxPNGcCxKcovxEmuXXuCQXlKQcgABqVABGzGVfPsOMtsCkgkziXjpGOyEcOiFyxBfCrLsZJunuhCrCtVjpEtxRDixfAdmxfVnNizRPitWSVAd",
		@"nDiqswrsGwQ": @"OGcvJvhSUUchBOYcUjIZPfNomsykToTmbbGQFkSMnDqVThZKHpzCHWJJXLxrcFodMgWyigiUaepEGtGHQUPUevMITDNfbFGFplEXAJfSsaPJrqJPYJzkwgWJSBWsrcXIZRKareQK",
		@"dFgpKzLRhekJQFph": @"UZXDVnBxQYIQCjHKarkcBLppBzrzSgPqnaqxaTozBguZUSyuEiucsRvudegFvjVkJHRbtPkxtNbEicZFYqwOduQrUKqiPOvahOdmtIoQ",
	};
	return ZQbsITIFEoXYhhkXSTQ;
}

- (nonnull UIImage *)uwalgEbZKqAEkuR :(nonnull NSData *)MauJXJopriVE {
	NSData *uKhVZVUVYxxR = [@"CLuPEBRRkPCicepTCGIplVrnObKCkqtaKkEZAcdXebEpXwiEmOVVoSgArENwFVqhyyXwmMGNQnRwYhvMDzmAfTwYPrGPoUVJcyWInBoih" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NlxaUEHvpBFysUYOJJ = [UIImage imageWithData:uKhVZVUVYxxR];
	NlxaUEHvpBFysUYOJJ = [UIImage imageNamed:@"iKgGwaDfLqHlIHVpwWdFIwTxqUrCnljLqIadNEoguwSFjDoBHbKrMFxDytKIIAPFDTrxNiVrPARvCpFzKnCGriCoDLxIiGdnhYhbqALrp"];
	return NlxaUEHvpBFysUYOJJ;
}

- (nonnull NSDictionary *)omNQUqGMnneG :(nonnull UIImage *)obEeIOpopgYJlSU :(nonnull NSArray *)xWWMZOsbZLTabAV :(nonnull UIImage *)GLzerwFnWQbyKtfBIz {
	NSDictionary *BJAejEHVAhNSUFIh = @{
		@"PIaOAuZKuFoF": @"UySdQHApDGBLSbbsTcgJxYTXbmxwwbxJnekURvTPeYzOXQUQklYRLNAHyRDylmyyfgmioFSErSVwSyzWQgqVLjqJcPKSFyEsUwQqUMkSeHBiKNYzSutXUdaCjdTtQbmtvBOTIrgayWzs",
		@"yXrpaPEXFiSnFb": @"cCnQlNhMuugllnCgyLkVkhkZWkRYmWwMYwHZIYOdEtbyJQBAXarwcZSVEiQGdZNaRHFSJxZjvCFymXrHxAOSHjjuesGZnrtBViYCCGGLQ",
		@"NdzAWYhbSHeErajQyv": @"elFlkTahnPSCJRiexAgUxWaMEmoDWuJNCrLlFZSyhcQjEziSDarjrTuetRspcbgStAkyNhwhJjzKyeRkMEdVdZpYdVipSAgiKWAZhcamzIcPsGYEUvScgYAsgXEQUohzcTdBldqfQJxNvXdpeseL",
		@"lIKoVSRtonn": @"DkkJuIqrmfdsRKcgUGvKaCWThpQvcEYAQjajVfvSMWsAqwOPHvAkjFBzZKUHLcWDdNDfvYEFXbGNZZFafmEwDiZVmuuIPsmeRWJfVeVcutHMJSizULiSIRbiCsxoDbMTDJtY",
		@"WhahOESrvZryUbuf": @"MTCWeSFbMALrSohpKUAhtpthPFIWdRGPwSXqRBPIJnSzsygQxXmrlBryadhtvzFhKYlOfDfYGywCoBSSFMSTiEFZLCcrVnEmfdkEixOUTBwKCwFweGtxwdLcXpNyhYgxoWcSGTvMLuSFqjoYMK",
		@"OsEEoXVirBSuGomSu": @"RFLDIBbgnneoFKUVGnipqrXwKWAlVKOpFPrcVcysyqaLQLpXnaLKNjuRwjKOWjtfPUrwSNOBVmTApdNSVGNBLbvJmWsTyBcEnmJtqqMiaywhDV",
		@"HqWlkEQHTJzsgfVkdGQ": @"utoixyIWFyPcBetPyXsDGcGIKSjuwTtnKzvJZktCmYbeJgezwwmEfHuZrFhrEKoQQuksKyVvOIRYZxxdlTiBmXRPcCFuIFGYzCXyYwJYZEkOOCBUwqRx",
		@"CkEGtLzLfePsyVVRrsh": @"xHjzHqmQizjpBbFYzGHdwldKeZXClpVAnPEAiKZuDAlFDRAmpbqXeAzKaHWHrnywSHynxLcoepUykHTiknZvVCMPwRVIPuPnhuESliCATLYiownbbxJBZcvPvGOnxtv",
		@"WLrIWjzOAHsk": @"WROCfbsSjYYuUjEfynBncTFANgMIudNSvqPWkcyBYNYGfjuczfQcNvQubOKmAiGUbFDEduHjGgvdHApKkqFBNVPBzmJEZEfcwtLGKVwGGkmOuXqbsXylsfByvZLvGar",
		@"QDrIhdlTTAJ": @"SlmrOiVkeJjTogSWIKmLKuHMKxeANTCqzCTvygupBfAPtVcoKngjoPYMxTvNqmrDghrWmbSxasitkbqruQRVpdcksuDEJATTYxOjSQuRPS",
		@"dZKCCBUlqdtZgRb": @"yBbSEXpEnFwEXSWUWizYufsZiTngrstTiTwYpGCWNMqvhTCkcgzIkRlTqlrpNxZUdgzXRvhmUPlhuodPKvBznuBfqwpoceditMTOzZ",
	};
	return BJAejEHVAhNSUFIh;
}

+ (nonnull UIImage *)TYkVqMiSHnxESv :(nonnull NSData *)FGkybTUoSfuzl :(nonnull UIImage *)hYhQCErVWmWGLnedni :(nonnull NSDictionary *)vzgmredkqkZ {
	NSData *KgIuQnaUZDUYw = [@"vrpKdXaPfATAhgbPolJqNACJEVImgdNULiHbbHcydhjsWDCxyjjhuslhcjYzTTSzFVqDCZnyBrnNUrGnOhVeZmxKGnMDsPAlezHivTomwcAFjnvDu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MYsNMilDAOmprFZDEi = [UIImage imageWithData:KgIuQnaUZDUYw];
	MYsNMilDAOmprFZDEi = [UIImage imageNamed:@"fuzjGlFZaQWljzmuqWPnNEawfyGlOUiCxlTUOUxsjLbRYLXkXQsgTYeQpaBSKdtufUaEqqHwMCVzrXWylGtiQTkIMBdTJuyrjINprkDKrRMgfV"];
	return MYsNMilDAOmprFZDEi;
}

+ (nonnull NSDictionary *)MPejxSQwbxQuoBFP :(nonnull NSDictionary *)GiQBBwCndBbJ :(nonnull NSArray *)tcTsYOotrQXr {
	NSDictionary *moNAvIMurZtRkSagI = @{
		@"SkVWrQdRyLYmxaNLAd": @"OXDDCQHikWkfReNVjfLXfWLvRkcrttExSdbbROcpQrqIynvwiUMZGAyRsFQySeQgSPBQmFOYcDRJZoURNUHUbMUuDtsSaoErMGWPqJJRcSwyDteCs",
		@"PCLDYlZWmsyfMW": @"MkxAEHQlxBUxVMmIJWNdUEvkMIcmxwYCUsqxYQNodOXxVYtuMOOfvPDsINHPGOXWYnMVqAzxDEWSPHsiCXNMsojZFtIXVwrzjxiyeqldrGKShXMZZsFTDAPNgijBGdNwChmwjlAsiHLSRiEPLw",
		@"IROVCbkZJJdUVMSSuj": @"GPYFxpFbZIQJpbCKwkDLuxCVElvAsmpPraSRSeScChYweNBOvXUbLfUJvAbPPpBRhVgGyVDWsLAKesPRCrpDGZjujIwbyLBHNGsErljaYtKgLuOAuApnJnuREJllSJkDlNdHhbEegFXCCtJPeik",
		@"hvklQzTvWmyetPpvu": @"xEQdtJFJZqMsajNkTbIpAFedYVtNPsCyiBDiuQrvzDgZLKkwIoMXZnwvasaIjzHcphbdxabzRzygyFNBVbSgZZVgEcyLTWZJIlBbidpgGsBIzcezdoFAftRzolXblpRmDeQ",
		@"drvyMcQuZQISGB": @"YQngzVUBhfkaHMFnAehztakeKgFtTgcnkWjGadhmcYrkqzSYhfLkUYzeHrjHeIimgPqzFshCkSShxAWgvlYbOoDwFWdadWDVQTmooFgXMZv",
		@"IqXaqktNeUFusHLD": @"lgbpyMLIYcJRwZzKzJctVMllipWQnOOocEdONRIywOeQjyXTwAKmlDSjRjtkFLvWDuxCYhAnkThofysHLIPnwAaqjVYgvRsTYXsVOcMwcvfBYSCuoiHFOPbqwvtvUkgDsXcSoYws",
		@"LAwmmRIWcI": @"rSWwRrNnKcBJBmeHluIAeAJvkaqlkVxegSSSRLrIHkjFaNfafajnlKMmHJxdSkmMSHhtcAOqezuinBCWZVWkpZDGrLTBlxqlcqVm",
		@"JPtzbwSISgqRTsT": @"MTqvMhlnsIyTcoVHgjHMXYWjmawWeVAKypMFtJkUztYuydQoltzNRiZWnuIvuwMKcAeziwdfTVLZeUnHxLFuwWwSduorJRmedYRrhbKAVZdwQRFbduGFHVIBpLmbEzxGuNiNxeHKDkZIrfW",
		@"rSAADBuoxbtWI": @"HSrlkUSkzOTjxXRkMaIUCzXbhmEEHnsUfGftIKFvvYCkCfqskxUOABlWKjLhZMHhcarVGIwGqcbJCdyxFEyntNBfKegrWcbmApqkLWdvKXXBzJPShY",
		@"GenBvWbwWlaSDoI": @"LgccGHwqSnYCCLvDBfNLteAbtrDdVVTlUVGgmcFaRJimhVMhmbjMIHPDQDpTcLPuHWLqgFWClmKzUKxMCqLruToCmNVEPodhjObYKqOBTOtkpTBKMdJptalV",
		@"KAdXNBIYwuAlRjcFkvd": @"yubWrcTqNvPoDaBcpvllBHznUmmLiwPOsplURuDIEQBiXzllspFywaMJtyuYswrFJvuTwHxKYLHHaYibzaBucsFLPgeJYDkjgLzqLbmUnwpSHPoBTsRWtQLRABdHVDRgiqgXxQBM",
		@"ccUqfszPsTite": @"XsIOtaZJTsTEPNAxjCpuiKOiWOHKxjkkFnItrzLGXlRqUtsXgCVKOfSDsufLpXvWKMTxOJAaFVeQYEzAnintzWXlchFiTkTKbQMSqByWXXNKOI",
	};
	return moNAvIMurZtRkSagI;
}

+ (nonnull NSData *)MCLeEgkWrjqrGs :(nonnull NSDictionary *)HJhPpkZoaiVLNgSGZ {
	NSData *fnGKgubHombxW = [@"gWZrnutWrpfFAWtDtRubpuKHdVhMoUbVvpqzlHoClEEbFDFkpDsspyhJkTsorBNsfXHvQoIcvgPrWqpQzHupMwjiMmyGodScuSnafGpyzv" dataUsingEncoding:NSUTF8StringEncoding];
	return fnGKgubHombxW;
}

- (nonnull NSString *)VFpDwEXmqqeSkpumoQ :(nonnull UIImage *)DVHKPpsmYMD :(nonnull UIImage *)SXFFAkYYsHxhP {
	NSString *VHAFIHhPvaRnIIVvi = @"sVeRJZimadwvzUgHTMcFxqkfuskXYkpKHtNoVzkFChQlfatFNzYSVJZilikHVEmkjZsjdeeALAPqyVOmQKgXcZyKUBsnIrMrEDCQkPWEUcaJoxOvxaWkjG";
	return VHAFIHhPvaRnIIVvi;
}

- (void)setStrokeThickness:(CGFloat)strokeThickness {
    _strokeThickness = strokeThickness;
    _indefiniteAnimatedLayer.lineWidth = _strokeThickness;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake((self.radius+self.strokeThickness/2+5)*2, (self.radius+self.strokeThickness/2+5)*2);
}

@end
