//
//	AuthorModelList.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class AuthorModelList : Mappable{

	var headImg : String?
	var id : Int?
	var intro : String?
	var nickName : String?
	var type : String?


	required init?(map: Map){}
	

	func mapping(map: Map)
	{
		headImg <- map["head_img"]
		id <- map["id"]
		intro <- map["intro"]
		nickName <- map["nick_name"]
		type <- map["type"]
		
	}

}
