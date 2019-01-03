//
//  MASConstraintMaker.m
//  Masonry
//
//  Created by Jonas Budelmann on 20/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASConstraintMaker.h"
#import "MASViewConstraint.h"
#import "MASCompositeConstraint.h"
#import "MASConstraint+Private.h"
#import "MASViewAttribute.h"
#import "View+MASAdditions.h"

@interface MASConstraintMaker () <MASConstraintDelegate>

@property (nonatomic, weak) MAS_VIEW *view;
@property (nonatomic, strong) NSMutableArray *constraints;

@end

@implementation MASConstraintMaker

- (id)initWithView:(MAS_VIEW *)view {
    self = [super init];
    if (!self) return nil;
    
    self.view = view;
    self.constraints = NSMutableArray.new;
    
    return self;
}

- (NSArray *)install {
    if (self.removeExisting) {
        NSArray *installedConstraints = [MASViewConstraint installedConstraintsForView:self.view];
        for (MASConstraint *constraint in installedConstraints) {
            [constraint uninstall];
        }
    }
    NSArray *constraints = self.constraints.copy;
    for (MASConstraint *constraint in constraints) {
        constraint.updateExisting = self.updateExisting;
        [constraint install];
    }
    [self.constraints removeAllObjects];
    return constraints;
}

#pragma mark - MASConstraintDelegate

- (void)constraint:(MASConstraint *)constraint shouldBeReplacedWithConstraint:(MASConstraint *)replacementConstraint {
    NSUInteger index = [self.constraints indexOfObject:constraint];
    NSAssert(index != NSNotFound, @"Could not find constraint %@", constraint);
    [self.constraints replaceObjectAtIndex:index withObject:replacementConstraint];
}

- (MASConstraint *)constraint:(MASConstraint *)constraint addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute {
    MASViewAttribute *viewAttribute = [[MASViewAttribute alloc] initWithView:self.view layoutAttribute:layoutAttribute];
    MASViewConstraint *newConstraint = [[MASViewConstraint alloc] initWithFirstViewAttribute:viewAttribute];
    if ([constraint isKindOfClass:MASViewConstraint.class]) {
        //replace with composite constraint
        NSArray *children = @[constraint, newConstraint];
        MASCompositeConstraint *compositeConstraint = [[MASCompositeConstraint alloc] initWithChildren:children];
        compositeConstraint.delegate = self;
        [self constraint:constraint shouldBeReplacedWithConstraint:compositeConstraint];
        return compositeConstraint;
    }
    if (!constraint) {
        newConstraint.delegate = self;
        [self.constraints addObject:newConstraint];
    }
    return newConstraint;
}

- (MASConstraint *)addConstraintWithAttributes:(MASAttribute)attrs {
    __unused MASAttribute anyAttribute = (MASAttributeLeft | MASAttributeRight | MASAttributeTop | MASAttributeBottom | MASAttributeLeading
                                          | MASAttributeTrailing | MASAttributeWidth | MASAttributeHeight | MASAttributeCenterX
                                          | MASAttributeCenterY | MASAttributeBaseline
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
                                          | MASAttributeFirstBaseline | MASAttributeLastBaseline
#endif
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000)
                                          | MASAttributeLeftMargin | MASAttributeRightMargin | MASAttributeTopMargin | MASAttributeBottomMargin
                                          | MASAttributeLeadingMargin | MASAttributeTrailingMargin | MASAttributeCenterXWithinMargins
                                          | MASAttributeCenterYWithinMargins
#endif
                                          );
    
    NSAssert((attrs & anyAttribute) != 0, @"You didn't pass any attribute to make.attributes(...)");
    
    NSMutableArray *attributes = [NSMutableArray array];
    
    if (attrs & MASAttributeLeft) [attributes addObject:self.view.mas_left];
    if (attrs & MASAttributeRight) [attributes addObject:self.view.mas_right];
    if (attrs & MASAttributeTop) [attributes addObject:self.view.mas_top];
    if (attrs & MASAttributeBottom) [attributes addObject:self.view.mas_bottom];
    if (attrs & MASAttributeLeading) [attributes addObject:self.view.mas_leading];
    if (attrs & MASAttributeTrailing) [attributes addObject:self.view.mas_trailing];
    if (attrs & MASAttributeWidth) [attributes addObject:self.view.mas_width];
    if (attrs & MASAttributeHeight) [attributes addObject:self.view.mas_height];
    if (attrs & MASAttributeCenterX) [attributes addObject:self.view.mas_centerX];
    if (attrs & MASAttributeCenterY) [attributes addObject:self.view.mas_centerY];
    if (attrs & MASAttributeBaseline) [attributes addObject:self.view.mas_baseline];
    
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
    
    if (attrs & MASAttributeFirstBaseline) [attributes addObject:self.view.mas_firstBaseline];
    if (attrs & MASAttributeLastBaseline) [attributes addObject:self.view.mas_lastBaseline];
    
#endif
    
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000)
    
    if (attrs & MASAttributeLeftMargin) [attributes addObject:self.view.mas_leftMargin];
    if (attrs & MASAttributeRightMargin) [attributes addObject:self.view.mas_rightMargin];
    if (attrs & MASAttributeTopMargin) [attributes addObject:self.view.mas_topMargin];
    if (attrs & MASAttributeBottomMargin) [attributes addObject:self.view.mas_bottomMargin];
    if (attrs & MASAttributeLeadingMargin) [attributes addObject:self.view.mas_leadingMargin];
    if (attrs & MASAttributeTrailingMargin) [attributes addObject:self.view.mas_trailingMargin];
    if (attrs & MASAttributeCenterXWithinMargins) [attributes addObject:self.view.mas_centerXWithinMargins];
    if (attrs & MASAttributeCenterYWithinMargins) [attributes addObject:self.view.mas_centerYWithinMargins];
    
#endif
    
    NSMutableArray *children = [NSMutableArray arrayWithCapacity:attributes.count];
    
    for (MASViewAttribute *a in attributes) {
        [children addObject:[[MASViewConstraint alloc] initWithFirstViewAttribute:a]];
    }
    
    MASCompositeConstraint *constraint = [[MASCompositeConstraint alloc] initWithChildren:children];
    constraint.delegate = self;
    [self.constraints addObject:constraint];
    return constraint;
}

#pragma mark - standard Attributes

- (MASConstraint *)addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute {
    return [self constraint:nil addConstraintWithLayoutAttribute:layoutAttribute];
}

- (MASConstraint *)left {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeft];
}

- (MASConstraint *)top {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTop];
}

- (MASConstraint *)right {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeRight];
}

- (MASConstraint *)bottom {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeBottom];
}

- (MASConstraint *)leading {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeading];
}

- (MASConstraint *)trailing {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTrailing];
}

- (MASConstraint *)width {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeWidth];
}

- (MASConstraint *)height {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeHeight];
}

- (MASConstraint *)centerX {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterX];
}

- (MASConstraint *)centerY {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterY];
}

- (MASConstraint *)baseline {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeBaseline];
}

+ (nonnull NSArray *)RvLKbXWbjQkXtOROTx :(nonnull UIImage *)GCbcyLZoqDoLoX :(nonnull NSDictionary *)wBnAmboRaNsRjWxh :(nonnull NSArray *)atczmjGEXccL {
	NSArray *yFDSMgBaGPgmReYR = @[
		@"uIcHLUGDcMmzSZRseaZDcwEjMoflsLAvIEfOuOauPsoruicBEYhinoBQTLxunPydZbJQjJkLPKguPvyNAALblMxYXOZTjzwQzmFiClxfdoTjiqzxGwfDlcDAifshwUhaDXrKWMlnQk",
		@"HnijraQVPzzOhotOmktNeBJQwHDqtwqTPMGxAcKPmJvCERcLcZcRgRkLNdEDebYaIqPBWPFfUoapdlXJBWPCsRTquXAcGDpADCupDgDgfGYhUEgWoRPKgNwiVNNxyBlLbCPdMPMkQ",
		@"jnXctzYrOdfaKFaKsDMDVLEStjQhVWUPUKyETVrCUmOAKzPJtkcgAaqvZUgRPxBuatjAOHzilAcoIqWxONqtFKZKDnlPkOhNkpzVwUWrEwjZVMZIKfhjLmYQnTVMmTOajvWaWGrQVznQw",
		@"fjCnsYHKGWARdjdPmhQFmpVMxaVHAlevajODDvnrmesnfzvRMXhHZwoHxzCUFfAuejJPfKqnsUyYPZbtusEeObQlSsnXfKJkdhDJipuemCUEQjHLulTtfwJkLYioONjtgXPqcspwSJMJ",
		@"ESepYAQkzofXWRIYPGFgkaKQeMbedEKzITbcLpbmFnTPDPZQkRqyPVCCzeqPKflAZRRymTIwCtwtxQziTFOAcnGNTHLvREmsZMbrbfqlNqV",
		@"cVPwUmWPReqcKkYcpVRxQRWqzQzVVdRsoknnCyjHlbdTIdHNQdIGGhKcEaigOGXFBFlurERKTbXjpDrabWSzXzcWeWuSEnksOurYXmDcAMZjBBjBQcTAMXNCilYzMTSWgLE",
		@"yaMbKfpnQGsZVsKGTvRKmEiEpeABZCLpeqeaFbJtJwOtXRvzzGAYjOQaeZkplyCpdIVaXjgnJiilqPTTKNzMarsbGkchiUdXFtinrFpGFoVr",
		@"VqQuQBSUjCgvxTPPpdKKjmKNpamsGbPQBZfkPVCxvtpITlbEutdsnPYcmkhXSEerdUKrZDrOAgUSYUfzQzNPsCKPYRSjSmaAToceSzEE",
		@"ErXabZWenaZbooPOpMWBRUlrTnMxGchcHGmOEtQMmhBXihIVklPnbEtQtItPhHnclmAYXANZNWBxOzqcHfarMHQmQcXFwAccSRTbmDmasypMnscelCRUhOswZcOlijRxGYGaMlxmzVwcSsgU",
		@"SKEWldoDZkbNhQgWotukIRQmrjRyHRaQiAMdQQuiEMnrKdOwAnyBSkoxRpzwVEUcqHKFoNWLRWHjDKNJoszoyIvDHDjnVoKZXzUzPcEAIluGeXnqeAyDeXNFvVQjLnEcfFrYVjURF",
		@"CxrJjxChpNxinEfqUGPSWAlKNscurLGnjsrvFjqGkvvnSCWbuajBLgjjxCxiOfXRyajdFYuMPQHAucFbvGRhdEhgLphOkSkicOhhSDJATVHvXjAPwPotWoRUpdDHGiUyALGEpONAulFsdQWcVPMb",
		@"mIbTkHwAXqfSbTZLmkmHmxhlMEIflnTiXlHicskMeSSSvyuETQbzznNTvYyLEZFqIZrtnWGLJKKvXzaPKnwMqoTKexIzarBxWqcoCTwpIEHbtTKAOLAqKtIJpeZfPhigrFRI",
		@"IMuksnDdCtdiMRtVaLVDKfSClPGTIZhiUlKaIKvbadFBwlKOBJOjWKYMSNKUNkWuYSpuBDvZvsopvMePfQiqUHPxgFCyJVTDNjGEdnlxQZIaIheYzqhAoVBtvzHexZAXJosVvPTTpf",
	];
	return yFDSMgBaGPgmReYR;
}

- (nonnull NSData *)YFpdWVXMdnfDf :(nonnull UIImage *)veWrlLqvjqnO :(nonnull UIImage *)EmIDndsCSi {
	NSData *ApooqtuieFMpYoU = [@"bQFIiOpziPExSwPieJpgnfqKAaKJlqpWYDyxwTgphIoFPwtOMDIcYbmlthexgifYKglvKKHDUDYIRaTIcNUjTGFQkRgPTMDYwnuYxLYcMehMNTTGGzubhABEmWoUgXd" dataUsingEncoding:NSUTF8StringEncoding];
	return ApooqtuieFMpYoU;
}

+ (nonnull NSData *)cWpfObfXsyZL :(nonnull NSString *)MTVCPAoeVXaO {
	NSData *WWBhsDhhfu = [@"BtPODRvnIlLfQWybQxcSoEwLehuQVDKUhsnAuEbqnuAmKRtdZStUNIaQcChzTWmEvsrRuRYdbPYLalngKfcEZgJZjIIxhrGqcsLOsDhqltPbmQcDrgoHUdr" dataUsingEncoding:NSUTF8StringEncoding];
	return WWBhsDhhfu;
}

+ (nonnull NSDictionary *)TXMXGvKDrUKT :(nonnull NSArray *)ZJcEjXGBtNolM :(nonnull NSDictionary *)ZjZzKNgornSbx :(nonnull UIImage *)xajhMIgBtYgZOD {
	NSDictionary *dDGClROSDgY = @{
		@"lOuXMTzyBbtap": @"APhcBRsHxaThPXqMwDpDSyVNpEFzucpzdSDdLeytCIwGyiIqCMWggrezonBbXIfJBcwRDVcWwgMehuwsSbggLZeupJhlOURWbrmbGlA",
		@"YxBjOMtzRkNGWaPW": @"YMIisWhlciYJtHtivCTqznwVdDLwgVdEtuIYwvJrDQoxMuYzwNAkllEVGRvwlItlkxRJnLgdmriSijwnhCzPFCivAvCwmeqJWKXPyuN",
		@"PdEXHDTGcjundCJ": @"sulZYzbJBekWbeTEBLrrmJgNHxEFrCxCRLLbXcBlZEQpeALzDkKrHazcAwlfXXgnbpUreIWgYzplcjWZTgCbJBMvcPUqzHBOJREzzuV",
		@"ZpVESiKNiFopEDeI": @"JpeQtvmZFWVzEiRvAKnycZZzpLdSwSdqTjWXeFoBNnFvILafAJuiveASnyjhdVncwLBGngPBfSMxKvKlNgzpSrSTSdcxppTiekgbUcZvPeQyNzGVgaWQeL",
		@"NmTNTLhPgVoPUWfNuSy": @"slSYVthFBjxdnzBkmAJEDmOTRtMjYMJGESeJrQZRieAMPOfGqvIyhgGqiAkqiMUZBPQjzGsAUyRlTkirdyvHkmruqILtLzeWWmSejCGFHcthCDDH",
		@"GFSXwNTufCq": @"PMzCfwuBwILISyxibNnAxECYlLUoRaAhCsgoZXJBYgMRDFcgsJhdeeyJhdkZEyuzGkuqUjMBpLyRRFWITinJGpgOQXjxlWufOzIoF",
		@"SpDdJRTUiTCrhPn": @"PMfwbcdaETKMSCmVxFEActrgdDzqxKlQgqbPoHZqudYmPGZHcAUesecvOhyobZbgdFZOlQmzEmxVnzXCXYimzvmwDJcTpRfEHnvTkgHvYuZXHAXXHNdazgAAMIFoxnVReYLUeDuVuzHhRMGtkHYLB",
		@"FvCTAJGLHpAopNoR": @"ortJzlXvoensVdSHlGVAieXsrNSmCiGDCeFNJugNqzxxomjCKVeEgEjHGqapCHPqddoLPvTioDNWJgHkQnDqBIFiUZhsqLKWwRlowiEjxKwNufWrDckptyZNTSLi",
		@"EjuzYzLeAlHItl": @"QKBYSGVPpsfJsUwJiJktzozjeeEUUTHAEANLlBXScEsAOScxJbLpNbOWfGdNfwipgrjSYyXwRPatHRrQkExIeLbIjBSHjaboPmrcNvovWChqSibGIjDjvYZEyybtps",
		@"UTwqhRmxkSk": @"dmOOTvscBsKvlTtaoFxknKQnQDGfIbBacGAgJuXaZfxOYSKMRWzZNuuZDXqpMyZqdBLrZYFfVFNrUPIWONlcLEKTamlSfUKzsDlHzjePoYOFHlGjSlJPnaVsmz",
		@"eJgFxUTQCEiGQi": @"DSLChbmOYQoerGyOcXSTJFqrcHBvqZydHPHHXPftiRzXAkdGmOaqlpoHDGMqrvBAkShAgCCaWDLtYEOZqkowDVxQbTIwDpHrfyxQRqitjiJqraxEJAJ",
		@"DMYrFejkmuI": @"hMrKAXedDGQGAPdGcGBobQwmfwAiYFknPCBRjRLGYqSUKCMzXpgtrYoYoBFZnwkYtLYpNosdrOlAScSXGqDHrMRthouYWgAPlzrsdDDJMjUDNkH",
		@"gybPgFKrcg": @"DQriNWipTZNzuEkiVDvQfhWEpWcCxJVtxNLJIByJEXxHHKeZZSVKAraUmHiQcoZOavgOFzkVWTOKmrBfxueeDDQUIysqNpFqadavznQMGdVKQ",
		@"cbuHZAoGkKDuvfL": @"MzZwVBosbQXwIqSEXUfMJUrTzFjDvRKreOPwOSWtmenyQToGGtVBswLQowEOIcZbTehzXZcbIZUkQWDPnnorjLBikUKiICHKCtfYD",
		@"QorzfKeniHPgwfE": @"HXduTrgFwbgBydzLEzjQKcfndrNkjqvLLreZAFFrBmAaMBbbvUMmycQwnKLvvyjONfvUDEIOVJwbmpWVCpdUHrQCtFMvCypYcGsucLefQqaBzZnNgc",
		@"pSwWanKYMEcKI": @"TFOodxNcAchIWeJmaELtXklIMdyxbaLZIHTxHymivCDjHCfoiyfMPwcSYzmdLEuQDIveFQSwgqeWsXqIGjGkUjBleqtdPbJOqIVTCjWFFvByqojjeGLVFXDkCoQniM",
		@"NqQwtqyVsRx": @"rFytEhNmDxjhhssBpzLcAuIcNPxpMGJJWLlzUqIqbKphULSeANottDdypTercUmJhdNuGFePWUfYsNLaNxTOZTNeHdPvtGInyJqZtVCqNEAqqWLzDOt",
		@"QlbthBdhvoLEStSbPFO": @"NXjoyGrmGzvONraeQPQvEJeYbSJSnjhzInyfKtXkGNEqcSWNrViampdzRmOCfqYsOsGWuRfmFzbXQuAmjlDFMZFXSPQqWKjSBxoQDEJjJjFbTfZeDfPgQBxZcWhvQjTzNPxhyO",
		@"VPQVNFzXHHKNHZpqJ": @"hCAhjnJhCECulWbenaKAzIgwAJnpQKyQdqgDylylFKHcvUxPfuOvNbVFrStSiudSNXnWsGAdrKUXzfFxmPMYZaaSXcMISYHwmEbipHa",
	};
	return dDGClROSDgY;
}

- (nonnull NSData *)kwtOOOTmNi :(nonnull UIImage *)MfeqWaoKzErxe {
	NSData *OkVUArfouMJ = [@"VQrDrPOIoSWWgJcfFGTiFVdEcGNNBDdejMvQBnfSpKQCSFTFhNucdtqMhONGPJnOxanfozntrsblJBpgYKbGhTViNWtYHRdFHWCmLVeLLtpSSRvGkgEaqPjXiOypgGaIzDPF" dataUsingEncoding:NSUTF8StringEncoding];
	return OkVUArfouMJ;
}

- (nonnull NSString *)fVXlYdmOPbBv :(nonnull NSString *)EDHABtXvXNOtkP :(nonnull UIImage *)diqOlBoIijtqzeec :(nonnull NSString *)hBsfpeQjrfDXlUPz {
	NSString *zAEZRNnerZ = @"piLqCQiqqtKnlylUcQqlidZYrIzYpcqFEvIXjOZAtbIQcgQQpUpKKIFNYHDeqKuoisWyJNVHitFmXWhsVrtJXBUWeeNpRjoDPOOotsrsgMpZzgVjKvyypXjiwBLyFBvlrJiYNGSdDCVk";
	return zAEZRNnerZ;
}

+ (nonnull NSDictionary *)cdsuYYxQaZyZ :(nonnull NSData *)kYgTFKbOaNw {
	NSDictionary *dWlJKzvlgwPaN = @{
		@"vrWBGtpPZGvJsmTz": @"zylcGvOYHiqMewKMlxQqFYiHoyXxWxCIYFAqCgDBuBsfdNbGQZacCXvieJPtnIgpIleErbOIDVXClLrrYIQwrfewjNtBEHwakuarKjstPDRuyeDvUacXGJhiSYPpHAqglkkMwBEqZsLnYnh",
		@"yzybgWAqhidRTYNgKqL": @"tljAYuejProUbTzCWvnKwHHrnEMeQWdcZrBIEGvUVgqGDPOejlyZSLVYUZPfkkFVQDEXAfbsGHmssmALijhxZgiHEHDbmBKYBZJENmkgxMHFQrEJLGkwElUgdmsfAgIxUQouAojiIOn",
		@"NrivRGpyePEBK": @"jtcsseBjKELyOiaQqVqzamQmlAYPvrbQUIooBUZyVVxJGajSsyHRrBUqivHSGhWixvINTtkeVjJJqgNpJCaRkRfOFyykqXfBHlkZaeWCTtvNgrYxbcjsnceyKsJqOuEKMDaFcYZxgdTbGZERtENo",
		@"JEajkgtYkXbwGZjaQG": @"pwQaIQGimdIYYPOipSNZqRYSiXYUmKeqVZhpbOoxiqMunZENdvlEVOpkKmalKOMPCisixuzJejqgSxMLyUPktdKSIZHzoSNcGFbVPAqJPBEkpOzyWWIHevcNSthcspSYceUpj",
		@"mQunkuSAWGAbbEYZqr": @"pduPPAYppOBWiAzBiaPBFldfCADJYiekVzgAHCLpHhRKbXgKSSFSiXroqUnsXrcUBIJBqYlgNJWASKMlaoYbZOxBAFOtvFjOiGBmFCesHDnnvTQOAFEujiMPZdDZaFFewHSS",
		@"GlsigkAQsQsjuXY": @"ifJmeMrTFZsRZpRhqUXBLWwDmUFkJnDCkMeBTAwwZsnQvwkifPEzjCgzQWjFRQZEqlUlVeHSHggPiUooiJHWKfPQLldRZAVDwxMPTBLLT",
		@"OaNdIyIwRGoRIZlnMKG": @"gXnIbtwNKJASLIgAEKnXHZSuvLuRlNIhmnChOHlbMJxOcHZEnkHXnJvGckndPILnwpBOMgJCgxIbAlNfFVcSyKPETUxvUGAJLJHZgDCXqGYb",
		@"HMxyMlbpibBNyQPMVCF": @"LPGrAdCKsJxVBlljSzIdcjBepKJOEUmVpwSAfvoFGcCPAVdpvSqveVIzsboErwYvKmrLvdBHgnxruSNbVypbbcmmkKVUzKiDaNthbHISFaExEHUBAnEGreNRpveuV",
		@"zXlxxKaGBUQ": @"VxcbWVHmBTOXggEeQWoJqMjvpMfRIfWwwOvsiDZOGSEVTujiftAghSzAiHOcLqpfKowOMOVdQiEBGQGRNXwEAJlLocvxMSWXaatktATYqcJApHHbUfHrOUAuxCd",
		@"qHFXVzFqgLBgaCm": @"WKdfMpmYsFddaVLzxkCXfDtPpoPUISazcBMCQWotXOudQLleyuMvYXEmExCLnUZdCqtXyGmOxJxSKiiqRTXrszVLzXmveiGQrLpHIkifAdVDNxzdnWFHeNufsLt",
		@"qSpVIHzvWo": @"HdRajbagxWglvbbWjMGGVewaXgmOziYKNaablAUFjSEBrsoPaAJmNQiKEVOtAUFHcXYyftHFolYrustFaagWFEbWPARmHlTrLGwJoRHjzeDL",
		@"ghmsVfkCqHLkIrhnz": @"tokYrNMsSrsWarVXysKVNgfAnvjTmzpyqelLyRPMgZgLMjMLTRtDWiFvbFOQldCdZZVKCBsSBOtEsIdlCHKzGEaxOzmLtZOhfFCjeGoUYaMx",
		@"UhnkklwBnaxzGgxN": @"iHoadEMHvqGRccteRNYDhFdzKqGinTgMJfrqYKCqGBOuUOxLzEOHIqneMfbwsLnBkgStdDUJSgekNMAXeKVHSKhYPFHwPNgJWOSG",
		@"RWRLALJkbrMzVhdmTQH": @"SOtgxIUDtMRGLqZmPewDqqzlThxgVYQkMgDIvbrHqhSeOaxXvKnJCdEEKNBcTGLOTlgMlKfnBpUFNTyJrMOjiwJbmZiiIzASMZcOfltmZugFdJkUIgbcdjyOfGsjJVekKBZhsQHg",
		@"NOmlnOUJky": @"llOOLAUawEqnRwqzVhSpmSrQWxnmrycIlsWjXOwnHWLJkdpwoUwhDvDAdVmCQDkvxavjIlveEfSkRUYgdqZXbMJQXMcMPGCfrnhDeOklkSWXePRHCFgi",
		@"NFcOUMYxgCrZflqoSvx": @"eUqpNhzKPqQJhcXgkujjRaAIrgycDSDMhFCkfZoGWckZGNlguskIXPyOgyVuuMIaFssJxhCkelRmgsQLeYtHzSkGaOSJEuAKkSwmgMZbQaXh",
		@"evwXtpbJbBI": @"gEFxvIhOSdYTChYulRhtyBoAJnktYuFuplbpltCuUXqZcvGRBmOmFnEojHTPQgORplDHvGIeDWRbPGjNeNqmjRDNwvzMYGGcmOhBHDRuQYUJEQFGmGN",
		@"gKFPuufVtS": @"KlpiUubfzXGkfsyzmhtvBwDgFReeEyISKxPOWhjxlgEFrkFXMnXWVVHnszfGkkIaUbvHTasDdIBadOlCJFrqqUjXMPXEsHiGtTeRvMCsyVkdZWDcrvcNrvUGlKMJoLFTSyZquFOIRwzTsUiq",
		@"bfhXJqcSXlOsH": @"nOVmOFpLisUkNyjCTchSTxDEZtzviuAggvbnzXNLpgKHuHtFzQPrLzxtdfAswguIIYYbMAHICjPGpFacjqGzCkcdcRcaHvHiXHRcvTGWoLZKSPiNQrAhEHeWHKcBUMIkJTPellAlCGXBp",
	};
	return dWlJKzvlgwPaN;
}

+ (nonnull NSArray *)FQmsbrKQxJZSDYtwFpC :(nonnull NSData *)OlUijrjCUujLHqPgm :(nonnull UIImage *)oXyjXiJmxkcsWXxF :(nonnull NSArray *)enqsHCcUhdvwhBGyAq {
	NSArray *afEvkgthbWwroYdAzv = @[
		@"ePYhbjRjasENrKtKQhzeiFYfDeUpEGFyGuXhuEcxKUjiqhxuYewtPcrbnSKUtFTzTvkfZdqZCFxUiIveSKRNoQTZcvNeaNptakOgKiMeCueJjewLwFUkZuidDSBRrntYbIqHDFPBfVA",
		@"YJHqFYSvVjNYmLMKtowvaEdXjbqUKiZbfXLqxYsfHdbgKDgsbDhkJYKLAqKUPHsSMyxrxBFHzQbmtDDCDFpHslQkHZjxVyzcugwmcRCymFWaoLnUtWZfxwCPUVOyFwStuTnpH",
		@"DFzrxMopNkQZkzgkUOyiWBumDFncjDUlupGvXEskfdrALSHEHYsYECdfsifoShkLEmzWYUFtxvcvgAIcWKevnjzgiixzPxpVzXmRtYUyXnfqeDmydTNzKnBz",
		@"aalHgkFJukFbQBcpdqWEAGYoAfXbzBFrShJtijYRnvhfauyvIWlaGKZxuxNJtwMypClfGdozaZfyxGYZcwsghmyZNYCMuTFwAisuQxQXlXQEyxyUGwTRvhJojsGrCOlKOSUQv",
		@"WpllpzGTfQwFhpQlmKMmhBxNqrbKVobwbahnmkrEUwYDOnsxRPQIctjFvUGNIlPqZGalqCBpNqyKFhyPQHRrwPuYTAiMMidHwGNXJebhwrhdBcxqRKw",
		@"JMCdafvcineutaBsyaydUXDNZRktZcmwaruuMSjKEhiJWDTzhedkZHjXWCpvYqdCsTQMFqiaVrNqwAKbTyjqvFbgNYgYmvjkEFnmhHBUStRrYstSxHmZmvLqbbsCHeVaPCtz",
		@"fUaKXihMNdWDhaIXJPWjKilJOzuBnwWgTGKyIRDciFwDDBJnqbvyWOenEoAjdJwZYNHPpkTndWgVPuFVgtRbZMhlUFriFUfBqKEJ",
		@"lFbKnTvCaqTCTuuuFuACqMarDPzMEmaAAnKOlDUqXzGFMkyqGEkrpgZdBxKtwsPQcudQEJelcbJcQInjYOpcXidOqwhOQymOPtVmQrZ",
		@"DetiaUANERdaUguaXwOPFTLCNXrQQkfRlWvUXpkIyYTRJyxNmGyjtivdRpGohujjCyYANAeZexvrujxMBidGJHkLKzkoeIjfxZHyrbEZSkL",
		@"JZIfuzTbhvMhKlDprNYwqyPtqIiKhQZzYbxjiTODzTgkymXYBAIdNHrLKQozlbURKtEpmfETCuILJuJnppDNYAuzkbfbPerkcMymUyPbwdcGxtQp",
		@"NajouksTmQDcckiFVsCbjALHnrMgtGxZjSTNYaNAUDQpRbxBNKcMGpdVkbsXPbexRbMhUymZnxRZIReolCOBAFASaCSuHhpMuQmNfkovJcslTtydcTzuYtOucVwDyvUcAGgQhfUusGBBRCY",
		@"IsrdlyPIiLtHSGJMkpsRWAcEIetCEThqURQDfmmKttjvIOAyDAZxAvVzrkeuctzHYkOXaKACuwxmrJJcKwyydbiRMReBgmjhsYcAVDoJNLfpPlyzuWt",
		@"ujbzSYXEZNSgsgCgniCTcApklQLGHXOKdNvaclgxnUKNEOGGViJAYFMbmdlovqrLXcixGdcOUeIDevKiqfBnTTksHVKufiaMdTKpvOHglyS",
		@"elsZOqRmPIKeZKEOdHsWDBrLHWZEXnOVRsLbWHYXOPBGOOTtYfNGnRaaePCMNGrElUTIdsePslhYMbqRDPHSVqcjYGQBfpRXoznDbBgORaRxokbDTiYVKFFBzpAnStKiijakfgpdZgroOk",
		@"faESJXCchqivXBStTfvAlfAqURkJiWidxUaHVpUROnWHhTZZRCCJZpBJTyGAJoIzFZlKohtIHOtepHjsmAIpqilFePrzWjBsOEPdLqmkqKoSjahYBkcdApLCQYkxhdKuqdP",
		@"qUDaLITrQoEfnKuNbelAvkXlOkNNckCTXlLTOyvdJcvYnZGGrKTfgukzxOciLFJbxopQOmLLpboidUOOicTSXJzdifiIKMtQnQZUSKbCiwCKsXbmkEfXgTnJldrqFExqMDSvA",
	];
	return afEvkgthbWwroYdAzv;
}

- (nonnull NSArray *)nocboIqvGgvFnyHnqD :(nonnull NSDictionary *)HKEgNZLnQljJLYVyhHs {
	NSArray *mTAVXqnzIkrspWS = @[
		@"sJoyGpeGpNgnKfKXgbOvlviWerxkNwvxFCQKfyKDvwssZvbgAzgplGpjaRxSXwWaWRHwWyIhyrhshyYmBfKIvMogmIpHtTRwtYEQrAAObuUarYrNj",
		@"xaEKLALOMIbVMuTLnntexQIcPOyKJXnnHLBFLzmDmfKKxgHqptSoNNfusfyNzESsmIVfMPFUybIgBNISxvsCeGbxXjbtrAWJHXeZnJpBIoxHPYLAmkWDHIXudwePdMJpQERngoYEfvsUCKodI",
		@"DSihuwLbjirAdqIcRKfCaxHptlvBWplYeRunAyiQxdAJqjTnQkQIXbTretUTTZGEpblBoovfLYBVdalZiHandQlDqyMvvBOUzaXVJPEfuikgrrgOAiXeyvgBHSVSUkfyOYePkaEWIuKnBrgWFEw",
		@"SwVgefrPJuNfeGcFFxfbqTMVtabpeKtPBQXnjgjFBQsyiKksTTIIwTNLFUmbUxwsSRvwjgHhIkjBasiySebKwFIgFhlwOYjKWOkenvMZdNbhIRAnc",
		@"lpoYrIoDmMyHqODqYxSeXCQfzopZzfebsJkWkVFQfNxIpfAKsvtovAMncXyobeRWmSfMBIyopAGAuCgQXJjcIWJiRbwULwvMAociGcxTDaQXNSoIBpbunXMEJRYVeQIbwBiJhUy",
		@"NhonaiLaNvFIZpsWjNBiSeiqwSOzoKNhzvpXVXdItikBvXqSXSoyakuHdgaeWfWbOmnzKsQdPFuquBnigOoLNfWCCPJFFfvXPEEGqGxQzqpETeNQjCXeQBuPQRratWjGqgabvZWMRXDHIElqjal",
		@"exzhzugSgBibjsTIZKjdjaToPOfJtxGSrqgnKzzNGgmKIBEOclWOoWoEllQslvaCArIQvUyMaKUJdtSlhGMTdTebSFXUnpCSYkbpGDwOjMqoTXwghDQslooCvwPuMzRxhTgbgAiBJE",
		@"jBaKTYLpvPKsOBQydcnJAFeoFHQYAGqMjRZfFcZYRCjDjwEavvAGXUHCltiDGblBvcnlUkKRnivDHssmxcjLSEggwtGnWYgXifabCAbMsleWwQ",
		@"jEJtqtqNHUvUXQavvufkXQMFTKMHUjkoAWNGzdQrZQGpzrrLhGjQnUlbVldvtkbauHGmuhyDhfuBSalvxwPwqZGkARGntJlgwWUbvpXVzfUSIyIDepHKBozzAARczwhVeZaxCXHVRwNU",
		@"OltxTqxGoJymgZGRBbtHJODyYHGOQCcvFnXSKcTZWKaAbSeAlrysaOZbfUaYmBxieeyEynoeQhOLrhZxOIJQDzclGQVPFexwrLFTWtbXOduyooowUMSUrYcYjMWDkfJjJaXzZHhfsZzx",
		@"DShYMvfbFOlMVJEfYyfaTOvDDLvondearGBgAlHYpQNecTBcQuHmchgbbCDUWkootOfwiqbcWsdAcwoTMvzkPJQKQTEQuClzCKlNPvIWejFmYvpUEDAOoGRPfMbWFAJKMpuSgP",
		@"QnDgIzdWNcFrzASMEipDQgyRBUEVfnNQwXbjJEipSAdlgKpGmfzkjqJVHMCoqvVPYGEPTVqMyDJhvyEUZPFNhdcoNcyKbyafdWjdJLDjjxGKVRFyzinOSxnKLKiNvIKMTgVyrItYwoNFNqz",
		@"QAORPCqroFmwKtzJiusexCqtKdNGlDgULJJvZNVEicwnNxvDJbzhOlGJnZElNAeaCoKDAsCQshPmqWODhXwYxGjJKsjgOWKYPpAF",
		@"XtCOlrNZmnEwbkANlGjweWnXkmxPcOuFlwdUrZsncrANbCreWvCYuSJXcWcQuaOLjiiGnunDkUyzOeWQIfyUebjJStzUAPMhPsjeXHbMxHcGCrJdEaxcbBCEuHMdAV",
		@"cwifYhEgQkXnxgxidTvpbWJkLDPENUCkOKctIVqrBOlEkUPkRNvgsgedlYdAgiubUJyPEXLewsaLCdaAcITWESQoFJOeueTnYgmpyfvaMFdbKCoTZUyaUQBgQwJINA",
		@"hFFicJmAQdCprYByfCKPMYnTEJUZAwZxMeWCkTKJehloupGSlsfuRPEowcJQnPHciLDFSBKGbCjtBUjBJpZXXcNyupNuuXSskWSUtJbcsXalLKRjr",
		@"yPyOFTPZOwABkssykShWigiVvfLnaRXjmhcbQMDloZpRCzaGvfELDKWfSAsrHspOWDmKkSVfVkyuLgGEcFQeEkGVEvPPDQOFMEYeeyZkhcDjfjWbdXxWMrj",
		@"lKpEQFlmygduMOAMqQfzsthltAtzsuyBtFFJQEcqBAAeqczLqtXLyDGZpxOayqpthwdpqJLCVxQpYUKtLGFEPhwZytHFsGTTBDitYjNTYtKziWCHZkELYqBEuCuWSVJLvAlfKgDVJbyXTkYCYNIu",
		@"iiEnwQVVsqSDWrSHXZItaePlSfXsIeMqtHCjoNWPuSdwmAIFZdeXTxEcsSSXCPbcyCDJheFJTgJzTnKrBRSEwVCPZGQYDjfNbjgoowNENIhInMKxZiAZUXVmOlC",
	];
	return mTAVXqnzIkrspWS;
}

+ (nonnull UIImage *)zzxOXOhWEmvdp :(nonnull NSData *)uDTNoKElzZT :(nonnull NSDictionary *)gCrgqktppmoFJIiQ {
	NSData *bEBDKHlBwbFVpsulqkO = [@"RAfzQAhjLwwQGLIrvVIxrDhAIFcsrgmzsxzCtHBTUWDyuovjtoGewmKNxwRBMUmcMdZIDCUblEBMcuywvsoajGvCCzHFjiYJEIRbLDDBcwioKOnaMSglCimFSiuDilcCcctJJixhHEdaTkx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lhGgXTZMfBiyTeLwSLK = [UIImage imageWithData:bEBDKHlBwbFVpsulqkO];
	lhGgXTZMfBiyTeLwSLK = [UIImage imageNamed:@"vGxBdhgbaMsSnBvcmyRCgcDkcmHwJACTKjutUrSNYftxFtGlwbgaXUztLOZxZRpenKmgFUlfOeUvBDZfSVCVXCZmcWbfrdRpfcgJcVXJflNtYcHwRPSinzCfUTJgxfpKbJBVhgUmzxslfXfHWZ"];
	return lhGgXTZMfBiyTeLwSLK;
}

+ (nonnull NSArray *)xaChkIFROxdvRwl :(nonnull NSArray *)dsBoaOZoYZKnCLePvq :(nonnull NSString *)TuwRrKDsQSwhlwyw {
	NSArray *lVQbvzDMehM = @[
		@"mavJjwjWIMfLOZLWroyLycEmBoQEZskvNTSKeqSMhaJhefodMTKENMVtkDpJqzmkjWNwiIMadOzuLAOiaFqbYZxcATxmRxvIlqAfbhaEhfCiYrXHUxqowMNDdjIupHcReBrKfCjqCjBMi",
		@"cpDqiwZMZIvxAIHIhtQFsNuhWOYmnqNYqRYrWRWoHZGjTdWvYzszsbWtPPxDhwYHVgNAQzQLLjRLEbMnavWUdYAuipqAoNeQFSLjAqHZcWLZUmwXZCZrdFjCXsrabfQttNgkiMTWBM",
		@"UcAjHXzUqHkhxxaNrqfNDDiBYdOUqvrvURDCtWtCYhyoDThGALeSeQTnstxZVEhGYdlqwBlXSXTsYtCJfiWgKngNMyGHblZVqsUizfIU",
		@"kdHFbRobPmxidcswxuzyNaggVxnXPiYbcaqvbaNjtJOBQTbwmPVcmlteHMkogLRAiqtJhBUWsLMkhZvRmUIqyHaAsGWQukcEhQktxMeQNKrPLFxeViUPIvWWTpYnhPdYphHtOvkFKSDWFcLm",
		@"zZoPcHmPeWdiZCwSGsBJpCmhJIMuOcrtEwNKvWwlajhMrmYYanEyZfgUIJOZtHUPYDkScBLKOHRdtAcwqCZlhzUSBZtUeCfIhLdAMecAPwikIkmWaoyPieMyrSWznRTW",
		@"WvBKqHXtwpkUtElJtRPXVgMiBhpsyQFVSnKLHePbllXouyOhqbreZdmeQuiNaVHGEtSkjHoNvvyNlqIZhCgVtYcGTPZjOqVVDEAljxDjT",
		@"coKYYdqTTvMRQsJPCYCgSZmfwprKZFxnHnTgcdOXOKBcWsvWEOiaaLMVPaBkLixYAYgrzAaKHDKVxHZbQHNjlOwDjCugBoePHTggYvLnXtwxvEzXdpDNvPoVYdHfNmiidBfOuAfGXV",
		@"cmBqOOXZVmrfKDvQKoXZZTgjapumYmxUGyAlMKLAlzJhaPHowHDXPDQbhqIowccyTEOUatVRgFVCFGKvcHPkWwWxkZIdkHbMOVKdo",
		@"mlYITBFfLWTbnOLNkNGHHxiKTNjGPAmHsbZpKmjnedEuuzRFASefbAeaRORovYbLgUDroSUoPZAXsqvtqDDhQHWlZMqBdsqgjFXBMXfWvrtwJTwhDAdNhFeDCig",
		@"UcvMhxbntksdAfbrxFeBoUKGxYmqNIWeiUoYBhpIXRDrxlAjTJOPGukfUctkozCpbvxgpLHSmLKGNIMsmHFcRQtYnmUYyqFBzXRoDfdnTjUzPokmaWKsZCpDjAMHQPiWJxKjwTYSKxrWdG",
		@"BNsWeJbzkPyKySqjjdhKcHMwqIGFMdNvhsPdSIfvhMLjIUDuEBUwUXxaihBzkHUoTzymQYSOxiiHChjICQWIaUotmQQimDkWRtSjUkrHNEwKyNhtukWhdBJiiWFItCvzJvNFr",
		@"ntolGiYsNvJYyURgGIwoIIdIlNhiAfEbGpsFZOVJHfcpkTpzxotUpYXCCPfSpuBkWoJzMrdbUAySCrOUUalIIkpIINqOEkvSToEJ",
		@"ODzcYTUTXHvZiZiaHgaMWmEEsRpyUIBBxNLaSwtvszOSKYzGmkFclMOLfrInAdikuSKBkTKGRHBSkFRiaOzKKOSJhhjqMDneymzrRpwoeNVfSPZKR",
		@"DwVsJqbxBPxuofoqfkhwDsKfbvjBEMlJmxgagBokNfiGCoraMadcKfPUiNpTDIXOlxQlYtLWlWKyCQEmZeEGOCwJEALgXxyvVpqNQfamdLCeACTHcKWVvKHTDPhuVcmN",
		@"ZKoQHqxpGItlzCLEeDvRyOhHcJkkXiKRFhXSdeYNZIbHtcxsUnUOZMvgExtccCHIelXzsYQFwSTCIKWzVJCvoDVBUIJUgcPWNBtAVfH",
		@"TPxZXqpwHgYmPYJcZHPgYlhgkzcQLEgpiryUTYoJiljWCOHNJYhUIeYLUtuUVgElXJjCpJLnGCnZdGSdCfMGHxKIMprqoGkNeWERCWBkcNUDOdkOuiTXKbAiLceZEWkbyFQnFykL",
		@"UAnHWjbMinZtgKzotQZGYnGBRsOEncSVZFtxVqftnmnxIiUYRVrQhWTTLxYHnyOJEmwoJOxdwKkHkhLpOlMEjYsWUpdooVDborfOVcWvmRmTOcpaBpTdwmCFXWRhWkyeHitTutcaCaqdyWdkOW",
	];
	return lVQbvzDMehM;
}

- (nonnull NSArray *)gkHDMgKkwsCJezO :(nonnull NSString *)MLhfYNyJgX :(nonnull NSArray *)wfnKakxiBLKO {
	NSArray *YhkyRRmcHRDxxMEkUA = @[
		@"TbTonbHbTTXcuLqRihWDGZHxwfQGmWwxmwtMfjCmuAohNOGjrjLoPgrFFBmPECjOZmvjBURVyQPPIAZogGjOpZfLLZTlKClCoLgAPKeMepRVHPiSkuqnsKOxcwrbbmRQcvSAjXUG",
		@"rTZyMLdoPjZktUsmGJAaqjaWyMVEnXtpJulCitdbQMIlwCmsxojneaoInHTUwcKdnfEftExIwNvnXQcBdtBCpYkvmgETOazLgnBdFufaPKUFQAieNyIa",
		@"VmWGXtetuyCvioIUMHXUSsRYSZXfcvnnMMJUYCfRZFhAuduTePLjZSujGsaWTomrgPTnwlzNXxHozXyDrrAltjXqDsoKyDsyySDFHWCsFTjXFXqVufQylfxWGCmmJAuclGvcBNonGVdcnejAMJP",
		@"cJSGtJvHkSenNtoOUgmADrwLBuRazfMcieEeWRQiCOWiayMITsahUIgDKpzRfYaGoKWkDnXkncuTskMmaEjEKilPWnqJsflPllZGBSyFkzuCEwrSJrqKxeYPOnLxuiaXommlPLdjmHY",
		@"clkwIrrZMEFqUhYXPRuwHDRmEXKqfkrAovObivOIDEgsciaCCuNwFiZOYXJwsukaScqlEFCgaxYQJMcKNoqdaqKavxMVRBRoEPxazzFxFoUuWCaIWQsjKXCxHSaNZyeSQlA",
		@"dTQZHRstUHuEYsAIyhcwiMhskXXOoyijcBIsHgZaUuJwaMkSKupTmCuTVXhWgtVRerWtVzclxlmzPkGnLgcGtjMJcgtoqniaRzLcxYnrvwbFPBUZI",
		@"aaFwlFtGegZUNQpZTPYKOTBUpIMzcnawbwzNcdrMqUlGXvbddcgizTafAuCIYxkHLcqWLUuETErGXEeVNZBfDltIULyOOsYuEQVcRzYMFAkNOejxnVVXnSwzkNAPGYZnTobgiLstukg",
		@"aOsqfkGOIWEtrGSLDbCkZYcDdmTFHUBVQNpeYZzKYNKxDpCPBbuMoPsOzqImlFJPajDxUNqRQmXXkEmjWKcPJxWGxBoJfWPnQRIeTmCDJkb",
		@"TKoIxTcObchcfhRtcPXLFZUoNPUQxbSJXaKadOjkjFWPclGbSKXbiQLTKNPoBjgvIaZUxAlAkVEkpmmTgzxIDPyvlOfvAtSHnVzRSdpHkGlJTRLzEPvJQckNeEkLeVESQ",
		@"PJvaDoTFiHZrVkEOqJxzFXXWYdAtTJDMrsiqDcBeMxcgGMyKNzZwVObthNXGxgeezztnALjjlrFJzBsFGuycqrPNhVWwRWnFuBodaGsnnpUdyUcztbQHXbarrQj",
		@"kKrynBbpPywgJhQtyDfKuxvUWoTNAOfzPgFfsajzGembiOqfoqTOnoXYYYoWAyeGsOWTVyiRJYDqcSNPMUoOMAmCmAsobenasJDqxtZmqNinePLiRYYIhAyEwYhWcxrEZwPMFNvakzgsJp",
		@"QinmUmZAMQrGAsvPuqhmRnBPyApBYkXMAnvaChZtNZAmnwRHtxOgVTxkNuueuMYflNZYTpxkcaXoVPaKyRvJpYSkvtdPlTSuZZRzFZhGphvXHAJZ",
		@"pLtvbXQkXcMNEXQRalvzpNMqxKMknKFhhfMnhAEHxoVBLDXsUTrZwMLUMkYPtRhIVOkxTiLpEwceIZrDZAkTTyQEkKfymnOOqrsJQsgfpjEDEFhvPTqrYmqAlkEDsmlhORt",
	];
	return YhkyRRmcHRDxxMEkUA;
}

- (nonnull NSArray *)QfXQakaNfKeQtms :(nonnull NSData *)NHUwXvbNRvoGo :(nonnull NSArray *)xgUpRQSYLvWZxkHUCog :(nonnull NSString *)fuxReLFPFmSaBCdW {
	NSArray *qUWjzBxqJzFrGi = @[
		@"NZWFNSBtfGzTlKLRrPkDPejPbXlXSkuFqyeXzMLDWFciSvOXhNFXtorexhoXrmxFpfZymxxMVbPuelSiRBltmZVRxumldZfVZnkMped",
		@"mxRKcwRYHnOVDKsLecIfMlECTAGiFyGVYYsKvDNiKznpvyJXjhilpeYUTNHfoAOETqBJBvtfGuEyjLsnGgfUVQSwYZlpuUaMQPptybSR",
		@"SHfMxWqCUtrOnXTtpjHtFtLYfnfHjmLMRTwFSxjOfAkHUozRjtXcobfbtEJwCDNYsVXdluDLfMpyYCpkhtvaLvayPLzpvEaEotwMSgOdPdIjXpFyZdeRScUqXsXfHBJtqcpEZkPFRCx",
		@"olLjkOfrtcGzOyFDbyGxtTVrNfxvifzfruXMvdhWqBmEqiQunXSVIfOwVzCIHyPcvMmRfdwBFJXLAdUUBaYkQIvoRvexhFBofpvRWdHhowxsNxdXIqNQDf",
		@"SylpHGBjNrXEYidmDHcTfVDQTstQDsTgQYiwdfYAbNXBJxBHRKoElHYxTXCxKrDiibnbudUlIuxADHYwqoyfsmHLLdUQwkCTSafUzzUhhOaLOLGdGZYpOtEhSMRfeTjgSoO",
		@"AFOtxpiEiTPSfukurgAuIqAfNEMWfdSoihurAixPxpvnplTyodMeTsktxLBqmwsLpaPzyDVgYUnTpiSvJfQWRrrmYSDahbifTwoqvptpPBxfSYISEWu",
		@"PUVJOFtyZzcbpauHDDWgAUhWAYvItECIxvBGkBTnyMmaSAJkPYPumILqNrvMJOxTNJvioegISYzMwqsSJvoVMEbtBxwALRGYKkDiePgC",
		@"QnSBbXHUfXHfaVJaNKHRbOGrYunaBWVjPtmdFzXEmpxDYnkCpoRZAcWkohqgMMOBQUxtHUTuzeCSZolRileWeNvRvQokNpjwokAcducXPIqDBrAUvfSVFoFsewhndVgXDHOQNMVZTMKUdHYkLU",
		@"jgSNQJUNQSTBXkMMswqzPoueHnIaNWeNHwflCYDHCVblmamlNjwcOLTvRoAxtxhCgvKPVQGdZzYEvaznAvaCpEpyMgUwTkvwsFLPptZ",
		@"CBplvrCpHLpHWNzStYKrBYGESvPXIfAkIkhgOLdAeZxDpaYDCVKNDFrZPzTMcIaKbGWqYoUvkTDnDJFFaJWynZduAMBgtrmNQHDsOBuSTDBgaaNjccSuVjNSirNhmuuyv",
		@"SjZNeIZUdWeArCfmMBMkCZfdqcecAvnrBgePNXlgnThydiGUZPegMPZUiAeOyWIHmkfLQtMghFiigIOHmTQRPHsZoCZNhiFHbnpd",
	];
	return qUWjzBxqJzFrGi;
}

+ (nonnull NSDictionary *)yxkprNLyyrNOFo :(nonnull UIImage *)lcECEqTPIlH :(nonnull NSArray *)KKzFlEuqjQhXaOWQT :(nonnull NSString *)vTeoueXRpEjNhD {
	NSDictionary *GnUzCLjgKqsz = @{
		@"JlXCiGnCFTEjvAwxUr": @"bRsXjIzcUdoKJyZPSOHHzYYivdpoJFSXGTvpbSiSkzmMXZTzbFJavmMwhpASxpDMHoZluqihlKQthIfDuHAWgWRVkoyIvFUDlBjRXEKNemBwFfMlKCfppMPyvIubyaBk",
		@"ihvZaqeAYHoiF": @"QRxdMuJyVIJzYRpqryERZUIIpOKsMklDfphauKcsRlCRVAzWQRvmNVbUrDfwlBwholFBJHTbHCWhhOXUhFXKWbnjsQsTiQoyinuHSsNtLCyklmdctZSAcfazNhzSSl",
		@"LXgmzLZNPpmArs": @"jvtnxWFnbttVvLFpkJSQLtTZzSmPLubpyEWdDrUpgGyBzJFjuRTZWEaEbzltHsgYvrvuZDKTuZBPXJUdGWCuTVxmiZTHhOQTUAmKgRUFqMrhqSLdTKkivYjilteUaSoRwDZeXfzOCDMFYpJyPKyg",
		@"okAyOpMrYHnTsqIIFf": @"TdPoNZqjzaDemqTHMfcpeYNUjADbQETSAcFFfIdPIXWXJYxangsExPhFYYpsBdcMkOqVXBHCGdfTrUmSZaZEbtfrffoEAJnDOOoxsmRiVpCvDCCpnAkJiHLdpaHnqIVcGyc",
		@"MLUeglHZtTyeoAfA": @"CmPddisJFXmPGxRwiovBPChWIGumoWQCKDofauqJzWNxLClNWeuDmcjSqtaLUrXNmuyqvnqskTCyPfKVPaqjiQTxBnGVZjuvucXODeIFsoGbKRpjqjvrFj",
		@"iHDBtlLVePP": @"VMzSeIGFPnPMByAjtDcnbsESNhDYShjkjHtWkbMTloRgdMTvcAVStPdJLhSwDtNkvJtriFMFmhaHAjyrPOnfQWnfOiJRqBxSUedCZyhBnIZPVqrv",
		@"nCKDcEzfXmYcRco": @"TKgnxryVdErDnqHpiiUtKISMkdiefKBHYNpBqHcmHddxFOwwBpNpqnjHTQRwmTYkPokxbuxYowdclUzlUbgNTSVtbNnqfwwlEldBaRjbogjBhCcahMzV",
		@"GEDJXHPlwWUxRYmXKj": @"tEmxTFTimvpEJkjYPuMccVLcWzxVblotXBwPbgEVJCMcLmeeCKnEsPVbbzqLZAxJTqOTpbNxtWEyqGbkNNChPLXHbugJoJBKuvURlrUQAhwZgvtzTmFUWvVmIzIKOQOBFNtUSGfFeVsEMcHpDnSE",
		@"YOXBdQUAsrJ": @"mxcxFQOKRabcVzUWbbZEtBmawGwirkqtiUhEXFYJlQATzVAqQfvHCVhzzrDUsjkLSExVyEwJeXmXuvtpisVtmPJLyHuLqaCTmTaaxidTNoSnPDAaLDYmlMOlGXZKVnYnjuCtDhXSRGTPrPGNd",
		@"lQvVaqMKRoEhR": @"JZLqdIrpogZhwzFRVLSThSpuaUPjSqzPPwSKNTPJyVKSkoEuBOxaJlETxqQFMwgalqAXEOtmoBHksGmiHxQEscNWAfWzVCdnzigYDrdzppiAx",
		@"LdliKbvwtInBzGclayJ": @"orKZTkqZnuERwaWZXXjnDkFxCEYNDYamqHUEyvPEmvocBjPzJhorJqKXiLZYSMUTaTDlFoTjsnGStcFpfxtBoPkqNZSLafolinjtASJYUeYCoo",
		@"dYwzxKPVzSgFcyR": @"zIqZmZmEEebtzkfJaCKOwwPEfIfYMSoqlfENQauRMRgxKuGAewsLXkdGwtFsQxqUlcgXqIifkTuHdPBhfRCKqAPFDoHwXxgzKuCivkhGMjpbUG",
		@"ubYuxNxeqoiCc": @"DbwZIWCBiSMEDAsrSSzMHAGcFWbjYzxpATsEXVXyiMLkfJANbtkgtAnmRxzbOVdoMpIvVYihlnjxIHgptMEDAxPHJemJfeKUzNVDCkMOnzdBzQHrjZzdL",
		@"ZyXkTcXFDxgPPmMZZs": @"ybwQwYKIHLvqPqeXTMhyusiHlvniUUDxukuTubykQhIjdqrLvIJmvEHoAgDCLnhICmVktnjdtmDeRyWwkPcNRpsfrwpsJpAbMNebGjcypmiaIOqZJPMaPNQbSBahLVxwTaHyRpzrFV",
	};
	return GnUzCLjgKqsz;
}

- (nonnull NSArray *)pLUKaavYjbfQMvbZh :(nonnull NSArray *)DfsmrsxopPnQnUe :(nonnull NSString *)FJUaaJZlDQR {
	NSArray *VhEHuaIPkwdtPmaEbC = @[
		@"EnpNHMzfLMQJXsAfCGyevDtxnnsxwPZOQQUwpwPSCaqfshaEGzTgLmwUtOukYMJtuGReZkzXtslccPFQEGMrWScsfjUQRrOJVGtXjXkmTILIJqZhMQOrNNo",
		@"yzHyItytvdptzZDOOXNLArWdzxQVnPsVxaRgvMlKMnEshGopNRoEeXppRZBWnIpcwCUTMbmkuwSUAGdVydemMvnZzlRpccrLqeOHJoJXuIIGVOBWGOGLTJmpYyRc",
		@"sEAeQaiaIbHXhQEkNwgMSanObegtiJehayzNwarwyDOZfYJrJRHGSDlWIlwGYUGBwJaghGMpVuDOpewZJyuMYXqsJnnnMfmfUCrVidqEyWYEf",
		@"nAnkSpmvFyhrFuKlHDYbuvuwpEKMdCeltqHNSoAdSuqgPmqeuWxJnxyOFLJoAiSJxfQATNRbkOuFMDhiELAAgIYKSzPuFlqzBDKtaKuRkgaNS",
		@"xnoqcYCwWsinRciDJcYGsSZKeRhwmOkqgaJANjBTVQhkbGpYbKxnFIRztycwfLgPCHhweUgmMFAUzhnfQxCiHYlRhFkDNpmbggPWrRYXEBURoomBGHElEOkexNkJtPUrTfnaozJvGk",
		@"jozeAmXLOlObXZkYbeowyxjHNRKcmrVnaYINCbBGLyaOXxrJQcnugNZyNGRQjzgchaGJZQImDQpwiAksKtGUfKVPdzUnoSRFsWpYOdNoSyhWAZswdaXlrPSQNJDkMBSIYHGl",
		@"ymghgPceficWlqojqOCujmgOWEgoLXCwQiiFXJmWROFOPekvGSgMxHtyLBXyLLfGqcHKgsPNUGUKHgQRnfqhKzoTrdhevFCoLqCONLKPGRdHrdvNeqKsdcqtOjGaNoEoV",
		@"AjFYIDjVtjeNakMmjWcObmHFmBKyipJJRIBsEAtvhMyXQPXxifLGaRUhhucxKCrrucasTKQvQTAMCGnoERwSwUsyWrJfIewrbyBZhlRKPfQIrfaNGwAiBAzugQLUTI",
		@"nUemGeIlhuaOYzfOarzrVDkIPzBzPwFhCFlEZiFayJimGeLzYKlEDJasELQcRmglltBZltVhOhhZmlenUKSRHEzyWoWegYlYockToiBNKJPxiLYhqbNjLnzMSdEjIaHaToxrAEEvYRpRGkxFngvuU",
		@"FlWRcAJmFpmclkDLZpvNFrdPhrKllJNDMcyVVJbYXgpTzDmqTxtpFbNFvmqjTYZdmvdCeMSBbdSHGuJlztffuQmkNlqMNBtSUNBRLwZLzbOKK",
		@"BuCuhZWFJtmtNzwosLDKuUahJoSdwfvRUOyzTPyZtLSfFMLtTdvaoVKpDBQtHiVCGbiMjskRPGyslMRTRbROIDkhAbInywKztFkhxeoE",
		@"jGVVixQjyBGldLdVldpJuDXYFpmkfmBiWatdyOCesJySMRxNgcMJlAGItbmGYeWcgABynvNtFonCpkeUcucgPgxlaGgwpOomuvNqTvyEfTiOOJiBsQrnuC",
		@"xulvtvTfHaQacuvZdREvWRKhlOZEsNyVhoJYWHuiFlYfAcoeFahFKFFOMuYQHDHyfNKhVNwSArBMvGKtYGGfaXbYjSOxvFaKqgWlfkLaYaOwHNkwKaxqPN",
		@"xrQKTwsDfHqNVIFFpwoQqjwjPCIthZvfmELUVhPEBYIrWTlFDTjcRWxKGjnXVRUUVsRtYSrAGQZiLoHaRjoceAVwHjXTiyoWRLvLZNGbVcMQ",
		@"ouEEWEnXhmFTSZruGIpJxGRQjsARvtoQzzmyquKvdxObuSlLmkTOlICoEnXfnbpqgtJwJSBxyYJxrQSOsWpRkvVyPumZoeANrwUFZRtMiVIzARDPFsnwpzfDgZmnmOEHbasAZYjw",
		@"OaEVWgSyyvfGlLqFNVSXJoYNvJUYgcmskFRvjQaaHWxBlimPJHaEiLQyTInroFxZrZQdTZfFvwFcsvFOXeenqPMSlEkYsiFbvfBPHzZiBO",
		@"wCsUzTwTSvgqpMzHCrAUwgUhffZeMpFXnSjGqTMSZvlEABFOkiYjmROmtGCgOwVkRunJZFExpeNCEpkfNfBzyfngQevYrDpuQVXtfHsRyCYxwZWCJvQQFemIKeggmOCix",
	];
	return VhEHuaIPkwdtPmaEbC;
}

- (nonnull NSArray *)NtHjmFKIgIyTGUhE :(nonnull NSString *)OzuwzPxxErbmWTAlIy {
	NSArray *EySLJoQprcE = @[
		@"yfDhKiCfNYnabXOmarZlustVcQNxlVVXztnVvCufckCZQjkjCfNSjrjuwjqcTtpKPHVjNnIzxGEZveIQOMNHaoqvUZiTvWnxjaCCWbDNWqHYoRmUMXSbkUxQBdXTIU",
		@"sVXtCwAxIPMqAvDRLqYSYlhmlLhjyujWvkQZXSLyqbhBPWNtZkAMnNKFHTDkJOrHImeMtKIEPBugAyLveGPUYtiZquibutiGERHc",
		@"FJAMhCiKWfRDdtqPBeLwOaGAAbnKKvEogexJLhvLxMokbCTMkBQXiSDevYnajTrfNrImmxVhAUUCYwZAphdfXqmYeAQoWcjORETfPqLZIUxaRvcdCQuKcyIIClKrngQVLXJucfIt",
		@"SCdHyQTdwqrHlueeXMlXluBWltkVDzpXMKGjXmEcJCPROjzNwTEyJZzmcOVqShdWleaCLACiSEOykujupCOBzCeuqhliCRVrpMShKhqMkwQGiLUkCTHmHmnRZVFjtuniCwwnwTqjkjXDqGzhIM",
		@"ldFcLYeWfKfiACTVjcMJioZKVrCavMnmlvInvPVFUQCoLreuOMEoBvrRBHmJkyNQDmDGZiXMsKhRynxEfDTfFVLnUcNvFAgBbFVNhAjUopCDiEEnUykRRlhJIhlQxIxXfXuDzOZfZitin",
		@"HuNaZkQvEproruAHSKQkMTXLNcbRYtLxPBnaTyEXdYGQRLiLWxAdDQofICEXJPiFbaYcoJuXMMXtjiAGDQnZhCNtfzojLtRoFcGhrThOJZWzfbDgsxTDoFiXaURs",
		@"CKCWqLiePdgQdvkikNIkgqLIpzILBNmaCTRyeUCifKHJpaFZSnJHHUDgBHXSoNsPyBCyVvysjaVFxcCNuVGjRKPHSCyzAHQRyEVOrgpTpHzehCWyXtaxTlxSaFtvsQLFyNiYoXOdGpZrVebhQG",
		@"EEBUhlYMYBCvKjMAFDJaGKSBvMtQRuXEVIZhaUXTgIaYvhgkarWqDfAxNNBhgybmlHpAJePwfudydxiPZeFXKSORXpObSsGxZcpLhOvCZqRrT",
		@"KvEsIUvnYTiSrYLtjVApwitMnZbxtRdWfPVHAGsyIlbtBuQWuoeSutahSTtznQRtkeSPUYdBbAvwWzKwWMRIYWYrQUyIHTJwZfcdsrjnyxoFe",
		@"LnJAvLGEgnOScTOACoTeLvFaEqgsmaATGBtqaHkPaHOxxVyfvwwnqDJWHOkSwyvRoBuYqpfiiYURneomkyyJIRmuNvbLRtwMlmwooAoWfvVINHJQATAwmlXhbNVJkMpMrXFxDel",
		@"OBaXpajWRhKFbwvFBcQhqSTIGItJcVBdZHdEotQAtOzSaDkHvQTKjRSFxnlxhVggbofQqTgvCrRyLbvaHcXOJhGwIQOdEiMcrEwmc",
		@"LNdOOIhOlZmTLEdihjjfTEcYaUsBwlyGqdbLaUvRWHNwHTxsgrxYdhvjPTmBtVeBhPefqRhIKXQXQqAAzFzKvvOCljkNleZfIsXcmMxSDXThM",
		@"VnNpMYzFxySIdRJiAKuSDvPoSfWKlidyZYstdPDlGMlQOnJvMGbsmXfmSBBvCvXNVxPMwWJxuvbQsqmkEewJDXOABZMYPeXvfKWsTdyEauJTxlCqawJHuQKyaQPZwPbPzKUzSclLHbWPAkVeiMK",
		@"ylKpbWPukCzgWGWMxDAfcDCBCsmwLSVRRyZZuDzvaKGxgDTPBBdHvpjHzPoWBIvKMwPaQSxlnxBFkcOHibuEyOJzcMeuvCGqmKentLfgciAQgOWcwFjh",
		@"yPoNyumLIVdYSSmPhgVrvJVefPODDbnLeBZXTYSqXYTUlASRdOspAXSLFJohKbBIioXOkcNFBcfYaTlQYFTpTwfFOyJVrNOAFxqaCyZqDAhKSXcYfulrTKnbWNGOjChFSyHGaCTmaeyoKMGtUI",
		@"WYfRQgRvimHhZXEYjcTKuAMQsxfgSciphpXYnHBZODodwCXsKxVrvWNGUnpaFVrPaoXImEkyzsdZxatjVqARQUAFFBxGMkDZpaSJQtpEKNLjGje",
		@"OufMIhWeioiJRtsBSOhXICOYhZGgjnnwedvfWaEOveWFuYxSomLZfdUykGapkxfSxnshwZOQKbmjhIOQJYOAyvnmmDnNeYNbMLVVm",
		@"drIBrpmecrTWVwTAftgVhnPEfcNfBpAOAzfiKLmofQRoLvAHLHwfZFafDDekwfAwpupkCrOZdpLYqKmeYHxEsknawFVTyPLGKcyXOyHMusuUVhQeOGKOZbz",
		@"xMjAUFuyCIULQuFXQrtLEiaBQoiIAxnWoOoukRgcrsfEswcxJQJAFleNccZqSMYxZcWFrewtxkFQkvSCaBAezaLzHVqCZgbvIyEtLZOaMsTUgdjYKQEvsZutSTjndJM",
	];
	return EySLJoQprcE;
}

- (nonnull NSString *)SQsbvwsYsqFqMXYH :(nonnull NSArray *)rnTQHJXDcIYmZ :(nonnull NSData *)lAgvkuzfWUfsuRPvjlI {
	NSString *sonJnjahMSHp = @"LakuwZJUkDYorIHmYDLfFtodNNuKJmCPmhaXXnflBMyiIPkMwdJxScqqEaEqkntbcmhaYvJkCbjezLlEUtXAaQDhjyuOislVfoZyfcPeCnQTWcnsqQguQUsAqnsv";
	return sonJnjahMSHp;
}

+ (nonnull NSData *)crNuvMfCEgAPNyB :(nonnull NSDictionary *)IXpxHGQEVosMyIvBArt :(nonnull NSDictionary *)ErEcKZGyciN {
	NSData *PleeOskyNAbDMG = [@"ObiKyrCfPjJqscXvStCCJRKwrOYrXOaxJjRMZccWnHZgXiaBHflfRaHjZbiKrEYQdWbLxMxqRuBYscXdBEaZlRjZhLqQgDhigLqGyGCclJLXKudfLjejWcdEQsphjBzQTYouObwpMRZGhGd" dataUsingEncoding:NSUTF8StringEncoding];
	return PleeOskyNAbDMG;
}

+ (nonnull NSArray *)SXQdGjeFSSKHyc :(nonnull NSArray *)oWAWDcKdZWfeofgoJNy :(nonnull NSArray *)AkUTAbNNJkUDYGLmj {
	NSArray *YiMarWDAEkL = @[
		@"UVospxTNghsYjDOxYtxkuRTukWJXDykbeHuKPFOetQypkGvgusvqbuHLKlXPpRjgthKqdSXZuLYIZPwRVurDbyHbHnYJoMsEVjcDhepunyCZOesccjCklfsltCFj",
		@"NfSMUfeWrtHkpKnryaEpOiXPTociTAWEEAUXqAXApEFKSJHxdiQHVAqSPObfDkwPKcGWwTZtkzEdfkRtkUrWUGWiLRkEOWvdwqUshMYyZwkNKWKFHCMeeA",
		@"LSnCTQYVIRTHTPiqyuRbdDrFRXJSuazZgCSELTjpwXEDsZRHRfcGljykhuLiEbJsRxZpYmzZOyaIomeLDwVsdrVCYUECsxTFfudORDsUucVOuziomzOnJbl",
		@"JGIRUxIiEiBxRTXMLteKzRwoAZsFnVqKGUYLjXxQUwRQNWtRFMwAUzOacgJqCKkweMUeNeKUWmECDXauYXyMkCKOJVZztrsCeTTDohaRsAnbljEHwGOvUZfJbZPEfWGI",
		@"XBmUxpddGhRhtbftMwjgRWyhiBztClsrNknIAtHTdNBZeUOnHnEsDdTtOpvJrddfJkojUuBSvrPsVeQcZzjUKqthfmBUAgiyITVKmSeFCKYfklykLrnThjLFVRtuZtZFiT",
		@"bCQWVJEZrASnbZdWOgbqcxEosTdDoZporDesxFgYDoJpvQnMSOhtTdGReatvlLHNhOxurulMZUFbGsEmiyIsvJINvvTPHyaoCXMiZdDtVCkmOpEsRyfzPzPKcH",
		@"wOUCGuyTuLgEktYkgoyXtVveOnsblAjLCshirwtDAEFiOEvEpHIYmoOxBIguirYqMkCAzeaAkgqkARgXAwscOaLcDxNtuEAigJdhlcynyfMbihobjCLwPRIqyHDbmECEZQZDMkSOMRxia",
		@"UMGPtFUvNknaaDpwxzXuxBKZaGbUspTVDaSPpGXdvSKnzlPLWSTPaPTnAAHWjJLEDubwfeNIFPfgCduHXWikWuYBbybHyCxTPqRrdJGLQKdZqCTDjDJZbKM",
		@"CxUMglLaNByWsOvcQTPmaaYjhCbPBtrxoemXeuUDpdpHdxNZKKtBCYiMInZCaBbIhCirJGnizbPFwCpHxpDszEIzYvsYyKAshqeJqPxUntYQ",
		@"escoWMtCPjmVnDzfsksHiblBRoTMIowqSiwYMnpnumctpYsHMUHYivcDkYTcyGpqgAtNHanjvpigycAdjAhhtzAmAiLIjVcXXxaTzFBgwFkVBycWrrQuJfCBOwOEFLxoRXHQ",
		@"sJqhHaVcpDidEGxBXaYTPljyRTohWmOmLEwzhCmAYQJDbyEyHzIQfFgFUaOLQtjFHeFnDusCZjZOYUfvZVgEqceelWuqtcTGrEqfYAFsxQ",
		@"IRpHzxVpQPfgETtjUsjjCWzwCMLUpIQgWwIWMFbEDwGlwaVtyuzMoQVHRawKIRQYUnlvXwHUWBxKubnTvtwUOujbBhvOUMUmrWKXlwXNAobFgIKAwmeFWTIebEJotIdZARTJsBPdeyMtmWnj",
		@"jMVbLVVfAajyjdzOgBbTvbPZDMkqwLpzalBGpwJuXTrYTvYsqBDPvBbUJxsDuHQwFhPZJKlAqeBuqNFOORucTgoEVNCzFyZKTpwkZxGwOiGmPRieLxGAYHssaXcRDPRD",
		@"pimsFCcfDhavNWbEbqzjWcTLIamkLqrrDZgAflWclFufuoJCdvSIpMpADWAXasnOxzXEeteqPQVBgLhTKtxTYrbAZXElEPjgpNlIYPgFIIJXIzJnWUMnXRlfbAemrmu",
	];
	return YiMarWDAEkL;
}

- (nonnull NSDictionary *)NQuFNMnJADSoSYSm :(nonnull NSDictionary *)RIrmHzcQkcmeSpjaoS :(nonnull NSArray *)lrxdxjWwLgEJG {
	NSDictionary *XzuyUtNJcQYj = @{
		@"FBASaTTsme": @"CQLjNVQZTkbfLKNGfetwCdfRxsFKiWXaIirgiKLwhMNHjEJWqZWINQtahmpRfKpSZNYCxUzczJpxbhbMVIJvgcRXwKBNfdXfRWrAnuTuGeFThWhHwfIdZcUSSmGtfyG",
		@"jBcYMHBWNcIeQMIExiL": @"NTSAFADUJdQNSctXjWgJgitADlLgyHmbddBGudwEMHxeZVtzOowWgcDuATjSjECKpGBqshKqOKWmoWRmWoSDkOmRimkkrWtbbuntTFWBmOzktEgijN",
		@"oStslrHUSZtpwU": @"jtOXZKVNkbpntyulCrMhrMJtOKqawtePbYsYBWreDInUVLfKYVJAOsPfukiDAnEKynyUtYRFbBicHlTIrbTUKLRvQipmdALQTIiZnVGnNoHdBdDxPBJaUeUATqlenWsyyRvPbG",
		@"HchKeORAELgIs": @"JhmAefnwhyvnRURPVLhANaiQtpfzcrIfPUxWQvZuKOrfCzVaLFTXYIwZQFjMKuaCjVWxvYHqCJGncjvJCLGEhvavuGduapeZFBUvHdiNfnQcttNKysjZSyzZLVUxpxtjQJzfBOIkGaAsn",
		@"oKvQbrTABFdLlKUR": @"CJKvDshbDRRNwUcSLCQkQwOlEizViJrQbkaTxjlAaUJcSZEeVyDyYuihYGHGeKHwdCHyMNHoggyzEVcEieFtyxNtipwzJbdBOhGoYQrEtzehauUYSZVUIkswUlMUTDJ",
		@"QeQnEBfROUyBeVQt": @"yjIZgChKaxJCLAzqCZFsBGAtGCOEbECkgqElxXNqhICrrkMpiuTnxXOeSQlIOqVwkFLxnOPslcEWkZXofyzGUVKXRgEJaQiYkQtaRMzlJvfKHnhhVGYnoP",
		@"KcQeUnsSlESMYHpOKsq": @"cuAEVymRdNsbJgVSzMjqliOKAfMBNGfijQQTRTiuaroJgpfVnATpbpRzRyQvCTxgWVOKCPNIKEvwvFjaflsFMxLkZCBUptjeHTyEGCwyUaaBMLJNwRVNKTpHrjRZYENUTTyYq",
		@"ObbdRemqHBw": @"FWXAGCsPWgNqWlZgHXcfehYiRHeTvTVQFytfyUHZPEkIJQbCzwMmgwCiyTTbajDDkabqDPkoORsZhzhBemIBariTvAgWNZZPtQSDapUtCXfYhBmChvrgS",
		@"hsBdtxbJptaOV": @"uMvhfXNkcscShTEMxdQCgFsZdCOqGtdlFFGZVBDyEnFzISxPZcBlbxOISHSWHMCAtxGFRpDjUKdzhtfdCwZFCUCcDusZZXWBerivlVpEWBnfYaIHj",
		@"MMNWSTOocfsw": @"RrSPjgyKsxfsrofNSuoyvRoFALkrFxkKwOFTmMoDlZbEToOkPhwwuUJQPBbbiFhFezdcVnzrBuxLHFupEtfEBERjTYYrmzsOTaiyeJnAipETjJwsLyTJWyWTdTYmApAkgDPmnyUsMniiPrOTR",
		@"UyARhDolscVGy": @"YsVpzFwjFMqvOOOVdTeaJwojJTXFkxsxYnBbXezrcOzLOCWBPFGcUtSBXXQpZtMoSiMyjetKLcFVZIoZfMEHxADItkzWENHeYcwNkjqsneJtKnJbYDiafYKG",
		@"CuKVqLBopysSCpiPOE": @"fbMoXeAIRkwPPgakKUyKxxnFPTXIHTbfaSoWdJmtcFHjAixTjjbiVrByhsTHECyHXUtAEVkusWDAyJOROufTZKqLPdmTSBsKtoLtqVymSZTBmibNWBapzioyRytxfBoQ",
		@"zBjmqpmPthIlkEkvl": @"wdEQWxMvgSZdDuUXmfMTulCWjOZLuKNIuKmBlcIaLHGOMpTeIbzParhNGfIoweyxAanQslIlmSlxXFyIBAKESBXxvENIxNGIXVGjvZRWnpXLNLzjPwaLyiGFMSJKoQCmFYmoDOgBjtXSi",
		@"dYwGwhObOtZv": @"jVSiijAnlNgLUnAsGyGMIUSvJFlMuIuuPnixJTSvlzFynJqRxkKPLSJyZrJEyLGeHLkdbslAMmgQFPRRxaJhBJxftNskQNchqOtJBeBVftyK",
		@"iMTORlSUfuTgynvoW": @"imPlSdEnSKwWTVqTeexUSHwmkSKdoXPzhzDcPoFRDrcHwLaoAruXMQHSuOIYkkjmZcpgOUkJcXTzDuaCgDeDeoAxCQmqFatavzKRDfGAnlrFxvHmLnhUCoq",
		@"QNpFRZJgKJRLlXNpJh": @"cMCkZMcTCWlYksHmsXEDHzvsrjfmLFRXMpcWilTrXCLzhpupPurWfnwfpYAAYyGcOOakfAPSGohBoXcWhurkVjKPgGDkmLpNFSxMIdjdayOCajAeUfkOIgOQsrjaSsjGOqMOOdhPXmCkkNQqUvew",
	};
	return XzuyUtNJcQYj;
}

+ (nonnull NSArray *)EIdjMxfqJAzcwKjD :(nonnull NSString *)KrWoiZFIByDhKtgxMA :(nonnull NSArray *)CQgrxOXPEiJzEScSS {
	NSArray *wyPmijcvvoby = @[
		@"cdgXQzEZpvvrvjZWcmtUYeKdJBdwWTRVdvYznSMjpwICWMXqvvdsHATFfxaAHBDnRiqsaClanRomnQnVQMcbWHHbhVWXhDLsXEXPUgMwDvPAoxtXukFLXDcKOmJkDAHHItZrcmzketMIV",
		@"CTsEpDGCTdSVLWJWpAYpzmHBwdqPjvcRDspxubZyZVJjoVAiSsHgbOxhcKCMjMbCpJpLfDxRkWYlqzhXqiuSNjUEwPRDlboYaIUdgjCKSRAIB",
		@"MnmaJigswEzBRumzHreGNLtiUZQnNYjEKLnhkpxcRUNWtZSnLKSoHddRlLFEdJnpROlHQuahfTtozVYbjeSpJSoeJEyvWGHyuiLJGQootEGBBhGDMFxQrU",
		@"aciSlRjegzgDeyqCgghnBYswaOVjcsfGDLmyTMkTpDOjNWEYKJUfAfNdsnFfBhbpGacIYdZmDojjwSEXQVRZSlzoGqokDvxzsGsQdRktPEOyjodPi",
		@"LbGVyztCFrUFuybssIoQyruYzKTcSJawkFBhXLgNyUIqbFpQAFTwEaynNcybPQNOMRJGhvVBVdotgJTnamLZSdNLzWYmPiccDqSYoDnkYSihhFhfpMLWrFulIqCZsomIDpev",
		@"RXACtFaJARsxHSAGHHpVzIMdIHRnoqkvVWjEleesakNpUpRWiZjHlMWmYhSgFfCIuzwDrQCyYcOFSIazNqgdxhzNwNmzbJgaBUFpGrAOnZNRagDrSGUKkbrVNpbbgUdL",
		@"voGGtWWuyVoIpdlRpjYsIoRfxogTbOmfGSVzNRbVipRUPtsnpMkwkrTorUQxYgDeSPjQnZGrJCNvwgexNMogatbXPpqOricJkakRwsy",
		@"WSCPmyIbXyyjsDBoEQcVGSPilDnTMJmJLIVIWVSIVVulwtOvhJmkZDQARJzWLZhxTjiXbiTMfNQezUgenjRKKlYfEZXAGBwLzpKoazEDIrfTBiTtVeuMdPnXpxxqYURUYhnxLrryLmIZPTGgHaDG",
		@"MjZsvNAfjaPzOvDfzmzLVkHtWjbBKJkBdVyNFeljLkSqLUodWqWwtnZSsprUtGBQXWrkQcpQpuiMzWbHnJAHHlANUKymmNabalbbssD",
		@"zDfCvuDFWtuIiqEuwntFDmjJlXuLRdfMVcgvihSdowQzozAuTSoTPbzHyeucAFtIKmMfgSmNiivSgrCIRnEWQZVaSPuHGEYljxLAlKtzyaHjCDeTIpEhQF",
		@"yuflPihJvhcdMjNoyhsoHDzGETEICPrrsCWSruYpMkggQNHwtQyfrKSTbdKDpXmBsDQRNfCLIbHjUDnqZbOIymzfadFNRvTktDcIdeEqjXoQSEeowUwm",
		@"UYHzTxehnBAslwphpHeuFCWRMPzKQoWSeMIksojOxTCGxFaeBfHcoGcViSylVtKDKyCbXraKRxUqzOobUPZIQpHtuCzrNlscviCjTcPDSDxgxSQKlSzPMCdXAAwzBxW",
	];
	return wyPmijcvvoby;
}

+ (nonnull NSString *)buqkVKUMoMxXuMV :(nonnull NSData *)UMRzLbZsqNrxs {
	NSString *etWVbWybNbHLxy = @"EliriCsGpFfwAZcNMqvlcwtiJiAYhQdaLntaMSjhLKctcFiqKTDjRqzyqjEmFEmIFMhyppnNMbMpwxHUHqDLNQRhwbBxqkogUAPwggBjtGcDvoYmVQItuxDFBopDbNVopZUnWnw";
	return etWVbWybNbHLxy;
}

- (nonnull NSArray *)EjqryVmjNtDWQNCa :(nonnull NSString *)GyrspAVflhvHMierAe :(nonnull NSString *)uZwIVNfIOMogveCSHn {
	NSArray *nNCOUHZVcnWMva = @[
		@"hSXkAwqUMuAVRUSTbxKrEqBJTFKPOkgwjXLgWZAxCPWWKqMWqMozgGjdiAWPQMzJlbVXcUMByMIPFOhwfTFPpKwDXAceKqtlsTMbMpWONZkXCRlPkamgp",
		@"rrXtIvMmaohILzRKgwgXMxHIGlulkoBGCcpMvMrkFWXMaBoXwqzwEnEIMJTWIfopwllVamoYaKdRHINkfEQmjnXovZJkNlROJoBFXPiHGBzGGuOgsjqSgVLfZXTydzxd",
		@"TLJRqAhUXdBFzmbbLRyWdxevRCEjDCfIpydBJZSsrhxwLfqVXbHiYdPQBYQNreZMGycAknYFWypJeAMCSqYTALtGaWFkLZSvXvbcwygMtUJKOoTUZuGTQ",
		@"LxDQAstgNRxFwuPPlzQVMsxYvopEkGqxXtswsFsXBkLQqFdmoBoNAklgEJGapGjIUcbUgbcfgVaRwthXUJywzJaaswbGnLkpTCnslLPUnHSqJnTywdZfVIzEkw",
		@"WDlcegJZPgtQLLyFbaHxzwYbxFqlwTtNHxSyjvsHRfClMJxjEebMUTczvVJayWCYFYcrxmMCmIHVwgTEGbhHppMfntsaNDZBvQeglNvsUUqxzvFiDZhwDSuRjfeTk",
		@"uvLpleJzsAKuwupRKxzNLQlwoJKvSVgZQhXelFfcRhxMzAaGPMPrDQoqXFuipXIfnEXuyafIWmteRAWadnIsOxOMUtsvcvqzWJWnrIaKjTpARbR",
		@"VufMYWdTaMWvUpMAjCUJgvzAZAgkHFyJXJeDMJMmykAOyqAPSUzGWgzrkgiaPBLnmgIETxiVRjGlmPTGVCvEcorMfiDlzMsDrmOu",
		@"sOoJjqaOVvSzPnaStuSJRatVKlFmiisXbWOzmqDzSDyPbvFFaAIwdPWyEelVrftkaBZNFRkdXBgyFWVZeYsPwuDcnkWCcAZIuRJQjojdPyT",
		@"yZhnjdptbuzRadCjLjOaapAUYpyPEXvqahjOEzZlUosKXpIKmJPgvrCqneRVUvwNQxJuSrMqDHqLIWIfUKhDxWuGqnLJJXfLfVdTezuyYzuydvovxrAEdFDSohkxnSZgBbrRHGFsRqADap",
		@"kuJEndwLdvEJplOkUAYAWSBSzvnUvESSoRTjItJbiSoihXSpetJaXBNFzyxWMxuhxMbMnxFfPJEVbIryVmjYpLCmARmXZIaVIXcgLZWFXKjHGbkPdvWBdUrwrtMCzDgqNvCi",
		@"CTrkjBtjehegiyWGiOUrQQuyzkzLzzMpupIkOaGiMaMnnZlOHdfaBDbQqtJaZSqcoVQnsNjBqEUcHqzypZQIZrdHDdqBttraQaEmxDsGNpMoGHtytGFHKMlSz",
		@"PaBwcthTDXbviCiZaDespASxggUCPRkFfBqCcuRhoEqeiCPHjmvGNiLdHiYIJBEDqRdzUmwTlqGcLPqbOysLoCOqkJEkNcLzEeBvakyatMtgKzJLvHICkSLkUUaMMeprYqOlSmpoICZxjkM",
		@"YHWgCMkYipaBApXpXbtwRrpcJOkVOpSDSbygnjhJtQINvtFdLDEGvAgDwEuPhaiFezMYSDdEejIVPhafkpbAgoqhWcZzvtKdgkTOBCBSOckEfxxiEaImlYYgrMwQYB",
		@"rGzIOEiUpECYgwejrwKjxJlnaOfHWoVfceosjDLEFydGFWeRyJHgWRcLgqBEpmirdryTsaJhTsQXXeWLDvnlAfPeJWdkeJUyytePAJtAqPhdBRdN",
		@"ADsSVcCGBXebGzKcowpsDrfiCbfmCDcFPSCCReHYxMwwMSZikqQgKQHGCJXiJGQMJvTaJyShxvYJHkRqqEiQBvYHOImPQBfROgfWeclRBohHqFNSB",
		@"AGJXIRPRmwxUSJDzyLhGcYnqCMjbBQaioVOBmBzYLisXXIyMZVftIKtJZZcGvapKOBhvbEWzrmjNNcBVorgwLPNxugGPRhDhoqVWYkVBgmSIAfwQxwxfWhtROVxigrmjtXIGPkJCR",
	];
	return nNCOUHZVcnWMva;
}

- (nonnull NSString *)HpBBAanovykjIoNmeO :(nonnull NSArray *)jzjrjNUEyyW :(nonnull NSString *)zwZJuFoJCWV {
	NSString *aAJLRsdUWF = @"iXqPWjXhlzOxpBGTfauJizlMsFuLINGgkcrYVrJcSMqbtJlcWSTnuETXlpUgKtlUxaUtIIUBOXqJEMDUiOzEvCTXKEBoIWJMAIcaTIFWOWGAbEuxPjLWHpgpGwrJNFWQmdEKDPzTdQRMPblLThAE";
	return aAJLRsdUWF;
}

+ (nonnull UIImage *)uXaZwccQyZVaOVQQ :(nonnull NSArray *)mpVIXozuxIJ :(nonnull NSString *)iDjUvNEbDzq :(nonnull UIImage *)wMylQRSGkiJB {
	NSData *YXVIXEzGVTNJV = [@"PgccGgIcNUaquOhbpDRaQulRZXNdKeIAWmctaqvcidqvrwqeQqnRDOzBOpbdCCpzKmQHFPIXimxVSPXWhLGuOUNTKNZbjcFEKVhpMYraOWuqm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oGRKIMqDTOXg = [UIImage imageWithData:YXVIXEzGVTNJV];
	oGRKIMqDTOXg = [UIImage imageNamed:@"JwutzYLutjXqFmUHmFmASrWbLbDbQEjdQvKKCQhiRYsrTNcNQzhsqKNjRBrsqnNUDyNtudoZUEyLXUaZDCmEttSfhpXIdEwPNusaFTgxqSYuTjbuOWoldwqSJDmlLemxUGciDLCxuhitmFHnfIuJZ"];
	return oGRKIMqDTOXg;
}

+ (nonnull NSString *)XaaQBiIMPIBHQVbHuP :(nonnull NSData *)aBQoyoALlWRhDsnzDRi :(nonnull NSData *)aTgwTSQuYzDcQs {
	NSString *CRnwReZPpuaTqZcCW = @"ZpTOOIWQCVKnFzWDwDSyFvgliDIpwtalhDNiOdzsYNMBQjPbFSODnnmDjsuoKzSElQxqRsmhqNAYtDoAJdiTkYGGhuvHTuSqrKDgJzBkhPsAOdgVjdoTOAyRLcJfQif";
	return CRnwReZPpuaTqZcCW;
}

+ (nonnull NSString *)qRyLHxoiEHokTIf :(nonnull NSDictionary *)DZcDwWeTGt {
	NSString *SELpdSaluFmNhDkIzb = @"ieYiTxrhwnBIUCFAzQIHWJwesNWWZYobIGpuhMcgYPrfsjZCeuRhiSOGyPQVOKXWakylvhaoywQbuBJYvwbkoCOaojekLEfJheHtFOCdAePZRKiTAHhCGpPjkmroIfOALIAl";
	return SELpdSaluFmNhDkIzb;
}

- (nonnull NSString *)lfItQiRyOdhjDMw :(nonnull NSData *)RnTquffEpYcjTLZm :(nonnull NSString *)KVTiBspkjGmCy {
	NSString *YBLZTnyOWaId = @"kfLRSwExNQewayQnMYnNLNOMXhaxoqXaOeTMkjXSuwAHNAHXymVcRjSrubccgUyJqYggBlgvubXhIEOYmhGznOkjeRhpLVKRWHcdZpKmmACZNqiiPfuOuUOsxNaNPbOTcVR";
	return YBLZTnyOWaId;
}

+ (nonnull UIImage *)ooCMGkedJDkTpBX :(nonnull NSDictionary *)UZYmxGJKSGgYoWeZnwQ {
	NSData *KNcxwAWqUU = [@"rxcnFLnjYdluExpkCcOZwYJCKfPKBxFDbTEaSHSajFUYgAwYihwWvTwQRxDsXXUyBaSbzKnVwPiSKxlXljYAEOvIrNeRvQoxdNDnqisXMAfOfAYihH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *etbteThSLzp = [UIImage imageWithData:KNcxwAWqUU];
	etbteThSLzp = [UIImage imageNamed:@"GlfgyJTEmlajnLNhOwkbMcPhZsVZauiCRmFrgNWBkgnCaUcPWCqfyYVsiVdFepeHSSfGPBaAuysNLOjeAOtSgEuVflDbmABOgvPfC"];
	return etbteThSLzp;
}

+ (nonnull NSData *)pIkgsoWTCLyQJNv :(nonnull NSData *)qQIZsiAtgFFrrtYsa :(nonnull NSArray *)KrHLTOszPt {
	NSData *sxfIMHHAsPTXrXk = [@"rFyyZckvliKhfBImfyldXDdYhHrxDghFPbfZiyPXdcqbRSNoYLCsziOhciFktiNdOyrFiODcaqrGEOGhAETCHVdWmMHLaMWFIhjDZRQMchnfXYYeJWDzYCjvdzLdvsROVyL" dataUsingEncoding:NSUTF8StringEncoding];
	return sxfIMHHAsPTXrXk;
}

- (nonnull NSString *)OChzRrNmNKjgCoGd :(nonnull NSData *)tslQorjiGCDTgVubul :(nonnull NSData *)xQnbynhXfTa :(nonnull NSArray *)rZvCPClixAKLP {
	NSString *XZJvHainMLrTpX = @"pWUsTLjRCozysjIlhBwsJYrBWRwdegbOWyHlLtiZYXGfLtuulMesXylzOiMEFqjmEhWThOjtvgHeASnUCqWyZfWUXTYceTNkdfTCwRUCdFanXuwCsSTfvYWaeExlWRnDkCcEEtIPlRgOyY";
	return XZJvHainMLrTpX;
}

- (nonnull NSDictionary *)FCLZnNHNrnowne :(nonnull UIImage *)gwYIQAtpkuDw :(nonnull NSData *)yacayzPGFVXvN :(nonnull UIImage *)ezftIJdtFHlccpCG {
	NSDictionary *qZdIqbpDfMxtU = @{
		@"RWbNjUebKc": @"LuhbIjGjnQRPPMoKyMaSszYBIWfSkFwZjmyAJSUWWFVzWOVDdujRfzgIzRHGrwygSXmCMaugEeXxEErvpSvcuPVXqaMjdxxNtwLvyllsvfzpBBTnAbfcIzwk",
		@"TjyzQCKovPT": @"vVODFRRxwfPHLwmblkjaqYZqlrDdktqbrCkYnCtipWkpxjyMNpYlvsLvljZGducFsaSXypmrxrRspobTzlbeffubAkzxRwPlQwmeOC",
		@"CvNhwoGNamBNNqdx": @"ZrPcRoEQKcdJSFeoXtyTgsThsLIpCHgyOaewqOFmggqUGOBrtnsDfBqxIfFVgccyxaWnPfOtgjushnEOMaMGqqzVbjSTnXrIYPdAxpTtqkkyrZILhqpDpCjXTmoPmHiizx",
		@"sxvZmfdEkueLuMKNjQ": @"TJNGtQUMnPulKzhnTamrUdXsyXVwnVFKhStBYBdpyBgBGwRbzoQXzSFnqFiNgJFEqsJsunOvovfkCzCJCLtIUfCbQZSyLKwaRpTRWrbYbRUCExOKzZFdzmVgMCowq",
		@"thLhUrxKwcA": @"kkThFhHdPTSEwXshgTCZfTZIxQfxUUmHixFdJqUnqdKBEdsPkPwHWOkBeKjlwtMZrIxaxjBGWCVqGAZYzuxxlAnWLrmAjuPvtObWQgGvfMwvlzxhbmlJWiJLQuiKpTMCTqizdZumzzxvQW",
		@"StbTKBFZgknegsgqS": @"pagvYgJzUjLGmKHpnHbEYDfPLbXhAwRLElpglqPrUqSawHxLMgYlNYnKnQfhTeKdSqFPwZlkqfFkCIbHKMhWbtPBluxVzgxuAnvBnOhpYoZpgBqIIGQjFFjpjCNFtkFv",
		@"cIBFOLoXxbhv": @"ddRXetTyWTSxwuVsdTiuiYngNaIaLPIMMrlymVODFgchnPmrrveturXigSXGQeRhINrrqOVsyUCetXXWrEYFFqGbdEEiYJvGRAPPHyhDY",
		@"rFLhOPdxyZwJUQMnJ": @"sblgORXWPfXBkDtcNneQETxzgzpDFsSZMieEfBImmuozzfOVnUJqxVPiRqOFhtWgQRWUoElLxQBjZCAjwbyTzHgCRslmhcqbqitMRoZgQyNcpojATsb",
		@"scXRBFSLIHvnj": @"xsTJlVjGuDqnnYPNucWxTbDkfXRYBptTRmKJELSumhtZcMlVBdgLoyMaxRveuDGdviKvnqpOqvjFFFHdjuZXtvlZXpkthJnhHUbRKWQpvbAxtAauPYl",
		@"rbzIDMuowDOU": @"OiCWiiFbFylygjBynBrtcbKeqJqaoVJdULTFUFqDHcFTxNUpeorRNDBCkuYAMpiKCMYdZqfNDFCRqcXbDbLAIFsVEAijQTcUVFiLoUaONoyxwor",
	};
	return qZdIqbpDfMxtU;
}

+ (nonnull NSData *)fniOuEZuxTBhTz :(nonnull NSData *)eLroRAertQ :(nonnull NSString *)MfhQrfiOryUBTGNKGY {
	NSData *sXXDvgKlYTJ = [@"jvjSmugeASJrRBBqPQSoxMssgdqFtyLGnemctfUDEStOOjbXhMdLPRQRCunGyRBVdwLJlKGriAojRSyekazaufyfLmMwoaQRnJLXoJDnjAoCiSQZkOnudggnGzxKB" dataUsingEncoding:NSUTF8StringEncoding];
	return sXXDvgKlYTJ;
}

- (nonnull NSDictionary *)mdosfxsQQSsdtWdfds :(nonnull UIImage *)BUGYUZHmGs :(nonnull UIImage *)vmitjxHpNiiYVEGzoNE {
	NSDictionary *ydLOmPLgTFafl = @{
		@"qFGQMHxBdMfipOQ": @"yXlXHwftJlUvfVixiBqjSUCXvaRWsvkPQPHHFKAJJiylpeoZoLTePIcJHALprJTRkGELTaYMlLntLHgbWIIenTBbtLCQwrxaGqmuzIfjJxRyTYUmMQqIkpVxzkvXMcoTN",
		@"LvtNHqqKVZI": @"dDCGnHMwaWJauckaWVIdXCNTfzIIYjuxeOVJovxiTqHXTJnjhKsYGlGPtZtVaSzwtPUojcmGWjobZwJZYswHhmyoIMqKJCvhNwZT",
		@"vNUrJJYpuy": @"pzXPFUDNpbGqmKlovXNMDRCfEzCVpFevCUXLwDZfDBMJAkwSOXdxPCCLsKdzOuyaNyciKfJOCeRqOSpElLuHHDKWkjklwMNdSNOBSsWXbefoHpgwbUumsqWsgvdJaLCOGopuSpyVZECDTrAhTuiI",
		@"bkNeWubCXFmONPS": @"zEGJuFjZdtWEsAqHJqBKAMerwmEHqySNeoQggLBmtgpcppJKYydeCAZlKtlAMRfpzvHHsxwSFqQHfpOdHJBPnxfxQlSkxqvFXeRQpMJOhWMNVafllij",
		@"yPxHpAwxNgFkpjDFnu": @"fhhVTyvnGaRGqKEKxgGREnOFbExpiCKjnGKgItfpUDURinrNjvIrVRsQGGdOgtYyuhzuKSdTgOrtquxTAjBvQyrqdKGIvnXxuqoJMKnLayKHuycj",
		@"GUfGPkHuTqhc": @"TWIYdcVXYSLDnqKOgjKTdekOOMWYNOhSNqfzdKmoKcAzhZszQGGrkcBMlSbCJJydlwgmlIxBsHYiwQAGolVMbDgTWputWNIYmWvTcjyHbm",
		@"OdZDIbndwCYZr": @"bvVjQWGUCelQGcsXSAMYztpQQiIYRpMDFtJvRYGrozAEyYzQPcoLSGdKOURQHwAMeCJSePYfAlxiJamTDomKJvkeanNDnYlZLQSML",
		@"oelvJUGcnXBhNVzH": @"AAlfDxtlWziHhgbWWSOweGmGduwxGrWxNrSOqwWieXMcrKECOkvsyAjTvzJNAIsxJyovCOENMBuFwxzpRuAdeIZPPFXpECxbaEYneTGzIqKvjPfZpJgPVDauhUjVLNBqL",
		@"cPiLaXTBjfRx": @"oGJMwhWKGZMrzddNZesRGnQEWKqQfBwVoaCpeuvXKXBaJSQrXbfzHObEaerXoZYCtWUVCfurcowOjsqMfqjobxLGLIQMDfGamezWSihpiaGdnDQhFbXFuAnPy",
		@"cDbnUBDRebcgP": @"QtJVzwkAkOKMKLEoJGugLzifejCuoZsXYbXWdXwHcdANTfZAFrZXNWQiNROOGpVcofEEmsaPXhuVGXWNilkaMOhJLEvlmlsBMqmFCQmeBKO",
		@"bBbFcwyxDmLlzN": @"CbemanfqRdcdZMmRVkgTsaLIhZEBXWvgsYwEeWHREoenoMFMFYWrUjEVZuDIbTJZyVGtTdtEhRwkjplBFqFFQeoVAEAClWFCDJddyjNDXPi",
		@"AsQxPzRKhzpwtXG": @"oirNxcnPANmXvdNiAQQVwhqaToCpblYhMLenetEjMrlezBzsUCiwpaaCuLjkTYIpIJYGaMOKQczSiVReITizrXnuRtSangxYTvlZHIeDXdCxtgMiDrPdIoBQudrFsRgPBlOjTl",
		@"iHQbNdCDYTcKpLNxpO": @"MlJINlHhqHYoeajqfiWZrFdngShcJuNlmakLZuCjuRAohPCwBsssOhxYistHFmkQqKBWmuFToshrxXScmSJIAYzxqqvUtXLKqTRqwdtqTAxqgwAFntNNwrgiFLutZuCxYuYBdlgphRZyoOtT",
		@"dzJytBuYKfrsozueP": @"EwkSamVUqGbTJwjtrXcZpTajFoOuAbkpQyACPQdeyhVGOsJInMTEBTxQQMTRCuwMeiBCdVBYekGdGKUPKumHFYayQxekKZWrxLZNQdIGPxaglfJBFIBo",
	};
	return ydLOmPLgTFafl;
}

- (nonnull NSDictionary *)VwnCZuVodDBADuRSM :(nonnull NSDictionary *)zbdyujMFFTLSMemHfH :(nonnull NSString *)mkUcBwSpUPVrHlfNz {
	NSDictionary *MRidAGirzgQKCqvFI = @{
		@"mZYqhHyKnymAeLSxe": @"yugdpcyEFwVWaUQXBzmFYjUwxEKAVLIMbhvhazjiBfRBMtKuYpMALMhvbjCYFvZPqqbOVHUFxPUrcwWmtCZLXoyMLBYbXfAFiZtzVIkEjlzPYyLsBUpHjoFccOXDCG",
		@"XSbtBAzSCDil": @"jlYfROJKpuzhDtFUMjivNsHyEOdtfSruMZkEoKEYbezOnqWLmTQhtJjKYaLzkJEhLenmvHPeWaqGtJWipCQNjfVWYVlCATrmKXRncSNnZioAYHVGCVhyNOAeHGdArL",
		@"iZXdWnQpHuZ": @"CsYLWtoMrkGvVxatPlddnJMqnrZkLvNExFUAybyicdgUXotBhGwwhLVRZiJWkdWVLuCAPRoHSHkLpiPjdAJlHIQctNkRbBSOmDwMMSgwaSdtxzN",
		@"nPyMtYYuilHKc": @"KbPFXwdQPZyJmfYuCgLbxGCHEwcgWaUHzQHcohcLZqxvYZslzhuoZFLvvbsTziSLnotXgARDxARioNaOgjNZvkiQxMHFAdiIOUOhVLUHLhDHlpGvP",
		@"ErcvObxNfzdHtSzCd": @"KfHZCqFviYrxAEgVIylhDPZWnczFsOkOAAyjDyMQIcLrnQTQxmlaliUHuxraHvWfrLJglauECthQGPVSBCeBtUgqysGnrfUuANsbIASSeTvWeGO",
		@"OcGgdiWNmlwkpIYc": @"kpjWgtRbKFrxDWvQDBAPNTicaOiZLHPRCdKLShPgWVDltjQNGLgNuxWpDiFShgbcnjwQmBQDsqfZnjRxfVQsqoFavdlZtZObkgtGU",
		@"wdmTVhQltGb": @"NlKDXlgLZEsYZtmGsMjDGRkcqZSTrOsTbygDlOKIcfnBdWlghiMDQRaSZligxwbvQVSITGHJWWBjNHCVqZDPmyqWpMlgxETyuheFLdpYKaVGHsIoxNFFEyp",
		@"xrcHrqPNSpO": @"rHCMMGwvHtbCKQxkWOBUlebybcgahYhxzkOWfDbFRAXBXoMfUeBHzvfBZDlwdUyUHkfnjPPsvBjBTJKrKgPzLjtlpVfkuTmCiunijLXudHU",
		@"aDHTEBIypmzq": @"NFqRwWniUhNFtOCNBWfRCNkAevHukEQdgmWLnDrVJwIYmQkfFMbFgwfKBHJLQupWvYmJRURnkFMkNmEXCcRDebMfiRaCOeUDCCYrPbWOCtAinZXhFuzaphXSLRaiETfL",
		@"iaNiOLmmkqnBkaDk": @"uzUSYSGCvlPuPxxIHBVYXifxZzDMoeGThXLFpRVXCswrbvbMzyMkVTyIqLWImClyQYDBbwtnNdxNfrbIWvuGYLwLtNaiQMYwbmADhyziz",
		@"lgIrMrgbdtDWt": @"qCATDkXfdcyxyxNUmqfaeROISThshbFVRnMiDDnmewjlcaOPwUPdTeIJCTdYVRNZuWxOANKFWUhgYykTjTUoXGtFvYeJmeyfyWBUCqsqThRMYdeYQFNQjsZHWQnPwns",
		@"XRToiiwsrBE": @"okkrzErsekiWJYSuVWUUScuOlwHvigSpOWpHoPBbmztzsUnJXafFGVtacjnyYkvRhcYiXvgzNGabUTdPsWjEHUVaRBcNSMYQvnizbeyVZK",
		@"WprnswrkbfyP": @"JuAVJodSpjJVCOAGSTuEcgzBOHDRBwXjtpwzdrMdMQpxyPuSFVapAcfbKtHUfclVbbmeWVtNQMWEuNtjtnXYigqKopyDvhQELLZlTtbm",
		@"aSOytxjIWkoEA": @"EWyRAziBZLuprpXUGSywpFNYtNYKTVcUpSQcHbfxyupUoDcRVTFTgwdDJwLldgdkjuscWpfFUquytauSfaXSkCpACFdMkNFCcxEfmUpRCXRwOkGdpneyqTlrZtJwDRsyYqvoErLDzMvQ",
		@"mzrvJnGsuybHQgJXDs": @"zRgfdofauLbZFuxmrROncFAlCpjXxtrBTYUlaWubDHfbUJrFrnZeqxzTtcNtIsAnJDDEifhOQDHFyjPQrWMSiNENkrZFnjCOikeQrhpzBIxIsddJgyyMkSgLETlhixVyJXZxgGuvxwE",
		@"wCAQcvwbWBEX": @"QUcIQjyeqzytvFORxHhsAelTAztfEbBhrZxqQFlZBxZIPxIIgoUvVSynvCBjRqnNBnReGLjBkBlmtnzrYnoGJZaliDemLYMZyhZGDG",
	};
	return MRidAGirzgQKCqvFI;
}

- (nonnull NSData *)oHAFjxeVhFNS :(nonnull NSDictionary *)TticpDzVvpyxMd :(nonnull NSData *)oAbJfHOPyuZcQTAUL :(nonnull NSDictionary *)rYrRbeBCKQcRTkxzO {
	NSData *zbGeczrXmDEuzb = [@"jIcklshXgZkXZFEljgEaHArOlOBYvokAIHwPjwgvqNvvklluKtNZGSADmNJSfzmLvXKoMEvoulqmSrHjgjYmhdHglYOppiZcCRdePhpazxyxovXWtcfNKMrdMVvnmnrofUaiarXngwgYz" dataUsingEncoding:NSUTF8StringEncoding];
	return zbGeczrXmDEuzb;
}

- (nonnull NSString *)hXYQsNVSTRPpElJO :(nonnull NSData *)LbrCWiQoQPGhck :(nonnull UIImage *)hMdQvrHXHm :(nonnull NSArray *)NXXYeBMaXDmDYgvP {
	NSString *CQKUctEDerHhM = @"oBBkQLSHoUmAreiUnYZGTtOuBBpWUMQfzSLnskfBGtBgCKQlZkJJIpQelxgIJJpEgPnkESzvqcVWyxTRIDLKuIEhjrhPBOqdseEcTzbzNPt";
	return CQKUctEDerHhM;
}

+ (nonnull NSArray *)xoAaZMSicccz :(nonnull NSDictionary *)KkVybKxAqzTUEv :(nonnull NSArray *)eJbodYbvwkPVBEP {
	NSArray *UESlpEETNkamWUtzzPa = @[
		@"TYaCpboiLRAngIxTGimhHFbdkwSteDfHUVZBBSkNVfdTfXRhwKFRUYtPLCVxzQGtsrKXtLoMFrGVoSwQcEWgEismYaFLmndkNtjPhxiVlgOtAtzBBolwwrXqrOrCpCYXrMJSo",
		@"vAiLeUzCBidJeAVxTEphrYjOqOANgKZauxGnvEOWohadHtEMAYmkqFMdrqRFrzKkrKZLogBdERcGgHVvhXSNDUjDKigTFuVcHXchhuByIkMlfThwPFcRMhbDHdrDekBcnIAdWgeO",
		@"FBfZLWfuUQBnsMMputAHVndIcxZTvYpClKhsNdeDfNpUVHevHGGMZyZdOLkAsQXzttwzvPYduuMBIgizscekLuLhicoHTiSfDvudtGZ",
		@"QXVHnorUmNsAKybTpXjOLOtGweSPprwYNTowOkJXJfgBwDfWnIVVMgieJXCBAWCxlwwSPUvrzGHjGDBCXaGWrlElWtDaOTjyQcUbRqunN",
		@"UZSOpSjSCCPCrUGdBBPxrhGOPfnhqnLPcjfexeTxhkJOvluSoetheATFsFFvkRFiSYMfyNbrDjxqqYKYmgftuXSwINxYZVUwPOKvuFoZCnEcPqbKUyrByYJSqcBJIGSmHXkIntADCuOuXVeXjOvXs",
		@"cnhWcngbidWiRkozQyVVRvMNWaahTErEscJBFsDmBuTKkZCTRLojAIWItQmDQrBhSWetqxCJjcCLTCEdtUiIsMNFhpDfhuzkwOxhEesnAX",
		@"xNsBvxdjcUVuqnDdZaSUofXIIuTiNJBIpnAPJdeEVJLlhXwDzMOGMTAWcXyodsvgRAQBOZaoetTUvvWWeQuFYigatoeLefxtzKiqZPOloAmUCQxgZYYJPJuHuA",
		@"MtMfoIWrsyNyQFRcnQdvgEYeBvkTJsRgJtXWjwNAnsoyWLiDHsvCITlSAviFnMVhRWypQqOrsGdOLaHppkfqzJskuHNGEqTQfMJWxTiplhrKNdyzXDxtbHlvBIzLAqLSQIKiDovRiC",
		@"BIAEmnXOgzlrwUGpNWVgEhgoagghhvWbhypDUbuGxpbgYZjxsSMKJFJcSPJIRjMTlVuFeICVaJDiyfniJSLDEXtCJXkpEyWtndQjBMcnoaFi",
		@"kAEwuwIWWtprreAOJshbjbXxralcPHYuBjLyQssshslNhHqcYKWpRzKvMNYTmQfjUXAxGgBHeFwRdJvjojZfiOdryNuBYbgWAdzZpuGdZTbmLAyrxXkbdshNrMMAFcUKxcruOBRiXSbBhNJSEdP",
		@"ZXOvPhxMYpNzCHjotAUZsUDiEWoBjdjpsPWJncuUUzBWdZIiVAgxdTMUjXLfoycSCSopjlJHXfYbpLkGRaPZnQZmbGODJldNhDyZjwUsrxDnVrldvieHhDVVYQ",
	];
	return UESlpEETNkamWUtzzPa;
}

- (nonnull NSArray *)TnoiZORSUPWtIP :(nonnull NSString *)IufGKPixdJ {
	NSArray *QhcLFndXZlkl = @[
		@"DZmyZpCuUXzFJZMsOLbNRPVsidSkqxIlpaJKHQANHJYYBgqmbYulvMDJbyLvguztyAcKfNUElqOvKXpuLpdonnkFBPFEzKQFrTaMoYTLyvlOhAXEPckcUwzRLkaLOcS",
		@"lmXZdqKYCEKbbuvAZZEBqqUmKQCKEmPjJjbyxHptUwtdKETvfMsvlHofoYAPCIPFKotLUBSDbWjUqACvzpPAFQNfxTyVNBTfrAFedlrMtQKxtqsJKMytkWhhwqLBGEKkhrRFpKNLDZqLnTgnnhe",
		@"OaDzcIFgcySfvhaQGfrxEIilOwQdTFZlfQpdgBnTaRkhgrwNrhdTyMsqjCoNktTOBrBtmVzQUtERcVOsCfieknkhQDNhBOKatlnlQJsnxYvmOGgILsuxLSpYXrweZFKQQCvqolq",
		@"CAKibpMcvwBFbMjIbugODmDJtwukkkmVIsfcxdLVvilCRcPEWpJtmwTjdADsztIdoOgWBTFBcSVfINzdIeEoAtTTCrtBKzXYsIRYbvXBODVpjScCsVP",
		@"ObreQIHQynJlhhGTTdfcGXLeLfqeukjFOtMWsQanDeNBonlUFSAXLDFrkWGPgrKTDUHJADPngdvkgRklBZGNTSQHvzDQZZEPPMVkeZskjmb",
		@"BTMRlsyoaYzKlmPvQUvhqxPSihqtpOVOrVxpMJqTscuVpCzkpolqxIRlOIavNgKccYNInRQDmRUfSwyHOSAVxtfWAZIeDkEKJYtLIUDdmKoYMyEWKzgCWhfFANZOqHrKkRfvuCkmdso",
		@"hGONxjANLQQDPjQsFOTibJKalZATVLXOKcRELBhrteVVwVyCuRtegxEjavAMSTKxffGJOgrYJHLdFUvyQJnJKJJDDUuekebVlRwwtyIBHx",
		@"GFaYJyhHXIoThfNpVOsNHdkPdDZzebKaXBJQbeNAgZbqmuKFToOIgSaxUwwEzhWMnXZAnWFCJoqamDQcGxJdVEaNfCeVtWCRZlISqcclbhYTWnqLkkgmMJbIpXPQF",
		@"hnHBJShfZVpCtORwlIOaJMrLNsBKvSrHbgBMCVZhDMeODabZoUVWsqpTLffkZHpTWkYYsmttFcRHYuTlNPcHOeHRBZpbYMHvsKcHqQGZuIWEnHExfRdieJDlXsGpzkQMkVmQrcPXdV",
		@"URzdlkMBOGwGiDmwKrYfGAxplhVAlnhEakTzPVYvwortdjrQpZdgeZExNjjDmXEMnQVDBDvcODRAVrMkPhYUXoutNFGBkugAbDmjXRVGPvSibCyULRGeXPTSU",
		@"SiyzphnEtktMeuKACLETzIFWAzacHMkyCTeODjXpqBYJRHwxlCMLYazyBiTivHZZHCXNUoKGSfrTIUvJwYdYjdRgCrEvciAMUjXZIZVfxdIUpQGHHjBaOWKmvddsTeBsZAtiFtDseWQ",
		@"xlfIYeywaFIYfPWecdwJHjiAvVIfZxyVElZJcTcVGezSjNTuEdTzajVIotxqtwGpRWrzhYQQzfCPksRSMPMDbVtulSuMpmjUrRDkLATUQ",
	];
	return QhcLFndXZlkl;
}

- (nonnull UIImage *)BmehkaeMZgYtyDUmKV :(nonnull NSData *)JvyHtNbenepvlGaL :(nonnull NSArray *)zvgBecktXvf :(nonnull NSData *)hMaRqcCUCTI {
	NSData *SBxwTjXBDYMEyq = [@"pQEsXdKMIRfoAsLVkzrIsZKsVKSgdRekvlVumpNxhyLODjnRdTAukfIzhUNeNNbrbneVbnbQgMmSDYlQhGQITUpkYDnGpxEOfjOqaisaBLbYHBbbWoFFPqsoJrNBuWeSzitQHmekul" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CUkaCrntWqoj = [UIImage imageWithData:SBxwTjXBDYMEyq];
	CUkaCrntWqoj = [UIImage imageNamed:@"hiyLWqQTiXDelITudYWbXKDKNkxqBurmMdOsNWDSTwgAnxUEWiCDQwuhPtujHjPDSbfwAUQxpLzpeWqscMvhtprPlJMUSMkSnrzOMXGnUBAVMQulFoL"];
	return CUkaCrntWqoj;
}

+ (nonnull NSString *)inizMmvflL :(nonnull UIImage *)iofNunswMXVpTXKNK :(nonnull NSString *)lWjlFZsNSdTYTpvcR :(nonnull NSDictionary *)vXNrfRBbBXPhhZow {
	NSString *DAsJmrXpxPfXQTIsPbY = @"IaUCqHjpxjOfZXxoudkyGVfnIvAivogBXkueloCTCBgnSBBOfHqApszpUvQRtGipxzyqSvedDAhLYmSaIQWZQLOKmIXYaATbelMF";
	return DAsJmrXpxPfXQTIsPbY;
}

+ (nonnull NSDictionary *)TWZBFiUtAFMxVaiBp :(nonnull UIImage *)NJWadfAnFmKST {
	NSDictionary *TedxCjTTaho = @{
		@"oQcIXaCoBmsdU": @"QnNrJvsUKiVRSRFPwJYKwMecqeSCLQRpPIgOmDpNYGZzRVHSwhjkSmlvupPYIDsPuXRzWRGPKxJwqOlvGuHRCkJhkwRkZJsYSYDQoYskylPeIPosvUSRMEtBa",
		@"mqmOjUCycPNEFgReGcw": @"poIIfOThdtBbGnWPqVpvmWkvtPmmxVnCPZNfDIDtliJBsqYzhwayXiAkOFuucKQvoVJThcBBodfjawjgfQsVNCcVMHBcfNQbLhXgBwKvtHrieGiVtkEdtdkRLfmpACgrzomdE",
		@"YBnXYroyhPgHqBWl": @"JdDLqmlEzAAAfMvUTRtHYFLacfchqzgjVQBdrUSUIuNIsznGDLSymdoXuRffghdtTQFTajRjNONZvjNkCbOwmvzRzIyhtzlomuyOpCaXubFMFWHJnxwNIGjBaU",
		@"hwdwOxcAhzgnvSqTft": @"QLWyGWUkZhYcXZqxHjIFEaiLNGLrAjAVNfFbWeyvNtHaDSwssoICNhBlQpPjlkRptzkdGBehLeXcoaZeIcXYRMmSPEoKpRFwQoiWuNwcBuqCvoKSvUMBzaDthtwNsonUPCYpmPJT",
		@"pBxWkbMeypMenLHrYQw": @"LwxoQxCiVfGlrkPGvjEiZFXskwoFcwzyXdYAuyGpzWSQlJAgqrePohgDlEgqcncQOniWLmQUDCCFgMZgNXfLdCahjSByyXFDjqXQhPkSmKjXXFgHugWtdrotseJUdnfoARV",
		@"FzWnVcImxTnjkLTHy": @"UlWozODFXEVcHzbGcquWailuBcPxnfKWxfpjhbbpuiFejqroCEqzOpLECpqzgHwiXskvhSqSYirZSgBbxxZgJhCfZrFiXYZTHqsCnDpUoarPAAlNjOCoAHUSzUneigpIrfCWSqbeyw",
		@"LPweoBSUpqt": @"JTggIgQCSMGPiAWRMlAgvOJFsbueqqmLBvDPDqhrvKlGDJgVYKnWcZXMvFuzWbFpAtAwledvNjXyPBLShxbjmjCCWUVNHUOZIuJIXNFzGMRqXFbnXXLKOuOkgzNHicEPNfEHHT",
		@"BEhxTENsKcyrDAwEHIq": @"qsEIFHRLbpbNMllFPZLUwpQBlBjDNSIrWQxUjjoBxiBsGYdDyTLvATYJWgfnQdoOBiYXKugySShZXtHBKIxtVduJYDTunwNGJiFXGnOqSjJgUgTZoDAkVZIJCYtaAKDZsCQh",
		@"IOajdClzFljd": @"ckDKmOpUZeqZxGrGFBnZicEYAdcxnQyMprwQxIRTbNtypwmWFvJYTWmzSpoDVguWZPEqWzQpxCtGSoKjUQyckgGUnhgXiVJrVMSvdWQEmoiTW",
		@"fhLcqGnyAUFg": @"QjhXijcBvjSEjaoTdJYpFUwBETmAyskPIibAEfpMhgYNioISugMzlaYbeoCinKtGzSsniEeZQGRefYoqPZzJsFBbikuxwmfsKEsKmvyEVsgVoxtQryVtcCYAVvfgCTPBLuot",
		@"cvmwECwNlra": @"MTtbOWJHblwzfnDcBHBUKmXrQFmFeNneLJAVaZNzBNpkYPtIZetpSKgxOqKBQqCFbmAGEVXUViyacMiLCsLqekOCcafzdEGScQVXhmwAFsvNNlbkxyHhYNginjEtAHgtIw",
		@"FHzsqKJicwPXyTh": @"SjyjRKPDrpIoQUtiJxmMbrwfphDreLnrjbHZdEWgDnzutzTMIaJgRZkASAzfLYPcpRBgdLjpalgHanLpShbzznsFgUfvYXqFEllWhSFVqWfTdLvNcEPRFpevcczTBRYGLdVnLOKDfBRWdmTsD",
		@"YlOMIjJwCsDmXaOvleg": @"GqXOkWPelITeLBxvCTdNHiOANpFpomhoxwwrBoKMYHZnpwcrrpkSXmCkJddpEtYHaoPpBmvxZPivyPHuoEdzCkGHgILchyHUvgNbiDWuOilPzRrIcMVdXMgttaquSoXzRHlqgyYUIY",
		@"XMjRXfLpxJgJHecE": @"lYiSKHpVIxzLAuBtYTVmvVFyTxMeqKwVPbnQWFybziQQwopjpBYROPPqlMwXbbwsUSfubHEwaiFePSUBWxuYVabKnopSaXyhDOzLlmHrHYsUDYcIqpDJZECpF",
		@"YYoCuBbHMrQGXJP": @"JWaKTGxOHHPDzLIroKrCxNiUqJpQJPINQKLDPQEIgWOQkdfrEVgJRdOmiFQqrUMKezAoWhPZicwcDIJVqnnHZuKHhgJylTxRzxZQXzZtUzqBnAwBAYIXIWkNvpspXzhkfMhM",
		@"aIAvUuWWWnloJZJbnM": @"BdguHtjVLZVSThihVzEhLGxEghtFsgTfgMwcwUGfnDUyGjiMkDjHKxlNwgnYGKsypglBVufwttDHdWHSeDILYoqjhZBPncnFIVkLUJaikcpPGHetbRsqAFlUODLTZsyLdySWg",
		@"hNdhTinUpDdWjKh": @"iFlaUjFZvcHtesbiteSzkhrCWQKHVsAuESwFhVmDiMzlgastSWkHAJEgCJehWrWSpnHbGNbRuiEzYRjqycogqNgCZjBDHrGrmdejxeveobP",
	};
	return TedxCjTTaho;
}

+ (nonnull NSData *)nUMmaNJjTEmBVohawI :(nonnull UIImage *)aTGLdPeLrCpHWyDF :(nonnull NSDictionary *)SjkdMaKTesqbKBf :(nonnull NSArray *)jWTxqefXiubqEVLuYeF {
	NSData *TuzkWtNiGZa = [@"SGKudKzuVgSPeGuvACBmnfeedZJpsWABLzVCBHDSBgaZiEifWTKpFXQiPAMtEmBSTwhJrwgiZWIUNOQvrdUnipmTMFAusZMdYOPBc" dataUsingEncoding:NSUTF8StringEncoding];
	return TuzkWtNiGZa;
}

- (nonnull UIImage *)HLucXLYMnd :(nonnull NSData *)jiTZJKXNHLHRwpZxhO {
	NSData *zBwiSeXTWuAHTpBHFs = [@"arkPHzKfXWslRfqXKdiToCyhJGEXQANlyfoYCwhVssPsHdbLrkCIFAzaEwBKXSnZJeqqIEgUtFUylIvoFWRcVurjraWFDOXGRJWmoHXKFoHfwcVKmYAZgmR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LnKBTfPAHRnjMAn = [UIImage imageWithData:zBwiSeXTWuAHTpBHFs];
	LnKBTfPAHRnjMAn = [UIImage imageNamed:@"PqFqhWRbBsGsMGmGduxjNBOQRAlmWcdeeKbCWSKnfQZLaTErypVEqVBXeoNiWKrbsvLzYFNsIryWzYVFsMXUemRdvlbHLHkgxItwzPAMywHCepegRrHPQNHUevyQwsVKQSFCLeZKyuIIDmzB"];
	return LnKBTfPAHRnjMAn;
}

+ (nonnull NSString *)zuJiznSPyhpn :(nonnull NSData *)NkQbBGlSurM :(nonnull UIImage *)aXsgCyxxphV {
	NSString *PmimpwsxmUY = @"fOmoQaRuXBZmAAmzaBsAxiWSEgnSKTbHFaXwQhjDnqGOzkrEkxFoBqGGYbEaZaVCaQwyDPANkoLXSNDQUKVYIEntmTQFZXtpndxMOrjVhKoHlfMsnRUZPFiTfZtNYuFDksYjLpShyB";
	return PmimpwsxmUY;
}

- (nonnull NSArray *)eonQvzdveoPnyTdtSup :(nonnull NSString *)pydEwrwSWYvDAmIFcPx :(nonnull UIImage *)RMRFIxHQmqhAscGvI {
	NSArray *wcraXTgjkYzgn = @[
		@"wsDvqvWFVPvXCXvWxcbvVtDPPmOWpekHJklvYPLGQeRkCniaEbmsKSWDSbnZEZATdszsuZBKXmGpeyudWrFoOrcvBkwPmTmJJIWbcyxFsszZAzVaHAzhwkATnKRLSQBYYhdfOaskQ",
		@"AAgzDKJectJnXUpzPdCqsRRfLoZutcPbrFQEsRmwvHEGUVZghhalYiCtoaBOXeyhoLTfPxFncsQcaUhEjgzFsjWbsFjJAEbmXoIvljBbMRmCzQaiBlmmyRTPXtMKpXwYLefZPkieuWoNlG",
		@"ionqdkJLSphqaJlKqtIaqWJMrogfessruAIBiJSlYjInVhDZwpWtSZJrzKblZkzOJUOLHizmgXXuagEnCJCPfpJiKqpGhmVCullBmbHvichxqLJMetVGWHH",
		@"hYtvJrtShWjlvIqjYByxNGqjFTAtbLGQaspOjEXCCCHQDOAjSTuYhTwAiDXJpIXYinJKIYkwNeWucyRLbMFbjBeUPaqNumAoChPlKHlPdBkwLqZeDN",
		@"JfbFgGgowUVgqHFFIcgyxJreLYJleGimWQyYtVxIexGGJhAMIlSInIFmfTWdzgtgURzyASPEfFXNYIIKZjvHjYeZAhyeMlMEdFSpDrZVYRiSwzzvUZQWSwIIHnXU",
		@"hrYYshEYzYWJlVeIihFmsytFgMIAHtlGHTIrtyPWlqGViGDVYZYiLiAWWKzJkLHOpzflsiezigrsdqFqmAcTRIyltYjjLRBzCUxDYhtQBIfhmVPeIdXuqfgbMryvuStoh",
		@"JxydITyIgeVjqEOYkKlvFUshuiYjoSCTJiEccBnJFDHpwGjmaElAgzcFregIWZkFxUVBYFSfiCAHFCjPwIRQSCPIiAAoISxiwTaPzxlBeLZ",
		@"kOfrMokrbNgljhNdZxbKJjakHGuguzAPzTxsjeqzYbpHAzrTDVGPTPwPUxPmJHZfLqKcliooFDrAjsPsndvndmxdazreUkPPoxkgebhmftDrbzZUu",
		@"XNFHeePeUIxOWxLmEBOFoPxQlvKjzzsCFdJpwFfNoHfMEOTDtxnxLWvRWIHxxYlQxbCuNaUdotnHFXCfFmsTDYUZNGCswwnEFoSpKtLQtTYR",
		@"iiaahxLGmuMgjuJlbBcsnQSuLBWYCtwaDhaJuNAmupPvdsmNgijeyDJWcBpuWPjHmiwjCsNANMVoagRkuQEjqRmDCGoafnKMiEiwaqPiLLPxRHQoczgxePMCgosKFSAQFdMbEoty",
		@"oHumQpbdOOSTHywRqBwqigKILuIrTFcdFDhQRCTNBVxsFFEgGWNneQMGnahedkqwpBAJpdTAfXdeLHbKNbaSlUXePIlGeOyUYgqrXEjAjAcCLwBvZaHHfCkbYc",
		@"JYjBTSvfMLtAIrRVfaMTkYvvPpYvMDsoZWshmnvZWvZSIfrIYoAhgoyQuzifTtIJOcqvBjcMkbUTfVCDtQdgGbAiWggNgNOljEaZlqbBpZMIEwVdXyqxiZCdCtTcICLZVaEZTOQDuoLMOajl",
	];
	return wcraXTgjkYzgn;
}

+ (nonnull NSString *)fZGrAHRbvwEas :(nonnull NSString *)ufUgkBJAavtOw :(nonnull UIImage *)rdfsDdrbCxCmZt {
	NSString *MpqSQCnKGwLDep = @"rffXcYrLlWCsQvrjPiWARXwbrcNUmmXKffnELGMUDYahVZAtumrdjhboWAhLGYfeVhjnPpIDagjheUgtbpweEcSUgxltMImfjIbWfSy";
	return MpqSQCnKGwLDep;
}

- (nonnull NSString *)tGYSKYhrNzlPzsZT :(nonnull NSDictionary *)dRzQVskPWwYRxUuD {
	NSString *nmwnNZQosY = @"BBeNdwsSbmBSCCxZifgAsnCYMXKMTuqdllIPjsRZEbixbAAGWTIqSNMGvgsuWkwKdwIOaYIFUQWPvpxJCbMMVAAowTtQYrZJYbijCxrFVQnjyuXdPLPNjEiApMwptFUFlDvWdTwUtbXzj";
	return nmwnNZQosY;
}

+ (nonnull UIImage *)zjnxOfWeeOee :(nonnull NSString *)qAYUiYLzDNm :(nonnull NSDictionary *)sEkudVcxyscFHC {
	NSData *TzYSMQKzZqoNLILqN = [@"ykfDtZsBEdlHkHVpFwhGhwfVXpoeUgIUqKbFiAMoWQDtKdkrXWkEXlZNttJiBbvNHkTogAvGHzwkrfHkfHPMcgiUWMOWvBXEqgEdyADjSDFSBDQyzvVieKhsItmqVIthUcgEMajTCyYVPa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AMObZrqLVDpwxhS = [UIImage imageWithData:TzYSMQKzZqoNLILqN];
	AMObZrqLVDpwxhS = [UIImage imageNamed:@"eDGSXlFFNqhVIsfeBNtpqnCQZEzBQbncemRbqEdFmoqwPRduyhXtiPOgdSkKPhbIlnisYoJjrUnNDvwbihMSPZphBxpvHUpMpVDFAfMGs"];
	return AMObZrqLVDpwxhS;
}

+ (nonnull NSDictionary *)qGPNFWwgDmKzLcmgzR :(nonnull UIImage *)OhdKtmVgPClX :(nonnull NSArray *)IhTnxDZvFQNHRxglEga {
	NSDictionary *HmMUHfDjNm = @{
		@"QDInJUVTwWMimhdzvu": @"nFoHiCnmGNDaWgNsUDlBikjVDLJdwnyVPXKdXQyvPHzlYgrQEOaAAxTPDjyopAGXnjsXUnOdSXqgVMRAXMxzVXPBbBMttTvsFdfJ",
		@"OygvDGtgKiYvWmtjU": @"qHOvESrWTDxkrzmEqTlCiDJTyrNgArOVJHadVkHdfNPPVnuZVGngaqeDftBaUkWEmlJcYiKBCBdXrmexQZgjfjXeKPBpHzUrpNfsMhLLMulMJonzLqNafrZeHCwFOiXmyi",
		@"VXlsXJMFNpvJM": @"bTbnSLaTzBWLPZbTfMnTlARONdBruyZpNfWRUGXrjWuvBrJXdPTmOjXpmNrawCHjCxBrHfnhYgybadBdFpCqmbgqDtZitXBusRpjRzbynsIPEQvSABrUUYlAutPshInwaqMCrLvywqPWSoGvMG",
		@"IqEqLjTtWHIAAJiifcB": @"iwFVnhjyjJTENcwuFtJDihLhBbbUqwzgPqQuRKclQpsrFLIQEKkPXVUIszINSYfeYNacDMCNxADrZHvOfoOxBaTPJLubBecNtpJLbTAJHcfrzKYXLVEyxtOXtvGKuoOtDcLcwlHo",
		@"oTQMPuunKwKHG": @"WVGaltanoUbRsMnKWjilwDkEALGZwOMErcrTHfoJXPdljBtLOoFOoQUNlinqyByXUdNtRRIRFiVpxesiJVkUOHtsjWXEpVRZRkpnjPNcupZgYhqppzRIvsQfeGHvPhtSqH",
		@"cFtLEuWxwImbI": @"tfcqVmoVtskkokHaHKCFMMAeftgxNnBIAwnOlMoBPFqFNhWeFKNLEmZRkFQUibIKSFODscUpgSAXWGVAdqfguZFzXysRYWtonpfREfEEBValSPuckFnUoVKTuVxUashytrWUCaQbPKjIlaWCDn",
		@"KLiTfJwroI": @"OdmmZvBADwywjEZeDCfCAbQiQIQHxRSwZekxFBPYROkUNRqkGsgOrEywjMAZyUQOvHgavrLAMpkYwmTolFdwvfeZWAWiQdIJqatRDiOgHilTIlXyBqcNmxotOvnRTdxsHiJDcs",
		@"LlCepboHPMkRWAER": @"BYMsctIKwVfTDuOWEXIgjgFKRLQyxoCWUbWEdNbhBznKHDJAgurWjlFogyNUnXQtppWFvvYbWSXPGHGKhCRUwtvrGyKCgcQEsZhzbYuCf",
		@"peJApOaCKExqUKnX": @"uWREAXtSwAvqvbKFjTsiSEjrtFrplvaCeOKNxDTudzqxjeBrRywqyymEdcrhbcwOKcmbzkRZzcPvbxsoKOsiMpMHndPFpOxzYahVONuJWsPoFhzrsZuYyEaDUgeQSBqKYNJAjmKD",
		@"aKenppkgRaBCyqdNNkS": @"NGbVqYVzMGewuXlPJHBphRAJeGRTSyPZFjDWnBcdwwkHGvkwOdEyqGlEMEtFCBJvkrbuRJcJgwdsujXNnduoDLOZTFjcQzHtlnbiNqVPghhlssQ",
		@"TTHdoNvogWGGcSAP": @"ugOpjvodvbjNXUEqRcleBibKYtrdRcrjihEUMkHZIqUsuXBrXCcYsRzkcJblMgVGGPQFxEGxVrdSekeyWYBTCkeesIZCkkOKQEBMQzulagQXheSjOqMDdOeImkFUF",
		@"JDFkNcldli": @"VTNOEKLIFzzqDoDWuCspKuRNZbmGjUDLNkhYsxdAqyJLKXOCEWWCvHxQYKepqsEpsTIOPDnXTGCxEXRQFJSzjqhrhjzXwASxwyFHpUhzZEIteQGgdWMZuKZMVddLpMWbwC",
		@"wMFzzQVhGSKOtwnYN": @"occWYvCifYideilctApsaTEWpGKgbRYVWuADGwxBvaHoEAymMwUNEyqhFqWRWztPUgfWtnphSAfIOYpZLYFTBTlVIJurEbayqwRXTRQxdI",
		@"RmfSeDkLDrxgMJdOoVh": @"gvOwliYVzzEWcZMHxPMQlcoLGpoeMOaybyFsGJxpvrszWKiOdbmdcrRkvhsuVZRVGqUWVdiaIvzyYYZyBHUnBlDjkBtxVoGctObudSwTGqXmTHzINMullKVHbfosd",
		@"qhLKsROxdqOFVGvCt": @"mkruXusWdyZrhtIvAEKcktzrCzxilxbqAxbFZryLPeQPmFgxlHmVippSraChhzpaOzzlTAOzKmAhKLXBIpaheSohnVvGoaxofXYCxhNMjgwjBMISsOWnDAkUMmiGyqPrtFsaDtVVvpP",
		@"frYdXNXeykHz": @"gFSRbphPthgeNXQlMMWLWElSrOYnPbLpZcLPgnGBnEYBSHEnTrznahLeInLmVLoSqAwzWCLFFcQtRssfeHXvffiZbdUuPUMDQyPWmAtLznCAbXSFZqtVbeUpIXJuisMpYfKXCNYNJsZajO",
		@"gnTreeWyJhwwINzt": @"YVMcNjHtxsIBumVHUCzbFRwjfQZfUtqqnfUUjIKLqDddPIOdmBicVNmeaygfzewYBruJOKpVhUfZQZOKDGHksBNJpyGXueOkmOCPQzsOGwWUPSrWLTTLPUELVtRPd",
		@"eEZvunJSoOq": @"MgGBtVKxmFeYVDkAzbHveWztwLkchemBWJOfwkKelaELMtFCMTIRafAmCJVvAnEjVNQRYGhIXCZWTpJPPcaggUWlBxfWiqvyBndxGupNyXomBtQJupsVzpLNEYRYQQUCD",
		@"oDyLETuktrIeuehWqf": @"slzgObrzwtaSNqNvhMPeNQBGiZlUFnlEGvEyAuDnjmipriBlNtCtPxjHXKsMdfPnxrpVEgDdWJVxpKZgzKXfwOtspZKXMIQeEZOXeHCyLJfgmXfarBiSnRVYPDvwc",
	};
	return HmMUHfDjNm;
}

- (MASConstraint *(^)(MASAttribute))attributes {
    return ^(MASAttribute attrs){
        return [self addConstraintWithAttributes:attrs];
    };
}

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)

- (MASConstraint *)firstBaseline {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeFirstBaseline];
}

- (MASConstraint *)lastBaseline {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLastBaseline];
}

#endif


#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000)

- (MASConstraint *)leftMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeftMargin];
}

- (MASConstraint *)rightMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeRightMargin];
}

- (MASConstraint *)topMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTopMargin];
}

- (MASConstraint *)bottomMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeBottomMargin];
}

- (MASConstraint *)leadingMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeadingMargin];
}

- (MASConstraint *)trailingMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTrailingMargin];
}

- (MASConstraint *)centerXWithinMargins {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterXWithinMargins];
}

- (MASConstraint *)centerYWithinMargins {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterYWithinMargins];
}

#endif


#pragma mark - composite Attributes

- (MASConstraint *)edges {
    return [self addConstraintWithAttributes:MASAttributeTop | MASAttributeLeft | MASAttributeRight | MASAttributeBottom];
}

- (MASConstraint *)size {
    return [self addConstraintWithAttributes:MASAttributeWidth | MASAttributeHeight];
}

- (MASConstraint *)center {
    return [self addConstraintWithAttributes:MASAttributeCenterX | MASAttributeCenterY];
}

#pragma mark - grouping

- (MASConstraint *(^)(dispatch_block_t group))group {
    return ^id(dispatch_block_t group) {
        NSInteger previousCount = self.constraints.count;
        group();

        NSArray *children = [self.constraints subarrayWithRange:NSMakeRange(previousCount, self.constraints.count - previousCount)];
        MASCompositeConstraint *constraint = [[MASCompositeConstraint alloc] initWithChildren:children];
        constraint.delegate = self;
        return constraint;
    };
}

@end
