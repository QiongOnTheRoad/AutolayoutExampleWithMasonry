//
//  Case4Cell.m
//  MasonryExample
//
//  Created by zorro on 15/7/31.
//  Copyright (c) 2015年 tutuge. All rights reserved.
//

#import "Case4Cell.h"
#import "Case4DataEntity.h"
#import "Masonry.h"

@interface Case4Cell ()
@property(nonatomic, strong) UIImageView *avatarImageView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *contentLabel;

@property(nonatomic, strong) Case4DataEntity *dataEntity;
@end

@implementation Case4Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - Public methods

- (void)setupData:(Case4DataEntity *)dataEntity {
    _dataEntity = dataEntity;

    _avatarImageView.image = dataEntity.avatar;
    _titleLabel.text = dataEntity.title;
    _contentLabel.text = dataEntity.content;
}

- (void)setupUI {
    // Avatar
    _avatarImageView = [UIImageView new];
    _avatarImageView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_avatarImageView];
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@44);
        make.left.and.top.equalTo(self.contentView).with.offset(4);
    }];

    CGFloat preferredMaxWidth = [UIScreen mainScreen].bounds.size.width - (16 + 4) * 2 - 44 - 4;

    // Title
    _titleLabel = [UILabel new];
    _titleLabel.backgroundColor = [UIColor lightGrayColor];
    _titleLabel.preferredMaxLayoutWidth = preferredMaxWidth;
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@22);
        make.top.equalTo(self.contentView).with.offset(4);
        make.left.equalTo(_avatarImageView.mas_right).with.offset(4);
        make.right.equalTo(self.contentView).with.offset(-4);
    }];

    // Content
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 0;
    _contentLabel.backgroundColor = [UIColor lightGrayColor];
    _contentLabel.preferredMaxLayoutWidth = preferredMaxWidth;
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
        make.left.equalTo(_avatarImageView.mas_right).with.offset(4);
        make.right.equalTo(self.contentView).with.offset(-4);
        make.bottom.equalTo(self.contentView).with.offset(-4);
    }];

    [_contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

@end
