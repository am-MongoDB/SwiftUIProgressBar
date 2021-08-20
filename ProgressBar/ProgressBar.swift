//
//  ProgressBar.swift
//  ProgressBar
//
//  Created by Andrew Morgan on 20/08/2021.
//  Copyright © 2021 ProgrammingWithSwift. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    private let value: Double
    private let maxValue: Double
    private let backgroundEnabled: Bool
    private let backgroundColor: Color
    private let foregroundColor: Color
    
    init(value: Double,
         maxValue: Double,
         backgroundEnabled: Bool = true,
         backgroundColor: Color = Color(UIColor(red: 245/255,
                                                green: 245/255,
                                                blue: 245/255,
                                                alpha: 1.0)),
         foregroundColor: Color = Color.black) {
        self.value = value
        self.maxValue = maxValue
        self.backgroundEnabled = backgroundEnabled
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        HStack {
            ZStack {
                GeometryReader { geometryReader in
                    if backgroundEnabled {
                        Capsule()
                            .foregroundColor(backgroundColor)
                    }
                    Capsule()
                        .frame(width: progress(value: value, maxValue: maxValue, width: geometryReader.size.width))
                        .foregroundColor(foregroundColor)
                        .animation(.easeIn)
                }
            }
            Text("\(Int(100*value/maxValue))%")
                .foregroundColor(foregroundColor)
                .fontWeight(.heavy)
        }
    }
    
    private func progress(value: Double,
                          maxValue: Double,
                          width: CGFloat) -> CGFloat {
        let percentage = value / maxValue
        return width *  CGFloat(percentage)
    }

}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: 3.5, maxValue: 10.0)
    }
}

