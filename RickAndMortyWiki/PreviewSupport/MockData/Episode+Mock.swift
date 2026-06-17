//
//  Episode+Mock.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 05/06/2026.
//

import Foundation

#if DEBUG
extension Episode {
    static let mockEp1 = Episode(
        id: 1,
        name: "Pilot",
        airDate: "December 2, 2013",
        episodeCode: "S01E01",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/35")!,
            URL(string: "https://rickandmortyapi.com/api/character/38")!,
            URL(string: "https://rickandmortyapi.com/api/character/62")!,
            URL(string: "https://rickandmortyapi.com/api/character/92")!
        ]
    )
    
    static let mockEp2 = Episode(
        id: 2,
        name: "Lawnmower Dog",
        airDate: "December 9, 2013",
        episodeCode: "S01E02",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/38")!,
            URL(string: "https://rickandmortyapi.com/api/character/46")!,
            URL(string: "https://rickandmortyapi.com/api/character/63")!,
            URL(string: "https://rickandmortyapi.com/api/character/80")!
        ]
    )
    
    static let mockEp3 = Episode(
        id: 3,
        name: "Anatomy Park",
        airDate: "December 16, 2013",
        episodeCode: "S01E03",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/12")!,
            URL(string: "https://rickandmortyapi.com/api/character/17")!,
            URL(string: "https://rickandmortyapi.com/api/character/38")!,
            URL(string: "https://rickandmortyapi.com/api/character/45")!
        ]
    )
    
    static let mockEp4 = Episode(
        id: 4,
        name: "M. Night Shaym-Aliens!",
        airDate: "January 13, 2014",
        episodeCode: "S01E04",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/38")!,
            URL(string: "https://rickandmortyapi.com/api/character/87")!,
            URL(string: "https://rickandmortyapi.com/api/character/175")!,
            URL(string: "https://rickandmortyapi.com/api/character/179")!
        ]
    )
    
    static let mockEp5 = Episode(
        id: 5,
        name: "Meeseeks and Destroy",
        airDate: "January 20, 2014",
        episodeCode: "S01E05",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/38")!,
            URL(string: "https://rickandmortyapi.com/api/character/41")!,
            URL(string: "https://rickandmortyapi.com/api/character/89")!,
            URL(string: "https://rickandmortyapi.com/api/character/116")!
        ]
    )
    
    static let mockEp6 = Episode(
        id: 6,
        name: "Rick Potion #9",
        airDate: "January 27, 2014",
        episodeCode: "S01E06",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/38")!
        ]
    )
    
    static let mockEp7 = Episode(
        id: 7,
        name: "Raising Gazorpazorp",
        airDate: "March 10, 2014",
        episodeCode: "S01E07",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/59")!
        ]
    )
    
    static let mockEp8 = Episode(
        id: 8,
        name: "Rixty Minutes",
        airDate: "March 17, 2014",
        episodeCode: "S01E08",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/20")!
        ]
    )
    
    static let mockEp9 = Episode(
        id: 9,
        name: "Something Ricked This Way Comes",
        airDate: "March 24, 2014",
        episodeCode: "S01E09",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/88")!
        ]
    )
    
    static let mockEp10 = Episode(
        id: 10,
        name: "Close Rick-counters of the Rick Kind",
        airDate: "April 7, 2014",
        episodeCode: "S01E10",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/7")!
        ]
    )
    
    static let mockEp11 = Episode(
        id: 11,
        name: "Ricksy Business",
        airDate: "April 14, 2014",
        episodeCode: "S01E11",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/7")!
        ]
    )
    
    static let mockEp12 = Episode(
        id: 12,
        name: "A Rickle in Time",
        airDate: "July 26, 2015",
        episodeCode: "S02E01",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/11")!
        ]
    )
    
    static let mockEp13 = Episode(
        id: 13,
        name: "Mortynight Run",
        airDate: "August 2, 2015",
        episodeCode: "S02E02",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/23")!,
            URL(string: "https://rickandmortyapi.com/api/character/28")!,
            URL(string: "https://rickandmortyapi.com/api/character/34")!
        ]
    )
    
    static let mockEp14 = Episode(
        id: 14,
        name: "Auto Erotic Assimilation",
        airDate: "August 9, 2015",
        episodeCode: "S02E03",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/36")!
        ]
    )
    
    static let mockEp15 = Episode(
        id: 15,
        name: "Total Rickall",
        airDate: "August 16, 2015",
        episodeCode: "S02E04",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/16")!
        ]
    )
    
    static let mockEp16 = Episode(
        id: 16,
        name: "Get Schwifty",
        airDate: "August 23, 2015",
        episodeCode: "S02E05",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/24")!
        ]
    )
    
    static let mockEp17 = Episode(
        id: 17,
        name: "The Ricks Must Be Crazy",
        airDate: "August 30, 2015",
        episodeCode: "S02E06",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/28")!,
            URL(string: "https://rickandmortyapi.com/api/character/34")!,
            URL(string: "https://rickandmortyapi.com/api/character/65")!,
            URL(string: "https://rickandmortyapi.com/api/character/129")!
        ]
    )
    
    static let mockEp18 = Episode(
        id: 18,
        name: "Big Trouble in Little Sanchez",
        airDate: "September 13, 2015",
        episodeCode: "S02E07",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/40")!
        ]
    )
    
    static let mockEp19 = Episode(
        id: 19,
        name: "Interdimensional Cable 2: Tempting Fate",
        airDate: "September 20, 2015",
        episodeCode: "S02E08",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/23")!
        ]
    )
    
    static let mockEp20 = Episode(
        id: 20,
        name: "Look Who's Purging Now",
        airDate: "September 27, 2015",
        episodeCode: "S02E09",
        characterURLs: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
            URL(string: "https://rickandmortyapi.com/api/character/3")!,
            URL(string: "https://rickandmortyapi.com/api/character/4")!,
            URL(string: "https://rickandmortyapi.com/api/character/5")!,
            URL(string: "https://rickandmortyapi.com/api/character/26")!
        ]
    )
    
    static let mockEpisodes: [Episode] = [
        mockEp1,
        mockEp2,
        mockEp3,
        mockEp4,
        mockEp5,
        mockEp6,
        mockEp7,
        mockEp8,
        mockEp9,
        mockEp10,
        mockEp11,
        mockEp12,
        mockEp13,
        mockEp14,
        mockEp15,
        mockEp16,
        mockEp17,
        mockEp18,
        mockEp19,
        mockEp20
    ]
}
#endif
