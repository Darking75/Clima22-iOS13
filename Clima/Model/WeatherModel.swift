//
//  WeatherModel.swift
//  Clima
//
//  Created by Alejanro Cardenas on 5/01/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

//protocol Empleado {
//    var salario: Int { get }
//    var horario: String { get set }
//    func trabajar()
//}

struct WeatherModel {
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: Double{
        return 1//String(format: "%.1f", temperature)
    }
    
    var conditionName: String{
        switch conditionId {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }

    
}

//extension WeatherModel: Empleado {
//    var salario: Int {
//        return 100
//    }
//
//    var horario: String {
//        get {
//            return "de 6 am 6"
//        }
//        set {
//            print("mi nuevo horario es ata")
//        }
//    }
//
//    func trabajar() {
//        print("Estoy cansado quiero que paguen ya")
//    }
//}

