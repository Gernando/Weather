//
//  Weather.swift
//  Wheater-App-Example-2
//
//  Created by Gernando M Costa on 25/08/16.
//  Copyright © 2016 Gernando M Costa. All rights reserved.
//

import Foundation


struct Weather {
    let cityName: String
    let temp: Double
    let description: String
    
    init(cityName: String, temp: Double, description: String) {
        self.cityName = cityName
        self.temp = temp
        self.description = description
        
    }
}