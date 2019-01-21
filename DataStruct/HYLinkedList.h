//
//  HYLinkedList.h
//  DataStruct
//
//  Created by Cherami on 2019/1/5.
//  Copyright © 2019 Cherami. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYLinkedList : NSObject

- (instancetype)init;

- (BOOL)isEmpty;

- (BOOL)isLastObject:(id)object;

- (NSUInteger)indexOfObject:(id)object;

- (id)previousOfObject:(id)object;

- (void)removeObject:(id)object;

- (void)insertObject:(id)object atIndex:(NSUInteger)index;

- (void)addObject:(id)object;

- (void)clear;

- (id)firstObject;

- (id)lastObject;

- (id)objectAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
