//
//  BJ7_LayoutButton_C9S.h
//  IEagle
//
//  Created by zengchunjun on 2018/12/21.
//  Copyright © 2018 Mr.zeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ContentTitleType){
    ContentTitleTypeLeft,
    ContentTitleTypeRight,
    ContentTitleTypeTop,
    ContentTitleTypeBottom
};

NS_ASSUME_NONNULL_BEGIN

@interface BJ7_LayoutButton_C9S : UIButton


/**
 title 与 图片布局button

 @param type 布局类型
 @param title title
 @param norImage image
 @param highImage highImage
 @param scale title比例 左右布局，title占宽度的比例，上下布局时title占高度的比例 0.0~1.0
 @return 返回BJ7_LayoutButton_C9S实例对象
 */
- (instancetype)initWithContentType:(ContentTitleType)type title:(NSString *)title normalImage:(nullable UIImage *)norImage highImage:(nullable UIImage *)highImage titleScale:(CGFloat)scale;

@end

NS_ASSUME_NONNULL_END
