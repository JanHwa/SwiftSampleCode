//
//  ViewController.swift
//  UIVisualEffectViewAnimation
//
//  Created by Justin on 2017/7/8.
//  Copyright © 2017年 Justin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet var addItemView: UIView!
    
    var effect:UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        addItemView.layer.cornerRadius = 5.0
    }
    
    func animationIn() {
        
        self.view.addSubview(addItemView)
        addItemView.center = view.center
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1.0
            self.addItemView.transform = CGAffineTransform.identity
        })
    }
    
    func animationOut() {
        UIView.animate(withDuration: 0.25, animations: {
        self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.visualEffectView.effect = nil
        self.addItemView.alpha = 0
        }) { (succee:Bool) in
            self.addItemView.removeFromSuperview()
        }
    }

    @IBAction func addButton(_ sender: Any) {
        animationIn()
    }
    @IBAction func doneButton(_ sender: Any) {
        animationOut()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

