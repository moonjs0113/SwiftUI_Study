//
//  ContentView.swift
//  StudyUI
//
//  Created by 문종식 on 2022/02/17.
//

import SwiftUI

struct ContentView: View {
    // @State : mutating, View가 다 구조체라서 mutating 속성이 필요함
    @State private var tapCount: CGFloat = 0
    @State private var stateString: String = ""
    @State private var colorString: String = ""
    
    let arrayColor: [String] = ["Red", "Blue", "Yellow", "Black", "White", "Gray", "Green"]
    
    var body: some View {
        NavigationView {
            // Form = TableView 맞는듯
            // child View를 10개까지만 넣을 수 있는듯 11개가 넘어가면 오류
            // -> Section이나 Group으로 묶으면 11개 이상도 가능함
            Form {
                Picker("Select Color", selection: $colorString) {
                    ForEach(self.arrayColor, id: \.self) { color in
                        Text(color)
                    }
                }
                Group {
                    // Text = UILabel
                    Text("Group, world #1").padding()
                    // $ -> two-way binding 양방향 바인딩이라는 표시
                    TextField("TextField #2 without padding()",text: $stateString)
                    Text("Group, world #3 without padding()")
                    Button("Tap Count: \(self.tapCount)") {
                        self.tapCount += 1
                    }.padding(self.tapCount)
                    Text("If you tap button, increase padding")
                    Text("Text in TextField: \(stateString)")
                }
                Section {
                    Group {
                        Text("Group in Section")
                    }
                    ForEach(4..<7) { index in // 인자 하나 받음
                        Text("Group, world #\(index)")
                    }
                    Section {
                        Text("Section in Section with padding").padding()
                    }
                }
                Group {
                    Group {
                        Text("Group in Group #1").padding()
                    }
                    Section {
                        Text("Section in Group #1 without padding()")
                    }
                }
                Group {
                    Text("Last Text")
                }
            }
            .navigationTitle("SwiftUI Navigation")
            .navigationBarTitleDisplayMode(.inline) // .large = .automatic
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
