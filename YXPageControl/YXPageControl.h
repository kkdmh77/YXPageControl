//
//  YXPageControl.h
//  PageControl
//
//  Created by zdy on 14-9-30.
//  Copyright (c) 2014年 xinyunlian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PageControlStyleDefault,
    PageControlStyleThumb,
}PageControlStyle;

typedef enum {
    PageAlignmentLeft,
    PageAlignmentCenter,
    PageAlignmentRight
}PageAlignment;

@interface YXPageControl : UIControl

@property (nonatomic, strong) UIColor *coreNormalColor;
@property (nonatomic, strong) UIColor *coreSelectedColor;

@property (nonatomic, strong) UIColor *strokeNormalColor;
@property (nonatomic, strong) UIColor *strokeSelectedColor;

@property (nonatomic, strong) UIImage *thumbNormalImage;
@property (nonatomic, strong) UIImage *thumbSelectedImage;

@property (nonatomic, assign) NSInteger strokeWidth;
@property (nonatomic, assign) NSInteger diameter;           // 直径
@property (nonatomic, assign) NSInteger gapWidth;           // 间距

@property (nonatomic, assign) NSInteger numberOfPages;
@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) BOOL hidesForSinglePage;

@property (nonatomic, assign) PageControlStyle pageStyle;
@property (nonatomic, assign) PageAlignment pageAlignment;
@end
