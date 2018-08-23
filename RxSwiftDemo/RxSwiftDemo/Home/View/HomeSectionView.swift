//
//  HomeSectionView.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/14.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

@objc protocol HomeSectionDelegate: NSObjectProtocol {
    
    @objc optional func didSelectButton(button:UIButton , model:String) -> Void
}


class HomeSectionView: UIView {
    
    var delegate : HomeSectionDelegate?
    
    
    @IBOutlet var view: UIView!
    
    override init(frame: CGRect) {
       
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("HomeSectionView", owner: self, options: nil)
        
        self.view.frame = self.bounds
        self.addSubview(self.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func clickButton(_ sender: UIButton) {
        self.delegate?.didSelectButton!(button: sender,model: "model-----Succeed")
        
        let source = Observable.just(sender)
        
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
