//
//  ContentViewModel.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 07.11.2025.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var notes: [Note] = []

    
    private let createNoteUseCase: CreateNoteUseCase
    private let fetchNotesUseCase: FetchNotesUseCase
    private let deleteNoteUseCase: DeleteNoteUseCase
    
    init(createNoteUseCase: CreateNoteUseCase, fetchNotesUseCase: FetchNotesUseCase, deleteNoteUseCase: DeleteNoteUseCase) {
        self.createNoteUseCase = createNoteUseCase
        self.fetchNotesUseCase = fetchNotesUseCase
        self.deleteNoteUseCase = deleteNoteUseCase
    }
    
    func createNote(title: String, text: String) {
        createNoteUseCase.execute(note: Note(title: title, body: text))
        fetchNotes()
    }
    
    func fetchNotes() {
        notes = fetchNotesUseCase.execute()
    }
    
    func deleteNote(noteId: String) {
        deleteNoteUseCase.execute(noteId: noteId)
    }
}
