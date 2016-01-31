//
//  ViewController.m
//  ZLAlertView
//
//  Created by 张璐 on 16/1/12.
//  Copyright © 2016年 张璐. All rights reserved.
//

#import "ViewController.h"
#import "ZLAlertView.h"
@interface ViewController ()<ZLAlertViewDelegate>

@property(nonatomic,strong)ZLAlertView * alertViewOne;
@property(nonatomic,strong)ZLAlertView * alertViewTwo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * testBtnOne = [[UIButton alloc]initWithFrame:CGRectMake(70, 100, 260, 60)];
    [testBtnOne setTitle:@"点我出现弹出框---一个按钮情况" forState:UIControlStateNormal];
    [testBtnOne setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testBtnOne addTarget:self action:@selector(testBtnOneClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtnOne];
    
    UIButton * testBtnTwo = [[UIButton alloc]initWithFrame:CGRectMake(70, 180, 260, 60)];
    [testBtnTwo setTitle:@"点我出现弹出框---两个按钮情况" forState:UIControlStateNormal];
    [testBtnTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testBtnTwo addTarget:self action:@selector(testBtnTwoClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtnTwo];
    

}

-(void)testBtnOneClick
{
    self.alertViewOne = [[ZLAlertView alloc]init];
    self.alertViewOne.title = @"标题标题";
    self.alertViewOne.message = @"内容内容内容内容内容内容";
    self.alertViewOne.cancelButtonTitle = nil;
    self.alertViewOne.otherButtonTitle = @"好的";
    self.alertViewOne.delegate = self;
    [self.alertViewOne show];
    
    

}

-(void)testBtnTwoClick
{
    self.alertViewTwo = [[ZLAlertView alloc]init];
    self.alertViewTwo.title = @"标题标题";
    self.alertViewTwo.message = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    self.alertViewTwo.cancelButtonTitle = @"取消";
    self.alertViewTwo.otherButtonTitle = @"好的";
    self.alertViewTwo.delegate = self;
    [self.alertViewTwo show];
    
    
    
}

-(void)alertView:(ZLAlertView *)alertView clickButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == self.alertViewOne) {
        if (buttonIndex == 0) {
            
            [alertView hidden];

        }

    }else if (alertView == self.alertViewTwo)
    {
        if (buttonIndex == 0) {
            [alertView hidden];
        }else{

        [alertView hidden];
        }

    }

}
@end
