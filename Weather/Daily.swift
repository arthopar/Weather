//
//  Daily.swift
//
//  Created by Artak on 8/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

final public class Daily: RemoteResource {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDailyCityKey: String = "city"
	internal let kDailyCodKey: String = "cod"
	internal let kDailyCntKey: String = "cnt"
	internal let kDailyMessageKey: String = "message"
	internal let kDailyListKey: String = "list"


    // MARK: Properties
	public var city: City?
	public var cod: String?
	public var cnt: Int?
	public var message: Float?
	public var list: [List]?



    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public required init?(_ map: Map) {

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		city <- map[kDailyCityKey]
		cod <- map[kDailyCodKey]
		cnt <- map[kDailyCntKey]
		message <- map[kDailyMessageKey]
		list <- map[kDailyListKey]

    }

    // MARK: ResourcePath protocol

    static var resourcePath: String {
        get {
            return "forecast/daily"
        }
    }
}
