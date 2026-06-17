//
//  DefaultFavoriteCharacterRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 08/06/2026.
//

import Foundation

actor DefaultFavoritesRepository: FavoritesRepository {
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func getFavoriteIDs<Entity: Favoritable>(for entityType: Entity.Type) async -> Set<Int> {
        let ids = userDefaults.array(forKey: Entity.favoritesKey) as? [Int]
        return Set(ids ?? [])
    }
    
    func isFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async -> Bool {
        let ids = await getFavoriteIDs(for: entityType)
        return ids.contains(id)
    }
    
    func addFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async {
        var ids = await getFavoriteIDs(for: entityType)
        ids.insert(id)
        save(ids, for: entityType)
    }
    
    func removeFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async {
        var ids = await getFavoriteIDs(for: entityType)
        ids.remove(id)
        save(ids, for: entityType)
    }
    
    func toggleFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async {
        var ids = await getFavoriteIDs(for: entityType)
        if ids.contains(id) {
            ids.remove(id)
        } else {
            ids.insert(id)
        }
        save(ids, for: entityType)
    }
    
    private func save<Entity: Favoritable>(_ ids: Set<Int>, for entityType: Entity.Type) {
        userDefaults.set(Array(ids), forKey: Entity.favoritesKey)
    }
}
