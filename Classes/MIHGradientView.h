// MIHGradientView.h
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

#import <UIKit/UIKit.h>

/**
 MIHGradientView is UIView subclass which draws a color gradient as background powered by the QuartrCore framework.
 
 For more information about MIHGradientView have a look at http://github.com/hohl/MIHGradientView
 */

@interface MIHGradientView : UIView

/**
 Colors at the start and end point of the gradient.
 */
@property (strong, nonatomic) UIColor *startColor, *endColor;

/**
 Start and end point in a 0,0 to 1,1 coordinate system. 
 Default value is 0,.5 to 1,.5 which will produce a horizontal gradient.
 */
@property (nonatomic) CGPoint startPoint, endPoint;

/**
 Initialises a horizontal color gradient with the passed start and end color.
 
 @param startColor the color at the top
 @param endColor the color at the bottom
 @return the initialized UIView subclass
 */
- (id)initWithColor:(UIColor *)startColor to:(UIColor *)endColor;

@end
