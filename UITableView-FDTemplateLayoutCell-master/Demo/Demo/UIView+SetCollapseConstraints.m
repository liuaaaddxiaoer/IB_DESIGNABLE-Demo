//
//  UIView+SetCollapseConstraints.m
//  Demo
//
//  Created by 刘小二 on 2018/9/12.
//  Copyright © 2018年 forkingdog. All rights reserved.
//

#import "UIView+SetCollapseConstraints.h"

#import <Masonry/Masonry.h>
#import <UIView_FDCollapsibleConstraints/UIView+FDCollapsibleConstraints.h>
@implementation UIView (SetCollapseConstraints)
- (void)setCollapseConstraintsWithArray:(NSArray <MASViewConstraint *> *) arr {
    NSMutableArray *tmpArr = [NSMutableArray array];
    
    for (MASViewConstraint *constraintView in arr) {
        id value = [constraintView valueForKeyPath:@"layoutConstraint"];
        
            [tmpArr addObject:value];
    
    }
    
    
    self.fd_collapsibleConstraints = tmpArr.copy;
    
}
@end
