//
//  NetworkError.swift
//  FinalSpaceApp
//
//  Created by Алексей Попов on 13.07.2024.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidResponse = "Invalid response from the server"
    case invalidData = "The data received from the server is invalid"
}
