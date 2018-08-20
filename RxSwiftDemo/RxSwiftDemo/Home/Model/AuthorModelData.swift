//
//	AuthorModelData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class AuthorModelData : Mappable{

	var lists : [AuthorModelList]?
	var type : String?


	required init?(map: Map){}
	

	func mapping(map: Map)
	{
		lists <- map["lists"]
		type <- map["type"]
		
	}


}
