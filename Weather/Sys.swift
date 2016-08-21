//
//  Sys.swift
//
//  Created by Artak on 8/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Sys: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kSysTypeKey: String = "type"
	internal let kSysSunriseKey: String = "sunrise"
	internal let kSysSunsetKey: String = "sunset"
	internal let kSysInternalIdentifierKey: String = "id"
	internal let kSysMessageKey: String = "message"
	internal let kSysCountryKey: String = "country"


    // MARK: Properties
	public var type: Int?
	public var sunrise: Int?
	public var sunset: Int?
	public var internalIdentifier: Int?
	public var message: Float?
	public var country: String?



    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public required init?(_ map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		type <- map[kSysTypeKey]
		sunrise <- map[kSysSunriseKey]
		sunset <- map[kSysSunsetKey]
		internalIdentifier <- map[kSysInternalIdentifierKey]
		message <- map[kSysMessageKey]
		country <- map[kSysCountryKey]

    }
}
