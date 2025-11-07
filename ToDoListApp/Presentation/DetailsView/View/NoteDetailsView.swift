//
//  DetailsView.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 07.11.2025.
//

import SwiftUI

struct NoteDetailsView: View {
    @StateObject var viewModel: NoteDetailsViewModel
    
    @State private var isEditing = false
    @State private var draftTitle: String = ""
    @State private var draftBody: String = ""

    var body: some View {
        Group {
            if isEditing {
                Form {
                    Section(header: Text("Заголовок")) {
                        TextField("Введите заголовок", text: $draftTitle)
                    }
                    Section(header: Text("Текст")) {
                        TextEditor(text: $draftBody)
                            .frame(minWidth: 200)
                    }
                }
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(viewModel.note.title)
                            .font(.title2)
                            .bold()
                        Text(viewModel.note.body)
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
        }
        .navigationTitle(isEditing ? "Редактирование" : "Заметка")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if isEditing {
                    Button("Сохранить") {
                        let newNote = Note(id: viewModel.note.id ,title: draftTitle, body: draftBody)
                        viewModel.updateNote(noteId: viewModel.note.id, note: newNote)
                        viewModel.note = newNote
                        isEditing = false
                    }
                } else {
                    Button("Изменить") {
                        isEditing = true
                    }
                }
            }
            if isEditing {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Отмена") {
                        isEditing = false
                    }
                }
            }
        }
    }
}

