//
//  TasksView.swift
//  CoreDataSwiftUI
//
//  Created by Content Arcade on 19/05/2023.
//

import SwiftUI

struct TasksView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Task.entity(), sortDescriptors: [])
    private var tasks: FetchedResults<Task>
    @State var newTask = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button { addTask() } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 32))
                        .foregroundColor(.black)
                        .padding(7)
                        .overlay {
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(.black, lineWidth: 2)
                        }
                        
                }
            }
            .padding()
            
            ScrollView(showsIndicators: false) {
                ForEach(tasks, id: \.self) { task in
                    Text(task.wrappedTask)
                }
            }
        }
    }
    
    func addTask() {
        withAnimation {
            let task = Task(context: viewContext)
            task.task = newTask
            task.date = Date.now
            let user = task.user
            user?.name = "Test"
            //MARK: TODO
            //Need to update the user model also
            
            saveCoreDateContext()
        }
        
        saveCoreDateContext()
    }
    private func saveCoreDateContext() {
        do {
            try viewContext.save()
        } catch {
            print("An error occured: \(error.localizedDescription)")
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
