
import Foundation

@MainActor
final class ViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var characters: [Character] = []
    @Published var episodes: [Episode] = []
    
    init() {
        fetchCharacters()
        fetchEpisodes()
    }
    
    // MARK: - Metods
    func fetchCharacters() {
        Task {
            do {
                let characters: [Character] = try await NetworkManager.shared.getData(urlString: URLConstants.characterURL)
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
}

