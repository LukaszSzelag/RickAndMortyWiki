//
//  ApiError.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

enum ApiError: Error, Equatable, LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingFailure
    
    var errorDescription: String? {
        switch self {
        case .invalidURL : "Invalid URL"
        case .invalidResponse: "Invalid Response"
        case .invalidStatusCode(let code): "Invalid Status Code: \(code)"
        case .decodingFailure: "Decoding Failure"
        }
    }
}
