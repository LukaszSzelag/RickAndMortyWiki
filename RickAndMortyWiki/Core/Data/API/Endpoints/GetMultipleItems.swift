//
//  GetMultipleItems.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 16/06/2026.
//

import Foundation

struct GetMultipleItems<Item: ApiResource>: ApiEndpoint {
    typealias Response = [Item]
    let ids: [Int]
    
    init(ids: [Int]) {
        self.ids = ids
    }
    
    var path: String {
        let stringEndpoint: String = ids.map { String($0) }.joined(separator: ",")
        return "\(Item.endpointType.rawValue)/\(stringEndpoint)"
    }
}
