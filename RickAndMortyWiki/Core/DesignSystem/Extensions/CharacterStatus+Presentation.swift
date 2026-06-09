//
//  CharacterStatus+Presentation.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 08/06/2026.
//

import SwiftUI

extension CharacterStatus {
    var displayStyle: AnyShapeStyle {
        switch self {
        case .alive:
            AnyShapeStyle(Color.green)
        case .dead:
            AnyShapeStyle(Color.red)
        case .unknown:
            AnyShapeStyle(Color.gray)
        }
    }
    
    var displayTitle: String {
        switch self {
        case .alive:
            "character.status.alive"
        case .dead:
            "character.status.dead"
        case .unknown:
            "character.status.unknown"
        }
    }
}
