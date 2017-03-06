//
//	ResultModal.swift
//
//	Create by Dharmesh Avaiya on 23/1/2017
//	Copyright © 2017 Azilen Technologies. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class ResultModal : NSObject, NSCoding {

	var answer : String!
	var key : String!
    var session : String!
    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		answer = dictionary["answer"] as? String
		key = dictionary["key"] as? String
        session = dictionary["session"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if answer != nil{
			dictionary["answer"] = answer
		}
		if key != nil{
			dictionary["key"] = key
		}
        if session != nil{
            dictionary["session"] = session
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        answer = aDecoder.decodeObject(forKey: "answer") as? String
        key = aDecoder.decodeObject(forKey: "key") as? String
        session = aDecoder.decodeObject(forKey: "session") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {

        if answer != nil{
			aCoder.encode(answer, forKey: "answer")
		}
		if key != nil{
			aCoder.encode(key, forKey: "key")
		}
        if session != nil{
            aCoder.encode(session, forKey: "session")
        }
	}
}
