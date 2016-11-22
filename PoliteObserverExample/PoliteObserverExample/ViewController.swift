//
//  ViewController.swift
//  PoliteObserverExample
//
//  Created by Noam on 11/22/16.
//  Copyright © 2016 Noam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var object:NSObject? = NSObject()
        object!.addPoliteObserver(self, forKeyPath: "keyPath", options: [], context: nil)
        object = nil //This would crash with a plain KVO oserver...
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

