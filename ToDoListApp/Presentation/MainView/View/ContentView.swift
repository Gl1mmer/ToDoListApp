//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Amankeldi Zhetkergen on 04.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    @State private var isPresentingAdd = false
    @State private var draftTitle: String = ""
    @State private var draftBody: String = ""
    
    @StateObject var viewModel = Assembly.createContentViewModel()
    
    private func deleteNotes(at offSet: IndexSet) {
        offSet.forEach{ index in
            let deleteNote = viewModel.notes[index]
            viewModel.deleteNote(noteId: deleteNote.id )
        }
        viewModel.notes.remove(atOffsets: offSet)        
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(value: note) {
                        VStack(alignment: .leading,spacing: 4) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.body)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .onDelete(perform: deleteNotes)
            }
            .onAppear {
                viewModel.fetchNotes()
            }
            .navigationTitle("Заметки")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresentingAdd.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Добавить заметку")
                }
            }
            .sheet(isPresented: $isPresentingAdd) {
                NavigationStack() {
                    Form {
                        Section(header: Text("Заголовок")) {
                            TextField("Введите заголовок", text: $draftTitle)
                        }
                        Section(header: Text("Текст")) {
                            TextEditor(text: $draftBody)
                                .frame(minHeight: 160)
                        }
                    }
                    .navigationTitle("Новая заметка")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Отмена") {
                                draftBody = ""
                                draftTitle = ""
                                isPresentingAdd = false
                            }
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Сохранить") {
                                viewModel.createNote(title: draftTitle, text: draftBody)
                                draftBody = ""
                                draftTitle = ""
                                isPresentingAdd.toggle()
                            }
                            .disabled(draftTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && draftBody.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                        }
                    }
                }
            }
            .navigationDestination(for: Note.self) { note in
                if let index = viewModel.notes.firstIndex(of: note) {
                    NoteDetailsView(viewModel: Assembly.createDetailsViewModel(note: viewModel.notes[index]))
                } else {
                    Text("Заметка не найдена")
                }
            }
        }
    }
}
