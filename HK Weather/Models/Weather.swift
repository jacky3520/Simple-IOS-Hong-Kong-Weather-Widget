//
//  Weather.swift
//  HK WeatherExtension
//
//  Created by Cheung Chin Hang on 3/6/2022.
//

import Foundation


struct Weather:Codable
{
    let name: String
    let temperature: Int
    let unit: String
    let description: String
}
