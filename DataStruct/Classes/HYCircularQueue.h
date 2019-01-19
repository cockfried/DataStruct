//
//  HYCircularQueue.h
//  DataStruct
//
//  Created by Cherami on 2019/1/16.
//  Copyright © 2019 Cherami. All rights reserved.
// //

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYCircularQueue : NSObject

@property (nonatomic, assign) BOOL disuseWhenFull;

- (instancetype)initWithCapacity:(NSUInteger)capacity;

- (void)addObject:(id)object;

- (void)removeFirstObject;

- (id)firstObject;

- (BOOL)isFull;

- (BOOL)isEmpty;

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object;

- (void)clear;

@end

NS_ASSUME_NONNULL_END
