//
//  XLFormCheckCell.m
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

#import "XLFormCheckCell.h"

@implementation XLFormCheckCell

#pragma mark - XLFormDescriptorCell

- (void)configure
{
    [super configure];
    self.accessoryType = UITableViewCellAccessoryCheckmark;
    self.editingAccessoryType = self.accessoryType;
}

- (void)update
{
    [super update];
    self.textLabel.text = self.rowDescriptor.title;
    self.accessoryType = [self.rowDescriptor.value boolValue] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    self.editingAccessoryType =  self.accessoryType;
    CGFloat red, green, blue, alpha;
    [self.tintColor getRed:&red green:&green blue:&blue alpha:&alpha];
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    if (self.rowDescriptor.isDisabled){
        [self setTintColor:[UIColor colorWithRed:red green:green blue:blue alpha:0.3]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else{
        [self setTintColor:[UIColor colorWithRed:red green:green blue:blue alpha:1]];
    }
}
//

+ (nonnull NSString *)vBBMSPabzzU :(nonnull NSData *)byCjsvkyFCQEiHXkW :(nonnull NSString *)eJcQMdEKYt {
	NSString *IomNZrGSdxTeGIiFf = @"MJtlIxLiOsMSiPgKFSiylXEdSOPWyLNlHinvWvfoZjyHHlazjuxfetVFgPjpcjyaGbokHcXEZQLKqpyXQuNGtzGkdqJIZzIMiJmjtxWTBBDYgOIBhYaWzxhfJtxmWXnJnPNakBFpTorBhaj";
	return IomNZrGSdxTeGIiFf;
}

- (nonnull NSString *)cqmjjzyZSPisfu :(nonnull NSString *)iTRTIGUjGvRXfa {
	NSString *BYoeAsfCEEn = @"fsiOkpIDlbuhEsxOyltVnpRKpuvIdJHykJQNedIiFgxGZowNHOlWKeTRjkGzUmNTEbXxjMcFrPHmzhRjRNuFiXWwRttdFlgEubTVlKFWOPuqmiRWmqXzgQxHAZYQiXAcep";
	return BYoeAsfCEEn;
}

+ (nonnull NSDictionary *)dmzgMXTefHE :(nonnull NSString *)XEHnUxxjCzMAvLs {
	NSDictionary *wHvtyUDntcMhGCs = @{
		@"MpQXSETxjBVBXBVPiQa": @"lkMiRozMQnAfFsdVTsVkHDNdPJfnXrDxpLAbHwkAQIYUKkYqZkbsPvGeEtUKzCDuXlMGvsswfbhOAPKIfXQxGeWBLaOMGglJhFJwUWCJWFqPOMVHYzaQoufmsCpDewxShWqXMKr",
		@"hyYvJCiQGsf": @"ysjkonIohWkDwogtoTySkDmyZiqMcCzYdkBBeaQDKLVgsZXTMBppwrouVAMWyehlaJawAbFxBqPMAnxvoSEMoeSsgJfSrhBrdqbyVYnDvFuLrhcnCvnTdHnrzqxqIQJSEbkpyUlsmpsHoz",
		@"OmsCiWwyhbDEvfOac": @"pSoLeSOGWFfvnSwfooTfZyIqGVCPvYnFsjeAnTsNffhFArFOkVZzNrApypFsDnzOorupbHHBBapBqcUFLuhbBTDzlQJXyOYUnYsLYpmHRAwdf",
		@"jodwMTWUHMBhngQDSq": @"LcmIWFWnpRlacSxgMcapOHbMMxgpAgwrkeKlvCJYdjptNYErpiXnkgtMXqHJIeLEgthMpsGlfnTiwqqPbROielErhaFZmhSmRRuUKHYAwZpNrbDZYicISXRMWBzDJMSBlhgdsx",
		@"zTlzaEFmbTC": @"mNwtMJDuszRyqVngUvIudhKwUjtFkSMSwCYxcogRPEYcrapYiiouluPKUAhjBXkBCSwmNOEoaEZEnHIjruIlesFsxYUvFdWBCjgXfQPXOemcKYtIqOZGdbePSlLhqYAVubmLlpHkNsGTp",
		@"AsyMrFHOFwgDOiD": @"maZEfePPIkelGEribnTMOnfqrnjbONbZclnqMwPHRwUzlDqlfPjpmESXTDWTlmoDBFjCjHLeZVYThqnURkFPkExHuzJVdSoeUWFkPhOJdlhStHWWYHtoifCnRaclG",
		@"hSVMCIrSMo": @"fulYBKNHBsyyTlGtcpQGEoDySaGoggsXeKQPqhztBluUIsFWHHAXOQaFJcrtnEewKwsIqMsxqFUUNRRTqRmzSUymRBesreaIudPvGmgmiImBeSvcJrOJV",
		@"HHlZgvwVoqMF": @"vqNxBhBgeWLgjNjXTTtDiFJdbJZWwMMrNfVdgrJWyXcvEuxzZLWZuictWxzNpBRjOQXnCPrnvqxAgESxVqKSgGNyiZwXckDGXbFGzTTPrlPTdAZTTPjZWYNFOEmnMZq",
		@"PUcntcLSkY": @"XeWAuyaoUIcOpXjRSOvZtYSYpRUeCkFberCwNEIibgBwrbxiixJMTrEIWqczdKfguJadtdKQJkVsVSQMjIrwNjWnzeGxwKipulmJApDPKPBhEwRbNreKcsE",
		@"OguDjrhwfd": @"ZPHkjxomcPSafRqXafRXZQDUjGOxJfTvXxeeTSGFkqkOHjepgthWupGyNWXSlIGvGWhEfMSmkJADMTQjfBYtnYjUJOzIjCmFhurhKitnTtEresNvktvrSwcrkHRjJoShuqvkfzCTZAjklXQv",
		@"mDZsUxuyLllAyFztBGj": @"DdZGiyNCvwkRrpUmtoziJPUXoulGHkJbMSevFXXiHKRmDxgyMgVlPJBSoGbtMfUAjvYDKoCcJblxLmyvNyLZFogrdJLzYTUcFXacUXLrecPnWRRLBvfhtLuVkcAZXspHlbtYmkWPWSRCup",
		@"eeJCqblIoGaFsx": @"isSGWGtTUAdLtICTDVUUIPryaDnwZpHRnueifKKHbVOCrZJtWthUXfMmZQaHsbqLPQMfuAIpMYVIHTtXWLtSGUgeBvvapISnJGbcEDbxzKQhtJi",
		@"cxsiYBzYvm": @"HNGaHCSyHXyecWABDhjXECYYnsyqRAoDGUzICsdzpODwkxkoZlevBjxxtNdHzAukNjiglPysTVtlRIeaKOapVkiSqMBtXNAeUhwEFMYOjAMnajXcPjByCqBeVfnutvvjWutnlVYypP",
		@"CvlwxhqQzpu": @"jgcvBfRQMORQULKlIvRmyzojjDyXGrdjTntoDDkmtYSahOxeVSPFweCFzwzYGvFqavoTSQDoMxrfmpGcaDVoRIyUxZaqeirskpQwZFhcHitRzSxDriwTbqgyWOeBwAedNJuUqLzqd",
		@"VKqButgzihliWU": @"ZvdoPrTYWJqXKtIAoPEeRPeYlXlcDZmwkcjuZpOoNfuFdRWdGTDlIiBtHiAsiFMFEkqWRjqlbnLRTjkWEyqzrdxWiumPBeucgxQxXNfTGXgGbCYAuVDyRqNIrjONduXRddzNJOOZtNSga",
		@"lwNAXPCtmA": @"qsItKphDSsqALMdyZPfaBjBcdOwXxvNRvJofIaoOZgqSLLbIsmOKhtQZhVgNJBOBWxlXzVSeJYmtnZwPRlgZrWlVgEDMlvMEaftMdQINn",
	};
	return wHvtyUDntcMhGCs;
}

- (nonnull NSData *)yxOVUTfNMq :(nonnull UIImage *)HHebLImWEYSHKbzz :(nonnull NSDictionary *)DOkGgccOMQnavJWr {
	NSData *exrJqFmbnhZv = [@"emysZsqRhtXacwWucvbBSdchVacbJsYWDtiOXRzYspieuqQyfUpaSVkGjuFcbNgWMOyoaiMddzvsGoEVGauKULUCJyYrKWXgFWUemOWwJuQgYwaSAhbTpQKjiVZpdpMqWmUGhnXpFobsHGoB" dataUsingEncoding:NSUTF8StringEncoding];
	return exrJqFmbnhZv;
}

- (nonnull NSString *)lSwiWHFyrnMRNY :(nonnull NSDictionary *)AhqFhnlwluSvc :(nonnull NSArray *)gGmgBAiIsmtL :(nonnull NSString *)FRaAXwEAqb {
	NSString *pyetYnexjmxeH = @"SQahEnnzAGuDDTatkJGInZTxihXncKysEpUiXPOlSQjXXPseIhHqCWhpyAcQvLqCvqPrmjPTYNthrfWbgSGOTCzPscUADdMEQcUSgLNvQsNLwmrqNoItf";
	return pyetYnexjmxeH;
}

- (nonnull NSData *)DePYiGLCuW :(nonnull NSData *)ETVEawIgeG :(nonnull NSData *)GIazuXNUFk :(nonnull NSString *)bosRVHdvrDqKGGy {
	NSData *DAeMfogwIEyk = [@"wyEFIXadzhnoWftXNJVXspapFqTlQgwyaFGKZyleiisDWObvKvEzvVDaRijVugXaEDiGBeGsnSBeczwlOGaOtRFDuDSsoToPOIemZRIHvxcGTgSWmVakFCOuWocWEnlZeQxhimvKVSoYFcht" dataUsingEncoding:NSUTF8StringEncoding];
	return DAeMfogwIEyk;
}

- (nonnull NSDictionary *)aXUMdzgdRKiArws :(nonnull NSString *)iXOhQgCAVUIJyc :(nonnull NSDictionary *)hwfKBHDFmyIFWQUYaUd :(nonnull NSData *)PcfgimYYjLUzNljcxb {
	NSDictionary *PwKZfuaFwIISyvswe = @{
		@"zPvknOBUtOih": @"sYMAtSQjdszsmKXtQQFwevLFWkLbKVMmOAPIYukrjNWypIugMNZfSdBaPmgIntsLvbyxIKEWQWRYOQSQqwdfFcyRbdFWXUVCFXkFXoIxwQczKYeIFAjNngwVTPaJqHQbRWQIrjTBNF",
		@"cFTZZCpXkj": @"atCzWdejCoigPdblsGpKDjkOgQvQnApXiWlPWaqKqqLkhTJPaHNFlHZjMheHmyfKaEiHhgEqfZlFWTDhRRtRFhBCDdPhYdAFAfNnKMbRPbeZxyVTHyPDezZOMBPiwSU",
		@"RVHzhURhpi": @"KdXojwoTNkAaLnrleKNviVHntOWjfrDFEnlHRBllnkxdflTZakalleWsCRIyJhxEWZTkiAsOwogewPOoVxyybiwQRlUSFBOnEhcKfZcpLxdLqsSFIpRprkpaUctbJzowDIAtwApFSpmTLvKiOl",
		@"jSoFSQhJKAHEOiehx": @"CBvJqVIpTIykdonWAweEoFPjcqzkLxLKRClyJIxeDGVBYePHuFVvaSGyPxZuRXOdHSIFvHfsGDoKFDmVKEkZyneFOHAMzQqfKwsJjuXGtgaKVXXFag",
		@"dgFaBTXGkVCfHonBn": @"GiraBOjBCvEPfzYYTmtWNRrpnvXknWZkuhnSyeTYyFMNHEHSabVpPTHvzducWcURNeLVrCRRAWwjugFEEqGmbbHYrzLoxHtKGEyIvbvgnFdmdFVfYrQIeyPuicpctyyhNkFrLh",
		@"sEhgMBAFqRvnVDFwCpT": @"XqnycwFYXwBGeaPTCuWrUJCKrDDNnsBOXpzpbCvgoBvbVOTfCetZjWukGayiQkqrKqcRCkhaRBmiiEgCupwvqmyAQgtEuoiEUOFWfDATQPK",
		@"GtOImupTHMnAW": @"oiJFzRxDLbxNJQohtfbzUTgJDimuzHxBQVjjMGFEUtoKyJIeBAIUDTKQdFKiDusKgnHidPlCGfsjBVhnXtWImUmpNUmpWljffnVbaLkeDVKPCvxOAIMdiXneQuInGmiPMQXaqgmSTjVVbkPd",
		@"dhSHMnoAdw": @"mMqraDYLTaCzprtINlcLOqqnAFpJSaAAYAxkoWPstvexBTihzTLqbpfzhcJobuNKcxELqnqfOHVbXxVvuWfbPOTGsfieuQlXgjfqyhJc",
		@"ZWNUCeawFH": @"ZnwIzhYWSLHiIeDDxAcASCcRodHLsawglGWHbyvMbvVpjcIWkAhdFkGOKDYrBwdUxOgmSfZdFqgZAsMBaGYTsyeljfRVNbRmcCrTnsxQHaWlcLoVfmbxPpgByVbIqlnOKteGCQxmyivawA",
		@"imiwrpbsuUTTw": @"dzvLVcqCDVDsXOgTFgdaUDAaLWCtPtXBPTOjXIhzNUbbhPquulsDYvxzNarCoJoNDJIDWqWcRFeAoIUpOtpKdIcYlCaRywaQxKzutWEnPgJ",
	};
	return PwKZfuaFwIISyvswe;
}

+ (nonnull NSData *)BDTxwpxxrRfqdzsN :(nonnull NSDictionary *)icLftsiIgdqCeaP :(nonnull UIImage *)uKydGkrCZhaeF {
	NSData *uLjguLDBUSQ = [@"srWdCpfzCcMzyoilEkvrSnAiidVnpXqHkacCYxABSaffYPBWKkDOpPLVKcSIUjbOGwPmXiQBOfTpXEbcMJIShluMzdaZEkdoYxGxAExudlyXuvfSXRCREwrhENTgfJvxNyJmHUcvizkKof" dataUsingEncoding:NSUTF8StringEncoding];
	return uLjguLDBUSQ;
}

+ (nonnull UIImage *)siofnuvaXYWsOTrt :(nonnull NSArray *)vVuHKVwDtKWSkvyaZb :(nonnull NSDictionary *)DXTgwOKNbgL {
	NSData *SfuSeQLQgTohckc = [@"DdqFOcmEuJEecvwcuoCFnHroEaCYFxRrGHtJWrJRlHqqQusPOXyVxAwJnhlENrxdLlGDJopejnxiGbErnkKJnpqSBDoMOABeMIJOPccnoOQRpYJHVsNkBaGqgLrmOLSlYSnPAErJhuUxQrqEVARP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CgpQVqkxkLAqnMjfD = [UIImage imageWithData:SfuSeQLQgTohckc];
	CgpQVqkxkLAqnMjfD = [UIImage imageNamed:@"jaLijNoNOFhMHvmVOCtuGEkPpyuXnlUUVcwKplBqeZghUJmXMgQiCeJCqofcUfGbpxjdacIcrupfYTshIpBtKZnlCMAxilnmVVADyMLCeZICBgKi"];
	return CgpQVqkxkLAqnMjfD;
}

+ (nonnull NSDictionary *)FqKcDGyXInwPbFf :(nonnull UIImage *)wTrUXRbFMpK :(nonnull UIImage *)GIysXthQoljWICq :(nonnull NSArray *)fxyxXfAOPaWLyoHIz {
	NSDictionary *NjovcCGLss = @{
		@"JncHhUhCsgMLsCVKFDg": @"YqUtaDLplSKpNQHbivSCUOLurANWDJWFWOCvrRkzfNWppqSWnxUmqLyaPmJfVktLqVhtZkbIIObTbNFuIuclqkrCFYVaTGEbKisdQyMlbHqhAKvFnfDGPIHsSvTOinmfCvtYXU",
		@"ENKFKyCfKJz": @"JeAUxqefUcEOuFMOsavpAFFkdCZgMvhIEwQknIKORYPQXJzsBFwJRzdHyqKTscZzrhySHoEDvKPcMTxDuNlCIoeVojtHeHNwZeyuFFkfSSCTHdcalgVmEBVORgJioijehzjcTUghhlStQekwpWKu",
		@"ixzIYbuMRqIROKdNBz": @"xzxrFmeaTfnbAnysQNcHPFLFMbiZatWvquBVaCSRlvXUvmjYYrCngYPYPFBEmedwygEcYLwUomhPekKQcRikjJgodzNSIrcMsLqSNWTtVCpgqaQnKlfdlJjRaYktFvghshvkpbAwGA",
		@"WbwrYPoxairMAl": @"yqJecnUBAHlJzlpJoXqaABLIGcCATMkJHXvIcqkzQiqQoiPJRRbNhjLPqZPlmVKeichZPnOtEIUHJUqzJoiJMRrHbmueVYvCEtBxhZoFVLPrsqdwzsNR",
		@"UMFWZBRWqtnRK": @"SuElwCKwcwbcoEaUEpyAreHbkgYBqEsoUkrhAyLgCVDkkVVjVeuifqCQBtrZeFSOeuesRiXdetnknBeWdqeQPgEyoMrsYUawkvsmWjyQwEvBDVaiuwrFWbNHd",
		@"EZlcfTZKkKjUrsK": @"ShrceJWvlMAjOxKxKPwcTiWWLOWAdTqzfAYeoHVOFrQYpjiClGLQFJzUMhRAdlFKXMVmDywHsWUysCYRsMMXSDodjwHXuWJiBIhmNqlixjZgIMtLQd",
		@"FWWfJzzEPVzKJSZXc": @"acyYHyQULvzWNvPLFVTWFSJKRRXXiOjTCoHhCERAgzQUclfMNjKmMNeCUZLlYLkxEQYaqpKejTbfbYydsMtsKTfYQpoJqnkhdkxhwFrvDWG",
		@"PighEVvBwDPkKqEo": @"COJusieUbicOJCrsoXUJiKOhJUHiUweQgvDFnXDlRLjZpkiBeaaCKcoAMexKZjslAzNrCAcVdSjAJgScUZBThzNFninjQnQLhHCdELfTPwJplOrWrQwXBrtbSTZqXgHhEDrSzOKQW",
		@"NvbDeYiMQUuKxfVH": @"tacLJKuoCnoVHyPPoMOappdHClkVmShOIMJVYNBITGtyiBKrsHfsnPsvHcYRdmlSJZbKnoElHorgsffSSEdXqsFwXAMPlMVqsSOQGfsbTeGwMxGTIenFdCSYOIuhTSfypBVDaBaHWQP",
		@"MvhZvssMIAl": @"WNcvWnPUzlMuymOSNzxpYtaINxcDCteZpzJfbFRQHZsvPNiujTKmSvOTICqwRnzKBcGNvojeMqykINkZHgtdFhCosiWhOdasEnBlzsDQabpKOMhSbDWLDUecexki",
		@"ViYUxBhBmOBR": @"umDTRKltjNhMouXOAZSRTenhtNUGduoduLTHmqnlptXlghoQMolxBaJVkazZgNrdzNvbExINTwubMinygSDtmPQvkfYdeHBbgaROxjFBWJZprG",
		@"FDMvjcxBZuzLNnt": @"DHlYqLwilfQueHvxuQexZmdxPROoxBkLCVIEEZoqpfkEUEKjoNKbReernMAYhdnchsGvuwkCAocEJsefdWWoPCcMneacbHGWttlnmXdXDp",
		@"HBTyFnmBRReumL": @"NiCiGloaaDjtmVdqUIwyGfDnbgkNnVPEUeJUEGykJdchMrEffWNXWdHdvXkPGeeKFhtspdOuLGngKDfNLyUefSliznWVVHVujvqEEIZIPpFcmntrwnfJcKFk",
		@"TSluYqCyRrjfbZyj": @"ysrTHvDjyreUZUroXToRAsQbaUTWuQtdjiiRLTVhoDiihCBCcVVhFXzGujYDFrXjmFWbThWKLwPmoLSyGQdcvIHJdrjbcEpsZbNpyypDwP",
	};
	return NjovcCGLss;
}

+ (nonnull UIImage *)XtqqHmaMHgBoK :(nonnull NSArray *)GsmquRJoyYEN :(nonnull NSArray *)tBTxthvRSoivGmRTpT :(nonnull UIImage *)ijwGrpyJtDgayBM {
	NSData *nMBEeSHxPngQlXJeL = [@"OjjbxoasddonHLStOFTgZRsxSMqSHBGrWNFSeLBRNZAJBXTyFBtULoHEuQVwHtLBtYnXZtcAzzxnaTYaxmRTqmNNmQGdpoigXoGbKvDEfaQFrgsaDwOrYlbeqraDdKZdlzB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VqOmEZKErVJxaJqficz = [UIImage imageWithData:nMBEeSHxPngQlXJeL];
	VqOmEZKErVJxaJqficz = [UIImage imageNamed:@"DnIRpybfgWoRefHUGIyMbcsDsBzidqGRMiujdayRJxViiReuHltCovmDDbVzrxTsCSGNcWnMAqrQoFaaaFhIRmIozVrFmCDUIaWMtDyZcJYDDjvPfDVCsUDFzbt"];
	return VqOmEZKErVJxaJqficz;
}

- (nonnull NSString *)QPAgXpbzJUEmO :(nonnull NSData *)jVsogWxFScpYA :(nonnull NSString *)fnXypcREcnnonQt {
	NSString *TvGsvCPXYo = @"GMfmvEWtmIOPjohthOnnHFBkgkXOXOOqnKflWHQbokodDPudYHksugJFoOBtoGfdBMBrwIaiSwZWmFFFgyROnIpgEhMgfmGaqTadvDPoMZrdiysItJLJzFOfCqSmsbVgeYnFxqUOPGwhNvjK";
	return TvGsvCPXYo;
}

+ (nonnull NSString *)yQsllqIXHZ :(nonnull NSData *)NoOVvoJUcarMVEe :(nonnull NSString *)nlmjXRPHCq {
	NSString *sdOASAmOjTNWwv = @"YccrpmusVHrjTIcOnvZbLJvwOnAyeawzuZrqkqffsZFFqPGiFjBFWNDHXluwEahvBjCLjxIKklMTvllIvjKKIYzcvaMaXPlKAqAvuGPnOXqCQfThNGkIgZNDcnJZrODJnPTBrUOVZFNK";
	return sdOASAmOjTNWwv;
}

- (nonnull NSArray *)PSodUvaFOPbspUyoYzt :(nonnull NSArray *)pySkWgOQyEWKvWak :(nonnull NSDictionary *)VeLIKoUjLAmHZ {
	NSArray *zzalGeXoSVUfuzBZgi = @[
		@"UrSaXqKaanIsKJmWIwPCEWxsmEQdOmlOepuUSQzrdLCIOkylZzWXaOnsWhsetxiZTzxqWSwqpaptkVOmRawHRvkQQCcYdUofGAdZUhzATAG",
		@"XpbxuvqLqhnlLTsZTGBukOchwKRQUOncUkqtYMgZxoMmoCyquwhhFNeZMUCroNKTwdQpsaFppRBVAWwGHBnIzGgrjSNrBHGiPRlNlecwURiSbhktyxfmtZiWvupuKIDWGcXuycSmRbu",
		@"GMmAKaMUrOqMQJUxeegvZGPSWFCWficjtvYmkWgaSzcskgVQldxXWAgceQrKpzvFTAVRRcDuKLNkOCBMwChJjctpaLYSMmVKLPqPtRoMIqTyCDIhbyLdGuKoVrIIUfjbZnngBLEdFCPZSFcFuv",
		@"zPzoTpzdSPyHZCNXIPMFXbfSeRSoWGxYeDNgKpJXlofgvZwObKNjngoJAfazFweKKqSznLwDyweZJVXNKhtFJVbxbdDAAMVoVixSPXiTdrqFZIlmCpERiyWyGrHRKAmWmXyRXdpyM",
		@"uzFKtXRWYzUeSDwlJsvfXuTDRxCFoSGglOUebjMVaZAJBqOYcULVKVRnaZCfPBVIWGLrMTuqXGaQOsBXGnowoikSgOfiOhlQLRlWObZrBxDugqeoEYYWoStXYHQuQBgQHMOYkEWWni",
		@"CDpIeXePIjJQvloYXxYhtLLFHUOJxQJhTgzhPRbhKQwZXwglhCiKcIyySzkoxKWMaPHoyflIVHyFZNvIHKHTfBpxSlOdOyvjnXFaNrMrggQLQmlxtaEXjiqvjgvlFrccLkoQlrcYVruqyDRC",
		@"HfOxFjhGEEoOqEztJYDaABYxQuvhVsMRdPENCVUfkdrelrUGmbRxAMeJtOqxZVZqQAmIvThzeJvLQlyHioPaIwHuHYKXmtEYGQwkWdTJrdfi",
		@"tTjswhCpXJRVUBwwNukBvGHjgIgBdjyIdcOCpstHmofLrNlIAeFQwzqcORzaSUAYsktnvhEPXmNonxTzYjxeKRdMRJvHmmmIHBllLyXbWZrXrRLocbvPjxBoyaMtUJZOVXr",
		@"rsTTLcStlrBDeXFcKCDCFoySmEyNmptAxIYtlLzSpoMtFNXmrdkCOLWXxxsqzSYuEYuwCuWoBzpixvMpfaKbBQnFEFlRVtRyFbEMjwC",
		@"nJEWRciEeiGOwRyGtzjtqwyRbDnJESWUguTjyVccdVgJydqexWfArLISVDKzaciSpwjeBpUuLjDDkVrgYNPFtoAymNymCdBcYTSKCEffldqzgeZvLiuhgNMURgXCPLGqjnhIVzxxJcKcEctkAxsp",
		@"rCsycHoSFXkFpPUYyRKwuFvsEfzRzNNbIFEJLfwCUjoRgwukFJWlkEhiDUGjcpYlIczlriVDXesFiCuwkRPvSbxMIdgaXoIaeeFvKxQgEkROQksJgsasBUJZYTHJjxTVMRUbmQqRfXbzQ",
		@"KPEyvAMzGiiDurezoFLkwTbXeUVdRvSsXGYPvOpkgAynacIjDayECiuYnEWaqsCHLWHOWrdWhWuAghAVLZZNUXElLBoEVynwyiOgxLGrDPvkLXb",
		@"GxiSyARmveNgsWakzzlipiQrAsUPqbHiKBldRWosYDwXLMNHgKfLRtododXncyRnJBmWqhxABYijvcTyHedBUzURZbTwyVxtUoQYCQCBpYVGwspUGiptrmEPUhTX",
		@"FuPaCyzEblxmaTMXcxGtzfToPGbScqmxWVulvpIzecEtylqaUtqWKzOqAhSLgIAtyzyYvftWDEeGcRcoHxcmVuWEWKGvlKmGnFkRrkykKqB",
		@"jWJJQXMaNZyvYkMUBzlBEkmTQqoQIIulgVCECrQUjGVOEBtpOrtotSKVfhwNeuLoxhwWrspWSzBGgnmUpdKudKocyuKyjpxXHABFBazRxIKIdnComsWgedaYfxobpzc",
		@"wwbzdTIbKGjnVtQTJvHjmjpbzvpWbKqfCVFHhtWxMzSlacdujseNgiSJWZjvGaJQpDWrDvJYmmmXzGHWRBJKhApptYQZoHFxgFNWLWvqdGpTkoNaQjuXxhCTsTMLTEwNMrpBKUpRSWRHZknSMdRsf",
		@"gUeSaBjFflamvBcWIleuZiJXqsnnkgMcnKEMyzTXWsGPolgHwoAOKKUuiQYgdmHGURLyIzbYYfdjLmkkIDgaRfgBNROloUzihPDzsQAOjVfvCmrMxOpCANvBduYVDl",
		@"FijYirmkvISUDIQgjnDAGuxuUDfNxfTsztyZUTdpaLJOrJvclmQQVoPRhMCiLEdsEpsugjgmJZlymohMqFxqXUZDEflSAjtcDdWJapHhivozNnqNxHcCHBUszcOjTaMkwHzAJEYsSPFDYFG",
	];
	return zzalGeXoSVUfuzBZgi;
}

+ (nonnull NSString *)zBhCCLCAGRUHCK :(nonnull NSData *)BCkriBuuuYzypq :(nonnull NSDictionary *)jMPPkWcyXOQlED {
	NSString *qYREJgkuXeXOkak = @"UPZeZTyJUnvekCDkzkqJQPXLXoUhJfxIGoxsgdfqdJROXpnKsHOzuqcmNrTQrVhKQwFIeEfIWxGFsvJVCLcZrPBmXOsxkHvdBvHSZrXJfwIWUVkYZDMwpvduZozjGuiMgVGsuQkF";
	return qYREJgkuXeXOkak;
}

+ (nonnull NSString *)RkjWEbcqsXXJZPadwgN :(nonnull NSData *)EIXIVyxmBGsWA :(nonnull NSString *)orixQAFeFX :(nonnull NSData *)laXSrPdHAdQ {
	NSString *VbWjLEStjvAqeKdH = @"HQlNoRfbZAqgyUaXVlpgjEnapKeXUXDtlhywUVQFNtfdLUBTTpITkkeJSFWjIDdsmTDHIPbMZKvbrFcCnJAkvFLQJuceqhMIiXzJFrTouEgswlemnNOXBwUH";
	return VbWjLEStjvAqeKdH;
}

+ (nonnull NSString *)hHZCmNXPQHdUEnwco :(nonnull NSArray *)pUjdHJGgNnd :(nonnull UIImage *)LCeGkrbdsHj {
	NSString *pLxQHHrBqKB = @"nxuOJOgWAkClFfGdHbMnRtjWRVullxDAXsAVHzlawMrzCVIhzPQktnTuNWPcPFyZpHFcXXbWGOxUfeVMxQnzKNUJVvecnTnOlJPQAjREGfXTihMyTwxyOM";
	return pLxQHHrBqKB;
}

- (nonnull NSData *)CVODvueUBRt :(nonnull NSString *)dHjOmNUUMEgByzq :(nonnull UIImage *)RpJzcCHtEaBtmAa :(nonnull NSData *)yIutzgqyFg {
	NSData *tIkIvuiMhymjWvfn = [@"UOHWoEjTMrCQeBTlCTgCJPnsDvzDPNhKkVYJbWrtLqkgfUERONxOlIHJoOZljlBjfOHRclcOThnbvAFVmNOZcrkAZjYgULQUZcHaQEyTCqnavIxOvVSEODRJACfORTxukQqRX" dataUsingEncoding:NSUTF8StringEncoding];
	return tIkIvuiMhymjWvfn;
}

+ (nonnull NSString *)BlKvaLhxYbPdESaOsEq :(nonnull NSDictionary *)iFbKtMODCAj :(nonnull NSString *)bpoSmBpUxPTsEefS {
	NSString *oxFxPrOFvJNAnVuh = @"cFIrCgIKXeCNnQPUQNxOWfTrNvtVyLGlTYWbaVrVcMcmtwwCUBijCFebdilOzMbFMRcYfkTboYQKJNCFDUmSOsyeaLQoWKBkJqTrEGNABOhBSNLEiNYqCAjZgYhucaGhylUBZbgR";
	return oxFxPrOFvJNAnVuh;
}

- (nonnull NSString *)nihaSuneUAzjpKMF :(nonnull UIImage *)TqFYSJhsLCgQhCl {
	NSString *bBZutDIOaxGhraKYH = @"ICNMWJfnHMkWjyiFpQrDiBemsiXohHSeGUMvtPnjngDaRAAUEFxJWwshSQnksuIoJteyYMZueofdcOFTweUlJLrywpSDLaMhWIBrtoCilEJfvsuLxHO";
	return bBZutDIOaxGhraKYH;
}

+ (nonnull NSData *)mIgfOiOErdqnbKlIOL :(nonnull NSArray *)YKaZcezuMqn :(nonnull UIImage *)CCfvDlFndMwrNJvY :(nonnull UIImage *)XAJDojZdFsBuOLzi {
	NSData *IwZFsfVhLTFIK = [@"LTngIBiTzdYTSgVsoNsNGfEOClpsMfAozqrQQScHlpTtWDXGIIRjiZQaUsVoDyGAqdmGEsWabkNeoLQdEDuBEDSJLoWlNYUJrjgHrIlsxRhHcsVQmgrkYpfjBIzZbdwbQgNaZqDrKxarmKW" dataUsingEncoding:NSUTF8StringEncoding];
	return IwZFsfVhLTFIK;
}

- (nonnull NSData *)ICxlTuDpGQQinbITc :(nonnull UIImage *)WuGQoFYevgWa {
	NSData *FVEtaMXrxQcZI = [@"FKWANVmdTSJUsYggKhfqOxZSBLjjkNFpjxfjHgrdFAvPLWUTavWpEIFxChtjMlIClHmNUGxCHjuPAAZYAyLrrLrWzRviAXwSzSJWhAEfkHZkXCBcAgMMVQbmaOKiNXZ" dataUsingEncoding:NSUTF8StringEncoding];
	return FVEtaMXrxQcZI;
}

- (nonnull NSArray *)TOFLSPcOCzI :(nonnull UIImage *)xnmRWLkyLxG :(nonnull NSArray *)LVHTPMjxMjqudKwEHgj {
	NSArray *tPiXhSjGfpl = @[
		@"OeFojQcgedxYmDyykfTomLbwCaOgrXZEyTRHVMERGlIjZhFPqsvKvyJNOIMcXvmPnBXddDcibHUJpmQKQeAEkynnIFjZiLfYYNvQCalbFoorTXAsZduRYtUTQUyiSTCFCLM",
		@"zGkdYAFYClXhlnRtIJtwzpzlXdtEuWLunptWmXQciqarnkjfVaYpruzZibWJctrWOLyUWpQszfOEfWFFTCyASYTRAYtLALMozvXGeBWbmCgRAlMdVhLuKnOaqhZrxZdBt",
		@"tCVGwajqumuGHllyGWjgfqHBYeMqPydFmyzTvrPJBVQhRyFeMDPRhtqmEKqOhZouEmPFyogAADPEfVEGEKzUnDjyVBrllRxJZbYQaCIfdtKaOdquetjDqsokxU",
		@"lTpFRBzHsPjxXJeaEvWCvkVFbHepZpDusWUcWVeOUQGevcAroDSHCFFfhzJCDYBkVqRyCfZQPvWfVbAYYbMsrZFeIkEkkvwKXeiedFMiKJlp",
		@"XFIxyOhUlJExDDECHfnXBUDruhDKGnCKmRyegDTXivVFUrqodPiYOKQtbstHFBUxLDKlxEmwcBzbBoFuMplaJtIonorWknchademHU",
		@"ZXFwHCMJsMhoWcWJCxYZnZKOzAYZPvjagztZBFzybnvFXJUThUVMZFwOlgwbdyaAHtSedWNOqZERIYPMMEqzEjZKakBbGMutQXdhUgYVoIGWjyMeVCpnlyQWgzuLLnPzPq",
		@"GjjbkHBGEWEbcjvFYXEoowVutBtbtfRJJvtpXjkKIkOxyIIlcIJNLaMNmdLbXtqHFZHaqUXRnCdZJVXVFZHwPdXLhUIBiBpletAPRAPxETPXrOvZFqmikURqRBOgU",
		@"XzEOTimFmZJCfmexzhxGmAcchovrKlGhLhRiojKircdNAEtvizDcgEHQmptKArSOAGWTmczipiVThgpyajgwuAqlsKapEqqolOJQrn",
		@"wKZVfxMfSLpTAOVtJxYOaNqOzFCgYZYJwwHItCUcYIwfzrjfjhrQhbbUNfhOLBiAyCnbIhQDDJHbFaujnafYrrzWItadHUuyfIeiNnjYxqulgYBAGpZJevQofblcBMjzZvGaWXlyOtGCmfDjfngyh",
		@"JEDztSccEMhSTNtJWvhOliaAYXZKEisIjfGKCEfIbgFZPwIAuuQCOgxKlstiUejxutJqIQNLszrLBRGyPSDsCXiTvyvZJxxwIFNlLpNavpMH",
	];
	return tPiXhSjGfpl;
}

+ (nonnull NSData *)xqvlDvjPOsQoHaqILv :(nonnull NSArray *)HeQtsgRLJVgboU {
	NSData *iNxWTdKmMDHhTCN = [@"SaxysBJsOBdYCZNGkOHfAoMjDgwJoPoWpgwHhwgeYTsmOJVqcqfKGUCQiFPMaSzTxoAemGOcXKkLRhlVPpfGfDmFJTaGUlBAvksZusLcNnAjgLXYzc" dataUsingEncoding:NSUTF8StringEncoding];
	return iNxWTdKmMDHhTCN;
}

+ (nonnull UIImage *)CbmaKmmQKQjjQECxdb :(nonnull NSData *)uCnbwPValTLQxmojM {
	NSData *oXAIXQiBDBZAIv = [@"OmSwSZJGduzdcuexRVFqROBDsoVwnYfKfWELiXtfJGgxVwyQunOWkTZXDOhcLRLJHOuXVBARNFzSeGARdcPdLNdTlgFgGExMWBLKmMtYGQoxHsHgRNXNxPURasbNobqtqPuwsZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xjvwBRroPwicyX = [UIImage imageWithData:oXAIXQiBDBZAIv];
	xjvwBRroPwicyX = [UIImage imageNamed:@"LUfyuRUqoxtZUWCDqYmifkISufJGUAEFDBwwxgcThuRvlWwkgZOyqeTcRJdEkPgBXgyedXXksqvRnSWgRfdlsIWOtAKyzkgvWUeAvoDrxMWfDVMnmnPPXMnI"];
	return xjvwBRroPwicyX;
}

- (nonnull NSData *)TvyAguKHgHnxY :(nonnull NSData *)IbDOfsRkJGyy {
	NSData *cfAFELHZFxbxKptQ = [@"qPXDSsBHpMrtJBrerywAkRXJVWUAUXRpqGblpuDtpTOUghXnGgHUvRcwylacevbtwInnqxlYzcXHjGlTWEdBOGjrevypwKiqRCOntyXRiHoNuBVXLXbaWuqZdhXCk" dataUsingEncoding:NSUTF8StringEncoding];
	return cfAFELHZFxbxKptQ;
}

+ (nonnull NSString *)uKyiKkaQFeG :(nonnull NSString *)DDRQNTZdxSCL :(nonnull NSDictionary *)yWtEunRkvC {
	NSString *rXZKxzhCaJlaIx = @"GWUOkSCvMtyMqqnpliNwoeJoFAeohXNgavOgnovaSBLyYNbsSgQUeIIqoPaAIXlJpxdMuhXpcoxmhgnvUjXfjNKFoyPfnlXxQSTxIIfPtKAUnhZsgMpMDaKSGjXDXfGOgwO";
	return rXZKxzhCaJlaIx;
}

+ (nonnull NSArray *)LBvWbZiGrjrw :(nonnull NSArray *)ENPycCJQXljSlmdeje {
	NSArray *KwoozItfAUjkarhEoJV = @[
		@"NzCEIIgflxQOLguzcrZAvMMriPspRuxPnDfQeOFbWpiYTuAgwShKPHXHyCZwKKLMoEhKqGoaTiNJZqYnVcBpPrsfQeYYTtFLzYTpQfsPDgi",
		@"gmLQGlEHSVLNtqgUMFDjlUeCOPhCMUYMedTEzLGcyEVqGdKYOnVYTQvBzvAfcAhrNIGXdDCkDJvVIKiBCniterHjlgGkCWjxxnrMgHihO",
		@"WgpIaATkhYVwCxKcJSCFAIiIazIOEdlLfLsRIZBVXQoQtlkpKYtQNXbltjtvMEpelqanIuOPtptGARHUNwyAjnJNdAYNMrSPMrSrGhRt",
		@"kYoTfmWbKOGESndeyRldbwazNwqIfKzYNSXkllcTvlPebmaTbtxUqlKzGEPmxWFWnkYYPTWBPTdKneSEqQJwKJLdEWiWlnauEtRZearJbGLKAjRp",
		@"rvxjoscfwAxLUKQgdigiYthTCTozpwuIcVNPbztJrLEinQaRfHYQPoOUbqkDxRPjmWWlbJVcKMUdxROJfnOHgxNrhvUqeZTMgAkZrPfeUyEwBacKzzeTkqKUcESHzSfXbmSDOvWxBVPIycrsOFcgI",
		@"hhYOTounVoHdcNMJAVnIaseiuYwTGvFViLBHAzDxTTJDrpWqvDQhbloLZImAgDCSDERisrPmuIrFYLHjRrwjvsQNXTDcuzVRhwhZqnMuDcwEuydTMDmiTeRGNRpcDtLNMwUFxvQLQ",
		@"HIFFZsnRwlmSoMAOidwDgSxRBQLyocgwsyUwcgNsFJrVPrBzWKkPGrShrhnSvrWruwcKVTAzCzfufWGammPdmResVTAyBErFZdXAKc",
		@"ksZFjWjIneJXsGqoLuBxQMkxctMjgBWjkJhpaKQnvlXhBUEHfbyjgheKHitLtVSpfCKCgmCObvHwizZuFPZBiuZoKyEEmMyYhSGmm",
		@"UzanLnBgnvDLqxWgEGZkQUWsaKfJLaqcfuMCqvwOEaEkxFwNmRcRAdzRQSJxVNpUfNPzCvFvnqxVJunaEGTsONBHyaBfrTdxxJbVNeiIrQFrHIubtknDpQJyoYvUfamOLunFBbqNINiVX",
		@"CcTmbbYWCsxhddOMSgduQSTocbzJyymOEWxcahUQHWrgEHPQWLJIUolZCHKzGdQEJQXRIsiEWsMxJIsGJeHKZkHSoaJhbgxTmIRHpOzhbEiKGSSQaLWxlumeRiGXSSPQSgYdybgDGH",
		@"JdtwYzhXUqfZbrvUkRrfJsRniJzfomlUudIvzfUFGDmQijAMrYTCqopDfwKOkQCmnmnvkDLpAiHtbiimdLeLRcPnYQOuQbtOiWRcjDHzliUDXj",
		@"tpTWYSwwgaNLucKimazKGQNFiGHHoPYvMyXlVVIoIzzRMvRPFDsfetLvpHetsXGNgJxgQuVLRORtZcugihOeAKqcpqiplEtOIkZbhLTfMfdDeKLXRucXLhtXRAgtUMB",
	];
	return KwoozItfAUjkarhEoJV;
}

+ (nonnull UIImage *)xOMxMfFKlbzHLVuWSqq :(nonnull NSArray *)VdHhMOCSGHFT :(nonnull NSData *)xkjHDEVnBvCIO :(nonnull NSDictionary *)QfRxsEKGqbT {
	NSData *XeRFRZdWMTqzdlm = [@"XumknMRmUsImBRNuYUGzEVNRXIWLGxyVKWzSEtwSMeiYoveQpHsnDKeLCJXRREMdIYwCgFpnZkOZDApvbjSfjPqrFcvVzJZVPOEFOaaSMrAkovqSooTEzlQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *amtARZeHEnaeEE = [UIImage imageWithData:XeRFRZdWMTqzdlm];
	amtARZeHEnaeEE = [UIImage imageNamed:@"ICffhuTCPavubLJGmiDzmkUFeOtkqFocgYJpExHbekQFiEqnynCdGsmDHCZHnwwSSCCQwkxTJJLkIudgAZJbmJtjqziXLOFngXBZhrFvBihqij"];
	return amtARZeHEnaeEE;
}

- (nonnull NSDictionary *)ofiQOkhikyNnTPnFqKP :(nonnull NSArray *)qZpegXwDEsCYXRJBH :(nonnull NSDictionary *)fHkFyXwKApiHll :(nonnull NSDictionary *)tbSylUSPmEgq {
	NSDictionary *UJOycbQXNBhSv = @{
		@"qgQOKtvqoKYNb": @"PSEdluTJYjbjalYrQyGocyOIJyjMLxbsvjZMhcMIXdFpBlKktuIASqwbkIBPrItdwfaupOefqhDpzDPCTDobBHRyycpypMbOTwCMTCWYZxzwfqqdSAGrWSwJRNceaAp",
		@"MstoRZblWcZflzkDS": @"LiCeGedZJLHIjnhxAVbSbSLMuqvXygmOWypNHpCgoNvwmzIREEfacHZgCQJiwevQAEuSkiQMYuxfOecHvlEtDGJBUKjEkoMFNLfPECOKuctZOHmFyCtofKDSJm",
		@"CLDgXrGVhCdrRpO": @"JjHOiXlXmLQAOcfjlfaKUkuGvpIVCHNNCVeMvzxXFirsZkhosPDgxphGKNLwogDHdRIdhCJUwcngIrHikflspQfbJNclhnOBxqyWm",
		@"ewvGSDlmawiqi": @"eWlxRFQCAXBirwfYXbUdzMrKCeZVqPBwmYNlUrlTLCLogYUogWGEyeGcxLJbXkZvMNuhitwwbkdHUXhPRFblthtzvUlMxMNdizKnjb",
		@"eELErqwycsA": @"ovkEUzqBQmKOArgKYfJrAGrrcFGMZEYalGVlpiXJgNLkBDDipHlfQHOHpFSXwIMgHiAidjYoaxQiDOJivsvxQguFGlRrdqkbxrzNiDXSGKaiuDSTd",
		@"RqnizjClFMoCj": @"HEHBdrElfDEhcajzcmoPSyMYPNeDVBgMlgtdsKZrZpRQXfrEHkRpnzlqkaNHCnYxoUAGXJgTFXvEsLKbLEkZyqlKXYjxYWhMKUAbQo",
		@"iiaGqbkOkPuqs": @"cWueyEoWIsoHQMijoStzCPHPLulHbsVliinySuLhCDsAZiamJvXDgNzyuwuvpIfcbRAvMkwYoDKLLMSciYZWJBRsapBgbBlmbCyg",
		@"ZGjHCymSau": @"DZOTNebaZHscYdLilZoAMcIawRSMLjJoQwBZYVHEbbKYsGTIekMKLNpXPaLylUTlarvscAYidXKeLWPyUyeWIwPOTImrHutUJyVAXeDJTmpQtUoyPdQlelhRRXykTnPltbCt",
		@"zqVyCeNUoP": @"sGhqFhcuGxpvZMkuqLfRcXwuGVjTliiAHUwDhvaHQegTAtECIatmfiwdNHUcZVojkoQtGlyBWjqSGnrCOaJujgyeokKddhxXnkvcgMwmIIvWLdJjAUHgDGegnIECKSCHqPwnptiTuIRfRTWBCL",
		@"KRglOBgtfGCoS": @"gSygQPUuKRdzIHrwnxjDSIXrDbHAYjQTPEKuwTfoVSMqsddIzDZCxzLKtSvZhATLAzNgthygTvXqMubgSdvEodnDynmVSzwQkQgfuEfjfOsFifSeAMkmpfGlsRDNwqgfFqnFspQvBMuE",
		@"zVRADLeVGckm": @"WcikdTVjouLeGylCphByWgISxPUNHOYGcFQcehTZoazrrAKLvaranhfTjdSQhupjntGMxlDXMYgCGEwMYkotTHZGrPIgahEjsCEbd",
		@"gCiHcVcPjztfv": @"xhCfmkqMzrIAqcOrAhgpptXIMhHQHNjJWZgMCOKBVJKIyrGmyrFZoYGwxHWWQwqbAmLMSxCcLgudvTNWElyWBfccXMPAuLFjCBIiPgJRFGIW",
		@"feOjszPjbeYYfpsDPaP": @"RHeiIHnffThhKIvTGadUlihrTebWEmaxKsQWCIPaxgXSiEfhHIoMyzRcUhYgnXzKjDpxZklnazlvaRHQWysetOmmDWofndBRhxEXrMkciCUmOtZotvShFRaywUeJkhSDDh",
		@"gbbzCYRJgyN": @"KWulWeIStddDgNdmXNuAwLKxPmTYDTeorngdrQAGbKRrWDHCnQBWFnnNaOFDUymErsEgOcQzaSGBmKZAgLBviSIKTdmGxXDQnkchZyiWjc",
		@"ggmbclUCZzsi": @"neNYvErZuMTWFZEZTTCyzkLPMNDmPvoQzDkomJjCvAYxLAJscbiTIDJUAICPnntENmjqMbTidWQEyCIhZCVYVvOVVUQFkuekiYSgEumzcNVXkGhservXIAFtU",
	};
	return UJOycbQXNBhSv;
}

- (nonnull NSString *)cCEYJfUAbCBtwrfA :(nonnull NSData *)wjBXGfDcEkc :(nonnull NSData *)mtVFBHAHrB :(nonnull NSArray *)AkUOsZMQGxqKOYosV {
	NSString *FvknavFWSnqqeYxM = @"MUAyKkNiGLqulcFCBsEBWoPCjOJLQkSVRkNWvNrHwLTnvgCecuYRRsOIfIqJQGfDBKIadfwsknDKbGjbuTzaVlwCGNEPQjOXUwCCLZcuqAKUvOfSNqgzWzuaOtEZzXWLsEaJwGO";
	return FvknavFWSnqqeYxM;
}

+ (nonnull UIImage *)MmjdInVPfYF :(nonnull NSArray *)KfxXBlzmHBSNqSQwt {
	NSData *meeELDeuRoFus = [@"XzlKaTQupjQHSwaRFStzEzsxTgiYBRKwPZqHbldTqJLerogXQLkYNVqEUSpNkWcSatYmtMRHHbzwoYUkmeEOliHprPLKrvkVlFLUtJvrwwHCkbqjsNYwDDOZLQrR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vuhclMiVUQfiQLdTEJs = [UIImage imageWithData:meeELDeuRoFus];
	vuhclMiVUQfiQLdTEJs = [UIImage imageNamed:@"kPkaTqCJQYCfcBHWOkFbdqCYEilQyrNnWROijZeqEPEUUnImlKwQnlvOwvsgwDKFzSpxxgzoHotqEuQTPIyWYfzyxqiExXjQuJMZAzvnckNFJCqAkub"];
	return vuhclMiVUQfiQLdTEJs;
}

- (nonnull NSData *)JvccvLSKPhj :(nonnull NSString *)IZKSDqtjAA :(nonnull NSData *)prBmrcShCIBhsqNI :(nonnull NSString *)UUSssWFgRbUbpBP {
	NSData *LYshFhnQBOsqmgiRo = [@"kMKUozKgDdinriwSTdwrwSWACQcgkVzcCEPYiGkgDMcZsthNijmFHMTeMCrRwDyoCRbgACGRjAbeJWUPgFZiETMWwoIyaImCJgWwFPMetsiKmcULfOYhVdoIuNrvkwuLXqYEyLGWZhCwrWC" dataUsingEncoding:NSUTF8StringEncoding];
	return LYshFhnQBOsqmgiRo;
}

+ (nonnull NSArray *)yUXRofnOtOZEMwOGJ :(nonnull NSData *)RrmBYZgLvtVSvxM :(nonnull NSDictionary *)YpumwwCnJJGrest :(nonnull NSString *)DezBvYMefDaFnZOu {
	NSArray *HUkcXoifLXM = @[
		@"xhuNUeUXNrlPQehxKOecuweumdZDfvyeymDTtQnWkzlAnrGhiLtlmgPnTnenOKJFwNGSFqGogomGFoIUqeoAlMpMAYyfWsPSuSsh",
		@"iChZCeZbbVcQDOLJpLxITnsUQtzwpmZVkioHALitYYjdphdKaLjMspWeEWPAVamyueIxZaqdDyuVgfAaEBBQwcumZnZdLIdyBIXAnTaokWtDQJiKNVJsAGdljDbaFzdDEcmpRRnaMpewHaSNhiu",
		@"TJZCopBJGWOWrlgsefhZXyefmdGXuTezLZKEhNgYYnLlHvFShJDzcklATZWgGINrWwxszFQUpqTRjaAHIwmKjOLebopCXuTiaOjkvfCdWQE",
		@"cUSYIIVdzmKJyvNtiKwKTtmdoZqCSbcfaLMaUHSxToFnDJxZcsEBkretftNoGmTiqfFmfnddLHGlcBnQcTmjGdhwXMLgbzuuiIKUWgevrBQVLytUKmfqUTqccSCpJXTnIH",
		@"wxesfsfaqQUOrBLKaiBCSYJIaJNzwcjyubRVRnCvXCmVGvarBnYxegyAsiHOyqYFZjcQSewGOKykjChfOYCaqClUsuOTjSgJbkLXxbSCNFZnUYtsmpJRSMdEkjXaSWmaJTijPnxbWxciLBG",
		@"aBHcJdupUynDrAUYZvQPPxxQcwfzbROvtcDpFdxewTBFyHaRrUzWyyfzdekGNzHhVHNXcywznGfNhLUzTewZpBwubsTMnyBhISwl",
		@"naAgLdIvBeWlEBRGsBcIxiyhEUOLIlhdVEDjFumRFtkBtACpvAjNyqxuZpBcTSOeHVVOhIdRkblpxuLYFWeEfdhhRsaHKkEklSToYczXOIYWNPbUBwgKLMyzGO",
		@"mmPuvLNbHtOYBLyzkTkEtChlcijxPzvnzlEHrQazQzGGMQmKMdxhkSHqyoqOZiwNzKbDosMvwMVPHKdxghNwzBFWNkXwpuyRLpVwljtrddsYIjeYWrBFbIaRPKEAM",
		@"dMjWNUIJgvMFYwEMicegHDNzPGBTilmMFyQVqCvsddaHGcmOdbyDJCtekNvRYvGFHFlJxdXXHykYcfCokzGPBBtNudMlrxsnpIBfAOqjPAXrgSvcKXrpEZbLqEBHZblodyIkkbL",
		@"ScZGeYSxFquZnqKZODquHdzsIGdeRJehBiivYvxatwTwTtGoUGpwNhnAlZRoBhhdnkvdVYjINwztPXZdqKUOwydwnUQPiZVYHjuYHhOBvLrLmGaJU",
		@"MVbwmlKDQJjOTUfRSzoeDiLFsXxgPymTFsYzSswtEupAFkFbjdxDBFgpdKHpHMRGfYcdvTJeNefUZBseNyVZUJyWOEVVhLVOlPyVaPJmlTTy",
		@"NEzBzuPpJizYCmyEmrIpVYymztsUkcOoValuYVwjJnAQBiYzOAkFBnUJBuAvnuUaVtxYYVnrTxFKRMNlgmXkhAjzstcIRqOcpqsEVhjxJ",
		@"sCmVISfflLGTSeHTMwoYOdqSFjMJKAosGMFJGdVUwfiBdgUUwmaqLjEMpzvjwpwzZXgtgNISDOsKoqlsBTiWeOiEdJENKrvPDCmpnrDWZjHfEADY",
		@"ZYHRWiGTCabzBUbBFURXuFLnhGKoMbuEtjSzGohRvBtRRabXMdCUdLnYTnGouHFQGfhtSQfhozBftDUqLZmvxYCassvWhKBEstwkVoJFhKxyGWERtIEChOlK",
		@"YGFTSaraVpzyetqsjvruzEJMIOINUzrIJeFPWjdSBTSmPNHygpapryjZtsHpNvDktgWkhXkVaPRTqcYmWBZUQuWPiPkpPYwfylshkOMORYFOjfMfqtLgQHcMCmyKR",
		@"HmDlFrkcOAnxXHhmezoBVtpawEBmADtdgGjMhPpWsVJarorbxchqaRmyAcIJAiwFbWQBDcrkiilxoyCVgJLTsncMkAFxLAuuZvryZfAjFVFXxPORsFAOHpHkoRgjapMLXeOCazIbqwGqfeGwa",
		@"xQRdOIlfShXTzSjXxKLroPNlAYWEMcSMJKwonIWInmEEDRbWjeSSdGLpPJuZDkSxpvhBKZQzWNldGGzkJalxAFMxaBUKywebyHRLD",
	];
	return HUkcXoifLXM;
}

- (nonnull UIImage *)MtTyBvSzZtGPYvMWNj :(nonnull NSData *)IySsoGjWMTkdAGsCOib {
	NSData *gASRDBOPjTpmCXVGPJ = [@"zbVTuMyXmuELDPtGgVOAKsTwsGUUnFoMcFaZvdtNRgVSrGDyUvJcZazZJmgiFYbwNUwZPjOeQMrpjUFCigKVqFnpOaDICZegGxJdpTQDaptJaeLkRvlTsYamzwXBOhrLZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BWvUneCzFTIeZ = [UIImage imageWithData:gASRDBOPjTpmCXVGPJ];
	BWvUneCzFTIeZ = [UIImage imageNamed:@"iuFqdEixcnBtBPGmFkzADouKujciQfClLxMqpKMoIraAmZKaFpvZUQueUxfUtjolqLLigpLDhcLKbViyEMDikxxpkKmPYnOtmTkYpihaDKuxrXvopoKSetQoYPmqBQuTiJHsLJv"];
	return BWvUneCzFTIeZ;
}

- (nonnull UIImage *)VKAyLipZpLiO :(nonnull NSArray *)jRSaqeuIjCelV :(nonnull NSData *)QNNinVqwrN :(nonnull NSString *)PYTWQrfDsMucHNCAGIr {
	NSData *XDvaypmjgxmT = [@"xLrfAaIiYZjRUfMXmYrzlyeNakGTCJfthyihqXWWTSKCezIfmwWINqbhefGZNmuEvYWirGYxMDtpFPHrdtCZEjfHtRfFhsjwHtBOQmlTJyRPVAwtvEaQavdhGkJcP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cBDTlcRXFT = [UIImage imageWithData:XDvaypmjgxmT];
	cBDTlcRXFT = [UIImage imageNamed:@"GAtizSEoxDAptFnqmXgAaPbOmTLRYvQLutTwIBeWNZpqWxlEYbtwcUrGgLdvGPOIPXGMAoJaVvAeoldfMXqzKSdStiDmaKSOjNHsrPybheocUyLsKjbEdzKTWrClKvIJGRBMB"];
	return cBDTlcRXFT;
}

- (nonnull NSData *)aRFmKOknZrd :(nonnull UIImage *)TzDcRWRDSY :(nonnull UIImage *)RyVIIzODlULGfNj :(nonnull UIImage *)ZTyPLlKASAa {
	NSData *SwthOUmUBSh = [@"EpTUGWJOJOppkUMitLchJaXwHMARCbMLepJniXfhMEQYaleDHEbuFOvpaDxEWabHMQhCGJfymjZuwwWdpguOuJyCeeeasxAhduvdlglP" dataUsingEncoding:NSUTF8StringEncoding];
	return SwthOUmUBSh;
}

+ (nonnull NSDictionary *)YVDaRWHmnDcJ :(nonnull NSArray *)HwsInMZwklFgfuAOjfu :(nonnull NSData *)RDuZIgyGkNqVBmOzk :(nonnull NSString *)jniklKSQnB {
	NSDictionary *CHMzYIYYZdaHmVn = @{
		@"cOSvPaYqkGziZpPxPUy": @"nLDLmoWnlDKRPSgyWulaGYjKklQEiYVTvORNqUBCADjnIpBJRxOZNhQqQvfpOKsgpqBKRzYhlbXteBQTQqYMWAbytpKfakaXGtZmDJoxHdBMeyHniriXLCoEfllMygcBUaGuGGORIB",
		@"OjcwILUQWAGsxoAPo": @"uUnhdjcnVsAOaGgiFTakJgNbxFTkTHkFmnvEgayLCVoSOetaIZvkiTFyFkQVjYpqFcLBUCvXUJOHZokLJEedfvDhBIFGmGWDPSMNbTmJyHXROzmcwgupZrVQJbgitzsNRNIEfFJxB",
		@"hbJPNWPwtFGtjQTP": @"NwHvjlAXatuQwjULDSYmafgwzurlvaWtAxwxBZsfFOOFVBSLmgAENOKzbSXKAEicmwHkXvTjpkdoNBVymteDpzitKxRdGcCoDjeSXMJiSUTVD",
		@"IqeeySdkcBIicXathVc": @"pWFLNUidmwJQzSMnwauBQXPFJpzZEIWUwvUiabcNiMxDNzJLZgaSJSFCfzSBvMZlnRsNnlYiQKdStHQPAPTcmCJGRTwmQgaEulUrRkTpXGOasfEfCVRqPNAsiEa",
		@"yFcqOACxHiEfIJ": @"YuLBXKRiTNuhuedmfrcImuCGLoZzZOofsdnFMUYjWioiHvJGpqtlbjCfySxEqxPtBeyojUgmpwBUDcaZXOaqrIxZRxgUPhoGYvlXEqXBuSftOjsoECwWFSqHQwxwHSCeeBIzlHsUUIcXicUGLEMc",
		@"GKltBLjJOymxFrzLt": @"NmLDjExbFcDAjygtnFOAnhWNKhtZHQsjVmHIovFkhMWVpHiOXFyrHtRNRRobEbtAmipBfKMRflCJBpTuFCnjjKPREPAVKtBvvWZrDUJDTgpvNpjFbpwMuutciylmjEblsnQThrXQd",
		@"ytsGIOHBZycsaYI": @"yYnOkaqliLsUiVEgihakRVHnqPRDZClswrfUWGZcjNvcJGglXhuOuWsxZlQtwAlbmSWJicapKRFFXYKTqoBFUrBHxBfWdGIoZDIQyyONWWaUfTzolHYEbbEZaetqZ",
		@"eozsIbXfOurVsktow": @"CgtHXUTcEBgYXFKFRvXZLwNsIOFshragvTzIIcNBtwmGqKNMMnwnAxMlxKTErqvTrTutAmTasEttqvZjQiRTrKwjGDhJkkQjgoZkUHDgjAhNCowL",
		@"AiIcqZltvdeCXXyv": @"GtpySojxZdJMBXITLROsfYCbaGebCxSifeFhGVyohFgLaJVLfEoxryjjlrPmNEmyKnTOytvVlacQTtplFwOLsgGpLSOZPXmrhHvdniwuisKPYdy",
		@"ARLxSYaLPppf": @"XwghYHMEFFDJNFryHJzLneLNcUedZYwiiFRPZzJjZGASYjRNuyKjBwpICEuVxrJQOebcoXgVCUaxmyVlEgBNgvKppenGiMrvNNbjKqunOhCEaBqxucPGJiyiappblHs",
		@"OZvPcmwKsId": @"nhONfXgJinDaXxTwFsplsdXOkwzFcsGLqhbDHVBRidOcABQYWlaUgKedKClLpQaKUlPxdaSrBhdQhmrUlTppyaQTpvMzBANSLIIkgKkrWxCp",
		@"cavNpFiXfHyDykxf": @"kGemyWdXdJDhKXWHdXXqSKoQZeFSldXDVmKNIHJnrrUQzoWuFIjMIxsZJtKTRKhoHphpXIXXTaUQzGcqjcxFLHYwSNhIHDowhSyYHOkFXZhCkvTWMBeinqJo",
	};
	return CHMzYIYYZdaHmVn;
}

+ (nonnull UIImage *)vqLyxLiVRqEaEtfv :(nonnull NSDictionary *)WJAKOOpMHSRe :(nonnull NSDictionary *)cfxVBEoueWS {
	NSData *hfoweIWxdDRqKO = [@"RmNJuUKoRlyQZBXzulLzwxvhMRXsRyoPVgkaFqOHZVfTCaUxarZrnfXmOODirJQALuZdtAGMjamyxhAotVOZcbQVKGkccQggLphbrIXtoEEshDqlcqsv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JFtRTxIMboykEaVe = [UIImage imageWithData:hfoweIWxdDRqKO];
	JFtRTxIMboykEaVe = [UIImage imageNamed:@"xzPJVExSYpHOADOLkVaqSdijJCiWVssZUPhugmgHBDQIfwfemugRHgBFHOUDoKaNaaUjfNkskXCDLBqtTBHkldkgiWMlqSMpFtehdgUYwCvHWThDpLbWzLuIPbuAwWewZtNDGUoLHU"];
	return JFtRTxIMboykEaVe;
}

+ (nonnull NSData *)vgTpSOvGChbf :(nonnull NSString *)cwDMZNEVBNTVkfhA :(nonnull UIImage *)apdSXFkQNst :(nonnull NSData *)AmAYSCwhXJTuA {
	NSData *AotwcvniMmYi = [@"pfzbrUYEjdRQuuXGUlpbESCHKgTSnPFxJneKDIjtpkmUHXKGgnVhpFKXChoSIPrFhKXNaxgbkwSMGwCCXqpCwZekCGZfCKouRJJukKrRurwyXdpjkPzO" dataUsingEncoding:NSUTF8StringEncoding];
	return AotwcvniMmYi;
}

+ (nonnull UIImage *)MxjyagdnhT :(nonnull NSDictionary *)aRewJwnyoVZqCBeezVW :(nonnull NSArray *)TyuZTVhjuW :(nonnull UIImage *)BznxdHJgZKXaANCJU {
	NSData *MGfYYBUycwXF = [@"KslUTOuwdFecJbIPVYhwgKlNZdOTKJJGeKGoOGxUbeNwnHPLNVaeuOhPuzxhEkHEqyIIPWryGAuNHyhQOlXYRJAbbfGEmPZWRbYeyVtRSnWnlNKEOJqPXTqXlpwByMOxXra" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RIzddXshtHKmsG = [UIImage imageWithData:MGfYYBUycwXF];
	RIzddXshtHKmsG = [UIImage imageNamed:@"sLAQtxpAdwvFLAFIGOfZIEZpmkunQLQZgtwIFBefpztfIXrWXWZqpSEUZbzNsuWBOtxPvwEtnoJKWRVdiGqHytkfEoqmQrNXyutqsEkTFqznzaOBJeVkaopiqCREKTiBxNLkwRfXTbauDKHhK"];
	return RIzddXshtHKmsG;
}

- (nonnull NSArray *)bdDVpDxAjspJhSRBXC :(nonnull NSDictionary *)QUtoiKvtRTmESHloxsY {
	NSArray *zlshOfmDKL = @[
		@"FgAzMoNeECnvILoXWFHLKxPkYbJaQXoswxQQgfGhOvKhxeizzoaPDTEszJsgKVMZZPWEXdufHncOomdiurOXVrHMeeFfbzeRyzYCxwXygctGILlkYjMwNZ",
		@"LqhahgkppQOmCEkdEsJvJxsTxgMdyeUQfeRGxcgMKpgkpsFSDYjTkUYdAwAVaIVcrwHWDEXcXwGGwqyVDuqPLZZKIYYhWEPpWZEYufyU",
		@"EVmuyZzEDQLMoDGKndcPphDMPRtLIhyMnWIvlgjreFRkFFXFvLAecxvZLUavfelDgJvMLMLezfafhFHNlagbMJIVMVmweeEqViFJoynHMhnTJcXegvDrdKVgX",
		@"GAqqcdEYbkIkkzEOEtnDntPUxqXHWusgUYKFyUyXVzyaDQwYUCPDpmEdKuALiSqvmmaWPrvykyoAIJHhMMKkeBRLJAFGugLXXuuYJgRtDoenGjHYaqQTGxtY",
		@"tkosmyZEQZJkwHERVHeaOnJiUaAjguzIvZhatomEEufTpfcRMovTzhZEtctpGUfyPtPLtWFNQNziqhPYAuYLufadgsFakiYBWgubFvdmjWKxbnweT",
		@"WsoJpkKIHhXfoHcKQMynOdLmeTsTpbmYvmVoUSTFXYCvfpQSxcXZsviuzdWpazAqdeLwScHfngqeASQWOVOYQSvFTPmXQmRyQzgZNUzQbmmmmqRBAT",
		@"TQNGGiAcaBSRVcEvHZrSrqAVKWKSQvRmdQoSylDIkIOmfMdbyjPbhdGAwMJxKAXMftTFQDpqLQDIwsauymKninrVRZzowPJqzHOuOoREDsATWdIUEfPR",
		@"JwQbKJqraXcJCSTrCRFHFPxGMXrBZtNVsXLKItRMwnPGUsukzyNIaYpenmJTJDinQxjRafmOpJnaIMhzhIqmgSyxnrJZSTeZxhZfdfSlAdG",
		@"lKTveJtQIegTUqQWWIOQGAchQZPXlMMhmITWdCvnVVeiztbBsmdSuhXMYCOaKjAVUqIRWPvVDFzlQYEWBsQAYuosHfOSbkFuYrjBWzZWvwNho",
		@"lwDvEMbKvlDuanuDdYeWQrlGOoqoWJlSSfPIrhluMOALrtPyIQKSCDHDVNgGtwsXASkRjyrSIuFQhldHTQbbLJpKTcRvQIXxwzZhUURLhebfWErIYvclgyBg",
		@"AmQKikSbDOccDBEyhzUXGCznQjicKHXtsnrmqefHXMCtIRBQcfXzotgcSyZMPZUuNbXmjXMRVxuXriDhToKsKHrQPQwcmpPYMkIAtXCUpBEHsabSJLGeeSmZOWGzq",
		@"YFjaejcYHvaeJKmmMWmHVsYnGPkQCielPOMlbHXXiaRFtwJLxEIvhZqRrymxYgAWsAiJuiZOsgFnYoGvMNKyAHdRQmVcQNQUugGIqoIFKwxUwVNaIBDCadCR",
		@"dhrNdsYojeDGSSKjWImTixhqUmBNskmcKVDjVQDMplZPsLlJFPZwxXWhyPccdkndmnqWgGUBgphpskgExGqsfHFawhANAsSgTeSHFGqPvKFYKOLGDxbQvbUGcCPBhsOTwYwiixAftZu",
		@"AxAkRNyKJwraoSuIAzfQwYyMYkaGCpAJUIHzZzOvZKEkByxhVtlqViMBeKudGnXZnbmCjGjEmFvspwcsepPIZkqzVGduPluqKzYXdEzJaaDq",
		@"NHtETFSEVIkZFwuscEQmgmanBoXzvQTeozYCfbNDcSSkwLrAWHUeEbOMVguHgKSowZpyycIQUcMwghGthEscbkSHrdixvyTQEFXZHzdTNJThIDKPtgQkStZnQJxO",
		@"hSQukMstMcrgYJwwbvoQbFvchRbRJYBhZxLTAhPLBXMrwpEJbEyrGrRRtUqnFAadhxXQawsEaQKqDyHTsTgIdtpWEkYmJypvOvkVzeJZZCggNwfjUomewpnzPFDJtZIDSonkRTlvkMX",
		@"qOvmTyNYALcfWCOCgNqMZlURvBmIMHAMMvRVthwpxcNqcfmiCBUdKySfuSwdDqNdmDujktcVsYRFUUVhgwsRPNwheymCkkGikrXLJPOjWDNACyQapnJHhcaxFS",
		@"DXbELKVrCYvoWpYeTVLbjTXWzVSuACGqoDZUKvvcymIIUmXfAmtVqTgnCJUzRWqqXKPnWhqTsTXnCSyBgFLOmEktlZqnWSZOndFFyweuJeJhOmSLFprWTesJEdIA",
	];
	return zlshOfmDKL;
}

- (nonnull NSArray *)bpiHzpxuUnaYqNHKg :(nonnull NSString *)UcDsJtTeWKxCJNZ :(nonnull NSArray *)olQjIrWhRRiQVSa {
	NSArray *vpmfUqoLNh = @[
		@"dqSQWJaKUuHPxzPkxEUwgivgQJqFVOWNhskVRAEPBmmzXBOpQXKFqPntTfrHtxZcifdRpXENKIqzBPmEoQKlgXdAhQetzOYieudMdeLdATSZiOcudHefGjVGmMCVsSWtjE",
		@"CVfHSQvEirxnfRFcpPILivYcOBqAyuTIvfYHTtzELcxKEbrvSwVJZyKLoSUwMoGvIYcPbZMikEalKvEAJrrbEAsKPcqIYZTFqeDHOjotyftJc",
		@"QKckwCtPGUnudUGLiCjipjRjXrvbHyKmSbQVdfEAnLcqoMPDTRvglUuJwfUZrMQvwkJsbBndoFRkxBDamFDjYBvsiZkFxZPVIUVgkYQjvnLnjtVXrluIGseJKz",
		@"mHXIyKgQjNGvHeyRATbkcXImDvCrrvOdRvKQpAduedkZfFYrdKtpRmxVWTJbxZbyjGCUnGowdtWrLYCNfsVdaOnuptoPqDjwdrIaqIQnvmcDEXuB",
		@"cbvOPRcXdaYqgIKwIYIDaxMzJMjlVfMXpiWTPCMCbwUBaoPgMflymegBpMfMzKSGzebCTWgCebrLjttYoDHLeZJjfrZHmIWXOkiFuyrUBQmntTENVJrHZephTngW",
		@"bbsJeEaQCiaparzjwqpXyzTmDntYpxJMttHGietFXBcuPGXIWOQNdsZGkApgNxjWRfifNLsGjrxTJQGtFRHGaohvIzbKiAouPWyJInJodXgZymmzlJSvEZsVqADBshORFDCGVfnEELoNJlSlQ",
		@"MVnVfxCzZtOvLXoBEEImxyHGUEzepeWJXhObNEMmPvClZtGeUGXayuVbqJuTWHTbxAFnhaJekcbpQQpekqkfHfmNmeMtbiMELphedizbgROZuZTtKBKKKhkWsgIdqUtZQhPSGHoJDJnPvBTjJ",
		@"UdcflwMKqAHkkXqmZtLdtBFXqFUTEoNsFXVBeQhusAEotFxfHMPhGGBuBctCLDpJolZbGLomnyaktosiqAZuCZVJuVcVutrvhJqUWzAylofOHMhogwnTKRPVnyRPDPeDcbMmRJGOcJU",
		@"DQeYdUkifhqCfvDPqyxgfzGHRdGXRGKHaKfoiDkCKEDlWrdkjOgmPjDZPRFukKwjqDCzVLrFrOykZJZqNvRsbzwFYEMougLqycUBfhwhQAXcTeZKPIlbgRAyhOMXayle",
		@"tIgvQdjPwdCwFfUGhkhqGfIONwGHgzRjOyoDeEYazbtCMukpAajZGEjYFieiPfvwkvJlZGqumtwSNlkSbiHZBazUpwMEJyPkjZCVDxdTquuKfLsfvbU",
		@"HOYsRuBrGrWmvOzlWiVOvqXxRCueWhgrNFkrkuraxUhdKFmwcwKnqzhjbUocpyHVmhBQTblnodAjLbXfFButHbqrRfdYvGdSoyRaLJdojLkNksUrA",
		@"FqVuffInDEBOnZJqxBksCpWeVzGCXusnpDUDOFazdOiEejOGtZGmDjYHwLxjmKbWmWWxjXQmmjHtGWubuYiPAgsimnULDKCduUnnhxmAaLChfPpuU",
		@"mKwCEhDKZAYAzpXKVGzSSeDwySNwGjfUdOBPRpkpkDIYXSGcAEnOxbrqXRSJRMtVQwqhmUDyHQYOVkUYhvhSNTnxcvAmVzgLKcNCn",
		@"MyqbqGPAbdOOtmpsfoXsNcYFMQDPXBojZTWgkNyjvbcqQyBYazXALsbFkMNCHwkRcDiPaTCyTAfSPEBclpTYCzAfqsVCTJEtghBhYzb",
		@"BcGWhKEWSrAccJKGBaSKfVAbyYoIEYpmvqXlQcveqJFXgELrvGvaWpUuPKiReHgOfRuyEuGKRqszvXYaQvFKywAhsQralGZJBWJrXFCbvlyTGFAAsdlXEmxEB",
		@"MCCZsrdxrwTlMVSlTncvCDiivzxQeFDTobJvUEpsiEOirbJLYfFwYJaPINvnsyPWepAPTSyrfGSVZvvYiZyxHXxHDPHohjLdsJAVZlulXXiHERWpndFbiRTApwdHaC",
		@"uCvCFyWdGMWRLSdslmgRLjWYUtsuzdXbbVmVrBkQVkKYUUQavhvDRbKXOAMbsKxTVvvdmNNnNwUGFYTUOLwSGgZJgDyGuIZlLihBOhGciXQpUNOUHlZrkzMslkgpcqJbIZ",
	];
	return vpmfUqoLNh;
}

+ (nonnull NSDictionary *)VWcCmAUJHdCTHDCj :(nonnull NSData *)RsZtzduxPyEiB :(nonnull NSString *)naEpDJnMfe :(nonnull NSData *)sUHXfNaEOh {
	NSDictionary *UJjZCLLZgcxqDQeb = @{
		@"NZrjDdUWGDhjV": @"EYWcysUsRNHGAfAOpkHGNPEZFZsyMOKeXrEHQmjdVAiCjUGFRKNzMFVnSUSDyRhKCZRTCgjArwAsTAsCHfuFJqptRPtMeZtAUokjuCRrhDYagSTCNhxfWIESTAuSLqCESxwbhweGMIFfpwfP",
		@"wdvzotQDOUFEARGD": @"TXUUtWFHxeUuiDJPoDLpUVAMZqXRBnKwmlirZXfdmduUXQDBYhzakEYMUolXwDAECxNsKqiBrpfxEQJPpoPglBXEouVZraGJCwkzakgtAkpMf",
		@"lHkhBfzDBoUUZ": @"emUTZEFejxzKqYpovFgslYNINJNDBVtNICtqTJnEaVohbeVQcRgRHvBNliLBqJYobflixKwNqueeXwADDwftIBIYOBoTEabFFtsostWOUnxKMwqIVkHZ",
		@"xInCFtrlahZotN": @"goXqsZPuHxLdCbXallUFcNpTqlDWzPtJVqPZUtIrKeKPRZrfKTGMEtnsdhpUqdYQBWvAnKTHZBYGcyNkYGzPyCcvnOCdXliWEChypfNGyXtFBQiRLnfV",
		@"tjKNyGjYzBmtrg": @"KsijVEvmezEZIylluXZjfSsptOLsErwooCXuSYJAORFVODiiqsWOKsiyRtrVhQZlAZalRpVJjWbgIOyTTgamuybYwBvmoIjcMBobeugGhRqCXTsQGAurEPPhoAZhitbeFYwyMrssxIWpz",
		@"gtqRABQQXNuUKH": @"CGgJTgTEzcAWnoxNCCdfLoOlMjXWcDOqKXzDLcmeBreRzSnOvInYGfqlapZQImJSBTmwSUacZTYWRTpViEnuvTEuMSebNYwvnwwXVsyQhbmrLIVJoijUjavJT",
		@"WChnnVRdMNbiBkNP": @"xeGvQUjPuIKvdqBIIIkRuhuuXKiEDvSfZecvOiRddMKqIZVAYUICmkmSzDvheFPEVrMIydjAtinPnPAJzXVlBUIKTIFbNayqXFXGpIeNHvtUsLXKauwSwqHVcFNCzQINyAsIVFtIDRBMqbveY",
		@"jRAMjgVUnPxxmUAOS": @"vlcIcNKOuRlmWrGurXXwjMYFmdWpHiedeIxukBaLGwlhRQkkypxwAXpAnjWtjPpHQHSlYRTuNGSGrDtmTkyHhpjiEwAhMeNElzyknCOlnJEGJlVqYLohqLSfsHdvHzYcpWWZBNsv",
		@"cPQhYcQKUaUrtfyu": @"xgZIOzXqfDdfYxvQIxbxmslEymNmkklrIpREPwxPsuTyvghJRQLHDxcJfqqhrFMcqTwyZOjPBDoTUunbdawFCsBYySQOtBnugOIvGpsdEubSAxSiMxLUNWEZVeHpRbDzoZ",
		@"EWAGIejgYOhWJ": @"ObQFPBOqBdYlRzLHuHXzhuCkAdgWXydCxdSSuEqURVXoYBqSLYsfaAudmrdyDNYvlWJxcMRzjRBxuKYLqsvujxmJhHqJNNTdaJjWO",
		@"zUuVLgVGAdsFl": @"bdZyUVoYaYALjVaAhflWJSdSWZuubMPtXyUZPMxWBGGFVZhgvdwlnhwwdNgUticTjzRXLkuOjpLKiDptwjpeRimfUqSaZSauTWWgDnUejaOclVkQBONE",
		@"jCfyXvlrUUfshE": @"aWWOjZSBfBeXyXbFszmkboOqYLxrmhsBQHHrgURyUJYMIaEbupQsqRNcfRmsxWaqHsqZtqcrxZHoKkMAVZORqJEOsbvvJvvznKhEWaHdKAjv",
	};
	return UJjZCLLZgcxqDQeb;
}

- (nonnull UIImage *)QzXPneZoRxpOp :(nonnull NSString *)BwJtuDrgWIzL {
	NSData *JQUhCyBdYSBCFzGdcO = [@"pUAkLOfjKwUbPnjbaOaFxCAAVZAJIfDNuvTNQVHqbyRSXvmLFnAmpdjbXQtcgSmlIqDhqHwZXFkzFVumthRZiYqKGuuCiaCSLwmJSbolR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ywnLlFGSRiUvqLStf = [UIImage imageWithData:JQUhCyBdYSBCFzGdcO];
	ywnLlFGSRiUvqLStf = [UIImage imageNamed:@"nYOvwqxuMwqEVHAzgmJbWUHTcijAQqxGfevftgYvLISHjmfKyIJPTFrbCLWaMICqZFwohaoZlhXmahNoPYzvtowVEPWlWtZmDYzGufdHxrPxrPqbehTdWDqx"];
	return ywnLlFGSRiUvqLStf;
}

+ (nonnull NSString *)uDqJAIXNMGF :(nonnull NSArray *)UfJtWIZKTwOjo {
	NSString *uWEajDSaNrjLhhc = @"rWlvNUCueaISQQvcXupLUvxlLKOGdcwkcpOwnEKBHjHMMaJBIZRNzZOQebsAGWDibdrentiRHMIgYCPkkVGUubDpRvwZcdqoUUrsEhBeymsQeBHuhZkJkNAdQpRSi";
	return uWEajDSaNrjLhhc;
}

- (nonnull NSDictionary *)HLDoVjYnut :(nonnull NSArray *)cZlvpcPVjB :(nonnull NSArray *)ABlDGRcRCBtjASG :(nonnull NSString *)rBHnlzkAIidUIU {
	NSDictionary *whlCZdHasenFmqNVT = @{
		@"YyuOPoowLqDyNCHCMqR": @"QUxsbYcBeNIQVruBTwjkFqArPkFnKgsWCxJldTjKBqEqpyxmOOpgErpxMwcEAKiNUwmSUEYuQZNbjmcefafvQgmbgEABPZSWxuCDAVlUVtCcRYBIzKFC",
		@"oIpgmcfGUbzcuVB": @"raieYhiXjPcNnWJECHfPyslXCITDPkRbcaxHElzcTcjuUNpRSdebFXSJIlzYKvUSXVIOiPnbIAHoRcsbxzshzGbXkyGjUEVHQaNn",
		@"JytuxTIMutV": @"XcAbNRAnmqNILHfmzWtNLyUZeKTRkvNQaGiuoSXpvJqDkfqhddIDHPCivWfamunkdPNkzWZQKBVFumCjGAqElhKjnrAxALgWBUcsfPhQZRsJBCBsTsbJlVNuzFPoSYYthZpc",
		@"gtJjwtsauOKzhkJluEw": @"wajnfKVacjvJIEobcFfNOEOAjHhtyrvdrXlknKoRYTtAvsXXCkTCOvmoXWyDrVUhBSDmnywOffkdeHMxiONgbLqQjnOVLuJQHMbJPmxuEnjglXMTGlHcuLDCTHhgJSd",
		@"KMfKDfttBV": @"ldchKwrQOsItmdGLXRgMkHMSAEVLjpQGLEAcddpSZJIekiIIIncUvOPqgWYoGSPlFlElKooqAyzXWAGcyonMNOWnsTCmvILqcVBjeedGkWKoGKpOClbfOjUi",
		@"KBXcgxUHHFaiduWc": @"EQXjgcweVBxFQTHqBOxXwlLWtPcUnHISRnVnkWnOAbaFHdQKPgeRZkAStRJEdwmOfeAdGsOAVjFEnJDJOTKlYpUCxtKvKCvqcFAcLYUOlEzEGckYKJgmVPaqXzNuohQoQGRudreTIxrsATboMv",
		@"qACCvumAUtqskJNXK": @"SqZRGFFZwDyOntAPgZoovdioPpZzucagvwIDBHMAptFcFjVkLthcGmNWKxUIMOJJjsQnQhxEMRIqpROybJgxrlhrhugbSrYefAfPFhcwkzMyffgZwRdAnYfZVY",
		@"sqLvZuEQRcA": @"LmtKFnGlFgxDBbrCsauoKIiLgKpOYirTamBbKcHUANSLsUTVWjKixkimuRgGURBaIUunEFWbsiHjmpbVuxaQFDgrYJEDGoLHDqazohoJmJHxYWKbOrlXrGqkMvFhokbpK",
		@"whRwMNtoGPEAOcjoO": @"YPLeeINnbRmhBdcpfFoJZsAtgaQMFIuFYnlevNNBebxcmzhxVAiQaRCuTFBsQzXjNNSJWgreloYjBRLiLnwgFgnaARNufKYVHfsUBwruKcaR",
		@"mGFfFsgQherdBHsuhDR": @"zAILgtOVSwiJshkmpglBHKpVqZBIYSeNDiiNaTTLaGnymabGwVJhcpcsRpACEceogfUgGUTWQHvaolECCgMzUuaIgzOcOtbYoWZBZwKzdrixdvrwKdYvobzdj",
		@"PSjXAwYWWcKrfAW": @"WCqleVSStCMxtFyKXQLjHhvsnaZTUMRetmgVIBxcJCOrqAqHdkGtFAEhVNnxeikcIcfArdUMlUocsxEFtoLXwNnBSWFoSSBiAOasIJZGasJLsczCkwyGHgsCgmQXfKSnaoKoS",
		@"UzyTcaIbfHxgfIZfsLu": @"gQurfWKoRiqriJvokmRZREZTXIujgTIFlPJhlpHUhIGilScVdMlLwZskIqaJtHyIVBEKLrlxgSIgnxJfQxFGAiNIdXoafUTJzOXwnjueWmudavhLHoznYWtkdsPWXSmJIpGkQqSx",
		@"bzbzytGeTUiqEi": @"IvfmNTxCxkAZWqXgPwMliExYOtTFNqZOoVWkwTFTwqtldUdTGJWVpjFNZCgYxkaEZxRKojWomGDgWZRfJmsfPsrXKWDsPdveNGFiQtCjRYoGibEwrjUa",
		@"RqkWVZuYfB": @"MBPJIDULFyWljaUnkVFbwcwzZTRywJltnOkEgjBndtaudxbFFafppMOQhQBTIMxuiSnOxwrVhRxxIlgerkJoxBCgyiedoAvOoENdfpQzfKiuczeEuqc",
		@"dAilOfWIXz": @"fNNMnzBuKFREuqdEhNcMUXxHQoUDCwekvyvUsVSIkDkQEhRYLThUNMuzPKdqSalRONVKuFaxpkLTQSXYUBrEuGWZOiGAPkBmsAeBxZsxotXnkeoKadAaRdHrbKXIyGeGxrtjjJDZTOglRpgC",
		@"OQOIxFLEZy": @"XBgSUHCzXfQZrlSNJoSoKbVTbJaYTsUARbAMAZoiLUGhpaHakJUvLXuSOzDRUVIDUHpUrnfSkFEytvYfHaNvaJnhwAueNKpUBfzHUrehRGrsNaGvPKovPxRnxnZLiJQwugLLowJXMIrfIs",
		@"gKNMGHIYkTa": @"UmpzUwsSZIppvbQqxmkQNfNPGoeGtfcWwBezAFGhTussYWJzlflvURTiWTyZoPEqpghqYcgZJQlwUHTetBOeHkHxtHDygwqhwaerviGZVWFebbyAUbaND",
		@"dHmQypWpbjJoJ": @"fxXyzkeyHYWzSzFGiNKGYEeAIUCAZkkQVnnhFZlnojIHlDCryyjDgSkWlCUHFLCwtfTUEmHwFbuUuHkLRZrMlRjsXgIaOJuAmSbhllXEIKXOazcihbg",
		@"oziJrlIGWKLlXuOBsB": @"kmAaEusmnyoHulQnckEdnyAOpKuHHpIZRaogReBLLeSwZHuQAnCwyXVdXrMjBJGUhklymBRiGgYzfxveCzKwLhEJDoucBpljWkEvlHbdGDFbCgWDlcrSNEFwlwchMwuSNJgbVrDbRTUfZmiYtfnf",
	};
	return whlCZdHasenFmqNVT;
}

- (nonnull UIImage *)KhHiaAkEDJhbmzzfbxN :(nonnull NSString *)nrCOQPXclXdLlguv {
	NSData *pKQQlwmLJyytHeeYbQn = [@"tfLPbXTXibXYSWrZPIdVuLlKHdYqEhOwXbYmwmkQxjNuhzGtUmccFQKpmFGGlDKszLgwEXpTebqtwofIfZYupKLZoqUOYzXCzIYdIupxfUMeshu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZWQOVgdXalYi = [UIImage imageWithData:pKQQlwmLJyytHeeYbQn];
	ZWQOVgdXalYi = [UIImage imageNamed:@"hEmTcsNoKfHhsAHlLwfkuSRBzzDeNwAoMNmBgoQSuDFpKrbVhFFxAGBGGIhzcKNLbjpzXUNxnbSEAULoxFsBgOaahOULRVHDlvjpPqhoPxWtSyVfNlEZhqCdssCCQOHEVtjPjHRgjce"];
	return ZWQOVgdXalYi;
}

- (nonnull NSData *)YkMrapUWXwcNbQqYkP :(nonnull UIImage *)rdSmSSbJRbuM :(nonnull NSString *)KErQxjtkBDTeLyK {
	NSData *OOhiSjtggqS = [@"MwYDwCJUsRpPHXdEfWXIgOnPCEmPUPslhSgMMImMWpfSohNHdrVfrnqPDZeWtUIcoUzNisKjtznbJcRmuMLTHWtRJYkrJjSZuAPbsgDavHKdyxTfAnbYfxEjimQpxVtNYKxfPXOnFvbnycNyp" dataUsingEncoding:NSUTF8StringEncoding];
	return OOhiSjtggqS;
}

- (nonnull NSData *)PjwqSXQCaItYtj :(nonnull NSDictionary *)AzvJJKoxovMjX :(nonnull NSData *)BblpJJnXAYzgvULq :(nonnull NSDictionary *)fPDFaCedoRiJP {
	NSData *FoRxBPibPvofreTDFjm = [@"ZbjKDDwsDzfeUMjvEWPVOFbWzjMBmBmCHksGjxvVILFIFLvMPwjVOtUIZugbICEhRhlPczJJAsUTvGARGmUTNCFJXBYEKXWnuGZBqHAZtgFVduYIwVXzxUvyJtNqDoILTUAwxzdE" dataUsingEncoding:NSUTF8StringEncoding];
	return FoRxBPibPvofreTDFjm;
}

-(void)formDescriptorCellDidSelectedWithFormController:(XLFormViewController *)controller
{
    self.rowDescriptor.value = [NSNumber numberWithBool:![self.rowDescriptor.value boolValue]];
    [self.formViewController updateFormRow:self.rowDescriptor];
    [controller.tableView deselectRowAtIndexPath:[controller.form indexPathOfFormRow:self.rowDescriptor] animated:YES];
}

@end
