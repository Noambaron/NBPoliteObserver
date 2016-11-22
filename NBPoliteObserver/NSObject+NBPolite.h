//
//  NSObject+NBPolite.h
//  NBPoliteObserver
//
//  Created by Noam on 7/21/16.
//  Copyright © 2016 Noam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NBPolite)

// When doing KVO neither the observer nor the observed object are retained, so it will crash when observed object is realeased and observer is still registered.
// This prevents this from happening by automatically removing the observer when observed object is deallocated
// It does that by registering a NBPoliteObserver as the observer, and then adding itself to the observed object as an associated object. this way when object is released dealloc message is sent on and NBPoliteObserver and observer is removed.

- (void)addPoliteObserver:(nonnull NSObject *)object forKeyPath:(nonnull NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

- (void)removePoliteObserver:(nonnull NSObject *)object forKeyPath:(nonnull NSString *)keyPath;
@end
