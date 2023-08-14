//
//  MainTodoListView.swift
//  Todo
//
//  Created by Anas Muhsin on 14/08/2023.
//

import SwiftUI

struct MainTodoListView: View {
    
    @ObservedObject var todoManager: TodoManager
    
    @State private var showAddSheet = false
    
    @State private var showConfirmAlert = false
    
    
    var body: some View {
        NavigationStack{
            List {
                ForEach($todoManager.todos, editActions: [.all]) { $todo in
                    TodoRowView(todo: $todo)
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup {
                    
                    #if DEBUG
                    Button {
                        showConfirmAlert = true
                    } label: {
                        Image(systemName: "list.bullet.clipboard.fill")
                    }
                    #endif
                    
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
            }
        }
        .sheet(isPresented: $showAddSheet) {
            NewTodoView(sourceArray: $todoManager.todos)
        }
        .alert("Load sample data? Warning: This can't be undone!", isPresented: $showConfirmAlert) {
            Button("Replace", role: .destructive) {
                todoManager.loadSampleData()
            }
        }    }
}

struct MainTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView(todoManager: TodoManager())
    }
}
