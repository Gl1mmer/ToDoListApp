//
//  UpdateNotesUseCase.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 04.11.2025.
//
import Foundation

protocol UpdateNoteUseCase {
    func execute(noteId: String, note: Note)
}

final class UpdateNoteUseCaseImpl: UpdateNoteUseCase {
    
    private let repo: UpdateNoteRepository
    init(repo: UpdateNoteRepository) {
        self.repo = repo
    }
    func execute(noteId: String, note: Note) {
        repo.updateNote(noteId: noteId, note: note)
    }
}
