//
//  HomeViewModel.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/20.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit
import RealmSwift
import RxRealm
import RxCocoa
import RxSwift

class HomeViewModel: BaseViewModel {

    override init() {
        super.init()
        
        
        
    }
    
    var model: AuthorModelData?
    
    
    override func request(onSuccess: ((BaseViewModel) -> Void)?, onError: ((Error) -> Void)?){
        
        provider.rx
        .request(.home(page: page))
        .mapModel(AuthorModelData.self)
        .subscribe(onSuccess: { [weak self](model) in
            self?.model = model
            onSuccess!(self!)
        }) { (error) in
            onError!(error)
        }.disposed(by: disposeBag)
    }
}
