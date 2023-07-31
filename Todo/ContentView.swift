//
//  ContentView.swift
//  Todo
//
//  Created by Anas Muhsin on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [Todo(Title: "Feed the cat"), Todo(Title: "Play with cat"), Todo(Title: "Get allergies"), Todo(Title: "Run away from cat"), Todo(Title: "Get a new cat")]
    
    var body: some View {
        NavigationStack{
            List(todos) { todo in
                Text(todo.Title)
            }
            .navigationTitle("Todos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
