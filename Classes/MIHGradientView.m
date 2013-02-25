// MIHGradientView.m
//
// Copyright (c) 2013 Michael Hohl. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "MIHGradientView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MIHGradientView

+ (Class)layerClass {
	return [CAGradientLayer class];
}

- (void)setupGradientLayer {
	CAGradientLayer *gradientLayer = (CAGradientLayer *)self.layer;
	gradientLayer.colors = [NSArray arrayWithObjects:(id)self.startColor.CGColor, (id)self.endColor.CGColor, nil];
    gradientLayer.startPoint = self.startPoint;
    gradientLayer.endPoint = self.endPoint;
	self.backgroundColor = [UIColor clearColor];
}

- (id)initWithColor:(UIColor *)color1 to:(UIColor *)color2 {
    self = [super init];
    if (self) {
        _startColor = color1;
        _endColor = color2;
        _startPoint = CGPointMake(.5, 0);
        _endPoint = CGPointMake(.5, 1);
        [self setupGradientLayer];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _startColor = [aDecoder decodeObjectForKey:@"_startColor"];
        _endColor = [aDecoder decodeObjectForKey:@"_endColor"];
        [[aDecoder decodeObjectForKey:@"_startPoint"] getValue:&_startPoint];
        [[aDecoder decodeObjectForKey:@"_endPoint"] getValue:&_endPoint];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_startColor forKey:@"_startColor"];
    [aCoder encodeObject:_endColor forKey:@"_endColor"];
    NSValue *startPointValue = [NSValue value:&_startPoint withObjCType:@encode(CGPoint)];
    [aCoder encodeObject:startPointValue forKey:@"_startPoint"];
    NSValue *endPointValue = [NSValue value:&_endPoint withObjCType:@encode(CGPoint)];
    [aCoder encodeObject:endPointValue forKey:@"_endPoint"];
    [super encodeWithCoder:aCoder];
}

- (void)setStartColor:(UIColor *)startColor
{
    _startColor = startColor;
    [self setupGradientLayer];
}

- (void)setEndColor:(UIColor *)endColor
{
    _endColor = endColor;
    [self setupGradientLayer];
}

- (void)setStartPoint:(CGPoint)startPoint
{
    _startPoint = startPoint;
    [self setupGradientLayer];
}

- (void)setEndPoint:(CGPoint)endPoint
{
    _endPoint = endPoint;
    [self setupGradientLayer];
}

@end
