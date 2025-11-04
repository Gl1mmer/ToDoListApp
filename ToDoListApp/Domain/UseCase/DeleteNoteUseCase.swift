//
//  DeleteNoteUseCase.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 04.11.2025.
//
import Foundation

protocol DeleteNoteUseCase {
    func execute(noteId: String)
}

final class DeleteNoteUseCaseImpl: DeleteNoteUseCase {
    private let repo: DeleteNoteRepository
    
    init(repo: DeleteNoteRepository) {
        self.repo = repo
    }
    
    func execute(noteId: String) {
        repo.deleteNote(noteId: noteId))
    }
}
