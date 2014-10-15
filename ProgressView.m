//
//  ProgressView.m
//  ProgressDemo
//
//  Created by Nic on 14-9-29.
//  Copyright (c) 2014年 coldworks. All rights reserved.
//

#import "ProgressView.h"
#define ProgressAnimationVelocity 200.0
@interface ProgressView ()

@property (nonatomic, strong) UIView *progressView;
@property (nonatomic, strong) UIView *trackView;

@end


@implementation ProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setup];
        [self loadSubviews];
    }
    return self;
}

- (void)setup
{
    _progress = 0.0;
    _trackWidth = 1.0;
    _progressTintColor = [UIColor darkGrayColor];
    _trackTintColor = [UIColor lightGrayColor];
}

- (void)loadSubviews
{
    [self addSubview:self.trackView];
    [self addSubview:self.progressView];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self layoutMySubviews];
}

- (void)layoutMySubviews
{
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    self.trackView.frame = CGRectMake(0, (height - self.trackWidth)/2.0 , width, self.trackWidth);
    self.progressView.frame = CGRectMake(0, (height - self.trackWidth)/2.0 , self.progress*width, self.trackWidth);
}

- (UIView *)progressView
{
    if (_progressView == nil) {
        _progressView = [[UIView alloc] init];
        _progressView.backgroundColor = _progressTintColor;
    }
    return _progressView;
}

- (UIView *)trackView
{
    if (_trackView == nil) {
        _trackView = [[UIView alloc] init];
        _trackView.backgroundColor = _trackTintColor;
    }
    return _trackView;
}

#pragma mark - Setter
- (void)setTrackWidth:(CGFloat)trackWidth
{
    _trackWidth = trackWidth;
    if (trackWidth <= 1.0) {
        _trackWidth = 1.0;
    }
    [self layoutMySubviews];
}

- (void)setProgress:(CGFloat)progress 
{
    [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    CGFloat previousProgress = _progress;
    if (progress > 1.0) {
        _progress = 1.0;
    }
    else if (progress < 0.0)
    {
        _progress = 0.0;
    }
    else
    {
        _progress = progress;
    }
    
    if (animated)
    {
        CGFloat length = fabsf(_progress - previousProgress)*CGRectGetWidth(self.frame);
        [UIView animateWithDuration:length/ProgressAnimationVelocity animations:^{
            [self layoutMySubviews];
        }];
    }
    else
    {
        [self layoutMySubviews];
    }
}


- (void)setProgressTintColor:(UIColor *)progressTintColor
{
    if (progressTintColor == nil) {
        return;
    }
    _progressTintColor = progressTintColor;
    self.progressView.backgroundColor = _progressTintColor;
}

- (void)setTrackTintColor:(UIColor *)trackTintColor
{
    if (trackTintColor == nil) {
        return;
    }
    _trackTintColor = trackTintColor;
    self.trackView.backgroundColor = _trackTintColor;
}

@end
