//
//  NoteDataSource.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 04.11.2025.
//

protocol NoteDataSource {
    func createNote(_ note: Note)
    func fetchNotes() -> [Note]
    func updateNote(_ noteId: String, note: Note)
    func deleteNote(_ noteId: String)
}
