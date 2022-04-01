//
//  StudyUI2App.swift
//  StudyUI2
//
//  Created by Moon Jongseek on 2022/04/01.
//

import SwiftUI

@main
struct StudyUI2App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
