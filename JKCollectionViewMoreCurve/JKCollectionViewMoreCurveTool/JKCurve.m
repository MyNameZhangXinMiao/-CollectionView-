//
//  JKCurve.m
//  CollectionViewMoreCurve
//
//  Created by 王冲 on 2018/10/29.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "JKCurve.h"

#define titlegay [UIColor colorWithRed:(156)/255.0 green:(160)/255.0 blue:(181)/255.0 alpha:1]
#define whitesmallColorc [UIColor colorWithRed:(250)/255.0 green:(250)/255.0 blue:(250)/255.0 alpha:1]

@interface JKCurve()

@property(nonatomic,strong) UILabel *label;

@property(nonatomic,strong) NSString *labelText;

@end

@implementation JKCurve

- (instancetype)initWithFrame:(CGRect)frame withType:(NSString *)type{
    self = [super initWithFrame:frame];
    if (self) {
        
        _brColor = whitesmallColorc;
        _textColor = titlegay;
        _textSize = 12.f;
        
        self.labelText = type;
        _controlPoint = CGPointMake(self.width, self.height/2);
        [self creatSubViewControlPoint:_controlPoint withType:type];
        
    }
    return self;
}

#pragma mark 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self addSubview:self.label];
    
    NSString *verText = [self verticalString:self.labelText];
    self.label.textColor = _textColor;
    self.label.font = [UIFont systemFontOfSize:_textSize];
    self.label.text = verText;

}

-(void)setTextColor:(UIColor *)textColor{
    
    _textColor = textColor;
}

-(void)setBrColor:(UIColor *)brColor{
    
    _brColor = brColor;
}

-(void)setTextSize:(CGFloat)textSize{
    
    _textSize = textSize;
}

#pragma mark 给字符串的每个字后面加 换行符(\n)
- (NSString *)verticalString:(NSString *)text{
    NSMutableString * str = [[NSMutableString alloc] initWithString:text];
    NSInteger count = str.length;
    for (int i = 1; i < count; i ++) {
        [str insertString:@"\n" atIndex:i*2 - 1];
    }
    return str;
}


- (void)creatSubViewControlPoint:(CGPoint)controlPoint withType:(NSString *)type {
    [self clearDisplayView];
    
    // 重新规划X的位置
    self.label.x = _controlPoint.x/3.0;
    
    //NSLog(@"X的z位置==%f",self.label.x);
    
    //贝塞尔曲线的画法是由起点、终点、控制点三个参数来画的，为了解释清楚这个点，我写了几行代码来解释它
    CGPoint startPoint   = CGPointMake(self.width, 0);
    CGPoint endPoint     = CGPointMake(self.width, self.height);
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5);
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(_controlPoint.x, _controlPoint.y, 5, 5);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:_controlPoint];
    layer.path = path.CGPath;
    layer.fillColor = _brColor.CGColor;
    layer.strokeColor = _brColor.CGColor;
    
    [self.layer addSublayer:layer];
    [self.layer addSublayer:layer1];
    [self.layer addSublayer:layer2];
    [self.layer addSublayer:layer3];
    
}

- (void)setControlPoint:(CGPoint)controlPoint{
    _controlPoint = controlPoint;
    [self creatSubViewControlPoint:_controlPoint withType:@"1"];
    
    
}

- (void)clearDisplayView
{
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
}

-(UILabel *)label{
    
    if (!_label) {
        
        _label = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, 50, self.height))];
        _label.numberOfLines = 0;
        _label.font = [UIFont systemFontOfSize:12.f];
        _label.textColor = _textColor;
    }
    
    return _label;
}

@end

