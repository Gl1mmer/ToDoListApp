//
//  FetchNotesRepository.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 04.11.2025.
//
import Foundation

protocol FetchNotesRepository {
    func fetchAllNotes() -> [Note]
}
