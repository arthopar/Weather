//
//  ObservableRequests.swift
//  Weather
//
//  Created by Artak on 8/19/16.
//  Copyright © 2016 Artak. All rights reserved.
//

import Foundation
import RxSwift

final class ObservableRequest {

    // MARK: Declaration for constants.
    private static let kRetryCount = 3


    // MARK: Observable request

    static func daily(city: String) -> Observable<Daily?> {

        return Observable.create { observer in

            let request = RequestManager.daily(city, completionHandler: { (data, error) in
                responseHendler(observer, data: data, error: error)
            })

            return AnonymousDisposable {
                    request.cancel()
                }

            }.retry(kRetryCount)
    }


    static func weather(city: String) -> Observable<WeatherInformation?> {

        return Observable.create { observer in

            let request = RequestManager.weather(city, completionHandler: { (data, error) in
                responseHendler(observer, data: data, error: error)
            })

            return AnonymousDisposable {
                    request.cancel()
                }

            }.retry(kRetryCount)
    }


    // MARK: Helper functions

    private static func  responseHendler <T: RemoteResource> (observer: AnyObserver<T?>, data: T?, error: NSError?) -> Void { //TODO why AnyObserver type is optional.

        if ((error) != nil) {
            observer.on(.Error(error!))
        } else {
            observer.on(.Next(data!))
            observer.on(.Completed)
        }
    }
}
