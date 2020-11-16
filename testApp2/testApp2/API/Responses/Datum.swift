import Foundation

// MARK: - Datum

extension Response {
    struct Datum: Codable {
        let id: Int
        let name, datumDescription: String
        let image: String
        let price, discountAmount: String
        let status: Bool
        let categories: [Category]

        enum CodingKeys: String, CodingKey {
            case id, name
            case datumDescription = "description"
            case image, price
            case discountAmount = "discount_amount"
            case status, categories
        }
    }
}
