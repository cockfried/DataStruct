//
//  HYPriorityQueue.m
//  DataStruct
//
//  Created by Cherami on 2019/1/15.
//  Copyright © 2019 Cherami. All rights reserved.
//

#import "HYPriorityQueue.h"

@interface HYHeap : NSObject

@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, copy) NSComparator comparator;
@property (nonatomic, assign) HYHeapOrdering ordering;

@end

@implementation HYHeap

- (instancetype)initWithComparator:(NSComparator)comparator
{
    return [self initWithComparator:comparator ordering:HYHeapOrderingAscending data:nil];
}

- (instancetype)initWithComparator:(NSComparator)comparator data:(NSArray *)data
{
    return [self initWithComparator:comparator ordering:HYHeapOrderingAscending data:data];
}

- (instancetype)initWithComparator:(NSComparator)comparator ordering:(HYHeapOrdering)ordering
{
    return [self initWithComparator:comparator ordering:ordering data:nil];
}

- (instancetype)initWithComparator:(NSComparator)comparator ordering:(HYHeapOrdering)ordering data:(NSArray *)data
{
    if (self = [super init]) {
        _comparator = comparator;
        _ordering = ordering;
        if (!data) _data = [[NSMutableArray alloc] init];
        else _data = data.mutableCopy;
        [self buildHeapIfPossible];
    }
    return self;
}

- (void)buildHeapIfPossible
{
    if (_data.count) {
        [self buildWithArray:_data];
    }
}

- (void)buildWithArray:(NSArray *)array
{
    for (NSInteger index = array.count / 2; index >= 0; index--) {
        [self heapifyWithIndex:index];
    }
}

- (void)heapifyWithIndex:(NSUInteger)index
{
    NSUInteger minIndex = index;
    NSUInteger count = self.data.count;
    
    while (1) {
        NSUInteger leftIndex = [self indexOfLeftChild:index];
        NSUInteger rightIndex = [self indexOfRightChild:index];
        
        if (leftIndex < count && NSOrderedAscending == [self comparison:leftIndex withIndex:index]) {
            minIndex = leftIndex;
        }
        
        if (rightIndex < count && NSOrderedAscending == [self comparison:rightIndex withIndex:minIndex]) {
            minIndex = rightIndex;
        }
        
        if (minIndex == index) {
            break;
        }
        
        [self.data exchangeObjectAtIndex:index withObjectAtIndex:minIndex];
        index = minIndex;
    }
}

- (NSComparisonResult)comparison:(NSUInteger)index1 withIndex:(NSUInteger)index2
{
    id obj1 = [self.data objectAtIndex:index1];
    id obj2 = [self.data objectAtIndex:index2];
    return [self comparison:obj1 withObj:obj2];
}

- (NSComparisonResult)comparison:(id)obj1 withObj:(id)obj2
{
    NSComparisonResult result = self.comparator(obj1, obj2);
    return (self.ordering == HYHeapOrderingAscending) ? result : - result;
}

- (NSUInteger)indexOfLeftChild:(NSUInteger)index
{
    return 2 * index + 1;
}

- (NSUInteger)indexOfRightChild:(NSUInteger)index
{
    return 2 * index + 2;
}

- (NSUInteger)indexOfParent:(NSUInteger)index
{
    return (index == 0) ? 0 : (index - 1) / 2;
}

- (NSUInteger)lastIndex
{
    return self.data.count - 1;
}

- (void)addObject:(id)object
{
    if (!object) return;
    [self.data addObject:object];
    
    NSUInteger index = [self lastIndex];
    while (index > 0) {
        NSUInteger parentIndex = [self indexOfParent:index];
        if (NSOrderedDescending == [self comparison:index withIndex:parentIndex]) break;
        [self.data exchangeObjectAtIndex:index withObjectAtIndex:parentIndex];
        index = parentIndex;
    }
}

- (void)addObjectsFromArray:(NSArray *)otherArray
{
    for (id obj in otherArray) {
        [self addObject:obj];
    }
}

- (id)firstObject
{
    return [self.data firstObject];
}

- (void)removeFirstObject
{
    if (self.data.count) {
        [self removeObjectAtIndex:0];
    }
}

- (id)popFirstObject
{
    if (!self.data.count) return nil;
    
    id obj = [self firstObject];
    [self removeObjectAtIndex:0];
    return obj;
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    [self.data exchangeObjectAtIndex:index withObjectAtIndex:[self lastIndex]];
    [self.data removeLastObject];
    [self heapifyWithIndex:index];
}

- (void)removeAllObjects
{
    [self.data removeAllObjects];
}

- (void)removeObject:(id)object
{
    NSUInteger index = [self.data indexOfObject:object];
    if (index == NSNotFound) return;
    [self removeObjectAtIndex:index];
}

- (void)removeObjectIdenticalTo:(id)anObject
{
    NSUInteger index = [self.data indexOfObjectIdenticalTo:anObject];
    if (index == NSNotFound) return;
    [self removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    [self.data replaceObjectAtIndex:index withObject:anObject];
    [self heapifyWithIndex:index];
}

- (NSUInteger)count
{
    return self.data.count;
}

@end

@interface HYPriorityQueue ()

@property (nonatomic, strong) HYHeap *heap;

@end

@implementation HYPriorityQueue

- (instancetype)initWithComparator:(NSComparator)comparator
{
    return [self initWithComparator:comparator ordering:HYHeapOrderingAscending data:nil];
}

- (instancetype)initWithComparator:(NSComparator)comparator data:(NSArray *)data
{
    return [self initWithComparator:comparator ordering:HYHeapOrderingAscending data:data];
}

- (instancetype)initWithComparator:(NSComparator)comparator ordering:(HYHeapOrdering)ordering
{
    return [self initWithComparator:comparator ordering:ordering data:nil];
}

- (instancetype)initWithComparator:(NSComparator)comparator ordering:(HYHeapOrdering)ordering data:(nullable NSArray *)data
{
    if (self = [super init]) {
        _heap = [[HYHeap alloc] initWithComparator:comparator ordering:ordering data:data];
    }
    return self;
}

- (void)addObject:(id)object
{
    [self.heap addObject:object];
}

- (void)removeFirstObject
{
    [self.heap removeFirstObject];
}

- (id)firstObject
{
    return [self.heap firstObject];
}

- (NSUInteger)count
{
    return [self.heap count];
}

@end
