//
//  CJDropDownMenu.m
//  DropDownMenuDemo
//
//  Created by zengchunjun on 2018/12/18.
//  Copyright © 2018 曾春军. All rights reserved.
//

#import "BJ7_CJDropDownMenu_C9S.h"

@interface BJ7_CJDropDownMenu_C9S()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong) NSArray<NSString *> *menuItems;
@property (nonatomic, assign) CGFloat rowHeight;

@end

@implementation BJ7_CJDropDownMenu_C9S


- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _tableView.layer.borderWidth = 0.6;
        _tableView.layer.cornerRadius = 4.0;
        _tableView.layer.masksToBounds = YES;
        
    }
    return _tableView;
}

- (instancetype)initWithItems:(NSArray<NSString *> *)items rowHeight:(CGFloat)height
{
    if (self == [super init]) {
        self.menuItems = items;
        self.rowHeight = height;
    }
    return self;
}

- (void)unfoldOrFold
{
    if ([self.subviews containsObject:self.tableView]) {
        [self fold];
    }else{
        [self unfold];
    }
}

//展开
- (void)unfold
{
    [self addSubview:self.tableView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
//    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    self.tableView.frame = self.bounds;
    [UIView commitAnimations];

//    CATransition *transition = [CATransition animation];
//    transition.duration = 0.5;
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromBottom;
//    [self addSubview:self.tableView];
//    [self.tableView.layer addAnimation:transition forKey:@"animation"];
    
    
}
//折叠
- (void)fold
{
    CGRect originFrame = self.tableView.frame;
    [UIView animateWithDuration:0.4 animations:^{
        self.tableView.frame = CGRectMake(0, 0,originFrame.size.width, 0);
    } completion:^(BOOL finished) {
        [self.tableView removeFromSuperview];
    }];
    
}

#pragma mark:UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BJ7_DropDownMenuCell_C9S *cell = [BJ7_DropDownMenuCell_C9S cellForTableview:tableView];
    
    cell.titleStr = self.menuItems[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.delegate respondsToSelector:@selector(dropDownMenu:item:)]) {
        [self.delegate dropDownMenu:self item:self.menuItems[indexPath.row]];
        [self fold];
    }
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}



@end


@interface BJ7_DropDownMenuCell_C9S()

@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation BJ7_DropDownMenuCell_C9S

+ (instancetype)cellForTableview:(UITableView *)tableView
{
    static NSString *account_cell = @"Menu_Cell";
    BJ7_DropDownMenuCell_C9S *cell = [tableView dequeueReusableCellWithIdentifier:account_cell];
    if (cell == nil) {
        cell = [[BJ7_DropDownMenuCell_C9S alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:account_cell];
    }
    
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}


- (void)setupSubviews
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    //字体大小与对齐方式保持与按钮的titleLabel一致
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:label];
    
    self.titleLabel = label;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //数据显示的frame根据需要保持与按钮中的titleLabel保持一致
    self.titleLabel.frame = CGRectMake(5, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
}


- (void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    
    self.titleLabel.text = titleStr;
}

@end
