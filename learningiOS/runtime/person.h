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
