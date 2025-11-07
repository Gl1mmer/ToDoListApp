//
//  CoreDataManager.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 04.11.2025.
//
import Foundation
import CoreData

final class CoreDataManager: NoteDataSource {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func createNote(_ note: Note) {
        let _ = NoteMapper.toEntity(note, context: context)
        try? context.save()
    }
    
    func fetchNotes() -> [Note] {
        let req = NoteEntity.fetchRequest()
        if let notes = try? context.fetch(req) {
            let notesDomain = notes.map {
                NoteMapper.toDomain(entity: $0)
            }
            return notesDomain
        }
        return []
    }
    
    func updateNote(_ noteId: String, note: Note) {
        let req = NoteEntity.fetchRequest()
        req.predicate = NSPredicate(format: "id == %@", noteId)
        if let notes = try? context.fetch(req), !notes.isEmpty, let noteToUpdate = notes.first {
            noteToUpdate.text = note.body
            noteToUpdate.title = note.title
            noteToUpdate.date = Date()
            
            try? context.save()
        }
    }
    
    func deleteNote(_ noteId: String) {
        let req = NoteEntity.fetchRequest()
        req.predicate = NSPredicate(format: "id == %@", noteId)
        if let notes = try? context.fetch(req), !notes.isEmpty, let noteToDelete = notes.first {
            context.delete(noteToDelete)
            try? context.save()
        }
    }
    
}
