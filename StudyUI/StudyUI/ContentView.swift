//
//  ContentView.swift
//  StudyUI
//
//  Created by 문종식 on 2022/02/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Form = TableView 맞는듯
        // child View를 10개까지만 넣을 수 있는듯 11개가 넘어가면 오류
        // -> Section이나 Group으로 묶으면 11개 이상도 가능함
        Form {
            Group {
                // Text = UILabel
                Text("Group, world #1").padding()
                Text("Group, world #2 without padding()")
                Text("Group, world #3 without padding()")
            }
            Section {
                Group {
                    Text("Group in Section")
                }
                Text("Section, world #4 without padding()")
                Text("Section, world #5").padding()
                Text("Section, world #6 without padding()")
                Section {
                    Text("Section in Section #1 without padding()")
                    Text("Section in Section #2").padding()
                }
            }
            Group {
                Text("Group, world #7 without padding()")
                Text("Group, world #8").padding()
                Text("Group, world #9 without padding()")
                Group {
                    Text("Group in Group #1").padding()
                    Text("Group in Group #2").padding()
                    Text("Group in Group #3 without padding()")
                }
                Section {
                    Text("Section in Group #1 without padding()")
                }
            }
            Group {
                Text("Group, world #10 without padding()")
                Text("Group, world #11 without padding()")
                Text("Group, world #12 without padding()")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
