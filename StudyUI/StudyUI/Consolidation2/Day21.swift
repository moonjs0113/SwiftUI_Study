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
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    func flagTapped(_ number: Int) {
        self.scoreTitle = number == self.correctAnswer ? "Correct" : "Wrong"
        self.showingScore = true
    }
    
    func askQuestion() {
        self.countries.shuffle()
        self.correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
//                    .ignoresSafeArea()
            HStack(spacing: 5) {
                VStack{
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(self.countries[self.correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                VStack(spacing: 10) {
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
            }.frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: self.askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
}

struct Day21_Previews: PreviewProvider {
    static var previews: some View {
        Day21()
    }
}
