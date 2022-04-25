//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

//protocol weatherProtocol {
//func didUpdateWeather(weather: WeatherModel)
//}

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
   // let midelegeatod = MiDelegadoDeTextfield()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       searchTextField.delegate = self
        
    }

    @IBAction func searchPressed(_ sender: UIButton) { //se refiere al boton lupa
        searchTextField.endEditing(true) /// Se establece para decir si presiono este boton ya puede finalizar el teclado
        print(searchTextField.text!)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // se refiere al boton del teclado
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool { // Si da en buscar,.
        if textField.text != "" { /// si es diferente de "", si termine de editar
            return true
        }else { // de lo contrario si es"" deberia tener en el texto
        textField.placeholder = "Type Something"
            
        return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) { // que hacer cuando termino de editar.
        if let city = searchTextField.text {
        
        weatherManager.fetchWather(cityName: city)
    }
        searchTextField.text = ""
}
    func didUpdateWeather(weather: WeatherModel){
        print(weather.temperature)
    }
    
}
