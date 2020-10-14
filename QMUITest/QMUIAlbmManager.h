//
//  QMUIAlbmManager.h
//  QMUITest
//
//  Created by yangyuting on 2020/9/18.
//

#import <Foundation/Foundation.h>

#import <QMUIAlbumViewController.h>

#import <QMUIImagePickerPreviewViewController.h>

#import <QMUIImagePickerViewController.h>


NS_ASSUME_NONNULL_BEGIN


@protocol QMUIAlbmManagerDelegate <NSObject>

-(void)QMUIAlbmManagerImagePickerViewController:(QMUIImagePickerViewController *)imagePickerViewController didFinishPickingImageWithImagesAssetArray:(NSMutableArray<QMUIAsset *> *)imagesAssetArray;

@end

@interface QMUIAlbmManager : NSObject

+ (instancetype )QMUIAlbmShareManager;

@property (nonatomic ,weak)id<QMUIAlbmManagerDelegate>delegate;

/// 最大选择相册数据
@property (nonatomic ,assign) NSInteger maxSelectCount;

///展示
- (void)showQMUIAlbumViewController;

- (void)attempDealloc;

@end

NS_ASSUME_NONNULL_END
