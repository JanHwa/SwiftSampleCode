//
//  RxSectionViewDelegateProxy.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/14.
//  Copyright © 2018年 Justin. All rights reserved.
//

import Foundation
import RxCocoa

extension HomeSectionView: HasDelegate {
    
   typealias Delegate = HomeSectionDelegate
}

class RxSectionViewDelegateProxy
        :   DelegateProxy<HomeSectionView, HomeSectionDelegate>
        ,   DelegateProxyType
        ,   HomeSectionDelegate {
    
    /// Typed parent object.
    public weak private(set) var sectionView: HomeSectionView?
    
    /// - parameter scrollView: Parent object for delegate proxy.
    public init(sectionView: ParentObject) {
        self.sectionView = sectionView
        super.init(parentObject: sectionView, delegateProxy: RxSectionViewDelegateProxy.self)
    }
    
    static func registerKnownImplementations() {
        self.register { RxSectionViewDelegateProxy(sectionView: $0)}
    }
    
}
