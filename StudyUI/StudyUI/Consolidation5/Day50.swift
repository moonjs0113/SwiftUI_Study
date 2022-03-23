//
//  Day50.swift
//  StudyUI
//
//  Created by Moon Jongseek on 2022/03/23.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if self.specialRequestEnabled == false {
                self.extraFrosting = false
                self.addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
}

struct Day50: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: self.$order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(self.order.quantity)", value: self.$order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: self.$order.specialRequestEnabled.animation())
                    if self.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: self.$order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: self.$order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink{
                        AddressView(order: self.order)
                    } label: {
                        Text("Deliver details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Text("AddressView")
    }
}

struct Day50_Previews: PreviewProvider {
    static var previews: some View {
        Day50()
    }
}
