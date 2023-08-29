//
//  ClientFactory.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 28/08/23.
//

import Foundation

enum ClientType {
    case projectClient
}

enum ClientFactory {
    static func create(_ type: ClientType = .projectClient) -> ClientProtocol {
        switch type {
        case .projectClient:
            return Client()
        }
    }
}
