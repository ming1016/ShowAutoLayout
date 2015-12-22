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

@interface ViewController ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *describeLabel;
@property (nonatomic, strong) UIImageView *iconImageView;

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
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(60);
        make.left.equalTo(self.view).offset(margin);
        make.right.equalTo(self.view).offset(-margin);
        make.height.equalTo(@60);
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

@end
