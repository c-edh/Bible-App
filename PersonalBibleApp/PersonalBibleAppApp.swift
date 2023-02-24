//
//  PersonalBibleAppApp.swift
//  PersonalBibleApp
//
//  Created by Corey Edh on 2/22/23.
//

import SwiftUI

@main
struct PersonalBibleAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: BibleViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
