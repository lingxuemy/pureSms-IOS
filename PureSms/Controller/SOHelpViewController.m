//
//  SOHelpViewController.m
//  PureSms
//
//  Created by YC X on 2018/4/15.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import "SOHelpViewController.h"
#import "XScrollView.h"

@interface SOHelpViewController ()

@property (weak, nonatomic) IBOutlet UIButton *okBut;
@property (nonatomic, strong) XScrollView *scrollView;

@end

@implementation SOHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.okBut setTitle:NSLocalizedString(@"I Kown", nil) forState:UIControlStateNormal];
    self.okBut.layer.borderWidth = 1;
    self.okBut.layer.borderColor = [UIColor whiteColor].CGColor;
    self.okBut.layer.cornerRadius = 20;
    self.okBut.layer.masksToBounds = YES;
    self.okBut.hidden = YES;
    NSMutableArray *imageMutArray = [NSMutableArray array];
    [imageMutArray addObject:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image1.jpg"]]];
    [imageMutArray addObject:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2.jpg"]]];
    [imageMutArray addObject:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image3.jpg"]]];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.scrollView setingViewArray:imageMutArray];
    [self.view insertSubview:self.scrollView belowSubview:self.okBut];
    __weak typeof(self) weakSelf = self;
    self.scrollView.blockScrollIndex = ^(NSInteger scrollIndex) {
        NSLog(@"scrollIndex == %ld", scrollIndex);
        if (scrollIndex == 2) {
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.okBut.hidden = NO;
//                weakSelf.useLabel.hidden = NO;
            });
        }
    };
}
- (IBAction)buttonTouchUpInside:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (XScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[XScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    }
    return _scrollView;
}

@end
