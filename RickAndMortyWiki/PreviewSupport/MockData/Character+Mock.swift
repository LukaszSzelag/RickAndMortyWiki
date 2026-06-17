//
//  Character+Mock.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 05/06/2026.
//

import Foundation

#if DEBUG
extension Character {
    static let mockRick = Character(
        id: 1,
        name: "Rick Sanchez",
        status: .alive,
        species: "Human",
        type: "",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "Earth (C-137)",
            url: URL(string: "https://rickandmortyapi.com/api/location/1")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Citadel of Ricks",
            url: URL(string: "https://rickandmortyapi.com/api/location/3")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/1")!,
            URL(string: "https://rickandmortyapi.com/api/episode/2")!,
            URL(string: "https://rickandmortyapi.com/api/episode/3")!,
            URL(string: "https://rickandmortyapi.com/api/episode/4")!,
            URL(string: "https://rickandmortyapi.com/api/episode/5")!
        ]
    )
    
    static let mockMorty = Character(
        id: 2,
        name: "Morty Smith",
        status: .alive,
        species: "Human",
        type: "",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "unknown",
            url: URL(string: "https://rickandmortyapi.com/api")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Citadel of Ricks",
            url: URL(string: "https://rickandmortyapi.com/api/location/3")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/1")!,
            URL(string: "https://rickandmortyapi.com/api/episode/2")!,
            URL(string: "https://rickandmortyapi.com/api/episode/3")!,
            URL(string: "https://rickandmortyapi.com/api/episode/4")!,
            URL(string: "https://rickandmortyapi.com/api/episode/5")!
        ]
    )
    
    static let mockSummer = Character(
        id: 3,
        name: "Summer Smith",
        status: .alive,
        species: "Human",
        type: "",
        gender: .female,
        originLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/3.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/6")!,
            URL(string: "https://rickandmortyapi.com/api/episode/7")!,
            URL(string: "https://rickandmortyapi.com/api/episode/8")!,
            URL(string: "https://rickandmortyapi.com/api/episode/9")!,
            URL(string: "https://rickandmortyapi.com/api/episode/10")!
        ]
    )
    
    static let mockBeth = Character(
        id: 4,
        name: "Beth Smith",
        status: .alive,
        species: "Human",
        type: "",
        gender: .female,
        originLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/4.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/6")!,
            URL(string: "https://rickandmortyapi.com/api/episode/7")!,
            URL(string: "https://rickandmortyapi.com/api/episode/8")!,
            URL(string: "https://rickandmortyapi.com/api/episode/9")!,
            URL(string: "https://rickandmortyapi.com/api/episode/10")!
        ]
    )
    
    static let mockJerry = Character(
        id: 5,
        name: "Jerry Smith",
        status: .alive,
        species: "Human",
        type: "",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/5.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/6")!,
            URL(string: "https://rickandmortyapi.com/api/episode/7")!,
            URL(string: "https://rickandmortyapi.com/api/episode/8")!,
            URL(string: "https://rickandmortyapi.com/api/episode/9")!,
            URL(string: "https://rickandmortyapi.com/api/episode/10")!
        ]
    )
    
    static let mockAbadangoClusterPrincess = Character(
        id: 6,
        name: "Abadango Cluster Princess",
        status: .alive,
        species: "Alien",
        type: "",
        gender: .female,
        originLocationReference: CharacterLocationReference(
            name: "Abadango",
            url: URL(string: "https://rickandmortyapi.com/api/location/2")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Abadango",
            url: URL(string: "https://rickandmortyapi.com/api/location/2")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/6.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/27")!
        ]
    )
    
    static let mockAbradolfLincler = Character(
        id: 7,
        name: "Abradolf Lincler",
        status: .unknown,
        species: "Human",
        type: "Genetic experiment",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Testicle Monster Dimension",
            url: URL(string: "https://rickandmortyapi.com/api/location/21")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/7.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/10")!,
            URL(string: "https://rickandmortyapi.com/api/episode/11")!
        ]
    )
    
    static let mockAdjudicatorRick = Character(
        id: 8,
        name: "Adjudicator Rick",
        status: .dead,
        species: "Human",
        type: "",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "unknown",
            url: URL(string: "https://rickandmortyapi.com/api")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Citadel of Ricks",
            url: URL(string: "https://rickandmortyapi.com/api/location/3")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/8.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/28")!
        ]
    )
    
    static let mockAgencyDirector = Character(
        id: 9,
        name: "Agency Director",
        status: .dead,
        species: "Human",
        type: "",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/9.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/24")!
        ]
    )
    
    static let mockAlanRails = Character(
        id: 10,
        name: "Alan Rails",
        status: .dead,
        species: "Human",
        type: "Superhuman (Ghost trains summoner)",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "unknown",
            url: URL(string: "https://rickandmortyapi.com/api")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Worldender's lair",
            url: URL(string: "https://rickandmortyapi.com/api/location/4")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/10.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/25")!
        ]
    )
    
    static let mockAlbertEinstein = Character(
        id: 11,
        name: "Albert Einstein",
        status: .dead,
        species: "Human",
        type: "",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "Earth (C-137)",
            url: URL(string: "https://rickandmortyapi.com/api/location/1")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/11.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/12")!
        ]
    )
    
    static let mockAlexander = Character(
        id: 12,
        name: "Alexander",
        status: .dead,
        species: "Human",
        type: "",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "Earth (C-137)",
            url: URL(string: "https://rickandmortyapi.com/api/location/1")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Anatomy Park",
            url: URL(string: "https://rickandmortyapi.com/api/location/5")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/12.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/3")!
        ]
    )
    
    static let mockAlienGoogah = Character(
        id: 13,
        name: "Alien Googah",
        status: .unknown,
        species: "Alien",
        type: "",
        gender: .unknown,
        originLocationReference: CharacterLocationReference(
            name: "unknown",
            url: URL(string: "https://rickandmortyapi.com/api")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/13.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/31")!
        ]
    )
    
    static let mockAlienMorty = Character(
        id: 14,
        name: "Alien Morty",
        status: .unknown,
        species: "Alien",
        type: "",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "unknown",
            url: URL(string: "https://rickandmortyapi.com/api")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Citadel of Ricks",
            url: URL(string: "https://rickandmortyapi.com/api/location/3")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/14.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/10")!
        ]
    )
    
    static let mockAlienRick = Character(
        id: 15,
        name: "Alien Rick",
        status: .unknown,
        species: "Alien",
        type: "",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "unknown",
            url: URL(string: "https://rickandmortyapi.com/api")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Citadel of Ricks",
            url: URL(string: "https://rickandmortyapi.com/api/location/3")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/15.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/10")!
        ]
    )
    
    static let mockAmishCyborg = Character(
        id: 16,
        name: "Amish Cyborg",
        status: .dead,
        species: "Alien",
        type: "Parasite",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "unknown",
            url: URL(string: "https://rickandmortyapi.com/api")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Earth (Replacement Dimension)",
            url: URL(string: "https://rickandmortyapi.com/api/location/20")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/16.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/15")!
        ]
    )
    
    static let mockAnnie = Character(
        id: 17,
        name: "Annie",
        status: .alive,
        species: "Human",
        type: "",
        gender: .female,
        originLocationReference: CharacterLocationReference(
            name: "Earth (C-137)",
            url: URL(string: "https://rickandmortyapi.com/api/location/1")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Anatomy Park",
            url: URL(string: "https://rickandmortyapi.com/api/location/5")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/17.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/3")!
        ]
    )
    
    static let mockAntennaMorty = Character(
        id: 18,
        name: "Antenna Morty",
        status: .alive,
        species: "Human",
        type: "Human with antennae",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "unknown",
            url: URL(string: "https://rickandmortyapi.com/api")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Citadel of Ricks",
            url: URL(string: "https://rickandmortyapi.com/api/location/3")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/18.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/10")!,
            URL(string: "https://rickandmortyapi.com/api/episode/28")!
        ]
    )
    
    static let mockAntennaRick = Character(
        id: 19,
        name: "Antenna Rick",
        status: .unknown,
        species: "Human",
        type: "Human with antennae",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "unknown",
            url: URL(string: "https://rickandmortyapi.com/api")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "unknown",
            url: URL(string: "https://rickandmortyapi.com/api")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/19.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/10")!
        ]
    )
    
    static let mockAntsInMyEyesJohnson = Character(
        id: 20,
        name: "Ants in my Eyes Johnson",
        status: .unknown,
        species: "Human",
        type: "Human with ants in his eyes",
        gender: .male,
        originLocationReference: CharacterLocationReference(
            name: "unknown",
            url: URL(string: "https://rickandmortyapi.com/api")!
        ),
        lastSeenLocationReference: CharacterLocationReference(
            name: "Interdimensional Cable",
            url: URL(string: "https://rickandmortyapi.com/api/location/6")!
        ),
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/20.jpeg")!,
        episodeURLs: [
            URL(string: "https://rickandmortyapi.com/api/episode/8")!
        ]
    )
    
    static let mocks: [Character] = [
        mockRick,
        mockMorty,
        mockSummer,
        mockBeth,
        mockJerry,
        mockAbadangoClusterPrincess,
        mockAbradolfLincler,
        mockAdjudicatorRick,
        mockAgencyDirector,
        mockAlanRails,
        mockAlbertEinstein,
        mockAlexander,
        mockAlienGoogah,
        mockAlienMorty,
        mockAlienRick,
        mockAmishCyborg,
        mockAnnie,
        mockAntennaMorty,
        mockAntennaRick,
        mockAntsInMyEyesJohnson
    ]
}
#endif
