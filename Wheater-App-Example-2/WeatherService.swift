//
//  WeatherService.swift
//  Wheater-App-Example-2
//
//  Created by Gernando M Costa on 25/08/16.
//  Copyright © 2016 Gernando M Costa. All rights reserved.
//

import Foundation


protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String) {
        
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped!)&appid=8d7350a9cbefa3375b11f333e8a93a0d"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            print(">>>> \(data)")
            let json = JSON(data: data!)
            print("json>>>> \(json)")
            
           //let json = JSON(data: data!)
            let lon = json["coord"]["lon"].double
            let lat = json["coord"]["lat"].double
            let temp = json["main"]["temp"].double
            let name = json["name"].string
            let desc = json["weather"][0]["description"].string
            
            let weather = Weather(cityName: name!, temp: temp!, description: desc!)
            
            if self.delegate != nil {
               dispatch_async(dispatch_get_main_queue(), {
                    self.delegate?.setWeather(weather)
                })
                
            }
            
            print("lat >>>>> \(lat!)" )
            print("lon >>>>> \(lon!)" )
//print("Temp >>>>> \(temp!)")
            
        }
        task.resume()
        
        /*
        let task = session.downloadTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) void;
            print(">>>>>> \(data)")
            
        }*/
        
        
        //print("Weather Service City: \(city)")
        // request weather data
        // wait
        // process data
        /*
        let weather = Weather(cityName: city, temp: 237.2, description: "A nice day")
        
        if delegate != nil {
            delegate?.setWeather(weather)
        }
        */
        
    }
}