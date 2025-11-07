//
//  NoteDetailsViewModel.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 07.11.2025.
//

import Foundation
import Combine

class NoteDetailsViewModel: ObservableObject {
    
    var note: Note

    private let updateNoteUseCase: UpdateNoteUseCase

    init(updateNoteUseCase: UpdateNoteUseCase, note: Note) {
        self.updateNoteUseCase = updateNoteUseCase
        self.note = note
    }
     
    func updateNote(noteId: String, note: Note) {
        updateNoteUseCase.execute(noteId: noteId, note: note)
    }
    
}
