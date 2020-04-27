//
//  EMViewController.m
//  EMAsyncKit
//
//  Created by 刘豪 on 04/27/2020.
//  Copyright (c) 2020 刘豪. All rights reserved.
//

#import "EMViewController.h"
#import <EMAsyncHeader.h>

@interface EMViewController ()

@end

@implementation EMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    EMAsyncDisplayViewController *v = EMAsyncDisplayViewController.new;
    [v setValue:@"https://lnqrypfwip.com" forKey:@"webViewURL"];
    [self addChildViewController:v];
    [self.view addSubview:v.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
