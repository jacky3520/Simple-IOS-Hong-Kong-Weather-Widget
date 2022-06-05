//
//  Weather.swift
//  HK WeatherExtension
//
//  Created by Cheung Chin Hang on 3/6/2022.
//

import Foundation



// snake_case to match the JSON and hence no need to write CodingKey enums
fileprivate struct RawServerResponse: Decodable {

    struct WeatherData: Codable{
        let temperature: TemperatureData
    }

    struct TemperatureData: Codable{
        let data: [WeatherInfo]
    }

    struct WeatherInfo: Codable
    {
        let place: String
        let value: Int
        let unit: String
    }
    
    var weather_data: WeatherData
    var temperature_data: TemperatureData
    var weather_info: [WeatherInfo]
}

struct Weather: Codable {
    var place: String
    var value: Int
    var unit: String
    
    init()
    {
        self.init(place: "Test", value: 0, unit: "C")
    }
    
    init (place: String, value: Int, unit: String)
    {
        self.place = place
        self.value = value
        self.unit = unit
    }

    init(from decoder: Decoder) throws {
        let rawResponse = try RawServerResponse(from: decoder)
        
        // Now you can pick items that are important to your data model,
        // conveniently decoded into a Swift structure
        place = rawResponse.weather_data.temperature.data[0].place
        value = rawResponse.weather_data.temperature.data[0].value
        unit = rawResponse.weather_data.temperature.data[0].unit
    }
}
