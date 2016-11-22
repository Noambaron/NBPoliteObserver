//
//  NBPoliteObserverObject.m
//  NBPoliteObserver
//
//  Created by Noam on 7/21/16.
//  Copyright © 2016 Noam. All rights reserved.
//

#import <NBPoliteObserver/NBPoliteObserverObject.h>
#import <objc/runtime.h>

@interface NBPoliteObserverObject ()
//using assign here is crutial because:
//using weak would nil out the pointer, and that will prevent the removeObserver on dealloc
//using strong will create a retain cycle
@property (nonatomic, assign) id observedObject;
@property (nonatomic, copy, readwrite) NSString *keyPath;
@property (nonatomic, weak, readwrite) NSObject *target;
@end

@implementation NBPoliteObserverObject

- (id)initWithTarget:(NSObject *)target observing:(id)object options:(NSKeyValueObservingOptions)options keyPath:(NSString *)keyPath context:(void *)context {
    if (self = [super init]) {
        self.observedObject = object;
        self.keyPath = keyPath;
        self.target = target;
        [self.observedObject addObserver:self forKeyPath:keyPath options:options context:context];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    [self.target observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

- (void)dealloc {
    [self.observedObject removeObserver:self forKeyPath:self.keyPath];
}

@end
