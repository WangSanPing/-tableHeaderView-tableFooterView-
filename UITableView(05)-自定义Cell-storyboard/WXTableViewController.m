//
//  WXTableViewController.m
//  UITableView(05)-自定义Cell-storyboard
//
//  Created by 王旭 on 16/4/25.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXTableViewController.h"
#import "WXData.h"
#import "WXTableViewCell.h"
#import "WXPageView.h"
#import "WXLoadMoreFooter.h"

@interface WXTableViewController ()

/** List */
@property (nonatomic,strong) NSMutableArray *list;

@end

@implementation WXTableViewController

-(NSMutableArray *)list
{
    if(_list == nil)
    {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"deals.plist" ofType:nil];
        NSArray *dic = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *listData = [[NSMutableArray alloc]init];
        
        for (NSDictionary *item in dic) {
            [listData addObject:[WXData initWithDic:item]];
        }
        
        _list = listData;
    }
    
    return _list;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    WXPageView *pageView = [WXPageView PageView];
    pageView.imageNames = @[@"2c97690e72365e38e3e2a95b934b8dd2",
                            @"5ee372ff039073317a49af5442748071",
                            @"9b437cdfb3e3b542b5917ce2e9a74890",
                            @"37e4761e6ecf56a2d78685df7157f097",
                            @"2010e3a0c7f88c3f5f5803bf66addd93",
                            @"53453be0d2dd458c057286d17f6b9306"];
    
    // 头
    self.tableView.tableHeaderView = pageView;
        
    self.tableView.tableFooterView = [WXLoadMoreFooter LoadMoreFooter];
    
    // 监听通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadMoreDeals) name:@"loadMore" object:nil];
}

/**
 *  一定要移除通知！一定要移除通知！一定要移除通知！
 */
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)loadMoreDeals{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        WXData *deal = [[WXData alloc]init];
        
        deal.icon = @"2c97690e72365e38e3e2a95b934b8dd2";
        deal.title = @"xxxx";
        deal.price =[NSString stringWithFormat:@"%d",arc4random_uniform(1000)];
        deal.buyCount = @"90";
        [self.list addObject:deal];
        
        // 刷新表格
        [self.tableView reloadData];
        
        WXLoadMoreFooter *footer = (WXLoadMoreFooter *)self.tableView.tableFooterView;
        [footer endLoading];
    });
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WXTableViewCell *cell = [WXTableViewCell cellWithTable:tableView];
    
    cell.data = self.list[indexPath.row];
    
    return cell;
}

@end
