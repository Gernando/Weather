//
//  ViewController.swift
//  Wheater-App-Example-2
//
//  Created by Gernando M Costa on 24/08/16.
//  Copyright © 2016 Gernando M Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {

    let weatherService = WeatherService()
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityButton: UIButton!
    
    @IBAction func setCityTapped(sender: UIButton) {
        print("City button tapped")
        openCityAlert()
    }
    
    func openCityAlert() {
        // Create Alert Controller
        let alert = UIAlertController(title: "City",
            message: "Enter city name",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        
        // Create Cancel Action
        let cancel = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alert.addAction(cancel)
        
        // Create OK Action
        let ok = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default) { (action: UIAlertAction) in
                print("OK")
                //Pega o retorno do texto digitado, no array textField posição 0
                let textField = alert.textFields?[0]
                //print(textField?.text!)
                //self.cityLabel.text = textField?.text!
                let cityName = textField?.text
                self.weatherService.getWeather(cityName!)
                
                
        }
        
        alert.addAction(ok)
        
        // Add text field in alert (City name)
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in textField.placeholder = "City Name"
        }
        
        // Apresenta Alert Controller
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: - Weather Service Delegate
    
    func setWeather(weather: Weather) {
        //print("*** Set Weather")
        //print("City: \(weather.cityName) temp:\(weather.temp) desc:\(weather.description)")
        //cityLabel.text = weather.cityName
        tempLabel.text = "\(weather.temp)"
        descriptionLabel.text = weather.description
        //cityButton.setTitle(weather.cityName, forState: .Normal)
        cityButton.setTitle(weather.cityName, forState: .Normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.weatherService.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

