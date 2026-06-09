//
//  Logo.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 08/06/2026.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        Image("RIckAndMortyWikiLogo")
            .resizable()
            .scaledToFit()
            .frame(width: 44, height: 44)
    }
}

#Preview {
    Logo()
}
