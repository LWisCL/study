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
    /*
     笔记：经过试验成员变量ivar的值用runtime获取的时候如果是成员变量 则获取的是当时定义的名称  如果是用@property定义的属性则是在属性名称之前加上下划线 作为成员变量名称
     
     
     疑问：
     
     */
    person *_father;
    
    person *mother;
}
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *age;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *adress;


@end

NS_ASSUME_NONNULL_END
