//
//  ApiClient.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

protocol ApiClient: Sendable {
    func request<T: Decodable & Sendable>(_ endpoint: ApiEndpoint) async throws -> T
}
