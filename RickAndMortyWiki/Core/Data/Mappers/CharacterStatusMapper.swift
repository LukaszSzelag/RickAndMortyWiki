//
//  CharacterStatusMapper.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

enum CharacterStatusMapper {
    static func map(_ value: String) -> CharacterStatus {
        switch value.lowercased() {
        case "alive": return .alive
        case "dead": return .dead
        default: return .unknown
        }
    }
}
