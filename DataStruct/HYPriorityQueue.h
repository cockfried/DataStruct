//
//  HYPriorityQueue.h
//  DataStruct
//
//  Created by Cherami on 2019/1/15.
//  Copyright © 2019 Cherami. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HYHeapOrdering) {
    HYHeapOrderingAscending,
    HYHeapOrderingDescending
};

@interface HYPriorityQueue : NSObject

- (instancetype)initWithComparator:(NSComparator)comparator;

- (instancetype)initWithComparator:(NSComparator)comparator data:(nullable NSArray *)data;

- (instancetype)initWithComparator:(NSComparator)comparator ordering:(HYHeapOrdering)ordering;

- (instancetype)initWithComparator:(NSComparator)comparator ordering:(HYHeapOrdering)ordering data:(nullable NSArray *)data;

- (void)addObject:(id)object;

- (void)removeFirstObject;

- (id)firstObject;

- (NSUInteger)count;

@end

NS_ASSUME_NONNULL_END
