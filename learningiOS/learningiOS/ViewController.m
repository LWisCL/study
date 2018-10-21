//
//  ViewController.m
//  learningiOS
//
//  Created by Lei on 2018/10/22.
//  Copyright © 2018 sinosoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ivartest];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)ivartest
{
    unsigned int count = 0;
    
    Ivar *ivarList  = class_copyIvarList([person class], &count);
    
    for (unsigned int j = 0; j<count; j++) {
        
        Ivar ivar = ivarList[j];
        
        NSLog(@"ivar:%@--%@--%lu",[NSString stringWithUTF8String:ivar_getName(ivar)],[NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)],ivar_getOffset(ivar));
        
    }
    unsigned int propertyCount = 0;
    
    objc_property_t *propertyList = class_copyPropertyList([person class], &propertyCount);
    
    for (unsigned int k = 0; k<propertyCount; k++) {
        
        objc_property_t property = propertyList[k];
        
        NSLog(@"property:%@--%@",[NSString stringWithUTF8String:property_getName(property)],[NSString stringWithUTF8String:property_getAttributes(property)]);
        
        
        
    }
    
    unsigned int methodCount = 0;
    
    Method *methodList = class_copyMethodList([person class], &methodCount);
    
    for (unsigned int l = 0 ; l<methodCount; l++) {
        
        Method method = methodList[l];
        
        //这里需要传入一个字符串数组
        
        char type[512] ;
        
        method_getReturnType(method, type, 0);
        
        NSLog(@"method:%@--%s",NSStringFromSelector(method_getName(method)),type);
        
    }
    
}

@end
