//
//  Coord.swift
//
//  Created by Artak on 8/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Coord: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kCoordLonKey: String = "lon"
	internal let kCoordLatKey: String = "lat"


    // MARK: Properties
	public var lon: Float?
	public var lat: Float?



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
		lon <- map[kCoordLonKey]
		lat <- map[kCoordLatKey]

    }

}
