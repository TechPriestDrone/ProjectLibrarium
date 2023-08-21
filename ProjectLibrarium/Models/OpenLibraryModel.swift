//
//  OpenLibraryModel.swift
//  ProjectLibrarium
//
//  Created by ios5 on 21/08/2023.
//

import Foundation


struct OpenLibraryResponse: Decodable {
    let docs: [SearchResults]
}

struct SearchResults: Decodable{
    let key: String
    let title: String
    let author_key: [String]?
    let author_name: [String]?
    let id_amazon: [String]?
    let id_goodreads: [String]?
    let ratings_average: Double?
}
