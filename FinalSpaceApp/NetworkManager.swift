//
//  NetworkManager.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 13.07.2024.
//

import Foundation

final class NetworkManager {
    
    // MARK: - Properties
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    
    // MARK: - Init
//    private init() {
//        decoder.dateDecodingStrategy = .iso8601
//    }
    
    // MARK: - Metods
    func getNews(urlString: String) async throws -> [WelcomeElement] {
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
        print("URL: \(url)")
        let (data, response) = try await URLSession.shared.data(from: url)
        print("Data: \(String(data: data, encoding: .utf8))")
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        do {
            return try decoder.decode([WelcomeElement].self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}


