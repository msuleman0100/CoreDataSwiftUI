//
//  CoreDataSwiftUIApp.swift
//  CoreDataSwiftUI
//
//  Created by Content Arcade on 19/05/2023.
//

import SwiftUI

@main
struct CoreDataSwiftUIApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
