//
//  ViewController.swift
//  Weather
//
//  Created by Artak on 8/11/16.
//  Copyright © 2016 Artak. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    static let kCityName = "London";
    
    var disposeBag = DisposeBag()
    
    var weatherViewModel: WeatherViewModel = WeatherViewModel();
    let items = Variable<NSArray>([])
    
    @IBOutlet weak var labelDegree: UILabel!
    @IBOutlet weak var labelClouding: UILabel!
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var labelPresure: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelRain: UILabel!
    @IBOutlet weak var labelClouds: UILabel!
    @IBOutlet weak var labelSunset: UILabel!
    @IBOutlet weak var labelSunrise: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UILabel.appearanceWhenContainedInInstancesOfClasses([ViewController.self]).textColor = UIColor.darkGrayColor()
        
        bindViews()
        
        sendRequests();
        
        
    }
    
    private func bindViews() {
        weatherViewModel.sunrise.asObservable().bindTo(labelSunrise.rx_text).addDisposableTo(disposeBag)
        weatherViewModel.sunset.asObservable().bindTo(labelSunset.rx_text).addDisposableTo(disposeBag)
        weatherViewModel.humidity.asObservable().bindTo(labelHumidity.rx_text).addDisposableTo(disposeBag)
        weatherViewModel.clouds.asObservable().bindTo(labelClouds.rx_text).addDisposableTo(disposeBag)
        weatherViewModel.pressure.asObservable().bindTo(labelPresure.rx_text).addDisposableTo(disposeBag)
        weatherViewModel.cityName.asObservable().bindTo(labelCityName.rx_text).addDisposableTo(disposeBag)
        weatherViewModel.description.asObservable().bindTo(labelClouding.rx_text).addDisposableTo(disposeBag)
        weatherViewModel.degree.asObservable().bindTo(labelDegree.rx_text).addDisposableTo(disposeBag)
        
        items.asObservable()
            .bindTo(tableView.rx_itemsWithCellIdentifier(String(WeatherCell.self), cellType: WeatherCell.self)) { (row, element, cell) in
                
                let calendar = NSCalendar.currentCalendar()
                
                cell.labelName.text = calendar.shortWeekdaySymbols[row];
                
                guard let weather = element as? List else {
                    return
                }
                
                if let temp = weather.temp {
                    
                    cell.labelMinDegree.text = "\(temp.min ?? 0) "  + WeatherViewModel.Metrics.degree;
                    cell.labelMaxDegree.text = "\(temp.max ?? 0) " + WeatherViewModel.Metrics.degree;
                    
                } else {
                    cell.labelMinDegree.text = "";
                    cell.labelMaxDegree.text = "";
                }
                
            }
            .addDisposableTo(disposeBag)
    }
    
    private func sendRequests() {
        ObservableRequest.daily(ViewController.kCityName).asObservable().subscribeNext {[unowned self] (data) in
            
            guard let data = data else {
                return;
            }
            
            self.items.value = data.list ?? []
            
            }.addDisposableTo(disposeBag)
        
        ObservableRequest.weather(ViewController.kCityName).asObservable().doOnError { (error) in
            
            }.subscribeNext { [unowned self] (data) in
                
                guard let data = data else {
                    return;
                }
                
                self.weatherViewModel.updateWeatherInformatino(data, cityName: ViewController.kCityName);
                
            }.addDisposableTo(disposeBag)
    }
}

