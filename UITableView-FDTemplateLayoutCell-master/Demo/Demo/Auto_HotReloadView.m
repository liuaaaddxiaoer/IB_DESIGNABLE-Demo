//
//  Auto_HotReloadView.m
//  Demo
//
//  Created by 刘小二 on 2018/9/12.
//  Copyright © 2018年 forkingdog. All rights reserved.
//

#import "Auto_HotReloadView.h"
#import <Masonry/Masonry.h>
IB_DESIGNABLE
@interface Auto_HotReloadView()
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UILabel * userLabel;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UIImageView *contentImageView;
@end
@implementation Auto_HotReloadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    self.titleLabel = [UILabel new];
    self.titleLabel.text = @"Hello worlds";
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(15);
    }];
    self.contentLabel = [UILabel new];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.text = @"你好读书卡速度快死啦地块哈师大哈师大即可拉伸的打大赛dsadasd带回的";
    [self addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
        make.right.offset(-15);
    }];
    
    self.contentImageView = [UIImageView new];
    [self addSubview:self.contentImageView];
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(120);
    }];
    
    self.userLabel = [UILabel new];
    self.userLabel.text = @"小二";
    [self addSubview:self.userLabel];
    [self.userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.bottom.offset(-15);
        make.top.equalTo(self.contentImageView.mas_bottom).offset(8);
    }];
    
    self.timeLabel = [UILabel new];
    self.timeLabel.text = @"2018年9月12日";
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentLabel.mas_right);
        make.bottom.equalTo(self.userLabel.mas_bottom);
    }];
}

- (void)setEntity:(FDFeedEntity *)entity {
    _entity = entity;
    
    self.titleLabel.text = entity.title;
    self.contentLabel.text = entity.content;
    self.contentImageView.image = entity.imageName.length > 0 ? [UIImage imageNamed:entity.imageName] : nil;
    self.userLabel.text = entity.username;
    self.timeLabel.text = entity.time;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *v in self.subviews) {
        v.backgroundColor = [UIColor cyanColor];
    }
}
@end
