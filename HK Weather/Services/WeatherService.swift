//
//  WeatherService.swift
//  HK WeatherExtension
//
//  Created by Cheung Chin Hang on 3/6/2022.
//

import SwiftUI

class WeatherService
{
    let url = URL(string: "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=rhrread&lang=en")!
    
    func getWeather(completion: @escaping (Result <[Weather], Error>)  -> Void)
    {
        URLSession.shared.dataTask(with: url)
        {
            data, response, error in
            guard error == nil else
            {
                completion(.failure(error!))
                return
            }
            
            completion(.success(self.getWeatherResponse(fromData: data!)))
        }
    }
    
    private func getWeatherResponse(fromData data: Data) -> [Weather]
    {
        let weatherData = try? JSONDecoder().decode(WeatherResponse.self, from: data)
        
        if let weatherD = weatherData
        {
            return weatherD.forecast
        }
        return [Weather(name: "Error", temperature: 0, unit: "",description: "Error")]
    }
}
