//
//  MyTableViewCell.m
//  Demo
//
//  Created by 刘小二 on 2018/9/11.
//  Copyright © 2018年 forkingdog. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UIView+SetCollapseConstraints.h"
#import <YogaKit/UIView+Yoga.h>
#import <Masonry/Masonry.h>
#import <UIView_FDCollapsibleConstraints/UIView+FDCollapsibleConstraints.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <YYKit/YYKit.h>
IB_DESIGNABLE
@interface MyTableViewCell()
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UILabel * userLabel;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UIImageView *contentImageView;
@end

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化子控件
        [self initViews];
    }
    return self;
    
}

- (void)initView {
    Auto_HotReloadView *hotView = [Auto_HotReloadView new];
    self.auto_hotView = hotView;
    
    [self.contentView addSubview:hotView];
    
    [hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}



- (void)initViews {
    self.titleLabel = [UILabel new];
    self.titleLabel.text = @"Hello worlds";
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(15);
    }];
    self.contentLabel = [UILabel new];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.text = @"你好读书卡速度快死啦地块哈师大哈师大即可拉伸的打大赛dsadasd带回的";
    [self.contentView addSubview:self.contentLabel];
    NSArray *ar= [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.offset(-15);
    }];
    NSMutableArray *tm = [NSMutableArray array];
    for (MASViewConstraint *vc in ar) {
       id v =  [vc valueForKey:@"layoutConstraint"];
        [tm addObject:v];
    }
    self.contentLabel.fd_collapsibleConstraints = @[tm.firstObject];
    
    
    self.contentImageView = [UIImageView new];
    self.contentImageView.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:self.contentImageView];
    [self.contentImageView setCollapseConstraintsWithArray:[self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.lessThanOrEqualTo(self.contentLabel.mas_right);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(8);
    }]];
    self.contentImageView.image = [UIImage imageNamed:@"breaddoge" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    

    self.userLabel = [UILabel new];
    self.userLabel.text = @"小二";
    [self.contentView addSubview:self.userLabel];
    [self.userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.bottom.offset(-15);
        make.top.equalTo(self.contentImageView.mas_bottom).offset(8);
    }];
    
    self.timeLabel = [UILabel new];
    self.timeLabel.text = @"2018年9月12日";
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentLabel.mas_right);
        make.bottom.equalTo(self.userLabel.mas_bottom);
    }];
}
- (void)setEntity:(FDFeedEntity *)entity {
    _entity = entity;
    
    self.titleLabel.text = entity.title;
    self.contentLabel.text = entity.content;
    self.contentLabel.fd_collapsed = !entity.title.length;
//    self.contentImageView.image = entity.imageName.length > 0 ? [UIImage imageNamed:entity.imageName] : nil;
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536741025213&di=53642aca34e8815fb26526739c332a3c&imgtype=0&src=http%3A%2F%2Fimg01.e23.cn%2F2018%2F0912%2F20180912090911853.jpg"] placeholderImage:nil options:SDWebImageAvoidAutoSetImage  completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.contentImageView.image = image;
        [self.contentView layoutIfNeeded];
    }];
    self.contentImageView.fd_collapsed = !entity.imageName.length;
    self.userLabel.text = entity.username;
    self.timeLabel.text = entity.time;
    // 横屏适配
    [self.userLabel sizeToFit];
    [self.timeLabel sizeToFit];
}

- (void)layoutSubviews {
    [super layoutSubviews];
#if TARGET_INTERFACE_BUILDER
    for (UIView *view in self.contentView.subviews) {
        view.backgroundColor = [UIColor yellowColor];
    }
#endif
}

@end
