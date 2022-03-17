//
//  Day45.swift
//  StudyUI
//
//  Created by Moon Jongseek on 2022/03/18.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double
    var animatableData: Double {
        get { self.insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: self.insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - self.insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct TrapezoidView: View {
    @State private var insetAmount = 50.0
    
    var body: some View {
        Trapezoid(insetAmount: self.insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
//                self.insetAmount = Double.random(in: 10...90)
                withAnimation{
                    self.insetAmount = Double.random(in: 10...90)
                }
            }
    }
}

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double,Double> {
        get {
            AnimatablePair(Double(self.rows), Double(self.columns))
        }
        
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / Double(self.rows)
        let columnSize = rect.height / Double(self.columns)
        
        for row in 0..<self.rows {
            for column in 0..<self.columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}

struct CheckerboardView: View {
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        Checkerboard(rows: self.rows, columns: self.columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    self.rows = 8
                    self.columns = 16
                }
            }
    }
}

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
            
            VStack(spacing:15) {
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
                
                NavigationLink("Trapezoid", destination: TrapezoidView())
                NavigationLink("CheckerboardView", destination: CheckerboardView())
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
