//
//  person.m
//  runtimetest
//
//  Created by Lei on 2018/10/21.
//  Copyright © 2018 sinosoft. All rights reserved.
//

#import "person.h"

@implementation person
/*
 笔记：使用@dynamic是用来不让用系统生成的getter和setter的
 
 
 疑问：
 
 */
@dynamic age;
-(instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}
@end
