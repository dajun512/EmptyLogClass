//
//  NSDictionary+Empty.m
//  PlaceholderInTextView
//
//  Created by pro on 2018/6/12.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import "NSDictionary+Empty.h"

@implementation NSDictionary (Empty)

+(instancetype)dictionaryWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt
{
    NSMutableArray *validObjs = [NSMutableArray array];
    NSMutableArray *validKeys = [NSMutableArray array];
    
    for (int i=0; i<cnt; i++) {
        if (objects[i] && keys[i]) {
            [validObjs addObject:objects[i]];
            [validKeys addObject:keys[i]];
        }
    }
    return [self dictionaryWithObjects:validObjs forKeys:validKeys];
}




@end
