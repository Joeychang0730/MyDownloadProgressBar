//
//  SteveZProgressBarView.m
//  04下载进度条
//
//  Created by apple on 15-6-7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "SteveZProgressBarView.h"

@interface SteveZProgressBarView ()
@property (nonatomic, strong) UILabel* lblProgress;
@end

@implementation SteveZProgressBarView

- (UILabel*)lblProgress
{
    if (_lblProgress == nil) {
        _lblProgress = [[UILabel alloc] init];
        _lblProgress.textAlignment = NSTextAlignmentCenter;
        _lblProgress.textColor = [UIColor whiteColor];
        // 把lblProgress添加到view上
        [self addSubview:_lblProgress];
    }
    return _lblProgress;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    NSLog(@"%@====", _lblProgress);
    self.lblProgress.frame = self.bounds;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;

    self.lblProgress.text = [NSString stringWithFormat:@"%.2f%%", progress * 100];

    // 刷新（重绘View）
    [self setNeedsDisplay];
}

// 其实绘制下载进度条，就是要绘制一个弧
- (void)drawRect:(CGRect)rect
{
    // 1. 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2. 创建路径对象
    CGPoint centerP = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - 15;
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:centerP radius:radius startAngle:-M_PI_2 endAngle:M_PI * 2 * self.progress - M_PI_2 clockwise:YES];

    // 添加一根到中心点的线段
    [path addLineToPoint:centerP];

    // 设置线宽
    CGContextSetLineWidth(ctx, 30);
    // 设置显色
    [[UIColor blueColor] set];

    // 设置线头样式
    CGContextSetLineCap(ctx, kCGLineCapRound);

    // 3. 把路径添加到上下文中
    CGContextAddPath(ctx, path.CGPath);

    // 4. 渲染
    //CGContextDrawPath(ctx, kCGPathStroke);
    CGContextDrawPath(ctx, kCGPathFill);
}

@end
