//
//  Day45.swift
//  StudyUI
//
//  Created by Moon Jongseek on 2022/03/18.
//

import SwiftUI

struct Day45: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                Image("PaulHudson")
                
                Rectangle()
                    .fill(.red)
                    .blendMode(.multiply)
            }
            .frame(width: 40, height: 50)
            .clipped()
            
//            Image("PaulHudson")
//                .colorMultiply(.blue)
            
            Image("PaulHudson")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .saturation(self.amount)
                .blur(radius: (1 - self.amount) * 20)
            
            VStack {
                ZStack {
                    Circle()
                        .fill(.yellow)
                        .frame(width: 200 * self.amount)
                        .offset(x: -50, y: -80)
                        .blendMode(.screen)
                    
                    Circle()
                        .fill(.green)
                        .frame(width: 200 * self.amount)
                        .offset(x: 50, y: -80)
                        .blendMode(.screen)
                    
                    Circle()
                        .fill(.blue)
                        .frame(width: 200 * self.amount)
                        .blendMode(.screen)
                }
                .frame(width: 300, height: 300)
                
                Slider(value: self.$amount)
                    .padding()
            }
            .frame(width: .infinity, height: .infinity)
            .background(.purple)
            .ignoresSafeArea()
        }
        
    }
}

struct Day45_Previews: PreviewProvider {
    static var previews: some View {
        Day45()
    }
}
