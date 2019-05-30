//
//  ViewController.m
//  多线程
//
//  Created by 陈磊 on 2019/5/14.
//  Copyright © 2019 sinosoft. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [GCD gcdtest];
    
}


@end
