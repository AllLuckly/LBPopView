//
//  ViewController.m
//  LBPopView
//
//  Created by chenlei_mac on 15/8/1.
//  Copyright (c) 2015年 Bison. All rights reserved.
//

#import "ViewController.h"

#import "LBPopView.h"

@interface ViewController ()
{
    LBPopView *v;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *img = [[UIImageView alloc]initWithFrame:self.view.bounds];
    img.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:img];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.view.frame.size.width-130, 80, 80, 80);
    
    btn.layer.cornerRadius = 40;
    btn.clipsToBounds = YES;
    [btn setBackgroundImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    v = [[LBPopView alloc]init];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Skipping:) name:@"Skipping" object:nil];
    
}

- (void)Skipping:(NSNotification *)text
{
    if ([text.userInfo[@"1"]integerValue] == 10) {
        ViewController *vc1 = [[ViewController alloc]init];
        
        [self.navigationController pushViewController:vc1 animated:YES];
    }
    else if ([text.userInfo[@"1"]integerValue] == 11) {
        ViewController *vc2 = [[ViewController alloc]init];
        [self.navigationController pushViewController:vc2 animated:YES];

    }else{
        
        ViewController *vc3 = [[ViewController alloc]init];
        [self.navigationController pushViewController:vc3 animated:YES];

    }
    
}

- (void)btnClick
{
    [v showBlueMessage:@"1"];
}


@end
