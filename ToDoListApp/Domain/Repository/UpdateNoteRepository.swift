//
//  UpdateNoteRepository.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 04.11.2025.
//
import Foundation

protocol UpdateNoteRepository {
    func updateNote(noteId: String, note: Note)
}
