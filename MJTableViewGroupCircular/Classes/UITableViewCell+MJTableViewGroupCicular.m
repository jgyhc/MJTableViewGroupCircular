//
//  UITableViewCell+MJTableViewGroupCicular.m
//  MJTableViewGroupCircular_Example
//
//  Created by manjiwang on 2019/5/9.
//  Copyright © 2019 jgyhc. All rights reserved.
//

#import "UITableViewCell+MJTableViewGroupCicular.h"
#import <objc/runtime.h>

@implementation UITableViewCell (MJTableViewGroupCicular)

- (void)addSectionCornerWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor edgeInsets:(UIEdgeInsets)edgeInsets {
    CGRect bounds = CGRectMake(edgeInsets.left, edgeInsets.top, self.contentView.bounds.size.width - edgeInsets.left - edgeInsets.right, self.contentView.bounds.size.height - edgeInsets.top - edgeInsets.bottom);
    //行数
    NSInteger numberOfRows = [tableView numberOfRowsInSection:indexPath.section];
    //绘制曲线
    UIBezierPath *bezierPath = nil;
    
    if (indexPath.row == 0) {
        //为组的第一行时,左上、右上角为圆角
        bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    } else if (indexPath.row == numberOfRows - 1) {
        //为组的最后一行,左下、右下角为圆角
        bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    } else {
        //中间的都为矩形
        bezierPath = [UIBezierPath bezierPathWithRect:bounds];
    }
    //新建一个图层
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.backgroundColor = backgroundColor.CGColor;
    //图层边框路径
    layer.path = bezierPath.CGPath;
    //图层填充色,也就是cell的底色
    layer.fillColor = backgroundColor.CGColor;
    //图层边框线条颜色
    /*
     如果self.tableView.style = UITableViewStyleGrouped时,每一组的首尾都会有一根分割线,目前我还没找到去掉每组首尾分割线,保留cell分割线的办法。
     所以这里取巧,用带颜色的图层边框替代分割线。
     这里为了美观,最好设为和tableView的底色一致。
     设为透明,好像不起作用。
     */
    layer.strokeColor = backgroundColor.CGColor;
    //将图层添加到cell的图层中,并插到最底层
    [self.contentView.layer insertSublayer:layer atIndex:0];
}

@end
