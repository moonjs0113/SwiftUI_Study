//
//  ContentView16p2.swift
//  StudyUI
//
//  Created by 문종식 on 2022/02/18.
//

import SwiftUI

struct ContentView16p2: View {
    // @State랑 같음 UI 입력 포커싱에 쓰임
    @FocusState private var amountIsFocused: Bool
    
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 0
    @State private var tipPercentage: Int = 20

    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let tipValue = (self.checkAmount / 100) * Double(self.tipPercentage)
        let grandTotal = self.checkAmount + tipValue
        let amountPerPerson = grandTotal / Double(self.numberOfPeople + 2)
        
        return amountPerPerson
    }
    
    var body: some View {
        Form {
            Group{
                Section {
                    // Locale 지역 클래스
                    TextField("Amount", value: self.$checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"), prompt: Text("Prompt Text - Placeholder"))
                        .keyboardType(.decimalPad)
                        .focused(self.$amountIsFocused)
                    // NavigationView로 감싸줘야 하지만,
                    // Navigation에서 넘어온거라 안해줘도 작동함
                    Picker("Number Of People", selection: self.$numberOfPeople){
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Text("Not Real Title")
                    Picker("Tip Percentage", selection: self.$tipPercentage) {
                        ForEach(self.tipPercentages, id: \.self) { tip in
                            Text(tip, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    // Section Title 붙이는 법
                    Text("Real Section Title")
                }
                
                Section {
                    Text(self.totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
                
            }
        }
        .navigationTitle("SwiftUI Day16 - part 2")
        .navigationBarTitleDisplayMode(.large)
        // ToolBar를 붙일 수 있음 -> Navigation View에만 붙일 수 있나?
        // ToolbarItemPlacement
        .toolbar {
            // Tool Bar Group 지정
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    self.amountIsFocused = false
                }
            }
        }
    }
}

struct ContentView16p2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView16p2()
    }
}
