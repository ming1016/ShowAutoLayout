//
//  ViewController.m
//  showautolayout
//
//  Created by DaiMing on 15/12/21.
//  Copyright © 2015年 Starming. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

static CGFloat const margin = 10;
static NSString * const redLabelString = @"戴铭";
static NSString * const blueLabelString = @"www.starming.com站长";
static NSString * const subLeftString = @"iPhone“微博娃娃”和“已阅”开发者";
static NSString * const subRightString = @"喜欢画画,instagram帐号ming1016";

@interface ViewController ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *describeLabel;
@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UIView *subHelperView;
@property (nonatomic, strong) UILabel *subLeftLabel;
@property (nonatomic, strong) UIView *subSeparateView;
@property (nonatomic, strong) UILabel *subRightLabel;

@property (nonatomic, strong) UISlider *adjustSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.describeLabel];
    [self.contentView addSubview:self.iconImageView];
    
    [self.contentView addSubview:self.subHelperView];
    [self.subHelperView addSubview:self.subLeftLabel];
    [self.subHelperView addSubview:self.subSeparateView];
    [self.subHelperView addSubview:self.subRightLabel];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(60);
        make.left.equalTo(self.view).offset(margin);
        make.right.equalTo(self.view).offset(-margin);
        make.height.equalTo(@90);
    }];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(margin);
        make.left.equalTo(self.contentView).offset(margin);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImageView.mas_right).offset(margin);
        make.top.equalTo(self.avatarImageView).offset(10);
    }];
    [self.describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(margin);
        make.top.equalTo(self.nameLabel);
    }];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.describeLabel.mas_right).offset(margin);
        make.top.equalTo(self.nameLabel);
        make.size.mas_equalTo(CGSizeMake(30, 20));
        make.right.lessThanOrEqualTo(self.contentView).offset(-margin);
    }];
    
    [self.subHelperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(margin);
        make.left.equalTo(self.nameLabel);
        make.right.equalTo(self.contentView).offset(-margin);
    }];
    [self.subLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subHelperView);
        make.left.equalTo(self.subHelperView);
        make.width.greaterThanOrEqualTo(@100);
    }];
    [self.subSeparateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subLeftLabel).offset(6);
        make.left.equalTo(self.subLeftLabel.mas_right).offset(margin);
        make.size.mas_equalTo(CGSizeMake(15, 2));
    }];
    [self.subRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subLeftLabel);
        make.left.equalTo(self.subSeparateView.mas_right).offset(margin);
        make.width.greaterThanOrEqualTo(@100);
        make.right.lessThanOrEqualTo(self.subHelperView).offset(-margin);
    }];
    
    //slider
    [self.view addSubview:self.adjustSlider];
    [self.adjustSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_bottom).offset(margin);
        make.left.equalTo(self.view).offset(margin);
        make.right.equalTo(self.view).offset(-margin);
    }];
}

#pragma mark - private
- (void)updateAdjustSliderValue:(id)sender {
    if ([sender isKindOfClass:[UISlider class]]) {
        UISlider *slider = sender;
        float f = slider.value;
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(f);
        }];
    }
}

#pragma mark - getter
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 4;
        _contentView.layer.shadowOffset = CGSizeMake(0, 0.5);
        _contentView.layer.shadowColor = [UIColor colorWithWhite:0.000 alpha:100].CGColor;
        _contentView.layer.shadowOpacity = 0.4;
        _contentView.layer.shadowRadius = 4;
    }
    return _contentView;
}
- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
        [_avatarImageView setImage:[UIImage imageNamed:@"avatar"]];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
        _avatarImageView.backgroundColor = [UIColor lightGrayColor];
        _avatarImageView.clipsToBounds = YES;
        _avatarImageView.layer.cornerRadius = 35/2;
    }
    return _avatarImageView;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor orangeColor];
        _nameLabel.text = redLabelString;
        [_nameLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _nameLabel;
}
- (UILabel *)describeLabel {
    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.font = [UIFont systemFontOfSize:14];
        _describeLabel.textColor = [UIColor grayColor];
        _describeLabel.text = blueLabelString;
        [_describeLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _describeLabel;
}
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        [_iconImageView setImage:[UIImage imageNamed:@"starmingicon"]];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImageView;
}
- (UISlider *)adjustSlider {
    if (!_adjustSlider) {
        _adjustSlider = [[UISlider alloc] init];
        _adjustSlider.minimumValue = margin;
        _adjustSlider.maximumValue = 200;
        _adjustSlider.minimumTrackTintColor = [UIColor lightGrayColor];
        [_adjustSlider addTarget:self action:@selector(updateAdjustSliderValue:) forControlEvents:UIControlEventValueChanged];
    }
    return _adjustSlider;
}
- (UIView *)subHelperView {
    if (!_subHelperView) {
        _subHelperView = [[UIView alloc] init];
    }
    return _subHelperView;
}
- (UILabel *)subLeftLabel {
    if (!_subLeftLabel) {
        _subLeftLabel = [[UILabel alloc] init];
        _subLeftLabel.font = [UIFont systemFontOfSize:14];
        _subLeftLabel.textColor = [UIColor grayColor];
        _subLeftLabel.text = subLeftString;
        [_subLeftLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _subLeftLabel;
}
- (UIView *)subSeparateView {
    if (!_subSeparateView) {
        _subSeparateView = [[UIView alloc] init];
        _subSeparateView.backgroundColor = [UIColor grayColor];
        [_subSeparateView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _subSeparateView;
}
- (UILabel *)subRightLabel {
    if (!_subRightLabel) {
        _subRightLabel = [[UILabel alloc] init];
        _subRightLabel.font = [UIFont systemFontOfSize:14];
        _subRightLabel.textColor = [UIColor grayColor];
        _subRightLabel.text = subRightString;
        [_subRightLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _subRightLabel;
}


@end
