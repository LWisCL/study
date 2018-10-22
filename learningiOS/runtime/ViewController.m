//
//  ViewController.m
//  runtime
//
//  Created by Lei on 2018/10/22.
//  Copyright © 2018 sinosoft. All rights reserved.
//

#import "ViewController.h"
#import "person.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self methodTest];
    // Do any additional setup after loading the view, typically from a nib.
}
/*
 笔记：属性=ivar+setter+getter 需要区分二者的区别
 
 
 
 疑问：
 
 */
//获取成员变量列表
-(void)getIvar
{
    unsigned int count = 0;
    
    Ivar *ivarList  = class_copyIvarList([person class], &count);
    
    for (unsigned int j = 0; j<count; j++) {
        
        Ivar ivar = ivarList[j];
        
        NSLog(@"ivar:%@--%@--%lu",[NSString stringWithUTF8String:ivar_getName(ivar)],[NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)],ivar_getOffset(ivar));
        
    }
    
    
    
    
}
//获取属性列表
-(void)getProperty
{
    unsigned int propertyCount = 0;
    
    objc_property_t *propertyList = class_copyPropertyList([person class], &propertyCount);
    
    for (unsigned int k = 0; k<propertyCount; k++) {
        
        objc_property_t property = propertyList[k];
        
        NSLog(@"property:%@--%@",[NSString stringWithUTF8String:property_getName(property)],[NSString stringWithUTF8String:property_getAttributes(property)]);
        
        
        
    }
}
//获取方法列表
-(void)methodTest
{
    
    unsigned int methodCount = 0;
    
    Method *methodList = class_copyMethodList([person class], &methodCount);
    
    
    for (unsigned int l = 0 ; l<methodCount; l++) {
        
        Method method = methodList[l];
        
        /*
         笔记：
         method_getReturnType(Method _Nonnull m, char * _Nonnull dst, size_t dst_len)
         OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0);
         m:method对象
         dst:这个方法会根据method方法的返回值返回相应的返回值描述
         dst_len:返回的描述的所占用空间大小设置 一般
         
         疑问：
         1：char * _Nonnull dst参数为何传入一个数组char type[512]类型就行了？
         
         */
       
        char type[1024];
        
        method_getReturnType(method, type, 1024);
        
        NSLog(@"method:%@--%s",NSStringFromSelector(method_getName(method)),type);
        
    }
   
}
@end
