//
//  Location+Mock.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 17/06/2026.
//

import Foundation

#if DEBUG
extension Location {
    static let mockLoc1 = Location(
        id: 1,
        name: "Earth (C-137)",
        type: "Planet",
        dimension: "Dimension C-137",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/38")!,
            URL(string:"https://rickandmortyapi.com/api/character/45")!,
            URL(string:"https://rickandmortyapi.com/api/character/71")!,
            URL(string:"https://rickandmortyapi.com/api/character/82")!,
            URL(string:"https://rickandmortyapi.com/api/character/83")!
        ]
    )

    static let mockLoc2 = Location(
        id: 2,
        name: "Abadango",
        type: "Cluster",
        dimension: "unknown",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/6")!
        ]
    )

    static let mockLoc3 = Location(
        id: 3,
        name: "Citadel of Ricks",
        type: "Space station",
        dimension: "unknown",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/8")!,
            URL(string: "https://rickandmortyapi.com/api/character/14")!,
            URL(string: "https://rickandmortyapi.com/api/character/15")!,
            URL(string: "https://rickandmortyapi.com/api/character/18")!,
            URL(string: "https://rickandmortyapi.com/api/character/21")!
        ]
    )

    static let mockLoc4 = Location(
        id: 4,
        name: "Worldender's lair",
        type: "Planet",
        dimension: "unknown",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/10")!,
            URL(string: "https://rickandmortyapi.com/api/character/81")!,
            URL(string: "https://rickandmortyapi.com/api/character/208")!,
            URL(string: "https://rickandmortyapi.com/api/character/226")!,
            URL(string: "https://rickandmortyapi.com/api/character/340")!
        ]
    )

    static let mockLoc5 = Location(
        id: 5,
        name: "Anatomy Park",
        type: "Microverse",
        dimension: "Dimension C-137",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/12")!,
            URL(string: "https://rickandmortyapi.com/api/character/17")!,
            URL(string: "https://rickandmortyapi.com/api/character/96")!,
            URL(string: "https://rickandmortyapi.com/api/character/97")!,
            URL(string: "https://rickandmortyapi.com/api/character/98")!
        ]
    )

    static let mockLoc6 = Location(
        id: 6,
        name: "Interdimensional Cable",
        type: "TV",
        dimension: "unknown",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/20")!,
            URL(string: "https://rickandmortyapi.com/api/character/28")!,
            URL(string: "https://rickandmortyapi.com/api/character/29")!,
            URL(string: "https://rickandmortyapi.com/api/character/34")!,
            URL(string: "https://rickandmortyapi.com/api/character/49")!
        ]
    )

    static let mockLoc7 = Location(
        id: 7,
        name: "Immortality Field Resort",
        type: "Resort",
        dimension: "unknown",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/23")!,
            URL(string: "https://rickandmortyapi.com/api/character/204")!,
            URL(string: "https://rickandmortyapi.com/api/character/320")!
        ]
    )

    static let mockLoc8 = Location(
        id: 8,
        name: "Post-Apocalyptic Earth",
        type: "Planet",
        dimension: "Post-Apocalyptic Dimension",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/25")!,
            URL(string: "https://rickandmortyapi.com/api/character/52")!,
            URL(string: "https://rickandmortyapi.com/api/character/68")!,
            URL(string: "https://rickandmortyapi.com/api/character/110")!,
            URL(string: "https://rickandmortyapi.com/api/character/111")!
        ]
    )

    static let mockLoc9 = Location(
        id: 9,
        name: "Purge Planet",
        type: "Planet",
        dimension: "Replacement Dimension",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/26")!,
            URL(string: "https://rickandmortyapi.com/api/character/139")!,
            URL(string: "https://rickandmortyapi.com/api/character/202")!,
            URL(string: "https://rickandmortyapi.com/api/character/273")!
        ]
    )

    static let mockLoc10 = Location(
        id: 10,
        name: "Venzenulon 7",
        type: "Planet",
        dimension: "unknown",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/33")!
        ]
    )

    static let mockLoc11 = Location(
        id: 11,
        name: "Bepis 9",
        type: "Planet",
        dimension: "unknown",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/35")!
        ]
    )

    static let mockLoc12 = Location(
        id: 12,
        name: "Cronenberg Earth",
        type: "Planet",
        dimension: "Cronenberg Dimension",
        residents: []
    )

    static let mockLoc13 = Location(
        id: 13,
        name: "Nuptia 4",
        type: "Planet",
        dimension: "unknown",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/40")!,
            URL(string: "https://rickandmortyapi.com/api/character/55")!,
            URL(string: "https://rickandmortyapi.com/api/character/131")!,
            URL(string: "https://rickandmortyapi.com/api/character/132")!,
            URL(string: "https://rickandmortyapi.com/api/character/146")!
        ]
    )

    static let mockLoc14 = Location(
        id: 14,
        name: "Giant's Town",
        type: "Fantasy town",
        dimension: "Fantasy Dimension",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/89")!,
            URL(string: "https://rickandmortyapi.com/api/character/399")!,
            URL(string: "https://rickandmortyapi.com/api/character/400")!
        ]
    )

    static let mockLoc15 = Location(
        id: 15,
        name: "Bird World",
        type: "Planet",
        dimension: "unknown",
        residents: []
    )

    static let mockLoc16 = Location(
        id: 16,
        name: "St. Gloopy Noops Hospital",
        type: "Space station",
        dimension: "unknown",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/105")!,
            URL(string: "https://rickandmortyapi.com/api/character/263")!,
            URL(string: "https://rickandmortyapi.com/api/character/321")!,
            URL(string: "https://rickandmortyapi.com/api/character/383")!,
            URL(string: "https://rickandmortyapi.com/api/character/384")!
        ]
    )

    static let mockLoc17 = Location(
        id: 17,
        name: "Earth (5-126)",
        type: "Planet",
        dimension: "Dimension 5-126",
        residents: []
    )

    static let mockLoc18 = Location(
        id: 18,
        name: "Mr. Goldenfold's dream",
        type: "Dream",
        dimension: "Dimension C-137",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/63")!,
            URL(string: "https://rickandmortyapi.com/api/character/80")!
        ]
    )

    static let mockLoc19 = Location(
        id: 19,
        name: "Gromflom Prime",
        type: "Planet",
        dimension: "Replacement Dimension",
        residents: []
    )

    static let mockLoc20 = Location(
        id: 20,
        name: "Earth (Replacement Dimension)",
        type: "Planet",
        dimension: "Replacement Dimension",
        residents: [
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/9")!,
            URL(string: "https://rickandmortyapi.com/api/character/11")!
        ]
    )

    static let mockLocations: [Location] = [
        mockLoc1,
        mockLoc2,
        mockLoc3,
        mockLoc4,
        mockLoc5,
        mockLoc6,
        mockLoc7,
        mockLoc8,
        mockLoc9,
        mockLoc10,
        mockLoc11,
        mockLoc12,
        mockLoc13,
        mockLoc14,
        mockLoc15,
        mockLoc16,
        mockLoc17,
        mockLoc18,
        mockLoc19,
        mockLoc20
    ]
}
#endif

