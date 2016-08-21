//
//  Wind.swift
//
//  Created by Artak on 8/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Wind: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kWindSpeedKey: String = "speed"
	internal let kWindGustKey: String = "gust"
	internal let kWindDegKey: String = "deg"


    // MARK: Properties
	public var speed: Float?
	public var gust: Float?
	public var deg: Int?



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
		speed <- map[kWindSpeedKey]
		gust <- map[kWindGustKey]
		deg <- map[kWindDegKey]

    }
}
