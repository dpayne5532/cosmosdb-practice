import Foundation
import Combine


@MainActor
final class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let baseURL = "http://localhost:7071/api"

    func loadNotes() async {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "\(baseURL)/notes") else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
    
    func createNote(title: String, body: String) async {
        guard let url = URL(string: "\(baseURL)/notes") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload = [
            "title": title,
            "body": body
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: payload)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let newNote = try JSONDecoder().decode(Note.self, from: data)
            notes.insert(newNote, at: 0)
        } catch {
            errorMessage = error.localizedDescription
        }
    }

}
