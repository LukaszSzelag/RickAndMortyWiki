//
//  CharacterImage.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 18/06/2026.
//

import SwiftUI
import NukeUI

struct CharacterImage: View {
    let character: Character
    let size: CGFloat
    
    var body: some View {
        LazyImage(source: character.imageURL) { state in
            if let image = state.image {
                image
            } else if state.error != nil {
                Image(systemName: "person")
            }
        }
        .frame(width: size, height: size)
        .background(.secondaryBackground)
    }
}

#Preview {
    CharacterImage(character: .mockAlexander, size: 120)
}
