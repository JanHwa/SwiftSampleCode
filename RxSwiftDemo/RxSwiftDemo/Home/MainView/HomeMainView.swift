//
//  HomeMainView.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/20.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HomeMainView: BaseMainView,UITableViewDelegate {

    var tableView: UITableView?
    
    func configTableView(tableView: UITableView) {
        self.tableView = tableView
        
        tableView.tableFooterView = UIView()
        
        
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        let items = Observable<[HomeSection]>
            .just([HomeSection(sectionTitle: "第一组", items: [HomeModel(title: "哈哈哈哈", detailTitle: "看我干啥"),HomeModel(title: "啦啦啦", detailTitle: "看你咋滴"),]),
                   HomeSection(sectionTitle: "第二组", items: [HomeModel(title: "呵呵呵", detailTitle: "你瞅啥"),HomeModel(title: "嗯嗯额", detailTitle: "瞅你咋地")])])
        
        
        let dataSource = RxTableViewSectionedReloadDataSource<HomeSection>(configureCell: { (ds, tableView, indexPath, model) -> UITableViewCell in
            var cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
            
            if (cell == nil) {
                cell = UITableViewCell.init(style: .subtitle, reuseIdentifier:"CellID")
            }
            
            cell?.textLabel?.text = model.title
            cell?.detailTextLabel?.text = model.detailTitle
            return cell!
        }, titleForHeaderInSection: { (ds, index) -> String? in
            return nil
        }, titleForFooterInSection: { (ds, index) -> String? in
            return nil
        }, canEditRowAtIndexPath: { (ds, indexPath) -> Bool in
            return true
        }, canMoveRowAtIndexPath: { (ds, indexPath) -> Bool in
            return true
        }, sectionIndexTitles: { (ds) -> [String]? in
            return nil
        }) { (ds, title, index) -> Int in
            return 0
        }
        
        
        items.bind(to: tableView.rx
            .items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx
            .itemSelected
            .subscribe(onNext:  {[weak self] value in
                self?.tableView?.deselectRow(at: value, animated: true)
                self?.delegate?.mainView!(self!, tableView: (self?.tableView)!, didSelectRowAt: value)
            })
            .disposed(by: disposeBag)
    }
}

extension HomeMainView {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = HomeSectionView.init(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 44))
        
        sectionView.rx
            .didSelectButton
            .subscribe(onNext: { (sender,model) in
                print("sender:\(sender)----model:\(model)")
            }).disposed(by: disposeBag)
        
        return sectionView
    }
    

}
