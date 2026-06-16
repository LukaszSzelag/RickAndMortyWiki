//
//  ApiResource.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 16/06/2026.
//

import Foundation

protocol ApiResource: Decodable, Sendable {
    associatedtype Filter: RawRepresentable & CaseIterable & Sendable & Hashable where Filter.RawValue == String
    
    static var endpointType: ApiEndpointType { get }
}
