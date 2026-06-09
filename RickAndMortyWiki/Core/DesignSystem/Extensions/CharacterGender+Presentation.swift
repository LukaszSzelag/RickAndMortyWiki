//
//  CharacterGender+Presentation.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 08/06/2026.
//

import SwiftUI
extension CharacterGender {
    var displayStyle: AnyShapeStyle {
        switch self {
        case .male:
            AnyShapeStyle(Color.genderMale)
        case .female:
            AnyShapeStyle(Color.genderFemale)
        case .genderless:
            AnyShapeStyle(LinearGradient(colors: [.genderMale, .genderFemale], startPoint: .topLeading, endPoint: .bottomTrailing))
        case .unknown:
            AnyShapeStyle(Color.gray)
        }
    }
    
    var displayTitle: String {
        switch self {
        case .male:
            "character.gender.male"
        case .female:
            "character.gender.female"
        case .genderless:
            "character.gender.genderless"
        case .unknown:
            "character.gender.unknown"
        }
    }
}
