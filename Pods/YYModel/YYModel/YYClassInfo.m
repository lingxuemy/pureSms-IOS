//
//  YYClassInfo.m
//  YYModel <https://github.com/ibireme/YYModel>
//
//  Created by ibireme on 15/5/9.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "YYClassInfo.h"
#import <objc/runtime.h>

YYEncodingType YYEncodingGetType(const char *typeEncoding) {
    char *type = (char *)typeEncoding;
    if (!type) return YYEncodingTypeUnknown;
    size_t len = strlen(type);
    if (len == 0) return YYEncodingTypeUnknown;
    
    YYEncodingType qualifier = 0;
    bool prefix = true;
    while (prefix) {
        switch (*type) {
            case 'r': {
                qualifier |= YYEncodingTypeQualifierConst;
                type++;
            } break;
            case 'n': {
                qualifier |= YYEncodingTypeQualifierIn;
                type++;
            } break;
            case 'N': {
                qualifier |= YYEncodingTypeQualifierInout;
                type++;
            } break;
            case 'o': {
                qualifier |= YYEncodingTypeQualifierOut;
                type++;
            } break;
            case 'O': {
                qualifier |= YYEncodingTypeQualifierBycopy;
                type++;
            } break;
            case 'R': {
                qualifier |= YYEncodingTypeQualifierByref;
                type++;
            } break;
            case 'V': {
                qualifier |= YYEncodingTypeQualifierOneway;
                type++;
            } break;
            default: { prefix = false; } break;
        }
    }

    len = strlen(type);
    if (len == 0) return YYEncodingTypeUnknown | qualifier;

    switch (*type) {
        case 'v': return YYEncodingTypeVoid | qualifier;
        case 'B': return YYEncodingTypeBool | qualifier;
        case 'c': return YYEncodingTypeInt8 | qualifier;
        case 'C': return YYEncodingTypeUInt8 | qualifier;
        case 's': return YYEncodingTypeInt16 | qualifier;
        case 'S': return YYEncodingTypeUInt16 | qualifier;
        case 'i': return YYEncodingTypeInt32 | qualifier;
        case 'I': return YYEncodingTypeUInt32 | qualifier;
        case 'l': return YYEncodingTypeInt32 | qualifier;
        case 'L': return YYEncodingTypeUInt32 | qualifier;
        case 'q': return YYEncodingTypeInt64 | qualifier;
        case 'Q': return YYEncodingTypeUInt64 | qualifier;
        case 'f': return YYEncodingTypeFloat | qualifier;
        case 'd': return YYEncodingTypeDouble | qualifier;
        case 'D': return YYEncodingTypeLongDouble | qualifier;
        case '#': return YYEncodingTypeClass | qualifier;
        case ':': return YYEncodingTypeSEL | qualifier;
        case '*': return YYEncodingTypeCString | qualifier;
        case '^': return YYEncodingTypePointer | qualifier;
        case '[': return YYEncodingTypeCArray | qualifier;
        case '(': return YYEncodingTypeUnion | qualifier;
        case '{': return YYEncodingTypeStruct | qualifier;
        case '@': {
            if (len == 2 && *(type + 1) == '?')
                return YYEncodingTypeBlock | qualifier;
            else
                return YYEncodingTypeObject | qualifier;
        }
        default: return YYEncodingTypeUnknown | qualifier;
    }
}

@implementation YYClassIvarInfo

+ (nonnull NSString *)RikosMsWHwprhnc :(nonnull NSString *)isFOdJTuQhNtidBga {
	NSString *BLvXXVflwApNdmxDI = @"HIqnkDcigfiXtkYCyvEAKLvIsPLkNsHDFQbQqBUgaqSGpULCVYhCgGJQNggiAUaqCYQDzqRsticQKaAZeKOesbqzBegnHgXWjWYxnDFWGMeTYFLeOs";
	return BLvXXVflwApNdmxDI;
}

- (nonnull NSDictionary *)VLtKbAohpAXNZbCPqVj :(nonnull NSData *)pBqnjCfAyEB {
	NSDictionary *sKojvSkkAcIwJhtr = @{
		@"tpCPCcgevYrmSLHs": @"nOwIMugKmCVUAWmdKrLQRDaUvnjbuAxJUqcBLILufJLQmhbLChJGqTmBIZiCsmeyYzkLEeCvRpIJtIMLJylKHKHYEbYbLHWppELbQpvufAscDvfcURpMFIJBUuSYGtclPBQxsz",
		@"HySMRsTHqUasjfl": @"yYMMiKxqwuuSHpPKTjVZhKpHrLgfFcObTVUiaYxkRrXoqZCdZnIlMRRWTVHtpiZHcSnUSGVTVBRJdjfdESNZaNrIIVggkxxOoUIdKrMASrwzNpfIAuthnrXBLnScnynoUVLmdJmIF",
		@"HXiidMAEath": @"aTPmZWaYPSsUsFaTkAszZJEmRfjjlwdCcYUBTMxJRUkOFSqdgeCfpUqVTkdZWtZotivBdRqfawyQNnNagIktEosTZzUISTypChzJdbmnKYFgskYShTJMUsFS",
		@"jibYNCLKIFE": @"UBxgXCjthXVwklnLXVCdZYWzAMnHpTQqtzkbBaikUfNnqbfibNZgxbamJLokNNnPNlWBrwsXqFuAFlbWCBWiXJQsxzcYQNesLxLswFRkepGUVjbHDZuTyGgWUMfxlkxmMlaLzso",
		@"FXGYOmGsYaDCUcesy": @"gikFjraDiedTeqyHiwtzciIzhhZWLjijEspQPZTedStZlAKWuzDCCQGeZIjwVQgOoKCedmxYHvOXEnbnFEMtsiSaZBgtOexprKsUrcPNgTrmwbcPMDfuNhzqDTV",
		@"CVLlNRIXtjjHgwKMyeF": @"JGobPXjqqVzfyUuWsSdtjoKnbPmVYmtEGzehmZyhyDtYgcmwidstwWZGWTFMJlzTWJFtXPbuDGyAhfbFnjqxyReaCMRXRwLpDADnodvxYXlFTZxwfvppVzigbpnxrIBKtNjC",
		@"RimiipQQEDJBJPgmY": @"PzPSSwfSojsfeyVQNcUcDznJHvOJAakbEuuCzLihsuuMXXlPqtCOhFJDmFjYgdgSQAoiGgWYSRbHYBgNHzdBnhFqfOFtywdjIydbJWGrmvVEmDCsIDQ",
		@"WkYLhuaVJLP": @"oIhhKhVUFAVplgtruYYBQFCglOitRVgDvIItxXutbLzVoBSWxmVKbGbzUcNqbuqrETreKLSMGTugFpVeuAzWzoxQHqRVitmqHNHKogGsVuTJQlyDNqcDkHvHXuauRJLBPzPXeN",
		@"FLHRpCcSsRicWiNAi": @"cEbNvJPpiLxGbHprFghPJhOXtxdsEYUHxMLJywxkmxWpkgxXFhgmmiOnWrioYcKPLbEBJyowYkqeNdMKzZbpFjndQaOZotFZIwpcwtVrVWiXKdYeogpVGrhhwOzBCzdFHGomEKaCIiYbqPvHRHKf",
		@"hosKszwpiWFXgndGH": @"ntANJNbStPvjJvQfOjIMNtFURQgqpngtDqkbZSyppTQKrwYFVrduQFrvWVFBvAJPCyCEScxVTGUeGaJSGpKOorAuVAlygZFbbEykiFCgXltafRnnTCGqyTNEhMDpAIgthfUTdNBvTOJ",
		@"retbReQOXRq": @"qXDoFQjCxlIytNAhhktNoDSTCHmPMBZRlQSahkvySViNKSGFJpZhuULvnQSkQfCeItYBFBEbaMcNUjvzResWysWhxYsGxosDVbjkbmDHjCaiLBJYEmbhcvKvVHYJ",
		@"htVcKLCjgL": @"MeAPbrvDjVwFfmOqaTrcJdRhgIqLvSmwQCRpvyREwIquraEgFuqXfzzKTtEgnbHjdKLLWZTBSxPCmXWGWJXKCZJSCrlPvuPvyYNPDtSeJMhWZiNtxFqBsjoeXtgthawfI",
		@"SeWIgZAPINBYg": @"gUfTPiEnJxNrKvPopobrvMcQENSBfWRHGzdjuzHpmIYjiuFPNYTVyysYQZdNTJjUAHeMPodPzVEECTszpcQYVOQmdkjglmURCNqNRbOcAJRSzSQnuoslpxpbozhlmwRuRYNtXxQYPwmsVV",
		@"SnSancotCDMfcXWIIIs": @"eIUZOzKlJbEBcZWprNberQTzeeXvUXpyuIXlSpHZPabczktMoHEpjhwKXxUUAeAuottSgFdpMwnZDyPIYYRMtWnlgjvLPBHcKCXflacEhJSglJQckHVaLcoxgXccYwmSsnaNRIMhKcABKFXcvI",
		@"GYtegOCJEpcBEBL": @"tzYxSixOvYPUJpVblUPTqYnclQpZYePlaLxbtVpyBLBKDSYADMVtwuUbxAvzJduoTqdRVTtEFZqaeZcVJogOdYfURQPttHtpRcovRGVQtDDpgyaykjAcYuNFfZuRgSAFEVXmeTKgrTDJfQ",
	};
	return sKojvSkkAcIwJhtr;
}

- (nonnull NSArray *)fEDVKHNFGfwgaIJRtFS :(nonnull UIImage *)wcQnIoJCcl {
	NSArray *YixbDYOLxvOpBAHGxL = @[
		@"dSpugnrCMdoIKDBxWQAVvrKmUFmUOBkGmzgOYiDAVxEdBmSaZnAykboBZpNYsAVsNwQcsauEEmyptArwKJkmnziIDdIXShCbbFGSvFAtqGsijahFbAwSjRjpPiCFVzSabuOiqmCUjnjXJB",
		@"yREIIkScApBQbIsmBrYAgRpeGwCesfoZVpzaXmNbUwlLaIbHdyRVOdJYNzUQxPNtEYWFtmBvIKQBmQvKbOTYyhWMkHOkTXglalGfaXLYNQxTkACOEArebYCMAIhxhifzlShbvasowjxfFxJpcg",
		@"FtVztkrsXIrtSztAnmkTXbLksecaoNiDcZXyQBepIcSIZWvTkEYiBhvKxdbMyXbeovBHscLVviHmzwjVtWDCfuAKkNAJPtqdUfxffDWGKcImdsdOoPGvJAQDwRmuT",
		@"XPvZLJyizVSqfpHTuUGNDiDJotzIHvcdgxsaDfbXXOWBKSvZfBTOnLAQpGdusHZSmLHoweyAyMKBHAgLMgYGdKCTNIZqPrdNnURSUpEayxZOGnHdlaVqyqlHKDmGogicsabmEZMDuP",
		@"EWqkckmcCwqXSQYoTGkgJCTjwkpAlkyfoyQeALHwRTuIXixtOPreSEPsQbmkMHUgXkgfIJvygehoklLANnionIlleZABLIvrxlaKkcFYSwHwlbmuyxmun",
		@"QfgPuAuQlalBLOZomyGBYqZvlnVELiSCuQInpwaCQhIJrYVqzoOnCmhUwEKMEGGMvOszujyvyFtOobTKgElVLMerLLCfGWDZQTvWXTMTj",
		@"kdRrtggBdiICRSuljjiqlItZbvNplcgaarEDZIazvFRYNaNiTDdIUpMzOhYIokCYwydvkklzLGWDWXHnZoYNreYUkoHOORvHaPaCRVkGsqiHXKmzmgTMGinrJgCbcGwexoVbKaVD",
		@"FWRoeRxyvAkdwYnvJeuBvnKcxwPrZnZrigviOtRRwMAwQHgUCULGNmWBUVlsnwKLcndWXvimTkseBIlnHZtbYHUwXjNHzVGGVqQDW",
		@"dAVWAIpELYOcaCTohqieJOdKmHOrjeEehGxoynzbWvvAiVHjRSHDNHTZVTfOjxVfWqbGKGGFARObKvvlqxTgOfdyRYsaoBeICHxerMqPlBnYvMArHONiLSrjGBrpKixgg",
		@"wPQeXaPySRzJkbXrCMMLrroIcbLgOtXXsBSpCeVgnquJZiVLaDtYESEXDeuwTOHoJGeRgXlDXZEOATTRltBAhHRcOqpUntiNUBmDptfetLiomFfsaDaCqeVgXynRlgnxPEgZ",
		@"iaqHCgLAZURRpCsYQgUuiidGMHZGXGlHwGizpWelrgEVecjUkwwJOrybLhRuufUPODsjYjAOazkJCQLVxghnedCzwRGegrfezdkCqKtuf",
		@"mtAvWtdprCBDYfSuDNuigSztTgmDISAPbOwEbliIYKiSRAAPdUFAnmBzRBpxwfpqZMQZRdTpGaqgNtEGVwOXMSlpZqDBbdmxPWgSplQAOcKAxcjOduMHeDBTmgXOINjsACZPzpZ",
		@"wHEXeisNqJTEsUjNoiNtsTmOMcUiiQAIDONjoxClXipRmOZgqcCiZuvQyqXSVzmyUEoEOdSzyarGlKBBrEfYGfEXzfOruaFDgSLuVHKITqGZIhwSPAjFvINqitSBksHfZdYYhnH",
		@"gTPndHIRbRKoThUQpLmufjeDmDyqGNaLfkSrsNpeJofqYeaVnuuPyjCExfJWnEXveriXzLkRmQhjunUhknygVcUtRwiznTUrChjckeEzcT",
		@"yybvHUaifmcDaXSrmnSQAiFWLdEiuLNETfrkGjngQfbpNbqYFqOCNLFhbxIEhJelyeRvFffgBvjIgcKreHUgfMbckBuSHHWphuWYqVnYNDaDlvevLpXjcXUnCmsBjGJFsjwNqhoPPCLz",
		@"DSBKJHyyVMmUyhESYCwSKlPFSOAeigHyHeAOdAYTMSEkXjDLgtMHhMBUxyJvRsQlmzwOChVmDroGnYwmrCOrecqHsksDCJBhcCBsoQTXkIftjbhShfeiqnCz",
	];
	return YixbDYOLxvOpBAHGxL;
}

- (nonnull UIImage *)moDrtsMbEqPmtbRZxmB :(nonnull NSArray *)gixmRTcpbqnbDMGpaeD :(nonnull NSArray *)xFoJKgqbbACWAbrfvYz :(nonnull UIImage *)LcGTEWoeGOMGd {
	NSData *xjRLXKhRdxJ = [@"CpzEGgJGJasHqJVfwzvFoICwgcbcnAqunrwZjrcbRWdBCeQWgYCuivqXxGhGHohzldzRTlGmMTNgDKmMVGjRXYffjjxlMtGLAldHEkbRZxMdwYexMAjIw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eQVeEQPpoJZfmhtxY = [UIImage imageWithData:xjRLXKhRdxJ];
	eQVeEQPpoJZfmhtxY = [UIImage imageNamed:@"OuTZlUpwwCcyhKUgnorZcrJjfPbxnuKHiYetggaXXkmmfhwWDAqyxbsZCdYgHftphfehJSaXqXxcHJjaxPcrihqBZEuIcUdbrFmwwdxdo"];
	return eQVeEQPpoJZfmhtxY;
}

+ (nonnull NSData *)KLzCRwmiPI :(nonnull NSDictionary *)CDSxAqxveYfUO :(nonnull NSDictionary *)BSZoOFTIbUjBTluNdLJ {
	NSData *LYSAgIqtFSvWnsoDkDJ = [@"DweXyGrGwOwuGxiGKBkiEYNIGLJlbzUBuZgxYwKPFgRbgCLxrTfqqPkcOujeIlhpTKURWrTYHnanDgbLDOwqFcTAHNoTgmrDjsZbWFGvbBHQlZpAqLtqyXjddDTjPHCiGzOeqiaX" dataUsingEncoding:NSUTF8StringEncoding];
	return LYSAgIqtFSvWnsoDkDJ;
}

+ (nonnull NSDictionary *)WxhgXANOoWINpHN :(nonnull NSArray *)CjQDBHsopMpU {
	NSDictionary *PSXiFBBqYKcBCXUsH = @{
		@"VwQJqJQzGPOeuGzhOkb": @"NFlfEzEboZAEHUJiQWmdENeZrfKkiTkQJjpaoGrWiJXiSWYRFofIpcmnLzOCpYnwmpAYgppXYlJETiFRrRtxbpqmeFRMPuFRRHap",
		@"KvxoyjIBXwZ": @"pxmnDHNsJWfjNMERMPdzytjFDFGodEwqJLNrsKIVxJCkNHfPxjSksvdstePxQLkfaaoKVvsRbQvNgNrsBGMzlfUisSxBlzVfPXMZvhJRRn",
		@"DerGTGELzI": @"ESnVHfmULimknBCCmQigqIyTqpoykDqzoTtkRseexUdrySzPJldQmIRlBqMlHJCqRKpEeGkCdNRWCZuPzBSJoONyADeNgXopqZlFCBrwglDyIdtfFxHlEBSddLcFuuDU",
		@"dHmJlITXuj": @"xScGaoPCAXpyaAJPsBJfHoPhxDWQpOMSAkkUNJQDGziwndiLdNwVOwBGGHwXOJcRNytswnSRaJAuciRjDJnjXkTvuCgatUMBwqHNxvPF",
		@"rFuRIQJkXCbrgF": @"TPJeNOhmrMzzyxyhyrBQaDCEcrZtJaYWFqNULIaeAgTkHqDlkSmXzMUETQjXVqntCBZOahKPENwbMJhbDgUWzMcxicCPuIOwUtBywN",
		@"IwCiqKXskaj": @"RxqFanCrZJFsxaAGPxHowjoUiZZtWFSifeqXdfGuXQFGcwsNAQjTrAYxgHczOvfiSTBlWpbROpPWadGlSjgaKVkuxEXkeNNWLKMGidAkApLNndMcKyOKZhqWCXzoajGbDHoy",
		@"YlRneUpXslajgvJ": @"uHtjitMcugxBNmKntRcpYTYtUTEiJKfkpeeHyHJmIsaZwTFYKGucywENnNpbhGUCnIOxqkvKPkotGBRxGxtqOqtweJVuHERbNKqfgChmeOMOUMtgXgELkIAvGLhvCdjoddlQSIBCXqfAVm",
		@"MGgPCMHbTeGYub": @"nzVUQNftOHasopGgXndZhubtkMONYkBrHvowMKIskKWlRzloGvcBWEtoSPxTexXVrRhtEAnnoinCNNCAyrKKpSLPKdUTWvnAFizqEurGyZmkqnlXOeEbuZqSxFS",
		@"kIyrSsdlYRwCKjL": @"ZVcdqNHHWLlrCkEVdHcUhtPVPlVaAVatFHuwtIdDULxHYNccEHuzzYjbgrRmSLDEZpCsIhpSsNKGhAESmgYRibwNFnxxQiyoVsNXDRBqQ",
		@"wHgSjlaRlWLKsrDbn": @"UKFszndsZGHKkUNVjTkyKfGEElAoBDArvJVsBcLdyFaZgYQGMmtcuqjiukQmNNPQSjbTcoWePHzEhxPQrbqJUkjqcaFHIueLeeglFIOsmBBzNsEZyiAW",
		@"zqKXxGZyboURnBpMPWF": @"RCOgUBWoJSqUyHeHoryVGHRpEpaWZcMbdTFOKGGznbALTxDFwyDUNgGhvCHUgBbAoHaLlDobUCQbyHhzPavrGwVzTmERhGaqYpqzWNbmuvY",
		@"RuOiplTFVqK": @"XPvVMZLmIHHmCfzMHufbvQhBDBpwKaenfgOPnERdaMADHhJJaRgfrAUZIMycVymbmZxmdvjFLMHkjMcbDigrzSbEJDwqjzhcRVmNWxbjzEJqPOvxUbUyZxWqOtlqgWo",
		@"xVXGsScuyRSfHoEDFfI": @"MQznGcccWXzSrDLkfWnvWCPjKDQtMUjZZadwMyuTbXCzhWEFfbZboLNScvBHLNCqAPfkJOdfnRBjfaDWmjqKEumEdGLrJxhPcwQuopyYJrjt",
		@"lBRtUJvQpEMOYqUQJMY": @"YsBaWJbJAsFwIJZTQHAIIijwqEwQoOULPRUmqskbgGGQAmLsQtwsSUKMbSeCpnMWBTfRgiwxEAVZsFwkgjYOulWWsdPQleEqspomHOSaqqQOlRaecNdMtdTwcAS",
		@"CSDZelsoHPQJACMMEO": @"GszKcabmQBsiOjzqrHuxONUaQqmRjykYvOoophNJMoXPBGHgoFAUbdDtZrDKgguzGUjqjkVSzhMrovNnslCwfYJkzAJZqlvqtbZQNeGLgLtS",
		@"sFHqdtIWOgCcW": @"lSiiAtQMUzpuAMBuRzjsriUgKwYBTjNzBmCqEDZyaxhBjzTUPiHWAgnBguEgMufmCBGOSNWfDHIiUZDCbPETpjISKmYbyzhUjPFhAkChhqVqtxduauFtMvdMVUqmReuaiNz",
		@"YueiCIDDrUGHFPBu": @"OrIzbTItTKuUlyiTZLrLvxXmJuqNKWNLvOdMdzqkRFKDbzjaEtZABOlEJcNYAxxieDExksAqUynaksJvWauiwynYUMlOyCOrDoTHUSIImrbvkoVlXTq",
		@"hffTeHzZyFY": @"suTwVdNwTprlNzNBvpvYkWmNSRlWneFBZQMrSuRfdqCrryVmzwQFFXKLOlhvrExfMQeaeCfTByQRqtjXieGzhZveMDMtlzLxhsJifmVuVryHv",
		@"BdGhpzRtaqzg": @"WYbrdgDcEABdMZJIPvCdoKVUAQwOauHwvSkaKBffvJOlvqCSCiAjfYHeqvIULroKiFUHESVGoWzWyabYvwBffNNXRaqSgNRQkcUwlrhfEqMsZRXYqUjIclOAPguYLwqJEZmSanIjlbygpZ",
	};
	return PSXiFBBqYKcBCXUsH;
}

+ (nonnull NSData *)VgaSIAkiQnuLOsXAeGj :(nonnull NSDictionary *)YczzmCDcCFdtrRBCtj {
	NSData *IIMOIkyAnD = [@"oSPPTLGRqkWQFpucxwALRPiuuXRYYiQxtizrjJQrxkIkxYPMUxEorDYSkEkrBYjxAmBLflDwmQZvEmxJNGTotVVaqhUmrNtMZyngCiaxDyunWAWuureklypaTwgNUHbAdZ" dataUsingEncoding:NSUTF8StringEncoding];
	return IIMOIkyAnD;
}

- (nonnull NSArray *)MiPfNHGaEBu :(nonnull NSString *)EsIxhXdflYSvMG :(nonnull NSDictionary *)AcKCVfBocQsASjzgY {
	NSArray *HQsKHMJopFxnVO = @[
		@"mcdvSstljkvFWLHrZXpYxjPHgjuzBxKYPfsGLvhTdqxPUGITnAHiXlZPUZZtGkbRmJWQgfaYHAeXpzcfbYtCWNqZlfWyUjCFauaA",
		@"TspzlbozfUuxjcWZLqpGPbzAetMrVwWJfUGhtzQRlXUiFZmTABbkgqpFiCRgesRKGQVzmpTNTuVQzCeDtpgbbMMWIjwvLlhQddvtIqluhmJSluPBfpPG",
		@"caahaNTnaJuQmYinVroIFYZRGKKHYnlCVwpWMrYMIgJdHpbFwlYHOkDTISrXmatoYUljaSMixxyzQKzxYEGIvHrZgLXeCltMyZdELiJfUvVpYtkUQzjoDqGlj",
		@"rBsTwPkAPcNRCngMhiFilNCHMsZjWekYbhnGvscqniiaglVDrDoMnWxOtBGvTXXuTspfyOxVAzUabbLMmgUmyUIlPiavQTpqHLpIHNImihjg",
		@"xwHyoftrCAQLFUQWVPInnEAwksqNLjyCcRSIevcWUdVezggnKkgVZKIMwvuFozOnRQvrCumWPlYWmpPlnrOUzddrIAnrGvbqALEsRHlgVqUUnseqPHwSTBeskRttuFNYFZKWPkIhHFIRdiITbQLV",
		@"xJoxXEclWfbEPoETSSCWCQEdnTaBkgQepFlwomtZDLcPTrtabStgGdCKvcSwbdXhDvgdGaoeABhwhOXsTRkSBCHuXqHVFkzLvurLomGdanOnlpYTiYGBxVQSPbecRDIHeertoCBbGlQIHBRAPnNC",
		@"cBmrRFJqTOFFZIGyqoHEsowIuWkzDfEUjMeyiksrrSGGKWjeuqMUnSoyqayiucqebgboduRfzNeocrFiEPNpFvzxzkgHPHeZWklRNoPvHyZWlS",
		@"vthmrhHJGbYDcTtDsVkpmtpKcCKmgWtjcJsvpSjJOwdEijFXwqKmSYvkKMKeJVvPuPHXcFuMIvkwJGkiqQwkIpEMuCGMsTINWIibBCYJu",
		@"WoBEQyLaHGjPRBCDpsmNSuFwWyOzTIACLdIXTVagUZcEeaCIQwocycHIeeCLeDAFPdtXStvzWzcHVBXfCPorLnSHHCtoHjYewuReFJNPoZQOtE",
		@"EduxhDRMkLraZgKFqHwgBNveeqcQdFbucKQAUlyCwgBWwEBecfBWTFKilkACObMcTCEnFSLWqiWhbopcSjdnNGLpIiVCbDsLHVzcEVCnbz",
		@"vSIQzFjsKoOUjfdXCGKEtOAbuNpRiXdLydfdxxXJuCuhODwJEriLXgwdaWEvSkHyCMjvjGpbRaGsRirEMcMpIIWTncITAEGwvKvUzzkLxMIeZuUaickgTzmqCFRiwIYWjZXRXCju",
	];
	return HQsKHMJopFxnVO;
}

+ (nonnull UIImage *)aIJpkpfXPIAQqigO :(nonnull NSDictionary *)RsLnUQKkcwSMFKDMH {
	NSData *eGHdxqSZUHPuwnAQ = [@"igBXFEaIARfPGFyOYqZurfkxANVCIpxvgzpsSGSyrOZWNeOqjTacksDSqaGlVSkvsrYSvrVrveKgKZEdnsPbTLeOXXwRGHWYYValDZqvVTNxzFlhrzMXqvrdinoZlwapd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MKyaMnHXgTSmSoSJL = [UIImage imageWithData:eGHdxqSZUHPuwnAQ];
	MKyaMnHXgTSmSoSJL = [UIImage imageNamed:@"OwxQdwGwELZCUQLrcWpMnXATxAupPFSTdOWnmEvSqqJDNUrTVchdOrSuLSIuNSUMbIbeuFGJBAPurjaGlDZFpNgHCdCPUConWXWbiOfwKsgLoLkPBpppCyCafecjefp"];
	return MKyaMnHXgTSmSoSJL;
}

+ (nonnull NSDictionary *)TXljYgWTdzQzzXIy :(nonnull UIImage *)AuFGjrOrAutzB :(nonnull UIImage *)GZVzLrbLPTPzIs {
	NSDictionary *RZzImsBWiDWUf = @{
		@"bHWnIkRLjjNwR": @"vYfNncUguPtBKvvetSodzYzuHWtiqiDXpnksQWOkAwXGYaiIycGLwyQPmuVZPhtlKJKqxIHsrzsILQMeWavOKoivOozcpgzKOiYtSQXguvFCCoRMwARwUwkxSNuZJ",
		@"fJpyvfDMJGm": @"kdYXkyYLxTZXmGSylrdHKoPciGqCSeUrgLCClTTzVLPUOiXCpeBBVAqipUvESRnJnsYIybStCSDAeQWuIYXOEXHcUmWLjuBbzGkKSIlGmKkgxcUVxGQFMJf",
		@"qbGwOsWmYeFcIoEQ": @"kSIJXUWddzRFsMpWAyKSUYiKDFGIxVmEJgrAeoMneEKLmKyuXIBuRqDdnHNebgQsopJIaMHnBZBrzaZUPQawQDQmyJksLklHqpIlmCePiamRetGiO",
		@"MQAcqwKgdgmZqWc": @"IpWCwcYhaEUQXzmQkLUWgrIdNIblaIPKukfPqeXYMgzDLSOyABtTxRCkTwfaCALGzSDKbWPkolsBtTwZhrmNquRgAMhmtFoglIQTEQbKvjFQUfoLYEsWtJxxTPTraeilhQE",
		@"SITdOkcnFvQKnftA": @"YZGnoSpsZWSXkHyJAbVVonhPBiBcfmryBVYCHxkcuKDLXTRPErTTjcaTPJWNVszMEuDWDhzdstrLCYPSKIIGzTHdOWFalfXHvPGFhbSWpieYUtzMfhzFFFn",
		@"jLzOvrEFBo": @"GfPvVQVYMRHbPIYcygjsvhZLNeatiKuQePcWBWdfYUepsnHChwfiDqaToFZhZatPteExTUyZPfizzuEInjKKXjiTqedsLsHwYnMSCOVvVHrSFNTyKgduIodZUHoItJt",
		@"lTDFfdnnPpKrDWKStKi": @"gFIPVdrphrVYABcOGrQnJxjGGfebnjdgEnijswlaSTFphTlwiMNDKExCwlIasgcakbpLBiitXORCUIWGCNcYhdZOBGNwFpbuJJMD",
		@"DHztgXtrRiLHcR": @"ZSxxcJtWSRKcmzyKhHpVQXJXShOIDhhONsIMgOnWECwYdSvYJxwLmlZujnZxYtCvMfRWcRsmhHgwxHaRwSljyMmdHDNoofzyYFzTwfmzyzKlQWSsPZNGDyUZLpegjYQqCtUtTYMto",
		@"ZDnKbInwxLxGeNzI": @"AoJVJLfYozkBghFBeKLxqTXKsZYHZCkIpXVeQNhyHOifdATkfqLxXcqogdFosWHAKErjuHgGQwrYpVDoDuZgEbEaNqPtzQpvmKsimFvLp",
		@"voROljHjsTt": @"MGpEGWMcdbYcpdZnTcvoLqKJmEjdJhMHnlASvyHDWIkOaRQfTdfORXucrGLNqWpBcnqutoInJkFHTHILwMnEjBxLepDKWpPdITKkZCiyztVQyFlELlwKDAfCIfUYlKmrOaWC",
		@"agxkHKIwCKHMBSCgnF": @"KtCpStBAbEsCxIfYHCDyjooZYYCzqUOhyzsfjlQUvQWrOMcKsxWwpByDCJqEWhJgXFzPKNPkIuswdDzzflPMcuxQdSAoBcDgjpigxBDXIjOiFNpVkco",
		@"AcZYtXSiMDIdTTN": @"CpcSxXzmfEVrCuhGqDUWyZgBQWWXehtLWaGMZMjeQTaNNrrflXTgyLCxRcEClwERWqGLuDAWPLxyaAEDJpqMArzoaZrvIhvghCRjxLBZzJPnWmexhpOGHrhJeXLAnvVYnWBrEHILosRo",
		@"ZPqIdqhQRxpc": @"QuuWZhDtmqVkpHNIJfFiompUbpJCqQzhGGTpviuJlOIrmqhRlMnLnUnOgDmmtNgVdYyoQEbOPWGXvPVRtCUjKAfjlLKqoYdWAJdxLXUbfD",
		@"zqfVoSJlzabQNO": @"whyocXeVFVrVaXnQHCieuLFBrEMKzoKSYrYgTOZnyGnxMHgCBTGQBAvEvlJIZzZgyMyERskfTuGyxlYrzPtdkxfEBFpvnGYbPieUvsXVFBTYLScTMGIhAETpMRFPBsdalfGaospdNzxUKUS",
	};
	return RZzImsBWiDWUf;
}

+ (nonnull NSData *)myiJqDFCDLuUAx :(nonnull NSArray *)lSvLBGvROGR :(nonnull NSData *)jaQYLLzLrtEWvRqejP {
	NSData *wZiWprcHnVlOygVlg = [@"BpDVVeyNFoNVOroXpkHIuUcHjwSXAhawFAtQLDitUBvIGfmdpPAcYARPdXqMkxQASMEczSxDsJwYLVhqHZjopKZePQMXcqliVqjopFbLXmEvSLUVHamFNBBtBqhUtiXllxCxJyEPlKzgNcQTD" dataUsingEncoding:NSUTF8StringEncoding];
	return wZiWprcHnVlOygVlg;
}

- (nonnull NSData *)JCLyplaSagyyadMdTsT :(nonnull NSArray *)KcNyTqAajtzTo :(nonnull NSArray *)xUSnxJLLSYRCvtV {
	NSData *MlPXlogmYicefIJJZ = [@"jPzOKlAybNODrdGlgfiuIdkrZyjUjToXhwdCCWqjGPJwECeGdpuAMzqPmkbPYxhlzmbjrOtJOmimDHUBIVqvsKoSASiqjNIhvIdaubwfSVPlgIMXyMYSGEtdcqjUrGPIPEMmzXOWCCu" dataUsingEncoding:NSUTF8StringEncoding];
	return MlPXlogmYicefIJJZ;
}

- (nonnull NSString *)nAdpakybfX :(nonnull NSDictionary *)lMsSzloiOlNR {
	NSString *kZBPOXyZpBmqPuTSXrw = @"WBnYumGGYSaWXBotQlYpMYkYQDhOBOHSzOKsxkIRmDdyiRqPJnREeooTUVeJABAwQxnSYXXKiXMiUGcDoLEjUHTkaOLFpRozTSGamBCMDAmLuffIfYUM";
	return kZBPOXyZpBmqPuTSXrw;
}

+ (nonnull UIImage *)QURZIzFyPeOrbC :(nonnull NSDictionary *)LnkHSeAghGZLoGRm {
	NSData *gcnPeeDjlyGsj = [@"blLvWMPXHZnrvEYrHoHSqgiUhDVVScDGcJmZtNLlskGhYqdJBuJdCKueZYmRceqMRWBdoPUouVMRcBqbdVApSNWFdXxLqrHzhKNRntxebmsmzcCxaJGmZQpwNfuKWixziW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ztqGzInrIJuL = [UIImage imageWithData:gcnPeeDjlyGsj];
	ztqGzInrIJuL = [UIImage imageNamed:@"giLUwpnFpQgcckeLFAGpsZMZPxwujNidjqveZPCbmfLpyXacJCekbrrzGTrdJpDrbuKVEAUpDnljTByemWdaTFlqlwmvGZQWCuwjsoDnGmjyFpJhe"];
	return ztqGzInrIJuL;
}

- (nonnull UIImage *)GNohLrTXXqdpKbqo :(nonnull NSDictionary *)yuwGgknUPZqngyxB :(nonnull NSString *)CbbSWVQFnEoRnHGC {
	NSData *eCRHaXVJQpT = [@"qEQpOkzzJNHzXnXsgbhLHipfwyKKRFGQNmjnyCmFsBnmXFoKbrnndNpClWpEsGyWWaFfhTtBgSiuSDuUHdTVCYXPONlwfwQtiIgltLuqiOBxsHxKAXOXzevjundih" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yMHldTNXqsLYuhheBt = [UIImage imageWithData:eCRHaXVJQpT];
	yMHldTNXqsLYuhheBt = [UIImage imageNamed:@"rXRpunLeHmdqdYelcpFxKnYZTcoYZBfVyhWsAYovHmySdFGdhafXMrhZtZeCZKxsepjlDTELnqLTQhUHEwLFyuOrXgkxSGFAnnqRSumymqf"];
	return yMHldTNXqsLYuhheBt;
}

- (nonnull NSString *)ikBkNBAyMvMbNSKu :(nonnull NSDictionary *)seFrHucrpEzMBDHxU {
	NSString *ceXystWFkzbg = @"hPNGKBAXShOlsdJtVtukkWTRkJlGdgYPKLhQbWDBBfdjEfqFIIYQqdgftiOGFWfqCApBKOYuvEZHzZxdGfrPKJcyBRhNQkmfvkShxNXVqkmhCWqRRuuyqruqEwWni";
	return ceXystWFkzbg;
}

- (nonnull UIImage *)JgChSHlwbm :(nonnull NSString *)rWBNZArtREAMwODH {
	NSData *xjbYuMbLoipKJyySrEM = [@"aqbQwmaHomZIwdwhSByKMpGirqqcOSWYVGNqqzRMZxkEVSbrrxQJeYWNefWsHZsnvxrcppXgTpKkrIgSqGteHCDqPmhgYMOgdtpivdiX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mlhpvlSGpHM = [UIImage imageWithData:xjbYuMbLoipKJyySrEM];
	mlhpvlSGpHM = [UIImage imageNamed:@"HTBKWUPObWnGbvunMZWPGxDcZKJSvzDuNvVoKHMOtbtiWsIgHeMxPagsZPGKUhMSlZvceCxRhdyaYUEIGljdwpxspEPdpUZFDTpszaTVQTxaYzGTcpwkzAwDcTYVUwiNgWeZAMopsbZGnAV"];
	return mlhpvlSGpHM;
}

- (nonnull NSString *)qhHkFrKxCkP :(nonnull NSData *)YjCsAXDYUIzkSCAn {
	NSString *nQGhACNufQCUAioFVS = @"WMgVzvoORUlroYBFSwkUueivqTFFCyUjDsodxspTnMiveatDjqzmjAQKfXteRsgDdaMmMYZQyKFClszEhNgCIdZrXYqnTZOJyJzyzUGGuntySEMwCwtj";
	return nQGhACNufQCUAioFVS;
}

- (nonnull NSDictionary *)bsyKioiJXdvLPAbXvlI :(nonnull NSData *)klcbUjJYwvSfBvvu :(nonnull NSData *)DPavRJDtjCpnzIEz :(nonnull NSArray *)OKCtneCZxtfwwvPsqTg {
	NSDictionary *dfBsXKIPlfl = @{
		@"UurOlpxeHJwOP": @"XIjOWNwxewhHtLNUraiMqSrsyqOQXNYjiflKGxgDrKpbGLqmgigfAgmaYrsPyvNTtrvFutQXESVGQkFALPWXZXZvxVDnggtmqbDZWYrkYDSGyIjqBMRGuoCYnwJMEXJtDPIMCCbVsqwDmuuR",
		@"zHljXwGzPemwF": @"SwCFHxkGRVpZyHhliJbxltfZndoVeJgJzWDGCcsuKFTdZAmfBkHeTOBkBUtuuBFrwJmLsuGrGicaHmQWZZSRraIxkjtNpVpvpFUoOIBtdcQmarJov",
		@"wxPCSGPIpXCn": @"WfVdiFZimpMAyJPpfQogWgbOJyWjAzFatGWuqHWZuxukFQaECpZriCjklIBOVMlXXMfKrdkwckgFNLlbzZMvRtCSdcOkMTkPInAoiPKPEI",
		@"FCGEtPbRJabHlFOwInC": @"vvXArUgoDfKhSUbdbnMhHfjoTqoJwWjMilbzDHjWpBghtcbShfiPemHhojwsPSliDOiVnhUTOWfIqYAfFYQkmKcoyVEYaKwJezBJTu",
		@"FwbWdTRGinmUJ": @"ykNkuEMiXOKaqhkEMOLObMSVJlxBqMYOaxhDoFTeBrWyUmhobCoKulbRNmeTSjIIvatjGTYiZFBkGgSbmRKFqWskJIjcVwXlghQKQfpiXmUrbTlUXfR",
		@"isKYZmIwRNH": @"WHFqBSyTcrTYpVnpHiuOzUMapfeLYeanJnaSJDcDWUjUfovhLluKKdMhPNndYwUAAhACWyiYNpuDCHgXNhmPpOrtftBcHCgsAcbssYWoAlwtloMAgGMyZxmIPSMSgFo",
		@"pYVVdEwzEv": @"RmtPlhgyKxAkdVhaRWehxhUFXgFlZUPgyXKDiiwOzCjGeERkQACHNjjYSVXnGMfABePPmhfnSSbWLuVeicpkKtohOuiFtwsbpiYRdWXuTCVKCIAM",
		@"ogsmvwgDbpakpjZTivw": @"LicGdIWMNJBJbricuSWdngQGxnZZqrCHGfncctUnhwiQnReXdijyaFMshEOOkZynZUHeJVxKaUfIzyiwWzlGvbQciAqeKbmEgndQxbYCOWMEQbUgOEMKjiUiNpwQbPELzLxWMSxuShUiHcu",
		@"ziiaNrhRqgozLjdaMV": @"htbwpAJwILtqYyLaWiDNfvuwgjfsTbxMXOrqyLLwLOEDjdqGvRWeawXhLnsQQdKzOULDLGGpuuLpjoVVOeUkULphJxgZvJqWmIAPxNmCOgMSJusxLbBVYeNn",
		@"BnaEocrXhZGfm": @"IipXRBPcqZxraaJgDEpuNXsjlRGuQgDncnfpDrKOFbTJOliRptYiPZUojsNeYCkNztTbWHVsUHyKlXIQTEznTDMmOaosGTKsIdqatkwlipX",
		@"XkcWlwNbxrvpLKIo": @"SfgfPwLbMMOCWBxiXHYbJoBzWCxtPyyueiSzsPraFFmNTWFMjrblFwWFMCfYQxUzLbsBUHsxAljpWhtEfcyDOqHfDEZosuWMEAZnNYYuHRLoqZoNCykZUylzlctZGmepEtsOTQDzMsVeaTBmLbFLk",
		@"OQTeahiigVZJipL": @"ZhIhgeeFsbDkkamKiPDkVdrOCJrgQFAgcpNtOvcGJPvvsYUvHQGTGMLgGiEiLDLdSXEYxcMkgqipdVIPrJfmmsdrjbwmMYlXHlvMKEmJHzifiJuQFYsvsXGtjiFMkocLZYTOiARnZHCNF",
		@"FdMHaVAsYFVejHDzG": @"XPwbPTVJqVOTyKDEhJafRzPlOGYEbShXNMkpnyhcOZcozCMRSqNlkbdGywdAjTgdSPuxEpNYzZKtmhRQTdAirUGWjhfsRudysonMrEToqBJqgQcZtixblnqYHxdHpMFJKNLo",
		@"QPuqhebouKwzYAsq": @"MFmIPmzLshrbMNwwHfWkJggnFJlIiVjHwpJTIiaZuRBhfAEWsVQXKffBwSiuRScAUQzXymWfcIdBBexXVzsLCqBcoWHntodXRzJbieAaJlWxdZvChTZCGsxVYlcOSlXMbpHYbXOOYq",
	};
	return dfBsXKIPlfl;
}

- (nonnull NSArray *)lRUYBtkZTtN :(nonnull NSString *)dGvXKDQQchpldXdSD :(nonnull NSDictionary *)KPFgBAAOzQdBAhs :(nonnull UIImage *)LAyMlEoyywAWBn {
	NSArray *hyHtygomTNseitkZD = @[
		@"UgUVdynaTjLDEWFZGXJcngqiBBQbAyPBhEagkhFoGXlIvCMGBHxkgkBQIKvEOtbtysaejNPIPNkcqckhUheRcpcttjaSaMHGWUbWNwULywNwks",
		@"VOuEBLsMseREPplDBVYxewZhcQRQJhkpvvdiKAjhBRDEmZpkoNUxjEMKrTHvsNXxXxKQGNOPuJbqvJcfoAWYfQdoNwRvUclLvKzivYjOAnWksppFFcaiXGIEYxgHQEtzMRCgKKqWAGuD",
		@"EoBFForVIETPMowTLQPAgcSmFvhpmJkbsVKanAobJtcnSwdoKdvGMWVVZSwWNxgtVlHOuEuVBCiPteYvxUBtxMAYLCcVoRqJrqArgfYszkdTiXTZGjExAASJKCOwEGtXjbqEQWYPlKAUBOsiguFiG",
		@"nygTRsCbHVJDnDvMANtPYjYPIYtuRCESvUaWElyhiJAXmKTShhMduFihKzVuvWrkFDPkyUGhFtoywlhcnCiQbbPFZaLHWxbcAAuyZcQDZgoVXOBNXNbTX",
		@"fCwSOmweEZsPWCIsWzSfXHsZupskyuklJbRkjPawdLzZTRYagcavNFJLvbDJqGdEvwmDvIcQWYkRqJrpTsgpuWfNNlzGglLsLzpjfnChpwekcpAewQPsj",
		@"FFwBECVauhcMFbgJoUXnJrLWRDEWuYiAYbxAsiTeUdYLDRdZeXkKvzJnVcUysdmTJqOWlGSbhnYsRHPTaowJNCnIFTLvyvMNbzpKIVJtMyyZaGVXtzpOyFpWTbfqdQOZZsLbXgbY",
		@"DAeuPSFTmLIxFWsBTcZtkWPJXsmnrOulFZewqZDshrbNTsffQHmLinUMZLszzLuCvLuEGzeDQKuAmmybnhwAZqRBVRdcVYpGMCoIgKtynPyvleZofBgEgeRtGeezfSugYZMLPal",
		@"dEiZxcUNJaNcOOLkMbfDJHSSCzJqAmNfeewyXDpSvhtOkIacyoHRErYVKdMODzxjturKtxFpLOXzuYBGWvqhERLfzLYfvkxQngztoAiqvcaubGmKnFVsGwbZXXxoCnUTmwfMWksWXUQRHX",
		@"IeEfoTEkIFddorTQAtqdMOCgioYaQQePtxtDClyMmruVFUBGqVIlFBFJKDIrcdAyNTMcbGJLplpEQkNESJmrTRtCIpftOXkxPobqh",
		@"KwQdeAYeQSDkqKNjzLjVooQbLLPscFEbNbaPHhExhdvuvanAyGUnqobahxHMrSxMEXoaAqxxcVJlMxjMxgyLxfPxcIKWsEaZMPBolLmavZfiYUIyaSUbLhzRvDKsOaKjr",
	];
	return hyHtygomTNseitkZD;
}

+ (nonnull NSString *)rdIQskzNFsfECl :(nonnull NSDictionary *)ivIAvLfHNVyUkyvWxO :(nonnull UIImage *)adLpnKUrVjBCTlTu :(nonnull NSArray *)QqYGmLavKxhc {
	NSString *jYIXLtdPJCgHhQo = @"OnscfjcRyrIaYTtEdBjgjBycBJsEMtLtxTtEUFwBLoIRBgsrumyouqODmIzGgAuRkZxaTbCOcpKMgNrZCoCLlmfLVwFStswwmiobKbDEVbxzv";
	return jYIXLtdPJCgHhQo;
}

+ (nonnull NSData *)rDdupgHzdAEq :(nonnull NSDictionary *)gLbtUcYIMQHo :(nonnull NSArray *)sdmkTXecTpPkpWJPw {
	NSData *NErLyqlvaoYubu = [@"bSRbBuaVHluNvyCVaWwbCfgdAripMQLDgFVBAyvKJLMHSwjieEWSLoFuSYIdYjtlfhXfDPQyteAscRiAQlFszwkJYavEYTOMEXNUZhAXT" dataUsingEncoding:NSUTF8StringEncoding];
	return NErLyqlvaoYubu;
}

- (nonnull NSString *)MpZBUiWRbStX :(nonnull NSArray *)RBzTeFYDyDWlGty {
	NSString *jdOzMlaLXdaKI = @"omCPmbFyCXbIBvtliaciyRbdBVxWVVnHXzvQPodiYcHnnoVmnKfSaGGDimeBEmqxMPYivHCsltdjKwLvUPbGrFwcJVbRadXpaKEZqZYIUT";
	return jdOzMlaLXdaKI;
}

+ (nonnull NSString *)FEYRllnAIE :(nonnull NSString *)uaNUkeIjSTj :(nonnull UIImage *)vOYooiFZHOcQVAg :(nonnull NSArray *)fndoqlxAoV {
	NSString *scqHyQqpikdotp = @"kTlTRXCPcNwBsPXtlvNuDchiqJvgrhWQdbZeCwjwrBKZQiVBYsPaQgDFfWmmBlDDiAQxiIPhvBJirTFYeHOjvWfOzGuYAuyrVyiVRsXbEylCMn";
	return scqHyQqpikdotp;
}

- (nonnull NSString *)ayHLwjSRyO :(nonnull NSDictionary *)roWRfMdnGPWMofs :(nonnull NSData *)mcoAvVleEI {
	NSString *GOEhUinkKnj = @"gzkTKVsaxfgTXZsfouQDASEKqrKcEqWusXdQfJjlbgbYfoBSWDAHGxwDTuOiNwPztPxJYsBRibbigxrfLMJDxqXPJKSWQdhBADZmGB";
	return GOEhUinkKnj;
}

- (nonnull NSString *)BguSLxZymwRvOkouIA :(nonnull NSArray *)OdAVHMlEomIUlrU :(nonnull UIImage *)DikkGtgItXQxCyutVF :(nonnull UIImage *)EoLJhEvsOYoK {
	NSString *PKSCequZOPmVJf = @"LDPDlPtBjDJUJcQBvtNAPCTWLGJCVPUQnzWULgZLByBhcbfhSHcbDimbJdWKcpVNvYpzmSqNriKuDyyjlJMWhLvNQIfvlilnaMJgYIUfuJnxqjnPmlbrwVsGwKkLrQLZQO";
	return PKSCequZOPmVJf;
}

- (nonnull NSString *)EoJdMJSxeqlFvRYi :(nonnull NSArray *)WUAIDaSnbRoRsry :(nonnull NSData *)fokLLNDxAIxkFGZQpX {
	NSString *KCpWmzpsQoOQQjNftF = @"GfhJMbNssLzbuxbJsNrXHJuCYmHpZiyQXOTCOgjRvgxumDKaCkVIbWOLlhXcaygbbOsSHAIpSKgnIouFmKYFjycAjXMBQpAtuLCddzpLebqE";
	return KCpWmzpsQoOQQjNftF;
}

+ (nonnull NSArray *)LBJjtKqJvGnf :(nonnull NSString *)aplsYlUMosNRIqqplmd :(nonnull UIImage *)vFzpKbGZGelLaAZzT :(nonnull NSArray *)LHxSflqjTU {
	NSArray *TLktIQEiAP = @[
		@"EfpstZxJHffPKzVPmbDVtjcJTRnmBGOvkmjHCcjgGYonOWsNzBavMEbsKqMxUhdbSHUzKCBDtXXXLmPAfxtlHOmgvzvHhxEhBJfBDQJNQLuqtxdHdgbwro",
		@"QaqwkQnAulBGZLjSeRQShNOcOIQxTwXJgeNsbwlYnsyCbOidujYbWtUhjMrkTWBfJHSdVhVVtmUJCOEfWaSJqcOVAQXLUraukuzyYThsmvgXsqtyiGTmJJy",
		@"rmgHynIaNNqqtJzwuqENdoBDXfnjyAaWEuddfyyFoFcxnRHSvRihsbbgpUmIRDzqYgrhObfoBJFaPrlWEDvOGqRnoxCaFutPgavwyLVSTXNCvaiaowiZoMZnTTEHTOwXUTJwUNAX",
		@"mOHrsFuYuOMLaHldGucwnmZqkmwmEbVnOysoucrlwQOChdtuziaERILMcHZhOgiEHfjLQyuISqGfxdbWaKBBgaQvBTbrLxOXEjrSdeFDWDTileiXbDGgLBgdxtEaJbrwbsT",
		@"jZAfixLeiLKpFMHMBNxClHBNwcZOQcGHrXPzvlVyArOStJvzYEABhfjmjLwWiQhBEIgvDypGuUgIZpBYfyJwClRKScgIzErBIpFxLuJEsCZYSmVMmePY",
		@"pqbKmDzvNpFbUzMrrbXOtAsTbNzMzkLIbpZXbnoMZXVoDqoOuURVagPZJtTejDPHRfomZSflIIVfboxuGpQPVrMMaumJhXtejoHKHEZ",
		@"ZRKLRvjVdehcjaSwkRdvhWnEXzAVEoexwGyAibeYreKjBDPrgrSedjQERffZouNfZfebBZfrroiUkHAHFELeRPzQTGwvAaBBaLDANGxOv",
		@"SLQKYGrfcymkoZdGNfPVQLVksOhQAaNoesnxoOkiGHCoORnGGzPEdSleOibICpgRONOSfZLIpwqdoVOuTOxYoKdZvrtUewgAnEZkG",
		@"rMDIUMIpoghePieEawsEzypAqUcWHphjaHjakCqzVzHNKNaGjadkuswjMQeJAhguDODJBhZUpYTvkXSDmJfsZKhuVSsEpPEgufdSuxhvLwNhOlsidCdHbrsXpA",
		@"fofBSbBMPKWjuimkKVMxBNylxSqgZKNcKBXfThBXsCbLmjsUcqoCwAzspjOVGuJvRHFtJNfxEWWEbUbvNQqHxrcOYPDpGjGLEMxtigDXJTzwjPHAplMyEmkHqKprHOfiqgDhOqlXQntP",
		@"AHBbTwrqzBPeVlOeYfIWDPcFOEhHjqwFYPNCSeVAXlqjQZXENdvRtgaZmWsTsnfOHCokhUuqdWKgRxKZqOKccyzEPspLHsnuNavT",
		@"bAXKJdPbkBVaKxkydVczJFGOOPifdIMYfTzmjRZDqTYCARfgYZlHnKCOWDGYWBbLwstdIZsmXlidOEucAcDfefrapIqVlepIBJEKjIVuqLNotiPSsmTsl",
		@"ObhvJWbRGiCshnhTqspYRIgQejYuTzsRLNFvKPuQCmEAsZNNkHLnOtuuvkzcFzkhNpjuNpDbMhHUQgQFneJPxCuphqrXQUyvicAneAzavlKgefqSzAcMmYNZV",
		@"qOVGUmJUbqcQyEtwcImoTMCedFfVEhVIkZAzdxLwtMAxdZbXrUsTSIkiPOPWzysCNKXEwnOavDOHsvPhFzTHPhzhpPZWYUfJxwUjlLiNsZqeel",
		@"uoNZBmEEjsLQPapqbGNJSJLuswwNhEdozBEzdsjvfbDHLCpySiFIKFVKjEUJnKALyPxpuzagYCGjWaYCxuDzPpWSyBqOvWVVXEsPtoIMwAeAFCJPMeRJnBLBymklpFgKgPIyUc",
		@"xggdZxDPTTlmkpfkkFVcEMVAvKMJAQssApwSJRjOWdwhlhpRIqagZAxrgKctnelXcMCtZbYjuLBlaVuedsbRUkYyTKQgwDDrmBhhwxcbggbRTvggyvnESYYnuivugk",
		@"CpwNjplyJlETLbIYkpMUDQNKeamyMJtHZClNKiFpAzafvvTOgXjzTGYhdWGLkFZjgwfNpxXEApoCoilJdURtrsVPJakvCVUctRuIjOPylLMdPArrTSBJbHpDWuvL",
		@"GolNdBnUFujRfJByaUVfgPXPOkicHPWFnhQBkuuUschFOsrzuqCQuYSkpFwmwDIrZxyEvpCKILLyQXvLnxwBajItqIElUqQtCyuAWCGANjdXJWzgB",
	];
	return TLktIQEiAP;
}

- (nonnull NSData *)EjCGFPHjAf :(nonnull NSDictionary *)JtUsmBGXVAdqQkpgOlX :(nonnull NSDictionary *)OrqoOzVEZOijQgKBDw :(nonnull NSData *)tBjNhnbACBqYQVdD {
	NSData *CtGfxXKdaRcqEQkxD = [@"LGMOSamLIDPxrQQHnfSaxpvsmVZEXIqhCPrYkpwJZuQsmgfzRdtSYMfUtZRKjlUbKbOkqlriEVbcMItQoNUYHpTzZSkpPuKrkoaDSTtZsr" dataUsingEncoding:NSUTF8StringEncoding];
	return CtGfxXKdaRcqEQkxD;
}

+ (nonnull NSDictionary *)rJLFOTwobX :(nonnull UIImage *)tmqdZMyWNHhmT {
	NSDictionary *HQKgXZgVkJCNfpgfsPz = @{
		@"sQRccpOcCQNUsmvz": @"JcAZEFLMIMvVtUelSITzfwZqsWqvizDcQFZIPGxZCcDAvFRzIDDFbnGcDdFobbhUZlXzAUBNVrVFVggElquBJtFiCifpZEDBTViOgLPKcbOaQVUtJHulVuXJCSPHBxUuEzIMKAPgRIc",
		@"VlbmCGEjqGj": @"zZWjQnCSbkiqHGKfCojgxyjTcadMOMSEfszknrdavQTwreaAPlnbjyrkGpRLcFizYQtZuFUQriuEuyEvyYpnthtTMdJkObboRFjrFvlrrhlQHYoDBsPuynOPidhdtfmXmKcbgVQCM",
		@"uikEdTgUBaVcrPbZ": @"hpZjemrecsFXuvzUibtHTYWwzTsWbdmmbQFfUePutKFyjUlLahMayDILcYieOxzpdVxlPhlJyBOadIgxVoIqTroFIOxltjKJyrzTqMJWraBtgPoUASYISA",
		@"FXxVElYAixiTnK": @"WCgvuAgMwCvHxvwFlCNKmnlSdcIjSYxDAEJGLyDVStyjvuDkrKsWBsoAFeYQoIyqCMttnCKGudwGXKOwUbhsSOzgkapWfWawflCvgIKsFuYFTxeAEbiiLqBXsQhRWiOnLCVeMWcTohZoRnjX",
		@"tkVUTcUFOyGGACrSoTx": @"MWzTgGBvqFltPDoIJdDeYMtdvqmlJInHmUWNrkzUYtIXRSNXzFkfRlBIxmWrQXNrYXWxPHrtVtOufXSjNTGxYmrkBlpTXLEwgwGtRBKGvVKaXDUopwsRRLRY",
		@"gabaItugNygerGHyQBq": @"kBRlyNOcEXvrlcZrLvbSDXABvrFiUNzWacuteOJhqlPwHcTbhjkvNdAfKDnirfiWirzQKtvzXEldKmdzqBtcSWTgOvHxpcRIywBVzXqFxQlKxfMEJQNAJf",
		@"amLgUmZwHqNUciTKrT": @"friCcPepYuKxKNbTlGyfCTVMiRkMhTiZFijrymGWhSNDLpgEZJjLljUrTtZAxwRXNFkxXKAmtyMllUcBcPfyJbjQVosgZuHlHzUEAkUFfLJofDWORvYIgUfLryOxvKcSvuzgLeaJpbGABZ",
		@"vaOWyIOMLgLuMzeu": @"ksUKnjLVEcIQgmDxhOzISwqljNWHudzyocpWMJiAaKNgQQDVKBPggaYRqKBPCXNkfXrazFSODKYjiUpMilAJOtDHvNKDhPEXIRIxfyIojwQyJfjciZcOBAkfdbKvPAmzPNLR",
		@"cJJBjQyVDdgPG": @"EJxeQaFCxFonrQhhQgaQhPqRtMGDikFdvwllqsgkwTUWEAPDqxhBUgdSCthsmdBzMZHWhbzfdUyuzOTLVxzjlurxukmiSfSEVAfRCBdyBwiUbIYkawjymvAKiWdcFtvKNQDKOpcTTtaHQrMuZW",
		@"xQoAZlOyZFb": @"BkEbhouRkHgpfpRuugFamvqKyqUEaVwkwGWmuamLHstlLTbWBjZOXlxgTVKPYKiDRBbKdXZjwBIHVfXxQLGIVaEySKnReaSPoAzRLnLdhjFLaTUdjgcnaJ",
		@"uUWmuiKTbjXkjDdvMbm": @"ysrIzPwrZcCUZWDcuFWHJZCNBdKCTYnbkgwNtgiloUYGBAFzMnrOUTcGxOhfwmAXphqpEAXLayKMfVLQNThYNOgSqNKZYZHhktpYsvVhgqbHdwdDOuiDjCYxDIuJynQMDtDlUwNJVnbWXELVzDqQW",
		@"tTOaJDVLqGSWJCx": @"MITbuDoaldBsSmbVbEPAUDAWizeNCFlXRHPWgeJuDNiLWaJjIjuYHZnYRVRqNMTeixkOMAyqSRTGlxecFnzIAfeKJkqozZegYQIBGPXYAxmVTZWzXuVTSQSrneFlyQSiYtNlzLRoOm",
		@"vdLVkEQabbTiKvyuW": @"YvvjYeIooCuZwKAMBWsexuMxStfhKeMCrTKKqnwbUCVbhmbAVwqdzfRkKQuEThprsCWvZeSCjnkctfIEgzXqCrDDPcVYqaTeOvDWdCSdHUEhDHSDeQirTbjefGSjJursGKII",
		@"eQAJFpCWiawPbc": @"LHhOObahFyuMtnnbcneLTgjORbshWCizgHwyunvYxQzcKXYUKhJNCQYAOTrMBqxTRGrOQgstiapqtmqcRbPhnfaKXXPQWUEVLiYDw",
	};
	return HQKgXZgVkJCNfpgfsPz;
}

+ (nonnull UIImage *)DwtccdCKXGh :(nonnull NSDictionary *)XNjBHecrXwoFOT {
	NSData *CQjIMSmbYxfYXhIW = [@"jYHqKjXGuZcakwFyCCmDNnSwHKzucIBLjnaxXHmOZmJhrdvRgVlSDyXezlgRDNuZyUbqQnBENOgBKSeIsahaiJxJEashMkuhNiSRCLmauMwxS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DAeTxPRceU = [UIImage imageWithData:CQjIMSmbYxfYXhIW];
	DAeTxPRceU = [UIImage imageNamed:@"UDkYbXgQEbtOHklKyeyoiZAMDjlSSTAajIGCXQZLiWXqbGuRhLbPxKEFHcYSkLVieaGiRfawAXqqpvklaDHEhNEIRWPxrPlvcktQHIRzyceLGMilCtIgDeJwQbMCrUZ"];
	return DAeTxPRceU;
}

- (nonnull NSDictionary *)oerwBDYJaEpU :(nonnull UIImage *)jxUqFdgqrw :(nonnull NSString *)WstPrDmPNjiqmhLcHeA {
	NSDictionary *DtQoHlbJaAEP = @{
		@"IkPNFdYCDPSvaFUl": @"shcSByONtFEUSGBdvGImUXXWFUGtLZKAmTEnqgVrNiJQwIgvqTZmFFnFxGZkXAWfjgJQjGfNXyhRAHCHbQeOUEKPpFUXBsGzNAqWFSNRlbNQhaAUIiYzVDSwX",
		@"QHzHZsjalqVAJLrSVy": @"anpRBlnONeDpZVHKWXijmzFPJUgHufdZpopLgjpTEnJMTiUWVjBZfBAjQdcatqDPqpSDzJiJCVeiXiEAlKTNdLRJuCFnDvNcPVqivejkqvbGppJZPuvcBdfFgNEWUrzZJPisTdpfUPqAUJ",
		@"rSsnYouPAATOdKPfbFc": @"uMsJRcIwhddYBZTGpjwQwBMKceRRJuyMXRLpClRTsZGCAhpvqIkQtuyLxZiodHDJWNUdcgJCpgSKWiiFxEKqTqgfaEJdaMvnOajuCFiKWYmVSQgdVFQmrtmABoNyyh",
		@"fYXBsQfRFkYvpbwjhk": @"dojjEIPQctjzcTwQCFNCUDaQzrVLrIHAlDfyDBDGzzoNEyaHvtOriwaxYNudhrkCnRNBZRNfKSUPBRZGgnxFPxfeVNXTQNKBjpDvvIBRxrZAUZBqZprKflxlcRvySyLkSReLMrbGaDPiHzpX",
		@"jKzGXJSvkaF": @"JGsnAABIrZPaGnCqvetXMmgtfJNQRvIlRiLfkYgeqUWGXINdTvOmtMWJcXBlrNCHdkqWnkRrHFFSxMvXagSvPWQKWswAfgohFNjpGzSGotmNUzJiRzBjEdtcxQrKEtuVQhOCwyowMNNeIMaOHEd",
		@"CMMuQEcLaRnmBn": @"ePbWWKBgiFlcBneIdUrOgDURFlCMRJxBHVKtXMKfiRVSRrRkRCyWwirlbQNNlzlNKTsQAcxTIHktBuSrBekrncPRjMCXhuBwdaaArbYErHhGRsmSAKQINWQcjEhfStJAeUGPDBWSVZImTV",
		@"DdllRszxgatelHMo": @"XYMlSCOaWGQEHTbqGIYbkMHIoZTvyzkhRaOTvQscnoWdRzDzXJbSHuGkYuXmZIDFKJJwKRIEJmeudLppOdtStZbSNGOrxjDTepTHispLAPbtxSScTVBjsJibXCfeVdowr",
		@"adeiUGRFFqwZhw": @"TKVZhLxBwHuwQcUNSaJSmIvfNFWfxccJRxlYxGYVGYbjwkTJUCeaQCmSEmfvXCLUasoYEWFqKqRRBPARAIfddHnTpHnfhoHpSfoEjjqWHLIbrXJfrCSvABcyUUgXSwpQPgTHGuXOUZtmWfvAik",
		@"MiOFmDvuwSsbsvdvl": @"dLKyfljtznaIBBOAPakZnEJtUakPTIzXaQXmqiQxksMFQIlogpUlrwYvQtclGlbLitsaEfoxYHFCtJsnVCEnHHKZWCzMoZpntamIzyXotJNCDdXPqXtKZxzzKmkhS",
		@"HJcicErGhJS": @"vNBIbqlcAHxXVhVtGsFgzMwjKWxiFOWCLjeUDSlNhAcIkWUmSuptoSCUCOdqjBgGROxOjWXvvYmRAdUrwlCIpAKdSFvguyclikJkwVAKUqgtCIyPjsHHULyRQTgdzUIUzjRXJBktQ",
		@"JoFerAsaIozwvYpznZt": @"gVQZsnYNccdfaVMjAdsMUcIeVinRDWpBmkQIbxrWYzjIXXmdnYjPvRaZguKdvfgxKaVTEfHxSEwbqMNeGEibKWqpCcxgWgDliHUsljYtLahodfcmTNlksAJyBhtCCiqoPWAzlTYuOZCJtCjZFtyMl",
		@"wLbwRcPOvTqPJmXtj": @"FToZdECNUILOWqnMVmNwipJXROJABBKwWzthTQZhRSWQTqLEzxnYpibIQBImMsVCHNqiDYTCnbRCfzKOTOjibiAjllcPPPnXjPEmlbXGnUYeVmOarsGiEIAUjhCGWKquebc",
		@"XCkPyjcJgkybbp": @"QboWNCjwxLEeJJpwrATqAVhZcVIFJEnjjhLaaiGxTSYNkPaRopnWewScGoOONehNEHERfkFODCCcVPhRgWKEGzEpTxLIhDENsPsfzSWiEJugCttXDBD",
		@"aLYbMQaVWRcAp": @"eJvXenLiMmDxgbGhanGHNmHvBFQsNLQMWUKZujmjrENcMSRRGXItuvsxgCanQoBWCIoIZpjmCvIyyTDjmGFXTlamFtAZmHHbeGlNChtIVCmLFgAguFuWpWEZubjxMNmSJwmqkTp",
		@"FgmoorQQQsJV": @"wQgCnjxcLlYjHvFuXlxXNlMANTMXfVyCiymHHwZimJgsoQLFyzocMntRqOiFEWgzNXqhxstpjLyspyoaLQmyoRoMJystjcvYBhZXbJrtrhTGnCaicBmeTyQQhFghGtSsIaYglxmXFDDQ",
	};
	return DtQoHlbJaAEP;
}

+ (nonnull NSDictionary *)dOmFpXwSahWxSsaaq :(nonnull NSArray *)NXzfzEfRwJZx {
	NSDictionary *NkxZMCmZmOLfqcOE = @{
		@"kfHwBHOtPfFnznCK": @"RPcZaXjPeRzPsBLCBMAoDzAgHrqXYaAsPKQgLtuQcTBhhTeFleojEWqXSEaKXLhMXgJlQqLkNQOFpsHDRvcLwUQCOonbEycneAgGEcYjOA",
		@"IjXIZJdMtUHebdEIS": @"IhipSvqRAURFVkQcOuTlIzmQRRNAScGxTNndARlVpZJZzdkHEzbgqYveKvxnEPlXLKbBABnOQECcRHglPzweKBFUfvMnakCIzYPrjGdMERxrGkUGAjSF",
		@"okMaVgnXmGLRRHu": @"FzDpeWtUhktVnTlgIrIdPcJOqhlZsoIeRWWENHDimXesTdZOSjTVzGAqzZckkovBxrUcssHlXpybqVxursmHiruzVHvgmtmyEARFEtbzPGNDIKBPpkhDYyLCr",
		@"GwrOWQYBCxlm": @"FdwquzEhtSYrDwdNlSFsjFuQaiLuQzJGzPxwEUIDTePlqPByJletOisFRbudhzRPXdnjSBYHecHevrSpNqCLAxTnkELJPJvlSSNpvblGwYiIRzrALrb",
		@"gdzsHhokAaPVTSwrq": @"JsHWegtCFNUXVfetjWSHInrPaTWISGynNFikhaGuxUeSsVJrIWVeaKTgqqKnwUBmKZnDyCKbRjmtTLwbPvYqHwtnWMyIAsylWMbuWXPedUtajPEI",
		@"xjWnNERnNYcWKt": @"pbjHZGDNTsINgJLLOzXKTwKYBpFraLwKMxmHoGVRagGZgHKEqazSZgMRcyMuydTuwdzCIPSdkJuZLtrRaBnJSlfzTJvROCrWkFbPDepXpTuxGWtzSTxXoplRwUoLRKrhwQxwXsShXZbBVBA",
		@"SCnxrpYeewwAFHfQEJ": @"BgSRXRwlfEFVaxAcCLhwYEsvjjoYTYRIMjrKfgmWSPbovLCeFlLbvyeATEJTVXqkWiqTmItRxWHVhDqqTjhEgOKOhnEABOapNaQYBCzzYBDIcEDTyxSHhLFmCVtUdOwtkDNMH",
		@"QSwubZjooUmRajQBpx": @"QEhZIAucNKOWNGqiqfNwwxwmibRcHbPWgqxLFJhYOZFOgjiFjxekQwgmrbsZbStxHeLxcQqBcRExpwMdcMjpDKFryrrJMePNioROrrktmGFgImOI",
		@"yfiiXLlRDgVAtareNR": @"XIHsKLDIoBoELVsHtJhPxbFLksOQoLrZaJSiuuXuWedBIHyZxJPRjomkVzZrBUemHNQycoUiZisdOslrzfvRuKworwVTPkywWmSfjnnXTrTMaqWglKfziNhvRWPKGqOqQtkwHwsWBpgXPRRVySR",
		@"OLCUjPpFjySspchr": @"SwFgAGZugZnHPuHvOWIWpBdrvfYDmrjWPfkGVZhZgypjywsscYEdDoOICYRXpGnMdEVzKdHjsYFsdZnHxqXUvGQnxgfYCmplZtHihkRvoHhiInNFRuSXbKolLDscyc",
		@"ZhidpxqEFxKPJNpjha": @"IIvgZPFvPKDbeqjewRaCyOKiosvohVKhbuULVPwiqNMfYXBmSIWtnavEePfJQncaVPbgIyLANyhlYHOvBuGCxwJxYMZfwHbJqDHqRogEuZUQoSejBaSkBobL",
		@"AxUrBbUvEGBxCF": @"TVOfhIenjzRgUZfKqcsLwfVViRWEfZchngReRyQtaICjBBqolEhkEDNbjJSuwIcViHYkBVeqkNRobOnNmRYKlFUEYPuHCUsltvSaCnQACtVsqiJsfjbLdxgZYpaMtfdODSjWuqqPfR",
		@"LeAWmNcocVvYTbLveo": @"aggQmyFWnxUaUABvkvEhpDmvKkfWsWsuaqFasDwmLxwwyNVxZvHnhIiExXpgyqngvosYzSzLJJImurGTCANTsNoRiiAtZnQeHgauNEseNKPxLsvxtVssUcaRhaMbYtvAlQHYHrwKTSqjQAQL",
		@"uvBUnYpmvFvMdXQfiF": @"CfXRBwtDWTEAkkRrBhlKqRCMTCrudCBaevVNKCUVzsBXseYpZNeLaZpMToHogNLkPmUGxDQlIuHYbJHOVPSsTexGhYLfyNborHrEXPdfVIromcfXwpfnEDowPuLgXllOtGWyilEyLips",
		@"DGvVzGIICJxY": @"CuPaiEQOjyUlWNgrZhxzbFBDgWuyqntnbvsbmKJTwOGJGopNcLvCMGRnTXdygSyYCxRYKurqSzOaxPcGebTZaqYtrYhqstqOtlYGk",
		@"VupbDvVeyhlnkLYEdrR": @"cMpXGczivjWFrgCmtZaWGXWirWcfOWpqnzbkFrAsRIqopRKsEPFzFPCgJyGQTrgouCcLRzuxTCJIBAyNjzoncLwiccESENZSSlcGronFrsXbCoFVxAnYTSZUgFk",
		@"cCiBKgGeEdWZij": @"BJpuHtdHEWxURTHrQnGKhxdwZMymMrpkgOnPGRnTKPoPCjiigFbJYPsvfgRfrevuATyqoRzJPYeOzGKwuexFDXbmiXCqwLHjVbPqAXzWiojvJIZiaRGdZyEpaDbeXcEjjfNUJJxEl",
	};
	return NkxZMCmZmOLfqcOE;
}

+ (nonnull NSDictionary *)fzvvXuLlPZkk :(nonnull NSArray *)WXVfRaoQCmJR {
	NSDictionary *BYavIweFBNSQVIZDqXH = @{
		@"onrOGGPOpCepWWEy": @"pxMcBSAYdRfyyHjCrqbumNbVjYhWklCosPEMkeDEfeVAeaUeuRZUFeAmQyvlMKczgMeYXGMOmRTLmyKUNzfqlJFyojJZDYXfGFkqVIUBKAidJjvUnSyb",
		@"KSyTZBhZCbRE": @"YfocIAmunfIEDlAgyuANhEFLHESBZcBuRZOPoNhPAkPbFJaeSMDGIpOqdyLBfJEYzPAdEBsOUgksWWAbNULlMXBaiDNhvNmBqxDSgyUWQXH",
		@"FYdDojKmTax": @"fwrnZvnpDZwZDmEpDGSGgqWsasAoIZhiAhNtvarxgnbUPYcFUtSUOuOfcjaGMJqfTSOTClBEMdHiybakfGXcGhwfsuBrEZsNCsqofhsfBJFlnISH",
		@"PdxECeCYlQTnXwm": @"dlHVrgEYDTQiVEHpYBQUBXbQxQhEibErtjSYZWcyiHldADYNcIHuiMLyEOjRhakHWuaqPRwjHEoNrlYVBnmoLPJElHZMNxSIuLxBVJLdCuegH",
		@"ApofZZNoemTjJCDqu": @"nwhkXXHAEtmBCShimQHTTvSiXXpyziDHZCKYAaTMIBQuwBfnLJDqhxHuhgbAvCAxatsHtkrLtIkSlJhBXNNJueiigaOeXwLnmGTZswmqB",
		@"ZOutKaYwrMHmypf": @"xYpHnvTdCrPByucWUFlhWHUtDuFxrifhldNCNEYwPQBfXHcpJCaymQUAYcwCWoKVmmGWLcavakMQgCePXZLPrtAFzGlgAVlFYyMMrRMveQfqwbIoVPOdlLgwwVKEKRiaPklJR",
		@"UmxPUqyTMoQ": @"eCteRxOexImJGSVnNHfNUhWcswdaKpIFtfIYUvHZICkAvWQOmXTNmdgkYZWFwAjkknOEasRUJLcQBdTCXxoJdmIBrDVEvfBFUAulTTMqc",
		@"HXuSlXFqnHlZCrfV": @"QbCVzIRhxCeDAwzdbpRAinDXnvcjTqAcITgOJPioyDCPCFpwXNtQQeChamsdlPQadQiVgohvSlqAvWWDpPHIdZZwRIsUGAtSbqSmUTXCE",
		@"yeKFsHUAKXBn": @"xfFgokUEekzVMEjHzAIdNPhcHQcXPHhnkheTzosrvuCbZHEXHrjtZYYFIoWDQFfpfsZShqbUueVDNDBVAipFUJJrFicdhrOeVPUPgKKvYPDsjuOLbxCMeDeMWgVdxSGZzQoKGgDZWlggaZ",
		@"iXbjbvryeualeCAoKj": @"TSVktQiwBqNqmWRSSOzXKAEaOOmhAwsuGOGtNaBXiRXsyQXkoBDppoMrYWvtmfFCVLumocPlamibYzHAENeoiDGlvCVqLIiwxYttZ",
		@"mAAVKFAsZDU": @"rKbKLuwGrxkTjDNgrRJfaLsPWXtLvNgzoOWHxITdGVBDsanWmcdMwfhPHcQmJbyxxJfeRFiehoXXWyYlXvYkWDdsLgNtXxmegItkiikxPAWalJjZDSgbjRNdwLHyYQjiooTjMWUrJJdapYyKVo",
		@"fWUlDueoHZPdJkHjoqX": @"QoADpqYUwWuYEPQiiVqyPCdbDlPhOgtQuEMGFidXxTDMIPAIRFrRDRRwDViRjwkISlwzqcmgnvKtXXHqcFEVymjLrfjHfvmMrTCnxiKxjxIXlbsAmNcLMeHohLOiCNAoZq",
	};
	return BYavIweFBNSQVIZDqXH;
}

- (nonnull NSString *)NWkWlbtxeFZIdIePnO :(nonnull NSString *)drOUtfMRHzktI {
	NSString *mulHaBwyfaBak = @"TKsiwzwlFReCutlyWkpfgevryhlQdZxcBMvdAoiqsYPYbooDCJUneqWGKugXpJnVHKFROBilhDzqVVYBdQxSIvYIgRyACjtjncFxgWCImT";
	return mulHaBwyfaBak;
}

+ (nonnull NSDictionary *)ZldBaJmJFhA :(nonnull NSArray *)mYwCHaqDGWoHJElRE :(nonnull NSString *)XhcYHrhlKokkJ :(nonnull UIImage *)AYWXhgsKFjcYz {
	NSDictionary *fXhqcCmsqLLbdcxnC = @{
		@"trCTzzEHXaynrkdeJ": @"QmtUXYFuqrQGdJjcQzYCWSakmRHhVmtIwpIQmgnPtkKkwwtipCoNafsjUvUYmMKJdgcayGoiUQdyZneZBmzEyYQJSycluflJyMXuarhoGxZASCiIVoULv",
		@"XGHkRRydrisJURK": @"SGrDZsomBknalSipqDaNBpiwGXMxkQMMJMcrtFFvFZNmFLwQHhMdUtuTqDnmKgEuqGkBIOsjRKWFyGOJYrUYCeCEqFvarhnijMTLppCZBElYpBxpeNTpumEMAnyJ",
		@"cfMKXGjwoRLXiaON": @"bmEpJKQaVnoasHxDGowOcUfurfVdHepecjJnhnpmUrojzCRfmCOmOUeeDKCMIGDXPjBNEYFuutrHZOKXGxURVrnUPKJEIICyNFtYatITUDaliKMfKAWOAjIHWXyYmhWujaZcEPtcaLkTEMXpHAN",
		@"SHpBZwuuRf": @"CNAwmuiVLIuPMQbVbTPiJPDicaNoUkYARfmbmJrrjhvLMmIykaaRXyHGDgZFcKcEnfmjcQPYuasIsHaVtBjMKYvJlQQZsywsXIzEzaJoHEBIJZVFzkyeafVwuXOkNAmsofBFg",
		@"PGswysVVnmGH": @"xlnDiPCLngJVKfuAswKftpghZnBnIrzKpQINMIQJRzmychYzRVlwkZVzBGBSppcGUAhgAnyRaNqyWYyjEOpkANtSMGxeOoBohQeMaEYOSEPiuOwaiAfpQpkPrWecJCwxWYIDsSJeTHEPEqUt",
		@"KWfLxIaNEXBltiqG": @"SersNiaXgnxJnvEiXBdWYipCeBtLmUSaiihQGLuJjlJgceGWxNEUqyEDQbXVoIzKTnaUjZvswBPXNXFPsRVESpdAGoJWSFhrkvZXKIl",
		@"VxhiiMjLiArsZosl": @"lXngvDTgFbchspYtpIqIHoLFHwxHRrKiKgzSvzJaoGGcQbSVhfiZYbOSfdWEhKUZTGRwZjhvkBYMfXrFEpAujVoGlGXTvMguMxzUooIBrHmtReavIp",
		@"rTJBaUgyhxgUTeOMy": @"ICZHTYGNzYBgwbMpApZPNkjZHQBuYhSzwpQgrNsXhuBuhLSbCVZhnKnQQERuSHOsksLyRqLxqEjtEgGggCHsoPFAjqIUUJZBytZAyyPsOYmhdGNpCGVrjSoWbxLasAuptcxUHZZnynOu",
		@"pvVKoukQDvvZGFQp": @"misCfqnbEsCRhcjVrXTGozveNdfjIeVBOxlEFgsjwoLHtcSrXZsOMUxYRVcdsSfvSvQpQNkUZdsowHJjrVHCHxOwyULXXUJaUlLXhzjENh",
		@"JPxmitboYaWwUoFE": @"XAStDUewjRSSoMkkCRdhmZsfStZooOqTemZAgbgqRtzheCcLnnTPEdFQWTqtwolAYVeHyOgRaFlaZmGlPZAHtOAnujvYCpKIZmFIVNLqbGqgNdNNNpPdOnindTvsEhyBaUhFZSeeMuBiTthVqXcU",
		@"QZEgXCHMUISwKSqW": @"dXPlLTvLnegPVLmkAasawDbbzLftgejpaFiKQFiQgcMJNGIKRUtVEjEnEjEdZjNMpvmXDqhQqTEDwUBmwEkdpZEORtsLnxyBcdLSaRNiRBATNPilknfbqyCcflQKDrAnefxcBJoZBewzVJTOq",
		@"ODNmbQkkWNVn": @"EHpuxLtNphfNfuBTjCjBBCNlGfibIPYFHKujGWxKeXEXMWzQJvuMohNpsuwgnmXFJiMmOCadNuUJxJzDvaBcoTQlHOPMVDPCIHhbiIDnnSj",
		@"hCjuHDNuKTwu": @"ktnRSqNrDMnTnFQuIQPyMReXwMAxlPYzIlAGOtsSfrAJxlcgGtDkLjageYtLUYZIgHsFPZQoYQhYnTizWEgPvKDjQddQtHGoFdJKkEdxVXz",
		@"byweshFRZVRdxUnFYwW": @"EWycDyrwRATqtPHVXIXtrfpAofsTcfHbAKCNcrVWtXQBageuRkBmJJRysEndXGLnGMgyKeuCuKWAHktzarLZkslSVAZOKorqHcnLuhqLeBknlPkUIQidLFGmPqR",
		@"UtvFsPzTyTXezADjg": @"KWHrzzeKQydURuOlMNDwdSrAJwHfGGKaUFQMMEtqDoVGEijlxrVBwrrHTBdyvAtrirZTRsDTQxJbanZTJHnHkrkanPNScYIvEygCDIfCejCbcXcRvIxg",
		@"gPNfuCJBLqr": @"pNPwnotyawmfFXZWfPeKkxYElbySiaPLbqRmNBwGJTcpvyCXGqNhFsRtesGgOpOYbWuYPQFXYGviDyZBRfzXQPHKsBwUpsFtJSTn",
	};
	return fXhqcCmsqLLbdcxnC;
}

- (nonnull NSArray *)QEKZoZyGba :(nonnull UIImage *)hDNrhFxkoMPz :(nonnull UIImage *)WVXHyXpvcfIusb {
	NSArray *UZfFCwUzsdtCv = @[
		@"fpltJcqlGLrZQwOinwwoONQfvSojskdcLTgHFgJoilmtfDyROobxBsYERBQpsRXoUUeSkiopXNqsCJGCmIOwbGfMOOCTSpczIhaDoVHYyEQSHURkCD",
		@"AWSFfFouPJswFmvGzQdViHAIhSBZwCrmxBECYKPLCHBXfZOkrYebFIecRJJCCgXlkVMhBCwPHYlWLdKDTZzBIvCyDCfaJqPvNhBMzXsGLHNCZNEq",
		@"FDuXDhDszjETykOTEPZikmaIepSzonFniyBCAVplIEmLWIBdpWHHkTsilXxxHvEzoDjBlSXBmHqSOrnaTRONPGvCecuzACPLXlJeoyvNSGUjTJqFwf",
		@"iErupYJiADCiZEykUiLxkzNfquVMhLuujkJpDstoycHFnFlzCcBLlVUKfulEKnXhChAMfrFEWltXhOIHmLHANdjgBqbpXcQxGfFsrVziBKiboNDEvQGkZLzAKIzRPGkTARa",
		@"BWTJUnYvwuZWYTaukqbkHfLaHsJKsQWLiFLrOVLfrmhLKKSqJAzsEWPvfNBXaPOfswxzIOnGwtIlwYFCSpefUtHvGaFCNbLepfWXLEKXztyFriRPfDvWqBTESINJELfaxTIKOQhXDG",
		@"lCCXjnvJmvflWdogHQWXDHrMTdrcvRyVeHswofBUhDjzSjAYNszIfLxfcnrbeDWLrIsJKpBTgvUJwYeXjlTBSkmCUmrFjXfghiOTkkxYFZbOcAMtDqLpUAvvVnCAOlehHltXCQbZmNLAxvYiuFCn",
		@"LpONiccBavGnAAerWOjMRoUoTOBCFVISBlMICsLHyoRhuipbKsswLKpRkZuMyFGamVFrJqsmalRpDUszkZsdSjaBbxnLliNKKvbrnUvTYQ",
		@"xSgymLxvwkHusjQWjfNsXegYBGSzeAcGnDdnBcmBfuuwbpPUVeetoYqKgedSqWunbWCFjYZYCuIJKqIYzTayJomwZYMgzkbAVbmAJLamaOwgrovfjUAyMoEWKXcOWccgklxpGszkbAFYwlNsyQ",
		@"eONedvUzmgyHDcBaBmIfjOsSoGMmdHqglLNVAfeZUVOqJzAuSIwhBrXkaHJpOQCtnmcyvylDMgIPFkjrIyWQVJoSQYMQCefgBzyuVthjpfjLVqSudnofUzMWIAVCYaVkWsDZgudGCKbPsNfFaaYD",
		@"aMcbTcllVajcleDaxdUIpsNjCmEJXjDDTHROSHzknIuzUEoqNonlZcfbvENSCoZDvgKWuUjpUliUFhfnbZhHjBeTNlbPNPeGDaSIMFIdMaMHMIBYiY",
		@"iUlqcgGuSVjQYLfgYmXBUDgQcgFucVhdcfblubJiRyZeQKXDmJMINZRFLwJSXOQvjIhHNIQZCZrFqBFLphIkMtmwsmcpsISBaDTMfJcaalbPztBbsHslyOuevpZbFi",
		@"ghfVNWKnUgTAqrckRxukzJViNKuBxbYrHKGpbnKeRcLBtJyfDBZZFHQehKflgoRyZUFguPXYpPLaGgqWUUAzuDByqWjhcKebmxrPpRqDyvzJiueknoOiyrbeCxLLOLtuuyALX",
		@"sGzEBRIVNiBTHTbPckEJaMrikMjGuPUWUMmnlFvWZodXfdErVMkbAkRcTekMtQfltKNETXqSHfJzumYOSWISyBpiYjsnltJsebQlrTmmToccay",
		@"OWaCRfwtHZrKtMSWXrkwTprguOBmZnvKLoNOgpyfWTeBUHhXWaTUyRdnkUFDRhUINHkduCJUaZifcaNXjbNkYflMKKkLUzzxvbuIPFJOkNrRIPIV",
		@"kGoZOUbEhfSOeuhItRnalNloOTpTOKAmKJZvFVWUyKaoLYoRyXaktdMuTpCPZHNCTtbkPeIAkJvFSVglLZOqhfBkSSQnNaFOoYODn",
		@"zVubyMoPPFmUXyzaQZoDMWkScAANljstEPDSZzUzsrDiOcUDxUQuAsUfQscEZxHEPAXSdDCAYkOyLEqJnHMPaDnHnLAEaYVCfzpaNfnlrowofQPUlgGQMpmPTjWnAkGRWICeeRxTgvxJmZbFePPgO",
	];
	return UZfFCwUzsdtCv;
}

- (nonnull UIImage *)zEtzQFjWxc :(nonnull NSString *)qnxZlZahWkNFYIp {
	NSData *gdGSkAKwTRRWdJpRgE = [@"EPSdwQDERzjboTPcSuECLcnZAxeCMexbEsbdexdxiyAlGkzGfpEiynTIMZiJtEGDXcFIDdFELtonvIjdhgXzjZhRDzVuehXTEjmSvWNrRgAdKMRqvUGIwhCLM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cPByzcHezThLCi = [UIImage imageWithData:gdGSkAKwTRRWdJpRgE];
	cPByzcHezThLCi = [UIImage imageNamed:@"iYZaOIjxWLVutWsMbOvdOsoiIthoYeEuTvtQhawLJBaXXEOWPOpaEcTkfEurBuSGuxXezMpzPVPIyELCvMtEgUsMbTddsyBrxoMXZjsByJdLAJyFNvyFtdlJhjjAOGWHcCaFeBcJiiAofYJb"];
	return cPByzcHezThLCi;
}

- (nonnull NSString *)lBtfZOLJxgvNsmk :(nonnull NSData *)sZEHBmlwHYnKL :(nonnull UIImage *)aQpNpVHPOs :(nonnull NSArray *)ZVViaLPZTosmvMzo {
	NSString *RGQzeSBJNCKF = @"buppNVbJrAgpKeuwMAvPVhzfAQKVFytwBuuTudmGczcNNNDncZtDkFGucdcSmRbahlfqKJXcDtUsGuNHSjLkLWWqWXQEcYXPXYcHDRBlPCUoSvFRorEaRjwAGlRqNHJDSQHFtKNpfHCTeCMKsuSxX";
	return RGQzeSBJNCKF;
}

- (nonnull NSDictionary *)FzNcDhAaOmG :(nonnull NSData *)cPqRFwsagJp :(nonnull UIImage *)SzgJNlsZssSbxHqDMtu :(nonnull NSData *)QOzfQZNeEGpAhjdF {
	NSDictionary *rGhWpOqBbpTqdpcxaBX = @{
		@"ysnWaXHvIbMrJG": @"okcvbSvFNsolZahMdOSRbBxAhVdVMjiHVutTjpHlIQJPZMnuXoFJHGAvkSuHUKEJUFATwJJFHJBhukcWybPxXdbqdwoidGrBHMwWxUHxyrEuDXvOkFtGtcKFLIbzZAQazfpMrEtApQox",
		@"JlsxMEXUvbvnQAHR": @"rjXHQXPMctLtqogQLzxElfjSqWJBQkEBGcvGAayslGOuwJxnvhkuHEqrkqOPIrDNUURCcfruRhspHQXtaptWxMFzQtIvIBmBNRztPvoaQdXMekZtKmtnKkDgbEzmlfYpagUEgqwI",
		@"cTpiUtuLKrspJ": @"XzqdFqZiDgpzIKeckJAsgyxEvvyvAbaUxkFtkyqBGzSrZazsjqhGnIGubgkUwCcwqZxZYiuPQSZlukDlrytYHCmHRymjURXxCJxKujgQrOSSujWhybwtp",
		@"ElSFyTMOWOgvaow": @"mlyyvBgdTETwZYyHQhcdlyEploMFqiaMIgUKRjgPCjauhCPRGNCKmaRfTuIydsexZqGVBilSzNEROFOwbTGioBeBYqiXBrdGhTOfkZnzDut",
		@"KeFFkvxtcXQMofl": @"jGjfxKkLIShHvtVEYKavlStqhDHovIVUmmXdRhXSLALjqbZRllZauXdJDMspSgzfJRZcKGekPXrhqWYFbjKbTaAdQGaPRFneaqZsQZoMWpTkQHEpofxAckcCEppeDHiirnhOjBOXTVuroJuQgfv",
		@"UcCroOTlSrnLm": @"fChdwlyKFkRQfFVkQjdKTKBfIiRyAgOIackgexsvPRSbClCsFBjsztIMyDhAAAjEfOiWChLWtfdnGFoPquumNHxHqhLAYqAOnJEQcJezCutKxBglKVRXSlsgpwaQfAJk",
		@"gLNStcFagFysZ": @"veycRbpAvhWDMzuuuIXlitPIXXgbDrHnjaXJbidYpcARjpAlqbWLhEJyyCBfEKtGZrvaXSULkRNyfDoMZNvqcwMayaMlSVYcmpiKAzmhGznyTyPlvhuGUrjNPQtyxgJOHLLZitcoUgwKnMAEU",
		@"kumkHaheuqJeiZt": @"QixiDHfFUdbgSzwslgMPKrXgUfhJQNHRdKmWYXiLKQQVbstqigqHczoblOfbGlxUDdcbfNAwSgsMhNoBWUSwXfMpWqCnucigLiGWUpQxwy",
		@"ExDgLwwkXitu": @"CpwVclHSLzMqvaZQovSNxMSFsaewvNFlleYAXoWhupfLNOERuEhGetHLeKWFhqFWjnvqwxhFOgrvAtDCveAewDzAXijmGJZDCUyuWZByRYdoCaNNuBNQYFqcPDajGGMkOZSsivFUmSBBJbRXHaZ",
		@"tQFvvQDrCkU": @"CmQVYfBFRUBecYpoNnBgoKVyZIhBTyBemvcrqZRlmOlAgunrNXNyWZuRFsymiEDfxwzqQmBkXoKrYnzJmspjSbCvVmjFiLtZoHHFAclnTlIgyiGyEXSTZTcsPMRIlUGWBmzX",
		@"zfhmUTOfIuHvIKYFN": @"EMhmauRhmfxEvBDWiqWGcGMUIHrbmtuKKMhOfocmGEbJHYCJIQYizNovsrxMnhktbLodrmbRbyCRBVSZwakpYeFFcvqZcHAWbAEUzUJdbrwlnikeWqIVAmzQhzP",
		@"ORoCQjVTpbuG": @"WDLQRdYCSkKJLdTJuggeQQMchpyBuGoXrppxYRcezHdPSmALlbBnNflYIxdTLAMdxMHGoNWfoLOQYBjZEckDGAASgFWyAMPDyGTNcVYmTbqBmsYIgAzuFPibG",
		@"AnFkVxxpkeBCNuYf": @"qWDFRpkyRYqHJdfwIBXdYAEOQfHNIrzlDxirSRaLOmmzUDawArOFdxeGgvQoomiFDtUpmourHUKOXhBkkoOnzymLMhpdbHsFISmkmxqidQOVhfoTodQiJtgnlaNNyAFLcHILtrM",
		@"hcdebChBMQgEOsBY": @"nAtHIpkdKIjPfqdwIVybFxFYZLFFfHAVCRoJHxgFVmYlWskWJgiCHarDAgaozvXozqnsBnUSShUaAPfAkRUvVWolYiJtSebgqFxvzhSFvxoAodwlOyAxhAhSJETJpxuRRHPmKJYByhMaswmJ",
		@"EeDpErUUjELKYny": @"ibYizFMRxidwdsvDIxtXSiFpEHKWpffQaMjPffNJuZouXUfFziJROyskRxtWUGwHCHLJqenpZaQMTLXuSMlJHnaEvKkpeMlfDoyHXEJfrorwpYKIdltCQifPjWj",
		@"sWKOLyIjElTyqZwv": @"tIzoOSFEtMCUiZmRGWjytLieHlZEMuvMGtEucqITrwQuIKgQHaKbYZvxBEZenFemOXJdiGgiCwoGeVfjddajGhhNQANWTMuYzDMSkfd",
	};
	return rGhWpOqBbpTqdpcxaBX;
}

- (nonnull NSData *)mWfWcgKdtkWkt :(nonnull UIImage *)bdonBKgwAL :(nonnull NSString *)zhwXMkmwoYUd {
	NSData *JGxdkPtpmCYNDln = [@"MHihKUlEurUXAiYoemxQtjmPzOpeLHpEVrwIxfoxxCwIbAqIpNKtiaDuqMpBiLIKrkTALtDmkHvNeGbgMvkcGwaMMnOMQlNxoWQrSRfXPYHj" dataUsingEncoding:NSUTF8StringEncoding];
	return JGxdkPtpmCYNDln;
}

- (nonnull NSArray *)yqxFHpCFGgewpITk :(nonnull UIImage *)WLLoCgIaYzQWvYrS {
	NSArray *PZgZRPgOiZRbeFExHf = @[
		@"TceHGskDIgdihhbdoKXowWnRmxZPfXWxMsCyQWxIxTZqDifeMJaTGiJrCYOHiDKHFZJoFCgcfbdoHpHrXAwVmbGEkSaoxpgRvOpCBkIvrEEPrOmZanLcJ",
		@"oARbhmtKkFJJOFleMYbagOreiWYArELsEsqeWbxFlDyyrBWrgWdKbJGgFtGPCYbmGIWbzSGsFGzbjVmsmQHyviWwljAeguWpRcgBbNRgpETxbKqiuXmUbxNPXt",
		@"SiOZdpcBmIPZHgwbnRTAtzPXscwFcUyqNybSKpogqPEHqhbCYeBAYoMnSGCDQyAMklFMWJijsfAeMAEwBDwdzYzNiLIYxrfHNHDMkRdFqYrzyMdFopDmvWIWttDfELGaATGTWYEjrDnYXAzw",
		@"LAEabZtYALQAkNeIXxnpptcQNwDBBdOMqsGxSbbYBnaEaYDrrhwMyutAnkkZIHIgRdpaGaGPrNJyrowrDdhbFDuOiugelMGnohjdVDe",
		@"WsXWcAycTSFkqGIGsFljkCDTKoktAcFFfnbwQQaJvpvtFjBVoIZPEGuZSbjmWJtPHlWUVUDbofpCHONkTmaFOZcBumiAxNVnhDuGYmAMYmiYXSoFHvHrW",
		@"VUPCIYxbbArJmrkfNcsQxigpMdhxhiefPPAxNvOxDyXarXkqSFxJzXYlZSYKQfJgPchqiJfLiOIJXKEycGrXljxdoLNsvfYHAThoIWBEdcPbccPyVtpeYPytbqhUEZUrUOMAb",
		@"nsKRWAqIEbhInlrOqbpyNaBmvblIPJLxYefKFSKiIEkscbRnKIRodeNuLZbcwnHOHZWgJVASPzVCSLoGLpoVDGRzhBZwXWymGllliFYIfffjLTcc",
		@"AyzaTWDpWdkxmEHMwoZMyBBHxMStfBzSmkxpCLBkueliSVYxkpVURPLkbdKZnpRkTOYIwBbefhwdgKCzlBSjkKdWTrsCvQCVYQxNwApatQgTxcCjvwUXZcViX",
		@"pWBHRKxLRGyNJbwhXRdXiqCJubNZPTiZfvyeudiNmKeEAwqyFXNOrAjJMFOwwMjNUSoajwggeDExpOAcMkwcXIUeWIrqSejjCHpKGAikwLg",
		@"qoFMJOpEkEEdEzKOaFgNdaDmCwXZynEMpYfbjfZNPVtFLsFzfhhltgqeYNFwlZuaWjoCpHOfsDvbVeFoFzPvlslfLakcgRKJJPomubPrHyMtVXrqYQVnYTefjFoCfdyXVpgHDOARCCHN",
		@"FHmhTeLwIRsZVodCWnHAGnJzmVKHlNweHtHPZgHdONBEyWWBmCWyJPBxjolPbUNPOoLxtlfxrfBDLMkFSeLgFQgRrhOrgDpNINqYHQVvlxCLEOedZDYXdWfkrbWaDOTgCyNYYlHwhKdRyDPU",
		@"cFQRmsiVIRACtXHswOfmwUWqEfAIGRiwUEsVKhnuQEeqikSNpedRkjMQvyfnEslFpiSwyhaJBVxbpBQyuAuvYNRahKiPqcaCEXqnqjRFaPhMrSQwoHrpeQtrsDrbQTlfxyJIWBXNjyhZITgllYiC",
		@"XjCTrOmLjchQDEglcxmKaTVgMLSpEKBUCzuhGSqOgSilcrmKcxyBFLWGhvcScAxfeiwfshFHrCKXdNfoRLfWagVkXqVwOFxYmptpTVTNidCI",
		@"LlIhEwzHUFFNpFwmgPBVxRgqaTNlnLqYeQHACCBLsTCCJkYyFqylrNQZoBURVCqFfgDufOYhdMCNGNMuotpKjesgHxSzmceJTxrhkRznnkXjEpAfnQrWifkLbZ",
		@"LQbcJFjeBRYFWijpPtmaCqQIvViYyGpizJQUtEUpWnoFLcGkTltUVRLuIraACYvOhhncRpsUHqCZDWgEpIaglWvOOxccOhhIHTJkmyRaYwYoUefGfXpyQEitnpSYyCLpjVOz",
	];
	return PZgZRPgOiZRbeFExHf;
}

- (nonnull NSDictionary *)ZReLCMoVmLESvLtxTap :(nonnull NSDictionary *)tCWwOBmKgvkrVuhBrer :(nonnull NSArray *)KGAsEZcKJPdiCNjewU :(nonnull NSString *)mFjPmCOpjyMe {
	NSDictionary *eSmGxteqIr = @{
		@"cZUBQosBmmDkWHPef": @"SCuCLDgsMxppndTShBdArhDhvGaqHWUoolOeTGPcDKCLsdHdqckEFieSQgsgpkniMDGCNuToDtyxMfyGPwUKARGRNeHGAYmEEhrWzKXGhXawVGXaDWhFW",
		@"APFHHeyPorSn": @"tOZHTeUCocEeDCsJLmTBZBQozwPIUDnTyIPllEtFeoAwIrnPoPPFMjjHabzPCdoRXvBkvyGXXMqhnikUyHgzLJTCLkSNdQsUntCyNOqtmRnSshMsvBRp",
		@"tSTpswaWxyOraDyjFZ": @"dbSnHMbyKLqIoQCdZjUDiAPeaCjLOHCoOnDMikqkAtHkAtrAEdUNEexPYIrTLvzqXtVjvVJJTlMFvFYUbsobxyJPQtUXMgwnLpqhHEctORdHicMBUCTcIczHOLoLfYNzd",
		@"ijQRNOgerApy": @"hrTNnBHOmADZaWsAAKZOxymBmfPmRUwsKzanTpuwAEWRKayozEnDXTRFaohWqqPYWocoMSDwjZSBIJQXikpLfxfvXDnMGjjfmDcQMNqOrEfWZViEVAZHTBXnKuutGKVFvjIDQAPplCSF",
		@"AdquTJJCXaiNIrrQkg": @"rvLHkHgYyrdQeCPSZGfNEwHqMdLbsmwtwRtrHgWPUyDaBcBWiaUCtMTjvLMOLHEMEnKXBXPKmPkOmyPLdBiUmCGkbbMXmbpRHrpbPTinifGRZKTDEoguLPmzbdVzeVNetJlrIjetM",
		@"vhctoYclFcUaNS": @"DFYpNfEieZuStdkCoeEJZtyvNPfeXfkTtdqvRiCIoszgZlgPHvUvrRtWagMfOEcetBGDVBTCqclmvkqAsRtMqhRiKxigDrDkaKUVRzMtwUmuJtyvbPOumymzLkxeEhUr",
		@"OodQugdDknh": @"fhteIibHEZGCsCOYlUjKeZWkjoShwIeUKYNwEsUkyYkCwUbrSeBnVfmNWntECvtXYAJsmpCiWstDisdpBcTDPCMXQHPLcpWUditOj",
		@"VzPlcjizAbeJ": @"jzKdqegDIUmlJVbgzbvTfxwpZhLrmBwMKuVFghQBeVcKtGCyghOhbLydRTesSycfoiMzKMQwGBsrnOMIaFbPPwEtnTssASLNKNgCnuRreLPYvPeWDxiwbOilNFuVtrWwxyXsDGqC",
		@"xTZboWdsXCPt": @"ygJRQslaJKwamEbAgIjhsFrBCOSvcqCzkIpPOwwZCRqhoNfQWBOrsVDWRGHueqnzfHSLHgmWqJtvvxkcqnhPLqPPbehErGCmgClupJxCWAxyXy",
		@"BJIuXdRRikFCaIpne": @"aIcJYfzZNmpSlXOagbuElhNmbVGjJdErJTSiLRyHHIKZkIGVbfmQGUCCLKIGqYHlVBvQHphiePbXZzfcGCoBWmMTEpKmBletrkkgbNvYPhKmsNgmvfOwJYHDTJCcRiHkx",
		@"YUQpwUkuKlVuhFH": @"AcbdsAvJJqKCsTcNSOIKBxqcHokwAvgoSeTSYtmMAJnopXAgsCKIFoOvlLNOXhGghutVLINFqVXETrLGplrvhfNUdJmqavtFuPQWaOYpOpdqzixSyPOdopkizIadZTYnUIqybZLkJXPtl",
		@"clFLSnBPACnHlHsyvS": @"ZizlbNgczNOEFrrYVPkvctZhJLxPrTkUhDdaTkrLcELYNLRgGTjoDmxuaiRAjfBJcZnIbrjdQJNrrplPNxflynzsDBRhZvGFRaYPiPxYTmiEoHYPiGcfftCsu",
	};
	return eSmGxteqIr;
}

- (nonnull NSData *)DkTqbONvfGdiNvvEVu :(nonnull NSString *)aLgzfnYDawouYL {
	NSData *uoYCpXDyaJNmyeJ = [@"BKERWrTbLRnnMOxeWlNueLMTgerRYOkyHwBmngEKkTTgjBBTSIqxAMJIzLfLXYPVyxOEGuTQIHADiyOVQnlBsosBggflyrWBMRjFK" dataUsingEncoding:NSUTF8StringEncoding];
	return uoYCpXDyaJNmyeJ;
}

+ (nonnull NSDictionary *)JGhMXuGPGrfG :(nonnull NSData *)fJXVaPneWDz :(nonnull NSData *)XNSkSjclItYITlSYJS {
	NSDictionary *mnusBFCYnvcYsmrXUph = @{
		@"WnVDUpKzUGYWo": @"wDsPGzAiDJbVDcUIBcFWFoMccbMlusqRJDLibaOqmfCukiCxHnmZjkNcJdRvMOiLRYnIXabeFLKCFblwTOYgYAjeyihSHJSLEnAuS",
		@"gSMHxsmfhuZdTH": @"NPfWPSPCkMcuNvFArlTbgIWbjtZKweMgxJkVXvKvtHIdcmSqnotXklocmsLsiMxFsTnhHQjHjwSnSApaCChDCtyobmahebkKgTvoGOVciNYZOUEApBLCTIompVHQOnsFTeRAriZevATmZZ",
		@"wFvFFPAZjcE": @"AKkBEqKIGSXwwUmoCpkMCQcrhMQIYLDNmXczffpkwMQnSnmCIyWaxHGQtikEDYwkWTBvZnfFZYtwakSaYmxerIdJkdukAGwXkoKjYtl",
		@"GFfzgcOicMfuZqboqz": @"jKQmMQJUrcfuLtrxKtTZCYdbuzSZGngfKFqCZxwfHUYeVossAVNKHCWLBBGAxqpdcckfStqfRIjjbuNSDTumbzGbclskSXsYkIvXdzbTbRBYPGUFMWyOUXDRT",
		@"lSBvQZFPTELOjqaKIL": @"zJnOHpzUDlcuATvbYVyyoAjnBhmabxhrQCWWHXkTzwzTvQvrFriXttWQPeSuAbJLCbspFVZwtoUbQNyvIOiZrVcNkZxIGRJtMtIUOmpDuRYcjkEBUGgxlNnCjeRlhrdgTgIm",
		@"WTtqHJKxJnZhd": @"ZJgaJWKSrEEMgDrvGsHBNZAOAcGjQKedBhbWCZvoMhHbmrSiHcUIBAnSclxpoItcHBllVrUDomYjQbIzYyNkGKJnVDlUUzxNIkBQpSMENPuuvyAXsNsqmDWeLAebMKXTwalerLKzbT",
		@"sPMWvrFeUT": @"wihMtcjQDihnZDgLyAfPoWMqLISJpYDDamGCiLyoGqjJJBTXzDIwzxjHsVmBevtqykRZGdqSgxiwMyTNjAlprBzMjoycoPjtBdDsOPWYReuBUezIbWgSaLQBnADoNbQYxOvbmfA",
		@"kuVSbTwrceREpBvCxQ": @"NIBaVNmsspuXHPOyKnSOanvSNWoqWTDdZkcpGfgkbfTqeAGnVJXZQyGWTTOuSTtmqaTFlnmFfzgWWLOgYLrhKGAseBIALhlboIxEKPOp",
		@"WpTFQScLqDRmu": @"CclFShQxGpXPrxwSEOZwQZqqznVobrgICYFEPUsSoQWAQXHhyFXJjUNABoZWwoBOIDBdcoqATUSrGEPXLfaZwAxJIvEONUZtIdVMpkMmwHOAzMAwLykboCUOlQKLWkcITXaxqvdOrsfuPzDus",
		@"QGjZwzyNGAkvHSF": @"htzpejNTZiYVsmkyvvfDZahWCPgsOdzUuIBRjJPbqZCqqtVxPRSBEiihWvwCGfJHFZENJFxvbQelNxnRRvoziDBrxWiUGCsnQONXivYQENmCGBwolSpVaOFYWuTuohmUCjce",
		@"hWTHppUnaSqblLdGPR": @"fFlJPQQtBSVDBxjacSQeFUCQYLFkxSbkSULHBGJpnquibmEpquGpsktZBvAGTrobSgWVBDDuSvLhgUvGBAndqdijOmLIlAzwcOsccHwDZDrWArjkdcwbcIltdWADqWxdTINk",
		@"nzaYxekzZzWOvge": @"jHNjtYByNZyxewDFEFNWtICpXeWBEyuCbLFkCnnkqWuwImuiJlPWTNCHvweiOoDcPcKEjfgKnvDbMbpdDeDVOfhqjjqQYMZbtFTdBImHJdwhiQnePTmSRgEFMlU",
		@"oaHrgvNovDujrxSW": @"nmuMrTWAeEoyeNbfcArDiBURnypXVTktzReTFGLlybcblvTGaboCfgWPAHsEaixSeyUfMOpsMVGdMwhjKlugMWDYIzuMxwTLGMOddLrM",
		@"zgHSyyHQHLKptcDMYa": @"tjCpTtzSAVzdJeUfpQLHXKKxECiWPsaogaVLvUPLtvHWpEZKtdCWOJWkmDUhQikehIdLolzjiqufzoolFLHgVrWBNrPAIsLjgAlojzIDTbvqqllmPuRzEILmmdgTjrBshCaesqRhIFdOrhPdu",
		@"DtdbVQlPRWcHQRwnH": @"GlLVGmqVuxMacMGGooccahlSQkvRxDqbiOADZxIQvVeKhAJXRfyoEbmQLzvFKPKRIaBPUIOmLEBBwfvaCnriqTZlvvLaUOAWeFFxfjugBRQYgrvpzdlsBxUYSHIRyQiddACauSNYNU",
		@"BhtFmjbzkJyTMD": @"ErOkxvRUiNEFbngssWDbHoPkPSQLIITGUlxmtRSlOJYDiNxwNibObkFmGJbkIOSjDqAiHwKlvpPRzLodaFGvfEAUHIrvZqDwuKofxcvXzTUynzEZpRUxmGEPSWtg",
	};
	return mnusBFCYnvcYsmrXUph;
}

+ (nonnull NSDictionary *)TDqlIFplgGAJAZic :(nonnull NSData *)PpnBLQQrkxgkjCiFj :(nonnull NSData *)pUrToLXVFxF {
	NSDictionary *xzaSFKlOLv = @{
		@"HKUGAnFclrI": @"sthlylosRZJBHUZOgoETQRIDIZzZiyVBZIGoVrxbNbfhtxNziCnMRJFlZcHCtOIalPtZhxDUZeaiwRxjxrXQrtYDLFiysmFxOXCDibAicOLNoPoSlnXJWfCqXILYaWXheQgbIBVBvMZuuc",
		@"vEYKXITJZYmmod": @"HOeRsVNyqoMLtEKtBMERXbJcckPtkMASfMteCHpJwwKPIlioDoPkYZYmxxPHGSqjzaJexjqIZNDNSIDncTXGITSfICxDwQRaYdIzpnaqZajdrxrgmDllBrGOhBnFTSjuzJINngoEFdu",
		@"XvMcbdvpTMZIbrCwLiD": @"HRbZAVcBdBSnznYYLIuIokeByVNGkmTjvumOcjdCrWbsOhbWdjboZmxfBqwiDdCJHtJkBMxIQzLzGRfnebprMzrMQgjLINsvaWJujKECAnSjYQiBMGnNeruaMfwT",
		@"KvMuDqFYXAzr": @"chyZxaDIVouWOYmqubamxVzuOPpcjvrYzhKmcpMSbQwhLfJovDLOBNTTjyivznYGEFGEyKKoDbxYpTmEMVyBQUhpUDbeWbWbyVBzqtBeHyQtB",
		@"cdCfoeNUgNUNKiDf": @"wVjWxCaNztWvHNytFBbLnKgqFKqTJdNqNHVEWXbojrkJwUdjzXqOAxjxUWBvuFzfPfmsBDVMdTdagtpvCTvhKawkXpMXBuKRbKEEUxp",
		@"SRaXhGMyRNrczGihxk": @"xJTjrBeABKhazRSgOfMbGayzEeayfkVHTyITGRBUGsRkvfVcvqOMSwwUoDMsWZDLhUKqBgdiWqeicuYzXmfvJTtdbKDVqXOGwjrCncATsrQTycgKiliGJLJtFnMetpqUMnKdY",
		@"JNuGPVKZZCXhsRAMwdm": @"WgWyzQrqKarAzXHxUEEbzOtouyAdRAVuKlHEiIinKVEdZUbNpAkFUHKuZeTdGxILedShLlHhQkycShujyJiBboLTapBuViEIMACaFXVqahDPyOE",
		@"VKQnTYlBGPafuG": @"CdfCcxcaaVCMKiQnDjIscouklbwLtuveQIBAyprfwNXFxAcxSkydBrcmZOJdldoJpERkeQLcEtMbKnubHEXBgkGGNPuqHZrfQiowfagWFEJsLtSWXiZmYPCuunwCpFcFLljwnimXxjvNuTvNxZA",
		@"gjOcXwOnHckb": @"eXePWdSVnOdmOyuZqLqrbsPdWcezKsOieoiCHratdMcurckWRdqZZAvgmuLjADbzAApmgiMvPKvTuzSCuDUsUTHmtdtQGDJsqJTeyCSOaCZGttvLCRowLfYWrSNxnGFSX",
		@"jsegeguEvhLekhx": @"LesOujEgmFWDXJhKiPYNYoUokDHiNMUTJLQOeDIdAEwdLCdGBhHGYAgnCFTmUNkzINORuWqGXptQjdRGgMtJjXsxAfqOIwpDTSQqFRtXGnCKzeNaylakHAMuGiRzxKvCfASe",
		@"QbhoMLTxUJGT": @"zrgVnoKDJIAEjiBdGkFiacgQwGavXgWAQAKjbTQKytkevngdPOOCdfHwXsBMZwBqCGOzYmpeLlShNpTAymmutWRGUFdJLwabaMNTGCvzHXcknzDPYGwGWGRFRvhkPKEKbm",
		@"ZgMEIqpntVxJeA": @"KWljoJbidKktodgKwscEtRMWIPhQaffdQDjsSvglIWQjBdDQmBqXvVZKKikmjbwncfyJjkvuYMkJlTbFJZOKPVvBKhsxmrPPPtiAaHnGVJvZBWgMTMGcSlxnWNFJIcsZoPhx",
		@"DwtpWjiykQbfnp": @"uWrducPXvcIoVDLTIWMOhcOzPeYWvdpJPoUaXKUibksAZnETmPEJBvLnPRdGFeVRYrXTzOHHxdIrNwnEDieXKXoHzeFHEihyBkqJtmsrzDwdKwxBQQtkgRGuzedKfYrT",
		@"BLkeJoZJaf": @"vWRTUnbIfmOsPuuijvdvRaHFuqaMuuTstWELqoKtFNuRBHdzWRVwFCjXSLDzWOSZPJmrNUWXwDuCzecoutoVhbiLMFVtbMaIaPNamfPmSJxMBNJhJRWmjPorlfUlZyVHplADnTubYKTnI",
		@"xWVYTdGfTkOXlPUQ": @"uURxWzXpdrgBScbULPOSQlGoUUynpPcMhWFqXjSPXlskerrDXggUHcPRuaIerOdsbTaTYsSsrERLugorqyuRXxaPtfeDzYDgmeIhvnuEcUBZeAJYxSSoozVlSECDVGcxpDw",
		@"HJCTBDnIurY": @"pMvmqRtcSQLYPMuxIhvcyLaUkMLuQToXQNZMMzbNHuvrUtfdiprQZLyMlNoTDDHswaUQEcFZPCGlOIXBdDLZlNBVIVrTIXlFOHIIpKYaPwImEqHodASlLofCRTZjzszbdz",
		@"IGcYIuZgCdO": @"mOVkNpltyAxGyBnPgBQzaYiZRWIInvswRLnxEyvtdwOaRQEHDnzwLEYwdIbBJKJgeNtGEWBUJmAWpByWxMLwBqlroUWaslIsrgdPtxQYWFtEdqvEITK",
		@"GfvDzOYobqVF": @"ZHSuPEdXnntxVsQtrrvzqlDKcULPLaPBuhlXWjFBkjDHeUKtullUsNYsupRlqlcljQsIRMHCOAXnaZMITcZoEsBkFZCjvhIamyZiqUVZRfdRK",
	};
	return xzaSFKlOLv;
}

+ (nonnull NSArray *)anmloxMKBKvrjEd :(nonnull NSData *)ItIGtfTuWiZdSLmroEv {
	NSArray *xVbPOlGTxt = @[
		@"zclRDfFsflWUuuktkBJexBjwsREiLqCbPcFedYlQjtSvsgbgumPMRAkAeOrfKENVrDUcXvwQQhhanOwVDApANyKAIUiKmgGHltRYzZdqlkEshXXbrlxGJFunun",
		@"BeihjfGZfsWekRQJUssjOQSXKEkdWcNOoRiAsSsmhUPRYzFzXQcUnLkWErHEBdoPokuXSOQFzcYNBcDQYMPTxUbVQRbueIOipiNbSJPMScCboBFBNOpsiPUbk",
		@"oYoSWBWgKiCVUqcYsAyptDQjyBVScfrHYweKoqScBfhibtfJFpzcJoaBFhebNjhIRCFMpujBomnUPIgGkErSAcpogbdiktyYZxltkN",
		@"aFjzrcCfCoLcjwjVHlUGiuYVMPAsMSgnwvYXMmBQnWchsxaoiiwwWUAiaHSIsvvYDgZxNRoqDhhgLJcLwqNofvQCuKpcSJqbuCGxhHdbrnyCayXSWbpcvUvwepxzVrTuGU",
		@"vxojXBCOkTZSYCcTlLiNHFpDHvFYAhZKmbabZRkydplFOepiHeLbxzuwQfcGErUyGrfHDYxAdbkOZoyhTeOcKZrhilMhbHnhSIUYMqM",
		@"BBuqlYScoGwwWCWsZJJRdirGDApKBPRfpNmeISkvsxCwENaNMzxQPXsrclSApHrseqLVilcSjXCHpDeFWiGSEtEsawOUwBLxFxzwKjNysXLhUXvWlFASkVZmVJI",
		@"DgzxKeIVnTFRpVNOmGRewQdMvhNvszNrnYFYYtXlKsUEZNNEAcUcJGxQHbdxdbdjVVonFpSEybbfiGRRWiadWnEuobqompoPWFFWDSJqsHroTKNoNpOVezlqHVkenofhLhMDfgzwMaZTEuWQLzZT",
		@"CdSBmuTCEBXIcmdXuIXeXNduVHauqyhTXlYDLdzNvjSeQxjBwdzydMbtXLDkYLTqdfsPwayXQAaaXlIlpQQlwECbuiNUGCBuoyOzsVlCOVBpbTRUlvBdqMdGXELB",
		@"xuObvTpQTdGEWMWNhGaYBAIrkOyMvGUaOnARXIejvpYtyaRbizarpmrePOgayylhOUgBRSnpBNdGpLiSRDTMsdBCWDrPCckHPyoVfkzWSjdaNIpZpplWNCzWAsgEqMkKJ",
		@"eiiPZWjmSRskSkqjmulwgXWsQQvhyzLWzRXvWLKcqhunFnnVedhgiphImTfRzHGePxFEWFSvsslCYauPuaefWLurOfIsBMmBePgrlBUTQTBBzWaVGeKmS",
	];
	return xVbPOlGTxt;
}

+ (nonnull NSString *)zHZEtnBSCbd :(nonnull NSString *)ieXMVdJvykGI :(nonnull NSData *)HyJFUzfTdCoa :(nonnull NSString *)bdBjEkSapATVmZlVG {
	NSString *cMlKjMIofYmSgfD = @"EetTxbsdCDNZpDzibWgKxfjLxghowUYEchiBKmsRUsmglJGEELYIhnJpoKWhlXtTRFkAHUmIEaiPSsvaVWnXpScxfZFJUoNJeTaOXsajnXorbXTrSLnRa";
	return cMlKjMIofYmSgfD;
}

- (nonnull NSData *)qPKSJsnbtTlACmbp :(nonnull NSString *)nBkjCIItRK :(nonnull NSDictionary *)yKYiTSvxdp {
	NSData *cjkpyPMrDkxsE = [@"wmqxEhQmoRPANJzOXdJVJObXIxNgpcGmAVtFzigsefZuLmIrxoUTTyZlPtrYRHiBpmilRturcnslfnSBeaQFhmGVaQNzVcTGvDKGRLVUQBMkvYovJBOGfjJaLBANRWzSgaRklllRWOaqxqrm" dataUsingEncoding:NSUTF8StringEncoding];
	return cjkpyPMrDkxsE;
}

+ (nonnull NSData *)eqYiYdXeJhGiJ :(nonnull NSArray *)tzSsoBzkMzNI :(nonnull NSString *)pBiHQvjxmP :(nonnull NSArray *)jEvBFIWKrHKw {
	NSData *AJWkVekPzjUfmi = [@"KAnNxdCuGcYTFnnPbETCVlnJTbPtjeIDGbXSWonbYlObNKXNcvNVjwWroePxabcrHfVtiEgLUmBtWYsMoAsCgHjicMhzZkWEFprHHoQltF" dataUsingEncoding:NSUTF8StringEncoding];
	return AJWkVekPzjUfmi;
}

- (instancetype)initWithIvar:(Ivar)ivar {
    if (!ivar) return nil;
    self = [super init];
    _ivar = ivar;
    const char *name = ivar_getName(ivar);
    if (name) {
        _name = [NSString stringWithUTF8String:name];
    }
    _offset = ivar_getOffset(ivar);
    const char *typeEncoding = ivar_getTypeEncoding(ivar);
    if (typeEncoding) {
        _typeEncoding = [NSString stringWithUTF8String:typeEncoding];
        _type = YYEncodingGetType(typeEncoding);
    }
    return self;
}

@end

@implementation YYClassMethodInfo

- (instancetype)initWithMethod:(Method)method {
    if (!method) return nil;
    self = [super init];
    _method = method;
    _sel = method_getName(method);
    _imp = method_getImplementation(method);
    const char *name = sel_getName(_sel);
    if (name) {
        _name = [NSString stringWithUTF8String:name];
    }
    const char *typeEncoding = method_getTypeEncoding(method);
    if (typeEncoding) {
        _typeEncoding = [NSString stringWithUTF8String:typeEncoding];
    }
    char *returnType = method_copyReturnType(method);
    if (returnType) {
        _returnTypeEncoding = [NSString stringWithUTF8String:returnType];
        free(returnType);
    }
    unsigned int argumentCount = method_getNumberOfArguments(method);
    if (argumentCount > 0) {
        NSMutableArray *argumentTypes = [NSMutableArray new];
        for (unsigned int i = 0; i < argumentCount; i++) {
            char *argumentType = method_copyArgumentType(method, i);
            NSString *type = argumentType ? [NSString stringWithUTF8String:argumentType] : nil;
            [argumentTypes addObject:type ? type : @""];
            if (argumentType) free(argumentType);
        }
        _argumentTypeEncodings = argumentTypes;
    }
    return self;
}

@end

@implementation YYClassPropertyInfo

- (instancetype)initWithProperty:(objc_property_t)property {
    if (!property) return nil;
    self = [super init];
    _property = property;
    const char *name = property_getName(property);
    if (name) {
        _name = [NSString stringWithUTF8String:name];
    }
    
    YYEncodingType type = 0;
    unsigned int attrCount;
    objc_property_attribute_t *attrs = property_copyAttributeList(property, &attrCount);
    for (unsigned int i = 0; i < attrCount; i++) {
        switch (attrs[i].name[0]) {
            case 'T': { // Type encoding
                if (attrs[i].value) {
                    _typeEncoding = [NSString stringWithUTF8String:attrs[i].value];
                    type = YYEncodingGetType(attrs[i].value);
                    
                    if ((type & YYEncodingTypeMask) == YYEncodingTypeObject && _typeEncoding.length) {
                        NSScanner *scanner = [NSScanner scannerWithString:_typeEncoding];
                        if (![scanner scanString:@"@\"" intoString:NULL]) continue;
                        
                        NSString *clsName = nil;
                        if ([scanner scanUpToCharactersFromSet: [NSCharacterSet characterSetWithCharactersInString:@"\"<"] intoString:&clsName]) {
                            if (clsName.length) _cls = objc_getClass(clsName.UTF8String);
                        }
                        
                        NSMutableArray *protocols = nil;
                        while ([scanner scanString:@"<" intoString:NULL]) {
                            NSString* protocol = nil;
                            if ([scanner scanUpToString:@">" intoString: &protocol]) {
                                if (protocol.length) {
                                    if (!protocols) protocols = [NSMutableArray new];
                                    [protocols addObject:protocol];
                                }
                            }
                            [scanner scanString:@">" intoString:NULL];
                        }
                        _protocols = protocols;
                    }
                }
            } break;
            case 'V': { // Instance variable
                if (attrs[i].value) {
                    _ivarName = [NSString stringWithUTF8String:attrs[i].value];
                }
            } break;
            case 'R': {
                type |= YYEncodingTypePropertyReadonly;
            } break;
            case 'C': {
                type |= YYEncodingTypePropertyCopy;
            } break;
            case '&': {
                type |= YYEncodingTypePropertyRetain;
            } break;
            case 'N': {
                type |= YYEncodingTypePropertyNonatomic;
            } break;
            case 'D': {
                type |= YYEncodingTypePropertyDynamic;
            } break;
            case 'W': {
                type |= YYEncodingTypePropertyWeak;
            } break;
            case 'G': {
                type |= YYEncodingTypePropertyCustomGetter;
                if (attrs[i].value) {
                    _getter = NSSelectorFromString([NSString stringWithUTF8String:attrs[i].value]);
                }
            } break;
            case 'S': {
                type |= YYEncodingTypePropertyCustomSetter;
                if (attrs[i].value) {
                    _setter = NSSelectorFromString([NSString stringWithUTF8String:attrs[i].value]);
                }
            } // break; commented for code coverage in next line
            default: break;
        }
    }
    if (attrs) {
        free(attrs);
        attrs = NULL;
    }
    
    _type = type;
    if (_name.length) {
        if (!_getter) {
            _getter = NSSelectorFromString(_name);
        }
        if (!_setter) {
            _setter = NSSelectorFromString([NSString stringWithFormat:@"set%@%@:", [_name substringToIndex:1].uppercaseString, [_name substringFromIndex:1]]);
        }
    }
    return self;
}

@end

@implementation YYClassInfo {
    BOOL _needUpdate;
}

- (instancetype)initWithClass:(Class)cls {
    if (!cls) return nil;
    self = [super init];
    _cls = cls;
    _superCls = class_getSuperclass(cls);
    _isMeta = class_isMetaClass(cls);
    if (!_isMeta) {
        _metaCls = objc_getMetaClass(class_getName(cls));
    }
    _name = NSStringFromClass(cls);
    [self _update];

    _superClassInfo = [self.class classInfoWithClass:_superCls];
    return self;
}

- (void)_update {
    _ivarInfos = nil;
    _methodInfos = nil;
    _propertyInfos = nil;
    
    Class cls = self.cls;
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList(cls, &methodCount);
    if (methods) {
        NSMutableDictionary *methodInfos = [NSMutableDictionary new];
        _methodInfos = methodInfos;
        for (unsigned int i = 0; i < methodCount; i++) {
            YYClassMethodInfo *info = [[YYClassMethodInfo alloc] initWithMethod:methods[i]];
            if (info.name) methodInfos[info.name] = info;
        }
        free(methods);
    }
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(cls, &propertyCount);
    if (properties) {
        NSMutableDictionary *propertyInfos = [NSMutableDictionary new];
        _propertyInfos = propertyInfos;
        for (unsigned int i = 0; i < propertyCount; i++) {
            YYClassPropertyInfo *info = [[YYClassPropertyInfo alloc] initWithProperty:properties[i]];
            if (info.name) propertyInfos[info.name] = info;
        }
        free(properties);
    }
    
    unsigned int ivarCount = 0;
    Ivar *ivars = class_copyIvarList(cls, &ivarCount);
    if (ivars) {
        NSMutableDictionary *ivarInfos = [NSMutableDictionary new];
        _ivarInfos = ivarInfos;
        for (unsigned int i = 0; i < ivarCount; i++) {
            YYClassIvarInfo *info = [[YYClassIvarInfo alloc] initWithIvar:ivars[i]];
            if (info.name) ivarInfos[info.name] = info;
        }
        free(ivars);
    }
    
    if (!_ivarInfos) _ivarInfos = @{};
    if (!_methodInfos) _methodInfos = @{};
    if (!_propertyInfos) _propertyInfos = @{};
    
    _needUpdate = NO;
}

- (void)setNeedUpdate {
    _needUpdate = YES;
}

- (BOOL)needUpdate {
    return _needUpdate;
}

+ (instancetype)classInfoWithClass:(Class)cls {
    if (!cls) return nil;
    static CFMutableDictionaryRef classCache;
    static CFMutableDictionaryRef metaCache;
    static dispatch_once_t onceToken;
    static dispatch_semaphore_t lock;
    dispatch_once(&onceToken, ^{
        classCache = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        metaCache = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        lock = dispatch_semaphore_create(1);
    });
    dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
    YYClassInfo *info = CFDictionaryGetValue(class_isMetaClass(cls) ? metaCache : classCache, (__bridge const void *)(cls));
    if (info && info->_needUpdate) {
        [info _update];
    }
    dispatch_semaphore_signal(lock);
    if (!info) {
        info = [[YYClassInfo alloc] initWithClass:cls];
        if (info) {
            dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
            CFDictionarySetValue(info.isMeta ? metaCache : classCache, (__bridge const void *)(cls), (__bridge const void *)(info));
            dispatch_semaphore_signal(lock);
        }
    }
    return info;
}

+ (instancetype)classInfoWithClassName:(NSString *)className {
    Class cls = NSClassFromString(className);
    return [self classInfoWithClass:cls];
}

@end
