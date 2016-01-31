//
//  ZLAlertVIew.m
//  ZLAlertView
//
//  Created by 张璐 on 16/1/12.
//  Copyright © 2016年 张璐. All rights reserved.

#import "ZLAlertView.h"
#define ScreenWeight [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define margin 23
@interface ZLAlertView ()

@property(nonatomic,strong)UIView * selectView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * messageLabel;
@property(nonatomic,strong)UIButton * cancelBtn;
@property(nonatomic,strong)UIButton * otherBtn;
@property(nonatomic,strong)UIViewController * currentVC;
@end

@implementation ZLAlertView


-(void)setTitle:(NSString *)title
{
    _title = [title copy];
    self.titleLabel.text = title;

}

-(void)setMessage:(NSString *)message
{
    _message = [message copy];
    self.messageLabel.text = message;

}


-(void)setCancelButtonTitle:(NSString *)cancelButtonTitle
{
    _cancelButtonTitle = [cancelButtonTitle copy];
    if (cancelButtonTitle) {
        self.cancelBtn = [[UIButton alloc]init];
        self.cancelBtn.backgroundColor = [UIColor blueColor];
        self.cancelBtn.tag = 0;
        [self.cancelBtn setTitle:cancelButtonTitle forState:UIControlStateNormal];
        [self.cancelBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.selectView addSubview:self.cancelBtn];

    }
    
}

-(void)setOtherButtonTitle:(NSString *)otherButtonTitle
{
    _otherButtonTitle = [otherButtonTitle copy];
    self.otherBtn.tag = self.cancelButtonTitle ? 1 : 0;
    [self.otherBtn setTitle:otherButtonTitle forState:UIControlStateNormal];

    
}

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
}

-(void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    self.titleLabel.font = titleFont;
    
}

-(void)setMessageColor:(UIColor *)messageColor
{
    _messageColor = messageColor;
    self.messageLabel.textColor = messageColor;
}

-(void)setMessageFont:(UIFont *)messageFont
{
    _messageFont = messageFont;
    self.messageLabel.font = messageFont;
}

-(void)setButtonTextColorNormal:(UIColor *)buttonTextColorNormal
{
    _buttonTextColorNormal = buttonTextColorNormal;
    [self.cancelBtn setTitleColor:buttonTextColorNormal forState:UIControlStateNormal];
    [self.otherBtn setTitleColor:buttonTextColorNormal forState:UIControlStateNormal];
}

-(void)setButtonTextColorHighted:(UIColor *)buttonTextColorHighted
{
    _buttonTextColorHighted = buttonTextColorHighted;
    [self.cancelBtn setTitleColor:buttonTextColorHighted forState:UIControlStateHighlighted];
    [self.otherBtn setTitleColor:buttonTextColorHighted forState:UIControlStateHighlighted];

}

-(void)setButtonTextColorSelected:(UIColor *)buttonTextColorSelected
{
    _buttonTextColorSelected = buttonTextColorSelected;
    [self.cancelBtn setTitleColor:buttonTextColorSelected forState:UIControlStateSelected];
    [self.otherBtn setTitleColor:buttonTextColorSelected forState:UIControlStateSelected];
}

-(void)setButtonFont:(UIFont *)buttonFont
{
    _buttonFont = buttonFont;
    self.cancelBtn.titleLabel.font = buttonFont;
    self.otherBtn.titleLabel.font = buttonFont;
}

-(void)setButtonBgImageNormal:(NSString *)buttonBgImageNormal
{
    _buttonBgImageNormal = buttonBgImageNormal;
    [self.cancelBtn setBackgroundImage:[UIImage imageNamed:buttonBgImageNormal] forState:UIControlStateNormal];
    [self.otherBtn setBackgroundImage:[UIImage imageNamed:buttonBgImageNormal] forState:UIControlStateNormal];

}

-(void)setButtonBgImageHighted:(NSString *)buttonBgImageHighted
{
    _buttonBgImageHighted = buttonBgImageHighted;
    [self.cancelBtn setBackgroundImage:[UIImage imageNamed:buttonBgImageHighted] forState:UIControlStateHighlighted];
    [self.otherBtn setBackgroundImage:[UIImage imageNamed:buttonBgImageHighted] forState:UIControlStateHighlighted];

}

-(void)setButtonBgImageSelected:(NSString *)buttonBgImageSelected
{
    _buttonBgImageSelected = buttonBgImageSelected;
    [self.cancelBtn setBackgroundImage:[UIImage imageNamed:buttonBgImageSelected] forState:UIControlStateSelected];
    [self.otherBtn setBackgroundImage:[UIImage imageNamed:buttonBgImageSelected] forState:UIControlStateSelected];
}


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.5];
        self.selectView = [[UIView alloc]init];
        self.selectView.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.selectView];
        
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.font = [UIFont systemFontOfSize:18];

        self.titleLabel.backgroundColor = [UIColor purpleColor];
        self.titleLabel.textColor = [UIColor blackColor];
        [self.selectView addSubview:self.titleLabel];
        
        self.messageLabel = [[UILabel alloc]init];
        self.messageLabel.numberOfLines = 0;
        self.messageLabel.backgroundColor = [UIColor grayColor];
        self.messageLabel.font = [UIFont systemFontOfSize:14];
        [self.selectView addSubview:self.messageLabel];
        
        self.otherBtn = [[UIButton alloc]init];
        self.otherBtn.backgroundColor = [UIColor greenColor];
        [self.otherBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.selectView addSubview:self.otherBtn];
        
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.frame = CGRectMake(0, 0, ScreenWeight, ScreenHeight);
    CGFloat selectViewH = 170;
    self.selectView.frame = CGRectMake(margin, (self.bounds.size.height - selectViewH) * 0.5 - margin * 2, self.frame.size.width - margin * 2, selectViewH);
    
    CGSize titleLabelSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size;
    self.titleLabel.frame = CGRectMake((self.selectView.frame.size.width - titleLabelSize.width)/2, margin, titleLabelSize.width, titleLabelSize.height);
    
    CGSize messageLabelSize = [self.messageLabel.text boundingRectWithSize:CGSizeMake(self.selectView.frame.size.width - 2 * margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.messageLabel.font} context:nil].size;
    self.messageLabel.frame = CGRectMake((self.selectView.frame.size.width - messageLabelSize.width)/2, CGRectGetMaxY(self.titleLabel.frame) + margin, messageLabelSize.width, messageLabelSize.height);

    if (self.cancelButtonTitle) {
        self.cancelBtn.frame = CGRectMake(margin, CGRectGetMaxY(self.messageLabel.frame) + margin, (self.selectView.frame.size.width - 3 * margin) * 0.5, 40);
    }
        
    self.otherBtn.frame = CGRectMake(self.cancelBtn ? CGRectGetMaxX(self.cancelBtn.frame) + margin: margin, CGRectGetMaxY(self.messageLabel.frame) + margin,self.cancelBtn ? self.cancelBtn.frame.size.width : self.selectView.frame.size.width - 2 * margin, 40);
    self.selectView.bounds = CGRectMake(0, 0, self.frame.size.width - margin * 2, CGRectGetMaxY(self.cancelBtn ? self.cancelBtn.frame : self.otherBtn.frame) + margin);
    
}

-(void)buttonClick:(UIButton *)button
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(alertView:clickButtonAtIndex:)]) {
        [self.delegate alertView:self clickButtonAtIndex:button.tag];
        
    }
}

//遍历获取当前显示的的控制器
-(UIViewController *)getCurrentController
{
    UIViewController * currentViewController = nil;
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray * windowArray = [UIApplication sharedApplication].windows;
        for (UIWindow * tempWindow in windowArray) {
            if (tempWindow.windowLevel == UIWindowLevelNormal) {
                window = tempWindow;
                break;
            }
        }
    }
    UIView * frontView = [window.subviews objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        currentViewController = nextResponder;
    }else{
        currentViewController = window.rootViewController;
    }
    return currentViewController;
    
}

-(void)show
{
    self.currentVC = [self getCurrentController];
    [self.currentVC.view addSubview:self];
    self.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1.0;
    }];
}

-(void)hidden
{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
        [self removeFromSuperview];
        
    }];
    
    
}


@end
