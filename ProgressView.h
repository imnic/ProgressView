//
//  ProgressView.h
//  ProgressDemo
//
//  Created by Nic on 14-9-29.
//  Copyright (c) 2014年 coldworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView

@property (nonatomic) CGFloat progress;
@property (nonatomic) CGFloat trackWidth;
@property(nonatomic, retain) UIColor* progressTintColor;
@property(nonatomic, retain) UIColor* trackTintColor;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
