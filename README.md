# NBPoliteObserver
A polite KVO observer that removes itself automatically when observed object deallocates... instead of rudely crashing

[![Version](https://img.shields.io/cocoapods/v/NBPoliteObserver.svg?style=flat)](http://cocoapods.org/pods/NBPoliteObserver)
[![License](https://img.shields.io/cocoapods/l/NBPoliteObserver.svg?style=flat)](http://cocoapods.org/pods/NBPoliteObserver)
[![Platform](https://img.shields.io/cocoapods/p/NBPoliteObserver.svg?style=flat)](http://cocoapods.org/pods/NBPoliteObserver)


## Requirements

* iOS 8.1+

## Example App 

To run the example project, clone the repo, and run


## Installation

NBPoliteObserver is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```objective-c
pod "NBPoliteObserver"
```
Then import `NSObject+NBPolite.h`
```objective-c
#import <NBPoliteObserver/NSObject+NBPolite.h>
```

## Add Observer
Use exactly as you would use Foundation KVO, just call `addPoliteObserver` instead of `addObserver`

```objective-c
    var object:NSObject? = NSObject()
    object!.addPoliteObserver(self, forKeyPath: "keyPath", options: [], context: nil)
    object = nil // Try this. It will NOT cause a crash
```

## Remove Observer
Use exactly as you would use Foundation KVO, just call `removePoliteObserver` instead of `removeObserver`
```objective-c
    object!.removePoliteObserver(self, forKeyPath: "keyPath")
```

## Collaboration
Feel free to collaborate with ideas, issues and/or pull requests.

## Author

[Noam Bar-on](https://www.linkedin.com/in/noambaron)

## License

The MIT License (MIT)

Copyright (c) 2016 Noam Bar-on.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

<!--=======-->
<!--Simple State Machine written in Swift-->

