//
//  NBPoliteObserverObject.h
//  NBPoliteObserver
//
//  Created by Noam on 7/21/16.
//  Copyright © 2016 Noam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBPoliteObserverObject : NSObject

@property (nonatomic, weak, readonly) NSObject *target;
@property (nonatomic, copy, readonly) NSString *keyPath;

- (id)initWithTarget:(NSObject *)target observing:(id)object options:(NSKeyValueObservingOptions)options keyPath:(NSString *)keyPath context:(void *)context;

@end

