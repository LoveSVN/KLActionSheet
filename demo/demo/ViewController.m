//
//  ViewController.m
//  demo
//
//  Created by 张晓亮 on 2018/10/21.
//  Copyright © 2018 张晓亮. All rights reserved.
//

#import "ViewController.h"
#import "KLActionSheetVC.h"
#import <sys/utsname.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (IBAction)btnClick:(UIButton *)sender {


    KLActionSheetVC *vc = [[KLActionSheetVC alloc] initWithTitles:@[@"拍照",@"从手机相册选择"]];
    vc.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:NO completion:^{

        [vc show];
    }];

    WEAKSELF;
    vc.selectedIndex = ^(NSInteger index) {

        if(0 == index) {

//            [weakSelf getHeadImgViewTakePhone];
        }

        if(1 == index) {

            [weakSelf getHeadImgViewFromLocal];
        }

    };
    
}

- (void)getHeadImgViewFromLocal{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.navigationBar.tintColor = kBlackColor;
    picker.navigationBar.translucent = NO;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.modalPresentationStyle = UIModalTransitionStyleCoverVertical;
    }

    if (self.presentationController) {
        [self.presentationController.presentedViewController dismissViewControllerAnimated:NO completion:NULL];
    }
    [self presentViewController:picker animated:YES completion:nil];


}

@end
