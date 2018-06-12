//
//  NSArray+Empty.m
//  PlaceholderInTextView
//
//  Created by pro on 2018/6/12.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import "NSArray+Empty.h"
#import <objc/runtime.h>
//    2   CoreFoundation                      0x00000001048ece3d -[__NSArray0 objectAtIndex:] + 93
@implementation NSArray (Empty)

+(void)load
{
    //*********处理数组越界崩溃
    ({
        Method atIndexClass1 = class_getInstanceMethod(NSClassFromString(@"__NSArray0"), @selector(objectAtIndex:));
        Method atIndexClass2 = class_getInstanceMethod(self, @selector(cxj_objectAtIndex:));
        if (atIndexClass1 && atIndexClass2) {
            method_exchangeImplementations(atIndexClass1, atIndexClass2);
        }
    });
}



//处理数组越界崩溃
- (id)cxj_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }
    return [self cxj_objectAtIndex:index];
}


//处理传入nil
+ (instancetype)arrayWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt
{
    NSMutableArray *validObjs = [NSMutableArray array];
    for (int i=0; i<cnt; i++) {
        if (objects[i]) {
            [validObjs addObject:objects[i]];
        }
    }
    return [[NSArray alloc] initWithArray:validObjs];
}




@end
