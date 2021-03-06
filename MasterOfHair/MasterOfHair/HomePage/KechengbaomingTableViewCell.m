
//
//  KechengbaomingTableViewCell.m
//  MasterOfHair
//
//  Created by 鞠超 on 16/1/28.
//  Copyright © 2016年 zykj. All rights reserved.
//

#import "KechengbaomingTableViewCell.h"

@interface KechengbaomingTableViewCell ()

@property (nonatomic, strong) UIImageView * image_icon;

@property (nonatomic, strong) UIView * view_bg;

@end


@implementation KechengbaomingTableViewCell

- (instancetype )initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self p_setupView];
    }
    return self;
}

- (void)p_setupView
{
    self.image = [[UIImageView alloc] init];
    self.image.backgroundColor = [UIColor orangeColor];
    self.image.layer.masksToBounds=YES;
    self.image.layer.cornerRadius=40;
    [self.contentView addSubview:self.image];
    
    self.name = [[UILabel alloc] init];
    self.name.text = @"查看详情 报名";
    self.name.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.name];
    
    self.image_icon = [[UIImageView alloc] init];
    self.image_icon.image = [UIImage imageNamed:@"baomingkecheng"];
    [self.contentView addSubview:self.image_icon];
    
    
    self.view_bg = [[UIView alloc] init];
    self.view_bg.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    [self.contentView addSubview:self.view_bg];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.image.frame = CGRectMake(10, 10, 80, 80);
    
    self.name.frame = CGRectMake(100, 40, SCREEN_WIDTH - 140, 20);
    
    self.image_icon.frame = CGRectMake(CGRectGetMaxX(self.name.frame), self.name.frame.origin.y, 20, 20);
//    self.image_icon.backgroundColor = [UIColor orangeColor];
    
//    self.view_bg.frame = CGRectMake(0, 100, SCREEN_WIDTH, 10);
}



@end

