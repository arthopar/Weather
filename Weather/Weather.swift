//
//  Weather.swift
//
//  Created by Artak on 8/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Weather: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kWeatherIconKey: String = "icon"
	internal let kWeatherInternalIdentifierKey: String = "id"
	internal let kWeatherMainKey: String = "main"
	internal let kWeatherDescriptionValueKey: String = "description"


    // MARK: Properties
	public var icon: String?
	public var internalIdentifier: Int?
	public var main: String?
	public var descriptionValue: String?



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
		icon <- map[kWeatherIconKey]
		internalIdentifier <- map[kWeatherInternalIdentifierKey]
		main <- map[kWeatherMainKey]
		descriptionValue <- map[kWeatherDescriptionValueKey]

    }
}
