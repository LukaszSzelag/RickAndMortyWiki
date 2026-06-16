//
//  GetSingleItem.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 16/06/2026.
//

import Foundation

struct GetSingleItem<Item: ApiResource>: ApiEndpoint {
    typealias Response = Item
    
    var endpointType: ApiEndpointType {
        Item.endpointType
    }
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var path: String {
        "\(endpointType.rawValue)/\(id)"
    }
    
}
