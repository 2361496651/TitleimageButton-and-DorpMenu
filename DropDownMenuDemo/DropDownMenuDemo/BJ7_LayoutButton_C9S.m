//
//  BJ7_LayoutButton_C9S.m
//  IEagle
//
//  Created by zengchunjun on 2018/12/21.
//  Copyright © 2018 Mr.zeng. All rights reserved.
//

#import "BJ7_LayoutButton_C9S.h"

@interface BJ7_LayoutButton_C9S()

@property (nonatomic, assign) ContentTitleType contentType;
@property (nonatomic, assign) CGFloat titleScale;

@end

@implementation BJ7_LayoutButton_C9S

- (instancetype)initWithContentType:(ContentTitleType)type title:(NSString *)title normalImage:(UIImage *)norImage highImage:(UIImage *)highImage titleScale:(CGFloat)scale
{
    if (self = [super init]) {
        self.contentType = type;
        self.titleScale = scale;
        
        self.layer.cornerRadius = 2.0;
        self.layer.masksToBounds = YES;
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setImage:norImage forState:UIControlStateNormal];
        [self setImage:highImage forState:UIControlStateHighlighted];
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font =[UIFont systemFontOfSize:14];
//        [self.titleLabel sizeToFit];
        self.imageView.contentMode = UIViewContentModeCenter;
        
//        self.titleLabel.backgroundColor = [UIColor redColor];
    }
    return self;
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    switch (self.contentType) {
        case ContentTitleTypeLeft:
            return CGRectMake(0, 0, CGRectGetWidth(self.bounds)*self.titleScale,CGRectGetHeight(self.bounds));
            break;
        case ContentTitleTypeRight:
            return CGRectMake(CGRectGetWidth(self.bounds)*(1-self.titleScale), 0, CGRectGetWidth(self.bounds)*self.titleScale,CGRectGetHeight(self.bounds));
            break;
        case ContentTitleTypeTop:
            return CGRectMake(0, 0, CGRectGetWidth(self.bounds),CGRectGetHeight(self.bounds)*self.titleScale);
            break;
        case ContentTitleTypeBottom:
            return CGRectMake(0, CGRectGetHeight(self.bounds)*(1-self.titleScale), CGRectGetWidth(self.bounds),CGRectGetHeight(self.bounds)*self.titleScale);
            break;
            
        default:
            return [super titleRectForContentRect:contentRect];
            break;
    }
    
  
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    switch (self.contentType) {
        case ContentTitleTypeLeft:
            return CGRectMake(CGRectGetWidth(self.bounds)*self.titleScale, 0, CGRectGetWidth(self.bounds)*(1-self.titleScale),CGRectGetHeight(self.bounds));
            break;
        case ContentTitleTypeRight:
            return CGRectMake(0,0, CGRectGetWidth(self.bounds)*(1-self.titleScale),CGRectGetHeight(self.bounds));
            break;
        case ContentTitleTypeTop:
            return CGRectMake(0, CGRectGetHeight(self.bounds)*self.titleScale, CGRectGetWidth(self.bounds),CGRectGetHeight(self.bounds)*(1-self.titleScale));
            break;
        case ContentTitleTypeBottom:
            return CGRectMake(0, 0, CGRectGetWidth(self.bounds),CGRectGetHeight(self.bounds)*(1-self.titleScale));
            break;
            
        default:
            return [super titleRectForContentRect:contentRect];
            break;
    }
}


@end
