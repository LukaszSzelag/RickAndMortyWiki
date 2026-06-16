//
//  GetItemsPage.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 16/06/2026.
//

import Foundation

struct GetItemsPage<Item: ApiResource>: ApiEndpoint {
    typealias Response = PageResponseDTO<Item>
    
    let page: Int
    let filters: [Item.Filter : String]
    
    let path: String = Item.endpointType.rawValue
    var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = [URLQueryItem(name: "page", value: String(page))]
        for filter in filters {
            items.append(URLQueryItem(name: filter.key.rawValue, value: filter.value))
        }
        
        return items
    }
    
    init(page: Int, filters: [Item.Filter : String]) {
        self.page = page
        self.filters = filters
    }
}
