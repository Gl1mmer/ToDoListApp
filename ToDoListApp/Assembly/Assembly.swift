//
//  AssemblyClass.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 07.11.2025.
//

import Foundation
import CoreData

class Assembly {
    static func createContentViewModel() -> ContentViewModel {
        
        let context = PersistentController()
        let dataSourceImpl = CoreDataManager(context: context.persistentContainer.viewContext)
        let createNoteRepo = NoteRepositoryImpl(dataSource: dataSourceImpl)
        
        let createNoteUseCase = CreateNoteUseCaseImpl(repo: createNoteRepo)
        
        let fetchNotesUseCase = FetchNotesUseCaseImpl(repo: createNoteRepo)
        
        let deleteNoteUseCase = DeleteNoteUseCaseImpl(repo: createNoteRepo)
        
        let contentViewModel = ContentViewModel(createNoteUseCase: createNoteUseCase,
                                                fetchNotesUseCase: fetchNotesUseCase,
                                                deleteNoteUseCase: deleteNoteUseCase)
        
        return contentViewModel
    }
    
    static func createDetailsViewModel(note: Note) -> NoteDetailsViewModel {
        let context = PersistentController()
        let dataSourceImpl = CoreDataManager(context: context.persistentContainer.viewContext)
        let noteRepo = NoteRepositoryImpl(dataSource: dataSourceImpl)
        
        let updateUseCase = UpdateNoteUseCaseImpl(repo: noteRepo)
        
        return NoteDetailsViewModel(updateNoteUseCase: updateUseCase, note: note )
        
    }
}

