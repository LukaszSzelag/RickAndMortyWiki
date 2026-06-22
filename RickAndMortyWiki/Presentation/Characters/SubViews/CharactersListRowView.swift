//
//  CharactersListRowView.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 18/06/2026.
//

import SwiftUI

struct CharactersListRowView: View {
    
    let character: Character
    let isFavorite: Bool
    
    init(character: Character, isFavorite: Bool = false) {
        self.character = character
        self.isFavorite = isFavorite
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            if isFavorite {
                Image(systemName: "heart.circle")
                    .foregroundStyle(.red)
            }
            characterLabel
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
        
    @ViewBuilder
    private var characterLabel: some View {
        VStack(alignment: .leading) {
            Text(character.name)
                .font(.headline)
            Text(character.species)
                .font(.caption)
        }
    }
}

#Preview("Character List Row") {
    ZStack {
        Color(#colorLiteral(red: 0.936044991, green: 0.9360449604, blue: 0.9360449314, alpha: 1)).ignoresSafeArea() // HSB 0, 0, 92
        CharactersListRowView(character: .mockBeth, isFavorite: true)
    }
}


