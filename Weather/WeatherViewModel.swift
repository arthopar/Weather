//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Artak on 8/19/16.
//  Copyright © 2016 Artak. All rights reserved.
//

import Foundation
import RxSwift


final class WeatherViewModel {

    struct Metrics {
        static let degree = "F"
        static let plessure = "hPa"
        static let percent = "%"
    }

    // MARK: Declaration for constants.

    // MARK: Properties
    var cityName: Variable<String> = Variable<String>.init("")
    var description: Variable<String> = Variable<String>.init("")
    var degree: Variable<String> = Variable<String>.init("")

    var sunrise: Variable<String> = Variable<String>.init("")
    var sunset: Variable<String> = Variable<String>.init("")
    var clouds: Variable<String> = Variable<String>.init("")
    var rain: Variable<String> = Variable<String>.init("")
    var humidity: Variable<String> = Variable<String>.init("")
    var pressure: Variable<String> = Variable<String>.init("")

    var dateFormatter: NSDateFormatter

    init() {

        dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        dateFormatter.locale = NSLocale.currentLocale()

    }

    func updateWeatherInformatino(weather: WeatherInformation, cityName citiNameArgument: String) {

        cityName.value = citiNameArgument
        degree.value = "\(weather.main?.temp ?? 0) "  + Metrics.degree
        description.value = weather.weather?[0].descriptionValue ?? ""

        sunrise.value = dateFormatter.stringFromDate(NSDate(timeIntervalSince1970: NSTimeInterval(weather.sys?.sunrise ?? 0)))
        sunset.value =  dateFormatter.stringFromDate(NSDate(timeIntervalSince1970: NSTimeInterval(weather.sys?.sunset ?? 0)))

        let cloudsValue =  String(weather.clouds?.all ?? 0)
        clouds.value =  "\(cloudsValue) " + Metrics.percent

        let humidityValue = String(weather.main?.humidity ?? 0)
        humidity.value = "\(humidityValue) " + Metrics.percent

        let pressureValue = String(weather.main?.pressure ?? 0)
        pressure.value = "\(pressureValue) " + Metrics.plessure
    }
}
