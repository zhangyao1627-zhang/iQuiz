//
//  iQuizApp.swift
//  iQuiz
//
//  Created by Yao Zhang on 5/5/24.
//

import SwiftUI

@main
struct iQuizApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
