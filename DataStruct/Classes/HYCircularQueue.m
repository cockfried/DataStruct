//
//  HYCircularQueue.m
//  DataStruct
//
//  Created by Cherami on 2019/1/16.
//  Copyright © 2019 Cherami. All rights reserved.
//

#import "HYCircularQueue.h"

@interface HYCircularQueue ()

@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, assign) NSInteger beginIndex;
@property (nonatomic, assign) NSInteger endIndex;
@property (nonatomic, assign) NSUInteger realCount;

@end

@implementation HYCircularQueue

- (instancetype)initWithCapacity:(NSUInteger)capacity
{
    if (self = [super init]) {
        _beginIndex = _endIndex = 0;
        _realCount = capacity + 1;
        _data = [[NSMutableArray alloc] initWithCapacity:_realCount];
        NSUInteger extractedExpr = _realCount;
        for (NSUInteger i = 0; i < extractedExpr; i++) {
            [_data addObject:[NSNull null]];
        }
    }
    return self;
}

- (void)addObject:(id)object
{
    if (!object) return;
    
    if ([self isFull] && !_disuseWhenFull) return;
    
    if ([self isFull]) {_beginIndex = [self increaseBeginIndexWithOffset:1];};
    
    self.data[_endIndex] = object;
    _endIndex = [self increaseEndIndexWithOffSet:1];
}

- (void)removeFirstObject
{
    if ([self count]) {
        _beginIndex = [self increaseBeginIndexWithOffset:1];
    }
}

- (id)firstObject
{
    return [self objectAtIndex:0];
}

- (id)objectAtIndex:(NSUInteger)index
{
    return [_data objectAtIndex:[self increaseBeginIndexWithOffset:index]];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object
{
    if (!object) return;
    if (index < [self count]) {
        [self.data replaceObjectAtIndex:[self increaseBeginIndexWithOffset:index] withObject:object];
    }
}

- (NSUInteger)count
{
    return (_endIndex + _realCount - _beginIndex) % _realCount;
}

- (BOOL)isFull
{
    return _beginIndex == [self increaseEndIndexWithOffSet:1];
}

- (BOOL)isEmpty
{
    return _beginIndex == _endIndex;
}

- (void)clear
{
    _beginIndex = _endIndex = 0;
}

- (NSInteger)increaseIndex:(NSInteger)index withOffset:(NSInteger)offSet
{
    return (index + offSet + _realCount) % _realCount;
}

- (NSInteger)increaseBeginIndexWithOffset:(NSInteger)offset
{
    return [self increaseIndex:_beginIndex withOffset:offset];
}

- (NSInteger)increaseEndIndexWithOffSet:(NSInteger)offset
{
    return [self increaseIndex:_endIndex withOffset:offset];
}

@end
