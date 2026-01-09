import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NotesViewModel()
    @State private var showingNewNote = false

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showingNewNote = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
        }
        .sheet(isPresented: $showingNewNote) {
            NewNoteView(viewModel: viewModel)
        }
        .task {
            await viewModel.loadNotes()
        }
    }

    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            ProgressView()
        } else if let error = viewModel.errorMessage {
            Text(error)
                .foregroundColor(.red)
        } else {
            List(viewModel.notes) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Text(note.title)
                        .font(.headline)

                    Text(note.body)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
