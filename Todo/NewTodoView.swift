//
//  NewTodoView.swift
//  Todo
//
//  Created by Anas Muhsin on 13/08/2023.
//

import SwiftUI

struct NewTodoView: View {
    
    @State private var title = ""
    @State private var subtitle = ""
    @Binding var sourceArray: [Todo]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Info") {
                TextField("Title", text: $title)
                TextField("Subtitle", text: $subtitle)
            }
            
            Section("Actions") {
                Button("Save") {
                    let todo = Todo(Title: title, subtitle: subtitle)
                    sourceArray.append(todo)
                    dismiss()
                }
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(sourceArray: .constant([]))
    }
}
