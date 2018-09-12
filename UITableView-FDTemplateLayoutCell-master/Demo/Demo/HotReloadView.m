//
//  HotReloadView.m
//  Demo
//
//  Created by 刘小二 on 2018/9/11.
//  Copyright © 2018年 forkingdog. All rights reserved.
//

#import "HotReloadView.h"
#import <YogaKit/UIView+Yoga.h>
IB_DESIGNABLE
@interface HotReloadView()
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UILabel * userLabel;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UIImageView *contentImageView;
@end
@implementation HotReloadView
- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    [self configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
//        yoga.height = YGPercentValue(100);
    }];
    
    UIView *contentView = [UIView new];
    [self addSubview:contentView];
    contentView.backgroundColor = [UIColor redColor];
    [contentView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.height = YGPercentValue(100);
        yoga.padding = YGPointValue(15);
    }];
    
    self.titleLabel = [UILabel new];
//    self.titleLabel.text = @"Hello world";
    self.titleLabel.backgroundColor = [UIColor cyanColor];
    [contentView addSubview:self.titleLabel];
    [self.titleLabel configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
    }];
    
    self.contentLabel = [UILabel new];
    self.contentLabel.numberOfLines = 0;
//    self.contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.contentLabel.backgroundColor = [UIColor cyanColor];
//    self.contentLabel.text = @"This is forkingdog team. Here's our logo?\nGithub: \"forkingdog\"";
    [contentView addSubview:self.contentLabel];
    [self.contentLabel configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.marginTop = YGPointValue(8);
    }];
    
    self.contentImageView = [UIImageView new];
    self.contentImageView.backgroundColor = [UIColor cyanColor];
    [contentView addSubview:self.contentImageView];
    [self.contentImageView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.width = YGPointValue(200);
        yoga.marginTop = YGPointValue(8);
//        yoga.display = YGDisplayNone;
        yoga.aspectRatio = 1.5;
    }];
    
    UIView *bottomWrapper = [UIView new];
    bottomWrapper.backgroundColor = [UIColor blueColor];
    [contentView addSubview:bottomWrapper];
    [bottomWrapper configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.flexDirection = YGFlexDirectionRow;
        yoga.marginTop = YGPointValue(8);
        yoga.justifyContent = YGJustifySpaceBetween;
        
    }];
    self.userLabel = [UILabel new];
//    self.userLabel.text = @"刘小二";
    self.userLabel.backgroundColor = [UIColor cyanColor];
    [bottomWrapper addSubview:self.userLabel];
    [self.userLabel configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
    }];
    self.timeLabel = [UILabel new];
//    self.timeLabel.text = @"2018年9月11日";
    self.timeLabel.backgroundColor = [UIColor cyanColor];
    [bottomWrapper addSubview:self.timeLabel];
    [self.timeLabel configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
    }];
}

- (void)setEntity:(FDFeedEntity *)entity
{
    _entity = entity;
    
    self.titleLabel.text = entity.title;
    self.contentLabel.text = entity.content;
    self.contentImageView.image = entity.imageName.length > 0 ? [UIImage imageNamed:entity.imageName] : nil;
    self.contentImageView.yoga.display = entity.imageName.length > 0 ? YGDisplayFlex : YGDisplayNone;
    self.userLabel.text = entity.username;
    self.timeLabel.text = entity.time;

}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.yoga applyLayoutPreservingOrigin:NO];
}
@end
