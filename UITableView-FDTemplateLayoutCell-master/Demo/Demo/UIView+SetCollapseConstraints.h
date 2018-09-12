//
//  UIView+SetCollapseConstraints.h
//  Demo
//
//  Created by 刘小二 on 2018/9/12.
//  Copyright © 2018年 forkingdog. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MASViewConstraint;
@interface UIView (SetCollapseConstraints)
-(void)setCollapseConstraintsWithArray:(NSArray <MASViewConstraint *> *) arr;
@end
