//
//  JHPhotoTransition.swift
//  JHPhotoAlbum
//
//  Created by Justin on 2017/9/19.
//  Copyright © 2017年 Justin. All rights reserved.
//

import UIKit

class JHPhotoTransition: NSObject {

    var animationView = UIView()
    
    var duration = 0.25
    
    enum CircularTransitionMode:Int {
        case present, dismiss, pop
    }
    
    var transitionMode:CircularTransitionMode = .present
}

extension JHPhotoTransition: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        if transitionMode == .present {
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                animationView = UIView()
                animationView.frame = containerView.bounds
                
                
                animationView.backgroundColor = UIColor.lightGray
                animationView.alpha = 0
                
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: duration, animations: {
                    presentedView.alpha = 1
                    self.animationView.alpha = 1
                }, completion: { (success:Bool) in
                    transitionContext.completeTransition(success)
                })
            }
        } else {
            
            let transitionModeKey = (transitionMode == .pop) ? UITransitionContextViewKey.to:UITransitionContextViewKey.from
            
            if let returningView = transitionContext.view(forKey: transitionModeKey) {
                animationView.frame = containerView.bounds
                UIView.animate(withDuration: duration, animations: {
                    returningView.alpha = 0
                    self.animationView.alpha = 0
                    
                }, completion: { (success:Bool) in
                    returningView.removeFromSuperview()
                    self.animationView.removeFromSuperview()
                    transitionContext.completeTransition(success)
                })
            }
        }
        
    }

    
}
