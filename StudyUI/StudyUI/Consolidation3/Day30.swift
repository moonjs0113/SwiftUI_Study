//
//  Day30.swift
//  StudyUI
//
//  Created by 문종식 on 2022/03/03.
//

import SwiftUI

struct Day30: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    func addNewWord() {
        let answer = self.newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        withAnimation{
            self.usedWords.insert(answer, at: 0)
        }
        self.newWord = ""
    }
    
    func startGame() {
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                let allWords = fileContents.components(separatedBy: "\n")
                self.rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: self.$newWord)
                        .autocapitalization(.none)
//                        .onSubmit { self.addNewWord() }
                }
                
                Section {
                    ForEach(self.usedWords, id: \.self) { word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
        }
        .navigationTitle(self.rootWord)
        .onSubmit(self.addNewWord)
        .onAppear(perform: self.startGame)
    }
}

struct Day30_Previews: PreviewProvider {
    static var previews: some View {
        Day30()
    }
}
