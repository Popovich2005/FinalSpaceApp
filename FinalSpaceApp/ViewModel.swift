
import Foundation

@MainActor
final class ViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var characters: [Character] = []
    @Published var episodes: [Episode] = []
    @Published var locations: [Location] = []
    @Published var charactersDict: [Int: Character] = [:]
    
    init() {
        fetchCharacters()
        fetchEpisodes()
        fetchLocations()
    }
    
    // MARK: - Metods
    func fetchCharacters() {
        Task {
            do {
                let characters: [Character] = try await NetworkManager.shared.getData(urlString: URLConstants.characterURL)
                self.charactersDict = Dictionary(uniqueKeysWithValues: characters.map { ($0.id, $0) })
                self.characters = characters
            } catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
    }
    
    func fetchEpisodes() {
        Task {
            do {
                let episodes: [Episode] = try await NetworkManager.shared.getData(urlString: URLConstants.episodeURL)
                self.episodes = episodes
            } catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
    }
    
    func fetchLocations() {
        Task {
            do {
                let locations: [Location] = try await NetworkManager.shared.getData(urlString: URLConstants.locationURL)
                self.locations = locations
            } catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
    }
}

