//
//  Day44.swift
//  StudyUI
//
//  Created by 문종식 on 2022/03/17.
//

import SwiftUI

struct Day44: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        ScrollView {
            VStack {
                Flower(petalOffset: self.petalOffset, petalWidth: self.petalWidth)
//                        .stroke(.yellow, lineWidth: 1)
                    .fill(.brown, style: FillStyle(eoFill: true))
                
                Text("Offset")
                Slider(value: self.$petalOffset, in: -40...40)
                    .padding([.horizontal, .bottom])
                
                Text("Width")
                Slider(value: self.$petalWidth, in: 0...100)
                    .padding([.horizontal])
                
                VStack {
                    Text("Hello World")
                        .frame(width: 300, height: 50)
                        .background(.cyan)
                    
                    Text("Hello World")
                        .frame(width: 300, height: 50)
                        .border(.red, width: 10)
                    
                    Text("Hello World")
                        .frame(width: 300, height: 50)
                        .background(Image("apollo14"))
                    
//                    Text("Hello World")
//                        .frame(width: 300, height: 50)
//                        .border(Image("apollo14"), width: 10)
                    
                    Text("Hello World")
                        .frame(width: 300, height: 10)
                        .border(ImagePaint(image: Image("apollo14"), scale: 0.2), width: 10)
                    
                    Text("Hello World")
                        .frame(width: 300, height: 30)
                        .border(ImagePaint(image: Image("apollo14"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.2), width: 10)
                }
                
//                Capsule()
//                    .strokeBorder(ImagePaint(image: Image("apollo14"), scale: 0.1), lineWidth: 5)
//                    .frame(width: 300, height: 20)
            }
        }
    }
}
// "apollo14"
struct Day44_Previews: PreviewProvider {
    static var previews: some View {
        Day44()
    }
}
