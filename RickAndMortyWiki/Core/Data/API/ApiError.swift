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
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case tooManyRequests
    case serverError(statusCode: Int)
    case invalidStatusCode(Int)
    case decodingFailure
    
    var errorDescription: String? {
        switch self {
        case .invalidURL : "api.error.invalid_url"
        case .invalidResponse: "api.error.invalid_response"
        case .badRequest: "api.error.bad_request"
        case .unauthorized: "api.error.unauthorized_access"
        case .forbidden: "api.error.access_forbidden"
        case .notFound: "api.error.resource_not_found"
        case .tooManyRequests: "api.error.too_many_requests"
        case .serverError(let statusCode): "api.error.server_error \(statusCode)."
        case .invalidStatusCode(let code): "api.error.unexpected_status_code \(code)."
        case .decodingFailure: "api.error.decoding_failure"
        }
    }
}

extension ApiError {
    static func fromCode(_ code: Int) -> ApiError {
        switch code {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 429: return .tooManyRequests
        case 500...599: return .serverError(statusCode: code)
        default : return .invalidStatusCode(code)
        }
    }
}
