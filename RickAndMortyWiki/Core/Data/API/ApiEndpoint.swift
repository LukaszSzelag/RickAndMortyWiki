//
//  ApiEndpoint.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

enum ApiEndpoint: Sendable {
    case characters(page: Int, name: String?)
    case charactersByIDs([Int])
    case episode(id: Int)
    
    var path: String {
        switch self {
        case .characters:
           return "character/"
        case .charactersByIDs(let ids):
            return "character/\(ids.map { String($0) }.joined(separator: ","))"
        case .episode(let id):
            return "episode/\(id)"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .characters(let page, name: let name):
            var items: [URLQueryItem] = []
            
            items.append(URLQueryItem(name: "page", value: "\(page)"))
            
            let trimmedName = name?.trimmingCharacters(in: .whitespacesAndNewlines)
            if let trimmedName, !trimmedName.isEmpty {
                items.append(URLQueryItem(name: "name", value: trimmedName))
            }
            
            return items
        case .charactersByIDs:
            return []
        case .episode:
            return []
        }
    }
}
