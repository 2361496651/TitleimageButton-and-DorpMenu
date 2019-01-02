# TitleimageButton-and-DorpMenu
文字图片按钮封装与下拉框

1.BJ7_LayoutButton_C9S文字图片按钮封装


/ **
 title与图片布局按钮

 @param type 布局类型
 @param title title
 @param norImage image
 @param highImage highImage
 @param scale title比例 左右布局，title占宽度的比例，上下布局时title占高度的比例 0.0~1.0
 @return 返回BJ7_LayoutButton_C9S实例对象
 */
- (instancetype)initWithContentType:(ContentTitleType)type title:(NSString *)title normalImage:(nullable UIImage *)norImage highImage:(nullable UIImage *)highImage titleScale:(CGFloat)scale;


2.BJ7_CJDropDownMenu_C9S下拉框的简易封装。
使用见demo
