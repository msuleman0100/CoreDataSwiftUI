//
//  DataController.swift
//  CoreDataSwiftUI
//
//  Created by Content Arcade on 19/05/2023.
//

import Foundation
import SwiftUI
import CoreData


class DataController: ObservableObject {


    let container = NSPersistentContainer(name: "TodoModel")
    init() {
        self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    
}
