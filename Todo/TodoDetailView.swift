//
//  TodoDetailView.swift
//  Todo
//
//  Created by Anas Muhsin on 31/07/2023.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        Form {
            TextField("Title", text: $todo.Title)
            TextField("Subtitle", text: $todo.subtitle)
            Toggle("Completed?", isOn: $todo.isCompleted)
        }
        .navigationTitle("Todo detail")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: .constant(Todo(Title: "feed the demo cat")))
    }
}
