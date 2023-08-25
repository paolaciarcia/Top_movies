//
//  MovieModel.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

struct MovieModel: Equatable {
    let section: String?
    let items: [Items]
}

struct Items: Equatable {
    var image: UIImage?
}
