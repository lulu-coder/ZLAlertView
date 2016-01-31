//
//  ZLAlertVIew.h
//  ZLAlertView
//
//  Created by 张璐 on 16/1/12.
//  Copyright © 2016年 张璐. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZLAlertView;
@protocol ZLAlertViewDelegate <NSObject>

@optional
-(void)alertView:(ZLAlertView *)alertView clickButtonAtIndex:(NSInteger)buttonIndex;

@end
@interface ZLAlertView : UIView
/**
 设置标题
 */
@property(nonatomic,copy)NSString * title;
/**
 设置内容
 */
@property(nonatomic,copy)NSString * message;
/**
 设置取消按钮文字
 */
@property(nonatomic,copy)NSString * cancelButtonTitle;
/**
 设置其他按钮文字
 */
@property(nonatomic,copy)NSString * otherButtonTitle;
/**
 设置标题的颜色
 */
@property(nonatomic,strong)UIColor * titleColor;
/**
 设置标题的字号
 */
@property(nonatomic,strong)UIFont * titleFont;
/**
 设置内容的颜色
 */
@property(nonatomic,strong)UIColor * messageColor;
/**
 设置内容的字号
 */
@property(nonatomic,strong)UIFont * messageFont;
/**
 设置按钮普通状态下文字颜色
 */
@property(nonatomic,strong)UIColor * buttonTextColorNormal;
/**
 设置按钮高亮状态下文字颜色
 */
@property(nonatomic,strong)UIColor * buttonTextColorHighted;
/**
 设置按钮选中状态下文字颜色
 */
@property(nonatomic,strong)UIColor * buttonTextColorSelected;
/**
 设置按钮的字号
 */
@property(nonatomic,strong)UIFont * buttonFont;
/**
 设置按钮普通状态的背景图片
 */
@property(nonatomic,strong)NSString * buttonBgImageNormal;
/**
 设置按钮高亮状态的背景图片
 */
@property(nonatomic,strong)NSString * buttonBgImageHighted;
/**
 设置按钮选中状态的背景图片
 */
@property(nonatomic,strong)NSString * buttonBgImageSelected;
/**
 代理
 */
@property(nonatomic,weak) id<ZLAlertViewDelegate>delegate;

-(void)show;
-(void)hidden;





@end
