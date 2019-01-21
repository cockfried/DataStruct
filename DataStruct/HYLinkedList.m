//
//  HYLinkedList.m
//  DataStruct
//
//  Created by Cherami on 2019/1/5.
//  Copyright © 2019 Cherami. All rights reserved.
//

/* 改为用NSMutableSet做 */
#import "HYLinkedList.h"

@interface HYLinkedListNode : NSObject

@property (nonatomic, strong) id data;
@property (nonatomic, strong) HYLinkedListNode *next;

- (instancetype)initWithData:(id)data;

@end


@interface HYLinkedListNode ()

@end

@implementation HYLinkedListNode

- (instancetype)initWithData:(id)data
{
    if (self = [super init]) {
        _data = data;
        _next = nil;
    }
    return self;
}

@end

@interface HYLinkedList ()

@property (nonatomic, strong) HYLinkedListNode *head;
@property (nonatomic, strong) HYLinkedListNode *tial;
@property (nonatomic, assign) NSUInteger count;

@end

@implementation HYLinkedList

- (instancetype)init
{
    if (self = [super init]) {
        [self defaultInit];
    }
    return self;
}

- (void)defaultInit
{
    HYLinkedListNode *node = [[HYLinkedListNode alloc] initWithData:nil];
    _head = _tial = node;
}

- (void)addObject:(id)object
{
    HYLinkedListNode *node = [[HYLinkedListNode alloc] initWithData:object];
    _tial.next = node;
    _tial = node;
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index
{
    HYLinkedListNode *node = _head;
    NSUInteger current = 0;
    while (current < index) {
        node = node.next;
        current++;
    }
    
    HYLinkedListNode *insertNode = [[HYLinkedListNode alloc] initWithData:object];
    insertNode.next = node.next;
    node.next = insertNode;
}

- (void)clear
{
    _head = _tial = [[HYLinkedListNode alloc] initWithData:nil];
}

- (id)firstObject
{
    return _head.next.data;
}

- (id)lastObject
{
    return _tial.data;
}

- (NSUInteger)indexOfObject:(id)object
{
    HYLinkedListNode *node = _head.next;
    NSUInteger index = 0;
    while (node) {
        
        if ([node.data isEqual:object]) {
            return index;
        }
        index++;
        node = node.next;
    }
    
    return (NSUInteger)NSNotFound;
}

- (BOOL)isEmpty
{
    return !_head.next;
}

- (BOOL)isLastObject:(id)object
{
    return _tial.data && [_tial.data isEqual:object];
}

- (id)previousOfObject:(id)object
{
    HYLinkedListNode *node = _head;
    while (node) {
        if ([node.next.data isEqual:object]) {
            return node.data;
        }
        node = node.next;
    }
    return nil;
}

- (void)removeObject:(id)object
{
    HYLinkedListNode *node = _head;
    while (node) {
        if ([node.next.data isEqual:object]) {
            
            node.next = node.next.next;
            if ([self isLastObject:object]) _tial = node;
            
            break;
        } else {
            node = node.next;
        }
    }
}

- (id)objectAtIndex:(NSUInteger)index
{
    NSUInteger currentIndex = 0;
    HYLinkedListNode *node = _head.next;
    while (currentIndex < index && node) {
        node = node.next;
        currentIndex++;
    }
    
    return node.data;
}

@end
