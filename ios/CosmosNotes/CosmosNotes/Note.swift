import Foundation

struct Note: Identifiable, Codable {
    let id: String
    let title: String
    let body: String
    let createdAt: String
}
