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
        species: "Human",
        status: .alive,
        gender: .male,
        originName: "Earth (C-137)",
        locationName: "Citadel of Ricks",
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
        episodeIDs: [1, 2, 3, 4, 5]
    )

    static let mockMorty = Character(
        id: 2,
        name: "Morty Smith",
        species: "Human",
        status: .alive,
        gender: .male,
        originName: "Earth (C-137)",
        locationName: "Citadel of Ricks",
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!,
        episodeIDs: [1, 2, 3]
    )
    
    static let mockSummer = Character(
        id: 3,
        name: "Summer Smith",
        species: "Human",
        status: .alive,
        gender: .female,
        originName: "Earth (Replacement Dimension)",
        locationName: "Earth (Replacement Dimension)",
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/3.jpeg")!,
        episodeIDs: [6, 7, 8]
    )
    
    static let mockBirdperson = Character(
        id: 47,
        name: "Birdperson",
        species: "Bird-Person",
        status: .dead,
        gender: .genderless,
        originName: "Bird World",
        locationName: "Planet Squanch",
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/47.jpeg")!,
        episodeIDs: [11, 16]
    )
    
    static let mockCharacters: [Character] = [
        .mockRick,
        .mockMorty,
        .mockSummer,
        .mockBirdperson
    ]
    
    static let mockEpisodeCharacters: [Character] = [
        .mockRick,
        .mockMorty,
        .mockSummer
    ]
}
#endif
