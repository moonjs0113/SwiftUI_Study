//
//  Day36.swift
//  StudyUI
//
//  Created by 문종식 on 2022/03/07.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Text("Hello, \(self.name)")
        Button("Dismiss") {
            self.dismiss()
        }
    }
}

struct Day36: View {
    @StateObject private var user = User()
    @State private var showingSheet = false
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    func removeRows(at offsets: IndexSet) {
        self.numbers.remove(atOffsets: offsets)
    }
    
    var body: some View {
        VStack {
            Text("Your name is \(self.user.firstName) \(self.user.lastName)")
            TextField("First name", text: self.$user.firstName)
            TextField("Last name", text: self.$user.lastName)
            
            Button("Show sheet") {
                self.showingSheet.toggle()
            }
            .sheet(isPresented: self.$showingSheet) {
                SecondView(name: "@m_oon_js")
            }
            
            List {
                ForEach(self.numbers, id: \.self) {
                    Text("Row \($0)")
                }
                .onDelete(perform: self.removeRows(at:))
            }
            Button("Add Number") {
                self.numbers.append(self.currentNumber)
                self.currentNumber += 1
            }
        }
        .toolbar {
            EditButton()
        }
    }
}

struct Day36_Previews: PreviewProvider {
    static var previews: some View {
        Day36()
    }
}
