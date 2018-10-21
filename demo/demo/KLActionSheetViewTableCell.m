//
//  KLActionSheetViewTableCell.m
//  FanweApp
//
//  Created by 张晓亮 on 2018/10/19.
//  Copyright © 2018 xfg. All rights reserved.
//

#import "KLActionSheetViewTableCell.h"

@implementation KLActionSheetViewTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        [self initViews];
    }

    return self;
}


- (void)initViews {

//    self.selectedBackgroundView = [UIView new];
//    self.selectedBackgroundView.backgroundColor = [UIColor clearColor];

    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];

    self.bottomLineView = [UIView new];
    self.bottomLineView.backgroundColor = colorWithStr(@"eeeeee");
    [self.contentView addSubview:self.bottomLineView];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@(0.5));
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];

    self.centerTitleLable = [UILabel new];
    self.centerTitleLable.textColor = kEduBlackColor;
    self.centerTitleLable.font = kAppPingFangSCMediumTextFont(16);
    self.centerTitleLable.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.centerTitleLable];
    [self.centerTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.equalTo(self.contentView);
     }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
