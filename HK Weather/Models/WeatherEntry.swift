//
//  WeatherEntry.swift
//  HK WeatherExtension
//
//  Created by Cheung Chin Hang on 3/6/2022.
//

import Foundation
import SwiftUI
import WidgetKit

struct WeatherEntry: TimelineEntry
{
    public let date: Date
    public let weather: Weather
}
