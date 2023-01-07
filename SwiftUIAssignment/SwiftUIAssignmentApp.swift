//
//  SwiftUIAssignmentApp.swift
//  SwiftUIAssignment
//
//  Created by Consultant on 1/7/23.
//

import SwiftUI

@main
struct SwiftUIAssignmentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
