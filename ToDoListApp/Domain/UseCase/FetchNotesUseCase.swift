//
//  FetchNotesUseCase.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 04.11.2025.
//
import Foundation

protocol FetchNotesUseCase {
    func execute() -> [Note]
}

final class FetchNotesUseCaseImpl: FetchNotesUseCase {
    private let repo: FetchNotesRepository
    init(repo: FetchNotesRepository) {
        self.repo = repo
    }
    func execute() -> [Note] {
        repo.fetchAllNotes()
    }
}
