//
//  RxBaseMainViewDelegateProxy.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/20.
//  Copyright © 2018年 Justin. All rights reserved.
//

import Foundation
import RxCocoa

extension BaseMainView: HasDelegate {
    
    typealias Delegate = BaseMainViewDelegate
}

class RxBaseMainViewDelegateProxy
    :   DelegateProxy<BaseMainView, BaseMainViewDelegate>
    ,   DelegateProxyType
    ,   BaseMainViewDelegate {
    
    /// Typed parent object.
    public weak private(set) var mainView: BaseMainView?
    
    /// - parameter scrollView: Parent object for delegate proxy.
    public init(mainView: ParentObject) {
        self.mainView = mainView
        super.init(parentObject: mainView, delegateProxy: RxBaseMainViewDelegateProxy.self)
    }
    
    static func registerKnownImplementations() {
        self.register { RxBaseMainViewDelegateProxy(mainView: $0)}
    }
    
}
