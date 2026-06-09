//
//  CharactersListRowView.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 07/06/2026.
//

import Foundation
import SwiftUI

struct CharactersListRowView: View {
    private let character: Character
    private let isFavorite: Bool
    
    init(character: Character, isFavorite: Bool = false) {
        self.character = character
        self.isFavorite = isFavorite
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            if isFavorite {
                Image(systemName: "heart.circle.fill")
                    .font(.headline)
                    .foregroundStyle(.red)
            }
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                HStack(spacing: 4) {
                    Text(String(character.episodeIDs.count))
                    Text("common.appearences")
                }
                .font(.caption)
                .foregroundStyle(Color.secondary)
            }
        }
    }
}

#Preview("CharactersListRowView - Favorite") {
    let character = Character.mockRick
    CharactersListRowView(character: character, isFavorite: true)
}

#Preview("CharactersListRowView - Not Favorite") {
    let character = Character.mockRick
    CharactersListRowView(character: character, isFavorite: false)
}

