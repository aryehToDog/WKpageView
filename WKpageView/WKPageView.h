//
//  WKPageView.h
//  WKpageView
//
//  Created by 阿拉斯加的狗 on 16/7/30.
//  Copyright © 2016年 阿拉斯加的🐶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKPageView : UIView

/**  创建PageView  */
+ (instancetype)pageView;

/**  照片名  */
@property (nonatomic,strong)NSArray *nameArray;

/**  设置当前pageControl的颜色  */
@property (nonatomic,strong)UIColor *curColor;

/**  设置其他pageControl的颜色  */
@property (nonatomic,strong)UIColor *otherColor;

@end
