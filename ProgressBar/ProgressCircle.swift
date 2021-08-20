//
//  ProgressCircle.swift
//  ProgressCircle
//
//  Created by Andrew Morgan on 20/08/2021.
//  Copyright © 2021 ProgrammingWithSwift. All rights reserved.
//

import SwiftUI

struct ProgressCircle: View {
    enum Stroke {
        case line
        case dotted
        
        func strokeStyle(lineWidth: CGFloat) -> StrokeStyle {
            switch self {
            case .line:
                return StrokeStyle(lineWidth: lineWidth,
                                   lineCap: .round)
            case .dotted:
                return StrokeStyle(lineWidth: lineWidth,
                                   lineCap: .round,
                                   dash: [12])
            }
        }
    }
    
    private let value: Double
    private let maxValue: Double
    private let style: Stroke
    private let backgroundEnabled: Bool
    private let backgroundColor: Color
    private let foregroundColor: Color
    private let lineWidth: CGFloat
    
    init(value: Double,
         maxValue: Double,
         style: Stroke = .line,
         backgroundEnabled: Bool = true,
         backgroundColor: Color = Color(UIColor(red: 245/255,
                                                green: 245/255,
                                                blue: 245/255,
                                                alpha: 1.0)),
         foregroundColor: Color = Color.red,
         lineWidth: CGFloat = 10) {
        self.value = value
        self.maxValue = maxValue
        self.style = style
        self.backgroundEnabled = backgroundEnabled
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.lineWidth = lineWidth
    }
    var body: some View {
        ZStack {
            if backgroundEnabled {
                Circle()
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(backgroundColor)
            }
            Circle()
                .trim(from: 0, to: CGFloat(self.value / self.maxValue))
                .stroke(style: style.strokeStyle(lineWidth: lineWidth))
                .rotationEffect(Angle(degrees: -90))
                .foregroundColor(foregroundColor)
                .animation(.easeIn)
            Text("\(Int(100*value/maxValue))%")
                .foregroundColor(foregroundColor)
                .fontWeight(.heavy)
        }
    }
}

struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircle(value: 6.5, maxValue: 10.0)
            .padding()
    }
}
