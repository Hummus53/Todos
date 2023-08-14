//
//  Todo.swift
//  Todo
//
//  Created by Anas Muhsin on 31/07/2023.
//

import Foundation

struct Todo: Identifiable, Codable {
    var id = UUID()
    var Title: String
    var subtitle = ""
    var isCompleted = false
}
