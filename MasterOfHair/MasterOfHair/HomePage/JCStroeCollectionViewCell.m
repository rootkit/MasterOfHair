//
//  JCStroeCollectionViewCell.m
//  xitoujiang_ceshi
//
//  Created by 鞠超 on 16/1/18.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCStroeCollectionViewCell.h"

@implementation JCStroeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self p_setupView];
    }
    return self;
}

- (void)p_setupView
{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height / 7 * 4)];
    self.image.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.image];
    
    self.price = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(self.image.frame) + 3, self.contentView.frame.size.width - 10, 17)];
//    self.price.backgroundColor = [UIColor blackColor];
    self.price.text = @"￥ 1111.11";
    self.price.textColor = [UIColor orangeColor];
    self.price.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.price];
    
    self.detail = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(self.price.frame) + 3, self.contentView.frame.size.width - 10, 30)];
//    self.detail.backgroundColor = [UIColor orangeColor];
    self.detail.text = @"VS沙宣VS沙宣VS沙宣VS沙宣VS";
    self.detail.font = [UIFont systemFontOfSize:10];
    self.detail.numberOfLines = 0;
    [self.contentView addSubview:self.detail];
}


@end