//
//  ViewController.swift
//  AppExtension
//
//  Created by Justin on 2017/10/20.
//  Copyright © 2017年 Justin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func signUp(_ sender: UIButton) {
        
        let accountStr = accountTextField.text
        let passwordStr = passwordTextField.text
        
        if accountStr == "Justin" && passwordStr == "123456" {
            print("--------Successful")
        } else {
            
            let alertView = UIAlertView(title: "Alert", message: "", delegate: self as? UIAlertViewDelegate, cancelButtonTitle: "ok", otherButtonTitles: "confirm")
            
            alertView.show()
            
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

