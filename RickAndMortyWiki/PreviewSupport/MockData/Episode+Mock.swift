//
//  Episode+Mock.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 05/06/2026.
//

import Foundation

#if DEBUG
extension Episode {
    static let mock = Episode(
        id: 1,
        name: "Pilot",
        airDate: "December 2, 2013",
        episodeCode: "S01E01",
        characterIDs: [1, 2, 3]
    )
}
#endif
