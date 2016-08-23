//
//  Base.swift
//
//  Created by Artak on 8/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

final public class WeatherInformation: RemoteResource {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kBaseSysKey: String = "sys"
	internal let kBaseInternalIdentifierKey: String = "id"
	internal let kBaseWeatherKey: String = "weather"
	internal let kBaseBaseKey: String = "base"
	internal let kBaseWindKey: String = "wind"
	internal let kBaseCloudsKey: String = "clouds"
	internal let kBaseDtKey: String = "dt"
	internal let kBaseCodKey: String = "cod"
	internal let kBaseCoordKey: String = "coord"
	internal let kBaseMainKey: String = "main"
	internal let kBaseNameKey: String = "name"


    // MARK: Properties
	public var sys: Sys?
	public var internalIdentifier: Int?
	public var weather: [Weather]?
	public var base: String?
	public var wind: Wind?
	public var clouds: Clouds?
	public var dt: Int?
	public var cod: Int?
	public var coord: Coord?
	public var main: Main?
	public var name: String?



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
		sys <- map[kBaseSysKey]
		internalIdentifier <- map[kBaseInternalIdentifierKey]
		weather <- map[kBaseWeatherKey]
		base <- map[kBaseBaseKey]
		wind <- map[kBaseWindKey]
		clouds <- map[kBaseCloudsKey]
		dt <- map[kBaseDtKey]
		cod <- map[kBaseCodKey]
		coord <- map[kBaseCoordKey]
		main <- map[kBaseMainKey]
		name <- map[kBaseNameKey]

    }

    // MARK: ResourcePath protocol
    static var resourcePath: String {
        get {
            return "weather"
        }
    }
}
