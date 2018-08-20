//
//  HomeSectionModel.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/13.
//  Copyright © 2018年 Justin. All rights reserved.
//

import Foundation
import RxDataSources


struct HomeSection {
    
    var sectionTitle: String
    var items: [Item]
    
}

struct HomeModel {
    var title: String
    var detailTitle : String
}

extension HomeSection: SectionModelType {
    
    typealias Item = HomeModel
    
    var identity: String {
        return sectionTitle
    }
    
    init(original: HomeSection, items: [HomeSection.Item]) {
        self = original
        self.items = items
    }
}
