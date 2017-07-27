//
//  ViewController.swift
//  LeanCloudDemo
//
//  Created by Justin on 2017/7/25.
//  Copyright © 2017年 Justin. All rights reserved.
//

import UIKit
import LeanCloud

class ViewController: UIViewController {

    @IBOutlet weak var stateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let post = LCObject(className: "TestObject")
        
        post.set("words", value: "Hello World!")
        
        var reult = post.save()
        
    }
}

