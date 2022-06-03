//
//  PlaceholderView.swift
//  HK WeatherExtension
//
//  Created by Cheung Chin Hang on 3/6/2022.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {
        ZStack
        {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 255))
            VStack (alignment: .leading)
            {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white).frame(width: 80, height: 20)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white).frame(width: 80, height: 20)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white).frame(width: 80, height: 20)
            }.padding()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
