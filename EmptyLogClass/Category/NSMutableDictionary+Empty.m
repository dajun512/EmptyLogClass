//
//  NSMutableDictionary+Empty.m
//  PlaceholderInTextView
//
//  Created by pro on 2018/6/12.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import "NSMutableDictionary+Empty.h"
#import <objc/runtime.h>
//    3   CoreFoundation                      0x000000010509574c -[__NSDictionaryM setObject:forKey:] + 1036
@implementation NSMutableDictionary (Empty)

+(void)load
{
    //*********处理传nil崩溃
    ({
        Method setObjClass1 = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKey:));
        Method setObjClass2 = class_getInstanceMethod(self, @selector(cxj_setObject:forKey:));
        if (setObjClass1 && setObjClass2) {
            method_exchangeImplementations(setObjClass1, setObjClass2);
        }
    });
    
    

}


//处理传nil崩溃
- (void)cxj_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (!anObject) {
        return;
    }
    
    [self cxj_setObject:anObject forKey:aKey];
}
@end
