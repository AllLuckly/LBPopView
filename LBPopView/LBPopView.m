//
//  LBPopView.m
//  LBPopView
//
//  Created by chenlei_mac on 15/8/1.
//  Copyright (c) 2015年 Bison. All rights reserved.
//
#define itemW  250
#define itemH  140
#define appScreenW     [UIScreen mainScreen].bounds.size.width
#define appScreenH     [UIScreen mainScreen].bounds.size.height

#import "LBPopView.h"

@interface LBPopView()
{
    UIView *_backView;
    UIWindow *_keyWindon;
}
@end

@implementation LBPopView

- (id)init
{
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, 0, itemW, itemH);
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        self.hidden = YES;
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.frame = CGRectMake(0, 0, itemW, 44);
        titleLabel.backgroundColor = [UIColor colorWithRed:236/255.0f green:238/255.0f blue:233/255.0f alpha:1.0];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont boldSystemFontOfSize:18];
        titleLabel.text = @"游戏选择";
        titleLabel.textColor = [UIColor colorWithRed:216/255.0f green:46/255.0f blue:98/255.0f alpha:1.0];
        [self addSubview:titleLabel];
        
        UIButton *deleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        deleBtn.frame = CGRectMake(itemW-20, 5, 15, 15);
        [deleBtn setBackgroundImage:[UIImage imageNamed:@"icon_1_"] forState:UIControlStateNormal];
        [deleBtn addTarget:self action:@selector(deleBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:deleBtn];
        
        
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, appScreenW, appScreenH)];
        _backView.backgroundColor = [UIColor colorWithRed:50.0/255 green:50.0/255 blue:50.0/255 alpha:0.3];
    }
    return self;
}

- (void)deleBtnClick
{
    [_backView removeFromSuperview];
    [self removeFromSuperview];
}

- (void)initUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 55, (itemW-10)/5, (itemW-10)/5);
    btn.layer.cornerRadius = (itemW-10)/5/2;
    btn.clipsToBounds = YES;

    [btn setBackgroundImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageNamed:@"youxicon_axg0_@3x"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 10;
    [self addSubview:btn];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(11, 100, (itemW-10)/3.5, 40)];
    label.text = @"诛仙";
    label.textColor = [UIColor colorWithRed:107/255.0f green:107/255.0f blue:104/255.0f alpha:1.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    [self addSubview:label];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(31+(itemW-10)/5+20, 55, (itemW-10)/5, (itemW-10)/5);
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn1.layer.cornerRadius = (itemW-10)/5/2;
    btn1.clipsToBounds = YES;
    btn1.tag = 11;
    [btn1 setBackgroundImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
//    [btn1 setBackgroundImage:[UIImage imageNamed:@"youxicon_dy0_@3x"] forState:UIControlStateNormal];
    
    [self addSubview:btn1];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(22+(itemW-10)/3.5, 100, (itemW-10)/3.5, 40)];
    label1.text = @"噬神";
    label1.textColor = [UIColor colorWithRed:107/255.0f green:107/255.0f blue:104/255.0f alpha:1.0];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:14];
    [self addSubview:label1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(42+(itemW-10)/5+(itemW-10)/5+40, 55, (itemW-10)/5, (itemW-10)/5);
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn2.tag = 12;
    btn2.layer.cornerRadius = (itemW-10)/5/2;
    btn2.clipsToBounds = YES;
    [btn2 setBackgroundImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
//    [btn2 setBackgroundImage:[UIImage imageNamed:@"youxicon_jz0_@3x"] forState:UIControlStateNormal];
    
    [self addSubview:btn2];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(33+(itemW-10)/3.5+(itemW-10)/3.5, 100, (itemW-10)/3.5, 40)];
    label2.text = @"成魔";
    label2.textColor = [UIColor colorWithRed:107/255.0f green:107/255.0f blue:104/255.0f alpha:1.0];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:14];
    [self addSubview:label2];
}


- (void)showBlueMessage:(NSString *)type
{
    self.hidden = YES;
    if (self.hidden == YES) {
        self.hidden = NO;
        _keyWindon = [UIApplication sharedApplication].keyWindow;
        [_keyWindon addSubview:_backView];
        [_keyWindon addSubview:self];
        
        if ([type integerValue] == 1) {
            [self initUI];
        }else{
            
        }
        self.center = _keyWindon.center;
        [self exChangeOut:self dur:0.2];
    }
}

-(void)exChangeOut:(UIView *)changeOutView dur:(CFTimeInterval)dur{
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.duration = dur;
    
    //animation.delegate = self;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [NSMutableArray array];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    animation.values = values;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    
    [changeOutView.layer addAnimation:animation forKey:nil];
    
}

- (void)btnClick:(UIButton *)sender
{
    [_backView removeFromSuperview];
    [self removeFromSuperview];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%d",(int)sender.tag],@"1", nil];
    //创建通知
    NSNotification *notification =[NSNotification notificationWithName:@"Skipping" object:nil userInfo:dict];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    if (sender.tag == 10) {
        
        NSLog(@"第一个");
        
    }
    if (sender.tag == 11) {
        
        NSLog(@"第二个");
    }
    if (sender.tag == 12) {
        
        NSLog(@"第三个");
    }
    
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, 44);
    CGContextAddLineToPoint(context, itemW, 44);
    [[UIColor lightGrayColor]setStroke];
    CGContextDrawPath(context, kCGPathStroke);
}


@end
