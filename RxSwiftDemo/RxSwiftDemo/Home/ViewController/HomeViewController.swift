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
import RxRealm
import RealmSwift


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
        
        viewModel.request(onSuccess: { (viewModel) in
            let vM:HomeViewModel = viewModel as! HomeViewModel
            
//            print("model:\(vM.model)")
            
            if viewModel.page == 1 {
                
                _ = Observable.from(object: AuthorRealmModelData
                    .setModel(model: vM.model!))
                .subscribe(Realm.rx.add())
                
                let fileURL = Realm.Configuration.defaultConfiguration.fileURL
                
                print("fileURL:\(String(describing: fileURL))")
            }
        }) { (error) in
            print("error:\(error)")
        }
        
        mainView.rx
        .didSelectRow
        .subscribe(onNext: { (mainView, tableView, indexPath) in
                print("mainView:\(mainView) tableView:\(tableView) indexPath:\(indexPath)")
            })
        .disposed(by: disposeBag)
        
    }
    
}











