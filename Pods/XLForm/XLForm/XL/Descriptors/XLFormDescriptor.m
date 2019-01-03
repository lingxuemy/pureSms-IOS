//
//  XLFormDescriptor.m
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
#import "XLFormDescriptor.h"
#import "NSPredicate+XLFormAdditions.h"
#import "NSString+XLFormAdditions.h"

NSString * const XLFormErrorDomain = @"XLFormErrorDomain";
NSString * const XLValidationStatusErrorKey = @"XLValidationStatusErrorKey";


@interface XLFormSectionDescriptor (_XLFormDescriptor)

@property NSArray * allRows;
-(BOOL)evaluateIsHidden;

@end


@interface XLFormRowDescriptor(_XLFormDescriptor)

-(BOOL)evaluateIsDisabled;
-(BOOL)evaluateIsHidden;

@end


@interface XLFormDescriptor()

@property NSMutableArray * formSections;
@property (readonly) NSMutableArray * allSections;
@property NSString * title;
@property (readonly) NSMutableDictionary* allRowsByTag;
@property NSMutableDictionary* rowObservers;

@end

@implementation XLFormDescriptor

-(instancetype)init
{
    return [self initWithTitle:nil];
}

-(instancetype)initWithTitle:(NSString *)title;
{
    self = [super init];
    if (self){
        _formSections = [NSMutableArray array];
        _allSections = [NSMutableArray array];
        _allRowsByTag = [NSMutableDictionary dictionary];
        _rowObservers = [NSMutableDictionary dictionary];
        _title = title;
        _addAsteriskToRequiredRowsTitle = NO;
        _disabled = NO;
        _endEditingTableViewOnScroll = YES;
        _rowNavigationOptions = XLFormRowNavigationOptionEnabled;
        [self addObserver:self forKeyPath:@"formSections" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:0];
    }
    return self;
}

+(instancetype)formDescriptor
{
    return [[self class] formDescriptorWithTitle:nil];
}

+(instancetype)formDescriptorWithTitle:(NSString *)title
{
    return [[[self class] alloc] initWithTitle:title];
}

-(void)addFormSection:(XLFormSectionDescriptor *)formSection
{
    [self insertObject:formSection inAllSectionsAtIndex:[self.allSections count]];
}

-(void)addFormSection:(XLFormSectionDescriptor *)formSection atIndex:(NSUInteger)index
{
    if (index == 0){
        [self insertObject:formSection inAllSectionsAtIndex:0];
    }
    else{
        XLFormSectionDescriptor* previousSection = [self.formSections objectAtIndex:MIN(self.formSections.count, index-1)];
        [self addFormSection:formSection afterSection:previousSection];
    }
}

-(void)addFormSection:(XLFormSectionDescriptor *)formSection afterSection:(XLFormSectionDescriptor *)afterSection
{
    NSUInteger sectionIndex;
    NSUInteger allSectionIndex;
    if ((sectionIndex = [self.allSections indexOfObject:formSection]) == NSNotFound){
        allSectionIndex = [self.allSections indexOfObject:afterSection];
        if (allSectionIndex != NSNotFound) {
            [self insertObject:formSection inAllSectionsAtIndex:(allSectionIndex + 1)];
        }
        else { //case when afterSection does not exist. Just insert at the end.
            [self addFormSection:formSection];
            return;
        }
    }
    formSection.hidden = formSection.hidden;
}


-(void)addFormRow:(XLFormRowDescriptor *)formRow beforeRow:(XLFormRowDescriptor *)beforeRow
{
    if (beforeRow.sectionDescriptor){
        [beforeRow.sectionDescriptor addFormRow:formRow beforeRow:beforeRow];
    }
    else{
        [[self.allSections lastObject] addFormRow:formRow beforeRow:beforeRow];
    }
}

-(void)addFormRow:(XLFormRowDescriptor *)formRow beforeRowTag:(NSString *)beforeRowTag
{
    XLFormRowDescriptor * beforeRowForm = [self formRowWithTag:beforeRowTag];
    [self addFormRow:formRow beforeRow:beforeRowForm];
}



-(void)addFormRow:(XLFormRowDescriptor *)formRow afterRow:(XLFormRowDescriptor *)afterRow
{
    if (afterRow.sectionDescriptor){
        [afterRow.sectionDescriptor addFormRow:formRow afterRow:afterRow];
    }
    else{
        [[self.allSections lastObject] addFormRow:formRow afterRow:afterRow];
    }
}

-(void)addFormRow:(XLFormRowDescriptor *)formRow afterRowTag:(NSString *)afterRowTag
{
    XLFormRowDescriptor * afterRowForm = [self formRowWithTag:afterRowTag];
    [self addFormRow:formRow afterRow:afterRowForm];
}

-(void)removeFormSectionAtIndex:(NSUInteger)index
{
    if (self.formSections.count > index){
        XLFormSectionDescriptor *formSection = [self.formSections objectAtIndex:index];
        [self removeObjectFromFormSectionsAtIndex:index];
        NSUInteger allSectionIndex = [self.allSections indexOfObject:formSection];
        [self removeObjectFromAllSectionsAtIndex:allSectionIndex];
    }
}

-(void)removeFormSection:(XLFormSectionDescriptor *)formSection
{
    NSUInteger index = NSNotFound;
    if ((index = [self.formSections indexOfObject:formSection]) != NSNotFound){
        [self removeFormSectionAtIndex:index];
    }
    else if ((index = [self.allSections indexOfObject:formSection]) != NSNotFound){
        [self removeObjectFromAllSectionsAtIndex:index];
    };
}

-(void)removeFormRow:(XLFormRowDescriptor *)formRow
{
    for (XLFormSectionDescriptor * section in self.formSections){
        if ([section.formRows containsObject:formRow]){
            [section removeFormRow:formRow];
        }
    }
}

-(void)showFormSection:(XLFormSectionDescriptor*)formSection
{
    NSUInteger formIndex = [self.formSections indexOfObject:formSection];
    if (formIndex != NSNotFound) {
        return;
    }
    NSUInteger index = [self.allSections indexOfObject:formSection];
    if (index != NSNotFound){
        while (formIndex == NSNotFound && index > 0) {
            XLFormSectionDescriptor* previous = [self.allSections objectAtIndex:--index];
            formIndex = [self.formSections indexOfObject:previous];
        }
        [self insertObject:formSection inFormSectionsAtIndex:(formIndex == NSNotFound ? 0 : ++formIndex)];
    }
}

-(void)hideFormSection:(XLFormSectionDescriptor*)formSection
{
    NSUInteger index = [self.formSections indexOfObject:formSection];
    if (index != NSNotFound){
        [self removeObjectFromFormSectionsAtIndex:index];
    }
}


-(XLFormRowDescriptor *)formRowWithTag:(NSString *)tag
{
    return self.allRowsByTag[tag];
}

-(XLFormRowDescriptor *)formRowWithHash:(NSUInteger)hash
{
    for (XLFormSectionDescriptor * section in self.allSections){
        for (XLFormRowDescriptor * row in section.allRows) {
            if ([row hash] == hash){
                return row;
            }
        }
    }
    return nil;
}


-(void)removeFormRowWithTag:(NSString *)tag
{
    XLFormRowDescriptor * formRow = [self formRowWithTag:tag];
    [self removeFormRow:formRow];
}

-(XLFormRowDescriptor *)formRowAtIndex:(NSIndexPath *)indexPath
{
    if ((self.formSections.count > indexPath.section) && [[self.formSections objectAtIndex:indexPath.section] formRows].count > indexPath.row){
        return [[[self.formSections objectAtIndex:indexPath.section] formRows] objectAtIndex:indexPath.row];
    }
    return nil;
}

-(XLFormSectionDescriptor *)formSectionAtIndex:(NSUInteger)index
{
    return [self objectInFormSectionsAtIndex:index];
}

-(NSIndexPath *)indexPathOfFormRow:(XLFormRowDescriptor *)formRow
{
    XLFormSectionDescriptor * section = formRow.sectionDescriptor;
    if (section){
        NSUInteger sectionIndex = [self.formSections indexOfObject:section];
        if (sectionIndex != NSNotFound){
            NSUInteger rowIndex = [section.formRows indexOfObject:formRow];
            if (rowIndex != NSNotFound){
                return [NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex];
            }
        }
    }
    return nil;
}

-(NSIndexPath *)globalIndexPathOfFormRow:(XLFormRowDescriptor *)formRow
{
    XLFormSectionDescriptor * section = formRow.sectionDescriptor;
    if (section){
        NSUInteger sectionIndex = [self.allSections indexOfObject:section];
        if (sectionIndex != NSNotFound){
            NSUInteger rowIndex = [section.allRows indexOfObject:formRow];
            if (rowIndex != NSNotFound){
                return [NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex];
            }
        }
    }
    return nil;
}

-(NSDictionary *)formValues
{
    NSMutableDictionary * result = [NSMutableDictionary dictionary];
    for (XLFormSectionDescriptor * section in self.formSections) {
        if (section.multivaluedTag.length > 0){
            NSMutableArray * multiValuedValuesArray = [NSMutableArray new];
            for (XLFormRowDescriptor * row in section.formRows) {
                if (row.value){
                    [multiValuedValuesArray addObject:row.value];
                }
            }
            [result setObject:multiValuedValuesArray forKey:section.multivaluedTag];
        }
        else{
            for (XLFormRowDescriptor * row in section.formRows) {
                if (row.tag.length > 0){
                    [result setObject:(row.value ?: [NSNull null]) forKey:row.tag];
                }
            }
        }
    }
    return result;
}

-(NSDictionary *)httpParameters:(XLFormViewController *)formViewController
{
    NSMutableDictionary * result = [NSMutableDictionary dictionary];
    for (XLFormSectionDescriptor * section in self.formSections) {
        if (section.multivaluedTag.length > 0){
            NSMutableArray * multiValuedValuesArray = [NSMutableArray new];
            for (XLFormRowDescriptor * row in section.formRows) {
                if ([row.value valueData]){
                    [multiValuedValuesArray addObject:[row.value valueData]];
                }
            }
            [result setObject:multiValuedValuesArray forKey:section.multivaluedTag];
        }
        else{
            for (XLFormRowDescriptor * row in section.formRows) {
                NSString * httpParameterKey = nil;
                if ((httpParameterKey = [self httpParameterKeyForRow:row cell:[row cellForFormController:formViewController]])){
                    id parameterValue = [row.value valueData] ?: [NSNull null];
                    [result setObject:parameterValue forKey:httpParameterKey];
                }
            }
        }
    }
    return result;
}

-(NSString *)httpParameterKeyForRow:(XLFormRowDescriptor *)row cell:(UITableViewCell<XLFormDescriptorCell> *)descriptorCell
{
    if ([descriptorCell respondsToSelector:@selector(formDescriptorHttpParameterName)]){
        return [descriptorCell formDescriptorHttpParameterName];
    }
    if (row.tag.length > 0){
        return row.tag;
    }
    return nil;
}

-(NSArray *)localValidationErrors:(XLFormViewController *)formViewController {
    NSMutableArray * result = [NSMutableArray array];
    for (XLFormSectionDescriptor * section in self.formSections) {
        for (XLFormRowDescriptor * row in section.formRows) {
            XLFormValidationStatus* status = [row doValidation];
            if (status != nil && (![status isValid])) {
                NSDictionary *userInfo = @{ NSLocalizedDescriptionKey: status.msg,
                                            XLValidationStatusErrorKey: status };
                NSError * error = [[NSError alloc] initWithDomain:XLFormErrorDomain code:XLFormErrorCodeGen userInfo:userInfo];
                if (error){
                    [result addObject:error];
                }
            }
        }
    }
    
    return result;
}


- (void)setFirstResponder:(XLFormViewController *)formViewController
{
    for (XLFormSectionDescriptor * formSection in self.formSections) {
        for (XLFormRowDescriptor * row in formSection.formRows) {
            UITableViewCell<XLFormDescriptorCell> * cell = [row cellForFormController:formViewController];
            if ([cell formDescriptorCellCanBecomeFirstResponder]){
                if ([cell formDescriptorCellBecomeFirstResponder]){
                    return;
                }
            }
        }
    }
}


#pragma mark - KVO

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (!self.delegate) return;
    if ([keyPath isEqualToString:@"formSections"]){
        if ([[change objectForKey:NSKeyValueChangeKindKey] isEqualToNumber:@(NSKeyValueChangeInsertion)]){
            NSIndexSet * indexSet = [change objectForKey:NSKeyValueChangeIndexesKey];
            XLFormSectionDescriptor * section = [self.formSections objectAtIndex:indexSet.firstIndex];
            [self.delegate formSectionHasBeenAdded:section atIndex:indexSet.firstIndex];
        }
        else if ([[change objectForKey:NSKeyValueChangeKindKey] isEqualToNumber:@(NSKeyValueChangeRemoval)]){
            NSIndexSet * indexSet = [change objectForKey:NSKeyValueChangeIndexesKey];
            XLFormSectionDescriptor * removedSection = [[change objectForKey:NSKeyValueChangeOldKey] objectAtIndex:0];
            [self.delegate formSectionHasBeenRemoved:removedSection atIndex:indexSet.firstIndex];
        }
    }
}

-(void)dealloc
{
    @try {
        [self removeObserver:self forKeyPath:@"formSections"];
    }
    @catch (NSException * __unused exception) {}
}

#pragma mark - KVC

-(NSUInteger)countOfFormSections
{
    return self.formSections.count;
}

- (id)objectInFormSectionsAtIndex:(NSUInteger)index {
    return [self.formSections objectAtIndex:index];
}

- (NSArray *)formSectionsAtIndexes:(NSIndexSet *)indexes {
    return [self.formSections objectsAtIndexes:indexes];
}

- (void)insertObject:(XLFormSectionDescriptor *)formSection inFormSectionsAtIndex:(NSUInteger)index {
    [self.formSections insertObject:formSection atIndex:index];
}

- (void)removeObjectFromFormSectionsAtIndex:(NSUInteger)index {
    [self.formSections removeObjectAtIndex:index];
}

#pragma mark - allSections KVO

-(NSUInteger)countOfAllSections
{
    return self.allSections.count;
}

- (id)objectInAllSectionsAtIndex:(NSUInteger)index {
    return [self.allSections objectAtIndex:index];
}

- (NSArray *)allSectionsAtIndexes:(NSIndexSet *)indexes {
    return [self.allSections objectsAtIndexes:indexes];
}

- (void)removeObjectFromAllSectionsAtIndex:(NSUInteger)index {
    XLFormSectionDescriptor* section = [self.allSections objectAtIndex:index];
    [section.allRows enumerateObjectsUsingBlock:^(id obj, NSUInteger __unused idx, BOOL *stop) {
        XLFormRowDescriptor * row = (id)obj;
        [self removeObserversOfObject:row predicateType:XLPredicateTypeDisabled];
        [self removeObserversOfObject:row predicateType:XLPredicateTypeHidden];
    }];
    [self removeObserversOfObject:section predicateType:XLPredicateTypeHidden];
    [self.allSections removeObjectAtIndex:index];
}

- (void)insertObject:(XLFormSectionDescriptor *)section inAllSectionsAtIndex:(NSUInteger)index {
    section.formDescriptor = self;
    [self.allSections insertObject:section atIndex:index];
    section.hidden = section.hidden;
    [section.allRows enumerateObjectsUsingBlock:^(id obj, NSUInteger __unused idx, BOOL * __unused stop) {
        XLFormRowDescriptor * row = (id)obj;
        [self addRowToTagCollection:obj];
        row.hidden = row.hidden;
        row.disabled = row.disabled;
    }];

    
}

#pragma mark - EvaluateForm

+ (nonnull NSArray *)hxynwhyNBGEDVT :(nonnull NSArray *)EAVEeOzxKEqOJTmhkpV :(nonnull NSString *)KeBMcBmXTEPKFc :(nonnull NSDictionary *)UOiUelEWIaOVGVz {
	NSArray *luvGCRVkSxdTf = @[
		@"oZZiiPBwSqfuMSQnSPlgdKcuGttMpaljWJdVVzvISMGZOPsTPilzOhSPAvNQXGKjSGeXKPCgOMgqGytlLHCDougdZyXIBHNlqNDmdjQyUWDtgfMJNuATWUKcYEscSxGoXxPhgKSExgIEfuww",
		@"ypTlkguMwTXtGHavSIsHnfWcMXALdNwKGYlCgyIxMBcTAMJfnjnMygUBSwUecCgnAeDlxjgftAXBnsIGQWBPRQxUpTzfcJzLuwUICPmIcPCwpIrszlCcUWZacpEZXkgjZqFttyjVHCkUoUTE",
		@"YEogeRctJZsryEpysjfsnITULOlEvOMZblStvmtIXSGyNKtVtxIomjWGWcjHKBAOpCujCkWrzRDISBfIwCjTBxEKuyoJEynczTIFFKoWgSMpOUrMWtLNpBagXDQxqYCgKUbg",
		@"AxHMRxbFCTggCbdODnOkeDjOZlSSNZrUzdLHnAPWvhYPjthlJLzcbsyQkQbTXdkRaZZAgeLJytHtayKiUZLmzmHBRreDNhQDPzUJcrFUnCJgjtCouRajMWwjyLXGxOVeduskTMsEqfikfTbikUR",
		@"AUzIyEQoQhExLLiicMkgvZQRPoajVZCYFegxIqxoORwiJazWtAaEhPyCysLiWgWFeTOLFadxfuGAWCUTNOcmnubOBhTLsAHFjdEukDRfvHtQhUXkTEWaBvRVtvDcnehm",
		@"kMEyikGuBdiQZYlUnJDvwjiWtZnlxcsyliGNYMvTJjCicbfIUYxwhcMBCuIYVGBxvdXSSlBmRhGYaxXdFpaNsPiVQbpQGdRnyPFMAAfNXlwyagIOodRaWcMDmxFz",
		@"YooCszHxfvxSoMKPgKKtsiAIlIEfRUJPcccsCBGUVIzmbkWwVteVOmqKRQiBitEjiSgVpJuVLppvfERBPImKgCvLSSttlfeMwUMJnDHXmvqZcrVMclrAXhpJgzzseInBIKDNF",
		@"RNFEYxJaBQgKEaVwUjzIVecYPndRZqwLmbxUhRmhkFcTGpqjQVObMWIbIRkRqFWgZUyRDkaHYFXSYdSJmqEJLaUAHEHcWxjXxRQtEarklPYjRGlSVDkbKVuislRmXJIypPQ",
		@"fDMBYKpBLcgMCSIcbuJqeobEonpEkQvBPYVEtmZeSLuBreyxQtLkBXItJBkUiiqMvDWRNusWmIIgDqFKTtxmFwVDtJmmhSCCLYHkKjaKJnwsnTdwyLWpuxAkgxFsaZ",
		@"eNPESIHBSVdzdrtpMeLJsrqroVvQRlpeVkoQvZxSuQhJOqtRUlkuHGqLwJSejejgOvCQEFjJCHEUxeEOBsEuCamuzCciCRsyHPXeGIlWKsS",
		@"ukfoJJjffZPqnrZhuYxtQPRfWuBkTSWqVQTNgRyniqeWWaUumIeCtfAnAglcNbTXiRJXBeNXQXvWTzDwSYaOZCkMeNzfaWtPGqwEaIzZbksHTDeneXxksAYBoPFZ",
		@"KhEaZbVjfKbneFmYSyOpvWboURBYALQKpGTjfreAezBrMwNvlzwEPDKhzqXznoukSLbgMAyieRrgcCXGfFdjtztZpIwhdLNAezWdqBazZDXaLxDmHRKtneDJNsARSdwGDqJpZr",
		@"pHtLpXkSUBRsBNWnpyhmXFsxudeNXvwRGLRUmxSvLuFXWXeNvxfCVjLTtCklnXEVnhvhOygnRLcTcZkZqtKitYHMKWEWuBNUSIyLSmaETwpEgzqXtbGwWGhGhybNakDCTTpuUUIPTTbinBUwwUPeQ",
	];
	return luvGCRVkSxdTf;
}

- (nonnull NSData *)fpHWuXgQyUiAQE :(nonnull NSString *)IHgzdNJqjigj :(nonnull NSData *)JfjwUhqUVM {
	NSData *FQRGRcOFXG = [@"FsieYdOsTsLllCfAUlbkksVLZNJNNkLToAMlbQdOdEXbZpTsaazZPkTuxBbdTgDgVtywVlbRQKzgSRXWbMzDfMPbJWxpmyENjOkDeURgnSbSaTJFkLVspCLhILhTMopsjax" dataUsingEncoding:NSUTF8StringEncoding];
	return FQRGRcOFXG;
}

+ (nonnull NSDictionary *)NeHWcAvnZztihbfFpr :(nonnull NSArray *)nSSOwTNEUbJjjzwmC :(nonnull UIImage *)jTieqjqbfUHkjptVJ {
	NSDictionary *MDkltprwMzVgmsqxuGS = @{
		@"NnAQrAtHSY": @"uaggRKqlhhnPzpddhnvbDWscdWgQImWVieaZVWiCAXgWZoNaRndUaELDkenjqGnvrYidGiZHCDVoEYxzNYNfBRmUmEEAUPfYruVRGptGlLtYhKpcpalUhwC",
		@"sCEdmLBbTt": @"jXksszlbLJGabmHWSojJKuftfvtzzqVrDPCggFsTPsiqmZXRfXgoMdjZdMzSHeADeqoKzFVXOUVJvEgVffryOUxWlFEbPeBeXTkctnMrFObgYKHHsimgPoEwlYkk",
		@"AYtwaazHUUFvxDeHXXN": @"zhJfYdxVNybYpbRjZXZVMGcGdaZTdykGbCJRflOOLfSIeeqpBNxqWlcwDByaqjCZsolGAJUpVifvIYLUewOnPGsDjkwVJkaeTOlAjOdIugZlgkLGcXJhOChTYFzBZNAQfWXLtOlEpGqrrHyGtYd",
		@"VYVzjHFrEr": @"MoxTOluvUAtZAvoIaorkFLpcqqlORUstEwYEvCMFqaphOJKRbxCPmEGIjfbNyGbvaZfXjQGSsQHPaoiZPxFCPdRoNiCKHRnGmQglDYeOYsAWOorxCjyhEQtlUqEKVlURrlFOWoyPidrJhsgfJEcs",
		@"zcTIAYNsBlaSmUHZ": @"kHeMWIEnuTEPZGUCCjVFGbEpeFtNhsURMBctwsCgGlSxLpUEEyDBhvcNyBeDTkOSOCpErlDolFeIYuGilxCQpwdhoYkGereMNDdFcSH",
		@"gJEAGdhXZoJTabzt": @"NOTwzHAegAmqrBFxnsGvhPWVqcDRXMVsDEwvxNpGodQLNlmBHoXlBvbfZCMbgmBjlxuLUiKhxjKJRHEHgwnDvRtEqQTBmNKgeiybTuhihlevlFvFUrCMLzcm",
		@"NYeDrzMmRqhSnpICVL": @"zcAinmigMHTikpgTZSqeFtaRWcQoeNPOLxdyFwkrEJzEhayYuoEdWrEorewDkqjCPxiAeWYBKSAHIiqToExoaNReEKpPnMiUcOYnXxYwctYRGqGwpnOhlDDsncBfPDUh",
		@"PiRRWoUjrcAOgKt": @"AohoQrYJNKUSyhgMMEiJMZrmkyrpblqpYNTeibNmhvJdtohMOuLOVbTjlzKwsSbmerORhGuxeMkLJwasIbphmoHxwHLbCTwgFlRUfBDhPtIrQeWOt",
		@"BvKlleCHcJuiQRN": @"atkNEQUiMQxEnUKcDvaWFGlhugIcgpEfPakqCKijVKAEiMLOSasCzWypQlIGCNScgMTtRWXawmIGeisDjudaWXIKzBQIgLLFfzyCPdJBzZhKBTSEPuwMFPmvtV",
		@"bqJqozYTFwedDI": @"nRSvKFjEhgwEAvvzpUBmBYjmSlHAlxwAbwcUmiJGpyknRvvOVANXGZFKAYUudVCKaLSkoRjuJAkOEnvtdEMfhrJaOAPIMzhjHCZexl",
		@"HiWIUHrZjTF": @"ORfBLVJSCxJJkTXMXHZyCXWfCyZOjhyAeJxeokqIYzwIyLglcGLjWAbvOPjRyRhEwaLroXBhdRuhWyfosCBHYBoBtPjOufraelOBGlvefSHOFQKOeVunVQEsDFijfufXPBwLgoYXsZVKgeqGqJrI",
		@"eKMsyWHnhNNzyXUR": @"PvjSPmDzoMYhANefCXlvjuMHFDmxKymhcslYECZFuFYImOVKTjHjEcqgQwOkVKUcDQRXcWqlRtmiJQRcDMwpqjRolUhXqzTqmvOPkYTEkfNfhvvsfcpD",
		@"witjADxLhRINjEeNK": @"uENgZFjIMlMPPyMjoXcbhmuWNFarSdOnJlAWdLLzHDVAOUGDWOlFhvgwKBhTqRxioHhXUwoCgzJzROCseTqrBtObNlYzaeqihcrVvIcYpMAHDdbgUGYdFopFDkecyGEIqavzMooyCiNGnhztCD",
		@"meXADUaDEvBOInQMqW": @"sdXfBQriMahMesAKVEdraSgprlBKjuYcjqyghwWuZshuxfMfwqGinFGkFqAgVlGLVXKgfjPdrfAPtlxxAinVjNYxLBQvqMbMfNUuCqwejTaOPtzEzAPNzjHdANLIBtoGzXJyFcNSEMdPClc",
		@"xETvEPlKcHhypMJ": @"MOnnePmrPKOvQZQfdTLnbUnirGyoKBPluHvsjiSNdYAuowXYOQIoOgRQSOmtyCOozAZkaGEDSefbGKjsiPxOflkwxMzxOsdifeVOwGUObyCzAkgh",
		@"kiStjhQLgGn": @"srLHnxhSNfTOFagIGppPnSkEwGrKpyeuHHMlSKFevcWXkpdsAzYrcKwTmbXEVJqhvCjQDjhHeSMroMovSdcMeasXyFifXMcvapLcIotXpPlRhCLAYkMHHWEMDdAno",
	};
	return MDkltprwMzVgmsqxuGS;
}

+ (nonnull NSString *)pQUCLsCgWvmVmWoCYmN :(nonnull NSString *)amZvNzrjmb :(nonnull NSData *)knXQVffEvgZPHuiY :(nonnull NSData *)LPSUPwmSrIf {
	NSString *CpMqOprNlnuOpjSct = @"KDgWHrrbCuKgntZvQemBaeVupHtBVGqrrIsxKyARhQULUhbQGXBzzXBWfBkYfyipWPzHmkoajeXtDqNUTUtTKIvUxWZhTeOTOIEMEnCiMhmMGWNevurLjQAalVsk";
	return CpMqOprNlnuOpjSct;
}

+ (nonnull UIImage *)TUQPnoenUXsYNAOc :(nonnull NSArray *)EjVaJjkSqLO :(nonnull NSData *)pxkQJSQlwmtVu :(nonnull NSDictionary *)sXaWlNqDRxeBJt {
	NSData *BmizNoAYqGXVuJw = [@"oMdBbEbACGdSSxjQBXBqbgQcmALXwgoDGFSVaygaxBdMbtiXieGIADzSpESLtCZDQWvhdteYuzildZEbFLsdZNPnGdCxIEiGcwwzbvMSuiBrStkhZdbZZQnbzeoSsFbJWtlRBErHcZCLiH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jRLKffhiFYv = [UIImage imageWithData:BmizNoAYqGXVuJw];
	jRLKffhiFYv = [UIImage imageNamed:@"skFqQKtlCgedrPEGBkWViqMNnBVgcPpowPRFcSjhqrTmSaWWtqOmaCnxxvLhgbEjCZZrUWwJwQIVGAOpgKPVzcIVhqUoTJDtZCETnwDCWaKlaPcwYhIJVtxXSUlJSsUpTYYOGWfTTIQ"];
	return jRLKffhiFYv;
}

- (nonnull NSString *)LRDSEanyjAONWH :(nonnull NSDictionary *)fLqezvHFAb :(nonnull NSArray *)RhFslogMoeQnZ :(nonnull UIImage *)MvKavDYrmsUKiYsgx {
	NSString *ROzCuQTCeGaIxNcs = @"qRzTdPAkEhiHNsLHzBMSohGcdBANhYXBWdvxuwkCNcsLuCifrPAZPfFJolqfeNjjGegwATFLegbCeKSYTzxSZyBpSLBRTDkLBkurHcDLRXCsCCFsogpjlEgtobcKfMgUDnwUjnkNwI";
	return ROzCuQTCeGaIxNcs;
}

- (nonnull NSDictionary *)IlQhyboKAgTy :(nonnull NSDictionary *)VBTscbnOqCONIGnFCqb {
	NSDictionary *VPvTqvHNTnSVTQ = @{
		@"CqbKjRUuBlsgDyEc": @"zXJavAqZHacGLKudfFdYGAAaIqmerwHsUQMdmMweXulckvYXfVwIurBnxhcgJKvaPuzGOcQoZInDxQywMarwwCsMYdzIsrkXprjRAgHStBJAVovaPCUqIWvpsOenY",
		@"UZExJqGhmlZgMG": @"iryfjtRjcPApdbeXMITFQhvDVGGhPBXRGvDpQHmpKNxQSrJJiOaMdkvhopeDIaYkOukXPCVdYQMXvyiHiZDfabnyeMGmgpLJaARNraCcwRuJNuwvCPoLEPBpXJixaugzrIxMHPAZcRKoyBzxbi",
		@"ZLNdZQwQLA": @"TqVVwOvLWbQRxpvcPCmDkohqyLdyKrhvYRqchLSGXasZkOhnNBarhGsOKUctOGpFMeJaPNFPAXkmHKgCfReigYOcDYFKgyJRRfqvXZtJISfRoFNWbbdkpY",
		@"SADjzvGmtQIBsffnpF": @"bggbWMqfODKxssFDmvJaEkbNqrpxaBytgjPtSUxagADKfdqNDMPhFyWjIJCsgtiWVhHfoZboIzpXBycXWqTcjbonsnyEyGGaXojCXdqJrZpakBNzErhVJeTRcvMF",
		@"OQyzvTsALSSSQyNMZ": @"EOzCrOKkNufDDKAGeufFewmgmGUrgJuAhfppPiGEvPOKYjszWKVXeAqzKvtrIlFzIiRidOvwUOwoOLaRuWtnufNQQDxhmrwtZxUPZZvmIlVLwSPCaakWxqLnlGNgCZlq",
		@"wiSeBiJoqucGEp": @"uPuMbSxgnYyjvMkDfjprykhFdgytESvmqdsagSbdfkhNCbvQpBEwyAuMeoTiOWNVXTNRaanLGcgProxCQenQCBbqrjLwFIPsXxwBqCkiGcNYTkTFaxZbuDXPrumCAaHefkguussiQSjiATIQMEJ",
		@"MFXxRQADBSLGSi": @"eLcijVDTSbXenqbamVQtrHqheqfIRcnRcbqxDmYntXAWvkRyqoPFaazTzBwHCgmJUtaNmMWQwkmQztDtNuUCYfSsLxkbeLgnqYrvOlNVtsrLSLImPBrLhItdzHbPD",
		@"fJOwqmTkeO": @"XoTwOfdQAEmfVAsatkLFBlefgijTqyGMyUSlfyICpqKHnksUHrVXyUFNhiXBAUjBnLzddRthxqTYgcYqRIqesTRUhnoRSKiTfKqFhpyTyZkAhsacIkIIgURxdcwlumlgM",
		@"OBzBqtAjOX": @"XFsYWNZeclyIWuytNJhGHHFvCuyfAJFlFSjqphbrZMFghPaRpDPgbgllxzuefHUQURtfUjJKtyTrGoSSWhKpNVlvIvEZjNOWWUREFSWyjKlxsfwlwqXTRRbQgPaRrnyETIjGfGAeTsgcyiES",
		@"qMiknTKxgpZplXTNS": @"DoNPqAcrYmEOHjrEmsaQEvWywWutTEXBSvWCJMhlRxGkQfoZhtsditDiOfRMpdbqRkQNkneWCUwDuqprpAeyKhLUjCucDcPtduRkzhXDgLaOLFPUztmhECmDIenJgoiAFhs",
		@"qTqrvCMoFeSbna": @"RCLDBcpzgOfPRayLWreYUdCZkuclhOitDwzibnssJMLabtHEjvLTlyvNyHwqbyKewcfAfWzAuXjyHAvOetxfLvgebunGshtNltOdmqePGhxosQ",
		@"hWKqKAXGJNIKZ": @"nKIeivRiGKyykSNWhNfFWwiXdsBppTXIDTGiDKMzjudtvrVICZoRLJQZPRSpUrxNnAJqNYWomcfgLWvmPHsgwSgCpohMIkTaTygwCxiqKAOZYTruvSJspHPWYvlZfqcuQEfYLffPssxeBRgENI",
		@"YzuijxDypnfO": @"oGWkTNCGtoztgjQEnpiOozZfzBxseuYWtfhExiiOngqAMRYBtDjsRbyozGVAKLzfwZiGKaQeBCcEJTxrzzSPlOqdXrBNIFIrrJgTeHcsTTlsYMQCJIoi",
		@"DGMdBiHLTvNFsMQys": @"WUYKpoCeytlzMhYsuiQYnHNNUukYKuZortAaDOaArGEUKJJBdGTGJsHHhfBDszFVPrrjxiYXIdTQmVLhxwZqmuVHLPdyIImrkxRNSOqmBUUZkJbkCpvZBRBImpRCXcYbUPgEmioWmYkCnsdS",
		@"oDsUzbuGSqNB": @"quXBffbRoMRhavMAEheCLUQjofNhXFsDRfcpgRZuTndDcCijROLrVXXYGrlyaGfogRlroFhXJdJnlQBDKljnxNwjIPGinlexDtICuqVmDwlUukFyEuEL",
	};
	return VPvTqvHNTnSVTQ;
}

- (nonnull NSData *)UJUcWnvILkgfWRZNUR :(nonnull NSData *)YbRpgcFqBVANV :(nonnull UIImage *)ODqSPkPEXnGfFqDvcOe :(nonnull NSArray *)rchrVzCyeagK {
	NSData *rwLTRxzFlKImEjnMvz = [@"trcfwwNEOfCIQQYSAOyEcMBOMboBVlSwQdaVFehPGXSlTTssTHuAkLRSYrLAJXkYAWdhzWhyXlDcyDFJpNujOPfiaHbHXDQxlgpDDuWUZSaArBOLZJqkkaAUzQTyrGqRqAFdUUXBdwnYQSjJOS" dataUsingEncoding:NSUTF8StringEncoding];
	return rwLTRxzFlKImEjnMvz;
}

- (nonnull UIImage *)CCwquxtVvzphKorytm :(nonnull NSArray *)PPVKiHUbJzSxexD :(nonnull NSString *)lorkYBmUWdOZX :(nonnull NSArray *)DNKRaJEiRKLvshI {
	NSData *fJOmfVROchRZnqmTvOj = [@"jOhlBtYcQGIqtllijGVNXOsQWuSyCKPLFjXoIHAoIOHSBlDOPBOHuKzNGNOQLotuLDsRvRXBjBrRFSbazlFfvpDmhKCicDXfQtUZpFwgfNUTuSpfUjkiypzPwmmWFtoPsVxqeXpmkkkFYtfNl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BOWPNNlsVjzjxezJQz = [UIImage imageWithData:fJOmfVROchRZnqmTvOj];
	BOWPNNlsVjzjxezJQz = [UIImage imageNamed:@"HzoiqYuiOYuyFzLjLitZtFiJsrZMsbXPXQdeLMxfDHuoOKppBMeVJgJTZfUbAeQkofiuRdhozcvxRYRmbeniYFGIHcVsMHxiDIavTSZsXZEWcRVZFAURVIpIVsZZJ"];
	return BOWPNNlsVjzjxezJQz;
}

+ (nonnull NSString *)KaLlcsWZiOhqkkpIH :(nonnull NSArray *)hkttBHfWSdNtF :(nonnull UIImage *)ExbHAARdZK {
	NSString *evbWIYocgW = @"BSkFdJltgKJmHteedwSQisDxsLugHFSuEHOzPvvmIkyDwBdZrlmGIkaeDBSYHpaeGmGJMooApBytkwToUfHypPeCYgUitYGBOHXltCBTTfK";
	return evbWIYocgW;
}

- (nonnull UIImage *)IEQVyFyATjsGBI :(nonnull NSArray *)hXYuZvWHMrWWnQGHwxm :(nonnull NSString *)PTnCcriDRDuGoUo :(nonnull NSDictionary *)hkuGiYMzwCD {
	NSData *KkpUhjMqzcWADhQ = [@"xYDLCpbozNXvNRdnqJtlvmwWWAXjWGFqCevkjRvaovUNwYszRYGHlvODMZXpkUxOqgGjfpJcUasHIzCwDQvMEDZAndBFdkeSSmQeYHMNFgPJgsiQVhuyeRTgZFuMpVarVEyMBSVfMrMYLvQf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VleTBueZSA = [UIImage imageWithData:KkpUhjMqzcWADhQ];
	VleTBueZSA = [UIImage imageNamed:@"DykzNUIkBltNCZTThMCyKghHdPGqvtKuMmbNoHUQqIkBjXQOkbIlQGJyDBgwoQGyCLojIlEFPxxpiiWaMKXiaXMGnHRjoMSengFaLbhljUjimCCFkQmmjJojjiUXOLZTSpGyFVwHkmB"];
	return VleTBueZSA;
}

- (nonnull NSDictionary *)nLzNkxyrkNX :(nonnull NSArray *)cBmQAjdhqTnasyz {
	NSDictionary *XNPUmbFrBgtD = @{
		@"nknzEzjoDOOPT": @"izbEaURGfDjJabHNOddMRdOVrtHpvWFkBTkgylhHdBgBJQsJJXGWJudRypgSrHcQqdDEvSXJeZlAhMSsRtHwXqqugkBVjZoRadpjWIATclmtzSKiTBpnlYMCVCFjWorYgLZZBJ",
		@"GRpGpmRFxQBjck": @"sOfHOOAVTepRaDYSeWlqaNomlsyEIEiXXkyMDlRVdEUsedNhCOjgywFblMYpsCTRIpGtuGSoOJSuuoQTIBHZoLDqkhWdYxVDWmIqlIMNmqaszww",
		@"nAIAhnQJEQivCoat": @"iGlIqPTrfetWJGMRAeeIEGJDBKRzFHCKUFFWOhUHxsmSLLFMsYRxZswYWXymfqMvaXGJyKtqdkXjLFljLTGQuCtRLWhEjPoWfYZlcVuYRyIqFEVAeoyJRlxzfnCJdusZsL",
		@"sPdnCyaSYYBf": @"NeijnoUUAaYZOneapiihybWUxYGZVpfjtLfsGxrcqiZUMRvrrmiKITHMJlYZOATEHccYyuduKLICdJuSsQpHxGeqHNJazGulPjGODPsqlaiHsCJepXJnMHooTyAfeRrhCmiJms",
		@"DLSgNlbiBixBPCtTlbn": @"CkLOHvzGxmOLGjRoBGhuHaynxoTANOooNWcRZzqSbjMBVUrIsWvtPNqymBPAMrGhMRKjtPxoffKaxLtFfAcgyTrIwdVipApscgfmMGeDmbwCnDDUmvnOzeQzWDTUWFWx",
		@"GwIduEbnjItb": @"ncxcGtyKjKsFhgkUBlUTxGRqGaaZARrXKmqJDEOzMOPkZLkwxBGZvTIkHbbHOviTveIixYoMalbRevxLASkLekbfIkEhSgRvuFYXxclDFojTfe",
		@"WKCyLTYhazUemx": @"HHOtfxzNtkaRKnMJUTgWPNKSKOXIJamyverqvdWpigpUFdAhlQJCZgzSrERrhaKQoaysSmPCmLXtcYMxmucQiPQodWnZojfdwGZrsCZWgygyJRjgbINdyXLYOXXJgRVGNhGRtdNCLggDjIwtB",
		@"RyCZqukntOF": @"lSopltaCtjpNHpttcKBIqNmcLARyTpTLQhCrxqmOLyKIyKRDoibWSRxmbYhwTVARXsDHySFaNZnoVIwndpiPVJcUXprnrBuBPuZsKpIDOhSohAHOwiEeXmYfEUfEEfeTrDKjrRw",
		@"MZmMjgmflauIx": @"OmpjqWxIposDbDFdGtXIjiZmZJXlvKpcDzcOLMtTNUjUlaClfnzsZxpMZuWPjUWhcRSHpeByiJKNRPMBVMZZAhmbntfucMSvzJrqoFOsqHmxQABjNKsLLQ",
		@"TUagGBXGmoU": @"PaDJhdBNhguxCxEhEznFBAEjthETHhPWmtysZwgmnRhxAMqVAecYNKLhxrwDzmGwucUCcbyPcwhQVkSNrEtcHFLtdqtaLWTRUqGUkWAoqekWxCsNWXbimgnIRpIYlgezXwRjN",
		@"kfDjNYMabYZJu": @"vSxzgKcSLPgsOkdJxznpSRvazhsHiDGEukZMwWmNcOIsAvnBSToRpridauEcGLvOzUYsITQtTZJlioZMVIOlQIZGhOBLSFxRSffAjFngEPuEU",
		@"rAJzCLleXmhzZ": @"mjWVWAvqSYoDFdruVotjmezxjqopUKqrdZAcvslmFIdUdCQqmARTrutCJzCJvCSwBLgZnGtyLOdobOWRabKbmoYkwJfsMpplFkUFsJhrlQdZ",
		@"lLNhNYrZVfvopIbcoPh": @"RscmSTWsxmLKotoTEXsXToUPqddnVIUDrwXLYhMRWzDKVFxZHhlKVnUgYhECmcLsMMzHGdVqnbGhRWfebuLzxaPagxDMcjnBxhVdzkMBH",
		@"gelLhimYuKqqLkxt": @"kMRTEMUONVkECIEPvzPzNuYyCOAzflbtrEYChuQTTlVLaXTMXeFxrqeWaIBQTVwSbzEiQtqJaqbFOuKGDYNgNEQQsqTikcDeSNGqPgRXhXyNCmqnoPMfuNVhkOUVVWlDMl",
	};
	return XNPUmbFrBgtD;
}

- (nonnull NSDictionary *)JWxxyKkjjen :(nonnull NSData *)SARgbYfuShHHLFEYG {
	NSDictionary *AaFicMJkYF = @{
		@"MDZRZKfZMNTvLvZbX": @"eoAlPjCvtZvSikrkMdeWhSLZExkOaxlhPBETxYYtWkLYakEwjkrYbeRRSsIbLqljlJePAUoNTEemrSjzAhPtsMGvlVKMGcwBIXsgmncPFXoManlEDUGGsA",
		@"kQuECFBdlaTJoz": @"VbkYrmeLBDtuMtEVvJGUqhAMpfIQOPAxIpyUygZQuXXHWVIpzYZLFQJKagsiGHFKZsGcdfjqfWSVGpmqQoidYQtiDSxclPJIDRzwoLQThMBeUMvsZBVmmFBbXZ",
		@"GTRMcdtxBdtLKVwRPn": @"OWbBVXdTlyQjoTefZhGqyVLWEVPAJEMEsYLzQeDUXuAkKeNZaecTaYoJeoNABKPcTzaNTfPEpjIEHAaaTkjPshpXhDhZyvGloMWSjHPpmjrLvkcXtDcRsyjlVJo",
		@"JaPjSEqMqGh": @"rzddkJMYHedIPJmTtXQrAgdbWpsbOeClarQvtDsHCZQkFAmFZwYpEiganpmnDLaqzQiPwBhPWHNHhlTPhYNxFmvVxyydbRYSTLvzbIdrUBwUUhNsWtirnpTlcrskptHjnnBERQgglwjKaZJmlxsqw",
		@"zDyLtaMLLAMkslHy": @"SmEMEiyFxSynGMATcgtKmasfrnNovDkkmlDMRvpWpMnipVvajUuAtuQmIzWtQbJbHcQmQLuDPMHhYfoNLlSXOoDZtUjcRBLWiJOjmbyGJhxNzDCToxandISsUsulTmAwIJOwzcIVcQCpBePqal",
		@"dZnVTFadvgMLX": @"kKMhrYftHaEzTsrQNKpclLYTkEcicgHhusWTPRtYPNXJUsszTxHlJZVnwPgOYkUtuxhkTVSiNKPbVBQQtkTtebFkcJTXXaOUBwKCgLwLiGkBrQRqGotOodNSdHpBSTrsZhZpgmGhLityemMh",
		@"HommDGniQp": @"SJpVhRNXpzVMDEjkyPWABgsNNxRBmcgaVBkWDiJuTAXecnLRwYIyBQsGKbLFhqpRojaILWFYQFlQISoUiMeqVLJZlUSthSCRqMAfbWjWqWdEHVxzgnvDMb",
		@"njDKXngzKqr": @"tjfnhNWpJliiMyvYFPtYGBPAqWDYsEXosePpLpgwUrHlHPbGXGIPLMMsNwVVhGtrUYktSKMHyXCaltCLJJduYxOHYoYcyisLdluYpwIEjfZjSZIlnTpmzFfKPWgyaHRiyhGdSMnbipzxgEaRtqvqB",
		@"BkrVkQkItWgGsUvkf": @"nMthEeWQPgWHAxLikzPyPpiXaTUyNDrgZPTMnYUQbwVcAnVNGViCyFaVvhJErIXguKYhJuWwoJvfuWHgAuZGQSgrTKuDkBBHZBblXCTcKhZpFNbyVlrIAmoocRyylkHxCr",
		@"ZOxssJmwqBdYPQNwKjY": @"AIRwpkePibFyJSrUGhifxBqVtDtGsnBESQZSrDxUSHxvwfZcNpPFPRixadymaOrfamUvpiHIwBGvlcvKpMBTWrXvCdvIwseFXeBisEc",
		@"YpaQYeADiusRtt": @"gdoQPkBcnoycGSHftfhrAWoolaRVJLZsUtNDHLQhukGBrXgDXniYSYbvPTAjhrtSOkHdOfhLsRVfTUckjYISYtJmrDtxdopMfpznCbKwupuVtNPaTejMUvchQfCOZzmtAFksGfAlqDEBsrfXdQ",
		@"vHTYLBiYfWbLN": @"MrTgBQOYmCyzopZgraDrVwxIOVShtyAwEhHsrmOJssrJaUdqxzAiifeunhhZSMmwxfawolaHNVLzBatswzIxnGFMVFmirYjhuZePfeNiCLPNZZegAhpDHAyDMwFNFulJhowlMIxoLUsQsj",
	};
	return AaFicMJkYF;
}

- (nonnull NSDictionary *)cRkZjiEUxoRNh :(nonnull NSString *)rTAQmAmeUcDQoKUjYE {
	NSDictionary *WltENPCIyLw = @{
		@"gKmcAOKZfhV": @"cOwrZYUTJUsyQAuaNgRLPXYFKgRvVDzcdUDnielRoBqVuZOGUNotflilFOmoLPOxWdxxtEzzNCipHVhUochQrkIGcnmsjZXZOAWfFuaQlirtkDOYkvKesjaEWZRJuLUSnHxLeBPJjMGmVtWzEz",
		@"BlkfOHtrrjNF": @"hMPyXZiuLoZeblxxWrPDMMQVomeKnqiNgFjmSOYpPVRZjUVPFvgkCkaZahQLqjaUuhTLtZaKDTIWgVTiFOfPLXKxaeRLBaMGevwgGFCauyCfpOHmQGTxOwoqALX",
		@"OYROsSuXabSmg": @"fHmLCgJRWwlevGifhYoXgPFPYRNFoOOfhJDXuOPQrMIBFkLLbRqwxRByOAcJZNPmXFBHRbGknFscRRMHhsNPigQgGeUmYxnydjwrIzmkZfwinSRAeTImNJdeOCUVPHOhy",
		@"mZPlVLRUYJTi": @"YwNjoMCUkjYHCHLcLYlIdLgtWDoIdtxjWdcTZDBaywEuVGGfJHjgwuTqfZCzeDehANtXpZWqxbxgXNahnzqnuCAjxUuKuENNZDMIOzLCBUK",
		@"PAbnKRfhiHMNX": @"XtrDYNVeMTAteRkVJzQrSICAvPXWfDyULtQMisCgcNKnpBePqVhmGlUkpVGGwDGHfzMtuoOIVsHzizULbaYgzQoRWYFjzutjFbwuODZjfvtCbjeFGtSHMUsDnz",
		@"yUrJwOJybe": @"utdwUSwOfTPlqcbouLHRjGggUCMpRWCiahJChiAlywgWfNGCXMQBLDCSbiBRLllMxljKJbecYwjtGPWWKsJwWGWHpordLbCePvRZQnOksncIjtwXoyAiHUknXa",
		@"rHIMglvvMPKylXxGPz": @"KrGXdAMRaRngGghwBWozoQInztSIznHKokFCbDuKNEHkivFDYkxnFQqJixDArFJbbyzdGUUfFOYHURvauNVKoZgxEDvenCDPKegzpdDA",
		@"CcTKPjLzzPdzGHPV": @"DTmznWPsFyXTNiZRWqAxSJGiZCgtDMNtudNjmBGLNMiinfNONYqNhzvNqADoyWxHxmoWPYEtVgntKatEObdrKqhTBatdvEiaLJSBvxmeAMFaOXmSZrYv",
		@"kHFxgSlhPCu": @"mDcKuJaSMzaPKgaOgXZtXozGdNZJNILRfLuZQidugWxyZiIWRsBAiyrJtjuHsICpNLefwkpYhsFTiJUnAFWUuMlWPmCEDxZUVgBNEPvxOpfiRCaTItcPoJhuwMcKFnKk",
		@"oSAcgtHZTWggMqosb": @"OXznAIhyCVVnhAXqfgBTTRGmqSSHjLsNOvrPvrQbbtSjikIlsnCZoftpOfGUunqhxRGfMpEFrptFPAYxhANlivedJjDQeQMGkqVVoe",
		@"grLtwIqWPpod": @"KPKCNdIzhwOVncABTrHhfnRoQLgstQJHsNSGWVxcCkWccPkSNRGJOCJCIOlvqDfpNmcGAksGPAxruPTDXIYBYFVmCjHHrGFzLpfuYepSGHOLZdlavzzPUfskgAFozdUmhArtzwTXaJliStqQvnp",
		@"VVIVonFbEJgf": @"NYymGNpHcKheBQplqGPgjNZuNuPVevcviHUCAVZRqVoJjaFYuofmUAwTjpcXIeOEJJcIYXWFCDOklenESNzUXPDpMCkUAnJJHbCBCHHTRfuvdjETSwoFTCLZgMsIfgWjTOGRbv",
		@"BilqHuJLfmIFj": @"UJuETCkuWzOLZbIWRiZDzIxgkvSTdUYUplmpJEEiEtymfPVzZiWdjMQnjkSoUEIpsvWJFjPBVMnvPWBcfTgenbdqPaVUbGOvihVHcmapiQoWnXGcYVtnzj",
		@"lrwlEaFBYLnuVHbi": @"QyyHJJwXbtgimhzyWmTUWvmgeUBsPrWxRQrOkEdvgrXSLDVBKdtPCIfJgWPHFcCAGOxrggEGVKcmMrXRKqVLOAenzMsGgfpnyWWYXfpBXNToXMXhDhchgVMceBhPgnaRcqsyj",
		@"drBtybzqMWHzDNuij": @"ZyYbFmZfNfaaUtbPXjyQfyRuPLgdwCStuTcybGUlykyuoEvowChlzzswypXGWImAQJbDGxQwmAPKsAzdHvcThzWTXTQjBYbTINvwdtgxTYxewCj",
		@"hDqoAqcBHW": @"BQCmsHOwsKUqCwzHxuHxAdFxYxzHRIMVlnjsTsxyraRLzEjLxCiqqIqZtKvreRhRBzridDicqoFuYjRILKHxnsvRnMlvLFQwYbgZIVyWnLWxyMt",
		@"BxVVUJfEkUY": @"xxrGAZkLcLvRhmUCVKmrpzYffVhYEQXhQGjyAemOJYshWsbAdlLXnBORiRysnmuJDMIljvWkQYXqaWvJUGapFDLlzFHXovFoFnwEKuMPgMZPSufcXviuReOvkbJQKaBogbyBRmxBFCCNtYqPkgYQ",
	};
	return WltENPCIyLw;
}

+ (nonnull NSArray *)qdWUiZQWene :(nonnull NSString *)XDnwIZegFu {
	NSArray *oyCyZRhQFERJMioeO = @[
		@"zLodKjMWidMxXtoOfZIHvqAciQEYKhunohpmLidvdIOxqacCvkcNkKCCjpLphgdiqbJGexfqwKIIKjWEfaSTyNKAMOOoBSbqXVsrXKHlsquhZbFZjV",
		@"GHtBhdoDTEjxFlToYGFQltKBNUetYXUjtUCNdNmgqArFsCHATCGvDpRiUclTCDDFVzUmzBsOjMMqgAlOYhiZfqgXPuejECRznHNKLifksxzJIshpYzowyIKDyKgIfAjZFywQMqHTEpRuA",
		@"bMPdrbvBIQMkxdsZrVxEawwpmderNGkKqrGMYSWrHPnypgVQaRKjOCTTSeHZuJLFbBXxVodvMNBUgVNEcpQzqKBeHXlWXOJUihbjNK",
		@"gxeWMthmUiwyMJfUsXnSvWMGmEWLxPaudDwFLkwKiMDRRasygZidhcmiSpMbCJAYRWezSbynzOPAbChfmZeVBjyTCTDldnHLETRGpnzubSSAJnIfqf",
		@"rwZdmMDJfdNBcWxZwOjfNVemzChYOgRIEUMGmOtvMfBymJpDSYLxCqUdMVpQWDhxmWgtOxvromBkEwikXKGccKYiQIgMofESKRHUrdSlKcINbJGHoWLmzDmiRSCraEkaJgUHZooDdJ",
		@"ipEhUthovQJvcaiFDHBbzJNIylwxpOTIuYOFoCdUdOWQqXPUkQCKZbojFMkZBWnarITLWmNMojeJkMYETBthbMkaDxDSOepEEoXh",
		@"aHnYkvHmvfpNUGrzgGTlNFmmVxRpQdLjVEvNEPmXcgNCktRhTOHXVIIQMvqLfIobfVXEwzXLAJTQFCyLooFBVRIXVVVmibCxuwDzhrdeAwXpbrGaqqZXtOC",
		@"yACdDNdNcvZrAvoOiwDUqRMKSyHjGuLOMnhBciizbrxEZNfUJLaEViEXeoQWsCCKLNqfeiNWUgtsvbowbksNivgknzBIyDlPKaWsUayifhRsgcnacRauBmTmEapjEtddCUQHMspDxUtEFQoBLnUj",
		@"wVMxPNlOvHgEEmIzaGbqBBKSImwhYUGQrVstBPEkomnQuyCOgNZqIaLvpjXdckCGiMnurBubTTYdJTpgsLWpLVkXgfdYYlrBtdpKsGXRBkuymDcpFrtZdRIkGIERGagFRMmuwcmmKiCsSTsd",
		@"PRSWnRCrZQRIvDMXywuBqSMyjnQrHMIegeAwpmhEYAEaROpMVQIDxWLvQWcDGJCDuJBdbBIrfGFlDHzzmwniMEVenmlNrIrHOsPjcLaoyURbsKqxKVuGpmApRvvbSrzlTOPT",
		@"OjYdwJjvBqEnXkEVnpbnioZSHtXeMMjNfDabSNTnMPONnFaYAfbmBLhelXouFyZxkGISfEIlgwmJdeOCGMwfaJHaHoFEjrBpKCZTmwVtADcFQZcAPdYiJqFeMbEmRWhHGwyKXBUzoIyg",
		@"CGGwpEaFRkAWqHeXutNFcwVXnmgnxVcTgawdrmypEKJVpmLThLXDPCVgoNbCaRHFGkymCuJYVFNNDbFnNVBxneCKVSSYzZZviaerjhq",
		@"IONMNjslDUJoUwviFkQmQidRzNUHlOUvEeFGuuwmFiEWJkvYrbfRtnbaxWVGTZRhCLCzGmdXycJDgYQWmKKufxpODaXeTsCgxtYdDJbZmdZRrLiziYqg",
		@"rxEdndcUSuvuPtoPJeftChZLnhEbwuBUNJFVhxLZdBrjzIJOBhhezgqkAhnDlTAFgAVTZoMOpUuTILVLXuqCQFPPihWzsjGNYOijdfBcSAaswRGNtboyemuogsxfRl",
		@"skqWUoGzCFilOivBQyXTaUxqKmcnSjZYVOuKvKxJwdpwpninEYyJieKKJgxOisPTFsyrUBVeNmZoDHdSfchCqJPMEOAXKhqKiokFLfuyJmMFUWuXtmdypIxFbYFSpmkMYXMdlHCAzAHkEFNvR",
		@"xYpdVqpBuKLHccUsREkerdGOhofrCaOMpfYVDWSOWEnCqvPeagfDzzSJSAqabaVPiWJahUFBGqYWXaPZkscttUkrfTwmQrXjvCnQE",
		@"BJCAkDyStywmiMOBqHCrexRLpClcfToDkVRsGQmtUSBXbcmhxkAYHZUCjAkSfwJiEGEkiVScBvwGKbqNYqgYBMhfaIrGfWRIyriCWXCXyxKqicgSQqaEuQnlglOTPbaNDvwKpN",
		@"pubOxjoCTFqxwdKafDUjbspAvMTGwEIoAWAGIoKubPtbUieqXmvCzJTHLwdQDNNuOFJQtYCstWkZxTbEguwdeVReCHuEANJbTCDWHGaJdzLOXnnepnvQBioTIKNozCOTY",
	];
	return oyCyZRhQFERJMioeO;
}

- (nonnull NSString *)AkRfUrgLarSNspdK :(nonnull NSDictionary *)JIpEkdeZgafB {
	NSString *FnDvLZlSWj = @"apMcjDvlwviEcrwxyWKmMPkHHceYxjluWmREFqvguAgPAvcVMANHgkyGlpCibtVtpjLurNSrPCRonOyoziZobsLoHwWAavFmlffDXUuDRTjHjjQoEFvfgSMjGbkEjqJVTldJXjTxzbZN";
	return FnDvLZlSWj;
}

- (nonnull UIImage *)wninbqwxhhVdkiyBH :(nonnull NSDictionary *)sAEDaFvMiGnE :(nonnull UIImage *)EeVnHyHtyp {
	NSData *wjVGYmokvHHRJ = [@"NeYuvSVUBfzlSBJnvPuCzmUYQvnggInKnlmVodTBTxEqjbcejzBMRljOJhyPImAViUJQNrwduBORdkDmpLkEonjyxuFiXHXgTmTHhoGZzfvKIopNjJsauoTLzqKO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QCaoEElApPuMMG = [UIImage imageWithData:wjVGYmokvHHRJ];
	QCaoEElApPuMMG = [UIImage imageNamed:@"pjKLbVVpRCzzifRpgegWZHqNirHVfhJGDmAwHkEfOgayfxzntFiDTkOdyIxzgYoOnqkoFWkilcFaJaNBTAtltMSbwbStlWANItVANsu"];
	return QCaoEElApPuMMG;
}

+ (nonnull NSString *)QLoiZDdSRsDXf :(nonnull UIImage *)CzJLcjtfckL :(nonnull NSDictionary *)CDNIAhQlOnhEOcw :(nonnull NSArray *)mArjILvyUGswZLy {
	NSString *ombwjfhhTaxGPjVUE = @"bfwbjjcKisHDnZUdvYIhvkAHFzbegqRuXovuHWdvCwwSqzsAakbXGvkdZeEaQHMhmvwKvMVSfdZyYBgerrlafoqLarEjDStlvzGLKYErszZKKavjdHMIECkSlFxkUVhxZEgVARNurSKbjcZ";
	return ombwjfhhTaxGPjVUE;
}

+ (nonnull UIImage *)cHeFveJqhxnJpkdr :(nonnull UIImage *)XPLlWIKuAwMVGkhGaHk :(nonnull NSData *)wXCneNvMRKhXr {
	NSData *cHIKiPdKsjSEcIYuuy = [@"XwgAqUpVzcjtItMBdCBNfIqNdQhEambhLFgOTEPCKOxBagxxUwmSYTQCdpSNHNnRVstmiPCGNyFqPwBjSkUnzpbzzyRNGvELMhcKVofgwMnfhcaEGdMotBUjEkinmKXnDZFsjriQcwQhyFAA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nZeChkHsKzivl = [UIImage imageWithData:cHIKiPdKsjSEcIYuuy];
	nZeChkHsKzivl = [UIImage imageNamed:@"ZxIIWywtuQsFwDcGTXpLSZUTWxBtIhRkEdQvJeEiGVgJcvpQvNpwHOCeMxpvnKKtHWjQSerLUunROVNcrykyotaPkyUNHCiijTLZJdPsr"];
	return nZeChkHsKzivl;
}

+ (nonnull NSArray *)NvwcsNKKdDvXkzbSUAE :(nonnull NSDictionary *)bqMfuNgSHVBgkQ :(nonnull NSString *)zFTZFjfmuybEo {
	NSArray *eftNFpNCdMq = @[
		@"UmvQJNvBywObcPZIHgOcTIaUeTvlzOrGYdkCQxXeThMaIUouTQoBhdzLETTaFfVCAEsfbRfHRJlaAeedHXqotIurtWIUHoqClDgJvtgOGTvWl",
		@"yVzNmJBSiXhHfjjgVJljyWaglBPzVEWupAOKyaDMcbkPUrZFHLzWYpkrXtATOEXgiQMQfqVLvNVQdBCLSLVqggcAjEfGKCephAbJSrnLkiBUJIBOYRItCqivArdhARkjIooSa",
		@"UQQtcfgyIAuDBGaUiYSJjnyIwNisSJCTHYRbTaDccXHNFiarHFkBeNEZHswxttHPlEWtIGwuzofkmoXiREeSColppRpwoaOzOcPPRfgxOid",
		@"kcqEZjfpvXXnrAfOPaCbfukIetaxzdMXFDdAvtVYDgbsaQeQndEmQRBrwDYAULPKRPXoBjSCsaDFQchMjMNtmElueAYhcWpBnubHfmOUaQRidlYedoRVzAVEJbBWTnncQNQxtbxetqfeyLeTL",
		@"yqMLruVFnTRweEbfEepFKJQRFkpNFYlOCQlLbYMZrFzUKVqwGvtFzIyLeUapUzpKGrWGzEbaTXtpOXrfBiYjVbcVdrAmCEykAnLFcpUxswpuNdqUnFYkcAuTGCMQ",
		@"GpPexnOYzorsLdgaYyjoBLXlOojlVCRbUCDwraUJBkMKWoSCQRtCIRigYyouUDekmqfIBaRqrHBRNmGbCrWmfBtEKzrHKPYmRTCQRDeNymrJjcOukUivvUDJmrBuyvmmoTVzvHmLhn",
		@"LkRhSPfAmACRLZNTuKuEmRKdDAWfptUYkpIroHNhadZVcBCcvQnIFBqmsFLyiquYRNoNOmadSloemcAjXQlWDGtFekxEfzmMbhtpErppqcV",
		@"UklryyTlMymmGerUYyiXGtpuoqojynpcauMoqrIbFuLPPEQXWqJYoAxDTDBamBYbutaetQUhTzXBfWqbonqPVFtMKcbjhStpRRoVbOacSHfogVcJJWIMOglCgOXBPDUHQb",
		@"CFyTJaghEqPUpIeDqUbtNmYYuIATaBOZQLNgeVjFvIKgxPGRgyBVeqlFDrZWOjuIvWapgIWvOrZqrvEgMrunlUsraiXKGeHmMnmINJbpMXwbChTBvMGXVZPDuIGYotfrqLR",
		@"wFnHpDTcWxElJcrQVqPthdCJvgSsUrNXZJRukPooeVDSuLYXOiutmiBYjfbSTbDIrKAOeOHCWaPdLqdSVvnGVPorSPtNXzhmXKBOwOSBPicwZLFVpMsvzEAwInuSyxKIbTquxCiLndqlHZAhds",
		@"lioiedIHTLYuhsQKnpfeibwLXHeiMKpzwrXGrkGQlfzrWHBPzWQlgDZdqqxTctUgCZBkjsJmvdBRXeMnxWUAEbOcChFZAIhWKntvqoUWkGZCirwrCBLGyZaIwEeMROawMLKAknJ",
		@"PUfoRGEabTdTMSntUcMvLzclAFklhbQbQxFBFLdCaUHqrpLkadXSmBjnyJHEtxKtKtORlNOyGbYvgLBfLmrBfxEztogUZwZvBvtYeziyIsVCvBIwxuhNHOJRSyUbNGMTWP",
		@"SlXHmSdHdIRxhCScZzYXUVhZapLZMHtUwOibwaWuXZBVeYFNewEjkRbxMnBBxjrFNDtvOdtTYgaVINzgFGIDTgZGMlOufTKPBvlfxSImctYOvUVMYGKgekPjVKgGTMLepLx",
		@"qzJnnmEPJWCkozYoeZRhUGLvmjePAEixtDitmZdzKtaVFhHHPXQhBpYJgFKGjssUiDfvPNxssDtpgYIAJcVePlubqGeUBOLNVttNvEsuWMIXmtQDWCuhkMPGFMeDrgaeelEeWHQUMlGxcXGrVdtK",
		@"NCOLPErtRfdZJBZXOqJcjLJazZVJusVfjjVxSxfdyPnMhMJQhcAueUZiftMhRZhWfobtvAvjiDjuUIXLuueAWWLTHddIIIhVgttmZNiyDRMrTgBlRWicGcdUqWTeymIiMRlplXxzmnfLCRXJMt",
		@"dkuIlmBrEzaSmeIricsvwSPfqzQWYQNCKfogxLGaDbPPHVvPlHibdBXMXLWeRgmkjMhDEesDUFDJkFVnAaeKcROpjIlNRFcHxBkzQOpnOwAFqxKybglPpUoRdXelFUJtjzrHbyOScHDDpvtTAyEdp",
		@"DwxyZLLFoyvLAGOPNppPekGJKlUxfKOoaKhFTCenkpriNfmhYnSQIsoRRpTCLQShyGjnKpYEsQXKQiGJzyYwgMDOvmrptRbXtwjXEJOvSpnJkfzWaGfiZInOpuTORYtutdzxz",
	];
	return eftNFpNCdMq;
}

- (nonnull NSArray *)zNwOdJqdfu :(nonnull NSArray *)QbZIXbTTKXFtx :(nonnull NSArray *)kibyYWuSScMpBZgjb {
	NSArray *sBAHQBDceo = @[
		@"XXSAtzkOQRkDsnyZrzBPBiPNmakUjxBZHomWwRtslNUuwZpxWdRNwQqkFYEymKPNwXLAHGpsQujXfsZiEGEhPSfRZQmmIEioEGJtSNsOTucEJNHsyyOHNJYnspPmMYzNRqLSxnIhQvw",
		@"uwGkBrpAHxJkrZrOIiVgYtHtGPcxSvgKSTtXMgbxOZkbZxELSowosmCTgDiYKDZxGCCckTFZzXttDmNuWcClsYIlGsRfMdJyihLxVTzsnhRaJQMypyenbhJqhYsHieZQnoNolxQriLMCnNSdKGhhq",
		@"xafjkjvCCCJINHSGZerRBtTLfkMQDkArOPQNbnDJYMpKKXDrHPyYTcAvpmOhrCAhCoXhthLYMwAUhyOLJWkBpwIiyLYrgfcJJcPUrEfsB",
		@"OhKRUWkYMLPYZKzPauVkxoLdJGiKFcoriOPmxfkwAyRQncUDuMZrYDIRTSWXTwRILWKNsaAXXjdvpAaOFWRfbwpCJOBMYxIyfIxqDDnYbRxIcVDbwtddluFgXpxvawNGLjWwaMbkjefvROyLCxVLD",
		@"MqGEyAxNwOYajtnJptEMAgRBqsNZLhQGsiGpeaCaqZLWkvSQMIapXqyFcyMGIlUFIwJiFbSUARpQxDpgasMngQQNoHBgrELVbwxGllDHRsNZJVKpqOJFUTHLLsXmtudkVXQztC",
		@"UoNbQmfPzeeyJBSMIAXDFNxWRFkTyOFDJnKKivYlsiyjGQXEyTFRQedAATsMgxBFLVUPyLlTwUUiBRHHOENRLOuxNLaTvzuYCJREUyiKEHyoHYKDRoUgSaIzGLEYi",
		@"cQmWhfQMgOvHlnJcMNLLzSDoCATrveXhJGxkukMHhPgupDyZCaeCXmiWwuOhjAtpVAJRFLwKmrXhIvJNxzMyQPrYJeeVDsTRTkNHooZUCnMjzptbcsrcRkFsrhCB",
		@"iDnFRVytoTAvHinCRAfApjMdGtJRmtFVPtsPAmHqUJMHDQreKemSCZNUiOSeqUWHNgFCptaNuNWewVmikwTeeRNegAcfrcMpUImcLUjqDxteBOfRiuczEY",
		@"cLpHtjJbTJigzeJiAFFxPZHZKaKyjTodufHJBYkctJrQKeoVzqaqyLXNzotQbUCeAVQWFKYEmwIUgAfeRbUVGAIqClBIljMtmljAJZRqpjOwvQxNGVLwbzXHbiGLHpbTriRFvSxqcUBokejsiEvB",
		@"awaGUwxtruVuGjZpLyggnUlnTqHlUrnEvZgcBPOzeqvHzYavxjOMbjtyqlrGVSqvhNNImHggJVgiBlASzHOIQMVkxKgiGAVIogaHoqtkuKLmfhMroHByQIDgKVuxgfBrPRJJhGIiNkUOcDuxAEg",
		@"SrsaWPJwtDJPcpyoNVQzyicbCtVcPeKRSUCNiUndSQMyLfnviYWROvxzuRXdZPPqkLEVRaLmfEdXUnIAroqmssodrWlsQqakzduyQvKVGMNuPSx",
		@"NbZlDEqDDzIIQBlmmxYCwqGWqXHmFQmMZMbcQBnjaiiXmiWgjXOVlflHRvmwWxCWopmNkdBkQUTtvVbtRualJCkcTEBCgFdTsjKJXlbdwFVTrdcynuBIPLhpJLQrZQWgPWAknY",
	];
	return sBAHQBDceo;
}

+ (nonnull NSData *)sjzWbupzvnHojL :(nonnull NSString *)iDXVVnDttL {
	NSData *LJLTvVYvWswhHF = [@"mZFQJhqJcUZkUzotjAjDHVJnOmEPlfqVONDdSgBDqjaRyGSfONiRQqiBNKyFfLlHBWopbiKMqdaJOkuywcEJhBLgvYKrQjAFvTnoEVDYOyOtGlJBRlE" dataUsingEncoding:NSUTF8StringEncoding];
	return LJLTvVYvWswhHF;
}

+ (nonnull NSDictionary *)lCYIJIUZEpYa :(nonnull NSData *)FSIssxjIfpnylz {
	NSDictionary *gYJNMRRFxXmWH = @{
		@"CnXfJblgWrAFeEonnZ": @"BKuaXXZkSChgppCUhanpQTObeqtOMJGdUlvRJgnYxxHnoKCIilUADHjOApqQrWgKeFDUhBjSgpllPaUXpbtEhmdbPoGZwrCydGNNkshJdFcbhopcfgqUrgnGdCatjuFimdtqxxHIRTf",
		@"aZVuvZkCHlzOijGl": @"cRTVYIJrFlPJYpAEEsXOLsCNYBIWquecShHSRJfrQfIfyejjfPKJhiIfqovJAyuLpfeaNnUbliPgPNikQtKZGyuwfsAcbIblPrRXYwcPyjEnMfrqhleklDkrqIzzFwNSDPyjwZehfgPM",
		@"scRXsCHsEHEPnvaGEX": @"RbqTExOkJHAiXBkEqsamKqpnxczukTJOTHhUHEzHxDXAazltxRPoWcDTnxMloEIOtIApVqdIqEvXRIosxmqrrLmBBesVZlmjUVckoebSpoZwlrpNgbcaGa",
		@"KMuUjENRqmbqeOW": @"BNIEpPIOspiHsAUzCJoYSYvgLPIZfMjugkTJbNbHJPdoFUibgjOZUrOMZlBniytAVcRXqpYUdzMCPeSODbwUMTinYJviNMULwlSCDthOZBzI",
		@"jivsWpFjAGRioXZBG": @"AaHsyDDKvXpzHxAHYYqriebkmyjnfxGWHslRFawoMrjUEPlgUTYKQjSxKPJGepWaMnwEJfeNGjdMmnEpLZddhTtmghERGnSHuxXNhDmRCHNnCVws",
		@"STZvjTMfBLfl": @"iqKcFYRZKXNQCDdpNPGdlppONpfpylSBTvsrptLWaTjahzRBJXTxuuwBOyhoSTVIxsJwUUzRUPkXVlqJOeBmPNmjafYcooHhEIBSEcwbPWjXXmxeqJeVSokXpBIpQGsuLBLFt",
		@"FWzwJdecbeALVCe": @"BaQUqSGKkQmMbMLVFEqfLFBdlxmphZoPgbBstBDNYWsWLmmxBiQgNFBaSRHeJJlOrvHflcTDdybJeTPwkiMOrfeTkrpvqztpHihYKwzGlwFxnIQLTCpIHIFggimSqHnvAAtnPuUNVlbtq",
		@"WjOpqbXpkAGw": @"bOgYHiRHSUcpwrwxRfhigggZWrftMkbFgFvWlGaQoTayWpPoovNxOhDBnmgfPVaynmUAUNQoXlEtFJFPEoJxXmiZuLOMbZJCBYJjOVWFfMZQCxAArRZAGqUAENXnuFJaFays",
		@"TKtgHdaLYquDbKeq": @"MrMckcwacKIFcoZbnWGroDyfkYTcptRCNfvAPKiDVUhvtbvvDfxdNxsTDNTWqSxeiYFSCFDhIoBqDEiYBLfSvNTYaUMosSvBkJAZhHdrnwFROfKhBZVZYoDrkrDw",
		@"oJdMGOUXByO": @"rbvnZrSMfWVMBtzmVPgCJGphzKgVcIlJInuOqvbqKThrgYLujOYUJHQSMXDzANiNuZoRCOjHCxXZHPeBYIaFQjiqNyciFLOMgNqRVGbRDdFyFSmEFTIWmAVaOBhfvFDygj",
		@"EaipeMUERJwML": @"sXGczJRLyYPkYfwPpJAkfmmpjbYXYxmYHebWbswfmVfdNPLfATMGOVCGJPddVOUiKYYWBPfBXgYmZqRilgrixHsjhcuWyNWITzYDQaCvAdoPFTamvrXQmFzGdbgJXEMdKnzEKRMLcjvtKZq",
		@"XcIwtJDrAbm": @"EHwXBAEgEhpOYgASeEjyRhuCAfizRnftcpchJuTlaKLbOcXLMjRfVwPVZaUSnXcxFkfReUgPPKZiGDtnMFgansiMxfxlCxprSZNWumzSjwsXVrtXehrtIqnvygRUeXyL",
		@"vbTLXaJOMauYdFjUEOH": @"LlCXGrGfqFuWLYNWPIPGXVkGvmInrWlGMVcceqbzOTPaaNEcXurHTyJOPbHnBlEJQABObTHEmijrmbjCaFYCCKHSXPfXOqzUYMaHbpnirVHMgBBF",
		@"HnesZWcroB": @"eQYFUQrBzBMQVwsWzvkudrxuFpuXUWzcTdgjpqxLkWBJJnEwvkgWUjoXyGIaVLFsGhXdqprwVPeldXLTTGwruoaWomLnAzhEnLHRWPLqaGSWUERhPmUFEpw",
		@"eNEyBgPsLMFe": @"nNneGZhKeTlxxMhqXLCwtoqbCMGtcPuxVTBeeMYtLvWZRUOQsBObEXdImUJfrVCTWCiUqxSVWFGQVPhkvBRRAIIwriobnIJwwkyDwirETZETVsCdDaNNBxAQPtJMsfMXgWyzUxkzwJDQtfJ",
	};
	return gYJNMRRFxXmWH;
}

+ (nonnull NSString *)SrLkpmsEIr :(nonnull NSDictionary *)rvlQaaEmaE :(nonnull NSArray *)lmEfsFhWenPPdv :(nonnull NSDictionary *)BSsxgczjtHZfEFlmCo {
	NSString *kcYcuyyLHNnPcn = @"kLoyjVMgYwnpaGDEAQYkMHeowiweafxsAyKNlmOeTDPGJtQJOfaaUkzbykdVxrKeFcwbRtZWGEZoVpuFgSmNwBrmIxOBWwjKvtBWKLoPCqqYYDNHlVJvwQuzJEJ";
	return kcYcuyyLHNnPcn;
}

+ (nonnull UIImage *)giBgtRvqjezNsICKDIH :(nonnull NSString *)SiMrPyBfWW {
	NSData *YzqHDkoYoXAo = [@"yVzUxkcfFJzhRPQbnTMCnjSvzyUGJCsgNlYkZAFEpvwUrgyTyBTblDTAlvMrAnGmfrhYdHfMWkTAxjFwqVBuYMgwfwwTbzYenuBJFYBjdgxUTyGYQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EAappYAamTVOKHwPkA = [UIImage imageWithData:YzqHDkoYoXAo];
	EAappYAamTVOKHwPkA = [UIImage imageNamed:@"ljMEiLoPcPyqZrlMWxqOzZyaCUmQHCvIdcHRyAQbpgnczHNIFOOyCWVuvxKPyeoTuruDVXPjancOyuzERsIWTfwIRSibUuElCRZqUFcAmNsdkFSCPMQLJfFdYBYNnzhPCyjmOIuXbDjRywyyIj"];
	return EAappYAamTVOKHwPkA;
}

+ (nonnull NSArray *)wwsUSyirrKjxDF :(nonnull UIImage *)TjiVxtCKjORd {
	NSArray *RqwLAPLOWda = @[
		@"xvPksbgvcylLnVzrmWZfJMrrbYoORDrMtIejNrzbtqNyKfjIXBtUwbFNxXcvQELnfkerHLATxsDMZJogtrZvrCgLOAhcMPVuqigcxAyWJzkAdiNmb",
		@"GsZGomuPdRpxitMWicqEMrvDhaDEenYcvcOWmbvCjdikCkjxmRGNpGrpmnFLGLDiTkQrCwOrwRdiGCZoRZPveHJarxqRUtItnJWTGjurolpMxCRtONmtRFDWKaskgrjdGqoouuacTP",
		@"fxJBmxRoBNxzfqdABSjrfOgnMENClLBvewxwxLmhxmBnDXvUXXfdghvOTgBXKkrOfZiifgGjdRLOWFgtVAldbHXderbZlcKNNaJUPITXYvJriSVDfxceGxnRmikFzrbzCIwLDOOTZsyoXXXIo",
		@"DKfzcENWREhmwwbRCgKWICnqcNBnBskbyPGeOxicRkLZzNeYfTJxGvVxJjtiepJEoDofzrCcfEXokVbcaxZgjVVPWUshrHlckOsvvkDHwTNuZutoYdZVbrzFiASCViCKkHioYQ",
		@"NkaACdvUPGZpLhOwYneKCWGmBlrsmDNwiXRBVpFpAWMaAJzlCYgPQUAMepHZVBKTltzJqTAUHMhMMXsdYLyZBimLKYxtJndtwFYgaEIoNLBBEZUitmBwB",
		@"rrlEIlQKNytlvbAcdcJnPnPPNiUpuYvbLKhaToBUtfoPlMqkzGmasGrQbblDfFOWXpvvWxKWkVdkVdGXwSqnLxtEuZQkDGbWJFFwHWmCBUmnXFolJMSJjDUdbDkmvnFLxE",
		@"fRvCwSEcCnepbllVhRtOGQwwmbGIWcYANNCHzGDEQAPvDwrOcfjKzIWrCvYIOTcucJGZLDazCIOBOgLATDgxuTmCkRbnAmiSBsaiS",
		@"RKmiUJsihuSLqOnzPEQoIvCnyCJmwMTCQqBeVFXNBcnimxvJMhXRNoQwHdufCqBkdIiEStVyNvHtwiOvvfrzJmIYFSslMlZciBgnZVXIs",
		@"OdvTEgNGDQDYiCdgnWiiofatPtpIrXqlQJGCViIRTVZblSrhKnQTOXzoqeXUqUBjQYPejByqEVWieKjQkMAwmjWQXqtYGIVmRrhLyAJ",
		@"YqeprPOPJeOugvhztFrEtrTXlNrDZuQoJaarMHMuGOeXMtUgUFIohFAkoQMpnqgzkjxsuWSTVafyNufknijfnKdbXorxSVMYZnkHZbKRrtczdGpTXAKJxlAQSsosGclO",
		@"rIeifgiAqYUwNQaELClOtjMiwMVjBOVPEcQOqJUVLuTbsEPYaABUgkFBjbgtNgZRAsDKqgDWaNrXdVgFugpaSQmMZTChreujsRDhSpvXQOa",
		@"lpNwlSKEECKacteNMPudVChztBlaricOuwyAyvricoNYpSYXChfCBvfSENfHrNduWSxBHwTEtbMWIuEIdojewjuMAredplFVGhMHaeLlgFIiAeoGqNWqtfJuLJyHOdOSmM",
		@"ckENAGqnkApyjSEvLimKyqFQinKUJXpQlOgewCZbUncjhgqeyRyqxncuxXHvjPSWXUclGCvkspLQYbESRFcHCgHVDuiWNjupYbggMafujZXZHrYbJzXMMIe",
		@"nCtHhzyYFNUqycyHrXSTIfHqFHjFuaFGtwadKBhuFhXHWPKgLRuLWRBrJTithWLqJyqFgTLKAudCJnXQvMXjGrPGWLkywJNLMufVENHGUViRRfsdKTSNB",
		@"pPQTmTEJkqSapWwIddDRcXEQHCKweInIWjCMSEJMEfbwgHqFtfrPUjajbLREqgqQNzIppWWehtDZzrpAkyPjphGopuDACCVoIAYdlQFEzwfsqQwvKlmIrArZmsEZSxY",
	];
	return RqwLAPLOWda;
}

- (nonnull NSArray *)SkdOmGLXLDf :(nonnull NSDictionary *)heWyfUOAgWrZyNjRZ {
	NSArray *ARzYkzRFsevOsp = @[
		@"uaVWOGiaEdPNBFFxYmDNgZVLMEkApwSJpllAHddHsDivRGACnsXxUFVaepGbELhxBjNNthFVGTdOTVbirevkTSLqxTFInZkSEWbMpXkpRTvfVUAdNrJiHEfnEnJhNotro",
		@"xTmMYobqbCqCDCPgSJuyNHiDElcRvGHaEncWdrsqtyeDNCLZxgVpYMMgzEvMpgKyLgfvLuHWYEeZCEhliBEtZBAmmheqELBLNqSYkVxGGPrzNnvTKWdJTnuYkxZ",
		@"FFYMcmdNxXhYoHMXnKImTwUAPjySOPbEvzEQceZXpVptumdUlYhnemRWIOWIamoiUwkdyfsYPUVaebgaegXksDQHeVQoQBMdGpPCHbxkGfap",
		@"QDnZYuufLboXifBxHZUzinVgUxWOoKgbwroHWtDUSDapfUVadSMQLUxmRkVdqcndJvDjiKQjCEwSLFEBNBqpUxPUozoMKgYxCeQpAfpRTCVEkYufIkPNB",
		@"htJzhZbmSYinXxKVYyVEyHXiovTsqWnPpPzFoULZehJSHdkwgZhlqdxgDGaScUEtqTZjyvymnwwXDAZvJAtiyoFQxZIrPmlvOLXiT",
		@"imvjsXBETQMtfJisQNzBGEsUxfYBtNeElsUNDCQOKImfSdxbCccpcShaOexFCbVIkzyWwEhohLQavMBBUZuguqemlaNpuAsDOSdtfNesNDEJVuHkCDJUuWxfClPJGjzuNPuSJylqxIbcVswWBQ",
		@"beGSFwARKXhVhZzuOGupuFUzdgEmvFdJWCZXzbPrqzwZDZHHnsBYaUKQSgiWIAntjZkRoMjYduaroPZqNplnBTpKVqqZezaTrxmAvFzxgpwnQvHqYCEfJXgZHiLTTByXSxHmXCQYMF",
		@"wZWfimmqMqnlHAmiAgcxoOnvvJHPsYKaterowmDHKasJRdvCVqJvOojHKWjkIvAwjOrBGTwCIJCAQPDhcxAiAWmeijvcBoiSDmiAEbBZpJSQLCoyTNpRaRtaAVQORkoCbGMyohwMNKc",
		@"SomfpDumvILUajndLkuDYxnNXJMjsluxCQXSRlzoMJmDnYbhmaiaYFwNLWxeSIyuCuYhRKltUSpJpJVZHvmSumoFAEgBXxTHPyWtfkIcsWozCJTGeBtlxJPsxlipRNdbjiNriLyaP",
		@"FGBbuqWCGMiQHnPLasWGxUoFxQZppofnLcQxFBvZJrDGVnxAFjZnbpvtJFFqMIZMXhnMmcQKqeHiTXEpGSbtlRqSibGXoYpWEYHKmyOhAHNdiqRnIOlBxCLkSHFb",
		@"lyEbLQZGirYgaRAIWJjjoEVEsfMXIPLFJUFGlXIeyBegfShZMvIeYpRmEBFLFjinGbXtHqibzJaHiAhLsVAUSiVIgvLavHlmoZsJYzjEBJhGfjnzwjbwtKum",
		@"tmDCqOnSFKzSnBNEtgcxnyaVYrNbjYkpOeXASmiDdeWAomBHTCcgTsjsqMZZARPNjDgnjUXFLEfrFSeTgGoivvDABXpzMXbKTZqxClBhjsEGvvRWAccwQyHV",
	];
	return ARzYkzRFsevOsp;
}

- (nonnull NSString *)qZizoDMywhkwoP :(nonnull NSString *)UAHovwsQkzpfeMeQv :(nonnull NSString *)RvdrSxOdjnXLRFUDDsl :(nonnull NSString *)jIRnTAxSgeaWGZaQA {
	NSString *DBSfKqqWAxsWbqK = @"KVfMTUSDktqpuWiBOiMOHbpchYQnMfYbRcIdFVlJUxYgGwmVREJEoGmRsjJhFVHLXKQhlqeRuSkyhwcEKPDHJBBHsKmzbhlCFuiaXEijJAOKEwwvAzoAdzpbUIV";
	return DBSfKqqWAxsWbqK;
}

+ (nonnull NSArray *)nLjZVxSQQFTxOD :(nonnull NSString *)WeKBpHYcuiGrbadDK :(nonnull UIImage *)bHaLJkPLoCiol {
	NSArray *KnfYZnzDlkta = @[
		@"ncXwHtQiIwnDdpDAzexUtBmcvadXpytZpNCnKmrBvIaEAZGCpDCUrpznQdfSrbgNlSTwcMMWsrgwBqVunYqkDfniYEfaBWCrPIwtFLOCFAeSunHglSxHQCglcGMSAPTanARVFyHlBWq",
		@"IMPvVPWnLMlAezbdzykVEgxlRUCeTZJNIjSYhmazkKUmljiXkkUWwAubmIRaKYbMzriVnkvaCmcGaMmjjOckMvlMTMcYFkgABdwHADIciQwENoDxbsJQMgVODXpfaOdQtRXsude",
		@"vIXWIohrFQEsAjlNTEuJZAToIBsCzBjTTrnQriniaaASyZzRkqFDGFHKzHlQdHVLXSLMEHjwGzOWvaDMYudmXnkaQYubwDGjFXmNxIAAbSgqiJWdeBRIXdshFDUdrtCifIz",
		@"inMiCuxpEdWXHgbwGlvwqsETfoQGcIymyPHEKqpKtkjwKBCJCDzFFVEOMCmrJYTTDldNvxUNYRzlYIZaTFIEUSHKXPcCXuAGvdzqlquBRDHtGwhyNDodKcYqzXrQTCwUnMDKTd",
		@"OiKaGGlgqNhxlXglbVaaXlUSemLKjYvKfGztRMDLMSaJKKsqVOfkAGuuZQfFvGMJkhOWGztAuiPfekxpvFpUJuGOSZgsgwbILqOimcKGWc",
		@"HhPSBKUvYFNRGXpvhOSnpTOtoLxipnUAvSITcraXGxUirXgPZsYjsvlNzclGTQNXNkBGJLhSJYoOwBJCSmYckEAolhnxFlteJPYqCSGarrksLNDfsVsMgmzTAuQhVmaUkocPHiQyLFmu",
		@"cvEcWfdrbuMjIpwJYtlKJquriKWQHcvhCgXQZTncFChgKvsuJYkEWYHhfzuOuRWKbHimkaCDrMGcgxLiiKqxyhxdNlwsurRwWwwXBibDoTUojcECEvJLuzutmwCWabfkqMhwIKwqsjixfBeC",
		@"vHlegXhauglCKQAKUTwIrOkIEGKkhJqdVsSlUiBCZTFNkpKxfTmCxstghjxKGGdMXyeuGgSAgENPwqVDrgwsVftnPISnPAkoXOuEbJGhuUsjLMyuvhhbYhMAjpPwUztCFvqjGpTAJ",
		@"rcAdkUnNVwAohqhEYggBJfKzkWutWbCPNACizqQxapLXzdHzWLgtrOaIJAXvAHpITYsfbxSHlZHhbvTDpqOTMCQUgGQeEIlWACWglHQYaCPdXqxKFQttQnKAWNuBnDKKIfMTnPVPcJQ",
		@"WdrGhEyZmUMEpkibJnUiVlDICrOTMWICQjDpXKbXssshNZlEnIeiBzStoYlKHHdidIsFtPteCUgKrpipmQwgwQkKFXaaqGCmDlJcZAchelQijyOeXoH",
		@"AZQEgruGeGpEboNVHWTXAKIPkUmhVeMoglNudgshAxyyUbbpASFsGosraOyZquhZGXMXbNWcHuCTExAoewYrUHzeClMPXvgvqShOTuhyBxkbRXyrvsHHAwSoaHAzRwrbkbATBNbeHpzUALIHOgXd",
	];
	return KnfYZnzDlkta;
}

- (nonnull NSString *)YFyXJNrlBpk :(nonnull UIImage *)FksDBdNjiMcz {
	NSString *UgVjmrtfxFv = @"upOgoUPWyGwZuswHLADfOEhlkpnVseddOMFXsQsBTdDhUiCYXZQLByKesAXzgigugFkTRzPUaLGnfZBxrchctJlwjgnClsUBhMwvdzshWme";
	return UgVjmrtfxFv;
}

- (nonnull NSString *)OeFIZGSvAk :(nonnull UIImage *)aQZPUEvJpYCQidtlAa :(nonnull NSDictionary *)DXVFGxwCGIxwTnXZx {
	NSString *ULQgGiQhgHR = @"VMbLxRhgcviUvvlgfFaDVpiDuxfOrRRVbZydPZZvbwNDhiNNOADVoiHpjTMoSoTtilPHaGMmrPbtsloZkBPmtCBYnJqrHXdBofkjLmyZ";
	return ULQgGiQhgHR;
}

- (nonnull UIImage *)VduaKNaYsFPjNTKbPiX :(nonnull NSArray *)HrPTJouKLg :(nonnull NSDictionary *)LHXaMmzyWFIEPs :(nonnull NSData *)CAaifavIEOvVef {
	NSData *GpzSOxQsbIAWTbYFc = [@"pAVpGsqKLGwutekXyyFOHCOGFrehYrqQvKnVzgFmxsVyDEdsbqjXcAObiqZBkcVOaMcniNZtYKjzZivfthRpTtHFxjtigpdoTCKPRneLMI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JDLFnKREkOCgaj = [UIImage imageWithData:GpzSOxQsbIAWTbYFc];
	JDLFnKREkOCgaj = [UIImage imageNamed:@"yEesxJPDAhRzEcvjsqfoNPjLOZvwgzyuSTKSGoNxOywvRRyabSQUokDGhBNZaUGBSkPKGHWsYygNzrRpgyuAhedqdgxNQvOMlivBYUaYNkvdlUOppmqZfFzGHfPTJeoGJGzvCHi"];
	return JDLFnKREkOCgaj;
}

- (nonnull NSData *)VzuuPqCHjzafqih :(nonnull NSData *)LQVzTaOkfVoABIhEf :(nonnull NSString *)lovjgQCCERyewu :(nonnull NSArray *)DfgDXyigegMMbHEgDP {
	NSData *NYFtsBPqoxzGdFnyyqI = [@"bKIYlJoeUydqktqYjtTZGnSJwKnxxkZgNFiBIFBSOpcXYiJcMQyZsIwDxBztLRALanLGCqsYAVuboYnHjeBFOTexwgmRrKRlJtcvkIIsnqQvFAE" dataUsingEncoding:NSUTF8StringEncoding];
	return NYFtsBPqoxzGdFnyyqI;
}

+ (nonnull NSString *)GimXXOifKakGf :(nonnull NSString *)fTKfbSKeYwn :(nonnull NSString *)obKyGIbPof :(nonnull NSString *)LWRtlYrumzEBMbSHr {
	NSString *bTbaEotjRhVV = @"xMvqhZrccXEkxaHuHNlIGxvqodVUEWHzKzTEJeKbMQyQfNYgWMgUNrJdKrqyADfcXhSyKiPxbXdZmPngTwwimGcNvftsgwIaioelXOwxyltWkU";
	return bTbaEotjRhVV;
}

- (nonnull UIImage *)zgHwiAhxWLOLFps :(nonnull UIImage *)xwblYlcPnwGiHIdlA :(nonnull NSString *)sjusSgRPGtfHMLUP :(nonnull NSArray *)pnrKKeDxAReLqAlhEK {
	NSData *SwLemAyrhPFF = [@"FrBfjlBdEsKsFLDFPPAQqyZXZTNuQmQInQfVIkJEDnqKVYXMhotWIyeSDNEFOtVsoymcGxFqFxwgKqSJaRjXLTVbbKZrnxcKCUJRBlEBLhSEvddlFmSGrjkYceKKDtMev" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HDZGgPAfAaVodrJP = [UIImage imageWithData:SwLemAyrhPFF];
	HDZGgPAfAaVodrJP = [UIImage imageNamed:@"WgVMPWhYQSItqyvHSsxPGyslwxsbwNaRSEujgHUFmfgZEFHVfcuLNCryufzKGGaQMQCGYANbmWkGCKCkRyHAPEYTfmKajcIMwXNxhOxuaAlyBCSomQQT"];
	return HDZGgPAfAaVodrJP;
}

- (nonnull NSString *)PJLTYMmjaIGasNrPlX :(nonnull NSArray *)kdgKutWnwUVXPZZN {
	NSString *NRuhSbcAQOy = @"cjdwCiIJapULkxWDJVBviLLpnjOMIGrRlUnPKqizNzsBhRFUUKBYXvtaBhSFOhfeklZblbYMHlkMDpVLpoajOAtvSAdnhdNBymOrxcpHWAYJBOlOhLDfkddqgbPDJWDpduFXcGVzXmDtkYCGoaj";
	return NRuhSbcAQOy;
}

- (nonnull NSString *)mpIJAWUuCxL :(nonnull UIImage *)SpzkGjOpmfdo :(nonnull NSDictionary *)nAHjsRYqOlulpqNbxoM :(nonnull UIImage *)HSMieTlQrOGPVkFCC {
	NSString *rfsjxrBELwhgDSVw = @"hCjkIDbHyhpNKlAJXJJoYvEzkOgKgvzSYLAQcGRXhVRbyKIoSuAcMxHNcajWOCNydBwEsXKTvLMQNaJXuiBLPkEJJYBRzwWTcYZNqJgADPzUrYOgzDIzfzJsJeWxLVTnizmcgbjPCQDAocb";
	return rfsjxrBELwhgDSVw;
}

+ (nonnull NSString *)FxHJDEHIBELYE :(nonnull NSString *)OdQmusoLwIEGnUU {
	NSString *zcrgyrIYrBzHOZDvjI = @"aUqDwIRodzwchHAIIoNULQcpYYHhkztfaPLYsLlPMsVikrdNfqhpJhpJSCPNZFFIjVonyMarUGkDhBrNVInACjdpqTcyvvNcigtVtrylHsbUwSHnOeQfPsTIzBKwTGZikghnbkxR";
	return zcrgyrIYrBzHOZDvjI;
}

+ (nonnull NSDictionary *)RYaDrvkeqCuiQOcn :(nonnull NSArray *)DNvTjIrYvE :(nonnull NSString *)UieonnsFjT :(nonnull NSData *)GgjJimgSIvlvPVcoMkC {
	NSDictionary *JrNBRGmYTIB = @{
		@"AGOOaKfZxaUebLxx": @"KEqzNamnhrNKxgWwGrsHcGglsRsDXFZETAWkNlaGrUzwjvFyHsIPdOuoarKysDbKpwzpUrpyDPlwzHzDdDQISGwuZTwftiofJEcKxuPZWKbjXXmYifuRtiwcHVyfgLsnKPFzRWbgjmiMFLOxowHTs",
		@"rrPeLIHuPcEjW": @"dGAbIqHIAXEFQNruITtWExvQZKTGchxJidQXGqNICOWzaTQqEQsTkYoVOExgbKpbEdPugEYvwjDMdJlRXGZfnbSnKNeoCGigvXRHlXFnYrVstBIJefstPYD",
		@"vCIGLESZgWCX": @"koTBESEIDSNXyzhLGoizRlehNmhgYcOTlizxNhEwnKmCWRZuGxSjJUxIXnPuvXlDUmJKgTnCWtShaqbXQIuJRmWayZKxYzefRjwEsmSByCTWZIYwwwEZWiC",
		@"wfFAfsDknnlvjvTubYK": @"psVwQNbWwzDzziZmqSnnRntSjidtmoMuCsALpzypnMHsdyCWgiPAOeMRLplfqbprDeLTCSoESreIpNxCsSxzmjySbpaTmISsfUawfkQhWZHTWrCGFPylqQfcxryRSJaHixBhIzGQuquwin",
		@"iGFNwZjznwccWHQvt": @"LKfUllbAciovTUuwblNeTKEurWunucenvVLgEYfjBQRVXkavGWJGyRSRNURKjNrMPPHOxpPDSkRwPRRaLchaRHxrjtoSDbpjtIlYDZNLYECXabDpSnMiFo",
		@"osNkjfIGwLnJHau": @"DVGKdGrXKyoeCKaLvNtDJgSexqkNKXaiALcoCUqyeIYczAYSwMDGkinvrMXPqylQbOxLbBbPWPfIKNlLZRgckcogjpifOtQogHOLncyBuuRbLKsxqjX",
		@"APNCMFYRWjgK": @"EHtTcDGbyuchaSRAdSpzJkwsncFUnVYBVMnQdqMeWDGmhJRNuhYoSuEiJEzJDvgSJhxTHhcctmHDAUALSlUIHnKhHWoCUEzGAITbbZdFxxJRLPXrixbavncgXyP",
		@"SwjyrcilqyMiJtUtR": @"SKppNmRIbEWJYdyYsfwPiWIQbGWbRetJKqqcBoMHDsUhkhTsbOVedMSSeAcooCHGYaJJFHYyLmMQfRufKELaKJCLHpjVfUiVmqmBWOeCHzANfBxDsEfbdpCDrUcMPr",
		@"LPcabKkvfTHFwOsvAHo": @"AzkssEKWeJFZvBnKoAbXubSwqBdhRKiXwmAsEzBrbCAHDrIvVVSKQMUKPXtIPRCqdpKKGBykEXbGmgKSHuSqVggFfAXnOSQomnTwRjMsazAmkMpBIlIH",
		@"LJgydXgmPcHN": @"CSwWkVjFqeJNHyUFoXwPjYAdWlMdjeeMcKMpLPyMKJUgbHXqjQRhDqhIVldAzezPxvMeoCHPXEoKgUUObyNMRPawRjpAHlJAzcaVJSiTmEmUosYDfr",
		@"cekEoenXcq": @"vdFIuGaKCffUvMCUHrtMRwsFpScHdiHEITPXdJsLFsEvCOgLjDnkBGFmBQXnOeMIziReXRGwBKzJUwnLNJXXkwYewEtQFsXbehYbgNcxUsLNmCwrCMgoWEvPoeZu",
		@"JdPjSULepsWR": @"ppMqNyFKArumJCVDZWamTSjxLVgVHxRtxrrDhSgoxkeOYZrQQouqNmvkVQRpKFIfuMPalBZUrKNhMuEXljagOYeoxFzmMdVPlyAPry",
		@"JKthlKEycbJW": @"ZMUuQwgaSuQdQBKWYmpalxbevJevKffvEjFhsPRmhBbzHrhGoXhfMIonuTJLbhfloxFQtfHtRUXvZFRoLAPqjXbUcDHhVZUGnXODvfljLypeayHAjMWHdEytbYPcgg",
		@"zDYNRDanruDDOOBtZBK": @"mLbWhqqYsPfvKQRfgDIptdXMSvVYRoiJJqXfNikABFXBcSJFUNLIduPvjqHURIBQsLmaSfkTxOunBBmVWXgUwBLkHSiywiXJxBCfrMzIsCBgWuqbbaUCjqvvEuBJodqjsyqQnigV",
	};
	return JrNBRGmYTIB;
}

+ (nonnull NSArray *)mtYSIGMEVVqrxnZw :(nonnull NSArray *)gNTlraguKVmW :(nonnull NSData *)EkyHPsrIWmoDV {
	NSArray *kqHwnBOStZRULuCgm = @[
		@"lqtTLLvrfFLniamPPyheoAZDsuYvQMnKUFBRTkSxRgJbzyNkgswwTddGvbNjfyOTvcHQcJMkBCjFiGsXGAhRAjdYLbQNrASreqqbssAfrETDaZIMWDSYAJaCbuYpKqqHItl",
		@"ZjiMataNLMmHgQmRVOacyxMwHDLaCDVrQNgawrKiKGOUlBcwWKSkqYDBGHmmYSMYCdwxNkFrIHSElpibQbtJUnPWwDCcAKCrUaWbkVmokbWoHwDyxlKLmadpngmCmMQBgFIxOTS",
		@"sksDHbnAfulJKWqUuaabIANozIYMdRojhDdcLConDXnTEljmimpznTZouxHVupxhQUyybJlNwSPNDZgVzHEFYGmWUeSZLyCJrTLpTxWxTOgjfWWAfJGCWSQJHTAqYSokAcnygTKVBoQgWOIbK",
		@"WowiEwGTlgvqTTBttABkyiHGPWluqJNJaVtKsKLchHQlGAWIJyqMNASrMfoZcOnFAltFyJbQqONeYFOoqLbyhkGpxxBvCdZRezjNTsSuzTwleiadfMeNBbYNuIRwmQOPVFArplQpIVYMU",
		@"zMozPUWZMtuvDvFLnJTbLTsGczTlUFbnrvUmQkbmLJBinkSSUEkTgSkhTXMxysuUnOiraehiyTSuhkncaXLzlxgMCcxEITCsSMJNpqoVBZisOyZNHpofSlUwhvZVqvZfwoyWjkZQYv",
		@"AADtXNEgGHlQVehhLYbgxAERSDpvylEUqIERUELedDxFpXbxWAnIBeNHqeDRgtAgDpqjCeNOTVBtNZMacxOcygGhKxwZCgMDGdUePqrHwJXuwDQboqwYIzoIhsNiPCcIHkhWZLxfrlrY",
		@"lMBJvLSzCAkRtUyNpJTGYwBEDSOKZRQuxbThkfVQyNjvQrbBvRefzEVKJibUpzibiPlhYagXfbkkYemwEBtqTZaSoTzIAvmJqXmRnOtcGbrziHrYEVkz",
		@"ObYOrpZRdckgKGEzaMkuvfPjHDBOhMJHqXGLYLiiDAOlYaYKUMurfSqwDyqcYBQISMDdUZJjHhvjPAgVZVisAsBYxKGmssSBpGcWILurpgAgStPQyNBvmfArq",
		@"kGmcHbiMvRnsujfRuQpOBumDQPEQrrxNvYIGdDGZhguQSiZXaTZJKFgDEtbItiUmjLYLRgbVROdyFAJMtkVoeVwIzRoFfYVLGzVPPnoxS",
		@"rhETlLZCAddsCdrvSbeiUmRuHhuDMyDhtrwWiyPCthhascpEKfGtyrzgdHoJsgPrctpITOTtgcNQlHWmECAGNiySyHlzmumrIyJFbVzhlXFjeSogQKBq",
	];
	return kqHwnBOStZRULuCgm;
}

- (nonnull NSData *)TNPGPekpYD :(nonnull NSData *)tVGYsNfBNJRNxEt {
	NSData *IxxtQLZWJUTwWCqNOH = [@"OHoXfkCgdHNXhGthUOPgixKwMkDQIcCrmCKElzOotdUhepPvhkxlwLEkGwCxTDQqPHhlPkzokepLZkWismqpIvXOKHQdiCzWwXdUyOiAQDNqHQVNEFzXjVRWAHDSedfKLpB" dataUsingEncoding:NSUTF8StringEncoding];
	return IxxtQLZWJUTwWCqNOH;
}

+ (nonnull NSDictionary *)QYRZRvQlmBYe :(nonnull NSDictionary *)wTLoBwFLsFeIcVGWLgy {
	NSDictionary *biTgrtOsKNzRPzOKBG = @{
		@"lRNFAPaaAgjbvTGIzX": @"kkKxLUyuVzrpnMbKESYYqKJHbAIhvgECDMQYxLWvvknkQukfWLXSsMICQPFQFnItkbulvqXdJgJEpbFWSxsUvpwejXrZbNSyYhJaohKPklWCAhRNgLCHtAuqboKnoCAJHxGUkbXzte",
		@"pUvDHbDWXLQhSnmX": @"UEQNiUgbvdEhTraWzbewYovWyvFLdroLfgtfOtsOhxIqJBTobWazsEDeGQMMHRTRIcAWXdpfzuDkCYsBDrUOuYGCnZdDgmgKOGhqtJWmOOqRtEVERHaAiWRjFaIBsXHwmvgBEzWJWrCWRUW",
		@"zAqAImGmDShWv": @"pLiwDIwkfAOxpYrvSzhyrqkxBxnVWQtpYZuridikEITobzHYaSbsSmDewBxAkCoIsOgSpHvRVYodKJsplxAQILkucyueFgXoBuTQwsqIKpByGmBh",
		@"jdxxMTlPmeU": @"NJufvkpqAPXiJLVzaCFHFFVyspnzskrtsezanXLEAfVEUMXQnzBIVjcVePKnokIHAMFdNSAnftCBLdbNtkWNLjMCZWgliWdDdXfPNBDZgqEcNAwXhcWFWTiqbOZVyzhbjbfbwysrJl",
		@"zLzsAtNJmTi": @"gtHspWkMcUntXzqUZksZqqNsEtEfsaICGefgZAPbRYrYHAOTSHZelrFAkyrBiWTcfWirZdrUFmUsqcxQjZatcWpRwDLVMkCNDMhGPKJmvtNnORbrSmTpxayZ",
		@"ppECmaPfbC": @"vjljBiNCCfjDZbyHGHPDrGlEKheNigHOAbTvRKBkOUVysUztmzYhMLBgarnhLPApUfyFEETmhiVzfyREprcjOWUhBnalAmUwVoIqxEgcauuCXBcNeeGOZhMZOV",
		@"XwzbMdEcQvT": @"mEmqNfdFQUYSDSzTnJlxTxVZSRvitkVuNEEvVZumPskpCbeFFZdQxdbrHMSgZFQrZUoLPAuKrXhFWPxYsXDDtfStCHJngnUDLgzaXLmlTaAi",
		@"jeTEHVwkAE": @"tcAmjwEXSBzKcIVFEpZSiORsflksmXwRZpUUVuBnhwGCnQraTOPxCUznzRThIsQdXvsBzhvCFuUQcKtSVrtmiCMqqvDHEeHpwIMzRlJAtuvZfAbdzdpEcAk",
		@"JYTLBEzoyWSwUlKDE": @"cxDVZUxXcibrtHnVnGifLjMgSOWXhtwrMBVkCgAXSEhGHDAJvzlPCePzJNLFLkppZFgIIxmwWzzQzmXCzyuQwaPtzkPPavrWrCxeDPxwSxBiCwwunsRUDmgzGvAedvHRC",
		@"UOxWIKCDhmETioQynk": @"xmaGdLiBQASuMBEkFicvZucSPJanYzfJqhYLXLmjoCeeZnbxXXLztxHBWbHrgbZmyFpYFKJBaDkFtdwRYQxWLtvZkXsYhMwgidJTsvOLWkRFDOJSP",
		@"yfHExqxioqH": @"axWWTFotueNaUuoURpPJoqjsFmSKjEOTvZvYiRgsbWSYpBCBIvUznPkIfEjncndyYhRIPlChJnTTYYmULxxfRAxmSuKZvSyIoZognoHABvAKJrJJRaMRoRkKnzSlaEGwbtRBlTwtic",
		@"QVcAdeSQIfeoVHivzTu": @"ZAdfwnBzzLgVsWKEtcBPhaXOSfILnrXchomBJhTSNDwmEVHDPVkuCtJcsKQeekhJGCHsechQPKEzeAnJzbdcbvMdrGgsflYgIyKbVPnVCDBZLIkQpVVcCUbsVoRYopdepDnQnsevbSPCj",
		@"HZXgJmEPfmi": @"LStkksdFlQcmPApZeYJHHHjnlxFqsgHxoJcOzHOsMoRUQOJvgzconUqDZOtlFhvDLlxPJzsAKzvfuvXmHasnCfqymqoyziCdHKlBhRRSOYMVghmzexdE",
		@"uxhvfcwfGS": @"WztSpzdXtMCSMLfoshHXeoeRdcFvpxDebRzwXlEavZWCzjoZzaOwgAvvdorsvQqKNuFyFtXvrXDqVSBJLvLZpVwkyoMXZGAFOmhinYrkINYHaujFOFdtmozdEUbQaTWMqREjlnBHNJVflUcVPdA",
		@"hAAhaKPeQuTrAOSk": @"UKsmrtKcoEwnQMYEltHQRYPTGEAqhGsEWItNFZejBSSjJCkGJWXYqDfgSDQEjxjBwqnUxONdSGzOQQYWYKUPQhRwiDHkLESvpwABbvQPYbtQWedlTzwCSIVcfR",
	};
	return biTgrtOsKNzRPzOKBG;
}

+ (nonnull NSString *)BQmYyKDsDWUfX :(nonnull NSDictionary *)dKsPvilrvGJobVaerK {
	NSString *rWlhxCswKSSJrdh = @"lSYeOyFmlbFpsvEUrPNavSfJbsbunxdMWQDNueVKPMGhKIemxgkjSrmFhIfiwlZSYqvHsOEPElkXaMIECzlbpJZLidcCpLUmoScvIJllzVufMbtn";
	return rWlhxCswKSSJrdh;
}

- (nonnull NSArray *)OnIdYFgkdR :(nonnull NSString *)pLtqZatWHBL :(nonnull NSArray *)mXoNiwhcqxmyAB :(nonnull UIImage *)HCjfunfcUJxPexJ {
	NSArray *UbWdlorOmHTdsxyYeis = @[
		@"cVhAKxRFLkWPjOGBIYVnVonHCRsdIutcFUQYBClDQVJXqiCJhSYHtgdsdvKcFjedRKsxSKHxuwGkspDiPuffdgXmnJWqTYntCKAatkobrGpj",
		@"uhtaicrlcofhXGDwuBnZjBRfjMJCdfyhqvfWfznVPgebHlQYcknzhTswkJvBSXjrptTDmmVspcWKmKmPTlyPKSCAwwIHpIBOtIDEyAisOXwmNPPiPYhs",
		@"ayabYSgPDfVbliItJHiwEvrGcCbxDyIdlMNjOcHTtkFpIwoKpJxGstITQgQKmbZYBePujZUeGgEpayrfofpsBiNgITPPMGzytxIckiSLsZqrymQLAymFxeFpWFLQK",
		@"GIAeoaiveEOFYjfLyTovSZBdcKJFZIjJheZbDEhvOZAtMHRQRnbAzyFNAOPUwoUYFjIeTcysmQctnZfYEqDDisOYGngnQoqhTPjQktlkWgGhjFYTtFOYmATVCaGngmuIcNLopGxOXFUwW",
		@"rqULlsvgNyvDoKJfTjjcpSbzzRqcoBzlWrtGmONoYVfXgMZIZHPGWSVLaCCpjMNjhTNbUbxkSzzihnlKIECOQqHRQMQUexxSsyisWdnGleYsyMqFJbTZly",
		@"aZeeHdxzNOkjJHokjhkOTAlUxIANvYMBUkObytuPGszqVZWqwrKvaaUcMinFXCTYReTzqNiDrzyFvCtopajnUAjrMYqGnVgMNtUFkopVJYdxGyDqD",
		@"HKZsDcFfHgKXKSJqePUuKVkZqrtBPDARKAXGDgEYXnBKOTsBZeSNXgVraqgLdEjtqiRHOVLZumktZLrGOccbDxQBzQIALbiyQuZktaXvjMxBAyBJBoTXhDGQhXEmHpXSMVWlCGHEFAIpiLdnhsdn",
		@"sBQjsKNsrzMswDHDeIbaMdLxnhfvvXEeYojUXwAZBCukzZaxiJTapAfinyLxzGzTelgdhbuuoKxcjMNhTUcbglfFzhygxybVuhhUaXtWJVrJCPHaGCOCfTwEOZJp",
		@"TJmyyQefUYJxsEhmYiQEzJLoaQQhGkisuZIQqAAKdZbyqNdKaIWJIAVYAxLNkRetBColhcqYEWpXDpHHNDvxjSFbLPeIYrDDUNYueYUVfpPmOpSKieTU",
		@"vGREkZsWwkdaoXUaNksJZxnRnzmpHDOuPkjpwVPjRetKwvmHksdVXygMooSdrpnQKYHQVoXzBvgSfsEamKQvzUhBGrQbfuAOPSWquqfdzIQxIqUsAnHZHEugUeGbGmWrfPCSOkkP",
		@"nlHhjWshYhFJqBFsQcZJMItgbEIFQVaschzgNcZCqgjcolixaciREPTNhmrBcjIDxfZHJsFWdBNPDMPZRMKhUcOsKyyZiFufAGYrGSsXNmqKvBZmsJuIG",
		@"XInYOiKdowedLsIxjtuAvYSmOXOuiNHGvpmhAiahrltsDzbWWjMZseQithilmtzhHZepLeGEHgWEGcaITWiYigVHrgQGJGRgFXcCcNHcAwInNqZfQLxhRkUrARAbnassmCe",
		@"tFWNyYpNtJXANRKdehevSFKdbCcstxmwgCjRmpQTzgaWsQlVwwBdbeiCQiWacHhgWzmijuAqnhxHhlQUxrnEctwYWfMFtDWLRBxzOSTSDIxBHDrJSfasIFaVAqjAOYkayGImvcqfyvWZdWhKjV",
	];
	return UbWdlorOmHTdsxyYeis;
}

+ (nonnull NSArray *)DNPwxsWURFqLeyqr :(nonnull NSArray *)QDFQknxmYE :(nonnull NSString *)RxcWujEGpLGy {
	NSArray *zazMNEEegf = @[
		@"bSuteutGBLCKwHMfbdlUKvhhYkICxGKdcKDIaaGNgNlsZcFilVPiqbRHEMrjwSJmrDgCiOSYbemJisnjXPvhFPjvNuYBHhEjWPkbHCbdvtkPjdOuDDTSmuN",
		@"IrzmuAwrivRomeYSASMcVfvQkEmeGzYSjyPkIpBRzxUiZewZGQOSbIgFVrqTfdzuUSYVzmxNDDSpXKiDhotJzDZCIbnvHXoUddZEzBxdnaICtLUTp",
		@"YzjiredIvPnwjeJlBXuMYcCSNenwpfGNfbLnofwxkoxtziNZIeUTqsPuoSsYLwteSpOPjftNLIRIyBLNAiWZNkveynkxWGrRakwADVFqyuNyMaP",
		@"YNJfRyZqpqcadGFtHniijnPQttfViDZaLtAeJMCHvCgRXTGqXogLIpTGxQlOtSliMNMdmFLLbHotleAVrGSsWRuQLCybfIclezWUwjckRWoFjJUyLjgjSdRZzcPRWgyTmPFqclXQMrsdbclv",
		@"JLHRWVwPxSjiEBugulDzLqMoJbjNOEpTjqDJqUphJMBeTqxyJmAXrFxFLGjXOmtLkDPZsnmIcBGDOAyMwKbfHtWDtAADJpasPlbGuDcDiTeuCaDJuYgPVufSuUXTqaGqgUfzFBRx",
		@"AytfEKdCLeCGeOjtOaQjxTlDzLXlRlwhGwokCclyznwEvnPihZHCBwCjbUBmqIaZeBFRIXWSlUtCivWqgbYvByZxTWhBfkqIqhHmOZPFWYZuwlFTjZwKuLRndzbhjXkUdUws",
		@"qjUoaaoQsFGLWfTbkfqFCuQEScEwwBEEJpEugEVGALJXtlHsnIHphGhcXdjfbJsBFVRtgetQKHuDrBbeDdzdOuvnACMQmrTkKxQOatUuMxfzavXl",
		@"nhwYeYUeJYWgQRyoQNBijOQpmMaWrjDoNHSOBCkxIZzFEqHlmCqntTWwdfeJSyCnSdXOGoXSyGszscYhurHWyNtpRCFLHTJtyrLLUOrTAdmSUzESTqqCDyZhTRErCngchrIjFYilemvU",
		@"hWymeHfgcXhaSDdVmzTZsnHqHjGVYZlebSRLzFLHfwFpJQSSzjATfaCMfOjJCmYscaHlbdAdHeYZkztwsADdSEyDtMLnVbGXPXhGIuCZbnOp",
		@"vbZzEtjrrplSTtebVOXsDnkDNknMyDnAyOeoyHIpuSJHKQmavkiMqPolpFFgykCozMBgeZjlIreAVLuZEkfTnRMJfnbGUMrCrRQllothzTHqSgmiYOxDOYUl",
		@"RGOTMjkPYoOnWvaEcMnkRqTYDgmCNPXWdgWBMJdeURJUiMBSQCuIbLmiqTotYELngzXyfURSdcMNivfaaJKPwyyXYcaLAuPAcnKtEWvftiuoOPnnpOtydlRxwELTf",
		@"QltNDQtzsuIwNVLIYEiqjbdDtZujifuxaMlJRQvAOQLOgnIVvuZPTmGXoYdfwgoeqEhwMOgivQOvkFMBjcfUnLWPAUFiyOFIQVnxJYDdVioUKfzkVcLLboyiVoDdrw",
	];
	return zazMNEEegf;
}

- (nonnull NSArray *)HCVpPWLpyyr :(nonnull NSData *)rpVmmUMakZlnrcIAI :(nonnull NSDictionary *)QRzHaLGEQReSdB {
	NSArray *FhpJLxHXBRA = @[
		@"EMNVegklecDiXcDcaIgIYeJjONHZsyqfIiMiKFYfZSpVUzDlpWDHgPLeColkyWJLBoHjXMJUtGNASGqZpgthCNCDdOxfjjSuuoEIVnONzQHytflRCDxjcBrSbMiSvlyZcgocfTbtkgyFkcVTdtgZa",
		@"PbbiNfmZWGIGMGAsECuXaMocMkaOqPyztiPnrnJvhIUONlCSiZAyXWAcuKBgKsOWvVyFzGOcvEMhklDZinaBonsAsxlUSXFsjVydaAsOGOLCUO",
		@"dVZldvnfIFIbxJzJHdKYOudUTgcOmFNfIQNfIGyisNLIUZCoIATzzjcQKjKZHvtfRJhjqhkJZwZwueagvrPgrJQCyiyYKVnhvtrDyQSjEzfmXMQAUsiSHa",
		@"IAwRhyNdDPYPHSHlxrqiQNBrfoGVYFKhpwfDpndPqhQHpfYRBfkILMQpBjTKnAYPbOIIOrDaawHCAKAWVoXlvDvsvJCJtgfkPatUNAHeGebsvCf",
		@"cjLxHMRlcIwbrVlsKSlulCvGqtwRQerSgreIJDyyNycWoPQvFJosiszwtsSSRFJeerGrFwWnUiSAsWBfYuQzBstXdnzYGqayCWsLHSipRsVUUpHwqkjyRutfhHcvfRfcLVDWdYSxErYmyXV",
		@"pMoyNkBzpNltXIATqBcUHmIfmbKIveeQSMdTfFSpEGgnvKEeqAyWqlVDRnMJDSaOfchnYeySgnMBJVgnmWAirXWwvzZWIZYpJaWoENXLQblALfRGPYPJrLlLrgvqJhAsqNihgNRgZA",
		@"qOzBZSAJiubEnGanWfrZfPgxjOkHKCQCjihJWlvALlVOXNTIbqirGknjBVbZoXCMKRXsswFErtCFjzEzaEyUxrDZwVFZoCfWvZqQBhfDLGVwjrBFGeMTkebKJlqnfQqkWPtgbWbwotSdjeJPFnHYq",
		@"CmwTiunMMQyYEPMXTJqapxsLPBxSlCynnVOeXjNnmHANVOKnoirDGBedrviFMlXPJJNeYGSIacTJUlFpKyEeOgBtAbuvZFDJkXBNFVaZIIJTbDBktpOjgIiBCbrbm",
		@"tGWroAZYtSEcByVrxNKituUfqOwKxkRqfIElYeFecCzYhfIiBiNsbUWEnHsHYzafuxVgCkPMuZDqmIbHpjMjPIcVTnZWkGruBlQjnIsZdOZTkvqjPLwUjOpIDPXjXGUWFBJmVozEUhp",
		@"FHAhMLYmXUDlMULVWMQSozwTKyVopYDkPKmkriSXFGEjjTNumboSImnCmmlAagKbXmdzBXHVOnYiwNBBoslVtetdURECpjSTGXvGVIxqZnVSycJkkcGuOvWpnPzAMgb",
		@"VXZNBPtIJRzJvTOyxvoyukaLZuFzynUjeZGXcsMZiXtSAbxaEsOuRGXHZPneolmpLGuQzfiumQthYgbYYIZYvavNXRBgLZNXYVKBItHLMUvudMypFSrtSHToUZRHUUUMiynQvDephCwOFjmzbb",
		@"ckiQERCKbDVOdqLeLTXEGhxHsdnVDuKVjVOQxYPiuqoibEXegradQHJSyWMOtskCDSjSWFmuiPzybqdwEybqohWKZbwHactqlpvjHxlSnOjKrKIxUiGuMuKQmpn",
		@"tvivopTSBSaHTyRZJXMSlvVtEPNbcUUtkEchfgvnaeIYyQZSfhedwJLJuhRgqvboKHSOmZrXxKchwMmxAjmRoziHllclWgreQdfUAiETBcacDBmGLFlgJEjyPkBkpBkPeXF",
		@"CsOQdrfXTarUnpWYDgLjURmAxKzkSHmWmQFPsthOnVRBammIryAksTfZYFwOOMyNixJcTkmjZNsdFEwYHYeLGiULbrCJdUzqViPSVEcAoFAqqVPiOxcqgHIIkNXceyQKhKGA",
		@"zZfvnRycmnTbHspGTpPVRkcoPfCTDZKgOOdGpoTvlGJkRgaYLvoduvKKYNNFHmfFBPDKoebOuDWdMXSENfyirAhdbkEkvuSPZHtiepQSwBYGtsrBoPFoLDkCYaiOBaQ",
		@"asIZGIXmDWafDoKpmjIkUipxtXpykEoiCbRJyryGmQajehiRtbmqwFZhSFWtscBsmvrcEIUBmkVxWzNKpzXvZUlHFZmPsdOPgpORs",
		@"CnnNtZoMIptQdyqfBVbmLmiLjnVeryMHQDIORPuxCGpoLWNdPEQsTXBneFmldDYManykJWylnujdHEhNHdzJOAPANniyqbMmJebNeARnsRZDhqixVjGWYrJRehtVIMXrUZYsWPOrXdWh",
		@"uwWwWBWybMpqWnelOoymIkPZJerDUoxGKxtdJDWwaZswQdkFXvNddQOzVglfcejKxOPzHHIpDpxCMfBJaBQXxileTzJXPflPLPgBDSfXlRiPzajbwHPAKKjtI",
		@"ciaafuiwcGrDxrkGlDEFaDHQQJhclNZUoaszlYjAXuAYntyusvBPHxknOzGfxKhSlmbcOeZDAhxGWxyJdVCzppHQqRzjVVXseICPbloW",
	];
	return FhpJLxHXBRA;
}

+ (nonnull NSDictionary *)YtsWghyzxwtK :(nonnull NSArray *)MCyZUDFSMqk {
	NSDictionary *vAxPWQatXroNoni = @{
		@"jUQZxCWYkiUHKtYwwAi": @"FuhitGDLMQeuhfFMKNYeTKeDVCbyDSWQuKePelisIVHXqYYORQequMucJbOlinqCGzAQHbyGTTxSmBGakUiiLFkODoHogdTWWVllxGYwFynegfyjyFNaZxf",
		@"BcplrvjLytS": @"RuwqlpLZMAQhDpNEglsNQYQzbrMkkzoomZPWxbFJSXFfTyTXIworVCRGFeanRAMngAVnRlDtzFmxLEFzvrOlSRKBPQPKGbMLfoEvjRyPFaIZhPkwGfaNLgcuPposqRUO",
		@"XwZmmPNUNTzyPT": @"WTEbteQMjhrKjVLlSUpahGCeIBRrraapyVdyIKZNDujhovAbBwUDGgLVHtiaxQlBhexoNaoCbePoWSnYUNFVNImdputYdhfECkIiLfHwvUFJDtLmBxkzKBHHlhSsfJYOGQPKZxqJiLQGT",
		@"GBywZORUTMNqX": @"nLSVGAqBXjPChVMLuzAeemflSJyTphBqPgPaAklXBPxQdaJfqYUNMfLyznQNcVasqnDuIpzDbvCKiNXHgvloUbvMlKzNTbhwAGIpkJGtnixLEjIgX",
		@"XlOzYUsRuv": @"BKMEsyNbtLPduXdudYmGqUhOZaIXJeImzQoeosVnITEKmywQWxgQCZlJLFEqwZRJBTpeyyOrWowhgHUbAXOzcRVgXzwwxuVusRCcXuoemefUqDvCVSdWvwPpEjRAkwXOmDW",
		@"CqeZDeYnShluyh": @"oZRQzMiedfIxhcLBfhWGHIFPoXjRpYIKicuspjhQIODPTcAwvMRbPVPjBTWxclgSizCFceSceusoHZvdPWMrFoXRNsWguWtJSwPCSLEkCBqGccIcHOuuyVKyygKGaRzHJgvP",
		@"SsBNqwQVvAJi": @"rGyVUHQcdAEVlikVoKpFaqkZznPIZLtnWwTPfxqeZmHHhzHyPcOndDmWIkTUAdNIwxlykDPPzOiFzDUJVbAWxwduhjvktxCoYfUyJNQGZLxVtJ",
		@"PExqtgoNjSAUDGHBMfn": @"kGGsfhuIXHeEuAqDpPXepnOjskHysdbXpIySMsPbHzwPaPogukPXLPqSMvHlOzJEHMMgByHSAYWaWSNBwWwPQEgtIjdWdePqfhqXcwZBZEsperBGVThBNYmvXYBarAPqouzuveo",
		@"lDFkQnywZeuujirlgB": @"UifLJghuFvNIvpedIwEDiwXcbIQahalZcBmIzAKJnjeyHxWJAmPoQxtZJHWZpENcxORGQbYFIkUmHlTSPJCRgtYWVlziXYRRbcgstfWGpyfKaFLqjjhCzkRCjiMpgOuBjZ",
		@"OGtnSvGtimRsU": @"ZhACBnovTzsiweKgJdokHmvkQgFDWoRhFXjZBvqeEmdgjAipwSgFqzfZirADWOyKAapmAmAVxPcdrdoyOmqrgdNGlRTGiubFMRoEEEEjWLTvV",
		@"UzMTZuJpGDht": @"rlaILHNwFbpPRoOVHyiuYMfEIDwbYyPLGShqybgZGGbcCJfWihgpvgHdhdyrSKEofEMTpQpjmvANIRTqXrHmrOzYvOdxTuKypvmUShnwgsLGpfUpXXq",
		@"NRdpatQDKKBGj": @"QoRXtpQgQJYASWZCCXUKzeavhlKqXIbfWtmIwGWAfutgKfOcKMAFRBGkCbrOJdYGkUYLqAEntHNHWCDefaszdxKOqExKYvLDNNgNybyCzgyHSfYaEFhzIR",
		@"uWgxxAlVRXoMOvRSL": @"CMqqCMvsoLwCUdxrllRUjCiOyvcHdVRpGCzlekvdcGhUPpgNHXCKlDatHnPenXXsuKodGGJpbUhEzFhXOfTBCDmwzhfcPMSRNDptxnwGcKopDZcXyQCkElXnBpkqNdWnyTyAVZrcEhanlaoIdgG",
		@"rdMZzufEOpTqiO": @"DMbdZuyEHDenaOoUxqxMpturPuTGJnmVmMWQeGLJBMURHmGdoVUJpLLzIRjuQTpgmufExwBHKhsDiKtoUoImofbRfxImRyjJWIdqUGVPIGrXa",
		@"yVtbJqytGLLqfzww": @"SGiykyRHUPvLJDipqunLqVEBvHHXOZtLdsNLZILmpQkifYjyPMGgdhHCwDpXEzjetRhciwRwHqqOWaxboZCtmnbKyzNUwRRIKcLBYikWAOUueFnkUhnQDTHbSIpmeBySUqWquRvobZiOFPTz",
		@"QVKDMboUnMJLL": @"PIWrFNarTCYwWUQZgYUzkPdvEWIjUyZqGUewzWlPIQHvMnmuLbBewsCbSujcgcBAsiWPXfCdyQUckfboosIRWghQWZsblhBccIEikBnFALdfdbzioxnkXzIWZfQgeqXDG",
		@"KWkxGoBLXbDKtoXkf": @"BHMJteSAHjzeWHwaqVPkLcbVDWDeTAfpXeQRtdnIXNzrMrNPlVupbWdcdShBcrBLKkPZdoFzlEPSekrvNSgfcRpMEQjmAWXETXSOwrCdfoxNifeAHSMeBvAHZAzJRnMxzR",
		@"fTtLjcICXO": @"iIPtzyXUFPzRBwOuXvdrDiCiKsAxcYyRklPgMcCPQOFrMnwTYinytxjHnEQHBdhmcAysjkZaaPVUlrYHufPDFXvRaPGorgHumQwvhaLwLYdloqGcXeNSfJHomAgroaVhNcTMhWsYIYGmnjSpTEHny",
		@"ukVzBNftWyqXDkvJoIg": @"WSxjLkfhmmUQhFPCYtieKFxEpJdLMogmbcKeWAMXzHTyXWnKKrAwxIsABHnlRshkHaShvdhrPJvNHXwvlwQszIgaKbUQYqBbtKbTEZqBcljNqUJQRYsFvZaQlyzS",
	};
	return vAxPWQatXroNoni;
}

+ (nonnull NSData *)AOUUdRCgyQVqXXlOn :(nonnull NSArray *)AdAuCNzEzFVVoy :(nonnull NSDictionary *)lYbKZGDkyJMbnrv :(nonnull UIImage *)RakbLIleBEF {
	NSData *pMMiapYkKwPjjvEqMMr = [@"wUWzYMVncjSlTRDVQolPiTDNVnGHsTCjknpfLOYixJLNhdJWzvPydRJEmXyySzYskvPayVObldLieWyPhWitRSfpTiIVXEpJRjPWtjuVFnjhqPJQVXfHLSFfyYBSRF" dataUsingEncoding:NSUTF8StringEncoding];
	return pMMiapYkKwPjjvEqMMr;
}

+ (nonnull NSData *)vmSILYxMFauTkeb :(nonnull NSArray *)pXsceKtVxhJvrM :(nonnull UIImage *)ZjQBfkwgOLmeJc :(nonnull NSData *)KiUNysRTfHUZuK {
	NSData *HpcLsgxcRRH = [@"EOBPrturmysNWmNsUGyeWnkSdvdUbxcvwknpWkGLxkphomYWbgZPdcEkhQiAWGjfUgHAbZzZoDhTuCnAYWAkgFyFUryLkcaQNwcKtCjPQJLEuUfHvsBKRnwhh" dataUsingEncoding:NSUTF8StringEncoding];
	return HpcLsgxcRRH;
}

+ (nonnull UIImage *)FyNeZoruHtLeGsX :(nonnull NSData *)HkzVjkJfmNpFnWv {
	NSData *WTMuIZvDqAsgvE = [@"PsNHlPPwZfcTNAbnccAgaOPRsZTfGkvwnCetXwVJHsEyVfmKGXUEaqWgpRIteUPaZpDdiHkGYLoOTNGrwdCiqPQcNNNixyClMDJBJnutXDSAyUXZFUFzvjahRdOGtzrsRssbok" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kpeSdrNByXrkLo = [UIImage imageWithData:WTMuIZvDqAsgvE];
	kpeSdrNByXrkLo = [UIImage imageNamed:@"NVjKHCScFBNiZQBAWXhQUfWpBODAsLdzorvkzQAfbbAEfHqWMxxzcqZRQvdBTCwMVaMBGNQoAKRNGzrHxfkcqYUAfemFHTHluaGRRN"];
	return kpeSdrNByXrkLo;
}

-(void)forceEvaluate
{
    for (XLFormSectionDescriptor* section in self.allSections){
        for (XLFormRowDescriptor* row in section.allRows) {
            [self addRowToTagCollection:row];
        }
    }
    for (XLFormSectionDescriptor* section in self.allSections){
        for (XLFormRowDescriptor* row in section.allRows) {
            [row evaluateIsDisabled];
            [row evaluateIsHidden];
        }
        [section evaluateIsHidden];
    }
}

#pragma mark - private


-(NSMutableArray *)formSections
{
    return _formSections;
}

#pragma mark - Helpers

-(XLFormRowDescriptor *)nextRowDescriptorForRow:(XLFormRowDescriptor *)row
{
    NSUInteger indexOfRow = [row.sectionDescriptor.formRows indexOfObject:row];
    if (indexOfRow != NSNotFound){
        if (indexOfRow + 1 < row.sectionDescriptor.formRows.count){
            return [row.sectionDescriptor.formRows objectAtIndex:++indexOfRow];
        }
        else{
            NSUInteger sectionIndex = [self.formSections indexOfObject:row.sectionDescriptor];
            NSUInteger numberOfSections = [self.formSections count];
            if (sectionIndex != NSNotFound && sectionIndex < numberOfSections - 1){
                sectionIndex++;
                XLFormSectionDescriptor * sectionDescriptor;
                while ([[(sectionDescriptor = [row.sectionDescriptor.formDescriptor.formSections objectAtIndex:sectionIndex]) formRows] count] == 0 && sectionIndex < numberOfSections - 1){
                    sectionIndex++;
                }
                return [sectionDescriptor.formRows firstObject];
            }
        }
    }
    return nil;
}


-(XLFormRowDescriptor *)previousRowDescriptorForRow:(XLFormRowDescriptor *)row
{
    NSUInteger indexOfRow = [row.sectionDescriptor.formRows indexOfObject:row];
    if (indexOfRow != NSNotFound){
        if (indexOfRow > 0 ){
            return [row.sectionDescriptor.formRows objectAtIndex:--indexOfRow];
        }
        else{
            NSUInteger sectionIndex = [self.formSections indexOfObject:row.sectionDescriptor];
            if (sectionIndex != NSNotFound && sectionIndex > 0){
                sectionIndex--;
                XLFormSectionDescriptor * sectionDescriptor;
                while ([[(sectionDescriptor = [row.sectionDescriptor.formDescriptor.formSections objectAtIndex:sectionIndex]) formRows] count] == 0 && sectionIndex > 0 ){
                    sectionIndex--;
                }
                return [sectionDescriptor.formRows lastObject];
            }
        }
    }
    return nil;
}

-(void)addRowToTagCollection:(XLFormRowDescriptor*) rowDescriptor
{
    if (rowDescriptor.tag) {
        self.allRowsByTag[rowDescriptor.tag] = rowDescriptor;
    }
}

-(void)removeRowFromTagCollection:(XLFormRowDescriptor *)rowDescriptor
{
    if (rowDescriptor.tag){
        [self.allRowsByTag removeObjectForKey:rowDescriptor.tag];
    }
}


-(void)addObserversOfObject:(id)sectionOrRow predicateType:(XLPredicateType)predicateType
{
    NSPredicate* predicate;
    id descriptor;
    switch(predicateType){
        case XLPredicateTypeHidden:
            if ([sectionOrRow isKindOfClass:([XLFormRowDescriptor class])]) {
                descriptor = ((XLFormRowDescriptor*)sectionOrRow).tag;
                predicate = ((XLFormRowDescriptor*)sectionOrRow).hidden;
            }
            else if ([sectionOrRow isKindOfClass:([XLFormSectionDescriptor class])]) {
                descriptor = sectionOrRow;
                predicate = ((XLFormSectionDescriptor*)sectionOrRow).hidden;
            }
            break;
        case XLPredicateTypeDisabled:
            if ([sectionOrRow isKindOfClass:([XLFormRowDescriptor class])]) {
                descriptor = ((XLFormRowDescriptor*)sectionOrRow).tag;
                predicate = ((XLFormRowDescriptor*)sectionOrRow).disabled;
            }
            else return;
            
            break;
    }
    NSMutableArray* tags = [predicate getPredicateVars];
    for (NSString* tag in tags) {
        NSString* auxTag = [tag formKeyForPredicateType:predicateType];
        if (!self.rowObservers[auxTag]){
            self.rowObservers[auxTag] = [NSMutableArray array];
        }
        if (![self.rowObservers[auxTag] containsObject:descriptor])
            [self.rowObservers[auxTag] addObject:descriptor];
    }
    
}

-(void)removeObserversOfObject:(id)sectionOrRow predicateType:(XLPredicateType)predicateType
{
    NSPredicate* predicate;
    id descriptor;
    switch(predicateType){
        case XLPredicateTypeHidden:
            if ([sectionOrRow isKindOfClass:([XLFormRowDescriptor class])]) {
                descriptor = ((XLFormRowDescriptor*)sectionOrRow).tag;
                predicate = ((XLFormRowDescriptor*)sectionOrRow).hidden;
            }
            else if ([sectionOrRow isKindOfClass:([XLFormSectionDescriptor class])]) {
                descriptor = sectionOrRow;
                predicate = ((XLFormSectionDescriptor*)sectionOrRow).hidden;
            }
            break;
        case XLPredicateTypeDisabled:
            if ([sectionOrRow isKindOfClass:([XLFormRowDescriptor class])]) {
                descriptor = ((XLFormRowDescriptor*)sectionOrRow).tag;
                predicate = ((XLFormRowDescriptor*)sectionOrRow).disabled;
            }
            break;
    }
    if (descriptor && [predicate isKindOfClass:[NSPredicate class] ]) {
        NSMutableArray* tags = [predicate getPredicateVars];
        for (NSString* tag in tags) {
            NSString* auxTag = [tag formKeyForPredicateType:predicateType];
            if (self.rowObservers[auxTag]){
                [self.rowObservers[auxTag] removeObject:descriptor];
            }
        }
    }
}

@end
