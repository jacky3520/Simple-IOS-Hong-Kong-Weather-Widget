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
//        let Weather = Weather(name: "HK", temperature: 27, unit: "C", description: "Raining")
        let weather = Weather()

        return WeatherEntry(date: Date(), weather: weather);
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> Void) {
        let entry = WeatherEntry(date: Date(), weather: Weather(place: "HK", value: 27, unit: "C"))
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
                weather = fetchedData
            }
            else
            {
                weather = Weather()
            }
           
            let entry = WeatherEntry(date: currentDate, weather: weather)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
    
    typealias Entry = WeatherEntry
}
