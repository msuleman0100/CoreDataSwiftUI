//
//  Task+CoreDataProperties.swift
//  CoreDataSwiftUI
//
//  Created by Content Arcade on 19/05/2023.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var task: String?
    @NSManaged public var date: Date?
    @NSManaged public var user: User?
    
    public var wrappedTask: String {
        task ?? "Unknown Task"
    }

}

extension Task : Identifiable {

}
