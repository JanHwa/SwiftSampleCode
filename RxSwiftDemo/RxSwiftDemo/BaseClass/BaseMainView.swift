//
//  BaseMainView.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/20.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

@objc protocol BaseMainViewDelegate: NSObjectProtocol  {
    
    @objc optional func mainView(_ mainView: BaseMainView, tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    
    @objc optional func mainView(_ mainView: BaseMainView,  tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
}

class BaseMainView: UIView,BaseMainViewDelegate {
    
    var disposeBag = DisposeBag()
    
    var delegate: BaseMainViewDelegate?
}
