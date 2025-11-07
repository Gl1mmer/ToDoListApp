//
//  Note.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 04.11.2025.
//

import Foundation

struct Note: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var body: String
}
