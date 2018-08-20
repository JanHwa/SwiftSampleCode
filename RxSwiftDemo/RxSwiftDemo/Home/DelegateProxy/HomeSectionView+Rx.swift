//
//  HomeSectionView+Rx.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/14.
//  Copyright © 2018年 Justin. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift


extension Reactive where Base: HomeSectionView {
    
   
    internal var delegate: DelegateProxy<HomeSectionView, HomeSectionDelegate> {
      return  RxSectionViewDelegateProxy.proxy(for: base)
    }
    
    internal func setDelegate(_ delegate:HomeSectionDelegate) -> Disposable {
        return RxSectionViewDelegateProxy.installForwardDelegate(delegate , retainDelegate: false, onProxyForObject: self.base)
    }
    
    internal var didSelectButton: ControlEvent<(sender: UIButton, model: String)> {
        let source: Observable<(sender: UIButton, model: String)> = self.delegate.methodInvoked(#selector(HomeSectionDelegate.didSelectButton(button:model:)))
            .map { a in
                return (a.first as! UIButton,a[1] as! String)
        }
        return ControlEvent(events: source)
    }
    
}
