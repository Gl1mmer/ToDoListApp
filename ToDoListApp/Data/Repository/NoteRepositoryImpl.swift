//
//  NoteRepositoryImpl.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 04.11.2025.
//
import Foundation

final class NoteRepositoryImpl: CreateNoteRepository, DeleteNoteRepository, UpdateNoteRepository, FetchNotesRepository {
    
    private let dataSource: NoteDataSource
    
    init(dataSource: NoteDataSource) {
        self.dataSource = dataSource
    }
    
    func createNote(note: Note) {
        dataSource.createNote(note)
    }
    
    func deleteNote(noteId: String) {
        dataSource.deleteNote(noteId)
    }
    
    func updateNote(noteId: String, note: Note) {
        dataSource.updateNote(noteId, note: note)
    }
    
    func fetchAllNotes() -> [Note] {
        dataSource.fetchNotes()
    }
}
