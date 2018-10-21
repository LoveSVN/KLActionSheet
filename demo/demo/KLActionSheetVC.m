//
//  KLActionSheetVC.m
//  FanweApp
//
//  Created by 张晓亮 on 2018/10/19.
//  Copyright © 2018 xfg. All rights reserved.
//

#import "KLActionSheetVC.h"
#import "KLActionSheetViewTableCell.h"

const CGFloat kItemHeight = 49.0;

@interface KLActionSheetVC ()
@property(nonatomic,strong)KLActionSheetView *atctionSheet;
@property(nonatomic,strong)NSArray *titles;
@end

@implementation KLActionSheetVC


- (instancetype)initWithTitles:(NSArray *)titles {

    self = [super init];
    if (self) {

        self.titles = titles;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.




}

- (void)doTapChange:(UITapGestureRecognizer *)tapGestureRecognizer {

    WEAKSELF;
    [self dissmis:^(BOOL finished) {

         [weakSelf dismissViewControllerAnimated:NO completion:NULL];
    }];


}

- (void)show {

    [self.view setNeedsDisplay];
    WEAKSELF;
    KLActionSheetView *atction = [[KLActionSheetView alloc] initWithTitles:self.titles selectIndex:^(NSInteger index) {

        [weakSelf doTapChange:nil];
        if (weakSelf.selectedIndex) {
            weakSelf.selectedIndex(index);
        }


    } cancle:^{

        [weakSelf doTapChange:nil];

    }];
    atction.useblurEffrct = YES;
    self.atctionSheet = atction;
    atction.width = self.view.width;
    atction.height = atction.selfAdaptionHeight;
    atction.y = self.view.height;
    [UIView animateWithDuration:0.3 animations:^{
        atction.y = self.view.height - atction.selfAdaptionHeight;
    }];

     [self.view addSubview:atction];


    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor clearColor];
    bgView.x = 0;
    bgView.y = 0;
    bgView.width = kScreenW;
    bgView.height = kScreenH - atction.selfAdaptionHeight;
    [self.view addSubview:bgView];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange:)];
    //    self.view.userInteractionEnabled = YES;
    [bgView addGestureRecognizer:tapGestureRecognizer];



}

- (void)dissmis:(void(^)(BOOL finished))complate {

    [UIView animateWithDuration:0.3 animations:^{

        self.atctionSheet.y = self.view.height;
    } completion:^(BOOL finished) {
        complate(finished);
        [self.atctionSheet removeFromSuperview];
    }];



}


@end



@interface KLActionSheetView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *titles;
@property(nonatomic,strong)UIVisualEffectView *effectView;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)UIView *marginView;
@property(nonatomic,strong)UIButton *cancleBtn;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)UIColor *subViewColor;
@property(nonatomic,copy)void(^selectIndex)(NSInteger index);
@property(nonatomic,copy)void(^cancle)();
@end

@implementation KLActionSheetView


- (instancetype)initWithTitles:(NSArray *)titles selectIndex:(void(^)(NSInteger index))selectIndex cancle:(void(^)())cancle {

    self = [super init];

    if (self) {

        self.titles = titles;
        self.selectIndex = selectIndex;
        self.cancle = cancle;
        [self initViews];
    }

    return self;
}

- (void)initViews {

    if (self.useblurEffrct) {

        self.subViewColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    }else
    {
        self.subViewColor = [UIColor whiteColor];
    }

    UIBlurEffect *blurEffrct =[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffrct];
    [self addSubview:effectView];
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.edges.equalTo(self);
    }];
    self.effectView = effectView;


    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScaleW, kScaleH) style:UITableViewStylePlain];
    self.table = table;
    table.delegate = self;
    table.dataSource = self;
    table.height = kItemHeight * self.titles.count;
    table.backgroundColor = self.subViewColor;
    [table registerClass:[KLActionSheetViewTableCell class] forCellReuseIdentifier:@"KLActionSheetViewTableCell"];
    table.delaysContentTouches = NO;
    table.scrollEnabled = NO;
    CGFloat tableHeight = self.titles.count *kItemHeight;
    if (self.titles.count *kItemHeight > kScaleH - 10 - WJKIT_TABBAR_BOTTOM_INSET - kItemHeight - WJKIT_STATUSBAR_HEIGHT) {

        tableHeight = kScaleH - 10 - WJKIT_TABBAR_BOTTOM_INSET - kItemHeight - WJKIT_STATUSBAR_HEIGHT;
        table.scrollEnabled = YES;
    }
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [effectView.contentView addSubview:table];
    [table mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(effectView.mas_top);
        make.left.equalTo(effectView.mas_left);
        make.right.equalTo(effectView.mas_right);
        make.height.equalTo(@(tableHeight));
    }];





    UIView *marginView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 10)];
    [effectView.contentView addSubview:marginView];
    [marginView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(table.mas_bottom);
        make.left.equalTo(effectView.mas_left);
        make.right.equalTo(effectView.mas_right);
        make.height.equalTo(@(10));
    }];
    self.marginView = marginView;
    self.marginView.backgroundColor = self.useblurEffrct?[[UIColor whiteColor] colorWithAlphaComponent:0.5]:colorWithStr(@"eeeeee");


    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [effectView.contentView addSubview:cancleBtn];
    cancleBtn.backgroundColor = self.subViewColor;
    [cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(marginView.mas_bottom);
        make.left.equalTo(effectView.mas_left);
        make.right.equalTo(effectView.mas_right);
        make.height.equalTo(@(kItemHeight));
    }];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBtn setTitleColor:kEduBlackColor forState:UIControlStateNormal];
    cancleBtn.titleLabel.font = kAppPingFangSCMediumTextFont(16);
    [cancleBtn addTarget:self action:@selector(canleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.cancleBtn = cancleBtn;

    UIView *bottomView = [[UIView alloc] init];
    [effectView.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(cancleBtn.mas_bottom);
        make.left.equalTo(effectView.mas_left);
        make.right.equalTo(effectView.mas_right);
        make.height.equalTo(@(WJKIT_TABBAR_BOTTOM_INSET));
        make.bottom.equalTo(self.mas_bottom);
    }];
    bottomView.backgroundColor = self.subViewColor;
    self.bottomView = bottomView;

    self.selfAdaptionHeight = tableHeight + kItemHeight + 10 + WJKIT_TABBAR_BOTTOM_INSET;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.titles.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return kItemHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    KLActionSheetViewTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KLActionSheetViewTableCell" forIndexPath:indexPath];
    
    cell.centerTitleLable.text = self.titles[indexPath.row];
    cell.bottomLineView.hidden = self.titles.count == 1 + indexPath.row?YES:NO;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (self.selectIndex) {
        self.selectIndex(indexPath.row);
    }
    
}



- (void)canleBtnClick {

    if (self.cancle) {
        self.cancle();
    }

}

- (void)setUseblurEffrct:(BOOL)useblurEffrct {
    if (_useblurEffrct != useblurEffrct) {
        _useblurEffrct = useblurEffrct;

        if (useblurEffrct) {

            self.subViewColor = [[UIColor whiteColor] colorWithAlphaComponent:0.9];
        }else
        {
            self.subViewColor = [UIColor whiteColor];
        }

        [self changeSuviewBGColor];
    }
}


- (void)changeSuviewBGColor {

    self.table.backgroundColor = self.subViewColor;
    self.marginView.backgroundColor = self.useblurEffrct?[[UIColor whiteColor] colorWithAlphaComponent:0.7]:colorWithStr(@"eeeeee");
    self.cancleBtn.backgroundColor = self.subViewColor;
    self.bottomView.backgroundColor = self.subViewColor;
}
@end
