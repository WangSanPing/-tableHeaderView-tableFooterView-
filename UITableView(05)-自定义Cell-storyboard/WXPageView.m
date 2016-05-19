//
//  WXPageView.m
//  08-分页
//
//  Created by 王旭 on 16/3/27.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXPageView.h"

@interface WXPageView()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *page;

/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation WXPageView

/**
 *  初始化
 *
 *  @return 返回WXPageView
 */
+(instancetype)PageView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

/**
 *  当控件通过代码创建时，会调用该方法。
 *
 *  @param frame
 *
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self setup];
    }
    
    return self;
}

/**
 *  当控件通过nib/storyboard创建时，调用该方法
 */
-(void)awakeFromNib
{
    [self setup];
}

-(void)setup
{
    [self startTime];
}

-(void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    
    for (int i = 0; i < imageNames.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        
        [self.scrollView addSubview:imageView];
    }
    
    self.page.numberOfPages = imageNames.count;
}

/**
 *  View发生改变时调用
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        self.scrollView.subviews[i].frame = CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
    }
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.scrollView.contentSize = CGSizeMake(self.page.numberOfPages * self.frame.size.width, 0);
    self.scrollView.delegate = self;
    
    // 获得scrollview的尺寸
    CGFloat scrollW = self.scrollView.frame.size.width;
    CGFloat scrollH = self.scrollView.frame.size.height;
    
    // 设置pageControl
    CGFloat pageW = 150;
    CGFloat pageH = 40;
    CGFloat pageX = scrollW - pageW;
    CGFloat pageY = scrollH - pageH;
    self.page.frame = CGRectMake(pageX, pageY, pageW, pageH);
    
    // NS_DEPRECATED_IOS(2_0, 3_0)
    // self.scrollView.frame.size.width / 2 是scrollView的X中心点
    // self.scrollView.frame.size.height / 2 是scrollView的Y中心点
    // (self.scrollView.frame.size.height / 2) + self.scrollView.frame.size.height / 3 是从Y的中心点算起再加上三分之一的scrollView高度
    //    self.page.frame = CGRectMake((self.scrollView.frame.size.width / 2) - 20, (self.scrollView.frame.size.height / 2) + self.scrollView.frame.size.height / 3, 50, 20);
    //    NSLog(@"%f",self.scrollView.frame.size.height / 3);
    //    NSLog(@"%f",self.scrollView.frame.size.height / 2);
    
}

/**
 *  开始定时器
 */
-(void)startTime
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/**
 *  结束定时器
 */
-(void)stopTime
{
    [self.timer invalidate];//停止定时器
    self.timer = nil;
}

/**
 *  下一页
 */
-(void)nextPage
{
    NSInteger page = self.page.currentPage + 1;
    
    if(page == self.page.numberOfPages){
        page = 0;
    }
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = page * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:offset animated:YES];
    
//    NSLog(@"nextPage");
}


/**
 *  scrollview滚动时调用
 *
 *  @param scrollView
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width + 0.5;
    self.page.currentPage = page;
}

/**
 *  scrollview开始滚动
 *
 *  @param scrollView
 */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTime];
}

/**
 *  scrollview结束滚动
 *
 *  @param scrollView
 *  @param decelerate
 */
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTime];
}
@end




























