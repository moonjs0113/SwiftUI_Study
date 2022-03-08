//
//  Day36.swift
//  StudyUI
//
//  Created by 문종식 on 2022/03/07.
//

import SwiftUI

struct CodableUser: Codable {
    var firstName: String
    var lastName: String
}

// @StateObject 로 사용할 Class
// ObservableObject Protocol 채택
class User: ObservableObject {
    // @Published: ObservableObject의 상태 구독할 변수
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
    // @StateObject: Custom Objfect일때 사용하는 듯
    @StateObject private var user = User()
    @State private var showingSheet = false
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    @State private var tapCount: Int = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var AppStorageTapCount = 0
    
    @State private var codableUser = CodableUser(firstName: "Taylor", lastName: "Swift")
    @State private var loadCodableUser: CodableUser?
    @State private var isLoadSuccess = false
    
    func removeRows(at offsets: IndexSet) {
        self.numbers.remove(atOffsets: offsets)
    }
    
    var body: some View {
        VStack(spacing: 15) {
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
            
            NavigationLink("Day37", destination: Day37())
            
            VStack(spacing: 10) {
                Button("UserDefaults Tap count: \(self.tapCount)") {
                    self.tapCount += 1
                    UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                }
                
                Button("AppStorage Tap count: \(self.AppStorageTapCount)") {
                    self.AppStorageTapCount += 1
                }
                
                Button("Save Codable User") {
                    let encoder = JSONEncoder()
                    if let data = try? encoder.encode(self.codableUser) {
                        UserDefaults.standard.set(data, forKey: "UserData")
                    }
                }
                
                Button("Load Codable User") {
                    let decoder = JSONDecoder()
                    if let userData = UserDefaults.standard.data(forKey: "UserData") {
                        if let data = try? decoder.decode(CodableUser.self, from: userData) {
                            self.loadCodableUser = data
                        }
                    }
                    self.isLoadSuccess.toggle()
                }
                
                if self.isLoadSuccess {
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 250, height: 50)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    if let codableUser = self.loadCodableUser {
                        Text("Load name is \(codableUser.firstName) \(codableUser.lastName)")
                    }
                }
                
                Button("Delete Codable User") {
                    self.loadCodableUser = nil
                    UserDefaults.standard.removeObject(forKey: "UserData")
                }
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
