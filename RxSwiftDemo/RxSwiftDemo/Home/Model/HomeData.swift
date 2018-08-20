//
//	HomeData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class HomeData : NSObject, NSCoding{

	var lists : [HomeList]!
	var type : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		lists = [HomeList]()
		let listsArray = json["lists"].arrayValue
		for listsJson in listsArray{
			let value = HomeList(fromJson: listsJson)
			lists.append(value)
		}
		type = json["type"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
        var dictionary = [String:Any]()
		if lists != nil{
			var dictionaryElements = [[String:Any]]()
			for listsElement in lists {
				dictionaryElements.append(listsElement.toDictionary())
			}
			dictionary["lists"] = dictionaryElements
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
         lists = aDecoder.decodeObject(forKey: "lists") as? [HomeList]
         type = aDecoder.decodeObject(forKey: "type") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if lists != nil{
			aCoder.encode(lists, forKey: "lists")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}
