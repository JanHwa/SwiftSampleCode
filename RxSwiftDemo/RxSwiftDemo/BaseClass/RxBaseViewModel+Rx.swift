//
//  RxBaseViewModel+Rx.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/21.
//  Copyright © 2018年 Justin. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift


extension Reactive where Base: BaseViewModel {
    
    
    internal var delegate: DelegateProxy<BaseViewModel, BaseViewModelDelegate> {
        
        return RxBaseViewModelDelegateProxy.proxy(for: base)
    }
    
    internal func setDelegate(_ delegate:BaseViewModelDelegate) -> Disposable {
        return RxBaseViewModelDelegateProxy.installForwardDelegate(delegate , retainDelegate: false, onProxyForObject: self.base)
    }
}
