//
//  ViewController.m
//  QMUITest
//
//  Created by yangyuting on 2020/9/18.
//

#import "ViewController.h"
#import "QMUIAlbmManager.h"
#import "SubViewController.h"

@interface ViewController ()<QMUIZoomImageViewDelegate,QMUIAlbmManagerDelegate>

@property (nonatomic ,strong) QMUIZoomImageView *zoomImageView;
@property (nonatomic ,strong)QMUIPopupMenuView *popupMenuView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.zoomImageView];
    self.title = @"主页";
    
//    [self showEmptyViewWithLoading];
//    [self showEmptyViewWithText:@"没有数据" detailText:@"请检查网络" buttonTitle:@"重新请求数据" buttonAction:@selector(reloadData)];
    [self setRightItem];
//    [self showQMUIFloatLayoutView];


}
- (void)setRightItem{
    self.titleView.style = QMUINavigationTitleViewStyleSubTitleVertical;
    self.titleView.title = @"主标题";
    self.titleView.subtitle = @"子标题";
//    self.titleView.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.titleView.subtitleLabel.textAlignment = NSTextAlignmentCenter;
//    UIView *accessoryView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 20, 20))];
//    self.titleView.accessoryView = accessoryView;
//    self.titleView.accessoryType = QMUINavigationTitleViewAccessoryTypeDisclosureIndicator;
   
    
    QMUIButton *button = [[QMUIButton alloc] init];
    button.frame = CGRectMake(0, 0, 40, 25);
    button.titleLabel.font = UIFontMake(17);
    [button setTitle:@"完成" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(pushSunController) forControlEvents:(UIControlEventTouchUpInside)];
//    self.navigationItem.rightBarButtonItem
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
//    item.qmui_badgeString = @"10";
//    item.qmui_badgeBackgroundColor = [UIColor redColor];
//    item.qmui_badgeTextColor = [UIColor whiteColor];
//    item.qmui_badgeFont = UIFontMake(12);
//
//    item.qmui_badgeContentEdgeInsets  = UIEdgeInsetsMake(2, 2, 2, 2);
////    item.qmui_badgeLabel.text = @"99+";
//    item.qmui_badgeOffset = CGPointMake(-5, 5);
    item.qmui_shouldShowUpdatesIndicator = true;
    item.qmui_updatesIndicatorColor = [UIColor redColor];
    item.qmui_updatesIndicatorSize = CGSizeMake(10, 10);
//    @property(nonatomic, strong, nullable) UIColor *qmui_badgeBackgroundColor;
//    @property(nonatomic, strong, nullable) UIColor *qmui_badgeTextColor;
//    @property(nonatomic, strong, nullable) UIFont *qmui_badgeFont;
}
- (void)pushSunController{
    SubViewController *vc = [SubViewController new];
    [self.navigationController pushViewController:vc animated:true];
}
- (void)reloadData{
    [self hideEmptyView];
}
- (QMUIPopupMenuView *)popupMenuView{
    if (!_popupMenuView) {
        _popupMenuView = [[QMUIPopupMenuView alloc] init];
//        _popupMenuView.debug = true;
        _popupMenuView.contentMode = UIViewContentModeCenter;
        _popupMenuView.preferLayoutDirection = QMUIPopupContainerViewLayoutDirectionAbove;
//        _popupMenuView.arrowSize = CGSizeMake(30, 30);
        _popupMenuView.shouldShowItemSeparator = true;
        _popupMenuView.distanceBetweenSource = 64;
        _popupMenuView.automaticallyHidesWhenUserTap = true;
//        _popupMenuView.sourceRect = CGRectMake(0, -[UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2 );
        _popupMenuView.sourceRect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0 );
        _popupMenuView.maximumHeight = 300;
        QMUIPopupMenuButtonItem *item1 = [QMUIPopupMenuButtonItem itemWithImage:[UIImage imageNamed:@""] title:@"你好1" handler:^(QMUIPopupMenuButtonItem * _Nonnull aItem) {
            
        }];
        QMUIPopupMenuButtonItem *item2 = [QMUIPopupMenuButtonItem itemWithImage:[UIImage imageNamed:@""] title:@"你好2" handler:^(QMUIPopupMenuButtonItem * _Nonnull aItem) {
            
        }];
        QMUIPopupMenuButtonItem *item3 = [QMUIPopupMenuButtonItem itemWithImage:[UIImage imageNamed:@""] title:@"你好3" handler:^(QMUIPopupMenuButtonItem * _Nonnull aItem) {
            
        }];
        QMUIPopupMenuButtonItem *item4 = [QMUIPopupMenuButtonItem itemWithImage:[UIImage imageNamed:@""] title:@"你好4" handler:^(QMUIPopupMenuButtonItem * _Nonnull aItem) {
            
        }];
        QMUIPopupMenuButtonItem *item5 = [QMUIPopupMenuButtonItem itemWithImage:[UIImage imageNamed:@""] title:@"你好5" handler:^(QMUIPopupMenuButtonItem * _Nonnull aItem) {
            
        }];
        QMUIPopupMenuButtonItem *item6 = [QMUIPopupMenuButtonItem itemWithImage:[UIImage imageNamed:@""] title:@"你好6" handler:^(QMUIPopupMenuButtonItem * _Nonnull aItem) {
            
        }];
        QMUIPopupMenuButtonItem *item7 = [QMUIPopupMenuButtonItem itemWithImage:[UIImage imageNamed:@""] title:@"你好7" handler:^(QMUIPopupMenuButtonItem * _Nonnull aItem) {
            
        }];
        QMUIPopupMenuButtonItem *item8 = [QMUIPopupMenuButtonItem itemWithImage:[UIImage imageNamed:@""] title:@"你好8" handler:^(QMUIPopupMenuButtonItem * _Nonnull aItem) {
            
        }];
        QMUIPopupMenuButtonItem *item9 = [QMUIPopupMenuButtonItem itemWithImage:[UIImage imageNamed:@""] title:@"你好9" handler:^(QMUIPopupMenuButtonItem * _Nonnull aItem) {
            
        }];
        QMUIPopupMenuButtonItem *item10 = [QMUIPopupMenuButtonItem itemWithImage:[UIImage imageNamed:@""] title:@"你好1000000" handler:^(QMUIPopupMenuButtonItem * _Nonnull aItem) {
            
        }];
        _popupMenuView.items = @[item1,item2,item3,item4,item5,item6,item7,item8,item9,item10];
   
        
    }
    return _popupMenuView;
}
- (QMUIZoomImageView *)zoomImageView{
    if (!_zoomImageView) {
        _zoomImageView = [[QMUIZoomImageView alloc] initWithFrame:self.view.frame];
        _zoomImageView.image = [UIImage imageNamed:@"placeImage"];
        
//        [_zoomImageView showEmptyViewWithText:@"图片读取失败"];
        _zoomImageView.delegate = self;
    }
    return _zoomImageView;
}


- (void)showQMUIPopupMenuView{
    if ([self.popupMenuView isShowing]) {
        [self.popupMenuView hideWithAnimated:true completion:^(BOOL finished) {
        }];
    }else{
        [self.popupMenuView showWithAnimated:true completion:^(BOOL finished) {
            
        }];
    }

}

- (void)showQMUIAlertController{
    QMUIAlertController *vc = [[QMUIAlertController alloc] initWithTitle:@"1111" message:@"2222" preferredStyle:(QMUIAlertControllerStyleActionSheet)];
    [vc setTitle:@"23454"];
    [vc setMessage:@"543454"];
    QMUIAlertAction *action1 = [QMUIAlertAction actionWithTitle:@"相机" style:(QMUIAlertActionStyleDefault) handler:^(__kindof QMUIAlertController * _Nonnull aAlertController, QMUIAlertAction * _Nonnull action) {
        
    }];
    
    QMUIAlertAction *action2 = [QMUIAlertAction actionWithTitle:@"相册" style:(QMUIAlertActionStyleDefault) handler:^(__kindof QMUIAlertController * _Nonnull aAlertController, QMUIAlertAction * _Nonnull action) {
        
    }];
    
//    QMUIAlertAction *action2 = [QMUIAlertAction actionWithTitle:@"取消" style:(QMUIAlertActionStyleDefault) handler:^(__kindof QMUIAlertController * _Nonnull aAlertController, QMUIAlertAction * _Nonnull action) {
//
//    }];
//    [vc addTextFieldWithConfigurationHandler:^(QMUITextField * _Nonnull textField) {
//    }];
//
//    [vc addTextFieldWithConfigurationHandler:^(QMUITextField * _Nonnull textField) {
//
//    }];
    [vc addAction:action1];
    [vc addAction:action2];
    [vc addCancelAction];
    
//    [self presentViewController:vc animated:true completion:^{
//
//    }];
    [vc showWithAnimated:true];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self showQMUIPopupMenuView];
//    [self showTips];

    [self showQMUIAlbumViewController];
//    [self showQMUIAlertController];
//    [self showQMUIDialogViewController];
}



- (void)showTips{
    //    QMUITips *tips = [QMUITips showLoading:@"加载中...." inView:self.view];
        
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [tips hideAnimated:true];
    //    });
        
    //    [QMUITips  showLoadingInView:self.view hideAfterDelay:2];
    //    [QMUITips showError:@"错误信息" inView:self.view];
    //    [QMUITips showWithText:@"提示" detailText:@"详情"];
    //    [QMUITips showInfo:@"请求成功\n请求成功"];
    //    NSTimeInterval time =[QMUITips smartDelaySecondsForTipsText:@"会尽快发货数量凡事都留个甲方可拉倒就付了款登记管理工具"];
    //    NSLog(@"time ==  %f",time);
}

- (void)showQMUIAlbumViewController{

    QMUIAlbmManager *manager = [QMUIAlbmManager QMUIAlbmShareManager];
    manager.maxSelectCount = 3;
    manager.delegate = self;
    [manager showQMUIAlbumViewController];
}
- (BOOL)enabledZoomViewInZoomImageView:(QMUIZoomImageView *)zoomImageView{
    return true;
}


- (void)QMUIAlbmManagerImagePickerViewController:(QMUIImagePickerViewController *)imagePickerViewController didFinishPickingImageWithImagesAssetArray:(NSMutableArray<QMUIAsset *> *)imagesAssetArray{
    NSLog(@"2345678765");
}

- (void)showQMUIDialogViewController{
//    QMUIDialogSelectionViewController *vc = [[QMUIDialogSelectionViewController alloc] init];
    QMUIDialogTextFieldViewController *vc = [[QMUIDialogTextFieldViewController alloc] init];

    
//    vc.items = @[@"section1",@"section2",@"section3",@"section4",@"section5",@"section6",@"section7",@"section8",@"section9",@"section10",@"section11",@"section12",@"section13"];
    
    vc.title = @"登录";
//    vc.allowsMultipleSelection = true;
//    vc.rowHeight = 80;
    vc.maximumContentViewWidth = 300;
    vc.dialogViewMargins = UIEdgeInsetsMake(200, 10, 200, 10);
    [vc addTextFieldWithTitle:@"账号" configurationHandler:^(QMUILabel * _Nonnull titleLabel, QMUITextField * _Nonnull textField, CALayer * _Nonnull separatorLayer) {
            
    }];
    [vc addTextFieldWithTitle:@"密码" configurationHandler:^(QMUILabel * _Nonnull titleLabel, QMUITextField * _Nonnull textField, CALayer * _Nonnull separatorLayer) {
            
    }];
    [vc addCancelButtonWithText:@"取消" block:^(__kindof QMUIDialogViewController * _Nonnull aDialogViewController) {
            
    }];
    [vc addSubmitButtonWithText:@"确认" block:^(__kindof QMUIDialogViewController * _Nonnull aDialogViewController) {
        [aDialogViewController hide];
    }];

    [vc show];
    
}

/// 直接添加视图会自动布局
- (void)showQMUIFloatLayoutView{
    QMUIFloatLayoutView *view = [[QMUIFloatLayoutView alloc] initWithFrame:(CGRectMake(40, 100, 200, 400))];
    view.backgroundColor = UIColorRed;
    
    view.padding =  UIEdgeInsetsMake(10, 10, 10, 10);
    view.itemMargins = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.view addSubview:view];
    QMUILabel *label1 = [[QMUILabel alloc] init];
    label1.numberOfLines = 0;
    label1.text = @"123456787654323454";
    [view addSubview:label1];
    
    QMUILabel *label2 = [[QMUILabel alloc] init];
    label2.text = @"123456787654323454rnfksnfksdfnsk";
    [view addSubview:label2];
    label2.numberOfLines = 0;

    QMUILabel *label3 = [[QMUILabel alloc] init];
    label3.text = @"123456787654323454fkldskf;sfsd;fks;l";
    [view addSubview:label3];
    label3.numberOfLines = 0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"label3.frame ==  %@",NSStringFromCGRect(label3.frame));

    });

}
- (nullable UIColor *)navigationBarBarTintColor{
    return  UIColorRed;
}


@end
