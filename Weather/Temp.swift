//
//  Temp.swift
//
//  Created by Artak on 8/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

final public class Temp: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kTempMinKey: String = "min"
	internal let kTempMornKey: String = "morn"
	internal let kTempEveKey: String = "eve"
	internal let kTempNightKey: String = "night"
	internal let kTempDayKey: String = "day"
	internal let kTempMaxKey: String = "max"


    // MARK: Properties
	public var min: Float?
	public var morn: Float?
	public var eve: Float?
	public var night: Float?
	public var day: Float?
	public var max: Float?



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
		min <- map[kTempMinKey]
		morn <- map[kTempMornKey]
		eve <- map[kTempEveKey]
		night <- map[kTempNightKey]
		day <- map[kTempDayKey]
		max <- map[kTempMaxKey]

    }
}
