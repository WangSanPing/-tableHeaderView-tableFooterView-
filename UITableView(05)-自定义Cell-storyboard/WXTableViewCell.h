//
//  WXTableViewCell.h
//  UITableView(05)-自定义Cell-storyboard
//
//  Created by 王旭 on 16/4/25.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WXData;

@interface WXTableViewCell : UITableViewCell

/** data */
@property (nonatomic,strong) WXData *data;

+(instancetype)cellWithTable:(UITableView *)tableView;

@end
