//
//  File.swift
//  Forecast
//
//  Created by Artak on 8/11/16.
//  Copyright © 2016 Artak. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol RemoteResource: Mappable {
    static var resourcePath: String {
        get
    }

}

final class RequestManager {

    // MARK: Declaration for constants.
    private static let kApiKay = "10df6dde250be00721d76d8e826af54d"
    private static let kBaseUrl = "http://api.openweathermap.org/data/2.5/"
    private static let kCityNameParameter = "q"

    // MARK: API requests

    static func weather(city: String, completionHandler: (data: WeatherInformation?, error: NSError?) -> Void)  -> Alamofire.Request {

        let params: Dictionary<String, AnyObject> = [kCityNameParameter: city]

        return weatherGetRequest(params, completionHandler: completionHandler)

    }

    static func daily(city: String, completionHandler: (data: Daily?, error: NSError?) -> Void) -> Alamofire.Request {

        let params: Dictionary<String, AnyObject> = [kCityNameParameter: city]

        return weatherGetRequest(params, completionHandler: completionHandler)

    }

    // MARK: Helper functions

    private static func weatherGetRequest<T: RemoteResource>(
        params: Dictionary<String, AnyObject>,
        completionHandler: (data: T?, error: NSError?) -> Void) -> Alamofire.Request {

        return Alamofire.request(.GET, kBaseUrl + T.resourcePath + "?appid=" + kApiKay, parameters: params).responseObject { (response: Response<T, NSError>) in

            let result = response.result

            completionHandler(data: result.value, error: result.error)
        }

    }
}
