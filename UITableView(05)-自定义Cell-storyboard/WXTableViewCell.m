//
//  WXTableViewCell.m
//  UITableView(05)-自定义Cell-storyboard
//
//  Created by 王旭 on 16/4/25.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXTableViewCell.h"
#import "WXData.h"

@interface WXTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *buyCount;
@property (weak, nonatomic) IBOutlet UILabel *price;

@end

@implementation WXTableViewCell

+(instancetype)cellWithTable:(UITableView *)tableView
{
    static NSString *idCell = @"first";
    
    WXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idCell];
    
    if(cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"UITableCellXib" owner:nil options:nil]lastObject];
    }
    
    return cell;
}

-(void)setData:(WXData *)data
{
    _data = data;
    
    self.icon.image = [UIImage imageNamed:data.icon];
    self.title.text = data.title;
    self.buyCount.text = [NSString stringWithFormat:@"%@人已购买",data.buyCount];;
    self.price.text = [NSString stringWithFormat:@"￥%@",data.price];
}
@end
