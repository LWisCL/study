//
//  person.h
//  runtimetest
//
//  Created by Lei on 2018/10/21.
//  Copyright © 2018 sinosoft. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface person : NSObject
/*
 笔记：这种大括号形式的生命变量就是用来生命成员变量的不是用来声明属性的  也就是说 这种方法声明出来的成员变量并没有getter和setter方法
 
 
 疑问：
 
 */
{
    person *_father;
    
    person *mother;
}
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *age;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *adress;


@end

NS_ASSUME_NONNULL_END
