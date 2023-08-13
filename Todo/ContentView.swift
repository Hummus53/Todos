//
//  ContentView.swift
//  Todo
//
//  Created by Anas Muhsin on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [Todo(Title: "Feed the cat"), Todo(Title: "Play with cat"), Todo(Title: "Get allergies"), Todo(Title: "Run away from cat"), Todo(Title: "Get a new cat")]
    
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack{
            List {
                ForEach($todos, editActions: [.all]) { $todo in
                    NavigationLink {
                        TodoDetailView(todo: $todo)
                    } label: {
                        HStack{
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                }
                            VStack(alignment: .leading) {
                                Text(todo.Title)
                                    .strikethrough(todo.isCompleted)
                                if !todo.subtitle.isEmpty {
                                    Text(todo.subtitle)
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                        .strikethrough(todo.isCompleted)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                NewTodoView(sourceArray: $todos)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
