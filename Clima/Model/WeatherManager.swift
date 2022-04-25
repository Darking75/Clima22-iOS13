//
//  WeatherManager2.swift
//  Clima
//
//  Created by Alejanro Cardenas on 18/12/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol WeatgerManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
 
    var delegate: WeatgerManagerDelegate?
    let weatherURL =  "https://api.openweathermap.org/data/2.5/weather?appid=9f25bc38af9512bfdfcf536ade9b5fcd&units=metric"
    
    
    func fetchWather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1. Create a URL
        
        if let url = URL(string: urlString){
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. given the session task
            
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if error != nil{
                        print(error!)
                        return
                }
                if let safeData = data{
                    if let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.didUpdateWeather(weather: weather)
                        let watherVC = WeatherViewController()
//                        watherVC.didUpdateWeather(weather: weather)
                    }
                    
                    //                    let dataString = String(data: safeData, encoding: .utf8)
                }
            }
            //4.  Start the task
            task.resume()
        }
        
    }

    
    func parseJSON (weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            print(weather.conditionName)
            print(decodedData.main.temp)
            
            return weather
          
        }catch {
            print(error)
           return nil
        }
    }
    
    
}

