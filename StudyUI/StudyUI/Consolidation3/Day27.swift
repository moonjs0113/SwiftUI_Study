//
//  Day27.swift
//  StudyUI
//
//  Created by 문종식 on 2022/03/02.
//

import CoreML
import SwiftUI

struct Day27: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert: Bool = false
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: self.wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: self.sleepAmount, coffee: Double(self.coffeeAmount))
            
            let sleepTime = self.wakeUp - prediction.actualSleep
            self.alertTitle = "Your ideal bedtime is..."
            self.alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch (let error) {
            print(error)
            self.alertTitle = "Error"
            self.alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
        self.showingAlert = true
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("Please enter a time", selection: self.$wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper("\(self.sleepAmount.formatted()) hours", value: self.$sleepAmount, in: 4...12, step: 0.25)
                
                Text("Daily coffee intake")
                    .font(.headline)
                Stepper(self.coffeeAmount == 1 ? "1 cup" : "\(self.coffeeAmount) cops", value: self.$coffeeAmount, in: 1...20)
            }
            .navigationTitle("Project 4 - BetterRest")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Calculate", action: self.calculateBedTime)
            }
            .alert(self.alertTitle, isPresented: self.$showingAlert){
                Button("OK") {}
            } message: {
                Text(self.alertMessage)
            }
        }
    }
}

struct Day27_Previews: PreviewProvider {
    static var previews: some View {
        Day27()
    }
}
