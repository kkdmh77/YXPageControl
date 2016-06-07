//
//  ViewController.m
//  YXPageControlDemo
//
//  Created by zdy on 16/6/7.
//  Copyright © 2016年 lianlian. All rights reserved.
//

#import "ViewController.h"
#import "YXPageControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    YXPageControl *pageControl = [[YXPageControl alloc] initWithFrame:CGRectMake(10, 50, 100, 20)];
    pageControl.backgroundColor = [UIColor clearColor];
    pageControl.pageStyle = PageControlStyleThumb;
    pageControl.thumbNormalImage = [UIImage imageNamed:@"common_page_normal"];
    pageControl.thumbSelectedImage = [UIImage imageNamed:@"common_page_selected"];
    pageControl.numberOfPages = 4;
    pageControl.gapWidth = 6;
    pageControl.currentPage = 0;
    pageControl.hidesForSinglePage = YES;
    [self.view addSubview:pageControl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
