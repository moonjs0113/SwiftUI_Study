//
//  MainView.swift
//  StudyUI
//
//  Created by 문종식 on 2022/02/19.
//

import SwiftUI

struct MainView: View {
    @StateObject private var dataController = DataController()
    
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
                
                Section("Consolidation III") {
                    NavigationLink("Project 4", destination: Day26())
                    NavigationLink("Project 5", destination: Day29())
                    NavigationLink("Project 6", destination: Day32())
                }
                
                Section("Consolidation IV") {
                    NavigationLink("Project 7", destination: Day36())
                    NavigationLink("Project 8", destination: Day39())
                    NavigationLink("Project 9", destination: Day43())
                }
                
                Section("Consolidation V") {
                    NavigationLink("Project 10", destination: Day49())
                    NavigationLink("Project 11", destination: Day53()
                                    .environment(\.managedObjectContext, self.dataController.container.viewContext)
                    )
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
