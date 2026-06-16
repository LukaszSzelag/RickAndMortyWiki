//
//  ApiEndpoint.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

protocol ApiEndpoint: Sendable {
    associatedtype Response: Decodable & Sendable
    
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension ApiEndpoint {
    var queryItems: [URLQueryItem] { [] }
}
