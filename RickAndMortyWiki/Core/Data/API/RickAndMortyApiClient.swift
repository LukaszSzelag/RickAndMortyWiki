//
//  URLSessionApiClient.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct RickAndMortyApiClient: ApiClient {
    private let baseURL: URL
    private let session: URLSession
    private let decoder: JSONDecoder
     
    init(
        baseURL: URL = URL(string: "https://rickandmortyapi.com/api")!,
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.baseURL = baseURL
        self.session = session
        self.decoder = decoder
    }
    
    func request<T: Decodable & Sendable>(_ endpoint: ApiEndpoint) async throws -> T {
        let url = try makeURL(for: endpoint)
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw ApiError.invalidStatusCode(httpResponse.statusCode)
        }
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            print(error)
            throw ApiError.decodingFailure
        }
    }
    
    private func makeURL(for endpoint: ApiEndpoint) throws -> URL {
        var components = URLComponents(
            url: baseURL.appending(path: endpoint.path),
            resolvingAgainstBaseURL: false
        )
        
        if !endpoint.queryItems.isEmpty {
            components?.queryItems = endpoint.queryItems
        }
        
        guard let url = components?.url else {
            throw ApiError.invalidURL
        }
        
        return url
    }
}
