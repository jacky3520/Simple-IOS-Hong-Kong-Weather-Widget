//
//  WeatherEntryView.swift
//  HK WeatherExtension
//
//  Created by Cheung Chin Hang on 3/6/2022.
//

import Foundation
import SwiftUI

struct WeatherEntryView: View
{
    let entry: WeatherEntry
    private let baseColor =   Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))

    var body: some View
    {
        ZStack
        {
            baseColor
            VStack
            {
                Text("Hong Kong")
                Text("\(entry.weather.value) °\(entry.weather.unit)").font(.largeTitle)
//                Text(getWeatherIcon(conditionString: entry.weather.description)).padding(.top, 10)
                Text(entry.weather.place).font(.footnote)
                HStack
                {
                    Spacer()
                    Text("Updated: \(entry.date.timeOnly())").font(.system(size: 12)).foregroundColor(Color.gray.opacity(0.5))
                }
            }.padding()
        }.edgesIgnoringSafeArea(.all)
        
    }
    
//    func getWeatherIcon(conditionString: String) -> String
//    {
//        return ""
//    }
}
