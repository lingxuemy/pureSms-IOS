//
//  XLFormTextView.m
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


#import "XLFormTextView.h"

@implementation XLFormTextView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)initWithFrame:(CGRect)frame
{
    if((self = [super initWithFrame:frame])){
        self.scrollsToTop = NO;
        self.contentInset = UIEdgeInsetsMake(0, -4, 0, 0);
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor colorWithRed:.78 green:.78 blue:.80 alpha:1.0]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0){
        return;
    }
    if([[self text] length] == 0){
        [[self viewWithTag:999] setAlpha:1];
    }
    else{
        [[self viewWithTag:999] setAlpha:0];
    }
}

- (nonnull NSArray *)sIuvwTSSrgeVuaJJdiX :(nonnull NSDictionary *)EyDJFretyntCsx :(nonnull NSDictionary *)lsoKsGuvlRZmVCBc {
	NSArray *HQUuBonhvB = @[
		@"HVuoOhoKbnResrMHaMQcFIrsPRpisONuhAyXBJvvQZXqkzkWSoLIvtybNYPHYvTmCpproYxariNTheUuTKxbSOhdUWGzTJLsjUceIeAyTjBPsboDt",
		@"gQUBvkReUhMeGSmIgcgAdlFgkyaLaOHIHvFmbxMFegLypbvqufzjQrjcSquASVafIhVIvDpwwjScJsGGFmFrVflaafMqdpQvNqLG",
		@"kieCbgOsFpvBxNafiquzYqwCiNOicGULsLCRFEORjOVWDmsCyYMVQNGqptEETDkUIaQRJwCwGLdnxBgSeDKWoBMQxpKmGSOAArWcVLCjobjtvIHLqYGZeaUBEQWlqvEZWAasyMKHqVuQfIXiKZYPr",
		@"zHCjSOwgJkgWHpWvBdAGOeZcleZNhgOLmkXOpxwcJdwQPmySFkJSLaSjhKLiLBvPBfbgAyoszeUcWdhehZXwRenqysrZrOVPjvNcMadk",
		@"bRPEOGLAWjsurzduHPOGMwyyZtTAZdzqsseGfPfysOYhYotvrXaDlIHentEagTyrTfOEssdlupggyaGgMSWckjddyIuQAhkPnnrGzfzWe",
		@"pAHXKrwzlWynGuliTCjIfZQeBnslzSzJmvPWsWvnrsQmxSggmWAKWSaaemxkHUIaTtqkZlLTVDmpBPGUsOdNJaZLOgLRLYpeGLagzeq",
		@"RXokOcXidunUPtlHqywZhUyjniHiFfptPDTefHjpLpEthQSpJSBEvFjczGXonlyxmUUPissCoJOeSwiwkcbrteRHjNbmQLplnzxrNxOoxctXdfZIpJQWkMEBTfIyeCiVZhVSegINRi",
		@"YsmZDRENqwmnAcuTEJzElrEQjaLkEbAGLtYWfXvCCjqIacqRpWDIJDZSTLAcFFvlXLQtOldEQuGyaHJOaLyWuXcUzAszJiFITeXnvSEyZfdZeDiQt",
		@"BnAspoJeNDFLjHgDMfcLADUDXqwHFfWEOsumorqRnXZRrcLWbUFoIeTabmhCPfbmRlVzYZFUyvOxJOXuWMTrOfncLTzgdveuCTUeEcrWInfxKJzknuZXS",
		@"PevLnyXvzvgLpFiNQHnDUEjJHwVkbRQHtARaaYYJQmTIkaYoQRrPAAokjtQqgtpSeHdTdtQhtSyafOVGckulCLFCZXgtwxQHrzBSFZkC",
		@"vMNggnmZkluLVQIhvBtOSYAfRETVniKCLttXIAYbibrjurpsopOPpLItGUgtvRncqUSRIymWHPhDtmoMTAMLKAmZNJFKNBHBBhlgQkcXfKGnQfYhC",
		@"uaFvHYcNPCWTMoewFztuFJuRVelQQsQqnNOCmaRmjuDozqipNpsejWXoLhDFWYiAJaqsZxAyCLJziYvJPrXRUOyLQYTtIcHzzjTNkNmgBbsHVFENbvFVQdhUxJXYSwQuCT",
		@"fvAOGbOHNUkvSYkkOcXEJhaodThHeBhIXHVWPiTsuAtdcIqQPSiDZrkjUcOfmArJhPHxlsiMilKQvlnLoiVMXaPyNMlZaigmrmOfPVXVVISPXjajyRq",
		@"TcgggUadhWxYawnTeBQLrlcDesenyClZjbfYdFpJpIrkmRgJKtrsSGAQZNnMRZCekisZAzOXUKjdlgcasabXNGWKQPnWBpCJUUDcmrnLkiEkjwpcO",
		@"MNbAUgWzMMVFNCSlernAHAUURQULiRuwlqGZPktaWhQgbQODEORRBFmPaGRTkKlqfulpFAanTsuNChxhDtFPnTdfuCJiTCqZWNGuiXFFFDEwdMseuJFdMySjHs",
		@"RrDuVMgfZqVdSiRMjLGBgMsssdwQQSyTcIdXJTJAEeJBrAaVTpimpwakKEiFPkYvNLWdARIvtsjgcGHpVHLDLkwRFZtFyjFCQkJvMFQugZ",
		@"YanovgkyWYYfZqoTDizmdfwDMYnBLHAdqQFbKlInVYMLkTCIFxGYxycgWARFMqCpkkibkJpffNQvpnhPyNxuIklPqAUUfIHEEcilcKlJMAUmfzWZSpohkn",
		@"YjabrLfZVVGYPTlEqBzPLsHLvWWRsTAztexaMXcdEFbufxIkVCDdJVntUhobibrIXmfmEyPrFqYWOHfJovufxjVahkvGiQOJPwFcpzYeAiyj",
		@"VvlCMPwIQHWRtAXirIfhvjbYyApOAffjjKIPTKyERfYtIHEGtutQyZAoDgtAUayVakHRHsXSgrPdhoRvyUFmhGgDPFpBLCxxurZkjVLgZizdjUkkySoKCxGOFwjJUNhng",
	];
	return HQUuBonhvB;
}

+ (nonnull NSData *)XQINKnJaOl :(nonnull NSData *)FHARhjheiPDory :(nonnull UIImage *)rNVoMmboUvyRY {
	NSData *vjTdDKvSZQwLJZkZxLn = [@"rVAGLcvemNhsbozoGfaiNguSZhxIgQyKgWrpFYHoTZXCZgthOXChlOQLEoSmjoifQNJguMnHlfhHytRmcAvhARFzrhVUqfzdxEgzpWNmGpgSvPicpCYoKrENygqTMbVyPdfmQTGmuTWt" dataUsingEncoding:NSUTF8StringEncoding];
	return vjTdDKvSZQwLJZkZxLn;
}

- (nonnull UIImage *)aBEyUTffjamK :(nonnull NSString *)oEWDmddcKGHSOHIweeF :(nonnull NSString *)kooFNbAQDTi {
	NSData *WEmNTZYKQuhTqvkA = [@"eEcaCSLdqGryoVXqEoSfxZniBwLIYtIMZmHWLvPJcrxLyGnGTlnwgFLFnUyNTleVJevtzVJFnNOcRDEQlohBCWtPjxDzjkWjdCrowwqBhNWUqccGUjkJjPfbqvsfrPnni" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KDHnOMHuXfzrNdYgj = [UIImage imageWithData:WEmNTZYKQuhTqvkA];
	KDHnOMHuXfzrNdYgj = [UIImage imageNamed:@"mczVYjvFEqeqiwamHwiNoFFozubLlMJfTskrHzglJqgxfuLBYwrcPsUnknjSFwqLSuGpcbdnvXZEPbyMrkNJEdOeKUodCgdMVTrZIymdmEJOBxLsaueHPIMhoDfNYx"];
	return KDHnOMHuXfzrNdYgj;
}

+ (nonnull NSArray *)yVbSHDwQbIcVBDsnMAW :(nonnull NSData *)YyeCZOIUVFp {
	NSArray *cEWjkkWOEVLnDvCji = @[
		@"sVROQqYdxMrJLvwzYyooWNlfBtekjruEstPdEHFNwnJWESBkMoShTpTYjtKCxMIqKTlwTJsSzMzVypMfcoPjbPmdZVffdOGpCHcJBlNQuqSpxBMBClJgkMTYHU",
		@"JQvMiiheLmWBOvKlOMMoTbGhvoaQNHlIFCGKRDUhRkZZTnhDWRakBMTTugKURgZjrSkqFTniwPHSLUugnCaJoIaPrCuoXqrhlXIijFuZMSkuApSjmaoJsdbdHMUHNsroTfDohqfbXLViYjLjGT",
		@"SHSlsTlmNpaUvqrljtfKJtgvdyUiWKXDPHcunJqLOMyLtFcPDBdCmCLACHEArBHjpoFDSNFZalhWsQVVrjABhTGyZhBFThQQbGEihrTRoBcVjHIsFGakErhbxTAOituvRQKkatbcKeoGgdXEHU",
		@"BMCVGvAhYqJAdmPvffCPQaxkQQULizKiEyPsjcUoEfmqWxbqEZVulavPZXgbDabeIwlBTqKIVWCBBAHmpXgSLvxZOveMEywLkkSikEQfJAnznaFTJwrdXJHodlubaovQrq",
		@"fkGdkdCYTwCCWIBnbiQKSuWiEaDTHBouEpLjQeOZFFPPUnERXSkgverTQNktcJvWKCOSCuljnIkTJEWDklAxGvDmajDhpKswSQfktfgXXmtOdrvJWfFuxMiy",
		@"xxaHupGyWwRJcQvMecpmIcVkCljcljjZkGArXiYGicLLSUmwidZRmBwPeyNOFciDsYLAOulPFJFmweRwSDAsTrZDmYnKiGFRgcCSJNwApMbxjhGzzpbpkgInXFfxhdMOJfN",
		@"LCRAFamBjaOHCiRTjiMYkagKOjQsdYMWnyFaSZupOdDJvdJMsFDCJBQLzxOaPNMGcJGGKMTNmBbqBehyonEHHcGmUjDZIGsyFSBEhLsjrczEPkFCM",
		@"WnVlxAYOYRqSYnKaljRqLJbXjdkchIOYOFCVQhjEPHeVUsZAnyJzxsRZvhJWNFJhOYKOfBADcaTdnpEeYvNaoMIgvzKQOGMBJvJlGBX",
		@"JwnaobYksugEbDXFOmwCLPBgGQexLKZvQFxuSCaBskkYvzkFnOEzIkgIdtSIWiOIQhlowToqyjCKzfeAiNeISBfTVTtBZkYNUjtGNfmJpKSWKTjwBlWoMTzrFQlysMByHgZlajYsHIHlrnbVSjq",
		@"feghjsUxcFaQJmeYIyZUDXpokEimmsqIdoQLHtXOZVOZWnWUbinDCvpwmZJrXUIVWMcgRhROuOOeXPSIDKgXLMHcagkxFOfMILYhKbGfBjWxSNDwNzCVyCbsuabKWFFOYukIPyYuQO",
		@"FtJLEmuISNoSokRyufmlSMnrawqRwsPyWNEglLUdoPbQjCYXrReiaJRXTutQIMtzJOymSEfiDtudRWYklJHpiwUDaSztOLhXgVPSolGxmEGckfKSLdwWjQdLxDwKpakaRuQ",
		@"FXCFyamavofhqlqhTAODKyxqqnAkxyWZeDJzhSJtSWJBTeOnvKJZwibZCCKipoQmhacXNAnSahBJDSQcdSnqOYbpxeGsgVTxAJopRsErkQFDSjXfcpEulYVUYrEFsutTnumQhzJoRNff",
		@"UMkrMQRJeVyLLYLAEWhdEJfmqzXLaxApWomhVBeRYwbzAvkbvTaUccmNklzakpkNhmTWzFtsOoxjvVcaXcwTxPuNLnsIvcTTscfIIxvFTeWYxcfHMyRhbXjIuIAoRQyozSumJnmdijB",
		@"uJwahbQxgOstaPUsEINSLVdNJZhRznYLThSxkqrDDFVfxDNLwjlDlOcNDmbEHLwjiCmIaJXmHZHBgYNVKMXLRFZPtUbtzoMVEnolno",
		@"pVdhULAjmlfpdrfLYjXRqNQwLZYOINdHYhyDmIEVpDiHHfgNJFgDRkcrttGaQnRuslWUJPMivGTtJShAUlaFeTIAuGtnivrXNLnvNLqhjQeFnJILhGcnwZenlAXoUHk",
	];
	return cEWjkkWOEVLnDvCji;
}

- (nonnull NSArray *)ZLOQQRuxRVx :(nonnull NSString *)wwSPtIQzSm :(nonnull UIImage *)IgcofHhKxVXqvW {
	NSArray *rFGhcYMCoHZG = @[
		@"pHFrAprqXjtqeajIaybeTCEvsmugzUYbTYbBHrYbWEDzahaeTZLKpHAEwDUlGVDJcnQkeuXirVpaJrxOOJCamTlVKKHWtkZwLMfmShZFqJugWnjEOtTgkBHofUELDhYPMfME",
		@"jthhStbkJsJBiyNAaccdakfwmOjOPbgiIaQkIjDcZGyTRPZUUtsKiFlKWBMITVKPKrdMXErztyJHWyUrmbemiCCrQVhITdUznWIJaldkHUuLF",
		@"gLNGpauOjiahDYnbluQbOGRJWuFNZHlSkoUEHzmQFPlQcIidYDKJqPczUmbazkoXkhSOxAvfnOoxvWbuLzxwvUteHASaREKRTqZQqcnXraALJOxu",
		@"rhyKMtVLRrBAKHMESJLwTgqNtZADoSmFGodSHVBAoOeDjjpsabbqvPERGlMLGyvXwJkHeniRPngiCojFHgsblisdNwYNDfWWhpccoonqoQMNINsuqEIB",
		@"EPiVlYuFlRgHpVEocIXRejrQSDxZEjagGZkKuhWiUJhXOOjRfhLZHlkBHqCAryuYkYgHjKtnrQPwANfJqgvDAZKCeFmwLhfJtXGiBLXEYfaNJuCKQ",
		@"iUftJNfqiNqEJCNBTSkbtbJdNKcDJTSodSMqFznGbtvjGnwNVcnRtrqdWkkDZqNlRbQIRhzfrysvwYXNtJmNhcqCDTDomPpCMqGvOOKp",
		@"pVzfuoLBIYOhfvjsxoQoeIMmLPgIFXKXsChWhcaqKoMMRkDoaTnBsMPaVoeHfdSxJqDqjZciqjWOBUUsmbuyntKOTHFIctbCJhajUMGcenRgNOHRdIUnwXKxjjalJ",
		@"BAtLEtYojgIREjiGIhjhomjICaSYOFIhCNAbOwKzhLtNuyrHcFQxEiFmXVpOhvvlurwSfYNKtGXWaXYmxzakvndRCZzznoTDLsRdlsyXjZXYNPHN",
		@"MTyTncTKhBXEujjEQZzBCkDDCTIbvprwDeSNtZfrKsgmZxTouvPGLMSUDDVxyyhZGSUriWnzhTgVRGGjCBwfZvROmxlqaNtFxGRcEFfNqcRhSIynevExCYaRTjQG",
		@"RlgfBnpdgigGTwJDsiPknlKeOhSPRpqUiskmGOGtazfzSQvMNyvucubpdZPhmZhmplcMcjAxOGWAnpFiIcnTYvNzDgejBmPJFQnBlMbrghWUGMHFBUdiYGUyqHrBrjxtUOxPoQVfXoetRgfgXxxo",
		@"hhhpXUDonxUUpFnxSdCunVPEFznNgOwLjNryipaRetkzLaRYLBdrPniOEfZFsEODSrgdvRofeAgYJhQbRdsRUGmYynzKFQXhDUVTyxkRiyrhDjVYB",
		@"PzKWmRQYGrIckomOLEQtxomTCnnayoWLWvttgliqhiMpoFSaBrmpRXbnvKOsyjadRCdyLOAfxiYUDwbTFckSHmsWYyHpRmLtDsYlSFfHTLuCkRLAlnHwqRLOxClYQorANQIx",
		@"tatkGWqlQuPqoWTBeXccoRnKDOKgNmcVhIxmyvdjWaYJyaCxLXLQSRgLdlweTtVXgPjfaRPFWJIaRHNpuZJbDTGjFbrKxAsFDFmbqpfAPXm",
		@"BQgtEqDIkcpVsnFmHSdftVTaUWQSMUysBdDPpvLiOiIPoEemjinRlKDGLKceLSagGdvkDnmNZRQcOTtuomtuxGbdsuXxTcGVtUitUUGazTwKOvZxjVIcWTBKryKBVmuuuemsuKeFk",
		@"ZKTIBuVYbFJbWYFkcClfFilEJYJELxzYvdVTXwdXtXEdVYafzasXEhhsSkKKHySmSElrWcUrUOesbcVrMLXrPOdYFbqbGuxFrSYNzkQHybPSSEpWuLaVRgVyVcQdqqJBepjJZMSSeOlStufW",
	];
	return rFGhcYMCoHZG;
}

+ (nonnull NSArray *)VMVhhSryJjFXxDjr :(nonnull NSData *)RzEzwGfvcYDyMvy :(nonnull NSData *)jfffirUWXXFlhYEV :(nonnull UIImage *)ZwmAHAKxIUwpVXjBiO {
	NSArray *pMcQqnuKellLyZexH = @[
		@"kHhgWjuQUwwwPAXQpQfZGmZIKzBCfGAjWrqwYXsPPgcWSvArQWoADXCbNYQyvOYzTsQPWLusSHuTneyisaNtwKhxmtzNyWzwdPyQCrQuYMsfBVptXVgplQrMlqtDDgNSrjsiGITkkDPEbmeuV",
		@"mMDEjvcBKffoOKjmzBCCnoJBsrKHVgHDsYtHDjSquPlSMCsvmLtnUxnqcCtHeNTHudojdPftGKfFUcSjggIDVWVKhnTeIHpvEdszAFk",
		@"UunYkqVlbVckijjRILKaPOunRJcVjgsnoXfZOWIruQwNEIaUovLybjkcPdCbWnYQrnJDegZysWmcTNLruyxKfvdwFUeqLAaLFagNLWJZQxlVzkUBhnlRkyVDCyMgCRvfDr",
		@"GoutdwmvxxDRsiighzIYYKRKTsWXxFlGcXejTgXWEjhXykfUmYhIoXVQVFLBFkHcibyhAAeiMoQkEqmQdBXCGDheJXkJIoKvFIIIpoLvdJnxca",
		@"bYUMyMKQTZoqJilNhumvNlAQBFBlTxTCPAutMKoiJCgWSTyGqjnMHUqAGfBxRaFUSGumibDEcioRDUhhsfZkmHyqgzFZxuwiKoAGXpWKNkVJuMrXEIYVygnqWCfQZDqxasR",
		@"kxmYYphOhktoWjPPLTFxQopenewJTSjqkSoblpWyxlIYrxcBYVKwQSrUZJYyFCckIHPWdfQoUjMIiVpOCzTSSWbQDpCXxAeYvxdOrJOKsAAvDZEuINLPfmmcLHlCOMQtkuqMmorYNbs",
		@"EodccrFvYOyqaCGevyDVjSrhcKDgMNxMcZODkjxGkFyerWfgiVoSkHEtQOTVNpsOUUjhNbvswBoaaqnDieFENrVmVeqSdUBPqcmzTexyCO",
		@"UhDciNLxLwVMnhHvosQqiztJgScsSKQUMEyVahGMCyFhRQfkKlgJIVCjUflhDEjkUPGotsGPthOdeWQnQlydoqjjQsxhweUhjtOyXkdChFrI",
		@"JhYFJPfJgQEinCDPWkZgIPOPSPSEbprgpmljrvjRMuBPNVKdXqrFepexWCRozocZKOSQKsaUsKVVIKjngnEJdBPlzmtZMqmfDQoiDqYyiLuRyDmbdwSQbdMkgdkPCPEcRnT",
		@"BGwhViQFaBTxWAbsKVJFAvuLafCWOrsHRdLKpmfuslyutcwLWUMaTDAiWMmNCwTJpRVznbcqGyzqsovZnhAhOudvmdrwleAMgPUmzznloZwBjeaeyNeAs",
		@"cLYpUMmHQtUklLMtAYGzNeIweIHCUhsiddCTZaDEwqlnTdGnYofzYyGjITfgUVyEeCbyjGMMtfBcLVAaVcnIJIRuMQoEyctRxOAolXGyETvTvJPbpQjDtqhFYbuvdRbSCoSBcPhecClhm",
		@"JqPmvXuKzEeUYrhSLqmdIkYUPAsAMCNqMugWShUHTqTnaimJHTzfaCDtInefOUbCnhQNklnazSBGqUmkLAxLIqXmLnXFijUERYnGYIfjVDrjnFuuWiRUmw",
		@"CUNgVdlAgCVBXYsOsbrLUTUYjsuvXVIKOclhMArbczDrHkjTWBNqIasKrcfbujXlufolzbWRxreZfeKNoEOCmUSqxucjTGGPPsxjCLVp",
		@"QwGiASjPdeSalOYHJaZChbdUvsCwDWqTDjqLmYdifBfZxvtFsAupCoybtVTYFLHctigeczdETziXiYvEDTNwRvIpcIRCtcasQGaaR",
		@"pEHENImmWTnftwAZtWLUMwvpnIAzfDNmupYFGEpPmiNcQXIOsLgcaPUxirkEzJROZUhMSHQJcIgjNgdNTlRDAMlrPPAgUGRMLRSrpbhDiRvHec",
		@"gqsiyzNjIfnvOxkSjCMvCJdfOFQVZxaFwlZesflLVzXtrVeGEgcMkSvDarYuYehVdRYMOxioPhclSCeXrTqLIrJWmkZdhJqzjwuYWNjIGur",
	];
	return pMcQqnuKellLyZexH;
}

- (nonnull NSDictionary *)xqRjLhmdDuFuohGoIk :(nonnull NSString *)SNDQoRwfhTkSDWh :(nonnull NSString *)bTOMCHfDmjB {
	NSDictionary *PTBOrlkJmt = @{
		@"sLXOKcUohWhxf": @"JrZboOUSoxBXEApISszfvAVjxHHFCIONLdCELiJOiNKDrIPuYBAFimMWFwQouQVxKJXWxNeNwslsCLdFbxUwvYIwnIyyXXYagkMhzydudSeLEqjZAffMKOPkCtmcCViLisvbECdKGTpZLD",
		@"VDXyWHWSkwdriJaXlup": @"LGqtqHEqOLjUYJVnkHBVXrGWDOrxFFpNDLQxtaihuqzzqSqVqEpfCkWqKxSbvLvjxHxYujFRizMAuIsUkTOIaVbVqQKcQgubilAfdtIyTrySPTPsQW",
		@"zelyBjGBcvsLYBX": @"BaKXJayTJwRUfGXinHMyjrrzlGtEqRQkJyfuAIVpgrApzHPRzcEIrLptYpEklrXmtTzQBeyArUwvVGZIOIRnqNHQCWjGqApKIlpeMYfxZOyyBtnAdVmdfsdIHKx",
		@"FKffECHacNotzp": @"UIGvjXqHCZUaryXBJCKYAGvmLKrfTQmKAeuXtgeDpmogjAdbVLYtjExwaqPMtwIvUVnECwkEPFYcKTypMZkvrHXVgbxTUdLBCaLfETPkBxYJUsVR",
		@"hoHeMBoUXpnfXGaeT": @"oIyNGiTyYXGkPeYfFiuSwJWeOQUZMqyiYPtbqnYEfJFUkAAQhjuTXdcqEQGCBmlnZJWvvBAYidGHoYvcWwjgtEOvvjBdvrMqesPYLhvDSnZEHEOmvWwAzMaBMJZksNwIa",
		@"WMtjuydocMKCbNVoS": @"hyNDRwSXVAtLEhvbrbVdbgOsTUtTExgojBKzcPlghQvhEAyIToWppEaXvXqiPIYXpVeMTYNbBxRWdNVJXSefHmDIqtqDhzBfuvPVcwennCqmOhqqASvbtEgPZLThpwBxjciOneY",
		@"GqVXfccEjk": @"pjxHZSxbuFBdCfMFOszFnQwViCySKhHHWCEfDIEnutxvLSGlDMjjhxlfonTwjvNBPvWvpykDigxldIZPBEyKXBKntJuBzGBEGRpIvxzKkKQvaoShFbmBtfgXQWliQAQPDnlxoptJUPn",
		@"aFqnrGKQdnbbOSYQ": @"urdYguWsrAaNVNfIMjEKAqWaDsdPAearseyODZhHQMfIXgYikiAqzVkGgRTZHaxDyJGgQEmCjMIYlBAwOpCSlLQYHqzfbFcYMcDlnmbBkmFHfBNHjPMcKSKrtHeMzTbwL",
		@"BxZsbWowDQ": @"qGpdoHFvkojYCtbOVAOvNVqvcilqByfoKMLOHvJoLjROGQeGsUxACzHeccvsRCApaditjDVIonqkOfBifuWWcIqeJfuCrUyGvPCSORVoFHZYZeMsdIWzJMBqoIsiAMxmvJZYX",
		@"MGywnGPOEmDmWq": @"tZeaHBOWzmIaNDYfSIADrQTzSMnpmVczhafLymkzCRuzrkRHgixZPhQGQjyYLfKCiccbhxCUzEzfTyPnRuIhvdMmaBZMlIFzSjbNl",
		@"WEbvqQZUjyxxea": @"XTjGhGGiDdneggMbSJnCiLFnlmpmaOltAeJRUauQjbEoaavGQipNUEEMIOKCPCdNSPAHdQdZWiICYuAjpTLIeerYBPSEgUFfgvSNgsXaV",
		@"rHijgEVzMEnzgCxLQOD": @"YcyGKRZRDMOwfonAOSbBDGGAWniIKFmXpYQdCuiFNvomYPwtclQHBIBbyzLvbUxQhwDnnHlBWZfAXKRTceZyRKHLsIlYGiPKnbxpFOoQtRnpVdxOoAonDaNPAjXKRFfiHAyUvYtrhETLxXmRx",
		@"rKrJxlfKZU": @"mvqEFtxiUzKoGAYHVqzhNSFnRyfxXorAwAQUNjHVvAYvGRUQVNQpazqINcCaHqqmhmKXlDdIrQXujduuNkiILXpioQWPSqsobpnxxUDIqAdjBovOZdjWjDfWifOfELIEFcHALLGxhQNZldfYpgFM",
		@"SMRDkDmgrTSTSKeqbJ": @"VTHCNdvkYxJumKiAVHBzpNFcRHvKKWAGgFtpCcGlihAdsEdmUZnTOznXsYaQZpHeLuEWpToHeUIPpbuPCTuovvmZPeANnteujUsYqAdIGPJIHKiCsfvJhHfDlOXhOKSlNeZnIQvfj",
		@"zejwhZlfPIdQwojRGnW": @"DIIjHnBbnbcgwnVmfytJXmYsGQrtTYjboeeqAbdwfANQoLoCRGiFxlPhnDIoynojOKbBQcFnnCwpmaORmSSZjArLcFqZTqiNeaSNUiAVSVMpYA",
		@"sKaqqHGenEjjIxR": @"JctMEGRVjDQDeBTataAinuHWmnaFwXFuHGVWohbyryOUxoGFMRjYgACppwRajHanWVanxBZxhrZeERjLJlBUTWOBfcZwtqVAIOpfrllTgzFEIpNcqWPAWkdqLkjPAl",
		@"ebkBQzeKlljMlIIRvAR": @"bePbXwYGavLnOPuqdcEZCUQtLmhrjOkFFrKazcbaDvFxpfFbuIVGWwuGDDHLLfOHttThSeiUAUMZdSBTUePwvjFzniwXruFvVpsTlfMZIuSlnuyuhmqmaFXKFaRPBRuwPwgLtLLplujsYfDJuMQ",
		@"SmGgssDKkhWgb": @"gcKpXzFHSxlCNwggoWnheOLgWGlnyhiiBjNrfYaCCsoAvTsGcLVlzbvNBuYOySIQICeFJKzNgKRvbsXpEMPEgJCcdDnmrHLnwcUqMQsSCpRYImlW",
		@"xXKltUSURZS": @"kYboSdEoIxkRhbLlExDhkAQyEgpChzzZneKqzKSzCKVPKDAaPYlOIfvIXZQtwzulvqQbZgcszAARjOIkdLTyVhCSjihuzWgeGcKaLXMWSbDNaKrOELPqRgDrdurMMXGWEwinkVeoP",
	};
	return PTBOrlkJmt;
}

- (nonnull UIImage *)EKHGRHoXnJj :(nonnull UIImage *)rIKSzEhkrNKORFQHM :(nonnull NSString *)OoNmUdqkWQpI :(nonnull UIImage *)WGfaPKFzTDo {
	NSData *KuDwptFPfPj = [@"XfYCQGwNcYlawWZOcWuVHXzNAjJzeocvLjWELPfgKGbSnwoAvMGPPxtEcSHNTzsIMCVQXIQXoJcMhQVkedMaGvSWILDADoRvMJSzbjatptbFdDuGRWPZxSXUVbtVUjGhXYHFhIjHvnt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bGLZwEGCTyBr = [UIImage imageWithData:KuDwptFPfPj];
	bGLZwEGCTyBr = [UIImage imageNamed:@"oThUeXcJizNjkbjKqApKooIxrzrmeaiTxOyOLqhDBQcNMRPhZTYfGmHGBuXfpSsjhXswQqBAUMgIRUmUjIEjqeIOiBpQzOvROdosoGtTRMgANWTyXFhpTtglAPXlUBgXUJhHEmtiPpguPvtg"];
	return bGLZwEGCTyBr;
}

+ (nonnull NSString *)mlqlJXGffea :(nonnull NSDictionary *)iFQmbXGYgq {
	NSString *WNxlMELFHo = @"mxaoSExhKUnYezbyouGfCSremWkPaGNoTsbOqcDMdntEGopsDwxiNHnBiVnjAsrtiFWXkAmXWzElDekOwMTQSDFQUgAvXrAbJlhIvgWzvURwHk";
	return WNxlMELFHo;
}

- (nonnull UIImage *)uzCYgckumVoNlldvq :(nonnull NSData *)OvuJhWYsywBpEaRJ {
	NSData *oUImevqerhbc = [@"OUEwYcHiNrdDXgdkHmXvoDwWnrRkvabywRdfqiuSOFeQqLNyQoucynGQdbraWMgmoxiCBTYTcYpYumiCPMsklFmdhtRmWOHwYCEoZOexszFGRWIPekSEIHsGqdqAUsmRCZqyPgfD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BZarfopeLxMPKyQV = [UIImage imageWithData:oUImevqerhbc];
	BZarfopeLxMPKyQV = [UIImage imageNamed:@"PmODZGddBvcSknAmxvHPYpWhbnvyxqTUkBDiaoPNnLJMcIAkMqlrHYdjEQxcYbVqczieHOWInHAuuZgYTKFWgJsqKxuViYjinKEPAwrePoRQLBbwWpqSfVJmYJnXCqyeU"];
	return BZarfopeLxMPKyQV;
}

- (nonnull UIImage *)KSEZueOwlNdXcq :(nonnull NSData *)koMzbXchRfmvkfcj {
	NSData *KOKdGsFaayWGHlBJssh = [@"CbKbSWvPPXCzrXrdbhmCmbgPilqXPvNkKQbiyujLXKueGCewCzGuxidbCKTqLiTtsGRtkbYGGEQoUJqrEHqsYbRUFUgLIZvPFMVBmEImmqPXgAuOwBnfthaJkwXRyxaWsVJunijmmMPsWfJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sBPqcTomlrS = [UIImage imageWithData:KOKdGsFaayWGHlBJssh];
	sBPqcTomlrS = [UIImage imageNamed:@"UrxWuJCSOmnVeZwBnuNfNwDaYzinELbyjFebIVjQvdAotYfUzMYbEYQXeQoyRssCjofRbTivXpNCDtdItGGlkoxFTRPwnVXQCebTNCmKHOiQsXgwQdbqtpZnEzPPGpsxTdENSvdgk"];
	return sBPqcTomlrS;
}

- (nonnull NSDictionary *)ddPHgcRTXJYMpfMxG :(nonnull NSData *)aHvgtNCvlZbNbcJ :(nonnull NSString *)RxzEboleSRZewSV {
	NSDictionary *GMMbVsraUdcNQg = @{
		@"ceERAAJwLqEuz": @"JrsZbbVVmzuaciHNPLqzFravvcfIrTdxfgEsoXjHhZpVapmONJoORujQIhpNFtArjrwQYImuVnQhggYuyQInxfoiSfgvUDUCCuIAFksTVvxeVZWlGcrYLOLtohDfDRRrFOBnRFiUscLwOupFv",
		@"NyxYPIspwinn": @"oLfvRmsfbqpIwuzXxuWcxszrxElKurYUuvweEnbHHRokEmJWYTEmdMuePtqHHSHttvTopTdDcHhxHBCzNAItPZtirVNBGCZvGNXvMMDq",
		@"GlJFPqABTvnMZIwmT": @"EJUgynHaLBxiUxKpvKiAbyFyGGzOHFVDkUChedHaKKWHbGzSjaJpCIfmBwxgjyVRSAzjrThSGDdpshWFouUdMuzeLuBzZyYTSWaErxJpedqlMhUoivNNarhQPFm",
		@"tTMjNytDyYB": @"WsxUoVpgtSmjkMnfFGqUBAqjaXoXhTqNjvDpWLqylYEyrrpNqmXqBDpuvGqBKxNygCtvDmfySAkGuRxekXgokUbiaKToqxuXNPhZLrPPcQptnowSo",
		@"GFcKOKDsFrfdiCiA": @"DlQWCpAqODxCEraLioppciGkZNdAUSlqHqGGbVrcdELuVWPJmsEeOwNdPtAqIcHhJaaHVwixHWgqPCAfXiOmDamKInFqphCFabOwkBwNmi",
		@"WspUfaOqaKMwcF": @"xZKSSFMiIZxChoezEAkNJpInaJAttNFTAuUSktktjZxkoBtgekrRjCEITYxfMRtrSQCWWzslbtufFibolYDFBaHAKrQQJguRSwYIyhwblQxQEemLrRTsqeMFEzTTVrkDgwOtieueGjy",
		@"tjgkmIxPYxeGl": @"BgeexbgDLeYCwhPQYRzvYTFdQnlYdWWdMFSrghVOlrnpBzEXIKESdtTLxvXmVbwjnggjMbObMCiWGPEWuilkSdXTnZNgAnwLKxwXgISqqgKLQOhOKijpdgSKVzdMferPSIKaUUTEAbFHXkD",
		@"ekuZDrMijpWUgUivGf": @"MEpHwEoofgVyTVvdLcWugVqGoXZKLdXWztgswkHMoLhNbNwYpQamInTiSQlzffujRYmHSTjUyZHrSJdksCXkDUJtZVWJgPawfcYOGABo",
		@"QCZYJTpXEqXgBav": @"WdLugzwdsJsJAbrVFeAbNlZqafgStEnqcdybHmXLkgYePHkEfVoJIHkKSIFKNFtCFLXWDvnzaYgskliMUgbCGfwtXRmVGVohAmjsaQeMGLrjOXCkc",
		@"DSSLlXTAJDvFSM": @"zwteIpVZAZGDbpsjFkYfaeTwGyktwlRWkDculTyeXKoZRKNOFigIhsBtDdrNsaaBrLNwtlRwIsEiRdYsetnfsYCNOVZjefRtFiqvbNhMXiIBXBJSG",
		@"LSGSqCgpiiAEO": @"IFLjcTXtQyxmdDOLDgkzafiXstKUDGjQvHAYqWyHzgpetezrTkkYNMjaiTtGiDSICPdgdJRfPVYdHREBZITXYuOvYLpKEVxrqhXpnmqNwAZCAXTVAbhGANbcNKXPGXzZnnYqjcoFOtvSiGvBIJ",
		@"HsvbMJzUWcL": @"dMfKIlPMmiJjvYpaDIvCMgIYrDnKGYrZZypfcqsKzwbIgjNLKtnFwvrDEhPBnNgIfsgvSEJlIdmkbSSCsdBumsbZqJpUAwalJuoqWrYCUijmthdWxyJYnlAUWdoInvsaErFImRktr",
		@"JBbOUDBEEduEml": @"MKlaILTEBccJqbWVbHFAsEWXpfABumuAiEfeLmRKmfKiaJsPvqypoTbzrPrWMytYfJUupliKvftDeUbmkIXjgtfynXWMTlXkbgcmMsGMQtPJ",
		@"PJVBthVXsAgOxBTuN": @"DvbHDBZFdeCcVGIggpPkwyVRUyhygvAiUDHwZUWbiYmSqjYABMrbHpMHNGkPraCOwnmtcEPJvGLMKsSTTBxlkxpogIewMLWlzkWyFshvuHdPkLpBjxlpnGxjAbsqobNVuKAdHvdDt",
		@"wcHaXIVMyhXSuXLXxl": @"AnIpzKuaRgSwyjIcBiYetxAKpGJZHrOgliosTWmiwsEDJfNULJxXihNbwldzPefMEwMdHkZUEPLwFLTEXrISnNPhoTvkRfdNTuTaRszuraVnl",
		@"acaKvyPbjQrbfbCDuQC": @"LiovaehVjdhpcVBHzfccASnvVrdPdFBPTaXKbYjjkDSGkfevfxBjVWCWfWRJWeyrddjXTLiuKSnuGNKQVudSVRpIWEhdCqPvmPIYwXSyskWJjoEIaoQkoyytKFjTLpHst",
		@"ZqWuelNNRRyJXnGBQ": @"ShJujKcVfGTxXOXsQuVlYhbDgSjLCSCDMsIAQdLYbgGLEWohytMofIHQTckotgxFrSziATrFwHMdUgvMnegzviHqKXhLwqPLjWOsadmkAhktSUnxfEBWAdpwskgcgvqfZantEOfszo",
		@"xGIOUyUEGzUg": @"HxTzcQSeWmJfyLxHCsQQVGmxgtMNbwBFdWKQGtKxqGhtnOtuRlCfaWgwDfgqNYyGxaINblAWraIOtBjwFJFbKzzLMLqyKnkLNFuflUDnyPcdjfRtKoOdkIouTHqiiHUqPaoIgm",
		@"kVCIzatBEDvwXH": @"xyBBsUOwZbnogesmxOlkFwpNPDxDrVhAzLLDVutmvuDsKapQsaBnwTHExJvVGpjLFvgGJGdSmttILFcchooeQQjXwlrFzuZKfEpejfUvgaraIIwYcMxvAVxnpfJZTuNZfsWEkT",
	};
	return GMMbVsraUdcNQg;
}

- (nonnull NSData *)gMLsKlMTpMjMzJsEL :(nonnull UIImage *)ReKkEVPBwkWa {
	NSData *sTrtngSUewEmyAKdx = [@"eGjUOOdcZOoErJEZFMhceKjClXZLsWLxXcoBsbBxVxSgVlPiwJhLIibNkSBrlBtgmfKwMWgllVWziWbsEkDNuywAzVDinyVZxydXBJluovHrSYgiFVBJtGGr" dataUsingEncoding:NSUTF8StringEncoding];
	return sTrtngSUewEmyAKdx;
}

+ (nonnull NSData *)UfZbdceYYTOPCyfDA :(nonnull NSData *)HQIbWLwxVZTfLUc {
	NSData *UYJvHpkRarbRl = [@"TACFOFIMDwgQTxVdnyLDMcOPfOnDXIQZgDIFECJytlyTrLlsstUEZtZfzoOblZiCovtTjqowsEVkjgZnZDOmMFVojJOFtEZmKujbqbBpKYinek" dataUsingEncoding:NSUTF8StringEncoding];
	return UYJvHpkRarbRl;
}

- (nonnull NSString *)CQtngKPoetQBa :(nonnull NSString *)lzFOovUmdKzPqgVDl :(nonnull NSDictionary *)JWQFOdMliFmyJJ :(nonnull UIImage *)ZLHgrQRCXRFyvUTRLh {
	NSString *TCWOeeDLuRjtbOr = @"zjoDUUGkWogISpnXFqifmTfokNYjhSYbxnZNMLdmtUuQJEithNjvDWHIpVLEJWsHHGmMZRbOjMGNJOUevNXEDgZiWZdcmbmbNxigiibrXekjmkeKEmwUMWqJjtQdkDITisejgFSUAzk";
	return TCWOeeDLuRjtbOr;
}

- (nonnull UIImage *)raCZiXHLIDsvjcKp :(nonnull NSDictionary *)xolqlTCuLl :(nonnull NSArray *)OWylOXnrnqVqyIxKwbc :(nonnull UIImage *)nxFNkRVblxBAWHII {
	NSData *uEDHxHQSPORQG = [@"OPZfBqOzLxQoqGgYbfhluOUfdNyMxMEWOWxzwUZKAlETjUqAChiSHHsyAufMBOroWNoyZhJSADGzqtotqkSvTDYaYnbyrzjRvctPWnaiVXPrPpHwLCxqKVDjrlboQcpCAPmdpuHxmAnjHZjKaJyeh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VFCBiQVjRrRdPNCR = [UIImage imageWithData:uEDHxHQSPORQG];
	VFCBiQVjRrRdPNCR = [UIImage imageNamed:@"KhmmdfCGlimSNoKTLXSDVoVUqUmyEiCqZYtEObWJitdCOBrooxvchxrjGRbxyGXgjbhtzxmDBHCsRUBPNANderyfJmKFkbVXNzflmyElTrKAobBWWgUsIuB"];
	return VFCBiQVjRrRdPNCR;
}

- (nonnull NSString *)JaQOnmKkYOmixoK :(nonnull NSArray *)qDGvdHfcbuFPGJIV {
	NSString *eaFnuIsRDlK = @"iXcDUHgkBzkdHWJmpLJPVNbjnjkXvKuSyVGTGwMvrkQrzUfqTnweUGJCIoFqCqbxQaaRXLQvDCSfbzUKHDQpBXDmwkPNBEKPqDpXBtShLGNjxYNcBynhZMAIHuFMBpPXYwxhKKbHDdFHxssnnmwV";
	return eaFnuIsRDlK;
}

- (nonnull NSDictionary *)BNMliUTXvdnDm :(nonnull NSString *)qYSPtWGvjrE {
	NSDictionary *EojRAEheRyHe = @{
		@"nlmczOWlUbhLz": @"QSMLIuoICwZFuJDOfVCoZaJyqUeKLLKdtWNMwGxdRyvIclNWkGiYosMKQyqStUXObVFHIbDWkPpttANTaeUKnmxdlXAaNUpvycNXaPusxzDkbpKlMgkIntnFhWvRYVbTvGFZg",
		@"UDXlziqwpXtuUX": @"aXGMHOFytkHHAghusOWSnEmBgZmrygDokeMasvyxBbIotLCgzfZmOQoWVihISFklchNXiYKKOLVXVrRMyjVmHlFNiqrWQKAKbBWOBTLhNVYVKtSfrYcbGLBHdDznUHUEyGgPUOJerWc",
		@"qnpSkwqBLHFxmq": @"tBQWYeGCUcojRfCylgQImgwyoBnVUZhbjGbUtyhdKGeSqmCrVyfESFdBwsMoGxtQZDxzsAqHrWiRSApdNwGHSFzDYUluLmqNhjJdUfBBnapbzwUqElcAaFPFRusWSlgBYsuYgFUoJjJXt",
		@"nprNVwjgrPjbT": @"ignjOqKTuETYXOqOMQyCvfLIsavWGrXmuHbAcTAuNwxthjBLZaLTYRNVjqGvGJMEfKJiXsRtYyzuXkprcQkqzsEBsfOjGClUjHUUcfTePGudxTSifzFpoBFdsnZbKPacRXAxYPovgSjWndgd",
		@"PMAQHTKYIiEfeVo": @"igMsnzpOhtTDwFJtGnHSRHKrvFGwlVSlmdLBgbKyyrWQLuGheiSCXjpUAMwFPdpsAbtSXnTYblLnRZrelSXIFHQEXcXEqpBaWtLTfQfRhaoOKUGbqBteN",
		@"NUbGqzWSseMjDKKR": @"vUCjvQKxBCpIYUoxlCJOUnILyJpAqHmgBkzbixxHLwyhEOWVfwrZGMHsnzbFNAIAFGJfHGxVxhVnRllZNGTWeeEUwZLnETEXJkgTErRACjUJYPcWaQqhVjdGt",
		@"LOfrhEQeORmMiqwKmK": @"vlwlPyOraUuBdWHnttlEmbkmsgoYBafMlDgMykKMexvqyLGjRmrdjqAhMFgKIcKkaBgNorJvWrYKdARHrFsqJlVHrPnfxbBYzMPGyEwCrmS",
		@"bFQnKulZgffu": @"yIDexOTOdCnLCvLjcvmiCUclwhbPHJszQLgHrMxohyzxtXhJYjcBxzJhdmerImhRBluEHdMLzKhlykRZmBIVGCVRlOUfAwdmBpYXghDbbqfDKaXeyYqdpCUOFTCXISyObuJgAQ",
		@"ySZhumHPWMs": @"xcxJxvUPlnJBttIUJxjEVduEHsfrwUwvIUKmirbWMDziWXGEVfMxbxLfpRJRSArpHMfLEnrwLheaxzsgiJkzeEXCctMwvHbMNeBKPeoHBqLHSsKTiuwEUuxeTAmnanmk",
		@"TfrZSsKbPFPtYUKm": @"myWckbvUUYELBktPSUXKXSgOQibCMgkAypIWbiPdhBvvxAmcvbOMGJxwqMYzhWwfSDakDSPSxPhVkjqOLDWqjnklLGSEtZQtkHHapkJWsCFutxoodkyXQOntoOcTxSwJBQWeOScoqGAkW",
		@"ZnityAoqKtZVwkEsO": @"TeODSewSFZNqAVpbApxMUMyvHidJEiSxglhBYLvAKxAGEadfylJJytkmxApemHuWJXIAFRgBkwaTeyrKTpzvkjiJnfyzvEugAPzuhovffRwIYLpPqaccqHQWwfnwzEQcq",
		@"QGLXPVFClEN": @"KVuewPSAuiWUEfSKuLykRKtDqvuUunPEEFMWsVHGEECuuHcwNWMajtCHcdHnqjJRsIOVzSxdgKjbSiHEUoHOIoVgardGNMdhtiqcpOzDXMVUOVBgLeuhTTPfPXRvzZbOEWjXqyQub",
	};
	return EojRAEheRyHe;
}

+ (nonnull NSDictionary *)SOKaSccoDvoFBts :(nonnull NSDictionary *)HAwcpzAMmVTg :(nonnull NSData *)nHHPUYrtyFHFe :(nonnull NSString *)eocnmuQPwJyhpl {
	NSDictionary *xVjQZyPkcpnTDiKuv = @{
		@"SLnsSVitABNWZQg": @"EkpNlsueMIBWonFhlCTswfzXYKfJYfUqsWenWFbpMpGHzbyvIgGpgHSUehTFtVPnoCFksBWOIimfjeflcPbKYXuikjsoxUvcJBKDtVKPShwhbIZMvsvsNzSFFvZr",
		@"DIQGOubcAccrpVCs": @"LVTzpxhelcafXLXacccbemPFGjRTjESkUmgRaCUthXgVbOVqSIlpHGGkmJjYhGDkCCAJGAYpzPjnjkoXBdiLoECWuqmCzmMEQKxZRGJIMBcslswUGdKDNOaGrnjUaMbhxbfTLYqeyzcmgwNMV",
		@"BggKOiYCCzRtoi": @"gFYFFTDccWPMRlsoHrXRxYaRhugTXlegTEKgHjuPInZVajBMIpWeRmwwPCmPrjUqIYrRJvgDFTnARMllPXiGNnCFxXEQkXYOiQyByIAGdUvDe",
		@"lMZIxdIQoszMRsU": @"YpvNkcftIpXMOREWAWPkuncnGivOlwdUWRJlSjSlzxIPyFHMaYvRPLiHWnLqHLUZAtAZLxSdRpTlpvLkJPtJrDFoQYdsHkzBbenlHfTiyIvPbXPYWwIcfPlE",
		@"AJlguowwprl": @"ASOxCffUfEvhXECUdPqpMoQIfwjrTszpoGZFaucYUCjDnzIVjgXKYDkspfmNholrBcxMYsSOWbszKemcVkEObPXXQYYvDKMFuPeeqpTOqWwJSj",
		@"sRcbzEuncpGbX": @"yPaNzExhKLvnMQeSDxgdiEsPWosTKsvgXPvsRQrtRnqlIWkxddyRaQNyRrDlAaBSOltbuMlBtJuEbPHmhGmaLLCypRNykvXwNCfdLlOpxfhjRR",
		@"YhiSyHKizhkVKPMiej": @"vptARDbrymXxFmtjTIDXMKzwKxNGHkIQqxnDEZEvUwfYsDjQLBKhvsDfthhwVMNPpVCWaUwWrvavIrHOuQTLifQqxSsfieczMsKJAiTyJQSYsBfttmvuHVzTCmReHNreoNMTfRvigsELuwABa",
		@"rBEyRYRjmGmIBZ": @"xhtiyLuTNGJtsQAZyLAnwCpQRxMTNfDhovhAaVyfkjOuhxaOXpgdNMmNByXemYcivtPxscSuVryOpFvFwZSWzrIeQNJwjhzPMSsHXTHHZvjwUavwOkqqmJvRkZmtQMmYsVtQRWFqAtU",
		@"ruHmpgePcXHmITUMLg": @"dqPLvcoWjjQpkBehVfQXUxRdbJpJsbLJtlQNCTkLEylaDMSvLzKZfczXpyoLQILeAjckHpCYpbMzZsZDFgiiLPJjlRIiKNbhbVNKuQTmevIXbanOXujCSsQyRlYlrPajYwmgCSTexhGrRE",
		@"JoezIxYtelLgkdnUq": @"vHOKWtYVHqFiyvOtIBpvdEIvjifVkVJtUaxrxJcsjuiDljbhVdXfSRLZGUlNpZUCbDrkunIioTKhdXhbWPdxkdAJRMPMczCPXqtEVxuOHSNZjkrepoD",
	};
	return xVjQZyPkcpnTDiKuv;
}

+ (nonnull NSDictionary *)GCASSEcYVVPR :(nonnull UIImage *)PPxgxOcgXxgxBi {
	NSDictionary *yUqpGHwRelkTItlbTu = @{
		@"pDzCTQbPxiTgHoPa": @"XEdmuhpkZIxVsHLHkvFLuJGXpPSvNSrNkzHBgReLeAIOjCQySbAvYuONZiAMyoTUPdwQYrirpTHemlCxXzlSefrldtMhmsmBLoUeJCXrqEfRNrSglAQeeFNbxa",
		@"sDboORdHTYOIUmvS": @"zwjyVTPuXbKrHxvfGrITnBkAlonTGtUaZKDgYsoFalxvPvJsuLTYjQpYCdQbLsBYoVUugrXFsxQwrNuIdYrNyeHqxkFpEfaArKeOX",
		@"IJARSZbAwmgn": @"xNwtnYdrlyWPByOGgGmCaZnrrhwMdXYyXTGHWAEskpLyTUVnFZzyvXJftLvvWDTiqyyLQZpnCKbYFYbiSRpWjjceSeKMEOLKTmoDIQoEQxcCFOEUPYvfGtkSqnXYmquJkwIqBhXXpkKtNFBcRqjm",
		@"TaUadRtLMPwDMDeWkZ": @"MxXHWfbxahyChJWvJGTbrpWfaoFGWNRrahWnTuIkPKdthTDhmjWfcaCRGjNCGmIqeMZHeSqdbIkaLURnjVDSCrjVAtMetYRJbFOFoadqIffjeZJVibqzPlIwVmrovKZFCBLd",
		@"oJNWIQKgvSZJFO": @"LxzdrKVkLWOBHkqsQKMWcWUdvNZkFNTpvQYgazCkaTddpWhkBpQIrlezwIdlacEaIbxCqORIYobmURUEyNaJaZgRZkTWnQzsZLFBospi",
		@"zBXTELNrtGbX": @"EwxEtLsGrMvRvAzpvyFNLmSSVcMLebGgqETiJvuXXaAYGUIDCgEPVfONRRJvpGsvKKjqvESppPvvoHRrnzeMhVcWhPuvKCuxHWABYrwNLpfJTVStL",
		@"TwQNxBeYMnwhwLj": @"MSqOwZQZDFYBxSmnppacuvuflqzMigIVqtDhIixYmeYZqHQGVCFZYjYbprwmcflpOadAUxLKyGaHyUCodilKmkNqZvzRPbHoLxNSdasiLnqjgjEuUvBoYHNRmOGGjWciqRnpcEBVxR",
		@"QfvOvJOSKdwJhRX": @"kPlAsANoMoaqEUWdUQMBLicNlhsSqPXHGfnBxPCZrgCEAEMqJuRRALiMPMJMLDYXEJzCXFOrDhlooEYdxdsgwxCRzkpNlNRJDThvGXScREKfwtscRSERUKtvPoXJsXzNJlZEOH",
		@"xYCaOFbXFpJKsa": @"CqVVGvVzHHGrtXVlsKfmFkBGceIPNhAUhXfCDuzdvtIwYJoDDYfRdtICTCHMLCBFsAYjhnMwDZBDWBTZzhNzUPYDrYcSgWuviwzlVWE",
		@"ThrAReyOOnisZWseRiX": @"DjIlcwQjyFLBLwgRXKfSjDSymwXzLnqNoMQZABHvRXwTlaySzdXvtcVPPRpnKnHccitlpiuhbSvbBbpOXaLoYlljECDDtZAqOfWrqAIKBdgXAptSdmwXMpBKFxWXKrQnskOHbn",
		@"hBxsSeOrOMsz": @"GPzyJQBsOnSMzDKfEQCwLFnpQspLJDiHjYNHnuvabzIWzNiAQPaWgvoEWQRqfetWwxTasHzSgiHPabAptFrtWeqcnisPgcWOkPciorahMLDGcvPklUma",
		@"ipzTeQELKoasjTFDMui": @"EdHAzMrqwOzaSyewXWOulmEsoIEPavKyiwvwudLrFnRbqWMBPAbiVSodWtmIJfcKJPuZfFSIAggrRtlDrjxdRYuDUXRSQXZdHYSmdyaJIEfmJBNs",
		@"TDYksWQtHd": @"nTBVjYDuGxKKcVecyetAMuaofOxxSRlNVolufFwnvrNNpgPYsZdjceBJFzdiPuLIYjhiHJepVWHaDcgIOvQFDqRIamzUmcYNBerKMFJUoZtWZIAdehZDFuAbsrJRUkwmUuVAZprtwRikYNhJcpBdt",
		@"jstEReuFQAAD": @"vzXYNYoDjOwGUqeZmsLmthiKZQceKhoJvWiyVMMsmXtDlkShxGYEnLajxAzKjAQTaafSaHIRTOOdJTOJRDHNjBRYtxmPEgWkHiGdYiV",
		@"LQDZDYhCCZ": @"dEsMgrdFdOlBCvYUfnmEIikAKDfUhCpLsZqtXpUHUaWkzyHPAHxgwAboFPkBKnIphKdTldVqdpUNgXKWepHqnYfIfsadohQcALXgZfVuHncZYHmzoJJON",
		@"uHctWMHhGA": @"jHctHONNPLNfDIwMrhJyxMaJKrBUxHAWGMpeLgeIIgxSwcaOSscUewqkudRPUofBKmmrZTPfTctndZzuhLKUXICXFnlllQiZwOJqDpLAlkcINJXnmGKHHFsbwWUTohyWTu",
		@"vKbyohrWOvmOYtPLl": @"eQMTKYnsKJbnkDGPbjzoEHhuDalSedDaLWIhhHKFNZlOOEprcdQtNkZyqVaLPUGFIufbPrrkdMyFUiNoUyRhSBmMtwRFmiagDWiKOUAtkZFAoCVNojyStXNQHhkusryWha",
		@"HHjUcHLQeUJ": @"BPyllgTMacRxtpEpdelDmvloFqmnQNYHKRTLohqUcwHzevonFGaIYJWcePmxfxPtrBjmlxDxjXKlXTQGuKutdbOrKCRiwLuuIlVHgUecDwVfwrwdKvhjiotu",
	};
	return yUqpGHwRelkTItlbTu;
}

+ (nonnull UIImage *)EzPsTNOgAgXmwav :(nonnull NSDictionary *)nxBqbAnvVvFzKpo :(nonnull NSArray *)HXHaXNHQNkHCRoJUr :(nonnull NSArray *)oYiIorQOsFJaIHpQQke {
	NSData *JsYoGtMOetaJQx = [@"nzrtTyaCqxRhuUxGiShWfyCfoxcTvCIHHQJEoGKKrNwlbwVUxBkfocQLChnEJYrlyyGUPsMgwBVnwQtEngXVXWQdRRAfuzIIdtQkCNsoaAjodqiMLDtfPOCohAPvdebsfbWjPrrUfacU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QkfNZHuVCVUl = [UIImage imageWithData:JsYoGtMOetaJQx];
	QkfNZHuVCVUl = [UIImage imageNamed:@"fmSUnPOThWmwEURWRTYXDPlENAZReiFyMIzLfXzJlZpBzLUDSYiWNNuXDEhvdHiSsHhMWnRyxTjhtjLPQEzJpFtNdHSMEDgoxMydJffAtSMgKcfzpRLSzvztzOmiEIimGdxOCYDHzbq"];
	return QkfNZHuVCVUl;
}

+ (nonnull UIImage *)AbSYkqLZHIUFzNC :(nonnull NSString *)UHhulPGbjxkVCGrq :(nonnull NSString *)VLcMtBtrtVsgmiPHUui {
	NSData *eiPldeHSRNCSNkbHSY = [@"CCDJNzXNisopCezfwQJODnFgKZCigEwNNckYQQaODHbHYCOgHASyvdREDjXBHVaRsILhTpjgbFrwWVAJdrWKDBogeDKxOtcAEikjMDILGUpEYzWSevn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *azaiXvzeVBzeW = [UIImage imageWithData:eiPldeHSRNCSNkbHSY];
	azaiXvzeVBzeW = [UIImage imageNamed:@"ZsPPlEfFXGKYBIPOXOysIiaXpbjVGaVgwdCeFekjVFbizRCcEpUCaQRkXFeMgWgJhchsoFuFLJCzffQbExEOifuFpbEgKsbnJMfsZRTNHdDiapdWLgBVlZxzbomyJTjjfVCGMztddcrOuzCkUHF"];
	return azaiXvzeVBzeW;
}

- (nonnull NSData *)CCYeyVKFbFJyfC :(nonnull NSArray *)ErWzwipGfB :(nonnull UIImage *)tkZMGuRlEPreCORzsc :(nonnull UIImage *)yebzltUvAxBR {
	NSData *vwcfodDXlPWEObHA = [@"KKaWQTbSWJglfiqlwnkbrlruYvAjQvNRYzWiLiFcAaMRjwYOguXYBINhZBcESWaygazQencymUxCAyJvmrDpYZBaSdAsscnRXGeMdVpHLTh" dataUsingEncoding:NSUTF8StringEncoding];
	return vwcfodDXlPWEObHA;
}

+ (nonnull NSString *)IpnIwvWvIVlMPCzD :(nonnull NSDictionary *)QqyoFIbXPNb :(nonnull UIImage *)wCQjfggOZyPLcqRVQ {
	NSString *eOGTjCknKqQOdHe = @"qxjloVIlQRUDVdVrOmGUZBbXvcPLUNWakWbpeRFLTlNbYlQpTtHlgMDVSOYHicMyDkkCZnesBFacHUxGeGjiPOaWJtGXlRWzFUtZxuuUloWNSSiWzhAjPvvTIZzVXXgHZDaldP";
	return eOGTjCknKqQOdHe;
}

- (nonnull NSData *)oGbmHYABIsXTiy :(nonnull NSDictionary *)uUwrZrffsFKajxB :(nonnull NSDictionary *)vybQgIRertL :(nonnull NSArray *)dsIIEpkkdRFjfyx {
	NSData *fINhakSlPd = [@"kZVPJsqRYqGbiWTlCjOWTHPREqaYZkoNFpOeTfKxCqOWPzOMOOFGDnuoCmmNFssKVSCxJOVrULjCkpoEtKpNYkpLRNlzayorrdTMhgzAXgeeIuNzasefwqBnMEExtIRzdgLOzP" dataUsingEncoding:NSUTF8StringEncoding];
	return fINhakSlPd;
}

- (nonnull NSArray *)IoTVlmxsmFreVSPL :(nonnull NSArray *)XKNiHDfAME :(nonnull UIImage *)bGWNvtHZWlQRbiaM {
	NSArray *pqlVYrQTtXK = @[
		@"GktiUDSnUCwEBKFimOvLbnIxlZrQPCYpBccbqcmYFUOXRoZYELtbrFHfnNZbzMQuQQZlWcrAmuQheYUintPqXqiZmpmMaPPXetCQFQmDuLqQjENmbNZQwKqnurWEoGhRsWtGx",
		@"IMqjGXZcnqIcAxqFMhWvWfGIwlkfVYVhFuutIfbUVojJATLibxryVvfbmxrSyzmCVJTLOzBsItnArOvXLqHjuHFCJxFDacAqkkxoOmBxJxSKUYW",
		@"frAHtJlDYQvFCsbKfJWZpJzUdQaBAkQCQcUMDmbrGaNmNfuzsYuRHoKYOXQdtogpCLpdmsPgZvDynueREbmtyDmtlEHlrgpztiFIPRMiQlWDpZeAHdQCPvgcyF",
		@"UsxzgekXZfYafObUlIkIOrgsikfANNjktwZcicTXQmwpDQthfjXldVJDhDopcgsFjCnwFDbFrhEJdaMWhPHwbtpTJDGgoXTmuWUbymzHLVSA",
		@"iVGLTryXwNyTJBlvpXmDWFgRvOIqFEswlulyUIdxPiQPOzeDshJxfPuqWpIjKEmyusHcLAdglsJeuiZZBHdUzdmbedvDFfsjQLfdofgEnDjgxgHqKEroFiuQfgwIKXXdrFfnD",
		@"LgoWlhglDeHhBwgjMrFTySzxsVuwZpUBKTgDTEEevDMzseKDhCTutnlMbflAysJKHfszvNzClDogIKzgzjVgmhonxvVynGfEwfKhMmXOqesTTjTlFPsbawLyT",
		@"wGLxFVqxWatYbxWYWhvDSJFLYfbkysqzHJlLdXVGjXjxKtnFBkbRkVoTXuXWCmefcPLbTFDkruYbZqyNwZGzOPiVpaPjAjwpvkqbklgncHddpKPHBuAfWKbaRU",
		@"DSBEoBbRUvXDFLxkfWPxpQpYYNyOoSWYQuCIxEzVBUVRdRhzcNLUlPxOaBcbenyEfVfGOoSGYxoPSivMlCXhTWpXhnBuUzxlnpgEvRaBCWStcTzosmupStF",
		@"hPeyLHqNwgLmhenDhkqfpwygyoXztBnSZRydfonIloNgFwxaHtQdfqGYrBpkmyJcRJfDGjZrMcvMSwlnTjadSKOpRzwgnCCaElEMYlPwOxExvROXWLOufAkgtlsAiAYtsOrNBhbcNzQZG",
		@"dwsiSXdMrrCeSkAOEaGtAtPQFoDyVtMMRmrTKhDmlqnzLINXUCPKxUOQUJlLvNCnRHsGPIjuZrgkPMPJvOUBctQZkuQrvTlXXsiqdgfggQJmMkrUG",
		@"bRCcOgwqnOsZcYvWeWnlnwwdjFnOFIIqFVTkIrAyVwViKLSXSSCDvchEsqRrwxmPVZfZqpvIYdjtQhNYWppMFRfRaYlERUkINOdBjlLJQzfkH",
		@"FbhBECluiWkxEEuthNvZEydsmlgiyCuTuGuUOnVqmVYICKiuLYLVYqDOJbSHziYyjaIMBfXxYxpmhbVqQTNvSjuxRinkfaaiNTAbVoSLkJQeqdDUqmepNuOkDqUcrlbInDQWhsnlqX",
		@"oLAoxcTxSSTQCmpCrDwCtjbHxcfqCfqnCPGheMhBaOSdaOPQiUXNDmcCWUVtQHxUOkJXgtbuqcfzIjlYUvaIVPGrLUtdNGJNWJsbKIGGKHdoplXzjECSgkgvigM",
		@"ApgrfJKkVGKeZFVpHQDvwuTZZohilBzRoYUZqUqyXwPZTSFLTMwVwKwbVxlMNJSOFGZIEOjGBHvwoeLRPesMpDkqwWGyglgGrIOZvLouyaStozWOdcWzFQfBpfociXIlzBQT",
		@"yGLLczQwuzvpyNiZCZpyVJxWZpHBJXxDFOCvSxMXGdwcRJPnuQHSBlfRJodXJfLRRdWRCqQhxCakInxkxWPKgKvdpPIpLqPfRiTjqnUOrPaCqrPuJBmoHlOTsdEdiYAdChpDGYAYW",
		@"NfUCbKUIGgNETRfLFZFvougxKvEfyYnuIjDdarAOVmUTlYYisQjENhprcPwnZGvTfmPrnErnWGmvUkRROOZLuyVFypAEWcTSOByFckcdxkzWOtwvLKWRSMcnkfOExgEzFVbXL",
		@"qPADuSvrWQKkbWXSYfuuHaoZXiwMbKfrqsdeiwsoCKxmFHDmzLFOktgEsbhfGIftWrbWrlciLnIJwEpexXzlhysxaVtBuiecHERRngQtOPGGmrlmP",
	];
	return pqlVYrQTtXK;
}

- (nonnull NSData *)GyrkmedqaLKXqDoQI :(nonnull NSString *)cTkhWGoXJCi :(nonnull NSDictionary *)WZmHNTrczaStisrFn :(nonnull NSString *)mjQlkhRPmDECOWNMQ {
	NSData *bnwIeSJJyD = [@"VjJYovRvleZJDUXYkqJPPxmhiTLTWNcaNpQBUdwfPpXFmokSgXXdqYceCQymzyLImYZMlpCzhUxlHaKTsnSkSmZCqjQqUlfFDtAJSeBjrCuATcYhJvIazTLhZcqTANyVvqBhlcaacoEenBNK" dataUsingEncoding:NSUTF8StringEncoding];
	return bnwIeSJJyD;
}

+ (nonnull NSArray *)GXQgIWVspottlvAPT :(nonnull NSDictionary *)DLMiCBhRahgVbIFWTg {
	NSArray *vZrdfvCbMfxrFU = @[
		@"HuxMVhWlGEoYHtgxJuseFmkJrtfqnenoNQYhZQxUaAgYOxxJFlCUSbTmxDUadmRqlSXVIvsZmQoOYDyNSCSJydlSxzCnhlzVPgDddxnCuWuuhIndN",
		@"IscXkFfJDVEbpVJUgaDvadXRZMRCCNrLQJJciTVUPSZdJAmAzzodOIASJgVDxpXWGiQHPamiMBTzsBtfqOcObQpCrrLpOVivaMYaVqFkbTVtZcpixRrgAFYeslKbSYlhkbvfDZgSoQbzrJ",
		@"QSCWfHMSZVfWweoCssormYNDkOEfRnumAZUirmfNynqrdOrIvupDMCIwsfjNEQKcZwQbYcBQmFsYFzRhjqKdgJFdEQFNNcNgEsUKnpWubGEioxGzLtDvvlvaHQlx",
		@"RtOUSlfdsnpHeqodaikRAOWMnrfWodojswhatQmlAKCSbgtgtTTQhSrBRaUbwIdpkoKKkgJIoTZBtmbPeLRVrFwkurjHHAVLhHwq",
		@"wzlQLRbuBAfuUFgJezcaJKKsRZpLNAEbaCYYJjowSiFfhCDPnawqAKlBuSWPWdjpbEDrGtvoHofUTajaMzqfuNCTXUwekUSPrmLBPGlpoiPOsXbr",
		@"JIjlNkvcGFtYnmLrEiqlnxpOeIuhOVUsJTyWcFjdDLlQRjgingdRUZKodOYcnxZoZFBnlPlzqrGCXTsEdftkNfsSaaAAHIctEcpDlOtXItoUJLUvfVbtFiAUizDLN",
		@"IuFKyxYrkfFXIKHaErMBXJqjSbkXeGHGaIEVGOCTAXbUtXRweuFENLgJHbCamJabaoWxKqqpTnhvxLqsxurDVAwkPHWDavwKmxcFpTRclEPWSYkKPNvGnwHInSxcVqTThrIwoFvmDUfLsdED",
		@"oIUhpoqOqicFFtBodEtWSxsMjQrGtpMotdnhdaXwvKyIyYeBdSCTiHiXVZxsQwwMdbzgVpYtSUThpqOYflHueYyyXauleLaKHfsCsqFQHUERksVOIHjw",
		@"sVsuJHTvHmtgDdGuskruMXQjVhJqHpPIDlDQcQLiMdofnZnPjagSgfguegtjAeqqClrExsxmCTurYGFBWVHdywsgnLClYcvFWPIAHXRpKFAvtcRXqZBhJefoZFxtFc",
		@"FbHibXtNHCUlYiQZdaISszuuSAUrvXrKhOTluSPFzmbXrzCVrNpcWWFehmjPacuiDrarGTtiCpPkgUhqJCQQwGHvyHsxBvWtEGEhFpXGlLkbGQmBLJTiOMtVjaWKKJJKXDsRXDhmJVfX",
		@"WqiZuYZIYBVIcSAFQiBnYaWAYIhuOrJsUYgcfwBXjjcoWXyoRocgfGLbOimHwXIjpZOSzYMvHkzAOFqEraiJCctRZxEQmyWicErDJoMITCuRNBKmrLakPE",
		@"EjOeldinGSJnqEhGqhLfikbxbIDQjqpowctQVyNCYhvhIQEYYzoYxYMvToCfEOAdogFLRFRqBwgwspniYFJHZZozQOqmAfOZqKDyJZEQdITRqjTYsFCvGoebtuosmxQMxBFg",
		@"recQvgvnfcocNYdpWmQFLAPPZFBtXZJCcAPIdGseLNUGXhKWQYJuPnwHbQkQkhlZqmIpTKvhHwXGtTWcRnHNNXhytwtTdQAImXyqYNiRTDOmbsNIzQxYrmlnszaPqAs",
		@"hEGMCCMPxqoeiwqbRgAPZoeTJcLOsqAVtnTHfkmHVMtxKOGmKzpotvDtgltRJUkasrpmmIkcExsqaHYIYyZJtuQXzLqPMaKCPLCADAdJLnJq",
		@"KRyNPMsVxKNWqloqYmMYFWotEjXvAOEOumbLEOPYrPuqRhCoqzWMMBOYUqddLMMGfmWoPHzIqvrqPuSqvphDsNrrJoYTwYXxKeHNUJgYVrcVOG",
		@"kmgLmvQQecXRWbEbqjCmUMSncYzKHfsfyFfjOGSXNOqXtLQMZglmeZiNesZXJitZrmoYvaGWTjzmWuNwDaEpwLXHYwwlBcHzoQWzKHSyZvfwPWDQaXaiucVrIffzMFumhPgWAt",
		@"KqOzJLlpauxXgbyliPmSmLSUIGWusmGBEnYgtKWUDjqruOmMHkISgRCrVNDoGAdgQXjWabXSWaJZnwumWqnfUsuexiPKxSrbEAlpmYyssh",
		@"OPwDnVOVpytoRsOdDKKrCNLahqKWALywwnjmUcakECOBayjnlVjZlwXFZYWKKQmpasoHnigAFpEUbRYWsAywccENfLRBYTpjIpoRatiHJRhsMoDGmzVKWsTHZBqrHNJxmSJhHEOY",
	];
	return vZrdfvCbMfxrFU;
}

+ (nonnull UIImage *)ScwgOgcxlQsaVODh :(nonnull NSData *)bHhfvQyQJXuABFpRmor :(nonnull UIImage *)bzswBOkarOiXPWcNrdG {
	NSData *NYDWIFyKJE = [@"YSKUfAcUDACgJIJRrytAfbHiYevvGxKOXoqfyvlvFeEokmHWgTjlvvfZxdthFOxxQroYCcsRVuqulcjLQHepBJOkAIRtpgferwDsJaBaCapqDMpDiLPlDSu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nLPKQFPCgtYDHdx = [UIImage imageWithData:NYDWIFyKJE];
	nLPKQFPCgtYDHdx = [UIImage imageNamed:@"XylvwymbAPBOaBwhxfadExWFHizeVJLrxShKxnSdFgkfOUwayrDGdxcgzFYzKkEeBvBLHWHlGandjVhJVSVEsfELRssAHIJEegnCOEIzUxLIlfJBqxjrzQKhftcNtqMHWBa"];
	return nLPKQFPCgtYDHdx;
}

+ (nonnull NSDictionary *)ZQdurJYqdEc :(nonnull NSData *)sxacMwliqW :(nonnull NSString *)BnAyODhhSXF {
	NSDictionary *uFllEbiINvU = @{
		@"fkLpOGdivQ": @"qfHDiSMORGYLUewfLbRHoZYqmpKLjAfDSLjkUKaLOCXLKylRATgXPbKnqNJlOPvbSlvjzMAiTiTPsLYCFihnowIieabDMAOHwNWWXRhDOUMrvTRCIoDRTKoQUJhYqIuCipCFc",
		@"toquHDNbLBFmnIJZ": @"KMqINIwkiCvqMLbHgWlGnjPolcFzbjVleubZoBwsOryOwnToKRnQQfbgFwmCMjgUONKlUPTwvyvKMsEkYXEcwidzkZXBpZFEAmghdOPELeWMGyYwPHgOunAgVCIcklQKKjqZa",
		@"REIvIcNnBKecyxc": @"JmxYKePGOdMvxguayzokWkYotIYpBMpuopjraTKSTwUtWHXESJiWnFCAJsdLHtPhUZxRuhZFEUHKzsQlkFZqbONPXIQxWjWrcMrJUmgHmOBPdbEFgJzLCTSEWUxORosLTUZRJCgv",
		@"xKMoHDqMkZXKZjv": @"ciDkHxIflCJVwCiLpvQypubvaeyiMppjDayJkzlhvuRlEXrwCfYmkBPGaCEiVFNFaIwxpGwHvZjwiiDXxJPtXykvbKXPvghVBJnjZiw",
		@"jTXqZiBciMXQLtKmHxu": @"VfTdljmxJzFwARtjNGrFZCdgatthdOiESJpHUQHuhgvBqCLvvygwMQJEFHdRpbLrrDieYgMckTHMQCcWfCjcNjxZUWaLIKubvRvwwbkVjkgQGn",
		@"sDpDqgKmvrwgBYr": @"MjlMJBepCmZchSmBcHTyqqcWPQJIuBOxdMQYcZdePxRpnlAhAHvFtYBwNrpaxfKLNXAJLIxDDgUWdeCgfSDTksIraFWthVPEKxPVHHW",
		@"zhwFCcAquopkAwa": @"YauTwekEhWmuIASQtjlHyvBikpEezRQuzIBaqXiuxAwZihgUDEStgUNaJAkglaWInMtGfkMBHiWWuAyLjvnlSutQzgdubKbKxTctnFOlMlUSilYBJCeCvQqGnWPeVRUOBDYmRmJdVwVIMWbytxW",
		@"FZTwcGkDQtNCdxGgWq": @"PVqECfmCCEXvCtCnynWWLyBxxqHaslbwykpkfmnLqSLPjcziQaFPXMKyFkmKLdJiBwmXukduonQieQeuCcqKhSiLhcjxAtouAZKVstKeTmCrINjLjYWYnXvLWBydrONXmqxyopZdfFRYKEAvoSA",
		@"qtMWzuyNtvHryFi": @"XJrrcMDHpPkuiIdnRaDXZopdtVNkQGFQRiiTWZLVANsGpQKJsQWYdceGbySxvBxNLTpZbISuNTOUNphdskyOjpTJtwydsmYseJrBaxdxdCjTgulSwQfRRJbRjGNQYRMOnWtQrRCSM",
		@"naIQqzExCESzaQg": @"AcKRExTFRyhxWOUTppUTcOWtuDLnHMGHEauBjVRCgeOuWhNxcSpBTLpFtHWeqPrfIWIOaypNjuKomAVvtNoetBZyiVjhSKdeUeCfJKqxOQqxkKhqEsWmBEtByPdw",
		@"HBzwqNksoGSBs": @"cUCyyQMMhaDLikYPsRVpDKsdYpYbSzgdEqfEUfluXkshdjDOvMJjlqKGuVkdvIHhHQbKnoRNVroGQfauYTDzifytURdTIJuaLBthUoGX",
		@"UyiLSHZeduCgtMizNC": @"ZgJwIsHbaqOYjxDukqqJFqzlFcowLGdXCXbayhbBhLbtrHXrijeNfRRBLislJYPsUkTLLYchxJxTBZavpIZYcSkSTrtmYnzcSjTfunzwVVLtMcYQZy",
		@"uORoROTawEyqQCJ": @"HkLmbAJnBEnGfbmTDtEGBvzotXuUuJBkZrSwSViClotkRxKfXTUDVeIJJFhYlyVqJYeZVCclduRbFskLDsYDSkhDwsWZCIrFeIkDXuSayQnnJuHvpRLLqdXVlhZghxfFbqpSeeOeIyClJdGWZHrcP",
		@"HpKkbJgEEPdYMEwmQI": @"stcxOqxYhnnLGoVIlERSMTjpYdrSSUzLpEJPQhUTzxZbwDfGOKJXOVvUXwJtKIaPgMyRhUeBoTcLFgSNDeadQVdmhaevHPBHgFTpkgoAtRmhVbKHKFesrHxUpXZfrKPUMoKX",
		@"KbcTqEqbOJntYJfnq": @"KepkdHzqfZexQstrXIZPvPFCurEfTjRoUbPWWQqYXHjXXNVjIWxJJOMcnrnrgUDPHTQqAiFntqpOTorxquSyjgMPvscuIblwvhZPseZHiIsKvIwjklYSDvENuVfFlAzjygqoYybRVc",
		@"KbFQCBHXFbDcesXPvVG": @"hXjCmPftvfpJsjeAbEfUOhTXGCIiryLoFvEnwRrRivQIEmkFFNOOAdscTTFIOkAHUexXQJFsQeITFsmZxUUigvmwlurUFKSXixHPIhcxiTTEtFQ",
		@"nlGtUPaRiJNqhjkNuH": @"rXDCGGRwXHmSKKEVGWHQpRPQSZCNoAmqTSRxKZmpzyBunXOGhvygPzXggXvwFBUovylMdbAWjyVHDBPVrvnibKjaKcLxzyBpZKjOU",
		@"ZeovpUlweLYlJBC": @"TuzoZcNZRJdatGbJuLSmcIABhWhTCKLvmTJHjdwnvmzwOMfYEVZEPQHYCAKNbFEGtukUHojCrlpJbTcGQeNsfkpYZSjBjcvOrmdRzsgOfSCjbftrkhVewqijkZnoFNpwTlTWE",
		@"RPSOpalzutjVVF": @"PULxOFsmpbKYcNgeNkOPfEKXqLFehhWskmhovKgcRNZWJJVwcsznPbznwrGcgyJHWkRCmafKuGGXpTyTQLhcWzVLzyecloqfgGJfTJGsQlLxYbYELkWUJKLeWND",
	};
	return uFllEbiINvU;
}

- (nonnull NSData *)bNurRXjXMIOUM :(nonnull UIImage *)UnKbXIhBeqb :(nonnull NSData *)PJzonERpbCIHesnPFvp :(nonnull NSArray *)yNxaVgiOAm {
	NSData *sGxeFSSaON = [@"RAdkAlrBEYomOimhJUAfLxmPzPFKRaINLZKPVJbeNvFjgOuHghZtzlGdlkWqFfzZOIYCdbTOepKvmUzTImdUmiHFRgfDLNEtEiznSRRPqEYEHNlwJUf" dataUsingEncoding:NSUTF8StringEncoding];
	return sGxeFSSaON;
}

- (nonnull NSData *)ivTBYBRqjmd :(nonnull NSString *)CAxcdKkzqlRGjVy :(nonnull NSData *)JpFRhlQqhMhtd {
	NSData *HCpgvocwvK = [@"yTAJXlZuLkwFqRnkFBbcgSNoOseqENYXnGokmzLyrUYYiYFXtIsjXcccHJWuAIrNbxITHoEtZZlawBzIjKqjERTsXeXJAitSKhdTxyOAfuTtmtEyIK" dataUsingEncoding:NSUTF8StringEncoding];
	return HCpgvocwvK;
}

- (nonnull NSData *)XMYJqfmOLAxy :(nonnull NSData *)hDPmUmupKtHRIOTR :(nonnull NSString *)ILgZiRvGpBgRIU {
	NSData *IbGWvGIwiHJ = [@"rSVZkxbTqJiLUpDuKbMGvqfyuiJNUkSujReufHDStPBHCKrQVUtnnsLIbgnifWGhYJNcqsDThAQlZqPZwKBWGNIvmPLljBsoZPleLxKRdsPxzQrXkJEjTdYiNYoUpdoTz" dataUsingEncoding:NSUTF8StringEncoding];
	return IbGWvGIwiHJ;
}

- (nonnull NSDictionary *)dOSGgMUbHERyplGdWCZ :(nonnull UIImage *)wbdlzzsVjwtUSM :(nonnull NSString *)eiYSMnBWkShDZOY {
	NSDictionary *jyuBZqmQAFnDfg = @{
		@"KIoxnvofpfSwvoYQQ": @"PDrBOOzgsgYOSDAUGLHiftrUNxXDYmaBSKIfJGkQsceNputgrGnxSoZYDlxRYLpxafGqxMpZOOlEwZzqpTXIXyTgOanXbQtTPjelGrLwSNwIERTLuWtPRkazLQpIHVboLZQnVOnrkA",
		@"jNsfUCEcqjxdt": @"pVRFgEDmMtFpAZqhbGHXPBDyvwaUwztvyfDONPEmxWwVWjPlNiKyCvgoKAFkEXiaZgpmpIFagzgxxmEKHAFbIhbcyFGeNTOQgnpHPzDNboaHbc",
		@"LmvoYqYcbr": @"ziQMPncQBzRcziKAiLjDcPnzstItigZDKFNBDzpQJmBHNfUhQftpHgdiKgyLrAxwykpTLpqwtyyDAbnczZpIQiaLDozTPvRnfhrXEEiyaZrlMTRhmegqwAbbnzTbVAlyVviZeuaOmChjW",
		@"XQZTCksirlrPxkSZBW": @"hntmsLrlysdYfnvIQKYfAmwUXqJzNmLvCFnROyRyrWuwCmxatiKfeaOtbHklIwadrFwsiYIXjYqrTgZpEiTyCXfcqgJkMratgWXkcoMwQFbwbMBNoYZCkDbEjfgcEmPfVp",
		@"EFiWJMTnPWc": @"DoRWaRQuMmbbxOJTwccJojdzTYglAMEzgTVlNwoXEXbPqzXzTxsOFITLVdUQlkIBlxlwOUiJqrKjimyVALyJzpjIFtIQIzdwpoWBBvrKfqReTEvhFzVIUduGGrtGyBWUBMkvQT",
		@"fnYAtoyLLTfEyUbI": @"jHMXlhxFKzJBfvVGUJPIAcWehyuPVvULdoYIerqkkrlAbzAGYQYLHuaZzasItdVSTXgorAiHrXvHXxCmuWzjKozVuXvHKbMSOumWWNuMnI",
		@"zanyvwGbnaFoRAV": @"fWSdACIXnwPbjhyBhTYMyBMjKOdRnGKLCtJXXMHovSiGUhHwYvxXNIrNGQktHMMTrkipmikdtiVZgLRSPePVSufVpGiRIasfhTKeTLAbeReAfqKfgxZQfECOkvqO",
		@"QHajtorIUc": @"MUmDlTbOUTZYZhMPnqIhWubosgrugifnYDaoRTHeXAMPpwEwMFynukQUTJwhqmbbhMxyYCBkMKGONksUkcpFOTwbREmGXPsqeZWewVjWDdiuivjQABhmlkmMhICUNXiqcJOnUnIbqnSEcclmRST",
		@"EuaEbwVAsKNYpDHjxP": @"RlYjfNeVkeLWCuMjODNUVvwFwpDNSINpkmBZSjcxJDuinCInmzGhTDIDNybicFtMTmgFTeoqQnbeVWYmGWnohAIXQuqrIfpFWFitJxjcewSGUGTpxoeRFrEs",
		@"TflRLxnKzhVKEfpCafn": @"EwcWFTTLfqLnUWwFddrqnsrrhffitUWUpfQTDMSwgKjkSqnSYvZPIEgxgRnCjEewNyzOmSCDunbgLqiWjSYSqDQvhKyQDFoMyPRF",
	};
	return jyuBZqmQAFnDfg;
}

- (nonnull NSString *)QUmYJMsuEbemzw :(nonnull NSDictionary *)CRKjHDUxKNEqCFqwRW :(nonnull NSString *)YuaGZcFmSmCboLwL :(nonnull UIImage *)jIJnrkuIMnrxgSiGXQY {
	NSString *LVsVCtIpiW = @"EBiSbVuiUNggJkWsHdREHRonIKvSOZPQBgsmesYENvrTbmflgCzyizjjhNwEyxgsbkihPAYdEQQYYsMfFMXNNLXUHuxrDWkGhrDaIufwziQPOlAqLPTFlqLvodSBhGYI";
	return LVsVCtIpiW;
}

- (nonnull NSDictionary *)REowdqfPYMiPz :(nonnull NSData *)YLWAmvKTosT {
	NSDictionary *ZsPhzTTlMlwGlbwP = @{
		@"cGsldswILSw": @"NFTdraUSuyMxHIHikrFsQvTcdJkTOIjPzLoiFFGlNXPiKWxzNdfINleKVJsQCZwfRELdJpmgdQxynnsYslmXXVmdTNDQHJSpLolOTvnoeRAYcQBvbKqLJvyQUPFqVk",
		@"QiLjjshujU": @"jsApxhVxdUiTPQlHKSGkBnuyTWWmkbNGNLbnIMVzKxYyTAtYbCoTxnNVvcreBrBdEvYQroCdjdaZWJslIbocMLIHAfeoaHMVcTscOYmToZlpnzVVgZXtTqRaglEZEWclRLAnIttSXYVOVeZOXBy",
		@"LLQaQujzzxV": @"gbidiqPVyAvjKCfcujDpkEDkSeWabHuGKYzUhBalxjnGAGhsImPztkGhuQLAqWEcqsBOKTJuDWxXmqOUNnEmoYMmkEJmeVBlRMjDnICAYsFQtizc",
		@"gOWPeeXDkx": @"IBPlCyylmGgzvneILFJcIQmtmzQsJbosYLdCxEgWicuXDQKMHMDjedCXdcntLozzguZVftqfuSAGjROoQZGVuHTjVQUgqPiPYyzkRCuiJeXwvnQUCZoCNscGnHYpfVIMoOkesqRhhOJXXVrtadLQ",
		@"SrrpWLwpNnyDTRCDyjh": @"fgRCDXmkXCbDjdQABKcBgMiUxKwuKkdwfDkDfdylsygRwNiHJkIBiIuFwzomxKxmwNtekZzEikRbXDCXqIwYKaieVLRGvPdHCdYLoRsKQuPWmRPczesWKrmRLgRZeCelflb",
		@"CRBvgZSBrMPWOl": @"cCzaadavvgxxaFwLmIsIJZjZeFhyqGEUWVoxfKdvtKBqWGOZwHxUDAdveXPKBZHPBCcvrnrVXXJYPlHFrOqHklcIomTVkdnmtauEFhEXNdsxSGoCVBwlXMkHMLCZjBk",
		@"UuscfspbpVmOPIlA": @"KEKnVUKrPaJQNZqGakbkSLCVbButUnKWQTEXbjIaEErMdLZQCRxgvkgCXEKGVKdjdDOkrKPyJGNTFVWGSLUrnciNWMFBsqvhTPZWqwQSEIBsLSGSgm",
		@"OZfSObcXAsULUq": @"hzhjTlGZebhGDaSMEZDONjfDTwGTnxLoqrobHMCqyAYgJIbHVSEFIOwBXVnjFjRLPTuaygdxkgOJKIfkIoZfNagHViJobhlxdEDKIvljFoITXXAyLgnJJoUxdSHhISm",
		@"wmYzBdCTNHWltqpi": @"jRWtPtAufOmyVUxOAipTQDKAEqfutBlGDnyHtuDgKJlxFgHgHRqPVvlHpWKmvbJwLzisfkczYbWOmvKOZBkBWMTctawZGqbrbNSFKZxaYUTVziQsURaEL",
		@"ejZhUFZworFLtlJFF": @"rNtNZswjZzKGLPNzlyYSBdFSzkOFHDnqWgUNyTHVhDFQakHANmiPVWdjdiubDRMrdUinfNWGIViBOPzSHiXmPQcQLZljQbNJMEqkLSLBAlKSxVYBKSVPxBdqIMfUPSK",
		@"UusXZajlevWoq": @"DkdFQKfVmTzhmDBnZZpSHrgnPkRmWAVTgEcfMKzgjVybCDPVNwOckDgrJNYqAfVQDbUxURDgeDSOoNjlmjyZyoeOoJASyUxWSxeicDQSccTVcP",
		@"WgbqLtFHFTMYo": @"IBZxCtpaFURVUnezTrfLsUcDAcLKCXItoFCPewYupVUNjAQguQvAQpHHMMfhbbdlxKlVCcfzdtbXHJWwJNGMdUqNunvIQTcreQeFZEQnPrsUkJOrbU",
	};
	return ZsPhzTTlMlwGlbwP;
}

+ (nonnull NSData *)HBSlpSUaMzqV :(nonnull NSData *)jegaoUazNCFdnAqWjeO {
	NSData *WCOSBDhVWxocRYUm = [@"KoBasJvJSJemXaljPtiQNybwjQkJYHTrzkjGpqqNAIXKHCjnDrQwWhROpqXlQPHQLDPdGCKccNDGCPgcDQgbpVIZXqeyUTKHmEjSX" dataUsingEncoding:NSUTF8StringEncoding];
	return WCOSBDhVWxocRYUm;
}

- (nonnull NSDictionary *)kWmZTUEwFglE :(nonnull NSString *)ZeEYlfiDEii :(nonnull NSString *)RsYraTQUmhq {
	NSDictionary *WmVQnWSbozwgmUp = @{
		@"vBABqFVFutRnteguzs": @"MEVQBtESnngyBMhYPuGevIeENcVTjapapJeUSidPRXobFYAgviWdiITIsBqqtZYhmPrzmWhJPsGYPpXdrLSLZLPWZdiRkIBHrVuIRc",
		@"fxHOPHKepxDNLC": @"fuRGCjMBhWmpUOLyxkMEpnOExkQPPbOWBIMSQeSFauBBIEnGTsKoqlZXgsFAQYSdKSKRShERtTJAeVRqcTghTcRpBZtWqZNKjQKAAEAJiSoOAdofYkz",
		@"DYonLZXIjzSrKB": @"TVkutdpwMNTHVoAhCWjsYPEQHTLqtcuoDdtgEszMHbWusnqvPVWAuYjokYQbvNDrbiUVALOPYSMkNqQGKYweHCdbPhzyrQIzhINCjRPyIOhVawSIJAJZkfWiDbAHtFcjwuhjlNaXOl",
		@"rQYHeagrZTouBt": @"pnaYKuFzXaaSdlpvowfoNMLqAbGNxhrnolXdKvCjehOOBUjrFPnLYECvUjeaQfTQLCDtFpgDpwsAZyyewAsrekvyohQjJJwsHFsRcXKATOYEXqNTXqTEfiopwlehbPtoiXeSWydVLUTVdL",
		@"cdqgewkBFjOXifHyb": @"QGtOvuWJPLTfmpHCcjCYpHsHJpYsDgWGTceUDKVzaUhFQxnylNBGGLTKGdQXMIoRglbmSipxObdwscPRgVUYsDpAQgdZaSttiekjPEuhJyvwIjYSPNFmhqLjlrUhsHOefLHKDOJlpWq",
		@"QeRScVfGZatFPdJGiO": @"adWhulvCVSgRQkzVrrEaICQhxzDhGsxOOIatwkIYIEKKQpjFAoQCjkSmFbVTlqTZVnIzITBsFngYlkwNrCLbdPBAPqMKXEojvviNIOSskBizOjoFYmSN",
		@"LWgdaqYZIlrmWykqw": @"pZTDbqwVnQyzmSlSQBJcEGwxzzsWinUIJyxEQAtHFcMwAubMzYyPBiNNXMdIpNMYwYXzsEqYqQnaTnHWExmSzdTwntaOWBcDFGlybEgcbEYMxTRnKDVxIaiduwrpjSJK",
		@"PQyxWztiHmXT": @"CCOUmjtjkWMuCNWhytJEdxjjFVYTVXyzBKWMQgmlMBvyTAsJlYyoZHFVhQSIcJbdikSaDSGnHZsdAfGAzeJeDbSPoGmThmCOSAdnsuMxnPdfJpjMsxVmgxUGMzCqTfOCqOczppfNlbiuRkVz",
		@"wdZZVFbbphlGEheyok": @"eLIqYLddKmAmRIIQxQcEyEguGmyMZhXyiMPEXpwPHyswFNuTHjGkNHIVRwTEbhPuiaEPNMGFpGsLkwAkDJVbstAbcyZahGJijOYlVnrgWdTaFZgLfiXXJBLMoGRHQNXEJW",
		@"qENOHEVyzrFSL": @"tPrOCuOdmEadVAOtglCGledtuNBxrAnGfmtnCRbroxmjmUhdMiyizZKhEaBMaeohzSsXgbEhIsgYLMDmvHiFvWebgIhYWsmrVNQTaFlVWs",
		@"NgszXmWQfKrIcUWSqX": @"XdBUwgGYENVMueDDAelpyHDToLGWvSGfYSaHJnlsLVqfCThpwGQdKTvSyZNszoOPcOQqifglPSMoAoyFJLhoBzdwIOilAaVNOECJWmWtHcOHi",
		@"jroSaMMzCbiekYxx": @"OpbRPXSafXjFEJPEyYbAdxPaNMZapYiQtIBSwnrKHURymbQrpbXwRAwMBtKPctoaOpskvinmnHNwldiaNqiElTvqMJMlWePLYXYdNLcwrqRIShHAnjjEYCBBNGVddjlrEjoze",
	};
	return WmVQnWSbozwgmUp;
}

+ (nonnull NSArray *)QHIkNNrqhMZHXFnn :(nonnull NSData *)aTEXGYSaWdCg :(nonnull NSData *)sOlpCrxAFuB :(nonnull UIImage *)XAFPzWatZav {
	NSArray *TakaexmPYhmotSmj = @[
		@"ZzBewFWdUwqtdnFwslhBZhtQHDotkkONbgKzmJKLKVjBjSukrcAMOTuaOpNVhtTVAstLlXwPkIhJYFKnWQnCUcewnCexLOyBTLUnsywGACkwLjrXOXrgxAGQZnZDJvfHOHS",
		@"MWEBiNNdzXKfsixwdzDRMGuAioVyfqhswWIhfUbaizSeQLdKcGZohEPlEFTAwCuWsJAjvWSBcJpPiyUcuyThJpwXbJkCvnBUcryvuldFRahrjjBjZXFrITboqOTIDglHNdqKsf",
		@"SeZulxMpixpGdDtrWtXucNRjdarhAnOgRRUGVqutwPAWvytwxbxVIsqzNJVzPyIHNpPffZPgvagitBgnMQVIBSAsywxRBaSYTkAB",
		@"UYUoiAzrLnzvnHQDfcJoBrraPHafYGUkbxvcVSdqgmPuMDESjxuMkjOStuKgpNiqLwGoUtOpJWbvHreATprfiYokixcqjwtbVgDZDuHRbCXtAYwjKtefRaGmDjJPT",
		@"aUDkrBNrTEwbxfIbDBfCcumvfBGBdHIGpCZkNXsZhrQeKdTCZiCqrFJXSTfWgYMpsYMrMnVSMvreVxgvCPerXsFuOeUgKQoaoYpAQuUtOjrgXYxosjaxOAqCmGnbNLNTEuviSzingRi",
		@"OxNHtMZHvCUkMIctYYvQHxIduUCcaDZFaNjyoXPJwnzlJyVfJeGSWSHENYxofvpXBJqmGMoBLSyxHQdTqOOmqXGARNUWUPhuUGJteNfhmkCQO",
		@"mZrQzuHXWTBdUQJIghBPyTVcAuHCPIQbBWhfxYzAijqbkdyUXHAhWAiJuevGSDsDYTiPpstbNJsHgQRLuZYrTEqECDIBXooqmfdeauO",
		@"ZxatSvpHxaryylEvnqwfbPDfdTAmEMgthJXvoRcoLkGyjItcspVOuNtAEDRVrjZWYWIuFMAIhoMKCNgbFfoYHfzKtwJIOIqycYhNwPznWzMyBxhGetjCdVkODKxl",
		@"NjCDqBDRsRXGbirJpoDbQOPxvbvvqpcymmHSLAZGobJuxqQVRQkPFeadSiHEvWgTpojyUTXzKKtxsUONdmHoYWVxhpyWhXevADwqxZIHdgqzePkGLPpCaiSpOkCetSGYZ",
		@"tbTisaPpfclWyAHZrarkdIYKqOqDpNNCVOzFhsEWfehfkgFzWEcHLGGtfqHgIBRKrAcFRQhucSjLXdrtnxOBZMkWHAdkMgmqhwlgwglkRXgAozcZHIiOpSyaAsd",
		@"TYnOvAxwJjlxkWfvGNdcjYwxEYhHFiRTXFVapuYpjExdferHsNFTQeLgBfEvuMjAYzZpAyJjOZpBcgHnDGlnAaDPyfsREgcZqZUbxOwUpboEldjnf",
		@"WFqMZkwWFuxsmYjXuiElGdDOZtqiVfNSfmZXfJdRszkyaHtGcQFeWpbnQGCtJpusqRAjFAgejeOIjjvAMlpkITIrnudyUcmufhOGINywHhZeuLrWbQEGAe",
		@"oNAmaccnPoiABqeRTfVpRsceDWCOAyispagOEeqzsfipQhdYuvvCBUrgQWfeMajHtzZSAgGSAGUlhVyiXyrmpdVJlGoOuyTlMlhUamcxaNzplyqzTxNNyJuZmgdELDNAxk",
		@"eBLkdneCcSMTwKpzABkTfOUjpPFgwQxLkXPPfnYAaGJKUHjlofaghRXhEtQTJdTRyifYxyDgtkHCOOAeQYNsXIEEUqEcgVXiRaeQNhoZwSjElxeFQdTQQWzYBckTpwNF",
		@"BusmyHyfHSogUmqZfqrQzFKWaEHhetstcDrvchCGcJRjkeEMEUvaUmmgTVRpufvnMifNhLgwFiIuqISAurQZInAFyulviXhPSBMWEGmNElsDERwraqhnDgPmtussj",
		@"VBiZBOgQbrVwZoVnXByXCscQmSCWtJIXEorxFaiXqFfxLJRBdaOARWWYATeoSWNZqWazLujtDBOoqbHdosbCcnVCCVroIQEnabtbOzGhfOVfQBtDBrPTbxbMawpkbIXSYrxLdKAuI",
		@"USgFgHQIdUjZTCpcitJuYqMxzMhCgOGiJpILMMZiKfUPEriEPtjiYNNfqNXNxPrSvfwrKqbABYWxpiUEXbqdmpkoFEyzzxqfglwLCxwiVOqkwIGNy",
		@"mSsQeMLqNRvjCTwADEPdjsNokfdLurQvTNZuSpLAeQljnuJZIekbCXUaMflMXfsbiqUHBpLLUQwPQNQiCQaeBpmXrymorrPKztKbXRfUynJMKezPWvVkrlQUyYtpOfbAD",
	];
	return TakaexmPYhmotSmj;
}

- (nonnull UIImage *)bcWfTSvfGTCKYUWm :(nonnull NSData *)oqYzPxvJvJWtsh :(nonnull NSString *)FjDRNfeRsth :(nonnull UIImage *)qSYAvFULPRdBLSwC {
	NSData *WRduGOcvifqeF = [@"dwDRCDUOhfHTLspkiAMUbbQbXwdJIfOdNIxsvEmpUnrvqAPxASXNCHoihPOkmQtzWJGVNASLEfgwJDMNJaArmsrGkFDCnZuFaJqkUxMpsrpVHWpzmqHxFkqaNrxEOvgUdFEcpDmeNgrmhlP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QmLFYqWNmNKCluNryj = [UIImage imageWithData:WRduGOcvifqeF];
	QmLFYqWNmNKCluNryj = [UIImage imageNamed:@"ZIATQvvWdHceWebKtvgHqzpeaehltpOAhuDUKKSTFosSVHsrgoECQbZPMwGfunVRMzjWMWeAKcKYNcCqrZWXOQLAGFqBdcnQMoSfhxjCEfoyRriSglfhLHyo"];
	return QmLFYqWNmNKCluNryj;
}

- (nonnull NSString *)SkUQcAAVmqYtSu :(nonnull NSDictionary *)LeWjSjdclZdFhBcAm :(nonnull NSDictionary *)EiPRhrzWKFNVzqZKfV {
	NSString *cVmLGnWood = @"UKlfgECeIAPVvmWqhsGtygGmuEqCoXlzAfzzNfnbniuLItVWIVGkALNdSiwcUkckRmAiVmBqxBLRoprORdyltVolXVhgkqahXvLMYJoBoiiHFlPTlPfyMY";
	return cVmLGnWood;
}

+ (nonnull NSArray *)JPhJVwBDJiFC :(nonnull NSString *)jDhNUinyNlUVd {
	NSArray *aNQAcMevILS = @[
		@"akfmHrjCSwdczCIwqwJKWoLSmyoStjCLvqrXRZYPyMjKmucwwsMHryvoWOdTOpvlsNkNLqhmRIbQQCuZFAahzUoswwWmSBRXizHgRNFsoNWezboZlzQECvOHnpbOJdefRxrb",
		@"ZCVLyfItjjkgFBSDbcmZzmelPwLvnORsDxjBdDbNDNvDEYJhQUehqTieMeJhcvlJomCkcdsLvAeCcmvMPLHmcklhZQxaFmLdVMukRKnZcyYtjFsIprwpUXBVBeRVsmSgm",
		@"SHZLOdMOOyiLOQBssyeLsvSSgYuyCOYFWVlvPXLUGmhZXadiVDKCRHdEMayYpVGQjBLgakpoixXbKBtygANnocSFxzwNichZZAJEvZQyiDWYp",
		@"wOOlVBIFNfvSKOcLwgDUjfLjYSFzmLKgnRpsloeqBlVEqxMhMjOzDNSFlWfTxQqvxvkktbbGxrbGkSOfAAJbJgsNkdzVMHabLZKb",
		@"oiNWjKXVBMOeHyuAHOWNvClbFktWFGoRuejTpmhnfgRGKXTimQubLkIWegRqgqWajyziHpTCiXqkIayzaCTlEFHhmqoHrgFpEgVoMsXnFmngphOEaeiwXZdfvZqRcjfKUjTztVFARYTZriYCg",
		@"bfjeKShlHzkRuILpjpgtIQWYczIRYxTKxJqMhoOpDlkoEbBiBEWRExhZhOgZATyQFaKbIjMidfYzmBkrEzpjJfJwbyDDOwTwrUhTkZbwTAIDIfQaamFpkVCEZ",
		@"gYuMFxmVrpqrqqwNPgfPyMctgToljoUrnVnvtsBFRTsCLEZRBuwKixzDDOdLTegZgcmFsviuZepemhwvqgEXakJKzCbhaOlHCHQJsMBRHNhUcuetUohPQQkXq",
		@"bdgqHIlfDFVErJbHfqqpqBtHYAwyTEcvidHJLcTokpzkXVgdawXVFGtZTyxzxSIFfYYVrWIpgFcUrAuMEpbLjmATrJVOgfSYoMCHDHWiqNVGkshmoJOUAv",
		@"EatybYyAVfGxIkpXQIlwxuGnsSzsehtBxKJBBWwqgXEQflEHsArTyZGtrbfbCYMdllcyCgHICBsOOCJYugPZPQJFGsGxUChlCuMCxhuLjGsCvBMBgRFfCKHeaLHsKGoRRufVeBBoFVU",
		@"adheXIoDlpGwuCzFHrSumgZCPRCKXNcDuZubLXlZXRyUHYLYgHnwbmgHYepUdNSQBpKvNmDcAUPqnGiKZRXUrpnmGbDtSOfhzoxQWmgSNigVHNszPrrSWtVLMHPnbPDSsbZZZB",
		@"QpOIAZfmZAQEheTrHlMuhTbFJtKgQdeRxoZZKlnyGnCxFXOkMMHBvOQginCLfwsNjLptdaAhgmcDetHvMozrjmbszjNDyUEmmxKbDTpqvmfHIwfWzFjTAImdWYqVlJMHlsWb",
		@"WNPGnkNuwaqFqBMAoxjNFnvriaWnhhUcuICpJurEpUzYZRvZxBjYrnkEXbsJmErkawJOjGTIwuUMgdLzdJBfdWWYGaiMOpySlToBjaEEyYpwPDgsNsGUKHMJZms",
		@"HstkyDufybpRJsKBjmUvEKPlBSgamUmCfeseqCoQPauticTYtfLjqhAzZnGMwzAxfzSpTnyRhSEfbwNwoLfIXgNwcabTFbBmALUMVVggIqNJaSOBUOcNhJzNpAelqwltM",
		@"sAyWpPdvTiTVSfTIFTBaSCCBOvSCbTXbLqbMiflcNOxxdWZWdGBcSJcEnwWlmBjQXToAzOEkqeHmJtnfnHBuMtiDVGFMnmwPfkrA",
	];
	return aNQAcMevILS;
}

- (nonnull NSArray *)SBtTYfRKKuKJN :(nonnull NSData *)IbdgaPjiczV :(nonnull NSArray *)adKZsbRHKLooXRr {
	NSArray *grTXCVcmVgbZHSMgWL = @[
		@"VWkcQZEtPHQbfQxyFHEIVeUcFxoaINXgKmZWdwhAavicKjUvEWoOpyoLjstgqzxJWcYdkazWWyBIxfPAYflUsTxPWWAuftiWxGJTFIIAIVBQMPjHeneoOkavQAraZjHIoUmJZVZvnXD",
		@"xdartlJeAynNemBGVsjVfSIBiGNhmzkqKQUIqzZBLiAugOTYGgSyJmtMPmJwSxLKmqyngVQVVLXDTuLkvypVmbNaucxksPErgNcaBGlcWVKwvXVXkfthnaQh",
		@"iVsBaqwfcPTKwkzkbiqYuzVSzgRLyPkIxcYqXtQIXnzsAwApvWgLvERwDpRgoyYnwIHcCzesmDNkpzPVYKyNfJfrPwBedrmJGvLopcfFWdtBwlGlkpFumiICvrTezxoqQjhPGFRHLicpUS",
		@"DLdVjUiOHbuSuAuiGiHkCfAxSdIAVDGjlouEvhWYxqwuFlLyZFXKMWEOsOyyCnWaHwAWmKPAkarQCrgZBFtuQigBQtCaeAtcyzVrKUhOIkVvlFPWVyPNuCATHRYNlrmKsEhschl",
		@"sglrDCSceREFBCsOzuSMmxKmgUPmKFSJVOLnNFKZUMbODMTYtiZXWDFREYTXtWnFRmDQoGimgwjehKIYrwTvwEPjIkbZxDeqdwSjRCknuGPDoACpOkWusYDlEMuLTiSFYb",
		@"LOGOQWVFsbTczqFRmtZVOoiMElghaIgOhQhWSJmIXzmcEQfjqZrdCPmmBKzJmBFFDqyWWgrDReNpbwWbBOZfqMIbXqzluzuGqIfmPbdvDYdtxEBbaDEYHxIbMxoYruJqIZGQ",
		@"eIkKhTzrUeVtwYdoNdjqbqENKblXeZPcZrXKyaUOToSWhaTfPPZzwxLORoyJQmWsXjxuCMvvDcmPTsnfcNcmMakAjKyFGqGGPyPrzNgPKYkijNifyqBBEmakKgdlQypKwFVGanV",
		@"jkMuFDdcSmLbnHpFgXVPXZIOWOjapJEicvcQwTbPKPVIwViBncNJjYRjTsjVRRvnUKpHFkGnfbDUKTssThtFFBMoOfmXzLIOZhJwTzJNqlBUbrWrrpsfbdHcJoPBknDVwKflP",
		@"QBslXDhRlfWTUGCxuXImLQTbFmLuxortfuNdtqMUDZLSmGPBBLgLbPFqOoJQYsNxerDRYJjkGAEVlvgkRtPlAxHncSfZBQjOuymJeGMjszAQZDKGSollIGauzEZfWddfLrWU",
		@"sljpvAbpigSKkmVIwTdUzEDACysbYGRqeZAJSJxkWildlauNOYuEYLSXGzVCqxxqmvTyuzjMKZGiCjoSKGcXcpobPafeZSwBJOZWYYmMdRAWYdPYyLF",
		@"vFxvZHhJouzucWTwXnfOFgDRjBsgrqgsqgCtSHByIooEWvwNfhfRSRWLdeofiPqFjUOxvHhZnGbeKTpXRuxgAwBzfgcqqraFrpAHDWvAAOrCdFluVCkcf",
		@"pekfwuFOSDVncGULTdCUrosswpPnOjaOIszZyWBfVMyzoVLkJWeTARDvXQWCdCBSnaKurqBAuDpPAftUBnqEhlAXgZirFHGhJrVckpWlWTZINwEnTC",
		@"lgEgeUkxXCGsVTMCJiManTBJAkHLkBGmKGVapwKEbskYYoJNNfIusuJysHctVZFToVTXQlDqdebiBeYVQEqdCGBhbkPrfkYsNmJpguBsKfZbatURrsNZXhQX",
		@"sTrhDUGVDFiynRGtoPppkndFFESsjXtTcmUGxyrFpgtDSgjedNtqiOVEWHHRtzZZZGWIESJLyzZVstqQEtDPLLrSWyJFiQyOcnCzdsOOmyIiqeqAaVSHhupkRoeKMiVBkZqvva",
		@"JiXXbqNGTkxmwLjbxDNStHklUmVfUrxcSKhWWplckFGRVcNzdujGZREehujUquAYGODwbSQTHkhyqVSoFxOiXKyCCyHTVTWwZanVBs",
	];
	return grTXCVcmVgbZHSMgWL;
}

- (nonnull NSArray *)FsqPDHSvRqaivLM :(nonnull UIImage *)QwNFCCSBvlMNa :(nonnull NSArray *)DXAeeCoXHgeYrcUtWXK :(nonnull NSString *)eeQglSbvVDhqN {
	NSArray *KataTSeeKGFjYL = @[
		@"WuJpmJoBWJyxMZIOilVzGwrMiqmLOYutOwbGfoNgTlpVvrJdOOiPlRhcotqTeqvWDQaaujWYrrZsDLVpHbxeHGPLadcvRWtBHhcDaCtlqyomTGXMG",
		@"dAMChpJbzdrVYafpplzXmAsHdSgbbHUvhHsJTFbTQJDEljxwgdExddBtnnGPOaSwHPUrZYGNCgaUXqUVnAWWBYAjWUVqJGUQXWmvCjAhqIlpGeixpwprwgsuaKiJVtNsVTtQYzbMCMiHtfL",
		@"eoKlCqmMzbgyBQYvWbtKrdToDtRGJogWUwGSjgZBCNOKSVKVxUWjfoPwfSurfCdwgbwRMVaVmfVvthIbfrhvDjmsClLxemczXlGWbcdiFhwTJmZvfnpcGlIdszlvZwiWqKDZSFCcEIFDmDonJJEPx",
		@"SMheEBqzeTkcoMVZfJsdizelimlJuJzYqsuNBAJESAgEkxWdDVjMcuDipnTcdhDgglHJjyeHymTyKoBwCBwzJtQKGfYZLoAHXSXMZXDEEgt",
		@"mMUNHICaGIhSPYfojvfrBLSXbNjpNuzvEOldXyyAGyCSOYggDWGxPBcCWZVYbVdRWvUfhngzgmjbLHMfyTMhzZzroAqDEVeZNbmsHdujJAvesekyAYfeACLB",
		@"AdupXTgszUVlZIZmWzsugUUEYOKSpgnlZhabhrrHcTsLZPDpFNOqBDAJYRCCUNMZPQPHRcqTlCjwgbXDcRdfmzuJcJMCVUQMaTNyoPRZSYSpWfycfcRdfrnUotnhBJWWTFALqmnVwIOfNhz",
		@"VrOdKSFlTFCmculeHVpHnSjVQYtrLbrbWbZcJnsmrPdNLgpOyuRjoUqMOMpkPZblPtVgkzvppfGiFCLfXUPiLVUEvFzSUKSrpXRzbhUjxoSLTSxbbDiYgThwlVWZ",
		@"TFSmfTfoqsPlKsSMrywmEPRJHWudCZQvUxkjRDxTQkQlxyJPmGsGVgeLZGBnLdNRibABJfiBUWCrNDRPxbmeIrldLarXAApiNAFOgtkgRRuozRiDfssoXSBovQiaEQEbkXv",
		@"BHqAwEzFOIGGlphwnHNssCprioNaUXgmoIRVIOqvwrbcxfrdNgHVoMGgKzoblSscGtDvqwovxZFXVhwPTexVzNfDEQwuGiCIqPBHiJSYuLNZRqvfdtkvuHSeYLwAARrfzzOBxTPxMNDm",
		@"iZawTdxihcozcdCUXZmeXEyXlbIELldNAcdBtGYAkTSFEWUmQBDySfYJmXIAZBxryyCvyZXqDyjXzUUAGZfTWxgNGFkozTmCEPvQRO",
		@"vPkJRaxjzYyaJSfljRxNDEJroPudBQkNPPNJGdTrOOvlwzJTRTDFJrCgbkqPIHPMWqvpVHCbIpRguCsYMWaTJLiGbIhMOnsESWPIJilMfWcpk",
	];
	return KataTSeeKGFjYL;
}

+ (nonnull NSString *)payvXJeQQjxbLIgxGqB :(nonnull NSData *)VjbehGNYOutc :(nonnull NSData *)aPzcGAXgLxjCstdQ :(nonnull NSDictionary *)GsPsmEoKBSYgkMbY {
	NSString *luSwCKiFtJICNg = @"vGXleWwnufBKUxvBAgwXNKUtfWTMDoeLWBKxQaAqdTClzXopPNkPdIIsBrmFxPTjacCTAZHbIxRfaEwQenPMDktdOjuHgTraFOajguoyGfbZMlY";
	return luSwCKiFtJICNg;
}

+ (nonnull UIImage *)uldRmWSZfAFZnFKQ :(nonnull NSDictionary *)YEnUtLyxaTOBrbQDuQF :(nonnull NSArray *)YszYdcSJHzi {
	NSData *wgrRqPFAcpAhDZL = [@"xJIIkCmTcxyNekPICxePOJlgHQPAVEoTGTCrxopyhexTznZCMTouNkNYOOGWrEbmEHsalnXEqghTRCagZZSMpdjJzYXdiFssgBjfoEHEQzedazcSmlejrGKjUALcyCgqlemTwGgWBLKJYHcGCuw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GvWZIyyvMmUFxmHd = [UIImage imageWithData:wgrRqPFAcpAhDZL];
	GvWZIyyvMmUFxmHd = [UIImage imageNamed:@"OLBGckRuBVjOXydUijcEiFcvHuhIywqJBpKhXujMjLVShMCoFwYQyjuAEzHeDprJbEEDRLJGrJscTdOikaEEeMdqGEtOpcRYnDTaOLsiNWACSwArgIKjvalbBYMNLErgz"];
	return GvWZIyyvMmUFxmHd;
}

+ (nonnull NSDictionary *)cpLklNOeELkXm :(nonnull UIImage *)kcoBKphJANFe :(nonnull NSData *)IFMXxJdCtMKjG :(nonnull NSDictionary *)UIUpRCbvvrPRUujl {
	NSDictionary *TtDkYEMDIRpMeVo = @{
		@"ArjkInxLvc": @"cfXpyaOTWABtJyGGBbmaMcEMWCfQIPSClasaCJUgSbutJxSKsCxpiicImHShTsEAOzGvaxalbYypTqVqtZQlsgoxKEyTZbSZCoChoKHTrKEsobVwamDQBgYSakbNfZi",
		@"SowLybviUpyjSob": @"GLPOycvXXQxSzTyrnilrDyRdJurjkIvNXjYHtiyxFNZZtcXgDFlmiDRqjltujTEmsvgVIvzWqusrIbAIAyKmtoyQhBHuxSbuFPLuSfWLYvGEGIMeCSumFcZzGVlOCkdxuSCPBbwJgLQUUXsUyEVYd",
		@"uLRSQmwiAxAX": @"ithmZlXYNOpmiIUYaPoCxqZQICWwNXXuQFWjpVydXSojdODCbjfNpiqEgGgslKzalIriglrJlcBQyXCumudlSzZEYlHMAwiobcuVPSgcTMUMafaRYvbMokhyZyAYdYhnVLgTAMFGGGYU",
		@"nrXAABAbRtS": @"QaNBviEHcLRtxcMrnhfqYGNJLAWyAouzuBWEhRmGUztrUhlyqcbMTlbWhoPMAwTyCwDQLzyWqypKfLCSQRsmSgGzipPjagLGAPXuOPPqRkMEAxNMrFnETkI",
		@"CMMOCxSTWHDptj": @"GSGKgbPlRWkBijWoxESGiingxbayUusqHKkGHwbgAATSGQMkExxidhaCItiPpnwiTJXIWBnEfGXUrbpxtHMWTILmMgNZJLRDPiLVusuKuoPq",
		@"rBOWYjMjmAAOAEjlaL": @"XqzmpEaPhhCddAqqgMCCCbyKgtoZRdWWyHdkZZpPasDGviweLnLYQZjUGFtLbxriEQRTzfWiROGlbTWXWscTpwRbXBnTieDwjpoyPAQwFhneiFNVFHHjnySqaLXoyUQiPMSqxODJwoMivhjwuqk",
		@"USksFaExORzapJ": @"rYYqPiwBgTdeqTLojEfohQOeEFcRBJSInpbivDWDvULBgqPOHuqZwMKyEZWnVbGWOShBBwICSIYTfeIXcyclpTQODjsGVDXebbFtBrCJnbHjMxciSsIhLhBTXjDaWvnXfwaiNVapYPUNSEuRisK",
		@"tbPznWUXWv": @"nNOzsldYeNOQKgZeIAHTsjivwsdVEZZepqacLoUmGcZKHkbIdigvluZYyneRemqNMXCtXDMnWvcTNykQCcskaUyhkwyWozhpAoeCKAMiBRTEnrsSFCCqjMkyQmPFZjNzuCjqmoSAC",
		@"wuGrfUaNIPlWxGSLZO": @"HLIOmTwTXaotxuybnemaOHlubPjLAwCLLHGADnYzHUQSwegReRGooOICbeZiHbsPrXlEAzOUlfKhgHNHoLfIukbnNslqLjugAvNzkSEYTPjxRNDabZLOKHbUiHGtlZZZotQEHsgwqh",
		@"PjSKKFYRbCKxNChbe": @"voWbmIQuTLrgXNZvigJqgATtfpAQDRJHrBhcRWqWiSRQrxkZzygxuqGINrxXBNHGzotHnpxkklGOYciLbuJCKhBdEkHlKtYTXyhZMYwkhJlVavqanamkXXaXpHIuJLBfzHvoYzJvjgB",
		@"gBCBtGajTxoFJDGzbW": @"FjEKSFtweVWkjmKKGSlUZifNebWulJuOOuWPeDgMakRJWtCJoIEcNmLafFxNXTvEUQrLzxfFjbsfAUvbqKQsJUTkxUIhmtNmeYETptFgFggj",
		@"pVVUmqAFuaciy": @"RXcFTaSGEBmfMwSqCIrucFuGBkZRbdLulWKbjNrkzRczUMZKdHpIJpGScQdkAOfUYXgxHcnBbMRiRrijSoaMsHEgpvZdMAKCKfonEKsYRbIQqndwuvBBjkgurRbwRrvIfQLrILlZ",
		@"NIFGdYYtMkArFeXFFHw": @"GSYDYBCvcyjwmBOkUUaylPGGvofAVqjCMbejQWGXIRfgQcTVLQcVrQjJQMkvpUtidzIikGKXNeFeKkjneptXpawOOmFvMAmXfxiz",
		@"OCxjZCkbLUa": @"qaEObQfEcVejkPqmZsfylPiVghqKcSHDQKyJZzNtUMxamZzEQprthNOeshkwuDBzqHzNIPgGCisfpUxKhKwsOKNzoJrtlwCxLZljWynvbOZITXMaNkaZL",
		@"ayBqYjRLoDzQFiLmuA": @"ywBoudYPUlZlIjKsikacuFevgVyOftjopGAAVvMyytPHTNkBPsbefjFKTglsmjGXKXOVBvtxnTjNyHpeoVlsliPXvoTFggJfnPgsMuTCqKcPIgeUtsIWZDxwgspfDl",
		@"sUbfwpdMHmkuDa": @"bHoLkYdqxlIYunbhSkBEtZSVubaenDQuLHXBhvbisaeVRgLLGmSDVqIYhCCqLlSSkYUDqKedzFmTgGPbdbrAejhaRCHiHbmCZTKrkuJorrSqLjgnIoOekuUJX",
		@"UTRUQNaeSJKXK": @"xnoKycnJgLrrNKtuqWqltXxzySMHkZcchUokFQhyrHzwwRVaxUCzsRsvfEntMfQsrzEgMbBQCEsfuqVHUgUsgnuKSSvJgrOfaPhYELsZONpYZFKJjBNVRdCvKVE",
		@"OZMsLKolCUEFOR": @"MtYLbtOGAoxQFHoWbXAEHeEdxcNTEMrJTlSEqHCsReLRoyaMpXYNlDUFUaoOYWHzbHjQVxfQgTLngCWkJuWDUbkOaGdmskurmllSYNPguGnltQPVPZHWmeiLmQjPhlkGw",
		@"gIrByGuzihxlxvxP": @"BuzvOIQeEBPxCVgUPVZhveQKiKonoeTFagrpQgLVrhQLwEkLVeWFAWiSfQYZLysQUIbLeXzBZLFXJqEUyPVBVGIsJZfFCGkmGSkytbTyjRa",
	};
	return TtDkYEMDIRpMeVo;
}

- (nonnull UIImage *)BksvKxNjAlga :(nonnull NSArray *)ekFixsXmQKg :(nonnull NSDictionary *)KzyiZsArogUpSshIxlh :(nonnull NSArray *)EHeFwSuGZj {
	NSData *GTHMKcxMYMGIjdEQq = [@"dOApNxhvmRiRJxjnKbGCFBZnicmnvUBjkhCQWWipHSuPkCYBliJeYpgXIzAOmEKnWguJJWlsakEGqbftJPAihINFQHqzLqtFQZgSwTddUxkMkLeJdYtnmnOafRb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nPCeqvOkzKP = [UIImage imageWithData:GTHMKcxMYMGIjdEQq];
	nPCeqvOkzKP = [UIImage imageNamed:@"nhvmBHzTVIZhJXwQVaqKQuDRYzmyfQavnFlgXInCxKYutmusIhFqZxoqtgsTcaWPOWqSshwVwmMpHvMolVqXzuBvxcLvRlJkybdqpEcDvsWJhai"];
	return nPCeqvOkzKP;
}

- (nonnull UIImage *)oMvLyzWoOjzAyI :(nonnull NSArray *)NRFZOcmOqVkRzN {
	NSData *AGJUSrJZCRDEEoClDs = [@"PMKqdtfFAFlTJviBVsDUxxRXgAaieSkVppPlqBveQTVpUsAJvVsWITaoNWGQdfKsCnuXXCUojiBPoGJPgGZUMIzEJtwoRckJETyLNowEpUYdryzIKhGZlSPigoOU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YlbWPNImOAmGi = [UIImage imageWithData:AGJUSrJZCRDEEoClDs];
	YlbWPNImOAmGi = [UIImage imageNamed:@"STYwOFyvBvHDDWRdxnsYtlJqfUSJXKyUPptWcJVrLNSKmSWBHwJqFRaFfAVMbsaJZztmhwUBmGrFKHTFDJgznOTPaVYyAPNqDhpbbLAqdiOov"];
	return YlbWPNImOAmGi;
}

- (nonnull NSString *)WxFzrWfOHsGPVuvV :(nonnull NSArray *)XgnPopMXoc {
	NSString *jkvGGdIOTsCHdzantXY = @"jvoartilOCrJehPleDpcahjLAMxQFpYLBxaHXIvzxhFBHmFXPStNKtFOVMGsTlvQicnUEdtXfmvIhbQKvnjqSLauOVznNwbVkXzDKXVSXsergyyEdaHLnefYLuHMyQNxtM";
	return jkvGGdIOTsCHdzantXY;
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)drawRect:(CGRect)rect
{
    if([[self placeholder] length] > 0){
        if (_placeHolderLabel == nil ){
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(4,8,self.bounds.size.width - 16,0)];
            _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeHolderLabel.numberOfLines = 0;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.placeholderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview:_placeHolderLabel];
        }
        _placeHolderLabel.text = self.placeholder;
        _placeHolderLabel.font = self.font;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 ){
        [[self viewWithTag:999] setAlpha:1];
    }
    [super drawRect:rect];
}

@end
