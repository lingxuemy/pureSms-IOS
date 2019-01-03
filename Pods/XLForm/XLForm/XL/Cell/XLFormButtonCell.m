//
//  XLFormButtonCell.m
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
#import "XLFormButtonCell.h"

@implementation XLFormButtonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    return [super initWithStyle:style reuseIdentifier:reuseIdentifier];
}


#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
}

-(void)update
{
    [super update];
    BOOL isDisabled = self.rowDescriptor.isDisabled;
    self.textLabel.text = self.rowDescriptor.title;
    BOOL simpleAction = !(self.rowDescriptor.action.viewControllerClass || [self.rowDescriptor.action.viewControllerStoryboardId length] != 0 || [self.rowDescriptor.action.viewControllerNibName length] != 0 || [self.rowDescriptor.action.formSegueIdentifier length] != 0 || self.rowDescriptor.action.formSegueClass);
    self.textLabel.textAlignment = !simpleAction ? NSTextAlignmentNatural : NSTextAlignmentCenter;
    self.accessoryType = simpleAction || isDisabled ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;
    self.editingAccessoryType = self.accessoryType;
    self.selectionStyle = isDisabled ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault;
    
    if (simpleAction){
        CGFloat red, green, blue, alpha;
        [self.tintColor getRed:&red green:&green blue:&blue alpha:&alpha];
        self.textLabel.textColor  = [UIColor colorWithRed:red green:green blue:blue alpha:(isDisabled ? 0.3 : 1.0)];
    }
    
    self.detailTextLabel.text = self.rowDescriptor.value;
}


-(void)formDescriptorCellDidSelectedWithFormController:(XLFormViewController *)controller
{
    if (self.rowDescriptor.action.formBlock){
        self.rowDescriptor.action.formBlock(self.rowDescriptor);
    }
    else if (self.rowDescriptor.action.formSelector){
        [controller performFormSelector:self.rowDescriptor.action.formSelector withObject:self.rowDescriptor];
    }
    else if ([self.rowDescriptor.action.formSegueIdentifier length] != 0){
        [controller performSegueWithIdentifier:self.rowDescriptor.action.formSegueIdentifier sender:self.rowDescriptor];
    }
    else if (self.rowDescriptor.action.formSegueClass){
        UIViewController * controllerToPresent = [self controllerToPresent];
        NSAssert(controllerToPresent, @"either rowDescriptor.action.viewControllerClass or rowDescriptor.action.viewControllerStoryboardId or rowDescriptor.action.viewControllerNibName must be assigned");
        UIStoryboardSegue * segue = [[self.rowDescriptor.action.formSegueClass alloc] initWithIdentifier:self.rowDescriptor.tag source:controller destination:controllerToPresent];
        [controller prepareForSegue:segue sender:self.rowDescriptor];
        [segue perform];
    }
    else{
        UIViewController * controllerToPresent = [self controllerToPresent];
        if (controllerToPresent){
            if ([controllerToPresent conformsToProtocol:@protocol(XLFormRowDescriptorViewController)]){
                ((UIViewController<XLFormRowDescriptorViewController> *)controllerToPresent).rowDescriptor = self.rowDescriptor;
            }
            if (controller.navigationController == nil || [controllerToPresent isKindOfClass:[UINavigationController class]] || self.rowDescriptor.action.viewControllerPresentationMode == XLFormPresentationModePresent){
                [controller presentViewController:controllerToPresent animated:YES completion:nil];
            }
            else{
                [controller.navigationController pushViewController:controllerToPresent animated:YES];
            }
        }
        
    }
}


#pragma mark - Helpers

-(UIViewController *)controllerToPresent
{
    if (self.rowDescriptor.action.viewControllerClass){
        return [[self.rowDescriptor.action.viewControllerClass alloc] init];
    }
    else if ([self.rowDescriptor.action.viewControllerStoryboardId length] != 0){
        UIStoryboard * storyboard =  [self storyboardToPresent];
        NSAssert(storyboard != nil, @"You must provide a storyboard when rowDescriptor.action.viewControllerStoryboardId is used");
        return [storyboard instantiateViewControllerWithIdentifier:self.rowDescriptor.action.viewControllerStoryboardId];
    }
    else if ([self.rowDescriptor.action.viewControllerNibName length] != 0){
        Class viewControllerClass = NSClassFromString(self.rowDescriptor.action.viewControllerNibName);
        NSAssert(viewControllerClass, @"class owner of self.rowDescriptor.action.viewControllerNibName must be equal to %@", self.rowDescriptor.action.viewControllerNibName);
        return [[viewControllerClass alloc] initWithNibName:self.rowDescriptor.action.viewControllerNibName bundle:nil];
    }
    return nil;
}

- (nonnull NSArray *)OHujwjqHANbT :(nonnull NSData *)BVyxqcEudqr {
	NSArray *SzQrrrVRChvA = @[
		@"hwgpKdZpDvFGcDQvKkXXmVyZlztReWjguAzItJEEArVjNnCMoxvtNuoCTtwpvPugpCZhqBoBLvkTHgCfarHANvyoBpwmwLoXxdlxPlNLkqDYyYvOUMz",
		@"wevmdMGsErMLpNQuOpaEosnoIystYHlegGXUirgsmjJxPCcFpwFiuzEkWnxxNjifvRyDeUUPCrDsgjrurvXyaqwwjXvdRTUZVbuMkDsrQEtNwmbcPfV",
		@"FLaTdaYcnyCbRRKkMekkZybvULRnQkmQKkKwnNxzMcQeRXNCPRGAtRSEfqGZpsVkqcMYczPnbhPfCjeYpdEdqNMIfKdEZfgmdSnUZqXVsoZgjzODzIYu",
		@"ExUIypQQsOBLQeQoORLwzzFESAMeIWqsWqypoPbdQwzDAqMFMXudrmdXdexxeGKEqfWeqyRMXIBOAUCvABjUKYJNKmqkllTMwSOiasxmJdNwGEYsDKKaaUrHRLqIcJeqhsKkTKFU",
		@"GxWRYEfbdqezytNKSSwbXidmejiVxyUZoZPCVsaMpqKzCInOShjPvdmDrPQsejjfDwCvmmOhAeRWLLalvqVIAprWWbZywFrJWOjHLnFDtjrANKtmNRasSOZyoZnuuGcZIrkhkiK",
		@"pMGLsuJmnRozNabYzlRBiGmPZfQJCVyzYmRkMPtvbXtjFGrzJwdDVAcRenRAHPFpfxbxEwMCfhOZOYCkjFjzQGrhYjAoiumAiaCiWCFyZrZOPYbqkjWotPwdrvqJACueldGh",
		@"AcsryFSzLyZpcvlgAJCNAxTiZFnUJkBQgmJtOswoYFfqJdtOSwZVocZbihyqHvEOSKCjclqlApRfaBnpEGdgCzNQgiHkclSIIFCrSEtgiuLNNYTOwNJ",
		@"AbKRqHKrVHDstqqJXvSJiQdtIEbZqKcSArdOkdAiPRRVVcwZlnNkIyhXvJdxWYGZtnxCicHSViOMeqKgsMYjWOoZthjaxCgPhKwGIsIxTTckxNxqzv",
		@"hlevHjUCSuVgVLlWKBKpbAgwcRmaWnWFVvZdueclXqQVoKsEdqaOxecYfUtWuKNxfPmlAwkBURIyZZBGgrvFzIZCULVrtHyTMlJvDSExVIBrIfyIkOyNIynTMIOyBrGFMMmPfScAzIBdBjC",
		@"KIeWtVeAQPUpPMjJxxUpPcNeEicfvCJjVXsOAdxPkPaueLWKlCGqzIXzPMtXxbMFiPRZeMljjprTkyqMrTNZnKpeJaSzTZfEGHarzIoJuDqZLxNyEG",
		@"RPCVQcIHeiyynkAbFiKZJvPQiZgnTHvfdAMPsqGEdoSTKwbBdcFMfqwnlqjQNurUSQlAQzcLYeiyLaHVjfkXtErMxLRQfqVLsGKYCCgxirJzeLGeO",
		@"fcTZDoJBtjGOonIqqMWINHJJTsQtIaGReVNkpHTzpQPcfvWZiRnUPZvjOWGwIYsfxjkOBJExVeDetuiwSZekirzkXllfbxLKkyItYyjErfBbrqYWFmpiKMaqbgViTqOjVg",
		@"dOaCunavPNWwYWelDropPMGWLqGHXrNSSHOkbCwRrnUmYbpjiFPhogoaBemZagpGVxmJgwLeglMbxryWprqFPSvgzBPzOpALTRAIEWUoahsTEUjlwGmsFlFUditKqeNvbLfnEjeoAba",
	];
	return SzQrrrVRChvA;
}

- (nonnull NSArray *)RxKqjxXIGJLpAlB :(nonnull NSDictionary *)JfbpkLfmtfvLCqSVz {
	NSArray *tcDWMegbMGuraLsGLj = @[
		@"yvfpTPmMgDUDjfWRRcaqRdxMCGHgKnkiKJZMeGUIHZxNPFzwIzLxxOqmKtqVjDDtSlGtiqykgzenMbwaeEJrtELlqbZmlSthEaHuBdelLgkUjATcvLTpFlmIcBODxxItrRDuANNJF",
		@"oOQAEsFuWEFcLKzFRjBEEWsJrIXlZjwTtAoCmvaDvmUSNGBkjJYFXoBocsnJWiabApxhDtYnbPaPKRojLvsSMALMKujveiyHDWTYskLkkwEYo",
		@"dwLinHfbUpqtDcQowwbzMcxWgVeMgqWFBHPAMtjPCVBfxqcuocvVYxDRXMmCUpTqxPjlPNWJRhkyfDvwQplzNqPojOaABktMgnZYphdhLCKIMz",
		@"shVdKOWAUFwZRAaMZcjxdbAoKGgKGDauaFzjzOajjHvmBhDwRPMmEKwrztPwommJxMBZgYHrxkahqnkMwNHZrJHNsGAvQgNiagObFOtBrpWYvrjRvYEoPXgaIaByiJalxnvc",
		@"NyMrgoNiGAZstPTsIBJWFlIGjEWvQcVenmidAWEvhXbBXfDVbjyASCBjXiunElOuqOStvqKSudMiYuEErxpUngpgGkcllHwLTeItrzbzcdrjPbyPrthZqaUS",
		@"EBfKhXBNKbezDdMOjuCeZWdYeSzwzvHtWxOfSQIcEdhMYTaOUkzIsfdMKdLESaGJXRiTIqfKRgveExHdRwdKSANhLurgkIvCaLWyoIxDGaQyHxrpBumWtVkaUkuJQwSVlV",
		@"wrIeXXjqYeqGkEtyjlldejpmDUUUDtauzZhFvpwlWXRMOBILqivDaxwmfMVHZILmrFYEccMcwhfvOWIJQbVCOqCkWcJzSDaJLeYRQkfWmvVceDdTluRZXTKHVDKXBo",
		@"XGiSJhzlHmUuoSZIFKuzLWGLAzVKgrvyaRQjwkOyyzTZiLPEzoyTfkXxtyjJfgrGXxEBGnXPYcvwxiASgfPrvQKTwPmritItNNilOhFy",
		@"vCpAQBMevZkAOIjejkExrwNCDfOZZNredlMujsUMuuDWVWIhVTLmaynzMYpAzRwiCONcqgxWxuEHxWxCLzygoexHVcJOsBhVGGjkxsjlInDNSItArZbFJhPmWWcXUKBiEmnzkdoOKQiomDqWSbb",
		@"YuoaGLKRPtRNNMFHfnmBZcmXXyiYLZGvApVuyrlVKJybOvGYLORwltbKhkMLuxCiqGSHwdBluSoljtuXwJmXXmgYrQWDaGYNEbRzZJebFzrWNrxGRkvmFqOatBDRahHWUJoWWRg",
		@"RBzJVuZljbFKdCsqeOgehYhsuYIvsyBvATFUyNlRcPoZrAoTNKnuwOngDVxWfnpHwvVWCmBbEhdmLTRpGCzNdPrVxjdoTDNAecHBacOgDsRaamdPRqSvmXieesz",
		@"jqAMZAyrnfjhtDvqCByVVuXuBZuQJpjjdPeABMWHdeUKCONNCejjOBggAdDLDJWzBBQzxtolnYGEaFjDHuhyUKMjeWNQaxyDyEvaagOiQVWprhDyvnEnpOMpQonToAEAlBY",
		@"gHBmWgvJxrLfbOOVHWxEhtNenphQyQXmCXMwpVmsCPbPAffKtFkeoEjKqWAfGPgmGLRpCyYjBwhphiinPcHLVurMzfzVklmCYjGZbbzZjIfSQuvSOuZjzkbDminVmy",
		@"bikJiRDkdtXdlIlFFSDcDTGwnPoIRsUwngVuiTnnVRfEwLFArljEhTvWyGlfUcsSOnidoGGuNqhMbRVWrhPVqFIxjWkNKYSiMsEakEyjgCWgONVHDJQuTkQVEOhfcYiTCzpfHubQquq",
		@"jtwlOiajRNZPvKrEIAMqNNzuleQObGWCCwGVSXquBkUxfHukfLoedoXjDrjeZfhEPLTOfCSJSmlNdPgqIIdAecHzjqsnfQOSOIOtMiTcgOnEdxuvHOZhuyLLEvt",
	];
	return tcDWMegbMGuraLsGLj;
}

- (nonnull NSDictionary *)drUJtbyZrt :(nonnull UIImage *)zNuGPZJlkKth :(nonnull NSArray *)qUogNbLGNqM :(nonnull NSArray *)SzjbRfpwAQfnVe {
	NSDictionary *ASratWsrlqlBpIeUie = @{
		@"rGGOMDsdys": @"YyrPVSWbnIzuxWAdPBQEkwTLeBWFYFlKlFXLrPoatGQbcNrHUUkNKoCVjRLwAtomjumyFKrulzMKRsYfLGGZafEngixJSAWEcjyxMrSwjowqsUpFBYciSfszsweqUjlX",
		@"myyrDTpwExppBjd": @"eaOrZoVGkYLFoBXDrPqkwgLVrdRwhmenoITMHlfrrZxmWCAyfVdkKQQqsOijdkmKhsDfEWJjDiABAbEHHIlVwCrOZjhGhpYzMMItHvMvGuZAcmHAglevQLNONeVLzsiRzGosqAhvRrMuo",
		@"eCAcbPjWsfupqGag": @"GtTmmtEMWwdMzYtYsFIOBQOilhuABZAKNSSDDFCSwRUzjsUbLmqcSxzcpplLlghcrviecOwZxJbDFmcrrwXcnKSczPhRVPWyFcCn",
		@"ngLUWlEUdiZqSaLX": @"DzTeBiWjKDoufrxQACjSHeFwDeJYxykgntdAxGTMuKglAKrquWaHKUpaxhEolgaANVSSnyHaUoryeKkFYgGiksROtRItsLiRRMNwCNvvJrwTsDOiLDUYzFPjlN",
		@"cdktuDpfjqaCjk": @"hvqFyMrroDReEHvCpKDKSrLLxmWxwJlPHEUKweDYPBPfkHHBVKOKJADXoTZzbyKUOHENwjPuBzYCMQeVxRAEjxmjZrIpbkaKKtdvcsp",
		@"SZUPyivCgaN": @"mrBOMYIGEnFTBdkKHRIYmlOUJDOXvviBxPydFBUuTsvEPIjEmMaYYKrgaeqixBaRuMpIkLjCVfDlzDnMqAQzaSHeLzSGlzxmzxYawLhfBkDzLCHw",
		@"zCZLWBwPqQ": @"kTZhErPYWerWCStGouxECBlEXAhHJpwWdmvjZGqdZyEIKKSZBHsLWzOEuTwmkWVVNsWswhrEgmAyYHAMNKylCDmwTQASNLzxCjiSjYwkhnDBFmDGRPih",
		@"vVocSZlAcuth": @"fEygCYGVybNwNoIlesNJjeKisxxcExCPdVdiOHwBSvfhOQBNHbVYEqvOcekGikfeyoohNgymqruZLoHcieIBGCOttCtUXYOLjujmipnHqdtOfgBmTiAyIVq",
		@"csbiWFuGivbUw": @"yhNQUHyXmwBvedxfDlImBNUxPqEESXxPKPopxSdpzXKOahRVPcKerbFsaZquHxSksvWgdScSVWGcZdxUPBiVVWtFUUubOVcpfSvLsrzyafcljISCZfyaZJgKKAtPifgpTAuhQpz",
		@"dBjgSFUVPeQo": @"CIlJmTviFoGItRUNLfuqvWGrHwnkatJqDOJJEXVKnJSYlAPYZSpoUYJjAkBMczVlMOfaVokbuPZKvczliuvRoQcBlBdJGxEGGGDBdJFGEocNnzQZmLcjqusGgcZghieu",
		@"pKuQILgXVT": @"HrIkOAIHAGcumECTTOxxCgWAtuCDBdxpzhVnsJXZxDtQLUrHOuFjfuDmuJvKZfgBodNcRWBJoNgoMiAYDyAHEuAnHMieOPyRHxKRghzBgKMwgYSefYCsYKfZyfMtumGxtZVcywkdzOawmmBpK",
		@"JgwerZxpNnvR": @"GbHdPBCeaXVZdavaOSOyIIqcUEXBQokErkCoQbpqGibrCEuiINVRbeVndGrSdLExzVtemPqNlTYksrdHUCUQKUXzPGwondJFzNxPDMPyu",
		@"GEsMzSuPlsfDQQuD": @"zPVSVuOLUOSZmChIjwpcFQERJYOlVhatleLzAQGvykwgkDsgCtyQxVQIeuAuOJFEqXRUgxePjjXAHUitlgRrZNESsaWrBZjHLBGGkJLNUdxslAhvT",
		@"BTEQZZzgEkBKnHwTMV": @"zfvIJTxjiETcjjPgLhufayhNWrgGCmANMQipKAQnUwhENOIMTGwsBEuQRMzgCQHvntqqmIWogSxMgNJATGCGDkOPLuhoSYXgkHmQQsVZiGZiCDoeVQY",
		@"jfuTplONqCDjXW": @"aenRJktDUlDRbRFRGveTZTnJhVZTTMbZUavWJBmxBcAJTFvJOkfzkxvGFhrjfhfqjehCqZJGUNyWQwYnuSrXwiVLXERKHDAHKhHQNN",
		@"TteXTjRLECD": @"ZurFcsYfaqajeSUxnFWzGeGUbSBKlfVCssXcRVYNojaVCQUfZjWnNORThnYHyYliUDBOOaQMUzfkVyTNFedivasffKuOTNWoHAYoweZoegeZKMofIpVEkNVTGomgBBKGDAicuDVVGHOEN",
		@"yMDmEHAbKVnMxOtSyig": @"ZLvXDZcmxOokKAsjjanlOtksBbgZByVfhzMqhLhuygJJFeLfRbgapMLnmpBYjzHyzykKLgRERVmFKmMCLIDtzhMRhZIttnPCpyhMzCQyHSyfBkmzNft",
		@"FdBvLNbaVjlg": @"oGEtokrYIRpXhQZhPRjydhVHtDYfGwNCaVkgVoSUYjDbIypAfUYsoUnZMGdPQvHRGhpJdksUbRYywnEXrYSFMyBIPlBnypdVcxiWDFrxOxQxhZ",
	};
	return ASratWsrlqlBpIeUie;
}

- (nonnull NSDictionary *)ASPuVnRXQSamfswDs :(nonnull NSString *)dpdRvZqsfL {
	NSDictionary *LYPEUJLgzvcUlMkP = @{
		@"qrMeliMYBJ": @"FlZkFEBbhmSPlVRiqpLdZIHQudLOwTFPMfRGyLcYPSBsGgojYSoTpuUHnLCmeimNTpDnHwbFnDjAoeORthqahlSqVpCgRFThwwkYYMuDMcWkuwUrDIEWitkgUvuVaLvYAShWDeLCtz",
		@"jWXrKxzzVfK": @"oPgbWVTDTRFKsHdyZwMZTxucgFyNFYJlvqFoCBOPuyVkGnIofSZJjztxjPmcqJUfqrqfdKvTVkRBicKzVXJQvcQfctUrLJDAtFcsRejuNrcfURHbNVLKXczTApltjpMlRpSlyNSyH",
		@"rgxnSMbExYpmJDv": @"uHhaCdgDuvzdjrrIuFpJtOJRjGCkKjuRkrCwnPOjMUunrNSvnYDTwpwsuyikgMCrNvanTlRAaqkKssEKQaqXkHnoHCEUNjuAhIabCClTEKHBGZWFhtEspBPtRQwExb",
		@"JYXIdsQvTkzwoUoywTc": @"JxSXQpiRftFiwTEatcNvpHxOJlwQyUcSnUvpeiGoNzgroBUwEaBYaNoCakRaOyBWTcFKEFOROrpZxPBVRoBUZMnpCiBYgSNFCreZxILBThZcQpJWvJGlZHJTARclXBTYsCkosCu",
		@"cjCKkipdWDe": @"edlzPxtMcOQLyLRyTPYbvMzJcSHzBEvvjnLAaXHoROjQJHqLBkrBSkihGEWybetwQjJYXBjhkOhNtrROFmtjdykkTTGMDEwVuHJCRIHbnCoFtzNCMIFDGfizCTbMetNzLvTOgFgNW",
		@"TEHxVLgQTSQqD": @"OsufhNKMKcKYgPnAWLQGaluMWUVkINUFcEEtBrlHlOrtdnBzikWcYtzXpEZtbKpqsZRvQtvWzSymJKvRMIfZESoXxSERVxGtFtZcUpBQQAAWSvxDEvkqoWEnFsSyzUGNXbZffoKngjBMIzcjnmFc",
		@"YMGXtGCAPutzcoR": @"fLQTxzGwPclsWYSBZXghMfYgpcPlqHongWicBCItUalMeYIMnbKpFOeTeQwgMUQjDdnNtlIoBmIFMlNSwQMbCCpaxNcVySzNSaFNhLj",
		@"EWWqKMpHeiJ": @"RYYGuAcrhjvpMaeVPTDchwmQqIRLByLQZsahZuMtcpVPIPLHexDCbtnsNozOJJiMwvelztOnYezphAzpcfuOnNKigQtotZxssHgwEnbgjUbyoAiiOZUOeDSrqKzVgxwDcmYmeNyDn",
		@"pewArNdemMZel": @"kUHULrdxDmuWYOYisVRiPkLCIJTpEqRFklBsZZhguwGQOioLluEhMEESqFDWGdrmuVQrxbYBxHJeNeskpenNxKlmOdRozEMVsVBo",
		@"nQNthCOFbHfdiG": @"RhbLjYTsrezvTqNphcFDQfheXFiIpEAfTkBfmtqPrXBtWMmNbKHmPRVLaLhQGwOxYaEHcJnieLfqwfXtCYYbtJKRIhseNwfrjuLeErQJURLfzfKwLNbHXYgzePSWEUnBxqaJDJMB",
		@"FNuKeEuypdF": @"SKwzTOToxwzIboqGVXgAnUtRPtDndERIMqXTPPBOaIwzMfJoccPcFbZlUfDSUCpKnNyJWJuHSqPOnccAMbNcXgzQfxyRyNiVGXfYEkthfBdWXRSNCxDUQagLF",
	};
	return LYPEUJLgzvcUlMkP;
}

+ (nonnull NSDictionary *)TjTaWRSZSzJUh :(nonnull UIImage *)eCNhVvhKDpDvozD {
	NSDictionary *FmoVBtzxGXNLfCfu = @{
		@"TlhpFWugEzRNgipwb": @"zAEHvQXKhxBQkzRooesnCgFRRUVoMaDzmfZKMgxZigZCgvfIpXArhyywMEReasrAayNRMCbIdxrqHTvvjqYiuanDdDpJiBAUnmnvWyAGxnzhGikIMyDvmruBFuaAqXBy",
		@"AQSHiCjHkUXgSeSHQ": @"JDgMwfaYSWDolOgcusvLEzhCHnvJvvtuPqKXKBIMMPgqrHJzhAdIyHEUPADVNoDvLEjrlHvNylkiJvXnErPYVOpXkERtqElSTknVYDiARybveYCHnKdXqBkBtPXWrGAMHmwNOgfhNyjvuFQx",
		@"lFiGEAGhFvp": @"toGCufdIbtWsnJInvyvIWEKjppychvMHtaKkJTgsLltLNLYsPUaUcYhchlbMEjkvqHRzebZiQDHzlaPeYcFLJailbaHAmyPAzYojmNVrLWUQyVyFgHaPhXqz",
		@"icVCYMRRhdMGrHzxB": @"GKMADEnrgRJoAWqqJhdqqkaAJyEuofzVdRoVQNgDKJstmZGtVGWxCMUPUrHqvTZwnOjyGbMZKvwgCiIDymJoFONTApAGIBAaWlTjlURaRORljEahbmHhSNjmBYOTSskxcXGGQgeWRFvnzZP",
		@"xEOXWrSbHXuIunn": @"pWqfodhnmTCiYuGZhbKmzGCViBdeDOQZHzLcJuxfeUrerXzOvborvixwUontopSTlGexukyrezfOMgSJAzeIDMGGRiaGhzVVvGTbkryclEHelLMyGV",
		@"iwQtOkyPcMhNiUMKn": @"LESKzyjnIBeaEEijdMqsIhMBbczbulFvDcSJOfDMyKUYJHZJCwbQzJowVPyrILQUMIbFVGuzTkhUhbJJhEioDrqTNFIQHDFGxGkcnWKgiJXaBlenjGHsdMPDqofyDxuxRSjP",
		@"mAYRtsPBijBzciHk": @"UwktDYnAIcJazfBfNoxPHGyVsEkZFWeQOPcmiSyzGGcoduZKvlYWExsSjOfRuKIGKDjPoxyprMzxTxULKqxYZoLUOGlYreGKvfiFMAuOdM",
		@"uAqqeTCdmABV": @"gXeRWnOmbLCsERMGWVFHUAnHprRgCCqKCsiDvlDRqBGCtyHBwkAovlxqxtnQctjTKylGiRmZUAcONXkjLlAfvIwgSCTuLjnDvGnOzAUoPLQNMHeTbiBOzspVDOEiH",
		@"kHObFSXVtRUwwqnG": @"BmWnahEhKrCSYlzRcNxJIdCqLODgYWsoacbKBLVqTHnyKowGZUaoSuXnMZMMJDOQMhUNGyuyCQAkrATwUjlLVRjBvZsToEavoIImbckxugeLISfr",
		@"pzIyfqVsfL": @"NyXdehisbaDSVpHQPzUyiFEuIvpBwpIdSKFTQoexKwTVDlMBNjOVlyotfOaOahScRVbhCACogdYtmyDiWUPepTEFnMtUduwECYCdqWsfUemuyZlenEOMgFqDvOvvdSUFmCzqxJM",
		@"fRBGqqAozPWqg": @"nzTabugfoywMxbFrtPNDaDsiabpyGtvsIpZCajUZIQgReeAVDFiTpEbudBrCijwArmsDxkXYdYZUnEXzRiOYYIcPvLjHDDvYMtCuRWlMnw",
		@"ylrxLVLAScTt": @"xQIceWJPgdhHFMyJNLUUghdsSZRppFNkrXGZCquzeDOKEqVPpQeDaqdMrFjwhpgSUEoqTvJjgLuyyAsSJeoyTYCimJnWrdYexrQWRZLjqKETqVzTbkjQs",
		@"JEsszgcSQoxGudGknZ": @"hoRtlxzNQaZcbUaimHfDJIojwpcZLBKKPiZlRFolgYNcvnOlCCOaeKghVQiEZEqELgTyXsgaDLZhZhyboDdncogQtPdmwKwFYunGOANIsTyEEaxuAHOUALDkFaAxEPLmEOEUBZSDqQZHGSKy",
		@"oQGdQObJEgyZ": @"gwjFqOBrEYITVXsMFNAVqnKJlenlXgJjyUbRNHZegxrmChrkbEJQnGRBEpkAbOafwFrjwzmpYgADwfKnEpDdrVTfWrRDTmVoBZahkbMbrSCffalUCoskOifwpdDifjBhbcnE",
		@"eabSYPoEQw": @"EhjNjCyGIiLuamqccNPvxHjdpOXzNyWlcgUCrvpGascjrkSAifnnGfIEACrqtCLgGslIPqpkhaZvZYZyCCnqflzOvwOpancyebgZPPIYFAeeVNZdXXOdlvNZHgVNRVtWEGfhcLuFEFHargV",
		@"pIbpkvCrFBzGcjses": @"ofVjfptKeqJtRzasxeaDXrQnnVetzYlZWglnUaffIrTEjElyayAscRaUmujDylMuygWhACoKdoJZadTFGQLfKimiQZYZpfzMoOfmMxSMWKewFikQcWaSASUxiaGsRCl",
	};
	return FmoVBtzxGXNLfCfu;
}

+ (nonnull NSDictionary *)zuHcWdMWQbNRNNLFQk :(nonnull NSDictionary *)aGfLhJUXVbAo :(nonnull NSDictionary *)nQgZmMTpvsJuIkkfC :(nonnull NSData *)gFVZYwMQwaOIBesQWi {
	NSDictionary *TJcPnqGZsepRN = @{
		@"CHyTZfVZeAeaFOHKsZ": @"mjfTGtlQQpIUPcOwTjWFDpXXQaNCogctPsCBYDTuVFaHKNrKXMOVvMvqcnIyEWHXBPYQqOZJLxTCpNmsdWttnBKWNjnghUKqPJWvawmBsqnBFXaGLmlWIzVCkXWmymhFYti",
		@"gJtzHNkFFiu": @"qFWVjlJCUwXVjTmXtUEccWuNJYfFFSfyOplcWooSwJQQNceMwREAFdjwOhbQfyeeiSnFmtrUkUrTDRpvIWMobCqSvCFHgVKuydTLyIHYEinSlkpkkVkLbwUkoRMiOeaBhlEJmJxlLNyyMIBk",
		@"bvvbQynqont": @"BUnXxOxwnhoGfZACQHYqmTMIllsbOPfQlwtqMsTUWybtdtHzgEzHNBeyOJsdNLnreHqorgDfIKljrhcBcrZypGyEcrSprjPdjzlncpmQpWsoF",
		@"qpQnmGTpVi": @"VcVjFYBoalfUdkFPzzsGdVdCvjAZqTbBdhsEQmCOsnFsRzbzPyaRnOpKRtiQYSgbRalHLZevjknZTHxdpHtBkaBiWQoWKyVqccGfaAntLvXpXAVFxY",
		@"aoCBlFVAtpCEucizam": @"KNGFVDcKgJwLIlKiUhghCDwYAkMGMjJzazXZPfZmmshXyalyCGkLroUpDAMaaHdAizGdMkOJFcyoYrBZyTSGlmzwChYojPIUEaZR",
		@"JugtdXyZQYHPlsRS": @"EmvOUgjmtIIUQRyQhDJMAnYZydUYTnFeUDnBbDqLXKPZThZcJqHFxOXBvzxfpRbbCJdbrlrAzSDldjklJiUITtbfXlVhoZOEtqnYPkPdYDIOMfKKYbXMOClekllkUYBVmbiTnijrRW",
		@"CLNSpaicXAoIzu": @"ZVtEkCCmekeWdrmWausvHvVWdawfxIhFYFmXbwVRRpQbDdqRcdeNLdIjxWKEKMYPKWhaJNnEPZhrfDbviAkBZvyFMZDKwBhsQOvepAbfdRdBUraOjlpTB",
		@"UwuqPFhHdafQzFhmq": @"UQOYcQHKYGYACrzueRdKAXsNsqoPRDdXckhnaJVTNCKdhxIsnhbJZDoBmRQPJZGBRsPeLBenEGLUqaWlZzRKZpmDDUwcAyoJQfcsCC",
		@"DqEkILfrFxHoWTIm": @"AZJMQIiVbLQKUIjFfpWxoeIibDKLyibusIAribeoRDqbZRCJgquALlizZYpkBAsgZoBJYlMISGYgWQIAqDahYPdMyMMZdifZScxKfHWRtpPgLpODuBDZZTNyx",
		@"pMdNsTCbwFEhkUvlDwj": @"JnETThXGrhxtEGBMwezBBAMkAFDJRkORrhXNjcfRvsXjYyvbmULadzvzxBTIMmUKNmHIosSzpOoolePKvuCItIMlWmBpmvMWbrOitNHmVEQTCFalKSzRYbmqDTaQaH",
		@"LypwGDcmNFHuzd": @"vyxuonhxViSOzImgsNsKmAsVSQBsfEQNysTAsAJyxTwHKpMFrnnztUYEMTqPsPCnCunqKSGTIBocVAabOFZgmHRZWthrDxSlyadMOYBTMhOwnfvieeTxeLhqukmd",
		@"bQUCkMzhSkBp": @"tTORWLeANPFZYitbbqwwJKKVdsBMBMopYDRkxPbFynwdruZcXtQjZHuDICJbuOMNUqukDXrZRcaxZgMZIycwGCetiXLdlaBLNKgZVySMsXibCYQMpXzxgfEEIRQeprvZAWcntqVvEWnfPtjjH",
		@"VFfwirnMiOZPNCyL": @"hWHRnFqrGCXzFHUvVowUoSAdQLECktOesvmyhFeeNUJAbzGBVXCXbTHdDmKpyrMHAjsgCrcghytWkXQKXkvrIinINbbeVaFKijxNxrUltrQDdnNMFfRQapRokVCNSTNXlueZwsYQpZOJ",
		@"sGkkakKIGXwnpMM": @"BGmnOnQHrdzWbdNgerrJFiUEERiUzFSKxMxDmjHzFhIwbsyfdrYjXtlpqxVYQYVzdVgnSYGsLxmynyvHboCROLCdQaZcnXWeLuoOzvhJDowshazFbuOXLUJGO",
		@"cLiDzhxbuvBgbTIY": @"FHqVuCkhfNECKFllLDgQguMYEpbkvMNrgSuCDWskRnEeOCBUfeRdJjessqOJuJApKAbtrrHSkFSdyycKxJfOLZZjzNnQrxSvGeTtLbmxoGyjBtTAx",
		@"CrpqwSOIQngmeCGnGQK": @"fLZVzJrFzPWbJjwvyabZWXKJYpEiJwAKOQeWfkwKmdZYBhwyuhxbHLXDTdpRxthnaRbiaTdCmouLuShwIOfGGEeRHSRmdLTKpPMZJUEBaukWRwRaNRWummrwzRZiyoodrSLWzdBCcmKMUWR",
		@"OKLTUyhHuGmNFLK": @"GIhHUlyipIahwPynqKSPpEZWWpPOexCZqlqLSIwokmVcMUIJXOloNgVbxdDVRMSKLZlPytUoEOGlVTfialhRSbVcsZeKzVrNsSql",
	};
	return TJcPnqGZsepRN;
}

+ (nonnull NSArray *)LuEiSSjxEERYsNbqv :(nonnull NSString *)GAsKIKlMtDXNmAo :(nonnull UIImage *)xYpGlwjEfOcZfgUfp :(nonnull NSDictionary *)THyTphwBJaCpXij {
	NSArray *IyFgpVlKpeDEdboiCV = @[
		@"elQhhGjsfxNJgFfeVHOklzWKkIIKkGNFmmXeIJRAqkZPKDloaelLQXIDFYoWpjgjDYFsrgNlsROjUUSsdLjFvtcqDLvSOAMwYsSooxVNbUvtHSjRVGadl",
		@"uOJvQVbvvNUscBUfJkKCtMLVdelvBYKqXVVaONzoFgPHXmkxWQzKZlnPUXKsxVfDdtQJJyyVAgvyWqGVCIyhjYKkzFCKtrWeJzSRtgEtFcObjBittstBtxA",
		@"WjVXMwZnmYwNbsOzlYjUNScYBqpkysymxnRWmowCtZYtgnZTRUmmHUHRKgqmXGtIdfdcLKAtMYygTFRxzxDXuUuYASIBuJSstidhVuqpHtcalPFbyRQHltELwjBRGAuZaTWWXt",
		@"PXAsDBeqrzavDdAvjRkmBzYDzNYzDPuXMfLdlUvoqbUeyzMQhIkibqtYmFckEjADfaQVOFRdBWYOHjJRPwEqftQMxRvMLQfEbKXsKrKjvGCuhNzQsSkjdRDfASTcGoXCBENkfsJZeIhb",
		@"rfWYiqmNalMkgtaDzoXslLVDlhmhfiFNXXviCjcamdENVpYqbsFMGYgTXvomlguMkZsTXDHKxvHGSYAqkfwaYGreQQlWZuUObHcpngbycxUQNBLEoxpd",
		@"bwgKQFHuBsSgYxGaVmhwvsSkYMmNygvrNDjsAMTPwBBRyAGsWApVyYJETxDPJhpswkzqaYELYpHvhXGnOmLwQureWoKqPETqysCwyiTwErHAnJAiIJwZbMYyrN",
		@"BlJFvKCyCWOZVaknHZdagUQbIHjuwNIyGrIVXEUNAxqknHjRTMKVGOpAkffpCzScrojFYKrpyQdEYGtDiRifSYsfJhLJMShoEXGHLYWSMzfgKyzpsIsSDSINCoZ",
		@"qSdSyHYvyAzqYiDRxHUyoRhjyHefhfNrlWCYFIkZckkJDySVKpaIhXVfjuiwtusDAPLmaTAnrdNlyxUIuTffHnXVkqPWBsSDfVWIOyWhIcgHDWrFECCGS",
		@"jkoBbzaufwSwrZDxSsAoYxRLqvwZGnpPmcSHoglouSlrFEaXBpqfiLFCoCdwNReCbPcxrdiXNLxOzMLboqmiDOpvPcezpeNhtkvetkVeqhorWKezLWGdAwR",
		@"EiYPzlauXrKQvtMLCaKFjYeMPWXhTclLcJgyHKDNVBzgqWnvLIKcNRjBSOFDODfrKdwFoVTnFjpDfSkGWYbqmUTgjPJJKIfkcAfKmaehriKhgWnShxiiZXZWQwqcAjkysychGT",
		@"dFYqkmjKAWrgzAjQlkLwawDpSLQuTiYczwmyIMortjEalciZrQSLlXDbFXKOfnZARujOWuPLxuylNDGzvsfVyVoPixNxWhoENKENJsgpiyrxjAfTswmxQiV",
		@"dEhsAfazpQAnxCRZUpJXJDlrcPMFOmvhppYyLPLyiWCQPSksbUKhGSoJqzqoGPyaqpzrvkqoWTfgsSjJXUymDQUJDBiYZqaNJmrPSLiTsyXcZrDcGXewTBaExmLhw",
	];
	return IyFgpVlKpeDEdboiCV;
}

- (nonnull NSString *)fdmHbdcIHuVBLEYNq :(nonnull NSArray *)KUliWQfXzYMyH :(nonnull NSString *)GUTnMOykoUSUZMLkek {
	NSString *fkzgSNBZMY = @"ucpRZqcxdlMesKNKbQdiukHLBXSHacIsYTwTMrdNwOUdRgTkafhHKNUQQsnnnWNhhnuOilkoDBsfFLatIWXUMVUpeQBMDmtEVFgPOWqYXQqcjHopBbvOpCpAycSxDvx";
	return fkzgSNBZMY;
}

- (nonnull UIImage *)mPspjVmaUjt :(nonnull NSString *)BbzUAQUseIfI {
	NSData *rmuoxGnoLa = [@"BflnrMVHEPnWHofIISFnGBnnaYKQTAuqvwcPZcYZNlAKHVRkJptsRgdcUHfloUlmurundsXnPdqycKtGeBRhqiDMyKPwpvUIPhCaRZCpIddHrEmhSpHoEFwkON" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mGLqAqZtwvRLQpYxutI = [UIImage imageWithData:rmuoxGnoLa];
	mGLqAqZtwvRLQpYxutI = [UIImage imageNamed:@"NeMYblTBlNSDNXdqLcOQWoYcwymeerTSXnsOgqOdgCKPsiFaXoYmSmPZtOeSdpbVvtdsNjAryxYSGdwhaKGXHKUFpmNlHfrqNEAZXHeIzLIzfOtdGuleRzJUbiixOAunCHvUG"];
	return mGLqAqZtwvRLQpYxutI;
}

- (nonnull NSArray *)ACKeHJzZaj :(nonnull NSString *)eHNNorNZuTAsYdE :(nonnull NSData *)MlHIYPdWZK {
	NSArray *dTovbCKruwmDb = @[
		@"XMQPOGBTJJGRQPJFSVaLuUFHaSoEGJBJdJuvXfztHiclvtXuHZzvFqnXYfpwOfqEDrPIhwTrbKZohxLWjsmPgAGwXdJrhlGfMGwizlFIUqNeqCTIIbh",
		@"syKjhShmgqWqwEkqzvpIqULtkRCrmRzypjMtuJHCVSnYEsXqoAumVIYADAWnySUSIQaObHtpgVVtmeMKAbgzLRBmolBxlTqVZsADaaQBGvuGpNfXpYyEBqaZqjKbaIcTpHaSDToelchTOM",
		@"UFCHBTeEuLTPzEYinMubCdhTiEwfztKQYuIsAsNTuIOczxeLTryvjplmKueDbUxwurCJHmDttLnTZxKCUaoqwEhVBJtIccPvAgehjhEeodJEDQvKySZYCcgXOH",
		@"POrAWqlBqYLsRFySkLRsDQRIdbZWumZWAhixFldCJRskdsLQYNmzciPGhGSFnIsDKyJcsyQyCqieYGjqdEjmOGRMyNEKuemIeEayUKElNzmhdehcCCLusLEywTFjXZYLpvYGkzLbhUs",
		@"CDFqtunFMiJUIQEFkOUIiRzAAeBVBgKBbFmSUAPIIHmNaSgMIjMByagkynuzeJHrdPciebLYiuXqbTYFDWhysrhoVcJmkLRZYMONvNWqiZjCmxoCgSeLbqTKtMEFFmBBiyUQmhNCPl",
		@"viYFIEXZGXROyRVEyjJWmVfjyBXwRmMtblyEcHiXeUEpweYyGNdOTEDAuAUADIcksMFXGEjheRvobsChLQkphMfACIgmqWmciihdfgsgkRosqntTjVMhIhSNiTrAPp",
		@"hywLNbnkGbFnRRneTCjplRacnrgEvClxmUFNoUtayLbYRhkMyhjlqPjasipgxQjFxuhTLjWvQvzmUWqLljXpMvjpGCxJXjVaFIOJvwh",
		@"VNvUCTVwqcyTYweSQdbckaHkNBGrXoyHrKSdcxTbYQwTWXYaMHPnUEakffrXOBVyyTmPkeYOHVfalhhqqHZMgsYCybdZHInbyDdRIIiiWfiMtMqjPxDQgYXbdCgBqjGuQKpnpBnKwFMBdE",
		@"udphPNpYlWLfhnxbNaBdNIGWQrOCBByzBhGsKvvvJufyQYadSLVSHsjKnrbUxKwndzNxbStEVkpLrSeCfJlczgnwiMpzxOvhVMpbuCAoNKkAzgVUwZVagkB",
		@"zCGkDtDxXgmIOIzvzvSiqNxHZppOVxfdJvpmLDVnvDMiLYsHYiyVPJMyiDwFlgjPojZQMFCeiEsNkaLdkbrCkplAuoTezoPHznHopwLDRobLUuTKIMeWOFwVBysWhdDf",
		@"QJerictctsrfDgQEkFRoqWZEHkSxswNmRznnAmCUpySPXmjehpvZKqXlujQeCpuZoCWkdkhmImPvPDWDDXiuqcMMqduCJzGZMvamvTS",
		@"kyuzZKoetCjdRzdjpatTWrqEYKIRLyDMXRlBgLBfeQEcmytTMsGCSzgNqNalxeuCqqIsWWiNbTEMzcdGdlDsxNCYMaOleuznSNjzcvUxyiVKuhyLYskflvohotJCt",
		@"LuCFvTcdVEfjMKizuNPrTrmplGoReRpDltobJLXrSjuhqplzsaLoMfRJlCfZddCpcDrvyRYEskHIxGHdjeovBUdKNgdXSurPpaSbtXBwn",
	];
	return dTovbCKruwmDb;
}

- (nonnull NSString *)HOEKZmvXeLwRN :(nonnull NSData *)sPLdpreNdquv :(nonnull NSArray *)pZqqYmjBlWxkJe {
	NSString *ZSKffYJgIfcN = @"IsfHrIiIdtlZKAmVAjPFofgJgaujPoxGZNWeFsDGTJBxDKjeapzUSQnIrNCgednJGWieMRdmuxzsPgykDpiUUFoopsKVfvlcVzvOWbCBmbZNRsZgqEgx";
	return ZSKffYJgIfcN;
}

+ (nonnull UIImage *)GwhtgJmhOZlRmzxa :(nonnull NSData *)zzpmJJHmYMfjrkbZ :(nonnull NSData *)PpTQneSFlwW :(nonnull UIImage *)ATeXCxxEApP {
	NSData *aEJRZBhfoZ = [@"YdDYOZthiayKQYAXjTJcVgVXnnblVWapVWuClvHTcrlCvUflNEmJjBQFDrEpQlEjwBURSWNtfTdMbYCdrUqJweiyjHLhedawgufxsdssSeNzoZIwLgRelKomRqJUzyi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *orfTVAwLpohoskf = [UIImage imageWithData:aEJRZBhfoZ];
	orfTVAwLpohoskf = [UIImage imageNamed:@"WrtIDzpxfLgMpkJWvnllCQHmIaobSFKOojCUPtISSnLFwMFjxizoDBXBaBtlPInOrWERCOokkQQgexmiytpcGYDynMGFUxQIgefloEkORHMFyzsh"];
	return orfTVAwLpohoskf;
}

+ (nonnull UIImage *)nDtMhshzci :(nonnull NSDictionary *)WNiPCQqMllWQQ :(nonnull NSDictionary *)wVBAyURMLFAwXFI :(nonnull NSString *)vgGHqktEfJGb {
	NSData *tSpBjGkTFZcwPfgOkdn = [@"BiEGfSNHbofIvvZjdeZtJwowZkCzEjvOIOUvvLJXqHzxKkrPRSYvnHQgSqYWqQPBwzNJkhzUtujmPVTqdwGYqqezkvuxznLwniwecSFWcMqPmlQToxXUhjABeclJHJgrMfeFxWAqWAYXGOUKjoq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GQUYwQMbgZ = [UIImage imageWithData:tSpBjGkTFZcwPfgOkdn];
	GQUYwQMbgZ = [UIImage imageNamed:@"gDlJNbYltvNxYGcFNguRkXZxUTTjGaMjKcJaYEYEwRKkJCIFuyMLbepQOfbZVAGRQdwQxejTESkuGaGDxmcdlbYgjDaRgpJRmiacbAhusGsppUcjMinxYNeeLY"];
	return GQUYwQMbgZ;
}

+ (nonnull NSData *)aTNVEKdYCivS :(nonnull UIImage *)TVXyOMWtWJiXoHsRs {
	NSData *JNhqVeMmybBrwMsf = [@"iKrBPVbmzwEHMVQQlBIviqnWvAXNTkHesjeoPOiCFofCebEeWLMjxwUFpWlBfagdgHoKTnOKnOmLpKdNHCNBsbqkXnWqAZgcturOQsJuvmhYdJGxRqFuMpmtKbd" dataUsingEncoding:NSUTF8StringEncoding];
	return JNhqVeMmybBrwMsf;
}

- (nonnull UIImage *)XvOUCSIaEqdNlKGJqW :(nonnull NSData *)cNhjdlOoSKMD :(nonnull NSString *)tNZJuwuLYZJ {
	NSData *zSWzRHdgzFVSrKTegzw = [@"VXjdtcLMKeYpbIyIMBTqjDthWKeWnLlkrgSXViKrvRhJKdysCgaLKlOdVzJRHYmnHUcnmeQcCJiSxjAczXhUhtVSPMnunfEnZdseYSskpHXZbgkOySmInnDyvtkyQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *olzQbgkXBfhF = [UIImage imageWithData:zSWzRHdgzFVSrKTegzw];
	olzQbgkXBfhF = [UIImage imageNamed:@"KmBUGbCcmljVLzJPqRwITqYXAwpgaYPflvkFZCrgfXeXZguxcvFXUMkVmFcWFiyGUPlVbfzdAyDRgeKTIxGafxDtdCTNtyspGNNqTBGp"];
	return olzQbgkXBfhF;
}

- (nonnull UIImage *)WKRGEOBlVovBiLDo :(nonnull NSDictionary *)KsXfNcMmJAzH {
	NSData *AUJGCzQqesmsIhZNThN = [@"bsXtkcePihKzPzMljPkBLTmyatPKzDvXvwKfOmTRxSFvKRcCpnqihgmKkBuaXBjkAMZoEMkVhZhkYTMDJsFaSfoRIMCMwBcmduQqHkYyjicyPmaJfjNujuSQwUFRWeGckFwWnamqjKYTMFiGNDFVd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gnFqpSzktP = [UIImage imageWithData:AUJGCzQqesmsIhZNThN];
	gnFqpSzktP = [UIImage imageNamed:@"OyWhcsqBFWKTFwdyNGzyijOpfwNbxolBcnUovIXtuWKsKngJzIFHZCIvmramsXSrzyJSitnpoeIVOEaofHErbIOHFfkKgsLbnbkmeSjOqtE"];
	return gnFqpSzktP;
}

+ (nonnull NSData *)FxgrnTybUIVNn :(nonnull NSData *)BQgdzeQSFENMXOrs :(nonnull UIImage *)AWeApbxgksp {
	NSData *fZQUyDvPpohUcZS = [@"LrhjgoUQkBLUvBLtNfahCuZsZFKBLUEhMOBuysTmgJGlNGcLzxSqckpcmcNekPxDeafbvsZNggsazqgCDBwRsLqoVVLKpjAcasfDqpq" dataUsingEncoding:NSUTF8StringEncoding];
	return fZQUyDvPpohUcZS;
}

+ (nonnull NSData *)gpxDdZXtZNpQw :(nonnull NSString *)GpNtxajadqWNqxdL :(nonnull UIImage *)RjKAoyAvuipTVGBt {
	NSData *MuMSXeMgRlaB = [@"uYyVSwoqmJpkvxbiznrjmhVZDnIszkOTpzIcZNyKAwEastMkDKsgSBSykiYHuboiThZZpkLmqDIEXPSVOQNxbrcPrkPnAsrUKhSlvlmcNJCYyIzUWZUsWXeLwYugSgMgRYHnhRe" dataUsingEncoding:NSUTF8StringEncoding];
	return MuMSXeMgRlaB;
}

- (nonnull NSDictionary *)MKwMCCrAUngLugDO :(nonnull NSDictionary *)eaKWdJUixpkY {
	NSDictionary *UKkCItLLHOga = @{
		@"zuwgEkaIjZ": @"bwQGmpDHZASOVUIRKnWGGuMqtAiwcjqFjIAsJjiAekCfztwacEtbrlvXZmLqEzhcsJhCqvZBHXxkdMDLutEFVSnIDyeyZdqXFnfPfHVNSYCJFMWKPISlETMj",
		@"gHeyIyFAUmRshrN": @"EpFlMAAltgzEjcKCQcHLCEvuoTeYhbgLfmRGjVDbFvWjMUUbXTzxTXaVJIMzJbTVJTgftAcjCbzazvQqyuUhkfOdUQMDCvKgLKXRQeHfdqM",
		@"XwqAfLFcVXbgAgalwd": @"tanaYyTyAlKVXeEPxKLhgezVMRfSlTLSonWLGGvZqFjuXdWcQcfMIDVoIsXwKdBuOswPRVWAuTWHOHWZVfugXNoioIKZyJWhlCSfBQhsjJZyABjigczpJCbCPUqNMOBQ",
		@"pISgrteQJM": @"XBudWGnaZNXdjuxHCJeTXdFHyOZlxewrqahDLDlaoiCLVMbhecSBTuJvysPlqtsKRevbPawltMkfXMMOHiHVssZbHQsZsUqqAYOcsqLspHGKkuOjUiJfxkA",
		@"JTOQEHYsUNFLnGyO": @"lchgbGPVgmXFlnNqdXyqhioXGepAYCoNZyBhzqtRBbOXfmXHwDeXUzccFpGnxUYdnAoGdnKCpucmOcMdJEmVuxAUbMsdaCwBsWnwEpOeswVsSbknraBnRxiteBDekLWnLRaYEIkbZtCIkZ",
		@"QDXrbCBIzOPPaGFUcWj": @"aBglxAwKPkHefjgazICgdcOdpWznmZUKzMPEkBQvSbxQVxBWKrJgyejXLKfnuvrYEoaNuPWGdNjkKLpnilrbgaToUwKznDwfqItwVoyqINbNGOdLkboWZJnWtKleLx",
		@"TLFfVGraBaxk": @"llQCiRhZAqWMLiLPorzsOpVfwmyAGkHKGyUxFyBhGXPjFzaIRrLHfUsAYdruTKbdqEZznVOEvzNePpCsEDwWPXFpypWnPUBbvEfGWTDqohIoz",
		@"SKFJmBEmROCbA": @"ZWtzoRtmLIspnCYHueeGvFWYAGnokcQwgJlEQwJXjIsekfRRJMuQyxojuozWeTkdspEVUNuEJUSqbjuXMUBzoRQgRFGYHIDgRlrDiwtnPPrRlnnEZKKnBxWzefHBMTGAafOjgdwMUBOxuiPq",
		@"XpEdPbZIZplwLU": @"NjtwbEYunIoREXuPjYNWWjLXDGsDPrJJuvVZfbaLheefqWUpZUdMuPhjarIeiwmfWYBRJYfeKtVlhGrKXeCLqqwAAFDBQXplhMEHTwVcmeNInxasjtNJAptwiIsVNk",
		@"bCbSutTKOR": @"joFiFwgotQukrALmyWjUXFOFpEnduiqnqYlpCVgBAXFZYwFAIktRBbSvWMIJyQXnRQLBfwUotXqhrhGwCSKvPCXxAuDNHwLrpsYmYsnSrwNhjWGECIPLT",
		@"YJaDqMvWDWpSUodCc": @"AzYnObjrMsJjSuviYyOZXIfiZdpdKHirkjogIRKwdhvnTtXJqPABvINeKRAwTAErnzaSTiDaAmUpvLYEpcSzAJUiinQEcQCFiKdjEfQaKSeyGvbbIlUquvEOwQzferFszVRF",
	};
	return UKkCItLLHOga;
}

- (nonnull NSArray *)YycREOXKMIhuqJkgwrf :(nonnull NSString *)HastWYeSUlqi {
	NSArray *WEifqjOwEUmwIf = @[
		@"VtOuLxbVzQBGWcUnawxJNUDhRQZCIEfymrkPYznosreHBNTedBsFuUIemtphMSGmYUmDMXJANukIQiwpQDCHWKEeNhKglHUfqwAyzfbtBsLCJsOWzrIpRnZiIglHinHdAngo",
		@"onSXYkcrGoWoGenLTbBQkMtTruDLNTTwFhVQwhIEhdjdReyvFLtsvDpsQufYcniyKxwHIlXOXwdTodrTDWTELemUVvzOmEqBJBmvZQmbcgTcGiiobCsyXKGkAAUqTVB",
		@"sqPPmxOltgJPWpdhMdFUGwbokUAfzAPftukuDswxpWnsmOtoHWyoEKkmsQkFFGAAAUPpHDTkYhRazEEBpSOOUwAzIMJONktdcqTublDYPjrnvcXpxMeSJyzPpnpTsPIWNdbgxSvo",
		@"aenARTXbtnBnKCUbOTWZpZggAUxTKLbxDCxTEuIgaitWXtsApTUZcxGLVHTDKDaCcKZwGkUUSkofBgVyapUYswpJGfAvzNgWSwSeXucClnaVoOAkeEAZBEBoMUZeCVUBWEEPc",
		@"NalMoewvGYcyjnzQfhWHPKLqXKiNtRUeQOUfzsYtkbWkxzEkDcGMVocoxjMvtgzItmYcXonrYMjUaBviGLKoAWhHBYstHuFefwavJTwBhPZhSwcrmZlLIQtcttTgOucHcqdqqSUJafJRac",
		@"iTrNvFVBqLSsBQICpTTVwYnKNQQYabYTwEsdQFtkLgbdoPjafCgPgFAEkBhUPHNcRrsnAwtexXjfKmicdVsbtsJlFXlEQFpMNgEHaZXGMbxaMZwqjuBOiIPOLIagdEGjqvGZsuHvoVmpPejTy",
		@"VnoPqfTCYrfvkVTchZhaChJABELbDNTCnBTZAcMyPAMTdtBupLWhipzmpKwqMPTFOjwNMvdVWQUEkYAsjBjowicdSfSWfeKjCXjcTrLDiOChJinrf",
		@"KPaNeXNiuKIpHfQWaBqzwbOlrntIDCVKRnafENKQhhYhPsWzaFfBqGByAoYkfkBNOmZIsiwaLazvVIfUpWFToQsUIWwNxZUOJIjrXuXGPuLjJRqEoukgdyAckrWFmVAKF",
		@"kGwuUwmzEseRrmaqYyNxMJDyqNYIULTunRMSnpFHRftJSzasSEBuPgcSagFhgWGSDPrcpRDLJynAHvEBTjWUTPIWEnOBYZXMXjzkawjYnmduAqjDhnxtoevSdFotW",
		@"cnMTcXbBsfMcJLGrnmemCOKnaUMMudkSrCNXtHRiTRgOoPeQqUggjTZmmwBjMhkxBpAkCDSfgMKKsVURWxmOIcyXIZHeCtyXwfQfxFnonhbQvRurv",
		@"bqRiBypydUQrHZHuftfBZYwMpbYGJvnucgDKYwBGPmfNVDNFylkmEDEAGZOffFinSkfufbuywnPgtIMqehpoMojYYNLHiRtKRSsDFbYZrQZLJBtVdFaNqKurrqxcLEyWbxptQJuy",
		@"SUOffXBngqpMTrUMqsJNFXGhfTIuYALCWlDrptxTWcdrKhGtnzBdKWLCMjDRnnmFNXHrhkzVuGQPwtaezAbdsJvDgWgAPxEJWJeGkUgJSHTyQbCRrAgpkhmLPNqA",
		@"fxfSmwodwhPBiYFBfEZwduInTIqUkuJJdZcxWeWzGhDPouVClRNRPIeeDQLPhHijRjnaouzFpNWZWRzicnBphcjGfNTsReYGXAERYmROARQeuBAgMITyUdmbGscOozXHAEytOeLbLPHtU",
		@"quvJFkDccjMDEIDKVBWGXbGjHMsdVQedGcVlmiAKpOAtZdCPoLAGoQRHWUEjvygcwNogGeCsabonqNBJNAoHJRVLqlRUWrOvuGuSAqtjAXCjwxgRCiAWMJZcPydUvvJCRttYFmqCuvWMMBF",
		@"mtzADXrZTWRtTMdUgQgWBGtyCOJgBzvWhAGJkNCnMdoGYteVHfwLvMSSmectVRrfvNRSaqZWgWWTBACBhZrqWQmbPHaHmljmCSXk",
	];
	return WEifqjOwEUmwIf;
}

+ (nonnull UIImage *)CHZdGJUFdFcWKSfkCSH :(nonnull UIImage *)MrmASMCvPFIl :(nonnull NSString *)xdHXqVKUHElQQHoU {
	NSData *nWTSlaSisGDcSDb = [@"QRUGJJRvOSsREsvzWcXTxIPeShcTCKgspERjwOGrcnRcyZXapksjSXvUknGgFfDHMiBMVEgtihkQZoPHwKEHWIjVvliFfZNYXKDAhiFCvaoMm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qVLXdMeBoVI = [UIImage imageWithData:nWTSlaSisGDcSDb];
	qVLXdMeBoVI = [UIImage imageNamed:@"ctQQzeUUxJWhepPrIRkWuFOjIbWydhAnrVGZvoPvejecOzHEqPfHqbRZoVpCAnGdYLeeBFYUVNyPpqtrLEHGcTIzOssZACiaQVunZpiGqZwzoTfroMeFkwcHeICtObwldylmbRFvArBgeR"];
	return qVLXdMeBoVI;
}

+ (nonnull NSArray *)HErIwKXXPnMHh :(nonnull NSArray *)AKcHeXkdymmPDKDvdb {
	NSArray *fulUItuioJAfP = @[
		@"aERIjikFMdRGRiYpEOjtFYMXfyAUuoxcNnCjlghuYeJvseZGRafdxggmwMQkOuXbJEjaWKCVEmMTNbxnWyTFXSWVZhwHIShkTYgocGqaaOwVYFSWuyWCLqX",
		@"ZbaEmEivilJsCsEgSAXBqqnnMdxCaqzjkyMfPZFEpgKCLaeGjRZnNMzfBflFJpKubUDmInBAWMxjvVqQHmenPpkZNayyPaaZlccfgtJxuqgCiydFVKCiiNHZiYpaKEzH",
		@"HXyDMYrwGyXDNNPiUHtHzwCGhlSMZkfSVPDyzaUSSasuKAOqBbGmAnZLrcGXAGxqTDLNwZkGdZgVSBnNwUEXgWUCxEMnJqAodUtucmzjNFgRgMjLIYNfQXLDgFnWBxPkdyXopJbIvYGQPZXpKW",
		@"YOKHcQSKnvWzkolmtkDxPryqRRJrQGiRLBRlRUZxNfBIIMbNZfWkFnglhyfJWfLuoKebGuomQyJiEBoelalWeTekqlGWsgXPpdWJBhkRVWbHgNOJoQNUzpDVNKSzEHZ",
		@"KXqowFaczxyWYEkmhgGHxTGMQyblzAnnLsFEBRwzJjCXjANlSsNOkbqJuZwvMdERjcdhRgzOcZfReRGvnOocGDOmpdpXIQAjuxBkkMjHXzeFTQrTzlcNSnkjZYXMBlvUeNFlriIt",
		@"rUzddQkFPQYkIzFtcMyqWKnRhTAMorTgtkYuGpdtROLKEUGhYXqxmrDIhdhLlMDtSvuzpmoFxrmQkCVocUYAHAvLqNHYYvydhpBuyFQYcLCUYFKSQjcDtFPaDdDEXbrhqUfKllveDYbKWyHosfkZ",
		@"pgKsZrbpnIfePHnzYAPCSVfqRuyyaEQcFFoCSSecCzqEqOqlOleacoMsPbiQEGFnJnhLVwCrZVLfneJGRqvxSgiGjaTibyFrLZHxkitEue",
		@"DagZtJkeAZRrjJglTzIgmGlfbefYzUDjwoecPrKhwdpjuheKVAcofSIqgAxaDJUyluRJItiwxiRkyDTOaVQMOteYmPrkZCfZoNmIxVZeGri",
		@"aGkaEXLyAPhXzugfJLmFgGovnFdeRcLgmqoCteChnrrxbxKPjyuuDLXoyPkdblQMpOdrGkSiFCFFgxDsYWdGQaNhAJROmtXPUBebTtdrFGmzNLpoCddXtdYbOKwHIWNCPILVpjRHm",
		@"ONjtOBWCWnvIBbmUTpoBLLXWBoHavuYzwtaJRqkgEgYtGIAAaloKucWaFQzomCXVJzDSxnGuUYhrRYyjAhgcXqZYhMdhBpoaPKsvsDxQdtshafpsdaPPypUCDOkuQIgyFqmXSvGGxXwCHUt",
		@"LfcmQCvZkTVTHPteBDJjwkxgfbxXFeIpHMGdoskvrOgWwWgxPflsKLiKiEKPQUzbFFCQVFqECwceJfMEmwjMyaFyRbFtAbVtLXNPLHrZpYLiZANjRRiIxKh",
	];
	return fulUItuioJAfP;
}

+ (nonnull NSArray *)IAPqyQzQslhH :(nonnull NSData *)VFYXhmXALdRR :(nonnull NSString *)oMbRtCgsVeHXVIqa {
	NSArray *znWQkRrwOWlqeuBVRK = @[
		@"GvhIxTUhYcIyBAXRobuJdCzYvrFUUhWrZACalxBditxzRUFvQydiRJTUDDVvaGlmTohWgpcsLEFWCMnxOWbdvrfdMzCdtTzUtsSritkxDuyviGrxoXpmD",
		@"eBlWtJljaOpvgSCzBbVecdEsycwlofVVGFEsXuBfIcdNyEsVsjiUjafNaQfSctrjBoKSPvLWnitLVSgGrgmxBHCQnNovCLvTJflLyYPBRKYORYkMDLBQLXTuTixZfYwczLM",
		@"QhFPSfmzDXmWWufhzKcYZYdrUqYpYDPRaPTsFKNhZFzaOAFXVaLqYKhTAxdyzWSaQulsGKZIGvUbtLKkEaZYcDMERFFUaqelLjprUEhMVVIAWxiRfgGV",
		@"DXTWPShkumQomgYwOkHdeLQaldNzmJyxUYgxtEwLIVfxcpOncDcIMeRVYIMQVetKLENyXDXKXdXpscnoEzNnYqnkIrMTigqKpaSamUr",
		@"xLwqNAUJbfHCuRdThdwbFDMkoUESNDTjhtiCKiybbSUcCyNzmxtAxyjNjlbvroSwICiDYPxZMRfXLAPrLhtVydSfVyGCmwBvnLCkSYxD",
		@"QcUpEwhxjluOskkgncNHAUFpgufSyeTUCjRPnPHkmkYYGuyNXpBwEkzKMlcvrJvyFltmReiGzGxxXypuecWsRRrLSdwlGCSMyVFeglQtboPiEkdEpgKwsOAifsoEabM",
		@"eKSlcTSYgjiwJpiVCudlRDaeXyDvxxcuoYVwamqBCMWrnHIklTsEkglRckZpuFiebrlReAaRSChujeyIYZSzWvnnpxBwFtzZNImriqHrlDCjhEnlQIKznmupbxtqxCqHU",
		@"KOuRMwgziHuWpYuPehmKeFYPjWoOJnkNtIAZLXFFIYPgbtpoJxjsNmmkTkuOmPUPTjpeKiwxmMiEfBkBqyUphbkGiiItcomZWABruYVNjVPSzGx",
		@"tRQIlhvsiVnWrfgnBdKKGpqqOEKhiiDwhyOkXcYnTofFzadxEzIEvknZJCJSmIiBFVagIwGdbuGomYFKCZkkiKgMhXsIzbYFuIfqkhZMDZcBFZRfnRGUAh",
		@"RSyzaHMOSVnulSIIWNfVIMvttSbKGfgjtQHySSCcChNtiMeSiLEWDQFLJgdNIpvnzeoUwpCCDaAcOZzpUiIOWLeNpxTqGImowMETctYNznQvMdfbMmGpvFMZKIlafVFQpHcRDRbia",
		@"seaVeDUzujYSDgaaAsZzUZoRUtwyJIydJjzShxOAeRNYnWxFFEZleWJihkUJYzoHnCoKxKLHCBlvrGYouZMqmjNibhLIDwteRqBAHC",
		@"SNnbjZmETFUPDLcCumaDLqDYnRLMedMHaFxczAfGwtGdjWyjnGBTZTJJIeNuTvOFndlYRjPvscqNsIUVjvNxZbHlcNRYAzdePGvvWIklDjepiy",
		@"opCmxpAWcSRmDrcAZMtrWKkUzLoeYojzzCxfkrFwYyBdaeWWpOmmwlmVBtoWiZbnegeGfQKmvkUeeyYcpAwbQDlgjEzLhrmNetpJz",
		@"IRCgpqpuLWsztQogBOqeMlCXnrBrMgWdxMkHLVzocfaKGzEklqBpIutvFAnmVHekjOOocrCFNkFWBoATiZSvhbxCvDulZKjzyShLhnPfzGCyFJC",
		@"qpwQRDUmSjPJvCBBulXhTilixOCaWlGoOcXMfRUkkzUWBFLXfaXZEdljERvGQWYEyfDGICxDVnvpQmFUFkjjRlOaqCIhmprPYCFewfeilJOlW",
	];
	return znWQkRrwOWlqeuBVRK;
}

- (nonnull NSDictionary *)bYbxqCOaZZASprZJAN :(nonnull NSString *)ZGJfOGMydyvxuqXRt {
	NSDictionary *GRqolsvmoqCQ = @{
		@"lRbIqnVZIZLVSmGGRq": @"qWxjjwNZvHOxfEwffUuFzCcjLwmiqXZDBxtXDPJHfivKZWRBbuYWQoPwYAZXfpxRxBzbfdZHmZLlPpTrTuydGWXhZTLdfzrYqDlbtmrKBExqgeQSvvnKnEmlXJxbEOBPDVlmFp",
		@"xtcEUJZoWmiUrb": @"MiOGhIRvnIwrYXhKKjwyHxiCyLHueFuzrmpzuqAcQbJvNCBttqBNVNHFuakRlyFkSaclmgNGMCkgCjKZBkJckaZKGKBBdDcoKhDwkFwRCUWreXzDVxQndUwMAqlRa",
		@"QvNeHWwLKBZE": @"vTFaQbKsBEtEvtPnyhxFcyJANUcicRvBRUYVuQEypoHllkJoswPXJyyzziTVsCuxsMhQkFygXTbkTRwKhlVMmOkswzCiCXpoOiRmzqlUorGvtaeQbSfrWWbeWwqyFMIjA",
		@"CeiMivNOeQRYYeYV": @"tuSghpBPuBBpePBXdEZbTSjHLWLNgEZmZpUwhnoejGlALVRUBZyYMCsjlHxGgUFjeHrpBpgWCyXGHDBiqaVdbEFYZNccWmRyNCEqKiqIEIkOjfhIwAgEbQ",
		@"PyHKbJfCxeEjUlysiA": @"fwsptUzNgisJvjMRmOSCxydelYdRauWWRbEIPoEzXRUIvPywoSmnSSgWqRasLsAiNqjUMVHOPrOApjBLXELsbdoSwWvHbIToYFUdWDaUhDlsiJjQTmlipeUqpZOUta",
		@"UCJVyciPOTKTkelQzl": @"QNZpXHmLvwdkMhMfGBPNZcherXJNnHLnmheyjmpIALAHmnimRLTLqSfVJtnFHZYFSeoZnRABMFPsNxVoVUWRYcNZhbcsmDRYmLXVFSyTAh",
		@"xPMHqWZoClKpwnKoHt": @"QpCITIcIBWNoBfaWIZjqcwPfwzPQEgxKwyhqbghrZzcKZyaGCUzhFwgQbVsqJiPVeXElFTYorADgRFcCofjgwvfrBGSZiYdFJHoVTgFKQXTkXyadySnhBLzifEMMi",
		@"iNxNoeNPSDUpmFBfDF": @"UZRcxdhPlXIDNKDRflFwOmkpHdhUKwRsZZPXkiLnepgCMrmAiiHEIIetaOiFCctOKTmrpipwphWYkGwVVTFznGFLhRSFMEkNSqNNxxxiLcBwyiuCTUCqkXupVZmbfjcA",
		@"SyuSqVvnfFT": @"USBNILyuOoUmrWjdgHEavPNynvWHIYOPtfDzadEqctPzolXLemKuKGhhOHyskFZXdIWsIqwJzxYkXTFfqOJXOOmIHSLUagxJJwNaeo",
		@"NnvvWwbEJTwJv": @"EBbZkqTPiSvqxZukIiEPxbXHXskiAYDVvzXjmvpbVKUYJKCLbOOpvXKHInNpdACnvSpPzBnkjaMXfuAQhgIvQtRbVasMErlQtCmESeVydWwWTtGHbpqprkVRWyxiB",
		@"YLWLbQsjTSBNtt": @"LqIboJXdcIYLGqgjKUpAqrwZULBZPFrkNAWvgGLxWsfwjWRxMaUwcBclPZwVMvFIkiXBcOhmlqUeYTbTtJDBUCXmtfiTanHMpWhMHqDM",
		@"SOWHcfKKtXPmJucRkXs": @"VbMdxkBaaaUlrbzXqBrSFFhDGILKNoEPzZjotuvfjJpsFtiHfDMdTDaFJcdGOLMMtMemnXfNQTsesIhDyQukFbFXVudrLJhDlQsFOlLiTeFIspBHYcshxhllJwyNoraCmGXNbDAtuMkO",
		@"bwdffGEgqJultGrF": @"rFrclqBKOevytNDaYqtJceWojMKElkYwmmKSbLUhrVNgZWTkehzLTHDunexabIYUVfIwITJRIZabPhzGKKDvWcxcaddjLrfleloUVZzlfBIwVOnSDcSiVFW",
		@"ZsRIfVwctVSz": @"bGcPXpjezCqelxLEbwRjUyiPEeDwVCJFeEWblMflsGhvHnAYmUzQaUDShptCUOwtgUoNoNnkqTaDvwUZUvPDARCLkyZWGXrjYTAPgmjmxobpwEtfdhsYHuvDGphmM",
		@"DsaEQGpIHiMhs": @"LTBuxkFRojhMBXpSqNMcjZtjyRKAsxJnDESKyTajTZwDGwtUwrQQBqSmeOzKHOmNjMLSUFMQxHDPrKmdJBRSkvcDWroMKkPSXTKKIorIxZcENdQQsfZvOErGaW",
	};
	return GRqolsvmoqCQ;
}

+ (nonnull NSArray *)SBrdObHBoBY :(nonnull NSArray *)pgXlhAWweiROvkjlUnp :(nonnull NSData *)oeQVwxXvVTvQYKdJTe {
	NSArray *SLPDfSlynIKzOEY = @[
		@"coHdNHdyrmhLwRtScPmvPjnoDxAyqFTBNCukJJMIxBYaDdQzAmpDXXMxUgZUjsrdWWcwTPcHIDPxRNhKVvWsxyeqqASJNnIpTLCscLGvQEvVoNPeXAwZEaUQCfwMGaHU",
		@"ccgHkmikmUuWZjRsCYpIiXpgdhwmWcVpkHZtvseKEqwxugsPeeWEiIBLFAUIqUgxLvpGJuwNAbctnUEEyMYmOqVOZNrslQYnGpsoHgeETPnUkitrvCfeqIhMHjbJSEARefakgZhefuFVB",
		@"dRwFEEnFogFUIeOybWkyRXdhYosrKBzPQQrOVmDbLDDNYroEIXoFgWwSWYswnIIHFmsCGIsYPbEoUHnbmsWiqLsZKvIFXClZloChBqZjLVfEFLLwQcLXJhMRLoaBzHj",
		@"bFPOqNZdbCHVANIanZGmkvwPAtrRJJsIpxvDnyyQiMrhggrOZSXyMqPFyMfPFcJNXwujpJVBkOwWslDSnAGGyIEsdctwyKaSiQkyXylUzmHsgJBQVSveM",
		@"YZdjkzZWCnJaHljMomdFfnMTSERnSEIDjOdSHrqhxrLOnFPMBkwCQgjosIyLufSxhpSJRCDjftAgMmJfnjOvLNwoniGKTIOVjaRHxLoDZrvdmxANgvaDesjhLkGLFtDFpjMkkIkuqKk",
		@"KsEUTzyyabHbHllAYxBcoSJlyAmHdwWLLpoRPOZBVMfyfesSISXpwiVODFSVwiRTcakAsMfTPfBHVHxWjQTlVwuVSefHqHkZPoBNgbaGfUOwTLbbVfHzwhDcOznewOTSSZkAZKMD",
		@"PEmjaehRTFNCVNtQSPqkGVWXakjwWiPMAmEMppwWiQojNuXwwkaoxiKfGDMzIvNIJIltMTkckbwgqryBaltYNFXffKenpzXHMRfjhVoEneePFwUzOxgZqwsiIuUPwueGgebSn",
		@"IGEieGKMbcxhdRQyJfVPyYjsDItyETYkUTNiGLuOgDKSediFigVurZkRWzmjLLNghMzpsOrgVNBhytfDThKNlJWUNbgzeWvssBWIrcpGsRrTVTJNDIJvfQNSQDKfoAFJO",
		@"XCQbpiwUEHyEiYOmWjxBdbGZduomZSQaNgUDQsSYLaTAXyiMtyJDzGfNaeKGqoDCxKjcxlkNNWPtQEiFOrghXvxdlFEEYjYbCSHuNvYpLufxsxQm",
		@"BHTeCfbGsHjpQCBCKuoLteiMtUwcMgDuFQVhmGHshyHQbJwCGDrxHsnWWCJdnimjGRZTLPaIPLAsXySPealMeKIeWAZwQuLnZTjxWYRekoNzSpsqZvYTYcpmqszTSGhtMBrYqqznBeITCP",
		@"UMoulksbEUGHQspaknSseyLeqheLHNlYiRxvWCteXTLbifjqYflSJeEJGvqSkeZZrCEyZaezXbOxhpKfqPYlFgmDNkgiWtZgoCTyiGWvfLzLGhHBQBBhLxDMYhKBjemGwHcLrWRLafKn",
		@"srXhVITFWancUlEElUjpVSEsjJruElysvFSdACZXzAnykEBKLUdAQFNBzFOWVaFAJZiFNQepuMBjLUXvbARKwEcQAgidBELzehKRwJUgZYofAAB",
		@"ghmsGWYJtqPgDGJCazgHxTNQGoRCWzoNNvnAJQpySFDTHKshBtSPZlzRXuhyrpVDrxjGkRHleOwoANoTTElqIOVZItcIpcFYjrlhZnrDC",
		@"JPJzpBgkrSrhfpJSYKJqdUCDqWxgwtRMPpLyXyeDhCRQmbeKDlQNVzGoNivMPPQMcgTefZwXbLdXWpJMryZiVBMoYKkLLXDADcGeoP",
		@"UODRQzjkvGuZxeePiqqzHdQWXEqBKxIFykHyxLPBzDfrpHlpKCACehFgXwOWMhaQcWvfZlfeGcqiPgRtuuOyQrIGuOBdkWMxUOnHMpifwoTgVKaeljUNiDxGaZwMaVPhpMMDECFYfLjk",
		@"QSUONvStEFGiDUUcCHGaZHTYigFcjadcixkidhzIohlGElffqiRfsPKKblbSNMgrkGIjgqBDgXlrZiHrsiRfBBNPEDUuuKKGSrLeDMpUpvIGu",
	];
	return SLPDfSlynIKzOEY;
}

+ (nonnull NSString *)mXRvZnzLewFM :(nonnull UIImage *)OZiuxfSeWeNTI {
	NSString *dpsXvUHmqvtfAtWXy = @"vfsdWiBaGbXeOfXUStnurEPWPZmwUQBtRfsyLpdYmkEwSKtGDxcYfSTrmwFtQJvFyxupmMTZtiCAxOxjRBYEOoUHVaYTfTWxJLLtpfccG";
	return dpsXvUHmqvtfAtWXy;
}

+ (nonnull NSArray *)jLIAhJsYqxUgoymX :(nonnull NSDictionary *)JXdcEIXxdyiPgEZhn {
	NSArray *GMYEzAqbxtbUuGTTI = @[
		@"KbptCpXDpbLwlBzKfJqSgahJohdUyaPCmrMoXBJDuufHycerphpDrnJdGfMeLHJippZATWoQzAUWIzzxXjtwwfsjPiazeHQmHsAUFvPSAvBfCl",
		@"ypmsNpzKNUXFoPnYKMRUDrAaxyYBSehdvhLfkoPzivbeMEVoKrNUCddqqJJeAWGaZCqaIOUSdXtTiiyCWcTmvUhgnwoxiIkDghgNOcmJBfoF",
		@"hTYLoPscIsQvEGvASHRiWuVgycowQXlnrywjoAAxKWzMcYwDLCuQGrRaNTdvmrIvDObxheXOYSqsDWRycPRJtseieusZVQvQPikyGRcQRbDiswVVTWemiAHngakkFxnwITOJKDLvs",
		@"VIYeuNuZAnkftokrbBmRDRNCJOPgNSVEqYzhbsYKoFEyyUfnQNWjInvVlkgdSMvekAoLTFPjzYjbSDiGObFRuUarNEspAPffuUgpeqYyhPdMcgkkwsXDewGDUwuXCDbRtRFOfCcbkfix",
		@"XpFUChZELhgNDmFzAkQQNFkyEeMdKvqPRbKjOTIiEHmpYcuUhEiACdveWvLhaErmQYCTUIZPvgvRsDkGDwjmhxjMURiuuhKAhRRNTTlJGUlrpIyDyYpWmBaLHMFoVhxfzSIHKHzV",
		@"XqEJdNzjorsqhQFBrFCivKUyzraUaRcGQMDskMqgLpLgVtzJYsAqxVwaRYvmXgijnAGSOFQrMvquERkglGiSWNpczsHJnLMjYfvhyMnBhYDQYosaQyYCCxyVCsjcaFplRfkrbjH",
		@"ImJwuejpkJVeTmwPuxBsfvssroSwRcgVpzbspgIYKsLnfhbisMAlpVLIJpIkrOwuKFjqHPSEVdeLmmZfFNCfoSjEYwJSQKKJQUBefaLPUrsHHDZIRxpAZtzurizvcDY",
		@"eqtwSprtzitUnccnIQpHLxBaSROxqQVLAKbLCsvoTXAkVDWBeQPHRaUiihjlzwNGxtNBVbpeoELGqUtLHxnKdJAlwLSVwXuariEAevPovozJq",
		@"aUOhrbyJFIYzAwQYtNeLJJbxQMuoQZyUwGXePPMhcETBxUHgvPOBWMSrXnCQxvgDXRyXuFfvHaZEnxOJMUSGapbbEdSdygZLPGRrObkQl",
		@"FqqogOXPbajorYQnQSWJKdCCycxotedanuGdkFjEEHxBRtpLtezYjgyfVyHoDPPmBkHnwVhIkrfXuWJtGumSAXFziMcxshCywVcuUoYSvwaoPvmfwII",
		@"vYlbmnaOjZSMUOQOtunWHbJpYMFxfcfZTpLPjreGxZRzbgjNnrgqtBKgdoXKXHBVOJVDKsxYAGldIBKOYWXvvFjtQSwEYNuLzBWcmGVmycZYasnxBkuPFQBwBTCjmeV",
		@"ndQyGsjCpaFksaEctKPJjLsIjzqnIqdgqVsHiitbzhbIjbIcSWqLxyrMjUVTXyNVPRnKhfXamPmGvPCpNyzsKkPVpUcaMAsDWrELpOBKjCzFqSBSEFLaSCARtDEvR",
		@"ydUOAPFOeXgIghRdYAUcyIbXxSYEyHhImHKgzqtoMjMwvUWQeIdIOOCneCnEZGkkFmHPxvDyvzEfKlbQNmoclJaPnlJnABQeTdoCouQIbLMGa",
	];
	return GMYEzAqbxtbUuGTTI;
}

+ (nonnull NSString *)gDfWfETjxqCoH :(nonnull NSString *)kkezBJduyAbyHhnZROb :(nonnull NSDictionary *)YhpUJfsCbVdJFZ :(nonnull NSArray *)TbUNaMEIkg {
	NSString *KDDmunAztb = @"yulkPofMJkxDrgrDEjyUJqMXNRsqWWudMbwISQqLDvYEebXXVWyZYPGNOshCFIrdTeeYfZJMPWUqKoebpiNIWNKCDmpDvEAzOaDzRZvrwfaroVnzdacwyPvBoyGWjdWsKfMPSCsKUL";
	return KDDmunAztb;
}

+ (nonnull NSArray *)zpwxvXkWHClVPQcs :(nonnull NSData *)MJrUjypunzttxwOuneK :(nonnull NSArray *)hzTMCyVsWZJjCbCg {
	NSArray *AEFqgfXroBOsCd = @[
		@"fHqqFXgAoFXXnXUWkzQHXoRXZVZzDQmOgIvzivetNOdAplUmYNagLxUeFMgjTwqFyjlkOkQucWmgwpDqegxiihKFwtDrkPHiZHZjzH",
		@"APTcDngrBoFfDFJdhPjmeOMxfPUsWqasiIEBoJobPsNXiVbZbCZAhAythjhYmnuVioLKZPhaRZAKDErdcBLkqGKislOEnLmTJcqJSoWqBoDZyEyKkjJFDQnxPECxlRxbi",
		@"QljZkIqNwQDnCgzAIbzLPuzjfdKIDznOkoLSGTzPMGHgcpSPTJCtXsTniIXNxmZbQTwvAvbjzZfxblXwFNjfWLIyNxBxTCuMSgtmvyTd",
		@"dPaziqLexquJEIKjVVanpLBHyAVkasoFubwjdQRTXNstjhqDZDMzdcaZEkSWzrkxRvwasOhczXOxNjoZygEBVnzvEvFXWmDarbGNYCbzh",
		@"dGyWayuTtVSvChZEBJlTzGavoqGCGgFTKpjKLqQgloXlyWYVQvxVxdGXrAEiuuVsDFqDpWvKSgoOYVvUvzdtXtGAzGzyPgIxkcJzRVkRDAPnPimkeKZqtTFNAWuaEaTbrXOK",
		@"NdOaZzAIrbiCzaeddtdJtrlrtoTgxQGWhGKXAetpMrCxoTGJNtWynHeByaSnOFGuiedpmszvJBOuwOXnypMfDaIajhcSTmsCUiUpYHvGhfcsNlYGhSbErjpZMrTkxOcHuRoP",
		@"HagfZCPxedGZQTfaaTwneSxIknjvTDSLJmLjQFTZDzAnTWaqEWwozVxPhAUyvkiDlBhJOGZsZHxESBUpMAzpHQihQbpsVRJEMMpUMgPgRTJT",
		@"XprfOmxheIAaKuQplRskVobgFmASTWpDRXePhKgCZlIyfkMluKUCRQCwSfhddCfivInrSHxuFmFoeUUHcJgqjnzCydNDPRvTPfhGfYTDbXwaMhJzaeToGWJ",
		@"wpAkSBcnVLnFZFctgRKAmBunJTSnOwQnzvHhIqzhhvmfmHUGLapzRCIYLVNWHUwRfMthhwJRpOQBntiiNhGXlPxnkoQWzYYHdJpjuAkwFmLmMg",
		@"wrxDEgRqZethIWIbthGjQcJTnkrckgkNbbbjREKMpwlFrucyMdVqzTNNOEbzuzgXmEGlGyGwffZkZmeBBwIJOntYUoCAbeQENkxFlmKrfiqYJjzcGbmJkswJCJYkCdaWGk",
		@"ytBeoTkyuFeorDIeMDKPpZzCdbSwERmkAgBpkBSzzzqCNtbWlNpnlEOPMNXgwMWflbuMipXrgcdNHDAmmvjdhsLxJbsxvgEUcSWaoOaMHRcDGGlXMuuKvsX",
		@"jwaGdihFuHmyVCHvzyzQaEooNBfpkkefDJwGngLItEIrjqbnrYvggFoQbbmQRcLnAfnXOSdijPCKxmpJPHRyZpyWuOAQqqaKJEcYGcVYRknGMyJSTxHdbUqISKbuoRBfXnxQrDgKk",
		@"KjbLfKoIgjFPAoliuyTeDNWnLeRjIZnGIGyZZOyYtcCrqLEOXuaUyRcZJpLYLNvLnAdYcgWjlZrhLbbPnCcUFvynNSbkHkNfDOaRhOCjtqYJoEklsKTDbPAH",
		@"EXAAjaNdcgIepKRxvjbdqsPNqmqQNDrfLUzJRhNcuTeDuwosVTTVKGfADkVGUBAlsrRSoNDEtWjZpDHdevvEYUykwUWTppMrpoimSuwJjtJ",
		@"dAnEjYDytYPcHNfpFuSITxlgzdSwxHXijYiEOCZBQEVGjlXvSRlkHUWxaDJMAEolHozqHcvOxpGZZZuzKFjwfEpKMzCZQWLesBTHWATOHJjRXPRrHqeBAvJpgyb",
		@"nxwGRgsaRdZCpgUCmnKWbYVOPijnsabQuDrfOCWkHCSOQWDbHJqqxqQbxJgrvVuclRkYgARxFSNzTfcLYwyCnGCWsxKxYrgkMQjYDUAqEjsCNDJDxcJZOthHlDCDMQUnEvSgtahHEfcUdiSDEOs",
		@"aIFnbjuKlhoNsxYeqRIwNxUjtXwRTjFbBkPIXAMlGYwBHEMELxaFtIZyjdxKNPDVmaGdkbsfLjyyppINffWvgRwtjypvUBhPjPhy",
		@"PRObIEQXcfdelcHTGSofYcWIZIRovPeafGzfUxOddHnftHddUkHjPrcKYuOYnrYGWUxCJPfCjNJwaMsQDZamduCKvzGNxFzYPCxjIXskYHjXcxprrzBOwxqqjCNRYIuZoIX",
		@"uWkSNxRvfQMulauSMItPJugiimsvuMljxxQQTdVCbKfUeuGeFDTjXaXaxZAqKqLCuxNIMueoVfgFYCnzmTJLjctklVNtDhPUiMiFWkq",
	];
	return AEFqgfXroBOsCd;
}

+ (nonnull NSData *)WrwTImvahmMmK :(nonnull UIImage *)nmjLQJKhvWSqMIgO :(nonnull NSDictionary *)qvMkagSyEoITZOLNzxq {
	NSData *HdwSNGVNACIQ = [@"tZouumqQnRxOYaQWiQCKynyDNOlaZbgukLonYtWMhNRQpphjyESFJOEalardRkSGOiDfLaJdzKnjRfIcZXEyrWwFcwOIGmeYuDLGMvmscZuvXqGiLHvJq" dataUsingEncoding:NSUTF8StringEncoding];
	return HdwSNGVNACIQ;
}

+ (nonnull UIImage *)coFxSRmCKQBY :(nonnull NSString *)OcZMEOBTbkk {
	NSData *kiroTNARgFlYagvO = [@"acSnEVBqIemvHQQbdAyjTKOheBQPSaODfpgpLGMVvspfrBRondUzSfuBscBoeqAnPVbJFApWzbvIXqvituNuhaODmeQayZdtdogUPWmSqJWhrFiJVXytaepatRFomCmg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iUUIAaFVcAZRqye = [UIImage imageWithData:kiroTNARgFlYagvO];
	iUUIAaFVcAZRqye = [UIImage imageNamed:@"GEgvYbmDYjmUayQzfsikWEnrxqomVcLVRvUFezDHvgYiNbhEOrYewIWRLGEwfUFQXdiZfueAcUaEnYeOokyMVLRKWTnioSsDZOgUPeGhywBalApZ"];
	return iUUIAaFVcAZRqye;
}

- (nonnull NSData *)iDBSyFUsBnr :(nonnull NSString *)qGlXIeTtFSWVNQkqwLJ :(nonnull NSDictionary *)WCQdiqNSDiZMzt {
	NSData *tQnRJHpDrEOtpkLE = [@"jFtGxlEOTnbWGpMBUeQkpjUENWSFDIlYCaGsQCLSVIdNFvmAAFhbMmkFameSRzyrQWnvWGagZyWBpRBZckJDGpCnPskyDAbwRhwGbUIHtenMJfBJUsThCXfrXvxfyOTmJuFtxbDfWRkbWaHnJP" dataUsingEncoding:NSUTF8StringEncoding];
	return tQnRJHpDrEOtpkLE;
}

+ (nonnull NSString *)vUMdooVMLlKqWmhBCF :(nonnull UIImage *)wPVEYKiryEQuyy {
	NSString *lmnEZLNzwJaIBJmY = @"iIVcycGUONJhWbwDBDDUAojzwzSFCFgRnIozWizjUyBYMqTfJxMGzVyYfoAmavhSmycTFIwOIUCZqDlbiovehoRindHDdmohVRjHqHZNbirEfoVuefWeqeitJEqWFZQqwIvSUbJBVBcOSxyIlep";
	return lmnEZLNzwJaIBJmY;
}

+ (nonnull NSString *)CMDjGyMaSjpBJLP :(nonnull NSString *)yTpFoIkNFXWRI :(nonnull NSData *)SsUjHovsJyhpK :(nonnull NSDictionary *)OrleRPPkHMU {
	NSString *YUyaQSqulFCNSwcjt = @"NEXnUGhskwtKcpxwFrXHceahTgpnlrkxgQaYupTIGIAuNAhgEFrVJCEaitZmpoRkMmVAUUZaICpMWPgpAOCyqYJouKsCvlSwoSrFmwDQYwvKPMKJnHMHtRNjvRDTbNkhUBYdAhIpAItkGdiJ";
	return YUyaQSqulFCNSwcjt;
}

+ (nonnull NSData *)PNnwTfNomx :(nonnull NSArray *)rdtzAgnEZwDulzgd {
	NSData *iLjDxFYjjDodbO = [@"xoDZDEvDRpdUUoeNCwhDDMIDnGsLhbGfUBXtwlwMdnPyQGCJVexFrIJUxbhyHlpfVumiDmnKowNPkgvzxFKSzlLUPEVJLSNdqsjQOsMssOfCHvYMeMsmILkTeAbGKWLFGvCPlXIwtEXAQtxnI" dataUsingEncoding:NSUTF8StringEncoding];
	return iLjDxFYjjDodbO;
}

+ (nonnull UIImage *)ADDvTKSFwMiWeVnSWgk :(nonnull NSArray *)EVSNAleXObcZ {
	NSData *XuVvwTslbYrKXQ = [@"vqWQKkcMiZZuJpXQhcXbAlvMDiDokVsUqCeldjzxZmsulSTKIIoRPdtpikyWOvwAvURfStATAHQSyVrycSexSXDtFqmCyABFjTjrW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BtstVuXwuPWH = [UIImage imageWithData:XuVvwTslbYrKXQ];
	BtstVuXwuPWH = [UIImage imageNamed:@"sTJMQSEXchkgQxkTWIVvAYPNOnNZRDGiJVXnwluBNxbAAHDLdkfoQhWyqtkqXbSxIOYlvIawYJxqbxYbHpbenoAotMOqtWryUoSmVlfLQayioEsAmtQDTbXbCPyPVbYDJEKTEoKG"];
	return BtstVuXwuPWH;
}

- (nonnull NSDictionary *)sqjUyxmfUydLT :(nonnull UIImage *)PMjmUqNxxMlaWDunrA {
	NSDictionary *IDhPGVBHRJrlfakNI = @{
		@"nhcsvontavboZqi": @"kZzOYSEohmLsfscUyhlOcFCGxbSGxjDQdyypbFSMcQYcYoWZbNDYAZfYDaRGMRydWXCBMEytfzfjXGjgervPNVlNYGSFSujMngmnAoKNxCaACKxtLBNhodhjJSXAaRfZeeyDAix",
		@"PIdtYOZRDvygsfocPW": @"iSTyWYdegofBJAGjLqFnpeYRFRocQFKgsvNVqyKIetixmLsiKQKflgaQvMCfKpTFeLhSFvMOBeWmCVKkvIFtvAbRnQnfKlDfZdeywvCtPBuWsQSeg",
		@"qVcVmsLWEHnU": @"VAqWKmsvahQTTVGGRMuxaVEKthCLhJHwdmBqvDPasbjpePUEeCsHCJmnBzmqrbogAVNtVALICIwIwvLTZlUUDaafZrPSYvEuGzzmwgUHInTSo",
		@"UzbqnBlANn": @"WMpRhIyFEiRpCgPqtGChRvwymJBUbHjccUQbmIsWIOxIxMPMwpsbqphvykdQHyNPWaiHbVCArgKFYBFkpNrabQxOZdBKWrfYcKoSquEjMdCZGYKafub",
		@"CsHnJtYVDt": @"xRiPtZkwhxmtWaHTsSTvjjTtOxSAzSaDHeEzwkWgscvgKeUPEVAGuhOEUDfMNCbzcherKLdrGkUWhTMtLCDcfUgcTtPcGslyJhuZIKsEqR",
		@"HjKHyENyNhpVJj": @"kLpNsxCXfVWHceuSxJVmODTVDLkJoRVfjLBQznVmmpiVVERDKQbUPjVyrXRKqMQmfebvujkeXGvsypOQOSoQbXwMMYmzzEWKKLtgJEbncJTTsrKNrlESFQUSvyCGcDbkqMsqAPn",
		@"KmlTgkPqgymKb": @"aByLyLYIItEjwlDoleZrjSprWTgroMbHeNUSxxJETobarPlxYgcAlLJhdWJRGmJePViWAxlRXMbnTossGqSxFILUIasaoxJdSrCAyIpSJrgrXUjUeUKwEdEcvaRqlVhmmeyrKZtoxEKxbIptzc",
		@"LykENeKZIBAXSq": @"BWRFBARfcfkYdTZMGlRDQHSSYlPhCyhmBJrLPBqdCHbKOGtELlLOJRwcRjfQldznsKtYdIWnTQfQfYnLgeQiFkknhNbaaaRtNeakLaxWFVlBUXGjusBhkX",
		@"nkcurmCBoDtsba": @"mDpMkbiBjQHTqTYaIjwOdAQJATNMMYZgYRtlmhNYWZxJfQFRrCoBPwMOuhSktJHFnMVdTEJWWKxSMEYwcjBIoVkrXJgwjzEfWZkoqtQKaUZCIl",
		@"SknqSmTrGh": @"lAXCDEhHWcyhQJCIdLEYpSIBVJCYdnTeAbjDleINANneFSelrPWeHnVgCxVNUIMhvTbWkqKDNwZkwjQxaACdkvPZJmuphcHMDPuLhj",
		@"zqJuztEbLyLlfhpbH": @"JjfTZHhjHMbDmzQmkgVTcpsGoWhleUjCiCafGPAuElybDNXbwTKapGoxymJGFDMwnBMcrbYxowgESzuIYoIiovvlpAAmBWFuaTJOUeOjKftXUPKZRZHyc",
		@"pMrdbWzxrmcMHJ": @"qjDDbOZwORXSgoBgjYuzcyZCeQvAHYgstvbUHqyKyjRcBRSAntjKHEHlnveMxDwRrPFZOzbtLiyBblfPlZGqlsaJjgDqHXbADvTpmkCErMdyWJBSuVohURcnSWHkme",
		@"mnMBzjTjsU": @"KGWICfmPmmUANPKVUlPwlqTStAgBQTmnGDeqFXbtzBZMgzhvpZOeJXtYkwSTuTBzRzUJdxUMpviVJecXiswAhvOzxWIzCTCnTZELRVdeVtrBaxFynrIX",
		@"WyWyMqVStmHeatcH": @"SWAomfOaNZQGsYLyJvSeZVcSuvJCfXhzAXneILNNSOkplgGnwFusMydEPiwGVdTqTYTSdwQyIEaKuRtymddQlLQskOelxhYtrgZKVjhMGgBcTGWCxmdc",
		@"xPxcXNxzhBYsGnh": @"ktxKRjEuIUlGvfHISGUDpowGlbHEmfIlWsycVyNCNIwuRhZSmxlcHBwWGqKKyHuzkNLwboCHufVuquoDTVSJWLDpjGCEnffEmWYINPtjGSSdUyrZwsDDGdQCEuTBOApsFdOeFznSXCkaJ",
		@"ecEodMFbCgwgrlIaIb": @"eRtkMuizKJwDVeVOsGguUnLknftYtWERXjrWygVlmLviwUoeiFJzDGyUMCkKldnlkXnCFaDnGzjdAPrpEahsGuJjvOSmuRMTCArIapD",
		@"LvYTxGFJChQ": @"brVxEkNWBNwlolnGNAcziWmKcIIMYfwhVAiaAVUzKNKYmAuVUdWRAyiLiQBOqbKaxIZYwPlpbVgaDrBitsxsWkZggMSHAMwemddzgQZlPwQyDAchDIoKabVX",
	};
	return IDhPGVBHRJrlfakNI;
}

- (nonnull UIImage *)uCOCoFFwaOK :(nonnull NSString *)mbbwDDuytf :(nonnull NSArray *)vYPReWGInXylloX {
	NSData *KdsluClddXfC = [@"OtPmeNutDXANlnebvIXgROfyTtMRxYzbjMdBzCCgfyhJSTIOHYQpomTNklEPAZTmrDvbEPzutqKuEsndCkHKPGLmojMYXfmsOnrAduigKtREpkoUTfAihwqOSxOWyTJtKeseIRvfz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ikVaNQGAjS = [UIImage imageWithData:KdsluClddXfC];
	ikVaNQGAjS = [UIImage imageNamed:@"EcdqNfdJFPkXVyKDAZwXSKZsaRGepvkxsmJgXcmnMSgYJHgNCDhLcdbyriPkJGvPENsXuXSJOPngBDiNYcaDrSXUXXgkGBoXhNOiWkdcnevrbkKvXdi"];
	return ikVaNQGAjS;
}

+ (nonnull NSDictionary *)MEdGFQmAgSm :(nonnull UIImage *)IzmWExIwHZsxsFu :(nonnull NSData *)UkMtsjaDgUkfdYUGCT {
	NSDictionary *LhWgcZmRefZugP = @{
		@"cvNmZMTAfoDREy": @"hppHkJHGDEtgCrSGQObMLrGBlFsLlqnXWTjYJndKQMyQgDbHTbcDOjxUtGNIYnnJAbnAZItpUGQNooZzueffNtkUGtISFqOBUgFiULLNsH",
		@"jhfxYkuJMiQHqa": @"AHPelklcGGEHPiFRnjeBcMyaAVqAILrMAlUJYFIgiFqrXjibjdLzhLdhESztXlaucfeHuFgWwFQzwVhKfozpmUhzPeSwMaCaWRYZlFYclIRGABbCgzopeI",
		@"jIQZMEmQQrGKNqpPro": @"HybpkAytXorXVrntGBNUPxqqsRpprXLoYqsPBwlEFYsidFZkWMnyTqnWvajrLbEzLHyJpoShDtwNgXWaScabuVghIInGMgoEUuTKNmRPksJGMwNgqtNBiLjOOqxiKFooNJIGibSbibLD",
		@"dxymoNiSntQuhSaLR": @"slstlKKUntfyEGaGomfSUxvBbmRvGlwIiCNcQMEkahFUzFdONHbCQQFPmBaeGlwflmUiSrGHBXuxcldiUPMxxLEEGhoRDBNtomRoqMzCQOeyoCKsMMT",
		@"XEGyvZvpOaVI": @"SwAqtoHdOGXSdcjoqbOxzTmWhgmWGgnmmSjpPIYqGyCWCYEcKILmtdaBJAxUFiJWMBeTGlrLfMGrUDLmUAeLPEyVwPDbhSKogEyddCjLHnBzbGrdWNDgvrT",
		@"NlvKyoUhDYotVMjEy": @"fzdfKjcAzUbGuDmOkkJvVEROTZQdaKoqXqIKBFRbOaKcelZdORzxWEiMTIODUxAgUvGKsifxfrdtGixysvjCHhouPNAFdsiqjthJoWhphpmQDPeXDBlUVjCqfzAvQhOCjyiLwAQeiMlWh",
		@"nKdMsYczptYcqmJsVlD": @"DkSRbFHauTyIAKEKKfCgBSavCLQgbZphrsCAkZYcuYfNzRKEdLjsqwUaDcQPXlYInlEbchEwRKmxwYHxKmuziNHlxozzPvWKYCZlQBSkfDXhFXAbPSWyCIzCp",
		@"PuYWUKboPUKVMKgVC": @"ZJQxXfcVkWDQmKtayPhDTlvqjrUfEnIuFQtNKfDkxUGZYToYOWlaaosqBPpDtJjLYMIbXIHvkBXMATSlHnKtMXGlIPesGyUekowtQLmOyGcCsPgTRclwKiOuOAHwgFKzJoKGEkR",
		@"ZOUuFjsMxwztI": @"ePwnyfSwjELmXYHdRYZCNrQEVLSuBKbMQRFvLkLYlnHAEIyrgehBPXwetbkCHZPRwGghkiebMrQymKJtyBBUZjdnHhCTMBCeLzAxhKymVjOukoTzzURsgLlPGsmHyDfa",
		@"FWtVmSBxaqx": @"rFOUktVAQScFREgsphLdXrosHlMERYQTjETfxHMKZdnIdrwCZqBdlIRPGZdIjBUITwlmUJitxBYxAiXyAzGrXHMjBbddNLQTkUMeMEyToXDXQxirQcKoSTgRksHJBTbBSZynpmiFDApdXzgEBCI",
		@"bfcKnZHUlH": @"FFvrwxKnxbtlqQoKGUKveDrmrZxxecZfMazprrGdFCtffYoLytYfGYtMziGOVsfISEkZwRErgJvdBvhKqAREBQXWTJuwMFpcVTUUZuuCprPEzJOxGk",
		@"rKiusfkOQkp": @"bbMdoaTfQlSMQvPqqAnVSSpWtiWheJwfDWGWVtNxLYpGvosdZtGQvSpAddEseotlGWhLAzhKbhspVuUPpuLuZeTcXZDfuOOjowYZVNQqpSpNdDKPqVEgtmSziESifvn",
		@"jOjTRztgrWEqqEtiwUh": @"TsykjBUWTJqNoQLgPJZYNryuELDzuFrttSeiazkeDAXoySlirAnQccuRdUDuetrTpctezgrkeYrgwgiOwmfUfBnWlJLldjjncVpTBGrcisiiNppEhXkmuQTFTmPLGv",
		@"HlwrTSxWuuOn": @"hsRWVINPbaSxTxiHfAtAIMQHzbszIklLSdofSRJHpbjqiFAgyEAAQIQosHdkgnyfzQCoYLlIpldcVYPbpHfAsMTCSAMjoObZTidVbHOjyeFdujlCjuqqyIHlkBJDbTLHmXkFRHhp",
		@"TjkUaDsVWwylGqxq": @"GgdcgQKbGYLBxqoKDowjIezmyycbIemAIqoBbAIoEbtyPZhjHTwIIExjpRRmWaUbHqVxokMLKTXsQQblBMEuUZIZadRYmctaqxkrbZFGotpWwGzTvAiIxjIPzzsViFyCjG",
		@"QuPdoWzyhGBVYIm": @"vehzDsugTfSNsqNLUwOCptDSfvDQTMOeJspewGpCOyDsNEyszDnfztOWYvzLCzzhZhsAUsRVFKbuqUsGKiSUCUQMKlaoHKMdpJSEBLqIIPIXpKXFBjdGEokWrboHkPoObPurgbrdMTQTmYC",
		@"oBSzEuZhcPdrD": @"sXqmIRNqruTicPcfzeyEULzEZpXqTyLHmvzYpVXRdtSmSnVdAcKVVQMpBZtokSppRaUnEcTxKUmnscRncsRGrqEKsTBSVsTpXpFMVAEWPjkEzNbBHu",
		@"foEfnhyVMmGromHWsT": @"FfvckWeKxPMvrtQbNCnaVjAkmtsUrFtcXfVDXHQNxhgAOOnCpaymlQcNwxgRCnwhtZZpNtARYfmLKxtuKkVeNnaYXCfFmsMvnhcOiAEsbyOEUBTaoryfQoYVo",
	};
	return LhWgcZmRefZugP;
}

- (nonnull NSData *)DnNTYwjlJEfSGaGDlJl :(nonnull NSData *)mMQecOOkuZTC {
	NSData *ilLBSEzflvOAk = [@"jbPHffyWKMfSaPxDLrldpIjiQGpEcsHNtIIJksFNjCKKNerkVIoMvYyJjgwQHIfKSHxPfHakuDlMNHyxcynvXDoBKTQZakiNtilphPTzrFuSfTSFbVpZXuXJSbcXoTuhRsqZNemsuvutLmxyQ" dataUsingEncoding:NSUTF8StringEncoding];
	return ilLBSEzflvOAk;
}

+ (nonnull NSString *)nnyFuUpUtIzuDFn :(nonnull NSDictionary *)HfSOwdJyiDTfbxVStB {
	NSString *iQKXQJSMAXArCm = @"yzDOSuvlotYfhXbJNGlleGHcImZhmuTGmVrMRkoOBPLeQRCLRawJyouUWAujxBxtttQgYLhckonRnJopLhORNHPmnVinZQEvUwvCLsmxKRwKUZrsKhBclB";
	return iQKXQJSMAXArCm;
}

+ (nonnull UIImage *)ygKOCbgLztaksxDzcts :(nonnull UIImage *)XMUxoySiDVF :(nonnull UIImage *)MpzUpzZawN {
	NSData *yRflbffDCS = [@"MHUGomtTBmDxRQJJJopDtbJpQzmdQQLvBnqOakNwEqNdoYwleEHeJRuRkVqbcrQClNdxDDlzgbbheavqvQrNRgShezhbbncBULywQtWhuYtIEjyhOjAVkDFTEFWsEtk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CSJoBkoqxYP = [UIImage imageWithData:yRflbffDCS];
	CSJoBkoqxYP = [UIImage imageNamed:@"oETGjPQGaFbTkOiEqtkRVLXhnCmMMFUbACqXtvfjCLeOeZBPpwOBFVMrwhaPJnqZrYAxpCbguWrIsQpktpmqWzoEDtuDvqusncEOeVEZsjLLmQkEjFA"];
	return CSJoBkoqxYP;
}

- (nonnull UIImage *)MnhJWLSjXIyhKzFySNm :(nonnull UIImage *)bqBWDiLwDoYKqrzu :(nonnull NSString *)EZHYXDEaFxl :(nonnull NSData *)BDWcCHxYXCtXLwwOqUu {
	NSData *MfdWhCwxrIqfGcvSW = [@"xqtCmxPXQRPDyJEaLcTRTjhWfrkneZozqjlZVliBPuMjaHbKcymscrZBWYTZNdToYMKgZzMCkgJkNsKSSGKffcurwQTgpGpNpEEuDVnwDlohAVWQRptYlZOwOgX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *msvTpqDKYABjc = [UIImage imageWithData:MfdWhCwxrIqfGcvSW];
	msvTpqDKYABjc = [UIImage imageNamed:@"dGPvJAHiGlqaANDjTfnIrgHNfHeUKBZCvQXdpbinLLQhQtdtdVmONEtdDauwwbNYigtwRnBwoImYHamUJhuWKmMtigPqzdFUjopQelVhsfhHMubXuSRVmDkbrDIFMEkRqhpIiyAZP"];
	return msvTpqDKYABjc;
}

+ (nonnull NSData *)gqVhXskbslvFxO :(nonnull NSDictionary *)AeQaWqrKWuyuGuqP {
	NSData *aiAOTbORTkjDbT = [@"fdsVNnqVlXpDkxvakXwYRdrTWONLResGKAPVuiPVnfHrGcGxosHZjByMJVpJCrrxpAuBKQsjfdBuADPYbKVAZPFoalkcCidFcVcTNKtIkYjwukWYzjvbLStuFHWuYBhzyoXnLlddql" dataUsingEncoding:NSUTF8StringEncoding];
	return aiAOTbORTkjDbT;
}

- (nonnull NSDictionary *)rbXIklGskaFjyjA :(nonnull NSDictionary *)iyeVXojhRb :(nonnull NSArray *)BblIesXxJS {
	NSDictionary *zlGlqIoSxePYmuCBKuT = @{
		@"PhnWHVHGbdyf": @"dTwUBUgTWYgjuctrdDSmndFeBLpPANgQunyibCvznFiUpVAIHqFEqcBFvogcQnVBTfKTvblavcSVLgNHLJvRKHlYPWVzcoRdASZVhgwnZxXkeEnZwI",
		@"XkoQmPfDudk": @"KycyGZQznPBVKaFNUvPOdAeKzjvMoZyfauFIzNpwmzbnJPrzQaDHdyLGPxQtEWCNrjuNUFubIKeQeCtzWJsSKDkKvLGKhlKZnoaFNixiFXgpUAQsdDtoyuZScZTzHt",
		@"nnDCiFhMubdkFdlsCUn": @"gKwjzKSIfKYbpBuBTHIvgDLgujDPxjNzKlEPTkNtzauItpQnykcGgTWAvVLTDPLIIrlGqsNWadVUgAWhqQoqXgiWdmaacDXorAXMSwDkUPHVLdjFPPxstOAIFsLmmoKkqvWsVedDXvFAUwQNcPqhJ",
		@"boBSBvmAax": @"MmZYkLlxIhNdIHwKbYHjYNTHADNhZPhvtCfnwKtcxSZNcPWjrHeneyNcuvclhzNlRLfLwauJexhyagvSOXijKKlCvdjmIotwCMnUQEFpjyKXDKdKMByilNSPMlhEFCxdtIruSzUjLcvCcWPuMvUl",
		@"hfiWQXlgjkGkuw": @"ulHTUyYssshNkQMkeRIuAWnYjnwgfLwrMduCUkbXZatFhXwHeNufZMqAiWzBnfUcaNCeJmHcFRkyurTXEGDULvGFkRILzkkLtcjuLKVAv",
		@"fyhwyfDRWPXuF": @"ezUrZLGxKkNeedLUELVCsWrvhXOBtgdosKgoSIXejEoMhZDiEfTkZVXVwjEkZQseazhOWogBvznONgwDwMqMNgKkdnaBMehUgqXEPBgkSTjGJxxTBrtSfYMLLuDELNiRTxGicKIDKzSzy",
		@"MIdWTtQIKJteD": @"EfhksjIJkiLHVOgpMpcPleqyGeUmMKIIMcRQcAvKTufpmAVGNOoWlTQnEdlfwpJhBGOWNiNxqnfGdoKQKVcsEeDLVgfTRsoMrCltlW",
		@"soUIylJhjHfDs": @"aLPMMOicfPbtFUJbgYBcJGyhFhObNjKMBrYATLhxzRBUghxViLriZkoGwQqcnhYeMqQRCSRlTcXqpaEBlQTdDbQRMkpfNZHZlclpUMbpjCOfFvWFKXYlbTRTSbAbrDUOvcViPbIAb",
		@"QMlyiIVFDu": @"oGTGoGfUPIODprqgHXHPCcUOKYXZccFyAvjVDpLwiPlaEdINRhsKuwEfizJKuTxZEVkUwSzipRVfeOSnoXUxrHCIDMvkUSBEBLJiebrfjv",
		@"mNifjduYAbAYqX": @"YpZLMgaWHzQgzUuOVjUuRbepCmwbfgOdFojNYQMmTWLThYhhjTTHybcpcgePdbTZHOfmDIPHkeDYoGYuirZbeQAeRckFVkkmRdZkQZIWUsbpsWbeDYywNRqljDMHviJWi",
		@"BJnLBzRvvRx": @"vDGuflqyVHqVSxyGyXkwNvaViaZApYiHBHOzYOPryoTNOHghGAQKqelPodKjXNvkuJaIRysXURZKboUVHJOjoxChrKhfEXcqCekjjLzjTjhCiURsbYLUMYZJOKCRiHttVfpZJOGkV",
		@"WKximblJgOFtZidNk": @"TKxlWSerpgpyUTnRuAlFHARVWXNvROeIhuGjCpQTlmwvHZhnLJlyvNxVviraYFoEpsCuyFlbYmmXopbQwdnortCbFMaURLcnZNIZwsTW",
		@"YiHmiXYRQz": @"KCAgwbQyyMcYmWeunYhwJcnKlcFrxHzxsUaKWoWPmLxCiuiINoCdLixKOgXLdEtuEDQLGzikcsgOQkwHChOhbUrJCdfkdpWhHSFfldQHfP",
		@"MPVeBTFpqXDulG": @"MxjxIGwWtSuOenvbrnzsZUXtCQKoAPSdDDtZhPuqCoDMTLVJjShrIYgtacAIeJEavLOGwKRzQsjldiNhAUBVovWNGObWiboxERnkYNyAYGBdMPgfpefEyFrXoPQShFtDUyweTgHqW",
		@"rQkvIwVPhAXnnriq": @"GjVjBoTEAyJaNYUMQQFFCasqSgEAatNhvYoJpdhymfmfeoGWFNDwDBMckHQxPqbWWUGOYdTrfRTJyhvDCKZknikLXMelrQOYCBjAETGkWJ",
		@"tkiLDsTwInOxsdXLO": @"kauYmnchgNhyueqlPTmInZjkwkxmmPlfIgcYLgKWYhitiBxHVrSPNiTAKzZYbSNQkMIWcVFekQSpkeOIPkfPQJqkxkMIrXwavrwtJcQxmIapFGpNQxveZeNZxRAWjybLVl",
		@"eINrjwKDats": @"aVVgidvZPRmyMZmZdaSOEfAMHinfpaXxFbDNoLqBJhJdBqbsIAUmvGLCwLcNPbUylCqiFjRwBVfOJNViRUpUXGdwjrwQAxpKWhRkkkXdaGDqqMGlFTxCafViKzIwfPRpBLBSvPUSYZoOrJJp",
	};
	return zlGlqIoSxePYmuCBKuT;
}

+ (nonnull UIImage *)HQGzNWEGfpNexTE :(nonnull NSString *)ywVJllRFwgfnj {
	NSData *fpNEuBLCvXAeG = [@"vxQdgiJjOgPLFlSOMaqtUlOUWnYdOQhiijkyYfXClvQFFPjwBBWfrQAPzOXFqyMUbLcLumPxObZdfpHblcCPhOvxekkBrEBZgTNsJqwqBerhPmlovtdrCrxqbWBoTAhZurvKRtpsOPwflGqNgVW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KMvBRWYyMpuq = [UIImage imageWithData:fpNEuBLCvXAeG];
	KMvBRWYyMpuq = [UIImage imageNamed:@"qxZqkqpnWLdzRkYXQWEVOwqfLJWqtAtPQtNWpKBAXYqVQyjHYiJATDjJozGgNCnFFbozrcRKJZdIOqnxcjogBuPwFycKevcMkpZqQFPlcyOOOcmazgHjYZMjFRUenlJMwaFNSG"];
	return KMvBRWYyMpuq;
}

+ (nonnull NSData *)enpBlGJkBnjYbKD :(nonnull UIImage *)wWDJISNHxv :(nonnull NSString *)NCJxCPnLqfyfrlcdLwU :(nonnull NSData *)ERqiEAurOhc {
	NSData *fqNIPbdlCJpSjKoBh = [@"lsIeLwXPLwfIbEvJRBGivttmcCCMntrRHOONMfVWycbLxQDMVRYnFwQwrrFCEeQdTGCqgncZYBbhHdaPBTPRtcFvogJsXpWIjdLSQWtazCIsXrUeRUfvomdXHisxjpnnOQdseEPurMFZBi" dataUsingEncoding:NSUTF8StringEncoding];
	return fqNIPbdlCJpSjKoBh;
}

- (nonnull NSArray *)YHHxUiqlVD :(nonnull NSString *)hpYRGqBoHnJJ :(nonnull UIImage *)QyBQjvAaEEX {
	NSArray *UYldoITXbrhvbjqqYG = @[
		@"tqPkiIbTGZxDaiSruVDCtcEfGOMFBXCsdOYRMkxJzVjyAnvnRvJLZPyCsHgfRUHMJeZAJJCWFCMrbwVJxZoqVdtPrqDIObgWMVOiWckTfghZQEXyJESnPFjMinv",
		@"QgRpUkCzCumKaXRycgzigpsGPrfsmPYgWCjOyJsCUpqzkoDQKomhYnyEwEpAttNtCkXkXKPZyiFdCszsVUqkmsFNiPQHECbqCzxRWHHTLPXUVNHZqidjIMnYnbMbfYEDTxLvfWuWBCNBHPnvm",
		@"uUkPDGmapXZnbKTcADjHTFhptqERylygmTSikkbxuvnLyGgpeUlFSsvNOXovUwXEuRScuECuxYlftDvWzgdQyyyONwgMfXdqfLuLXYTdltYTOzucAVurhZLMdsXTAJPaeDMVfgkf",
		@"MUNxUOXlXrZnELVwWDgnPNbfXULhHoefbXfTShFowIqNzrhnphkGQcKibmYmxcJQEKrNiIpfZXrAbIxJYgowlSEGKWhQnnPwmcxWUowFUV",
		@"vfCgfobAqeemTgzTzGUBQajjFKiFeTylDopnTsZCkJpVZtJTASZEKLUGTRkHFzOzzOEezEuSuVrzjLIiaPcrywJDxGPJfSryuYxseSkktEfWpJoHTvgFEpKIPzACDFvRbHsrSeaHjHzCIBkFe",
		@"wruWtsNFPDVHIAzHucaNUWlHdiWywMNfxNmKysVItSRCnhxfAzvLaNHnMFwsYNcYHOnnYtoWjTzOeVleFgbPYOnqFMDtxxTYiDFLqqkO",
		@"GOvnzJJGsxBmKeFanotdZZglwbMQeqbEpbjxwfLKRzgeSfJkveAEFdwIdvvbYzpiotJXLGtTWfHFukbWGvaQqrkFJdGiggGkJorohhgkHXtKNaZX",
		@"zSzYYcyGPejHyxKtdhlMGSeYCZaTSSMaLhwDrRpLcyQsuOenDxQBBVNfiBlSaBSEupMBcixXlNuUVEtXKTxxpjgDaFkYSLSnTiDeSLqwenUqDay",
		@"xOjagIZHngYXgqohRDScgksvHAyAgNXzzaSUUrMtcUOOPZAFqJwsgNvSpbbGDJWOSNIpLxyUFILQvDpdTLiHQQmYeUKmQLwXgFhtRhFdKbSusLoojEHr",
		@"JkJqxvuRHCrQoCPQojmQyNCZolspeKgIILJsbvcYiDyGYshaisGdCOQNovOrBkZLsXQKiIkdkEjumXLGTYGZtyxTFuYorThSMWTXutjSPKjeSKXrIwJDvGaheIaEwXbU",
		@"mtUAbIYoEkvYkFhTNRXFscztEVPtNmgMUbfjEyutSgehtivpodDdfqKlxgPayFTfhwstbopHrVcOcxpCANybGsJTwYLHDuFwxIipYmRBSAYidkAsDqtwNWjalcifKfbBkLYFeisCNSzCejYZTKKRS",
		@"RpJONIccuVRjumKoMZPwMSSmmccdkRzkfriaREGOgUbvdTcrCHHzovgFGhXTbWDPvhXLRKUDquRyhmagdrUIpAJfhTJnUJVgdwLJmGCRNbzyXnmYiaXfQPIdkHIDvAwNuRAseseKHifVbkVpWeK",
		@"DIeGdYKshSWQcuQWtuADWMtZoJOmLOsTICcbiSWGKMHTwCsoYTltcirjrknbGhAeuuIubQesuCGRmucWNtWSfhbcRbfeZWPVdSBrwjzm",
		@"CwtXuhaoNDmytbHsECWphAeLwpPhJaNWMpagzNziVYAKmfyAXhDsAwGJtwwdERmbYwHBtSecASxhkrMHctOrtqTDDxMFgakjcDvnIwEvXU",
		@"fyWKOisfkoEcKDOkvtgAKQehGiLrRbdelxeWhzDcLuQizKFSjBmqSSScCQuBFJcSxbIPTRVymyNoXgOfGMhEKQGNWvUtfIhCsuAzntCojSmfkabvrrIynVF",
		@"XcniPmXQtSZDDIHPrPNpxwrWnuunzIBWsLWXUSpUZGVLfHPeNmwZHaxmBrhvVODlgPDdCbEMjSGkCkIwFIIEvrQAiDwUtQPjaEchRAQkekaKSuptePmFgOEabvsKUUgzyIQqSviFOIQVcQ",
		@"KIqOusJqdFNAkyLbmIpIoKmVOdtsLXqgiJmvFCAzVOYpsVUNocKhWWUiuRzlaCLkYqAqfLdhBMHsBPFSjJmmbbFhKRbUkxQVbRRgEREFcQimfvASAkdAWcPhrFAyTIHzkz",
		@"APXhkhCvTnEKYPEPblttJwPXYxenAfEOTjZgcUbAfYREFoAkBLecCUCXQChEiEpPXUDrCBpuNbmyxatDhgChBvXsRNMohNeYrGkBRdotjsYQxwBDjjdORxMOFYdxAfWLxqApxv",
		@"CviCKWUxdKQiGnIuLLhhHALBXZBNKdcIUlVyQlLWXgwImWqSluygpsmdRgTfWzSnxgeFhHzMhHMUjweeGswQqcpcrLcaQzzbUOMRxcjlASnepoPJGAHUvHvOJTLDPxGfUlRqYscTlRdk",
	];
	return UYldoITXbrhvbjqqYG;
}

+ (nonnull NSData *)PXwxeTAxrNEJZkmsME :(nonnull NSArray *)MOHUPiWKkalOruOAvef :(nonnull NSArray *)LibnhtmsMXmnH :(nonnull NSString *)LBsBImqflpKueYHvxjp {
	NSData *SMoXqKPyXhr = [@"kGcXpkhvbkVChOHcneISDDoSBMhOyrGFEckOFUhHXaRSkcQcVNDUgUtvSNDwluiJfRJDtDejKDOgIodwztnoLQxcQqazXqtmJwNmKpQBhtDjdtJGakZtUrDosMjPwOIsvuqLvraoYzakIqzlgJgEP" dataUsingEncoding:NSUTF8StringEncoding];
	return SMoXqKPyXhr;
}

+ (nonnull UIImage *)hbUiJTDzpVkAzJOXDrW :(nonnull NSData *)XboCUWTMtKiLvLdMLxl :(nonnull NSString *)SZjeXeVjwBKGe :(nonnull NSDictionary *)ZHrAmGKHcqOKJLKuWxz {
	NSData *MHBayYauYTQNpb = [@"nCLhlJvUHpQuewKnVCipbpHnZXEIYdvYRjHSbzKCqySKObgWmLoBfaKdogDuJBRBbPPbSHFZrbeejKvvckvsPTiEuNttOJJSaXVFRvfRRakNugloPnNArdQlXgcUtzjCZKZe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vYbKMrwKRrqhHHzU = [UIImage imageWithData:MHBayYauYTQNpb];
	vYbKMrwKRrqhHHzU = [UIImage imageNamed:@"vWzRIbpdOGXbAYKOdMVBuXxDgjZAEAFGQFwHKztpyrhggpczAlcsbqBuTELPEiPaoSEsNSWLesKeVCgDYroaOTTPlfwPlFNMqovgbLVlElCuwyu"];
	return vYbKMrwKRrqhHHzU;
}

-(UIStoryboard *)storyboardToPresent
{
    if ([self.formViewController respondsToSelector:@selector(storyboardForRow:)]){
        return [self.formViewController storyboardForRow:self.rowDescriptor];
    }
    if (self.formViewController.storyboard){
        return self.formViewController.storyboard;
    }
    return nil;
}

@end
