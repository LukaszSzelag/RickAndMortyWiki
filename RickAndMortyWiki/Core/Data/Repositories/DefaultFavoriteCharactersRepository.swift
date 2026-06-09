//
//  DefaultFavoriteCharacterRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 08/06/2026.
//

import Foundation

actor DefaultFavoriteCharactersRepository: FavoriteCharactersRepository {
    private let key = "favoriteCharacterIDs"
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func favoriteCharacterIDs() async -> Set<Int> {
        readIDsFromUserDefaults()
    }
    
    func isCharacterFavorite(id: Int) async -> Bool {
        return readIDsFromUserDefaults().contains(id)
    }
    
    func addToFavorites(id: Int) async {
        var ids = readIDsFromUserDefaults()
        ids.insert(id)
        saveToUserDefaults(ids)
    }
    
    func removeFromFavorites(id: Int) async {
        var ids = readIDsFromUserDefaults()
        ids.remove(id)
        saveToUserDefaults(ids)
    }
    
    func toggleIfFavorite(id: Int) async {
        var ids = readIDsFromUserDefaults()
        if ids.contains(id) {
            ids.remove(id)
        } else {
            ids.insert(id)
        }
        saveToUserDefaults(ids)
    }
    
    private func readIDsFromUserDefaults() -> Set<Int> {
        let ids = userDefaults.array(forKey: key) as? [Int] ?? []
        return Set(ids)
    }
    
    private func saveToUserDefaults(_ ids: Set<Int>) {
        userDefaults.set(Array(ids), forKey: key)
    }
}
