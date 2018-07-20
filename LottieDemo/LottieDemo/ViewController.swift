//
//  ViewController.swift
//  LottieDemo
//
//  Created by HWA on 2018/7/19.
//  Copyright © 2018年 HWA. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    @IBOutlet weak var likeButton: UIButton!
    private var boatAnimation: LOTAnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        boatAnimation = LOTAnimationView(name: "like")
        // Set view to full screen, aspectFill
        boatAnimation!.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        boatAnimation!.contentMode = .scaleAspectFill
        boatAnimation!.frame = CGRect(x: 0, y: 00, width: 100, height: 100)
        // Add the Animation
        
        boatAnimation?.center = view.center
        
        view.addSubview(boatAnimation!)
    }

    @IBAction func likeButton(_ sender: UIButton) {
        
        boatAnimation?.play()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

