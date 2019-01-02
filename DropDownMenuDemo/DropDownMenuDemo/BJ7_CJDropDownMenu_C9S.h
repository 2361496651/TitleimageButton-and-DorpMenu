//
//  CJDropDownMenu.h
//  DropDownMenuDemo
//
//  Created by zengchunjun on 2018/12/18.
//  Copyright © 2018 曾春军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class BJ7_CJDropDownMenu_C9S;
NS_ASSUME_NONNULL_BEGIN


@protocol BJ7_CJDropDownMenuDelegate_C9S <NSObject>
@optional
- (void)dropDownMenu:(BJ7_CJDropDownMenu_C9S *)menu item:(NSString *)item;

@end

@interface BJ7_CJDropDownMenu_C9S : UIView

- (instancetype)initWithItems:(NSArray<NSString *> *)items rowHeight:(CGFloat)height;
@property (nonatomic, weak) id<BJ7_CJDropDownMenuDelegate_C9S> delegate;

//展开或收起
- (void)unfoldOrFold;

@end

@interface BJ7_DropDownMenuCell_C9S : UITableViewCell

+ (instancetype)cellForTableview:(UITableView *)tableView;

@property (nonatomic, strong) NSString *titleStr;

@end

NS_ASSUME_NONNULL_END
