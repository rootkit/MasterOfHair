
//
//  ZhaoxiangViewController.m
//  MasterOfHair
//
//  Created by 鞠超 on 16/2/16.
//  Copyright © 2016年 zykj. All rights reserved.
//

#import "ZhaoxiangViewController.h"



@interface ZhaoxiangViewController () <UITextViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView * scrollView;

@property (nonatomic, strong) UITextView * text_View;
@property (nonatomic, strong) UILabel * label_placeHold;

@property (nonatomic, assign) CGFloat length;

@property (nonatomic, strong) UIView * view_white;
@property (nonatomic, strong) UIImageView * image_1;
@property (nonatomic, strong) UIImageView * image_2;
@property (nonatomic, strong) UIImageView * image_3;
@property (nonatomic, strong) UIImageView * image_4;
@property (nonatomic, strong) UIImageView * image_5;
@property (nonatomic, strong) UIImageView * image_6;

@property (nonatomic, strong) UIButton * btn_1;
@property (nonatomic, strong) UIButton * btn_2;
@property (nonatomic, strong) UIButton * btn_3;
@property (nonatomic, strong) UIButton * btn_4;
@property (nonatomic, strong) UIButton * btn_5;
@property (nonatomic, strong) UIButton * btn_6;


@end

@implementation ZhaoxiangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    _lblTitle.text = [NSString stringWithFormat:@"发布说说"];
    _lblTitle.font = [UIFont systemFontOfSize:19];
    
    [self addLeftButton:@"iconfont-fanhui"];
    
    //右边为定位
    [self addRightbuttontitle:@"发布"];
    _lblRight.font = [UIFont systemFontOfSize:18];
    _lblRight.frame = CGRectMake(SCREEN_WIDTH - 65, 19, 50, 44);
    _btnRight.frame = _lblRight.frame;
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

- (void)clickRightButton:(UIButton *)sender
{
    //    NSLog(@"发布");
    if([self.image_1.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择一张图片再发表" preferredStyle:(UIAlertControllerStyleAlert)];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:action];
    }
    else
    {
        if([self.text_View.text length] == 0)
        {
            self.label_placeHold.hidden = NO;
        }
        [self.text_View resignFirstResponder];
        
        
        NSLog(@"发布成功");
    }
}

#pragma mark - 布局
- (void)p_setupView
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.scrollView.contentSize = CGSizeMake(0, SCREEN_HEIGHT + 30);
    [self.view addSubview:self.scrollView];
    
    
    self.text_View = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    self.text_View.delegate = self;
    self.text_View.font = [UIFont systemFontOfSize:17];
    [self.scrollView addSubview:self.text_View];
    
    self.label_placeHold = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, 100, 20)];
    self.label_placeHold.text = @"说点什么吧...";
    self.label_placeHold.textColor = [UIColor grayColor];
    [self.text_View addSubview:self.label_placeHold];
    
    
    //照片库
    CGFloat lenth_x = (SCREEN_WIDTH - 20 - 20) / 3;
    self.length = lenth_x;
    
    self.view_white = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.text_View.frame) + 10, SCREEN_WIDTH, lenth_x * 2 + 20)];
    self.view_white.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.view_white];
    
    //1
    self.image_1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, lenth_x, lenth_x)];
    self.image_1.image = [UIImage imageNamed:@"shuoshuo111111111"];
    self.image_1.userInteractionEnabled = YES;
    [self.view_white addSubview:self.image_1];
    //手势
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1:)];
    tapGesture1.numberOfTapsRequired = 1; //点击次数
    tapGesture1.numberOfTouchesRequired = 1; //点击手指数
    [self.image_1 addGestureRecognizer:tapGesture1];
    
    
    //2
    self.image_2 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + CGRectGetMaxX(self.image_1.frame), 5, lenth_x, lenth_x)];
    self.image_2.image = [UIImage imageNamed:@"shuoshuo111111111"];
    self.image_2.userInteractionEnabled = YES;
    [self.view_white addSubview:self.image_2];
    //手势
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2:)];
    tapGesture2.numberOfTapsRequired = 1; //点击次数
    tapGesture2.numberOfTouchesRequired = 1; //点击手指数
    [self.image_2 addGestureRecognizer:tapGesture2];
    
    
    
    //3
    self.image_3 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + CGRectGetMaxX(self.image_2.frame), 5, lenth_x, lenth_x)];
    self.image_3.image = [UIImage imageNamed:@"shuoshuo111111111"];
    self.image_3.userInteractionEnabled = YES;
    [self.view_white addSubview:self.image_3];
    //手势
    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture3:)];
    tapGesture3.numberOfTapsRequired = 1; //点击次数
    tapGesture3.numberOfTouchesRequired = 1; //点击手指数
    [self.image_3 addGestureRecognizer:tapGesture3];

    
    
    //4
    self.image_4 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5 + lenth_x + 10, lenth_x, lenth_x)];
    self.image_4.image = [UIImage imageNamed:@"shuoshuo111111111"];
    self.image_4.userInteractionEnabled = YES;
    [self.view_white addSubview:self.image_4];
    //手势
    UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture4:)];
    tapGesture4.numberOfTapsRequired = 1; //点击次数
    tapGesture4.numberOfTouchesRequired = 1; //点击手指数
    [self.image_4 addGestureRecognizer:tapGesture4];
    
    
    
    //5
    self.image_5 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + CGRectGetMaxX(self.image_4.frame), 15 + lenth_x, lenth_x, lenth_x)];
    self.image_5.image = [UIImage imageNamed:@"shuoshuo111111111"];
    self.image_5.userInteractionEnabled = YES;
    [self.view_white addSubview:self.image_5];
    //手势
    UITapGestureRecognizer *tapGesture5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture5:)];
    tapGesture5.numberOfTapsRequired = 1; //点击次数
    tapGesture5.numberOfTouchesRequired = 1; //点击手指数
    [self.image_5 addGestureRecognizer:tapGesture5];
    
    
    
    //6
    self.image_6 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + CGRectGetMaxX(self.image_5.frame), 15 + lenth_x, lenth_x, lenth_x)];
    self.image_6.image = [UIImage imageNamed:@"shuoshuo111111111"];
    self.image_6.userInteractionEnabled = YES;
    [self.view_white addSubview:self.image_6];
    //手势
    UITapGestureRecognizer *tapGesture6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture6:)];
    tapGesture6.numberOfTapsRequired = 1; //点击次数
    tapGesture6.numberOfTouchesRequired = 1; //点击手指数
    [self.image_6 addGestureRecognizer:tapGesture6];
    
    
    
    self.image_2.hidden = YES;
    self.image_3.hidden = YES;
    self.image_4.hidden = YES;
    self.image_5.hidden = YES;
    self.image_6.hidden = YES;
    
}

#pragma mark - 图片
-(void)tapGesture1:(id)sender
{
    if([self.image_1.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
//        NSLog(@"调用相机");
        self.image_1.image = [UIImage imageNamed:@"placeholder_short.jpg"];
        self.image_2.hidden = NO;
        
        self.btn_1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.btn_1.frame = CGRectMake(self.length - 20, 0, 20, 20);
        [self.btn_1 setBackgroundImage:[UIImage imageNamed:@"30px"] forState:(UIControlStateNormal)];
        [self.image_1 addSubview:self.btn_1];
        [self.btn_1 addTarget:self action:@selector(btn_1Action:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    else
    {
        self.image_2.hidden = NO;
    }
}

-(void)tapGesture2:(id)sender
{
    if([self.image_2.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
//        NSLog(@"调用相机");
        self.image_2.image = [UIImage imageNamed:@"placeholder_short.jpg"];
        self.image_3.hidden = NO;
        
        self.btn_2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.btn_2.frame = CGRectMake(self.length - 20, 0, 20, 20);
        [self.btn_2 setBackgroundImage:[UIImage imageNamed:@"30px"] forState:(UIControlStateNormal)];
        [self.image_2 addSubview:self.btn_2];
        [self.btn_2 addTarget:self action:@selector(btn_2Action:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    else
    {
        self.image_3.hidden = NO;
    }
}

-(void)tapGesture3:(id)sender
{
    if([self.image_3.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
//        NSLog(@"调用相机");
        self.image_3.image = [UIImage imageNamed:@"placeholder_short.jpg"];
        self.image_4.hidden = NO;
        
        self.btn_3 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.btn_3.frame = CGRectMake(self.length - 20, 0, 20, 20);
        [self.btn_3 setBackgroundImage:[UIImage imageNamed:@"30px"] forState:(UIControlStateNormal)];
        [self.image_3 addSubview:self.btn_3];
        [self.btn_3 addTarget:self action:@selector(btn_3Action:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    else
    {
        self.image_4.hidden = NO;
    }
}

-(void)tapGesture4:(id)sender
{
    if([self.image_4.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
//        NSLog(@"调用相机");
        self.image_4.image = [UIImage imageNamed:@"placeholder_short.jpg"];
        self.image_5.hidden = NO;
        
        self.btn_4 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.btn_4.frame = CGRectMake(self.length - 20, 0, 20, 20);
        [self.btn_4 setBackgroundImage:[UIImage imageNamed:@"30px"] forState:(UIControlStateNormal)];
        [self.image_4 addSubview:self.btn_4];
        [self.btn_4 addTarget:self action:@selector(btn_4Action:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    else
    {
        self.image_5.hidden = NO;
    }
}

-(void)tapGesture5:(id)sender
{
    if([self.image_5.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
//        NSLog(@"调用相机");
        self.image_5.image = [UIImage imageNamed:@"placeholder_short.jpg"];
        self.image_6.hidden = NO;
        
        self.btn_5 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.btn_5.frame = CGRectMake(self.length - 20, 0, 20, 20);
        [self.btn_5 setBackgroundImage:[UIImage imageNamed:@"30px"] forState:(UIControlStateNormal)];
        [self.image_5 addSubview:self.btn_5];
        [self.btn_5 addTarget:self action:@selector(btn_5Action:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    else
    {
        self.image_6.hidden = NO;
    }
}

-(void)tapGesture6:(id)sender
{
    if([self.image_6.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
//        NSLog(@"调用相机");
        self.image_6.image = [UIImage imageNamed:@"select_down@2x"];
        
        self.btn_6 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.btn_6.frame = CGRectMake(self.length - 20, 0, 20, 20);
        [self.btn_6 setBackgroundImage:[UIImage imageNamed:@"30px"] forState:(UIControlStateNormal)];
        [self.image_6 addSubview:self.btn_6];
        [self.btn_6 addTarget:self action:@selector(btn_6Action:) forControlEvents:(UIControlEventTouchUpInside)];
    }
}


#pragma mark - text代理 和 点击方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.text_View resignFirstResponder];
    
    if([self.text_View.text length] == 0)
    {
        self.label_placeHold.hidden = NO;
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.label_placeHold.hidden = YES;
    
    return YES;
}

#pragma mark - scrollView
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if([self.scrollView isEqual:scrollView])
    {
        [self.text_View resignFirstResponder];
        
        if([self.text_View.text length] == 0)
        {
            self.label_placeHold.hidden = NO;
        }
    }
}

#pragma mark - 删除
- (void)btn_1Action:(UIButton *)sender
{
    if([self.image_2.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
        self.image_1.image = [UIImage imageNamed:@"shuoshuo111111111"];
        self.btn_1.hidden = YES;
        self.image_2.hidden = YES;
    }
    else
    {
        if([self.image_6.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
        {
            if([self.image_5.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
            {
                if([self.image_4.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
                {
                    if([self.image_3.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
                    {
                        self.image_1.image = self.image_2.image;
                        self.btn_2.hidden = YES;
                        self.image_2.image = [UIImage imageNamed:@"shuoshuo111111111"];
                        
                        self.image_3.hidden = YES;
                    }
                    else
                    {
                        self.image_1.image = self.image_2.image;
                        self.image_2.image = self.image_3.image;
                        self.btn_3.hidden = YES;
                        self.image_3.image = [UIImage imageNamed:@"shuoshuo111111111"];
                        
                        self.image_4.hidden = YES;
                    }
                    
                }
                else
                {
                    self.image_1.image = self.image_2.image;
                    self.image_2.image = self.image_3.image;
                    self.image_3.image = self.image_4.image;
                    self.btn_4.hidden = YES;
                    self.image_4.image = [UIImage imageNamed:@"shuoshuo111111111"];
                    
                    self.image_5.hidden = YES;
                }
            }
            else
            {
                self.image_1.image = self.image_2.image;
                self.image_2.image = self.image_3.image;
                self.image_3.image = self.image_4.image;
                self.image_4.image = self.image_5.image;
                self.btn_5.hidden = YES;
                self.image_5.image = [UIImage imageNamed:@"shuoshuo111111111"];
                
                self.image_6.hidden = YES;
            }
        }
        else
        {
            self.image_1.image = self.image_2.image;
            self.image_2.image = self.image_3.image;
            self.image_3.image = self.image_4.image;
            self.image_4.image = self.image_5.image;
            self.image_5.image = self.image_6.image;
            
            self.btn_6.hidden = YES;
            self.image_6.image = [UIImage imageNamed:@"shuoshuo111111111"];
        }
    }
}

- (void)btn_2Action:(UIButton *)sender
{
    if([self.image_3.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
        self.image_2.image = [UIImage imageNamed:@"shuoshuo111111111"];
        self.btn_2.hidden = YES;
        self.image_3.hidden = YES;
    }
    else
    {
        if([self.image_6.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
        {
            if([self.image_5.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
            {
                if([self.image_4.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
                {
                    self.image_2.image = self.image_3.image;
                    self.btn_3.hidden = YES;
                    self.image_3.image = [UIImage imageNamed:@"shuoshuo111111111"];
                    
                    self.image_4.hidden = YES;
                    
                }
                else
                {
                    self.image_2.image = self.image_3.image;
                    self.image_3.image = self.image_4.image;
                    self.btn_4.hidden = YES;
                    self.image_4.image = [UIImage imageNamed:@"shuoshuo111111111"];
                    
                    self.image_5.hidden = YES;
                }
                
            }
            else
            {
                self.image_2.image = self.image_3.image;
                self.image_3.image = self.image_4.image;
                self.image_4.image = self.image_5.image;
                self.btn_5.hidden = YES;
                self.image_5.image = [UIImage imageNamed:@"shuoshuo111111111"];
                
                self.image_6.hidden = YES;
            }
        }
        else
        {
            self.image_2.image = self.image_3.image;
            self.image_3.image = self.image_4.image;
            self.image_4.image = self.image_5.image;
            self.image_5.image = self.image_6.image;
            
            self.btn_6.hidden = YES;
            self.image_6.image = [UIImage imageNamed:@"shuoshuo111111111"];
        }
    }
}

- (void)btn_3Action:(UIButton *)sender
{
    if([self.image_4.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
        self.image_3.image = [UIImage imageNamed:@"shuoshuo111111111"];
        self.btn_3.hidden = YES;
        self.image_4.hidden = YES;
    }
    else
    {
        if([self.image_6.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
        {
            if([self.image_5.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
            {
                self.image_3.image = self.image_4.image;
                self.btn_4.hidden = YES;
                self.image_4.image = [UIImage imageNamed:@"shuoshuo111111111"];
                
                self.image_5.hidden = YES;
            }
            else
            {
                self.image_3.image = self.image_4.image;
                self.image_4.image = self.image_5.image;
                self.btn_5.hidden = YES;
                self.image_5.image = [UIImage imageNamed:@"shuoshuo111111111"];
                
                self.image_6.hidden = YES;
            }
        }
        else
        {
            self.image_3.image = self.image_4.image;
            self.image_4.image = self.image_5.image;
            self.image_5.image = self.image_6.image;
            
            self.btn_6.hidden = YES;
            self.image_6.image = [UIImage imageNamed:@"shuoshuo111111111"];
        }
    }
}

- (void)btn_4Action:(UIButton *)sender
{
    if([self.image_5.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
        self.image_4.image = [UIImage imageNamed:@"shuoshuo111111111"];
        self.btn_4.hidden = YES;
        self.image_5.hidden = YES;
    }
    else
    {
        if([self.image_6.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
        {
            self.image_4.image = self.image_5.image;
            self.btn_5.hidden = YES;
            self.image_5.image = [UIImage imageNamed:@"shuoshuo111111111"];
            
            self.image_6.hidden = YES;
        }
        else
        {
            self.image_4.image = self.image_5.image;
            self.image_5.image = self.image_6.image;
            
            self.btn_6.hidden = YES;
            self.image_6.image = [UIImage imageNamed:@"shuoshuo111111111"];
        }
    }
}

- (void)btn_5Action:(UIButton *)sender
{
    if([self.image_6.image isEqual:[UIImage imageNamed:@"shuoshuo111111111"]])
    {
        self.image_5.image = [UIImage imageNamed:@"shuoshuo111111111"];
        self.btn_5.hidden = YES;
        self.image_6.hidden = YES;
    }
    else
    {
        self.image_5.image = self.image_6.image;
        
        self.image_6.image = [UIImage imageNamed:@"shuoshuo111111111"];
        self.btn_6.hidden = YES;
    }
}

- (void)btn_6Action:(UIButton *)sender
{
    self.image_6.image = [UIImage imageNamed:@"shuoshuo111111111"];
    self.btn_6.hidden = YES;
}







@end