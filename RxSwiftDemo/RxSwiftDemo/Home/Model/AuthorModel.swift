//
//	AuthorModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class AuthorModel : Mappable{

	var code : Int?
	var data : AuthorModelData?
	var msg : String?


	required init?(map: Map){}

	func mapping(map: Map)
	{
		code <- map["code"]
		data <- map["data"]
		msg <- map["msg"]
		
	}
}
