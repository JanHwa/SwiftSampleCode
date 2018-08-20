//
//  HomeViewModel.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/20.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit

class HomeViewModel: BaseViewModel {

    override init() {
        super.init()
        provider.rx.request(.home(page: 1))
            .mapModel(AuthorModelData.self)
            .subscribe(onSuccess: { (model) in
                print("model:\(model)")
            }) { (error) in
                print("error:\(error)")
            }.disposed(by: disposeBag)
    }
}
