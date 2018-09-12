//
//  MyTableViewCell.h
//  Demo
//
//  Created by 刘小二 on 2018/9/12.
//  Copyright © 2018年 forkingdog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Auto_HotReloadView.h"
#import "FDFeedEntity.h"
@interface MyTableViewCell : UITableViewCell
@property (nonatomic, weak) Auto_HotReloadView * auto_hotView;
@property (nonatomic, strong) FDFeedEntity * entity;
@end
