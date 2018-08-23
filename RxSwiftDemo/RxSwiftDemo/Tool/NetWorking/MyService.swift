//
//  MyService.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/15.
//  Copyright © 2018年 Justin. All rights reserved.
//

import Foundation
import Moya
import Alamofire


enum MyService {
    case home(page:NSInteger)
}


// MARK: - TargetType Protocol Implementation
extension MyService: TargetType {
    
    var baseURL: URL {
        return URL(string: "http://pc.weilaicaijing.com")!
    }
    
    var path: String {
        switch self {
        case .home:
            return "/api_app/article/nav_follow"
        }
    }
    var method: Moya.Method {
        switch self {
        case .home:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .home(page):
            return .requestParameters(parameters: ["page":page], encoding: JSONEncoding.default)
        }
    }
    
    // 单元测试使用
    var sampleData: Data {
       return "{}".data(using: String.Encoding.utf8)!
    }
    var headers: [String: String]? {
        return nil
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
