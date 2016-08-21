//
//  Main.swift
//
//  Created by Artak on 8/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Main: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMainHumidityKey: String = "humidity"
	internal let kMainTempKey: String = "temp"
	internal let kMainTempMaxKey: String = "temp_max"
	internal let kMainTempMinKey: String = "temp_min"
	internal let kMainPressureKey: String = "pressure"


    // MARK: Properties
	public var humidity: Int?
	public var temp: Float?
	public var tempMax: Float?
	public var tempMin: Float?
	public var pressure: Int?



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
		humidity <- map[kMainHumidityKey]
		temp <- map[kMainTempKey]
		tempMax <- map[kMainTempMaxKey]
		tempMin <- map[kMainTempMinKey]
		pressure <- map[kMainPressureKey]

    }


}
