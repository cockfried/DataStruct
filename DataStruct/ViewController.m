//
//  ViewController.m
//  DataStruct
//
//  Created by Cherami on 2019/1/5.
//  Copyright © 2019 Cherami. All rights reserved.
//

#import "ViewController.h"

#import "HYPriorityQueue.h"
#import "HYLinkedList.h"
#import "HYCircularQueue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self testLinkList];
//    [self testPriorityQueue];
    
    [self testCircularQueue];
}

- (void)testCircularQueue
{
    HYCircularQueue *circularQueue = [[HYCircularQueue alloc] initWithCapacity:5];
    circularQueue.disuseWhenFull = YES;
    
    for (NSUInteger i = 0; i < 8; i++) {
        [circularQueue addObject:@(i)];
    }
    
    for (NSUInteger i = 0; i < 5; i++) {
        NSLog(@"first object is %@",[circularQueue firstObject]);
        [circularQueue removeFirstObject];
    }
}

- (void)testLinkList
{
    HYLinkedList *list = [[HYLinkedList alloc] init];
    
    for (NSInteger i = 0; i < 10; i++) {
        [list addObject:@(i).stringValue];
    }
    
    
    [list removeObject:@"0"];
    
    NSLog(@"last object is %@",[list firstObject]);
    
    for (NSInteger i = 0; i < 10; i++) {
        NSLog(@"%@",[list objectAtIndex:i]);
    }
}

- (void)testPriorityQueue
{
    HYPriorityQueue *priorityQueue = [[HYPriorityQueue alloc] initWithComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    
    [priorityQueue addObject:@(101)];
    [priorityQueue addObject:@(100)];
    [priorityQueue addObject:@(5)];
    [priorityQueue addObject:@(6)];
    [priorityQueue addObject:@(2)];
    [priorityQueue addObject:@(20)];
    [priorityQueue addObject:@(30)];
    
    while (priorityQueue.count) {
        NSLog(@"%@",[priorityQueue firstObject]);
        [priorityQueue removeFirstObject];
    }
    
}

@end
