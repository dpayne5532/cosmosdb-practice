import SwiftUI

struct NewNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: NotesViewModel

    @State private var title = ""
    @State private var bodyText = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextEditor(text: $bodyText)
                    .frame(height: 200)
            }
            .navigationTitle("New Note")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        Task {
                            await viewModel.createNote(
                                title: title,
                                body: bodyText
                            )
                            dismiss()
                        }
                    }
                    .disabled(title.isEmpty || bodyText.isEmpty)
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
