//
//  Clouds.swift
//
//  Created by Artak on 8/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Clouds: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kCloudsAllKey: String = "all"


    // MARK: Properties
	public var all: Int?



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
		all <- map[kCloudsAllKey]

    }

}
