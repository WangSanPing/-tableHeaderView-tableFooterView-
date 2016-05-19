//
//  WXLoadMoreFooter.m
//  UITableView(05)-自定义Cell-storyboard
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXLoadMoreFooter.h"

@interface WXLoadMoreFooter()
@property (weak, nonatomic) IBOutlet UIButton *loadMoreButton;
@property (weak, nonatomic) IBOutlet UIView *loadingMoreView;

@end

@implementation WXLoadMoreFooter

+(instancetype)LoadMoreFooter
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}


- (IBAction)loadMore:(id)sender {
    self.loadMoreButton.hidden = YES;
    self.loadingMoreView.hidden = NO;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadMore" object:nil];
}

-(void)endLoading
{
    self.loadMoreButton.hidden = NO;
    self.loadingMoreView.hidden = YES;
}
@end
