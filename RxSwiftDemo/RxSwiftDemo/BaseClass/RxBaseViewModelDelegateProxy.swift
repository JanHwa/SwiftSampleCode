//
//  RxBaseViewModelDelegateProxy.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/21.
//  Copyright © 2018年 Justin. All rights reserved.
//

import Foundation
import RxCocoa


extension BaseViewModel: HasDelegate {
    
    typealias Delegate = BaseViewModelDelegate
}



class RxBaseViewModelDelegateProxy
    :   DelegateProxy<BaseViewModel, BaseViewModelDelegate>
    ,   DelegateProxyType
    ,   BaseMainViewDelegate {
    
    /// Typed parent object.
    public weak private(set) var viewModel: BaseViewModel?
    
    /// - parameter scrollView: Parent object for delegate proxy.
    public init(viewModel: ParentObject) {
        self.viewModel = viewModel
        super.init(parentObject: viewModel, delegateProxy:RxBaseViewModelDelegateProxy.self)
    }
    
    static func registerKnownImplementations() {
        self.register { RxBaseViewModelDelegateProxy(viewModel: $0)}
    }
    
}
