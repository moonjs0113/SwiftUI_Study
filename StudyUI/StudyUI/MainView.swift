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
                } header: {
                    Text("Consolidation II")
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
