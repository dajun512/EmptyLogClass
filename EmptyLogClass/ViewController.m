//
//  ViewController.m
//  EmptyLogClass
//
//  Created by pro on 2018/6/12.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *empty = nil;
    
    //普通
    NSArray *emptyArr = @[empty];
    emptyArr[100]; //越界
    
    NSDictionary *emptyDict = @{@"empty":empty};
    emptyDict[@"empty"];
    
    
    //可变
    NSMutableArray *emptyMutableArr = [NSMutableArray array];
    [emptyMutableArr addObject:empty];
    emptyMutableArr[100]; //越界
    
    NSMutableDictionary *emptyMutableDict = [NSMutableDictionary dictionary];
    [emptyMutableDict setObject:empty forKey:@"empty"];
    
    NSLog(@"---------------崩溃算你赢");
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
