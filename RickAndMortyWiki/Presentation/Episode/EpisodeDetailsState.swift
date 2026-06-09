//
//  EpisodeDetailsState.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 07/06/2026.
//

import Foundation

enum EpisodeDetailsState: Equatable {
    case idle
    case loading
    case loaded(Episode, [Character])
    case error(String)
}
