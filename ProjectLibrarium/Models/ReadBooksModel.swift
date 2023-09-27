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

struct SortedByAuthort {
    let author: String
    var works: [ReadBooksModel]
    var nameForSort: String {
        var nameComponents = self.author.description.components(separatedBy: " ")
        let firstName = nameComponents.removeFirst()
        let lastName = nameComponents.joined(separator: " ")
        let nameToSort = "\(lastName) \(firstName)"
        return nameToSort
        
    }
}

struct SortedByAuthort2 {
    let author: [String]
    var works: [SearchResults]
}
