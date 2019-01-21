//
//  HYStack.m
//  DataStruct
//
//  Created by Cherami on 2019/1/16.
//  Copyright © 2019 Cherami. All rights reserved.
//

#import "HYStack.h"

@interface HYStack ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation HYStack

- (instancetype)init
{
    if (self = [super init]) {
        _data = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)push:(id)object
{
    if (!object) return;
    [_data addObject:object];
}

- (void)popObject
{
    if (!_data.count) return;
    [_data removeLastObject];
}

- (id)topObject
{
    return [_data lastObject];
}

- (void)clear
{
    [_data removeAllObjects];
}

- (BOOL)isEmpty
{
    return _data.count == 0;
}

@end
