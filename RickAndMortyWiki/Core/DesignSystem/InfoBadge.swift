//
//  InfoBadge.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 07/06/2026.
//

import SwiftUI

struct InfoBadge<S: ShapeStyle>: View {
    let text: String
    let style: S
    
    init(text: String, style: S) {
        self.text = text
        self.style = style
    }
    
    var body: some View {
        Text(LocalizedStringKey(text))
            .font(.footnote)
            .fontWeight(.bold)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(style, in: .capsule)
    }
}

#Preview {
    InfoBadge(text: "Ricky", style: .secondaryBackground)
}
