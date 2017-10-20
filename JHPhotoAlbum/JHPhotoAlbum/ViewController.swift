//
//  ViewController.swift
//  JHPhotoAlbum
//
//  Created by Justin on 2017/9/19.
//  Copyright © 2017年 Justin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {

    var transitionView = JHPhotoTransition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        transitionView.duration = 0.25
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transitionView.transitionMode = .present
        return transitionView
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transitionView.transitionMode = .dismiss
        return transitionView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! JHPhotoAlbumViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }


}

