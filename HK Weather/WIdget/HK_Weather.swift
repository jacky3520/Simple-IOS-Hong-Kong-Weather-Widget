

import WidgetKit
import SwiftUI

@main
struct WeatherWidget: Widget {
    private var kind: String = "WeatherWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WeatherTimeline()) { entry in
            WeatherEntryView(entry: entry)
        }
        .configurationDisplayName("HK Weather")
        .description("HK Weather")
    }
}
