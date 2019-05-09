//
//  UITableViewCell+MJTableViewGroupCicular.h
//  MJTableViewGroupCircular_Example
//
//  Created by manjiwang on 2019/5/9.
//  Copyright © 2019 jgyhc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (MJTableViewGroupCicular)

- (void)addSectionCornerWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor edgeInsets:(UIEdgeInsets)edgeInsets;

@end

NS_ASSUME_NONNULL_END
