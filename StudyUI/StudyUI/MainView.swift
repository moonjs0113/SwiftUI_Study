//
//  MainView.swift
//  StudyUI
//
//  Created by 문종식 on 2022/02/19.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            Form {
                Section {
                    NavigationLink("Project 1", destination: Day16())
                    NavigationLink("Project 2", destination: Day20())
                    NavigationLink("Project 3", destination: Day23())
                    NavigationLink("Consolidation II", destination: Consolidation2())
                    
                } header: {
                    Text("Consolidation II")
                }
                Section {
                    NavigationLink("Project 4", destination: Day26())
                    NavigationLink("Project 5", destination: Day29())
                } header: {
                    Text("Consolidation III")
                }
            }
            .navigationTitle("SwiftUI Study App")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
