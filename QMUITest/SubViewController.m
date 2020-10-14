//
//  SubViewController.m
//  QMUITest
//
//  Created by yangyuting on 2020/9/19.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setback];
  self.view.backgroundColor = [UIColor
                               whiteColor];
//    [self showQMUIMarqueeLabel];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//    });
    [self showQMUILabel];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self showQMUIPieProgressView];

}
- (void)setback{
    QMUINavigationButton *nvButton = [[QMUINavigationButton alloc] initWithType:QMUINavigationButtonTypeBack title:@"返回"];
    [nvButton addTarget:self action:@selector(backTolast) forControlEvents:(UIControlEventTouchUpInside)];
    [nvButton setTitleColor:UIColorBlack forState:(UIControlStateNormal)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:nvButton];
}
- (void)backTolast{
    [self.navigationController popViewControllerAnimated:true];
}

- (nullable UIColor *)navigationBarBarTintColor{
    return  UIColorBlue;
}

- (void)showQMUIPieProgressView{
    QMUIPieProgressView *view = [[QMUIPieProgressView alloc] init];
    view.frame =  CGRectMake(50, 100, 100, 100);

//    view.progress = 0.3;
    view.borderWidth = 3;
    view.borderInset = 2;
    view.lineWidth = 5;
//    view.shape = QMUIPieProgressViewShapeRing;
//    view.progressAnimationDuration = 1;
    [self.view addSubview:view];
    [view setProgress:0.5 animated:true];
}
- (void)showQMUIMarqueeLabel{
    QMUIMarqueeLabel *marqueel = [[QMUIMarqueeLabel alloc] initWithFrame:(CGRectMake(100, 200, 200, 20))];
    marqueel.text = @"支持长按复制文本，且可修改弹出的 menu 的复制 item 文本及长按时的背景色";
    [self.view addSubview:marqueel];
    [marqueel requestToStartAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [marqueel requestToStopAnimation];
    });
}

- (void)showQMUILabel{

    QMUILabel *marqueel = [[QMUILabel alloc] initWithFrame:(CGRectMake(100, 200, 200, 20))];
    marqueel.text = @"支持长按复制文本，且可修改弹出的 menu 的复制 item 文本及长按时的背景色";
    [self.view addSubview:marqueel];
    marqueel.canPerformCopyAction = true;
    marqueel.didCopyBlock = ^(QMUILabel *label, NSString *stringCopied) {
    };
    
}

- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable{
    return true;
}
- (BOOL)preferredNavigationBarHidden{
    return false;
}
- (BOOL)forceEnableInteractivePopGestureRecognizer{
    return true;
}
@end
