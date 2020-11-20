//
//  ViewController.m
//  JKCollectionViewMoreCurve
//
//  Created by 王冲 on 2018/10/30.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "JKCollectionViewCurve.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    JKCollectionViewCurve *collectionViewScrolll = [[JKCollectionViewCurve alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 100)];
    [collectionViewScrolll.dataArray addObjectsFromArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13"]];
    
    __weak typeof(self) weakSelf = self;
    collectionViewScrolll.JKScrollviewBlock = ^() {
        
        TestViewController *testViewController = [[TestViewController alloc]init];
        [weakSelf.navigationController pushViewController:testViewController animated:YES];
    };
    
    [self.view addSubview:collectionViewScrolll];
}


@end
