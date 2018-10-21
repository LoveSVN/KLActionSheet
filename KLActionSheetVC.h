//
//  KLActionSheetVC.h
//  FanweApp
//
//  Created by 张晓亮 on 2018/10/19.
//  Copyright © 2018 xfg. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface KLActionSheetVC : BaseViewController
@property(nonatomic,copy)void(^selectedIndex)(NSInteger index);
- (instancetype)initWithTitles:(NSArray *)titles;
- (void)show;
- (void)dissmis:(void(^)(BOOL finished))complate;
@end

@interface KLActionSheetView : UIView
@property(nonatomic,assign)BOOL useblurEffrct; //默认是不使用
@property(nonatomic,assign)CGFloat selfAdaptionHeight;
@property(nonatomic,weak)UITapGestureRecognizer *tableTapGestureRecognizer;
- (instancetype)initWithTitles:(NSArray *)titles selectIndex:(void(^)(NSInteger index))selectIndex cancle:(void(^)())cancle;

@end

NS_ASSUME_NONNULL_END
