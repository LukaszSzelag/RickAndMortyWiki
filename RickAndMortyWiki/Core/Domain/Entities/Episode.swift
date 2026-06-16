//
//  Episode.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct Episode: Identifiable, Equatable, Sendable {
    let id: Int
    let name: String
    let airDate: String
    let episodeCode: String
    let characterURLs: [URL]
}
