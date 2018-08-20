//
//  Observable+ObjectMapper.swift
//  RxSwiftDemo
//
//  Created by HWA on 2018/8/20.
//  Copyright © 2018年 Justin. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper
import SwiftyJSON


// MARK: - Json -> Model
extension Response {
    // 将Json解析为单个Model
    public func mapObject<T: BaseMappable>(_ type: T.Type) throws -> T {
        
        guard let json = try mapJSON() as? [String : Any] else {
            throw MoyaError.stringMapping(self)
        }
        
        let code = json["code"] as? Int
        guard code == 2000 else {
            throw MoyaError.requestMapping(json["msg"] as? String ?? "请求失败")
        }
        
        guard let objJson = (json["data"] as? [String : Any] ) else {
            return Mapper<T>().map(JSON: json)!
        }
        
        guard let object = Mapper<T>().map(JSONObject: objJson) else {
            throw MoyaError.stringMapping(self)
        }
        return object
    }
    
    // 将Json解析为多个Model，返回数组，对于不同的json格式需要对该方法进行修改
    public func mapArray<T:BaseMappable>(_ type: T.Type) throws -> [T] {
        
        guard let json = try mapJSON() as? [String : Any] else {
            throw MoyaError.stringMapping(self)
        }
        
        guard let jsonArr = (json["list"]as? [[String : Any]]) else {
            throw MoyaError.requestMapping(json["msg"] as? String ?? "请求失败")
        }
        
        return Mapper<T>().mapArray(JSONArray: jsonArr)
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    func mapModel<T: Mappable>(_ type: T.Type) -> Single<T> {
        return flatMap { response -> Single<T> in
            return Single.just(try response.mapObject(T.self))
        }
    }
    
    func mapArray<T:BaseMappable>(_ type: T.Type) -> Single<[T]> {
        
        return flatMap { response -> Single<[T]> in
            return Single.just(try response.mapArray(T.self))
        }
    }
}

// MARK: - Json -> Observable<Model>
extension ObservableType where E == Response {
    // 将Json解析为Observable<Model>
    public func mapObject<T: BaseMappable>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapObject(T.self))
        }
    }
    // 将Json解析为Observable<[Model]>
    public func mapArray<T: BaseMappable>(_ type: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.mapArray(T.self))
        }
    }
}
