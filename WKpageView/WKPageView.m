//
//  WKPageView.m
//  WKpageView
//
//  Created by 阿拉斯加的狗 on 16/7/30.
//  Copyright © 2016年 阿拉斯加的🐶. All rights reserved.
//

#import "WKPageView.h"

@interface WKPageView () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic,strong)NSTimer *time;
@end

@implementation WKPageView

+ (instancetype)pageView {

    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];

}

/// 代码创建pageView
- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
            [self setUpUI];
    }

    return self;
}

/// Xib  创建pageView
- (void)awakeFromNib {

    [self setUpUI];
}

- (void)setUpUI {

    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.scrollView.pagingEnabled = YES;
    
    [self startTime];

}

/// 显示图片
- (void)setNameArray:(NSArray *)nameArray {

    _nameArray = nameArray;
    
    //当再次调用此方法时候,移除之前所有的图片
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (int i = 0; i < nameArray.count; i ++) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:nameArray[i]];
        [self.scrollView addSubview:imageView];
        
    }
    
    self.pageControl.numberOfPages = nameArray.count;

}

/// 自动调整scrollView中图片的位置
- (void)layoutSubviews {

    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    
    CGFloat pageW = 100;
    CGFloat pageH = 20;
    
    for (int i = 0; i < self.scrollView.subviews.count; i ++) {
        
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        self.scrollView.contentSize = CGSizeMake(i * scrollViewW, 0);
    }
    
    self.pageControl.frame = CGRectMake(scrollViewW - pageW, scrollViewH - pageH, pageW, pageH);

}

/// 监听scrollView的滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    int page = (self.scrollView.contentOffset.x / self.scrollView.frame.size.width) + 0.5;
    self.pageControl.currentPage = page;
    

}

/// 开始拖拽的时候停止计时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

    [self stopTime];
}

/// 停止进行拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {

    [self startTime];
}

/// 开启定时器
- (void)startTime {
    
    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    self.time = time;
    [[NSRunLoop mainRunLoop] addTimer:time forMode:NSRunLoopCommonModes];
}

/// 关闭定时器
- (void)stopTime {

    [self.time invalidate];
    self.time = nil;
}

/// 跳转到下一页
- (void)nextPage {

    NSUInteger page = self.pageControl.currentPage + 1;
    if (page == self.pageControl.numberOfPages) {
        
        page = 0;
    }
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = page * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:offset animated:YES];
}

- (void)setCurColor:(UIColor *)curColor {

    _curColor = curColor;
    self.pageControl.currentPageIndicatorTintColor = curColor;
}


- (void)setOtherColor:(UIColor *)otherColor {
    
    _otherColor = otherColor;
    self.pageControl.pageIndicatorTintColor = otherColor;
}

@end
