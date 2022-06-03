//
//  WidgetTimeline.swift
//  HK WeatherExtension
//
//  Created by Cheung Chin Hang on 3/6/2022.
//

import SwiftUI
import WidgetKit

struct WeatherTimeline: TimelineProvider
{
    func placeholder(in context: Context) -> WeatherEntry {
        let Weather = Weather(name: "HK", temperature: 27, unit: "C", description: "Raining")
        return WeatherEntry(date: Date(), weather: Weather);
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> Void) {
        let entry = WeatherEntry(date: Date(), weather: Weather(name: "HK", temperature: 27, unit: "C", description: "Raining"))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
        
        WeatherService().getWeather
        {
            (result) in let weather: Weather
            if case .success(let fetchedData) = result
            {
                weather = fetchedData.first!
            }
            else
            {
                weather = Weather(name: "HK", temperature: 0, unit: "C", description: "Error getting weather info")
            }
           
            let entry = WeatherEntry(date: currentDate, weather: weather)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
    
    typealias Entry = WeatherEntry
    
//    func snapshot(with context: Context, completion: @escaping (WeatherEntry) -> ())
//    {
//
//    }
    
//    func timeline(with context: Context, completion: @escaping (Timeline<WeatherEntry>) -> ())
//    {
//        let currentDate = Date()
//        let refreshDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
//
//        WeatherService().getWeather
//        {
//            (result) in let weather: Weather
//            if case .success(let fetchedData) = result
//            {
//                weather = fetchedData.first!
//            }
//            else
//            {
//                weather = Weather(name: "HK", temperature: 0, unit: "C", description: "Error getting weather info")
//            }
//
//            let entry = WeatherEntry(date: currentDate, weather: weather)
//            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
//            completion(timeline)
//        }
//    }
}
