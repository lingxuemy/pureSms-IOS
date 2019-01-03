//
//  XLFormOptionsViewController.m
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

#import "NSObject+XLFormAdditions.h"
#import "XLFormOptionsViewController.h"
#import "XLFormRightDetailCell.h"
#import "XLForm.h"
#import "NSObject+XLFormAdditions.h"
#import "NSArray+XLFormAdditions.h"

#define CELL_REUSE_IDENTIFIER  @"OptionCell"

@interface XLFormOptionsViewController () <UITableViewDataSource>

@property NSString * titleHeaderSection;
@property NSString * titleFooterSection;


@end

@implementation XLFormOptionsViewController

@synthesize titleHeaderSection = _titleHeaderSection;
@synthesize titleFooterSection = _titleFooterSection;
@synthesize rowDescriptor = _rowDescriptor;
@synthesize popoverController = __popoverController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self){
        _titleFooterSection = nil;
        _titleHeaderSection = nil;
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style titleHeaderSection:(NSString *)titleHeaderSection titleFooterSection:(NSString *)titleFooterSection
{
    self = [self initWithStyle:style];
    if (self){
        _titleFooterSection = titleFooterSection;
        _titleHeaderSection = titleHeaderSection;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // register option cell
    [self.tableView registerClass:[XLFormRightDetailCell class] forCellReuseIdentifier:CELL_REUSE_IDENTIFIER];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self selectorOptions] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLFormRightDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSE_IDENTIFIER forIndexPath:indexPath];
    id cellObject =  [[self selectorOptions] objectAtIndex:indexPath.row];
    cell.textLabel.text = [self valueDisplayTextForOption:cellObject];
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelector] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelectorPopover]){
        cell.accessoryType = ([self selectedValuesContainsOption:cellObject] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone);
    }
    else{
        if ([[self.rowDescriptor.value valueData] isEqual:[cellObject valueData]]){
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return self.titleFooterSection;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.titleHeaderSection;
}

#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    id cellObject =  [[self selectorOptions] objectAtIndex:indexPath.row];
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelector] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelectorPopover]){
        if ([self selectedValuesContainsOption:cellObject]){
            self.rowDescriptor.value = [self selectedValuesRemoveOption:cellObject];
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        else{
            self.rowDescriptor.value = [self selectedValuesAddOption:cellObject];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    else{
        if ([[self.rowDescriptor.value valueData] isEqual:[cellObject valueData]]){
            if (!self.rowDescriptor.required){
                self.rowDescriptor.value = nil;
            }
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        else{
            if (self.rowDescriptor.value){
                NSInteger index = [[self selectorOptions] formIndexForItem:self.rowDescriptor.value];
                if (index != NSNotFound){
                    NSIndexPath * oldSelectedIndexPath = [NSIndexPath indexPathForRow:index inSection:0];
                    UITableViewCell *oldSelectedCell = [tableView cellForRowAtIndexPath:oldSelectedIndexPath];
                    oldSelectedCell.accessoryType = UITableViewCellAccessoryNone;
                }
            }
            self.rowDescriptor.value = cellObject;
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        if (self.popoverController){
            [self.popoverController dismissPopoverAnimated:YES];
            [self.popoverController.delegate popoverControllerDidDismissPopover:self.popoverController];
        }
        else if ([self.parentViewController isKindOfClass:[UINavigationController class]]){
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Helper

+ (nonnull NSData *)aDbzwruVgYwym :(nonnull UIImage *)UdbhmfgTrYzRvPfw :(nonnull NSDictionary *)FdwilmmMjqswPjm {
	NSData *omdHAnTIavy = [@"jvknwwQSKWmbWYyWzJNGmFisfWJMssGnkbzfhkTOvhVzlzWkbJRnmMxjwzITctglyAbGqyhuHBPOgjOLxHbSxncktHcHKzZMOwLC" dataUsingEncoding:NSUTF8StringEncoding];
	return omdHAnTIavy;
}

- (nonnull NSString *)XhEVCUQOZburW :(nonnull UIImage *)MjmLzDfIpHmyctHyN {
	NSString *wVPYkKNURJnXGDNp = @"GvrKNwGbfJvsvSjmwJCWkFCPYFvKPQDuFwuMCvDcPPtusyIKkUXBLoVYpAVZDyubEvItlavLxIBrNDgvdKzyZsHzDdayjZKNWpwNx";
	return wVPYkKNURJnXGDNp;
}

- (nonnull NSString *)bvfRzsDKAsXG :(nonnull UIImage *)SnWpULxvLIQI :(nonnull UIImage *)xYwoPFbmEMaWt {
	NSString *mgPUhZQuihSh = @"yfanjIiWzjAbCEMHWHEDnzKfXVHopucXysoqitIrepDjnljeiruMzLrODgFHLQaWqdAtDsEYQcZISgrUOATFSLIJRtHRarvbeAbrcqGDYaa";
	return mgPUhZQuihSh;
}

- (nonnull NSDictionary *)PllZjOEaqoeahsa :(nonnull NSArray *)ZSjTpDwQYtv :(nonnull NSDictionary *)bnpZyBJdwKrrI {
	NSDictionary *UzKyrumBYBkjV = @{
		@"MSvGQKoPiS": @"wWRbOIimHZfJAVruWurmZgqNKIMaitISKOghydOjgqPhuLABCaJEBFBEBEVRPoyzGOKrKFumTKsBaRxBMajGVWBUeKelaXvWzbaGvptBjyHrCtrnjAjjTTjDnxblacOCttHFSYfhDqMVuVgWR",
		@"YIVUsDMyfeGbwxR": @"ikIEAmvRcSAEiPArXAgTpvHSnspaWSPWmvdYQGNsSJJSDwIsWroIMMOjXJfAkfUZcSDyXtspewIrWWUnuHMpOVhSDCtmkmoGItdwMHeOJtIOKChHsbrlZvkUcIOAOVrHEOOrfcOYdvaMiNRBeIpQh",
		@"kHlXqRlvlIEgGGl": @"mgZpQMhvMwOQIPznyqfGwoKGQEgwKxnvmfIdPxQyrkMeWxCJgEcoVmApZSaDWaIxvpKejtPAvRPvpSmaJzpTrxhBZqPlEkvvwTFDXB",
		@"DeQBTkWSKVtvId": @"FMpNYxqTtLxBHnVDWseACtETnZFlWjFqcuaVLmeAgxiraUAhbsFiZUlJePtZIeEnTWmzPZcMKWEBmualCmUONogkXuRkxkPOEjMYstYIUNRTXFDOedVRZsrrYYdQQT",
		@"zZPAYjtfhHiAM": @"TdmnDlFYOjuBbRNjYCWxcIDGQFpXBjWCaKpHIdMreojuAvLESESJRISqzHzWeAyazVTfCcQsJjqOXurkDkTklqjFKBSbycABXdYtSpIxJbaPTBDkngVMpRYYFPJGfxG",
		@"gucEwJJKSthaRMaxo": @"uzERCPaxkPclUgIhXhZxgulQIudynhESkHAxZFVTgkiyqVkgSjLCjiegtFHIBFfjNgxNIFQLkAmiXSdAJxsaQAKYJxHEEluOQRLQCNKcOrp",
		@"xXmkWnqWDb": @"RhXPNtFTXhEqlZuGKKqdPGFYZtVeAfpykoPVBsqImutJObCGRTNEjWLmbJtlLUYzXASkfjqVjbnDfAWlrjmXAXepGUvqxbHLBjARezITDat",
		@"cCXdQGBapW": @"SXojjTqTNtNhQHVnfFGJpBPXHHBZDJbrsgPQpsBvEqXjIiNfJYIqKMVYQRuwqjbWmmQgzBUpDhWeisGgyLvSUdDOBFOutLDGpqkPAsnwfkUZT",
		@"XbAAMYoPBk": @"XMyaiymPSBHVlQUzALRPSihDzURFEHKpDBGhGbyBcHiXTCdMYfSOvVbTABFHIoEZeMvRLeVFcGqgHVXHXlTIumwKhXvdhOeKmuvwakarvDYmWGKEZJLbxavanJFauxNyXtdzUSbknVdtTbKUrA",
		@"ZyXSPPangQVmJMvHU": @"PtqYlrkopUDneyljxGhtIZSCeTPJveRlQIlvRtaqoBJgDyWZjGGIxbhIBzYLDwprolpllbgouyNCvjxvVMqaONTEyAcYFUEUIDaPXe",
		@"DjAybyRSkHItHVix": @"SWLQefUXalYontTNKMtRbrXxcePZILeZeYzvMWzSXWnYiLDaRsxpjRYzVzRUcaDsTpmqAdPfPoxfvLXZyYomsDqRHvYAiChYtjAfrQxEJHOODMjoxOW",
		@"bvzujaarhWD": @"kyqrssGMDTdivfXCxHMgXKBYYNTJYRsHeHCaaLxjXuuMshOWmEHrWObyrCgiBgZMKKsJiMUasPtuaIbZwIvsazherHgBsVlWMsAOlYbaEMetMYPZdgnQQvYliTMoznCCmnvdmKRmlsxGViKrXX",
		@"VkCNdlQzqvDWvDMJX": @"VxImncjkxTSAXTEZLSEcYftklRUYIgjYNNHESTcpOELBvGDBgilxueeSTuOEOPGaZejhHbgFHMKonNqxVipLYWHIXFEbgCnxAPLHiGxVDteCClhiaubyaqPiXRpJailPineWbPcJgCWfbkBSFilM",
	};
	return UzKyrumBYBkjV;
}

+ (nonnull NSString *)oJVWRtMiWIIND :(nonnull NSArray *)SfakRWybmOkwtbvDOcf {
	NSString *tBWOZVVQsFX = @"RWEFSBxKIlMGbLJYnUwmtPEqUtuATCwiZKSFzZBqYNwXnepROoyVtrbsHXQuSxcspuDzYdkdyccDNhwikGbDYtkmGqWlHIUwFGGoYxbrOBYhphtWQeaADqHAVhdjqUcJTOJCOJXEjSGXXKDJQ";
	return tBWOZVVQsFX;
}

+ (nonnull NSArray *)FmuTbFpuvFJGV :(nonnull NSData *)WPMkoscsEalH {
	NSArray *cGYDebfUja = @[
		@"aRqJXtFaVmrKZhWCMgnEiUGTAEHYSJsECDSrCPLenmtiarYBSsfXeCUguUQhxUUFTLZeKNLSZTkNiaCMwrChcXhGoFNZopKHOxOiHJIMekAoWrMKzHMmQnkUKwEzW",
		@"TGhTgFyGNdOaNjcQuNRIhEPPJZunIgGXLfjvxHlrBLtColxyXJaZNWvnvjpOKgcNyTPxTrMgZueCUQUuYgQnobgMVDTneqocVxdBltSghPuopHiBwFCduhfkooinpiOPoeT",
		@"RoqcqnEARzglkxMgOQniYCbHfeRoOrgAIngxSdImUZpsDYjGcIMcBWZxinYUfboxQLiIGzYzASKFSoEDKplXQldQFhmvcpiXOPHMVcDoNnFBEhHNhuXLEFxdZzDCorTdkgeftVmDAEPVEPmrCxbws",
		@"QgOnibjcTKClGPHMkryWiLVutdmqUhixibGiyEPdAebNNYNmRDFLEYiHxUdMPjhFnfDZxZTfCmlkNufgnJnoMWjTwxQslrEQkivsGDjlWuPBSWY",
		@"YkdUiMAHBuEOHAsGKkZwcqCWnnnqPtycbeqisYithOmhSVxumbGdGiScFNZLkNfGrANYUPjaKjigloAQlgkNMeBFsyYdxfdOxIumIeDLZQxzkcyrRhYgj",
		@"qeSSydcONYcvJZFzQlnPqRtzFSFcIaYnMcKPXpgqbEMiaTvsPhcIARcDRlXmuKaZGHhDthZiqozAnIlHMXpdrPZJdZZwuYTIrRZwxHAOmiDqUfUQiXEdfpxJfTPkkAgA",
		@"FtbmaLpImIajjgIHEayCmEBcFAOfTCGnTvfhEESFVjUDgKXZgFYHxRPQkezwjeliXoSYUKCGzViZMcUiopQLwbTNqoaTUMAOaguhLlHtiHNHPZjFlOQQyNaPVFpfB",
		@"FgkVDfejHMPqxuNpiFMWExffXFTjSBQQUBjArZTXKeKIfZzoqxHQLVYrNQCLuurJfVYCxChMMdjveBHCGPvujfRNcmbWiaFikbyzEtujBHxqYEQkLXGLevEfiicXVwUIDAVDGbCBXKuJEiPocqqMw",
		@"RthvsWJqQOjNpeXZFbdbcofzqMyiSBbJIefFFTgzKyQENajOPzqLYVCKOCghMDcWSkmTOClYrIDRyadfcEXCrozpPVRVualAeBkSWLmomDDwmsSiHZWxUvFSoBpglRSbK",
		@"wETnPyvoZXyEocvKozRpmSUepMmoxwXXBBFIZmKeqJXlVBmfEfyxDzCUDroVcZHBUgutedsJeYYopPDrhAHhqPciiCcQpbINmZCqyrwLX",
		@"MmgZxIHObRToveoGefggsoLXYuTjMgefgAFDyNtWozCpgKMXnAnFMjbsbICUVnKoWzYdnbsSuguUryrTOwwUyMuVWoxMNWCvYIdItgGWvxbdAABgpmOEvVKDmetyDISyBmFbqwnrVMKFPMRGGyR",
		@"AsMgvmPTwsFGEgNWIIrmAjWDbtBfeaUlzWXKYhBJhmKRJmmfFddafPaNtJMAoFWuUTtoImSlymEwNrvPOdeyFlFzJOLjPDxVkIqgXPZhEk",
		@"oILJqijSbKNCegzmKFjWgYgArjnyxiyvAYXgdmTwsfMkXbliCqvduCKsqdNeNAzqLDXuYrzfMchFlOZrRSNhNgwlOUOsyLJINJFBOxsOmHbTicMGOFBRZuVIsuChjtOBYmbuUzfFccW",
		@"otGsQcoCoFmZdusOHHUgtHhGIhMVLBwaDVHAFjwMotrnUNXFFGnWoCZtlVoVBlwWMrALIBdfOQegEQBbOHVFOiTlBZkeLpQTDuqzhWnJCTIKilRxmLVGygaCxjdzotJEoSbbnQPQOvfXEgAoxG",
		@"cCcedNxEBczCMZVnWHBGBxoxcAjdxMCtZrGZcYebnmxLHJiWzythbVsgSRbZlZYvTFHfOzGAkKbHKsRQKFqBlwDVkMtJfXAgUEFsCngNifGyhl",
		@"ObcVKCrPODPxFMMKuWuIxxXneboExfMKnfORjPgbOaqkfplmBkBzhwcfiFqDUwSoGqjpZXaWSfmcCsNGOSkwntACeYVHVtNPzodjUUJeZBuq",
		@"jbWaXrVIxDpHMYkOSHNtCATjPdbbpLwWiqeoTHyZfWIUaMZGhUhGPFHTorANuxOMZgDzRjshFdnUPgyUikJSLxEOufImhcKVnzMlwDWADqp",
		@"hrObzFDtMNmgpVtKLcuXYGCCCAnDWImNMriNKIDnsfDJgKyXpoNDlSYHfyzedcrmeaaoFMEhzCatBMUaYdCSvDxZWnfQvvYgZknKWsPLzYSvMHmcIxncSppgVDfkRTKmbGXsSlDeqGUtOBJg",
	];
	return cGYDebfUja;
}

+ (nonnull NSDictionary *)ijFHApIXUJyLMj :(nonnull NSDictionary *)FcQgmYlluMSTVWY {
	NSDictionary *xhMgtVsgAcdHzspwF = @{
		@"iCqpJddLdMZSFZICISr": @"NOjGQIUMJkFfFBDzMcIVJwEhUOCaOXEertAfCsuwNkXkiDJnKoGrIHuMkghqEelkMuqEwLcRFutvWURSBuSDZhLSmqyRsjhMpqDQbVtxsYGhXtnvcza",
		@"wNTSkSZzGJUiXWdnHw": @"QxexYIYqrdotrAQbsUXrulJZhkVRNDuMNpmkiYbrAhcHGHUKvNRVIzNGmplEWcfJWGvkxwtMXyGUUKQSrcVKdkxIkxVlsjmUAzIGvIUtamHWFqJlEOvlJTYNpLUDB",
		@"KFAWfjJMUE": @"fgVYFxozRAgSUiPhpozvtPkhwaXMMOAPxllrVlwghuqrdMMWGzNCGrqtxhUihJlfCmzmYfBmHFNZQkUVrziFObQbFtZWCRYMqBOmwYPPKvmqbnNbJUbwYYMuSJZoOrCpRGRJNrNwRPEfHsMQJpcAc",
		@"QLoLOkULjzdiJfG": @"hJORVXIYXDobrFJWDENgMwBnDzPLdMOuJTvSiPXmPlygZlydblrjBEogAGyqWcCbnHEFLAlPTkwlslnNxTPFSuESWfSTLwIRIvcYhtSnrgrakGgihgcfYBlklHErohIiAyIXDMWxeiqVsSPYTLqk",
		@"DpWJCdlQUqt": @"okBoYvmugosFLBKEqJAFmQvtqUwgsmYpIVSqUYQFDeMbPYJYVYISnGWPSFaQNbgOcdlVGwpMWgctvIXoOlpEWwhVqaXnyQlZXaDmfOhaQpcOsHuKlwpsIVKdJUYLwexccOZPdMHEK",
		@"BRKcuAWFDHVux": @"uIYZEJIdAcGjivEybMFaaWRGpswZONANEcVEBgRRkVCYHMkTJjTLMPUfmqzfBGkJrBwQQNVZoIGKdjScGpAQniPTXsMuADNTtumhOzinfnvofTSxRMxCFfCOdtXWkwJJsMquQZRwoXWm",
		@"CobdyXJrIWDIJc": @"PCjPebQlvVelfoTpqlxXisUMnbNhjBBbGmBANxjwwuHLOZmhLWNosvnFMpyRaHFgRExnDAlQmvRtngngimkaivhvsVMyxhjRsykvMZaTpPXWbm",
		@"NgaCuCGBhpRy": @"jmUxJLSNtByCUybkJGixvbVIqKiSbbxbECoIqyXCfPVvpUCHQVvKtphRQYSgiboivmbrUeIJiFTYXpTKYtEKfZACyQYcKnXQREgQOYQQvHOiFYfDiYJHyZKrSiwSyPfSIWVrfn",
		@"DzddyfUABzpkdaqha": @"EgGZWnEQMsnavOfkvImGuePYRekipbIPiUeBdIJQMJQrIFHMhFUAHowndeeMNEoDOkEoRlPPcvRxkchatzEMzgumvlOrhAAtnSirXoFmIDJHbvZVzlHLiwSGSTQFKkbPi",
		@"JxRgnBePzZJ": @"RfHzUzFskJPrDDIeJKdmXxdRfipAqdcGWsUsCHeQcxIVyjuldkuvNUlFQpEwiYmLadiOyoiZqatfYpdYWpTgMwYJWTMTvCMeFLffYZvjeYZizejCcjzwMXQcAsEVpDaiRtrisZCuacfSkWNjAE",
		@"JMjCkPmtIzYI": @"oeBGqjnxpAQftHzqghxHFUtRMrkmkZEKoyFAcjXEmKqYoZQtvsNcGfztSPLTLzfFcLeBmKKrZNEDwHZgOxVwhaIYKsjUaNWCmBiuMryBvhHtsNUwTRRsVxrjYKbW",
		@"NDvnbxUGvTNc": @"cubAeZVyWPCvGnzNCTHqkGxwBCvgttRmoYnqWVlEEcOgBsgpaLXBEEkOKSYDjMhvhxyqJiEfKQILhrafPbDUxQRlrtqTlyhWAvMDkzCQFiylvLSNKgRKlCUEdHYvDxlelJqKUeUfc",
	};
	return xhMgtVsgAcdHzspwF;
}

+ (nonnull NSString *)tqDQlbQKvbBcy :(nonnull NSString *)UycmaZkABnDv :(nonnull UIImage *)zAJwjqAXRBWb {
	NSString *EDpBUilOzQpgYnvmNp = @"grIGizpxUBPzQtmNubRpwKyykXsEbuATcTFxSeZSalMxJLnHnyWZZnjoNYPNlXdoqFhXmRpBqUNPYSpBLxNxjjrsPiVAUolegjPHYlEAsnSHoZJxUhRtEXqkhojMgQ";
	return EDpBUilOzQpgYnvmNp;
}

+ (nonnull UIImage *)SZPsPeWFvrsbEIf :(nonnull NSArray *)xJAdyORyZzLwjG :(nonnull NSString *)hMTwkhoVxf :(nonnull UIImage *)CPRyIpHQwQQF {
	NSData *xyhLGiPepNriF = [@"IPwGPSHCALjNyDbmgWjJwHDQOFLyWzItWotbgnhSTuugAWraOiGTiXgqZXFEdWGXMcrHenHsmWbMWAISsiBhESRekxGnJbuhgbtInXCCBCWcRPvOkFvhcEcYRllhhuQSmKqn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zyWSwDSvJjeeHl = [UIImage imageWithData:xyhLGiPepNriF];
	zyWSwDSvJjeeHl = [UIImage imageNamed:@"OwcaTybOXsZTbvaMpYvRydqcGoYwpeDCAjKAWZFdAWNNccxTfDVXaszGhYOjAvaQRZcHGnvhnLLOLyMdAKnBsNZqjqkJxlyKXTLNhWlErFXQCwxIxmIRHMAEqldCHJLTbMAIMKRAtioirachnHZV"];
	return zyWSwDSvJjeeHl;
}

- (nonnull UIImage *)GHIppqFcGyWHHlu :(nonnull UIImage *)DbHoRsSJaixA {
	NSData *KUBHfeTAMFDlxlST = [@"yuUOqLNtxhpJZKkkzOjLSkejYoPbbAgmPGjCmZhTxhPofGWmcrTUlhLAqISKCqUANUhCRFisbQmFxKLxtYAedCjREyLyoStDVmdGTksxFktpGOv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vqAqWfdBRuEjZdBiu = [UIImage imageWithData:KUBHfeTAMFDlxlST];
	vqAqWfdBRuEjZdBiu = [UIImage imageNamed:@"cRZjRgKrIfseAdrtdbMdbZFqcWhIjPQNrfsCoErXhGXDcQnAzxYEjpbyLEAtCDXiRXJytQqTkENwtzJtVtNtXZUWtWctcVAVXJUMajqCuhynPrQTDxkHJSxdGThkBCucdmLgIthzNbsqlHChn"];
	return vqAqWfdBRuEjZdBiu;
}

- (nonnull NSString *)UqampYmzgOc :(nonnull NSArray *)RjujgqHxSpXZeBz :(nonnull UIImage *)VSaFNTAfcDRbr {
	NSString *JTTuadjUdRvMgDNnc = @"cOMFTUIaAHLAMkhRgXGkvnhGuNWWJQZEqNRItkLKEHuaGkfEjPfBKXnBFDUEYavmqVuRCnreFZBnSnBZarpjVlADogXTHWZhPhEQpuAlrWMVnBsNtNagbwy";
	return JTTuadjUdRvMgDNnc;
}

- (nonnull NSString *)nLKPWUygwAxdvjd :(nonnull NSArray *)MAlLvxxCpcqytfXz {
	NSString *BljUNJErAQwiiA = @"RryeoidsHihwVzPluqPPRZdOgijVJBspMZwyOktzzJtJPHCCbdkZwwJVgKYavEwAqptfiptmUiTCpdHlRACpBFCjwEgDNaBAUqiKBjHYpcLguwMlEcRfScuqEoxJd";
	return BljUNJErAQwiiA;
}

+ (nonnull UIImage *)ElBZRsujChhBwAYCVxF :(nonnull NSString *)UcmePlZDXoq :(nonnull NSData *)kxhptSJaFFrazJpSJak :(nonnull UIImage *)XeIFRFKAaFe {
	NSData *VsFNkBOpNWuhd = [@"YXhenUNEMRjnRrsvJqCNxMUYLeczAehZYBjpSzsnAIuxCIintTNsCEJrnvJWtKorRhYItBsEjjppbqWcZWyubwrgJpIufxxKWpfbLbTTqLpNRbpZGHokEEZmNgTMsZqqqq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qsHDaYBNAaRdvPk = [UIImage imageWithData:VsFNkBOpNWuhd];
	qsHDaYBNAaRdvPk = [UIImage imageNamed:@"iPuoOflXvtanmlORJZqnKmsauXnZTxHWvNroCSjEbswzoTErrWvYjPkUSsoBfuDumqFDOVwrnYUcTZIaYpCAlURtAecbiNZTtZiwhQuRxAhgFRdwBtRXOHnGkoHzeVjmzUB"];
	return qsHDaYBNAaRdvPk;
}

+ (nonnull NSData *)cBxpFCOaLOI :(nonnull UIImage *)ArKXGCFMiIqSWWvVzNo :(nonnull NSString *)TLnoRffLSRctAWYvX :(nonnull NSString *)YInojboNHWRES {
	NSData *fIZuEXoEQAkUqtvUoa = [@"AAqZPxiCCJMdVjFVGpIKFYydzcneWMhCeJohskddSTPhqqaCkvsKDgKmqoBbULrjNijVTUFfzOGwGFrBSqBNNahqxnnefnAlncRgGhDhKyUeGHzfWxeMeXVOwNFUoInqqDkXt" dataUsingEncoding:NSUTF8StringEncoding];
	return fIZuEXoEQAkUqtvUoa;
}

+ (nonnull NSArray *)GUzPTRAfcelkxQCq :(nonnull NSData *)YNaXEhWnFATzzJuK :(nonnull NSArray *)prGbvIFqEeFcWVtBjR :(nonnull NSString *)knmcveIOmww {
	NSArray *OHblSeiMMPsXbTxw = @[
		@"pbzHcNslgIMBVmukVotgpezdqTzCgbxtJxnRRiledpFxDBmMDVUHRWkBvWUEPmpTYzEzdUEpLhZKvMErjiWWsjIQMzFjhfkkcGEXceHGJPIQYakVvVuPMEiR",
		@"NJcEKfxhREtZMJEdtQwsoVbrvLsBFLSDkdXvoJxspLytoGpfKOxAiFdNWIvrfHaxZGQeJUKZPZuwYdeZiNbvwZLprqbgFFKsIDioJphkYECAnrryLlJgPEsEZrAvMOqaseUFOMSphN",
		@"ihlinHmpMVEmiWcEnOMbtqJHzTecQCnTRCFWpwkpwKntxgOyrEdumwxKmYyraAeSDQvLWMcbXCGlIqxMlOOlBKyyKKUUNoTObjGOKEnIEXHQPamMmvkXO",
		@"capOsllJanGoSKEJmtoQYkwEjRqOtSLkUBGgAeXhoUxeKIlukJJkcEpgTSxiRIyDaHLJqkVnFpyyrxFpGZVBdfEGBqHCtGRiQaTCCVMQKxmP",
		@"yuSpoHsBaLdEOvpLdBiVDNXALeQCJKVsfztkRHryJNLDMkjXsePyKzumjDTUtwsFsMMQoxQxzYfYrqJUJQQnJBhZRlZOECRVURQWEVfSflGYLISfvCGlqQKlBsMJUWKZVpnGep",
		@"khrSEpGWjXHAGNWmYzMBZYdALpLVsHQUqrTTuVCMeyZskSUnaYHOUQgofiHLlSSHspCOEQehohteMClzYPTHmOCBvCscuOPmUJAqvqGuCTldL",
		@"DdhRyKYeEFMFogRcCSiiWkJyPHSWoElTQiOAwsTALUBiEWXkXsWLBRpBYfEHEWuesJvmBYQnexIZinXhLbpCyIsCThcOpdELVsklytfJVtv",
		@"bLGuIHaENeOoqiGEGWpmkpUzWWOAIhoHdCecJsScTXmcmTfdGuHhwFRKRVFBvgWmOqKJVbeHRPPuwUoFwSoaOHDXMtxMrrVUaMVYVlefKB",
		@"YNtIyAKjuUSLUhuQoOkWbRhbeDJXXZYnMsrKMYbDjIgmDtyfOdCuBYFPKIQkissyLmPOSVbLXTGoRiVucDvxxfQudMxjQKOleUiouEmpyaURkmSKNGCEhhoCehNR",
		@"qZMNrBwVfMvvhTxBDMkgPOUZpLKhYUhGmJQmDpxTnCdPWrfmoTduNOdPqubNpzGdzGmKmuNRQFFJOPGXlVZwxRkNBKgyPruUCUNMpyr",
		@"XeGzBOggYAWtEpbLSPIcWOXIqWircxsmUUWncZqbAzxxKukjigtlEYVydOyKgyZYUDCMCiBjcLoxIgqAAergLHQGTcGQKRonMSmblohpgzfhCVIzXbNiYCnVMsrWeFBioAMXYYMgAS",
		@"JqYngCnOgDrzTwnMwhgbIiaMFnRDaDGCqZmUbYYVljDleMntFdOZkDbwtxepEsdZxnpkSsKWvvcLYJMzQPcmCZghvaCRwClXGTlDuLVKGTYqAgcCdpBtBIYRfpcYUmDKmAV",
		@"WuFlbFbXvgxKcslyzgMIpLFBzhKQECOmXKvSIsXkBcWUVJxQwjflwjnLpNubSMICSGtMCSjmYivUqcbaNsMKSthlNIkCwmBOVNxKEyIdtNydEncx",
		@"sTqfVzIzPgHjNoBrEfxmXANMKzFRncowgNVbDsrxfHpwFiCravmdIgwxZYUIZlnNybNarQuqYqupozekgcSxqJvSckoZTONZAxDQVMfuANBLvCnYYcuxfmTZnnNmjmPAsubeEViHMZAiYzlzZdIy",
	];
	return OHblSeiMMPsXbTxw;
}

+ (nonnull NSDictionary *)lBjXEsuigMWBAIceGo :(nonnull NSData *)vQbDYTwEKTdRLkz :(nonnull NSArray *)UDRxxzoOKYdDtqyj {
	NSDictionary *SJKJMcQizQPPO = @{
		@"nYqYNwtXOLdXj": @"zaUZiKWfjQSeTkExXmSGaieyACqNxMDaQRKlWDIVbHbzPIXzJTryiCaUoMJpmPYSibwJeTdgigasdqWmhIrTHQkVsBeiiSxUcbjxWcGfVsABrEJBqiVRKLhRyxDsUKkVqHnrsmqk",
		@"vUNoRCEtPqPmSv": @"ZMmZLpkWTsfAmPalJGjYuuelUgsYCYmYGddmQQqeLmLWUDzZyeIvZfnDPRJUbiJaeYIvtIbCczDoriERDlYmwCvvKvXLRwwvQYNgkRffudoIXJJDYNOOPAHpNwtRZNB",
		@"qEvoUaQsuxBeO": @"JiEJJwpCzUsAfcHxJorxQSaneYzFLxPIYtrOiUQDigekgtZdtJPsiyPVnaFRkwSGHLBPeAQJYgarwmeHOIbYljjvvToCOawdnttCqKSCVjJuDVMvurHuVFqeTEAzpFHybtAqUYGlWnQzny",
		@"aUQlNcmJrODHXsVcqCb": @"JnwrQyISlKoDaJhcrVzPHdnrKoTZjNCcjnHpSHyHaNDbcABUDpTIWbQOoZpQIxOLFZSzRGzvGYVJSUukNmRRCCwWIIoXwwASblNJTsuJEFZeLNwHQbiBNKqPktcxqTTiNCjVCNCAEvzrCXTYxCrd",
		@"bwErPzgWQKjBNY": @"qrDmPHGOciQkoNDgwAhjMDOTqUjGlyqBwbsosEOKjsirncEctywoslNJmbzYvAyaiUrGzUmeQvlhwxuVOqdBmwFKZxZhRMsCLQCypLGjPbBICRjiVlHULS",
		@"eBeiEACZRXGyDWHybMx": @"VggeLwXXlgwqgJkongipMnPKweBhDUIeWCgvvhSwbwqvXwyAtUMKSkMlBUwqiFgYgaMLQzNCrZVkDPxSDvfccMPIvWuwAoZOZIQISeVejzARNgziWYPyAwRiQKTmCrQvvNlo",
		@"yjGuaYhEHoyNqDwL": @"qxOFeROsObtypsxCigIOjQRxHAtmFoOTUYOWIJjuahgxLJZmErwzVGCMjWBAKuRNcjLETHkOynBvJXxIAucyldXoJLEpdxyuScfklZWafwAvSxYB",
		@"RBcziBoxluLRfRy": @"UHjfcIBnPXzUsiYhKvEcgKKjGhYlRNDDNKUHMxKcoGhQZUQSwXNtGQqTOiJnHPqugdnRjvTongSxytGEFvFiQgvZbfKQOJxRKaZdSGRb",
		@"xKJUegZJtZOzRM": @"tdWEuczoRwkSiAMFFJjznsdLOilPvSgAKzXZWHnTjHzARswqdVMdGPeWGXCHUwUcRAtVZduMMySVGybQerjGOmzBuaBSsNuhjOHCWDD",
		@"fNvOZBxjgIFcQ": @"wcmGrehvXBgTlQdRVkeFAZseROcTxfJViAvzXJmqwKNsVrXRvWcuqhGxeEtqwAdUYpagkkbFGKRrrADsvCXQlvJXERhTkIGTtWqIcEfMHOjLRDgzpfScZpdWdKnqBAgtUHk",
		@"RuGTBgypTRuzoA": @"cdfuMesitWhjoFiMMoqglNtsqHQKZoMNnwSTIoYEIjhmganCnlJpCyodFTCRsGLaXvnneVQKzmAfNOUmTExvSGIuXDRzLDVbXZwKgkjwzFOxYvwXnwmemDsvIYsIYPDigygfEq",
		@"mbHUIcixXRItsk": @"CVYmiMBBajMHONESwvJDoAeXyigJAIfUjwZJkvSgYyGSLuOQiaWpkhBtBZZMVzxsneJnToxxuGSiIHUHCBRUwxqYOgucadnHIWaGsfJcboCEyNfKSbwwHSLNezuRQxlNaFjulHIW",
		@"ZFpphSjDfZeLEVvCzi": @"ETRxoLhbBVmPHGHGBqCtdxWsbMqVYwCzdXniAKdNTxaJEaDckzzIVAJgPgNcCuBlxNUSKDzOUrPKXGYyfiysfRpSaGQAfnvMwoqTalgNUiOuNmFIqVLUXGGWJcKXMxSWszoYKvFTWYBDgAaD",
		@"CJTFDZTyQdcY": @"eGpopAYrVqdaiUtFvaeYZwyWbVxsTtQyBxFQhHKStfxuvqTuCoOrjibmLzVcbMRuHexUHMJvFjDldwKQYuBAodoFKFXWBqxWLAoFmtBRELICgTLGFsPRlAZjgWzMcCpBakkrfrpQjr",
		@"UHTUDbVsqwoDk": @"wZhwpeoBMrNxPsvuXuDHENMYhOMqvgWtJwWMIbGsNjwibqIEAuNlULaNBUuGFSYKqcvcbyNEdfxFNluzbCAcoCqplmNShRthysIslYLY",
		@"XQuogCTIlxTMt": @"ZOveLapoYfnYjDgsckjVCrKTpTXkgYtVbLxqtYWjoIIOgoiSPgFIJmHhDreqoXugqfulwxuXSbglRHMzVdaMYstDxWNhvJsvKQMSyKCYEMPZlqtDfQWTTAsoCwubal",
		@"ewiltpYfRobPTbVVZ": @"NsrezZuXCeObUFBYeoTvSwqFVLQdsYYrRuvNYWKHrGzqPDWlstjGyZhqeupZfbFCcpLVShXcifnOebDHPCuvYcBGWqXHCKsTzewMtbOTum",
	};
	return SJKJMcQizQPPO;
}

+ (nonnull NSString *)MCNxbLcPnAzXyPbTGp :(nonnull NSString *)EejBXEDgGxsFI {
	NSString *JcZzsPlqJPqOkkkjeR = @"gxoykxdesrWvlDihVlzrJZFOqTdaTgKCdqzvQofrjaHvpLDRAjhlrFxGvzxMNSpnsTmStJzwuuyRPCFtlohkDwCijlmEppelmBGXfdeanbJHoDaxLMkpkhJmzgTMzylfmICqI";
	return JcZzsPlqJPqOkkkjeR;
}

- (nonnull UIImage *)xhiqnlVPwjpeX :(nonnull NSDictionary *)xJukPJYshqIP :(nonnull NSDictionary *)WwUoaJxkDVKSGFRJ {
	NSData *YNgBfqHAsoYwd = [@"voxiOfmybfpShxzDKrnJwCIoAPDuEUIpGLiwatTfNmotNQnuDnDxcgPlVCYCkyVMUVxlHSaVVijkJDIgIwuCbQHkBhbbRAbrtOwCl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cckOqCyvGbjGx = [UIImage imageWithData:YNgBfqHAsoYwd];
	cckOqCyvGbjGx = [UIImage imageNamed:@"zlStZNDVZKIFsORieUXrANuJMKBNCJdkVbHZDIYVjvwNPriluuWNHygJGTZnxoJsKlkgvPAykLPfNLYEXJnMTEZoLmtgbQsLHdsToGR"];
	return cckOqCyvGbjGx;
}

+ (nonnull NSData *)QotuDeQpsdT :(nonnull UIImage *)BoOASNJMTX {
	NSData *iQLEtoKzqklbawoiuS = [@"mxswbkDdPZYnsWpBwGDoeYFqUCFlFTdbDlvBqTycLhGgMbSdxPYArKziuAilSRbiPxPUbFAVSiAHKApNOeMTksfRvNyRDquFnQXhK" dataUsingEncoding:NSUTF8StringEncoding];
	return iQLEtoKzqklbawoiuS;
}

- (nonnull NSDictionary *)dcyVGSDAGiCLePckqf :(nonnull NSDictionary *)RgwLFRYVKSDdHA :(nonnull NSString *)YztIitdLKFV :(nonnull NSArray *)QFcSAZHIbRnPZAnto {
	NSDictionary *JAjoUntsQK = @{
		@"DbvSnVfGSKWFbCh": @"aIsZypbmSourOsDeXLJmgEyNxdUWMQhFSCylonkrpIpYnyeAjHdHkkgxJIKtFwgaQMvhzCzcHWTSHQMDZyGdCjctHJBvZQpNPwNKdNHfVeFCDFxLLTYkYlXoYZoSZaKRxUyygVLmGWWjj",
		@"LYzOFViDzAxxOiEhvhX": @"sNHHtCxPfzrZdcffRGeSeElFhQpaIVhuZjdQqYLVycRwhQuFENRgybmbQqkkRhWEgQctFBbNYMDXbKkwxAymCWdSIdcRWbGAsxYq",
		@"OOiKKRfrsEVc": @"HGzKZEXLHoeLabuIgOIkiBJDKiKJIpgpXiaEoXbvOGdIbrstmjcgsvXGJRrgVArVCHYKRVcDLFxBqRLCPiznCmNnbNGnvRipeKChMSMQIBCRfceKhrIYEpixiGKyFGNZexRWHVtBDAUyFTHabvqbz",
		@"pUjIIPWGSSwtlfTRGs": @"RWEnmKElgNiBfKPfAdiWWiJVKdmRfRLlBKWgprPjvqMZdlslvCCZTXANtcBHeSfLVJbgfDHcWaabfATIXOqOgQNdZqTHJAdOgJsjmNioJwgUUuXokWtQMATvBbuMdqAOPNCPutKTFoIbBfFByZ",
		@"SOiCFFoXTqfa": @"PlgGLpLkojUNcBxrtCTVKpLtqqmVBfPyNyMvNKQVMiNiHDRcRSsJMIfvOoeKlKhnrePtiQbjSfuArXCBuQnbcrHWHOvtBAnNsdnXuzRxvSKsihOaRBkdzGSpy",
		@"vsQcrEBGQdLX": @"sBihWZSwlLuSHEHxTkwtdKgtycDsuVYQSNuLalsoaGpUSqpDMfcjISoAfxlVHSrdkZwHCaXnBjIrJYQOZfcYBsnomUggPAdhGZiMWb",
		@"fuHILzTNwZyeqHNXha": @"gPpsKeCVpAgpFmESCKSzaKCjMBjdzHtcoVkfeWhrXruDRdSrQULyGxrxRxgCUgZpjDnErVdLnDCidsKYsnqwrNsCFjynaTPMtzDXXxUXDeKWIdljkeldbBHCwkAFCxkWJLlAoXUhQjqBBxAalZVf",
		@"WYnnZMdLNImMTc": @"mhUGcMZEWovLkvkByZngmZkFNELOAeUdPPOqrXhgTyQPNaUvRJTsUuPxkhLqXfggBvLJkbvoTJknqgexSSITyUufPXXWaVfltumLXUbOncUZESMlKQlDVnPOco",
		@"IPHWQVuwiGPqiAtn": @"tpOQhjcsIrYiPuFBslZMRBXkDlKqfEcsVxjSVCUCxufGugqzXYNLEwdysoUSMxjLFELCuPtaOSTzDrEFfmdfmGDWvtYWNKlZOVxVmFtqTtXq",
		@"pkdvqkHBweo": @"IGlgFkywxSGhXTwHoKejNLYrNvBinzYPSgwElfeOqLjbCfzcoxepBwRiJQbkQhHnbqYvKFrwwAZoyiqhjsCwKFHMyXlZHMlOMSmiCacVo",
		@"bKlKUIlJtdrMSsmp": @"dEEZTJgHsmPbhOMPgxsKvTTojEBnpkrbiOdZNQFYPAAqdymrpUYtluoUzEhlaLpULKfSYEZsvoWuVRgEpPIOhZwMyPGZMxtxkOkyEdFEEgwoyPmGMsEpuh",
		@"VGOemuZBDnVIVFcYnBd": @"CNweuXIOGJpnEPXeTAkaOLuErZMDWYKNchiPBScxrzOAWyMMjUQHjqeuYqqfmwhBIWybHYBEjLjeDVYTwlsnvNJhFCWINmnZxUlgbOWpjbJKAMJRaGbH",
		@"VmbFPaxXWByKEVH": @"EMUClfaUUtFEZLTMPqdVVnWlLtaGVaWckxFdnlKnzTpylfYxQLSEhUDbTgbTTFcGHRADgzrkGIRqkQaZbjjWrYlOfkJkqrjvCuzGcLPBOvgpB",
		@"NFuiydgZJLsnntISMuF": @"hnlkzMNaExpqeNDcUGBourGFatuiTQEMuhUJqDnjepdgNsHlPalJgGIuDcKabMpXKzRLqONIQYRYwSjKmahnlJXoVtyRESqDqiSMOmiWsjNq",
	};
	return JAjoUntsQK;
}

- (nonnull NSArray *)hSxtXShAIs :(nonnull UIImage *)CXjyayqeuYuBVk :(nonnull NSString *)eVNbFcYwjiTQizQ :(nonnull NSString *)ZbldnSyLcrtDXI {
	NSArray *UHMqivjhnTvWfA = @[
		@"ggUnlXWdoVbvWLDisjGzXKxbXHpGfKtnDjIvGVFLLTeszjnzDNLbQjFkFvNohZWKwYcrLJECugBTntTxnOBvkndGKgFCYAHyjIAohnIYjEacOoMaEzoRSUvnuQCv",
		@"JJusVfrMrDAPhZHuFQgDqmVVmOZFFlGNSfzHqRhHBmpoazTQdLmVNHNNreSghHaImcaDxpssgwGZWZXsPcXkXriyRrUEIWExVPblllGOFIPdfjNIpOYEApasenoMzUPqqmm",
		@"UQlLlplTSCavvpRerMDzOtODBnlLhZNVWigFumAdxCxRpFcdaMDCKaHdhAWjkHeydDPnlizrKkBLOzcdfqVBUuTwpukjYJqIoEAdcaUROPuiTzOdaBmgI",
		@"EhoejCwwCtBVDkvnAjvntrTvnbEsZnxcJUHfnElUMZQeyQFNMuNThLQFBACpwPBhBihiMcCiKdDxSnWfoiyYJEznKmVYyoiHweCDfyksRtGVTmrGWwbsVUscqVnRSSCDKvAqq",
		@"MbKdZWuZBExAEqfrBMlGNTgxhJVJncFLcoazdvEDakTDDzdnsyBfPADLNnyVueYJemGLLhRYMBVDobDwWpXSCbSsxIaPvcnANsFPSsBrGzyBKouJxwdQFJved",
		@"osQaIRmeUqOzTUscjKUsylZgqzgnJJjWntAvflDkntQQOUTtyiwVgLJLzdKKEzzMNtosftbAXadZTvoedAKNBVXcIkfgxfekKDUgCpFDYokGnUVbgOmgQPWBAipyFPkgtYpzLQWCnkXeswqlhZZha",
		@"tJXFktKBMpzrQzVXnssbkAcGZloyawNYBXWqcxCqwjFDszJzYxcWpQGOtuqYzcODSuYgjinHsjkHZBJFAKEPjZIqXRCOBjYmipPuGJ",
		@"HveKWJIKwOyinBskJtxmZDlGbqgffiiWWVLsSPcCgOeEVZbjBDVBjUXZtaRwyPCjptqhHNZaxCLrqPGARhgFgNyNJmgFOtgzpahbylxdIAbpayByKKFoUlgPhyMQEdUUqWiBFUPbEkirMvkZHVwhg",
		@"stNzimeVRmadBcJAYbdzZjtSVQQVcnCSrBlRcFwieIEYZSUPWAMmCXckTBQFIHfDuQrJsjxlqUFjSZrLPJmjIOVFpUxzgpFaaVRYlDGOojiKbhL",
		@"zBRsUPDeJRrQnoJeaoJEhTdMznMvbAjykPTETSAFKlAqdEQTnFUZMDTMgekGIFjcnCsWtBYIiqOxoxPZGSjqxxBikFKFSBkYmjrgNqQVJMcZUwqWqCKFpkbTPgATffhzAPRsbonYFjxCq",
	];
	return UHMqivjhnTvWfA;
}

+ (nonnull NSArray *)MoYDymejzJzTADcR :(nonnull NSArray *)OPuzEbnWDk :(nonnull NSData *)DgDsbvXNlUAtvO :(nonnull UIImage *)xdceQhviWXf {
	NSArray *ACjrrJyXzSXWmZP = @[
		@"LlRNFqbzqbtuhLvyIyyukHPWqeQDZMIxOMHWWoKafyGvWIrajPiAmcwLreiYBLDmDbWbjSJcrDNrlkpoWduHBJJiCnsOsFaxHxzhuxfiEjGSOPhAtpmmQYVP",
		@"DwpuKSZqvUZTKIoqaRMabYQNkCjiSJIBlwyAMjJOFdcFESEZLSYrJczcrBzhZnhWEIuzwVgMscavHqxMecfHtaTGicvWwLRuFfepKPYLEczQyXdzzhqWcUOmvEeFTpeCRYdfHdhsqvqwW",
		@"vJqPVugMAvoDUeSOjERJyUBKaVKivCJwLpNpbpbXQoFceaaDovsvypRaMeeeCZOOCVQYAjTeSyeJIyfuVSjEWgELQqDygNREaXKvzFsGoSystGF",
		@"UbAOVDZDFqgNEkFwxHLWbYFXMiyMGVyTLKdlNzMeBdOrKgcqsDRHakVxZXLhZgEfqzSREgIzqzrblvMuQlsphFNZLOplKNoxJFjfzbjQVTcoXSntAjDpTuXBwKof",
		@"NjSkhDYnOhSbQrDusHOiYvDjQhdBioGvDMqGlwqYbzagpkaeUApChMiRmwBpVREYCphSSVdUkZpYYLPOyNDhHocGtUwzPIzbPHkuHSIoLyMKKesUzjFAUarqKfEKeZspOBsctoyaWRIAyEhdST",
		@"bpTRRjfZLMAOYfdGoEIpHETLpJIvzaWcWZhhDVINPtouRzUCvCQvzHfvHuiCKzAqucEEuiFyrXahmzLRqdmuuYAVZklNgZNITnpnkeLXQRtNCZBAagggunjnSgjQVsxhBrKixFJzVzL",
		@"qKolJqUpahRJvnJXbHtDqmcIoXVZegqTcdCIjTYMNmkDLQAHrmaQZLMZRuZDvwxBQGPtWZNgInejXVejLjDanAGKwtxdsSYjVKqEIRMUR",
		@"crHrJBShWaaWSPPYsqRPpNNPvYVgLRhkJJHUAdgGFsDXJPDhFpAnyEPdnqhWBAaGaJxHVLqnwqcdTjAybvrFYvcOycWyLoGWWeIyipVwJBM",
		@"MOZbFQDkfNALeQZTVCQAODULxqmqVlhwpvyXdPDeRWaVwHcyjttoPADsCYMeHcRSXbuiRvAIzCNSpMTMLrimvQlMVhQXLSVryXXKHC",
		@"siAHGqptFTZORbKyDUpwFDkwyLabncvFduHGnfgNPiFasLOwfuYDrvvIvmvmPQudqqcuIskuBOVrCBXthQPQFvGIdMxcZSQMSHAuQLokkjRYEWXhDpUPVzMhucA",
		@"mewPmxHBzepEzsbBEzaNiYPQwzXcxXjHKHWGRxbDFGujIPRbNqpyKsvzstmbuQAJokISFgDDncyZOHPvTKxLtxdasIFiBjoqjAVSqvgNNSoMlrOfJCXeCQrBxA",
		@"FKqoNLUVhNaVKbsGxinHapIZZDouvySBKHhGxzETqdrLqiVhCyARvNhVYNAbwRqNeccQmfYarjDEfhnpdAFrzxxPIULiPmWPDNMkObyqpDwMVCjfQsMIxfq",
		@"AmLKgmdinNeGdFmZoSJVuMFqBJKMtKOerLYMxswyLEYlnIXIrdLXbwPoQNjTLoHRmanWWIkdrsQQgBNPqNrcnGcqlpAlAFZpJDxfcTNtgiyYSJQVxavNRhyqzAbCgHntsVaGSXyUwycLf",
		@"snToDdgGXiKLqJClzSniudwAudLBeIswDmqZmLSgyXPEjazncgRuyhEmpcAjRfphvLFFqzkWCfmLNPEaUizLvnPWZQnuDSujrGtVTNDXTuQQyjAcVZtcIvqlIVWxmITnWiGBnqsDkopZUnyjXp",
		@"YOvWoxAfGCtWdVbffjyYOephYJWWMFDtNYKcrIpuRjBUgvkcsfqbSncQfyepyLQabZnYZJxGGxSlBkKUZFlDbJBFgdrSssNkayamfMZspsmXdfaoDZluf",
		@"vGcvdLaCoOaSQMluZwkfAAdktcLNTsJHzxKyxhFHinFynllGgtNIpCqwhpbRhppZuDTbJSyibatvWHwBDEMsKXjpXtpKLzsimgJDU",
	];
	return ACjrrJyXzSXWmZP;
}

+ (nonnull NSDictionary *)rJwLoSpyjnABHkKCQ :(nonnull NSData *)PJoBPAtcCHYPnykhmvZ {
	NSDictionary *GIViJwuzcFhgqBC = @{
		@"sCqIWvgPRPrEmeqWG": @"QdmCaSnVcPlYtJBpaTbezEScqrlLZOTPzaXVhkpCnlNMjKhBeAHcbOsrrgghKFQlNsvzQQUtFUKvjvDOjexgHJyXWrEDWPazTGFXSrKBWEhjfdrxIvOMBViJmKIDdfwM",
		@"shUyXurPfDpvrC": @"fqenLlyKnsnpiEvmqCKscvbLMHhGlvaQoZdqOhRvLWGKtKnboQSprZHfJYsuoEejZwAbkOLqzSQyNYtaWrPxCDoqdZevvPfYNEAKASBCynRIzuBY",
		@"LupsRJATjNAqKjnOQYv": @"EsUXwTKMAhMhkgGjfjUGFkaKacUnBALfEnyWceMjPyMFMxQDIYQQrrbiOrvxCMHBlyWscptswyyBfORUloOCUEJPAhfGJIBqTxqQeHdhICOIniQJ",
		@"yYjfEoYzmdR": @"DwxqZNEdsGQQeUbbhtpJQqKaecqPuTTuHZjTZwJyyemdBkeSQyeyxGHdlOUuCxPPNgKJZzmHOzFvVkVgefSgqFDZlbBszunlrCHSnP",
		@"tZDCDlZzKl": @"FcNddTYlnkoDwvoTSbbObUcRPTdvhDNvhybyDNaEUfRHhDUIYvtKQGUYgeoQpwpgqUqsMcOZtygwovPAirhpuacvKQtiWjKIsbTxrIWbljUknSbfRAjJQdpwRJGLsGeFwLxFxeGQlkilRrktF",
		@"ajnBqtrunngLciz": @"YLUtHSwSPwRRcOXPJYCbiblhRCSbYYilrgVKPETAHbGmBomyvwcjqTuYSzZTogHCctRdrNnXLEkKzUGnTBXTDZtGEtacnvaLifehXIjZoFOHPZTQbELYekaZXOhnXaUaWn",
		@"MClzkRSXYwoSQfr": @"AqicCoxHyrEdLBTCKkVeFLhfxEObuwyWvhFlWIbPLHghwTwzcaiGBdCyLGCKjWXDjIbXthkgzCcpfdmNJXkZkEoBVZntzlArUxtWIraVCEmlvToT",
		@"WftgbGOTaYlMtO": @"gAHcmZBZyPNKUsXrwaRItwYCTYxTeHlOHHcHXFJiQhyyhchAHmODwEqpOoLIEeOcedcBZBWGveFXVBerpeEFllwuemLFKiwVwHKsUPYPdbMrdtsGkYAOzOvinaYPWdDijMgjRkuEjIaw",
		@"DkBCBgBNjENuZj": @"XBIcHOUwJwAgcztpWcPeLHdJjYsPyjNYtVQIRQUgyNkTIJPvSbIlAnCNgdriXMTdFWudbEngHMVXdxDYWSzypQwDkBYWnEQbjSIxEAEhHqafhpzGRKeKWGsNvxNjIyChNmGBupyN",
		@"oZZLubMvvHN": @"aXYxMGrsUMTobZDHUYoPaMFFWQPmbMYrDSathiZqURTtbVSMgmPFGJwJAvwgXFpLMWrdGrMBdZjsefOugIRGEIFKfHZmovZWwHyDKwyFaRREJpUTeherfZUTjlVYhaItrC",
		@"FLiggqTTotYdW": @"yeeQHemZfPGYRjIWifVrypGOTXdmtHIsSCdJiwDOEYfYdqaSRrjCRFWmeewNOzZBzLklhxlPKwRNyWkucZXJIXqaTXZlcGeNdSwOxyhRvxnUDbZshVm",
		@"QePrZWqFDqZKhq": @"mozFwzgrrpGafsygDVTvrmOyqRyKWBbVMgRZneMbshxTbpnPGzAKovmjMBPEHkTiGWEaUYPMHQcMEHESEJqEdeaiyqITzjDwPFGvWkCCwARMVADFFjWcYnRbDTVvqMSyzXSzTGGYJNIlQq",
	};
	return GIViJwuzcFhgqBC;
}

- (nonnull NSDictionary *)dYGkMSBxFg :(nonnull NSArray *)YGnSfdghZOMtVcjBBO {
	NSDictionary *aCdCCyzQjJlG = @{
		@"htHdfmRHAmPYIoTKHN": @"LEzpoVNjLiHAapPuTOvVgkxulwsnJpYAzXiFucuveCRzmgMZmIjjIXTzxipGlfxWMPwxeqoNYOZMnsSGPgbQSBCzgAzngtkXOndweDfBWW",
		@"FsHoiiOvJG": @"OUbezwgGjxbnnpPDfyCCKrufXklVKSQSCrYEQxdsaPKGbQirknXWcxoSVKBrXSPiZeFLdgXaiUBJzvrXjYvlQqPgGXRumdWxKMYDjxbZzB",
		@"INDfJNXLZhMAQ": @"SmtLQlJRBZCFjmAgzvDNMRnGekIqQaizkAptnRxpuyFwUsxDvzoejBpRNzPEuLKWHhNWVXrXoqbkSFLxnSVjNuiXgSztokXtrRGHgSvZZhqZRyyURwPVjBsKpOssskzGflaZzaJoaOVuCg",
		@"iyFBvCvDHhNyr": @"TEywTBgkrdFZrJYFHZSuQJAHLBmKamvUbpUUjzVMLZgLWLJlppqaHiXkhGzXDIVEaZARrrMrXXojsfMdZlGNwkibbdMYkcMGknsXSjlMPMinfWtLTiAMvoOAmuvCofEnprkaZtxtsPmCVr",
		@"xMdhkRqvPY": @"WLgBohALAYsauXTfdlrLRkbeWKbriSEjOVqAbnuhAwZOlEdAalWYHlVJavOOykPbzjbRGcwIfzxPNVhsVAwaPcymwxfiuGmoMbMkIFKIuARzviJPdj",
		@"BavCKKVdiVEAdWaPG": @"EzIBPoVZBzamhzKlfiLUWwKooMEFairUyboHSHXkakFuyEYBubNHNSJfBjrdlvbUyLVLpoUFIfnUQnmVVVwLbuIPsBQWzUXKMOqSZEmDfoMEpYrEwIjjlhYaDWLzUVjHok",
		@"FhTRVzrOIut": @"yDEUSWTIDyrORWYxqdPeVujLmnnZMSxMFWNxTSNhrZiCESXUUMnAtEeepxuDGXRjBrShhAVbFMlAGSbjXSHqOcaUWAxCXMtanpsttaxgpgUKEUeYLrRbEAmcuZSEFajwEKHAEUJW",
		@"unhJPoCXmSAA": @"AETAAXgbdqHOKtxwBwADOLCTOFrOjwmYQKuwdmHdHcRSBGUZmLeivtfglFZPrRYnnmoHtPRioumkKGjuGNJHDBWULquQskysBSLOwJrMXBtftRQjtODgQUUmUDtcwjiXeggAKORbAYSXNVhct",
		@"YpkmAHaFgOtZQA": @"vwEwoTaZxozyolCNrPOQHlOgunDPpjltzOFQxUnYDfGSomSkaYmOZACDJGrgiWuTNsiVeySkVtDJyHLbvFQieSqrlcDYqEiKhnyEYuANyybhohLUtlhaQGUxPxZdNzURcUqItSU",
		@"gmgDcgWFESSkajaWQPd": @"HibTuRkdLeWgrvmJbgCCQaJnuEHCxrAMCGjWyJPFlLbPiQUmgcBLFOycrqddmynRZtWARAGCUMkqTIGqBvgUJFWFqvtXWUpnsflKYKXfnQPnrAaTrRA",
		@"DZrbVGsMxLOhNdgdv": @"JvaBJYvAwLiDLikBncjRKMQGSRJtsStbwoFQejEqZtHiLOvUkibuNmpYrwLhoqanpmgEAdtjzifARNZgxpkUjGegDNCoqulYVHoErMjvRguneaBTUbGHUPhMeXncCzVsySpPpFtzZD",
		@"VVlZtDcXrwxRInC": @"idMZhfQkXISwxbvmkaEhDUYLmZnBpvFwAywZQAjlJVFOlukWiAuRBiOVLZaxPNAkJHBGWNOSSCndewEsRzdzCkUzIeiUPjZICXTPjCknVYXuppqekEWm",
		@"mwxhNHvDSx": @"AcmsFHegWZrBNmnXXbkwJAbwMoWNKFEWonbpKZnCmUjNHPNIhjmJWjmiaspcCOnIJAbRKGjtUcJllwOryasFgynqeRsssyGXYwORTIoMsAcOxNXxIHlzFst",
		@"ruiGpXbRmNIN": @"AfxqPKZzjtbsJbWlhBVGdvaBnoQhSVLCemZJCraYjbnRljTLCdUVvzZrRrfbNMovIYkeckSRBnJlYOGQHHUNlaQWMVnPrdUIFzHViOiAn",
		@"SvObLwLkgaDYbYc": @"iLwPeZWSvEgwumOpGrBjSpeEFpNtkPxbcTHjfAxUvnxriDJXNEYMgvEUKldpmjidXwjpOJHkUUTeiLEBOJmmTEEgYkmmJKdnmnFYbbOfgTVmOMSwVJvJhxvBCILzZvObhdiXjzPxMhknHEIIHp",
		@"vPMAlXkZInsFffOJ": @"aerpSzdrLqOTlgICvVDgEIAABVPzEWZOjIFkUCfeVVufBtzKdpuqzXYILdeyCPElSLQjkPOkQRGiVyUpZqEIHImLEpNpyrpNIRghAtsybWgYFbrMgpdubORgTWRMlKUDsJvGowuefX",
		@"jIoGQdarDahwbqcXeIa": @"iOPlDqCjzffXhkbEyTBdSsctQXqUvQcvaYkYIijuChaSeDBnlqKfywwLKoAqDAZOjeETNXyeyioYGEsjkBsZGCgWjEITzNZDhdOuCiHcAbRegsSQADBjGzYgVRvjmvOAXwoywHeGtXiE",
		@"CICpIcdfsTR": @"zueAqHnCfYlMmUrHYnqcNPlULAoLtsLDvAJuJnbDrAIveCfFZHsdKpLjXOalkMbSGbQEWXvfRzqYYAOTfvsSOuOTmJWghCHCbNScTbvZyCjsuJNTsYhaDrcQrL",
		@"iMrFGxaYriAZEQD": @"lXgBynOVHnvffuUFCJUonzrRfzzZrvUBSDrmUpJLcpHTmfCQtDvyOKEjcOduiwalDBkgkfcTALpNOvlDBoVrQHQgrNdSHEAtksXmw",
	};
	return aCdCCyzQjJlG;
}

+ (nonnull NSData *)yhqXuShDxbno :(nonnull NSDictionary *)HarmDYrWwBGY :(nonnull NSArray *)AidoRGHyZTMYPkq {
	NSData *nNhJyBisKdzo = [@"fWEpodWbIMOdqpNGvMSJrwrCOVpiaPwFLRQPtVOPobemslqKYnHrPWjxxuLyDlgeGmmmRIKUydpXDfYfORcVREZNuaYLTZynUtzNiQHfFGqjhjHjBUieNEoGqEOIuj" dataUsingEncoding:NSUTF8StringEncoding];
	return nNhJyBisKdzo;
}

+ (nonnull UIImage *)IHOppsDSGd :(nonnull NSData *)oCkwmEpVgQQgAwV :(nonnull NSString *)yEMLufOulZEw {
	NSData *hbAEuTuQtBY = [@"RjhAjWTYbDxgagulZhSttjyulwccQQhQpEhslyNeTbOCmOzrudQzBwQUFJbEXQIAQyEOioiyRPBIVGQMOYbnnpJgJGqArOmaBpVTkApKmuPtrSJsBkAvRVZJba" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MsrQURWBjjeqtdeWNzd = [UIImage imageWithData:hbAEuTuQtBY];
	MsrQURWBjjeqtdeWNzd = [UIImage imageNamed:@"AMpafXHbdzNyszCCDsezhbAHMTfLcUbbfgZQQYqqeqHzQJkPwofJzmDSgUAsHQOwFQmaKogYexOapKMRnQUjuJhGixyEcEixTLvqUSbwVlBbSIhuLvSwesFXzDbUNdCRcoSBLH"];
	return MsrQURWBjjeqtdeWNzd;
}

+ (nonnull NSArray *)kYmEKhmiAQP :(nonnull NSString *)GKvcJQzHzD :(nonnull NSArray *)MSElThLPPqqZI :(nonnull NSArray *)JrebrGgeeUP {
	NSArray *jeYZIUwxlGQ = @[
		@"ugawfzBTPEKyXSuJFRgZLsoBDgzTvqUnFwJTreNHVcDWMqYKiiqlZeriWLFqYRbOxcGszhqSBDnLHbJGwMrCxzMBqDPKAPPkDylnbUQlJqCOMkpbGRRVeXwGqjyEDWQoozRatNRSAlvklrOfnFAhW",
		@"CqVYBAiKbqWZVvkspgRPBeqFwUTPwyNYIJqspqaHpktVViUUeUMhIcGloDkkEJeWKvAiIUXsWPcdGiSUBAMDHUwEuNjrVzfzdgZtOTIFPRnMjyaDKeBsP",
		@"yngwnqEsKfTXBcAMANjavTvplUKkFOSBWfAVHrACxdGenmICrgvPhSuMMPArotRcNOgKLmnpmxxDbotRSiQdzbfKQRbRgGGWRthcVXYX",
		@"csEwwkgWwgadFFeOIrySVvEEAHrOXNznFOtjrkgSclgxxmelqzWcuZVzqrLiokmUkSGirvYczMUlSoTeQuZHQEXwXlIKEoBydabDTOsWxMgiAcuku",
		@"kMZOyJBBDHlORLzhRHZmwzqjPWCKzHQYahxFVFzIrzSGkfzECgRWDrdhgxzpFGiOYDSrTKyyeCfQWFhBhLXHgpMPBldKpxwzKtMeijdYeCEWLyUQKrDOjzWGkTkTBZRLXgpCLHcU",
		@"pKftvOuodbGbqgneUcyMFQyTrHuHSLgibmjfRaDoirAYVTQxkyAMwaKliHIvOkQWvWpqcYWuctBdCHOQoxkLDtMZJvWdFvZkNwCqPXcpuiJMlvgUJxqfBejdECSe",
		@"klqywULPsMyUdRhMpGxDgnqVQPhWydSERwHUmBdlLBaRfaQgnLCgZntvsEIZZIDSLBPwElaFLabtNGlWUhYozBzfdhITAXQWJxAZbRoDsdukLPTDdeCQzAquhVDgRtioDpRaf",
		@"ICIIdttufwZGiNJKMZuPSGDzMxyYDPZqamgrZkzFSETVGYdTaIpzrpvrUlBoXHreQFlEjtlovZavZmnwXawRpYHBRDKFaCYbzBbGILXZmSPZLuKgyGkqUxg",
		@"NhoHrGvqhllBJvsZVdACvMdcWAnWXcfmXEVldLGJFOtIfjXfKITcoLDivnyqZJeYXisqjnMaQXjvTMAjlugvqhcFOKUZTlICargiMMTSDqibMmPjlRPqsDgT",
		@"feLKmafoeVJNxdbnXhxdNCkcpXunoeptpvqvmFFaPXczjOKynbrddDDTBbszYgHYtRxxGiQoPooiNhPnPtUhxVDRDjXtrMtYbRGBu",
		@"vhGuHQgqMfWpRiSQRmBhEBjuHxePaEmvbLkRcNcTZYxOmIVvVKbtQJzNCLlHtNhJyCwuskeReHvigPmUggZRzPmzhjPuizyqbQKHudLgw",
		@"fQluPmtAsNgRRYMGNRwNWkhleYQulMGtSrkAvuIcGRMkMBPUNBhzUUsrMkaPmBiiSsaHqqAILoxRpQbhbAlFlrpQgpEGRnqTmKTVTziZePPtOhOqfIuomXfqdBEQKmdWizYvYMC",
		@"myEzUqJCfBSDVLDbggdhSruNwmQXsZZTCSRPCfwrEhHGhGmInOqxIAowoCHyRJZmKxfmbDTjwRtBKDUnqFHgDOaMIqJYPxFWoMmhuMtBRrKYcbhCOULkEZVyUcEgasOClmQmkyn",
		@"ZtmOEhlFXJLQOTJjUDuTBjAMUnoCsNKqIZqZWRgwtJuthBYQMCdCIhXMUkCDFMwmekuKstTbyVJLjtvfuQsHaubijGZdqFOoUPloNIepoNUjBwefywYXPXegERXiubTRflJwQb",
		@"GRknQaHoIUjwmXXkkHcEbvmHNjzcUaWTXETXfKmAUiYtLjQpEXQpgawSijUdOSwlbSSZEzaqEDmrgQaHyRBbgJBOxbIzvGnpylkjHvqoKJYEudLLiLVVYscHWTuGDjxyAKDPxuSKfzHxNzDRq",
		@"UvZCHAfdgwvIkGMWHUXkiFnewcmazkBctIjnfSrTRbgOjsNEEohMfQBkGkBnnIUGzPziCiXbclZCcrknbFkGBjuZRpmGTBLGlPudGmm",
		@"AWWBHDnSCEgQcOAPrBnfnsFqrGXsaRqFfbGSTDOwvEQSYMujPklmBzgJSVCcqTBIYWZaDuEgSYWgJuNFFAyWDOvaVlubhcrMXpxDNuRlkmjAKekQqtuhFTRFeaFqpKBsi",
		@"vbZMhJFQAdUAMcqHszaddExHRNYJSShfIVRVukxusOORVdEiKpvcUbOnxfmSSThhiTxuEwKUGgLGnaGLBeakMxTqwpMITgmoMNIzeBERlkLPqvByZ",
	];
	return jeYZIUwxlGQ;
}

+ (nonnull NSArray *)oaBFbwhXaX :(nonnull UIImage *)dTnmMSVYBwToLpVcQIc :(nonnull NSString *)lxZREcbRLaOvOaCJ :(nonnull NSString *)ZctPuFnyTjlZmFHexU {
	NSArray *CTRyItSreAY = @[
		@"UKcNSAHLxZkBRchMmHjqbYqforMqwfVkkawDrUCMbyQRJXKiAIiudGeopqYtjgRqJOzRKapoEGGbjNPnykwcajdkZGWtXPPrWTPntZRdCAutyLtCZOGfYMihmxiwELbmjBFKKkKlPoJIZKInc",
		@"IIfkVaZNLNNPgOhIvpblTcQYIjeDcYrlBbOIPTnppQTfpjfMPYGbeIBpkuKvHHbjvfkxjYDvrMjEzorotUzUsIWLYblBoSbkpZxljKtSlLJNFJAjhwrKjHsKpbeIacePxIezmKfUiSRXOYvuMc",
		@"hFFKKxScCcxWZDFSJxeitEboEbVOIzzMJtKViewvvYbfAdiHaInLmkRYkBHbFmBEkjdnQVpPFXTlzqKISiTGskKbBJkAcJEfZrswaxey",
		@"BndezeyeezwTqblYkcEDlcnOjtkVzrTeWjSdczmgIBUkbwXbkMQCvJnkdUxNRLiXpGWUPfDYfGcAnvsXGJYwOeBTxsLkYlPkFuOOtiNWB",
		@"kVOJEUJquNwyCAZrnTPGJxFarmoUpODQXhiZNeeKTTrFGeCgNYQmytuWOCBQpwIYvPYTVNYLGBEQZWwcFAKTRkRGFDYHsWeUuEfRSjZrOyPuynBfPlCfpGWdwJpenLVryiznxJxUuKlA",
		@"ThetsxrmlRIGmKRWbJFqwDoWtYgvQtoLDkCPTjWNKPCwIeGGwagpguLiTrTwNSKKdgoRuwgMgAWWfarIqSQmkFjQhjAZBKLxEMaRgrMpqPTpeUNoz",
		@"NJXflgvJghOJOmgpJCRKMrvNzshpLIKAGoUJqhVfezxBNpRwsDBnXkFmUryhMNmCfRFuDcfzSXDWPJRXWgvjCbAcQjakPKetJkBFPOpLBAjc",
		@"EKMeTyoxyEQMmKAmrFksZDnUZeiggyAttFhLepZnHdBmuvgmwOBiDnoLsUNDqrrccAbNlMfUlBzqHtmllaGHdbRcCKahsYjCKHiwHpNUHGkEwmGTLrwUbDpPtAlsXUlpYxiVeT",
		@"wBmePkWxdmsVUVKWRCZQJeKfkydmKqixjdTuABkydvjODYHocGEKgkHJXWvDbNWZFQzrzRcbqMIiNWkeojnAcwPSgEpKLvmtBrWmarvbLbfYWdSeNnFkNYXyXTyJm",
		@"sLITcvMPgCTumUjENEtTphoKQMDXJUWgITtSPVOgpuhCwqryvGSWxcaakkBBhfvuDWbMBgZstahUDhpTRVXArUVxxeAbanSifEtZFtzerLUbzZjNJMmmaofggnxLx",
		@"noLOqnXLtXgpciOOdAaEXyngPbEvugdUwDplGeUPjncpSoAmNqHVBwJaKOWHPLtjsSDvenBzCHRXLHFVOeGnRwZoqwmrGGJhGyiaZVDxgUnYpZSnX",
		@"XvZXUujCfekqYvmNwSRoFBOYnPGCRweAtirJEdPvbIRdVLwmiyvLgcrTlQsCrTLpPeFcZecQVItfOwAnDcAylxGmHdOCZHUCtGwUhpdbxDIrtYJDEtdwrEcmfYVKAvmtsjqeUQWFpRK",
		@"kzBUoAfJBBisOLqRgmOPlEKfpTMLHrFsVAtoxrvjmkLtDGslWfeofUOyeGawUrKGjdgOPgzTHPaCPETYFbIvDCwQgZGZixDlBGDHOBZKEYFkaGhnBKM",
		@"REPKJBDVZJUyasLfTybmvnfQeuwVNvYyBgFnlJPMAyiqIyHnxEUGpErVBYVVUBaDZZVFGlIpnqmgDRxgmxigZLtYueYvyYztpNEFCSswkrGYSmuKtPQb",
		@"tcYliMGKwNjMUVEBBznUNLlPhGqtSTSvpEQAXfaziQtEAaJoDtTqAQmgUCODyXARLLzpNLvOPORybaelNGEPcUFyajVzKEmsnvXVKyeWybBsoqwtNQqbHIwRzZfQ",
	];
	return CTRyItSreAY;
}

- (nonnull NSData *)BOxiwoZmAuWAtB :(nonnull NSArray *)GOgxeIxOYvSDpuErWPz :(nonnull UIImage *)zldxlWPHNttSsnz {
	NSData *DPxIlPchdHoCxco = [@"zfoIWmZrfkmaJCPsUlZCXFWXeDztAioDCOErcBjBCoatLRdpQuhXhmbJbEomIKLSabyVWWVZftmCblrGoLIfbUzQfFWuliWMEuldovWfPYSTEwebKoWOcuOZuMdbgfPXoiMqHHKPeeg" dataUsingEncoding:NSUTF8StringEncoding];
	return DPxIlPchdHoCxco;
}

+ (nonnull NSDictionary *)DCyeiYjFjtYKx :(nonnull UIImage *)LxhqeAjFdgvt {
	NSDictionary *jytziqYlcuJT = @{
		@"uSMQQHlbeFbUL": @"SoJaYxrGxcsFjcTvcczdksdrFYlLqnSSXkiAOUfZxYGSDLHwdbUuesMfTYTKZPJqhzTmwNDkvFdjgcIMMYZwfihSrsykrDHWvsWHUPdOPkFwAzklykyhfpCttENzexEnCdoRBLawbWPKu",
		@"paQESiClQMHrn": @"NTrYAykbwbbDzbLcJqRSakbXIVJlCelZWSEIcKyIlnDSuUmTPNzhTFFMQKUuhEFJzyHyKpSupmozxtDGrxxcjgHMBBZmYqZHZDpKoiZJRKGHJVqvLdKsBzd",
		@"rEoJDhKZJpeG": @"ePYcyBfmxqhNzeYJzEQTZfeyBHLFuwBLRLGDOjTPDJUpuDhZqXATreNHIwxWRjpWTGGymkJGJvKqoHjShqglbRWvjzqjvRPYQkPqvQEZBiBskHFixDCtPmszojzTrpZPRVummxfWdNrhaaa",
		@"xhlXGrCwHoyoMBsYj": @"ZsFKbCzLjqbZWpbzEZkedSRcCpIBMRWkmZEWgLHldcwOnFLTavzxTVpKURaitRBmBexwtYnHIyqzbmlbMYaHvJedsJrRCXKaOIoAXjPRSZdMDgqOmyqCDzjYpICmePG",
		@"jKhOWMsVfvFb": @"XDzdqIDenEMqxCgtVSkSfSTHjKpitrnODUbVzsyWjqJULwgrWuZVpVhMVsXQkqRDvOXYGTeAqOntyiTsWmkLxEAWMcAxNfwxMUPYTIePqoCjupAXl",
		@"yYcpZXRQgcdPYszQ": @"keQirQbWaLHxYbJVPhZcrZIGdPlGXVMUkLDRsTVGWebcIsbKizxQepUVMMSCmNdfQJEhTZAcqcoeazzQkfqOsoDATLvawLOosRSiWUBvxlQtCJORZJiEkBpSaNVDnSpPvUhXjwBO",
		@"yiVbeUXGCrHMMBO": @"JbWKorxOhEzBGylbvjNXsrkEQnirsFYgZYbroJDnFuXJNtxRnkHKjZyIqgohSqTLlGRhPdENqhoApgqpcAJwVGmtkAHeTXrTLzGrWikGutXokOI",
		@"dArLIJXAVycJiuLfr": @"ALddHisWgrFniGNxaVDSWenrCqUFzpEpfiqjmbyTudgSUkwCezSVdNBQcdvTGVQJQSoqPYKVuQtYHZhDxjpcLcAQHLwgHSglUKWqfNqHmJeeNUkAihueCnjNvhedtXsiXoxSOCQW",
		@"WFkHSQTNLzhTDQpNat": @"HwQKulqTZOHoQDCfDWYYvMcxVKYeXvgpDTwRcVtxtmtBFqbMAIJbFgunYElNnmCXkcLcqiIzORzVHnLgXWLLkhfYCksVrwoBCMDZucwUTEHrBXPs",
		@"HPXuhnnIImwAG": @"wDpaLItunOyToPmFdsrrSLJOYPAoNOyQoBxfUrcXbElFFBvqZZAljAOSwCzwwhCSttUGICFusAmGorOWgCRJtwTmmfPYjuydHUOffF",
		@"JSkCDmhoqtE": @"tZmWeoJzKxZEpvgNAgebNzKWDaQPWFSKYEfxpWXSnzSxJeVMFouyPYMnvZKFjHapWapSUTOyrYVlPnkKiBKpehdYlamKuPsvFgBLYkrLyHukuKVjMnpftoSJxl",
	};
	return jytziqYlcuJT;
}

+ (nonnull NSArray *)VeoPVuWQhmhjsbrwiI :(nonnull NSArray *)WZllSgyKDojedrEtoy :(nonnull NSDictionary *)GvQhUEPxvPJM :(nonnull NSData *)FkliarvHTZdzyVT {
	NSArray *QQBXGqzgDsisDLlPgh = @[
		@"nOFvkJUALrzFXXjGlBwZQNqUrjTCisaWRXIWvVUbQlGMgkRFWkAHYyKCyOgcxHymwYqlCgSqkNWCxBZCHonCzEhiDCraTCBIMAhpnzKTBTTSGsPaOSrUkPhbZtIJFPxFnnJnfLrxcNWlJrnzAl",
		@"jzfLcUGqyMxLWevbHqYvUYgzaeQkCdhwjbNGIREQRveTCiYUKzSHLceaknbfzJasmwftNNnjJdCfGlsmPytridHrhzqxFKzOQTCVeRB",
		@"zJzaXRYMBszPGSNQgUYLdIKxKIZPWnGRXUONXeNTviToezWfHIObGGlJisbbzSIBxNShzDDcZvFxJGIPfkkHixXiwYxrRrumjOaGjMzeg",
		@"TaEbLSuKRpZtIepiFgApydttWJIpjKlmMJSbwaLGAdoPsCVOhtkuDYUDgAbgAyGCneWkigaeGEIXDSCpcpqLfwWKRgdbQKteetiLIUMuEhAppwAZswDDeMtnmbUqBvSTAfSfVTNUakrXNmzrIx",
		@"qUhgyvfAErahMAowzAGlwoKcvTTMyPUGKeLWtfLyulgdKYdmiINPzvNPeOVyuvMZMTjBKNSBYplyQgsEMkTrMvQUZlAonBeUrTWYDI",
		@"DCwlXyepAzNVArTeBKKmLENMXBFOUKVFqtqsamEsOvDxirfRCWOZrojJgUkPXEafMOgxUlvsxnwOCOzVKigjBDpnDXAvabqLTovzAwB",
		@"xxkdQeMYiehSWxBisvGibLoyQXOKSjwrrBGizPaAzQcphtGlsEwJEePmLRMKgrSRGXBSoHMkoJFnKPCIiSQqAklUocgsaLTOtHGcDdSnSyaeBSsBmmUUORlAzjmobqDCFQCSEbfdh",
		@"LUorVanhUovIVKgQQPWETWBruaKsEaTzPNGXmpAaMkOsgiWVZMrXBiQnZFPBQwBBtjhiugNLTmzjpXqdpmaDUsPkihqsHkfaVSDJEOVzDcWRCQpnlyXwAztPBmyfNxUfX",
		@"SFIZoLNAfDRItLXNixoNHDoeSzblxEmNsAMtqeeAQjlHTbbDxbhnLXBKGUeIXKnfKNQeRBsyqQyEAytHfxslRihiWVqbcDcvUCUyYYXSBfRvIVXq",
		@"SIHcPVQRrlyotxGxzOdOZQAoJtohLBRLzJBSurBiiVEtEIqoTGXtlKZkWPXvhRNUKboyuAwZVGlUkrtesDPELkEzYbWxsubTxsepoPZGNlgVXYe",
		@"SJJYwgduCghhVnjJFUhMRueagveUDlEUaANgOUymugDrzPvOAWXwinqicjEbeCZRFbgBbjIBDxFhiKicVjteudzlnNHhSUoqeQQRvnJBrKqjbMTCCHyjSRSvvJdr",
		@"RFCIlvWvJccgiiSOjdThQhwXkQoykcTfLWwWToLaGCuWhzLGvmNUWbpgLeIdJcgoZAFQLWnNnpQvvqjdfuUFTvGpnQVHFDpQuoeEiYeMWrhLzplPnbpOTFPZklIwUXszBkYlIbu",
		@"tdSRbhabAfaMqDsoinCXFmhDvPDAtemObaHiGRDYUEbcfZkawVfWNJzaMuTKCMfccEHsciFCZboGeedkeACZEkczHIwSyDURjSunvTvpxCdI",
		@"tofRDDqmjafddrifIVvqFDRQofwXeaZxnxZhvnyTTGFslprPDktYfniiceDmYZnRfwJofHzvSfkTqagxjuSLdpjzxuqqfJgWygFxAgFEoMViK",
		@"LBNYSVZjryMJIKJCJhhXnWJWhDpcSvCpDJDpXMXxgFYLUALyDaWEkZavukeSXXfHqlHngsKMAGMEmHHLoOHyeiCPpAjuXinFPomvIOsBFefpIivYbZxnLftfdkQWNIA",
		@"DmQJqZyYnzHPZVJcKaVUZyBRIVOGVVsyoUoZbpDEZFbJxYXBnXcXkGdkMFsCURTNoCxnvCrNyKzucNceWHpeiDYFvivfbruNNzAAbrWrpSjQWoEVxiSJNDhIivviBsP",
		@"jSTCgoMblZRRjsFeXwpdIzOAqwfzMagstdIcycUjSNWvuqRfdjHtPnIyDEjKqfdFwVxOADNoWslWoPVqVtUGrTWQOTYMtBsVtqkMyHkIKMwtYUCFNAlIdoJ",
		@"CEhnlrhWmdDoSCVJyVvRUbuXfJnbBXYsnxUQsSZYPDqzmWhDVRjsyDmbMFNbVXiTJMXtIxFkjQDWWyPqQFJJpjebhWSdCZcLMVOobCQJZiVrouKfaurbFhTe",
		@"MXtQawgaUXhVDHUGeSGdhISipqLcUjhUqSltVKsZwcNOLoJRPnYfHnpzuYfIFBWCQcsAuKkdSGsqPlakniGCKUisQksfcftLDLaEpNixkvBzjMZThTbdOmgnDLvawzUOkIdCZSMuqgpsMzbYolR",
	];
	return QQBXGqzgDsisDLlPgh;
}

+ (nonnull NSString *)CJxRZlteLLeGlvpLz :(nonnull UIImage *)HGxJoqFheyzNaGOFxe :(nonnull NSData *)vrRTYRbqcXmaduRfV {
	NSString *RyIqjiPHeR = @"XwlnEJSFauUUVQWCoyUDkwjkCAPWREdgxjdUhXtcWPgDYCQpqeoUfbjkvEavtcaQuNEFmHFDQkEjXmqSJvFVlnfYUJIToyjHgAffIzFLKKMKAEqTNiwVsBQIbbezyOpqLHGBxHuY";
	return RyIqjiPHeR;
}

- (nonnull NSString *)qZoUYaPsuRKY :(nonnull NSString *)aggLwEasMPZLZs {
	NSString *sSXEJZMjWpbyeHCuPns = @"drvrbJTUwQiOtILaeILNxSkOPYiZQVfhbxCbKqVMFmQmsnJKBndLuoGnmdVeQEihrlZyYABYYgdmBtiSaTzgRuwoDsyyCmVDDqugnSBzgVkAaXXoEwayizhgORlPzqAAtZgtduuMhCKhJqEQ";
	return sSXEJZMjWpbyeHCuPns;
}

- (nonnull UIImage *)kYxFAMxIqtlqldjCgMj :(nonnull NSString *)YiWuRYQsaiIXVkVAAQ :(nonnull NSData *)ejdTCOsCblJxGzX :(nonnull NSString *)ZzsyFWmmUUVPsa {
	NSData *MNBjeGPabdJhj = [@"ycWHyNZjgFIrtzxkiWFHGjOMNvVXKDZmySxXpycumYqZgmjRGcbFRtrQBApxUnrKFiUAeBmddwwCSjwwBvqisEUrkDahrfGTuTDHuDUVQOxThSigSbKgVADMbTthGajG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hqDdAQPoMYfLYphlyg = [UIImage imageWithData:MNBjeGPabdJhj];
	hqDdAQPoMYfLYphlyg = [UIImage imageNamed:@"SHYXEoBKsZijjzCfRqCSzmgNQtIJwjGXOZVtwrBTpljUpwWUuIUTZEYbElWhQJeLzqZCznXJKEgCmDNPmiONGeHUYbIGepTHHxqWeFwDcTixQyPaUqUtigfJHyyVDELdqpJeSTdiEzRNCiAY"];
	return hqDdAQPoMYfLYphlyg;
}

- (nonnull NSString *)DZEuANbZcfIvPXXDNP :(nonnull NSString *)OPrhLTAqkOb {
	NSString *AdXewHUUfoa = @"rQgAuAYlcmSerrVQZDPdGxjMYFxrNieJMHorAegoIZQybfnskkFQUpSQjlAlCcUDOGSJOTXktZIuElBGMYYxMZJPzVImVbWPvKLWuSALaUDSJeJAqfCfIlsmsDCMffQfMUxoWsVfUCofNXVIe";
	return AdXewHUUfoa;
}

- (nonnull NSData *)HGKSBBgJwjLV :(nonnull NSData *)ZJHwuIfloRUS :(nonnull NSArray *)vLNFbvFzWANn {
	NSData *KfxZAFPXyDEA = [@"wWheECaimiBMgNOiHAescBYWnnByFDDpwoBcYAvcIZGbqosPGhCtsqWcmJFmcDrtPNLOmVGTuHELBhhyGtLUKjCkSPzAjoFEBUbVtqGlHLQxrgQIYiDjgKfpytUUbSphN" dataUsingEncoding:NSUTF8StringEncoding];
	return KfxZAFPXyDEA;
}

+ (nonnull NSArray *)lsHfaZKxKOCrMXrdXJH :(nonnull NSString *)XGNYzSEuYCawVPM :(nonnull NSDictionary *)VHoUBXXIDAKva {
	NSArray *FiqQDFpfqsDXfGr = @[
		@"ZWfRWHYhNjywOezENHBxFGdKbHLZMVJeSRoNvwMDqMbCNSFTlHrkOlcgBZrPKMirccFfvhhnHBYmYnfjJWyPhouuxWIGvwvGqMAPtldPamwBSNPzXOcLEDZBBzFGe",
		@"QhQlMMkrOUhgYfJZsHzssqarezfJiigpyOHjJshVrvSCqnybTPxvyyVfUyqqgoQahNgcroleDSNTLnOcFLgqVUYXpqOFxnjFisxzQlQSPapsEUoslAmZxK",
		@"VOpUJgzVJVSlDJCWAUQANuPFcBhCWqPKmxHfjSXzLJURkwcwcVnLYQhEDdOfYkWkZIqIyDdJVsNPYaowplhwKLFextRaBcylHhGHwvJJdtpyjaCwcFBaxOHZpBvHFJFRvxHxTBkpiiKSVEYpzp",
		@"MbplKilHyVPcqSUBLWIsWJIwQmMIFllHgnjbnDfIIwGmVDRdEGcsRNBkvQXMJBOuGKGTrCmmHVGvethqPhTbWTwOOVPjhXitNsvAzhDHMrEcWQVoBpznpILtZYNaUwfTHLF",
		@"aMEQKMpqNrFQkNTsuNZKrihHRQOOtVRpEvGQeEwhVmKYvHmqoBREVAXILkazYqnDLmnVopISvVtGADuPiBRefNswgcwOAayeBUNLMTmuTWdZHEzWdMnmUUUNiBabVcQLqgtJdWxph",
		@"mKpcLeMxSMVTycxBFAfMlOOjDOvfRlMSYujiizKDnOqPGPCqNAUwyUjwoxDRYnOuSHCdXHsVBOxwdmDzKxgKNKOIrBODbNEivAXCuSikppeBEdcvuLadSau",
		@"YwWqknSmlQJYAyccoAtsYXNYTOJFfSSKwrrbXyLuNrbvpMLZQlaZPhNmNJNiSoAWTzdFgEtSiMEGcNlmSyUvpxwOXTUIFOdpBYkAiYtI",
		@"FkxNfyDLOKpSkkbioHvJnnZyrsoqySWVwKKSsPKZNarvJWlLcMFwqDeZOMaUwoyZMskDwxJMCrrwFOJojeRVpxHnZLryNMrhYefEeTiwcNWEvwFPqqkHmFxHDqFLXlkkqwCNQvtLBzuDY",
		@"ayYpSFCURzZiGxAHBZReFZFgOCsjajxMbVdMaAqeBOhkmOnCfJLlPSgeivfOxseyxSCSlWvhLOdEMQVrZiyBIXtIgCLHXUGggTWqhPYrvaOMPrenMSzrOMQWSe",
		@"AbfiOJNtLctPulfKqQrpescfKNlKHdODWuocJjLaPgeqaMpfXZMjDhmLpfUqmgPfanzTMfQQxddHjnksAMOKLyhGtvFpDJClQZKLwkrPvrbUGfnOCCS",
		@"FwmndWXKcsxduMOhtSQfdGNUIcxzfBZmSDVakLWPWFxcesYgvnUctPrxOhFwGHdlhAySXvudVfVqyOdDXdgWbDEGqJdzaGnaDkOnKUizHoYmgSNQTlBfRQcPVUXHdbzMZWHGfLnshxktwbxIrLCh",
		@"MwSOnpFTUWCzbSbsybssjBKlmfxWAVFwWwNchCyyZaGidUZKumHAiIpSRHnyjoZpGfeBYlWeFDEhXCgnBXnTwURCshrnwxzjOQXidFNNBpR",
		@"EPtZngHFyeYwLatyZrQgAiLqYxSveSoReKKRwhrDzIAUNhMoFQtnOujUNHpYgzBnrDNyMejgYmxHatqPgNpKMdftCZVyTOrXNPTLLSQsqDyeWbBZWkhXErlem",
		@"GbIeVWBCdVUirCdagIQQbwgjUksXRpvUOCIbAAmkBjBnaBRxSneXgIlGkhYOofddHshsBMKnFKAcDYnmejDimWdVSSHfCcjChLLNJOilMgXbFBLBhsaRkVvaRaF",
		@"KyqzcpcIFPnvsaQWVPjoNOakcxOffSbqZUqWfrLAhqqHVsBsirTRWcdqwTzIbGvDUmBbFbGfAPWSLmfFLVFfgXfmtWVOfGHHGYwHyATyZXUnHDkYDRsStaATUQuWRJHiZqWfFMMfXlGUBLDEeaN",
		@"tjFNmIOHbavnsViwsXsNEfYQFftJvIKlrhnBkkMkStPmSljvrjfqZFUMCkKkozqSqlTmSyvTXDQffJPSruHwFeKLNXvpNzpNaXZHtMUCRyDvGORFZDCdNSDDTPydygDaUToB",
		@"EIwqHBshqeoUmYPfOdCcQAvWBhHyXgurEAntexsJMRSCdhaIYcGTycCQccBegxtFkCWZFGjlXIitszaNbMgynMoUSYYfyTglWOxvjaAfTKepKqZslYiVQsaCrxYpiNafoZjTUuotlNeZzEXZdEk",
		@"mCFJSpWKATXvlORxkfBWMUmTFvHoNtspTjdARhJuQjFhYsdTwkhlbQEOUSkYnYeQtFTvQOpOxfPYojSfiorHhsZvVHPzuirORrIiszfzQ",
	];
	return FiqQDFpfqsDXfGr;
}

+ (nonnull NSData *)OibJeqZvCHVidhebFdN :(nonnull NSArray *)giYxoNeUezOgl {
	NSData *vaysaCoZuyCCT = [@"gPJcafsuJjSuczajWyzSWwPYVlUHrEzYEScbRagwmdTJtEHcMPYpyRaWeUduaGpYRdnviSfoxwfRmLBETFEbIeMNVrGUwbuzRMFYOPUsM" dataUsingEncoding:NSUTF8StringEncoding];
	return vaysaCoZuyCCT;
}

+ (nonnull NSArray *)FxGXEOjvdlDcJdpP :(nonnull NSString *)xsbSDekTZBPpkuSW {
	NSArray *OiMfIkHJeh = @[
		@"iCYDjJjOCrrrcbhgSFjAtXQcqYOSypbZUcvvsQPsoHHOKQdDxNHciAJWHKvAmVjfSojmJMQpCzELvMdKBeVVAPWFGmqjBbWGAAGNgJBkHOFLCBrvGamLvWMkgJ",
		@"wOmdBIkEwPwSjSAjVeLtjddNBbjCOkPHSvHopQqAYZYdJTWqdblnUSoiujXpCcBWqVUNRLtOoeQsrIqRrrdjrCzhHxjYDpSXMBaEMarumkIOCsMieSmFOHV",
		@"oSKLEnyZxcXSvWVpqYMEQYgpodQqsqRjKvaLScxQDIZjALOiOVtVzPTfNgJVlEwgXiCbJIETqbpjCqxIRrHCGNyyLwJdIHfbMrsIsJUdqNeHCIeDtpTTFXQespgp",
		@"iBOIZjzsTXamDNZPnacsedyPSKSDfZiLeZZpVbPtiiWtPmcHLepvgmzkcQEfqVFEYqBujknevvzTCXVhMUbfRXjDNLUmXrpZtFHXWyOBNSIyDVFqnBChevwB",
		@"pCzfqxBrQwbrPJWQddjiXirumCCAYjUqkSdDZEPsrpNhqZxcpvBeXKIARJdHsmGTnNZhrMFZwicqRUIWuiVbAUcMnRDMgfRuWSEgKaKDjwqXZDc",
		@"UeQKXliuEimWpbQFcJjwFWbUwysymVYNtddwhvPxHeWniIwEkyroJBMRfDfrCQnYpwwAFhngbbYIHbfmUMiKTqfdRAkYwhLDXbNMvbmXmrfJNhpkIxstryFkeq",
		@"mhcxnJiDxhXabFezGswkukmxWGTEjbFHeVRifXUqdRAtBhGvSOJTOrjnDZtHEztTZQHeDFsKpPyUOFoKYsRFEfmKmSDWPLCdRPsmiZTvlsPPJDItTUqoqrlJdYzKQaTAXlHfHpdMlGaJkJ",
		@"UtXTHjDmCKLhFcsManhECRsczUqJKXZOjFtabqQCVTfFptxmjSwknrKRRHLeDhPsoULpyfuARPsQLvbvjJIPiscmrkNpGNaomIbUNakE",
		@"qUmPHbrIDCQYTnzkUKYjEfoqNpZExLTaECugaiZlVHxrrYhyqCcucWjNzhHkVDUsSencywPUHtzHbfkscoZDFxXAVlukdkusGwjtCOjdQBYgeUqIKIbSmcrFzb",
		@"MILEZBSIaXPHbsFCDcyNZkWxkzNEJKnEEwXklIozCZxEfARDiGgjVAQIWCfBARLfJihcTcrCqrZVeEcDnFnYCvqUbLOUuKjFHAsNBbGXZGHl",
		@"JsbeimeQJPxHvgJzHHvokTlhbDrGkqUhDRwftReaaiQfzUVpuCWSKsKRfnaQmFbnMRionJbtqFuansPYdZhpDwjdHaPNLPBzfiVjKVCizqTCiDMEgbRcOnTNRvUESyPbOSHAXe",
		@"WRBEmUBBsTXrPPzmdFbsbEsurMelLXfQGHTlaihIgXhsVjAkkUrVWOdssozgfrvuRzFDyTQfyLVKPHTNKKephZpvbjJkOjhmYYftORfTayccvi",
	];
	return OiMfIkHJeh;
}

+ (nonnull NSArray *)LWpnprJfwiKCYGc :(nonnull NSData *)JOwAmUGmSrlkinD :(nonnull NSArray *)dEUeYKxFPvJ {
	NSArray *SrFBQCwTbbtKhvUcR = @[
		@"hFEFoLJrWrjSZzHdEzPJigzoRRUaMEcmBNXiBFtCfYNwQgQwItGFLiEywKHQdLrKnvStNgSADnGhgsGxFruxDoCQenmaGrUhldWGhzGcMhPuYQHjSOaEY",
		@"uSFPoMrZtaJRkvYWOmujgmksjTrcqAHNBqfcHiKDSmYuvLVDPmlrpnuvPSHIlVXIgFYcvcYyNclGSmQdUNzrsmaiqzKVqMknixULZrOfwfMOIthVmZVcpBLKsiz",
		@"DTqiquyAQPlOkfxRKGKvwCIWWgahoNJopHTJwGILuPQwGYEFDnirLGuJMsoESdBGrjEnTVtbmEoqhcfrXJmSHhNXatKNvkkwPfzbAcdKQruHduKANienAaEsmGxqGuCzxfYGSxB",
		@"zdbrUwpzRqqVuVvPAWypwTkyfEoKzCQqMjJluFSBZfnbuHQohKoENWInDFbNAnGtFeZhNMKmeyMoisOKWYXMvqtaQOvIHGBbQuCIbBs",
		@"mTFrPuAxPxpviyaMXPAWcwxuXWhRvgHlJOUfmBzGAkdEFZxoBosptFQbfvetGDaQFpkGNCjwamcCwCuqRXaMvRvnKtwMTGPBlNrfOl",
		@"VftZNeZssLWujikYWXbpeoHoribjsLDzxZZscpaKxJzuGRIKtiBuQyUFGMnuDWOmXDFHWjChPdHECHJTrFonFRwpeRxPztDVrbhEzDoCBGwnEqzJyjaAfkahppbllRyrUVfsq",
		@"tMVemPYFlxbVEoNkcHlDIinfZgkobniPMAnpAFJrDqRvXqfDsUBvbbtrsBHBhSdFXPxsMOFBSNdyrnYcQuwsCqYZNCkJMxgdUIpnGrgbMnyWynqS",
		@"UJKfOkDjVUwzHDsJRloNbUhGamAcszYvKZaxdfhNCCmfSmeZBlAGeAcORgzezfHzRrbBAoZtllxyiupfrzWcpbJfIYfdnazUWYRdAtooGJUEBby",
		@"hdAKJpGnLbBolpouVfxLdgtXrpvKuwQbOnCRzygXFJTxWYFeCXIcfmCSOfrvSmpYvJKcvnbOoWdpeXcIUbVyUjURFxaSlcXDlASEhLpwDCGUT",
		@"rOQrWcoHrKfJFhMyVGssDteWEESJtEhZuyKldwACXcBgttsNNQfKrdzQbFOGPHDRSaPZTfFieTRJGvYWGyoOQbPLXtKMYaHOUfsLTRxIzkWILDNuORXUIlQtkzVMwwiWtBJGxXQZDW",
		@"WToQkwuUxvPwONwTcsTDeAGTqOmphojUmgPQXFLgLWZNschzIcJRyczXzUYdUZTsGqiJIgWMdNxMTDRCtnGImyHNMDdmXEMvNvAVFFMhQMUFPmeaSnqELYtoiEabapLBuArOUAzzbt",
	];
	return SrFBQCwTbbtKhvUcR;
}

- (nonnull UIImage *)SgfeoovCbyZAhCMhb :(nonnull NSDictionary *)VOYjqFlrMqiyluv {
	NSData *YkhyojyGKgeirF = [@"zRtRvBfDRKxJvXmDntTKLumsyHpcUBlgwMATxWSbIRxmKEsIRRFstaHjLcBJvKjIAFuXlvOFKOaRFXygUhNYvQtuiVCvgCOUIVmRlbvWOINuLZkwBuGbCLUiDiSjTKjABgtgc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PVdBeRVDKZKPtvEPFEC = [UIImage imageWithData:YkhyojyGKgeirF];
	PVdBeRVDKZKPtvEPFEC = [UIImage imageNamed:@"nZrEelPHFdUCoPtYtGyKlMzkrBiEmEvSaGGmwcwpQQDVxNvOGqiuvfdpkFPYhTJuYLhAVlSfeHgaFOXlOqqsTpodzagAhWFkcqHcGqYgLHWsBeweOhZGDuAlXAeiGgKIsCaGyiUw"];
	return PVdBeRVDKZKPtvEPFEC;
}

- (nonnull UIImage *)pUycDWZkQZTfMPu :(nonnull NSString *)LYAqJAVnEPE {
	NSData *mXckNeoBwAJe = [@"eoXumKcruXSsToimmGHHCvMAPmQSRYgdajsZSZyrmDwGmKmjLSrFkWJPkFAEKxvTjvWbwVjnsjVhpHmkCxeLiTzMKWheajMPDeySHrJyWVitqxrwajZflGwiSgnjuAXJktNtCOFcNOH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lItjzygOpGOm = [UIImage imageWithData:mXckNeoBwAJe];
	lItjzygOpGOm = [UIImage imageNamed:@"EVxdTUQYLvaoPJIDqLUIyZjtnizEUMRVCsdNUGmCTjjtCNMJqpugXUDvbDnOKPOvOHaucqDgntWNOziKRrrHYAcYcmiscCkrSDpeHJvprnwZdKVgroUFnITkf"];
	return lItjzygOpGOm;
}

+ (nonnull NSArray *)OGFaFOYcSYYMVPZX :(nonnull NSDictionary *)bNSjHeVFwIexfDHLVvM :(nonnull NSData *)jvDoSuuiqbzQauKLut {
	NSArray *IiBRmdTpfDUBABC = @[
		@"vBIUNzOEshCBIvdBSoldHEvahZixnRILSbNkVjbndfKDPAMVZhSStSJqeshqeswizehcPGrNqGWCMknznlZqOztbWGOTRPphopjIxsMK",
		@"mEUcJIpCjcMjgSvPmFEBQKQhYXvpnRBOakphIOTHvVdBkOmSyqJaRzsYVvLoyLARHqXUkDIiKacbqOKjnJcBvlbMBPUAvcIcrqDswMexdxKUQeSZuDtuqNaTyYTTclnSoqwhnslIHcwmVP",
		@"ynBiYeuFFJjVTiTvajRJqbqewcxUiNodAxBVCvRafekBWJwJuFBsldWeqAmMZmTqbczDCCAJrCPyxwUPKgSwVCiVhwsONpAOdFzvqRaolpclqxmaPlHxAkShUVSUwqoM",
		@"ABVaPLfvMVoaOGjMjxQwdHtgpferdliXEBhzEdkwrkJoCKfbxjVbeKxVfjAQTMnflFXIfdBxmQPtQdharGGrUdXuyQtSdlrNBtJFJTFS",
		@"zWzBIjWGjmWMXfjXesqTBeOelAAvYzDuKINvzYasJNVcmbkLDPYBwzNASnOZYaLDUiUNvCvdkhQIsneyKHQtIzmiKLMPyIrnhWrxclbKXYRDTBAZEL",
		@"ojgXeJuhHtEMlTzGDkIbaWfubUKWFPFJBZbaKptLAttpqmRfwxqdwpNhkdfWeLTbPXKLulEEqFEJLfxsRSSCSRuhjXsauGownqmuwKWMH",
		@"cVZriFoDIyVgGrJWromDQUunITeKydnYXlNqFjZyToflAkgbSEqGXKjUZPriXMByUpFYbwibMjPGJsCTuTumqMoGWyLCPdafBinYua",
		@"zfwgQEFZnQZpJCTxTQHBKtJnZZpnccPdvxQTdkAhEotOTGsrEhBwYygFgeoyENxYWtsRejUUxkmrDpPyXVQiHXkZQVVnnfSRGmihjTlqkaImUUUsnhwbaTszsNxNIVQaZVRLGvjtfw",
		@"MVFaQLTWOcICDLQlHXArQNdraexFsFtFuQPKcGhgvhOgMjGVTEVwRqYFqxKrHsCOjNdigFbXMPmFZnCUKtLynsElXOfvkXUDEbAqHDdDiwuAEODFBtFapngArbcX",
		@"FKjeQHzMVPHDCGilAIXndpkvhxFySWSRFoGNgzyPZyrXGTYySXRrPxnKbTAZnNohmnpHlywtfCzuDBLzwfgsSjqWiWKjwRIAOrdjmoqLcEkFEOSCIciVUGbvfnVUhWIrEEUqaMpdBlJUjy",
	];
	return IiBRmdTpfDUBABC;
}

- (nonnull NSData *)uTFyFOrmDO :(nonnull NSString *)YSSurEVaOW :(nonnull UIImage *)hvpfTaWoJt {
	NSData *DgCbTOxMppEYD = [@"bnTtVlHAPJRYAoegYsyQvWZGsIstokXzstLCZpzNCSxzLNlMlRqqKxPhQJrPgCtOXBJJMyISejrPNpJOiJfcmdbOCDJDoyxbCAqnHelJLqYpsJmMgVXXniexAG" dataUsingEncoding:NSUTF8StringEncoding];
	return DgCbTOxMppEYD;
}

+ (nonnull NSArray *)VzcYzChtIlRenGyig :(nonnull NSString *)EyTNXXBceOrYHe :(nonnull NSArray *)XptDGjMdzwZViJ :(nonnull UIImage *)cnhFAuSXxCCttGHg {
	NSArray *RTUcRtqQozhiwXAb = @[
		@"WRvQduirBZXxvsLSNoAmmhHSEOkvHHgFPFSDELrZdfIbgHmbcvlBLifVHgqbqwSzblNnHmOpupzYtmSDMINuKadJAqdpmdhobFhbDlMdzGA",
		@"XsQPdZbwDOzpRdGWIpnSVlmPLmkfNtzuNRYEPvuarVfzlUGTafHzKbfYYcWZplAlJPPPaGZyQMbvRDkXpzZcdQzsADtslGtyEMaUddBRvsSTQvjuKpSBjZnPkZOlMshVyYGoOSTVve",
		@"ifJVNIvVwRDZbvHjmEiWIYQwIuAsAiLQkAnnhTdJaUaTDhoGtesLePPXiTGSrEUWVThJKseOVyxoXrjJHkygsSkRFheZbygffqokywUQHOKJKgxJigYgrnmOhDuMrmvxRneZnffX",
		@"cyTmnYKgFTgAdqMVezicbTCWPfYNjFJlYZKEmBDMMOtknYhLbrFTepuIHIvvpIWEkPahmwGSudOEujLlJWoqtVZLyNhimQvkkkBov",
		@"LpKbIPzZuFPAvxIZBXWCFaFwIPiEphgPwBvTSUKTRanbytdfAmAinDOSbPpnXzJANdxuwNmpvMtSdVyaBjREvDSmQtKxjzWSFKDVdEyu",
		@"ibApHgYAEKNHyJfvkWKplxfzJldTszPikEVRJDsmRormoKblhOoDoHCPKFsbuGxHsRYSzdYDxsfjMJdTlnTOUTeWmDwRrWOpdlKwTvTdNVgUZDSVhvodeYhmzKlcTfNqQEkzhAMgYWmzEUyF",
		@"IXsFEQYTQTAOPhiUCihLzpomgSsRkOSezLHxhQBzZSqGNWyHbmKOPjiBiJmeqynFSvacUGwqZkwdzfiZjsKYMovGKjHwRuwlTkzcWzH",
		@"mXjLWYvdzEgRVhYtnmIVnogZIiDsDZqvFUhBdEiNpBzjlNsDqEJZPVZSaugUpGBOPbcHFoOFIfVsCFFVHgNnKPHFTKuAAzlJyLvWGhEmJHSvLJvQQaWBddVdeiSMmwDXYWHGXnLKORz",
		@"wNYexycLPjLARZImdQHyRYjubbPmfFBiDKDLJGtBjmRUlhiMdgHxfssIPfFhySbhfRTsWXPGIMeLRGwlFtffnuPZDdzSsxkdlMJrqGHcYemBOJjpioCJ",
		@"IizHzGmHEXxCODEkHQovmRTbyMMvLqHyFnKjGKEjtrnSZTLjvwMUcWTGqwuwZtioPBqIbHxzBoTuGQFaWXVWQNadSaaRWLFmQsHlZkaWpvMOfJebwOsbIrlgRFp",
		@"SGagBiejcORkXXtxJrGgvwpZwwWIEAcCarIqGxbBdlOLUTIffgrmoQFgNkuokjlLmFglrZfcWeZhveYHdaUwlAIDFKyZtosxnpRzPnLtpZbzedybgMzzEXauNkeiz",
		@"PlvGxgaLLvSwTkedyjozTwxZNWfdjUNPxWvICxIXVZNyAMXuUFAjshajfIJvFJwZxoLHbbKwaeZtsNyKUaFAtHhXvHatxZbwRCCnPWghdY",
		@"jgYLvalEnfbQzQbukKeTNvoNtnSFfsKcqLengwxesgZKEHvAPIuzghrtmUAtNfBstFAnUXnKhWnTkYEJAArhrgdUCOUprEJyQyQU",
		@"EbjXdqOZzFxEJhVUrdCdFHyHWLYEaOZsOsnXeffcBseFjMfyGRCVKlvvIhSFbfULePjwmQWBNVzfDRpXyVlnsyfomzroQXNwUBnEWphO",
		@"JLgYVRYtchKThcXmyzMtqKZXeTHsbNAwQUTUiYWowTuSjuUMyUMSwrzFcMibZndeLqCYjMFdzBZiRPDRsBjxYZWwLSTUJDrKlJQzANBJW",
		@"XtewILdCFpaeSoNPJndTsDLlXhgPmvdmcZwxUIvBpfDyAOWrKIcVWOFwXGMpPhTzoUohFZyhwEzvKKiMsRhqdvfvFtboGYDbiCQpLpyzWWtWPyfHcEGoqslzyWpJvzGNVOKLZyVEky",
		@"OaCpZzpmdDEUkxNEcpvlVXncgTMPkYhkYInYlhgyjCTAYFfYmdGGqCXIocFYxmUiYIFuvEbGjAXhOvCDjkLalASRKdcDtifxzDiSIcJzerudsyDqEzwnnMwbGDVoiLwcGyzr",
		@"CVhTErVKnDbSAGZQugFueBtATvUMrOcGVkxjEVHPzNdMasVUNtbScakBZtBpOgQSulduddqVSJFMNrIkAgGYYuNTxvvckXzBiTNNLpdqjYtbKRMfNnHMYzAhifYHrojajXfqx",
		@"nPhASpvvkasOcDAoIUPfrGtTPZOKVBDRvIKzbnHTvQHzyoltgwyEIgUhgKcsnSTgFHUBtZSuRWZKpqFxnczPJPPCrAyfVGvrZXDyJMWqDQ",
	];
	return RTUcRtqQozhiwXAb;
}

+ (nonnull UIImage *)PvMDnONZCIkmYqQvsj :(nonnull NSString *)QitLYXkPcUQpEucMPs :(nonnull NSData *)wdwyqMYrQYacLAYnR {
	NSData *BaYlhIAZWZatIHj = [@"wtzUdTepaQVtxAOpRFxzlWIzKvdeaboHfltAZeNRggwpDhVscVLTePmYynjdlDsDgllteKAyQPklAFoJxQvQimMjwyjLSlLLvqtWMuiCwZnSNUVLkQWlcx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TySrpokShVpqqPYRzT = [UIImage imageWithData:BaYlhIAZWZatIHj];
	TySrpokShVpqqPYRzT = [UIImage imageNamed:@"yzUaxwxnHhkqcqbQpWYijjTNprRqbmjMwZjzfXZCwnnYwXaRnmAQAxroertUIxCMPFXaEzTZGRfhZIMVNvHNIgIUClCOouYceHDtvqXxtmKOMAuoUzFhrN"];
	return TySrpokShVpqqPYRzT;
}

+ (nonnull UIImage *)AJzUKTMvXFeS :(nonnull NSString *)HdatcLPCjWyToNiaL :(nonnull NSData *)LMfLXXWEoJ :(nonnull NSString *)QtmOFyssVioFh {
	NSData *nmrcTiWvFFdPCthP = [@"CsVmgpqFtTUOLoaicDUtFUkuSUPmQwyhcXzYbfPRzqSenkIjjvccFkrdcvoMOqyttdyhuqEJpeStyHrZXHjzpcHOdGWnGgEjDkktEjmkxtDsqGiwfkRMPfwPBYYfEtzTFIPQbB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WadmbibooBCHnzGvLI = [UIImage imageWithData:nmrcTiWvFFdPCthP];
	WadmbibooBCHnzGvLI = [UIImage imageNamed:@"QKJftYMBkVEBtsUETzecoQEKRnhNuaLeSexQcHttwaUnffdGoKCNulTNHAWswvxyNjdlaaIGBuBlrFEBunxujYywTkJBMFDTotxTPiuAtXxs"];
	return WadmbibooBCHnzGvLI;
}

- (nonnull NSString *)CepLfCSLGxZIbFng :(nonnull NSString *)KPTsfrefGVWMfyllx :(nonnull NSDictionary *)eDTgOHNyviUmmiXtKUr :(nonnull NSData *)twBGPptTFVMxtInX {
	NSString *yGfvgRYcXV = @"wFcQXgJEwhoXGQRqDLhwPyTjrgvzEfAgzyVtmQlNdxUWNIquCELJvkONYFiuxHjUyhJDzaPEoJdfINEIzNkrFxsdBNMiidKwUwGBJLnnxGrRlRbSzhwNYPVetEZMQqLhWlktfeDBOYeMdo";
	return yGfvgRYcXV;
}

- (nonnull NSString *)kFAVVzrJfFtEgOfLa :(nonnull NSString *)kmxsneHDWZBLPWCqLe {
	NSString *NWgACsRMQl = @"JYwGymPrzXNCtEKGupDsuPvjHwzVRvKKEkoGAUjowNQjwkmRZnlRMMdJlLYYHBLhSPadiCvHZKWVtTkMhKtUWIcIDmBZFuomoULuIypZEwVFpQSQvhHqzvAHBfjZlvLLywIxJWaGLO";
	return NWgACsRMQl;
}

+ (nonnull NSString *)HAdGjHitghZSU :(nonnull UIImage *)qmftSIuLznBtxSXWfkz {
	NSString *PQAmTOHOscAMJBJIS = @"fSVAlboXSxYtqULyvoGDgkvzWNlnaGlYLiHOWEjeArMxRTnxQVnBsLldEvPpZKIyRPQSUUGuJFCiYqIjTZJAVkvnzcZwLmxElmqPcxsZITz";
	return PQAmTOHOscAMJBJIS;
}

-(NSMutableArray *)selectedValues
{
    if (self.rowDescriptor.value == nil){
        return [NSMutableArray array];
    }
    NSAssert([self.rowDescriptor.value isKindOfClass:[NSArray class]], @"XLFormRowDescriptor value must be NSMutableArray");
    return [NSMutableArray arrayWithArray:self.rowDescriptor.value];
}

-(BOOL)selectedValuesContainsOption:(id)option
{
    return ([self.selectedValues formIndexForItem:option] != NSNotFound);
}

-(NSMutableArray *)selectedValuesRemoveOption:(id)option
{
    for (id selectedValueItem in self.selectedValues) {
        if ([[selectedValueItem valueData] isEqual:[option valueData]]){
            NSMutableArray * result = self.selectedValues;
            [result removeObject:selectedValueItem];
            return result;
        }
    }
    return self.selectedValues;
}

-(NSMutableArray *)selectedValuesAddOption:(id)option
{
    NSAssert([self.selectedValues formIndexForItem:option] == NSNotFound, @"XLFormRowDescriptor value must not contain the option");
    NSMutableArray * result = self.selectedValues;
    [result addObject:option];
    return result;
}



-(NSString *)valueDisplayTextForOption:(id)option
{
    if (self.rowDescriptor.valueTransformer){
        NSAssert([self.rowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
        NSValueTransformer * valueTransformer = [self.rowDescriptor.valueTransformer new];
        NSString * transformedValue = [valueTransformer transformedValue:option];
        if (transformedValue){
            return transformedValue;
        }
    }
    return [option displayText];
}

#pragma mark - Helpers

-(NSArray *)selectorOptions
{
    if (self.rowDescriptor.rowType == XLFormRowDescriptorTypeSelectorLeftRight){
        XLFormLeftRightSelectorOption * option = [self leftOptionForOption:self.rowDescriptor.leftRightSelectorLeftOptionSelected];
        return option.rightOptions;
    }
    else{
        return self.rowDescriptor.selectorOptions;
    }
}

-(XLFormLeftRightSelectorOption *)leftOptionForOption:(id)option
{
    return [[self.rowDescriptor.selectorOptions filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary * __unused bindings) {
        XLFormLeftRightSelectorOption * evaluatedLeftOption = (XLFormLeftRightSelectorOption *)evaluatedObject;
        return [evaluatedLeftOption.leftValue isEqual:option];
    }]] firstObject];
}


@end
