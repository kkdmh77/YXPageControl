//
//  YXPageControl.m
//  PageControl
//
//  Created by zdy on 14-9-30.
//  Copyright (c) 2014年 xinyunlian. All rights reserved.
//

#import "YXPageControl.h"

#define COLOR_SELECTED [UIColor blueColor]
#define COLOR_NORMAL [UIColor grayColor]

@implementation YXPageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _numberOfPages  = 0;
        _currentPage    = 0;
        
        _strokeWidth    = 2.0f;
        _diameter       = 12.0f;
        _gapWidth       = 10.0f;
        
        _coreNormalColor    = COLOR_NORMAL;
        _coreSelectedColor  = COLOR_SELECTED;
        _strokeNormalColor  = COLOR_SELECTED;
        _strokeSelectedColor= COLOR_NORMAL;
        
        _pageStyle      = PageControlStyleDefault;
        _pageAlignment  = PageAlignmentCenter;
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        _numberOfPages  = 0;
        _currentPage    = 0;
        
        _strokeWidth    = 2.0f;
        _diameter       = 12.0f;
        _gapWidth       = 10.0f;
        
        _coreNormalColor    = COLOR_NORMAL;
        _coreSelectedColor  = COLOR_SELECTED;
        _strokeNormalColor  = COLOR_NORMAL;
        _strokeSelectedColor= COLOR_SELECTED;
        
        _pageStyle      = PageControlStyleDefault;
        _pageAlignment  = PageAlignmentCenter;
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGFloat w = CGRectGetWidth(self.bounds);
    CGFloat h = CGRectGetHeight(self.bounds);
    
    CGFloat allPageWidth = _numberOfPages*[self pageWidth] + MAX((_numberOfPages - 1),0)*_gapWidth;
    
    CGFloat offx = 0.0f;
    
    if (_pageAlignment == PageAlignmentLeft) {
        offx = 0.0f;
    }
    else if (_pageAlignment == PageAlignmentCenter){
        offx = (w - allPageWidth)/2;
    }
    else if (_pageAlignment == PageAlignmentRight) {
        offx = w - allPageWidth;
    }
    
    for (int i = 0; i<_numberOfPages; i++) {
        
        if (i == _currentPage) {
            // currentPage
            if (_pageStyle == PageControlStyleDefault) {
                CGContextSetLineWidth(ctx, _strokeWidth);
                CGContextSetFillColorWithColor(ctx, _coreSelectedColor.CGColor);
                CGContextSetStrokeColorWithColor(ctx, _strokeSelectedColor.CGColor);
                
                CGContextAddArc(ctx, offx + [self pageWidth]/2 + i*([self pageWidth] + _gapWidth), h/2, [self pageWidth]/2, 0, M_PI*2, 0);

                CGContextDrawPath(ctx, kCGPathFill);
            }
            else if (_pageStyle == PageControlStyleThumb) {
                CGRect rect = CGRectMake(offx + i*([self pageWidth] + _gapWidth), (h - [self pageHeight])/2, [self pageWidth], [self pageHeight]);
                [_thumbNormalImage drawInRect:rect];
            }
        }
        else {
            if (_pageStyle == PageControlStyleDefault) {
                CGContextSetLineWidth(ctx, _strokeWidth);
                CGContextSetFillColorWithColor(ctx, _coreNormalColor.CGColor);
                CGContextSetStrokeColorWithColor(ctx, _strokeNormalColor.CGColor);
                
                CGContextAddArc(ctx, offx + [self pageWidth]/2 + i*([self pageWidth] + _gapWidth), h/2, _diameter/2, 0, M_PI*2, 0);
                CGContextDrawPath(ctx, kCGPathFillStroke);
            }
            else if (_pageStyle == PageControlStyleThumb) {
                CGRect rect = CGRectMake(offx + i*([self pageWidth] + _gapWidth), (h - [self pageHeight])/2, [self pageWidth], [self pageHeight]);
                [_thumbSelectedImage drawInRect:rect];
            }
        }
    }
    
    CGContextRestoreGState(ctx);
}

- (CGFloat)pageWidth
{
    CGFloat w = 0.0f;
    if (_pageStyle == PageControlStyleDefault) {
        w = _diameter + _strokeWidth;
    }
    else if (_pageStyle == PageControlStyleThumb) {
        w = _thumbNormalImage.size.width;
    }
    
    return w;
}

- (CGFloat)pageHeight
{
    CGFloat h = 0.0f;
    if (_pageStyle == PageControlStyleDefault) {
        h = _diameter + _strokeWidth;
    }
    else if (_pageStyle == PageControlStyleThumb) {
        h = _thumbNormalImage.size.height;
    }
    
    return h;
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    [self setNeedsDisplay];
}
@end
