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
//    func getData(urlString: String) async throws -> [Character] {
//        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
////        print("URL: \(url)")
//        let (data, response) = try await URLSession.shared.data(from: url)
////        print("Data: \(String(data: data, encoding: .utf8))")
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw NetworkError.invalidResponse
//        }
//        do {
//            return try decoder.decode([Character].self, from: data)
//        } catch {
//            throw NetworkError.invalidData
//        }
//    }
    
    func getData<T: Decodable>(urlString: String) async throws -> T {
            guard let urlStr = URL(string: urlString) else { throw NetworkError.invalidURL }
        
    //        print("URL: \(url)")
            let (data, response) = try await URLSession.shared.data(from: urlStr)
    //        print("Data: \(String(data: data, encoding: .utf8))")
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                
                throw NetworkError.invalidResponse
            }
            do {
                return try decoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.invalidData
            }
        }
}


