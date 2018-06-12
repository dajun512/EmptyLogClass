//
//  NSMutableArray+Empty.m
//  PlaceholderInTextView
//
//  Created by pro on 2018/6/12.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import "NSMutableArray+Empty.h"
#import <objc/runtime.h>
@implementation NSMutableArray (Empty)

+(void)load
{
    
    [self exchangeMethod];
}

+(void)exchangeMethod
{

    //*********处理传nil崩溃
    ({
        Method addObjClass1 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
        Method addObjClass2 = class_getInstanceMethod(self, @selector(cxj_insertObject:atIndex:));
        if (addObjClass1 && addObjClass2) {
            method_exchangeImplementations(addObjClass1, addObjClass2);
        }
    });
    
    
    //*********处理数组越界崩溃
    ({
        Method atIndexClass1 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndexedSubscript:));
        Method atIndexClass2 = class_getInstanceMethod(self, @selector(cxj_objectAtIndexedSubscript:));
        if (atIndexClass1 && atIndexClass2) {
            method_exchangeImplementations(atIndexClass1, atIndexClass2);
        }
    });
    
    
    
    
}

//处理数组越界崩溃
- (id)cxj_objectAtIndexedSubscript:(NSUInteger)idx
{

    if (idx >= self.count) {
        return nil;
    }
    return [self cxj_objectAtIndexedSubscript:idx];
}


//处理传nil崩溃
- (void)cxj_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    
    if (index > self.count || !anObject) {
        return; // 过滤到异常部分
    }
    [self cxj_insertObject:anObject atIndex:index];
    
}


@end
