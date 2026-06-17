//
//  FavoritesRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 17/06/2026.
//

import Foundation

protocol FavoritesRepository: Sendable {
    func getFavoriteIDs<Entity: Favoritable>(for entityType: Entity.Type) async -> Set<Int>
    func isFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async -> Bool
    func addFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async
    func removeFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async
    func toggleFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async
}
