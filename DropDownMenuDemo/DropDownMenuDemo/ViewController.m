//
//  ViewController.m
//  DropDownMenuDemo
//
//  Created by zengchunjun on 2018/12/18.
//  Copyright © 2018 曾春军. All rights reserved.
//

#import "ViewController.h"
#import "BJ7_CJDropDownMenu_C9S.h"
#import "BJ7_LayoutButton_C9S.h"

@interface ViewController ()<BJ7_CJDropDownMenuDelegate_C9S>

@property (strong, nonatomic) BJ7_LayoutButton_C9S *targetBtn;

@property (nonatomic, strong) BJ7_CJDropDownMenu_C9S *menu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.targetBtn = [[BJ7_LayoutButton_C9S alloc] initWithContentType:ContentTitleTypeLeft title:@"886" normalImage:[UIImage imageNamed:@"uc_area_code_pull"] highImage:[UIImage imageNamed:@"uc_area_code_pull"] titleScale:0.5];
    self.targetBtn.frame = CGRectMake(0, 0, 80, 40);
    self.targetBtn.center = self.view.center;
    self.targetBtn.backgroundColor = [UIColor redColor];
    [self.targetBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.targetBtn];
    
    
    self.menu = [[BJ7_CJDropDownMenu_C9S alloc] initWithItems:@[@"item1",@"item2",@"item3",@"item4"] rowHeight:30.0];
    self.menu.delegate = self;
    self.menu.frame = CGRectMake(100, 100, 80, 90);
    self.menu.center = CGPointMake(self.view.center.x, self.view.center.y +70);
    [self.view addSubview:self.menu];
}

- (IBAction)buttonClick:(UIButton *)sender {
    
    [self.menu unfoldOrFold];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.menu unfoldOrFold];
}

#pragma mark:
- (void)dropDownMenu:(BJ7_CJDropDownMenu_C9S *)menu item:(NSString *)item
{
    NSLog(@"click:%@",item);
}

@end
