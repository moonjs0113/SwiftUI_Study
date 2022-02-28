//
//  Day26.swift
//  StudyUI
//
//  Created by 문종식 on 2022/02/27.
//

import SwiftUI

struct Day26: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    func exampleDates() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
    
    var body: some View {
        Stepper("\(self.sleepAmount) hours", value: self.$sleepAmount)
        Stepper("\(self.sleepAmount) hours\nin 4...12", value: self.$sleepAmount, in: 4...12)
        Stepper("\(self.sleepAmount) hours\nin 4...12, step: 0.25", value: self.$sleepAmount, in: 4...12, step: 0.25)
        Stepper("\(self.sleepAmount.formatted()) hours\nin 4...12, step: 0.25 with formatted()", value: self.$sleepAmount, in: 4...12, step: 0.25)
        
        DatePicker("Please enter a date", selection: $wakeUp)
        DatePicker("", selection: $wakeUp)
        DatePicker("Please enter a date", selection: $wakeUp)
            .labelsHidden()
        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
    }
}

struct Day26_Previews: PreviewProvider {
    static var previews: some View {
        Day26()
    }
}
