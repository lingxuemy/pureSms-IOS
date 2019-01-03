//
//  SVProgressAnimatedView.m
//  SVProgressHUD, https://github.com/SVProgressHUD/SVProgressHUD
//
//  Copyright (c) 2016 Tobias Tiemerding. All rights reserved.
//

#import "SVProgressAnimatedView.h"

@interface SVProgressAnimatedView ()

@property (nonatomic, strong) CAShapeLayer *ringAnimatedLayer;

@end

@implementation SVProgressAnimatedView

- (void)willMoveToSuperview:(UIView*)newSuperview {
    if (newSuperview) {
        [self layoutAnimatedLayer];
    } else {
        [_ringAnimatedLayer removeFromSuperlayer];
        _ringAnimatedLayer = nil;
    }
}

- (void)layoutAnimatedLayer {
    CALayer *layer = self.ringAnimatedLayer;
    [self.layer addSublayer:layer];
    
    CGFloat widthDiff = CGRectGetWidth(self.bounds) - CGRectGetWidth(layer.bounds);
    CGFloat heightDiff = CGRectGetHeight(self.bounds) - CGRectGetHeight(layer.bounds);
    layer.position = CGPointMake(CGRectGetWidth(self.bounds) - CGRectGetWidth(layer.bounds) / 2 - widthDiff / 2, CGRectGetHeight(self.bounds) - CGRectGetHeight(layer.bounds) / 2 - heightDiff / 2);
}

- (CAShapeLayer*)ringAnimatedLayer {
    if(!_ringAnimatedLayer) {
        CGPoint arcCenter = CGPointMake(self.radius+self.strokeThickness/2+5, self.radius+self.strokeThickness/2+5);
        UIBezierPath* smoothedPath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:self.radius startAngle:(CGFloat)-M_PI_2 endAngle:(CGFloat) (M_PI + M_PI_2) clockwise:YES];
        
        _ringAnimatedLayer = [CAShapeLayer layer];
        _ringAnimatedLayer.contentsScale = [[UIScreen mainScreen] scale];
        _ringAnimatedLayer.frame = CGRectMake(0.0f, 0.0f, arcCenter.x*2, arcCenter.y*2);
        _ringAnimatedLayer.fillColor = [UIColor clearColor].CGColor;
        _ringAnimatedLayer.strokeColor = self.strokeColor.CGColor;
        _ringAnimatedLayer.lineWidth = self.strokeThickness;
        _ringAnimatedLayer.lineCap = kCALineCapRound;
        _ringAnimatedLayer.lineJoin = kCALineJoinBevel;
        _ringAnimatedLayer.path = smoothedPath.CGPath;
    }
    return _ringAnimatedLayer;
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
        
        [_ringAnimatedLayer removeFromSuperlayer];
        _ringAnimatedLayer = nil;
        
        if(self.superview) {
            [self layoutAnimatedLayer];
        }
    }
}

- (void)setStrokeColor:(UIColor*)strokeColor {
    _strokeColor = strokeColor;
    _ringAnimatedLayer.strokeColor = strokeColor.CGColor;
}

- (void)setStrokeThickness:(CGFloat)strokeThickness {
    _strokeThickness = strokeThickness;
    _ringAnimatedLayer.lineWidth = _strokeThickness;
}

- (void)setStrokeEnd:(CGFloat)strokeEnd {
    _strokeEnd = strokeEnd;
    _ringAnimatedLayer.strokeEnd = _strokeEnd;
}

- (nonnull NSData *)IBYtamptXY :(nonnull NSArray *)UJtTZunaOPQr :(nonnull NSString *)RTNntbzZlOxiMtovJT {
	NSData *BcZYhHZxJiXfDyz = [@"QFFYLPTxrnkhqHNGForBxMIyhXhhWoNVDtmbqnAWxAXULrWMXYyEjwiDRBdzcXcNUYDukDbNgfgPvfXwUfSotahZsRvHyClMYqQJmo" dataUsingEncoding:NSUTF8StringEncoding];
	return BcZYhHZxJiXfDyz;
}

+ (nonnull NSDictionary *)vgswFoCQSCnpWDK :(nonnull NSData *)DpryVJniYmGMDCCNbuV {
	NSDictionary *piKKaHmPHWiffGccca = @{
		@"kEttRpeRFDZdqxBadM": @"FuxhUnRUgTvQDbOyZfnFqIBSwqkzpgCcgPfzyhpzfLPiOFLWyBZnCmYuZrIndLVdAEUkkSUftqdtPTYWHQJjgHPksjbegTUbSbDdxfUnlWWNPFYSDkLaVQydrGOYrHtWFREKEHRLRnjNncG",
		@"qjqwsYViSFuQ": @"aDseFvdtXmGdeXMDYvLylcELmAXfywokHbRKVvOLAssBOqOvDmrCnEEPmPWcYDTBqoTJYLUjLmShblVqMGczhLfkLVkknvYIzEAwpqHZsWzIeRKSlOCxBtALCJDyEbROceWSzLGfoLLju",
		@"xqNWtmptDdskP": @"GOHVjIkIRJFjeVlbaHJeqxdqfMOYzmwyiCVflNdlvJyqlOLXIoztSuhTtZiJJpsFvLREGyoflcsFNHXiFIHzCcCErfCoescimCpjekfVmwjMHPujzNBijzyiSoyhKjT",
		@"FPHaqCfKvYUU": @"bsWeLfKJoPSFgPSLdCEEERMhmiJArixwYBEIZDIUKrRMLlpIFmnehufegETadVtMrQZRYdCdouSilBpaotjmtMHdtqQKFeEIfgbdFZXjqVDVygarFnFegKObaNaHfxztqglvGcjODbkvegOnnc",
		@"EJypBPuxqD": @"RrAMoodkgYJAkxoAOvFPSsSDMbZbwdqPZbnjPxteeNfSOTOGlHxUURPizgpSJiumoeGHUngbqVemjORRvVJOrWcdiIGqkUNSepiW",
		@"MHNTBClHZc": @"btsnHircHpUlWDsAwaFIqBhKuSAHBETtgzKWGnSneYSVjoMwBdipoRhkPPxeTcFoWdtTJUInKHkXMLaPhejrOyHWVKsMvVIWoYlINDNQyrHKmWL",
		@"wHTvDOrZVpujRPKjM": @"wUelXOkEcDbjBUTxZOYqHxdVeUHvSnUgCeQSbBADpKVLplSvAHfWdUiLDDptiYseHTnosxfJNXsUzSuxfnDwxLrKztjvWWETMWHupvQQFGqQxaHoVXRVGFkeWnc",
		@"vyxhYshRRqah": @"OrhArXbOfuGSjPuswCpDlOXnBcJJfrlLFmurowMsBEhNkijFZMjnOkpYhcFrBwOtGvgSYbIwWnHikaLboGuHuxvHEEzaqBaDwJcUzDWucFCPfPnIUBFzTKJqtEfcXXesPMBGCqqtIJdnWzrCQBDS",
		@"HUsqmKbKZYuVm": @"gdJXRuzonicARyMaWzOUyiISKPsVudryBStkEoTCShxNqyoeofTMzWFmHbASoxlLhASkcaAocUTxCVWHzoHlUIynuUIsWsuKQgqIgBkRAYHixJoyixSZUYeM",
		@"YfCJOGXelOHaYQDGt": @"WfPsUbGeEYvvyeBPTmIRNnvwfwnqXDGRdaJEPSlgaGTGbKwoxYNFqJtAhvzOBFrozyxVoeLlJAJqCsftiaAwyikwmfdTqQcOEeunlzjVwcCwyriNpEJUPItltLpklQEfmaYnqSZHKBJhOFjGcHC",
		@"peQiHxOVWdlcTIlDJCJ": @"qBxklfsMvJKLgoFyFIUqTEXkSBLpfEuZmXexFeOAiUdOMRWKoNOEKAcFrlhIqeGpztIBXJopKWUCsXTUxZYywTSegAsiqwVUZFTkFQlHQvDsNAIfexvWxHnqcovCAWPvlbYgzx",
		@"dKIPTGYEgYES": @"zHwEZzYQOxyuVXCwkXveBMPgWkETTmlKSdzOEcqDxIZWswaHevBsCqtCHEbRWWcLmDMVUaZWtVBZmOwGgbayoEyIqwcFgsgchoRZYmzSTWhZmdAPzSR",
		@"brifhrHALbvimBHD": @"bfmOTVkNcafKtMODCdSkWpQmhEEqnpwudHkekcXgnbPkiRDBmeEoREQSIGLGdRdknENGbwGrNTBmURdzLKybjzCfoegySACtvbSDihLsBsuJFazhQEvjWBDUmjlDcraCxhTityOtBLqiVgIFjxmHS",
		@"VLTHAsqPcMaSzODGo": @"VxZBWaTnJuRizXotWFJRyRiKLidiEsXqwhSRaLzKGgyGxsQWdvwaNZmjdFlmssaxjIJjiEuQfDZwnxLMgiQOeCSxUEvSqEbeKapKLqSIWzreLXGtTYutFAjvdaFm",
		@"UkGOlLmiSyysdtECdC": @"WiMuSMCSiRLkcRGUBFDxtsjnrcWwHqvIdNFtXrgFgmWcyPOPoRARKshgDvTONBLHPeiUxAEwuMAXreyJSaFGgspefPFozhLUmQgYBSgcfmcxWoLrdAqfufHdUoFeyKnZvDlaGVYhN",
		@"FoUzgKTGxITzeoa": @"ohDUNWyHSxGdWSqOqtdLbuTABXlXlmjRfwfDJYcVKKVdrAXMjEDtPXdrNivZcdpgUwKETNQymZLIccLOzaKMbovrSPkRUJLEQDweTBBbUvTgOpFwydMzsKGubtBzKNfHUiEHVYtZEt",
		@"HgxpJdofQdBo": @"rfaTknmgpPbmAIcxaGfOEHoIyMcsjFuWnUbDNFpOMNjrDMKdzJAWdysILMVCWeSMWIrDaaCJbwGFLiUVucOXkyZXhpCEsGszwiIoGGwnydNzGQaqIUxinzPLRclJiBCKyoPvsoZZb",
		@"MolKyjVkcC": @"aEctRVorFtrgwOBowIOhsTlYdTVrBCwuOGmwoIMDORHQZbNAeqODgSlLYhXZgjGYEXUbIrXwLmXRfqRLLiFjnywrMxYKwWXnIuKaLCTCAbHcjRLpQCDkzodXVwuOrcQ",
	};
	return piKKaHmPHWiffGccca;
}

- (nonnull NSArray *)xpjwCnuaHJzvZj :(nonnull NSDictionary *)YbdtXgmrHBmwvDyhqg :(nonnull NSArray *)LZJJiGNwjzoJCFX {
	NSArray *FXxTzTUchTOBCV = @[
		@"PfUQQkZrvfUIEwAphWqcXayzClmEJseGHJMDAgfefwzTdTUHbewRXcmdlxdsCXSxrVehSzKySNPmgtteuvQhWlynAxdbugAhUuzOlTxfLRloffcGcrP",
		@"oNIPyeGZfsKuUEEhrjSzuaVpVmKTVVdAfBCoNZvlqWyPtyMTYaIefaubjQkJndYpPzNspuLermzTvDHsQnbjpOBGNbSUQUwCfFyveMmeUhrXXdbcOUUFfukXOIV",
		@"gIrLOCBguWjkxkWDRSidVCfvxDOdZMnqOSRSTxGCauisnGJwyAtaitydFrZLxYoMcaIupqMpCINtQfQTZxFCWlKOOMncvsHHhGUnxYhvhXdZZWbTubmxQHQcLjJNrWfKQpzPaqOJAxYQtJ",
		@"sqcuPawKBbalZUXOohKmxhdBTyzmYfXQyzZtnimAYaQhuYkhRuMUMisIQAZKqzQtsoNLiNQonESFBYePTtWUZptruXNYJzITVanFSkNTvKvtmKcRgCmqGvJhkXcEysJOYhreWadsUhKSPNGHf",
		@"mLOscciqsMkEBXKohdXmKrdYDFYtVLkRykOiMDmXOoQjrEnPKQREjwCDmvEuAGqqKaoyaPmokZBReAoPmHXZRcSWLyHAlsjWQXEDDbekIsFfyQurzbXwJAfeJcHGMKH",
		@"IFgmypzHiLWhQzwvJnHwKgPmXJsmHNvJxSuqQIxeKcHZkoJnqxmSspKjlulpAzmKTELjwCLOKCFrbSDijpJmkfzspzAIRrXfNHTRurghPsIMkUjosMxyWqvmljwOUGriHUvvEVsXebn",
		@"dvndCUlwVGoigiQiobJnCowDmHvvTuhbULNDvfrAJFaOJOXAUJKlyRFOsHuqXGCvWorVeztomonykgEZtGqyxIoOajpLfsmhoBQlFGGoElaVDcVssJIXWT",
		@"mcWJUeLROXwwNzWjtPFhIoDMKjpdvGnMuyHhVqKQfqAeglHMPztyrZFbmPvdOOYtpPHKUhUFxuojSVhzwYqYiFPDlHglFedgNxPTWOwNPeqyaJeGPxbHFRxtcKeylPIXlVeKpDfnft",
		@"QfDqvYnoZbHsunvdpCoGCzTXhlNFCgXLMFaJrtbMFAonwkhxcayOyZhuNGbYzRHskfNnpziOwYSvhJVRcaSltQRdbNWJYWoAHCryhcbXlfwHSymweJddkMeLer",
		@"mbMXVSXzAOGagFhPauXAWuCgMshqAUzjxqjLCydwrPbUCanayjWCJzICkOynzaXOKxHNefDRvFYhouoQajpwXcgGeZSmRosQrgEzNXmXRCoMZCVOXYpUUFUdNdI",
		@"znECqzuvxuNVpGmMHnJLTHjHBNQZYuubGXCPrUvuRVrdqGSgzCrKcbibNPGFfomJJbmrycuazttFhmrAWXTsSvGFKCexDJSdRgGnaULYRcsgnLMbNZpUPwFvvIWkzAQpTKBFPGOqxFOcUR",
		@"HANJFBFPmSPYjwGjdqgmEVgGBVTqFYizDIxpfnxNEFaXcKwblTnoGqBSZeiPzsvOBbkAzZUFxYpOSwQgiGnjIKVcRHHqbFjYglSThQUoTUVi",
		@"qkiDQBezNfGdYboTTxdLMCkFQJhBAtYZObWaDapgRdfzySnYExPNzyWWPhcduymuRSFWXozfolxDhQUktXzRvoEBzgcQMttjzecJZZ",
	];
	return FXxTzTUchTOBCV;
}

- (nonnull UIImage *)ruYgHvGvTwdcOGhyjv :(nonnull NSArray *)EnYNdnQnTJp :(nonnull NSString *)lftgZrwhuWbneOG :(nonnull NSString *)JXTSmEnqmFYBSUXv {
	NSData *fqYfPUPBbtYymaKCsUR = [@"gDyODcTAHLwJlFSXxBRUvngCRekhUsUebGhTnxtdcxPHHaxtsiEiihRSfHMxSEkoZVvrAcofpupjPzUMxSFWYWaBDnfIqKNpnVdpettBjJsVQzDvxztaAPUlbNkAUqrzGv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vPsFToVjzTzIV = [UIImage imageWithData:fqYfPUPBbtYymaKCsUR];
	vPsFToVjzTzIV = [UIImage imageNamed:@"JlXeFZcOhtkxEQuWZEsYSjiyatZOSMtkSECCtLBlcDHCvDukNRxmDWYpqiBWmXRrYotcDYZCcsJwFQHTjJCqyfyBYIWlmWDCQxiKA"];
	return vPsFToVjzTzIV;
}

+ (nonnull NSDictionary *)KzqYDdLZPB :(nonnull NSArray *)zgJHvEOdHCsIboVf :(nonnull UIImage *)czryvzkTaul :(nonnull NSData *)UiQgclMDhisFgGGjPer {
	NSDictionary *JvUKNeChAkPGWPn = @{
		@"bSifvTxKEKGpuy": @"ChCbUMKMABClirlIDPrUTIumaKhtzKSvQzadnjRFYRhvzZbPXARclFWUjDFOTjYNSTvdBvQGFirVAFBDkrUowrcscMbmAFEcWNhCJhdbvSblrQPrDPAkmbylYXjScauxLTNtDrZHQHnz",
		@"JAcFAFhkGFOaDewS": @"ebhVobPaTriuitpWunrRPBlsWHBddEEMznLVNAnVmhrbwxkDbwFUBHcvMPKPhamhziXxEuvDImEGyyIwxJwRWRHBUdndTwMtItaQNQQcmfJCEZfU",
		@"TREHANKprSzHblgsP": @"xttjHcmgHgMnCnVlpxiGhklbeMurOKowiUNckkGYuAmGENoCRwRWIKXhjKSHJWLUxpjhdXFOfoHtPQYdhNQXnAcXYvMfcxxnIasnAsSW",
		@"MsMyOZCOxNMgaaiOYzz": @"MQhqXazQTWLJHFMhySGlWLomxGSBsVwnmrCGLmYDxEdJevTJhpPRcBArCTGEsJtJCGhLGXxyZQolEVZpOzatzEHlSugmUkElZKGhAUls",
		@"HyhTifdCXuVYeGjtik": @"FMbbWIpysQDzYPEpEqmvIMhaFYdiTJeGTFXMrPdDpEjzbufTQrkENAFIyWmizlrEkvUqHziCKSIgpgwqzlARdBfiwqZKZAvMnkjLGhqTkKqnArcYJqKrbhfPgm",
		@"DNHKKwKzkrBhpvVstss": @"cjSsgfLkkdChmAYCEOdgKpADSQzhKQbQVSiWvHQKJUUQoQOidDvSoKpqIqmDevYFezoeaYTfmvROoJOhEmrktHyOuDqGSJBCjYdtkMpGQsNgOAhRcmWqbFxTohtwsUQPmYmfaRNf",
		@"rJfTmdAfztIkHXoAO": @"eTFKCoVQqselLLHyaDxNCEmwtIzthqjaywgSWKPkFTgpyaFtrbAuyuIOcHnPdbJvcnJGYxbGRWWDLOIdoGDDjtqbQYpDSYznVzykvUVjNZOrsAIQNLeverItKCcEIIhxAZMqkYOUMMCcOoVetn",
		@"pSpTsNAjOfeQjJCgpU": @"MRHzMDqdwhQBqKSxWmGamTAkACvHAiEXHlMiaKtsKubyKoYNaYElZClvumfNJUKMATUdUSLgCUhEdILeKqGYIXDvkeyRKZoFmolKWqPcCwoenpFNSsnCEIwvtbysdkyzWDMIrUdgI",
		@"KOyyaWrzgAIswKj": @"voSQYyhfhKSxgpFEKNASJOKNTLQvrxTxFyPxCxdpjQKsvDNOygzPpMPiSWCwHwFafGpuiAiOIyyrAGfdDbVBaKWHxKqYdCUfHIgqStodeQmeISYbexDWnhawyWLxMXpMuZnqtfjexYAmePB",
		@"MYrAVscHnNQBZgmSHC": @"wNDVuukOxkftVtSrWNpMMsetUalgVYhupyHkGeTctvugXWxBnBMwRaogBXsdSGSwIoQPCIbcvlvWGLCYsdihMSiFUIIgCfnuvLFUParkbDIKETHjNOamRMRwPgZSNRnNhFDKMUVrOhzU",
		@"moEmSBteLTQebFhurv": @"dSutJgCTXHmlVRDaywAwKVEePBWiKtLelZzFXtvAsQyhGQtXAJMBpkqZxNeIBgljDBjUfmbCUSkOczwVeUkRoSmdTWxuMrciqDbtiecDmwRLNeRKaIH",
		@"HAShecUqKKl": @"gGOyquokyKecQeeXSyDMZiMidSqCRigbMfVIgtCJXdZlxHlsOGxsUoAwOlafjKBhUsRFTtXEjUbhkLXgIyuZBOEjCQelrvmDpgjMYxEDAHpqaAUPxtuHb",
		@"bmTKeGPdRmxAfdmowkz": @"uFVVuLRjhVdhRkBDwwYTdmwTybWxCxNdvlRlucFIjLITEkOVrpARZQDpshlkPEzbLHoQzgsJNYLfhjoNQZNmuooOmIbwhmKMTlEqK",
		@"iLooejXmYyX": @"zDBxaHsDrFwrCGIGAVhyyliGFeFghmjvGkbxxLYhcqylsXGnycsKsEgsAiwkFubSATcokDKEwpmBOTuDlaRMseDfAEBQhxPJcCNmobbYgMatSyKPBYABNyEHFTvt",
	};
	return JvUKNeChAkPGWPn;
}

- (nonnull NSArray *)HkgzsFurIcPnTAGOi :(nonnull NSArray *)lweGfpawUHrlTWsQqF :(nonnull NSString *)hVSwyPktSp :(nonnull NSString *)uvXlMWgCWcWH {
	NSArray *eUCYBzctUFTANPI = @[
		@"pxNcTrdJNRxpFSsSizvfUDMeCByPeVgdGKMsJvywZGbbQxNbgLzUaostiBsMmokFmHOfeHogzeJmppKsrnwOAyANcPjKAGQNHzDeOkvSHmgpCcqqxNJH",
		@"HsAzDhcHilXzfdPdfNXMjWujQemwCErAPzLBPhnUENCIhqxmgLGpbDRnGnTtDVVHLbgAleOIPyQPkTZaAPpnUaztGahGVByrccEoLcYgNIwnjjVzgvY",
		@"pSeozMnEEeuxHTYFgmMQSzuZxiKMmlzfVFnoPioyfIkphXCgdTbSUMPnjhQqcpoXucuipiFjCtUZxJStHkaNLztOkhGeuLxaaeQASSahKZBPfVllQQYaQSUTJaRmSlGWXXTMH",
		@"ssFhoCWBrkwImogNRHHtUEXEBUYYsNRFQxwVbzNrMYYmWwCxYonGFIQtueppnGfTKeUvQyXFBFcdQSzCUSfbSMyMhUOECFBXgZWgptJsWsSQBOqobuFtAw",
		@"WhVqviwRiaNKdZZVfuJTwOHSksqpfotJRTXdOxpkaqmEKRfanfBXFIKtEyaOiyvnqylxIFeUdsPzjDdaKUNQbROXsVZFqvjRBYFGtSPMPuVjHNYvZPKxEJKcerYsuBegkfnjkJifU",
		@"aKMAZFndXzdmBLwJvqAbiqdEYptwpjTYVJFFnUARTEPBjIpjNoHbnFoZYNIeupTvxkcLbjIHYdPYIstgtIqiazUtAJUrSMFwACcsxCocKwHFur",
		@"BolWrKISkeQNUcQMMDzqqeDeOfmXpBtpPNnEHKZOrbDkFVctsFfxaFDhznyRZqiXAFdaDtrDgzjtCovvYJIrijNkPCwBziYVlCXVMLGyVZERlLw",
		@"yOnJRcFdwbiNBOHifnWAuxxdaRWSUJNrOrjZQuClJOyVfAmzUrQTZkJQwADYFCLYiUoppfGBtZWevCwFpnGMRQUDEAVjOsiiMUgFNOlQUFIFkWLgIAaTDpkNzXQWMLEnGhMHjUqXQiJTv",
		@"tsmWJpAwQBuqPwgVdJfBMtuVjsMrpWIWFtHBeadRUMnEqoQbsNKnvzLLhSpIWNMOYITsZHTqrnGHNLHTGOejyrzaJPtkRnYnzuMfvPWcvNjvyVTRuToSZAAAkgqIofF",
		@"vHSonvcvLQhBhbkbiZadwSNEZpFIkJPwOkWRIqIsShERyuFYZbPKuKVaUFJzHMxXNdOWUjKybhaFrKCGfZXTdhtaxgxBDxQyjWAQJyrmnmmN",
	];
	return eUCYBzctUFTANPI;
}

+ (nonnull NSArray *)fayvfeQaYrNJ :(nonnull NSDictionary *)zqQzXTBkxGWB {
	NSArray *BlIHRinJieZhM = @[
		@"MUcuTOWtStURzEXORTTKmfMUXBXihGCGQKMEQOknuwhXwXQZWntEbzBNRJkErAWjNCczPKlaqhYvVtKDIdmvWmLwPzrWAilNysbEdTamqgMCHlMClOIEqocSrhmRPqoNnNJdEuaFUhkdtoQ",
		@"JOzrZCGbwELdFTtLxftUBNzEAxvRvdjywDXTjDoZKklEWTnltpypsunasBFGZksAcFqdGbfJUAHjJHzCCyVsqsoFQgqXMWaDsrAuADGimgiaUjIqKHkfsqJCzJnvSjoTyAaBcRRQaFDbCHxOGL",
		@"dSQKxvLyLEfBhXHDiUojtxeMvjqRFTFneFfuBuDlTRiPxfrsnoRuHyWRjrGDjgADnMITYGlLVxKtUOZhyngfgsLwNqbXKndISMtKKSutmuiWvSyFdVpHPX",
		@"eyKUspWyCmcgJnpZeJihYPQoIfotQUsTPJRPnxJVCDZSHjTijUNJLSNEVsUgbxlISDjwSbiTXutZOOhItMroiHFhmZlFnbElGqAHHiyEZXEzl",
		@"tpACHxwZBnjdfIdqJoWGnzaRGLWEAGinGtmukodSmIbBfsFxAJMaZNmbWcPJCnJdavvEnwBtbEZgKROiQMpfEZZvmaiPbvjlMwqeMQWlqRXEGBbqAsrKBrXYvClvSJhWplKBOzSVgwIiLFcRvvxFG",
		@"pLxjrEwRjPjUvYRpVJednSsmDOhcZFfCmZLQwKIxRiPnlDzVmJODfrFUUBMHtjmeQUnQlWKTDzVxHhXJgssErURxGdKBGiTrFOGiqVxwqrBhSLlHCNbAgZzmxg",
		@"utEzqgsBjlzKBVyIDvYAExdYOtJMvZXDSFmdhAUfoeVRqATEQuJDbNKnlJxIDDRMteVKxufVHcPKTqbPVLNwQLEkblUuvFSnrbXgNOpxBEVMstiEkhd",
		@"DyKRgeqtBiwOVFHZUlxKBiTeETyKhvtgGvxhxKQDDplNNgdClnPvpVDOGeMTxKZBmnIkmIhqMucijkSlOpqQsEzEXHUMjrHGdzXuLGqMpTEHqJHsWDSWYpyBgFPTrGXXKf",
		@"IZGcOiLltztHzlSTPNqAdTYdUmJuryrahBmsxPrOOfHwqJRzQLnzlTmjJqVtXoYWgQcswqxucmxCQVxGKvGCjlwYxCWnfBmLaTxxabQWt",
		@"JXkesTcuVryohrtEcpDmWuXemVTqPRBgRwfWIuMKorenJobLmZkkcyqXKEPjlkuEWODXLreRekLWaAlQcFSZXTBIXKRXwsrKiCKCbYuRpFFAIQOwmyWid",
		@"RzrPFFQyIMqHfYnEpBiqvhKvAimHiVoBzvuzPswRfEmBiSoMhPXJCnJgBFNLDjBHiejTXpfWaktAUBoomxrczTxxElILLMAKKiibwiZGbBViomGUDkpvJsLABhFC",
		@"QxcOfWsFVbgasQIfOtebcReMFzNCWhwuJkypKQjyqarxedufBoiKumJspCibeSMLIgVHgquLWxahnaDEFNBCroZimmqxuLVdZibaaSlQmzScbcLqUoCaSHCaWXZauINA",
		@"ySgpqXHYqiSbwQgGIVsIGUysNnAfwptrUvXbOwMowsaaoNJAGRLQDCKbebLrAjWIlypWKqgKokrUAgJYkZiXzpqRFExuwIwdrgGsDYWqCeiJNlEXlYAyFOBCjIBeRojKo",
		@"SkpjhcjCoxHuyirjJcSvKjwxyTWYFysWrfYRuMIjfJumrlZUGAPGsAeuzLrkxibyLplGVtdPJZnqqkODWrjHzMCjkiaYcJuVEtGUGoWzBRonpqphnpbYjfUyfSqGnIbQfdxvIBq",
		@"JCOPnhNitjGHpiWjiYwQHkHzGOWVwAVXpJzxbeHjbaryqlCcGCAUJDZdNLfMoFsZCpjLJHWszxeKvhXEFfnFeqFgXYIFbziedhstcAhizbvFzEcilkltzZpqaUEFyKqbMVDUQA",
	];
	return BlIHRinJieZhM;
}

+ (nonnull NSString *)jjGGENAPoX :(nonnull NSDictionary *)oGPyypTZhUkh {
	NSString *OoVTOuYsNqUhQkkWjdG = @"iJMALDYCMqmhXKFmBgSSOJQMwPyxFbyFhSiQOMyyDrckszDVRJKSWIZFCYSlcGLCDbOHVwfInDMtRwTsPIxOyIiryznpWYhyTWlsvyjMdhwvXKmik";
	return OoVTOuYsNqUhQkkWjdG;
}

+ (nonnull UIImage *)rolUkwZZBw :(nonnull NSData *)yKAwymTmUmgoqIe :(nonnull NSString *)rGhWRwAvJOCn {
	NSData *BFtTtAaCnYQaCBJH = [@"RSBhfjXRtPGRzONAMPgCpVRvYWybzoLVNhsehXsycOANHtcUzjJATABUhNnavKNxfjsEadqMRVWgHSjxeTBWqAHKUPouqMuPYVtq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PmRkNRMyTEgp = [UIImage imageWithData:BFtTtAaCnYQaCBJH];
	PmRkNRMyTEgp = [UIImage imageNamed:@"mLyBROyeWsWjYDFkbjZyNeLynqDLihiEGayirtWivcnLjasboalyTiaKTlqoIrFvRatdCXdwXmWGksDBjWikjyaKzvxgzLObGaIbubUPluivZKgYuxS"];
	return PmRkNRMyTEgp;
}

+ (nonnull NSString *)ndEhOQZlJarM :(nonnull NSArray *)OJsfpEcQhtPP {
	NSString *sqZHwtICXCKJqURZPTZ = @"ixekoyZSQrygczLXCkZhrsepbxkeUlcZpEevkzmbXSrxstnHXDEywhMeBjFpqbtMwMTYAlWYLrhTDWZcPSqKZmTIEVkpTSzKVLhOmHLHshhvPgapynEtxUzLHszSvWEGGLoftKBJ";
	return sqZHwtICXCKJqURZPTZ;
}

- (nonnull NSDictionary *)VpxjrbFmGhpZ :(nonnull NSArray *)POxMzGCAGzposECSLE :(nonnull UIImage *)HRpFafHOXncNk {
	NSDictionary *UttOMvljPsRbhSJn = @{
		@"useqSkFTAnMmmIjds": @"BvyoSHcCjnMStmQwwKHJIcJfRdHeVJiRTffFccoJeZhxEHpjJnmwmULSUuoBFAawRVpxHZOFBNinijqOzUsRspNHgcKDevsmbfAifXfAuH",
		@"INNJCgMzri": @"EneCrrUKsGquCftBGLKcTEybkMNQAuvaqYsvDMKVNRlmZTthWanAkrUZgYjIjGRPIZDBCYiiSTzvFiSmjjvkSBXFyjTvfBlqKdKCVCmHJmHZBNDkqxSncXaF",
		@"jRXUyHewRaeroAlKM": @"feYqbOLyrztgaNGCBMnxPyzFdcJIseKDerdjnLSogJpWyXjUdQKvRURtRIvYezxTLpNVygVQniUiRnJKyvyRyNDTixulTmGUujtpYLYACapmJvHXzPfEQ",
		@"cMZVzHYKlvH": @"ugMceKbqzuiQCyeaTgSVTgJxwrBuEbAwgwXNQKIAADbJeLfRsoQtCRlvsDUMwkRZhikMIxZxaSoiHARkjxDrNMjabAFhhaESUfKJNTtaZewHMEASrYHWnzuHaT",
		@"KpSfhvvxkHisfMNmkzL": @"PQAELpIjWKYZomlKpsiZSRsLHehXDPGhHyqArCOBQFkwLrUsGbXhQzCriuHvONlLfnIAJtwTdMkbRDCXWIfTifEKLmtGHfSqJDkckBSlgNosHaYyAoyDBRktjPUhfafTDiKzWrpGAQGqAMfDoZRQ",
		@"MgbyatfYuHFhQzcQEJK": @"tUnJmqKXgfeInzkdseyMAdTANCWAhNUxzxbKAABfmIxIEkighOwKfjXLiiHzoFeSakYyGzNikeQRqAoMnVfSAtqdABjXFNXvEreAygiKktyDzdixLRBai",
		@"eGvgHCxajzUE": @"cmXtXhrenzhMhGciUksBfBEQRYpQSrJLzZMVTBSYdiJNwUOdKllOSLdFQeIJDTUTmqLyOpgUcXPkLUfczNxkrLPoGOONqVvehrGyBTyi",
		@"NkbkrpgbXhDcJamR": @"CcqzxjWFrjIeweDnhKttZrolLYFMPmqUxGnZlplYSZGJYGbDWNpAtGfFkyUHQxHrnWKymeJfRyVvlnMWoObwTxhMHJyYeyjrkeUHjxqnqdbfsvpsucIUFDrqBUQMoTBliRQCWC",
		@"eOJrsssjUllyZU": @"CxnUZSeRFecPvjBaCVTkvxzWZSrMDwDRIDhZyXzDnLAcAXOhBYZBGyEUvkYDHxapEkaaZdsZbEGdkFzYeCvJABUOKBcEFXMTRxrgyxv",
		@"dYqvKUHfujRfMkQU": @"QKIRIqcterguiQIDnDWTyNqYGvZrNusfczfjornNnhpWXVvKvtnTfLHEMRAoUGHFXdfLLhJKpLLYRSRXLwNXIAbwsAYtpypMtnrMgJq",
		@"xYMRrFyUKvatWXCa": @"jAfLkwGHIAOWfSczFkaiBueXgzehDwfLdQTUyzJpqFkWbcThQAobmqeUjSKojYAWOvyIMqTVlpdLSNXEFLxFAlbobuCeicpAYqfGDzydZUWCWkKmAaPafbwIkSVclaUNOJuKlVLLxqfmylXuE",
		@"RQfuGQDwktOZMFck": @"ZWywJmlmguSmLgSEjAebRZupyLCNdnRTiTwbuddpqljtcKIIbhyjBPXMxPFfdFrkDGIQwXdfsUnyDWalPiwRAetAPUJXHNKUqUokezDPqkykGQFakVapzRdeJBSPQbbMbF",
		@"tCJTYUJSragfa": @"fMgqKoxTxnUWLxWFtwcUPYPomJgxXPJkycXhXQldmLpDuVwOtwvcNMrpEAlCyqgFXMYHOemJICqETKlNihjUEzRMhxGtCigSAbsLyFWBAbaaKnyOHVlhjVRcPASIXWlutttCEhdNqiiRFpvB",
		@"FhKbqAwVqlfKlxF": @"hIAcYGPXbCFMpNCqOtpyQSOYvikbNObePfYlSYEYHefajNALxOuvOSdSpvjjvUAojeyIgyfypCDtRZwHiwshoDsAcVgqTGiFFMdkLNUyNDyZxASGRYyBBKZpAjEcblBvLbOjkNKibYNyPRhKvsE",
	};
	return UttOMvljPsRbhSJn;
}

+ (nonnull UIImage *)DWRQrKngEFXNOtI :(nonnull UIImage *)KudaxMvAnvizrpLx {
	NSData *KvfTbbQweKvNSj = [@"DTmaAtxdoGbbKGTKAFaygJpbrcdwYgNWvWSpkUlCDFHkYlPoRZHfJbMVMPApKMoTyxTINydPLUnFEXeavGGTZpyNMKwBUgHMAjnvxeuDLPOvSeAtI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TlCHwFVueMrm = [UIImage imageWithData:KvfTbbQweKvNSj];
	TlCHwFVueMrm = [UIImage imageNamed:@"ysmJtvHSgxnAMZQnGwKrdwQuGnAFvomNBGObxnvaJXOHBGJFJDKckEynojcAhANDNlAQxMdPaJkkYvoYoUAbCZsdSNrgLdlLAFdDOXWbyAvuwGXnskxFoQsDLNZCXFNFiBuSwmACeChlypHjZqE"];
	return TlCHwFVueMrm;
}

- (nonnull NSString *)eeZiWJfyXbaWdJSQYsy :(nonnull UIImage *)FOiCpxyGtneahvUEbf :(nonnull NSString *)xgWdhXYfFjQJLkytyiI {
	NSString *AUjRrcOpzoan = @"bBMMgXzdxlYZqTBwAyAWiWkFTlyiypMtUIObQsCCSCyaPEfwRvqlaqdMWHUaaeLKbKkDgLolhfNLVCnXJLzscsIOJmRlChcTuTebDsHmfYIwRulRpALxIpXs";
	return AUjRrcOpzoan;
}

+ (nonnull NSDictionary *)ZZEQdwhJEPqJFgoBow :(nonnull UIImage *)whJUXPuSMFjFOOVCm :(nonnull NSData *)JtdiqYQXyKmPHb {
	NSDictionary *DwcHvpEPFPrdkKZV = @{
		@"ssyXSYbXSkRubhDMnf": @"CnHOFQEYfgqPvnVFbQaxomBSeVgwCrMRkSynVVQLutvjfjzvGRYjOTPExrGhLjTMHOqcPrlufqMhSMHsfZOghvJEmhEpckMwCHzDQNvhGufmWBhkyKrWkibCHzBGJGsHLBQvdEO",
		@"nsASLUGHpqbrXvGY": @"SfYpBZWZDBeDcrOrtmSBadFnTBHsHEoCauAbLFAGanZBHKVZJhZrAgDBFJlTmiMlyFOtcvmYuLqPMBqDsWmrvLLLwPYyylPxLkvwEy",
		@"qsiglSCYFcPoArHgq": @"aRVoyEPzAyDMttARoQCvHGRQmOjhepaNlRCldSvqgRxJCVjxysQhedlqWjsIRtTdaTHjKDQEjAanLNCywBPFnSSCQkcpvnKZmkzdfeLOlsYzCRkmjkXwrdzFwjQxqjkODIF",
		@"wAKrlftfOWZATTDIP": @"COvNQxKHmTiQVTugEUfqmSzxtEJgMDwPGtFuTuCcLQbAQlTlCBWmOdzeIKLsloTpARwAdJgXWhWDBSmeKdRTxfssLHycyjMvPaOzKmJnSGqlfNMLgBcQtvJMAqvm",
		@"TRuSFWBTnbMdfeslaH": @"sGGPinyrIEaBwGlPtGhDLoritqaApgoqjfCLLzjJLlKwEPOVptyLRccMYjhXXpQrMGdZyEKhDMForBqbwITFJznWEEzlkQXkKRaXVwFAAAFuh",
		@"QHdlDYXAavo": @"QuRwGukTwuhbrKblXHjxQJxouyPWQclEbTsNbznuuIuwCcndgAiannZQmsfYUJeXIfVwBCOTxDAIyIvTKbpdVXFtyJIZfUrEJKEXEukJhfrrNEZCmcaAdOXJkNdNEupcYmn",
		@"UDOKDsPPRW": @"IeariDcUJoqPYQwWgUoOubgbQKslvNOCjhcUdSyUeoGbefWRCZvxuFEYrrNuVLLKCMnDiXeEplnouRXHAoyWPgTOHJLRfXPbTPMtFUrMdSuir",
		@"wAtCoHiIEUU": @"AyPYmhZmArswrvrbywLGCchdiCmidqNAyIndyJFwEgfaLUrjrerjbusCrpTrrujdiadxVGctFtFqguwBsZlZCOlrLEWpDTNIoxlWKxhpdquvKQlHbxLKC",
		@"HQTCOEBOTpGLJ": @"wFwBMlJePvncUfOXebGUIGbkEYwRUZdJJwGewqinmgSOzkyVnCpwjfenkUfKpkTYidNBoapimjOPXcwXPAhkSaNCuAVnJMkvcVxvLXFhOaUimvwpIlfnNkaIfzIXQrjAoIii",
		@"tpFKznxaRiGvUr": @"ylwAEbmRfVltHuXztVgLxjKCZQCLUEijYfXkqBFmLDCPquwZhssAWGhddHgFiZKFMMixshPweGrzYShhYTfYwPMODpQWyEteAgJRrRtmGkOztAJuzRHzpanqKUpQgOsspGYKHKekXqgr",
		@"TeBlODuaIYiVUzVeFOb": @"HBPcZNZIwKegQrEJCuITkqFUZRZcqxgNAonAblGbFOfElAYsmjsGJyqgdWMwuuhUXZHxjWqIgiIErdofPyHfBWiQNcqBYRqMCqyJyETOnhbWtXAmINegfvWbKWxJPR",
		@"TiLfQQcCRXr": @"SyvLtrFQQAuRKmhlTQpnutHdbaOoZqafoWhrKRfoqcKRvNiGjRheAxnZCDkdjxXcGaLdQEiGrlRxQlYlquPbFZlswalnwZKiplVONKbj",
		@"zysqfojciC": @"DXMHVLEZUmwKmlleKqSyOwejvCArGSdeZqDVIOtNIyDJhLNPkKyROjBVuzKIvKEuztJhrnNPgfiEaqIkdfPySWfWEALzVToFVEoBJE",
	};
	return DwcHvpEPFPrdkKZV;
}

+ (nonnull NSData *)pNBMwpYcnL :(nonnull UIImage *)WzVRZxsZQfbSYzwRSJ :(nonnull NSArray *)iWZeTifIVaXKyxXj {
	NSData *PDlnnJEHzXBzVuUbUhg = [@"oFSHPkaanyzXAplKGCfocrPrGXHbHhsolKwPmKrExDVquFPRnIgBozvmTVXFpmGbraYINpjgKThAZgYCvypdqVGyEfEiJtEsumRemtZRKsNgjbudzcxspdTDsIbEltVCLQiZigxYzrmURH" dataUsingEncoding:NSUTF8StringEncoding];
	return PDlnnJEHzXBzVuUbUhg;
}

+ (nonnull NSDictionary *)mlNxkpAqWlRGbSX :(nonnull NSArray *)ohnJqFokWo :(nonnull NSArray *)QOwWBSWWFr {
	NSDictionary *QKTahxIhom = @{
		@"bxwblyJPwiqXWjIrsc": @"PYXgFbhQTDtmtnZropQzvEsiEXhezTeIaIVWjNRcBqRBXArUUEisxVAqxuvmooWhRsYfSOUerrNfhujHmDUgqMXAcqjrHsIYPDtOwGZ",
		@"OcKJPdZRRCG": @"ArJnqnmeqrFEAcxWqwCtDuoNDuKkzqUWPkqiiRGpFzNUhABEZWKBbyWYbJBCQfcqLxGyUrQaFRzarsXghcYUNvtqtacqlaWcCQUNTbYiYsLqF",
		@"kjuvkNgHbZzJe": @"EtReQHxQsCzVKszqdogyEtzBGZYPiuMobcNqLuTkeaEVrGJbaAHDIcsPYEMDUZGbYrNewGADurWczaZxLTfLDfqSmMmlpKVnaYqpDKWORIcUVQXWD",
		@"ChPMYQAenUbwHy": @"ijnqMLIZpaWscGjRwAQQJYBONcGeSjFjxBtJyjQchkTmhGGJHlQcWhSaykKGBrtytcmBYwawuHSsRSenSnmoIRNOMDSujahNdaJsCTkLkFNeaURHKAFhRUOezPvbCnEqox",
		@"aXVwTkgEguDLHHg": @"TVzbVhRaMnjVfKwFatutQDbogzBOnsGKQIovDJnyGThvSaLOHyKNbgsRBTuavFPRFOZTCQmLcDrSGUXBnzgvIxRMzlVzwYtmrRJBjgWEVEYzFtASlwttzUBLJjuDveZSQENLtdVAOoCHTNUYsXh",
		@"atrHknzRdSwMpaQjsy": @"fXUtKAvXQvGjLqTXjdbyhlkVNhDtGZLNpNjgvHTbXJPDifLilcmrVZQFjvJQMJkBXLHZCrnDeVqtqXbAgnFzVCeBiQgASjTlZAlcrIul",
		@"ilbccnvuizKEu": @"JkVkWLgTzByyKBUkAJlJLzPdXPoSDUEieRVEpqnfdoscBrwyDWpjuyRjzvSGWLvLpOEYZinypCFDMBaxRJDcyhlexqLdDgEZXdFQlQyWPIBjAvPEaNoWRfPLIpFGnlYYButWqWVbRblbR",
		@"SJrHyQSEGkFmcVFJ": @"vJiKUjEBdDEHAeIjvTyvKlYqenickMzOmUyhCHVrRtWXTCJTVBtQkCwkOYVMBCZbOSaslswqjCtwvolmGWtEDHzUIIdeShBazqmcBSjjulEQRIZFdbZzJDQznDl",
		@"UDQxwLRPrrrt": @"MuXTNutMRZrYJmGGhMSwgFypoCLObMKBpqwodGbDXBPBOKissrtshGmwXIssysOaoZJkdYdktreoWYUwiKhyvihtEgKJgOgvzMLSRfxasmCyHXE",
		@"WJkdDUZhsPhWRZO": @"wtjqxfDhjFukWiYNGggFdaPYiPMzgmWebabYNHZdchNcfWggMHucjGvqNsiKqZFhzDhZsnmuPBMRJRwslDCNbsEsuXmiNExulTxEvOtWVtLIiYeqwat",
		@"NnRjKrGaNmL": @"kVkRgkhmVsYBnQDDOrtoBVDjAGmcRucIsoamvjFDULHZsaIrTAYOOLYyjdUzNCbYOslacjmziFEUwuegDPtEqFQVoXakRbqemXlJbNiLLtTnv",
		@"UshyvqfXHPuQBTBhke": @"ySbYAmJCDJwIpSPtOYTZwyZFIWlvPAVabUwGSmRqaHDoSaJVxPNIAionBFaFazlgcWjLLeVFDLSroOrgJAPOmHnmmNFgOkdjGVzMfDFqAZGbSnIkjRDzoTVOUHJC",
		@"TfyDkcJBQVqIm": @"nmSTRPsqKXPkqFVlXzOFLVzgLNHFkrgWVJhwssDLmKJblkwQFFmoOPlmrbIZoRlMJzkyZwcZWNKOLNEKAqRQdCLkwgkkdZlwWaDUVPbLoBVNWJuShiyXWIGLcZwPOouO",
		@"PQQwIUzFEnDQHj": @"zSVTFOCtQudxujdreKMmGIeFotLuFfhDaKRfsioxxpXqWepjIISrtrqWbVWEMkuNFYNpTaFSPYPjinthnQWvCxWWvtzybuqSERuuKsHoCLWWAlKcIAzIuhMdyCaoGUcFUzUmjdXliS",
		@"TCCJFUNuCqCVCROdKF": @"cKaiWUxXXLyBncnVOReGFsKestGrwpSehacQDKAGdlohyYOYfvKCkTAwewCgrdolaItHIkmOsWomfCVVESDzOFYNntxJXwkKvjMbAsFQcFHQBEfvQXQLetfsFihPSsBdkDc",
	};
	return QKTahxIhom;
}

- (nonnull UIImage *)loskQhFCKlc :(nonnull NSArray *)lkPLoyXMGCH :(nonnull NSString *)FeOVyJCBFowIpAAq {
	NSData *iTcjHALCmoAeEEernE = [@"JbxKakNKAnskVniJACzfgzyYHAfWywocGwuCJIusnqFWXHQwApptDsKrDBPqGYelaNwmgkvxbfzCJYYmaElHQNyIGcYKBRrglkqYqtAPXmOC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MNUVLOHpqcQfW = [UIImage imageWithData:iTcjHALCmoAeEEernE];
	MNUVLOHpqcQfW = [UIImage imageNamed:@"xUbffHLCqRaoRhXaBLRptMHGbfgdJXBJLoNIJPcTBVpibivmxOfkYXabKtGlCOjKAkKxkgJVjtpWSMlFfswraGwjdcDiAMuPIQLRiLA"];
	return MNUVLOHpqcQfW;
}

+ (nonnull NSData *)TiQBifyHDb :(nonnull NSData *)IrIQjCwplZQQ {
	NSData *rEHbkAwjwhBvH = [@"ZfAzQvzXCFPQcvacERaWFpFybeQReogbUPApIlmPvfKzRpyldpvKYuuftTjVfMzHGkZKbrBWTRGfeWoPymDgdcLQxpFXkQtEyEbjRfVDcywotMOhrytpVXmLkMqeOIAUPYOqJiOaIuWrBLdNiwS" dataUsingEncoding:NSUTF8StringEncoding];
	return rEHbkAwjwhBvH;
}

+ (nonnull NSData *)VyYfGPanllC :(nonnull UIImage *)KjKiUuiyFHdGx :(nonnull NSArray *)RYGdkjhfixh :(nonnull NSArray *)LeDMoAEVelFwBc {
	NSData *wrFIMghofk = [@"mGccuUzaAcRBPfXLFAoKLpEvwgSwsolmMwbtlWvFRkglwnqqxRfArcsWUaWKFsPMVDlSxITJHrDzAuUmSjkUXiKrTNwgTMBQFjZqFwbsIBqtZeiZMJPvCHKNuwUIsjuXZKVkumWBff" dataUsingEncoding:NSUTF8StringEncoding];
	return wrFIMghofk;
}

+ (nonnull NSData *)iHtDaypbGa :(nonnull NSDictionary *)RVvVtBTIyzySf {
	NSData *AyFKiLLremIJxN = [@"UjFxOfBSqDqzSAMHuUlxGmtGOeYilEgAxsPevBOGMbOemCtcCXUpHIJOcyEPbfTYByphVKAZTpNMREXMQHKqDLrtVMXnrpEbjhhUYhXjhNafeiLKDwiSc" dataUsingEncoding:NSUTF8StringEncoding];
	return AyFKiLLremIJxN;
}

- (nonnull NSDictionary *)rTbDJqbbABDWZ :(nonnull NSDictionary *)BWfgHbvPDlh :(nonnull NSString *)MgMjCYlTbMDxgSpnqA :(nonnull NSString *)GqzEzSvwDFO {
	NSDictionary *FQAMrXqPTCBIAgGNwRj = @{
		@"OFSgWVxCPkGcUjyqWc": @"epXsbxcxKkaSFJffwOnMGvjAojFihgmvZwlGjFTuHfRzTHrpSXjNGarsgOWGLzuLRkOIJGvFMGGRgeclMCxVYNDZknQYuDAUciXd",
		@"EsBpHEnZSzy": @"OWcHLTNPlPytlhyIIdNoouDVdciFTMwzhRYKjJaDwwhugGzpKqELbvJuTLWxQMeisCDwHScoOvtEZhMbReLgIyDWHCKrZQonGPHvTzLdNkEQhTkBKzRBnUeRQIXjoCTnHfieeFKYDwNsdkBOSnqO",
		@"ltaSHkVNmtzqHNFyStz": @"WqziCUqNLWMDwipMHNQLzWCGnEIuNuiYMVcxFcfOoYfFpelkMOAlbmfccXomRZvvuMAuNqDDUbrbehGhGvARjnSqwYVBCiKWokJLdXGSKxVNlhytNlVzSUxSaZQozj",
		@"HqKmVsXBFvRVwcIFG": @"hEoKOyuzlblAcpisHirloRONYtqSfhJQoYubRLWpZMmQfglSezPkYvyzWjwxcFrHCqtqkLvKfUSTpyieyJFPHQooHVWHcvcVIermODzJEnW",
		@"PGcKiVWPmUhkLbgZ": @"iqMjgyFOcEbGNovxWiCTInMGRvMSlguofAgHCDdnczWAiJHbKPYLieBepOfanNPWXUBUkbLoGmoDpfyLRCnVOUKqBKHMCMcAGayrF",
		@"JNdMSBxMxosO": @"LkDATIVAiimgmlxPAQzLoexKfClnFAUVKUcTBMbgJdqJdyBecjfsVqApCSfexPSLdGksIsoIkKloqjBQxAkjWjlvgekqtTYcFZKxUZSn",
		@"lTpflZJNtPn": @"IFQLBsDcoSnVRdFDQqksGAzfXlhrBfulTCgYlRgEJykJlDCpfhABnQTnjxBMVnDnOASjErdJnkLQQbeXNrflsgAKjCpKdCsfwkywzBmRAmjwKVQokOEc",
		@"ovbhoZvasNLxHDvKWB": @"oRYzYdOIrZZQiDwbZwrWGyvprtrsRnOohtHiOfZYsUgsZorlxpiwXIUQINemXyITrmJxRsUzmRfYIFoEWybDYzTMYKrZvgfryMBpXgJTpACjlsBaqEVELza",
		@"MgodNYZpOXxGntL": @"ZYqUdLhtdITvIJcYFDKRxQZiqmWYrIcBsXIBlnyYxBiSrkZLKimBxPAngmqwJoojyUZuEbLaZjbPyGNJbNuoEfzLltRhIaOFNHWzrsTbRSKsyzyRVoLKXrvf",
		@"kPswyZzxJeqtieoVpN": @"lHuWGHhSlGTsMMlLufBbJEobsGhrEHrzkIavuWBgTNkSGUERPUbFesTcSaMfLxKimkPNtFYjzdYvcEBbrSGxOJZascqlMqifgqcXGGAaYRwhliomQCKnmCJTzoauVgHbHrpDDIrJEMQshvQ",
		@"GqpZUfTacxqgsaSzb": @"NylYTvxGFHuMjbiXxcuNvoYNlcUhfwBtpOnwnfgAGAozCbeNDivmwozcKVtIfFLrNRtxzNnwJkxTUmLHQwunbnpogWlnYPXJmKVeMbNTBOpilGhbksLQCZDscESxLnbQzUlNIXmZoiwUHzwYAx",
		@"mMIfGJSoTW": @"BeyiRlYLEZqKRsyKFZkcLxDOljPLszvijlgsubjhBDpIyhxMEBBJqEoygznAKRUPtdPmPjioPCWmljEvIpbNiXNvwjqLhElKwdwBBrlMdiTxztuIoiwMrqmgFu",
		@"imqfCLdxHNHnrlI": @"oFkwjKOXTgEHnIJVTiSRUKwMZulgVAaYaImdPfPSfWBUbbnXpYalfmrAjKYFlBOcPHnOzrBcaVFCykMEynATNKmsIbKcdNhQrLTfyAFDoXUMcyUQPIuCppbFhOUrfNgeWeNBUBrmCgvqyqVv",
		@"nyRgVtmcalsSqBuwtF": @"zospTQWNrtCecwFFPDcpXEGskmZVjCeJTMfCgaxjwGxipyJzTEVpRsXoOTXCLijHFFDGBXfVvTSAJLbAhrjJYIMEhuMPmGrQRedipRR",
		@"PPVIDNiylhT": @"ozTQSxkuCIgNJTXxFRcEAtTzGaeZLSqAeWmkbjmdSqVoiXJSfyROTzQAKTwMCGCIqQGDDlKCOPpUByFxyLGJVmXKNwhgMPlHRKRtihKGyaHRGcAfTpGQdVbKVLVBBJwZRnGWlPMpzfX",
		@"mHIIGuKXLvpFUm": @"FgijdtGZOQHxtCTXwfxwUVkBBRibOkRCftyYnoZTetRvvpbrqfDKPpyniKxPMxRqanpgUoYdcLBDCnNXFRmZeJFUMuEumqlrIXNauJviC",
		@"RFgIXyeosiHQ": @"OPvEavgtQvYnrJZPtzozoPqeXsUJoZdkmCHwuSNDftQgzHAxPJKdCSwQmTcAKPfjnuenWonkLBsNOtlrOZUFwozJyaFRlyIOnaXHnzgucuguNVRKYEmbzMMXfTfRteItgRqDQKtV",
		@"qXYycgeCQHgWJMiMCrd": @"OjreXfAjzuwEaqcawuaAwYYFnJRGkEHiPLBmGFaOLMqrfbWmbVtYzKYtTHeoELXGmOCGqQebtcoGyMZWQrISAqKIszJesNMaxrVlIGDqCBLTdyEoKImVFNvOCwgCayi",
	};
	return FQAMrXqPTCBIAgGNwRj;
}

- (nonnull NSDictionary *)ViruRgOCQpXdVqLYjnx :(nonnull UIImage *)KOmuIHBsle :(nonnull NSString *)jLKqiuTrmkdREps {
	NSDictionary *cIZBybQPeZGRnb = @{
		@"kIAHZblOduJzNmt": @"NDqSlddloiDabUMdBNOzYyJXvKsBRxLoCEKUDHuAxnWbmYzrIeIjExgZUSMNHwsJLbQaQDQaBwGrdAyEEFpNRjZbOXKLonNTvgifKuA",
		@"CdozcCMEuzNrmaPlA": @"URcsuOoYlVcxIjReTdEMvoISFoAtMtTGirDihqfgyXeGXGRlFJzPyCKxhwvcoaADwjOIUUauKwMzRqWxWBAwNLwTwVvSqtmVBSPUBbZlLUGgaLwHT",
		@"VmcgvJsPpIgAqmZU": @"xRaVuMmzhiNJeVNlkULbleatZMjJvmexsGJOEnqpZtmaCuSMLUVyfUtQuliOxRcFexSKMFElCWuSdNUNJtAUnZdqCNaaqkLfAksLEPbryHjihRbesrlpNQsTQPYdFhuHfiulQiCKysJkTcdemYfc",
		@"nRWtuXThSnFWSWzlzk": @"BhrdClDpGGpMElOfkhSyCQRKJJQEUzgBzjboiXikeNTErAXtTKTzxpBDGANhwqdeKjrTokZqyNFBceZEgKKIUBREzELZDCvCOOvgxvZcfyGxTKtgclLGSltfFM",
		@"rHaieRkFwkZqUgOe": @"pKpcAgsudDPMmUgUKCqxNIxSamsSxmgdjgueEZDacXlOXlMrvnSlOfdBJTHKqXeMVoOgxswofrcpNZIfPRvzaHoFpYuStLiVPiJyeNWwVgs",
		@"dCWtmRGIShLsfBaAfr": @"SEVPFiqyqpEbyUpiRzZvgtRsUSFzUtAqEyQktaIXKkvrXOhCrdgkrgiyzeQlkkaTJmmEjqxjqttfUEkeFbvUAivNsWSfebniTuDcBkjaKQtTugsYMNSdEFiRVpVReiFe",
		@"tNBgDgfTWnhiBKEZ": @"hxbLncMZUbmbZfVaJwXYfYYjoJEtWNUFdacdKiccZkjPvIEVSIgUITaluyMyGjXSJKfbtmcgeXZKjodZUwLSJVrBszkUzkzSfWFDKuKUWLRGjakniJsZqATHTrbioXCSdMTqrDqXYdOkbrvMqQEzg",
		@"iQzhgDoSHg": @"BqrRMSbooPcOfbAXqkZeCFmUJAGprCgvtpNJJcwqaPHmSIZrqSYYOGUnurYpluMBWBanLKtJDqoGRkbekBfOJtuPjfcybLynmbuZnBKCCYpzzOXYpXezKKgnxShcCslpSlyauDIGWignCCZ",
		@"qOYhtNeprOFwhePCGKe": @"mxxGvlNJoaVhNdNMtyoSclThOVqcGZYyNrgMRJRPMgnZCnKsbEMwlFvslIIirisohokBwxbVbNpFbJYamcmKGyrxkYTKZskzKZyFvJvwGNcfFVyZaW",
		@"nyBRNbcBSmCNAyCDH": @"ipxHmXQqtFbgZZxFDsnrNXDjDFkKrKicEYqkqsXzghzCEmXYmxygbNJjuKKrGknNzsqnDrsZzGlaqGsNEJwBAdmvfYIDhqLmZrttNytGSMgWrtGMF",
		@"yzanSDpUpxz": @"zbEbjHveEzUxFrdPyWjqhZMZCTBWYTQttcekeYueBzAOAeoAlsbUYEONSIqtiKwcUADJdtNlRDmdowbgCTREXpWtmyrVbjcMsgTaxitjLKbHvvCPYhIByTtnQzViOceuEAWqME",
		@"hTFsDorBGcDmqVsIJsv": @"TEKMLSSojrZzrPYLHIvsNcfnNzZDMmmEFJjkuKwAeNZgAfSbkJlwVoPtcMPxTpHPBmxomWeUisIrIPuBqtZOlYcznbgkhajVhaVorvqpuAGuBJRJnDVIdoJjORSIfoHAisetFBPNTxnm",
		@"UiNNQMoFYrrmiLTEWI": @"UNkwFSkfmebmJmzPNLDcrawNnKNDXklPjoAHVdRgBNhprYnBFRbEbsdRbNxwzveQveTSkImreJWQLeAlwnvOkCNiIRvTpzMJJxDQUeMRetCosIxLXgF",
		@"QHqmQhqonuXE": @"IQEjUyxyDXjIBgFDyleALLQtFFVIaNkdSYatSWvguRZsHKVHrQlBTARsnIrgPpQnkURYRyaGjAEWosLtpGNDNXnWUbpdDRxJderARgNISxrcbvOxjKHDZKLcxQRfncjmeI",
		@"fPePadPaSPStZk": @"SwXkcIqNsOkNNLabRVrqairltbRiNJxdNuECFYOPTiBdfKtbcELHMyCPQauYRRIADHfkKFQnlsJCccPJnzUgMRNdisMAMrOKAVBvcMAKqbPbhvFXyIFJMaiPnIcQa",
		@"HLBhsRwJFKZvTg": @"tmPfLkpQKxqWsDgZLqSfbwLLcfGqZxOSKzvmrBKLqpSRQvBqXgesQcSIUMiYuUdUeIKdravEpgyxdVPYpiHLIKKJJQfTRquTCqsjdVyaDQLFbmfKpNCVsJbKX",
		@"SWBTNsgjmPqrMHtIc": @"JpkFvWTiJZuxkSnypJGvdBSKfChsdGacOsSXWnovZrneaFcuoGlROWOyBywpHjEnDFcWjCmWKJtLoLVdvCBWMGsUHYJFZqtoyAAEsDbkjwCztmvSASaEmtJUwMjsytOjoebDXCVDivSngQqh",
		@"PzSSoYfHuCazewLSuU": @"XvBggXCMjYaiRpRARJcCJoJBCTentnEhiLdTbHTUqhCMWWrksPlKyIPgcdybFCnGhGypsJCNjayNzLyaRCsLgmKWhhZkKyNRORhqJvUuykVgvNkjoVTkDDCFEXkJDudCWbEpsL",
	};
	return cIZBybQPeZGRnb;
}

- (nonnull NSArray *)sjGpEOWkrl :(nonnull NSString *)ANZBCaBtUueyOzx {
	NSArray *AygnxjWiRQyQRCXXkO = @[
		@"akNBTAiklEwLaxFZGGILUorOuhqOquDmBXOLcEUFEsHeQmpbTXRzBoSubufCcseuhDnoeaorhkiQduGWbCsvSSeIjJnnGdRzCcJYcXBmP",
		@"eVIyzpmfMwGBRgpvqGibdFNpulzpwprynKsbwpBLcqsrRdLVlUdPcugnVmMKqQzopzVefWAeiEAaKDfaTchYysTqHKrcgtLFyefOUnXlbCxCSRlayERvmOBJhgsBtsUsWnFCYGKiVakZEbVIuVUlg",
		@"gwonsrTGNRndAWvMDQOfdTeKevQPAjxzMSNPwbJZkwYYoBcwpZzScpUiBhQvZfiaGdjySUoCcQuVnAcMSvIqIXiRpuXgaYgVcBsXjQpZZweySmOfEvnfefMCNaWmPfKboXzYLTpUghncsIuafhCY",
		@"ABdLVTNpOIOWpeDgHHPCCJJYtEfxOYwphfBLCbARDSLhfuCqYikWZMBGcbZziMooiHhzoxBFWCZlwWpfCdWKYiMrdMNeOkZPwhbM",
		@"HqzgKVvzZqbMGgCrLztEhUbFAiviRDoUNnULxWUdLESrCDETtEgLbqGEVmYIVHRKjJvIMJWgfdWDezamCdKoTuRAebjuMBmJhrRqfNfWVDTJznGcmXDeRgWncNEIHGaMTZvuRzZKFPlqPNm",
		@"JuUVFaVSTgUCRiwJdOuEjENgwNdCWEAhQFRopknKZThDDWAXdSWLwyrIfJGfikkVDRdoIfPgJLLqrxlhIMQPQCzTEJpgLHOCZdse",
		@"IoHKLUQJojtLpIBtLQEkaXyixcncWLrfkwHOBNqpwfuoYgnQiQMJWzpamgQEMNEArQdDRNANNgOwEpPuqJyMzSbHjYjYYuUQvBhVfqnuxnrifw",
		@"nmzNSoAwzglYInqahGcXwQIpZwTwHNUAClraqCLuNDyvzmANHHyUDZBiaUWiNuxMZSDunLNGwndIlgBLgRvYsseCiKhqjxRBCWKlUWciITugMKDGCFxbMJCOBHqOVLdDfLIKjBtihiJKcnjMt",
		@"fRcdQZGjJaUlXSgfcmWvGlFNqpvokWHvkPcJouhDyemkdDXcRhoiUUlbcKrxGDXnsZrXgNyXuCfsLMDxEKtmLMHfgnAptQxUscBXNamQtdrafKZcZeLtObsvsDqaQfwJUguYmvDFBaSPoHtczoE",
		@"wcfzeOUJyqAJQIEZmiXxyQvjOpSPBFKcdSfySnrvXoUCyBNJKRYnkdomeODDKwAAltfSZooLDyrQhxifMmVYaZAFTnnurTpQgrpoXNiWNq",
		@"vlPZkOJjktskPBCxvvBsrfEtczuPrTVAPvrNgVCvYEHveiObmhTkMJaeSKgntbGvvtiGrHgcFVbFvFWhHTVMoPUEEcvnzRdElaXLEKoLNSgckuBSLlVyHujpSnmQkXfzagKekyCqZTggzwQz",
		@"NNFejifQOXJjvTUTmFzTKOZyvLpkyMbkBoDnytNUroFNStZEubczegpxDLsnVRqKbAfOuoRvHtySMdAJsyZlgcPjLdZorPwcZseK",
	];
	return AygnxjWiRQyQRCXXkO;
}

+ (nonnull UIImage *)xuBQvxuyxwAScqubUK :(nonnull NSDictionary *)PPSDYukKkcaNUcu :(nonnull NSString *)hSrwiunPQXwFD :(nonnull NSArray *)VdNImDwCbvbDOq {
	NSData *GrkNNApHAZkZWNJq = [@"iJzdFgEhdBYseAOtyzTvzXKwquMuHnmIEPnfElPyboshpMOSPdkcIdIMCqyKHpUcbJAMXlbeWEBOQxoNacizGPWlTeeiEqLXAUxhMJfKzGYPTlbpVpzBLIfTieMhrhNWQyHZMldExqxTldPJRZqq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *godtIDNLHv = [UIImage imageWithData:GrkNNApHAZkZWNJq];
	godtIDNLHv = [UIImage imageNamed:@"nzRvjOFnvTnbkZirjttHmDGZQTMVfjVYxpXRdqlioAKWvMkNqFKUJOoUrlIebcSEhFRLEaAhmXWienlgSQIzQhcxcKIpYQuAfWOOtxUJRNaBaFRebJBnE"];
	return godtIDNLHv;
}

- (nonnull NSString *)vkCwZIKWIn :(nonnull NSArray *)raEGjUuRVFvtg :(nonnull NSArray *)JTlsEXIxhYTLdRM {
	NSString *ReCspnDZxzYizGVRL = @"svMXvHivxfFtzcUQYlMfAJJiXVXDYLMEndEIAKUFRIHaqVDTtmbIzpszJBduFdEEfPYawddEgKqcrLLUjVHGMJTfQSYivNPTNGVHBjBZIaRspAXcJiwPRGBQJA";
	return ReCspnDZxzYizGVRL;
}

+ (nonnull NSData *)ftUViqNwQyo :(nonnull NSDictionary *)juKvRloDWoM {
	NSData *uedfSjKBSWmnE = [@"vEWgHQwJsVpFLYBWREHiMAVGxdnEHCOiHYEnkAuxMLGTQmpLgRWouLzEJvKfRdYUiwdGCHyvREucgJIUWvuiJSnRTexdMpOaBfgQToUBthzD" dataUsingEncoding:NSUTF8StringEncoding];
	return uedfSjKBSWmnE;
}

- (nonnull NSData *)BtnWPKHAEqo :(nonnull NSString *)ETqBkLjYMEEkwrKe :(nonnull NSData *)SLrrkOzchcqLdeuZDpu {
	NSData *sGnlhXBAFPSw = [@"EEFrRfGZPIlLZLXNyiBdwcqYKODSTshfisZftGvGGhRxZkRFOziBLVtGuLeGFxvHGMACGRLPuPbrHkQdAbaovAfsoRBbNhfhuEixMlCVLKrijzwlZRTYxfKjbhV" dataUsingEncoding:NSUTF8StringEncoding];
	return sGnlhXBAFPSw;
}

- (nonnull NSString *)vSWYwLRtQTjzIOxWm :(nonnull NSString *)tYRBDJrHfPRPAp :(nonnull UIImage *)YvElxyPaREBTjzCKv {
	NSString *JdAIGXMgMVtRBI = @"vrJeiIXBuxDRbFfybggdHyVxdpTbQggLujQDAjBveUBGKtqMeLjLJhuCXdBZMAXXCxYlMImSjFySTwoSSvhqdIFOJwQRZFRKiFnxNprwoNBtbwxgHerVuoxakjDaimqnaRmBVvIL";
	return JdAIGXMgMVtRBI;
}

+ (nonnull NSDictionary *)vlvgUogVWPgZ :(nonnull NSDictionary *)OkDDlvSsuuT {
	NSDictionary *jwnrOIYVfN = @{
		@"PzWhcrWzSfwT": @"wAbGnKJXkKaPLwLKZTfNIvgsyDWtBZSKpXKSFagMeDcuwFIesChVhNJGaobGZTMCfiRsYseRBTaLlxDfJRCvqCZVqwobNUNvkFXLyxSWirvr",
		@"qsjdCVSEYdprqtJxaBH": @"krkQKYEeWWAbGzbgOEAfpDmIeuhkfRCWOhdFIrDqtVqeVWcNSzGIhikEDUCPdCBameNSoCvcGLNUtaDXJpMtUOUrxtVSDXGTXuygBJZxFtTTbKPeCyYMVaWMMMONSKAnAOADep",
		@"EJoCGMKtru": @"JrqSpFMNOZLfLCaFBVMefyPGSKFZNiUcjkNdZHZIumONIOsuSGDKYhiNJCFqgClZddHtmOSoZdunSiNySCBvxOeQGJjMyjfieeoxgKVAGyhpjWZMsRw",
		@"SvVRahHJiZgHjfQTyNY": @"ZPrTXLTYWDoydACONHOKwkGOmKgQnkSTozTaJhWqhQgedeQoiVAVbsDsVGrEjznOKdITEtGqYqvSMvfALIcllvWXUrRfpTvqSvAeVDtGS",
		@"rwqTDcUXmdu": @"FartnqMKBbsykOTKMEcpTilBUTvUxePpVJXKJoKBTHqZuxDPjvJaDlmKmiHZtxoFqpKQuzFRVvUeySueZQpLAAhtEPWyrEDJqsSbLRMj",
		@"tGoRPNYsftKlvjZxUe": @"FwfttMDBaZkkJslrrtpReVdADgRLvkTLIhhERufFZLEqjLUfOPNsGHopBMjntDEqiRAxeeJcGyCtvYdlDGZFbjLusiztMHxRvKhLdoUBKpPWfIwYYRrTlqBPZsZBKdaQYOQHKikoSpnBU",
		@"kXGrjphQIAzssTcrOJV": @"FItUVDAndkuXrpGQgLnsuMHrxSjOEUupLwlLkmQTUSjSjGZaCLbKxrgdzuCrKLRKcUmjjJiAdsDMetRydLouiHnvLuAgfdFpHSNVpruIHLsvarkKNvtDrnSqTuMnNScIBGPfUkqPFndkqZuoCrCbr",
		@"QMhoUzDzrUsux": @"OtosHvYakiJGHcOXasRDHbDfZjsDkRairEmoNLECnyfovZljXbVULONfiepcgkoKTJFqejsJjYcwfXbKHzSKZvormixuYkRymQUUvjhRTagLOCvuxILGT",
		@"sSiXmEJgdwlWohPh": @"cjPulqfOkYhbFDZoWANrWyQpueDJBhMOflMbykHWwUKDSPxBJYFHkttTJkPrSIEaXAIacsfbdlsQxsFBriJOZyZZgOLwToOysRxUyFfkbtwBfgfUqSomezuhRVNWK",
		@"uvzKfTRjBeyM": @"ZhmplWkwZGKCeQsdficmmUTShnlkVVDxDtNMrYWYMdJMrwsaYSFhczPrOOiByxqZmNqdFvMPHjIfzeOAEgGkFpbrQEoeVuRtvqAltfOClWSDydbVcByNYPQjWVhjnpujKKP",
		@"SEozNBsjLODK": @"cJxXbLLsRqHjLDKODiHnbOQlDacwQKsEaOLsNrWsEUiaKPKFNlEVJvNWICTkJjNkSlnexlwEHTcOlnixFGopDxBVKmAMPTHiwNAOfRmNynoTPEfWhhsKxLfCFinjnIsCZeMAPYYIFiJkBtCsMo",
		@"LUpyOBxrFezl": @"JcJSNUxzNdwBSjMvOEEAMddBgHIwJSTaZqUbAhcraVPlMTOARgXhQCLiesSdbAaMejFbFFZsFaNDYbTRYFPiOAGMnwrMMipIZFJEwYbOtxUvnBQCc",
		@"OzRkLGogeuNioc": @"RSPsduIrUsweYbNIQJnpPDwngsbiMkyzELrSzBHJcfyfjJvDgfzqlGnFxMFYyPHWAeJqzWRABXHqSYlnqgcsdpjJTbNHecSTenRMExtmbrhCajCtcUfbARclBIiOlqU",
		@"cZvwUGeeKkIqGsSgJQ": @"jEcRwEdXytxFFdENnvZygivJJUkmiSdFzQtqVnroLvQedvLmjfLfIrCIoLfFTjaDwVlLPIPvmVDIUHMeZybfzVfMmpydVqUMdKhbSbkJulGfcHbwhuCoynGUaLSSeLSlfdAEKasD",
		@"bLMOJoKdNdy": @"adkojSdJzeRTxacvwDkPUlPZqqdVjqGhUmfxVyQNgFxERikamQbgACxqnFcDZYYCMsVOBihkbQtLLhCcDlWQltBulOuXYJfutRWgirwhdOYVtUGWOqlaBrMNQIyIc",
		@"BKnFSWiTqYF": @"IbXtkGbOsNqGwiOPFHNhfLVJlInHcUhMaUJFezwgupuSnOELKWxLGIYYGqslyawHRjpVIgQtarFfpZrMHxRPUtJKKgtLpnRoTffilFqMsPEPjtAJTMfFBmNtDysJbCS",
	};
	return jwnrOIYVfN;
}

+ (nonnull NSDictionary *)KZjVlqEZyhavUhcTQ :(nonnull NSArray *)raTfSeEtasu :(nonnull NSArray *)RhYfouuThHoo :(nonnull NSData *)sIlZjEACAYXBvy {
	NSDictionary *dPvgmVozlFfPVp = @{
		@"dPlQuLQMVXbyVzwDDv": @"iZXJeImwYBpNaLIgegNSbSJVEAVTrjRfJdYgkKtVjUFMZFUlpOdUSlDqDNWGRNWHhdEfLmkuedKEHQBujKLTsnPhoQuzDZtNConsfpSKQzoaqZQwMIJVyujSmbiLLCTFSjSLtvgmzTe",
		@"lTpkhKznKWxNDS": @"QqVmcaUzqmGjIxMUeOnDohrUzBzoQrRImDfHRHWsgelcglqHnZwjkbViXqemorkquqwcUPmGPWDeliKfJQqIYvjsKEusXpwaIDLBsvknDTxWIRZCCLYq",
		@"jDXcIfVVFdCNi": @"NSpCYEKxJNQdeOsHsIrOGGRfzvlJRBHtxFASoMxZmNnPCVqdwsYfljqUxYzcaqhMYJohNlSIqcdTPVxzEZmfhAhzqPxaCgZrGCmYciQUXGrsiCbw",
		@"eJhPUSTcrZHrm": @"YQGObPgLaFuOIGQVAtigItxgxpxDhSxKNremzQwFqICYWOIldEqhgiqphyjOCBHGEuuVuYJWovpZDqsyccIaWeGtGzrSPzFRKoHijUxVMfuRYOnusGIxeNqg",
		@"LgrOCicPlSDfmpII": @"uZaLXnXpKxvrNPGDdihMOdeamXRhNVlgNxaMRVvzGtCstbvAnSKNUTqCmWeTyoUeiFTGeMoBXVjmQdbCtuyXPpQUqhkVdlINUqcjmvFlIeHtwSnCtUiomIvBlZWVKRzpI",
		@"hYocnqknGun": @"WCBchfWSGjntLAEgIVOPazfWNynAkfSaTgapNfkYnnhpZtWLOwxeOBlrYaLdtJVYURQURZebiQvQObIOtshqskngoYjvEnCUUeYRIPBtTjYQpMBSdrr",
		@"ejjQvJGvzaeojNrcDhF": @"porhVfpItAgGNgGtwCTjOkiXSaadEqTOrlAWnwvcgiaDONpWmeQaWBtlwuwaXByMhQWNpUbKQqnADKhkxCbejjnpDtPIwskMwFhLydVMaduiCRlzuoeMKUKAGTlETrw",
		@"BhDOhhpFKDpFuVJZAu": @"PLDcnRLHiTCRCYwIlgvixUwmMHpnLqhIWpnRCSWAEurRwoqffBzTHtfUOHGyrgvXLeWbDWkFwfsqoUGrsQxByxjoJSEMVrpzWTtyiMoTDdCgInq",
		@"sGybNSoPgnZK": @"mLysIJcOSTrkDicjLLZawMaOlPreMbNmDeXjqGmkWzvKedzMoioEOmNRMPbbbMrYlXisecegWJAIynACVvpOZcWtTtQNmmVMwuULRmYSBEJYzSMnNJcOVAKOqwQgsvNsfXqm",
		@"oRpxLsFNiQO": @"fVAmSTTKdjIUnKBeHmCuFIKnJpbSWBjKPIUDlqjNJCUnuXfCvImuVKKFCDCDBHbicCUNCypOqymFlcaqKidWLveWBYqeGXuzGpcfEWAaboUunOuHZOtztbucArAUoC",
		@"XylYEXHDFoEGdvTx": @"NXDOJNTpkTiGGLARXOdaSvsaezPzZUMccXDHawJjsLfjGeWsEXvcOrjUAthxuQVIwZmSQWQbNFLJSmEbnpdGhdiWzMEaUOsOaOtQywGNAkmFLKuxvMiXUsMBldAdrVAoxHQinB",
		@"uDzcmUVtOsaM": @"EqdvHbLHyfRPdGYHQOzJjkNmKAYqMjdufKCkmSPYdcxZVTSPZiYquXupayVyxJfjPAchFelERGHeHVueXlZHZuhnXBSeoxGmGlKxnHUAvIRMf",
		@"VgxuUYGWuXhg": @"RWrjKjdbpjJavBwCzbbtOBIPxAuorUwsRIZuCVbuwLKyaKcTDFROBikHzZozvcRuKMHAjcvcVcrUgCcgqJJYSmXlguInrWPaazzrYrIGjsuXuUkKXDITPncTDkxUgXdipAqllsdHunnKfsmQBpG",
		@"IzbkUrhUnGqVQi": @"RXBpQwEZBiNoxuNBvEAhHoSeLiAhBtSEzlEFdywHOeruiNHaYmeNDiCUexIJaYxjgRwCeefPFSqgiacYZluBsfuEevIMrRZrTXcygiHFwUiOTDtCw",
		@"nULvxCdHUFcYLYC": @"sXxveZYGYGnhZBeZeFuHKMPFEqbEzrJBbPUADjHVHYOHltSrILKWqWpYfgQgdWrLbtzmfDGQOBbWHKxwflKCudVLMhVCSFhlsJlrsdwjPXwMtrpEFWQqXCZCcDxunt",
	};
	return dPvgmVozlFfPVp;
}

+ (nonnull NSString *)WSEWAdFSOSRkAwQeykY :(nonnull NSArray *)UlyjmQbmnCI {
	NSString *zFNNpgYQqFtAq = @"DnzDcpleoJYxTvXDfDHsNXrkZrKfreFYzhfugnhhfZpxfuRbCyrWaMTPDhjqAPTrcGiiDmCVyjKtVWYusYXYYMUPgnYPotZYurhCwITJHTniYrmJXrOHRgVNi";
	return zFNNpgYQqFtAq;
}

- (nonnull UIImage *)FpWBnobeILRvw :(nonnull NSString *)xytzrbDmopFaInhSBU :(nonnull UIImage *)gDineKsBNpknYgBJ :(nonnull NSArray *)RBVdmRysaulgsOa {
	NSData *QZpvmnakID = [@"YOWbMmlWjuIfSscnrLNjwXGjMJArMVgRiiUhVcDrTnmnpHlVSJXXuyedTPJuCtanFZHkUWvYwVIHOQMnkLksZZGoEOUPUeaURJKAwngCXHvju" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pjPuXPlQsTuz = [UIImage imageWithData:QZpvmnakID];
	pjPuXPlQsTuz = [UIImage imageNamed:@"xnFXSLTyPKCDCzRkQvPfresshRuFFiVBRGacNuaHXeWfrOjlxaPEuCINKyHGjmPEhqppfQikRPuyEtvuSzmJCTVdcmcPWHBbUBhkrILLuhIuVCEwbzXXrVuFndPsjbmSTaOgmqzP"];
	return pjPuXPlQsTuz;
}

+ (nonnull NSDictionary *)OEIIIwwiRFVtldCy :(nonnull NSData *)UFEvowAkLg :(nonnull UIImage *)rqbfWmQNWhbn :(nonnull NSString *)UbTFIBpuvgDKb {
	NSDictionary *CKmaBBGlFRXpdIqWQVS = @{
		@"WleDZWODOSzWbu": @"zoCtIkUNrDRDgcleunrlFrjSYTaNVFrSIevDCipESisNKBkrSMZzMWkXscFaYnisnOgwcnKCPPNgZKFxrkaNLYVIwVAbLRUUYTKoXJlYYsM",
		@"BoJCfUsAmR": @"rIFijTrspjMoSobUTFWZBDqTXBLKeAfsuOXPJSmtQgtzdpWFwzzLUlsEwUIMdbFgAIuBFHxEPdVTgUdANwLPstwzPVdjBWcwtmoqFfXTpQguQHZ",
		@"UpdgMserSkNGK": @"RwQuBZRAtnbEaeDNhPFURhpNWQDTuwOdbDTFgrtzKeceInOTKLyRkDPbOZXGePeiDBEPUIRTBjIADatyqbjkkAxYsiGKKMgxrMzPmgRuJytRoGbevQu",
		@"uQmMkwMNqwiiDeW": @"AcMUfGiolDiKbipemcGCdpqDdFdjIBwRMWEacPQPEqlDxRxKpSicFjrwArCSzeoNqwqOvMuodEbOHShXlvGKkgEOgiOvICvHRPoKniaYvFKijlYMyWanUZhoCRqxqrmyIhyxhLWqrFKUQXGTd",
		@"MxlSgmVWoITXEjvni": @"NSOQjNYhdXRBekNlgGTfdLDqFdbEJCAoZFzWgRnCLCdUwGwfSczImNTgccmasqDgUmuFkwmePLNlpAvzYkHWXqhKZislsboYTCIHWimPcyeXwbAdSyisFQhgUuAVTOPkUUdyxfa",
		@"MuVnnTRFhUnk": @"cKNIGZoeveaCXdvsHmhWpnWzmgjjYFfOqdaktIKjgCegahkhAROCDyCgxWJfWMfyDOsvyLbRzTdyciNVQqJeHifFILCMWhPtdxAlABhzjuGMNunveRwHNvvBVyTHHgCghZDtvDCI",
		@"QjXqHfQTakBBpI": @"ErGWZYEUBXmZRhvjgYoiUfinwRCaXtsIrwFbgSRrvwWmYuVzxlZAoMoZbCzwRGxufQKqZcRrLupuTwolwSRHwuaNtLScLtymNCnKkunEnQcUsqCRvpmEjgXIuLKYZImzNwxQHcTvgbe",
		@"LBNUDxbZbLuaOJh": @"gmPQBIShoPolXFyaOLnwNKjbKZVWCoZSVvmTGkZXprhpvbzDLzuDfrmeKsnowvijdAxldVjjVZXPzkQxfBxssLOlIFkLNZxrcOmfanxFoDxYIGtKIHWkpJWIfdkotLb",
		@"DGoqszrmeSz": @"vlADWtesFyfpdusDesTAGZfxsxIxZTipJzzaJpfnZwxobrodoVGhWAoMfPiuBPHhJbXEcxGlXqZXayYzbdEDeOUmfrwbOvInCiOifzgWxOYcAozycFKXEumEAIYNdwrWeEXGPnUvT",
		@"eDgdMsFaCZAMddxFR": @"yogrBXvETCLdxCITuSDDxHSsiUAshNLnbwdlKvlHgtJaLKEcdMBKEGzvVLPgUdOJqeHTaxjXoPhzMpMfVnVUkRGuAbYVHeYIRYGeQIeFWViktZFTSu",
		@"JzHtTUVlrOeOekpBmo": @"tIgDmZQVUGAurObBDXTwujIhApjKMGoRhGAUSgLdkEJTrgOujJzvTSEdpkZcmdOrlkJlLowSZQMVEmVjPHJfQYDdbrazaZDVwayRtGRHFiVEfTXOnMTnGnBivUbEtVLlziZEKInRM",
		@"lMiUJdWCETC": @"WjVQIhyvUJQqosHQMLjEOBXrrAUuQbJexUUyzcIQwgrSDidcZTdyIuJJqnKcXAUsMaabXKYHfRiilJCAUWEmKEzblOxtSDowmkBheZGnybKFJaeBEvOvLSOswXexQMy",
		@"pdzvttzybuumLcpqU": @"YfweRXCTRKXpWCkivPScdlZcAKpYAGdzdEbqFYdmhNqWVbJYtcRaYhpmJYkBniMcHALFSUzHHLPOSAGvQhUpPcJInjITGHNBGSUfatILNVScOqecoOlzjyBjRWOihaSx",
		@"iCBNFhGayI": @"rhxuPHgSHWMxkdOWYASsrwhiqPkcRSZYOsRUvqEVdOIVujnIGiWeUcvcuHrwLXIVbOWDBOoGoonQqAdMdeTrmDlassuntsFqsCqyMhTIBRoKGjtrbW",
		@"ivsVzwZjQiO": @"dCcvaZjJQprPQOhfacIHjdszbhwStEnHJfdYLtgBlBkHXtrqOuqlMApUNFAVHxNovgpcuKAQKLgzIEqxoCtAMpxaCGTYSjFiYBXTDqPjsabNcRCXQvvwxhTcZAwjkURsODYoII",
	};
	return CKmaBBGlFRXpdIqWQVS;
}

- (nonnull NSDictionary *)mbVclTrLSMTjr :(nonnull NSString *)PybtfsDkBKmgJmGfmrg :(nonnull NSArray *)lBJNsKLwLDbWYfbH {
	NSDictionary *LvamNAommnSRuwygN = @{
		@"XNhbOjuGqkEMMmUUJ": @"JoTOjHJCHZiPfSugqexURxJCDjpMCzmGZYimlzFmEWlegvEKlcOnSlRukYXLAQQrDcIyVsKeoZUUDIaRKKzWUgypNNsihPgCJszjtSzsOolnjYIYYBicjzsujpVptpzVGaRgZQTNDMJ",
		@"uwlwUuuUduafcB": @"xhmHJVewQSogrmZEyhSxeCkOissOysFZXbQhcMyQGVKCpqQcfhyKVeyeaZqJtNTkYhtFFHKKBIyxDFHbVcygnyFtBPflvPGzUGmSpgkfGidnPlexmmAUucpwSNBpIe",
		@"LYMarZEOxvzk": @"VIvtpDGOBwVpSLmWBPCHcKIFaQGduVdiULeQpmvXGgGXoFhLiGALPASjMJSRwXlOXydLkZVeLrtGNGudLpNECIiyxJRMLwaTScnLjkXFAhgcdmWouMFbZhVxqoIHfKEw",
		@"PKkKGiXcCsfFqn": @"JInTCIGvPLgWKjPELoDBjUuRnggiZlXPpezlATUVikSUiIXtGIrGKAYgStnpbrhbalndbvuKfqPhHLZyIPPNvjDbUmlxiiioCNpimXBPiqxAfOjsAnOdyXEXWZErrsvaUlwJAAIsUluL",
		@"tCbNpNSuRsuoJiiMDE": @"NiGielxFUWgdrWcWEBdLQyAKqTBfvWZOvODCbqiQiGRkEMzIalQzExVkSzpYaxoUxRInHqTnFIXoGWuAyAlaJcWZCXNHwlIqpZVIj",
		@"popQTwUiLrSYDIqVGnE": @"eozWkVmNhMFOucscOrgDefgNjmaOjxLKOswHigLwdbvbPzUoAUUiffGmEqbzRQJjbwhFbLVAwaWuzxtpkGmjvJiEKslBwjuphZvRuUucavjFnSBMyGyVIyjmvCkyUePsnKDEYAnoyXgzYNnEl",
		@"FDvAQDBtpnnmsicIyQs": @"KfsZMeNVNoksJOhWxjKrQcMndiMufrPGeRejdFZCmmcDKCLcHSzIroKuCwjIZRfWxNpyagTSLQjtBHjGeVkgwcDxgAsHnTmtDoYBxpHgUPjRVtZwxyrbqslqZAVbKyQpDdzRdJkMouZK",
		@"ezBrzWICnX": @"NEQPLlraAuoivzJrmFFcqIRqZlghfJFaDXmKQpZFplCqYUNKMMEdbUVmGswZxjnSCOrcSHEOFQtKvGjByuSjvLNbzMIcDytfCHHwzfGcvai",
		@"uskuXawRFQaBFw": @"joGVbeBzBViURYPdFQVWnyXuWJxSiNCWkZeHJasNbCcgwTynWvPdDoUVlcYAvgutLQymxCPoGElzvMmZSNGAaNAXWqoRoYHoDvZxMsSxALIRcnakKPSi",
		@"rAQllcvzFHhVMs": @"aaJbIbJdUIaPkjGiwAZMGWWrihrcNEIwSJORIDZUDLnoiyhVToozWXWltyjVvUqHjnwPJkFruMPByCrGWQkPinLXIANAyveqlBETgNxYCIOodmnkPWrTJhXqZwtOekaHCCFUlFJVjBxeYCmOXQnTZ",
	};
	return LvamNAommnSRuwygN;
}

- (nonnull NSData *)haIsiscugn :(nonnull UIImage *)pnMIVZyXgJkJeZUFYNf :(nonnull UIImage *)RBOffvwjlIhoxPvYpd {
	NSData *bIaCCKDuuMs = [@"oSIpSrWjEWLkPKuvMJHjEnQrgaabAmintmmYFrVxFpgqgNlnLWzMWYadDpmTXutppppNIkOasToLHYohIsHSuZWcOAHBcwPywVmRwywHzXpJCcOBvpsJZelbdAvplNRTcna" dataUsingEncoding:NSUTF8StringEncoding];
	return bIaCCKDuuMs;
}

- (nonnull NSData *)GJZzyeTkfsSUYKsWzpw :(nonnull NSDictionary *)YbQAoBeKYCXDUZZGVF {
	NSData *NWPQSLywquKEC = [@"UETetjUsPrAFwBnnknsodYmcrmuyIfcBqBFDqwJcUOHDmvkoPjRneDfSqvEWxRfbpMRjEEavyFqvmziXKYFEFeBYqhQXBFvaJGTvoVpqwReIxEjzQIYPPeBjvIkVCwyIp" dataUsingEncoding:NSUTF8StringEncoding];
	return NWPQSLywquKEC;
}

- (nonnull NSArray *)ZYSKqiCJcVkfsDmGhf :(nonnull NSDictionary *)YMzNbbzvIRGBd :(nonnull NSDictionary *)PyIvGZXauYlu :(nonnull UIImage *)LkyhJqSrTXItPvG {
	NSArray *DRlEeslWcBT = @[
		@"SRQQdQCzPcUzyUGtrRnaQHMUANBEPBpApifsUOsIKmyUbPyoSNPuXCXagqwfTmjBjKrtUDjWiOnQneRGIpBhTZnbXcgjrmFUUhNqWhRvHKAqjkmlqeGEu",
		@"qFCMLKQrhjiyWYvLdOkiKmIpwifKsLPdlTyRrjYwsaaIpejNhJvQNRwPyHsfGaWcLQjWxsSGKuSYbBVlLaGOxiScUbggqVbFrauZzYyxZZeNKNNZYeZIpcKWcioT",
		@"nupVmBHQiPMUyxQerTdaufiUEQrFTvVsACKwPgLPoTzmXeuCuDcyLrzElYjHTPBILxKRQqbmqkXoerPJGPAePBlLioQfsyrALfpjvcmEkuhzQjzrYjsCATUvYzkYeKiZQjBJGliCKWHeqAbJyoDHf",
		@"pqgcHhGlHTPBKyHUuNyNpooXEbYuSauvVlIxvmZuetpQDPDqiVXhdOOqlNpApcZWDLYmXcZmZsRNrqsmyMJDtyAHcTYZugmELoQQzuQsfOKiRUCYHFLmAxzbqikPuZuaqgqqluGoFeGNS",
		@"fDlfhETmoOJwpEMdCqxMiKLHmEXeMHyDkvsqvDjCGzKVmaHgreBGsrZcgpbFtporhxVSIqXpGQVFdhXWZpDpzBhoHPcRarmwnGyLHqlAhjZnsWvCyxvwSkvIDZsy",
		@"VdleotgyAkSodDuSMTbcFWcPMntXhNtREKGyQJohBhPlNcElFuQowkUKLJkRpnVTlxltwWpqXOSXxdmgOXOGBbZwREIeTzIjpTvVPEvBwNTviOnpuVaqziUjotzZyejkDByJxUXBUtuCdvhw",
		@"vavugJTiYqAbyhinrdYLitMPyWJDRLUUPpqwYzXbAiJsxgmHjtzzmotvlKjSLpYwjFlgENipEadSuryxxvpysDVJJUTUizGtZdRZSLPCBWRRUodKOfJFAkAUkYwyeOWJ",
		@"uvzkEIsSRphTiaKeXxlhDRobqUhhshlhFwrzFwdYQfcLhwlagAGNhxVrjiYRWPQifwxeyxzNeqNXoQGYKThrrlEssyZVKajgtXTgjmArMBmcQfRizpJIZylFWREagYL",
		@"JxYKEECgKmtZlFPadovFUYWJsxksFjGmBZiYdHVzTWCEKyBQkekToOiYHjknGiiioiFqyejhciLBYNrBldvyvmMoqBfYdudBaEiYXTLrAPI",
		@"ooSPpoNugemkuoexPAQiGupoNhuDRwYeQWCZWnHErBxKAXNPoSgIXtUpuBkVlXVheLRcAMjqSTjCnrwsxNYIGvBZtjnKaKAmWzLUVMFJbtgrcZWPPW",
		@"GFOrOQCvKjtdRUSSLpNlYDTpXpfzQJbiMQXIURTCLNneeYwzBHsmsMqBnZPPfrkKOgOyRLoHONuoFRFyzvKhoxLwdTCNkvJcAmgHrzogZgNUAGNwGENyNIjKfUuZcozMOyANicZfrNlQYz",
		@"SGVAlJaXqwcMzprbFUikERDCuwcEebulLaAvjaCsCalFuexCwXbfbclblaUdUdQfwzlKBTEWUyLScHiCAJPTcAIjEzdZPKXsoCNanIiGnUybKSMDSyKjAqfZoipXKmYNnptYnS",
		@"LbWRABYaOUJCPkYqmyqZPBhSjzVNhoftblaZdBDifVhEQACNLoMpaGQPHDwXJyMCamFnsAKBQIvRixhxRFrKweJDYiXIdPvVCyauzxYrHKH",
		@"pgmGDUPVIVgWDDzeIwUtZFzBirTzyyBYcGRVggOqkQRdUnmQiafqdwbVbZKMmqbPfyHZGBrebXtWvvuFuDevRsJgUDaqIYpyXGfNaTUdLxJORYoflfruSVHBCXZSsqRSeGLaevXdZynDX",
		@"qAAptOhwKNdDnwUAQVeTHSDfjFxawsufHOPQxglaXPOmPOVdqUQBqxOtOhzOyXTOCdZgfIebnstwMvHwatubbkZtQNsMFZqMbdgwEvWxfLeGWZBSEWREqKZumSRZZJThWPaLjtmJchlyKL",
		@"LxEHgSapCNvMMvSrUnaONFNYVHAxApwPkDqyLEPGDbdXhoklSPwOfOrEAtDNatueYqDpDjomrILvBeZqkuyCKFeaRHAzzUaYEZiDiEYoIxmwGxsgbRBDbQVnQcIDsOKDFduBvcuHfUiCA",
		@"OThFYlqFNELrdWgkWXnidHXgYHywROLUQukfAHXwUBDsKBuEimGDNoLqpZqsnyEcJjxwiENsyoYkozMdYRfrPoBfuwvhiqFBPKxAcvtMw",
	];
	return DRlEeslWcBT;
}

- (nonnull NSData *)MttgTBLWHLhtx :(nonnull NSData *)OLfjGxTtanVibL :(nonnull UIImage *)vZyGejksqfmz :(nonnull NSString *)UKimDJDWvdxwfyxiYY {
	NSData *AIudBhrEPsDJHFIu = [@"FFqRLZhBLYDBVjFLzmpChGrnqrdoqhDJSBuJdUazBhqsjZbxOxkdhGsPjpRzlzjDptcdyQyimYeMHLVipBJaEhEWPrQCRZhqXXDrQgSBz" dataUsingEncoding:NSUTF8StringEncoding];
	return AIudBhrEPsDJHFIu;
}

+ (nonnull NSString *)gzBGkCpYnd :(nonnull NSArray *)xlpCKITgCgpAHMyeyHS {
	NSString *vhGPszRHbNKkP = @"edJEXGEqxskmTwkapwHHqBQWsNCDQroTbgjhulPnOGgcZrhyDJCvUZDsKppqbgMdwvtXgeBsOLXTSxwdrimbIXRnJcMaWeunFMNGOoi";
	return vhGPszRHbNKkP;
}

+ (nonnull NSArray *)JGwoLmIuuZLlhsPR :(nonnull NSArray *)WtnIECzpxMCrNrWS :(nonnull NSString *)qRMcSKLsUqldgrar :(nonnull NSData *)XrOlQbhRSbLsqIm {
	NSArray *KtVhmtAAgbMAg = @[
		@"skKPaYhphBCuDFmythgfjoYGmXaszziGQjgYoZQXdVWRYQiQWxNZxGxkwbFyFjJfLPiitLokyBcmpADdUeBGKRmXVuZcnAGWLSgeuqdtoeYFtpQHBBkktiOexWupHjuLZPDaA",
		@"wysnCFHfAFWHdYatudNmbQRkpBOAKXTkADgjvFWGZRaxCkLSisIczFoQEvwyzesJatPLiaUZWNIdUwZjQXDEUNbIphnaKtIxOofAdQaxHCzFGcKkHaGBkmlQlqbsBVwQYEEmAqVhcWgsJiiEsHJBq",
		@"xvQdFZYuTgWiCnlcbVcCCGZojYhaLDFhWuxfiKUvKnSIypEVQmoScGPhjbuNNrPPFmUFQXeeQLPVaAvDiBBmdPxAEIVYvvjBButzitOpaKqVbhWkUo",
		@"gtsQiaDXylGPHnhcwAgFegYYbEoxPtvuLMxygnXJxqqyeQVNyupGAgOEFZYHKvrEFuxbhaddPoMUWXfsskAUqqBSKkuvbuRjbYOsjiERWMTfPmPnpUJRtuPwZkzRxTpGnWTBjbPYs",
		@"DkcvxyElijdmgRfjXPBKmKwfAnieZTkZKWOMqCPUNeKYavQjSmYPsEWhtxskJdbbwrFmWuJhbClHDRGLdzwMtirXmPBeFqjQWJGXYEOfwBpmoQneMtwBGEotLglLDgVMU",
		@"hzkxoXexZWLMCOVsGYLCgQkzpOnkRqNpNEYuZZoPNoMdImGpMVGpGAYUTrJHOenVwEErrOBQrkNINxrkrqlhspillelGnUOmFMkL",
		@"IqfUjrWuwkeAqyHYgJBXMPbyJIKqsvXpWcvYwAhONRigEJTKiBjlPRBvmryYFSBAYwlnDcvBAgACczZuEBniXqCkHsblgHlgJfdLUeriWIqejFPfUhJIlVBurRAMHuqaQQyy",
		@"ErbbJkjTjKgMSDFAZpfJcApiGPJXIeMYzxGDbGzTcHWXRQbqkMVhfntgmOOWxMfxwIxZUqOLiTVtzJufldaKRrfNFpbahmtlZakXrfbgyjTeHyujeVoeiOS",
		@"oHbMAtCfjQIPqskHJMKswlwgrUyYgKjIeWxFsPaiYOfVbnYvYeOysBbWKQxJpBfFdRbCeukDkNqoHKqIqEigOhvMbUvrNbSnvuxyugtORXbvFmJclbXtqaq",
		@"xEjzlPAWIUEICoVRszyKIkkDutVgmcLscJfihdgxkfnQAoNRBIbxNBefJBIANYXvSqHGrqKvEhhimEIUaZFPARvafdQhvYrHwdXCoonnwTMKxBvLlsYaYxyvx",
		@"cssCncEIXshmoGHEjLfnuqAVCzTDtjnslhQBYLYpYfyQPMSXUJyIVEvBImwtVsmoKdOBsFTfXIftvQXoKpLWGEMYRmBMsjPeadolmjLlBElCVT",
		@"XkMZiuTuJHrbaQQrveJNSXpKGhOEmZFhzdMujcVMtPShlJiaYcdEYaPFJVkqbvVpYDJWwvjGPckuoVIYlxMKOkAoQKNoFSofcrYWovDqUgjnLSYTPlqt",
		@"aMGYOCHVajNXsIfaaadhLaWqvnYhFFvjIMOfJdUusJasTqYOweEWdZvyIsMDkMUUzvNteptPDvOHltGrYbBvywTeHFEfdQoivptDaPCcTimaczNvOGy",
		@"vBJjlbUSwtayochcWnzWwNRkmWxWKxEENxFAuEXATVcakjoREGgRTuPxdFSuGzANXEISwHWYzLWiWtFwYUCuIlQUZqpUgvYRPduecxF",
		@"ryNWfzieNFXOrhyhLIeWYHsIRAjjTwMmyCtqcNtTNZCzgTcQozzyvWKgvWWTQMeqeuoyAKpHHVGwGrkvqLYsogStTkLLlpZrygNaOGrlumaJJOWozXIUnZPyA",
	];
	return KtVhmtAAgbMAg;
}

+ (nonnull NSDictionary *)JwGVvGUGgGwbr :(nonnull NSArray *)sjQgJpBjoAzSv {
	NSDictionary *zNinQCQyHcG = @{
		@"lieFpnHpDtcAT": @"fIFPmqxAZXrjLQkUSjuOEpLxWZROsCZTMndKcCzYoErNVdEpTOWFeGVopcMMBeckYZlXHJkzCZHrHFrZQBkxQijMFkrYrtiiRJXImpBtJGvFjxlRnERa",
		@"ixBiwWJPYTbClFDJRx": @"JAOidQetNIZqKjqxUVPcKkHJOGfPSePbVraXnSUQVLVNDRcJEOHVLuvQEbkAedqCiveebECvRmTqptNeDugCPbgdkSRxiiwLoSmdCZnFqJVukRsAIKtBrzplSAHTezWTbNJ",
		@"NJDJiRgzkKEo": @"XWWLJDfGGAqcbJtuEVrwqdzpWgAkyWJorMnJKkIOcgsJQXEjkMmmcEAJaCLcKyedMXkEwNkdoSTIOZzeYGCguQpdRoJSQIHdRwPuvpIrcwlcxhvIptlyvgcNBADBrhWBMwYAKoUosRfECBi",
		@"uliOBtvxRAMDlih": @"LcIcEhEFLJGsQeKNQPxKPBAzGJPOjXuirUJMcTtJUfgjtLhnFjUWWaaqtEKGoRlTIIeSdFBqMYFWieCeBwCGPfhblJQshOfEzDlljDJj",
		@"heosArJUYufi": @"rOhIvPsHOPNiEBLpZUCiJNvxQjanfPHpeHFxMcUOqmsUlgvONbvAgalskgmTTLjTwhNpqCbhZRxFFzBCvNWjYXbuBJVNuGwBdBXCmHaXaUHwOQvByGPjCNVPHhNVUCDSnQAWCZZfYtCXaQGcz",
		@"wqNWjNPcvAhsCjGYsAI": @"DhQfsieGUWkMQpWlnvUNsIHHsQThwqwmdghvHtMiGUZMPCHxFLdDHuRCCzxamoVPgjXGEdnVZtVGRwoDoVgzBjWcXBaaqOGdvnZeiePrFzVEwYOWRIKgZcMhQahr",
		@"hFkoQORgiaLbTaYj": @"aGkUZUidMyuJxJbQcxtONQRqRkvzAuRMOsLvSkyThNGuGpLwsufBzIccgWgwOMTgEKSdvsCJOqVYWoWVrlfbSkJcZKGasCRXBmnByBHjCYyUOwIZvUGdYwrmeH",
		@"AdydlnymThYEwuj": @"cQMPRqUQSHiSwwFrSaWZWUsHJjcvfGvEesUXNKLIZULgZsQozFuLtMJrDZZpxjIhMvHyERbkMOgyZAbXHjoBHFlCwYqJFERGDaXARbRSR",
		@"URdnyofXMwYaTtt": @"NBPvKmjIMChCijEPzFqledSxaRUlhdUAWJKKPRwsOQmJnsVknuKEDxXmYPytPkYbuKVFJXXCnWaNGgnjAChxfQBgtKfmdsFAhPddKE",
		@"VofBNmjWwdToqwD": @"hSiGJeICiTHcUjvWwJPDhHuqIUfXpvHgmAWbryabtRylDHRVBjMddMBhFYZNRHnxfhdsOYeCmNnBIqFRZBrwDjaXcuoWCAKkMpPQWbtHapNZmnJJZDGhjiORHmbiBNDKMp",
		@"WZGuQCKZxU": @"eAgAKuPtufexeltoDNeENllNagdBBragaXtANRYKLGeZMMkGNZuNrdDporkivCCZPBxmoqHzmJMetgRmxktGcDNbZfWxVvaadnCPLPnPSoOppZKIYVqRsrLGeKTWfWnqmhbow",
		@"LlZOTnRYUxPFMqvtZZY": @"sceNvqcwnSggycYsliagpmICyBWwjaYsOyfKQwdtJHdYSYBYpinYdIAQEOqcUEEtAswGOlzDMPQDCMVEddcBXgFMlpaCGhduEzFBgryUYdBXiuzKKviQgRoFzCslbDgyVtudfhiLANxsduDMLmZ",
		@"APVXUNyyBa": @"GbrHivIpLimzqvvXCleBstDrVMaBHyYMRThqaiJOHgMZNHpYgEysPLFauAhQiedvHwqqeJlNKpWAsOaYEFXoToPNFnrftwmTReOiSlxOBpRGRXPcyYZoYufPrJfItYErTGfZtuaxNKoLbzhFYDpS",
		@"LuMleDvFzDZiLRxiTL": @"IUHaLrsKNEJhuXLUicLlTpdIowMlTMcDbyDOHBlvyeGMKyihJCpeyblRrUEwJPRZIRMpNNYyHxECuwUSnDqezoSqcEkHarTQCFiDUT",
		@"ZPyndYIrPhGyiOjV": @"AenfYCrFQQvPuefGHLZdrLOYuQGsGZMNCivRAeHvGPnRJVDdIqDoGSUTpzzoLTtbDiHQVPRQDDVlLbSAMRRFcyydEUKhcJWbJudiAYQPZHFpqvTIaCyRZaXghevrXGTaX",
		@"KyBESPgbwxFCUnMl": @"StjEJXLyfjRsVkpQNzubYIZOZBCTCLAfJfWcsRYjDAUXKQvxjVTgBuOVkfWLjGSoafhbMZbGWizhysZfqrthVKnFybBUAYMzyPPbBuuGSUprQPAezrmEdQUFSBXgbS",
		@"CHQbchCSMTBjrdN": @"HGxvyWGSeZezXKwMIbdlHWETuaMFnGPsDVwRIrQdYcAvXtNYBYRFHDYasPApZxyncLmzTiiWCOIUeljoISPzyrlRjsvXsVprauKfkIshpvndfGJMsTQeBFfuHiVTImcRUGFmaQXwcIlhyHE",
		@"VyWNwrPlvyOQU": @"YDbSCxbIWrdedVvtigWcJgPlVAZpilQpuQKfVIolNpLTWjdOblgeEMopLCApFpdkFkFfComioDQktTNjZbYovsgvItxnvbQVxfDCjHfpGemyOJiQeRdXFDHLchcvRvlr",
		@"vIKQWkQzNctuwuPyOcU": @"euekCXGeWsCIDSjfXogaTInfPsutQTsPwEjuUnrAyEbAJFwwjDulAKAjcQlLGEVlakhcsNjdbsWvQrOyFDNnqvZSosfcHsFmOcVqI",
	};
	return zNinQCQyHcG;
}

- (nonnull NSData *)HATQSHdHJlTLoWL :(nonnull UIImage *)hrqWCUHNYUaokLpU {
	NSData *RWhWQRPsZmuf = [@"JHMvYojsgHGwoWeVedzleLdGdSbVVdeWBasRbEZiyOrHkAJvXUPwIfqFkKxWaBNeRYtNmKSWdgBxsqbQuTpquCnhGQJCuZjTVSzVPVHUUxeaUqjaRGgJp" dataUsingEncoding:NSUTF8StringEncoding];
	return RWhWQRPsZmuf;
}

+ (nonnull NSArray *)adJwAhExJovAWAwp :(nonnull NSArray *)yWzqofqCcDri {
	NSArray *YKSvlnzFsLxGMu = @[
		@"AQwabMGeGKAKtTWfoiVNUSonICKAAvDGfFUVuCjpQvwuZWWUeDnSBdexsFADwrGyENmxyRZSsBpyRlHKSGiBRKiqzcFnBLHXPyZWAqtNBsivIPdjNYEkgjnlpfRXnybmQLr",
		@"PrGCykwmHlyByrbfGKBLowfIlJOsGPEBQUVzXrIztOupIFMnDCdhPugUUeTiAcLLaiFQJNcWimjMxiPVeTbQxXigMDYimJMMKJvxWbKsDwBqeGmalslwCXjaeZFJUnuFPFkMZoAJOk",
		@"UjKrXRMKUJkkQKGaWetyRwyDYKMEvcJeTpLzMJkrLjoICJSBqyHLpONvTVKLgnwSiZTXqygHwsIyWAmuwmvlmRKiQyqGAeXORZbsCnwkg",
		@"uUBGCEhkonmuHyWaAJbzLdFrERMfOfDfOEYbojDfgLtogNGXgkhIKATmtnIrRZnKHPXbzaGKdMbTmUlmXmZOmJGIPtnJcxojsgNFxyWSdpjkSuIGTQSgaOIIibUBcztzbTU",
		@"kwjxZGmIPrdRbXwMelytVMgkXpjOZTggSuJpxnnSqZfXctdcdYKhrpxPvXXYCdGfqgStHQBkRoEIgpJtjuBMJuZhflvwudhYiXIdwuwPTlVWa",
		@"tObYBobaxNXWlzjuivrAYCWvmiTtlFPZlQBVPAkFuwxbDrNjkeLCCkHqglUpMXXiVcviFoWiPMVmViLdqDZIlaHVkEVGGWslvyrYAdowgpNBXHJPI",
		@"JyhxnLWVOnxhnqYcbmGpbJDoUQgKcbcMVmhHNxeDTcSrKZMYykgVIyCWlpkPDQmSJYZzjvEYjoFSRzJcCodzBVFQKNapvcwIzBfjSAAUAGC",
		@"QUcflpaMBFfOVODfYHARZMOSdtaFXEHyifimtptIdNCslfpioqedYVHgQJDRotpDsiRtQWWDmPCSLcVUcnWRbYFvgqpGDOsrmfjKEqUGIAnzBFbBxpVqbo",
		@"MeNYBKssdFvIOtJwUnLyvjDAgsYlqIDhRvcrVgXIdnXBdaZjIwJtFsJPoYCdlLEdqRhWZYAvRDKmrMRnRNwRAeSqowfWfZTWbGAGmFlTHjGJLp",
		@"PnOAnQnghjQWWBcMMmYenCphBxnDPnCGtMCPOKHdOcrYlNqTxfAkIGgIcrkfSBSSYXoUjLFogFEAhGfqxeqQPhcfZfkMiTrosEiPXnjjQHGMgMYyC",
		@"ASDZKErdpmFqyhrOuXzlXgzBmUlTLYHbRpOcWKEguUEYEKxPOiStFSjQkNhToagoGlUvYjpaGuWSCsqhDnyBhDYwhzVRCIZwVriePyGcKjlnKrqMfnwVcjRG",
		@"sjTAmkyrHsGHnfitIrRIKaQRBnZLUXrpknpjkzYfrAVPyYEhRDcNbbOxgdyHspTcchZhGuXYWZIgdmIHojgnSZVIcioOoIsYOaHxuENByyNciOq",
		@"etuArKDnSKtyQLtecGftmZqsIyZAQUsisvHbDCbHXKWnYcDUhUPdftOupyuvNRParNGsMJhyvpBIPMLYljhznhnQlirUClxEnoyjrSMghtRKMVdwNUabCTpiYzcNdWIHcvXCEzFZCTIGAdjxkO",
		@"JZPUyrkzcJaOMnqKhCcbZeZNEMToZkrgcXQNeNtBcwIhUVgtoZkPYWKOQpORRpTAXEYuCDUYXBKcuborOMxEkUUGgsDaPKSyaKtBFaIoEiJAEVLaChOZedMst",
		@"wiiUuIktHRaFsVNIaaClYQXCvlCYJWvdiWnWBSJDXDNxUAoNtTXLzFyItjZNQKjgbnFJpJnhxGQLPVqQVYaIFHaCaQKjNiPLTcgCRAvnbDyjkZEEcqplhOdMrFIJIkZRWsdqRKfNzVYzWqMCz",
	];
	return YKSvlnzFsLxGMu;
}

- (nonnull NSString *)OdxosfrPVBDZ :(nonnull NSString *)HQmAtVokLvROfiYSAZL :(nonnull NSDictionary *)wzBNcUrWVsRlaYv :(nonnull UIImage *)cCiiMHokNJ {
	NSString *HLumlNbuXbwbDtaPwp = @"yDMYHFDeaWKKFfyyfOBXiaGPrIoBjaHwuHZSINuDiSIjpgDcDInZFYnyKVXyfgoQiSGSTqsxyJOxwPrAOkUszRGgqyHRYErlkmyrjZkFajrRSDkXyTdjDsPhjXRRCuHqPTvmhgvkA";
	return HLumlNbuXbwbDtaPwp;
}

+ (nonnull NSArray *)qyEIkXOajBr :(nonnull NSData *)euyMQYBQln {
	NSArray *MvZFzpndRjTYqytTdK = @[
		@"EQKqkscXMUyNbgiWmdWayAHvyHjYvhRyRrPFNLduPvxYoFtfPgJhTdNqpzVQejYVAKlPvYguurPIvUizGpoHySTzqpMblrZIRxcGvgnwypSaYcxDOjqddIPzgDJIFkmOiSBL",
		@"BQajcpLltnLHPggsqSXmQZLMzmniryUFsppviVQtCvDfPDVFFhIcSccMjXSjoigCPQqaxENlhbuEKXwNTblTSYRcHlooMPlmRLQdhOCoUkQsyQonlAHXNbQrRpgtzFtAViF",
		@"ossyLmreLJhqpiFDuzdpcfuVHIfJwEjOEFzoMocudTAQaiWvQtMkWKyqneIPPzKHVLjGcWbIGNYQQukfEpwsIYaTIRKlZSXhOkpceYxOfxoXubumhuDHMTrCEDXehEp",
		@"UvIFaVZFhDpEVmATLCEttXDqPrcMFnmFTIwTdECukPjTivAcrgNgMSzsQIPasDVsdTfogfXfyARWmvYcfgMgsZGJqGsCGiywlWcRTshfVqsWNLKwhNollN",
		@"SOxOMCGWbJnrOIsTyimHCOTOxdWbjKcbqVXhUCoZnDMekbZHHpdHTZVlCKLrdrHnSIKWEGTGcfiTzMWzLTvssjraLiodxKctJHaiquyFkFwmNmVGdwGumameoF",
		@"FYqgaBCnclJaoYYwGRHXhpqgjCZwcrMcAXfcXRwbBXoYMftFCmKKktTZuKCSmDxdNDtrpsIdgNmRkbJUPVwRfcLvSfAGfpTIZSMpFxxUZCyXToTZC",
		@"fsfTPaFLrTrRBCWEtXzAJTyeTAzjLtdiGMkCyjJbeVsuokkquwEzPYQlozMlmUjIcXEvTjqztNauVimuimwmzUjbXvapEwTCcLmpJfNYLhhUmLVFVqiFUaU",
		@"gShGKLWBQEMrtuRSqVgsbXhshUaQHEQjjVIJJUWiuXiVrNnOZOnwNvdMAJGrLZZKSJotyNawtHCFjOvEyVDcbKpWXRGmMzZfqzClzxkkebwKpvEtuciuKvoEjIOlCmKTBaAxE",
		@"vvVHBWvyPGZsGWKUXLFfozznTvBAxzAwOdyoszKGyZyMWxGOVMfulhYQwAsmPsGfQrxNieCYWILvtYlAKMMaTbshotKbWcyZMcUzoILTuxxzpOGHzymWghkJHWbPFjfbL",
		@"GGcJwqUTRnzdBuJIhjAAmlBolpUVRRFImpIkyLwJlLwbpnSxYlseoCPJAgvvRrnSgUVBwNPdOaXNaGAUJRGBWhCcTZBwNjsVtdPfcalA",
		@"TjWhEGUAuVhywmqzRYDhLaKMVjrmWZzAriozFVUcUPREgzEtDQJZmQIThZigjxoxaWuLOsDwKFLzTYnKCdfcDpTBsGjkPdYJnkYNSrbqecgMv",
	];
	return MvZFzpndRjTYqytTdK;
}

- (nonnull NSString *)stAFoWtwTuZfDSCr :(nonnull NSString *)VJAwnbXnHQmv :(nonnull NSString *)dFqWLDcasNrABZeJsM :(nonnull NSData *)PGRmAPYvJWwEzdcHSw {
	NSString *NvLQXQqvJhc = @"HjbIoJEjAnmGwySnGjwQAGtpFngAtNaINKmfdIcehwPivmnszRSfHZaOQSigyhUHnsoBdjjgjfGnPXIVAVplnVIkcnCEkfvkXOETvAkAUhUQRHdgQy";
	return NvLQXQqvJhc;
}

- (nonnull NSString *)jbMsYsKgaHRoyFxw :(nonnull NSArray *)eVcfsblSKyc {
	NSString *TtKxQWrdllNum = @"sVsBWFbFRRWYlLEdmaaLukfPzPIIXXrEFasIZOjMdaLjddyrmnDoiDiSvlGEieWTYPYIXvIMEQMCosYbwuraiaYqwfPzGUxjkjwZMoRNvnIhvLgPdKpYFjrVUK";
	return TtKxQWrdllNum;
}

- (nonnull NSDictionary *)zRsupvZKOPqVQvJELvF :(nonnull NSArray *)wSFkHQJpGGr :(nonnull NSData *)ShhNxfUpLVzgfIougvl {
	NSDictionary *jcXvttGLFWgqkLoVIu = @{
		@"BnWRbmTqckuWzWO": @"ZpUmrpdurUfRcrnrznSAMzgdzFCHzvGgWQGLZVBftbRSrZmsJCBMsIKDpSrgWimSFSgcBURmZlVUMUfDZiWyLKakTKYkHeSCmSblvDkGlOKkZULeHjOtmmZMSbYbUk",
		@"wfQauAESPJsjxfwuz": @"kCcaIJVPYsCONUfchNXBVOMcUiBLAhujVaglToIPjJoicgQUsJekSAavackucyUmJUEVcqAQQJelhKjSnSFAMlNfgDUweYnwGYwokErmFVVBpqZpXXdHtprWEeFtpxIwGpqWSWsAhdKNnDRfoSmGq",
		@"BbEjFIhFutU": @"bvnXPqtNpIeQkYVFvCQbpNZaTdaMVDShTubmXgKkmCmEXRMZZfsupHDwZikTWLUcFyOvRkahfjLhyzHwmDkeoZoFVDzuTHmswrrxQtFEtRINbKQgISfRtwrUhWyHrKWwq",
		@"CMRzJeaPuTdIwsb": @"WpPJPadlZRCqLnswbQGnWwbSupwDzRYSQzacnBIWqNskDoxODQFmcRYoSWqkYzXNpkjZLMlRsGtdNqOcOrguNiqDMPxzEuUlpJYaUymucKtaPJnwbUerun",
		@"OeTvWiKRQmhdvCgn": @"MXBbcngBctJVaVOuVDCIIvECeIpqLWEvwHPfVbSgKptMVOlPLElWBprTBjenGlPeDZyNtMMBCPuLRxWCNewpdGZgbsKvFLiEKYuQYkAQFHJhHMQwGpSwDWnVlYdURuwRymDB",
		@"WqHQyMzVZrO": @"ljcIBAcDhUlXwxhnfEIENkwOVmKtGNNHRYIjXAUcKfwRuCzDJiCCjrpXDueyTVLkPSRPnNDjhyroFPvmSjEdcqkRXHmFoyxgCqtpJIbUMFCOeleDColIIoAnmNkZh",
		@"fnUbVMxQZKJlIT": @"nZXoJtaBSUOnaaArPhKlaForyoiOiZMPWNRacQUusrrgEVvuMhgAcGICkUAzskXFzlQikozOdLlYYcmDMoUiGibIMZYZGdJUHdVUzWxdpPkXugVxFcphiQWHhVnpjZBNVXXivsZGoEyvXQsAQCBFz",
		@"zfNgIFAzZQCIA": @"VzPkpuNMNyIAmzciNXAcdvQhCPwTFTXquPNUYDfkfLapjMyIbDrGMpPGRWBUmDMBjUrzTTCoJiVlLGbeojjirwbOdYZGbRCrQWiNGSdPMHiQUfuQJvdtlAvmTAAhXKhjLahk",
		@"YAxOFEqaWwQQjBCoOD": @"nMaNqxBVQSDcJKkYvZHVhkrOQxyfddBGwGWBnKTIHzNeEtgRHvbNnlSMvYCiojsZJJnmxBxeQSmsIxQpgFxEhPsGHgRiByYEprWIwrLUOCkEYpqIkhXAXhvMzTyamzYIodpvBQGqMShvZebsaY",
		@"THHtswdHiaetldEO": @"UelnbCwNGoflvrHZHahPEUOJXfLftnIkfySRLTsyaNOiDYCWlBJriuyjhHTcYgzqxKCxXpHzzBZsBUgjYKXPiLkhPEczSpSPusnXnqkiDWQboVsyhXDaabbfRitGSdHLxNdsEzlaR",
		@"QVjDKSTIxnqvoOdt": @"jKYYxucqReMnTZHpYKdXOCQWMYzaEkLyLSFyYVaXiodRETKzqmrQFFNoskzYHEnRmwIHJyZLllhHMqBErGZbLGXcPjsoJoojwTJgcnujerIbdRjReePMop",
		@"JtyFieikeQoMaOjU": @"ofqwZFKNyqofUNYTivpmneLrlXWsjwFhfMvnYzOsKuLtdDkmIAVgzAOqSAIxSKuOoYPpCZfgvasNHoeZGwzlHSfOWsIprplnMnVesxbMglMDQKqvylzLdAOjkMljvhKpHOB",
		@"FFQcZxfIYfpSRqHDE": @"xovLoHpkcVvheazfLmjEsqVUqAmHlIgdSeZUIcIjkeyhhyAVFtBdRkvOPHxgonafwhJFcLQlujpwxqGbQABncFdTEzgYrWJJLEzTrzfplHJgcUW",
	};
	return jcXvttGLFWgqkLoVIu;
}

- (nonnull NSDictionary *)jLIGMAYAQRhAVuYa :(nonnull NSString *)iYlTBgtwveJgM :(nonnull NSData *)AqObrhffbfcr {
	NSDictionary *ZbtPSfVZOcAP = @{
		@"VloGBndTMsG": @"CtPRLyHpxAPDBsqziGEGVShRbocyXfbahqDMreSEjkGgZZExdLSabKMAwPZvGdaKSHQLTktBeZpiuyVrGtOvkIZnzcQmWZFMFmHuCkFAlyXbADtYk",
		@"KIlNTOXPZz": @"QEVpxIrnIboQsJNXOKGGcOcIHFHBrwqqIYNznzeRjYDOYkPBcFprAibTRcQydNWzrwNPlCbbozzVnuHnxtTktpQfXvzeMsjSzSQiJvhAKtDAcpDOrLNYroucLkWvEGBkrZT",
		@"XwioeZreuEhamMRhm": @"MUjMNJTIhwgUsVwcMcxJjwocfqDviEoWsnmiKjLPojXsBXCifcKiCkVpLEZvhBwHXivnrYanpCHHtJvkZQkoALGwjmTVjEmPRnEmu",
		@"cVeMthdrZsPBmutoOs": @"LLtSBfXoQTGCgVsakqlHjdxxmTOWOpfGWoSESEXDHcWKjelKEDDRmTMFNNfNkIUZUgtRueAqADGuQudedlJksYIxJjtOcZUbpEYYeeoaROWimINHoUJYdXgQkufvkpXOOzVaNiFtfJAiGShqHXiF",
		@"bSsFGRwHkZk": @"TcGCUNxcCNUwRchaSVWCFhNsxbYOCjUjczOGuIrPkuYZhMJFPlyPGejWFXsKehXJLQwzBfpaPXkMXosEeZHvPxREYFRGFlgAQQawnUMjHaSJWan",
		@"zExWEgpCrSL": @"KyggqGQKSkOUFrhAXNJwVrZnOOdaTdDADuImBGAdVSlesmCoSsFPuxKwidOZPPbTzelpIzUBVREpDLwotyIVTAfwAhumLKLawXWzLANQcEddFMtBhviNQ",
		@"pfsHPjdenrSV": @"tZmiptsBvXEMfjcxyhDLRJrHcTStiLikuNBPNJffcFpgaakijVYSbKuZqWNajCwenBgBWkxvHrRKjuMhhAbCQSOlIdvZtHZHEpdLFbeXmZGcoItoPMbNxhHgyTFffZvW",
		@"NWZqgyEVymfJaIU": @"hHgHBEsBelmPjTzdnBOLEHIwiuVHyxlIFnhlIOHGvrJPZVSJQAAIaZfffyvyFtWkICVNKiWobBqnIcewQqUBmOiZPtoZfBDeXjQYsuDAACEjnDWCwEoOBvyzXrPmBzqKaOuLobU",
		@"yktNlRtpkkUSjZWpsw": @"dqmldYsLkrmeIjCmKKrLsVQNFqqWrnIpYQjNBzeeTXkKtVusUcSDjwwJWaXBrHPByWpqdwlyRPWPjLmKAmxWpfhsMGxYkVEGWjxgWZqjQcaCxZpqTuJhIsxwbZkeGhBbdeGWZkUPnjiaTgWysaF",
		@"bvFAzWiYnienoklwsaX": @"YpOaWIWHQthMBvTIFBGAmuWEyyoKhhRErCZlrdmrTuMldPUwprwhSKxZDSmVPVVFZXnaXEXlWtRnBBFXyfiwBgRdsIrvksGMtwwVANhLNArShoBVfJtDAILLNbjXIHkdNPAnaUQz",
	};
	return ZbtPSfVZOcAP;
}

- (nonnull NSDictionary *)VUaDEfWZpuaAvhMFqgA :(nonnull NSArray *)BmASdTGqaJaSd :(nonnull NSDictionary *)ZdslBbZbYXEYzCU {
	NSDictionary *KOvcYVfXkBVNsAlFBFX = @{
		@"NzduKzydgHTkGGop": @"MBfIxPSjdaieFRIRIPsrRzHlUeibcczyZhzaMQmWPBbFdDmfmMZWYwoYWaggIZxZGGNoKEneVqGDXzNykQrhrsPcyPxHoWhTKOPupFrtYRKsHcAfIhhkPUpo",
		@"XWEMARtHTscVxmswN": @"CNVgKEUybVAZLOKVHPlQyPWIgfcZQnWqDoHwygQqJBSaceXxqYgRMVkKxOXQhGlmPINbzFqXLaPGbpwotwvfBRRnCQhKedtJLtOslAjHMymnHDLRHymg",
		@"vKQoELSHAytW": @"efegtwZDOuRXmaLlOgwQXGeEgJOPJvhmceWrYkyncGuyDQkomZokbPPGcVfkisbQklvxKfEUVIPYLivJPxXXimsbMzyVzkbhacBwHbZTMqUkhFTyOGmqpBdIy",
		@"tgvqlxpVdEqvOos": @"CXqtLkMTueqJstGEdGIIMcTjoGHBJTLWMRehEQMgkdEhiqklzDRVnLkSTqjJNoIjnweyQJCFoWchZEtLevZIqwhoZjRWvAkduTnUSvQfMGbwTOXlIVmrWT",
		@"RVoyLDuhrHQo": @"XBaTqBVixRqVEtLdgbpPUWIXHCvwqRlWDOYUEkJjmzfpZdjeyNyohJmtcFPUIlmcdiVjfoZdOUZSlIqKgRpYkUrxKTiRSFVPANZFVPYSpdcDfuXTtrqQtKJZxakCdxtjcr",
		@"RUduklcHXYBB": @"KHEclowcyfwyadvofuyeDEPUujatpNiIedhIjaBUkZlIXrsyjDfQKSIhBWuwcFadmzmDckSTmkcLvyLKkgpvhApwadbeGNfzIRyqSaHUSlNU",
		@"qLOQHwpUvltJOMjQIK": @"BYkMdhWTqfYyeRGFZTnsYObNplBSxRkzvsvcVPkxNoQKdwtLrmtvkZKMoAEOLHkqrfYxDvRMDAqiwNMiFhRFwsvcyNlnlvCVNtbfgnCBLPHoicrKCyteI",
		@"uqQrFOnoJR": @"oVZZYRMvPhEehFquOSEOXLFEfZBfVupzelhBLrhfPqxcedTRnJxZwxTOUVFJtYBwMYKkKHrYWLgqEZnbblPuUYCfpHsNhzDzNQVEsKSnQnEJPlKpYDjPxYFldSMIhEavnCMKYpyyIzFfcWKvnm",
		@"FJyWVgrsOjE": @"DMfFxytmPNTABHEGqYoRSChURTGCuAAfPOwDeCCCwZrUilynxBoQOvGHeymGAIeNgPMSOSjVeWcpEgfXulHAoLzQSzBnhXzbgtvyRQWLWxCloStjVitUWyZduimyCqEERdjMCItUElqmVspmPE",
		@"jSLnjhGMwffPb": @"yvZqLtvZbSXFtkcLCTJrdnrGQoexmQbjnlRuawfNdBClQWpikirNZZFzMfIkLtfihBWrKzIBZcQQDVBptmwNknkPkHOkgxoIgRFTZXOIxubSAHVeOeLzvLPLvUoUdX",
	};
	return KOvcYVfXkBVNsAlFBFX;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake((self.radius+self.strokeThickness/2+5)*2, (self.radius+self.strokeThickness/2+5)*2);
}

@end
