//
//  Todo.swift
//  Todo
//
//  Created by Anas Muhsin on 31/07/2023.
//

import Foundation

struct Todo: Identifiable {
    let id = UUID()
    var Title: String
    var isCompleted = false
}
