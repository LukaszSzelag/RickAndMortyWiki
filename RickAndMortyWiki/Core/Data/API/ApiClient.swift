//
//  ApiClient.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

protocol ApiClient: Sendable {
    var baseURL: URL { get }
    func request<E: ApiEndpoint>(endpoint: E) async throws -> E.Response
}
