//
//  ViewController.swift
//  Swift-Closure
//
//  Created by Justin on 2017/7/27.
//  Copyright © 2017年 Justin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pushButton(_ sender: Any) {
        
        let secondVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        // 方式一
//        secondVC.buttonClosure = {(sender: UIButton) ->() in
//        
//            self.title = "回调成功";
//        }
        
        // 方式二
        secondVC.backClosure { (sender) in
            self.title = "回调成功";
        }
        
        secondVC.printString { (title) in
            print("\(title)")
        }
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

