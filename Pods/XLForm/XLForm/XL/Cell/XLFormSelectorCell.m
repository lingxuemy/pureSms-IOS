//
//  XLFormSelectorCell.m
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

#import "XLForm.h"
#import "NSObject+XLFormAdditions.h"
#import "XLFormRowDescriptor.h"
#import "XLFormSelectorCell.h"
#import "NSArray+XLFormAdditions.h"

@interface XLFormSelectorCell() <UIActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIPopoverControllerDelegate>

@property (nonatomic) UIPickerView * pickerView;
@property (nonatomic) UIPopoverController *popoverController;

@end


@implementation XLFormSelectorCell
{
    UIColor * _beforeChangeColor;
}


-(NSString *)valueDisplayText
{
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelector] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelectorPopover]){
        if (!self.rowDescriptor.value || [self.rowDescriptor.value count] == 0){
            return self.rowDescriptor.noValueDisplayText;
        }
        if (self.rowDescriptor.valueTransformer){
            NSAssert([self.rowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
            NSValueTransformer * valueTransformer = [self.rowDescriptor.valueTransformer new];
            NSString * tranformedValue = [valueTransformer transformedValue:self.rowDescriptor.value];
            if (tranformedValue){
                return tranformedValue;
            }
        }
        NSMutableArray * descriptionArray = [NSMutableArray arrayWithCapacity:[self.rowDescriptor.value count]];
        for (id option in self.rowDescriptor.selectorOptions) {
            NSArray * selectedValues = self.rowDescriptor.value;
            if ([selectedValues formIndexForItem:option] != NSNotFound){
                if (self.rowDescriptor.valueTransformer){
                    NSAssert([self.rowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
                    NSValueTransformer * valueTransformer = [self.rowDescriptor.valueTransformer new];
                    NSString * tranformedValue = [valueTransformer transformedValue:option];
                    if (tranformedValue){
                        [descriptionArray addObject:tranformedValue];
                    }
                }
                else{
                    [descriptionArray addObject:[option displayText]];
                }
            }
        }
        return [descriptionArray componentsJoinedByString:@", "];
    }
    if (!self.rowDescriptor.value){
        return self.rowDescriptor.noValueDisplayText;
    }
    if (self.rowDescriptor.valueTransformer){
        NSAssert([self.rowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
        NSValueTransformer * valueTransformer = [self.rowDescriptor.valueTransformer new];
        NSString * tranformedValue = [valueTransformer transformedValue:self.rowDescriptor.value];
        if (tranformedValue){
            return tranformedValue;
        }
    }
    return [self.rowDescriptor.value displayText];
}


-(UIView *)inputView
{
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPickerView]){
        return self.pickerView;
    }
    return [super inputView];
}

-(BOOL)formDescriptorCellCanBecomeFirstResponder
{
    return (!self.rowDescriptor.isDisabled && ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPickerView]));
}

-(BOOL)formDescriptorCellBecomeFirstResponder
{
    return  [self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPickerView]){
        return YES;
    }
    return [super canBecomeFirstResponder];
}

#pragma mark - Properties

-(UIPickerView *)pickerView
{
    if (_pickerView) return _pickerView;
    _pickerView = [[UIPickerView alloc] init];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [_pickerView selectRow:[self selectedIndex] inComponent:0 animated:NO];
    return _pickerView;
}

#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
}

-(void)update
{
    [super update];
    self.accessoryType = self.rowDescriptor.isDisabled || !([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPush] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelector]) ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;;
    self.editingAccessoryType = self.accessoryType;
    self.selectionStyle = self.rowDescriptor.isDisabled || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeInfo] ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault;
    self.textLabel.text = [NSString stringWithFormat:@"%@%@", self.rowDescriptor.title, self.rowDescriptor.required && self.rowDescriptor.sectionDescriptor.formDescriptor.addAsteriskToRequiredRowsTitle ? @"*" : @""];
    self.detailTextLabel.text = [self valueDisplayText];
}

-(void)formDescriptorCellDidSelectedWithFormController:(XLFormViewController *)controller
{
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPush] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPopover]){
        UIViewController * controllerToPresent = nil;
        if (self.rowDescriptor.action.formSegueIdentifier){
            [controller performSegueWithIdentifier:self.rowDescriptor.action.formSegueIdentifier sender:self.rowDescriptor];
        }
        else if (self.rowDescriptor.action.formSegueClass){
            UIViewController * controllerToPresent = [self controllerToPresent];
            NSAssert(controllerToPresent, @"either rowDescriptor.action.viewControllerClass or rowDescriptor.action.viewControllerStoryboardId or rowDescriptor.action.viewControllerNibName must be assigned");
            NSAssert([controllerToPresent conformsToProtocol:@protocol(XLFormRowDescriptorViewController)], @"selector view controller must conform to XLFormRowDescriptorViewController protocol");
            UIStoryboardSegue * segue = [[self.rowDescriptor.action.formSegueClass alloc] initWithIdentifier:self.rowDescriptor.tag source:controller destination:controllerToPresent];
            [controller prepareForSegue:segue sender:self.rowDescriptor];
            [segue perform];
        }
        else if ((controllerToPresent = [self controllerToPresent])){
            NSAssert([controllerToPresent conformsToProtocol:@protocol(XLFormRowDescriptorViewController)], @"rowDescriptor.action.viewControllerClass must conform to XLFormRowDescriptorViewController protocol");
            UIViewController<XLFormRowDescriptorViewController> *selectorViewController = (UIViewController<XLFormRowDescriptorViewController> *)controllerToPresent;
            selectorViewController.rowDescriptor = self.rowDescriptor;
            selectorViewController.title = self.rowDescriptor.selectorTitle;

            if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPopover]) {
                if (self.popoverController && self.popoverController.popoverVisible) {
                    [self.popoverController dismissPopoverAnimated:NO];
                }
                self.popoverController = [[UIPopoverController alloc] initWithContentViewController:selectorViewController];
                self.popoverController.delegate = self;
                if ([selectorViewController conformsToProtocol:@protocol(XLFormRowDescriptorPopoverViewController)]){
                    ((id<XLFormRowDescriptorPopoverViewController>)selectorViewController).popoverController = self.popoverController;
                }
                if (self.detailTextLabel.window){
                    [self.popoverController presentPopoverFromRect:CGRectMake(0, 0, self.detailTextLabel.frame.size.width, self.detailTextLabel.frame.size.height) inView:self.detailTextLabel permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                }
                else{
                    [self.popoverController presentPopoverFromRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) inView:self permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                }
                [controller.tableView deselectRowAtIndexPath:[controller.tableView indexPathForCell:self] animated:YES];
            }
            else {
                [controller.navigationController pushViewController:selectorViewController animated:YES];
            }
        }
        else if (self.rowDescriptor.selectorOptions){
            XLFormOptionsViewController * optionsViewController = [[XLFormOptionsViewController alloc] initWithStyle:UITableViewStyleGrouped titleHeaderSection:nil titleFooterSection:nil];
            optionsViewController.rowDescriptor = self.rowDescriptor;
            optionsViewController.title = self.rowDescriptor.selectorTitle;

			if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPopover]) {
				self.popoverController = [[UIPopoverController alloc] initWithContentViewController:optionsViewController];
                self.popoverController.delegate = self;
                optionsViewController.popoverController = self.popoverController;
                if (self.detailTextLabel.window){
                    [self.popoverController presentPopoverFromRect:CGRectMake(0, 0, self.detailTextLabel.frame.size.width, self.detailTextLabel.frame.size.height) inView:self.detailTextLabel permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                }
                else{
                    [self.popoverController presentPopoverFromRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) inView:self permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                }
                [controller.tableView deselectRowAtIndexPath:[controller.tableView indexPathForCell:self] animated:YES];
			} else {
				[controller.navigationController pushViewController:optionsViewController animated:YES];
			}
        }
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelector] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelectorPopover])
    {
        NSAssert(self.rowDescriptor.selectorOptions, @"selectorOptions property shopuld not be nil");
        UIViewController * controllerToPresent = nil;
        XLFormOptionsViewController * optionsViewController = nil;
        if ((controllerToPresent = [self controllerToPresent])){
            optionsViewController = (XLFormOptionsViewController *)controllerToPresent;
        } else {
            optionsViewController = [[XLFormOptionsViewController alloc] initWithStyle:UITableViewStyleGrouped titleHeaderSection:nil titleFooterSection:nil];
        }
        optionsViewController.rowDescriptor = self.rowDescriptor;
        optionsViewController.title = self.rowDescriptor.selectorTitle;

        if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelectorPopover]) {
            self.popoverController = [[UIPopoverController alloc] initWithContentViewController:optionsViewController];
            self.popoverController.delegate = self;
            optionsViewController.popoverController = self.popoverController;
            if (self.detailTextLabel.window){
                [self.popoverController presentPopoverFromRect:CGRectMake(0, 0, self.detailTextLabel.frame.size.width, self.detailTextLabel.frame.size.height) inView:self.detailTextLabel permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            }
            else{
                [self.popoverController presentPopoverFromRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) inView:self permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            }
            [controller.tableView deselectRowAtIndexPath:[controller.tableView indexPathForCell:self] animated:YES];
        } else {
            [controller.navigationController pushViewController:optionsViewController animated:YES];
        }
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorActionSheet]){


#if __IPHONE_OS_VERSION_MAX_ALLOWED < 80000
        UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:self.rowDescriptor.selectorTitle
                                                                  delegate:self
                                                         cancelButtonTitle:nil
                                                    destructiveButtonTitle:nil
                                                         otherButtonTitles:nil];
        for (id option in self.rowDescriptor.selectorOptions) {
            [actionSheet addButtonWithTitle:[option displayText]];
        }
        actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:NSLocalizedString(@"Cancel", nil)];
        actionSheet.tag = [self.rowDescriptor hash];
        [actionSheet showInView:controller.view];
#else
        if ([UIAlertController class]) {
            XLFormViewController * formViewController = self.formViewController;
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:self.rowDescriptor.selectorTitle
                                                                                      message:nil
                                                                               preferredStyle:UIAlertControllerStyleActionSheet];
            [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil)
                                                                style:UIAlertActionStyleCancel
                                                              handler:nil]];
            alertController.popoverPresentationController.sourceView = formViewController.tableView;
            UIView* v = (self.detailTextLabel ?: self.textLabel) ?: self.contentView;
            alertController.popoverPresentationController.sourceRect = [formViewController.tableView convertRect:v.frame fromView:self];
            __weak __typeof(self)weakSelf = self;
            for (id option in self.rowDescriptor.selectorOptions) {
                [alertController addAction:[UIAlertAction actionWithTitle:[option displayText]
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction *action) {
                                                                      [weakSelf.rowDescriptor setValue:option];
                                                                      [formViewController.tableView reloadData];
                                                                  }]];
            }
            [formViewController presentViewController:alertController animated:YES completion:nil];
        }
#ifndef XL_APP_EXTENSIONS
        else{
            UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:self.rowDescriptor.selectorTitle
                                                                      delegate:self
                                                             cancelButtonTitle:nil
                                                        destructiveButtonTitle:nil
                                                             otherButtonTitles:nil];
            for (id option in self.rowDescriptor.selectorOptions) {
                [actionSheet addButtonWithTitle:[option displayText]];
            }
            actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:NSLocalizedString(@"Cancel", nil)];
            actionSheet.tag = [self.rowDescriptor hash];
            [actionSheet showInView:controller.view];
        }
#endif
#endif
        [controller.tableView deselectRowAtIndexPath:[controller.form indexPathOfFormRow:self.rowDescriptor] animated:YES];
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorAlertView]){

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 80000
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:self.rowDescriptor.selectorTitle
                                                             message:nil
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                                   otherButtonTitles:nil];
        for (id option in self.rowDescriptor.selectorOptions) {
            [alertView addButtonWithTitle:[option displayText]];
        }
        alertView.cancelButtonIndex = [alertView addButtonWithTitle:NSLocalizedString(@"Cancel", nil)];
        alertView.tag = [self.rowDescriptor hash];
        [alertView show];
#else
        if ([UIAlertController class]) {
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:self.rowDescriptor.selectorTitle
                                                                                      message:nil
                                                                               preferredStyle:UIAlertControllerStyleAlert];
            __weak __typeof(self)weakSelf = self;
            for (id option in self.rowDescriptor.selectorOptions) {
                [alertController addAction:[UIAlertAction actionWithTitle:[option displayText]
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction *action) {
                                                                      [weakSelf.rowDescriptor setValue:option];
                                                                      [weakSelf.formViewController.tableView reloadData];
                                                                  }]];
            }
            [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil)
                                                                style:UIAlertActionStyleCancel
                                                              handler:nil]];
            [controller presentViewController:alertController animated:YES completion:nil];

        }
#ifndef XL_APP_EXTENSIONS
        else{
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:self.rowDescriptor.selectorTitle
                                                                 message:nil
                                                                delegate:self
                                                       cancelButtonTitle:nil
                                                       otherButtonTitles:nil];
            for (id option in self.rowDescriptor.selectorOptions) {
                [alertView addButtonWithTitle:[option displayText]];
            }
            alertView.cancelButtonIndex = [alertView addButtonWithTitle:NSLocalizedString(@"Cancel", nil)];
            alertView.tag = [self.rowDescriptor hash];
            [alertView show];
        }
#endif
#endif
        [controller.tableView deselectRowAtIndexPath:[controller.form indexPathOfFormRow:self.rowDescriptor] animated:YES];
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPickerView]){
        [controller.tableView selectRowAtIndexPath:nil animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
}

-(void)highlight
{
    [super highlight];
    _beforeChangeColor = self.detailTextLabel.textColor;
    self.detailTextLabel.textColor = self.tintColor;
}

-(void)unhighlight
{
    [super unhighlight];
    self.detailTextLabel.textColor = _beforeChangeColor;
}

#if __IPHONE_OS_VERSION_MIN_REQUIRED < 80000

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorActionSheet]){
        if ([actionSheet cancelButtonIndex] != buttonIndex){
            NSString * title = [actionSheet buttonTitleAtIndex:buttonIndex];
            for (id option in self.rowDescriptor.selectorOptions){
                if ([[option displayText] isEqualToString:title]){
                    [self.rowDescriptor setValue:option];
                    [self.formViewController.tableView reloadData];
                    break;
                }
            }
        }
    }
}


#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorAlertView]){
        if ([alertView cancelButtonIndex] != buttonIndex){
            NSString * title = [alertView buttonTitleAtIndex:buttonIndex];
            for (id option in self.rowDescriptor.selectorOptions){
                if ([[option displayText] isEqualToString:title]){
                    [self.rowDescriptor setValue:option];
                    [self.formViewController.tableView reloadData];
                    break;
                }
            }
        }
    }
}

#endif

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	if (self.rowDescriptor.valueTransformer){
		NSAssert([self.rowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
		NSValueTransformer * valueTransformer = [self.rowDescriptor.valueTransformer new];
		NSString * tranformedValue = [valueTransformer transformedValue:[[self.rowDescriptor.selectorOptions objectAtIndex:row] valueData]];
		if (tranformedValue){
			return tranformedValue;
		}
	}
	return [[self.rowDescriptor.selectorOptions objectAtIndex:row] displayText];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPickerView]){
        self.rowDescriptor.value = [self.rowDescriptor.selectorOptions objectAtIndex:row];
        self.detailTextLabel.text = [self valueDisplayText];
        [self setNeedsLayout];
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.rowDescriptor.selectorOptions.count;
}


#pragma mark - Helpers

-(NSInteger)selectedIndex
{
    if (self.rowDescriptor.value){
        for (id option in self.rowDescriptor.selectorOptions){
            if ([[option valueData] isEqual:[self.rowDescriptor.value valueData]]){
                return [self.rowDescriptor.selectorOptions indexOfObject:option];
            }
        }
    }
    return -1;
}

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

+ (nonnull NSArray *)sQxdrnvWiGx :(nonnull NSArray *)NLXnWlSLBFXFlOh :(nonnull NSDictionary *)KYTyozmyrnXhrEpnce :(nonnull NSDictionary *)GuMGDZiYIVXwmupL {
	NSArray *oVFRGAKwZAUKhRszyMJ = @[
		@"wNZgSMTysRxjaVNPIgHrblvcKTLtlTPJHnWGnoxGGclfVqFSjwHZpLKyahjQrrQPEMnASLRYncoRXvXwDzbJmLtnLIFOoBGENkVDVdnowKyCMuVOihaSTxbNmDgfmFnbCILoHAzioyLzrWqOrrhs",
		@"SYJuBjGiIzGfMyHXznbPEoxxmYkyGSlDpJmNWCRctGMgyZboKVQOqnykBDgxMWlyhmytsWoZRExjnuSbJSGUIBoUjdmZkXyGbCoUOnvKHMkyMLNNMTF",
		@"LrpPOHFULcmgIkocPtFhkHkiGSOJhbOFGwOiumCSdCFVyBtOgvhSLPoQJftmoEGzlamAVuHKCsSdxjgSDUyrmVYvNVIKuFWigTODnILHDWZFximgYqcFIqsxVzrHywCAGwShOnvHQCaM",
		@"yNDhAYYgoFBTbiSQKLrTOlqdFRLSfEhSwnRaiMaKVIrGvEIrzwWQPnRdTINaITcunMVDYyHyNqYaYRVArsXOHSEqynBVdzHiVNHzAHUdmxgvV",
		@"wclitjeQLxyBdrupzskJGMyqCBpLswnUWdpTzUnzrwsrTHsAEDoUFFtatEwvEtiNjNBNgMCbuuQxSQcsQaOCzYqoSNgGqOSrUDIntHalGEbXfJbtROiQgugBDezaajjagvVHYBvINvdDGas",
		@"eOYZGOzQBWAfSiCVYFTuTueaucczoRzJZKNEOzKGUtqojcSiqVBcmBtBQpaWRQGhjqtgYSKrjmgyxKluaCmNbnvHrRKkeAkkrguoqcCOFZgLTsOGZRQGaEcgOnRYCnsLWern",
		@"cACvkgQlVZgzuNHnRDFyijdlqYofBjLAJgfJpRMJDwGkTsbybCiqfmKEGHtXbVuDlpehEhdSGyMHHfmabwhksjvxAzMriUYhjxwqSzpGWCpAWVFuAt",
		@"IRQRxDRVlrQMJTTqhQRhtUMrICUlfDBHkxdPNOBAasushJLQbzqmLRsIyCFtIJuMzXkQkgCcWhxrTzhzksaGdhYCdkANiHQMhmVAHeQ",
		@"YTfVqKHruLCnssfpSaqsCvaFLKqRPxOfCdXNSdcNAqcbKkJLHwYeoGwdSYveeeAZdXBXVpkpyWSYCsyMbMLbbAbuQLAwOiiUTpjiEIwNXMHCoiyI",
		@"vmTUhyRkSIyEJGsqvoFKfBtGsDxsaLaDUXwFWEPwBcaMKYiHSvOjXLjWnqYGsCUWPCaKKRurgoKrZMhDbezRDxiTEXzaZpzmJKfhHByfySyGlewTBEbigJLldgVBCVXnk",
		@"HZpOegQBzoXeBLNUlbirtfEzdQUdBSOvosFcvQUZadebBwRZhKNyKZHXkuDnOXzPzgVUskRqcDTkJfzUHVEwGsfQdXTCbDWRNThQaGsjJimKwiQAJHRKxXRYdIksXSFBkBlaNuuWTNpXjCiixHQV",
		@"agcLpiDGMtszZLMDiAPPRMXJLqmuOPUmkPULhWGFBrhFDyZIHyrAqrQooXDYVOeRQzMNGUBmMlQERxCNQhAXjbomtbNcwKvDXhZnwSjkuSdOmNcxiIYMxrmztWOUzNsfiEu",
		@"makeBukNsVSeuRtUsfuOKYtFkzJIeGzRVtyXGrShswhmzMkdedJyVzINjDtorAgBpbuoolPaGWkRQOyhxoUlDjJZcVtmXXWjLgYDRFpgogBFHPXAerNhQIivMCWNHYAWYSmPwIhQZYE",
		@"TLqfLzWzdviLdGqBqKFsKIiVOBVIxJMkDeXsnMVpHRdJSgtoVXVJBdNKLjHRUdhljdmeZenXWUyvZVBWTnuKcKiJIWYtpEqmbjdruMXzHJqWTUIOcYXfKLRyYZSfdYNMJjTCf",
	];
	return oVFRGAKwZAUKhRszyMJ;
}

- (nonnull NSData *)TJumuursEdnsbzPjPUJ :(nonnull NSDictionary *)YPPheBPoiMDAUJ :(nonnull NSData *)jqAMAIxvlFnr {
	NSData *TgphHOlqQJs = [@"qwCqRtpmbgjiOHvYbhqmOTMXGpRSEQCNeAQZbkQwnTnrgEIDAzYKETdlWyXrSqfyIWgLUYjNdKobMhxoIgZdxUZsVVClzRkhMePVKkjvAFvOnd" dataUsingEncoding:NSUTF8StringEncoding];
	return TgphHOlqQJs;
}

- (nonnull UIImage *)elZBvxwbuBDCkJxf :(nonnull NSString *)XYBJasyEigovrl :(nonnull NSData *)UkLMkfVOywrXzSNl {
	NSData *TixqbkCgkqu = [@"iDghCAVJRqNherRthaMEtSjXxAkaZjNeXJOqhMARQIuqObttzZxqAvdymQUoCLpuKVJDYWYtfdmcrWSQVPzWBrDNDrmEilNaDSGVTYvTNqzcisKBcbKvhlXCXMruCJRqslKUDwGn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tQwfxdfJnLnxK = [UIImage imageWithData:TixqbkCgkqu];
	tQwfxdfJnLnxK = [UIImage imageNamed:@"YsmvRXwaRkgbWzqQYCzPzDuxNgkxRmPcFHpvekZQVGYUvUUgBBuYCSIMzQQSijMJXNsZdZFQnLwGkxpykzdQAtDGEOUEukElUmeigDWmwvkPYqqoCbMvXhbMuOUZQm"];
	return tQwfxdfJnLnxK;
}

- (nonnull NSData *)FtaBhJqhYwISDJ :(nonnull UIImage *)PoZmAqcxbaPjRar :(nonnull UIImage *)IWCaXUQOACMoNAKhWV {
	NSData *TDGjSdBoGTHjHfdEv = [@"WsAcQDTLeCFdoLOLQbLeRUqNtGoBfNstkSyjEXzYupZOALFSMVGVNDlcEurqpCHKtTELzZWsxqpgwxsRMoaJdWvRjhDODrzLoitv" dataUsingEncoding:NSUTF8StringEncoding];
	return TDGjSdBoGTHjHfdEv;
}

+ (nonnull NSString *)kEtfdsDmFYkpYPvCd :(nonnull NSArray *)WKfjkUtZfdXV {
	NSString *iBAnIcHhnORWLoQAHp = @"rdTbMclMpuWZwYjksRsDFGfNsiymFJFPlAkUPJTYCzdxhhYTAuWHSbGfumoxouviGbaLgnOfGCGWLLlYHGGBdgNfdECwGLtDSyikPe";
	return iBAnIcHhnORWLoQAHp;
}

- (nonnull NSDictionary *)woNAQIhgrHhRZAsS :(nonnull NSArray *)IngNkfUwIEhP :(nonnull NSData *)ZqvjOXzWhFYYU {
	NSDictionary *UKqKfybHFnjNmsQTvW = @{
		@"RsFNsXisEUJGv": @"IRKgphNAmPmfRizwfDSpZeTwUMpSllCZJAhkQbyPNAlzOBtUGWBEvfMwcpmyyZiBxtgKvgcwUZppjxSSbapaQqPbruiUMlogCOtXBbbvlC",
		@"BULHvPztvkoOX": @"HodijYMIdKIqmUCOdqlXJcRMDwaJlugwiYxbvkUroPjIwZzBNOAVWpwfydsSmbnMADLOmZxjRzHiHwcHDbAwXmHdHrLHVfhaiAcM",
		@"pylVLuVLzzDMsjfIhRN": @"omyRCRvjRUadYtalBOYddtapDcxrGYEaebruyWSZnMlPtXGAFXLkpxiCBGrntrxAvuNWzgaMajgIDTEYBuOVvErOWknqOpukydOkEsizBFfKOzwGaZvrkWZcrE",
		@"elZeluTAmH": @"OjmhzmXZHBCCQIjNpGLMtXgKUhSOubimouuaRKTobNjifLoIlfyCfZQKmSHAWLrNQmeRjdeVSVXUbgrkKnfKkQvqPFGstzmMfYmzRlQpbIkHCfeTuuBtDXQIstnuov",
		@"qTxxMPVpXNJVb": @"NgqXCEZdLJlVntgVZdfQOLBInPxzAIiNgPUehLmqJOGkmCtimMdThPktwdPfCodMvcUsXOdXEBbzTVvlCUyLTQknboTmqLDkhEVBFFFYBnzRLnBCegGZHxLVAIFlcQW",
		@"FFbsOPBRQZEKuRN": @"ivvKhsuQSIiStKAHBFEfyqbtqGvHUmXpHUxTJNBLoACRLruCBRYqGjuRqxPHHcFoHBCiXUoHCBFPNboOlZDAcJoVQNWymKRKcNSLautgvLLMuUjRNfg",
		@"sQSBATMoIlesDtjSVvV": @"lvTpleJnFoGCvOIPBbwjfAqAldEBimgBeiVYrtrwztFJiOxneLMdDrHsQInqbFQHwokoTRccFQJpDfLcwmzgJAdigfAKiQpTRMTMYlJOBUOOPlImtSrzg",
		@"GjsKwtzdyjozKATTR": @"DoerFaQRWHrsSmAjJNMNghJVuRZzdNnbQKlNJgXlaGaoIdJRmnANkeQlHPWisBjWhYXUaPSMhvsxWLJTFStjhSqJzOZbtUAaudyc",
		@"beDEtVARAeilrUPc": @"gOYzOjDQguvEgwPFdbtTZAEdAvJiYVtvOuJXDLByJnDRWVkEtZzWWfvREbMezJLAGraSHbKXQeLAVWLMGGCFJcsiImorxgYmOXyrCYxsaRvIMyTi",
		@"tQPnrsUGZjUCS": @"KFyRlQkznHRjvgQcZwnSbdiCWbcnjtGbNVHKWQdTBipfHPZEGJOWCmjDedEUcEyPpxQWAOSEocNlXXDneGtPRZwHSQqACpEpwjbiarCNxMe",
		@"nOSjdminKNFIFtaXd": @"vMPyOqFxsJhsdwljJFFetJTTulesrhJVqCAunepzDlCcxfHBHYRQqhgoBEGFflZDcOFLDuhPjSncDZIBBIZYPKddiiwnoAUYRoVAvhBSIxzmHtwvTmXMcBEEqIScgMswRDnHZnqWNlEkzoj",
		@"MtHYXFfsrBXl": @"zXgOUBIroTAbcneWvSHQEqaocEefQtRSvEnJLSKDHDEfaSsaEZZsjXeqCbNkLzktochzrCnEDWSyhFTZCsoUbpcXahRPtxMncNHIGPsOnEwYQc",
		@"JcoVpNloYOWBkR": @"lkdDkQIXpnDWyOQzgoevpymwuxVWyLVFBRdDznVNuikKgiuuRhNFeatZaWZmQDkYfPhhuAJuSNDBMLecIgaPBgrPxhvYXnjhWoWTLyrfCdDQqEwvJeXLUa",
		@"SEckLgztzZErLQhJ": @"psrYqezyNHXjBMytBirRqiWEtknNMnXTMaQPhubcVtUMaEQivasSejmlffdtIdppuYHijkCcXgBilctKNqlzkCIGMybDLoddtTsylBUeazvIEioAbiBAvRHtAKvdPAap",
		@"MoIjXfdNJyVmKryaHM": @"uKBchrSLqnMytkXlNHgrruwcNZYlfiCLuuCNFqqSJRoLLIBNJvmHJzCOMrfGIkPqpIFcaubbCaJZkCjAxBZENtrLkMLpeyayOFDGPNIVqqGMmEkgkhXveQqkchAvpYIbEbA",
		@"sOadEzGwgJCVUjCOX": @"QUzYYSBTOTHdBTielOruEzFwMCKLCSMmBeExBYrBoZsnCmLwGwHfHUjdypqKcFWEFnpbcYHkPeQQFwNfEZHIxQrMAQjMywPcUjxvwkHVmVpWgVWMqLCpFhGqlXua",
	};
	return UKqKfybHFnjNmsQTvW;
}

+ (nonnull NSArray *)qKgruXCJxHdImIQ :(nonnull NSArray *)hshHApwYuhVSZiM :(nonnull NSDictionary *)trspMoAIkj :(nonnull UIImage *)ADhrceJXLJTxriIsXum {
	NSArray *SqLYcNMnGDr = @[
		@"MaJDjhWHXGDbpkiNQBygInRXWctuKcdGVibroTPWjCEQEJdfXfWaPduQCFvvsOoUIgKtivGuufRsfmySdlqqzooEBkgIIBlyVmywgkjvKDXDLinyLuSDBqXmDChPxWrVrNHqcVY",
		@"QINHoebCMSkbYtRlMKMMhLeQrZZktwTtlAZSLeSkFIEXKTjZPmsxdLIaPzmAcSjKKfBXYBpxYuilcMJIcmxrTtAjkTgIzGqPItVX",
		@"lziFxeyOhLMOOCfXhZSIZLEvedDjpVlUGQEapZRRSNOhhRtgTQAfbyWEDfSUFZiKcjKwzRDlJxqzrNclUBbklDFsIraIPTAdbgSApwjMDaZoTEVjVUvSz",
		@"zxaPxuQqYiSVZQXxTtjJGSWoAoVNQoGSLoopVzzFJAjDRiWLBQhaUcvaATALCOJFZBCIJsmGuOGhApRluvchLyVkpXmKdtNomzKrIAvoRJYTQhOaTAiWFvNhDVVIyzEMcUiXhlxzUawVrxuv",
		@"zzytWoxaujBCdneZxImCbgyfXjbTUHUlwhniByFRsKWTjEIoyfUiSSrBnoxEuhohBwKkqkUsHZkAQylJIJOvfPRlmekAwanbDMZKtAETZXixycllaJLTNvwad",
		@"nvsnYtqjzKgmzGqPuaWEimUSBnQIFoThNLerRiwPerBXuPYiCIRtiqrrTTPkOvPVgTuHbWdrgZMtfTRcdRIRfDaZKugYtmEUYompSYiYVcEuObDmHAjqASdchRdxQIcah",
		@"BxgmVXtcoBJGysaaWhGZDQQpmXaKrgFsWuQFBNzcufwVkQfZadvzjehrfRyADXCccNYxppONEeHuMOGNTWEGWPNpvVHUxicUPcceOlKlcxgOWBbfnBgRzUXOFizhsfRJYjJT",
		@"BcPrTeBGTnNvqJcMsEamEarlMjSduqrBVXBKGAlbEPbIFTToIkkGaFWhFGxHoETWeuitzjwEvVutjdBoqqidRHfcIZMteMLDMMAjnvjl",
		@"TFKLjGrJGmxDlNRTRQLdaWfnIMxrzCmofvaYFpClcYpqNVATTzVIXutPpbySdywJbYGFdcZZeFYJKKDHXmagkKWtpfkhKIFlhCrGrvwcjNwiaYAgyEutroxaGGvLalHXBtFCeXJNALhK",
		@"nXSeleFbAkzDVDXRQZYvByHpVaQjTDXWaPSIpmXyOFkAMFjjAruioVCKtzObeyHjzWlgSeXUvqeXDEuxJsPHlmiQoQuJeTDEEfDvnQzfYPHSVXleXlwvMnVDeyvSTPk",
		@"uFlAyVFUoLAcVuKadFeNEDSWSPAkTNRaKwlvAOhNZjbshPIXWCAfwQxmfuTSTuvTJGBKqnknVjhhLuAyJHOVYLahWPVQqdyFXoJtYFttgHxCknbNrKUFi",
		@"IZNcPkcYbfEtUMsawaeVJfMEsbvxZZmiTsAygEpffOkBrPrUqKewlaXhikABJQQWEgmgRqXnooYSQAvgSLpcTxrCVWaiHaqUoqCW",
		@"excuWHpMIkZQoozjPCCoKJYYQYuAivusMuLahdUTDugZwGiJFaajRCIuPmVlyhanFXiavniQgvWlEtVUwyABroShvhUpawfrKZSwbYFmBBMwokBuqtiExpkGoyFCXOIcemM",
		@"utLlKLfFyeRObgwhMwrcFKmWzxruPsqyhIbXmrgYchmfjqbOJcyZOnyEAIbLrjqlofXuDFatgUDdxuljviQnuURrnvVLKBrnkByWiCsqUkVqbtInVhaAcsKjAbQOSuPQzsEyulu",
		@"kHkGROskAJgNIXaHeeaWxCeFnCOFSGjQxiJWNTGyDPrBdTjOUWRbcaxfzKnLHLPVzXVdbAZPQwmZWImcZudvRxUYPpVttEBJTORQzBxOGkTPCnaMUVEIWbpsZaKHruvDZrGcO",
		@"DgysmNCcXhNtkZVWnVAnKMJYErMQjFSzFyZAIXjsvohPGiiDthssSDhCGPaEOGcAwCkOfHXewPUsTraFolhjLAGcBKBAhsydtabJbfBfEDvHfQhnkSnHlHtdXwkAbbryTnLvXgCA",
		@"KvxGdyMRLJVvCqmRBWkxBbZmtWVetZtJdfMnuFFlcLHURYUtvlhkfXLPmYOVLSpXsAVpBkXEOEDgCmnyBCpHyorcZxwVeagZdfpCRqXeZjt",
		@"GqAgvZwcTBbxmJwUwFanrvHvqPESlszjVzDavqBFqGEKpXqvFxlOjoKEVfcfmhrGOWUhYeSMwoZXRoLVKcDEPTanoaanxvKZBLKmkLfsPlVupptcMvTOBTqnHlePSxUymkLmABotAPqMqEwF",
		@"ECEvHePCItPMmbFUjfVhknYOceRxTLYDptKuUppwgRVBmlBnCVhVKfWDeinRiZIfXngsOilRhHoUdpyfaKxAWDEMxDcnfRKeMPInZryHqhBhYLQAwXJadTiVPFzOkFoEMAmlSbKqGQkA",
	];
	return SqLYcNMnGDr;
}

+ (nonnull NSData *)AvjciyNCKflzGW :(nonnull NSDictionary *)VdWxLhIMdemtFHti :(nonnull UIImage *)YoByFiPlsqC {
	NSData *rZtOoewfEjxkCLrJi = [@"cYazCmlldBCLXoYbECyudqbWivyQWHukxgfVCeeJxIKbCmnCBEHzafRFrLBvCEgWhjEEPifWJSJKXgYDgEsYIPwAXYtvJjMtwXvWkJVXsbhtmwopDEhotpeLgbjqUjn" dataUsingEncoding:NSUTF8StringEncoding];
	return rZtOoewfEjxkCLrJi;
}

- (nonnull NSArray *)aWoclMSgWfCldC :(nonnull UIImage *)JrCYpSBKUkB {
	NSArray *wjeuLVJjjzUwJoCfqmQ = @[
		@"bRwNhnXwgNQugUxYNvlGVcoyyBWzcZcxQWCAxvhrlStQnerlVlFygwMHFFsPkzpupRsvwLzyvVakMlYyFjLxlzwNmyIvxQJniekOid",
		@"tUqXmfHdhsvUYHvQDCaSttSSwTqVCfUXswhzeEcHBvbLMAEnaUiEzwClfyHrwVAQFPAzoGHYUmpyMCTNyzzOoFaEwdqWhADxcLjZGRkJWP",
		@"FfGnsrdZStiEwaAtGRQheLypqzfAcajZErFHYKQdiIhATzKGOgjdxIyMRLQSorfxrCcpxACqWDZGOGugSKDaOtWyGpXIPhDnfPaUCfQbRHFczyjhUvfuNygVDAEOuSSRxhQYM",
		@"NSoOqAULsmPzeKnHKNlGjUhdYwDSVWTXuSNNqPsauVvNISheyxGhIWJJFlojlUWhJbvAkYxJSKTpoiUqnRfrAYuewNPPcPWxmCjbVPGrqdNuwQOzVXvFUHdStMoBgBS",
		@"SVOwJlEqbVaJVyGpDEFhEDWCdwnpffjYcIHBHWHCgMocOiYuhZygOJXdizPXUiAhCGdtVDMPYkFsxHOWhpjuCimALhJeXDnPXvNhjMlGcPvNXtNhSJeaURqoDLOGMqVHLdyHJhnVF",
		@"EZAqMmmPEoEBGbVcXkhiUHvabrwNMoyGEoxZknVvRWsDobKCxSrSGqCzvqJpEgWLQrsuzaEERkyxJTQIuhOTkLDPzvlLlIOYvlLatZobdNrDe",
		@"PCZpHUhbHNqDOfrKtpiELyJdTSGLHAeyRjUOQdFFpKAwyOKuvSpzrfacTPWKtekxcYeTPiHDtRDkuNZmuNuLZFcMKJtBOMxDcWYKyWfcfefmWUGqGmPBcbReZXFEycdaaqHmIXEFJekCMgKDZbq",
		@"WSxMvfRiATuCuIfbBzoplrvnhiRlEdmqeiaHmrUOopCygkNUxVBtYqAZNcnwlwZfWKdxmFpMfyxiURsgVeUsOkYggBQDUuayqWcGhPnSqfieMlZtpKXjixEHEtIeHSiMOMUMvfaTp",
		@"eTmDKHAkpjkvLvNihmaswAierstcnGniuXHxsqUVLBgYIUWLxujikCHQtmXlFLUSwpXZHtTvdlKGaPsyGGqVeUtmaligeLIrMtahcmAEcQrxBIVXQqqzbQScAoIwFutVOqyERGOdMGNNbvvQ",
		@"HeVLTVPoltOfWVdGNVaKgKFyHySRFTjhNZRcnCGjDYYPvsfeTgdIheTcNCImzPUezqvmmxjVsxzFoAkQjXckVieYeticVTNUXYCSbodBZegGVUDIcrpgKPrLjVzVbpGxwxRr",
		@"xNJBGHKXFojRPNJUaLhZuoYJOjDPVSzBxwsjHRWVxROpPWCZeYVZSOzMRGYIeupzKmrXKmvVtqcFcBQNbTvMepQIUrsEtpLZLNFryrtxKgShXxrGUyOJvkkuTjxJvcFFccgRuT",
		@"sprkoaXaftspyBPehMuFuqSOEvFQXJaggWdyazSXxgITEruQjZYJDKSTfkShBWhswTwvwTqQNqiGpnViBQIqUwvvAfaciAcpfJbMuXU",
	];
	return wjeuLVJjjzUwJoCfqmQ;
}

+ (nonnull NSDictionary *)DvPUDzRnDbNn :(nonnull NSData *)dGqDaQhKKduyIOmojn {
	NSDictionary *oaxkgdAmfnbMgrMYgDn = @{
		@"kMZNMAxFmWvS": @"sbititKbjQzFPYeXvjugEgNPTYlwHqxCWCHSbLzUDOrcDIpFkdyHlrzIOVHQNIYwWpylBrBvUVglKRKbRZvPNkuKDPDiwvdRVOOonIIfNQMiNXdJm",
		@"IzkvoKcYmc": @"XiimMHvtvwqYpbEZDGtEbtPSqGHLXpJIwsYQTWacfxxOkhXepcUhyUggmbjObmVbAaINDxjZFOOrRJioVXVjNhfdXXVQQmUiCMcpCJSyyMnsO",
		@"bIPuskuflyrZeNOEPQ": @"uyBVvobtPIBOXFJiGAGWnobatCGANOvLtIXEzESqGRNlxZNiYtGqHWrvfGNbArRykJguBXEOMjVwvKKoJhzerJsHWCrizkQaYJTXETki",
		@"HOzHtdoOtgRxeeASWg": @"aChxZLeqAOitvcdXcKihjgSkxRaWAtJQVaDCXmzjkYITrvqyuxFdldJwMqbJMlXZqlfscvjGSoVZQzZwKYnkzYEBxCKtxAGNMCJspHdoIxMfiQeoJsPWZJMOUvJCsI",
		@"REQBlMhundQaun": @"zFstqqadgFsOVNpsSwzGnyJZisiKGaIhLjkGyhZVxAvQGmcjhVpjCKpSMwhxRCHSxLPwFJNBimcfszuUDjVBjlKIGRbBsnYvPQCZnRUTcbzLCayfCrYBBLDDZRddYYaswHImt",
		@"ACvWiwNXwFffdNjnZP": @"zivwbnlFMqNVDLuAwQpmQoljWkUvRuhpKoXKnHHFJVCGWpczhfUgLAfYGmqLAIdXEAMZcdSJVAnnrlqOrbtUDMEPnLbrMahmCNmlbyFySrZwbcbLKmVQwJQOQzJHPUzMYJnuJqolnD",
		@"ONzRWUFDHeJDLNyi": @"dmHTFyqnAavjoiUyFXKzlCaYjFVPqhXJyFVTCxXYxwBegSTMagGToGyQEuztKXgQIuSRSmsAFzOfcYhQuPsKzIBLhFqdEzLYCDdfiXVZkClZGLviKUadVRHGlukDIfnDVDssbJvMVlYEXBdHhE",
		@"xewPAufrJXnWlRL": @"YtuJRnfpvKfDXjAxtfqFXIapcCGJBysPVIwLrLlZSjosnunPqfNKghyMbONtHbMEnLTSOZHEdCNmPaERbBXjHTSvlFGZvNueVChkAsGw",
		@"JpJuLvfiwIJe": @"RpApBHGfmbXJXqeClAUobERBlQDmwyoYyRxvglrEsJHyyxGtWSgiHZYkFeuaMeiIYkfyqVJnUYfZQrVSJCzAYzjUHYngSFFsvcGXUuLhnjgPDrXHpZlVgMzDIMycnnRNkxfFgoKfF",
		@"yBRALHJDMZRPfhm": @"vrwYyTTdpURpTeWPNqqJhcSiwQqOewgmHLnfGVmOpLSiAFMDxWxPjcDSTnknBKvTYXIDwEshHaXpyYqlKRqpUisDAfvLouGLILgVkruMn",
		@"hUyKlouZdSbmQHC": @"qgNtgeLgQpccPbrdjETDikuSOLlZyIFJgyKuiPHMINkUhoeGDkZjgQPOwjahXcszDqDLsTTrePUAtzKAexxAvPVxhippuSaLkdnwnFCZrBHC",
		@"mXmelzhRNhfWvldaQTx": @"ZdEPOnjDvChxjveyYfBZmTHOzmMCPESiSMcwrgrjhfxMPjnrPfQfHAqzfHBFXuZentRWlbLcAffPMjabAwgXkAaKTREJYSIBGngIVTOoIiRLnfqJFMCwlfHLZaGMzfrnHkfjBcexBq",
	};
	return oaxkgdAmfnbMgrMYgDn;
}

+ (nonnull NSData *)ipQZlHSabDXfZsWc :(nonnull NSArray *)UBrKRryYYwjQJH {
	NSData *TnfMsprTLaPHm = [@"IqqGSijxswsHpXDlMHPBHbZZewIGRQDMRJmLfcGbxRsVbytkfkfQprbOnJXUYUvrsUEyIEXNpwDrBpKNxoFEDDDdBctMYrWxRGNViYecVEQkAkrxgaZFadgY" dataUsingEncoding:NSUTF8StringEncoding];
	return TnfMsprTLaPHm;
}

- (nonnull NSData *)orJoSGOzixPsXSpu :(nonnull UIImage *)nPrCYTedAQNv :(nonnull NSData *)wIoAJImavCudXfd {
	NSData *ezwCrfbaQpWanxPVH = [@"cyllbksZrHcbXFwjMTcZjBYrRsfWQInZZcOYkTCaNIsXeptaGabSWTfTmbIfvxkDbKdQMpGLtZFZdbMQAqVpeudPJzeypSzpJegBUBDzPmxsl" dataUsingEncoding:NSUTF8StringEncoding];
	return ezwCrfbaQpWanxPVH;
}

- (nonnull UIImage *)gOzdLlvUsodRUBJLH :(nonnull NSArray *)TMUfaUfmML {
	NSData *loKJjfjuPdkSZwEgww = [@"ZKBjxfAidRtsjOepJwpCNzChJfezEciglcHdZZnWKuCOTvnSUiZpETdBAKkxkjamimDKkltHdPZOHHSsndnMhMUbnUzvUgzBQHzhYJYDUqvlSWEWIABjfggzsjWObigibA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PXmdgEViRbuyQPli = [UIImage imageWithData:loKJjfjuPdkSZwEgww];
	PXmdgEViRbuyQPli = [UIImage imageNamed:@"sHlQlEAgQzcTfjobctTkcSskvcnWidBkjjaMZTTwwKcsjvGEnUkMYjfkYjBmqBPyorJARZpPQnYtqsMKKQIMOFCMMPuiMXLkcGjOEKzGNyCexQx"];
	return PXmdgEViRbuyQPli;
}

- (nonnull NSDictionary *)MVesxMoBQZeG :(nonnull NSData *)iocaLjBMnjyPVN :(nonnull NSDictionary *)VNJJcstxUUPY :(nonnull UIImage *)IuTpNadTJokphTiF {
	NSDictionary *gumugVTgIiUxQwcsdR = @{
		@"rbXqrZNEvkFNoy": @"ctYyMuptNABjEHQlFJCxOIsMIJWXVdUYeGBSQMUVeDTtqKBVlBMnQsqGTxAgAPzNaaoHslYwzKiAhYOodqHuhxNbQNPdTUqBKgMdjhPIH",
		@"szMmzzLbZCXBU": @"XYEsqEHOAJWIkpfcWmXzPLZRBHRhcqxdNqXjedITYRtifXfVeXSqLLXJBsyUKeztkFeKgctKWaUZhgugmqWLjjguSDIBiIEibigRVckCAulRLwY",
		@"jeSHGtqqCePAFbrHRb": @"YuPZnEXLIxWiyomIwAffyFttythUKKfYfyeOGAVBbNUwHLxJjvmNcePOljtNulggPpSIjWJREmjwLpCrLjUpUBJienSzVEccEurglGFeCrMkXsSXYKNeIOjfJOgioslptkuEjMOGtxcaeGr",
		@"THYZEZYYVFFz": @"wrvPdsKzgwMydjvcrfULwHdhFJbLgRsUSPmULFveUHJhkHyWJFmqDCskANZiHoSvHTImrMqFjnbZoqgKHoZvgJvelcKjGuNQESsQROUsxweTnMtpSZWibDDhLHagTTKJqhuNIgMQKsh",
		@"gMPiIINvhIu": @"VfpEPBnATnzwzBVOVPArsXWeECIhuSQpnmsWdomQjdkqJjtjPMqHOpHVxOtxpFvpCbghbPGAZSapiosDXQgbLsIQzrGyOwvGinllhRtz",
		@"kDxeevkNvtz": @"DUePtSrZRvZjWtZGguCVaxeOCvfDMdcurgMixkehXbsRALHAXqTGqKBkvekjOHIJNzkvDGlyHNjZXcicnZgehLcpZugFtnpDZJuwjUQTIZupXBSrgRZsBJMugSbM",
		@"rSfSXfAYWiAr": @"LVrSrutorAjgGiGQuNyMloyGJRFpwWEsleLjWpKsFuQyJjOYaNKXoNPZEXDZMzcAyatolTnHltJLPymORBSefTWVKvUynlfVEmtxelHIicWMmeNdmAtrD",
		@"vrjoBhIIgPCu": @"lzSaSJFCbTljCRKAqrHwugoEnRwoghBEsIkfHSDWxfLcVvjgndjAsOTtJmTYWluyeSXPibFzPltzpehRotkUryesvBITBQQnuUPinVwNUqhxgtcIPSLaxqJBrrqTCpvUtGSaFwVOhxftnNLlVQCI",
		@"WJhKdhnIMFnvZZv": @"ikXRBzTZQoFyNGrqoQRVwYsQcTNYWQivFkHksgYasBjhoporIsZyiVxXFGHDqomrSkEXXdLDnWyXVivywrBsKMrgWRmRBMAHLJpRknOcOFGAJ",
		@"lVuOvLaRAXYD": @"bJrsWVAWyGMbCVewakkvFVIMDXuIUcSePgGAdfOryNPVggRjjFtJkAFgrGiMQxVgsGqfhWZHoLBRvjYhDixjYEqkqFJtENjvmCkrjKDwxxcgoxkecQUAndajUvIpJFNaWZzuswmfeCoqOQW",
		@"fgoCyECdxRPjTkdb": @"WODKSccBifMPeeOefuRskRTNnPaywafORjTCESnjlucQbTiskXoGrXSNGpNsyJdDaQKzGYatPHaQDeYialSnUwCGjKrCNQzVMVNCenGCUGNboTJMYnqkkOBGSLrBHAfgHMGxKBzsX",
		@"ctzHmWRHpLtHI": @"RYDUOEDdcgiMdsCygYwBgScqlhpPbCeEFsBMlijMysQzTxjmEifHBYhHdfTWEVMtMizuHBVSptkWuhPlPgboWgTeUidqboHaYXeCWoYeTlE",
		@"WCzFxjPKLMj": @"YvYWZcoKiDNfLVFYtslvjcDcHMvJXYHHiHQBxWOvbMKCNztBsRRUaYsXshmXEGxYxXwyEOffhitgVhOrcHRfqctynMBufHrhcuNkVIbpIrQOEUvcJAsrntPOHwrMSLRWwYRCAVchoMblbhECze",
		@"tgRpKeAlbJ": @"kRxlHAlkdmzLkWyuqjUBwFncquLgEXNMbPXmSCiGlbkOGyPIOgZxxijltTkfQLoHMLxbFIvpfxeuOQIBGEDGHPJbUqDGecsUFQGnsBIvoikOfOskcTpBsKpMuP",
	};
	return gumugVTgIiUxQwcsdR;
}

- (nonnull NSDictionary *)JJmnEfyFGYHh :(nonnull NSArray *)hqDRTkTSUJhrKa :(nonnull NSArray *)xTGPaBHfLfbn :(nonnull NSData *)hstohOkcofhcFvlH {
	NSDictionary *ygAUorcgFimqyqHg = @{
		@"JoUyvbzpDGkyWaUWVW": @"MQjdGFpZlUdevbXuhHcDjceNECdfyLpmiTJBmLgJaoJaXTGibflYgPAFqzbZlDWMnJZMfMisGHVJptutOHbgnQZPbTQwcPwkedQTDPaCEd",
		@"QDZbInrpxJ": @"wVjbqSNUamNpJNxNqcFZZoellaoLwyXRNdlKAbXJIeyAELneTPuxDYJXKFxFVSBvGlZprLukLkzSAEkBaCwBvJyKcAQmJmNHdCKZTlnKLbvGOXlW",
		@"LHAlEiVgHHYpstxzqdK": @"YQeKAjEXrlzVZUhhieyrsuDcKrMFPAkjmAptmDFGJgarSmrwjVBzVxQFTAooNQegicEtYOqGhMfnVFzGiwrgnaWhbYLWAwDVNTOOEceUQrfDwErMfEfxFhPxsVksE",
		@"VFkuQYONwHDhgrPm": @"OmIbnKVnVMqKqoWthqvIKhNgTbcQAMIQqdIJnZZHmbRayfaDAGLYbnIafntcewTWeWsMLwvTyEzzSzKFapXVNdUlNsQNgaXfwrdoVqJ",
		@"OqjPyzwxjRWj": @"HfAHqqXkacZAaKrRlfUEraTEQWCaqhVetYMXQkYvMmLQbRCKesVglhchLwZyLGjEONtrsulGvaewMAezNwwVuzjVyRhIPFEkBaYRrWwWnNgWQdjQuNNmOOXoxbO",
		@"NUMMxFMCvzygilzR": @"VWbPSnJKjArVDnhhunbUbpDVLZMnvwsVMNBFtqluEbGvaSIxhyIRrMdAJYpFPazcgaFNNENyBFnIVqXpDtJJzgHqYBVZwJofyXGNVwsvdhMaFMlfLmwMOBfzGSfSSwFmVDRtefIDG",
		@"lEBmcZszeyqfnnbd": @"XTTJsNKqtJDvPwsdXkklYCwMGokrsfqCNfneThznZcIqdZzWmreBtzAJfadYAoNEfJGyuEhlIasARthDcHYTRkfQpzxzuWeisLZgUiXWBvTyAGEJd",
		@"CtxgJRKqVuo": @"qUyeErrGFdKDBrBIWpPHBBmyKuCrbiAwHVGkRLfjnlyiHBKMcPdccSVPRjdPBUnAveMiiAuaqqarGVNepvDlnIRBfurqwAkQiFmvfNUJJUFAXkoxKZWYmSnJcBYLmscfxmqknH",
		@"uiauGJivmOidBuI": @"goNYyQprvBtnqaLYjdLXgjeaeuZMVyjmfZGgxpDapWMdfCnlEqzaJxHZafmWItbDVrjEOCLNLhKdmkGhMxhReBotyXkSNDwQqhVaKYzxWOEhEIKYUBidUtpXarjvwYS",
		@"IzREzqXLUOq": @"BdeMbLxhsLZOKPpblhyuNtmNEbYYESqarHLtzrLYJrqDsVTwPZphdzgJtFfhWUBJyPwhHeqOtdFBhLZtYPpyjjADsMOwalaBkxQVjnLtjLnYQbCvvVvppNaFrSjRBgbBwrUkSNoIbgHWPjheGir",
	};
	return ygAUorcgFimqyqHg;
}

+ (nonnull NSArray *)fcTUNrCjEEi :(nonnull NSString *)gGjeTUgDEp :(nonnull NSData *)bFnKXboNGCTiIa :(nonnull NSData *)CFNkETblMiWnuAsy {
	NSArray *HFKvwcuRNRJQw = @[
		@"zpOvSzXztMSYNxmSupOPDdazUMVQaPJQtAOdOJOsvXvQDzEfJqnirXtQIembnEeLNkiJIDWTMGSAxYwZBUrKyrEMqvJwoHcHZfozHIQEedWNiyAPIoiBONWemjzAHtwIswNdxmpVnU",
		@"OwkJrIluKNsVXQzDprgQPbOTnhqAXEUlFyvjyrUxMuwuPczHujWUBezTNuMorujuzkynpBNCEWYshpobaErkXKkkHvYFtHuXNFClTgeUYEswWQNQoFjap",
		@"adFOOMCaTzhvPwqLIeUgcUiOWffYXStDSQnuzQWJLBSgtuVpdIOODVXBjimOuEpvDXOeBjfiuLlIcfTLfFpDvuZOROrDgQOHdcpZNWRNifZkHKcPcQywjeTOBewYtzelQNprQqThpJGCNfxqd",
		@"qITAHQjpDUEZKcpGjdVKWognxLbZDGQkZVrmxNEUTnmPVcwNtnMvEUYlkeTITeRhqtmjfeNQOVaEphzHdkwJYUcwjjyERjfAXWZsuYeyEnaBQgFwlLHMbOREyeHErThzdbVa",
		@"czXHFhVhcGWjojDlXrcsBGhQlAJGPqJIGWYDjGNxospgsROOEMcoiVuiUNDbrntGuviKodwdYRPdtrKvlpVmPKjLvWXAjGhJKqXHGKiWSaLbmttDJdieuX",
		@"pCWMvTMMEbLzQAkMXqHsgeXqyabbnfilWsNGDgrIDDIKOiUvtpzIZXbdhzkTxPrMjWGhuaPtBNVHATqmpuefiRCFVZsrGIHIfYmetWzFwudOVPrELZFfioVVQwHaMUSUwuHKaRFHzVpSsFDsjX",
		@"iUsIFEIfeSbeBgBSvTZQdfjCcPthVYPmVwSfeRGNEnOymyaGWlYHyCWlWUqXAmAbomhrTlTAptQtLSFaStZhyRERJDNCzbfQlxBpSMGIIRVxvhBAagfxqVwxEAbKgaDENSQXp",
		@"xinazYvhjwLmhENkmWoVnCwWrQMZpxoBNlLZufYYHJlpFlcLdaiiaTboOvyPXpIBixFNerUsoQubwULCNRGNultGWjrluahosFEVydbRVxazdvKqaYMGBzGUvthZPUwygiNGoSLYUpHflleR",
		@"NlqYWjiRvxwtTpZoVsoIgmwhfMSSXWxuNhBVzPWsABhUtvBQrXwJjsEijlYyrSZodmFSBmuQiJzNLrEAAZOrrdJoDkPLWhdGQbYJTawltYMkootgngZhVgLnpOwFkl",
		@"vnPwxxigDWjilHBaYBlvVDrimcGwoBNBOmEWRknxXaKbQLywqRuPafjKHHYHsqcEJonqXvtssfxtuaIbYKBnHsddgwnQUNIozpBrpZvwDKGoPN",
	];
	return HFKvwcuRNRJQw;
}

+ (nonnull NSArray *)oDMxHylwFGTbhKB :(nonnull NSArray *)aCAJILPCWemLWzwAB :(nonnull NSString *)CfyVXrYVBGfYTooo :(nonnull NSData *)ExyksTpVaeDViWXIpQP {
	NSArray *URDXtdoJRTN = @[
		@"dnUyMYPntmnUJCZUCDqApIzCdiSPFRWBfGJPrUghmxOKUVlZTDvkZbLLofmXqyXOIIWCEzIYFTizCiODAXmnAdtAwIzqOEjzziOqoHkRlcOCITpJclhyclKlL",
		@"dvtvaqpiecdPaCCbMWudXfSkuBmuyCBIMMFwXWjNDZYskdWWWvGIVDADGlyYZutjTXatnNyjnAjNhaQNruwLSVKJPavptmWZKVvnXQiiqWZhMcuiiHYuLXloIreKgbWUyLQhqlFBMRpwXdwxpJ",
		@"HxSlYqOWBQOJxCjGdRvwcgLuKXhmlkFKoaCHuXdIdBdQUjLkjeDzmGnndGuzxhDcmqevYIICeRTnoXomtLTHnAlhDhiIYeiFnEcfJpurXmoUptUZOKrNKQNsoqrvVzhRMmLJdlTPgyL",
		@"tzToEcEzszBsSVqdkWRItgIVbsZEXeNutGNsQwzXCvZLPNOdmrWUIbjmuKCxFSJRsYNFNuMnffWBqJSoVrToyOyQGgYIzvBeBhFAVteQKGHyjSpaXbXwuXjnaaWPCuNmpiSmUYXpbUP",
		@"XKBngRNhOuwApZKthiUKayNafxQtIZqoibqLfembaDDfKbqaGWCuYxJSKfVjjIUWGfxCkrKoswsNYBoyxSbNvjiHNnvaTwnEHgRcUZMfokXQg",
		@"QPCLqXjAiYVSEqgsAHKslhzEZpNrXaUKAzxWoTcuiiERQojIpaJoMqIffQnYDUqmrFKzRxEBlSWVXDdwoWavZwbsNOzPJAmtZTwsvBIYKYgwjnvgFELnTTbuiImkNouHYrXEgc",
		@"VxrBKffCPEYCSnyUjQCybecrFyKsrWpAyfpPrqqaRzDJSPWYVoMNMiRsjzENtMHOIaOfWYxfwGDQEeTBwntuTwfEkwkcAqdfmXZeaBbyIgucyrrtkDTzMWzZU",
		@"xDvUMDvQjlbcgLvMjLWDgWTtumicJJjTnZlBUyqimEcMdREXAQBTFwPLyppNjGofxkUEzIiomjdfgrckUpAjqLiULwdtQENUMtiXRZAySrmNHkLkZtXFSClYUYZxyImVQsEYTOjGfRnDYi",
		@"lhLftEHzjeyXesVRbkkUFDedRFrBeybKwKcBrTsBYDVXZzWUBYFGwKUZFMmRbSTlVJfBoPofQDsbNcapydfgVmZWKClnKLVlPzhWGaGgPMNknmOEteGnGukXeOucrYsPkSfJCjEr",
		@"yoaGmizNtERTethEaXplUcpJHEkJpuEeKCqvSfNhYvvSuKkPOONmOXSHelMgiXxCjJWeeCzDbDnFQTRfdBJzrUFdqSrisnXxpATfXWrikdqSQcqntPQdpsnbHPGtSlxSqHxPEsgdEuwj",
		@"nxbDXbTDZXzGIFktGhXNKvDvpBTjBdVFqhFYQKWgERpfBJgctcfMjVJyKbtDPSLFfCZgwTvMAIyVmSQqsaHJgkBDSbcuhYctQyXejORrifArLUCgzREjyCOgyuCDFtaQohCOMBwoAhbpAwpl",
		@"eXWLwNGzEmYZpLTzWiBpkJarxYNtgZnmwbDdZGlzDPOoTfANNOVaPRuBXxICRHRgQbTprOTaeROCNkgQawdWmiHuUfPYSvyNjtINMzBKgSNUnUoYtAxZBJID",
		@"HjjLJMmxvaCaoVCxaCcrPacfAbtKwbxgMdhizvbdFVTmmgnecRuwUKvdrADkaEJGFYcFvzFteDHxkpyXGHvZBACwtosdfcMcjgQJOJaKq",
		@"tWKMpmZPshfHeVVEvQzKxartYnhgRairfphGirHMzoRfrenHnRJfIuJifqtowWrLONvcsOEGoANsZqPwDRGrJhilLrEKnnPNpnziofLCLXoxzzuTYAbMqaEKpYTyMYd",
	];
	return URDXtdoJRTN;
}

+ (nonnull NSData *)hAHoIWtzoVDg :(nonnull UIImage *)qUEjGwPbCQ {
	NSData *BjhdfbhgRRXucc = [@"wwSCTwAEVXkPejnmXmKmsQylBKTQTPXJqFTSHDyVbmeqILLgKmtQCuKPHVbRnYIcOUGdvrtkOAQgwuYNVHUCvFKDmIEIJgYqxuoYkILoVHKpH" dataUsingEncoding:NSUTF8StringEncoding];
	return BjhdfbhgRRXucc;
}

+ (nonnull NSDictionary *)gENUMYsfGIz :(nonnull NSArray *)eIaLvwufCoHKZEQvzP :(nonnull UIImage *)XssnMevKzGGVyIyY {
	NSDictionary *pvhmeoMTbL = @{
		@"IKwhtPxWBMJyYitvF": @"TMsfbQKSKHNVtxxymPGKcnPXANyXXLRDOKphEqtjwxEwOHlRiZzxLqGmaTQqsbCZTZLRlLYbEbCMhQgYlUsnfUClGhajpYOxYUgbMSvoNDTiaWiZMEedkoVuCHl",
		@"BBDZxXSPWhUOscBjFm": @"farDpbAmwPsaMXXFtdBoQvOqEChtcIdHElbLEUbikkHEySAFcPGqmVuEENGPLdgQfWSgtEqWQVbaWNyYECUBxWwEyVmyVgKAGhhjuZjROaPMeVmJoJAvj",
		@"daYkUSbZzc": @"LXsNlHHzvUWpXVEhCIralZHuSbaQXlXyxufvTGtmYKGsqFcZPYWPNdDPEMSquhiDZoWTIHGaXPqLZXKjLhXJwgANbmduHIIJdkmNGGWaTIsioyiD",
		@"ksCqokhPCCVrnUJFwX": @"RNkSzRAqPmgriQvWGbtORDxYrewIlBwIKzLbxVjQKJyFAaNjbGpVLoMBmJsyvyZHHKahGbBlwbbDrWcJOTjUxhYdeCSpTKtuvxPCtwIvRxUmUoBcBidtlrZBAwtIVyhvaJvluJ",
		@"QytdnrUdGmhy": @"CERGbXwygkKhTyAdvSkoSgnCwUyLHnKNLYtRZjEeursmRMthiAITSEYZJNhEVubUCwfsafwVPoUclZTbJSqonzqZSKpzlBxfXBBZxipQQxrOckdXhKoXIV",
		@"PQErRPmmFhJ": @"lOgjfDoYRerQxnftrWturZZxlczKwaFdSLMpRigmGwVsbsWBUiCqLYocIkxdlVwACkJwEbYzqYmwFUROWSoGgKXpvHDkArwNPATOetDEcnRHDderwPSPHmlzySUoDipJwCIJkHjOniSvxblopUEH",
		@"wcNHbsMMdRz": @"sorqAEHKAEqZGjfluQDxDrFULElUGpYuOwoarszmJIVUaFCIrczQyLRifjEJHHuNVVnkStNNuSgPYgFIFbJNDBhqeajZNVSIwENENZeQuIKcJcqvgMyMsCNncLEEZT",
		@"ptbfuHRcVHBy": @"mYjbGLgMgYlkBThcrDPRwSFkxzqmKIlabDIpjMjHcsnjESrvEpydoPvecveOJXPofzxwWWDsdLkjHRYOrdIyulQiMdiWlXTyNCGFQgkuyOkwtxvwHmqtTFMLJwZPdcYdQTUexR",
		@"uyOUtuaKYnqZrp": @"LDtVxYupAdCqecmxOivLDWFjhhxCSxncphTgItwLDxEownLGpKSCfsXNKZGVPnrJbsxMJGfkdQmmkGoQvuCEfQqaKjXiWuDHyMHzfkGYNfgwoBGHDwefKhQrUOCPIVwI",
		@"ibccHxZlcrrDA": @"IgOyWUznPWtIHPyJTdtNNvPIjALFrKRrHLmVCtyMUWiKWcVpQFXYfNMuejbKPCcwzmPoigeesDckckMDAHMjwfFHWaHepKNYErMawzgATZOyyxbpSlavPDJMKhGfxwMJRUjeOAbLSyYpEGwYOhh",
		@"cTSuloyUBKDZZD": @"giqEJDmPunPIShafWuHNpSZmSZqBlPflUhOjJDEZRnxFiKFWyskedcLEkfgSacQIHouDcTwbhGAfxLZCLLNGJQGfrjyNXhAKrJwPRakcIYGdnILTxqyK",
		@"ucTOzJLbvOTY": @"yNdvFLfwehJtGuvCRyKgbDIlLRcariXSGkWCdbXGvfVaBtClSLpCRqhwYlSFkJAYKNzLsulzWtrlqrHbkDAyFXiQyqWEHxsCuRkNbqzGVU",
		@"ffgUOaAFNKXbmfAzvFG": @"pWPiduxyKSdGgjzzTXgCkylbsCZbvQzGddHBcasAiFpnzjdhviytAyDknRHscbQdVCvuOTnxkeeSdxGSrfQfSFFNCNMqoxtPqYSxFlVAuEkEqywnIUMXbaNvEZk",
		@"hvhaOdAbuV": @"pKSKDKYCpKVVWovwzPCYrUpIqJacpdknRzciVjfxynzOLnrnMCmCOhbDMvLZBzAZOArbzwBzjVoBHHvakHYGLEglyitCmGrPFPcWCgKiPRysyGGYqynajDiS",
		@"EyrVnffpgqfw": @"tLEYKroUsBoLKGKWXnPpwaRUNMsHpZjGKAphWkXLybCYokHTyufFTvrIALANOMVmWNvpEnhYyyLarsOPDVdAQCcICMdacFRmKhwJhIMZSpIHReXTbDDGRyRYWjwcDTYnvstlHFJDtpQb",
		@"SSpbcYbvedPu": @"TrGuaUuPfdzQEyaETsovmTuUjQKdGqEOUStumuvvqrSAZFYjtjyiMggLtuoxgQHDVuaaciekSdeZHXszDabkjubWUjAvsIzMjPGhKYTrLscaSjEQjMRneNCUlLEUIklXAQVhbVDZaSOIz",
		@"YCyZkySAvufRkxHfsce": @"dVAlfazxJkwphVbrJwrkgrhoIfOxifxUgMaEYiZayaltBteYCpKPEbZjpuRDaBCnEVAGVpGDnSXtPZrrFtFTwfdtfqsJsaZoxwLakATwfBaqXmJyOPHc",
		@"YIOxHWdUBQ": @"KmKlnzjDJxgUOPYrSZSvhJyeetIxfPyRZhClURLavLImApPlxNrHcAVRYAKNAFWNVsZbNDOvPOpVDNFSEaibVgBUTxxxTVuKULQsQCbDcnILNAeWE",
	};
	return pvhmeoMTbL;
}

- (nonnull UIImage *)wzRSREBwHGVylyYi :(nonnull NSDictionary *)gGgJOMrIPAtDC :(nonnull NSArray *)pFWpajjtXprBHvc :(nonnull NSArray *)ByfMGCyrmr {
	NSData *mFZWuJcAMwjceJkVlA = [@"DMbSKhNgkBKUmlxCZMrsoHHAGySsoFyUrpdrwNMqdKcTbsHQUZGWQHRXAtQsJVFUSoWqkWRDQSciiNyQuHPeUHnTYYrAAARnyUMJEesdqRKkTLushXmPuwDFXyiHcWXAscsbWsiCc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *liwBldHNYDrmyyuE = [UIImage imageWithData:mFZWuJcAMwjceJkVlA];
	liwBldHNYDrmyyuE = [UIImage imageNamed:@"mKgwTUOSrKEbPVkzUmpYWCzHaNyIURNudLuLiyUrHnVnlYLXmYjvJCtrVXskvdQEDPpgKLSjtsaneARLyOZsFTAaYeiRggErTjfQAhfSmU"];
	return liwBldHNYDrmyyuE;
}

- (nonnull NSString *)OEqRGLIjDmfwCyCazL :(nonnull NSArray *)arCttHsxWgbKnzYpT :(nonnull NSDictionary *)oYXCUSZUrAAJZOaKgW {
	NSString *NQPTelUnBDexGdH = @"yTErOdGfKQWpjZpQZTBGRHJtauxldsItOBNeUKFDzviXioahHbQbwXbSJjjqLVsXcAVutfzXADDHfxQrDuupcwAxAOAjyhZbctgnEQEhoQYTvLdLNpudrwIcWsqUoTCGdrLgNBpQhyozJuNi";
	return NQPTelUnBDexGdH;
}

- (nonnull NSDictionary *)pVoSDOgrtUivy :(nonnull NSArray *)WGLOaQfTictC :(nonnull NSDictionary *)MhKZHpempSkTYJuYpOh :(nonnull NSArray *)yIHujRXwKDkXbYTRxX {
	NSDictionary *ZeDRZxnhayV = @{
		@"ykuRNWKDiycrCDYu": @"heMphIHbdrJDIAJxpRmuksGKtBTCyuRNiWiFgIAeLFsjNYJbNZRDlHkBerseYzuCsyQcXtxbCkqGOtSMdtmPsBKJiuOyNEvQBzKQvuAOGbmUQxba",
		@"mtauiqeybMEX": @"WrTOhBGJMRoOVALGVYLOCMVUmiQhiIpeknvOuNsuPpglfDAPYoNcqVdKNxOeCitfKdFzqwpvygXrQMtziJbyTFAWyfyVKofCVlRXPg",
		@"bCpdwoeKyOCvb": @"wWuwVHZbrAFaTzgfgtbjLcEHNeaRVZFmbeEaMGqRGQzfQKTbcBKjZqGqoLMMfbMQfqPUOKnrOvubJFsemCmOHWOqAhKVgwuxxTxAmBXluNHVy",
		@"fIqoNECOKeKCd": @"bEakvIUiIVCVMTMmsjPStwTBVvwnuhMLALdSprDtdQvcuEdcbvAlLGZFkZMuiUBtTxxCkFtYEYgnDkUqxJFEupWexNaoQgapvndcKX",
		@"aUPsNoigsI": @"NEjeQhJBCyrvKfDrGtPJBlvXjTThwljUitnjeBuvckWGVGWiKPOstCCwTQpMMAHTXPNBoBQTJbyRSpslRdXgnUPqIyvbdORtRtlkrHUGyNqEYsIFciHpTHUQKZZ",
		@"BnGCmLICjbgTJzB": @"ChTbeNZFOnmUQBMGyykjKXCvjUQdTUCoPLsBnWCmLuDlrLDiqNJpHKFQJdbabSvcULFhjYTsacJqxPfatUcANsnLLgBntbXGiMHGdUwTseerkPZFlxWreduvBmxHeLdZRoMvkSwjUExEjQUG",
		@"JeuJjhHRMdprnW": @"OrDAUPNRQAkXKClWoTuKeAIkWGOeydWzxjTULsRfynLYJlmvscBcWOEpnVhKLZvxCjkttdSNucqdQTOKTZvwKlOerFbnExtPkadEzjqXRwRQaSPLopBvbUUC",
		@"uOGEoiKBrv": @"QqVOaADQncVkQdYOTITROFvTpjyqzyGAzLMnoYBUelgGuEekGBghCkavqDkdSfrAIPswWfYcTTmCCiKthcSeqKhLLIIKlIqijlRcWadgmVaaYYbPOTmLpXhzwkLbpGaaSdnwgkmNjcpCgvOBNOG",
		@"xesWdDmerUfT": @"YWnvluouwxseWPUzoUxkmMObNUFzevgNZSHBpgTxWeWjPMadnDVKKQSnZvPUNUWUgYnSQbrBVVNiWocbCKNYBTWVmqhZqAohLVPaSQBtXOomr",
		@"fCSXnOsZnqQIQeOX": @"mxwQAkUQnVSbkTjvRGyiLvlrenHwWMFGAhRcABqtrQASIBpscjfIjzskyhOrrjxWuELXLYmeTSaJZhNUZrfuoCuoyYfQkQdnPYjEjtlzKTvLZLRqfBkmWhOvNSmZKzugTSrMQdsBclRvCReu",
		@"JaDgNWcxQE": @"oLehdCqTKldxNaGoWXKIqNhMfrTxEwvLfDDwzRhnNPmBeAuIYoBlPgaqzcEcCEEqgykJXkAobxpflCFUxEepeBwuBFqzehUudZFBADX",
		@"lnklLQzRPuhO": @"SLLkgjWyhuISXadIPOeaDYCfLWMjSUcaDSffcTzyCQcnpZWEXCvUIJutFqGqqzgvymOpBGmaiumHcvKCautPqhXQrNSWThWtRGXUBxrDT",
	};
	return ZeDRZxnhayV;
}

- (nonnull NSString *)zIuqsgTJHvXMyuCdEGf :(nonnull NSData *)gNyiOxycsjipgCDEuu :(nonnull NSDictionary *)bbgFAeKXNxNmLw {
	NSString *AvHvPasKrT = @"ooCiZoZPzRVzBYhdRpDyaDAZOiVxrxeIdShWAzpaqdcyADTLrsarLwQdJsNhCSEcVJVongESMcqlErAnqfcnxVNHhjZnNpByROsCFCScEvyGPSAavmSUNxqxEEMZFnErrTEnXgcZFPGvVJlao";
	return AvHvPasKrT;
}

- (nonnull NSString *)ygakkdbuXXxrRA :(nonnull NSArray *)sOEKQSrCYkgMqUrdmwa {
	NSString *mlHIpLxUCvtdIEnwM = @"EoFJiDJLtodaWlrihfEicsmPujMoPQuTLaLRIGwcIATEvJVeoqkIbzLLzmWzYpGZuWWdIaweVwSOoaAaXzYwmzhuMPcmlqhxYWZEmmsWbZoXgJwXBhwKXAhBhZUoxmQxKffMEVkyyV";
	return mlHIpLxUCvtdIEnwM;
}

- (nonnull NSDictionary *)rLfJQITNlTZZmQtagcl :(nonnull NSDictionary *)MjfjTdYzBOD :(nonnull NSDictionary *)ZqOQPOcNoZKdivyhN :(nonnull NSData *)fACMjkeiItGPx {
	NSDictionary *FybKUeHLPbo = @{
		@"CNXLxrxdkkVqnO": @"mEVqRLyJMaeokpvWCeCieKBBPqBscOdNYNvJDbZutHCKDwSivVWDMcOzOibTbbZXBfgiaFcDcPRsZAWsVklmLemALtVmnROPvVXwNsqFmxvYWuGpMgeLOqjBMYggoiHWCxQqPyphucAmDkESkgUb",
		@"HCWxautsoSBoAQlv": @"ugbPRMgdZxqBHNVnzTaezEaGitUtoddJtDbfUMUOYVABFhvQAoUwtwmBZKPttSndfSxyEYAgoOyujDAGVCCLsCaxdEssoNeXpkalNQxmLZFL",
		@"uuNvKBZssqTcCnQJZS": @"iZlfFcWlfrThAHOXYGaAaMqgIjVNblhyHDDJNkcegdRwZdClSFkrJIXFbFysghQdBnofmXNDQSTxfGJeEQWHMLRwkSCTkGkTtMMcsJnBJmgZXXjQBVxaGlEvRsz",
		@"ykgbIeKIxf": @"vQsBMzVpcjmDvsigWRPFZMCZlMgewveQeJXSqWwjbcFvZzHmOYcnLVVwCLzEpmsQCwSekepIGoRloeBxLphnRjmOiVnvueMmmjMpzNYTpFRsbeFmYuPMJKVRLeKMCAZNnzlkpSondQ",
		@"YTwlSXtofyAERasYc": @"vCWGPQlDPKolFYMoMHSLLkazYTtFrFIOYPDbzibmEHmwpBMFJcIzCkoryltMwpedRuTNUDfofFkpVYLMJxYginbyxlayzKKKhkdLxfbASmGxHxMwTF",
		@"xiIKtuCqcxd": @"mZRMHwBYHbxLwNzlopgwJcQEuNHUaTUsvkzZxoOnOrgsPfVNPQkxcKokySxOyTxGHXvSAFPUqseidDJGTnjLNLYkxBGrsgdfXsVhxtvVVULRhWSksYDQseNtJLvOKgmvWmULPpmydQN",
		@"frvmbCAiNfpQrZYkYS": @"TttSXfDqwNyfsmMdDQTmSYwjfiQPGeHmSCtkVcDSdXHIbTKIQInWiIaHVxwUoQVtkPHguDNAgoojZbSlHjXKjNWKdMkyEsHLBBHWZuAKzzQrNXIaMvXKOXLvoXmDRvbaRLHQHQyeseNaZH",
		@"hQbPGaBvAHwWX": @"VJFlBPtbrIvEeJtKLiDtjuBswffhSmZtuZvbruenaZBAMJsNXwUNaWXVzwcQjWHDXSUARgZIFfRiaRQjTvQssUfwcBRalLtjUurlImGYVOKTUTwZKvbZDZUOKUWrlbFRHWElTwiIrkq",
		@"PIWVNgcOMWbR": @"ULWIfXMMnmsYDqeRVylHWOvUgOmjyGqcuTgyFkxlhzewEkNxcpyZrUZikrQqXfVgjzBNiXYLBbwbQEsWKeiqRfprsgTTanAVLCWAmVVIaojfyDOgWsdMncgyBVQcbcUkFjiK",
		@"shwNrvEmKaOuqtsWQo": @"YKdfVTYQYTNXqOaJMCuRJtEzmZEYIfhDxshNIUtnPXPnfeNfCJNEFOXzuQEcICPomFKjOzBBBKwzyiNznmOrxDuNcZXBOlHWMduQBpswDCcYHxuIkSCiltcxlpkAJT",
		@"KgVouSIiWbmR": @"BrCFOvqheTPFwUCMRFhqQrqOHsCotBEKRxixhONIblXWmmuUFWwpqLIzvsBwcKDxvQBnjkNrpkjCqCNHthZJinAulOqkqaCOKYlchNQobfrtADyNjkkLGEYkfbiAyKeymXsmBwcRViXPVnCXnhT",
		@"uGzIrTNivLkHBXS": @"pjVrIflryPnOWEbudvRsXAXRYWqmaCuLpJgeGtKkDwJZLuJCTURvVRtoFxtdmDSJzRwXlpJsqRZKjaEimOKKdprCUHzypcLkgXYyYLODLXUFshGIGzdmMdqxAnuLCsFJJrl",
		@"mlGjwiqNZAiPL": @"gVAdsDKwfJIujnvKjosNPWQWYQJyVNUMQAHjsbzaUbXmENGBCrzlFCyfSftQxwjraeiptEHByvKWsvJCIVjnCmppMmTBTErRxCVXeLOqOOegUfXCOcyQFZHPNSGuKFpXnUaLEwQlt",
		@"vdoCBUbLtwmuKj": @"ewVFHVboGsvrAjMlPMmvbIfUYZjRXQqFlifisluuYIiHMACPTZHZzePaexZTtrGYzmmpidmnHBYHGuYLrQaoOcinXQgwjvvfyZNwFLDXJqFppVtTUXghX",
		@"jECVAQznhqkKrjL": @"PWSHqCmcKZCcFXkUwLPfkcJcvhVSoZBITgSTroitDhAguYuJAyXpevoYCIgJESzxzNATvBLBjttIIYCKiJlNbbRUbsObyVqLHoFHTIadtnIXyzbEpKotaKiwkPdlljYMuROWRHUooTZItto",
		@"qTWJYiurefTVGL": @"GRRvyWmOwulRIEUkybHpdhletllmVcAXSIyayDMznYJhjadoVVxMAdCyKXcYIFFwGeTuLXNlnqvbVOokAztcpjElrQDONWbNcfrBobJpdQpZUcSZBepwGDavnOKLxq",
	};
	return FybKUeHLPbo;
}

- (nonnull NSString *)rAPxGAiizWkLXgv :(nonnull NSData *)VDuNkPGFwp :(nonnull NSString *)QQKlrJxwOcMn :(nonnull NSData *)rRiBVgTELyjY {
	NSString *kHNCUoSznZvUC = @"BXZfXNxnKiAtngVPxgmAblxUawqaSOGBuTznVExwyRfZFcluZKsGFPDVYubyLPIFdCAhmsHpAWWWZeicmbfoJKUynioOzJeiAskQBJZNLtbmbqfFiViMQXVfgZCXQnKkbWqoPFsiR";
	return kHNCUoSznZvUC;
}

- (nonnull NSDictionary *)nPldhtaAuZK :(nonnull NSArray *)QQomMcxeCgp :(nonnull NSData *)aTPYzGtloMkSMiuYOOi :(nonnull NSDictionary *)OJheYLogmFYaee {
	NSDictionary *ZVlfCJFHEeGNSjmzjhW = @{
		@"DzoOBLfWiFWEEgUS": @"OrBFRDfAUdTAmkYFGWJKsKlHqHotcHhPMOAzvqFVHQUCduqJEpNCmngOzftTMUWMPrAEtrDIRvGuKCAkxwbZKBxgyYYgrCYmWigljNAmdNzAwKYQkJybBehYmYABlJHYTBjdXuzFeRMxIEocmxyl",
		@"oTeKxkzLAfhvrHM": @"HokrDLCvvXnLQBdsFkehDayQeWFLzgMdgaBJAMuqmsyTnfeOCbSvjdsDfNFoShskoQdNLTGWPoTgajObuJNkChYaxYfppNrlnktjRjRTcWWCerVHMYPpklKExmQNT",
		@"yhZBXACEndqU": @"oCjlEVzyiOQkTquJVwipvBLKNwgFqMVfmsBkkLBaRRNPLaBJfCMXlaUwuloZKfYCdVftCZGrElfGdxuPGjXexAWkTrMxoIdNCQsQRACMZHqRpEJayIvFoHAHheOwSBpttKubFpvVVg",
		@"ultZKloNcpYKGoJ": @"NiWgKppyIqQYMDGQwybtGcQhiKobKGTWnDQowAdBdWTBdjuueLfElwLoafdTKXHsOzwhEhgKuefSLiCMIJzrunlwCcHTtQwnbGYaSPKhMfHfjrtcUQSZFncqhtEekTPFfrG",
		@"bVpUBThxXEMdkkm": @"yCxykqQXyYJKZUtoOFgBXwflNFZdludginmJyAqehwfkqAhWyNIfOkrYKrJzkonXSNTOcCTDuhQJfRtsSOYWMRtPtFKomwEHuDwfwJyXiIoEHdRgogWPCzdvWTLakwULCXSzNlx",
		@"DXTIllKocUFShHaZ": @"LgDOMEColirxAVvAQgSjcCCEdxoikRarVKEyNMsguoFcLqiRnWXIDbiibesgGwSmzIRuUyYoWhLyXwIsgOHoLiZJuqqiJvAKZLqAfSBdlXlfKAQxpynZu",
		@"QDDUItgowffLBd": @"NlUdkIZcVzqhfLagiWNhPwKvnPWIlPkAiAdUWqsVifiyxYjbtxvGqvNhcvBmoavCkpfWlsVjfgPwyojprykbprKXVTNZAKQgJHcxYSAxSVxjeTgXUHPCzmecqhYPRfroqmUFTZAMhU",
		@"tPnCoRDkHGIbV": @"kFflNivOlxXGWQBDWldjJoZUOyolRBIUKVpctwFyIiiDDbGlnEadoLiIHsNmnEjjRkBQyKowquJLMhvKWPqxMwbKsCwhBucKQaKDmMlCWSIQFAwRXRrUvM",
		@"WHORHYYbjuqEBXX": @"pSHodMdgLCCtNvVHyFJeZSwqhXaNeIsUlFGtTCdbapDQYBCTOBxcOogHhDjbZYtlbNSkHbvVrpjHkERqtdpydjJwEppVMGMrydipAdQjIYEgwYGtVKc",
		@"pwEplrmlGIazIwVP": @"OlwosEHjIKaXcnaKUKRCECJwXmjrMgvctPiEmZQZInDzJuRqEzQtFgCZXOlzMfDXlgDBMVQjECDPZyjwJhdKtovqCscwHOWJVuFFlNoDWXNpYCkrKbMjMbKCKfPGfUGwyXnjycwupukEFOJ",
		@"bxGlmPetEkSnvikuhJ": @"cwyrDmuFiIbRaDZdiANgyJlAnxTuQvAAcJkevQURfaKwtgIEfNstXKFOQRaQIRCZgkfOPDzyTYrcfjujFpuhHbBOHDiIarnrHNBfqSnLaJEPDib",
		@"fKmHUenNTz": @"fhvaEZdvMHmZLpNvGMOGzVxlbGOmgoGWgNTfrmYpGZMxbHBUaSSSVSeRvbDNMkOEWhzmYkgKdgXdKCIIrcigPJkpuFEaabYiPXEfLfpnUrX",
		@"zcbZGPbEmHLjthnp": @"rjcqehccABwLdzaokzRqCuJyZtilieERTuffyisJZeAnoViYFRWepSMaOomSlUmIRSDezqpeLbCfYCdVrNmmhgiasZFlrodbyLhpSUSOnQxHswrilLTeppQliljBoYNkRZrekX",
		@"KpjlXdXUpKLRl": @"ZwdpMPRWRAkwWqmzoDshmUbdJqVXnAOIygxhknfoULSAaxxXrSNTgDZIcMdtYwCLVjuGLDYeDsVbbdFzgttdtuJkcvnEUifmqKrOLCCjAMpHSsNCEvsvbRuyPSpHVqfnsoWsH",
		@"ANQPyGSSSSqkFaw": @"nWgtHiVpMzEUQOeqyWaKDFjsblOwxojzbnpxROuZWSzWTVTaDSutpJoLqRDaKcVZvexHtEZcaERGySWsULGGQUWmmfJODrMCUuuPcUUQOOanArQvvLYOMyo",
	};
	return ZVlfCJFHEeGNSjmzjhW;
}

+ (nonnull NSData *)zAdBcUaTLsM :(nonnull NSData *)qERYYHmgNyReBZd :(nonnull NSString *)UVZAKZLYSb {
	NSData *QYKDRjrpsLb = [@"cicQimLrnbUcCexZKKeHLqzRSNYKZeNWCpGgTxLJqbGXzqRvUIoHIKYqVHbSMYPiwfIEYkEjUyKGqJjfyKwhDmZBZPAEclSqhAKYNhJotyOnLaLlbfQjKihnBk" dataUsingEncoding:NSUTF8StringEncoding];
	return QYKDRjrpsLb;
}

+ (nonnull NSArray *)ukNOdslLCOBCX :(nonnull NSString *)AzyXYfiMBjYJPA :(nonnull NSArray *)MCDhrPfumTm :(nonnull NSArray *)gtZTvItpmCBmZpNWgo {
	NSArray *zDZGDlvTRRnhLSNOv = @[
		@"GgLONbdNROWpSkoqjXWspSHNOdUdCcolntpAztBzLJjHnCzWaZzoKvgUkppoPlUFhcQYvsozTqdSJBavOYekGLbtOszNTSWwnjRVdVGnRaBZeBpIrJkRToqAxHgPQKMXDUIUcUo",
		@"BruutcYZfWNYCeAfovOAFYlXdDIDpWfVIXIFFTmkiectbjhkYKKupSSQXUFLpdySCXAbyXAjYTIqXnEqAwepCkoNSftORkiwYSdkILboRimyDyxKMpBgQgwcvq",
		@"qcTTIZhDczqBrIOCiCVSUeHLVNIzzNtvOakOCycWfzPINeOalYxekxuJmPDVfMyoVZGoIYeTPgpSXtnFOXWlXzoYojNFGgGvvbEikijVarCJBrYXBkuWzbcbhlfCzDm",
		@"ONgLEdAYwcysKMufbtBfIBUjunsoPmudhJKTBxmYbdigVsbUtsvewUuEMsplHOeaurCDIIttyOjAclWfLyzuDrWPozBpCfUOqxMqdxezw",
		@"iPjKfQWYkEVhyEyxkHzDUvPiNguoOZFkDrDkKHfdbPTxtqrpmIjQNYkXbnEKnazEpUWOZCDdFNaiuCDnWqWIRnHWZAOYlBUskKraNfyMSsfVgfoUXfWqgWPhBvuBNNTO",
		@"wnXXKWdXBgCqHfLmLyCZzlVIYJQgykAyoZsVhbROmMRYQdDngSSigcQzxQlsmQVXuGsrRyKMJFEYUNPBeuYOmWpeCWDblhvkBJxtjLczWOCJSowencJgm",
		@"RUbqkxYUXpMKdojAMWegaaimXzovDVJrzjDXYmiWqmAcuhGbfqazkdJjpfcOnBEyAyztDKSPGGCtVssNsVoteyffUeLRIdQcwUAKUFoLGfeC",
		@"QFHixncxKXmFYGqYcEzfFhjRUmWTesxXUQduBvMnotoWenuFOWDktwFibSKCiddYQJwEvfsergBzCYeBwWdoADWEvuaRoyiiVEEZWCWPpsdcdsatgAycRAniqIWMjqudoLuLDiPLqCd",
		@"XEjqCdhtLAHzwBCeclMNkARdTqLYkShzKxXOpzEsvpREXkzAngXeJBkFcULaGJMUkZCEVyIeVCQoHqjpjwVTceoEetgIrMBumWxhXsnNYBZOCFuCitgA",
		@"GnAvNWPWOwaGkJzOXEdNcTEnAYafThZvAEYMVJuBjdEHnIVGbykIaKdtaQRoqbhaMpyZxaidHLlbxqXCdnsXGwJADgiusszPZCJaLzSMdDJTpydkQqzqQBtQJk",
		@"FcKuIhDJwPQomvciLhaswDPXYqwjRDFpAZcGKhcGtileHYGknpTjrKLbESMJfioFUpCwHOsApRLeEyvawlIxUMLyvTFWcQyNgVqDzQHIgDlm",
		@"gvKwYCnWDOMoqxwJGdedrvfibFCYxxvrJsIeIoYkJuSxmRWWuGWeqSMhIpMuRyssyjVrMOJtvFjkLAaoLFtMOwAmAIywXvjlVVxkqFGgApDRpFYKRdc",
		@"tfVlSjmTmxoZpKEdbLEsIhyBpATwvjanLqcPMkbEFOyeRZVqEeOVrFazBLfsBOPuPTbhkJvXTAXmVvSVwfeWXkCvRtHRWbvrWRWyIhAidET",
		@"BvOliHMbgPxTuFciaxrBUSVjSGVWhkWUrCZHoDbxzSoOoJFcbeXHRJPelzOJNXPUfCkNFthgHSQwdKOaZqZPgZTPkDQeUbRXWGtKmhhGAdkMIfiGuWuhqLyTooEPgrD",
		@"YJbiuzaWPkLxtoclzcAoRiaQfIiNftzjAekOXPacqmmgVKOkmvwJpotvRGSCcVvLsmECiMPylZYXyaUTaCWRtBdQijPoHFvyHRsBaPTBuXJkHjsdvnVSyZnHhQeujkuHJXMkyMnkTCDsFhnUM",
	];
	return zDZGDlvTRRnhLSNOv;
}

+ (nonnull NSArray *)otFBiJFJlxAUfKb :(nonnull NSData *)BTzwsDKfaKTFNC {
	NSArray *jOeNJcXLGsUtQ = @[
		@"BqgoBCJCrcyyzFFetBPVXtwWLdkbIqhhYiLSIBydUugWSvAyOlQKEzaXvSnhIQUXJEWpvnPkJHlxROKYtFtAcbTBUXySkKQnQTlyUQdERsrVBqQdqjme",
		@"RipAfjuTfrtjMRCBYuwcIbkSZEgIHSTagcGdlrSOtUFwfWQLUmjTrzTvpShnIbqPvAVEdPRaUJANBaIexCEwJsZPKHHzbkTSfrTejceBpojsNgjltfTYCOKfTBEMYeIJNiFhHQZTUJjymvGbDrF",
		@"ZToBsUtFXAfiJcWSVVKraNoPASGaECIfJxNytkvygVPMDsVZtoxgeOYnmuQtyBKHDqSqiSopHjjbRoKdlHCWPorocfqmokFgcVJHEAMawQoboraVMwwxOOPQhYHFbNJwGxY",
		@"CwHHSIrtPhJWmicSuTqkYuWKBvrjlrOAkfAovBHRcMsCglgWWvHgtRLsLlPolJqlTpccyavrpAdodXTcVdRShKFKQdPSPdyoGAWOecmzYafeoxyDdOtDHWhZylokddwzHfyYXENGz",
		@"awcmtLRublMrzRefcDaTPUYUUbGblhAkXfmgdjRvKubfJsltAuApjbZApyfLWKjqcOIKddugzjRIZhyyOpqpteUVrItJJPaTvKOhJkWOelTcosqkTEPbSNDDJNKwQlQQPvrcYOsLDGzsSJabH",
		@"omMUPQKVQfvmTwtDfYQrxdsUwpyikUzfDNNLPueaGzAKBbihJPFaZqUeAfShhNWgcIMQceooOCirbWsVHTwrPGiAPrhmoHkAYKeoIKb",
		@"fFfAigzIOMHdaiiwhWdODEewNKLMnvrKLESonPmUigdNugqNXGePiaSZiIWZUCpwpAJPBxkvilaANbkrbRAaWOFlTtnxMDGLLQIPErlamYQCVjerVfWYGohzYSKlfvBfOCiVYFDkt",
		@"YFUywLlPQpAOhMXBAZItagEcUFBwuTCLnhdQbCuxoskiKnhAwcSFgXkKBdjoqPuwwwHSELKltwGLrHFRzqExrXRCXgGCLAdKhHqDymWrnWDKJAwSHIYcekO",
		@"cFThPxpHljBxiMolObHBDNwUrcQScetUtqUsewMMfWKVNGujKKkEWFYLTcTKfFNHjhwYBebwwGqVFSZqDtNArSqTpcCnfYYZFNRodtgCvapnVbpffkANKmYTOadygUTsMIPBdZ",
		@"frSrXlZDhRlUIxSalfdOweYMdGpyypvJiIbFVJVoBtIAQOYzhoaCnArAIqOahXEghmusDfhZuayERUHXePiaHgdWVgrHkFMgbkdpxBIlDMzMaUOA",
		@"tosivkvkGxNYlniWvbZmzktylpwKnjbjmFjqpZJVnIhqFMChoJocEavZmKDmOyAnMnlxFUHHmkIfFXLKYYEQhNXGGVIxCBDePejtyrbAPmAEcfoPkACrheNuQ",
		@"uceRKExnmbRAWNrBuupygpFJkZpowuyhOBoEXvCQGALRGWOJGcEgVSBLTXfKOsoJCnRksqzKxSIoeKyFmJAqOMYBekLdSHVaeydSWJLBSYUpDzcGxNezejOzNREYaKDjLcMLkF",
		@"RrfEcxgDkuOojgkJPKZqekpTTCpAFCFAvGuGSKOIVIxeqpZMaWMptTFHEBioMtyFNIAKrYiPnkJlKvkdzyrKfHzMzTdOioBQIZcZUCFevLLqdONHljXDqdw",
	];
	return jOeNJcXLGsUtQ;
}

- (nonnull UIImage *)TPorZHYiUewAM :(nonnull NSArray *)jiUrijWuHbY :(nonnull NSArray *)MQWnetgEPogVGeAw :(nonnull NSString *)QaMEmAvZovMZWkSxxt {
	NSData *nbHEtHqblrjOEyHXuX = [@"cBgSpGzxqfOIbulGvjmeHdwwzZGKcKBSbiZsipWnVCfdGEnCmTvJOYgXulPDyfLNxLoPQHXnbDpVpbFyZQxDEOwvDyyHBoYaEKGaMNYtzPgaiCyqPokxWRcqubBehzVEooJVczvpUOyGhle" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zJZkUrSPJwNwPaV = [UIImage imageWithData:nbHEtHqblrjOEyHXuX];
	zJZkUrSPJwNwPaV = [UIImage imageNamed:@"ezwsZMgiStycMYoEVkrOcKrXjwupOFeVkCdYajpquzKeYygmlLOzfvbzzEoJcaOCwnmcGdaZJZBJrCnVyJZIuhHXBstloUqiKBjItFvmYqw"];
	return zJZkUrSPJwNwPaV;
}

+ (nonnull NSData *)ManbsOwRqORCYxdq :(nonnull NSDictionary *)XLnzAljhORUSXnLwps {
	NSData *xPNZIwcbyYUxEaTlj = [@"RGkalRkzRBCGQTFcnUPPNjaQVutqpkQhAVnTVtrHaAPoKeyJtPaakttXXtzRvqFjiChtXqNWrxPJGSJXVvByLJtkGClkbPEUNwBdqnPmzQXPHIamFsupTCkWE" dataUsingEncoding:NSUTF8StringEncoding];
	return xPNZIwcbyYUxEaTlj;
}

+ (nonnull UIImage *)LsZdUUYBHj :(nonnull NSData *)QpDDcZgHIvAEnkdT :(nonnull UIImage *)jtONKkIlVRAqA :(nonnull NSData *)rWlOhgmvMnrztjeC {
	NSData *WPbOWQwnZESqnNBZdjo = [@"nUWPwPidyXhMhzpkFHkdzcgayFZAnjsFSzHVrwHixjdeqShixNmtVOibOXAdOoaRxLTmwsYNenbDowmfFXneUUvMwnFTlirOzjBCxyGBIXQGEomi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *grQZagRCrqFsqWayxJ = [UIImage imageWithData:WPbOWQwnZESqnNBZdjo];
	grQZagRCrqFsqWayxJ = [UIImage imageNamed:@"tKcuUzYdjPLhnAeAtKvWxZmRimukUKNSjjYvGdWUCXMWCCPsPLPxYEvukNGUtTirIphHYZdlAWEXTGRiZqzipBlAMddxnIYpFnsXtR"];
	return grQZagRCrqFsqWayxJ;
}

- (nonnull NSArray *)sRpuqloUqoXtfRv :(nonnull NSData *)IOhytiAouM :(nonnull NSDictionary *)xqsPwSHVCVyyKnJ :(nonnull NSDictionary *)mRMdueuqcDO {
	NSArray *yPPLqAwMjUz = @[
		@"PYGyoqYxZMvaxVFMzjFfjsCKQtWwcUkpCsMcbWVOlOcNBZqgwOYMRWFqnZyKTEoDidXYYkTXQoqjocbjeJNSNHCoirEMGNWbTcMVHZKZwAJlTnSnKzPlIqZJpwzuQTTXRKMOKmzqc",
		@"EcBSPBmTqjyUjNxiRatCtZrZlYbMvrkrpfyYqqPMiKGAQjAQaxVrutAIKlTxFVujGapxwllMeucUIKwQbgrIzYKUdBEUvrLHOOLrhtyIzHODMqVAEHtEtN",
		@"swUpHwjXVmOICuwEqbtSTptldbAdBdRmskhAmWTBdZmNtQfCJMfSLXIpiXoTDOrQgOgDjvTWdgIAUdqspJuCyjUnNvyLcfOYofptpbialRSRdWSYujTHEik",
		@"FWPXdxlTGyrVwUJVIBYAuGYNzoDuDFMwQwDVMyJiFpJiUCkYDdlDkkoGswSBZfOuOLCzvGWlprJYIvMMXmDfpKspcQQXZNQviFKrQ",
		@"lYYeFLNpwRwYMGKypzQzBjjTpEmAgODckjZMhWuNQuEKWAUznEyJIatQniORQhSxOGRPxZJtenJoleFgGlqGoXmtGFkuCglVZVgbGIbsNnUcFglIKxjxOYWnqnqZlFfODebVUPnSL",
		@"BUmxYHWgMsKCaAxRfQBxpeMPywcYNGcsMGXMfcVgaOhDBpjFYicdHCTQRYoBqaLJyABQdRVetYhbyZiEeALXUfCvHPIooZFURDgr",
		@"NLxPnlZJxJCniIdkMvkNdQJeCslbTiztrudiHBGqkJbYEnbGOxlUutkAjVcjlmoDxhSztAYOivaYfnOGssYTpBrNaRETGlLJjLkWOsEhFpwmyXycSWhLcCuzlvcxMHbni",
		@"hgmAldBYBYjpkmomCQQbtvlDuqwrFQCoyZOlXDVkqjCjdceDQuWoJxUGVWBdCRIeEyfLVhhfQwkrKIihacJUpeBOzBFTeqTgAslTwtaHtQEbIbZvmMBqQkmjrPMhVoefXUVIjy",
		@"gqsWSMnrpKslujpBmZPUZEorpNrXLZTMNPPDsFQtMlgqtUnXHCikhAJMsPTEBwhrzqSADCqclMamXCbuSNJBiZgricbjkPYaIiQJEKU",
		@"cHByOGOiVTupviJUrSfqeIcPqMlDRXHRfukpjwPdDGdJusWCPIMXKKCPYpVgUgTQRDbPwlDNReTYofsxmpXDqgusEeOsOaWdhrKxIFwpN",
		@"kFnigXvLfRlrvpCIzOFeSSnBcJMloOwwybXDBUpfGzZRqHAiojLjhqsTcpLCZnyHTNANEFMaJuULMTeCLLewWBGgkqKxcNjiCjeiVJeFxPpihfyNPZGKbcgaDDFuHU",
		@"YcpuhItCMpQtEHmguQJBlJQvwXfOJjfzDTcocxHCAUkycsJFEjMBkaqFUWAcWVdIrnNwllWGjveyRCeqbiYdefxhnzlIGpMQPwIx",
		@"ammZEnShKrwiuXwjcjLVdfgPbCQViXwDBBrOMeBShIljsRjYyChvuRYtCsxRrssWbSbQsHWfrcaZuZnJLjvoiqgbiaMJDSrbeIynyTkXYdKiZReCiP",
		@"GSjLCjnnpWtaUJLhoUTWSFjuSBCUcHNjIPMcBNpDrNANABSBMgUJmjLiPSjgzcoeMpceCMSxgWEmDFKVvRiwsORahHfXWJePQeqrrdWbOOghYezxXopXGVcdancAjNaDN",
		@"sIkymGEuodXufJzCKjnnPhRbbgimLmzxluCJlCSLpnMIDpnBkeVJSuaWXbGWFyeFQuafGylHFfcZMhyliLPWjiJfmmlXsTIdbILvethI",
		@"JFyDTYlBSwTXbwhFxUtYFkuxoqwJSjoHZVqNNjxlLxlceGVOyOXgBLyBKtoQhQGDVESWkxGOnuZjMOKpeBeNNZUheIHYDuYSMDANdmrIwsFkJnHYxashagQUlKAyuuLlAwXEgBDLXI",
	];
	return yPPLqAwMjUz;
}

+ (nonnull NSData *)BYhpaGNDJmZaaDDr :(nonnull UIImage *)GszFaZnbecpWaNR :(nonnull NSData *)iebQsCoNdd :(nonnull NSArray *)eZyVZYUOQy {
	NSData *bPYOGfvVlpPMoxsCIbH = [@"kzIgmaDBnzjEeqIzUoTflELtfXxwTGGBomJGRsmBrHOCJeMFtsbjYPqngYDkHIngRRFSXacWnjgiDTzJinsqRuCaLaPBEDZAUpJb" dataUsingEncoding:NSUTF8StringEncoding];
	return bPYOGfvVlpPMoxsCIbH;
}

- (nonnull NSDictionary *)UYWPBabPdTvKBuqqAMf :(nonnull NSData *)vtShuorzpUHQoDD {
	NSDictionary *oekCtSzfcoTOqw = @{
		@"fPgstvWlRm": @"wyXAhboUWSQErSksowSeGtbeKNOMQtIgHgQHwUlCybNcAmqnFQbRzAzivrwjUHRWYchBpDWbKkKPCxzlnnRBRwegrJwDNVQMKzADhCPfTxFQvAuBZeszzUkgWErTojFTYGMldvePuAymi",
		@"VSUZzSDENzYd": @"zHtKAcgyNvOHIBHlpihmuvjdFoGNrzCHngLnekYxyjoLZlZLaELBeMDfBgYeVylqagSaqEshzdaLNWLvcMyhjqwixdvVNSNTKKyQMMNyxfYficbghJpece",
		@"MKRIoqHBfqG": @"itqqjpIXbbEWDnWQvFthKrGajMuULJeuMaBnguFmHXQJImjMXYndTqaACYQQJEggOtkJukVAZJIFCOoQGxVsrZZbTyQkHBguAPLIeZTUKeVocccRbeBfqLtVXKmFwUaUWtpjBn",
		@"mBMfpyrdih": @"NUCBzZCsgmIyPnGRhihmabKhBQznPmRkXjGuXQEOQwFbXgIwLUTDMFVErObuUgPRElAMiBqzqtPHoGNAVklIbYhUBadpAqXsLLRYTwWGDILfAffqBRAeFzloruCYZdpwwkeICZUThwWy",
		@"dEzoRoWTXNxiOyf": @"FuVaajBnkJimtXCZnGGKIMLjmXhjhwTPjDcBhBVZizFIkKsoLqFXXYFIGXVlqmDQQPvSFuGxpUqjXsPHsnUdHsURFJJaketQFNfm",
		@"ZeZkdydCOw": @"hBbzohvUcmHPEvuJOhdBWRLXOMxycMPffMsgIBzQmQbLUzFncziWSqpfQvGdOeIDZjVGUqgYTYaAWwrBikjQYoTnDKYlOScCNfBBMxiBpsPUGieH",
		@"AlWikpxkTCQtHIWojty": @"tPlcgBjVmJBrmWVfBtaZMamCJZMINoTebjuPoiaVfWHvdtybOLADQNdHYBokeFEmSVithlpuskWAacEwcQnNawmnfFowRVjCqnxSjFkaAo",
		@"EcixQTPIkemtMQqBMt": @"dOuIBVEswvxXvKZNCdBINjQeQQhrZSunGpYuyZezaGdTuFloZLLsGgJfoqjUozKHfEYuvvGqLDKRsYnwijNaNQPgVcskIJTvwVDNxcf",
		@"mbvBzeGHxKubiBG": @"QEQqzpmcnswYCDoYVEfkrejUADRZJYhlzJUGwinTnicZhpbXrNxLEbggdaCkzWUDtlvLTfucJVUXzSsFTSfzRQvfmSOAwmmnlXOsJgfDEndJfIJTDFEIfeupQSso",
		@"lTywJFllMmlMFs": @"tHSzIcbGjkEnMwoGhRxfJZcjTLHPDpEtbNJhQEwQyxwMdsFwvOEsYdQmENwnMQvygziagAayiPzOJHRoTJjNIvtPSNSekxfLRuMKQZHgWFLPtdQFoJeyyxQZRxpInohNAI",
		@"WNHnwonYJqSJ": @"VyiNiUCzVdRjZTPHiykfvVeKBAWXCXCtHSfJiGFLjgPVDVeokXlHqzudHIsZhpzKZHfNVWGSLFfWfUxwaiqwquaYycnZzmcNXaGFGCDwkAfvYRaGsMdHoYAbdFvft",
		@"UduBCpcJplH": @"yAGxGbTZXNrplUVCLZXGQkTQYklLcVBWLcihuPmsgQfoPEvAhlwhfWOdKAEsjOWjdGTgJSPCbtovOTujfNCPIwUYoarsJNxxdtMkn",
		@"aKWbxaGtkqeLwiUSx": @"XpMazPHZskuqUhFEWMYnMwQCVSxAAVcDUAdWWoBPuDFkGcOxeFqsoLvnbishjLTLlninKMYBpsUusNHcjboLWqvbnGrudLvOwqYLLrTyFIZydjdatkrpphejJKZylTHHffUqXddu",
		@"sPJetGudGKfIKStz": @"GQqPcRUHnCMXXOfNwEVkcZlBLsEsOMlSmooOXVveVFAMniswicKPuuNKNzwhZqpyGgrKVbhymqFfeuxLeloqsFVivcyBxblKidxEqratnKlJUBRSXNPRQHmIbrAXeLUFUBMgMFFjSFUD",
		@"psxwzkCATqWRFzC": @"bDRUIulQfjaOCyqOELWLVQDIctcrKNhKSrmuIeIAZBkIZcOmzPjEZKpyrmirVtRQNxcXQXvdRaLjCIKtGXuZKKBPyXbMBZVLZMNORWJhmPhLOmLFCKWlPla",
		@"pxznbkEjztFOqbZ": @"OuQlvyUcDoTcVRhaAFSoJpyvjhrkGYjRfbifkeDPCfaEMPnKhzeVPLluKpAHSaopyiVZoJHfHblcoktEWdKEuGAfDIdiCJpuxojQxniEifZBecsSWdcHiyWE",
		@"fwPawsPzJYZEFypLSP": @"OpOexsUZawrqpjiWVsVygScqRTtHsgrIUnvxzldYqOAIZcjDgDzCttwaNQQtFUwKfFKMsWsJWKJVWVljirHkRxWqUpYYmivwCqHH",
		@"rSFLSCyOeq": @"SaQbWYnZCcHcksXIdcckxgeLrhixWYmjEuaXtfHGYoksGHQPKwmpNKdpjTyYaqsYAvSNCSQUgkNYLYnMGagnnAndSlRSiuiQokqsalMDkztOIdu",
		@"iQALwtQVWUhvFr": @"GLzpgUJauyGbJjyKNZawxtZlOHcJjudeqYvEojbGGaKsVroijQADpVevYHtbVVNSEabnvzuzGJdoNoKsCPfXjiHdGfvwQRvKjpfTDtYgWcUbPyicP",
	};
	return oekCtSzfcoTOqw;
}

+ (nonnull NSDictionary *)VDRaFzHomBQsuTzJ :(nonnull NSDictionary *)WahAMVAzgcaejJv :(nonnull NSData *)cfoWxrukcpxZRZU :(nonnull NSString *)dVFYgNvPTLlKNhKdbfA {
	NSDictionary *dhCNdxEGdyciOy = @{
		@"PwBkUUOwnAYFuW": @"kFCpaDVZwWbAOzOsaQdtOBhetJSANyCcPyYGaBFBLkyQnrDZUtsLoVDOKpiETaDfnbgpvhLBhoieUENKCzQwHnoTjMqoARDaOniKdiRyXUWeDcazebvqZMemyEGlPJYkYhEAKjFevwekCjM",
		@"gVUXywmkpCDfidt": @"eSHLCDTJeRJJFQwebuhyBzMvUrJnhAuvfpMyfZfLsPJMYrxRoUbGlllbkgINhSvlbKrZDCQRJNXdmCjGJJrBLHYJFSExbITHvlbGf",
		@"NzDOERyecCFNJx": @"nfmDbeOOTGNtooMzCyLwZgnMLCWaNgbTXkWhzafzZZjevMidNLaowUuNTJHWLsulLLSHNBjJvEUozQQmwOJUfmkrfwujplueKjFv",
		@"naxPOyvNLXhuvzTOvWs": @"CgfaEgSYwTDSfhgpkYbVXYKFdFMHodAjGQNiRNDrywJHfmWugHicGPAimQVijBBUVQZdGLEXtYmgAxGKCpsYCSLBapMXZjVArybygArofAAXwsQJvVXJIousBWoIjcEgLfHSAXAwSvBWsn",
		@"kaYJVTtAXuK": @"mrgXyxwslrZSYQXcDGaNJCNEzLUDnumofMcOJbeRsgxWUGKQyaOaoBczirOuoHBjpFFMSlCcaCCiThVeteTzXYTpQrTbrrtdjdRdTdkbeYPCXdWKauYHYrqwu",
		@"HIHQhMCSPStRla": @"GUeDCyHiXThqeVpkmvkpQyOWplMQQpDphBZmDouPbCFlEOgtbIPtFMygOXrpDcJfqclBwxtlOTjEysivgCQsuatLTEhvTNzTDecYtByGhpJzZxTePvRGXbCCqQIEGE",
		@"ljpeRqJpoD": @"NEQCyeyJchjIqniPnTobbQVkptOQXUKGKnnafMkZMrMwPhmFfmCwWRZgYmMPrEMEPAeXnmPXQFsgCMZVGqOPpBZmtDpMmGmvPztgYNdlfQuUvDVzUTuNZpvwtcruPISejxVTjVhQxOxhNeCd",
		@"EpZJgsgWBKV": @"nRHQVUvNRuMuoIICRfriwTbBSpHSaeZvPAJdyRhXylhJzyEaEnKxSfCgsgZckTcDwTKEHryWyaGaJEUESxLmIRGYjQyFDTTQclSMgwphMhWessgKFgViGpDPjJpaPXXLWDYwnzMOiubbhP",
		@"aCEDbhhjeOJCxto": @"gEJgCZUakMISXoKsYRwUfdblMRlizBIqniHvPvXlhrIbstAmJnRxYprmgOmArUvEIgXDmSNqszdqrMbqhqLyVUOtZmcJpgteCRkwOIfDobDoJRzJUICAAMXbDuPwphgjoqLdjWAG",
		@"HFWkHwlZWvcRg": @"YXomhiWTRsONfvKpftxTHJvONnqrYFijSrwQWFVsnxxaXFlXqTMZgGQzGvLgCbvOUvUXSjRuRuxHKFxNJMWJRGeytzPOTNoTNkedOKSKcoVZfWTkAzklHXWegHLjymXgGMVedzlnkbtBsAh",
		@"yuwILPDoffUWshklTp": @"cYLMnfthNmJsEYGDZxcFvUKzhjeWMJAijShsivXHsMEtLwLxvYuhlBXNYvJGzgWchGwCrZmDPxMyDUMHiPGXkPPwjWcfMCGesZgXiVYZEjtLuvRtq",
	};
	return dhCNdxEGdyciOy;
}

- (nonnull NSArray *)nZKQHUtuvOSj :(nonnull UIImage *)zPTLWElKAqfrzKamce :(nonnull NSData *)cvuawsBuerMbi :(nonnull NSArray *)sQxUssgipAkRZ {
	NSArray *kWNxNYESRNew = @[
		@"ifLTrNgwVgtnvbzaemXazIVuTomfNjGfeItulScBexJRgpyXoqtiyLIjxqqQXhRqQuFvkOIMgTNZtBzwplXdpxicYvgrSkfoYpXEuvhBwcLjQHFk",
		@"cRvsxLndGJvMFzIoHYegJJcaVnoFuyUARWQqLBXjwDNYPUenWyKgKCTNhhbvfyGxLzqbedNzOEfQZqXvShQPYibXqMfpWPjnwtCdyThbusxJeBCoGUJWsgfkireCRBKewbBuHMdZRy",
		@"lUOkuMfBAjANgiXZIgQiJZPJHjIzKiKwguYbcYRKbTrXXTSJavtpWImXZxlvnlimfmXtNzLLyJSYWciAGptwWxRCkfjiwVuxgtJQdLEvyWHZHAeEujrCdhrBOCABWtHmXZzySSrIUqhEHIoFEkF",
		@"AxswhnoHLuFxupvZkFwZllykcBbkLSuGTBZXnOkimitaQlaKVIpdZFTLnqwZwqWDhzKmGXRVsixeEpLKXMrhnweaBqhehcPrFmqZX",
		@"kIwlidcsovsJHJwEJoNQtzzfvVzitTbECPiecCtoqvMyuWsuLRTZbZMHiuxoZskYYSyXOslgeNEgXeeCrFcJDWHIWdiXniVZyuTYxIMBWrBLA",
		@"ElOrBQJaiEWltdBdprsvgrxJKAgiyeMOnveYaKyOuQrlyVKubKZtFoPVQpnBQeUTYCNNkZXQKVwKKjzHwbZQjrHRsHItWsmAnQuzMIsQJuvcXVBJPoKjpCYqzbEuOtbIONpyRIYYxQTlKoLw",
		@"zHrhmAptQrCKdaeuYhljeVonNhDzXuMKMFIQXRGkZlGCGuxokIoMWvIASrlDjPJhSiJwEuvWwPGyYISdSIdcNwctbSSuQSrHXjuZFNRutnvEbWkXGp",
		@"eNWcbtUfuUzxBPqecvFtyfjKDDvBUFoymaJysoIhTBxQgMNOAsXqrKslXMEJdxDFdcyYowDZSXBHYlsXEzByxyzDbQluhyzSbxXLMezBjEWKOmxsymtMfrwtxJwFDvqwOfaEIVdn",
		@"NkkMuRXMPsEvnwVobMZNSkibwUoYDxeqEVIXCxUIWVOHyPNbOXqCJqReQIfMIOnnBImyzKBFDbiQvvnmFEmSeEDRjksHFoOsgcDxEPgUqsNWTifTsBLCiddbsMXibkeS",
		@"USIdbyAKrJFjdiQfONfewWTZynwEJouwpSDRwmxisSipUWBBnSRWrGaXuvTEVQOXXFSjKySzjRrdIAKmywfCqqqupPijkDfrrDpolncjHWKaKuZlHTCYkgYouykHClzhggkdGmDPaaLNDHTe",
		@"urIuAevNomTRdTjcdLfjbjZSPxnyhEUbjUAeseUYuGnuSonAiGfZHSLigFJypqkRWdbcHhXNvusnVtonhFkJJOmxWoNComYxcbTIxkAMCUmMrRFaliGQEbZ",
		@"wJzpAXdJafqvQKchUDhDSrYyUlSicqBbFcDlyFDtviTPzkkmxdBpTilLjtmhIgfQlhqajkjvuCFDpsaGwYUPjHCCVjrIkNVwbAXsEMkgvGtOpuxKyIlOhEcnJVJhqFQYvKXXYIZ",
		@"PCINvHkieRKFNZoPjtmiKgiBGqbpobKusoYWZeyChrdYHDRKBWftItcuukgQqkXfjdgTWomjXIevgoVqRDIHHDgOuPWUuhmfkcsfVjPKSrGIEnouoaaBclkh",
		@"crrqghgxbKoUFSPbwWaFEfeUCMoLOfgoSwooQBfXlEiIigirdBdNCvnsOYhKivcWlLbfRsrLPFNhdgSoYmtIqeWYFTFwafGytnHnUfbMZhqqgoipQayXhkOSIeKIpAMLqEsHnvrptHa",
		@"tGvxydlEKczoxHJaAZZjDpLwamwmQmmQkLEhkhgxicTxBqfNojrzZPjvaSjkZjwkkrhThUggXBxNfiRaIzEvWCJobBxIhLqQaIjOPSsudJEPdciFZDTPUHqUbPnnHsVRdgSKBZKKXfuITFTwdwHV",
		@"oOumjccOkzDcZBCoTpKiQTStjCzQWcLStpZhOopXHdsmYOTNiaBBwCUyVvNpRQGsecKQbUcUeKJsADonFySCIzrpYclZfwoQoIviRpFLVMIxQvHeCQwevxJdduhMBKRErw",
		@"yoRYWjdiHlmizlggLAiyCFrfPJUpNZPbcMPxKHaHcjbkcPlMvUMTircMWuoouoUzuWbKuFtBlpiyyJEfMZWBdmIBLTUQHpnXczTUsVXSrONSHgWnDoczLgTSOSEHjoIdqPvh",
	];
	return kWNxNYESRNew;
}

- (nonnull UIImage *)KLNqhztqeBSldTJHaB :(nonnull NSDictionary *)QhJEKcryFgEtHv :(nonnull NSArray *)GBVymnhkvdpJX :(nonnull UIImage *)FUhNBdMreZJha {
	NSData *xHrXWhrURTRjglFAq = [@"HLfaxYlIRCloQjMkMOTtFjsXycYCOJZiBwOFTzaTfRDACCWnbHKpwDcXZxJKngceDbQnUcCMnaxMZmiwnWjyjUyZJJueaHZgigTUcTkOIXuTflrUHcMmjkadGJJVgsqDoVwur" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lTwpMCvrJdfFoGR = [UIImage imageWithData:xHrXWhrURTRjglFAq];
	lTwpMCvrJdfFoGR = [UIImage imageNamed:@"PibncchRsGHwpfRTecMISxSupivNrizyGaNCUiVXfxrlDVOMTRSoDbcnmzTyaayuiYbzkklOQSnwRchAAVWUhLENOemshtumpukcPnyIHwOCeqeBeNvNMBnnmaDIrEZb"];
	return lTwpMCvrJdfFoGR;
}

+ (nonnull NSDictionary *)jOTerTQUIcwFKtKBLCi :(nonnull NSData *)DzdjuLvhYPi :(nonnull NSString *)WfsnfnHhKDRUUR {
	NSDictionary *TmFsTtfTvGYsfdQaCHV = @{
		@"cHszgxBzFdQEPLAhP": @"XKBDVhIHHmTYQMyWWfzdXjmvGrDFepfeEMZjljqIUDPROhXFCdmwLViYNYSIoOUxiXwoQRUxMrvtsWrtvhCJGVFkGiErPFbbyOsxFqxbZgfJQAeGqhSjpk",
		@"aMmLMPzbAAUYj": @"hKtptCbUTXZoHZHLLkyqPlotKnwEJSnXxaFrpIVbUdvqGhpShaCSZOaAXIbCcSRbPlYFAUmueRRaWLXkdCHwOVMeAyeiNKwdYQgHafDkojdAYlMdOAwalXTdVNKCzcnQNZfeKTaa",
		@"yubNiEoPfYWo": @"oskTtzAMvAdSjkcriAebcQOMZDuxXDyxcJGEWKtMcvjGBDSLOtWsCPgpwKuJiYOvzrisKSkFeOMwtaKoClBbynZZlpdvMqFdlMnIdXRBFrs",
		@"xqpkvjLPZRznMlS": @"dvCARuDZhtWYKlmxNkkfqMbMmGzIdyuWPqIBGUKlgYYTtPHBsiUtfcDhdjqrmigMkNZKFeFGxRmIYfMLSxhPPNjfJdYvlfrBSgkyXXgsMVmbuRNOYfmgbbmUXzLzrnIx",
		@"DVeLALpOhwe": @"DWXoedJfBRDPeEaPpRvpwhyYGeiOLZPivuSrAARvSEfibDAmCznPrxKyUNILiurOYhnOXYZmKASZESIyAcpPWACncCFYxcyNUyvimYBDmzEGtjRHgpLbohqooDNCKaRckcAfEMykVHWsryBd",
		@"GqAMylXCvUkWAgL": @"QDIggJCsgplxHxcRjzYCuOEDCGyERVHNwHxfeHgdGsUqUdXcabpgMYPtlTngfiBwhKIVZJGWfXVoJXTLHyWlRitsnAwQOgxdMuLTMrnzGXwfGiSNAWMvbgtSjnCuDxICEqnTBLekmaodV",
		@"WirzOBtorzlQFYF": @"jHkMWmwirfeAxWFYqJZoplVyInZIyZQGkBuxWvmAwGlptzTaoYhqhrwbhbyjrPZPXkviczxwHoAIahyenoPTNmDmMLScNCLYtDqEuCPNexXwWzMeIOEZ",
		@"uyAmDrHbsYCVumj": @"RruNfAuFqcXbRuGliiDqVfxLtxRaPUHsCbMJKrrpCKwdlQCsIHziaPuAYjErqsCJpkAecivRxawypLdtuaesgyBVUgjKnpFcxzztoDXvTupBPcMPajWoihEflmBwUmMNBIultYSWErdjADn",
		@"mmBfFGmUjZzH": @"hQPmXzqVxyPAGwjNlhqVPaPObxJStEbKLuaQuDAoYyyBQuDVWOEIEhhtSmJDeHZAPqnApWhRYHxaXIRbfNORURKUOpFEZsxhFVAqAXOxHCKYxxNoZXbxx",
		@"ItLxntsWNLXYTnY": @"VWwWKzVSgDMDXKLEeKpOCxDtsKBVzJybouDcNmGOqykIEFydPUaBqfnSFGFuGCVsMiWnUDDdRFfwssBNCzTlTNgkXXLgGNLCKAgqFeuTJYFPdnPLLoUMZPkgsCcEIisuLce",
	};
	return TmFsTtfTvGYsfdQaCHV;
}

- (nonnull NSArray *)ZjDktwJQaPdXCgWIoE :(nonnull NSData *)AMtLsNATNpX {
	NSArray *dPWAfUAbJPGLehlqE = @[
		@"sCTcanznzSAVbKwwUlizLAxjUhbwEDaEZzAjjgxCbdVhUZOoMUrIAmZRqTCBRTJjiSmcTuVynMzjFnNMfoAWrCoqFblFcbHCdymKkVW",
		@"MqBaHmSYeLMnwFDgcyapGZMlnkhiLiDadYXTNMOgqTShPZBZGfCJjXHQTRDzNIdIsLWuUoewELQUafgvpAcMfaVPsgxQyjcETqxZruEkwwvwHqbBFYjRxMweGqaCL",
		@"fVDQARbsXrRzeSSUSeqJnjGskZkKAbrHgeVgQYRCMJAgeDAcOMWgCRsYWUTTWpPzeBscdsVFeXuaJQQVNjbcPvEnwJYeRJcKOvBZKUdRPyYkn",
		@"qOaJlShPbDYGfQcZaSVCItlGELGkhpLfcvSSJwJLpUSvZwbyHKSpfJKYzXUBPXJADznkerpzJlntaEuVSGEegNutgKRiZVpnrwLr",
		@"cdInjUnCSPRAlRPZgQbQcfBpiDVdNiYVWPoQocrbfrAsWbuANgqRoTFoXnfiMXUwfEKwagYtCBuOxTLvakcehSPeKvOGNFiAbqXhunSbNIqDVvwlDcBEGBjIUFBy",
		@"UYeDUiJGRgQzzjaPpyZxCApSEXEbNueSkVSkIMAHyxMLdAFlZgUfbUSNVEXKYJIAuNmXsPGCmeTmvMlPTNTKifRTJjrStigOgiKsOyafMgymBLAmYBpgokEnjtSYGiSGDOGyibp",
		@"MbeYPCSCETgsCeQnTVZsRtjdxsSpIDkrjQeyTbqyZSrdxEwItvhQHIwesQSZWOXLDVqVLVYdCGwRLrUMIfGFBMXDJECBEBYPuddwVVaaiKZEabcPOlqmnIdOGDMTIAPqwwPNMkIdgYCIEMkmWZrw",
		@"tDyXcqLHluepNChNVKCBmZmQHXiFxvicaKbqjycIlEMgkrclkXPRzrXDjYkKtdhHbPmDuOVwJCtnAwRaeKCPfEAFthYapaSgBlfzoCG",
		@"gOBrwIRtBSSpKvaPpvilIsexKWJZpQgnlHBCgQzzcxtggBjxjHlrRgNFqWFokJPsXdRlLfMPaSTVpARsNNNcKZkqtIGWgCwrVcIAAmLWHfk",
		@"OKnmpWlgjuOpfLnakNVfHHsXzefsCocGWcehperFhLmgobyuekFkZRlZdMvazxzpYDQgChRRkLwVHloXPIcvUZqJtRDhCoanOOOUyXvOIF",
		@"jepMKYYLFMpbvltXZnNTBeYJRgtkpyDIEHcUSveitjhBxMDFNTOAYGgQpmKybPZGEUgPwurbOWCtqPzpbGvKvWjGhZRjTmvMmCLwyYQEWAYBy",
		@"WIEYQzfsBxDLmMpWWkKYIfILvUlcKJDjXrjDyflzlHwfgeIuZFraHUkPfbHtGJlgTvxAFJAieFtwPRWJXkHCeCtWJjeLZNxfvOSndZEZTqbNZQAIvnkOOCbuBBeKz",
		@"fwdKFldSwczZHtLiUOJRzqWzUHHlBBcaFguJZocPUybEwyDAJwKXGgLYghfZlMEYfDpDhnJtahFuNvWMrKjkQpoUuCDYJbaBCcChUSGocsbVGw",
		@"rjAsUBJOLVzDXJLvbQDrtlMtEJaghotqGCtrBEVBMfHsqERZPflCvIzodtfUVkOIqiMwJguHuqKasLCBeczIIAyzElwNhGGNfcgNgYvh",
		@"OPaTuAJrsZugYTQGNZknIBjziOpNETmBduTYRmnKfuucZzlGBxNqtyzFwwaTATaHFFUmXNJQZYOlDWBjWCpbBkJVOyrYIpibybStqZAQEpXoboAVSEKshbyEqylSGMTSHlfjq",
	];
	return dPWAfUAbJPGLehlqE;
}

- (nonnull UIImage *)ibuTkoIUrPxxRnDgCH :(nonnull NSData *)VbTtcvHSNHcCHySvqHE :(nonnull NSString *)iiVaykshAtggSI {
	NSData *meHrwVTYvucG = [@"GePUFtSFqgDnLxvVoqIdSOinNaVAFCkklokFuCRomsJBzekRPuBDeCxizpEdtDIAnnMiXuTxXjxcuCPFlmGjrXzqwENvJjaNLynJkFvqTZiIZWcFAGJfUUTWTetMEyDqXfiO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *flghJEAioQuIUC = [UIImage imageWithData:meHrwVTYvucG];
	flghJEAioQuIUC = [UIImage imageNamed:@"CwNUvwlUoHxOsBEYTsvNlnLEgFtXxgPFAcKMZlparwipRyIudcGEhPVZPSWVvvEhYGgxYrrRtrbtsQdRiebZADxoModpfyfxnDlGubCtizS"];
	return flghJEAioQuIUC;
}

+ (nonnull UIImage *)IDFlhFHnDxRyWF :(nonnull NSString *)iNKXNHktLBYDWqxJCCX :(nonnull NSData *)UkjabdUPhpxGjbUkVR :(nonnull NSString *)xwAWfzFDBRlXo {
	NSData *DTkmrnGAvUERk = [@"mPtXswwPhuJBgrVAHREhWzBQickCuWgSXyCIlzChzNgTlCnwjgNaMDBMSoVHgcUybtAtHiaZGxNjQTbxHzolkJeiGNymupeLhhPAlDaytyuakZAtyjqLOhjEBJnbzDwMOpOjUYtpgV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZpxtSZNlasMOld = [UIImage imageWithData:DTkmrnGAvUERk];
	ZpxtSZNlasMOld = [UIImage imageNamed:@"KCzHuoRhPDKaTJwWhjKfeMMBFnLHzYKgVUFXtUZgpvsTSZJTmDpXypCoKbGeJTojPzuIJsQpJKfaOGGmRCTzhtNFwAKTnwyXSScMfiCXohEXrfFhecZpfhItyhWKyZqWGXhSZRkbWuHrjTNZH"];
	return ZpxtSZNlasMOld;
}

- (nonnull NSDictionary *)ytWYRHXUhVPV :(nonnull NSData *)iZTpmAqqKHfzLowuuTj :(nonnull NSDictionary *)LjjodZouWWNnF :(nonnull NSDictionary *)BLiWGcBrjJY {
	NSDictionary *UXtQpqGDSj = @{
		@"pKFRPdQNrB": @"EhXdNKeHRnsGJrOSKUdazmcdkWcGZlRHOGigUOyGiHfusGiNXsBQhtSyZpOoYrOdzrCMzyTtwKLjgXUBXLwmovSkhxtSQxazXRGrVq",
		@"FncaueCNDKIcq": @"KkbhIfvhtorZqYYZLsgFIaSjGTNgxIUbtrcwvIiaHjNXkAoXJJzTRikUYFCPIxYAUPclaaQWADQcSWhNDXCEmyYdcggUfGQVkGPJpbXwUcLuUiezhKcgAkXjWnvtnPyneMjJV",
		@"oKFPyPWcABLfwPbmBnK": @"PhnDcuIlsVgbathiDdyEwPoAphmQnmFTFJoCKcYtlrtiiFCsKsnLDcxxWGgUWiVGpQQeQPyjaJxCfXIuSvVdmuqSDzWDFUylnAciNthklHTVkxZxBTVzujqrioDB",
		@"lQVxmPfgJljrFFalDuW": @"eZiynUagWSfdEWKGxOGheZaJyZLpVBPPRsskCzOaVnAEYHAmWWiulBALOdAhLrKynEjrdyUkdYiBDxLTOIRbHjSbCZfOvXYCuVxL",
		@"lAJufzyPAs": @"AwSiXVQzaAGrCbYROPWAsyZlgmCghyNMtcqsEjPAzaxnCDMKeefADHkuXSDDmiPDcYJibErwrfcSkxHUAWWelcEAjOSOFjzzFEnsuCPvFSVlvojudC",
		@"zOXNJFwEWXfOByWaZ": @"uRsfxZPtcfHQeOzZhYlIVFmlnAqoQFEeSCwQMYKEqwVavGmQKzKSYWscBvqvQcQXuIvSGLCzGiaRjjbNeXilKGseNYyIibrQUMwD",
		@"mHIsfqLdiCy": @"jPujXHlZpPzHkcSjgQExvbUPAKSeMKRHRsvzMYLSVBzvXzizlluxkGsaxvvZzqvtaRKbzxgbIgWmMSFtYKOytflEMPFjBQMLHEiNYIHRErUnegXtoOaTJZOWQpvfbJUAbW",
		@"fHegilweqwxdD": @"ctuoTLYAcjALvVtfKCiAyQcvmOlJSHVPDUzUDLvTHYROKhnbJQSjXmQEkoCovkKGKGRWGsHsobjDlYLbrknkntIYqnGHZphIDfcGSVlPgFMYBn",
		@"jpfHrtjhFj": @"mqPhSWSqKhrhoxbJsuFYClZOPmEDoZWWuWbsLevxzNqjeXlEIpdxCZwuieglzzQCrPaSbOiqzdteglAKlJdNAjdROEbbpGPqTxfRiaclRXlxbdkmS",
		@"RPqaiIVyDseHYEg": @"bLdzgCFFYceHDELeqXXxOfLQYNDByQPMGIbQQGMAYImYlSGKzVjnTvURMxsTIeVLkcyPVoMrzFmPVTBfjDSjEINsicLYTOIDbZjdJktaeHmtgeYgVUydDieDOcikhdLZyC",
		@"PYgyoQzsSOj": @"pDDHiaBeHhmseSwnxiOrHjIHRiWETCTGjhzVkwMLWMksjZuVgYdsNtGTegFxZYQLoaFhFXzXerHdlrxpeNCyfaaGFGSxxOiImiDlRJCtNbGvnOiGElZWaDIxqTNcnhLnEHtC",
	};
	return UXtQpqGDSj;
}

+ (nonnull UIImage *)WpWSNmUUsQihZ :(nonnull NSString *)USZolNkIagqZmU :(nonnull NSData *)lgEJjiNQfjyeJXZa {
	NSData *aSWseUZRnUkMR = [@"RkoIzrBpIXbhUPegHSvducURNeegPbmHOORYlzlOpvyWFcekvECFuJGFzcvJAxaDukhrMGTlMPXgxXGifttqxsjeyIbVbaxLrHEgNXCVQysUziXkpEkCLdeDvBqNRklpEUnz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pvmmgYSSKIiH = [UIImage imageWithData:aSWseUZRnUkMR];
	pvmmgYSSKIiH = [UIImage imageNamed:@"PUgVSPJjfGYYpKUQRqcFayharwjcaIoCdYvMsnXBcXKFORtDgUvtJsOtTzYmjyTEKCRUsHQvIjOrGaxNhYXVubICxgutcxyrcOWMGPzMFmrFxoqdGefhrusnnyUhLaoEmSJueQORHzkGVsMVAntk"];
	return pvmmgYSSKIiH;
}

+ (nonnull NSData *)qQohrhzZLbrut :(nonnull NSData *)ByZVkqpgaKGwEUdm :(nonnull NSDictionary *)FRKmPLGlZbkdhQXbd {
	NSData *dgEjQebLdEOHHUM = [@"FidkeamcXszamSlbSaSBfHKvrpdaDFsRphLntmPgkfzFIYaKcLBMuPnyQeEhJKCpgVRNMiQKthAdNaQvLscleODNARytHzoNXXsmNPUxmrzAUuzOqzCvo" dataUsingEncoding:NSUTF8StringEncoding];
	return dgEjQebLdEOHHUM;
}

- (nonnull NSDictionary *)swrrteEunCHC :(nonnull NSDictionary *)FYVYgomxjEWRhVzj :(nonnull NSArray *)pJcnRrOhRsNbebGAaV :(nonnull NSArray *)eVFvsnIHrAOg {
	NSDictionary *oIrXGZUEFUPxXWDG = @{
		@"kEeLmSysYZJYAPEuDH": @"CoOoDZUQdTojSYGEtMmTeFSlnDzPRdnRwqQvLsGKABZdSxlQrRirDtkAgpPloBQdarUvfvNdyYnJUDlpDgxiOvtjPoRVXahLsxbdMpXMlPLUFSqWcafbcgZufVEKrIwolJOlMFDYyaPZLk",
		@"ZBsluxwHuoKfjXQmRj": @"CKOsVuoXbACBxGjjZChIYDNCdHpGDejBQrZcsFgudovfNYNlAgUnkiQwrvgzsGROrfGdNwKsrqPXswMDBZTefUnDgTFwcRetPmWJCsdpIRvqoCSvVOSSeUxRepRZyMjOLMecdyCEGj",
		@"fFTQZZKmwPMsRQ": @"XJwsZogKXWkNbonATPxZddBdEpLRnXKILtsugGjWSqRyPgxoEHNarrlwVzFoRFCZZuxUwaXPCwzhzduHDarKFKrGDJxsTeeomnIyaHFBAPMQNzotvcZsS",
		@"aKmCFCppPuzY": @"ISUgETQShifWEzsLlReEqiWIhncNtgLrAoUuDcaCMNzTElxvnSVAsDfACGAzSogqkncMyANZLTwCvXsPzOHlGWotPqgTVrkKnSMJmJdRwXzK",
		@"CLPKjfTWMGyUpe": @"wyImtzznswmbMQMdABbzNOoCVQVejjwHtfXKRkPJdTxCqcsETRhkFEMESgXDrIOPQMEFxBWbKOAYFJLIAXMyWKEnTopwerAqnJxBLpfnPZjPaOFkFAdEwnxNqgzznRFAegtAbxyhctNfSoeEHYQ",
		@"jkJGACxVmapIgno": @"dkHCNRvFXIAoQfPQhVqlwHtMIAWfdHUSaEVnGYJxRTMdUQTfbzjlFGgDRZVCmZwRRHmoHejHGYCnDSskgwrNqEwCXBcCjxwwOGhSZlKpfLIRZEgmdYgRFEhYNIJqynBhDp",
		@"imqFFTCvxUfVJNoEy": @"VFYwACKqBTgyqpMCYsCbOBBIZTvjVuOKhGwiRZPShHwtKLYXwMYYIZdygcLooEqaCdUXKrAfwdNpZWjaMgPuyJhwCtgmhHYcShURrmXoqOdJZaeRXwAarS",
		@"kTLWdTvYNMb": @"MvXMRyaSbAIkNWiOhGkBqVgxNztJwqOtDykNMQQrsgxJbHwwNtVHYcpuIqfyKYRCgnWRyruciOIBzEANzcwENqBClYVWWwBbKPUHVazdPWhdkaeFqVRvrM",
		@"aGOlkkpmDenVDYd": @"DEPzdzhItCRdesrmlbOncBnAlxPmPURiVqQnHlNnkyFlGAwyszPMFkQpQHLbxfYLQrZKyTqRWPsxslNYARWlXUobFTvtohNPAEmafiSqYQuQyEMainIHPMcbLXWWKoS",
		@"KyNAIDvQroYoUvuVBo": @"ZMrHTXDplZqhTZPEaORRXKoZCbUQcUWspTbxgNPlvLCfUOadTAWecYlhLkrXWvjNlGcLgbqUdbVEfBJlACDdMtHHWgQvLWgPHgJhOQZDpVIcujzR",
		@"YASzgTobgdpFHnDRn": @"SEVhrPDCrGTerJuxOgnlQwdjTcjzkZWbMkjLDbdkmvTZUkpjNAiNfVhZYFuCLGobZIfPvcpRouSuSisXtqMxUuDNvyeEZKUWFIXZPTfqIzmcVsX",
		@"XcffqfBetUzn": @"wAAZxcQfjNQzECteydIPZFFosNOrZbxssvkwwLMHYGPzKQROIQaXaWeKmGAdhtFZVRcYaBmszOtvsZnlbOHdffJcUsNGnfCfuhNGtcVjuXptcvHgyxCvgejjBKgAvatSpXckUZ",
	};
	return oIrXGZUEFUPxXWDG;
}

+ (nonnull UIImage *)qaIDhNBadSWtrkGT :(nonnull NSData *)HwsAuqtuFPSycAsKL {
	NSData *uLkSBWJLEM = [@"nhVxomAXNwuKNSfSVnEaCeDWISVWpVSlctjqRHKczLqAYbXboqQrEqKEoCuwVKOTEAdaoGgLsYPKjeRCmnGXVuxmjHUIutIkzQnUindLPdbfr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ECKEnMQTeDzyH = [UIImage imageWithData:uLkSBWJLEM];
	ECKEnMQTeDzyH = [UIImage imageNamed:@"dhrIFXJBruNECTunJarDfozsOTkIDbuKYhRZmtLQKGYNUnvHBoMWtYVIGpRtSVTqKwizVScMFxpwhYzEadkmmKsgedEXMGxLBwJKGTqpgqGyhAMMiScweGJpHSxzYPthwsawvehtioACMKF"];
	return ECKEnMQTeDzyH;
}

- (nonnull NSData *)XpeTrNCSKvzBiQt :(nonnull UIImage *)tQTUAiojNUTIRHh :(nonnull NSData *)okZNxtpvAnz {
	NSData *BjheyYqqOHI = [@"BMZUcohFbHLyWULFZhMRqPpszthdKaaDzbFjyBNqyuBVBIVEsXGeCzbFGgXvUiBrFLxqcmvsbqbMZbxboUdJboVejyzzvdceqhQctUbDgXyQmiukNEhjjbloemKZfuQBxbVRRsuYbXk" dataUsingEncoding:NSUTF8StringEncoding];
	return BjheyYqqOHI;
}

- (nonnull NSDictionary *)LKsKgZdrWUYTjG :(nonnull UIImage *)UeLwZeBZRCL {
	NSDictionary *VByAVpqiapDduQA = @{
		@"MHiEOcfBXCbv": @"YDREsldfASErvLrDCKHNtjUfPSWYkOVVHsbxTANtcTPKSadFHHOVppozCYKiNtJkcDemOUlFFyNIHpOouhMGXkrtKlHHyAKcqMXlnGxHIkWbmZBGalG",
		@"UqmuanTCIgfF": @"dQTEVEPDjxpUGLtqxaLiKGXNdbUrswOnUtEWUVDTXAHjSJbFPmkIUXmmxkQXsBFymHnlREnqteHVhRDJHRfJzuIPgiWyQTvfQOLysSBrgHRxnlwLmTMbF",
		@"WbefBIAZzQs": @"bhTvKTpAdYYbrMXEXdLJwuxoLcdGzMYNQEbEReWjFzdGvziWKhxOwEgwDthhxAnUpzWTrbVLgquOXandadhRBZZDntEllXPbSeXmKibNmslioO",
		@"qpJQvphurLWaEgV": @"GYbJqekICDWdpWcZApIWQEqpyodQYELgGrFOnCtybcQatZPdiPWucXMyGAvolGSxefAnvamcQIrODktrMvhajAnzPxzdrPGmtNveKgzkdeRpYmDSmPKK",
		@"QJqqfZtZLvuErYwiA": @"RneNqVFawNqIrMAGyljOyVobpyKAMoCIlUHJLtUttTOmlybljWLzXlkbDgGqIhRtrFRiHHTSBIVyhcOkHqlvWzrmSfcSrLuCDKUFgcdhU",
		@"mnkaeYfmdqnSOMk": @"nuDKEzXYoGraxVgqYxsuPzkNIAlUhuFfyLlQroGWqPlylnRYZoDANkCwmQDuPJaLzqQbPGJntpJGIDKBgnVapVMwFzWEVsCYYuhLMIMOlTKzxYJTixocFhWwR",
		@"OjklgTaAhIDYe": @"tFAREBOaXiCaMSJkcyUVuHhRUnKNsTvoEnHXQXvKzDAdEdLOVSeHYXfaHpjXQoujWmDyEHmvVpeFyBlGbNiUubzrlnRjacFMbOmGNNWlhzFUPDkKHiGuDaoiFTCTSWJqfx",
		@"JduwNfprUqWTsNMLTk": @"aTrpCuVnQulMmqxqxinkSJwuQGZzxtUfQMiKvdxmfDwSgGeDVNFYnJkvMZeAfsQtkmEqcILjZRnKZbpVMCEfQITGmwDmVHjAuriLIY",
		@"iLPJwaVovCvutkQxtg": @"ZSkGBPbpkoBdXPFFFoZSJxdcVYZxsDyBMERbYCZQwUxBdBfMQJdqlWSbLkUzEsRJWjaHQOTKWLHgJZxnUDInbzYVqCtSkVoldDQAzttggaaicNLKlsSMMGXLHOJhsDzeOnkJK",
		@"uCtVNggeTBV": @"puAyZOlmopYxMOmaOkDzPTuxfxkdvhhzvEKDHgDpClloDfdTOwnbYGmunRjhqyrVSNxHCyBLxpSqWimeyyKMGENGJtfHxhiaZDTALWUFOuhDDheqwCIQHueYazFjzLtDDaUcAYbpWQTVwepn",
	};
	return VByAVpqiapDduQA;
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


#pragma mark - UIPopoverControllerDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    [self.formViewController.tableView reloadData];
}

@end
