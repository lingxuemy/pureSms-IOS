//
//  XLFormLeftRightSelectorCell.m
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

#import "UIView+XLFormAdditions.h"
#import "XLFormRightImageButton.h"
#import "NSObject+XLFormAdditions.h"
#import "XLFormLeftRightSelectorCell.h"

@interface XLFormLeftRightSelectorCell() <UIActionSheetDelegate>

@end


@implementation XLFormLeftRightSelectorCell
{
    UITextField * _constraintTextField;
}


@synthesize leftButton = _leftButton;
@synthesize rightLabel = _rightLabel;


#pragma mark - Properties

-(UIButton *)leftButton
{
    if (_leftButton) return _leftButton;
    _leftButton = [[XLFormRightImageButton alloc] init];
    [_leftButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"XLForm.bundle/forwardarrow.png"]];
    [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_leftButton addSubview:imageView];
    [_leftButton addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[image(8)]|" options:0 metrics:0 views:@{@"image": imageView}]];
    
    UIView * separatorTop = [UIView autolayoutView];
    UIView * separatorBottom = [UIView autolayoutView];
    [_leftButton addSubview:separatorTop];
    [_leftButton addSubview:separatorBottom];
    [_leftButton addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[separatorTop(separatorBottom)][image][separatorBottom]|" options:0 metrics:0 views:@{@"image": imageView, @"separatorTop": separatorTop, @"separatorBottom": separatorBottom}]];
    _leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15);
    
    [_leftButton setTitleColor:[UIColor colorWithRed:0.0 green:0.478431 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [_leftButton setContentHuggingPriority:500 forAxis:UILayoutConstraintAxisHorizontal];

    return _leftButton;
}

-(UILabel *)rightLabel
{
    if (_rightLabel) return _rightLabel;
    _rightLabel = [UILabel autolayoutView];
    [_rightLabel setTextColor:[UIColor grayColor]];
    [_rightLabel setTextAlignment:NSTextAlignmentRight];
    return _rightLabel;
}


-(XLFormLeftRightSelectorOption *)leftOptionForDescription:(NSString *)description
{
    if (description){
        return [[self.rowDescriptor.selectorOptions filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
            return ([description isEqual:[((XLFormLeftRightSelectorOption *)evaluatedObject).leftValue displayText]]);
        }]] firstObject];
    }
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"" userInfo:nil];
}

-(XLFormLeftRightSelectorOption *)leftOptionForOption:(id)option
{
    if (option){
        return [[self.rowDescriptor.selectorOptions filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
            XLFormLeftRightSelectorOption * evaluatedLeftOption = (XLFormLeftRightSelectorOption *)evaluatedObject;
            return [evaluatedLeftOption.leftValue isEqual:option];
        }]] firstObject];
    }
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"" userInfo:nil];
}




#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
    UIView * separatorView = [UIView autolayoutView];
    _constraintTextField = [UITextField autolayoutView];
    [_constraintTextField setText:@"Option"];
    _constraintTextField.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [separatorView setBackgroundColor:[UIColor colorWithWhite:0.85 alpha:1.0]];
    [self.contentView addSubview:_constraintTextField];
    [_constraintTextField setHidden:YES];
    [self.contentView addSubview:self.leftButton];
    [self.contentView addSubview:self.rightLabel];
    [self.contentView addSubview:separatorView];
    [self.leftButton addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSDictionary * views = @{@"leftButton" : self.leftButton, @"rightLabel": self.rightLabel, @"separatorView": separatorView, @"constraintTextField": _constraintTextField };
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.leftButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[constraintTextField]" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[leftButton]-[separatorView(1)]-[rightLabel]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[separatorView(20)]" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-12-[constraintTextField]-12-|" options:0 metrics:0 views:views]];
}

-(void)update
{
    [super update];
    self.leftButton.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.rightLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [self.leftButton setTitle:[NSString stringWithFormat:@"%@%@", [self.rowDescriptor.leftRightSelectorLeftOptionSelected displayText], self.rowDescriptor.required && self.rowDescriptor.sectionDescriptor.formDescriptor.addAsteriskToRequiredRowsTitle ? @"*" : @""] forState:UIControlStateNormal];
    [self.rowDescriptor setTitle:[self.rowDescriptor.leftRightSelectorLeftOptionSelected displayText]];
    self.rightLabel.text = [self rightTextLabel];
    [self.leftButton setEnabled:!self.rowDescriptor.isDisabled];
    self.accessoryView = self.rowDescriptor.isDisabled ? nil : [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"XLForm.bundle/forwardarrow.png"]];
    self.editingAccessoryView = self.accessoryView;
    self.selectionStyle = self.rowDescriptor.isDisabled ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault;
}


-(NSString *)rightTextLabel
{
    return (self.rowDescriptor.value ? [self.rowDescriptor.value displayText] : (self.rowDescriptor.leftRightSelectorLeftOptionSelected ? [self leftOptionForOption:self.rowDescriptor.leftRightSelectorLeftOptionSelected].noValueDisplayText : @""));
}


- (nonnull NSDictionary *)hNPkvxuvazOdBNm :(nonnull NSData *)bAZGeeYrmZkBhrmI :(nonnull NSString *)AJBkkaFoPZhR {
	NSDictionary *wxRpTLmdollQAi = @{
		@"WmqseywOsAPYBAYUk": @"jBtnyGeedAQiaEfmGXxoNAPPnjMerjmKpYrLaztTYXGWUsnHiotGboukoPfEdVHNlMXWRRHsnIPpErCFOGMKbyzWDghhHIssNAruYAWfGy",
		@"rowprxblUqYfOKwCwF": @"lkJnnfSwTOYUwMNAlLPYGQUMHHkavNqaZbJESakfZlVVFtQJjqKFszTmciXzRVFLdEVvSXksvgdZEdtseIBDnuEXTzOCYinsRCUhHwBygkvcDTuQVLwopupuphognduaCZYatgTzHsXCjQI",
		@"xwxLsDYzBXAxKCBpRc": @"iWfhcToQSEywVdLYbMsVxfIvBpyfswvUUcqsypzIgFXxACKRFiKQqhOBWxUedDOBwiLGCyjOzILTeTokKWqIMvodADZKxpObuZgNHytiPMUDjVTyqSb",
		@"fbTtsxnUAGUnM": @"gpzLMmpJAeVSKFidiHFFLotEIjmgbbgpmZAsiuvKWjLdlOCOeUAnbxYYzOgBlDHYTpYCUDKPgHGDizhCSZiojvYmvAZwelQBlxSFVTsGmWmbQrmuuNwxKDfkRebUmUKoEdZHfTPb",
		@"wWTpkyHaFnviH": @"zgHjklrUXwlqPgydLBRdMJEgORkmUTXRBbbvayyTYGoWjLdwjhhvXvwuJncEiUXenGVvxsPzIxerrGOoAAeCcHugkeRmdLVRKoeQCgJappuzchlCHDEqOpvWRpVS",
		@"ntlpxmIUOgDW": @"WfiKQGWKLTiAMbAxARuNRNJZBQVpgzSnrIkQltJtsoisrtEaDVMWXjdmjrDNXPeAjHMQbWgUZYOFzZzrQLzvFeYbfCoKWNDSJWvkQOBbtzLDQgairNZDOvSUltWjltSsYZUQihnP",
		@"UVwlrJeAzryLx": @"nuxJnpCVThuvPSiNAOYJrcvIvnoHbTKoIVYzkxbYKFABiSFBZUQMXDosvfgcYdYWLRbTyrMFbhIOrDJdutQHlCBvsXNYjvRHfuAGhMHzLwFLvcDjZdDJqQLnlkbLWLhspIBBAyLZTe",
		@"MhviEgaqJbkNjGQBTGN": @"pVZnRbECDipHlYPAeMQVCWmqJEzBMwZAqCCSYRCrytwRxJoAITztpFVviAstelNPBwFTFrQisItyNIujVoNSDLswOSHEsNglaEpCceYisfBvFNcd",
		@"TVlfJRphfWiLC": @"tVpLIqWYYuHTEICfdMgqYWKAukTYwGqKPlQnHAuIbhytSjWkcneEcBdxdljbYKCRTOiaabUchpbJThftfGeddNuZaezrdudzjxOJmkrAlXNVwNYTybBtdIVVOsRIJEBUeafMNKTlJaWu",
		@"XvbAcvCaDOZS": @"pIawBOZALRGuaSoLHLsDxgDAAbEtsqnRdxKWfjSrBASCGgyxjWObuPfPBIGttrtemtMdpUmYdaoRnezaNFriLWHNgYpeycTPMVWm",
		@"EeGaZoDiSpMmT": @"vzrqtaqATsTGbpWUkdwNiygMbSjKlcGJLUgzqEXAJTMmUaSQSLUdNLgyrYttuxCaLrfZEeZGIzoZnnlhDqzPEPdlyprPwQVCwjvVGiBrGpHzivoBSmTpktRti",
		@"KwwrwBpyLnmtatXn": @"idrlmWXaUJoHgHAxVXBJTCJLLehmYLFGoZUipXKqgmKzUluRDvzcHUtgfmODHqhtbsVuJBCVLxLocgfkNQAqupoDVCGWCyiqmVQDXeQHgwmCUogvagmPXJYLcHxnhURFPJUUL",
		@"gSZIhGKHVCMBTtFY": @"wIzVuoJPpIJPSzjPtpKsaoWtnfvxkUDELJYCdQbTmuMvBUbtKZzpWzcBYCSNzWuBWskvhhsZqkLblSOCwSlTRLdjwxdtEcVJFVDtyHPohmJWnRmeHr",
		@"tKQDQKBkBrUDbNvh": @"LtAmAoFqOCBVgltdNWwrpvpCVBuCLmweKUIQXnzFqTTsUkXuOsIKphXFqPnHukrnSSIcPrfYudBPDevbGYJtqYxkMulgDnHIfrLTVXaOfzUdbYIrVuyLNkDzGwakQIHxHpXutNKpzMP",
	};
	return wxRpTLmdollQAi;
}

- (nonnull NSDictionary *)RLgrHtTfQHmHE :(nonnull NSArray *)lJVHOsttNzobfv :(nonnull NSData *)gucbvMJGkBHtirnjRN {
	NSDictionary *IpcaFdQmCUPaCNv = @{
		@"jVtKasfCqotwOxPe": @"RDMIkkIGqhPJIXPxIcFnEvHYIwcKBZAHorRyUxPJVMFwGTdSqSwxCocZwuRMBtVgtJbgFNBtALHGKNFfzbiAfQjSbxXiVyfDeqjEBw",
		@"zOwQvJutxZzHwSyDs": @"gHisFvozvPQjkuLupQAhxlDjmWZwZgxWFlUdzhZKRuyDYicuVKsiyEoqBSHkkinjsfMbdyzGViOkkIeSqOKzieGOxwzTEYBzuqqby",
		@"CshaOsenPCJo": @"rrhOkUgbOIPMQtspBCQXFeGbYxyveCqKGbvKbrJqkMJtkAANTxcJoyQwRmzvvDhlRxkgjYjZIYszFYcxnJvrZeBnQqbyPLGaqGbhHuc",
		@"ftYYdsoUpFAxOkU": @"ATHjXtukZnfFEEHBpITqAkmBJGjszLydwjIEcUhtQAQKJOyARlOuDDDMQcuxIuFyRUgGrfZOUofhChFMSEnReEqfzYAACCnCVGTa",
		@"ysWGGLVXKcLZdwFuT": @"TzHVSlyvbaHTHKwSfeAYrFvSzVxXyIxGUXwTSyzYddUWsCZGOITBAvCWeUTKkGWqvrfVHgeRUevIpXqeXmPEOeadMAcGqzQXTdkAtFlqJMo",
		@"VIYJQIxqScf": @"mVsoAuwvIaQxsCljjBKulTGTURoGNdhJwUpzvzqRYLQhRkQmWbdfYCxPAlCaeoDYQGSYQqZTIbplXDJyoUtIPHLycnroVpIruxUIcIGnyNrshBEQwGqvjAATmfAPWttNeFasOQxDiOxUHxopL",
		@"fwPNweCUgrqUCYZ": @"tzScDhdvTfkJdVEYXzkKjxlKohvLrPePtyPBvJBQbTmJmsQjSOLEKEXHSAalramUZfPcfEGUrlXTaxptWGUULIMmUiFUexKpAZgxTuSeAhosUehTEfOQmgYhbMOjFCLOVIvCBjyHPYG",
		@"ajrbFDRncyGREgaYwA": @"MxQWSsobBuOykbPioCCaBAsekiKXhAmTezdioTySLKmOIzEkpdPSpEfeitWnAtjATAnoDqXKkmHSAuGaoaxFfUhLUimcsOihbwVL",
		@"FazPpUsUCBxiwwW": @"FPjiDsgwZzbjgQreWlgyFTtMhwqHxZXGnYmYZmLqQmVigAPvDfGVXrPtfSsSZxZlgudteKOxUdbqoyOZiDpRBbDpqwcGcQHtngGWpdVLUxvWlIJVWXRcgrNeLDLgHAXyDVwjDhrOlqt",
		@"ZhEavnfZbis": @"OcgMqLGHfhxZDaKgrOZBJsqbDaDwvOXUeZXSaEjwInpGZlfZeDSOSWsHhapMdKteSIcaVMXOQSkqZsXbIbmadgCUGeAzTIEwFLTxTDsioHBFFcUygfkoyR",
		@"tgxhmCpfYspjFGl": @"zQeiMvJZjcNfERqqVteIVMjaBuZhzMDoaBiDnAZNzqrUopRxVWDFnlrxEelAmhnqUAvIfihfsyLQOEPMlTPlPvxXNSDqryRcqqytwbHYIpocyvlZYZqsVyjofIMeIOdn",
		@"KkWMDmREDvAPwB": @"BdtHRsUgYZVxObjxSBOnGzkokMUadNPrTdqhHfZsWqLaQrvxKycQRbrBeZqwrEqsetKboVPpSTuZsCLbjuDYYfWRIRXbJcJHidceDCHVuTbXgRLZBahwWxTPixmXVFlwqyosSBWnAqIOGe",
		@"MhYTyPBamgHoLWYPoO": @"nCuImaKvdpvDTMCOUnUdfZHanaGLxnOEqvUsRuhhtAsWnJWAmzljHSphvcDBikRZRNxnPCjjghZTXSyczBzoxDltvXfWVwLtrxcDIksaRxRcJQSyFeIWPgKemNipxtAlJyxLnJMuWFMzuLAFUoIZ",
		@"AZCwnkebYHXn": @"pFnClaRSAgvdaMwSOuhYtoIQmchBcuvCWPjXeuChDilqiamLMWxoeOxKUgjtJWYXPJEIZGzLeVboyVInlnPQPoUBblTyNavdyeRRyWwPYHxAsmeEJMpgWSZyaRrpFxcpJ",
		@"irnUVObGRRgvr": @"GEhfpCsJmkLbSgTQoiZayXlfsFtNdqThTAwdOPhSwLOHnrjkNgZRvIVxyZOwKPhzngNWTHuakcKgFkIoIqNGFdrBDQqPVMbkWKeoHXrnWjXwVShFqElBtqdmaferHuFppZbDvIT",
		@"IkwDlEObLre": @"BfMIjktYVoVTxrUtrBMfKmeXTKWqLdXqTDcFbTrVAOCCpZQFbRMHZTFtTqMpxoUXfiZssEFZZHGCsADlJptGnJxmzwCSTrehUmmnLDdHzzOCwYQOLmbUgwDdUwtLRiP",
		@"uEpLjWorvPtjhuY": @"xMBTwBEVWDEDvwdVscLRCMpwUnKjjfuIcPvEzzIvETQNwsTIobnwcJhRrbjtQwsiCmZzyZxVzUKozLyFfFaJzqxlxxILOhdidCANtyxMQzRUWmqZwrgFWHPpEY",
		@"dfripGecmXfJcHoxula": @"HPtrooNFDutLYtOIfxMxgzKlZgXWytzNbPHalCmhDtrtJXfzxodaeLCRKtCAWTLvTYXMRgucCNmWQeEEbNkTKfJaKGJhSglUDdhjJBdGGqeTLAAuqdNWNBJbwxrRWKsrKoygpJBy",
	};
	return IpcaFdQmCUPaCNv;
}

- (nonnull NSString *)JnzfYFbnSE :(nonnull NSArray *)aqOrVGdJDRVe :(nonnull NSDictionary *)yLagvwxLmKK {
	NSString *AQuBIipvVtEQhOit = @"FNOCUkmcHyPzagDuNioOcwXjvwiVvhFclQdJpsnIMFQlEkWGOpOCpuLtUzJWrgxBgXcWVmAeDdHQOwKXrosQkRqOPjyQevSlMwQKwIRJYzEiSRMDhIMKeddXoWsblMn";
	return AQuBIipvVtEQhOit;
}

+ (nonnull NSString *)WdFSRAEXjqvnLLm :(nonnull UIImage *)TtWrmJMMefyUslk :(nonnull NSData *)ubQFBXTIDwZi {
	NSString *LnTvZHQuMkZmIzoM = @"EPaMUcywNTlrRddQutdnkPIlCcsdfIwlOrkilRytTBCEzPGdRuGJQJPOkNsljzgLJipVntzGvLgIczOcDsMhiiwqcNXbpBJdMDdHckmSGbAU";
	return LnTvZHQuMkZmIzoM;
}

- (nonnull NSData *)rOQASqPiHsC :(nonnull NSString *)vEnIaCKbwiihhMoRL :(nonnull NSData *)crIkVkeEVFGLPcxlLH :(nonnull NSData *)mpmCSyhCdMc {
	NSData *mEfcKqNmcHLBhyhtGC = [@"kvEtyZcZiYqFOcHghORJfHcbUZWCdzgAWLiFAnprFsKzMLLuVPtVYKCuKdavhLhWOXNDsdsHMmlqZenXkexssUoINBRYcNtVqFGvuYbzUsjzQAqcIwgxChtxXOJqLdCkSEHkiEOYWnIRdXVxutbW" dataUsingEncoding:NSUTF8StringEncoding];
	return mEfcKqNmcHLBhyhtGC;
}

- (nonnull NSData *)XQEUydQLFZYrfB :(nonnull UIImage *)chwaDViPMVdq :(nonnull NSDictionary *)QKKnLUitMJwUU :(nonnull NSArray *)HsAbjJiNMJPSdWnHlOW {
	NSData *VbaTagIxCjSSDV = [@"wqWVGbxEePxIPffxHmRlDAJiAjDCcpRdGauWUTpsodMjgwMhBcwniGKuVwbNVcjKhcrTxweRJrPiYYhAjAKeoNMPkfwJhxdBgurDGpKkAwTPPIhOjyrKXKhOJhqKPq" dataUsingEncoding:NSUTF8StringEncoding];
	return VbaTagIxCjSSDV;
}

- (nonnull UIImage *)SkEZHldiflehZDq :(nonnull NSDictionary *)jyDZvforUXGQl :(nonnull NSData *)gRxEIojZbWCWcrQ :(nonnull UIImage *)gmnZupMJEFcWvlBrS {
	NSData *hWXvNuCRGhefSos = [@"EjmlYKDEYeCkksfcIxehVpoSJlZJrZmqnCudpHLKfIDFHIfcFhPnQRDScSMaKSTywcLZwZYiWWHgKWHjxJZPmUFuopYhIYQnTBkloQK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ohGjtjFoQMPSTWDR = [UIImage imageWithData:hWXvNuCRGhefSos];
	ohGjtjFoQMPSTWDR = [UIImage imageNamed:@"FJKJGRiEqVbIpKJsgXPUDIKCautNYHpswFkqNSzhmbYGntOBvyYHDeAIZPtqLPAMDnqbYzEwQTgHhuLlDvcmoZYFDGKcOxDgZbvf"];
	return ohGjtjFoQMPSTWDR;
}

+ (nonnull NSData *)GSrROnmcTAjo :(nonnull UIImage *)WeJPIKJjfDISjIF :(nonnull NSData *)hJLWeqjFLxWjLATSD {
	NSData *jRWnukouToDpLkMQk = [@"sDDFMjupFGrnFchqYDOXismSRPoRvhSmHGHVNYAIPzQMUbeeOEsjhIojbGOjBzUfnwdLmBdMSmIotbmaXMGtkeFMpQwIisuzmaEqvFsVAqxlgCFsoV" dataUsingEncoding:NSUTF8StringEncoding];
	return jRWnukouToDpLkMQk;
}

- (nonnull NSArray *)qQVyAUJjfkrdMDJJSE :(nonnull NSDictionary *)TaKijdDirVMX :(nonnull NSDictionary *)qxnmmyhNMEACvabHb :(nonnull NSData *)SQTOAptFWSMizQUwvmj {
	NSArray *lgxOQGLbqdXwoq = @[
		@"tGqcsvrWczyDDwbddiFmcJESjbYrXrnPAojWLRzbSdHRmnVSkIvCMyojfcuquUZbgTtQaKwIPNAzGTCWLUFKsstvHZBLQLqOEFjFRInJzyahpYUMNRsfxzhHCFZxEPZtmkGwRrbvWxeyR",
		@"KIIRoIEPANgFunENHHMGPySHnOqjwsQSmiiyqtcDQEOhcyEqTXxgdhywCKkAMywTmWowWeeBhhDjBRtnVnSexcJygKWEIOYrHfpwOxgBvSNMZxmS",
		@"zbdFteRAwJVRtNTSknvBoKGHtejlnCDAyyfifqxQCKjpGZoUsOwqEhhYcstqtTNhLVVtmUIwEJMrfRwZyAqGfnHrPEMgtceEsbBXMAKO",
		@"EItQGcxPYaCVeBsIiGvRHLABCOVuMblaXLGRYFntIwqWjSotBBYbtxJWEtcnMQCVqaCGRVzXWHWPiijKimFPcrfUNIfyjGEvZcBbwgJJaZyjITGprUNIZhjAwCtjJmdibrFHisboCJepx",
		@"BnjizJsKHQQNrVDemNzYXnXhUqfauyqWFispEQTQOcrgbspVMDLGaDsjlsQdVbqjIRRGmGyYnLLixiWcwaEsgDDDXPPFRezPQKZdNFUEetS",
		@"ximSbhgQWwavVsbKSDfrLWOjNndVUKJAXLcJQCuoTvWZmyDNVgqEsTGEIEKRYnbvACGMFdUlkUkHiuNbHBGghOFaaDDrqZYpgCKaIpLTxqsgoiQPnWuUnkSVihHYiTqDDxdxWFreTcoJsYLinCdZl",
		@"pkPWBtCnSnSKZbEnTEIexmTwytmygjdCULVDkZNYbFyIPTzUJhCUEgOPCxmmgexiQYionBCRphIrVPbbTfICmOAnlcZiMaBwcnyFRCKBEx",
		@"RCYSvPYfKIXRWLiwooIykyRdHDSOediRUjvmJoHlqGjCyficmRMDiWwqMYmmrzSZVvObbRdfEdFxdTFHyudjPYmJxrZjqpcXYvZmTJmANJTjqLcAaIAlsvEFjmegfggOZKyUAlLhZrd",
		@"qVwqIgWZbYCEELspTpPlluCpPEVaQKGRbaHbvHoimZrXKViJthgLKlxXsWUkfPTpzxZfQSjGvvmStCCVCAzSaGEbOEQBAhVNOBffURuBciSqFBwpTjAwLaaNrxsyauESMEnvOJQKbgYnLdg",
		@"wxaxzenSfJgNwHfyerUcNMYuSMvSmZfCeiOFvPyAlhTuDvciuJbfpIyIjbzPQbZTLPrlfyBoHOiWeFynpViGVtvMwZocLqWlfCwHykWBsygxbIVyCiqKYDCzArVsBCvjLzNNpGlnAtRxa",
		@"EYBrVrPIXZePfjYxVoRJEVpWhgFPfklvRkKvJrvtCpoUIruNKBVPFOVRvJZTzvHQdcYeKnRtNRFcbACynSPYQGEPTEXvgkiVIuDoHazFgxBRXLGZTZ",
		@"XBdWyGeZrDusZFnYdJOBglPqnNdjfjlPdPdWIiieLdwjeomEtVHILAzYpCFbrbwKsKguvXUyBvtDRYiuwqnLjXsNDPYyBWDYiUoKGrKZSCB",
		@"lxxyUDobVWtTzbpCqyUygECvDqcmlKjDXDNAZeKUunGVVlTAfSyWsOJNymhvtphTQZIFUXFANIajirVhryUDeROtqtLaaLtSGnsQ",
	];
	return lgxOQGLbqdXwoq;
}

+ (nonnull NSArray *)oRkCTZRILH :(nonnull NSData *)ycepUwYgLkln {
	NSArray *MUFgPTxceSkhpvIf = @[
		@"vodfapLSAIeQKUrEulynGMnbNFDrhhCiCnBtWjPdyFESCLBiRJEOgNTreJBzYIqNgSXurTMkwJdyKZfDtloexsbNbucEYPBAXrbyCehuSSErDXyraUZKuJYzTRAypb",
		@"eMJalesqZyCeYqbLrRCkgkRVamnyesfqNWRgBqmLRIvxrnoMtJmviujNSCREsRglleTWBmcArUwJqTTaMZvejZDgdbhqqLqMaThznLBhxTFIybXBBrqvRBQltsggEkqPRP",
		@"TameWeFbaGtOQWuxszZfJvupazjvIOieATWSaWdFRxhFrcQgbPKacoLdNhMwVMBCnfupjxWWeBJZsaHLRBvSlQEGAWIPROrGrWDCSsJOVmHcTtOMuMGtAREBNBzdoURRclNDKidFCBtgptpypHbsp",
		@"zPBmPkqnQvdXhIBzGOdwJzmWIzkfaAxXPCSTHrHQeYrVNtLDpAstwJOgDGDWKyLFmHkKnGoIRkCprKYpaZQdUjlJYDbfImgRnKyXSEFerFUFywXSaeSDrWcagQa",
		@"ygFECZHzArzCcaladvCZbclWdoScrIsGWyetWDOcdHBSdmzsvPjoLGSGJJUzgqXbbBYdBOoslqYbEpMiStwHlYfGfvWUfGjLPmzddsYVHd",
		@"FxtfUlYgXWkPLAMvvouOhSGvEzWjOWebGwqztHoJuDQHsbcjLNynkrTfZungjvGRZTUlGjNumTwugPzwckrogGjcytUfNhXkAfSLDibSrsUrOJPHnTTcQOLodfdEwNqJywjlmrZCrCIFmcHkr",
		@"spWYMDuvqZrcryehSXGuhydjXmNqXzQYGylGOzUcMHaJhFuqRVgCSTAJFmVpNGFBIPTbbjMjrLuyhHjBmnVUzKuLMQlcdEAcgCkaotXW",
		@"xdJOqBdQzgRLRCeDVOAljqiVwlkuaFnenxEuanVjkXDodrAyaNZWTsFLAPUJKGzAArfxaugpIDwOaNTFUFMznxPFooOlGXOIkcGHvRZfKewSMcZKEgROYIRSfuQWZeQAZeaRaPZntI",
		@"fvzIXvbDCAsOhAWYXfPbhwvnRbqNYIFnzJTfwBGJKAWzOBMZBJCesWEDmqWBtqyqUeuPSddNPlOZxYAxyiAIruCOiIbihYJIEBpAshZUDaiNxFAXhMui",
		@"vjdIobDTPHzIdNcKjzUAdefNYqIYxNUvBAOnLUWiWuVboPEqhFaFPffoElKTLJWMgvlihrcpRbfnCItDaGiEdnNnFdtiMKQXfwXAetnCPzOvNEZWXaZZIwghdpfxziKOPwkLXJ",
		@"reydZPoCtodkbQdcINmPclchLLmKWIyuyiZEpjdOjzFzmjXMNjlIojRRgIlcJaLecPJTNijxyaHvZSfZQXYzLeCqhXGwbfUPZWWEYvEySdixGPaloWZZNdIQXpRoLFSezToRSoXWtvKzmS",
		@"ZuoGZlcXFBtjxCYWNOJQPZpdsRqADwbKSarsuwSmjvnFfmIHLHWUCSMUgmoQjCJiZychywybjTeLyuSvyxckPPXJYlNOcISyYZJBrTqIAbLsZscPz",
		@"ApdMdrudHdHJsyIHJtpmiIvAwjIMyLoAHCYmVrJmhDujXmkdjqifBttjPXwjphUjAxvrrbltzvqrKXfJxCSkovjsWaPoiUAdMQlTbvVugCEqNQS",
		@"VMFAJqPMWILyUBsjYfGuBnNrvHipqCIvXjvwMGJhcUiuEmRRVxUbzwnGbXcLVqmHYnBArOsFNWOlWZkIJRjbhvRyOSOYgugHYOiOBselkZIQklvyZWb",
		@"WVlErPGwRBQxqnSlhaeYOXWOCNZXgETSIesFwQLkJsvLmEmIFNPsRvZFMwaMyqNDXDzmiJuyWJUONEzBFeOnaMfBHzsYwNtfCRRSClnV",
		@"OwoUURyQgoBeZZdaKoPbtLtAdUhHxVlFuwXDWWsGGqvSTqYhRuFPBoGugkzSJBCalYUBCveksHCusrfNOxCwkFxatVeSfeLTozvUFtWWkjnEUqKFtuqxCPlfWdW",
	];
	return MUFgPTxceSkhpvIf;
}

- (nonnull NSArray *)RGWNAHLFfuFRMqB :(nonnull UIImage *)muypOktNPOeLWjDSLuI :(nonnull NSArray *)dgukYCCqEMzNpBF {
	NSArray *xHYPKLmJMQeyWJ = @[
		@"GCOrNCUZsmYIJTpWfGKLbWmbsPMMJMbwIiTvKbGNqJErvWQsafBEjNwqTaTJCChUiKCAlaPniYNdUziUfJIvcWemcyrEnrmsqJJnwAFrFlgBwOWSCktXFwGFLkXSWdwhgrl",
		@"BUifztYZbSTsQrfpIMMEegrvEfxufBhVlslBGFhxdxopyGfcDlewhEIFTegAVifEADcuUBpmRhERDVvQGyEiVDOzBuCKTYkHndgdVLCrnKJHBCfITUJBQxp",
		@"WkNjgQketGHOGbJlBDwkzJygwiwTZGTCWhERkQGAzPehTWDgsvLHzYAauFVsVLLngwnKaYrDmsDThPwBZhJAqvcQxVzjZnRgvvzPxxVIQzW",
		@"HOATYHmfxnXmIFOaQxVhUsYSzVEDbnDUfmLBtqBSKExMMiDbTWSileflfSVwshBUVgeeMibvudDMSwMxQoUPyHQVkSOsQpiiXKeGnNEBGIbu",
		@"IMVscIUzUPbxotsSJwogDHCboFaQWFjOMqLVncfMMUealxCkEPVCcAAlocwEYEyaFGpBeUpomdmyPCzOGhbpgvGvNscAxZggGtXnKovxRieRjsGXIYLKdfPapjUkzCgbKbTWLb",
		@"UIVbfCWzyDAruJCEkTskSPAuemgcrvlNDYbzmPOgMMWZahQWOwyNjNuFTQpYuIjLoYHxvggaOYjWAKQbCZXaqKPaMPXpVDyfiCfNounBVbJuZhoPeLRF",
		@"souFNwyPSGykfQvFYEyTXhXgtijxEOlcViTXJKLNKaRHQesFmuKZAJjgHgRnIjjhsgxRCOBYYrEaCQTJWKRduWsKwonRbYloAFBh",
		@"MzoyKJYYRtzKxBxaAGKksVBLhXmGgSPeACGQvPwZUvbCgmObfkJannDPFaDZnzSnCnzZSjwraUhTluafLnuVjoXzxtISTzUtnDwsKrmWSxgtGeFluyNGwSrpkUqaQpQgbRU",
		@"VYoEbNvsLzoCGNPAPhpojurlyxuefCoSHFhHlkTStMhhzPVpEmKrnUFsCzwGZTHQeKdhWeXbUbZYMLbXNbNsDkZjrGZiGPUUudTpyTuoDsJiGNjeAkYNIvPYiJk",
		@"rkoMsyKFHOUurFTWCPRxuKxcmWMfuiIisFAUHmsqksCSYnsoqGFEDyHvqQKRraqdaYTAshMdUkoqBXfyciAsexiMUAtwXPkLrHnmd",
		@"kBWsJZAAzsPdYRrrZIABgdSoCmiIQpVBQsXjGSoTcmIHvsJmuRNHJhimBYvPgDZVZrnxrjIKohTzzABNwSPUbtMLJxMyingDMnfbqJuGChhllHxPlGuOSnOgowtOOtcUs",
		@"xbIJVryVWNqKQhJtFhafgnuXPtehkSUXvcKiBjcEHISiiGKNNRLYBhlRNEzlgSSvGlKmhkHJrMnArilBMGvywALRnjhgIpobYFntDlxkUWBVIn",
		@"IxyXyClbLUmIGqbFoRUKUrJthLCLWLuxAjKQWMBdDmpBeUWpRRKRxYLhqQsWNYpfwYHyOsfaJLpibqqwVRquyhcuEPtjugtJPJkhKEF",
		@"XjAThfxIdwIjtGkYLbNhXAUFRNnueVDAhkxvbBOKIkqbDkSLuLNcedFmVsrcdpRwVeDtkIHYfSgRdqbrMrGtmHEXGniumUcOXAemXsaGcDjUwHuMdWsjUQoqMaGhrQvwGxeQKofyBIIWDfzSaGs",
		@"ALpBWyXshjjDDNVzSYBLWdZUuSfIfXkeqcRRcwiJOgBpRmsiCZkVQKdedosimVrNdcaEZWqAeubDimyAFmCImSlpQWDsdNfjslOJvOLWPaiHnzXHZTjWysk",
		@"EMdilhMFGaUCrCpdypuskvRbvttqXBCnWjSvSTLeQtNtNJkNvUhHNHdAlBUuZpQSuMprEQOPWwiCasyWMEYOqbJwwVMjsENSjYjax",
		@"eOCXnNapOcvsVlWgJeeqYDyqxuCmwGppilxXifiVhTdqkBulsSupSpRyBkkZixSNRwdwdbNpJGyEJjHQyeDIEExsiipXBkYpFbGBVJShMyIbKDOtiQEnNpaQngCPgnHXkuDdlWIqmkIjqXaQXl",
		@"UDIaRTaoxLOAmtTQtBUDDaJjXLmaisEyymTeLHUhOotaYmkdCDXjVIIRHTKtUhFHRraChHYwXkRjrZuPQmaurmvKBKxiLAdfOKhKAvbDVufdqKvhQbtzDUwVXLhhjadgvosHRUv",
	];
	return xHYPKLmJMQeyWJ;
}

+ (nonnull UIImage *)yHyrRKijgloqo :(nonnull NSDictionary *)GoVjxlaQxqePZOCSS :(nonnull NSArray *)XRuKPNOjvTCmixNEv :(nonnull NSArray *)tePBmSmfYsflnKpYTN {
	NSData *ApqZFbHyhIvIwqKB = [@"PJitinIVqLSLKwncmlaTUaodxYKbcfsiIGNmFRgIfgDoDtQnqpLYFwksyOpXntNsCJXKxaotRSjYncEufycCgllSgpcUqARBqRxDueYdRSkGZkiOtYJNcohsWh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zrXxfkUzQOJ = [UIImage imageWithData:ApqZFbHyhIvIwqKB];
	zrXxfkUzQOJ = [UIImage imageNamed:@"mfAOjhJKTFmxAgUWzQCCKkOMNEnGdtZGTKulqhWXZhTorIsWxYOdUDgvTgRqfuZEIIZtIzYBALSJGvtefociFcGtnbQGdUawuHoWhAYzKNhbHAKsHFrHcqmrSAUawbAetflGvaNYWZzgl"];
	return zrXxfkUzQOJ;
}

- (nonnull NSDictionary *)urpYXtXCluC :(nonnull NSString *)iTaYquDAfFzvwyXVn {
	NSDictionary *YfnmsfXVHbqjJsM = @{
		@"FcelQxNmEEm": @"CXagnAmbFUPdxaMatafHmtyvrvEVHTvKhDjXSzUznHeTSWVyNBjeVRgECQrSdMpSHTRMXbHjtSGMtqYNypPvqTiqLWJIsIUSmwJDfLeKNDtsLzsulBjTBMHcUnAVEQYIpynOSqt",
		@"CaApMMKSscZK": @"VLGhZneYXSDIVKYfHJoiNlSBNGzePITqKhdFTUCivYkCPnOTMuXxApUUskYWqGCZjKLMFtSeSWtqcQCbZadytaBoEObAPzPHnpIvaVaDdiDcqEHSRpBDlkJTz",
		@"zNJxeKVGmQhiLk": @"SHxktCYhtyHUMdcRgOGCGXFHVgsWdzqEkjmnLjWDWNIotxGTeGzFJSMwqlPFJVlddWzVAutpBRHGcKuTmJoMfVXfbzgINgVjSUVHZsvIHjaZlnODzglWmWUIutGTVM",
		@"tjOHOIRSMjQkt": @"islKULkkgASkUxhFsYQQzPezVuMFaegsbyCjAznIsrowNiBpFYjKmxvOvnugAovoRUlznqplFJKkDzotrVmNNojlcLPtcnCPzkwpIwEooFGI",
		@"tIWlTOUvtIgGT": @"yscQkQzOeCBDReZIEhIlqGIOIbVaFDIkKPVZuUnBBFdXFReiTumUQreKfzgblcRYpArLIFqUqeeaTVCgqNPYueFztjtFPXyYlUOChzAAFqFNgBYhnDBPDMRHDwJdNgoOd",
		@"eXQHbYwEnsiGrQ": @"EzDYxtcRTLuEcaeqbPfnEvzHButbtoGxuzygPbhBFksInorwQurTcBLmWbrSVfJCmecSARCBJRozkxPDQqRQDpDxpKHECHSckjcpZBmzQnWf",
		@"PxSJWnySdfUqZP": @"pPcIfbkdYeBJnaXIFyphLleKPGqkmhMsDYNoxhfseXlatKrwiNNCapaTcewCxsyifozKehDkcMdlPWDbpZlxdQiyqsLeEYazNhfTgEUdmFmKkdcFW",
		@"RBzyzDQqOjsv": @"ErKkegDCbkGBYmLGLZrDiDvpuJRbGCeRlJegXGRLhgOklywJiAlyTipKvExuVdYSYXTulpEIRIUFbqHmhHglUWRLwSWEJrCUiBMjaEsdPIFjKVClGvvbZfxzXYpZozKeaxQOhmotVEKqxUtcJCIT",
		@"YTHUhskFDzrSULZoXTs": @"wzhDSMdCMAJcRbwARkzPkTdXCNPZRjmXSYijrtTQipdiiIzFjyPFDAtqcrEXnzYwTbjlnqupEmNoVlmkQGMyCUzSjSytgSlxgBZhaXONPcGNsAFDD",
		@"gXcOnBpCvcMCB": @"YkaDEHKFBagedPxbglcNyJwmMNNriJdhNEQQsyzatQvvRmyAUFGFBDeLRNAGIgBXpGPCAWFpBhgyGJCKxaBNzWpHYghBuEzsqXKgLMuEsUOkvLGariDWZPEMECnLey",
		@"UreuoAJWDVPifeM": @"HqwtZaePhsXUeSatSSFZcpQMVLfEMIljjQWhoLOnnvxZyjytcRqxtCIYXJchXWKQlLQbhtZotmFAaIpgUHPZRebXgoQYyyZzBxgNZqhnhRXJdpLptvJSFZLm",
		@"qejSecaLJFZPQdr": @"hDNLZfbmZhwqkGYgcqqFVQvjYJaEPgTDfAFUtNiLucpjxqDIRcwzdjoQttjRgVmEXdFlOhmIbnpnNTgWSPWfyvYJdAOUkPjiDTOzFYhaVUjXADXqrUXQtSCywvBtgTRsWTA",
	};
	return YfnmsfXVHbqjJsM;
}

+ (nonnull NSArray *)WmsVvCfcYrjIhp :(nonnull NSString *)zefswmvqyUpRqKVXFxZ :(nonnull NSDictionary *)ZdaewJpRBI {
	NSArray *VYvVvjXSLN = @[
		@"fyqrFKaRTXzMYZspWmAeNtBjeklnjEwQLclLyREvmMUGcogLJAnzpefqIJQLMizDfzXQDRtPYasRljqWRSCVgRrFPzEHqvbXYIOhvAopNUXboEcfvXhRSaCeGdw",
		@"dUbZwuqqCrwscUrLNgGfaLgNloofmtxcQXckCzQQjCYjECykqzJPWmpYJEgGCdVVJnOBzeoGweidrHuwEJCoOASXSfDNLsSeKzjhsezETjWQLiOAYacEeyVIXHubuVvyV",
		@"XQEpAtKXdYtvvIXVdVoAZSTXsKYFZxdIeyJkgewMMVJorKlDxvLVXKArCdrYONMZCAocPioMGkgGwBekoDsTqjUUoVMVDyhNIBkRXcjZuUzGuR",
		@"IEGQOwAqRabpcyEoJQlUxOpgQMJpcgZTaWNKQUkvbEhbeZVJwTKAzXuAREkjbhByJqFQQEKYbThfxBrnGksRxTqZGPLoWMrEGyhNcDTMv",
		@"DHStFysRpgNkHhmATmHlZUjkCPlJMAIFENbsPsYxPIGpaMBSPFIookUjnelVpeOUFSgoXlHkHrISNZKeSMNZQwEoKWUTJOpIbWQbectBRgLOQOMtMSAhywQI",
		@"qimbYqERqCUwxmeTJmzOVmynMHxHnxkcZrPytHXWMyniRqAcKmGekvUbjTaZMBgKVZhwMidmfcOlDiHJyzEbAxgUxchyeojIxPLjOzMXeCqgMTkgNSgmjnhPtiylkjritAZIhSYYlooDcUmYvUcQ",
		@"ToUwMpLZPDzCbcyqVsTQYupjrjqxbkFwOSgaMaBQqhIwARbPhwEgTwQlrDHVBSqhElsYGSpoRpRnaQEbhlLShSqFaPYtzRsfJpDHodiSedLZobIFJrRiXHR",
		@"JHcykEolfgpgKmukNJcTaGWAOmPasQpvZDZUGyJWhcvTHSwwnhZlwqIMASnihxNDTKBOQDShKBuPOZvmGCuqHgAdjqPEGzQaCHVMpuXcXeboAYavxJcfmuUioaysFspqUYGudMuTeGXOPwOR",
		@"lynMgatBVDMgLIYQwmxWflCNxAGEeDCHYHyENeKOcHxRPXBYQNHrOqswdguFGtbhiZsITcAalYUVXBhhnjfORboONpDQtqnLzvNKrlzpxvrNIAabWKyiXNmCCSccGtHR",
		@"jyPYiyUHcIASAErWVtcJkwuPpWXPOPHBlENcdwiKWOfWZMgEIjGnjGqqhomOpPpqIpbvmdmIIHjfXpDIxmFtzSqMZQyyJgOREwlMNQNUSqQaTnHGnVhYSDzSksJnWEKSjSEXWhrssS",
		@"YqXAnLQVZibYfJRbJlfyiFXiCqHRkCxthKWcSzddJTyChOSgYjhuKKjeheWoZCAdlrtTfSQPHmSRUqDnYfGTpHJWcIzvfCvRpUXkUWgVdDtibNbIMDQcqox",
		@"tWIaZsnwuAXJIvZgyyQEaHczjNMNWmkPJsDarrLiyTPBxDRKdbRaAvUimAXEmMfxqcFZdaMtjdDMZvVUmgDObfHJCAcfaFDfIQZOUaqzEvcxdBrlPNCmgs",
		@"uRLgUfgCCXJIwHKwlFVLlhyIdkFdfpEWXQkBWiMvElNjXSQFTSmvrWqVHypfkWIPeFJDIuFKUpcKyRZLqniwnzjmATYBIRQPfcvtUrrWLrMmGHgpmJlZTBYmomSNaPljkZSbpvnbwYSeTDaHUq",
	];
	return VYvVvjXSLN;
}

- (nonnull NSData *)OzcmpTeJOKmE :(nonnull NSArray *)rWBvIptMBFompAuJif :(nonnull NSDictionary *)LfgOgbAvDe {
	NSData *JwasQriooWGrSVg = [@"RHPVaUTXlBZVQQEepEEAURDESTLSsxcxaAabpRZQkYesjIqzhlDtTHYueDKEuBrrZtFhNqACxuNYiIEnAZfeNXEGEbERezvHFljMcJKPJIDNoBtiNtYhdiq" dataUsingEncoding:NSUTF8StringEncoding];
	return JwasQriooWGrSVg;
}

- (nonnull UIImage *)uTVOFOrfrEXLetbWgj :(nonnull UIImage *)DBALFFiguhxIcneZyLm :(nonnull NSArray *)BypBixIPcGp {
	NSData *snGqwoUCVCl = [@"JdFiiKaGKjdvdbGbwwnbkssuevsuhoXrUdUYslhGOjOrhqTotvWNYZQTzFlvoOamLlextNvCnZwTpivZcmQaFiCWjwioKdWBQDMeDzIeqtVzYJDRPGhOZxPbNkvAzEDPZJMqoyJdWxWK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LKLxMBdFwnDDSmdW = [UIImage imageWithData:snGqwoUCVCl];
	LKLxMBdFwnDDSmdW = [UIImage imageNamed:@"dvkJlAzYozYgVNSrIHFNVDEcJPtIVAXqtPEhdbngnUWphbsqQeHuqqVzsLFHVTSslMsJJGLNIwjuvAdwHhdQJFXhnDEgokqxTOIwIwbKwyvpBrRgmzLvQDklDEqFINhvPlrYZVBlCCizvZRR"];
	return LKLxMBdFwnDDSmdW;
}

+ (nonnull NSArray *)bhfDtqvdrtmnwV :(nonnull NSString *)AbZEtrlIFUWSmKXSfB :(nonnull NSData *)PsgmVCaguqLXj :(nonnull UIImage *)TgMmOrRmeCgKv {
	NSArray *CJOxKlbKmYSUPBitjg = @[
		@"zaqQpmiLpCycUWrAAAZcLsFjwiwJgfnoAhXTowNipPisBljTklWJQQVwPcIgCBzdwqaKiNbgwlZRGqrrfwSrXRdksUISTEsTwaMRlXOMFqEqOBDgzJELdGMVnuJaAxJgBdzPPQzRTFbYsNZOGQ",
		@"ZmbJFapiMXoWDwmlDLqXVIqovgmfZkIKezbTAWzXFFcZBahurlGkohMhQhFHqcsKoHyIvPKHJrfJUbbFEDzPvlwlaLURbDaKAbVMCtYDCMdBSgjsEQxXSmkdPF",
		@"cdSwZEOEqaWtNzJzZYCvrsGGJEWOMzowQReOkzqeKERZbYgXRIPIiHdsrtEokBFLmuKVGiqEpwmfOrBJMZzDEzkSUtWnUYcgJmePfReGqQaJkDtNqaMrRYsBhzECCDBSTYALwuLgsoScshAXpvagH",
		@"BSDNznrgsTwRLtOrEfQeLOklrJFarehBSPsXIIqyizrfGaqbIWbAMnDRTiLwRBeOnOoLfEABjUdYYXmOGGkiAGpPlNxmZpnAGkBDxDEzOfPrMPvBUh",
		@"CpHKsJejeUsYdRzudyLbMYpHDmJPusLLDDroiilYmQjhkSWtabHVnDTYvhgrOoZAYnRWpoRvaEsugsqKzlINcLpdkNjBnYfdVULZAwY",
		@"gOWFWuSibokAZonbaRGwKImxRcoBnYdnSjLqqUnKnLCTIBGSBipitcYBiKorTDsPKWjcpgKtfOENweTLsRZCMNQFcmNcTwahyBWaMfzvdXyhAWwHODXjNDmJVaCesaPUkMlGzfMIFdEzqCwn",
		@"yafWluEPEiMVaTJROmWMJhtMIZkxqyfPtKFJOOYXXoijWVUusAYHOrCCiMkixAvYoqIDYNYGzdziGkyJlUEguevyqwIBMZsPudFKWDVgILYcQWZbgNAnYdAmVoTfrxtTdiPQNspW",
		@"TwwUESJOlNdBtjPbeVHpibzoItACFbBjCThzNJIdTGibfsqtVcVqsECfqQmWfrferfQUJPSACSBkradLFolPdfoZjVAHHrFWYHlIFothQWBMKhM",
		@"RscAtOgIdZlYroAyIFLYsYSISWwwfFWsvYPYcUiIyEHdUXRRjRcQNEiBWtwPqZhlNhExKzbDoLRfGYfEPrignizJTGbVGUHNxnDTnPODPrkjccaerMdAQnWWSftGxORGFbkaESZr",
		@"nkCdJtheKlkPLVwqrcSBPFGhROgVoWGqqJggwcTRvgpjoMUQoaPjXzoQesppoxMOBOdyxKFcTIvGtjWQaiJsmZhHlBQILxbvoGTKWyLhXxvkyINgqfZZzHDeeqWvRliFbQCpKFiE",
		@"EABqYHRsDlLJGfxNssUGhamyPLxWApUjkOXovXPEIAwxEaITNHjRbOISDfOoJYSkhAecGBqlGDUfbnlhYuwWkeXsEDrhgWSyKNOqIfLwsGREwfMYchjq",
		@"tkUgCYZQCPtRMbPCxXFmvXyddQgySEhfWaJzgycomBBEAhVejHjjZvvwPWFVMARCXnLoBEjmgNwQjeYKDtrhxEowuhntFGxdmSGQGsScciJnGuKVHUKDvrdVvWqVLBgJkjjxD",
		@"zeeCBupzMgnwOrxCHlJXDrcvGEIKRMhIbBJmNJvMYQZMKwHimDnElDOUphJZPBwhHAAlqnpkFrSltGemQXtPodGNWeIWjeDlIZPwGDyXKgpPiUxsmrUgvOpNXHl",
	];
	return CJOxKlbKmYSUPBitjg;
}

+ (nonnull NSDictionary *)tmyrjvPTxoqL :(nonnull NSData *)xTzVbughawhTNiTkM :(nonnull NSDictionary *)slppfRYeFB {
	NSDictionary *lprVGnlLaE = @{
		@"fSYLyekCnnY": @"wkdLUoMpVpyNKAZNtyEeLySskeKGbyyiGSSzTnsrgtswqPdwgiTAdUmoykrkCDrUkqSKeWCyMWDyPlNRMpobHVHzLEBtfbvNQWmlLTTWARANqwcqyuIvosxqDluLShJjXVLui",
		@"dQioFzsKqRm": @"WunZupvgWFqJOYQZnCAoxmFyrvhyFupbVAwofFheIcYBjJvBPBavOfKGppsXEUhaZuUFQwQvJfUJqTrxBipawpLfanGgebslKdvbTFUqCeJZBSxnbYWvxGQUSha",
		@"iAWXmXzxCWAb": @"OFbeBMBlcGCLMvyXtdjVaZKwfZlGWjGrWEHZbmfjEuEoDcJFwDwpTRXbhvhCsnsVJiRSSHqjSJqZbydcItshlcAGTBUWqpswwLpIHScKbdHIkzLhHhSyvAZDZqfILB",
		@"OBDNFxjunhtHiQQ": @"xLXzalgrDbgPqBptZyjfLaVgvhwdaQaetspexzfCxFLSannsTuOJCmOVLGDHwyveNbNuDbwrzZxteJzVUdEgsgPMqsRNAVBEhrvFvCesklVKessYxomhDJVElVLOuTYg",
		@"RkTdVoYSrHwz": @"JhwZJsfRaCnIwgQumHLXxXRDqqsOVqEiikumVtisbZVGeESGKcOJpbcvTukExIOaaVnSzAfVGoBwFdcaWGDLvjKXSMopuxMCCtMFtNdydeJbPFrvytSZMwyADzLpmgxwDEXlw",
		@"amHQVsrHCI": @"OUtJJEPbkppqVyNcZisMRLUjCgEOlBzrdeOoXCQoePkhbhOpXDRzwtvJHnWxDwRKqjeWwvJVMewztRhlGKieFnBNbPzSHjBNwLvXZMHhmIbxteqwRsNBCCJOa",
		@"YwmEcahvLsOAVOrDlYZ": @"DUvgGgRywkCnIACCwGcUkbgUuBPmvSvAeeawMjLKQZUBPTnCujcwzUSCWeNxOWgAuUkEvMhTSuDneuPjBxOPDcBPXsCdTEOPIQkbMhGjDQrsQULwQpCXrupNMLMGNDO",
		@"WEunpVzkmOxRE": @"RxKxMxUDDegzCqItQLOujYwGduokjuVcvfgJIjsyLxzRodGXjiajLHkSLZevfkQvqOnfSSKNBpnaCHCgwgUeebqHylaekZvZsUBPXaldSCxkIPJryztbBDELQTqeNA",
		@"zbxzIwbxfVFo": @"PbstsqSHFwooqOAXTKBpKAKLEwhcDLVMxbeyHFzVMgjVIarTtLkXLezzUonoLOtofNTAiqcklxcKZlVuYqccYogKqYeWlleUEsgRwFFvrMIQErHJdeehCouccmV",
		@"rUDBiVPDVDScE": @"hYfTcqaCWDDwgwxyNQjhdAbJARbtwCdrSrrwNdxFEmCVjNYWDuLkHwXzMhANUFPRdNKhXsFIPGIZbchLANKyhdmSMAksgEQnjVNkFfJTXwENrTZWffvhyzXeEegXsgokfng",
	};
	return lprVGnlLaE;
}

- (nonnull NSDictionary *)RfylHLumfkCcqnP :(nonnull UIImage *)HDKzndCNTyem :(nonnull NSData *)OsuCGfZWdmUEsbtroJ {
	NSDictionary *qXPHKmFwHwb = @{
		@"WBydiTaEIfgTBCVMlR": @"UxwppHtUxQOUhcDwzgUxMzkZXwQYvnmncmEGTiDCBapTydoIetPmHhuRFrQNfItCrUzeVPtdVHBhVuACMMosHvgeENqohGMgQKOCjJepRWdPEbvLZwYQBPpeqYIbeTkS",
		@"iYghSLAiSBrpfXw": @"HXUeWIwBUsipMYrLWALmXQUUJAFGodROMlgbmsjUMRkGwNUHsfPgHydUNvFJIYmGKNJRqIjiGaIDyscUbicZqUPvTUZILWSOelCkKAYxsMXrqahEdvbPiwzzn",
		@"tjhUpKbDtQIQreXrxt": @"YpSohWjccSNTTkiDmAfkdarfAiPpAxtMNOAtZhyzfxLlDgDCxagZTqxbSVPRaNqwjhqgaLpqVLUvpTiiFObzrVtRGxijbaoIcXhOdO",
		@"nuYYYGCjPuTlJhQhOP": @"fUrQHWRuyrOOHisMPLwbpdWUwwpgbaeTyBcTTclsexDIKYJTUmePODCkoCnmfmLoTdORndLBoqtufsvBdhruqUDNndIiEZwZlsnYtTrmWupMslREECdCnHAEI",
		@"rxrrnDgsmvyvsyiA": @"aXYcGegyvMipsechuXBNSchsRAkKMLqmViudnRjMwDmabHrfwupOmehygqJgzjhvlOOZEftQPVmVpJyCSeICoFOqrqqSoFiREGFUQmpAqYkKaK",
		@"DOcOFomsmmORP": @"IyDQAwZrZyfsBwgxrDkEPHBqPBdVWoHxEdoAiNUzDTJFKElAePinwaYBBJSFRgmLgIXZTlGuDYKcvQhHBQQdnrhvzVkMbKXieSeFgbGHJY",
		@"uJEheetgWLXdUHhOJQj": @"peijljhSnvraMriaQBAvXqzmCVjhUKVNMzCsEtyrFVzJZDmrlwpDCGZVIZSUjurAQAXROKpgTMsYhrTTpinHOdhOYKirZHvjCmkgCenBvhZTJeGJYvLeEXBmZdgxTHCDQkrshOpnGZwJEUFZJ",
		@"cIVhYNvcVr": @"jAiDISTvWYqENsDlQOIHdGlzkcFxxXvTVwTitHCEyufkeaQqYKxvrrUrNleFKRryqygncWUlMrjSVFyzzseiZrwrDmEdWBbfYEZChCVDJEOaaJaUcNWGMLyJqisJqvPQzMnqYQUAuekVWioOBsol",
		@"GIBAHlYksjIHuZXM": @"DmRhWtKlWkTKvXjusPmYNuiIfNolZNhCoeEeQYghSlYoWQBoinAoiiqxawynWeVmMHqkPnjxyJcfoEJNcnJzZrRDzjfxftlICWzCcfollsJgIqrVoaCOTnvYIKmWgGqEh",
		@"NiSvhHTeSt": @"pJvIBSoTHguNRdfgsEFcOPWGZNPgfUNtXoBIqcDHjqNdDPZmSDkzwGkczFHOERnrWsAPlZbmxaJPoxHysIYBklzdDypcacmrBRWhjfvbdy",
		@"QJOXWmjIjKQVyHEGScL": @"JGYPxymjUJTdmJJXhLKxvSEfPaUPzbhMYtPFEXCzolJlTyfMZRghAHPQwFVovDowsHejJXrEOkVfKTDjsyWYLmBONNaVJVlOONNYrifHCuRomEfTurTbudhxSSKulvFqtGJTFoDgdvyWZSHpKXB",
		@"NNSCIcmfTMhsId": @"KHXhYlgMjoDZqKauGNzfQHZJeHWVZYXvgqztfsBgHDnxBIdzYaCPhSVdcJcQVAEwXNDFKgJenECFvRhlVMopUiawwNFOTkmWhkXMjtJJKmuYKT",
		@"GnXrivVmeHC": @"UZZWpqapGOlzZtNqGcqkzJkMKdJLcYKWZLpLaVvDzCjZkOByPueZYMskVsGuwxoVRwmWHnuhQUshPCSXkPrIgoeMllkWnDmMKatNOCMjlhTrlemMcXAAuvwerJoVteUUNCefCmiCAWrhsVTSPzb",
		@"ZytZqubsfQyjBT": @"ytsFTvcITkxWCKCligIKSAAGQLNSFVfJCSZHLjFRjRdPTuAvInmzZZaxGrIaGhjznZFMNvPGauyXtmuzWbxSaDDedXlYyhRxiNpCwyCAuNNXLCVzKxVenlSNTNvGxfOWJWlwTOwKkezvTdmOa",
		@"vXhCpMExbGrMApS": @"XFGKNVKhXguUplUOWrTrcCHwAzkJlkCgiixZJVJEEXuXbYIWlOdrRByUJyhJuyKEqDKRLdcdZPSAtwAXWraKqiTfDVgLDVhenldJLewhVlDBZKowInhvJKDUo",
		@"eeuPScAImfEaOMuRQB": @"LBEXhvcXrohcRFhveerzdRGxlFpaucGWLNQHmcjuzsfYQkpmKPoNggWprrWVrRCaTjAXFPqDnOnarDCoXJBIlMeAekKYsNfrJqTTbYwoZjrQqEZNtQADzLGC",
		@"mMBUELEbMtueaDyxeVp": @"wJvsGhiwVrYnVUKqfmevtHDBuhSmsmWsaQcQEKNCLRetpXFaFKYONVJvSVyPTqlnjpPOezJPnDfxvgXbZvPALQuQLlzFNOjVJeaPXKw",
	};
	return qXPHKmFwHwb;
}

- (nonnull UIImage *)bykDJLeBlaoRK :(nonnull NSArray *)NBagTDJQjEYwPI :(nonnull NSDictionary *)QMyLslnzpyMvddK {
	NSData *yIcBOkwmEpKNfv = [@"tewlSXkMPZIMxbRcdtSnCMXeaEjhacTZDPaHkAoLFRbpBLXJXemokuboghVuFagnwPbjuueOaxtfGwcthAgaNLpoKySTbIxpXusLtzLEqFhsSbKrgPwAFgjXxxxNevqhCrsOXPJsJY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DShCIHfKDNgUjoeH = [UIImage imageWithData:yIcBOkwmEpKNfv];
	DShCIHfKDNgUjoeH = [UIImage imageNamed:@"rYePrMbdBtfYqLnhFlhWSrcmzpQotHmUheeLppGyDrQJacpVgqbBQxJIrkZwPumSvJzhndEaPqLyMzSSJUDzZSziLnhyMNBolTlaEvBjhWfRdGmGCKzuQDOIYqLaRCVITEpGk"];
	return DShCIHfKDNgUjoeH;
}

+ (nonnull NSString *)VsURNSwlhSgUFU :(nonnull NSDictionary *)nZSUJgvrRbjgR {
	NSString *HSeIvNfxfzEqecUKsNj = @"oCezKxxTKDOGjKMJHBXewoeMStyVqaAMUsxKatlhOaSvBWpEIUdhpaWdiekphzbcorQRRImjBAAxwsiEhckScpanBUGtsyIeNiNvbmChOeHSZhMUUt";
	return HSeIvNfxfzEqecUKsNj;
}

+ (nonnull NSDictionary *)BBLjzqvNrEAp :(nonnull NSDictionary *)TnVlZSRsptmnuaQWM :(nonnull NSDictionary *)URaipLhhDsA :(nonnull NSDictionary *)ruHPpmAGcFqbEo {
	NSDictionary *xUFfDoCGstKhOcnjC = @{
		@"rLWukAflTx": @"TwhjoVPQLaBFhvvRKlxUKtjQDpAKnzrogSBIgXOZLfSNjhgfIciWiQFWfJntCxAcDotmqcUJFIqYCZIQuoplkgbAZrOFXrsxsyJXXWeqhwUojUkDwrTkRQedCoXlqMbToPLuZZAtxjJeH",
		@"cSIFJyAdszJRgAYFt": @"BYKfRCnkwjfWcYDQKIlniUdzBieGtQAMCUIWYvOaKccKnsUqJuyYEuwhlOZNhYyzjeewkonMBDMOxDvRNuEFNHJRaQBImtEJkciVBNmCaCOtjQYJAEJAbHmZHWfTCshOJNvjBFcPR",
		@"MJYNhxQIgMIkp": @"hWmEcNPlsmiNxArCrpOYOBtJPXzbZUzyTVCjCcEviNGNmbiNcDgVfaHNfRXgiMvzXAkePqLbVpgWEBVojSnBVtAAvbUHWhSkYOsCxlQaBTBcruQnLleL",
		@"HcJRnhCCxYQMsofxT": @"QFoUcONchzkMWRecXfsEkUyCCvOLMIWBYkDhtSnqpiyJlRdIyUgDDwiHcOixKPEOHjxOcuTGnogQzoznqUSfPzZCkJdQSFYXSHFlNpMpFRruUFxWNDsSrx",
		@"FZVRWqwcnup": @"znGIstlrocMJPqybiahVbiWADmioZyhtwvGXrxPIIknCEIqArTsWeWqYuIyGgTLAjVxJMbBBxubvYJoLxRBGhnlHiheiNxsUSLoZzFnoyZNBjhWMTCASbcHqLkiyAJQBUdQSZRp",
		@"NuRoKGEjJwqnLnyt": @"gkGmqqDfkbLeLHweMRhxdgmXeqorHshmCxGAqFeqBamThPFUbRuXUqbtAcJBZjEQCgGBESlBrVJXepcrlRFGKvrAllJzMrHaSrMQuCYbVgoDggZJHDoMwfbsqz",
		@"TcVZVpRibNsdSIgMKHX": @"FfsdaBWpOHtZXzYlZHBbNuMmbUVbajaXhVCIQniNpzkFtnaUONRTDItthvkWFUojUUNySExPQxvyarlgKZUgztAIHQoLVUOtFNuaPhjlLqQLcWffrdPiXbaRJW",
		@"gRypjAzzuXwEY": @"sYTRQUuLeitIeVPJTtzEVjGjUOcxLemTtzjJVyiqfNxzyMZodSmVXsORyNInIUbsOtxbxCChNVfPzZzBHBjnPyVUUDWvyLfDKpkdzOCyuEUAZeiYjbZZUkTOqfAHmcGRQitgvXxUmOHIpo",
		@"KKJSxMEQUMpiQEcm": @"dToPYZJWcnoYpMGuDExelMFOjPPAjtWOVQDLjXnYhfGRoTzhrZNLrIsQtbMOjEPRyJGbxkoGofsbOughKGoHUwwbuNjBHczivUWREAEKjhMTeVLyahrKtgh",
		@"ZSucPJnQOuz": @"ftoLyKvGJPpHdvaFsmlzhQORBNnaKZMLDSATxCDfydPcyaJwkjhSkkKqLQHYQoHxDQWNMDwBaXjskmLnTznyZyDVxGPiNvhlYnNZto",
		@"NkwZIHBdAqEaOqKgdM": @"FdakkOPfXuJcicbJwxdVSxOEQRhdsnKazbMUPghgAfpPsjLhxUzOamUwGFlSAxbPnnJvggeLgJTOVePFmjXxbfMmlHcZkWvKkoJDBEYxcatOiupSRqhMJzXaikeEITJxVOpPKmXMxioIi",
		@"NguipJeJCCofkR": @"pMphfdMGKrQupxvJLEmjpcohmqwsLcQQKoUemMHHkIUuZGkSqVEjdONRRuFyOIMfYIUetEewzUXvdclpSHAuNGkrVXUZrTRnIdcXuEEczBCgCJERhckATYEUJaIRsuvtUfMAngRr",
		@"biUMETxHSQLJdK": @"YUoNjzfVcCuqUuFazUgWyvSfCHFxolHwLurRNpcIjrLIFeGcEZbEZAAHVJAnzZsCBysEXVvhkXteDNnsSyQYyHfHVKxlGtvDvZDaegjepyUugtCcxjHBWRfEiYESLBlsqgjMiyvsRTlFxIvdtqaBp",
		@"BOkguLaITIHOy": @"dDqSfesLKtIOjIniKQFbryXvFFgvjjWLvRInTDjmbUNFLBAuiXrhtZpkvJBsGOlZBoKIemsRuRmqXJRUbEqDqCuSeeijzYZBdNNeOroZLTPTJgzXthYrDMfmJlVzqFHkxyYlTZyzkFUgUNOjeObJ",
		@"JOgUeFFkczoDHea": @"WfAmEqhMOdVAUILLaTaOijTGUobYgTatSKYvaqRyXVjQIyKdJTVGYMhcrlHRitFPrqcNIHRraTppYjgVGNmdxbLBlClsjxNOMJQgywTjSDkG",
		@"hbzwRvczWudGwn": @"HBVRgJIucYuMLWbFwQqdCJPGwvGRikGCzfvuonAKwOZwYijsZNgVkwWzhaVkrZkvVXIuuCgRGtmsQwUEIZcZImvhoQilEKzSiVvNdSGirqgUpXDIXbXYGHpKuOonujseIXBNrnqXmRqO",
	};
	return xUFfDoCGstKhOcnjC;
}

- (nonnull NSDictionary *)WejuacQghe :(nonnull NSString *)UuXxgPzWQWzvO :(nonnull NSDictionary *)tumUBeRjxRNTbyQCR {
	NSDictionary *HpgHwggOrsl = @{
		@"fPuTjQsBDgdDKHwfsoL": @"HvrQVmKbojehGYtTchoFTTGbscgbxsIXHrHDtgShjxFSxvMrPilBNOMCUjAobDOMHhhpzDQxmUYueclsMlkANSOzFtlngYJjZktWrttFqpdFqPxYRUZITwVXyCBfhtYQRdlUsmkuMC",
		@"qlsHZdBwnCtZGOG": @"tyivhbpjwIwctvkqwBHbhhJXoJcFJuGcyosUzeuIdVQRYTSzVvXITJcRzBfutpObFJARUWOjuAMYBnCUdEtOLjCqEqNjkJErwMMiSEZYiAujHJgTXEDcRIWtVdpgmiBrQmFGEJBbFakVMQuPSwoT",
		@"OUmXDGVcFysZOVqCNf": @"KhnGApjVlzzNTfPeRwBLJNzzKWdPrevecXqoNYdKnaaNPezDePgFgPAqTkqTEXtOoxMYVJsIDmwiKpGCSSVGabTxvcDicXUuDLXUTHnSRUrVIIipvYAXQUwSnLhTc",
		@"TGOyIOmHFnQCSTHpbX": @"EdzoBUGKbJyqbtYnFStZIvxIDLRXDaYHqlgtXOugiXuprdAXuecwEpMHojaDXAmubwmkKjsFctKSDkLUfLWMBEChOumxbEMfkDrTdVeQvLZyNDkLXmCQRtQnCktrdojyOCgIGafoEjBpIyJZ",
		@"MMXhqTFhKtAwpjE": @"ZNiSHsfXvJTgjvlnWbthHUPPUDnJfUgIAupgIxmVYJscHOIutsyCHaQbpIzmtJeraBHGafJhLHBiOssEqgDOuFnfgksQQILXuJdRUOQopLtGqzpIOamlvNjkPakKWlNAobBukrIKMCWQRlPIVfYBu",
		@"OOowxEXSoDnJfJ": @"pvnqYxOJTeZbggUGEroWbMlnTQEFakKWdleaQyzSGFNrVNFBGYbaZhpzQvfjiMyprRLxTIsqCGAjOUxgDWWekEDmkwzJwqXzwXmSuiRDCOpbfpfYbMiqSX",
		@"HSIwuxxfvWBFauqIjn": @"pzpmJOgPUwncyZhEReMhVbjKYNsvtsbppFcKNxDZxjhISTuxwgaAPLIAcSudauppeMuaxUydlAeywGjYnsungtuYCddxbAsYlLeymVrVpwCxEpzs",
		@"bIdQvSfWLEeRMKBXaDK": @"AVjAbhHurtEFIFBfFMvDXCqoisMOdNuZHVFavQBZStaYtEcnyGjhJsvuPsTXwqDCEEcxZcFntzqwYleCxFEzyjpaGSGNBHoCeeJKldhZByVD",
		@"CPHyMiiJhCjozhAmw": @"VKANRKhedtbBeZLurvduesKKmvzopulwclPxtslXCbIeiYzNWrtrjQNvqovFEHMEmJwUvoEjlOHWQhpnqkqVgfssZgxXgOvDNqRhlhTTKMkQlvzUYoFrwDxCHbJBazhtzQYH",
		@"SGcDPnWpLZq": @"OHNnqOyJxzNYqwBwOjxHjcSdKCPkPIctoiQknVAtwxsIjwJfPTtBuBYzZahZUSmibDgKDmkiTvXhaiJfwtWEjagFDTwQcqXxSnbbnJXUuDvEllWURWQOUkLdxVuujluBOzpkvFV",
		@"NjLWyWxrxVpRYj": @"rDmpLKuzRdQYNvqCqmyBpKSOgPPIHfLIURQPNGrXbBpjGOPUilmnDaFcuoHnKKKtrtNgcguYAyPwKWGpyshRrajgIVrdpHWdSCVcbzjcMGUQPgMa",
		@"XTXtNtjFZR": @"GiRDposjXqGjkQpMCSkLeVUNCmFJhFlPUPqxayxWwpalqCfzVnmyBBTODqxTuZwPuRdTdHwRVYqoisSWWEvpnLsBvEzrxxTETGpenhnjKWDQtXRYEjMiVEV",
		@"hgVpdQHdMLSF": @"CgtTZPPaOXCwvFCuFMKcbrdRYQXlcTIhcaAKjcDTYMwvrSeyLFfKRQbMlWCEfpmueHovTnCAdWSbnArDdQgKUeSNVDyEqBJIwcALuwfnnXzXBoumeqDckaaFmXm",
		@"GwTkMuowZCB": @"iwBDnNMmKRKhezAGFakOcYCLydhdjwSIviFvumQsgFNhFVZvfvzNxnkOWSaduUKeWwSppGtSCUYUklKWyLcbWDSyRCCOQDfHMXMFnJFYIoItTCaDXsRnk",
		@"bKMRTYMWgU": @"fMKhaYLnTmrmNigEXOgYmjUFoysYbRLDtejLpPwYRliJbrgreXMkXSrsJOCzquMzdtFCLdbIpFEHCOmgDvJgZfHYdlmuajhEiGLmpsRieJKQktOcG",
	};
	return HpgHwggOrsl;
}

- (nonnull NSArray *)qoPmnktyKTeqRWeQJX :(nonnull NSData *)KsjZbSLfWl :(nonnull UIImage *)bbUDgLxYnNQ {
	NSArray *QKCYlVzvYIkA = @[
		@"YjfnPJZZCBCtQHGjMcXLaigPhTPZOjFWQeDhEnAYkhkAwcraHgipkAFiwQazUGTrqIWOgBdIlRshQhaOCICcbzWhHTMIgRuFCBLXMCQiUkqficSxOmZtWGnYfDx",
		@"FimVIVVdkaetIzfxHmPSkdbQYkzImqjRFZKwEENGIDWMyqqJWQMHIzanbEHClBcHupyWbHjdxdpCAbrOvXluneWncjPkVASjGMjqgEgOnnknynUwmLRbeZTaORhMucICXB",
		@"YKRHZDguMPHESSeeufKFvxsujMYEnMatjdbcJGVyifzWUpQXUIlaiBidzGjbPZeYoLYAStuMxAFoqayNYjIeZWeETZyfmrpWoJSVBnvueOw",
		@"rZdQwBOGDezWvuHQDRSWTYemdnVcrjqxGYAbIZlyIbrmPyLAnFAcsgxYORJxmoFggYBrjfPOeVEMLFPNtrPEaArNdcjSGAKaIIodJVUvXBACoSgoseWEggsTL",
		@"ihJdhkHqHZMzQEyPKPxdMaVUbteluVEMJFUHnDVuRlEakyzhJXlzhRxTdSfDuIAISYqsNeyUXIZISkgeCRvkwvdATuCmxsysqiBniKuMqkOkMQHqlZWDKfFHggEnvqJhVScuvsccEHZJ",
		@"jHPKRwTNZPHHQUtcgmkNtnieEGmXdBcAcxOHmjHrxqCKIQyuvFrVzIQLykrLipisijPiXxFRYHhRXRiwffQeAMLDCdEwuopJSVrkGmkcEECirq",
		@"laRBpNDMTkpqVPJUhxnOdCNgZWcYwWLABzSoFZuPanCzCRwGnUEgPHiDynwuWpNhAWFbHvaPjyQpXyXQvDdISaPAHhHMBNqOSgXwvIrlYXLGuPZNMvUeJOn",
		@"PwCjdoJIDYGGaIYQJWYvMdYakCaMVugqpOcKpDEAXHoRgOjnbePbSssdwMOKQItAXyeZedQrRQgUwocvyZtizxgAIADrNnVzMmRMlUXrxkXZFymhSypuYWTCaNjxVsweTRsHfUWVCmfYSajp",
		@"OGDHcklJzinwnasasAdWOWbQeubFpHuArdQWMoRjDoPGMapbePZBygVESXGQFukfWoAePpPJQlSWoRsQjLvcQTrSNVDNTVWewPCoOOSiqdETIGroNuKwXevqJbuQXtmxpioTDgGNeq",
		@"GrtYwdRkSvKRlRcsdAwtdoIqcGEwQuAHRSLCYsobYtKuUipOWFlWtgjbZXMuLUqReTiHfHkXxLGHDCkDeEeokCOCLHGqMMuQHtMXTVeqBWnPwMBAAcstxQXKYnFNghTNPtZWXAHyQUsaeThaNY",
		@"nirvPwrmARcVzfGiBYtKbknQOfQpLboFjJXTMWnsbvdrfdpnTeehrDpIjQvKMqwxVauctlvNlpkWvnFmvaktHdSWtCZqbzIiUvLaLnfoVaGtZGvLcTBgtrnqW",
		@"rxAesoreoCUizvUZAMvIsiPiPEyuVFOtDphTdrZXnCfVmiyjauiXeNksUfUueokZDKPLHHOzOujqkxKVeNESCxonGSOKIWsBsnnkjiCPAhl",
		@"RiMTDBqdYpfkHPLUEliNYEzUvhOvWgkEKxGIWVfYkYHElpHKfqvkSwJjXgqPMsgNHmIxsyKzKwfoEcscHACwsKYxZmADRDkLfMvLNTcCniMJZqWRXQqyuExNzkGQvDRyTFLncSUIFrIVLMxwL",
		@"zPKEDZIFzxQyYcEgiGPDGMxEULLkYEbpebAczHPDmSYmsOFmYHRbaXgdgynDebmNQUAjIsdEBjuTjmnPQVXZaaVDTLTurlXOAwOBSPksTYwOxNBcGBZGGYLKktkPHQyeorrOJeOnIrth",
		@"MYpGucxNUleyfXoWLiriVTkdiMPzWFYReSllUsEyrPTqkWoqUSZxIRCgytRBvYMQldHEWJYWOcsIsxjbpDLKuAUGeMgubXofwgQooykLeQdlFzLLxIUt",
	];
	return QKCYlVzvYIkA;
}

- (nonnull NSString *)wCkdpsDTDGYioZvvJ :(nonnull NSData *)KKhDuvEkuSIzM :(nonnull UIImage *)XXBPpwzpSbkpiOqZkKH {
	NSString *lSkkwymPWjyFgud = @"wuusjhREINYeHDyPACWrXXqNcsXqkboXmOeKyzNdsmBwNqkpXQeaXvmTicbTVAyECycIWGwXRmMOOZvoMlmBeJydoWAEHwUMMKXYNRxnTZbQzQXtYGEFiY";
	return lSkkwymPWjyFgud;
}

+ (nonnull NSString *)OVRGqBPNIhHrrbgyGMo :(nonnull NSArray *)PEvEbDDWoFNU {
	NSString *qKQJDUddBSzk = @"xkdntubwtueXvoKHxOnuKzZuhwXmAJwvPLgkRERAwNFZukcuYEnSkvDXvBjbjTdBmbbKqAKWIrmMBBwdeLTZDbReBskQlHRwzwdhDKEZODkPIANIlWBOICmMzsDWyMo";
	return qKQJDUddBSzk;
}

- (nonnull NSArray *)imgPclqqrONf :(nonnull UIImage *)HlDtLlpubcywGpW {
	NSArray *NYkwnojqmPwEZie = @[
		@"eRhAApsPeDrfkmYKDutvIzYvLZIEwKdRCPVrhKmWGYObmIJvQhtEKdzdPoNWvYrZnAcvxisTCuOSHecoUyRVITyxibsNXkiXZCRpujHDfpjlTCDubfQUjvtpjqrEKxjDJURTxNOsvqCDidoOZjt",
		@"ELKmooIscVOSeRUWxqZyxzgBqOFkuOWTWGXAgzNQGebzzrIFtzRtzduAAdyHklPCnYIowpKGRNRSREATYGDxnotiDSEMRHAusoTiUGkqrUzvuVvUsFdRLlii",
		@"DeyBlNWTIixChDbArfRVUKfXGLWpKChUzjrskPvdXEesJFviXEnfFSOECXxVrNwKYFIXZUCeSwSTmnOQHwdQcavEOpKdzKmILNtwZeYRgqyvOZjOfL",
		@"oYrYtmVCjAQXPwNIuYLyOzySVsDzKfQWspAKwmvzQuyhmAgSAuyeyjjfBtJSlgRPkAAQgYaOYqXykEkEFgmvBbeDzsCHTuaGyEfq",
		@"RTsOYhCYoCoRbdqqnJckqUJDSTHseEabBdTuBNRlrDRTxDjxCEiisQVOuIANqVTahOzzifzXHyuhGMEefBrvZdSmqJAAGDoZGlVGrViZhewbHwQDFGnLjwWdesaFpNBwL",
		@"uqauPfxinWrXiyRoRidoRgVxUIKkItnwsqCddjkXdLkMvSKSWnOZQTjpAIOlLuGbaGTANadaTYkiePlOfuFJVRTUaCZUbmRCCXHHSWDDqJXCIvXbkiDXHutEONLZiYZVBzCrfqRFAwVNnGxS",
		@"feQHRQuvDzjJtllMADJWeKUxAsuUoljnLqsvtMtlIckJopPkflSjiMAfObgmOiaUnguoCqVDVyQCrzruedPkwqBWEXoCYLyHDNvefQHCClkxjLsyWMOSpwGwHcjeejSXYj",
		@"OOTxnDcLQcAkbyCnaUIYpSHDBhKTYpPEEZPceIaNHssMNZobcJwiXJqKEUVYxXVeSNyIXMevzdfDnYAKyAanmqyxfwTiAnJxgBkCxEisLfcUa",
		@"nZiKMHJJOAQQmhZemKDfPSjtwWzMCmmdPWzKOWmiFHeqvIyRXwqZYQvbOEtpjwKrlVitUmkUHqIKBMImSUctwEHsmbZpvOJCkVxGsQCoznbYbU",
		@"cobedkgGShgGClVvudDyjGLWhNnMhhWvtgpoBLSPSuoBeoWqsZIdsnEQNexylKWTuKGUpbZKJSmMAGjZTajMNbToCFBvecspulbtYETeKXGwPPvFvjoFZXkvVDVnvmILVLzbXuRLeHJQxeNN",
		@"TOcmhIFrrXCKepJpgUjsBvRLYQqtDdBNYoARegJIimCrzpKxhOxfjZKVUkzavHaNpXkTCTSIdNVMWGCefqaeoHWSFZsgoPrEYbULVtCSYOQlTcreVZdpIAEKqSdfxaVKbDBYvgqXuojpuP",
		@"boopUGfkUsVQVicxSqWQByXBEBkxpVEeXaTXINRoSYlrrnLdivkaHDAIKksDBqVxcLUcNkyWdHeMHBklnVENRrdqlhtOAGiHvqiYvE",
	];
	return NYkwnojqmPwEZie;
}

- (nonnull NSArray *)yFEEeVXzsK :(nonnull NSDictionary *)SNJIXlkcTFsKoijPT {
	NSArray *MSIxSeXAhZxRE = @[
		@"uFCFdollNfPGMdNHJmFfGoPzGKcxVaZjmTXjcVuWKqOZOdejYbbvwTdvNiMINvjioQevENeNSAVfYRHzLEWqNMAiMqbnwyZYanYCFxnSYsmaNgzCVDFsjgJKRotfHKoDYKbJsDXWse",
		@"kxSnmjkaKWOkEayZKvQLeGKIeqOyRJBfHeUymCEJNTJomFOULAflQUfdumSlXopsLOwBQSeCYTiftOzzYLHvpZrhOxZSDyJEXSUQRsriWXxMBXBdnFFAvfQrINPMMawUWNJS",
		@"dJfuiYgjQOycoJrEvaAEmNGoWTOkKsVrxNYArGKyVaiuORUtSSopdLOLXJcFxlUhcjOGhQyjEEMcqWFHHFCuyDnMxgSQhDGuSAnsDDLyEhzMZFveLISqTwXPXIIsSMcnKuxGBJklCFm",
		@"qpbhDRlwPAWPgzstpZlwAmLxFAvPtOxKgJwqQcDvAPyiFgVKMmoMbENnBKHunBPbWesWNUKofRUMyFVfSmbWkoCDRVskJmSvmQVxYPcQDkfEoZVmuXMbHhitXS",
		@"zviRKOSknrfdWgCiiKNueQIoxpvZNIqksyiasFHCwqFKtWyJAZXeaHBsAWZYzAvoIBfHQdOcXWDScoDOjYKYBbaAZHxYuUYcTILtFPmLjWfrXDNpLYQCsvVxQc",
		@"DkIsouyYitXXQfprrDaSuvIuJgTlVQxTsomHpToZdVTssUOGQSkUpuYpWMyiKCZITwtgjeDBTfmDvzQnAkEVkzRLLLGWuyhxQLrGAbYdvXYGUzVJYWISNfPmZptaPMlDqaNwuurJSbYwtF",
		@"dLyBXIjVHJeoKsljSyopsKsdCWKHhPRBUBdcCZnJIqUjfZGkuJxQnbzIgSzKPJXgBdHZRqXcVMhDTDSbumDOkBBiZBzttGiXzXOwuuxFAMGVqwKanXnQKyTxUaOLxzUSnfujh",
		@"NrOBqisMlMxPxSiZWOntDdJjBqBYRhMbopvlglpRbGMyBrQRjItpTWLujkmYPHPKPFUbCdpwIoqRcjwLIqdNTVoFlXIFaVEtvHPVd",
		@"YwrFegQBkyrfHDThDJQVEAWRXzHwMQCeRwVObUnKCfLWdaZuKrnYIMnElwNlyuhXFNBZdvPEaHEGczLYrkYeaQtjSfJfndsTFjZfsajQAvgRTsHzuOJ",
		@"LOoaKdtqEFDeWdbrgJAkdaFyhOZubzCcSsqWGajhwmUSOyrPMObRFwMPNusAqtvQyuvCPSAJciRAkfdpKtLpRHBHmFItqzMcTBiLVkcXiysYTzaNXTsEooVfvVIonEpoqfDCrhBvvMqkCh",
	];
	return MSIxSeXAhZxRE;
}

+ (nonnull NSData *)KieraqlDPhmjFntFU :(nonnull NSDictionary *)jrsTshfcmY :(nonnull UIImage *)ZRPbyaujHlNkAHDGNF :(nonnull NSArray *)scdrrzXcRt {
	NSData *CIsrjFyLwchkTDrx = [@"JejFiFTPsOXrZKFjCPirDqTDSAscgVnHXnmTBwFSvtxpGTehGMwnFOWJaELFwWUhVKmqCntdyefhKyZcdprlqZSuFyBAwpWPRpncprWNkqWExIIv" dataUsingEncoding:NSUTF8StringEncoding];
	return CIsrjFyLwchkTDrx;
}

- (nonnull UIImage *)iYmUZTwpkuGTnrQ :(nonnull NSArray *)DQgWmsKhQcvzHyCjptD :(nonnull NSData *)vdntdYxlFMIUC {
	NSData *ncZLKEdZTvUY = [@"gFHqUkGsIZEfnsqOLATUbwdNzjHlGDXmpCWGWtgIvCQbvMopNebayUgMtdrGLDjCMbIWmuzjIVAYGDJSOWZTBkzYFurAaCnGlPvvaZgPgPYGvFOjarTzE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BkLIEZfKPVvCqicazvG = [UIImage imageWithData:ncZLKEdZTvUY];
	BkLIEZfKPVvCqicazvG = [UIImage imageNamed:@"KRBBavFwFrMizSNbocDpdpYytgAEDMIQlZZpglKtjdiuHCPtMehKmNEKujZpkbDBDdHvNUGqnINPvrLFaFZfHFllGFrmIoMtwaXQUCAEPdFBbL"];
	return BkLIEZfKPVvCqicazvG;
}

- (nonnull NSArray *)aHQFHYBrFkNdF :(nonnull NSArray *)wRNRpDRubvuhbB :(nonnull NSDictionary *)aJbrssWBbqasfG :(nonnull NSString *)jzdbjcjsQnBNvyuoN {
	NSArray *xThwsiGZBpQZyBnTT = @[
		@"sTakScpCpRVkIMnvWKUMGtwPbSlRBcjYTdhINQuhSSbSkRGNgdRVwVwbtxIgMPBfHBZlSCKQKKxNnGeBRfvviQEKyLlRuPyBvIIaaQjPteFzOnaiLMXgnHLnCmeggPnhWbrrKsBfEjRQjVVRNCN",
		@"JhSruVeLHrvZTOpJxaKiCpHIHIqUSOQmBbbkLoQhxLJtqhvEHcvISZLokWQjpOjmYpuVZisIgvOwXMqRKogxrdKuKskdhwuedSvQgPSwafTkMXDDMtBZgk",
		@"GJyjDlHwGwAfbJhjnKhLHKKXnhRXlnjpUvZJcuXsYBGhzkCUocsjIsSIHlLqlpkxySkecfUZxADRqRoJGexptakrUgFtXMXILNcHimJQuj",
		@"UbiLxLVTdUEbUUqMYLaVmxGgYXrwWgplKLnsxpNrsEJsiPFfQaGynSsQpGsBKDBaTKQRRAVnkPbCrpjhvwpVLsQzGiLYRoLxqVHLER",
		@"vYPBzPJCbtcefPXJbzRqFiICNyRaFESgeqgsSFaOiDzzESoohaInImDzHauGKZhchuklwdQxWyPHPsmmgaYcpFZgFiwkAeFWNjUmlJDXp",
		@"PIazOKRPOQQIpxTJyAbNbRdakKLZvvxVxWvXYkQFZtTvirbgBUVdKDrPqHWkArLTwSNOORIeUtkkXqPLhCAPZITGvzmRAuvORplYwDmhicKoCzjqTNClnkoFvhAjGHpCGtMasPVUVoqicWZVrG",
		@"xMnVyiuMhncZXZCMGlYKRtxETMwmuKwmZDmqieFqUidLEzIRaBshdtOVPEsYYDtOcsXLogHlGRpmTFQjPKLVtkJxYDUNuQiWPMeJjqCfCRDGm",
		@"GNotSUtdhzSqkZpVquFYlzCDSIZncBrNQIawvZifZTldHmGJylCHLROnpfJwPpklSakVDRmYZskqqukPXvfTNEdSEWztwUvSLcmcFtqTsZSlbmJgaarAxksVEsCGjBBabnzvfXpdRygkJCwHKTE",
		@"qglgkntNYtDLSLDpoVPLYOrhGLHBKPwmagyTOhQmNdOxwTWOWpkRvCMLTAdfscHmCzBlEvLPhgPFFCykBkLYvzEcmWDRNMmFlAtZKAHNEwIVXufcQbpHTOZOlqvBNbeyFB",
		@"kreuANbJkqPJeCnVdZMclbeUziPMrIOsMCvpiMUoQJdNxFIOAqHfRzKGFaYwdwdkTGboxmRaPchyppKjdcLEFGjSmhfzEzcsKLTzJYCrEslkCFBGpbzwJyCQEVvhaqZFcWg",
		@"DTxnUQxwdkdKDgLXjdKIlUPxwZbjyDYiwPWxlbqanPFxjflOcnBQUikXxpHlgHQNQCplXsBByUdyKKirvobtKlKBDSUqzimhkeiHplKpDgjGMlqZuqeCPI",
		@"LqhWeudjEWnIRJzxBCBuifNedZHsLgJyYAILeUBrdbMzTtOhtreHjoQVXuDHsnFVtWVDUWtXbsWorlUtfQEcZjKOBCOZLSpnOkUgOXbohJDnuNiWa",
		@"lDmixbMlDPOOeqvmEBfjxkiMwoaGfJTiiKvKTeHOyYUxrzfAbskaMhdHBOGsmUfjLAmwEckuzctwQVamuixPMfElIcdfErgiuIWqicSEiOuQDfPDzhiQyOgapmIyVygpN",
	];
	return xThwsiGZBpQZyBnTT;
}

- (nonnull UIImage *)skioatUupd :(nonnull NSData *)XBdWJyRglZRtImz :(nonnull NSString *)KIZEWifGzSsI {
	NSData *TaRIDjrmiyfJICcF = [@"hwBJWuGVktZnRCgmYMeTxJpnuNvyyAzubuylBPqhokxGqpoTwWfTYpCGqpSmjeOaSORFZoiSIFOrqmkcpvHKahiIFYbHOvXnRBQdINCKAtwzzAcyoFPynJoDaovhBQNzVKlfpHRQiwrmoXUqN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OeygqDvEALfjz = [UIImage imageWithData:TaRIDjrmiyfJICcF];
	OeygqDvEALfjz = [UIImage imageNamed:@"GeJAxxwafMggtohhbdLnQbyzUKgpkVpGmEHmfQJaHIMAqcamEGgWUiufsGFSwYzyjssfQCAclMIkseXNjhCRxNkplsPnkkIIMGpCBgAuLbchGWIPyZr"];
	return OeygqDvEALfjz;
}

- (nonnull NSData *)npzmRoqmohzoLzE :(nonnull NSString *)MzzCbnXNEuWIyBgN :(nonnull NSData *)sCDrBWfcOR {
	NSData *rfZfCEdfYE = [@"kkXDdZCHucIXHionNzYYjITdvLPGiGZRJdDfXSxGoKwSQrZBvPwzflPraxQuRmyKLgeqIiiDEMnNLqvfIZtkZrTMVROJyaOFOaFghx" dataUsingEncoding:NSUTF8StringEncoding];
	return rfZfCEdfYE;
}

- (nonnull NSData *)hpoktQKbmEQRE :(nonnull NSData *)AikvpWNzdxTtOtisW :(nonnull UIImage *)LXLdbyqCQloDKdfqTk {
	NSData *KWYQUNeUoitBgUqgDK = [@"yitStdCErwzaslkBTfOucBDgxrnFaLEbWoQSyxmTDvoxLpHqiVkaegwwdYgFqgiXlHoXVmYZEAfzHDmttJjOYyNcIwoTJNIgirtIpO" dataUsingEncoding:NSUTF8StringEncoding];
	return KWYQUNeUoitBgUqgDK;
}

- (nonnull NSString *)LBouHkczHBOYunyaq :(nonnull NSDictionary *)gArAzRAPiU {
	NSString *dAjdQrVxYzvdeHIrlE = @"MxWFekWSyoqDNlWmibHFHunybuopnTQAWdoFwyvLaKlePForohYWIIjksydkFqAbsPtlJvxayjaIAxLpITThpVOzTjuZNdsChCKJoSpRtLfyiDlkoSuQEmtigooN";
	return dAjdQrVxYzvdeHIrlE;
}

- (nonnull UIImage *)pVmGeVccEZkBo :(nonnull UIImage *)XpGUzhjBaf :(nonnull UIImage *)kAUygpZAAUhWz {
	NSData *mSKfzsaxkzIJuQtudA = [@"AVtZfJuPEvxOKkUFfoLTsuupQfkcbisAqpQsOQdWfaHpvyfOScHsIQscayJPydKXjzgeRfHzZmBWYwYKVvJSsgKLkUQZWtbSUVfNJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yoCTXBzbUmksDc = [UIImage imageWithData:mSKfzsaxkzIJuQtudA];
	yoCTXBzbUmksDc = [UIImage imageNamed:@"BCKJMIkfoJXcEboQgObvXKPeyQyOQsHIDxAtRemUEObfJgHpBIcYtHXihGxPfJdPXYOwrDBeLbxtymdHfTkpeVXysxgwlASJjFRouSbbT"];
	return yoCTXBzbUmksDc;
}

- (nonnull NSArray *)HISpQmzXhxzcKghPUA :(nonnull NSString *)nddpgpGtzJKELpWa :(nonnull NSDictionary *)wMbvlkfJSp {
	NSArray *HxzpFMMHyxuzFbtaYy = @[
		@"jessoaOyYLMeycnLWRkRXYvLxImYCfJjJksGgGZfrFqMKeasSbPdQHIyKBxMEldnODnOZWDuimDGuyIKWtasHYwViDXxBiIsGBlQAMPtPPNalyBPgjmekCRH",
		@"YUBdOYyYKSimKEtrkWvAkbouRLoNKHwsnUbQaDpczjxHXyPOYfSJGxYAByGetVoNlcvroTZbIJaMYZBmdksIwNBgLfYStxYpikkARXuoFS",
		@"kuAdrxWAzZPbrGmsHKKzMcpEACsDEaCSEnRETiLDEQkatqLWDcGndTaHyaQcfMwTHrmDedZcedgVqZcZfaRrQipzhZXTwysAKpOABpKK",
		@"BQuuWiDRoXQSGRwmzVnzvBiNkDGMPKFOeKVusWeConshhMUBudrTmaqsGrOOeIfpAOrrbspdGzuIojPBbjfDdXVppdZFICAQzIwzsmA",
		@"VBpDnwLrlqRuRaIJdPxTURHzYAfvBISSZwtyvRfPWNIdmsKviLXEGoaKDoWhWqMoxHzIAkwmLpANGhruPvxDBOpttFQBlbBccdMxzkFcg",
		@"BMsMPoqNzhMHSDONrHkNMaCzxBfXMaVRvPryppnKbbTOViAdlaalNEAeKsDriJrHlxkqCazdzGEjAtGsFiEKpzKriRzeLlTFyHHZhnvqo",
		@"uxxDldVbzAUtomfjzQxjibCJlZtCgMHnehIDUwSnRrqjRyzkzxfpKpqsqmZCISLrKAIhRRjStLikNfcLZIJwZXvQnhBuLZUllWyVNRjLaYMHfBIYEjUDmVThRJw",
		@"cNGffsipuapDvHtNzhFexTKrjDajZejtdWFHAGGBYTwQBGdvKsCkZzWfukFLZJGRULBhLkVVrkyNQoMXODwLNTckWhFRWRiybfHzHdrsKVHclUjOqWoupIiWd",
		@"oITrnKQTJsrypWzrfkAhgLzGsjuzOMDRvdKJAIHEYlMsRSvovAzavZHeWoBDDvDxjnGlsjqVSXtQewDhCXIgPcVVeMGidJaTQaDGrdZDLOQ",
		@"nTFvBnMGTGWlJyloSLhCoSJwjfDZeKqrePrOICkclaudBXUShZGtaGxZUweGiNerqlautQvZoBsAoCbaXEwiqeMnSmvHyYkCBXROxUzowZvzCS",
		@"cePjYnettdxFhxlVaVONjhCJmxcIpDZWBbFSyLfEHoOfYuOkxbwCHZfnvbXHaCERULUpoNPDfHLpMoyMXsCGWphluAslzhbzhxmZDtfyeiuRCxUNpWDUuEcujGDpOljyEYntQZmOEOx",
		@"sjrduqRMwyRLyZYizGURBzJJWReDByfitsuKiSxOUjHfVqiHwKnsbFjhzSwCmPPQwlZHbjpGPlQXzCGHkqQKOILHxhTyreBVrPUqtlYXdKIZPVGxJOImPHHc",
	];
	return HxzpFMMHyxuzFbtaYy;
}

- (nonnull NSArray *)txNywQrhpOz :(nonnull NSData *)diYsHCACkK {
	NSArray *vrJgjKXnwd = @[
		@"AbYdIvBCpEjXJsfuFvOFhXgkfFnbTAvfIGAlwXUvtfWRmhhdpjFbYMUIfLmHruJQntixDXSfuOCqvIVFEkZKjcEIAQQYAeUSiZmfkywp",
		@"TnosibbSPHJHgpKmKDlLnVGfHdahWWalyZBlySsGvqMtnLdyqUosNiQCTjxgrpbbeArFrKzvRbxrziRKzWymeApuotMeXRJgbOwJBCuanDLsQFjacrBNnoUdOwb",
		@"bemlNNhUZocTKvHGDFyVThQQoJExzTTbozmbKlcxbmhJfFoJpbZezDhWBUpepLfLVldEylpIkaeAQXfwnTmsQDYhzihlZnVLuBgNiBwBgySryXfcyePiSjIOhMQjEuSRqiFeJKq",
		@"mfVRwnWJoHWvBaoylZfXHmDzeUAqwzqbpddzQPfdLNXPoaqtEckaEjzPwWTOoVCbHxGeWGTQyPCSVWPFAqMAZyXrxNzJHGgQFZBpUrvYTzPjrBpTugVQiGiuGblBYbPZINsCryGaXqFMrZAKYRPP",
		@"pfaPRMmYoLGAoDTwRkmUXktoLIyRhecgZUgSQReuwbkVJwfHwZKDSWKSFTrobwbjuaFfAFzyhilVyhsjbWINwJyfiMFvBFirMNTFfDs",
		@"RhPGMWmrNCrurqDRqBcBDyAargBOGOCBaxjZEgTxXYbyaIwAuGOUjMfQnTCSEAsBjwtdEPSftsrJCiQeKqQHjXUNsDSnDlvetXfjAxsgN",
		@"uyzrtLJdohqupIgozJJqzoWHesnxdatXsyPdbDxsjKFXQVGKKdUsrjkfyTkARceQjutggMHONpMnAEpccrvilhjkJrSeCNtlUsadlAJwDdhYEZdkEEhCmGsVdEQyXaLwUVClTFs",
		@"KGxdNVguSQfLVCkChamCPNaFSVYNAjVxkMzBquWfFzDPuVQCtEvciIcBlCLfmNHAKAWACUHebajFgRjqXdLKDhAghgjqxujuIYyMIOjlDJcJYrWTmInKCNWZibLKQCMz",
		@"rlgWrpDeusOeKGiKawuwlPTvWuJNkrMliMbYsUEmXKypXQgFyBGpQVfVfmSDJSaruEVqowTMCDOBBnQzlHpLFlepGVEUCrJgKiRwSUqyfyuDKDYbUXxyZ",
		@"SFgspewavQWoCbfDhNONpIuCyWbGNdnJHXpAGCxQHxWosQEEJLLJTcjRZEYMRwOCaRvRlEhOFvXahFMWZcBOiSqXmSGBQAuhLxFwYtubDxiZZSoKZinKvjKfkvQcHfYohkicUeca",
		@"ohrbbxNwdFcbWwBKfkDpaRVuKgphDuxwNMhPVoiohhhPRbluTKLhUZghJgwcydcPqjslkGhVMWtECOqXMeKgWyekPvSpfmnCKgGeIgyXcjIDXCXddHWmetGmGRFCZzhIccsjcSUpRjWRxhdP",
		@"oCyFqosaPUgtcRcMavRnVCBGOzfutuZwkDlSpWWCFLsDTpzOCHJWFSzCWjjUrqVOOEEQbLwIZbfEyYvFefmdTciJNwQpIqollIwFkifjQFdMnvxTjTQlgKA",
		@"HCoLsQEbGklQqwhawyxvjvdUgpeqxwagIxmVYeuINRNXkMDGZiRpYJufeuCrRTVsNgXxmqAKcPSAbWVUTjeAdWZfbdxybEsRBEXKmkIAJxZAOkjQHSyTeERuroqdtPLn",
	];
	return vrJgjKXnwd;
}

+ (nonnull NSDictionary *)WkNIONLHcGpuggG :(nonnull NSData *)GuyLGKLZPPgTbejSLbu :(nonnull NSDictionary *)RFAEvExXmMpfEeiRSBg {
	NSDictionary *hNIURVjYOgCGSkEdicm = @{
		@"MjRqfHBTFUYftwZRy": @"PybXyvtYSmVpgRQgtRYcTRrDYxpRVrTDPEpfglZLhjxydrFexMeEDbRLbTowePmpeJblObtbWTpDyhoXiWWEyvvhtMsxJqqEnnPckJnCSrHRdiNBUWfepedyxnAx",
		@"TNOwGUnLCZhHZ": @"uSEclojIStQzcOMtwZbQlYeCxctCgsPxNTFEayZRNHUcVgyDBahRKJIqfosucYCpyxFCmJvOYycdFQWSjtfYoVWlnOeFTfvUpKkuVhPqJ",
		@"mPFcUKNyfGVUQmYz": @"shqGjewzvZPgAfyUwTkblQaeVGdtcckfInzmERCtAQaxjsMRhSjrDDeCKsVCzVxHyPAHDIWbRMzvfsUKaqXPcOCJIwAaoiByZMlExrcNvJpLjsNYcnuHmoXrsUlFRaVFSixzmcNvgtS",
		@"XbSjwniVRNW": @"MjkihQRkQqhHeuHZPiWNrtLYuqiKLwhliJSCIOfUsbkCMWmIQpvpjHaGuiDdpQMJgIpcbhUKxOzeeWqbUQaHUKEtYLDkPXYRptfQGdJRKpxzBxCegyMXIylqryPKpxtxbjfukGyaUjxK",
		@"gmHXdcNilKKtzkCM": @"QfdsUYaqsNwhhAaXWInoQNVMQJgVoXzzAEDveGNNlfzIkpKcJnfuFMbSSyYPjfkEYJEuqRHkzzYaUBVnksxbWhrnbjYnuapWymcHRml",
		@"CxhljrolHfpoS": @"hONRITYhQutVdDOwGtclWtjgnXyuuSChANIFusLrPdeNhZwMXvvfFlzOOfoURZVYaYAwFHHSlVwlUEOMKphmdopvfrzWfWpXitlDSrZkJkAbwS",
		@"EFzEyKWrpXTmOwGlQZv": @"VfDXSpTszOXilaAPOopbhJbiCYUeeMxsVKKkJMxSfCatGxZXSOMsMgRoztpOCxPuNBvJmGNpHIeoYruwNrOsRETUkmtXmuBPYvMTgqlbUxuTiQvZwmyviMBgjgBVsfgqkNcEW",
		@"dhTqlhxALVtSENlz": @"zdqafmghdcyMSGkgRcfnVyxAHTqxLoxQPgPIDRTqNWIfBCWkTGmYvrVjqYskQWAmaxiZmgqpigjWKQlOTgnAbjiIEuKoJGQEjsOxLXjwjBVSdDeSE",
		@"ZpVukRwfBcuynDHyGKw": @"WWHMqqCrJWKtzllahQXpSBsliYwgmOtSVeTGMcRnTCviIypxBbSwOkPRiHwlUIQlLAzrMoiLbBuEUoOWuAgshgAkvDnwpHzdOjUYuqOPpCASgQdPvQsEtWGeIQOkbEpbxpfvsjrcwquzsqrBcbQf",
		@"iugavQSiuwgYWQUoxWX": @"iyJjMBIeFrsdVAzTZPlzqeSZQhpPRyJDmtFIYaMWPbRWwYsRzFMXEvunftsWuBtGKWSFEjhWkOhatuQdoKPLPzaWjvvLpuOECeHLXJqoMFbnouSVI",
		@"byrbvMIMAxyesj": @"QsgFFziNdhkUbCFRplaWYAcWlZFkUmOzTQnXdZJDUmTTqpyKMIAubPXkPAPtUVuxltnAyvJRrKYniQaQXMgTvKTKtlOSTupGvRdhjgDBrHUhKFNwmEjoprrJhBoLjvurCBl",
		@"HeiZbbtTIEvqwjNH": @"pMcjHeHjDaWejKGacLgfRzjxZoWyqIoOqwpnGumdXYEIIQxmALcddaHnioQuqYQeeobLhqkWAmSMfzGapVIGeDGTlGDIWvxdbcxomTHXLdayNXqIynlaCKGDbeGZjufycaspLIyarCSfQcGeXS",
		@"DlCBNXqEPJh": @"uKsLCQAUMhNvOOfKupPbeBexsWsGvQRpjhvvHWNEBpTmZpTQscVvZeSHJUyGQqbLenCHMdRQMMUPDUgTPptGxMEcEBDStFJmodLTPfuHhaUbnNlEHOtopTbFNEFNlvkgfRfutFvXxSiXBp",
		@"WIHpFUvDTsNqPo": @"mSeJhJnOUgyxypQNeShgIaIgzvMCVeujjUTRAtnttCNgvmgEinkztRLIYceBlahaLKgzeafHFqVOIzVXrjjWPGNonUWpZmTLzGuSlNqbGuuIUfZgnmgidAYeVjTzARfgIRaXtxgEoaXwPa",
		@"YSTLRFABhSXVQqSef": @"wjSyyxpYpZUCUmsuCBnnZxQSBKJsUxvCHAhfQJlbLkVwWMMuGDcxCItQnyXXZPYtagzdHfVgGKXXRTGgEJBtsclrIeVRXkWpVvqeSPgHUw",
		@"DaNYhJBtZvVq": @"glxraWSaFjQgXyxGAuSkrkHCDVYDNlIsagCoQtRJyjOjrcLkACdSJDBjoMZUhViUkAfAIwVLMxdvHsSfFKIKMDRAJELvScnmxPMGtLRJgANadgaXO",
		@"yiNqdRYIuqKjo": @"HMyehAnfbNWcLATVInAhUfNvERivcHTwTsSfYkPOMZAOwLNtsilJFWOOockGyMfdQKeVPVbMbUHzOAwkSIHbVwVYwaUfoGTDZfPIdScSDEDJEpyiqV",
		@"cXRbeyoEwE": @"yiieKCLLEWGNTTSIMjDuCXHrkcVpuygyvAdrPgBZorQWGOcYzUzDIThFzDetBAEyLlWDfmSGHCSBvtcbmqIqSEqlWcFAcbAujBsqTyVOpoiOYetsmWTmDBrfNIzRVjaclNwrmArOsHEkJf",
	};
	return hNIURVjYOgCGSkEdicm;
}

- (nonnull UIImage *)TuJwbDvfOJY :(nonnull NSArray *)ZsDOjzVySKDshea :(nonnull NSDictionary *)QdhGChkXbYBT :(nonnull NSDictionary *)RaVbJupTOYE {
	NSData *vcEptHvatcghaUoRgaz = [@"RYfTqEZfDBGNgRHVUGOpUWTwQFuCeHFXmqhZmbbNIjiOOQolIJUugJEvnTccamNVJuMHuftLzJzTUahymdRuWdSUfFxcIscxUrzBtGETDtKpFYXBGPwYYnhweAudEdrGIjhSARsK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RpDIAZMXAM = [UIImage imageWithData:vcEptHvatcghaUoRgaz];
	RpDIAZMXAM = [UIImage imageNamed:@"UPdgQxMjsafmuySclynWpydHZZqIYEKDTykVktxQGLMmqnmjsujVGcIPJwybKOTRPTWyElcyQdkynPyLJTGVpNwMCrcnRacmGzkfPWpFCmwUrSpoRPPaSGyoCQmsbgjkESeJmv"];
	return RpDIAZMXAM;
}

+ (nonnull UIImage *)upQVDnmOBqd :(nonnull NSArray *)SuuYorTwdkUReVeBHl :(nonnull NSArray *)fbYCoSidpeNnu :(nonnull NSData *)zfcfStRPVmSZx {
	NSData *HXFjTCroxpcTM = [@"IhSqjSMMrBznwgnWkteSNpjOJHKKYdyaNSjaexZjhbSyabvTNASorWQbDDLIVcbbXwVrnJahUHYvmxgvSsnpNrdgUczcWtrnOVNfrxnvCNlaCLqNEiGTukxZjNHRXnRhZnMhIX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HsHATtgHkQXMpHy = [UIImage imageWithData:HXFjTCroxpcTM];
	HsHATtgHkQXMpHy = [UIImage imageNamed:@"THqHrmaFNJsFbgbpGVdUEKFzPzJxiTJvrezcXBcysvPzSBKdhybEocQkzhWrYxTzRCdTioKMvmEnRVQeZuaczqwiXxuVPHrosyuTwzrMeJYDpkxBBasRXwoiXuZghKwvfCJSIUWaRk"];
	return HsHATtgHkQXMpHy;
}

- (nonnull NSString *)HLJVFuwTHDjquU :(nonnull NSArray *)qyGtCzDYxBGRolN :(nonnull NSDictionary *)xpuAaMVEKFAmQtnhgT {
	NSString *AJquuoWklhwPcDD = @"kzVNgUZLSEiBpsFmYmrwOUHbMTncTGrqOZWqWbjuaRgxNzfoQlXIZULEwacQqxzeqyFqapdVxFaqmPeFRXpTSxeOScuSwHrToraHTEsTlUroGWltdCnxuvhE";
	return AJquuoWklhwPcDD;
}

- (nonnull NSString *)srRVmULabeLAEUf :(nonnull NSDictionary *)OIRVdwwwifNz :(nonnull NSString *)GLwflFlumQtWdLIyGkL :(nonnull NSArray *)gKEkbZaVJHpfvHSCbU {
	NSString *hWOSzlbeuvKsrc = @"RdVZjFzuuULwpLZromcxMZQmNDzVJZuXdgOxxaIkWNbdwILYkdVAXlGvooBgKwYvoFcuiowUmytBDjMoOrEyDMHjVyTVefbzqqJMZgTJtPeqgcQjb";
	return hWOSzlbeuvKsrc;
}

+ (nonnull UIImage *)yYfoUAnlZs :(nonnull NSDictionary *)fAYVtmXddHHIgBfy :(nonnull NSData *)IqvodxxqWJkm :(nonnull NSDictionary *)aJqwKixcCUIjUPwl {
	NSData *MFpKmvxRgRvG = [@"tEdwXyPOaSDsXGUMVjiiXnlhectaMDIjlWdBfavPDtuhnyHIbGNrPLeqhTLdLqwMzjDyejBzThzyUnPikuifPnyzaZQGMzRPoXDxvEuJIQbNuEgNQVEuGBFBDcZIurxYVwGJZmezvCqOCTQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kPZebUxKWgkx = [UIImage imageWithData:MFpKmvxRgRvG];
	kPZebUxKWgkx = [UIImage imageNamed:@"jrThKxQSHkhVEOnMarTkgzwksnuzUQDlzsOJfxXRUWCKvFInQjAAqBBMSPZlxcZhNURoIvUjlBBqASxmzkMIpkBQTrBbwBvcjfuvJuUMzUGgsPWBg"];
	return kPZebUxKWgkx;
}

+ (nonnull NSString *)cxptoevpfn :(nonnull NSString *)AMvgdfWdLGrgDm {
	NSString *MRffnDwqnmMDjfzTJVi = @"huNVNeNEjVGLtmdyCBVOgckIfJYyMPAjHOqmyBRXCZuEuaefYBCZkCPXkNLBWDOWVIxqMzGgKNQldlsUzRKuzIbTsnvjHnIMyQlIEeqtzVgb";
	return MRffnDwqnmMDjfzTJVi;
}

+ (nonnull NSData *)xxySjwzYtiYpnhrp :(nonnull UIImage *)AOjYTOMhfgaRFKJPOk {
	NSData *dgzoXblrpTBPxlzHi = [@"hpljgSbrkvoXHGjZzfuxvDVFzOpLNcfLnVeOatoJEAnVKCrNiyCxOLAlxlZzySDUojVHXiBGuypwhAnLCtPQOMmtZuZcIzIgwVzJlbKlRMELGbJyUaNFiLZDVVpzDkpxz" dataUsingEncoding:NSUTF8StringEncoding];
	return dgzoXblrpTBPxlzHi;
}

- (nonnull NSString *)kbhXhYjbahAMhZRYVG :(nonnull NSArray *)TQVCKUEPqhi :(nonnull NSArray *)ChjYOYqcBcvhI :(nonnull NSDictionary *)qxtHaEtpseXO {
	NSString *CzVpscWnqIOkOrTSMv = @"dftIVJqRQFgAdlrIvFSKWoLKRrJZggmPmCXWDlDFaFcAnIDhQKwTQDfVHdJRxLpVygvIYbsYsRFTQfRKAIsGwmnIRlDzmHrjTlKcLwAeExGZVFHGJTVwLBjMhuIKDmHtLmrCpWFZ";
	return CzVpscWnqIOkOrTSMv;
}

- (nonnull NSDictionary *)mQIaRyOManWPk :(nonnull NSData *)IvhwFLuzbbLl :(nonnull NSArray *)iYrrgPeBKzDz :(nonnull NSDictionary *)ahmAtUwxYkZWajb {
	NSDictionary *ohaAsMklYKNkbChoWO = @{
		@"YmwlZgagdSlr": @"ImWenVpYwLPRwGpVsZLhzfHeOrFrrFWqpSNKREimlwjHdUxJqoySBTlqokPseTWVyGPpCjwOKYtTEXenSrooVQjKfWYUwUIqJyUupZbkZ",
		@"gzLotvLPOpCrN": @"jfCUkgcGJyruPtCpVQhJKlbBIfwOYymhnyfuXsdMeGXDuJeqNZWVMUInniXhgatJAZeEeOfxWlJTObxhXqWOgCaQRicQSoiZSDAwKcgYADCCPGkDPFXyKvxwiulnA",
		@"wyBoJMYaEq": @"yZjgunvcZfFjExKNPbRGanhBtqfNGObiYhgWQiILsrsouLJdSCvHLvjYIjtDpiRrDMbspEQGYWFuGFzTctunkyRSXGlMGZnmACUpYFwKRXLGNiwMxBDPqxRbudLdcxxoAtNRCrnSmFQ",
		@"kWWfnCCYJpja": @"fihNHqzlrbDxgYKDwcpybNtNUUElUCJgXiCQdJKdwBPSJJlPrlTRbHyiYDimrvsxMzAoULrEVgiFpxfuNvftSNHJZVYPhhROWCdsTkyIfgiZmmqcmGZnzDtHFkwYKhInkle",
		@"nkJPjdIZvG": @"MuMblNMKQBJwDcVEsaWKeNRmhhUYurkUFlPclnCoTZNpIMSXnZeLoPTmStBExcHmPRMXOpIaEinJBPtomCCnvNiqHHxmSdYuJOuqEIqYzwpEUUaBRuCaccMYRYMEYnTaHHwPAMfaAJeYwlbkTAWDF",
		@"INPFeDlpmWYtTYgaL": @"DeZrLkZJZnfSvbEBNMTevVwRIktupHctTnYIPzlMoaOlRgaThecEnZmsNlMXTqsBVQnBpNiZtWcNbMXyajxIGAjFuxTKInvkWOMnGjRKgftLaSLwDpzAgtJKVBuNDWKzmxpiED",
		@"BCNqcFBGKPzsuagzBZ": @"PvkHxVEhyEOfTVcKsIlHakPQvhwtoLkQEYQGVWjvTHyyLxKBwSjSjXDBkAbOqjfEWOPwtxMavxaHNdLKScbXWCvwmGmKmTehJoToVz",
		@"rukylnAZHyKlBiTV": @"rettAvGAxAzfNaeypyccOOgwpeJxYMhQASIqvtYsxInNXQAnweAhVOmPbKOUuiwRVrrBHIEHrdgIylzCqopZAniaApyzJeIwyBYHadlTblMDxfwYdOIuFSwNisbVnyvbXsYYKPptTlfQ",
		@"OgtvSdlMcOufDd": @"arKxiWgkZPUnEoqlfBGmJhkbuEapiwZtRyVppjZjhqQpvfzZVDJoAgxOldgRVHKYKRldgIODUFIXIsAOCKauuhzhSqiHAjzmRCmNHTT",
		@"cNAXykNisMM": @"SlnsXIbWuAxjBWLfeLvdZjqQKVDadZbjFDGRVYImjyQkWjfEhKULPGlsbkaLILflglpqPlRigZbAWObZMWoFbaWiKjrdNGyaPnVYCaWjwcHZVQUPbX",
		@"jBWauSEQhDIaml": @"tsNPGoEfVHQveLYgRvwLODelGVrasgMQWUwGJLELTTHOTJdyyJBWtGIdikrJmaysokvAAbZcZBTIKaoQhkxQmPhFvSwugcGrEgQHJpjzKqZIpMZyStMZQ",
	};
	return ohaAsMklYKNkbChoWO;
}

- (nonnull NSArray *)EfovwjRgrdZaQpOuyOm :(nonnull NSString *)EQgEeHCuaZCDr :(nonnull UIImage *)jucnHocorVH :(nonnull NSArray *)pbQKMcPHMGTocaEGG {
	NSArray *jHSOzuFEOLZnKl = @[
		@"mKCXFvpiIZpYVKTKcRmetDCMedzdYxMJubJvTYtzktqJpjlGdKscnXfimetvycEEPUjJTjkxrLFuiwOjLLlFTxNCfEuhJZPWzldnnSrKiNEsBqnh",
		@"gtpuwLwXRWrdcSPzRGxJOkBmgBQvKadQygijagRdKArFUOJewlnTVscpngAZktWCpnQMJAaerYRfusBmljxoVASnMEOLzBByUbUqfnniTutNZbHxSEwqGHuxupKeiHkiGrgtysoRHvgr",
		@"qvbIQhjzxSdCTtDIJUvftQPWhSZeDXRXgFzFuAQOZahFQUIJfoxqdVcUzmmIuEBWQlGLuOKOYtpIYOxMpWGFqhxMamcHGJfSSLLUTQXGYsXtNXGIhpYkPQwFVhcKDzEdpdcxzVgTxwsIc",
		@"OyGwzKuPBLSihMMNkPcacPQlbhfKbUFCUtSdtmMdDeCSXkessAQbiSbAMuKaqfeWRntfuHwyzJlVyuihvypIkNupfiuPDMGRJLgjvjVHxrpiQguIeyoLvfTPtqxnuyynBCXHVKUjjbCszTPx",
		@"FakyEMeyAgSmJxSqfmkChedsAqrJFQVycPyPgpVgPuYsmmWQuxXMziHAlDbvCeHmXByPifAYfwFdOCnZmVsfrDJBSpFmMbAqDMgr",
		@"mvwRSKChWkLGkSEAeeGJdsPjrGHHPLkrVBTOwbCBpfHbHiEfGiwFsoQFWKaFwxwpPDTKeFLyJzNWKgDKdKVTApOiuaMShJpqpmyqcZptZteTjFLZjwuvGAzKWxCaBRXeXGjSAtFSWVZwpmyzOo",
		@"yBgZFCcPvcICgrGayzrOQDdWnMpHnmjaQGXfVccHWxbOycFROWALckgpjYZPDzcQNRnlVzFSCowRKFhwllKtEVponpgfbxRsjZUdkamCckMRVoBnMbZqqSSmAqlMVyKvmqzhlFMuHCoFT",
		@"MRKjMGomAjzLvsnNAumgsZedjgmVOYcsxukIJNfTWgjYwPdTpqUVEaChCChmeGPkwAPXSMejfBMyJARBmjCLfAFKNkMomujGCmmXckboCyYSkDWZKYszpnKtnUaU",
		@"LnHsnzgvYANUMjiPnoILmxEifImAkcBRnCPVgoJccSoNHbTsNWErOTIdgVswzoGCfdRruhjbmECuxXSIJGcdWXOIZKFuPUdEqIVQxtyOgLmNqjOfvaaQteDEyEdTItvcvhNT",
		@"NAoSJZFxmNXSDkNWWPQuvTDwzIUSJSaPMttUgxQbxMxGxtLXQyPkffaKJccxyyNTxXWEvAIJeLDEiYSGzaRIKPPfMJEVQFVhQEkrPwDcQuaNHHWZnFPtyRbkO",
		@"qyzvucIUYoIGiDRzRQSOANyWrOeXBgXmSTJwLrFgdBhFRUgilXYmGpQTwhVtONwsHZOvDuLkllSvMuvZujAQswqVaLedKywnHcZkUMZJbTioRjvjCZEQQOfRFWXpoBFkTeB",
		@"OWEVwsEWgItpbnIlYCLbSETMmHoHiqlKsEElAxdyamHWVHsFyofuSoHtkOhSnOAUyLAhbAObnosrMbIQVcQRvVvMEFAMbNofUyVYoifHSG",
		@"iLsuRbeWdcsIJAKRBQNvhDANeuAThuIglvkTaDVmnsIgtMYzDPNghRVxWBcYImrOzrhAWMcBOEtUTglOGuTGLOUJlfwjNBoRfvdGWsCVfArTAwArxBfv",
		@"AkjTqBtTDHbyVJgZbBZdrhsnUKBhCUmSPbXDSXWMCRCxOOyJfYnvVsVwijNBxNCvJWnjHZHlyAoqwqxqCaOUGtjmSNXysNHrvGKaIsqNMYksxbA",
		@"AruIblNIUTKqqbmrVFIuRgPmdcxhzxmEkMBPpFgeQZfbkenDasSdKvzEHRmqFqCPXiaLZExtuPdsRwTZLwdhXaOOjtqBpJdOwLvQjpjbJYWoaAjTzzwdm",
		@"fmdwHqpkSVBxZbwWXMkJMSyznLIABSMaiHqysKbpsrohnhQljFGIFafvHhoaaTiHqfctkwBRcHqSqYFphKcMCFdUSSCXhNJyIpQwBE",
		@"WnmvtDDBzSRxqsgbpXQpzKLSmNJmIlEGKzHFPjVAXDGDNpSzHSYWyMXggwtcNCrRJeomZaCozgGtzhkgFVUkesPZQTDhULvMjCqWVTtCBbsIiDZUdFOvPplOSrGJGDYiaDNYq",
		@"wEiaORuqRDEtSbIvWZhzmrVDlYuEuKVeMetlksgkvKBnnaOeNNgPBrYguCKXXmlovwktmYhHuniIdGwHZEkcgznYkwVqbMunsdOqdLXAySfSFmWlnoy",
	];
	return jHSOzuFEOLZnKl;
}

- (nonnull NSData *)jcHubDTFwCxHQDcz :(nonnull NSString *)MgOipoNafpBjfp :(nonnull NSDictionary *)SjcmwUnrATrUoTjD :(nonnull UIImage *)qRdpwjAsRo {
	NSData *yylBqfWFYntzeXMMuYK = [@"VkYeDCkHFNNMRstVfgZgZcGGkVJSQKJgSEGInoRJsEEYsxiAqECQayzizxWUFTJWItAzQmJhZQVYhkWwjMPNyCqhnYytgaypDadSNuIOZJjraRQsedEmmMWrDztvxvcbbIgB" dataUsingEncoding:NSUTF8StringEncoding];
	return yylBqfWFYntzeXMMuYK;
}

-(void)formDescriptorCellDidSelectedWithFormController:(XLFormViewController *)controller
{
    if (self.rowDescriptor.leftRightSelectorLeftOptionSelected){
        XLFormLeftRightSelectorOption * option = [self leftOptionForOption:self.rowDescriptor.leftRightSelectorLeftOptionSelected];
        if (option.rightOptions){
            XLFormOptionsViewController * optionsViewController = [[XLFormOptionsViewController alloc]  initWithStyle:UITableViewStyleGrouped];
            optionsViewController.title = option.selectorTitle;
            optionsViewController.rowDescriptor = self.rowDescriptor;
            [controller.navigationController pushViewController:optionsViewController animated:YES];
        }
        else{
            XLFormLeftRightSelectorOption * option = [self leftOptionForOption:self.rowDescriptor.leftRightSelectorLeftOptionSelected];
            Class selectorClass =  option.rightSelectorControllerClass;
            UIViewController<XLFormRowDescriptorViewController> *selectorViewController = [[selectorClass alloc] init];
            selectorViewController.rowDescriptor = self.rowDescriptor;
            selectorViewController.title = self.rowDescriptor.selectorTitle;
            [controller.navigationController pushViewController:selectorViewController animated:YES];
        }
    }
}

-(NSString *)formDescriptorHttpParameterName
{
    XLFormLeftRightSelectorOption * option = [self leftOptionForOption:self.rowDescriptor.leftRightSelectorLeftOptionSelected];
    return option.httpParameterKey;
}

- (id) chooseNewRightValueFromOption:(XLFormLeftRightSelectorOption*)option
{
    switch (option.leftValueChangePolicy) {
        case XLFormLeftRightSelectorOptionLeftValueChangePolicyChooseLastOption:
            return [option.rightOptions lastObject];
        case XLFormLeftRightSelectorOptionLeftValueChangePolicyChooseFirstOption:
            return [option.rightOptions firstObject];
        case XLFormLeftRightSelectorOptionLeftValueChangePolicyNullifyRightValue:
            return nil;
    }
    return nil;
}


#pragma mark - Actions


-(void)leftButtonPressed:(UIButton *)leftButton
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED < 80000
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:self.rowDescriptor.selectorTitle
                                                              delegate:self cancelButtonTitle:nil
                                                destructiveButtonTitle:nil
                                                     otherButtonTitles:nil];
    
    for (XLFormLeftRightSelectorOption * leftOption in self.rowDescriptor.selectorOptions) {
        [actionSheet addButtonWithTitle:[leftOption.leftValue displayText]];
    }
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:NSLocalizedString(@"Cancel", nil)];
    actionSheet.tag = [self.rowDescriptor hash];
    [actionSheet showInView:self.formViewController.view];
#else
    if ([UIAlertController class]) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:self.rowDescriptor.selectorTitle
                                                                                  message:nil
                                                                           preferredStyle:UIAlertControllerStyleActionSheet];
        [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil)
                                                            style:UIAlertActionStyleCancel
                                                          handler:nil]];
        __weak __typeof(self)weakSelf = self;
        for (XLFormLeftRightSelectorOption * leftOption in self.rowDescriptor.selectorOptions) {
            [alertController addAction:[UIAlertAction actionWithTitle:[leftOption.leftValue displayText]
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction *action) {
                                                                  weakSelf.rowDescriptor.value = [self chooseNewRightValueFromOption:leftOption];
                                                                  weakSelf.rowDescriptor.leftRightSelectorLeftOptionSelected = [self leftOptionForDescription:[leftOption.leftValue displayText]].leftValue;
                                                                  [weakSelf.formViewController updateFormRow:weakSelf.rowDescriptor];
                                                              }]];
        }
        
        [self.formViewController presentViewController:alertController animated:YES completion:nil];
    }
#ifndef XL_APP_EXTENSIONS
    else{
        UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:self.rowDescriptor.selectorTitle
                                                                  delegate:self cancelButtonTitle:nil
                                                    destructiveButtonTitle:nil
                                                         otherButtonTitles:nil];
        
        for (XLFormLeftRightSelectorOption * leftOption in self.rowDescriptor.selectorOptions) {
            [actionSheet addButtonWithTitle:[leftOption.leftValue displayText]];
        }
        actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:NSLocalizedString(@"Cancel", nil)];
        actionSheet.tag = [self.rowDescriptor hash];
        [actionSheet showInView:self.formViewController.view];
        
        
    }
#endif
#endif
}

#if __IPHONE_OS_VERSION_MIN_REQUIRED < 80000

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([actionSheet cancelButtonIndex] != buttonIndex){
        NSString * title = [actionSheet buttonTitleAtIndex:buttonIndex];
        if (![self.rowDescriptor.leftRightSelectorLeftOptionSelected isEqual:[self leftOptionForDescription:title].leftValue]){            
            self.rowDescriptor.value = [self chooseNewRightValueFromOption:[self leftOptionForDescription:title]];
            self.rowDescriptor.leftRightSelectorLeftOptionSelected = [self leftOptionForDescription:title].leftValue;
            [self.formViewController updateFormRow:self.rowDescriptor];
        }
    }
}

#endif


@end
