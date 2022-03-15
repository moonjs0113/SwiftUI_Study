//
//  Day40.swift
//  StudyUI
//
//  Created by 문종식 on 2022/03/15.
//

import SwiftUI

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}

extension Bundle {
//    func decode(_ file: String) -> [String:Astronaut] {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()

        //        [String: Astronaut].self -> T.self
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}

struct Day40: View {
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missoins: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        Text("\(self.astronauts.count)")
    }
}

struct Day40_Previews: PreviewProvider {
    static var previews: some View {
        Day40()
    }
}
