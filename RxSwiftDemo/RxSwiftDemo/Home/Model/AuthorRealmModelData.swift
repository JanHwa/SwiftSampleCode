//
//	AuthorRealmModelData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import RealmSwift
import Realm

class AuthorRealmModelData: Object {

    @objc dynamic var lists: RLMArray<AuthorRealmModelList>?
    @objc dynamic var type: String = ""
    
    override static func primaryKey() -> String? { return "type" }
    
    public static func setModel(model:AuthorModelData) -> AuthorRealmModelData {
        let authorData = self.init()
        
        authorData.type = model.type!
        
        guard let list = model.lists else {
            return authorData
        }
        
        for author in list {
            let authorRealm = AuthorRealmModelList()
            authorRealm.headImg = author.headImg!
            authorRealm.id = author.id!
            authorRealm.intro = author.intro!
            authorRealm.nickName = author.nickName!
            authorRealm.type = author.type!
            
            authorData.lists?.add(authorRealm)
        }
        
        return authorData
    }
}
