//
//  ViewModel.swift
//  FinalSpaceApp
//
import Foundation

@MainActor
final class ViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var characters: [WelcomeElement] = []
    
    init() {
        fetchCharacters()
    }
    
    // MARK: - Metods
    func fetchCharacters() {
        Task {
            do {
                let characters = try await NetworkManager.shared.getNews(urlString: URLConstants.characterURL)
                self.characters = characters
            } catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
    }
}


