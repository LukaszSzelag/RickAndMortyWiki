//
//  CharacterGenderMapper.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

enum CharacterGenderMapper {
    static func map(_ value: String) -> CharacterGender {
        switch value.lowercased() {
        case "male": return .male
        case "female": return .female
        case "genderless": return .genderless
        default: return .unknown
        }
    }
}
