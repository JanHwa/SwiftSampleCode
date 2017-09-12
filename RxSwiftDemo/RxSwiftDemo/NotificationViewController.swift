//
//  NotificationViewController.swift
//  RxSwiftDemo
//
//  Created by Justin on 2017/8/22.
//  Copyright © 2017年 Justin. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class NotificationViewController: UIViewController {

    @IBOutlet weak var stateLabel: UILabel!
    
    
    var stateTitle:String?
    
    let notificationCenter = NotificationCenter.default
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // 增加通知
        addNotification()
        
        // 添加KVO
        addKVO()
        
    }
    
    // 添加KVO
    func addKVO() {
        
//        Observable.combineLatest(stateLabel.rx.text) { (textValue) -> Int in
//            return 1
//         }
        
        
    }
    
    // 添加通知
    func addNotification() {
        notificationCenter.rx.notification(Notification.Name(rawValue: "notification"))
            .subscribe {(event) in
                
                self.stateLabel.text = event.element?.object as? String
                print("-------------"+"\(event)");
            }.disposed(by: disposeBag)
    }

    @IBAction func postNotificationButton(_ sender: UIButton) {
        notificationCenter.post(name: NSNotification.Name(rawValue: "notification"), object: sender.currentTitle)

    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
