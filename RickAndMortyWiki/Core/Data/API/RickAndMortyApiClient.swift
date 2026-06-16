//
//  URLSessionApiClient.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct RickAndMortyApiClient: ApiClient {
    let baseURL: URL = URL(string: "https://rickandmortyapi.com/api")!
    private let decoder: JSONDecoder = JSONDecoder()
     
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<E: ApiEndpoint>(endpoint: E) async throws -> E.Response {
        let url = try makeURL(from: endpoint)
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.badRequest
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw ApiError.fromCode(httpResponse.statusCode)
        }
        
        do {
            return try decoder.decode(E.Response.self, from: data)
        } catch {
            throw ApiError.decodingFailure
        }
    }
    
    private func makeURL(from endpoint: any ApiEndpoint) throws -> URL {
        var components = URLComponents(url: baseURL.appending(path: endpoint.path), resolvingAgainstBaseURL: false)
        
        if !endpoint.queryItems.isEmpty {
            components?.queryItems = endpoint.queryItems
        }
        
        guard let url = components?.url else {
            throw ApiError.invalidURL
        }
        
        return url
    }
}
