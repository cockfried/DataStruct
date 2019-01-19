//
//  HYStack.h
//  DataStruct
//
//  Created by Cherami on 2019/1/16.
//  Copyright © 2019 Cherami. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYStack : NSObject

- (void)push:(id)object;

- (void)popObject;

- (id)topObject;

- (void)clear;

- (BOOL)isEmpty;

@end

NS_ASSUME_NONNULL_END
