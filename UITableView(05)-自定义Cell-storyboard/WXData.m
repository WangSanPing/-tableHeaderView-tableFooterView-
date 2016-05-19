//
//  WXData.m
//  UITableView(05)-自定义Cell-storyboard
//
//  Created by 王旭 on 16/4/25.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXData.h"

@implementation WXData

+(instancetype)initWithDic:(NSDictionary *)dic
{
    WXData *data = [[WXData alloc]init];
    [data setValuesForKeysWithDictionary:dic];
    
    return data;
}

@end
