//
//	AuthorRealmModelList.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport


import RealmSwift
import Realm

class AuthorRealmModelList: Object {

	@objc dynamic var headImg: String = ""
    @objc dynamic var id: Int = 0
	@objc dynamic var intro: String = ""
    @objc dynamic var nickName: String = ""
	@objc dynamic var type: String = ""
    
    override static func primaryKey() -> String? { return "id" }

}
