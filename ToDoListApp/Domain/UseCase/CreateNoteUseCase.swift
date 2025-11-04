//
//  CreateNote.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 04.11.2025.
//
import Foundation

protocol CreateNoteUseCase {
    func execute(note: Note)
}

final class CreateNoteUseCaseImpl: CreateNoteUseCase {
    private let repo: CreateNoteRepository
    init(repo: CreateNoteRepository) {
        self.repo = repo
    }
    func execute(note: Note) {
        repo.createNote(note: note)
    }
}
