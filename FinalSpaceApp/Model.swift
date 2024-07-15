
import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Decodable {
    let id: Int
    let name, status: String
    let species: String?
    let gender, hair: String
    let alias: [String]?
    let origin: String
    let abilities: [String]
    let imgURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name, status, species, gender, hair, alias, origin, abilities
        case imgURL = "img_url"
    }
}
