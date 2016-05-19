//
//  WXData.h
//  UITableView(05)-自定义Cell-storyboard
//
//  Created by 王旭 on 16/4/25.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXData : NSObject

/** buyCount */
@property (nonatomic,strong) NSString *buyCount;

/** icon */
@property (nonatomic,strong) NSString *icon;

/** 价格 */
@property (nonatomic,strong) NSString *price;

/** 产品名 */
@property (nonatomic,strong) NSString *title;

+(instancetype)initWithDic:(NSDictionary *)dic;
@end
