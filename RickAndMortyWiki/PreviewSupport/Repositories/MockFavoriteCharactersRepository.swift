//
//  MockFavoriteCharactersRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 08/06/2026.
//

import Foundation

#if DEBUG
actor MockFavoriteCharactersRepository: FavoriteCharactersRepository {
    private var ids: Set<Int>
    
    init(ids: Set<Int>) {
        self.ids = ids
    }
    
    func favoriteCharacterIDs() async -> Set<Int> {
        ids
    }
    
    func isCharacterFavorite(id: Int) async -> Bool {
        ids.contains(id)
    }
    
    func addToFavorites(id: Int) async {
        ids.insert(id)
    }
    
    func removeFromFavorites(id: Int) async {
        ids.remove(id)
    }
    
    func toggleIfFavorite(id: Int) async {
        if ids.contains(id) {
            ids.remove(id)
        } else {
            ids.insert(id)
        }
    }
}
#endif
