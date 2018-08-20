//
//  HomeViewController.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/10.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Moya
import Alamofire
import SwiftyJSON


class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: HomeViewModel = {
        let viewModel = HomeViewModel()
        return viewModel
    }()
    
    let mainView: HomeMainView = {
        let mainView = HomeMainView()
        return mainView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.configTableView(tableView: tableView)
        
        mainView.rx
        .didSelectRowAt
        .subscribe(onNext: { (mainView, tableView, indexPath) in
                print("mainView:\(mainView) tableView:\(tableView) indexPath:\(indexPath)")
            })
        .disposed(by: disposeBag)
    }
    
}











