//
//  NSObject+NBPoliteObserver.m
//  NBPoliteObserver
//
//  Created by Noam on 7/21/16.
//  Copyright © 2016 Noam. All rights reserved.
//

#import <NBPoliteObserver/NBPoliteObserverObject.h>
#import <NBPoliteObserver/NSObject+NBPolite.h>
#import <objc/runtime.h>

@interface NSObject (NBPolitePrivate)
@property (nonatomic, retain, setter=nb_setObservers:) NSMutableArray *nb_observers;
@end

@implementation NSObject (NBPolite)

#pragma mark Properties

- (void)nb_setObservers:(NSMutableArray *)object {
    objc_setAssociatedObject(self, @selector(nb_observers), object,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)nb_observers {
    return objc_getAssociatedObject(self, @selector(nb_observers));
}

- (void)addPoliteObserver:(nonnull NSObject *)object forKeyPath:(nonnull NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
    if (!object) {
        return;
    }
    NBPoliteObserverObject *observer = [[NBPoliteObserverObject alloc] initWithTarget:object observing:self options:options keyPath:keyPath context:context];
    if (self.nb_observers) {
        [self.nb_observers addObject:observer];
    } else {
        self.nb_observers = [[NSMutableArray alloc] initWithObjects:observer, nil];
    }
}

- (void)removePoliteObserver:(nonnull NSObject *)object forKeyPath:(nonnull NSString *)keyPath {
    NBPoliteObserverObject *observerToBeRemoved;
    if (!self.nb_observers) {
        return;
    }
    for (NBPoliteObserverObject *observer in self.nb_observers) {
        if (observer.target == object && [observer.keyPath isEqualToString:keyPath]) {
            observerToBeRemoved = observer;
        }
    }
    if (observerToBeRemoved) {
        [self.nb_observers removeObject:observerToBeRemoved];
    }
}

@end
