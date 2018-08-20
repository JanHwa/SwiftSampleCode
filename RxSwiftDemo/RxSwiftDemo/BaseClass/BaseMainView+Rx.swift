//
//  BaseMainView+Rx.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/20.
//  Copyright © 2018年 Justin. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift


extension Reactive where Base: BaseMainView {
    
    
    internal var delegate: DelegateProxy<BaseMainView, BaseMainViewDelegate> {
        return RxBaseMainViewDelegateProxy.proxy(for: base)
    }
    
    internal func setDelegate(_ delegate:BaseMainViewDelegate) -> Disposable {
        return RxBaseMainViewDelegateProxy.installForwardDelegate(delegate , retainDelegate: false, onProxyForObject: self.base)
    }
    
    internal var didSelectRowAt: ControlEvent<(mainView: BaseMainView,tableView: UITableView, indexPath: IndexPath)> {
        let source: Observable<(mainView: BaseMainView,tableView: UITableView, indexPath: IndexPath)> = self.delegate.methodInvoked(#selector(BaseMainViewDelegate.mainView(_:tableView:didSelectRowAt:)))
            .map { a in
                return (a.first as! BaseMainView,a[1] as! UITableView, a[2] as!IndexPath )
        }
        return ControlEvent(events: source)
    }
    
    internal var didDeselectRowAt: ControlEvent<(mainView: BaseMainView,tableView: UITableView, indexPath: IndexPath)> {
        let source: Observable<(mainView: BaseMainView,tableView: UITableView, indexPath: IndexPath)> = self.delegate.methodInvoked(#selector(BaseMainViewDelegate.mainView(_:tableView:didSelectRowAt:)))
            .map { a in
                return (a.first as! BaseMainView,a[1] as! UITableView, a[2] as!IndexPath )
        }
        return ControlEvent(events: source)
    }
}
