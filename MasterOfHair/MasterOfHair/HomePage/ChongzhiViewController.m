//
//  ChongzhiViewController.m
//  MasterOfHair
//
//  Created by 鞠超 on 16/1/29.
//  Copyright © 2016年 zykj. All rights reserved.
//

#import "ChongzhiViewController.h"
#import "TXTradePasswordView.h"
#import "SetPayPwdViewController.h"
#import "Pingpp.h"
@interface ChongzhiViewController ()<TXTradePasswordViewDelegate>

@property (nonatomic, strong) UITextField * money;

//btn
@property (nonatomic, strong) UIButton * btn_zhifubo;
@property (nonatomic, strong) UIButton * btn_weixin;
@property (nonatomic,strong) UIButton * btn_myPurse;
@property (nonatomic, strong) UIButton * btn_zhifu;

@end

@implementation ChongzhiViewController
{
    TXTradePasswordView *TXView;
    UIButton * btn_back;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_navi];
    
    [self p_setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - navi
- (void)p_navi
{
    _lblTitle.text = [NSString stringWithFormat:@"充值"];
    _lblTitle.font = [UIFont systemFontOfSize:19];
    
    [self addLeftButton:@"iconfont-fanhui"];
    _lblLeft.text=@"返回";
    _lblLeft.textAlignment=NSTextAlignmentLeft;
}

//返回
- (void)clickLeftButton:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//隐藏tabbar
-(void)viewWillAppear:(BOOL)animated
{
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] hiddenTabBar];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.money resignFirstResponder];
}

#pragma mark - 布局
- (void)p_setupView
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    UIView * view_1 = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + 5, SCREEN_WIDTH, 50)];
    view_1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view_1];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 70, 30)];
    label1.text = @"输入金额";
//    label1.backgroundColor = [UIColor orangeColor];
    [view_1 addSubview:label1];
    
    self.money = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label1.frame) + 15, 10, SCREEN_WIDTH - CGRectGetMaxX(label1.frame) - 30, 30)];
    self.money.placeholder = @"请输入充值金额";
    self.money.clearButtonMode = UITextFieldViewModeAlways;
    self.money.keyboardType = UIKeyboardTypeDecimalPad;
    [view_1 addSubview:self.money];
    
    
    UIView * view_3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(view_1.frame) + 10, SCREEN_WIDTH, 70)];
    view_3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view_3];
    
    UILabel * label_2 = [[UILabel alloc] initWithFrame:CGRectMake(13, 10, SCREEN_WIDTH - 15, 15)];
    label_2.text = @"选择支付方式";
    label_2.textColor = [UIColor grayColor];
    label_2.font = [UIFont systemFontOfSize:13];
    [view_3 addSubview:label_2];
    
    CGFloat length_x = SCREEN_WIDTH / 3;
    //支付宝支付
    self.btn_zhifubo = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn_zhifubo.frame = CGRectMake(15, CGRectGetMaxY(label_2.frame) + 10, 25, 25);
    //    self.btn_zhifubo.backgroundColor = [UIColor orangeColor];
    self.btn_zhifubo.selected = 0;
    [view_3 addSubview:self.btn_zhifubo];
    [self.btn_zhifubo addTarget:self action:@selector(btn_zhifuboAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.btn_zhifubo setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
    
    UILabel * label_myPurse = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.btn_zhifubo.frame) + 5, CGRectGetMaxY(label_2.frame) + 7.5, length_x - CGRectGetMaxX(self.btn_zhifubo.frame) - 5, 30)];
    //    label_myPurse.backgroundColor = [UIColor orangeColor];
    label_myPurse.text = @"支付宝支付";
    label_myPurse.font = [UIFont systemFontOfSize:12];
    [view_3 addSubview:label_myPurse];
    
    //微信支付
    self.btn_weixin = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn_weixin.frame = CGRectMake(30 + length_x, CGRectGetMaxY(label_2.frame) + 10, 25, 25);
    //    self.btn_weixin.backgroundColor = [UIColor orangeColor];
    self.btn_weixin.selected = 0;
    [view_3 addSubview:self.btn_weixin];
    [self.btn_weixin addTarget:self action:@selector(btn_weixinAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.btn_weixin setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
    
    
    UILabel * label_zhifubo = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.btn_weixin.frame) + 5, CGRectGetMaxY(label_2.frame) + 7.5, length_x - CGRectGetMaxX(self.btn_zhifubo.frame) , 30)];
    //    label_zhifubo.backgroundColor = [UIColor orangeColor];
    label_zhifubo.text = @"微信支付";
    label_zhifubo.font = [UIFont systemFontOfSize:12];
    [view_3 addSubview:label_zhifubo];
    
    //钱包支付
    self.btn_myPurse = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.btn_myPurse.frame = CGRectMake(10 + length_x*2, CGRectGetMaxY(label_2.frame) + 10, 25, 25);
    //    btn_myPurse = [UIColor orangeColor];
    self.btn_myPurse.selected = 0;
    [view_3 addSubview:self.btn_myPurse];
    [self.btn_myPurse addTarget:self action:@selector(btn_qianbaoAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.btn_myPurse setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
    
    UILabel * label_zhifubo1 = [[UILabel alloc] initWithFrame:CGRectMake(_btn_myPurse.frame.origin.x+_btn_myPurse.frame.size.width+ 145, CGRectGetMaxY(label_2.frame) + 7.5, length_x - CGRectGetMaxX(self.btn_myPurse.frame) , 30)];
    //    label_zhifubo.backgroundColor = [UIColor orangeColor];
    label_zhifubo1.text = @"钱包支付";
    label_zhifubo1.font = [UIFont systemFontOfSize:12];
    [view_3 addSubview:label_zhifubo1];
    
    
    self.btn_zhifu = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.btn_zhifu.frame = CGRectMake(15, SCREEN_HEIGHT - 55, SCREEN_WIDTH - 30, 45);
    self.btn_zhifu.backgroundColor = navi_bar_bg_color;
    [self.btn_zhifu setTitle:@"立即充值" forState:(UIControlStateNormal)];
    [self.btn_zhifu setTintColor:[UIColor whiteColor]];
    self.btn_zhifu.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.btn_zhifu];
    
    [self.btn_zhifu addTarget:self action:@selector(btn_zhifuAction:) forControlEvents:(UIControlEventTouchUpInside)];

}

#pragma mark - 支付
- (void)btn_zhifuAction:(UIButton *)sender
{
    [self.money resignFirstResponder];
    
    if([self.money.text length] == 0)
    {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入充值金额" preferredStyle:(UIAlertControllerStyleAlert)];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:action];
    }
    else if(self.btn_zhifubo.selected == 0 && self.btn_weixin.selected == 0&& self.btn_myPurse.selected == 0)
    {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择支付方式" preferredStyle:(UIAlertControllerStyleAlert)];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:action];
    }
    else
    {
//        NSLog(@"走支付流程");
        
        NSUserDefaults * userdefault = [NSUserDefaults standardUserDefaults];
        
        DataProvider * dataprovider=[[DataProvider alloc] init];
        
        [dataprovider setDelegateObject:self setBackFunctionName:@"update:"];
        
        NSLog(@"%@",[userdefault objectForKey:@"member_id"]);
        
        if (self.btn_myPurse.selected==1) {
            if (get_sp(@"wallet_password")==nil) {
                SetPayPwdViewController * setPayPWD=[[SetPayPwdViewController alloc] init];
                setPayPWD.fatherVC=self;
                [self.navigationController pushViewController:setPayPWD animated:YES];
                return;
            }
            //输入支付密码
            TXView = [[TXTradePasswordView alloc]initWithFrame:CGRectMake(0, 100,SCREEN_WIDTH, 200) WithTitle:@"请输入支付密码"];
            TXView.tag=1;
            TXView.backgroundColor=[UIColor whiteColor];
            TXView.TXTradePasswordDelegate = self;
            if (![TXView.TF becomeFirstResponder])
            {
                //成为第一响应者。弹出键盘
                [TXView.TF becomeFirstResponder];
            }
            btn_back=[[UIButton alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49)];
            btn_back.backgroundColor=[UIColor lightGrayColor];
            [self.view addSubview:btn_back];
            
            [self.view addSubview:TXView];
            
            return;
        }
        
        if(self.btn_weixin.selected == 1)
        {
            [dataprovider createWithMember_id:[userdefault objectForKey:@"member_id"] pay_total:self.money.text pay_method:@"3" andwallet_password:@""];
        }
        else
        {
            [dataprovider createWithMember_id:[userdefault objectForKey:@"member_id"] pay_total:self.money.text pay_method:@"2" andwallet_password:@""];
        }
        [SVProgressHUD showWithStatus:@"请稍等..."];
        
    }
    
}
-(void)TXTradePasswordView:(TXTradePasswordView *)view WithPasswordString:(NSString *)Password
{
    [btn_back removeFromSuperview];
    [TXView removeFromSuperview];
    
    DataProvider * dataprovider=[[DataProvider alloc] init];
    
    [dataprovider setDelegateObject:self setBackFunctionName:@"update:"];
    
    [dataprovider createWithMember_id:get_sp(@"member_id") pay_total:self.money.text pay_method:@"1" andwallet_password:Password];
    
}
- (void)btn_qianbaoAction:(UIButton *)sender
{
    if(sender.selected == 0)
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"01_03＿_06"] forState:(UIControlStateNormal)];
        sender.selected = 1;
        
        self.btn_zhifubo.selected = 0;
        [self.btn_zhifubo setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
        self.btn_weixin.selected = 0;
        [self.btn_weixin setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
    }
    else
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
        sender.selected = 0;
    }
}
#pragma mark - 数据
- (void)update:(id )dict
{
    NSLog(@"%@",dict);

    [SVProgressHUD dismiss];
    
    if ([dict[@"status"][@"succeed"] intValue] == 1) {
        @try
        {
            DLog(@"%@",dict[@"data"][@"charge"])
            if ([NSString stringWithFormat:@"%@",dict[@"data"][@"charge"]].length>5) {
                NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dict[@"data"][@"charge"] options:NSJSONWritingPrettyPrinted error:nil];
                NSString* str_data = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                
                [Pingpp createPayment:str_data
                       viewController:self
                         appURLScheme:@"MasterOfHair.zykj"
                       withCompletion:^(NSString *result, PingppError *error) {
                           if ([result isEqualToString:@"success"]) {
                               // 支付成功
                               [self.navigationController popViewControllerAnimated:YES];
                               [SVProgressHUD showSuccessWithStatus:@"支付成功~"];
                           } else {
                               // 支付失败或取消
                               NSLog(@"Error: code=%lu msg=%@", (unsigned long)error.code, [error getMsg]);
                               [SVProgressHUD showErrorWithStatus:@"支付失败~" ];
                               return ;
                           }
                       }];
            }
            [self.navigationController popViewControllerAnimated:YES];
            [SVProgressHUD showSuccessWithStatus:@"支付成功~"];
            
        }
        @catch (NSException *exception)
        {
            
        }
        @finally
        {
            
        }
    }
    else
    {
        [SVProgressHUD showErrorWithStatus:dict[@"status"][@"message"] ];
    }
}



#pragma mark - btn点击方法
- (void)btn_zhifuboAction:(UIButton *)sender
{
    [self.money resignFirstResponder];
    
    if(sender.selected == 0)
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"01_03＿_06"] forState:(UIControlStateNormal)];
        sender.selected = 1;
        
        self.btn_weixin.selected = 0;
        [self.btn_weixin setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
        self.btn_myPurse.selected = 0;
        [self.btn_myPurse setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
    }
    else
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
        sender.selected = 0;
    }
}

- (void)btn_weixinAction:(UIButton *)sender
{
    [self.money resignFirstResponder];
    
    if(sender.selected == 0)
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"01_03＿_06"] forState:(UIControlStateNormal)];
        sender.selected = 1;
        
        self.btn_zhifubo.selected = 0;
        [self.btn_zhifubo setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
        self.btn_myPurse.selected = 0;
        [self.btn_myPurse setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
    }
    else
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"01_03＿_03"] forState:(UIControlStateNormal)];
        sender.selected = 0;
    }
}









@end
