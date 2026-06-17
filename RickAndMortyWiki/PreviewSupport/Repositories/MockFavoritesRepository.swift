//
//  MockFavoritesRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 17/06/2026.
//

import Foundation

#if DEBUG
actor MockFavoritesRepository: FavoritesRepository {
    private var ids: Set<Int>
    
    init(ids: Set<Int>) {
        self.ids = ids
    }
    
    func getFavoriteIDs<Entity: Favoritable>(for entityType: Entity.Type) async -> Set<Int> {
        return ids
    }
    
    func isFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async -> Bool {
        ids.contains(id)
    }
    
    func addFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async {
        ids.insert(id)
    }
    
    func removeFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async {
        ids.remove(id)
    }
    
    func toggleFavorite<Entity: Favoritable>(id: Int, for entityType: Entity.Type) async {
        if ids.contains(id) {
            ids.remove(id)
        } else {
            ids.insert(id)
        }
    }

    
}
#endif
