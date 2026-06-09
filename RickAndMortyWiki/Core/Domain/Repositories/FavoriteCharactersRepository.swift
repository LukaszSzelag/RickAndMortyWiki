//
//  FavoriteCharactersRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 08/06/2026.
//

import Foundation

protocol FavoriteCharactersRepository: Sendable {
    func favoriteCharacterIDs() async -> Set<Int>
    func isCharacterFavorite(id: Int) async -> Bool
    func addToFavorites(id: Int) async
    func removeFromFavorites(id: Int) async
    func toggleIfFavorite(id: Int) async
}
