//
//  City.swift
//
//  Created by Artak on 8/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class City: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kCityPopulationKey: String = "population"
	internal let kCityInternalIdentifierKey: String = "id"
	internal let kCityCoordKey: String = "coord"
	internal let kCityCountryKey: String = "country"
	internal let kCityNameKey: String = "name"


    // MARK: Properties
	public var population: Int?
	public var internalIdentifier: Int?
	public var coord: Coord?
	public var country: String?
	public var name: String?



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
		population <- map[kCityPopulationKey]
		internalIdentifier <- map[kCityInternalIdentifierKey]
		coord <- map[kCityCoordKey]
		country <- map[kCityCountryKey]
		name <- map[kCityNameKey]

    }
}
