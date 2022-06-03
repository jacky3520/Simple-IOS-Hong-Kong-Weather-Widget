//
//  Date+Extensions.swift
//  HK WeatherExtension
//
//  Created by Cheung Chin Hang on 3/6/2022.
//


import Foundation

extension Date {
    func timeOnly() -> String {
        let fromDate = self
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: fromDate)
    }
}
