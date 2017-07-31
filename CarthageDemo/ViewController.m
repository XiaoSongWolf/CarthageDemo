//
//  ViewController.m
//  CarthageDemo
//
//  Created by 张兆卿 on 2017/7/31.
//  Copyright © 2017年 xiaoSong. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface ViewController ()

@property (strong, nonatomic) UILabel *hudLabel;
@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self xs_creatSubViews];
}

#pragma mark -创建并添加子视图
- (void)xs_creatSubViews {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // hud显示的父视图
    self.hudLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 80, width - 25 * 2, 200)];
    self.hudLabel.backgroundColor = [UIColor yellowColor];
    self.hudLabel.text = @"我要显示HUD加载视图...";
    self.hudLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.hudLabel];
    
    // 显示hud按钮
    UIButton *showButton = [UIButton buttonWithType:UIButtonTypeCustom];
    showButton.frame = CGRectMake(35, CGRectGetMaxY(self.hudLabel.frame) + 50, width - 35 * 2, 40);
    [showButton setTitle:@"显示HUD" forState:UIControlStateNormal];
    showButton.backgroundColor = [UIColor redColor];
    showButton.layer.cornerRadius = 5;
    showButton.layer.masksToBounds = YES;
    [showButton addTarget:self action:@selector(xs_hudShowAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showButton];
    
    // 隐藏hud按钮
    UIButton *hideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    hideButton.frame = CGRectMake(35, CGRectGetMaxY(showButton.frame) + 30, width - 35 * 2, 40);
    [hideButton setTitle:@"隐藏HUD" forState:UIControlStateNormal];
    hideButton.backgroundColor = [UIColor redColor];
    hideButton.layer.cornerRadius = 5;
    hideButton.layer.masksToBounds = YES;
    [hideButton addTarget:self action:@selector(xs_hudHideAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hideButton];
}

#pragma mark -显示HUD
- (void)xs_hudShowAction:(UIButton *)hudButton {
    self.hud = [MBProgressHUD showHUDAddedTo:self.hudLabel animated:YES];
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.label.text = @"显示中...";
}

#pragma mark -隐藏HUD
- (void)xs_hudHideAction:(UIButton *)hudButton {
    [self.hud hideAnimated:YES];
}

@end
