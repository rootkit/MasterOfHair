//
//  ShipintuwenfenleiViewController.m
//  MasterOfHair
//
//  Created by 鞠超 on 16/2/25.
//  Copyright © 2016年 zykj. All rights reserved.
//

#import "ShipintuwenfenleiViewController.h"

#import "FenleiCollectionViewCell.h"
#import "FenleiCollectionReusableView.h"

#import "Shipintuwen_Models.h"
@interface ShipintuwenfenleiViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIButton * btn_all;
@property (nonatomic, strong) UIImageView * image_select;
@property (nonatomic, assign) BOOL isselect;


@property (nonatomic, strong) UICollectionView * collectionView;

//
@property (nonatomic, strong) NSMutableArray * arr_data1;
@property (nonatomic, strong) NSMutableArray * arr_data2;

@end

@implementation ShipintuwenfenleiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [SVProgressHUD showWithStatus:@"加载数据中,请稍等..." ];
    
    [self p_data];
    
    [self p_navi];
    
    [self p_allView];
    
    [self p_setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - navi
- (void)p_navi
{
    _lblTitle.text = [NSString stringWithFormat:@"选择级别"];
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

#pragma mark - 布局

- (void)p_setupView
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    //每个item的大小
    int  item_length = (SCREEN_WIDTH ) / 4.8;
    layout.itemSize = CGSizeMake(item_length, item_length / 2);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    [layout setHeaderReferenceSize:CGSizeMake(SCREEN_WIDTH, 25)];
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64 + 55, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 55) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:self.collectionView];
    
    //2个注册
    [self.collectionView registerClass:[FenleiCollectionViewCell class] forCellWithReuseIdentifier:@"cell_fenlei"];
    
    [self.collectionView registerClass:[FenleiCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cell_HeaderView"];
}

#pragma mark - collection代理
//代理
- (NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.arr_data1.count;
}

- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.arr_data2[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Shipintuwen_Models * model = self.arr_data2[indexPath.section][indexPath.row];
    
    FenleiCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_fenlei" forIndexPath:indexPath];
    
    cell.name.text = model.channel_name;
    
    cell.image.tag = indexPath.section * 10 + indexPath.item;
    cell.name.tag = (indexPath.section + 1) * 100 + indexPath.item;
    
    return cell;
}

//点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Shipintuwen_Models * model = self.arr_data2[indexPath.section][indexPath.row];
    NSLog(@"%@",model.channel_name);
    
    UIImageView * image = [self.view viewWithTag:(indexPath.section * 10 + indexPath.item)];
    image.hidden = NO;
    
    UILabel * label = [self.view viewWithTag:((indexPath.section + 1) * 100 + indexPath.item)];
    label.layer.borderColor = navi_bar_bg_color.CGColor;
    
    //保存
    NSUserDefaults * userdefault = [NSUserDefaults standardUserDefaults];
    [userdefault setObject:model.channel_name forKey:@"channel_name"];
    [userdefault setObject:model.channel_id forKey:@"TuwenFeilei"];

    [self.navigationController popViewControllerAnimated:YES];
    
}

//设置头尾部内容
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    Shipintuwen_Models * model = self.arr_data1[indexPath.section];
    
    UICollectionReusableView *reusableView = nil;
    
    //定制头部视图的内容
    FenleiCollectionReusableView *headerV = (FenleiCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cell_HeaderView" forIndexPath:indexPath];
    
    headerV.name.text = model.channel_name;
    
    reusableView = headerV;
    
    return reusableView;
}
//设置头尾的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.frame.size.width, 25);
}

#pragma mark - 头视图中的 btn
- (void)p_allView
{
    self.btn_all = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    self.btn_all.frame = CGRectMake(10, 64 + 10, SCREEN_WIDTH - 20, 40);
    self.btn_all.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.btn_all.layer.borderColor = [UIColor grayColor].CGColor;
    self.btn_all.layer.borderWidth = 1;
    self.btn_all.layer.cornerRadius = 5;
    [self.btn_all setTitle:@"全部" forState:(UIControlStateNormal)];
    self.btn_all.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.btn_all setTintColor:[UIColor blackColor]];
    self.isselect = 0;
    [self.view addSubview:self.btn_all];
    
    self.image_select = [[UIImageView alloc] initWithFrame:CGRectMake(self.btn_all.frame.size.width - 15, 40 - 15, 15, 15)];
    self.image_select.image = [UIImage imageNamed:@"01sdjjdijsidjs_03"];
    [self.btn_all addSubview:self.image_select];
    self.image_select.hidden = YES;
    
    
    [self.btn_all addTarget:self action:@selector(btn_allAction:) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)btn_allAction:(UIButton *)sender
{
    //    NSLog(@"点击全部");
    
    self.image_select.hidden = NO;
    self.btn_all.layer.borderColor = navi_bar_bg_color.CGColor;
    //    self.isselect = 1;
    
    //保存
    NSUserDefaults * userdefault = [NSUserDefaults standardUserDefaults];
    [userdefault setObject:@"" forKey:@"channel_name"];
    
    [userdefault setObject:@"0" forKey:@"TuwenFeilei"];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - 数据
- (void)p_data
{
    DataProvider * dataprovider=[[DataProvider alloc] init];
    [dataprovider setDelegateObject:self setBackFunctionName:@"getChannels:"];
    
    [dataprovider getChannels];
}

#pragma mark - 商城数据
- (void)getChannels:(id )dict
{
//    NSLog(@"%@",dict);
    [SVProgressHUD dismiss];
    
    self.arr_data1 = nil;
    self.arr_data2 = nil;
    
    if ([dict[@"status"][@"succeed"] intValue] == 1) {
        @try
        {
//            NSLog(@"%@",dict[@"data"][@"channellist"]);
            
            NSArray * arr = dict[@"data"][@"channellist"];
            
            for (NSDictionary * dic in arr.firstObject)
            {
                Shipintuwen_Models * model = [[Shipintuwen_Models alloc] init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [self.arr_data1 addObject:model];
                
                NSMutableArray * arr = [NSMutableArray array];
                
                for (NSDictionary * dict1 in dic[@"sub"])
                {
                    Shipintuwen_Models * model = [[Shipintuwen_Models alloc] init];
                    
                    [model setValuesForKeysWithDictionary:dict1];
                    
                    [arr addObject:model];
                }
                
                [self.arr_data2 addObject:arr];
            }
        }
        @catch (NSException *exception)
        {
            
        }
        @finally
        {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //刷新tableView(记住,要更新放在主线程中)
                
                [self.collectionView reloadData];
            });
        }
    }
    else
    {
        [SVProgressHUD showErrorWithStatus:dict[@"status"][@"message"] ];
    }
}


#pragma mark - 懒加载
- (NSMutableArray *)arr_data1
{
    if(_arr_data1 == nil)
    {
        self.arr_data1 = [NSMutableArray array];
    }
    return _arr_data1;
}

- (NSMutableArray *)arr_data2
{
    if(_arr_data2 == nil)
    {
        self.arr_data2 = [NSMutableArray array];
    }
    return _arr_data2;
}

@end
