//
//  ViewController.m
//  WKpageView
//
//  Created by 阿拉斯加的狗 on 16/7/30.
//  Copyright © 2016年 阿拉斯加的🐶. All rights reserved.
//

#import "ViewController.h"
#import "WKPageView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WKPageView *pageView = [WKPageView pageView];
    pageView.frame = CGRectMake(30, 30, 300, 130);
    pageView.nameArray = @[@"img_00",@"img_01",@"img_02",@"img_03",@"img_04"];
    pageView.curColor = [UIColor redColor];
    pageView.otherColor = [UIColor grayColor];
    [self.view addSubview:pageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
