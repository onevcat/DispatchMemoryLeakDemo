//
//  ViewController.swift
//  DispatchMemoryLeakDemo
//
//  Created by WANG WEI on 2015/12/15.
//  Copyright © 2015年 OneV's Den. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let testQueue: dispatch_queue_t = dispatch_queue_create("test_quese", DISPATCH_QUEUE_SERIAL)
    private var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        method()
    }

    func method() {
        dispatch_async(testQueue) { () -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.method()
            })
        }
    }
}

