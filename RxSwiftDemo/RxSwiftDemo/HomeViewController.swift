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

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        
        let items = Observable.just(
            (0..<20).map { "\($0)" }
        )
        
        items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element) @ row \(row)"
            }
            .disposed(by: disposeBag)
        
        
//        tableView.rx
//            .modelSelected(String.self)
//            .subscribe(onNext:  { value in
//
//                print("选择:"+"\(value)")
//
//            })
//            .disposed(by: disposeBag)
        
        tableView.rx
            .itemSelected
            .subscribe(onNext:  {[weak self] value in
                self?.tableView.deselectRow(at: value, animated: true)
            print("选择dd:"+"\(value)")
            
        })
            .disposed(by: disposeBag)
        
        tableView.rx
            .itemAccessoryButtonTapped
            .subscribe(onNext: { indexPath in
//                DefaultWireframe.presentAlert("Tapped Detail @ \(indexPath.section),\(indexPath.row)")
            })
            .disposed(by: disposeBag)
        
    }


}
