//
//  Day23.swift
//  StudyUI
//
//  Created by 문종식 on 2022/02/21.
//

import SwiftUI

struct Day23: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        // modifier 순서 중요함.
        Form {
            CapsuleText(text: "Capsule Text")
            OutCapsuleText(text: "Out Capsule Text")
            self.spells
            HStack() {
                self.motto1
                    .foregroundColor(.red)
                self.motto2
                    .foregroundColor(.blue)
            }
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.red)
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
                .padding()
                .background(.cyan)
                .padding()
                .background(.white)
                .padding()
                .background(.purple)
                .padding()
                .background(.secondary)
                .blur(radius: 2)
            Button("Hello, World! Button") {
                
            }
            .background(.red)
            .frame(width: 150, height: 100)
            Button("Hello, World! Button") {
                
            }
            .frame(width: 200, height: 100)
            .background(.red)
        }
    }
    
    struct CapsuleText: View {
        var text: String

        var body: some View {
            Text(text)
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Capsule())
        }
    }
}

struct OutCapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct Day23_Previews: PreviewProvider {
    static var previews: some View {
        Day23()
    }
}
