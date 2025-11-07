//
//  NoteMapper.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 07.11.2025.
//

import Foundation
import CoreData

struct NoteMapper {
    static func toEntity(_ note: Note, context: NSManagedObjectContext) -> NoteEntity {
        let entity = NoteEntity(context: context)
        entity.id = note.id
        entity.text = note.body
        entity.title = note.title
        entity.date = Date()
        return entity
    }
    
    static func toDomain(entity: NoteEntity) -> Note {
        let noteTitle = entity.title ?? ""
        let noteBody = entity.text ?? ""
        return Note(id: entity.id!, title: noteTitle, body: noteBody)
    }
}
