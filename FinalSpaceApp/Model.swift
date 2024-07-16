
import Foundation

// MARK: - Character
struct Character: Decodable {
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

// MARK: - Episode
struct Episode: Decodable, Hashable {
    let id: Int
    let name, airDate, director: String
    let writer: Writer
    let characters: [String]
    let imgURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case director, writer, characters
        case imgURL = "img_url"
    }
}

enum Writer: String, Codable {
    case benBjelajac = "Ben Bjelajac"
    case olanRogers = "Olan Rogers"
    case yoriakiMochizuki = "Yoriaki Mochizuki"
}
