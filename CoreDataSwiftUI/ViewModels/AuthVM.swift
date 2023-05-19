//
//  AuthVM.swift
//  CoreDataSwiftUI
//
//  Created by Content Arcade on 19/05/2023.
//

import Foundation
import SwiftUI
import CoreData

class AuthVM: ObservableObject {
    
    @Published var name: String =  ""
    @Published var email: String =  ""
    @Published var password: String =  ""
    @Published var descriptions: String =  ""
    
    //Alerts Toggles...
    @Published var showLoginFailedAlert = false
    @Published var showEmptyFieldAlert = false
    
    
}


