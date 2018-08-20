//
//	HomeList.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class HomeList : NSObject, NSCoding{

	var headImg : String!
	var id : Int!
	var intro : String!
	var nickName : String!
	var type : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		headImg = json["head_img"].stringValue
		id = json["id"].intValue
		intro = json["intro"].stringValue
		nickName = json["nick_name"].stringValue
		type = json["type"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
        var dictionary = [String:Any]()
		if headImg != nil{
			dictionary["head_img"] = headImg
		}
		if id != nil{
			dictionary["id"] = id
		}
		if intro != nil{
			dictionary["intro"] = intro
		}
		if nickName != nil{
			dictionary["nick_name"] = nickName
		}
		if type != nil{
			dictionary["type"] = type
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         headImg = aDecoder.decodeObject(forKey: "head_img") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         intro = aDecoder.decodeObject(forKey: "intro") as? String
         nickName = aDecoder.decodeObject(forKey: "nick_name") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if headImg != nil{
			aCoder.encode(headImg, forKey: "head_img")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if intro != nil{
			aCoder.encode(intro, forKey: "intro")
		}
		if nickName != nil{
			aCoder.encode(nickName, forKey: "nick_name")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}
