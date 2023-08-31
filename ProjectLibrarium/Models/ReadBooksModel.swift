//
//  ReadBooksModel.swift
//  ProjectLibrarium
//
//  Created by ios5 on 29/08/2023.
//

import Foundation

struct ReadBooksModel: Codable {
    let bookInfo: SearchResults
    let bookDetails: OpenLibrarySingleWorkResponse
    var favorite: Bool = false
    var userReview: String?
}