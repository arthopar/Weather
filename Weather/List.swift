//
//  List.swift
//
//  Created by Artak on 8/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

final public class List: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kListSpeedKey: String = "speed"
	internal let kListRainKey: String = "rain"
	internal let kListTempKey: String = "temp"
	internal let kListWeatherKey: String = "weather"
	internal let kListHumidityKey: String = "humidity"
	internal let kListDtKey: String = "dt"
	internal let kListCloudsKey: String = "clouds"
	internal let kListPressureKey: String = "pressure"
	internal let kListDegKey: String = "deg"


    // MARK: Properties
	public var speed: Float?
	public var rain: Float?
	public var temp: Temp?
	public var weather: [Weather]?
	public var humidity: Int?
	public var dt: Int?
	public var clouds: Int?
	public var pressure: Float?
	public var deg: Int?



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
		speed <- map[kListSpeedKey]
		rain <- map[kListRainKey]
		temp <- map[kListTempKey]
		weather <- map[kListWeatherKey]
		humidity <- map[kListHumidityKey]
		dt <- map[kListDtKey]
		clouds <- map[kListCloudsKey]
		pressure <- map[kListPressureKey]
		deg <- map[kListDegKey]

    }
}
