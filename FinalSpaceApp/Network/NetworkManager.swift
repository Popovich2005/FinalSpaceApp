
import Foundation

final class NetworkManager {
    
    // MARK: - Properties
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    
    
    // MARK: - Metods
    
    func getData<T: Decodable>(urlString: String) async throws -> T {
            guard let urlStr = URL(string: urlString) else { throw NetworkError.invalidURL }
        
            let (data, response) = try await URLSession.shared.data(from: urlStr)
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


