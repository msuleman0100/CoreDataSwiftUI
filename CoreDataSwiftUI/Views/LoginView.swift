//
//  LoginView.swift
//  CoreDataSwiftUI
//
//  Created by Content Arcade on 19/05/2023.
//

import SwiftUI

struct LoginView: View {
    
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
            
            TextField("Enter Email address", text: $authVM.email)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Enter Password", text: $authVM.password)
                .textFieldStyle(.roundedBorder)
            
            Button { loginUser()  } label: {
                Text("Login")
                    .font(.system(.title, design: .monospaced, weight: .black))
                    .frame(maxWidth: 130, maxHeight: 50)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(12)
                    .padding(.vertical, 32)
            }

            HStack {
                Text("New Member?")
                .font(.system(.body, design: .monospaced))
                .multilineTextAlignment(.center)
                NavigationLink {
                    Text("HELLO")
                } label: {
                    Text("Register")
                        .font(.system(.title3, design: .monospaced, weight: .black))
                    .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.white)
//            .alert(Text("Incomplete Info!"),
//                   isPresented: $authVM.showEmptyFieldAlert) {} message: {
//                Text("Please provide complete credentials to login.")
//            }
        }
        .padding(32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.purple, .red, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
        .alert(Text("Login Failed!"),
               isPresented: $authVM.showLoginFailedAlert) {} message: {
            Text("Please provide valid credentials to login.")
        }
               
        
    }
    
    private func loginUser() {
        if authVM.email.isEmpty || authVM.password.isEmpty {
            authVM.showEmptyFieldAlert.toggle()
        } else {
            if users.contains(where: { user in
                user.email == authVM.email && user.password == authVM.password
            }) {
                print("Matched.....")
            } else { authVM.showLoginFailedAlert.toggle() }
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



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
