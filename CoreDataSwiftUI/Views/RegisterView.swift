//
//  RegisterView.swift
//  CoreDataSwiftUI
//
//  Created by Content Arcade on 19/05/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var authVM = AuthVM()
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    private var users: FetchedResults<User>
    
    var body: some View {
        VStack(spacing: 20){
            Image(systemName: "person.badge.key.fill")
                .font(.system(size: 100))
                .padding(32)
                .foregroundColor(.white)
            Text("Enter your credentials to continue")
                .font(.system(.body, design: .monospaced))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)

            TextField("Enter fullname", text: $authVM.name)
                .textFieldStyle(.roundedBorder)

            TextField("Enter Email address", text: $authVM.email)
                .textFieldStyle(.roundedBorder)

            SecureField("Create Password", text: $authVM.password)
                .textFieldStyle(.roundedBorder)

            TextField("Descriptions", text: $authVM.descriptions)
                .textFieldStyle(.roundedBorder)
            
            
            Button { registerNewUser() } label: {
                Text("Register")
                    .font(.system(.title2, design: .monospaced, weight: .black))
                    .frame(maxWidth: 150, maxHeight: 60)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(12)
                    .padding(.vertical, 32)
            }

            HStack {
                Text("Existing Member?")
                .font(.system(.body, design: .monospaced))
                .multilineTextAlignment(.center)
                NavigationLink {
                    Text("HELLO")
                } label: {
                    Text("Login")
                        .font(.system(.title3, design: .monospaced, weight: .black))
                    .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
               
            
        }
        .padding(32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.purple, .red, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
        .alert(Text("Inavlid Info"),
               isPresented: $authVM.showEmptyFieldAlert) {} message: {
            Text("Please provide valid informations to continue.")
        }

    }
    
    private func registerNewUser() {
        if authVM.name.isEmpty || authVM.email.isEmpty ||
            authVM.password.isEmpty || authVM.descriptions.isEmpty {
            authVM.showEmptyFieldAlert.toggle()
        } else {
            withAnimation {
                let user = User(context: viewContext)
                user.name = authVM.name
                user.email = authVM.email
                user.password = authVM.password
                user.descriptions = authVM.descriptions
                saveCoreDateContext()
            }
        }
    }
    
    private func saveCoreDateContext() {
        do {
            try viewContext.save()
        } catch {
            print("An error occured: \(error.localizedDescription)")
        }
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}


