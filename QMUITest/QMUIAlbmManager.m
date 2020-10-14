//
//  QMUIAlbmManager.m
//  QMUITest
//
//  Created by yangyuting on 2020/9/18.
//

#import "QMUIAlbmManager.h"
//#import <QMUIKit/QMUIKit.h>


static QMUIAlbmManager *manager;

static dispatch_once_t onceToken;

@interface QMUIAlbmManager ()<QMUIAlbumViewControllerDelegate,QMUIImagePickerViewControllerDelegate>
@property (nonatomic ,strong) QMUIAlbumViewController *albumViewController;

@end


@implementation QMUIAlbmManager

+ (instancetype )QMUIAlbmShareManager{
   
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.maxSelectCount = 2;
    }
    return self;
}

- (void)dealloc{
    NSLog(@"被释放消失了");
}

- (void)attempDealloc{
    onceToken = 0; // 只有置成0,GCD才会认为它从未执行过.它默认为0.这样才能保证下次再次调用shareInstance的时候,再次创建对象.
    manager = nil;
}
- (QMUIAlbumViewController *)albumViewController{
    if (!_albumViewController) {
        _albumViewController = [[QMUIAlbumViewController alloc] init];
        _albumViewController.albumViewControllerDelegate = self;
    }
    return _albumViewController;
}


#pragma mark ---------imagePickerViewControllerDelegate
/**
 *  多选模式下选择图片完毕后被调用（点击 sendButton 后被调用），单选模式下没有底部发送按钮，所以也不会走到这个delegate
 *
 *  @param imagePickerViewController 对应的 QMUIImagePickerViewController
 *  @param imagesAssetArray          包含被选择的图片的 QMUIAsset 对象的数组。
 */
- (void)imagePickerViewController:(QMUIImagePickerViewController *)imagePickerViewController didFinishPickingImageWithImagesAssetArray:(NSMutableArray<QMUIAsset *> *)imagesAssetArray{
    if (self.delegate && [self.delegate respondsToSelector:@selector(QMUIAlbmManagerImagePickerViewController:didFinishPickingImageWithImagesAssetArray:)]) {
        [self.delegate QMUIAlbmManagerImagePickerViewController:imagePickerViewController didFinishPickingImageWithImagesAssetArray:imagesAssetArray];
    }
    self.delegate = nil;
}
/**
 *  取消查看相册列表后被调用
 */
- (void)albumViewControllerDidCancel:(QMUIAlbumViewController *)albumViewController{
    NSLog(@"取消查看相册");
    self.delegate = nil;

}


/**
 *  创建一个 ImagePickerPreviewViewController 用于预览图片
 */
- (QMUIImagePickerPreviewViewController *)imagePickerPreviewViewControllerForImagePickerViewController:(QMUIImagePickerViewController *)imagePickerViewController{
    QMUIImagePickerPreviewViewController *vc = [QMUIImagePickerPreviewViewController new];
//    NSLog(@"54321");
    return vc;
}

- (QMUIImagePickerViewController *)imagePickerViewControllerForAlbumViewController:(QMUIAlbumViewController *)albumViewController{
    QMUIImagePickerViewController *vc = [[QMUIImagePickerViewController alloc] init];
    vc.imagePickerViewControllerDelegate = self;
//    vc.allowsMultipleSelection = false;
    vc.maximumSelectImageCount = self.maxSelectCount;
    return vc;
}

- (void)showQMUIAlbumViewController{
    QMUIAlbumViewController *vc = self.albumViewController;
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    [vc pickLastAlbumGroupDirectlyIfCan];
    
    [[self getCurrentVC] presentViewController:nvc animated:true completion:^{

    }];
    
}




//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        //        currentVC = [rootVC presentedViewController];
        if ([rootVC isKindOfClass:[UINavigationController class]] ) {
            currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        }else{
            currentVC = rootVC;
        }
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        
        currentVC = rootVC;
        
    }
    
    return currentVC;
}

@end
