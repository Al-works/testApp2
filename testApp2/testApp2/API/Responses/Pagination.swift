import Foundation

// MARK: - Pagination

extension Response {
    struct Pagination: Codable {
        let total, pages, page, limit: Int
    }
}
