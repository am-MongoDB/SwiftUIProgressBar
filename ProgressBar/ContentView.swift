//
//  ContentView.swift
//  ProgressBar
//
//  Copyright © 2019 ProgrammingWithSwift. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = 3.0
    private let maxValue = 10.0
    
    var body: some View {
        VStack {
            ProgressBar(
                value: sliderValue,
                maxValue: maxValue,
                backgroundEnabled: true,
                foregroundColor: .green)
                .frame(height: 10)
                .padding(30)
            ProgressCircle(value: sliderValue,
                           maxValue: maxValue,
//                           style: .dotted,
                           foregroundColor: .red,
                           lineWidth: 10)
                .frame(height: 100)
            Spacer()
            Slider(value: $sliderValue, in: 0...maxValue)
                .padding(30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
