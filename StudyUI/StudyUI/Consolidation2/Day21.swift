//
//  Day21.swift
//  StudyUI
//
//  Created by 문종식 on 2022/02/20.
//

import SwiftUI

struct Day21: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingAnswer = false
    @State private var showingTotalScore = false
    
    @State private var alertMessage = ""
    
    @State private var myScore: Int = 0
    @State private var questionCount: Int = 1
    
    func countQuestion() {
        if self.questionCount < 8 {
            self.questionCount += 1
        } else {
            self.showingTotalScore = true
        }
    }
    
    func flagTapped(_ number: Int) {
        self.countQuestion()
        if (number == self.correctAnswer) {
            self.myScore += 1
            self.askQuestion()
        } else {
            self.alertMessage = "That’s the flag of \(self.countries[number])"
            self.showingAnswer = true
        }
    }
    
    func askQuestion() {
        if !self.showingTotalScore {
            self.countries.shuffle()
            self.correctAnswer = Int.random(in: 0...2)
        }
    }
    
    func initGame() {
        self.questionCount = 1
        self.myScore = 0
        self.askQuestion()
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                HStack(alignment: .center, spacing: 10) {
                    VStack{
                        Text("Tap the flag of")
                            .foregroundColor(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(self.countries[self.correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    VStack(alignment: .center, spacing: 10) {
                        ForEach(0..<3) { number in
                            Button {
                                self.flagTapped(number)
                            } label: {
                                Image(self.countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 5)
                                    .frame(maxHeight: 100)
                            }
                        }
                    }
                }
                Text("\(self.questionCount) / 8")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }.alert("Wrong", isPresented: self.$showingAnswer) {
            Button("Continue", action: self.askQuestion)
        } message: {
            Text("\(self.alertMessage)")
        }.alert("End", isPresented: self.$showingTotalScore) {
            Button("Restart", action: self.initGame)
        } message: {
            Text("Your Score is \(self.myScore)!")
        }
    }
}

struct Day21_Previews: PreviewProvider {
    static var previews: some View {
        Day21()
    }
}
