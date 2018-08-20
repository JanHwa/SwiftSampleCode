//
//  BaseViewModel.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/20.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Realm
import Moya

public protocol BaseViewModelDelegate {
    
    
}

class BaseViewModel: NSObject {

    var disposeBag = DisposeBag()
    
    var page = 1
    
    
    let provider = MoyaProvider<MyService>()
}


