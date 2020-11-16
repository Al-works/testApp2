import Foundation

// MARK: - Product

extension Response {
    struct Product: Codable {
        let code: Int
        let meta: Meta
        let data: [Datum]
    }
}
