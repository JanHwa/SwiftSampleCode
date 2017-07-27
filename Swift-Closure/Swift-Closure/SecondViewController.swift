//
//  SecondViewController.swift
//  Swift-Closure
//
//  Created by Justin on 2017/7/27.
//  Copyright © 2017年 Justin. All rights reserved.
//

import UIKit


typealias BackButtonClosure = (_ sender:UIButton) ->Void

class SecondViewController: UIViewController {

    
    var buttonClosure: BackButtonClosure?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public func backClosure(closure: @escaping BackButtonClosure) {
        
        self.buttonClosure = closure
    }
    
    public func printString(value: (String) ->Void) ->Void {
        value("这是回调")
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        
        if (buttonClosure != nil) {
            buttonClosure!(sender)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
